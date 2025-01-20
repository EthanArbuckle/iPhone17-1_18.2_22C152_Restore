@interface ASDSoftwareUpdatesStore
+ (id)registerBadgeCountNotificationBlock:(id)a3;
- (ASDSoftwareUpdatesStore)init;
- (BOOL)autoUpdateEnabled;
- (BOOL)confirmAgentRequestedUpdateAll;
- (BOOL)hasEntitlement;
- (void)_call:(id)a3 run:(id)a4 error:(id)a5;
- (void)clearExpiredUpdateHistoryWithCompletionBlock:(id)a3;
- (void)dealloc;
- (void)getManagedUpdatesWithCompletionBlock:(id)a3;
- (void)getMetricsWithCompletionBlock:(id)a3;
- (void)getUpdatesIncludingMetricsWithCompletionBlock:(id)a3;
- (void)getUpdatesWithCompletionBlock:(id)a3;
- (void)hideApplicationBadgeForPendingUpdates;
- (void)refreshUpdateCountWithCompletionBlock:(id)a3;
- (void)refreshUpdatesWithCompletionBlock:(id)a3 completionBlock:(id)a4;
- (void)reloadForSettingsFromServerWithCompletionBlock:(id)a3;
- (void)reloadFromServerInBackgroundWithCompletionBlock:(id)a3;
- (void)reloadFromServerWithCompletionBlock:(id)a3;
- (void)reloadManagedUpdatesWithCompletionBlock:(id)a3;
- (void)removeUpdateBulletins;
- (void)setAutoUpdateEnabled:(BOOL)a3;
- (void)shouldUseModernUpdatesWithCompletionBlock:(id)a3;
- (void)showApplicationBadgeForPendingUpdates;
- (void)showApplicationUpdateBulletin;
- (void)updateAllWithCompletionBlock:(id)a3;
- (void)updateAllWithJobResultsCompletionBlock:(id)a3;
- (void)updateAllWithOrder:(id)a3 completionBlock:(id)a4;
@end

@implementation ASDSoftwareUpdatesStore

- (ASDSoftwareUpdatesStore)init
{
  v45.receiver = self;
  v45.super_class = (Class)ASDSoftwareUpdatesStore;
  v2 = [(ASDSoftwareUpdatesStore *)&v45 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstoredaemonframework.ASDSoftwareUpdatesStore.access", v3);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.appstoredaemonframework.ASDSoftwareUpdatesStore.callout", v6);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v7;

    if (-[ASDBaseClient _clientHasEntitlement:]((uint64_t)v2, @"com.apple.appstored.xpc.updates"))
    {
      v2->_hasUpdatesEntitlement = 1;
    }
    else
    {
      BOOL v9 = -[ASDBaseClient _clientHasEntitlement:]((uint64_t)v2, @"com.apple.appstored.update-apps");
      v2->_hasUpdatesEntitlement = v9;
      if (!v9) {
        return v2;
      }
    }
    objc_initWeak(&location, v2);
    v2->_storeChangedNotificationToken = -1;
    v10 = dispatch_get_global_queue(21, 0);
    uint64_t handler = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __31__ASDSoftwareUpdatesStore_init__block_invoke;
    v42 = &unk_1E58B36F8;
    objc_copyWeak(&v43, &location);
    notify_register_dispatch("com.apple.appstored.updatesstorechanged", &v2->_storeChangedNotificationToken, v10, &handler);

    if (-[ASDBaseClient _clientHasEntitlement:]((uint64_t)v2, @"com.apple.appstored.xpc.updates")
      || -[ASDBaseClient _clientHasEntitlement:]((uint64_t)v2, @"com.apple.appstored.update-apps"))
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.appstored.xpc.updates" options:0];
      connection = v2->_connection;
      v2->_connection = (NSXPCConnection *)v11;

      v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C578];
      v14 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v15 = objc_opt_class();
      v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0, handler, v40, v41, v42);
      [v13 setClasses:v16 forSelector:sel_getUpdatesWithCompletionBlock_ argumentIndex:0 ofReply:1];

      v17 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v18 = objc_opt_class();
      v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
      [v13 setClasses:v19 forSelector:sel_getUpdatesIncludingMetricsWithCompletionBlock_ argumentIndex:0 ofReply:1];

      v20 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v21 = objc_opt_class();
      v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
      [v13 setClasses:v22 forSelector:sel_getManagedUpdatesWithCompletionBlock_ argumentIndex:0 ofReply:1];

      v23 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v24 = objc_opt_class();
      v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
      [v13 setClasses:v25 forSelector:sel_reloadFromServerWithCompletionBlock_ argumentIndex:0 ofReply:1];

      v26 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v27 = objc_opt_class();
      v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
      [v13 setClasses:v28 forSelector:sel_reloadManagedUpdatesWithCompletionBlock_ argumentIndex:0 ofReply:1];

      v29 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v30 = objc_opt_class();
      v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
      [v13 setClasses:v31 forSelector:sel_reloadFromServerInBackgroundWithCompletionBlock_ argumentIndex:0 ofReply:1];

      v32 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v33 = objc_opt_class();
      v34 = objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
      [v13 setClasses:v34 forSelector:sel_updateAllWithJobResults_ argumentIndex:1 ofReply:1];

      v35 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v36 = objc_opt_class();
      v37 = objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
      [v13 setClasses:v37 forSelector:sel_updateAllWithOrder_completionBlock_ argumentIndex:1 ofReply:1];

      [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v13];
      [(NSXPCConnection *)v2->_connection setInvalidationHandler:&__block_literal_global_140];
      [(NSXPCConnection *)v2->_connection setInterruptionHandler:&__block_literal_global_143];
      [(NSXPCConnection *)v2->_connection _setQueue:v2->_accessQueue];
      [(NSXPCConnection *)v2->_connection resume];
    }
    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __31__ASDSoftwareUpdatesStore_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"ASDSoftwareUpdatesStoreDidChangeNotification" object:WeakRetained];
}

