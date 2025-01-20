@interface _HKDateRangeQuery
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (_HKDateRangeQuery)initWithDateIntervalHandler:(id)a3;
- (id)handler;
- (void)client_deliverDateIntervals:(id)a3 forQuery:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
@end

@implementation _HKDateRangeQuery

- (_HKDateRangeQuery)initWithDateIntervalHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKDateRangeQuery;
  v5 = [(HKQuery *)&v9 _initWithObjectType:0 predicate:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id handler = v5->_handler;
    v5->_id handler = (id)v6;

    [(HKQuery *)v5 setShouldSuppressDataCollection:1];
  }

  return v5;
}

- (void)client_deliverDateIntervals:(id)a3 forQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58___HKDateRangeQuery_client_deliverDateIntervals_forQuery___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKDateRangeQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id handler = self->_handler;
  self->_id handler = 0;
}

- (void)queue_validate
{
  v3.receiver = self;
  v3.super_class = (Class)_HKDateRangeQuery;
  [(HKQuery *)&v3 queue_validate];
  if (!self->_handler) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ handler must not be nil", objc_opt_class() format];
  }
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 0;
}

- (void)queue_deliverError:(id)a3
{
  id handler = (void (**)(id, _HKDateRangeQuery *, void, id))self->_handler;
  if (handler) {
    handler[2](handler, self, 0, a3);
  }
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EECFD138;
}

+ (void)configureClientInterface:(id)a3
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS____HKDateRangeQuery;
  id v3 = a3;
  objc_msgSendSuper2(&v8, sel_configureClientInterface_, v3);
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  [v3 setClasses:v7 forSelector:sel_client_deliverDateIntervals_forQuery_ argumentIndex:0 ofReply:0];
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
}

@end