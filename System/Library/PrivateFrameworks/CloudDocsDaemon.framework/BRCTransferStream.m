@interface BRCTransferStream
- (BOOL)isCancelled;
- (BRCTransferStream)initWithSyncContext:(id)a3 name:(id)a4 scheduler:(id)a5 maxCountOfBatchesInFlight:(unint64_t)a6;
- (NSArray)operations;
- (double)progressForTransferID:(id)a3 operationID:(id)a4;
- (id)streamDidBecomeReadyToTransferRecords;
- (unint64_t)inFlightSize;
- (void)_addBatchOperation:(id)a3;
- (void)_evaluateCap;
- (void)_schedule;
- (void)_scheduleOneBatchWithQoS:(int64_t)a3;
- (void)_setReachedCap:(BOOL)a3;
- (void)addAliasItem:(id)a3 toTransferWithID:(id)a4 operationID:(id)a5;
- (void)addBatchOperation:(id)a3;
- (void)cancel;
- (void)cancelTransferID:(id)a3 operationID:(id)a4;
- (void)close;
- (void)endSchedulingMultipleItemsInteractively;
- (void)forceSchedulingPendingInteractiveTransfers;
- (void)resume;
- (void)setStreamDidBecomeReadyToTransferRecords:(id)a3;
- (void)signal;
- (void)signalWithDeadline:(int64_t)minSignalTime;
- (void)startSchedulingMultipleItemsInteractively;
- (void)suspend;
@end

@implementation BRCTransferStream

- (NSArray)operations
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NSMutableDictionary *)v2->_inFlightOpByID allValues];
  v4 = (void *)[v3 copy];

  objc_sync_exit(v2);
  return (NSArray *)v4;
}

- (BRCTransferStream)initWithSyncContext:(id)a3 name:(id)a4 scheduler:(id)a5 maxCountOfBatchesInFlight:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v31.receiver = self;
  v31.super_class = (Class)BRCTransferStream;
  v14 = [(BRCTransferStream *)&v31 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_syncContext, a3);
    v15->_session = (BRCAccountSession *)(id)[v11 session];
    if (!v13)
    {
      abc_report_panic_with_signature();
      uint64_t v26 = [NSString stringWithFormat:@"scheduler is nil"];
      v27 = brc_bread_crumbs();
      v28 = brc_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        __48__BRCDaemon_listener_shouldAcceptNewConnection___block_invoke_130_cold_1(v26, (uint64_t)v27, v28);
      }

      brc_append_system_info_to_message();
      v29 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
      __assert_rtn("-[BRCTransferStream initWithSyncContext:name:scheduler:maxCountOfBatchesInFlight:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/sync/transfers/BRCTransferStream.m", 65, v29);
    }
    v16 = [[BRCDeadlineSource alloc] initWithScheduler:v13 name:v12];
    schedulingSource = v15->_schedulingSource;
    v15->_schedulingSource = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    inFlightOpByID = v15->_inFlightOpByID;
    v15->_inFlightOpByID = v18;

    dispatch_workloop_t v20 = dispatch_workloop_create((const char *)[v12 UTF8String]);
    transferWorkloop = v15->_transferWorkloop;
    v15->_transferWorkloop = (OS_dispatch_workloop *)v20;

    dispatch_group_t v22 = dispatch_group_create();
    transferBatchRequestWaiter = v15->_transferBatchRequestWaiter;
    v15->_transferBatchRequestWaiter = (OS_dispatch_group *)v22;

    v24 = v15->_schedulingSource;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __82__BRCTransferStream_initWithSyncContext_name_scheduler_maxCountOfBatchesInFlight___block_invoke;
    v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v30[4] = v15;
    [(BRCDeadlineSource *)v24 setEventHandler:v30];
    [(BRCDeadlineSource *)v15->_schedulingSource setWorkloop:v15->_transferWorkloop];
    v15->_maxCountOfBatchesInFlight = a6;
  }

  return v15;
}

void __82__BRCTransferStream_initWithSyncContext_name_scheduler_maxCountOfBatchesInFlight___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D9438760]();
  [*(id *)(a1 + 32) _schedule];
}

- (void)signalWithDeadline:(int64_t)minSignalTime
{
  if (self->_minSignalTime > minSignalTime) {
    minSignalTime = self->_minSignalTime;
  }
  [(BRCDeadlineSource *)self->_schedulingSource signalWithDeadline:minSignalTime];
}

- (void)signal
{
}

- (void)_setReachedCap:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transferWorkloop);
  if (self->_hasReachedCap != v3)
  {
    self->_hasReachedCap = v3;
    schedulingSource = self->_schedulingSource;
    if (v3)
    {
      [(BRCDeadlineSource *)schedulingSource suspend];
    }
    else
    {
      [(BRCDeadlineSource *)schedulingSource resume];
    }
  }
}

