@interface QLWKWebItemViewController
+ (BOOL)_shouldDisableJavaScriptForContentType:(id)a3;
- (BOOL)automaticallyUpdateScrollViewContentInset;
- (BOOL)automaticallyUpdateScrollViewContentOffset;
- (BOOL)automaticallyUpdateScrollViewIndicatorInset;
- (BOOL)canClickToToggleFullscreen;
- (BOOL)canPinchToDismiss;
- (BOOL)canSwipeToDismiss;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4;
- (CGSize)scrubView:(id)a3 pageSizeAtIndex:(unint64_t)a4;
- (NSCache)indexToThumbnailsCache;
- (NSOperationQueue)operationQueue;
- (NSURLSessionDataTask)generatedDocumentURLSessionTask;
- (QLPreviewParts)generatedDocument;
- (WKWebView)webView;
- (id)_renderer;
- (id)_thumbnailAtIndex:(unint64_t)a3;
- (id)scrollView;
- (id)scrubView;
- (int64_t)numberOfPagesInScrubView:(id)a3;
- (int64_t)preferredWhitePointAdaptivityStyle;
- (unint64_t)currentPageNumber;
- (void)_addThumbnailToCache:(id)a3 atIndex:(unint64_t)a4;
- (void)_hideScrubberIfNeeded:(BOOL)a3;
- (void)_prepareThumbnailView;
- (void)_registerRemoteProxy;
- (void)_scrollToPage:(int64_t)a3;
- (void)_showScrubberIfNeeded:(BOOL)a3 reloadThumbnails:(BOOL)a4;
- (void)_updateConstraintConstants:(BOOL)a3;
- (void)_updateScrubberForTraitCollection:(id)a3 animated:(BOOL)a4 reloadThumbnailsIfNeeded:(BOOL)a5;
- (void)_updateScrubberVisibilityAnimated:(BOOL)a3;
- (void)_updateScrubberVisibilityAnimated:(BOOL)a3 reloadThumbnailsIfNeeded:(BOOL)a4;
- (void)_webViewDidRequestPasswordForQuickLookDocument:(id)a3;
- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)loadView;
- (void)numberOfPagesWithSize:(CGSize)a3 completionHandler:(id)a4;
- (void)pdfDataForPageAtIndex:(int64_t)a3 withCompletionHandler:(id)a4;
- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4;
- (void)previewDidAppear:(BOOL)a3;
- (void)provideCurrentPageAndVisibleRectWithCompletionHandler:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrubView:(id)a3 didSelectPageAtIndex:(unint64_t)a4;
- (void)scrubView:(id)a3 thumbnailForPage:(int64_t)a4 size:(CGSize)a5 withCompletionBlock:(id)a6;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setGeneratedDocument:(id)a3;
- (void)setGeneratedDocumentURLSessionTask:(id)a3;
- (void)setIndexToThumbnailsCache:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setWebView:(id)a3;
- (void)transitionDidStart:(BOOL)a3;
- (void)transitionWillFinish:(BOOL)a3 didComplete:(BOOL)a4;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 startURLSchemeTask:(id)a4;
- (void)webView:(id)a3 stopURLSchemeTask:(id)a4;
- (void)webViewWebContentProcessDidTerminate:(id)a3;
@end

@implementation QLWKWebItemViewController

- (void)dealloc
{
  v3 = [(QLWKWebItemViewController *)self generatedDocument];

  if (v3)
  {
    v4 = (void *)MEMORY[0x263F62918];
    v5 = [(QLWKWebItemViewController *)self generatedDocument];
    [v4 unregisterPreview:v5];
  }
  v6.receiver = self;
  v6.super_class = (Class)QLWKWebItemViewController;
  [(QLWKWebItemViewController *)&v6 dealloc];
}

