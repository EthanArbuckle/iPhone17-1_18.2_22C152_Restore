@interface AMSUIWebSafariViewController
- (AMSUIWebAppearance)appearance;
- (AMSUIWebClientContext)context;
- (AMSUIWebSafariPageModel)model;
- (AMSUIWebSafariViewController)initWithContext:(id)a3;
- (AMSUIWebSafariWebView)webView;
- (BOOL)_callActionHandlerWithURL:(id)a3 error:(id)a4;
- (BOOL)didHandleDismiss;
- (BOOL)performingNavigation;
- (BOOL)shouldDismissOnCallback;
- (BOOL)shouldSetPresentationDelegate;
- (NSURL)originalURL;
- (UIBarButtonItem)toolbarLeft;
- (UIBarButtonItem)toolbarRight;
- (UIToolbar)toolbar;
- (UIViewController)placeholderPage;
- (id)_createToolBar;
- (id)actionHandler;
- (int64_t)pageState;
- (void)_back:(id)a3;
- (void)_cancel:(id)a3;
- (void)_dismiss;
- (void)_finishedLoadingWithSuccess:(BOOL)a3;
- (void)_forward:(id)a3;
- (void)_handleDismiss;
- (void)_pop;
- (void)_presentActivityViewControllerWithActivityItems:(id)a3;
- (void)_presentPlaceholderModel:(id)a3;
- (void)_refresh:(id)a3;
- (void)_setupPageForWebView;
- (void)_setupSafariNavBarWithSpinner:(BOOL)a3;
- (void)_share:(id)a3;
- (void)_startErrorTimer;
- (void)_startLoadingWebView;
- (void)_transitionToErrorViewWithError:(id)a3;
- (void)_transitionToLoading;
- (void)_transitionToWebView;
- (void)_updateButtons;
- (void)dealloc;
- (void)loadActionURL:(id)a3 data:(id)a4 callbackScheme:(id)a5 actionHandler:(id)a6;
- (void)loadView;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)receiveCallbackURL:(id)a3;
- (void)safariView:(id)a3 didReceiveAction:(id)a4 body:(id)a5 replyHandler:(id)a6;
- (void)safariView:(id)a3 didRedirectToSchemeWithURL:(id)a4;
- (void)setActionHandler:(id)a3;
- (void)setAppearance:(id)a3;
- (void)setDidHandleDismiss:(BOOL)a3;
- (void)setPageState:(int64_t)a3;
- (void)setPerformingNavigation:(BOOL)a3;
- (void)setPlaceholderPage:(id)a3;
- (void)setShouldDismissOnCallback:(BOOL)a3;
- (void)setShouldSetPresentationDelegate:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didCommitNavigation:(id)a4;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4;
- (void)webView:(id)a3 stopURLSchemeTask:(id)a4;
- (void)willPresentPageModel:(id)a3 appearance:(id)a4;
@end

@implementation AMSUIWebSafariViewController

- (AMSUIWebSafariViewController)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIWebSafariViewController;
  v6 = [(AMSUIWebSafariViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (NSURL)originalURL
{
  v2 = [(AMSUIWebSafariViewController *)self model];
  v3 = [v2 URL];

  return (NSURL *)v3;
}

- (void)loadActionURL:(id)a3 data:(id)a4 callbackScheme:(id)a5 actionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [AMSUIWebSafariPageModel alloc];
  v15 = [(AMSUIWebSafariViewController *)self context];
  v16 = [(AMSUIWebSafariPageModel *)v14 initWithJSObject:MEMORY[0x263EFFA78] context:v15];

  [(AMSUIWebSafariPageModel *)v16 setData:v12];
  [(AMSUIWebSafariPageModel *)v16 setCallbackScheme:v11];

  [(AMSUIWebSafariPageModel *)v16 setURL:v13];
  model = self->_model;
  self->_model = v16;
  v20 = v16;

  v18 = _Block_copy(v10);
  id actionHandler = self->_actionHandler;
  self->_id actionHandler = v18;
}

- (void)receiveCallbackURL:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[AMSUIWebOpenSafariAction resultFromURL:v4 error:0];
  v6 = [(AMSUIWebSafariViewController *)self context];
  v7 = [v6 dataProvider];
  id v8 = (id)[v7 postEvent:@"SafariDataUpdate" options:v5];

  objc_super v9 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v9)
  {
    objc_super v9 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    id v12 = [(AMSUIWebSafariViewController *)self context];
    id v13 = [v12 logKey];
    int v14 = 138543874;
    uint64_t v15 = v11;
    __int16 v16 = 2114;
    v17 = v13;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received URL with scheme: %@", (uint8_t *)&v14, 0x20u);
  }
  [(AMSUIWebSafariViewController *)self _callActionHandlerWithURL:v4 error:0];
  if (![(AMSUIWebSafariViewController *)self didHandleDismiss]
    && [(AMSUIWebSafariViewController *)self shouldDismissOnCallback])
  {
    [(AMSUIWebSafariViewController *)self setDidHandleDismiss:1];
    [(UIViewController *)self ams_dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)willPresentPageModel:(id)a3 appearance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_appearance, a4);
  id v10 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = (AMSUIWebSafariPageModel *)v10;
  }
  else {
    id v8 = 0;
  }

  model = self->_model;
  self->_model = v8;
}

