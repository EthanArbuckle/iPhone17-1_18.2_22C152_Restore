@interface ServiceStoreProductViewController
- (BOOL)shouldShowOnboarding;
- (ServiceStoreProductViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ServiceStoreProductViewControllerDelegate)delegate;
- (id)_clientViewControllerProxy;
- (id)_newCancelButtonItemWithClientContext:(id)a3;
- (id)legacyScriptInterfaceForApplication:(id)a3;
- (void)_cancelButtonAction:(id)a3;
- (void)_presentOnboardingIfNeededWithCompletion:(id)a3;
- (void)_sendDidFinishWithResult:(int64_t)a3;
- (void)_sendInstallAttributionIfAllowed;
- (void)_startIfReady;
- (void)application:(id)a3 didCompletePurchase:(id)a4;
- (void)application:(id)a3 didCompleteSoftwarePurchase:(id)a4;
- (void)application:(id)a3 didFailToLoadWithError:(id)a4;
- (void)application:(id)a3 didStopWithOptions:(id)a4;
- (void)applicationDidDisplayFirstPage:(id)a3;
- (void)dealloc;
- (void)finishImmediately;
- (void)finishStarRatingPromptWithRating:(id)a3;
- (void)loadProductWithPageDictionary:(id)a3;
- (void)loadProductWithParameters:(id)a3;
- (void)loadProductWithRequest:(id)a3;
- (void)loadProductWithURL:(id)a3;
- (void)setAdditionalBuyParameters:(id)a3;
- (void)setAffiliateIdentifier:(id)a3;
- (void)setAskToBuy:(BOOL)a3;
- (void)setCancelButtonTitle:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreview:(id)a3;
- (void)setProductPageStyle:(id)a3;
- (void)setPromptString:(id)a3;
- (void)setRightBarButtonTitle:(id)a3;
- (void)setScriptContextDictionary:(id)a3;
- (void)setShouldShowOnboarding:(BOOL)a3;
- (void)setShowsRightBarButton:(BOOL)a3;
- (void)setShowsStoreButton:(BOOL)a3;
- (void)setupWithClientBundleID:(id)a3 bagType:(int64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
@end

@implementation ServiceStoreProductViewController

- (ServiceStoreProductViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v27.receiver = self;
  v27.super_class = (Class)ServiceStoreProductViewController;
  v4 = [(ServiceStoreProductViewController *)&v27 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    id v5 = objc_alloc_init((Class)SKUIMutableApplicationControllerOptions);
    [v5 setPageRenderMetricsEnabled:1];
    v6 = (SKUIApplicationController *)[objc_alloc((Class)SKUIApplicationController) initWithClientContextClass:objc_opt_class() options:v5];
    applicationController = v4->_applicationController;
    v4->_applicationController = v6;

    [(SKUIApplicationController *)v4->_applicationController setDelegate:v4];
    [(SKUIApplicationController *)v4->_applicationController _setHidesTabBar:1];
    id v8 = [objc_alloc((Class)SKUITabBarItem) initWithTabIdentifier:@"main"];
    v9 = v4->_applicationController;
    id v28 = v8;
    v10 = +[NSArray arrayWithObjects:&v28 count:1];
    [(SKUIApplicationController *)v9 setTabBarItems:v10];

    v11 = [(SKUIApplicationController *)v4->_applicationController clientContext];
    id v12 = [(ServiceStoreProductViewController *)v4 _newCancelButtonItemWithClientContext:v11];

    id v13 = objc_alloc_init((Class)UIViewController);
    v14 = [v13 navigationItem];
    [v14 setLeftBarButtonItem:v12];

    v15 = [v13 view];
    v16 = +[UIColor whiteColor];
    [v15 setBackgroundColor:v16];

    v17 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:v13];
    loadingPlaceholderViewController = v4->_loadingPlaceholderViewController;
    v4->_loadingPlaceholderViewController = v17;

    v19 = objc_alloc_init(ServiceProductPageConfiguration);
    pageConfiguration = v4->_pageConfiguration;
    v4->_pageConfiguration = v19;

    [(ServiceProductPageConfiguration *)v4->_pageConfiguration setShowsStoreButton:1];
    v21 = +[NSUUID UUID];
    v22 = [v21 UUIDString];
    v23 = [v22 componentsSeparatedByString:@"-"];
    uint64_t v24 = [v23 firstObject];
    logKey = v4->_logKey;
    v4->_logKey = (NSString *)v24;
  }
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SKUIApplicationController *)self->_applicationController rootViewController];
  self->_didShow = 1;
  [(ServiceStoreProductViewController *)self _sendInstallAttributionIfAllowed];
  if ((SKUIViewControllerIsDescendent() & 1) == 0)
  {
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100014C94;
    v7[3] = &unk_10004D350;
    objc_copyWeak(&v10, &location);
    id v8 = v5;
    v9 = self;
    [(ServiceStoreProductViewController *)self _presentOnboardingIfNeededWithCompletion:v7];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  v6.receiver = self;
  v6.super_class = (Class)ServiceStoreProductViewController;
  [(ServiceStoreProductViewController *)&v6 viewDidAppear:v3];
}

