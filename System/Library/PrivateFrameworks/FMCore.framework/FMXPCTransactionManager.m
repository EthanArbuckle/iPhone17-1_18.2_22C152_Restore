@interface FMXPCTransactionManager
+ (id)sharedInstance;
- (FMXPCTransactionManager)init;
- (NSCountedSet)activeTransactions;
- (NSString)keepAliveActivityIdentifier;
- (OS_dispatch_queue)txn_ops_queue;
- (OS_os_transaction)masterTransaction;
- (id)dumpActiveTransactions;
- (id)initSingleton;
- (void)_disableKeepAlive;
- (void)_disableLaunchOnRebootActivity:(id)a3;
- (void)_disableOldKeepAliveActivity;
- (void)_enableKeepAlive;
- (void)beginTransaction:(id)a3;
- (void)dealloc;
- (void)endTransaction:(id)a3;
- (void)init;
- (void)initSingleton;
- (void)setActiveTransactions:(id)a3;
- (void)setKeepAliveActivityIdentifier:(id)a3;
- (void)setLaunchOnRebootActivity:(id)a3 keepAliveActivity:(id)a4;
- (void)setMasterTransaction:(id)a3;
- (void)setTxn_ops_queue:(id)a3;
@end

@implementation FMXPCTransactionManager

- (void)endTransaction:(id)a3
{
  id v4 = a3;
  v5 = [(FMXPCTransactionManager *)self txn_ops_queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__FMXPCTransactionManager_endTransaction___block_invoke;
  v7[3] = &unk_1E689E690;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)beginTransaction:(id)a3
{
  id v4 = a3;
  v5 = [(FMXPCTransactionManager *)self txn_ops_queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__FMXPCTransactionManager_beginTransaction___block_invoke;
  v7[3] = &unk_1E689E690;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)_enableKeepAlive
{
  v3 = [(FMXPCTransactionManager *)self keepAliveActivityIdentifier];

  if (v3)
  {
    id v4 = LogCategory_Unspecified();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1D0EC4000, v4, OS_LOG_TYPE_INFO, "Registering keep-alive-on-dirty XPC activity", v8, 2u);
    }

    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F142F8], 1);
    xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E4F141C8], 600);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F14138], 1);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F142B0], 1);
    xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E4F14170], 600);
    xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E4F141A8], 60);
    id v6 = [(FMXPCTransactionManager *)self keepAliveActivityIdentifier];
    v7 = (const char *)[v6 cStringUsingEncoding:4];

    xpc_activity_register(v7, v5, &__block_literal_global_7);
  }
}

- (void)_disableKeepAlive
{
  v3 = [(FMXPCTransactionManager *)self keepAliveActivityIdentifier];

  if (v3)
  {
    id v4 = LogCategory_Unspecified();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D0EC4000, v4, OS_LOG_TYPE_INFO, "Unregistering keep-alive-on-dirty XPC activity", v6, 2u);
    }

    id v5 = [(FMXPCTransactionManager *)self keepAliveActivityIdentifier];
    xpc_activity_unregister((const char *)[v5 cStringUsingEncoding:4]);
  }
}

- (NSString)keepAliveActivityIdentifier
{
  return self->_keepAliveActivityIdentifier;
}

void __42__FMXPCTransactionManager_endTransaction___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) activeTransactions];
  uint64_t v3 = [v2 countForObject:*(void *)(a1 + 40)];

  id v4 = LogCategory_Unspecified();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v6 = *(void **)(a1 + 40);
      int v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1D0EC4000, v5, OS_LOG_TYPE_INFO, "Ending xpc transaction %@", (uint8_t *)&v12, 0xCu);
    }

    v7 = [*(id *)(a1 + 32) activeTransactions];
    [v7 removeObject:*(void *)(a1 + 40)];

    id v8 = [*(id *)(a1 + 32) activeTransactions];
    uint64_t v9 = [v8 count];

    if (!v9)
    {
      [*(id *)(a1 + 32) _disableKeepAlive];
      [*(id *)(a1 + 32) setMasterTransaction:0];
    }
    id v5 = LogCategory_Unspecified();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = [*(id *)(a1 + 32) activeTransactions];
      int v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1D0EC4000, v5, OS_LOG_TYPE_INFO, "Active transactions : %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(void **)(a1 + 40);
    int v12 = 138412290;
    v13 = v11;
    _os_log_impl(&dword_1D0EC4000, v5, OS_LOG_TYPE_DEFAULT, "Trying to end xpc transaction %@ too many times", (uint8_t *)&v12, 0xCu);
  }
}

- (NSCountedSet)activeTransactions
{
  return self->_activeTransactions;
}

void __44__FMXPCTransactionManager_beginTransaction___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    int v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1D0EC4000, v2, OS_LOG_TYPE_INFO, "Beginning xpc transaction %@", (uint8_t *)&v10, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) activeTransactions];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    [*(id *)(a1 + 40) _enableKeepAlive];
    [@"com.apple.icloud.FMCore.FMXPCTransactionManager" UTF8String];
    id v6 = (void *)os_transaction_create();
    [*(id *)(a1 + 40) setMasterTransaction:v6];
  }
  v7 = [*(id *)(a1 + 40) activeTransactions];
  [v7 addObject:*(void *)(a1 + 32)];

  id v8 = LogCategory_Unspecified();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [*(id *)(a1 + 40) activeTransactions];
    int v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1D0EC4000, v8, OS_LOG_TYPE_INFO, "Active transactions : %@", (uint8_t *)&v10, 0xCu);
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_dispatch_predicate != -1) {
    dispatch_once(&sharedInstance_dispatch_predicate, &__block_literal_global);
  }
  v2 = (void *)_instance;
  return v2;
}

