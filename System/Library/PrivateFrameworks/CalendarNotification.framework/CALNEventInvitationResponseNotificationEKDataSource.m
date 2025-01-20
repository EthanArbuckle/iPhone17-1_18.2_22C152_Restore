@interface CALNEventInvitationResponseNotificationEKDataSource
- (CALNDataSourceEventRepresentationProvider)dataSourceEventRepresentationProvider;
- (CALNEKCalendarNotificationReferenceProvider)notificationReferenceProvider;
- (CALNEventInvitationResponseNotificationEKDataSource)initWithEventStoreProvider:(id)a3 inboxNotificationProvider:(id)a4 notificationReferenceProvider:(id)a5 dataSourceEventRepresentationProvider:(id)a6 preferences:(id)a7;
- (CALNInboxNotificationProvider)inboxNotificationProvider;
- (EKEventStoreProvider)eventStoreProvider;
- (EKNotificationPreferences)preferences;
- (id)_notificationInfoFromNotification:(id)a3 inEventStore:(id)a4;
- (id)fetchEventInvitationResponseNotificationSourceClientIdentifiers:(id)a3;
- (id)fetchEventInvitationResponseNotificationWithSourceClientIdentifier:(id)a3;
- (id)fetchEventInvitationResponseNotifications;
- (void)acceptEventInvitationResponseWithSourceClientIdentifier:(id)a3;
- (void)clearEventInvitationResponseWithSourceClientIdentifier:(id)a3;
- (void)declineEventInvitationResponseWithSourceClientIdentifier:(id)a3;
@end

@implementation CALNEventInvitationResponseNotificationEKDataSource

- (CALNEventInvitationResponseNotificationEKDataSource)initWithEventStoreProvider:(id)a3 inboxNotificationProvider:(id)a4 notificationReferenceProvider:(id)a5 dataSourceEventRepresentationProvider:(id)a6 preferences:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CALNEventInvitationResponseNotificationEKDataSource;
  v17 = [(CALNEventInvitationResponseNotificationEKDataSource *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_eventStoreProvider, a3);
    objc_storeStrong((id *)&v18->_inboxNotificationProvider, a4);
    objc_storeStrong((id *)&v18->_notificationReferenceProvider, a5);
    objc_storeStrong((id *)&v18->_dataSourceEventRepresentationProvider, a6);
    objc_storeStrong((id *)&v18->_preferences, a7);
  }

  return v18;
}

- (id)fetchEventInvitationResponseNotifications
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(CALNEventInvitationResponseNotificationEKDataSource *)self fetchEventInvitationResponseNotificationSourceClientIdentifiers:0];
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
        v10 = -[CALNEventInvitationResponseNotificationEKDataSource fetchEventInvitationResponseNotificationWithSourceClientIdentifier:](self, "fetchEventInvitationResponseNotificationWithSourceClientIdentifier:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
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
    _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, "Fetched event invitation notification infos. Found %{public}@ notifications", buf, 0xCu);
  }
  id v13 = (void *)[v4 copy];

  return v13;
}

- (id)fetchEventInvitationResponseNotificationSourceClientIdentifiers:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNEventInvitationResponseNotificationEKDataSource *)self preferences];
  int v6 = [v5 invitationNotificationsDisabled];

  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    goto LABEL_20;
  }
  uint64_t v8 = [(CALNEventInvitationResponseNotificationEKDataSource *)self inboxNotificationProvider];
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
      if (objc_msgSend(v15, "type", (void)v23) == 1)
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
          id v20 = [v19 URL];
          if (!v20 || ([v19 hiddenFromNotificationCenter] & 1) != 0)
          {
LABEL_15:
          }
          else
          {
            uint64_t v21 = [v19 type];

            if (v21 == 3)
            {
              id v20 = +[CALNNotificationDataSourceUtils sourceClientIdentifierForNotification:v19];
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

- (id)fetchEventInvitationResponseNotificationWithSourceClientIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNEventInvitationResponseNotificationEKDataSource *)self eventStoreProvider];
  int v6 = [v5 eventStore];

  uint64_t v7 = [(CALNEventInvitationResponseNotificationEKDataSource *)self notificationReferenceProvider];
  uint64_t v8 = +[CALNNotificationDataSourceUtils notificationReferenceOfType:1 withSourceClientIdentifier:v4 inEventStore:v6 withNotificationReferenceProvider:v7];

  if (v8)
  {
    v9 = [v8 notification];
    if (v9)
    {
      id v10 = [(CALNEventInvitationResponseNotificationEKDataSource *)self _notificationInfoFromNotification:v9 inEventStore:v6];
      uint64_t v11 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543618;
        id v14 = v4;
        __int16 v15 = 2112;
        long long v16 = v10;
        _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, "Fetched event invitation response notification info with sourceClientIdentifier: %{public}@ info: %@", (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      uint64_t v11 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[CALNEventInvitationNotificationDataSourceUtils eventForNotificationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:]();
      }
      id v10 = 0;
    }
  }
  else
  {
    v9 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[CALNEventInvitationNotificationDataSourceUtils eventForNotificationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:]();
    }
    id v10 = 0;
  }

  return v10;
}

- (void)clearEventInvitationResponseWithSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  id v7 = [(CALNEventInvitationResponseNotificationEKDataSource *)self eventStoreProvider];
  id v5 = [v7 eventStore];
  int v6 = [(CALNEventInvitationResponseNotificationEKDataSource *)self notificationReferenceProvider];
  +[CALNEventInvitationNotificationDataSourceUtils clearEventInvitationOfType:1 withSourceClientIdentifier:v4 inEventStore:v5 withNotificationReferenceProvider:v6];
}

- (void)acceptEventInvitationResponseWithSourceClientIdentifier:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNEventInvitationResponseNotificationEKDataSource *)self eventStoreProvider];
  int v6 = [v5 eventStore];

  id v7 = [(CALNEventInvitationResponseNotificationEKDataSource *)self notificationReferenceProvider];
  uint64_t v8 = +[CALNEventInvitationNotificationDataSourceUtils eventForNotificationOfType:1 withSourceClientIdentifier:v4 inEventStore:v6 withNotificationReferenceProvider:v7];

  if (v8)
  {
    v9 = [(CALNEventInvitationResponseNotificationEKDataSource *)self fetchEventInvitationResponseNotificationWithSourceClientIdentifier:v4];
    id v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 eventInvitationNotification];
      uint64_t v12 = CUIKNewTimeProposerForNotification();

      if (v12)
      {
        long long v25 = v10;
        long long v26 = v6;
        id v27 = v4;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        int v13 = [v8 attendees];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v30 != v16) {
                objc_enumerationMutation(v13);
              }
              int v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              v19 = [v12 URL];
              id v20 = [v18 URL];
              int v21 = [v19 isEqual:v20];

              if (v21)
              {
                [v8 acceptProposedTimeNotificationFromAttendee:v18];
              }
              else if ([v18 hasProposedStartDate])
              {
                [v8 declineProposedTimeNotificationFromAttendee:v18];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
          }
          while (v15);
        }

        id v28 = 0;
        int v6 = v26;
        char v22 = [v26 saveEvent:v8 span:0 error:&v28];
        long long v23 = v28;
        if (v22)
        {
          id v4 = v27;
        }
        else
        {
          long long v24 = +[CALNLogSubsystem calendar];
          id v4 = v27;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[CALNEventInvitationResponseNotificationEKDataSource acceptEventInvitationResponseWithSourceClientIdentifier:].cold.4();
          }
        }
        id v10 = v25;
      }
      else
      {
        long long v23 = +[CALNLogSubsystem calendar];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[CALNEventInvitationResponseNotificationEKDataSource acceptEventInvitationResponseWithSourceClientIdentifier:]();
        }
      }
    }
    else
    {
      uint64_t v12 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CALNEventInvitationResponseNotificationEKDataSource acceptEventInvitationResponseWithSourceClientIdentifier:]();
      }
    }
  }
  else
  {
    id v10 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CALNEventInvitationResponseNotificationEKDataSource acceptEventInvitationResponseWithSourceClientIdentifier:]();
    }
  }
}

- (void)declineEventInvitationResponseWithSourceClientIdentifier:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNEventInvitationResponseNotificationEKDataSource *)self eventStoreProvider];
  int v6 = [v5 eventStore];

  id v7 = [(CALNEventInvitationResponseNotificationEKDataSource *)self notificationReferenceProvider];
  uint64_t v8 = +[CALNEventInvitationNotificationDataSourceUtils eventForNotificationOfType:1 withSourceClientIdentifier:v4 inEventStore:v6 withNotificationReferenceProvider:v7];

  if (v8)
  {
    v9 = [(CALNEventInvitationResponseNotificationEKDataSource *)self fetchEventInvitationResponseNotificationWithSourceClientIdentifier:v4];
    id v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 eventInvitationNotification];
      uint64_t v12 = CUIKNewTimeProposerForNotification();

      if (v12)
      {
        long long v26 = v6;
        id v27 = v4;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        int v13 = [v8 attendees];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v30;
          long long v25 = v8;
          while (2)
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v30 != v16) {
                objc_enumerationMutation(v13);
              }
              int v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              v19 = [v12 URL];
              id v20 = [v18 URL];
              int v21 = [v19 isEqual:v20];

              if (v21)
              {
                uint64_t v8 = v25;
                [v25 declineProposedTimeNotificationFromAttendee:v18];
                goto LABEL_18;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
            uint64_t v8 = v25;
            if (v15) {
              continue;
            }
            break;
          }
        }
