@interface PDFDocumentViewController
- (BOOL)hasBackgroundImage;
- (CGPoint)_convertPoint:(CGPoint)a3 fromPDFPageViewController:(id)a4;
- (CGPoint)_convertPoint:(CGPoint)a3 toPDFPageViewController:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 fromPage:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toPage:(id)a4;
- (PDFDocumentViewController)initWithPDFView:(id)a3 pageIndex:(unint64_t)a4 navigationOrientation:(int64_t)a5 withRenderingProperties:(id)a6 andOptions:(id)a7;
- (double)autoScaleFactor;
- (double)maxScaleFactor;
- (double)minScaleFactor;
- (double)scaleFactor;
- (id)_pageViewController:(id)a3 nextViewController:(int)a4 forViewController:(id)a5;
- (id)_pageViewControllerCreate:(unint64_t)a3;
- (id)backgroundImageForPage:(id)a3 withQuality:(int *)a4;
- (id)currentPage;
- (id)document;
- (id)findPageViewControllerForPageIndex:(int64_t)a3;
- (id)pageBackgroundManager;
- (id)pageForPoint:(CGPoint)a3 nearest:(BOOL)a4;
- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (id)pageViews;
- (id)scrollView;
- (id)selection;
- (void)_documentChanged;
- (void)_documentWasUnlocked;
- (void)_loadDocument:(unint64_t)a3;
- (void)_setupDocument:(unint64_t)a3;
- (void)_updateCurrentPageViewController:(id)a3;
- (void)dealloc;
- (void)didInsertPage:(id)a3 atIndex:(unint64_t)a4;
- (void)didRemovePage:(id)a3 atIndex:(unint64_t)a4;
- (void)forceUpdateActivePageIndex:(unint64_t)a3 withMaxDuration:(double)a4;
- (void)goToPage:(id)a3 direction:(int64_t)a4 animated:(BOOL)a5;
- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6;
- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4;
- (void)recieveBackgroundImage:(id)a3 atBackgroundQuality:(int)a4 forPage:(id)a5;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAutoScales:(BOOL)a3;
- (void)setDisplaysRTL:(BOOL)a3;
- (void)setMinScaleFactor:(double)a3 withMaxScaleFactor:(double)a4;
- (void)setScaleFactor:(double)a3;
- (void)setScrollViewScrollEnabled:(BOOL)a3;
- (void)setSelection:(id)a3;
- (void)updateScrollViews;
- (void)viewWillLayoutSubviews;
- (void)willForceUpdate;
@end

@implementation PDFDocumentViewController

- (PDFDocumentViewController)initWithPDFView:(id)a3 pageIndex:(unint64_t)a4 navigationOrientation:(int64_t)a5 withRenderingProperties:(id)a6 andOptions:(id)a7
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v40.receiver = self;
  v40.super_class = (Class)PDFDocumentViewController;
  v15 = [(PDFDocumentViewController *)&v40 initWithTransitionStyle:1 navigationOrientation:a5 options:v14];
  if (v15)
  {
    id v35 = v14;
    v16 = objc_alloc_init(PDFDocumentViewControllerPrivate);
    v17 = v15->_private;
    v15->_private = v16;

    objc_storeWeak((id *)&v15->_private->pdfView, v12);
    objc_storeStrong((id *)&v15->_private->renderingProperties, a6);
    v15->_private->minScale = 0.25;
    v15->_private->maxScale = 5.0;
    v15->_private->displaysRTL = 0;
    v18 = [[PDFPageBackgroundManager alloc] initWithDelegate:v15 andRenderingProperties:v13];
    v19 = v15->_private;
    pageBackgroundManager = v19->pageBackgroundManager;
    v19->pageBackgroundManager = v18;

    v15->_private->weakPageViewControllersLock._os_unfair_lock_opaque = 0;
    uint64_t v21 = [MEMORY[0x263F088B0] hashTableWithOptions:5];
    v22 = v15->_private;
    weakPageViewControllers = v22->weakPageViewControllers;
    v22->weakPageViewControllers = (NSHashTable *)v21;

    [(PDFDocumentViewController *)v15 setDelegate:v15];
    [(PDFDocumentViewController *)v15 setDataSource:v15];
    [(PDFDocumentViewController *)v15 _setupDocument:a4];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v24 = [(PDFDocumentViewController *)v15 view];
    v25 = [v24 subviews];

    uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      v28 = 0;
      uint64_t v29 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v37 != v29) {
            objc_enumerationMutation(v25);
          }
          v31 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v32 = v31;

            v28 = v32;
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v27);
    }
    else
    {
      v28 = 0;
    }

    [v28 _setAutoScrollEnabled:0];
    objc_storeWeak((id *)&v15->_private->scrollView, v28);
    [v28 setDelegate:v15];
    v33 = [MEMORY[0x263F08A00] defaultCenter];
    [v33 addObserver:v15 selector:sel__documentChanged name:@"PDFViewChangedDocument" object:v12];

    id v14 = v35;
  }

  return v15;
}

