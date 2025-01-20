@interface AMSUIWebViewController
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
+ (id)keyPathsForValuesAffectingEdgesPropagatingSafeAreaInsetsToSubviews;
+ (id)verifyTrustedURL:(id)a3 bag:(id)a4;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSProcessInfo)clientInfo;
- (AMSUIWebAppearance)appearance;
- (AMSUIWebClientContext)context;
- (AMSUIWebContainerViewController)rootContainer;
- (AMSUIWebDelegate)delegate;
- (AMSUIWebPageViewController)webPage;
- (AMSUIWebViewController)initWithBag:(id)a3;
- (AMSUIWebViewController)initWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)hasAppeared;
- (BOOL)hasStarted;
- (BOOL)loadUsingWebKit;
- (BOOL)reducedMemoryMode;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (NSDictionary)clientOptions;
- (NSDictionary)metricsOverlay;
- (NSURL)lastLoadedURL;
- (UILabel)automationView;
- (UIViewController)childViewController;
- (id)_applyMappingsToURL:(id)a3;
- (id)_buildRequestWithRequest:(id)a3 bagValue:(id)a4;
- (id)_handleAuthenticateCloudRequest:(id)a3 pauseTimeouts:(BOOL)a4;
- (id)_handleAuthenticateRequest:(id)a3 pauseTimeouts:(BOOL)a4;
- (id)_handleDialogRequest:(id)a3 pauseTimeouts:(BOOL)a4;
- (id)_handleEngagementRequest:(id)a3 pauseTimeouts:(BOOL)a4;
- (id)_lazyPromiseForBagSnapshot;
- (id)_lazyPromiseForLoadingRequest:(id)a3 bagValue:(id)a4;
- (id)_lazyPromiseForLoadingSession;
- (id)_lazyPromiseForPageLoad;
- (id)_loadMescalSessionForRequestWithURL:(id)a3;
- (id)_loadRequest:(id)a3 bagValue:(id)a4;
- (id)_parseWebPropertiesFromRequest:(id)a3;
- (id)_rootNavigationController;
- (id)_shouldReplaceCurrentAccountAfterSuccessfulAuth;
- (id)_stringForLoadState:(int64_t)a3;
- (id)action:(id)a3 didResolveWithResult:(id)a4 error:(id)a5;
- (id)action:(id)a3 handleActionObject:(id)a4;
- (id)action:(id)a3 pauseTimeouts:(BOOL)a4 handleAuthenticateCloudRequest:(id)a5;
- (id)action:(id)a3 pauseTimeouts:(BOOL)a4 handleAuthenticateRequest:(id)a5;
- (id)action:(id)a3 pauseTimeouts:(BOOL)a4 handleDialogRequest:(id)a5;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (id)loadBagValue:(id)a3;
- (id)loadRequest:(id)a3;
- (id)loadURL:(id)a3;
- (id)presentingSceneIdentifier;
- (id)presentingWindow;
- (id)runJSRequest:(id)a3;
- (int64_t)currentLoadState;
- (unint64_t)edgesPropagatingSafeAreaInsetsToSubviews;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6;
- (void)_dismiss;
- (void)_handleDidEncodeNetworkRequest:(id)a3;
- (void)_showErrorViewWithError:(id)a3 request:(id)a4 bagValue:(id)a5;
- (void)action:(id)a3 didEncodeNetworkRequest:(id)a4;
- (void)actionDidFinishPurchaseWithResult:(id)a3 error:(id)a4;
- (void)loadView;
- (void)protocolHandler:(id)a3 didEncodeNetworkRequest:(id)a4;
- (void)setAccount:(id)a3;
- (void)setAppearance:(id)a3;
- (void)setAutomationView:(id)a3;
- (void)setBag:(id)a3;
- (void)setChildViewController:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setClientOptions:(id)a3;
- (void)setCurrentLoadState:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHasAppeared:(BOOL)a3;
- (void)setHasStarted:(BOOL)a3;
- (void)setLastLoadedURL:(id)a3;
- (void)setLoadUsingWebKit:(BOOL)a3;
- (void)setMetricsOverlay:(id)a3;
- (void)setReducedMemoryMode:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)webPageViewController:(id)a3 didEncodeNetworkRequest:(id)a4;
@end

@implementation AMSUIWebViewController

- (AMSUIWebViewController)initWithBag:(id)a3
{
  v4 = (void *)MEMORY[0x263F27E08];
  id v5 = a3;
  v6 = [v4 currentProcess];
  v7 = [(AMSUIWebViewController *)self initWithBag:v5 account:0 clientInfo:v6];

  return v7;
}

- (AMSUIWebViewController)initWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(AMSUIWebViewController *)self initWithNibName:0 bundle:0];
  if (v11)
  {
    uint64_t v12 = AMSSetLogKey();
    v13 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v13)
    {
      v13 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = objc_opt_class();
      __int16 v37 = 2114;
      uint64_t v38 = v12;
      _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Initializing web view controller", buf, 0x16u);
    }

    v15 = [[AMSUIWebClientContext alloc] initWithAccount:v9 clientInfo:v10 backingBag:v8];
    context = v11->_context;
    v11->_context = v15;

    [(AMSUIWebClientContext *)v11->_context setActionDelegate:v11];
    v17 = (void *)[objc_alloc(MEMORY[0x263F27D40]) initWithContainerID:@"com.apple.AppleMediaServices" bag:v8];
    [(AMSUIWebClientContext *)v11->_context setMetrics:v17];

    [(AMSUIWebClientContext *)v11->_context setLoadUsingWebKit:0];
    [(AMSUIWebClientContext *)v11->_context setLogKey:v12];
    v18 = [[AMSUIWebJSDataProvider alloc] initWithContext:v11->_context];
    [(AMSUIWebClientContext *)v11->_context setDataProvider:v18];
    v19 = [[AMSUIWebPageViewController alloc] initWithContext:v11->_context dataProvider:v18];
    [(AMSUIWebPageViewController *)v19 setDelegate:v11];
    [(AMSUIWebClientContext *)v11->_context setWebPage:v19];
    v34 = (void *)v12;
    webPage = v11->_webPage;
    v11->_webPage = v19;
    v33 = v19;

    id v21 = v8;
    id v22 = v10;
    id v23 = v9;
    v24 = [[AMSUIWebPlaceholderViewController alloc] initWithContext:v11->_context];
    [(AMSUIWebPlaceholderViewController *)v24 setAnimateFadeIn:1];
    v25 = [AMSUIWebContainerViewController alloc];
    v26 = +[AMSUIWebAppearance defaultAppearance];
    v27 = [(AMSUIWebContainerViewController *)v25 initWithViewController:v24 appearance:v26 navigationBar:0 context:v11->_context];

    [(AMSUIWebContainerViewController *)v27 setShouldSkipInitialRefresh:1];
    rootContainer = v11->_rootContainer;
    v11->_rootContainer = v27;
    v29 = v27;

    v30 = [[AMSUIWebFlowController alloc] initWithRootContainer:v11->_rootContainer context:v11->_context];
    [(AMSUIWebClientContext *)v11->_context setFlowController:v30];
    v31 = [[AMSUIWebPluginLoader alloc] initWithContext:v11->_context];
    [(AMSUIWebClientContext *)v11->_context setPluginLoader:v31];

    id v9 = v23;
    id v10 = v22;
    id v8 = v21;
  }
  return v11;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)loadView
{
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebViewController;
  [(AMSUICommonViewController *)&v13 loadView];
  v3 = [(AMSUICommonViewController *)self view];
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, 360.0, 500.0);

  v4 = [(AMSUIWebViewController *)self rootContainer];
  [(AMSUIWebViewController *)self setChildViewController:v4];
  id v5 = +[AMSUIWebAppearance defaultPlatformBackgroundColor];
  [(UIViewController *)self ams_setBackgroundColor:v5];

  v6 = [(AMSUIWebViewController *)self childViewController];
  [(UIViewController *)self ams_setChildViewController:v6];

  if ([MEMORY[0x263F27BE0] automationMode])
  {
    v7 = [(AMSUIWebViewController *)self automationView];
    if (v7)
    {
LABEL_5:

      goto LABEL_6;
    }
    if (os_variant_has_internal_content())
    {
      id v8 = objc_alloc(MEMORY[0x263F828E0]);
      id v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      [(AMSUIWebViewController *)self setAutomationView:v9];

      id v10 = [(AMSUIWebViewController *)self automationView];
      [v10 setText:@"WK2"];

      v11 = [(AMSUIWebViewController *)self automationView];
      [v11 setAlpha:0.05];

      v7 = [(AMSUICommonViewController *)self view];
      uint64_t v12 = [(AMSUIWebViewController *)self automationView];
      [v7 addSubview:v12];

      goto LABEL_5;
    }
  }
LABEL_6:
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)AMSUIWebViewController;
  [(AMSUIWebViewController *)&v18 viewWillAppear:a3];
  v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v6;
    __int16 v21 = 2114;
    id v22 = v7;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Web view controller is appearing", buf, 0x16u);
  }
  if (![(AMSUIWebViewController *)self hasAppeared])
  {
    id v8 = [(AMSUIWebViewController *)self _rootNavigationController];
    id v9 = [v8 viewControllers];
    uint64_t v10 = [v9 count];

    if (v10 == 1)
    {
      v11 = [(AMSUIWebViewController *)self _rootNavigationController];
      [v11 setNavigationBarHidden:1];
    }
  }
  uint64_t v12 = [(UIViewController *)self ams_parentContainer];
  objc_super v13 = [v12 appearance];

  v14 = +[AMSUIWebAppearance systemBackgroundColor];
  uint64_t v15 = [v13 backgroundColor];
  v16 = (void *)v15;
  if (v15) {
    v17 = (void *)v15;
  }
  else {
    v17 = v14;
  }
  [(UIViewController *)self ams_setBackgroundColor:v17];

  [(AMSUIWebViewController *)self setHasAppeared:1];
}