- (OS_dispatch_queue)txn_ops_queue
{
  return self->_txn_ops_queue;
}

- (void)setMasterTransaction:(id)a3
{
}

void __41__FMXPCTransactionManager_sharedInstance__block_invoke()
{
  v0 = LogCategory_Unspecified();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __41__FMXPCTransactionManager_sharedInstance__block_invoke_cold_1(v0);
  }

  id v1 = [[FMXPCTransactionManager alloc] initSingleton];
  v2 = (void *)_instance;
  _instance = (uint64_t)v1;
}

- (FMXPCTransactionManager)init
{
  uint64_t v3 = LogCategory_Unspecified();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[FMXPCTransactionManager init](v3);
  }

  return 0;
}

- (id)initSingleton
{
  v7.receiver = self;
  v7.super_class = (Class)FMXPCTransactionManager;
  v2 = [(FMXPCTransactionManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = LogCategory_Unspecified();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[FMXPCTransactionManager initSingleton](v3);
    }

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.icloud.fmcore.xpcTransactionManagementQueue", 0);
    [(FMXPCTransactionManager *)v2 setTxn_ops_queue:v4];

    uint64_t v5 = [MEMORY[0x1E4F28BD0] set];
    [(FMXPCTransactionManager *)v2 setActiveTransactions:v5];
  }
  return v2;
}

- (void)setLaunchOnRebootActivity:(id)a3 keepAliveActivity:(id)a4
{
  id v6 = a4;
  [(FMXPCTransactionManager *)self _disableLaunchOnRebootActivity:a3];
  [(FMXPCTransactionManager *)self setKeepAliveActivityIdentifier:v6];

  [(FMXPCTransactionManager *)self _disableOldKeepAliveActivity];
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a1, "fm_logID");
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1D0EC4000, a2, OS_LOG_TYPE_DEBUG, "%@ deallocating...", (uint8_t *)&v4, 0xCu);
}

- (id)dumpActiveTransactions
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  uint64_t v3 = [(FMXPCTransactionManager *)self txn_ops_queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__FMXPCTransactionManager_dumpActiveTransactions__block_invoke;
  v6[3] = &unk_1E689E9D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __49__FMXPCTransactionManager_dumpActiveTransactions__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) activeTransactions];
  uint64_t v2 = [v5 description];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __43__FMXPCTransactionManager__enableKeepAlive__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  xpc_object_t v4 = xpc_activity_copy_criteria(v2);
  if (state == 2)
  {
    BOOL v5 = xpc_activity_set_state(v2, 5);
    uint64_t v6 = LogCategory_Unspecified();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 67109120;
      LODWORD(v11) = v5;
      uint64_t v7 = "keep-alive-on-dirty triggered. updating this repetition to done so that it can continue to wait for the next "
           "repetition. success : %d";
      id v8 = v6;
      uint32_t v9 = 8;
LABEL_6:
      _os_log_impl(&dword_1D0EC4000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v10, v9);
    }
  }
  else
  {
    uint64_t v6 = LogCategory_Unspecified();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 134218240;
      xpc_activity_state_t v11 = state;
      __int16 v12 = 2048;
      xpc_object_t v13 = v4;
      uint64_t v7 = "keep-alive-on-dirty XPC activity changed to state %ld with criteria %p";
      id v8 = v6;
      uint32_t v9 = 22;
      goto LABEL_6;
    }
  }
}

- (void)_disableLaunchOnRebootActivity:(id)a3
{
  id v3 = a3;
  xpc_object_t v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1D0EC4000, v4, OS_LOG_TYPE_INFO, "Unregistering launch-on-reboot XPC activity", v7, 2u);
  }

  id v5 = v3;
  uint64_t v6 = (const char *)[v5 cStringUsingEncoding:4];

  xpc_activity_unregister(v6);
}

- (void)_disableOldKeepAliveActivity
{
  id v3 = LogCategory_Unspecified();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D0EC4000, v3, OS_LOG_TYPE_INFO, "Unregistering old keep-alive-on-dirty XPC activity", v5, 2u);
  }

  id v4 = [(FMXPCTransactionManager *)self keepAliveActivityIdentifier];
  xpc_activity_unregister((const char *)[v4 cStringUsingEncoding:4]);
}

- (void)setTxn_ops_queue:(id)a3
{
}

- (void)setActiveTransactions:(id)a3
{
}

- (void)setKeepAliveActivityIdentifier:(id)a3
{
}

- (OS_os_transaction)masterTransaction
{
  return self->_masterTransaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masterTransaction, 0);
  objc_storeStrong((id *)&self->_keepAliveActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_activeTransactions, 0);
  objc_storeStrong((id *)&self->_txn_ops_queue, 0);
}

void __41__FMXPCTransactionManager_sharedInstance__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_1D0EC4000, log, OS_LOG_TYPE_DEBUG, "Creating shared instance of FMXPCTransactionManager", v1, 2u);
}

- (void)init
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1D0EC4000, log, OS_LOG_TYPE_ERROR, "*** Trying to explicitly init FMXPCTransactionManager. Use 'sharedInstance'", v1, 2u);
}

- (void)initSingleton
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_1D0EC4000, log, OS_LOG_TYPE_DEBUG, "FMXPCTransactionManager: initialize", v1, 2u);
}

@end