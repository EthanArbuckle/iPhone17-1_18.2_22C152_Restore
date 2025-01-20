@interface _BRCOperation
- ($3E6A31346F70D3E0191F2ED888AF46F4)logSections;
- (BOOL)_finishIfCancelled;
- (BOOL)finishIfCancelled;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)nonDiscretionary;
- (BOOL)shouldRetryForError:(id)a3;
- (BOOL)timedOut;
- (BOOL)usesBackgroundSession;
- (BRCSyncContext)syncContext;
- (BRCThrottle)operationFailureThrottle;
- (BRCThrottle)operationThrottle;
- (CKOperationGroup)group;
- (NSDate)nextTryDate;
- (NSDate)startDate;
- (NSError)error;
- (NSUUID)operationID;
- (OS_dispatch_group)highPriorityWaitGroup;
- (OS_dispatch_queue)callbackQueue;
- (_BRCOperation)init;
- (_BRCOperation)initWithName:(id)a3;
- (_BRCOperation)initWithName:(id)a3 syncContext:(id)a4 sessionContext:(id)a5;
- (_BRCOperation)initWithName:(id)a3 syncContext:(id)a4 sessionContext:(id)a5 group:(id)a6;
- (double)executionTimeInSec;
- (double)maxBackoff;
- (double)timeout;
- (id)createActivity;
- (id)description;
- (id)descriptionWithContext:(id)a3;
- (id)finishBlock;
- (id)lastErrorDescription;
- (id)mainBlock;
- (id)stateWithContext:(id)a3;
- (id)subclassableDescriptionWithContext:(id)a3;
- (void)_completedWithResult:(id)a3 error:(id)a4;
- (void)_executeWithPreviousError:(id)a3;
- (void)_main;
- (void)_scheduleExecutionWithPreviousError:(id)a3;
- (void)_setDeviceConfigurationHeaderOnCKOp:(id)a3;
- (void)addDependency:(id)a3;
- (void)addSubOperation:(id)a3;
- (void)addSubOperation:(id)a3 overrideContext:(id)a4 allowsCellularAccess:(id)a5;
- (void)associateCKOperationsToEventMetric:(id)a3;
- (void)blockOnHighPriorityOperation:(id)a3;
- (void)cancel;
- (void)cancelAfterDelay:(double)a3;
- (void)completedWithResult:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)error;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)schedule;
- (void)setExecuting:(BOOL)a3;
- (void)setFinishBlock:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setGroup:(id)a3;
- (void)setMainBlock:(id)a3;
- (void)setMaxBackoff:(double)a3;
- (void)setNonDiscretionary:(BOOL)a3;
- (void)setOperationFailureThrottle:(id)a3;
- (void)setOperationThrottle:(id)a3;
- (void)setTimedOut:(BOOL)a3;
- (void)setTimeout:(double)a3;
- (void)start;
@end

@implementation _BRCOperation

- (NSUUID)operationID
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:self->_operationUUID];
  return (NSUUID *)v2;
}

- (_BRCOperation)init
{
  return 0;
}

- (_BRCOperation)initWithName:(id)a3 syncContext:(id)a4 sessionContext:(id)a5 group:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v49.receiver = self;
  v49.super_class = (Class)_BRCOperation;
  v14 = [(_BRCOperation *)&v49 init];
  v15 = v14;
  if (v14)
  {
    id v45 = v13;
    id v46 = v12;
    [(_BRCOperation *)v14 setName:v10];
    uuid_generate_random(v15->_operationUUID);
    objc_storeStrong((id *)&v15->_sessionContext, a5);
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
    startDate = v15->_startDate;
    v15->_startDate = (NSDate *)v16;

    id v18 = v10;
    v19 = (const char *)[v18 UTF8String];
    v20 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v21 = dispatch_queue_attr_make_initially_inactive(v20);
    v22 = dispatch_queue_attr_make_with_autorelease_frequency(v21, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v23 = dispatch_queue_create(v19, v22);

    callbackQueue = v15->_callbackQueue;
    v15->_callbackQueue = (OS_dispatch_queue *)v23;

    v25 = (const char *)[v18 UTF8String];
    v26 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v27 = dispatch_queue_attr_make_with_autorelease_frequency(v26, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v28 = dispatch_queue_create(v25, v27);

    internalQueue = v15->_internalQueue;
    v15->_internalQueue = (OS_dispatch_queue *)v28;

    objc_storeStrong((id *)&v15->_group, a6);
    objc_storeStrong((id *)&v15->_syncContext, a4);
    v30 = [v11 session];
    v15->_operationFailureThrottle = (BRCThrottle *)(id)[v30 operationFailureThrottle];

    uint64_t v31 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    subOperations = v15->_subOperations;
    v15->_subOperations = (NSHashTable *)v31;

    uint64_t v33 = objc_opt_new();
    associatedEventMetrics = v15->_associatedEventMetrics;
    v15->_associatedEventMetrics = (NSMutableArray *)v33;

    group = v15->_group;
    if (group) {
      dispatch_group_enter(group);
    }
    [(_BRCOperation *)v15 setQualityOfService:17];
    long long v47 = 0uLL;
    uint64_t v48 = 0;
    __brc_create_section(0, (uint64_t)"-[_BRCOperation initWithName:syncContext:sessionContext:group:]", 149, &v47);
    v36 = brc_bread_crumbs();
    v37 = brc_default_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v51 = v47;
      __int16 v52 = 2112;
      v53 = v15;
      __int16 v54 = 2112;
      v55 = v36;
      _os_log_debug_impl(&dword_1D353B000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx creating operation %@%@", buf, 0x20u);
    }

    long long v38 = v47;
    *(void *)&v15->_logSections.line = v48;
    *(_OWORD *)&v15->_logSections.sectionID = v38;
    v39 = [MEMORY[0x1E4FB36F8] sharedManager];
    uint64_t v40 = objc_msgSend(v39, "br_currentPersonaID");
    personaID = v15->_personaID;
    v15->_personaID = (NSString *)v40;

    v42 = +[BRCUserDefaults defaultsForMangledID:0];
    [v42 operationTimeout];
    v15->_timeout = v43;

    v15->_maxBackoff = 1.79769313e308;
    id v13 = v45;
    id v12 = v46;
  }

  return v15;
}

- (_BRCOperation)initWithName:(id)a3 syncContext:(id)a4 sessionContext:(id)a5
{
  return [(_BRCOperation *)self initWithName:a3 syncContext:a4 sessionContext:a5 group:0];
}

- (_BRCOperation)initWithName:(id)a3
{
  return [(_BRCOperation *)self initWithName:a3 syncContext:0 sessionContext:0 group:0];
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "BRCOperation/? (subclass activity missing)", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)setGroup:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (CKOperationGroup *)a3;
  $3C52EB5FA2A5D3907B44D7DBAB114CA7 logSections = self->_logSections;
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    unint64_t sectionID = logSections.sectionID;
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx now using group: %@%@", buf, 0x20u);
  }

  operationGroup = self->_operationGroup;
  self->_operationGroup = v4;

  __brc_leave_section((uint64_t *)&logSections);
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *a1;
  int v3 = 134218242;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v2, (uint64_t)v2, "[DEBUG] ┳%llx dealloc%@", (uint8_t *)&v3);
}

