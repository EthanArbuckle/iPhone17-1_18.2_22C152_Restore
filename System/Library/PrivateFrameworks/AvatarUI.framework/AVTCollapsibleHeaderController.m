@interface AVTCollapsibleHeaderController
- (AVTCollapsibleHeaderController)initWithScrollView:(id)a3 headerView:(id)a4 minHeight:(double)a5 maxHeight:(double)a6;
- (AVTCollapsibleHeaderControllerDelegate)delegate;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shouldCollapseOnBottomBounceScroll;
- (BOOL)shouldOnlyExpandWhenScrollingAtEdge;
- (BOOL)shouldPushContentOffsetOnExpandOrCollapse;
- (BOOL)shouldResizeGivenMarginalScrollDistancesForScrollDirection:(unint64_t)a3;
- (BOOL)shouldResizeGivenScrollDirection:(unint64_t)a3 currentHeaderHeight:(double)a4 targetHeaderHeight:(double)a5;
- (BOOL)shouldResizeHeaderForScrolling;
- (BOOL)shouldSnapToMinOrMax;
- (CGPoint)topContentOffsetWithHeaderHeight:(double)a3;
- (UIEdgeInsets)updatedScrollViewInsetsFromExistingInsets:(UIEdgeInsets)a3;
- (UIScrollView)scrollView;
- (UIScrollViewDelegate)scrollViewDelegate;
- (UIView)headerView;
- (double)additionalTopContentInset;
- (double)collapseMarginalScrollDistance;
- (double)currentHeightForHeader;
- (double)expandMarginalScrollDistance;
- (double)headerHeightForContentOffset:(double)a3 contentInset:(UIEdgeInsets)a4;
- (double)maxHeight;
- (double)minHeight;
- (double)previousOffset;
- (double)scrollToCompressionMultiplier;
- (double)singleTouchOffset;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (unint64_t)currentScrollDirection;
- (void)animationDidUpdateWithDisplayLink:(id)a3;
- (void)collapseAnimated:(BOOL)a3;
- (void)expandAnimated:(BOOL)a3;
- (void)expandAnimated:(BOOL)a3 withFocusRect:(CGRect)a4 standardItemHeight:(double)a5;
- (void)scrollToTopAnimated:(BOOL)a3;
- (void)scrollToTopPreservingHeaderHeight:(BOOL)a3 animated:(BOOL)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAdditionalTopContentInset:(double)a3;
- (void)setCollapseMarginalScrollDistance:(double)a3;
- (void)setCurrentScrollDirection:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setExpandMarginalScrollDistance:(double)a3;
- (void)setMaxHeight:(double)a3;
- (void)setMinHeight:(double)a3;
- (void)setPreviousOffset:(double)a3;
- (void)setScrollToCompressionMultiplier:(double)a3;
- (void)setScrollViewDelegate:(id)a3;
- (void)setShouldCollapseOnBottomBounceScroll:(BOOL)a3;
- (void)setShouldOnlyExpandWhenScrollingAtEdge:(BOOL)a3;
- (void)setShouldPushContentOffsetOnExpandOrCollapse:(BOOL)a3;
- (void)setShouldResizeHeaderForScrolling:(BOOL)a3;
- (void)setShouldSnapToMinOrMax:(BOOL)a3;
- (void)setSingleTouchOffset:(double)a3;
- (void)snapToMinMaxIfNeededAnimated:(BOOL)a3;
- (void)updateHeaderForHeight:(double)a3 withOffset:(CGPoint)a4 animated:(BOOL)a5;
- (void)updateHeaderHeightToMatchScrollViewStateForScrollDirection:(unint64_t)a3 animated:(BOOL)a4;
- (void)updateHeaderSizeForGlobalHeaderHeight:(double)a3;
- (void)updateInsetsIfNeeded;
- (void)updateMinHeight:(double)a3 maxHeight:(double)a4 animated:(BOOL)a5;
@end

@implementation AVTCollapsibleHeaderController

