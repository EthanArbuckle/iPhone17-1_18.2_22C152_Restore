@interface CALNCalendarResourceChangedNotificationEKDataSource
- (CALNCalendarResourceChangedNotificationEKDataSource)initWithEventStoreProvider:(id)a3 inboxNotificationProvider:(id)a4 notificationReferenceProvider:(id)a5 preferences:(id)a6;
- (CALNEKCalendarNotificationReferenceProvider)notificationReferenceProvider;
- (CALNInboxNotificationProvider)inboxNotificationProvider;
- (EKEventStoreProvider)eventStoreProvider;
- (EKNotificationPreferences)preferences;
- (id)_notificationInfoFromNotification:(id)a3;
- (id)_notificationInfoFromNotificationReference:(id)a3;
- (id)fetchCalendarResourceChangedNotificationSourceClientIdentifiers:(id)a3;
- (id)fetchCalendarResourceChangedNotificationWithSourceClientIdentifier:(id)a3;
- (id)fetchCalendarResourceChangedNotifications;
- (void)clearCalendarResourceChangedNotificationWithSourceClientIdentifier:(id)a3;
@end

@implementation CALNCalendarResourceChangedNotificationEKDataSource

- (CALNCalendarResourceChangedNotificationEKDataSource)initWithEventStoreProvider:(id)a3 inboxNotificationProvider:(id)a4 notificationReferenceProvider:(id)a5 preferences:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CALNCalendarResourceChangedNotificationEKDataSource;
  v15 = [(CALNCalendarResourceChangedNotificationEKDataSource *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_eventStoreProvider, a3);
    objc_storeStrong((id *)&v16->_inboxNotificationProvider, a4);
    objc_storeStrong((id *)&v16->_notificationReferenceProvider, a5);
    objc_storeStrong((id *)&v16->_preferences, a6);
  }

  return v16;
}

- (id)fetchCalendarResourceChangedNotifications
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(CALNCalendarResourceChangedNotificationEKDataSource *)self fetchCalendarResourceChangedNotificationSourceClientIdentifiers:0];
  v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = -[CALNCalendarResourceChangedNotificationEKDataSource fetchCalendarResourceChangedNotificationWithSourceClientIdentifier:](self, "fetchCalendarResourceChangedNotificationWithSourceClientIdentifier:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }

  id v11 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    *(_DWORD *)buf = 138543362;
    v20 = v12;
    _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, "Fetched calendar resource changed notification infos. Found %{public}@ notifications", buf, 0xCu);
  }
  id v13 = (void *)[v4 copy];

  return v13;
}

- (id)fetchCalendarResourceChangedNotificationSourceClientIdentifiers:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNCalendarResourceChangedNotificationEKDataSource *)self preferences];
  int v6 = [v5 sharedCalendarNotificationsDisabled];

  if (v6)
  {
    id v27 = (id)objc_opt_new();
  }
  else
  {
    uint64_t v7 = [(CALNCalendarResourceChangedNotificationEKDataSource *)self inboxNotificationProvider];
    uint64_t v8 = [v7 eventNotificationReferences];

    id v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v9 = [(CALNCalendarResourceChangedNotificationEKDataSource *)self eventStoreProvider];
    v10 = [v9 eventStore];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ([v16 type] == 4)
          {
            if (!v4
              || ([v16 objectID],
                  long long v17 = objc_claimAutoreleasedReturnValue(),
                  [v17 stringRepresentation],
                  long long v18 = objc_claimAutoreleasedReturnValue(),
                  int v19 = [v4 containsObject:v18],
                  v18,
                  v17,
                  v19))
            {
              v20 = [v16 notification];
              uint64_t v21 = [v20 URL];
              if (v21)
              {
                uint64_t v22 = (void *)v21;
                char v23 = [v20 hiddenFromNotificationCenter];

                if ((v23 & 1) == 0)
                {
                  v24 = [v20 resourceChangeFromEventStore:v10];
                  if (([v24 alerted] & 1) == 0)
                  {
                    v25 = +[CALNNotificationDataSourceUtils sourceClientIdentifierForNotification:v20];
                    [v27 addObject:v25];
                  }
                }
              }
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v13);
    }
  }
  return v27;
}

- (id)fetchCalendarResourceChangedNotificationWithSourceClientIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CALNCalendarResourceChangedNotificationEKDataSource *)self eventStoreProvider];
    int v6 = [v5 eventStore];

    uint64_t v7 = [(CALNCalendarResourceChangedNotificationEKDataSource *)self notificationReferenceProvider];
    uint64_t v8 = +[CALNNotificationDataSourceUtils notificationReferenceOfType:4 withSourceClientIdentifier:v4 inEventStore:v6 withNotificationReferenceProvider:v7];

    if (v8)
    {
      v9 = [(CALNCalendarResourceChangedNotificationEKDataSource *)self _notificationInfoFromNotificationReference:v8];
      v10 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138543618;
        id v20 = v4;
        __int16 v21 = 2112;
        uint64_t v22 = v9;
        _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, "Fetched calendar resource changed notification with sourceClientIdentifier = %{public}@. Info = %@", (uint8_t *)&v19, 0x16u);
      }
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    int v6 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CALNCalendarResourceChangedNotificationEKDataSource fetchCalendarResourceChangedNotificationWithSourceClientIdentifier:](v6, v11, v12, v13, v14, v15, v16, v17);
    }
    v9 = 0;
  }

  return v9;
}