- (void)loadView
{
  v52[1] = *MEMORY[0x263EF8340];
  if (!self->_webView)
  {
    v3 = objc_opt_new();
    [(QLWKWebItemViewController *)self setView:v3];

    v48 = QLFrameworkBundle();
    uint64_t v4 = [v48 URLForResource:@"QLWebKitBundle" withExtension:@"wkbundle" subdirectory:@"PlugIns" localization:0];
    id v5 = objc_alloc_init(MEMORY[0x263F1FAB0]);
    v47 = (void *)v4;
    [v5 setInjectedBundleURL:v4];
    [v5 setJITEnabled:0];
    objc_super v6 = (void *)[objc_alloc(MEMORY[0x263F1FA28]) _initWithConfiguration:v5];
    previewContentType = self->_previewContentType;
    v51 = @"contentType";
    v52[0] = previewContentType;
    v8 = [NSDictionary dictionaryWithObjects:v52 forKeys:&v51 count:1];
    [v6 _setObjectsForBundleParametersWithDictionary:v8];

    id v9 = objc_alloc(MEMORY[0x263F1FA60]);
    v10 = [(QLItemViewController *)self presentingDelegate];
    v11 = [v10 hostApplicationBundleIdentifier];
    v12 = objc_msgSend(v9, "ql_initWithForegroundPriorityAndSourceBundleIdentifier:", v11);

    [v12 setProcessPool:v6];
    v13 = [[QLWKURLSchemeHandlerProxy alloc] initWithHandler:self];
    v14 = [MEMORY[0x263F62928] protocolScheme];
    [v12 setURLSchemeHandler:v13 forURLScheme:v14];

    v15 = [[QLWKURLSchemeHandlerProxy alloc] initWithHandler:self];
    v16 = [MEMORY[0x263F62910] protocolScheme];
    [v12 setURLSchemeHandler:v15 forURLScheme:v16];

    if (+[QLWKWebItemViewController _shouldDisableJavaScriptForContentType:self->_previewContentType])
    {
      v17 = [v12 defaultWebpagePreferences];
      [v17 setAllowsContentJavaScript:0];

      v18 = [MEMORY[0x263EFFA08] set];
      [v12 _setAllowedNetworkHosts:v18];
    }
    id v19 = objc_alloc(MEMORY[0x263F1FA58]);
    v20 = [MEMORY[0x263F82B60] mainScreen];
    [v20 bounds];
    v21 = (WKWebView *)objc_msgSend(v19, "initWithFrame:configuration:", v12);
    webView = self->_webView;
    self->_webView = v21;

    [(WKWebView *)self->_webView setNavigationDelegate:self];
    v23 = [(WKWebView *)self->_webView scrollView];
    [v23 setDelegate:self];

    [(WKWebView *)self->_webView setAccessibilityIdentifier:@"QLWKWebViewControllerWkWebViewAccessibilityIdentifier"];
    [(WKWebView *)self->_webView setAllowsLinkPreview:0];
    [(QLWKWebItemViewController *)self _registerRemoteProxy];
    v24 = [(QLWKWebItemViewController *)self view];
    [v24 addSubview:self->_webView];

    v25 = [(QLWKWebItemViewController *)self scrollView];
    [v25 setContentInsetAdjustmentBehavior:2];

    [(WKWebView *)self->_webView setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = [(WKWebView *)self->_webView leftAnchor];
    v27 = [(QLWKWebItemViewController *)self view];
    v28 = [v27 leftAnchor];
    v29 = [(QLItemViewController *)self appearance];
    [v29 peripheryInsets];
    v31 = [v26 constraintEqualToAnchor:v28 constant:v30];
    objc_msgSend(v31, "ql_activatedConstraint");
    v32 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    leftConstraint = self->_leftConstraint;
    self->_leftConstraint = v32;

    v34 = [(QLWKWebItemViewController *)self view];
    v35 = [v34 rightAnchor];
    v36 = [(WKWebView *)self->_webView rightAnchor];
    v37 = [(QLItemViewController *)self appearance];
    [v37 peripheryInsets];
    v39 = [v35 constraintEqualToAnchor:v36 constant:v38];
    objc_msgSend(v39, "ql_activatedConstraint");
    v40 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    rightConstraint = self->_rightConstraint;
    self->_rightConstraint = v40;

    v42 = [(QLWKWebItemViewController *)self view];
    v43 = (void *)MEMORY[0x263F08938];
    v44 = self->_webView;
    v49 = @"webView";
    v50 = v44;
    v45 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    v46 = [v43 constraintsWithVisualFormat:@"V:|[webView]|" options:0 metrics:0 views:v45];
    [v42 addConstraints:v46];
  }
}

- (id)scrubView
{
  scrubView = self->_scrubView;
  if (!scrubView)
  {
    uint64_t v4 = objc_alloc_init(QLScrubView);
    id v5 = self->_scrubView;
    self->_scrubView = v4;

    [(QLScrubView *)self->_scrubView setDataSource:self];
    [(QLScrubView *)self->_scrubView setDelegate:self];
    [(QLScrubView *)self->_scrubView setHidden:1];
    objc_super v6 = [(QLItemViewController *)self appearance];
    [v6 topInset];
    -[QLScrubView setTopOffset:](self->_scrubView, "setTopOffset:");

    [(QLScrubView *)self->_scrubView reloadThumbnails];
    scrubView = self->_scrubView;
  }

  return scrubView;
}

- (void)_registerRemoteProxy
{
  id v9 = [(WKWebView *)self->_webView _remoteObjectRegistry];
  v3 = [MEMORY[0x263F1FAB8] remoteObjectInterfaceWithProtocol:&unk_26C971D20];
  uint64_t v4 = [v9 remoteObjectProxyWithInterface:v3];
  thumbnailGenerator = self->_thumbnailGenerator;
  self->_thumbnailGenerator = v4;

  objc_super v6 = [MEMORY[0x263F1FAB8] remoteObjectInterfaceWithProtocol:&unk_26C971D80];
  v7 = [v9 remoteObjectProxyWithInterface:v6];
  paginator = self->_paginator;
  self->_paginator = v7;
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v23 = a3;
  id v8 = a5;
  id v9 = [a4 contentType];
  previewContentType = self->_previewContentType;
  self->_previewContentType = v9;

  v11 = _Block_copy(v8);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v11;

  [(QLWKWebItemViewController *)self loadViewIfNeeded];
  v13 = (NSOperationQueue *)objc_opt_new();
  operationQueue = self->_operationQueue;
  self->_operationQueue = v13;

  [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:1];
  v15 = (NSCache *)objc_opt_new();
  indexToThumbnailsCache = self->_indexToThumbnailsCache;
  self->_indexToThumbnailsCache = v15;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = [(QLWKWebItemViewController *)self webView];
    id v18 = (id)[v17 loadFileURL:v23 allowingReadAccessToURL:v23];
  }
  else
  {
    id v19 = (void *)MEMORY[0x263F62918];
    id v17 = v23;
    [v19 registerPreview:v17];
    v20 = [(QLWKWebItemViewController *)self webView];
    v21 = [v17 previewRequest];
    id v22 = (id)[v20 loadRequest:v21];

    [(QLWKWebItemViewController *)self setGeneratedDocument:v17];
  }
}

