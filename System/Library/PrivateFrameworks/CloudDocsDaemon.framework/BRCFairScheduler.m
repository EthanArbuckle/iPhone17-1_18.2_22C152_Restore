@interface BRCFairScheduler
- (BRCFairScheduler)initWithWorkloop:(id)a3 name:(id)a4;
- (OS_dispatch_workloop)workloop;
- (id)sourceForBitIndex:(unint64_t)a3;
- (void)addSource:(id)a3;
- (void)cancel;
- (void)close;
- (void)dealloc;
- (void)resume;
- (void)schedule;
- (void)signalSourceForBitIndex:(unint64_t)a3;
- (void)suspend;
- (void)unregisterSources;
@end

@implementation BRCFairScheduler

- (BRCFairScheduler)initWithWorkloop:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)BRCFairScheduler;
  v9 = [(BRCFairScheduler *)&v27 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workloop, a3);
    objc_storeStrong((id *)&v10->_name, a4);
    dispatch_source_t v11 = dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, (dispatch_queue_t)v10->_workloop);
    source = v10->_source;
    v10->_source = (OS_dispatch_source *)v11;

    uint64_t v13 = objc_opt_new();
    sourceForBitIndex = v10->_sourceForBitIndex;
    v10->_sourceForBitIndex = (NSMutableDictionary *)v13;

    objc_initWeak(&location, v10);
    v15 = v10->_source;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __42__BRCFairScheduler_initWithWorkloop_name___block_invoke;
    v24[3] = &unk_1E6993C50;
    objc_copyWeak(&v25, &location);
    v16 = v15;
    v17 = v24;
    v18 = v16;
    v19 = v17;
    v20 = v19;
    v21 = v19;
    if (*MEMORY[0x1E4F59658])
    {
      v21 = ((void (*)(void *))*MEMORY[0x1E4F59658])(v19);
    }
    dispatch_block_t v22 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v21);
    dispatch_source_set_event_handler(v18, v22);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __42__BRCFairScheduler_initWithWorkloop_name___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained schedule];
}

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

- (void)addSource:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  sourceForBitIndex = v4->_sourceForBitIndex;
  v6 = [NSNumber numberWithUnsignedLong:v4->_maxRegistedSourceBit];
  [(NSMutableDictionary *)sourceForBitIndex setObject:v12 forKeyedSubscript:v6];

  v12[1] = v4->_maxRegistedSourceBit;
  unint64_t v7 = v4->_maxRegistedSourceBit + 1;
  v4->_maxRegistedSourceBit = v7;
  if (v7 >= 0x41)
  {
    abc_report_panic_with_signature();
    [NSString stringWithFormat:@"too many registered source"];
    objc_claimAutoreleasedReturnValue();
    id v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10 = brc_append_system_info_to_message();
      -[BRCServerZone didSyncDownRequestID:serverChangeToken:editedRecords:deletedRecordIDs:deletedShareRecordIDs:allocRankZones:caughtUp:pendingChanges:](v10, (uint64_t)v8, buf, v9);
    }

    brc_append_system_info_to_message();
    dispatch_source_t v11 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
    __assert_rtn("-[BRCFairScheduler addSource:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/foundation/BRCFairScheduler.m", 61, v11);
  }
  objc_sync_exit(v4);
}

- (void)unregisterSources
{
  obj = self;
  objc_sync_enter(obj);
  obj->_maxRegistedSourceBit = 0;
  sourceForBitIndex = obj->_sourceForBitIndex;
  obj->_sourceForBitIndex = 0;

  objc_sync_exit(obj);
}

- (id)sourceForBitIndex:(unint64_t)a3
{
  v4 = self;
  objc_sync_enter(v4);
  sourceForBitIndex = v4->_sourceForBitIndex;
  v6 = [NSNumber numberWithUnsignedLong:a3];
  unint64_t v7 = [(NSMutableDictionary *)sourceForBitIndex objectForKeyedSubscript:v6];

  objc_sync_exit(v4);
  return v7;
}

- (void)signalSourceForBitIndex:(unint64_t)a3
{
}

- (void)schedule
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workloop);
  source = self->_source;
  uintptr_t data = dispatch_source_get_data(source);
  if (data)
  {
    uintptr_t v5 = data;
    dispatch_suspend(source);
    unint64_t v6 = self->_lastVisitedBit + 1;
    for (int i = 1 << v6; (v5 & (1 << v6)) == 0; int i = 1 << v6)
      unint64_t v6 = (v6 + 1) % self->_maxRegistedSourceBit;
    self->_lastVisitedBit = v6;
    id v8 = -[BRCFairScheduler sourceForBitIndex:](self, "sourceForBitIndex:");
    uintptr_t v9 = v5 & ~i;
    v10 = [v8 workloop];
    workloop = self->_workloop;

    if (v10 == workloop)
    {
      [v8 _runEventHandler];
      dispatch_resume((dispatch_object_t)self->_source);
      if (v9) {
        dispatch_source_merge_data((dispatch_source_t)self->_source, v9);
      }
    }
    else
    {
      v12 = [v8 workloop];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __28__BRCFairScheduler_schedule__block_invoke;
      block[3] = &unk_1E6993F70;
      id v14 = v8;
      v15 = self;
      uintptr_t v16 = v9;
      dispatch_async(v12, block);
    }
  }
}

void __28__BRCFairScheduler_schedule__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _runEventHandler];
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 40) + 8));
  uintptr_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    v3 = *(NSObject **)(*(void *)(a1 + 40) + 8);
    dispatch_source_merge_data(v3, v2);
  }
}

- (void)resume
{
  self->_resumed = 1;
}

- (void)suspend
{
  self->_resumed = 0;
}

- (void)cancel
{
  dispatch_source_cancel((dispatch_source_t)self->_source);
  dispatch_activate((dispatch_object_t)self->_source);
  [(BRCFairScheduler *)self unregisterSources];
}

- (void)close
{
  workloop = self->_workloop;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__BRCFairScheduler_close__block_invoke;
  block[3] = &unk_1E6993698;
  void block[4] = self;
  dispatch_async_and_wait(workloop, block);
}

uint64_t __25__BRCFairScheduler_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (void)dealloc
{
  if (!self->_resumed) {
    dispatch_activate((dispatch_object_t)self->_source);
  }
  v3.receiver = self;
  v3.super_class = (Class)BRCFairScheduler;
  [(BRCFairScheduler *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceForBitIndex, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end