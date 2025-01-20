@interface LKAttentionAwareIdleTimerClient
- (LKAttentionAwareIdleTimerClient)initWithClientDelegate:(id)a3 timeout:(double)a4 queue:(id)a5;
- (LKAttentionAwareIdleTimerDelegate)clientDelegate;
- (OS_dispatch_queue)queue;
- (double)timeout;
- (unint64_t)handle;
- (unint64_t)idleTimerIndex;
- (void)_wakeupDeviceAfterInterval:(double)a3;
- (void)dealloc;
- (void)pause;
- (void)resume;
- (void)setClientDelegate:(id)a3;
- (void)setHandle:(unint64_t)a3;
- (void)setIdleTimerIndex:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation LKAttentionAwareIdleTimerClient

- (LKAttentionAwareIdleTimerClient)initWithClientDelegate:(id)a3 timeout:(double)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)LKAttentionAwareIdleTimerClient;
  v10 = [(LKAttentionAwareIdleTimerClient *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_clientDelegate, v8);
    v11->_timeout = a4;
    objc_storeStrong((id *)&v11->_queue, a5);
  }

  return v11;
}

- (void)dealloc
{
  v3 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2221A9000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating attention aware timer...", buf, 2u);
  }
  IOPMUnregisterNotification();
  v4.receiver = self;
  v4.super_class = (Class)LKAttentionAwareIdleTimerClient;
  [(LKAttentionAwareIdleTimerClient *)&v4 dealloc];
}

- (void)resume
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2221A9000, log, OS_LOG_TYPE_ERROR, "Failed to register for user activity notification", v1, 2u);
}

void __41__LKAttentionAwareIdleTimerClient_resume__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v6 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v20 = a2;
    __int16 v21 = 2048;
    uint64_t v22 = a3;
    _os_log_impl(&dword_2221A9000, v6, OS_LOG_TYPE_DEFAULT, "Event received: %llu, mostSignificantActivity: %llu", buf, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(v7 + 40);
  if (a2)
  {
    if ((v8 & 0x8000000000000000) == 0)
    {
      *(void *)(v7 + 40) = v8 | 0x8000000000000000;
      ++*(void *)(*(void *)(a1 + 32) + 40);
    }
  }
  else
  {
    uint64_t v9 = (uint64_t)*(double *)(v7 + 16) - *(void *)(a1 + 40);
    if (v9 >= 1)
    {
      [(id)v7 _wakeupDeviceAfterInterval:(double)v9];
      uint64_t v7 = *(void *)(a1 + 32);
    }
    uint64_t v10 = v8 & 0x7FFFFFFFFFFFFFFFLL;
    *(void *)(v7 + 40) = v10;
    v11 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 24));
    if (v11)
    {
      v12 = LKLogDefault;
      if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEBUG)) {
        __41__LKAttentionAwareIdleTimerClient_resume__block_invoke_cold_1(v10, v9, v12);
      }
      dispatch_time_t v13 = dispatch_time(0x8000000000000000, 1000000000 * v9);
      dispatch_source_set_timer(v11, v13, v9, 0);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __41__LKAttentionAwareIdleTimerClient_resume__block_invoke_3;
      handler[3] = &unk_2645FC270;
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v18 = v10;
      handler[4] = v14;
      v15 = v11;
      v17 = v15;
      dispatch_source_set_event_handler(v15, handler);
      dispatch_resume(v15);
    }
  }
}

void __41__LKAttentionAwareIdleTimerClient_resume__block_invoke_3(uint64_t a1)
{
  v2 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEBUG)) {
    __41__LKAttentionAwareIdleTimerClient_resume__block_invoke_3_cold_2(a1, v2);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  if (*(void *)(a1 + 48) == *(void *)(*(void *)(a1 + 32) + 40))
  {
    v3 = LKLogDefault;
    if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEBUG)) {
      __41__LKAttentionAwareIdleTimerClient_resume__block_invoke_3_cold_1(v3);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [WeakRetained idleTimerFiredForTimeout:*(double *)(*(void *)(a1 + 32) + 16)];
  }
}

- (void)pause
{
  IOPMUnregisterNotification();
  [(LKAttentionAwareIdleTimerClient *)self setHandle:0];
}

- (void)_wakeupDeviceAfterInterval:(double)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v4 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    dispatch_time_t v13 = "-[LKAttentionAwareIdleTimerClient _wakeupDeviceAfterInterval:]";
    __int16 v14 = 2048;
    double v15 = a3;
    _os_log_impl(&dword_2221A9000, v4, OS_LOG_TYPE_DEFAULT, "%s %f", buf, 0x16u);
  }
  v11[0] = @"logind";
  v5 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceNow:", a3, @"scheduledby", @"time");
  v10[2] = @"leeway";
  v11[1] = v5;
  v11[2] = &unk_26D4947D8;
  v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  int v7 = IOPMRequestSysWake();
  if (v7)
  {
    int v8 = v7;
    uint64_t v9 = LKLogDefault;
    if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_ERROR)) {
      -[LKAttentionAwareIdleTimerClient _wakeupDeviceAfterInterval:](v8, v9);
    }
  }
}

- (LKAttentionAwareIdleTimerDelegate)clientDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientDelegate);
  return (LKAttentionAwareIdleTimerDelegate *)WeakRetained;
}

- (void)setClientDelegate:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)handle
{
  return self->_handle;
}

- (void)setHandle:(unint64_t)a3
{
  self->_handle = a3;
}

- (unint64_t)idleTimerIndex
{
  return self->_idleTimerIndex;
}

- (void)setIdleTimerIndex:(unint64_t)a3
{
  self->_idleTimerIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_clientDelegate);
}

void __41__LKAttentionAwareIdleTimerClient_resume__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_2221A9000, log, OS_LOG_TYPE_DEBUG, "Scheduling dispatch timer #%lu for %lds", (uint8_t *)&v3, 0x16u);
}

void __41__LKAttentionAwareIdleTimerClient_resume__block_invoke_3_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2221A9000, log, OS_LOG_TYPE_DEBUG, "Telling delagate about idleTimerFiredForTimeout...", v1, 2u);
}

void __41__LKAttentionAwareIdleTimerClient_resume__block_invoke_3_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 40);
  int v4 = 134218240;
  uint64_t v5 = v2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_2221A9000, a2, OS_LOG_TYPE_DEBUG, "dispatch timer fired. Token: %lu, idle timer index: %lu", (uint8_t *)&v4, 0x16u);
}

- (void)_wakeupDeviceAfterInterval:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2221A9000, a2, OS_LOG_TYPE_ERROR, "Failed to request system wake: %d", (uint8_t *)v2, 8u);
}

@end