- (void)dealloc
{
  [(PDFPageBackgroundManager *)self->_private->pageBackgroundManager cancel];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PDFDocumentViewController;
  [(PDFDocumentViewController *)&v4 dealloc];
}

- (id)pageViews
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_super v4 = [(PDFDocumentViewController *)self viewControllers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 pageView];

        if (v10)
        {
          v11 = [v9 pageView];
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)goToPage:(id)a3 direction:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v20 = a5;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  v8 = [WeakRetained document];
  v9 = (void *)[v8 indexForPage:v6];

  if (v9 != (void *)0x7FFFFFFFFFFFFFFFLL)
  {
    [(PDFDocumentViewController *)self viewControllers];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
        id v15 = [v14 PDFPage];
        BOOL v16 = v15 == v6;

        if (v16) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v17 = v14;

      if (v17) {
        goto LABEL_13;
      }
    }
    else
    {
LABEL_10:
    }
    id v17 = [(PDFDocumentViewController *)self _pageViewControllerCreate:(int)v9];
LABEL_13:
    objc_initWeak(&location, self);
    id v28 = v17;
    uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __57__PDFDocumentViewController_goToPage_direction_animated___block_invoke;
    v21[3] = &unk_264204378;
    objc_copyWeak(v22, &location);
    v22[1] = v9;
    [(PDFDocumentViewController *)self setViewControllers:v18 direction:a4 animated:v20 completion:v21];

    [(PDFDocumentViewController *)self _updateCurrentPageViewController:v17];
    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }
}

void __57__PDFDocumentViewController_goToPage_direction_animated___block_invoke(uint64_t a1, int a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (a2 && WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)(*((void *)WeakRetained + 159) + 8));
    uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"PDFViewVisiblePagesChanged" object:v6];

    v8 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v11 = @"pageIndex";
    v9 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
    v12[0] = v9;
    id v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [v8 postNotificationName:@"PDFDocumentViewControllerChangedPage" object:v6 userInfo:v10];
  }
}

- (id)currentPage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activePageView);
  id v3 = [WeakRetained PDFPage];

  return v3;
}

- (void)setAutoScales:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_super v4 = [(PDFDocumentViewController *)self viewControllers];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setAutoScales:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (double)autoScaleFactor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activePageView);
  [WeakRetained autoScaleFactor];
  double v4 = v3;

  return v4;
}

- (void)setMinScaleFactor:(double)a3 withMaxScaleFactor:(double)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  self->_private->minScale = a3;
  self->_private->maxScale = a4;
  uint64_t v6 = [(PDFDocumentViewController *)self viewControllers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setMinScaleFactor:a3 withMaxScaleFactor:a4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (double)minScaleFactor
{
  return self->_private->minScale;
}

- (double)maxScaleFactor
{
  return self->_private->maxScale;
}

- (void)setScaleFactor:(double)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  double v4 = [(PDFDocumentViewController *)self viewControllers];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setScaleFactor:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (double)scaleFactor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activePageView);
  [WeakRetained scaleFactor];
  double v4 = v3;

  return v4;
}

