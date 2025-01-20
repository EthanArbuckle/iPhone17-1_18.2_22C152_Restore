@interface CALNSuggestedEventNotificationEKDataSource
- (CALNEKCalendarNotificationReferenceProvider)notificationReferenceProvider;
- (CALNInboxNotificationProvider)inboxNotificationProvider;
- (CALNSuggestedEventNotificationEKDataSource)initWithEventStoreProvider:(id)a3 inboxNotificationProvider:(id)a4 notificationReferenceProvider:(id)a5;
- (EKEventStoreProvider)eventStoreProvider;
- (id)_eventForSourceClientIdentifier:(id)a3 eventStore:(id)a4;
- (id)_notificationInfoFromNotification:(id)a3 inEventStore:(id)a4;
- (id)fetchSuggestedEventNotificationObjectIDs;
- (id)fetchSuggestedEventNotificationWithObjectID:(id)a3;
- (id)fetchSuggestedEventNotifications;
- (id)fetchSuggestedEventNotificationsWithSourceClientIdentifier:(id)a3;
- (void)_acknowledgeSuggestedEventWithSourceClientIdentifier:(id)a3 accept:(BOOL)a4;
- (void)_clearSuggestedEventNotificationWithObjectID:(id)a3;
- (void)clearSuggestedEventNotificationWithSourceClientIdentifier:(id)a3;
- (void)confirmSuggestedEventWithSourceClientIdentifier:(id)a3;
- (void)deleteCanceledSuggestedEventWithSourceClientIdentifier:(id)a3;
- (void)fetchSuggestedEventNotificationObjectIDs;
- (void)ignoreSuggestedEventWithSourceClientIdentifier:(id)a3;
@end

@implementation CALNSuggestedEventNotificationEKDataSource

- (CALNSuggestedEventNotificationEKDataSource)initWithEventStoreProvider:(id)a3 inboxNotificationProvider:(id)a4 notificationReferenceProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CALNSuggestedEventNotificationEKDataSource;
  v12 = [(CALNSuggestedEventNotificationEKDataSource *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_eventStoreProvider, a3);
    objc_storeStrong((id *)&v13->_inboxNotificationProvider, a4);
    objc_storeStrong((id *)&v13->_notificationReferenceProvider, a5);
  }

  return v13;
}

- (id)fetchSuggestedEventNotifications
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(CALNSuggestedEventNotificationEKDataSource *)self fetchSuggestedEventNotificationObjectIDs];
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
        id v10 = -[CALNSuggestedEventNotificationEKDataSource fetchSuggestedEventNotificationWithObjectID:](self, "fetchSuggestedEventNotificationWithObjectID:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
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
    uint64_t v12 = [v4 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v20 = v12;
    _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, "Fetched (%lu) suggested event notifications", buf, 0xCu);
  }

  v13 = (void *)[v4 copy];
  return v13;
}

- (id)fetchSuggestedEventNotificationObjectIDs
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = [(CALNSuggestedEventNotificationEKDataSource *)self inboxNotificationProvider];
  v3 = [v2 eventNotificationReferences];

  v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * v9);
        if ([v10 type] == 5)
        {
          id v11 = [v10 notification];
          uint64_t v12 = v11;
          if (v11)
          {
            v13 = [v11 URL];
            if (v13 && [v12 needsAlert])
            {
              if ([v12 type] == 12 || objc_msgSend(v12, "type") == 14)
              {

                goto LABEL_13;
              }
              uint64_t v15 = [v12 type];

              if (v15 != 13)
              {
LABEL_17:

                goto LABEL_18;
              }
LABEL_13:
              v13 = [v12 objectID];
              v14 = [v13 stringRepresentation];
              [v4 addObject:v14];
            }
          }
          else
          {
            v13 = +[CALNLogSubsystem calendar];
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              [(CALNSuggestedEventNotificationEKDataSource *)&v18 fetchSuggestedEventNotificationObjectIDs];
            }
          }

          goto LABEL_17;
        }
LABEL_18:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v16 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v7 = v16;
    }
    while (v16);
  }

  return v4;
}

