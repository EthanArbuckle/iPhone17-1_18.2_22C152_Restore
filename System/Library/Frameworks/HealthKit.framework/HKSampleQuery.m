@interface HKSampleQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (id)sortDescriptorsForMostRecentSamples;
+ (void)configureClientInterface:(id)a3;
- (BOOL)_prepareSamplesForDelivery:(id)a3 error:(id *)a4;
- (BOOL)includeAutomaticTimeZones;
- (BOOL)includeContributorInformation;
- (HKSampleQuery)initWithQueryDescriptors:(NSArray *)queryDescriptors limit:(NSInteger)limit resultsHandler:(void *)resultsHandler;
- (HKSampleQuery)initWithQueryDescriptors:(NSArray *)queryDescriptors limit:(NSInteger)limit sortDescriptors:(NSArray *)sortDescriptors resultsHandler:(void *)resultsHandler;
- (HKSampleQuery)initWithSampleType:(HKSampleType *)sampleType predicate:(NSPredicate *)predicate limit:(NSUInteger)limit sortDescriptors:(NSArray *)sortDescriptors resultsHandler:(void *)resultsHandler;
- (NSArray)sortDescriptors;
- (NSUInteger)limit;
- (id)resultHandler;
- (void)client_deliverSamples:(id)a3 clearPendingSamples:(BOOL)a4 isFinalBatch:(BOOL)a5 queryUUID:(id)a6;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
- (void)setIncludeAutomaticTimeZones:(BOOL)a3;
- (void)setIncludeContributorInformation:(BOOL)a3;
@end

@implementation HKSampleQuery

- (HKSampleQuery)initWithSampleType:(HKSampleType *)sampleType predicate:(NSPredicate *)predicate limit:(NSUInteger)limit sortDescriptors:(NSArray *)sortDescriptors resultsHandler:(void *)resultsHandler
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v12 = resultsHandler;
  v13 = sortDescriptors;
  v14 = predicate;
  v15 = sampleType;
  v16 = [[HKQueryDescriptor alloc] initWithSampleType:v15 predicate:v14];

  v20[0] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v18 = [(HKSampleQuery *)self initWithQueryDescriptors:v17 limit:limit sortDescriptors:v13 resultsHandler:v12];

  return v18;
}

- (HKSampleQuery)initWithQueryDescriptors:(NSArray *)queryDescriptors limit:(NSInteger)limit resultsHandler:(void *)resultsHandler
{
  return [(HKSampleQuery *)self initWithQueryDescriptors:queryDescriptors limit:limit sortDescriptors:MEMORY[0x1E4F1CBF0] resultsHandler:resultsHandler];
}

- (HKSampleQuery)initWithQueryDescriptors:(NSArray *)queryDescriptors limit:(NSInteger)limit sortDescriptors:(NSArray *)sortDescriptors resultsHandler:(void *)resultsHandler
{
  v10 = sortDescriptors;
  v11 = resultsHandler;
  v18.receiver = self;
  v18.super_class = (Class)HKSampleQuery;
  v12 = [(HKQuery *)&v18 initWithQueryDescriptors:queryDescriptors];
  if (v12)
  {
    uint64_t v13 = [(NSArray *)v10 copy];
    v14 = v12->_sortDescriptors;
    v12->_sortDescriptors = (NSArray *)v13;

    v12->_limit = limit;
    v15 = _Block_copy(v11);
    id resultHandler = v12->_resultHandler;
    v12->_id resultHandler = v15;

    v12->_includeAutomaticTimeZones = 0;
  }

  return v12;
}

