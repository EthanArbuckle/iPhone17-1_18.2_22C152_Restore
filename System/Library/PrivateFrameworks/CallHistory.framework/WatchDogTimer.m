@interface WatchDogTimer
- (WatchDogTimer)initWithQueue:(id)a3 withName:(id)a4 withTimeout:(double)a5 withCallback:(id)a6;
- (void)cancel;
- (void)dealloc;
@end

@implementation WatchDogTimer

- (WatchDogTimer)initWithQueue:(id)a3 withName:(id)a4 withTimeout:(double)a5 withCallback:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v27.receiver = self;
  v27.super_class = (Class)WatchDogTimer;
  v13 = [(CHLogger *)&v27 initWithDomain:"WatchDogTimer"];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a4);
    v15 = [(CHLogger *)v14 logHandle];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      name = v14->_name;
      *(_DWORD *)buf = 138543618;
      v29 = name;
      __int16 v30 = 2048;
      double v31 = a5;
      _os_log_impl(&dword_1B8E4A000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ waiting %f seconds", buf, 0x16u);
    }

    dispatch_source_t v17 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v10);
    timer = v14->_timer;
    v14->_timer = (OS_dispatch_source *)v17;

    v19 = v14->_timer;
    dispatch_time_t v20 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
    dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0);
    v21 = v14->_timer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __65__WatchDogTimer_initWithQueue_withName_withTimeout_withCallback___block_invoke;
    handler[3] = &unk_1E61C8498;
    v24 = v14;
    double v26 = a5;
    id v25 = v12;
    dispatch_source_set_event_handler(v21, handler);
    dispatch_resume((dispatch_object_t)v14->_timer);
  }
  return v14;
}

void __65__WatchDogTimer_initWithQueue_withName_withTimeout_withCallback___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
    uint64_t v4 = *(void *)(a1 + 48);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2048;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: task took longer than %f seconds", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 24));
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CHLogger *)self logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    *(_DWORD *)buf = 138543362;
    __int16 v7 = name;
    _os_log_impl(&dword_1B8E4A000, v3, OS_LOG_TYPE_DEFAULT, "Goodbye from %{public}@ timer", buf, 0xCu);
  }

  dispatch_source_cancel((dispatch_source_t)self->_timer);
  v5.receiver = self;
  v5.super_class = (Class)WatchDogTimer;
  [(WatchDogTimer *)&v5 dealloc];
}

- (void)cancel
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CHLogger *)self logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    int v5 = 138543362;
    uint64_t v6 = name;
    _os_log_impl(&dword_1B8E4A000, v3, OS_LOG_TYPE_DEFAULT, "Canceling %{public}@ timer", (uint8_t *)&v5, 0xCu);
  }

  dispatch_source_cancel((dispatch_source_t)self->_timer);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end