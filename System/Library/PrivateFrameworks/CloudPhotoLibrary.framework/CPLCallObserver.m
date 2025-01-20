@interface CPLCallObserver
+ (void)observeAsyncCallOn:(id)a3 selector:(SEL)a4 block:(id)a5;
+ (void)observeSyncCallOn:(id)a3 selector:(SEL)a4 block:(id)a5;
- (CPLCallObserver)initWithObject:(id)a3 selector:(SEL)a4;
- (void)callDidFinish;
@end

@implementation CPLCallObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)callDidFinish
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__CPLCallObserver_callDidFinish__block_invoke;
  block[3] = &unk_1E60A5DD8;
  block[4] = self;
  dispatch_sync(queue, block);
  [(NSDate *)self->_startDate timeIntervalSinceNow];
  double v5 = -v4;
  if (v4 < -2.0)
  {
    if (_CPLSilentLogging) {
      return;
    }
    v6 = __CPLObserverOSLogDomain();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    SEL selector = self->_selector;
    p_SEL selector = &self->_selector;
    v7 = selector;
    if (*((unsigned char *)p_selector + 8)) {
      v10 = "+";
    }
    else {
      v10 = "-";
    }
    uint64_t v11 = (uint64_t)*(p_selector - 1);
    if (v7) {
      v12 = v7;
    }
    else {
      v12 = 0;
    }
    v19 = NSStringFromSelector(v12);
    *(_DWORD *)buf = 136315906;
    v24 = v10;
    __int16 v25 = 2114;
    uint64_t v26 = v11;
    __int16 v27 = 2114;
    v28 = v19;
    __int16 v29 = 2048;
    double v30 = v5;
    v20 = v6;
    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_20;
  }
  if (_CPLSilentLogging) {
    return;
  }
  v6 = __CPLObserverOSLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    SEL v15 = self->_selector;
    v14 = &self->_selector;
    v13 = v15;
    if (*((unsigned char *)v14 + 8)) {
      v16 = "+";
    }
    else {
      v16 = "-";
    }
    uint64_t v17 = (uint64_t)*(v14 - 1);
    if (v13) {
      v18 = v13;
    }
    else {
      v18 = 0;
    }
    v19 = NSStringFromSelector(v18);
    *(_DWORD *)buf = 136315906;
    v24 = v16;
    __int16 v25 = 2114;
    uint64_t v26 = v17;
    __int16 v27 = 2114;
    v28 = v19;
    __int16 v29 = 2048;
    double v30 = v5;
    v20 = v6;
    os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
LABEL_20:
    _os_log_impl(&dword_1B4CAC000, v20, v21, "%s[%{public}@ %{public}@] completed in %.3fs", buf, 0x2Au);
  }
LABEL_21:
}

void __32__CPLCallObserver_callDidFinish__block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

- (CPLCallObserver)initWithObject:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CPLCallObserver;
  id v7 = [(CPLCallObserver *)&v24 init];
  if (v7)
  {
    BOOL isClass = object_isClass(v6);
    *((unsigned char *)v7 + 56) = isClass;
    uint64_t v9 = (uint64_t)v6;
    if (!isClass) {
      uint64_t v9 = objc_opt_class();
    }
    *((void *)v7 + 5) = v9;
    if (a4) {
      SEL v10 = a4;
    }
    else {
      SEL v10 = 0;
    }
    *((void *)v7 + 6) = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    v12 = (void *)*((void *)v7 + 4);
    *((void *)v7 + 4) = v11;

    v13 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.cpl.callobserver", v13);
    SEL v15 = (void *)*((void *)v7 + 1);
    *((void *)v7 + 1) = v14;

    dispatch_source_t v16 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v7 + 1));
    uint64_t v17 = (void *)*((void *)v7 + 2);
    *((void *)v7 + 2) = v16;

    v18 = *((void *)v7 + 2);
    dispatch_time_t v19 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v18, v19, 0x6FC23AC00uLL, 0x3B9ACA00uLL);
    v20 = *((void *)v7 + 2);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __43__CPLCallObserver_initWithObject_selector___block_invoke;
    handler[3] = &unk_1E60A5DD8;
    id v23 = v7;
    dispatch_source_set_event_handler(v20, handler);
    dispatch_activate(*((dispatch_object_t *)v7 + 2));
  }
  return (CPLCallObserver *)v7;
}

void __43__CPLCallObserver_initWithObject_selector___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 16)) {
    BOOL v1 = _CPLSilentLogging == 0;
  }
  else {
    BOOL v1 = 0;
  }
  if (v1)
  {
    v3 = __CPLObserverOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      id v7 = *(const char **)(v4 + 48);
      uint64_t v5 = v4 + 48;
      id v6 = v7;
      if (*(unsigned char *)(v5 + 8)) {
        v8 = "+";
      }
      else {
        v8 = "-";
      }
      uint64_t v9 = *(void *)(v5 - 8);
      if (v6) {
        SEL v10 = v6;
      }
      else {
        SEL v10 = 0;
      }
      uint64_t v11 = NSStringFromSelector(v10);
      [*(id *)(*(void *)(a1 + 32) + 32) timeIntervalSinceNow];
      int v13 = 136315906;
      dispatch_queue_t v14 = v8;
      __int16 v15 = 2114;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      v18 = v11;
      __int16 v19 = 2048;
      double v20 = -v12;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_ERROR, "%s[%{public}@ %{public}@] has not completed after %.0fs", (uint8_t *)&v13, 0x2Au);
    }
  }
}

+ (void)observeAsyncCallOn:(id)a3 selector:(SEL)a4 block:(id)a5
{
  id v7 = (void (**)(id, CPLCallObserver *))a5;
  id v8 = a3;
  uint64_t v9 = [[CPLCallObserver alloc] initWithObject:v8 selector:a4];

  v7[2](v7, v9);
}

+ (void)observeSyncCallOn:(id)a3 selector:(SEL)a4 block:(id)a5
{
  id v7 = (void (**)(void))a5;
  id v8 = a3;
  uint64_t v9 = [[CPLCallObserver alloc] initWithObject:v8 selector:a4];

  v7[2](v7);
  [(CPLCallObserver *)v9 callDidFinish];
}

@end