- (void)loadView
{
  v24.receiver = self;
  v24.super_class = (Class)AMSUIWebSafariViewController;
  [(AMSUICommonViewController *)&v24 loadView];
  v3 = objc_alloc_init(AMSUIWebDelegateProxy);
  [(AMSUIWebDelegateProxy *)v3 setDelegate:self];
  id v4 = [(AMSUIWebSafariViewController *)self appearance];
  id v5 = [v4 backgroundColor];
  if (v5)
  {
    [(UIViewController *)self ams_setBackgroundColor:v5];
  }
  else
  {
    id v6 = +[AMSUIWebAppearance defaultPlatformBackgroundColor];
    [(UIViewController *)self ams_setBackgroundColor:v6];
  }
  id v7 = [AMSUIWebSafariWebView alloc];
  id v8 = [(AMSUIWebSafariViewController *)self appearance];
  objc_super v9 = [(AMSUIWebSafariViewController *)self model];
  id v10 = [v9 callbackScheme];
  uint64_t v11 = [(AMSUIWebSafariViewController *)self model];
  id v12 = [v11 data];
  id v13 = [(AMSUIWebSafariWebView *)v7 initWithAppearance:v8 scheme:v10 data:v12 delegate:self];
  webView = self->_webView;
  self->_webView = v13;

  uint64_t v15 = [(AMSUIWebSafariViewController *)self context];
  __int16 v16 = [v15 logKey];
  [(AMSUIWebSafariWebView *)self->_webView setLogKey:v16];

  v17 = [(AMSUIWebSafariViewController *)self appearance];
  __int16 v18 = [v17 backgroundColor];
  if (v18)
  {
    [(UIView *)self->_webView ams_setBackgroundColor:v18];
  }
  else
  {
    id v19 = +[AMSUIWebAppearance defaultPlatformBackgroundColor];
    [(UIView *)self->_webView ams_setBackgroundColor:v19];
  }
  uint64_t v20 = [(AMSUICommonViewController *)self view];
  v21 = [(AMSUIWebSafariViewController *)self webView];
  [v20 addSubview:v21];

  [(AMSUIWebSafariViewController *)self _startLoadingWebView];
  v22 = [(AMSUIWebSafariViewController *)self model];
  v23 = [v22 loadingModel];

  if (v23)
  {
    [(AMSUIWebSafariViewController *)self _transitionToLoading];
  }
  else
  {
    [(AMSUIWebSafariViewController *)self _transitionToWebView];
    [(AMSUIWebSafariViewController *)self _setupPageForWebView];
  }
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v3)
  {
    v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = [(AMSUIWebSafariViewController *)self context];
    id v7 = [v6 logKey];
    *(_DWORD *)buf = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Deallocated", buf, 0x16u);
  }
  [(AMSUIWebSafariViewController *)self _handleDismiss];
  v8.receiver = self;
  v8.super_class = (Class)AMSUIWebSafariViewController;
  [(AMSUICommonViewController *)&v8 dealloc];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(MEMORY[0x263F27CB8], "sharedConfig", a3);
  if (!v4)
  {
    id v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [(AMSUIWebSafariViewController *)self context];
    objc_super v8 = [v7 logKey];
    int v9 = 138543618;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    id v12 = v8;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling swipe to dismiss", (uint8_t *)&v9, 0x16u);
  }
  [(AMSUIWebSafariViewController *)self _handleDismiss];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(AMSUIWebSafariViewController *)self isMovingFromParentViewController])
  {
    uint64_t v5 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v5)
    {
      uint64_t v5 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      objc_super v8 = [(AMSUIWebSafariViewController *)self context];
      int v9 = [v8 logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      int v14 = v9;
      _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling disappear dismissal", buf, 0x16u);
    }
    [(AMSUIWebSafariViewController *)self _handleDismiss];
  }
  v10.receiver = self;
  v10.super_class = (Class)AMSUIWebSafariViewController;
  [(AMSUIWebSafariViewController *)&v10 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUIWebSafariViewController;
  [(AMSUIWebSafariViewController *)&v6 viewWillAppear:a3];
  [(AMSUIWebSafariViewController *)self _setupPageForWebView];
  if ([(AMSUIWebSafariViewController *)self shouldSetPresentationDelegate])
  {
    id v4 = [(AMSUIWebSafariViewController *)self navigationController];
    uint64_t v5 = [v4 presentationController];
    [v5 setDelegate:self];
  }
}

