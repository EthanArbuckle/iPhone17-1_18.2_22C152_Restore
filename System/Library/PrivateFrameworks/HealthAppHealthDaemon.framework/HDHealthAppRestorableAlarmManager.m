@interface HDHealthAppRestorableAlarmManager
- (BOOL)removeAlarmEventWithIdentifier:(id)a3 error:(id *)a4;
- (HDDaemon)daemon;
- (HDHealthAppRestorableAlarmManager)initWithDaemon:(id)a3;
- (OS_dispatch_queue)queue;
- (id)createAlarmEventWithIdentifier:(id)a3 dueDate:(id)a4 eventOptions:(unint64_t)a5;
- (void)_queue_alarm:(id)a3 didReceiveDueEvents:(id)a4;
- (void)_queue_removeAlarmEvent:(id)a3;
- (void)_queue_scheduleAlarmEvent:(id)a3 completion:(id)a4;
- (void)_rescheduleAlarmEvent:(id)a3 dueDate:(id)a4 completion:(id)a5;
- (void)_scheduleAlarmEventWithHandler:(id)a3 dueDate:(id)a4 eventOptions:(unint64_t)a5 completion:(id)a6;
- (void)daemonReady:(id)a3;
- (void)removeAlarmEvent:(id)a3;
- (void)rescheduleAlarmEvent:(id)a3 dueDate:(id)a4;
- (void)scheduleAlarmEvent:(id)a3 completion:(id)a4;
- (void)scheduleAlarmEventWithHandler:(id)a3 dueDate:(id)a4 eventOptions:(unint64_t)a5;
- (void)setHandlerForAlarmEvent:(id)a3 handler:(id)a4;
@end

@implementation HDHealthAppRestorableAlarmManager

- (HDHealthAppRestorableAlarmManager)initWithDaemon:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HDHealthAppRestorableAlarmManager;
  v5 = [(HDHealthAppRestorableAlarmManager *)&v17 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v7 = (_HKWeakObserversMap *)objc_alloc_init(MEMORY[0x263F0AA28]);
    alarmHandlers = v6->_alarmHandlers;
    v6->_alarmHandlers = v7;

    uint64_t v9 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    id v11 = objc_alloc(MEMORY[0x263F43308]);
    v12 = [v4 primaryProfile];
    uint64_t v13 = [v11 initWithProfile:v12 clientIdentifier:@"HDHealthAppDaemonExtension" eventHandlerQueue:v6->_queue];
    scheduler = v6->_scheduler;
    v6->_scheduler = (HDRestorableAlarm *)v13;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_daemon);
    [WeakRetained registerForDaemonReady:v6];
  }
  return v6;
}

- (void)daemonReady:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v7 = v12;
    _os_log_impl(&dword_250D3F000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] reported daemon ready", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  scheduler = self->_scheduler;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__HDHealthAppRestorableAlarmManager_daemonReady___block_invoke;
  v9[3] = &unk_265358C28;
  objc_copyWeak(&v10, (id *)buf);
  [(HDRestorableAlarm *)scheduler beginReceivingEventsWithHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __49__HDHealthAppRestorableAlarmManager_daemonReady___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_queue_alarm:didReceiveDueEvents:", v6, v5);
}

- (id)createAlarmEventWithIdentifier:(id)a3 dueDate:(id)a4 eventOptions:(unint64_t)a5
{
  return (id)[(HDRestorableAlarm *)self->_scheduler eventWithIdentifier:a3 dueDate:a4 eventOptions:a5];
}

- (void)scheduleAlarmEventWithHandler:(id)a3 dueDate:(id)a4 eventOptions:(unint64_t)a5
{
}

- (void)_scheduleAlarmEventWithHandler:(id)a3 dueDate:(id)a4 eventOptions:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v14 = [v12 eventIdentifier];
  uint64_t v13 = [(HDHealthAppRestorableAlarmManager *)self createAlarmEventWithIdentifier:v14 dueDate:v11 eventOptions:a5];

  [(HDHealthAppRestorableAlarmManager *)self setHandlerForAlarmEvent:v13 handler:v12];
  [(HDHealthAppRestorableAlarmManager *)self scheduleAlarmEvent:v13 completion:v10];
}

