@interface _HKCurrentActivitySummaryQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (NSDictionary)_collectionIntervals;
- (_HKCurrentActivitySummaryQuery)initWithUpdateHandler:(id)a3;
- (void)_setCollectionIntervals:(id)a3;
- (void)client_deliverActivitySummaries:(id)a3 queryUUID:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
@end

@implementation _HKCurrentActivitySummaryQuery

- (_HKCurrentActivitySummaryQuery)initWithUpdateHandler:(id)a3
{
  id v4 = a3;
  v5 = +[HKObjectType activitySummaryType];
  v10.receiver = self;
  v10.super_class = (Class)_HKCurrentActivitySummaryQuery;
  v6 = [(HKQuery *)&v10 _initWithObjectType:v5 predicate:0];

  if (v6)
  {
    uint64_t v7 = [v4 copy];
    id updateHandler = v6->_updateHandler;
    v6->_id updateHandler = (id)v7;
  }
  return v6;
}

- (void)client_deliverActivitySummaries:(id)a3 queryUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76___HKCurrentActivitySummaryQuery_client_deliverActivitySummaries_queryUUID___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED13B40;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS____HKCurrentActivitySummaryQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverActivitySummaries_queryUUID_, 0, 0);
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKCurrentActivitySummaryQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setCollectionIntervals:", self->_collectionIntervals, v5.receiver, v5.super_class);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKCurrentActivitySummaryQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id updateHandler = self->_updateHandler;
  self->_id updateHandler = 0;
}

- (void)queue_validate
{
  v3.receiver = self;
  v3.super_class = (Class)_HKCurrentActivitySummaryQuery;
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
    block[2] = __53___HKCurrentActivitySummaryQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

- (void)_setCollectionIntervals:(id)a3
{
  id v4 = a3;
  [(HKQuery *)self _throwInvalidArgumentExceptionIfHasBeenExecuted:sel__setCollectionIntervals_];
  objc_super v5 = (NSDictionary *)[v4 copy];

  collectionIntervals = self->_collectionIntervals;
  self->_collectionIntervals = v5;
}

- (NSDictionary)_collectionIntervals
{
  return self->_collectionIntervals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIntervals, 0);

  objc_storeStrong(&self->_updateHandler, 0);
}

@end