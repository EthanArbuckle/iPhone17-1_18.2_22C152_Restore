@interface CATDispatchTimer
+ (id)scheduledTimerWithIdentifier:(id)a3 workQueue:(id)a4 delegateQueue:(id)a5 timeInterval:(double)a6 totalFires:(unint64_t)a7 firesForever:(BOOL)a8 fireHandler:(id)a9;
- (CATDispatchTimer)initWithIdentifier:(id)a3 workQueue:(id)a4 delegateQueue:(id)a5 timeInterval:(double)a6 totalFires:(unint64_t)a7 firesForever:(BOOL)a8 fireHandler:(id)a9;
- (void)dealloc;
- (void)invalidate;
- (void)reset;
- (void)resume;
- (void)timerDidFire;
@end

@implementation CATDispatchTimer

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->mTimerSource);
  v3.receiver = self;
  v3.super_class = (Class)CATDispatchTimer;
  [(CATDispatchTimer *)&v3 dealloc];
}

- (CATDispatchTimer)initWithIdentifier:(id)a3 workQueue:(id)a4 delegateQueue:(id)a5 timeInterval:(double)a6 totalFires:(unint64_t)a7 firesForever:(BOOL)a8 fireHandler:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a9;
  v26.receiver = self;
  v26.super_class = (Class)CATDispatchTimer;
  v20 = [(CATDispatchTimer *)&v26 init];
  if (v20)
  {
    uint64_t v21 = [v16 copy];
    mIdentifier = v20->mIdentifier;
    v20->mIdentifier = (NSString *)v21;

    objc_storeStrong((id *)&v20->mWorkQueue, a4);
    objc_storeStrong((id *)&v20->mDelegateQueue, a5);
    v20->mTimeInterval = a6;
    v20->mTotalFires = a7;
    v20->mFiresForever = a8;
    uint64_t v23 = MEMORY[0x216693330](v19);
    id mFireHandler = v20->mFireHandler;
    v20->id mFireHandler = (id)v23;
  }
  return v20;
}

+ (id)scheduledTimerWithIdentifier:(id)a3 workQueue:(id)a4 delegateQueue:(id)a5 timeInterval:(double)a6 totalFires:(unint64_t)a7 firesForever:(BOOL)a8 fireHandler:(id)a9
{
  BOOL v9 = a8;
  id v16 = a9;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v19 workQueue:v18 delegateQueue:v17 timeInterval:a7 totalFires:v9 firesForever:v16 fireHandler:a6];

  [v20 resume];

  return v20;
}

- (void)resume
{
  objc_super v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->mWorkQueue);
  mTimerSource = self->mTimerSource;
  self->mTimerSource = v3;

  v5 = self->mTimerSource;
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(self->mTimeInterval * 1000000000.0));
  dispatch_source_set_timer(v5, v6, (unint64_t)(self->mTimeInterval * 1000000000.0), 0);
  objc_initWeak(&location, self);
  v7 = self->mTimerSource;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __26__CATDispatchTimer_resume__block_invoke;
  v8[3] = &unk_2641DBCB0;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->mTimerSource);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __26__CATDispatchTimer_resume__block_invoke(uint64_t a1)
{
  uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained;
    uint64_t WeakRetained = dispatch_source_testcancel(*(dispatch_source_t *)(WeakRetained + 64));
    uint64_t v2 = (uint64_t)v4;
    if (!WeakRetained)
    {
      uint64_t WeakRetained = [v4 timerDidFire];
      uint64_t v2 = (uint64_t)v4;
    }
  }

  return MEMORY[0x270F9A758](WeakRetained, v2);
}

- (void)timerDidFire
{
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  objc_super v3 = (void *)MEMORY[0x216693330](self->mFireHandler);
  if (v3)
  {
    unint64_t v4 = self->mFireCount + 1;
    self->mFireCount = v4;
    if (self->mFiresForever || v4 != self->mTotalFires)
    {
      char v6 = 0;
    }
    else
    {
      dispatch_source_cancel((dispatch_source_t)self->mTimerSource);
      id mFireHandler = self->mFireHandler;
      self->id mFireHandler = 0;

      char v6 = 1;
    }
    mDelegateQueue = self->mDelegateQueue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __32__CATDispatchTimer_timerDidFire__block_invoke;
    v10[3] = &unk_2641DC640;
    v10[4] = self;
    id v11 = v3;
    unint64_t v12 = v4;
    char v13 = v6;
    v8 = v10;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __CATPerformBlock_block_invoke_14;
    block[3] = &unk_2641DBD98;
    id v15 = v8;
    id v9 = mDelegateQueue;
    dispatch_async(v9, block);
  }
}

uint64_t __32__CATDispatchTimer_timerDidFire__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

- (void)invalidate
{
  dispatch_source_cancel((dispatch_source_t)self->mTimerSource);
  mWorkQueue = self->mWorkQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__CATDispatchTimer_invalidate__block_invoke;
  v6[3] = &unk_2641DBE60;
  v6[4] = self;
  unint64_t v4 = v6;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_14;
  block[3] = &unk_2641DBD98;
  id v8 = v4;
  v5 = mWorkQueue;
  dispatch_async(v5, block);
}

void __30__CATDispatchTimer_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 56);
  *(void *)(v1 + 56) = 0;
}

- (void)reset
{
  mWorkQueue = self->mWorkQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __25__CATDispatchTimer_reset__block_invoke;
  v5[3] = &unk_2641DBE60;
  v5[4] = self;
  objc_super v3 = v5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_14;
  block[3] = &unk_2641DBD98;
  id v7 = v3;
  unint64_t v4 = mWorkQueue;
  dispatch_async(v4, block);
}

uint64_t __25__CATDispatchTimer_reset__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 72) = 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTimerSource, 0);
  objc_storeStrong(&self->mFireHandler, 0);
  objc_storeStrong((id *)&self->mDelegateQueue, 0);
  objc_storeStrong((id *)&self->mWorkQueue, 0);

  objc_storeStrong((id *)&self->mIdentifier, 0);
}

@end