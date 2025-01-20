@interface CAMSemanticStylePicker
- (BOOL)_isScrollActive;
- (BOOL)_needsUpdateContentOffset;
- (BOOL)_selectedTileExpanded;
- (BOOL)expanded;
- (BOOL)hidesSelfWhenNotExpanded;
- (BOOL)scrollEnabled;
- (BOOL)scrollViewUserInteractionEnabled;
- (CAMFeedbackController)_feedbackController;
- (CAMSemanticStylePicker)initWithFrame:(CGRect)a3;
- (CAMSemanticStylePickerDelegate)delegate;
- (CGPoint)_contentOffsetForIndex:(unint64_t)a3;
- (CGRect)modelStyleRectAtIndex:(unint64_t)a3;
- (CGRect)presentatationStyleRectAtIndex:(unint64_t)a3;
- (NSMutableArray)_spacerViews;
- (NSMutableArray)_tileViews;
- (UIColor)materialColor;
- (UIPageControl)pageControl;
- (UIScrollView)_scrollView;
- (double)_fractionalIndexForContentOffset;
- (double)_fractionalIndexForContentOffset:(CGPoint)a3;
- (double)contentBottomMargin;
- (double)spacerWidth;
- (id)_tileFrames;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)material;
- (int64_t)pageControlMaxNumberOfDots;
- (unint64_t)_expansionAnimationCounter;
- (unint64_t)minimumScrollablePageIndex;
- (unint64_t)numberOfStyles;
- (unint64_t)selectedStyleIndex;
- (void)_handlePageControlValueChanged:(id)a3;
- (void)_performHaptics;
- (void)_prepareHaptics;
- (void)_setExpandedAnimationCounter:(unint64_t)a3;
- (void)_setNeedsUpdateContentOffset:(BOOL)a3;
- (void)_setSelectedStyleIndex:(unint64_t)a3 shouldDelegate:(BOOL)a4 shouldUpdateLayout:(BOOL)a5 animated:(BOOL)a6;
- (void)_setSelectedTileExpanded:(BOOL)a3;
- (void)_updateContentScrollInset;
- (void)_updateMaterialOpacityWithDuration:(double)a3;
- (void)_updateScrollViewContentOffset;
- (void)_updateTileAlphas;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContentBottomMargin:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setFrame:(CGRect)a3;
- (void)setHidesSelfWhenNotExpanded:(BOOL)a3;
- (void)setMaterial:(int64_t)a3;
- (void)setMaterial:(int64_t)a3 withDuration:(double)a4;
- (void)setMaterialColor:(id)a3;
- (void)setMinimumScrollablePageIndex:(unint64_t)a3;
- (void)setNumberOfStyles:(unint64_t)a3;
- (void)setPageControlMaxNumberOfDots:(int64_t)a3;
- (void)setScrollEnabled:(BOOL)a3;
- (void)setScrollViewUserInteractionEnabled:(BOOL)a3;
- (void)setSelectedStyleIndex:(unint64_t)a3;
- (void)setSelectedStyleIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)setSpacerWidth:(double)a3;
@end

@implementation CAMSemanticStylePicker

