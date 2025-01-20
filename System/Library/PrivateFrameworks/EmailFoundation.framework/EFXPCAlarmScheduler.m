@interface EFXPCAlarmScheduler
+ (id)log;
- (id)_init;
- (id)debugDescription;
- (id)ef_publicDescription;
- (id)initGlobalInstance;
- (id)test_schedulerObserver;
- (void)_queue_handleEvent:(id)a3;
- (void)_queue_handleXPCEvent:(id)a3;
- (void)_queue_notifyAlarmsOfPendingEvents;
- (void)_queue_scheduleEvent:(id)a3;
- (void)_queue_unscheduleEventWithName:(id)a3;
- (void)addAlarm:(id)a3;
- (void)removeAlarm:(id)a3;
- (void)scheduleEvent:(id)a3;
- (void)setTest_schedulerObserver:(id)a3;
- (void)test_fireEvent:(id)a3;
- (void)unscheduleEventWithName:(id)a3;
@end

@implementation EFXPCAlarmScheduler

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__EFXPCAlarmScheduler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_10 != -1) {
    dispatch_once(&log_onceToken_10, block);
  }
  v2 = (void *)log_log_10;
  return v2;
}

void __26__EFXPCAlarmScheduler_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_10;
  log_log_10 = (uint64_t)v1;
}

- (id)initGlobalInstance
{
  v2 = [(EFXPCAlarmScheduler *)self _init];
  if (v2)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    id v3 = v2[3];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __41__EFXPCAlarmScheduler_initGlobalInstance__block_invoke;
    v5[3] = &unk_1E6123900;
    objc_copyWeak(&v6, &location);
    xpc_set_event_stream_handler("com.apple.alarm", v3, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __41__EFXPCAlarmScheduler_initGlobalInstance__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_queue_handleXPCEvent:", v3);
}

- (id)_init
{
  v12.receiver = self;
  v12.super_class = (Class)EFXPCAlarmScheduler;
  v2 = [(EFXPCAlarmScheduler *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    alarms = v2->_alarms;
    v2->_alarms = (NSMapTable *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pendingEvents = v2->_pendingEvents;
    v2->_pendingEvents = v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.email.EFXPCAlarmScheduler", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

- (void)_queue_handleXPCEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14560]);
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  v7 = +[EFXPCAlarmScheduler log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (id)objc_opt_class();
    [v6 timeIntervalSince1970];
    int v13 = 138543874;
    id v14 = v8;
    __int16 v15 = 2082;
    v16 = string;
    __int16 v17 = 2048;
    uint64_t v18 = (uint64_t)v9;
    _os_log_impl(&dword_1B5A59000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received XPC alarm event with name: %{public}s date: %{time_t}ld", (uint8_t *)&v13, 0x20u);
  }
  if (string)
  {
    v10 = [NSString stringWithUTF8String:string];
    v11 = [[EFXPCAlarmEvent alloc] initWithName:v10 fireDate:v6 isUserVisible:xpc_dictionary_get_BOOL(v4, "UserVisible")];
    [(EFXPCAlarmScheduler *)self _queue_handleEvent:v11];
  }
  else
  {
    v10 = +[EFXPCAlarmScheduler log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_super v12 = objc_opt_class();
      [(EFXPCAlarmScheduler *)v12 _queue_handleXPCEvent:v10];
    }
  }
}

- (void)_queue_scheduleEvent:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  v5 = [v8 fireDate];
  [v5 timeIntervalSince1970];
  xpc_dictionary_set_date(v4, "Date", (uint64_t)(v6 * 1000000000.0));

  xpc_dictionary_set_BOOL(v4, "UserVisible", [v8 isUserVisible]);
  id v7 = [v8 name];
  [v7 UTF8String];
  xpc_set_event();
}

- (void)_queue_unscheduleEventWithName:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = v4;
  [v7 UTF8String];
  xpc_set_event();
  pendingEvents = self->_pendingEvents;
  double v6 = +[EFXPCAlarmEvent _eventWithName:v7];
  [(NSMutableSet *)pendingEvents removeObject:v6];
}

- (void)test_fireEvent:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__EFXPCAlarmScheduler_test_fireEvent___block_invoke;
  v7[3] = &unk_1E6121B90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __38__EFXPCAlarmScheduler_test_fireEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleEvent:", *(void *)(a1 + 40));
}

- (void)_queue_handleEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSMutableSet *)self->_pendingEvents addObject:v4];
  [(EFXPCAlarmScheduler *)self _queue_notifyAlarmsOfPendingEvents];
}

