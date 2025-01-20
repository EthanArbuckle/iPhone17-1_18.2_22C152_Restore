@interface CALNInboxNotificationMonitor
- (BOOL)isActive;
- (CALNInboxNotificationMonitor)initWithEventStoreProvider:(id)a3;
- (NSArray)eventNotificationReferences;
- (_EKNotificationMonitor)notificationMonitor;
- (unint64_t)eventNotificationCount;
- (void)activate;
- (void)addNotificationCountChangedObserver:(id)a3 selector:(SEL)a4;
- (void)addNotificationsChangedObserver:(id)a3 selector:(SEL)a4;
- (void)addNotificationsLoadedObserver:(id)a3 selector:(SEL)a4;
- (void)deactivate;
- (void)receivedNotificationNamed:(id)a3;
- (void)removeNotificationCountChangedObserver:(id)a3 selector:(SEL)a4;
- (void)removeNotificationsChangedObserver:(id)a3;
- (void)removeNotificationsLoadedObserver:(id)a3 selector:(SEL)a4;
- (void)setActive:(BOOL)a3;
@end

@implementation CALNInboxNotificationMonitor

uint64_t __59__CALNInboxNotificationMonitor_initWithEventStoreProvider___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) eventStore];
}

- (void)receivedNotificationNamed:(id)a3
{
  id v4 = a3;
  if ([(CALNInboxNotificationMonitor *)self isActive])
  {
    v5 = [(CALNInboxNotificationMonitor *)self notificationMonitor];
    [v5 handleDarwinNotification:v4];

    v6 = [MEMORY[0x263F04B68] focusModeConfigurationChangedName];
    int v7 = [v4 isEqualToString:v6];

    if (v7)
    {
      v8 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v9 = *MEMORY[0x263F04C40];
      v10 = [(CALNInboxNotificationMonitor *)self notificationMonitor];
      [v8 postNotificationName:v9 object:v10];
    }
  }
  else
  {
    v11 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CALNInboxNotificationMonitor receivedNotificationNamed:]((uint64_t)v4, v11);
    }
  }
}

- (_EKNotificationMonitor)notificationMonitor
{
  return self->_notificationMonitor;
}

- (BOOL)isActive
{
  return self->_active;
}

- (CALNInboxNotificationMonitor)initWithEventStoreProvider:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CALNInboxNotificationMonitor;
  v5 = [(CALNInboxNotificationMonitor *)&v14 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F04C20]);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __59__CALNInboxNotificationMonitor_initWithEventStoreProvider___block_invoke;
    v12[3] = &unk_2645C10A8;
    id v13 = v4;
    uint64_t v7 = [v6 initWithOptions:54 eventStoreGetter:v12];
    notificationMonitor = v5->_notificationMonitor;
    v5->_notificationMonitor = (_EKNotificationMonitor *)v7;

    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.calendar.notification.InboxNotificationMonitorCallback", v9);
    [(_EKNotificationMonitor *)v5->_notificationMonitor setCallbackNotificationQueue:v10];
  }
  return v5;
}

- (void)addNotificationsChangedObserver:(id)a3 selector:(SEL)a4
{
  id v6 = (void *)MEMORY[0x263F08A00];
  id v7 = a3;
  id v10 = [v6 defaultCenter];
  uint64_t v8 = *MEMORY[0x263F04C40];
  uint64_t v9 = [(CALNInboxNotificationMonitor *)self notificationMonitor];
  [v10 addObserver:v7 selector:a4 name:v8 object:v9];
}

- (void)removeNotificationsChangedObserver:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  id v8 = [v4 defaultCenter];
  uint64_t v6 = *MEMORY[0x263F04C40];
  id v7 = [(CALNInboxNotificationMonitor *)self notificationMonitor];
  [v8 removeObserver:v5 name:v6 object:v7];
}

- (void)addNotificationCountChangedObserver:(id)a3 selector:(SEL)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F08A00];
  id v7 = a3;
  id v10 = [v6 defaultCenter];
  uint64_t v8 = *MEMORY[0x263F04C38];
  uint64_t v9 = [(CALNInboxNotificationMonitor *)self notificationMonitor];
  [v10 addObserver:v7 selector:a4 name:v8 object:v9];
}

