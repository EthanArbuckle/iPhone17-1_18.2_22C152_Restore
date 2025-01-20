@interface TransactionManager
+ (id)instance;
- (TransactionManager)init;
- (void)appendTransactions:(id)a3;
- (void)appendTransactions_sync:(id)a3;
- (void)createXpcConnection;
- (void)createXpcConnection_sync;
- (void)dealloc;
- (void)setupConnectionHandlers_sync;
@end

@implementation TransactionManager

uint64_t __30__TransactionManager_instance__block_invoke(uint64_t a1)
{
  instance_instance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (TransactionManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)TransactionManager;
  v2 = [(CHSynchronizedLoggable *)&v5 initWithName:"TransactionManager"];
  v3 = v2;
  if (v2) {
    [(TransactionManager *)v2 createXpcConnection];
  }
  return v3;
}

- (void)createXpcConnection
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41__TransactionManager_createXpcConnection__block_invoke;
  v2[3] = &unk_1E61C74A8;
  v2[4] = self;
  [(CHSynchronizedLoggable *)self execute:v2];
}

+ (id)instance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__TransactionManager_instance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (instance_once != -1) {
    dispatch_once(&instance_once, block);
  }
  v2 = (void *)instance_instance;
  return v2;
}

uint64_t __41__TransactionManager_createXpcConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "createXpcConnection_sync");
}

- (void)createXpcConnection_sync
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "XPC connection is already valid!", v2, v3, v4, v5, v6);
}

- (void)setupConnectionHandlers_sync
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_syncHelperReadyNotificationRef)
  {
    uint64_t v3 = [(CHSynchronizedLoggable *)self logHandle];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = @"kCallHistorySyncHelperReadyNotification";
      _os_log_impl(&dword_1B8E4A000, v3, OS_LOG_TYPE_DEFAULT, "Registering for %{public}@", buf, 0xCu);
    }

    uint64_t v4 = [MEMORY[0x1E4F28C40] defaultCenter];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__TransactionManager_setupConnectionHandlers_sync__block_invoke;
    v12[3] = &unk_1E61C8458;
    v12[4] = self;
    uint64_t v5 = [v4 addObserverForName:@"kCallHistorySyncHelperReadyNotification" object:0 queue:0 usingBlock:v12];
    id syncHelperReadyNotificationRef = self->_syncHelperReadyNotificationRef;
    self->_id syncHelperReadyNotificationRef = v5;
  }
  v7 = [(CHSynchronizedLoggable *)self logHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E4A000, v7, OS_LOG_TYPE_DEFAULT, "Setting up invalidation handler", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_66;
  v10[3] = &unk_1E61C7610;
  objc_copyWeak(&v11, (id *)buf);
  [(NSXPCConnection *)self->_connection setInvalidationHandler:v10];
  v8 = [(CHSynchronizedLoggable *)self logHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1B8E4A000, v8, OS_LOG_TYPE_DEFAULT, "Setting up interruption handler", v9, 2u);
  }

  [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global_14];
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self->_syncHelperReadyNotificationRef name:@"kCallHistorySyncHelperReadyNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)TransactionManager;
  [(TransactionManager *)&v4 dealloc];
}

- (void)appendTransactions:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__TransactionManager_appendTransactions___block_invoke;
  v6[3] = &unk_1E61C7568;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CHSynchronizedLoggable *)self execute:v6];
}

uint64_t __41__TransactionManager_appendTransactions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendTransactions_sync:", *(void *)(a1 + 40));
}

- (void)appendTransactions_sync:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CHSynchronizedLoggable *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = [v4 count];
    _os_log_impl(&dword_1B8E4A000, v5, OS_LOG_TYPE_DEFAULT, "Appending %lu transactions", buf, 0xCu);
  }

  if ([v4 count])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__TransactionManager_appendTransactions_sync___block_invoke;
    v12[3] = &unk_1E61C8408;
    v12[4] = self;
    id v6 = v4;
    id v13 = v6;
    id v7 = (void *)MEMORY[0x1BA9CD2A0](v12);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__TransactionManager_appendTransactions_sync___block_invoke_63;
    v9[3] = &unk_1E61C8430;
    v9[4] = self;
    id v11 = v7;
    id v10 = v6;
    id v8 = v7;
    [(CHSynchronizedLoggable *)self execute:v9];
  }
}

