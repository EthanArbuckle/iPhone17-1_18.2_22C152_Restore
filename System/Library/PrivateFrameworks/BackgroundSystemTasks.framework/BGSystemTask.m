@interface BGSystemTask
+ (id)logger;
- (BGSystemTask)initWithIdentifier:(id)a3;
- (BGSystemTask)initWithIdentifier:(id)a3 queue:(id)a4;
- (BGSystemTaskDelegate)delegate;
- (BOOL)consumedResults:(id)a3 error:(id *)a4;
- (BOOL)eligibleToRun;
- (BOOL)expiring;
- (BOOL)hasPropagatedExpiration;
- (BOOL)hasValidExpirationHandler;
- (BOOL)invalid;
- (BOOL)producedCumulativeResults:(id)a3 error:(id *)a4;
- (BOOL)reportBufferedTaskWorkloadProgress;
- (BOOL)reportCumulativeResultConsumptionWithError:(id *)a3;
- (BOOL)reportTaskWorkloadProgress:(unint64_t)a3 completed:(unint64_t)a4 category:(unint64_t)a5 subCategory:(id)a6 error:(id *)a7;
- (BOOL)resetResultsForIdentifier:(id)a3 error:(id *)a4;
- (BOOL)resultQueue_containsPendingConsumedResults;
- (BOOL)sendTaskWorkloadProgressToPPS:(unint64_t)a3 completed:(unint64_t)a4 category:(unint64_t)a5 subCategory:(id)a6;
- (BOOL)setTaskExpiredWithRetryAfter:(double)a3 error:(id *)a4;
- (BOOL)shouldReportTaskWorkloadProgress:(unint64_t)a3;
- (NSMutableDictionary)runningConsumedResults;
- (NSMutableDictionary)taskProgressInfo;
- (NSString)identifier;
- (NSUUID)uuid;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)resultQueue;
- (OS_os_transaction)transaction;
- (id)clientLedExpirationHandler;
- (id)completionHandler;
- (id)delegate:(id *)a3;
- (id)expirationAckHandler;
- (id)expirationHandler;
- (id)expirationHandlerWithReason;
- (int64_t)state;
- (unint64_t)expirationReason;
- (void)clearLocked;
- (void)handleExpirationWithReason:(unint64_t)a3;
- (void)invokeExpirationHandlerWithReason:(unint64_t)a3;
- (void)prepareForRunning;
- (void)resultQueue_aggregateConsumedResult:(id)a3;
- (void)setClientLedExpirationHandler:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpirationAckHandler:(id)a3;
- (void)setExpirationHandler:(id)a3;
- (void)setExpirationHandlerWithReason:(id)a3;
- (void)setExpirationReason:(unint64_t)a3;
- (void)setHasPropagatedExpiration:(BOOL)a3;
- (void)setResultQueue:(id)a3;
- (void)setRunningConsumedResults:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTaskCompleted;
- (void)setTaskProgressInfo:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation BGSystemTask

- (BGSystemTask)initWithIdentifier:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  id v6 = [v4 stringWithFormat:@"com.apple.BGSystemTask.%@", v5];
  v7 = (const char *)[v6 cStringUsingEncoding:4];
  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create(v7, v8);

  v10 = [(BGSystemTask *)self initWithIdentifier:v5 queue:v9];
  return v10;
}

- (BGSystemTask)initWithIdentifier:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)BGSystemTask;
  dispatch_queue_t v9 = [(BGSystemTask *)&v24 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    runningConsumedResults = v10->_runningConsumedResults;
    v10->_runningConsumedResults = (NSMutableDictionary *)v11;

    id v13 = [NSString stringWithFormat:@"com.apple.BGSystemTask.resultQ.%@", v7];
    v14 = (const char *)[v13 cStringUsingEncoding:4];
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v17 = dispatch_queue_create(v14, v16);
    resultQueue = v10->_resultQueue;
    v10->_resultQueue = (OS_dispatch_queue *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    taskProgressInfo = v10->_taskProgressInfo;
    v10->_taskProgressInfo = (NSMutableDictionary *)v19;

    uint64_t v21 = [MEMORY[0x1E4F29128] UUID];
    uuid = v10->_uuid;
    v10->_uuid = (NSUUID *)v21;
  }
  return v10;
}

