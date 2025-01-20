@interface HKVerifiableClinicalRecordQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (HKVerifiableClinicalRecordQuery)initWithRecordTypes:(NSArray *)recordTypes predicate:(NSPredicate *)predicate resultsHandler:(void *)resultsHandler;
- (HKVerifiableClinicalRecordQuery)initWithRecordTypes:(NSArray *)recordTypes sourceTypes:(NSArray *)sourceTypes predicate:(NSPredicate *)predicate resultsHandler:(void *)resultsHandler;
- (NSArray)recordTypes;
- (NSArray)sourceTypes;
- (void)client_deliverVerifiableClinicalRecords:(id)a3 queryUUID:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
@end

@implementation HKVerifiableClinicalRecordQuery

- (HKVerifiableClinicalRecordQuery)initWithRecordTypes:(NSArray *)recordTypes predicate:(NSPredicate *)predicate resultsHandler:(void *)resultsHandler
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v8 = recordTypes;
  v9 = resultsHandler;
  v18.receiver = self;
  v18.super_class = (Class)HKVerifiableClinicalRecordQuery;
  v10 = [(HKQuery *)&v18 _initWithObjectType:0 predicate:predicate];
  if (v10)
  {
    uint64_t v11 = [(NSArray *)v8 copy];
    v12 = v10->_recordTypes;
    v10->_recordTypes = (NSArray *)v11;

    v19[0] = @"SMARTHealthCard";
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    sourceTypes = v10->_sourceTypes;
    v10->_sourceTypes = (NSArray *)v13;

    uint64_t v15 = [v9 copy];
    id v16 = v10->_resultsHandler;
    v10->_resultsHandler = (id)v15;
  }
  return v10;
}

- (HKVerifiableClinicalRecordQuery)initWithRecordTypes:(NSArray *)recordTypes sourceTypes:(NSArray *)sourceTypes predicate:(NSPredicate *)predicate resultsHandler:(void *)resultsHandler
{
  v10 = recordTypes;
  uint64_t v11 = sourceTypes;
  v12 = resultsHandler;
  v21.receiver = self;
  v21.super_class = (Class)HKVerifiableClinicalRecordQuery;
  uint64_t v13 = [(HKQuery *)&v21 _initWithObjectType:0 predicate:predicate];
  if (v13)
  {
    uint64_t v14 = [(NSArray *)v10 copy];
    uint64_t v15 = v13->_recordTypes;
    v13->_recordTypes = (NSArray *)v14;

    uint64_t v16 = [(NSArray *)v11 copy];
    v17 = v13->_sourceTypes;
    v13->_sourceTypes = (NSArray *)v16;

    uint64_t v18 = [v12 copy];
    id v19 = v13->_resultsHandler;
    v13->_resultsHandler = (id)v18;
  }
  return v13;
}

- (void)client_deliverVerifiableClinicalRecords:(id)a3 queryUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__HKVerifiableClinicalRecordQuery_client_deliverVerifiableClinicalRecords_queryUUID___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __85__HKVerifiableClinicalRecordQuery_client_deliverVerifiableClinicalRecords_queryUUID___block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 152));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __85__HKVerifiableClinicalRecordQuery_client_deliverVerifiableClinicalRecords_queryUUID___block_invoke_2;
    v8[3] = &unk_1E58BB9A0;
    id v6 = v2;
    uint64_t v7 = *(void *)(a1 + 32);
    id v10 = v6;
    v8[4] = v7;
    id v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 1, v8);
  }
}

uint64_t __85__HKVerifiableClinicalRecordQuery_client_deliverVerifiableClinicalRecords_queryUUID___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _Block_copy(self->_resultsHandler);
  if (v5)
  {
    id v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__HKVerifiableClinicalRecordQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __54__HKVerifiableClinicalRecordQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED15D68;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKVerifiableClinicalRecordQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverVerifiableClinicalRecords_queryUUID_, 0, 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_validate
{
  v3.receiver = self;
  v3.super_class = (Class)HKVerifiableClinicalRecordQuery;
  [(HKQuery *)&v3 queue_validate];
  if (!self->_resultsHandler) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ resultsHandler must be non-nil", objc_opt_class() format];
  }
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKVerifiableClinicalRecordQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id resultsHandler = self->_resultsHandler;
  self->_id resultsHandler = 0;
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKVerifiableClinicalRecordQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setRecordTypes:", self->_recordTypes, v5.receiver, v5.super_class);
  [v4 setSourceTypes:self->_sourceTypes];
}

- (NSArray)recordTypes
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (NSArray)sourceTypes
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceTypes, 0);
  objc_storeStrong((id *)&self->_recordTypes, 0);

  objc_storeStrong(&self->_resultsHandler, 0);
}

@end