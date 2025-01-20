@interface MUWebContentViewController
+ (id)resolvedURLForRelativeURL:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)isLoading;
- (BOOL)shouldAddLoadingIndicator;
- (MUPlaceEnrichmentActionManager)actionManager;
- (MUWebContentViewController)initWithURL:(id)a3;
- (MUWebContentViewController)initWithURL:(id)a3 traits:(id)a4;
- (MUWebContentViewControllerDelegate)delegate;
- (NSURL)url;
- (void)_addLoadingSpinner;
- (void)_cancel;
- (void)_finishLoading;
- (void)_getAnalyticsShortSessionSnapshotWithCallbackHandler:(id)a3;
- (void)_invokeAction:(id)a3 callbackHandler:(id)a4;
- (void)_layoutAction:(id)a3 callbackHandler:(id)a4;
- (void)_propogateUserInterfaceStyleToWebModule;
- (void)_removeLoadingSpinner;
- (void)_removeModuleWithArguments:(id)a3 callbackHandler:(id)a4;
- (void)_resetBridge;
- (void)_setHeight:(double)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_setHeight:(id)a3 callbackHandler:(id)a4;
- (void)_startLoading;
- (void)configureWithHTML:(id)a3 actionManager:(id)a4 initialDefaultHeight:(double)a5;
- (void)dealloc;
- (void)setActionManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateActionOverBridge:(id)a3;
- (void)viewDidLoad;
- (void)webBridgeDidConnect:(id)a3;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didCommitNavigation:(id)a4;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
@end

@implementation MUWebContentViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)configureWithHTML:(id)a3 actionManager:(id)a4 initialDefaultHeight:(double)a5
{
  id v14 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F64790] sharedNetworkObserver];
  if ([v10 isNetworkReachable])
  {
    char IsEnabled_PlaceCardShowcase = MapsFeature_IsEnabled_PlaceCardShowcase();

    if (IsEnabled_PlaceCardShowcase)
    {
      objc_storeStrong((id *)&self->_html, a3);
      objc_storeStrong((id *)&self->_actionManager, a4);
      v12 = (MUWebContentTraits *)objc_opt_new();
      webContentTraits = self->_webContentTraits;
      self->_webContentTraits = v12;

      self->_defaultHeight = a5;
    }
  }
  else
  {
  }
}

- (MUWebContentViewController)initWithURL:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(MUWebContentViewController *)self initWithURL:v4 traits:v5];

  return v6;
}

- (MUWebContentViewController)initWithURL:(id)a3 traits:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(id)objc_opt_class() resolvedURLForRelativeURL:v7];
  if (!v9) {
    goto LABEL_7;
  }
  v10 = +[MUWebContentBlocker sharedBlocker];
  char v11 = [v10 shouldBlockLoadingOfURL:v9];

  if (v11) {
    goto LABEL_7;
  }
  v12 = [MEMORY[0x1E4F64790] sharedNetworkObserver];
  int v13 = [v12 isNetworkReachable];

  if (v13)
  {
    v22.receiver = self;
    v22.super_class = (Class)MUWebContentViewController;
    id v14 = [(MUWebContentViewController *)&v22 init];
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_url, a3);
      objc_storeStrong((id *)&v15->_resolvedURL, v9);
      objc_storeStrong((id *)&v15->_webContentTraits, a4);
      GEOConfigGetDouble();
      v15->_defaultHeight = v16;
      v17 = self;
      v23[0] = v17;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      id v19 = (id)[(MUWebContentViewController *)v15 registerForTraitChanges:v18 withAction:sel__propogateUserInterfaceStyleToWebModule];
    }
    self = v15;
    v20 = self;
  }
  else
  {
LABEL_7:
    v20 = 0;
  }

  return v20;
}

