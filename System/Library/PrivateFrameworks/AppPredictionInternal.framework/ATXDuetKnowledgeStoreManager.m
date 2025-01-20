@interface ATXDuetKnowledgeStoreManager
+ (id)sharedInstance;
- (ATXDuetKnowledgeStoreManager)init;
- (void)_clear;
- (void)_handleMemoryPressure;
- (void)dealloc;
- (void)runBlock:(id)a3;
- (void)saveEventsAsynchronously:(id)a3 responseQueue:(id)a4 completion:(id)a5;
@end

@implementation ATXDuetKnowledgeStoreManager

void __41__ATXDuetKnowledgeStoreManager_runBlock___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _clear];
}

- (void)_clear
{
  sel_getName(a2);
  id v6 = (id)os_transaction_create();
  store = self->_store;
  self->_store = 0;

  expirationSource = self->_expirationSource;
  if (expirationSource)
  {
    dispatch_source_cancel(expirationSource);
    v5 = self->_expirationSource;
  }
  else
  {
    v5 = 0;
  }
  self->_expirationSource = 0;
}

void __41__ATXDuetKnowledgeStoreManager_runBlock___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 16))
  {
    v2 = (void *)MEMORY[0x1D25F6CC0]();
    uint64_t v3 = [MEMORY[0x1E4F5B560] knowledgeStoreWithDirectReadOnlyAccess];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v6 = *(void *)(a1 + 32);
    if (!*(void *)(v6 + 32))
    {
      dispatch_source_t v7 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 7uLL, *(dispatch_queue_t *)(v6 + 8));
      uint64_t v8 = *(void *)(a1 + 32);
      v9 = *(void **)(v8 + 32);
      *(void *)(v8 + 32) = v7;

      v10 = *(NSObject **)(*(void *)(a1 + 32) + 32);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __41__ATXDuetKnowledgeStoreManager_runBlock___block_invoke_2;
      handler[3] = &unk_1E68AC2D0;
      objc_copyWeak(&v29, &location);
      dispatch_source_set_event_handler(v10, handler);
      dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 32));
      objc_destroyWeak(&v29);
      uint64_t v6 = *(void *)(a1 + 32);
    }
    v11 = *(NSObject **)(v6 + 48);
    if (v11)
    {
      dispatch_source_cancel(v11);
      uint64_t v6 = *(void *)(a1 + 32);
    }
    dispatch_source_t v12 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(v6 + 8));
    uint64_t v13 = *(void *)(a1 + 32);
    v14 = *(void **)(v13 + 48);
    *(void *)(v13 + 48) = v12;

    uint64_t v15 = *(void *)(a1 + 32);
    unint64_t v16 = *(void *)(v15 + 40);
    v17 = *(NSObject **)(v15 + 48);
    if (v16 <= 1) {
      int64_t v18 = 600000000000;
    }
    else {
      int64_t v18 = 30000000000;
    }
    if (v16 <= 1) {
      uint64_t v19 = 300000000000;
    }
    else {
      uint64_t v19 = 30000000000;
    }
    dispatch_time_t v20 = dispatch_time(0, v18);
    dispatch_source_set_timer(v17, v20, 0xFFFFFFFFFFFFFFFFLL, v19);
    v21 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __41__ATXDuetKnowledgeStoreManager_runBlock___block_invoke_3;
    v26[3] = &unk_1E68AC2D0;
    objc_copyWeak(&v27, &location);
    dispatch_source_set_event_handler(v21, v26);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 48));
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  v22 = (void *)MEMORY[0x1D25F6CC0]();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v23 = objc_opt_new();
  uint64_t v24 = *(void *)(a1 + 32);
  v25 = *(void **)(v24 + 24);
  *(void *)(v24 + 24) = v23;
}

- (void)runBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__ATXDuetKnowledgeStoreManager_runBlock___block_invoke;
  v7[3] = &unk_1E68AB528;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__ATXDuetKnowledgeStoreManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_2, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_40;
  return v2;
}

void __46__ATXDuetKnowledgeStoreManager_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_40;
  sharedInstance__pasExprOnceResult_40 = v1;
}

- (ATXDuetKnowledgeStoreManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)ATXDuetKnowledgeStoreManager;
  v2 = [(ATXDuetKnowledgeStoreManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    v5 = (const char *)[v4 UTF8String];
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v2->_previousPressure = 1;
  }
  return v2;
}

- (void)dealloc
{
  pressureSource = self->_pressureSource;
  if (pressureSource) {
    dispatch_source_cancel(pressureSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)ATXDuetKnowledgeStoreManager;
  [(ATXDuetKnowledgeStoreManager *)&v4 dealloc];
}

void __41__ATXDuetKnowledgeStoreManager_runBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleMemoryPressure];
}

- (void)_handleMemoryPressure
{
  uintptr_t data = dispatch_source_get_data((dispatch_source_t)self->_pressureSource);
  unint64_t v5 = data;
  if (self->_store && data > self->_previousPressure)
  {
    id v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "Evicting Duet store", buf, 2u);
    }

    [(NSDate *)self->_lastUsedDate timeIntervalSinceNow];
    double v8 = v7;
    if (v7 <= -5.0)
    {
      [(ATXDuetKnowledgeStoreManager *)self _clear];
    }
    else
    {
      sel_getName(a2);
      v9 = (void *)os_transaction_create();
      objc_super v10 = (void *)MEMORY[0x1E4F93B18];
      queue = self->_queue;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __53__ATXDuetKnowledgeStoreManager__handleMemoryPressure__block_invoke;
      v13[3] = &unk_1E68AB870;
      v13[4] = self;
      id v14 = v9;
      id v12 = v9;
      [v10 runAsyncOnQueue:queue afterDelaySeconds:v13 block:v8 + 5.0];
    }
  }
  self->_previousPressure = v5;
}

id __53__ATXDuetKnowledgeStoreManager__handleMemoryPressure__block_invoke(uint64_t a1)
{
  return self;
}

- (void)saveEventsAsynchronously:(id)a3 responseQueue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__ATXDuetKnowledgeStoreManager_saveEventsAsynchronously_responseQueue_completion___block_invoke;
  v15[3] = &unk_1E68AF208;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

uint64_t __82__ATXDuetKnowledgeStoreManager_saveEventsAsynchronously_responseQueue_completion___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 56);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F5B560] knowledgeStore];
    uint64_t v4 = a1[4];
    unint64_t v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;

    v2 = *(void **)(a1[4] + 56);
  }
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v8 = a1[7];
  return [v2 saveObjects:v6 responseQueue:v7 withCompletion:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savingStore, 0);
  objc_storeStrong((id *)&self->_expirationSource, 0);
  objc_storeStrong((id *)&self->_pressureSource, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end