- (void)setSelection:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(PDFDocumentViewController *)self viewControllers];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
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
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setSelection:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)selection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activePageView);
  double v3 = [WeakRetained selection];

  return v3;
}

- (void)setDisplaysRTL:(BOOL)a3
{
  self->_private->displaysRTL = a3;
}

- (void)setScrollViewScrollEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->scrollView);
  [WeakRetained setScrollEnabled:v3];
}

- (id)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->scrollView);

  return WeakRetained;
}

- (id)pageBackgroundManager
{
  return self->_private->pageBackgroundManager;
}

- (void)updateScrollViews
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  uint64_t v4 = [WeakRetained showsScrollIndicators];

  uint64_t v5 = [(PDFDocumentViewController *)self scrollView];
  [v5 setShowsVerticalScrollIndicator:v4];

  uint64_t v6 = [(PDFDocumentViewController *)self scrollView];
  [v6 setShowsHorizontalScrollIndicator:v4];

  uint64_t v7 = [(PDFDocumentViewController *)self viewControllers];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v13 = [v12 scrollView];
        [v13 setShowsVerticalScrollIndicator:v4];

        uint64_t v14 = [v12 scrollView];
        [v14 setShowsHorizontalScrollIndicator:v4];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)willForceUpdate
{
}

- (void)forceUpdateActivePageIndex:(unint64_t)a3 withMaxDuration:(double)a4
{
}

- (id)pageForPoint:(CGPoint)a3 nearest:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  uint64_t v53 = *MEMORY[0x263EF8340];
  [(PDFDocumentViewController *)self viewControllers];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v46 = 0;
    uint64_t v10 = *(void *)v49;
    double v11 = 1.79769313e308;
    long long v12 = &OBJC_IVAR___PDFTilePool__private;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        long long v15 = objc_msgSend(v14, "pageView", v46);
        long long v16 = [v14 PDFPage];
        id WeakRetained = objc_loadWeakRetained(*(id **)((char *)&self->super.super.super.super.isa + v12[11]) + 1);
        CGFloat v18 = PDFRectToCGRect(objc_msgSend(v16, "boundsForBox:", objc_msgSend(WeakRetained, "displayBox")));
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        -[PDFDocumentViewController convertPoint:toPage:](self, "convertPoint:toPage:", v16, x, y);
        v55.double x = PDFPointToCGPoint(v25, v26);
        v55.double y = v27;
        v56.origin.double x = v18;
        v56.origin.double y = v20;
        v56.size.width = v22;
        v56.size.height = v24;
        if (CGRectContainsPoint(v56, v55))
        {

          id v44 = v46;
          goto LABEL_17;
        }
        if (v4)
        {
          uint64_t v28 = v10;
          BOOL v29 = v4;
          id v30 = v7;
          v31 = v12;
          id v32 = [(PDFDocumentViewController *)self view];
          [v15 bounds];
          CGFloat v33 = PDFRectToCGRect(objc_msgSend(v32, "convertRect:fromView:", v15));
          CGFloat v35 = v34;
          CGFloat v37 = v36;
          CGFloat v39 = v38;

          v57.origin.double x = v33;
          v57.origin.double y = v35;
          v57.size.width = v37;
          v57.size.height = v39;
          double v40 = x - CGRectGetMidX(v57);
          v58.origin.double x = v33;
          v58.origin.double y = v35;
          v58.size.width = v37;
          v58.size.height = v39;
          CGFloat MidY = CGRectGetMidY(v58);
          double v42 = (y - MidY) * (y - MidY) + v40 * v40;
          if (v42 < v11)
          {
            id v43 = v16;

            v46 = v43;
            double v11 = v42;
          }
          long long v12 = v31;
          id v7 = v30;
          BOOL v4 = v29;
          uint64_t v10 = v28;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    v46 = 0;
  }

  id v44 = v46;
  long long v16 = v44;
LABEL_17:

  return v16;
}

