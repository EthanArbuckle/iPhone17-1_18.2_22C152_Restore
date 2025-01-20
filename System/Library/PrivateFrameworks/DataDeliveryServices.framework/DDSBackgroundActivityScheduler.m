@interface DDSBackgroundActivityScheduler
- (DDSBackgroundActivityScheduler)init;
- (DDSBackgroundActivitySchedulerDelegate)delegate;
- (NSMutableDictionary)schedulerByIdentifier;
- (void)cancelActivityWithIdentifier:(id)a3;
- (void)scheduleActivityWithIdentifier:(id)a3 interval:(double)a4 tolerance:(double)a5;
- (void)setDelegate:(id)a3;
- (void)setSchedulerByIdentifier:(id)a3;
@end

@implementation DDSBackgroundActivityScheduler

- (DDSBackgroundActivityScheduler)init
{
  v5.receiver = self;
  v5.super_class = (Class)DDSBackgroundActivityScheduler;
  v2 = [(DDSBackgroundActivityScheduler *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(DDSBackgroundActivityScheduler *)v2 setSchedulerByIdentifier:v3];
  }
  return v2;
}

- (void)scheduleActivityWithIdentifier:(id)a3 interval:(double)a4 tolerance:(double)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [MEMORY[0x1E4F1C9C8] date];
  v10 = [v9 dateByAddingTimeInterval:a4];

  v11 = UpdateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[DDSBackgroundActivityScheduler scheduleActivityWithIdentifier:interval:tolerance:](v10, v11, a4);
  }

  v12 = UpdateLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = DDS_STRING_FROM_DATE(v10);
    *(_DWORD *)buf = 138543874;
    id v22 = v8;
    __int16 v23 = 2114;
    v24 = v13;
    __int16 v25 = 2048;
    unint64_t v26 = (unint64_t)a5;
    _os_log_impl(&dword_1E41D6000, v12, OS_LOG_TYPE_DEFAULT, "Scheduling activity: %{public}@ for approximately %{public}@ (tolerance of %ld seconds)", buf, 0x20u);
  }
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B38]) initWithIdentifier:v8];
  [v14 setQualityOfService:17];
  [v14 setRepeats:0];
  [v14 setDelay:a4];
  [v14 setTolerance:a5];
  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v15, (const char *)*MEMORY[0x1E4F14170], (uint64_t)a4);
  [v14 _setAdditionalXPCActivityProperties:v15];
  v16 = [(DDSBackgroundActivityScheduler *)self schedulerByIdentifier];
  [v16 setObject:v14 forKey:v8];

  objc_initWeak((id *)buf, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__DDSBackgroundActivityScheduler_scheduleActivityWithIdentifier_interval_tolerance___block_invoke;
  v18[3] = &unk_1E6E3A2A8;
  objc_copyWeak(&v20, (id *)buf);
  id v17 = v8;
  id v19 = v17;
  [v14 scheduleWithBlock:v18];

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __84__DDSBackgroundActivityScheduler_scheduleActivityWithIdentifier_interval_tolerance___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_super v5 = UpdateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "Scheduled activity %{public}@ fired!", (uint8_t *)&v9, 0xCu);
    }

    v7 = [WeakRetained delegate];
    [v7 performScheduledActivityWithIdentifier:*(void *)(a1 + 32)];

    id v8 = [WeakRetained schedulerByIdentifier];
    [v8 removeObjectForKey:*(void *)(a1 + 32)];
  }
  v3[2](v3, 1);
}

- (void)cancelActivityWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(DDSBackgroundActivityScheduler *)self schedulerByIdentifier];
  id v7 = [v5 objectForKeyedSubscript:v4];

  uint64_t v6 = v7;
  if (v7)
  {
    [v7 invalidate];
    uint64_t v6 = v7;
  }
}

- (DDSBackgroundActivitySchedulerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)schedulerByIdentifier
{
  return self->_schedulerByIdentifier;
}

- (void)setSchedulerByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerByIdentifier, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)scheduleActivityWithIdentifier:(void *)a1 interval:(NSObject *)a2 tolerance:(double)a3 .cold.1(void *a1, NSObject *a2, double a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = DDS_STRING_FROM_DATE(v6);
  id v8 = DDS_STRING_FROM_DATE(a1);
  int v9 = 134218498;
  unint64_t v10 = (unint64_t)a3;
  __int16 v11 = 2114;
  v12 = v7;
  __int16 v13 = 2114;
  v14 = v8;
  _os_log_debug_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_DEBUG, "Delay: %ld Now: %{public}@ Future: %{public}@", (uint8_t *)&v9, 0x20u);
}

@end