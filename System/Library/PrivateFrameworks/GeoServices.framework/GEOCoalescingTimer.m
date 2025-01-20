@interface GEOCoalescingTimer
- (BOOL)isScheduledToRun;
- (GEOCoalescingTimer)initWithCoalescingInterval:(double)a3 deadlineInterval:(double)a4 queue:(id)a5 callback:(id)a6;
- (void)dealloc;
- (void)scheduleRun;
@end

@implementation GEOCoalescingTimer

uint64_t __33__GEOCoalescingTimer_scheduleRun__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = 0;
  *(void *)(*(void *)(result + 32) + 40) = 0;
  return result;
}

- (void)scheduleRun
{
  v18 = self->_isolater;
  _geo_isolate_lock();
  timer = self->_timer;
  if (!timer)
  {
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
    v5 = self->_timer;
    self->_timer = v4;

    objc_initWeak(&location, self);
    v6 = self->_timer;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __33__GEOCoalescingTimer_scheduleRun__block_invoke;
    v15[3] = &unk_1E53D93B8;
    objc_copyWeak(&v16, &location);
    v15[4] = self;
    dispatch_source_set_event_handler(v6, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  GEOGetMonotonicTime();
  double deadline = self->_deadline;
  if (deadline == 0.0)
  {
    double deadline = v7 + self->_deadlineInterval;
    self->_double deadline = deadline;
  }
  double v9 = deadline - v7;
  BOOL v10 = deadline <= v7;
  double v11 = 0.0;
  if (!v10) {
    double v11 = v9;
  }
  double coalescingInterval = self->_coalescingInterval;
  if (coalescingInterval < v11) {
    double v11 = self->_coalescingInterval;
  }
  if (v11 >= coalescingInterval || !self->_isScheduled)
  {
    v13 = self->_timer;
    dispatch_time_t v14 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
    dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->_coalescingInterval * 1000000.0));
    self->_isScheduled = 1;
  }
  if (!timer) {
    dispatch_activate((dispatch_object_t)self->_timer);
  }
  _geo_isolate_unlock();
}

- (GEOCoalescingTimer)initWithCoalescingInterval:(double)a3 deadlineInterval:(double)a4 queue:(id)a5 callback:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)GEOCoalescingTimer;
  v13 = [(GEOCoalescingTimer *)&v22 init];
  if (v13)
  {
    uint64_t v14 = geo_isolater_create();
    isolater = v13->_isolater;
    v13->_isolater = (geo_isolater *)v14;

    if (a3 >= a4) {
      double v16 = a4;
    }
    else {
      double v16 = a3;
    }
    if (a3 >= a4) {
      double v17 = a3;
    }
    else {
      double v17 = a4;
    }
    v13->_double coalescingInterval = v16;
    v13->_deadlineInterval = v17;
    v13->_double deadline = 0.0;
    v13->_isScheduled = 0;
    objc_storeStrong((id *)&v13->_queue, a5);
    uint64_t v18 = [v12 copy];
    id callback = v13->_callback;
    v13->_id callback = (id)v18;

    v20 = v13;
  }

  return v13;
}

void __33__GEOCoalescingTimer_scheduleRun__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 64) + 16))();
    geo_isolate_sync();
  }
}

- (BOOL)isScheduledToRun
{
  v2 = self;
  v4 = self->_isolater;
  _geo_isolate_lock();
  LOBYTE(v2) = v2->_isScheduled;
  _geo_isolate_unlock();

  return (char)v2;
}

- (void)dealloc
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)GEOCoalescingTimer;
  [(GEOCoalescingTimer *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_isolater, 0);
}

@end