- (AVTCollapsibleHeaderController)initWithScrollView:(id)a3 headerView:(id)a4 minHeight:(double)a5 maxHeight:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  v23.receiver = self;
  v23.super_class = (Class)AVTCollapsibleHeaderController;
  v13 = [(AVTCollapsibleHeaderController *)&v23 init];
  v14 = v13;
  if (v13)
  {
    v13->_shouldResizeHeaderForScrolling = 1;
    v13->_minHeight = a5;
    v13->_maxHeight = a6;
    v13->_scrollToCompressionMultiplier = 1.0;
    [v12 frame];
    objc_msgSend(v12, "setFrame:");
    objc_storeStrong((id *)&v14->_headerView, a4);
    objc_storeStrong((id *)&v14->_scrollView, a3);
    [v11 contentInset];
    -[AVTCollapsibleHeaderController updatedScrollViewInsetsFromExistingInsets:](v14, "updatedScrollViewInsetsFromExistingInsets:");
    double v16 = v15;
    -[UIScrollView setContentInset:](v14->_scrollView, "setContentInset:");
    [v11 verticalScrollIndicatorInsets];
    [(UIScrollView *)v14->_scrollView setScrollIndicatorInsets:v16];
    [v11 contentOffset];
    double v18 = v17;
    [v11 _effectiveContentInset];
    -[UIScrollView setContentOffset:](v14->_scrollView, "setContentOffset:", v18, -v19);
    [v11 contentOffset];
    v14->_previousOffset = v20;
    v21 = [v11 delegate];
    objc_storeWeak((id *)&v14->_scrollViewDelegate, v21);

    [v11 setDelegate:v14];
  }

  return v14;
}

- (void)setAdditionalTopContentInset:(double)a3
{
  if (self->_additionalTopContentInset != a3)
  {
    self->_additionalTopContentInset = a3;
    [(AVTCollapsibleHeaderController *)self updateInsetsIfNeeded];
  }
}

- (void)updateMinHeight:(double)a3 maxHeight:(double)a4 animated:(BOOL)a5
{
  [(AVTCollapsibleHeaderController *)self minHeight];
  if (v8 != a3 || ([(AVTCollapsibleHeaderController *)self maxHeight], v9 != a4))
  {
    [(AVTCollapsibleHeaderController *)self setMinHeight:a3];
    [(AVTCollapsibleHeaderController *)self setMaxHeight:a4];
  }
}

- (void)expandAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(AVTCollapsibleHeaderController *)self scrollView];
  [v5 contentOffset];

  if ([(AVTCollapsibleHeaderController *)self shouldPushContentOffsetOnExpandOrCollapse])
  {
    [(AVTCollapsibleHeaderController *)self maxHeight];
    v6 = [(AVTCollapsibleHeaderController *)self headerView];
    [v6 bounds];
  }
  [(AVTCollapsibleHeaderController *)self maxHeight];
  -[AVTCollapsibleHeaderController updateHeaderForHeight:withOffset:animated:](self, "updateHeaderForHeight:withOffset:animated:", v3);
}

- (void)expandAnimated:(BOOL)a3 withFocusRect:(CGRect)a4 standardItemHeight:(double)a5
{
  double height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  BOOL v9 = a3;
  id v11 = [(AVTCollapsibleHeaderController *)self scrollView];
  [v11 contentOffset];

  if ([(AVTCollapsibleHeaderController *)self shouldPushContentOffsetOnExpandOrCollapse])
  {
    [(AVTCollapsibleHeaderController *)self maxHeight];
    id v12 = [(AVTCollapsibleHeaderController *)self headerView];
    [v12 bounds];
  }
  else
  {
    double v38 = a5;
    v13 = [(AVTCollapsibleHeaderController *)self scrollView];
    [v13 bounds];
    CGFloat v14 = x;
    CGFloat v15 = y;
    CGFloat v16 = width;
    CGFloat v18 = v17;
    double v20 = v19;
    CGFloat v22 = v21;
    double v24 = v23;

    v25 = [(AVTCollapsibleHeaderController *)self scrollView];
    [v25 _effectiveContentInset];
    CGFloat v27 = v20 + v26;

    v28 = [(AVTCollapsibleHeaderController *)self scrollView];
    [v28 _effectiveContentInset];
    CGFloat v30 = v24 - v29;

    CGFloat v39 = v27;
    v42.origin.CGFloat x = v18;
    v42.origin.CGFloat y = v27;
    CGFloat v31 = v30;
    v42.size.CGFloat width = v22;
    v42.size.double height = v30;
    v50.origin.CGFloat x = v14;
    v50.origin.CGFloat y = v15;
    v50.size.CGFloat width = v16;
    v50.size.double height = height;
    if (!CGRectContainsRect(v42, v50))
    {
      v43.origin.CGFloat x = v14;
      v43.origin.CGFloat y = v15;
      v43.size.CGFloat width = v16;
      v43.size.double height = height + v38;
      double MinY = CGRectGetMinY(v43);
      v44.origin.CGFloat y = v39;
      v44.origin.CGFloat x = v18;
      v44.size.CGFloat width = v22;
      v44.size.double height = v31;
      if (MinY >= CGRectGetMinY(v44))
      {
        v46.origin.CGFloat y = v39;
        v46.origin.CGFloat x = v18;
        v46.size.CGFloat width = v22;
        v46.size.double height = v31;
        double MaxY = CGRectGetMaxY(v46);
        v47.origin.CGFloat x = v14;
        v47.origin.CGFloat y = v15;
        v47.size.CGFloat width = v16;
        v47.size.double height = height + v38;
        if (MaxY < CGRectGetMaxY(v47))
        {
          v48.origin.CGFloat x = v14;
          v48.origin.CGFloat y = v15;
          v48.size.CGFloat width = v16;
          v48.size.double height = height + v38;
          CGRectGetMaxY(v48);
          v49.origin.CGFloat y = v39;
          v49.origin.CGFloat x = v18;
          v49.size.CGFloat width = v22;
          v49.size.double height = v31;
          CGRectGetMaxY(v49);
          v36 = [(AVTCollapsibleHeaderController *)self scrollView];
          [v36 contentSize];
          v37 = [(AVTCollapsibleHeaderController *)self scrollView];
          [v37 bounds];
        }
      }
      else
      {
        v33 = [(AVTCollapsibleHeaderController *)self scrollView];
        [v33 _effectiveContentInset];
        v45.origin.CGFloat x = v14;
        v45.origin.CGFloat y = v15;
        v45.size.CGFloat width = v16;
        v45.size.double height = height + v38;
        CGRectGetMinY(v45);

        v34 = [(AVTCollapsibleHeaderController *)self scrollView];
        [v34 _effectiveContentInset];
      }
    }
  }
  [(AVTCollapsibleHeaderController *)self maxHeight];
  -[AVTCollapsibleHeaderController updateHeaderForHeight:withOffset:animated:](self, "updateHeaderForHeight:withOffset:animated:", v9);
}

