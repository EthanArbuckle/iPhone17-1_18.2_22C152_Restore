@interface CALNSharedCalendarInvitationNotificationEKDataSource
- (CALNDataAccessExpressConnection)dataAccessExpressConnection;
- (CALNEKCalendarNotificationReferenceProvider)notificationReferenceProvider;
- (CALNInboxNotificationProvider)inboxNotificationProvider;
- (CALNSharedCalendarInvitationNotificationEKDataSource)initWithEventStoreProvider:(id)a3 inboxNotificationProvider:(id)a4 notificationReferenceProvider:(id)a5 dataAccessExpressConnection:(id)a6 preferences:(id)a7;
- (EKEventStoreProvider)eventStoreProvider;
- (EKNotificationPreferences)preferences;
- (id)_notificationInfoFromNotification:(id)a3;
- (id)_notificationInfoFromNotificationReference:(id)a3;
- (id)fetchSharedCalendarInvitationNotificationSourceClientIdentifiers:(id)a3;
- (id)fetchSharedCalendarInvitationNotificationWithSourceClientIdentifier:(id)a3;
- (id)fetchSharedCalendarInvitationNotifications;
- (void)clearSharedCalendarInvitationWithSourceClientIdentifier:(id)a3;
- (void)declineSharedCalendarWithSourceClientIdentifier:(id)a3;
- (void)joinSharedCalendarWithSourceClientIdentifier:(id)a3;
- (void)reportSharedCalendarAsJunkWithSourceClientIdentifier:(id)a3;
@end

@implementation CALNSharedCalendarInvitationNotificationEKDataSource

- (CALNSharedCalendarInvitationNotificationEKDataSource)initWithEventStoreProvider:(id)a3 inboxNotificationProvider:(id)a4 notificationReferenceProvider:(id)a5 dataAccessExpressConnection:(id)a6 preferences:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CALNSharedCalendarInvitationNotificationEKDataSource;
  v17 = [(CALNSharedCalendarInvitationNotificationEKDataSource *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_eventStoreProvider, a3);
    objc_storeStrong((id *)&v18->_inboxNotificationProvider, a4);
    objc_storeStrong((id *)&v18->_notificationReferenceProvider, a5);
    objc_storeStrong((id *)&v18->_dataAccessExpressConnection, a6);
    objc_storeStrong((id *)&v18->_preferences, a7);
  }

  return v18;
}

- (id)fetchSharedCalendarInvitationNotifications
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(CALNSharedCalendarInvitationNotificationEKDataSource *)self fetchSharedCalendarInvitationNotificationSourceClientIdentifiers:0];
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
        v10 = -[CALNSharedCalendarInvitationNotificationEKDataSource fetchSharedCalendarInvitationNotificationWithSourceClientIdentifier:](self, "fetchSharedCalendarInvitationNotificationWithSourceClientIdentifier:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }

  v11 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    *(_DWORD *)buf = 138543362;
    id v20 = v12;
    _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, "Fetched shared calendar invitation notification infos. Found %{public}@ notifications", buf, 0xCu);
  }
  id v13 = (void *)[v4 copy];

  return v13;
}

- (id)fetchSharedCalendarInvitationNotificationSourceClientIdentifiers:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNSharedCalendarInvitationNotificationEKDataSource *)self preferences];
  int v6 = [v5 sharedCalendarNotificationsDisabled];

  if (v6)
  {
    uint64_t v7 = objc_opt_new();
  }
  else
  {
    uint64_t v8 = [(CALNSharedCalendarInvitationNotificationEKDataSource *)self inboxNotificationProvider];
    v9 = [v8 eventNotificationReferences];

    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (objc_msgSend(v15, "type", (void)v25) == 2)
          {
            if (!v4
              || ([v15 objectID],
                  long long v16 = objc_claimAutoreleasedReturnValue(),
                  [v16 stringRepresentation],
                  long long v17 = objc_claimAutoreleasedReturnValue(),
                  int v18 = [v4 containsObject:v17],
                  v17,
                  v16,
                  v18))
            {
              v19 = [v15 notification];
              uint64_t v20 = [v19 URL];
              if (v20)
              {
                objc_super v21 = (void *)v20;
                char v22 = [v19 hiddenFromNotificationCenter];

                if ((v22 & 1) == 0)
                {
                  v23 = +[CALNNotificationDataSourceUtils sourceClientIdentifierForNotification:v19];
                  [v7 addObject:v23];
                }
              }
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v12);
    }
  }
  return v7;
}