- (void)viewDidLayoutSubviews
{
  loadingPlaceholderViewController = self->_loadingPlaceholderViewController;
  if (loadingPlaceholderViewController)
  {
    v4 = [(UINavigationController *)loadingPlaceholderViewController parentViewController];

    if (!v4)
    {
      id v5 = [(SKUIApplicationController *)self->_applicationController rootViewController];
      [v5 addChildViewController:self->_loadingPlaceholderViewController];
      objc_super v6 = [v5 view];
      v7 = [(UINavigationController *)self->_loadingPlaceholderViewController view];
      [v7 setAutoresizingMask:18];
      [v6 bounds];
      [v7 setFrame:];
      [v6 addSubview:v7];
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)ServiceStoreProductViewController;
  [(ServiceStoreProductViewController *)&v8 viewDidLayoutSubviews];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_preview) {
    [(SKUIApplicationController *)self->_applicationController _resetDocumentControllers];
  }
  v5.receiver = self;
  v5.super_class = (Class)ServiceStoreProductViewController;
  [(ServiceStoreProductViewController *)&v5 viewDidDisappear:v3];
}

- (void)dealloc
{
  [(SKUIApplicationController *)self->_applicationController _stopApplication];
  [(SKUIApplicationController *)self->_applicationController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)ServiceStoreProductViewController;
  [(ServiceStoreProductViewController *)&v3 dealloc];
}

- (void)loadProductWithParameters:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    int v6 = 138543618;
    v7 = self;
    __int16 v8 = 2114;
    v9 = logKey;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Loading product with page parameters.", (uint8_t *)&v6, 0x16u);
  }
  [(ServiceProductPageConfiguration *)self->_pageConfiguration setProductParameters:v4];
  [(ServiceStoreProductViewController *)self _startIfReady];
}

- (void)_startIfReady
{
  if (!self->_didStart
    && [(ServiceStoreProductViewController *)self isViewLoaded]
    && [(ServiceProductPageConfiguration *)self->_pageConfiguration isLoadable])
  {
    id v3 = [(SKUIApplicationController *)self->_applicationController _applicationMode];
    if (v3 == (id)2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10002D8C0();
      }
      id v5 = objc_alloc((Class)NSError);
      id v4 = [v5 initWithDomain:SKUIErrorDomain code:0 userInfo:0];
      int v6 = [(ServiceStoreProductViewController *)self _clientViewControllerProxy];
      [v6 loadDidFinishWithResult:&__kCFBooleanFalse error:v4];
    }
    else if (v3 == (id)1)
    {
      id v4 = [(ServiceProductPageConfiguration *)self->_pageConfiguration copyITMLOptionsDictionary];
      [(SKUIApplicationController *)self->_applicationController resumeApplicationWithOptions:v4];
    }
    else
    {
      if (v3)
      {
LABEL_13:
        self->_didStart = 1;
        return;
      }
      id v4 = [(ServiceProductPageConfiguration *)self->_pageConfiguration copyITMLOptionsDictionary];
      [(SKUIApplicationController *)self->_applicationController loadApplicationWithOptions:v4];
    }

    goto LABEL_13;
  }
}

- (id)_clientViewControllerProxy
{
  v2 = [(ServiceStoreProductViewController *)self delegate];
  id v3 = [v2 serviceProductPageViewControllerClientProxy];

  return v3;
}