- (void)setHandlerForAlarmEvent:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__HDHealthAppRestorableAlarmManager_setHandlerForAlarmEvent_handler___block_invoke;
  block[3] = &unk_265358C50;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __69__HDHealthAppRestorableAlarmManager_setHandlerForAlarmEvent_handler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 32);
  id v5 = [*(id *)(a1 + 48) eventIdentifier];
  [v3 addObserver:v2 queue:v4 forKey:v5];
}

- (void)scheduleAlarmEvent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__HDHealthAppRestorableAlarmManager_scheduleAlarmEvent_completion___block_invoke;
  block[3] = &unk_265358C78;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __67__HDHealthAppRestorableAlarmManager_scheduleAlarmEvent_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleAlarmEvent:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)rescheduleAlarmEvent:(id)a3 dueDate:(id)a4
{
}

- (void)_rescheduleAlarmEvent:(id)a3 dueDate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __78__HDHealthAppRestorableAlarmManager__rescheduleAlarmEvent_dueDate_completion___block_invoke;
  v15[3] = &unk_265358CA0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __78__HDHealthAppRestorableAlarmManager__rescheduleAlarmEvent_dueDate_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_removeAlarmEvent:", *(void *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) eventIdentifier];
  objc_msgSend(v2, "createAlarmEventWithIdentifier:dueDate:eventOptions:", v3, *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "eventOptions"));
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleAlarmEvent:completion:", v4, *(void *)(a1 + 56));
}

