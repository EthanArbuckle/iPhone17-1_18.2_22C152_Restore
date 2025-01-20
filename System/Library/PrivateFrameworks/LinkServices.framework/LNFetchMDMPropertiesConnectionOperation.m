@interface LNFetchMDMPropertiesConnectionOperation
- (LNAction)action;
- (LNFetchMDMPropertiesConnectionOperation)initWithConnectionInterface:(id)a3 action:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (NSString)accountIdentifier;
- (id)completionHandler;
- (void)finishWithError:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)start;
@end

@implementation LNFetchMDMPropertiesConnectionOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (LNAction)action
{
  return self->_action;
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(LNFetchMDMPropertiesConnectionOperation *)self completionHandler];

  if (v5)
  {
    v6 = [(LNFetchMDMPropertiesConnectionOperation *)self completionHandler];
    v7 = [(LNFetchMDMPropertiesConnectionOperation *)self accountIdentifier];
    ((void (**)(void, void *, id))v6)[2](v6, v7, v4);

    [(LNFetchMDMPropertiesConnectionOperation *)self setCompletionHandler:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)LNFetchMDMPropertiesConnectionOperation;
  [(LNConnectionOperation *)&v8 finishWithError:v4];
}

- (void)start
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)LNFetchMDMPropertiesConnectionOperation;
  [(LNConnectionOperation *)&v8 start];
  v3 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(LNFetchMDMPropertiesConnectionOperation *)self action];
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_INFO, "Fetching MDM properties for action %@", buf, 0xCu);
  }
  v5 = [(LNInterfaceConnectionOperation *)self connectionInterface];
  v6 = [(LNFetchMDMPropertiesConnectionOperation *)self action];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__LNFetchMDMPropertiesConnectionOperation_start__block_invoke;
  v7[3] = &unk_1E5B38A18;
  v7[4] = self;
  [v5 fetchDestinationMDMAccountIdentifierForAction:v6 completionHandler:v7];
}

void __48__LNFetchMDMPropertiesConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  os_activity_scope_enter(v7, &v8);

  [*(id *)(a1 + 32) setAccountIdentifier:v5];
  [*(id *)(a1 + 32) finishWithError:v6];
  os_activity_scope_leave(&v8);
}

- (LNFetchMDMPropertiesConnectionOperation)initWithConnectionInterface:(id)a3 action:(id)a4 queue:(id)a5 completionHandler:(id)a6
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
    [v24 handleFailureInMethod:a2, self, @"LNFetchMDMPropertiesConnectionOperation.m", 29, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"LNFetchMDMPropertiesConnectionOperation.m", 28, @"Invalid parameter not satisfying: %@", @"connectionInterface" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"LNFetchMDMPropertiesConnectionOperation.m", 30, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_4:
  v15 = [MEMORY[0x1E4F29128] UUID];
  v26.receiver = self;
  v26.super_class = (Class)LNFetchMDMPropertiesConnectionOperation;
  v16 = [(LNInterfaceConnectionOperation *)&v26 initWithIdentifier:v15 connectionInterface:v11 priority:1 queue:v13 activity:&__block_literal_global_2663];

  if (v16)
  {
    uint64_t v17 = [v12 copy];
    action = v16->_action;
    v16->_action = (LNAction *)v17;

    uint64_t v19 = [v14 copy];
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = (id)v19;

    v21 = v16;
  }

  return v16;
}

os_activity_t __102__LNFetchMDMPropertiesConnectionOperation_initWithConnectionInterface_action_queue_completionHandler___block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1A4419000, "appintents:fetch MDM properties", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v0;
}

@end