@interface HKDocumentQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
- (BOOL)includeDocumentData;
- (HKDocumentQuery)initWithDocumentType:(HKDocumentType *)documentType predicate:(NSPredicate *)predicate limit:(NSUInteger)limit sortDescriptors:(NSArray *)sortDescriptors includeDocumentData:(BOOL)includeDocumentData resultsHandler:(void *)resultsHandler;
- (NSArray)sortDescriptors;
- (NSUInteger)limit;
- (id)resultsHandler;
- (void)client_deliverDocument:(id)a3 query:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
- (void)setResultsHandler:(id)a3;
@end

@implementation HKDocumentQuery

- (HKDocumentQuery)initWithDocumentType:(HKDocumentType *)documentType predicate:(NSPredicate *)predicate limit:(NSUInteger)limit sortDescriptors:(NSArray *)sortDescriptors includeDocumentData:(BOOL)includeDocumentData resultsHandler:(void *)resultsHandler
{
  v14 = sortDescriptors;
  v15 = resultsHandler;
  v23.receiver = self;
  v23.super_class = (Class)HKDocumentQuery;
  v16 = [(HKQuery *)&v23 _initWithObjectType:documentType predicate:predicate];
  v17 = v16;
  if (v16)
  {
    v16->_limit = limit;
    uint64_t v18 = [(NSArray *)v14 copy];
    v19 = v17->_sortDescriptors;
    v17->_sortDescriptors = (NSArray *)v18;

    v17->_includeDocumentData = includeDocumentData;
    v20 = _Block_copy(v15);
    id v21 = v17->_resultsHandler;
    v17->_resultsHandler = v20;
  }
  return v17;
}

- (void)client_deliverDocument:(id)a3 query:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HKDocumentQuery_client_deliverDocument_query___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __48__HKDocumentQuery_client_deliverDocument_query___block_invoke(void *a1)
{
  v2 = _Block_copy(*(const void **)(a1[4] + 176));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)a1[4];
    BOOL v5 = a1[5] == 0;
    uint64_t v6 = a1[6];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__HKDocumentQuery_client_deliverDocument_query___block_invoke_2;
    v10[3] = &unk_1E58BF598;
    BOOL v13 = v5;
    id v7 = v2;
    uint64_t v8 = a1[4];
    id v9 = (void *)a1[5];
    id v12 = v7;
    v10[4] = v8;
    id v11 = v9;
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v6, v5, v10);
  }
}

void __48__HKDocumentQuery_client_deliverDocument_query___block_invoke_2(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    id v9 = 0;
    int v4 = [v3 prepareForDelivery:&v9];
    id v5 = v9;
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    if (v4)
    {
      v10[0] = *(void *)(a1 + 40);
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
      (*(void (**)(uint64_t, uint64_t, void *, void, void))(v6 + 16))(v6, v7, v8, 0, 0);
    }
    else
    {
      (*(void (**)(void, void, void, void, id))(v6 + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), 0, 0, v5);
    }
  }
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED32208;
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKDocumentQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setSortDescriptors:", self->_sortDescriptors, v5.receiver, v5.super_class);
  [v4 setLimit:self->_limit];
  [v4 setIncludeDocumentData:self->_includeDocumentData];
}

- (void)queue_validate
{
  v8.receiver = self;
  v8.super_class = (Class)HKDocumentQuery;
  [(HKQuery *)&v8 queue_validate];
  v3 = [(HKQuery *)self objectType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_super v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    uint64_t v7 = [(HKQuery *)self objectType];
    [v5 raise:v6, @"%@ is not an instance of %@", v7, objc_opt_class() format];
  }
  if (!self->_resultsHandler) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ resultsHandler cannot be nil", objc_opt_class() format];
  }
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKDocumentQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id resultsHandler = self->_resultsHandler;
  self->_id resultsHandler = 0;
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  objc_super v5 = _Block_copy(self->_resultsHandler);
  if (v5)
  {
    uint64_t v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__HKDocumentQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __38__HKDocumentQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, uint64_t, void))(a1[6] + 16))(a1[6], a1[4], 0, 1, a1[5]);
}

- (NSUInteger)limit
{
  return self->_limit;
}

- (NSArray)sortDescriptors
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (BOOL)includeDocumentData
{
  return self->_includeDocumentData;
}

- (id)resultsHandler
{
  return self->_resultsHandler;
}

- (void)setResultsHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsHandler, 0);

  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

@end