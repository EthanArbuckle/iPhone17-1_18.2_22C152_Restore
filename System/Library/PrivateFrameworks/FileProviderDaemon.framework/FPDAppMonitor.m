@interface FPDAppMonitor
- (BOOL)isMonitoring;
- (FPAppRegistry)appRegistry;
- (FPDAppMonitor)initWithServer:(id)a3;
- (FPDServer)server;
- (id)_appMetadataIfMonitoringIsNeeded:(id)a3;
- (id)_updateDefaultProviderDomainID;
- (id)listOfPlaceholderApps;
- (int)_registerForNotification:(id)a3 handler:(id)a4;
- (void)_didChangeDefaultSaveLocationInUserDefaults;
- (void)_didChangeListOfProviders;
- (void)_didChangeLocale:(id)a3;
- (void)_didRegisterApps:(id)a3;
- (void)_didUnregisterApps:(id)a3;
- (void)_populateListOfMonitoredApps;
- (void)_updateDefaultProviderByAppBundleID;
- (void)dumpStateTo:(id)a3;
- (void)listOfPlaceholderApps;
- (void)setMonitoring:(BOOL)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation FPDAppMonitor

- (void)startMonitoring
{
}

- (BOOL)isMonitoring
{
  return self->_monitoring;
}

- (FPAppRegistry)appRegistry
{
  return self->_appRegistry;
}

- (FPDAppMonitor)initWithServer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)FPDAppMonitor;
    v5 = [(FPDAppMonitor *)&v15 init];
    v6 = v5;
    if (v5)
    {
      objc_storeWeak((id *)&v5->_server, v4);
      v7 = objc_alloc_init(FPDAppRegistry);
      appRegistry = v6->_appRegistry;
      v6->_appRegistry = &v7->super;

      v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
      dispatch_queue_t v11 = dispatch_queue_create("com.apple.FileProvider.app-monitor", v10);
      notificationQueue = v6->_notificationQueue;
      v6->_notificationQueue = (OS_dispatch_queue *)v11;

      *(void *)&v6->_didChangeProvidersToken = -1;
    }
    self = v6;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __32__FPDAppMonitor_startMonitoring__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didChangeListOfProviders];
}

uint64_t __32__FPDAppMonitor_startMonitoring__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didChangeDefaultSaveLocationInUserDefaults];
}

- (void)stopMonitoring
{
}

- (void)dumpStateTo:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 write:@"apps monitor "];
  BOOL v5 = [(FPDAppMonitor *)self isMonitoring];
  if (v5) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 0;
  }
  if (v5) {
    v7 = @"active";
  }
  else {
    v7 = @"not-active";
  }
  [v4 startFgColor:v6 attr:2];
  [v4 write:v7];
  [v4 reset];
  [v4 write:@"\n"];
  [v4 write:@"-----------------------------------------------------\n"];
  v8 = [(FPDAppMonitor *)self appRegistry];
  v9 = [v8 listOfMonitoredApps];

  [v4 startFgColor:7 attr:2];
  objc_msgSend(v4, "write:", @"%lu", objc_msgSend(v9, "count"));
  [v4 reset];
  [v4 write:@" apps monitored"];
  if ([v9 count])
  {
    [v4 write:@":\n"];
    v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"bundleID" ascending:1];
    v23[0] = v10;
    dispatch_queue_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    v12 = [v9 sortedArrayUsingDescriptors:v11];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          [v4 write:@" - %@:\n", *(void *)(*((void *)&v18 + 1) + 8 * v17++)];
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v15);
    }

    [v4 write:@"\n"];
  }
  else
  {
    [v4 write:@".\n\n"];
  }
}

- (id)listOfPlaceholderApps
{
  uint64_t section = __fp_create_section();
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[FPDAppMonitor listOfPlaceholderApps]();
  }

  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__8;
  dispatch_queue_t v11 = __Block_byref_object_dispose__8;
  id v12 = 0;
  id v12 = (id)objc_opt_new();
  v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__FPDAppMonitor_listOfPlaceholderApps__block_invoke;
  v6[3] = &unk_1E6A74EA0;
  v6[4] = &v7;
  [v3 enumerateBundlesOfType:3 block:v6];
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  __fp_leave_section_Debug();
  return v4;
}

