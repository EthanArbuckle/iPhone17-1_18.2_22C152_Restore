@interface BNBannerLayoutManager
+ (CGRect)_dismissedFrameForContentWithPreferredSize:(CGSize)a3 inUseableContainerFrame:(CGRect)a4 containerBounds:(CGRect)a5 layoutInfo:(BNBannerLayoutInfoV2 *)a6 overshoot:(BOOL)a7 scale:(double)a8;
+ (CGRect)_presentedFrameForContentWithFrame:(CGRect)a3 afterContentWithFrame:(CGRect)a4 layoutInfo:(BNBannerLayoutInfoV2 *)a5;
+ (CGRect)_presentedFrameForContentWithPreferredSize:(CGSize)a3 inUseableContainerFrame:(CGRect)a4 containerBounds:(CGRect)a5 layoutInfo:(BNBannerLayoutInfoV2 *)a6 scale:(double)a7;
+ (CGRect)_useableContainerFrameInContainerBounds:(CGRect)a3 inWindow:(id)a4;
+ (CGRect)_useableContainerFrameInContainerBounds:(CGRect)a3 onScreen:(id)a4;
+ (CGRect)_useableContainerFrameInContainerBounds:(CGRect)a3 onScreen:(id)a4 interfaceOrientation:(int64_t)a5;
+ (void)initialize;
- (BNBannerLayoutInfo)layoutInfo;
- (BNBannerLayoutInfoV2)_effectiveLayoutInfo;
- (BNBannerLayoutInfoV2)layoutInfoV2;
- (BNBannerLayoutManager)init;
- (CGRect)dismissedFrameForContentWithPreferredSize:(CGSize)a3 inUseableContainerFrame:(CGRect)a4 containerBounds:(CGRect)a5 overshoot:(BOOL)a6 scale:(double)a7;
- (CGRect)presentedFrameForContentWithFrame:(CGRect)a3 afterContentWithFrame:(CGRect)a4;
- (CGRect)presentedFrameForContentWithPreferredSize:(CGSize)a3 inUseableContainerFrame:(CGRect)a4 containerBounds:(CGRect)a5 scale:(double)a6;
- (CGRect)useableContainerFrameInContainerBounds:(CGRect)a3 inWindow:(id)a4;
- (CGRect)useableContainerFrameInContainerBounds:(CGRect)a3 onScreen:(id)a4;
- (CGRect)useableContainerFrameInContainerBounds:(CGRect)a3 onScreen:(id)a4 interfaceOrientation:(int64_t)a5;
- (void)setLayoutInfo:(BNBannerLayoutInfo *)a3;
- (void)setLayoutInfoV2:(BNBannerLayoutInfoV2 *)a3;
@end

@implementation BNBannerLayoutManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    BNRegisterBannerKitLogging();
  }
}

- (BNBannerLayoutManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)BNBannerLayoutManager;
  result = [(BNBannerLayoutManager *)&v3 init];
  if (result)
  {
    result->_layoutInfoV2.presentationEdge = 1;
    *(_OWORD *)&result->_layoutInfoV2.contentInsets.top = xmmword_1BEC34E80;
    *(_OWORD *)&result->_layoutInfoV2.contentInsets.bottom = xmmword_1BEC34E80;
    result->_layoutInfoV2.maximumContentSize = (CGSize)xmmword_1BEC34E90;
    result->_layoutInfoV2.interBannerSpacing = 8.0;
  }
  return result;
}

