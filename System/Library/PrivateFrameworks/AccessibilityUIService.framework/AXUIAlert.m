@interface AXUIAlert
+ (id)alertWithType:(unint64_t)a3 text:(id)a4 subtitleText:(id)a5 iconImage:(id)a6 styleProvider:(id)a7 userInfo:(id)a8;
- (AXUIAlertContext)context;
- (NSDictionary)userInfo;
- (void)setContext:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation AXUIAlert

+ (id)alertWithType:(unint64_t)a3 text:(id)a4 subtitleText:(id)a5 iconImage:(id)a6 styleProvider:(id)a7 userInfo:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (a3 == 5)
  {
    v20 = [NSNumber numberWithUnsignedInteger:5];
    _AXAssert();

    v18 = 0;
  }
  else
  {
    v18 = [[AXStyleProviderUIAlert alloc] initWithType:a3 text:v13 subtitleText:v14 iconImage:v15 styleProvider:v16 userInfo:v17];
  }

  return v18;
}

- (AXUIAlertContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);

  return (AXUIAlertContext *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_destroyWeak((id *)&self->_context);
}

@end