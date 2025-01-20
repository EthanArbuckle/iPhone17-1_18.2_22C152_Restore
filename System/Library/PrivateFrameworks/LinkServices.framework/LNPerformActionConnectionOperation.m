@interface LNPerformActionConnectionOperation
- (LNAction)action;
- (LNActionExecutor)executor;
- (LNPerformActionConnectionOperation)initWithConnectionInterface:(id)a3 action:(id)a4 executor:(id)a5 executorActivity:(id)a6 queue:(id)a7 completionHandler:(id)a8;
- (LNSuccessResult)result;
- (double)timeout;
- (id)completionHandler;
- (void)finishWithError:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setResult:(id)a3;
- (void)start;
@end

@implementation LNPerformActionConnectionOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_executor, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)setResult:(id)a3
{
}

- (LNSuccessResult)result
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

- (LNActionExecutor)executor
{
  return self->_executor;
}

- (LNAction)action
{
  return self->_action;
}

- (double)timeout
{
  v2 = [(LNPerformActionConnectionOperation *)self executor];
  v3 = [v2 options];
  [v3 connectionOperationTimeout];
  double v5 = v4;

  return v5;
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  double v5 = [(LNPerformActionConnectionOperation *)self completionHandler];

  if (v5)
  {
    v6 = [(LNPerformActionConnectionOperation *)self result];
    uint64_t v7 = [(LNConnectionOperation *)self validatingResult:v6 error:v4];

    v8 = [(LNPerformActionConnectionOperation *)self completionHandler];
    v9 = [(LNPerformActionConnectionOperation *)self result];
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v9, v7);

    [(LNPerformActionConnectionOperation *)self setCompletionHandler:0];
    id v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNPerformActionConnectionOperation;
  [(LNConnectionOperation *)&v10 finishWithError:v4];
}

- (void)start
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)LNPerformActionConnectionOperation;
  [(LNConnectionOperation *)&v18 start];
  v3 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(LNPerformActionConnectionOperation *)self action];
    double v5 = [v4 identifier];
    v6 = [(LNConnectionOperation *)self identifier];
    uint64_t v7 = [(LNPerformActionConnectionOperation *)self action];
    v8 = [v7 parameters];
    *(_DWORD *)buf = 138543874;
    v20 = v5;
    __int16 v21 = 2114;
    v22 = v6;
    __int16 v23 = 2112;
    v24 = v8;
  }
  v9 = [(LNPerformActionConnectionOperation *)self action];
  objc_super v10 = [MEMORY[0x1E4F72690] fileValueType];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __43__LNPerformActionConnectionOperation_start__block_invoke;
  v17[3] = &unk_1E5B39AE8;
  v17[4] = self;
  [v9 enumerateParameterValuesOfValueType:v10 block:v17];

  v11 = [(LNInterfaceConnectionOperation *)self connectionInterface];
  v12 = [(LNPerformActionConnectionOperation *)self action];
  v13 = [(LNPerformActionConnectionOperation *)self executor];
  v14 = [v13 options];
  v15 = [(LNPerformActionConnectionOperation *)self executor];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __43__LNPerformActionConnectionOperation_start__block_invoke_2;
  v16[3] = &unk_1E5B39B10;
  v16[4] = self;
  [v11 performAction:v12 options:v14 executor:v15 completionHandler:v16];
}

void __43__LNPerformActionConnectionOperation_start__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 value];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  v6 = [v5 fileURL];
  int v7 = [v6 isFileURL];

  if (v7)
  {
    v8 = [*(id *)(a1 + 32) executor];
    v9 = [v8 connection];
    objc_super v10 = v9;
    if (v9) {
      [v9 auditToken];
    }

    v11 = [v5 fileURL];
    INIssueSandboxExtensionToProcess();
  }
}

void __43__LNPerformActionConnectionOperation_start__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  os_activity_scope_enter(v7, &v8);

  [*(id *)(a1 + 32) setResult:v5];
  [*(id *)(a1 + 32) finishWithError:v6];
  os_activity_scope_leave(&v8);
}

- (LNPerformActionConnectionOperation)initWithConnectionInterface:(id)a3 action:(id)a4 executor:(id)a5 executorActivity:(id)a6 queue:(id)a7 completionHandler:(id)a8
{
  id v15 = a3;
  id obj = a4;
  id v16 = a4;
  id v35 = a5;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"LNPerformActionConnectionOperation.m", 37, @"Invalid parameter not satisfying: %@", @"connectionInterface", obj, v35 object file lineNumber description];

    if (v16)
    {
LABEL_3:
      if (v17) {
        goto LABEL_4;
      }
LABEL_13:
      v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:a2, self, @"LNPerformActionConnectionOperation.m", 39, @"Invalid parameter not satisfying: %@", @"executor" object file lineNumber description];

      if (v20) {
        goto LABEL_5;
      }
      goto LABEL_14;
    }
  }
  v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"LNPerformActionConnectionOperation.m", 38, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

  if (!v17) {
    goto LABEL_13;
  }
LABEL_4:
  if (v20) {
    goto LABEL_5;
  }
LABEL_14:
  v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:a2, self, @"LNPerformActionConnectionOperation.m", 40, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_5:
  if ([v16 openAppWhenRun]) {
    uint64_t v21 = 2;
  }
  else {
    uint64_t v21 = 1;
  }
  v22 = [v17 identifier];
  __int16 v23 = [v16 systemProtocols];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __123__LNPerformActionConnectionOperation_initWithConnectionInterface_action_executor_executorActivity_queue_completionHandler___block_invoke;
  v37[3] = &unk_1E5B39AC0;
  id v24 = v18;
  id v38 = v24;
  v36.receiver = self;
  v36.super_class = (Class)LNPerformActionConnectionOperation;
  uint64_t v25 = [(LNRuntimeAssertionsTakingConnectionOperation *)&v36 initWithIdentifier:v22 connectionInterface:v15 systemProtocols:v23 priority:v21 queue:v19 activity:v37];

  if (v25)
  {
    objc_storeStrong((id *)&v25->_action, obj);
    objc_storeStrong((id *)&v25->_executor, v35);
    uint64_t v26 = [v20 copy];
    id completionHandler = v25->_completionHandler;
    v25->_id completionHandler = (id)v26;

    v28 = v25;
  }

  return v25;
}

id __123__LNPerformActionConnectionOperation_initWithConnectionInterface_action_executor_executorActivity_queue_completionHandler___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end