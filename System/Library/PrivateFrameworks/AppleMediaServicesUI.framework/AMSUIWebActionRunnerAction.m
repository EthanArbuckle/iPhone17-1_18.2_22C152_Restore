@interface AMSUIWebActionRunnerAction
- (AMSUIWebActionRunnerAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSDictionary)actionPayload;
- (id)runAction;
- (void)setActionPayload:(id)a3;
@end

@implementation AMSUIWebActionRunnerAction

- (AMSUIWebActionRunnerAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSUIWebActionRunnerAction;
  v8 = [(AMSUIWebAction *)&v11 initWithJSObject:v7 context:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_actionPayload, a3);
  }

  return v9;
}

- (id)runAction
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)AMSUIWebActionRunnerAction;
  id v3 = [(AMSUIWebAction *)&v22 runAction];
  v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v6;
    __int16 v25 = 2114;
    v26 = v7;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Deferring action to UIActionRunner", buf, 0x16u);
  }
  v8 = [(AMSUIWebAction *)self context];
  v9 = [v8 flowController];
  v10 = [v9 currentContainer];

  objc_super v11 = [AMSUIActionContext alloc];
  v12 = [(AMSUIWebAction *)self context];
  v13 = [v12 account];
  v14 = [(AMSUIWebAction *)self context];
  v15 = [v14 bag];
  v16 = [(AMSUIWebAction *)self context];
  v17 = [v16 clientInfo];
  v18 = [(AMSUIActionContext *)v11 initWithAccount:v13 bag:v15 presentingViewController:v10 processInfo:v17];

  v19 = [(AMSUIWebActionRunnerAction *)self actionPayload];
  v20 = +[AMSUIActionRunner handle:v19 context:v18];

  return v20;
}

- (NSDictionary)actionPayload
{
  return self->_actionPayload;
}

- (void)setActionPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end