- (void)_sendInstallAttributionIfAllowed
{
  if (self->_didLoad && self->_didShow)
  {
    id v3 = [(ServiceProductPageConfiguration *)self->_pageConfiguration productParameters];
    id v4 = [v3 objectForKeyedSubscript:SKStoreProductParameterAdNetworkIdentifier];
    if (v4)
    {
      id v5 = [(ServiceStoreProductViewController *)self _hostApplicationBundleIdentifier];
      int v6 = +[LSApplicationProxy applicationProxyForIdentifier:v5];
      v7 = [v6 itemID];
      id v8 = [v7 unsignedIntegerValue];

      if (v8)
      {
        v22 = v4;
        v23 = v6;
        uint64_t v9 = [v3 objectForKeyedSubscript:SKStoreProductParameterITunesItemIdentifier];
        [v3 objectForKeyedSubscript:SKStoreProductParameterAdNetworkCampaignIdentifier];
        uint64_t v10 = v21 = v5;
        v11 = [v3 objectForKeyedSubscript:SKStoreProductParameterAdNetworkNonce];
        id v12 = [v3 objectForKeyedSubscript:SKStoreProductParameterAdNetworkTimestamp];
        id v13 = [v3 objectForKeyedSubscript:SKStoreProductParameterAdNetworkAttributionSignature];
        v14 = [v3 objectForKeyedSubscript:SKStoreProductParameterAdNetworkVersion];
        v15 = [v3 objectForKeyedSubscript:SKStoreProductParameterAdNetworkSourceAppStoreIdentifier];
        v16 = objc_opt_new();
        uint64_t v24 = (void *)v9;
        uint64_t v17 = v9;
        v18 = (void *)v10;
        id v5 = v21;
        [v16 setAppAdamId:v17];
        [v16 setAdNetworkId:@"com.apple.advp"];
        [v16 setCampaignId:v18];
        [v16 setImpressionId:v11];
        [v16 setSourceAppAdamId:v15];
        [v16 setTimestamp:v12];
        [v16 setAttributionSignature:v13];
        [v16 setSourceAppBundleId:v21];
        [v16 setOverrideCampaignLimit:0];
        [v16 setVersion:v14];
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          logKey = self->_logKey;
          *(_DWORD *)buf = 138544130;
          v26 = self;
          __int16 v27 = 2114;
          id v28 = logKey;
          __int16 v29 = 2114;
          v30 = v21;
          __int16 v31 = 2114;
          v32 = v15;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: SKAdNetwork - Adding install attribution params for source app bundle ID: %{public}@ adam ID: %{public}@", buf, 0x2Au);
        }
        v20 = +[ASDInstallAttribution sharedInstance];
        [v20 addInstallAttributionParamsWithConfig:v16];

        id v4 = v22;
        int v6 = v23;
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10002D9B8();
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10002D93C();
    }
  }
}

- (id)_newCancelButtonItemWithClientContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)UIBarButtonItem);
  [v5 setAction:"_cancelButtonAction:"];
  [v5 setTarget:self];
  if (v4)
  {
    int v6 = [v4 localizedStringForKey:@"CLOSE_SHEET_BUTTON"];
    [v5 setTitle:v6];
  }
  else
  {
    int v6 = SKUIBundle();
    v7 = [v6 localizedStringForKey:@"CLOSE_SHEET_BUTTON" value:&stru_10004DF18 table:0];
    [v5 setTitle:v7];
  }
  return v5;
}

- (void)_cancelButtonAction:(id)a3
{
}

- (void)_presentOnboardingIfNeededWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([sub_100015774() shouldShowOnboarding])
  {
    if (!self->_presentingOnboarding
      && [(ServiceStoreProductViewController *)self shouldShowOnboarding])
    {
      self->_presentingOnboarding = 1;
      id v5 = self;
      id v6 = sub_100015774();
      v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472;
      v20 = sub_100015858;
      v21 = &unk_10004D548;
      v22 = v5;
      v23 = v4;
      v7 = [v6 viewControllerForMediaType:0 completion:&v18];
      id v8 = [v7 view:v18, v19, v20, v21, v22];
      uint64_t v9 = [(ServiceStoreProductViewController *)v5 view];
      [v9 bounds];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      [v8 frame];
      [(ServiceStoreProductViewController *)v5 addChildViewController:v7];
      [v8 setAutoresizingMask:18];
      [v8 setFrame:v11, 0.0, v13, v15];
      v16 = [(ServiceStoreProductViewController *)v5 view];
      uint64_t v17 = [v7 view];
      [v16 addSubview:v17];

      [v7 didMoveToParentViewController:v5];
    }
  }
  else
  {
    v4[2](v4);
  }
}

- (id)legacyScriptInterfaceForApplication:(id)a3
{
  id v3 = objc_alloc_init((Class)SKScriptInterface);

  return v3;
}

- (void)application:(id)a3 didCompletePurchase:(id)a4
{
  self->_didPurchase = 1;
}

- (void)application:(id)a3 didCompleteSoftwarePurchase:(id)a4
{
  self->_didPurchase = 1;
}

