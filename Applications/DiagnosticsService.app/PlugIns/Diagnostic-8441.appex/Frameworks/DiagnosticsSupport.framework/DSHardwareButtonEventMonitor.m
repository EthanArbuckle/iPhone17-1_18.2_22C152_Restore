@interface DSHardwareButtonEventMonitor
- (BOOL)_triggerHandlers:(id)a3 event:(unint64_t)a4;
- (BOOL)allowEvents;
- (BOOL)hasTarget:(id)a3;
- (DSHardwareButtonEventMonitor)init;
- (DSTestAutomation)testAutomation;
- (NSLock)eventHandlerChangeLock;
- (NSMutableSet)buttonEventHandlers;
- (OS_dispatch_queue)buttonEventQueue;
- (OS_dispatch_queue)systemClientCreationQueue;
- (OS_dispatch_queue)targetQueue;
- (id)_handlersForEvent:(unint64_t)a3;
- (id)_handlersForTarget:(id)a3;
- (void)addTarget:(id)a3 action:(SEL)a4 forButtonEvents:(unint64_t)a5 propagate:(BOOL)a6;
- (void)removeTarget:(id)a3;
- (void)removeTarget:(id)a3 action:(SEL)a4 forButtonEvents:(unint64_t)a5 propagate:(BOOL)a6;
- (void)setAllowEvents:(BOOL)a3;
- (void)setButtonEventHandlers:(id)a3;
- (void)setButtonEventQueue:(id)a3;
- (void)setEventHandlerChangeLock:(id)a3;
- (void)setSystemClientCreationQueue:(id)a3;
- (void)setTargetQueue:(id)a3;
- (void)setTestAutomation:(id)a3;
- (void)startWithPriority:(int64_t)a3 completion:(id)a4;
- (void)stopWithCompletion:(id)a3;
@end

@implementation DSHardwareButtonEventMonitor

- (DSHardwareButtonEventMonitor)init
{
  if (+[DSEntitlementUtilities currentProcessHasEntitlement:@"com.apple.DiagnosticsSupport.HardwareButtonAccess"])
  {
    v17.receiver = self;
    v17.super_class = (Class)DSHardwareButtonEventMonitor;
    v3 = [(DSHardwareButtonEventMonitor *)&v17 init];
    v4 = v3;
    if (v3)
    {
      v3->_allowEvents = 1;
      uint64_t v5 = +[NSMutableSet set];
      buttonEventHandlers = v4->_buttonEventHandlers;
      v4->_buttonEventHandlers = (NSMutableSet *)v5;

      v7 = (NSLock *)objc_alloc_init((Class)NSLock);
      eventHandlerChangeLock = v4->_eventHandlerChangeLock;
      v4->_eventHandlerChangeLock = v7;

      uint64_t v9 = +[DSTestAutomation sharedInstance];
      testAutomation = v4->_testAutomation;
      v4->_testAutomation = (DSTestAutomation *)v9;

      dispatch_queue_t v11 = dispatch_queue_create("com.apple.DiagnosticsSupport.buttonEventMonitor.targetQueue", 0);
      targetQueue = v4->_targetQueue;
      v4->_targetQueue = (OS_dispatch_queue *)v11;

      dispatch_queue_t v13 = dispatch_queue_create("com.apple.DiagnosticsSupport.buttonEventMonitor.systemClientCreationQueue", 0);
      systemClientCreationQueue = v4->_systemClientCreationQueue;
      v4->_systemClientCreationQueue = (OS_dispatch_queue *)v13;
    }
    self = v4;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)startWithPriority:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  v7 = [(DSHardwareButtonEventMonitor *)self systemClientCreationQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __61__DSHardwareButtonEventMonitor_startWithPriority_completion___block_invoke;
  v9[3] = &unk_18328;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __61__DSHardwareButtonEventMonitor_startWithPriority_completion___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && !WeakRetained[1])
  {
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.DiagnosticsSupport.buttonEventMonitor.buttonEventQueue", v4);
    id v6 = (void *)v3[6];
    v3[6] = v5;

    v3[1] = IOHIDEventSystemClientCreateWithType();
    v14[0] = @"PrimaryUsagePage";
    v14[1] = @"PrimaryUsage";
    v15[0] = &off_1EEF8;
    v15[1] = &off_1EF10;
    v7 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    v12[0] = @"PrimaryUsagePage";
    v12[1] = @"PrimaryUsage";
    v13[0] = &off_1EF28;
    v13[1] = &off_1EF40;
    id v8 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    v11[0] = v7;
    v11[1] = v8;
    uint64_t v9 = +[NSArray arrayWithObjects:v11 count:2];
    IOHIDEventSystemClientSetMatchingMultiple();

    IOHIDEventSystemClientScheduleWithDispatchQueue();
    IOHIDEventSystemClientRegisterEventFilterCallbackWithPriority();
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
}

- (void)stopWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_queue_t v5 = [(DSHardwareButtonEventMonitor *)self systemClientCreationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __51__DSHardwareButtonEventMonitor_stopWithCompletion___block_invoke;
  block[3] = &unk_18378;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__DSHardwareButtonEventMonitor_stopWithCompletion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_queue_t v5 = WeakRetained[6];
    if (v5)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __51__DSHardwareButtonEventMonitor_stopWithCompletion___block_invoke_2;
      block[3] = &unk_18350;
      objc_copyWeak(&v8, v2);
      dispatch_sync(v5, block);
      objc_destroyWeak(&v8);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

uint64_t __51__DSHardwareButtonEventMonitor_stopWithCompletion___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[1])
  {
    v3 = WeakRetained;
    IOHIDEventSystemClientUnscheduleFromDispatchQueue();
    IOHIDEventSystemClientUnregisterEventFilterCallback();
    CFRelease((CFTypeRef)v3[1]);
    v3[1] = 0;
  }

  return _objc_release_x2();
}

