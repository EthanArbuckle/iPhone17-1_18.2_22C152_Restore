@interface FPProviderMonitor
+ (BOOL)isProviderIDForeground:(id)a3;
+ (id)providerIDForApplication:(id)a3 sharedContainerIdentifier:(id)a4;
- (BOOL)supportsWakesForProviderID:(id)a3;
- (BOOL)wakeProviderID:(id)a3 forSessionIdentifier:(id)a4;
- (FPProviderMonitor)init;
- (void)addObserver:(id)a3 forProviderID:(id)a4;
- (void)dealloc;
- (void)removeObserver:(id)a3 forProviderID:(id)a4;
@end

@implementation FPProviderMonitor

+ (BOOL)isProviderIDForeground:(id)a3
{
  id v3 = a3;
  if (isProviderIDForeground__onceToken != -1) {
    dispatch_once(&isProviderIDForeground__onceToken, &__block_literal_global_36);
  }
  int val = -1;
  v4 = FPNotifyNameForForegroundChangeWithProviderID(v3);
  v5 = [(id)isProviderIDForeground__tokensCache objectForKey:v3];
  v6 = v5;
  if (!v5 || (uint64_t v7 = [v5 intValue], val = v7, v7 == -1))
  {
    uint64_t v8 = [v4 UTF8String];
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    v9 = (void (*)(uint64_t, int *))getbrc_notify_register_checkSymbolLoc_ptr;
    v21 = getbrc_notify_register_checkSymbolLoc_ptr;
    if (!getbrc_notify_register_checkSymbolLoc_ptr)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __getbrc_notify_register_checkSymbolLoc_block_invoke;
      v16[3] = &unk_1E5AF1950;
      v17 = &v18;
      v10 = (void *)CloudDocsLibrary();
      v19[3] = (uint64_t)dlsym(v10, "brc_notify_register_check");
      getbrc_notify_register_checkSymbolLoc_ptr = *(_UNKNOWN **)(v17[1] + 24);
      v9 = (void (*)(uint64_t, int *))v19[3];
    }
    _Block_object_dispose(&v18, 8);
    if (!v9) {
      +[FPProviderMonitor isProviderIDForeground:]();
    }
    v9(v8, &val);
    if (!notify_is_valid_token(val))
    {
      BOOL v13 = 0;
      goto LABEL_12;
    }
    v11 = (void *)isProviderIDForeground__tokensCache;
    v12 = [NSNumber numberWithInt:val];
    [v11 setObject:v12 forKey:v3];

    uint64_t v7 = val;
  }
  v16[0] = 0;
  _brc_notify_get_state(v7, (uint64_t)v16, [v4 UTF8String]);
  BOOL v13 = v16[0] != 0;
LABEL_12:

  return v13;
}

+ (id)providerIDForApplication:(id)a3 sharedContainerIdentifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v16 = objc_msgSend(MEMORY[0x1E4F223B8], "applicationProxyForIdentifier:", a3, a4);
  v17 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v4 = [v16 plugInKitPlugins];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v10 = [v9 protocol];
        int v11 = [v10 isEqualToString:@"com.apple.fileprovider-nonui"];

        if (v11)
        {
          v12 = [v9 objectForInfoDictionaryKey:@"NSExtensionFileProviderDocumentGroup" ofClass:objc_opt_class() inScope:1];
          if ([v12 isEqualToString:v12]) {
            [v17 addObject:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  [v17 sortUsingComparator:&__block_literal_global_34];
  BOOL v13 = [v17 firstObject];
  v14 = [v13 bundleIdentifier];

  return v14;
}

- (FPProviderMonitor)init
{
  v11.receiver = self;
  v11.super_class = (Class)FPProviderMonitor;
  v2 = [(FPProviderMonitor *)&v11 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observersByContainerID = v2->_observersByContainerID;
    v2->_observersByContainerID = v3;

    uint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    notifyTokenByContainerID = v2->_notifyTokenByContainerID;
    v2->_notifyTokenByContainerID = v5;

    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.fileprovider.containers.monitor", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;
  }
  return v2;
}

- (void)dealloc
{
  if ([(NSMutableDictionary *)self->_notifyTokenByContainerID count]
    && [(NSMutableDictionary *)self->_notifyTokenByContainerID count])
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"FPProviderMonitor.m" lineNumber:91 description:@"There were observers remaining at dealloc time. Call -removeObserver:forContainerID: first."];
  }
  v5.receiver = self;
  v5.super_class = (Class)FPProviderMonitor;
  [(FPProviderMonitor *)&v5 dealloc];
}

