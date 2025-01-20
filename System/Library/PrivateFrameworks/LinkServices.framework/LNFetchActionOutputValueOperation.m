@interface LNFetchActionOutputValueOperation
- (LNActionOutput)actionOutput;
- (LNFetchActionOutputValueOperation)initWithConnectionInterface:(id)a3 actionOutput:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (LNValue)value;
- (id)completionHandler;
- (void)finishWithError:(id)a3;
- (void)setActionOutput:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setValue:(id)a3;
- (void)start;
@end

@implementation LNFetchActionOutputValueOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_actionOutput, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setValue:(id)a3
{
}

- (LNValue)value
{
  return self->_value;
}

- (void)setActionOutput:(id)a3
{
}

- (LNActionOutput)actionOutput
{
  return self->_actionOutput;
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(LNFetchActionOutputValueOperation *)self completionHandler];

  if (v5)
  {
    v6 = [(LNFetchActionOutputValueOperation *)self value];
    uint64_t v7 = [(LNConnectionOperation *)self validatingResult:v6 error:v4];

    v8 = [(LNFetchActionOutputValueOperation *)self completionHandler];
    v9 = [(LNFetchActionOutputValueOperation *)self value];
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v9, v7);

    [(LNFetchActionOutputValueOperation *)self setCompletionHandler:0];
    id v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNFetchActionOutputValueOperation;
  [(LNConnectionOperation *)&v10 finishWithError:v4];
}

- (void)start
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)LNFetchActionOutputValueOperation;
  [(LNConnectionOperation *)&v11 start];
  v3 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(LNFetchActionOutputValueOperation *)self actionOutput];
    v5 = [v4 identifier];
    v6 = [(LNConnectionOperation *)self identifier];
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    __int16 v14 = 2114;
    v15 = v6;
  }
  uint64_t v7 = [(LNInterfaceConnectionOperation *)self connectionInterface];
  v8 = [(LNFetchActionOutputValueOperation *)self actionOutput];
  v9 = [v8 identifier];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__LNFetchActionOutputValueOperation_start__block_invoke;
  v10[3] = &unk_1E5B38E20;
  v10[4] = self;
  [v7 fetchActionOutputValueWithIdentifier:v9 completionHandler:v10];
}

void __42__LNFetchActionOutputValueOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  os_activity_scope_enter(v7, &v8);

  [*(id *)(a1 + 32) setValue:v5];
  [*(id *)(a1 + 32) finishWithError:v6];
  os_activity_scope_leave(&v8);
}

- (LNFetchActionOutputValueOperation)initWithConnectionInterface:(id)a3 actionOutput:(id)a4 queue:(id)a5 completionHandler:(id)a6
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
    [v22 handleFailureInMethod:a2, self, @"LNFetchActionOutputValueOperation.m", 29, @"Invalid parameter not satisfying: %@", @"actionOutput" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"LNFetchActionOutputValueOperation.m", 28, @"Invalid parameter not satisfying: %@", @"connectionInterface" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"LNFetchActionOutputValueOperation.m", 30, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_4:
  v15 = [MEMORY[0x1E4F29128] UUID];
  v24.receiver = self;
  v24.super_class = (Class)LNFetchActionOutputValueOperation;
  uint64_t v16 = [(LNInterfaceConnectionOperation *)&v24 initWithIdentifier:v15 connectionInterface:v11 priority:1 queue:v13 activity:&__block_literal_global_4071];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_actionOutput, a4);
    uint64_t v17 = [v14 copy];
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = (id)v17;

    v19 = v16;
  }

  return v16;
}

os_activity_t __102__LNFetchActionOutputValueOperation_initWithConnectionInterface_actionOutput_queue_completionHandler___block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1A4419000, "appintents:fetch action output value", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v0;
}

@end