- (id)fetchSuggestedEventNotificationsWithSourceClientIdentifier:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNSuggestedEventNotificationEKDataSource *)self eventStoreProvider];
  uint64_t v6 = [v5 eventStore];

  v28 = v4;
  v27 = [v6 predicateForEventsCreatedFromSuggestionWithExtractionGroupIdentifier:v4];
  uint64_t v7 = objc_msgSend(v6, "eventsMatchingPredicate:");
  uint64_t v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v35 + 1) + 8 * i) eventIdentifier];
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [(CALNSuggestedEventNotificationEKDataSource *)self fetchSuggestedEventNotificationObjectIDs];
  uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v15, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = [(CALNSuggestedEventNotificationEKDataSource *)self fetchSuggestedEventNotificationWithObjectID:*(void *)(*((void *)&v31 + 1) + 8 * j)];
        if (v22) {
          [v16 addObject:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v19);
  }

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __105__CALNSuggestedEventNotificationEKDataSource_fetchSuggestedEventNotificationsWithSourceClientIdentifier___block_invoke;
  v29[3] = &unk_2645C12C0;
  id v30 = v8;
  id v23 = v8;
  v24 = [v16 indexesOfObjectsPassingTest:v29];
  uint64_t v25 = [v16 objectsAtIndexes:v24];

  return v25;
}

uint64_t __105__CALNSuggestedEventNotificationEKDataSource_fetchSuggestedEventNotificationsWithSourceClientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 suggestionNotification];
  id v4 = [v3 eventID];

  uint64_t v5 = [*(id *)(a1 + 32) containsObject:v4];
  return v5;
}

- (id)fetchSuggestedEventNotificationWithObjectID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(CALNSuggestedEventNotificationEKDataSource *)self eventStoreProvider];
  uint64_t v6 = [v5 eventStore];

  uint64_t v7 = [(CALNSuggestedEventNotificationEKDataSource *)self notificationReferenceProvider];
  uint64_t v8 = +[CALNNotificationDataSourceUtils notificationReferenceOfType:5 withSourceClientIdentifier:v4 inEventStore:v6 withNotificationReferenceProvider:v7];

  if (v8)
  {
    id v9 = [v8 notification];
    if (v9)
    {
      uint64_t v10 = [(CALNSuggestedEventNotificationEKDataSource *)self _notificationInfoFromNotification:v9 inEventStore:v6];
      uint64_t v11 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543618;
        id v14 = v4;
        __int16 v15 = 2112;
        uint64_t v16 = v10;
        _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, "Fetched suggested event notification with objectID = %{public}@, notification info = %@", (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      uint64_t v11 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CALNSuggestedEventNotificationEKDataSource fetchSuggestedEventNotificationWithObjectID:]();
      }
      uint64_t v10 = 0;
    }
  }
  else
  {
    id v9 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CALNSuggestedEventNotificationEKDataSource fetchSuggestedEventNotificationWithObjectID:]();
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)confirmSuggestedEventWithSourceClientIdentifier:(id)a3
{
}

- (void)ignoreSuggestedEventWithSourceClientIdentifier:(id)a3
{
}

- (void)deleteCanceledSuggestedEventWithSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CALNSuggestedEventNotificationEKDataSource *)self eventStoreProvider];
  uint64_t v6 = [v5 eventStore];

  uint64_t v7 = [(CALNSuggestedEventNotificationEKDataSource *)self _eventForSourceClientIdentifier:v4 eventStore:v6];
  if (v7)
  {
    id v11 = 0;
    char v8 = [v6 removeEvent:v7 span:2 error:&v11];
    id v9 = v11;
    if ((v8 & 1) == 0)
    {
      uint64_t v10 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CALNSuggestedEventNotificationEKDataSource deleteCanceledSuggestedEventWithSourceClientIdentifier:]();
      }
    }
  }
  else
  {
    id v9 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CALNSuggestedEventNotificationEKDataSource deleteCanceledSuggestedEventWithSourceClientIdentifier:]();
    }
  }
}