- (CAMSemanticStylePicker)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)CAMSemanticStylePicker;
  v3 = -[CAMSemanticStylePicker initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIPageControl *)objc_alloc_init(MEMORY[0x263F829F0]);
    pageControl = v3->_pageControl;
    v3->_pageControl = v4;

    [(UIPageControl *)v3->_pageControl addTarget:v3 action:sel__handlePageControlValueChanged_ forControlEvents:4096];
    [(UIPageControl *)v3->_pageControl addTarget:v3 action:sel__handlePageControlTouchDown_ forControlEvents:1];
    [(UIPageControl *)v3->_pageControl setAlpha:0.0];
    [(CAMSemanticStylePicker *)v3 addSubview:v3->_pageControl];
    v6 = (UIScrollView *)objc_alloc_init(MEMORY[0x263F82B88]);
    scrollView = v3->__scrollView;
    v3->__scrollView = v6;

    [(UIScrollView *)v3->__scrollView setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)v3->__scrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v3->__scrollView setPagingEnabled:1];
    [(UIScrollView *)v3->__scrollView setClipsToBounds:0];
    [(UIScrollView *)v3->__scrollView setDelegate:v3];
    [(UIScrollView *)v3->__scrollView setContentInsetAdjustmentBehavior:2];
    [(UIScrollView *)v3->__scrollView _setAutomaticContentOffsetAdjustmentEnabled:0];
    if ([(CAMSemanticStylePicker *)v3 effectiveUserInterfaceLayoutDirection] == 1)
    {
      CGAffineTransformMakeRotation(&v20, 3.14159265);
      v8 = v3->__scrollView;
      CGAffineTransform v19 = v20;
      [(UIScrollView *)v8 setTransform:&v19];
    }
    [(CAMSemanticStylePicker *)v3 addSubview:v3->__scrollView];
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    tileViews = v3->__tileViews;
    v3->__tileViews = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    spacerViews = v3->__spacerViews;
    v3->__spacerViews = v11;

    v3->_spacerWidth = 7.0;
    id v13 = objc_alloc_init(MEMORY[0x263F82E00]);
    [(NSMutableArray *)v3->__spacerViews addObject:v13];
    [(UIScrollView *)v3->__scrollView addSubview:v13];
    v3->__selectedTileExpanded = 1;
    v3->_hidesSelfWhenNotExpanded = 1;
    v14 = +[CAMCaptureCapabilities capabilities];
    int v15 = [v14 allowHaptics];

    if (v15)
    {
      v16 = objc_alloc_init(CAMFeedbackController);
      feedbackController = v3->__feedbackController;
      v3->__feedbackController = v16;
    }
  }
  return v3;
}

- (BOOL)scrollEnabled
{
  v2 = [(CAMSemanticStylePicker *)self _scrollView];
  char v3 = [v2 isScrollEnabled];

  return v3;
}

- (void)setScrollEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAMSemanticStylePicker *)self _scrollView];
  [v4 setScrollEnabled:v3];
}

- (BOOL)scrollViewUserInteractionEnabled
{
  v2 = [(CAMSemanticStylePicker *)self _scrollView];
  char v3 = [v2 isUserInteractionEnabled];

  return v3;
}

- (void)setScrollViewUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAMSemanticStylePicker *)self _scrollView];
  [v4 setUserInteractionEnabled:v3];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CAMSemanticStylePicker *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)CAMSemanticStylePicker;
  -[CAMSemanticStylePicker setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11) {
    [(CAMSemanticStylePicker *)self _setNeedsUpdateContentOffset:1];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CAMSemanticStylePicker *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)CAMSemanticStylePicker;
  -[CAMSemanticStylePicker setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11) {
    [(CAMSemanticStylePicker *)self _setNeedsUpdateContentOffset:1];
  }
}

- (void)setSpacerWidth:(double)a3
{
  if (self->_spacerWidth != a3)
  {
    self->_spacerWidth = a3;
    [(CAMSemanticStylePicker *)self setNeedsLayout];
  }
}