+ (CGRect)_useableContainerFrameInContainerBounds:(CGRect)a3 onScreen:(id)a4 interfaceOrientation:(int64_t)a5
{
  objc_msgSend(a4, "_bn_portraitPeripheryInsets");
  UIEdgeInsetsRotate();
  UIRectInset();
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

+ (CGRect)_useableContainerFrameInContainerBounds:(CGRect)a3 onScreen:(id)a4
{
  [a4 _peripheryInsets];
  UIRectInset();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)_useableContainerFrameInContainerBounds:(CGRect)a3 inWindow:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v10 = [v9 screen];
  uint64_t v11 = [v9 interfaceOrientation];

  objc_msgSend(a1, "_useableContainerFrameInContainerBounds:onScreen:interfaceOrientation:", v10, v11, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

+ (CGRect)_presentedFrameForContentWithPreferredSize:(CGSize)a3 inUseableContainerFrame:(CGRect)a4 containerBounds:(CGRect)a5 layoutInfo:(BNBannerLayoutInfoV2 *)a6 scale:(double)a7
{
  CGFloat width = a4.size.width;
  CGFloat height = a4.size.height;
  CGFloat x = a4.origin.x;
  CGFloat y = a4.origin.y;
  CGFloat v8 = a5.size.height;
  CGFloat v10 = a5.origin.x;
  CGFloat v9 = a5.origin.y;
  CGFloat v11 = a5.size.width;
  CGRectGetWidth(a5);
  CGRectGetHeight(a5);
  UISizeRoundToScale();
  double v13 = v12;
  double v15 = v14;
  UISizeRoundToScale();
  if (v13 != v17 || v15 != v16)
  {
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    CGRectGetWidth(v33);
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = width;
    v34.size.CGFloat height = height;
    CGRectGetHeight(v34);
    BSRectWithSize();
    UIRectCenteredXInRectScale();
    CGFloat v10 = v20;
    CGFloat v11 = v21;
    CGFloat v8 = v22;
    if (a6->presentationEdge == 4)
    {
      CGFloat v23 = v19;
      v35.origin.CGFloat x = x;
      v35.origin.CGFloat y = y;
      v35.size.CGFloat width = width;
      v35.size.CGFloat height = height;
      CGRectGetMaxY(v35);
      v36.origin.CGFloat x = v10;
      v36.origin.CGFloat y = v23;
      v36.size.CGFloat width = v11;
      v36.size.CGFloat height = v8;
      CGRectGetHeight(v36);
    }
    else
    {
      v37.origin.CGFloat x = x;
      v37.origin.CGFloat y = y;
      v37.size.CGFloat width = width;
      v37.size.CGFloat height = height;
      CGRectGetMinY(v37);
    }
    UIRoundToScale();
    CGFloat v9 = v24;
  }
  double v25 = v10;
  double v26 = v9;
  double v27 = v11;
  double v28 = v8;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

+ (CGRect)_dismissedFrameForContentWithPreferredSize:(CGSize)a3 inUseableContainerFrame:(CGRect)a4 containerBounds:(CGRect)a5 layoutInfo:(BNBannerLayoutInfoV2 *)a6 overshoot:(BOOL)a7 scale:(double)a8
{
  BOOL v8 = a7;
  long long v10 = *(_OWORD *)&a6->contentInsets.left;
  v29[0] = *(_OWORD *)&a6->presentationEdge;
  v29[1] = v10;
  long long v11 = *(_OWORD *)&a6->maximumContentSize.height;
  v29[2] = *(_OWORD *)&a6->contentInsets.right;
  v29[3] = v11;
  objc_msgSend(a1, "_presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:layoutInfo:scale:", v29, a3.width, a3.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *(void *)&a5.origin.x, *(void *)&a5.origin.y, *(void *)&a5.size.width, *(void *)&a5.size.height, *(void *)&a8);
  double v16 = v12;
  double v17 = v14;
  double v18 = v15;
  if ((v14 != a5.size.width || v15 != a5.size.height) && (a6->presentationEdge & 5) != 0)
  {
    double Height = CGRectGetHeight(*(CGRect *)&v12);
    double v20 = Height * 0.5;
    if (!v8) {
      double v20 = 0.0;
    }
    double v21 = Height + v20;
    CGFloat x = a5.origin.x;
    CGFloat y = a5.origin.y;
    CGFloat width = a5.size.width;
    CGFloat v25 = a5.size.height;
    if (a6->presentationEdge == 4) {
      double v13 = v21 + CGRectGetMaxY(*(CGRect *)&x);
    }
    else {
      double v13 = CGRectGetMinY(*(CGRect *)&x) - v21;
    }
  }
  double v26 = v16;
  double v27 = v17;
  double v28 = v18;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v26;
  return result;
}

+ (CGRect)_presentedFrameForContentWithFrame:(CGRect)a3 afterContentWithFrame:(CGRect)a4 layoutInfo:(BNBannerLayoutInfoV2 *)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v10 = a3.size.height;
  CGFloat v11 = a3.size.width;
  CGFloat v12 = a3.origin.x;
  unint64_t presentationEdge = a5->presentationEdge;
  if ((a5->presentationEdge & 5) == 0)
  {
    double v24 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y);
    [v24 handleFailureInMethod:a2 object:a1 file:@"BNBannerLayoutManager.m" lineNumber:110 description:@"Only 'UIRectEdgeTop' and 'UIRectEdgeBottom' are currently supported"];

    unint64_t presentationEdge = a5->presentationEdge;
  }
  CGFloat v14 = x;
  CGFloat v15 = y;
  CGFloat v16 = width;
  CGFloat v17 = height;
  if (presentationEdge == 4) {
    double v18 = CGRectGetMinY(*(CGRect *)&v14) - a5->interBannerSpacing;
  }
  else {
    double v18 = CGRectGetMaxY(*(CGRect *)&v14) + a5->interBannerSpacing;
  }
  double v19 = v12;
  double v20 = v11;
  double v21 = v10;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v19;
  return result;
}

- (CGRect)useableContainerFrameInContainerBounds:(CGRect)a3 onScreen:(id)a4 interfaceOrientation:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  objc_msgSend((id)objc_opt_class(), "_useableContainerFrameInContainerBounds:onScreen:interfaceOrientation:", v10, a5, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (CGRect)useableContainerFrameInContainerBounds:(CGRect)a3 onScreen:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  objc_msgSend((id)objc_opt_class(), "_useableContainerFrameInContainerBounds:onScreen:", v8, x, y, width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGRect)useableContainerFrameInContainerBounds:(CGRect)a3 inWindow:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  objc_msgSend((id)objc_opt_class(), "_useableContainerFrameInContainerBounds:inWindow:", v8, x, y, width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGRect)dismissedFrameForContentWithPreferredSize:(CGSize)a3 inUseableContainerFrame:(CGRect)a4 containerBounds:(CGRect)a5 overshoot:(BOOL)a6 scale:(double)a7
{
  BOOL v7 = a6;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v12 = a3.height;
  double v13 = a3.width;
  double v15 = objc_opt_class();
  [(BNBannerLayoutManager *)self _effectiveLayoutInfo];
  objc_msgSend(v15, "_dismissedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:layoutInfo:overshoot:scale:", v20, v7, v13, v12, x, y, width, height, *(void *)&a5.origin.x, *(void *)&a5.origin.y, *(void *)&a5.size.width, *(void *)&a5.size.height, *(void *)&a7);
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGRect)presentedFrameForContentWithPreferredSize:(CGSize)a3 inUseableContainerFrame:(CGRect)a4 containerBounds:(CGRect)a5 scale:(double)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v10 = a3.height;
  double v11 = a3.width;
  double v13 = objc_opt_class();
  [(BNBannerLayoutManager *)self _effectiveLayoutInfo];
  objc_msgSend(v13, "_presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:layoutInfo:scale:", v18, v11, v10, x, y, width, height, *(void *)&a5.origin.x, *(void *)&a5.origin.y, *(void *)&a5.size.width, *(void *)&a5.size.height, *(void *)&a6);
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)presentedFrameForContentWithFrame:(CGRect)a3 afterContentWithFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  double v13 = objc_opt_class();
  [(BNBannerLayoutManager *)self _effectiveLayoutInfo];
  objc_msgSend(v13, "_presentedFrameForContentWithFrame:afterContentWithFrame:layoutInfo:", &v18, v11, v10, v9, v8, x, y, width, height);
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)setLayoutInfo:(BNBannerLayoutInfo *)a3
{
  objc_super v3 = (_OWORD *)MEMORY[0x1E4F437F8];
  self->_layoutInfoV2.unint64_t presentationEdge = 0;
  long long v4 = v3[1];
  *(_OWORD *)&self->_layoutInfoV2.contentInsets.top = *v3;
  double v5 = (CGSize *)MEMORY[0x1E4F1DB30];
  *(_OWORD *)&self->_layoutInfoV2.contentInsets.bottom = v4;
  self->_layoutInfoV2.maximumContentSize = *v5;
  self->_layoutInfoV2.interBannerSpacing = 0.0;
  long long v7 = *(_OWORD *)&a3->contentInsets.left;
  long long v6 = *(_OWORD *)&a3->contentInsets.right;
  CGFloat height = a3->maximumContentSize.height;
  *(_OWORD *)&self->_layoutInfo.unint64_t presentationEdge = *(_OWORD *)&a3->presentationEdge;
  self->_layoutInfo.maximumContentSize.CGFloat height = height;
  *(_OWORD *)&self->_layoutInfo.contentInsets.right = v6;
  *(_OWORD *)&self->_layoutInfo.contentInsets.left = v7;
}

