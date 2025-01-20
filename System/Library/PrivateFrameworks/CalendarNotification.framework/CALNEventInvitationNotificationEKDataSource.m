@interface CALNEventInvitationNotificationEKDataSource
+ (int64_t)_spanForNewStatusWithEvent:(id)a3;
- (CALNDataSourceEventRepresentationProvider)dataSourceEventRepresentationProvider;
- (CALNEKCalendarNotificationReferenceProvider)notificationReferenceProvider;
- (CALNEventInvitationNotificationEKDataSource)initWithEventStoreProvider:(id)a3 inboxNotificationProvider:(id)a4 notificationReferenceProvider:(id)a5 remoteMutator:(id)a6 dataSourceEventRepresentationProvider:(id)a7 preferences:(id)a8;
- (CALNInboxNotificationProvider)inboxNotificationProvider;
- (CALNRemoteMutator)remoteMutator;
- (EKEventStoreProvider)eventStoreProvider;
- (EKNotificationPreferences)preferences;
- (id)_notificationInfoFromNotification:(id)a3 inEventStore:(id)a4;
- (id)fetchEventInvitationNotificationSourceClientIdentifiers:(id)a3;
- (id)fetchEventInvitationNotificationWithSourceClientIdentifier:(id)a3;
- (id)fetchEventInvitationNotifications;
- (void)_setParticipantStatus:(int64_t)a3 withSourceClientIdentifier:(id)a4;
- (void)acceptEventInvitationWithSourceClientIdentifier:(id)a3;
- (void)clearEventInvitationWithSourceClientIdentifier:(id)a3;
- (void)declineEventInvitationWithSourceClientIdentifier:(id)a3;
- (void)reportEventInvitationAsJunkWithSourceClientIdentifier:(id)a3;
- (void)tentativeAcceptEventInvitationWithSourceClientIdentifier:(id)a3;
@end

@implementation CALNEventInvitationNotificationEKDataSource

- (CALNEventInvitationNotificationEKDataSource)initWithEventStoreProvider:(id)a3 inboxNotificationProvider:(id)a4 notificationReferenceProvider:(id)a5 remoteMutator:(id)a6 dataSourceEventRepresentationProvider:(id)a7 preferences:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CALNEventInvitationNotificationEKDataSource;
  v18 = [(CALNEventInvitationNotificationEKDataSource *)&v24 init];
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

- (id)fetchEventInvitationNotifications
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(CALNEventInvitationNotificationEKDataSource *)self fetchEventInvitationNotificationSourceClientIdentifiers:0];
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
        v10 = -[CALNEventInvitationNotificationEKDataSource fetchEventInvitationNotificationWithSourceClientIdentifier:](self, "fetchEventInvitationNotificationWithSourceClientIdentifier:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
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
    _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, "Fetched event invitation notification infos. Found %{public}@ notifications", buf, 0xCu);
  }
  v13 = (void *)[v4 copy];

  return v13;
}

- (id)fetchEventInvitationNotificationSourceClientIdentifiers:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNEventInvitationNotificationEKDataSource *)self preferences];
  int v6 = [v5 invitationNotificationsDisabled];

  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    goto LABEL_23;
  }
  uint64_t v8 = [(CALNEventInvitationNotificationEKDataSource *)self inboxNotificationProvider];
  v9 = [v8 eventNotificationReferences];

  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v11) {
    goto LABEL_22;
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
          if (v20 && ([v19 hiddenFromNotificationCenter] & 1) == 0)
          {
            if ([v19 type])
            {
              uint64_t v21 = [v19 type];

              if (v21 != 1) {
                goto LABEL_19;
              }
            }
            else
            {
            }
            v20 = +[CALNNotificationDataSourceUtils sourceClientIdentifierForNotification:v19];
            [v7 addObject:v20];
          }

LABEL_19:
          continue;
        }
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v12);
LABEL_22:

