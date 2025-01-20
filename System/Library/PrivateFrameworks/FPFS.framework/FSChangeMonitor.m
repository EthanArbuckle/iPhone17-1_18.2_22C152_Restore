@interface FSChangeMonitor
- (BOOL)_activateSubscription:(id)a3 error:(id *)a4;
- (BOOL)_queueEvents:(id)a3 markSelfEncountered:(BOOL)a4;
- (BOOL)activateSubscription:(id)a3 error:(id *)a4;
- (BOOL)handleFSEvent:(id)a3 indexInBatch:(unsigned int)a4 batchSize:(unsigned int)a5;
- (BOOL)hasBufferedEvents;
- (BOOL)hasPlannedRescan;
- (BOOL)setUpStreamForReason:(int64_t)a3 error:(id *)a4;
- (FSChangeMonitor)init;
- (FSChangeMonitor)initWithLabel:(id)a3 workloop:(id)a4;
- (NSURL)barrierFolderURL;
- (OS_dispatch_queue)delegationQueue;
- (double)latency;
- (fpfs_fsevent_stream)_createStreamNamed:(id)a3 since:(unint64_t)a4 criteria:(id)a5;
- (id)description;
- (id)liveFSEventsXPCActivityCriteria;
- (id)subscribeToEventsAtPath:(id)a3 fd:(int)a4 sinceEventID:(unint64_t)a5 streamUUID:(id)a6 ignoreOwnEvents:(BOOL)a7 delegate:(id)a8 purpose:(id)a9;
- (unint64_t)oldestStartingPoint;
- (void)_cancel;
- (void)_close;
- (void)cancel;
- (void)close;
- (void)dealloc;
- (void)deliverBarrierEvents;
- (void)disableSubscription:(id)a3;
- (void)flushStream;
- (void)foreachSubscriptionInState:(unint64_t)a3 apply:(id)a4;
- (void)processFseventBatch;
- (void)queueEvents:(id)a3 markSelfEncountered:(BOOL)a4;
- (void)resetWithReason:(int64_t)a3 newFSEventID:(unint64_t)a4;
- (void)resume;
- (void)setBarrierFolderURL:(id)a3;
- (void)setPlannedRescan:(BOOL)a3;
- (void)suspend;
@end

@implementation FSChangeMonitor

- (FSChangeMonitor)init
{
}

- (FSChangeMonitor)initWithLabel:(id)a3 workloop:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)FSChangeMonitor;
  v8 = [(FSChangeMonitor *)&v42 init];
  v9 = v8;
  if (v8)
  {
    atomic_store(1u, (unsigned int *)&v8->_suspendCount);
    bzero(__str, 0x400uLL);
    id v10 = v6;
    snprintf(__str, 0x400uLL, "%s: fsevents-stream", (const char *)[v10 UTF8String]);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v13 = dispatch_queue_create(__str, v12);
    streamQueue = v9->_streamQueue;
    v9->_streamQueue = (OS_dispatch_queue *)v13;

    snprintf(__str, 0x400uLL, "%s: fsevents-process", (const char *)[v10 UTF8String]);
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v17 = dispatch_queue_create(__str, v16);
    processQueue = v9->_processQueue;
    v9->_processQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v9->_delegationQueue, a4);
    dispatch_source_t v19 = dispatch_source_create(MEMORY[0x263EF83B8], 0, 0, (dispatch_queue_t)v9->_delegationQueue);
    fseventsProcessSource = v9->_fseventsProcessSource;
    v9->_fseventsProcessSource = (OS_dispatch_source *)v19;

    v21 = fpfs_current_log();
    objc_storeStrong((id *)&v9->_log, v21);
    dispatch_set_qos_class_fallback();
    id location = 0;
    objc_initWeak(&location, v9);
    v22 = v9->_fseventsProcessSource;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__FSChangeMonitor_initWithLabel_workloop___block_invoke;
    block[3] = &unk_265307688;
    id v23 = v21;
    id v39 = v23;
    objc_copyWeak(&v40, &location);
    v24 = v22;
    dispatch_block_t v25 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
    dispatch_source_set_event_handler(v24, v25);

    v26 = [MEMORY[0x263F3C6D0] defaultStore];
    v9->_maxFSEventQueueSize = (int)[v26 maxFSEventQueueSize];

    v27 = [MEMORY[0x263F3C6D0] defaultStore];
    v9->_fseventProcessBatchSize = (int)[v27 fseventProcessBatchSize];

    uint64_t v28 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v9->_maxFSEventQueueSize];
    fseventsToProcess = v9->_fseventsToProcess;
    v9->_fseventsToProcess = (NSMutableArray *)v28;

    v30 = getenv("FPFS_FSCHANGEMONITOR_NODELAY");
    BOOL v32 = 0;
    if (v30)
    {
      v31 = v30;
      if (!strcmp(v30, "1") || !strcasecmp(v31, "true") || !strcasecmp(v31, "yes")) {
        BOOL v32 = 1;
      }
    }
    v9->_createNoDelay = v32;
    v9->_optimizeOutOwnEvents = 1;
    uint64_t v33 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
    subscriptions = v9->_subscriptions;
    v9->_subscriptions = (NSMutableArray *)v33;

    uint64_t v35 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
    pendingBarrierEvents = v9->_pendingBarrierEvents;
    v9->_pendingBarrierEvents = (NSMutableArray *)v35;

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }
  return v9;
}

