@interface AMSUIWebLoadingPageModel
- (AMSMetricsEvent)impressionEvent;
- (AMSUIWebClientContext)context;
- (AMSUIWebLoadingPageModel)initWithContext:(id)a3;
- (AMSUIWebLoadingPageModel)initWithJSObject:(id)a3 context:(id)a4;
- (AMSUIWebNavigationBarModel)navigationBar;
- (BOOL)animateFadeIn;
- (BOOL)disableDelay;
- (BOOL)disableReappearPlaceholder;
- (CGSize)windowSize;
- (NSString)backgroundColor;
- (NSString)description;
- (NSString)message;
- (id)createViewControllerForContainer:(id)a3;
- (id)loadPage;
- (void)setAnimateFadeIn:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setDisableDelay:(BOOL)a3;
- (void)setMessage:(id)a3;
@end

@implementation AMSUIWebLoadingPageModel

- (AMSUIWebLoadingPageModel)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIWebLoadingPageModel;
  v6 = [(AMSUIWebLoadingPageModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (AMSUIWebLoadingPageModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_super v9 = [(AMSUIWebLoadingPageModel *)self init];
    if (v9)
    {
      v10 = [v6 objectForKeyedSubscript:@"animateFadeIn"];
      if (objc_opt_respondsToSelector())
      {
        v11 = [v6 objectForKeyedSubscript:@"animateFadeIn"];
        v9->_animateFadeIn = [v11 BOOLValue];
      }
      else
      {
        v9->_animateFadeIn = 1;
      }

      uint64_t v12 = +[AMSUIWebModel backgroundColorFromPageModel:v6];
      backgroundColor = v9->_backgroundColor;
      v9->_backgroundColor = (NSString *)v12;

      objc_storeStrong((id *)&v9->_context, a4);
      v14 = [v6 objectForKeyedSubscript:@"disableDelay"];
      if (objc_opt_respondsToSelector())
      {
        v15 = [v6 objectForKeyedSubscript:@"disableDelay"];
        v9->_disableDelay = [v15 BOOLValue];
      }
      else
      {
        v9->_disableDelay = 0;
      }

      uint64_t v16 = +[AMSUIWebModel impressionEventFromPageModel:v6 context:v7];
      impressionEvent = v9->_impressionEvent;
      v9->_impressionEvent = (AMSMetricsEvent *)v16;

      v18 = [v6 objectForKeyedSubscript:@"message"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v19 = v18;
      }
      else {
        v19 = 0;
      }

      message = v9->_message;
      v9->_message = v19;

      uint64_t v21 = +[AMSUIWebModel navigationBarFromPageModel:v6 context:v7];
      navigationBar = v9->_navigationBar;
      v9->_navigationBar = (AMSUIWebNavigationBarModel *)v21;

      +[AMSUIWebModel windowSizeFromPageModel:v6];
      v9->_windowSize.width = v23;
      v9->_windowSize.height = v24;
    }
    self = v9;
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
  v20[4] = *MEMORY[0x263EF8340];
  v19[0] = @"disableReappearPlaceholder";
  if ([(AMSUIWebLoadingPageModel *)self disableReappearPlaceholder]) {
    v3 = @"true";
  }
  else {
    v3 = @"false";
  }
  v20[0] = v3;
  v19[1] = @"animateFadeIn";
  if ([(AMSUIWebLoadingPageModel *)self animateFadeIn]) {
    v4 = @"true";
  }
  else {
    v4 = @"false";
  }
  v20[1] = v4;
  v19[2] = @"disableDelay";
  if ([(AMSUIWebLoadingPageModel *)self disableDelay]) {
    id v5 = @"true";
  }
  else {
    id v5 = @"false";
  }
  v20[2] = v5;
  v19[3] = @"windowSize";
  [(AMSUIWebLoadingPageModel *)self windowSize];
  id v6 = NSStringFromCGSize(v22);
  v20[3] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
  v8 = (void *)[v7 mutableCopy];

  objc_super v9 = [(AMSUIWebLoadingPageModel *)self backgroundColor];

  if (v9)
  {
    v10 = [(AMSUIWebLoadingPageModel *)self backgroundColor];
    [v8 setObject:v10 forKey:@"backgroundColor"];
  }
  v11 = [(AMSUIWebLoadingPageModel *)self impressionEvent];

  if (v11)
  {
    uint64_t v12 = [(AMSUIWebLoadingPageModel *)self impressionEvent];
    [v8 setObject:v12 forKey:@"impressionEvent"];
  }
  v13 = [(AMSUIWebLoadingPageModel *)self message];

  if (v13)
  {
    v14 = [(AMSUIWebLoadingPageModel *)self message];
    [v8 setObject:v14 forKey:@"message"];
  }
  v15 = [(AMSUIWebLoadingPageModel *)self navigationBar];

  if (v15)
  {
    uint64_t v16 = [(AMSUIWebLoadingPageModel *)self navigationBar];
    [v8 setObject:v16 forKey:@"navigationBar"];
  }
  v17 = [v8 description];

  return (NSString *)v17;
}

- (id)createViewControllerForContainer:(id)a3
{
  v4 = [AMSUIWebPlaceholderViewController alloc];
  id v5 = [(AMSUIWebLoadingPageModel *)self context];
  id v6 = [(AMSUIWebPlaceholderViewController *)v4 initWithModel:self context:v5 appearance:0];

  [(AMSUIWebPlaceholderViewController *)v6 setAnimateFadeIn:[(AMSUIWebLoadingPageModel *)self animateFadeIn]];
  return v6;
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

- (BOOL)animateFadeIn
{
  return self->_animateFadeIn;
}

- (void)setAnimateFadeIn:(BOOL)a3
{
  self->_animateFadeIn = a3;
}

- (BOOL)disableDelay
{
  return self->_disableDelay;
}

- (void)setDisableDelay:(BOOL)a3
{
  self->_disableDelay = a3;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
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
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_impressionEvent, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end