- (void)viewWillLayoutSubviews
{
  v50.receiver = self;
  v50.super_class = (Class)AMSUIWebSafariViewController;
  [(AMSUIWebSafariViewController *)&v50 viewWillLayoutSubviews];
  BOOL v3 = [(AMSUIWebSafariViewController *)self toolbar];
  id v4 = [(AMSUICommonViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "sizeThatFits:", v5, v6);
  double v8 = v7;
  double v10 = v9;

  __int16 v11 = [(AMSUICommonViewController *)self view];
  [v11 bounds];
  double v13 = v12 - v10;
  int v14 = [(AMSUICommonViewController *)self view];
  [v14 safeAreaInsets];
  double v16 = v13 - v15;
  v17 = [(AMSUIWebSafariViewController *)self toolbar];
  objc_msgSend(v17, "setFrame:", 0.0, v16, v8, v10);

  __int16 v18 = [(AMSUICommonViewController *)self view];
  [v18 safeAreaInsets];
  double v20 = v19;
  v21 = [(AMSUICommonViewController *)self view];
  [v21 bounds];
  double v23 = v22;
  objc_super v24 = [(AMSUICommonViewController *)self view];
  [v24 bounds];
  double v26 = v25 - v10;
  v27 = [(AMSUICommonViewController *)self view];
  [v27 safeAreaInsets];
  double v29 = v26 - v28;
  v30 = [(AMSUICommonViewController *)self view];
  [v30 safeAreaInsets];
  double v32 = v29 - v31;
  v33 = [(AMSUIWebSafariViewController *)self webView];
  objc_msgSend(v33, "setFrame:", 0.0, v20, v23, v32);

  v34 = [(AMSUICommonViewController *)self view];
  [v34 bounds];
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  v43 = [(AMSUIWebSafariViewController *)self placeholderPage];
  v44 = [v43 view];
  objc_msgSend(v44, "setFrame:", v36, v38, v40, v42);

  v45 = [(AMSUIWebSafariViewController *)self webView];
  v46 = [v45 scrollView];
  [v46 setContentInsetAdjustmentBehavior:2];

  v47 = [(AMSUIWebSafariViewController *)self webView];
  v48 = [v47 scrollView];
  v49 = [v48 layer];
  [v49 setMasksToBounds:0];
}

- (void)safariView:(id)a3 didReceiveAction:(id)a4 body:(id)a5 replyHandler:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  double v12 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v12)
  {
    double v12 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  double v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = objc_opt_class();
    double v15 = [(AMSUIWebSafariViewController *)self context];
    double v16 = [v15 logKey];
    *(_DWORD *)buf = 138543874;
    uint64_t v31 = v14;
    __int16 v32 = 2114;
    v33 = v16;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received action: %@", buf, 0x20u);
  }
  if ([v9 isEqualToString:@"callback"])
  {
    v17 = [(AMSUIWebSafariViewController *)self context];
    __int16 v18 = [v17 dataProvider];
    double v19 = [v18 runSafariCallback:v10];

    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __78__AMSUIWebSafariViewController_safariView_didReceiveAction_body_replyHandler___block_invoke;
    v28[3] = &unk_2643E5680;
    v28[4] = self;
    id v29 = v11;
    [v19 addFinishBlock:v28];

    goto LABEL_22;
  }
  if ([v9 isEqualToString:@"dismiss"])
  {
    [(AMSUIWebSafariViewController *)self _dismiss];
LABEL_21:
    (*((void (**)(id, void, void))v11 + 2))(v11, MEMORY[0x263EFFA88], 0);
    goto LABEL_22;
  }
  if ([v9 isEqualToString:@"pop"])
  {
    [(AMSUIWebSafariViewController *)self _pop];
    goto LABEL_21;
  }
  if ([v9 isEqualToString:@"finishedLoading"])
  {
    double v20 = [v10 objectForKeyedSubscript:@"success"];
    if (objc_opt_respondsToSelector())
    {
      v21 = [v10 objectForKeyedSubscript:@"success"];
      uint64_t v22 = [v21 BOOLValue];
    }
    else
    {
      uint64_t v22 = 0;
    }

    [(AMSUIWebSafariViewController *)self _finishedLoadingWithSuccess:v22];
    goto LABEL_21;
  }
  double v23 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v23)
  {
    double v23 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  objc_super v24 = [v23 OSLogObject];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = objc_opt_class();
    double v26 = [(AMSUIWebSafariViewController *)self context];
    v27 = [v26 logKey];
    *(_DWORD *)buf = 138543874;
    uint64_t v31 = v25;
    __int16 v32 = 2114;
    v33 = v27;
    __int16 v34 = 2114;
    id v35 = v9;
    _os_log_impl(&dword_21C134000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unknown safari action: %{public}@", buf, 0x20u);
  }
  (*((void (**)(id, void, __CFString *))v11 + 2))(v11, 0, @"Error: Unknown safari action");
LABEL_22:
}

void __78__AMSUIWebSafariViewController_safariView_didReceiveAction_body_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  double v7 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v7)
  {
    double v7 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  double v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    id v10 = [*(id *)(a1 + 32) context];
    id v11 = [v10 logKey];
    int v14 = 138544130;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    v17 = v11;
    __int16 v18 = 2114;
    id v19 = v5;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Returning result: %{public}@ error: %{public}@", (uint8_t *)&v14, 0x2Au);
  }
  uint64_t v12 = *(void *)(a1 + 40);
  double v13 = [v6 localizedDescription];
  (*(void (**)(uint64_t, id, void *))(v12 + 16))(v12, v5, v13);
}

- (void)safariView:(id)a3 didRedirectToSchemeWithURL:(id)a4
{
}

