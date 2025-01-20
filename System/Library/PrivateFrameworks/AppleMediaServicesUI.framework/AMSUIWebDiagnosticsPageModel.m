@interface AMSUIWebDiagnosticsPageModel
- (AMSMetricsEvent)impressionEvent;
- (AMSUIWebClientContext)context;
- (AMSUIWebDiagnosticsPageModel)initWithJSObject:(id)a3 context:(id)a4;
- (AMSUIWebNavigationBarModel)navigationBar;
- (BOOL)disableReappearPlaceholder;
- (CGSize)windowSize;
- (NSArray)requiredSerialNumbers;
- (NSArray)selectableSerialNumbers;
- (NSString)backgroundColor;
- (NSString)sessionToken;
- (id)createViewControllerForContainer:(id)a3;
- (id)loadPage;
- (void)setContext:(id)a3;
- (void)setRequiredSerialNumbers:(id)a3;
- (void)setSelectableSerialNumbers:(id)a3;
- (void)setSessionToken:(id)a3;
@end

@implementation AMSUIWebDiagnosticsPageModel

- (AMSUIWebDiagnosticsPageModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)AMSUIWebDiagnosticsPageModel;
  v8 = [(AMSUIWebDiagnosticsPageModel *)&v20 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_context, a4);
    v10 = [v6 objectForKeyedSubscript:@"sessionToken"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }

    sessionToken = v9->_sessionToken;
    v9->_sessionToken = v11;

    v13 = [v6 objectForKeyedSubscript:@"requiredSerialNumbers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }

    requiredSerialNumbers = v9->_requiredSerialNumbers;
    v9->_requiredSerialNumbers = v14;

    v16 = [v6 objectForKeyedSubscript:@"selectableSerialNumbers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }

    selectableSerialNumbers = v9->_selectableSerialNumbers;
    v9->_selectableSerialNumbers = v17;
  }
  return v9;
}

- (BOOL)disableReappearPlaceholder
{
  return 1;
}

- (id)createViewControllerForContainer:(id)a3
{
  v4 = [AMSUIWebDiagnosticsWrapperViewController alloc];
  v5 = [(AMSUIWebDiagnosticsPageModel *)self context];
  id v6 = [(AMSUIWebDiagnosticsWrapperViewController *)v4 initWithContext:v5];

  return v6;
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

- (NSString)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
}

- (NSArray)requiredSerialNumbers
{
  return self->_requiredSerialNumbers;
}

- (void)setRequiredSerialNumbers:(id)a3
{
}

- (NSArray)selectableSerialNumbers
{
  return self->_selectableSerialNumbers;
}

- (void)setSelectableSerialNumbers:(id)a3
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
  objc_storeStrong((id *)&self->_selectableSerialNumbers, 0);
  objc_storeStrong((id *)&self->_requiredSerialNumbers, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_impressionEvent, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end