LABEL_23:
  return v7;
}

- (id)fetchEventInvitationNotificationWithSourceClientIdentifier:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNEventInvitationNotificationEKDataSource *)self eventStoreProvider];
  int v6 = [v5 eventStore];

  uint64_t v7 = [(CALNEventInvitationNotificationEKDataSource *)self notificationReferenceProvider];
  uint64_t v8 = +[CALNNotificationDataSourceUtils notificationReferenceOfType:0 withSourceClientIdentifier:v4 inEventStore:v6 withNotificationReferenceProvider:v7];

  if (v8)
  {
    v9 = [v8 notification];
    if (v9)
    {
      id v10 = [(CALNEventInvitationNotificationEKDataSource *)self _notificationInfoFromNotification:v9 inEventStore:v6];
      uint64_t v11 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138543618;
        id v26 = v4;
        __int16 v27 = 2112;
        uint64_t v28 = v10;
        _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, "Fetched event invitation notification info with sourceClientIdentifier: %{public}@ info: %@", (uint8_t *)&v25, 0x16u);
      }
    }
    else
    {
      uint64_t v11 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CALNEventInvitationNotificationEKDataSource fetchEventInvitationNotificationWithSourceClientIdentifier:]((uint64_t)v4, v11, v18, v19, v20, v21, v22, v23);
      }
      id v10 = 0;
    }
  }
  else
  {
    v9 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CALNEventInvitationNotificationEKDataSource fetchEventInvitationNotificationWithSourceClientIdentifier:]((uint64_t)v4, v9, v12, v13, v14, v15, v16, v17);
    }
    id v10 = 0;
  }

  return v10;
}

- (void)clearEventInvitationWithSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  id v7 = [(CALNEventInvitationNotificationEKDataSource *)self eventStoreProvider];
  id v5 = [v7 eventStore];
  int v6 = [(CALNEventInvitationNotificationEKDataSource *)self notificationReferenceProvider];
  +[CALNEventInvitationNotificationDataSourceUtils clearEventInvitationOfType:0 withSourceClientIdentifier:v4 inEventStore:v5 withNotificationReferenceProvider:v6];
}

- (void)acceptEventInvitationWithSourceClientIdentifier:(id)a3
{
}

- (void)declineEventInvitationWithSourceClientIdentifier:(id)a3
{
}

- (void)tentativeAcceptEventInvitationWithSourceClientIdentifier:(id)a3
{
}

- (void)reportEventInvitationAsJunkWithSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNEventInvitationNotificationEKDataSource *)self eventStoreProvider];
  int v6 = [v5 eventStore];

  id v7 = [(CALNEventInvitationNotificationEKDataSource *)self notificationReferenceProvider];
  uint64_t v8 = +[CALNEventInvitationNotificationDataSourceUtils eventForNotificationOfType:0 withSourceClientIdentifier:v4 inEventStore:v6 withNotificationReferenceProvider:v7];

  if (v8)
  {
    [v8 setIsJunk:1 shouldSave:1];
  }
  else
  {
    v9 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CALNEventInvitationNotificationEKDataSource reportEventInvitationAsJunkWithSourceClientIdentifier:]((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (id)_notificationInfoFromNotification:(id)a3 inEventStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v29 = +[CALNNotificationDataSourceUtils sourceClientIdentifierForNotification:v6];
  uint64_t v8 = +[CALNEventInvitationNotificationDataSourceUtils expirationDateForEventInvitation:v6];
  uint64_t v28 = v7;
  v9 = +[CALNEventInvitationNotificationDataSourceUtils eventForEventInvitation:v6 inEventStore:v7];
  if (v9)
  {
    [v6 URL];
    uint64_t v10 = v27 = v8;
    id v26 = [v10 absoluteString];

    int v25 = CUIKLaunchURLForEventInvitation();
    uint64_t v11 = [v9 calendar];
    long long v24 = [v11 source];

    char v12 = [v24 isDelegate];
    uint64_t v23 = [v24 title];
    uint64_t v21 = [v24 uniqueIdentifier];
    uint64_t v22 = [v9 scanForConflicts];
    uint64_t v13 = [(CALNEventInvitationNotificationEKDataSource *)self dataSourceEventRepresentationProvider];
    uint64_t v14 = [v9 startDate];
    uint64_t v15 = [v9 endDate];
    uint64_t v16 = [v28 timeZone];
    uint64_t v17 = [v13 eventRepresentationDictionaryForInvitationNotification:v6 event:v9 date:v14 endDate:v15 timeZone:v16];

    uint64_t v8 = v27;
    LOBYTE(v20) = v12;
    uint64_t v18 = [[CALNEventInvitationNotificationInfo alloc] initWithSourceClientIdentifier:v29 launchURL:v25 expirationDate:v27 conflictDetails:v22 eventInvitationNotification:v6 eventRepresentationDictionary:v17 eventURI:v26 isDelegate:v20 sourceTitle:v23 sourceIdentifier:v21];
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (void)_setParticipantStatus:(int64_t)a3 withSourceClientIdentifier:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(CALNEventInvitationNotificationEKDataSource *)self eventStoreProvider];
  uint64_t v8 = [v7 eventStore];

  v9 = [(CALNEventInvitationNotificationEKDataSource *)self notificationReferenceProvider];
  uint64_t v10 = +[CALNEventInvitationNotificationDataSourceUtils eventForNotificationOfType:0 withSourceClientIdentifier:v6 inEventStore:v8 withNotificationReferenceProvider:v9];

  if (v10)
  {
    [v10 setParticipationStatus:a3];
    [v10 setInvitationStatus:0];
    uint64_t v11 = [(id)objc_opt_class() _spanForNewStatusWithEvent:v10];
    char v12 = [(CALNEventInvitationNotificationEKDataSource *)self remoteMutator];
    [v12 setParticipantStatus:a3 span:v11 event:v10];

    id v17 = 0;
    LOBYTE(v11) = [v8 saveEvent:v10 span:v11 error:&v17];
    uint64_t v13 = v17;
    if ((v11 & 1) == 0)
    {
      uint64_t v14 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = [v10 externalURI];
        uint64_t v16 = [NSNumber numberWithInteger:a3];
        *(_DWORD *)buf = 138543874;
        uint64_t v19 = v15;
        __int16 v20 = 2114;
        uint64_t v21 = v16;
        __int16 v22 = 2112;
        uint64_t v23 = v13;
        _os_log_error_impl(&dword_2216BB000, v14, OS_LOG_TYPE_ERROR, "Failed to save event (%{public}@) when setting participant status (%{public}@): %@", buf, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v13 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CALNEventInvitationNotificationEKDataSource _setParticipantStatus:withSourceClientIdentifier:]((uint64_t)v6, a3, v13);
    }
  }
}

+ (int64_t)_spanForNewStatusWithEvent:(id)a3
{
  id v3 = a3;
  if ([v3 responseMustApplyToAll])
  {
    int64_t v4 = 4;
  }
  else if ([v3 hasRecurrenceRules])
  {
    int64_t v4 = 4;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
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

- (void)fetchEventInvitationNotificationWithSourceClientIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fetchEventInvitationNotificationWithSourceClientIdentifier:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, a2, a3, "Failed to get notification from notification reference. sourceClientIdentifier = %{public}@", a5, a6, a7, a8, 2u);
}

- (void)reportEventInvitationAsJunkWithSourceClientIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_setParticipantStatus:(NSObject *)a3 withSourceClientIdentifier:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [NSNumber numberWithInteger:a2];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_2216BB000, a3, OS_LOG_TYPE_ERROR, "Failed to get event (%{public}@) when attempting to set participant status to %{public}@", (uint8_t *)&v6, 0x16u);
}

@end