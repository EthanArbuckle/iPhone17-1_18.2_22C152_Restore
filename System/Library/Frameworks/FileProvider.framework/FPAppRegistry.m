@interface FPAppRegistry
+ (BOOL)keepInSync;
+ (FPAppRegistry)sharedRegistry;
+ (FPAppRegistryDaemonConnectionOverride)daemonConnectionOverride;
+ (void)setDaemonConnectionOverride:(id)a3;
+ (void)setSharedRegistry:(id)a3;
- (BOOL)_isAppLibrary:(id)a3 appMetadata:(id *)a4 userVisible:(BOOL *)a5;
- (BOOL)isAppLibrary:(id)a3;
- (FPAppRegistry)init;
- (FPAppRegistryDelegate)delegate;
- (NSArray)listOfMonitoredApps;
- (id)_bundleIDForHomonymOfApp:(id)a3;
- (id)appForBundleID:(id)a3;
- (id)appForDisplayName:(id)a3;
- (id)promoteItemToAppLibraryIfNeeded:(id)a3;
- (int)_registerForNotification:(id)a3 handler:(id)a4;
- (void)_addApps:(id)a3;
- (void)_removeAppsWithBundleIDs:(id)a3;
- (void)_setApps:(id)a3;
- (void)addApps:(id)a3;
- (void)dealloc;
- (void)init;
- (void)removeAppsWithBundleIDs:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateAppList;
@end

@implementation FPAppRegistry

- (FPAppRegistry)init
{
  v19.receiver = self;
  v19.super_class = (Class)FPAppRegistry;
  v2 = [(FPAppRegistry *)&v19 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    appMetadataByBundleID = v2->_appMetadataByBundleID;
    v2->_appMetadataByBundleID = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    appMetadataByDisplayName = v2->_appMetadataByDisplayName;
    v2->_appMetadataByDisplayName = (NSMutableDictionary *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.FileProvider.app-registry-sync-queue", v7);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v8;

    if ([(id)objc_opt_class() keepInSync])
    {
      id location = 0;
      objc_initWeak(&location, v2);
      v10 = objc_msgSend((id)FPAppRegistryDidUpdateAppsNotification, "fp_libnotifyPerUserNotificationName");
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __21__FPAppRegistry_init__block_invoke;
      v16[3] = &unk_1E5AF06A0;
      objc_copyWeak(&v17, &location);
      v2->_updateAppsNotification = [(FPAppRegistry *)v2 _registerForNotification:v10 handler:v16];
      v11 = v2->_syncQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __21__FPAppRegistry_init__block_invoke_2;
      block[3] = &unk_1E5AF0FF0;
      v15 = v2;
      dispatch_async(v11, block);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      v2->_updateAppsNotification = -1;
    }
    v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[FPAppRegistry init]();
    }
  }
  return v2;
}

- (int)_registerForNotification:(id)a3 handler:(id)a4
{
  int out_token = -1;
  id v6 = a3;
  id v7 = a4;
  LODWORD(self) = notify_register_dispatch((const char *)[v6 UTF8String], &out_token, (dispatch_queue_t)self->_syncQueue, v7);

  if (self) {
    return -1;
  }
  else {
    return out_token;
  }
}

+ (BOOL)keepInSync
{
  return 1;
}

- (void)updateAppList
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] can't fetch list of monitored apps; %@",
    v4,
    0xCu);
}

- (void)_setApps:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  uint64_t v5 = [(NSMutableDictionary *)self->_appMetadataByBundleID allKeys];
  id v6 = (void *)[v5 mutableCopy];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "bundleID", (void)v13);
        [v6 removeObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [(FPAppRegistry *)self _addApps:v7];
  [(FPAppRegistry *)self _removeAppsWithBundleIDs:v6];
}

