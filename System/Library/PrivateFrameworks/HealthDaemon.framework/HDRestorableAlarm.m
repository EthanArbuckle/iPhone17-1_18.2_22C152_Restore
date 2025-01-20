@interface HDRestorableAlarm
- (BOOL)removeAllEventsWithError:(id *)a3;
- (BOOL)removeEvents:(id)a3 error:(id *)a4;
- (BOOL)scheduleEvents:(id)a3 error:(id *)a4;
- (HDRestorableAlarm)initWithProfile:(id)a3 clientIdentifier:(id)a4 eventHandlerQueue:(id)a5;
- (HDRestorableAlarm)initWithScheduler:(id)a3 clientIdentifier:(id)a4 eventHandlerQueue:(id)a5;
- (HDXPCAlarm)systemScheduler;
- (NSString)clientIdentifier;
- (NSString)description;
- (OS_dispatch_queue)eventHandlerQueue;
- (id)allScheduledEventsWithError:(id *)a3;
- (id)diagnosticDescription;
- (id)eventWithIdentifier:(id)a3 dueDate:(id)a4 eventOptions:(unint64_t)a5;
- (id)eventWithIdentifier:(id)a3 dueDate:(id)a4 eventOptions:(unint64_t)a5 clientOptions:(unint64_t)a6;
- (id)eventWithIdentifier:(id)a3 dueDateComponents:(id)a4 eventOptions:(unint64_t)a5;
- (id)eventWithIdentifier:(id)a3 dueDateComponents:(id)a4 eventOptions:(unint64_t)a5 clientOptions:(unint64_t)a6;
- (id)replaceAllScheduledEventsWithEvents:(id)a3 error:(id *)a4;
- (void)beginReceivingEventsWithHandler:(id)a3;
- (void)checkForDueEventsWithCompletion:(id)a3;
- (void)eventsDidFire:(id)a3;
- (void)invalidate;
@end

@implementation HDRestorableAlarm

- (HDRestorableAlarm)initWithProfile:(id)a3 clientIdentifier:(id)a4 eventHandlerQueue:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [a3 alarmScheduler];
  v11 = [(HDRestorableAlarm *)self initWithScheduler:v10 clientIdentifier:v9 eventHandlerQueue:v8];

  return v11;
}

- (HDRestorableAlarm)initWithScheduler:(id)a3 clientIdentifier:(id)a4 eventHandlerQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDRestorableAlarm;
  v12 = [(HDRestorableAlarm *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_scheduler, a3);
    uint64_t v14 = [v10 copy];
    clientIdentifier = v13->_clientIdentifier;
    v13->_clientIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v13->_eventHandlerQueue, a5);
    v13->_lock._os_unfair_lock_opaque = 0;
    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    outstandingEventIdentifiers = v13->_outstandingEventIdentifiers;
    v13->_outstandingEventIdentifiers = v16;
  }
  return v13;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p clientIdentifier:%@>", objc_opt_class(), self, self->_clientIdentifier];
}

- (void)beginReceivingEventsWithHandler:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_eventsHandler)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HDRestorableAlarm.m", 70, @"Invalid parameter not satisfying: %@", @"_eventsHandler == nil" object file lineNumber description];
  }
  v5 = (void *)[v8 copy];
  id eventsHandler = self->_eventsHandler;
  self->_id eventsHandler = v5;

  os_unfair_lock_unlock(&self->_lock);
  [(HDRestorableAlarmSchedulerProtocol *)self->_scheduler addAlarm:self];
}

- (void)invalidate
{
  [(HDRestorableAlarmSchedulerProtocol *)self->_scheduler removeAlarm:self];
  os_unfair_lock_lock(&self->_lock);
  id eventsHandler = self->_eventsHandler;
  self->_id eventsHandler = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)eventWithIdentifier:(id)a3 dueDate:(id)a4 eventOptions:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [HDAlarmEvent alloc];
  id v11 = [(HDRestorableAlarm *)self clientIdentifier];
  v12 = [(HDAlarmEvent *)v10 initWithClientIdentifier:v11 eventIdentifier:v9 dueDate:v8 eventOptions:a5];

  return v12;
}

