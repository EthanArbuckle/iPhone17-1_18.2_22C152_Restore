@interface BRCDeadlineScheduler
- (BOOL)_setupTimerRequiredForDeadline:(int64_t)a3 now:(int64_t)a4;
- (BOOL)isCancelled;
- (BRCDeadlineScheduler)initWithName:(id)a3 fairScheduler:(id)a4;
- (BRCFairScheduler)fairScheduler;
- (OS_dispatch_workloop)workloop;
- (id)computeNextAdmissibleDateForScheduling;
- (int64_t)coalescingLeeway;
- (void)_close;
- (void)_schedule;
- (void)addSource:(id)a3 deadline:(int64_t)a4;
- (void)cancel;
- (void)close;
- (void)dealloc;
- (void)resume;
- (void)runDeadlineSource:(id)a3 completionHandler:(id)a4;
- (void)setCoalescingLeeway:(int64_t)a3;
- (void)setComputeNextAdmissibleDateForScheduling:(id)a3;
- (void)signal;
- (void)suspend;
@end

@implementation BRCDeadlineScheduler

- (BRCDeadlineScheduler)initWithName:(id)a3 fairScheduler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)BRCDeadlineScheduler;
  v9 = [(BRCDeadlineScheduler *)&v20 init];
  if (v9)
  {
    v10 = [[BRCMinHeap alloc] initWithComparator:&__block_literal_global_57];
    minHeap = v9->_minHeap;
    v9->_minHeap = v10;

    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v9->_fairScheduler, a4);
    uint64_t v12 = [(BRCFairScheduler *)v9->_fairScheduler workloop];
    workloop = v9->_workloop;
    v9->_workloop = (OS_dispatch_workloop *)v12;

    objc_initWeak(&location, v9);
    v14 = [[BRCFairSource alloc] initWithName:@"deadline-sheduler" scheduler:v8];
    source = v9->_source;
    v9->_source = v14;

    [(BRCFairSource *)v9->_source setWorkloop:v9->_workloop];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__BRCDeadlineScheduler_initWithName_fairScheduler___block_invoke_2;
    v17[3] = &unk_1E6993C50;
    objc_copyWeak(&v18, &location);
    [(BRCFairSource *)v9->_source setEventHandler:v17];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v9;
}

uint64_t __51__BRCDeadlineScheduler_initWithName_fairScheduler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a3 + 8);
  BOOL v5 = v3 < v4;
  BOOL v6 = v3 > v4;
  if (v5) {
    return -1;
  }
  else {
    return v6;
  }
}

void __51__BRCDeadlineScheduler_initWithName_fairScheduler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _schedule];
}

- (OS_dispatch_workloop)workloop
{
  return [(BRCFairScheduler *)self->_fairScheduler workloop];
}

- (BOOL)_setupTimerRequiredForDeadline:(int64_t)a3 now:(int64_t)a4
{
  if (self->_leeway + self->_lastSchedule <= a3) {
    int64_t v6 = a3;
  }
  else {
    int64_t v6 = self->_leeway + self->_lastSchedule;
  }
  if (brc_is_before_deadline())
  {
    computeNextAdmissibleDateForScheduling = (uint64_t (**)(id, int64_t))self->_computeNextAdmissibleDateForScheduling;
    if (computeNextAdmissibleDateForScheduling) {
      int64_t v6 = computeNextAdmissibleDateForScheduling[2](computeNextAdmissibleDateForScheduling, a4);
    }
  }
  char v8 = brc_is_before_deadline();
  if ((v8 & 1) == 0)
  {
    int64_t v9 = v6 - a4;
    dispatch_time_t v10 = dispatch_time(0, v9);
    delay = self->_delay;
    if (delay)
    {
      int64_t leeway = self->_leeway;
      if (leeway >= 0) {
        int64_t v13 = self->_leeway;
      }
      else {
        int64_t v13 = leeway + 1;
      }
      uint64_t v14 = v13 >> 1;
      if ((unint64_t)(leeway + 1) >= 3) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = v9 / 10;
      }
      dispatch_source_set_timer(delay, v10, 0xFFFFFFFFFFFFFFFFLL, v15);
    }
    else
    {
      v16 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_workloop);
      v17 = self->_delay;
      self->_delay = v16;

      int64_t v18 = self->_leeway;
      if (v18 >= 0) {
        int64_t v19 = self->_leeway;
      }
      else {
        int64_t v19 = v18 + 1;
      }
      uint64_t v20 = v19 >> 1;
      if ((unint64_t)(v18 + 1) >= 3) {
        uint64_t v21 = v20;
      }
      else {
        uint64_t v21 = v9 / 10;
      }
      dispatch_source_set_timer((dispatch_source_t)self->_delay, v10, 0xFFFFFFFFFFFFFFFFLL, v21);
      v22 = self->_delay;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __59__BRCDeadlineScheduler__setupTimerRequiredForDeadline_now___block_invoke;
      v29[3] = &unk_1E6993698;
      v29[4] = self;
      v23 = v22;
      v24 = v29;
      v25 = v24;
      v26 = v24;
      if (*MEMORY[0x1E4F59658])
      {
        v26 = ((void (*)(void *))*MEMORY[0x1E4F59658])(v24);
      }
      dispatch_block_t v27 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v26);
      dispatch_source_set_event_handler(v23, v27);

      dispatch_resume((dispatch_object_t)self->_delay);
    }
  }
  return v8 ^ 1;
}

uint64_t __59__BRCDeadlineScheduler__setupTimerRequiredForDeadline_now___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) signal];
}

- (void)signal
{
}