- (void)_removeAppsWithBundleIDs:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v25 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v12 = [(NSMutableDictionary *)self->_appMetadataByBundleID objectForKeyedSubscript:v11];
          long long v13 = v12;
          if (v12)
          {
            long long v14 = [v12 bundleID];
            [v5 addObject:v14];

            long long v15 = fp_default_log();
            BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

            if (v16)
            {
              id v17 = fp_current_or_default_log();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v31 = v13;
                _os_log_debug_impl(&dword_1A33AE000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] removed %@", buf, 0xCu);
              }
            }
            [(NSMutableDictionary *)self->_appMetadataByBundleID setObject:0 forKeyedSubscript:v11];
            uint64_t v18 = [(FPAppRegistry *)self _bundleIDForHomonymOfApp:v13];

            if (!v18)
            {
              appMetadataByDisplayName = self->_appMetadataByDisplayName;
              v20 = [v13 displayName];
              [(NSMutableDictionary *)appMetadataByDisplayName setObject:0 forKeyedSubscript:v20];
            }
          }
          else
          {
            [(NSMutableDictionary *)self->_appMetadataByBundleID setObject:0 forKeyedSubscript:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v8);
    }

    uint64_t v21 = [(FPAppRegistry *)self delegate];
    if (v21)
    {
      v22 = (void *)v21;
      uint64_t v23 = [v5 count];

      if (v23)
      {
        v24 = [(FPAppRegistry *)self delegate];
        [v24 appRegistry:self didRemoveAppsWithBundleIDs:v5];
      }
    }

    id v4 = v25;
  }
}

- (void)_addApps:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v29 = v4;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v32;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
          appMetadataByBundleID = self->_appMetadataByBundleID;
          v12 = [v10 bundleID];
          long long v13 = [(NSMutableDictionary *)appMetadataByBundleID objectForKeyedSubscript:v12];

          long long v14 = fp_default_log();
          LODWORD(v12) = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);

          if (v12)
          {
            long long v15 = [(FPAppRegistry *)self _bundleIDForHomonymOfApp:v10];
            BOOL v16 = fp_current_or_default_log();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              if (v13) {
                uint64_t v23 = @"updated";
              }
              else {
                uint64_t v23 = @"added";
              }
              v24 = &stru_1EF68D1F8;
              if (v15)
              {
                v30 = [NSString stringWithFormat:@" [override homonym %@]", v15];
                v24 = v30;
              }
              *(_DWORD *)buf = 138412802;
              v36 = v23;
              __int16 v37 = 2112;
              v38 = v10;
              __int16 v39 = 2112;
              v40 = v24;
              _os_log_debug_impl(&dword_1A33AE000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ %@%@", buf, 0x20u);
              if (v15) {
            }
              }
          }
          if (v13)
          {
            appMetadataByDisplayName = self->_appMetadataByDisplayName;
            uint64_t v18 = [v13 displayName];
            [(NSMutableDictionary *)appMetadataByDisplayName setObject:0 forKeyedSubscript:v18];
          }
          objc_super v19 = self->_appMetadataByBundleID;
          v20 = [v10 bundleID];
          [(NSMutableDictionary *)v19 setObject:v10 forKeyedSubscript:v20];

          uint64_t v21 = self->_appMetadataByDisplayName;
          v22 = [v10 displayName];
          [(NSMutableDictionary *)v21 setObject:v10 forKeyedSubscript:v22];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v25 = [v5 countByEnumeratingWithState:&v31 objects:v41 count:16];
        uint64_t v7 = v25;
      }
      while (v25);
    }

    long long v26 = [(FPAppRegistry *)self delegate];

    id v4 = v29;
    if (v26)
    {
      long long v27 = fp_current_or_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[FPAppRegistry _addApps:](v5, v27);
      }

      long long v28 = [(FPAppRegistry *)self delegate];
      [v28 appRegistry:self didUpdateApps:v5];
    }
  }
}

- (FPAppRegistryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FPAppRegistryDelegate *)WeakRetained;
}

- (id)promoteItemToAppLibraryIfNeeded:(id)a3
{
  id v4 = a3;
  char v12 = 0;
  id v11 = 0;
  BOOL v5 = [(FPAppRegistry *)self _isAppLibrary:v4 appMetadata:&v11 userVisible:&v12];
  id v6 = v11;
  if (v5)
  {
    uint64_t v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[FPAppRegistry promoteItemToAppLibraryIfNeeded:]();
    }

    [v4 setIsContainer:1];
    objc_msgSend(v4, "setCapabilities:", objc_msgSend(v4, "capabilities") & 0xFFFFFFFFFFFFFFF7);
    objc_msgSend(v4, "setCapabilities:", objc_msgSend(v4, "capabilities") & 0xFFFFFFFFFFFFFFFBLL);
    objc_msgSend(v4, "setCapabilities:", objc_msgSend(v4, "capabilities") & 0xFFFFFFFFFFFFFFEFLL);
    uint64_t v8 = objc_msgSend(v4, "fp_appContainerBundleIdentifier");

    if (!v8)
    {
      uint64_t v9 = [v6 bundleID];
      objc_msgSend(v4, "setFp_appContainerBundleIdentifier:", v9);
    }
  }
  else
  {
    [v4 setIsContainer:0];
    objc_msgSend(v4, "setFp_appContainerBundleIdentifier:", 0);
  }

  return v4;
}

