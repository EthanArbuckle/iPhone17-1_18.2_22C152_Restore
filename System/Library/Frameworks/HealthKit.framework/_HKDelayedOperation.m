@interface _HKDelayedOperation
- (_HKDelayedOperation)initWithMode:(int64_t)a3 clock:(int64_t)a4 queue:(id)a5 delay:(double)a6 block:(id)a7;
- (_HKDelayedOperation)initWithMode:(int64_t)a3 queue:(id)a4 delay:(double)a5 block:(id)a6;
- (_HKDelayedOperation)initWithQueue:(id)a3 delay:(double)a4 block:(id)a5;
- (void)_queue_executeBlockIfScheduled;
- (void)disableLogging;
- (void)enableLoggingWithName:(id)a3 category:(id)a4;
- (void)execute;
- (void)executeWithDelay:(double)a3;
- (void)invalidate;
@end

@implementation _HKDelayedOperation

- (void)execute
{
}

- (_HKDelayedOperation)initWithQueue:(id)a3 delay:(double)a4 block:(id)a5
{
  return [(_HKDelayedOperation *)self initWithMode:0 queue:a3 delay:a5 block:a4];
}

- (_HKDelayedOperation)initWithMode:(int64_t)a3 queue:(id)a4 delay:(double)a5 block:(id)a6
{
  return [(_HKDelayedOperation *)self initWithMode:a3 clock:0 queue:a4 delay:a6 block:a5];
}

- (_HKDelayedOperation)initWithMode:(int64_t)a3 clock:(int64_t)a4 queue:(id)a5 delay:(double)a6 block:(id)a7
{
  id v13 = a5;
  id v14 = a7;
  v25.receiver = self;
  v25.super_class = (Class)_HKDelayedOperation;
  id v15 = [(_HKDelayedOperation *)&v25 init];
  if (v15)
  {
    v16 = _Block_copy(v14);
    v17 = (void *)*((void *)v15 + 1);
    *((void *)v15 + 1) = v16;

    objc_storeStrong((id *)v15 + 2, a5);
    *((void *)v15 + 3) = a3;
    *((void *)v15 + 4) = a4;
    *((void *)v15 + 7) = 0;
    dispatch_source_t v18 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v15 + 2));
    v19 = (void *)*((void *)v15 + 5);
    *((void *)v15 + 5) = v18;

    *((double *)v15 + 6) = a6;
    objc_initWeak(&location, v15);
    v20 = *((void *)v15 + 5);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __60___HKDelayedOperation_initWithMode_clock_queue_delay_block___block_invoke;
    v22[3] = &unk_1E58BD6C0;
    objc_copyWeak(&v23, &location);
    dispatch_source_set_event_handler(v20, v22);
    dispatch_resume(*((dispatch_object_t *)v15 + 5));
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return (_HKDelayedOperation *)v15;
}

