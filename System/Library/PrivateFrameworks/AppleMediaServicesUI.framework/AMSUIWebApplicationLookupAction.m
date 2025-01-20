@interface AMSUIWebApplicationLookupAction
- (AMSUIWebApplicationLookupAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSString)bundleIdentifier;
- (id)runAction;
- (void)setBundleIdentifier:(id)a3;
@end

@implementation AMSUIWebApplicationLookupAction

- (AMSUIWebApplicationLookupAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebApplicationLookupAction;
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
  v19.receiver = self;
  v19.super_class = (Class)AMSUIWebApplicationLookupAction;
  id v3 = [(AMSUIWebAction *)&v19 runAction];
  v4 = [(AMSUIWebApplicationLookupAction *)self bundleIdentifier];
  uint64_t v5 = [v4 length];

  id v6 = (void *)MEMORY[0x263F27E10];
  if (v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F27E10]);
    v8 = dispatch_get_global_queue(-32768, 0);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __44__AMSUIWebApplicationLookupAction_runAction__block_invoke;
    v17[3] = &unk_2643E34D0;
    v17[4] = self;
    id v9 = v7;
    id v18 = v9;
    v10 = v17;
    v11 = AMSLogKey();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __AMSDispatchAsync_block_invoke_6;
    block[3] = &unk_2643E33B0;
    id v21 = v11;
    id v22 = v10;
    id v12 = v11;
    dispatch_async(v8, block);

    v13 = v18;
    id v14 = v9;

    v15 = v14;
  }
  else
  {
    AMSError();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = [v6 promiseWithError:v14];
  }

  return v15;
}

void __44__AMSUIWebApplicationLookupAction_runAction__block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v2)
  {
    v2 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = AMSLogKey();
    id v6 = [*(id *)(a1 + 32) bundleIdentifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v30 = v4;
    __int16 v31 = 2114;
    v32 = v5;
    __int16 v33 = 2114;
    id v34 = v6;
    _os_log_impl(&dword_21C134000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Looking up application record: %{public}@", buf, 0x20u);
  }
  id v7 = objc_alloc(MEMORY[0x263F01878]);
  v8 = [*(id *)(a1 + 32) bundleIdentifier];
  id v28 = 0;
  id v9 = (void *)[v7 initWithBundleIdentifier:v8 allowPlaceholder:0 error:&v28];
  id v10 = v28;

  if (!v9 || v10)
  {
    if (!v10)
    {
      AMSError();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v24)
    {
      v24 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v25 = [v24 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = objc_opt_class();
      v27 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v30 = v26;
      __int16 v31 = 2114;
      v32 = v27;
      __int16 v33 = 2114;
      id v34 = v10;
      _os_log_impl(&dword_21C134000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to lookup application record. %{public}@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) finishWithError:v10];
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v12 = [v9 bundleIdentifier];
    [v11 setObject:v12 forKeyedSubscript:@"bundleIdentifier"];

    v13 = [v9 bundleVersion];
    [v11 setObject:v13 forKeyedSubscript:@"bundleVersion"];

    id v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isBeta"));
    [v11 setObject:v14 forKeyedSubscript:@"beta"];

    v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isPlaceholder"));
    [v11 setObject:v15 forKeyedSubscript:@"placeholder"];

    v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isArcadeApp"));
    [v11 setObject:v16 forKeyedSubscript:@"arcadeApp"];

    v17 = NSNumber;
    id v18 = [v9 applicationState];
    objc_super v19 = objc_msgSend(v17, "numberWithBool:", objc_msgSend(v18, "isInstalled"));
    [v11 setObject:v19 forKeyedSubscript:@"installed"];

    v20 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v20)
    {
      v20 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = objc_opt_class();
      v23 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v30 = v22;
      __int16 v31 = 2114;
      v32 = v23;
      __int16 v33 = 2114;
      id v34 = v9;
      _os_log_impl(&dword_21C134000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found application: %{public}@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) finishWithResult:v11];

    id v10 = 0;
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