- (NSUInteger)limit
{
  return self->_limit;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (BOOL)_prepareSamplesForDelivery:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "prepareForDelivery:", a4, (void)v12))
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (void)client_deliverSamples:(id)a3 clearPendingSamples:(BOOL)a4 isFinalBatch:(BOOL)a5 queryUUID:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  long long v12 = [(HKQuery *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__HKSampleQuery_client_deliverSamples_clearPendingSamples_isFinalBatch_queryUUID___block_invoke;
  v15[3] = &unk_1E58BF240;
  v15[4] = self;
  id v16 = v11;
  id v17 = v10;
  BOOL v18 = a4;
  BOOL v19 = a5;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(v12, v15);
}

void __82__HKSampleQuery_client_deliverSamples_clearPendingSamples_isFinalBatch_queryUUID___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 192));
  if (v2)
  {
    if ([*(id *)(a1 + 32) hasQueryUUID:*(void *)(a1 + 40)])
    {
      v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 48);
      id v30 = 0;
      char v5 = [v3 _prepareSamplesForDelivery:v4 error:&v30];
      id v6 = v30;
      uint64_t v7 = *(void **)(a1 + 32);
      if (v5)
      {
        uint64_t v8 = (void *)v7[22];
        if (v8 && !*(unsigned char *)(a1 + 56))
        {
          [v8 addObjectsFromArray:*(void *)(a1 + 48)];
        }
        else
        {
          uint64_t v9 = [*(id *)(a1 + 48) mutableCopy];
          uint64_t v10 = *(void *)(a1 + 32);
          id v11 = *(void **)(v10 + 176);
          *(void *)(v10 + 176) = v9;
        }
        if (!*(unsigned char *)(a1 + 57)) {
          goto LABEL_14;
        }
        id v19 = *(id *)(*(void *)(a1 + 32) + 176);
        uint64_t v20 = *(void *)(a1 + 32);
        v21 = *(void **)(v20 + 176);
        *(void *)(v20 + 176) = 0;

        v22 = *(void **)(a1 + 32);
        uint64_t v23 = *(void *)(a1 + 40);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __82__HKSampleQuery_client_deliverSamples_clearPendingSamples_isFinalBatch_queryUUID___block_invoke_2;
        v24[3] = &unk_1E58BB9A0;
        id v25 = v19;
        id v26 = v2;
        v24[4] = *(void *)(a1 + 32);
        id v18 = v19;
        objc_msgSend(v22, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v23, 1, v24);
      }
      else
      {
        uint64_t v15 = *(void *)(a1 + 40);
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __82__HKSampleQuery_client_deliverSamples_clearPendingSamples_isFinalBatch_queryUUID___block_invoke_5;
        v27[3] = &unk_1E58BB9A0;
        id v16 = v2;
        uint64_t v17 = *(void *)(a1 + 32);
        id v29 = v16;
        v27[4] = v17;
        id v28 = v6;
        objc_msgSend(v7, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v15, 1, v27);

        id v18 = v29;
      }

LABEL_14:
      goto LABEL_15;
    }
    _HKInitializeLogging();
    long long v12 = HKLogQuery;
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v13;
      __int16 v33 = 2114;
      uint64_t v34 = v14;
      _os_log_impl(&dword_19C023000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Not delivering samples, invalid query UUID %{public}@", buf, 0x16u);
    }
  }
LABEL_15:
}

uint64_t __82__HKSampleQuery_client_deliverSamples_clearPendingSamples_isFinalBatch_queryUUID___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

uint64_t __82__HKSampleQuery_client_deliverSamples_clearPendingSamples_isFinalBatch_queryUUID___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_populateConfiguration:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKSampleQuery;
  id v4 = a3;
  [(HKQuery *)&v6 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setSortDescriptors:", self->_sortDescriptors, v6.receiver, v6.super_class);
  [v4 setLimit:self->_limit];
  [v4 setIncludeAutomaticTimeZones:self->_includeAutomaticTimeZones];
  [v4 setIncludeContributorInformation:self->_includeContributorInformation];
  char v5 = [(HKQuery *)self queryDescriptors];
  [v4 setQueryDescriptors:v5];
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  char v5 = _Block_copy(self->_resultHandler);
  if (v5)
  {
    objc_super v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__HKSampleQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __36__HKSampleQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_validate
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)HKSampleQuery;
  [(HKQuery *)&v26 queue_validate];
  if (!self->_resultHandler) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ resultsHandler cannot be nil", objc_opt_class() format];
  }
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
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v12 = [v11 sampleType];

        if (!v12) {
          [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ data type must be non-nil", objc_opt_class() format];
        }
        uint64_t v13 = [v11 sampleType];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          uint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v16 = objc_opt_class();
          [v15 raise:@"HKQueryValidationFailureException", @"%@ data type must be of class %@", v16, objc_opt_class() format];
        }
        uint64_t v17 = [v11 sampleType];
        [v5 addObject:v17];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  uint64_t v18 = [v5 count];
  id v19 = [(HKQuery *)v6 queryDescriptors];
  uint64_t v20 = [v19 count];

  if (v18 != v20) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ cannot provide the same sample type in more than one HKQueryDescriptor", objc_opt_class() format];
  }
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKSampleQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id resultHandler = self->_resultHandler;
  self->_id resultHandler = 0;
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EECFBDF8;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKSampleQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverSamples_clearPendingSamples_isFinalBatch_queryUUID_, 0, 0);
}

+ (id)sortDescriptorsForMostRecentSamples
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"endDate" ascending:0];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"HKObjectSortIdentifierDataID" ascending:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (id)resultHandler
{
  return self->_resultHandler;
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
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_samplesPendingDelivery, 0);

  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

@end