- (id)fetchSharedCalendarInvitationNotificationWithSourceClientIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CALNSharedCalendarInvitationNotificationEKDataSource *)self eventStoreProvider];
    int v6 = [v5 eventStore];

    uint64_t v7 = [(CALNSharedCalendarInvitationNotificationEKDataSource *)self notificationReferenceProvider];
    uint64_t v8 = +[CALNNotificationDataSourceUtils notificationReferenceOfType:2 withSourceClientIdentifier:v4 inEventStore:v6 withNotificationReferenceProvider:v7];

    if (v8)
    {
      v9 = [(CALNSharedCalendarInvitationNotificationEKDataSource *)self _notificationInfoFromNotificationReference:v8];
      id v10 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138543618;
        id v13 = v4;
        __int16 v14 = 2112;
        long long v15 = v9;
        _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, "Fetched shared calendar invitation notification with sourceClientIdentifier = %{public}@. Info = %@", (uint8_t *)&v12, 0x16u);
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
      +[CALNNotificationDataSourceUtils calendarWithSourceClientIdentifier:inEventStore:](v6);
    }
    v9 = 0;
  }

  return v9;
}

- (void)clearSharedCalendarInvitationWithSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNSharedCalendarInvitationNotificationEKDataSource *)self eventStoreProvider];
  id v7 = [v5 eventStore];

  int v6 = +[CALNNotificationDataSourceUtils calendarWithSourceClientIdentifier:v4 inEventStore:v7];

  if (v6) {
    +[CALNNotificationDataSourceUtils hideCalendarFromNotificationCenter:v6 inEventStore:v7];
  }
}

- (void)joinSharedCalendarWithSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNSharedCalendarInvitationNotificationEKDataSource *)self eventStoreProvider];
  id v7 = [v5 eventStore];

  int v6 = [(CALNSharedCalendarInvitationNotificationEKDataSource *)self dataAccessExpressConnection];
  +[CALNNotificationDataSourceUtils respondToSharedCalendarInvitationWithSourceClientIdentifier:v4 inEventStore:v7 withDataAccessExpressConnection:v6 accept:1];
}

- (void)declineSharedCalendarWithSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNSharedCalendarInvitationNotificationEKDataSource *)self eventStoreProvider];
  id v7 = [v5 eventStore];

  int v6 = [(CALNSharedCalendarInvitationNotificationEKDataSource *)self dataAccessExpressConnection];
  +[CALNNotificationDataSourceUtils respondToSharedCalendarInvitationWithSourceClientIdentifier:v4 inEventStore:v7 withDataAccessExpressConnection:v6 accept:0];
}

- (void)reportSharedCalendarAsJunkWithSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNSharedCalendarInvitationNotificationEKDataSource *)self eventStoreProvider];
  id v6 = [v5 eventStore];

  +[CALNNotificationDataSourceUtils reportSharedCalendarInvitationAsJunkWithSourceClientIdentifier:v4 inEventStore:v6];
}

- (id)_notificationInfoFromNotificationReference:(id)a3
{
  id v4 = [a3 notification];
  if (v4)
  {
    id v5 = [(CALNSharedCalendarInvitationNotificationEKDataSource *)self _notificationInfoFromNotification:v4];
  }
  else
  {
    id v6 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CALNSharedCalendarInvitationNotificationEKDataSource _notificationInfoFromNotificationReference:](v6);
    }

    id v5 = 0;
  }

  return v5;
}

- (id)_notificationInfoFromNotification:(id)a3
{
  id v3 = a3;
  id v4 = +[CALNNotificationDataSourceUtils sourceClientIdentifierForNotification:v3];
  id v5 = [v3 source];
  uint64_t v6 = [v5 isDelegate];
  id v7 = [v5 title];
  uint64_t v8 = [v5 uniqueIdentifier];
  v9 = [[CALNSharedCalendarInvitationNotificationInfo alloc] initWithSourceClientIdentifier:v4 calendarNotification:v3 isDelegate:v6 sourceTitle:v7 sourceIdentifier:v8];

  return v9;
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

- (CALNDataAccessExpressConnection)dataAccessExpressConnection
{
  return self->_dataAccessExpressConnection;
}

- (EKNotificationPreferences)preferences
{
  return self->_preferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_dataAccessExpressConnection, 0);
  objc_storeStrong((id *)&self->_notificationReferenceProvider, 0);
  objc_storeStrong((id *)&self->_inboxNotificationProvider, 0);
  objc_storeStrong((id *)&self->_eventStoreProvider, 0);
}

- (void)_notificationInfoFromNotificationReference:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2216BB000, log, OS_LOG_TYPE_ERROR, "Failed to get notification object from notification reference. Bailing.", v1, 2u);
}

@end