- (void)collapseAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(AVTCollapsibleHeaderController *)self scrollView];
  [v5 contentOffset];

  if ([(AVTCollapsibleHeaderController *)self shouldPushContentOffsetOnExpandOrCollapse])
  {
    v6 = [(AVTCollapsibleHeaderController *)self headerView];
    [v6 bounds];
    [(AVTCollapsibleHeaderController *)self minHeight];
  }
  [(AVTCollapsibleHeaderController *)self minHeight];
  -[AVTCollapsibleHeaderController updateHeaderForHeight:withOffset:animated:](self, "updateHeaderForHeight:withOffset:animated:", v3);
}

- (void)snapToMinMaxIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVTCollapsibleHeaderController *)self shouldSnapToMinOrMax])
  {
    [(AVTCollapsibleHeaderController *)self currentHeightForHeader];
    double v6 = v5;
    v7 = [(AVTCollapsibleHeaderController *)self scrollView];
    [v7 contentOffset];
    double v9 = v8;

    [(AVTCollapsibleHeaderController *)self minHeight];
    if (v6 != v10)
    {
      [(AVTCollapsibleHeaderController *)self maxHeight];
      if (v6 != v11)
      {
        [(AVTCollapsibleHeaderController *)self minHeight];
        if (v9 >= -v12
          && ([(AVTCollapsibleHeaderController *)self minHeight],
              double v14 = v6 - v13,
              [(AVTCollapsibleHeaderController *)self maxHeight],
              double v16 = v15,
              [(AVTCollapsibleHeaderController *)self minHeight],
              v14 <= (v16 - v17) * 0.5))
        {
          [(AVTCollapsibleHeaderController *)self collapseAnimated:v3];
        }
        else
        {
          [(AVTCollapsibleHeaderController *)self expandAnimated:v3];
        }
      }
    }
  }
}

- (void)updateHeaderForHeight:(double)a3 withOffset:(CGPoint)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  [(AVTCollapsibleHeaderController *)self setShouldResizeHeaderForScrolling:0];
  double v10 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel_animationDidUpdateWithDisplayLink_];
  double v11 = [MEMORY[0x263EFF9F0] mainRunLoop];
  [v10 addToRunLoop:v11 forMode:*MEMORY[0x263EFF478]];

  double v12 = (void *)MEMORY[0x263F1CB60];
  if (v5) {
    double v13 = 0.3;
  }
  else {
    double v13 = 0.0;
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __76__AVTCollapsibleHeaderController_updateHeaderForHeight_withOffset_animated___block_invoke;
  v19[3] = &unk_263FF04C8;
  v19[4] = self;
  *(double *)&v19[5] = a3;
  *(CGFloat *)&v19[6] = x;
  *(CGFloat *)&v19[7] = y;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __76__AVTCollapsibleHeaderController_updateHeaderForHeight_withOffset_animated___block_invoke_2;
  v15[3] = &unk_263FF04F0;
  id v16 = v10;
  double v17 = self;
  double v18 = a3;
  id v14 = v10;
  [v12 animateWithDuration:1 delay:v19 options:v15 animations:v13 completion:0.0];
}