- (void)removeNotificationCountChangedObserver:(id)a3 selector:(SEL)a4
{
  id v5 = (void *)MEMORY[0x263F08A00];
  id v6 = a3;
  id v9 = [v5 defaultCenter];
  uint64_t v7 = *MEMORY[0x263F04C38];
  uint64_t v8 = [(CALNInboxNotificationMonitor *)self notificationMonitor];
  [v9 removeObserver:v6 name:v7 object:v8];
}

- (void)addNotificationsLoadedObserver:(id)a3 selector:(SEL)a4
{
  id v6 = (void *)MEMORY[0x263F08A00];
  id v7 = a3;
  id v10 = [v6 defaultCenter];
  uint64_t v8 = *MEMORY[0x263F04C48];
  id v9 = [(CALNInboxNotificationMonitor *)self notificationMonitor];
  [v10 addObserver:v7 selector:a4 name:v8 object:v9];
}

- (void)removeNotificationsLoadedObserver:(id)a3 selector:(SEL)a4
{
  id v5 = (void *)MEMORY[0x263F08A00];
  id v6 = a3;
  id v9 = [v5 defaultCenter];
  uint64_t v7 = *MEMORY[0x263F04C48];
  uint64_t v8 = [(CALNInboxNotificationMonitor *)self notificationMonitor];
  [v9 removeObserver:v6 name:v7 object:v8];
}

- (NSArray)eventNotificationReferences
{
  v2 = [(CALNInboxNotificationMonitor *)self notificationMonitor];
  v3 = [v2 notificationReferences];

  return (NSArray *)v3;
}

- (unint64_t)eventNotificationCount
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F04B68] unselectedCalendarIdentifiersForFocusMode];
  uint64_t v4 = [v3 count];

  id v5 = [(CALNInboxNotificationMonitor *)self notificationMonitor];
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 notificationReferences];

    if ([v7 count])
    {
      uint64_t v8 = [v7 firstObject];
      uint64_t v9 = [v8 eventStore];

      v23 = (void *)v9;
      id v10 = [MEMORY[0x263F04B68] unselectedCalendarsForFocusModeInEventStore:v9];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      v24 = v7;
      id v11 = v7;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        unint64_t v14 = 0;
        uint64_t v15 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v11);
            }
            v17 = [*(id *)(*((void *)&v25 + 1) + 8 * i) notification];
            v18 = v17;
            if (v17)
            {
              if (objc_msgSend(v17, "cuik_shouldShowNotificationWithUnselectedCalendarsForFocus:", v10))
              {
                ++v14;
              }
              else
              {
                v19 = +[CALNLogSubsystem calendar];
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  v20 = [v18 objectID];
                  *(_DWORD *)buf = 138543362;
                  v30 = v20;
                  _os_log_impl(&dword_2216BB000, v19, OS_LOG_TYPE_INFO, "Notification with objectID %{public}@ has a calendar that is hidden by focus. Not including in the badge count", buf, 0xCu);
                }
              }
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v31 count:16];
        }
        while (v13);
      }
      else
      {
        unint64_t v14 = 0;
      }

      uint64_t v7 = v24;
    }
    else
    {
      unint64_t v14 = 0;
    }

    return v14;
  }
  else
  {
    unint64_t v21 = [v5 notificationCount];

    return v21;
  }
}

- (void)activate
{
  v3 = [(CALNInboxNotificationMonitor *)self notificationMonitor];
  [v3 start];

  [(CALNInboxNotificationMonitor *)self setActive:1];
}

- (void)deactivate
{
  [(CALNInboxNotificationMonitor *)self setActive:0];
  id v3 = [(CALNInboxNotificationMonitor *)self notificationMonitor];
  [v3 stop];
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
}

- (void)receivedNotificationNamed:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Received notification but inbox notification monitor is not active. notification name = %{public}@", (uint8_t *)&v2, 0xCu);
}

@end