- (CGPoint)convertPoint:(CGPoint)a3 toPage:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activePageView);
  id v9 = [WeakRetained PDFPage];

  if (v9 == v7)
  {
    -[PDFDocumentViewController _convertPoint:toPDFPageViewController:](self, "_convertPoint:toPDFPageViewController:", WeakRetained, x, y);
    double v17 = v21;
    double v18 = v22;
  }
  else
  {
    [(PDFDocumentViewController *)self viewControllers];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          objc_msgSend(v15, "PDFPage", (void)v25);
          id v16 = (id)objc_claimAutoreleasedReturnValue();

          if (v16 == v7)
          {
            -[PDFDocumentViewController _convertPoint:toPDFPageViewController:](self, "_convertPoint:toPDFPageViewController:", v15, x, y);
            double v17 = v19;
            double v18 = v20;

            goto LABEL_13;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    double v17 = *MEMORY[0x263F00148];
    double v18 = *(double *)(MEMORY[0x263F00148] + 8);
  }
LABEL_13:

  double v23 = v17;
  double v24 = v18;
  result.double y = v24;
  result.double x = v23;
  return result;
}

- (CGPoint)_convertPoint:(CGPoint)a3 toPDFPageViewController:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = PDFPointToCGPoint(x, y);
  double v10 = v9;
  uint64_t v11 = [v7 PDFPage];
  uint64_t v12 = [v7 pageView];

  uint64_t v13 = [(PDFDocumentViewController *)self view];
  objc_msgSend(v13, "convertPoint:toView:", v12, v8, v10);
  double v47 = v14;
  double v16 = v15;

  [v12 bounds];
  double v45 = v17 - v16;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(v11, "boundsForBox:", objc_msgSend(WeakRetained, "displayBox"));
  double v43 = v19;
  double v44 = v20;
  double v22 = v21;
  double v24 = v23;

  CGFloat v26 = *MEMORY[0x263F000D0];
  CGFloat v25 = *(double *)(MEMORY[0x263F000D0] + 8);
  CGFloat v28 = *(double *)(MEMORY[0x263F000D0] + 16);
  CGFloat v27 = *(double *)(MEMORY[0x263F000D0] + 24);
  CGFloat v30 = *(double *)(MEMORY[0x263F000D0] + 32);
  CGFloat v29 = *(double *)(MEMORY[0x263F000D0] + 40);
  uint64_t v31 = [v11 rotation];
  v32.f64[0] = v47;
  v32.f64[1] = v45;
  if (v31 > 179)
  {
    if (v31 == 180)
    {
      float64x2_t v46 = v32;
      double v37 = PDFDegToRad(180.0);
      v48.a = v26;
      v48.b = v25;
      v48.c = v28;
      v48.d = v27;
      v48.tdouble x = v30;
      v48.tdouble y = v29;
      CGAffineTransformRotate(&v49, &v48, v37);
      double v35 = -v22 - v43;
      double v34 = -v24 - v44;
      CGAffineTransform v48 = v49;
      goto LABEL_10;
    }
    if (v31 == 270)
    {
      float64x2_t v46 = v32;
      double v36 = PDFDegToRad(270.0);
      v48.a = v26;
      v48.b = v25;
      v48.c = v28;
      v48.d = v27;
      v48.tdouble x = v30;
      v48.tdouble y = v29;
      CGAffineTransformRotate(&v49, &v48, v36);
      double v35 = -v24 - v44;
      CGAffineTransform v48 = v49;
      double v34 = v43;
      goto LABEL_10;
    }
  }
  else
  {
    if (!v31)
    {
      v48.a = v26;
      v48.b = v25;
      v48.c = v28;
      v48.d = v27;
      v48.tdouble x = v30;
      v48.tdouble y = v29;
      float64x2_t v46 = v32;
      double v35 = v43;
      double v34 = v44;
      goto LABEL_10;
    }
    if (v31 == 90)
    {
      float64x2_t v46 = v32;
      double v33 = PDFDegToRad(90.0);
      v48.a = v26;
      v48.b = v25;
      v48.c = v28;
      v48.d = v27;
      v48.tdouble x = v30;
      v48.tdouble y = v29;
      CGAffineTransformRotate(&v49, &v48, v33);
      double v34 = -v22 - v43;
      CGAffineTransform v48 = v49;
      double v35 = v44;
LABEL_10:
      CGAffineTransformTranslate(&v49, &v48, v35, v34);
      float64x2_t v32 = vaddq_f64(*(float64x2_t *)&v49.tx, vmlaq_n_f64(vmulq_laneq_f64(*(float64x2_t *)&v49.c, v46, 1), *(float64x2_t *)&v49.a, v47));
    }
  }
  double v38 = PDFPointFromCGPoint(v32.f64[0], v32.f64[1]);
  double v40 = v39;

  double v41 = v38;
  double v42 = v40;
  result.double y = v42;
  result.double x = v41;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromPage:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activePageView);
  id v9 = [WeakRetained PDFPage];

  if (v9 == v7)
  {
    -[PDFDocumentViewController _convertPoint:fromPDFPageViewController:](self, "_convertPoint:fromPDFPageViewController:", WeakRetained, x, y);
    double v17 = v21;
    double v18 = v22;
  }
  else
  {
    [(PDFDocumentViewController *)self viewControllers];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          objc_msgSend(v15, "PDFPage", (void)v25);
          id v16 = (id)objc_claimAutoreleasedReturnValue();

          if (v16 == v7)
          {
            -[PDFDocumentViewController _convertPoint:fromPDFPageViewController:](self, "_convertPoint:fromPDFPageViewController:", v15, x, y);
            double v17 = v19;
            double v18 = v20;

            goto LABEL_13;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    double v17 = *MEMORY[0x263F00148];
    double v18 = *(double *)(MEMORY[0x263F00148] + 8);
  }
LABEL_13:

  double v23 = v17;
  double v24 = v18;
  result.double y = v24;
  result.double x = v23;
  return result;
}

