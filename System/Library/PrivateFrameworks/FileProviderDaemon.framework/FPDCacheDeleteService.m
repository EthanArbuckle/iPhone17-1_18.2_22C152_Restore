@interface FPDCacheDeleteService
+ (FPDCacheDeleteService)sharedInstance;
- (BOOL)getVolume:(int *)a3 forPath:(id)a4;
- (BOOL)isCacheDeleteCacheable;
- (FPDCacheDeleteService)init;
- (FPDExtensionManager)extensionManager;
- (id)allStorageVolumes;
- (id)nonPurgableSpacePerProviderOnVolume:(id)a3;
- (void)enumerateFPFSDomainsUsingBlock:(id)a3;
- (void)enumerateProviderDomainOnVolume:(id)a3 usingBlock:(id)a4;
- (void)registerActivity;
- (void)registerCacheDeleteCallbacks;
- (void)registerKey:(id)a3 notificationsUpdatesHandlers:(id)a4;
- (void)setExtensionManager:(id)a3;
- (void)start;
- (void)unregisterKey:(id)a3;
@end

@implementation FPDCacheDeleteService

- (FPDCacheDeleteService)init
{
  v11.receiver = self;
  v11.super_class = (Class)FPDCacheDeleteService;
  v2 = [(FPDCacheDeleteService *)&v11 init];
  v3 = v2;
  if (v2)
  {
    cacheDeleteServiceName = v2->_cacheDeleteServiceName;
    v2->_cacheDeleteServiceName = (NSString *)@"com.apple.FileProvider.cache-delete";

    uint64_t v5 = objc_opt_new();
    cdNotificationsHandlers = v3->_cdNotificationsHandlers;
    v3->_cdNotificationsHandlers = (NSMutableDictionary *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("FPDCacheDeleteService notification queue", v7);
    notificationsHandlersQueue = v3->_notificationsHandlersQueue;
    v3->_notificationsHandlersQueue = (OS_dispatch_queue *)v8;

    v3->_cacheDeleteCacheable = CacheDeleteCacheable();
  }
  return v3;
}

- (void)start
{
  [(FPDCacheDeleteService *)self registerCacheDeleteCallbacks];
  [(FPDCacheDeleteService *)self registerActivity];
}

- (void)registerCacheDeleteCallbacks
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_4_2(&dword_1D744C000, v0, v1, "[ERROR] Failed to register %@ as a cache delete service (%d)");
}

uint64_t __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke_cold_1();
  }

  v6 = [v4 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  if (FPIsSpaceAttributionEnabledAndUsedByStorageUI())
  {
    v12[0] = @"CACHE_DELETE_VOLUME";
    v12[1] = @"CACHE_DELETE_AMOUNT";
    v13[0] = v6;
    v13[1] = &unk_1F2EDBC10;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  }
  else
  {
    v10[0] = @"CACHE_DELETE_VOLUME";
    v10[1] = @"CACHE_DELETE_AMOUNT";
    v11[0] = v6;
    v11[1] = &unk_1F2EDBC10;
    v10[2] = @"CACHE_DELETE_ITEMIZED_NONPURGEABLE";
    dispatch_queue_t v8 = [*(id *)(a1 + 32) nonPurgableSpacePerProviderOnVolume:v6];
    v11[2] = v8;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  }
  return v7;
}

uint64_t __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke_17(uint64_t a1, uint64_t a2, void *a3)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke_17_cold_1();
  }

  uint64_t v5 = [v3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  v8[0] = @"CACHE_DELETE_VOLUME";
  v8[1] = @"CACHE_DELETE_AMOUNT";
  v9[0] = v5;
  v9[1] = &unk_1F2EDBC10;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

void __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke_18(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [a2 objectForKey:@"CACHE_DELETE_CACHE_ENABLED"];
    int v5 = [v4 BOOLValue];

    uint64_t v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke_18_cold_1(v5, v6);
    }

    uint64_t v7 = (NSObject **)WeakRetained;
    objc_sync_enter(v7);
    if (*((unsigned __int8 *)v7 + 32) != v5)
    {
      *((unsigned char *)v7 + 32) = v5;
      dispatch_queue_t v8 = v7[3];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke_22;
      block[3] = &unk_1E6A73FE8;
      v10 = v7;
      dispatch_async(v8, block);
    }
    objc_sync_exit(v7);
  }
}

