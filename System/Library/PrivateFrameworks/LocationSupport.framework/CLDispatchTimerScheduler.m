@interface CLDispatchTimerScheduler
- (CLDispatchTimerScheduler)initWithDispatchSilo:(id)a3;
- (CLTimer)timer;
- (OS_dispatch_source)source;
- (void)dealloc;
- (void)reflectNextFireDelay:(double)a3 fireInterval:(double)a4;
- (void)setSource:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation CLDispatchTimerScheduler

- (CLTimer)timer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->timer);
  return (CLTimer *)WeakRetained;
}

- (void)reflectNextFireDelay:(double)a3 fireInterval:(double)a4
{
  source = self->_source;
  if (!source) {
    __assert_rtn("-[CLDispatchTimerScheduler reflectNextFireDelay:fireInterval:]", "CLDispatchSilo.m", 132, "_source");
  }
  if (a3 == 1.79769313e308)
  {
    dispatch_time_t v7 = -1;
  }
  else
  {
    dispatch_time_t v7 = dispatch_time(0x8000000000000000, (uint64_t)(a3 * 1000000000.0));
    source = self->_source;
  }
  if (a4 == 1.79769313e308) {
    uint64_t v8 = -1;
  }
  else {
    uint64_t v8 = (unint64_t)(a4 * 1000000000.0);
  }
  dispatch_source_set_timer(source, v7, v8, 0);
}

- (void)setTimer:(id)a3
{
}

- (CLDispatchTimerScheduler)initWithDispatchSilo:(id)a3
{
  id v4 = a3;
  [v4 inPermissiveMode];
  v20.receiver = self;
  v20.super_class = (Class)CLDispatchTimerScheduler;
  id v5 = [(CLDispatchTimerScheduler *)&v20 init];
  if (v5)
  {
    objc_initWeak(&location, v5);
    objc_initWeak(&from, v4);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = sub_1A45420CC;
    v15 = &unk_1E5B3EAA8;
    objc_copyWeak(&v16, &from);
    objc_copyWeak(&v17, &location);
    v6 = _Block_copy(&v12);
    dispatch_time_t v7 = objc_msgSend(v4, "queue", v12, v13, v14, v15);
    dispatch_source_t v8 = dispatch_source_create(MEMORY[0x1E4F14490], 2uLL, 0, v7);
    v9 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v8;

    dispatch_set_context(*((dispatch_object_t *)v5 + 2), (void *)[v6 copy]);
    dispatch_set_finalizer_f(*((dispatch_object_t *)v5 + 2), j__objc_release);
    dispatch_source_set_event_handler_f(*((dispatch_source_t *)v5 + 2), (dispatch_function_t)sub_1A4541F88);
    [v5 reflectNextFireDelay:1.79769313e308 fireInterval:1.79769313e308];
    dispatch_resume(*((dispatch_object_t *)v5 + 2));
    id v10 = v5;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return (CLDispatchTimerScheduler *)v5;
}

- (void)dealloc
{
  source = self->_source;
  if (source)
  {
    dispatch_source_cancel(source);
    id v4 = self->_source;
    self->_source = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CLDispatchTimerScheduler;
  [(CLDispatchTimerScheduler *)&v5 dealloc];
}

- (OS_dispatch_source)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_destroyWeak((id *)&self->timer);
}

@end