- (void)webView:(id)a3 didCommitNavigation:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend(MEMORY[0x263F27CB8], "sharedWebUIConfig", a3, a4);
  if (!v5)
  {
    id v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    double v8 = [(AMSUIWebSafariViewController *)self context];
    uint64_t v9 = [v8 logKey];
    id v10 = [(AMSUIWebSafariViewController *)self webView];
    id v11 = [v10 URL];
    int v12 = 138543874;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Commit navigation: %@", (uint8_t *)&v12, 0x20u);
  }
  [(AMSUIWebSafariViewController *)self _updateButtons];
  [(AMSUIWebSafariViewController *)self _setupPageForWebView];
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  -[AMSUIWebSafariViewController setPerformingNavigation:](self, "setPerformingNavigation:", 0, a4);
  [(AMSUIWebSafariViewController *)self _setupPageForWebView];
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  -[AMSUIWebSafariViewController setPerformingNavigation:](self, "setPerformingNavigation:", 1, a4);
  [(AMSUIWebSafariViewController *)self _setupPageForWebView];
}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend(MEMORY[0x263F27CB8], "sharedWebUIConfig", a3, a4);
  if (!v5)
  {
    id v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    double v8 = [(AMSUIWebSafariViewController *)self context];
    uint64_t v9 = [v8 logKey];
    int v10 = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did stop handling scheme.", (uint8_t *)&v10, 0x16u);
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a4;
  double v8 = (void (**)(id, uint64_t))a5;
  uint64_t v9 = [v7 request];
  int v10 = [v9 URL];

  uint64_t v11 = [v10 scheme];
  if ([v11 isEqualToString:@"http"])
  {

    goto LABEL_4;
  }
  __int16 v12 = [v10 scheme];
  int v13 = [v12 isEqualToString:@"https"];

  if (v13)
  {
LABEL_4:
    uint64_t v14 = [v7 targetFrame];

    if (v14)
    {
      v8[2](v8, 1);
    }
    else
    {
      [MEMORY[0x263F27DC8] openStandardURL:v10];
      v8[2](v8, 0);
    }
    goto LABEL_12;
  }
  uint64_t v15 = [v10 scheme];
  __int16 v16 = [(AMSUIWebSafariViewController *)self model];
  uint64_t v17 = [v16 callbackScheme];
  uint64_t v18 = (void *)v17;
  if (v17) {
    id v19 = (__CFString *)v17;
  }
  else {
    id v19 = &stru_26CC491D8;
  }
  int v20 = [v15 isEqualToString:v19];

  if (v20)
  {
    v8[2](v8, 3);
  }
  else
  {
    id v21 = [MEMORY[0x263F01880] defaultWorkspace];
    uint64_t v22 = [v21 applicationsAvailableForOpeningURL:v10];

    if ([v22 count])
    {
      id v35 = v22;
      double v23 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v23)
      {
        double v23 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      objc_super v24 = [v23 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = objc_opt_class();
        double v26 = [(AMSUIWebSafariViewController *)self context];
        v27 = [v26 logKey];
        *(_DWORD *)buf = 138543874;
        uint64_t v39 = v25;
        __int16 v40 = 2114;
        double v41 = v27;
        __int16 v42 = 2112;
        id v43 = v10;
        _os_log_impl(&dword_21C134000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to open URL with LS: %@", buf, 0x20u);
      }
      double v28 = [MEMORY[0x263F82438] sharedApplication];
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __88__AMSUIWebSafariViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
      v36[3] = &unk_2643E56A8;
      v36[4] = self;
      id v29 = v10;
      id v37 = v29;
      [v28 openURL:v29 options:MEMORY[0x263EFFA78] completionHandler:v36];

      v30 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v30)
      {
        v30 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      uint64_t v31 = [v30 OSLogObject];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = objc_opt_class();
        v33 = [(AMSUIWebSafariViewController *)self context];
        __int16 v34 = [v33 logKey];
        *(_DWORD *)buf = 138543874;
        uint64_t v39 = v32;
        __int16 v40 = 2114;
        double v41 = v34;
        __int16 v42 = 2112;
        id v43 = v29;
        _os_log_impl(&dword_21C134000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Redirecting to app URL scheme for URL: %@", buf, 0x20u);
      }
      [(AMSUIWebSafariViewController *)self setPerformingNavigation:0];
      [(AMSUIWebSafariViewController *)self _setupPageForWebView];
      v8[2](v8, 0);
      uint64_t v22 = v35;
    }
    else
    {
      v8[2](v8, 1);
    }
  }
LABEL_12:
}

void __88__AMSUIWebSafariViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1, char a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((a2 & 1) == 0)
  {
    BOOL v3 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v3)
    {
      BOOL v3 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_opt_class();
      id v6 = [*(id *)(a1 + 32) context];
      id v7 = [v6 logKey];
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543874;
      uint64_t v10 = v5;
      __int16 v11 = 2114;
      __int16 v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Could not load app URL scheme for URL: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)_back:(id)a3
{
  id v4 = [(AMSUIWebSafariViewController *)self webView];
  id v3 = (id)[v4 goBack];
}

- (void)_cancel:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(MEMORY[0x263F27CB8], "sharedConfig", a3);
  if (!v4)
  {
    id v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [(AMSUIWebSafariViewController *)self context];
    uint64_t v8 = [v7 logKey];
    int v9 = 138543618;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    __int16 v12 = v8;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Cancel selected", (uint8_t *)&v9, 0x16u);
  }
  [(AMSUIWebSafariViewController *)self _dismiss];
}

