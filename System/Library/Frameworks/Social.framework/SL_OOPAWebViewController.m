@interface SL_OOPAWebViewController
- (BOOL)webView:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5;
- (NSString)backingTitle;
- (NSString)hostString;
- (NSString)username;
- (NSURL)authURL;
- (SL_OOPAWebViewController)init;
- (SL_OOPAWebViewControllerDelegate)delegate;
- (SL_OOPAuthFlowDelegate)authFlowDelegate;
- (void)_cancelButtonTapped:(id)a3;
- (void)_didFinishWithSuccess:(BOOL)a3 response:(id)a4 error:(id)a5;
- (void)_evaluateDocumentTitleForUIWebView:(id)a3 retryCount:(unint64_t)a4 completion:(id)a5;
- (void)_evaluateDocumentTitleForWebView:(id)a3 retryCount:(unint64_t)a4 completion:(id)a5;
- (void)_loadWebView;
- (void)_loadWebViewIfReady;
- (void)_updateNavBarTitle;
- (void)_updateNavigationPromptWithActiveURL:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAuthFlowDelegate:(id)a3;
- (void)setAuthURL:(id)a3;
- (void)setBackingTitle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHostString:(id)a3;
- (void)setNavBarTitle:(id)a3;
- (void)setUsername:(id)a3;
- (void)startAnimating;
- (void)stopAnimating;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailLoadWithError:(id)a4;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didReceiveServerRedirectForProvisionalNavigation:(id)a4;
- (void)webViewDidFinishLoad:(id)a3;
@end

@implementation SL_OOPAWebViewController

- (SL_OOPAWebViewController)init
{
  v21.receiver = self;
  v21.super_class = (Class)SL_OOPAWebViewController;
  v2 = [(SL_OOPAWebViewController *)&v21 init];
  if (v2)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SLUseWKWebView", (CFStringRef)*MEMORY[0x1E4F1D3B8], &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v4 = AppBooleanValue == 0;
    }
    else {
      BOOL v4 = 0;
    }
    if (v4)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F43050]);
      uint64_t v11 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      uiWebView = v2->_uiWebView;
      v2->_uiWebView = (UIWebView *)v11;

      [(UIWebView *)v2->_uiWebView setDelegate:v2];
      [(UIWebView *)v2->_uiWebView setScalesPageToFit:1];
      [(UIWebView *)v2->_uiWebView setKeyboardDisplayRequiresUserAction:0];
      [(SL_OOPAWebViewController *)v2 setView:v2->_uiWebView];
    }
    else
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F466F8]);
      v6 = [MEMORY[0x1E4F46710] nonPersistentDataStore];
      [v5 setWebsiteDataStore:v6];

      id v7 = objc_alloc(MEMORY[0x1E4F466F0]);
      uint64_t v8 = objc_msgSend(v7, "initWithFrame:configuration:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      wkWebView = v2->_wkWebView;
      v2->_wkWebView = (WKWebView *)v8;

      [(WKWebView *)v2->_wkWebView setNavigationDelegate:v2];
      [(WKWebView *)v2->_wkWebView addObserver:v2 forKeyPath:@"loading" options:1 context:0];
      [(SL_OOPAWebViewController *)v2 setView:v2->_wkWebView];
    }
    v13 = [MEMORY[0x1E4F28D18] sharedHTTPCookieStorage];
    [v13 setCookieAcceptPolicy:0];
    if (v2->_uiWebView)
    {
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F46728]) initWithIdentifier:@"com.apple.AccountAuthenticationDialog.private"];
      [v14 setAutosaves:0];
      [v14 setPrivateBrowsingEnabled:1];
      [v14 setJavaScriptEnabled:1];
      v15 = [(UIWebView *)v2->_uiWebView _browserView];
      v16 = [v15 webView];
      [v16 setPreferences:v14];
    }
    v17 = objc_alloc_init(SL_OOPASpinnerTitle);
    v18 = [(SL_OOPAWebViewController *)v2 navigationItem];
    [v18 setTitleView:v17];
  }
  return v2;
}

