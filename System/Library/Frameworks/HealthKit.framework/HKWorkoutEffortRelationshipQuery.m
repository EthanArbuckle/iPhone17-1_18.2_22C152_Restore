@interface HKWorkoutEffortRelationshipQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (HKQueryAnchor)anchor;
- (HKWorkoutEffortRelationshipQuery)initWithPredicate:(id)a3 anchor:(id)a4 options:(int64_t)a5 resultsHandler:(id)a6;
- (id)resultsHandler;
- (int64_t)options;
- (void)client_deliverWorkoutEffortRelationships:(id)a3 isFinalBatch:(BOOL)a4 anchor:(id)a5 forQuery:(id)a6;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
- (void)setAnchor:(id)a3;
- (void)setOptions:(int64_t)a3;
- (void)setResultsHandler:(id)a3;
@end

@implementation HKWorkoutEffortRelationshipQuery

- (HKWorkoutEffortRelationshipQuery)initWithPredicate:(id)a3 anchor:(id)a4 options:(int64_t)a5 resultsHandler:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a3;
  v14 = +[HKObjectType workoutType];
  v19.receiver = self;
  v19.super_class = (Class)HKWorkoutEffortRelationshipQuery;
  v15 = [(HKQuery *)&v19 _initWithObjectType:v14 predicate:v13];

  if (v15)
  {
    objc_storeStrong((id *)&v15->_anchor, a4);
    v15->_options = a5;
    uint64_t v16 = [v12 copy];
    id resultsHandler = v15->_resultsHandler;
    v15->_id resultsHandler = (id)v16;
  }
  return v15;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED21A98;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___HKWorkoutEffortRelationshipQuery;
  objc_msgSendSuper2(&v11, sel_configureClientInterface_, v4);
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  [v4 setClasses:v8 forSelector:sel_client_deliverWorkoutEffortRelationships_isFinalBatch_anchor_forQuery_ argumentIndex:0 ofReply:0];

  id v9 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverWorkoutEffortRelationships_isFinalBatch_anchor_forQuery_, 2, 0);
  id v10 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverWorkoutEffortRelationships_isFinalBatch_anchor_forQuery_, 3, 0);
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutEffortRelationshipQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setAnchor:", self->_anchor, v5.receiver, v5.super_class);
  [v4 setOptions:self->_options];
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutEffortRelationshipQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id resultsHandler = self->_resultsHandler;
  self->_id resultsHandler = 0;
}

- (void)queue_validate
{
  v2.receiver = self;
  v2.super_class = (Class)HKWorkoutEffortRelationshipQuery;
  [(HKQuery *)&v2 queue_validate];
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  objc_super v5 = _Block_copy(self->_resultsHandler);
  if (v5)
  {
    uint64_t v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__HKWorkoutEffortRelationshipQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __55__HKWorkoutEffortRelationshipQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, 0, a1[5]);
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 0;
}

- (void)client_deliverWorkoutEffortRelationships:(id)a3 isFinalBatch:(BOOL)a4 anchor:(id)a5 forQuery:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__HKWorkoutEffortRelationshipQuery_client_deliverWorkoutEffortRelationships_isFinalBatch_anchor_forQuery___block_invoke;
  block[3] = &unk_1E58C0B18;
  block[4] = self;
  id v18 = v10;
  BOOL v21 = a4;
  id v19 = v12;
  id v20 = v11;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __106__HKWorkoutEffortRelationshipQuery_client_deliverWorkoutEffortRelationships_isFinalBatch_anchor_forQuery___block_invoke(uint64_t a1)
{
  objc_super v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 176));
  if (v2)
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 152);
    if (v3)
    {
      [v3 addObjectsFromArray:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v4 = [*(id *)(a1 + 40) mutableCopy];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(v5 + 152);
      *(void *)(v5 + 152) = v4;
    }
    if (*(unsigned char *)(a1 + 64))
    {
      id v7 = *(id *)(*(void *)(a1 + 32) + 152);
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = *(void **)(v8 + 152);
      *(void *)(v8 + 152) = 0;

      id v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 48);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __106__HKWorkoutEffortRelationshipQuery_client_deliverWorkoutEffortRelationships_isFinalBatch_anchor_forQuery___block_invoke_2;
      v13[3] = &unk_1E58C6260;
      id v16 = v2;
      v13[4] = *(void *)(a1 + 32);
      id v14 = v7;
      id v15 = *(id *)(a1 + 56);
      id v12 = v7;
      objc_msgSend(v10, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v11, 0, v13);
    }
  }
}

uint64_t __106__HKWorkoutEffortRelationshipQuery_client_deliverWorkoutEffortRelationships_isFinalBatch_anchor_forQuery___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], 0);
}

- (HKQueryAnchor)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
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
  objc_storeStrong((id *)&self->_anchor, 0);

  objc_storeStrong((id *)&self->_relationshipsPendingDelivery, 0);
}

@end