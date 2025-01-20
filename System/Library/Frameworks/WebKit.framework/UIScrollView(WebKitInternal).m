@interface UIScrollView(WebKitInternal)
- (BOOL)_wk_canScrollHorizontallyWithoutBouncing;
- (BOOL)_wk_canScrollVerticallyWithoutBouncing;
- (BOOL)_wk_isScrolledBeyondExtents;
- (CGFloat)_wk_clampToScrollExtents:()WebKitInternal;
- (double)_wk_contentHeightIncludingInsets;
- (double)_wk_contentWidthIncludingInsets;
- (uint64_t)_wk_isInterruptingDeceleration;
- (uint64_t)_wk_isScrollAnimating;
- (uint64_t)_wk_isZoomAnimating;
- (uint64_t)_wk_setContentOffsetAndShowScrollIndicators:()WebKitInternal animated:;
- (uint64_t)_wk_setTransfersHorizontalScrollingToParent:()WebKitInternal;
- (uint64_t)_wk_setTransfersVerticalScrollingToParent:()WebKitInternal;
- (void)_wk_stopScrollingAndZooming;
@end

@implementation UIScrollView(WebKitInternal)

- (uint64_t)_wk_isZoomAnimating
{
  if ((byte_1E93CF7B3 & 1) == 0)
  {
    v3 = a1;
    int v2 = [MEMORY[0x1E4F42DB0] instancesRespondToSelector:sel_isZoomAnimating];
    a1 = v3;
    byte_1E93CF7B2 = v2;
    byte_1E93CF7B3 = 1;
    if (v2) {
      goto LABEL_3;
    }
    return 0;
  }
  if (!byte_1E93CF7B2) {
    return 0;
  }
LABEL_3:

  return [a1 isZoomAnimating];
}

- (uint64_t)_wk_isScrollAnimating
{
  if ((byte_1E93CF7B1 & 1) == 0)
  {
    v3 = a1;
    int v2 = [MEMORY[0x1E4F42DB0] instancesRespondToSelector:sel_isScrollAnimating];
    a1 = v3;
    _MergedGlobals_91 = v2;
    byte_1E93CF7B1 = 1;
    if (v2) {
      goto LABEL_3;
    }
    return 0;
  }
  if (!_MergedGlobals_91) {
    return 0;
  }
LABEL_3:

  return [a1 isScrollAnimating];
}

- (BOOL)_wk_isScrolledBeyondExtents
{
  [a1 contentOffset];
  double v3 = v2;
  double v5 = v4;
  [a1 adjustedContentInset];
  double v10 = -v9;
  if (v3 < -v8 || v5 < v10) {
    return 1;
  }
  double v13 = v6;
  double v14 = v7;
  [a1 contentSize];
  double v16 = v15;
  double v18 = v17;
  [a1 bounds];
  double v20 = v19;
  double v22 = v21;
  double v23 = v14 + v16;
  objc_msgSend(a1, "_wk_contentWidthIncludingInsets");
  if (v24 >= v20) {
    double v24 = v20;
  }
  double v25 = v23 - v24;
  double v26 = v13 + v18;
  objc_msgSend(a1, "_wk_contentHeightIncludingInsets");
  if (v27 >= v22) {
    double v27 = v22;
  }
  return v5 > v26 - v27 || v3 > v25;
}

- (double)_wk_contentWidthIncludingInsets
{
  [a1 adjustedContentInset];
  double v3 = v2;
  double v5 = v4;
  [a1 contentSize];
  return v5 + v3 + v6;
}

- (double)_wk_contentHeightIncludingInsets
{
  [a1 adjustedContentInset];
  double v3 = v2;
  double v5 = v4;
  [a1 contentSize];
  return v5 + v3 + v6;
}

- (uint64_t)_wk_isInterruptingDeceleration
{
  uint64_t result = [a1 isDecelerating];
  if (result)
  {
    return [a1 isTracking];
  }
  return result;
}

- (void)_wk_stopScrollingAndZooming
{
  if (byte_1E93CF7B5)
  {
    if (!byte_1E93CF7B4) {
      return result;
    }
  }
  else
  {
    double v2 = result;
    int v1 = [MEMORY[0x1E4F42DB0] instancesRespondToSelector:sel_stopScrollingAndZooming];
    uint64_t result = v2;
    byte_1E93CF7B4 = v1;
    byte_1E93CF7B5 = 1;
    if (!v1) {
      return result;
    }
  }

  return (void *)[result stopScrollingAndZooming];
}

