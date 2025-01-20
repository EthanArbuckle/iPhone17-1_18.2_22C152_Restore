@interface HKMCAnalysisQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
- (BOOL)forceAnalysis;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (HKMCAnalysisQuery)initWithForceAnalysis:(BOOL)a3 updateHandler:(id)a4;
- (HKMCAnalysisQuery)initWithUpdateHandler:(id)a3;
- (void)client_deliverAnalysis:(id)a3 queryUUID:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
@end

@implementation HKMCAnalysisQuery

uint64_t __54__HKMCAnalysisQuery_client_deliverAnalysis_queryUUID___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = objc_opt_class();
    id v5 = v4;
    v6 = HKSensitiveLogItem();
    int v8 = 138543618;
    v9 = v4;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2249E9000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Delivering updated analysis: %@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)client_deliverAnalysis:(id)a3 queryUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__HKMCAnalysisQuery_client_deliverAnalysis_queryUUID___block_invoke;
  block[3] = &unk_2646E9798;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)queue_populateConfiguration:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)HKMCAnalysisQuery;
  id v4 = a3;
  [(HKQuery *)&v11 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setForceAnalysis:", self->_forceAnalysis, v11.receiver, v11.super_class);

  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = objc_opt_class();
    id v8 = v7;
    id v9 = [(HKQuery *)self debugIdentifier];
    id v10 = [NSNumber numberWithBool:self->_forceAnalysis];
    *(_DWORD *)buf = 138543874;
    id v13 = v7;
    __int16 v14 = 2114;
    v15 = v9;
    __int16 v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_2249E9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Configured with forced analysis: %{public}@", buf, 0x20u);
  }
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_26D7E75F0;
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 0;
}

- (HKMCAnalysisQuery)initWithUpdateHandler:(id)a3
{
  return [(HKMCAnalysisQuery *)self initWithForceAnalysis:0 updateHandler:a3];
}

void __54__HKMCAnalysisQuery_client_deliverAnalysis_queryUUID___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x22A61C290](*(void *)(*(void *)(a1 + 32) + 152));
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __54__HKMCAnalysisQuery_client_deliverAnalysis_queryUUID___block_invoke_2;
    v5[3] = &unk_2646E9770;
    v5[4] = v3;
    id v6 = *(id *)(a1 + 48);
    id v7 = v2;
    objc_msgSend(v3, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v4, 0, v5);
  }
}

- (void)queue_validate
{
  v3.receiver = self;
  v3.super_class = (Class)HKMCAnalysisQuery;
  [(HKQuery *)&v3 queue_validate];
  if (!self->_updateHandler) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263F0AC10], @"%@ updateHandler must not be nil", objc_opt_class() format];
  }
}

- (HKMCAnalysisQuery)initWithForceAnalysis:(BOOL)a3 updateHandler:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKMCAnalysisQuery;
  id v7 = [(HKQuery *)&v12 _initWithObjectType:0 predicate:0];
  id v8 = v7;
  if (v7)
  {
    v7->_forceAnalysis = a3;
    uint64_t v9 = [v6 copy];
    id updateHandler = v8->_updateHandler;
    v8->_id updateHandler = (id)v9;
  }
  return v8;
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x22A61C290](self->_updateHandler);
  if (v5)
  {
    id v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__HKMCAnalysisQuery_queue_deliverError___block_invoke;
    block[3] = &unk_2646E9510;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __40__HKMCAnalysisQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  self->_id updateHandler = 0;
  MEMORY[0x270F9A758]();
}

- (BOOL)forceAnalysis
{
  return self->_forceAnalysis;
}

- (void).cxx_destruct
{
}

@end