- (id)_createToolBar
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [MEMORY[0x263F824A8] fixedSpaceItemOfWidth:15.0];
  [v3 addObject:v4];

  id v5 = objc_alloc(MEMORY[0x263F824A8]);
  uint64_t v6 = objc_msgSend(MEMORY[0x263F827E8], "ams_systemChevronLeft");
  id v7 = (UIBarButtonItem *)[v5 initWithImage:v6 style:0 target:self action:sel__back_];
  toolbarLeft = self->_toolbarLeft;
  self->_toolbarLeft = v7;

  [v3 addObject:self->_toolbarLeft];
  int v9 = [MEMORY[0x263F824A8] fixedSpaceItemOfWidth:40.0];
  [v3 addObject:v9];

  id v10 = objc_alloc(MEMORY[0x263F824A8]);
  __int16 v11 = objc_msgSend(MEMORY[0x263F827E8], "ams_systemChevronRight");
  __int16 v12 = (UIBarButtonItem *)[v10 initWithImage:v11 style:0 target:self action:sel__forward_];
  toolbarRight = self->_toolbarRight;
  self->_toolbarRight = v12;

  [v3 addObject:self->_toolbarRight];
  uint64_t v14 = [(AMSUIWebSafariViewController *)self model];
  LODWORD(v11) = [v14 showShareButton];

  if (v11)
  {
    uint64_t v15 = [MEMORY[0x263F824A8] flexibleSpaceItem];
    [v3 addObject:v15];

    __int16 v16 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:9 target:self action:sel__share_];
    [v3 addObject:v16];
  }
  id v17 = objc_alloc(MEMORY[0x263F82D70]);
  uint64_t v18 = objc_msgSend(v17, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v18 setItems:v3 animated:0];

  return v18;
}

- (void)_dismiss
{
  [(AMSUIWebSafariViewController *)self _handleDismiss];
  [(UIViewController *)self ams_dismissViewControllerAnimated:1 completion:0];
}

- (void)_finishedLoadingWithSuccess:(BOOL)a3
{
  if (a3)
  {
    [(AMSUIWebSafariViewController *)self _transitionToWebView];
  }
  else
  {
    AMSError();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(AMSUIWebSafariViewController *)self _transitionToErrorViewWithError:v4];
  }
}

- (void)_forward:(id)a3
{
  id v4 = [(AMSUIWebSafariViewController *)self webView];
  id v3 = (id)[v4 goForward];
}

- (void)_handleDismiss
{
  [(AMSUIWebSafariViewController *)self setDidHandleDismiss:1];
  AMSError();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(AMSUIWebSafariViewController *)self _callActionHandlerWithURL:0 error:v3];
}

- (BOOL)_callActionHandlerWithURL:(id)a3 error:(id)a4
{
  unint64_t v6 = (unint64_t)a3;
  uint64_t v7 = (uint64_t)a4;
  if (!(v6 | v7))
  {
    uint64_t v7 = AMSError();
  }
  if (v7)
  {

    unint64_t v6 = 0;
  }
  uint64_t v8 = [(AMSUIWebSafariViewController *)self actionHandler];

  if (v8)
  {
    int v9 = [(AMSUIWebSafariViewController *)self actionHandler];
    v9[2](v9, v6, v7);

    [(AMSUIWebSafariViewController *)self setActionHandler:0];
  }

  return v8 != 0;
}

- (void)_pop
{
  [(AMSUIWebSafariViewController *)self _handleDismiss];
  id v4 = [(AMSUIWebSafariViewController *)self navigationController];
  id v3 = (id)[v4 popViewControllerAnimated:1];
}

- (void)_presentActivityViewControllerWithActivityItems:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F6BC98];
  id v5 = a3;
  id v8 = (id)[[v4 alloc] initWithActivityItems:v5 applicationActivities:0];

  unint64_t v6 = [(AMSUICommonViewController *)self view];
  uint64_t v7 = [v8 popoverPresentationController];
  [v7 setSourceView:v6];

  [(AMSUIWebSafariViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)_presentPlaceholderModel:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIWebSafariViewController *)self placeholderPage];
  objc_msgSend(v5, "ams_removeFromParentViewController");

  [(AMSUIWebSafariViewController *)self setPlaceholderPage:0];
  id v7 = [v4 createViewControllerForContainer:0];
  unint64_t v6 = [(AMSUIWebSafariViewController *)self appearance];
  [v7 willPresentPageModel:v4 appearance:v6];

  [(UIViewController *)self ams_setChildViewController:v7];
  [(AMSUIWebSafariViewController *)self setPlaceholderPage:v7];
}

- (void)_refresh:(id)a3
{
  id v4 = [(AMSUIWebSafariViewController *)self webView];
  id v3 = (id)[v4 reload];
}

