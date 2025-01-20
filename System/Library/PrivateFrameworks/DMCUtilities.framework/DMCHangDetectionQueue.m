@interface DMCHangDetectionQueue
- (BOOL)shouldDumpStackshot;
- (BOOL)verboseLogEnabled;
- (DMCBacktraceLogger)logger;
- (DMCHangDetectionQueue)init;
- (DMCHangDetectionQueue)initWithQoS:(int64_t)a3 hangThreshold:(double)a4 owner:(id)a5;
- (NSOperationQueue)workerQueue;
- (NSString)owner;
- (OS_dispatch_queue)logQueue;
- (double)threshold;
- (int)blockNum;
- (int)lastExecutedJob;
- (void)queueBlock:(id)a3;
- (void)setBlockNum:(int)a3;
- (void)setLastExecutedJob:(int)a3;
- (void)setLogQueue:(id)a3;
- (void)setLogger:(id)a3;
- (void)setOwner:(id)a3;
- (void)setShouldDumpStackshot:(BOOL)a3;
- (void)setThreshold:(double)a3;
- (void)setVerboseLogEnabled:(BOOL)a3;
- (void)setWorkerQueue:(id)a3;
- (void)waitUntilAllBlocksAreFinished;
@end

@implementation DMCHangDetectionQueue

- (DMCHangDetectionQueue)init
{
  return [(DMCHangDetectionQueue *)self initWithQoS:-1 hangThreshold:@"Unknown" owner:30.0];
}

- (DMCHangDetectionQueue)initWithQoS:(int64_t)a3 hangThreshold:(double)a4 owner:(id)a5
{
  id v8 = a5;
  v22.receiver = self;
  v22.super_class = (Class)DMCHangDetectionQueue;
  v9 = [(DMCHangDetectionQueue *)&v22 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, -1);
    uint64_t v11 = objc_opt_new();
    workerQueue = v9->_workerQueue;
    v9->_workerQueue = (NSOperationQueue *)v11;

    [(NSOperationQueue *)v9->_workerQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v9->_workerQueue setQualityOfService:a3];
    v13 = [v8 stringByAppendingString:@"_hang_detection_worker_queue"];
    [(NSOperationQueue *)v9->_workerQueue setName:v13];

    id v14 = [v8 stringByAppendingString:@"_hang_detection_log_queue"];
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], v10);
    logQueue = v9->_logQueue;
    v9->_logQueue = (OS_dispatch_queue *)v15;

    v9->_threshold = a4;
    uint64_t v17 = [v8 copy];
    owner = v9->_owner;
    v9->_owner = (NSString *)v17;

    uint64_t v19 = objc_opt_new();
    logger = v9->_logger;
    v9->_logger = (DMCBacktraceLogger *)v19;

    v9->_shouldDumpStackshot = 1;
    v9->_lastExecutedJob = -1;
    atomic_store(0xFFFFFFFF, (unsigned int *)&v9->_blockNum);
  }
  return v9;
}

