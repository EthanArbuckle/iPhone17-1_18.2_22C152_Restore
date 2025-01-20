@interface HDXPCAlarmScheduler
- (HDXPCAlarmScheduler)init;
- (id)diagnosticDescription;
- (id)unitTest_schedulerObserver;
- (void)_queue_handleEvent:(id)a3;
- (void)_queue_handleXPCEvent:(id)a3;
- (void)_queue_notifyAlarmsOfPendingEvents;
- (void)_queue_scheduleEvent:(id)a3;
- (void)_queue_unscheduleEventWithName:(id)a3;
- (void)addAlarm:(id)a3;
- (void)removeAlarm:(id)a3;
- (void)scheduleEvent:(id)a3;
- (void)setUnitTest_schedulerObserver:(id)a3;
- (void)unittest_fireEvent:(id)a3;
- (void)unscheduleEventWithName:(id)a3;
@end

@implementation HDXPCAlarmScheduler

- (HDXPCAlarmScheduler)init
{
  v17.receiver = self;
  v17.super_class = (Class)HDXPCAlarmScheduler;
  v2 = [(HDXPCAlarmScheduler *)&v17 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    alarms = v2->_alarms;
    v2->_alarms = (NSMapTable *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    pendingEvents = v2->_pendingEvents;
    v2->_pendingEvents = v5;

    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = +[HDDiagnosticManager sharedDiagnosticManager];
    [v9 addObject:v2];

    v10 = [MEMORY[0x263F0A980] sharedBehavior];
    int v11 = [v10 schedulesXPCAlarms];

    if (v11)
    {
      objc_initWeak(&location, v2);
      v12 = v2->_queue;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __27__HDXPCAlarmScheduler_init__block_invoke;
      v14[3] = &unk_2643D4440;
      objc_copyWeak(&v15, &location);
      xpc_set_event_stream_handler("com.apple.alarm", v12, v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

void __27__HDXPCAlarmScheduler_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_queue_handleXPCEvent:", v3);
}

- (void)_queue_handleXPCEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x263EF86C8]);
  v6 = [MEMORY[0x263EFF910] date];
  xpc_set_event();
  _HKInitializeLogging();
  uint64_t v7 = HKLogInfrastructure();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    id v9 = v8;
    [v6 timeIntervalSince1970];
    int v13 = 138543874;
    v14 = v8;
    __int16 v15 = 2082;
    v16 = string;
    __int16 v17 = 2048;
    uint64_t v18 = (uint64_t)v10;
    _os_log_impl(&dword_21BFB4000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received XPC alarm event with name: %{public}s date: %{time_t}ld", (uint8_t *)&v13, 0x20u);
  }
  if (string)
  {
    int v11 = [NSString stringWithUTF8String:string];
    v12 = [[HDXPCAlarmEvent alloc] initWithName:v11 fireDate:v6 isUserVisible:xpc_dictionary_get_BOOL(v4, "UserVisible")];
    [(HDXPCAlarmScheduler *)self _queue_handleEvent:v12];
  }
  else
  {
    _HKInitializeLogging();
    int v11 = HKLogInfrastructure();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[HDXPCAlarmScheduler _queue_handleXPCEvent:]((uint64_t)self, v11);
    }
  }
}

- (void)_queue_scheduleEvent:(id)a3
{
  queue = self->_queue;
  id v4 = a3;
  dispatch_assert_queue_V2(queue);
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  v5 = [v4 fireDate];
  xpc_dictionary_set_date(xdict, "Date", objc_msgSend(v5, "hk_nanosecondsSince1970"));

  xpc_dictionary_set_BOOL(xdict, "UserVisible", [v4 isUserVisible]);
  v6 = [v4 name];

  id v7 = v6;
  [v7 UTF8String];
  xpc_set_event();
}

- (void)_queue_unscheduleEventWithName:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = v5;
  [v6 UTF8String];
  xpc_set_event();
  pendingEvents = self->_pendingEvents;
  id v8 = +[HDXPCAlarmEvent _eventWithName:v6];

  [(NSMutableSet *)pendingEvents removeObject:v8];
}

- (void)unittest_fireEvent:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__HDXPCAlarmScheduler_unittest_fireEvent___block_invoke;
  v7[3] = &unk_2643D45C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __42__HDXPCAlarmScheduler_unittest_fireEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleEvent:", *(void *)(a1 + 40));
}

- (void)_queue_handleEvent:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(NSMutableSet *)self->_pendingEvents addObject:v5];

  [(HDXPCAlarmScheduler *)self _queue_notifyAlarmsOfPendingEvents];
}

