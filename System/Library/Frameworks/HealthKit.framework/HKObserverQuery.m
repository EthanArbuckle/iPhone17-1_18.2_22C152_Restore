@interface HKObserverQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (BOOL)observeUnfrozenSeries;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (HKObserverQuery)initWithQueryDescriptors:(NSArray *)queryDescriptors updateHandler:(void *)updateHandler;
- (HKObserverQuery)initWithSampleType:(HKSampleType *)sampleType predicate:(NSPredicate *)predicate updateHandler:(void *)updateHandler;
- (id)updateHandler;
- (void)_validateAndRaiseExceptionIfNeeded:(id)a3;
- (void)client_dataUpdatedInDatabaseForTypes:(id)a3 withAnchor:(id)a4 query:(id)a5;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
- (void)setObserveUnfrozenSeries:(BOOL)a3;
@end

@implementation HKObserverQuery

- (HKObserverQuery)initWithSampleType:(HKSampleType *)sampleType predicate:(NSPredicate *)predicate updateHandler:(void *)updateHandler
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v8 = updateHandler;
  v9 = predicate;
  v10 = sampleType;
  v11 = [[HKQueryDescriptor alloc] initWithSampleType:v10 predicate:v9];

  v18[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__HKObserverQuery_initWithSampleType_predicate_updateHandler___block_invoke;
  v16[3] = &unk_1E58C0908;
  id v17 = v8;
  id v13 = v8;
  v14 = [(HKObserverQuery *)self initWithQueryDescriptors:v12 updateHandler:v16];

  return v14;
}

void __62__HKObserverQuery_initWithSampleType_predicate_updateHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a5;
  id v10 = a4;
  _HKInitializeLogging();
  v11 = HKLogBackgroundUpdates;
  if (os_log_type_enabled((os_log_t)HKLogBackgroundUpdates, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v8;
    _os_log_impl(&dword_19C023000, v11, OS_LOG_TYPE_DEFAULT, "Returning back the update handler after success for query %{public}@", (uint8_t *)&v12, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (HKObserverQuery)initWithQueryDescriptors:(NSArray *)queryDescriptors updateHandler:(void *)updateHandler
{
  v6 = updateHandler;
  v7 = queryDescriptors;
  [(HKObserverQuery *)self _validateAndRaiseExceptionIfNeeded:v7];
  v12.receiver = self;
  v12.super_class = (Class)HKObserverQuery;
  id v8 = [(HKQuery *)&v12 initWithQueryDescriptors:v7];

  if (v8)
  {
    uint64_t v9 = [v6 copy];
    id v10 = v8->_updateHandler;
    v8->_updateHandler = (id)v9;
  }
  return v8;
}

- (void)client_dataUpdatedInDatabaseForTypes:(id)a3 withAnchor:(id)a4 query:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(HKQuery *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__HKObserverQuery_client_dataUpdatedInDatabaseForTypes_withAnchor_query___block_invoke;
  v15[3] = &unk_1E58C0930;
  v15[4] = self;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __73__HKObserverQuery_client_dataUpdatedInDatabaseForTypes_withAnchor_query___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 160));
  if (v2)
  {
    _HKInitializeLogging();
    v3 = HKLogBackgroundUpdates;
    if (os_log_type_enabled((os_log_t)HKLogBackgroundUpdates, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v4;
      _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, "client dataUpdatedInDatabase was fired for query UUID %{public}@", buf, 0xCu);
    }
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73__HKObserverQuery_client_dataUpdatedInDatabaseForTypes_withAnchor_query___block_invoke_6;
    v9[3] = &unk_1E58C0958;
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 32);
    id v12 = v7;
    uint64_t v13 = v8;
    id v14 = v2;
    objc_msgSend(v5, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v6, 0, v9);
  }
}

void __73__HKObserverQuery_client_dataUpdatedInDatabaseForTypes_withAnchor_query___block_invoke_6(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__HKObserverQuery_client_dataUpdatedInDatabaseForTypes_withAnchor_query___block_invoke_2;
  v5[3] = &unk_1E58C0930;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v2 = *(id *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  id v8 = v2;
  uint64_t v9 = v3;
  uint64_t v4 = _Block_copy(v5);
  (*(void (**)(void, void, void, void *))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), *(void *)(a1 + 56), *(void *)(a1 + 48), v4);
}