- (void)previewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(QLItemViewController *)self didAppearOnce])
  {
    id v5 = [(QLWKWebItemViewController *)self scrollView];
    objc_super v6 = [(QLWKWebItemViewController *)self scrollView];
    [v6 minimumZoomScale];
    objc_msgSend(v5, "setZoomScale:animated:", 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)QLWKWebItemViewController;
  [(QLItemViewController *)&v7 previewDidAppear:v3];
  [(QLWKWebItemViewController *)self _updateScrubberVisibilityAnimated:v3];
}

- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)QLWKWebItemViewController;
  -[QLItemViewController previewBecameFullScreen:animated:](&v7, sel_previewBecameFullScreen_animated_);
  self->_fullScreen = a3;
  [(QLWKWebItemViewController *)self _updateScrubberVisibilityAnimated:v4];
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = [(QLItemViewController *)self appearance];
  uint64_t v8 = [v7 presentationMode];

  v15.receiver = self;
  v15.super_class = (Class)QLWKWebItemViewController;
  [(QLItemViewController *)&v15 setAppearance:v6 animated:v4];
  uint64_t v9 = [v6 presentationMode];

  if (v8 != v9) {
    [(QLWKWebItemViewController *)self _updateScrubberVisibilityAnimated:v4];
  }
  v10 = [(WKWebView *)self->_webView scrollView];
  [v10 contentOffset];
  self->_scrollViewTopOffset.x = v11;
  self->_scrollViewTopOffset.y = v12;

  v13 = [(QLItemViewController *)self appearance];
  [v13 topInset];
  -[QLScrubView setTopOffset:](self->_scrubView, "setTopOffset:");

  v14 = [(QLItemViewController *)self appearance];
  [v14 bottomInset];
  -[QLScrubView setBottomOffset:](self->_scrubView, "setBottomOffset:");

  [(QLScrubView *)self->_scrubView setNeedsLayout];
  [(QLWKWebItemViewController *)self _updateConstraintConstants:v4];
}

- (id)scrollView
{
  return [(WKWebView *)self->_webView scrollView];
}

- (BOOL)automaticallyUpdateScrollViewContentOffset
{
  return 1;
}

- (BOOL)automaticallyUpdateScrollViewContentInset
{
  return 1;
}

- (BOOL)automaticallyUpdateScrollViewIndicatorInset
{
  return 0;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  uint64_t v8 = [(QLWKWebItemViewController *)self view];
  [v8 frame];
  BOOL v10 = v9 != height;

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__QLWKWebItemViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v13[3] = &unk_2642F5C58;
  v13[4] = self;
  BOOL v14 = v10;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __80__QLWKWebItemViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v12[3] = &unk_2642F54A8;
  v12[4] = self;
  [v7 animateAlongsideTransition:v13 completion:v12];
  v11.receiver = self;
  v11.super_class = (Class)QLWKWebItemViewController;
  -[QLWKWebItemViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

uint64_t __80__QLWKWebItemViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateScrubberVisibilityAnimated:0 reloadThumbnailsIfNeeded:*(unsigned __int8 *)(a1 + 40)];
}

void __80__QLWKWebItemViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  v1 = *(double **)(a1 + 32);
  double v2 = v1[140];
  double v3 = v1[141];
  id v5 = [v1 webView];
  BOOL v4 = [v5 scrollView];
  objc_msgSend(v4, "setContentOffset:", v2, v3);
}

- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4
{
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)QLWKWebItemViewController;
  unsigned int v7 = [(QLItemViewController *)&v23 shouldAcceptTouch:v6 ofGestureRecognizer:a4];
  uint64_t v8 = (void *)MEMORY[0x263F629B0];
  double v9 = [(QLItemViewController *)self context];
  BOOL v10 = [v9 contentType];
  LODWORD(v8) = [v8 isSpreadSheetDocumentType:v10];

  if (v8)
  {
    [v6 locationInView:self->_webView];
    double v12 = v11;
    v13 = [(QLItemViewController *)self appearance];
    [v13 topInset];
    double v15 = v12 - v14;

    if (v15 >= 55.0) {
      char v16 = v7;
    }
    else {
      char v16 = 0;
    }
    if ((v16 & 1) == 0) {
      goto LABEL_6;
    }
  }
  else if (!v7)
  {
LABEL_6:
    BOOL v17 = 0;
    goto LABEL_14;
  }
  uint64_t v18 = [v6 view];
  if (v18)
  {
    id v19 = (QLScrubView *)v18;
    do
    {
      v20 = v19;
      scrubView = self->_scrubView;
      id v19 = [(QLScrubView *)v19 superview];
    }
    while (v19 && v20 != scrubView);
    BOOL v17 = v20 != scrubView;
  }
  else
  {
    BOOL v17 = 1;
  }
