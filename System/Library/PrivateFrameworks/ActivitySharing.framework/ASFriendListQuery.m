@interface ASFriendListQuery
+ (BOOL)supportsTaskServers;
+ (id)clientInterfaceProtocol;
- (ASFriendListQuery)initWithUpdateHandler:(id)a3;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (void)client_deliverFriendList:(id)a3 queryUUID:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
@end

@implementation ASFriendListQuery

- (ASFriendListQuery)initWithUpdateHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASFriendListQuery;
  v5 = [(HKQuery *)&v9 _initWithObjectType:0 predicate:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id updateHandler = v5->_updateHandler;
    v5->_id updateHandler = (id)v6;
  }
  return v5;
}

- (void)client_deliverFriendList:(id)a3 queryUUID:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = self->_mostRecentToken + 1;
  self->_mostRecentToken = v8;
  ASLoggingInitialize();
  objc_super v9 = ASLogFriendList;
  if (os_log_type_enabled((os_log_t)ASLogFriendList, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v19 = v8;
    _os_log_impl(&dword_21EC60000, v9, OS_LOG_TYPE_DEFAULT, "Query received deliverFriendListData: %d", buf, 8u);
  }
  v10 = [(HKQuery *)self queue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__ASFriendListQuery_client_deliverFriendList_queryUUID___block_invoke;
  v13[3] = &unk_2644E8968;
  id v14 = v6;
  v15 = self;
  id v16 = v7;
  int v17 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, v13);
}

void __56__ASFriendListQuery_client_deliverFriendList_queryUUID___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [[ASCodableFriendList alloc] initWithData:*(void *)(a1 + 32)];
  v3 = ASFriendsFromCodableFriendList(v2);
  ASLoggingInitialize();
  id v4 = (void *)ASLogFriendList;
  if (os_log_type_enabled((os_log_t)ASLogFriendList, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = [v3 count];
    _os_log_impl(&dword_21EC60000, v5, OS_LOG_TYPE_DEFAULT, "Received data for %lu friends", buf, 0xCu);
  }
  id v6 = (void *)MEMORY[0x223C38130](*(void *)(*(void *)(a1 + 40) + 152));
  id v7 = v6;
  if (v6)
  {
    int v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __56__ASFriendListQuery_client_deliverFriendList_queryUUID___block_invoke_4;
    v10[3] = &unk_2644E8940;
    int v13 = *(_DWORD *)(a1 + 56);
    v10[4] = v8;
    id v12 = v6;
    id v11 = v3;
    objc_msgSend(v8, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v9, 0, v10);
  }
}

void __56__ASFriendListQuery_client_deliverFriendList_queryUUID___block_invoke_4(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a1 + 56) == *(_DWORD *)(*(void *)(a1 + 32) + 160))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
  else
  {
    ASLoggingInitialize();
    v3 = ASLogFriendList;
    if (os_log_type_enabled((os_log_t)ASLogFriendList, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(_DWORD *)(a1 + 56);
      v5[0] = 67109120;
      v5[1] = v4;
      _os_log_impl(&dword_21EC60000, v3, OS_LOG_TYPE_DEFAULT, "Dropping this update for stale token: %d", (uint8_t *)v5, 8u);
    }
  }
}

+ (BOOL)supportsTaskServers
{
  return 1;
}

+ (id)clientInterfaceProtocol
{
  return &unk_26D058998;
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASFriendListQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id updateHandler = self->_updateHandler;
  self->_id updateHandler = 0;
}

- (void)queue_validate
{
  v3.receiver = self;
  v3.super_class = (Class)ASFriendListQuery;
  [(HKQuery *)&v3 queue_validate];
  if (!self->_updateHandler) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263F0AC10], @"%@ updateHandler must not be nil", objc_opt_class() format];
  }
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 0;
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x223C38130](self->_updateHandler);
  if (v5)
  {
    uint64_t v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__ASFriendListQuery_queue_deliverError___block_invoke;
    block[3] = &unk_2644E8990;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __40__ASFriendListQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void).cxx_destruct
{
}

@end