void __73__HKObserverQuery_client_dataUpdatedInDatabaseForTypes_withAnchor_query___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    _HKInitializeLogging();
    id v2 = HKLogBackgroundUpdates;
    if (os_log_type_enabled((os_log_t)HKLogBackgroundUpdates, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v3 = *(void *)(a1 + 48);
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 138543874;
      uint64_t v9 = v4;
      __int16 v10 = 2114;
      uint64_t v11 = v3;
      __int16 v12 = 2114;
      uint64_t v13 = v5;
      _os_log_impl(&dword_19C023000, v2, OS_LOG_TYPE_DEFAULT, "client called completionHandler for query UUID %{public}@, forTypes: %{public}@, anchor: %{public}@", (uint8_t *)&v8, 0x20u);
    }
    id v6 = [NSNumber numberWithUnsignedLongLong:time(0)];
    id v7 = [*(id *)(a1 + 56) delegate];
    [v7 closeTransactionForTypes:*(void *)(a1 + 48) anchor:*(void *)(a1 + 32) ackTime:v6 query:*(void *)(a1 + 56)];
  }
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_populateConfiguration:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKObserverQuery;
  id v4 = a3;
  [(HKQuery *)&v6 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setObserveUnfrozenSeries:", self->_observeUnfrozenSeries, v6.receiver, v6.super_class);
  uint64_t v5 = [(HKQuery *)self queryDescriptors];
  [v4 setQueryDescriptors:v5];
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EECFE9E0;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___HKObserverQuery;
  objc_msgSendSuper2(&v7, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setSetOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_dataUpdatedInDatabaseForTypes_withAnchor_query_, 0, 0);
  id v6 = (id)objc_msgSend(v4, "hk_setSetOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_dataUpdatedInDatabaseForTypes_withAnchor_query_, 1, 0);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKObserverQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id updateHandler = self->_updateHandler;
  self->_id updateHandler = 0;
}

- (void)queue_validate
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)HKObserverQuery;
  [(HKQuery *)&v20 queue_validate];
  uint64_t v3 = [(HKQuery *)self queryDescriptors];
  uint64_t v4 = [v3 count];

  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ data type must be non-nil", objc_opt_class() format];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v5 = [(HKQuery *)self queryDescriptors];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        __int16 v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [v10 sampleType];

        if (!v11) {
          [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ data type must be non-nil", objc_opt_class() format];
        }
        __int16 v12 = [v10 sampleType];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v15 = objc_opt_class();
          [v14 raise:@"HKQueryValidationFailureException", @"%@ data type must be of class %@", v15, objc_opt_class() format];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v7);
  }

  if (!self->_updateHandler) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ updateHandler must not be nil", objc_opt_class() format];
  }
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return self->_updateHandler == 0;
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  objc_super v5 = _Block_copy(self->_updateHandler);
  if (v5)
  {
    uint64_t v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__HKObserverQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __38__HKObserverQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void *, void))(a1[6] + 16))(a1[6], a1[4], 0, &__block_literal_global_28, a1[5]);
}

- (void)_validateAndRaiseExceptionIfNeeded:(id)a3
{
  if (objc_msgSend(a3, "hk_containsObjectPassingTest:", &__block_literal_global_82))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = objc_opt_class();
    id v5 = +[HKObjectType visionPrescriptionType];
    [v3 raise:@"HKQueryValidationFailureException", @"%@ Cannot initialize Observer Query with unsupported type %@.", v4, v5 format];
  }
}

uint64_t __54__HKObserverQuery__validateAndRaiseExceptionIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 sampleType];
  uint64_t v3 = +[HKObjectType visionPrescriptionType];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (BOOL)observeUnfrozenSeries
{
  return self->_observeUnfrozenSeries;
}

- (void)setObserveUnfrozenSeries:(BOOL)a3
{
  self->_observeUnfrozenSeries = a3;
}

- (void).cxx_destruct
{
}

@end