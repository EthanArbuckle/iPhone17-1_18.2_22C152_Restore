@interface AVTimer
- (AVTimer)init;
- (AVTimer)initWithTimeInterval:(double)a3 queue:(id)a4 block:(id)a5 repeats:(BOOL)a6;
- (double)interval;
- (void)dealloc;
- (void)invalidate;
@end

@implementation AVTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (double)interval
{
  return self->_interval;
}

- (void)invalidate
{
  self->_invalidated = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__AVTimer_invalidate__block_invoke;
  block[3] = &unk_1E5FC4698;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __21__AVTimer_invalidate__block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = 0;
  }
}

- (void)dealloc
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __18__AVTimer_dealloc__block_invoke;
  block[3] = &unk_1E5FC4698;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)AVTimer;
  [(AVTimer *)&v4 dealloc];
}

void __18__AVTimer_dealloc__block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  if (v1) {
    dispatch_source_cancel(v1);
  }
}

- (AVTimer)init
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  v5 = _AVMethodProem(self);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v3 raise:v4, @"%@ is not a valid initializer. You must call -[%@ initWithTimeInterval:queue:block:repeats:].", v5, v7 format];

  return [(AVTimer *)self initWithTimeInterval:0 queue:0 block:0 repeats:0.0];
}

- (AVTimer)initWithTimeInterval:(double)a3 queue:(id)a4 block:(id)a5 repeats:(BOOL)a6
{
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)AVTimer;
  id v12 = [(AVTimer *)&v27 init];
  if (v12)
  {
    double v13 = a3;
    if (a3 <= 0.0)
    {
      v14 = _AVLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B05B7000, v14, OS_LOG_TYPE_ERROR, "Error: invalid timer update interval. Interval must be greater than 0.", buf, 2u);
      }

      double v13 = 0.0;
    }
    *((double *)v12 + 4) = v13;
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.avkit.AVTimer.manage %p", v12);
    id v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v16 = dispatch_queue_create((const char *)[v15 UTF8String], 0);
    v17 = (void *)*((void *)v12 + 1);
    *((void *)v12 + 1) = v16;

    v18 = *((void *)v12 + 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__AVTimer_initWithTimeInterval_queue_block_repeats___block_invoke;
    block[3] = &unk_1E5FC3CD0;
    id v21 = v12;
    double v24 = a3;
    BOOL v25 = a6;
    id v22 = v10;
    id v23 = v11;
    dispatch_sync(v18, block);
  }
  return (AVTimer *)v12;
}

void __52__AVTimer_initWithTimeInterval_queue_block_repeats___block_invoke(uint64_t a1)
{
  objc_msgSend(NSString, "stringWithFormat:", @"com.apple.avkit.AVTimer.timer %p", *(void *)(a1 + 32));
  id v2 = objc_claimAutoreleasedReturnValue();
  uint64_t v3 = dispatch_queue_create((const char *)[v2 UTF8String], 0);
  dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v3);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v4;

  v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
  dispatch_source_set_timer(v7, v8, (unint64_t)(*(double *)(a1 + 56) * 1000000000.0), 0x5F5E100uLL);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v9 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __52__AVTimer_initWithTimeInterval_queue_block_repeats___block_invoke_2;
  handler[3] = &unk_1E5FC3CA8;
  objc_copyWeak(&v13, &location);
  char v14 = *(unsigned char *)(a1 + 64);
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __52__AVTimer_initWithTimeInterval_queue_block_repeats___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!*(unsigned char *)(a1 + 56))
    {
      dispatch_source_t v4 = *((void *)WeakRetained + 2);
      if (v4)
      {
        dispatch_source_cancel(v4);
        uint64_t v5 = (void *)v3[2];
        v3[2] = 0;
      }
    }
    v6 = *(NSObject **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__AVTimer_initWithTimeInterval_queue_block_repeats___block_invoke_3;
    v7[3] = &unk_1E5FC4648;
    dispatch_time_t v8 = v3;
    id v9 = *(id *)(a1 + 40);
    dispatch_sync(v6, v7);
  }
}

uint64_t __52__AVTimer_initWithTimeInterval_queue_block_repeats___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 40) + 16))();
  }
  return result;
}

@end