@interface HKConceptQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (HKConceptQuery)initWithConceptSelection:(id)a3 resultsHandler:(id)a4;
- (void)_enumerateConceptsWithHandler:(id)a3 handler:(id)a4;
- (void)client_deliverConcepts:(id)a3 queryUUID:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
@end

@implementation HKConceptQuery

- (HKConceptQuery)initWithConceptSelection:(id)a3 resultsHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKConceptQuery;
  v9 = [(HKQuery *)&v14 _initWithObjectType:0 predicate:0];
  v10 = (HKConceptQuery *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 19, a3);
    uint64_t v11 = [v8 copy];
    id handler = v10->_handler;
    v10->_id handler = (id)v11;
  }
  return v10;
}

- (void)client_deliverConcepts:(id)a3 queryUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__HKConceptQuery_client_deliverConcepts_queryUUID___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __51__HKConceptQuery_client_deliverConcepts_queryUUID___block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 160));
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__HKConceptQuery_client_deliverConcepts_queryUUID___block_invoke_2;
    v5[3] = &unk_1E58BBA78;
    v5[4] = v3;
    id v6 = *(id *)(a1 + 48);
    id v7 = v2;
    objc_msgSend(v3, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v4, 1, v5);
  }
}

uint64_t __51__HKConceptQuery_client_deliverConcepts_queryUUID___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateConceptsWithHandler:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_enumerateConceptsWithHandler:(id)a3 handler:(id)a4
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
    v11[2] = __56__HKConceptQuery__enumerateConceptsWithHandler_handler___block_invoke;
    v11[3] = &unk_1E58C7B30;
    v11[4] = self;
    int64_t v13 = v10;
    uint64_t v14 = v9;
    id v12 = v7;
    [v6 enumerateObjectsUsingBlock:v11];
  }
  else
  {
    (*((void (**)(id, HKConceptQuery *, void, uint64_t, void))v7 + 2))(v7, self, 0, 1, 0);
  }
}

void __56__HKConceptQuery__enumerateConceptsWithHandler_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) deactivateCallCount] <= *(void *)(a1 + 48)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    *a4 = 1;
  }
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKConceptQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setSelection:", self->_selection, v5.receiver, v5.super_class);
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED228C0;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKConceptQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverConcepts_queryUUID_, 0, 0);
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__47;
  v10[4] = __Block_byref_object_dispose__47;
  id v11 = _Block_copy(self->_handler);
  id v5 = [(HKQuery *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__HKConceptQuery_queue_deliverError___block_invoke;
  block[3] = &unk_1E58BBAC8;
  id v8 = v4;
  uint64_t v9 = v10;
  block[4] = self;
  id v6 = v4;
  dispatch_async(v5, block);

  _Block_object_dispose(v10, 8);
}

uint64_t __37__HKConceptQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, uint64_t, void))(*(void *)(*(void *)(a1[6] + 8) + 40)
                                                                            + 16))(*(void *)(*(void *)(a1[6] + 8) + 40), a1[4], 0, 1, a1[5]);
}

- (void)queue_validate
{
  v3.receiver = self;
  v3.super_class = (Class)HKConceptQuery;
  [(HKQuery *)&v3 queue_validate];
  if (!self->_handler) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ handler must not be nil", objc_opt_class() format];
  }
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKConceptQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id handler = self->_handler;
  self->_id handler = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_selection, 0);
}

@end