- (void)dealloc
{
  if (self->_webViewFactoryItem)
  {
    v3 = +[MUWebViewFactory sharedWebViewFactory];
    [v3 requeueItem:self->_webViewFactoryItem];
  }
  v4.receiver = self;
  v4.super_class = (Class)MUWebContentViewController;
  [(MUWebContentViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v45[5] = *MEMORY[0x1E4F143B8];
  v44.receiver = self;
  v44.super_class = (Class)MUWebContentViewController;
  [(MUWebContentViewController *)&v44 viewDidLoad];
  v3 = (void *)MEMORY[0x1E4F28DC8];
  objc_super v4 = [(MUWebContentViewController *)self view];
  v5 = [v3 constraintWithItem:v4 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:self->_defaultHeight];
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v5;

  id v7 = [[MUWebBridgeConfiguration alloc] initWithNativeControllerName:@"placeCardNativeController" webControllerName:@"placeCardWebController" bridgeVersion:@"1.0"];
  id v8 = +[MUWebViewFactory sharedWebViewFactory];
  v43 = v7;
  id v9 = [v8 dequeueItemWithBridgeConfiguration:v7];
  webViewFactoryItem = self->_webViewFactoryItem;
  self->_webViewFactoryItem = v9;

  char v11 = [(MUWebViewFactoryItem *)self->_webViewFactoryItem webView];
  webView = self->_webView;
  self->_webView = v11;

  [(WKWebView *)self->_webView setNavigationDelegate:self];
  [(WKWebView *)self->_webView setUIDelegate:self];
  [(WKWebView *)self->_webView setAccessibilityIdentifier:@"MUWebContentView"];
  int v13 = [(MUWebContentViewController *)self view];
  [v13 addSubview:self->_webView];

  v35 = (void *)MEMORY[0x1E4F28DC8];
  v41 = [(WKWebView *)self->_webView leadingAnchor];
  v42 = [(MUWebContentViewController *)self view];
  v40 = [v42 leadingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v45[0] = v39;
  v37 = [(WKWebView *)self->_webView trailingAnchor];
  v38 = [(MUWebContentViewController *)self view];
  v36 = [v38 trailingAnchor];
  v34 = [v37 constraintEqualToAnchor:v36];
  v45[1] = v34;
  v33 = [(WKWebView *)self->_webView topAnchor];
  id v14 = [(MUWebContentViewController *)self view];
  v15 = [v14 topAnchor];
  double v16 = [v33 constraintEqualToAnchor:v15];
  v45[2] = v16;
  v17 = [(WKWebView *)self->_webView bottomAnchor];
  v18 = [(MUWebContentViewController *)self view];
  id v19 = [v18 bottomAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  v21 = self->_heightConstraint;
  v45[3] = v20;
  v45[4] = v21;
  objc_super v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:5];
  [v35 activateConstraints:v22];

  if (self->_html)
  {
    v23 = GEOGetURL();
    v24 = [(MUWebContentTraits *)self->_webContentTraits queryItems];
    v25 = v43;
    v26 = +[MUWebBridge URLByAddingConfiguration:v43 toURL:v23 additionalQueryItems:v24];

    v27 = [(WKWebView *)self->_webView loadHTMLString:self->_html baseURL:v26];
    currentWebNavigation = self->_currentWebNavigation;
    self->_currentWebNavigation = v27;
LABEL_3:

    goto LABEL_4;
  }
  v25 = v43;
  if (self->_url)
  {
    resolvedURL = self->_resolvedURL;
    if (resolvedURL)
    {
      v30 = [(MUWebContentTraits *)self->_webContentTraits queryItems];
      v26 = +[MUWebBridge URLByAddingConfiguration:v43 toURL:resolvedURL additionalQueryItems:v30];

      currentWebNavigation = [MEMORY[0x1E4F290D0] requestWithURL:v26];
      v31 = [(WKWebView *)self->_webView loadRequest:currentWebNavigation];
      v32 = self->_currentWebNavigation;
      self->_currentWebNavigation = v31;

      goto LABEL_3;
    }
  }
LABEL_4:
  [(MUWebContentViewController *)self _startLoading];
}

- (void)_startLoading
{
  self->_loading = 1;
  [(WKWebView *)self->_webView setAlpha:0.0];
  [(MUWebContentViewController *)self _addLoadingSpinner];
}

- (void)_finishLoading
{
  if (self->_loading)
  {
    [(WKWebView *)self->_webView alpha];
    if (v3 != 1.0)
    {
      objc_super v4 = [(MUWebContentViewController *)self delegate];
      char v5 = [v4 isWebContentViewControllerParentPlacecardLoading:self];

      if (v5)
      {
        [(WKWebView *)self->_webView setAlpha:1.0];
      }
      else
      {
        [MEMORY[0x1E4F39CF8] begin];
        [MEMORY[0x1E4F39CF8] setAnimationDuration:*MEMORY[0x1E4F31140]];
        v6 = (void *)MEMORY[0x1E4F39CF8];
        id v7 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
        [v6 setAnimationTimingFunction:v7];

        [(WKWebView *)self->_webView setAlpha:1.0];
        [MEMORY[0x1E4F39CF8] commit];
      }
    }
    self->_loading = 0;
    [(MUWebContentViewController *)self _removeLoadingSpinner];
    id v8 = [(MUWebContentViewController *)self delegate];
    [v8 webContentViewControllerDidStopLoading:self];

    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"MUWebContentViewControllerDidFinishLoadingNotification" object:self];
  }
}

- (void)_cancel
{
  [(WKWebView *)self->_webView stopLoading];
  [(MUWebBridge *)self->_bridge closeConnection];
  if (self->_loading)
  {
    self->_loading = 0;
    [(MUWebContentViewController *)self _removeLoadingSpinner];
    double v3 = [(MUWebContentViewController *)self delegate];
    [v3 webContentViewControllerDidStopLoading:self];
  }
  id v4 = [(MUWebContentViewController *)self delegate];
  [v4 removeWebContentViewController:self arguments:0];
}

- (void)_addLoadingSpinner
{
  v18[2] = *MEMORY[0x1E4F143B8];
  if (!self->_activityIndicatorView)
  {
    if ([(MUWebContentViewController *)self shouldAddLoadingIndicator])
    {
      id v3 = objc_alloc(MEMORY[0x1E4FB1400]);
      id v4 = (UIActivityIndicatorView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      activityIndicatorView = self->_activityIndicatorView;
      self->_activityIndicatorView = v4;

      [(UIActivityIndicatorView *)self->_activityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIActivityIndicatorView *)self->_activityIndicatorView setActivityIndicatorViewStyle:100];
      [(UIActivityIndicatorView *)self->_activityIndicatorView startAnimating];
      v6 = self->_activityIndicatorView;
      id v7 = [(MUWebContentViewController *)self view];
      objc_msgSend(v7, "_mapkit_insertSubviewAboveAllOtherSubviews:", v6);

      v17 = (void *)MEMORY[0x1E4F28DC8];
      id v8 = [(UIActivityIndicatorView *)v6 centerXAnchor];
      id v9 = [(MUWebContentViewController *)self view];
      v10 = [v9 centerXAnchor];
      char v11 = [v8 constraintEqualToAnchor:v10];
      v18[0] = v11;
      v12 = [(UIActivityIndicatorView *)v6 centerYAnchor];
      int v13 = [(MUWebContentViewController *)self view];
      id v14 = [v13 centerYAnchor];
      v15 = [v12 constraintEqualToAnchor:v14];
      v18[1] = v15;
      double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
      [v17 activateConstraints:v16];
    }
  }
}

- (void)_removeLoadingSpinner
{
  activityIndicatorView = self->_activityIndicatorView;
  if (activityIndicatorView)
  {
    [(UIActivityIndicatorView *)activityIndicatorView removeFromSuperview];
    id v4 = self->_activityIndicatorView;
    self->_activityIndicatorView = 0;
  }
}

- (BOOL)shouldAddLoadingIndicator
{
  if (self->_url) {
    return 1;
  }
  else {
    return GEOConfigGetBOOL();
  }
}

- (void)_resetBridge
{
  bridge = self->_bridge;
  if (bridge) {
    [(MUWebBridge *)bridge closeConnection];
  }
  id v4 = [[MUWebBridge alloc] initWithWebViewFactoryItem:self->_webViewFactoryItem];
  char v5 = self->_bridge;
  self->_bridge = v4;

  [(MUWebBridge *)self->_bridge setDelegate:self];
  objc_initWeak(&location, self);
  v6 = self->_bridge;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __42__MUWebContentViewController__resetBridge__block_invoke;
  v19[3] = &unk_1E5751008;
  objc_copyWeak(&v20, &location);
  [(MUWebBridge *)v6 addCallableMethod:@"setHeight" handler:v19];
  id v7 = self->_bridge;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __42__MUWebContentViewController__resetBridge__block_invoke_2;
  v17[3] = &unk_1E5751008;
  objc_copyWeak(&v18, &location);
  [(MUWebBridge *)v7 addCallableMethod:@"getAnalyticsShortSessionSnapshot" handler:v17];
  id v8 = self->_bridge;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42__MUWebContentViewController__resetBridge__block_invoke_3;
  v15[3] = &unk_1E5751008;
  objc_copyWeak(&v16, &location);
  [(MUWebBridge *)v8 addCallableMethod:@"removeModule" handler:v15];
  if (MapsFeature_IsEnabled_PlaceCardShowcase())
  {
    id v9 = self->_bridge;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __42__MUWebContentViewController__resetBridge__block_invoke_4;
    v13[3] = &unk_1E5751008;
    objc_copyWeak(&v14, &location);
    [(MUWebBridge *)v9 addCallableMethod:@"invokeAction" handler:v13];
    v10 = self->_bridge;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __42__MUWebContentViewController__resetBridge__block_invoke_5;
    v11[3] = &unk_1E5751008;
    objc_copyWeak(&v12, &location);
    [(MUWebBridge *)v10 addCallableMethod:@"layoutActions" handler:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
  }
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __42__MUWebContentViewController__resetBridge__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _setHeight:v6 callbackHandler:v5];
}

void __42__MUWebContentViewController__resetBridge__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _getAnalyticsShortSessionSnapshotWithCallbackHandler:v4];
}

