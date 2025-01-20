@interface LNFetchAppShortcutParametersConnectionOperation
- (LNFetchAppShortcutParametersConnectionOperation)initWithConnectionInterface:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (NSArray)appShortcutSubstitutions;
- (NSArray)parameterPresentationSubstitutions;
- (NSArray)spans;
- (id)completionHandler;
- (void)finishWithError:(id)a3;
- (void)setAppShortcutSubstitutions:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setParameterPresentationSubstitutions:(id)a3;
- (void)setSpans:(id)a3;
- (void)start;
@end

@implementation LNFetchAppShortcutParametersConnectionOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterPresentationSubstitutions, 0);
  objc_storeStrong((id *)&self->_spans, 0);
  objc_storeStrong((id *)&self->_appShortcutSubstitutions, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setParameterPresentationSubstitutions:(id)a3
{
}

- (NSArray)parameterPresentationSubstitutions
{
  return self->_parameterPresentationSubstitutions;
}

- (void)setSpans:(id)a3
{
}

- (NSArray)spans
{
  return self->_spans;
}

- (void)setAppShortcutSubstitutions:(id)a3
{
}

- (NSArray)appShortcutSubstitutions
{
  return self->_appShortcutSubstitutions;
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
  v5 = [(LNFetchAppShortcutParametersConnectionOperation *)self completionHandler];

  if (v5)
  {
    v6 = [(LNFetchAppShortcutParametersConnectionOperation *)self appShortcutSubstitutions];
    uint64_t v7 = [(LNConnectionOperation *)self validatingResult:v6 error:v4];

    v8 = [(LNFetchAppShortcutParametersConnectionOperation *)self completionHandler];
    v9 = [(LNFetchAppShortcutParametersConnectionOperation *)self appShortcutSubstitutions];
    v10 = [(LNFetchAppShortcutParametersConnectionOperation *)self spans];
    v11 = [(LNFetchAppShortcutParametersConnectionOperation *)self parameterPresentationSubstitutions];
    ((void (**)(void, void *, void *, void *, uint64_t))v8)[2](v8, v9, v10, v11, v7);

    [(LNFetchAppShortcutParametersConnectionOperation *)self setCompletionHandler:0];
    id v4 = (id)v7;
  }
  v12.receiver = self;
  v12.super_class = (Class)LNFetchAppShortcutParametersConnectionOperation;
  [(LNConnectionOperation *)&v12 finishWithError:v4];
}

- (void)start
{
  v7.receiver = self;
  v7.super_class = (Class)LNFetchAppShortcutParametersConnectionOperation;
  [(LNConnectionOperation *)&v7 start];
  v3 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_INFO, "Fetching AppShortcut parameters", buf, 2u);
  }

  id v4 = [(LNInterfaceConnectionOperation *)self connectionInterface];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__LNFetchAppShortcutParametersConnectionOperation_start__block_invoke;
  v5[3] = &unk_1E5B3A5C0;
  v5[4] = self;
  [v4 fetchAppShortcutParametersWithCompletionHandler:v5];
}

void __56__LNFetchAppShortcutParametersConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  os_activity_scope_enter(v13, &v14);

  [*(id *)(a1 + 32) setAppShortcutSubstitutions:v9];
  [*(id *)(a1 + 32) setSpans:v10];
  [*(id *)(a1 + 32) setParameterPresentationSubstitutions:v11];
  [*(id *)(a1 + 32) finishWithError:v12];
  os_activity_scope_leave(&v14);
}

- (LNFetchAppShortcutParametersConnectionOperation)initWithConnectionInterface:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"LNFetchAppShortcutParametersConnectionOperation.m", 29, @"Invalid parameter not satisfying: %@", @"connectionInterface" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"LNFetchAppShortcutParametersConnectionOperation.m", 30, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  v13 = [MEMORY[0x1E4F29128] UUID];
  v21.receiver = self;
  v21.super_class = (Class)LNFetchAppShortcutParametersConnectionOperation;
  os_activity_scope_state_s v14 = [(LNInterfaceConnectionOperation *)&v21 initWithIdentifier:v13 connectionInterface:v9 priority:1 queue:v10 activity:&__block_literal_global_14100];

  if (v14)
  {
    v15 = _Block_copy(v12);
    id completionHandler = v14->_completionHandler;
    v14->_id completionHandler = v15;

    v17 = v14;
  }

  return v14;
}

os_activity_t __103__LNFetchAppShortcutParametersConnectionOperation_initWithConnectionInterface_queue_completionHandler___block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1A4419000, "appintents:fetch AppShortcut parameters", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v0;
}

@end