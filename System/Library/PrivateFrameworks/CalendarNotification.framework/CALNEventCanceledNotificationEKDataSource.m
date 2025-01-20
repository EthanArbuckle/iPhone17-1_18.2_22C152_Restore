@interface CALNEventCanceledNotificationEKDataSource
- (CALNDataSourceEventRepresentationProvider)dataSourceEventRepresentationProvider;
- (CALNEKCalendarNotificationReferenceProvider)notificationReferenceProvider;
- (CALNEventCanceledNotificationEKDataSource)initWithEventStoreProvider:(id)a3 inboxNotificationProvider:(id)a4 notificationReferenceProvider:(id)a5 remoteMutator:(id)a6 dataSourceEventRepresentationProvider:(id)a7 preferences:(id)a8;
- (CALNInboxNotificationProvider)inboxNotificationProvider;
- (CALNRemoteMutator)remoteMutator;
- (EKEventStoreProvider)eventStoreProvider;
- (EKNotificationPreferences)preferences;
- (id)_notificationInfoFromNotification:(id)a3 inEventStore:(id)a4;
- (id)fetchEventCanceledNotificationSourceClientIdentifiers:(id)a3;
- (id)fetchEventCanceledNotificationWithSourceClientIdentifier:(id)a3;
- (id)fetchEventCanceledNotifications;
- (void)clearCanceledEventNotificationWithSourceClientIdentifier:(id)a3;
- (void)deleteCanceledEventWithSourceClientIdentifier:(id)a3;
@end

@implementation CALNEventCanceledNotificationEKDataSource

- (CALNEventCanceledNotificationEKDataSource)initWithEventStoreProvider:(id)a3 inboxNotificationProvider:(id)a4 notificationReferenceProvider:(id)a5 remoteMutator:(id)a6 dataSourceEventRepresentationProvider:(id)a7 preferences:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CALNEventCanceledNotificationEKDataSource;
  v18 = [(CALNEventCanceledNotificationEKDataSource *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_eventStoreProvider, a3);
    objc_storeStrong((id *)&v19->_inboxNotificationProvider, a4);
    objc_storeStrong((id *)&v19->_notificationReferenceProvider, a5);
    objc_storeStrong((id *)&v19->_remoteMutator, a6);
    objc_storeStrong((id *)&v19->_dataSourceEventRepresentationProvider, a7);
    objc_storeStrong((id *)&v19->_preferences, a8);
  }

  return v19;
}

- (id)fetchEventCanceledNotifications
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(CALNEventCanceledNotificationEKDataSource *)self fetchEventCanceledNotificationSourceClientIdentifiers:0];
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
        v10 = -[CALNEventCanceledNotificationEKDataSource fetchEventCanceledNotificationWithSourceClientIdentifier:](self, "fetchEventCanceledNotificationWithSourceClientIdentifier:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
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
    v20 = v12;
    _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, "Fetched event canceled notification infos. Found %{public}@ notifications", buf, 0xCu);
  }
  v13 = (void *)[v4 copy];

  return v13;
}

- (id)fetchEventCanceledNotificationSourceClientIdentifiers:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNEventCanceledNotificationEKDataSource *)self preferences];
  int v6 = [v5 invitationNotificationsDisabled];

  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    goto LABEL_20;
  }
  uint64_t v8 = [(CALNEventCanceledNotificationEKDataSource *)self inboxNotificationProvider];
  v9 = [v8 eventNotificationReferences];

  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v11) {
    goto LABEL_19;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v24;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v24 != v13) {
        objc_enumerationMutation(v10);
      }
      long long v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      if (!objc_msgSend(v15, "type", (void)v23))
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
          v20 = [v19 URL];
          if (!v20 || ([v19 hiddenFromNotificationCenter] & 1) != 0)
          {
LABEL_15:
          }
          else
          {
            uint64_t v21 = [v19 type];

            if (v21 == 2)
            {
              v20 = +[CALNNotificationDataSourceUtils sourceClientIdentifierForNotification:v19];
              [v7 addObject:v20];
              goto LABEL_15;
            }
          }

          continue;
        }
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v12);
LABEL_19:

LABEL_20:
  return v7;
}

- (id)fetchEventCanceledNotificationWithSourceClientIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNEventCanceledNotificationEKDataSource *)self eventStoreProvider];
  int v6 = [v5 eventStore];

  uint64_t v7 = [(CALNEventCanceledNotificationEKDataSource *)self notificationReferenceProvider];
  uint64_t v8 = +[CALNNotificationDataSourceUtils notificationReferenceOfType:0 withSourceClientIdentifier:v4 inEventStore:v6 withNotificationReferenceProvider:v7];

  if (v8)
  {
    v9 = [v8 notification];
    if (v9)
    {
      id v10 = [(CALNEventCanceledNotificationEKDataSource *)self _notificationInfoFromNotification:v9 inEventStore:v6];
      uint64_t v11 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543618;
        id v14 = v4;
        __int16 v15 = 2112;
        long long v16 = v10;
        _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, "Fetched event canceled notification info with sourceClientIdentifier: %{public}@ info: %@", (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      uint64_t v11 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CALNEventCanceledNotificationEKDataSource fetchEventCanceledNotificationWithSourceClientIdentifier:]();
      }
      id v10 = 0;
    }
  }
  else
  {
    v9 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CALNEventCanceledNotificationEKDataSource fetchEventCanceledNotificationWithSourceClientIdentifier:]();
    }
    id v10 = 0;
  }

  return v10;
}

- (void)clearCanceledEventNotificationWithSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  id v7 = [(CALNEventCanceledNotificationEKDataSource *)self eventStoreProvider];
  id v5 = [v7 eventStore];
  int v6 = [(CALNEventCanceledNotificationEKDataSource *)self notificationReferenceProvider];
  +[CALNEventInvitationNotificationDataSourceUtils clearEventInvitationOfType:0 withSourceClientIdentifier:v4 inEventStore:v5 withNotificationReferenceProvider:v6];
}

- (void)deleteCanceledEventWithSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNEventCanceledNotificationEKDataSource *)self eventStoreProvider];
  int v6 = [v5 eventStore];

  id v7 = [(CALNEventCanceledNotificationEKDataSource *)self notificationReferenceProvider];
  uint64_t v8 = +[CALNEventInvitationNotificationDataSourceUtils eventForNotificationOfType:0 withSourceClientIdentifier:v4 inEventStore:v6 withNotificationReferenceProvider:v7];

  if (v8)
  {
    v9 = [(CALNEventCanceledNotificationEKDataSource *)self remoteMutator];
    id v13 = 0;
    BOOL v10 = +[CALNRemoteMutatorShared deleteEvent:v8 inEventStore:v6 withSpan:2 usingRemoteMutator:v9 error:&v13];
    uint64_t v11 = v13;

    if (!v10)
    {
      uint64_t v12 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CALNEventCanceledNotificationEKDataSource deleteCanceledEventWithSourceClientIdentifier:]();
      }
    }
  }
  else
  {
    uint64_t v11 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CALNEventCanceledNotificationEKDataSource deleteCanceledEventWithSourceClientIdentifier:]();
    }
  }
}

- (id)_notificationInfoFromNotification:(id)a3 inEventStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[CALNNotificationDataSourceUtils sourceClientIdentifierForNotification:v6];
  v9 = +[CALNEventInvitationNotificationDataSourceUtils expirationDateForEventInvitation:v6];
  BOOL v10 = +[CALNEventInvitationNotificationDataSourceUtils eventForEventInvitation:v6 inEventStore:v7];
  if (v10)
  {
    uint64_t v11 = [v6 source];
    unsigned int v24 = [v11 isDelegate];
    long long v23 = [v11 title];
    uint64_t v22 = [v11 uniqueIdentifier];
    uint64_t v21 = CUIKLaunchURLForEventInvitation();
    uint64_t v12 = [(CALNEventCanceledNotificationEKDataSource *)self dataSourceEventRepresentationProvider];
    id v13 = [v10 startDate];
    [v10 endDate];
    __int16 v15 = v14 = v9;
    [v7 timeZone];
    v17 = long long v16 = v8;
    [v12 eventRepresentationDictionaryForInvitationNotification:v6 event:v10 date:v13 endDate:v15 timeZone:v17];
    int v18 = v25 = v7;

    uint64_t v8 = v16;
    v9 = v14;

    v19 = [[CALNEventCanceledNotificationInfo alloc] initWithSourceClientIdentifier:v16 launchURL:v21 expirationDate:v14 eventInvitationNotification:v6 eventRepresentationDictionary:v18 isDelegate:v24 sourceTitle:v23 sourceIdentifier:v22];
    id v7 = v25;
  }
  else
  {
    v19 = 0;
  }

  return v19;
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

- (CALNRemoteMutator)remoteMutator
{
  return self->_remoteMutator;
}

- (CALNDataSourceEventRepresentationProvider)dataSourceEventRepresentationProvider
{
  return self->_dataSourceEventRepresentationProvider;
}

- (EKNotificationPreferences)preferences
{
  return self->_preferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_dataSourceEventRepresentationProvider, 0);
  objc_storeStrong((id *)&self->_remoteMutator, 0);
  objc_storeStrong((id *)&self->_notificationReferenceProvider, 0);
  objc_storeStrong((id *)&self->_inboxNotificationProvider, 0);
  objc_storeStrong((id *)&self->_eventStoreProvider, 0);
}

- (void)fetchEventCanceledNotificationWithSourceClientIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to get notification reference with sourceClientIdentifier %{public}@", v2, v3, v4, v5, v6);
}

- (void)fetchEventCanceledNotificationWithSourceClientIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to get notification from notification reference. sourceClientIdentifier = %{public}@", v2, v3, v4, v5, v6);
}

- (void)deleteCanceledEventWithSourceClientIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to get canceled event (%{public}@) when trying to delete it", v2, v3, v4, v5, v6);
}

- (void)deleteCanceledEventWithSourceClientIdentifier:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2216BB000, v1, OS_LOG_TYPE_ERROR, "Failed to delete canceled event (%{public}@): %@", v2, 0x16u);
}

@end