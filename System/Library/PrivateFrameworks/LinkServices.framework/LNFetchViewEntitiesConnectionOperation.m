@interface LNFetchViewEntitiesConnectionOperation
- (LNFetchViewEntitiesConnectionOperation)initWithConnectionInterface:(id)a3 interactionIDs:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (LNFetchViewEntitiesConnectionOperation)initWithConnectionInterface:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (NSArray)interactionIDs;
- (NSArray)result;
- (id)completionHandler;
- (void)finishWithError:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setInteractionIDs:(id)a3;
- (void)setResult:(id)a3;
- (void)start;
@end

@implementation LNFetchViewEntitiesConnectionOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_interactionIDs, 0);
}

- (void)setResult:(id)a3
{
}

- (NSArray)result
{
  return self->_result;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setInteractionIDs:(id)a3
{
}

- (NSArray)interactionIDs
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(LNFetchViewEntitiesConnectionOperation *)self completionHandler];

  if (v5)
  {
    v6 = [(LNFetchViewEntitiesConnectionOperation *)self result];
    uint64_t v7 = [(LNConnectionOperation *)self validatingResult:v6 error:v4];

    v8 = [(LNFetchViewEntitiesConnectionOperation *)self completionHandler];
    v9 = [(LNFetchViewEntitiesConnectionOperation *)self result];
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v9, v7);

    [(LNFetchViewEntitiesConnectionOperation *)self setCompletionHandler:0];
    id v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNFetchViewEntitiesConnectionOperation;
  [(LNConnectionOperation *)&v10 finishWithError:v4];
}

- (void)start
{
  v8.receiver = self;
  v8.super_class = (Class)LNFetchViewEntitiesConnectionOperation;
  [(LNConnectionOperation *)&v8 start];
  v3 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_INFO, "Fetching app view entities", buf, 2u);
  }

  id v4 = [(LNInterfaceConnectionOperation *)self connectionInterface];
  interactionIDs = self->_interactionIDs;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__LNFetchViewEntitiesConnectionOperation_start__block_invoke;
  v6[3] = &unk_1E5B39D00;
  v6[4] = self;
  [v4 fetchViewEntitiesWithInteractionIDs:interactionIDs completionHandler:v6];
}

void __47__LNFetchViewEntitiesConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  os_activity_scope_enter(v7, &v8);

  [*(id *)(a1 + 32) setResult:v5];
  [*(id *)(a1 + 32) finishWithError:v6];
  os_activity_scope_leave(&v8);
}

- (LNFetchViewEntitiesConnectionOperation)initWithConnectionInterface:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  return [(LNFetchViewEntitiesConnectionOperation *)self initWithConnectionInterface:a3 interactionIDs:0 queue:a4 completionHandler:a5];
}

- (LNFetchViewEntitiesConnectionOperation)initWithConnectionInterface:(id)a3 interactionIDs:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  if (v11)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"LNFetchViewEntitiesConnectionOperation.m", 27, @"Invalid parameter not satisfying: %@", @"connectionInterface" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"LNFetchViewEntitiesConnectionOperation.m", 28, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  v16 = [MEMORY[0x1E4F29128] UUID];
  v24.receiver = self;
  v24.super_class = (Class)LNFetchViewEntitiesConnectionOperation;
  v17 = [(LNInterfaceConnectionOperation *)&v24 initWithIdentifier:v16 connectionInterface:v11 priority:2 queue:v13 activity:&__block_literal_global_6025];

  if (v17)
  {
    objc_storeStrong((id *)&v17->_interactionIDs, a4);
    v18 = _Block_copy(v15);
    id completionHandler = v17->_completionHandler;
    v17->_id completionHandler = v18;

    v20 = v17;
  }

  return v17;
}

os_activity_t __109__LNFetchViewEntitiesConnectionOperation_initWithConnectionInterface_interactionIDs_queue_completionHandler___block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1A4419000, "appintents:fetch view entities", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v0;
}

@end