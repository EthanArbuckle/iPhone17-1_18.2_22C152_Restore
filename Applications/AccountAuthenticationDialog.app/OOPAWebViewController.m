@interface OOPAWebViewController
- (BOOL)connection:(id)a3 canAuthenticateAgainstProtectionSpace:(id)a4;
- (NSString)navBarTitle;
- (NSString)username;
- (NSURL)authURL;
- (OOPAWebViewController)init;
- (OOPAWebViewControllerDelegate)delegate;
- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5;
- (void)_backButtonTapped:(id)a3;
- (void)_cancelButtonTapped:(id)a3;
- (void)_forwardButtonTapped:(id)a3;
- (void)_loadWebView;
- (void)_loadWebViewIfReady;
- (void)_updateNavigationButtons;
- (void)_updateNavigationPromptWithActiveURL:(id)a3;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didReceiveAuthenticationChallenge:(id)a4;
- (void)setAuthURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNavBarTitle:(id)a3;
- (void)setUsername:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4;
@end

@implementation OOPAWebViewController

- (OOPAWebViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)OOPAWebViewController;
  v2 = [(OOPAWebViewController *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)WKWebViewConfiguration);
    v4 = +[WKWebsiteDataStore nonPersistentDataStore];
    [v3 setWebsiteDataStore:v4];

    v5 = [objc_alloc((Class)WKWebView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height configuration:v3];
    webView = v2->_webView;
    v2->_webView = v5;

    [(WKWebView *)v2->_webView setNavigationDelegate:v2];
    [(OOPAWebViewController *)v2 setView:v2->_webView];
  }
  return v2;
}

- (void)setNavBarTitle:(id)a3
{
  v4 = (NSString *)[a3 copy];
  navBarTitle = self->_navBarTitle;
  self->_navBarTitle = v4;

  if (self->_hasAlreadyAppeared)
  {
    v6 = [OOPASpinnerTitle alloc];
    v7 = [(OOPAWebViewController *)self navBarTitle];
    v9 = [(OOPASpinnerTitle *)v6 initWithTitle:v7];

    objc_super v8 = [(OOPAWebViewController *)self navigationItem];
    [v8 setTitleView:v9];
  }
}

- (void)setAuthURL:(id)a3
{
  v4 = (NSURL *)[a3 copy];
  authURL = self->_authURL;
  self->_authURL = v4;

  [(OOPAWebViewController *)self _loadWebViewIfReady];
}

- (void)viewWillAppear:(BOOL)a3
{
  self->_hasAlreadyAppeared = 1;
  v20.receiver = self;
  v20.super_class = (Class)OOPAWebViewController;
  [(OOPAWebViewController *)&v20 viewWillAppear:a3];
  v4 = [(OOPAWebViewController *)self navigationItem];
  [v4 setHidesBackButton:1];

  v5 = [(OOPAWebViewController *)self navBarTitle];

  if (v5)
  {
    v6 = [OOPASpinnerTitle alloc];
    v7 = [(OOPAWebViewController *)self navBarTitle];
    objc_super v8 = [(OOPASpinnerTitle *)v6 initWithTitle:v7];

    v9 = [(OOPAWebViewController *)self navigationItem];
    [v9 setTitleView:v8];
  }
  id v10 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelButtonTapped:"];
  v11 = [(OOPAWebViewController *)self navigationItem];
  [v11 setRightBarButtonItem:v10];

  v12 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:101 target:self action:"_backButtonTapped:"];
  backButton = self->_backButton;
  self->_backButton = v12;

  v14 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:102 target:self action:"_forwardButtonTapped:"];
  forwardButton = self->_forwardButton;
  self->_forwardButton = v14;

  v16 = [(OOPAWebViewController *)self navigationItem];
  v17 = self->_forwardButton;
  v21[0] = self->_backButton;
  v21[1] = v17;
  v18 = +[NSArray arrayWithObjects:v21 count:2];
  [v16 setLeftBarButtonItems:v18];

  [(OOPAWebViewController *)self _updateNavigationButtons];
  v19 = [(OOPAWebViewController *)self authURL];
  [(OOPAWebViewController *)self _updateNavigationPromptWithActiveURL:v19];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OOPAWebViewController;
  [(OOPAWebViewController *)&v4 viewDidAppear:a3];
  [(OOPAWebViewController *)self _loadWebViewIfReady];
}

- (void)_loadWebViewIfReady
{
  if (self->_hasAlreadyAppeared && !self->_urlRequest)
  {
    if (self->_authURL) {
      [(OOPAWebViewController *)self _loadWebView];
    }
  }
}

- (void)_loadWebView
{
  id v3 = [(NSURL *)self->_authURL resourceSpecifier];
  objc_super v4 = [v3 substringFromIndex:2];
  v5 = [@"https://gil.apple.com/" stringByAppendingString:v4];
  v6 = +[NSURL URLWithString:v5];

  v7 = _ACLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100003EC8((uint64_t)v6, v7);
  }

  objc_super v8 = +[NSMutableURLRequest requestWithURL:v6 cachePolicy:1 timeoutInterval:30.0];
  urlRequest = self->_urlRequest;
  self->_urlRequest = v8;

  id v10 = +[NSURLConnection connectionWithRequest:self->_urlRequest delegate:self];
  v11 = [(OOPAWebViewController *)self navigationItem];
  v12 = [v11 titleView];
  [v12 startAnimating];
}