void __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke_22(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  os_log_t v1 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "allValues", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5++) + 16))();
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (id)nonPurgableSpacePerProviderOnVolume:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__FPDCacheDeleteService_nonPurgableSpacePerProviderOnVolume___block_invoke;
  v19[3] = &unk_1E6A74C58;
  v19[4] = &v20;
  [(FPDCacheDeleteService *)self enumerateProviderDomainOnVolume:v4 usingBlock:v19];
  if (*((unsigned char *)v21 + 24))
  {
    long long v6 = [(FPDExtensionManager *)self->_extensionManager nonEvictableSizeByProviderDomain];
    long long v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[FPDCacheDeleteService nonPurgableSpacePerProviderOnVolume:]((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__FPDCacheDeleteService_nonPurgableSpacePerProviderOnVolume___block_invoke_26;
    v16[3] = &unk_1E6A74C80;
    id v17 = v5;
    id v14 = v6;
    id v18 = v14;
    [(FPDCacheDeleteService *)self enumerateProviderDomainOnVolume:v4 usingBlock:v16];
  }
  _Block_object_dispose(&v20, 8);

  return v5;
}

uint64_t __61__FPDCacheDeleteService_nonPurgableSpacePerProviderOnVolume___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __61__FPDCacheDeleteService_nonPurgableSpacePerProviderOnVolume___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  id v5 = a3;
  long long v6 = *(void **)(a1 + 32);
  long long v7 = [v5 providerID];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v5 providerID];
    [v9 setObject:&unk_1F2EDBC10 forKeyedSubscript:v10];
  }
  uint64_t v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v21];

  if (v11)
  {
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = [v5 providerID];
    id v14 = [v12 objectForKeyedSubscript:v13];
    uint64_t v15 = [v14 longLongValue];

    v16 = [*(id *)(a1 + 40) objectForKeyedSubscript:v21];
    uint64_t v17 = [v16 longLongValue];

    id v18 = [NSNumber numberWithLongLong:v17 + v15];
    v19 = *(void **)(a1 + 32);
    uint64_t v20 = [v5 providerID];
    [v19 setObject:v18 forKeyedSubscript:v20];
  }
}

