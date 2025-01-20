@interface LNFetchActionAppContextConnectionOperation
- (LNAction)action;
- (LNFetchActionAppContextConnectionOperation)initWithConnectionInterface:(id)a3 action:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (LNFocusConfigurationAppContext)result;
- (id)completionHandler;
- (void)finishWithError:(id)a3;
- (void)setAction:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setResult:(id)a3;
- (void)start;
@end

@implementation LNFetchActionAppContextConnectionOperation

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

- (LNFocusConfigurationAppContext)result
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
  v5 = [(LNFetchActionAppContextConnectionOperation *)self completionHandler];

  if (v5)
  {
    v6 = [(LNFetchActionAppContextConnectionOperation *)self result];
    uint64_t v7 = [(LNConnectionOperation *)self validatingResult:v6 error:v4];

    v8 = [(LNFetchActionAppContextConnectionOperation *)self completionHandler];
    v9 = [(LNFetchActionAppContextConnectionOperation *)self result];
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v9, v7);

    [(LNFetchActionAppContextConnectionOperation *)self setCompletionHandler:0];
    id v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNFetchActionAppContextConnectionOperation;
  [(LNConnectionOperation *)&v10 finishWithError:v4];
}

- (void)start
{
  v8.receiver = self;
  v8.super_class = (Class)LNFetchActionAppContextConnectionOperation;
  [(LNConnectionOperation *)&v8 start];
  v3 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_INFO, "Fetching app context", buf, 2u);
  }

  id v4 = [(LNInterfaceConnectionOperation *)self connectionInterface];
  v5 = [(LNFetchActionAppContextConnectionOperation *)self action];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__LNFetchActionAppContextConnectionOperation_start__block_invoke;
  v6[3] = &unk_1E5B38808;
  v6[4] = self;
  [v4 fetchActionAppContextFromAction:v5 completionHandler:v6];
}

void __51__LNFetchActionAppContextConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  os_activity_scope_enter(v7, &v8);

  [*(id *)(a1 + 32) setResult:v5];
  [*(id *)(a1 + 32) finishWithError:v6];
  os_activity_scope_leave(&v8);
}

- (LNFetchActionAppContextConnectionOperation)initWithConnectionInterface:(id)a3 action:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_8:
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"LNFetchActionAppContextConnectionOperation.m", 30, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"LNFetchActionAppContextConnectionOperation.m", 29, @"Invalid parameter not satisfying: %@", @"connectionInterface" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"LNFetchActionAppContextConnectionOperation.m", 31, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_4:
  v15 = [MEMORY[0x1E4F29128] UUID];
  v24.receiver = self;
  v24.super_class = (Class)LNFetchActionAppContextConnectionOperation;
  v16 = [(LNInterfaceConnectionOperation *)&v24 initWithIdentifier:v15 connectionInterface:v11 priority:1 queue:v13 activity:&__block_literal_global_1402];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_action, a4);
    v17 = _Block_copy(v14);
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = v17;

    v19 = v16;
  }

  return v16;
}

os_activity_t __105__LNFetchActionAppContextConnectionOperation_initWithConnectionInterface_action_queue_completionHandler___block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1A4419000, "appintents:fetch action app context", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v0;
}

@end