@interface UIView(NUIContainerView)
- (CGFloat)customAlignmentRectInsets;
- (CGFloat)effectiveLayoutSizeFittingSize:()NUIContainerView;
- (CGFloat)maximumLayoutSize;
- (CGFloat)minimumLayoutSize;
- (_NUIViewContainerViewInfo)setCustomAlignmentRectInsets:()NUIContainerView;
- (_NUIViewContainerViewInfo)setCustomBaselineOffsetFromBottom:()NUIContainerView;
- (_NUIViewContainerViewInfo)setCustomFirstBaselineOffsetFromTop:()NUIContainerView;
- (_NUIViewContainerViewInfo)setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:()NUIContainerView;
- (_NUIViewContainerViewInfo)setMaximumLayoutSize:()NUIContainerView;
- (_NUIViewContainerViewInfo)setMinimumLayoutSize:()NUIContainerView;
- (_NUIViewContainerViewInfo)setNeverCacheEffectiveLayoutSize:()NUIContainerView;
- (double)customBaselineOffsetFromBottom;
- (double)customFirstBaselineOffsetFromTop;
- (double)effectiveBaselineOffsetFromBottom;
- (double)effectiveFirstBaselineOffsetFromTop;
- (uint64_t)invalidatingIntrinsicContentSizeAlsoInvalidatesSuperview;
- (uint64_t)neverCacheEffectiveLayoutSize;
- (uint64_t)setLayoutSize:()NUIContainerView withContentPriority:;
- (uint64_t)setLayoutSize:()NUIContainerView withHorizontalContentPriority:verticalContentPriority:;
- (uint64_t)setUntransformedFrame:()NUIContainerView;
@end

@implementation UIView(NUIContainerView)

- (uint64_t)invalidatingIntrinsicContentSizeAlsoInvalidatesSuperview
{
  return (*(unsigned char *)&_NUIContainerViewInfoCreateIfNeeded(a1, 0)->_flags >> 2) & 1;
}

- (CGFloat)effectiveLayoutSizeFittingSize:()NUIContainerView
{
  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  char flags = (char)IfNeeded->_flags;
  p_sizeCache = &IfNeeded->_sizeCache;
  CGSize v26 = (CGSize)*MEMORY[0x1E4F1DB30];
  char v9 = flags;
  if ((flags & 1) == 0)
  {
    char v10 = [(objc_object *)a1 isLayoutSizeDependentOnPerpendicularAxis];
    v27.double width = a2;
    v27.double height = a3;
    if (nui_size_cache::find_size(p_sizeCache, v27, v10, &v26)) {
      return v26.width;
    }
    char v9 = (char)IfNeeded->_flags;
  }
  double width = IfNeeded->_maxSize.width;
  double height = IfNeeded->_maxSize.height;
  double v14 = IfNeeded->_minSize.width;
  double v13 = IfNeeded->_minSize.height;
  double v15 = 1.79769313e308;
  if (a2 == 0.0) {
    double v16 = 1.79769313e308;
  }
  else {
    double v16 = a2;
  }
  if (width >= v16) {
    double v17 = v16;
  }
  else {
    double v17 = IfNeeded->_maxSize.width;
  }
  if (a3 != 0.0) {
    double v15 = a3;
  }
  if (height >= v15) {
    double v18 = v15;
  }
  else {
    double v18 = IfNeeded->_maxSize.height;
  }
  *(unsigned char *)&IfNeeded->_char flags = v9 | 2;
  if (v14 != width || v13 != height)
  {
    -[objc_object calculateLayoutSizeFittingSize:](a1, "calculateLayoutSizeFittingSize:", v17, v18);
    if (v20 > v14) {
      double v14 = v20;
    }
    if (v21 > v13) {
      double v13 = v21;
    }
  }
  if (v17 >= v14) {
    CGFloat v22 = v14;
  }
  else {
    CGFloat v22 = v17;
  }
  if (v18 >= v13) {
    CGFloat v23 = v13;
  }
  else {
    CGFloat v23 = v18;
  }
  v26.double width = v22;
  v26.double height = v23;
  char v24 = (char)IfNeeded->_flags;
  if ((flags & 1) == 0 && (*(unsigned char *)&IfNeeded->_flags & 2) != 0)
  {
    v28.double width = a2;
    v28.double height = a3;
    nui_size_cache::insert_size(p_sizeCache, v28, *(CGSize *)&v22);
    char v24 = (char)IfNeeded->_flags;
  }
  *(unsigned char *)&IfNeeded->_char flags = v24 & 0xFD;
  return v26.width;
}