- (void)dealloc
{
  int storeChangedNotificationToken = self->_storeChangedNotificationToken;
  if (storeChangedNotificationToken != -1) {
    notify_cancel(storeChangedNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)ASDSoftwareUpdatesStore;
  [(ASDSoftwareUpdatesStore *)&v4 dealloc];
}

+ (id)registerBadgeCountNotificationBlock:(id)a3
{
  id v3 = a3;
  objc_super v4 = (ASDSoftwareUpdatesStore *)NSUnimplemented_();
  return (id)[(ASDSoftwareUpdatesStore *)v4 autoUpdateEnabled];
}

- (BOOL)autoUpdateEnabled
{
  v2 = (ASDSoftwareUpdatesStore *)NSUnimplemented_();
  return [(ASDSoftwareUpdatesStore *)v2 confirmAgentRequestedUpdateAll];
}

- (BOOL)confirmAgentRequestedUpdateAll
{
  v2 = (ASDSoftwareUpdatesStore *)NSUnimplemented_();
  [(ASDSoftwareUpdatesStore *)v2 clearExpiredUpdateHistoryWithCompletionBlock:v4];
  return result;
}

- (void)clearExpiredUpdateHistoryWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  SEL v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: clearExpiredUpdateHistoryWithCompletionBlock", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke_2;
  v8[3] = &unk_1E58B4778;
  id v4 = *(id *)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke_5;
  v6[3] = &unk_1E58B33A8;
  id v5 = *(id *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 _call:v3 run:v8 error:v6];
}

void __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke_3;
  v5[3] = &unk_1E58B3358;
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [a2 clearExpiredUpdateHistoryWithCompletionBlock:v5];
}

void __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke_4;
    block[3] = &unk_1E58B30B8;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke_6;
    v6[3] = &unk_1E58B2E18;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)getManagedUpdatesWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil block"];
  }
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: getManagedUpdatesWithCompletionBlock", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke_2;
  v7[3] = &unk_1E58B4778;
  v7[4] = v2;
  id v8 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke_5;
  v5[3] = &unk_1E58B3040;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 _call:v3 run:v7 error:v5];
}

void __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E58B2E68;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 getManagedUpdatesWithCompletionBlock:v4];
}

