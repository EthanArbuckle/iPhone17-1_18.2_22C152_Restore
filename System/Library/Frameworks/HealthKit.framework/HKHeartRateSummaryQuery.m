@interface HKHeartRateSummaryQuery
+ (id)clientInterfaceProtocol;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (HKHeartRateSummaryQuery)initWithUpdateHandler:(id)a3;
- (void)client_deliverSummary:(id)a3 queryUUID:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
@end

@implementation HKHeartRateSummaryQuery

- (HKHeartRateSummaryQuery)initWithUpdateHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHeartRateSummaryQuery;
  v5 = [(HKQuery *)&v9 _initWithObjectType:0 predicate:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id updateHandler = v5->_updateHandler;
    v5->_id updateHandler = (id)v6;
  }
  return v5;
}

- (void)client_deliverSummary:(id)a3 queryUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__HKHeartRateSummaryQuery_client_deliverSummary_queryUUID___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __59__HKHeartRateSummaryQuery_client_deliverSummary_queryUUID___block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 152));
  v3 = v2;
  if (v2)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__HKHeartRateSummaryQuery_client_deliverSummary_queryUUID___block_invoke_2;
    v6[3] = &unk_1E58BD808;
    v6[4] = v4;
    id v8 = v2;
    id v7 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 0, v6);
  }
}

uint64_t __59__HKHeartRateSummaryQuery_client_deliverSummary_queryUUID___block_invoke_2(uint64_t a1)
{
  _HKInitializeLogging();
  v2 = (void *)HKLogHeartRate;
  if (os_log_type_enabled((os_log_t)HKLogHeartRate, OS_LOG_TYPE_DEBUG)) {
    __59__HKHeartRateSummaryQuery_client_deliverSummary_queryUUID___block_invoke_2_cold_1(a1, v2);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EECF1818;
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _Block_copy(self->_updateHandler);
  if (v5)
  {
    id v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__HKHeartRateSummaryQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __46__HKHeartRateSummaryQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_validate
{
  v3.receiver = self;
  v3.super_class = (Class)HKHeartRateSummaryQuery;
  [(HKQuery *)&v3 queue_validate];
  if (!self->_updateHandler) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ updateHandler must not be nil", objc_opt_class() format];
  }
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 0;
}

- (void)queue_queryDidDeactivate:(id)a3
{
  self->_id updateHandler = 0;
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

void __59__HKHeartRateSummaryQuery_client_deliverSummary_queryUUID___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_super v3 = a2;
  id v4 = objc_opt_class();
  uint64_t v5 = *(const void **)(a1 + 48);
  id v6 = v4;
  id v7 = _Block_copy(v5);
  int v8 = 138412546;
  id v9 = v4;
  __int16 v10 = 2112;
  v11 = v7;
  _os_log_debug_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEBUG, "%@ calling update handler: %@", (uint8_t *)&v8, 0x16u);
}

@end