- (void)viewWillLayoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)AMSUIWebViewController;
  [(AMSUIWebViewController *)&v36 viewWillLayoutSubviews];
  v3 = [(AMSUICommonViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(AMSUIWebViewController *)self childViewController];
  objc_super v13 = [v12 view];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

  v14 = [(AMSUIWebViewController *)self automationView];

  if (v14)
  {
    uint64_t v15 = [(AMSUIWebViewController *)self automationView];
    v16 = [(AMSUICommonViewController *)self view];
    [v16 bounds];
    objc_msgSend(v15, "sizeThatFits:", v17, v18);
    double v20 = v19;
    double v22 = v21;

    uint64_t v23 = [(AMSUICommonViewController *)self view];
    [v23 bounds];
    double v25 = v24 - v20;
    v26 = [(AMSUICommonViewController *)self view];
    [v26 safeAreaInsets];
    double v28 = v25 - v27 + -10.0;
    v29 = [(AMSUICommonViewController *)self view];
    [v29 bounds];
    double v31 = v30 - v22;
    v32 = [(AMSUICommonViewController *)self view];
    [v32 safeAreaInsets];
    double v34 = v31 - v33;
    v35 = [(AMSUIWebViewController *)self automationView];
    objc_msgSend(v35, "setFrame:", v28, v34, v20, v22);
  }
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  double v4 = [(AMSUIWebViewController *)self context];
  double v5 = [v4 flowController];
  double v6 = [v5 currentContainer];
  double v7 = [v6 contentScrollViewForEdge:a3];

  return v7;
}

- (unint64_t)edgesPropagatingSafeAreaInsetsToSubviews
{
  v2 = [(AMSUIWebViewController *)self webPage];
  v3 = [v2 view];

  unint64_t v4 = [v3 edgesPropagatingSafeAreaInsetsToSubviews];
  return v4;
}

+ (id)keyPathsForValuesAffectingEdgesPropagatingSafeAreaInsetsToSubviews
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"webPage.view.edgesPropagatingSafeAreaInsetsToSubviews", 0);
}

- (ACAccount)account
{
  v2 = [(AMSUIWebViewController *)self context];
  v3 = [v2 account];

  return (ACAccount *)v3;
}

- (AMSBagProtocol)bag
{
  v2 = [(AMSUIWebViewController *)self context];
  v3 = [v2 bag];

  return (AMSBagProtocol *)v3;
}

- (AMSUIWebAppearance)appearance
{
  v2 = [(AMSUIWebViewController *)self rootContainer];
  v3 = [v2 appearance];

  return (AMSUIWebAppearance *)v3;
}

- (AMSProcessInfo)clientInfo
{
  v2 = [(AMSUIWebViewController *)self context];
  v3 = [v2 clientInfo];

  return (AMSProcessInfo *)v3;
}

- (NSDictionary)clientOptions
{
  v2 = [(AMSUIWebViewController *)self context];
  v3 = [v2 clientOptions];

  return (NSDictionary *)v3;
}

- (BOOL)loadUsingWebKit
{
  v2 = [(AMSUIWebViewController *)self context];
  char v3 = [v2 loadUsingWebKit];

  return v3;
}

- (NSDictionary)metricsOverlay
{
  v2 = [(AMSUIWebViewController *)self context];
  char v3 = [v2 metricsOverlay];

  return (NSDictionary *)v3;
}

- (BOOL)reducedMemoryMode
{
  v2 = [(AMSUIWebViewController *)self context];
  char v3 = [v2 reducedMemoryMode];

  return v3;
}

- (void)setAccount:(id)a3
{
  id v4 = a3;
  id v7 = [(AMSUIWebViewController *)self context];
  double v5 = [(AMSUIWebViewController *)self context];
  double v6 = [v5 clientInfo];
  [v7 replaceCurrentAccount:v4 clientInfo:v6];
}

- (void)setAppearance:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIWebViewController *)self rootContainer];
  [v5 setAppearance:v4];
}

- (void)setBag:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIWebViewController *)self context];
  [v5 updateBackingBag:v4];
}

- (void)setClientInfo:(id)a3
{
  id v4 = a3;
  id v7 = [(AMSUIWebViewController *)self context];
  id v5 = [(AMSUIWebViewController *)self context];
  double v6 = [v5 account];
  [v7 replaceCurrentAccount:v6 clientInfo:v4];
}

- (void)setClientOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIWebViewController *)self context];
  [v5 setClientOptions:v4];

  id v8 = [(AMSUIWebViewController *)self context];
  double v6 = [v8 dataProvider];
  id v7 = (id)[v6 syncProperties];
}

- (void)setLoadUsingWebKit:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AMSUIWebViewController *)self context];
  [v4 setLoadUsingWebKit:v3];
}

- (void)setMetricsOverlay:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v5)
  {
    id v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  double v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = AMSLogKey();
    int v10 = 138543874;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    objc_super v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Metrics overlay updated: %@", (uint8_t *)&v10, 0x20u);
  }
  double v9 = [(AMSUIWebViewController *)self context];
  [v9 setMetricsOverlay:v4];
}

- (void)setReducedMemoryMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AMSUIWebViewController *)self context];
  [v4 setReducedMemoryMode:v3];
}

- (id)loadBagValue:(id)a3
{
  return [(AMSUIWebViewController *)self _loadRequest:0 bagValue:a3];
}

- (id)loadRequest:(id)a3
{
  return [(AMSUIWebViewController *)self _loadRequest:a3 bagValue:0];
}

- (id)loadURL:(id)a3
{
  id v4 = [MEMORY[0x263F08BD8] requestWithURL:a3];
  id v5 = [(AMSUIWebViewController *)self _loadRequest:v4 bagValue:0];

  return v5;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 1;
}

- (id)runJSRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIWebViewController *)self context];
  double v6 = [v5 dataProvider];
  uint64_t v7 = [v6 runJSRequest:v4];

  return v7;
}

+ (id)verifyTrustedURL:(id)a3 bag:(id)a4
{
  id v5 = a3;
  double v6 = [a4 arrayForKey:@"trustedWebDomains"];
  uint64_t v7 = [v6 valuePromise];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__AMSUIWebViewController_verifyTrustedURL_bag___block_invoke;
  v13[3] = &unk_2643E4A58;
  id v14 = v5;
  id v8 = v5;
  double v9 = [v7 thenWithBlock:v13];
  int v10 = [v9 catchWithBlock:&__block_literal_global_34];

  uint64_t v11 = [v10 binaryPromiseAdapter];

  return v11;
}

id __47__AMSUIWebViewController_verifyTrustedURL_bag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) host];
  id v5 = [v4 lowercaseString];

  if ([v5 length])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v11, "hasPrefix:", @".", (void)v16))
          {
            if ([v5 hasSuffix:v11]) {
              goto LABEL_14;
            }
          }
          else if ([v5 isEqualToString:v11])
          {
LABEL_14:
            objc_super v13 = [MEMORY[0x263F27E10] promiseWithResult:MEMORY[0x263EFFA88]];

            goto LABEL_17;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    __int16 v12 = (void *)MEMORY[0x263F27E10];
  }
  else
  {
    __int16 v12 = (void *)MEMORY[0x263F27E10];
  }
  id v14 = AMSError();
  objc_super v13 = [v12 promiseWithError:v14];

LABEL_17:
  return v13;
}

id __47__AMSUIWebViewController_verifyTrustedURL_bag___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (AMSErrorIsEqual()) {
    [MEMORY[0x263F27E10] promiseWithResult:MEMORY[0x263EFFA88]];
  }
  else {
  id v3 = [MEMORY[0x263F27E10] promiseWithError:v2];
  }

  return v3;
}

+ (AMSBagKeySet)bagKeySet
{
  id v2 = objc_alloc_init(MEMORY[0x263F27D80]);
  id v3 = [MEMORY[0x263F27D18] bagKeySet];
  [v2 unionBagKeySet:v3];

  id v4 = [MEMORY[0x263F27E30] bagKeySet];
  [v2 unionBagKeySet:v4];

  return (AMSBagKeySet *)v2;
}

+ (NSString)bagSubProfile
{
  return (NSString *)@"AMSUIWeb";
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)@"1";
}

+ (id)createBagForSubProfile
{
  id v2 = (void *)MEMORY[0x263F27B40];
  id v3 = [(id)objc_opt_class() bagKeySet];
  id v4 = [(id)objc_opt_class() bagSubProfile];
  id v5 = [(id)objc_opt_class() bagSubProfileVersion];
  [v2 registerBagKeySet:v3 forProfile:v4 profileVersion:v5];

  id v6 = (void *)MEMORY[0x263F27B28];
  uint64_t v7 = [(id)objc_opt_class() bagSubProfile];
  uint64_t v8 = [(id)objc_opt_class() bagSubProfileVersion];
  uint64_t v9 = [v6 bagForProfile:v7 profileVersion:v8];

  return v9;
}

- (id)action:(id)a3 handleActionObject:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(AMSUIWebViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263F27E10]);
    uint64_t v9 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v9)
    {
      uint64_t v9 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    int v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      __int16 v12 = AMSLogKey();
      objc_super v13 = [(AMSUIWebViewController *)self delegate];
      *(_DWORD *)buf = 138544130;
      uint64_t v25 = v11;
      __int16 v26 = 2114;
      double v27 = v12;
      __int16 v28 = 2114;
      uint64_t v29 = objc_opt_class();
      __int16 v30 = 2114;
      id v31 = v5;
      _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Calling delegate (%{public}@) with action: %{public}@", buf, 0x2Au);
    }
    id v14 = [(AMSUIWebViewController *)self delegate];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __52__AMSUIWebViewController_action_handleActionObject___block_invoke;
    v22[3] = &unk_2643E39E0;
    id v15 = v8;
    uint64_t v23 = v15;
    int v16 = [v14 webViewController:self handleDelegateAction:v5 completion:v22];

    if (v16) {
      long long v17 = v15;
    }
    else {
      long long v17 = 0;
    }
    long long v18 = v23;
  }
  else
  {
    id v15 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v15)
    {
      id v15 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    long long v18 = [v15 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_opt_class();
      double v20 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v19;
      __int16 v26 = 2114;
      double v27 = v20;
      _os_log_impl(&dword_21C134000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Caller does not respond to delegate", buf, 0x16u);
    }
    long long v17 = 0;
  }

  return v17;
}

void __52__AMSUIWebViewController_action_handleActionObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v9)
  {
    [*(id *)(a1 + 32) finishWithResult:v9];
  }
  else
  {
    char v7 = *(void **)(a1 + 32);
    if (v5)
    {
      [v7 finishWithError:v5];
    }
    else
    {
      id v8 = AMSError();
      [v7 finishWithError:v8];
    }
  }
}

