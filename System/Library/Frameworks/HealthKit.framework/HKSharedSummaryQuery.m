@interface HKSharedSummaryQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (HKSharedSummaryQuery)initWithTransaction:(id)a3 package:(id)a4 includedIdentifiers:(id)a5 includedObjectTypes:(id)a6 resultsHandler:(id)a7;
- (HKSharedSummaryQuery)initWithTransaction:(id)a3 package:(id)a4 resultsHandler:(id)a5;
- (void)client_deliverSummaries:(id)a3 query:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
@end

@implementation HKSharedSummaryQuery

- (HKSharedSummaryQuery)initWithTransaction:(id)a3 package:(id)a4 includedIdentifiers:(id)a5 includedObjectTypes:(id)a6 resultsHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKSharedSummaryQuery;
  v17 = [(HKQuery *)&v29 _initWithObjectType:0 predicate:0];
  if (v17)
  {
    uint64_t v18 = [v16 copy];
    id resultsHandler = v17->_resultsHandler;
    v17->_id resultsHandler = (id)v18;

    uint64_t v20 = [v12 copy];
    transaction = v17->_transaction;
    v17->_transaction = (HKSharedSummaryTransaction *)v20;

    uint64_t v22 = [v13 copy];
    package = v17->_package;
    v17->_package = (NSString *)v22;

    uint64_t v24 = [v14 copy];
    includedIdentifiers = v17->_includedIdentifiers;
    v17->_includedIdentifiers = (NSSet *)v24;

    uint64_t v26 = [v15 copy];
    includedObjectTypes = v17->_includedObjectTypes;
    v17->_includedObjectTypes = (NSSet *)v26;
  }
  return v17;
}

- (HKSharedSummaryQuery)initWithTransaction:(id)a3 package:(id)a4 resultsHandler:(id)a5
{
  return [(HKSharedSummaryQuery *)self initWithTransaction:a3 package:a4 includedIdentifiers:0 includedObjectTypes:0 resultsHandler:a5];
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED1A940;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKSharedSummaryQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverSummaries_query_, 0, 0);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKSharedSummaryQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id resultsHandler = self->_resultsHandler;
  self->_id resultsHandler = 0;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKSharedSummaryQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setTransaction:", self->_transaction, v5.receiver, v5.super_class);
  [v4 setPackage:self->_package];
  [v4 setIncludedIdentifiers:self->_includedIdentifiers];
  [v4 setIncludedObjectTypes:self->_includedObjectTypes];
}

- (void)client_deliverSummaries:(id)a3 query:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HKSharedSummaryQuery_client_deliverSummaries_query___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);
}

void __54__HKSharedSummaryQuery_client_deliverSummaries_query___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "queue_shouldDeactivateAfterInitialResults");
  v3 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 152));
  id v4 = v3;
  if (v3)
  {
    objc_super v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__HKSharedSummaryQuery_client_deliverSummaries_query___block_invoke_2;
    v9[3] = &unk_1E58BB9A0;
    id v7 = v3;
    uint64_t v8 = *(void *)(a1 + 32);
    id v11 = v7;
    v9[4] = v8;
    id v10 = *(id *)(a1 + 48);
    objc_msgSend(v5, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v6, v2, v9);
  }
}

uint64_t __54__HKSharedSummaryQuery_client_deliverSummaries_query___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, uint64_t, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 1, 0);
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
    block[2] = __43__HKSharedSummaryQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __43__HKSharedSummaryQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, uint64_t, void))(a1[6] + 16))(a1[6], a1[4], 0, 1, a1[5]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includedObjectTypes, 0);
  objc_storeStrong((id *)&self->_includedIdentifiers, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong(&self->_resultsHandler, 0);
}

@end