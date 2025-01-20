@interface AMSMemoryPressure
+ (AMSObservable)observable;
+ (NSString)lastKnownStatus;
+ (id)_memoryPressureStatusForMemoryPressure:(unsigned int)a3;
+ (void)initialize;
+ (void)subscribe:(id)a3;
+ (void)unsubscribe:(id)a3;
@end

@implementation AMSMemoryPressure

+ (void)initialize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__AMSMemoryPressure_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, block);
  }
}

void __31__AMSMemoryPressure_initialize__block_invoke(uint64_t a1)
{
  dispatch_source_t v2 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 7uLL, 0);
  v3 = (void *)qword_1EB38DD08;
  qword_1EB38DD08 = (uint64_t)v2;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = qword_1EB38DD08;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__AMSMemoryPressure_initialize__block_invoke_2;
  v5[3] = &unk_1E559F890;
  objc_copyWeak(&v6, &location);
  dispatch_source_set_event_handler(v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __31__AMSMemoryPressure_initialize__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_source_t v2 = +[AMSMemoryPressure _memoryPressureStatusForMemoryPressure:dispatch_source_get_data((dispatch_source_t)qword_1EB38DD08)];
  id v3 = WeakRetained;
  objc_sync_enter(v3);
  if ([(id)_MergedGlobals_125 isEqualToString:v2])
  {
    id v4 = 0;
  }
  else
  {
    v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 138543874;
      id v10 = (id)objc_opt_class();
      __int16 v11 = 2114;
      uint64_t v12 = _MergedGlobals_125;
      __int16 v13 = 2114;
      v14 = v2;
      id v7 = v10;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_INFO, "%{public}@: The memory pressure status changed. old = %{public}@ | new = %{public}@", (uint8_t *)&v9, 0x20u);
    }
    if (_MergedGlobals_125 || ([v2 isEqualToString:0] & 1) == 0) {
      id v4 = v2;
    }
    else {
      id v4 = 0;
    }
    objc_storeStrong((id *)&_MergedGlobals_125, v2);
  }
  objc_sync_exit(v3);

  if (v4)
  {
    v8 = [v3 observable];
    [v8 sendResult:v4];
  }
}

+ (NSString)lastKnownStatus
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = (id)_MergedGlobals_125;
  objc_sync_exit(v2);

  return (NSString *)v3;
}

+ (AMSObservable)observable
{
  if (qword_1EB38DD10 != -1) {
    dispatch_once(&qword_1EB38DD10, &__block_literal_global_81);
  }
  id v2 = (void *)qword_1EB38DD18;
  return (AMSObservable *)v2;
}

uint64_t __31__AMSMemoryPressure_observable__block_invoke()
{
  qword_1EB38DD18 = objc_alloc_init(AMSObservable);
  return MEMORY[0x1F41817F8]();
}

+ (void)subscribe:(id)a3
{
  id v4 = a3;
  id v5 = [a1 observable];
  [v5 subscribe:v4];
}

+ (void)unsubscribe:(id)a3
{
  id v4 = a3;
  id v5 = [a1 observable];
  [v5 unsubscribe:v4];
}

+ (id)_memoryPressureStatusForMemoryPressure:(unsigned int)a3
{
  return 0;
}

@end