- (id)action:(id)a3 didResolveWithResult:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263F27E10]);
  int v10 = [(AMSUIWebViewController *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    __int16 v12 = [(AMSUIWebViewController *)self delegate];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __60__AMSUIWebViewController_action_didResolveWithResult_error___block_invoke;
    v15[3] = &unk_2643E39E0;
    id v16 = v9;
    [v12 webViewController:self didResolveWithResult:v7 error:v8 completion:v15];
  }
  else
  {
    objc_super v13 = AMSError();
    [v9 finishWithError:v13];
  }
  return v9;
}

void __60__AMSUIWebViewController_action_didResolveWithResult_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v9)
  {
    [*(id *)(a1 + 32) finishWithResult:v9];
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    if (v5)
    {
      [v7 finishWithError:v5];
    }
    else
    {
      id v8 = AMSError();
      [v7 finishWithError:v8];
    }
  }
}

- (id)action:(id)a3 pauseTimeouts:(BOOL)a4 handleAuthenticateRequest:(id)a5
{
  return [(AMSUIWebViewController *)self _handleAuthenticateRequest:a5 pauseTimeouts:a4];
}

- (id)action:(id)a3 pauseTimeouts:(BOOL)a4 handleAuthenticateCloudRequest:(id)a5
{
  return [(AMSUIWebViewController *)self _handleAuthenticateCloudRequest:a5 pauseTimeouts:a4];
}

- (id)action:(id)a3 pauseTimeouts:(BOOL)a4 handleDialogRequest:(id)a5
{
  return [(AMSUIWebViewController *)self _handleDialogRequest:a5 pauseTimeouts:a4];
}

- (void)action:(id)a3 didEncodeNetworkRequest:(id)a4
{
}

- (void)actionDidFinishPurchaseWithResult:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AMSUIWebViewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    int v10 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v10)
    {
      int v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    char v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      objc_super v13 = AMSLogKey();
      int v15 = 138543618;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      long long v18 = v13;
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Calling purchase completed delegate callback", (uint8_t *)&v15, 0x16u);
    }
    id v14 = [(AMSUIWebViewController *)self delegate];
    [v14 webViewController:self didFinishPurchaseWithResult:v6 error:v7];
  }
}

- (void)protocolHandler:(id)a3 didEncodeNetworkRequest:(id)a4
{
}

- (void)webPageViewController:(id)a3 didEncodeNetworkRequest:(id)a4
{
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = [(AMSUIWebViewController *)self _handleDialogRequest:a5 pauseTimeouts:1];
  [v9 addFinishBlock:v8];
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = [(AMSUIWebViewController *)self _handleAuthenticateRequest:a5 pauseTimeouts:1];
  [v9 addFinishBlock:v8];
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = [(AMSUIWebViewController *)self _handleEngagementRequest:a5 pauseTimeouts:1];
  [v9 addFinishBlock:v8];
}

- (id)presentingSceneIdentifier
{
  id v2 = [(AMSUICommonViewController *)self view];
  id v3 = [v2 window];
  id v4 = [v3 windowScene];
  id v5 = [v4 _sceneIdentifier];

  return v5;
}

- (id)presentingWindow
{
  id v2 = [(AMSUICommonViewController *)self view];
  id v3 = [v2 window];

  return v3;
}

- (id)_applyMappingsToURL:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIWebViewController *)self context];
  id v6 = [v5 bag];
  id v7 = [v6 dictionaryForKey:@"commerce-ui-urls/v2-mapped-urls"];
  id v8 = [v7 valuePromise];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __46__AMSUIWebViewController__applyMappingsToURL___block_invoke;
  v16[3] = &unk_2643E5980;
  v16[4] = self;
  id v9 = v4;
  id v17 = v9;
  int v10 = [v8 thenWithBlock:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__AMSUIWebViewController__applyMappingsToURL___block_invoke_84;
  v14[3] = &unk_2643E3A08;
  id v15 = v9;
  id v11 = v9;
  uint64_t v12 = [v10 catchWithBlock:v14];

  return v12;
}

id __46__AMSUIWebViewController__applyMappingsToURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__9;
  double v20 = __Block_byref_object_dispose__9;
  id v21 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__AMSUIWebViewController__applyMappingsToURL___block_invoke_79;
  v13[3] = &unk_2643E5958;
  id v4 = *(void **)(a1 + 40);
  void v13[4] = *(void *)(a1 + 32);
  id v14 = v4;
  id v15 = &v16;
  [v3 enumerateKeysAndObjectsUsingBlock:v13];
  id v5 = v17;
  if (v17[5])
  {
    id v6 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v6)
    {
      id v6 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = v17[5];
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v8;
      __int16 v24 = 2112;
      uint64_t v25 = v9;
      _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully mapped URL to: %@", buf, 0x16u);
    }
  }
  else
  {
    id v10 = *(id *)(a1 + 40);
    id v6 = (void *)v5[5];
    v5[5] = (uint64_t)v10;
  }

  id v11 = [MEMORY[0x263F27E10] promiseWithResult:v17[5]];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __46__AMSUIWebViewController__applyMappingsToURL___block_invoke_79(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v24 = 0;
  uint64_t v8 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:a2 options:1 error:&v24];
  id v9 = v24;
  if (v9)
  {
    id v10 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v10)
    {
      id v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v12;
      __int16 v27 = 2114;
      id v28 = v9;
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Invalid commerceUI pattern. %{public}@", buf, 0x16u);
    }

LABEL_15:
    goto LABEL_16;
  }
  objc_super v13 = [*(id *)(a1 + 40) absoluteString];
  id v14 = [*(id *)(a1 + 40) absoluteString];
  uint64_t v15 = objc_msgSend(v8, "numberOfMatchesInString:options:range:", v13, 2, 0, objc_msgSend(v14, "length"));

  if (v15)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithString:v7];
    uint64_t v16 = [*(id *)(a1 + 40) query];
    [v10 setQuery:v16];

    id v17 = [*(id *)(a1 + 40) fragment];
    [v10 setFragment:v17];

    uint64_t v18 = [v10 URL];
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    double v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      id v21 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v21)
      {
        id v21 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      double v22 = [v21 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        uint64_t v26 = v23;
        _os_log_impl(&dword_21C134000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Mapped URL is not valid.", buf, 0xCu);
      }
    }
    *a4 = 1;
    goto LABEL_15;
  }
LABEL_16:
}

uint64_t __46__AMSUIWebViewController__applyMappingsToURL___block_invoke_84(uint64_t a1)
{
  return [MEMORY[0x263F27E10] promiseWithResult:*(void *)(a1 + 32)];
}

- (id)_buildRequestWithRequest:(id)a3 bagValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 URL];

  if (!v8
    || (id v9 = (void *)MEMORY[0x263F27E10],
        [v6 URL],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v9 promiseWithResult:v10],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    id v11 = [v7 valuePromise];
    if (!v11)
    {
      uint64_t v12 = (void *)MEMORY[0x263F27E10];
      objc_super v13 = AMSError();
      id v11 = [v12 promiseWithError:v13];
    }
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __60__AMSUIWebViewController__buildRequestWithRequest_bagValue___block_invoke;
  v25[3] = &unk_2643E59A8;
  v25[4] = self;
  id v14 = [v11 thenWithBlock:v25];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __60__AMSUIWebViewController__buildRequestWithRequest_bagValue___block_invoke_2;
  v24[3] = &unk_2643E59A8;
  v24[4] = self;
  uint64_t v15 = [v14 thenWithBlock:v24];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __60__AMSUIWebViewController__buildRequestWithRequest_bagValue___block_invoke_4;
  v20[3] = &unk_2643E59D0;
  id v21 = v6;
  double v22 = self;
  id v23 = v7;
  id v16 = v7;
  id v17 = v6;
  uint64_t v18 = [v15 thenWithBlock:v20];

  return v18;
}

uint64_t __60__AMSUIWebViewController__buildRequestWithRequest_bagValue___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _applyMappingsToURL:a2];
}

id __60__AMSUIWebViewController__buildRequestWithRequest_bagValue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_class();
  id v5 = [*(id *)(a1 + 32) context];
  id v6 = [v5 bag];
  id v7 = [v4 verifyTrustedURL:v3 bag:v6];
  uint64_t v8 = [v7 promiseAdapter];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__AMSUIWebViewController__buildRequestWithRequest_bagValue___block_invoke_3;
  v12[3] = &unk_2643E3730;
  id v13 = v3;
  id v9 = v3;
  id v10 = [v8 thenWithBlock:v12];

  return v10;
}

uint64_t __60__AMSUIWebViewController__buildRequestWithRequest_bagValue___block_invoke_3(uint64_t a1)
{
  return [MEMORY[0x263F27E10] promiseWithResult:*(void *)(a1 + 32)];
}

id __60__AMSUIWebViewController__buildRequestWithRequest_bagValue___block_invoke_4(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[a1[4] mutableCopy];
  id v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v3];
  }
  id v7 = v6;

  [v7 setURL:v3];
  uint64_t v8 = [v3 absoluteString];
  id v9 = v8;
  if (!v8)
  {
    id v9 = [a1[6] key];
  }
  id v10 = [a1[5] context];
  [v10 setURL:v9];

  if (!v8) {
  id v11 = [MEMORY[0x263F27E10] promiseWithResult:v7];
  }

  return v11;
}

- (void)_dismiss
{
}

- (id)_handleAuthenticateRequest:(id)a3 pauseTimeouts:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263F27D90]);
  if (v4)
  {
    uint64_t v8 = [(AMSUIWebViewController *)self context];
    id v9 = [v8 flowController];
    [v9 startTimeoutInterruption];

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke;
    v21[3] = &unk_2643E59F8;
    v21[4] = self;
    [v7 addFinishBlock:v21];
  }
  id v10 = [(AMSUIWebViewController *)self context];
  id v11 = [v10 flowController];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke_2;
  v18[3] = &unk_2643E3360;
  v18[4] = self;
  id v12 = v7;
  id v19 = v12;
  id v20 = v6;
  id v13 = v6;
  [v11 performSafeTransitionFrom:self block:v18];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke_131;
  v17[3] = &unk_2643E3570;
  v17[4] = self;
  [v12 addErrorBlock:v17];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke_133;
  v16[3] = &unk_2643E5A20;
  v16[4] = self;
  [v12 addSuccessBlock:v16];
  id v14 = v12;

  return v14;
}

