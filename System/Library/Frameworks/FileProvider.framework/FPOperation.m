@interface FPOperation
- (BOOL)_finishIfCancelled;
- (BOOL)finishIfCancelled;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (FPCancellable)remoteOperation;
- (FPOperation)init;
- (OS_dispatch_queue)callbackQueue;
- (id)description;
- (id)finishedBlock;
- (id)operationDescription;
- (void)_setExecuting:(BOOL)a3;
- (void)_setFinished:(BOOL)a3;
- (void)_setRemoteCancellationHandler:(id)a3;
- (void)cancel;
- (void)completedWithResult:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)resetRemoteOperation;
- (void)setCallbackQueue:(id)a3;
- (void)setCancellationHandler:(id)a3;
- (void)setFinishedBlock:(id)a3;
- (void)setRemoteOperation:(id)a3;
- (void)start;
@end

@implementation FPOperation

- (BOOL)isExecuting
{
  return self->_executionTransaction != 0;
}

- (BOOL)isFinished
{
  return self->_finished;
}

uint64_t __41__FPOperation_completedWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) _finishIfCancelled];
  if ((result & 1) == 0)
  {
    v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1A33AE000, v3, OS_LOG_TYPE_INFO, "[INFO] finishing %@", (uint8_t *)&v5, 0xCu);
    }

    return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  }
  return result;
}

uint64_t __20__FPOperation_start__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A33AE000, v2, OS_LOG_TYPE_INFO, "[INFO] Starting %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) _setExecuting:1];
  uint64_t result = [*(id *)(a1 + 32) _finishIfCancelled];
  if ((result & 1) == 0) {
    return [*(id *)(a1 + 32) main];
  }
  return result;
}

- (BOOL)_finishIfCancelled
{
  if (self->_finished)
  {
LABEL_2:
    LOBYTE(v2) = 1;
    return v2;
  }
  if (self->_executionTransaction)
  {
    int v2 = [(FPOperation *)self isCancelled];
    if (!v2) {
      return v2;
    }
    uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    [(FPOperation *)self finishWithResult:0 error:v4];

    goto LABEL_2;
  }
  LOBYTE(v2) = 0;
  return v2;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(FPOperation *)self finishedBlock];
  v8 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v9, v6);
    [(FPOperation *)self setFinishedBlock:0];
  }

  [(FPOperation *)self _setExecuting:0];
  [(FPOperation *)self _setFinished:1];
  [(FPOperation *)self _setRemoteCancellationHandler:0];
}

- (void)setFinishedBlock:(id)a3
{
}