uint64_t __72__FPProviderMonitor_providerIDForApplication_sharedContainerIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  objc_super v5 = [a2 bundleIdentifier];
  uint64_t v6 = [v4 bundleIdentifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)addObserver:(id)a3 forProviderID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t section = __fp_create_section();
  dispatch_queue_t v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FPProviderMonitor addObserver:forProviderID:](&section, (uint64_t)v7, v8);
  }

  v9 = self;
  objc_sync_enter(v9);
  int out_token = 0;
  v10 = [(NSMutableDictionary *)v9->_observersByContainerID objectForKeyedSubscript:v7];
  if (!v10)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    [(NSMutableDictionary *)v9->_observersByContainerID setObject:v10 forKeyedSubscript:v7];
  }
  [v10 addObject:v6];
  objc_super v11 = FPNotifyNameForForegroundChangeWithProviderID(v7);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __47__FPProviderMonitor_addObserver_forProviderID___block_invoke;
  v22[3] = &unk_1E5AF4378;
  v22[4] = v9;
  id v12 = v7;
  id v23 = v12;
  id v13 = v11;
  id v24 = v13;
  v14 = (void *)MEMORY[0x1A6248B00](v22);
  id v15 = v13;
  notify_register_dispatch((const char *)[v15 UTF8String], &out_token, (dispatch_queue_t)v9->_queue, v14);
  v16 = [NSNumber numberWithInt:out_token];
  [(NSMutableDictionary *)v9->_notifyTokenByContainerID setObject:v16 forKeyedSubscript:v12];

  queue = v9->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__FPProviderMonitor_addObserver_forProviderID___block_invoke_30;
  block[3] = &unk_1E5AF43A0;
  id v20 = v14;
  int v21 = out_token;
  id v18 = v14;
  dispatch_async(queue, block);

  objc_sync_exit(v9);
  __fp_leave_section_Debug((uint64_t)&section);
}

void __47__FPProviderMonitor_addObserver_forProviderID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  objc_super v5 = (uint64_t *)(a1 + 40);
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v7 = (void *)[v6 copy];

  objc_sync_exit(v4);
  _brc_notify_get_state(a2, (uint64_t)&v20, [*(id *)(a1 + 48) UTF8String]);
  uint64_t v8 = v20;
  v9 = fp_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __47__FPProviderMonitor_addObserver_forProviderID___block_invoke_cold_1(v5, v8 == 0, v9);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        uint64_t v15 = *v5;
        if (v8) {
          [v14 providerDidEnterForeground:v15];
        }
        else {
          objc_msgSend(v14, "providerDidEnterBackground:", v15, (void)v16);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v11);
  }
}

uint64_t __47__FPProviderMonitor_addObserver_forProviderID___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

- (void)removeObserver:(id)a3 forProviderID:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  v9 = [(NSMutableDictionary *)v8->_observersByContainerID objectForKeyedSubscript:v7];
  if (([v9 containsObject:v6] & 1) == 0)
  {
    fp_simulate_crash(@"removed non existing observer %@ for %@, existing observers were %@", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v6);
    long long v17 = fp_current_or_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      observersByContainerID = v8->_observersByContainerID;
      *(_DWORD *)buf = 138412802;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v7;
      __int16 v25 = 2112;
      v26 = observersByContainerID;
      _os_log_fault_impl(&dword_1A33AE000, v17, OS_LOG_TYPE_FAULT, "[SIMCRASH] removed non existing observer %@ for %@, existing observers were %@", buf, 0x20u);
    }
  }
  [v9 removeObject:v6];
  if (![v9 count])
  {
    [(NSMutableDictionary *)v8->_observersByContainerID removeObjectForKey:v7];
    long long v18 = [(NSMutableDictionary *)v8->_notifyTokenByContainerID objectForKeyedSubscript:v7];
    int v19 = [v18 intValue];

    notify_cancel(v19);
    [(NSMutableDictionary *)v8->_notifyTokenByContainerID removeObjectForKey:v7];
  }

  objc_sync_exit(v8);
}

uint64_t __44__FPProviderMonitor_isProviderIDForeground___block_invoke()
{
  isProviderIDForeground__tokensCache = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (BOOL)supportsWakesForProviderID:(id)a3
{
  return 1;
}

- (BOOL)wakeProviderID:(id)a3 forSessionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[FPItemManager defaultManager];
  id v8 = [[FPWakeForURLSessionOperation alloc] initForProvider:v5 sessionIdentifier:v6];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__FPProviderMonitor_wakeProviderID_forSessionIdentifier___block_invoke;
  v11[3] = &unk_1E5AF29C0;
  v11[4] = &v12;
  [v8 setActionCompletionBlock:v11];
  [v7 scheduleAction:v8];
  [v8 waitUntilFinished];
  char v9 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __57__FPProviderMonitor_wakeProviderID_forSessionIdentifier___block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2 == 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notifyTokenByContainerID, 0);

  objc_storeStrong((id *)&self->_observersByContainerID, 0);
}

- (void)addObserver:(NSObject *)a3 forProviderID:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 134218242;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_11(&dword_1A33AE000, a2, a3, "[DEBUG] ┏%llx adding observer for %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __47__FPProviderMonitor_addObserver_forProviderID___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  id v3 = "foreground";
  if (a2) {
    id v3 = "background";
  }
  *(_DWORD *)id v4 = 138412546;
  *(void *)&v4[4] = *a1;
  *(_WORD *)&v4[12] = 2080;
  *(void *)&v4[14] = v3;
  OUTLINED_FUNCTION_11(&dword_1A33AE000, a2, a3, "[DEBUG] %@ is now %s", *(void *)v4, *(void *)&v4[8], *(void *)&v4[16], *MEMORY[0x1E4F143B8]);
}

+ (void)isProviderIDForeground:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "int _brc_notify_register_check(const char *, int *)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPProviderMonitor.m", 32, @"%s", dlerror());

  __break(1u);
}

@end