@interface EFXPCAlarm
- (EFXPCAlarm)initWithScheduler:(id)a3 eventName:(id)a4 eventHandlerQueue:(id)a5;
- (EFXPCAlarmScheduler)scheduler;
- (NSString)eventName;
- (OS_dispatch_queue)eventHandlerQueue;
- (id)description;
- (id)eventHandler;
- (id)test_schedulerObserver;
- (void)beginReceivingEventsWithHandler:(id)a3;
- (void)eventDidFire:(id)a3;
- (void)invalidate;
- (void)setEventHandler:(id)a3;
- (void)setNextFireDate:(id)a3 isUserVisible:(BOOL)a4;
- (void)setTest_schedulerObserver:(id)a3;
- (void)test_fireEventImmediatelyWithDate:(id)a3 isUserVisible:(BOOL)a4;
- (void)unschedule;
@end

@implementation EFXPCAlarm

- (EFXPCAlarm)initWithScheduler:(id)a3 eventName:(id)a4 eventHandlerQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)EFXPCAlarm;
  v12 = [(EFXPCAlarm *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_scheduler, a3);
    uint64_t v14 = [v10 copy];
    eventName = v13->_eventName;
    v13->_eventName = (NSString *)v14;

    objc_storeStrong((id *)&v13->_eventHandlerQueue, a5);
    v13->_lock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

- (void)beginReceivingEventsWithHandler:(id)a3
{
  id v9 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = v9;
  if (self->_eventHandler)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"EFXPCAlarm.m", 44, @"Invalid parameter not satisfying: %@", @"_eventHandler == nil" object file lineNumber description];

    v5 = v9;
  }
  v6 = (void *)[v5 copy];
  id eventHandler = self->_eventHandler;
  self->_id eventHandler = v6;

  os_unfair_lock_unlock(&self->_lock);
  [(EFXPCAlarmScheduler *)self->_scheduler addAlarm:self];
}

- (void)invalidate
{
  [(EFXPCAlarmScheduler *)self->_scheduler removeAlarm:self];
  os_unfair_lock_lock(&self->_lock);
  id eventHandler = self->_eventHandler;
  self->_id eventHandler = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setNextFireDate:(id)a3 isUserVisible:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  if (v12)
  {
    v6 = [EFXPCAlarmEvent alloc];
    v7 = [(EFXPCAlarm *)self eventName];
    v8 = [(EFXPCAlarmEvent *)v6 initWithName:v7 fireDate:v12 isUserVisible:v4];

    id v9 = [(EFXPCAlarm *)self scheduler];
    [v9 scheduleEvent:v8];

    id v10 = [(EFXPCAlarm *)self test_schedulerObserver];

    if (v10)
    {
      id v11 = [(EFXPCAlarm *)self test_schedulerObserver];
      ((void (**)(void, id, BOOL))v11)[2](v11, v12, v4);
    }
  }
  else
  {
    [(EFXPCAlarm *)self unschedule];
  }
}

- (void)unschedule
{
  id v5 = [(EFXPCAlarm *)self scheduler];
  v3 = [(EFXPCAlarm *)self eventName];
  [v5 unscheduleEventWithName:v3];

  BOOL v4 = [(EFXPCAlarm *)self test_schedulerObserver];

  if (v4)
  {
    id v6 = [(EFXPCAlarm *)self test_schedulerObserver];
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p eventName:%@>", objc_opt_class(), self, self->_eventName];
}

- (void)eventDidFire:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(EFXPCAlarm *)self eventHandler];
  os_unfair_lock_unlock(&self->_lock);
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"EFXPCAlarm.m", 94, @"Invalid parameter not satisfying: %@", @"eventHandler" object file lineNumber description];
  }
  v7 = [(EFXPCAlarm *)self eventHandlerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__EFXPCAlarm_eventDidFire___block_invoke;
  block[3] = &unk_1E61238D8;
  id v12 = v5;
  id v13 = v6;
  block[4] = self;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

void __27__EFXPCAlarm_eventDidFire___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 40) fireDate];
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v3 + 16))(v3, v2, v4, [*(id *)(a1 + 40) isUserVisible]);
}

- (void)test_fireEventImmediatelyWithDate:(id)a3 isUserVisible:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v6 = [EFXPCAlarmEvent alloc];
  v7 = [(EFXPCAlarm *)self eventName];
  id v8 = [(EFXPCAlarmEvent *)v6 initWithName:v7 fireDate:v10 isUserVisible:v4];

  id v9 = [(EFXPCAlarm *)self scheduler];
  objc_msgSend(v9, "test_fireEvent:", v8);
}

- (NSString)eventName
{
  return self->_eventName;
}

- (EFXPCAlarmScheduler)scheduler
{
  return self->_scheduler;
}

- (OS_dispatch_queue)eventHandlerQueue
{
  return self->_eventHandlerQueue;
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
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
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_eventHandlerQueue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end