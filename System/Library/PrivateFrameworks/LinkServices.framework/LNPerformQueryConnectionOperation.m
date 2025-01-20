@interface LNPerformQueryConnectionOperation
- (LNPerformQueryConnectionOperation)initWithConnectionInterface:(id)a3 query:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (LNQueryOutput)output;
- (LNQueryRequest)queryRequest;
- (id)completionHandler;
- (void)finishWithError:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setOutput:(id)a3;
- (void)start;
@end

@implementation LNPerformQueryConnectionOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_queryRequest, 0);
}

- (void)setOutput:(id)a3
{
}

- (LNQueryOutput)output
{
  return self->_output;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (LNQueryRequest)queryRequest
{
  return self->_queryRequest;
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(LNPerformQueryConnectionOperation *)self completionHandler];

  if (v5)
  {
    v6 = [(LNPerformQueryConnectionOperation *)self output];
    uint64_t v7 = [(LNConnectionOperation *)self validatingResult:v6 error:v4];

    v8 = [(LNPerformQueryConnectionOperation *)self completionHandler];
    v9 = [(LNPerformQueryConnectionOperation *)self output];
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v9, v7);

    [(LNPerformQueryConnectionOperation *)self setCompletionHandler:0];
    id v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNPerformQueryConnectionOperation;
  [(LNConnectionOperation *)&v10 finishWithError:v4];
}

- (void)start
{
  v7.receiver = self;
  v7.super_class = (Class)LNPerformQueryConnectionOperation;
  [(LNConnectionOperation *)&v7 start];
  id v4 = [(LNInterfaceConnectionOperation *)self connectionInterface];
  v5 = [(LNPerformQueryConnectionOperation *)self queryRequest];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__LNPerformQueryConnectionOperation_start__block_invoke;
  v6[3] = &unk_1E5B3A460;
  v6[4] = self;
  v6[5] = a2;
  [v4 performPropertyQuery:v5 completionHandler:v6];
}

void __42__LNPerformQueryConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = v5 != 0;
  }
  if (!v7)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"LNPerformQueryConnectionOperation.m", 57, @"Invalid parameter not satisfying: %@", @"(output && !error) || (error && !output)" object file lineNumber description];
  }
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v8 = [*(id *)(a1 + 32) activity];
  os_activity_scope_enter(v8, &state);

  [*(id *)(a1 + 32) setOutput:v5];
  [*(id *)(a1 + 32) finishWithError:v6];
  os_activity_scope_leave(&state);
}

- (LNPerformQueryConnectionOperation)initWithConnectionInterface:(id)a3 query:(id)a4 queue:(id)a5 completionHandler:(id)a6
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
    [v22 handleFailureInMethod:a2, self, @"LNPerformQueryConnectionOperation.m", 34, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"LNPerformQueryConnectionOperation.m", 33, @"Invalid parameter not satisfying: %@", @"connectionInterface" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"LNPerformQueryConnectionOperation.m", 35, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_4:
  v15 = [MEMORY[0x1E4F29128] UUID];
  v24.receiver = self;
  v24.super_class = (Class)LNPerformQueryConnectionOperation;
  v16 = [(LNInterfaceConnectionOperation *)&v24 initWithIdentifier:v15 connectionInterface:v11 priority:1 queue:v13 activity:&__block_literal_global_4305];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_queryRequest, a4);
    uint64_t v17 = [v14 copy];
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = (id)v17;

    v19 = v16;
  }

  return v16;
}

os_activity_t __95__LNPerformQueryConnectionOperation_initWithConnectionInterface_query_queue_completionHandler___block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1A4419000, "appintents:perform query", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v0;
}

@end