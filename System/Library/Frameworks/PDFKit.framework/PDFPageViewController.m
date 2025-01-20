@interface PDFPageViewController
- (PDFPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)autoScaleFactor;
- (double)scaleFactor;
- (id)PDFPage;
- (id)pageView;
- (id)pdfView;
- (id)scrollView;
- (id)selection;
- (id)textInputView;
- (id)viewForZoomingInScrollView:(id)a3;
- (void)_buildPDFPageView;
- (void)_centerAlign;
- (void)_removePDFView;
- (void)_setupGestureRecognizerDependencies;
- (void)_updateAnnotations;
- (void)changedBoundsForBoxNotification:(id)a3;
- (void)dealloc;
- (void)didRotatePageNotification:(id)a3;
- (void)enforceAutoScaleFactor;
- (void)removeAKOverlay;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidZoom:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)setAutoScales:(BOOL)a3;
- (void)setBackgroundImage:(id)a3 atBackgroundQuality:(int)a4;
- (void)setMinScaleFactor:(double)a3 withMaxScaleFactor:(double)a4;
- (void)setPDFPage:(id)a3;
- (void)setPDFView:(id)a3;
- (void)setPageBreakMargins:(UIEdgeInsets)a3;
- (void)setRenderingProperties:(id)a3;
- (void)setScaleFactor:(double)a3;
- (void)setSelection:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PDFPageViewController

- (void)setRenderingProperties:(id)a3
{
}

- (void)setPDFView:(id)a3
{
}

- (void)setPageBreakMargins:(UIEdgeInsets)a3
{
  self->_private->pageMargins = a3;
}

- (void)setPDFPage:(id)a3
{
}

- (id)PDFPage
{
  return self->_private->page;
}

- (id)pageView
{
  return self->_private->pageView;
}

- (id)scrollView
{
  return self->_private->scrollView;
}

- (id)textInputView
{
  return self->_private->pageViewContainerView;
}

- (void)setAutoScales:(BOOL)a3
{
  if (a3) {
    [(PDFPageViewController *)self enforceAutoScaleFactor];
  }
}

- (void)enforceAutoScaleFactor
{
  [(PDFPageViewController *)self autoScaleFactor];
  double v4 = v3;
  v5 = self->_private;
  if (v5->minScale > v3)
  {
    v5->minScale = v3;
    [(UIScrollView *)self->_private->scrollView setMinimumZoomScale:v3];
    v5 = self->_private;
  }
  if (v5->maxScale < v4)
  {
    v5->maxScale = v4;
    [(UIScrollView *)self->_private->scrollView setMaximumZoomScale:v4];
    v5 = self->_private;
  }
  scrollView = v5->scrollView;

  [(UIScrollView *)scrollView setZoomScale:v4];
}

- (void)setMinScaleFactor:(double)a3 withMaxScaleFactor:(double)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  if (WeakRetained)
  {
    self->_private->minScale = a3;
    self->_private->maxScale = a4;
    id v11 = WeakRetained;
    [(UIScrollView *)self->_private->scrollView setMinimumZoomScale:a3];
    [(UIScrollView *)self->_private->scrollView setMaximumZoomScale:a4];
    if ([v11 autoScales])
    {
      scrollView = self->_private->scrollView;
      if (scrollView)
      {
        [(UIScrollView *)scrollView zoomScale];
        if (v9 < a3 || v9 > a4) {
          [v11 setAutoScales:0];
        }
      }
    }
    [(UIScrollView *)self->_private->scrollView zoomScale];
    -[PDFPageViewController setScaleFactor:](self, "setScaleFactor:");
    id WeakRetained = v11;
  }
}

- (void)setScaleFactor:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    double v6 = CGFloatClamp(a3, self->_private->minScale, self->_private->maxScale);
    if ([v11 autoScales])
    {
      scrollView = self->_private->scrollView;
      if (scrollView)
      {
        [(UIScrollView *)scrollView zoomScale];
        double v9 = v8;
        [(PDFPageViewController *)self autoScaleFactor];
        if (vabdd_f64(v10, v9) > 0.001) {
          [v11 setAutoScales:0];
        }
      }
    }
    [(UIScrollView *)self->_private->scrollView setZoomScale:v6];
    id WeakRetained = v11;
  }
}

