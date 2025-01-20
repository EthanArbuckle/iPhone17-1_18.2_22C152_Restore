@interface LNOpenApplicationConnectionOperation
- (LNOpenApplicationConnectionOperation)initWithPriority:(int64_t)a3 queue:(id)a4 completionHandler:(id)a5;
- (id)completionHandler;
- (void)finishWithActionResponse:(id)a3 error:(id)a4;
- (void)finishWithError:(id)a3;
- (void)setCompletionHandler:(id)a3;
@end

@implementation LNOpenApplicationConnectionOperation

os_activity_t __81__LNOpenApplicationConnectionOperation_initWithPriority_queue_completionHandler___block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1A4419000, "appintents:open app", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v0;
}

- (LNOpenApplicationConnectionOperation)initWithPriority:(int64_t)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"LNOpenApplicationConnectionOperation.m", 28, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v11 = [MEMORY[0x1E4F29128] UUID];
  v18.receiver = self;
  v18.super_class = (Class)LNOpenApplicationConnectionOperation;
  v12 = [(LNConnectionOperation *)&v18 initWithIdentifier:v11 priority:a3 queue:v9 activity:&__block_literal_global_1045];

  if (v12)
  {
    uint64_t v13 = [v10 copy];
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = (id)v13;

    v15 = v12;
  }

  return v12;
}

- (void)finishWithActionResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(LNOpenApplicationConnectionOperation *)self completionHandler];

  if (v8)
  {
    id v9 = [(LNOpenApplicationConnectionOperation *)self completionHandler];
    ((void (**)(void, id, id))v9)[2](v9, v6, v7);

    [(LNOpenApplicationConnectionOperation *)self setCompletionHandler:0];
  }
  v10.receiver = self;
  v10.super_class = (Class)LNOpenApplicationConnectionOperation;
  [(LNConnectionOperation *)&v10 finishWithError:v7];
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(LNOpenApplicationConnectionOperation *)self completionHandler];

  if (v5)
  {
    uint64_t v6 = [(LNConnectionOperation *)self validatingResult:0 error:v4];

    id v7 = [(LNOpenApplicationConnectionOperation *)self completionHandler];
    v7[2](v7, 0, v6);

    [(LNOpenApplicationConnectionOperation *)self setCompletionHandler:0];
    id v4 = (id)v6;
  }
  v8.receiver = self;
  v8.super_class = (Class)LNOpenApplicationConnectionOperation;
  [(LNConnectionOperation *)&v8 finishWithError:v4];
}

@end