@interface HKUserDomainConceptQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (HKUserDomainConceptQuery)initWithPredicate:(id)a3 anchor:(id)a4 limit:(unint64_t)a5 sortDescriptors:(id)a6 batchHandler:(id)a7;
- (HKUserDomainConceptQuery)initWithPredicate:(id)a3 anchor:(id)a4 limit:(unint64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7;
- (void)_enumerateResultsWithHandler:(id)a3 handler:(id)a4;
- (void)client_deliverResults:(id)a3 queryUUID:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
@end

@implementation HKUserDomainConceptQuery

- (HKUserDomainConceptQuery)initWithPredicate:(id)a3 anchor:(id)a4 limit:(unint64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7
{
  id v12 = a7;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__HKUserDomainConceptQuery_initWithPredicate_anchor_limit_sortDescriptors_resultsHandler___block_invoke;
  v16[3] = &unk_1E58C1C00;
  id v17 = v12;
  id v13 = v12;
  v14 = [(HKUserDomainConceptQuery *)self initWithPredicate:a3 anchor:a4 limit:a5 sortDescriptors:a6 batchHandler:v16];

  return v14;
}

uint64_t __90__HKUserDomainConceptQuery_initWithPredicate_anchor_limit_sortDescriptors_resultsHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (a3) {
    return [a2 _enumerateResultsWithHandler:a3 handler:v5];
  }
  else {
    return (*(uint64_t (**)(void, void *, void, void, uint64_t, uint64_t))(v5 + 16))(*(void *)(a1 + 32), a2, 0, 0, 1, a5);
  }
}

- (HKUserDomainConceptQuery)initWithPredicate:(id)a3 anchor:(id)a4 limit:(unint64_t)a5 sortDescriptors:(id)a6 batchHandler:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HKUserDomainConceptQuery;
  v15 = [(HKQuery *)&v23 _initWithObjectType:0 predicate:a3];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    anchor = v15->_anchor;
    v15->_anchor = (HKQueryAnchor *)v16;

    uint64_t v18 = [v13 copy];
    sortDescriptors = v15->_sortDescriptors;
    v15->_sortDescriptors = (NSArray *)v18;

    v15->_limit = a5;
    uint64_t v20 = [v14 copy];
    id batchHandler = v15->_batchHandler;
    v15->_id batchHandler = (id)v20;
  }
  return v15;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKUserDomainConceptQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setAnchor:", self->_anchor, v5.receiver, v5.super_class);
  [v4 setSortDescriptors:self->_sortDescriptors];
  [v4 setLimit:self->_limit];
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED029A8;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKUserDomainConceptQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverResults_queryUUID_, 0, 0);
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__17;
  v10[4] = __Block_byref_object_dispose__17;
  id v11 = _Block_copy(self->_batchHandler);
  id v5 = [(HKQuery *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__HKUserDomainConceptQuery_queue_deliverError___block_invoke;
  block[3] = &unk_1E58BBAC8;
  id v8 = v4;
  v9 = v10;
  block[4] = self;
  id v6 = v4;
  dispatch_async(v5, block);

  _Block_object_dispose(v10, 8);
}

uint64_t __47__HKUserDomainConceptQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, uint64_t, void))(*(void *)(*(void *)(a1[6] + 8) + 40)
                                                                            + 16))(*(void *)(*(void *)(a1[6] + 8) + 40), a1[4], 0, 1, a1[5]);
}

- (void)queue_validate
{
  v3.receiver = self;
  v3.super_class = (Class)HKUserDomainConceptQuery;
  [(HKQuery *)&v3 queue_validate];
  if (!self->_batchHandler) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ handler must not be nil", objc_opt_class() format];
  }
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKUserDomainConceptQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id batchHandler = self->_batchHandler;
  self->_id batchHandler = 0;
}

- (void)client_deliverResults:(id)a3 queryUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HKUserDomainConceptQuery_client_deliverResults_queryUUID___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __60__HKUserDomainConceptQuery_client_deliverResults_queryUUID___block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 176));
  objc_super v3 = v2;
  if (v2)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__HKUserDomainConceptQuery_client_deliverResults_queryUUID___block_invoke_2;
    v8[3] = &unk_1E58BB9A0;
    id v6 = v2;
    uint64_t v7 = *(void *)(a1 + 32);
    id v10 = v6;
    v8[4] = v7;
    id v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 1, v8);
  }
}

uint64_t __60__HKUserDomainConceptQuery_client_deliverResults_queryUUID___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, uint64_t, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 1, 0);
}

- (void)_enumerateResultsWithHandler:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v8)
  {
    uint64_t v9 = v8;
    int64_t v10 = [(HKQuery *)self deactivateCallCount];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__HKUserDomainConceptQuery__enumerateResultsWithHandler_handler___block_invoke;
    v11[3] = &unk_1E58C1C28;
    v11[4] = self;
    int64_t v13 = v10;
    uint64_t v14 = v9;
    id v12 = v7;
    [v6 enumerateObjectsUsingBlock:v11];
  }
  else
  {
    (*((void (**)(id, HKUserDomainConceptQuery *, void, void, uint64_t, void))v7 + 2))(v7, self, 0, 0, 1, 0);
  }
}

void __65__HKUserDomainConceptQuery__enumerateResultsWithHandler_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  id v7 = (void *)MEMORY[0x19F395970]();
  if ([*(id *)(a1 + 32) deactivateCallCount] <= *(void *)(a1 + 48))
  {
    BOOL v8 = *(void *)(a1 + 56) - 1 == a3;
    uint64_t v11 = a1 + 32;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(v11 + 8);
    id v12 = [v14 userConcept];
    int64_t v13 = [v14 anchor];
    (*(void (**)(uint64_t, uint64_t, void *, void *, BOOL, void))(v10 + 16))(v10, v9, v12, v13, v8, 0);
  }
  else
  {
    *a4 = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_batchHandler, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);

  objc_storeStrong((id *)&self->_anchor, 0);
}

@end