- (id)eventWithIdentifier:(id)a3 dueDate:(id)a4 eventOptions:(unint64_t)a5 clientOptions:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  v12 = [HDAlarmEvent alloc];
  v13 = [(HDRestorableAlarm *)self clientIdentifier];
  uint64_t v14 = [(HDAlarmEvent *)v12 initWithClientIdentifier:v13 eventIdentifier:v11 dueDate:v10 eventOptions:a5 clientOptions:a6];

  return v14;
}

- (id)eventWithIdentifier:(id)a3 dueDateComponents:(id)a4 eventOptions:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [HDAlarmEvent alloc];
  id v11 = [(HDRestorableAlarm *)self clientIdentifier];
  v12 = [(HDAlarmEvent *)v10 initWithClientIdentifier:v11 eventIdentifier:v9 dueDateComponents:v8 eventOptions:a5];

  return v12;
}

- (id)eventWithIdentifier:(id)a3 dueDateComponents:(id)a4 eventOptions:(unint64_t)a5 clientOptions:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  v12 = [HDAlarmEvent alloc];
  v13 = [(HDRestorableAlarm *)self clientIdentifier];
  uint64_t v14 = [(HDAlarmEvent *)v12 initWithClientIdentifier:v13 eventIdentifier:v11 dueDateComponents:v10 eventOptions:a5 clientOptions:a6];

  return v14;
}

- (id)allScheduledEventsWithError:(id *)a3
{
  scheduler = self->_scheduler;
  v5 = [(HDRestorableAlarm *)self clientIdentifier];
  v6 = [(HDRestorableAlarmSchedulerProtocol *)scheduler scheduledEventsForClientIdentifier:v5 error:a3];

  return v6;
}

- (BOOL)scheduleEvents:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  _HKInitializeLogging();
  v7 = HKLogInfrastructure();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v23 = self;
    __int16 v24 = 2048;
    uint64_t v25 = [v6 count];
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Scheduled %lu new events", buf, 0x16u);
  }

  char v8 = [(HDRestorableAlarmSchedulerProtocol *)self->_scheduler scheduleEvents:v6 error:a4];
  os_unfair_lock_lock(&self->_lock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        outstandingEventIdentifiers = self->_outstandingEventIdentifiers;
        v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v13), "eventIdentifier", (void)v17);
        [(NSMutableSet *)outstandingEventIdentifiers removeObject:v15];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  os_unfair_lock_unlock(&self->_lock);
  return v8;
}

- (BOOL)removeEvents:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  _HKInitializeLogging();
  v7 = HKLogInfrastructure();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v23 = self;
    __int16 v24 = 2048;
    uint64_t v25 = [v6 count];
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing %lu events", buf, 0x16u);
  }

  char v8 = [(HDRestorableAlarmSchedulerProtocol *)self->_scheduler removeEvents:v6 error:a4];
  os_unfair_lock_lock(&self->_lock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        outstandingEventIdentifiers = self->_outstandingEventIdentifiers;
        v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v13), "eventIdentifier", (void)v17);
        [(NSMutableSet *)outstandingEventIdentifiers removeObject:v15];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  os_unfair_lock_unlock(&self->_lock);
  return v8;
}

- (id)replaceAllScheduledEventsWithEvents:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  _HKInitializeLogging();
  v7 = HKLogInfrastructure();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    uint64_t v13 = self;
    __int16 v14 = 2048;
    uint64_t v15 = [v6 count];
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Replacing all scheduled events with %lu new events", (uint8_t *)&v12, 0x16u);
  }

  scheduler = self->_scheduler;
  id v9 = [(HDRestorableAlarm *)self clientIdentifier];
  uint64_t v10 = [(HDRestorableAlarmSchedulerProtocol *)scheduler replaceAllScheduledEventsWithClientIdentifier:v9 newEvents:v6 error:a4];

  os_unfair_lock_lock(&self->_lock);
  [(NSMutableSet *)self->_outstandingEventIdentifiers removeAllObjects];
  os_unfair_lock_unlock(&self->_lock);

  return v10;
}