- (BOOL)usesBackgroundSession
{
  return [(_BRCOperation *)self qualityOfService] < 18;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (id)stateWithContext:(id)a3
{
  id v4 = a3;
  if ([(_BRCOperation *)self isCancelled])
  {
    uint64_t v5 = @"cancelled";
  }
  else if ([(_BRCOperation *)self isExecuting])
  {
    uint64_t v5 = @"executing";
  }
  else if ([(_BRCOperation *)self isFinished])
  {
    uint64_t v5 = @"finished";
  }
  else
  {
    uint64_t v5 = @"idle";
  }
  v6 = +[BRCDumpContext highlightedString:v5 type:7 context:v4];

  return v6;
}

- (id)subclassableDescriptionWithContext:(id)a3
{
  return 0;
}

- (double)executionTimeInSec
{
  finishDate = self->_finishDate;
  if (finishDate)
  {
    id v4 = finishDate;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
  }
  uint64_t v5 = v4;
  [(NSDate *)v4 timeIntervalSinceDate:self->_startDate];
  double v7 = v6;

  return v7;
}

- (id)lastErrorDescription
{
  int v3 = NSString;
  id v4 = [(NSError *)self->_lastError domain];
  uint64_t v5 = [v3 stringWithFormat:@"%@:%ld", v4, -[NSError code](self->_lastError, "code")];

  return v5;
}

- (id)descriptionWithContext:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36 = +[BRCDumpContext nowDateFromContext:v4];
  id v5 = objc_alloc(MEMORY[0x1E4F28E78]);
  double v6 = +[BRCDumpContext stringFromOperationUUID:self->_operationUUID context:v4];
  double v7 = [(_BRCOperation *)self name];
  v8 = (void *)[v5 initWithFormat:@"%p %@ %@", self, v6, v7];

  v9 = self;
  objc_sync_enter(v9);
  long long v38 = v9;
  v37 = [(_BRCOperation *)v9 subclassableDescriptionWithContext:v4];
  if ([v37 length])
  {
    [v8 appendString:@" "];
    [v8 appendString:v37];
  }
  id v10 = [(_BRCOperation *)v9 stateWithContext:v4];
  [v8 appendFormat:@" %@", v10];

  finishDate = v9->_finishDate;
  if (!finishDate) {
    finishDate = v36;
  }
  v34 = finishDate;
  [(NSDate *)v34 timeIntervalSinceDate:v9->_startDate];
  id v12 = +[BRCDumpContext stringFromInterval:context:](BRCDumpContext, "stringFromInterval:context:", v4);
  [v8 appendFormat:@" duration:%@", v12];

  if (![(_BRCOperation *)v9 usesBackgroundSession]) {
    [v8 appendString:@" (bypassing system scheduling)"];
  }
  nextTryDate = v9->_nextTryDate;
  if (nextTryDate)
  {
    v14 = +[BRCDumpContext stringFromDueDate:nextTryDate allowsPast:0 context:v4];
    [v8 appendFormat:@" next-try:%@", v14];
  }
  lastError = v9->_lastError;
  if (lastError)
  {
    uint64_t v16 = +[BRCDumpContext stringFromError:lastError context:v4];
    [v8 appendFormat:@" last-error:%@", v16];
  }
  lastTryDate = v9->_lastTryDate;
  if (lastTryDate)
  {
    id v18 = +[BRCDumpContext stringFromDueDate:lastTryDate allowsPast:1 context:v4];
    [v8 appendFormat:@" last-try:%@", v18];
  }
  v19 = [(_BRCOperation *)v9 dependencies];
  v39 = (void *)[v19 mutableCopy];

  obuint64_t j = v9->_subOperations;
  objc_sync_enter(obj);
  if ([(NSHashTable *)v9->_subOperations count])
  {
    [v8 appendString:@" sub {\n"];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v20 = v9->_subOperations;
    uint64_t v21 = [(NSHashTable *)v20 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v45 != v22) {
            objc_enumerationMutation(v20);
          }
          v24 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          [v39 removeObject:v24];
          v25 = [v24 lightweightDescription];
          v26 = +[BRCDumpContext highlightedString:v25 type:2 context:v4];
          [v8 appendFormat:@"    %@,\n", v26];
        }
        uint64_t v21 = [(NSHashTable *)v20 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v21);
    }

    [v8 appendString:@"}"];
  }
  objc_sync_exit(obj);

  if ([v39 count])
  {
    [v8 appendString:@" dep {\n"];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v27 = v39;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v41 != v29) {
            objc_enumerationMutation(v27);
          }
          uint64_t v31 = [*(id *)(*((void *)&v40 + 1) + 8 * j) lightweightDescription];
          v32 = +[BRCDumpContext highlightedString:v31 type:2 context:v4];
          [v8 appendFormat:@"    %@,\n", v32];
        }
        uint64_t v28 = [v27 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v28);
    }

    [v8 appendString:@"}"];
  }

  objc_sync_exit(v38);
  return v8;
}