- (void)setNumberOfStyles:(unint64_t)a3
{
  if (self->_numberOfStyles != a3)
  {
    self->_numberOfStyles = a3;
    v5 = [(CAMSemanticStylePicker *)self _tileViews];
    int64_t v6 = [v5 count] - a3;

    if (v6 < 1)
    {
      if (v6 < 0)
      {
        if (-v6 > 1) {
          uint64_t v13 = -v6;
        }
        else {
          uint64_t v13 = 1;
        }
        do
        {
          v14 = objc_alloc_init(CAMSemanticStylePickerTileOverlayView);
          int v15 = [(CAMSemanticStylePicker *)self _tileViews];
          [v15 addObject:v14];

          v16 = [(CAMSemanticStylePicker *)self _scrollView];
          [v16 addSubview:v14];

          id v17 = objc_alloc_init(MEMORY[0x263F82E00]);
          v18 = [(CAMSemanticStylePicker *)self _spacerViews];
          [v18 addObject:v17];

          CGAffineTransform v19 = [(CAMSemanticStylePicker *)self _scrollView];
          [v19 addSubview:v17];

          --v13;
        }
        while (v13);
      }
    }
    else
    {
      do
      {
        v7 = [(CAMSemanticStylePicker *)self _tileViews];
        double v8 = [v7 lastObject];

        [v8 removeFromSuperview];
        double v9 = [(CAMSemanticStylePicker *)self _tileViews];
        [v9 removeLastObject];

        double v10 = [(CAMSemanticStylePicker *)self _spacerViews];
        double v11 = [v10 lastObject];

        [v11 removeFromSuperview];
        v12 = [(CAMSemanticStylePicker *)self _spacerViews];
        [v12 removeLastObject];

        --v6;
      }
      while (v6);
    }
    CGAffineTransform v20 = [(CAMSemanticStylePicker *)self pageControl];
    [v20 setNumberOfPages:a3];

    if ([(CAMSemanticStylePicker *)self selectedStyleIndex] >= a3)
    {
      [(CAMSemanticStylePicker *)self setSelectedStyleIndex:a3 - 1];
      [(CAMSemanticStylePicker *)self _setSelectedStyleIndex:[(CAMSemanticStylePicker *)self selectedStyleIndex] shouldDelegate:1 shouldUpdateLayout:1 animated:0];
    }
    [(CAMSemanticStylePicker *)self _updateMaterialOpacityWithDuration:0.0];
    [(CAMSemanticStylePicker *)self _setNeedsUpdateContentOffset:1];
    [(CAMSemanticStylePicker *)self setNeedsLayout];
  }
}

- (void)setSelectedStyleIndex:(unint64_t)a3
{
}

- (void)setSelectedStyleIndex:(unint64_t)a3 animated:(BOOL)a4
{
}

- (void)_setSelectedStyleIndex:(unint64_t)a3 shouldDelegate:(BOOL)a4 shouldUpdateLayout:(BOOL)a5 animated:(BOOL)a6
{
  if (self->_selectedStyleIndex != a3)
  {
    BOOL v6 = a6;
    BOOL v7 = a5;
    BOOL v8 = a4;
    if (a5 && a6) {
      [(CAMSemanticStylePicker *)self layoutIfNeeded];
    }
    self->_selectedStyleIndedouble x = a3;
    double v11 = [(CAMSemanticStylePicker *)self pageControl];
    [v11 setCurrentPage:a3];

    if (v7)
    {
      [(CAMSemanticStylePicker *)self setNeedsLayout];
      double v12 = 0.3;
      if (!v6) {
        double v12 = 0.0;
      }
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __92__CAMSemanticStylePicker__setSelectedStyleIndex_shouldDelegate_shouldUpdateLayout_animated___block_invoke;
      v14[3] = &unk_263FA0208;
      v14[4] = self;
      +[CAMView animateIfNeededWithDuration:v14 animations:v12];
    }
    if (v8)
    {
      uint64_t v13 = [(CAMSemanticStylePicker *)self delegate];
      [v13 semanticStylePickerDidChangeSelectedStyle:self];
    }
  }
}

uint64_t __92__CAMSemanticStylePicker__setSelectedStyleIndex_shouldDelegate_shouldUpdateLayout_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateScrollViewContentOffset];
}

- (void)_setSelectedTileExpanded:(BOOL)a3
{
  if (self->__selectedTileExpanded != a3)
  {
    self->__selectedTileExpanded = a3;
    [(CAMSemanticStylePicker *)self setNeedsLayout];
  }
}

- (BOOL)expanded
{
  if ([(CAMSemanticStylePicker *)self hidesSelfWhenNotExpanded]
    && ([(CAMSemanticStylePicker *)self isHidden] & 1) != 0)
  {
    return 0;
  }
  else
  {
    return ![(CAMSemanticStylePicker *)self _selectedTileExpanded];
  }
}