+ (id)logger
{
  if (logger_onceToken_1 != -1) {
    dispatch_once(&logger_onceToken_1, &__block_literal_global_2);
  }
  v2 = (void *)logger_log_1;
  return v2;
}

uint64_t __22__BGSystemTask_logger__block_invoke()
{
  logger_log_1 = (uint64_t)os_log_create("com.apple.BackgroundSystemTasks", "BGSTFramework");
  return MEMORY[0x1F41817F8]();
}

- (id)delegate:(id *)a3
{
  uint64_t v4 = [(BGSystemTask *)self delegate];
  id v5 = (void *)v4;
  if (a3 && !v4)
  {
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BGSystemTaskSchedulerErrorDomain" code:1 userInfo:0];
  }
  return v5;
}

- (void)clearLocked
{
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  id expirationHandler = self->_expirationHandler;
  self->_id expirationHandler = 0;

  id expirationAckHandler = self->_expirationAckHandler;
  self->_id expirationAckHandler = 0;

  id expirationHandlerWithReason = self->_expirationHandlerWithReason;
  self->_id expirationHandlerWithReason = 0;

  id clientLedExpirationHandler = self->_clientLedExpirationHandler;
  self->_id clientLedExpirationHandler = 0;
  self->_expirationReason = 0;

  self->_hasPropagatedExpiration = 0;
  transaction = self->_transaction;
  self->_transaction = 0;

  runningConsumedResults = self->_runningConsumedResults;
  self->_runningConsumedResults = 0;

  taskProgressInfo = self->_taskProgressInfo;
  self->_taskProgressInfo = 0;
}

- (BOOL)expiring
{
  return [(BGSystemTask *)self state] == 2;
}

- (BOOL)invalid
{
  unint64_t v2 = [(BGSystemTask *)self state];
  return (v2 < 5) & (0x19u >> v2);
}

- (void)setTaskCompleted
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  if (![(BGSystemTask *)self invalid])
  {
    [(BGSystemTask *)self reportCumulativeResultConsumptionWithError:0];
    [(BGSystemTask *)self reportBufferedTaskWorkloadProgress];
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__BGSystemTask_setTaskCompleted__block_invoke;
    block[3] = &unk_1E6B6C6E8;
    block[4] = self;
    dispatch_sync(queue, block);
  }
}

uint64_t __32__BGSystemTask_setTaskCompleted__block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[12];
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))(v2[12]);
    unint64_t v2 = *(void **)(a1 + 32);
  }
  [v2 clearLocked];
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 setState:4];
}

- (BOOL)setTaskExpiredWithRetryAfter:(double)a3 error:(id *)a4
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  if ([(BGSystemTask *)self invalid])
  {
    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"BGSystemTaskSchedulerErrorDomain" code:4 userInfo:0];
      BOOL v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 1;
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__2;
    dispatch_queue_t v17 = __Block_byref_object_dispose__2;
    id v18 = 0;
    BOOL v8 = [(BGSystemTask *)self reportCumulativeResultConsumptionWithError:a4];
    *((unsigned char *)v20 + 24) = v8;
    if (v8)
    {
      [(BGSystemTask *)self reportBufferedTaskWorkloadProgress];
      queue = self->_queue;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __51__BGSystemTask_setTaskExpiredWithRetryAfter_error___block_invoke;
      v12[3] = &unk_1E6B6C710;
      *(double *)&v12[7] = a3;
      v12[4] = self;
      v12[5] = &v13;
      v12[6] = &v19;
      dispatch_sync(queue, v12);
      int v10 = *((unsigned __int8 *)v20 + 24);
      if (a4 && !*((unsigned char *)v20 + 24))
      {
        *a4 = (id) v14[5];
        int v10 = *((unsigned __int8 *)v20 + 24);
      }
      BOOL v7 = v10 != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(&v19, 8);
  }
  return v7;
}