void __42__FSChangeMonitor_initWithLabel_workloop___block_invoke(uint64_t a1)
{
  v3 = fpfs_adopt_log();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained processFseventBatch];

  __fp_pop_log();
}

- (void)dealloc
{
  volume = self->_volume;
  self->_volume = 0;

  streamQueue = self->_streamQueue;
  self->_streamQueue = 0;

  processQueue = self->_processQueue;
  self->_processQueue = 0;

  delegationQueue = self->_delegationQueue;
  self->_delegationQueue = 0;

  fseventsProcessSource = self->_fseventsProcessSource;
  if (fseventsProcessSource)
  {
    dispatch_source_cancel(fseventsProcessSource);
    dispatch_activate((dispatch_object_t)self->_fseventsProcessSource);
    v8 = self->_fseventsProcessSource;
    self->_fseventsProcessSource = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)FSChangeMonitor;
  [(FSChangeMonitor *)&v9 dealloc];
}

- (id)subscribeToEventsAtPath:(id)a3 fd:(int)a4 sinceEventID:(unint64_t)a5 streamUUID:(id)a6 ignoreOwnEvents:(BOOL)a7 delegate:(id)a8 purpose:(id)a9
{
  BOOL v10 = a7;
  uint64_t v13 = *(void *)&a4;
  id v15 = a3;
  id v16 = a6;
  id v17 = a8;
  id v18 = a9;
  dispatch_source_t v19 = [[FSChangeSubscription alloc] initWithPath:v15 fd:v13 reader:self sinceEventID:a5 streamUUID:v16 ignoreOwnEvents:v10 delegate:v17 purpose:v18];
  if (v19)
  {
    [(FSChangeMonitor *)self suspend];
    v20 = self;
    objc_sync_enter(v20);
    [(NSMutableArray *)v20->_subscriptions addObject:v19];
    if (!v10) {
      v20->_optimizeOutOwnEvents = 0;
    }
    objc_sync_exit(v20);

    v21 = v19;
  }

  return v19;
}

- (BOOL)_activateSubscription:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 isActivated]) {
    -[FSChangeMonitor _activateSubscription:error:]();
  }
  [v6 setIsActivated:1];
  volume = self->_volume;
  if (!volume)
  {
    v8 = objc_alloc_init(FPFSVolume);
    objc_super v9 = [v6 root];
    BOOL v10 = [(FPFSVolume *)v8 setupForPath:v9 error:a4];

    if (!v10)
    {
      BOOL v17 = 0;
      goto LABEL_9;
    }
    v11 = self->_volume;
    self->_volume = v8;

    volume = self->_volume;
  }
  v8 = [(FPFSVolume *)volume eventStreamUUID];
  uint64_t v12 = [v6 eventStreamUUID];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [v6 eventStreamUUID];
    char v15 = [(FPFSVolume *)v8 isEqual:v14];

    if ((v15 & 1) == 0)
    {
      id v16 = [v6 delegate];
      [v16 subscription:v6 handleResetWithReason:4];
    }
  }
  [v6 setEventStreamUUID:v8];
  BOOL v17 = [(FSChangeMonitor *)self setUpStreamForReason:3 error:a4];
LABEL_9:

  return v17;
}

- (BOOL)activateSubscription:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  BOOL isActivated = v7->_isActivated;
  if (!v7->_isActivated) {
    v7->_BOOL isActivated = 1;
  }
  BOOL v9 = [(FSChangeMonitor *)v7 _activateSubscription:v6 error:a4];
  objc_sync_exit(v7);

  if (!isActivated) {
    [(FSChangeMonitor *)v7 resume];
  }
  [(FSChangeMonitor *)v7 resume];

  return v9;
}

- (void)disableSubscription:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if ([(NSMutableArray *)v4->_subscriptions count]) {
    [(NSMutableArray *)v4->_subscriptions removeObject:v7];
  }
  uint64_t v5 = [(NSMutableArray *)v4->_subscriptions count];
  if (!v5) {
    v4->_BOOL isActivated = 0;
  }
  char v6 = [v7 isActivated];
  objc_sync_exit(v4);

  if (v5)
  {
    if (v6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  [(FSChangeMonitor *)v4 suspend];
  if ((v6 & 1) == 0) {
LABEL_7:
  }
    [(FSChangeMonitor *)v4 resume];
LABEL_8:
}

- (void)foreachSubscriptionInState:(unint64_t)a3 apply:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  char v6 = (uint64_t (**)(id, id))a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
  v8 = self;
  objc_sync_enter(v8);
  BOOL v9 = (void *)[(NSMutableArray *)v8->_subscriptions copy];
  objc_sync_exit(v8);
  p_isa = (id *)&v8->super.isa;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
        char v15 = (void *)MEMORY[0x25332A4D0]();
        id v16 = v14;
        objc_sync_enter(v16);
        if (([v16 state] & a3) != 0 && (v6[2](v6, v16) & 1) == 0)
        {
          objc_sync_exit(v16);

          BOOL v17 = (id *)v10;
          goto LABEL_15;
        }
        if ([v16 state] == 4) {
          [v7 addObject:v16];
        }
        objc_sync_exit(v16);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  if ([v7 count])
  {
    BOOL v17 = p_isa;
    objc_sync_enter(v17);
    [p_isa[12] removeObjectsInArray:v7];
    objc_sync_exit(v17);
LABEL_15:
  }
}