- (void)addTarget:(id)a3 action:(SEL)a4 forButtonEvents:(unint64_t)a5 propagate:(BOOL)a6
{
  id v10 = a3;
  dispatch_queue_t v11 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __75__DSHardwareButtonEventMonitor_addTarget_action_forButtonEvents_propagate___block_invoke;
  block[3] = &unk_183A0;
  BOOL v18 = a6;
  SEL v16 = a4;
  unint64_t v17 = a5;
  id v14 = v10;
  v15 = self;
  id v12 = v10;
  dispatch_async(v11, block);
}

void __75__DSHardwareButtonEventMonitor_addTarget_action_forButtonEvents_propagate___block_invoke(uint64_t a1)
{
  dispatch_queue_t v5 = objc_alloc_init(DSHardwareButtonEventHandler);
  [(DSHardwareButtonEventHandler *)v5 setTarget:*(void *)(a1 + 32)];
  [(DSHardwareButtonEventHandler *)v5 setAction:*(void *)(a1 + 48)];
  [(DSHardwareButtonEventHandler *)v5 setPreventPropagation:*(unsigned char *)(a1 + 64) == 0];
  [(DSHardwareButtonEventHandler *)v5 setEvents:*(void *)(a1 + 56)];
  v2 = [*(id *)(a1 + 40) eventHandlerChangeLock];
  [v2 lock];

  v3 = [*(id *)(a1 + 40) buttonEventHandlers];
  [v3 addObject:v5];

  id v4 = [*(id *)(a1 + 40) eventHandlerChangeLock];
  [v4 unlock];
}

- (void)removeTarget:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __45__DSHardwareButtonEventMonitor_removeTarget___block_invoke;
  v7[3] = &unk_183C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __45__DSHardwareButtonEventMonitor_removeTarget___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _handlersForTarget:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) eventHandlerChangeLock];
  [v2 lock];

  v3 = [*(id *)(a1 + 32) buttonEventHandlers];
  [v3 minusSet:v5];

  id v4 = [*(id *)(a1 + 32) eventHandlerChangeLock];
  [v4 unlock];
}

- (void)removeTarget:(id)a3 action:(SEL)a4 forButtonEvents:(unint64_t)a5 propagate:(BOOL)a6
{
  id v10 = a3;
  dispatch_queue_t v11 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __78__DSHardwareButtonEventMonitor_removeTarget_action_forButtonEvents_propagate___block_invoke;
  block[3] = &unk_183A0;
  BOOL v18 = a6;
  SEL v16 = a4;
  unint64_t v17 = a5;
  id v14 = v10;
  v15 = self;
  id v12 = v10;
  dispatch_async(v11, block);
}