LABEL_18:

        id v28 = 0;
        int v6 = v26;
        char v22 = [v26 saveEvent:v8 span:0 error:&v28];
        long long v23 = v28;
        if (v22)
        {
          id v4 = v27;
        }
        else
        {
          long long v24 = +[CALNLogSubsystem calendar];
          id v4 = v27;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[CALNEventInvitationResponseNotificationEKDataSource declineEventInvitationResponseWithSourceClientIdentifier:].cold.4();
          }
        }
      }
      else
      {
        long long v23 = +[CALNLogSubsystem calendar];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[CALNEventInvitationResponseNotificationEKDataSource declineEventInvitationResponseWithSourceClientIdentifier:]();
        }
      }
    }
    else
    {
      uint64_t v12 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CALNEventInvitationResponseNotificationEKDataSource declineEventInvitationResponseWithSourceClientIdentifier:]();
      }
    }
  }
  else
  {
    id v10 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CALNEventInvitationResponseNotificationEKDataSource declineEventInvitationResponseWithSourceClientIdentifier:]();
    }
  }
}

- (id)_notificationInfoFromNotification:(id)a3 inEventStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[CALNNotificationDataSourceUtils sourceClientIdentifierForNotification:v6];
  v9 = +[CALNEventInvitationNotificationDataSourceUtils expirationDateForEventInvitation:v6];
  id v10 = +[CALNEventInvitationNotificationDataSourceUtils eventForEventInvitation:v6 inEventStore:v7];
  if (v10)
  {
    uint64_t v11 = [v6 source];
    unsigned int v24 = [v11 isDelegate];
    long long v23 = [v11 title];
    char v22 = [v11 uniqueIdentifier];
    int v21 = CUIKLaunchURLForEventInvitation();
    uint64_t v12 = [(CALNEventInvitationResponseNotificationEKDataSource *)self dataSourceEventRepresentationProvider];
    int v13 = [v10 startDate];
    [v10 endDate];
    v15 = uint64_t v14 = v9;
    [v7 timeZone];
    v17 = uint64_t v16 = v8;
    [v12 eventRepresentationDictionaryForInvitationNotification:v6 event:v10 date:v13 endDate:v15 timeZone:v17];
    int v18 = v25 = v7;

    uint64_t v8 = v16;
    v9 = v14;

    v19 = [[CALNEventInvitationResponseNotificationInfo alloc] initWithSourceClientIdentifier:v16 launchURL:v21 expirationDate:v14 eventInvitationNotification:v6 eventRepresentationDictionary:v18 isDelegate:v24 sourceTitle:v23 sourceIdentifier:v22];
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
  objc_storeStrong((id *)&self->_notificationReferenceProvider, 0);
  objc_storeStrong((id *)&self->_inboxNotificationProvider, 0);
  objc_storeStrong((id *)&self->_eventStoreProvider, 0);
}

- (void)acceptEventInvitationResponseWithSourceClientIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to get event (%{public}@) when attempting to accept invitation response", v2, v3, v4, v5, v6);
}

- (void)acceptEventInvitationResponseWithSourceClientIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to get notification info for sourceClientIdentifier (%{public}@) when attempting to accept invitation response", v2, v3, v4, v5, v6);
}

- (void)acceptEventInvitationResponseWithSourceClientIdentifier:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to get a proposer when attempting to accept and invitation response notification that should have been a proposed new time notification (%{public}@)", v2, v3, v4, v5, v6);
}

- (void)acceptEventInvitationResponseWithSourceClientIdentifier:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, v0, v1, "Error saving event store after accepting proposed new time for sourceClientIdentifier (%{public}@), error = %@");
}

- (void)declineEventInvitationResponseWithSourceClientIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to get event (%{public}@) when attempting to decline invitation response", v2, v3, v4, v5, v6);
}

- (void)declineEventInvitationResponseWithSourceClientIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to get notification info for sourceClientIdentifier (%{public}@) when attempting to decline invitation response", v2, v3, v4, v5, v6);
}

- (void)declineEventInvitationResponseWithSourceClientIdentifier:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to get a proposer when attempting to decline an invitation response notification that should have been a proposed new time notification (%{public}@)", v2, v3, v4, v5, v6);
}

- (void)declineEventInvitationResponseWithSourceClientIdentifier:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, v0, v1, "Error saving event store after declining proposed new time for sourceClientIdentifier (%{public}@), error = %@");
}

@end