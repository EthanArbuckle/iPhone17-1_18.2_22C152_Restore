@interface ICDocCamZoomablePageContentViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)accessibilityPerformEscape;
- (BOOL)isTouchingAnalyzableContentAtPoint:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldSetupScalesInViewDidLayoutSubviews;
- (CGRect)zoomRectForScale:(float)a3 withCenter:(CGPoint)a4;
- (CGSize)prevScrollViewSize;
- (ICDocCamZoomablePageContentDelegate)pageContentDelegate;
- (ICDocCamZoomablePageContentViewController)init;
- (UIImage)image;
- (UIImageView)imageView;
- (UIScrollView)scrollView;
- (VKCImageAnalysisInteraction)analysisInteraction;
- (double)zoomScale;
- (unint64_t)pageIndex;
- (unint64_t)supportedInterfaceOrientations;
- (void)analyzeCurrentImageIfNecessary;
- (void)doubleTap:(id)a3;
- (void)pageContentViewDidPencilDown;
- (void)resetImageCentering;
- (void)resetZoom;
- (void)scrollViewDidZoom:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)setAnalysisInteraction:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setPageContentDelegate:(id)a3;
- (void)setPageIndex:(unint64_t)a3;
- (void)setPrevScrollViewSize:(CGSize)a3;
- (void)setScrollView:(id)a3;
- (void)setShouldSetupScalesInViewDidLayoutSubviews:(BOOL)a3;
- (void)setupAccessibility;
- (void)setupScales;
- (void)singleTap;
- (void)view:(id)a3 setCenter:(CGPoint)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation ICDocCamZoomablePageContentViewController

- (ICDocCamZoomablePageContentViewController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6.receiver = self;
  v6.super_class = (Class)ICDocCamZoomablePageContentViewController;
  v4 = [(ICDocCamZoomablePageContentViewController *)&v6 initWithNibName:@"ICDocCamZoomablePageContentViewController" bundle:v3];

  return v4;
}