- (void)application:(id)a3 didFailToLoadWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10002DA34();
  }
  id v8 = objc_alloc((Class)_UIContentUnavailableView);
  uint64_t v9 = [v6 clientContext];
  double v10 = SKUIErrorDocumentTitle();
  id v11 = [v8 initWithFrame:v10 title:0 origin:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];

  double v12 = [(UINavigationController *)self->_loadingPlaceholderViewController topViewController];
  [v12 setView:v11];

  double v13 = [(ServiceStoreProductViewController *)self _clientViewControllerProxy];
  [v13 loadDidFinishWithResult:&__kCFBooleanFalse error:v7];
}

- (void)application:(id)a3 didStopWithOptions:(id)a4
{
  id v5 = [a4 objectForKey:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v5 isEqualToString:@"close"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"download-complete"])
    {
      uint64_t v6 = 2;
    }
    else if (([v5 isEqualToString:@"goto-store"] & 1) != 0 {
           || ([v5 isEqualToString:@"goto-url"] & 1) != 0)
    }
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"purchased"])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"right"])
    {
      uint64_t v6 = 5;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    int v8 = 138543874;
    uint64_t v9 = self;
    __int16 v10 = 2114;
    id v11 = logKey;
    __int16 v12 = 2114;
    double v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Product load stopped with type: %{public}@.", (uint8_t *)&v8, 0x20u);
  }
  [(ServiceStoreProductViewController *)self _sendDidFinishWithResult:v6];
}

- (void)applicationDidDisplayFirstPage:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    int v8 = 138543618;
    uint64_t v9 = self;
    __int16 v10 = 2114;
    id v11 = logKey;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Product load completed.", (uint8_t *)&v8, 0x16u);
  }
  id v5 = [(UINavigationController *)self->_loadingPlaceholderViewController view];
  [v5 removeFromSuperview];

  [(UINavigationController *)self->_loadingPlaceholderViewController removeFromParentViewController];
  loadingPlaceholderViewController = self->_loadingPlaceholderViewController;
  self->_loadingPlaceholderViewController = 0;

  id v7 = [(ServiceStoreProductViewController *)self _clientViewControllerProxy];
  [v7 loadDidFinishWithResult:&__kCFBooleanTrue error:0];

  self->_didLoad = 1;
  [(ServiceStoreProductViewController *)self _sendInstallAttributionIfAllowed];
}

- (void)_sendDidFinishWithResult:(int64_t)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    *(_DWORD *)buf = 138543874;
    __int16 v10 = self;
    __int16 v11 = 2114;
    __int16 v12 = logKey;
    __int16 v13 = 2048;
    int64_t v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Product finished with result: %ld.", buf, 0x20u);
  }
  uint64_t v6 = [(ServiceStoreProductViewController *)self delegate];
  [v6 serviceProductPageViewControllerFinishWithResult:a3];

  [(SKUIApplicationController *)self->_applicationController _resetDocumentControllers];
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016064;
  block[3] = &unk_10004CEB0;
  block[4] = self;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)finishImmediately
{
}

- (void)finishStarRatingPromptWithRating:(id)a3
{
  starRatingCompletionBlock = (void (**)(id, BOOL))self->_starRatingCompletionBlock;
  if (starRatingCompletionBlock)
  {
    BOOL v5 = a3 != 0;
    [a3 floatValue];
    starRatingCompletionBlock[2](starRatingCompletionBlock, v5);
    id v6 = self->_starRatingCompletionBlock;
    self->_starRatingCompletionBlock = 0;
  }
}

- (void)loadProductWithPageDictionary:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    int v6 = 138543618;
    dispatch_time_t v7 = self;
    __int16 v8 = 2114;
    uint64_t v9 = logKey;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Loading product with page dictionary.", (uint8_t *)&v6, 0x16u);
  }
  [(ServiceProductPageConfiguration *)self->_pageConfiguration setProductPageDictionary:v4];
  [(ServiceStoreProductViewController *)self _startIfReady];
}

- (void)loadProductWithRequest:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    int v10 = 138543618;
    __int16 v11 = self;
    __int16 v12 = 2114;
    __int16 v13 = logKey;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Loading product with encoded request.", (uint8_t *)&v10, 0x16u);
  }
  id v6 = [objc_alloc((Class)SKStorePageRequest) initWithXPCEncoding:v4];
  -[ServiceProductPageConfiguration setProductPageStyle:](self->_pageConfiguration, "setProductPageStyle:", [v6 productPageStyle]);
  dispatch_time_t v7 = [v6 productURL];
  pageConfiguration = self->_pageConfiguration;
  if (v7)
  {
    [(ServiceProductPageConfiguration *)pageConfiguration setProductURL:v7];
  }
  else
  {
    uint64_t v9 = [v6 productParameters];
    [(ServiceProductPageConfiguration *)pageConfiguration setProductParameters:v9];
  }
  [(ServiceStoreProductViewController *)self _startIfReady];
}