void __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) context];
  v1 = [v2 flowController];
  [v1 stopTimeoutInterruption];
}

void __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _shouldReplaceCurrentAccountAfterSuccessfulAuth];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke_3;
  v4[3] = &unk_2643E5A98;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  [v2 addFinishBlock:v4];
}

void __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke_3(id *a1, void *a2)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  int v6 = [a2 value];
  uint64_t v7 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  uint64_t v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      uint64_t v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [a1[4] context];
      id v11 = [v10 logKey];
      id v12 = NSString;
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = v13;
      if (v11)
      {
        id v2 = [a1[4] context];
        id v3 = [v2 logKey];
        [v12 stringWithFormat:@"%@: [%@] ", v14, v3];
      }
      else
      {
        [v12 stringWithFormat:@"%@: ", v13];
      BOOL v4 = };
      *(_DWORD *)buf = 138543362;
      v79 = v4;
      _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_INFO, "%{public}@Will replace current account on context.", buf, 0xCu);
      if (v11)
      {

        BOOL v4 = v2;
      }
    }
    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke_103;
    v77[3] = &unk_2643E5A20;
    id v21 = a1[5];
    v77[4] = a1[4];
    [v21 addSuccessBlock:v77];
  }
  else
  {
    if (!v7)
    {
      uint64_t v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v15 = [v8 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = [a1[4] context];
      id v17 = [v16 logKey];
      uint64_t v18 = NSString;
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = v19;
      if (v17)
      {
        id v2 = [a1[4] context];
        id v3 = [v2 logKey];
        [v18 stringWithFormat:@"%@: [%@] ", v20, v3];
      }
      else
      {
        [v18 stringWithFormat:@"%@: ", v19];
      BOOL v4 = };
      *(_DWORD *)buf = 138543362;
      v79 = v4;
      _os_log_impl(&dword_21C134000, v15, OS_LOG_TYPE_INFO, "%{public}@Will not replace current account on context.", buf, 0xCu);
      if (v17)
      {

        BOOL v4 = v2;
      }
    }
  }
  double v22 = [a1[4] delegate];
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    id v24 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v24)
    {
      id v24 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v25 = [v24 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = [a1[4] context];
      __int16 v27 = [v26 logKey];
      id v28 = NSString;
      uint64_t v29 = objc_opt_class();
      uint64_t v30 = v29;
      if (v27)
      {
        v65 = [a1[4] context];
        BOOL v4 = [v65 logKey];
        [v28 stringWithFormat:@"%@: [%@] ", v30, v4];
      }
      else
      {
        [v28 stringWithFormat:@"%@: ", v29];
      id v31 = };
      v49 = [a1[4] delegate];
      v50 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543618;
      v79 = v31;
      __int16 v80 = 2114;
      v81 = v50;
      _os_log_impl(&dword_21C134000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Calling delegate for authentication: %{public}@", buf, 0x16u);

      if (v27)
      {

        id v31 = v65;
      }
    }
    v51 = [AMSUIDeallocGuard alloc];
    v74[0] = MEMORY[0x263EF8330];
    v74[1] = 3221225472;
    v74[2] = __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke_108;
    v74[3] = &unk_2643E5A48;
    id v52 = a1[5];
    v74[4] = a1[4];
    v76 = sel_webViewController_handleAuthenticateRequest_completion_;
    id v75 = v52;
    v53 = [(AMSUIDeallocGuard *)v51 initWithDeallocGuardBlock:v74];
    v54 = [a1[4] delegate];
    id v55 = a1[6];
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke_121;
    v71[3] = &unk_2643E5A70;
    v72 = v53;
    id v56 = a1[4];
    id v73 = a1[5];
    v57 = v53;
    [v54 webViewController:v56 handleAuthenticateRequest:v55 completion:v71];
  }
  else
  {
    int v32 = [a1[4] hasAppeared];
    uint64_t v33 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    double v34 = (void *)v33;
    if (v32)
    {
      if (!v33)
      {
        double v34 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v35 = [v34 OSLogObject];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v36 = [a1[4] context];
        __int16 v37 = [v36 logKey];
        uint64_t v38 = NSString;
        uint64_t v39 = objc_opt_class();
        uint64_t v40 = v39;
        if (v37)
        {
          id v2 = [a1[4] context];
          id v3 = [v2 logKey];
          [v38 stringWithFormat:@"%@: [%@] ", v40, v3];
        }
        else
        {
          [v38 stringWithFormat:@"%@: ", v39];
        v41 = };
        *(_DWORD *)buf = 138543362;
        v79 = v41;
        _os_log_impl(&dword_21C134000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@Running authentication.", buf, 0xCu);
        if (v37)
        {

          v41 = v2;
        }
      }
      v58 = objc_alloc_init(AMSUIAuthenticateTaskCoordinator);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke_123;
      block[3] = &unk_2643E38F0;
      v67 = v58;
      id v59 = a1[6];
      id v60 = a1[4];
      id v61 = a1[5];
      id v68 = v59;
      id v69 = v60;
      id v70 = v61;
      v62 = v58;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      if (!v33)
      {
        double v34 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v42 = [v34 OSLogObject];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = [a1[4] context];
        v44 = [v43 logKey];
        v45 = NSString;
        uint64_t v46 = objc_opt_class();
        uint64_t v47 = v46;
        if (v44)
        {
          id v2 = [a1[4] context];
          id v3 = [v2 logKey];
          [v45 stringWithFormat:@"%@: [%@] ", v47, v3];
        }
        else
        {
          [v45 stringWithFormat:@"%@: ", v46];
        v48 = };
        *(_DWORD *)buf = 138543362;
        v79 = v48;
        _os_log_impl(&dword_21C134000, v42, OS_LOG_TYPE_ERROR, "%{public}@Unable to run authentication", buf, 0xCu);
        if (v44)
        {

          v48 = v2;
        }
      }
      id v63 = a1[5];
      v64 = AMSError();
      [v63 finishWithError:v64];
    }
  }
}

void __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke_103(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v5)
  {
    id v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  int v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [*(id *)(a1 + 32) context];
    uint64_t v8 = [v7 logKey];
    id v9 = NSString;
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = v10;
    if (v8)
    {
      uint64_t v19 = [*(id *)(a1 + 32) context];
      id v2 = [v19 logKey];
      [v9 stringWithFormat:@"%@: [%@] ", v11, v2];
    }
    else
    {
      [v9 stringWithFormat:@"%@: ", v10];
    id v12 = };
    uint64_t v13 = [v4 account];
    uint64_t v14 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543618;
    id v21 = v12;
    __int16 v22 = 2114;
    char v23 = v14;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Replacing current account on context. account = %{public}@", buf, 0x16u);

    if (v8)
    {

      id v12 = v19;
    }
  }
  uint64_t v15 = [*(id *)(a1 + 32) context];
  id v16 = [v4 account];
  id v17 = [*(id *)(a1 + 32) context];
  uint64_t v18 = [v17 clientInfo];
  [v15 replaceCurrentAccount:v16 clientInfo:v18];
}

void __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke_108(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v2 = [MEMORY[0x263F27EF8] isRunningUnitTests];
  uint64_t v3 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  id v4 = (void *)v3;
  if (v2)
  {
    if (!v3)
    {
      id v4 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v7;
      __int16 v20 = 2114;
      id v21 = v8;
      _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ completion handler not called.", buf, 0x16u);
    }
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    id v9 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    [v4 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v9 userInfo:0];
  }
  else
  {
    if (!v3)
    {
      id v4 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v9 = [v4 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v11;
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@ completion handler not called.", buf, 0x16u);
    }
  }

  uint64_t v13 = NSString;
  uint64_t v14 = *(void **)(a1 + 40);
  uint64_t v15 = NSStringFromSelector(*(SEL *)(a1 + 48));
  id v16 = [v13 stringWithFormat:@"Completion handler for %@ deallocated without being invoked", v15];
  id v17 = AMSError();
  [v14 finishWithError:v17];
}

void __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke_121(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 invalidate];
  [*(id *)(a1 + 40) finishWithResult:v7 error:v6];
}

void __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke_123(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) context];
  id v5 = [v4 flowController];
  id v6 = [v5 currentContainer];
  id v7 = [v2 handleRequest:v3 presentingViewController:v6];

  [*(id *)(a1 + 56) finishWithPromise:v7];
}

void __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke_131(id *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v5)
  {
    id v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = [a1[4] context];
    uint64_t v8 = [v7 logKey];
    id v9 = NSString;
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = v10;
    if (v8)
    {
      a1 = [a1[4] context];
      int v2 = [a1 logKey];
      [v9 stringWithFormat:@"%@: [%@] ", v11, v2];
    }
    else
    {
      [v9 stringWithFormat:@"%@: ", v10];
    id v12 = };
    uint64_t v13 = AMSLogableError();
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v12;
    __int16 v16 = 2114;
    id v17 = v13;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_ERROR, "%{public}@Authentication failed. error = %{public}@", buf, 0x16u);
    if (v8)
    {

      id v12 = a1;
    }
  }
}

void __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke_133(id *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [a1[4] context];
    id v6 = [v5 logKey];
    id v7 = NSString;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = v8;
    if (v6)
    {
      a1 = [a1[4] context];
      v1 = [a1 logKey];
      [v7 stringWithFormat:@"%@: [%@] ", v9, v1];
    }
    else
    {
      [v7 stringWithFormat:@"%@: ", v8];
    uint64_t v10 = };
    *(_DWORD *)buf = 138543362;
    id v12 = v10;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Authentication succeeded", buf, 0xCu);
    if (v6)
    {

      uint64_t v10 = a1;
    }
  }
}

- (id)_handleAuthenticateCloudRequest:(id)a3 pauseTimeouts:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v7)
  {
    id v7 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v9;
    __int16 v27 = 2114;
    id v28 = v10;
    _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Beginning Cloud Auth Task", buf, 0x16u);
  }
  if (v4)
  {
    uint64_t v11 = [(AMSUIWebViewController *)self context];
    id v12 = [v11 flowController];
    [v12 startTimeoutInterruption];
  }
  id v13 = objc_alloc_init(MEMORY[0x263F27E10]);
  uint64_t v14 = [(AMSUIWebViewController *)self context];
  uint64_t v15 = [v14 flowController];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __72__AMSUIWebViewController__handleAuthenticateCloudRequest_pauseTimeouts___block_invoke;
  v21[3] = &unk_2643E5AE8;
  v21[4] = self;
  id v22 = v6;
  BOOL v24 = v4;
  id v16 = v13;
  id v23 = v16;
  id v17 = v6;
  [v15 performSafeTransitionFrom:self block:v21];

  uint64_t v18 = v23;
  id v19 = v16;

  return v19;
}

