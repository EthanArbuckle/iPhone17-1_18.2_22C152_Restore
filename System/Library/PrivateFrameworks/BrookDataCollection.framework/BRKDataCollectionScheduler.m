@interface BRKDataCollectionScheduler
- (BRKDataCollectionScheduler)init;
- (void)_queue_schedule:(id)a3;
- (void)_queue_setSchedulerCriteria;
- (void)schedule:(id)a3;
@end

@implementation BRKDataCollectionScheduler

- (BRKDataCollectionScheduler)init
{
  v10.receiver = self;
  v10.super_class = (Class)BRKDataCollectionScheduler;
  v2 = [(BRKDataCollectionScheduler *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F086C0]) initWithIdentifier:@"com.apple.brook"];
    scheduler = v2->_scheduler;
    v2->_scheduler = (NSBackgroundActivityScheduler *)v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    sema = v2->_sema;
    v2->_sema = (OS_dispatch_semaphore *)v5;

    uint64_t v7 = BRKCreateDispatchQueue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)_queue_setSchedulerCriteria
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF8180], 0);
  v4 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_234680000, v4, OS_LOG_TYPE_INFO, "Executing NRPairedDeviceRegistry call to check for Tinker configuration", buf, 2u);
  }

  if ((BRKActiveDeviceIsAltAccount() & 1) == 0)
  {
    dispatch_semaphore_t v5 = BRKLoggingObjectForDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_234680000, v5, OS_LOG_TYPE_INFO, "Device is not configured with Tinker - scheduler criteria will be mutated!", v6, 2u);
    }

    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF8190], 1);
  }
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x263EF81A0], 5);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8288]);
  [(NSBackgroundActivityScheduler *)self->_scheduler _setAdditionalXPCActivityProperties:v3];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sema);
}

- (void)schedule:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__BRKDataCollectionScheduler_schedule___block_invoke;
  block[3] = &unk_264BF6F88;
  block[4] = self;
  id v10 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
  uint64_t v7 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_234680000, v7, OS_LOG_TYPE_INFO, "Queued data collection upload scheduler", v8, 2u);
  }
}

uint64_t __39__BRKDataCollectionScheduler_schedule___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_setSchedulerCriteria");
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return objc_msgSend(v2, "_queue_schedule:", v3);
}

- (void)_queue_schedule:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  sema = self->_sema;
  dispatch_time_t v6 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 300);
  intptr_t v7 = dispatch_semaphore_wait(sema, v6);
  v8 = BRKLoggingObjectForDomain();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BRKDataCollectionScheduler _queue_schedule:](v7, v9);
    }

    id v10 = BRKLoggingObjectForDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_234680000, v10, OS_LOG_TYPE_INFO, "Canceling data collection upload scheduler", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_234680000, v9, OS_LOG_TYPE_INFO, "Scheduling data collection scheduler", buf, 2u);
    }

    scheduler = self->_scheduler;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __46__BRKDataCollectionScheduler__queue_schedule___block_invoke;
    v12[3] = &unk_264BF6FB0;
    v13 = v4;
    [(NSBackgroundActivityScheduler *)scheduler scheduleWithBlock:v12];
    id v10 = v13;
  }
}

void __46__BRKDataCollectionScheduler__queue_schedule___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  id v4 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)dispatch_time_t v6 = 0;
    _os_log_impl(&dword_234680000, v4, OS_LOG_TYPE_INFO, "Fired data collection scheduler", v6, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
  v3[2](v3, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sema, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

- (void)_queue_schedule:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_234680000, a2, OS_LOG_TYPE_ERROR, "Unable to wait on semaphore %ld", (uint8_t *)&v2, 0xCu);
}

@end