void __38__FPDAppMonitor_listOfPlaceholderApps__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 bundleIdentifier];
  [v2 addObject:v3];
}

- (void)_populateListOfMonitoredApps
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] ┏%llx populate list of monitored apps", v2, v3, v4, v5, v6);
}

void __45__FPDAppMonitor__populateListOfMonitoredApps__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1D9471CC0]();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v3;
    uint8_t v6 = [*(id *)(a1 + 32) _appMetadataIfMonitoringIsNeeded:v5];
    if (v6) {
      [*(id *)(a1 + 40) addObject:v6];
    }
  }
  else
  {
    uint64_t v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __45__FPDAppMonitor__populateListOfMonitoredApps__block_invoke_cold_1((uint64_t)v3, v7);
    }
  }
}

- (id)_appMetadataIfMonitoringIsNeeded:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && ([v4 supportsOpenInPlace] && (objc_msgSend(v5, "fileSharingEnabled") & 1) != 0
     || ([MEMORY[0x1E4F1CAD0] setWithObject:@"UISupportsDocumentBrowser"],
         uint8_t v6 = objc_claimAutoreleasedReturnValue(),
         [v5 objectForInfoDictionaryKey:@"UISupportsDocumentBrowser" ofClass:objc_opt_class()],
         uint64_t v7 = objc_claimAutoreleasedReturnValue(),
         int v8 = [v7 BOOLValue],
         v7,
         v6,
         v8)))
  {
    defaultProviderByAppBundleID = self->_defaultProviderByAppBundleID;
    v10 = [v5 bundleIdentifier];
    dispatch_queue_t v11 = [(NSDictionary *)defaultProviderByAppBundleID objectForKeyedSubscript:v10];

    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F25CC0]) initWithAppProxy:v5 providerDomainID:v11];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (int)_registerForNotification:(id)a3 handler:(id)a4
{
  int out_token = -1;
  id v6 = a3;
  id v7 = a4;
  LODWORD(self) = notify_register_dispatch((const char *)[v6 UTF8String], &out_token, (dispatch_queue_t)self->_notificationQueue, v7);

  if (self) {
    return -1;
  }
  else {
    return out_token;
  }
}

- (void)_didRegisterApps:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(FPDAppMonitor *)self isMonitoring])
  {
    uint64_t section = __fp_create_section();
    id v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[FPDAppMonitor _didRegisterApps:]();
    }

    id v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:@"bundleIDs"];

    int v8 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = objc_msgSend(MEMORY[0x1E4F223B8], "applicationProxyForIdentifier:", *(void *)(*((void *)&v16 + 1) + 8 * v12), (void)v16);
          uint64_t v14 = [(FPDAppMonitor *)self _appMetadataIfMonitoringIsNeeded:v13];
          if (v14) {
            [v8 addObject:v14];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }

    uint64_t v15 = self;
    objc_sync_enter(v15);
    [(FPAppRegistry *)v15->_appRegistry addApps:v8];
    objc_sync_exit(v15);

    __fp_leave_section_Debug();
  }
}

- (void)_didUnregisterApps:(id)a3
{
  id v4 = a3;
  if ([(FPDAppMonitor *)self isMonitoring])
  {
    __fp_create_section();
    id v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[FPDAppMonitor _didUnregisterApps:]();
    }

    id v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:@"bundleIDs"];

    int v8 = self;
    objc_sync_enter(v8);
    [(FPAppRegistry *)v8->_appRegistry removeAppsWithBundleIDs:v7];
    objc_sync_exit(v8);

    __fp_leave_section_Debug();
  }
}