void __72__AMSUIWebViewController__handleAuthenticateCloudRequest_pauseTimeouts___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) hasAppeared])
  {
    int v2 = [*(id *)(a1 + 32) context];
    uint64_t v3 = [v2 flowController];
    BOOL v4 = [v3 currentContainer];

    id v5 = [[AMSUIAuthenticateCloudTask alloc] initWithAuthRequest:*(void *)(a1 + 40) presentingViewController:v4];
    id v6 = [(AMSUIAuthenticateCloudTask *)v5 performAuthenticate];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __72__AMSUIWebViewController__handleAuthenticateCloudRequest_pauseTimeouts___block_invoke_2;
    v13[3] = &unk_2643E5AC0;
    void v13[4] = *(void *)(a1 + 32);
    char v14 = *(unsigned char *)(a1 + 56);
    [v6 addFinishBlock:v13];
    [*(id *)(a1 + 48) finishWithPromise:v6];
  }
  else
  {
    id v7 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v7)
    {
      id v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = [*(id *)(a1 + 32) context];
      uint64_t v11 = [v10 logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      uint64_t v18 = v11;
      _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to run authentication", buf, 0x16u);
    }
    id v12 = *(void **)(a1 + 48);
    BOOL v4 = AMSError();
    [v12 finishWithError:v4];
  }
}

void __72__AMSUIWebViewController__handleAuthenticateCloudRequest_pauseTimeouts___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v2)
  {
    int v2 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    id v5 = AMSLogKey();
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    _os_log_impl(&dword_21C134000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished Cloud Auth Task", (uint8_t *)&v8, 0x16u);
  }
  if (*(unsigned char *)(a1 + 40))
  {
    id v6 = [*(id *)(a1 + 32) context];
    id v7 = [v6 flowController];
    [v7 stopTimeoutInterruption];
  }
}

- (id)_handleDialogRequest:(id)a3 pauseTimeouts:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263F27E10]);
  int v8 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v8)
  {
    int v8 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [(AMSUIWebViewController *)self context];
    uint64_t v12 = [v11 logKey];
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v10;
    __int16 v28 = 2114;
    uint64_t v29 = v12;
    _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling dialog", buf, 0x16u);
  }
  if (v4)
  {
    id v13 = [(AMSUIWebViewController *)self context];
    char v14 = [v13 flowController];
    [v14 startTimeoutInterruption];
  }
  uint64_t v15 = [(AMSUIWebViewController *)self context];
  uint64_t v16 = [v15 flowController];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __61__AMSUIWebViewController__handleDialogRequest_pauseTimeouts___block_invoke;
  v23[3] = &unk_2643E3360;
  v23[4] = self;
  id v24 = v6;
  id v17 = v7;
  id v25 = v17;
  id v18 = v6;
  [v16 performSafeTransitionFrom:self block:v23];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __61__AMSUIWebViewController__handleDialogRequest_pauseTimeouts___block_invoke_145;
  v21[3] = &unk_2643E5B10;
  v21[4] = self;
  BOOL v22 = v4;
  [v17 addFinishBlock:v21];
  id v19 = v17;

  return v19;
}

void __61__AMSUIWebViewController__handleDialogRequest_pauseTimeouts___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) hasAppeared])
  {
    int v2 = [AMSUIAlertDialogTask alloc];
    uint64_t v3 = *(void *)(a1 + 40);
    BOOL v4 = [*(id *)(a1 + 32) context];
    id v5 = [v4 flowController];
    id v6 = [v5 currentContainer];
    __int16 v20 = [(AMSUIAlertDialogTask *)v2 initWithRequest:v3 presentingViewController:v6];

    id v7 = [(AMSUIAlertDialogTask *)v20 present];
    [*(id *)(a1 + 48) finishWithPromise:v7];

LABEL_5:

    return;
  }
  int v8 = [*(id *)(a1 + 32) delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    __int16 v20 = [*(id *)(a1 + 32) delegate];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = [*(id *)(a1 + 48) completionHandlerAdapter];
    [(AMSUIAlertDialogTask *)v20 webViewController:v10 handleDialogRequest:v11 completion:v12];

    goto LABEL_5;
  }
  id v13 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v13)
  {
    id v13 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  char v14 = [v13 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = [*(id *)(a1 + 32) context];
    id v17 = [v16 logKey];
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v15;
    __int16 v23 = 2114;
    id v24 = v17;
    _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to run dialog", buf, 0x16u);
  }
  id v18 = *(void **)(a1 + 48);
  id v19 = AMSError();
  [v18 finishWithError:v19];
}

void __61__AMSUIWebViewController__handleDialogRequest_pauseTimeouts___block_invoke_145(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  int v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      int v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    char v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = [*(id *)(a1 + 32) context];
      uint64_t v12 = [v11 logKey];
      int v20 = 138543874;
      uint64_t v21 = v10;
      __int16 v22 = 2114;
      __int16 v23 = v12;
      __int16 v24 = 2114;
      id v25 = v6;
      id v13 = "%{public}@: [%{public}@] Dialog failed. %{public}@";
      char v14 = v9;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 32;
LABEL_10:
      _os_log_impl(&dword_21C134000, v14, v15, v13, (uint8_t *)&v20, v16);
    }
  }
  else
  {
    if (!v7)
    {
      int v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    char v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      uint64_t v11 = [*(id *)(a1 + 32) context];
      uint64_t v12 = [v11 logKey];
      int v20 = 138543618;
      uint64_t v21 = v17;
      __int16 v22 = 2114;
      __int16 v23 = v12;
      id v13 = "%{public}@: [%{public}@] Dialog succeeded";
      char v14 = v9;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 22;
      goto LABEL_10;
    }
  }

  if (*(unsigned char *)(a1 + 40))
  {
    id v18 = [*(id *)(a1 + 32) context];
    id v19 = [v18 flowController];
    [v19 stopTimeoutInterruption];
  }
}

- (id)_handleEngagementRequest:(id)a3 pauseTimeouts:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263F27E10]);
  int v8 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v8)
  {
    int v8 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  char v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [(AMSUIWebViewController *)self context];
    uint64_t v12 = [v11 logKey];
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v10;
    __int16 v28 = 2114;
    uint64_t v29 = v12;
    _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling engagement request", buf, 0x16u);
  }
  if (v4)
  {
    id v13 = [(AMSUIWebViewController *)self context];
    char v14 = [v13 flowController];
    [v14 startTimeoutInterruption];
  }
  os_log_type_t v15 = [(AMSUIWebViewController *)self context];
  uint32_t v16 = [v15 flowController];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __65__AMSUIWebViewController__handleEngagementRequest_pauseTimeouts___block_invoke;
  v23[3] = &unk_2643E3360;
  v23[4] = self;
  id v24 = v6;
  id v17 = v7;
  id v25 = v17;
  id v18 = v6;
  [v16 performSafeTransitionFrom:self block:v23];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __65__AMSUIWebViewController__handleEngagementRequest_pauseTimeouts___block_invoke_154;
  v21[3] = &unk_2643E5B38;
  v21[4] = self;
  BOOL v22 = v4;
  [v17 addFinishBlock:v21];
  id v19 = v17;

  return v19;
}

void __65__AMSUIWebViewController__handleEngagementRequest_pauseTimeouts___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) hasAppeared])
  {
    int v2 = [AMSUIEngagementTask alloc];
    uint64_t v3 = *(void *)(a1 + 40);
    BOOL v4 = [*(id *)(a1 + 32) context];
    id v5 = [v4 bag];
    id v6 = [*(id *)(a1 + 32) context];
    id v7 = [v6 flowController];
    int v8 = [v7 currentContainer];
    id v17 = [(AMSUIEngagementTask *)v2 initWithRequest:v3 bag:v5 presentingViewController:v8];

    char v9 = [(AMSUIEngagementTask *)v17 presentEngagement];
    [*(id *)(a1 + 48) finishWithPromise:v9];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v10)
    {
      uint64_t v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = [*(id *)(a1 + 32) context];
      char v14 = [v13 logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      uint64_t v21 = v14;
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to run engagement request", buf, 0x16u);
    }
    os_log_type_t v15 = *(void **)(a1 + 48);
    uint32_t v16 = AMSError();
    [v15 finishWithError:v16];
  }
}

void __65__AMSUIWebViewController__handleEngagementRequest_pauseTimeouts___block_invoke_154(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  int v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      int v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    char v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = [*(id *)(a1 + 32) context];
      uint64_t v12 = [v11 logKey];
      int v20 = 138543874;
      uint64_t v21 = v10;
      __int16 v22 = 2114;
      __int16 v23 = v12;
      __int16 v24 = 2114;
      id v25 = v6;
      id v13 = "%{public}@: [%{public}@] Engagement request failed. %{public}@";
      char v14 = v9;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 32;
LABEL_10:
      _os_log_impl(&dword_21C134000, v14, v15, v13, (uint8_t *)&v20, v16);
    }
  }
  else
  {
    if (!v7)
    {
      int v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    char v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      uint64_t v11 = [*(id *)(a1 + 32) context];
      uint64_t v12 = [v11 logKey];
      int v20 = 138543618;
      uint64_t v21 = v17;
      __int16 v22 = 2114;
      __int16 v23 = v12;
      id v13 = "%{public}@: [%{public}@] Engagement request succeeded";
      char v14 = v9;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 22;
      goto LABEL_10;
    }
  }

  if (*(unsigned char *)(a1 + 40))
  {
    id v18 = [*(id *)(a1 + 32) context];
    uint64_t v19 = [v18 flowController];
    [v19 stopTimeoutInterruption];
  }
}

- (void)_handleDidEncodeNetworkRequest:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(AMSUIWebViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v7)
    {
      uint64_t v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    int v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = AMSLogKey();
      int v12 = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      os_log_type_t v15 = v10;
      _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Calling delegate to decorate request", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v11 = [(AMSUIWebViewController *)self delegate];
    [v11 webViewController:self didEncodeNetworkRequest:v4];
  }
}

