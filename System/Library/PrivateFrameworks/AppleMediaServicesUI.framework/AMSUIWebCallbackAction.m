@interface AMSUIWebCallbackAction
- (AMSUIWebCallbackAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSDictionary)data;
- (NSString)service;
- (id)runAction;
- (void)setData:(id)a3;
- (void)setService:(id)a3;
@end

@implementation AMSUIWebCallbackAction

- (AMSUIWebCallbackAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIWebCallbackAction;
  v7 = [(AMSUIWebAction *)&v15 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"service"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    service = v7->_service;
    v7->_service = v9;

    v11 = [v6 objectForKeyedSubscript:@"data"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }

    data = v7->_data;
    v7->_data = v12;
  }
  return v7;
}

- (id)runAction
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)AMSUIWebCallbackAction;
  id v3 = [(AMSUIWebAction *)&v26 runAction];
  v4 = AMSGenerateLogCorrelationKey();
  v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v5)
  {
    v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    v8 = [(AMSUIWebAction *)self context];
    v9 = [v8 logKey];
    v10 = [(AMSUIWebCallbackAction *)self service];
    *(_DWORD *)buf = 138544130;
    uint64_t v28 = v7;
    __int16 v29 = 2114;
    v30 = v9;
    __int16 v31 = 2114;
    v32 = v10;
    __int16 v33 = 2114;
    v34 = v4;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Calling back to the JS service: %{public}@ key: %{public}@", buf, 0x2Au);
  }
  v11 = [(AMSUIWebAction *)self context];
  v12 = [v11 logKey];
  v13 = AMSUIWebSetSubLogKey(v12, 0);

  id v14 = objc_alloc_init(MEMORY[0x263F27E10]);
  objc_super v15 = [AMSUIWebJSRequest alloc];
  v16 = [(AMSUIWebCallbackAction *)self service];
  v17 = [(AMSUIWebJSRequest *)v15 initWithServiceName:v16 logKey:v13];

  v18 = [(AMSUIWebCallbackAction *)self data];
  [(AMSUIWebJSRequest *)v17 setOptions:v18];

  v19 = [(AMSUIWebAction *)self context];
  v20 = [v19 dataProvider];
  v21 = [v20 runJSRequest:v17];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __35__AMSUIWebCallbackAction_runAction__block_invoke;
  v24[3] = &unk_2643E4AB0;
  id v22 = v14;
  id v25 = v22;
  [v21 addFinishBlock:v24];

  return v22;
}

void __35__AMSUIWebCallbackAction_runAction__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "finishWithError:");
  }
  else
  {
    uint64_t v5 = [a2 body];
    id v7 = (id)v5;
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = MEMORY[0x263EFFA78];
    }
    [v3 finishWithResult:v6];
  }
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end