- (id)description
{
  return [(_BRCOperation *)self descriptionWithContext:0];
}

- (NSError)error
{
  if (![(_BRCOperation *)self isFinished])
  {
    id v5 = brc_bread_crumbs();
    double v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[_BRCOperation error]();
    }
  }
  lastError = self->_lastError;
  return lastError;
}

- (void)setFinished:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  if (self->_finished != v3)
  {
    if (v3)
    {
      id v5 = [MEMORY[0x1E4F1C9C8] date];
    }
    else
    {
      id v5 = 0;
    }
    objc_storeStrong((id *)&self->_finishDate, v5);
    if (v3) {

    }
    [(_BRCOperation *)self willChangeValueForKey:@"isFinished"];
    self->_finished = v3;
    [(_BRCOperation *)self didChangeValueForKey:@"isFinished"];
  }
}

- (BOOL)isExecuting
{
  return self->_executionTransaction != 0;
}

- (void)setExecuting:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  if ((((self->_executionTransaction == 0) ^ v3) & 1) == 0)
  {
    [(_BRCOperation *)self willChangeValueForKey:@"isExecuting"];
    if (v3) {
      id v5 = (OS_os_transaction *)os_transaction_create();
    }
    else {
      id v5 = 0;
    }
    executionTransaction = self->_executionTransaction;
    self->_executionTransaction = v5;

    [(_BRCOperation *)self didChangeValueForKey:@"isExecuting"];
  }
}

- (BOOL)_finishIfCancelled
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  if ([(_BRCOperation *)self isFinished]) {
    goto LABEL_4;
  }
  int v3 = [(_BRCOperation *)self isCancelled];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F19C40] code:20 userInfo:0];
    id v5 = (void *)MEMORY[0x1D9438760]();
    [(_BRCOperation *)self finishWithResult:0 error:v4];

LABEL_4:
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)finishIfCancelled
{
  int v3 = [(_BRCOperation *)self isCancelled];
  if (v3)
  {
    callbackQueue = self->_callbackQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34___BRCOperation_finishIfCancelled__block_invoke;
    v6[3] = &unk_1E6993698;
    v6[4] = self;
    dispatch_async_with_logs(callbackQueue, v6);
  }
  return v3;
}

- (void)main
{
  int v3 = [(_BRCOperation *)self mainBlock];

  if (v3)
  {
    id v4 = [(_BRCOperation *)self mainBlock];
    v4[2](v4, self);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_BRCOperation;
    [(_BRCOperation *)&v5 main];
  }
}

- (void)_main
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  [(_BRCOperation *)self setExecuting:1];
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __22___BRCOperation__main__block_invoke;
  v4[3] = &unk_1E6993698;
  v4[4] = self;
  dispatch_async_with_logs(internalQueue, v4);
}

- (void)_executeWithPreviousError:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  if (![(_BRCOperation *)self _finishIfCancelled])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    objc_super v5 = [(_BRCOperation *)self dependencies];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          [(_BRCOperation *)self removeDependency:*(void *)(*((void *)&v14 + 1) + 8 * v8++)];
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    v9 = self->_subOperations;
    objc_sync_enter(v9);
    [(NSHashTable *)self->_subOperations removeAllObjects];
    objc_sync_exit(v9);

    id v10 = [(_BRCOperation *)self operationThrottle];
    [v10 incrementRetryCount:self->_throttleHash];

    if (v4)
    {
      __int16 v11 = [(_BRCOperation *)self operationFailureThrottle];
      [v11 incrementRetryCount:self->_throttleHash];
    }
    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      dispatch_source_cancel(retryTimer);
      __int16 v13 = self->_retryTimer;
      self->_retryTimer = 0;
    }
    [(_BRCOperation *)self _main];
  }
}

