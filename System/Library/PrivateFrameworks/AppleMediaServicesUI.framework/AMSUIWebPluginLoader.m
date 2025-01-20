@interface AMSUIWebPluginLoader
- (AMSUIWebClientContext)context;
- (AMSUIWebPluginLoader)initWithContext:(id)a3;
- (NSArray)loadedPlugins;
- (NSDictionary)installedPluginURLs;
- (NSMutableDictionary)loadedPluginsMap;
- (id)_loadInstalledPlugins;
- (id)pluginForBundleIdentifier:(id)a3;
- (void)setLoadedPluginsMap:(id)a3;
@end

@implementation AMSUIWebPluginLoader

- (AMSUIWebPluginLoader)initWithContext:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebPluginLoader;
  v5 = [(AMSUIWebPluginLoader *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_context, v4);
    uint64_t v7 = [(AMSUIWebPluginLoader *)v6 _loadInstalledPlugins];
    installedPluginURLs = v6->_installedPluginURLs;
    v6->_installedPluginURLs = (NSDictionary *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    loadedPluginsMap = v6->_loadedPluginsMap;
    v6->_loadedPluginsMap = v9;
  }
  return v6;
}

- (NSArray)loadedPlugins
{
  v2 = [(AMSUIWebPluginLoader *)self loadedPluginsMap];
  v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (id)pluginForBundleIdentifier:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(AMSUIWebPluginLoader *)self loadedPluginsMap];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v7 = [(AMSUIWebPluginLoader *)self loadedPluginsMap];
    v8 = [v7 objectForKeyedSubscript:v4];

    goto LABEL_40;
  }
  v9 = [(AMSUIWebPluginLoader *)self installedPluginURLs];
  v10 = [v9 objectForKeyedSubscript:v4];

  if (v10)
  {
    v11 = (void *)[objc_alloc(MEMORY[0x263F086E0]) initWithURL:v10];
    objc_super v12 = v11;
    if (v11)
    {
      if ([v11 load])
      {
        v13 = (objc_class *)[v12 principalClass];
        if (v13)
        {
          v14 = v13;
          if ([(objc_class *)v13 conformsToProtocol:&unk_26CCECA08])
          {
            objc_initWeak((id *)location, self);
            id v15 = [v14 alloc];
            v16 = [(AMSUIWebPluginLoader *)self context];
            v36 = [v16 bag];
            v37 = [(AMSUIWebPluginLoader *)self context];
            v17 = [v37 account];
            v18 = [(AMSUIWebPluginLoader *)self context];
            v19 = [v18 clientInfo];
            v20 = v19;
            if (!v19)
            {
              v20 = [MEMORY[0x263F27E08] currentProcess];
            }
            v38[0] = MEMORY[0x263EF8330];
            v38[1] = 3221225472;
            v38[2] = __50__AMSUIWebPluginLoader_pluginForBundleIdentifier___block_invoke;
            v38[3] = &unk_2643E37D0;
            objc_copyWeak(&v39, (id *)location);
            v8 = (void *)[v15 initWithBag:v36 account:v17 clientInfo:v20 propertiesChangedHandler:v38];
            if (!v19) {

            }
            v21 = [(AMSUIWebPluginLoader *)self loadedPluginsMap];
            [v21 setObject:v8 forKeyedSubscript:v4];

            objc_destroyWeak(&v39);
            objc_destroyWeak((id *)location);
            goto LABEL_39;
          }
          v25 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
          if (!v25)
          {
            v25 = [MEMORY[0x263F27CB8] sharedConfig];
          }
          v26 = [v25 OSLogObject];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            uint64_t v33 = objc_opt_class();
            v34 = AMSLogKey();
            *(_DWORD *)location = 138543874;
            *(void *)&location[4] = v33;
            __int16 v41 = 2114;
            v42 = v34;
            __int16 v43 = 2114;
            id v44 = v4;
            _os_log_impl(&dword_21C134000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Principal class doesn't conform to AMSUIWebPlugin. Bundle identifier: %{public}@", location, 0x20u);
          }
        }
        else
        {
          v25 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
          if (!v25)
          {
            v25 = [MEMORY[0x263F27CB8] sharedConfig];
          }
          v26 = [v25 OSLogObject];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            uint64_t v31 = objc_opt_class();
            v32 = AMSLogKey();
            *(_DWORD *)location = 138543874;
            *(void *)&location[4] = v31;
            __int16 v41 = 2114;
            v42 = v32;
            __int16 v43 = 2114;
            id v44 = v4;
            _os_log_impl(&dword_21C134000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Principal class not found. Bundle identifier: %{public}@", location, 0x20u);
          }
        }
      }
      else
      {
        v25 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
        if (!v25)
        {
          v25 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        v26 = [v25 OSLogObject];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = objc_opt_class();
          v30 = AMSLogKey();
          *(_DWORD *)location = 138543874;
          *(void *)&location[4] = v29;
          __int16 v41 = 2114;
          v42 = v30;
          __int16 v43 = 2114;
          id v44 = v4;
          _os_log_impl(&dword_21C134000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to load plugin. Bundle identifier: %{public}@", location, 0x20u);
        }
      }
    }
    else
    {
      v25 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v25)
      {
        v25 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v26 = [v25 OSLogObject];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = objc_opt_class();
        v28 = AMSLogKey();
        *(_DWORD *)location = 138543874;
        *(void *)&location[4] = v27;
        __int16 v41 = 2114;
        v42 = v28;
        __int16 v43 = 2114;
        id v44 = v4;
        _os_log_impl(&dword_21C134000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No plugin bundle found. Bundle identifier: %{public}@", location, 0x20u);
      }
    }
  }
  else
  {
    objc_super v12 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v12)
    {
      objc_super v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v22 = [v12 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_opt_class();
      v24 = AMSLogKey();
      *(_DWORD *)location = 138543874;
      *(void *)&location[4] = v23;
      __int16 v41 = 2114;
      v42 = v24;
      __int16 v43 = 2114;
      id v44 = v4;
      _os_log_impl(&dword_21C134000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No plugin found. Bundle identifier: %{public}@", location, 0x20u);
    }
  }
  v8 = 0;
LABEL_39:

LABEL_40:
  return v8;
}

void __50__AMSUIWebPluginLoader_pluginForBundleIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained context];
  v2 = [v1 dataProvider];
  id v3 = (id)[v2 syncProperties];
}