- (void)executeWithDelay:(double)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_block)
  {
    double lastExecution = _CurrentTimeForClock(self->_clock);
    double v7 = lastExecution;
    if (!self->_mode) {
      double lastExecution = self->_lastExecution;
    }
    double v8 = lastExecution + a3;
    double v9 = lastExecution + a3 - v7;
    if (v9 <= 0.0)
    {
      if (self->_loggingCategory)
      {
        _HKInitializeLogging();
        loggingCategory = self->_loggingCategory;
        if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_INFO))
        {
          loggingName = self->_loggingName;
          *(_DWORD *)buf = 138543362;
          v26 = loggingName;
          _os_log_impl(&dword_19C023000, loggingCategory, OS_LOG_TYPE_INFO, "Delayed operation %{public}@: Scheduling immediate execution.", buf, 0xCu);
        }
      }
      self->_double nextScheduledExecution = v7;
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40___HKDelayedOperation_executeWithDelay___block_invoke;
      block[3] = &unk_1E58BBA00;
      block[4] = self;
      dispatch_async(queue, block);
    }
    else
    {
      double nextScheduledExecution = self->_nextScheduledExecution;
      v11 = self->_loggingCategory;
      if (nextScheduledExecution == 0.0 || v8 < nextScheduledExecution)
      {
        if (v11)
        {
          _HKInitializeLogging();
          id v13 = self->_loggingCategory;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            id v14 = self->_loggingName;
            *(_DWORD *)buf = 138543618;
            v26 = v14;
            __int16 v27 = 2048;
            double v28 = v9;
            _os_log_impl(&dword_19C023000, v13, OS_LOG_TYPE_INFO, "Delayed operation %{public}@: Scheduling execution in %lfs.", buf, 0x16u);
          }
        }
        self->_double nextScheduledExecution = v8;
        if (!self->_timerSource)
        {
          id v23 = [MEMORY[0x1E4F28B00] currentHandler];
          [v23 handleFailureInMethod:a2, self, @"_HKDelayedOperation.m", 122, @"Invalid parameter not satisfying: %@", @"_timerSource != nil" object file lineNumber description];
        }
        int64_t clock = self->_clock;
        if (clock == 1)
        {
          dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
        }
        else
        {
          if (clock) {
            -[_HKDelayedOperation executeWithDelay:](clock);
          }
          dispatch_time_t v16 = dispatch_walltime(0, (uint64_t)(v9 * 1000000000.0));
        }
        dispatch_source_set_timer((dispatch_source_t)self->_timerSource, v16, 0xFFFFFFFFFFFFFFFFLL, 0);
      }
      else if (v11)
      {
        _HKInitializeLogging();
        v20 = self->_loggingCategory;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          double v22 = self->_nextScheduledExecution;
          v21 = self->_loggingName;
          *(_DWORD *)buf = 138543874;
          v26 = v21;
          __int16 v27 = 2048;
          double v28 = v8;
          __int16 v29 = 2048;
          double v30 = v22;
          _os_log_impl(&dword_19C023000, v20, OS_LOG_TYPE_INFO, "Delayed operation %{public}@: Ignoring scheduling request (requested %lf > scheduled %lf).", buf, 0x20u);
        }
      }
    }
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33___HKDelayedOperation_invalidate__block_invoke;
  block[3] = &unk_1E58BBA00;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)enableLoggingWithName:(id)a3 category:(id)a4
{
  v6 = (OS_os_log *)a4;
  queue = self->_queue;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  double v9 = (NSString *)[v8 copy];

  loggingName = self->_loggingName;
  self->_loggingName = v9;

  loggingCategory = self->_loggingCategory;
  self->_loggingCategory = v6;
}

- (void)disableLogging
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  loggingCategory = self->_loggingCategory;
  self->_loggingCategory = 0;

  loggingName = self->_loggingName;
  self->_loggingName = 0;
}

- (void)_queue_executeBlockIfScheduled
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_nextScheduledExecution > 0.0)
  {
    double v3 = _CurrentTimeForClock(self->_clock);
    if (self->_loggingCategory)
    {
      double lastExecution = self->_lastExecution;
      double nextScheduledExecution = self->_nextScheduledExecution;
      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_INFO))
      {
        loggingName = self->_loggingName;
        int v9 = 138543874;
        v10 = loggingName;
        __int16 v11 = 2048;
        double v12 = v3 - lastExecution;
        __int16 v13 = 2048;
        double v14 = v3 - nextScheduledExecution;
        _os_log_impl(&dword_19C023000, loggingCategory, OS_LOG_TYPE_INFO, "Delayed operation %{public}@: Executing after %lfs (slipped %lfs).", (uint8_t *)&v9, 0x20u);
      }
    }
    self->_double lastExecution = v3;
    self->_double nextScheduledExecution = 0.0;
    block = (void (**)(void))self->_block;
    if (block) {
      block[2]();
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_loggingName, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_block, 0);
}

- (void)executeWithDelay:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28B00] currentHandler];
  double v3 = objc_msgSend(NSString, "stringWithUTF8String:", "dispatch_time_t _HKDispatchTimeForDelayAndClock(NSTimeInterval, _HKDelayedOperationClock)");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"_HKDelayedOperation.m", 24, @"Invalid clock value for delayed operation: %ld", a1);

  __break(1u);
}

@end