- (void)_startLoadingWebView
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AMSUIWebSafariViewController *)self model];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(AMSUIWebSafariViewController *)self webView];

    if (v5)
    {
      unint64_t v6 = [(AMSUIWebSafariViewController *)self webView];
      id v7 = [v6 URL];

      uint64_t v8 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      int v9 = (void *)v8;
      if (v7)
      {
        if (!v8)
        {
          int v9 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        id v10 = [v9 OSLogObject];
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          goto LABEL_14;
        }
        uint64_t v11 = objc_opt_class();
        __int16 v12 = [(AMSUIWebSafariViewController *)self context];
        uint64_t v13 = [v12 logKey];
        int v25 = 138543618;
        uint64_t v26 = v11;
        __int16 v27 = 2114;
        double v28 = v13;
        _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Safari already loaded", (uint8_t *)&v25, 0x16u);
      }
      else
      {
        if (!v8)
        {
          int v9 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        uint64_t v14 = [v9 OSLogObject];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = objc_opt_class();
          __int16 v16 = [(AMSUIWebSafariViewController *)self context];
          id v17 = [v16 logKey];
          uint64_t v18 = [(AMSUIWebSafariViewController *)self model];
          id v19 = [v18 URL];
          int v20 = [(AMSUIWebSafariViewController *)self model];
          id v21 = [v20 callbackScheme];
          int v25 = 138544130;
          uint64_t v26 = v15;
          __int16 v27 = 2114;
          double v28 = v17;
          __int16 v29 = 2112;
          v30 = v19;
          __int16 v31 = 2114;
          uint64_t v32 = v21;
          _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loading safari url: %@, scheme: %{public}@", (uint8_t *)&v25, 0x2Au);
        }
        int v9 = [(AMSUIWebSafariViewController *)self webView];
        uint64_t v22 = (void *)MEMORY[0x263F08BD8];
        id v10 = [(AMSUIWebSafariViewController *)self model];
        __int16 v12 = [v10 URL];
        double v23 = [v22 requestWithURL:v12];
        id v24 = (id)[v9 loadRequest:v23];
      }
LABEL_14:
    }
  }
}

- (void)_setupPageForWebView
{
  if ([(AMSUIWebSafariViewController *)self pageState] != 3) {
    return;
  }
  uint64_t v3 = [(AMSUIWebSafariViewController *)self model];
  if ([v3 hideToolBar]) {
    goto LABEL_5;
  }
  id v4 = [(AMSUIWebSafariViewController *)self toolbar];

  if (!v4)
  {
    id v5 = [(AMSUIWebSafariViewController *)self _createToolBar];
    toolbar = self->_toolbar;
    self->_toolbar = v5;

    uint64_t v3 = [(AMSUICommonViewController *)self view];
    id v7 = [(AMSUIWebSafariViewController *)self toolbar];
    [v3 addSubview:v7];

LABEL_5:
  }
  BOOL v8 = [(AMSUIWebSafariViewController *)self performingNavigation];
  [(AMSUIWebSafariViewController *)self _setupSafariNavBarWithSpinner:v8];
}

- (void)_share:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = [(AMSUIWebSafariViewController *)self webView];
  id v5 = [v4 URL];

  if (v5)
  {
    unint64_t v6 = [(AMSUIWebSafariViewController *)self webView];
    id v7 = [v6 URL];
    id v8 = [v7 lastPathComponent];

    int v9 = [(AMSUIWebSafariViewController *)self webView];
    id v10 = [v9 URL];
    uint64_t v11 = [v10 pathExtension];
    __int16 v12 = [v11 lowercaseString];
    int v13 = [v12 isEqualToString:@"pdf"];

    if (v13)
    {
      uint64_t v14 = [(AMSUIWebSafariViewController *)self webView];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __39__AMSUIWebSafariViewController__share___block_invoke;
      v20[3] = &unk_2643E54A8;
      id v8 = v8;
      id v21 = v8;
      uint64_t v22 = self;
      [v14 _getMainResourceDataWithCompletionHandler:v20];
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __39__AMSUIWebSafariViewController__share___block_invoke_2_82;
      block[3] = &unk_2643E3118;
      block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
  else
  {
    id v8 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v8)
    {
      id v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v15 = [v8 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_opt_class();
      id v17 = [(AMSUIWebSafariViewController *)self context];
      uint64_t v18 = [v17 logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v16;
      __int16 v25 = 2114;
      uint64_t v26 = v18;
      _os_log_impl(&dword_21C134000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No URL to share", buf, 0x16u);
    }
  }
}

void __39__AMSUIWebSafariViewController__share___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__AMSUIWebSafariViewController__share___block_invoke_2;
    block[3] = &unk_2643E3360;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v8 = v5;
    uint64_t v9 = v6;
    id v10 = v3;
    dispatch_async(v4, block);
  }
}

void __39__AMSUIWebSafariViewController__share___block_invoke_2(void *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08850] defaultManager];
  id v3 = [v2 temporaryDirectory];
  id v4 = [v3 URLByAppendingPathComponent:a1[4]];

  id v5 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v6 = [v4 path];
  char v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F27CB8] sharedPushNotificationConfig];
    if (!v9)
    {
      uint64_t v9 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = objc_opt_class();
      __int16 v21 = 2114;
      id v22 = v4;
      _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: Writing pdf asset to %{public}@", buf, 0x16u);
    }

    uint64_t v11 = (void *)a1[6];
    id v18 = 0;
    [v11 writeToURL:v4 options:1 error:&v18];
    id v8 = v18;
    if (v8)
    {
      __int16 v12 = [MEMORY[0x263F27CB8] sharedPushNotificationConfig];
      if (!v12)
      {
        __int16 v12 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      int v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v20 = v14;
        __int16 v21 = 2114;
        id v22 = v8;
        _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_INFO, "%{public}@: Error writing pdf asset: %{public}@", buf, 0x16u);
      }
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__AMSUIWebSafariViewController__share___block_invoke_78;
  block[3] = &unk_2643E34D0;
  void block[4] = a1[5];
  id v17 = v4;
  id v15 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __39__AMSUIWebSafariViewController__share___block_invoke_78(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", *(void *)(a1 + 40), 0);
  [v1 _presentActivityViewControllerWithActivityItems:v2];
}