void __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke_4;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke_5(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke_6;
  block[3] = &unk_1E58B4208;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getMetricsWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: getMetricsWithCompletionBlock", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke_2;
  v7[3] = &unk_1E58B4778;
  void v7[4] = v2;
  id v8 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke_5;
  v5[3] = &unk_1E58B3040;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 _call:v3 run:v7 error:v5];
}

void __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E58B4408;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 getUpdatesMetricsWithCompletionBlock:v4];
}

void __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke_4;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke_5(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke_6;
  block[3] = &unk_1E58B4208;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getUpdatesWithCompletionBlock:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil block"];
  }
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E58B33D0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 40);
  ASDLogHandleForCategory(13);
  id v3 = (ASDDispatchQueue *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = os_log_type_enabled(&v3->super, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19BF6A000, &v3->super, OS_LOG_TYPE_DEBUG, "(SoftwareUpdateStore) Joining request: getUpdatesWithCompletionBlock", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19BF6A000, &v3->super, OS_LOG_TYPE_DEBUG, "(SoftwareUpdateStore) Starting request: getUpdatesWithCompletionBlock", buf, 2u);
    }

    id v5 = +[ASDSyncTaskScheduler sharedInstance]();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_28;
    v18[3] = &unk_1E58B47F0;
    v18[4] = *(void *)(a1 + 32);
    uint64_t v6 = +[ASDPromise onScheduler:v5 usingBlock:v18];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v3 = [[ASDDispatchQueue alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 40);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_5;
    v17[3] = &unk_1E58B4818;
    v17[4] = v9;
    [v10 alwaysPerform:v17 onScheduler:v3];
  }

  char v11 = [[ASDDispatchQueue alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 24)];
  id v12 = *(void **)(*(void *)(a1 + 32) + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_31;
  v15[3] = &unk_1E58B4018;
  id v16 = *(id *)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_33;
  v13[3] = &unk_1E58B2CB8;
  id v14 = *(id *)(a1 + 40);
  [v12 thenPerform:v15 orCatchError:v13 onScheduler:v11];
}

void __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = v7[2];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_2;
  v13[3] = &unk_1E58B47C8;
  id v14 = v5;
  id v15 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_4;
  v11[3] = &unk_1E58B2CB8;
  id v12 = v15;
  id v9 = v15;
  id v10 = v5;
  [v7 _call:v8 run:v13 error:v11];
}

void __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E58B47A0;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 getUpdatesWithCompletionBlock:v4];
}

uint64_t __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_debug_impl(&dword_19BF6A000, v2, OS_LOG_TYPE_DEBUG, "(SoftwareUpdateStore) Completing request: getUpdatesWithCompletionBlock", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 134217984;
    uint64_t v6 = [v3 count];
    _os_log_debug_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_DEBUG, "(SoftwareUpdateStore) Dispatching %lu results: getUpdatesWithCompletionBlock", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_33(uint64_t a1)
{
  uint64_t v2 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_debug_impl(&dword_19BF6A000, v2, OS_LOG_TYPE_DEBUG, "(SoftwareUpdateStore) Dispatching error: getUpdatesWithCompletionBlock", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getUpdatesIncludingMetricsWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil block"];
  }
  int v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: getUpdatesIncludingMetricsWithCompletionBlock", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_2;
  v7[3] = &unk_1E58B4778;
  void v7[4] = v2;
  id v8 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_5;
  v5[3] = &unk_1E58B3040;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 _call:v3 run:v7 error:v5];
}

void __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E58B2E68;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 getUpdatesIncludingMetricsWithCompletionBlock:v4];
}

void __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_4;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_5(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_6;
  block[3] = &unk_1E58B4208;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)hasEntitlement
{
  return self->_hasUpdatesEntitlement;
}

- (void)hideApplicationBadgeForPendingUpdates
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = (id)objc_opt_class();
    id v4 = v8;
    _os_log_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: hideApplicationBadgeForPendingUpdates", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__ASDSoftwareUpdatesStore_hideApplicationBadgeForPendingUpdates__block_invoke;
  block[3] = &unk_1E58B2EB8;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __64__ASDSoftwareUpdatesStore_hideApplicationBadgeForPendingUpdates__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _call:*(void *)(*(void *)(a1 + 32) + 16) run:&__block_literal_global_21 error:&__block_literal_global_35];
}

