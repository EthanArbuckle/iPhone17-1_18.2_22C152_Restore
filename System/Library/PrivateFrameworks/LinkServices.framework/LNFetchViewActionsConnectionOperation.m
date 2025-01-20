@interface LNFetchViewActionsConnectionOperation
- (LNFetchViewActionsConnectionOperation)initWithConnectionInterface:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (NSArray)result;
- (id)completionHandler;
- (void)finishWithError:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setResult:(id)a3;
- (void)start;
@end

@implementation LNFetchViewActionsConnectionOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong(&self->_completionHandler, 0);
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

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(LNFetchViewActionsConnectionOperation *)self completionHandler];

  if (v5)
  {
    v6 = [(LNFetchViewActionsConnectionOperation *)self result];
    uint64_t v7 = [(LNConnectionOperation *)self validatingResult:v6 error:v4];

    v8 = [(LNFetchViewActionsConnectionOperation *)self completionHandler];
    v9 = [(LNFetchViewActionsConnectionOperation *)self result];
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v9, v7);

    [(LNFetchViewActionsConnectionOperation *)self setCompletionHandler:0];
    id v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNFetchViewActionsConnectionOperation;
  [(LNConnectionOperation *)&v10 finishWithError:v4];
}

- (void)start
{
  v7.receiver = self;
  v7.super_class = (Class)LNFetchViewActionsConnectionOperation;
  [(LNConnectionOperation *)&v7 start];
  v3 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_INFO, "Fetching app view Actions", buf, 2u);
  }

  id v4 = [(LNInterfaceConnectionOperation *)self connectionInterface];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__LNFetchViewActionsConnectionOperation_start__block_invoke;
  v5[3] = &unk_1E5B39D00;
  v5[4] = self;
  [v4 fetchViewActionsWithCompletionHandler:v5];
}

void __46__LNFetchViewActionsConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_super v7 = objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  os_activity_scope_enter(v7, &v8);

  [*(id *)(a1 + 32) setResult:v5];
  [*(id *)(a1 + 32) finishWithError:v6];
  os_activity_scope_leave(&v8);
}

- (LNFetchViewActionsConnectionOperation)initWithConnectionInterface:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"LNFetchViewActionsConnectionOperation.m", 26, @"Invalid parameter not satisfying: %@", @"connectionInterface" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"LNFetchViewActionsConnectionOperation.m", 27, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  v13 = [MEMORY[0x1E4F29128] UUID];
  v21.receiver = self;
  v21.super_class = (Class)LNFetchViewActionsConnectionOperation;
  v14 = [(LNInterfaceConnectionOperation *)&v21 initWithIdentifier:v13 connectionInterface:v9 priority:1 queue:v10 activity:&__block_literal_global_3151];

  if (v14)
  {
    v15 = _Block_copy(v12);
    id completionHandler = v14->_completionHandler;
    v14->_id completionHandler = v15;

    v17 = v14;
  }

  return v14;
}

os_activity_t __93__LNFetchViewActionsConnectionOperation_initWithConnectionInterface_queue_completionHandler___block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1A4419000, "appintents:fetch view actions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v0;
}

@end