- (void)_scheduleExecutionWithPreviousError:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  [(_BRCOperation *)self setExecuting:0];
  objc_super v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  lastTryDate = v5->_lastTryDate;
  v5->_lastTryDate = (NSDate *)v6;

  objc_sync_exit(v5);
  objc_msgSend(v4, "br_suggestedRetryTimeInterval");
  double v9 = v8;
  if (!v5->_throttleHash)
  {
    id v10 = [(_BRCOperation *)v5 name];
    v5->_int64_t throttleHash = +[BRCThrottle throttleHashFormat:@"%@%d", v10, [(_BRCOperation *)v5 nonDiscretionary]];
  }
  __int16 v11 = [(_BRCOperation *)v5 operationThrottle];
  uint64_t v12 = [v11 nsecsToNextRetry:v5->_throttleHash now:brc_current_date_nsec() increment:0];
  __int16 v13 = [(_BRCOperation *)v5 operationFailureThrottle];

  uint64_t v14 = [v13 nsecsToNextRetry:v5->_throttleHash now:brc_current_date_nsec() increment:0];
  if (v14 <= v12) {
    uint64_t v15 = v12;
  }
  else {
    uint64_t v15 = v14;
  }
  long long v16 = brc_bread_crumbs();
  long long v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    int64_t throttleHash = v5->_throttleHash;
    *(_DWORD *)buf = 134218498;
    double v58 = (double)v15 / 1000000000.0;
    __int16 v59 = 2048;
    int64_t v60 = throttleHash;
    __int16 v61 = 2112;
    v62 = v16;
    _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] throttle backoff: %03fs for hash:0x%016llx%@", buf, 0x20u);
  }

  int v18 = ![(_BRCOperation *)v5 nonDiscretionary];
  if (!v4) {
    LOBYTE(v18) = 1;
  }
  if ((v18 & 1) != 0
    || (+[BRCUserDefaults defaultsForMangledID:0],
        uint64_t v19 = objc_claimAutoreleasedReturnValue(),
        BOOL v20 = v15 > [v19 maxBackoffToRetryUserInitiated],
        v19,
        !v20))
  {
    if (v9 <= 0.0)
    {
      uint64_t v24 = 0;
    }
    else
    {
      if (v9 <= 9223372040.0) {
        uint64_t v24 = 1000000000 * (uint64_t)v9;
      }
      else {
        uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v25 = brc_bread_crumbs();
      v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[_BRCOperation _scheduleExecutionWithPreviousError:].cold.5();
      }
    }
    if (v24 <= v15) {
      int64_t v27 = v15;
    }
    else {
      int64_t v27 = v24;
    }
    if (v27 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v28 = brc_bread_crumbs();
      uint64_t v29 = brc_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        -[_BRCOperation _scheduleExecutionWithPreviousError:]();
      }

      v30 = v5;
      objc_sync_enter(v30);
      uint64_t v31 = [MEMORY[0x1E4F1C9C8] distantFuture];
      nextTryDate = v30->_nextTryDate;
      v30->_nextTryDate = (NSDate *)v31;

      objc_sync_exit(v30);
    }
    else if ((double)v27 / 1000000000.0 >= v5->_maxBackoff)
    {
      objc_super v49 = brc_bread_crumbs();
      uint64_t v50 = brc_default_log();
      if (os_log_type_enabled(v50, (os_log_type_t)0x90u)) {
        -[_BRCOperation _scheduleExecutionWithPreviousError:].cold.4();
      }

      id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
      __int16 v52 = (void *)[v51 initWithDomain:*MEMORY[0x1E4F592A8] code:23 userInfo:0];
      v53 = (void *)MEMORY[0x1D9438760]();
      [(_BRCOperation *)v5 finishWithResult:0 error:v52];
    }
    else if (v27)
    {
      uint64_t v33 = brc_bread_crumbs();
      v34 = brc_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        -[_BRCOperation _scheduleExecutionWithPreviousError:]();
      }

      v35 = v5;
      objc_sync_enter(v35);
      uint64_t v36 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)v27 / 1000000000.0];
      v37 = v35->_nextTryDate;
      v35->_nextTryDate = (NSDate *)v36;

      objc_sync_exit(v35);
      long long v38 = [(_BRCOperation *)v35 callbackQueue];
      dispatch_source_t v39 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v38);
      retryTimer = v35->_retryTimer;
      v35->_retryTimer = (OS_dispatch_source *)v39;

      dispatch_time_t v41 = dispatch_time(0, v27);
      if (v27 >= 0) {
        uint64_t v42 = v27;
      }
      else {
        uint64_t v42 = v27 + 1;
      }
      dispatch_source_set_timer((dispatch_source_t)v35->_retryTimer, v41, 0xFFFFFFFFFFFFFFFFLL, v42 >> 1);
      long long v43 = v35->_retryTimer;
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __53___BRCOperation__scheduleExecutionWithPreviousError___block_invoke;
      v55[3] = &unk_1E6993628;
      v55[4] = v35;
      id v56 = v4;
      long long v44 = v43;
      long long v45 = v55;
      long long v46 = v45;
      long long v47 = v45;
      if (*MEMORY[0x1E4F59658])
      {
        long long v47 = ((void (*)(void *))*MEMORY[0x1E4F59658])(v45);
      }
      dispatch_block_t v48 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v47);
      dispatch_source_set_event_handler(v44, v48);

      dispatch_resume((dispatch_object_t)v35->_retryTimer);
    }
    else
    {
      [(_BRCOperation *)v5 _executeWithPreviousError:v4];
    }
  }
  else
  {
    uint64_t v21 = brc_bread_crumbs();
    uint64_t v22 = brc_default_log();
    if (os_log_type_enabled(v22, (os_log_type_t)0x90u)) {
      -[_BRCOperation _scheduleExecutionWithPreviousError:]();
    }

    dispatch_queue_t v23 = (void *)MEMORY[0x1D9438760]();
    [(_BRCOperation *)v5 finishWithResult:0 error:v4];
  }
}

- (void)schedule
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: there should be a group created for %@%@");
}

