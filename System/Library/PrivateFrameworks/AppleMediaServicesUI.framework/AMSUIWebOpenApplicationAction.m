@interface AMSUIWebOpenApplicationAction
- (AMSUIWebOpenApplicationAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSString)bundleIdentifier;
- (id)runAction;
- (void)setBundleIdentifier:(id)a3;
@end

@implementation AMSUIWebOpenApplicationAction

- (AMSUIWebOpenApplicationAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebOpenApplicationAction;
  v7 = [(AMSUIWebAction *)&v12 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = v9;
  }
  return v7;
}

- (id)runAction
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)AMSUIWebOpenApplicationAction;
  id v3 = [(AMSUIWebAction *)&v23 runAction];
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
    v8 = [(AMSUIWebOpenApplicationAction *)self bundleIdentifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v25 = v6;
    __int16 v26 = 2114;
    v27 = v7;
    __int16 v28 = 2114;
    v29 = v8;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Opening application: %{public}@", buf, 0x20u);
  }
  v9 = [(AMSUIWebOpenApplicationAction *)self bundleIdentifier];

  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x263F27B58]);
    v11 = [MEMORY[0x263F01880] defaultWorkspace];
    objc_super v12 = [(AMSUIWebOpenApplicationAction *)self bundleIdentifier];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __42__AMSUIWebOpenApplicationAction_runAction__block_invoke;
    v20 = &unk_2643E39B8;
    v21 = self;
    id v22 = v10;
    id v13 = v10;
    [v11 openApplicationWithBundleIdentifier:v12 configuration:0 completionHandler:&v17];

    v14 = objc_msgSend(v13, "promiseAdapter", v17, v18, v19, v20, v21);
  }
  else
  {
    v15 = (void *)MEMORY[0x263F27E10];
    AMSError();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = [v15 promiseWithError:v13];
  }

  return v14;
}

void __42__AMSUIWebOpenApplicationAction_runAction__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  v7 = (void *)v6;
  if (v5)
  {
    if (!v6)
    {
      v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = AMSLogKey();
      v11 = [*(id *)(a1 + 32) bundleIdentifier];
      objc_super v12 = AMSLogableError();
      int v17 = 138544130;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      v20 = v10;
      __int16 v21 = 2114;
      id v22 = v11;
      __int16 v23 = 2114;
      v24 = v12;
      _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error opening application with bundle identifier %{public}@ : %{public}@", (uint8_t *)&v17, 0x2Au);
    }
    [*(id *)(a1 + 40) finishWithError:v5];
  }
  else
  {
    if (!v6)
    {
      v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v13 = [v7 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      v15 = AMSLogKey();
      v16 = [*(id *)(a1 + 32) bundleIdentifier];
      int v17 = 138543874;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      v20 = v15;
      __int16 v21 = 2114;
      id v22 = v16;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully opened application with bundle identifier %{public}@", (uint8_t *)&v17, 0x20u);
    }
    [*(id *)(a1 + 40) finishWithSuccess:a2 error:0];
  }
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end