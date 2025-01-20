@interface _HKSampleTypeQuery
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (_HKSampleTypeQuery)initWithPredicate:(id)a3 resultsHandler:(id)a4;
- (void)client_deliverSampleTypes:(id)a3 query:(id)a4;
- (void)queue_deliverError:(id)a3;
@end

@implementation _HKSampleTypeQuery

- (_HKSampleTypeQuery)initWithPredicate:(id)a3 resultsHandler:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_HKSampleTypeQuery;
  v7 = [(HKQuery *)&v11 _initWithObjectType:0 predicate:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    id resultsHandler = v7->_resultsHandler;
    v7->_id resultsHandler = (id)v8;
  }
  return v7;
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED04328;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS____HKSampleTypeQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverSampleTypes_query_, 0, 0);
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  id v5 = _Block_copy(self->_resultsHandler);
  if (v5)
  {
    objc_super v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41___HKSampleTypeQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

- (void)client_deliverSampleTypes:(id)a3 query:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54___HKSampleTypeQuery_client_deliverSampleTypes_query___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void).cxx_destruct
{
}

@end