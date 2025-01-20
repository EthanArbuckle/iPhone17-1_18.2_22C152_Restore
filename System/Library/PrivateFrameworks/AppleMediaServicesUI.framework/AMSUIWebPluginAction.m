@interface AMSUIWebPluginAction
- (AMSUIWebPluginAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSDictionary)options;
- (NSString)actionIdentifier;
- (NSString)bundleIdentifier;
- (id)runAction;
@end

@implementation AMSUIWebPluginAction

- (AMSUIWebPluginAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSUIWebPluginAction;
  v7 = [(AMSUIWebAction *)&v18 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"actionIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    actionIdentifier = v7->_actionIdentifier;
    v7->_actionIdentifier = v9;

    v11 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }

    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = v12;

    v14 = [v6 objectForKeyedSubscript:@"options"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }

    options = v7->_options;
    v7->_options = v15;
  }
  return v7;
}

- (id)runAction
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)AMSUIWebPluginAction;
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
    v7 = AMSLogKey();
    v8 = [(AMSUIWebPluginAction *)self bundleIdentifier];
    v9 = [(AMSUIWebPluginAction *)self actionIdentifier];
    *(_DWORD *)buf = 138544130;
    uint64_t v24 = v6;
    __int16 v25 = 2114;
    v26 = v7;
    __int16 v27 = 2114;
    v28 = v8;
    __int16 v29 = 2114;
    v30 = v9;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running plugin action. Bundle identifier: %{public}@, action identifier: %{public}@", buf, 0x2Au);
  }
  v10 = [(AMSUIWebPluginAction *)self actionIdentifier];

  if (v10)
  {
    v11 = [(AMSUIWebPluginAction *)self bundleIdentifier];

    if (v11)
    {
      v12 = [(AMSUIWebAction *)self context];
      v13 = [v12 pluginLoader];
      v14 = [(AMSUIWebPluginAction *)self bundleIdentifier];
      v15 = [v13 pluginForBundleIdentifier:v14];

      if (v15)
      {
        v16 = [(AMSUIWebPluginAction *)self actionIdentifier];
        v17 = [(AMSUIWebPluginAction *)self options];
        objc_super v18 = [v15 runActionWithIdentifier:v16 options:v17];
      }
      else
      {
        v20 = (void *)MEMORY[0x263F27E10];
        v16 = AMSError();
        objc_super v18 = [v20 promiseWithError:v16];
      }

      goto LABEL_14;
    }
    v19 = (void *)MEMORY[0x263F27E10];
  }
  else
  {
    v19 = (void *)MEMORY[0x263F27E10];
  }
  v15 = AMSError();
  objc_super v18 = [v19 promiseWithError:v15];
LABEL_14:

  return v18;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

@end