void __42__MUWebContentViewController__resetBridge__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _removeModuleWithArguments:v6 callbackHandler:v5];
}

void __42__MUWebContentViewController__resetBridge__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _invokeAction:v6 callbackHandler:v5];
}

void __42__MUWebContentViewController__resetBridge__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _layoutAction:v6 callbackHandler:v5];
}

- (void)updateActionOverBridge:(id)a3
{
  id v4 = a3;
  if (MapsFeature_IsEnabled_PlaceCardShowcase())
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v4 count])
    {
      uint64_t v6 = MEMORY[0x1E4F143A8];
      uint64_t v7 = 3221225472;
      id v8 = __53__MUWebContentViewController_updateActionOverBridge___block_invoke;
      id v9 = &unk_1E5751030;
      v10 = self;
      id v11 = v5;
      [v4 enumerateObjectsUsingBlock:&v6];
    }
    [(MUWebBridge *)self->_bridge callMethod:@"updateActions", v5, &__block_literal_global_46, v6, v7, v8, v9, v10 arguments callbackHandler];
  }
}

void __53__MUWebContentViewController_updateActionOverBridge___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 actionManager];
  id v7 = [v5 dictionaryForAction:v4];

  uint64_t v6 = v7;
  if (v7)
  {
    [*(id *)(a1 + 40) addObject:v7];
    uint64_t v6 = v7;
  }
}