- (BOOL)_isAppLibrary:(id)a3 appMetadata:(id *)a4 userVisible:(BOOL *)a5
{
  id v8 = a3;
  uint64_t v9 = v8;
  if (v8 && [v8 isFolder])
  {
    uint64_t v10 = [v9 itemIdentifier];
    char v11 = [v10 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"];

    long long v13 = [v9 parentItemIdentifier];
    int v12 = [v13 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"];

    LOBYTE(v13) = 0;
    if ((v11 & 1) == 0 && v12)
    {
      long long v14 = [v9 providerID];
      int v15 = objc_msgSend(v14, "fp_isiCloudDriveOrCloudDocsIdentifier");

      if (v15)
      {
        long long v13 = [v9 cloudContainerIdentifier];

        if (!v13)
        {
          id v17 = 0;
          goto LABEL_24;
        }
        BOOL v16 = objc_msgSend(v9, "fp_appContainerBundleIdentifier");
        id v17 = [(FPAppRegistry *)self appForBundleID:v16];
      }
      else
      {
        objc_super v19 = [v9 displayName];
        id v17 = [(FPAppRegistry *)self appForDisplayName:v19];

        if (!v17)
        {
          LOBYTE(v13) = 0;
          goto LABEL_24;
        }
      }
      if (a4) {
        *a4 = v17;
      }
      if (!a5) {
        goto LABEL_18;
      }
      if ([v9 isContainerPristine])
      {
        *a5 = 0;
        v20 = fp_current_or_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[FPAppRegistry _isAppLibrary:appMetadata:userVisible:]();
        }
      }
      else
      {
        uint64_t v21 = [v17 providerDomainID];
        if (!v21) {
          goto LABEL_21;
        }
        v22 = (void *)v21;
        uint64_t v23 = [v17 providerDomainID];
        v24 = [v9 providerDomainID];
        char v25 = [v23 isEqualToString:v24];

        if (v25)
        {
LABEL_21:
          LOBYTE(v13) = 1;
          *a5 = 1;
          goto LABEL_24;
        }
        long long v26 = [v9 childItemCount];
        if (v26)
        {
          long long v27 = [v9 childItemCount];
          BOOL v28 = [v27 integerValue] > 0
             || [v9 folderType] == 2
             || [v9 folderType] == 3;
          *a5 = v28;
        }
        else
        {
          *a5 = 1;
        }

        if (*a5)
        {
LABEL_18:
          LOBYTE(v13) = 1;
LABEL_24:

          goto LABEL_9;
        }
        v20 = fp_current_or_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[FPAppRegistry _isAppLibrary:appMetadata:userVisible:]();
        }
      }

      goto LABEL_18;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }
LABEL_9:

  return (char)v13;
}

- (id)appForBundleID:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    long long v13 = &v12;
    uint64_t v14 = 0x3032000000;
    int v15 = __Block_byref_object_copy__27;
    BOOL v16 = __Block_byref_object_dispose__27;
    id v17 = 0;
    syncQueue = self->_syncQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__FPAppRegistry_appForBundleID___block_invoke;
    block[3] = &unk_1E5AF17F8;
    char v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(syncQueue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (FPAppRegistry)sharedRegistry
{
  id v2 = a1;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)_sharedRegistry;
  if (!_sharedRegistry)
  {
    id v4 = objc_alloc_init(FPAppRegistry);
    BOOL v5 = (void *)_sharedRegistry;
    _sharedRegistry = (uint64_t)v4;

    uint64_t v3 = (void *)_sharedRegistry;
  }
  id v6 = v3;
  objc_sync_exit(v2);

  return (FPAppRegistry *)v6;
}

uint64_t __21__FPAppRegistry_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAppList];
}