- (void)analyzeCurrentImageIfNecessary
{
  if (+[DCImageAnalyzerManager isImageAnalysisEnabled])
  {
    v3 = [(ICDocCamZoomablePageContentViewController *)self image];

    if (v3)
    {
      objc_initWeak(&location, self);
      v4 = +[DCImageAnalyzerManager sharedInstance];
      v5 = [(ICDocCamZoomablePageContentViewController *)self image];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __75__ICDocCamZoomablePageContentViewController_analyzeCurrentImageIfNecessary__block_invoke;
      v6[3] = &unk_2642A9AF8;
      objc_copyWeak(&v7, &location);
      [v4 analysisForImage:v5 completionHandler:v6];

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

void __75__ICDocCamZoomablePageContentViewController_analyzeCurrentImageIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __75__ICDocCamZoomablePageContentViewController_analyzeCurrentImageIfNecessary__block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = [WeakRetained analysisInteraction];
    [v10 setAnalysis:v5];

    v11 = [v9 analysisInteraction];
    [v11 setActiveInteractionTypes:3];
  }
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)ICDocCamZoomablePageContentViewController;
  [(ICDocCamZoomablePageContentViewController *)&v29 viewDidLoad];
  if (+[DCImageAnalyzerManager isImageAnalysisEnabled])
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2050000000;
    v3 = (void *)getVKCImageAnalysisInteractionClass_softClass;
    uint64_t v34 = getVKCImageAnalysisInteractionClass_softClass;
    if (!getVKCImageAnalysisInteractionClass_softClass)
    {
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __getVKCImageAnalysisInteractionClass_block_invoke;
      v30[3] = &unk_2642A9738;
      v30[4] = &v31;
      __getVKCImageAnalysisInteractionClass_block_invoke((uint64_t)v30);
      v3 = (void *)v32[3];
    }
    v4 = v3;
    _Block_object_dispose(&v31, 8);
    id v5 = objc_alloc_init(v4);
    [(ICDocCamZoomablePageContentViewController *)self setAnalysisInteraction:v5];

    id v6 = [(ICDocCamZoomablePageContentViewController *)self analysisInteraction];
    [v6 setActiveInteractionTypes:0];

    id v7 = [(ICDocCamZoomablePageContentViewController *)self imageView];
    v8 = [(ICDocCamZoomablePageContentViewController *)self analysisInteraction];
    [v7 addInteraction:v8];
  }
  v9 = [(ICDocCamZoomablePageContentViewController *)self image];
  v10 = [(ICDocCamZoomablePageContentViewController *)self imageView];
  [v10 setImage:v9];

  v11 = [(ICDocCamZoomablePageContentViewController *)self imageView];
  [v11 setAccessibilityIgnoresInvertColors:1];

  uint64_t v12 = objc_opt_class();
  v13 = [(ICDocCamZoomablePageContentViewController *)self imageView];
  v14 = DCCheckedDynamicCast(v12, (uint64_t)v13);
  [v14 setPageContentViewDelegate:self];

  v15 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
  [v15 setDelegate:self];

  v16 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
  [v16 setMinimumZoomScale:1.0];

  v17 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
  [v17 setMaximumZoomScale:0.5];

  double v18 = *MEMORY[0x263F1D5C8];
  v19 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
  [v19 setDecelerationRate:v18];

  v20 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
  [v20 bounds];
  -[ICDocCamZoomablePageContentViewController setPrevScrollViewSize:](self, "setPrevScrollViewSize:", v21, v22);

  [(ICDocCamZoomablePageContentViewController *)self setShouldSetupScalesInViewDidLayoutSubviews:1];
  v23 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_singleTap];
  [v23 setNumberOfTapsRequired:1];
  [v23 setAllowedTouchTypes:&unk_26C7ED940];
  v24 = [(ICDocCamZoomablePageContentViewController *)self view];
  [v24 addGestureRecognizer:v23];

  v25 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_doubleTap_];
  [v25 setNumberOfTapsRequired:2];
  [v25 setAllowedTouchTypes:&unk_26C7ED958];
  v26 = [(ICDocCamZoomablePageContentViewController *)self view];
  [v26 addGestureRecognizer:v25];

  [v23 requireGestureRecognizerToFail:v25];
  v27 = [(ICDocCamZoomablePageContentViewController *)self imageView];
  [v27 setUserInteractionEnabled:1];

  [(ICDocCamZoomablePageContentViewController *)self analyzeCurrentImageIfNecessary];
  v28 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
  [v28 setContentInsetAdjustmentBehavior:2];
}

- (void)resetZoom
{
  id v4 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
  v3 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
  [v3 minimumZoomScale];
  objc_msgSend(v4, "setZoomScale:animated:", 0);
}

- (void)resetImageCentering
{
  v3 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
  [v3 bounds];
  double MidX = CGRectGetMidX(v9);
  id v5 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
  [v5 bounds];
  double MidY = CGRectGetMidY(v10);

  id v7 = [(ICDocCamZoomablePageContentViewController *)self imageView];
  -[ICDocCamZoomablePageContentViewController view:setCenter:](self, "view:setCenter:", v7, MidX, MidY);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICDocCamZoomablePageContentViewController;
  [(ICDocCamZoomablePageContentViewController *)&v4 viewDidAppear:a3];
  [(ICDocCamZoomablePageContentViewController *)self setupAccessibility];
}

- (void)setImage:(id)a3
{
  id v15 = a3;
  if ([(ICDocCamZoomablePageContentViewController *)self shouldSetupScalesInViewDidLayoutSubviews])
  {
    BOOL v5 = 1;
  }
  else
  {
    [(UIImage *)self->_image size];
    double v7 = v6;
    double v9 = v8;
    [v15 size];
    BOOL v5 = v9 != v11 || v7 != v10;
  }
  [(ICDocCamZoomablePageContentViewController *)self setShouldSetupScalesInViewDidLayoutSubviews:v5];
  objc_storeStrong((id *)&self->_image, a3);
  uint64_t v12 = [(ICDocCamZoomablePageContentViewController *)self viewIfLoaded];

  if (v12)
  {
    v13 = [(ICDocCamZoomablePageContentViewController *)self imageView];
    [v13 setImage:v15];

    [(ICDocCamZoomablePageContentViewController *)self analyzeCurrentImageIfNecessary];
    if ([(ICDocCamZoomablePageContentViewController *)self shouldSetupScalesInViewDidLayoutSubviews])
    {
      v14 = [(ICDocCamZoomablePageContentViewController *)self view];
      [v14 setNeedsLayout];
    }
  }
}

