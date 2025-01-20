@interface MLBackgroundWatchdog
+ (id)watchdogWithTimeout:(double)a3 label:(id)a4 queue:(id)a5;
+ (id)watchdogWithTimeout:(double)a3 queue:(id)a4;
- (OS_dispatch_source)timer;
- (void)dealloc;
- (void)invalidate;
- (void)setTimer:(id)a3;
@end

@implementation MLBackgroundWatchdog

- (void).cxx_destruct
{
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 8, 1);
}

- (void)invalidate
{
  v2 = [(MLBackgroundWatchdog *)self timer];
  dispatch_source_cancel(v2);
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_timer);
  v3.receiver = self;
  v3.super_class = (Class)MLBackgroundWatchdog;
  [(MLBackgroundWatchdog *)&v3 dealloc];
}

+ (id)watchdogWithTimeout:(double)a3 label:(id)a4 queue:(id)a5
{
  id v7 = a4;
  v8 = a5;
  v9 = objc_alloc_init(MLBackgroundWatchdog);
  if (!v8)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_create("CoreML Background Watchdog Queue", v10);
  }
  dispatch_source_t v11 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v8);
  [(MLBackgroundWatchdog *)v9 setTimer:v11];

  v12 = [(MLBackgroundWatchdog *)v9 timer];
  dispatch_time_t v13 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);

  v14 = [(MLBackgroundWatchdog *)v9 timer];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __56__MLBackgroundWatchdog_watchdogWithTimeout_label_queue___block_invoke;
  v24 = &unk_1E59A5458;
  id v25 = v7;
  v15 = v9;
  v26 = v15;
  id v16 = v7;
  dispatch_source_set_event_handler(v14, &v21);

  v17 = [(MLBackgroundWatchdog *)v15 timer];
  dispatch_resume(v17);

  v18 = v26;
  v19 = v15;

  return v19;
}

void __56__MLBackgroundWatchdog_watchdogWithTimeout_label_queue___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = +[MLLogging coreChannel];
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_FAULT);
  if (v2)
  {
    if (!v4) {
      goto LABEL_7;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v8;
    v5 = "%@ watchdog timer timeout";
    v6 = v3;
    uint32_t v7 = 12;
  }
  else
  {
    if (!v4) {
      goto LABEL_7;
    }
    LOWORD(v10) = 0;
    v5 = "Watchdog timer timeout";
    v6 = v3;
    uint32_t v7 = 2;
  }
  _os_log_fault_impl(&dword_19E58B000, v6, OS_LOG_TYPE_FAULT, v5, (uint8_t *)&v10, v7);
LABEL_7:

  v9 = [*(id *)(a1 + 40) timer];
  dispatch_source_cancel(v9);

  exit(1);
}

+ (id)watchdogWithTimeout:(double)a3 queue:(id)a4
{
  return (id)[a1 watchdogWithTimeout:0 label:a4 queue:a3];
}

@end