@interface LACDTOLocationMonitor
- (LACDTOLocationMonitor)initWithLocationProvider:(id)a3 workQueue:(id)a4;
- (LACDTOLocationMonitorDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)startMonitoringWithReason:(id)a3;
- (void)stopMonitoringWithReason:(id)a3;
@end

@implementation LACDTOLocationMonitor

- (LACDTOLocationMonitor)initWithLocationProvider:(id)a3 workQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACDTOLocationMonitor;
  v9 = [(LACDTOLocationMonitor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locationProvider, a3);
    objc_storeStrong((id *)&v10->_workQueue, a4);
  }

  return v10;
}

- (void)startMonitoringWithReason:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if ([(LACTimer *)self->_timer isRunning])
  {
    v5 = LACLogDTOTimers();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[LACDTOLocationMonitor startMonitoringWithReason:]((uint64_t)self, v5);
    }
  }
  else
  {
    v6 = objc_alloc_init(LACTimer);
    timer = self->_timer;
    self->_timer = v6;

    id v8 = LACLogDTOTimers();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v15 = self;
      __int16 v16 = 2048;
      uint64_t v17 = 0x4024000000000000;
      __int16 v18 = 2114;
      id v19 = v4;
      _os_log_impl(&dword_254F14000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ starting monitor with an interval of %.2f secs with reason: %{public}@", buf, 0x20u);
    }

    objc_initWeak((id *)buf, self);
    p_workQueue = &self->_workQueue;
    workQueue = self->_workQueue;
    v10 = p_workQueue[1];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __51__LACDTOLocationMonitor_startMonitoringWithReason___block_invoke;
    v12[3] = &unk_2653B59C8;
    objc_copyWeak(&v13, (id *)buf);
    [(OS_dispatch_queue *)v10 dispatchAfter:workQueue inQueue:1 repeat:v12 block:10.0];
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

void __51__LACDTOLocationMonitor_startMonitoringWithReason___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = LACLogDTOTimers();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v8 = WeakRetained;
      _os_log_impl(&dword_254F14000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ performing scheduled query", buf, 0xCu);
    }

    id v4 = (void *)WeakRetained[1];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __51__LACDTOLocationMonitor_startMonitoringWithReason___block_invoke_1;
    v5[3] = &unk_2653B70A0;
    objc_copyWeak(&v6, v1);
    [v4 checkIsInFamiliarLocationWithCompletion:v5];
    objc_destroyWeak(&v6);
  }
}

void __51__LACDTOLocationMonitor_startMonitoringWithReason___block_invoke_1(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 4);
    [v5 locationMonitor:v4 didReceiveLocationState:v6];
  }
}

- (void)stopMonitoringWithReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v5 = LACLogDTOTimers();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping monitor with reason: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  [(LACTimer *)self->_timer cancel];
  timer = self->_timer;
  self->_timer = 0;
}

- (LACDTOLocationMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LACDTOLocationMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_locationProvider, 0);
}

- (void)startMonitoringWithReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_254F14000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ ignoring redundant request to start", (uint8_t *)&v2, 0xCu);
}

@end