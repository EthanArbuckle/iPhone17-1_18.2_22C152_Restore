@interface AMSUIWebCameraReaderPageModel
- (AMSMetricsEvent)impressionEvent;
- (AMSUIWebActionRunnable)action;
- (AMSUIWebActionRunnable)bottomLinkAction;
- (AMSUIWebCameraReaderPageModel)initWithJSObject:(id)a3 context:(id)a4;
- (AMSUIWebClientContext)context;
- (AMSUIWebNavigationBarModel)navigationBar;
- (BOOL)allowsCameraToggle;
- (BOOL)allowsTextEntry;
- (BOOL)disableReappearPlaceholder;
- (BOOL)isFullScreen;
- (BOOL)prefersSessionTeardown;
- (CGSize)windowSize;
- (NSString)backgroundColor;
- (NSString)bottomLinkLabel;
- (NSString)description;
- (NSString)primaryLabel;
- (NSString)secondaryLabel;
- (NSString)textFieldPlaceholder;
- (UIViewController)presentedViewController;
- (id)createViewControllerForContainer:(id)a3;
- (id)loadPage;
- (int64_t)pageType;
- (void)setAction:(id)a3;
- (void)setAllowsCameraToggle:(BOOL)a3;
- (void)setAllowsTextEntry:(BOOL)a3;
- (void)setBottomLinkAction:(id)a3;
- (void)setBottomLinkLabel:(id)a3;
- (void)setContext:(id)a3;
- (void)setFullScreen:(BOOL)a3;
- (void)setPageType:(int64_t)a3;
- (void)setPrefersSessionTeardown:(BOOL)a3;
- (void)setPresentedViewController:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setTextFieldPlaceholder:(id)a3;
@end

@implementation AMSUIWebCameraReaderPageModel

- (AMSUIWebCameraReaderPageModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v45.receiver = self;
  v45.super_class = (Class)AMSUIWebCameraReaderPageModel;
  v8 = [(AMSUIWebCameraReaderPageModel *)&v45 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_context, a4);
    uint64_t v10 = +[AMSUIWebModel backgroundColorFromPageModel:v6];
    backgroundColor = v9->_backgroundColor;
    v9->_backgroundColor = (NSString *)v10;

    uint64_t v12 = +[AMSUIWebModel impressionEventFromPageModel:v6 context:v7];
    impressionEvent = v9->_impressionEvent;
    v9->_impressionEvent = (AMSMetricsEvent *)v12;

    uint64_t v14 = +[AMSUIWebModel navigationBarFromPageModel:v6 context:v7];
    navigationBar = v9->_navigationBar;
    v9->_navigationBar = (AMSUIWebNavigationBarModel *)v14;

    +[AMSUIWebModel windowSizeFromPageModel:v6];
    v9->_windowSize.width = v16;
    v9->_windowSize.height = v17;
    v18 = [v6 objectForKeyedSubscript:@"pageType"];
    if (objc_opt_respondsToSelector()) {
      uint64_t v19 = [v18 integerValue];
    }
    else {
      uint64_t v19 = 0;
    }
    v9->_pageType = v19;
    v20 = [v6 objectForKeyedSubscript:@"bottomLinkLabel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v21 = v20;
    }
    else {
      v21 = 0;
    }

    bottomLinkLabel = v9->_bottomLinkLabel;
    v9->_bottomLinkLabel = v21;

    v23 = [v6 objectForKeyedSubscript:@"bottomLinkAction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v24 = v23;
    }
    else {
      id v24 = 0;
    }

    uint64_t v25 = +[AMSUIWebActionMapper actionFromJSObject:v24 context:v7];
    bottomLinkAction = v9->_bottomLinkAction;
    v9->_bottomLinkAction = (AMSUIWebActionRunnable *)v25;

    v27 = [v6 objectForKeyedSubscript:@"primaryLabel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v28 = v27;
    }
    else {
      v28 = 0;
    }

    primaryLabel = v9->_primaryLabel;
    v9->_primaryLabel = v28;

    v30 = [v6 objectForKeyedSubscript:@"secondaryLabel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v31 = v30;
    }
    else {
      v31 = 0;
    }

    secondaryLabel = v9->_secondaryLabel;
    v9->_secondaryLabel = v31;

    v33 = [v6 objectForKeyedSubscript:@"fullScreen"];
    if (objc_opt_respondsToSelector())
    {
      v34 = [v6 objectForKeyedSubscript:@"fullScreen"];
      v9->_fullScreen = [v34 BOOLValue];
    }
    else
    {
      v9->_fullScreen = 0;
    }

    v35 = [v6 objectForKeyedSubscript:@"allowsCameraToggle"];
    if (objc_opt_respondsToSelector())
    {
      v36 = [v6 objectForKeyedSubscript:@"allowsCameraToggle"];
      v9->_allowsCameraToggle = [v36 BOOLValue];
    }
    else
    {
      v9->_allowsCameraToggle = 0;
    }

    v37 = [v6 objectForKeyedSubscript:@"allowsTextEntry"];
    if (objc_opt_respondsToSelector())
    {
      v38 = [v6 objectForKeyedSubscript:@"allowsTextEntry"];
      v9->_allowsTextEntry = [v38 BOOLValue];
    }
    else
    {
      v9->_allowsTextEntry = 0;
    }

    v39 = [v6 objectForKeyedSubscript:@"prefersSessionTeardown"];
    if (objc_opt_respondsToSelector())
    {
      v40 = [v6 objectForKeyedSubscript:@"prefersSessionTeardown"];
      v9->_prefersSessionTeardown = [v40 BOOLValue];
    }
    else
    {
      v9->_prefersSessionTeardown = 0;
    }

    v41 = [v6 objectForKeyedSubscript:@"textFieldPlaceholder"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v42 = v41;
    }
    else {
      v42 = 0;
    }

    textFieldPlaceholder = v9->_textFieldPlaceholder;
    v9->_textFieldPlaceholder = v42;
  }
  return v9;
}

