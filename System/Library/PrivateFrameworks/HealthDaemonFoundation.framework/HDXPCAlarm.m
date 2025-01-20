@interface HDXPCAlarm
- (HDXPCAlarm)initWithProfileIdentifier:(id)a3 scheduler:(id)a4 eventName:(id)a5 eventHandlerQueue:(id)a6;
- (HDXPCAlarm)initWithScheduler:(id)a3 eventName:(id)a4 eventHandlerQueue:(id)a5;
- (HDXPCAlarmScheduler)scheduler;
- (NSString)eventName;
- (OS_dispatch_queue)eventHandlerQueue;
- (id)description;
- (id)eventHandler;
- (id)unitTest_schedulerObserver;
- (void)beginReceivingEventsWithHandler:(id)a3;
- (void)eventDidFire:(id)a3;
- (void)invalidate;
- (void)setEventHandler:(id)a3;
- (void)setNextFireDate:(id)a3 isUserVisible:(BOOL)a4;
- (void)setUnitTest_schedulerObserver:(id)a3;
- (void)unitTest_fireEventImmediatelyWithDate:(id)a3 isUserVisible:(BOOL)a4;
- (void)unschedule;
@end

@implementation HDXPCAlarm

- (HDXPCAlarm)initWithScheduler:(id)a3 eventName:(id)a4 eventHandlerQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDXPCAlarm;
  v12 = [(HDXPCAlarm *)&v17 init];
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

- (HDXPCAlarm)initWithProfileIdentifier:(id)a3 scheduler:(id)a4 eventName:(id)a5 eventHandlerQueue:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v12 = NSString;
  id v13 = a5;
  uint64_t v14 = [a3 identifier];
  v15 = [v12 stringWithFormat:@"%@ for HDProfile:%@", v13, v14];

  if ((unint64_t)[v15 length] >= 0x81)
  {
    uint64_t v16 = objc_msgSend(v15, "substringWithRange:", 0, 128);

    v15 = (void *)v16;
  }
  objc_super v17 = [(HDXPCAlarm *)self initWithScheduler:v10 eventName:v15 eventHandlerQueue:v11];

  return v17;
}

- (void)beginReceivingEventsWithHandler:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_eventHandler)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HDXPCAlarm.m", 66, @"Invalid parameter not satisfying: %@", @"_eventHandler == nil" object file lineNumber description];
  }
  v5 = (void *)[v8 copy];
  id eventHandler = self->_eventHandler;
  self->_id eventHandler = v5;

  os_unfair_lock_unlock(&self->_lock);
  [(HDXPCAlarmScheduler *)self->_scheduler addAlarm:self];
}

- (void)invalidate
{
  [(HDXPCAlarmScheduler *)self->_scheduler removeAlarm:self];
  os_unfair_lock_lock(&self->_lock);
  id eventHandler = self->_eventHandler;
  self->_id eventHandler = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setNextFireDate:(id)a3 isUserVisible:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  v6 = [HDXPCAlarmEvent alloc];
  v7 = [(HDXPCAlarm *)self eventName];
  id v8 = [(HDXPCAlarmEvent *)v6 initWithName:v7 fireDate:v12 isUserVisible:v4];

  id v9 = [(HDXPCAlarm *)self scheduler];
  [v9 scheduleEvent:v8];

  id v10 = [(HDXPCAlarm *)self unitTest_schedulerObserver];

  if (v10)
  {
    id v11 = [(HDXPCAlarm *)self unitTest_schedulerObserver];
    ((void (**)(void, id, BOOL))v11)[2](v11, v12, v4);
  }
}

- (void)unschedule
{
  v3 = [(HDXPCAlarm *)self scheduler];
  BOOL v4 = [(HDXPCAlarm *)self eventName];
  [v3 unscheduleEventWithName:v4];

  v5 = [(HDXPCAlarm *)self unitTest_schedulerObserver];

  if (v5)
  {
    id v6 = [(HDXPCAlarm *)self unitTest_schedulerObserver];
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
  id v6 = [(HDXPCAlarm *)self eventHandler];
  os_unfair_lock_unlock(&self->_lock);
  if (!v6)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HDXPCAlarm.m", 113, @"Invalid parameter not satisfying: %@", @"eventHandler" object file lineNumber description];
  }
  v7 = [(HDXPCAlarm *)self eventHandlerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__HDXPCAlarm_eventDidFire___block_invoke;
  block[3] = &unk_2643D4638;
  id v12 = v5;
  id v13 = v6;
  block[4] = self;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

void __27__HDXPCAlarm_eventDidFire___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 40) fireDate];
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v3 + 16))(v3, v2, v4, [*(id *)(a1 + 40) isUserVisible]);
}

- (void)unitTest_fireEventImmediatelyWithDate:(id)a3 isUserVisible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [HDXPCAlarmEvent alloc];
  id v8 = [(HDXPCAlarm *)self eventName];
  id v10 = [(HDXPCAlarmEvent *)v7 initWithName:v8 fireDate:v6 isUserVisible:v4];

  id v9 = [(HDXPCAlarm *)self scheduler];
  objc_msgSend(v9, "unittest_fireEvent:", v10);
}

- (NSString)eventName
{
  return self->_eventName;
}

- (HDXPCAlarmScheduler)scheduler
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
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_eventHandlerQueue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);

  objc_storeStrong((id *)&self->_eventName, 0);
}

@end