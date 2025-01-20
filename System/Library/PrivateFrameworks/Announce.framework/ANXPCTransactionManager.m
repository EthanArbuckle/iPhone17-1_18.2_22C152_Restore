@interface ANXPCTransactionManager
+ (id)sharedManager;
- (ANXPCTransactionManager)init;
- (NSArray)activeTransactions;
- (NSMutableDictionary)transactions;
- (OS_dispatch_queue)queue;
- (id)_createTransaction:(id)a3;
- (id)_overview;
- (id)description;
- (id)transaction:(id)a3 forEndpointUUID:(id)a4;
- (unint64_t)_currentStatus;
- (unint64_t)status;
- (void)_cancelTimer:(id)a3;
- (void)_createTransaction:(id)a3 expiration:(double)a4;
- (void)_removeTransaction:(id)a3;
- (void)_resetTimer:(id)a3 expiration:(double)a4;
- (void)_startTimer:(id)a3 expiration:(double)a4;
- (void)_transaction:(id)a3 setActive:(BOOL)a4;
- (void)_transaction:(id)a3 setActiveForTimeInterval:(double)a4;
- (void)transaction:(id)a3 setActive:(BOOL)a4;
- (void)transaction:(id)a3 setActiveForTimeInterval:(double)a4;
@end

@implementation ANXPCTransactionManager

- (ANXPCTransactionManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)ANXPCTransactionManager;
  v2 = [(ANXPCTransactionManager *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    transactions = v2->_transactions;
    v2->_transactions = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.announce.transaction-manager.queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__ANXPCTransactionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_sharedManager;

  return v2;
}

uint64_t __40__ANXPCTransactionManager_sharedManager__block_invoke()
{
  sharedManager_sharedManager = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (id)description
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = &stru_26D2D46B0;
  uint64_t v3 = [(ANXPCTransactionManager *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__ANXPCTransactionManager_description__block_invoke;
  v6[3] = &unk_264587418;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __38__ANXPCTransactionManager_description__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _overview];

  return MEMORY[0x270F9A758]();
}

- (unint64_t)status
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(ANXPCTransactionManager *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__ANXPCTransactionManager_status__block_invoke;
  v6[3] = &unk_264587418;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __33__ANXPCTransactionManager_status__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _currentStatus];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSArray)activeTransactions
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  id v12 = (id)MEMORY[0x263EFFA68];
  uint64_t v3 = [(ANXPCTransactionManager *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__ANXPCTransactionManager_activeTransactions__block_invoke;
  v6[3] = &unk_264587418;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __45__ANXPCTransactionManager_activeTransactions__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) transactions];
  uint64_t v2 = [v5 allKeys];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)transaction:(id)a3 forEndpointUUID:(id)a4
{
  id v5 = a4;
  dispatch_queue_t v6 = [MEMORY[0x263F089D8] stringWithString:a3];
  if (v5)
  {
    uint64_t v7 = [v5 UUIDString];
    [v6 appendFormat:@".%@", v7];
  }
  v8 = (void *)[v6 copy];

  return v8;
}

- (void)transaction:(id)a3 setActive:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [(ANXPCTransactionManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ANXPCTransactionManager_transaction_setActive___block_invoke;
  block[3] = &unk_264587440;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __49__ANXPCTransactionManager_transaction_setActive___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transaction:*(void *)(a1 + 40) setActive:*(unsigned __int8 *)(a1 + 48)];
}

- (void)transaction:(id)a3 setActiveForTimeInterval:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [(ANXPCTransactionManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__ANXPCTransactionManager_transaction_setActiveForTimeInterval___block_invoke;
  block[3] = &unk_264587468;
  block[4] = self;
  id v10 = v6;
  double v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __64__ANXPCTransactionManager_transaction_setActiveForTimeInterval___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transaction:*(void *)(a1 + 40) setActiveForTimeInterval:*(double *)(a1 + 48)];
}