- (CGPoint)_convertPoint:(CGPoint)a3 fromPDFPageViewController:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v45 = PDFPointToCGPoint(x, y);
  float64_t v46 = v8;
  id v9 = [v7 PDFPage];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(v9, "boundsForBox:", objc_msgSend(WeakRetained, "displayBox"));
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  int v19 = [v9 rotation];
  CGFloat v20 = *(double *)(MEMORY[0x263F000D0] + 8);
  CGFloat v22 = *(double *)(MEMORY[0x263F000D0] + 16);
  CGFloat v21 = *(double *)(MEMORY[0x263F000D0] + 24);
  CGFloat v24 = *(double *)(MEMORY[0x263F000D0] + 32);
  CGFloat v23 = *(double *)(MEMORY[0x263F000D0] + 40);
  v25.f64[0] = v45;
  v25.f64[1] = v46;
  float64x2_t v47 = v25;
  if (v19 > 179)
  {
    if (v19 == 180)
    {
      v48.a = *(CGFloat *)MEMORY[0x263F000D0];
      v48.b = v20;
      v48.c = v22;
      v48.d = v21;
      v48.tdouble x = v24;
      v48.tdouble y = v23;
      CGAffineTransformTranslate(&v49, &v48, v16 + v12, v18 + v14);
      long long v44 = *(_OWORD *)&v49.a;
      long long v43 = *(_OWORD *)&v49.c;
      tdouble x = v49.tx;
      tdouble y = v49.ty;
      double v28 = 180.0;
      goto LABEL_10;
    }
    if (v19 == 270)
    {
      v48.a = *(CGFloat *)MEMORY[0x263F000D0];
      v48.b = v20;
      v48.c = v22;
      v48.d = v21;
      v48.tdouble x = v24;
      v48.tdouble y = v23;
      CGAffineTransformTranslate(&v49, &v48, v18 + v14, -v12);
      long long v44 = *(_OWORD *)&v49.a;
      long long v43 = *(_OWORD *)&v49.c;
      tdouble x = v49.tx;
      tdouble y = v49.ty;
      double v28 = 90.0;
      goto LABEL_10;
    }
  }
  else
  {
    if (!v19)
    {
      v48.a = *(CGFloat *)MEMORY[0x263F000D0];
      v48.b = v20;
      v48.c = v22;
      v48.d = v21;
      v48.tdouble x = v24;
      v48.tdouble y = v23;
      CGAffineTransformTranslate(&v49, &v48, -v12, -v14);
LABEL_11:
      float64x2_t v47 = vaddq_f64(*(float64x2_t *)&v49.tx, vmlaq_n_f64(vmulq_laneq_f64(*(float64x2_t *)&v49.c, v47, 1), *(float64x2_t *)&v49.a, v45));
      goto LABEL_12;
    }
    if (v19 == 90)
    {
      v48.a = *(CGFloat *)MEMORY[0x263F000D0];
      v48.b = v20;
      v48.c = v22;
      v48.d = v21;
      v48.tdouble x = v24;
      v48.tdouble y = v23;
      CGAffineTransformTranslate(&v49, &v48, -v14, v16 + v12);
      long long v44 = *(_OWORD *)&v49.a;
      long long v43 = *(_OWORD *)&v49.c;
      tdouble x = v49.tx;
      tdouble y = v49.ty;
      double v28 = 270.0;
LABEL_10:
      double v29 = PDFDegToRad(v28);
      *(_OWORD *)&v48.a = v44;
      *(_OWORD *)&v48.c = v43;
      v48.tdouble x = tx;
      v48.tdouble y = ty;
      CGAffineTransformRotate(&v49, &v48, v29);
      goto LABEL_11;
    }
  }
