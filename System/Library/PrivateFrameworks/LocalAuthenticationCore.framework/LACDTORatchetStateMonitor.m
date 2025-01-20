@interface LACDTORatchetStateMonitor
- (LACDTOEventBus)eventBus;
- (LACDTORatchetState)ratchetState;
- (LACDTORatchetStateMonitor)initWithRatchetStateProvider:(id)a3 workQueue:(id)a4;
- (void)_scheduleNextStatusCheck;
- (void)handleEvent:(id)a3 sender:(id)a4;
- (void)policyController:(id)a3 didFinishPolicyEvaluation:(id)a4 result:(id)a5;
- (void)ratchetStateCompositeWithCompletion:(id)a3;
- (void)ratchetStateWithCompletion:(id)a3;
- (void)setEventBus:(id)a3;
- (void)setRatchetState:(id)a3;
@end

@implementation LACDTORatchetStateMonitor

- (LACDTORatchetStateMonitor)initWithRatchetStateProvider:(id)a3 workQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACDTORatchetStateMonitor;
  v9 = [(LACDTORatchetStateMonitor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ratchetStateProvider, a3);
    objc_storeStrong((id *)&v10->_workQueue, a4);
  }

  return v10;
}

- (void)setRatchetState:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  p_ratchetState = (id *)&self->_ratchetState;
  if ([(LACDTORatchetState *)self->_ratchetState isEqual:v5])
  {
    if (![(LACTimer *)self->_timer isRunning]) {
      [(LACDTORatchetStateMonitor *)self _scheduleNextStatusCheck];
    }
  }
  else
  {
    id v7 = LACLogDTOState();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *p_ratchetState;
      int v13 = 138543618;
      id v14 = v8;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl(&dword_254F14000, v7, OS_LOG_TYPE_DEFAULT, "Ratchet state changed from: %{public}@ to %{public}@", (uint8_t *)&v13, 0x16u);
    }

    id v9 = *p_ratchetState;
    objc_storeStrong((id *)&self->_ratchetState, a3);
    uint64_t v10 = [v9 rawValue];
    if (v10 != [*p_ratchetState rawValue])
    {
      v11 = [[LACDTOEvent alloc] initWithRawValue:0 value:self->_ratchetState];
      objc_super v12 = [(LACDTORatchetStateMonitor *)self eventBus];
      [v12 dispatchEvent:v11 sender:self];
    }
    [(LACDTORatchetStateMonitor *)self _scheduleNextStatusCheck];
  }
}

- (void)handleEvent:(id)a3 sender:(id)a4
{
  if ([a3 rawValue])
  {
    [(LACDTORatchetStateMonitor *)self ratchetStateWithCompletion:&__block_literal_global_9];
  }
}

- (void)policyController:(id)a3 didFinishPolicyEvaluation:(id)a4 result:(id)a5
{
}

- (void)ratchetStateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_initWeak(&location, self);
  ratchetStateProvider = self->_ratchetStateProvider;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__LACDTORatchetStateMonitor_ratchetStateWithCompletion___block_invoke;
  v7[3] = &unk_2653B5860;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(LACDTORatchetStateProvider *)ratchetStateProvider ratchetStateWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__LACDTORatchetStateMonitor_ratchetStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (!v5) {
      [WeakRetained setRatchetState:v8];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)ratchetStateCompositeWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_initWeak(&location, self);
  ratchetStateProvider = self->_ratchetStateProvider;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__LACDTORatchetStateMonitor_ratchetStateCompositeWithCompletion___block_invoke;
  v7[3] = &unk_2653B5888;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(LACDTORatchetStateProvider *)ratchetStateProvider ratchetStateCompositeWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __65__LACDTORatchetStateMonitor_ratchetStateCompositeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!v5)
    {
      id v7 = [v8 ratchetState];
      [WeakRetained setRatchetState:v7];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_scheduleNextStatusCheck
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if ([(LACTimer *)self->_timer isRunning])
  {
    [(LACTimer *)self->_timer cancel];
    timer = self->_timer;
    self->_timer = 0;
  }
  id v4 = objc_alloc_init(LACTimer);
  id v5 = self->_timer;
  self->_timer = v4;

  id v6 = [(LACDTORatchetStateMonitor *)self ratchetState];
  [v6 effectiveDuration];
  double v8 = v7;

  id v9 = LACLogDTOTimers();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v15 = v8;
    _os_log_impl(&dword_254F14000, v9, OS_LOG_TYPE_DEFAULT, "Schedule ratchet state check in %.2f", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v11 = self->_timer;
  workQueue = self->_workQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__LACDTORatchetStateMonitor__scheduleNextStatusCheck__block_invoke;
  v12[3] = &unk_2653B59C8;
  objc_copyWeak(&v13, (id *)buf);
  [(LACTimer *)v11 dispatchAfter:workQueue inQueue:v12 block:v8];
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __53__LACDTORatchetStateMonitor__scheduleNextStatusCheck__block_invoke(uint64_t a1)
{
  v2 = LACLogDTOTimers();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_254F14000, v2, OS_LOG_TYPE_DEFAULT, "Performing ratchet state query", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained ratchetStateWithCompletion:&__block_literal_global_7];
}

- (LACDTOEventBus)eventBus
{
  return self->eventBus;
}

- (void)setEventBus:(id)a3
{
}

- (LACDTORatchetState)ratchetState
{
  return self->_ratchetState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratchetState, 0);
  objc_storeStrong((id *)&self->eventBus, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_ratchetStateProvider, 0);
}

@end