- (void)dealloc
{
  wkWebView = self->_wkWebView;
  if (wkWebView)
  {
    [(WKWebView *)wkWebView removeObserver:self forKeyPath:@"loading"];
    [(WKWebView *)self->_wkWebView setNavigationDelegate:0];
  }
  else
  {
    [(UIWebView *)self->_uiWebView setDelegate:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)SL_OOPAWebViewController;
  [(SL_OOPAWebViewController *)&v4 dealloc];
}

- (void)setNavBarTitle:(id)a3
{
  [(SL_OOPAWebViewController *)self setBackingTitle:a3];

  [(SL_OOPAWebViewController *)self _updateNavBarTitle];
}

- (void)_updateNavBarTitle
{
  id v5 = [(SL_OOPAWebViewController *)self backingTitle];
  v3 = [(SL_OOPAWebViewController *)self navigationItem];
  objc_super v4 = [v3 titleView];
  [v4 setTitle:v5];
}

- (void)setAuthURL:(id)a3
{
  objc_super v4 = (NSURL *)[a3 copy];
  authURL = self->_authURL;
  self->_authURL = v4;

  [(SL_OOPAWebViewController *)self _loadWebViewIfReady];
}

- (void)setAuthFlowDelegate:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_authFlowDelegate, a3);
  objc_initWeak(&location, self);
  authFlowDelegate = self->_authFlowDelegate;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __48__SL_OOPAWebViewController_setAuthFlowDelegate___block_invoke;
  id v10 = &unk_1E6467958;
  objc_copyWeak(&v11, &location);
  [(SL_OOPAuthFlowDelegate *)authFlowDelegate setAuthFlowCompletion:&v7];
  [(SL_OOPAWebViewController *)self _loadWebViewIfReady];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SL_OOPAWebViewController;
  [(SL_OOPAWebViewController *)&v13 viewWillAppear:a3];
  objc_super v4 = [(SL_OOPAWebViewController *)self navigationItem];
  [v4 setHidesBackButton:1];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonTapped_];
  v6 = [(SL_OOPAWebViewController *)self navigationItem];
  [v6 setLeftBarButtonItem:v5];

  uint64_t v7 = [(SL_OOPAWebViewController *)self authURL];
  [(SL_OOPAWebViewController *)self _updateNavigationPromptWithActiveURL:v7];

  uint64_t v8 = [(SL_OOPAWebViewController *)self navigationController];
  v9 = [v8 navigationBar];
  id v10 = [v9 standardAppearance];
  id v11 = [(SL_OOPAWebViewController *)self navigationController];
  v12 = [v11 navigationBar];
  [v12 setScrollEdgeAppearance:v10];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SL_OOPAWebViewController;
  [(SL_OOPAWebViewController *)&v4 viewDidAppear:a3];
  [(SL_OOPAWebViewController *)self _loadWebViewIfReady];
}

- (void)_loadWebViewIfReady
{
  if (!self->_didLoadWebView && (self->_authURL || self->_authFlowDelegate)) {
    [(SL_OOPAWebViewController *)self _loadWebView];
  }
}