LABEL_12:
  uint64_t v30 = objc_msgSend(v7, "pageView", v43, v44);
  [v30 bounds];
  double v32 = v31 - v47.f64[1];
  double v33 = [(PDFDocumentViewController *)self view];
  objc_msgSend(v33, "convertPoint:fromView:", v30, v47.f64[0], v32);
  double v35 = v34;
  double v37 = v36;

  double v38 = PDFPointFromCGPoint(v35, v37);
  double v40 = v39;

  double v41 = v38;
  double v42 = v40;
  result.double y = v42;
  result.double x = v41;
  return result;
}

- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4
{
  objc_msgSend(a4, "firstObject", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(PDFDocumentViewController *)self _updateCurrentPageViewController:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:@"PDFViewVisiblePagesChanged" object:WeakRetained];

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 postNotificationName:@"PDFTextSelectionMenuWillChangeScrollPosition" object:WeakRetained];

  os_unfair_lock_lock(&self->_private->weakPageViewControllersLock);
  [(NSHashTable *)self->_private->weakPageViewControllers addObject:v8];
  os_unfair_lock_unlock(&self->_private->weakPageViewControllersLock);
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  BOOL v7 = a4;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  if (a6)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          double v16 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v15), "pageView", (void)v26);
          [v16 clearTiles];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v13);
    }

    [WeakRetained clearSelection];
  }
  else
  {
    double v17 = [v9 firstObject];
    [(PDFDocumentViewController *)self _updateCurrentPageViewController:v17];
  }
  if (v7)
  {
    double v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 postNotificationName:@"PDFTextSelectionMenuDidChangeScrollPosition" object:WeakRetained];
  }
  int v19 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", (void)v26);
  [v19 postNotificationName:@"PDFViewVisiblePagesChanged" object:WeakRetained];

  CGFloat v20 = [WeakRetained document];
  CGFloat v21 = [(PDFDocumentViewController *)self currentPage];
  uint64_t v22 = [v20 indexForPage:v21];

  CGFloat v23 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v30 = @"pageIndex";
  CGFloat v24 = [NSNumber numberWithUnsignedInteger:v22];
  double v31 = v24;
  float64x2_t v25 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  [v23 postNotificationName:@"PDFDocumentViewControllerChangedPage" object:WeakRetained userInfo:v25];
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  if (self->_private->displaysRTL) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  return [(PDFDocumentViewController *)self _pageViewController:a3 nextViewController:v5 forViewController:a4];
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  if (self->_private->displaysRTL) {
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v5 = 1;
  }
  return [(PDFDocumentViewController *)self _pageViewController:a3 nextViewController:v5 forViewController:a4];
}

