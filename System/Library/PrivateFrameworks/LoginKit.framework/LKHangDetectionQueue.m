@interface LKHangDetectionQueue
- (LKBacktraceLogger)backtraceLogger;
- (LKHangDetectionQueue)init;
- (LKHangDetectionQueue)initWithQoS:(unsigned int)a3 hangThreshold:(double)a4;
- (NSArray)lastPrintedCallStack;
- (OS_dispatch_queue)logQueue;
- (OS_dispatch_queue)workerQueue;
- (double)threshold;
- (void)queueBlock:(id)a3;
- (void)setBacktraceLogger:(id)a3;
- (void)setLastPrintedCallStack:(id)a3;
- (void)setLogQueue:(id)a3;
- (void)setThreshold:(double)a3;
- (void)setWorkerQueue:(id)a3;
@end

@implementation LKHangDetectionQueue

- (LKHangDetectionQueue)init
{
  return [(LKHangDetectionQueue *)self initWithQoS:21 hangThreshold:5.0];
}

- (LKHangDetectionQueue)initWithQoS:(unsigned int)a3 hangThreshold:(double)a4
{
  v15.receiver = self;
  v15.super_class = (Class)LKHangDetectionQueue;
  v6 = [(LKHangDetectionQueue *)&v15 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a3, -1);
    dispatch_queue_t v8 = dispatch_queue_create("lk_hang_detection_worker_queue", v7);
    workerQueue = v6->_workerQueue;
    v6->_workerQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("lk_hang_detection_log_queue", 0);
    logQueue = v6->_logQueue;
    v6->_logQueue = (OS_dispatch_queue *)v10;

    v6->_threshold = a4;
    uint64_t v12 = objc_opt_new();
    backtraceLogger = v6->_backtraceLogger;
    v6->_backtraceLogger = (LKBacktraceLogger *)v12;
  }
  return v6;
}

- (void)queueBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[LKPlatformSupport isInternalBuild];
  BOOL v6 = v5;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  if (v5)
  {
    [(LKHangDetectionQueue *)self threshold];
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    v9 = [(LKHangDetectionQueue *)self logQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__LKHangDetectionQueue_queueBlock___block_invoke;
    block[3] = &unk_2645FC430;
    block[4] = self;
    block[5] = v17;
    dispatch_after(v8, v9, block);
  }
  dispatch_queue_t v10 = [(LKHangDetectionQueue *)self workerQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __35__LKHangDetectionQueue_queueBlock___block_invoke_4;
  v12[3] = &unk_2645FC480;
  BOOL v15 = v6;
  v12[4] = self;
  id v13 = v4;
  v14 = v17;
  id v11 = v4;
  dispatch_async(v10, v12);

  _Block_object_dispose(v17, 8);
}

void __35__LKHangDetectionQueue_queueBlock___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_2221A9000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "LKHangDetectionQueue: task timed out", (uint8_t *)&v7, 2u);
    }
    v2 = [*(id *)(a1 + 32) backtraceLogger];
    v3 = [v2 getBacktraceFromTrackedThread];

    id v4 = [*(id *)(a1 + 32) lastPrintedCallStack];
    char v5 = [v3 isEqualToArray:v4];

    if ((v5 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        [*(id *)(a1 + 32) threshold];
        int v7 = 134218242;
        uint64_t v8 = v6;
        __int16 v9 = 2112;
        dispatch_queue_t v10 = v3;
        _os_log_impl(&dword_2221A9000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Queue was blocked for more than %.1f seconds. Call stack:\n%@", (uint8_t *)&v7, 0x16u);
      }
      [*(id *)(a1 + 32) setLastPrintedCallStack:v3];
    }
  }
}

void __35__LKHangDetectionQueue_queueBlock___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    v2 = [*(id *)(a1 + 32) logQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__LKHangDetectionQueue_queueBlock___block_invoke_2;
    block[3] = &unk_2645FC458;
    block[4] = *(void *)(a1 + 32);
    dispatch_sync(v2, block);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  if (*(unsigned char *)(a1 + 56))
  {
    id v4 = [*(id *)(a1 + 32) logQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __35__LKHangDetectionQueue_queueBlock___block_invoke_3;
    v6[3] = &unk_2645FC430;
    uint64_t v5 = *(void *)(a1 + 48);
    v6[4] = *(void *)(a1 + 32);
    v6[5] = v5;
    dispatch_async(v4, v6);
  }
}

void __35__LKHangDetectionQueue_queueBlock___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) backtraceLogger];
  [v1 trackCurrentThread];
}

uint64_t __35__LKHangDetectionQueue_queueBlock___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return [*(id *)(a1 + 32) setLastPrintedCallStack:0];
}

- (OS_dispatch_queue)workerQueue
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

- (LKBacktraceLogger)backtraceLogger
{
  return self->_backtraceLogger;
}

- (void)setBacktraceLogger:(id)a3
{
}

- (NSArray)lastPrintedCallStack
{
  return self->_lastPrintedCallStack;
}

- (void)setLastPrintedCallStack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPrintedCallStack, 0);
  objc_storeStrong((id *)&self->_backtraceLogger, 0);
  objc_storeStrong((id *)&self->_logQueue, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
}

@end