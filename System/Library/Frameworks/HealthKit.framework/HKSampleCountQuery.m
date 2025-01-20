@interface HKSampleCountQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (HKSampleCountQuery)initWithQueryDescriptors:(id)a3 resultsHandler:(id)a4;
- (HKSampleCountQuery)initWithResultsHandler:(id)a3;
- (HKSampleCountQuery)initWithSampleType:(id)a3 predicate:(id)a4 resultsHandler:(id)a5;
- (HKSampleCountQuery)initWithSampleTypes:(id)a3 predicate:(id)a4 resultsHandler:(id)a5;
- (NSSet)sampleTypes;
- (void)client_deliverSampleCountDictionary:(id)a3 forQuery:(id)a4;
- (void)client_deliverSampleTypeCountDictionary:(id)a3 forQuery:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
@end

@implementation HKSampleCountQuery

- (HKSampleCountQuery)initWithQueryDescriptors:(id)a3 resultsHandler:(id)a4
{
  id v6 = a4;
  v7 = [a3 allObjects];
  v13.receiver = self;
  v13.super_class = (Class)HKSampleCountQuery;
  v8 = [(HKQuery *)&v13 initWithQueryDescriptors:v7];

  if (v8)
  {
    v9 = _Block_copy(v6);
    id resultsHandler = v8->_resultsHandler;
    v8->_id resultsHandler = v9;

    id sampleTypeCountResultsHandler = v8->_sampleTypeCountResultsHandler;
    v8->_id sampleTypeCountResultsHandler = 0;
  }
  return v8;
}

- (HKSampleCountQuery)initWithSampleTypes:(id)a3 predicate:(id)a4 resultsHandler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67__HKSampleCountQuery_initWithSampleTypes_predicate_resultsHandler___block_invoke;
  v19[3] = &unk_1E58C89F8;
  id v11 = v9;
  id v20 = v11;
  v12 = objc_msgSend(a3, "hk_map:", v19);
  if (v10)
  {
    objc_super v13 = v17;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __67__HKSampleCountQuery_initWithSampleTypes_predicate_resultsHandler___block_invoke_2;
    v17[3] = &unk_1E58C9450;
    v5 = &v18;
    id v18 = v10;
  }
  else
  {
    objc_super v13 = 0;
  }
  v14 = _Block_copy(v13);
  v15 = [(HKSampleCountQuery *)self initWithQueryDescriptors:v12 resultsHandler:v14];

  if (v10) {
  return v15;
  }
}

HKQueryDescriptor *__67__HKSampleCountQuery_initWithSampleTypes_predicate_resultsHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[HKQueryDescriptor alloc] initWithSampleType:v3 predicate:*(void *)(a1 + 32)];

  return v4;
}

void __67__HKSampleCountQuery_initWithSampleTypes_predicate_resultsHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  }
  else
  {
    id v10 = 0;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v17 = objc_msgSend(v11, "objectForKeyedSubscript:", v16, (void)v19);
        id v18 = [v16 sampleType];
        [v10 setObject:v17 forKeyedSubscript:v18];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (HKSampleCountQuery)initWithSampleType:(id)a3 predicate:(id)a4 resultsHandler:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 setWithObject:a3];
  uint64_t v12 = [(HKSampleCountQuery *)self initWithSampleTypes:v11 predicate:v10 resultsHandler:v9];

  return v12;
}

- (NSSet)sampleTypes
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v4 = [(HKQuery *)self queryDescriptors];
  v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(HKQuery *)self queryDescriptors];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) sampleType];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = (void *)[v5 copy];

  return (NSSet *)v12;
}

- (HKSampleCountQuery)initWithResultsHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKSampleCountQuery.m", 74, @"Invalid parameter not satisfying: %@", @"resultsHandler != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)HKSampleCountQuery;
  id v6 = [(HKQuery *)&v13 _initWithObjectType:0 predicate:0];
  uint64_t v7 = v6;
  if (v6)
  {
    id resultsHandler = v6->_resultsHandler;
    v6->_id resultsHandler = 0;

    uint64_t v9 = _Block_copy(v5);
    id sampleTypeCountResultsHandler = v7->_sampleTypeCountResultsHandler;
    v7->_id sampleTypeCountResultsHandler = v9;
  }
  return v7;
}

- (void)client_deliverSampleCountDictionary:(id)a3 forQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__HKSampleCountQuery_client_deliverSampleCountDictionary_forQuery___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __67__HKSampleCountQuery_client_deliverSampleCountDictionary_forQuery___block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 152));
  id v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__HKSampleCountQuery_client_deliverSampleCountDictionary_forQuery___block_invoke_2;
    v8[3] = &unk_1E58BB9A0;
    id v6 = v2;
    uint64_t v7 = *(void *)(a1 + 32);
    id v10 = v6;
    v8[4] = v7;
    id v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 1, v8);
  }
}