void __53__MUWebContentViewController_updateActionOverBridge___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = MUGetMUWebContentLog_2();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1931EA000, v4, OS_LOG_TYPE_ERROR, "Error updating actions: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)webView:(id)a3 didCommitNavigation:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (WKNavigation *)a4;
  id v8 = MUGetMUWebContentLog_2();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v6 URL];
    int v11 = 134218242;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_impl(&dword_1931EA000, v8, OS_LOG_TYPE_INFO, "<WKWebView: %p> starting to load content with at url %@", (uint8_t *)&v11, 0x16u);
  }
  currentWebNavigation = self->_currentWebNavigation;
  self->_currentWebNavigation = v7;

  [(MUWebContentViewController *)self _startLoading];
  [(MUWebContentViewController *)self _resetBridge];
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (self->_currentWebNavigation == a4)
  {
    v10 = MUGetMUWebContentLog_2();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 134218242;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v9;
      _os_log_impl(&dword_1931EA000, v10, OS_LOG_TYPE_ERROR, "<WKWebView: %p> failed to load content with error %@", (uint8_t *)&v11, 0x16u);
    }

    [(MUWebContentViewController *)self _cancel];
  }
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (self->_currentWebNavigation == a4)
  {
    v10 = MUGetMUWebContentLog_2();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 134218242;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v9;
      _os_log_impl(&dword_1931EA000, v10, OS_LOG_TYPE_ERROR, "<WKWebView: %p> failed to load content with error %@", (uint8_t *)&v11, 0x16u);
    }

    [(MUWebContentViewController *)self _cancel];
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  v10 = MUGetMUWebContentLog_2();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 134218242;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_1931EA000, v10, OS_LOG_TYPE_DEBUG, "<WKWebView: %p> decide policy for response %@", (uint8_t *)&v14, 0x16u);
  }

  if ([v8 isForMainFrame])
  {
    int v11 = [v8 response];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      __int16 v13 = [v8 response];
      if ((unint64_t)([v13 statusCode] - 200) >= 0x64)
      {
        v9[2](v9, 0);

        goto LABEL_8;
      }
    }
  }
  v9[2](v9, 1);
