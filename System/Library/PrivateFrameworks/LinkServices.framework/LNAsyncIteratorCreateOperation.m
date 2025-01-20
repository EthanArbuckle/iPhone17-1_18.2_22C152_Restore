@interface LNAsyncIteratorCreateOperation
- (LNAsyncIteratorCreateOperation)initWithConnectionInterface:(id)a3 sequence:(id)a4 options:(id)a5 queue:(id)a6 completionHandler:(id)a7;
- (LNAsyncIteratorOptions)options;
- (LNAsyncIteratorReference)iteratorReference;
- (LNAsyncSequenceReference)sequence;
- (id)completionHandler;
- (void)finishWithError:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setIteratorReference:(id)a3;
- (void)start;
@end

@implementation LNAsyncIteratorCreateOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_iteratorReference, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_sequence, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setIteratorReference:(id)a3
{
}

- (LNAsyncIteratorReference)iteratorReference
{
  return self->_iteratorReference;
}

- (LNAsyncIteratorOptions)options
{
  return self->_options;
}

- (LNAsyncSequenceReference)sequence
{
  return self->_sequence;
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(LNAsyncIteratorCreateOperation *)self completionHandler];

  if (v5)
  {
    v6 = [(LNAsyncIteratorCreateOperation *)self iteratorReference];
    uint64_t v7 = [(LNConnectionOperation *)self validatingResult:v6 error:v4];

    v8 = [(LNAsyncIteratorCreateOperation *)self completionHandler];
    v9 = [(LNAsyncIteratorCreateOperation *)self iteratorReference];
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v9, v7);

    [(LNAsyncIteratorCreateOperation *)self setCompletionHandler:0];
    id v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNAsyncIteratorCreateOperation;
  [(LNConnectionOperation *)&v10 finishWithError:v4];
}

- (void)start
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)LNAsyncIteratorCreateOperation;
  [(LNConnectionOperation *)&v10 start];
  v3 = getLNLogCategoryExecution();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(LNAsyncIteratorCreateOperation *)self sequence];
    v5 = [(LNAsyncIteratorCreateOperation *)self options];
    *(_DWORD *)buf = 138412546;
    v12 = v4;
    __int16 v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_INFO, "Creating AsyncIterator for sequence: %@, with options: %@", buf, 0x16u);
  }
  v6 = [(LNInterfaceConnectionOperation *)self connectionInterface];
  uint64_t v7 = [(LNAsyncIteratorCreateOperation *)self sequence];
  v8 = [(LNAsyncIteratorCreateOperation *)self options];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__LNAsyncIteratorCreateOperation_start__block_invoke;
  v9[3] = &unk_1E5B38798;
  v9[4] = self;
  [v6 createAsyncIteratorForSequence:v7 options:v8 completionHandler:v9];
}

void __39__LNAsyncIteratorCreateOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  os_activity_scope_enter(v7, &v8);

  [*(id *)(a1 + 32) setIteratorReference:v5];
  [*(id *)(a1 + 32) finishWithError:v6];
  os_activity_scope_leave(&v8);
}

- (LNAsyncIteratorCreateOperation)initWithConnectionInterface:(id)a3 sequence:(id)a4 options:(id)a5 queue:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"LNAsyncIteratorCreateOperation.m", 31, @"Invalid parameter not satisfying: %@", @"connectionInterface" object file lineNumber description];

    if (v14)
    {
LABEL_3:
      if (v15) {
        goto LABEL_4;
      }
LABEL_10:
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, self, @"LNAsyncIteratorCreateOperation.m", 33, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];

      if (v17) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"LNAsyncIteratorCreateOperation.m", 32, @"Invalid parameter not satisfying: %@", @"sequence" object file lineNumber description];

  if (!v15) {
    goto LABEL_10;
  }
LABEL_4:
  if (v17) {
    goto LABEL_5;
  }
LABEL_11:
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"LNAsyncIteratorCreateOperation.m", 34, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_5:
  v18 = [MEMORY[0x1E4F29128] UUID];
  v28.receiver = self;
  v28.super_class = (Class)LNAsyncIteratorCreateOperation;
  v19 = [(LNInterfaceConnectionOperation *)&v28 initWithIdentifier:v18 connectionInterface:v13 priority:1 queue:v16 activity:&__block_literal_global];

  if (v19)
  {
    objc_storeStrong((id *)&v19->_sequence, a4);
    objc_storeStrong((id *)&v19->_options, a5);
    v20 = _Block_copy(v17);
    id completionHandler = v19->_completionHandler;
    v19->_id completionHandler = v20;

    v22 = v19;
  }

  return v19;
}

os_activity_t __103__LNAsyncIteratorCreateOperation_initWithConnectionInterface_sequence_options_queue_completionHandler___block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1A4419000, "appintents:create asyncsequence iterator", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v0;
}

@end