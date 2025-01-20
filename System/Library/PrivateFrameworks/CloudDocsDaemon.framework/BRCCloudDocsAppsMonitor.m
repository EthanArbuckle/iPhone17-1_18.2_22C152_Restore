@interface BRCCloudDocsAppsMonitor
+ (id)cloudDocsAppsMonitor;
- (BOOL)hasFetchedInitialApps;
- (BOOL)isApplicationInstalledForContainerID:(id)a3;
- (BRCCloudDocsAppsMonitor)init;
- (id)allApplicationIdentifiers;
- (id)applicationIdentifiersForContainerID:(id)a3;
- (id)containerIDsForApplicationIdentifier:(id)a3;
- (void)_refetchApps;
- (void)_start;
- (void)addObserver:(id)a3;
- (void)allApplicationIdentifiers;
- (void)dumpToContext:(id)a3;
- (void)forceRefetchAppList;
- (void)removeObserver:(id)a3;
@end

@implementation BRCCloudDocsAppsMonitor

- (BOOL)hasFetchedInitialApps
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__BRCCloudDocsAppsMonitor_hasFetchedInitialApps__block_invoke;
  v5[3] = &unk_1E6996218;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__BRCCloudDocsAppsMonitor_hasFetchedInitialApps__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 64);
  return result;
}

- (void)_refetchApps
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx refetching installed apps list%@");
}

void __39__BRCCloudDocsAppsMonitor__refetchApps__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D9438760]();
  v5 = BREntitledContainerIdentifiersForProxy();
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v3;
      uint64_t v6 = [v3 applicationIdentifier];
      v7 = *(void **)(a1 + 32);
      uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
      [v7 setObject:v8 forKey:v6];

      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v9 = v5;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
            v15 = [*(id *)(a1 + 40) objectForKeyedSubscript:v14];
            if (!v15)
            {
              v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
              [*(id *)(a1 + 40) setObject:v15 forKeyedSubscript:v14];
            }
            [v15 addObject:v6];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v11);
      }

      id v3 = v16;
    }
  }
}

void __39__BRCCloudDocsAppsMonitor__refetchApps__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
}

void __39__BRCCloudDocsAppsMonitor__refetchApps__block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "cloudDocsAppsListDidChange:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)forceRefetchAppList
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D353B000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] forced a refetch of the list of apps%@", (uint8_t *)&v2, 0xCu);
}

- (void)_start
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx start monitoring cloud apps%@");
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  callbackQueue = self->_callbackQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__BRCCloudDocsAppsMonitor_addObserver___block_invoke;
  v7[3] = &unk_1E6993628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(callbackQueue, v7);
}

void __39__BRCCloudDocsAppsMonitor_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__52;
  long long v9 = __Block_byref_object_dispose__52;
  id v10 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__BRCCloudDocsAppsMonitor_addObserver___block_invoke_17;
  v4[3] = &unk_1E6996218;
  v4[4] = v2;
  v4[5] = &v5;
  dispatch_sync(v3, v4);
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  if (v6[5]) {
    objc_msgSend(*(id *)(a1 + 40), "cloudDocsAppsListDidChange:");
  }
  _Block_object_dispose(&v5, 8);
}

void __39__BRCCloudDocsAppsMonitor_addObserver___block_invoke_17(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  callbackQueue = self->_callbackQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__BRCCloudDocsAppsMonitor_removeObserver___block_invoke;
  v7[3] = &unk_1E6993628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(callbackQueue, v7);
}

uint64_t __42__BRCCloudDocsAppsMonitor_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

- (id)applicationIdentifiersForContainerID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v16, 0, sizeof(v16));
  __brc_create_section(0, (uint64_t)"-[BRCCloudDocsAppsMonitor applicationIdentifiersForContainerID:]", 146, v16);
  brc_bread_crumbs();
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)&buf[4] = v16[0];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2112;
    long long v18 = v5;
    _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx asked appIDs for %@%@", buf, 0x20u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  long long v18 = __Block_byref_object_copy__52;
  long long v19 = __Block_byref_object_dispose__52;
  id v20 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__BRCCloudDocsAppsMonitor_applicationIdentifiersForContainerID___block_invoke;
  v13[3] = &unk_1E69936C0;
  v15 = buf;
  v13[4] = self;
  id v8 = v4;
  id v14 = v8;
  dispatch_sync(queue, v13);
  long long v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[BRCCloudDocsAppsMonitor applicationIdentifiersForContainerID:]();
  }

  id v11 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  __brc_leave_section(v16);
  return v11;
}

void __64__BRCCloudDocsAppsMonitor_applicationIdentifiersForContainerID___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)containerIDsForApplicationIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v16, 0, sizeof(v16));
  __brc_create_section(0, (uint64_t)"-[BRCCloudDocsAppsMonitor containerIDsForApplicationIdentifier:]", 157, v16);
  brc_bread_crumbs();
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)&buf[4] = v16[0];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2112;
    long long v18 = v5;
    _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx asked containerIDs for %@%@", buf, 0x20u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  long long v18 = __Block_byref_object_copy__52;
  long long v19 = __Block_byref_object_dispose__52;
  id v20 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__BRCCloudDocsAppsMonitor_containerIDsForApplicationIdentifier___block_invoke;
  v13[3] = &unk_1E69936C0;
  v15 = buf;
  v13[4] = self;
  id v8 = v4;
  id v14 = v8;
  dispatch_sync(queue, v13);
  long long v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[BRCCloudDocsAppsMonitor applicationIdentifiersForContainerID:]();
  }

  id v11 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  __brc_leave_section(v16);
  return v11;
}