- (void)_loadWebView
{
  self->_didLoadWebView = 1;
  authFlowDelegate = self->_authFlowDelegate;
  if (authFlowDelegate)
  {
    id v5 = [(SL_OOPAuthFlowDelegate *)authFlowDelegate authURLForUsername:self->_username];
    authURL = self->_authURL;
    self->_authURL = v5;

    id v11 = self->_authURL;
    _SLLog(v2, 7, @"_authURL from delegate %@");
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __40__SL_OOPAWebViewController__loadWebView__block_invoke;
  v18[3] = &unk_1E6467980;
  v18[4] = self;
  uint64_t v7 = (void (**)(void, void))MEMORY[0x1C876A6A0](v18, a2);
  uint64_t v8 = [(SL_OOPAuthFlowDelegate *)self->_authFlowDelegate initialRedirectURL];
  if (v8)
  {
    v9 = [SLExternalServiceGatekeeper alloc];
    id v10 = self->_authURL;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __40__SL_OOPAWebViewController__loadWebView__block_invoke_2;
    v15 = &unk_1E64679D0;
    v16 = self;
    v17 = v7;
  }
  else
  {
    ((void (**)(void, NSURL *))v7)[2](v7, self->_authURL);
  }
  [(SL_OOPAWebViewController *)self startAnimating];
}

- (void)_didFinishWithSuccess:(BOOL)a3 response:(id)a4 error:(id)a5
{
  if (!self->_didFinish)
  {
    BOOL v6 = a3;
    self->_didFinish = 1;
    id v8 = a5;
    id v9 = a4;
    id v10 = [(SL_OOPAWebViewController *)self delegate];
    [v10 webViewController:self didFinishWithSuccess:v6 response:v9 error:v8];
  }
}

- (BOOL)webView:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!self->_authFlowDelegate)
  {
    v15 = [v9 URL];
    uint64_t v12 = [v15 absoluteString];

    if ([v12 hasPrefix:@"account://"])
    {
      _SLLog(v5, 5, @"SL_OOPAWebViewController caught account:// redirect!");
      [(SL_OOPAWebViewController *)self _didFinishWithSuccess:1 response:0 error:0];
      BOOL v10 = 0;
      goto LABEL_7;
    }

    if (!self->_authFlowDelegate) {
      goto LABEL_9;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_9:
    BOOL v10 = 1;
    goto LABEL_10;
  }
  BOOL v10 = 1;
  if ([(SL_OOPAuthFlowDelegate *)self->_authFlowDelegate shouldHideWebViewForLoadWithRequest:v9])
  {
    id v11 = [(SL_OOPAWebViewController *)self view];
    uint64_t v12 = [v11 snapshotViewAfterScreenUpdates:0];

    uint64_t v13 = [(SL_OOPAWebViewController *)self view];
    [v13 bounds];
    objc_msgSend(v12, "setFrame:");

    [v12 setAutoresizingMask:18];
    v14 = [(SL_OOPAWebViewController *)self view];
    [v14 addSubview:v12];

    self->_hidingWebView = 1;
LABEL_7:
  }
LABEL_10:

  return v10;
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4
{
  _SLLog(v4, 5, @"SL_OOPAWebViewController failed to load page with error: %@");

  [(SL_OOPAWebViewController *)self stopAnimating];
}

- (void)webViewDidFinishLoad:(id)a3
{
  id v4 = a3;
  if (!self->_hidingWebView) {
    [(SL_OOPAWebViewController *)self stopAnimating];
  }
  uint64_t v5 = [v4 request];
  BOOL v6 = [v5 URL];
  [(SL_OOPAWebViewController *)self _updateNavigationPromptWithActiveURL:v6];

  if (self->_authFlowDelegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    authFlowDelegate = self->_authFlowDelegate;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__SL_OOPAWebViewController_webViewDidFinishLoad___block_invoke;
    v8[3] = &unk_1E64679F8;
    v8[4] = self;
    id v9 = v4;
    [(SL_OOPAuthFlowDelegate *)authFlowDelegate webViewDidFinishLoadWithPageTitleSupplier:v8];
  }
}

- (void)_evaluateDocumentTitleForUIWebView:(id)a3 retryCount:(unint64_t)a4 completion:(id)a5
{
  id v9 = a3;
  BOOL v10 = (void (**)(id, void *))a5;
  if (a4)
  {
    id v11 = [v9 stringByEvaluatingJavaScriptFromString:@"document.title"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 length])
    {
      _SLLog(v5, 3, @"Found title for webview");
      v10[2](v10, v11);
    }
    else
    {
      dispatch_time_t v12 = dispatch_time(0, 200000000);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __85__SL_OOPAWebViewController__evaluateDocumentTitleForUIWebView_retryCount_completion___block_invoke;
      v13[3] = &unk_1E6467A20;
      v13[4] = self;
      id v14 = v9;
      unint64_t v16 = a4;
      v15 = v10;
      dispatch_after(v12, MEMORY[0x1E4F14428], v13);
    }
  }
  else
  {
    _SLLog(v5, 3, @"No title for webview found");
    v10[2](v10, 0);
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  if (self->_authFlowDelegate)
  {
    if (objc_opt_respondsToSelector())
    {
      authFlowDelegate = self->_authFlowDelegate;
      id v11 = [v8 request];
      LODWORD(authFlowDelegate) = [(SL_OOPAuthFlowDelegate *)authFlowDelegate shouldHideWebViewForLoadWithRequest:v11];

      if (authFlowDelegate)
      {
        dispatch_time_t v12 = [(SL_OOPAWebViewController *)self view];
        uint64_t v13 = [v12 snapshotViewAfterScreenUpdates:0];

        id v14 = [(SL_OOPAWebViewController *)self view];
        [v14 bounds];
        objc_msgSend(v13, "setFrame:");

        [v13 setAutoresizingMask:18];
        v15 = [(SL_OOPAWebViewController *)self view];
        [v15 addSubview:v13];

        self->_hidingWebView = 1;
      }
    }
  }
  v9[2](v9, 1);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_hidingWebView)
  {
    [(SL_OOPAWebViewController *)self stopAnimating];
    id v8 = [v6 backForwardList];
    id v9 = [v8 currentItem];
    BOOL v10 = [v9 URL];
    [(SL_OOPAWebViewController *)self _updateNavigationPromptWithActiveURL:v10];
  }
  if (self->_authFlowDelegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    authFlowDelegate = self->_authFlowDelegate;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__SL_OOPAWebViewController_webView_didFinishNavigation___block_invoke;
    v12[3] = &unk_1E64679F8;
    v12[4] = self;
    id v13 = v6;
    [(SL_OOPAuthFlowDelegate *)authFlowDelegate webViewDidFinishLoadWithPageTitleSupplier:v12];
  }
}