- (void)clearSuggestedEventNotificationWithSourceClientIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v4;
    _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, "Clearing suggested event notification with source client identifier = %{public}@", buf, 0xCu);
  }

  uint64_t v6 = [(CALNSuggestedEventNotificationEKDataSource *)self fetchSuggestedEventNotificationObjectIDs];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(CALNSuggestedEventNotificationEKDataSource *)self _clearSuggestedEventNotificationWithObjectID:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_clearSuggestedEventNotificationWithObjectID:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v4;
    _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, "Clearing suggested event notification with object ID = %{public}@", buf, 0xCu);
  }

  uint64_t v6 = [(CALNSuggestedEventNotificationEKDataSource *)self eventStoreProvider];
  uint64_t v7 = [v6 eventStore];

  uint64_t v8 = [(CALNSuggestedEventNotificationEKDataSource *)self notificationReferenceProvider];
  uint64_t v9 = +[CALNNotificationDataSourceUtils notificationReferenceOfType:5 withSourceClientIdentifier:v4 inEventStore:v7 withNotificationReferenceProvider:v8];

  if (v9)
  {
    uint64_t v10 = [v9 notification];
    long long v11 = v10;
    if (v10)
    {
      long long v12 = [v10 resourceChangeFromEventStore:v7];
      if (v12)
      {
        id v18 = 0;
        char v13 = [v7 markResourceChangeAlertedAndSave:v12 error:&v18];
        long long v14 = v18;
        __int16 v15 = +[CALNLogSubsystem calendar];
        uint64_t v16 = v15;
        if (v13)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = [v11 objectID];
            *(_DWORD *)buf = 138543362;
            id v20 = v17;
            _os_log_impl(&dword_2216BB000, v16, OS_LOG_TYPE_DEFAULT, "Cleared suggested event notification with objectID %{public}@", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          -[CALNSuggestedEventNotificationEKDataSource _clearSuggestedEventNotificationWithObjectID:].cold.4(v11);
        }
      }
      else
      {
        long long v14 = +[CALNLogSubsystem calendar];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[CALNSuggestedEventNotificationEKDataSource _clearSuggestedEventNotificationWithObjectID:](v11);
        }
      }
    }
    else
    {
      long long v12 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CALNSuggestedEventNotificationEKDataSource _clearSuggestedEventNotificationWithObjectID:]();
      }
    }
  }
  else
  {
    long long v11 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CALNSuggestedEventNotificationEKDataSource fetchSuggestedEventNotificationWithObjectID:]();
    }
  }
}

- (void)_acknowledgeSuggestedEventWithSourceClientIdentifier:(id)a3 accept:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(CALNSuggestedEventNotificationEKDataSource *)self eventStoreProvider];
  uint64_t v8 = [v7 eventStore];

  uint64_t v9 = [(CALNSuggestedEventNotificationEKDataSource *)self _eventForSourceClientIdentifier:v6 eventStore:v8];
  uint64_t v10 = v9;
  if (v9)
  {
    if (v4)
    {
      [v8 acceptSuggestedEvent:v9];
      long long v11 = (void *)MEMORY[0x263F30090];
      long long v12 = [v10 suggestionInfo];
      char v13 = [v12 uniqueKey];
      [v11 logEventConfirmedNotificationWithUniqueKey:v13];
    }
    else
    {
      __int16 v15 = (void *)MEMORY[0x263F30090];
      uint64_t v16 = [v9 suggestionInfo];
      id v17 = [v16 uniqueKey];
      [v15 logEventRejectedNotificationWithUniqueKey:v17];

      [v8 deleteSuggestedEvent:v10];
    }
  }
  else
  {
    long long v14 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CALNSuggestedEventNotificationEKDataSource _acknowledgeSuggestedEventWithSourceClientIdentifier:accept:]();
    }
  }
}

