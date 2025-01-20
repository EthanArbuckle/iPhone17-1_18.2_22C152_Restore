@interface ACCPlatformTransactionManager
+ (id)sharedManager;
- (ACCPlatformTransactionManager)init;
- (NSMutableDictionary)transactions;
- (OS_dispatch_queue)timerQueue;
- (OS_dispatch_queue)transactionsLock;
- (OS_dispatch_source)timerSource;
- (void)addTransactionForConnectionUUID:(id)a3;
- (void)dealloc;
- (void)removeTransactionForConnectionUUID:(id)a3;
- (void)setTimerQueue:(id)a3;
- (void)setTimerSource:(id)a3;
- (void)setTransactions:(id)a3;
- (void)setTransactionsLock:(id)a3;
@end

@implementation ACCPlatformTransactionManager

- (ACCPlatformTransactionManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)ACCPlatformTransactionManager;
  id v2 = [(ACCPlatformTransactionManager *)&v15 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.accessoryd.transactionsListLock", 0);
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.accessoryd.lastTransactionTimerQueue", 0);
    v8 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v7;

    dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v2 + 3));
    v10 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v9;

    v11 = *((void *)v2 + 4);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = __37__ACCPlatformTransactionManager_init__block_invoke;
    handler[3] = &unk_1002158C8;
    id v14 = v2;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 4), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(*((dispatch_object_t *)v2 + 4));
  }
  return (ACCPlatformTransactionManager *)v2;
}

void __37__ACCPlatformTransactionManager_init__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) transactionsLock];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __37__ACCPlatformTransactionManager_init__block_invoke_2;
  block[3] = &unk_1002158C8;
  id v4 = *(id *)(a1 + 32);
  dispatch_sync(v2, block);
}

void __37__ACCPlatformTransactionManager_init__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id v2 = [*(id *)(a1 + 32) transactions];
  id v3 = [v2 count];

  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 7;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    v6 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v11 = 134217984;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[#Transactions] lastTransactionTimer FIRED!! count: %lu", (uint8_t *)&v11, 0xCu);
  }

  if (v3 == (id)1)
  {
    dispatch_queue_t v7 = [*v1 transactions];
    v8 = +[NSString stringWithUTF8String:"com.apple.accessoryd.daemonDirty"];
    [v7 removeObjectForKey:v8];
  }
  if (gLogObjects && gNumLogObjects >= 7)
  {
    dispatch_source_t v9 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    dispatch_source_t v9 = &_os_log_default;
    id v10 = &_os_log_default;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __37__ACCPlatformTransactionManager_init__block_invoke_2_cold_1(v1);
  }

  dispatch_source_set_timer(*((dispatch_source_t *)*v1 + 4), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)dealloc
{
  timerSource = self->_timerSource;
  if (timerSource) {
    dispatch_source_cancel(timerSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)ACCPlatformTransactionManager;
  [(ACCPlatformTransactionManager *)&v4 dealloc];
}

- (void)addTransactionForConnectionUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(ACCPlatformTransactionManager *)self transactionsLock];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __65__ACCPlatformTransactionManager_addTransactionForConnectionUUID___block_invoke;
    v6[3] = &unk_100215968;
    id v7 = v4;
    v8 = self;
    dispatch_sync(v5, v6);
  }
}

void __65__ACCPlatformTransactionManager_addTransactionForConnectionUUID___block_invoke(uint64_t a1)
{
  id v2 = +[NSMutableString stringWithUTF8String:"com.apple.accessoryd."];
  id v3 = (uint64_t *)(a1 + 32);
  [v2 appendString:*(void *)(a1 + 32)];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 7;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    v6 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v23 = 138412290;
    v24 = v2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[#Transactions] transactionIDKey %@", (uint8_t *)&v23, 0xCu);
  }

  v8 = *(void **)(a1 + 40);
  id v7 = (id *)(a1 + 40);
  dispatch_source_t v9 = [v8 transactions];
  id v10 = [v9 objectForKey:v2];

  if (v10)
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      int v11 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      int v11 = &_os_log_default;
      id v12 = &_os_log_default;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __65__ACCPlatformTransactionManager_addTransactionForConnectionUUID___block_invoke_cold_3(v3, v11);
    }
  }
  id v13 = v2;
  [v13 UTF8String];
  id v14 = (void *)os_transaction_create();

  if (v14)
  {
    objc_super v15 = [*v7 transactions];
    [v15 setObject:v14 forKey:v13];
  }
  v16 = [*v7 transactions];
  id v17 = [v16 count];

  if (v17 == (id)1)
  {
    v18 = (void *)os_transaction_create();
    v19 = [*v7 transactions];
    v20 = +[NSString stringWithUTF8String:"com.apple.accessoryd.daemonDirty"];
    [v19 setObject:v18 forKey:v20];
  }
  if (gLogObjects && gNumLogObjects >= 7)
  {
    v21 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v21 = &_os_log_default;
    id v22 = &_os_log_default;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    __37__ACCPlatformTransactionManager_init__block_invoke_2_cold_1(v7);
  }
}