- (void)registerActivity
{
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v2 = (const char *)[(id)FPDCacheDeletePushXPCActivityId UTF8String];
  uint64_t v3 = (void *)*MEMORY[0x1E4F14158];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__FPDCacheDeleteService_registerActivity__block_invoke;
  v4[3] = &unk_1E6A736E8;
  objc_copyWeak(&v5, &location);
  xpc_activity_register(v2, v3, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __41__FPDCacheDeleteService_registerActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  xpc_activity_t activity = v3;
  if (FPIsSpaceAttributionEnabledAndUsedByStorageUI())
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __41__FPDCacheDeleteService_registerActivity__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }

    xpc_activity_unregister((const char *)[(id)FPDCacheDeletePushXPCActivityId UTF8String]);
    goto LABEL_57;
  }
  if (xpc_activity_get_state(v3))
  {
    uint64_t section = __fp_create_section();
    uint64_t v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __41__FPDCacheDeleteService_registerActivity__block_invoke_cold_5();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v13 = WeakRetained;
    if (WeakRetained)
    {
      id v14 = activity;
      if (xpc_activity_should_defer(v14))
      {
        uint64_t v15 = fp_current_or_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          __41__FPDCacheDeleteService_registerActivity__block_invoke_cold_3(v15, v16, v17, v18, v19, v20, v21, v22);
        }

        char v23 = v14;
        if (!xpc_activity_set_state(v14, 3))
        {
          v24 = fp_current_or_default_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D744C000, v24, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the state", buf, 2u);
          }

          char v23 = v14;
        }
        goto LABEL_55;
      }
      v54 = v14;

      if (!FPDCacheDeletePushXPCActivityId_block_invoke_alreadyProcessedVolumePaths)
      {
        uint64_t v36 = [MEMORY[0x1E4F1CA80] set];
        v37 = (void *)FPDCacheDeletePushXPCActivityId_block_invoke_alreadyProcessedVolumePaths;
        FPDCacheDeletePushXPCActivityId_block_invoke_alreadyProcessedVolumePaths = v36;
      }
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      char v23 = [WeakRetained allStorageVolumes];
      uint64_t v38 = [v23 countByEnumeratingWithState:&v58 objects:v67 count:16];
      if (v38)
      {
        uint64_t v39 = *(void *)v59;
LABEL_27:
        uint64_t v40 = 0;
        while (1)
        {
          if (*(void *)v59 != v39) {
            objc_enumerationMutation(v23);
          }
          v41 = *(void **)(*((void *)&v58 + 1) + 8 * v40);
          v42 = (void *)MEMORY[0x1D9471CC0]();
          v43 = [v41 path];
          if ([(id)FPDCacheDeletePushXPCActivityId_block_invoke_alreadyProcessedVolumePaths containsObject:v43])
          {
            v44 = fp_current_or_default_log();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v66 = v43;
              _os_log_debug_impl(&dword_1D744C000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] Ignoring already processed volume: %@", buf, 0xCu);
            }
            int v45 = 5;
          }
          else
          {
            v46 = fp_current_or_default_log();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v66 = v43;
              _os_log_debug_impl(&dword_1D744C000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] Processing volume %@", buf, 0xCu);
            }

            v44 = v14;
            if (xpc_activity_should_defer((xpc_activity_t)v44))
            {
              v47 = fp_current_or_default_log();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
                __41__FPDCacheDeleteService_registerActivity__block_invoke_cold_4(&v56, v57, v47);
              }

              if (!xpc_activity_set_state((xpc_activity_t)v44, 3))
              {
                v48 = fp_current_or_default_log();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D744C000, v48, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the state", buf, 2u);
                }
              }
              int v45 = 1;
            }
            else
            {

              v44 = [WeakRetained nonPurgableSpacePerProviderOnVolume:v43];
              uint64_t v49 = WeakRetained[1];
              v63[0] = @"CACHE_DELETE_ID";
              v63[1] = @"CACHE_DELETE_VOLUME";
              v64[0] = v49;
              v64[1] = v43;
              v63[2] = @"CACHE_DELETE_ITEMIZED_NONPURGEABLE";
              v63[3] = @"CACHE_DELETE_AMOUNT";
              v64[2] = v44;
              v64[3] = &unk_1F2EDBC10;
              v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:4];
              v51 = fp_current_or_default_log();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v66 = v50;
                _os_log_debug_impl(&dword_1D744C000, v51, OS_LOG_TYPE_DEBUG, "[DEBUG] Returning purgeable info: %@", buf, 0xCu);
              }

              CacheDeleteUpdatePurgeable();
              [(id)FPDCacheDeletePushXPCActivityId_block_invoke_alreadyProcessedVolumePaths addObject:v43];

              int v45 = 0;
            }
          }

          if (v45 != 5)
          {
            if (v45) {
              goto LABEL_55;
            }
          }
          if (v38 == ++v40)
          {
            uint64_t v38 = [v23 countByEnumeratingWithState:&v58 objects:v67 count:16];
            if (v38) {
              goto LABEL_27;
            }
            break;
          }
        }
      }

      v52 = (void *)FPDCacheDeletePushXPCActivityId_block_invoke_alreadyProcessedVolumePaths;
      FPDCacheDeletePushXPCActivityId_block_invoke_alreadyProcessedVolumePaths = 0;

      uint64_t v13 = WeakRetained;
      if (!xpc_activity_set_state(v54, 5))
      {
        char v23 = fp_current_or_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          goto LABEL_54;
        }
        goto LABEL_55;
      }
    }
    else if (!xpc_activity_set_state(activity, 5))
    {
      char v23 = fp_current_or_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
LABEL_54:
        _os_log_impl(&dword_1D744C000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to set the xpc state to done", buf, 2u);
      }
LABEL_55:

      uint64_t v13 = WeakRetained;
    }

    __fp_leave_section_Debug();
    goto LABEL_57;
  }
  xpc_object_t v25 = xpc_activity_copy_criteria(v3);

  if (!v25)
  {
    v26 = fp_current_or_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      __41__FPDCacheDeleteService_registerActivity__block_invoke_cold_2(v26, v27, v28, v29, v30, v31, v32, v33);
    }

    xpc_object_t v34 = xpc_dictionary_create(0, 0, 0);
    int64_t v35 = *MEMORY[0x1E4F14218];
    xpc_dictionary_set_int64(v34, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F14218]);
    xpc_dictionary_set_int64(v34, (const char *)*MEMORY[0x1E4F141A8], v35);
    xpc_dictionary_set_BOOL(v34, (const char *)*MEMORY[0x1E4F142F8], 1);
    xpc_dictionary_set_BOOL(v34, (const char *)*MEMORY[0x1E4F14340], 1);
    xpc_dictionary_set_BOOL(v34, (const char *)*MEMORY[0x1E4F14138], 0);
    xpc_dictionary_set_string(v34, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
    xpc_activity_set_criteria(v3, v34);
  }
