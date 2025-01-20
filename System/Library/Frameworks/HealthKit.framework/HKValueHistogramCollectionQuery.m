@interface HKValueHistogramCollectionQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (HKQuantityType)quantityType;
- (HKValueHistogramCollectionQuery)initWithQuantityType:(id)a3 quantitySamplePredicate:(id)a4 anchorDate:(id)a5 intervalComponents:(id)a6 quantityRanges:(id)a7 resultsHandler:(id)a8;
- (NSArray)quantityRanges;
- (NSDate)anchorDate;
- (NSDateComponents)intervalComponents;
- (id)resultsHandler;
- (void)client_deliverValueHistogramCollection:(id)a3 forQuery:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
- (void)setResultsHandler:(id)a3;
@end

@implementation HKValueHistogramCollectionQuery

- (HKValueHistogramCollectionQuery)initWithQuantityType:(id)a3 quantitySamplePredicate:(id)a4 anchorDate:(id)a5 intervalComponents:(id)a6 quantityRanges:(id)a7 resultsHandler:(id)a8
{
  id v15 = a3;
  id v24 = a5;
  id v23 = a6;
  id v16 = a7;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HKValueHistogramCollectionQuery;
  v18 = [(HKQuery *)&v25 _initWithObjectType:v15 predicate:a4];
  v19 = (HKValueHistogramCollectionQuery *)v18;
  if (v18)
  {
    objc_storeStrong(v18 + 19, a3);
    objc_storeStrong((id *)&v19->_anchorDate, a5);
    objc_storeStrong((id *)&v19->_intervalComponents, a6);
    objc_storeStrong((id *)&v19->_quantityRanges, a7);
    v20 = _Block_copy(v17);
    id resultsHandler = v19->_resultsHandler;
    v19->_id resultsHandler = v20;
  }
  return v19;
}

- (void)client_deliverValueHistogramCollection:(id)a3 forQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__HKValueHistogramCollectionQuery_client_deliverValueHistogramCollection_forQuery___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __83__HKValueHistogramCollectionQuery_client_deliverValueHistogramCollection_forQuery___block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 184));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __83__HKValueHistogramCollectionQuery_client_deliverValueHistogramCollection_forQuery___block_invoke_2;
    v8[3] = &unk_1E58BB9A0;
    id v6 = v2;
    uint64_t v7 = *(void *)(a1 + 32);
    id v10 = v6;
    v8[4] = v7;
    id v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 1, v8);
  }
}

uint64_t __83__HKValueHistogramCollectionQuery_client_deliverValueHistogramCollection_forQuery___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKValueHistogramCollectionQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setAnchorDate:", self->_anchorDate, v5.receiver, v5.super_class);
  [v4 setIntervalComponents:self->_intervalComponents];
  [v4 setQuantityRanges:self->_quantityRanges];
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED28E68;
}

+ (void)configureClientInterface:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKValueHistogramCollectionQuery;
  id v3 = a3;
  objc_msgSendSuper2(&v5, sel_configureClientInterface_, v3);
  id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v3 setClasses:v4 forSelector:sel_client_deliverValueHistogramCollection_forQuery_ argumentIndex:0 ofReply:0];
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  objc_super v5 = _Block_copy(self->_resultsHandler);
  id v6 = [(HKQuery *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HKValueHistogramCollectionQuery_queue_deliverError___block_invoke;
  block[3] = &unk_1E58BB9A0;
  id v10 = v4;
  id v11 = v5;
  block[4] = self;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __54__HKValueHistogramCollectionQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_validate
{
  v4.receiver = self;
  v4.super_class = (Class)HKValueHistogramCollectionQuery;
  [(HKQuery *)&v4 queue_validate];
  if ([(NSDateComponents *)self->_intervalComponents hk_maxComponentValue] < 1
    || ([(NSDateComponents *)self->_intervalComponents hk_approximateDuration], v3 <= 0.0))
  {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ interval components must be greater than zero: %@", objc_opt_class(), self->_intervalComponents format];
  }
  if (!+[HKQuantityRange areRangesDisjoint:](HKQuantityRange, "areRangesDisjoint:", self->_quantityRanges))[MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ quantity ranges must be disjoint: %@", objc_opt_class(), self->_quantityRanges format]; {
  if (!self->_resultsHandler)
  }
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ resultsHandler must not be nil", objc_opt_class() format];
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKValueHistogramCollectionQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id resultsHandler = self->_resultsHandler;
  self->_id resultsHandler = 0;
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (NSDateComponents)intervalComponents
{
  return self->_intervalComponents;
}

- (NSArray)quantityRanges
{
  return self->_quantityRanges;
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
  objc_storeStrong((id *)&self->_quantityRanges, 0);
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);

  objc_storeStrong((id *)&self->_quantityType, 0);
}

@end