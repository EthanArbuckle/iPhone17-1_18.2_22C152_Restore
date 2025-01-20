@interface HKAnchoredObjectQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (BOOL)ignoreDeletedObjects;
- (BOOL)includeAutomaticTimeZones;
- (BOOL)includeContributorInformation;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (HKAnchoredObjectQuery)initWithQueryDescriptors:(NSArray *)queryDescriptors anchor:(HKQueryAnchor *)anchor limit:(NSInteger)limit resultsHandler:(void *)handler;
- (HKAnchoredObjectQuery)initWithType:(HKSampleType *)type predicate:(NSPredicate *)predicate anchor:(HKQueryAnchor *)anchor limit:(NSUInteger)limit resultsHandler:(void *)handler;
- (HKAnchoredObjectQuery)initWithType:(HKSampleType *)type predicate:(NSPredicate *)predicate anchor:(NSUInteger)anchor limit:(NSUInteger)limit completionHandler:(void *)handler;
- (HKQueryAnchor)anchor;
- (double)collectionInterval;
- (id)completionHandler;
- (unint64_t)limit;
- (void)client_deliverSampleObjects:(id)a3 deletedObjects:(id)a4 anchor:(id)a5 clearPendingSamples:(BOOL)a6 deliverResults:(BOOL)a7 query:(id)a8;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
- (void)setAnchor:(id)a3;
- (void)setCollectionInterval:(double)a3;
- (void)setIgnoreDeletedObjects:(BOOL)a3;
- (void)setIncludeAutomaticTimeZones:(BOOL)a3;
- (void)setIncludeContributorInformation:(BOOL)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setUpdateHandler:(void *)updateHandler;
- (void)updateHandler;
@end

@implementation HKAnchoredObjectQuery

- (HKAnchoredObjectQuery)initWithType:(HKSampleType *)type predicate:(NSPredicate *)predicate anchor:(NSUInteger)anchor limit:(NSUInteger)limit completionHandler:(void *)handler
{
  v12 = predicate;
  v13 = type;
  v14 = (void *)[handler copy];
  v15 = +[HKQueryAnchor anchorFromValue:anchor];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __79__HKAnchoredObjectQuery_initWithType_predicate_anchor_limit_completionHandler___block_invoke;
  v19[3] = &unk_1E58C25D8;
  id v20 = v14;
  id v16 = v14;
  v17 = [(HKAnchoredObjectQuery *)self initWithType:v13 predicate:v12 anchor:v15 limit:limit resultsHandler:v19];

  if (v17) {
    atomic_store(0, (unsigned __int8 *)&v17->_includeDeletedObjects);
  }

  return v17;
}

void __79__HKAnchoredObjectQuery_initWithType_predicate_anchor_limit_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    id v10 = a6;
    id v11 = a3;
    id v12 = a2;
    (*(void (**)(uint64_t, id, id, uint64_t, id))(v6 + 16))(v6, v12, v11, [a5 _rowid], v10);
  }
}

- (HKAnchoredObjectQuery)initWithType:(HKSampleType *)type predicate:(NSPredicate *)predicate anchor:(HKQueryAnchor *)anchor limit:(NSUInteger)limit resultsHandler:(void *)handler
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v12 = handler;
  v13 = anchor;
  v14 = predicate;
  v15 = type;
  id v16 = [[HKQueryDescriptor alloc] initWithSampleType:v15 predicate:v14];

  v20[0] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v18 = [(HKAnchoredObjectQuery *)self initWithQueryDescriptors:v17 anchor:v13 limit:limit resultsHandler:v12];

  return v18;
}

- (HKAnchoredObjectQuery)initWithQueryDescriptors:(NSArray *)queryDescriptors anchor:(HKQueryAnchor *)anchor limit:(NSInteger)limit resultsHandler:(void *)handler
{
  id v11 = anchor;
  id v12 = handler;
  v19.receiver = self;
  v19.super_class = (Class)HKAnchoredObjectQuery;
  v13 = [(HKQuery *)&v19 initWithQueryDescriptors:queryDescriptors];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_anchor, anchor);
    v14->_limit = limit;
    uint64_t v15 = [v12 copy];
    id completionHandler = v14->_completionHandler;
    v14->_id completionHandler = (id)v15;

    v14->_initialHandlerCalled = 0;
    currentAnchor = v14->_currentAnchor;
    v14->_currentAnchor = 0;

    atomic_store(1u, (unsigned __int8 *)&v14->_includeDeletedObjects);
  }

  return v14;
}