- (void)start
{
  int v3 = [(_BRCOperation *)self createActivity];
  Activity = self->_Activity;
  self->_Activity = v3;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_Activity, &state);
  objc_super v5 = [(_BRCOperation *)self name];
  [v5 hash];
  [(_BRCOperation *)self hash];
  kdebug_trace();

  dispatch_activate((dispatch_object_t)self->_callbackQueue);
  if (![(_BRCOperation *)self finishIfCancelled])
  {
    uint64_t v6 = [(_BRCOperation *)self operationThrottle];
    if (v6)
    {
      callbackQueue = self->_callbackQueue;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __22___BRCOperation_start__block_invoke;
      v10[3] = &unk_1E6993698;
      v10[4] = self;
      double v8 = v10;
    }
    else
    {
      [(_BRCOperation *)self cancelAfterDelay:self->_timeout];
      callbackQueue = self->_callbackQueue;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __22___BRCOperation_start__block_invoke_99;
      v9[3] = &unk_1E6993698;
      v9[4] = self;
      double v8 = v9;
    }
    dispatch_async(callbackQueue, v8);
  }
  os_activity_scope_leave(&state);
}

- (void)cancel
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  memset(v32, 0, sizeof(v32));
  __brc_create_section(0, (uint64_t)"-[_BRCOperation cancel]", 610, v32);
  int v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v36 = v32[0];
    __int16 v37 = 2112;
    long long v38 = self;
    __int16 v39 = 2112;
    long long v40 = v3;
    _os_log_debug_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx cancelling %@%@", buf, 0x20u);
  }

  v31.receiver = self;
  v31.super_class = (Class)_BRCOperation;
  [(_BRCOperation *)&v31 cancel];
  obuint64_t j = self->_subOperations;
  objc_sync_enter(obj);
  objc_super v5 = [(_BRCOperation *)self dependencies];
  uint64_t v6 = (void *)[v5 mutableCopy];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v7 = self->_subOperations;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v7);
        }
        __int16 v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v11 cancel];
        [v6 removeObject:v11];
      }
      uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v8);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * j);
        [(_BRCOperation *)self removeDependency:v16];
        long long v17 = brc_bread_crumbs();
        int v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v19 = [(_BRCOperation *)self operationID];
          *(_DWORD *)buf = 138412802;
          uint64_t v36 = v16;
          __int16 v37 = 2112;
          long long v38 = v19;
          __int16 v39 = 2112;
          long long v40 = v17;
          _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Removed %@ as dependency of cancelled op %@%@", buf, 0x20u);
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v13);
  }

  objc_sync_exit(obj);
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23___BRCOperation_cancel__block_invoke;
  block[3] = &unk_1E6993698;
  block[4] = self;
  dispatch_async(callbackQueue, block);
  __brc_leave_section(v32);
}

- (BOOL)shouldRetryForError:(id)a3
{
  id v4 = a3;
  if ([(_BRCOperation *)self nonDiscretionary]) {
    char v5 = objc_msgSend(v4, "brc_isUserInitiatedRetriable");
  }
  else {
    char v5 = objc_msgSend(v4, "brc_isRetriable");
  }
  BOOL v6 = v5;

  return v6;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(0, (uint64_t)"-[_BRCOperation finishWithResult:error:]", 655, v27);
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v30 = v27[0];
    __int16 v31 = 2112;
    v32 = self;
    __int16 v33 = 2112;
    v34 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx finishing %@%@", buf, 0x20u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  group = self->_group;
  if (group)
  {
    dispatch_group_leave(group);
    __int16 v11 = self->_group;
    self->_group = 0;
  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    dispatch_source_cancel(timeoutTimer);
    uint64_t v13 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  finishBlock = (void (**)(id, id, id))self->_finishBlock;
  if (finishBlock) {
    finishBlock[2](finishBlock, v6, v7);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v15 = [(_BRCOperation *)self dependencies];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v24;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v15);
        }
        [(_BRCOperation *)self removeDependency:*(void *)(*((void *)&v23 + 1) + 8 * v18++)];
      }
      while (v16 != v18);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v16);
  }

  uint64_t v19 = self->_subOperations;
  objc_sync_enter(v19);
  [(NSHashTable *)self->_subOperations removeAllObjects];
  objc_sync_exit(v19);

  BOOL v20 = [(_BRCOperation *)self name];
  [v20 hash];
  [(_BRCOperation *)self hash];
  kdebug_trace();

  [(_BRCOperation *)self setExecuting:0];
  [(_BRCOperation *)self setFinished:1];
  id v21 = self->_finishBlock;
  self->_finishBlock = 0;

  id mainBlock = self->_mainBlock;
  self->_id mainBlock = 0;

  __brc_leave_section(v27);
}