- (void)setExpanded:(BOOL)a3
{
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v5 = a3;
  if ([(CAMSemanticStylePicker *)self expanded] != a3)
  {
    [(CAMSemanticStylePicker *)self setUserInteractionEnabled:v5];
    if (v5) {
      double v7 = 1.0;
    }
    else {
      double v7 = 0.0;
    }
    BOOL v8 = [(CAMSemanticStylePicker *)self hidesSelfWhenNotExpanded];
    if (a4)
    {
      if (v8) {
        [(CAMSemanticStylePicker *)self setHidden:0];
      }
      [(CAMSemanticStylePicker *)self layoutIfNeeded];
      [(CAMSemanticStylePicker *)self _setSelectedTileExpanded:v5 ^ 1];
      [(CAMSemanticStylePicker *)self _setExpandedAnimationCounter:[(CAMSemanticStylePicker *)self _expansionAnimationCounter] + 1];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __47__CAMSemanticStylePicker_setExpanded_animated___block_invoke;
      v12[3] = &unk_263FA04E0;
      v12[4] = self;
      *(double *)&v12[5] = v7;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __47__CAMSemanticStylePicker_setExpanded_animated___block_invoke_2;
      v10[3] = &unk_263FA1328;
      v10[4] = self;
      BOOL v11 = !v5;
      [MEMORY[0x263F82E00] animateWithDuration:2 delay:v12 usingSpringWithDamping:v10 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:1.0];
    }
    else
    {
      if (v8) {
        [(CAMSemanticStylePicker *)self setHidden:v5 ^ 1];
      }
      [(CAMSemanticStylePicker *)self _setSelectedTileExpanded:v5 ^ 1];
      id v9 = [(CAMSemanticStylePicker *)self pageControl];
      [v9 setAlpha:v7];
    }
  }
}

uint64_t __47__CAMSemanticStylePicker_setExpanded_animated___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) pageControl];
  [v3 setAlpha:v2];

  id v4 = *(void **)(a1 + 32);
  return [v4 layoutIfNeeded];
}

uint64_t __47__CAMSemanticStylePicker_setExpanded_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setExpandedAnimationCounter:", objc_msgSend(*(id *)(a1 + 32), "_expansionAnimationCounter") - 1);
  uint64_t result = [*(id *)(a1 + 32) _expansionAnimationCounter];
  if (!result)
  {
    uint64_t result = [*(id *)(a1 + 32) hidesSelfWhenNotExpanded];
    if (result)
    {
      uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
      id v4 = *(void **)(a1 + 32);
      return [v4 setHidden:v3];
    }
  }
  return result;
}

- (CGRect)presentatationStyleRectAtIndex:(unint64_t)a3
{
  BOOL v5 = [(CAMSemanticStylePicker *)self _tileViews];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    double v21 = *MEMORY[0x263F001A0];
    double v22 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v23 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v24 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  else
  {
    double v7 = [(CAMSemanticStylePicker *)self _tileViews];
    BOOL v8 = [v7 objectAtIndex:a3];

    id v9 = [v8 layer];
    double v10 = [v9 presentationLayer];
    if (v10)
    {
      BOOL v11 = [v8 layer];
      double v12 = [v11 presentationLayer];
      [v12 frame];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
    }
    else
    {
      [v8 frame];
      double v14 = v25;
      double v16 = v26;
      double v18 = v27;
      double v20 = v28;
    }

    v29 = [v8 superview];
    -[CAMSemanticStylePicker convertRect:fromView:](self, "convertRect:fromView:", v29, v14, v16, v18, v20);
    double v21 = v30;
    double v22 = v31;
    double v23 = v32;
    double v24 = v33;
  }
  double v34 = v21;
  double v35 = v22;
  double v36 = v23;
  double v37 = v24;
  result.size.double height = v37;
  result.size.double width = v36;
  result.origin.double y = v35;
  result.origin.double x = v34;
  return result;
}

