@interface AMSUIWebErrorPageModel
+ (id)_messageFromError:(id)a3;
- (AMSMetricsEvent)impressionEvent;
- (AMSUIWebActionRunnable)action;
- (AMSUIWebClientContext)context;
- (AMSUIWebErrorPageModel)initWithError:(id)a3 context:(id)a4 actionBlock:(id)a5;
- (AMSUIWebErrorPageModel)initWithJSObject:(id)a3 context:(id)a4;
- (AMSUIWebNavigationBarModel)navigationBar;
- (BOOL)disableReappearPlaceholder;
- (BOOL)errorMessageInternalOnly;
- (CGSize)windowSize;
- (NSBundle)bundle;
- (NSError)error;
- (NSString)actionButtonTitle;
- (NSString)backgroundColor;
- (NSString)description;
- (NSString)errorMessage;
- (NSString)errorTitle;
- (id)actionBlock;
- (id)createViewControllerForContainer:(id)a3;
- (id)loadPage;
- (void)setAction:(id)a3;
- (void)setActionBlock:(id)a3;
- (void)setActionButtonTitle:(id)a3;
- (void)setBundle:(id)a3;
- (void)setContext:(id)a3;
- (void)setErrorMessageInternalOnly:(BOOL)a3;
- (void)setErrorTitle:(id)a3;
@end

@implementation AMSUIWebErrorPageModel

- (AMSUIWebErrorPageModel)initWithError:(id)a3 context:(id)a4 actionBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 userInfo];
  v13 = [v12 objectForKeyedSubscript:@"errorPageModel"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }

  if (v14)
  {
    v15 = [(AMSUIWebErrorPageModel *)self initWithJSObject:v14 context:v10];
  }
  else
  {
    v36.receiver = self;
    v36.super_class = (Class)AMSUIWebErrorPageModel;
    v15 = [(AMSUIWebErrorPageModel *)&v36 init];
  }
  v16 = v15;
  if (v15)
  {
    v17 = _Block_copy(v11);
    id actionBlock = v16->_actionBlock;
    v16->_id actionBlock = v17;

    uint64_t v19 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
    bundle = v16->_bundle;
    v16->_bundle = (NSBundle *)v19;

    objc_storeStrong((id *)&v16->_error, a3);
    objc_storeStrong((id *)&v16->_context, a4);
    v21 = objc_alloc_init(AMSUIAirplaneModeInquiry);
    BOOL v22 = [(AMSUIAirplaneModeInquiry *)v21 isEnabled];
    v23 = [v9 userInfo];
    v24 = [v23 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v25 = v24;
    }
    else {
      id v25 = 0;
    }

    if (!v25) {
      goto LABEL_16;
    }
    v26 = [v25 domain];
    if (v26 != (void *)*MEMORY[0x263EFC6F0]) {
      BOOL v22 = 0;
    }

    if (v22)
    {
      v27 = [(AMSUIWebErrorPageModel *)v16 bundle];
      uint64_t v28 = [v27 localizedStringForKey:@"WIFI_AIRPLANE_MODE_ERROR" value:&stru_26CC491D8 table:0];
      errorTitle = v16->_errorTitle;
      v16->_errorTitle = (NSString *)v28;

      uint64_t v30 = [(id)objc_opt_class() _messageFromError:v9];
      errorMessage = v16->_errorMessage;
      v16->_errorMessage = (NSString *)v30;
    }
    else
    {
LABEL_16:
      if (!v14)
      {
        v32 = v16->_errorTitle;
        v16->_errorTitle = 0;

        uint64_t v33 = [(id)objc_opt_class() _messageFromError:v9];
        v34 = v16->_errorMessage;
        v16->_errorMessage = (NSString *)v33;

        v16->_errorMessageInternalOnly = 1;
      }
    }
  }
  return v16;
}

- (AMSUIWebErrorPageModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v34.receiver = self;
    v34.super_class = (Class)AMSUIWebErrorPageModel;
    id v9 = [(AMSUIWebErrorPageModel *)&v34 init];
    if (v9)
    {
      id v10 = [v6 objectForKeyedSubscript:@"action"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v11 = v10;
      }
      else {
        id v11 = 0;
      }

      uint64_t v12 = +[AMSUIWebActionMapper actionFromJSObject:v11 context:v7];
      action = v9->_action;
      v9->_action = (AMSUIWebActionRunnable *)v12;

      uint64_t v14 = +[AMSUIWebModel backgroundColorFromPageModel:v6];
      backgroundColor = v9->_backgroundColor;
      v9->_backgroundColor = (NSString *)v14;

      uint64_t v16 = +[AMSUIWebModel impressionEventFromPageModel:v6 context:v7];
      impressionEvent = v9->_impressionEvent;
      v9->_impressionEvent = (AMSMetricsEvent *)v16;

      uint64_t v18 = +[AMSUIWebModel navigationBarFromPageModel:v6 context:v7];
      navigationBar = v9->_navigationBar;
      v9->_navigationBar = (AMSUIWebNavigationBarModel *)v18;

      +[AMSUIWebModel windowSizeFromPageModel:v6];
      v9->_windowSize.width = v20;
      v9->_windowSize.height = v21;
      BOOL v22 = [v6 objectForKeyedSubscript:@"actionButtonTitle"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v23 = v22;
      }
      else {
        v23 = 0;
      }

      actionButtonTitle = v9->_actionButtonTitle;
      v9->_actionButtonTitle = v23;

      objc_storeStrong((id *)&v9->_context, a4);
      id v25 = [v6 objectForKeyedSubscript:@"errorMessage"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v26 = v25;
      }
      else {
        v26 = 0;
      }

      errorMessage = v9->_errorMessage;
      v9->_errorMessage = v26;

      uint64_t v28 = [v6 objectForKeyedSubscript:@"errorTitle"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v29 = v28;
      }
      else {
        v29 = 0;
      }

      errorTitle = v9->_errorTitle;
      v9->_errorTitle = v29;

      v31 = [v6 objectForKeyedSubscript:@"errorMessageInternalOnly"];
      if (objc_opt_respondsToSelector())
      {
        v32 = [v6 objectForKeyedSubscript:@"errorMessageInternalOnly"];
        v9->_errorMessageInternalOnly = [v32 BOOLValue];
      }
      else
      {
        v9->_errorMessageInternalOnly = 0;
      }
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

- (NSString)errorMessage
{
  v3 = self->_errorMessage;
  if ([(AMSUIWebErrorPageModel *)self errorMessageInternalOnly])
  {
    uint64_t v4 = [NSString stringWithFormat:@"INTERNAL ONLY: %@", v3];

    v3 = (NSString *)v4;
  }
  return v3;
}

- (NSString)description
{
  v25[3] = *MEMORY[0x263EF8340];
  v24[0] = @"disableReappearPlaceholder";
  if ([(AMSUIWebErrorPageModel *)self disableReappearPlaceholder]) {
    v3 = @"true";
  }
  else {
    v3 = @"false";
  }
  v25[0] = v3;
  v24[1] = @"errorMessageInternalOnly";
  if ([(AMSUIWebErrorPageModel *)self errorMessageInternalOnly]) {
    uint64_t v4 = @"true";
  }
  else {
    uint64_t v4 = @"false";
  }
  v25[1] = v4;
  v24[2] = @"windowSize";
  [(AMSUIWebErrorPageModel *)self windowSize];
  v5 = NSStringFromCGSize(v27);
  v25[2] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
  id v7 = (void *)[v6 mutableCopy];

  v8 = [(AMSUIWebErrorPageModel *)self action];

  if (v8)
  {
    id v9 = [(AMSUIWebErrorPageModel *)self action];
    [v7 setObject:v9 forKey:@"action"];
  }
  id v10 = [(AMSUIWebErrorPageModel *)self actionButtonTitle];

  if (v10)
  {
    id v11 = [(AMSUIWebErrorPageModel *)self actionButtonTitle];
    [v7 setObject:v11 forKey:@"actionButtonTitle"];
  }
  uint64_t v12 = [(AMSUIWebErrorPageModel *)self backgroundColor];

  if (v12)
  {
    v13 = [(AMSUIWebErrorPageModel *)self backgroundColor];
    [v7 setObject:v13 forKey:@"backgroundColor"];
  }
  uint64_t v14 = [(AMSUIWebErrorPageModel *)self errorMessage];

  if (v14)
  {
    v15 = [(AMSUIWebErrorPageModel *)self errorMessage];
    [v7 setObject:v15 forKey:@"errorMessage"];
  }
  uint64_t v16 = [(AMSUIWebErrorPageModel *)self errorTitle];

  if (v16)
  {
    v17 = [(AMSUIWebErrorPageModel *)self errorTitle];
    [v7 setObject:v17 forKey:@"errorTitle"];
  }
  uint64_t v18 = [(AMSUIWebErrorPageModel *)self impressionEvent];

  if (v18)
  {
    uint64_t v19 = [(AMSUIWebErrorPageModel *)self impressionEvent];
    [v7 setObject:v19 forKey:@"impressionEvent"];
  }
  CGFloat v20 = [(AMSUIWebErrorPageModel *)self navigationBar];

  if (v20)
  {
    CGFloat v21 = [(AMSUIWebErrorPageModel *)self navigationBar];
    [v7 setObject:v21 forKey:@"navigationBar"];
  }
  BOOL v22 = [v7 description];

  return (NSString *)v22;
}

- (id)createViewControllerForContainer:(id)a3
{
  uint64_t v4 = [AMSUIWebErrorViewController alloc];
  v5 = [(AMSUIWebErrorPageModel *)self context];
  id v6 = [(AMSUIWebErrorViewController *)v4 initWithContext:v5];

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

+ (id)_messageFromError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"[%ld]", objc_msgSend(v3, "code"));
  v5 = objc_msgSend(v3, "ams_title");
  if (v5) {
    goto LABEL_3;
  }
  id v6 = [v3 userInfo];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F08608]];
  v5 = objc_msgSend(v7, "ams_title");

  if (v5)
  {
LABEL_3:
    [v4 appendFormat:@" %@", v5];

    char v8 = 0;
  }
  else
  {
    char v8 = 1;
  }
  id v9 = objc_msgSend(v3, "ams_message");
  if (v9) {
    goto LABEL_6;
  }
  id v10 = [v3 userInfo];
  id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F08608]];
  id v9 = objc_msgSend(v11, "ams_message");

  if (v9)
  {
LABEL_6:
    if ((v8 & 1) == 0) {
      [v4 appendString:@":"];
    }
    [v4 appendFormat:@" %@", v9];
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

- (AMSUIWebActionRunnable)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (NSString)actionButtonTitle
{
  return self->_actionButtonTitle;
}

- (void)setActionButtonTitle:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)errorMessageInternalOnly
{
  return self->_errorMessageInternalOnly;
}

- (void)setErrorMessageInternalOnly:(BOOL)a3
{
  self->_errorMessageInternalOnly = a3;
}

- (NSString)errorTitle
{
  return self->_errorTitle;
}

- (void)setErrorTitle:(id)a3
{
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
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
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_errorTitle, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_actionButtonTitle, 0);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_impressionEvent, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end