- (void)_completedWithResult:(id)a3 error:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (__CFString *)a4;
  $3C52EB5FA2A5D3907B44D7DBAB114CA7 logSections = self->_logSections;
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    BOOL v20 = @"failed";
    *(_DWORD *)buf = 134219522;
    if (!v7) {
      BOOL v20 = @"completed";
    }
    unint64_t sectionID = logSections.sectionID;
    __int16 v28 = 2112;
    id v21 = &stru_1F2AC7720;
    long long v29 = &stru_1F2AC7720;
    uint64_t v22 = @"\nwith error: ";
    if (!v7) {
      uint64_t v22 = &stru_1F2AC7720;
    }
    __int16 v30 = 2112;
    if (v7) {
      id v21 = v7;
    }
    __int16 v31 = v20;
    __int16 v32 = 2112;
    __int16 v33 = self;
    __int16 v34 = 2112;
    uint64_t v35 = v22;
    __int16 v36 = 2112;
    __int16 v37 = v21;
    __int16 v38 = 2112;
    __int16 v39 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx %@%@ %@%@%@%@", buf, 0x48u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  if (![(_BRCOperation *)self _finishIfCancelled])
  {
    id v10 = self;
    objc_sync_enter(v10);
    objc_storeStrong((id *)&v10->_lastError, a4);
    objc_sync_exit(v10);

    if ([(__CFString *)v7 brc_isDenylistError])
    {
      brc_bread_crumbs();
      __int16 v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        unint64_t sectionID = (unint64_t)v10;
        __int16 v28 = 2112;
        long long v29 = v11;
        _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] We are denylisted! Not notifying about finishing %@%@", buf, 0x16u);
      }

      goto LABEL_18;
    }
    if ([(__CFString *)v7 brc_isCloudKitAccountTemporarilyUnavailable])
    {
      uint64_t v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[_BRCOperation _completedWithResult:error:]();
      }

      uint64_t v15 = [(BRCSyncContext *)v10->_syncContext session];
      [v15 invalidateAccountStatus];
    }
    if (v7)
    {
      if ([(_BRCOperation *)v10 shouldRetryForError:v7])
      {
        if (!v10->_operationFailureThrottle)
        {
          long long v23 = brc_bread_crumbs();
          long long v24 = brc_default_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
            -[_BRCOperation _completedWithResult:error:]();
          }
        }
        -[_BRCOperation _scheduleExecutionWithPreviousError:](v10, "_scheduleExecutionWithPreviousError:", v7, *(_OWORD *)&logSections.sectionID, *(void *)&logSections.line);
        goto LABEL_18;
      }
      uint64_t v16 = [(_BRCOperation *)v10 operationFailureThrottle];
      BOOL v17 = v16 == 0;

      if (!v17)
      {
        uint64_t v18 = [(_BRCOperation *)v10 operationFailureThrottle];
        [v18 incrementRetryCount:v10->_throttleHash];
      }
    }
    uint64_t v19 = (void *)MEMORY[0x1D9438760]();
    [(_BRCOperation *)v10 finishWithResult:v6 error:v7];
  }
LABEL_18:
  __brc_leave_section((uint64_t *)&logSections);
}

- (void)completedWithResult:(id)a3 error:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((BRCurrentPersonaMatchesID() & 1) == 0)
  {
    __int16 v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[_BRCOperation completedWithResult:error:].cold.4();
    }

    if ([(NSString *)self->_personaID isEqualToString:@"__defaultPersonaID__"]
      || (uint64_t v13 = self->_personaID) == 0)
    {
      if (completedWithResult_error____personaOnceToken != -1) {
        dispatch_once(&completedWithResult_error____personaOnceToken, &__block_literal_global_2);
      }
      uint64_t v14 = (NSString *)(id)completedWithResult_error____personalPersona;
      int v15 = 1;
    }
    else
    {
      uint64_t v14 = v13;
      int v15 = 0;
    }
    uint64_t v16 = [MEMORY[0x1E4FB36F8] sharedManager];
    BOOL v17 = [v16 currentPersona];

    id v41 = 0;
    uint64_t v18 = [v17 userPersonaUniqueString];
    uint64_t v19 = v18;
    if (v18 == v14 || [(NSString *)v18 isEqualToString:v14])
    {
      BOOL v20 = 0;
    }
    else
    {
      if (voucher_process_can_use_arbitrary_personas())
      {
        id v40 = 0;
        long long v24 = (void *)[v17 copyCurrentPersonaContextWithError:&v40];
        id v25 = v40;
        id v26 = v41;
        id v41 = v24;

        if (v25)
        {
          long long v27 = brc_bread_crumbs();
          __int16 v28 = brc_default_log();
          if (os_log_type_enabled(v28, (os_log_type_t)0x90u)) {
            -[_BRCOperation completedWithResult:error:]();
          }
        }
        BOOL v20 = [v17 generateAndRestorePersonaContextWithPersonaUniqueString:v14];

        if (!v20) {
          goto LABEL_14;
        }
        long long v29 = brc_bread_crumbs();
        __int16 v30 = brc_default_log();
        if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
        {
          personaID = self->_personaID;
          *(_DWORD *)buf = 138412802;
          long long v43 = personaID;
          __int16 v44 = 2112;
          long long v45 = v20;
          __int16 v46 = 2112;
          long long v47 = v29;
          _os_log_error_impl(&dword_1D353B000, v30, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
        }
      }
      else
      {
        if (!v15 || ([v17 isDataSeparatedPersona] & 1) != 0)
        {
          __int16 v32 = brc_bread_crumbs();
          __int16 v33 = brc_default_log();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
            -[_BRCOperation completedWithResult:error:]();
          }

          BOOL v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
          goto LABEL_14;
        }
        long long v29 = brc_bread_crumbs();
        __int16 v30 = brc_default_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          -[_BRCOperation completedWithResult:error:]();
        }
        BOOL v20 = 0;
      }
    }
LABEL_14:
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43___BRCOperation_completedWithResult_error___block_invoke_118;
    block[3] = &unk_1E6993600;
    block[4] = self;
    id v38 = v6;
    id v39 = v7;
    id v22 = v7;
    id v23 = v6;
    dispatch_async(callbackQueue, block);

    _BRRestorePersona();
    goto LABEL_15;
  }
  uint64_t v8 = self->_callbackQueue;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __43___BRCOperation_completedWithResult_error___block_invoke_2;
  v34[3] = &unk_1E6993600;
  v34[4] = self;
  id v35 = v6;
  id v36 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v34);

LABEL_15:
}

