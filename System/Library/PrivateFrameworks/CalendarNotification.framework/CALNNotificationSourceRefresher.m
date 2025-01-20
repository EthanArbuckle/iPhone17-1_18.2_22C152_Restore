@interface CALNNotificationSourceRefresher
- (CALNInboxNotificationMonitor)inboxNotificationMonitor;
- (CALNNotificationManager)notificationManager;
- (CALNNotificationSource)sources;
- (CALNNotificationSourceRefresher)initWithSources:(id)a3 notificationMonitor:(id)a4 notificationManager:(id)a5;
- (void)_refreshNotifications:(id)a3;
- (void)_withdrawExpiredNotificationsForSource:(id)a3;
- (void)handleNotificationsChangedNotification:(id)a3;
- (void)handleNotificationsLoadedNotification;
- (void)refreshNotifications;
@end

@implementation CALNNotificationSourceRefresher

- (CALNNotificationSourceRefresher)initWithSources:(id)a3 notificationMonitor:(id)a4 notificationManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CALNNotificationSourceRefresher;
  v11 = [(CALNNotificationSourceRefresher *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    sources = v11->_sources;
    v11->_sources = (CALNNotificationSource *)v12;

    objc_storeStrong((id *)&v11->_inboxNotificationMonitor, a4);
    objc_storeStrong((id *)&v11->_notificationManager, a5);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.calendar.notification.NotificationSourceRefresher", 0);
    refreshQueue = v11->_refreshQueue;
    v11->_refreshQueue = (OS_dispatch_queue *)v14;

    [v9 addNotificationsChangedObserver:v11 selector:sel_handleNotificationsChangedNotification_];
    [v9 addNotificationsLoadedObserver:v11 selector:sel_handleNotificationsLoadedNotification];
  }

  return v11;
}

- (void)handleNotificationsLoadedNotification
{
  refreshQueue = self->_refreshQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__CALNNotificationSourceRefresher_handleNotificationsLoadedNotification__block_invoke;
  block[3] = &unk_2645C0D98;
  block[4] = self;
  dispatch_sync(refreshQueue, block);
}

void __72__CALNNotificationSourceRefresher_handleNotificationsLoadedNotification__block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
  v3 = +[CALNLogSubsystem defaultCategory];
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Refreshing notifications in response to notifications loaded callback.", buf, 2u);
    }

    [*(id *)(a1 + 32) _refreshNotifications:0];
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Not refreshing notifications in response to notifications loaded callback because there is no need to do so.", v5, 2u);
    }
  }
}

- (void)handleNotificationsChangedNotification:(id)a3
{
  id v4 = a3;
  v5 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, "Received notification changed callback.", buf, 2u);
  }

  v6 = [v4 userInfo];

  v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F04C30]];

  if (v7)
  {
    id v8 = [v7 valueForKey:@"stringRepresentation"];
    id v9 = [MEMORY[0x263EFFA08] setWithArray:v8];
  }
  else
  {
    id v9 = 0;
  }
  refreshQueue = self->_refreshQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__CALNNotificationSourceRefresher_handleNotificationsChangedNotification___block_invoke;
  v12[3] = &unk_2645C0DC0;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  dispatch_sync(refreshQueue, v12);
}

uint64_t __74__CALNNotificationSourceRefresher_handleNotificationsChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshNotifications:*(void *)(a1 + 40)];
}

- (void)refreshNotifications
{
  refreshQueue = self->_refreshQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CALNNotificationSourceRefresher_refreshNotifications__block_invoke;
  block[3] = &unk_2645C0D98;
  block[4] = self;
  dispatch_sync(refreshQueue, block);
}

uint64_t __55__CALNNotificationSourceRefresher_refreshNotifications__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshNotifications:0];
}

- (void)_refreshNotifications:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_refreshQueue);
  v5 = [(CALNInboxNotificationMonitor *)self->_inboxNotificationMonitor eventNotificationReferences];

  if (v5)
  {
    self->_needsRefreshOnNotificationsLoaded = 0;
    v6 = +[CALNLogSubsystem defaultCategory];
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v7)
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v4;
        id v8 = "Refreshing notifications affected by changes to objects %@.";
        id v9 = v6;
        uint32_t v10 = 12;
LABEL_10:
        _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
    else if (v7)
    {
      *(_WORD *)buf = 0;
      id v8 = "Refreshing all notifications.";
      id v9 = v6;
      uint32_t v10 = 2;
      goto LABEL_10;
    }

    [(CALNNotificationSourceRefresher *)self sources];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_super v17 = *(void **)(*((void *)&v20 + 1) + 8 * v16);
          v18 = (void *)MEMORY[0x223C88D10](v13);
          -[CALNNotificationSourceRefresher _withdrawExpiredNotificationsForSource:](self, "_withdrawExpiredNotificationsForSource:", v17, (void)v20);
          [v17 refreshNotifications:v4];
          ++v16;
        }
        while (v14 != v16);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        uint64_t v14 = v13;
      }
      while (v13);
    }

    v19 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2216BB000, v19, OS_LOG_TYPE_DEFAULT, "Finished refreshing notifications.", buf, 2u);
    }

    goto LABEL_21;
  }
  id v11 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, "Blocking refresh of notifications because event notifications haven't finished loading yet.", buf, 2u);
  }

  self->_needsRefreshOnNotificationsLoaded = 1;
LABEL_21:
}

- (void)_withdrawExpiredNotificationsForSource:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = [a3 sourceIdentifier];
  v5 = [(CALNNotificationSourceRefresher *)self notificationManager];
  v6 = [v5 fetchRecordsWithSourceIdentifier:v4];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v22;
    *(void *)&long long v9 = 138543618;
    long long v20 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "content", v20, (void)v21);
        uint64_t v15 = [v14 expirationDate];

        if (v15)
        {
          [v15 timeIntervalSinceNow];
          if (v16 <= 0.0)
          {
            objc_super v17 = [v13 sourceClientIdentifier];
            v18 = +[CALNLogSubsystem defaultCategory];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v20;
              id v26 = v4;
              __int16 v27 = 2114;
              v28 = v17;
              _os_log_impl(&dword_2216BB000, v18, OS_LOG_TYPE_DEFAULT, "Withdrawing expired notification with sourceIdentifier %{public}@ and sourceClientIdentifier %{public}@", buf, 0x16u);
            }

            v19 = [(CALNNotificationSourceRefresher *)self notificationManager];
            [v19 removeRecordWithSourceIdentifier:v4 sourceClientIdentifier:v17];
          }
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v10);
  }
}

- (CALNNotificationSource)sources
{
  return self->_sources;
}

- (CALNInboxNotificationMonitor)inboxNotificationMonitor
{
  return self->_inboxNotificationMonitor;
}

- (CALNNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_inboxNotificationMonitor, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_refreshQueue, 0);
}

@end