- (void)startSchedulingMultipleItemsInteractively
{
}

- (void)endSchedulingMultipleItemsInteractively
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _multipleItemsInteractiveSchedulingCount >= 0%@", v2, v3, v4, v5, v6);
}

- (void)forceSchedulingPendingInteractiveTransfers
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┏%llx force scheduling interactive transfers%@", (void)v3, DWORD2(v3));
}

void __63__BRCTransferStream_forceSchedulingPendingInteractiveTransfers__block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 40))
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    os_log_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) allValues];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v39 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v38 + 1) + 8 * i) cancel];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v38 objects:v45 count:16];
      }
      while (v4);
    }

    [*(id *)(a1 + 32) signal];
    return;
  }
  unint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 40) count];
  uint64_t v8 = *(void *)(a1 + 32);
  unint64_t v9 = *(void *)(v8 + 80);
  unint64_t v10 = 2 * v9;
  if (*(unsigned char *)(v8 + 72)) {
    BOOL v11 = v7 >= v10;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = v7;
  }
  else {
    unint64_t v12 = v7 + 1;
  }
  if (v12 >= v9)
  {
    uint64_t v32 = 2 * v9;
    unint64_t v33 = v7;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v13 = [*(id *)(v8 + 40) allValues];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      v16 = 0;
      uint64_t v17 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v13);
          }
          v19 = *(void **)(*((void *)&v34 + 1) + 8 * j);
          if (([v16 isCancelled] & 1) == 0 && (objc_msgSend(v16, "isFinished") & 1) == 0)
          {
            if (!v16
              || ([v19 startDate],
                  dispatch_workloop_t v20 = objc_claimAutoreleasedReturnValue(),
                  [v16 startDate],
                  v21 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v22 = [v20 compare:v21],
                  v21,
                  v20,
                  v22 == -1))
            {
              id v23 = v19;

              v16 = v23;
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v44 count:16];
      }
      while (v15);
    }
    else
    {
      v16 = 0;
    }

    v24 = brc_bread_crumbs();
    v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      __63__BRCTransferStream_forceSchedulingPendingInteractiveTransfers__block_invoke_cold_4((uint64_t)v16);
    }

    if (!v16)
    {
      v30 = brc_bread_crumbs();
      objc_super v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
        __63__BRCTransferStream_forceSchedulingPendingInteractiveTransfers__block_invoke_cold_3();
      }
    }
    [v16 cancel];

    unint64_t v10 = v32;
    unint64_t v7 = v33;
  }
  if (v7 >= v10)
  {
    uint64_t v26 = brc_bread_crumbs();
    v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v26;
      _os_log_impl(&dword_1D353B000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] We have way too many operations in flight.  Waiting for cancelled operations to finish cancelling%@", buf, 0xCu);
    }
    goto LABEL_41;
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 72))
  {
    uint64_t v26 = brc_bread_crumbs();
    v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      __63__BRCTransferStream_forceSchedulingPendingInteractiveTransfers__block_invoke_cold_2();
    }
LABEL_41:

    return;
  }
  v28 = brc_bread_crumbs();
  v29 = brc_default_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    __63__BRCTransferStream_forceSchedulingPendingInteractiveTransfers__block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) _scheduleOneBatchWithQoS:25];
}

- (void)_evaluateCap
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transferWorkloop);
  if ([(NSMutableDictionary *)self->_inFlightOpByID count] >= self->_maxCountOfBatchesInFlight)
  {
    [(BRCTransferStream *)self _setReachedCap:1];
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v3 = [(NSMutableDictionary *)self->_inFlightOpByID objectEnumerator];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          unint64_t v9 = self->_maxCountOfBatchesInFlight * [v8 doneSize];
          if (v9 < [v8 totalSize])
          {
            [(BRCTransferStream *)self _setReachedCap:1];

            return;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    [(BRCTransferStream *)self _setReachedCap:0];
  }
}