void __39__AMSUIWebSafariViewController__share___block_invoke_2_82(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = objc_alloc(MEMORY[0x263EFF8C0]);
  id v8 = [*(id *)(a1 + 32) webView];
  id v4 = [v8 URL];
  id v5 = [*(id *)(a1 + 32) webView];
  uint64_t v6 = [v5 viewPrintFormatter];
  char v7 = objc_msgSend(v3, "initWithObjects:", v4, v6, 0);
  [v2 _presentActivityViewControllerWithActivityItems:v7];
}

- (void)_startErrorTimer
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__AMSUIWebSafariViewController__startErrorTimer__block_invoke;
  v6[3] = &unk_2643E3118;
  v6[4] = self;
  id v2 = v6;
  id v3 = AMSLogKey();
  dispatch_time_t v4 = dispatch_time(0, 30000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAfter_block_invoke_2;
  block[3] = &unk_2643E33B0;
  id v8 = v3;
  id v9 = v2;
  id v5 = v3;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

void __48__AMSUIWebSafariViewController__startErrorTimer__block_invoke(uint64_t a1)
{
  AMSError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) _transitionToErrorViewWithError:v2];
}

- (void)_transitionToErrorViewWithError:(id)a3
{
  id v4 = a3;
  if ([(AMSUIWebSafariViewController *)self pageState] == 1
    || ![(AMSUIWebSafariViewController *)self pageState])
  {
    [(AMSUIWebSafariViewController *)self setPageState:2];
    objc_initWeak(&location, self);
    id v5 = [AMSUIWebErrorPageModel alloc];
    uint64_t v6 = [(AMSUIWebSafariViewController *)self context];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    id v10 = __64__AMSUIWebSafariViewController__transitionToErrorViewWithError___block_invoke;
    uint64_t v11 = &unk_2643E56D0;
    objc_copyWeak(&v12, &location);
    char v7 = [(AMSUIWebErrorPageModel *)v5 initWithError:v4 context:v6 actionBlock:&v8];

    -[AMSUIWebSafariViewController _presentPlaceholderModel:](self, "_presentPlaceholderModel:", v7, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __64__AMSUIWebSafariViewController__transitionToErrorViewWithError___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained webView];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__AMSUIWebSafariViewController__transitionToErrorViewWithError___block_invoke_2;
  v4[3] = &unk_2643E4B68;
  objc_copyWeak(&v5, v1);
  [v3 evaluateJavaScript:@"AMSSafari.retryCallback();" completionHandler:v4];

  objc_destroyWeak(&v5);
}

void __64__AMSUIWebSafariViewController__transitionToErrorViewWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  char v7 = (void *)v6;
  if (v4)
  {
    if (!v6)
    {
      char v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = [WeakRetained context];
      uint64_t v11 = [v10 logKey];
      int v16 = 138543874;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      id v19 = v11;
      __int16 v20 = 2114;
      id v21 = v4;
      _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to run retry script. %{public}@", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    if (!v6)
    {
      char v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v12 = [v7 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = [WeakRetained context];
      id v15 = [v14 logKey];
      int v16 = 138543618;
      uint64_t v17 = v13;
      __int16 v18 = 2114;
      id v19 = v15;
      _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully ran retry script", (uint8_t *)&v16, 0x16u);
    }
    [WeakRetained _transitionToLoading];
  }
}

- (void)_transitionToLoading
{
  if ([(AMSUIWebSafariViewController *)self pageState] == 2
    || ![(AMSUIWebSafariViewController *)self pageState])
  {
    [(AMSUIWebSafariViewController *)self setPageState:1];
    id v3 = [(AMSUIWebSafariViewController *)self model];
    id v4 = [v3 loadingModel];
    [(AMSUIWebSafariViewController *)self _presentPlaceholderModel:v4];

    [(AMSUIWebSafariViewController *)self _startErrorTimer];
  }
}

- (void)_transitionToWebView
{
  if ([(AMSUIWebSafariViewController *)self pageState] != 3)
  {
    [(AMSUIWebSafariViewController *)self setPageState:3];
    [(AMSUIWebSafariViewController *)self _setupPageForWebView];
    id v3 = [(AMSUIWebSafariViewController *)self placeholderPage];
    objc_msgSend(v3, "ams_removeFromParentViewController");

    [(AMSUIWebSafariViewController *)self setPlaceholderPage:0];
  }
}

- (void)_setupSafariNavBarWithSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  v40[1] = *MEMORY[0x263EF8340];
  if ([(AMSUIWebSafariViewController *)self pageState] == 3)
  {
    id v5 = [(UIViewController *)self ams_navigationItemViewController];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [v5 navigationItem];
    }
    else
    {
      uint64_t v6 = 0;
    }
    char v7 = [(AMSUIWebSafariViewController *)self model];
    uint64_t v8 = [v7 navigationBar];
    uint64_t v9 = [v8 title];
    if (v9)
    {
      [v5 setTitle:v9];
    }
    else
    {
      BOOL v36 = v3;
      id v37 = v6;
      id v10 = [(AMSUIWebSafariViewController *)self webView];
      uint64_t v11 = [v10 URL];
      id v12 = [v11 host];
      if (v12)
      {
        [v5 setTitle:v12];
      }
      else
      {
        id v35 = [(AMSUIWebSafariViewController *)self model];
        uint64_t v13 = [v35 URL];
        uint64_t v14 = [v13 host];
        [v5 setTitle:v14];
      }
      uint64_t v6 = v37;
      BOOL v3 = v36;
    }

    id v15 = [(AMSUIWebSafariViewController *)self model];
    int v16 = [v15 navigationBar];
    if ([v16 includesLeftItems])
    {
    }
    else
    {
      uint64_t v17 = [(AMSUIWebSafariViewController *)self navigationController];
      __int16 v18 = [v17 viewControllers];
      unint64_t v19 = [v18 count];

      if (v19 <= 1)
      {
        id v20 = objc_alloc(MEMORY[0x263F824A8]);
        id v21 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
        uint64_t v22 = AMSUILocalizedStringFromBundle(@"CANCEL", 0, v21);
        uint64_t v23 = (void *)[v20 initWithTitle:v22 style:0 target:self action:sel__cancel_];

        [v23 setAccessibilityIdentifier:@"cancel_bar_button_item"];
        v40[0] = v23;
        uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:1];
        [v6 setLeftBarButtonItems:v24];
      }
    }
    __int16 v25 = [(AMSUIWebSafariViewController *)self model];
    uint64_t v26 = [v25 navigationBar];
    char v27 = [v26 includesRightItems];

    if (v27) {
      goto LABEL_21;
    }
    if (v3)
    {
      double v28 = [v6 rightBarButtonItem];
      __int16 v29 = [v28 customView];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
LABEL_21:

        return;
      }
      __int16 v31 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
      uint64_t v32 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v31];
      [v32 setAccessibilityIdentifier:@"activity_indicator_bar_button_item"];
      [v31 startAnimating];
      uint64_t v39 = v32;
      uint64_t v33 = &v39;
    }
    else
    {
      uint64_t v32 = [MEMORY[0x263F827E8] systemImageNamed:@"arrow.clockwise"];
      __int16 v31 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithImage:v32 style:0 target:self action:sel__refresh_];
      [v31 setAccessibilityIdentifier:@"refresh_bar_button_item"];
      double v38 = v31;
      uint64_t v33 = &v38;
    }
    __int16 v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
    [v6 setRightBarButtonItems:v34];

    goto LABEL_21;
  }
}

