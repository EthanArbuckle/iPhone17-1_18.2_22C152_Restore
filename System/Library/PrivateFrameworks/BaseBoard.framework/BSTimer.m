@interface BSTimer
+ (id)scheduledTimerWithFireInterval:(double)a3 queue:(id)a4 handler:(id)a5;
- (BOOL)isScheduled;
- (BSTimer)initWithFireInterval:(double)a3 queue:(id)a4 handler:(id)a5;
- (BSTimer)initWithFireInterval:(double)a3 repeatInterval:(double)a4 leewayInterval:(double)a5 queue:(id)a6 handler:(id)a7;
- (double)fireInterval;
- (double)repeatInterval;
- (double)startTime;
- (unint64_t)fireCount;
- (void)_queue_cancel;
- (void)cancel;
- (void)dealloc;
- (void)schedule;
@end

@implementation BSTimer

+ (id)scheduledTimerWithFireInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)[objc_alloc((Class)a1) initWithFireInterval:v8 queue:v9 handler:a3];
  [v10 schedule];

  return v10;
}

- (BSTimer)initWithFireInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  return [(BSTimer *)self initWithFireInterval:a4 repeatInterval:a5 leewayInterval:a3 queue:-1.0 handler:0.0];
}

- (BSTimer)initWithFireInterval:(double)a3 repeatInterval:(double)a4 leewayInterval:(double)a5 queue:(id)a6 handler:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  if (!v14)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"BSTimer.m", 48, @"Invalid parameter not satisfying: %@", @"handler != nil" object file lineNumber description];
  }
  if (a3 < 0.0 || a3 > 9223372040.0)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"BSTimer.m", 49, @"requested a timer with an unsupported duration (%f)", *(void *)&a3);
  }
  v15 = [(BSTimer *)self init];
  if (v15)
  {
    v16 = +[BSDescriptionBuilder descriptionForObject:v15];
    dispatch_queue_t Serial = BSDispatchQueueCreateSerial(v16);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)Serial;

    if (v13)
    {
      v19 = (OS_dispatch_queue *)v13;
    }
    else
    {
      unsigned int v20 = BSPthreadCurrentEffectiveQualityOfService();
      dispatch_get_global_queue(v20, 0);
      v19 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    callOutQueue = v15->_callOutQueue;
    v15->_callOutQueue = v19;

    uint64_t v22 = [v14 copy];
    id handler = v15->_handler;
    v15->_id handler = (id)v22;

    double v24 = 0.0;
    BOOL v25 = fabs(a4) < 2.22044605e-16 || a4 < 0.0;
    double v26 = -1.0;
    if (!v25) {
      double v26 = a4;
    }
    v15->_fireInterval = a3;
    v15->_repeatInterval = v26;
    if (fabs(a5) >= 2.22044605e-16 && a5 >= 0.0) {
      double v24 = a5;
    }
    v15->_leewayInterval = v24;
    v15->_oneShot = fabs(v26 + 1.0) < 2.22044605e-16;
  }

  return v15;
}

- (void)dealloc
{
  [(BSTimer *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)BSTimer;
  [(BSTimer *)&v3 dealloc];
}

- (BOOL)isScheduled
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22__BSTimer_isScheduled__block_invoke;
  v5[3] = &unk_1E5445908;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __22__BSTimer_isScheduled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 49);
  return result;
}

- (unint64_t)fireCount
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __20__BSTimer_fireCount__block_invoke;
  v5[3] = &unk_1E5445908;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __20__BSTimer_fireCount__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 80);
  return result;
}

- (void)schedule
{
  queue = self->_queue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __19__BSTimer_schedule__block_invoke;
  v3[3] = &unk_1E54458E0;
  v3[4] = self;
  v3[5] = a2;
  dispatch_sync(queue, v3);
}

