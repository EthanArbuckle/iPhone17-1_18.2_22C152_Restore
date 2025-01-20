@interface LNFetchOptionsDefaultValueConnectionOperation
- (LNAction)action;
- (LNAction)result;
- (LNFetchOptionsDefaultValueConnectionOperation)initWithConnectionInterface:(id)a3 action:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (id)completionHandler;
- (void)finishWithError:(id)a3;
- (void)setAction:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setResult:(id)a3;
- (void)start;
@end

@implementation LNFetchOptionsDefaultValueConnectionOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setResult:(id)a3
{
}

- (LNAction)result
{
  return self->_result;
}

- (void)setAction:(id)a3
{
}

- (LNAction)action
{
  return self->_action;
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(LNFetchOptionsDefaultValueConnectionOperation *)self completionHandler];

  if (v5)
  {
    v6 = [(LNFetchOptionsDefaultValueConnectionOperation *)self result];
    uint64_t v7 = [(LNConnectionOperation *)self validatingResult:v6 error:v4];

    v8 = [(LNFetchOptionsDefaultValueConnectionOperation *)self completionHandler];
    v9 = [(LNFetchOptionsDefaultValueConnectionOperation *)self result];
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v9, v7);

    [(LNFetchOptionsDefaultValueConnectionOperation *)self setCompletionHandler:0];
    id v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNFetchOptionsDefaultValueConnectionOperation;
  [(LNConnectionOperation *)&v10 finishWithError:v4];
}

- (void)start
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)LNFetchOptionsDefaultValueConnectionOperation;
  [(LNConnectionOperation *)&v9 start];
  v3 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(LNFetchOptionsDefaultValueConnectionOperation *)self action];
    v5 = [v4 identifier];
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_INFO, "Fetching options default values for action %@", buf, 0xCu);
  }
  v6 = [(LNInterfaceConnectionOperation *)self connectionInterface];
  uint64_t v7 = [(LNFetchOptionsDefaultValueConnectionOperation *)self action];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__LNFetchOptionsDefaultValueConnectionOperation_start__block_invoke;
  v8[3] = &unk_1E5B39620;
  v8[4] = self;
  [v6 fetchOptionsDefaultValuesForAction:v7 completionHandler:v8];
}

void __54__LNFetchOptionsDefaultValueConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  os_activity_scope_enter(v7, &v8);

  [*(id *)(a1 + 32) setResult:v5];
  [*(id *)(a1 + 32) finishWithError:v6];
  os_activity_scope_leave(&v8);
}

- (LNFetchOptionsDefaultValueConnectionOperation)initWithConnectionInterface:(id)a3 action:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  if (v12)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"LNFetchOptionsDefaultValueConnectionOperation.m", 28, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"LNFetchOptionsDefaultValueConnectionOperation.m", 29, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  v16 = [MEMORY[0x1E4F29128] UUID];
  v26.receiver = self;
  v26.super_class = (Class)LNFetchOptionsDefaultValueConnectionOperation;
  v17 = [(LNInterfaceConnectionOperation *)&v26 initWithIdentifier:v16 connectionInterface:v11 priority:1 queue:v13 activity:&__block_literal_global_9208];

  if (v17)
  {
    uint64_t v18 = [v12 copy];
    action = v17->_action;
    v17->_action = (LNAction *)v18;

    uint64_t v20 = [v15 copy];
    id completionHandler = v17->_completionHandler;
    v17->_id completionHandler = (id)v20;

    v22 = v17;
  }

  return v17;
}

os_activity_t __108__LNFetchOptionsDefaultValueConnectionOperation_initWithConnectionInterface_action_queue_completionHandler___block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1A4419000, "appintents:fetch options default", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v0;
}

@end