void __76__AVTCollapsibleHeaderController_updateHeaderForHeight_withOffset_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) delegate];
    [v4 collapsibleHeaderController:*(void *)(a1 + 32) willUpdateHeaderToHeight:*(double *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) updateHeaderSizeForGlobalHeaderHeight:*(double *)(a1 + 40)];
  id v5 = [*(id *)(a1 + 32) scrollView];
  objc_msgSend(v5, "setContentOffset:", *(double *)(a1 + 48), *(double *)(a1 + 56));
}

uint64_t __76__AVTCollapsibleHeaderController_updateHeaderForHeight_withOffset_animated___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result = [*(id *)(a1 + 32) invalidate];
  if (a2)
  {
    id v5 = [*(id *)(a1 + 40) delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      v7 = [*(id *)(a1 + 40) delegate];
      [v7 collapsibleHeaderController:*(void *)(a1 + 40) didUpdateHeaderToHeight:*(double *)(a1 + 48)];
    }
    [*(id *)(a1 + 40) setSingleTouchOffset:0.0];
    [*(id *)(a1 + 40) setCurrentScrollDirection:0];
    double v8 = [*(id *)(a1 + 40) scrollView];
    [v8 contentOffset];
    [*(id *)(a1 + 40) setPreviousOffset:v9];

    double v10 = *(void **)(a1 + 40);
    return [v10 setShouldResizeHeaderForScrolling:1];
  }
  return result;
}

- (void)animationDidUpdateWithDisplayLink:(id)a3
{
  v4 = [(AVTCollapsibleHeaderController *)self headerView];
  uint64_t v5 = [v4 layer];
  id v10 = [(id)v5 presentationLayer];

  [v10 bounds];
  double v7 = v6;
  double v8 = [(AVTCollapsibleHeaderController *)self delegate];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if (v5)
  {
    double v9 = [(AVTCollapsibleHeaderController *)self delegate];
    [v9 collapsibleHeaderController:self isUpdatingHeaderWithIncrementalHeight:v7];
  }
}

- (void)scrollToTopPreservingHeaderHeight:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    [(AVTCollapsibleHeaderController *)self setShouldResizeHeaderForScrolling:0];
    [(AVTCollapsibleHeaderController *)self currentHeightForHeader];
    -[AVTCollapsibleHeaderController topContentOffsetWithHeaderHeight:](self, "topContentOffsetWithHeaderHeight:");
    double v7 = v6;
    double v9 = v8;
    id v10 = [(AVTCollapsibleHeaderController *)self scrollView];
    objc_msgSend(v10, "setContentOffset:animated:", v4, v7, v9);

    double v11 = [(AVTCollapsibleHeaderController *)self scrollView];
    [v11 contentOffset];
    [(AVTCollapsibleHeaderController *)self setPreviousOffset:v12];

    [(AVTCollapsibleHeaderController *)self setShouldResizeHeaderForScrolling:1];
  }
  else
  {
    [(AVTCollapsibleHeaderController *)self scrollToTopAnimated:a4];
  }
}

- (CGPoint)topContentOffsetWithHeaderHeight:(double)a3
{
  uint64_t v5 = [(AVTCollapsibleHeaderController *)self scrollView];
  [v5 contentOffset];
  double v7 = v6;

  double v8 = [(AVTCollapsibleHeaderController *)self scrollView];
  [v8 _effectiveContentInset];
  double v10 = v9;
  [(AVTCollapsibleHeaderController *)self maxHeight];
  double v12 = v11 - a3 - v10;

  double v13 = v7;
  double v14 = v12;
  result.CGFloat y = v14;
  result.CGFloat x = v13;
  return result;
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [(AVTCollapsibleHeaderController *)self scrollView];
  uint64_t v5 = [(AVTCollapsibleHeaderController *)self scrollView];
  [v5 contentOffset];
  double v7 = v6;
  double v8 = [(AVTCollapsibleHeaderController *)self scrollView];
  [v8 _effectiveContentInset];
  objc_msgSend(v10, "setContentOffset:animated:", v3, v7, -v9);
}

- (BOOL)shouldResizeGivenMarginalScrollDistancesForScrollDirection:(unint64_t)a3
{
  if (a3 != 2) {
    return a3 == 1
  }
        && (([(AVTCollapsibleHeaderController *)self singleTouchOffset], v4 >= 0.0)
          ? (double v5 = v4)
          : (double v5 = -v4),
            [(AVTCollapsibleHeaderController *)self expandMarginalScrollDistance],
            v5 > v6);
  [(AVTCollapsibleHeaderController *)self singleTouchOffset];
  if (v8 >= 0.0) {
    double v9 = v8;
  }
  else {
    double v9 = -v8;
  }
  [(AVTCollapsibleHeaderController *)self collapseMarginalScrollDistance];
  return v9 > v10;
}