- (double)scaleFactor
{
  [(UIScrollView *)self->_private->scrollView zoomScale];
  return result;
}

- (double)autoScaleFactor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  double v4 = WeakRetained;
  if (WeakRetained)
  {
    -[PDFPage boundsForBox:](self->_private->page, "boundsForBox:", [WeakRetained displayBox]);
    PDFRectRotate([(PDFPage *)self->_private->page rotation], v5, v6);
    double v8 = v7;
    double v10 = v9;
    double v11 = PDFPointMake(0.0, 0.0);
    double v13 = v12;
    v14 = self->_private;
    double v15 = v8 + v14->pageMargins.left + v14->pageMargins.right;
    double v16 = v10 + v14->pageMargins.top + v14->pageMargins.bottom;
    [v4 bounds];
    double v21 = PDFScaleRectToRect(v11, v13, v15, v16, v17, v18, v19, v20);
  }
  else
  {
    double v21 = 1.0;
  }

  return v21;
}

- (void)setSelection:(id)a3
{
}

- (id)selection
{
  return [(PDFTextInputView *)self->_private->pageViewContainerView selection];
}

- (void)setBackgroundImage:(id)a3 atBackgroundQuality:(int)a4
{
  id v7 = a3;
  double v8 = self->_private;
  pageView = v8->pageView;
  id v10 = v7;
  if (pageView)
  {
    -[PDFPageView setBackgroundImage:atBackgroundQuality:](pageView, "setBackgroundImage:atBackgroundQuality:");
  }
  else
  {
    objc_storeStrong((id *)&v8->backgroundImage, a3);
    self->_private->backgroundQuality = a4;
  }
}

- (PDFPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PDFPageViewController;
  double v4 = [(PDFPageViewController *)&v8 initWithNibName:0 bundle:0];
  if (v4)
  {
    double v5 = objc_alloc_init(PDFPageViewControllerPrivate);
    double v6 = v4->_private;
    v4->_private = v5;

    v4->_private->minScale = 0.25;
    v4->_private->maxScale = 5.0;
  }
  return v4;
}

- (void)dealloc
{
  [(PDFPageViewController *)self _removePDFView];
  v3.receiver = self;
  v3.super_class = (Class)PDFPageViewController;
  [(PDFPageViewController *)&v3 dealloc];
}