- (double)effectiveFirstBaselineOffsetFromTop
{
  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  double baseLineFromTop = IfNeeded->_baselines.baseLineFromTop;
  if (!NUIContainerViewLengthIsDefault(baseLineFromTop)) {
    return baseLineFromTop;
  }
  uint64_t v4 = [(objc_object *)a1 _nui_baselineViewType];
  if (v4 != 1)
  {
    uint64_t v7 = v4;
    [(objc_object *)a1 _currentScreenScale];
    double v9 = v8;
    if (!v7)
    {
      -[objc_object effectiveLayoutSizeFittingSize:](a1, "effectiveLayoutSizeFittingSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      -[objc_object _baselineOffsetsAtSize:](a1, "_baselineOffsetsAtSize:");
      double v11 = v10;
      [(objc_object *)a1 alignmentRectInsets];
      double v13 = v11 + v12;
LABEL_14:
      double v18 = round(v9 * v13) / v9;
      double v19 = round(v13);
      if (v9 == 1.0) {
        double baseLineFromTop = v19;
      }
      else {
        double baseLineFromTop = v18;
      }
      IfNeeded->_baselines.double baseLineFromTop = baseLineFromTop;
      return baseLineFromTop;
    }
LABEL_11:
    double v13 = 0.0;
    if ([(objc_object *)a1 _hasFontInfoForVerticalBaselineSpacing])
    {
      double v15 = (void *)[(objc_object *)a1 _fontInfoForBaselineSpacing];
      if (v15)
      {
        double v16 = v15;
        [v15 ascender];
        double v13 = v17;
        [v16 descender];
      }
    }
    goto LABEL_14;
  }
  v5 = (objc_object *)[(objc_object *)a1 viewForFirstBaselineLayout];
  if (!v5 || v5 == a1)
  {
    [(objc_object *)a1 _currentScreenScale];
    double v9 = v14;
    goto LABEL_11;
  }
  [(objc_object *)v5 effectiveFirstBaselineOffsetFromTop];
  return result;
}

- (uint64_t)setLayoutSize:()NUIContainerView withContentPriority:
{
  LODWORD(a6) = LODWORD(a5);
  return objc_msgSend(a1, "setLayoutSize:withHorizontalContentPriority:verticalContentPriority:", a3, a4, a5, a6);
}

- (_NUIViewContainerViewInfo)setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:()NUIContainerView
{
  double result = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  if (a3) {
    char v5 = 4;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)&result->_char flags = *(unsigned char *)&result->_flags & 0xFB | v5;
  return result;
}

- (uint64_t)setUntransformedFrame:()NUIContainerView
{
  double v10 = (void *)[a1 layer];
  double v11 = v10;
  memset(&v20[1], 0, sizeof(CATransform3D));
  if (v10) {
    [v10 transform];
  }
  v20[0] = v20[1];
  if (CATransform3DIsIdentity(v20)) {
    return objc_msgSend(a1, "setFrame:", a2, a3, a4, a5);
  }
  [v11 anchorPoint];
  double v14 = v13;
  double v16 = v15;
  v21.origin.x = a2;
  v21.origin.y = a3;
  v21.size.double width = a4;
  v21.size.double height = a5;
  double MinX = CGRectGetMinX(v21);
  v22.origin.x = a2;
  v22.origin.y = a3;
  v22.size.double width = a4;
  v22.size.double height = a5;
  double v18 = MinX + CGRectGetWidth(v22) * v14;
  v23.origin.x = a2;
  v23.origin.y = a3;
  v23.size.double width = a4;
  v23.size.double height = a5;
  double MinY = CGRectGetMinY(v23);
  v24.origin.x = a2;
  v24.origin.y = a3;
  v24.size.double width = a4;
  v24.size.double height = a5;
  objc_msgSend(a1, "setCenter:", v18, MinY + CGRectGetHeight(v24) * v16);
  [a1 bounds];
  return objc_msgSend(a1, "setBounds:");
}

- (double)effectiveBaselineOffsetFromBottom
{
  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  double baseLineFromBottom = IfNeeded->_baselines.baseLineFromBottom;
  if (!NUIContainerViewLengthIsDefault(baseLineFromBottom)) {
    return baseLineFromBottom;
  }
  uint64_t v4 = [(objc_object *)a1 _nui_baselineViewType];
  if (v4 != 1)
  {
    uint64_t v7 = v4;
    [(objc_object *)a1 _currentScreenScale];
    double v9 = v8;
    if (!v7)
    {
      -[objc_object effectiveLayoutSizeFittingSize:](a1, "effectiveLayoutSizeFittingSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      -[objc_object _baselineOffsetsAtSize:](a1, "_baselineOffsetsAtSize:");
      double v11 = v10;
      double v13 = v12;
      [(objc_object *)a1 alignmentRectInsets];
      double v15 = v11 + v14;
      double v17 = v13 + v16;
LABEL_15:
      double v23 = ceil(v9 * (v17 - (round(v9 * v15) / v9 - v15))) / v9;
      double v24 = ceil(v17 - (round(v15) - v15));
      if (v9 == 1.0) {
        double baseLineFromBottom = v24;
      }
      else {
        double baseLineFromBottom = v23;
      }
      IfNeeded->_baselines.double baseLineFromBottom = baseLineFromBottom;
      return baseLineFromBottom;
    }
LABEL_11:
    double v15 = 0.0;
    if ([(objc_object *)a1 _hasFontInfoForVerticalBaselineSpacing]&& (double v19 = (void *)[(objc_object *)a1 _fontInfoForBaselineSpacing]) != 0)
    {
      double v20 = v19;
      [v19 ascender];
      double v15 = v21;
      [v20 descender];
      double v17 = -v22;
    }
    else
    {
      double v17 = 0.0;
    }
    goto LABEL_15;
  }
  char v5 = (objc_object *)[(objc_object *)a1 viewForLastBaselineLayout];
  if (!v5 || v5 == a1)
  {
    [(objc_object *)a1 _currentScreenScale];
    double v9 = v18;
    goto LABEL_11;
  }
  [(objc_object *)v5 effectiveBaselineOffsetFromBottom];
  return result;
}

- (uint64_t)setLayoutSize:()NUIContainerView withHorizontalContentPriority:verticalContentPriority:
{
  objc_msgSend(a1, "setMinimumLayoutSize:", __PAIR64__(LODWORD(a5), LODWORD(a4)), *MEMORY[0x1E4F143B8]);
  uint64_t result = objc_msgSend(a1, "setMaximumLayoutSize:", a2, a3);
  uint64_t v10 = 0;
  char v11 = 1;
  do
  {
    char v12 = v11;
    float v13 = *((float *)&v15 + v10);
    if (v13 > -1.0)
    {
      LODWORD(v9) = *((_DWORD *)&v15 + v10);
      [a1 setContentHuggingPriority:v10 forAxis:v9];
      *(float *)&double v14 = v13;
      uint64_t result = [a1 setContentCompressionResistancePriority:v10 forAxis:v14];
    }
    char v11 = 0;
    uint64_t v10 = 1;
  }
  while ((v12 & 1) != 0);
  return result;
}

- (_NUIViewContainerViewInfo)setMinimumLayoutSize:()NUIContainerView
{
  double v4 = a2;
  if (NUIContainerViewLengthIsDefault(a2)) {
    double v4 = 0.0;
  }
  if (NUIContainerViewLengthIsDefault(a3)) {
    a3 = 0.0;
  }
  uint64_t result = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  if (result->_minSize.width != v4 || result->_minSize.height != a3)
  {
    result->_minSize.double width = v4;
    result->_minSize.double height = a3;
    return (_NUIViewContainerViewInfo *)[(objc_object *)a1 invalidateIntrinsicContentSize];
  }
  return result;
}

- (_NUIViewContainerViewInfo)setMaximumLayoutSize:()NUIContainerView
{
  double v4 = a2;
  if (NUIContainerViewLengthIsDefault(a2)) {
    double v4 = 10000.0;
  }
  if (NUIContainerViewLengthIsDefault(a3)) {
    a3 = 10000.0;
  }
  uint64_t result = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  if (result->_maxSize.width != v4 || result->_maxSize.height != a3)
  {
    result->_maxSize.double width = v4;
    result->_maxSize.double height = a3;
    return (_NUIViewContainerViewInfo *)[(objc_object *)a1 invalidateIntrinsicContentSize];
  }
  return result;
}

- (_NUIViewContainerViewInfo)setCustomFirstBaselineOffsetFromTop:()NUIContainerView
{
  uint64_t result = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  char flags = (char)result->_flags;
  if (result->_baselines.baseLineFromTop != a2 || (flags & 0x10) == 0)
  {
    result->_baselines.double baseLineFromTop = a2;
    *(unsigned char *)&result->_char flags = flags | 0x10;
    return (_NUIViewContainerViewInfo *)[(objc_object *)a1 invalidateIntrinsicContentSize];
  }
  return result;
}

- (CGFloat)minimumLayoutSize
{
  return _NUIContainerViewInfoCreateIfNeeded(a1, 0)->_minSize.width;
}

- (_NUIViewContainerViewInfo)setCustomBaselineOffsetFromBottom:()NUIContainerView
{
  uint64_t result = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  char flags = (char)result->_flags;
  if (result->_baselines.baseLineFromBottom != a2 || (flags & 0x10) == 0)
  {
    result->_baselines.double baseLineFromBottom = a2;
    *(unsigned char *)&result->_char flags = flags | 0x20;
    return (_NUIViewContainerViewInfo *)[(objc_object *)a1 invalidateIntrinsicContentSize];
  }
  return result;
}

- (_NUIViewContainerViewInfo)setCustomAlignmentRectInsets:()NUIContainerView
{
  uint64_t result = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  double top = result->_alignmentInsets.top;
  if (result->_alignmentInsets.left != a3
    || top != a2
    || result->_alignmentInsets.right != a5
    || result->_alignmentInsets.bottom != a4)
  {
    result->_alignmentInsets.double top = a2;
    result->_alignmentInsets.left = a3;
    result->_alignmentInsets.bottom = a4;
    result->_alignmentInsets.right = a5;
    *(unsigned char *)&result->_flags &= ~8u;
    return (_NUIViewContainerViewInfo *)[(objc_object *)a1 invalidateIntrinsicContentSize];
  }
  return result;
}

- (_NUIViewContainerViewInfo)setNeverCacheEffectiveLayoutSize:()NUIContainerView
{
  uint64_t result = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  *(unsigned char *)&result->_char flags = *(unsigned char *)&result->_flags & 0xFE | a3;
  return result;
}

- (uint64_t)neverCacheEffectiveLayoutSize
{
  return *(unsigned char *)&_NUIContainerViewInfoCreateIfNeeded(a1, 0)->_flags & 1;
}

- (CGFloat)maximumLayoutSize
{
  return _NUIContainerViewInfoCreateIfNeeded(a1, 0)->_maxSize.width;
}

- (CGFloat)customAlignmentRectInsets
{
  return _NUIContainerViewInfoCreateIfNeeded(a1, 0)->_alignmentInsets.top;
}

- (double)customBaselineOffsetFromBottom
{
  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 0);
  if ((*(unsigned char *)&IfNeeded->_flags & 0x20) != 0) {
    p_double baseLineFromBottom = (uint64_t *)&IfNeeded->_baselines.baseLineFromBottom;
  }
  else {
    p_double baseLineFromBottom = &NUIContainerViewLengthUseDefault;
  }
  return *(double *)p_baseLineFromBottom;
}

- (double)customFirstBaselineOffsetFromTop
{
  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 0);
  if ((*(unsigned char *)&IfNeeded->_flags & 0x10) != 0) {
    p_baselines = (uint64_t *)&IfNeeded->_baselines;
  }
  else {
    p_baselines = &NUIContainerViewLengthUseDefault;
  }
  return *(double *)p_baselines;
}

@end