- (void)_queue_notifyAlarmsOfPendingEvents
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obj = self->_pendingEvents;
  uint64_t v3 = [(NSMutableSet *)obj countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v3)
  {
    uint64_t v5 = *(void *)v22;
    *(void *)&long long v4 = 138543618;
    long long v18 = v4;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        alarms = self->_alarms;
        double v9 = objc_msgSend(v7, "name", v18);
        v10 = [(NSMapTable *)alarms objectForKey:v9];

        if (v10)
        {
          v11 = +[EFXPCAlarmScheduler log];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            objc_super v12 = objc_opt_class();
            *(_DWORD *)buf = 138543874;
            v26 = v12;
            __int16 v27 = 2114;
            v28 = v10;
            __int16 v29 = 2114;
            v30 = v7;
            id v13 = v12;
            _os_log_impl(&dword_1B5A59000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying alarm %{public}@ of event: %{public}@", buf, 0x20u);
          }
          [v10 eventDidFire:v7];
        }
        else
        {
          id v14 = +[EFXPCAlarmScheduler log];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v15 = objc_opt_class();
            *(_DWORD *)buf = v18;
            v26 = v15;
            __int16 v27 = 2114;
            v28 = v7;
            id v16 = v15;
            _os_log_impl(&dword_1B5A59000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] no registered alarm for event: %{public}@", buf, 0x16u);
          }
          [(NSMutableSet *)v19 addObject:v7];
        }
      }
      uint64_t v3 = [(NSMutableSet *)obj countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v3);
  }

  pendingEvents = self->_pendingEvents;
  self->_pendingEvents = v19;
}

- (void)addAlarm:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__EFXPCAlarmScheduler_addAlarm___block_invoke;
  v7[3] = &unk_1E6121B90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __32__EFXPCAlarmScheduler_addAlarm___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = +[EFXPCAlarmScheduler log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 40);
    int v10 = 138543618;
    v11 = v3;
    __int16 v12 = 2114;
    uint64_t v13 = v4;
    id v5 = v3;
    _os_log_impl(&dword_1B5A59000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] adding alarm %{public}@", (uint8_t *)&v10, 0x16u);
  }
  id v6 = *(void **)(a1 + 40);
  id v7 = *(void **)(*(void *)(a1 + 32) + 8);
  id v8 = [v6 eventName];
  [v7 setObject:v6 forKey:v8];

  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyAlarmsOfPendingEvents");
}

- (void)removeAlarm:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__EFXPCAlarmScheduler_removeAlarm___block_invoke;
  v7[3] = &unk_1E6121B90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __35__EFXPCAlarmScheduler_removeAlarm___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = +[EFXPCAlarmScheduler log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 40);
    int v9 = 138543618;
    int v10 = v3;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    id v5 = v3;
    _os_log_impl(&dword_1B5A59000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing alarm %{public}@", (uint8_t *)&v9, 0x16u);
  }
  id v6 = *(void **)(a1 + 40);
  id v7 = *(void **)(*(void *)(a1 + 32) + 8);
  id v8 = [v6 eventName];
  [v7 removeObjectForKey:v8];
}

- (void)scheduleEvent:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__EFXPCAlarmScheduler_scheduleEvent___block_invoke;
  v7[3] = &unk_1E6121B90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __37__EFXPCAlarmScheduler_scheduleEvent___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = +[EFXPCAlarmScheduler log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138543618;
    id v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    id v5 = v3;
    _os_log_impl(&dword_1B5A59000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] scheduling event: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleEvent:", *(void *)(a1 + 40));
}

- (void)unscheduleEventWithName:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__EFXPCAlarmScheduler_unscheduleEventWithName___block_invoke;
  v7[3] = &unk_1E6121B90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __47__EFXPCAlarmScheduler_unscheduleEventWithName___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = +[EFXPCAlarmScheduler log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138543618;
    id v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    id v5 = v3;
    _os_log_impl(&dword_1B5A59000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] unscheduling event: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleEventWithName:", *(void *)(a1 + 40));
}

- (id)debugDescription
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [NSString stringWithFormat:@"%@:%p", objc_opt_class(), self];
  [v3 addObject:v4];

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__EFXPCAlarmScheduler_debugDescription__block_invoke;
  block[3] = &unk_1E6121B90;
  id v6 = v3;
  id v10 = v6;
  uint64_t v11 = self;
  dispatch_sync(queue, block);
  int v7 = [v6 componentsJoinedByString:@"\n"];

  return v7;
}

void __39__EFXPCAlarmScheduler_debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) addObject:@"\tAlarms"];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v21;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = NSString;
        int v7 = *(void **)(a1 + 32);
        id v8 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKey:*(void *)(*((void *)&v20 + 1) + 8 * v5)];
        __int16 v9 = [v6 stringWithFormat:@"\t\t%@", v8];
        [v7 addObject:v9];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v3);
  }

  [*(id *)(a1 + 32) addObject:@"\tPending Events"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = *(id *)(*(void *)(a1 + 40) + 16);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(a1 + 32);
        __int16 v15 = [NSString stringWithFormat:@"\t\t%@", *(void *)(*((void *)&v16 + 1) + 8 * v13)];
        [v14 addObject:v15];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v11);
  }
}

- (id)ef_publicDescription
{
  uint64_t v3 = +[EFDevice currentDevice];
  int v4 = [v3 isInternal];

  if (v4) {
    [(EFXPCAlarmScheduler *)self debugDescription];
  }
  else {
  uint64_t v5 = [NSString stringWithFormat:@"<%@:%p %lu Pending Events>", objc_opt_class(), self, -[NSMutableSet count](self->_pendingEvents, "count")];
  }
  return v5;
}

- (id)test_schedulerObserver
{
  return self->_test_schedulerObserver;
}

- (void)setTest_schedulerObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_test_schedulerObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_alarms, 0);
}

- (void)_queue_handleXPCEvent:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  id v5 = a1;
  _os_log_error_impl(&dword_1B5A59000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Ignoring XPC alarm event with NULL event name", (uint8_t *)a2, 0xCu);
}

@end