- (CGRect)modelStyleRectAtIndex:(unint64_t)a3
{
  BOOL v5 = [(CAMSemanticStylePicker *)self _tileViews];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    double v21 = *MEMORY[0x263F001A0];
    double v23 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v25 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v27 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  else
  {
    double v7 = [(CAMSemanticStylePicker *)self _tileViews];
    BOOL v8 = [v7 objectAtIndex:a3];

    id v9 = [(CAMSemanticStylePicker *)self _tileFrames];
    double v10 = [v9 objectAtIndexedSubscript:a3];
    [v10 CGRectValue];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    double v19 = [v8 superview];
    -[CAMSemanticStylePicker convertRect:fromView:](self, "convertRect:fromView:", v19, v12, v14, v16, v18);
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
  }
  double v28 = v21;
  double v29 = v23;
  double v30 = v25;
  double v31 = v27;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (void)setMinimumScrollablePageIndex:(unint64_t)a3
{
  if (self->_minimumScrollablePageIndex != a3)
  {
    self->_minimumScrollablePageIndedouble x = a3;
    [(CAMSemanticStylePicker *)self _updateContentScrollInset];
  }
}

- (void)_updateContentScrollInset
{
  [(CAMSemanticStylePicker *)self _contentOffsetForIndex:[(CAMSemanticStylePicker *)self minimumScrollablePageIndex]];
  double v4 = -v3;
  id v5 = [(CAMSemanticStylePicker *)self _scrollView];
  objc_msgSend(v5, "_setContentScrollInset:", 0.0, v4, 0.0, 0.0);
}

- (BOOL)_isScrollActive
{
  double v2 = [(CAMSemanticStylePicker *)self _scrollView];
  if ([v2 isTracking]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 isDecelerating];
  }

  return v3;
}

- (CGPoint)_contentOffsetForIndex:(unint64_t)a3
{
  if ([(CAMSemanticStylePicker *)self numberOfStyles])
  {
    id v5 = [(CAMSemanticStylePicker *)self _scrollView];
    [v5 frame];
    double v7 = v6;

    double v8 = v7 * (double)a3;
    double v9 = 0.0;
  }
  else
  {
    double v8 = *MEMORY[0x263F00148];
    double v9 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (double)_fractionalIndexForContentOffset
{
  char v3 = [(CAMSemanticStylePicker *)self _scrollView];
  [v3 contentOffset];
  -[CAMSemanticStylePicker _fractionalIndexForContentOffset:](self, "_fractionalIndexForContentOffset:");
  double v5 = v4;

  return v5;
}

- (double)_fractionalIndexForContentOffset:(CGPoint)a3
{
  double x = a3.x;
  double v4 = [(CAMSemanticStylePicker *)self _scrollView];
  [v4 frame];
  double v6 = v5;

  return x / v6;
}

- (void)_updateScrollViewContentOffset
{
  [(CAMSemanticStylePicker *)self _contentOffsetForIndex:[(CAMSemanticStylePicker *)self selectedStyleIndex]];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(CAMSemanticStylePicker *)self _scrollView];
  objc_msgSend(v7, "setContentOffset:", v4, v6);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CAMSemanticStylePicker;
  -[CAMSemanticStylePicker hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v5 = (CAMSemanticStylePicker *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    double v6 = [(CAMSemanticStylePicker *)self _scrollView];
    int v7 = [v6 isScrollEnabled];

    if (v7)
    {
      double v5 = [(CAMSemanticStylePicker *)self _scrollView];
    }
    else
    {
      double v5 = 0;
    }
  }
  return v5;
}

- (void)setMaterial:(int64_t)a3
{
}

- (void)setMaterial:(int64_t)a3 withDuration:(double)a4
{
  if (self->_material != a3)
  {
    self->_material = a3;
    [(CAMSemanticStylePicker *)self _updateMaterialOpacityWithDuration:a4];
  }
}

- (void)setMaterialColor:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  double v4 = (UIColor *)a3;
  if (([(UIColor *)self->_materialColor isEqual:v4] & 1) == 0)
  {
    self->_materialColor = v4;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v5 = [(CAMSemanticStylePicker *)self _tileViews];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setMaterialColor:v4];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(CAMSemanticStylePicker *)self _updateMaterialOpacityWithDuration:0.0];
  }
}

- (void)_updateMaterialOpacityWithDuration:(double)a3
{
  unint64_t v5 = [(CAMSemanticStylePicker *)self material];
  uint64_t v6 = 0;
  if (v5 <= 4) {
    uint64_t v6 = qword_209C7AE90[v5];
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__CAMSemanticStylePicker__updateMaterialOpacityWithDuration___block_invoke;
  v7[3] = &unk_263FA04E0;
  v7[4] = self;
  v7[5] = v6;
  +[CAMView animateIfNeededWithDuration:4 options:v7 animations:0 completion:a3];
}

void __61__CAMSemanticStylePicker__updateMaterialOpacityWithDuration___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v2 = [*(id *)(a1 + 32) _spacerViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v19 + 1) + 8 * v6);
        uint64_t v8 = [*(id *)(a1 + 32) materialColor];
        uint64_t v9 = [v8 colorWithAlphaComponent:*(double *)(a1 + 40)];
        [v7 setBackgroundColor:v9];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v10 = objc_msgSend(*(id *)(a1 + 32), "_tileViews", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) setCornerTargetAlpha:*(double *)(a1 + 40)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)setPageControlMaxNumberOfDots:(int64_t)a3
{
  if (self->_pageControlMaxNumberOfDots != a3)
  {
    self->_pageControlMaxNumberOfDots = a3;
    [(CAMSemanticStylePicker *)self setNeedsLayout];
  }
}