- (id)_loadInstalledPlugins
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = (void *)[objc_alloc(MEMORY[0x263F086E0]) initWithPath:@"/System/Library/AppleMediaServices/WebUI/"];
  id v4 = [v3 pathsForResourcesOfType:@"bundle" inDirectory:@"PlugIns"];
  v5 = v4;
  if (v4)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = (void *)[objc_alloc(MEMORY[0x263F086E0]) initWithPath:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          v11 = [v10 bundleIdentifier];
          uint64_t v12 = [v10 bundleURL];
          v13 = (void *)v12;
          if (v11) {
            BOOL v14 = v12 == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (!v14) {
            [v2 setObject:v12 forKeyedSubscript:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v15 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v15)
    {
      id v15 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_opt_class();
      v18 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v17;
      __int16 v27 = 2114;
      v28 = v18;
      _os_log_impl(&dword_21C134000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to find plugins bundle", buf, 0x16u);
    }
  }

  return v2;
}

- (AMSUIWebClientContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (AMSUIWebClientContext *)WeakRetained;
}

- (NSDictionary)installedPluginURLs
{
  return self->_installedPluginURLs;
}

- (NSMutableDictionary)loadedPluginsMap
{
  return self->_loadedPluginsMap;
}

- (void)setLoadedPluginsMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedPluginsMap, 0);
  objc_storeStrong((id *)&self->_installedPluginURLs, 0);
  objc_destroyWeak((id *)&self->_context);
}

@end