- (void)setUpdateHandler:(void *)updateHandler
{
  v5 = updateHandler;
  if (self->_limit)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = objc_opt_class();
    v9 = NSStringFromSelector(a2);
    [v6 raise:v7, @"%@: %@ not callable when query has a limit", v8, v9 format];
  }
  [(HKQuery *)self _throwInvalidArgumentExceptionIfHasBeenExecuted:a2];
  id v10 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__HKAnchoredObjectQuery_setUpdateHandler___block_invoke;
  block[3] = &unk_1E58BB978;
  block[4] = self;
  id v13 = v5;
  id v11 = v5;
  dispatch_sync(v10, block);
}

uint64_t __42__HKAnchoredObjectQuery_setUpdateHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 200) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)setIgnoreDeletedObjects:(BOOL)a3
{
}

- (BOOL)ignoreDeletedObjects
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_includeDeletedObjects);
  return (v2 & 1) == 0;
}

- (void)client_deliverSampleObjects:(id)a3 deletedObjects:(id)a4 anchor:(id)a5 clearPendingSamples:(BOOL)a6 deliverResults:(BOOL)a7 query:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v18 = [(HKQuery *)self queue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __116__HKAnchoredObjectQuery_client_deliverSampleObjects_deletedObjects_anchor_clearPendingSamples_deliverResults_query___block_invoke;
  v23[3] = &unk_1E58C2628;
  BOOL v28 = a6;
  v23[4] = self;
  id v24 = v14;
  BOOL v29 = a7;
  id v25 = v15;
  id v26 = v16;
  id v27 = v17;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  dispatch_async(v18, v23);
}

void __116__HKAnchoredObjectQuery_client_deliverSampleObjects_deletedObjects_anchor_clearPendingSamples_deliverResults_query___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    v3 = *(void **)(v2 + 168);
    *(void *)(v2 + 168) = 0;

    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 160);
    *(void *)(v4 + 160) = 0;
  }
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 160);
  if (v6)
  {
    [v6 addObjectsFromArray:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 40) mutableCopy];
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 160);
    *(void *)(v8 + 160) = v7;
  }
  id v10 = *(void **)(*(void *)(a1 + 32) + 168);
  if (v10)
  {
    [v10 addObjectsFromArray:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 48) mutableCopy];
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 168);
    *(void *)(v12 + 168) = v11;
  }
  if (*(unsigned char *)(a1 + 73))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(void **)(v14 + 184);
    if (v15)
    {
      if ([v15 compare:*(void *)(a1 + 56)] != -1) {
        return;
      }
      uint64_t v14 = *(void *)(a1 + 32);
    }
    int v16 = *(unsigned __int8 *)(v14 + 152);
    id v17 = _Block_copy(*(const void **)(v14 + 216));
    v18 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 200));
    if (*(unsigned char *)(a1 + 73))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      if (v16) {
        uint64_t v20 = 200;
      }
      else {
        uint64_t v20 = 216;
      }
      if (*(void *)(v19 + v20))
      {
        id v21 = *(id *)(v19 + 160);
        uint64_t v22 = *(void *)(a1 + 32);
        v23 = *(void **)(v22 + 160);
        *(void *)(v22 + 160) = 0;

        id v24 = *(id *)(*(void *)(a1 + 32) + 168);
        uint64_t v25 = *(void *)(a1 + 32);
        id v26 = *(void **)(v25 + 168);
        *(void *)(v25 + 168) = 0;

        *(unsigned char *)(*(void *)(a1 + 32) + 152) = 1;
        uint64_t v27 = [*(id *)(a1 + 56) copy];
        uint64_t v28 = *(void *)(a1 + 32);
        BOOL v29 = *(void **)(v28 + 184);
        *(void *)(v28 + 184) = v27;

        uint64_t v30 = objc_msgSend(*(id *)(a1 + 32), "queue_shouldDeactivateAfterInitialResults");
        v31 = *(void **)(a1 + 32);
        uint64_t v32 = *(void *)(a1 + 64);
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __116__HKAnchoredObjectQuery_client_deliverSampleObjects_deletedObjects_anchor_clearPendingSamples_deliverResults_query___block_invoke_2;
        v36[3] = &unk_1E58C2600;
        char v42 = v16;
        id v33 = v18;
        v36[4] = *(void *)(a1 + 32);
        id v37 = v21;
        id v40 = v33;
        id v38 = v24;
        id v39 = *(id *)(a1 + 56);
        id v41 = v17;
        id v34 = v24;
        id v35 = v21;
        objc_msgSend(v31, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v32, v30, v36);
      }
    }
  }
}