LABEL_57:
}

- (BOOL)getVolume:(int *)a3 forPath:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memset(&v9, 0, sizeof(v9));
  id v5 = a4;
  int v6 = lstat((const char *)[v5 fileSystemRepresentation], &v9);
  if (v6 < 0)
  {
    uint64_t v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] unable to stat volume %@", buf, 0xCu);
    }
  }
  else
  {
    *a3 = v9.st_dev;
  }

  return v6 >= 0;
}

- (void)enumerateFPFSDomainsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(FPDExtensionManager *)self->_extensionManager providerDomainsByID];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__FPDCacheDeleteService_enumerateFPFSDomainsUsingBlock___block_invoke;
  v7[3] = &unk_1E6A74CA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

void __56__FPDCacheDeleteService_enumerateFPFSDomainsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v7 = objc_msgSend(v11, "fp_toProviderID");
  id v8 = [v6 providerWithIdentifier:v7 reason:0];

  if (v8)
  {
    stat v9 = objc_msgSend(v11, "fp_toDomainIdentifier");
    uint64_t v10 = [v8 domainForIdentifier:v9 reason:0];

    if (v10 && [v10 isUsingFPFS]) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (id)allStorageVolumes
{
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__FPDCacheDeleteService_allStorageVolumes__block_invoke;
  v6[3] = &unk_1E6A74CD0;
  id v4 = v3;
  id v7 = v4;
  [(FPDCacheDeleteService *)self enumerateFPFSDomainsUsingBlock:v6];

  return v4;
}

void __42__FPDCacheDeleteService_allStorageVolumes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [a3 storageURLs];
  uint64_t v3 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v27;
    uint64_t v7 = *MEMORY[0x1E4F1C960];
    uint64_t v8 = *MEMORY[0x1E4F281F8];
    *(void *)&long long v4 = 138412546;
    long long v21 = v4;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
        id v24 = 0;
        id v25 = 0;
        int v11 = objc_msgSend(v10, "getResourceValue:forKey:error:", &v25, v7, &v24, v21);
        id v12 = v25;
        id v13 = v24;
        id v14 = v13;
        if (v11) {
          BOOL v15 = v12 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15)
        {
          [*(id *)(a1 + 32) addObject:v12];
          goto LABEL_18;
        }
        uint64_t v16 = [v13 domain];
        if ([v16 isEqualToString:v8])
        {
          uint64_t v17 = [v14 code];

          if (v17 == 260) {
            goto LABEL_18;
          }
        }
        else
        {
        }
        uint64_t v18 = fp_current_or_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = objc_msgSend(v10, "fp_shortDescription");
          uint64_t v20 = objc_msgSend(v14, "fp_prettyDescription");
          *(_DWORD *)buf = v21;
          uint64_t v31 = v19;
          __int16 v32 = 2112;
          uint64_t v33 = v20;
          _os_log_error_impl(&dword_1D744C000, v18, OS_LOG_TYPE_ERROR, "[ERROR] unable to get volume for storage URL %@ (%@)", buf, 0x16u);
        }
