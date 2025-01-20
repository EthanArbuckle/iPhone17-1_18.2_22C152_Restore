@interface LNFetchSuggestedFocusActionsConnectionOperation
- (LNActionMetadata)actionMetadata;
- (LNFetchSuggestedFocusActionsConnectionOperation)initWithConnectionInterface:(id)a3 actionMetadata:(id)a4 suggestionContext:(id)a5 queue:(id)a6 completionHandler:(id)a7;
- (LNFocusConfigurationSuggestionContext)suggestionContext;
- (NSArray)results;
- (id)completionHandler;
- (void)finishWithError:(id)a3;
- (void)setActionMetadata:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setResults:(id)a3;
- (void)setSuggestionContext:(id)a3;
- (void)start;
@end

@implementation LNFetchSuggestedFocusActionsConnectionOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_suggestionContext, 0);
  objc_storeStrong((id *)&self->_actionMetadata, 0);
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

- (void)setSuggestionContext:(id)a3
{
}

- (LNFocusConfigurationSuggestionContext)suggestionContext
{
  return self->_suggestionContext;
}

- (void)setActionMetadata:(id)a3
{
}

- (LNActionMetadata)actionMetadata
{
  return self->_actionMetadata;
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(LNFetchSuggestedFocusActionsConnectionOperation *)self completionHandler];

  if (v5)
  {
    v6 = [(LNFetchSuggestedFocusActionsConnectionOperation *)self results];
    uint64_t v7 = [(LNConnectionOperation *)self validatingResult:v6 error:v4];

    v8 = [(LNFetchSuggestedFocusActionsConnectionOperation *)self completionHandler];
    v9 = [(LNFetchSuggestedFocusActionsConnectionOperation *)self results];
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v9, v7);

    [(LNFetchSuggestedFocusActionsConnectionOperation *)self setCompletionHandler:0];
    id v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNFetchSuggestedFocusActionsConnectionOperation;
  [(LNConnectionOperation *)&v10 finishWithError:v4];
}

- (void)start
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)LNFetchSuggestedFocusActionsConnectionOperation;
  [(LNConnectionOperation *)&v10 start];
  v3 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(LNFetchSuggestedFocusActionsConnectionOperation *)self actionMetadata];
    v5 = [v4 identifier];
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_INFO, "Fetching suggested focus actions %@", buf, 0xCu);
  }
  v6 = [(LNInterfaceConnectionOperation *)self connectionInterface];
  uint64_t v7 = [(LNFetchSuggestedFocusActionsConnectionOperation *)self actionMetadata];
  v8 = [(LNFetchSuggestedFocusActionsConnectionOperation *)self suggestionContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__LNFetchSuggestedFocusActionsConnectionOperation_start__block_invoke;
  v9[3] = &unk_1E5B39D00;
  v9[4] = self;
  [v6 fetchSuggestedFocusActionsForActionMetadata:v7 suggestionContext:v8 completionHandler:v9];
}

void __56__LNFetchSuggestedFocusActionsConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  os_activity_scope_enter(v7, &v8);

  [*(id *)(a1 + 32) setResults:v5];
  [*(id *)(a1 + 32) finishWithError:v6];
  os_activity_scope_leave(&v8);
}

- (LNFetchSuggestedFocusActionsConnectionOperation)initWithConnectionInterface:(id)a3 actionMetadata:(id)a4 suggestionContext:(id)a5 queue:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = v17;
  if (v14)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"LNFetchSuggestedFocusActionsConnectionOperation.m", 29, @"Invalid parameter not satisfying: %@", @"actionMetadata" object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"LNFetchSuggestedFocusActionsConnectionOperation.m", 30, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  v19 = [MEMORY[0x1E4F29128] UUID];
  v27.receiver = self;
  v27.super_class = (Class)LNFetchSuggestedFocusActionsConnectionOperation;
  v20 = [(LNInterfaceConnectionOperation *)&v27 initWithIdentifier:v19 connectionInterface:v13 priority:1 queue:v16 activity:&__block_literal_global_8458];

  if (v20)
  {
    objc_storeStrong((id *)&v20->_actionMetadata, a4);
    objc_storeStrong((id *)&v20->_suggestionContext, a5);
    uint64_t v21 = [v18 copy];
    id completionHandler = v20->_completionHandler;
    v20->_id completionHandler = (id)v21;

    v23 = v20;
  }

  return v20;
}

os_activity_t __136__LNFetchSuggestedFocusActionsConnectionOperation_initWithConnectionInterface_actionMetadata_suggestionContext_queue_completionHandler___block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1A4419000, "appintents:fetch suggested focus actions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v0;
}

@end