- (id)createViewControllerForContainer:(id)a3
{
  v4 = [AMSUIWebCameraReaderViewController alloc];
  v5 = [(AMSUIWebCameraReaderPageModel *)self context];
  id v6 = [(AMSUIWebCameraReaderViewController *)v4 initWithContext:v5];

  return v6;
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
  v31[7] = *MEMORY[0x263EF8340];
  v30[0] = @"allowsCameraToggle";
  if ([(AMSUIWebCameraReaderPageModel *)self allowsCameraToggle]) {
    v3 = @"true";
  }
  else {
    v3 = @"false";
  }
  v31[0] = v3;
  v30[1] = @"allowsTextEntry";
  if ([(AMSUIWebCameraReaderPageModel *)self allowsTextEntry]) {
    v4 = @"true";
  }
  else {
    v4 = @"false";
  }
  v31[1] = v4;
  v30[2] = @"disableReappearPlaceholder";
  if ([(AMSUIWebCameraReaderPageModel *)self disableReappearPlaceholder]) {
    v5 = @"true";
  }
  else {
    v5 = @"false";
  }
  v31[2] = v5;
  v30[3] = @"fullScreen";
  if ([(AMSUIWebCameraReaderPageModel *)self isFullScreen]) {
    id v6 = @"true";
  }
  else {
    id v6 = @"false";
  }
  v31[3] = v6;
  v30[4] = @"prefersSessionTeardown";
  if ([(AMSUIWebCameraReaderPageModel *)self prefersSessionTeardown]) {
    id v7 = @"true";
  }
  else {
    id v7 = @"false";
  }
  v31[4] = v7;
  v30[5] = @"pageType";
  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[AMSUIWebCameraReaderPageModel pageType](self, "pageType"));
  v31[5] = v8;
  v30[6] = @"windowSize";
  [(AMSUIWebCameraReaderPageModel *)self windowSize];
  v9 = NSStringFromCGSize(v33);
  v31[6] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:7];
  v11 = (void *)[v10 mutableCopy];

  uint64_t v12 = [(AMSUIWebCameraReaderPageModel *)self bottomLinkLabel];

  if (v12)
  {
    v13 = [(AMSUIWebCameraReaderPageModel *)self bottomLinkLabel];
    [v11 setObject:v13 forKey:@"bottomLinkLabel"];
  }
  uint64_t v14 = [(AMSUIWebCameraReaderPageModel *)self bottomLinkAction];

  if (v14)
  {
    v15 = [(AMSUIWebCameraReaderPageModel *)self bottomLinkAction];
    [v11 setObject:v15 forKey:@"bottomLinkAction"];
  }
  CGFloat v16 = [(AMSUIWebCameraReaderPageModel *)self backgroundColor];

  if (v16)
  {
    CGFloat v17 = [(AMSUIWebCameraReaderPageModel *)self backgroundColor];
    [v11 setObject:v17 forKey:@"backgroundColor"];
  }
  v18 = [(AMSUIWebCameraReaderPageModel *)self impressionEvent];

  if (v18)
  {
    uint64_t v19 = [(AMSUIWebCameraReaderPageModel *)self impressionEvent];
    [v11 setObject:v19 forKey:@"impressionEvent"];
  }
  v20 = [(AMSUIWebCameraReaderPageModel *)self navigationBar];

  if (v20)
  {
    v21 = [(AMSUIWebCameraReaderPageModel *)self navigationBar];
    [v11 setObject:v21 forKey:@"navigationBar"];
  }
  v22 = [(AMSUIWebCameraReaderPageModel *)self primaryLabel];

  if (v22)
  {
    v23 = [(AMSUIWebCameraReaderPageModel *)self primaryLabel];
    [v11 setObject:v23 forKey:@"primaryLabel"];
  }
  id v24 = [(AMSUIWebCameraReaderPageModel *)self secondaryLabel];

  if (v24)
  {
    uint64_t v25 = [(AMSUIWebCameraReaderPageModel *)self secondaryLabel];
    [v11 setObject:v25 forKey:@"secondaryLabel"];
  }
  v26 = [(AMSUIWebCameraReaderPageModel *)self textFieldPlaceholder];

  if (v26)
  {
    v27 = [(AMSUIWebCameraReaderPageModel *)self textFieldPlaceholder];
    [v11 setObject:v27 forKey:@"textFieldPlaceholder"];
  }
  v28 = [v11 description];

  return (NSString *)v28;
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

