@interface FPDaemonOperationManager
+ (id)sharedInstance;
- (FPDaemonOperationManager)init;
- (id)generateLocalOperationID;
- (void)_enumerateNewDaemonOperationsWithHandler:(id)a3;
- (void)_receiveLongLivedOperation:(id)a3 info:(id)a4;
- (void)_updateDaemonOperations;
- (void)dealloc;
- (void)wakeUp;
@end

@implementation FPDaemonOperationManager

uint64_t __34__FPDaemonOperationManager_wakeUp__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + 8) = 1;
    return [*(id *)(result + 32) _updateDaemonOperations];
  }
  return result;
}

- (void)wakeUp
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__FPDaemonOperationManager_wakeUp__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  block[4] = self;
  dispatch_async(queue, block);
}

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_41);
  }
  v2 = (void *)sharedInstance_instance;

  return v2;
}

void __69__FPDaemonOperationManager__enumerateNewDaemonOperationsWithHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __69__FPDaemonOperationManager__enumerateNewDaemonOperationsWithHandler___block_invoke_cold_1(v5, v6);
    }
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __69__FPDaemonOperationManager__enumerateNewDaemonOperationsWithHandler___block_invoke_14;
    v22[3] = &unk_1E5AF1EE8;
    v22[4] = a1[4];
    v7 = objc_msgSend(a2, "fp_filter:", v22);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
          v13 = fp_current_or_default_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v24 = v12;
            _os_log_debug_impl(&dword_1A33AE000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] fetching remote operationID %@", buf, 0xCu);
          }

          v15 = (void *)a1[5];
          v14 = (void *)a1[6];
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __69__FPDaemonOperationManager__enumerateNewDaemonOperationsWithHandler___block_invoke_16;
          v16[3] = &unk_1E5AF4B28;
          v16[4] = v12;
          id v17 = v14;
          [v15 fetchDaemonOperationWithID:v12 completionHandler:v16];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v25 count:16];
      }
      while (v9);
    }

    id v5 = 0;
  }
}

- (void)_updateDaemonOperations
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__FPDaemonOperationManager__updateDaemonOperations__block_invoke;
  v3[3] = &unk_1E5AF4B00;
  v3[4] = self;
  [(FPDaemonOperationManager *)self _enumerateNewDaemonOperationsWithHandler:v3];
}

- (void)_enumerateNewDaemonOperationsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[FPDaemonConnection synchronousSharedConnectionProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__FPDaemonOperationManager__enumerateNewDaemonOperationsWithHandler___block_invoke;
  v8[3] = &unk_1E5AF4B50;
  v8[4] = self;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [v7 fetchDaemonOperationIDsWithCompletionHandler:v8];
}

uint64_t __42__FPDaemonOperationManager_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (FPDaemonOperationManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)FPDaemonOperationManager;
  v2 = [(FPDaemonOperationManager *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    localOperationIDs = v2->_localOperationIDs;
    v2->_localOperationIDs = (NSMutableSet *)v3;

    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("FileProvider.daemon-op-manager", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_msgSend(@"com.apple.fileprovider.daemon-op-created", "fp_libnotifyPerUserNotificationName");
    id location = 0;
    objc_initWeak(&location, v2);
    id v9 = v8;
    id v10 = (const char *)[v9 UTF8String];
    uint64_t v11 = v2->_queue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __32__FPDaemonOperationManager_init__block_invoke;
    v13[3] = &unk_1E5AF06A0;
    objc_copyWeak(&v14, &location);
    notify_register_dispatch(v10, &v2->_notifToken, v11, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __32__FPDaemonOperationManager_init__block_invoke(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __32__FPDaemonOperationManager_init__block_invoke_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateDaemonOperations];
}

- (void)dealloc
{
  notify_cancel(self->_notifToken);
  v3.receiver = self;
  v3.super_class = (Class)FPDaemonOperationManager;
  [(FPDaemonOperationManager *)&v3 dealloc];
}

- (id)generateLocalOperationID
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__19;
  id v10 = __Block_byref_object_dispose__19;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__FPDaemonOperationManager_generateLocalOperationID__block_invoke;
  v5[3] = &unk_1E5AF2168;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __52__FPDaemonOperationManager_generateLocalOperationID__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v3 = [v2 UUIDString];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return [v6 addObject:v7];
}

- (void)_receiveLongLivedOperation:(id)a3 info:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v7 = [v6 operationID];
  if (([(NSMutableSet *)self->_localOperationIDs containsObject:v7] & 1) == 0)
  {
    [(NSMutableSet *)self->_localOperationIDs addObject:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v6;
      int v9 = [v8 byCopy];
      id v10 = off_1E5AEFF38;
      if (!v9) {
        id v10 = off_1E5AF0060;
      }
      id v11 = (void *)[objc_alloc(*v10) initWithRemoteOperation:v13 info:v8];

      if (v11)
      {
        uint64_t v12 = +[FPItemManager defaultManager];
        [v12 scheduleAction:v11];
      }
    }
  }
}

uint64_t __51__FPDaemonOperationManager__updateDaemonOperations__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _receiveLongLivedOperation:a2 info:a3];
}

uint64_t __69__FPDaemonOperationManager__enumerateNewDaemonOperationsWithHandler___block_invoke_14(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) containsObject:a2] ^ 1;
}

void __69__FPDaemonOperationManager__enumerateNewDaemonOperationsWithHandler___block_invoke_16(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __69__FPDaemonOperationManager__enumerateNewDaemonOperationsWithHandler___block_invoke_16_cold_1(a1, v9, v10);
    }
  }
  else if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_localOperationIDs, 0);
}

void __32__FPDaemonOperationManager_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] received notification that daemon operation was created", v1, 2u);
}

void __69__FPDaemonOperationManager__enumerateNewDaemonOperationsWithHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a1, "fp_prettyDescription");
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] couldn't fetch remote operation IDs: %@", (uint8_t *)&v4, 0xCu);
}

void __69__FPDaemonOperationManager__enumerateNewDaemonOperationsWithHandler___block_invoke_16_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = objc_msgSend(a2, "fp_prettyDescription");
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_ERROR, "[ERROR] couldn't fetch operationID %@; %@",
    (uint8_t *)&v6,
    0x16u);
}

@end