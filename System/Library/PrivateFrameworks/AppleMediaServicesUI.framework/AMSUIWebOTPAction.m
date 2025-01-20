@interface AMSUIWebOTPAction
- (AMSUIWebOTPAction)initWithJSObject:(id)a3 context:(id)a4;
- (BOOL)enabled;
- (id)runAction;
- (void)setEnabled:(BOOL)a3;
@end

@implementation AMSUIWebOTPAction

- (AMSUIWebOTPAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSUIWebOTPAction;
  v7 = [(AMSUIWebAction *)&v11 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"enabled"];
    if (objc_opt_respondsToSelector())
    {
      v9 = [v6 objectForKeyedSubscript:@"enabled"];
      v7->_enabled = [v9 BOOLValue];
    }
    else
    {
      v7->_enabled = 0;
    }
  }
  return v7;
}

- (id)runAction
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)AMSUIWebOTPAction;
  id v3 = [(AMSUIWebAction *)&v19 runAction];
  v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    v7 = AMSLogKey();
    BOOL v8 = [(AMSUIWebOTPAction *)self enabled];
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = v6;
    __int16 v22 = 2114;
    v23 = v7;
    __int16 v24 = 1024;
    BOOL v25 = v8;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running action. (enabled: %d)", buf, 0x1Cu);
  }
  BOOL v9 = [(AMSUIWebOTPAction *)self enabled];
  v10 = [(AMSUIWebAction *)self context];
  objc_super v11 = [v10 dataProvider];
  v12 = v11;
  if (v9) {
    char v13 = [v11 startOTPListener];
  }
  else {
    char v13 = [v11 stopOTPListener];
  }
  char v14 = v13;

  if (v14)
  {
    v15 = [MEMORY[0x263F27E10] promiseWithResult:MEMORY[0x263EFFA88]];
  }
  else
  {
    v16 = (void *)MEMORY[0x263F27E10];
    v17 = AMSError();
    v15 = [v16 promiseWithError:v17];
  }
  return v15;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end