uint64_t __116__HKAnchoredObjectQuery_client_deliverSampleObjects_deletedObjects_anchor_clearPendingSamples_deliverResults_query___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = 64;
  if (!*(unsigned char *)(a1 + 80)) {
    uint64_t v1 = 72;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + v1) + 16))();
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED07AF0;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___HKAnchoredObjectQuery;
  objc_msgSendSuper2(&v7, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverSampleObjects_deletedObjects_anchor_clearPendingSamples_deliverResults_query_, 0, 0);
  id v6 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverSampleObjects_deletedObjects_anchor_clearPendingSamples_deliverResults_query_, 1, 0);
}

- (void)queue_populateConfiguration:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKAnchoredObjectQuery;
  id v4 = a3;
  [(HKQuery *)&v8 queue_populateConfiguration:v4];
  currentAnchor = self->_currentAnchor;
  if (!currentAnchor) {
    currentAnchor = self->_anchor;
  }
  objc_msgSend(v4, "setAnchor:", currentAnchor, v8.receiver, v8.super_class);
  [v4 setLimit:self->_limit];
  [v4 setCollectionInterval:self->_collectionInterval];
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->_includeDeletedObjects);
  [v4 setIncludeDeletedObjects:v6 & 1];
  [v4 setIncludeAutomaticTimeZones:self->_includeAutomaticTimeZones];
  [v4 setIncludeContributorInformation:self->_includeContributorInformation];
  objc_super v7 = [(HKQuery *)self queryDescriptors];
  [v4 setQueryDescriptors:v7];
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKAnchoredObjectQuery;
  [(HKQuery *)&v6 queue_queryDidDeactivate:a3];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  id updateHandler = self->_updateHandler;
  self->_id updateHandler = 0;

  self->_initialHandlerCalled = 0;
}

- (void)queue_validate
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)HKAnchoredObjectQuery;
  [(HKQuery *)&v26 queue_validate];
  v3 = [(HKQuery *)self queryDescriptors];
  uint64_t v4 = [v3 count];

  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ data type must be non-nil", objc_opt_class() format];
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  objc_super v6 = self;
  id obj = [(HKQuery *)self queryDescriptors];
  uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v12 = [v11 sampleType];

        if (!v12) {
          [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ data type must be non-nil", objc_opt_class() format];
        }
        id v13 = [v11 sampleType];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          id v15 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v16 = objc_opt_class();
          [v15 raise:@"HKQueryValidationFailureException", @"%@ data type must be of class %@", v16, objc_opt_class() format];
        }
        id v17 = [v11 sampleType];
        [v5 addObject:v17];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  uint64_t v18 = [v5 count];
  uint64_t v19 = [(HKQuery *)v6 queryDescriptors];
  uint64_t v20 = [v19 count];

  if (v18 != v20) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ cannot provide the same sample type in more than one HKQueryDescriptor", objc_opt_class() format];
  }
  if (!v6->_completionHandler) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ completionHandler cannot be nil", objc_opt_class() format];
  }
  if (v6->_updateHandler && v6->_includeAutomaticTimeZones) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@.includeAutomaticTimeZones is incompatible with a non-nil updateHandler", objc_opt_class() format];
  }
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  id v5 = _Block_copy(self->_completionHandler);
  if (v5)
  {
    objc_super v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__HKAnchoredObjectQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __44__HKAnchoredObjectQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, 0, 0, a1[5]);
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return self->_updateHandler == 0;
}

- (void)updateHandler
{
  return self->_updateHandler;
}

- (double)collectionInterval
{
  return self->_collectionInterval;
}

- (void)setCollectionInterval:(double)a3
{
  self->_collectionInterval = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (HKQueryAnchor)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
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

- (BOOL)includeAutomaticTimeZones
{
  return self->_includeAutomaticTimeZones;
}

- (void)setIncludeAutomaticTimeZones:(BOOL)a3
{
  self->_includeAutomaticTimeZones = a3;
}

- (BOOL)includeContributorInformation
{
  return self->_includeContributorInformation;
}

- (void)setIncludeContributorInformation:(BOOL)a3
{
  self->_includeContributorInformation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_currentAnchor, 0);
  objc_storeStrong((id *)&self->_deletedObjectsPendingDelivery, 0);

  objc_storeStrong((id *)&self->_samplesPendingDelivery, 0);
}

@end