@interface CNContactsDaemon
- (CNContactsDaemon)init;
- (NSArray)XPCActivities;
- (NSArray)XPCListenerPairs;
- (NSArray)XPCServices;
- (NSArray)activeBackgroundSystemTasks;
- (NSArray)activeXPCListenerPairs;
- (NSArray)activeXPCServices;
- (NSArray)applicationUnregisteredListeners;
- (NSArray)backgroundSystemTasks;
- (NSArray)notifydListeners;
- (OS_dispatch_queue)notificationQueue;
- (id)_notifydListenersByName;
- (void)registerBackgroundSystemTasks;
- (void)registerXPCActivities;
- (void)runOnRunLoop:(id)a3;
- (void)setActiveBackgroundSystemTasks:(id)a3;
- (void)setActiveXPCListenerPairs:(id)a3;
- (void)setActiveXPCServices:(id)a3;
- (void)setNotificationQueue:(id)a3;
- (void)subscribeApplicationUnregisteredListeners;
- (void)subscribeNotifydListeners;
- (void)wakeXPCListeners;
- (void)wakeXPCServices;
@end

@implementation CNContactsDaemon

- (CNContactsDaemon)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNContactsDaemon;
  v2 = [(CNContactsDaemon *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.contacts.contactsd.notificationqueue", 0);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (NSArray)XPCListenerPairs
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)XPCServices
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)notifydListeners
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)applicationUnregisteredListeners
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)XPCActivities
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)backgroundSystemTasks
{
  return (NSArray *)&__NSArray0__struct;
}

- (void)runOnRunLoop:(id)a3
{
  id v8 = a3;
  [(CNContactsDaemon *)self wakeXPCListeners];
  [(CNContactsDaemon *)self wakeXPCServices];
  [(CNContactsDaemon *)self subscribeNotifydListeners];
  [(CNContactsDaemon *)self subscribeApplicationUnregisteredListeners];
  [(CNContactsDaemon *)self registerXPCActivities];
  [(CNContactsDaemon *)self registerBackgroundSystemTasks];
  v4 = +[CNEnvironment currentEnvironment];
  v5 = [v4 featureFlags];
  unsigned int v6 = [v5 isFeatureEnabled:9];

  if (v6) {
    id v7 = +[CNDLimitedAccessSyncService sharedInstance];
  }
  [v8 run];
}

- (void)wakeXPCListeners
{
  id v3 = [(CNContactsDaemon *)self XPCListenerPairs];
  objc_msgSend(v3, "_cn_each:", &stru_100024F78);
  [(CNContactsDaemon *)self setActiveXPCListenerPairs:v3];
}

- (void)wakeXPCServices
{
  id v3 = [(CNContactsDaemon *)self XPCServices];
  objc_msgSend(v3, "_cn_filter:", &stru_100024FB8);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  [(CNContactsDaemon *)self setActiveXPCServices:v4];
}

- (void)subscribeNotifydListeners
{
  id v3 = +[CNContactsDaemonLogs xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000165D4(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  v11 = [(CNContactsDaemon *)self _notifydListenersByName];
  notificationQueue = self->_notificationQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000FF34;
  handler[3] = &unk_100024FE0;
  id v15 = v11;
  id v13 = v11;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)notificationQueue, handler);
}

- (void)subscribeApplicationUnregisteredListeners
{
  id v3 = +[CNContactsDaemonLogs xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100016684(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  notificationQueue = self->_notificationQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100010150;
  handler[3] = &unk_100024FE0;
  void handler[4] = self;
  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)notificationQueue, handler);
}

- (id)_notifydListenersByName
{
  id v3 = +[NSMutableDictionary dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(CNContactsDaemon *)self notifydListeners];
  id v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v6 = [v5 interestedNotifications];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v18;
          do
          {
            for (j = 0; j != v8; j = (char *)j + 1)
            {
              if (*(void *)v18 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * (void)j);
              v12 = [v3 objectForKey:v11];
              if (!v12)
              {
                v12 = +[NSMutableArray array];
                [v3 setObject:v12 forKey:v11];
              }
              [v12 addObject:v5];
            }
            id v8 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v8);
        }
      }
      id v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v16);
  }

  return v3;
}

- (void)registerXPCActivities
{
  v2 = [(CNContactsDaemon *)self XPCActivities];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) registerActivity];
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
  objc_msgSend(v2, "_cn_each:", &stru_100025020);
}

- (void)registerBackgroundSystemTasks
{
  id v2 = [(CNContactsDaemon *)self backgroundSystemTasks];
  objc_msgSend(v2, "_cn_each:", &stru_100025060);
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (NSArray)activeXPCListenerPairs
{
  return self->_activeXPCListenerPairs;
}

- (void)setActiveXPCListenerPairs:(id)a3
{
}

- (NSArray)activeXPCServices
{
  return self->_activeXPCServices;
}

- (void)setActiveXPCServices:(id)a3
{
}

- (NSArray)activeBackgroundSystemTasks
{
  return self->_activeBackgroundSystemTasks;
}

- (void)setActiveBackgroundSystemTasks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeBackgroundSystemTasks, 0);
  objc_storeStrong((id *)&self->_activeXPCServices, 0);
  objc_storeStrong((id *)&self->_activeXPCListenerPairs, 0);

  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

@end