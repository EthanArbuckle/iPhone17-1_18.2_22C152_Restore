@interface CKSettingsiMessageAppManager
- (BOOL)haveDeletableApps;
- (CKSettingsiMessageAppManager)init;
- (NSArray)alliMessageApps;
- (NSArray)deletableAppsWithiMessageApp;
- (NSArray)deletableiMessageOnlyApps;
- (NSArray)highMemoryPayloadProviderExtensions;
- (NSArray)payloadProviderExtensions;
- (id)_beginMonitoringExtensionPoint:(id)a3;
- (id)_loadiMessageAppsSyncronouslyForExtensionPoint:(id)a3;
- (id)appWithBundleID:(id)a3;
- (id)extensionAttributesForExtensionPoint:(id)a3;
- (id)highMemoryPayloadProviderExtensionsMonitoringContext;
- (id)payloadProviderExtensionsMonitoringContext;
- (void)_clearCacheForDerivableiMessageAppLists;
- (void)_endMonitoringExtensionInstallation;
- (void)_notifyForInstalledAppChange;
- (void)dealloc;
- (void)setHighMemoryPayloadProviderExtensionsMonitoringContext:(id)a3;
- (void)setPayloadProviderExtensionsMonitoringContext:(id)a3;
@end

@implementation CKSettingsiMessageAppManager

- (CKSettingsiMessageAppManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)CKSettingsiMessageAppManager;
  v2 = [(CKSettingsiMessageAppManager *)&v9 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(CKSettingsiMessageAppManager *)v2 _beginMonitoringExtensionPoint:*MEMORY[0x263F4AC78]];
    id payloadProviderExtensionsMonitoringContext = v3->_payloadProviderExtensionsMonitoringContext;
    v3->_id payloadProviderExtensionsMonitoringContext = (id)v4;

    uint64_t v6 = [(CKSettingsiMessageAppManager *)v3 _beginMonitoringExtensionPoint:*MEMORY[0x263F4AC80]];
    id highMemoryPayloadProviderExtensionsMonitoringContext = v3->_highMemoryPayloadProviderExtensionsMonitoringContext;
    v3->_id highMemoryPayloadProviderExtensionsMonitoringContext = (id)v6;
  }
  return v3;
}

- (NSArray)payloadProviderExtensions
{
  payloadProviderExtensions = self->_payloadProviderExtensions;
  if (!payloadProviderExtensions)
  {
    uint64_t v4 = [(CKSettingsiMessageAppManager *)self _loadiMessageAppsSyncronouslyForExtensionPoint:*MEMORY[0x263F4AC78]];
    v5 = self->_payloadProviderExtensions;
    self->_payloadProviderExtensions = v4;

    payloadProviderExtensions = self->_payloadProviderExtensions;
  }
  return payloadProviderExtensions;
}

- (NSArray)highMemoryPayloadProviderExtensions
{
  highMemoryPayloadProviderExtensions = self->_highMemoryPayloadProviderExtensions;
  if (!highMemoryPayloadProviderExtensions)
  {
    uint64_t v4 = [(CKSettingsiMessageAppManager *)self _loadiMessageAppsSyncronouslyForExtensionPoint:*MEMORY[0x263F4AC80]];
    v5 = self->_highMemoryPayloadProviderExtensions;
    self->_highMemoryPayloadProviderExtensions = v4;

    highMemoryPayloadProviderExtensions = self->_highMemoryPayloadProviderExtensions;
  }
  return highMemoryPayloadProviderExtensions;
}

- (NSArray)alliMessageApps
{
  alliMessageApps = self->_alliMessageApps;
  if (!alliMessageApps)
  {
    uint64_t v4 = [(CKSettingsiMessageAppManager *)self payloadProviderExtensions];
    v5 = [(CKSettingsiMessageAppManager *)self highMemoryPayloadProviderExtensions];
    uint64_t v6 = [v4 arrayByAddingObjectsFromArray:v5];
    v7 = self->_alliMessageApps;
    self->_alliMessageApps = v6;

    alliMessageApps = self->_alliMessageApps;
  }
  return alliMessageApps;
}