void __51__BGSystemTask_setTaskExpiredWithRetryAfter_error___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = (uint64_t *)(a1 + 56);
  double v3 = round(*(double *)(a1 + 56));
  if (([*(id *)(a1 + 32) expiring] & 1) == 0 && v3 < 300.0)
  {
    uint64_t v4 = +[BGSystemTask logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      uint64_t v15 = 300;
      _os_log_impl(&dword_1D9606000, v4, OS_LOG_TYPE_DEFAULT, "setTaskExpiredWithRetryAfter: Proactive expirations must have a cool off of at least %lu seconds, clamping", (uint8_t *)&v14, 0xCu);
    }

    double v3 = 300.0;
  }
  if ([*(id *)(a1 + 32) expiring] && v3 < 0.0)
  {
    id v5 = +[BGSystemTask logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __51__BGSystemTask_setTaskExpiredWithRetryAfter_error___block_invoke_cold_1(v2, v5);
    }

    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BGSystemTaskSchedulerErrorDomain" code:4 userInfo:0];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    if (v3 <= 64000000.0) {
      double v9 = v3;
    }
    else {
      double v9 = 64000000.0;
    }
    int v10 = [*(id *)(a1 + 32) expiring];
    uint64_t v11 = *(void **)(a1 + 32);
    if (v10 && (uint64_t v12 = v11[13]) != 0)
    {
      (*(void (**)(void, double))(v12 + 16))(v11[13], v9);
    }
    else if (([v11 expiring] & 1) == 0)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 112);
      if (v13) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(double))(v13 + 16))(v9);
      }
    }
    [*(id *)(a1 + 32) clearLocked];
    [*(id *)(a1 + 32) setState:3];
  }
}

- (void)handleExpirationWithReason:(unint64_t)a3
{
  if (!self->_hasPropagatedExpiration)
  {
    [(BGSystemTask *)self setState:2];
    self->_expirationReason = a3;
    if ([(BGSystemTask *)self hasValidExpirationHandler])
    {
      [(BGSystemTask *)self invokeExpirationHandlerWithReason:a3];
      id expirationHandlerWithReason = self->_expirationHandlerWithReason;
      self->_id expirationHandlerWithReason = 0;

      id expirationHandler = self->_expirationHandler;
      self->_id expirationHandler = 0;
    }
  }
}

- (void)invokeExpirationHandlerWithReason:(unint64_t)a3
{
  if ([(BGSystemTask *)self hasValidExpirationHandler])
  {
    id expirationHandlerWithReason = (void (**)(id, unint64_t))self->_expirationHandlerWithReason;
    if (expirationHandlerWithReason) {
      expirationHandlerWithReason[2](expirationHandlerWithReason, a3);
    }
    else {
      (*((void (**)(void))self->_expirationHandler + 2))();
    }
    self->_hasPropagatedExpiration = 1;
  }
  else
  {
    uint64_t v6 = +[BGSystemTask logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BGSystemTask invokeExpirationHandlerWithReason:](v6);
    }
  }
}

- (BOOL)producedCumulativeResults:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(BGSystemTask *)self delegate:a4];
  LOBYTE(a4) = [v7 systemTask:self producedResults:v6 error:a4];

  return (char)a4;
}

- (BOOL)consumedResults:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 1;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  id v27 = 0;
  id obj = 0;
  uint64_t v7 = [(BGSystemTask *)self delegate:&obj];
  objc_storeStrong(&v27, obj);
  if (v7)
  {
    resultQueue = self->_resultQueue;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    int v14 = __38__BGSystemTask_consumedResults_error___block_invoke;
    uint64_t v15 = &unk_1E6B6C650;
    id v16 = v6;
    id v17 = v7;
    id v18 = self;
    uint64_t v19 = &v22;
    v20 = &v28;
    dispatch_sync(resultQueue, &v12);

    if (*((unsigned char *)v29 + 24)) {
      goto LABEL_9;
    }
  }
  else
  {
    *((unsigned char *)v29 + 24) = 0;
  }
  double v9 = +[BGSystemTask logger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[BGSystemTask consumedResults:error:]();
  }

  if (a4) {
    *a4 = (id) v23[5];
  }