LABEL_14:

  return v17;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();
  }
  else
  {
    char v8 = 0;
  }

  return v8 & 1;
}

- (BOOL)canSwipeToDismiss
{
  return 0;
}

- (BOOL)canPinchToDismiss
{
  double v3 = [(WKWebView *)self->_webView scrollView];
  [v3 zoomScale];
  double v5 = floor(v4 * 1000.0);
  id v6 = [(WKWebView *)self->_webView scrollView];
  [v6 minimumZoomScale];
  BOOL v8 = v5 <= floor(v7 * 1000.0);

  return v8;
}

- (BOOL)canClickToToggleFullscreen
{
  return 0;
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return 1;
}

- (id)_renderer
{
  renderer = self->_renderer;
  if (renderer)
  {
    double v3 = renderer;
  }
  else
  {
    double v5 = (UIPrintPageRenderer *)objc_alloc_init(MEMORY[0x263F61098]);
    id v6 = self->_renderer;
    self->_renderer = v5;

    double v7 = [(WKWebView *)self->_webView _webViewPrintFormatter];
    [(UIPrintPageRenderer *)self->_renderer addPrintFormatter:v7 startingAtPageAtIndex:0];
    double v3 = self->_renderer;
  }

  return v3;
}

- (void)_prepareThumbnailView
{
  thumbnailGenerator = self->_thumbnailGenerator;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__QLWKWebItemViewController__prepareThumbnailView__block_invoke;
  v3[3] = &unk_2642F5C80;
  v3[4] = self;
  [(QLWebKitThumbnailGenerator *)thumbnailGenerator thumbnailInformationWithCompletionBlock:v3];
}

uint64_t __50__QLWKWebItemViewController__prepareThumbnailView__block_invoke(uint64_t a1, uint64_t a2, double a3, double a4)
{
  *(void *)(*(void *)(a1 + 32) + 1200) = a2;
  double v4 = (double *)(*(void *)(a1 + 32) + 1208);
  double *v4 = a3;
  v4[1] = a4;
  return QLRunInMainThread();
}

uint64_t __50__QLWKWebItemViewController__prepareThumbnailView__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateScrubberVisibilityAnimated:1 reloadThumbnailsIfNeeded:1];
}

- (void)_updateScrubberVisibilityAnimated:(BOOL)a3
{
}

- (void)_updateScrubberVisibilityAnimated:(BOOL)a3 reloadThumbnailsIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(QLWKWebItemViewController *)self traitCollection];
  [(QLWKWebItemViewController *)self _updateScrubberForTraitCollection:v7 animated:v5 reloadThumbnailsIfNeeded:v4];
}

- (void)_updateScrubberForTraitCollection:(id)a3 animated:(BOOL)a4 reloadThumbnailsIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v10 = a3;
  if ([(QLItemViewController *)self didAppearOnce] && self->_thumbnailCount >= 2)
  {
    if ([v10 horizontalSizeClass] != 2)
    {
LABEL_7:
      [(QLWKWebItemViewController *)self _hideScrubberIfNeeded:v6];
      goto LABEL_8;
    }
    BOOL v8 = [(QLItemViewController *)self appearance];
    if ([v8 presentationMode] == 4)
    {

      goto LABEL_7;
    }
    BOOL fullScreen = self->_fullScreen;

    if (fullScreen) {
      goto LABEL_7;
    }
    [(QLWKWebItemViewController *)self _showScrubberIfNeeded:v6 reloadThumbnails:v5];
  }
LABEL_8:
}

- (void)_showScrubberIfNeeded:(BOOL)a3 reloadThumbnails:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(QLWKWebItemViewController *)self traitCollection];
  if ([v7 horizontalSizeClass] == 2)
  {
  }
  else
  {
    BOOL v8 = [(QLItemViewController *)self appearance];
    uint64_t v9 = [v8 presentationMode];

    if (v9 == 4) {
      return;
    }
  }
  id v10 = [(QLWKWebItemViewController *)self scrubView];
  double v11 = v10;
  if (v10)
  {
    if (([v10 isHidden] & 1) == 0)
    {
      if (v4)
      {
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __68__QLWKWebItemViewController__showScrubberIfNeeded_reloadThumbnails___block_invoke;
        v21[3] = &unk_2642F5430;
        v21[4] = self;
        [MEMORY[0x263F82E00] performWithoutAnimation:v21];
      }
      goto LABEL_15;
    }
    double v12 = [v11 superview];

    if (v12)
    {
      if (!v4)
      {
LABEL_9:
        objc_msgSend(v11, "selectPageNumber:", -[QLWKWebItemViewController currentPageNumber](self, "currentPageNumber"));
        [v11 setHidden:0];
        v13 = [(QLWKWebItemViewController *)self view];
        [v13 setNeedsLayout];

        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __68__QLWKWebItemViewController__showScrubberIfNeeded_reloadThumbnails___block_invoke_4;
        aBlock[3] = &unk_2642F5430;
        aBlock[4] = self;
        double v14 = _Block_copy(aBlock);
        double v15 = v14;
        if (v5) {
          [MEMORY[0x263F82E00] animateWithDuration:v14 animations:0 completion:0.2];
        }
        else {
          (*((void (**)(void *))v14 + 2))(v14);
        }

        goto LABEL_15;
      }
    }
    else
    {
      char v16 = (void *)MEMORY[0x263F82E00];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __68__QLWKWebItemViewController__showScrubberIfNeeded_reloadThumbnails___block_invoke_2;
      v19[3] = &unk_2642F50C8;
      v19[4] = self;
      id v20 = v11;
      [v16 performWithoutAnimation:v19];

      if (!v4) {
        goto LABEL_9;
      }
    }
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __68__QLWKWebItemViewController__showScrubberIfNeeded_reloadThumbnails___block_invoke_3;
    v18[3] = &unk_2642F5430;
    v18[4] = self;
    [MEMORY[0x263F82E00] performWithoutAnimation:v18];
    goto LABEL_9;
  }
