@interface UIView(NUISubclassHelpers)
- (_NUIViewContainerViewInfo)effectiveAlignmentRectInsets;
- (_NUIViewContainerViewInfo)setCurrentEffectiveLayoutSizeFittingSizeShouldNotBeCached;
- (double)_didInvalidateIntrinsicContentSize;
- (uint64_t)effectiveBaselineOffsetFromContentBottom;
- (uint64_t)effectiveFirstBaselineOffsetFromContentTop;
- (uint64_t)systemSpacingToAdjecentSiblingView:()NUISubclassHelpers axis:baselineRelative:multiplier:;
- (uint64_t)systemSpacingToSuperView:()NUISubclassHelpers edge:baselineRelative:multiplier:;
@end

@implementation UIView(NUISubclassHelpers)

- (uint64_t)effectiveFirstBaselineOffsetFromContentTop
{
  uint64_t result = [a1 effectiveFirstBaselineOffsetFromTop];
  double v4 = v3;
  double v5 = -v3;
  if (v4 >= 0.0) {
    double v6 = v4;
  }
  else {
    double v6 = v5;
  }
  if (v6 > 2.22507386e-308) {
    return [a1 effectiveAlignmentRectInsets];
  }
  return result;
}

- (_NUIViewContainerViewInfo)effectiveAlignmentRectInsets
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t result = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  v2 = result;
  if ((*(unsigned char *)&result->_flags & 8) == 0)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    v9[0] = xmmword_1AE675710;
    v9[1] = unk_1AE675720;
    p_alignmentInsets = &result->_alignmentInsets;
    v8[0] = xmmword_1AE675710;
    v8[1] = unk_1AE675720;
    do
    {
      uint64_t result = (_NUIViewContainerViewInfo *)NUIContainerViewLengthIsDefault(*(double *)((char *)&p_alignmentInsets->top
                                                                                      + v3));
      if (result)
      {
        double v6 = (char *)v9 + 8 * v4;
      }
      else
      {
        uint64_t result = (_NUIViewContainerViewInfo *)NUIContainerViewLengthIsSystem(0, *(double *)((char *)&p_alignmentInsets->top + v3));
        if (result) {
          double v6 = (char *)v8 + v3;
        }
        else {
          double v6 = (char *)(&p_alignmentInsets->top + v4);
        }
      }
      *(void *)((char *)v10 + v3) = *(void *)v6;
      ++v4;
      v3 += 8;
    }
    while (v3 != 32);
    long long v7 = v10[1];
    *(_OWORD *)&v2->_cachedAlignmentInsets.top = v10[0];
    *(_OWORD *)&v2->_cachedAlignmentInsets.bottom = v7;
    *(unsigned char *)&v2->_flags |= 8u;
  }
  return result;
}

- (double)_didInvalidateIntrinsicContentSize
{
  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 0);
  return -[_NUIViewContainerViewInfo resetCaches]((uint64_t)IfNeeded);
}

- (uint64_t)effectiveBaselineOffsetFromContentBottom
{
  uint64_t result = [a1 effectiveBaselineOffsetFromBottom];
  double v4 = v3;
  double v5 = -v3;
  if (v4 >= 0.0) {
    double v6 = v4;
  }
  else {
    double v6 = v5;
  }
  if (v6 > 2.22507386e-308) {
    return [a1 effectiveAlignmentRectInsets];
  }
  return result;
}

- (_NUIViewContainerViewInfo)setCurrentEffectiveLayoutSizeFittingSizeShouldNotBeCached
{
  uint64_t result = _NUIContainerViewInfoCreateIfNeeded(a1, 0);
  if ((*(unsigned char *)&result->_flags & 2) != 0)
  {
    *(unsigned char *)&result->_flags &= ~2u;
    double v3 = (void *)[(objc_object *)a1 superview];
    return (_NUIViewContainerViewInfo *)[v3 setCurrentEffectiveLayoutSizeFittingSizeShouldNotBeCached];
  }
  return result;
}

- (uint64_t)systemSpacingToAdjecentSiblingView:()NUISubclassHelpers axis:baselineRelative:multiplier:
{
  if (a4)
  {
    if (a5)
    {
      uint64_t v6 = 6;
      uint64_t v7 = 11;
      uint64_t v8 = a3;
      uint64_t v9 = 5;
      uint64_t v10 = 12;
    }
    else
    {
      uint64_t v6 = 4;
      uint64_t v7 = 4;
      uint64_t v8 = a3;
      uint64_t v9 = 3;
      uint64_t v10 = 3;
    }
  }
  else
  {
    uint64_t v6 = 2;
    uint64_t v7 = 6;
    uint64_t v8 = a3;
    uint64_t v9 = 1;
    uint64_t v10 = 5;
  }
  return objc_msgSend(a1, "_autolayoutSpacingAtEdge:forAttribute:nextToNeighbor:edge:attribute:multiplier:", v6, v7, v8, v9, v10);
}

- (uint64_t)systemSpacingToSuperView:()NUISubclassHelpers edge:baselineRelative:multiplier:
{
  uint64_t v6 = a4 - 1;
  uint64_t v9 = 1;
  uint64_t v10 = 1;
  switch(v6)
  {
    case 0:
      BOOL v11 = a5 == 0;
      uint64_t v12 = 3;
      if (a5) {
        uint64_t v9 = 5;
      }
      else {
        uint64_t v9 = 3;
      }
      uint64_t v13 = 12;
      goto LABEL_11;
    case 1:
      goto LABEL_15;
    case 3:
      BOOL v11 = a5 == 0;
      uint64_t v12 = 4;
      if (a5) {
        uint64_t v9 = 6;
      }
      else {
        uint64_t v9 = 4;
      }
      uint64_t v13 = 11;
LABEL_11:
      if (v11) {
        uint64_t v10 = v12;
      }
      else {
        uint64_t v10 = v13;
      }
      goto LABEL_15;
    case 7:
      uint64_t v10 = 2;
      uint64_t v9 = 2;
LABEL_15:
      [a1 _autolayoutSpacingAtEdge:v9 forAttribute:v10 inContainer:a3 isGuide:0];
      uint64_t result = [a1 effectiveScreenScale];
      break;
    default:
      uint64_t result = objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Invalid edge %lu", a4);
      break;
  }
  return result;
}

@end