- (BOOL)removeAlarmEventWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  scheduler = self->_scheduler;
  id v29 = 0;
  id v8 = [(HDRestorableAlarm *)scheduler allScheduledEventsWithError:&v29];
  id v9 = v29;
  id v10 = v9;
  if (v9) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v8 == 0;
  }
  if (v11)
  {
    id v12 = v9;
    if (v10)
    {
      if (a4) {
        *a4 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  else
  {
    v23 = a4;
    v24 = self;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v19 = objc_msgSend(v18, "eventIdentifier", v23);
          char v20 = [v19 isEqualToString:v6];

          if (v20)
          {
            [(HDHealthAppRestorableAlarmManager *)v24 removeAlarmEvent:v18];

            BOOL v21 = 1;
            goto LABEL_22;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", v23, 118, @"Scheduled alarm event does not exist");
  }
  BOOL v21 = 0;
LABEL_22:

  return v21;
}

- (void)removeAlarmEvent:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__HDHealthAppRestorableAlarmManager_removeAlarmEvent___block_invoke;
  v7[3] = &unk_265358CC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __54__HDHealthAppRestorableAlarmManager_removeAlarmEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAlarmEvent:", *(void *)(a1 + 40));
}

- (void)_queue_alarm:(id)a3 didReceiveDueEvents:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        alarmHandlers = self->_alarmHandlers;
        id v12 = [v10 eventIdentifier];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __70__HDHealthAppRestorableAlarmManager__queue_alarm_didReceiveDueEvents___block_invoke;
        v14[3] = &unk_265358D18;
        v14[4] = v10;
        v14[5] = self;
        [(_HKWeakObserversMap *)alarmHandlers notifyObserversOfKey:v12 handler:v14];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

uint64_t __70__HDHealthAppRestorableAlarmManager__queue_alarm_didReceiveDueEvents___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleAlarmEvent:restorableAlarmManager:completion:", MEMORY[0x263EF8330], 3221225472, __70__HDHealthAppRestorableAlarmManager__queue_alarm_didReceiveDueEvents___block_invoke_2, &unk_265358CF0, *(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __70__HDHealthAppRestorableAlarmManager__queue_alarm_didReceiveDueEvents___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = (void *)*MEMORY[0x263F09968];
  uint64_t v7 = *MEMORY[0x263F09968];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v6;
      id v9 = objc_opt_class();
      id v10 = *(void **)(a1 + 40);
      id v11 = v9;
      id v12 = [v10 description];
      int v13 = 138543618;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      long long v16 = v12;
      _os_log_impl(&dword_250D3F000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handled alarm successfully %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __70__HDHealthAppRestorableAlarmManager__queue_alarm_didReceiveDueEvents___block_invoke_2_cold_1(a1, v6, (uint64_t)v5);
  }
}

- (void)_queue_scheduleAlarmEvent:(id)a3 completion:(id)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  scheduler = self->_scheduler;
  v26[0] = v6;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  id v19 = 0;
  int v10 = [(HDRestorableAlarm *)scheduler scheduleEvents:v9 error:&v19];
  id v11 = v19;

  _HKInitializeLogging();
  id v12 = (void *)*MEMORY[0x263F09968];
  int v13 = *MEMORY[0x263F09968];
  if (v10)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    uint64_t v14 = v12;
    __int16 v15 = objc_opt_class();
    id v16 = v15;
    uint64_t v17 = [v6 description];
    *(_DWORD *)buf = 138543618;
    BOOL v21 = v15;
    __int16 v22 = 2114;
    v23 = v17;
    _os_log_impl(&dword_250D3F000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduled next alarm %{public}@", buf, 0x16u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = v12;
    long long v18 = objc_opt_class();
    id v16 = v18;
    uint64_t v17 = [v6 eventIdentifier];
    *(_DWORD *)buf = 138543874;
    BOOL v21 = v18;
    __int16 v22 = 2114;
    v23 = v17;
    __int16 v24 = 2114;
    id v25 = v11;
    _os_log_error_impl(&dword_250D3F000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Error scheduling next alarm %{public}@: %{public}@", buf, 0x20u);
LABEL_4:
  }
LABEL_6:
  if (v7) {
    v7[2](v7);
  }
}

- (void)_queue_removeAlarmEvent:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  scheduler = self->_scheduler;
  v23[0] = v4;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  id v16 = 0;
  int v7 = [(HDRestorableAlarm *)scheduler removeEvents:v6 error:&v16];
  id v8 = v16;

  _HKInitializeLogging();
  id v9 = (void *)*MEMORY[0x263F09968];
  int v10 = *MEMORY[0x263F09968];
  if (!v7)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    id v11 = v9;
    __int16 v15 = objc_opt_class();
    id v13 = v15;
    uint64_t v14 = [v4 eventIdentifier];
    *(_DWORD *)buf = 138543874;
    long long v18 = v15;
    __int16 v19 = 2114;
    uint64_t v20 = v14;
    __int16 v21 = 2114;
    id v22 = v8;
    _os_log_error_impl(&dword_250D3F000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Error removing alarm %{public}@: %{public}@", buf, 0x20u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v9;
    id v12 = objc_opt_class();
    id v13 = v12;
    uint64_t v14 = [v4 description];
    *(_DWORD *)buf = 138543618;
    long long v18 = v12;
    __int16 v19 = 2114;
    uint64_t v20 = v14;
    _os_log_impl(&dword_250D3F000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removed alarm %{public}@", buf, 0x16u);
LABEL_4:
  }
LABEL_6:
}

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  return (HDDaemon *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_alarmHandlers, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

void __70__HDHealthAppRestorableAlarmManager__queue_alarm_didReceiveDueEvents___block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = objc_opt_class();
  int v7 = *(void **)(a1 + 40);
  id v8 = v6;
  id v9 = [v7 eventIdentifier];
  int v10 = 138543874;
  id v11 = v6;
  __int16 v12 = 2114;
  id v13 = v9;
  __int16 v14 = 2114;
  uint64_t v15 = a3;
  _os_log_error_impl(&dword_250D3F000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Alarm Event %{public}@ Handler Error: %{public}@", (uint8_t *)&v10, 0x20u);
}

@end