LABEL_8:
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  v10 = MUGetMUWebContentLog_2();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 134218242;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_1931EA000, v10, OS_LOG_TYPE_DEBUG, "<WKWebView: %p> decide policy for action %@", (uint8_t *)&v15, 0x16u);
  }

  if ([v8 navigationType])
  {
    uint64_t v11 = 1;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F31038] sharedInstance];
    __int16 v13 = [v8 request];
    int v14 = [v13 URL];
    [v12 openURL:v14 completionHandler:0];

    uint64_t v11 = 0;
  }
  v9[2](v9, v11);
}

- (void)webBridgeDidConnect:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  bridge = self->_bridge;
  id v6 = [(MUWebContentViewController *)self mk_theme];
  id v7 = [v6 javaScriptName];
  id v8 = v7;
  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  [(MUWebBridge *)bridge callMethod:@"setTheme" arguments:v9 callbackHandler:0];

  if (!v7) {
  if (MapsFeature_IsEnabled_PlaceCardShowcase())
  }
  {
    v10 = [(MUWebContentViewController *)self actionManager];
    uint64_t v11 = [v10 supportedPlaceEnrichmentActions];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v11 count])
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __50__MUWebContentViewController_webBridgeDidConnect___block_invoke;
      v24[3] = &unk_1E5751030;
      v24[4] = self;
      id v13 = v12;
      id v25 = v13;
      [v11 enumerateObjectsUsingBlock:v24];
      id v14 = objc_alloc(MEMORY[0x1E4F1C978]);
      id v15 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v16 = (void *)[v13 copy];
      v27 = v16;
      __int16 v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
      id v18 = (void *)[v15 initWithObjects:v17 forKeys:&unk_1EE4051C8];
      uint64_t v19 = objc_msgSend(v14, "initWithObjects:", v18, 0);

      id v20 = (void *)[v19 copy];
    }
    else
    {
      id v20 = 0;
    }
  }
  else
  {
    id v20 = 0;
  }
  v21 = self->_bridge;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __50__MUWebContentViewController_webBridgeDidConnect___block_invoke_2;
  v22[3] = &unk_1E5751058;
  objc_copyWeak(&v23, &location);
  [(MUWebBridge *)v21 callMethod:@"initializeModule" arguments:v20 callbackHandler:v22];
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