- (void)_addBatchOperation:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    long long v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCTransferStream _addBatchOperation:]();
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transferWorkloop);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCTransferStream _addBatchOperation:]((uint64_t)v4);
  }

  if (v4)
  {
    unint64_t v7 = [v4 operationID];
    uint64_t v8 = [v4 finishBlock];
    objc_initWeak(&location, self);
    uint64_t v9 = [v4 totalSize];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __40__BRCTransferStream__addBatchOperation___block_invoke;
    v23[3] = &unk_1E6996998;
    objc_copyWeak(&v24, &location);
    v23[4] = self;
    [v4 setDidProgressBlock:v23];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __40__BRCTransferStream__addBatchOperation___block_invoke_3;
    v18 = &unk_1E6998290;
    objc_copyWeak(v22, &location);
    id v10 = v8;
    id v21 = v10;
    v19 = self;
    v22[1] = (id)v9;
    id v11 = v7;
    id v20 = v11;
    [v4 setFinishBlock:&v15];
    self->_inFlightSize += v9;
    long long v12 = self;
    objc_sync_enter(v12);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12->_inFlightOpByID, "setObject:forKeyedSubscript:", v4, v11, v15, v16, v17, v18, v19);
    objc_sync_exit(v12);

    [v4 schedule];
    [(BRCTransferStream *)v12 _evaluateCap];

    objc_destroyWeak(v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

void __40__BRCTransferStream__addBatchOperation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (([WeakRetained isCancelled] & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(NSObject **)(v3 + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__BRCTransferStream__addBatchOperation___block_invoke_2;
    block[3] = &unk_1E6993698;
    block[4] = v3;
    dispatch_async_and_wait(v4, block);
  }
}

uint64_t __40__BRCTransferStream__addBatchOperation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _evaluateCap];
}

void __40__BRCTransferStream__addBatchOperation___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
  if (WeakRetained)
  {
    objc_msgSend(v6, "br_suggestedRetryTimeInterval");
    if (v9 > 0.0)
    {
      double v10 = v9;
      id v11 = WeakRetained;
      objc_sync_enter(v11);
      uint64_t v12 = brc_current_date_nsec();
      uint64_t v13 = brc_interval_to_nsec() + v12;
      if (v13 > (uint64_t)v11[4])
      {
        uint64_t v14 = brc_bread_crumbs();
        uint64_t v15 = brc_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          __40__BRCTransferStream__addBatchOperation___block_invoke_3_cold_1((uint64_t)v14, v15, v10);
        }

        v11[4] = (id)v13;
      }
      objc_sync_exit(v11);
    }
    uint64_t v16 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__BRCTransferStream__addBatchOperation___block_invoke_5;
    block[3] = &unk_1E6993F70;
    uint64_t v17 = *(void *)(a1 + 64);
    block[4] = WeakRetained;
    uint64_t v20 = v17;
    id v19 = *(id *)(a1 + 40);
    dispatch_async_and_wait(v16, block);
    [WeakRetained[1] availableDiskSpaceDidChange];
  }
}

uint64_t __40__BRCTransferStream__addBatchOperation___block_invoke_5(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 64) -= *(void *)(a1 + 48);
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
  objc_sync_exit(v2);

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 _evaluateCap];
}

- (void)addBatchOperation:(id)a3
{
  id v4 = a3;
  if (!self->_isWaitingForTransferBatch)
  {
    uint64_t v8 = brc_bread_crumbs();
    double v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCTransferStream addBatchOperation:]();
    }
  }
  transferWorkloop = self->_transferWorkloop;
  transferBatchRequestWaiter = self->_transferBatchRequestWaiter;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__BRCTransferStream_addBatchOperation___block_invoke;
  v10[3] = &unk_1E6993628;
  v10[4] = self;
  id v11 = v4;
  id v7 = v4;
  dispatch_group_async(transferBatchRequestWaiter, transferWorkloop, v10);
}

uint64_t __39__BRCTransferStream_addBatchOperation___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isCancelled]) {
    [*(id *)(a1 + 40) cancel];
  }
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _addBatchOperation:v3];
}

- (void)_scheduleOneBatchWithQoS:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transferWorkloop);
  id v5 = [(BRCSyncContext *)self->_syncContext defaults];
  [(BRCDeadlineSource *)self->_schedulingSource suspend];
  dispatch_group_enter((dispatch_group_t)self->_transferBatchRequestWaiter);
  self->_isWaitingForTransferBatch = 1;
  streamDidBecomeReadyToTransferRecords = (void (**)(id, unint64_t, int64_t, void *))self->_streamDidBecomeReadyToTransferRecords;
  [v5 transferQueueTransferBudget];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__BRCTransferStream__scheduleOneBatchWithQoS___block_invoke;
  v8[3] = &unk_1E6993698;
  v8[4] = self;
  streamDidBecomeReadyToTransferRecords[2](streamDidBecomeReadyToTransferRecords, (unint64_t)v7, a3, v8);
}

void __46__BRCTransferStream__scheduleOneBatchWithQoS___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__BRCTransferStream__scheduleOneBatchWithQoS___block_invoke_2;
  block[3] = &unk_1E6993698;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __46__BRCTransferStream__scheduleOneBatchWithQoS___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
  [*(id *)(*(void *)(a1 + 32) + 24) resume];
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  dispatch_group_leave(v2);
}

- (void)_schedule
{
}