- (void)removeTransactionForConnectionUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(ACCPlatformTransactionManager *)self transactionsLock];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __68__ACCPlatformTransactionManager_removeTransactionForConnectionUUID___block_invoke;
    v6[3] = &unk_100215968;
    id v7 = v4;
    v8 = self;
    dispatch_sync(v5, v6);
  }
}

void __68__ACCPlatformTransactionManager_removeTransactionForConnectionUUID___block_invoke(uint64_t a1)
{
  id v2 = +[NSMutableString stringWithUTF8String:"com.apple.accessoryd."];
  id v3 = (uint64_t *)(a1 + 32);
  [v2 appendString:*(void *)(a1 + 32)];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 7;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    v6 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v21 = 138412290;
    id v22 = v2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[#Transactions] transactionIDKey %@", (uint8_t *)&v21, 0xCu);
  }

  v8 = *(void **)(a1 + 40);
  id v7 = (id *)(a1 + 40);
  dispatch_source_t v9 = [v8 transactions];
  id v10 = [v9 objectForKey:v2];

  if (v10)
  {
    int v11 = [*v7 transactions];
    [v11 removeObjectForKey:v2];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      int v11 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      int v11 = &_os_log_default;
      id v12 = &_os_log_default;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __68__ACCPlatformTransactionManager_removeTransactionForConnectionUUID___block_invoke_cold_4(v3, v11);
    }
  }

  id v13 = [*v7 transactions];
  id v14 = [v13 count];

  if (v14 == (id)1)
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      objc_super v15 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      objc_super v15 = &_os_log_default;
      id v16 = &_os_log_default;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[#Transactions] starting lastTransactionTimer!!", (uint8_t *)&v21, 2u);
    }

    id v17 = [*v7 timerSource];
    dispatch_time_t v18 = dispatch_walltime(0, 60000000000);
    dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  if (gLogObjects && gNumLogObjects >= 7)
  {
    v19 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v19 = &_os_log_default;
    id v20 = &_os_log_default;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    __37__ACCPlatformTransactionManager_init__block_invoke_2_cold_1(v7);
  }
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __46__ACCPlatformTransactionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedManager_once_9 != -1) {
    dispatch_once(&sharedManager_once_9, block);
  }
  id v2 = (void *)sharedManager_sharedInstance_9;

  return v2;
}

uint64_t __46__ACCPlatformTransactionManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedInstance_9 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

- (NSMutableDictionary)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
}

- (OS_dispatch_queue)transactionsLock
{
  return self->_transactionsLock;
}

- (void)setTransactionsLock:(id)a3
{
}

- (OS_dispatch_queue)timerQueue
{
  return self->_timerQueue;
}

- (void)setTimerQueue:(id)a3
{
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_transactionsLock, 0);

  objc_storeStrong((id *)&self->_transactions, 0);
}

void __37__ACCPlatformTransactionManager_init__block_invoke_2_cold_1(id *a1)
{
  v1 = [*a1 transactions];
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v2, v3, "[#Transactions] transactions: %@", v4, v5, v6, v7, 2u);
}

void __65__ACCPlatformTransactionManager_addTransactionForConnectionUUID___block_invoke_cold_3(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[#Transactions] Transaction %@ exists", (uint8_t *)&v3, 0xCu);
}

void __68__ACCPlatformTransactionManager_removeTransactionForConnectionUUID___block_invoke_cold_4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[#Transactions] Transaction %@ does not exist", (uint8_t *)&v3, 0xCu);
}

@end