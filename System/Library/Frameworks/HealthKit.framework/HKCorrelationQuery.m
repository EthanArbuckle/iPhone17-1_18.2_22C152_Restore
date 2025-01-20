@interface HKCorrelationQuery
+ (BOOL)shouldApplyAdditionalPredicateForObjectType:(id)a3;
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (HKCorrelationQuery)initWithType:(HKCorrelationType *)correlationType predicate:(NSPredicate *)predicate samplePredicates:(NSDictionary *)samplePredicates completion:(void *)completion;
- (NSDictionary)filterDictionary;
- (NSDictionary)samplePredicates;
- (id)completionHandler;
- (void)client_deliverCorrelations:(id)a3 clearPendingSamples:(BOOL)a4 isFinalBatch:(BOOL)a5 queryUUID:(id)a6;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
@end

@implementation HKCorrelationQuery

+ (BOOL)shouldApplyAdditionalPredicateForObjectType:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (HKCorrelationQuery)initWithType:(HKCorrelationType *)correlationType predicate:(NSPredicate *)predicate samplePredicates:(NSDictionary *)samplePredicates completion:(void *)completion
{
  v10 = samplePredicates;
  v11 = completion;
  v24.receiver = self;
  v24.super_class = (Class)HKCorrelationQuery;
  v12 = [(HKQuery *)&v24 _initWithObjectType:correlationType predicate:predicate];
  if (v12)
  {
    uint64_t v13 = [(NSDictionary *)v10 copy];
    v14 = v12->_samplePredicates;
    v12->_samplePredicates = (NSDictionary *)v13;

    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __73__HKCorrelationQuery_initWithType_predicate_samplePredicates_completion___block_invoke;
    v22[3] = &unk_1E58C8130;
    id v23 = v15;
    id v16 = v15;
    [(NSDictionary *)v10 enumerateKeysAndObjectsUsingBlock:v22];
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v16];
    filterDictionary = v12->_filterDictionary;
    v12->_filterDictionary = (NSDictionary *)v17;

    v19 = _Block_copy(v11);
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = v19;
  }
  return v12;
}

void __73__HKCorrelationQuery_initWithType_predicate_samplePredicates_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a3;
  id v7 = a2;
  v8 = [v5 setWithObject:v7];
  objc_msgSend(v6, "hk_filterRepresentationForDataTypes:", v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v7];
}

- (void)client_deliverCorrelations:(id)a3 clearPendingSamples:(BOOL)a4 isFinalBatch:(BOOL)a5 queryUUID:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = [(HKQuery *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__HKCorrelationQuery_client_deliverCorrelations_clearPendingSamples_isFinalBatch_queryUUID___block_invoke;
  v15[3] = &unk_1E58BF240;
  v15[4] = self;
  id v16 = v11;
  BOOL v18 = a4;
  id v17 = v10;
  BOOL v19 = a5;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(v12, v15);
}

void __92__HKCorrelationQuery_client_deliverCorrelations_clearPendingSamples_isFinalBatch_queryUUID___block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 168));
  if (v2 && [*(id *)(a1 + 32) hasQueryUUID:*(void *)(a1 + 40)])
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 160);
    if (v3 && !*(unsigned char *)(a1 + 56))
    {
      [v3 addObjectsFromArray:*(void *)(a1 + 48)];
    }
    else
    {
      uint64_t v4 = [*(id *)(a1 + 48) mutableCopy];
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 160);
      *(void *)(v5 + 160) = v4;
    }
    if (*(unsigned char *)(a1 + 57))
    {
      id v7 = *(id *)(*(void *)(a1 + 32) + 160);
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = *(void **)(v8 + 160);
      *(void *)(v8 + 160) = 0;

      id v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __92__HKCorrelationQuery_client_deliverCorrelations_clearPendingSamples_isFinalBatch_queryUUID___block_invoke_2;
      v13[3] = &unk_1E58BB9A0;
      id v14 = v7;
      id v15 = v2;
      v13[4] = *(void *)(a1 + 32);
      id v12 = v7;
      objc_msgSend(v10, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v11, 1, v13);
    }
  }
}

uint64_t __92__HKCorrelationQuery_client_deliverCorrelations_clearPendingSamples_isFinalBatch_queryUUID___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED25E68;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKCorrelationQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverCorrelations_clearPendingSamples_isFinalBatch_queryUUID_, 0, 0);
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKCorrelationQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setFilterDictionary:", self->_filterDictionary, v5.receiver, v5.super_class);
}

- (void)queue_validate
{
  v8.receiver = self;
  v8.super_class = (Class)HKCorrelationQuery;
  [(HKQuery *)&v8 queue_validate];
  id v3 = [(HKQuery *)self objectType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_super v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    id v7 = [(HKQuery *)self objectType];
    [v5 raise:v6, @"%@ is not an instance of %@", v7, objc_opt_class() format];
  }
  if (!self->_completionHandler) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ completionHandler cannot be nil", objc_opt_class() format];
  }
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  objc_super v5 = _Block_copy(self->_completionHandler);
  if (v5)
  {
    uint64_t v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__HKCorrelationQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __41__HKCorrelationQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKCorrelationQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;
}

- (NSDictionary)samplePredicates
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSDictionary)filterDictionary
{
  return self->_filterDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterDictionary, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_correlationsPendingDelivery, 0);

  objc_storeStrong((id *)&self->_samplePredicates, 0);
}

@end