- (id)_tileFrames
{
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v4 = [(CAMSemanticStylePicker *)self _tileViews];
  uint64_t v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  [(CAMSemanticStylePicker *)self bounds];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  double v11 = v10;
  uint64_t v13 = v12;
  [(CAMSemanticStylePicker *)self spacerWidth];
  double v15 = v14;
  double v16 = v11 + -20.0 + v14 * -2.0;
  UIRectCenteredIntegralRectScale();
  double v18 = v17;
  [(CAMSemanticStylePicker *)self _fractionalIndexForContentOffset];
  CEKProgressClamped();
  UICeilToViewScale();
  uint64_t v20 = v19;
  long long v21 = [(CAMSemanticStylePicker *)self _tileViews];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __37__CAMSemanticStylePicker__tileFrames__block_invoke;
  v26[3] = &unk_263FA3A60;
  double v28 = v15 + 10.0 - v18;
  double v29 = v16;
  double v30 = v15;
  uint64_t v31 = v7;
  uint64_t v32 = v9;
  double v33 = v11;
  v26[4] = self;
  uint64_t v34 = v13;
  uint64_t v35 = v20;
  id v22 = v5;
  id v27 = v22;
  [v21 enumerateObjectsUsingBlock:v26];

  double v23 = v27;
  id v24 = v22;

  return v24;
}

void __37__CAMSemanticStylePicker__tileFrames__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 48) + (double)a3 * (v5 + *(double *)(a1 + 64));
  double v7 = *(double *)(a1 + 96);
  if ([*(id *)(a1 + 32) _selectedTileExpanded])
  {
    if ([*(id *)(a1 + 32) selectedStyleIndex] - 1 == a3)
    {
      double v8 = *(double *)(a1 + 104);
LABEL_8:
      double v5 = v5 - v8;
      goto LABEL_9;
    }
    if ([*(id *)(a1 + 32) selectedStyleIndex] == a3)
    {
      double v9 = *(double *)(a1 + 104);
      double v6 = v6 - v9;
      double v5 = v5 + v9 * 2.0;
      goto LABEL_9;
    }
    if ([*(id *)(a1 + 32) selectedStyleIndex] + 1 == a3)
    {
      double v8 = *(double *)(a1 + 104);
      double v6 = v6 + v8;
      goto LABEL_8;
    }
  }
LABEL_9:
  objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v6, 0.0, v5, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) addObject:v10];
}