- (NSArray)deletableiMessageOnlyApps
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  deletableiMessageOnlyApps = self->_deletableiMessageOnlyApps;
  if (!deletableiMessageOnlyApps)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    v5 = [(CKSettingsiMessageAppManager *)self alliMessageApps];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v10 isDeletable] && objc_msgSend(v10, "isiMessageAppOnly")) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
    v11 = [v4 sortedArrayUsingComparator:&__block_literal_global_1];
    v12 = self->_deletableiMessageOnlyApps;
    self->_deletableiMessageOnlyApps = v11;

    deletableiMessageOnlyApps = self->_deletableiMessageOnlyApps;
  }
  return deletableiMessageOnlyApps;
}

uint64_t __57__CKSettingsiMessageAppManager_deletableiMessageOnlyApps__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 extensionDisplayName];
  uint64_t v6 = [v4 extensionDisplayName];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (NSArray)deletableAppsWithiMessageApp
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  deletableAppsWithiMessageApp = self->_deletableAppsWithiMessageApp;
  if (!deletableAppsWithiMessageApp)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    v5 = [(CKSettingsiMessageAppManager *)self alliMessageApps];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v10 isDeletable] && (objc_msgSend(v10, "isiMessageAppOnly") & 1) == 0) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
    v11 = [v4 sortedArrayUsingComparator:&__block_literal_global_99];
    v12 = self->_deletableAppsWithiMessageApp;
    self->_deletableAppsWithiMessageApp = v11;

    deletableAppsWithiMessageApp = self->_deletableAppsWithiMessageApp;
  }
  return deletableAppsWithiMessageApp;
}

uint64_t __60__CKSettingsiMessageAppManager_deletableAppsWithiMessageApp__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 appDisplayName];
  uint64_t v6 = [v4 appDisplayName];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (id)appWithBundleID:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(CKSettingsiMessageAppManager *)self alliMessageApps];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v6)
  {
    v10 = 0;
    goto LABEL_15;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v17;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      v11 = objc_msgSend(v10, "extensionBundleID", (void)v16);
      if ([v4 isEqualToString:v11])
      {
        id v13 = v10;
LABEL_14:

        goto LABEL_15;
      }
      v12 = [v10 appBundleID];
      if ([v4 isEqualToString:v12])
      {
        id v14 = v10;

        goto LABEL_14;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    v10 = 0;
    if (v7) {
      continue;
    }
    break;
  }
LABEL_15:

  return v10;
}

- (BOOL)haveDeletableApps
{
  v3 = [(CKSettingsiMessageAppManager *)self deletableAppsWithiMessageApp];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(CKSettingsiMessageAppManager *)self deletableiMessageOnlyApps];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (void)_clearCacheForDerivableiMessageAppLists
{
  alliMessageApps = self->_alliMessageApps;
  self->_alliMessageApps = 0;

  deletableiMessageOnlyApps = self->_deletableiMessageOnlyApps;
  self->_deletableiMessageOnlyApps = 0;

  deletableAppsWithiMessageApp = self->_deletableAppsWithiMessageApp;
  self->_deletableAppsWithiMessageApp = 0;
}

- (id)extensionAttributesForExtensionPoint:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = *MEMORY[0x263F07FF8];
  v8[0] = a3;
  v3 = NSDictionary;
  id v4 = a3;
  id v5 = [v3 dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (id)_loadiMessageAppsSyncronouslyForExtensionPoint:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CKSettingsiMessageAppManager *)self extensionAttributesForExtensionPoint:v4];
  id v22 = 0;
  uint64_t v6 = [MEMORY[0x263F08800] extensionsWithMatchingAttributes:v5 error:&v22];
  id v7 = v22;
  if (v7)
  {
    uint64_t v8 = csui_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CKSettingsiMessageAppManager _loadiMessageAppsSyncronouslyForExtensionPoint:]((uint64_t)v4, v8);
    }
    id v9 = (id)MEMORY[0x263EFFA68];
  }
  else
  {
    uint64_t v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v17 = v6;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = [[CKSettingsiMessageApp alloc] initWithExtension:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          if (v15) {
            [v8 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v12);
    }

    id v9 = [v8 copy];
    uint64_t v6 = v17;
  }

  return v9;
}