LABEL_15:
}

uint64_t __68__QLWKWebItemViewController__showScrubberIfNeeded_reloadThumbnails___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1192) reloadThumbnails];
}

void __68__QLWKWebItemViewController__showScrubberIfNeeded_reloadThumbnails___block_invoke_2(uint64_t a1)
{
  v31[1] = *MEMORY[0x263EF8340];
  double v2 = [*(id *)(a1 + 32) view];
  [v2 addSubview:*(void *)(a1 + 40)];

  [*(id *)(a1 + 40) setTranslatesAutoresizingMaskIntoConstraints:0];
  double v3 = [*(id *)(a1 + 32) view];
  BOOL v4 = (void *)MEMORY[0x263F08938];
  uint64_t v5 = *(void *)(a1 + 40);
  double v30 = @"scrubber";
  v31[0] = v5;
  BOOL v6 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
  id v7 = [v4 constraintsWithVisualFormat:@"V:|[scrubber]|" options:0 metrics:0 views:v6];
  [v3 addConstraints:v7];

  BOOL v8 = [*(id *)(a1 + 32) view];
  uint64_t v9 = (void *)MEMORY[0x263F08938];
  v28 = @"scrubberWidth";
  id v10 = NSNumber;
  +[QLScrubView defaultWidth];
  double v11 = objc_msgSend(v10, "numberWithDouble:");
  v29 = v11;
  double v12 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  uint64_t v13 = *(void *)(a1 + 40);
  v26 = @"scrubber";
  uint64_t v27 = v13;
  double v14 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  double v15 = [v9 constraintsWithVisualFormat:@"H:[scrubber(scrubberWidth)]" options:0 metrics:v12 views:v14];
  [v8 addConstraints:v15];

  char v16 = (void *)MEMORY[0x263F08938];
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = [*(id *)(a1 + 32) view];
  +[QLScrubView defaultWidth];
  uint64_t v20 = [v16 constraintWithItem:v17 attribute:6 relatedBy:0 toItem:v18 attribute:6 multiplier:1.0 constant:v19];
  uint64_t v21 = *(void *)(a1 + 32);
  id v22 = *(void **)(v21 + 1224);
  *(void *)(v21 + 1224) = v20;

  objc_super v23 = [*(id *)(a1 + 32) view];
  [v23 addConstraint:*(void *)(*(void *)(a1 + 32) + 1224)];

  v24 = [*(id *)(a1 + 32) view];
  [v24 setNeedsLayout];

  v25 = [*(id *)(a1 + 32) view];
  [v25 layoutIfNeeded];
}

uint64_t __68__QLWKWebItemViewController__showScrubberIfNeeded_reloadThumbnails___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1192) reloadThumbnails];
}

void __68__QLWKWebItemViewController__showScrubberIfNeeded_reloadThumbnails___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1224) setConstant:0.0];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];
}

- (unint64_t)currentPageNumber
{
  p_pageSize = &self->_pageSize;
  BOOL v4 = [(WKWebView *)self->_webView scrollView];
  [v4 zoomScale];
  double height = p_pageSize->height;
  BOOL v6 = [(WKWebView *)self->_webView scrollView];
  [v6 zoomScale];
  double v8 = v7;

  uint64_t v9 = [(WKWebView *)self->_webView scrollView];
  [v9 frame];
  double v11 = v10;

  double v12 = [(WKWebView *)self->_webView scrollView];
  [v12 contentOffset];
  double v14 = v13;

  unint64_t result = self->_thumbnailCount;
  if ((uint64_t)result >= 1) {
    return (unint64_t)((v11 * 0.5 + v14) / (height * v8));
  }
  return result;
}

- (void)_hideScrubberIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = self->_scrubView;
  BOOL v6 = v5;
  if (v5 && ([(QLScrubView *)v5 isHidden] & 1) == 0)
  {
    double v7 = [(QLWKWebItemViewController *)self view];
    [v7 setNeedsLayout];

    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__QLWKWebItemViewController__hideScrubberIfNeeded___block_invoke;
    aBlock[3] = &unk_2642F5430;
    aBlock[4] = self;
    double v8 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    double v12 = __51__QLWKWebItemViewController__hideScrubberIfNeeded___block_invoke_2;
    double v13 = &unk_2642F5458;
    double v14 = v6;
    uint64_t v9 = (void (**)(void *, uint64_t))_Block_copy(&v10);
    if (v3)
    {
      objc_msgSend(MEMORY[0x263F82E00], "animateWithDuration:animations:completion:", v8, v9, 0.2, v10, v11, v12, v13);
    }
    else
    {
      v8[2](v8);
      v9[2](v9, 1);
    }
  }
}