- (double)zoomScale
{
  v2 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
  [v2 zoomScale];
  double v4 = v3;

  return v4;
}

- (void)view:(id)a3 setCenter:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
  [v12 contentOffset];
  double v14 = v13;
  double v16 = v15;

  double v17 = x - v9 * 0.5;
  double v18 = y - v11 * 0.5;
  if (v17 >= 0.0) {
    double v19 = v14;
  }
  else {
    double v19 = -v17;
  }
  if (v17 >= 0.0) {
    double v20 = x - v9 * 0.5;
  }
  else {
    double v20 = 0.0;
  }
  if (v18 >= 0.0) {
    double v21 = v16;
  }
  else {
    double v21 = -v18;
  }
  if (v18 >= 0.0) {
    double v22 = v18;
  }
  else {
    double v22 = 0.0;
  }
  objc_msgSend(v7, "setFrame:", v20, v22, v9, v11);

  id v23 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
  objc_msgSend(v23, "setContentOffset:", v19, v21);
}

- (CGRect)zoomRectForScale:(float)a3 withCenter:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v8 = [(ICDocCamZoomablePageContentViewController *)self imageView];
  [v8 frame];
  double v9 = a3;
  double v11 = v10 / a3;

  uint64_t v12 = [(ICDocCamZoomablePageContentViewController *)self imageView];
  [v12 frame];
  double v14 = v13 / v9;

  double v15 = [(ICDocCamZoomablePageContentViewController *)self imageView];
  double v16 = [(ICDocCamZoomablePageContentViewController *)self view];
  objc_msgSend(v15, "convertPoint:fromView:", v16, x, y);
  double v18 = v17;
  double v20 = v19;

  double v21 = v18 - v14 * 0.5;
  double v22 = v20 - v11 * 0.5;
  double v23 = v14;
  double v24 = v11;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v5 = [(ICDocCamZoomablePageContentViewController *)self pageContentDelegate];
  [v5 hideBarsForZoomablePageContentViewController:self];
}

- (void)scrollViewDidZoom:(id)a3
{
  id v15 = a3;
  double v3 = [v15 delegate];
  double v4 = [v3 viewForZoomingInScrollView:v15];

  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  [v15 bounds];
  double v9 = 0.0;
  double v10 = 0.0;
  if (v6 < v11)
  {
    [v15 bounds];
    double v10 = (v12 - v6) * 0.5;
  }
  [v15 bounds];
  if (v8 < v13)
  {
    [v15 bounds];
    double v9 = (v14 - v8) * 0.5;
  }
  objc_msgSend(v4, "setFrame:", v10, v9, v6, v8);
}

- (void)setupScales
{
  double v3 = [(ICDocCamZoomablePageContentViewController *)self image];
  [v3 size];
  double v5 = v4;
  double v7 = v6;
  double v8 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
  objc_msgSend(v8, "setContentSize:", v5, v7);

  double v9 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;

  double v14 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
  [v14 contentSize];
  double v16 = v11 / v15;

  double v17 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
  [v17 contentSize];
  double v19 = v13 / v18;

  if (v16 >= v19) {
    double v16 = v19;
  }
  double v20 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
  [v20 setMinimumZoomScale:v16];

  double v21 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
  [v21 setMaximumZoomScale:1.0];

  id v22 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
  [v22 setZoomScale:v16];
}