- (void)cancelTransferID:(id)a3 operationID:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(0, (uint64_t)"-[BRCTransferStream cancelTransferID:operationID:]", 306, v18);
  uint64_t v8 = brc_bread_crumbs();
  double v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = v18[0];
    uint64_t v14 = [v7 UUIDString];
    *(_DWORD *)buf = 134218754;
    uint64_t v20 = v13;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v14;
    __int16 v25 = 2112;
    uint64_t v26 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx cancelling entry %@ in %@%@", buf, 0x2Au);
  }
  transferWorkloop = self->_transferWorkloop;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__BRCTransferStream_cancelTransferID_operationID___block_invoke;
  v15[3] = &unk_1E6993600;
  v15[4] = self;
  id v11 = v7;
  id v16 = v11;
  id v12 = v6;
  id v17 = v12;
  dispatch_async_with_logs_10(transferWorkloop, v15);

  __brc_leave_section(v18);
}

void __50__BRCTransferStream_cancelTransferID_operationID___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];
  [v2 cancelTransferID:a1[6]];
}

- (void)addAliasItem:(id)a3 toTransferWithID:(id)a4 operationID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  transferWorkloop = self->_transferWorkloop;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__BRCTransferStream_addAliasItem_toTransferWithID_operationID___block_invoke;
  v15[3] = &unk_1E6993CC8;
  v15[4] = self;
  id v16 = v10;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async_with_logs_10(transferWorkloop, v15);
}

void __63__BRCTransferStream_addAliasItem_toTransferWithID_operationID___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];
  [v2 addAliasItem:a1[6] toTransferWithID:a1[7]];
}

- (double)progressForTransferID:(id)a3 operationID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [(NSMutableDictionary *)v8->_inFlightOpByID objectForKeyedSubscript:v7];
  objc_sync_exit(v8);

  [v9 progressForTransferID:v6];
  double v11 = v10;

  return v11;
}

- (void)resume
{
}

- (void)cancel
{
  self->_isCancelled = 1;
  [(BRCDeadlineSource *)self->_schedulingSource cancel];
  transferWorkloop = self->_transferWorkloop;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__BRCTransferStream_cancel__block_invoke;
  v4[3] = &unk_1E6993698;
  v4[4] = self;
  dispatch_async_with_logs_10(transferWorkloop, v4);
}

void __27__BRCTransferStream_cancel__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  uint64_t v1 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "objectEnumerator", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) cancel];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)close
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isCancelled%@", v2, v3, v4, v5, v6);
}

void __26__BRCTransferStream_close__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    long long v7 = brc_bread_crumbs();
    long long v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCTransferStream close]();
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint8_t v6 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = 0;
}

void __26__BRCTransferStream_close__block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 73))
  {
    uint64_t v5 = *(void **)(v4 + 24);
    [v5 resume];
  }
}

- (void)suspend
{
}

- (id)streamDidBecomeReadyToTransferRecords
{
  return self->_streamDidBecomeReadyToTransferRecords;
}

- (void)setStreamDidBecomeReadyToTransferRecords:(id)a3
{
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (unint64_t)inFlightSize
{
  return self->_inFlightSize;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_streamDidBecomeReadyToTransferRecords, 0);
  objc_storeStrong((id *)&self->_transferBatchRequestWaiter, 0);
  objc_storeStrong((id *)&self->_transferWorkloop, 0);
  objc_storeStrong((id *)&self->_inFlightOpByID, 0);
  objc_storeStrong((id *)&self->_schedulingSource, 0);
  objc_storeStrong((id *)&self->_syncContext, 0);
}

void __63__BRCTransferStream_forceSchedulingPendingInteractiveTransfers__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Force scheduling a new high priority batch%@", v1, 0xCu);
}

void __63__BRCTransferStream_forceSchedulingPendingInteractiveTransfers__block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] waiting for the next scheduling to finish%@", v1, 0xCu);
}

void __63__BRCTransferStream_forceSchedulingPendingInteractiveTransfers__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: oldestBatchOperation%@", v2, v3, v4, v5, v6);
}

void __63__BRCTransferStream_forceSchedulingPendingInteractiveTransfers__block_invoke_cold_4(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] cancelling oldest batch (%@)%@", (void)v3, DWORD2(v3));
}

- (void)_addBatchOperation:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] adding operation %@ to the transfer stream%@", (void)v3, DWORD2(v3));
}

- (void)_addBatchOperation:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: operation%@", v2, v3, v4, v5, v6);
}

void __40__BRCTransferStream__addBatchOperation___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  double v4 = a3;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_1D353B000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Transfer stream backing off %.03fs%@", (uint8_t *)&v3, 0x16u);
}

- (void)addBatchOperation:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _isWaitingForTransferBatch%@", v2, v3, v4, v5, v6);
}

@end