- (void)_updateButtons
{
  BOOL v3 = [(AMSUIWebSafariViewController *)self webView];
  uint64_t v4 = [v3 canGoBack];
  id v5 = [(AMSUIWebSafariViewController *)self toolbarLeft];
  [v5 setEnabled:v4];

  id v8 = [(AMSUIWebSafariViewController *)self webView];
  uint64_t v6 = [v8 canGoForward];
  char v7 = [(AMSUIWebSafariViewController *)self toolbarRight];
  [v7 setEnabled:v6];
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (BOOL)shouldDismissOnCallback
{
  return self->_shouldDismissOnCallback;
}

- (void)setShouldDismissOnCallback:(BOOL)a3
{
  self->_shouldDismissOnCallback = a3;
}

- (BOOL)shouldSetPresentationDelegate
{
  return self->_shouldSetPresentationDelegate;
}

- (void)setShouldSetPresentationDelegate:(BOOL)a3
{
  self->_shouldSetPresentationDelegate = a3;
}

- (AMSUIWebAppearance)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(id)a3
{
}

- (AMSUIWebClientContext)context
{
  return self->_context;
}

- (BOOL)didHandleDismiss
{
  return self->_didHandleDismiss;
}

- (void)setDidHandleDismiss:(BOOL)a3
{
  self->_didHandleDismiss = a3;
}

- (UIViewController)placeholderPage
{
  return self->_placeholderPage;
}

- (void)setPlaceholderPage:(id)a3
{
}

- (AMSUIWebSafariPageModel)model
{
  return self->_model;
}

- (int64_t)pageState
{
  return self->_pageState;
}

- (void)setPageState:(int64_t)a3
{
  self->_pageState = a3;
}

- (BOOL)performingNavigation
{
  return self->_performingNavigation;
}

- (void)setPerformingNavigation:(BOOL)a3
{
  self->_performingNavigation = a3;
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (UIBarButtonItem)toolbarLeft
{
  return self->_toolbarLeft;
}

- (UIBarButtonItem)toolbarRight
{
  return self->_toolbarRight;
}

- (AMSUIWebSafariWebView)webView
{
  return self->_webView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_toolbarRight, 0);
  objc_storeStrong((id *)&self->_toolbarLeft, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_placeholderPage, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_appearance, 0);
  objc_storeStrong(&self->_actionHandler, 0);
}

@end