- (unint64_t)oldestStartingPoint
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__FSChangeMonitor_oldestStartingPoint__block_invoke;
  v4[3] = &unk_2653076B0;
  v4[4] = &v5;
  [(FSChangeMonitor *)self foreachSubscriptionInState:3 apply:v4];
  if (v6[3]) {
    unint64_t v2 = v6[3];
  }
  else {
    unint64_t v2 = -1;
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __38__FSChangeMonitor_oldestStartingPoint__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 lastDeliveredEventID];
  if (v3 != -1)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v4 + 24) - 1 >= v3) {
      *(void *)(v4 + 24) = v3;
    }
  }
  return 1;
}

- (double)latency
{
  if (self->_createNoDelay) {
    return 0.0;
  }
  unint64_t v3 = [MEMORY[0x263F3C6D0] defaultStore];
  [v3 fseventsAggregationDelay];
  double v5 = v4;

  return v5;
}

- (BOOL)hasBufferedEvents
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  processQueue = self->_processQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__FSChangeMonitor_hasBufferedEvents__block_invoke;
  v5[3] = &unk_2653076D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(processQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__FSChangeMonitor_hasBufferedEvents__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (fpfs_fsevent_stream)_createStreamNamed:(id)a3 since:(unint64_t)a4 criteria:(id)a5
{
  BOOL createNoDelay = self->_createNoDelay;
  subscriptions = self->_subscriptions;
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = [(NSMutableArray *)subscriptions valueForKey:@"root"];
  uint64_t v13 = [(NSURL *)self->_barrierFolderURL path];
  if (v13)
  {
    uint64_t v14 = [v12 arrayByAddingObject:v13];

    uint64_t v12 = (void *)v14;
  }
  self->_isProcessingHistory = a4 != -1;
  char v15 = fp_current_or_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[FSChangeMonitor _createStreamNamed:since:criteria:]();
  }
  if (createNoDelay) {
    FSEventStreamCreateFlags v16 = 243;
  }
  else {
    FSEventStreamCreateFlags v16 = 241;
  }

  id v17 = v11;
  id v18 = (const char *)[v17 UTF8String];

  [(FSChangeMonitor *)self latency];
  long long v20 = fpfs_fsevent_stream_open(v18, (uint64_t)fseventsCallback, (uint64_t)self, (const __CFArray *)v12, a4, v16, self->_streamQueue, v10, v19);

  return (fpfs_fsevent_stream *)v20;
}

- (id)liveFSEventsXPCActivityCriteria
{
  return 0;
}

- (BOOL)setUpStreamForReason:(int64_t)a3 error:(id *)a4
{
  self->_drainEvents = 0;
  uint64_t v5 = [(FSChangeMonitor *)self oldestStartingPoint];
  uint64_t v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[FSChangeMonitor setUpStreamForReason:error:](v5, v6);
  }

  stream = self->_stream;
  if (stream)
  {
    fpfs_fsevent_stream_close((uint64_t)stream);
    self->_stream = 0;
  }
  uint64_t v8 = [(FSChangeMonitor *)self liveFSEventsXPCActivityCriteria];
  char v9 = [(FSChangeMonitor *)self _createStreamNamed:@"com.apple.fpfs.fsevents" since:v5 criteria:v8];
  self->_stream = v9;
  BOOL v10 = v9 != 0;

  return v10;
}

- (BOOL)_queueEvents:(id)a3 markSelfEncountered:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(NSMutableArray *)self->_fseventsToProcess count])
  {
    uint64_t v7 = [(NSMutableArray *)self->_fseventsToProcess objectAtIndexedSubscript:0];
    int v8 = [v7 flags] & 0xE;

    if (v8)
    {
      char v9 = fp_current_or_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[FSChangeMonitor _queueEvents:markSelfEncountered:]();
      }

LABEL_23:
      BOOL v18 = 0;
      goto LABEL_24;
    }
  }
  BOOL v10 = [v6 objectAtIndexedSubscript:0];
  int v11 = [v10 flags] & 0xE;

  if (v11)
  {
    uint64_t v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[FSChangeMonitor _queueEvents:markSelfEncountered:]();
    }

    [(NSMutableArray *)self->_fseventsToProcess removeAllObjects];
    fseventsToProcess = self->_fseventsToProcess;
    uint64_t v14 = [v6 objectAtIndexedSubscript:0];
    [(NSMutableArray *)fseventsToProcess addObject:v14];

    dispatch_source_merge_data((dispatch_source_t)self->_fseventsProcessSource, 1uLL);
    goto LABEL_23;
  }
  if (v4)
  {
    if (self->_hasMarkSelf)
    {
      int v15 = [(NSMutableArray *)self->_fseventsToProcess count];
      if (v15 >= 1)
      {
        uint64_t v16 = v15 + 1;
        while (1)
        {
          id v17 = [(NSMutableArray *)self->_fseventsToProcess objectAtIndexedSubscript:(v16 - 2)];
          if (([v17 flags] & 0x80000) != 0) {
            break;
          }

          if ((unint64_t)--v16 <= 1) {
            goto LABEL_19;
          }
        }
        [(NSMutableArray *)self->_fseventsToProcess removeObjectAtIndex:(v16 - 2)];
      }
    }
    else
    {
      self->_hasMarkSelf = 1;
    }
  }
