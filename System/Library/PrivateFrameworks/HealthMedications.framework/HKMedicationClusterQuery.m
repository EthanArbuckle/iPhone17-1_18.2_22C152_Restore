@interface HKMedicationClusterQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (HKMedicationClusterQuery)initWithMachineReadableCode:(id)a3 codeAttributeType:(int64_t)a4 resultsHandler:(id)a5;
- (HKMedicationClusterQuery)initWithScanResult:(id)a3 limit:(int64_t)a4 resultsHandler:(id)a5;
- (HKMedicationClusterQuery)initWithTextSearchTokens:(id)a3 limit:(int64_t)a4 resultsHandler:(id)a5;
- (id)initForCHRImportWithExistingMedications:(id)a3 sinceDate:(id)a4 limit:(int64_t)a5 resultsHandler:(id)a6;
- (void)client_deliverResults:(id)a3 queryUUID:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
@end

@implementation HKMedicationClusterQuery

- (HKMedicationClusterQuery)initWithScanResult:(id)a3 limit:(int64_t)a4 resultsHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HKMedicationClusterQuery;
  v11 = [(HKQuery *)&v16 _initWithObjectType:0 predicate:0];
  v12 = v11;
  if (v11)
  {
    v11->_queryType = 1;
    objc_storeStrong((id *)&v11->_scanResult, a3);
    v12->_limit = a4;
    uint64_t v13 = [v10 copy];
    id resultsHandler = v12->_resultsHandler;
    v12->_id resultsHandler = (id)v13;
  }
  return v12;
}

- (HKMedicationClusterQuery)initWithMachineReadableCode:(id)a3 codeAttributeType:(int64_t)a4 resultsHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HKMedicationClusterQuery;
  v11 = [(HKQuery *)&v16 _initWithObjectType:0 predicate:0];
  v12 = v11;
  if (v11)
  {
    v11->_queryType = 2;
    objc_storeStrong((id *)&v11->_machineReadableCode, a3);
    v12->_codeAttributeType = a4;
    uint64_t v13 = [v10 copy];
    id resultsHandler = v12->_resultsHandler;
    v12->_id resultsHandler = (id)v13;
  }
  return v12;
}

- (HKMedicationClusterQuery)initWithTextSearchTokens:(id)a3 limit:(int64_t)a4 resultsHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HKMedicationClusterQuery;
  v11 = [(HKQuery *)&v16 _initWithObjectType:0 predicate:0];
  v12 = v11;
  if (v11)
  {
    v11->_queryType = 3;
    objc_storeStrong((id *)&v11->_textSearchTokens, a3);
    v12->_limit = a4;
    uint64_t v13 = [v10 copy];
    id resultsHandler = v12->_resultsHandler;
    v12->_id resultsHandler = (id)v13;
  }
  return v12;
}

- (id)initForCHRImportWithExistingMedications:(id)a3 sinceDate:(id)a4 limit:(int64_t)a5 resultsHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HKMedicationClusterQuery;
  v14 = [(HKQuery *)&v19 _initWithObjectType:0 predicate:0];
  v15 = v14;
  if (v14)
  {
    v14[19] = (id)4;
    objc_storeStrong(v14 + 25, a3);
    objc_storeStrong(v15 + 26, a4);
    v15[20] = (id)a5;
    uint64_t v16 = [v13 copy];
    id v17 = v15[27];
    v15[27] = (id)v16;
  }
  return v15;
}

- (void)client_deliverResults:(id)a3 queryUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HKMedicationClusterQuery_client_deliverResults_queryUUID___block_invoke;
  block[3] = &unk_1E62EBA20;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __60__HKMedicationClusterQuery_client_deliverResults_queryUUID___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1C18793D0](*(void *)(*(void *)(a1 + 32) + 216));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__HKMedicationClusterQuery_client_deliverResults_queryUUID___block_invoke_2;
    v8[3] = &unk_1E62EB9F8;
    id v6 = v2;
    uint64_t v7 = *(void *)(a1 + 32);
    id v10 = v6;
    v8[4] = v7;
    id v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 1, v8);
  }
}

uint64_t __60__HKMedicationClusterQuery_client_deliverResults_queryUUID___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1C18793D0](self->_resultsHandler);
  id v6 = [(HKQuery *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__HKMedicationClusterQuery_queue_deliverError___block_invoke;
  block[3] = &unk_1E62EB9F8;
  id v10 = v4;
  id v11 = v5;
  block[4] = self;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __47__HKMedicationClusterQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_populateConfiguration:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HKMedicationClusterQuery;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  [v4 setQueryType:self->_queryType];
  [v4 setLimit:self->_limit];
  switch(self->_queryType)
  {
    case 1:
      [v4 setScanResult:self->_scanResult];
      break;
    case 2:
      [v4 setMachineReadableCode:self->_machineReadableCode];
      [v4 setCodeAttributeType:self->_codeAttributeType];
      break;
    case 3:
      [v4 setTextSearchTokens:self->_textSearchTokens];
      break;
    case 4:
      [v4 setExistingMedications:self->_existingMedications];
      [v4 setSinceDate:self->_sinceDate];
      break;
    default:
      break;
  }
}

+ (id)clientInterfaceProtocol
{
  return &unk_1F1721148;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKMedicationClusterQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverResults_queryUUID_, 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsHandler, 0);
  objc_storeStrong((id *)&self->_sinceDate, 0);
  objc_storeStrong((id *)&self->_existingMedications, 0);
  objc_storeStrong((id *)&self->_textSearchTokens, 0);
  objc_storeStrong((id *)&self->_machineReadableCode, 0);

  objc_storeStrong((id *)&self->_scanResult, 0);
}

@end