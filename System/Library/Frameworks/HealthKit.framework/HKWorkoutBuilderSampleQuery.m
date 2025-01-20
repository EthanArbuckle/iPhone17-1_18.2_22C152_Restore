@interface HKWorkoutBuilderSampleQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (HKWorkoutBuilder)workoutBuilder;
- (HKWorkoutBuilderSampleQuery)initWithQuantityType:(id)a3 workoutBuilder:(id)a4 quantitiesAddedHandler:(id)a5;
- (HKWorkoutBuilderSampleQuery)initWithSampleType:(id)a3 workoutBuilder:(id)a4 samplesAddedHandler:(id)a5;
- (void)client_deliverQuantities:(id)a3 hasFinishedHistoricalFetch:(BOOL)a4 queryUUID:(id)a5;
- (void)client_deliverSamples:(id)a3 hasFinishedHistoricalFetch:(BOOL)a4 queryUUID:(id)a5;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
- (void)setWorkoutBuilder:(id)a3;
@end

@implementation HKWorkoutBuilderSampleQuery

- (HKWorkoutBuilderSampleQuery)initWithSampleType:(id)a3 workoutBuilder:(id)a4 samplesAddedHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HKWorkoutBuilderSampleQuery;
  v10 = [(HKQuery *)&v14 _initWithObjectType:a3 predicate:0];
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    id samplesAddedHandler = v10->_samplesAddedHandler;
    v10->_id samplesAddedHandler = (id)v11;

    v10->_needsHistoricalFetch = 1;
    objc_storeWeak((id *)&v10->_workoutBuilder, v8);
  }

  return v10;
}

- (HKWorkoutBuilderSampleQuery)initWithQuantityType:(id)a3 workoutBuilder:(id)a4 quantitiesAddedHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HKWorkoutBuilderSampleQuery;
  v10 = [(HKQuery *)&v14 _initWithObjectType:a3 predicate:0];
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    id quantitiesAddedHandler = v10->_quantitiesAddedHandler;
    v10->_id quantitiesAddedHandler = (id)v11;

    v10->_needsHistoricalFetch = 1;
    objc_storeWeak((id *)&v10->_workoutBuilder, v8);
  }

  return v10;
}

- (void)client_deliverSamples:(id)a3 hasFinishedHistoricalFetch:(BOOL)a4 queryUUID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(HKQuery *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__HKWorkoutBuilderSampleQuery_client_deliverSamples_hasFinishedHistoricalFetch_queryUUID___block_invoke;
  v13[3] = &unk_1E58BD7D8;
  BOOL v16 = a4;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(v10, v13);
}

void __90__HKWorkoutBuilderSampleQuery_client_deliverSamples_hasFinishedHistoricalFetch_queryUUID___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    *(unsigned char *)(*(void *)(a1 + 32) + 168) = 0;
  }
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 152));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __90__HKWorkoutBuilderSampleQuery_client_deliverSamples_hasFinishedHistoricalFetch_queryUUID___block_invoke_2;
    v8[3] = &unk_1E58BB9A0;
    id v6 = v2;
    uint64_t v7 = *(void *)(a1 + 32);
    id v10 = v6;
    v8[4] = v7;
    id v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 0, v8);
  }
}

uint64_t __90__HKWorkoutBuilderSampleQuery_client_deliverSamples_hasFinishedHistoricalFetch_queryUUID___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (void)client_deliverQuantities:(id)a3 hasFinishedHistoricalFetch:(BOOL)a4 queryUUID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HKQuery *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__HKWorkoutBuilderSampleQuery_client_deliverQuantities_hasFinishedHistoricalFetch_queryUUID___block_invoke;
  v13[3] = &unk_1E58BD7D8;
  BOOL v16 = a4;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(v10, v13);
}

void __93__HKWorkoutBuilderSampleQuery_client_deliverQuantities_hasFinishedHistoricalFetch_queryUUID___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    *(unsigned char *)(*(void *)(a1 + 32) + 168) = 0;
  }
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 160));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __93__HKWorkoutBuilderSampleQuery_client_deliverQuantities_hasFinishedHistoricalFetch_queryUUID___block_invoke_2;
    v8[3] = &unk_1E58BB9A0;
    id v6 = v2;
    uint64_t v7 = *(void *)(a1 + 32);
    id v10 = v6;
    v8[4] = v7;
    id v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 0, v8);
  }
}

uint64_t __93__HKWorkoutBuilderSampleQuery_client_deliverQuantities_hasFinishedHistoricalFetch_queryUUID___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED097F8;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___HKWorkoutBuilderSampleQuery;
  objc_msgSendSuper2(&v7, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverSamples_hasFinishedHistoricalFetch_queryUUID_, 0, 0);
  id v6 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverQuantities_hasFinishedHistoricalFetch_queryUUID_, 0, 0);
}

- (void)queue_populateConfiguration:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HKWorkoutBuilderSampleQuery;
  id v4 = a3;
  [(HKQuery *)&v7 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setNeedsHistoricalData:", self->_needsHistoricalFetch, v7.receiver, v7.super_class);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workoutBuilder);
  id v6 = [WeakRetained identifier];
  [v4 setWorkoutBuilderIdentifier:v6];

  [v4 setDeliverQuantities:self->_quantitiesAddedHandler != 0];
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutBuilderSampleQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  objc_storeWeak((id *)&self->_workoutBuilder, 0);
  id samplesAddedHandler = self->_samplesAddedHandler;
  self->_id samplesAddedHandler = 0;
}

- (void)queue_validate
{
  v8.receiver = self;
  v8.super_class = (Class)HKWorkoutBuilderSampleQuery;
  [(HKQuery *)&v8 queue_validate];
  v3 = [(HKQuery *)self objectType];

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ data type must be non-nil", objc_opt_class() format];
  }
  id v4 = [(HKQuery *)self objectType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = objc_opt_class();
    [v6 raise:@"HKQueryValidationFailureException", @"%@ data type must be of class %@", v7, objc_opt_class() format];
  }
  if (!self->_samplesAddedHandler && !self->_quantitiesAddedHandler) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ either samplesAddedHandler or quantitiesAddedHandler must be non-nil", objc_opt_class() format];
  }
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  objc_super v5 = _Block_copy(self->_samplesAddedHandler);
  if (v5)
  {
    id v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__HKWorkoutBuilderSampleQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __50__HKWorkoutBuilderSampleQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 0;
}

- (HKWorkoutBuilder)workoutBuilder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workoutBuilder);

  return (HKWorkoutBuilder *)WeakRetained;
}

- (void)setWorkoutBuilder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_workoutBuilder);
  objc_storeStrong(&self->_quantitiesAddedHandler, 0);

  objc_storeStrong(&self->_samplesAddedHandler, 0);
}

@end