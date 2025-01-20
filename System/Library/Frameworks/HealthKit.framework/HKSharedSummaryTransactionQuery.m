@interface HKSharedSummaryTransactionQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (HKSharedSummaryTransactionQuery)initWithCommittedTransactions:(BOOL)a3 handler:(id)a4;
- (HKSharedSummaryTransactionQuery)initWithHandler:(id)a3;
- (id)updateHandler;
- (void)client_deliverTransactions:(id)a3 query:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)setUpdateHandler:(id)a3;
@end

@implementation HKSharedSummaryTransactionQuery

- (HKSharedSummaryTransactionQuery)initWithCommittedTransactions:(BOOL)a3 handler:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HKSharedSummaryTransactionQuery;
  v7 = [(HKQuery *)&v11 _initWithObjectType:0 predicate:0];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    id initialHandler = v7->_initialHandler;
    v7->_id initialHandler = (id)v8;

    v7->_committedTransactions = a3;
  }

  return v7;
}

- (HKSharedSummaryTransactionQuery)initWithHandler:(id)a3
{
  return [(HKSharedSummaryTransactionQuery *)self initWithCommittedTransactions:1 handler:a3];
}

- (void)setUpdateHandler:(id)a3
{
  id v5 = a3;
  if (!self->_committedTransactions) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ does not support updates for non-committed transactions", objc_opt_class() format];
  }
  [(HKQuery *)self _throwInvalidArgumentExceptionIfHasBeenExecuted:a2];
  id v6 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HKSharedSummaryTransactionQuery_setUpdateHandler___block_invoke;
  block[3] = &unk_1E58BB978;
  block[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(v6, block);
}

uint64_t __52__HKSharedSummaryTransactionQuery_setUpdateHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 168) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EECE97B0;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKSharedSummaryTransactionQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverTransactions_query_, 0, 0);
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return self->_updateHandler == 0;
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKSharedSummaryTransactionQuery;
  [(HKQuery *)&v6 queue_queryDidDeactivate:a3];
  id initialHandler = self->_initialHandler;
  self->_id initialHandler = 0;

  id updateHandler = self->_updateHandler;
  self->_id updateHandler = 0;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKSharedSummaryTransactionQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setCommittedTransactions:", self->_committedTransactions, v5.receiver, v5.super_class);
}

- (void)client_deliverTransactions:(id)a3 query:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__HKSharedSummaryTransactionQuery_client_deliverTransactions_query___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);
}

void __68__HKSharedSummaryTransactionQuery_client_deliverTransactions_query___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "queue_shouldDeactivateAfterInitialResults");
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 160)) {
    id v4 = &OBJC_IVAR___HKSharedSummaryTransactionQuery__updateHandler;
  }
  else {
    id v4 = &OBJC_IVAR___HKSharedSummaryTransactionQuery__initialHandler;
  }
  objc_super v5 = _Block_copy(*(const void **)(v3 + *v4));
  id v6 = v5;
  if (v5)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 160) = 1;
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__HKSharedSummaryTransactionQuery_client_deliverTransactions_query___block_invoke_2;
    v11[3] = &unk_1E58BB9A0;
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    id v13 = v9;
    v11[4] = v10;
    id v12 = *(id *)(a1 + 48);
    objc_msgSend(v7, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v8, v2, v11);
  }
}

uint64_t __68__HKSharedSummaryTransactionQuery_client_deliverTransactions_query___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  if (self->_initialHandlerCalled) {
    objc_super v5 = &OBJC_IVAR___HKSharedSummaryTransactionQuery__updateHandler;
  }
  else {
    objc_super v5 = &OBJC_IVAR___HKSharedSummaryTransactionQuery__initialHandler;
  }
  id v6 = _Block_copy(*(const void **)((char *)&self->super.super.isa + *v5));
  if (v6)
  {
    id v7 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__HKSharedSummaryTransactionQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v10 = v6;
    block[4] = self;
    id v9 = v4;
    dispatch_async(v7, block);
  }
}

uint64_t __54__HKSharedSummaryTransactionQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);

  objc_storeStrong(&self->_initialHandler, 0);
}

@end