LABEL_9:
  char v10 = *((unsigned char *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v10;
}

void __38__BGSystemTask_consumedResults_error___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        BOOL v8 = *(void **)(a1 + 40);
        uint64_t v9 = *(void *)(a1 + 48);
        char v10 = objc_msgSend(v7, "identifier", (void)v14);
        LOBYTE(v8) = [v8 systemTask:v9 canConsumeResultOfIdentifier:v10];

        if ((v8 & 1) == 0)
        {
          uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BGSystemTaskSchedulerErrorDomain" code:7 userInfo:0];
          uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v13 = *(void **)(v12 + 40);
          *(void *)(v12 + 40) = v11;

          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
          goto LABEL_11;
        }
        objc_msgSend(*(id *)(a1 + 48), "resultQueue_aggregateConsumedResult:", v7);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (BOOL)resetResultsForIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 1;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  id v27 = 0;
  id obj = 0;
  uint64_t v7 = [(BGSystemTask *)self delegate:&obj];
  objc_storeStrong(&v27, obj);
  if (v7)
  {
    resultQueue = self->_resultQueue;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    long long v14 = __48__BGSystemTask_resetResultsForIdentifier_error___block_invoke;
    long long v15 = &unk_1E6B6C738;
    uint64_t v19 = &v28;
    id v16 = v7;
    long long v17 = self;
    id v18 = v6;
    v20 = &v22;
    dispatch_sync(resultQueue, &v12);

    if (*((unsigned char *)v29 + 24)) {
      goto LABEL_9;
    }
  }
  else
  {
    *((unsigned char *)v29 + 24) = 0;
  }
  uint64_t v9 = +[BGSystemTask logger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[BGSystemTask resetResultsForIdentifier:error:]();
  }

  if (a4) {
    *a4 = (id) v23[5];
  }
LABEL_9:
  char v10 = *((unsigned char *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v10;
}

void __48__BGSystemTask_resetResultsForIdentifier_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  char v6 = [v2 systemTask:v3 resetResultsForIdentifier:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
}

- (void)resultQueue_aggregateConsumedResult:(id)a3
{
  id v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  runningConsumedResults = self->_runningConsumedResults;
  uint64_t v5 = [v13 identifier];
  char v6 = [(NSMutableDictionary *)runningConsumedResults objectForKeyedSubscript:v5];

  if (v6)
  {
    uint64_t v7 = [BGSystemTaskResult alloc];
    BOOL v8 = [v13 identifier];
    uint64_t v9 = -[BGSystemTaskResult initWithIdentifier:consumptionCount:](v7, "initWithIdentifier:consumptionCount:", v8, [v13 count] + objc_msgSend(v6, "count"));

    char v10 = (void *)v9;
  }
  else
  {
    char v10 = v13;
  }
  uint64_t v11 = self->_runningConsumedResults;
  id v14 = v10;
  uint64_t v12 = [v10 identifier];
  [(NSMutableDictionary *)v11 setObject:v14 forKeyedSubscript:v12];
}

- (BOOL)resultQueue_containsPendingConsumedResults
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  uint64_t v3 = [(NSMutableDictionary *)self->_runningConsumedResults allKeys];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)reportCumulativeResultConsumptionWithError:(id *)a3
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  uint64_t v16 = 0;
  v17[0] = &v16;
  v17[1] = 0x3032000000;
  v17[2] = __Block_byref_object_copy__2;
  v17[3] = __Block_byref_object_dispose__2;
  id v18 = 0;
  id obj = 0;
  uint64_t v5 = [(BGSystemTask *)self delegate:&obj];
  objc_storeStrong(&v18, obj);
  resultQueue = self->_resultQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__BGSystemTask_reportCumulativeResultConsumptionWithError___block_invoke;
  block[3] = &unk_1E6B6C760;
  block[4] = self;
  id v13 = &v19;
  id v7 = v5;
  id v12 = v7;
  id v14 = &v16;
  dispatch_sync(resultQueue, block);
  if (!*((unsigned char *)v20 + 24))
  {
    BOOL v8 = +[BGSystemTask logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(BGSystemTask *)(uint64_t)self reportCumulativeResultConsumptionWithError:v8];
    }

    if (a3) {
      *a3 = *(id *)(v17[0] + 40);
    }
  }
  char v9 = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v19, 8);
  return v9;
}