- (id)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  BOOL v3 = [WeakRetained document];

  return v3;
}

- (BOOL)hasBackgroundImage
{
  return 0;
}

- (void)viewWillLayoutSubviews
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)PDFDocumentViewController;
  [(PDFDocumentViewController *)&v14 viewWillLayoutSubviews];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  int v4 = [WeakRetained autoScales];

  if (v4)
  {
    uint64_t v5 = [(PDFDocumentViewController *)self viewControllers];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
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
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) enforceAutoScaleFactor];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activePageView);
  BOOL v3 = [WeakRetained pageView];
  [v3 setNeedsTilesUpdate];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activePageView);
  BOOL v3 = [WeakRetained pageView];
  [v3 setNeedsTilesUpdate];
}

- (void)_setupDocument:(unint64_t)a3
{
  uint64_t v5 = [(PDFDocumentViewController *)self document];
  if (v5)
  {
    id v7 = v5;
    if ([v5 isLocked])
    {
      uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
      [v6 addObserver:self selector:sel__documentWasUnlocked name:@"PDFDocumentDidUnlock" object:v7];
    }
    else if ([v7 pageCount])
    {
      [(PDFDocumentViewController *)self _loadDocument:a3];
    }
    [v7 setPageChangeDelegate:self];
    uint64_t v5 = v7;
  }
}

- (void)_loadDocument:(unint64_t)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = -[PDFDocumentViewController _pageViewControllerCreate:](self, "_pageViewControllerCreate:");
  objc_storeWeak((id *)&self->_private->activePageView, v5);
  v7[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [(PDFDocumentViewController *)self setViewControllers:v6 direction:0 animated:0 completion:0];

  [(NSHashTable *)self->_private->weakPageViewControllers addObject:v5];
  [(PDFPageBackgroundManager *)self->_private->pageBackgroundManager updateActivePageIndex:a3];
}

- (void)_documentWasUnlocked
{
}

- (void)_documentChanged
{
}

- (id)_pageViewController:(id)a3 nextViewController:(int)a4 forViewController:(id)a5
{
  p_pdfView = &self->_private->pdfView;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_pdfView);
  long long v10 = [v8 PDFPage];

  long long v11 = [WeakRetained document];
  int v12 = [v11 pageCount];
  long long v13 = 0;
  uint64_t v14 = [v11 indexForPage:v10] + a4;
  if ((int)v14 >= 0 && (int)v14 < v12)
  {
    long long v13 = [(PDFDocumentViewController *)self findPageViewControllerForPageIndex:v14];
    if (!v13)
    {
      long long v13 = [(PDFDocumentViewController *)self _pageViewControllerCreate:v14];
    }
  }

  return v13;
}