LABEL_19:
  if ([(NSMutableArray *)self->_fseventsToProcess count] >= self->_maxFSEventQueueSize) {
    -[FSChangeMonitor _queueEvents:markSelfEncountered:]();
  }
  [(NSMutableArray *)self->_fseventsToProcess addObjectsFromArray:v6];
  if ([(NSMutableArray *)self->_fseventsToProcess count]) {
    dispatch_source_merge_data((dispatch_source_t)self->_fseventsProcessSource, 1uLL);
  }
  if ([(NSMutableArray *)self->_fseventsToProcess count] < self->_maxFSEventQueueSize) {
    goto LABEL_23;
  }
  long long v20 = fp_current_or_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v21 = 0;
    _os_log_impl(&dword_24D3D0000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] We still have too many events in the queue, blocking until events are flushed", v21, 2u);
  }

  BOOL v18 = 1;
LABEL_24:

  return v18;
}

- (void)queueEvents:(id)a3 markSelfEncountered:(BOOL)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v14 = 0;
    int v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    processQueue = self->_processQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__FSChangeMonitor_queueEvents_markSelfEncountered___block_invoke;
    block[3] = &unk_265307700;
    uint64_t v12 = &v14;
    void block[4] = self;
    id v11 = v6;
    BOOL v13 = a4;
    dispatch_sync(processQueue, block);
    if (*((unsigned char *)v15 + 24))
    {
      delegationQueue = self->_delegationQueue;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __51__FSChangeMonitor_queueEvents_markSelfEncountered___block_invoke_2;
      v9[3] = &unk_2653070B0;
      v9[4] = self;
      dispatch_async_and_wait(delegationQueue, v9);
    }

    _Block_object_dispose(&v14, 8);
  }
}

uint64_t __51__FSChangeMonitor_queueEvents_markSelfEncountered___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _queueEvents:*(void *)(a1 + 40) markSelfEncountered:*(unsigned __int8 *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __51__FSChangeMonitor_queueEvents_markSelfEncountered___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) processFseventBatch];
}

- (void)processFseventBatch
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  fpfs_adopt_log();
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_delegationQueue);
  char v3 = self->_processQueue;
  if (v3)
  {
    BOOL v4 = fssync_default_log();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);

    id v6 = fssync_default_log();
    uint64_t v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      uint64_t v8 = [(NSMutableArray *)self->_fseventsToProcess count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v8;
      _os_signpost_emit_with_name_impl(&dword_24D3D0000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "FS: event batch", "count %llu", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__0;
    v31 = __Block_byref_object_dispose__0;
    id v32 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    [(FSChangeMonitor *)self foreachSubscriptionInState:2 apply:&__block_literal_global_3];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__FSChangeMonitor_processFseventBatch__block_invoke_2;
    block[3] = &unk_265307748;
    void block[4] = self;
    void block[5] = &buf;
    block[6] = &v23;
    dispatch_sync((dispatch_queue_t)v3, block);
    uint64_t v9 = [*(id *)(*((void *)&buf + 1) + 40) count];
    uint64_t v10 = v9;
    if (v9)
    {
      uint64_t v11 = 0;
      uint64_t v12 = v9 - 1;
      do
      {
        BOOL v13 = (void *)MEMORY[0x25332A4D0]();
        uint64_t v14 = [*(id *)(*((void *)&buf + 1) + 40) objectAtIndexedSubscript:v11];
        BOOL v15 = [(FSChangeMonitor *)self handleFSEvent:v14 indexInBatch:v11 batchSize:v10];
      }
      while (v12 != v11++ && v15);
    }
    [(FSChangeMonitor *)self foreachSubscriptionInState:2 apply:&__block_literal_global_21];
    if (*((unsigned char *)v24 + 24))
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __38__FSChangeMonitor_processFseventBatch__block_invoke_4;
      v21[3] = &unk_2653070B0;
      v21[4] = self;
      dispatch_async((dispatch_queue_t)v3, v21);
    }
    BOOL v18 = fssync_default_log();
    CFTimeInterval v19 = v18;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)long long v20 = 0;
      _os_signpost_emit_with_name_impl(&dword_24D3D0000, v19, OS_SIGNPOST_INTERVAL_END, v5, "FS: event batch", "", v20, 2u);
    }

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&buf, 8);
  }
  __fp_pop_log();
}

uint64_t __38__FSChangeMonitor_processFseventBatch__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [v2 delegate];
  [v3 subscriptionWillHandleBatchOfEvents:v2];

  return 1;
}

uint64_t __38__FSChangeMonitor_processFseventBatch__block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void *)(v2 + 72);
  unint64_t v4 = [*(id *)(v2 + 56) count];
  if (v3 >= v4) {
    unint64_t v3 = v4;
  }
  uint64_t v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "subarrayWithRange:", 0, v3);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "removeObjectsInRange:", 0, v3);
  *(unsigned char *)(*(void *)(a1 + 32) + 84) = 0;
  id v8 = *(id *)(a1 + 32);
  objc_sync_enter(v8);
  int v9 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 85);
  objc_sync_exit(v8);

  if (v9)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = *(id *)(*(void *)(a1 + 32) + 56);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          if ((objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "flags", (void)v16) & 0x80000) != 0)
          {
            *(unsigned char *)(*(void *)(a1 + 32) + 84) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "count", (void)v16);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result != 0;
  return result;
}

uint64_t __38__FSChangeMonitor_processFseventBatch__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [v2 delegate];
  [v3 subscriptionDidHandleBatchOfEvents:v2];

  return 1;
}

void __38__FSChangeMonitor_processFseventBatch__block_invoke_4(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  if (v1) {
    dispatch_source_merge_data(v1, 1uLL);
  }
}