- (void)viewDidLayoutSubviews
{
  v52.receiver = self;
  v52.super_class = (Class)ICDocCamZoomablePageContentViewController;
  [(ICDocCamZoomablePageContentViewController *)&v52 viewDidLayoutSubviews];
  double v3 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  if ([(ICDocCamZoomablePageContentViewController *)self shouldSetupScalesInViewDidLayoutSubviews])
  {
    [(ICDocCamZoomablePageContentViewController *)self setShouldSetupScalesInViewDidLayoutSubviews:0];
    double v8 = [(ICDocCamZoomablePageContentViewController *)self image];
    [v8 size];
    double v10 = v9;
    double v12 = v11;
    double v13 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
    objc_msgSend(v13, "setContentSize:", v10, v12);

    double v14 = [(ICDocCamZoomablePageContentViewController *)self imageView];
    [v14 sizeToFit];

    [(ICDocCamZoomablePageContentViewController *)self setupScales];
LABEL_15:
    v47 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
    [v47 bounds];
    double MidX = CGRectGetMidX(v53);
    v49 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
    [v49 bounds];
    double MidY = CGRectGetMidY(v54);

    v51 = [(ICDocCamZoomablePageContentViewController *)self imageView];
    -[ICDocCamZoomablePageContentViewController view:setCenter:](self, "view:setCenter:", v51, MidX, MidY);

    goto LABEL_16;
  }
  [(ICDocCamZoomablePageContentViewController *)self prevScrollViewSize];
  if (v5 != v16 || v7 != v15)
  {
    double v18 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
    [v18 zoomScale];
    double v20 = v19;

    double v21 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
    [v21 minimumZoomScale];
    double v23 = v22;

    double v24 = [(ICDocCamZoomablePageContentViewController *)self image];
    [v24 size];
    double v26 = v25;
    double v28 = v27;
    objc_super v29 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
    objc_msgSend(v29, "setContentSize:", v26, v28);

    [(ICDocCamZoomablePageContentViewController *)self setupScales];
    if (v20 != v23)
    {
      v30 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
      [v30 minimumZoomScale];
      double v32 = v31;

      if (v20 >= v32) {
        double v32 = v20;
      }
      uint64_t v33 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
      [v33 maximumZoomScale];
      double v35 = v34;

      if (v32 < v35) {
        double v35 = v32;
      }
      v36 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
      [v36 zoomScale];
      double v38 = v37;

      if (v35 != v38)
      {
        v39 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
        [v39 setZoomScale:v35];

        v40 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
        [(ICDocCamZoomablePageContentViewController *)self scrollViewDidZoom:v40];
      }
    }
    v41 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
    [v41 zoomScale];
    double v43 = v42;
    v44 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
    [v44 minimumZoomScale];
    double v46 = v45;

    if (v43 == v46) {
      goto LABEL_15;
    }
  }
LABEL_16:
  -[ICDocCamZoomablePageContentViewController setPrevScrollViewSize:](self, "setPrevScrollViewSize:", v5, v7);
}

- (void)singleTap
{
  id v3 = [(ICDocCamZoomablePageContentViewController *)self pageContentDelegate];
  [v3 switchBarVisibilityForZoomablePageContentViewController:self];
}

- (void)doubleTap:(id)a3
{
  id v4 = a3;
  if ([v4 numberOfTouches])
  {
    double v5 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
    [v5 zoomScale];
    double v7 = v6;
    double v8 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
    [v8 minimumZoomScale];
    double v10 = v9;

    if (v7 == v10)
    {
      double v11 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
      [v4 locationOfTouch:0 inView:v11];
      double v13 = v12;
      double v15 = v14;

      double v16 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
      [v16 maximumZoomScale];
      *(float *)&double v17 = v17;
      -[ICDocCamZoomablePageContentViewController zoomRectForScale:withCenter:](self, "zoomRectForScale:withCenter:", v17, v13, v15);
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;

      double v26 = [(ICDocCamZoomablePageContentViewController *)self scrollView];
      objc_msgSend(v26, "zoomToRect:animated:", 1, v19, v21, v23, v25);
    }
    else
    {
      double v27 = [(ICDocCamZoomablePageContentViewController *)self view];
      [v27 bounds];
      CGFloat MidX = CGRectGetMidX(v32);
      objc_super v29 = [(ICDocCamZoomablePageContentViewController *)self view];
      [v29 bounds];
      CGFloat MidY = CGRectGetMidY(v33);

      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __55__ICDocCamZoomablePageContentViewController_doubleTap___block_invoke;
      v31[3] = &unk_2642A9B20;
      v31[4] = self;
      *(CGFloat *)&v31[5] = MidX;
      *(CGFloat *)&v31[6] = MidY;
      [MEMORY[0x263F1CB60] animateWithDuration:v31 animations:0.2];
    }
  }
}