void __59__BGSystemTask_reportCumulativeResultConsumptionWithError___block_invoke(uint64_t *a1)
{
  if (objc_msgSend((id)a1[4], "resultQueue_containsPendingConsumedResults"))
  {
    uint64_t v3 = a1[4];
    id v2 = (void *)a1[5];
    BOOL v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = [*(id *)(v3 + 56) allValues];
    char v6 = [v4 setWithArray:v5];
    uint64_t v7 = *(void *)(a1[7] + 8);
    id obj = *(id *)(v7 + 40);
    LOBYTE(v2) = [v2 systemTask:v3 consumedResults:v6 error:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)v2;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v9 = a1[4];
    char v10 = *(void **)(v9 + 56);
    *(void *)(v9 + 56) = v8;
  }
}

- (BOOL)reportTaskWorkloadProgress:(unint64_t)a3 completed:(unint64_t)a4 category:(unint64_t)a5 subCategory:(id)a6 error:(id *)a7
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v12 = (__CFString *)a6;
  if (a4 < 0x65)
  {
    uint64_t v16 = +[BGSystemTask logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      unint64_t v41 = a4;
      __int16 v42 = 2048;
      unint64_t v43 = a3;
      __int16 v44 = 2048;
      unint64_t v45 = a5;
      __int16 v46 = 2112;
      unint64_t v47 = (unint64_t)v12;
      _os_log_impl(&dword_1D9606000, v16, OS_LOG_TYPE_DEFAULT, "Completed %lu [Target:%lu] for workload %lu, subcategory %@", buf, 0x2Au);
    }
    unint64_t v17 = a4;
    unint64_t v18 = a3;
    v36 = a7;

    uint64_t v19 = @"default";
    v37 = v12;
    if (v12) {
      uint64_t v19 = v12;
    }
    v38 = v19;
    v20 = [(BGSystemTask *)self taskProgressInfo];
    uint64_t v21 = [NSNumber numberWithUnsignedInteger:a5];
    char v22 = [v20 objectForKey:v21];

    if (!v22)
    {
      v23 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v24 = [(BGSystemTask *)self taskProgressInfo];
      v25 = [NSNumber numberWithUnsignedInteger:a5];
      [v24 setObject:v23 forKeyedSubscript:v25];
    }
    v26 = [(BGSystemTask *)self taskProgressInfo];
    id v27 = [NSNumber numberWithUnsignedInteger:a5];
    uint64_t v28 = [v26 objectForKeyedSubscript:v27];
    v29 = [NSNumber numberWithUnsignedInteger:a3];
    v39[0] = v29;
    [NSNumber numberWithUnsignedInteger:v17];
    v31 = unint64_t v30 = a5;
    v39[1] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    [v28 setObject:v32 forKey:v38];

    if (![(BGSystemTask *)self shouldReportTaskWorkloadProgress:v17])
    {
      BOOL v15 = 1;
      id v12 = v37;
      id v13 = v38;
      goto LABEL_22;
    }
    id v12 = v37;
    if ([(BGSystemTask *)self sendTaskWorkloadProgressToPPS:v18 completed:v17 category:v30 subCategory:v37])
    {
      BOOL v15 = 1;
      id v13 = v38;
      goto LABEL_22;
    }
    v33 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BGSystemTaskSchedulerErrorDomain" code:3 userInfo:0];
    v34 = +[BGSystemTask logger];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413314;
      unint64_t v41 = (unint64_t)v33;
      __int16 v42 = 2048;
      unint64_t v43 = v17;
      __int16 v44 = 2048;
      unint64_t v45 = v18;
      __int16 v46 = 2048;
      unint64_t v47 = v30;
      __int16 v48 = 2112;
      v49 = v37;
      _os_log_error_impl(&dword_1D9606000, v34, OS_LOG_TYPE_ERROR, "Error: %@ Completed %lu [Target:%lu] for workload %lu, subcategory %@", buf, 0x34u);
    }

    id v13 = v38;
    if (v36) {
      id *v36 = v33;
    }

