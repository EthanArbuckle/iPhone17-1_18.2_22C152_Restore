@interface HKActivitySummaryQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (BOOL)orderByDateAscending;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (BOOL)shouldIncludeActivitySummaryPrivateProperties;
- (BOOL)shouldIncludeActivitySummaryStatistics;
- (HKActivitySummaryQuery)initWithPredicate:(NSPredicate *)predicate resultsHandler:(void *)handler;
- (id)completionHandler;
- (unint64_t)limit;
- (void)client_deliverActivitySummaries:(id)a3 isFinalBatch:(BOOL)a4 clearPendingBatches:(BOOL)a5 queryUUID:(id)a6;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
- (void)setLimit:(unint64_t)a3;
- (void)setOrderByDateAscending:(BOOL)a3;
- (void)setShouldIncludeActivitySummaryPrivateProperties:(BOOL)a3;
- (void)setShouldIncludeActivitySummaryStatistics:(BOOL)a3;
- (void)setShouldIncludePrivateActivitySummaryProperties:(BOOL)a3;
- (void)setUpdateHandler:(void *)updateHandler;
- (void)updateHandler;
@end

@implementation HKActivitySummaryQuery

- (HKActivitySummaryQuery)initWithPredicate:(NSPredicate *)predicate resultsHandler:(void *)handler
{
  v6 = handler;
  v7 = predicate;
  v8 = +[HKObjectType activitySummaryType];
  v14.receiver = self;
  v14.super_class = (Class)HKActivitySummaryQuery;
  v9 = [(HKQuery *)&v14 _initWithObjectType:v8 predicate:v7];

  if (v9)
  {
    uint64_t v10 = [v6 copy];
    id completionHandler = v9->_completionHandler;
    v9->_id completionHandler = (id)v10;

    v9->_initialHandlerCalled = 0;
    v12 = +[_HKEntitlements entitlementsForCurrentTaskWithError:0];
    v9->_shouldIncludeActivitySummaryPrivateProperties = [v12 hasEntitlement:@"com.apple.private.healthkit"];

    v9->_shouldIncludeActivitySummaryStatistics = 0;
    v9->_orderByDateAscending = 1;
    v9->_limit = 0;
  }

  return v9;
}

- (void)setUpdateHandler:(void *)updateHandler
{
  v5 = updateHandler;
  [(HKQuery *)self _throwInvalidArgumentExceptionIfHasBeenExecuted:a2];
  v6 = [(HKQuery *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__HKActivitySummaryQuery_setUpdateHandler___block_invoke;
  v8[3] = &unk_1E58BB978;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(v6, v8);
}

uint64_t __43__HKActivitySummaryQuery_setUpdateHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 184) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)setShouldIncludePrivateActivitySummaryProperties:(BOOL)a3
{
  self->_shouldIncludeActivitySummaryPrivateProperties = a3;
}

- (void)setShouldIncludeActivitySummaryStatistics:(BOOL)a3
{
  self->_shouldIncludeActivitySummaryStatistics = a3;
}

- (void)setOrderByDateAscending:(BOOL)a3
{
  self->_orderByDateAscending = a3;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (id)completionHandler
{
  v2 = _Block_copy(self->_completionHandler);

  return v2;
}

- (void)client_deliverActivitySummaries:(id)a3 isFinalBatch:(BOOL)a4 clearPendingBatches:(BOOL)a5 queryUUID:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = [(HKQuery *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __101__HKActivitySummaryQuery_client_deliverActivitySummaries_isFinalBatch_clearPendingBatches_queryUUID___block_invoke;
  v15[3] = &unk_1E58BF240;
  BOOL v18 = a5;
  v15[4] = self;
  id v16 = v10;
  BOOL v19 = a4;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, v15);
}

void __101__HKActivitySummaryQuery_client_deliverActivitySummaries_isFinalBatch_clearPendingBatches_queryUUID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(v2 + 152);
  v4 = _Block_copy(*(const void **)(v2 + 184));
  v5 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 160));
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "queue_shouldDeactivateAfterInitialResults");
  id v7 = *(void **)(*(void *)(a1 + 32) + 168);
  if (v7 && !*(unsigned char *)(a1 + 56))
  {
    [v7 addObjectsFromArray:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 40) mutableCopy];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 168);
    *(void *)(v9 + 168) = v8;
  }
  if (*(unsigned char *)(a1 + 57))
  {
    id v11 = *(id *)(*(void *)(a1 + 32) + 168);
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 168);
    *(void *)(v12 + 168) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 152) = 1;
    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 48);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __101__HKActivitySummaryQuery_client_deliverActivitySummaries_isFinalBatch_clearPendingBatches_queryUUID___block_invoke_2;
    v17[3] = &unk_1E58C2CE0;
    char v21 = v3;
    id v18 = v11;
    id v19 = v4;
    v17[4] = *(void *)(a1 + 32);
    id v20 = v5;
    id v16 = v11;
    objc_msgSend(v14, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v15, v6, v17);
  }
}

