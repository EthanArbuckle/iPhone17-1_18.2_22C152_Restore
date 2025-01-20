@interface ACTimedExpirer
+ (ACTimedExpirer)expirerWithTimeout:(unint64_t)a3;
- (ACTimedExpirer)init;
- (void)_unsafeCancelTimer;
- (void)cancelTimer;
- (void)dealloc;
- (void)scheduleExpiration:(id)a3;
@end

@implementation ACTimedExpirer

- (void)scheduleExpiration:(id)a3
{
  id v4 = a3;
  p_invalidationTimerLock = &self->_invalidationTimerLock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v9 = __37__ACTimedExpirer_scheduleExpiration___block_invoke;
  v10 = &unk_1E5BCEAC0;
  v11 = self;
  id v6 = v4;
  id v12 = v6;
  v7 = v8;
  os_unfair_lock_lock(p_invalidationTimerLock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_invalidationTimerLock);
}

void __37__ACTimedExpirer_scheduleExpiration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _unsafeCancelTimer];
  v2 = dispatch_get_global_queue(9, 0);
  dispatch_source_t v3 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v2);
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v3;

  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  dispatch_time_t v7 = dispatch_time(0, 1000000000 * *(void *)(*(void *)(a1 + 32) + 8));
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)((double)*(unint64_t *)(*(void *)(a1 + 32) + 8) * 0.5 * 1000000000.0));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __37__ACTimedExpirer_scheduleExpiration___block_invoke_2;
  handler[3] = &unk_1E5BCEA98;
  objc_copyWeak(&v11, &location);
  id v10 = *(id *)(a1 + 40);
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_unsafeCancelTimer
{
  invalidationTimer = self->_invalidationTimer;
  if (invalidationTimer)
  {
    dispatch_source_cancel(invalidationTimer);
    uint64_t v4 = self->_invalidationTimer;
    self->_invalidationTimer = 0;
  }
}

- (void).cxx_destruct
{
}

void __37__ACTimedExpirer_scheduleExpiration___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained cancelTimer];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (void)dealloc
{
  [(ACTimedExpirer *)self cancelTimer];
  v3.receiver = self;
  v3.super_class = (Class)ACTimedExpirer;
  [(ACTimedExpirer *)&v3 dealloc];
}

- (void)cancelTimer
{
  p_invalidationTimerLock = &self->_invalidationTimerLock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v5 = __29__ACTimedExpirer_cancelTimer__block_invoke;
  id v6 = &unk_1E5BCD220;
  dispatch_time_t v7 = self;
  objc_super v3 = v4;
  os_unfair_lock_lock(p_invalidationTimerLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_invalidationTimerLock);
}

uint64_t __29__ACTimedExpirer_cancelTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unsafeCancelTimer];
}

+ (ACTimedExpirer)expirerWithTimeout:(unint64_t)a3
{
  uint64_t v4 = objc_alloc_init((Class)a1);
  v4[1] = a3;

  return (ACTimedExpirer *)v4;
}

- (ACTimedExpirer)init
{
  v3.receiver = self;
  v3.super_class = (Class)ACTimedExpirer;
  result = [(ACTimedExpirer *)&v3 init];
  if (result) {
    result->_invalidationTimerLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

@end