- (BOOL)connection:(id)a3 canAuthenticateAgainstProtectionSpace:(id)a4
{
  return 1;
}

- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = _ACLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100003F40(v8, v9);
  }

  id v10 = [v8 URL];
  v11 = [v10 host];
  unsigned int v12 = [v11 isEqualToString:@"gil.apple.com"];

  if (v12)
  {
    id v13 = v8;
  }
  else
  {
    id v14 = [v8 mutableCopy];
    [v7 cancel];
    id v15 = [(WKWebView *)self->_webView loadRequest:v14];

    id v13 = 0;
  }

  return v13;
}

- (void)connection:(id)a3 didReceiveAuthenticationChallenge:(id)a4
{
  id v4 = a4;
  v5 = _ACLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100004058();
  }

  v6 = [v4 protectionSpace];
  id v7 = (__SecTrust *)[v6 serverTrust];

  id v8 = [v4 protectionSpace];
  v9 = [v8 authenticationMethod];
  unsigned int v10 = [v9 isEqualToString:NSURLAuthenticationMethodServerTrust];

  if (v10)
  {
    if (SecTrustEvaluateWithError(v7, 0))
    {
      v11 = SecTrustCopyInfo();
      if (v11)
      {
        unsigned int v12 = v11;
        id v13 = [v11 objectForKeyedSubscript:kSecTrustInfoCompanyNameKey];
        id v14 = v13;
        if (v13 && [v13 isEqualToString:@"Apple Inc."])
        {
          id v15 = _ACLogSystem();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            sub_100004024();
          }

          v16 = [v4 sender];
          v17 = +[NSURLCredential credentialForTrust:v7];
          [v16 useCredential:v17 forAuthenticationChallenge:v4];

          goto LABEL_15;
        }
      }
    }
  }
  v18 = _ACLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_100003FF0();
  }

  v16 = [v4 sender];
  [v16 cancelAuthenticationChallenge:v4];
LABEL_15:
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  v6 = _ACLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10000408C((uint64_t)v5, v6);
  }

  id v7 = [(OOPAWebViewController *)self delegate];
  [v7 webViewController:self didFinishWithSuccess:0 response:0];
}

- (void)_cancelButtonTapped:(id)a3
{
  id v4 = _ACLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100004104();
  }

  id v5 = [(OOPAWebViewController *)self delegate];
  [v5 webViewController:self didFinishWithSuccess:0 response:0];
}

- (void)_backButtonTapped:(id)a3
{
  id v3 = [(WKWebView *)self->_webView goBack];
}

- (void)_forwardButtonTapped:(id)a3
{
  id v3 = [(WKWebView *)self->_webView goForward];
}

- (void)_updateNavigationButtons
{
  [(UIBarButtonItem *)self->_backButton setEnabled:[(WKWebView *)self->_webView canGoBack]];
  forwardButton = self->_forwardButton;
  BOOL v4 = [(WKWebView *)self->_webView canGoForward];

  [(UIBarButtonItem *)forwardButton setEnabled:v4];
}

- (void)_updateNavigationPromptWithActiveURL:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(OOPAWebViewController *)self navigationItem];
  if (v6)
  {
    id v5 = [v6 host];
    [v4 setPrompt:v5];
  }
  else
  {
    [v4 setPrompt:&stru_100008338];
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v7 = (void (**)(id, void))a5;
  id v8 = [a4 request];
  v9 = [v8 URL];
  unsigned int v10 = [v9 absoluteString];
  unsigned int v11 = [v10 hasPrefix:@"account://"];

  if (v11)
  {
    unsigned int v12 = _ACLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "\"OOPAWebViewController caught account:// redirect!\"", v14, 2u);
    }

    id v13 = [(OOPAWebViewController *)self delegate];
    [v13 webViewController:self didFinishWithSuccess:1 response:0];

    v7[2](v7, 0);
  }
  else
  {
    v7[2](v7, 1);
  }
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  id v5 = [(OOPAWebViewController *)self navigationItem];
  BOOL v4 = [v5 titleView];
  [v4 startAnimating];
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v8 = a3;
  if (!self->_hidingWebView)
  {
    id v5 = [(OOPAWebViewController *)self navigationItem];
    id v6 = [v5 titleView];
    [v6 stopAnimating];
  }
  [(OOPAWebViewController *)self _updateNavigationButtons];
  id v7 = [v8 URL];
  [(OOPAWebViewController *)self _updateNavigationPromptWithActiveURL:v7];
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v6 = a5;
  id v7 = _ACLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "\"OOPAWebViewController failed to load page with error: %@\"", (uint8_t *)&v10, 0xCu);
  }

  id v8 = [(OOPAWebViewController *)self navigationItem];
  v9 = [v8 titleView];
  [v9 stopAnimating];

  [(OOPAWebViewController *)self _updateNavigationButtons];
}

- (OOPAWebViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (OOPAWebViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)authURL
{
  return self->_authURL;
}

- (NSString)navBarTitle
{
  return self->_navBarTitle;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_navBarTitle, 0);
  objc_storeStrong((id *)&self->_authURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong((id *)&self->_forwardButton, 0);
  objc_storeStrong((id *)&self->_backButton, 0);

  objc_storeStrong((id *)&self->_webView, 0);
}

@end