- (unint64_t)_currentStatus
{
  uint64_t v3 = [(ANXPCTransactionManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(ANXPCTransactionManager *)self transactions];
  unint64_t v5 = [v4 count] != 0;

  return v5;
}

- (id)_overview
{
  uint64_t v3 = [(ANXPCTransactionManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [MEMORY[0x263F089D8] stringWithString:@"\n===== Active Transactions =====\n"];
  unint64_t v5 = [(ANXPCTransactionManager *)self transactions];
  id v6 = [v5 allKeys];
  uint64_t v7 = [v6 componentsJoinedByString:@"\n"];
  [v4 appendString:v7];

  [v4 appendString:@"\n==============================="];
  id v8 = (void *)[v4 copy];

  return v8;
}

- (void)_transaction:(id)a3 setActive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(ANXPCTransactionManager *)self queue];
  dispatch_assert_queue_V2(v7);

  if (v4)
  {
    id v8 = [(ANXPCTransactionManager *)self transactions];
    uint64_t v9 = [v8 valueForKey:v6];

    if (v9)
    {
      id v10 = ANLogHandleXPCTransactionManager();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412546;
        v13 = &stru_26D2D46B0;
        __int16 v14 = 2112;
        id v15 = v6;
        _os_log_impl(&dword_220FAA000, v10, OS_LOG_TYPE_DEFAULT, "%@Request to set transaction active but already active: %@", (uint8_t *)&v12, 0x16u);
      }
    }
    else
    {
      id v11 = [(ANXPCTransactionManager *)self _createTransaction:v6];
    }
  }
  else
  {
    [(ANXPCTransactionManager *)self _removeTransaction:v6];
  }
}

- (void)_transaction:(id)a3 setActiveForTimeInterval:(double)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(ANXPCTransactionManager *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(ANXPCTransactionManager *)self transactions];
  uint64_t v9 = [v8 valueForKey:v6];

  if (v9)
  {
    id v10 = ANLogHandleXPCTransactionManager();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      v13 = &stru_26D2D46B0;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_220FAA000, v10, OS_LOG_TYPE_DEFAULT, "%@Request to set transaction active but already active: %@", (uint8_t *)&v12, 0x16u);
    }

    id v11 = [v9 timer];
    if (v11)
    {
      [v9 expiration];
      -[ANXPCTransactionManager _resetTimer:expiration:](self, "_resetTimer:expiration:", v11);
    }
  }
  else
  {
    [(ANXPCTransactionManager *)self _createTransaction:v6 expiration:a4];
  }
}

- (id)_createTransaction:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 UTF8String];
  unint64_t v5 = (void *)os_transaction_create();
  if (v5)
  {
    id v6 = +[ANTransactionInfo infoWithTransaction:v5];
    uint64_t v7 = [(ANXPCTransactionManager *)self transactions];
    [v7 setValue:v6 forKey:v4];
  }
  else
  {
    id v6 = 0;
  }
  id v8 = ANLogHandleXPCTransactionManager();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = @"TRUE";
    int v13 = 138412802;
    __int16 v14 = &stru_26D2D46B0;
    __int16 v15 = 2112;
    if (!v5) {
      uint64_t v9 = @"FALSE";
    }
    id v16 = v4;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_220FAA000, v8, OS_LOG_TYPE_DEFAULT, "%@Created Transaction %@: %@", (uint8_t *)&v13, 0x20u);
  }

  id v10 = ANLogHandleXPCTransactionManager();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(ANXPCTransactionManager *)self _overview];
    int v13 = 138412546;
    __int16 v14 = &stru_26D2D46B0;
    __int16 v15 = 2112;
    id v16 = v11;
    _os_log_impl(&dword_220FAA000, v10, OS_LOG_TYPE_DEFAULT, "%@%@", (uint8_t *)&v13, 0x16u);
  }

  return v6;
}

- (void)_createTransaction:(id)a3 expiration:(double)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(ANXPCTransactionManager *)self queue];
  id v8 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v7);

  uint64_t v9 = ANLogHandleXPCTransactionManager();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v20 = &stru_26D2D46B0;
      __int16 v21 = 2112;
      v22 = v8;
      __int16 v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_220FAA000, v10, OS_LOG_TYPE_DEFAULT, "%@Created Transaction Timer %@ for %@", buf, 0x20u);
    }

    id v11 = [(ANXPCTransactionManager *)self _createTransaction:v6];
    id v10 = v11;
    if (v11)
    {
      [v11 setTimer:v8];
      [v10 setExpiration:a4];
      objc_initWeak((id *)buf, self);
      uint64_t v13 = MEMORY[0x263EF8330];
      uint64_t v14 = 3221225472;
      __int16 v15 = __57__ANXPCTransactionManager__createTransaction_expiration___block_invoke;
      id v16 = &unk_264587140;
      objc_copyWeak(&v18, (id *)buf);
      __int16 v17 = v6;
      dispatch_source_set_event_handler(v8, &v13);
      -[ANXPCTransactionManager _startTimer:expiration:](self, "_startTimer:expiration:", v8, a4, v13, v14, v15, v16);

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      int v12 = ANLogHandleXPCTransactionManager();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v20 = &stru_26D2D46B0;
        __int16 v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_220FAA000, v12, OS_LOG_TYPE_ERROR, "%@Failed to create transaction: %@", buf, 0x16u);
      }
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v20 = &stru_26D2D46B0;
    __int16 v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_220FAA000, v10, OS_LOG_TYPE_ERROR, "%@Failed to create timer for transaction. Transaction not created: %@", buf, 0x16u);
  }
}

