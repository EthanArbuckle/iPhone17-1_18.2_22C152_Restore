@interface DMCJobQueue
- (DMCHangDetectionQueue)executionQueue;
- (DMCJobQueue)init;
- (DMCJobQueue)initWithExecutionQueue:(id)a3;
- (NSString)queueID;
- (OS_dispatch_queue)jobQueue;
- (id)executionQueueAbortCompletionBlock;
- (unsigned)nextJobSequenceNumber;
- (void)dealloc;
- (void)fromFunction:(const char *)a3 enqueueJob:(id)a4;
- (void)jobDidFinishFromFunction:(const char *)a3 jobBlockDescription:(id)a4;
- (void)queueBlock:(id)a3;
- (void)setExecutionQueue:(id)a3;
- (void)setExecutionQueueAbortCompletionBlock:(id)a3;
- (void)setJobQueue:(id)a3;
- (void)setNextJobSequenceNumber:(unsigned int)a3;
- (void)setQueueID:(id)a3;
- (void)waitForEnqueuedJobsToCompleteCompletionBlock:(id)a3;
@end

@implementation DMCJobQueue

- (DMCJobQueue)init
{
  v3 = [[DMCHangDetectionQueue alloc] initWithQoS:-1 hangThreshold:@"Default" owner:30.0];
  v4 = [(DMCJobQueue *)self initWithExecutionQueue:v3];

  return v4;
}

- (DMCJobQueue)initWithExecutionQueue:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DMCJobQueue;
  v6 = [(DMCJobQueue *)&v14 init];
  if (v6)
  {
    atomic_fetch_add(initWithExecutionQueue___queueNumber, 1u);
    v7 = NSString;
    uint64_t v8 = atomic_load((unsigned int *)initWithExecutionQueue___queueNumber);
    uint64_t v9 = objc_msgSend(v7, "stringWithFormat:", @"%d", v8);
    queueID = v6->_queueID;
    v6->_queueID = (NSString *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("DMCJobQueue job queue", 0);
    jobQueue = v6->_jobQueue;
    v6->_jobQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v6->_executionQueue, a3);
    v6->_nextJobSequenceNumber = 0;
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = *DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    queueID = self->_queueID;
    *(_DWORD *)buf = 138543618;
    v7 = queueID;
    __int16 v8 = 2114;
    uint64_t v9 = queueID;
    _os_log_impl(&dword_1A7863000, v3, OS_LOG_TYPE_DEFAULT, "DMCJQ %{public}@ Destroying job queue %{public}@", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)DMCJobQueue;
  [(DMCJobQueue *)&v5 dealloc];
}

- (void)fromFunction:(const char *)a3 enqueueJob:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%u", self->_nextJobSequenceNumber);
  ++self->_nextJobSequenceNumber;
  __int16 v8 = *DMCLogObjects();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    queueID = self->_queueID;
    *(_DWORD *)buf = 138543874;
    v18 = queueID;
    __int16 v19 = 2114;
    v20 = v7;
    __int16 v21 = 2082;
    v22 = a3;
    _os_log_impl(&dword_1A7863000, v8, OS_LOG_TYPE_DEFAULT, "DMCJQ %{public}@ Enqueueing jobBlock %{public}@, calling function %{public}s", buf, 0x20u);
  }
  uint64_t v10 = [(DMCJobQueue *)self jobQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__DMCJobQueue_fromFunction_enqueueJob___block_invoke;
  block[3] = &unk_1E5CFDE20;
  block[4] = self;
  id v14 = v7;
  id v15 = v6;
  v16 = a3;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(v10, block);
}

void __39__DMCJobQueue_fromFunction_enqueueJob___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) jobQueue];
  dispatch_suspend(v2);

  v3 = *DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 32);
    uint64_t v6 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138543874;
    uint64_t v15 = v5;
    __int16 v16 = 2114;
    uint64_t v17 = v4;
    __int16 v18 = 2082;
    uint64_t v19 = v6;
    _os_log_impl(&dword_1A7863000, v3, OS_LOG_TYPE_DEFAULT, "DMCJQ %{public}@ Dispatching to executionQueue jobBlock %{public}@ - %{public}s", buf, 0x20u);
  }
  v7 = [*(id *)(a1 + 32) executionQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__DMCJobQueue_fromFunction_enqueueJob___block_invoke_11;
  v11[3] = &unk_1E5CFDE20;
  __int16 v8 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v8;
  long long v10 = *(_OWORD *)(a1 + 48);
  id v9 = (id)v10;
  long long v13 = v10;
  [v7 queueBlock:v11];
}

