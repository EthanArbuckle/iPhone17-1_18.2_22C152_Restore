@interface CALNSharedCalendarInvitationResponseNotificationEKDataSource
- (CALNEKCalendarNotificationReferenceProvider)notificationReferenceProvider;
- (CALNInboxNotificationProvider)inboxNotificationProvider;
- (CALNSharedCalendarInvitationResponseNotificationEKDataSource)initWithEventStoreProvider:(id)a3 inboxNotificationProvider:(id)a4 notificationReferenceProvider:(id)a5 preferences:(id)a6;
- (EKEventStoreProvider)eventStoreProvider;
- (EKNotificationPreferences)preferences;
- (id)_notificationInfoFromNotification:(id)a3;
- (id)_notificationInfoFromNotificationReference:(id)a3;
- (id)fetchSharedCalendarInvitationResponseNotificationSourceClientIdentifiers:(id)a3;
- (id)fetchSharedCalendarInvitationResponseNotificationWithSourceClientIdentifier:(id)a3;
- (id)fetchSharedCalendarInvitationResponseNotifications;
- (void)clearSharedCalendarInvitationResponseWithSourceClientIdentifier:(id)a3;
@end

@implementation CALNSharedCalendarInvitationResponseNotificationEKDataSource

- (CALNSharedCalendarInvitationResponseNotificationEKDataSource)initWithEventStoreProvider:(id)a3 inboxNotificationProvider:(id)a4 notificationReferenceProvider:(id)a5 preferences:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CALNSharedCalendarInvitationResponseNotificationEKDataSource;
  v15 = [(CALNSharedCalendarInvitationResponseNotificationEKDataSource *)&v18 init];
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

- (id)fetchSharedCalendarInvitationResponseNotifications
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(CALNSharedCalendarInvitationResponseNotificationEKDataSource *)self fetchSharedCalendarInvitationResponseNotificationSourceClientIdentifiers:0];
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
        v10 = -[CALNSharedCalendarInvitationResponseNotificationEKDataSource fetchSharedCalendarInvitationResponseNotificationWithSourceClientIdentifier:](self, "fetchSharedCalendarInvitationResponseNotificationWithSourceClientIdentifier:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
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
    _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, "Fetched shared calendar invitation response notification infos. Found %{public}@ notifications", buf, 0xCu);
  }
  id v13 = (void *)[v4 copy];

  return v13;
}

- (id)fetchSharedCalendarInvitationResponseNotificationSourceClientIdentifiers:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNSharedCalendarInvitationResponseNotificationEKDataSource *)self preferences];
  int v6 = [v5 sharedCalendarNotificationsDisabled];

  if (v6)
  {
    id v27 = (id)objc_opt_new();
  }
  else
  {
    uint64_t v7 = [(CALNSharedCalendarInvitationResponseNotificationEKDataSource *)self inboxNotificationProvider];
    uint64_t v8 = [v7 eventNotificationReferences];

    id v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v9 = [(CALNSharedCalendarInvitationResponseNotificationEKDataSource *)self eventStoreProvider];
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
          if ([v16 type] == 3)
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
                  v24 = [v20 inviteReplyNotificationFromEventStore:v10];
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

- (id)fetchSharedCalendarInvitationResponseNotificationWithSourceClientIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CALNSharedCalendarInvitationResponseNotificationEKDataSource *)self eventStoreProvider];
    int v6 = [v5 eventStore];

    uint64_t v7 = [(CALNSharedCalendarInvitationResponseNotificationEKDataSource *)self notificationReferenceProvider];
    uint64_t v8 = +[CALNNotificationDataSourceUtils notificationReferenceOfType:3 withSourceClientIdentifier:v4 inEventStore:v6 withNotificationReferenceProvider:v7];

    if (v8)
    {
      v9 = [(CALNSharedCalendarInvitationResponseNotificationEKDataSource *)self _notificationInfoFromNotificationReference:v8];
      v10 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138543618;
        id v13 = v4;
        __int16 v14 = 2112;
        long long v15 = v9;
        _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, "Fetched shared calendar invitation response notification with sourceClientIdentifier = %{public}@. Info = %@", (uint8_t *)&v12, 0x16u);
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

- (void)clearSharedCalendarInvitationResponseWithSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNSharedCalendarInvitationResponseNotificationEKDataSource *)self eventStoreProvider];
  id v6 = [v5 eventStore];

  +[CALNNotificationDataSourceUtils clearSharedCalendarInvitationResponseWithSourceClientIdentifier:v4 inEventStore:v6];
}

- (id)_notificationInfoFromNotificationReference:(id)a3
{
  id v4 = [a3 notification];
  if (v4)
  {
    id v5 = [(CALNSharedCalendarInvitationResponseNotificationEKDataSource *)self _notificationInfoFromNotification:v4];
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
  uint64_t v7 = [v5 title];
  uint64_t v8 = [v5 uniqueIdentifier];
  v9 = [[CALNSharedCalendarInvitationResponseNotificationInfo alloc] initWithSourceClientIdentifier:v4 calendarNotification:v3 isDelegate:v6 sourceTitle:v7 sourceIdentifier:v8];

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

@end