LABEL_21:
    BOOL v15 = 0;
    goto LABEL_22;
  }
  id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BGSystemTaskSchedulerErrorDomain" code:4 userInfo:0];
  id v14 = +[BGSystemTask logger];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138413314;
    unint64_t v41 = (unint64_t)v13;
    __int16 v42 = 2048;
    unint64_t v43 = a4;
    __int16 v44 = 2048;
    unint64_t v45 = a3;
    __int16 v46 = 2048;
    unint64_t v47 = a5;
    __int16 v48 = 2112;
    v49 = v12;
    _os_log_error_impl(&dword_1D9606000, v14, OS_LOG_TYPE_ERROR, "Error: %@ Completed %lu [Target:%lu] for workload %lu, subcategory %@", buf, 0x34u);
  }

  if (!a7) {
    goto LABEL_21;
  }
  BOOL v15 = 0;
  *a7 = v13;
LABEL_22:

  return v15;
}

- (BOOL)reportBufferedTaskWorkloadProgress
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v3 = [(BGSystemTask *)self taskProgressInfo];
  uint64_t v30 = [v3 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v30)
  {
    uint64_t v4 = *(void *)v41;
    v32 = v3;
    uint64_t v29 = *(void *)v41;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v41 != v4) {
          objc_enumerationMutation(v3);
        }
        uint64_t v31 = v5;
        char v6 = *(void **)(*((void *)&v40 + 1) + 8 * v5);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint64_t v7 = [(BGSystemTask *)self taskProgressInfo];
        uint64_t v8 = [v7 objectForKeyedSubscript:v6];

        id obj = v8;
        uint64_t v35 = [v8 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v35)
        {
          uint64_t v9 = *(void *)v37;
          uint64_t v33 = *(void *)v37;
          while (2)
          {
            for (uint64_t i = 0; i != v35; ++i)
            {
              if (*(void *)v37 != v9) {
                objc_enumerationMutation(obj);
              }
              uint64_t v11 = *(__CFString **)(*((void *)&v36 + 1) + 8 * i);
              id v12 = [(BGSystemTask *)self taskProgressInfo];
              id v13 = [v12 objectForKeyedSubscript:v6];
              id v14 = [v13 objectForKey:v11];
              BOOL v15 = [v14 objectAtIndexedSubscript:1];
              uint64_t v16 = [v15 unsignedLongValue];

              if (![(BGSystemTask *)self shouldReportTaskWorkloadProgress:v16])
              {
                unint64_t v17 = [(BGSystemTask *)self taskProgressInfo];
                unint64_t v18 = [v17 objectForKeyedSubscript:v6];
                uint64_t v19 = [v18 objectForKey:v11];
                v20 = [v19 objectAtIndexedSubscript:0];
                uint64_t v21 = [v20 unsignedLongValue];

                char v22 = v11 == @"default" ? 0 : v11;
                v23 = v22;
                uint64_t v24 = [v6 unsignedLongValue];
                uint64_t v25 = v21;
                uint64_t v9 = v33;
                BOOL v26 = [(BGSystemTask *)self sendTaskWorkloadProgressToPPS:v25 completed:v16 category:v24 subCategory:v23];

                if (!v26)
                {

                  BOOL v27 = 0;
                  uint64_t v3 = v32;
                  goto LABEL_23;
                }
              }
            }
            uint64_t v35 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
            if (v35) {
              continue;
            }
            break;
          }
        }

        uint64_t v5 = v31 + 1;
        uint64_t v3 = v32;
        uint64_t v4 = v29;
      }
      while (v31 + 1 != v30);
      BOOL v27 = 1;
      uint64_t v30 = [v32 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v30);
  }
  else
  {
    BOOL v27 = 1;
  }