- (void)clearCalendarResourceChangedNotificationWithSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNCalendarResourceChangedNotificationEKDataSource *)self eventStoreProvider];
  int v6 = [v5 eventStore];

  uint64_t v7 = [(CALNCalendarResourceChangedNotificationEKDataSource *)self notificationReferenceProvider];
  uint64_t v8 = +[CALNNotificationDataSourceUtils notificationReferenceOfType:4 withSourceClientIdentifier:v4 inEventStore:v6 withNotificationReferenceProvider:v7];

  if (v8)
  {
    v9 = [v8 notification];
    v10 = v9;
    if (v9)
    {
      id v21 = 0;
      char v11 = [v9 acknowledgeWithEventStore:v6 error:&v21];
      uint64_t v12 = v21;
      if ((v11 & 1) == 0)
      {
        uint64_t v13 = +[CALNLogSubsystem calendar];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          [(CALNCalendarResourceChangedNotificationEKDataSource *)v10 clearCalendarResourceChangedNotificationWithSourceClientIdentifier:v13];
        }
      }
    }
    else
    {
      uint64_t v12 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CALNCalendarResourceChangedNotificationEKDataSource clearCalendarResourceChangedNotificationWithSourceClientIdentifier:](v12, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }
}

- (id)_notificationInfoFromNotificationReference:(id)a3
{
  id v4 = [a3 notification];
  if (v4)
  {
    id v5 = [(CALNCalendarResourceChangedNotificationEKDataSource *)self _notificationInfoFromNotification:v4];
  }
  else
  {
    int v6 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CALNCalendarResourceChangedNotificationEKDataSource clearCalendarResourceChangedNotificationWithSourceClientIdentifier:](v6, v7, v8, v9, v10, v11, v12, v13);
    }

    id v5 = 0;
  }

  return v5;
}

- (id)_notificationInfoFromNotification:(id)a3
{
  id v4 = a3;
  id v21 = +[CALNNotificationDataSourceUtils sourceClientIdentifierForNotification:v4];
  uint64_t v20 = +[CALNResourceChangedNotificationDataSourceUtils expirationDateForNotification:v4];
  id v5 = [(CALNCalendarResourceChangedNotificationEKDataSource *)self eventStoreProvider];
  int v6 = [v5 eventStore];

  uint64_t v19 = +[CALNResourceChangedNotificationDataSourceUtils launchURLForNotification:v4 inEventStore:v6];
  uint64_t v7 = [v4 source];
  char v18 = [v7 isDelegate];
  uint64_t v17 = [v7 title];
  uint64_t v8 = [v7 uniqueIdentifier];
  uint64_t v9 = [CALNCalendarResourceChangedNotificationInfo alloc];
  uint64_t v10 = [v4 changeType];
  uint64_t v11 = [v4 startDate];
  uint64_t v12 = [v4 allDay];
  uint64_t v13 = [v6 timeZone];
  LOBYTE(v16) = v18;
  uint64_t v14 = [(CALNCalendarResourceChangedNotificationInfo *)v9 initWithSourceClientIdentifier:v21 calendarNotification:v4 changeType:v10 date:v11 allDay:v12 timeZone:v13 expirationDate:v20 launchURL:v19 isDelegate:v16 sourceTitle:v17 sourceIdentifier:v8];

  return v14;
}

- (EKEventStoreProvider)eventStoreProvider
{
  return self->_eventStoreProvider;
}

- (CALNInboxNotificationProvider)inboxNotificationProvider
{
  return self->_inboxNotificationProvider;
}

- (CALNEKCalendarNotificationReferenceProvider)notificationReferenceProvider
{
  return self->_notificationReferenceProvider;
}

- (EKNotificationPreferences)preferences
{
  return self->_preferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_notificationReferenceProvider, 0);
  objc_storeStrong((id *)&self->_inboxNotificationProvider, 0);
  objc_storeStrong((id *)&self->_eventStoreProvider, 0);
}

- (void)fetchCalendarResourceChangedNotificationWithSourceClientIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)clearCalendarResourceChangedNotificationWithSourceClientIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)clearCalendarResourceChangedNotificationWithSourceClientIdentifier:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [a1 objectID];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_2216BB000, a3, OS_LOG_TYPE_ERROR, "Failed to acknowledge resource change (%{public}@) for notification with sourceClientIdentifier %{public}@", (uint8_t *)&v6, 0x16u);
}

@end