- (void)_setDeviceConfigurationHeaderOnCKOp:(id)a3
{
  id v3 = a3;
  id v4 = [v3 configuration];
  char v5 = [v4 additionalRequestHTTPHeaders];
  id v6 = (void *)[v5 mutableCopy];
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v12 = v8;

  id v9 = objc_alloc_init(BRCDeviceConfiguration);
  id v10 = [(BRCDeviceConfiguration *)v9 getDeviceConfigurationString];
  [v12 setObject:v10 forKeyedSubscript:@"X-APPLE-BR-DEVICE-CONFIGURATION"];

  __int16 v11 = [v3 configuration];

  [v11 setAdditionalRequestHTTPHeaders:v12];
}

- (void)addSubOperation:(id)a3 overrideContext:(id)a4 allowsCellularAccess:(id)a5
{
  id v8 = a3;
  id v9 = (BRCSyncContext *)a4;
  id v10 = a5;
  if (!v9) {
    id v9 = self->_syncContext;
  }
  v21.receiver = self;
  v21.super_class = (Class)_BRCOperation;
  [(_BRCOperation *)&v21 addDependency:v8];
  __int16 v11 = self->_subOperations;
  objc_sync_enter(v11);
  [(NSHashTable *)self->_subOperations addObject:v8];
  objc_sync_exit(v11);

  objc_msgSend(v8, "setQualityOfService:", -[_BRCOperation qualityOfService](self, "qualityOfService"));
  objc_msgSend(v8, "setQueuePriority:", -[_BRCOperation queuePriority](self, "queuePriority"));
  internalQueue = self->_internalQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70___BRCOperation_addSubOperation_overrideContext_allowsCellularAccess___block_invoke;
  v16[3] = &unk_1E6993CC8;
  BOOL v17 = v9;
  id v18 = v8;
  uint64_t v19 = self;
  id v20 = v10;
  id v13 = v10;
  id v14 = v8;
  int v15 = v9;
  dispatch_async_with_logs(internalQueue, v16);
}

- (void)addSubOperation:(id)a3
{
  id v4 = a3;
  if (!self->_syncContext)
  {
    char v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[_BRCOperation addSubOperation:]();
    }
  }
  [(_BRCOperation *)self addSubOperation:v4 overrideContext:0 allowsCellularAccess:0];
}

- (void)addDependency:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_BRCOperation *)self nonDiscretionary])
  {
    if (([v4 isCancelled] & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ([v4 nonDiscretionary] & 1) == 0)
      {
        char v5 = brc_bread_crumbs();
        id v6 = brc_default_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v9 = v4;
          __int16 v10 = 2112;
          __int16 v11 = self;
          __int16 v12 = 2112;
          id v13 = v5;
          _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Adding discretionary op %@ as a dependency of a non-discretionary op %@%@", buf, 0x20u);
        }
      }
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)_BRCOperation;
  [(_BRCOperation *)&v7 addDependency:v4];
}

- (void)blockOnHighPriorityOperation:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(_BRCOperation *)self isCancelled] & 1) == 0)
  {
    char v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      BOOL v17 = [(_BRCOperation *)self operationID];
      id v18 = [v4 operationID];
      *(_DWORD *)location = 138412802;
      *(void *)&location[4] = v17;
      __int16 v28 = 2112;
      long long v29 = v18;
      __int16 v30 = 2112;
      __int16 v31 = v5;
      _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Blocking %@ on high priority operation %@%@", location, 0x20u);
    }
    [(_BRCOperation *)self addDependency:v4];
    objc_super v7 = self->_subOperations;
    objc_sync_enter(v7);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = self->_subOperations;
    uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v23;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v8);
          }
          __int16 v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v12 blockOnHighPriorityOperation:v4];
          }
          else {
            [v12 addDependency:v4];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    if (!self->_highPriorityWaitGroup)
    {
      id v13 = (OS_dispatch_group *)dispatch_group_create();
      highPriorityWaitGroup = self->_highPriorityWaitGroup;
      self->_highPriorityWaitGroup = v13;
    }
    int v15 = [v4 completionBlock];
    dispatch_group_enter((dispatch_group_t)self->_highPriorityWaitGroup);
    objc_initWeak((id *)location, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __46___BRCOperation_blockOnHighPriorityOperation___block_invoke;
    v19[3] = &unk_1E6993CF0;
    objc_copyWeak(&v21, (id *)location);
    id v16 = v15;
    id v20 = v16;
    [v4 setCompletionBlock:v19];

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)location);

    objc_sync_exit(v7);
  }
}

- (void)associateCKOperationsToEventMetric:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self->_associatedEventMetrics, "addObject:");
  }
}