void __51__QLWKWebItemViewController__hideScrubberIfNeeded___block_invoke(uint64_t a1)
{
  +[QLScrubView defaultWidth];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1224), "setConstant:");
  id v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];
}

uint64_t __51__QLWKWebItemViewController__hideScrubberIfNeeded___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:1];
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)_scrollToPage:(int64_t)a3
{
  if (a3)
  {
    paginator = self->_paginator;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __43__QLWKWebItemViewController__scrollToPage___block_invoke;
    v12[3] = &unk_2642F5CA8;
    v12[4] = self;
    [(QLWebKitPaginator *)paginator boundsForPageAtIndex:a3 withCompletionBlock:v12];
  }
  else
  {
    uint64_t v5 = [(WKWebView *)self->_webView scrollView];
    [v5 contentOffset];
    double v7 = v6;
    double v8 = [(QLItemViewController *)self appearance];
    [v8 topInset];
    double v10 = -v9;

    id v11 = [(WKWebView *)self->_webView scrollView];
    objc_msgSend(v11, "setContentOffset:animated:", 0, v7, v10);
  }
}

void __43__QLWKWebItemViewController__scrollToPage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  QLRunInMainThread();
}

void __43__QLWKWebItemViewController__scrollToPage___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) CGRectValue];
  double v3 = v2;
  double v5 = v4;
  double v6 = [*(id *)(*(void *)(a1 + 40) + 1248) scrollView];
  [v6 zoomScale];
  double v7 = [*(id *)(*(void *)(a1 + 40) + 1248) scrollView];
  [v7 zoomScale];
  double v9 = v3 * v8;
  double v10 = [*(id *)(*(void *)(a1 + 40) + 1248) scrollView];
  [v10 zoomScale];
  id v11 = [*(id *)(*(void *)(a1 + 40) + 1248) scrollView];
  [v11 zoomScale];
  double v13 = v5 * v12;

  double v14 = [*(id *)(*(void *)(a1 + 40) + 1248) scrollView];
  [v14 contentSize];
  double v16 = v15;

  uint64_t v17 = [*(id *)(*(void *)(a1 + 40) + 1248) scrollView];
  [v17 frame];
  double v19 = v18;

  uint64_t v20 = [*(id *)(*(void *)(a1 + 40) + 1248) scrollView];
  [v20 contentOffset];
  double v22 = v21;

  objc_super v23 = [*(id *)(a1 + 40) appearance];
  [v23 topInset];
  double v25 = v19 - v24 - v13;

  double v26 = v25 * 0.5;
  if (v25 <= 0.0) {
    double v26 = 0.0;
  }
  double v27 = v9 - v26;
  v28 = [*(id *)(a1 + 40) appearance];
  [v28 bottomInset];
  double v30 = v16 - v29;

  if (v19 + v27 >= v30)
  {
    v31 = [*(id *)(a1 + 40) appearance];
    [v31 bottomInset];
    double v27 = v16 - v19 + v32;
  }
  id v33 = [*(id *)(*(void *)(a1 + 40) + 1248) scrollView];
  objc_msgSend(v33, "setContentOffset:animated:", 0, v22, v27);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id completionHandler = (void (**)(id, id, id, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, a5, a3, a4);
    id v7 = self->_completionHandler;
    self->_id completionHandler = 0;
  }
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id completionHandler = (void (**)(id, id, id, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, a5, a3, a4);
    id v7 = self->_completionHandler;
    self->_id completionHandler = 0;
  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  [(QLWKWebItemViewController *)self _prepareThumbnailView];
  paginator = self->_paginator;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__QLWKWebItemViewController_webView_didFinishNavigation___block_invoke;
  v8[3] = &unk_2642F5CA8;
  v8[4] = self;
  [(QLWebKitPaginator *)paginator sizeForPageAtIndex:0 withCompletionBlock:v8];
  id completionHandler = (void (**)(id, void))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 0);
    id v7 = self->_completionHandler;
    self->_id completionHandler = 0;
  }
}

uint64_t __57__QLWKWebItemViewController_webView_didFinishNavigation___block_invoke(uint64_t a1, void *a2)
{
  double v2 = (void *)(*(void *)(a1 + 32) + 1176);
  uint64_t result = [a2 CGSizeValue];
  *double v2 = v4;
  v2[1] = v5;
  return result;
}

