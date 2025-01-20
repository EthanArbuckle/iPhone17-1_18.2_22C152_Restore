@interface BRCThrottler
- (BRCThrottler)initWithName:(id)a3 throttleParameters:(id)a4 queue:(id)a5 handler:(id)a6;
- (void)cancel;
- (void)reset;
- (void)resume;
- (void)scheduleNextEvent;
- (void)suspend;
@end

@implementation BRCThrottler

- (BRCThrottler)initWithName:(id)a3 throttleParameters:(id)a4 queue:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = a5;
  id v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)BRCThrottler;
  v14 = [(BRCThrottler *)&v30 init];
  if (v14)
  {
    v15 = [[BRCThrottleBase alloc] initWithName:v10 andParameters:v11];
    throttle = v14->_throttle;
    v14->_throttle = v15;

    v17 = (const char *)[v10 UTF8String];
    v18 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(v18, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create_with_target_V2(v17, v19, v12);

    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v20;

    dispatch_source_t v22 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v12);
    source = v14->_source;
    v14->_source = (OS_dispatch_source *)v22;

    v24 = v14->_source;
    id v25 = v13;
    v26 = v25;
    v27 = v25;
    if (*MEMORY[0x1E4F59658])
    {
      v27 = ((void (*)(id))*MEMORY[0x1E4F59658])(v25);
    }
    dispatch_block_t v28 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v27);
    dispatch_source_set_event_handler(v24, v28);
  }
  return v14;
}

- (void)scheduleNextEvent
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__BRCThrottler_scheduleNextEvent__block_invoke;
  block[3] = &unk_1E6993698;
  block[4] = self;
  dispatch_async(queue, block);
}

void __33__BRCThrottler_scheduleNextEvent__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    uint64_t v2 = brc_current_date_nsec();
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) nsecsToNextRetry:*(void *)(*(void *)(a1 + 32) + 16) retryCount:*(void *)(a1 + 32) + 24 now:v2];
    if (!v3) {
      *(void *)(*(void *)(a1 + 32) + 16) = v2;
    }
    v4 = brc_bread_crumbs();
    v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __33__BRCThrottler_scheduleNextEvent__block_invoke_cold_1(v3, (uint64_t)v4, v5);
    }

    v6 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    dispatch_time_t v7 = dispatch_time(0, v3);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

- (void)reset
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__BRCThrottler_reset__block_invoke;
  block[3] = &unk_1E6993698;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __21__BRCThrottler_reset__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 16) = 0;
  *(_DWORD *)(*(void *)(result + 32) + 24) = 0;
  return result;
}

- (void)resume
{
}

- (void)suspend
{
}

- (void)cancel
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__BRCThrottler_cancel__block_invoke;
  block[3] = &unk_1E6993698;
  block[4] = self;
  dispatch_async(queue, block);
}

void __22__BRCThrottler_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_throttle, 0);
}

void __33__BRCThrottler_scheduleNextEvent__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  brc_interval_from_nsec();
  int v6 = 134218242;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Next event will fire in %fs%@", (uint8_t *)&v6, 0x16u);
}

@end