uint64_t __36__FPAppRegistry_listOfMonitoredApps__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) allValues];

  return MEMORY[0x1F41817F8]();
}

- (NSArray)listOfMonitoredApps
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__27;
  id v10 = __Block_byref_object_dispose__27;
  id v11 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__FPAppRegistry_listOfMonitoredApps__block_invoke;
  v5[3] = &unk_1E5AF2168;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __21__FPAppRegistry_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateAppList];
}

- (void)dealloc
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] dealloc %@", v2, v3, v4, v5, v6);
}

+ (void)setSharedRegistry:(id)a3
{
  id v4 = a3;
  id obj = a1;
  objc_sync_enter(obj);
  uint64_t v5 = (void *)_sharedRegistry;
  _sharedRegistry = (uint64_t)v4;

  objc_sync_exit(obj);
}

+ (FPAppRegistryDaemonConnectionOverride)daemonConnectionOverride
{
  return (FPAppRegistryDaemonConnectionOverride *)(id)_daemonConnectionOverride;
}

+ (void)setDaemonConnectionOverride:(id)a3
{
  objc_storeStrong((id *)&_daemonConnectionOverride, a3);
  id v4 = a3;
  uint64_t v5 = objc_msgSend((id)FPAppRegistryDidUpdateAppsNotification, "fp_libnotifyPerUserNotificationName");

  id v6 = v5;
  notify_post((const char *)[v6 UTF8String]);
}

- (BOOL)isAppLibrary:(id)a3
{
  return [(FPAppRegistry *)self _isAppLibrary:a3 appMetadata:0 userVisible:0];
}

uint64_t __32__FPAppRegistry_appForBundleID___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (id)appForDisplayName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    long long v13 = &v12;
    uint64_t v14 = 0x3032000000;
    int v15 = __Block_byref_object_copy__27;
    BOOL v16 = __Block_byref_object_dispose__27;
    id v17 = 0;
    syncQueue = self->_syncQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__FPAppRegistry_appForDisplayName___block_invoke;
    block[3] = &unk_1E5AF17F8;
    id v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(syncQueue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __35__FPAppRegistry_appForDisplayName___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)addApps:(id)a3
{
  id v4 = a3;
  syncQueue = self->_syncQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__FPAppRegistry_addApps___block_invoke;
  v7[3] = &unk_1E5AF0748;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(syncQueue, v7);
}

uint64_t __25__FPAppRegistry_addApps___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addApps:*(void *)(a1 + 40)];
}

- (void)removeAppsWithBundleIDs:(id)a3
{
  id v4 = a3;
  syncQueue = self->_syncQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__FPAppRegistry_removeAppsWithBundleIDs___block_invoke;
  v7[3] = &unk_1E5AF0748;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(syncQueue, v7);
}

uint64_t __41__FPAppRegistry_removeAppsWithBundleIDs___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeAppsWithBundleIDs:*(void *)(a1 + 40)];
}

- (id)_bundleIDForHomonymOfApp:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    appMetadataByDisplayName = self->_appMetadataByDisplayName;
    id v7 = [v4 displayName];
    id v8 = [(NSMutableDictionary *)appMetadataByDisplayName objectForKeyedSubscript:v7];

    if (v8
      && ([v5 bundleID],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          [v8 bundleID],
          id v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v9 isEqualToString:v10],
          v10,
          v9,
          (v11 & 1) == 0))
    {
      uint64_t v12 = [v8 bundleID];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_appMetadataByDisplayName, 0);

  objc_storeStrong((id *)&self->_appMetadataByBundleID, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] init %@", v2, v3, v4, v5, v6);
}

- (void)promoteItemToAppLibraryIfNeeded:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2080;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1A33AE000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] promoting %@ to%s app-library", v2, 0x16u);
}

- (void)_addApps:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] informing delegate of %lu new apps", v3, 0xCu);
}

- (void)_isAppLibrary:appMetadata:userVisible:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] hidding pristine container for %@", v2, v3, v4, v5, v6);
}

- (void)_isAppLibrary:appMetadata:userVisible:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] hidding empty non-default container for %@", v2, v3, v4, v5, v6);
}

@end