- (void)removeAKOverlay
{
  double v6 = self->_private->pageView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  if (v6)
  {
    double v4 = [(PDFPage *)self->_private->page document];
    uint64_t v5 = [v4 indexForPage:self->_private->page];

    [WeakRetained callPageVisibilityDelegateMethod:2 forPageView:v6 atPageIndex:v5];
    [WeakRetained callPageVisibilityDelegateMethod:3 forPageView:v6 atPageIndex:v5];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PDFPageViewController;
  [(PDFPageViewController *)&v8 viewWillAppear:a3];
  if (self->_private->page)
  {
    [(PDFPageViewController *)self _buildPDFPageView];
    [(PDFPageView *)self->_private->pageView setEnableTileUpdates:1];
    [(PDFPageView *)self->_private->pageView setNeedsTilesUpdate];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
    uint64_t v5 = [WeakRetained currentSelection];
    [WeakRetained setCurrentSelection:v5];

    double v6 = [(PDFPage *)self->_private->page document];
    uint64_t v7 = [v6 indexForPage:self->_private->page];

    [WeakRetained callPageVisibilityDelegateMethod:0 forPageView:self->_private->pageView atPageIndex:v7];
    [WeakRetained callPageVisibilityDelegateMethod:1 forPageView:self->_private->pageView atPageIndex:v7];
    [(PDFPageViewController *)self _updateAnnotations];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PDFPageViewController;
  [(PDFPageViewController *)&v4 viewDidAppear:a3];
  [(PDFPageView *)self->_private->pageView setEnableTileUpdates:1];
  [(PDFPageView *)self->_private->pageView setNeedsTilesUpdate];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PDFPageViewController;
  [(PDFPageViewController *)&v4 viewWillDisappear:a3];
  [(PDFPageView *)self->_private->pageView setEnableTileUpdates:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PDFPageViewController;
  [(PDFPageViewController *)&v4 viewDidDisappear:a3];
  [(PDFPage *)self->_private->page setView:0];
  [(PDFPageViewController *)self removeAKOverlay];
  [(PDFPageView *)self->_private->pageView setBackgroundImage:0 atBackgroundQuality:2];
}

- (void)viewWillLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PDFPageViewController;
  [(PDFPageViewController *)&v7 viewWillLayoutSubviews];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  int v4 = [WeakRetained autoScales];

  if (v4) {
    [(PDFPageViewController *)self enforceAutoScaleFactor];
  }
  scrollView = self->_private->scrollView;
  double v6 = [(PDFPageViewController *)self view];
  [v6 bounds];
  -[UIScrollView setFrame:](scrollView, "setFrame:");

  [(PDFPageViewController *)self _centerAlign];
}

- (void)_buildPDFPageView
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  [(PDFPage *)self->_private->page setView:WeakRetained];
  if (self->_private->pageView)
  {
    [(PDFPageViewController *)self enforceAutoScaleFactor];
    [(PDFPageView *)self->_private->pageView setBackgroundImage:self->_private->backgroundImage atBackgroundQuality:self->_private->backgroundQuality];
  }
  else
  {
    id v4 = WeakRetained;
    uint64_t v5 = [[PDFPageView alloc] initWithPage:self->_private->page geometryInterface:v4 andRenderingProperties:self->_private->renderingProperties];
    double v6 = self->_private;
    pageView = v6->pageView;
    v6->pageView = v5;

    -[PDFPage boundsForBox:](self->_private->page, "boundsForBox:", [v4 displayBox]);
    PDFRectRotate([(PDFPage *)self->_private->page rotation], v8, v9);
    double v11 = v10;
    double v13 = v12;
    [(PDFPageView *)self->_private->pageView setFrame:PDFPointMake(0.0, 0.0)];
    v36 = v4;
    v14 = [v4 highlightedSelections];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v14);
          }
          double v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          double v20 = [v19 pages];
          int v21 = [v20 containsObject:self->_private->page];

          if (v21) {
            [(PDFPageView *)self->_private->pageView addSearchSelection:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v16);
    }
    id v22 = objc_alloc(MEMORY[0x263F82B88]);
    v23 = [(PDFPageViewController *)self view];
    [v23 bounds];
    uint64_t v24 = objc_msgSend(v22, "initWithFrame:");
    v25 = self->_private;
    scrollView = v25->scrollView;
    v25->scrollView = (UIScrollView *)v24;

    [(UIScrollView *)self->_private->scrollView setDelegate:self];
    [(UIScrollView *)self->_private->scrollView _setAutoScrollEnabled:0];
    -[UIScrollView setContentSize:](self->_private->scrollView, "setContentSize:", v11, v13);
    [(UIScrollView *)self->_private->scrollView setMinimumZoomScale:self->_private->minScale];
    [(UIScrollView *)self->_private->scrollView setMaximumZoomScale:self->_private->maxScale];
    v27 = [[PDFTextInputView alloc] initWithDelegate:self];
    v28 = self->_private;
    pageViewContainerView = v28->pageViewContainerView;
    v28->pageViewContainerView = v27;

    v30 = self->_private;
    v31 = v30->pageViewContainerView;
    [(PDFPageView *)v30->pageView frame];
    -[PDFTextInputView setFrame:](v31, "setFrame:");
    [(PDFTextInputView *)self->_private->pageViewContainerView addSubview:self->_private->pageView];
    [(PDFPageView *)self->_private->pageView setBackgroundImage:self->_private->backgroundImage atBackgroundQuality:self->_private->backgroundQuality];
    [(UIScrollView *)self->_private->scrollView addSubview:self->_private->pageViewContainerView];
    v32 = [(PDFPageViewController *)self view];
    [v32 addSubview:self->_private->scrollView];

    [(PDFPageViewController *)self _setupGestureRecognizerDependencies];
    [(PDFPageViewController *)self enforceAutoScaleFactor];
    [(PDFPageViewController *)self _centerAlign];
    v33 = [MEMORY[0x263F08A00] defaultCenter];
    [v33 addObserver:self selector:sel_changedBoundsForBoxNotification_ name:@"PDFPageChangedBoundsForBox" object:self->_private->page];

    v34 = [MEMORY[0x263F08A00] defaultCenter];
    [v34 addObserver:self selector:sel_didRotatePageNotification_ name:@"PDFPageDidRotate" object:self->_private->page];

    v35 = [MEMORY[0x263F08A00] defaultCenter];
    [v35 addObserver:self selector:sel_didRotatePageNotification_ name:@"PDFPageDidChangeBounds" object:self->_private->page];
  }
}

