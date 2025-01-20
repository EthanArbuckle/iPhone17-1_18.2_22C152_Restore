@interface HKMedicationScheduleQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (HKMedicationScheduleQuery)initWithPredicate:(id)a3 limit:(unint64_t)a4 sortDescriptors:(id)a5 resultsHandler:(id)a6;
- (void)client_deliverSchedules:(id)a3 queryUUID:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
@end

@implementation HKMedicationScheduleQuery

- (HKMedicationScheduleQuery)initWithPredicate:(id)a3 limit:(unint64_t)a4 sortDescriptors:(id)a5 resultsHandler:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HKMedicationScheduleQuery;
  v11 = [(HKQuery *)&v18 _initWithObjectType:0 predicate:0];
  v12 = v11;
  if (v11)
  {
    v11->_limit = a4;
    uint64_t v13 = [v9 copy];
    sortDescriptors = v12->_sortDescriptors;
    v12->_sortDescriptors = (NSArray *)v13;

    uint64_t v15 = [v10 copy];
    id resultsHandler = v12->_resultsHandler;
    v12->_id resultsHandler = (id)v15;
  }
  return v12;
}

- (void)client_deliverSchedules:(id)a3 queryUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__HKMedicationScheduleQuery_client_deliverSchedules_queryUUID___block_invoke;
  block[3] = &unk_1E62EBA20;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __63__HKMedicationScheduleQuery_client_deliverSchedules_queryUUID___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1C18793D0](*(void *)(*(void *)(a1 + 32) + 152));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__HKMedicationScheduleQuery_client_deliverSchedules_queryUUID___block_invoke_2;
    v8[3] = &unk_1E62EB9F8;
    id v6 = v2;
    uint64_t v7 = *(void *)(a1 + 32);
    id v10 = v6;
    v8[4] = v7;
    id v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 1, v8);
  }
}

uint64_t __63__HKMedicationScheduleQuery_client_deliverSchedules_queryUUID___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMedicationScheduleQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setLimit:", self->_limit, v5.receiver, v5.super_class);
  [v4 setSortDescriptors:self->_sortDescriptors];
}

+ (id)clientInterfaceProtocol
{
  return &unk_1F1721050;
}

+ (void)configureClientInterface:(id)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___HKMedicationScheduleQuery;
  id v3 = a3;
  objc_msgSendSuper2(&v7, sel_configureClientInterface_, v3);
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0, v7.receiver, v7.super_class);
  [v3 setClasses:v6 forSelector:sel_client_deliverSchedules_queryUUID_ argumentIndex:0 ofReply:0];
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1C18793D0](self->_resultsHandler);
  id v6 = [(HKQuery *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HKMedicationScheduleQuery_queue_deliverError___block_invoke;
  block[3] = &unk_1E62EB9F8;
  id v10 = v4;
  id v11 = v5;
  block[4] = self;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __48__HKMedicationScheduleQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_validate
{
  v3.receiver = self;
  v3.super_class = (Class)HKMedicationScheduleQuery;
  [(HKQuery *)&v3 queue_validate];
  if (!self->_resultsHandler) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F2BC38], @"%@ resultsHandler must not be nil", objc_opt_class() format];
  }
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMedicationScheduleQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id resultsHandler = self->_resultsHandler;
  self->_id resultsHandler = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);

  objc_storeStrong(&self->_resultsHandler, 0);
}

@end