@interface LNFetchStructuredDataConnectionOperation
- (LNFetchStructuredDataConnectionOperation)initWithConnectionInterface:(id)a3 typeIdentifier:(int64_t)a4 entityIdentifiers:(id)a5 queue:(id)a6 completionHandler:(id)a7;
- (NSArray)entityIdentifiers;
- (NSDictionary)entityIdentifiersToStructuredData;
- (id)completionHandler;
- (int64_t)typeIdentifier;
- (void)finishWithError:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setEntityIdentifiersToStructuredData:(id)a3;
- (void)start;
@end

@implementation LNFetchStructuredDataConnectionOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_entityIdentifiersToStructuredData, 0);
  objc_storeStrong((id *)&self->_entityIdentifiers, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setEntityIdentifiersToStructuredData:(id)a3
{
}

- (NSDictionary)entityIdentifiersToStructuredData
{
  return self->_entityIdentifiersToStructuredData;
}

- (NSArray)entityIdentifiers
{
  return self->_entityIdentifiers;
}

- (int64_t)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(LNFetchStructuredDataConnectionOperation *)self completionHandler];

  if (v5)
  {
    v6 = [(LNFetchStructuredDataConnectionOperation *)self entityIdentifiersToStructuredData];
    uint64_t v7 = [(LNConnectionOperation *)self validatingResult:v6 error:v4];

    v8 = [(LNFetchStructuredDataConnectionOperation *)self completionHandler];
    v9 = [(LNFetchStructuredDataConnectionOperation *)self entityIdentifiersToStructuredData];
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v9, v7);

    [(LNFetchStructuredDataConnectionOperation *)self setCompletionHandler:0];
    id v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNFetchStructuredDataConnectionOperation;
  [(LNConnectionOperation *)&v10 finishWithError:v4];
}

- (void)start
{
  v9.receiver = self;
  v9.super_class = (Class)LNFetchStructuredDataConnectionOperation;
  [(LNConnectionOperation *)&v9 start];
  v3 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_INFO, "Fetching structured data from entities", buf, 2u);
  }

  id v4 = [(LNInterfaceConnectionOperation *)self connectionInterface];
  int64_t v5 = [(LNFetchStructuredDataConnectionOperation *)self typeIdentifier];
  v6 = [(LNFetchStructuredDataConnectionOperation *)self entityIdentifiers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__LNFetchStructuredDataConnectionOperation_start__block_invoke;
  v7[3] = &unk_1E5B394A0;
  v7[4] = self;
  [v4 fetchStructuredDataWithTypeIdentifier:v5 forEntityIdentifiers:v6 completionHandler:v7];
}

void __49__LNFetchStructuredDataConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  os_activity_scope_enter(v7, &v8);

  [*(id *)(a1 + 32) setEntityIdentifiersToStructuredData:v5];
  [*(id *)(a1 + 32) finishWithError:v6];
  os_activity_scope_leave(&v8);
}

- (LNFetchStructuredDataConnectionOperation)initWithConnectionInterface:(id)a3 typeIdentifier:(int64_t)a4 entityIdentifiers:(id)a5 queue:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_8:
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"LNFetchStructuredDataConnectionOperation.m", 29, @"Invalid parameter not satisfying: %@", @"entityIdentifiers" object file lineNumber description];

    if (v16) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"LNFetchStructuredDataConnectionOperation.m", 28, @"Invalid parameter not satisfying: %@", @"connectionInterface" object file lineNumber description];

  if (!v14) {
    goto LABEL_8;
  }
LABEL_3:
  if (v16) {
    goto LABEL_4;
  }
LABEL_9:
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"LNFetchStructuredDataConnectionOperation.m", 30, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_4:
  v17 = [MEMORY[0x1E4F29128] UUID];
  v26.receiver = self;
  v26.super_class = (Class)LNFetchStructuredDataConnectionOperation;
  v18 = [(LNInterfaceConnectionOperation *)&v26 initWithIdentifier:v17 connectionInterface:v13 priority:2 queue:v15 activity:&__block_literal_global_4654];

  if (v18)
  {
    v18->_typeIdentifier = a4;
    objc_storeStrong((id *)&v18->_entityIdentifiers, a5);
    uint64_t v19 = [v16 copy];
    id completionHandler = v18->_completionHandler;
    v18->_id completionHandler = (id)v19;

    v21 = v18;
  }

  return v18;
}

os_activity_t __129__LNFetchStructuredDataConnectionOperation_initWithConnectionInterface_typeIdentifier_entityIdentifiers_queue_completionHandler___block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1A4419000, "appintents:fetch structured data", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v0;
}

@end