- (void)loadProductWithURL:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10002DAC4((uint64_t)self, a3);
  }
  BOOL v5 = [(ServiceStoreProductViewController *)self _clientViewControllerProxy];
  [v5 loadDidFinishWithResult:&__kCFBooleanFalse error:0];
}

- (void)setAdditionalBuyParameters:(id)a3
{
  applicationController = self->_applicationController;
  id v4 = a3;
  id v5 = [(SKUIApplicationController *)applicationController clientContext];
  [v5 _setAdditionalPurchaseParameters:v4];
}

- (void)setAffiliateIdentifier:(id)a3
{
  applicationController = self->_applicationController;
  id v4 = a3;
  id v5 = [(SKUIApplicationController *)applicationController clientContext];
  [v5 _setPurchaseAffiliateIdentifier:v4];
}

- (void)setAskToBuy:(BOOL)a3
{
}

- (void)setCancelButtonTitle:(id)a3
{
}

- (void)setClientIdentifier:(id)a3
{
  applicationController = self->_applicationController;
  id v4 = a3;
  id v5 = [(SKUIApplicationController *)applicationController clientContext];
  id v6 = [v5 clientInterface];

  [v6 setClientIdentifier:v4];
}

- (void)setPreview:(id)a3
{
  id v4 = [a3 BOOLValue];
  self->_preview = (char)v4;
  [(UINavigationController *)self->_loadingPlaceholderViewController setNavigationBarHidden:v4];
  id v5 = [(SKUIApplicationController *)self->_applicationController clientContext];
  [v5 sendAppPreviewStateChanged:self->_preview];
}

- (void)setProductPageStyle:(id)a3
{
  pageConfiguration = self->_pageConfiguration;
  id v4 = [a3 integerValue];

  [(ServiceProductPageConfiguration *)pageConfiguration setProductPageStyle:v4];
}

- (void)setPromptString:(id)a3
{
}

- (void)setRightBarButtonTitle:(id)a3
{
}

- (void)setScriptContextDictionary:(id)a3
{
}

- (void)setShowsRightBarButton:(BOOL)a3
{
}

- (void)setShowsStoreButton:(BOOL)a3
{
}

- (void)setupWithClientBundleID:(id)a3 bagType:(int64_t)a4
{
  id v6 = a3;
  dispatch_time_t v7 = [(SKUIApplicationController *)self->_applicationController clientContext];
  id v12 = v6;
  [v7 setHostApplicationIdentifier:v12];
  [(ServiceProductPageConfiguration *)self->_pageConfiguration setHostApplicationIdentifier:v12];
  if (v12)
  {
    id v8 = objc_alloc_init((Class)SKUIURL);
    [v8 setReferrerApplicationName:v12];
    [v7 setPurchaseReferrerURL:v8];
  }
  [v7 _setPurchaseURLBagType:a4];
  uint64_t v9 = +[LSApplicationProxy applicationProxyForIdentifier:v12];
  int v10 = [v9 itemID];
  __int16 v11 = [v10 stringValue];
  [v7 _setPurchaseAffiliateIdentifier:v11];
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  dispatch_time_t v7 = [(SKUIApplicationController *)self->_applicationController rootViewController];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 view];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;

    if (v13 != v11)
    {
      int64_t v14 = [(ServiceStoreProductViewController *)self transitionCoordinator];
      [v8 viewWillTransitionToSize:v14 withTransitionCoordinator:v13, v11];
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)ServiceStoreProductViewController;
  [(ServiceStoreProductViewController *)&v15 willRotateToInterfaceOrientation:a3 duration:a4];
}

- (ServiceStoreProductViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ServiceStoreProductViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldShowOnboarding
{
  return self->_shouldShowOnboarding;
}

- (void)setShouldShowOnboarding:(BOOL)a3
{
  self->_shouldShowOnboarding = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_pageConfiguration, 0);
  objc_storeStrong((id *)&self->_loadingPlaceholderViewController, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);

  objc_storeStrong(&self->_starRatingCompletionBlock, 0);
}

@end