- (void)deliverBarrierEvents
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__FSChangeMonitor_deliverBarrierEvents__block_invoke;
  v10[3] = &unk_265307770;
  v10[4] = self;
  v10[5] = &v11;
  [(FSChangeMonitor *)self foreachSubscriptionInState:2 apply:v10];
  uint64_t v3 = [(NSMutableArray *)self->_pendingBarrierEvents count];
  if (v3 != v12[3])
  {
    uint64_t v4 = [(NSMutableArray *)self->_pendingBarrierEvents count];
    uint64_t v5 = v12[3];
    uint64_t v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = "";
      if ((unint64_t)(v4 - v5) > 1) {
        uint64_t v7 = "s";
      }
      *(_DWORD *)long long buf = 134218242;
      uint64_t v16 = v4 - v5;
      __int16 v17 = 2080;
      long long v18 = v7;
      _os_log_impl(&dword_24D3D0000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] %lu barrier event%s not delivered, dropping!", buf, 0x16u);
    }
  }
  id v8 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
  pendingBarrierEvents = self->_pendingBarrierEvents;
  self->_pendingBarrierEvents = v8;

  _Block_object_dispose(&v11, 8);
}

uint64_t __39__FSChangeMonitor_deliverBarrierEvents__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 104);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(v3, "didProcessBarrierEventUUID:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          int v9 = fp_current_or_default_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
            __39__FSChangeMonitor_deliverBarrierEvents__block_invoke_cold_1();
          }

          ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return 1;
}

- (BOOL)handleFSEvent:(id)a3 indexInBatch:(unsigned int)a4 batchSize:(unsigned int)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v37 = [v8 path];
  uint64_t v9 = [v8 eventID];
  uint64_t v10 = [v8 fileID];
  int v11 = [v8 flags];
  uint64_t v12 = [v8 additionalDebugFlagsForHistoricalStream:self->_isProcessingHistory] | v11;
  v36 = objc_msgSend(NSString, "fpfs_initWithFSEventsFlags:", v12);
  long long v13 = fssync_default_log();
  os_signpost_id_t v14 = os_signpost_id_generate(v13);

  BOOL v15 = fssync_default_log();
  uint64_t v16 = v15;
  unint64_t v17 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)long long buf = 138413058;
    *(void *)v46 = v37;
    *(_WORD *)&v46[8] = 2048;
    *(void *)v47 = v10;
    *(_WORD *)&v47[8] = 2112;
    *(void *)v48 = v36;
    *(_WORD *)&v48[8] = 2048;
    *(void *)v49 = v9;
    _os_signpost_emit_with_name_impl(&dword_24D3D0000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "FS: event", "path %@ fileID %llu flags %@ eventID %llu", buf, 0x2Au);
  }

  long long v18 = fp_current_or_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v32 = objc_msgSend(v37, "fp_prettyPath");
    *(_DWORD *)long long buf = 67110402;
    *(_DWORD *)v46 = a4 + 1;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = a5;
    *(_WORD *)v47 = 2112;
    *(void *)&v47[2] = v32;
    uint64_t v33 = (void *)v32;
    *(_WORD *)v48 = 2048;
    *(void *)&v48[2] = v10;
    *(_WORD *)v49 = 2112;
    *(void *)&v49[2] = v36;
    __int16 v50 = 2048;
    uint64_t v51 = v9;
    _os_log_debug_impl(&dword_24D3D0000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Dequeueing event: %u/%u path:'%@' fileID:%llu flags:%@ id:%llu", buf, 0x36u);
  }
  if ((v12 & 8) != 0)
  {
    uint64_t v23 = fp_current_or_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_24D3D0000, v23, OS_LOG_TYPE_INFO, "[INFO] fsevents id wrapped", buf, 2u);
    }

    [(FSChangeMonitor *)self resetWithReason:5 newFSEventID:-1];
    uint64_t v24 = fssync_default_log();
    long long v22 = v24;
    if (v17 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v24)) {
      goto LABEL_37;
    }
    *(_WORD *)long long buf = 0;
    goto LABEL_36;
  }
  if ((v12 & 0x10) == 0)
  {
    if ((v12 & 4) != 0)
    {
      id v27 = fp_current_or_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_24D3D0000, v27, OS_LOG_TYPE_INFO, "[INFO] kernel dropped an event", buf, 2u);
      }

      [(FSChangeMonitor *)self resetWithReason:10 newFSEventID:-1];
      uint64_t v28 = fssync_default_log();
      long long v22 = v28;
      if (v17 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v28)) {
        goto LABEL_37;
      }
      *(_WORD *)long long buf = 0;
    }
    else
    {
      if ((v12 & 2) == 0) {
        goto LABEL_10;
      }
      if (self->_isProcessingHistory)
      {
        uint64_t v29 = fp_current_or_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_24D3D0000, v29, OS_LOG_TYPE_INFO, "[INFO] dropped event during the processing of the historical stream", buf, 2u);
        }

        [(FSChangeMonitor *)self resetWithReason:8 newFSEventID:-1];
        v30 = fssync_default_log();
        long long v22 = v30;
        if (v17 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v30)) {
          goto LABEL_37;
        }
        *(_WORD *)long long buf = 0;
      }
      else
      {
        if (self->_plannedRescan)
        {
LABEL_10:
          v38[0] = MEMORY[0x263EF8330];
          v38[1] = 3221225472;
          v38[2] = __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke;
          v38[3] = &unk_265307798;
          int v44 = v12;
          uint64_t v42 = v9;
          id v39 = v8;
          id v40 = self;
          id v41 = v37;
          uint64_t v43 = v10;
          [(FSChangeMonitor *)self foreachSubscriptionInState:2 apply:v38];
          uint64_t v19 = fssync_default_log();
          long long v20 = v19;
          if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl(&dword_24D3D0000, v20, OS_SIGNPOST_INTERVAL_END, v14, "FS: event", "", buf, 2u);
          }

          BOOL v21 = 1;
          long long v22 = v39;
          goto LABEL_38;
        }
        v34 = fp_current_or_default_log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_24D3D0000, v34, OS_LOG_TYPE_INFO, "[INFO] dropped event during the processing of the live stream", buf, 2u);
        }

        [(FSChangeMonitor *)self resetWithReason:9 newFSEventID:0];
        uint64_t v35 = fssync_default_log();
        long long v22 = v35;
        if (v17 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v35))
        {
LABEL_37:
          BOOL v21 = 0;
          goto LABEL_38;
        }
        *(_WORD *)long long buf = 0;
      }
    }