- (BNBannerLayoutInfoV2)_effectiveLayoutInfo
{
  [(BNBannerLayoutManager *)self layoutInfoV2];
  if (v12
    || (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v13, *MEMORY[0x1E4F437F8]), (int32x4_t)vceqq_f64(v14, *(float64x2_t *)(MEMORY[0x1E4F437F8] + 16)))), 0xFuLL))) & 1) == 0)
  {
    return [(BNBannerLayoutManager *)self layoutInfoV2];
  }
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  BOOL v7 = v15 == *MEMORY[0x1E4F1DB30] && v16 == v6;
  if (!v7 || v17 != 0.0) {
    return [(BNBannerLayoutManager *)self layoutInfoV2];
  }
  [(BNBannerLayoutManager *)self layoutInfo];
  retstr->unint64_t presentationEdge = v11;
  [(BNBannerLayoutManager *)self layoutInfo];
  *(_OWORD *)&retstr->contentInsets.top = v9;
  *(_OWORD *)&retstr->contentInsets.bottom = v10;
  CGRect result = [(BNBannerLayoutManager *)self layoutInfo];
  retstr->maximumContentSize = v8;
  retstr->interBannerSpacing = 8.0;
  return result;
}

- (BNBannerLayoutInfo)layoutInfo
{
  long long v3 = *(_OWORD *)&self->contentInsets.bottom;
  *(_OWORD *)&retstr->unint64_t presentationEdge = *(_OWORD *)&self->contentInsets.top;
  *(_OWORD *)&retstr->contentInsets.left = v3;
  *(CGSize *)&retstr->contentInsets.right = self->maximumContentSize;
  *(void *)&retstr->maximumContentSize.CGFloat height = self[1].presentationEdge;
  return self;
}