- (void)_webViewDidRequestPasswordForQuickLookDocument:(id)a3
{
  id completionHandler = (void (**)(id, void, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 0, a3);
    id v5 = self->_completionHandler;
    self->_id completionHandler = 0;
  }
}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  uint64_t v4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.quicklook.WKWebItemViewController" code:1 userInfo:0];
  id completionHandler = (void (**)(id, uint64_t))self->_completionHandler;
  id v7 = (id)v4;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, v4);
    id v6 = self->_completionHandler;
    self->_id completionHandler = 0;
  }
  else
  {
    -[QLItemViewController notifyDelegatesDidFailWithError:](self, "notifyDelegatesDidFailWithError:");
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  double v8 = (void (**)(id, uint64_t))a5;
  if ([v7 navigationType]
    || ([v7 request],
        double v9 = objc_claimAutoreleasedReturnValue(),
        [v9 URL],
        double v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 isSpringboardHandledURL],
        v10,
        v9,
        !v11))
  {
    v8[2](v8, 1);
  }
  else
  {
    double v12 = (NSObject **)MEMORY[0x263F62940];
    double v13 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      double v13 = *v12;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = v13;
      double v15 = [v7 request];
      double v16 = [v15 URL];
      int v20 = 138412290;
      double v21 = v16;
      _os_log_impl(&dword_217F61000, v14, OS_LOG_TYPE_DEFAULT, "Forwarding URL to client from web preview: %@ #AnyItemViewController", (uint8_t *)&v20, 0xCu);
    }
    v8[2](v8, 0);
    uint64_t v17 = [(QLItemViewController *)self delegate];
    double v18 = [v7 request];
    double v19 = [v18 URL];
    [v17 previewItemViewController:self wantsToOpenURL:v19];
  }
}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x263F08BF8] sharedSession];
  id v7 = [v5 request];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  double v12 = __56__QLWKWebItemViewController_webView_startURLSchemeTask___block_invoke;
  double v13 = &unk_2642F5CD0;
  id v14 = v5;
  double v15 = self;
  id v8 = v5;
  double v9 = [v6 dataTaskWithRequest:v7 completionHandler:&v10];

  -[QLWKWebItemViewController setGeneratedDocumentURLSessionTask:](self, "setGeneratedDocumentURLSessionTask:", v9, v10, v11, v12, v13);
  [v9 resume];
}

void __56__QLWKWebItemViewController_webView_startURLSchemeTask___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  id v7 = *(void **)(a1 + 32);
  if (a3)
  {
    [v7 didReceiveResponse:a3];
    [*(id *)(a1 + 32) didReceiveData:v8];
    [*(id *)(a1 + 32) didFinish];
  }
  else
  {
    [v7 didFailWithError:a4];
  }
  [*(id *)(a1 + 40) setGeneratedDocumentURLSessionTask:0];
}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  id v4 = [(QLWKWebItemViewController *)self generatedDocumentURLSessionTask];
  [v4 cancel];
}

- (int64_t)numberOfPagesInScrubView:(id)a3
{
  return self->_thumbnailCount;
}

- (void)scrubView:(id)a3 thumbnailForPage:(int64_t)a4 size:(CGSize)a5 withCompletionBlock:(id)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v11 = a3;
  double v12 = (void (**)(id, void *))a6;
  double v13 = [(QLWKWebItemViewController *)self _thumbnailAtIndex:a4];
  if (v13)
  {
    v12[2](v12, v13);
  }
  else
  {
    objc_initWeak(&location, self);
    id v14 = [QLAsynchronousBlockOperation alloc];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __81__QLWKWebItemViewController_scrubView_thumbnailForPage_size_withCompletionBlock___block_invoke;
    v16[3] = &unk_2642F5D20;
    v16[4] = self;
    v18[1] = (id)a4;
    v18[2] = *(id *)&width;
    v18[3] = *(id *)&height;
    objc_copyWeak(v18, &location);
    uint64_t v17 = v12;
    double v15 = [(QLAsynchronousBlockOperation *)v14 initWithBlock:v16];
    [(NSOperationQueue *)self->_operationQueue addOperation:v15];

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
}

void __81__QLWKWebItemViewController_scrubView_thumbnailForPage_size_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 1160);
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__QLWKWebItemViewController_scrubView_thumbnailForPage_size_withCompletionBlock___block_invoke_2;
  v8[3] = &unk_2642F5CF8;
  objc_copyWeak(v11, (id *)(a1 + 48));
  v11[1] = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 40);
  id v7 = v3;
  id v10 = v7;
  [v4 thumbnailForPage:v5 size:v6 withCompletionBlock:v8];

  objc_destroyWeak(v11);
}

void __81__QLWKWebItemViewController_scrubView_thumbnailForPage_size_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _addThumbnailToCache:v3 atIndex:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v5 = (NSObject **)MEMORY[0x263F62940];
    id v6 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 56);
      int v8 = 134217984;
      uint64_t v9 = v7;
      _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_ERROR, "Did not obtain thumbnail for page at index: %ld #AnyItemViewController", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (CGSize)scrubView:(id)a3 pageSizeAtIndex:(unint64_t)a4
{
  double width = self->_thumbnailSize.width;
  double height = self->_thumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)_thumbnailAtIndex:(unint64_t)a3
{
  uint64_t v5 = self->_indexToThumbnailsCache;
  objc_sync_enter(v5);
  indexToThumbnailsCache = self->_indexToThumbnailsCache;
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  int v8 = [(NSCache *)indexToThumbnailsCache objectForKey:v7];

  objc_sync_exit(v5);

  return v8;
}

- (void)_addThumbnailToCache:(id)a3 atIndex:(unint64_t)a4
{
  id v9 = a3;
  id v6 = self->_indexToThumbnailsCache;
  objc_sync_enter(v6);
  indexToThumbnailsCache = self->_indexToThumbnailsCache;
  int v8 = [NSNumber numberWithInteger:a4];
  [(NSCache *)indexToThumbnailsCache setObject:v9 forKey:v8];

  objc_sync_exit(v6);
}