void __39__DMCJobQueue_fromFunction_enqueueJob___block_invoke_11(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = *DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = *(void *)(a1[4] + 32);
    uint64_t v5 = a1[7];
    *(_DWORD *)buf = 138543874;
    uint64_t v13 = v4;
    __int16 v14 = 2114;
    uint64_t v15 = v3;
    __int16 v16 = 2082;
    uint64_t v17 = v5;
    _os_log_impl(&dword_1A7863000, v2, OS_LOG_TYPE_DEFAULT, "DMCJQ %{public}@ Executing jobBlock %{public}@ - %{public}s", buf, 0x20u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__DMCJobQueue_fromFunction_enqueueJob___block_invoke_12;
  v9[3] = &unk_1E5CFDDF8;
  uint64_t v7 = a1[6];
  uint64_t v6 = a1[7];
  __int16 v8 = (void *)a1[5];
  v9[4] = a1[4];
  uint64_t v11 = v6;
  id v10 = v8;
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);
}

uint64_t __39__DMCJobQueue_fromFunction_enqueueJob___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) jobDidFinishFromFunction:*(void *)(a1 + 48) jobBlockDescription:*(void *)(a1 + 40)];
}

- (void)jobDidFinishFromFunction:(const char *)a3 jobBlockDescription:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = *DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    queueID = self->_queueID;
    int v9 = 138543874;
    id v10 = queueID;
    __int16 v11 = 2114;
    id v12 = v6;
    __int16 v13 = 2082;
    __int16 v14 = a3;
    _os_log_impl(&dword_1A7863000, v7, OS_LOG_TYPE_DEFAULT, "DMCJQ %{public}@ JobBlock %{public}@ finished, calling function %{public}s", (uint8_t *)&v9, 0x20u);
  }
  dispatch_resume((dispatch_object_t)self->_jobQueue);
}

- (void)queueBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(DMCJobQueue *)self executionQueue];
  [v5 queueBlock:v4];
}

- (void)waitForEnqueuedJobsToCompleteCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(DMCJobQueue *)self jobQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__DMCJobQueue_waitForEnqueuedJobsToCompleteCompletionBlock___block_invoke;
  v7[3] = &unk_1E5CFD8D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__DMCJobQueue_waitForEnqueuedJobsToCompleteCompletionBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) jobQueue];
  dispatch_suspend(v2);

  uint64_t v3 = [*(id *)(a1 + 32) executionQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__DMCJobQueue_waitForEnqueuedJobsToCompleteCompletionBlock___block_invoke_2;
  v5[3] = &unk_1E5CFDE48;
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 queueBlock:v5];
}

void __60__DMCJobQueue_waitForEnqueuedJobsToCompleteCompletionBlock___block_invoke_2(uint64_t a1)
{
  v2 = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__DMCJobQueue_waitForEnqueuedJobsToCompleteCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E5CFDE48;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __60__DMCJobQueue_waitForEnqueuedJobsToCompleteCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = [*(id *)(a1 + 32) jobQueue];
  dispatch_resume(v3);
}

- (DMCHangDetectionQueue)executionQueue
{
  return self->_executionQueue;
}

- (void)setExecutionQueue:(id)a3
{
}

- (OS_dispatch_queue)jobQueue
{
  return self->_jobQueue;
}

- (void)setJobQueue:(id)a3
{
}

- (NSString)queueID
{
  return self->_queueID;
}

- (void)setQueueID:(id)a3
{
}

- (unsigned)nextJobSequenceNumber
{
  return self->_nextJobSequenceNumber;
}

- (void)setNextJobSequenceNumber:(unsigned int)a3
{
  self->_nextJobSequenceNumber = a3;
}

- (id)executionQueueAbortCompletionBlock
{
  return self->_executionQueueAbortCompletionBlock;
}

- (void)setExecutionQueueAbortCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_executionQueueAbortCompletionBlock, 0);
  objc_storeStrong((id *)&self->_queueID, 0);
  objc_storeStrong((id *)&self->_jobQueue, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
}

@end