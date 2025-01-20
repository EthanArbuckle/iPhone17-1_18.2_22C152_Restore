@interface FPPacer
- (BOOL)isSuspended;
- (FPPacer)initWithName:(id)a3 queue:(id)a4 minFireInterval:(double)a5;
- (double)_computeNextTime;
- (id)eventBlock;
- (id)explicitFireBlock;
- (void)_fire;
- (void)_scheduleNextFire;
- (void)dealloc;
- (void)resume;
- (void)setEventBlock:(id)a3;
- (void)setExplicitFireBlock:(id)a3;
- (void)signal;
- (void)signalWithTransferredQoSIfImmediate;
- (void)suspend;
@end

@implementation FPPacer

- (void)suspend
{
  if (!atomic_fetch_add(&self->_sourceSuspendCount, 1u)) {
    dispatch_suspend((dispatch_object_t)self->_source);
  }
}

- (void)resume
{
  if (atomic_fetch_add(&self->_sourceSuspendCount, 0xFFFFFFFF) == 1) {
    dispatch_resume((dispatch_object_t)self->_source);
  }
}

- (void)setEventBlock:(id)a3
{
}

- (FPPacer)initWithName:(id)a3 queue:(id)a4 minFireInterval:(double)a5
{
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)FPPacer;
  v9 = [(FPPacer *)&v20 init];
  v10 = v9;
  if (v9)
  {
    v9->_lastFireTime = 0.0;
    v9->_minFireInterval = a5;
    objc_storeStrong((id *)&v9->_queue, a4);
    dispatch_source_t v11 = dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, (dispatch_queue_t)v10->_queue);
    source = v10->_source;
    v10->_source = (OS_dispatch_source *)v11;

    dispatch_set_qos_class_fallback();
    id location = 0;
    objc_initWeak(&location, v10);
    v13 = v10->_source;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __46__FPPacer_initWithName_queue_minFireInterval___block_invoke;
    v17[3] = &unk_1E5AF06C8;
    objc_copyWeak(&v18, &location);
    v14 = v13;
    dispatch_block_t v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v17);
    dispatch_source_set_event_handler(v14, v15);

    atomic_store(1u, (unsigned int *)&v10->_sourceSuspendCount);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (BOOL)isSuspended
{
  signed int v2 = atomic_load((unsigned int *)&self->_sourceSuspendCount);
  return v2 > 0;
}

void __46__FPPacer_initWithName_queue_minFireInterval___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _scheduleNextFire];
}

- (void)signalWithTransferredQoSIfImmediate
{
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  v6 = __46__FPPacer_signalWithTransferredQoSIfImmediate__block_invoke;
  v7 = &unk_1E5AF06C8;
  objc_copyWeak(&v8, &location);
  dispatch_block_t v3 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &v4);
  -[FPPacer setExplicitFireBlock:](self, "setExplicitFireBlock:", v3, v4, v5, v6, v7);

  [(FPPacer *)self signal];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)signal
{
}

- (void)_scheduleNextFire
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dispatch_block_t v3 = [(FPPacer *)self explicitFireBlock];
  [(FPPacer *)self setExplicitFireBlock:0];
  [(FPPacer *)self _computeNextTime];
  if (v4 <= 0.0)
  {
    if (v3) {
      v3[2](v3);
    }
    else {
      [(FPPacer *)self _fire];
    }
  }
  else
  {
    double v5 = v4;
    timer = self->_timer;
    if (timer)
    {
      dispatch_source_cancel(timer);
      v7 = self->_timer;
      self->_timer = 0;
    }
    id v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
    v9 = self->_timer;
    self->_timer = v8;

    dispatch_set_qos_class_fallback();
    id location = 0;
    objc_initWeak(&location, self);
    v10 = self->_timer;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __28__FPPacer__scheduleNextFire__block_invoke;
    v15[3] = &unk_1E5AF06C8;
    objc_copyWeak(&v16, &location);
    dispatch_source_t v11 = v10;
    dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v15);
    dispatch_source_set_event_handler(v11, v12);

    double v13 = v5 * 1000000000.0;
    dispatch_time_t v14 = dispatch_time(0, (uint64_t)v13);
    dispatch_source_set_timer((dispatch_source_t)self->_timer, v14, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)v13);
    dispatch_resume((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)setExplicitFireBlock:(id)a3
{
}

- (id)explicitFireBlock
{
  return objc_getProperty(self, a2, 64, 1);
}

- (double)_computeNextTime
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  double result = 0.0;
  if (self->_lastFireTime != 0.0)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    double minFireInterval = self->_minFireInterval;
    double v6 = Current - self->_lastFireTime;
    double v7 = minFireInterval - v6;
    BOOL v8 = v6 < minFireInterval;
    double result = 0.0;
    if (v8) {
      return v7;
    }
  }
  return result;
}

void __28__FPPacer__scheduleNextFire__block_invoke(uint64_t a1)
{
  id WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_block_t v3 = WeakRetained;
    dispatch_source_cancel(WeakRetained[5]);
    [(dispatch_source_t *)v3 _fire];
    dispatch_source_t v2 = v3[5];
    v3[5] = 0;

    id WeakRetained = v3;
  }
}

void __46__FPPacer_signalWithTransferredQoSIfImmediate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fire];
}

- (void)_fire
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((int)atomic_load_explicit(&self->_sourceSuspendCount, memory_order_acquire) < 1)
  {
    self->_lastFireTime = CFAbsoluteTimeGetCurrent();
    dispatch_block_t v3 = [(FPPacer *)self eventBlock];

    if (v3)
    {
      double v4 = (void *)MEMORY[0x1A6248870]();
      double v5 = [(FPPacer *)self eventBlock];
      v5[2]();
    }
  }
  else
  {
    [(FPPacer *)self signal];
  }
}

- (id)eventBlock
{
  return self->_eventBlock;
}

- (void)dealloc
{
  queue = self->_queue;
  self->_queue = 0;

  if ((int)atomic_load_explicit(&self->_sourceSuspendCount, memory_order_acquire) >= 1) {
    dispatch_resume((dispatch_object_t)self->_source);
  }
  dispatch_activate((dispatch_object_t)self->_source);
  source = self->_source;
  self->_source = 0;

  timer = self->_timer;
  self->_timer = 0;

  v6.receiver = self;
  v6.super_class = (Class)FPPacer;
  [(FPPacer *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_explicitFireBlock, 0);
  objc_storeStrong(&self->_eventBlock, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end