uint64_t __67__HKSampleCountQuery_client_deliverSampleCountDictionary_forQuery___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (void)client_deliverSampleTypeCountDictionary:(id)a3 forQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__HKSampleCountQuery_client_deliverSampleTypeCountDictionary_forQuery___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __71__HKSampleCountQuery_client_deliverSampleTypeCountDictionary_forQuery___block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 160));
  id v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__HKSampleCountQuery_client_deliverSampleTypeCountDictionary_forQuery___block_invoke_2;
    v8[3] = &unk_1E58BB9A0;
    id v6 = v2;
    uint64_t v7 = *(void *)(a1 + 32);
    id v10 = v6;
    v8[4] = v7;
    id v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 1, v8);
  }
}

uint64_t __71__HKSampleCountQuery_client_deliverSampleTypeCountDictionary_forQuery___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED2FBE8;
}

+ (void)configureClientInterface:(id)a3
{
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___HKSampleCountQuery;
  id v3 = a3;
  objc_msgSendSuper2(&v12, sel_configureClientInterface_, v3);
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  [v3 setClasses:v7 forSelector:sel_client_deliverSampleCountDictionary_forQuery_ argumentIndex:0 ofReply:0];
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  [v3 setClasses:v11 forSelector:sel_client_deliverSampleTypeCountDictionary_forQuery_ argumentIndex:0 ofReply:0];
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  id resultsHandler = self->_resultsHandler;
  if (resultsHandler)
  {
    uint64_t v6 = _Block_copy(resultsHandler);
    uint64_t v7 = [(HKQuery *)self clientQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __41__HKSampleCountQuery_queue_deliverError___block_invoke;
    v17[3] = &unk_1E58BB9A0;
    uint64_t v8 = &v19;
    uint64_t v19 = v6;
    void v17[4] = self;
    uint64_t v9 = &v18;
    id v18 = v4;
    id v10 = v6;
    id v11 = v17;
LABEL_5:
    dispatch_async(v7, v11);

    goto LABEL_6;
  }
  id sampleTypeCountResultsHandler = self->_sampleTypeCountResultsHandler;
  if (sampleTypeCountResultsHandler)
  {
    id v13 = _Block_copy(sampleTypeCountResultsHandler);
    uint64_t v7 = [(HKQuery *)self clientQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __41__HKSampleCountQuery_queue_deliverError___block_invoke_2;
    v14[3] = &unk_1E58BB9A0;
    uint64_t v8 = &v16;
    long long v16 = v13;
    v14[4] = self;
    uint64_t v9 = &v15;
    id v15 = v4;
    id v10 = v13;
    id v11 = v14;
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __41__HKSampleCountQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

uint64_t __41__HKSampleCountQuery_queue_deliverError___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_populateConfiguration:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKSampleCountQuery;
  id v4 = a3;
  [(HKQuery *)&v6 queue_populateConfiguration:v4];
  uint64_t v5 = [(HKQuery *)self queryDescriptors];
  [v4 setQueryDescriptors:v5];
}

- (void)queue_validate
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)HKSampleCountQuery;
  [(HKQuery *)&v24 queue_validate];
  id sampleTypeCountResultsHandler = self->_sampleTypeCountResultsHandler;
  if (self->_resultsHandler)
  {
    if (!sampleTypeCountResultsHandler) {
      goto LABEL_8;
    }
  }
  else if (sampleTypeCountResultsHandler)
  {
LABEL_6:
    if (self->_sampleTypeCountResultsHandler) {
      goto LABEL_10;
    }
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ completionHandler cannot be nil", objc_opt_class() format];
    if (!self->_resultsHandler) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
  [v5 handleFailureInMethod:a2, self, @"HKSampleCountQuery.m", 159, @"%@ cannot have two completion handlers", objc_opt_class() object file lineNumber description];

  if (!self->_resultsHandler) {
    goto LABEL_6;
  }
LABEL_8:
  objc_super v6 = [(HKQuery *)self queryDescriptors];
  uint64_t v7 = [v6 count];

  if (!v7) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ sample query description cannot be empty", objc_opt_class() format];
  }
LABEL_10:
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(HKQuery *)self queryDescriptors];
  uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v14 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v15 = objc_opt_class();
          [v14 raise:v11, @"%@ sample query description must be of class %@", v15, objc_opt_class() format];
        }
        long long v16 = [v13 sampleType];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v17 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v18 = objc_opt_class();
          [v17 raise:v11, @"%@ sample type must be of class %@", v18, objc_opt_class() format];
        }

        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v9);
  }
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKSampleCountQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id resultsHandler = self->_resultsHandler;
  self->_id resultsHandler = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sampleTypeCountResultsHandler, 0);

  objc_storeStrong(&self->_resultsHandler, 0);
}

@end