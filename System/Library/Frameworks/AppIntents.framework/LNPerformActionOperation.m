@interface LNPerformActionOperation
- (BOOL)hasValidConnection;
- (BOOL)requestCancelTimeoutAndReturnError:(id *)a3;
- (BOOL)requestExtendTimeoutAndReturnError:(id *)a3;
- (LNAction)action;
- (LNActionExecutorOptions)options;
- (LNConnectionClientInterface)client;
- (LNPerformActionOperation)initWithAction:(id)a3 options:(id)a4 client:(id)a5 completionHandler:(id)a6;
- (LNPerformActionOperationDelegate)delegate;
- (LNSuccessResult)result;
- (NSProgress)progress;
- (NSUUID)identifier;
- (id)completionHandler;
- (int64_t)connectionIdentifier;
- (void)finishWithError:(id)a3;
- (void)requestActionConfirmation:(id)a3 completionHandler:(id)a4;
- (void)requestContinueInApp:(id)a3 completionHandler:(id)a4;
- (void)requestOpenURL:(id)a3 completionHandler:(id)a4;
- (void)requestParameterConfirmation:(id)a3 completionHandler:(id)a4;
- (void)requestParameterDisambiguation:(id)a3 completionHandler:(id)a4;
- (void)requestParameterNeedsValue:(id)a3 completionHandler:(id)a4;
- (void)requestViewSnippetEnvironmentWithCompletionHandler:(id)a3;
- (void)setAction:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProgress:(id)a3;
- (void)setResult:(id)a3;
- (void)start;
@end

@implementation LNPerformActionOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
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

- (void)setDelegate:(id)a3
{
}

- (LNPerformActionOperationDelegate)delegate
{
  return self->_delegate;
}

- (LNConnectionClientInterface)client
{
  return self->_client;
}

- (LNActionExecutorOptions)options
{
  return self->_options;
}

- (void)setAction:(id)a3
{
}

- (LNAction)action
{
  return self->_action;
}

- (BOOL)hasValidConnection
{
  return self->_hasValidConnection;
}

- (int64_t)connectionIdentifier
{
  return self->_connectionIdentifier;
}

- (void)requestOpenURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNPerformActionOperation *)self client];
  [v8 requestOpenURL:v7 completionHandler:v6];
}

- (void)requestContinueInApp:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNPerformActionOperation *)self client];
  [v8 requestContinueInApp:v7 completionHandler:v6];
}

- (BOOL)requestExtendTimeoutAndReturnError:(id *)a3
{
  v4 = [(LNPerformActionOperation *)self client];
  [v4 requestExtendTimeout];

  if (a3) {
    *a3 = 0;
  }
  return 1;
}

- (BOOL)requestCancelTimeoutAndReturnError:(id *)a3
{
  v4 = [(LNPerformActionOperation *)self client];
  [v4 requestCancelTimeout];

  if (a3) {
    *a3 = 0;
  }
  return 1;
}

- (void)requestViewSnippetEnvironmentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(LNPerformActionOperation *)self client];
  [v5 requestViewSnippetEnvironmentWithCompletion:v4];
}

- (void)requestActionConfirmation:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNPerformActionOperation *)self client];
  [v8 requestActionConfirmation:v7 completionHandler:v6];
}

- (void)requestParameterNeedsValue:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNPerformActionOperation *)self client];
  [v8 requestParameterNeedsValue:v7 completionHandler:v6];
}

- (void)requestParameterDisambiguation:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNPerformActionOperation *)self client];
  [v8 requestParameterDisambiguation:v7 completionHandler:v6];
}

- (void)requestParameterConfirmation:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNPerformActionOperation *)self client];
  [v8 requestParameterConfirmation:v7 completionHandler:v6];
}

- (void)finishWithError:(id)a3
{
  id v10 = a3;
  id v4 = [(LNPerformActionOperation *)self progress];
  [v4 unpublish];

  id v5 = [(LNPerformActionOperation *)self completionHandler];

  if (v5)
  {
    id v6 = [(LNPerformActionOperation *)self completionHandler];
    id v7 = [(LNPerformActionOperation *)self result];
    ((void (**)(void, void *, id))v6)[2](v6, v7, v10);

    [(LNPerformActionOperation *)self setCompletionHandler:0];
  }
  id v8 = [(LNPerformActionOperation *)self delegate];
  v9 = [(LNPerformActionOperation *)self result];
  [v8 performActionOperation:self didFinishWithResult:v9 error:v10];
}

- (void)start
{
  v3 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:1];
  [(LNPerformActionOperation *)self setProgress:v3];

  id v4 = [(LNPerformActionOperation *)self progress];
  [v4 setUserInfoObject:*MEMORY[0x263F51D70] forKey:*MEMORY[0x263F08468]];

  id v5 = [(LNPerformActionOperation *)self progress];
  id v6 = [(LNPerformActionOperation *)self options];
  id v7 = [v6 executionUUID];
  [v5 setUserInfoObject:v7 forKey:*MEMORY[0x263F51D78]];

  id v8 = [(LNPerformActionOperation *)self progress];
  [v8 publish];

  v9 = [(LNPerformActionOperation *)self delegate];
  id v10 = [v9 appContext];
  v11 = [(LNPerformActionOperation *)self action];
  v12 = [(LNPerformActionOperation *)self options];
  v13 = [(LNPerformActionOperation *)self progress];
  v14 = [(LNPerformActionOperation *)self client];
  v15 = [(LNPerformActionOperation *)self delegate];
  v16 = [v15 xpcConnection];
  v17 = v16;
  if (v16) {
    [v16 auditToken];
  }
  else {
    memset(v19, 0, sizeof(v19));
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __33__LNPerformActionOperation_start__block_invoke;
  v18[3] = &unk_264CA8F18;
  v18[4] = self;
  [v10 performAction:v11 options:v12 reportingProgress:v13 delegate:v14 auditToken:v19 completionHandler:v18];
}

void __33__LNPerformActionOperation_start__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setResult:a2];
  [*(id *)(a1 + 32) finishWithError:v6];
}

- (NSUUID)identifier
{
  v2 = [(LNPerformActionOperation *)self options];
  v3 = [v2 executionUUID];

  return (NSUUID *)v3;
}

- (LNPerformActionOperation)initWithAction:(id)a3 options:(id)a4 client:(id)a5 completionHandler:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"LNPerformActionOperation.m", 35, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

    if (v13)
    {
LABEL_3:
      if (v14) {
        goto LABEL_4;
      }
LABEL_10:
      v24 = [MEMORY[0x263F08690] currentHandler];
      [v24 handleFailureInMethod:a2, self, @"LNPerformActionOperation.m", 37, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];

      if (v15) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v23 = [MEMORY[0x263F08690] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"LNPerformActionOperation.m", 36, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];

  if (!v14) {
    goto LABEL_10;
  }
LABEL_4:
  if (v15) {
    goto LABEL_5;
  }
LABEL_11:
  v25 = [MEMORY[0x263F08690] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"LNPerformActionOperation.m", 38, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_5:
  v26.receiver = self;
  v26.super_class = (Class)LNPerformActionOperation;
  v16 = [(LNPerformActionOperation *)&v26 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_options, a4);
    objc_storeStrong((id *)&v17->_action, a3);
    objc_storeStrong((id *)&v17->_client, a5);
    uint64_t v18 = [v15 copy];
    id completionHandler = v17->_completionHandler;
    v17->_id completionHandler = (id)v18;

    v20 = v17;
  }

  return v17;
}

@end