LABEL_36:
    _os_signpost_emit_with_name_impl(&dword_24D3D0000, v22, OS_SIGNPOST_INTERVAL_END, v14, "FS: event", "", buf, 2u);
    goto LABEL_37;
  }
  uint64_t v25 = fp_current_or_default_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_24D3D0000, v25, OS_LOG_TYPE_INFO, "[INFO] done processing history", buf, 2u);
  }

  self->_isProcessingHistory = 0;
  [(FSChangeMonitor *)self deliverBarrierEvents];
  char v26 = fssync_default_log();
  long long v22 = v26;
  if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24D3D0000, v22, OS_SIGNPOST_INTERVAL_END, v14, "FS: event", "", buf, 2u);
  }
  BOOL v21 = 1;
LABEL_38:

  return v21;
}

uint64_t __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (![v3 ignoreOwnEvents] || (*(unsigned char *)(a1 + 74) & 8) == 0)
  {
    id v4 = [*(id *)(a1 + 32) barrierUUID];
    if (v4)
    {
      if (*(unsigned char *)(*(void *)(a1 + 40) + 86))
      {
        uint64_t v5 = fp_current_or_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_7();
        }

        [*(id *)(*(void *)(a1 + 40) + 104) addObject:v4];
        goto LABEL_22;
      }
      if ((*(unsigned char *)(a1 + 73) & 1) == 0)
      {
LABEL_22:
        uint64_t v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
      if ([v3 didProcessBarrierEventUUID:v4])
      {
        uint64_t v12 = fp_current_or_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          __39__FSChangeMonitor_deliverBarrierEvents__block_invoke_cold_1();
        }

        goto LABEL_22;
      }
LABEL_29:
      uint64_t v11 = 1;
      goto LABEL_30;
    }
    if ((*(unsigned char *)(a1 + 72) & 2) != 0)
    {
      long long v13 = fp_current_or_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_5();
      }

      os_signpost_id_t v14 = [v3 delegate];
      [v14 subscriptionHandleDroppedEvent:v3];
    }
    else
    {
      uint64_t v6 = *(void **)(a1 + 48);
      uint64_t v7 = [v3 root];
      LOBYTE(v6) = [v6 hasPrefix:v7];

      if (v6)
      {
        if (*(unsigned char *)(*(void *)(a1 + 40) + 86)
          || (*(_WORD *)(a1 + 72) & 0xB01) == 0
          || ([*(id *)(a1 + 32) rawFlags] & 0x80000) != 0
          || (uint64_t v16 = *(void **)(a1 + 48),
              [v3 root],
              unint64_t v17 = objc_claimAutoreleasedReturnValue(),
              LODWORD(v16) = [v16 isEqualToString:v17],
              v17,
              !v16))
        {
LABEL_11:
          id v8 = fp_current_or_default_log();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
            __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_1();
          }

          uint64_t v9 = [v3 delegate];
          [v9 subscription:v3 handleEventAtPath:*(void *)(a1 + 48) targetItemID:*(void *)(a1 + 64) eventID:*(void *)(a1 + 56) flags:*(unsigned int *)(a1 + 72)];

          [v3 didProcessEventID:*(void *)(a1 + 56)];
          goto LABEL_29;
        }
        memset(&v23, 0, sizeof(v23));
        objc_msgSend(v3, "root", 0);
        long long v18 = objc_claimAutoreleasedReturnValue();
        if (lstat((const char *)[v18 fileSystemRepresentation], &v23) < 0)
        {
          int v19 = *__error();

          if (v19 == 2) {
            goto LABEL_40;
          }
          long long v18 = fp_current_or_default_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_3(v3, v18);
          }
        }

LABEL_40:
        __darwin_ino64_t st_ino = v23.st_ino;
        if (st_ino != [v3 rootFileID])
        {
          long long v22 = fp_current_or_default_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
            __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_2(v3, (uint64_t)&v23.st_ino, v22);
          }

          exit(1);
        }
        if ((*(_WORD *)(a1 + 72) & 0xA01) != 0)
        {
          BOOL v21 = fp_current_or_default_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            id v25 = v3;
            _os_log_impl(&dword_24D3D0000, v21, OS_LOG_TYPE_INFO, "[INFO] %@ root needs deep-scan", buf, 0xCu);
          }

          [*(id *)(a1 + 40) resetWithReason:6 newFSEventID:-1];
          goto LABEL_22;
        }
        goto LABEL_11;
      }
      os_signpost_id_t v14 = fp_current_or_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_4();
      }
    }

    goto LABEL_29;
  }
  uint64_t v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_8();
  }

  [v3 didProcessEventID:*(void *)(a1 + 56)];
  uint64_t v11 = 1;
