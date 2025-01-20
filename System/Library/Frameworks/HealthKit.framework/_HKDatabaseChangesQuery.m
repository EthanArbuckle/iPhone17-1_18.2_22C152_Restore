@interface _HKDatabaseChangesQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
+ (void)configureServerInterface:(id)a3;
- (BOOL)includeChangeDetails;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (HKQueryAnchor)anchor;
- (NSArray)sampleTypes;
- (_HKDatabaseChangesQuery)initWithTypes:(id)a3 anchor:(id)a4 resultsHandler:(id)a5;
- (id)resultsHandler;
- (int64_t)anchorStrategyChangeCountLimit;
- (int64_t)changeDetailsQueryStrategy;
- (void)client_deliverQueryAnchor:(id)a3 sampleTypeChanges:(id)a4 queryUUID:(id)a5;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)setAnchorStrategyChangeCountLimit:(int64_t)a3;
- (void)setChangeDetailsQueryStrategy:(int64_t)a3;
- (void)setIncludeChangeDetails:(BOOL)a3;
@end

@implementation _HKDatabaseChangesQuery

- (_HKDatabaseChangesQuery)initWithTypes:(id)a3 anchor:(id)a4 resultsHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_HKDatabaseChangesQuery;
  v11 = [(HKQuery *)&v19 _initWithObjectType:0 predicate:0];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    sampleTypes = v11->_sampleTypes;
    v11->_sampleTypes = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    anchor = v11->_anchor;
    v11->_anchor = (HKQueryAnchor *)v14;

    uint64_t v16 = [v10 copy];
    id resultsHandler = v11->_resultsHandler;
    v11->_id resultsHandler = (id)v16;

    v11->_anchorStrategyChangeCountLimit = 50000;
  }

  return v11;
}

- (void)setIncludeChangeDetails:(BOOL)a3
{
  self->_includeChangeDetails = a3;
}

- (void)setChangeDetailsQueryStrategy:(int64_t)a3
{
  self->_changeDetailsQueryStrategy = a3;
}

- (void)setAnchorStrategyChangeCountLimit:(int64_t)a3
{
  self->_anchorStrategyChangeCountLimit = a3;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED2AAC0;
}

+ (void)configureClientInterface:(id)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS____HKDatabaseChangesQuery;
  id v3 = a3;
  objc_msgSendSuper2(&v7, sel_configureClientInterface_, v3);
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "hk_typesForDictionaryMapping:to:", v5, objc_opt_class(), v7.receiver, v7.super_class);
  [v3 setClasses:v6 forSelector:sel_client_deliverQueryAnchor_sampleTypeChanges_queryUUID_ argumentIndex:1 ofReply:0];
}

+ (void)configureServerInterface:(id)a3
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____HKDatabaseChangesQuery;
  objc_msgSendSuper2(&v3, sel_configureServerInterface_, a3);
}

- (void)queue_populateConfiguration:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKDatabaseChangesQuery;
  id v4 = a3;
  [(HKQuery *)&v6 queue_populateConfiguration:v4];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", self->_sampleTypes, v6.receiver, v6.super_class);
  [v4 setSampleTypes:v5];

  [v4 setAnchor:self->_anchor];
  [v4 setShouldDeactivateAfterInitialResults:0];
  [v4 setShouldSuppressDataCollection:1];
  [v4 setIncludeChangeDetails:self->_includeChangeDetails];
  [v4 setChangeDetailsQueryStrategy:self->_changeDetailsQueryStrategy];
  [v4 setAnchorStrategyChangeCountLimit:self->_anchorStrategyChangeCountLimit];
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 0;
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _Block_copy(self->_resultsHandler);
  if (v5)
  {
    objc_super v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46___HKDatabaseChangesQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKDatabaseChangesQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id resultsHandler = self->_resultsHandler;
  self->_id resultsHandler = 0;
}

- (void)client_deliverQueryAnchor:(id)a3 sampleTypeChanges:(id)a4 queryUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(HKQuery *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81___HKDatabaseChangesQuery_client_deliverQueryAnchor_sampleTypeChanges_queryUUID___block_invoke;
  v15[3] = &unk_1E58C0930;
  v15[4] = self;
  id v16 = v10;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

- (BOOL)includeChangeDetails
{
  return self->_includeChangeDetails;
}

- (int64_t)anchorStrategyChangeCountLimit
{
  return self->_anchorStrategyChangeCountLimit;
}

- (id)resultsHandler
{
  return self->_resultsHandler;
}

- (NSArray)sampleTypes
{
  return self->_sampleTypes;
}

- (HKQueryAnchor)anchor
{
  return self->_anchor;
}

- (int64_t)changeDetailsQueryStrategy
{
  return self->_changeDetailsQueryStrategy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_sampleTypes, 0);

  objc_storeStrong(&self->_resultsHandler, 0);
}

@end