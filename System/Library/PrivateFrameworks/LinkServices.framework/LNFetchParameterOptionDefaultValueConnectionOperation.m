@interface LNFetchParameterOptionDefaultValueConnectionOperation
- (LNAction)action;
- (LNActionMetadata)actionMetadata;
- (LNDynamicOption)result;
- (LNFetchParameterOptionDefaultValueConnectionOperation)initWithConnectionInterface:(id)a3 action:(id)a4 actionMetadata:(id)a5 parameterIdentifier:(id)a6 queue:(id)a7 completionHandler:(id)a8;
- (NSString)parameterIdentifier;
- (id)completionHandler;
- (void)finishWithError:(id)a3;
- (void)setAction:(id)a3;
- (void)setActionMetadata:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setParameterIdentifier:(id)a3;
- (void)setResult:(id)a3;
- (void)start;
@end

@implementation LNFetchParameterOptionDefaultValueConnectionOperation

os_activity_t __151__LNFetchParameterOptionDefaultValueConnectionOperation_initWithConnectionInterface_action_actionMetadata_parameterIdentifier_queue_completionHandler___block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1A4419000, "appintents:fetch parameter option default value", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v0;
}

- (LNFetchParameterOptionDefaultValueConnectionOperation)initWithConnectionInterface:(id)a3 action:(id)a4 actionMetadata:(id)a5 parameterIdentifier:(id)a6 queue:(id)a7 completionHandler:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
LABEL_11:
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"LNFetchParameterOptionDefaultValueConnectionOperation.m", 33, @"Invalid parameter not satisfying: %@", @"parameterIdentifier" object file lineNumber description];

    if (v20) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  v36 = [MEMORY[0x1E4F28B00] currentHandler];
  [v36 handleFailureInMethod:a2, self, @"LNFetchParameterOptionDefaultValueConnectionOperation.m", 32, @"Invalid parameter not satisfying: %@", @"actionMetadata" object file lineNumber description];

  if (!v18) {
    goto LABEL_11;
  }
LABEL_3:
  if (v20) {
    goto LABEL_4;
  }
LABEL_12:
  v38 = [MEMORY[0x1E4F28B00] currentHandler];
  [v38 handleFailureInMethod:a2, self, @"LNFetchParameterOptionDefaultValueConnectionOperation.m", 34, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_4:
  v21 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v22 = [v17 systemProtocols];
  v23 = (void *)v22;
  if (v22) {
    uint64_t v24 = v22;
  }
  else {
    uint64_t v24 = MEMORY[0x1E4F1CBF0];
  }
  v39.receiver = self;
  v39.super_class = (Class)LNFetchParameterOptionDefaultValueConnectionOperation;
  v25 = [(LNRuntimeAssertionsTakingConnectionOperation *)&v39 initWithIdentifier:v21 connectionInterface:v15 systemProtocols:v24 priority:1 queue:v19 activity:&__block_literal_global_5609];

  if (v25)
  {
    uint64_t v26 = [v16 copy];
    action = v25->_action;
    v25->_action = (LNAction *)v26;

    uint64_t v28 = [v17 copy];
    actionMetadata = v25->_actionMetadata;
    v25->_actionMetadata = (LNActionMetadata *)v28;

    uint64_t v30 = [v18 copy];
    parameterIdentifier = v25->_parameterIdentifier;
    v25->_parameterIdentifier = (NSString *)v30;

    uint64_t v32 = [v20 copy];
    id completionHandler = v25->_completionHandler;
    v25->_id completionHandler = (id)v32;

    v34 = v25;
  }

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_parameterIdentifier, 0);
  objc_storeStrong((id *)&self->_actionMetadata, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)start
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)LNFetchParameterOptionDefaultValueConnectionOperation;
  [(LNConnectionOperation *)&v12 start];
  v3 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(LNFetchParameterOptionDefaultValueConnectionOperation *)self actionMetadata];
    v5 = [v4 identifier];
    v6 = [(LNFetchParameterOptionDefaultValueConnectionOperation *)self parameterIdentifier];
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_INFO, "Fetching options default value for action %@ parameter %@", buf, 0x16u);
  }
  v7 = [(LNInterfaceConnectionOperation *)self connectionInterface];
  v8 = [(LNFetchParameterOptionDefaultValueConnectionOperation *)self action];
  v9 = [(LNFetchParameterOptionDefaultValueConnectionOperation *)self actionMetadata];
  v10 = [(LNFetchParameterOptionDefaultValueConnectionOperation *)self parameterIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__LNFetchParameterOptionDefaultValueConnectionOperation_start__block_invoke;
  v11[3] = &unk_1E5B390B8;
  v11[4] = self;
  [v7 fetchParameterOptionDefaultValueForAction:v8 actionMetadata:v9 parameterIdentifier:v10 completionHandler:v11];
}

- (NSString)parameterIdentifier
{
  return self->_parameterIdentifier;
}

- (LNActionMetadata)actionMetadata
{
  return self->_actionMetadata;
}

- (LNAction)action
{
  return self->_action;
}

void __62__LNFetchParameterOptionDefaultValueConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  os_activity_scope_enter(v7, &v8);

  [*(id *)(a1 + 32) setResult:v5];
  [*(id *)(a1 + 32) finishWithError:v6];
  os_activity_scope_leave(&v8);
}

- (void)setResult:(id)a3
{
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(LNFetchParameterOptionDefaultValueConnectionOperation *)self completionHandler];

  if (v5)
  {
    id v6 = [(LNFetchParameterOptionDefaultValueConnectionOperation *)self completionHandler];
    v7 = [(LNFetchParameterOptionDefaultValueConnectionOperation *)self result];
    ((void (**)(void, void *, id))v6)[2](v6, v7, v4);

    [(LNFetchParameterOptionDefaultValueConnectionOperation *)self setCompletionHandler:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)LNFetchParameterOptionDefaultValueConnectionOperation;
  [(LNConnectionOperation *)&v8 finishWithError:v4];
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (LNDynamicOption)result
{
  return self->_result;
}

- (void)setParameterIdentifier:(id)a3
{
}

- (void)setActionMetadata:(id)a3
{
}

- (void)setAction:(id)a3
{
}

@end