LABEL_31:

  return v11;
}

- (id)description
{
  int v3 = atomic_load((unsigned int *)&self->_suspendCount);
  if (v3 <= 0) {
    id v4 = @"running";
  }
  else {
    id v4 = @"suspended";
  }
  if (self->_isCancelled) {
    uint64_t v5 = @"cancelled";
  }
  else {
    uint64_t v5 = v4;
  }
  int v6 = atomic_load((unsigned int *)&self->_resetCount);
  if (v6 >= 1)
  {
    uint64_t v7 = atomic_load((unsigned int *)&self->_resetCount);
    uint64_t v5 = [(__CFString *)v5 stringByAppendingFormat:@" reset:%d", v7];
  }
  if (self->_stream)
  {
    uint64_t v8 = [(__CFString *)v5 stringByAppendingFormat:@" [open stream]"];

    uint64_t v5 = (__CFString *)v8;
  }
  uint64_t v9 = [(NSMutableArray *)self->_subscriptions valueForKey:@"root"];
  uint64_t v10 = NSString;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = [v9 componentsJoinedByString:@", "];
  long long v13 = [v10 stringWithFormat:@"<%@: %p %@ roots: %@>", v11, self, v5, v12];

  return v13;
}

- (void)flushStream
{
}

- (void)_close
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processQueue);
  [(FSChangeMonitor *)self suspend];
  int v3 = self;
  objc_sync_enter(v3);
  fseventsProcessSource = v3->_fseventsProcessSource;
  if (fseventsProcessSource)
  {
    dispatch_resume(fseventsProcessSource);
    uint64_t v5 = v3->_fseventsProcessSource;
    v3->_fseventsProcessSource = 0;
  }
  uint64_t stream = (uint64_t)v3->_stream;
  if (stream)
  {
    fpfs_fsevent_stream_close(stream);
    v3->_uint64_t stream = 0;
    v3->_drainEvents = 1;
  }
  uint64_t v7 = (void *)[(NSMutableArray *)v3->_subscriptions copy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dispose", (void)v13);
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [(NSMutableArray *)v3->_subscriptions removeAllObjects];
  volume = v3->_volume;
  v3->_volume = 0;

  objc_sync_exit(v3);
}

- (void)close
{
  *(_DWORD *)a2 = 134218242;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = a1;
  id v6 = a1;
  _os_log_debug_impl(&dword_24D3D0000, a4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx closing the %@", (uint8_t *)a2, 0x16u);
}

void __24__FSChangeMonitor_close__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__FSChangeMonitor_close__block_invoke_2;
  block[3] = &unk_2653070B0;
  void block[4] = v1;
  dispatch_sync(v2, block);
}

uint64_t __24__FSChangeMonitor_close__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

uint64_t __24__FSChangeMonitor_close__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _close];
}

- (void)resetWithReason:(int64_t)a3 newFSEventID:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  fpfs_adopt_log();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = objc_opt_class();
    [(FSChangeMonitor *)v8 resetWithReason:(uint64_t)v13 newFSEventID:v7];
  }

  if (!atomic_fetch_add(&self->_resetCount, 1u)) {
    [(FSChangeMonitor *)self suspend];
  }
  dispatch_time_t v9 = dispatch_time(0, 2000000000);
  streamQueue = self->_streamQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke;
  v11[3] = &unk_2653077E0;
  v11[4] = self;
  v11[5] = a4;
  v11[6] = a3;
  dispatch_after(v9, streamQueue, v11);
  __fp_pop_log();
}

uint64_t __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke(uint64_t result)
{
  if ((int)atomic_fetch_add((atomic_uint *volatile)(*(void *)(result + 32) + 8), 0xFFFFFFFF) <= 1)
  {
    uint64_t v1 = result;
    uint64_t section = __fp_create_section();
    id v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke_cold_1((uint64_t)&section, v2, v3, v4, v5, v6, v7, v8);
    }

    *(unsigned char *)(*(void *)(v1 + 32) + 81) = 1;
    uint64_t v9 = *(void *)(v1 + 32);
    uint64_t v10 = *(NSObject **)(v9 + 40);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke_48;
    v11[3] = &unk_2653077E0;
    v11[4] = v9;
    long long v12 = *(_OWORD *)(v1 + 40);
    dispatch_async_and_wait(v10, v11);
    [*(id *)(v1 + 32) resume];
    return __fp_leave_section_Debug();
  }
  return result;
}

void __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke_48(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke_2;
  block[3] = &unk_2653077E0;
  void block[4] = v1;
  long long v4 = *(_OWORD *)(a1 + 40);
  dispatch_sync(v2, block);
}

uint64_t __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke_2(uint64_t a1)
{
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke_2_cold_1();
  }

  if (*(void *)(a1 + 40)
    || (uint64_t v6 = [*(id *)(a1 + 32) oldestStartingPoint], *(void *)(a1 + 40))
    || v6 == -1)
  {
    [*(id *)(a1 + 32) deliverBarrierEvents];
    [*(id *)(a1 + 32) setPlannedRescan:1];
    uint64_t v3 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke_49;
    v7[3] = &__block_descriptor_48_e30_B16__0__FSChangeSubscription_8l;
    long long v8 = *(_OWORD *)(a1 + 40);
    [v3 foreachSubscriptionInState:2 apply:v7];
  }
  long long v4 = *(uint64_t **)(a1 + 32);
  if (v4[2])
  {
    fpfs_fsevent_stream_close(v4[2]);
    *(void *)(*(void *)(a1 + 32) + 16) = 0;
    long long v4 = *(uint64_t **)(a1 + 32);
  }
  return [v4 setUpStreamForReason:*(void *)(a1 + 48) error:0];
}