- (BOOL)allowsCameraToggle
{
  return self->_allowsCameraToggle;
}

- (void)setAllowsCameraToggle:(BOOL)a3
{
  self->_allowsCameraToggle = a3;
}

- (BOOL)allowsTextEntry
{
  return self->_allowsTextEntry;
}

- (void)setAllowsTextEntry:(BOOL)a3
{
  self->_allowsTextEntry = a3;
}

- (NSString)bottomLinkLabel
{
  return self->_bottomLinkLabel;
}

- (void)setBottomLinkLabel:(id)a3
{
}

- (AMSUIWebActionRunnable)bottomLinkAction
{
  return self->_bottomLinkAction;
}

- (void)setBottomLinkAction:(id)a3
{
}

- (BOOL)isFullScreen
{
  return self->_fullScreen;
}

- (void)setFullScreen:(BOOL)a3
{
  self->_fullScreen = a3;
}

- (int64_t)pageType
{
  return self->_pageType;
}

- (void)setPageType:(int64_t)a3
{
  self->_pageType = a3;
}

- (BOOL)prefersSessionTeardown
{
  return self->_prefersSessionTeardown;
}

- (void)setPrefersSessionTeardown:(BOOL)a3
{
  self->_prefersSessionTeardown = a3;
}

- (NSString)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
}

- (NSString)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (NSString)textFieldPlaceholder
{
  return self->_textFieldPlaceholder;
}

- (void)setTextFieldPlaceholder:(id)a3
{
}

- (AMSUIWebActionRunnable)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (AMSUIWebClientContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (UIViewController)presentedViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentedViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentedViewController);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_textFieldPlaceholder, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_bottomLinkAction, 0);
  objc_storeStrong((id *)&self->_bottomLinkLabel, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_impressionEvent, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end