- (BOOL)shouldResizeGivenScrollDirection:(unint64_t)a3 currentHeaderHeight:(double)a4 targetHeaderHeight:(double)a5
{
  if (a3 == 2 && a5 < a4) {
    return 1;
  }
  return a5 > a4 && a3 == 1;
}

- (void)updateHeaderHeightToMatchScrollViewStateForScrollDirection:(unint64_t)a3 animated:(BOOL)a4
{
  double v6 = [(AVTCollapsibleHeaderController *)self scrollView];
  [v6 contentOffset];
  double v8 = v7;
  double v9 = [(AVTCollapsibleHeaderController *)self scrollView];
  [v9 contentInset];
  -[AVTCollapsibleHeaderController headerHeightForContentOffset:contentInset:](self, "headerHeightForContentOffset:contentInset:", v8, v10, v11, v12, v13);
  double v15 = v14;

  [(AVTCollapsibleHeaderController *)self currentHeightForHeader];
  double v17 = v16;
  if ([(AVTCollapsibleHeaderController *)self shouldResizeGivenMarginalScrollDistancesForScrollDirection:a3]&& [(AVTCollapsibleHeaderController *)self shouldResizeGivenScrollDirection:a3 currentHeaderHeight:v17 targetHeaderHeight:v15])
  {
    double v18 = [(AVTCollapsibleHeaderController *)self delegate];
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      double v20 = [(AVTCollapsibleHeaderController *)self delegate];
      [v20 collapsibleHeaderController:self willUpdateHeaderToHeight:v15];
    }
    [(AVTCollapsibleHeaderController *)self updateHeaderSizeForGlobalHeaderHeight:v15];
    double v21 = [(AVTCollapsibleHeaderController *)self delegate];
    char v22 = objc_opt_respondsToSelector();

    if (v22)
    {
      id v23 = [(AVTCollapsibleHeaderController *)self delegate];
      [v23 collapsibleHeaderController:self didUpdateHeaderToHeight:v15];
    }
  }
}

- (double)headerHeightForContentOffset:(double)a3 contentInset:(UIEdgeInsets)a4
{
  double v6 = [(AVTCollapsibleHeaderController *)self scrollView];
  [v6 contentSize];
  double v8 = v7;
  double v10 = v9;
  double v11 = *MEMORY[0x263F001B0];
  double v12 = *(double *)(MEMORY[0x263F001B0] + 8);

  if (v8 != v11 || v10 != v12)
  {
    if (![(AVTCollapsibleHeaderController *)self shouldOnlyExpandWhenScrollingAtEdge])
    {
      [(AVTCollapsibleHeaderController *)self previousOffset];
      double v41 = v40;
      [(AVTCollapsibleHeaderController *)self currentHeightForHeader];
      double v43 = v42;
      [(AVTCollapsibleHeaderController *)self scrollToCompressionMultiplier];
      double v45 = v44;
      CGRect v46 = [(AVTCollapsibleHeaderController *)self scrollView];
      [v46 _effectiveContentInset];
      double v48 = v47;

      [(AVTCollapsibleHeaderController *)self currentHeightForHeader];
      double v50 = v49;
      [(AVTCollapsibleHeaderController *)self minHeight];
      double v52 = v50 - v51;
      [(AVTCollapsibleHeaderController *)self scrollToCompressionMultiplier];
      if (v52 * v53 + a3 < a3)
      {
        [(AVTCollapsibleHeaderController *)self minHeight];
LABEL_23:
        double v55 = v54;
        goto LABEL_24;
      }
      double v38 = -v48;
      if (-v48 <= a3)
      {
        double v55 = v43 + (v41 - a3) / v45;
LABEL_24:
        [(AVTCollapsibleHeaderController *)self minHeight];
        if (v57 >= v55) {
          double v55 = v57;
        }
        [(AVTCollapsibleHeaderController *)self maxHeight];
        if (result >= v55) {
          return v55;
        }
        return result;
      }
LABEL_21:
      [(AVTCollapsibleHeaderController *)self maxHeight];
      goto LABEL_23;
    }
    double v14 = [(AVTCollapsibleHeaderController *)self scrollView];
    [v14 _effectiveContentInset];
    double v16 = v15;
    double v17 = -v15;

    double v18 = [(AVTCollapsibleHeaderController *)self headerView];
    [v18 frame];
    double v20 = v19;
    double v21 = [(AVTCollapsibleHeaderController *)self scrollView];
    [v21 frame];
    double v23 = v20 - v22;

    double v24 = -a3;
    if (v17 > a3) {
      double v24 = v16;
    }
    double v60 = v24;
    [(AVTCollapsibleHeaderController *)self additionalTopContentInset];
    double v26 = v25;
    [(AVTCollapsibleHeaderController *)self previousOffset];
    double v28 = v27 - a3;
    [(AVTCollapsibleHeaderController *)self currentHeightForHeader];
    double v30 = v29;
    [(AVTCollapsibleHeaderController *)self scrollToCompressionMultiplier];
    double v32 = v31;
    v33 = [(AVTCollapsibleHeaderController *)self scrollView];
    [v33 contentSize];
    double v35 = v34;
    v36 = [(AVTCollapsibleHeaderController *)self scrollView];
    [v36 bounds];
    if (v35 - (v37 - v23) > a3)
    {

      goto LABEL_20;
    }
    if (v28 <= 0.0)
    {
      BOOL v56 = [(AVTCollapsibleHeaderController *)self shouldCollapseOnBottomBounceScroll];

      if (v56)
      {
LABEL_20:
        if (v17 <= a3)
        {
          [(AVTCollapsibleHeaderController *)self minHeight];
          if (v30 + v28 / v32 >= v58) {
            double v59 = v30 + v28 / v32;
          }
          else {
            double v59 = v58;
          }
          if (v60 - v23 - v26 >= v58) {
            double v58 = v60 - v23 - v26;
          }
          if (v28 > 0.0) {
            double v55 = v58;
          }
          else {
            double v55 = v59;
          }
          goto LABEL_24;
        }
        goto LABEL_21;
      }
    }
    else
    {
    }
    [(AVTCollapsibleHeaderController *)self currentHeightForHeader];
    goto LABEL_23;
  }
  [(AVTCollapsibleHeaderController *)self maxHeight];
  return result;
}