- (id)_pageViewControllerCreate:(unint64_t)a3
{
  uint64_t v5 = objc_alloc_init(PDFPageViewController);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  [(PDFPageViewController *)v5 setRenderingProperties:self->_private->renderingProperties];
  [(PDFPageViewController *)v5 setPDFView:WeakRetained];
  [WeakRetained pageBreakMargins];
  -[PDFPageViewController setPageBreakMargins:](v5, "setPageBreakMargins:");
  id v7 = [WeakRetained document];
  id v8 = [v7 pageAtIndex:a3];
  [(PDFPageViewController *)v5 setPDFPage:v8];

  uint64_t v9 = [WeakRetained showsScrollIndicators];
  long long v10 = [(PDFPageViewController *)v5 scrollView];
  [v10 setShowsVerticalScrollIndicator:v9];

  long long v11 = [(PDFPageViewController *)v5 scrollView];
  [v11 setShowsHorizontalScrollIndicator:v9];

  [(PDFPageViewController *)v5 setMinScaleFactor:self->_private->minScale withMaxScaleFactor:self->_private->maxScale];
  unsigned int v14 = 0;
  int v12 = [(PDFPageBackgroundManager *)self->_private->pageBackgroundManager backgroundImageForPageIndex:a3 withFoundQuality:&v14];
  if (v12
    || ([(PDFPageBackgroundManager *)self->_private->pageBackgroundManager forceUpdateActivePageIndex:a3 withMaxDuration:0.0166666667], [(PDFPageBackgroundManager *)self->_private->pageBackgroundManager backgroundImageForPageIndex:a3 withFoundQuality:&v14], (int v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [(PDFPageViewController *)v5 setBackgroundImage:v12 atBackgroundQuality:v14];
  }

  return v5;
}

- (id)findPageViewControllerForPageIndex:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  [(PDFDocumentViewController *)self viewControllers];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = [v10 PDFPage];
        if (v11)
        {
          int v12 = (void *)v11;
          long long v13 = [WeakRetained document];
          unsigned int v14 = [v10 PDFPage];
          uint64_t v15 = [v13 indexForPage:v14];

          if (v15 == a3)
          {
            id v16 = v10;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_12:

  return v16;
}

- (void)_updateCurrentPageViewController:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  id v6 = v4;
  objc_storeWeak((id *)&self->_private->activePageView, v6);
  uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 postNotificationName:@"PDFViewChangedPage" object:WeakRetained];

  uint64_t v8 = [WeakRetained document];
  uint64_t v9 = [v6 PDFPage];
  uint64_t v10 = [v8 indexForPage:v9];

  unsigned int v13 = 0;
  uint64_t v11 = [(PDFPageBackgroundManager *)self->_private->pageBackgroundManager backgroundImageForPageIndex:v10 withFoundQuality:&v13];
  if (v11) {
    [v6 setBackgroundImage:v11 atBackgroundQuality:v13];
  }
  int v12 = [v6 pageView];
  [v12 setNeedsTilesUpdate];
}

- (id)backgroundImageForPage:(id)a3 withQuality:(int *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_unfair_lock_lock(&self->_private->weakPageViewControllersLock);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = self->_private->weakPageViewControllers;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "pageView", (void)v18);
        unsigned int v13 = v12;
        if (v12)
        {
          id v14 = [v12 page];
          if (v14 == v6)
          {
            int v15 = [v13 hasBackgroundImage];

            if (v15)
            {
              *a4 = [v13 backgroundImageQuality];
              id v16 = [v13 backgroundImage];

              goto LABEL_14;
            }
          }
          else
          {
          }
        }
      }
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_14:

  os_unfair_lock_unlock(&self->_private->weakPageViewControllersLock);

  return v16;
}

- (void)recieveBackgroundImage:(id)a3 atBackgroundQuality:(int)a4 forPage:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  os_unfair_lock_lock(&self->_private->weakPageViewControllersLock);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = self;
  uint64_t v10 = self->_private->weakPageViewControllers;
  uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = [*(id *)(*((void *)&v19 + 1) + 8 * v14) pageView];
        id v16 = v15;
        if (v15)
        {
          id v17 = [v15 page];

          if (v17 == v9) {
            [v16 setBackgroundImage:v8 atBackgroundQuality:v6];
          }
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSHashTable *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  os_unfair_lock_unlock(&v18->_private->weakPageViewControllersLock);
}

- (void)didInsertPage:(id)a3 atIndex:(unint64_t)a4
{
  v8[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activePageView);
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    v8[0] = WeakRetained;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
    [(PDFDocumentViewController *)self setViewControllers:v7 direction:0 animated:0 completion:0];
  }
}

- (void)didRemovePage:(id)a3 atIndex:(unint64_t)a4
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  id v7 = objc_loadWeakRetained((id *)&self->_private->activePageView);
  if (v7)
  {
    id v8 = [WeakRetained document];
    if ([v8 pageCount] > a4)
    {
      [v8 pageAtIndex:a4];
    }
    if (v9) {
      [(PDFDocumentViewController *)self goToPage:v9 direction:0 animated:1];
    }
  }
}

- (void).cxx_destruct
{
}

@end