- (id)_lazyPromiseForLoadingRequest:(id)a3 bagValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = objc_alloc(MEMORY[0x263F27CA8]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__AMSUIWebViewController__lazyPromiseForLoadingRequest_bagValue___block_invoke;
  v13[3] = &unk_2643E5BB0;
  objc_copyWeak(&v16, &location);
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  uint64_t v11 = (void *)[v8 initWithBlock:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

void __65__AMSUIWebViewController__lazyPromiseForLoadingRequest_bagValue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setCurrentLoadState:1];
  id v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v5)
  {
    id v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = [WeakRetained context];
    id v9 = [v8 logKey];
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v7;
    __int16 v18 = 2114;
    uint64_t v19 = v9;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting promise to load request", buf, 0x16u);
  }
  id v10 = [WeakRetained _buildRequestWithRequest:*(void *)(a1 + 32) bagValue:*(void *)(a1 + 40)];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__AMSUIWebViewController__lazyPromiseForLoadingRequest_bagValue___block_invoke_159;
  v12[3] = &unk_2643E5B88;
  objc_copyWeak(&v15, (id *)(a1 + 48));
  id v11 = v3;
  id v13 = v11;
  id v14 = *(id *)(a1 + 32);
  [v10 addFinishBlock:v12];

  objc_destroyWeak(&v15);
}

void __65__AMSUIWebViewController__lazyPromiseForLoadingRequest_bagValue___block_invoke_159(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!v6)
  {
    id v8 = [v5 URL];
    id v9 = [v8 absoluteString];
    if ([v9 length])
    {
      id v10 = [WeakRetained lastLoadedURL];
      id v11 = [v10 absoluteString];
      [v8 absoluteString];
      v13 = int v12 = v8;
      int v15 = [v11 isEqualToString:v13];

      id v8 = v12;
      if (v15)
      {
        [a1[4] finishWithResult:MEMORY[0x263EFFA88]];
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
    }
    id v14 = [WeakRetained _loadMescalSessionForRequestWithURL:v8];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __65__AMSUIWebViewController__lazyPromiseForLoadingRequest_bagValue___block_invoke_2;
    v16[3] = &unk_2643E5B60;
    v16[4] = WeakRetained;
    id v17 = v5;
    objc_copyWeak(&v20, a1 + 6);
    id v18 = a1[5];
    id v19 = a1[4];
    [v14 addFinishBlock:v16];

    objc_destroyWeak(&v20);
    goto LABEL_8;
  }
  [a1[4] finishWithError:v6];
LABEL_9:
}

void __65__AMSUIWebViewController__lazyPromiseForLoadingRequest_bagValue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 BOOLValue])
  {
    uint64_t v7 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v7)
    {
      uint64_t v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = [*(id *)(a1 + 32) context];
      id v11 = [v10 logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v9;
      __int16 v28 = 2114;
      uint64_t v29 = v11;
      _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Mescal account prime session loaded.", buf, 0x16u);
    }
LABEL_11:

    goto LABEL_12;
  }
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v7)
    {
      uint64_t v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = [*(id *)(a1 + 32) context];
      id v14 = [v13 logKey];
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v12;
      __int16 v28 = 2114;
      uint64_t v29 = v14;
      __int16 v30 = 2114;
      id v31 = v6;
      _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load mescal account prime session. %{public}@", buf, 0x20u);
    }
    goto LABEL_11;
  }
LABEL_12:
  int v15 = [*(id *)(a1 + 32) context];
  id v16 = [v15 webPage];
  id v17 = [v16 loadRequest:*(void *)(a1 + 40)];

  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  __int16 v22 = __65__AMSUIWebViewController__lazyPromiseForLoadingRequest_bagValue___block_invoke_160;
  __int16 v23 = &unk_2643E3598;
  objc_copyWeak(&v25, (id *)(a1 + 64));
  id v24 = *(id *)(a1 + 48);
  [v17 addSuccessBlock:&v20];
  id v18 = *(void **)(a1 + 56);
  id v19 = objc_msgSend(v17, "promiseAdapter", v20, v21, v22, v23);
  [v18 finishWithPromise:v19];

  objc_destroyWeak(&v25);
}

void __65__AMSUIWebViewController__lazyPromiseForLoadingRequest_bagValue___block_invoke_160(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v3)
  {
    id v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    uint64_t v7 = [WeakRetained context];
    id v8 = [v7 logKey];
    int v10 = 138543618;
    id v11 = v5;
    __int16 v12 = 2114;
    id v13 = v8;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished loading the request", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v9 = [*(id *)(a1 + 32) URL];
  [WeakRetained setLastLoadedURL:v9];
}

- (id)_lazyPromiseForBagSnapshot
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc(MEMORY[0x263F27CA8]);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__AMSUIWebViewController__lazyPromiseForBagSnapshot__block_invoke;
  v5[3] = &unk_2643E5BD8;
  objc_copyWeak(&v6, &location);
  id v3 = (void *)[v2 initWithBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __52__AMSUIWebViewController__lazyPromiseForBagSnapshot__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v5)
  {
    id v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = [WeakRetained context];
    uint64_t v9 = [v8 logKey];
    int v13 = 138543618;
    uint64_t v14 = v7;
    __int16 v15 = 2114;
    id v16 = v9;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Bootstrap: starting promise to load the bag snapshot.", (uint8_t *)&v13, 0x16u);
  }
  int v10 = [WeakRetained context];
  id v11 = [v10 loadSnapshot];

  __int16 v12 = [v11 promiseAdapter];
  [v3 finishWithPromise:v12];
}

- (id)_lazyPromiseForLoadingSession
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc(MEMORY[0x263F27CA8]);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__AMSUIWebViewController__lazyPromiseForLoadingSession__block_invoke;
  v5[3] = &unk_2643E5BD8;
  objc_copyWeak(&v6, &location);
  id v3 = (void *)[v2 initWithBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __55__AMSUIWebViewController__lazyPromiseForLoadingSession__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained context];
  id v6 = [v5 logKey];
  id v7 = (id)AMSSetLogKey();

  id v8 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v8)
  {
    id v8 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    id v11 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Bootstrap: starting promise to load the session.", buf, 0x16u);
  }
  __int16 v12 = dispatch_get_global_queue(2, 0);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __55__AMSUIWebViewController__lazyPromiseForLoadingSession__block_invoke_163;
  v17[3] = &unk_2643E34D0;
  v17[4] = WeakRetained;
  id v18 = v3;
  int v13 = v17;
  id v14 = v3;
  __int16 v15 = AMSLogKey();
  *(void *)buf = MEMORY[0x263EF8330];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __AMSDispatchAsync_block_invoke_8;
  uint64_t v20 = &unk_2643E33B0;
  id v21 = v15;
  id v22 = v13;
  id v16 = v15;
  dispatch_async(v12, buf);
}

void __55__AMSUIWebViewController__lazyPromiseForLoadingSession__block_invoke_163(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F08C00];
  id v3 = [*(id *)(a1 + 32) context];
  id v4 = [v3 clientInfo];
  id v5 = [*(id *)(a1 + 32) context];
  id v6 = [v5 bag];
  objc_msgSend(v2, "ams_configurationWithProcessInfo:bag:", v4, v6);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = (void *)[objc_alloc(MEMORY[0x263F27EF0]) initWithConfiguration:v12 delegate:*(void *)(a1 + 32) delegateQueue:0];
  id v8 = [*(id *)(a1 + 32) context];
  [v8 setURLSession:v7];

  uint64_t v9 = objc_alloc_init(AMSUIWebProtocolHandler);
  [(AMSUIWebProtocolHandler *)v9 setDelegate:*(void *)(a1 + 32)];
  uint64_t v10 = [*(id *)(a1 + 32) context];
  id v11 = [v10 URLSession];
  [v11 setProtocolHandler:v9];

  [*(id *)(a1 + 40) finishWithResult:MEMORY[0x263EFFA88]];
}

- (id)_lazyPromiseForPageLoad
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc(MEMORY[0x263F27CA8]);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__AMSUIWebViewController__lazyPromiseForPageLoad__block_invoke;
  v5[3] = &unk_2643E5BD8;
  objc_copyWeak(&v6, &location);
  id v3 = (void *)[v2 initWithBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __49__AMSUIWebViewController__lazyPromiseForPageLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__AMSUIWebViewController__lazyPromiseForPageLoad__block_invoke_2;
  v5[3] = &unk_2643E3598;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __49__AMSUIWebViewController__lazyPromiseForPageLoad__block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setCurrentLoadState:2];
  id v3 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v3)
  {
    id v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = [WeakRetained context];
    id v7 = [v6 logKey];
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v5;
    __int16 v19 = 2114;
    uint64_t v20 = v7;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Bootstrap: starting promise to refresh the page.", buf, 0x16u);
  }
  id v8 = objc_alloc_init(AMSUIWebFlowOptions);
  [(AMSUIWebFlowOptions *)v8 setAnimated:1];
  [(AMSUIWebFlowOptions *)v8 setDisableTimeout:1];
  [(AMSUIWebFlowOptions *)v8 setSuppressErrorPage:1];
  uint64_t v9 = [WeakRetained context];
  uint64_t v10 = [v9 flowController];
  id v11 = [WeakRetained context];
  id v12 = [v11 flowController];
  int v13 = [v12 currentContainer];
  id v14 = [v10 refreshPageForContainer:v13 options:v8];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __49__AMSUIWebViewController__lazyPromiseForPageLoad__block_invoke_168;
  v15[3] = &unk_2643E3520;
  id v16 = *(id *)(a1 + 32);
  [v14 addFinishBlock:v15];
}

uint64_t __49__AMSUIWebViewController__lazyPromiseForPageLoad__block_invoke_168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  if (a3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = MEMORY[0x263EFFA88];
  }
  return [v4 finishWithResult:v5 error:a3];
}

