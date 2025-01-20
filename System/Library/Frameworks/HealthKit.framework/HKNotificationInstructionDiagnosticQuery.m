@interface HKNotificationInstructionDiagnosticQuery
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (HKNotificationInstructionDiagnosticQuery)initWithResultsHandler:(id)a3;
- (void)_queue_deliverResultsForQueryUUID:(uint64_t)a1;
- (void)client_deliverNotificationInstructions:(id)a3 clearPending:(BOOL)a4 isFinalBatch:(BOOL)a5 queryUUID:(id)a6;
- (void)queue_deliverError:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
@end

@implementation HKNotificationInstructionDiagnosticQuery

- (HKNotificationInstructionDiagnosticQuery)initWithResultsHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKNotificationInstructionDiagnosticQuery;
  v5 = [(HKQuery *)&v9 _initWithObjectType:0 predicate:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id queue_resultsHandler = v5->_queue_resultsHandler;
    v5->_id queue_resultsHandler = (id)v6;
  }
  return v5;
}

- (void)client_deliverNotificationInstructions:(id)a3 clearPending:(BOOL)a4 isFinalBatch:(BOOL)a5 queryUUID:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = [(HKQuery *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __119__HKNotificationInstructionDiagnosticQuery_client_deliverNotificationInstructions_clearPending_isFinalBatch_queryUUID___block_invoke;
  v15[3] = &unk_1E58BF240;
  BOOL v18 = a4;
  v15[4] = self;
  id v16 = v10;
  BOOL v19 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, v15);
}

void __119__HKNotificationInstructionDiagnosticQuery_client_deliverNotificationInstructions_clearPending_isFinalBatch_queryUUID___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 160);
  if (v2 && !*(unsigned char *)(a1 + 56))
  {
    [v2 addObjectsFromArray:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 40) mutableCopy];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 160);
    *(void *)(v4 + 160) = v3;
  }
  if (*(unsigned char *)(a1 + 57))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(a1 + 48);
    -[HKNotificationInstructionDiagnosticQuery _queue_deliverResultsForQueryUUID:](v6, v7);
  }
}

- (void)_queue_deliverResultsForQueryUUID:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [(id)a1 queue];
    dispatch_assert_queue_V2(v4);

    v5 = (void *)[*(id *)(a1 + 160) copy];
    uint64_t v6 = *(void **)(a1 + 160);
    *(void *)(a1 + 160) = 0;

    v7 = _Block_copy(*(const void **)(a1 + 152));
    v8 = v7;
    if (v7)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __78__HKNotificationInstructionDiagnosticQuery__queue_deliverResultsForQueryUUID___block_invoke;
      v9[3] = &unk_1E58BB9A0;
      id v11 = v7;
      v9[4] = a1;
      id v10 = v5;
      objc_msgSend((id)a1, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v3, 1, v9);
    }
  }
}

uint64_t __78__HKNotificationInstructionDiagnosticQuery__queue_deliverResultsForQueryUUID___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  v5 = (void *)[self->_queue_resultsHandler copy];
  if (v5)
  {
    uint64_t v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__HKNotificationInstructionDiagnosticQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __63__HKNotificationInstructionDiagnosticQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKNotificationInstructionDiagnosticQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id queue_resultsHandler = self->_queue_resultsHandler;
  self->_id queue_resultsHandler = 0;
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED15CA8;
}

+ (void)configureClientInterface:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKNotificationInstructionDiagnosticQuery;
  id v3 = a3;
  objc_msgSendSuper2(&v5, sel_configureClientInterface_, v3);
  id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class(), v5.receiver, v5.super_class);
  [v3 setClasses:v4 forSelector:sel_client_deliverNotificationInstructions_clearPending_isFinalBatch_queryUUID_ argumentIndex:0 ofReply:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_resultsPendingDelivery, 0);

  objc_storeStrong(&self->_queue_resultsHandler, 0);
}

@end