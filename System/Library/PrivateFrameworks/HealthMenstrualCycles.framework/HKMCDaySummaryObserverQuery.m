@interface HKMCDaySummaryObserverQuery
+ (id)clientInterfaceProtocol;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (HKMCDaySummaryObserverQuery)initWithUpdateHandler:(id)a3;
- (void)client_deliverUpdateWithQueryUUID:(id)a3;
- (void)queue_deliverError:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
@end

@implementation HKMCDaySummaryObserverQuery

+ (id)clientInterfaceProtocol
{
  return &unk_26D7D2E28;
}

- (void)queue_validate
{
  v3.receiver = self;
  v3.super_class = (Class)HKMCDaySummaryObserverQuery;
  [(HKQuery *)&v3 queue_validate];
  if (!self->_updateHandler) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263F0AC10], @"%@ updateHandler must not be nil", objc_opt_class() format];
  }
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 0;
}

- (HKMCDaySummaryObserverQuery)initWithUpdateHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMCDaySummaryObserverQuery;
  v5 = [(HKQuery *)&v9 _initWithObjectType:0 predicate:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id updateHandler = v5->_updateHandler;
    v5->_id updateHandler = (id)v6;
  }
  return v5;
}

- (void)client_deliverUpdateWithQueryUUID:(id)a3
{
  id v4 = a3;
  v5 = [(HKQuery *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__HKMCDaySummaryObserverQuery_client_deliverUpdateWithQueryUUID___block_invoke;
  v7[3] = &unk_2646E94E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__HKMCDaySummaryObserverQuery_client_deliverUpdateWithQueryUUID___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x22A61C290](*(void *)(*(void *)(a1 + 32) + 152));
  objc_super v3 = v2;
  if (v2)
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __65__HKMCDaySummaryObserverQuery_client_deliverUpdateWithQueryUUID___block_invoke_2;
    v6[3] = &unk_2646E94C0;
    v6[4] = v5;
    id v7 = v2;
    objc_msgSend(v5, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v4, 0, v6);
  }
}

uint64_t __65__HKMCDaySummaryObserverQuery_client_deliverUpdateWithQueryUUID___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = v2;
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_2249E9000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Delivering update", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x22A61C290](self->_updateHandler);
  if (v5)
  {
    int v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__HKMCDaySummaryObserverQuery_queue_deliverError___block_invoke;
    block[3] = &unk_2646E9510;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __50__HKMCDaySummaryObserverQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  self->_id updateHandler = 0;
  MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
}

@end