void __50__MUWebContentViewController_webBridgeDidConnect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 actionManager];
  id v7 = [v5 dictionaryForAction:v4];

  id v6 = v7;
  if (v7)
  {
    [*(id *)(a1 + 40) addObject:v7];
    id v6 = v7;
  }
}

void __50__MUWebContentViewController_webBridgeDidConnect___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    int v5 = MUGetMUWebContentLog_2();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1931EA000, v5, OS_LOG_TYPE_ERROR, "Error initializing module: %@", (uint8_t *)&v7, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _cancel];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _finishLoading];
  }
}

- (void)_propogateUserInterfaceStyleToWebModule
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(MUWebBridge *)self->_bridge connectionState] == 1)
  {
    bridge = self->_bridge;
    id v4 = [(MUWebContentViewController *)self mk_theme];
    int v5 = [v4 javaScriptName];
    id v6 = v5;
    if (!v5)
    {
      id v6 = [MEMORY[0x1E4F1CA98] null];
    }
    v8[0] = v6;
    int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [(MUWebBridge *)bridge callMethod:@"setTheme" arguments:v7 callbackHandler:0];

    if (!v5) {
  }
    }
}

- (void)_setHeight:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = (void (**)(id, uint64_t))a5;
  [(NSLayoutConstraint *)self->_heightConstraint constant];
  if (v9 == a3)
  {
    if (v8) {
      v8[2](v8, 1);
    }
  }
  else
  {
    v10 = [(MUWebContentViewController *)self delegate];
    int v11 = [v10 isWebContentViewControllerParentPlacecardLoading:self];

    objc_initWeak(&location, self);
    id v12 = [(MUWebContentViewController *)self delegate];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61__MUWebContentViewController__setHeight_animated_completion___block_invoke;
    v15[3] = &unk_1E5751080;
    objc_copyWeak(v16, &location);
    v16[1] = *(id *)&a3;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__MUWebContentViewController__setHeight_animated_completion___block_invoke_74;
    v13[3] = &unk_1E5750180;
    id v14 = v8;
    [v12 webContentViewController:self performHeightChangeWithBlock:v15 animated:v5 & (v11 ^ 1u) completion:v13];

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
}

void __61__MUWebContentViewController__setHeight_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = MUGetMUWebContentLog_2();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 134217984;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1931EA000, v3, OS_LOG_TYPE_ERROR, "Setting web view height: %f", (uint8_t *)&v5, 0xCu);
    }

    [WeakRetained[122] setConstant:*(double *)(a1 + 40)];
  }
}

uint64_t __61__MUWebContentViewController__setHeight_animated_completion___block_invoke_74(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_setHeight:(id)a3 callbackHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, __CFString *))a4;
  id v8 = [v6 objectForKeyedSubscript:@"height"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_7;
  }
  double v9 = [v6 objectForKeyedSubscript:@"animated"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_7:
    v7[2](v7, 0, @"invalid arguments");
    goto LABEL_8;
  }
  int v11 = [v6 objectForKeyedSubscript:@"height"];
  [v11 doubleValue];
  double v13 = v12;

  id v14 = [v6 objectForKeyedSubscript:@"animated"];
  uint64_t v15 = [v14 BOOLValue];

  GEOConfigGetDouble();
  if (v13 < v16) {
    double v16 = v13;
  }
  double v17 = fmax(v16, 0.0);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __57__MUWebContentViewController__setHeight_callbackHandler___block_invoke;
  void v18[3] = &unk_1E5750180;
  uint64_t v19 = v7;
  [(MUWebContentViewController *)self _setHeight:v15 animated:v18 completion:v17];

LABEL_8:
}

uint64_t __57__MUWebContentViewController__setHeight_callbackHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_getAnalyticsShortSessionSnapshotWithCallbackHandler:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F64B90] sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__MUWebContentViewController__getAnalyticsShortSessionSnapshotWithCallbackHandler___block_invoke;
  v6[3] = &unk_1E57510A8;
  id v7 = v3;
  id v5 = v3;
  [v4 shortSessionValues:v6];
}

