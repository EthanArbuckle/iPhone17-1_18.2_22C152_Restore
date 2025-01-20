@interface AMSUIWebDynamicPageModel
- (ACAccount)account;
- (AMSMetricsEvent)impressionEvent;
- (AMSUIWebClientContext)context;
- (AMSUIWebDynamicPageModel)initWithJSObject:(id)a3 context:(id)a4;
- (AMSUIWebNavigationBarModel)navigationBar;
- (BOOL)disableReappearPlaceholder;
- (CGSize)windowSize;
- (NSDictionary)clientOptions;
- (NSDictionary)metricsOverlay;
- (NSString)backgroundColor;
- (NSString)description;
- (NSURL)URL;
- (id)createViewControllerForContainer:(id)a3;
- (id)loadPage;
- (void)setAccount:(id)a3;
- (void)setClientOptions:(id)a3;
- (void)setContext:(id)a3;
- (void)setMetricsOverlay:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation AMSUIWebDynamicPageModel

- (AMSUIWebDynamicPageModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)AMSUIWebDynamicPageModel;
  v8 = [(AMSUIWebDynamicPageModel *)&v37 init];
  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:@"account"];
    uint64_t v10 = [v7 iTunesAccountFromJSAccount:v9];
    account = v8->_account;
    v8->_account = (ACAccount *)v10;

    uint64_t v12 = +[AMSUIWebModel backgroundColorFromPageModel:v6];
    backgroundColor = v8->_backgroundColor;
    v8->_backgroundColor = (NSString *)v12;

    uint64_t v14 = +[AMSUIWebModel impressionEventFromPageModel:v6 context:v7];
    impressionEvent = v8->_impressionEvent;
    v8->_impressionEvent = (AMSMetricsEvent *)v14;

    uint64_t v16 = +[AMSUIWebModel navigationBarFromPageModel:v6 context:v7];
    navigationBar = v8->_navigationBar;
    v8->_navigationBar = (AMSUIWebNavigationBarModel *)v16;

    +[AMSUIWebModel windowSizeFromPageModel:v6];
    v8->_windowSize.width = v18;
    v8->_windowSize.height = v19;
    objc_storeStrong((id *)&v8->_context, a4);
    v20 = [v6 objectForKeyedSubscript:@"clientOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v21 = v20;
    }
    else {
      v21 = 0;
    }

    clientOptions = v8->_clientOptions;
    v8->_clientOptions = v21;

    v23 = [v6 objectForKeyedSubscript:@"metricsOverlay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v24 = v23;
    }
    else {
      id v24 = 0;
    }

    v25 = (void *)MEMORY[0x263EFFA78];
    if (v24) {
      v25 = v24;
    }
    id v26 = v25;

    v27 = [v7 metricsOverlay];

    if (v27)
    {
      v28 = (void *)[v26 mutableCopy];
      v29 = [v7 metricsOverlay];
      [v28 addEntriesFromDictionary:v29];

      id v26 = v28;
    }
    objc_storeStrong((id *)&v8->_metricsOverlay, v26);
    v30 = [v6 objectForKeyedSubscript:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v31 = v30;
    }
    else {
      v31 = 0;
    }

    v32 = &stru_26CC491D8;
    if (v31) {
      v32 = v31;
    }
    v33 = v32;

    uint64_t v34 = [NSURL URLWithString:v33];

    URL = v8->_URL;
    v8->_URL = (NSURL *)v34;
  }
  return v8;
}

- (id)createViewControllerForContainer:(id)a3
{
  v4 = [AMSUIWebDynamicViewController alloc];
  v5 = [(AMSUIWebDynamicPageModel *)self context];
  id v6 = [(AMSUIWebDynamicPageModel *)self URL];
  id v7 = [(AMSUIWebDynamicViewController *)v4 initWithContext:v5 URL:v6];

  v8 = [(AMSUIWebDynamicPageModel *)self account];
  [(AMSUIDynamicViewController *)v7 setAccount:v8];

  v9 = [(AMSUIWebDynamicPageModel *)self context];
  uint64_t v10 = [v9 clientInfo];
  [(AMSUIDynamicViewController *)v7 setClientInfo:v10];

  v11 = [(AMSUIWebDynamicPageModel *)self clientOptions];
  [(AMSUIDynamicViewController *)v7 setClientOptions:v11];

  uint64_t v12 = [(AMSUIWebDynamicPageModel *)self metricsOverlay];
  [(AMSUIDynamicViewController *)v7 setMetricsOverlay:v12];

  [(AMSUIDynamicViewController *)v7 setDelegate:v7];
  return v7;
}

- (BOOL)disableReappearPlaceholder
{
  return 1;
}

- (id)loadPage
{
  return (id)[MEMORY[0x263F27B58] promiseWithSuccess];
}

- (NSString)description
{
  v26[3] = *MEMORY[0x263EF8340];
  v25[0] = @"disableReappearPlaceholder";
  BOOL v3 = [(AMSUIWebDynamicPageModel *)self disableReappearPlaceholder];
  v4 = @"false";
  if (v3) {
    v4 = @"true";
  }
  v26[0] = v4;
  v25[1] = @"URL";
  v5 = [(AMSUIWebDynamicPageModel *)self URL];
  id v6 = [v5 absoluteString];
  v26[1] = v6;
  v25[2] = @"windowSize";
  [(AMSUIWebDynamicPageModel *)self windowSize];
  id v7 = NSStringFromCGSize(v28);
  v26[2] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
  v9 = (void *)[v8 mutableCopy];

  uint64_t v10 = [(AMSUIWebDynamicPageModel *)self account];

  if (v10)
  {
    v11 = [(AMSUIWebDynamicPageModel *)self account];
    uint64_t v12 = [v11 username];
    [v9 setObject:v12 forKey:@"account"];
  }
  v13 = [(AMSUIWebDynamicPageModel *)self backgroundColor];

  if (v13)
  {
    uint64_t v14 = [(AMSUIWebDynamicPageModel *)self backgroundColor];
    [v9 setObject:v14 forKey:@"backgroundColor"];
  }
  v15 = [(AMSUIWebDynamicPageModel *)self clientOptions];

  if (v15)
  {
    uint64_t v16 = [(AMSUIWebDynamicPageModel *)self clientOptions];
    [v9 setObject:v16 forKey:@"clientOptions"];
  }
  v17 = [(AMSUIWebDynamicPageModel *)self impressionEvent];

  if (v17)
  {
    CGFloat v18 = [(AMSUIWebDynamicPageModel *)self impressionEvent];
    [v9 setObject:v18 forKey:@"impressionEvent"];
  }
  CGFloat v19 = [(AMSUIWebDynamicPageModel *)self metricsOverlay];

  if (v19)
  {
    v20 = [(AMSUIWebDynamicPageModel *)self metricsOverlay];
    [v9 setObject:v20 forKey:@"metricsOverlay"];
  }
  v21 = [(AMSUIWebDynamicPageModel *)self navigationBar];

  if (v21)
  {
    v22 = [(AMSUIWebDynamicPageModel *)self navigationBar];
    [v9 setObject:v22 forKey:@"navigationBar"];
  }
  v23 = [v9 description];

  return (NSString *)v23;
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

- (void)setAccount:(id)a3
{
}

- (NSDictionary)clientOptions
{
  return self->_clientOptions;
}

- (void)setClientOptions:(id)a3
{
}

- (NSDictionary)metricsOverlay
{
  return self->_metricsOverlay;
}

- (void)setMetricsOverlay:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (AMSUIWebClientContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_metricsOverlay, 0);
  objc_storeStrong((id *)&self->_clientOptions, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_impressionEvent, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end