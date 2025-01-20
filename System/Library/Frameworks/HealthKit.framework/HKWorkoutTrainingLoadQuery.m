@interface HKWorkoutTrainingLoadQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (HKWorkoutTrainingLoadQuery)initWithPredicate:(id)a3 options:(int64_t)a4 completionHandler:(id)a5;
- (id)completionHandler;
- (int64_t)options;
- (void)client_deliverTrainingLoadResults:(id)a3 forQuery:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
@end

@implementation HKWorkoutTrainingLoadQuery

- (HKWorkoutTrainingLoadQuery)initWithPredicate:(id)a3 options:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HKWorkoutTrainingLoadQuery;
  v9 = [(HKQuery *)&v14 _initWithObjectType:0 predicate:a3];
  v10 = v9;
  if (v9)
  {
    v9->_options = a4;
    uint64_t v11 = [v8 copy];
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = (id)v11;
  }
  return v10;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EECF80C0;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKWorkoutTrainingLoadQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverTrainingLoadResults_forQuery_, 0, 0);
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutTrainingLoadQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setOptions:", self->_options, v5.receiver, v5.super_class);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutTrainingLoadQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;
}

- (void)queue_validate
{
  v2.receiver = self;
  v2.super_class = (Class)HKWorkoutTrainingLoadQuery;
  [(HKQuery *)&v2 queue_validate];
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  objc_super v5 = _Block_copy(self->_completionHandler);
  if (v5)
  {
    objc_super v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__HKWorkoutTrainingLoadQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __49__HKWorkoutTrainingLoadQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)client_deliverTrainingLoadResults:(id)a3 forQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__HKWorkoutTrainingLoadQuery_client_deliverTrainingLoadResults_forQuery___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __73__HKWorkoutTrainingLoadQuery_client_deliverTrainingLoadResults_forQuery___block_invoke(uint64_t a1)
{
  objc_super v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 160));
  v3 = v2;
  if (v2)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__HKWorkoutTrainingLoadQuery_client_deliverTrainingLoadResults_forQuery___block_invoke_2;
    v8[3] = &unk_1E58BB9A0;
    id v6 = v2;
    uint64_t v7 = *(void *)(a1 + 32);
    id v10 = v6;
    v8[4] = v7;
    id v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 1, v8);
  }
}

uint64_t __73__HKWorkoutTrainingLoadQuery_client_deliverTrainingLoadResults_forQuery___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (int64_t)options
{
  return self->_options;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
}

@end