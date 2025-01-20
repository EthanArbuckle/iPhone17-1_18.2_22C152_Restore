@interface HKMCPregnancyStateQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (BOOL)isRunningForMaintenance;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (HKMCPregnancyStateQuery)initWithIsRunningForMaintenance:(BOOL)a3 updateHandler:(id)a4;
- (HKMCPregnancyStateQuery)initWithUpdateHandler:(id)a3;
- (void)client_deliverPregnancyModel:(id)a3 queryUUID:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
@end

@implementation HKMCPregnancyStateQuery

- (HKMCPregnancyStateQuery)initWithUpdateHandler:(id)a3
{
  return [(HKMCPregnancyStateQuery *)self initWithIsRunningForMaintenance:0 updateHandler:a3];
}

- (HKMCPregnancyStateQuery)initWithIsRunningForMaintenance:(BOOL)a3 updateHandler:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HKMCPregnancyStateQuery;
  v7 = [(HKQuery *)&v11 _initWithObjectType:0 predicate:0];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    id updateHandler = v7->_updateHandler;
    v7->_id updateHandler = (id)v8;

    v7->_isRunningForMaintenance = a3;
  }

  return v7;
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED53A50;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_populateConfiguration:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)HKMCPregnancyStateQuery;
  id v4 = a3;
  [(HKQuery *)&v11 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setIsRunningForMaintenance:", self->_isRunningForMaintenance, v11.receiver, v11.super_class);

  _HKInitializeLogging();
  v5 = (void *)HKLogMenstrualCycles;
  if (os_log_type_enabled((os_log_t)HKLogMenstrualCycles, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    v7 = objc_opt_class();
    id v8 = v7;
    v9 = [(HKQuery *)self debugIdentifier];
    v10 = [NSNumber numberWithBool:self->_isRunningForMaintenance];
    *(_DWORD *)buf = 138543874;
    v13 = v7;
    __int16 v14 = 2114;
    v15 = v9;
    __int16 v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Configured to run as maintenance: %{public}@", buf, 0x20u);
  }
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  v5 = _Block_copy(self->_updateHandler);
  if (v5)
  {
    id v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__HKMCPregnancyStateQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __46__HKMCPregnancyStateQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_validate
{
  v3.receiver = self;
  v3.super_class = (Class)HKMCPregnancyStateQuery;
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

+ (void)configureClientInterface:(id)a3
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___HKMCPregnancyStateQuery;
  id v3 = a3;
  objc_msgSendSuper2(&v10, sel_configureClientInterface_, v3);
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, objc_opt_class(), 0);
  [v3 setClasses:v9 forSelector:sel_client_deliverPregnancyModel_queryUUID_ argumentIndex:0 ofReply:0];
}

- (void)client_deliverPregnancyModel:(id)a3 queryUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HKMCPregnancyStateQuery_client_deliverPregnancyModel_queryUUID___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __66__HKMCPregnancyStateQuery_client_deliverPregnancyModel_queryUUID___block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 152));
  if (v2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __66__HKMCPregnancyStateQuery_client_deliverPregnancyModel_queryUUID___block_invoke_2;
    v5[3] = &unk_1E58BBA78;
    v5[4] = v3;
    id v6 = *(id *)(a1 + 48);
    id v7 = v2;
    objc_msgSend(v3, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v4, 0, v5);
  }
}

uint64_t __66__HKMCPregnancyStateQuery_client_deliverPregnancyModel_queryUUID___block_invoke_2(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (HKShowSensitiveLogItems())
  {
    _HKInitializeLogging();
    v2 = (void *)HKLogMenstrualCycles;
    if (os_log_type_enabled((os_log_t)HKLogMenstrualCycles, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = v2;
      uint64_t v4 = objc_opt_class();
      uint64_t v5 = a1[5];
      int v8 = 138543618;
      id v9 = v4;
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      id v6 = v4;
      _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Delivering updated pregnancy model: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (BOOL)isRunningForMaintenance
{
  return self->_isRunningForMaintenance;
}

- (void).cxx_destruct
{
}

@end