void __64__BRCCloudDocsAppsMonitor_containerIDsForApplicationIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)allApplicationIdentifiers
{
  memset(v17, 0, sizeof(v17));
  __brc_create_section(0, (uint64_t)"-[BRCCloudDocsAppsMonitor allApplicationIdentifiers]", 184, v17);
  uint64_t v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[BRCCloudDocsAppsMonitor allApplicationIdentifiers]();
  }

  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__52;
  v15 = __Block_byref_object_dispose__52;
  id v16 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__BRCCloudDocsAppsMonitor_allApplicationIdentifiers__block_invoke;
  block[3] = &unk_1E6996218;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(queue, block);
  id v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BRCCloudDocsAppsMonitor applicationIdentifiersForContainerID:]();
  }

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  __brc_leave_section(v17);
  return v8;
}

void __52__BRCCloudDocsAppsMonitor_allApplicationIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];
  uint64_t v3 = [v2 setWithArray:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)isApplicationInstalledForContainerID:(id)a3
{
  uint64_t v3 = [(BRCCloudDocsAppsMonitor *)self applicationIdentifiersForContainerID:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

+ (id)cloudDocsAppsMonitor
{
  if (cloudDocsAppsMonitor_once != -1) {
    dispatch_once(&cloudDocsAppsMonitor_once, &__block_literal_global_64);
  }
  uint64_t v2 = (void *)cloudDocsAppsMonitor_gMonitor;
  return v2;
}

void __47__BRCCloudDocsAppsMonitor_cloudDocsAppsMonitor__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  os_log_t v1 = (void *)cloudDocsAppsMonitor_gMonitor;
  cloudDocsAppsMonitor_gMonitor = v0;
}

- (BRCCloudDocsAppsMonitor)init
{
  v24.receiver = self;
  v24.super_class = (Class)BRCCloudDocsAppsMonitor;
  uint64_t v2 = [(BRCCloudDocsAppsMonitor *)&v24 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    BOOL v4 = dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.bird.apps-monitor", v4);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.bird.apps-monitor.fetch-apps", v8);

    fetchInstalledAppsQueue = v2->_fetchInstalledAppsQueue;
    v2->_fetchInstalledAppsQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(v11, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.bird.apps-monitor.callback", v12);

    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    observers = v2->_observers;
    v2->_observers = v15;

    long long v17 = +[BRCUserDefaults defaultsForMangledID:0];
    [v17 appsFetchPacerDelay];
    uint64_t v18 = br_pacer_create();
    refetchPacer = v2->_refetchPacer;
    v2->_refetchPacer = (br_pacer *)v18;

    objc_initWeak(&location, v2);
    uint64_t v21 = MEMORY[0x1E4F143A8];
    objc_copyWeak(&v22, &location);
    br_pacer_set_event_handler();
    br_pacer_resume();
    [(BRCCloudDocsAppsMonitor *)v2 _start];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __31__BRCCloudDocsAppsMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refetchApps];
}

- (void)dumpToContext:(id)a3
{
  id v4 = a3;
  [v4 writeLineWithFormat:@"apps monitor"];
  [v4 writeLineWithFormat:@"-----------------------------------------------------"];
  [v4 pushIndentation];
  [v4 writeLineWithFormat:@"app library IDs by App ID"];
  [v4 writeLineWithFormat:@"======================="];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__BRCCloudDocsAppsMonitor_dumpToContext___block_invoke;
  block[3] = &unk_1E6993628;
  id v6 = v4;
  id v16 = v6;
  long long v17 = self;
  dispatch_sync(queue, block);
  [v6 writeLineWithFormat:&stru_1F2AC7720];
  [v6 writeLineWithFormat:@"app IDs by app library IDs"];
  [v6 writeLineWithFormat:@"======================="];
  uint64_t v7 = self->_queue;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __41__BRCCloudDocsAppsMonitor_dumpToContext___block_invoke_2;
  uint64_t v12 = &unk_1E6993628;
  id v13 = v6;
  id v14 = self;
  id v8 = v6;
  dispatch_sync(v7, &v9);
  objc_msgSend(v8, "popIndentation", v9, v10, v11, v12);
  [v8 writeLineWithFormat:&stru_1F2AC7720];
}

uint64_t __41__BRCCloudDocsAppsMonitor_dumpToContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeLineWithFormat:@"%@", *(void *)(*(void *)(a1 + 40) + 8)];
}

uint64_t __41__BRCCloudDocsAppsMonitor_dumpToContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeLineWithFormat:@"%@", *(void *)(*(void *)(a1 + 40) + 16)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_fetchInstalledAppsQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_refetchPacer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_appIDsByAppLibraryID, 0);
  objc_storeStrong((id *)&self->_cloudDocsAppLibrariesByAppID, 0);
}

- (void)applicationIdentifiersForContainerID:.cold.1()
{
  OUTLINED_FUNCTION_2_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] returning %@%@");
}

- (void)allApplicationIdentifiers
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx asked appIDs%@");
}

@end