uint64_t __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke_49(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setLastDeliveredEventID:v3];
  uint64_t v5 = [v4 delegate];
  [v5 subscription:v4 handleResetWithReason:*(void *)(a1 + 40)];

  return 1;
}

- (void)suspend
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = a1 + 1;
  _os_log_debug_impl(&dword_24D3D0000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] suspending - suspendCount:%d->%d", (uint8_t *)v2, 0xEu);
}

- (void)resume
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_debug_impl(&dword_24D3D0000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] resuming - suspendCount:%d->%d", (uint8_t *)v3, 0xEu);
}

- (void)_cancel
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processQueue);
  if (!self->_isCancelled)
  {
    self->_isCancelled = 1;
    atomic_fetch_add(&self->_resetCount, 1u);
    uint64_t stream = self->_stream;
    if (stream) {
      fpfs_fsevent_stream_suspend((uint64_t)stream);
    }
    fseventsProcessSource = self->_fseventsProcessSource;
    if (fseventsProcessSource)
    {
      dispatch_source_cancel(fseventsProcessSource);
    }
  }
}

- (void)cancel
{
  streamQueue = self->_streamQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__FSChangeMonitor_cancel__block_invoke;
  block[3] = &unk_2653070B0;
  void block[4] = self;
  dispatch_async(streamQueue, block);
}

void __25__FSChangeMonitor_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__FSChangeMonitor_cancel__block_invoke_2;
  block[3] = &unk_2653070B0;
  void block[4] = v1;
  dispatch_async_and_wait(v2, block);
}

uint64_t __25__FSChangeMonitor_cancel__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

- (OS_dispatch_queue)delegationQueue
{
  return self->_delegationQueue;
}

- (NSURL)barrierFolderURL
{
  return self->_barrierFolderURL;
}

- (void)setBarrierFolderURL:(id)a3
{
}

- (BOOL)hasPlannedRescan
{
  return self->_plannedRescan;
}

- (void)setPlannedRescan:(BOOL)a3
{
  self->_plannedRescan = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barrierFolderURL, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_pendingBarrierEvents, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_fseventsToProcess, 0);
  objc_storeStrong((id *)&self->_fseventsProcessSource, 0);
  objc_storeStrong((id *)&self->_delegationQueue, 0);
  objc_storeStrong((id *)&self->_processQueue, 0);

  objc_storeStrong((id *)&self->_streamQueue, 0);
}

- (void)_activateSubscription:error:.cold.1()
{
}

- (void)_createStreamNamed:since:criteria:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_24D3D0000, v0, v1, "[DEBUG] Observing %@ (%s)");
}

- (void)setUpStreamForReason:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  __int16 v3 = "com.apple.fpfs.fsevents";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_24D3D0000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Creating stream with name %s since %llu", (uint8_t *)&v2, 0x16u);
}

- (void)_queueEvents:markSelfEncountered:.cold.1()
{
}

- (void)_queueEvents:markSelfEncountered:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_24D3D0000, v0, v1, "[DEBUG] Incoming events need deep scan.  Dropping all existing events", v2, v3, v4, v5, v6);
}

- (void)_queueEvents:markSelfEncountered:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_24D3D0000, v0, v1, "[DEBUG] Already need deep scan.  Dropping all incoming events", v2, v3, v4, v5, v6);
}

void __39__FSChangeMonitor_deliverBarrierEvents__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_24D3D0000, v0, v1, "[DEBUG] %@ (handling barrier - %@)");
}

void __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_24D3D0000, v0, v1, "[DEBUG] %@ processing", v2, v3, v4, v5, v6);
}

void __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  [a1 rootFileID];
  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_24D3D0000, a3, OS_LOG_TYPE_FAULT, "[CRIT] The root fileID changed from %llu to %llu", v4, 0x16u);
}

void __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_3(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 root];
  int v4 = *__error();
  int v5 = 138412546;
  uint8_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_24D3D0000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Cannot stat root at '%@' after fsevent:%{errno}d", (uint8_t *)&v5, 0x12u);
}

void __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_24D3D0000, v0, v1, "[DEBUG] %@ (ignored uninteresting path)", v2, v3, v4, v5, v6);
}

void __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_24D3D0000, v0, v1, "[DEBUG] %@ (dropped event)", v2, v3, v4, v5, v6);
}

void __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_24D3D0000, v0, v1, "[DEBUG] Historical stream is being processed - enqueuing barrier event %@", v2, v3, v4, v5, v6);
}

void __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_8()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_24D3D0000, v0, v1, "[DEBUG] %@ ignore event #%llu (own event)");
}

- (void)resetWithReason:(uint64_t)a3 newFSEventID:(NSObject *)a4 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  if ((unint64_t)(a2 - 1) > 9) {
    uint8_t v6 = @"unspecified reason";
  }
  else {
    uint8_t v6 = off_265307870[a2 - 1];
  }
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = v6;
  id v7 = a1;
  _os_log_debug_impl(&dword_24D3D0000, a4, OS_LOG_TYPE_DEBUG, "[DEBUG] resetting the %@ because of %@", (uint8_t *)a3, 0x16u);
}

void __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_24D3D0000, v0, v1, "[DEBUG] creating the new stream", v2, v3, v4, v5, v6);
}

@end