LABEL_23:

  return v27;
}

- (BOOL)sendTaskWorkloadProgressToPPS:(unint64_t)a3 completed:(unint64_t)a4 category:(unint64_t)a5 subCategory:(id)a6
{
  id v10 = a6;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__BGSystemTask_sendTaskWorkloadProgressToPPS_completed_category_subCategory___block_invoke;
  v14[3] = &unk_1E6B6C788;
  unint64_t v18 = a4;
  unint64_t v19 = a5;
  v14[4] = self;
  id v15 = v10;
  uint64_t v16 = &v20;
  unint64_t v17 = a3;
  id v12 = v10;
  dispatch_sync(queue, v14);
  LOBYTE(a4) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return a4;
}

void __77__BGSystemTask_sendTaskWorkloadProgressToPPS_completed_category_subCategory___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F5FA50] sharedScheduler];
  uint64_t v3 = [*(id *)(a1 + 32) identifier];
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__BGSystemTask_sendTaskWorkloadProgressToPPS_completed_category_subCategory___block_invoke_2;
  v9[3] = &unk_1E6B6C2A8;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v9[4] = *(void *)(a1 + 32);
  v9[5] = v8;
  [v2 reportTaskWorkloadProgress:v3 target:v4 completed:v5 category:v6 subCategory:v7 completionHandler:v9];
}

void __77__BGSystemTask_sendTaskWorkloadProgressToPPS_completed_category_subCategory___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (a2)
  {
    *(unsigned char *)(v3 + 24) = 1;
    uint64_t v4 = +[BGSystemTask logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) identifier];
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1D9606000, v4, OS_LOG_TYPE_DEFAULT, "Successfully reported task workload progress for %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    *(unsigned char *)(v3 + 24) = 0;
    uint64_t v4 = +[BGSystemTask logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__BGSystemTask_sendTaskWorkloadProgressToPPS_completed_category_subCategory___block_invoke_2_cold_1(a1, v4);
    }
  }
}

- (BOOL)shouldReportTaskWorkloadProgress:(unint64_t)a3
{
  return 0xCCCCCCCCCCCCCCCDLL * a3 < 0x3333333333333334;
}

- (BOOL)eligibleToRun
{
  return [(BGSystemTask *)self state] == 1;
}

- (void)prepareForRunning
{
  [(NSString *)self->_identifier UTF8String];
  uint64_t v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v3;

  [(BGSystemTask *)self setState:1];
}

- (void)setExpirationHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  if ([(BGSystemTask *)self expiring])
  {
    BOOL v5 = [(BGSystemTask *)self hasValidExpirationHandler];
    int v6 = (void *)MEMORY[0x1E0165700](v4);
    id expirationHandler = self->_expirationHandler;
    self->_id expirationHandler = v6;

    if (!v5)
    {
      uint64_t v8 = +[BGSystemTask logger];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [(BGSystemTask *)self identifier];
        *(_DWORD *)buf = 138543362;
        id v15 = v9;
        _os_log_impl(&dword_1D9606000, v8, OS_LOG_TYPE_DEFAULT, "Invoking expirationHandler for %{public}@ immediately after being set due to a cached expiration request", buf, 0xCu);
      }
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __37__BGSystemTask_setExpirationHandler___block_invoke;
      block[3] = &unk_1E6B6C6E8;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E0165700](v4);
    id v12 = self->_expirationHandler;
    self->_id expirationHandler = v11;
  }
}

uint64_t __37__BGSystemTask_setExpirationHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleExpirationWithReason:0];
}