void __57__ANXPCTransactionManager__createTransaction_expiration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeTransaction:*(void *)(a1 + 32)];
}

- (void)_removeTransaction:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(ANXPCTransactionManager *)self transactions];
  id v6 = [v5 valueForKey:v4];

  if (v6)
  {
    unint64_t v7 = [(ANXPCTransactionManager *)self _currentStatus];
    id v8 = [v6 timer];
    if (v8) {
      [(ANXPCTransactionManager *)self _cancelTimer:v8];
    }
    uint64_t v9 = [(ANXPCTransactionManager *)self transactions];
    [v9 removeObjectForKey:v4];

    unint64_t v10 = [(ANXPCTransactionManager *)self _currentStatus];
    if (v7 == 1 && !v10)
    {
      id v11 = ANLogHandleXPCTransactionManager();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412802;
        __int16 v17 = &stru_26D2D46B0;
        __int16 v18 = 2048;
        uint64_t v19 = 1;
        __int16 v20 = 2048;
        __int16 v21 = 0;
        _os_log_impl(&dword_220FAA000, v11, OS_LOG_TYPE_DEFAULT, "%@Transaction Status: %lu -> %lu", (uint8_t *)&v16, 0x20u);
      }
    }
  }
  int v12 = ANLogHandleXPCTransactionManager();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = @"TRUE";
    int v16 = 138412802;
    __int16 v17 = &stru_26D2D46B0;
    __int16 v18 = 2112;
    uint64_t v19 = (uint64_t)v4;
    if (!v6) {
      uint64_t v13 = @"FALSE";
    }
    __int16 v20 = 2112;
    __int16 v21 = v13;
    _os_log_impl(&dword_220FAA000, v12, OS_LOG_TYPE_DEFAULT, "%@Removed Transaction %@: %@", (uint8_t *)&v16, 0x20u);
  }

  uint64_t v14 = ANLogHandleXPCTransactionManager();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = [(ANXPCTransactionManager *)self _overview];
    int v16 = 138412546;
    __int16 v17 = &stru_26D2D46B0;
    __int16 v18 = 2112;
    uint64_t v19 = (uint64_t)v15;
    _os_log_impl(&dword_220FAA000, v14, OS_LOG_TYPE_DEFAULT, "%@%@", (uint8_t *)&v16, 0x16u);
  }
}

- (void)_startTimer:(id)a3 expiration:(double)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t v5 = a3;
  id v6 = ANLogHandleXPCTransactionManager();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    unint64_t v10 = &stru_26D2D46B0;
    __int16 v11 = 2112;
    int v12 = v5;
    __int16 v13 = 2048;
    double v14 = a4;
    _os_log_impl(&dword_220FAA000, v6, OS_LOG_TYPE_DEFAULT, "%@Starting Transaction Timer (%@) for %f seconds", (uint8_t *)&v9, 0x20u);
  }

  double v7 = a4 * 1000000000.0;
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)v7);
  dispatch_source_set_timer(v5, v8, (unint64_t)v7, 0);
  dispatch_resume(v5);
}

- (void)_resetTimer:(id)a3 expiration:(double)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = ANLogHandleXPCTransactionManager();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    int v9 = &stru_26D2D46B0;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    _os_log_impl(&dword_220FAA000, v7, OS_LOG_TYPE_DEFAULT, "%@Restarting Transaction Timer %@", (uint8_t *)&v8, 0x16u);
  }

  dispatch_suspend(v6);
  [(ANXPCTransactionManager *)self _startTimer:v6 expiration:a4];
}

- (void)_cancelTimer:(id)a3
{
}

- (NSMutableDictionary)transactions
{
  return self->_transactions;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_transactions, 0);
}

@end