void __55__ICDocCamZoomablePageContentViewController_doubleTap___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) scrollView];
  [v2 minimumZoomScale];
  double v4 = v3;
  double v5 = [*(id *)(a1 + 32) scrollView];
  [v5 setZoomScale:v4];

  double v6 = *(void **)(a1 + 32);
  id v7 = [v6 imageView];
  objc_msgSend(v6, "view:setCenter:", v7, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)setupAccessibility
{
  double v3 = [(ICDocCamZoomablePageContentViewController *)self imageView];
  [v3 setIsAccessibilityElement:1];

  id v5 = +[DCLocalization localizedStringForKey:@"image" value:@"image" table:@"Localizable"];
  double v4 = [(ICDocCamZoomablePageContentViewController *)self imageView];
  [v4 setAccessibilityLabel:v5];
}

- (BOOL)accessibilityPerformEscape
{
  double v3 = [(ICDocCamZoomablePageContentViewController *)self pageContentDelegate];
  char v4 = [v3 isShowingBarsForZoomablePageContentViewController:self];

  if ((v4 & 1) == 0)
  {
    id v5 = [(ICDocCamZoomablePageContentViewController *)self pageContentDelegate];
    [v5 showBarsForZoomablePageContentViewController:self];
  }
  return v4 ^ 1;
}

- (void)pageContentViewDidPencilDown
{
  double v3 = [(ICDocCamZoomablePageContentViewController *)self pageContentDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(ICDocCamZoomablePageContentViewController *)self pageContentDelegate];
    [v5 pencilDownInZoomablePageContentViewController:self];
  }
}

- (BOOL)isTouchingAnalyzableContentAtPoint:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(ICDocCamZoomablePageContentViewController *)self analysisInteraction];
  if (([v6 hasActiveTextSelection] & 1) != 0
    || (objc_msgSend(v6, "dataDetectorExistsAtPoint:", x, y) & 1) != 0
    || (objc_msgSend(v6, "textExistsAtPoint:", x, y) & 1) != 0)
  {
    char v7 = 1;
  }
  else
  {
    char v7 = objc_msgSend(v6, "visualSearchExistsAtPoint:", x, y);
  }

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ICDocCamZoomablePageContentDelegate)pageContentDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageContentDelegate);

  return (ICDocCamZoomablePageContentDelegate *)WeakRetained;
}

- (void)setPageContentDelegate:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (void)setPageIndex:(unint64_t)a3
{
  self->_pageIndedouble x = a3;
}

- (VKCImageAnalysisInteraction)analysisInteraction
{
  return self->_analysisInteraction;
}

- (void)setAnalysisInteraction:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (BOOL)shouldSetupScalesInViewDidLayoutSubviews
{
  return self->_shouldSetupScalesInViewDidLayoutSubviews;
}

- (void)setShouldSetupScalesInViewDidLayoutSubviews:(BOOL)a3
{
  self->_shouldSetupScalesInViewDidLayoutSubviews = a3;
}

- (CGSize)prevScrollViewSize
{
  double width = self->_prevScrollViewSize.width;
  double height = self->_prevScrollViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPrevScrollViewSize:(CGSize)a3
{
  self->_prevScrollViewSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_analysisInteraction, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_destroyWeak((id *)&self->_pageContentDelegate);
}

void __75__ICDocCamZoomablePageContentViewController_analyzeCurrentImageIfNecessary__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_217885000, a2, OS_LOG_TYPE_ERROR, "Encountered error from VKCImageAnalysis: %@", (uint8_t *)&v2, 0xCu);
}

@end