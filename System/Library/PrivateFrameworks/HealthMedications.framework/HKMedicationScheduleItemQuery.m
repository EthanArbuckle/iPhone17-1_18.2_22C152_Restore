@interface HKMedicationScheduleItemQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (HKMedicationScheduleItemQuery)initWithFromDate:(id)a3 toDate:(id)a4 identifier:(id)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7;
- (NSArray)sortDescriptors;
- (NSDate)fromDate;
- (NSDate)toDate;
- (NSString)identifier;
- (void)client_deliverScheduleItems:(id)a3 queryUUID:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
@end

@implementation HKMedicationScheduleItemQuery

- (HKMedicationScheduleItemQuery)initWithFromDate:(id)a3 toDate:(id)a4 identifier:(id)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKMedicationScheduleItemQuery;
  v17 = [(HKQuery *)&v29 _initWithObjectType:0 predicate:0];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    fromDate = v17->_fromDate;
    v17->_fromDate = (NSDate *)v18;

    uint64_t v20 = [v13 copy];
    toDate = v17->_toDate;
    v17->_toDate = (NSDate *)v20;

    uint64_t v22 = [v14 copy];
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    sortDescriptors = v17->_sortDescriptors;
    v17->_sortDescriptors = (NSArray *)v24;

    uint64_t v26 = [v16 copy];
    id resultsHandler = v17->_resultsHandler;
    v17->_id resultsHandler = (id)v26;
  }
  return v17;
}

- (void)client_deliverScheduleItems:(id)a3 queryUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__HKMedicationScheduleItemQuery_client_deliverScheduleItems_queryUUID___block_invoke;
  block[3] = &unk_1E62EBA20;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __71__HKMedicationScheduleItemQuery_client_deliverScheduleItems_queryUUID___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1C18793D0](*(void *)(*(void *)(a1 + 32) + 152));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__HKMedicationScheduleItemQuery_client_deliverScheduleItems_queryUUID___block_invoke_2;
    v8[3] = &unk_1E62EB9F8;
    id v6 = v2;
    uint64_t v7 = *(void *)(a1 + 32);
    id v10 = v6;
    v8[4] = v7;
    id v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 1, v8);
  }
}

uint64_t __71__HKMedicationScheduleItemQuery_client_deliverScheduleItems_queryUUID___block_invoke_2(void *a1)
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
  v5.super_class = (Class)HKMedicationScheduleItemQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setFromDate:", self->_fromDate, v5.receiver, v5.super_class);
  [v4 setToDate:self->_toDate];
  [v4 setIdentifier:self->_identifier];
  [v4 setSortDescriptors:self->_sortDescriptors];
}

+ (id)clientInterfaceProtocol
{
  return &unk_1F171E490;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKMedicationScheduleItemQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverScheduleItems_queryUUID_, 0, 0);
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1C18793D0](self->_resultsHandler);
  objc_super v6 = [(HKQuery *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HKMedicationScheduleItemQuery_queue_deliverError___block_invoke;
  block[3] = &unk_1E62EB9F8;
  id v10 = v4;
  id v11 = v5;
  block[4] = self;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __52__HKMedicationScheduleItemQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_validate
{
  v3.receiver = self;
  v3.super_class = (Class)HKMedicationScheduleItemQuery;
  [(HKQuery *)&v3 queue_validate];
  if (!self->_resultsHandler) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F2BC38], @"%@ resultsHandler must not be nil", objc_opt_class() format];
  }
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMedicationScheduleItemQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id resultsHandler = self->_resultsHandler;
  self->_id resultsHandler = 0;
}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (NSDate)toDate
{
  return self->_toDate;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_toDate, 0);
  objc_storeStrong((id *)&self->_fromDate, 0);

  objc_storeStrong(&self->_resultsHandler, 0);
}

@end