- (void)_didChangeLocale:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(FPDAppMonitor *)self isMonitoring])
  {
    id v18 = v4;
    uint64_t section = __fp_create_section();
    id v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[FPDAppMonitor _didChangeLocale:]();
    }

    id v6 = self;
    objc_sync_enter(v6);
    obj = (id *)&v6->super.isa;
    long long v20 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = [(FPAppRegistry *)v6->_appRegistry listOfMonitoredApps];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v12 = [v11 bundleID];
          id v13 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v12];
          uint64_t v14 = [v13 localizedName];
          if (v14)
          {
            uint64_t v15 = [v11 displayName];
            char v16 = [v15 isEqualToString:v14];

            if ((v16 & 1) == 0)
            {
              long long v17 = (void *)[v11 copy];
              [v17 setDisplayName:v14];
              [v20 addObject:v17];
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v8);
    }

    [obj[5] addApps:v20];
    objc_sync_exit(obj);

    __fp_leave_section_Debug();
    id v4 = v18;
  }
}

- (void)_didChangeListOfProviders
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] ┏%llx did change list of providers", v2, v3, v4, v5, v6);
}

- (void)_didChangeDefaultSaveLocationInUserDefaults
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] ┏%llx did change default save location", v2, v3, v4, v5, v6);
}

- (id)_updateDefaultProviderDomainID
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (_updateDefaultProviderDomainID_onceToken != -1) {
    dispatch_once(&_updateDefaultProviderDomainID_onceToken, &__block_literal_global_14);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  uint64_t v4 = [WeakRetained extensionManager];
  uint64_t v5 = [v4 providerDomainsByID];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = (id)_updateDefaultProviderDomainID_defaultProviderIDs;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v5, "objectForKeyedSubscript:", v11, (void)v16);
        id v13 = v12;
        if (v12 && ([v12 isEnabled] & 1) != 0)
        {
          objc_msgSend(NSString, "setFp_defaultProviderDomainID:", v11);
          id v14 = v11;

          goto LABEL_14;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v14 = [(id)_updateDefaultProviderDomainID_defaultProviderIDs lastObject];
  objc_msgSend(NSString, "setFp_defaultProviderDomainID:", v14);
LABEL_14:

  return v14;
}

void __47__FPDAppMonitor__updateDefaultProviderDomainID__block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F25C00];
  uint64_t v1 = objc_msgSend(NSString, "fp_providerDomainIDFromProviderID:domainIdentifier:", @"com.apple.CloudDocs.MobileDocumentsFileProvider", *MEMORY[0x1E4F25C00]);
  uint64_t v2 = objc_msgSend(NSString, "fp_providerDomainIDFromProviderID:domainIdentifier:", @"com.apple.FileProvider.LocalStorage", v0);
  v5[0] = v1;
  v5[1] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  uint64_t v4 = (void *)_updateDefaultProviderDomainID_defaultProviderIDs;
  _updateDefaultProviderDomainID_defaultProviderIDs = v3;
}

- (void)_updateDefaultProviderByAppBundleID
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.DocumentManager.defaults"];
  uint64_t v3 = [v5 dictionaryForKey:@"DOCDefaultFileProviderIdentifierKey"];
  if (v3)
  {
    uint64_t v4 = self;
    objc_sync_enter(v4);
    objc_storeStrong((id *)&v4->_defaultProviderByAppBundleID, v3);
    objc_sync_exit(v4);
  }
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (FPDServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  return (FPDServer *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_appRegistry, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_defaultProviderByAppBundleID, 0);
}

- (void)listOfPlaceholderApps
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] ┏%llx check for app placeholders", v2, v3, v4, v5, v6);
}

void __45__FPDAppMonitor__populateListOfMonitoredApps__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D744C000, a2, OS_LOG_TYPE_ERROR, "[ERROR] LaunchService provided proxy %@ for an app enumeration", (uint8_t *)&v2, 0xCu);
}

- (void)_didRegisterApps:.cold.1()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] ┏%llx did register apps", v2, v3, v4, v5, v6);
}

- (void)_didUnregisterApps:.cold.1()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] ┏%llx did unregister apps", v2, v3, v4, v5, v6);
}

- (void)_didChangeLocale:.cold.1()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] ┏%llx did change locale", v2, v3, v4, v5, v6);
}

@end