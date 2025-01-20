@interface FPGracePeriodTimer
- (FPGracePeriodTimer)initWithAction:(id)a3 callbackQueue:(id)a4 delay:(double)a5;
- (id)prettyDescription;
- (void)_createTimer;
- (void)arm;
- (void)dealloc;
- (void)suppress;
@end

@implementation FPGracePeriodTimer

- (void)arm
{
  obj = self;
  objc_sync_enter(obj);
  [(FPGracePeriodTimer *)obj suppress];
  [(FPGracePeriodTimer *)obj _createTimer];
  dispatch_resume((dispatch_object_t)obj->_timer);
  objc_sync_exit(obj);
}

- (void)suppress
{
  obj = self;
  objc_sync_enter(obj);
  timer = obj->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v3 = obj->_timer;
    obj->_timer = 0;

    obj->_expectedFiringTimeSinceReferenceDate = 0.0;
  }
  objc_sync_exit(obj);
}

- (void)_createTimer
{
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_callbackQueue);
  timer = self->_timer;
  self->_timer = v3;

  dispatch_set_qos_class_fallback();
  double delay = self->_delay;
  uint64_t v6 = (unint64_t)(delay / 10.0 * 1000000000.0);
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(delay * 1000000000.0));
  dispatch_source_set_timer((dispatch_source_t)self->_timer, v7, 0xFFFFFFFFFFFFFFFFLL, v6);
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_expectedFiringTimeSinceReferenceDate = v8 + self->_delay;
  id location = 0;
  objc_initWeak(&location, self);
  v9 = self->_timer;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __34__FPGracePeriodTimer__createTimer__block_invoke;
  v12[3] = &unk_1E5AF06C8;
  objc_copyWeak(&v13, &location);
  v10 = v9;
  dispatch_block_t v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v12);
  dispatch_source_set_event_handler(v10, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (FPGracePeriodTimer)initWithAction:(id)a3 callbackQueue:(id)a4 delay:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"FPGracePeriodTimer.m", 23, @"Invalid parameter not satisfying: %@", @"callbackQueue" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)FPGracePeriodTimer;
  dispatch_block_t v11 = [(FPGracePeriodTimer *)&v16 init];
  if (v11)
  {
    uint64_t v12 = MEMORY[0x1A6248B00](v9);
    id action = v11->_action;
    v11->_id action = (id)v12;

    objc_storeStrong((id *)&v11->_callbackQueue, a4);
    v11->_double delay = a5;
  }

  return v11;
}

- (void)dealloc
{
  [(FPGracePeriodTimer *)self suppress];
  v3.receiver = self;
  v3.super_class = (Class)FPGracePeriodTimer;
  [(FPGracePeriodTimer *)&v3 dealloc];
}

void __34__FPGracePeriodTimer__createTimer__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v2 = MEMORY[0x1A6248B00](WeakRetained[1]);
    objc_super v3 = (void *)v2;
    if (v2) {
      (*(void (**)(uint64_t))(v2 + 16))(v2);
    }
    [v4 suppress];

    WeakRetained = v4;
  }
}

- (id)prettyDescription
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2->_timer)
  {
    objc_super v3 = NSString;
    double expectedFiringTimeSinceReferenceDate = v2->_expectedFiringTimeSinceReferenceDate;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v6 = [v3 stringWithFormat:@"armed, firing in %.1gs", expectedFiringTimeSinceReferenceDate - v5];
  }
  else
  {
    uint64_t v6 = @"not running";
  }
  objc_sync_exit(v2);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong(&self->_action, 0);
}

@end