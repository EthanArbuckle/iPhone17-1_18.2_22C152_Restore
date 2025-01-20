@interface LNFetchActionForAppShortcutIdentifierOperation
- (LNAppShortcutActionData)result;
- (LNFetchActionForAppShortcutIdentifierOperation)initWithConnectionInterface:(id)a3 appShortcutIdentifier:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (NSString)appShortcutIdentifier;
- (id)completionHandler;
- (void)finishWithError:(id)a3;
- (void)setAppShortcutIdentifier:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setResult:(id)a3;
- (void)start;
@end

@implementation LNFetchActionForAppShortcutIdentifierOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_appShortcutIdentifier, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setResult:(id)a3
{
}

- (LNAppShortcutActionData)result
{
  return self->_result;
}

- (void)setAppShortcutIdentifier:(id)a3
{
}

- (NSString)appShortcutIdentifier
{
  return self->_appShortcutIdentifier;
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
  v5 = [(LNFetchActionForAppShortcutIdentifierOperation *)self completionHandler];

  if (v5)
  {
    v6 = [(LNFetchActionForAppShortcutIdentifierOperation *)self result];
    uint64_t v7 = [(LNConnectionOperation *)self validatingResult:v6 error:v4];

    v8 = [(LNFetchActionForAppShortcutIdentifierOperation *)self completionHandler];
    v9 = [(LNFetchActionForAppShortcutIdentifierOperation *)self result];
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v9, v7);

    [(LNFetchActionForAppShortcutIdentifierOperation *)self setCompletionHandler:0];
    id v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNFetchActionForAppShortcutIdentifierOperation;
  [(LNConnectionOperation *)&v10 finishWithError:v4];
}

- (void)start
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)LNFetchActionForAppShortcutIdentifierOperation;
  [(LNConnectionOperation *)&v8 start];
  v3 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(LNFetchActionForAppShortcutIdentifierOperation *)self appShortcutIdentifier];
    *(_DWORD *)buf = 138412290;
    objc_super v10 = v4;
  }
  v5 = [(LNInterfaceConnectionOperation *)self connectionInterface];
  v6 = [(LNFetchActionForAppShortcutIdentifierOperation *)self appShortcutIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__LNFetchActionForAppShortcutIdentifierOperation_start__block_invoke;
  v7[3] = &unk_1E5B39B38;
  v7[4] = self;
  [v5 fetchActionForAppShortcutIdentifier:v6 completionHandler:v7];
}

void __55__LNFetchActionForAppShortcutIdentifierOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  os_activity_scope_enter(v7, &v8);

  [*(id *)(a1 + 32) setResult:v5];
  [*(id *)(a1 + 32) finishWithError:v6];
  os_activity_scope_leave(&v8);
}

- (LNFetchActionForAppShortcutIdentifierOperation)initWithConnectionInterface:(id)a3 appShortcutIdentifier:(id)a4 queue:(id)a5 completionHandler:(id)a6
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
    [v24 handleFailureInMethod:a2, self, @"LNFetchActionForAppShortcutIdentifierOperation.m", 29, @"Invalid parameter not satisfying: %@", @"appShortcutIdentifier" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"LNFetchActionForAppShortcutIdentifierOperation.m", 28, @"Invalid parameter not satisfying: %@", @"connectionInterface" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"LNFetchActionForAppShortcutIdentifierOperation.m", 30, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_4:
  v15 = [MEMORY[0x1E4F29128] UUID];
  v26.receiver = self;
  v26.super_class = (Class)LNFetchActionForAppShortcutIdentifierOperation;
  v16 = [(LNInterfaceConnectionOperation *)&v26 initWithIdentifier:v15 connectionInterface:v11 priority:1 queue:v13 activity:&__block_literal_global_10123];

  if (v16)
  {
    uint64_t v17 = [v12 copy];
    appShortcutIdentifier = v16->_appShortcutIdentifier;
    v16->_appShortcutIdentifier = (NSString *)v17;

    uint64_t v19 = [v14 copy];
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = (id)v19;

    v21 = v16;
  }

  return v16;
}

os_activity_t __124__LNFetchActionForAppShortcutIdentifierOperation_initWithConnectionInterface_appShortcutIdentifier_queue_completionHandler___block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1A4419000, "appintents:fetch action for appshortcut identifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v0;
}

@end