- (void)queueBlock:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  atomic_fetch_add(&self->_blockNum, 1u);
  unsigned int v5 = atomic_load((unsigned int *)&self->_blockNum);
  if (queueBlock__onceToken != -1) {
    dispatch_once(&queueBlock__onceToken, &__block_literal_global_8);
  }
  int v6 = queueBlock__isInternal;
  BOOL v7 = [(DMCHangDetectionQueue *)self shouldDumpStackshot];
  if (v6) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = 0;
  }
  BOOL v9 = [(DMCHangDetectionQueue *)self verboseLogEnabled];
  BOOL v10 = v9;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  char v33 = 0;
  if (v8 || (id v11 = 0, v9))
  {
    id v11 = +[DMCBacktraceLogger callerOfCurrentMethod];
    if (v10)
    {
      v12 = (id)*DMCLogObjects();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = [(DMCHangDetectionQueue *)self owner];
        *(_DWORD *)buf = 138543874;
        v35 = v13;
        __int16 v36 = 1024;
        unsigned int v37 = v5;
        __int16 v38 = 2114;
        id v39 = v11;
        _os_log_impl(&dword_1A7863000, v12, OS_LOG_TYPE_DEBUG, "DMCHangDetectionQueue (%{public}@) queueing task %d from: %{public}@", buf, 0x1Cu);
      }
    }
    if (v8)
    {
      [(DMCHangDetectionQueue *)self threshold];
      if (v14 > 0.0)
      {
        [(DMCHangDetectionQueue *)self threshold];
        dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
        uint64_t v17 = [(DMCHangDetectionQueue *)self logQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __36__DMCHangDetectionQueue_queueBlock___block_invoke_10;
        block[3] = &unk_1E5CFDBE8;
        v30 = v32;
        block[4] = self;
        unsigned int v31 = v5;
        id v11 = v11;
        id v29 = v11;
        dispatch_after(v16, v17, block);
      }
    }
  }
  v18 = [(DMCHangDetectionQueue *)self workerQueue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __36__DMCHangDetectionQueue_queueBlock___block_invoke_17;
  v21[3] = &unk_1E5CFDC38;
  BOOL v26 = v8;
  v21[4] = self;
  id v19 = v4;
  id v23 = v19;
  BOOL v27 = v10;
  unsigned int v25 = v5;
  id v20 = v11;
  id v22 = v20;
  v24 = v32;
  [v18 addOperationWithBlock:v21];

  _Block_object_dispose(v32, 8);
}

BOOL __36__DMCHangDetectionQueue_queueBlock___block_invoke()
{
  BOOL result = +[DMCFeatureFlags isAppleInternal];
  queueBlock__isInternal = result;
  return result;
}

void __36__DMCHangDetectionQueue_queueBlock___block_invoke_10(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && *(_DWORD *)(*(void *)(a1 + 32) + 12) + 1 == *(_DWORD *)(a1 + 56))
  {
    if (+[DMCFeatureFlags isAppleInternal])
    {
      v2 = [*(id *)(*(void *)(a1 + 32) + 56) getBacktraceFromTrackedThread];
      v3 = *DMCLogObjects();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        id v4 = *(void **)(a1 + 32);
        unsigned int v5 = v3;
        int v6 = [v4 owner];
        [*(id *)(a1 + 32) threshold];
        int v8 = *(_DWORD *)(a1 + 56);
        BOOL v9 = @"<None>";
        uint64_t v10 = *(void *)(a1 + 40);
        if (v2) {
          BOOL v9 = v2;
        }
        int v21 = 138544386;
        id v22 = v6;
        __int16 v23 = 2048;
        uint64_t v24 = v7;
        __int16 v25 = 1024;
        int v26 = v8;
        __int16 v27 = 2114;
        uint64_t v28 = v10;
        __int16 v29 = 2114;
        v30 = v9;
        _os_log_impl(&dword_1A7863000, v5, OS_LOG_TYPE_FAULT, "DMCHangDetectionQueue (%{public}@) was blocked for more than %.1f seconds. Queued task: %d %{public}@. Callstack: %{public}@", (uint8_t *)&v21, 0x30u);
      }
    }
    else
    {
      id v11 = *DMCLogObjects();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = *(void **)(a1 + 32);
        v13 = v11;
        double v14 = [v12 owner];
        [*(id *)(a1 + 32) threshold];
        int v15 = *(_DWORD *)(a1 + 56);
        uint64_t v16 = *(void *)(a1 + 40);
        int v21 = 138544130;
        id v22 = v14;
        __int16 v23 = 2048;
        uint64_t v24 = v17;
        __int16 v25 = 1024;
        int v26 = v15;
        __int16 v27 = 2114;
        uint64_t v28 = v16;
        _os_log_impl(&dword_1A7863000, v13, OS_LOG_TYPE_ERROR, "DMCHangDetectionQueue (%{public}@) was blocked for more than %.1f seconds. Queued task: %d %{public}@", (uint8_t *)&v21, 0x26u);
      }
      v2 = 0;
    }
    v18 = [*(id *)(a1 + 32) owner];
    id v19 = [v18 stringByAppendingString:@"_queue_latestStackshot.ips"];

    id v20 = DMCHangTracerDirectory();
    +[DMCBacktraceLogger dumpStackshotToPath:v20 fileName:v19];
  }
}