- (id)_beginMonitoringExtensionPoint:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSettingsiMessageAppManager *)self extensionAttributesForExtensionPoint:v4];
  objc_initWeak(&location, self);
  uint64_t v6 = (void *)MEMORY[0x263F08800];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__CKSettingsiMessageAppManager__beginMonitoringExtensionPoint___block_invoke;
  v10[3] = &unk_2644F0790;
  objc_copyWeak(&v12, &location);
  id v7 = v4;
  id v11 = v7;
  uint64_t v8 = [v6 beginMatchingExtensionsWithAttributes:v5 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

void __63__CKSettingsiMessageAppManager__beginMonitoringExtensionPoint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = csui_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v6;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Received updated extension list for extension point: %@", buf, 0xCu);
  }

  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__CKSettingsiMessageAppManager__beginMonitoringExtensionPoint___block_invoke_103;
    block[3] = &unk_2644F0768;
    id v8 = v3;
    id v9 = *(id *)(a1 + 32);
    id v10 = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __63__CKSettingsiMessageAppManager__beginMonitoringExtensionPoint___block_invoke_103(id *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = a1[4];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * v7);
        id v9 = [CKSettingsiMessageApp alloc];
        id v10 = -[CKSettingsiMessageApp initWithExtension:](v9, "initWithExtension:", v8, (void)v16);
        if (v10) {
          [v2 addObject:v10];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  if ([a1[5] isEqualToString:*MEMORY[0x263F4AC78]])
  {
    uint64_t v11 = [v2 copy];
    uint64_t v12 = a1[6];
    uint64_t v13 = (void *)v12[1];
    v12[1] = v11;
LABEL_14:

    goto LABEL_15;
  }
  if ([a1[5] isEqualToString:*MEMORY[0x263F4AC80]])
  {
    uint64_t v14 = [v2 copy];
    long long v15 = a1[6];
    uint64_t v13 = (void *)v15[2];
    v15[2] = v14;
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(a1[6], "_clearCacheForDerivableiMessageAppLists", (void)v16);
  [a1[6] _notifyForInstalledAppChange];
}

- (void)_notifyForInstalledAppChange
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"CKSettingsiMessageAppManagerInstalledAppsDidChange" object:0];
}

- (void)_endMonitoringExtensionInstallation
{
  if (self->_payloadProviderExtensionsMonitoringContext)
  {
    objc_msgSend(MEMORY[0x263F08800], "endMatchingExtensions:");
    id payloadProviderExtensionsMonitoringContext = self->_payloadProviderExtensionsMonitoringContext;
    self->_id payloadProviderExtensionsMonitoringContext = 0;
  }
  if (self->_highMemoryPayloadProviderExtensionsMonitoringContext)
  {
    objc_msgSend(MEMORY[0x263F08800], "endMatchingExtensions:");
    id highMemoryPayloadProviderExtensionsMonitoringContext = self->_highMemoryPayloadProviderExtensionsMonitoringContext;
    self->_id highMemoryPayloadProviderExtensionsMonitoringContext = 0;
  }
}

- (void)dealloc
{
  [(CKSettingsiMessageAppManager *)self _endMonitoringExtensionInstallation];
  v3.receiver = self;
  v3.super_class = (Class)CKSettingsiMessageAppManager;
  [(CKSettingsiMessageAppManager *)&v3 dealloc];
}

- (id)payloadProviderExtensionsMonitoringContext
{
  return self->_payloadProviderExtensionsMonitoringContext;
}

- (void)setPayloadProviderExtensionsMonitoringContext:(id)a3
{
}

- (id)highMemoryPayloadProviderExtensionsMonitoringContext
{
  return self->_highMemoryPayloadProviderExtensionsMonitoringContext;
}

- (void)setHighMemoryPayloadProviderExtensionsMonitoringContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_highMemoryPayloadProviderExtensionsMonitoringContext, 0);
  objc_storeStrong(&self->_payloadProviderExtensionsMonitoringContext, 0);
  objc_storeStrong((id *)&self->_deletableiMessageOnlyApps, 0);
  objc_storeStrong((id *)&self->_deletableAppsWithiMessageApp, 0);
  objc_storeStrong((id *)&self->_alliMessageApps, 0);
  objc_storeStrong((id *)&self->_highMemoryPayloadProviderExtensions, 0);
  objc_storeStrong((id *)&self->_payloadProviderExtensions, 0);
}

- (void)_loadiMessageAppsSyncronouslyForExtensionPoint:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21ED18000, a2, OS_LOG_TYPE_ERROR, "Error loading extensions for extension point: %@", (uint8_t *)&v2, 0xCu);
}

@end