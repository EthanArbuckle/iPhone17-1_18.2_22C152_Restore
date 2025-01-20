@interface LNAsyncSequenceReleaseOperation
- (LNAsyncSequenceReference)sequence;
- (LNAsyncSequenceReleaseOperation)initWithConnectionInterface:(id)a3 sequence:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (id)completionHandler;
- (void)finishWithError:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)start;
@end

@implementation LNAsyncSequenceReleaseOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_sequence, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (LNAsyncSequenceReference)sequence
{
  return self->_sequence;
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(LNAsyncSequenceReleaseOperation *)self completionHandler];

  if (v5)
  {
    v6 = [(LNAsyncSequenceReleaseOperation *)self completionHandler];
    ((void (**)(void, id))v6)[2](v6, v4);

    [(LNAsyncSequenceReleaseOperation *)self setCompletionHandler:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)LNAsyncSequenceReleaseOperation;
  [(LNConnectionOperation *)&v7 finishWithError:v4];
}

- (void)start
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)LNAsyncSequenceReleaseOperation;
  [(LNConnectionOperation *)&v8 start];
  v3 = getLNLogCategoryExecution();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(LNAsyncSequenceReleaseOperation *)self sequence];
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_INFO, "Releasing sequence: %@", buf, 0xCu);
  }
  v5 = [(LNInterfaceConnectionOperation *)self connectionInterface];
  v6 = [(LNAsyncSequenceReleaseOperation *)self sequence];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__LNAsyncSequenceReleaseOperation_start__block_invoke;
  v7[3] = &unk_1E5B39828;
  v7[4] = self;
  [v5 releaseAsyncSequence:v6 completionHandler:v7];
}

void __40__LNAsyncSequenceReleaseOperation_start__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  os_activity_scope_enter(v4, &v5);

  [*(id *)(a1 + 32) finishWithError:v3];
  os_activity_scope_leave(&v5);
}

- (LNAsyncSequenceReleaseOperation)initWithConnectionInterface:(id)a3 sequence:(id)a4 queue:(id)a5 completionHandler:(id)a6
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
    [v22 handleFailureInMethod:a2, self, @"LNAsyncSequenceReleaseOperation.m", 29, @"Invalid parameter not satisfying: %@", @"sequence" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"LNAsyncSequenceReleaseOperation.m", 28, @"Invalid parameter not satisfying: %@", @"connectionInterface" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"LNAsyncSequenceReleaseOperation.m", 30, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_4:
  v15 = [MEMORY[0x1E4F29128] UUID];
  v24.receiver = self;
  v24.super_class = (Class)LNAsyncSequenceReleaseOperation;
  v16 = [(LNInterfaceConnectionOperation *)&v24 initWithIdentifier:v15 connectionInterface:v11 priority:1 queue:v13 activity:&__block_literal_global_4844];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_sequence, a4);
    v17 = _Block_copy(v14);
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = v17;

    v19 = v16;
  }

  return v16;
}

os_activity_t __96__LNAsyncSequenceReleaseOperation_initWithConnectionInterface_sequence_queue_completionHandler___block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1A4419000, "appintents:release asyncsequence", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v0;
}

@end