uint64_t __64__ASDSoftwareUpdatesStore_hideApplicationBadgeForPendingUpdates__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 hideApplicationBadgeForPendingUpdates];
}

- (void)refreshUpdateCountWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil block"];
  }
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: refreshUpdateCountWithCompletionBlock", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke_2;
  v7[3] = &unk_1E58B4778;
  void v7[4] = v2;
  id v8 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke_5;
  v5[3] = &unk_1E58B3040;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 _call:v3 run:v7 error:v5];
}

void __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E58B4320;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 refreshUpdateCountWithCompletionBlock:v4];
}

void __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke_4;
  block[3] = &unk_1E58B3AC8;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke_6;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)refreshUpdatesWithCompletionBlock:(id)a3 completionBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = (id)objc_opt_class();
    id v9 = v17;
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: refreshUpdatesWithCompletionBlock", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke;
  block[3] = &unk_1E58B3510;
  void block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(accessQueue, block);
}

void __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_2;
  v8[3] = &unk_1E58B4860;
  id v9 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_5;
  v6[3] = &unk_1E58B33A8;
  id v5 = *(id *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 _call:v3 run:v8 error:v6];
}

void __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_3;
  v6[3] = &unk_1E58B3358;
  id v5 = *(id *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  [a2 refreshUpdatesWithCompletionBlock:v4 completionBlock:v6];
}

void __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_4;
    block[3] = &unk_1E58B30B8;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_6;
    v6[3] = &unk_1E58B2E18;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)reloadFromServerInBackgroundWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil block"];
  }
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: reloadFromServerInBackgroundWithCompletionBlock", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__ASDSoftwareUpdatesStore_reloadFromServerInBackgroundWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __75__ASDSoftwareUpdatesStore_reloadFromServerInBackgroundWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__ASDSoftwareUpdatesStore_reloadFromServerInBackgroundWithCompletionBlock___block_invoke_2;
  v6[3] = &unk_1E58B4778;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__ASDSoftwareUpdatesStore_reloadFromServerInBackgroundWithCompletionBlock___block_invoke_5;
  v4[3] = &unk_1E58B2CB8;
  id v5 = *(id *)(a1 + 40);
  [v2 _call:v3 run:v6 error:v4];
}

void __75__ASDSoftwareUpdatesStore_reloadFromServerInBackgroundWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__ASDSoftwareUpdatesStore_reloadFromServerInBackgroundWithCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E58B2E68;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 reloadFromServerInBackgroundWithCompletionBlock:v4];
}

void __75__ASDSoftwareUpdatesStore_reloadFromServerInBackgroundWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__ASDSoftwareUpdatesStore_reloadFromServerInBackgroundWithCompletionBlock___block_invoke_4;
  block[3] = &unk_1E58B3068;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v8;
  id v12 = v6;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

uint64_t __75__ASDSoftwareUpdatesStore_reloadFromServerInBackgroundWithCompletionBlock___block_invoke_4(void *a1)
{
  uint64_t v2 = a1[6];
  if (a1[4]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = a1[5];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

uint64_t __75__ASDSoftwareUpdatesStore_reloadFromServerInBackgroundWithCompletionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reloadFromServerWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil block"];
  }
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: reloadFromServerWithCompletionBlock", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_2;
  v7[3] = &unk_1E58B4778;
  void v7[4] = v2;
  id v8 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_5;
  v5[3] = &unk_1E58B3040;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 _call:v3 run:v7 error:v5];
}

void __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E58B2E68;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 reloadFromServerWithCompletionBlock:v4];
}

void __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_4;
  block[3] = &unk_1E58B3068;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v8;
  id v12 = v6;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

uint64_t __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_4(void *a1)
{
  uint64_t v2 = a1[6];
  if (a1[4]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = a1[5];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

void __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_6;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)reloadManagedUpdatesWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil block"];
  }
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: reloadManagedUpdatesWithCompletionBlock", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke_2;
  v7[3] = &unk_1E58B4778;
  void v7[4] = v2;
  id v8 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke_5;
  v5[3] = &unk_1E58B3040;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 _call:v3 run:v7 error:v5];
}

void __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E58B2E68;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 reloadManagedUpdatesWithCompletionBlock:v4];
}