- (void)_evaluateDocumentTitleForWebView:(id)a3 retryCount:(unint64_t)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(void, void))v10;
  if (a4)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __83__SL_OOPAWebViewController__evaluateDocumentTitleForWebView_retryCount_completion___block_invoke;
    v12[3] = &unk_1E6467A48;
    id v14 = v10;
    v12[4] = self;
    id v13 = v9;
    unint64_t v15 = a4;
    [v13 evaluateJavaScript:@"document.title" completionHandler:v12];
  }
  else
  {
    _SLLog(v5, 3, @"No title for webview found");
    v11[2](v11, 0);
  }
}

- (void)webView:(id)a3 didReceiveServerRedirectForProvisionalNavigation:(id)a4
{
  uint64_t v6 = v5;
  id v26 = a3;
  id v8 = [v26 URL];
  id v9 = [v8 scheme];
  char v10 = [v9 isEqualToString:@"https"];
  if ((v10 & 1) == 0)
  {
    v25 = [v26 URL];
    id v4 = [v25 scheme];
    if (![v4 isEqualToString:@"http"])
    {
      v20 = v25;
      goto LABEL_14;
    }
  }
  id v11 = [v26 URL];
  dispatch_time_t v12 = [v11 host];
  v24 = self;
  if ([v12 isEqualToString:@"www.apple.com"])
  {
    int v13 = 1;
  }
  else
  {
    id v14 = [v26 URL];
    unint64_t v15 = [v14 host];
    int v13 = [v15 isEqualToString:@"apple.com"];

    uint64_t v6 = v5;
  }

  if ((v10 & 1) == 0)
  {

    id v16 = v26;
    if ((v13 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_10;
  }

  id v16 = v26;
  if (v13)
  {
LABEL_10:
    v17 = (void *)MEMORY[0x1E4F29088];
    v18 = [v16 URL];
    v19 = [v17 componentsWithURL:v18 resolvingAgainstBaseURL:0];
    id v8 = [v19 queryItems];

    id v9 = [MEMORY[0x1E4F290C8] queryItemWithName:@"error" value:@"access_denied"];
    v20 = [MEMORY[0x1E4F290C8] queryItemWithName:@"account" value:@"yahoo_japan"];
    if (![v8 containsObject:v9] || (objc_msgSend(v8, "containsObject:", v20) & 1) != 0) {
      goto LABEL_15;
    }
    uint64_t v21 = v6;
    v22 = [v26 URL];
    v23 = [v22 absoluteString];
    _SLLog(v21, 7, @"Dimissing auth UI because the server redirected us to %@");

    id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"SLErrorDomain", -1, 0, v23);
    [(SL_OOPAWebViewController *)v24 _didFinishWithSuccess:0 response:0 error:v4];
LABEL_14:

LABEL_15:
    id v16 = v26;
  }
LABEL_16:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ([v11 isEqualToString:@"loading"]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v14 = objc_msgSend(NSNumber, "numberWithBool:", -[WKWebView isLoading](self->_wkWebView, "isLoading"));
    _SLLog(v6, 5, @"SL_OOPAWebViewController observed WKWebView loading did change to %@");

    if ([(WKWebView *)self->_wkWebView isLoading]) {
      [(SL_OOPAWebViewController *)self startAnimating];
    }
    else {
      [(SL_OOPAWebViewController *)self stopAnimating];
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)SL_OOPAWebViewController;
    [(SL_OOPAWebViewController *)&v15 observeValueForKeyPath:v11 ofObject:v12 change:v13 context:a6];
  }
}

- (void)_cancelButtonTapped:(id)a3
{
  _SLLog(v3, 7, @"SL_OOPAWebViewController: user tapped Cancel.");

  [(SL_OOPAWebViewController *)self _didFinishWithSuccess:0 response:0 error:0];
}

- (void)_updateNavigationPromptWithActiveURL:(id)a3
{
  id v7 = a3;
  id v4 = [v7 host];
  [(SL_OOPAWebViewController *)self setHostString:v4];

  uint64_t v5 = [(SL_OOPAWebViewController *)self navigationItem];
  if (v7)
  {
    uint64_t v6 = [v7 host];
    [v5 setPrompt:v6];
  }
  else
  {
    [v5 setPrompt:&stru_1F1E28690];
  }
}

- (void)startAnimating
{
  uint64_t v3 = [(SL_OOPAWebViewController *)self navigationItem];
  id v4 = [v3 titleView];
  [v4 startAnimating];

  webPageLoading = self->_webPageLoading;

  [(UIActivityIndicatorView *)webPageLoading startAnimating];
}

- (void)stopAnimating
{
  uint64_t v3 = [(SL_OOPAWebViewController *)self navigationItem];
  id v4 = [v3 titleView];
  [v4 stopAnimating];

  webPageLoading = self->_webPageLoading;

  [(UIActivityIndicatorView *)webPageLoading stopAnimating];
}

- (SL_OOPAWebViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SL_OOPAWebViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SL_OOPAuthFlowDelegate)authFlowDelegate
{
  return self->_authFlowDelegate;
}

- (NSURL)authURL
{
  return self->_authURL;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)backingTitle
{
  return self->_backingTitle;
}

- (void)setBackingTitle:(id)a3
{
}

- (NSString)hostString
{
  return self->_hostString;
}

- (void)setHostString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostString, 0);
  objc_storeStrong((id *)&self->_backingTitle, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_authURL, 0);
  objc_storeStrong((id *)&self->_authFlowDelegate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webPageLoading, 0);
  objc_storeStrong((id *)&self->_spinnerTitleView, 0);
  objc_storeStrong((id *)&self->_uiWebView, 0);

  objc_storeStrong((id *)&self->_wkWebView, 0);
}

@end