- (void)_queue_notifyAlarmsOfPendingEvents
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = self->_pendingEvents;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v23;
    *(void *)&long long v5 = 138543618;
    long long v20 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        alarms = self->_alarms;
        int v11 = objc_msgSend(v9, "name", v20);
        v12 = [(NSMapTable *)alarms objectForKey:v11];

        _HKInitializeLogging();
        int v13 = HKLogInfrastructure();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          if (v14)
          {
            __int16 v15 = objc_opt_class();
            *(_DWORD *)buf = 138543874;
            v27 = v15;
            __int16 v28 = 2114;
            v29 = v12;
            __int16 v30 = 2114;
            v31 = v9;
            id v16 = v15;
            _os_log_impl(&dword_21BFB4000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying alarm %{public}@ of event: %{public}@", buf, 0x20u);
          }
          [v12 eventDidFire:v9];
        }
        else
        {
          if (v14)
          {
            __int16 v17 = objc_opt_class();
            *(_DWORD *)buf = v20;
            v27 = v17;
            __int16 v28 = 2114;
            v29 = v9;
            id v18 = v17;
            _os_log_impl(&dword_21BFB4000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] no registered alarm for event: %{public}@", buf, 0x16u);
          }
          [(NSMutableSet *)v21 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v6);
  }

  pendingEvents = self->_pendingEvents;
  self->_pendingEvents = v21;
}

- (void)addAlarm:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__HDXPCAlarmScheduler_addAlarm___block_invoke;
  v7[3] = &unk_2643D45C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __32__HDXPCAlarmScheduler_addAlarm___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = HKLogInfrastructure();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 40);
    int v10 = 138543618;
    int v11 = v3;
    __int16 v12 = 2114;
    uint64_t v13 = v4;
    id v5 = v3;
    _os_log_impl(&dword_21BFB4000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] adding alarm %{public}@", (uint8_t *)&v10, 0x16u);
  }
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 8);
  id v8 = [v6 eventName];
  [v7 setObject:v6 forKey:v8];

  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyAlarmsOfPendingEvents");
}

- (void)removeAlarm:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__HDXPCAlarmScheduler_removeAlarm___block_invoke;
  v7[3] = &unk_2643D45C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __35__HDXPCAlarmScheduler_removeAlarm___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = HKLogInfrastructure();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 40);
    int v9 = 138543618;
    int v10 = v3;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    id v5 = v3;
    _os_log_impl(&dword_21BFB4000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing alarm %{public}@", (uint8_t *)&v9, 0x16u);
  }
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 8);
  id v8 = [v6 eventName];
  [v7 removeObjectForKey:v8];
}

- (void)scheduleEvent:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__HDXPCAlarmScheduler_scheduleEvent___block_invoke;
  v7[3] = &unk_2643D45C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __37__HDXPCAlarmScheduler_scheduleEvent___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = HKLogInfrastructure();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138543618;
    id v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    id v5 = v3;
    _os_log_impl(&dword_21BFB4000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] scheduling event: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleEvent:", *(void *)(a1 + 40));
}

- (void)unscheduleEventWithName:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__HDXPCAlarmScheduler_unscheduleEventWithName___block_invoke;
  v7[3] = &unk_2643D45C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __47__HDXPCAlarmScheduler_unscheduleEventWithName___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = HKLogInfrastructure();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138543618;
    id v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    id v5 = v3;
    _os_log_impl(&dword_21BFB4000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] unscheduling event: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleEventWithName:", *(void *)(a1 + 40));
}

- (id)diagnosticDescription
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  id v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [NSString stringWithFormat:@"%@:%p", objc_opt_class(), self];
  [v3 addObject:v4];

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__HDXPCAlarmScheduler_diagnosticDescription__block_invoke;
  block[3] = &unk_2643D45C8;
  id v10 = v3;
  uint64_t v11 = self;
  id v6 = v3;
  dispatch_sync(queue, block);
  int v7 = [v6 componentsJoinedByString:@"\n"];

  return v7;
}

void __44__HDXPCAlarmScheduler_diagnosticDescription__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) addObject:@"\tAlarms"];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v23;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = NSString;
        id v8 = *(void **)(a1 + 32);
        __int16 v9 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKey:*(void *)(*((void *)&v22 + 1) + 8 * v6)];
        id v10 = [v7 stringWithFormat:@"\t\t%@", v9];
        [v8 addObject:v10];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 32) addObject:@"\tPending Events"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = *(id *)(*(void *)(a1 + 40) + 16);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(a1 + 32);
        __int16 v17 = [NSString stringWithFormat:@"\t\t%@", *(void *)(*((void *)&v18 + 1) + 8 * v15)];
        [v16 addObject:v17];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v13);
  }
}

- (id)unitTest_schedulerObserver
{
  return self->_unitTest_schedulerObserver;
}

- (void)setUnitTest_schedulerObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_schedulerObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pendingEvents, 0);

  objc_storeStrong((id *)&self->_alarms, 0);
}

- (void)_queue_handleXPCEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v4 = 138543362;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl(&dword_21BFB4000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Ignoring XPC alarm event with NULL event name", (uint8_t *)&v4, 0xCu);
}

@end