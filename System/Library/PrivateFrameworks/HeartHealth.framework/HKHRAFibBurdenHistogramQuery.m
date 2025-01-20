@interface HKHRAFibBurdenHistogramQuery
+ (id)clientInterfaceProtocol;
- (HKHRAFibBurdenHistogramQuery)initWithResultsHandler:(id)a3;
- (void)client_deliverHistogramResult:(id)a3 queryUUID:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
@end

@implementation HKHRAFibBurdenHistogramQuery

- (HKHRAFibBurdenHistogramQuery)initWithResultsHandler:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5F0]];
  v10.receiver = self;
  v10.super_class = (Class)HKHRAFibBurdenHistogramQuery;
  v6 = [(HKQuery *)&v10 _initWithObjectType:v5 predicate:0];

  if (v6)
  {
    uint64_t v7 = MEMORY[0x1E4E3A190](v4);
    id resultsHandler = v6->_resultsHandler;
    v6->_id resultsHandler = (id)v7;
  }
  return v6;
}

- (void)client_deliverHistogramResult:(id)a3 queryUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HKHRAFibBurdenHistogramQuery_client_deliverHistogramResult_queryUUID___block_invoke;
  block[3] = &unk_1E6D496C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __72__HKHRAFibBurdenHistogramQuery_client_deliverHistogramResult_queryUUID___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4E3A190](*(void *)(*(void *)(a1 + 32) + 152));
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __72__HKHRAFibBurdenHistogramQuery_client_deliverHistogramResult_queryUUID___block_invoke_2;
    v5[3] = &unk_1E6D496A0;
    v5[4] = v3;
    id v6 = *(id *)(a1 + 48);
    id v7 = v2;
    objc_msgSend(v3, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v4, 1, v5);
  }
}

uint64_t __72__HKHRAFibBurdenHistogramQuery_client_deliverHistogramResult_queryUUID___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = HKHRAFibBurdenLogForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = HKSensitiveLogItem();
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1E0A83000, v2, OS_LOG_TYPE_DEFAULT, "[%@] Delivering histogram result: %@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1F3B96020;
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4E3A190](self->_resultsHandler);
  if (v5)
  {
    int v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__HKHRAFibBurdenHistogramQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E6D496F0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __51__HKHRAFibBurdenHistogramQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_validate
{
  v3.receiver = self;
  v3.super_class = (Class)HKHRAFibBurdenHistogramQuery;
  [(HKQuery *)&v3 queue_validate];
  if (!self->_resultsHandler) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F2BC38], @"%@ resultsHandler must not be nil", objc_opt_class() format];
  }
}

- (void)queue_queryDidDeactivate:(id)a3
{
  self->_id resultsHandler = 0;
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

@end