LABEL_18:

        ++v9;
      }
      while (v5 != v9);
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v5);
  }
}

- (void)enumerateProviderDomainOnVolume:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  int v10 = 0;
  if ([(FPDCacheDeleteService *)self getVolume:&v10 forPath:a3])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__FPDCacheDeleteService_enumerateProviderDomainOnVolume_usingBlock___block_invoke;
    v7[3] = &unk_1E6A74CF8;
    v7[4] = self;
    int v9 = v10;
    id v8 = v6;
    [(FPDCacheDeleteService *)self enumerateFPFSDomainsUsingBlock:v7];
  }
}

void __68__FPDCacheDeleteService_enumerateProviderDomainOnVolume_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 storageURLs];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    int v9 = [v6 storageURLs];
    int v10 = [v9 objectAtIndexedSubscript:0];

    int v15 = 0;
    int v11 = *(void **)(a1 + 32);
    id v12 = [v10 path];
    if ([v11 getVolume:&v15 forPath:v12])
    {
      int v13 = v15;
      int v14 = *(_DWORD *)(a1 + 48);

      if (v13 == v14) {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    else
    {
    }
  }
}

- (void)registerKey:(id)a3 notificationsUpdatesHandlers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  int v9 = (void *)MEMORY[0x1D9471EC0](v7);
  [(NSMutableDictionary *)v8->_cdNotificationsHandlers setObject:v9 forKeyedSubscript:v6];

  notificationsHandlersQueue = v8->_notificationsHandlersQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __66__FPDCacheDeleteService_registerKey_notificationsUpdatesHandlers___block_invoke;
  v12[3] = &unk_1E6A74AA8;
  v12[4] = v8;
  id v13 = v7;
  id v11 = v7;
  dispatch_async(notificationsHandlersQueue, v12);

  objc_sync_exit(v8);
}

uint64_t __66__FPDCacheDeleteService_registerKey_notificationsUpdatesHandlers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(*(void *)(a1 + 32) + 32));
}

- (void)unregisterKey:(id)a3
{
  id v5 = a3;
  long long v4 = self;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)v4->_cdNotificationsHandlers removeObjectForKey:v5];
  objc_sync_exit(v4);
}

- (BOOL)isCacheDeleteCacheable
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL cacheDeleteCacheable = v2->_cacheDeleteCacheable;
  objc_sync_exit(v2);

  return cacheDeleteCacheable;
}

+ (FPDCacheDeleteService)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__FPDCacheDeleteService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, block);
  }
  uint64_t v2 = (void *)sharedInstance_sharedInstance;
  return (FPDCacheDeleteService *)v2;
}

uint64_t __39__FPDCacheDeleteService_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (FPDExtensionManager)extensionManager
{
  return self->_extensionManager;
}

- (void)setExtensionManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_notificationsHandlersQueue, 0);
  objc_storeStrong((id *)&self->_cdNotificationsHandlers, 0);
  objc_storeStrong((id *)&self->_cacheDeleteServiceName, 0);
}

void __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_5_2(&dword_1D744C000, v0, v1, "[DEBUG] Purgeable request with urgency %d: %@");
}

void __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke_17_cold_1()
{
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_5_2(&dword_1D744C000, v0, v1, "[DEBUG] Purge request with urgency %d: %@");
}

void __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke_18_cold_1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] FPDCacheDeleteService: cache enabled update: %{BOOL}d", (uint8_t *)v2, 8u);
}

- (void)nonPurgableSpacePerProviderOnVolume:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __41__FPDCacheDeleteService_registerActivity__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __41__FPDCacheDeleteService_registerActivity__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __41__FPDCacheDeleteService_registerActivity__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __41__FPDCacheDeleteService_registerActivity__block_invoke_cold_4(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] defering processing", buf, 2u);
}

void __41__FPDCacheDeleteService_registerActivity__block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] ┏%llx pushing purgeable update to cache delete", v2, v3, v4, v5, 0);
}

@end