- (void)layoutSubviews
{
  [(CAMSemanticStylePicker *)self bounds];
  uint64_t v41 = v4;
  uint64_t v42 = v3;
  double v6 = v5;
  double v8 = v7;
  [(CAMSemanticStylePicker *)self spacerWidth];
  double v10 = v9;
  double v43 = v9 + v6 + 10.0;
  double v11 = v9 + v6 + -20.0 + v9 * -2.0;
  UIRectCenteredIntegralRectScale();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  uint64_t v20 = [(CAMSemanticStylePicker *)self _scrollView];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  double v21 = v11 * (double)[(CAMSemanticStylePicker *)self numberOfStyles];
  id v22 = [(CAMSemanticStylePicker *)self _scrollView];
  objc_msgSend(v22, "setContentSize:", v21, v8);

  double v23 = [(CAMSemanticStylePicker *)self _tileFrames];
  id v24 = [(CAMSemanticStylePicker *)self _tileViews];
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __40__CAMSemanticStylePicker_layoutSubviews__block_invoke;
  v52[3] = &unk_263FA3A88;
  id v25 = v23;
  id v53 = v25;
  [v24 enumerateObjectsUsingBlock:v52];

  double v26 = [(CAMSemanticStylePicker *)self _spacerViews];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __40__CAMSemanticStylePicker_layoutSubviews__block_invoke_2;
  v44[3] = &unk_263FA3AB0;
  double v46 = v43;
  double v47 = v10;
  v44[4] = self;
  id v45 = v25;
  uint64_t v48 = v42;
  uint64_t v49 = v41;
  double v50 = v6;
  double v51 = v8;
  id v27 = v25;
  [v26 enumerateObjectsUsingBlock:v44];

  double v28 = [(CAMSemanticStylePicker *)self pageControl];
  uint64_t v29 = [v28 numberOfPages];

  if ([(CAMSemanticStylePicker *)self pageControlMaxNumberOfDots] >= 1)
  {
    int64_t v30 = [(CAMSemanticStylePicker *)self pageControlMaxNumberOfDots];
    if (v29 >= v30) {
      uint64_t v29 = v30;
    }
  }
  uint64_t v31 = [(CAMSemanticStylePicker *)self pageControl];
  [v31 sizeForNumberOfPages:v29];
  double v33 = v32;
  double v35 = v34;

  [(CAMSemanticStylePicker *)self contentBottomMargin];
  UIPointRoundToViewScale();
  double v37 = v36;
  double v39 = v38;
  v40 = [(CAMSemanticStylePicker *)self pageControl];
  objc_msgSend(v40, "setFrame:", v37, v39, v33, v35 + 20.0);

  if ([(CAMSemanticStylePicker *)self _needsUpdateContentOffset])
  {
    [(CAMSemanticStylePicker *)self _setNeedsUpdateContentOffset:0];
    [(CAMSemanticStylePicker *)self _updateScrollViewContentOffset];
  }
  [(CAMSemanticStylePicker *)self _updateTileAlphas];
  [(CAMSemanticStylePicker *)self _updateContentScrollInset];
}

void __40__CAMSemanticStylePicker_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 objectAtIndexedSubscript:a3];
  [v6 CGRectValue];
  objc_msgSend(v5, "setFrame:");
}

void __40__CAMSemanticStylePicker_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v31 = a2;
  id v6 = [v5 _spacerViews];
  uint64_t v7 = [v6 count] - 1;

  BOOL v8 = v7 == a3 || a3 == 0;
  uint64_t v9 = 56;
  if (v8) {
    uint64_t v9 = 48;
  }
  double v10 = *(double *)(a1 + v9);
  double v11 = *(void **)(a1 + 40);
  if (v7 == a3)
  {
    double v12 = [v11 lastObject];
    [v12 CGRectValue];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;

    v33.origin.double x = v14;
    v33.origin.double y = v16;
    v33.size.double width = v18;
    v33.size.double height = v20;
    double MaxX = CGRectGetMaxX(v33);
  }
  else
  {
    id v22 = [v11 objectAtIndexedSubscript:a3];
    [v22 CGRectValue];
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;

    v34.origin.double x = v24;
    v34.origin.double y = v26;
    v34.size.double width = v28;
    v34.size.double height = v30;
    double MaxX = CGRectGetMinX(v34) - v10;
  }
  objc_msgSend(v31, "setFrame:", MaxX, 0.0, v10, *(double *)(a1 + 88));
}