void __36__DMCHangDetectionQueue_queueBlock___block_invoke_17(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (+[DMCFeatureFlags isAppleInternal] && *(unsigned char *)(a1 + 68)) {
    [*(id *)(*(void *)(a1 + 32) + 56) trackCurrentThread];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (*(unsigned char *)(a1 + 69))
  {
    v2 = *DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(void **)(a1 + 32);
      id v4 = v2;
      unsigned int v5 = [v3 owner];
      int v6 = *(_DWORD *)(a1 + 64);
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      int v15 = v5;
      __int16 v16 = 1024;
      int v17 = v6;
      __int16 v18 = 2114;
      uint64_t v19 = v7;
      _os_log_impl(&dword_1A7863000, v4, OS_LOG_TYPE_DEBUG, "DMCHangDetectionQueue (%{public}@) done executing task %d from: %{public}@", buf, 0x1Cu);
    }
  }
  int v8 = [*(id *)(a1 + 32) logQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__DMCHangDetectionQueue_queueBlock___block_invoke_18;
  block[3] = &unk_1E5CFDC10;
  char v13 = *(unsigned char *)(a1 + 68);
  uint64_t v9 = *(void *)(a1 + 32);
  int v12 = *(_DWORD *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 56);
  block[4] = v9;
  void block[5] = v10;
  dispatch_async(v8, block);
}

uint64_t __36__DMCHangDetectionQueue_queueBlock___block_invoke_18(uint64_t result)
{
  if (*(unsigned char *)(result + 52))
  {
    *(_DWORD *)(*(void *)(result + 32) + 12) = *(_DWORD *)(result + 48);
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)shouldDumpStackshot
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(DMCHangDetectionQueue *)self logQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__DMCHangDetectionQueue_shouldDumpStackshot__block_invoke;
  v5[3] = &unk_1E5CFDC60;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_async_and_wait(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __44__DMCHangDetectionQueue_shouldDumpStackshot__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)setShouldDumpStackshot:(BOOL)a3
{
  unsigned int v5 = [(DMCHangDetectionQueue *)self logQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__DMCHangDetectionQueue_setShouldDumpStackshot___block_invoke;
  v6[3] = &unk_1E5CFDC88;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __48__DMCHangDetectionQueue_setShouldDumpStackshot___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)verboseLogEnabled
{
  v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(DMCHangDetectionQueue *)self logQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__DMCHangDetectionQueue_verboseLogEnabled__block_invoke;
  v5[3] = &unk_1E5CFDC60;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_async_and_wait(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __42__DMCHangDetectionQueue_verboseLogEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 9);
  return result;
}

- (void)setVerboseLogEnabled:(BOOL)a3
{
  unsigned int v5 = [(DMCHangDetectionQueue *)self logQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__DMCHangDetectionQueue_setVerboseLogEnabled___block_invoke;
  v6[3] = &unk_1E5CFDC88;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __46__DMCHangDetectionQueue_setVerboseLogEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 9) = *(unsigned char *)(result + 40);
  return result;
}

- (void)waitUntilAllBlocksAreFinished
{
  id v2 = [(DMCHangDetectionQueue *)self workerQueue];
  [v2 waitUntilAllOperationsAreFinished];
}

- (NSString)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
}

- (NSOperationQueue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (OS_dispatch_queue)logQueue
{
  return self->_logQueue;
}

- (void)setLogQueue:(id)a3
{
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_threshold = a3;
}

- (int)lastExecutedJob
{
  return self->_lastExecutedJob;
}

- (void)setLastExecutedJob:(int)a3
{
  self->_lastExecutedJob = a3;
}

- (int)blockNum
{
  return atomic_load((unsigned int *)&self->_blockNum);
}

- (void)setBlockNum:(int)a3
{
}

- (DMCBacktraceLogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_logQueue, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_owner, 0);
}

@end