- (void)cancelAfterDelay:(double)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a3 != 0.0)
  {
    id v4 = self;
    objc_sync_enter(v4);
    if (([(_BRCOperation *)v4 isCancelled] & 1) == 0 && !v4->_timeoutTimer)
    {
      [(NSDate *)v4->_startDate timeIntervalSinceNow];
      uint64_t v6 = (uint64_t)(v5 * 1000000000.0);
      uint64_t v7 = (uint64_t)(a3 * 1000000000.0);
      unint64_t v8 = v7 - v6;
      if (v7 <= v6)
      {
        long long v22 = brc_bread_crumbs();
        long long v23 = brc_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          long long v24 = [(_BRCOperation *)v4 description];
          [(_BRCOperation *)v24 cancelAfterDelay:(uint64_t)buf];
        }

        [(_BRCOperation *)v4 cancel];
      }
      else
      {
        uint64_t v9 = brc_bread_crumbs();
        uint64_t v10 = brc_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          long long v25 = [(_BRCOperation *)v4 description];
          *(_DWORD *)buf = 134218498;
          unint64_t v28 = v8 / 0x3B9ACA00;
          __int16 v29 = 2112;
          __int16 v30 = v25;
          __int16 v31 = 2112;
          uint64_t v32 = v9;
          _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Launching timeout timer of %llu seconds for operation %@%@", buf, 0x20u);
        }
        dispatch_time_t v11 = dispatch_time(0, v8);
        dispatch_source_t v12 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, 0);
        timeoutTimer = v4->_timeoutTimer;
        v4->_timeoutTimer = (OS_dispatch_source *)v12;

        uint64_t v14 = v4->_timeoutTimer;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __34___BRCOperation_cancelAfterDelay___block_invoke;
        v26[3] = &unk_1E6993698;
        v26[4] = v4;
        int v15 = v14;
        id v16 = v26;
        BOOL v17 = v15;
        id v18 = v16;
        uint64_t v19 = v18;
        id v20 = v18;
        if (*MEMORY[0x1E4F59658])
        {
          id v20 = ((void (*)(void *))*MEMORY[0x1E4F59658])(v18);
        }
        dispatch_block_t v21 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v20);
        dispatch_source_set_event_handler(v17, v21);

        dispatch_source_set_timer((dispatch_source_t)v4->_timeoutTimer, v11, 0xFFFFFFFFFFFFFFFFLL, v7 / 10);
        dispatch_resume((dispatch_object_t)v4->_timeoutTimer);
      }
    }
    objc_sync_exit(v4);
  }
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (BRCThrottle)operationThrottle
{
  return self->_operationThrottle;
}

- (void)setOperationThrottle:(id)a3
{
  self->_operationThrottle = (BRCThrottle *)a3;
}

- (BRCThrottle)operationFailureThrottle
{
  return self->_operationFailureThrottle;
}

- (void)setOperationFailureThrottle:(id)a3
{
  self->_operationFailureThrottle = (BRCThrottle *)a3;
}

- (id)mainBlock
{
  return self->_mainBlock;
}

- (void)setMainBlock:(id)a3
{
}

- (id)finishBlock
{
  return self->_finishBlock;
}

- (void)setFinishBlock:(id)a3
{
}

- ($3E6A31346F70D3E0191F2ED888AF46F4)logSections
{
  *($3C52EB5FA2A5D3907B44D7DBAB114CA7 *)retstr = ($3C52EB5FA2A5D3907B44D7DBAB114CA7)self[20];
  return self;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)nextTryDate
{
  return self->_nextTryDate;
}

- (BRCSyncContext)syncContext
{
  return self->_syncContext;
}

- (CKOperationGroup)group
{
  return self->_operationGroup;
}

- (BOOL)nonDiscretionary
{
  return self->_nonDiscretionary;
}

- (void)setNonDiscretionary:(BOOL)a3
{
  self->_nonDiscretionary = a3;
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (void)setTimedOut:(BOOL)a3
{
  self->_timedOut = a3;
}

- (OS_dispatch_group)highPriorityWaitGroup
{
  return self->_highPriorityWaitGroup;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (double)maxBackoff
{
  return self->_maxBackoff;
}

- (void)setMaxBackoff:(double)a3
{
  self->_maxBackoff = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong(&self->_finishBlock, 0);
  objc_storeStrong(&self->_mainBlock, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_associatedEventMetrics, 0);
  objc_storeStrong((id *)&self->_Activity, 0);
  objc_storeStrong((id *)&self->_subOperations, 0);
  objc_storeStrong((id *)&self->_highPriorityWaitGroup, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_nextTryDate, 0);
  objc_storeStrong((id *)&self->_lastTryDate, 0);
  objc_storeStrong((id *)&self->_finishDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_executionTransaction, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_sessionContext, 0);
  objc_storeStrong((id *)&self->_syncContext, 0);
}

- (void)error
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.finished%@", v2, v3, v4, v5, v6);
}

- (void)_scheduleExecutionWithPreviousError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] throttle backoff is greater than max.  Failing the operation%@", v1, 0xCu);
}

- (void)_scheduleExecutionWithPreviousError:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] %@ has been denylisted and won't be attempted again%@");
}

- (void)_scheduleExecutionWithPreviousError:.cold.3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v1, "[DEBUG] attempting execution again in %.03fs%@", v2);
}

- (void)_scheduleExecutionWithPreviousError:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] cancelling operation since reached to maximal allowed backoff%@", v1, 0xCu);
}

- (void)_scheduleExecutionWithPreviousError:.cold.5()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v1, "[DEBUG] server provided backoff: %.03fs%@", v2);
}

- (void)_completedWithResult:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _operationFailureThrottle%@", v2, v3, v4, v5, v6);
}

- (void)_completedWithResult:error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, (uint64_t)v0, "[DEBUG] CloudKit account is temporarily unavailable. Invalidating account status after %@%@", v1);
}

- (void)completedWithResult:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] won't restore persona: %@%@");
}

- (void)completedWithResult:error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Not allowed to adopt persona - should fallback persona%@", v1, 0xCu);
}

- (void)completedWithResult:error:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Not allowed to adopt persona but data-separatedness matches%@", v1, 0xCu);
}

- (void)completedWithResult:error:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] Completed operation %@ with different persona than we started with%@");
}

- (void)addSubOperation:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _syncContext%@", v2, v3, v4, v5, v6);
}

- (void)cancelAfterDelay:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_7((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v6, v4, "[DEBUG] Timeout already expired, cancelling operation %@%@", v5);
}

@end