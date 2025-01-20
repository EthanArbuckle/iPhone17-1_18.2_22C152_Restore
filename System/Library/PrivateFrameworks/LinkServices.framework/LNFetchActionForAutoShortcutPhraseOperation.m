@interface LNFetchActionForAutoShortcutPhraseOperation
- (LNAction)result;
- (LNFetchActionForAutoShortcutPhraseOperation)initWithConnectionInterface:(id)a3 autoShortcutPhrase:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (NSString)autoShortcutPhrase;
- (id)completionHandler;
- (void)finishWithError:(id)a3;
- (void)setAutoShortcutPhrase:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setResult:(id)a3;
- (void)start;
@end

@implementation LNFetchActionForAutoShortcutPhraseOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_autoShortcutPhrase, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setResult:(id)a3
{
}

- (LNAction)result
{
  return self->_result;
}

- (void)setAutoShortcutPhrase:(id)a3
{
}

- (NSString)autoShortcutPhrase
{
  return self->_autoShortcutPhrase;
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
  v5 = [(LNFetchActionForAutoShortcutPhraseOperation *)self completionHandler];

  if (v5)
  {
    v6 = [(LNFetchActionForAutoShortcutPhraseOperation *)self result];
    uint64_t v7 = [(LNConnectionOperation *)self validatingResult:v6 error:v4];

    v8 = [(LNFetchActionForAutoShortcutPhraseOperation *)self completionHandler];
    v9 = [(LNFetchActionForAutoShortcutPhraseOperation *)self result];
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v9, v7);

    [(LNFetchActionForAutoShortcutPhraseOperation *)self setCompletionHandler:0];
    id v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNFetchActionForAutoShortcutPhraseOperation;
  [(LNConnectionOperation *)&v10 finishWithError:v4];
}

- (void)start
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)LNFetchActionForAutoShortcutPhraseOperation;
  [(LNConnectionOperation *)&v8 start];
  v3 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(LNFetchActionForAutoShortcutPhraseOperation *)self autoShortcutPhrase];
    *(_DWORD *)buf = 138412290;
    objc_super v10 = v4;
  }
  v5 = [(LNInterfaceConnectionOperation *)self connectionInterface];
  v6 = [(LNFetchActionForAutoShortcutPhraseOperation *)self autoShortcutPhrase];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__LNFetchActionForAutoShortcutPhraseOperation_start__block_invoke;
  v7[3] = &unk_1E5B39620;
  v7[4] = self;
  [v5 fetchActionForAutoShortcutPhrase:v6 completionHandler:v7];
}

void __52__LNFetchActionForAutoShortcutPhraseOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  os_activity_scope_enter(v7, &v8);

  [*(id *)(a1 + 32) setResult:v5];
  [*(id *)(a1 + 32) finishWithError:v6];
  os_activity_scope_leave(&v8);
}

- (LNFetchActionForAutoShortcutPhraseOperation)initWithConnectionInterface:(id)a3 autoShortcutPhrase:(id)a4 queue:(id)a5 completionHandler:(id)a6
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
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"LNFetchActionForAutoShortcutPhraseOperation.m", 30, @"Invalid parameter not satisfying: %@", @"autoShortcutPhrase" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"LNFetchActionForAutoShortcutPhraseOperation.m", 29, @"Invalid parameter not satisfying: %@", @"connectionInterface" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"LNFetchActionForAutoShortcutPhraseOperation.m", 31, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_4:
  v15 = [MEMORY[0x1E4F29128] UUID];
  v26.receiver = self;
  v26.super_class = (Class)LNFetchActionForAutoShortcutPhraseOperation;
  v16 = [(LNInterfaceConnectionOperation *)&v26 initWithIdentifier:v15 connectionInterface:v11 priority:1 queue:v13 activity:&__block_literal_global_8392];

  if (v16)
  {
    uint64_t v17 = [v12 copy];
    autoShortcutPhrase = v16->_autoShortcutPhrase;
    v16->_autoShortcutPhrase = (NSString *)v17;

    uint64_t v19 = [v14 copy];
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = (id)v19;

    v21 = v16;
  }

  return v16;
}

os_activity_t __118__LNFetchActionForAutoShortcutPhraseOperation_initWithConnectionInterface_autoShortcutPhrase_queue_completionHandler___block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1A4419000, "appintents:fetch action for appshortcut phrase", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v0;
}

@end