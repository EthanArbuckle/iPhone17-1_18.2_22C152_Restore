@interface CMContinuityCaptureMSNExceptionMonitor
+ (id)sharedMonitor;
+ (void)initialize;
- (id)_init;
- (void)decrementExceptionCountForEntity:(int64_t)a3;
- (void)incrementExceptionCountForEntity:(int64_t)a3;
- (void)reset;
@end

@implementation CMContinuityCaptureMSNExceptionMonitor

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

+ (id)sharedMonitor
{
  if (sharedMonitor_sOnceToken != -1) {
    dispatch_once(&sharedMonitor_sOnceToken, &__block_literal_global_19);
  }
  v2 = (void *)sharedMonitor_sMonitor;
  return v2;
}

uint64_t __55__CMContinuityCaptureMSNExceptionMonitor_sharedMonitor__block_invoke()
{
  sharedMonitor_sMonitor = [[CMContinuityCaptureMSNExceptionMonitor alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)CMContinuityCaptureMSNExceptionMonitor;
  v2 = [(CMContinuityCaptureMSNExceptionMonitor *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("msn-exception-queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    entityExceptions = v2->_entityExceptions;
    v2->_entityExceptions = v5;
  }
  return v2;
}

- (void)incrementExceptionCountForEntity:(int64_t)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__CMContinuityCaptureMSNExceptionMonitor_incrementExceptionCountForEntity___block_invoke;
  block[3] = &unk_264C9A320;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __75__CMContinuityCaptureMSNExceptionMonitor_incrementExceptionCountForEntity___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_queue_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[2];
    v5 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
    LOBYTE(v4) = [v4 containsObject:v5];

    if (v4)
    {
      v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v22 = v7;
      long long v23 = v7;
      long long v20 = v7;
      long long v21 = v7;
      long long v18 = v7;
      long long v19 = v7;
      long long v16 = v7;
      long long v17 = v7;
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      id v8 = v3[2];
      v9 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
      [v8 addObject:v9];

      if (dword_268850F88)
      {
        v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v22 = v11;
        long long v23 = v11;
        long long v20 = v11;
        long long v21 = v11;
        long long v18 = v11;
        long long v19 = v11;
        long long v16 = v11;
        long long v17 = v11;
        os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (objc_msgSend(v3[2], "count", v14, v15) == 1)
      {
        if (dword_268850F88)
        {
          v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v22 = v13;
          long long v23 = v13;
          long long v20 = v13;
          long long v21 = v13;
          long long v18 = v13;
          long long v19 = v13;
          long long v16 = v13;
          long long v17 = v13;
          os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        MSNMonitorBeginException();
      }
    }
  }
}

- (void)decrementExceptionCountForEntity:(int64_t)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__CMContinuityCaptureMSNExceptionMonitor_decrementExceptionCountForEntity___block_invoke;
  block[3] = &unk_264C9A320;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __75__CMContinuityCaptureMSNExceptionMonitor_decrementExceptionCountForEntity___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_queue_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[2];
    v5 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
    LODWORD(v4) = [v4 containsObject:v5];

    if (v4)
    {
      id v6 = v3[2];
      long long v7 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
      [v6 removeObject:v7];

      if (dword_268850F88)
      {
        id v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v22 = v9;
        long long v23 = v9;
        long long v20 = v9;
        long long v21 = v9;
        long long v18 = v9;
        long long v19 = v9;
        long long v16 = v9;
        long long v17 = v9;
        os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (!objc_msgSend(v3[2], "count", v14, v15))
      {
        if (dword_268850F88)
        {
          v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v22 = v13;
          long long v23 = v13;
          long long v20 = v13;
          long long v21 = v13;
          long long v18 = v13;
          long long v19 = v13;
          long long v16 = v13;
          long long v17 = v13;
          os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        MSNMonitorEndException();
      }
    }
    else if (dword_268850F88)
    {
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v22 = v11;
      long long v23 = v11;
      long long v20 = v11;
      long long v21 = v11;
      long long v18 = v11;
      long long v19 = v11;
      long long v16 = v11;
      long long v17 = v11;
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (void)reset
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (dword_268850F88)
  {
    int v9 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    dispatch_queue_t v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v16 = v4;
    long long v17 = v4;
    long long v14 = v4;
    long long v15 = v4;
    long long v12 = v4;
    long long v13 = v4;
    *(_OWORD *)id location = v4;
    long long v11 = v4;
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__CMContinuityCaptureMSNExceptionMonitor_reset__block_invoke;
  block[3] = &unk_264C990F8;
  objc_copyWeak(&v7, location);
  dispatch_async(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(location);
}

void __47__CMContinuityCaptureMSNExceptionMonitor_reset__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[2] removeAllObjects];
    WeakRetained = v2;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityExceptions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end