void __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke_4;
  block[3] = &unk_1E58B3068;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v8;
  id v12 = v6;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

uint64_t __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke_4(void *a1)
{
  uint64_t v2 = a1[6];
  if (a1[4]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = a1[5];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

void __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke_6;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)reloadForSettingsFromServerWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil block"];
  }
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: reloadForSettingsFromServerWithCompletionBlock", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__ASDSoftwareUpdatesStore_reloadForSettingsFromServerWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __74__ASDSoftwareUpdatesStore_reloadForSettingsFromServerWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__ASDSoftwareUpdatesStore_reloadForSettingsFromServerWithCompletionBlock___block_invoke_2;
  v6[3] = &unk_1E58B4778;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__ASDSoftwareUpdatesStore_reloadForSettingsFromServerWithCompletionBlock___block_invoke_5;
  v4[3] = &unk_1E58B2CB8;
  id v5 = *(id *)(a1 + 40);
  [v2 _call:v3 run:v6 error:v4];
}

void __74__ASDSoftwareUpdatesStore_reloadForSettingsFromServerWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__ASDSoftwareUpdatesStore_reloadForSettingsFromServerWithCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E58B2E68;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 reloadFromServerInBackgroundWithCompletionBlock:v4];
}

void __74__ASDSoftwareUpdatesStore_reloadForSettingsFromServerWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__ASDSoftwareUpdatesStore_reloadForSettingsFromServerWithCompletionBlock___block_invoke_4;
  block[3] = &unk_1E58B3068;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v8;
  id v12 = v6;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

uint64_t __74__ASDSoftwareUpdatesStore_reloadForSettingsFromServerWithCompletionBlock___block_invoke_4(void *a1)
{
  uint64_t v2 = a1[6];
  if (a1[4]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = a1[5];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

uint64_t __74__ASDSoftwareUpdatesStore_reloadForSettingsFromServerWithCompletionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeUpdateBulletins
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = (id)objc_opt_class();
    id v4 = v8;
    _os_log_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: removeUpdateBulletins", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ASDSoftwareUpdatesStore_removeUpdateBulletins__block_invoke;
  block[3] = &unk_1E58B2EB8;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __48__ASDSoftwareUpdatesStore_removeUpdateBulletins__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _call:*(void *)(*(void *)(a1 + 32) + 16) run:&__block_literal_global_39_0 error:&__block_literal_global_41];
}

uint64_t __48__ASDSoftwareUpdatesStore_removeUpdateBulletins__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeUpdateBulletins];
}

- (void)setAutoUpdateEnabled:(BOOL)a3
{
  uint64_t v3 = (ASDSoftwareUpdatesStore *)NSUnimplemented_();
  [(ASDSoftwareUpdatesStore *)v3 showApplicationBadgeForPendingUpdates];
}

- (void)showApplicationBadgeForPendingUpdates
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = (id)objc_opt_class();
    id v4 = v8;
    _os_log_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: showApplicationBadgeForPendingUpdates", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__ASDSoftwareUpdatesStore_showApplicationBadgeForPendingUpdates__block_invoke;
  block[3] = &unk_1E58B2EB8;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __64__ASDSoftwareUpdatesStore_showApplicationBadgeForPendingUpdates__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _call:*(void *)(*(void *)(a1 + 32) + 16) run:&__block_literal_global_44 error:&__block_literal_global_46];
}

uint64_t __64__ASDSoftwareUpdatesStore_showApplicationBadgeForPendingUpdates__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 showApplicationBadgeForPendingUpdates];
}

- (void)showApplicationUpdateBulletin
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = (id)objc_opt_class();
    id v4 = v8;
    _os_log_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: showApplicationUpdateBulletin", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ASDSoftwareUpdatesStore_showApplicationUpdateBulletin__block_invoke;
  block[3] = &unk_1E58B2EB8;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __56__ASDSoftwareUpdatesStore_showApplicationUpdateBulletin__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _call:*(void *)(*(void *)(a1 + 32) + 16) run:&__block_literal_global_48 error:&__block_literal_global_50_0];
}

uint64_t __56__ASDSoftwareUpdatesStore_showApplicationUpdateBulletin__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 showApplicationUpdatesBulletin];
}