- (void)scrubView:(id)a3 didSelectPageAtIndex:(unint64_t)a4
{
}

- (void)numberOfPagesWithSize:(CGSize)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  QLRunInMainThreadSync();
}

void __69__QLWKWebItemViewController_numberOfPagesWithSize_completionHandler___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  id v4 = [*(id *)(a1 + 32) _renderer];
  objc_msgSend(v4, "setPrintableRect:", 0.0, 0.0, v2, v3);

  id v5 = [*(id *)(a1 + 32) _renderer];
  [v5 printableRect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [*(id *)(a1 + 32) _renderer];
  objc_msgSend(v14, "setPaperRect:", v7, v9, v11, v13);

  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = [*(id *)(a1 + 32) _renderer];
  (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v15, [v16 numberOfPages]);
}

- (void)pdfDataForPageAtIndex:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  QLRunInMainThreadSync();
}

void __73__QLWKWebItemViewController_pdfDataForPageAtIndex_withCompletionHandler___block_invoke(uint64_t a1)
{
  data = (NSMutableData *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:0];
  double v2 = [*(id *)(a1 + 32) _renderer];
  [v2 printableRect];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.double width = v8;
  v16.size.double height = v10;
  UIGraphicsBeginPDFContextToData(data, v16, 0);
  UIGraphicsBeginPDFPage();
  double v11 = [*(id *)(a1 + 32) _renderer];
  double v12 = [v11 printFormattersForPageAtIndex:0];
  double v13 = [v12 firstObject];

  [v13 rectForPageAtIndex:*(void *)(a1 + 48)];
  objc_msgSend(v13, "drawInRect:forPageAtIndex:", *(void *)(a1 + 48));
  UIGraphicsEndPDFContext();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)provideCurrentPageAndVisibleRectWithCompletionHandler:(id)a3
{
}

- (void)scrollViewDidScroll:(id)a3
{
  unint64_t v4 = [(QLWKWebItemViewController *)self currentPageNumber];
  if (([(QLScrubView *)self->_scrubView isHidden] & 1) == 0)
  {
    scrubView = self->_scrubView;
    [(QLScrubView *)scrubView selectPageNumber:v4];
  }
}

- (void)transitionDidStart:(BOOL)a3
{
  if (!a3) {
    [(QLWKWebItemViewController *)self _hideScrubberIfNeeded:1];
  }
}

- (void)transitionWillFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  if (!a3 && !a4) {
    [(QLWKWebItemViewController *)self _updateScrubberVisibilityAnimated:1];
  }
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CGFloat v8 = [(QLWKWebItemViewController *)self view];
  [v8 endEditing:0];

  v9.receiver = self;
  v9.super_class = (Class)QLWKWebItemViewController;
  [(QLItemViewController *)&v9 buttonPressedWithIdentifier:v7 completionHandler:v6];
}

- (void)_updateConstraintConstants:(BOOL)a3
{
  BOOL v3 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__QLWKWebItemViewController__updateConstraintConstants___block_invoke;
  aBlock[3] = &unk_2642F5430;
  aBlock[4] = self;
  unint64_t v4 = _Block_copy(aBlock);
  double v5 = v4;
  if (v3) {
    [MEMORY[0x263F82E00] animateWithDuration:v4 animations:0.2];
  }
  else {
    (*((void (**)(void *))v4 + 2))(v4);
  }
}

void __56__QLWKWebItemViewController__updateConstraintConstants___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) appearance];
  [v2 peripheryInsets];
  [*(id *)(*(void *)(a1 + 32) + 1232) setConstant:v3];

  unint64_t v4 = [*(id *)(a1 + 32) appearance];
  [v4 peripheryInsets];
  [*(id *)(*(void *)(a1 + 32) + 1240) setConstant:v5];

  id v6 = [*(id *)(a1 + 32) view];
  [v6 setNeedsLayout];
}

+ (BOOL)_shouldDisableJavaScriptForContentType:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x263F629B0] isIWorkDocumentType:v3]) {
    LOBYTE(v4) = 0;
  }
  else {
    int v4 = [MEMORY[0x263F629B0] isOfficeDocumentType:v3] ^ 1;
  }

  return v4;
}

- (void)setWebView:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSCache)indexToThumbnailsCache
{
  return self->_indexToThumbnailsCache;
}

- (void)setIndexToThumbnailsCache:(id)a3
{
}

- (QLPreviewParts)generatedDocument
{
  return (QLPreviewParts *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setGeneratedDocument:(id)a3
{
}

- (NSURLSessionDataTask)generatedDocumentURLSessionTask
{
  return (NSURLSessionDataTask *)objc_getProperty(self, a2, 1280, 1);
}

- (void)setGeneratedDocumentURLSessionTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedDocumentURLSessionTask, 0);
  objc_storeStrong((id *)&self->_generatedDocument, 0);
  objc_storeStrong((id *)&self->_indexToThumbnailsCache, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_rightConstraint, 0);
  objc_storeStrong((id *)&self->_leftConstraint, 0);
  objc_storeStrong((id *)&self->_scrubberRightConstraint, 0);
  objc_storeStrong((id *)&self->_scrubView, 0);
  objc_storeStrong((id *)&self->_paginator, 0);
  objc_storeStrong((id *)&self->_thumbnailGenerator, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_previewContentType, 0);
}

@end