- (id)_eventForSourceClientIdentifier:(id)a3 eventStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 predicateForEventsCreatedFromSuggestionWithExtractionGroupIdentifier:v5];
  uint64_t v8 = [v6 eventsMatchingPredicate:v7];

  uint64_t v9 = (void *)MEMORY[0x263EFFA68];
  if (v8) {
    uint64_t v9 = v8;
  }
  id v10 = v9;

  if ((unint64_t)[v10 count] >= 2)
  {
    long long v11 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CALNSuggestedEventNotificationEKDataSource _eventForSourceClientIdentifier:eventStore:]((uint64_t)v5, v10);
    }
  }
  long long v12 = [v10 firstObject];

  return v12;
}

- (id)_notificationInfoFromNotification:(id)a3 inEventStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 suggestedEvent];
  uint64_t v8 = [v7 origin];
  uint64_t v9 = [v8 externalKey];

  if (v9)
  {
    id v10 = +[CALNResourceChangedNotificationDataSourceUtils expirationDateForNotification:v5];
    long long v11 = +[CALNResourceChangedNotificationDataSourceUtils launchURLForNotification:v5 inEventStore:v6];
    long long v12 = [[CALNSuggestedEventNotificationInfo alloc] initWithSourceClientIdentifier:v9 launchURL:v11 expirationDate:v10 suggestionNotification:v5];
  }
  else
  {
    char v13 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CALNSuggestedEventNotificationEKDataSource _notificationInfoFromNotification:inEventStore:](v5);
    }

    long long v12 = 0;
  }

  return v12;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationReferenceProvider, 0);
  objc_storeStrong((id *)&self->_inboxNotificationProvider, 0);
  objc_storeStrong((id *)&self->_eventStoreProvider, 0);
}

- (void)fetchSuggestedEventNotificationObjectIDs
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_2216BB000, log, OS_LOG_TYPE_ERROR, "Failed to get notification from notification reference.", buf, 2u);
}

- (void)fetchSuggestedEventNotificationWithObjectID:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to get suggested event notification reference with objectID %{public}@", v2, v3, v4, v5, v6);
}

- (void)fetchSuggestedEventNotificationWithObjectID:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to get suggested event notification from notification reference. objectID = %{public}@", v2, v3, v4, v5, v6);
}

- (void)deleteCanceledSuggestedEventWithSourceClientIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Could not get event. Cannot delete suggested event for source client identifier = %{public}@", v2, v3, v4, v5, v6);
}

- (void)deleteCanceledSuggestedEventWithSourceClientIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Error deleting canceled suggested event: %@", v2, v3, v4, v5, v6);
}

- (void)_clearSuggestedEventNotificationWithObjectID:.cold.2()
{
  v0 = [0 objectID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_3(&dword_2216BB000, v1, v2, "Failed to get notification object from notification reference. Bailing. notification objectID = %@", v3, v4, v5, v6, v7);
}

- (void)_clearSuggestedEventNotificationWithObjectID:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 objectID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_3(&dword_2216BB000, v2, v3, "Failed to get resource change for notification with objectID %{public}@", v4, v5, v6, v7, v8);
}

- (void)_clearSuggestedEventNotificationWithObjectID:(void *)a1 .cold.4(void *a1)
{
  uint64_t v1 = [a1 objectID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2216BB000, v2, v3, "Failed to mark resource change as alerted for notification with objectID %{public}@, error = %@", v4, v5, v6, v7, v8);
}

- (void)_acknowledgeSuggestedEventWithSourceClientIdentifier:accept:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Could not get event. Cannot acknowledge event for source client identifier = %{public}@", v2, v3, v4, v5, v6);
}

- (void)_eventForSourceClientIdentifier:(uint64_t)a1 eventStore:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  [a2 count];
  OUTLINED_FUNCTION_0(&dword_2216BB000, v2, v3, "Unexpectedly found more than 1 event with extraction group identifier = %{public}@. Found (%lu) events", v4, v5, v6, v7, 2u);
}

- (void)_notificationInfoFromNotification:(void *)a1 inEventStore:.cold.1(void *a1)
{
  uint64_t v1 = [a1 objectID];
  uint64_t v2 = [v1 stringRepresentation];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_3(&dword_2216BB000, v3, v4, "Cannot create notification info from notification without source client identifier, notification object ID = %{public}@", v5, v6, v7, v8, v9);
}

@end