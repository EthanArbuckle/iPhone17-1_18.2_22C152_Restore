@interface AMSUIWebSafariPageModel
- (AMSMetricsEvent)impressionEvent;
- (AMSUIWebClientContext)context;
- (AMSUIWebLoadingPageModel)loadingModel;
- (AMSUIWebNavigationBarModel)navigationBar;
- (AMSUIWebSafariPageModel)initWithJSObject:(id)a3 context:(id)a4;
- (BOOL)disableReappearPlaceholder;
- (BOOL)hideToolBar;
- (BOOL)showShareButton;
- (CGSize)windowSize;
- (NSDictionary)data;
- (NSString)backgroundColor;
- (NSString)callbackScheme;
- (NSString)description;
- (NSURL)URL;
- (id)createViewControllerForContainer:(id)a3;
- (id)loadPage;
- (void)setCallbackScheme:(id)a3;
- (void)setData:(id)a3;
- (void)setHideToolBar:(BOOL)a3;
- (void)setLoadingModel:(id)a3;
- (void)setShowShareButton:(BOOL)a3;
- (void)setURL:(id)a3;
@end

@implementation AMSUIWebSafariPageModel

- (AMSUIWebSafariPageModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v38.receiver = self;
    v38.super_class = (Class)AMSUIWebSafariPageModel;
    v9 = [(AMSUIWebSafariPageModel *)&v38 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_context, a4);
      uint64_t v11 = +[AMSUIWebModel backgroundColorFromPageModel:v6];
      backgroundColor = v10->_backgroundColor;
      v10->_backgroundColor = (NSString *)v11;

      uint64_t v13 = +[AMSUIWebModel impressionEventFromPageModel:v6 context:v7];
      impressionEvent = v10->_impressionEvent;
      v10->_impressionEvent = (AMSMetricsEvent *)v13;

      uint64_t v15 = +[AMSUIWebModel navigationBarFromPageModel:v6 context:v7];
      navigationBar = v10->_navigationBar;
      v10->_navigationBar = (AMSUIWebNavigationBarModel *)v15;

      +[AMSUIWebModel windowSizeFromPageModel:v6];
      v10->_windowSize.width = v17;
      v10->_windowSize.height = v18;
      v19 = [v6 objectForKeyedSubscript:@"callbackScheme"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v20 = v19;
      }
      else {
        v20 = 0;
      }

      callbackScheme = v10->_callbackScheme;
      v10->_callbackScheme = v20;

      v22 = [v6 objectForKeyedSubscript:@"data"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v23 = v22;
      }
      else {
        v23 = 0;
      }

      data = v10->_data;
      v10->_data = v23;

      v25 = [v6 objectForKeyedSubscript:@"hideToolbar"];
      if (objc_opt_respondsToSelector())
      {
        v26 = [v6 objectForKeyedSubscript:@"hideToolbar"];
        v10->_hideToolBar = [v26 BOOLValue];
      }
      else
      {
        v10->_hideToolBar = 0;
      }

      v27 = [v6 objectForKeyedSubscript:@"loadingPage"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v28 = v27;
      }
      else {
        id v28 = 0;
      }

      v29 = [[AMSUIWebLoadingPageModel alloc] initWithJSObject:v28 context:v7];
      loadingModel = v10->_loadingModel;
      v10->_loadingModel = v29;

      v31 = [v6 objectForKeyedSubscript:@"hideShareButton"];
      if (objc_opt_respondsToSelector())
      {
        v32 = [v6 objectForKeyedSubscript:@"hideShareButton"];
        v10->_showShareButton = [v32 BOOLValue] ^ 1;
      }
      else
      {
        v10->_showShareButton = 1;
      }

      v33 = [v6 objectForKeyedSubscript:@"url"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v34 = v33;
      }
      else {
        id v34 = 0;
      }

      if (v34)
      {
        uint64_t v35 = [NSURL URLWithString:v34];
        URL = v10->_URL;
        v10->_URL = (NSURL *)v35;
      }
    }
    self = v10;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  v27[4] = *MEMORY[0x263EF8340];
  v26[0] = @"disableReappearPlaceholder";
  if ([(AMSUIWebSafariPageModel *)self disableReappearPlaceholder]) {
    v3 = @"true";
  }
  else {
    v3 = @"false";
  }
  v27[0] = v3;
  v26[1] = @"hideToolBar";
  if ([(AMSUIWebSafariPageModel *)self hideToolBar]) {
    v4 = @"true";
  }
  else {
    v4 = @"false";
  }
  v27[1] = v4;
  v26[2] = @"showShareButton";
  if ([(AMSUIWebSafariPageModel *)self showShareButton]) {
    v5 = @"true";
  }
  else {
    v5 = @"false";
  }
  v27[2] = v5;
  v26[3] = @"windowSize";
  [(AMSUIWebSafariPageModel *)self windowSize];
  id v6 = NSStringFromCGSize(v29);
  v27[3] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
  v8 = (void *)[v7 mutableCopy];

  v9 = [(AMSUIWebSafariPageModel *)self backgroundColor];

  if (v9)
  {
    v10 = [(AMSUIWebSafariPageModel *)self backgroundColor];
    [v8 setObject:v10 forKey:@"backgroundColor"];
  }
  uint64_t v11 = [(AMSUIWebSafariPageModel *)self callbackScheme];

  if (v11)
  {
    v12 = [(AMSUIWebSafariPageModel *)self callbackScheme];
    [v8 setObject:v12 forKey:@"callbackScheme"];
  }
  uint64_t v13 = [(AMSUIWebSafariPageModel *)self data];

  if (v13)
  {
    v14 = [(AMSUIWebSafariPageModel *)self data];
    [v8 setObject:v14 forKey:@"data"];
  }
  uint64_t v15 = [(AMSUIWebSafariPageModel *)self impressionEvent];

  if (v15)
  {
    v16 = [(AMSUIWebSafariPageModel *)self impressionEvent];
    [v8 setObject:v16 forKey:@"impressionEvent"];
  }
  CGFloat v17 = [(AMSUIWebSafariPageModel *)self loadingModel];

  if (v17)
  {
    CGFloat v18 = [(AMSUIWebSafariPageModel *)self loadingModel];
    [v8 setObject:v18 forKey:@"loadingModel"];
  }
  v19 = [(AMSUIWebSafariPageModel *)self navigationBar];

  if (v19)
  {
    v20 = [(AMSUIWebSafariPageModel *)self navigationBar];
    [v8 setObject:v20 forKey:@"navigationBar"];
  }
  v21 = [(AMSUIWebSafariPageModel *)self URL];

  if (v21)
  {
    v22 = [(AMSUIWebSafariPageModel *)self URL];
    v23 = [v22 absoluteString];
    [v8 setObject:v23 forKey:@"URL"];
  }
  v24 = [v8 description];

  return (NSString *)v24;
}

