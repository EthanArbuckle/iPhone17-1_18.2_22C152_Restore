@interface HKSampleIteratorQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (HKSampleIteratorQuery)init;
- (HKSampleIteratorQuery)initWithQueryCursor:(id)a3 limit:(unint64_t)a4 resultsHandler:(id)a5;
- (HKSampleIteratorQuery)initWithQueryDescriptors:(id)a3 sortDescriptors:(id)a4 followingAnchor:(id)a5 upToAndIncludingAnchor:(id)a6 distinctByKeyPaths:(id)a7 limit:(unint64_t)a8 resultsHandler:(id)a9;
- (HKSampleIteratorQueryCursor)queryCursor;
- (id)resultsHandler;
- (unint64_t)limit;
- (void)client_deliverSampleObjects:(id)a3 queryCursor:(id)a4 deliverResults:(BOOL)a5 query:(id)a6;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
- (void)setLimit:(unint64_t)a3;
- (void)setQueryCursor:(id)a3;
@end

@implementation HKSampleIteratorQuery

- (HKSampleIteratorQuery)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKSampleIteratorQuery)initWithQueryDescriptors:(id)a3 sortDescriptors:(id)a4 followingAnchor:(id)a5 upToAndIncludingAnchor:(id)a6 distinctByKeyPaths:(id)a7 limit:(unint64_t)a8 resultsHandler:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  v22 = v21;
  if (!v16)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"HKSampleIteratorQuery.m", 38, @"Invalid parameter not satisfying: %@", @"queryDescriptors" object file lineNumber description];

    if (v22) {
      goto LABEL_3;
    }
LABEL_5:
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"HKSampleIteratorQuery.m", 39, @"Invalid parameter not satisfying: %@", @"resultsHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v21) {
    goto LABEL_5;
  }
LABEL_3:
  v23 = [[HKSampleIteratorQueryCursor alloc] initWithQueryDescriptors:v16 sortDescriptors:v17 followingAnchor:v18 upToAndIncludingAnchor:v19 distinctByKeyPaths:v20 state:0];
  v24 = [(HKSampleIteratorQuery *)self initWithQueryCursor:v23 limit:a8 resultsHandler:v22];

  return v24;
}

- (HKSampleIteratorQuery)initWithQueryCursor:(id)a3 limit:(unint64_t)a4 resultsHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HKSampleIteratorQuery.m", 54, @"Invalid parameter not satisfying: %@", @"queryCursor" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  id v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"HKSampleIteratorQuery.m", 55, @"Invalid parameter not satisfying: %@", @"resultsHandler" object file lineNumber description];

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)HKSampleIteratorQuery;
  v12 = [(HKQuery *)&v20 _initWithObjectType:0 predicate:0];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    queryCursor = v12->_queryCursor;
    v12->_queryCursor = (HKSampleIteratorQueryCursor *)v13;

    v12->_limit = a4;
    uint64_t v15 = [v11 copy];
    id resultsHandler = v12->_resultsHandler;
    v12->_id resultsHandler = (id)v15;
  }
  return v12;
}

- (void)client_deliverSampleObjects:(id)a3 queryCursor:(id)a4 deliverResults:(BOOL)a5 query:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__HKSampleIteratorQuery_client_deliverSampleObjects_queryCursor_deliverResults_query___block_invoke;
  block[3] = &unk_1E58C0B18;
  block[4] = self;
  id v18 = v10;
  BOOL v21 = a5;
  id v19 = v12;
  id v20 = v11;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_sync(v13, block);
}

void __86__HKSampleIteratorQuery_client_deliverSampleObjects_queryCursor_deliverResults_query___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 152);
  if (v3)
  {
    [v3 addObjectsFromArray:v2];
  }
  else
  {
    uint64_t v4 = [v2 mutableCopy];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 152);
    *(void *)(v5 + 152) = v4;
  }
  if (*(unsigned char *)(a1 + 64))
  {
    v7 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 176));
    if (*(unsigned char *)(a1 + 64))
    {
      id v8 = *(id *)(*(void *)(a1 + 32) + 152);
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 152);
      *(void *)(v9 + 152) = 0;

      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 48);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __86__HKSampleIteratorQuery_client_deliverSampleObjects_queryCursor_deliverResults_query___block_invoke_2;
      v14[3] = &unk_1E58C6260;
      id v17 = v7;
      v14[4] = *(void *)(a1 + 32);
      id v15 = v8;
      id v16 = *(id *)(a1 + 56);
      id v13 = v8;
      objc_msgSend(v11, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v12, 1, v14);
    }
  }
}

uint64_t __86__HKSampleIteratorQuery_client_deliverSampleObjects_queryCursor_deliverResults_query___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED25030;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKSampleIteratorQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverSampleObjects_queryCursor_deliverResults_query_, 0, 0);
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKSampleIteratorQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setQueryCursor:", self->_queryCursor, v5.receiver, v5.super_class);
  [v4 setLimit:self->_limit];
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKSampleIteratorQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id resultsHandler = self->_resultsHandler;
  self->_id resultsHandler = 0;
}

- (void)queue_validate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)HKSampleIteratorQuery;
  [(HKQuery *)&v18 queue_validate];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(HKSampleIteratorQueryCursor *)self->_queryCursor queryDescriptors];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = [v8 sampleType];

        if (!v9) {
          [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ data type must be non-nil", objc_opt_class() format];
        }
        id v10 = [v8 sampleType];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v13 = objc_opt_class();
          [v12 raise:@"HKQueryValidationFailureException", @"%@ data type must be of class %@", v13, objc_opt_class() format];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v5);
  }

  if (!self->_resultsHandler) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ completionHandler cannot be nil", objc_opt_class() format];
  }
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _Block_copy(self->_resultsHandler);
  if (v5)
  {
    uint64_t v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__HKSampleIteratorQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __44__HKSampleIteratorQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, 0, a1[5]);
}

- (HKSampleIteratorQueryCursor)queryCursor
{
  return self->_queryCursor;
}

- (void)setQueryCursor:(id)a3
{
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (id)resultsHandler
{
  return self->_resultsHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsHandler, 0);
  objc_storeStrong((id *)&self->_queryCursor, 0);

  objc_storeStrong((id *)&self->_samplesPendingDelivery, 0);
}

@end