- (void)updateHeaderSizeForGlobalHeaderHeight:(double)a3
{
  double v5 = [(AVTCollapsibleHeaderController *)self headerView];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = [(AVTCollapsibleHeaderController *)self headerView];
  objc_msgSend(v12, "setFrame:", v7, v9, v11, a3);
}

- (double)currentHeightForHeader
{
  v2 = [(AVTCollapsibleHeaderController *)self headerView];
  [v2 bounds];
  double v4 = v3;

  return v4;
}

- (UIEdgeInsets)updatedScrollViewInsetsFromExistingInsets:(UIEdgeInsets)a3
{
  CGFloat bottom = a3.bottom;
  double v5 = [(AVTCollapsibleHeaderController *)self scrollView];
  [v5 _systemContentInset];
  double v7 = v6;

  double v8 = 0.0;
  if (v7 > 0.0)
  {
    double v9 = [(AVTCollapsibleHeaderController *)self scrollView];
    [v9 _systemContentInset];
    double v11 = v10;
    id v12 = [(AVTCollapsibleHeaderController *)self headerView];
    [v12 frame];
    double v14 = v13;
    double v15 = [(AVTCollapsibleHeaderController *)self scrollView];
    [v15 frame];
    double v8 = v11 - (v14 - v16);
  }
  [(AVTCollapsibleHeaderController *)self maxHeight];
  double v18 = v17;
  [(AVTCollapsibleHeaderController *)self additionalTopContentInset];
  double v20 = v18 + v19 - v8;
  double v21 = [(AVTCollapsibleHeaderController *)self scrollView];
  [v21 contentInset];
  double v23 = v22;
  double v25 = v24;

  double v26 = v20;
  double v27 = v23;
  double v28 = bottom;
  double v29 = v25;
  result.right = v29;
  result.CGFloat bottom = v28;
  result.left = v27;
  result.top = v26;
  return result;
}

