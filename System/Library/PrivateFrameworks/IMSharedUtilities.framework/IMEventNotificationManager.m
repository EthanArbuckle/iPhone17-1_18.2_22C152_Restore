@interface IMEventNotificationManager
- (BOOL)isBusy;
- (IMAutomaticEventNotificationQueue)notificationQueue;
- (IMEventListenerList)eventListeners;
- (IMEventNotificationManager)init;
- (NSMutableArray)registeredNotificationQueues;
- (double)eventTimeout;
- (id)createEventListenerForNotificationName:(id)a3 object:(id)a4;
- (int64_t)busyCount;
- (void)appendNotificationForEventHandler:(id)a3 eventNotificationBlock:(id)a4;
- (void)appendNotificationForEventHandler:(id)a3 sender:(id)a4 eventNotificationBlock:(id)a5;
- (void)cancelAllEventNotifications;
- (void)cancelEventNotificationsForEventHandler:(id)a3;
- (void)dealloc;
- (void)eventListenerDidFinish:(id)a3;
- (void)eventNotificationQueue:(id)a3 didChangeBusyState:(BOOL)a4;
- (void)pauseEventNotifications:(BOOL)a3;
- (void)pushNotificationForEventHandler:(id)a3 eventNotificationBlock:(id)a4;
- (void)pushNotificationForEventHandler:(id)a3 sender:(id)a4 eventNotificationBlock:(id)a5;
- (void)registerEventListener:(id)a3;
- (void)registerNotificationQueue:(id)a3;
- (void)setBusyCount:(int64_t)a3;
- (void)setEventTimeout:(double)a3;
@end

@implementation IMEventNotificationManager

- (void)registerNotificationQueue:(id)a3
{
  id v4 = a3;
  [v4 setDelegate:self];
  [(NSMutableArray *)self->_registeredNotificationQueues addObject:v4];
}

- (IMEventNotificationManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)IMEventNotificationManager;
  v2 = [(IMEventNotificationManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    registeredNotificationQueues = v2->_registeredNotificationQueues;
    v2->_registeredNotificationQueues = (NSMutableArray *)v3;

    v5 = objc_alloc_init(IMEventListenerList);
    eventListeners = v2->_eventListeners;
    v2->_eventListeners = v5;

    v2->_eventTimeout = 30.0;
    v7 = objc_alloc_init(IMAutomaticEventNotificationQueue);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = v7;

    [(IMEventNotificationManager *)v2 registerNotificationQueue:v2->_notificationQueue];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)IMEventNotificationManager;
  [(IMEventNotificationManager *)&v4 dealloc];
}

- (BOOL)isBusy
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(IMEventNotificationManager *)v2 busyCount] > 0
    || [(IMEventListenerList *)v2->_eventListeners count] != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)eventNotificationQueue:(id)a3 didChangeBusyState:(BOOL)a4
{
  [(IMEventNotificationManager *)self busyCount];

  MEMORY[0x1F4181798](self, sel_setBusyCount_);
}

- (void)eventListenerDidFinish:(id)a3
{
  id v5 = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  [(IMEventListenerList *)v4->_eventListeners removeObject:v5];
  objc_sync_exit(v4);
}

- (void)registerEventListener:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  [v4 timeout];
  if (v6 == 0.0) {
    [v4 setTimeout:v5->_eventTimeout];
  }
  [(IMEventListenerList *)v5->_eventListeners addObject:v4];
  id location = 0;
  objc_initWeak(&location, v5);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A07D2DB8;
  v7[3] = &unk_1E5A114D0;
  objc_copyWeak(&v8, &location);
  [v4 setDidInvokeCompletion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  objc_sync_exit(v5);
}

- (id)createEventListenerForNotificationName:(id)a3 object:(id)a4
{
  id v5 = +[IMNotificationCenterEventListener eventListenerForNotificationName:a3 object:0];
  [(IMEventNotificationManager *)self registerEventListener:v5];

  return v5;
}

- (void)cancelEventNotificationsForEventHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v6 = v5->_registeredNotificationQueues;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "cancelEventNotificationsForNotificationTarget:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)cancelAllEventNotifications
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  BOOL v3 = v2->_registeredNotificationQueues;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "cancelAllEventNotifications", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)pauseEventNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = self;
  objc_sync_enter(v4);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v5 = v4->_registeredNotificationQueues;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setPaused:", v3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

- (void)pushNotificationForEventHandler:(id)a3 eventNotificationBlock:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  [(IMEventNotificationQueue *)v7->_notificationQueue pushEventTarget:v8 eventNotificationBlock:v6];
  objc_sync_exit(v7);
}

- (void)appendNotificationForEventHandler:(id)a3 eventNotificationBlock:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  [(IMEventNotificationQueue *)v7->_notificationQueue appendEventTarget:v8 eventNotificationBlock:v6];
  objc_sync_exit(v7);
}

- (void)pushNotificationForEventHandler:(id)a3 sender:(id)a4 eventNotificationBlock:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = self;
  objc_sync_enter(v10);
  [(IMEventNotificationQueue *)v10->_notificationQueue pushEventTarget:v11 sender:v8 eventNotificationBlock:v9];
  objc_sync_exit(v10);
}

- (void)appendNotificationForEventHandler:(id)a3 sender:(id)a4 eventNotificationBlock:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = self;
  objc_sync_enter(v10);
  [(IMEventNotificationQueue *)v10->_notificationQueue appendEventTarget:v11 sender:v8 eventNotificationBlock:v9];
  objc_sync_exit(v10);
}

- (IMAutomaticEventNotificationQueue)notificationQueue
{
  return self->_notificationQueue;
}

- (double)eventTimeout
{
  return self->_eventTimeout;
}

- (void)setEventTimeout:(double)a3
{
  self->_eventTimeout = a3;
}

- (IMEventListenerList)eventListeners
{
  return self->_eventListeners;
}

- (NSMutableArray)registeredNotificationQueues
{
  return self->_registeredNotificationQueues;
}

- (int64_t)busyCount
{
  return self->_busyCount;
}

- (void)setBusyCount:(int64_t)a3
{
  self->_busyCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredNotificationQueues, 0);
  objc_storeStrong((id *)&self->_eventListeners, 0);

  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

@end