- (void)_setupGestureRecognizerDependencies
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_super v3 = [WeakRetained longPressGestureRecognizer];
  if (v3)
  {
    id v4 = [(UIScrollView *)self->_private->scrollView panGestureRecognizer];
    [v4 requireGestureRecognizerToFail:v3];
  }
  [(PDFTextInputView *)self->_private->pageViewContainerView updateGestureRecognizerDependencies];
}

- (void)_removePDFView
{
  pageView = self->_private->pageView;
  if (pageView)
  {
    [(PDFPageView *)pageView removeFromSuperview];
    id v4 = self->_private;
    uint64_t v5 = v4->pageView;
    v4->pageView = 0;

    [(UIScrollView *)self->_private->scrollView removeFromSuperview];
    double v6 = self->_private;
    scrollView = v6->scrollView;
    v6->scrollView = 0;
  }
}

- (void)_updateAnnotations
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = [(PDFPage *)self->_private->page annotations];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
        double v10 = [(PDFPageView *)self->_private->pageView pageLayer];
        objc_msgSend(WeakRetained, "convertRectToRootView:fromPageLayer:", v10, 0.0, 0.0, 1.0, 1.0);
        double v12 = v11;

        [v8 setScaleFactor:v12];
        [(PDFPageView *)self->_private->pageView updateAnnotation:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (id)pdfView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);

  return WeakRetained;
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  [(PDFPageView *)self->_private->pageView setNeedsTilesUpdate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  [WeakRetained setAutoScales:0];
  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"PDFTextSelectionMenuWillChangeScrollPosition" object:self];
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  [(PDFPageView *)self->_private->pageView setNeedsTilesUpdate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  [WeakRetained setAutoScales:0];
  uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:@"PDFViewScaleChanged" object:WeakRetained];

  uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 postNotificationName:@"PDFTextSelectionMenuWillChangeZoomFactor" object:self];

  double v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 postNotificationName:@"PDFTextSelectionMenuDidChangeScrollPosition" object:self];
}

- (void)scrollViewDidZoom:(id)a3
{
  [(PDFPageView *)self->_private->pageView setNeedsTilesUpdate];
  [(PDFPageViewController *)self _centerAlign];
  [(PDFPageView *)self->_private->pageView updateBookmark];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"PDFTextSelectionMenuWillChangeZoomFactor" object:0];
}

- (void)scrollViewDidScroll:(id)a3
{
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return self->_private->pageViewContainerView;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"PDFTextSelectionMenuWillChangeScrollPosition" object:self];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 postNotificationName:@"PDFTextSelectionMenuDidChangeScrollPosition" object:self];
}

- (void)changedBoundsForBoxNotification:(id)a3
{
}

- (void)didRotatePageNotification:(id)a3
{
}

- (void)_centerAlign
{
  long long v15 = self->_private->pageViewContainerView;
  [(PDFTextInputView *)v15 center];
  [(UIScrollView *)self->_private->scrollView bounds];
  double v4 = v3;
  [(UIScrollView *)self->_private->scrollView contentSize];
  double v6 = (v4 - v5) * 0.5;
  if (v6 >= 0.0) {
    double v7 = v6;
  }
  else {
    double v7 = 0.0;
  }
  [(UIScrollView *)self->_private->scrollView contentSize];
  double v9 = v7 + v8 * 0.5;
  [(UIScrollView *)self->_private->scrollView bounds];
  double v11 = v10;
  [(UIScrollView *)self->_private->scrollView contentSize];
  if ((v11 - v12) * 0.5 >= 0.0) {
    double v13 = (v11 - v12) * 0.5;
  }
  else {
    double v13 = 0.0;
  }
  [(UIScrollView *)self->_private->scrollView contentSize];
  -[PDFTextInputView setCenter:](v15, "setCenter:", v9, v13 + v14 * 0.5);
}

- (void).cxx_destruct
{
}

@end