- (void)updateInsetsIfNeeded
{
  double v3 = [(AVTCollapsibleHeaderController *)self scrollView];
  [v3 contentInset];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[AVTCollapsibleHeaderController updatedScrollViewInsetsFromExistingInsets:](self, "updatedScrollViewInsetsFromExistingInsets:", v5, v7, v9, v11);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v20 = [(AVTCollapsibleHeaderController *)self scrollView];
  [v20 verticalScrollIndicatorInsets];
  double v31 = v22;
  double v32 = v21;
  double v30 = v23;

  if (v15 != v7 || v13 != v5 || v19 != v11 || v17 != v9)
  {
    [(AVTCollapsibleHeaderController *)self previousOffset];
    [(AVTCollapsibleHeaderController *)self setPreviousOffset:v5 - v13 + v27];
    double v28 = [(AVTCollapsibleHeaderController *)self scrollView];
    objc_msgSend(v28, "setContentInset:", v13, v15, v17, v19);

    id v29 = [(AVTCollapsibleHeaderController *)self scrollView];
    objc_msgSend(v29, "setScrollIndicatorInsets:", v13, v32, v31, v30);
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVTCollapsibleHeaderController;
  if (-[AVTCollapsibleHeaderController respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    double v5 = [(AVTCollapsibleHeaderController *)self scrollViewDelegate];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVTCollapsibleHeaderController;
  double v5 = -[AVTCollapsibleHeaderController methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  if (!v5)
  {
    double v6 = [(AVTCollapsibleHeaderController *)self scrollViewDelegate];
    double v5 = [v6 methodSignatureForSelector:a3];
  }
  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  double v5 = [(AVTCollapsibleHeaderController *)self scrollViewDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_super v7 = [(AVTCollapsibleHeaderController *)self scrollViewDelegate];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AVTCollapsibleHeaderController;
    objc_super v7 = [(AVTCollapsibleHeaderController *)&v9 forwardingTargetForSelector:a3];
  }
  return v7;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v25 = a3;
  if ([(AVTCollapsibleHeaderController *)self shouldResizeHeaderForScrolling])
  {
    [(AVTCollapsibleHeaderController *)self updateInsetsIfNeeded];
    [(AVTCollapsibleHeaderController *)self previousOffset];
    double v5 = v4;
    id v6 = v25;
    [v6 _verticalVelocity];
    if (v7 == 0.0)
    {
      [v6 contentOffset];
      double v9 = v8;

      double v10 = v5 - v9;
      uint64_t v11 = 2;
      if (v5 - v9 >= 0.0) {
        uint64_t v11 = 1;
      }
      if (v5 - v9 == 0.0) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = v11;
      }
    }
    else
    {
      [v6 _verticalVelocity];
      double v14 = v13;

      if (v14 <= 0.0) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = 2;
      }
    }
    if ([(AVTCollapsibleHeaderController *)self currentScrollDirection] != v12)
    {
      [(AVTCollapsibleHeaderController *)self setSingleTouchOffset:0.0];
      [(AVTCollapsibleHeaderController *)self setCurrentScrollDirection:v12];
    }
    [(AVTCollapsibleHeaderController *)self singleTouchOffset];
    double v16 = v15;
    [(AVTCollapsibleHeaderController *)self previousOffset];
    double v18 = v17;
    double v19 = [(AVTCollapsibleHeaderController *)self scrollView];
    [v19 contentOffset];
    [(AVTCollapsibleHeaderController *)self setSingleTouchOffset:v16 + v18 - v20];

    [(AVTCollapsibleHeaderController *)self updateHeaderHeightToMatchScrollViewStateForScrollDirection:v12 animated:1];
    [v6 contentOffset];
    [(AVTCollapsibleHeaderController *)self setPreviousOffset:v21];
  }
  double v22 = [(AVTCollapsibleHeaderController *)self scrollViewDelegate];
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    double v24 = [(AVTCollapsibleHeaderController *)self scrollViewDelegate];
    [v24 scrollViewDidScroll:v25];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v29 = a3;
  if ([(AVTCollapsibleHeaderController *)self shouldResizeHeaderForScrolling]
    && [(AVTCollapsibleHeaderController *)self shouldSnapToMinOrMax]
    && a5->y < 0.0)
  {
    [(AVTCollapsibleHeaderController *)self maxHeight];
    double v10 = v9 - a5->y;
    [v29 _effectiveContentInset];
    double v12 = v10 - v11;
    if (y > 0.0)
    {
      [(AVTCollapsibleHeaderController *)self minHeight];
      if (v12 <= v13)
      {
LABEL_15:
        [(AVTCollapsibleHeaderController *)self maxHeight];
        double v24 = v23 - v12;
        [v29 _effectiveContentInset];
        a5->double y = v24 - v25;
        goto LABEL_16;
      }
      goto LABEL_6;
    }
    if (y >= 0.0)
    {
      [(AVTCollapsibleHeaderController *)self minHeight];
      if (v12 <= v16) {
        goto LABEL_15;
      }
      [(AVTCollapsibleHeaderController *)self maxHeight];
      if (v12 >= v17) {
        goto LABEL_15;
      }
      [(AVTCollapsibleHeaderController *)self minHeight];
      double v19 = v12 - v18;
      [(AVTCollapsibleHeaderController *)self maxHeight];
      double v21 = v20;
      [(AVTCollapsibleHeaderController *)self minHeight];
      if (v19 < (v21 - v22) * 0.5)
      {
LABEL_6:
        [(AVTCollapsibleHeaderController *)self minHeight];
LABEL_14:
        double v12 = v14;
        goto LABEL_15;
      }
    }
    else
    {
      [(AVTCollapsibleHeaderController *)self maxHeight];
      if (v12 >= v15) {
        goto LABEL_15;
      }
    }
    [(AVTCollapsibleHeaderController *)self maxHeight];
    goto LABEL_14;
  }
LABEL_16:
  double v26 = [(AVTCollapsibleHeaderController *)self scrollViewDelegate];
  char v27 = objc_opt_respondsToSelector();

  if (v27)
  {
    double v28 = [(AVTCollapsibleHeaderController *)self scrollViewDelegate];
    objc_msgSend(v28, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v29, a5, x, y);
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  if (!v4)
  {
    [(AVTCollapsibleHeaderController *)self snapToMinMaxIfNeededAnimated:1];
    [(AVTCollapsibleHeaderController *)self setSingleTouchOffset:0.0];
    [(AVTCollapsibleHeaderController *)self setCurrentScrollDirection:0];
  }
  id v6 = [(AVTCollapsibleHeaderController *)self scrollViewDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(AVTCollapsibleHeaderController *)self scrollViewDelegate];
    [v8 scrollViewDidEndDragging:v9 willDecelerate:v4];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v7 = a3;
  if (([v7 isDragging] & 1) == 0)
  {
    [(AVTCollapsibleHeaderController *)self setSingleTouchOffset:0.0];
    [(AVTCollapsibleHeaderController *)self setCurrentScrollDirection:0];
  }
  BOOL v4 = [(AVTCollapsibleHeaderController *)self scrollViewDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AVTCollapsibleHeaderController *)self scrollViewDelegate];
    [v6 scrollViewDidEndDecelerating:v7];
  }
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (AVTCollapsibleHeaderControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (AVTCollapsibleHeaderControllerDelegate *)a3;
}

- (double)minHeight
{
  return self->_minHeight;
}

- (void)setMinHeight:(double)a3
{
  self->_minHeight = a3;
}

- (double)maxHeight
{
  return self->_maxHeight;
}

- (void)setMaxHeight:(double)a3
{
  self->_maxHeight = a3;
}

- (double)additionalTopContentInset
{
  return self->_additionalTopContentInset;
}

- (BOOL)shouldResizeHeaderForScrolling
{
  return self->_shouldResizeHeaderForScrolling;
}

- (void)setShouldResizeHeaderForScrolling:(BOOL)a3
{
  self->_shouldResizeHeaderForScrolling = a3;
}

- (BOOL)shouldSnapToMinOrMax
{
  return self->_shouldSnapToMinOrMax;
}

- (void)setShouldSnapToMinOrMax:(BOOL)a3
{
  self->_shouldSnapToMinOrMadouble x = a3;
}

- (BOOL)shouldOnlyExpandWhenScrollingAtEdge
{
  return self->_shouldOnlyExpandWhenScrollingAtEdge;
}

- (void)setShouldOnlyExpandWhenScrollingAtEdge:(BOOL)a3
{
  self->_shouldOnlyExpandWhenScrollingAtEdge = a3;
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegate);
  return (UIScrollViewDelegate *)WeakRetained;
}

- (void)setScrollViewDelegate:(id)a3
{
}

- (double)scrollToCompressionMultiplier
{
  return self->_scrollToCompressionMultiplier;
}

- (void)setScrollToCompressionMultiplier:(double)a3
{
  self->_scrollToCompressionMultiplier = a3;
}

- (double)expandMarginalScrollDistance
{
  return self->_expandMarginalScrollDistance;
}

- (void)setExpandMarginalScrollDistance:(double)a3
{
  self->_expandMarginalScrollDistance = a3;
}

- (double)collapseMarginalScrollDistance
{
  return self->_collapseMarginalScrollDistance;
}

- (void)setCollapseMarginalScrollDistance:(double)a3
{
  self->_collapseMarginalScrollDistance = a3;
}

- (BOOL)shouldPushContentOffsetOnExpandOrCollapse
{
  return self->_shouldPushContentOffsetOnExpandOrCollapse;
}

- (void)setShouldPushContentOffsetOnExpandOrCollapse:(BOOL)a3
{
  self->_shouldPushContentOffsetOnExpandOrCollapse = a3;
}

- (BOOL)shouldCollapseOnBottomBounceScroll
{
  return self->_shouldCollapseOnBottomBounceScroll;
}

- (void)setShouldCollapseOnBottomBounceScroll:(BOOL)a3
{
  self->_shouldCollapseOnBottomBounceScroll = a3;
}

- (double)previousOffset
{
  return self->_previousOffset;
}

- (void)setPreviousOffset:(double)a3
{
  self->_previousOffset = a3;
}

- (double)singleTouchOffset
{
  return self->_singleTouchOffset;
}

- (void)setSingleTouchOffset:(double)a3
{
  self->_singleTouchOffset = a3;
}

- (unint64_t)currentScrollDirection
{
  return self->_currentScrollDirection;
}

- (void)setCurrentScrollDirection:(unint64_t)a3
{
  self->_currentScrollDirection = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end