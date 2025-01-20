@interface MLTask
- (BOOL)_canCancel;
- (BOOL)_canComplete;
- (BOOL)_canFail;
- (BOOL)_canResume;
- (BOOL)_canSuspend;
- (MLTask)initWithState:(int64_t)a3;
- (MLTaskState)state;
- (NSError)error;
- (NSString)taskIdentifier;
- (OS_dispatch_queue)syncQueue;
- (id)taskStatesToString:(int64_t)a3;
- (void)_resumeWithTaskContext:(id)a3;
- (void)cancel;
- (void)completeWithTaskContext:(id)a3;
- (void)failWithError:(id)a3 taskContext:(id)a4;
- (void)resume;
- (void)setError:(id)a3;
- (void)setState:(int64_t)a3;
- (void)suspendWithTaskContext:(id)a3;
@end

@implementation MLTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_taskIdentifier, 0);
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (MLTaskState)state
{
  return self->_state;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (id)taskStatesToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 3) {
    return @"Task Suspended";
  }
  else {
    return off_1E59A5370[a3 - 2];
  }
}

- (void)failWithError:(id)a3 taskContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v8 = [(MLTask *)self syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MLTask_failWithError_taskContext___block_invoke;
  block[3] = &unk_1E59A5350;
  block[4] = self;
  id v9 = v6;
  id v11 = v9;
  v12 = &v13;
  dispatch_sync(v8, block);

  if (*((unsigned char *)v14 + 24)) {
    [(MLTask *)self onFailureWithTaskContext:v7];
  }

  _Block_object_dispose(&v13, 8);
}

uint64_t __36__MLTask_failWithError_taskContext___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _canFail];
  if (result)
  {
    [*(id *)(a1 + 32) setError:*(void *)(a1 + 40)];
    uint64_t result = [*(id *)(a1 + 32) setState:5];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)completeWithTaskContext:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v5 = [(MLTask *)self syncQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__MLTask_completeWithTaskContext___block_invoke;
  v6[3] = &unk_1E59A5300;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v5, v6);

  if (*((unsigned char *)v8 + 24)) {
    [(MLTask *)self onCompletionWithTaskContext:v4];
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __34__MLTask_completeWithTaskContext___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _canComplete];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) setState:4];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)suspendWithTaskContext:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v5 = [(MLTask *)self syncQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__MLTask_suspendWithTaskContext___block_invoke;
  v6[3] = &unk_1E59A5300;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v5, v6);

  if (*((unsigned char *)v8 + 24)) {
    [(MLTask *)self onSuspensionWithTaskContext:v4];
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __33__MLTask_suspendWithTaskContext___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _canSuspend];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) setState:1];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)cancel
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v3 = [(MLTask *)self syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __16__MLTask_cancel__block_invoke;
  block[3] = &unk_1E59A5300;
  block[4] = self;
  void block[5] = &v7;
  dispatch_sync(v3, block);

  if (*((unsigned char *)v8 + 24))
  {
    [(MLTask *)self onCancellation];
    id v4 = [(MLTask *)self syncQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __16__MLTask_cancel__block_invoke_2;
    v5[3] = &unk_1E59A5328;
    v5[4] = self;
    dispatch_sync(v4, v5);
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __16__MLTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _canCancel];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) setState:3];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __16__MLTask_cancel__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setState:4];
}

- (void)resume
{
}

- (void)_resumeWithTaskContext:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v5 = [(MLTask *)self syncQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__MLTask__resumeWithTaskContext___block_invoke;
  v6[3] = &unk_1E59A5300;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v5, v6);

  if (*((unsigned char *)v8 + 24)) {
    [(MLTask *)self onResumptionWithTaskContext:v4];
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __33__MLTask__resumeWithTaskContext___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _canResume];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) setState:2];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)_canFail
{
  MLTaskState v3 = [(MLTask *)self state];
  if (v3 != MLTaskStateSuspended) {
    LOBYTE(v3) = [(MLTask *)self state] == MLTaskStateRunning;
  }
  return v3;
}

- (BOOL)_canComplete
{
  MLTaskState v3 = [(MLTask *)self state];
  if (v3 != MLTaskStateSuspended) {
    LOBYTE(v3) = [(MLTask *)self state] == MLTaskStateRunning;
  }
  return v3;
}

- (BOOL)_canSuspend
{
  return [(MLTask *)self state] == MLTaskStateRunning;
}

- (BOOL)_canCancel
{
  MLTaskState v3 = [(MLTask *)self state];
  if (v3 != MLTaskStateSuspended) {
    LOBYTE(v3) = [(MLTask *)self state] == MLTaskStateRunning;
  }
  return v3;
}

- (BOOL)_canResume
{
  return [(MLTask *)self state] == MLTaskStateSuspended;
}

- (MLTask)initWithState:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MLTask;
  id v4 = [(MLTask *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_state = a3;
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.coreml.mltask_work_queue", 0);
    syncQueue = v5->_syncQueue;
    v5->_syncQueue = (OS_dispatch_queue *)v6;
  }
  return v5;
}

@end