- (void)updateAllWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: updateAllWithCompletionBlock", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke_2;
  v8[3] = &unk_1E58B4888;
  id v4 = *(id *)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke_5;
  v6[3] = &unk_1E58B33A8;
  id v5 = *(id *)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 _call:v3 run:v8 error:v6];
}

void __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke_3;
  v5[3] = &unk_1E58B43E0;
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [a2 updateAllWithJobResults:v5];
}

void __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke_3(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke_4;
    block[3] = &unk_1E58B30B8;
    id v11 = v7;
    char v12 = a2;
    id v10 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke_6;
    v6[3] = &unk_1E58B2E18;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)updateAllWithJobResultsCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: updateAllWithJobResultsCompletionBlock", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke_2;
  v8[3] = &unk_1E58B4888;
  id v4 = *(id *)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke_5;
  v6[3] = &unk_1E58B33A8;
  id v5 = *(id *)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 _call:v3 run:v8 error:v6];
}

void __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke_3;
  v5[3] = &unk_1E58B43E0;
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [a2 updateAllWithJobResults:v5];
}

void __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke_3(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(void **)(a1 + 40);
  if (v9)
  {
    id v10 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke_4;
    v11[3] = &unk_1E58B3498;
    id v14 = v9;
    char v15 = a2;
    id v12 = v7;
    id v13 = v8;
    dispatch_async(v10, v11);
  }
}

uint64_t __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke_6;
    v6[3] = &unk_1E58B2E18;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

- (void)updateAllWithOrder:(id)a3 completionBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = (id)objc_opt_class();
    id v9 = v17;
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: updateAllWithOrder", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke;
  block[3] = &unk_1E58B3510;
  void block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(accessQueue, block);
}

void __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke_2;
  v8[3] = &unk_1E58B4860;
  id v9 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke_5;
  v6[3] = &unk_1E58B33A8;
  id v5 = *(id *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 _call:v3 run:v8 error:v6];
}

void __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke_3;
  v6[3] = &unk_1E58B43E0;
  id v5 = *(id *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  [a2 updateAllWithOrder:v4 completionBlock:v6];
}

void __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke_3(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(void **)(a1 + 40);
  if (v9)
  {
    uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke_4;
    v11[3] = &unk_1E58B3498;
    id v14 = v9;
    char v15 = a2;
    id v12 = v7;
    id v13 = v8;
    dispatch_async(v10, v11);
  }
}

uint64_t __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke_6;
    v6[3] = &unk_1E58B2E18;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

- (void)shouldUseModernUpdatesWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: shouldUseModernUpdatesWithCompletionBlock", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke_2;
  v8[3] = &unk_1E58B4888;
  id v4 = *(id *)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke_5;
  v6[3] = &unk_1E58B33A8;
  id v5 = *(id *)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 _call:v3 run:v8 error:v6];
}

void __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke_3;
  v5[3] = &unk_1E58B48D8;
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [a2 shouldUseModernUpdatesWithCompletionBlock:v5];
}

void __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke_4;
    v5[3] = &unk_1E58B48B0;
    id v6 = v2;
    char v7 = a2;
    dispatch_async(v4, v5);
  }
}

uint64_t __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke_6;
    block[3] = &unk_1E58B4208;
    id v4 = v1;
    dispatch_async(v2, block);
  }
}

uint64_t __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_call:(id)a3 run:(id)a4 error:(id)a5
{
  if (self->_hasUpdatesEntitlement)
  {
    v11.receiver = self;
    v11.super_class = (Class)ASDSoftwareUpdatesStore;
    id v8 = a5;
    [(ASDBaseClient *)&v11 _call:a3 run:a4 error:v8];
  }
  else
  {
    id v9 = a5;
    ASDErrorWithUnderlyingErrorAndInfo(0, @"ASDErrorDomain", 505, 0, 0, 0);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a5 + 2))(v9, v10);
  }
}

void __43__ASDSoftwareUpdatesStore__setupConnection__block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_19BF6A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Invalidate", v0, 2u);
  }
}

void __43__ASDSoftwareUpdatesStore__setupConnection__block_invoke_141()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_19BF6A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Interrupt", v0, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_getUpdatesPromise, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end