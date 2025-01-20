@interface AXAuditPluginManager
+ (id)sharedManager;
- (BOOL)_didLoadBundles;
- (id)platformPlugin;
- (id)pluginForAuditCategory:(id)a3;
- (void)_loadAuditBundle:(id)a3;
- (void)loadAuditBundles;
- (void)set_didLoadBundles:(BOOL)a3;
@end

@implementation AXAuditPluginManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__AXAuditPluginManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_2 != -1) {
    dispatch_once(&sharedManager_onceToken_2, block);
  }
  v2 = (void *)sharedManager_instance_2;

  return v2;
}

uint64_t __37__AXAuditPluginManager_sharedManager__block_invoke()
{
  sharedManager_instance_2 = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (void)_loadAuditBundle:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F086E0] mainBundle];
  v5 = [v4 bundleIdentifier];
  int v6 = [v5 isEqualToString:@"com.apple.accessibility.AccessibilityAuditUI"];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    v7 = @"YES";
    *(_DWORD *)buf = 136315650;
    v19 = "-[AXAuditPluginManager _loadAuditBundle:]";
    __int16 v20 = 2112;
    if (v6) {
      v7 = @"NO";
    }
    v21 = v7;
    __int16 v22 = 2112;
    id v23 = v3;
    _os_log_impl(&dword_247247000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: shouldLoad: %@, %@ ", buf, 0x20u);
  }
  if ((v6 & 1) == 0)
  {
    v8 = [MEMORY[0x263F086E0] bundleWithPath:v3];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[AXAuditPluginManager _loadAuditBundle:]";
      __int16 v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_247247000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: plugin: %@ ", buf, 0x16u);
    }
    if (v8)
    {
      v9 = (__CFString *)[(__CFString *)v8 principalClass];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[AXAuditPluginManager _loadAuditBundle:]";
        __int16 v20 = 2112;
        v21 = v9;
        _os_log_impl(&dword_247247000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: principalClass: %@ ", buf, 0x16u);
      }
      if ([(__CFString *)v9 isSubclassOfClass:objc_opt_class()])
      {
        id v17 = 0;
        int v10 = [(__CFString *)v8 loadAndReturnError:&v17];
        id v11 = v17;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          if (v10) {
            v12 = @"YES";
          }
          else {
            v12 = @"NO";
          }
          int v13 = [(__CFString *)v8 isLoaded];
          *(_DWORD *)buf = 136315906;
          v19 = "-[AXAuditPluginManager _loadAuditBundle:]";
          if (v13) {
            v14 = @"YES";
          }
          else {
            v14 = @"NO";
          }
          __int16 v20 = 2112;
          v21 = v12;
          __int16 v22 = 2112;
          id v23 = v11;
          __int16 v24 = 2112;
          v25 = v14;
          _os_log_impl(&dword_247247000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: loaded: %@, error: %@, plugin.isLoaded: %@", buf, 0x2Au);
        }
        if ([(__CFString *)v8 isLoaded])
        {
          objc_storeStrong(&_PluginBundle, v8);
          uint64_t v15 = objc_opt_new();
          v16 = (void *)_Plugin;
          _Plugin = v15;
        }
      }
    }
  }
}

- (void)loadAuditBundles
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (![(AXAuditPluginManager *)self _didLoadBundles])
  {
    [(AXAuditPluginManager *)self set_didLoadBundles:1];
    id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = [v3 pathsForResourcesOfType:@"bundle" inDirectory:0];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          int v10 = [v9 lastPathComponent];
          int v11 = [v10 hasPrefix:@"AccessibilityAudit"];

          if (v11) {
            [(AXAuditPluginManager *)self _loadAuditBundle:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

- (id)pluginForAuditCategory:(id)a3
{
  return (id)_Plugin;
}

- (id)platformPlugin
{
  return (id)_Plugin;
}

- (BOOL)_didLoadBundles
{
  return self->__didLoadBundles;
}

- (void)set_didLoadBundles:(BOOL)a3
{
  self->__didLoadBundles = a3;
}

@end