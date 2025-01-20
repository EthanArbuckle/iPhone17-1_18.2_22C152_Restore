@interface LNFetchSuggestedActionsFromViewAppIntentConnectionOperation
- (LNFetchSuggestedActionsFromViewAppIntentConnectionOperation)initWithConnectionInterface:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (NSArray)results;
- (id)completionHandler;
- (void)finishWithError:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setResults:(id)a3;
- (void)start;
@end

@implementation LNFetchSuggestedActionsFromViewAppIntentConnectionOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setResults:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(LNFetchSuggestedActionsFromViewAppIntentConnectionOperation *)self completionHandler];

  if (v5)
  {
    v6 = [(LNFetchSuggestedActionsFromViewAppIntentConnectionOperation *)self results];
    uint64_t v7 = [(LNConnectionOperation *)self validatingResult:v6 error:v4];

    v8 = [(LNFetchSuggestedActionsFromViewAppIntentConnectionOperation *)self completionHandler];
    v9 = [(LNFetchSuggestedActionsFromViewAppIntentConnectionOperation *)self results];
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v9, v7);

    [(LNFetchSuggestedActionsFromViewAppIntentConnectionOperation *)self setCompletionHandler:0];
    id v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNFetchSuggestedActionsFromViewAppIntentConnectionOperation;
  [(LNConnectionOperation *)&v10 finishWithError:v4];
}

- (void)start
{
  v7.receiver = self;
  v7.super_class = (Class)LNFetchSuggestedActionsFromViewAppIntentConnectionOperation;
  [(LNConnectionOperation *)&v7 start];
  v3 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_INFO, "Fetching suggested actions", buf, 2u);
  }

  id v4 = [(LNInterfaceConnectionOperation *)self connectionInterface];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__LNFetchSuggestedActionsFromViewAppIntentConnectionOperation_start__block_invoke;
  v5[3] = &unk_1E5B39D00;
  v5[4] = self;
  [v4 fetchSuggestedActionsFromViewWithCompletionHandler:v5];
}

void __68__LNFetchSuggestedActionsFromViewAppIntentConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_super v7 = objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  os_activity_scope_enter(v7, &v8);

  [*(id *)(a1 + 32) setResults:v5];
  [*(id *)(a1 + 32) finishWithError:v6];
  os_activity_scope_leave(&v8);
}

- (LNFetchSuggestedActionsFromViewAppIntentConnectionOperation)initWithConnectionInterface:(id)a3 queue:(id)a4 completionHandler:(id)a5
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
    [v19 handleFailureInMethod:a2, self, @"LNFetchSuggestedActionsFromViewAppIntentConnectionOperation.m", 27, @"Invalid parameter not satisfying: %@", @"connectionInterface" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"LNFetchSuggestedActionsFromViewAppIntentConnectionOperation.m", 28, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  v13 = [MEMORY[0x1E4F29128] UUID];
  v21.receiver = self;
  v21.super_class = (Class)LNFetchSuggestedActionsFromViewAppIntentConnectionOperation;
  v14 = [(LNInterfaceConnectionOperation *)&v21 initWithIdentifier:v13 connectionInterface:v9 priority:1 queue:v10 activity:&__block_literal_global_11536];

  if (v14)
  {
    v15 = _Block_copy(v12);
    id completionHandler = v14->_completionHandler;
    v14->_id completionHandler = v15;

    v17 = v14;
  }

  return v14;
}

os_activity_t __115__LNFetchSuggestedActionsFromViewAppIntentConnectionOperation_initWithConnectionInterface_queue_completionHandler___block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1A4419000, "appintents:fetch suggested actions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v0;
}

@end