@interface HKSourceQuery
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
+ (void)configureServerInterface:(id)a3;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (HKSourceQuery)initWithSampleType:(HKSampleType *)sampleType samplePredicate:(NSPredicate *)objectPredicate completionHandler:(void *)completionHandler;
- (id)completionHandler;
- (id)updateHandler;
- (void)client_deliverSources:(id)a3 forQuery:(id)a4;
- (void)client_deliverUpdatedSources:(id)a3 added:(id)a4 forQuery:(id)a5;
- (void)queue_deliverError:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
- (void)setUpdateHandler:(id)a3;
@end

@implementation HKSourceQuery

- (HKSourceQuery)initWithSampleType:(HKSampleType *)sampleType samplePredicate:(NSPredicate *)objectPredicate completionHandler:(void *)completionHandler
{
  v8 = completionHandler;
  v13.receiver = self;
  v13.super_class = (Class)HKSourceQuery;
  v9 = [(HKQuery *)&v13 _initWithObjectType:sampleType predicate:objectPredicate];
  if (v9)
  {
    v10 = _Block_copy(v8);
    id v11 = v9->_completionHandler;
    v9->_completionHandler = v10;
  }
  return v9;
}

- (void)setUpdateHandler:(id)a3
{
  id v5 = a3;
  v6 = [(HKQuery *)self queue];
  dispatch_assert_queue_not_V2(v6);

  [(HKQuery *)self _throwInvalidArgumentExceptionIfHasBeenExecuted:a2];
  v7 = [(HKQuery *)self queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__HKSourceQuery_setUpdateHandler___block_invoke;
  v9[3] = &unk_1E58BB978;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_sync(v7, v9);
}

uint64_t __34__HKSourceQuery_setUpdateHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 176);
  *(void *)(v3 + 176) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  id completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    v6 = _Block_copy(completionHandler);
    v7 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__HKSourceQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v11 = v6;
    block[4] = self;
    id v10 = v4;
    id v8 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __36__HKSourceQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED1D008;
}

+ (void)configureClientInterface:(id)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___HKSourceQuery;
  id v3 = a3;
  objc_msgSendSuper2(&v7, sel_configureClientInterface_, v3);
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0, v7.receiver, v7.super_class);
  [v3 setClasses:v6 forSelector:sel_client_deliverSources_forQuery_ argumentIndex:0 ofReply:0];
  [v3 setClasses:v6 forSelector:sel_client_deliverUpdatedSources_added_forQuery_ argumentIndex:0 ofReply:0];
  [v3 setClasses:v6 forSelector:sel_client_deliverUpdatedSources_added_forQuery_ argumentIndex:1 ofReply:0];
}

+ (void)configureServerInterface:(id)a3
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HKSourceQuery;
  objc_msgSendSuper2(&v3, sel_configureServerInterface_, a3);
}

- (void)queue_validate
{
  v8.receiver = self;
  v8.super_class = (Class)HKSourceQuery;
  [(HKQuery *)&v8 queue_validate];
  if (!self->_completionHandler) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ completionHandler cannot be nil", objc_opt_class() format];
  }
  objc_super v3 = [(HKQuery *)self objectType];

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ data type must be non-nil", objc_opt_class() format];
  }
  id v4 = [(HKQuery *)self objectType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = objc_opt_class();
    [v6 raise:@"HKQueryValidationFailureException", @"%@ data type must be of class %@", v7, objc_opt_class() format];
  }
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKSourceQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return self->_updateHandler != 0;
}

- (void)client_deliverSources:(id)a3 forQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HKSourceQuery_client_deliverSources_forQuery___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __48__HKSourceQuery_client_deliverSources_forQuery___block_invoke(uint64_t a1)
{
  uint64_t v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 168));
  objc_super v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 176);
  *(unsigned char *)(v4 + 152) = 1;
  if (v2)
  {
    BOOL v6 = v5 == 0;
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48__HKSourceQuery_client_deliverSources_forQuery___block_invoke_2;
    v11[3] = &unk_1E58BB9A0;
    id v9 = v2;
    uint64_t v10 = *(void *)(a1 + 32);
    id v13 = v9;
    v11[4] = v10;
    id v12 = *(id *)(a1 + 48);
    objc_msgSend(v7, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v8, v6, v11);
  }
}

uint64_t __48__HKSourceQuery_client_deliverSources_forQuery___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (void)client_deliverUpdatedSources:(id)a3 added:(id)a4 forQuery:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HKQuery *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__HKSourceQuery_client_deliverUpdatedSources_added_forQuery___block_invoke;
  v15[3] = &unk_1E58C0930;
  v15[4] = self;
  id v16 = v10;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __61__HKSourceQuery_client_deliverUpdatedSources_added_forQuery___block_invoke(uint64_t a1)
{
  uint64_t v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 176));
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__HKSourceQuery_client_deliverUpdatedSources_added_forQuery___block_invoke_2;
  v6[3] = &unk_1E58C6260;
  id v9 = v2;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v5 = v2;
  objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v3, 0, v6);
}

uint64_t __61__HKSourceQuery_client_deliverUpdatedSources_added_forQuery___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], 0);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_serverProxy, 0);
}

@end