- (id)createViewControllerForContainer:(id)a3
{
  v4 = [a3 containedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v6 = [v5 originalURL];
  if (!v6) {
    goto LABEL_8;
  }
  id v7 = (void *)v6;
  v8 = [(AMSUIWebSafariPageModel *)self URL];
  v9 = [v8 absoluteString];
  v10 = [v5 originalURL];
  uint64_t v11 = [v10 absoluteString];
  int v12 = [v9 isEqualToString:v11];

  if (v12)
  {
    uint64_t v13 = (AMSUIWebSafariViewController *)v5;
  }
  else
  {
LABEL_8:
    v14 = [AMSUIWebSafariViewController alloc];
    uint64_t v15 = [(AMSUIWebSafariPageModel *)self context];
    uint64_t v13 = [(AMSUIWebSafariViewController *)v14 initWithContext:v15];
  }
  return v13;
}

- (BOOL)disableReappearPlaceholder
{
  return 0;
}

- (id)loadPage
{
  return (id)[MEMORY[0x263F27B58] promiseWithSuccess];
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

- (NSString)callbackScheme
{
  return self->_callbackScheme;
}

- (void)setCallbackScheme:(id)a3
{
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (BOOL)hideToolBar
{
  return self->_hideToolBar;
}

- (void)setHideToolBar:(BOOL)a3
{
  self->_hideToolBar = a3;
}

- (AMSUIWebLoadingPageModel)loadingModel
{
  return self->_loadingModel;
}

- (void)setLoadingModel:(id)a3
{
}

- (BOOL)showShareButton
{
  return self->_showShareButton;
}

- (void)setShowShareButton:(BOOL)a3
{
  self->_showShareButton = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_loadingModel, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_callbackScheme, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_impressionEvent, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end