- (void)setExpirationHandlerWithReason:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  if ([(BGSystemTask *)self expiring])
  {
    BOOL v5 = [(BGSystemTask *)self hasValidExpirationHandler];
    int v6 = (void *)MEMORY[0x1E0165700](v4);
    id expirationHandlerWithReason = self->_expirationHandlerWithReason;
    self->_id expirationHandlerWithReason = v6;

    if (!v5)
    {
      uint64_t v8 = +[BGSystemTask logger];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [(BGSystemTask *)self identifier];
        *(_DWORD *)buf = 138543362;
        id v15 = v9;
        _os_log_impl(&dword_1D9606000, v8, OS_LOG_TYPE_DEFAULT, "Invoking expirationHandlerWithReason for %{public}@ immediately after being set due to a cached expiration request", buf, 0xCu);
      }
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__BGSystemTask_setExpirationHandlerWithReason___block_invoke;
      block[3] = &unk_1E6B6C6E8;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E0165700](v4);
    id v12 = self->_expirationHandlerWithReason;
    self->_id expirationHandlerWithReason = v11;
  }
}

uint64_t __47__BGSystemTask_setExpirationHandlerWithReason___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 expirationReason];
  return [v1 handleExpirationWithReason:v2];
}

- (BOOL)hasValidExpirationHandler
{
  return self->_expirationHandler || self->_expirationHandlerWithReason != 0;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)expirationHandler
{
  return self->_expirationHandler;
}

- (id)expirationHandlerWithReason
{
  return self->_expirationHandlerWithReason;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSMutableDictionary)runningConsumedResults
{
  return self->_runningConsumedResults;
}

- (void)setRunningConsumedResults:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)resultQueue
{
  return self->_resultQueue;
}

- (void)setResultQueue:(id)a3
{
}

- (BOOL)hasPropagatedExpiration
{
  return self->_hasPropagatedExpiration;
}

- (void)setHasPropagatedExpiration:(BOOL)a3
{
  self->_hasPropagatedExpiration = a3;
}

- (NSMutableDictionary)taskProgressInfo
{
  return self->_taskProgressInfo;
}

- (void)setTaskProgressInfo:(id)a3
{
}

- (BGSystemTaskDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BGSystemTaskDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)expirationAckHandler
{
  return self->_expirationAckHandler;
}

- (void)setExpirationAckHandler:(id)a3
{
}

- (id)clientLedExpirationHandler
{
  return self->_clientLedExpirationHandler;
}

- (void)setClientLedExpirationHandler:(id)a3
{
}

- (unint64_t)expirationReason
{
  return self->_expirationReason;
}

- (void)setExpirationReason:(unint64_t)a3
{
  self->_expirationReason = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong(&self->_clientLedExpirationHandler, 0);
  objc_storeStrong(&self->_expirationAckHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_taskProgressInfo, 0);
  objc_storeStrong((id *)&self->_resultQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_runningConsumedResults, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong(&self->_expirationHandlerWithReason, 0);
  objc_storeStrong(&self->_expirationHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __51__BGSystemTask_setTaskExpiredWithRetryAfter_error___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D9606000, a2, OS_LOG_TYPE_ERROR, "setTaskExpiredWithRetryAfter: Invalid value for seconds: %lf", (uint8_t *)&v3, 0xCu);
}

- (void)invokeExpirationHandlerWithReason:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D9606000, log, OS_LOG_TYPE_ERROR, "Tried to invoke expirationHandler on a task without one setup!", v1, 2u);
}

- (void)consumedResults:error:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D9606000, v0, v1, "%s: Unable to consume results %@ with error; %@", v2);
}

- (void)resetResultsForIdentifier:error:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D9606000, v0, v1, "%s: Unable to reset result production for %@ with error: %@", v2);
}

- (void)reportCumulativeResultConsumptionWithError:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(*(void *)a2 + 40);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1D9606000, log, OS_LOG_TYPE_ERROR, "Failed to report aggregate result consumption to dasd for %@ with error: %@", (uint8_t *)&v5, 0x16u);
}

void __77__BGSystemTask_sendTaskWorkloadProgressToPPS_completed_category_subCategory___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) identifier];
  int v4 = 138543362;
  int v5 = v3;
  _os_log_error_impl(&dword_1D9606000, a2, OS_LOG_TYPE_ERROR, "reportTaskWorkloadProgress: failed for %{public}@", (uint8_t *)&v4, 0xCu);
}

@end