void __83__MUWebContentViewController__getAnalyticsShortSessionSnapshotWithCallbackHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, int a7, double a8, double a9, double a10)
{
  v34[3] = *MEMORY[0x1E4F143B8];
  id v15 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v33[0] = @"sessionID";
  v31[0] = @"high";
  double v16 = objc_msgSend(MEMORY[0x1E4F64B90], "highBytesStringFromSession:", a2, a3);
  v31[1] = @"low";
  v32[0] = v16;
  double v17 = objc_msgSend(MEMORY[0x1E4F64B90], "lowBytesStringFromSession:", a2, a3);
  v32[1] = v17;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  v34[0] = v18;
  v33[1] = @"sequenceNumber";
  uint64_t v19 = [NSNumber numberWithUnsignedInt:a4];
  v34[1] = v19;
  v33[2] = @"relativeTimestamp";
  id v20 = [NSNumber numberWithDouble:a10];
  v34[2] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
  objc_super v22 = (void *)[v15 initWithDictionary:v21];

  if (a7)
  {
    v29[0] = @"underagedUser";
    id v23 = [NSNumber numberWithBool:a5];
    v29[1] = @"managedAccount";
    v30[0] = v23;
    v24 = [NSNumber numberWithBool:a6];
    v30[1] = v24;
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
    [v22 addEntriesFromDictionary:v25];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_removeModuleWithArguments:(id)a3 callbackHandler:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(MUWebContentViewController *)self delegate];
  [v7 removeWebContentViewController:self arguments:v6];

  (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
}

- (void)_invokeAction:(id)a3 callbackHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MUWebContentViewController *)self actionManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__MUWebContentViewController__invokeAction_callbackHandler___block_invoke;
  v11[3] = &unk_1E574F380;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [v8 performActionUsingArguments:v9 contextMenu:0 completion:v11];
}

void __60__MUWebContentViewController__invokeAction_callbackHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    if (a2)
    {
      id v3 = *(void (**)(uint64_t, void, void))(v2 + 16);
      uint64_t v4 = *(void *)(a1 + 40);
      v3(v4, 0, 0);
    }
    else
    {
      id v5 = [NSString stringWithFormat:@"error performing actions from arguments: %@", *(void *)(a1 + 32)];
      (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v5);
    }
  }
}

- (void)_layoutAction:(id)a3 callbackHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MUWebContentViewController *)self actionManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__MUWebContentViewController__layoutAction_callbackHandler___block_invoke;
  v11[3] = &unk_1E574F380;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [v8 layoutActionsUsingArguments:v9 completion:v11];
}

void __60__MUWebContentViewController__layoutAction_callbackHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    if (a2)
    {
      id v3 = *(void (**)(uint64_t, void, void))(v2 + 16);
      uint64_t v4 = *(void *)(a1 + 40);
      v3(v4, 0, 0);
    }
    else
    {
      id v5 = [NSString stringWithFormat:@"error during layoutAction. Arguments: %@", *(void *)(a1 + 32)];
      (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v5);
    }
  }
}

+ (id)resolvedURLForRelativeURL:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = GEOGetURL();
    id v5 = (void *)MEMORY[0x1E4F1CB10];
    id v6 = [v3 relativeString];

    id v7 = [v5 URLWithString:v6 relativeToURL:v4];
    id v8 = [v7 absoluteURL];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (MUWebContentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUWebContentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (MUPlaceEnrichmentActionManager)actionManager
{
  return self->_actionManager;
}

- (void)setActionManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webContentTraits, 0);
  objc_storeStrong((id *)&self->_currentWebNavigation, 0);
  objc_storeStrong((id *)&self->_html, 0);
  objc_storeStrong((id *)&self->_resolvedURL, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_bridge, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_webViewFactoryItem, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end