void __78__DSHardwareButtonEventMonitor_removeTarget_action_forButtonEvents_propagate___block_invoke(uint64_t a1)
{
  id v5 = objc_alloc_init(DSHardwareButtonEventHandler);
  [(DSHardwareButtonEventHandler *)v5 setTarget:*(void *)(a1 + 32)];
  [(DSHardwareButtonEventHandler *)v5 setAction:*(void *)(a1 + 48)];
  [(DSHardwareButtonEventHandler *)v5 setPreventPropagation:*(unsigned char *)(a1 + 64) == 0];
  [(DSHardwareButtonEventHandler *)v5 setEvents:*(void *)(a1 + 56)];
  v2 = [*(id *)(a1 + 40) eventHandlerChangeLock];
  [v2 lock];

  v3 = [*(id *)(a1 + 40) buttonEventHandlers];
  [v3 removeObject:v5];

  id v4 = [*(id *)(a1 + 40) eventHandlerChangeLock];
  [v4 unlock];
}

- (BOOL)hasTarget:(id)a3
{
  v3 = [(DSHardwareButtonEventMonitor *)self _handlersForTarget:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)_handlersForTarget:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  id v6 = [(DSHardwareButtonEventMonitor *)self eventHandlerChangeLock];
  [v6 lock];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v7 = [(DSHardwareButtonEventMonitor *)self buttonEventHandlers];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = [v12 target];

        if (v13 == v4) {
          [v5 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v14 = [(DSHardwareButtonEventMonitor *)self eventHandlerChangeLock];
  [v14 unlock];

  return v5;
}

- (id)_handlersForEvent:(unint64_t)a3
{
  id v5 = +[NSMutableSet set];
  id v6 = [(DSHardwareButtonEventMonitor *)self eventHandlerChangeLock];
  [v6 lock];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = [(DSHardwareButtonEventMonitor *)self buttonEventHandlers];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (((unint64_t)[v12 events] & a3) != 0) {
          [v5 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  id v13 = [(DSHardwareButtonEventMonitor *)self eventHandlerChangeLock];
  [v13 unlock];

  return v5;
}

- (BOOL)_triggerHandlers:(id)a3 event:(unint64_t)a4
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = a3;
  id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    unsigned __int8 v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(obj);
        }
        dispatch_queue_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [(DSHardwareButtonEventMonitor *)self targetQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __55__DSHardwareButtonEventMonitor__triggerHandlers_event___block_invoke;
        block[3] = &unk_183F0;
        void block[4] = v11;
        block[5] = a4;
        dispatch_async(v12, block);

        if (v8) {
          unsigned __int8 v8 = 1;
        }
        else {
          unsigned __int8 v8 = [v11 preventPropagation];
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

void __55__DSHardwareButtonEventMonitor__triggerHandlers_event___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) target];
  v3 = (void (*)(id, id, void))[v2 methodForSelector:[*(id *)(a1 + 32) action]];

  id v4 = [*(id *)(a1 + 32) target];
  v3(v4, [*(id *)(a1 + 32) action], *(void *)(a1 + 40));
}

- (NSMutableSet)buttonEventHandlers
{
  return self->_buttonEventHandlers;
}

- (void)setButtonEventHandlers:(id)a3
{
}

- (BOOL)allowEvents
{
  return self->_allowEvents;
}

- (void)setAllowEvents:(BOOL)a3
{
  self->_allowEvents = a3;
}

- (NSLock)eventHandlerChangeLock
{
  return self->_eventHandlerChangeLock;
}

- (void)setEventHandlerChangeLock:(id)a3
{
}

- (DSTestAutomation)testAutomation
{
  return self->_testAutomation;
}

- (void)setTestAutomation:(id)a3
{
}

- (OS_dispatch_queue)buttonEventQueue
{
  return self->_buttonEventQueue;
}

- (void)setButtonEventQueue:(id)a3
{
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (void)setTargetQueue:(id)a3
{
}

- (OS_dispatch_queue)systemClientCreationQueue
{
  return self->_systemClientCreationQueue;
}

- (void)setSystemClientCreationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemClientCreationQueue, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_buttonEventQueue, 0);
  objc_storeStrong((id *)&self->_testAutomation, 0);
  objc_storeStrong((id *)&self->_eventHandlerChangeLock, 0);

  objc_storeStrong((id *)&self->_buttonEventHandlers, 0);
}

@end