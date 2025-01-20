@interface HKUserTrackedConceptQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (HKUserTrackedConceptQuery)initWithUserTrackedConceptType:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 resultsHandler:(id)a6;
- (void)_enumerateUserTrackedConceptsWithHandler:(id)a3 handler:(id)a4;
- (void)client_deliverUserTrackedConcepts:(id)a3 queryUUID:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
@end

@implementation HKUserTrackedConceptQuery

- (HKUserTrackedConceptQuery)initWithUserTrackedConceptType:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 resultsHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HKUserTrackedConceptQuery;
  v12 = [(HKQuery *)&v18 _initWithObjectType:a3 predicate:a4];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    sortDescriptors = v12->_sortDescriptors;
    v12->_sortDescriptors = (NSArray *)v13;

    uint64_t v15 = [v11 copy];
    id handler = v12->_handler;
    v12->_id handler = (id)v15;
  }
  return v12;
}

- (void)client_deliverUserTrackedConcepts:(id)a3 queryUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__HKUserTrackedConceptQuery_client_deliverUserTrackedConcepts_queryUUID___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __73__HKUserTrackedConceptQuery_client_deliverUserTrackedConcepts_queryUUID___block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 160));
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __73__HKUserTrackedConceptQuery_client_deliverUserTrackedConcepts_queryUUID___block_invoke_2;
    v5[3] = &unk_1E58BBA78;
    v5[4] = v3;
    id v6 = *(id *)(a1 + 48);
    id v7 = v2;
    objc_msgSend(v3, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v4, 1, v5);
  }
}

uint64_t __73__HKUserTrackedConceptQuery_client_deliverUserTrackedConcepts_queryUUID___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateUserTrackedConceptsWithHandler:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_enumerateUserTrackedConceptsWithHandler:(id)a3 handler:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([v10 count])
  {
    id v7 = v6;
    v8 = self;
    id v9 = v10;
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F1CBF0];
    id v7 = v6;
    v8 = self;
  }
  (*((void (**)(id, HKUserTrackedConceptQuery *, id, void))v6 + 2))(v7, v8, v9, 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKUserTrackedConceptQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setSortDescriptors:", self->_sortDescriptors, v5.receiver, v5.super_class);
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED24268;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKUserTrackedConceptQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverUserTrackedConcepts_queryUUID_, 0, 0);
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__50;
  v10[4] = __Block_byref_object_dispose__50;
  id v11 = _Block_copy(self->_handler);
  id v5 = [(HKQuery *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HKUserTrackedConceptQuery_queue_deliverError___block_invoke;
  block[3] = &unk_1E58BBAC8;
  id v8 = v4;
  id v9 = v10;
  block[4] = self;
  id v6 = v4;
  dispatch_async(v5, block);

  _Block_object_dispose(v10, 8);
}

uint64_t __48__HKUserTrackedConceptQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(*(void *)(a1[6] + 8) + 40) + 16))(*(void *)(*(void *)(a1[6] + 8) + 40), a1[4], 0, a1[5]);
}

- (void)queue_validate
{
  v3.receiver = self;
  v3.super_class = (Class)HKUserTrackedConceptQuery;
  [(HKQuery *)&v3 queue_validate];
  if (!self->_handler) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ handler must not be nil", objc_opt_class() format];
  }
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKUserTrackedConceptQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id handler = self->_handler;
  self->_id handler = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

@end