uint64_t __101__HKActivitySummaryQuery_client_deliverActivitySummaries_isFinalBatch_clearPendingBatches_queryUUID___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 64))
  {
    uint64_t v1 = *(void *)(result + 48);
    if (!v1) {
      return result;
    }
    return (*(uint64_t (**)(uint64_t, void, void, void))(v1 + 16))(v1, *(void *)(result + 32), *(void *)(result + 40), 0);
  }
  uint64_t v1 = *(void *)(result + 56);
  if (v1) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(v1 + 16))(v1, *(void *)(result + 32), *(void *)(result + 40), 0);
  }
  return result;
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED093C8;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKActivitySummaryQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverActivitySummaries_isFinalBatch_clearPendingBatches_queryUUID_, 0, 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKActivitySummaryQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setShouldIncludeActivitySummaryPrivateProperties:", -[HKActivitySummaryQuery shouldIncludeActivitySummaryPrivateProperties](self, "shouldIncludeActivitySummaryPrivateProperties", v5.receiver, v5.super_class));
  objc_msgSend(v4, "setShouldIncludeActivitySummaryStatistics:", -[HKActivitySummaryQuery shouldIncludeActivitySummaryStatistics](self, "shouldIncludeActivitySummaryStatistics"));
  objc_msgSend(v4, "setOrderByDateAscending:", -[HKActivitySummaryQuery orderByDateAscending](self, "orderByDateAscending"));
  objc_msgSend(v4, "setLimit:", -[HKActivitySummaryQuery limit](self, "limit"));
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKActivitySummaryQuery;
  [(HKQuery *)&v6 queue_queryDidDeactivate:a3];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  id updateHandler = self->_updateHandler;
  self->_id updateHandler = 0;
}

- (void)queue_validate
{
  v3.receiver = self;
  v3.super_class = (Class)HKActivitySummaryQuery;
  [(HKQuery *)&v3 queue_validate];
  if (!self->_completionHandler) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ completionHandler cannot be nil", objc_opt_class() format];
  }
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  objc_super v5 = _Block_copy(self->_updateHandler);
  objc_super v6 = _Block_copy(self->_completionHandler);
  if (HKProgramSDKAtLeast())
  {
    BOOL initialHandlerCalled = self->_initialHandlerCalled;
    self->_BOOL initialHandlerCalled = 1;
    uint64_t v8 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__HKActivitySummaryQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58C2CE0;
    BOOL v19 = initialHandlerCalled;
    uint64_t v9 = &v17;
    id v17 = v5;
    block[4] = self;
    id v10 = &v16;
    id v16 = v4;
    id v18 = v6;
    dispatch_async(v8, block);

    id v11 = v18;
LABEL_5:

    goto LABEL_6;
  }
  if (v6)
  {
    id v11 = [(HKQuery *)self clientQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__HKActivitySummaryQuery_queue_deliverError___block_invoke_2;
    v12[3] = &unk_1E58BB9A0;
    uint64_t v9 = &v14;
    id v14 = v6;
    v12[4] = self;
    id v10 = &v13;
    id v13 = v4;
    dispatch_async(v11, v12);
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __45__HKActivitySummaryQuery_queue_deliverError___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 64))
  {
    uint64_t v1 = *(void *)(result + 48);
    if (!v1) {
      return result;
    }
    return (*(uint64_t (**)(uint64_t, void, void, void))(v1 + 16))(v1, *(void *)(result + 32), 0, *(void *)(result + 40));
  }
  uint64_t v1 = *(void *)(result + 56);
  if (v1) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(v1 + 16))(v1, *(void *)(result + 32), 0, *(void *)(result + 40));
  }
  return result;
}

uint64_t __45__HKActivitySummaryQuery_queue_deliverError___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return self->_updateHandler == 0;
}

- (void)updateHandler
{
  return self->_updateHandler;
}

- (BOOL)shouldIncludeActivitySummaryPrivateProperties
{
  return self->_shouldIncludeActivitySummaryPrivateProperties;
}

- (void)setShouldIncludeActivitySummaryPrivateProperties:(BOOL)a3
{
  self->_shouldIncludeActivitySummaryPrivateProperties = a3;
}

- (BOOL)shouldIncludeActivitySummaryStatistics
{
  return self->_shouldIncludeActivitySummaryStatistics;
}

- (BOOL)orderByDateAscending
{
  return self->_orderByDateAscending;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_pendingActivitySummaries, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end