- (void)_updateTileAlphas
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v3 = [(CAMSemanticStylePicker *)self _tileViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        [v8 frame];
        double v10 = v9;
        double v12 = v11;
        double v14 = v13;
        double v16 = v15;
        double v17 = [v8 superview];
        -[CAMSemanticStylePicker convertRect:fromView:](self, "convertRect:fromView:", v17, v10, v12, v14, v16);
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;

        [(CAMSemanticStylePicker *)self bounds];
        v37.origin.double x = v26;
        v37.origin.double y = v27;
        v37.size.double width = v28;
        v37.size.double height = v29;
        v36.origin.double x = v19;
        v36.origin.double y = v21;
        v36.size.double width = v23;
        v36.size.double height = v25;
        CGRectIntersection(v36, v37);
        CEKProgressClamped();
        CEKInterpolate();
        objc_msgSend(v8, "setTileAlpha:");
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v5);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  if ([(CAMSemanticStylePicker *)self _isScrollActive])
  {
    [(CAMSemanticStylePicker *)self _fractionalIndexForContentOffset];
    unint64_t v5 = llround(v4);
    if (v5 != [(CAMSemanticStylePicker *)self selectedStyleIndex]
      && v5 < [(CAMSemanticStylePicker *)self numberOfStyles])
    {
      [(CAMSemanticStylePicker *)self _setSelectedStyleIndex:v5 shouldDelegate:1 shouldUpdateLayout:0 animated:0];
    }
  }
  if ([(CAMSemanticStylePicker *)self _selectedTileExpanded]) {
    [(CAMSemanticStylePicker *)self setNeedsLayout];
  }
  [(CAMSemanticStylePicker *)self _updateTileAlphas];
  id v6 = [(CAMSemanticStylePicker *)self delegate];
  [v6 semanticStylePickerDidScroll:self];
}

- (void)_prepareHaptics
{
  id v2 = [(CAMSemanticStylePicker *)self _feedbackController];
  [v2 prepareDiscreteFeedback:0];
}

- (void)_performHaptics
{
  id v2 = [(CAMSemanticStylePicker *)self _feedbackController];
  [v2 performDiscreteFeedback:0];
}

- (void)_handlePageControlValueChanged:(id)a3
{
  id v4 = a3;
  [(CAMSemanticStylePicker *)self _performHaptics];
  [(CAMSemanticStylePicker *)self _prepareHaptics];
  uint64_t v5 = [v4 interactionState];

  id v6 = [(CAMSemanticStylePicker *)self pageControl];
  -[CAMSemanticStylePicker _setSelectedStyleIndex:shouldDelegate:shouldUpdateLayout:animated:](self, "_setSelectedStyleIndex:shouldDelegate:shouldUpdateLayout:animated:", [v6 currentPage], 1, 1, v5 == 1);
}

- (unint64_t)selectedStyleIndex
{
  return self->_selectedStyleIndex;
}

- (unint64_t)numberOfStyles
{
  return self->_numberOfStyles;
}

- (BOOL)hidesSelfWhenNotExpanded
{
  return self->_hidesSelfWhenNotExpanded;
}

- (void)setHidesSelfWhenNotExpanded:(BOOL)a3
{
  self->_hidesSelfWhenNotExpanded = a3;
}

- (int64_t)material
{
  return self->_material;
}

- (double)spacerWidth
{
  return self->_spacerWidth;
}

- (UIColor)materialColor
{
  return self->_materialColor;
}

- (CAMSemanticStylePickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMSemanticStylePickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)contentBottomMargin
{
  return self->_contentBottomMargin;
}

- (void)setContentBottomMargin:(double)a3
{
  self->_contentBottomMargin = a3;
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (int64_t)pageControlMaxNumberOfDots
{
  return self->_pageControlMaxNumberOfDots;
}

- (unint64_t)minimumScrollablePageIndex
{
  return self->_minimumScrollablePageIndex;
}

- (UIScrollView)_scrollView
{
  return self->__scrollView;
}

- (NSMutableArray)_tileViews
{
  return self->__tileViews;
}

- (NSMutableArray)_spacerViews
{
  return self->__spacerViews;
}

- (BOOL)_selectedTileExpanded
{
  return self->__selectedTileExpanded;
}

- (unint64_t)_expansionAnimationCounter
{
  return self->__expansionAnimationCounter;
}

- (void)_setExpandedAnimationCounter:(unint64_t)a3
{
  self->__expansionAnimationCounter = a3;
}

- (BOOL)_needsUpdateContentOffset
{
  return self->__needsUpdateContentOffset;
}

- (void)_setNeedsUpdateContentOffset:(BOOL)a3
{
  self->__needsUpdateContentOffset = a3;
}

- (CAMFeedbackController)_feedbackController
{
  return self->__feedbackController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__feedbackController, 0);
  objc_storeStrong((id *)&self->__spacerViews, 0);
  objc_storeStrong((id *)&self->__tileViews, 0);
  objc_storeStrong((id *)&self->__scrollView, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end