- (id)_parseWebPropertiesFromRequest:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = (void *)[a3 mutableCopy];
  uint64_t v5 = [v4 URL];
  id v6 = [v5 host];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    id v8 = objc_msgSend(v5, "ams_parameters");
    uint64_t v9 = [v8 objectForKeyedSubscript:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    if (v10
      && ([NSURL URLWithString:v10], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v12 = (void *)v11;
      [v4 setURL:v11];
      int v13 = [v8 objectForKeyedSubscript:@"dsid"];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v14 = objc_msgSend(NSNumber, "numberWithLongLong:", -[NSObject longLongValue](v13, "longLongValue"));
      }
      else
      {
        uint64_t v14 = 0;
      }
      uint64_t v18 = [v8 objectForKeyedSubscript:@"accountType"];
      objc_opt_class();
      id v50 = v10;
      if (objc_opt_isKindOfClass()) {
        id v19 = v18;
      }
      else {
        id v19 = 0;
      }

      v51 = (void *)v14;
      if (v14)
      {
        if (v19)
        {
          uint64_t v20 = (void *)MEMORY[0x263EFB210];
          uint64_t v21 = [(AMSUIWebViewController *)self context];
          id v22 = [v21 clientInfo];
          [v22 accountMediaType];
          uint64_t v23 = v48 = v19;
          id v24 = objc_msgSend(v20, "ams_sharedAccountStoreForMediaType:", v23);

          id v19 = v48;
          id v25 = objc_msgSend(v24, "ams_accountWithAltDSID:DSID:username:accountTypeIdentifier:", 0, v51, 0, v48);

          if (v25)
          {
            uint64_t v26 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
            if (!v26)
            {
              uint64_t v26 = [MEMORY[0x263F27CB8] sharedConfig];
            }
            uint64_t v27 = [v26 OSLogObject];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v44 = objc_opt_class();
              uint64_t v46 = [(AMSUIWebViewController *)self context];
              __int16 v28 = [v46 logKey];
              *(_DWORD *)buf = 138543618;
              uint64_t v53 = v44;
              __int16 v54 = 2114;
              id v55 = v28;
              _os_log_impl(&dword_21C134000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Bootstrap: parsed URL is replacing the account...", buf, 0x16u);
            }
            uint64_t v29 = [(AMSUIWebViewController *)self context];
            __int16 v30 = [(AMSUIWebViewController *)self context];
            id v31 = [v30 clientInfo];
            [v29 replaceCurrentAccount:v25 clientInfo:v31];

            id v19 = v48;
          }
        }
      }
      uint64_t v32 = [v8 objectForKeyedSubscript:@"signatureResumption"];
      if ((objc_opt_respondsToSelector() & 1) != 0 && [v32 BOOLValue])
      {
        v45 = [(AMSUIWebViewController *)self context];
        uint64_t v33 = [v45 additionalHeaders];
        double v34 = (void *)[v33 mutableCopy];
        v35 = v34;
        id v49 = v19;
        if (v34) {
          id v36 = v34;
        }
        else {
          id v36 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        }
        uint64_t v47 = v36;

        uint64_t v37 = [MEMORY[0x263F27C90] resumptionHeaders];
        uint64_t v38 = (void *)v37;
        if (v37) {
          uint64_t v39 = v37;
        }
        else {
          uint64_t v39 = MEMORY[0x263EFFA78];
        }
        [v47 addEntriesFromDictionary:v39];

        uint64_t v40 = (void *)[v47 copy];
        v41 = [(AMSUIWebViewController *)self context];
        [v41 setAdditionalHeaders:v40];

        v42 = [(AMSUIWebViewController *)self context];
        [v42 setSignatureResumption:1];

        id v19 = v49;
      }

      id v10 = v50;
    }
    else
    {
      id v12 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v12)
      {
        id v12 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      int v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = objc_opt_class();
        id v16 = [(AMSUIWebViewController *)self context];
        uint64_t v17 = [v16 logKey];
        *(_DWORD *)buf = 138543618;
        uint64_t v53 = v15;
        __int16 v54 = 2114;
        id v55 = v17;
        _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Unable to extract URL from query string", buf, 0x16u);
      }
    }
  }
  return v4;
}

- (id)_loadMescalSessionForRequestWithURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSUIWebViewController *)self context];
  id v6 = [v5 bag];
  uint64_t v7 = [v6 stringForKey:@"account-flow-url-patterns"];
  id v8 = [v7 valuePromise];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__AMSUIWebViewController__loadMescalSessionForRequestWithURL___block_invoke;
  v12[3] = &unk_2643E5C00;
  id v13 = v4;
  uint64_t v14 = self;
  id v9 = v4;
  id v10 = [v8 thenWithBlock:v12];

  return v10;
}

id __62__AMSUIWebViewController__loadMescalSessionForRequestWithURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F08AE8];
  id v4 = a2;
  id v20 = 0;
  uint64_t v5 = (void *)[[v3 alloc] initWithPattern:v4 options:1 error:&v20];

  id v6 = v20;
  if (v5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) absoluteString];
    if (objc_msgSend(v5, "rangeOfFirstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = objc_alloc(MEMORY[0x263F27D30]);
      id v9 = [*(id *)(a1 + 40) context];
      id v10 = [v9 bag];
      uint64_t v11 = (void *)[v8 initWithBag:v10];
      id v12 = [*(id *)(a1 + 40) context];
      [v12 setMescalSession:v11];
    }
    id v13 = (void *)MEMORY[0x263F27E10];
    uint64_t v14 = NSNumber;
    uint64_t v15 = [*(id *)(a1 + 40) context];
    id v16 = [v15 mescalSession];
    uint64_t v17 = [v14 numberWithInt:v16 != 0];
    uint64_t v18 = [v13 promiseWithResult:v17];
  }
  else
  {
    uint64_t v18 = [MEMORY[0x263F27E10] promiseWithError:v6];
  }

  return v18;
}

- (id)_loadRequest:(id)a3 bagValue:(id)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v43 = a3;
  id v6 = a4;
  uint64_t v7 = [(AMSUIWebViewController *)self context];
  id v8 = [v7 logKey];
  id v9 = (id)AMSSetLogKey();

  if ([(AMSUIWebViewController *)self hasStarted])
  {
    id v10 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v10)
    {
      id v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v55 = v12;
      __int16 v56 = 2114;
      v57 = v13;
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Multiple loadRequest calls are not supported.", buf, 0x16u);
    }
    uint64_t v14 = (void *)MEMORY[0x263F27B58];
    AMSError();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = [v14 promiseWithError:v15];
  }
  else
  {
    uint64_t v17 = [(AMSUIWebViewController *)self context];
    [v17 setBootstrapComplete:0];

    [(AMSUIWebViewController *)self setHasStarted:1];
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v15 setObject:v43 forKeyedSubscript:@"request"];
    [v15 setObject:v6 forKeyedSubscript:@"bagValue"];
    uint64_t v18 = [(AMSUIWebViewController *)self context];
    id v19 = [v18 account];
    id v20 = [v19 hashedDescription];
    [v15 setObject:v20 forKeyedSubscript:@"account"];

    uint64_t v21 = [(AMSUIWebViewController *)self context];
    id v22 = [v21 clientInfo];
    [v15 setObject:v22 forKeyedSubscript:@"clientInfo"];

    uint64_t v23 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v23)
    {
      uint64_t v23 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v24 = [v23 OSLogObject];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = objc_opt_class();
      uint64_t v26 = [(AMSUIWebViewController *)self context];
      uint64_t v27 = [v26 logKey];
      __int16 v28 = [(AMSUIWebViewController *)self context];
      uint64_t v29 = [v28 clientOptions];
      *(_DWORD *)buf = 138544130;
      uint64_t v55 = v25;
      __int16 v56 = 2114;
      v57 = v27;
      __int16 v58 = 2114;
      id v59 = v15;
      __int16 v60 = 2114;
      id v61 = v29;
      _os_log_impl(&dword_21C134000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting bootstrap: %{public}@ options: %{public}@", buf, 0x2Au);
    }
    v42 = [(AMSUIWebViewController *)self _parseWebPropertiesFromRequest:v43];
    __int16 v30 = [(AMSUIWebViewController *)self _lazyPromiseForBagSnapshot];
    v53[0] = v30;
    id v31 = [(AMSUIWebViewController *)self _lazyPromiseForLoadingSession];
    v53[1] = v31;
    uint64_t v32 = [(AMSUIWebViewController *)self _lazyPromiseForLoadingRequest:v42 bagValue:v6];
    v53[2] = v32;
    uint64_t v33 = [(AMSUIWebViewController *)self _lazyPromiseForPageLoad];
    v53[3] = v33;
    double v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:4];

    v35 = [MEMORY[0x263F27E10] promiseWithAll:v34];
    objc_initWeak((id *)buf, self);
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __48__AMSUIWebViewController__loadRequest_bagValue___block_invoke;
    v51[3] = &unk_2643E5C28;
    objc_copyWeak(&v52, (id *)buf);
    [v35 addSuccessBlock:v51];
    id v36 = objc_alloc_init(MEMORY[0x263F27E10]);
    [v36 finishWithPromise:v35];
    uint64_t v37 = [(AMSUIWebViewController *)self context];
    uint64_t v38 = [v37 flowController];
    id v39 = MEMORY[0x263EF83A0];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __48__AMSUIWebViewController__loadRequest_bagValue___block_invoke_214;
    v48[3] = &unk_2643E3598;
    objc_copyWeak(&v50, (id *)buf);
    id v40 = v36;
    id v49 = v40;
    [v38 startTimeout:MEMORY[0x263EF83A0] queue:v48 block:30.0];

    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __48__AMSUIWebViewController__loadRequest_bagValue___block_invoke_2;
    v44[3] = &unk_2643E5C50;
    objc_copyWeak(&v47, (id *)buf);
    id v45 = v43;
    id v46 = v6;
    [v40 addErrorBlock:v44];
    id v16 = [v40 binaryPromiseAdapter];

    objc_destroyWeak(&v47);
    objc_destroyWeak(&v50);

    objc_destroyWeak(&v52);
    objc_destroyWeak((id *)buf);
  }
  return v16;
}

void __48__AMSUIWebViewController__loadRequest_bagValue___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v2)
  {
    id v2 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = [WeakRetained context];
    id v6 = [v5 logKey];
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_21C134000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Bootstrap succeeded", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [WeakRetained context];
  [v7 setBootstrapComplete:1];
}

void __48__AMSUIWebViewController__loadRequest_bagValue___block_invoke_214(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (([*(id *)(a1 + 32) isFinished] & 1) == 0)
  {
    id v2 = [WeakRetained context];
    id v3 = [v2 logKey];
    id v4 = (id)AMSSetLogKey();

    uint64_t v5 = objc_msgSend(WeakRetained, "_stringForLoadState:", objc_msgSend(WeakRetained, "currentLoadState"));
    id v6 = AMSErrorWithFormat();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6, v5);
  }
}

