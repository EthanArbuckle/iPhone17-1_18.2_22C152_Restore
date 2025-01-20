@interface HKCurrentActivityCacheQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (HKCurrentActivityCacheQuery)initWithStatisticsIntervalComponents:(id)a3 updateHandler:(id)a4;
- (id)updateHandler;
- (void)client_deliverQueryResult:(id)a3 queryUUID:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
- (void)setUpdateHandler:(id)a3;
@end

@implementation HKCurrentActivityCacheQuery

- (HKCurrentActivityCacheQuery)initWithStatisticsIntervalComponents:(id)a3 updateHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[HKObjectType activityCacheType];
  v15.receiver = self;
  v15.super_class = (Class)HKCurrentActivityCacheQuery;
  v9 = [(HKQuery *)&v15 _initWithObjectType:v8 predicate:0];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    id updateHandler = v9->_updateHandler;
    v9->_id updateHandler = (id)v10;

    uint64_t v12 = [v6 copy];
    statisticsIntervalComponents = v9->_statisticsIntervalComponents;
    v9->_statisticsIntervalComponents = (NSDateComponents *)v12;
  }
  return v9;
}

- (void)client_deliverQueryResult:(id)a3 queryUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__HKCurrentActivityCacheQuery_client_deliverQueryResult_queryUUID___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __67__HKCurrentActivityCacheQuery_client_deliverQueryResult_queryUUID___block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 160));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__HKCurrentActivityCacheQuery_client_deliverQueryResult_queryUUID___block_invoke_2;
    v8[3] = &unk_1E58BB9A0;
    id v6 = v2;
    uint64_t v7 = *(void *)(a1 + 32);
    id v10 = v6;
    v8[4] = v7;
    id v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 0, v8);
  }
}

uint64_t __67__HKCurrentActivityCacheQuery_client_deliverQueryResult_queryUUID___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EECF73B0;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKCurrentActivityCacheQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverQueryResult_queryUUID_, 0, 0);
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKCurrentActivityCacheQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setStatisticsIntervalComponents:", self->_statisticsIntervalComponents, v5.receiver, v5.super_class);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  self->_id updateHandler = 0;
  MEMORY[0x1F41817F8]();
}

- (void)queue_validate
{
  v3.receiver = self;
  v3.super_class = (Class)HKCurrentActivityCacheQuery;
  [(HKQuery *)&v3 queue_validate];
  if (!self->_updateHandler) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ updateHandler must not be nil", objc_opt_class() format];
  }
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 0;
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  objc_super v5 = _Block_copy(self->_updateHandler);
  if (v5)
  {
    objc_super v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__HKCurrentActivityCacheQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __50__HKCurrentActivityCacheQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);

  objc_storeStrong((id *)&self->_statisticsIntervalComponents, 0);
}

@end