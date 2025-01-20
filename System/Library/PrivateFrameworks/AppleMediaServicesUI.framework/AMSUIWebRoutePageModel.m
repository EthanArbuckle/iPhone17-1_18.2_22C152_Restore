@interface AMSUIWebRoutePageModel
- (ACAccount)account;
- (AMSMetricsEvent)impressionEvent;
- (AMSUIWebClientContext)context;
- (AMSUIWebNavigationBarModel)navigationBar;
- (AMSUIWebRoutePageModel)initWithJSObject:(id)a3 context:(id)a4;
- (AMSUIWebWrapperViewController)viewController;
- (BOOL)disableReappearPlaceholder;
- (BOOL)loadUsingWebKit;
- (CGSize)windowSize;
- (NSDictionary)clientOptions;
- (NSDictionary)headers;
- (NSString)backgroundColor;
- (NSString)description;
- (NSURL)URL;
- (id)_webPageViewController;
- (id)loadPage;
- (void)setViewController:(id)a3;
@end

@implementation AMSUIWebRoutePageModel

- (AMSUIWebRoutePageModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)AMSUIWebRoutePageModel;
  v8 = [(AMSUIWebRoutePageModel *)&v28 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_context, v7);
    v10 = [v6 objectForKeyedSubscript:@"account"];
    uint64_t v11 = [v7 iTunesAccountFromJSAccount:v10];
    account = v9->_account;
    v9->_account = (ACAccount *)v11;

    v13 = [v6 objectForKeyedSubscript:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }

    v15 = &stru_26CC491D8;
    if (v14) {
      v15 = v14;
    }
    v16 = v15;

    uint64_t v17 = [NSURL URLWithString:v16];

    URL = v9->_URL;
    v9->_URL = (NSURL *)v17;

    v19 = [v6 objectForKeyedSubscript:@"clientOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }

    clientOptions = v9->_clientOptions;
    v9->_clientOptions = v20;

    v22 = [v6 objectForKeyedSubscript:@"headers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v23 = v22;
    }
    else {
      v23 = 0;
    }

    headers = v9->_headers;
    v9->_headers = v23;

    v25 = [v6 objectForKeyedSubscript:@"loadUsingWebKit"];
    if (objc_opt_respondsToSelector())
    {
      v26 = [v6 objectForKeyedSubscript:@"loadUsingWebKit"];
      v9->_loadUsingWebKit = [v26 BOOLValue];
    }
    else
    {
      v9->_loadUsingWebKit = 0;
    }
  }
  return v9;
}

- (NSString)description
{
  v21[3] = *MEMORY[0x263EF8340];
  v20[0] = @"disableReappearPlaceholder";
  BOOL v3 = [(AMSUIWebRoutePageModel *)self disableReappearPlaceholder];
  v4 = @"false";
  if (v3) {
    v4 = @"true";
  }
  v21[0] = v4;
  v20[1] = @"URL";
  v5 = [(AMSUIWebRoutePageModel *)self URL];
  id v6 = [v5 absoluteString];
  v21[1] = v6;
  v20[2] = @"windowSize";
  [(AMSUIWebRoutePageModel *)self windowSize];
  id v7 = NSStringFromCGSize(v23);
  v21[2] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
  v9 = (void *)[v8 mutableCopy];

  v10 = [(AMSUIWebRoutePageModel *)self backgroundColor];

  if (v10)
  {
    uint64_t v11 = [(AMSUIWebRoutePageModel *)self backgroundColor];
    [v9 setObject:v11 forKey:@"backgroundColor"];
  }
  v12 = [(AMSUIWebRoutePageModel *)self clientOptions];

  if (v12)
  {
    v13 = [(AMSUIWebRoutePageModel *)self clientOptions];
    [v9 setObject:v13 forKey:@"clientOptions"];
  }
  v14 = [(AMSUIWebRoutePageModel *)self impressionEvent];

  if (v14)
  {
    v15 = [(AMSUIWebRoutePageModel *)self impressionEvent];
    [v9 setObject:v15 forKey:@"impressionEvent"];
  }
  v16 = [(AMSUIWebRoutePageModel *)self navigationBar];

  if (v16)
  {
    uint64_t v17 = [(AMSUIWebRoutePageModel *)self navigationBar];
    [v9 setObject:v17 forKey:@"navigationBar"];
  }
  v18 = [v9 description];

  return (NSString *)v18;
}

- (BOOL)disableReappearPlaceholder
{
  return 1;
}

- (id)loadPage
{
  return (id)[MEMORY[0x263F27B58] promiseWithSuccess];
}

- (id)_webPageViewController
{
  BOOL v3 = [(AMSUIWebRoutePageModel *)self viewController];

  if (v3)
  {
    v4 = [(AMSUIWebRoutePageModel *)self viewController];
  }
  else
  {
    id v5 = (id)AMSSetLogKey();
    id v6 = [AMSUIWebWrapperViewController alloc];
    id v7 = [(AMSUIWebRoutePageModel *)self context];
    v8 = [(AMSUIWebRoutePageModel *)self account];
    v4 = [(AMSUIWebWrapperViewController *)v6 initWithContext:v7 account:v8];

    v9 = [(AMSUIWebRoutePageModel *)self context];
    v10 = [v9 metricsOverlay];
    [(AMSUIWebViewController *)v4 setMetricsOverlay:v10];

    uint64_t v11 = [(AMSUIWebRoutePageModel *)self clientOptions];
    [(AMSUIWebViewController *)v4 setClientOptions:v11];

    [(AMSUIWebViewController *)v4 setLoadUsingWebKit:[(AMSUIWebRoutePageModel *)self loadUsingWebKit]];
    id v12 = objc_alloc(MEMORY[0x263F089E0]);
    v13 = [(AMSUIWebRoutePageModel *)self URL];
    v14 = (void *)[v12 initWithURL:v13];

    uint64_t v15 = [(AMSUIWebRoutePageModel *)self headers];
    v16 = (void *)v15;
    if (v15) {
      uint64_t v17 = v15;
    }
    else {
      uint64_t v17 = MEMORY[0x263EFFA78];
    }
    [v14 setAllHTTPHeaderFields:v17];

    id v18 = [(AMSUIWebViewController *)v4 loadRequest:v14];
    [(AMSUIWebRoutePageModel *)self setViewController:v4];
  }
  return v4;
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (AMSMetricsEvent)impressionEvent
{
  return self->_impressionEvent;
}

- (AMSUIWebNavigationBarModel)navigationBar
{
  return self->_navigationBar;
}

- (CGSize)windowSize
{
  double width = self->_windowSize.width;
  double height = self->_windowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSDictionary)clientOptions
{
  return self->_clientOptions;
}

- (AMSUIWebClientContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (AMSUIWebClientContext *)WeakRetained;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (BOOL)loadUsingWebKit
{
  return self->_loadUsingWebKit;
}

- (NSURL)URL
{
  return self->_URL;
}

- (AMSUIWebWrapperViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_clientOptions, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_impressionEvent, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end