- (void)runDeadlineSource:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workloop);
  char v8 = [v6 workloop];
  workloop = self->_workloop;

  if (v8 == workloop)
  {
    [v6 runEventHandler];
    if (v7) {
      v7[2](v7);
    }
  }
  else
  {
    dispatch_time_t v10 = self->_source;
    [(BRCFairSource *)v10 suspend];
    v11 = [v6 workloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__BRCDeadlineScheduler_runDeadlineSource_completionHandler___block_invoke;
    block[3] = &unk_1E69946C8;
    id v14 = v6;
    uint64_t v15 = v10;
    v16 = v7;
    uint64_t v12 = v10;
    dispatch_async(v11, block);
  }
}

uint64_t __60__BRCDeadlineScheduler_runDeadlineSource_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) runEventHandler];
  [*(id *)(a1 + 40) resume];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_schedule
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workloop);
  uint64_t v3 = brc_current_date_nsec();
  uint64_t v4 = self;
  objc_sync_enter(v4);
  BOOL v5 = 0;
  while (1)
  {
    id v6 = [(BRCMinHeap *)v4->_minHeap firstObject];

    if (!v6
      || [(BRCDeadlineScheduler *)v4 _setupTimerRequiredForDeadline:v6[1] now:v3])
    {
      break;
    }
    [(BRCMinHeap *)v4->_minHeap removeFirstObject];
    v4->_lastSchedule = v3;
    BOOL v5 = v6;
    if ([v6 willRunEvenHandler])
    {
      BOOL v7 = [(BRCMinHeap *)v4->_minHeap count] != 0;
      char v8 = v6;
      goto LABEL_7;
    }
  }
  BOOL v7 = 0;
  char v8 = 0;
LABEL_7:

  objc_sync_exit(v4);
  if (v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __33__BRCDeadlineScheduler__schedule__block_invoke;
    v9[3] = &unk_1E6996758;
    BOOL v10 = v7;
    v9[4] = v4;
    [(BRCDeadlineScheduler *)v4 runDeadlineSource:v8 completionHandler:v9];
  }
}

uint64_t __33__BRCDeadlineScheduler__schedule__block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(*(void *)(result + 32) + 32) signal];
  }
  return result;
}

- (void)addSource:(id)a3 deadline:(int64_t)a4
{
  id v11 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  minHeap = v6->_minHeap;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(BRCMinHeap *)minHeap removeObject:v11];
  }
  else
  {
    BOOL v8 = [(BRCMinHeap *)minHeap containsObject:v11];
    int64_t v9 = v6->_minHeap;
    if (v8) {
      [(BRCMinHeap *)v9 objectWeightChanged:v11];
    }
    else {
      [(BRCMinHeap *)v9 addObject:v11];
    }
    id v10 = [(BRCMinHeap *)v6->_minHeap firstObject];

    if (v10 == v11
      && ![(BRCDeadlineScheduler *)v6 _setupTimerRequiredForDeadline:a4 now:brc_current_date_nsec()])
    {
      [(BRCDeadlineScheduler *)v6 signal];
    }
  }
  objc_sync_exit(v6);
}

- (void)suspend
{
  obj = self;
  objc_sync_enter(obj);
  [(BRCFairSource *)obj->_source suspend];
  obj->_isResumed = 0;
  objc_sync_exit(obj);
}

- (void)resume
{
  obj = self;
  objc_sync_enter(obj);
  [(BRCFairSource *)obj->_source resume];
  obj->_isResumed = 1;
  objc_sync_exit(obj);
}

- (void)cancel
{
  self->_isCancelled = 1;
  source = self->_source;
  if (source)
  {
    [(BRCFairSource *)source cancel];
    uint64_t v4 = self->_source;
    self->_source = 0;
  }
  delay = self->_delay;
  if (delay)
  {
    dispatch_source_cancel(delay);
    id v6 = self->_delay;
    self->_delay = 0;
  }
}

- (void)_close
{
  delay = self->_delay;
  if (delay)
  {
    dispatch_source_cancel(delay);
    uint64_t v4 = self->_delay;
    self->_delay = 0;
  }
  source = self->_source;
  if (source)
  {
    [(BRCFairSource *)source cancel];
    id v6 = self;
    objc_sync_enter(v6);
    if (!v6->_isResumed) {
      [(BRCFairSource *)self->_source resume];
    }
    BOOL v7 = self->_source;
    self->_source = 0;

    objc_sync_exit(v6);
  }
  minHeap = self->_minHeap;
  self->_minHeap = 0;
}

- (void)close
{
  workloop = self->_workloop;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__BRCDeadlineScheduler_close__block_invoke;
  block[3] = &unk_1E6993698;
  void block[4] = self;
  dispatch_async_and_wait(workloop, block);
  fairScheduler = self->_fairScheduler;
  self->_fairScheduler = 0;
}

uint64_t __29__BRCDeadlineScheduler_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _close];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1D353B000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ was deallocated without being closed%@", (uint8_t *)&v3, 0x16u);
}

- (int64_t)coalescingLeeway
{
  return self->_leeway;
}

- (void)setCoalescingLeeway:(int64_t)a3
{
  self->_int64_t leeway = a3;
}

- (id)computeNextAdmissibleDateForScheduling
{
  return self->_computeNextAdmissibleDateForScheduling;
}

- (void)setComputeNextAdmissibleDateForScheduling:(id)a3
{
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (BRCFairScheduler)fairScheduler
{
  return self->_fairScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_computeNextAdmissibleDateForScheduling, 0);
  objc_storeStrong((id *)&self->_fairScheduler, 0);
  objc_storeStrong((id *)&self->_delay, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_minHeap, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
}

@end