- (CGFloat)_wk_clampToScrollExtents:()WebKitInternal
{
  [a1 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [a1 adjustedContentInset];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  if ([a1 isZoomBouncing] & 1) == 0 && (objc_msgSend(a1, "isZooming")) {
    return a2;
  }
  double v28 = v17;
  double v30 = v15;
  double v18 = -v13;
  [a1 contentSize];
  double v20 = v19;
  double v29 = v21;
  v31.origin.x = a2;
  v31.origin.y = a3;
  v31.size.width = v7;
  v31.size.height = v9;
  double Width = CGRectGetWidth(v31);
  objc_msgSend(a1, "_wk_contentWidthIncludingInsets");
  if (Width < v23)
  {
    v32.origin.x = a2;
    v32.origin.y = a3;
    v32.size.width = v7;
    v32.size.height = v9;
    if (CGRectGetMinX(v32) >= v18)
    {
      double v24 = v28 + v20;
      v33.origin.x = a2;
      v33.origin.y = a3;
      v33.size.width = v7;
      v33.size.height = v9;
      double v18 = a2;
      if (CGRectGetMaxX(v33) > v24)
      {
        v34.origin.x = a2;
        v34.origin.y = a3;
        v34.size.width = v7;
        v34.size.height = v9;
        double v18 = v24 - CGRectGetWidth(v34);
      }
    }
  }
  v35.origin.x = a2;
  v35.origin.y = a3;
  v35.size.width = v7;
  v35.size.height = v9;
  double Height = CGRectGetHeight(v35);
  objc_msgSend(a1, "_wk_contentHeightIncludingInsets");
  if (Height < v26)
  {
    v36.origin.x = a2;
    v36.origin.y = a3;
    v36.size.width = v7;
    v36.size.height = v9;
    if (CGRectGetMinY(v36) >= -v11)
    {
      v37.origin.x = a2;
      v37.origin.y = a3;
      v37.size.width = v7;
      v37.size.height = v9;
      if (CGRectGetMaxY(v37) > v30 + v29)
      {
        v38.origin.x = a2;
        v38.origin.y = a3;
        v38.size.width = v7;
        v38.size.height = v9;
        CGRectGetHeight(v38);
      }
    }
  }
  return v18;
}

- (BOOL)_wk_canScrollHorizontallyWithoutBouncing
{
  objc_msgSend(a1, "_wk_contentWidthIncludingInsets");
  double v3 = v2;
  [a1 bounds];
  return v3 - CGRectGetWidth(v5) > 0.0001;
}

- (BOOL)_wk_canScrollVerticallyWithoutBouncing
{
  objc_msgSend(a1, "_wk_contentHeightIncludingInsets");
  double v3 = v2;
  [a1 bounds];
  return v3 - CGRectGetHeight(v5) > 0.0001;
}

- (uint64_t)_wk_setTransfersHorizontalScrollingToParent:()WebKitInternal
{
  if (byte_1E93CF7B7)
  {
    if (byte_1E93CF7B6)
    {
LABEL_3:
      return objc_msgSend(a1, "setTransfersHorizontalScrollingToParent:");
    }
  }
  else
  {
    double v3 = a1;
    int v2 = [MEMORY[0x1E4F42DB0] instancesRespondToSelector:sel_setTransfersHorizontalScrollingToParent_];
    a1 = v3;
    byte_1E93CF7B6 = v2;
    byte_1E93CF7B7 = 1;
    if (v2) {
      goto LABEL_3;
    }
  }

  return objc_msgSend(a1, "_setAllowsParentToBeginHorizontally:");
}

- (uint64_t)_wk_setTransfersVerticalScrollingToParent:()WebKitInternal
{
  if (byte_1E93CF7B9)
  {
    if (byte_1E93CF7B8)
    {
LABEL_3:
      return objc_msgSend(a1, "setTransfersVerticalScrollingToParent:");
    }
  }
  else
  {
    double v3 = a1;
    int v2 = [MEMORY[0x1E4F42DB0] instancesRespondToSelector:sel_setTransfersVerticalScrollingToParent_];
    a1 = v3;
    byte_1E93CF7B8 = v2;
    byte_1E93CF7B9 = 1;
    if (v2) {
      goto LABEL_3;
    }
  }

  return objc_msgSend(a1, "_setAllowsParentToBeginVertically:");
}

- (uint64_t)_wk_setContentOffsetAndShowScrollIndicators:()WebKitInternal animated:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v19.x = a2;
  v19.y = a3;
  if (byte_1E93CF7BB)
  {
    if (byte_1E93CF7BA)
    {
LABEL_3:
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3321888768;
      v15[2] = __85__UIScrollView_WebKitInternal___wk_setContentOffsetAndShowScrollIndicators_animated___block_invoke;
      v15[3] = &__block_descriptor_64_e8_32c98_ZTSKZ85__UIScrollView_WebKitInternal___wk_setContentOffsetAndShowScrollIndicators_animated__E3__0_e5_v8__0l;
      *(CGPoint *)&v20[7] = v19;
      char v16 = a5;
      *(_OWORD *)double v17 = *(_OWORD *)v20;
      *(CGFloat *)&v17[15] = v19.y;
      double v18 = a1;
      return [a1 showScrollIndicatorsForContentOffsetChanges:v15];
    }
  }
  else
  {
    char v12 = a5;
    int v7 = [MEMORY[0x1E4F42DB0] instancesRespondToSelector:sel_showScrollIndicatorsForContentOffsetChanges_];
    a5 = v12;
    byte_1E93CF7BA = v7;
    byte_1E93CF7BB = 1;
    if (v7) {
      goto LABEL_3;
    }
  }
  objc_msgSend(a1, "setContentOffset:animated:");
  [a1 contentOffset];
  *(void *)double v20 = v8;
  *(void *)&v20[8] = v9;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v14, (const CGPoint *)v20);
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v13, &v19);
  if ((float)(v14[1] - v13[1]) == 0.0) {
    uint64_t v11 = (float)(v14[0] - v13[0]) != 0.0;
  }
  else {
    uint64_t v11 = ((float)(v14[0] - v13[0]) != 0.0) | 2;
  }
  *(float *)&double v10 = v14[0] - v13[0];
  return objc_msgSend(a1, "_flashScrollIndicatorsForAxes:persistingPreviousFlashes:", v11, 1, v10);
}

@end