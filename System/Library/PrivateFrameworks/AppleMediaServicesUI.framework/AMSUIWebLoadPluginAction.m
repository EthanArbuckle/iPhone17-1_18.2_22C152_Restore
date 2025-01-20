@interface AMSUIWebLoadPluginAction
- (AMSUIWebLoadPluginAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSString)bundleIdentifier;
- (id)runAction;
@end

@implementation AMSUIWebLoadPluginAction

- (AMSUIWebLoadPluginAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebLoadPluginAction;
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
  uint64_t v28 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)AMSUIWebLoadPluginAction;
  id v3 = [(AMSUIWebAction *)&v21 runAction];
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
    v8 = [(AMSUIWebLoadPluginAction *)self bundleIdentifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v23 = v6;
    __int16 v24 = 2114;
    v25 = v7;
    __int16 v26 = 2114;
    v27 = v8;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running plugin action. Bundle identifier: %{public}@", buf, 0x20u);
  }
  v9 = [(AMSUIWebLoadPluginAction *)self bundleIdentifier];

  if (v9)
  {
    v10 = [(AMSUIWebAction *)self context];
    v11 = [v10 pluginLoader];
    objc_super v12 = [(AMSUIWebLoadPluginAction *)self bundleIdentifier];
    v13 = [v11 pluginForBundleIdentifier:v12];

    if (v13)
    {
      v14 = [(AMSUIWebAction *)self context];
      v15 = [v14 dataProvider];
      v16 = [v15 syncProperties];
      v17 = [v16 promiseAdapter];
    }
    else
    {
      v19 = (void *)MEMORY[0x263F27E10];
      v14 = AMSError();
      v17 = [v19 promiseWithError:v14];
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x263F27E10];
    v13 = AMSError();
    v17 = [v18 promiseWithError:v13];
  }

  return v17;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
}

@end