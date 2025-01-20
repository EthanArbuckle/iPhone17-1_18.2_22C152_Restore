@interface _HKObjectTypeAnchorQuery
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (_HKObjectTypeAnchorQuery)initWithUpdateHandler:(id)a3;
- (void)client_deliverAnchor:(id)a3 query:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
@end

@implementation _HKObjectTypeAnchorQuery

- (_HKObjectTypeAnchorQuery)initWithUpdateHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKObjectTypeAnchorQuery;
  v5 = [(HKQuery *)&v9 _initWithObjectType:0 predicate:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id updateHandler = v5->_updateHandler;
    v5->_id updateHandler = (id)v6;

    [(HKQuery *)v5 setShouldSuppressDataCollection:1];
  }

  return v5;
}

- (void)client_deliverAnchor:(id)a3 query:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___HKObjectTypeAnchorQuery_client_deliverAnchor_query___block_invoke;
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
  v5.super_class = (Class)_HKObjectTypeAnchorQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id updateHandler = self->_updateHandler;
  self->_id updateHandler = &__block_literal_global_57;
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 0;
}

- (void)queue_deliverError:(id)a3
{
  id updateHandler = self->_updateHandler;
  id v5 = a3;
  id v6 = (void (**)(id, _HKObjectTypeAnchorQuery *, void, id))_Block_copy(updateHandler);
  v6[2](v6, self, 0, v5);
}

- (void)queue_populateConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_HKObjectTypeAnchorQuery;
  id v3 = a3;
  [(HKQuery *)&v4 queue_populateConfiguration:v3];
  objc_msgSend(v3, "setShouldDeactivateAfterInitialResults:", 0, v4.receiver, v4.super_class);
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED0BA18;
}

+ (void)configureClientInterface:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS____HKObjectTypeAnchorQuery;
  id v3 = a3;
  objc_msgSendSuper2(&v5, sel_configureClientInterface_, v3);
  objc_super v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", objc_opt_class(), v5.receiver, v5.super_class);
  [v3 setClasses:v4 forSelector:sel_client_deliverAnchor_query_ argumentIndex:0 ofReply:0];
}

- (void).cxx_destruct
{
}

@end