- (void)_setExecuting:(BOOL)a3
{
  if ((((self->_executionTransaction == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    [(FPOperation *)self willChangeValueForKey:@"isExecuting"];
    if (v3) {
      int v5 = (void *)os_transaction_create();
    }
    else {
      int v5 = 0;
    }
    id executionTransaction = self->_executionTransaction;
    self->_id executionTransaction = v5;

    [(FPOperation *)self didChangeValueForKey:@"isExecuting"];
  }
}

- (id)finishedBlock
{
  return objc_getProperty(self, a2, 296, 1);
}

- (void)_setRemoteCancellationHandler:(id)a3
{
  id v5 = a3;
  remoteOperation = self->_remoteOperation;
  if (v5 && remoteOperation)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"FPOperation.m" lineNumber:219 description:&stru_1EF68D1F8];

    remoteOperation = self->_remoteOperation;
  }
  [(FPCancellable *)remoteOperation cancel];
  if (self->_finished)
  {
    if (!v5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  char v7 = [(FPOperation *)self isCancelled];
  if (v5 && (v7 & 1) != 0)
  {
LABEL_9:
    [v5 cancel];

    id v5 = 0;
  }
LABEL_10:
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__FPOperation__setRemoteCancellationHandler___block_invoke;
  v11[3] = &unk_1E5AF1240;
  v11[4] = self;
  v8 = [v5 remoteObjectProxyWithErrorHandler:v11];
  id v9 = self->_remoteOperation;
  self->_remoteOperation = v8;
}

- (void)_setFinished:(BOOL)a3
{
  if (self->_finished != a3)
  {
    [(FPOperation *)self willChangeValueForKey:@"isFinished"];
    self->_finished = a3;
    [(FPOperation *)self didChangeValueForKey:@"isFinished"];
  }
}

- (void)dealloc
{
  if (self->_executionTransaction)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"FPOperation.m" lineNumber:84 description:&stru_1EF68D1F8];
  }
  [(FPOperation *)self setCallbackQueue:0];
  v5.receiver = self;
  v5.super_class = (Class)FPOperation;
  [(FPOperation *)&v5 dealloc];
}

- (void)setCallbackQueue:(id)a3
{
  uint64_t v4 = (OS_dispatch_queue *)a3;
  queue = self->_queue;
  if (queue) {
    dispatch_activate(queue);
  }
  id v6 = self->_queue;
  self->_queue = v4;
}

- (FPOperation)init
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  memset(out, 0, 37);
  v15.receiver = self;
  v15.super_class = (Class)FPOperation;
  int v2 = [(FPOperation *)&v15 init];
  if (v2)
  {
    BOOL v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v2;
      _os_log_impl(&dword_1A33AE000, v3, OS_LOG_TYPE_INFO, "[INFO] creating %@", buf, 0xCu);
    }

    MEMORY[0x1A6249180](v2->_uuid);
    uuid_unparse_upper(v2->_uuid, out);
    uint64_t v4 = [NSString stringWithUTF8String:out];
    objc_super v5 = [v4 componentsSeparatedByString:@"-"];
    id v6 = [v5 objectAtIndexedSubscript:0];
    [(FPOperation *)v2 setName:v6];

    id v7 = [(FPOperation *)v2 name];
    v8 = (const char *)[v7 UTF8String];
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UNSPECIFIED, 0);
    v11 = dispatch_queue_attr_make_initially_inactive(v10);
    dispatch_queue_t v12 = dispatch_queue_create(v8, v11);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v12;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishedBlock, 0);
  objc_storeStrong(&self->_executionTransaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_remoteOperation, 0);
}

- (void)start
{
  dispatch_activate((dispatch_object_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __20__FPOperation_start__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)completedWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__FPOperation_completedWithResult_error___block_invoke;
  block[3] = &unk_1E5AF17D0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (BOOL)finishIfCancelled
{
  int v3 = [(FPOperation *)self isCancelled];
  if (v3)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__FPOperation_finishIfCancelled__block_invoke;
    block[3] = &unk_1E5AF0FF0;
    block[4] = self;
    dispatch_async(queue, block);
  }
  return v3;
}

- (id)operationDescription
{
  return @" ";
}

- (id)description
{
  int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(FPOperation *)self name];
  id v6 = [(FPOperation *)self operationDescription];
  id v7 = [(FPOperation *)self operationDescription];
  int v8 = [v7 hasSuffix:@" "];
  if ([(FPOperation *)self isExecuting])
  {
    id v9 = @"executing";
  }
  else
  {
    BOOL v10 = [(FPOperation *)self isFinished];
    id v9 = @"idle";
    if (v10) {
      id v9 = @"finished";
    }
  }
  v11 = &stru_1EF68D1F8;
  if (v8) {
    id v12 = &stru_1EF68D1F8;
  }
  else {
    id v12 = @" ";
  }
  if (v5) {
    v11 = v5;
  }
  id v13 = [v3 stringWithFormat:@"<%@: %p, %@ %@%@%@>", v4, self, v11, v6, v12, v9];

  return v13;
}

- (void)cancel
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] cancelling %@", (uint8_t *)&v2, 0xCu);
}

uint64_t __21__FPOperation_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setRemoteCancellationHandler:0];
  int v2 = *(void **)(a1 + 32);

  return [v2 _finishIfCancelled];
}

uint64_t __32__FPOperation_finishIfCancelled__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishIfCancelled];
}

- (void)resetRemoteOperation
{
  self->_remoteOperation = 0;
  MEMORY[0x1F41817F8]();
}

uint64_t __45__FPOperation__setRemoteCancellationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:a2];
}

- (void)setCancellationHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__FPOperation_setCancellationHandler___block_invoke;
  v7[3] = &unk_1E5AF0748;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __38__FPOperation_setCancellationHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setRemoteCancellationHandler:*(void *)(a1 + 40)];
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_queue;
}

- (FPCancellable)remoteOperation
{
  return self->_remoteOperation;
}

- (void)setRemoteOperation:(id)a3
{
}

@end