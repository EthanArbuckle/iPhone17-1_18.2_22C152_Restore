@interface ACHCurrentActivitySummaryQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
- (ACHCurrentActivitySummaryQuery)initWithUpdateHandler:(id)a3;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (NSDictionary)collectionIntervals;
- (id)updateHandler;
- (void)_setCollectionIntervals:(id)a3;
- (void)client_deliverTodaySummary:(id)a3 changedTodayFields:(unint64_t)a4 yesterdaySummary:(id)a5 changedYesterdayFields:(unint64_t)a6 queryUUID:(id)a7;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
- (void)setCollectionIntervals:(id)a3;
- (void)setUpdateHandler:(id)a3;
@end

@implementation ACHCurrentActivitySummaryQuery

- (ACHCurrentActivitySummaryQuery)initWithUpdateHandler:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F0A598] activitySummaryType];
  v10.receiver = self;
  v10.super_class = (Class)ACHCurrentActivitySummaryQuery;
  v6 = [(HKQuery *)&v10 _initWithObjectType:v5 predicate:0];

  if (v6)
  {
    uint64_t v7 = [v4 copy];
    id updateHandler = v6->_updateHandler;
    v6->_id updateHandler = (id)v7;
  }
  return v6;
}

- (void)client_deliverTodaySummary:(id)a3 changedTodayFields:(unint64_t)a4 yesterdaySummary:(id)a5 changedYesterdayFields:(unint64_t)a6 queryUUID:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  v15 = [(HKQuery *)self queue];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __130__ACHCurrentActivitySummaryQuery_client_deliverTodaySummary_changedTodayFields_yesterdaySummary_changedYesterdayFields_queryUUID___block_invoke;
  v19[3] = &unk_2645122A0;
  v19[4] = self;
  id v20 = v14;
  id v21 = v12;
  id v22 = v13;
  unint64_t v23 = a4;
  unint64_t v24 = a6;
  id v16 = v13;
  id v17 = v12;
  id v18 = v14;
  dispatch_async(v15, v19);
}

void __130__ACHCurrentActivitySummaryQuery_client_deliverTodaySummary_changedTodayFields_yesterdaySummary_changedYesterdayFields_queryUUID___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C4F6B0](*(void *)(*(void *)(a1 + 32) + 152));
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __130__ACHCurrentActivitySummaryQuery_client_deliverTodaySummary_changedTodayFields_yesterdaySummary_changedYesterdayFields_queryUUID___block_invoke_2;
    v7[3] = &unk_264512278;
    v8 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    long long v12 = *(_OWORD *)(a1 + 64);
    id v5 = v2;
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = v5;
    objc_msgSend(v3, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v4, 0, v7);

    v6 = v8;
  }
  else
  {
    v6 = ACHLogXPC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __130__ACHCurrentActivitySummaryQuery_client_deliverTodaySummary_changedTodayFields_yesterdaySummary_changedYesterdayFields_queryUUID___block_invoke_cold_1();
    }
  }
}

uint64_t __130__ACHCurrentActivitySummaryQuery_client_deliverTodaySummary_changedTodayFields_yesterdaySummary_changedYesterdayFields_queryUUID___block_invoke_2(uint64_t a1)
{
  v2 = ACHLogXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __130__ACHCurrentActivitySummaryQuery_client_deliverTodaySummary_changedTodayFields_yesterdaySummary_changedYesterdayFields_queryUUID___block_invoke_2_cold_1();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_26D0FCA40;
}

- (void)queue_populateConfiguration:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ACHCurrentActivitySummaryQuery;
  id v4 = a3;
  [(HKQuery *)&v6 queue_populateConfiguration:v4];
  id v5 = [(ACHCurrentActivitySummaryQuery *)self collectionIntervals];
  [v4 setCollectionIntervals:v5];
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ACHCurrentActivitySummaryQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id updateHandler = self->_updateHandler;
  self->_id updateHandler = 0;
}

- (void)queue_validate
{
  v3.receiver = self;
  v3.super_class = (Class)ACHCurrentActivitySummaryQuery;
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
  objc_super v5 = (void *)MEMORY[0x223C4F6B0](self->_updateHandler);
  if (v5)
  {
    objc_super v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__ACHCurrentActivitySummaryQuery_queue_deliverError___block_invoke;
    block[3] = &unk_2645122C8;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __53__ACHCurrentActivitySummaryQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, 0, 0, 0, a1[5]);
}

- (void)_setCollectionIntervals:(id)a3
{
  id v4 = a3;
  [(HKQuery *)self _throwInvalidArgumentExceptionIfHasBeenExecuted:sel__setCollectionIntervals_];
  id v5 = (id)[v4 copy];

  [(ACHCurrentActivitySummaryQuery *)self setCollectionIntervals:v5];
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (NSDictionary)collectionIntervals
{
  return self->_collectionIntervals;
}

- (void)setCollectionIntervals:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIntervals, 0);

  objc_storeStrong(&self->_updateHandler, 0);
}

void __130__ACHCurrentActivitySummaryQuery_client_deliverTodaySummary_changedTodayFields_yesterdaySummary_changedYesterdayFields_queryUUID___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_21F582000, v0, OS_LOG_TYPE_DEBUG, "No update handler set! Today: %@; yesterday: %@",
    v1,
    0x16u);
}

void __130__ACHCurrentActivitySummaryQuery_client_deliverTodaySummary_changedTodayFields_yesterdaySummary_changedYesterdayFields_queryUUID___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_21F582000, v0, OS_LOG_TYPE_DEBUG, "Calling update handler with today: %@; yesterday: %@",
    v1,
    0x16u);
}

@end