void __46__TransactionManager_appendTransactions_sync___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__TransactionManager_appendTransactions_sync___block_invoke_cold_2();
  }

  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__TransactionManager_appendTransactions_sync___block_invoke_cold_1((uint64_t)v3, v5);
    }
  }
  id v6 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__TransactionManager_appendTransactions_sync___block_invoke_60;
  v7[3] = &unk_1E61C7568;
  v7[4] = v6;
  id v8 = *(id *)(a1 + 40);
  [v6 execute:v7];
}

void __46__TransactionManager_appendTransactions_sync___block_invoke_60(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  [v2 addObjectsFromArray:*(void *)(a1 + 40)];
  id v6 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 48) count];
    int v8 = 134217984;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1B8E4A000, v6, OS_LOG_TYPE_DEFAULT, "Now have %lu queued transactions", (uint8_t *)&v8, 0xCu);
  }
}

void __46__TransactionManager_appendTransactions_sync___block_invoke_63(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[3])
  {
    uint64_t v3 = [v2 logHandle];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E4A000, v3, OS_LOG_TYPE_DEFAULT, "Invalid XPC connection, attempting to create", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "createXpcConnection_sync");
    uint64_t v2 = *(void **)(a1 + 32);
  }
  uint64_t v4 = [v2 logHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B8E4A000, v4, OS_LOG_TYPE_DEFAULT, "Forwarding to XPC Service", v6, 2u);
  }

  id v5 = [*(id *)(*(void *)(a1 + 32) + 24) remoteObjectProxyWithErrorHandler:*(void *)(a1 + 48)];
  [v5 appendTransactions:*(void *)(a1 + 40)];
}

uint64_t __50__TransactionManager_setupConnectionHandlers_sync__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_2;
  v3[3] = &unk_1E61C74A8;
  v3[4] = v1;
  return [v1 execute:v3];
}

void __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[CHLogServer sharedInstance];
  uint64_t v3 = [v2 logHandleForDomain:"TransactionManager"];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1B8E4A000, v3, OS_LOG_TYPE_DEFAULT, "Received Sync Helper ready notification", v7, 2u);
  }

  uint64_t v4 = *(void **)(a1 + 32);
  if (!v4[3])
  {
    objc_msgSend(v4, "createXpcConnection_sync");
    uint64_t v4 = *(void **)(a1 + 32);
  }
  [v4 appendTransactions:v4[6]];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = 0;
}

void __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_66(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_67;
    v5[3] = &unk_1E61C74A8;
    id v6 = WeakRetained;
    [v6 execute:v5];
    uint64_t v3 = v6;
  }
  else
  {
    uint64_t v4 = +[CHLogServer sharedInstance];
    uint64_t v3 = [v4 logHandleForDomain:"TransactionManager"];

    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_66_cold_1();
    }
  }
}

void __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_67(uint64_t a1)
{
  uint64_t v2 = +[CHLogServer sharedInstance];
  uint64_t v3 = [v2 logHandleForDomain:"TransactionManager"];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_67_cold_1();
  }

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;
}

void __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_68()
{
  v0 = +[CHLogServer sharedInstance];
  uint64_t v1 = [v0 logHandleForDomain:"TransactionManager"];

  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_68_cold_1();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedTransactions, 0);
  objc_storeStrong(&self->_syncHelperReadyNotificationRef, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __46__TransactionManager_appendTransactions_sync___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B8E4A000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

void __46__TransactionManager_appendTransactions_sync___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Failed to send transactions to XPC service", v2, v3, v4, v5, v6);
}

void __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_66_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Could not get strong handle to SyncManager!", v2, v3, v4, v5, v6);
}

void __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_67_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Handling invalidated XPC connection", v2, v3, v4, v5, v6);
}

void __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_68_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Interrupted XPC connection, should be reestablished when needed", v2, v3, v4, v5, v6);
}

@end