- (BNBannerLayoutInfoV2)layoutInfoV2
{
  long long v3 = *(_OWORD *)&self[1].contentInsets.left;
  *(_OWORD *)&retstr->unint64_t presentationEdge = *(_OWORD *)&self[1].presentationEdge;
  *(_OWORD *)&retstr->contentInsets.left = v3;
  long long v4 = *(_OWORD *)&self[1].maximumContentSize.height;
  *(_OWORD *)&retstr->contentInsets.right = *(_OWORD *)&self[1].contentInsets.right;
  *(_OWORD *)&retstr->maximumContentSize.CGFloat height = v4;
  return self;
}

- (void)setLayoutInfoV2:(BNBannerLayoutInfoV2 *)a3
{
  long long v3 = *(_OWORD *)&a3->presentationEdge;
  long long v4 = *(_OWORD *)&a3->contentInsets.left;
  long long v5 = *(_OWORD *)&a3->maximumContentSize.height;
  *(_OWORD *)&self->_layoutInfoV2.contentInsets.right = *(_OWORD *)&a3->contentInsets.right;
  *(_OWORD *)&self->_layoutInfoV2.maximumContentSize.CGFloat height = v5;
  *(_OWORD *)&self->_layoutInfoV2.unint64_t presentationEdge = v3;
  *(_OWORD *)&self->_layoutInfoV2.contentInsets.left = v4;
}

@end