- (BOOL)removeAllEventsWithError:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v5 = HKLogInfrastructure();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    uint64_t v11 = self;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing all scheduled events", (uint8_t *)&v10, 0xCu);
  }

  scheduler = self->_scheduler;
  v7 = [(HDRestorableAlarm *)self clientIdentifier];
  char v8 = [(HDRestorableAlarmSchedulerProtocol *)scheduler removeAllEventsWithClientIdentifier:v7 error:a3];

  os_unfair_lock_lock(&self->_lock);
  [(NSMutableSet *)self->_outstandingEventIdentifiers removeAllObjects];
  os_unfair_lock_unlock(&self->_lock);
  return v8;
}

- (void)checkForDueEventsWithCompletion:(id)a3
{
  id v4 = a3;
  scheduler = self->_scheduler;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__HDRestorableAlarm_checkForDueEventsWithCompletion___block_invoke;
  v7[3] = &unk_1E63088B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HDRestorableAlarmSchedulerProtocol *)scheduler checkForDueEventsImmediatelyWithCompletion:v7];
}

void __53__HDRestorableAlarm_checkForDueEventsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v6 = a4;
  v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__HDRestorableAlarm_checkForDueEventsWithCompletion___block_invoke_2;
  v11[3] = &unk_1E6305FC8;
  id v8 = *(id *)(a1 + 40);
  id v12 = v6;
  id v13 = v8;
  uint64_t v9 = *(void *)(a1 + 32);
  char v14 = a3;
  v11[4] = v9;
  id v10 = v6;
  dispatch_async(v7, v11);
}

uint64_t __53__HDRestorableAlarm_checkForDueEventsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
}

- (void)eventsDidFire:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  os_unfair_lock_lock(&self->_lock);
  v21 = _Block_copy(self->_eventsHandler);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        outstandingEventIdentifiers = self->_outstandingEventIdentifiers;
        id v13 = [v11 eventIdentifier];
        LODWORD(outstandingEventIdentifiers) = [(NSMutableSet *)outstandingEventIdentifiers containsObject:v13];

        if (outstandingEventIdentifiers)
        {
          _HKInitializeLogging();
          char v14 = HKLogInfrastructure();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = [v11 eventIdentifier];
            *(_DWORD *)buf = 138543618;
            v30 = self;
            __int16 v31 = 2114;
            v32 = v15;
            _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping notification for in-flight event %{public}@", buf, 0x16u);
          }
        }
        else
        {
          uint64_t v16 = self->_outstandingEventIdentifiers;
          long long v17 = [v11 eventIdentifier];
          [(NSMutableSet *)v16 addObject:v17];

          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_lock);
  if ([v5 count])
  {
    if (!v21)
    {
      long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, self, @"HDRestorableAlarm.m", 210, @"Invalid parameter not satisfying: %@", @"eventsHandler != nil" object file lineNumber description];
    }
    eventHandlerQueue = self->_eventHandlerQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__HDRestorableAlarm_eventsDidFire___block_invoke;
    block[3] = &unk_1E62F61D0;
    id v24 = v21;
    block[4] = self;
    id v23 = v5;
    dispatch_async(eventHandlerQueue, block);
  }
}

uint64_t __35__HDRestorableAlarm_eventsDidFire___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)diagnosticDescription
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = [(HDRestorableAlarm *)self description];
  [v4 addObject:v5];

  os_unfair_lock_lock(p_lock);
  [v4 addObject:@"\tOutstanding event identifiers:"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_outstandingEventIdentifiers;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [NSString stringWithFormat:@"\t\t%@", *(void *)(*((void *)&v14 + 1) + 8 * i)];
        [v4 addObject:v11];
      }
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_lock);
  id v12 = [v4 componentsJoinedByString:@"\n"];

  return v12;
}

- (HDXPCAlarm)systemScheduler
{
  return (HDXPCAlarm *)[(HDRestorableAlarmSchedulerProtocol *)self->_scheduler systemScheduler];
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (OS_dispatch_queue)eventHandlerQueue
{
  return self->_eventHandlerQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_outstandingEventIdentifiers, 0);
  objc_storeStrong(&self->_eventsHandler, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);

  objc_storeStrong((id *)&self->_eventHandlerQueue, 0);
}

@end