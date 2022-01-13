// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Flutter code sample for Autocomplete

import 'package:flutter/material.dart';

class CustomAutoComplete extends StatelessWidget {
  final Widget child;
  final List<String> kOptions;
  final ValueChanged<String> onSelected;
  const CustomAutoComplete({
    Key? key,
    required this.child,
    required this.kOptions,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return kOptions.where(
          (String option) {
            return option.contains(
              textEditingValue.text.toLowerCase(),
            );
          },
        );
      },
      // optionsViewBuilder: (context, onSelected, options) {

      // },
      onSelected: (String selection) {
        onSelected.call(selection);
        debugPrint('You just selected $selection');
      },
    );
  }
}