void __19__BSTimer_schedule__block_invoke(uint64_t a1)
{
  -[BSTimer _queue_cancel](*(void *)(a1 + 32));
  *(unsigned char *)(*(void *)(a1 + 32) + 49) = 1;
  *(void *)(*(void *)(a1 + 32) + 80) = 0;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  *(void *)(*(void *)(a1 + 32) + 56) = v2;
  unint64_t v3 = [BSDispatchSource alloc];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  long long v4 = *(_OWORD *)(a1 + 32);
  v5 = *(void **)(*(void *)(a1 + 32) + 16);
  v14[2] = __19__BSTimer_schedule__block_invoke_2;
  v14[3] = &unk_1E54463B0;
  long long v15 = v4;
  uint64_t v6 = -[BSDispatchSource initWithType:handle:mask:queue:configureSourceBlock:](v3, MEMORY[0x1E4F14490], 0, 0, v5, v14);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = v6;

  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __19__BSTimer_schedule__block_invoke_22;
  v11[3] = &unk_1E5446210;
  objc_copyWeak(&v12, &location);
  if (v9) {
    objc_setProperty_nonatomic_copy(v9, v10, v11, 32);
  }
  -[BSDispatchSource resume](*(void *)(*(void *)(a1 + 32) + 32));
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_queue_cancel
{
  if (a1)
  {
    BSDispatchQueueAssert(*(void **)(a1 + 8));
    uint64_t v2 = *(void **)(a1 + 32);
    if (v2)
    {
      *(unsigned char *)(a1 + 49) = 0;
      [v2 invalidate];
      unint64_t v3 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;
    }
  }
}

void __19__BSTimer_schedule__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(double *)(v4 + 64);
  v17 = v3;
  if (v5 >= 9223372040.0)
  {
    dispatch_time_t v7 = -1;
  }
  else
  {
    if (v5 <= -9223372040.0) {
      int64_t v6 = 0x8000000000000000;
    }
    else {
      int64_t v6 = (uint64_t)(v5 * 1000000000.0);
    }
    dispatch_time_t v7 = dispatch_time(0, v6);
    unint64_t v3 = v17;
    uint64_t v4 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v4 + 48))
  {
    uint64_t v8 = -1;
  }
  else
  {
    double v9 = *(double *)(v4 + 72);
    if (v9 >= 9223372040.0)
    {
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else if (v9 <= -9223372040.0)
    {
      uint64_t v8 = 0x8000000000000000;
    }
    else
    {
      uint64_t v8 = (uint64_t)(v9 * 1000000000.0);
      if (!v8)
      {
        v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"repeatTime != 0"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 40));
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          id v12 = (objc_class *)objc_opt_class();
          id v13 = NSStringFromClass(v12);
          uint64_t v14 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138544642;
          id v19 = v11;
          __int16 v20 = 2114;
          v21 = v13;
          __int16 v22 = 2048;
          uint64_t v23 = v14;
          __int16 v24 = 2114;
          BOOL v25 = @"BSTimer.m";
          __int16 v26 = 1024;
          int v27 = 104;
          __int16 v28 = 2114;
          v29 = v10;
          _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        qword_1E911F420 = [v10 UTF8String];
        __break(0);
        JUMPOUT(0x18AB28244);
      }
    }
  }
  double v15 = *(double *)(v4 + 40);
  if (v15 >= 9223372040.0)
  {
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (v15 <= -9223372040.0)
  {
    uint64_t v16 = 0x8000000000000000;
  }
  else
  {
    uint64_t v16 = (uint64_t)(v15 * 1000000000.0);
  }
  dispatch_source_set_timer(v3, v7, v8, v16);
}

void __19__BSTimer_schedule__block_invoke_22(uint64_t a1)
{
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    double v5 = (NSObject **)WeakRetained;
    BSDispatchQueueAssert(WeakRetained[2]);
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__5;
    id v11 = __Block_byref_object_dispose__5;
    id v12 = 0;
    unint64_t v3 = v5[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__BSTimer__callOutQueue_noteTimerFired__block_invoke;
    block[3] = &unk_1E5446238;
    block[4] = v5;
    block[5] = &v7;
    dispatch_sync(v3, block);
    uint64_t v4 = v8[5];
    if (v4) {
      (*(void (**)(void))(v4 + 16))();
    }
    _Block_object_dispose(&v7, 8);

    uint64_t v2 = v5;
  }
}

- (void)cancel
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __17__BSTimer_cancel__block_invoke;
  block[3] = &unk_1E54457C8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __17__BSTimer_cancel__block_invoke(uint64_t a1)
{
}

void __39__BSTimer__callOutQueue_noteTimerFired__block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 80);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 49))
  {
    uint64_t v3 = MEMORY[0x18C125630](*(void *)(v2 + 24));
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    double v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v2 + 48))
  {
    -[BSTimer _queue_cancel](v2);
  }
}

- (double)startTime
{
  return self->_startTime;
}

- (double)fireInterval
{
  return self->_fireInterval;
}

- (double)repeatInterval
{
  return self->_repeatInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end