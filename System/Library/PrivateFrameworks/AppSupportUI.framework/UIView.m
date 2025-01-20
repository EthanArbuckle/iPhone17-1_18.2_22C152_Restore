@interface UIView
- (double)_nui_compactAlignmentInsets;
- (double)effectiveMaximumLayoutContentSize;
- (double)effectiveMinimumLayoutContentSize;
- (nui_size_cache)contentLayoutSizeCache;
- (objc_object)containerViewInfoCreateIfNeeded:(objc_object *)a1;
@end

@implementation UIView

- (double)_nui_compactAlignmentInsets
{
  if (!a1) {
    return 0.0;
  }
  [a1 alignmentRectInsets];
  double v3 = v2;
  [a1 effectiveBaselineOffsetFromBottom];
  if ([a1 _hasFontInfoForVerticalBaselineSpacing])
  {
    uint64_t v4 = [a1 _fontInfoForBaselineSpacing];
    if (v4)
    {
      v5 = (void *)v4;
      [a1 effectiveFirstBaselineOffsetFromTop];
      if (v6 != 0.0)
      {
        double v7 = v6;
        [v5 capHeight];
        double v9 = v8;
        [a1 _currentScreenScale];
        BOOL v11 = v10 == 1.0;
        double v12 = round(v9 * v10) / v10;
        double v13 = round(v9);
        if (v11) {
          double v12 = v13;
        }
        return v7 - v12;
      }
    }
  }
  return v3;
}

- (objc_object)containerViewInfoCreateIfNeeded:(objc_object *)a1
{
  if (a1) {
    return (objc_object *)_NUIContainerViewInfoCreateIfNeeded(a1, a2);
  }
  return a1;
}

- (nui_size_cache)contentLayoutSizeCache
{
  if (result) {
    return &_NUIContainerViewInfoCreateIfNeeded((objc_object *)result, 1)->_sizeCache;
  }
  return result;
}

- (double)effectiveMinimumLayoutContentSize
{
  if (!a1) {
    return 0.0;
  }
  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 0);
  [(objc_object *)a1 effectiveAlignmentRectInsets];
  double v4 = v3;
  double v6 = v5;
  double width = IfNeeded->_minSize.width;
  double height = IfNeeded->_minSize.height;
  if (NUIContainerViewLengthIsDefault(width)) {
    double width = 0.0;
  }
  NUIContainerViewLengthIsDefault(height);
  double result = *MEMORY[0x1E4F1DB30];
  if (*MEMORY[0x1E4F1DB30] <= width - (v4 + v6)) {
    return width - (v4 + v6);
  }
  return result;
}

- (double)effectiveMaximumLayoutContentSize
{
  if (!a1) {
    return 0.0;
  }
  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 0);
  [(objc_object *)a1 effectiveAlignmentRectInsets];
  double v5 = IfNeeded->_maxSize.width - (v3 + v4);
  double result = *MEMORY[0x1E4F1DB30];
  if (*MEMORY[0x1E4F1DB30] <= v5) {
    return v5;
  }
  return result;
}

@end