void __48__AMSUIWebViewController__loadRequest_bagValue___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_opt_class();
    int v8 = [WeakRetained context];
    uint64_t v9 = [v8 logKey];
    int v10 = 138543874;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v9;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Bootstrap failed. %{public}@", (uint8_t *)&v10, 0x20u);
  }
  [WeakRetained _showErrorViewWithError:v3 request:*(void *)(a1 + 32) bagValue:*(void *)(a1 + 40)];
}

- (id)_rootNavigationController
{
  id v2 = [(AMSUIWebViewController *)self rootContainer];
  id v3 = objc_msgSend(v2, "ams_navigationController");

  return v3;
}

- (void)_showErrorViewWithError:(id)a3 request:(id)a4 bagValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __67__AMSUIWebViewController__showErrorViewWithError_request_bagValue___block_invoke;
  v14[3] = &unk_2643E52E0;
  void v14[4] = self;
  id v15 = v8;
  id v11 = v8;
  objc_copyWeak(&v18, &location);
  id v16 = v9;
  id v17 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __67__AMSUIWebViewController__showErrorViewWithError_request_bagValue___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 flowController];
  id v4 = [v3 currentContainer];
  uint64_t v5 = [v4 containedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v7 = [AMSUIWebErrorPageModel alloc];
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [*(id *)(a1 + 32) context];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __67__AMSUIWebViewController__showErrorViewWithError_request_bagValue___block_invoke_2;
    v17[3] = &unk_2643E5C78;
    objc_copyWeak(&v20, (id *)(a1 + 64));
    id v18 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 56);
    id v10 = [(AMSUIWebErrorPageModel *)v7 initWithError:v8 context:v9 actionBlock:v17];

    id v11 = [*(id *)(a1 + 32) context];
    id v12 = [v11 flowController];
    id v13 = [*(id *)(a1 + 32) context];
    __int16 v14 = [v13 flowController];
    id v15 = [v14 currentContainer];
    id v16 = (id)[v12 replaceWithPageModel:v10 forContainer:v15 options:0];

    objc_destroyWeak(&v20);
  }
}

void __67__AMSUIWebViewController__showErrorViewWithError_request_bagValue___block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ((a2 & 1) == 0)
  {
    id v15 = WeakRetained;
    uint64_t v5 = [AMSUIWebLoadingPageModel alloc];
    id v6 = [v15 context];
    uint64_t v7 = [(AMSUIWebLoadingPageModel *)v5 initWithContext:v6];

    uint64_t v8 = [v15 context];
    id v9 = [v8 flowController];
    id v10 = [v15 context];
    id v11 = [v10 flowController];
    id v12 = [v11 currentContainer];
    id v13 = (id)[v9 replaceWithPageModel:v7 forContainer:v12 options:0];

    [v15 setHasStarted:0];
    id v14 = (id)[v15 _loadRequest:*(void *)(a1 + 32) bagValue:*(void *)(a1 + 40)];

    id WeakRetained = v15;
  }
}

- (id)_shouldReplaceCurrentAccountAfterSuccessfulAuth
{
  id v4 = self;
  uint64_t v47 = *MEMORY[0x263EF8340];
  if ([(AMSUIWebViewController *)self currentLoadState] == 1)
  {
    uint64_t v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v5)
    {
      uint64_t v5 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [v4 context];
      uint64_t v8 = [v7 logKey];
      id v9 = NSString;
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = v10;
      if (v8)
      {
        id v4 = [v4 context];
        uint64_t v2 = [v4 logKey];
        [v9 stringWithFormat:@"%@: [%@] ", v11, v2];
      }
      else
      {
        [v9 stringWithFormat:@"%@: ", v10];
      id v12 = };
      *(_DWORD *)buf = 138543362;
      id v46 = v12;
      _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_INFO, "%{public}@Load state is initial load, we should replace the account.", buf, 0xCu);
      if (v8)
      {

        id v12 = v4;
      }
    }
    double v34 = (void *)MEMORY[0x263F27E10];
    v35 = (void *)MEMORY[0x263F27B78];
    uint64_t v36 = 1;
LABEL_35:
    id v39 = [v35 BOOLeanWithBool:v36];
    v42 = [v34 promiseWithResult:v39];
    goto LABEL_36;
  }
  id v13 = [v4 context];
  uint64_t v14 = [v13 account];
  if (v14)
  {
    id v15 = (void *)v14;
    id v16 = [v4 context];
    id v17 = [v16 account];
    uint64_t v2 = objc_msgSend(v17, "ams_isLocalAccount");

    if ((v2 & 1) == 0)
    {
      id v18 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v18)
      {
        id v18 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      id v19 = [v18 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = [v4 context];
        uint64_t v21 = [v20 logKey];
        id v22 = NSString;
        uint64_t v23 = objc_opt_class();
        uint64_t v24 = v23;
        if (v21)
        {
          id v4 = [v4 context];
          uint64_t v2 = [v4 logKey];
          [v22 stringWithFormat:@"%@: [%@] ", v24, v2];
        }
        else
        {
          [v22 stringWithFormat:@"%@: ", v23];
        uint64_t v25 = };
        *(_DWORD *)buf = 138543362;
        id v46 = v25;
        _os_log_impl(&dword_21C134000, v19, OS_LOG_TYPE_INFO, "%{public}@There’s already a non-nil, non-local account, we should not replace the account.", buf, 0xCu);
        if (v21)
        {

          uint64_t v25 = v4;
        }
      }
      double v34 = (void *)MEMORY[0x263F27E10];
      v35 = (void *)MEMORY[0x263F27B78];
      uint64_t v36 = 0;
      goto LABEL_35;
    }
  }
  else
  {
  }
  uint64_t v26 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v26)
  {
    uint64_t v26 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v27 = [v26 OSLogObject];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    __int16 v28 = [v4 context];
    uint64_t v29 = [v28 logKey];
    __int16 v30 = NSString;
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = v31;
    if (v29)
    {
      uint64_t v2 = [v4 context];
      id v3 = [(id)v2 logKey];
      [v30 stringWithFormat:@"%@: [%@] ", v32, v3];
    }
    else
    {
      [v30 stringWithFormat:@"%@: ", v31];
    uint64_t v33 = };
    *(_DWORD *)buf = 138543362;
    id v46 = v33;
    _os_log_impl(&dword_21C134000, v27, OS_LOG_TYPE_INFO, "%{public}@Checking for an active account to determine if we should replace the account.", buf, 0xCu);
    if (v29)
    {

      uint64_t v33 = (void *)v2;
    }
  }
  uint64_t v37 = [v4 context];
  uint64_t v38 = [v37 clientInfo];
  id v39 = [v38 accountMediaType];

  id v40 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStoreForMediaType:", v39);
  v41 = objc_msgSend(v40, "ams_activeiTunesAccountForMediaType:", v39);
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __73__AMSUIWebViewController__shouldReplaceCurrentAccountAfterSuccessfulAuth__block_invoke;
  v44[3] = &unk_2643E5CA0;
  void v44[4] = v4;
  v42 = [v41 continueWithBlock:v44];

LABEL_36:
  return v42;
}

id __73__AMSUIWebViewController__shouldReplaceCurrentAccountAfterSuccessfulAuth__block_invoke(id *a1, uint64_t a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  id v6 = (void *)v5;
  if (a2)
  {
    if (!v5)
    {
      id v6 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [a1[4] context];
      id v9 = [v8 logKey];
      uint64_t v10 = NSString;
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = v11;
      if (v9)
      {
        a1 = [a1[4] context];
        uint64_t v2 = [a1 logKey];
        [v10 stringWithFormat:@"%@: [%@] ", v12, v2];
      }
      else
      {
        [v10 stringWithFormat:@"%@: ", v11];
      id v13 = };
      *(_DWORD *)buf = 138543362;
      __int16 v28 = v13;
      _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_INFO, "%{public}@There’s already an active account, we should not replace the account.", buf, 0xCu);
      if (v9)
      {

        id v13 = a1;
      }
    }
    uint64_t v21 = (void *)MEMORY[0x263F27E10];
    id v22 = (void *)MEMORY[0x263F27B78];
    uint64_t v23 = 0;
  }
  else
  {
    if (!v5)
    {
      id v6 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v14 = [v6 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = [a1[4] context];
      id v16 = [v15 logKey];
      id v17 = NSString;
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = v18;
      if (v16)
      {
        a1 = [a1[4] context];
        uint64_t v2 = [a1 logKey];
        [v17 stringWithFormat:@"%@: [%@] ", v19, v2];
      }
      else
      {
        [v17 stringWithFormat:@"%@: ", v18];
      id v20 = };
      *(_DWORD *)buf = 138543362;
      __int16 v28 = v20;
      _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_INFO, "%{public}@There’s no active account, we should replace the account.", buf, 0xCu);
      if (v16)
      {

        id v20 = a1;
      }
    }
    uint64_t v21 = (void *)MEMORY[0x263F27E10];
    id v22 = (void *)MEMORY[0x263F27B78];
    uint64_t v23 = 1;
  }
  uint64_t v24 = [v22 BOOLeanWithBool:v23];
  uint64_t v25 = [v21 promiseWithResult:v24];

  return v25;
}

- (id)_stringForLoadState:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return off_2643E5CC0[a3];
  }
}

- (AMSUIWebDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSUIWebDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)automationView
{
  return self->_automationView;
}

- (void)setAutomationView:(id)a3
{
}

- (AMSUIWebClientContext)context
{
  return self->_context;
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (void)setChildViewController:(id)a3
{
}

- (int64_t)currentLoadState
{
  return self->_currentLoadState;
}

- (void)setCurrentLoadState:(int64_t)a3
{
  self->_currentLoadState = a3;
}

- (BOOL)hasAppeared
{
  return self->_hasAppeared;
}

- (void)setHasAppeared:(BOOL)a3
{
  self->_hasAppeared = a3;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (NSURL)lastLoadedURL
{
  return self->_lastLoadedURL;
}

- (void)setLastLoadedURL:(id)a3
{
}

- (AMSUIWebContainerViewController)rootContainer
{
  return self->_rootContainer;
}

- (AMSUIWebPageViewController)webPage
{
  return self->_webPage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webPage, 0);
  objc_storeStrong((id *)&self->_rootContainer, 0);
  objc_storeStrong((id *)&self->_lastLoadedURL, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_automationView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end