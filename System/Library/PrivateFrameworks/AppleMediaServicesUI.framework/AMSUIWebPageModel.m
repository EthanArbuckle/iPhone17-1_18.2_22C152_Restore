@interface AMSUIWebPageModel
- (AMSMetricsEvent)impressionEvent;
- (AMSUIWebClientContext)context;
- (AMSUIWebNavigationBarModel)navigationBar;
- (AMSUIWebPageModel)initWithJSObject:(id)a3 context:(id)a4;
- (AMSUIWebToolbarModel)toolbar;
- (BOOL)disableReappearPlaceholder;
- (BOOL)ignoreBottomSafeArea;
- (BOOL)ignoreTopSafeArea;
- (CGSize)windowSize;
- (NSString)backgroundColor;
- (NSString)description;
- (id)createViewControllerForContainer:(id)a3;
- (id)loadPage;
- (void)setContext:(id)a3;
- (void)setIgnoreBottomSafeArea:(BOOL)a3;
- (void)setIgnoreTopSafeArea:(BOOL)a3;
- (void)setToolbar:(id)a3;
@end

@implementation AMSUIWebPageModel

- (AMSUIWebPageModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v28.receiver = self;
    v28.super_class = (Class)AMSUIWebPageModel;
    v9 = [(AMSUIWebPageModel *)&v28 init];
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
      v19 = [v6 objectForKeyedSubscript:@"ignoreBottomSafeArea"];
      if (objc_opt_respondsToSelector())
      {
        v20 = [v6 objectForKeyedSubscript:@"ignoreBottomSafeArea"];
        v10->_ignoreBottomSafeArea = [v20 BOOLValue];
      }
      else
      {
        v10->_ignoreBottomSafeArea = 0;
      }

      v21 = [v6 objectForKeyedSubscript:@"ignoreTopSafeArea"];
      if (objc_opt_respondsToSelector())
      {
        v22 = [v6 objectForKeyedSubscript:@"ignoreTopSafeArea"];
        v10->_ignoreTopSafeArea = [v22 BOOLValue];
      }
      else
      {
        v10->_ignoreTopSafeArea = 0;
      }

      v23 = [v6 objectForKeyedSubscript:@"toolbar"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v24 = v23;
      }
      else {
        id v24 = 0;
      }

      if (v24)
      {
        v25 = [[AMSUIWebToolbarModel alloc] initWithJSObject:v24 context:v7];
        toolbar = v10->_toolbar;
        v10->_toolbar = v25;
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

- (id)createViewControllerForContainer:(id)a3
{
  v3 = [(AMSUIWebPageModel *)self context];
  v4 = [v3 webPage];

  return v4;
}

- (BOOL)disableReappearPlaceholder
{
  return 0;
}

- (id)loadPage
{
  return (id)[MEMORY[0x263F27B58] promiseWithSuccess];
}

- (NSString)description
{
  v20[4] = *MEMORY[0x263EF8340];
  v19[0] = @"disableReappearPlaceholder";
  if ([(AMSUIWebPageModel *)self disableReappearPlaceholder]) {
    v3 = @"true";
  }
  else {
    v3 = @"false";
  }
  v20[0] = v3;
  v19[1] = @"ignoreBottomSafeArea";
  if ([(AMSUIWebPageModel *)self ignoreBottomSafeArea]) {
    v4 = @"true";
  }
  else {
    v4 = @"false";
  }
  v20[1] = v4;
  v19[2] = @"ignoreTopSafeArea";
  if ([(AMSUIWebPageModel *)self ignoreTopSafeArea]) {
    v5 = @"true";
  }
  else {
    v5 = @"false";
  }
  v20[2] = v5;
  v19[3] = @"windowSize";
  [(AMSUIWebPageModel *)self windowSize];
  id v6 = NSStringFromCGSize(v22);
  v20[3] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
  v8 = (void *)[v7 mutableCopy];

  v9 = [(AMSUIWebPageModel *)self backgroundColor];

  if (v9)
  {
    v10 = [(AMSUIWebPageModel *)self backgroundColor];
    [v8 setObject:v10 forKey:@"backgroundColor"];
  }
  uint64_t v11 = [(AMSUIWebPageModel *)self impressionEvent];

  if (v11)
  {
    v12 = [(AMSUIWebPageModel *)self impressionEvent];
    [v8 setObject:v12 forKey:@"impressionEvent"];
  }
  uint64_t v13 = [(AMSUIWebPageModel *)self navigationBar];

  if (v13)
  {
    v14 = [(AMSUIWebPageModel *)self navigationBar];
    [v8 setObject:v14 forKey:@"navigationBar"];
  }
  uint64_t v15 = [(AMSUIWebPageModel *)self toolbar];

  if (v15)
  {
    v16 = [(AMSUIWebPageModel *)self toolbar];
    [v8 setObject:v16 forKey:@"toolbar"];
  }
  CGFloat v17 = [v8 description];

  return (NSString *)v17;
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (AMSMetricsEvent)impressionEvent
{
  return self->_impressionEvent;
}

- (CGSize)windowSize
{
  double width = self->_windowSize.width;
  double height = self->_windowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (AMSUIWebNavigationBarModel)navigationBar
{
  return self->_navigationBar;
}

- (BOOL)ignoreBottomSafeArea
{
  return self->_ignoreBottomSafeArea;
}

- (void)setIgnoreBottomSafeArea:(BOOL)a3
{
  self->_ignoreBottomSafeArea = a3;
}

- (BOOL)ignoreTopSafeArea
{
  return self->_ignoreTopSafeArea;
}

- (void)setIgnoreTopSafeArea:(BOOL)a3
{
  self->_ignoreTopSafeArea = a3;
}

- (AMSUIWebToolbarModel)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
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
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_impressionEvent, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end