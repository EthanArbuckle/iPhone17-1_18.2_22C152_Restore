@interface CADNotificationUtilities
+ (BOOL)_storeIsDelegate:(void *)a3;
+ (BOOL)storeIsReadOnlyDelegate:(void *)a3;
+ (id)_attendeeObjectIDsFromNotifications:(id)a3;
+ (id)_notificationTypesFromNotifications:(id)a3;
+ (id)_objectIDsFromNotifications:(id)a3;
+ (id)_occurrenceDatesFromNotifications:(id)a3;
+ (id)_stringForNotificationType:(int)a3;
+ (id)flattenedNotificationsFromNotifications:(id)a3 expanded:(BOOL)a4;
+ (int)CADDatabaseGetEventNotificationItemsWithConnection:(id)a3 afterDate:(id)a4 forSourceWithExternalIdentifier:(id)a5 excludingDelegateSources:(BOOL)a6 excludingUncheckedCalendars:(BOOL)a7 filteredByShowsNotificationsFlag:(BOOL)a8 expanded:(BOOL)a9 earliestExpirationDate:(id *)a10 notificationTypes:(id *)a11 objectIDs:(id *)a12 occurrenceDates:(id *)a13 attendeeObjectIDs:(id *)a14;
+ (int)_gatherEventInvitationsAndRepliesWithContext:(id)a3;
+ (int)_gatherSharedCalendarInvitationsWithContext:(id)a3;
+ (int)_gatherSharedCalendarInviteReplyNotification:(void *)a3 withContext:(id)a4 database:(CalDatabase *)a5 databaseID:(int)a6;
+ (int)_gatherSharedCalendarResourceChangeNotification:(void *)a3 withContext:(id)a4 database:(CalDatabase *)a5 databaseID:(int)a6;
+ (int)_gatherSharedCalendarResponsesAndResourceChangesWithContext:(id)a3;
+ (int)_gatherSuggestionResourceChangeNotification:(void *)a3 withContext:(id)a4 database:(CalDatabase *)a5 databaseID:(int)a6;
+ (void)_logNotificationCountsForNotifications:(id)a3;
@end

@implementation CADNotificationUtilities

void __88__CADNotificationUtilities__gatherSharedCalendarResponsesAndResourceChangesWithContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = (id)CalDatabaseCopyOfAllNotifications();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
        int EntityType = CalNotificationGetEntityType();
        if (EntityType == 19)
        {
          int v15 = [*(id *)(a1 + 48) _gatherSuggestionResourceChangeNotification:v12 withContext:*(void *)(a1 + 32) database:a3 databaseID:a2];
          goto LABEL_12;
        }
        int v14 = EntityType;
        if (EntityType == 17)
        {
          int v15 = [*(id *)(a1 + 48) _gatherSharedCalendarResourceChangeNotification:v12 withContext:*(void *)(a1 + 32) database:a3 databaseID:a2];
          goto LABEL_12;
        }
        if (EntityType == 16)
        {
          int v15 = [*(id *)(a1 + 48) _gatherSharedCalendarInviteReplyNotification:v12 withContext:*(void *)(a1 + 32) database:a3 databaseID:a2];
LABEL_12:
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v15;
          goto LABEL_13;
        }
        v16 = (void *)CADNotificationLogHandle;
        if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
        {
          v17 = v16;
          int UID = CalNotificationGetUID();
          *(_DWORD *)buf = 67109376;
          int v26 = UID;
          __int16 v27 = 1024;
          int v28 = v14;
          _os_log_impl(&dword_1BBC88000, v17, OS_LOG_TYPE_DEFAULT, "Skipping notification %d because it's of an unexpected type %d", buf, 0xEu);
        }
LABEL_13:
        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
        {
          *a4 = 1;
          goto LABEL_21;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v19 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
      uint64_t v9 = v19;
    }
    while (v19);
  }
LABEL_21:
}

void __72__CADNotificationUtilities__gatherSharedCalendarInvitationsWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = (id)CalDatabaseCopyOfAllCalendarsInStoreWithOptions();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    double v8 = *MEMORY[0x1E4F57878];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = CalCalendarCopyStore();
        if (v10)
        {
          uint64_t v11 = (const void *)v10;
          char v12 = [*(id *)(a1 + 32) shouldSkipNotificationForStore:v10];
          CFRelease(v11);
          if (v12) {
            continue;
          }
        }
        if ((CalCalendarCanContainEntityType() & 1) == 0)
        {
          v18 = (void *)CADNotificationLogHandle;
          if (!os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT)) {
            continue;
          }
          uint64_t v19 = v18;
          int UID = CalCalendarGetUID();
          *(_DWORD *)buf = 67109120;
          int v30 = UID;
          long long v21 = v19;
          long long v22 = "Skipping shared calendar invitation for calendar %d because it doesn't allow events";
LABEL_17:
          _os_log_impl(&dword_1BBC88000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 8u);

          continue;
        }
        v13 = (const void *)CalCalendarCopyUUID();
        if (!v13)
        {
          long long v23 = (void *)CADNotificationLogHandle;
          if (!os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT)) {
            continue;
          }
          uint64_t v19 = v23;
          int v24 = CalCalendarGetUID();
          *(_DWORD *)buf = 67109120;
          int v30 = v24;
          long long v21 = v19;
          long long v22 = "Skipping shared calendar invitation for calendar %d because it lacks a UUID";
          goto LABEL_17;
        }
        CFRelease(v13);
        uint64_t v14 = CalCalendarGetUID();
        int v15 = (void *)[objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:1 entityID:v14 databaseID:a2];
        v16 = CADNotificationLogHandle;
        if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v30 = v14;
          _os_log_impl(&dword_1BBC88000, v16, OS_LOG_TYPE_DEFAULT, "Including shared calendar invitation %d", buf, 8u);
        }
        v17 = [[CADNotification alloc] initWithType:2 objectID:v15 occurrenceDate:0.0 expirationDate:v8];
        [*(id *)(a1 + 32) addNotification:v17];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v6);
  }
}

void __56__CADNotificationUtilities__objectIDsFromNotifications___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 objectID];
  [v2 addObject:v3];
}

+ (int)CADDatabaseGetEventNotificationItemsWithConnection:(id)a3 afterDate:(id)a4 forSourceWithExternalIdentifier:(id)a5 excludingDelegateSources:(BOOL)a6 excludingUncheckedCalendars:(BOOL)a7 filteredByShowsNotificationsFlag:(BOOL)a8 expanded:(BOOL)a9 earliestExpirationDate:(id *)a10 notificationTypes:(id *)a11 objectIDs:(id *)a12 occurrenceDates:(id *)a13 attendeeObjectIDs:(id *)a14
{
  BOOL v14 = a8;
  BOOL v15 = a7;
  BOOL v16 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  LOBYTE(v34) = a9;
  long long v23 = [[CADNotificationGatheringContext alloc] initWithConnection:v22 afterDate:v21 forSourceWithExternalIdentifier:v20 excludingDelegateSources:v16 excludingUncheckedCalendars:v15 filteredByShowsNotificationsFlag:v14 expanded:v34];

  int v24 = [a1 _gatherEventInvitationsAndRepliesWithContext:v23];
  if (!v24)
  {
    int v24 = [a1 _gatherSharedCalendarInvitationsWithContext:v23];
    if (!v24) {
      int v24 = [a1 _gatherSharedCalendarResponsesAndResourceChangesWithContext:v23];
    }
  }
  long long v25 = objc_opt_class();
  long long v26 = [(CADNotificationGatheringContext *)v23 notifications];
  [v25 _logNotificationCountsForNotifications:v26];

  if (a10)
  {
    *a10 = [(CADNotificationGatheringContext *)v23 earliestExpiringNotification];
  }
  long long v27 = [(CADNotificationGatheringContext *)v23 notifications];
  long long v28 = [a1 flattenedNotificationsFromNotifications:v27 expanded:a9];

  v29 = [a1 _notificationTypesFromNotifications:v28];
  int v30 = [a1 _objectIDsFromNotifications:v28];
  v31 = [a1 _occurrenceDatesFromNotifications:v28];
  uint64_t v32 = [a1 _attendeeObjectIDsFromNotifications:v28];
  if (a11) {
    *a11 = v29;
  }
  if (a12) {
    *a12 = v30;
  }
  if (a13) {
    *a13 = v31;
  }
  if (a14) {
    *a14 = v32;
  }

  return v24;
}

+ (id)flattenedNotificationsFromNotifications:(id)a3 expanded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            BOOL v14 = objc_msgSend(v13, "expandedNotifications", (void)v18);
            uint64_t v15 = [v14 count];

            if (v15)
            {
              BOOL v16 = [v13 expandedNotifications];
              [v7 addObjectsFromArray:v16];
            }
            else
            {
              [v7 addObject:v13];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v10);
      }
    }
    else
    {
      id v7 = v5;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)_occurrenceDatesFromNotifications:(id)a3
{
  if (a3)
  {
    id v3 = (void *)MEMORY[0x1E4F1CA48];
    id v4 = a3;
    id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__CADNotificationUtilities__occurrenceDatesFromNotifications___block_invoke;
    v8[3] = &unk_1E624EBD8;
    id v6 = v5;
    id v9 = v6;
    [v4 enumerateObjectsUsingBlock:v8];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (id)_objectIDsFromNotifications:(id)a3
{
  if (a3)
  {
    id v3 = (void *)MEMORY[0x1E4F1CA48];
    id v4 = a3;
    id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__CADNotificationUtilities__objectIDsFromNotifications___block_invoke;
    v8[3] = &unk_1E624EBD8;
    id v6 = v5;
    id v9 = v6;
    [v4 enumerateObjectsUsingBlock:v8];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (id)_notificationTypesFromNotifications:(id)a3
{
  if (a3)
  {
    id v3 = (void *)MEMORY[0x1E4F1CA48];
    id v4 = a3;
    id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__CADNotificationUtilities__notificationTypesFromNotifications___block_invoke;
    v8[3] = &unk_1E624EBD8;
    id v6 = v5;
    id v9 = v6;
    [v4 enumerateObjectsUsingBlock:v8];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (int)_gatherSharedCalendarResponsesAndResourceChangesWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  id v5 = [v4 connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__CADNotificationUtilities__gatherSharedCalendarResponsesAndResourceChangesWithContext___block_invoke;
  v8[3] = &unk_1E624EC28;
  uint64_t v10 = &v12;
  id v11 = a1;
  id v6 = v4;
  id v9 = v6;
  [v5 withAllDatabasesPerform:v8];

  LODWORD(v5) = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);

  return (int)v5;
}

+ (int)_gatherSharedCalendarInvitationsWithContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__CADNotificationUtilities__gatherSharedCalendarInvitationsWithContext___block_invoke;
  v7[3] = &unk_1E624DC78;
  id v8 = v3;
  id v5 = v3;
  [v4 withAllDatabasesPerform:v7];

  return 0;
}

+ (int)_gatherEventInvitationsAndRepliesWithContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__CADNotificationUtilities__gatherEventInvitationsAndRepliesWithContext___block_invoke;
  v7[3] = &unk_1E624DC78;
  id v8 = v3;
  id v5 = v3;
  [v4 withAllDatabasesPerform:v7];

  return 0;
}

+ (id)_attendeeObjectIDsFromNotifications:(id)a3
{
  if (a3)
  {
    id v3 = (void *)MEMORY[0x1E4F1CA48];
    id v4 = a3;
    id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__CADNotificationUtilities__attendeeObjectIDsFromNotifications___block_invoke;
    v8[3] = &unk_1E624EBD8;
    id v6 = v5;
    id v9 = v6;
    [v4 enumerateObjectsUsingBlock:v8];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

void __64__CADNotificationUtilities__notificationTypesFromNotifications___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(a2, "type"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

+ (void)_logNotificationCountsForNotifications:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28BD0] set];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v28 + 1) + 8 * i) type];
        uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithInt:v11];
        [v5 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v8);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v5;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v25;
    *(void *)&long long v15 = 67240450;
    long long v23 = v15;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v13);
        }
        long long v19 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        int v20 = objc_msgSend(v13, "countForObject:", v19, v23, (void)v24);
        long long v21 = objc_msgSend(a1, "_stringForNotificationType:", objc_msgSend(v19, "intValue"));
        id v22 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v23;
          int v33 = v20;
          __int16 v34 = 2114;
          v35 = v21;
          _os_log_impl(&dword_1BBC88000, v22, OS_LOG_TYPE_ERROR, "Found %{public}d notifications of type %{public}@", buf, 0x12u);
        }
      }
      uint64_t v16 = [v13 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v16);
  }
}

+ (id)_stringForNotificationType:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E624EC88[a3];
  }
  return v3;
}

void __62__CADNotificationUtilities__occurrenceDatesFromNotifications___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  [a2 occurrenceDate];
  objc_msgSend(v3, "numberWithDouble:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v4];
}

void __73__CADNotificationUtilities__gatherEventInvitationsAndRepliesWithContext___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) now];
  double v5 = v4;
  uint64_t v74 = a3;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  obuint64_t j = (id)CalDatabaseCopyOfAllNotifiableEventsInStore();
  uint64_t v6 = [obj countByEnumeratingWithState:&v91 objects:v103 count:16];
  if (!v6)
  {

    goto LABEL_104;
  }
  char v75 = 0;
  uint64_t v8 = *(void *)v92;
  double v9 = *MEMORY[0x1E4F57880];
  double v10 = *MEMORY[0x1E4F57888];
  *(void *)&long long v7 = 67109632;
  long long v73 = v7;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v92 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v91 + 1) + 8 * v11);
      uint64_t v13 = CalEventCopyStore();
      uint64_t v14 = CalCalendarItemCopyCalendar();
      uint64_t v87 = 0;
      v88 = &v87;
      uint64_t v89 = 0x2020000000;
      uint64_t v90 = 0;
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __73__CADNotificationUtilities__gatherEventInvitationsAndRepliesWithContext___block_invoke_2;
      v86[3] = &unk_1E624EC00;
      v86[4] = &v87;
      v86[5] = v13;
      v86[6] = v14;
      long long v15 = (void (**)(void))MEMORY[0x1C1867AB0](v86);
      if (CalStoreIsFacebook())
      {
        uint64_t v16 = (id)CADNotificationLogHandle;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int RowID = CalCalendarItemGetRowID();
          *(_DWORD *)buf = 67109120;
          int v96 = RowID;
          long long v18 = v16;
          long long v19 = "Skipping notifiable event %d because it's in a facebook store";
          goto LABEL_15;
        }
LABEL_16:

        v15[2](v15);
        goto LABEL_17;
      }
      if ((CalStoreGetSupportsIncomingInvitations() & 1) == 0)
      {
        uint64_t v16 = (id)CADNotificationLogHandle;
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        int v21 = CalCalendarItemGetRowID();
        *(_DWORD *)buf = 67109120;
        int v96 = v21;
        long long v18 = v16;
        long long v19 = "Skipping notifiable event %d because it's in a store that doesn't support incoming invitations";
        goto LABEL_15;
      }
      if (CalEventGetJunkStatus() == 1)
      {
        uint64_t v16 = (id)CADNotificationLogHandle;
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        int v20 = CalCalendarItemGetRowID();
        *(_DWORD *)buf = 67109120;
        int v96 = v20;
        long long v18 = v16;
        long long v19 = "Skipping notifiable event %d because it's marked as junk";
LABEL_15:
        _os_log_impl(&dword_1BBC88000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 8u);
        goto LABEL_16;
      }
      id v22 = (const void *)CalStoreCopyUUID();
      if (!v22)
      {
        uint64_t v16 = (id)CADNotificationLogHandle;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v28 = CalCalendarItemGetRowID();
          *(_DWORD *)buf = 67109120;
          int v96 = v28;
          _os_log_impl(&dword_1BBC88000, v16, OS_LOG_TYPE_DEFAULT, "Skipping notifiable event %d because we failed to get the store identifier", buf, 8u);
        }
        goto LABEL_16;
      }
      CFRelease(v22);
      long long v23 = (const void *)CalEventCopyUniqueIdentifier();
      if (!v23)
      {
        long long v24 = (id)CADNotificationLogHandle;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          int v29 = CalCalendarItemGetRowID();
          *(_DWORD *)buf = 67109120;
          int v96 = v29;
          long long v26 = v24;
          long long v27 = "Skipping notifiable event %d because we failed to get the event unique identifier";
LABEL_32:
          _os_log_impl(&dword_1BBC88000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 8u);
        }
LABEL_33:

LABEL_34:
        v15[2](v15);
        goto LABEL_17;
      }
      CFRelease(v23);
      if (([*(id *)(a1 + 32) shouldSkipNotificationForStore:v13] & 1) != 0
        || [*(id *)(a1 + 32) shouldSkipNotificationForCalendar:v14]
        && ![*(id *)(a1 + 32) isEventTimeSensitiveForFocus:v12])
      {
        goto LABEL_34;
      }
      if (CalEventGetParticipationStatus() == 2)
      {
        long long v24 = (id)CADNotificationLogHandle;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = CalCalendarItemGetRowID();
          *(_DWORD *)buf = 67109120;
          int v96 = v25;
          long long v26 = v24;
          long long v27 = "Skipping notifiable event %d because it's been declined";
          goto LABEL_32;
        }
        goto LABEL_33;
      }
      unsigned int InvitationChangedProperties = CalEventGetInvitationChangedProperties();
      if ((InvitationChangedProperties & 0xF0) != 0)
      {
        if (InvitationChangedProperties == 32 && !CalAlertInviteeDeclines())
        {
          uint64_t v16 = (id)CADNotificationLogHandle;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v54 = CalCalendarItemGetRowID();
            *(_DWORD *)buf = 67109120;
            int v96 = v54;
            _os_log_impl(&dword_1BBC88000, v16, OS_LOG_TYPE_DEFAULT, "Skipping notifiable event %d because it's an attendee status change, and the user has disabled those alerts", buf, 8u);
          }
          goto LABEL_16;
        }
        if (CalCalendarItemGetStatus() == 3)
        {
          long long v30 = (id)CADNotificationLogHandle;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            int v31 = CalCalendarItemGetRowID();
            *(_DWORD *)buf = 67109120;
            int v96 = v31;
            _os_log_impl(&dword_1BBC88000, v30, OS_LOG_TYPE_DEFAULT, "Skipping notifiable event %d because it's cancelled", buf, 8u);
          }
LABEL_41:

          CalEventSetNeedsNotification();
          v15[2](v15);
          char v75 = 1;
          goto LABEL_17;
        }
        CFArrayRef v33 = (const __CFArray *)CalCalendarItemCopyAttendees();
        int v79 = InvitationChangedProperties & 0x11F;
        if (v33)
        {
          CalEventGetStartDate();
          double v35 = v34;
          CalEventGetEndDate();
          double v37 = v36;
          uint64_t Count = CFArrayGetCount(v33);
          CFMutableArrayRef Mutable = CFArrayCreateMutable(0, Count, 0);
          CFArrayRef theArray = v33;
          v88[3] = (uint64_t)Mutable;
          if (Count < 1)
          {
            unsigned int v81 = 1;
            double v32 = v9;
          }
          else
          {
            uint64_t v76 = Count;
            CFIndex v40 = 0;
            double v41 = v37 - v35;
            unsigned int v81 = 1;
            double v32 = v9;
            do
            {
              ValueAtIndex = (void *)CFArrayGetValueAtIndex(theArray, v40);
              if ((InvitationChangedProperties & 0x20) != 0 && CalParticipantGetStatusChanged())
              {
                int Status = CalAttendeeGetStatus();
                int v44 = v79;
                if (Status == 2) {
                  int v44 = v79 | 0x20;
                }
                int v79 = v44;
              }
              v45 = (void *)CalCalendarItemCopySelfAttendee();
              if ((InvitationChangedProperties & 0x80) != 0)
              {
                BOOL v46 = CalAttendeeGetProposedStartDateStatus() == 3;
                BOOL v47 = v45 == ValueAtIndex;
                int v48 = v79;
                BOOL v49 = !v46 || !v47;
                if (v46 && v47) {
                  int v48 = v79 | 0x80;
                }
                int v79 = v48;
                unsigned int v50 = v81;
                if (!v49) {
                  unsigned int v50 = 0;
                }
                unsigned int v81 = v50;
              }
              if ((InvitationChangedProperties & 0x40) != 0
                && CalParticipantGetProposedStartDateChanged())
              {
                CalAttendeeGetProposedStartDate();
                double v52 = v51;
                if (v51 == v10)
                {
                  CalParticipantSetProposedStartDateChanged();
                  char v75 = 1;
                }
                else
                {
                  int v53 = MEMORY[0x1C1865010](ValueAtIndex);
                  if (v41 + v52 >= v32) {
                    double v32 = v41 + v52;
                  }
                  CFArrayAppendValue((CFMutableArrayRef)v88[3], (const void *)v53);
                  v79 |= 0x40u;
                }
              }

              ++v40;
            }
            while (v76 != v40);
          }
          CFRelease(theArray);
        }
        else
        {
          unsigned int v81 = 1;
          double v32 = v9;
        }
        if (v79 != InvitationChangedProperties)
        {
          CalEventSetInvitationChangedProperties();
          long long v30 = (id)CADNotificationLogHandle;
          BOOL v55 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
          if (!v79)
          {
            if (v55)
            {
              int v71 = CalCalendarItemGetRowID();
              *(_DWORD *)buf = 67109120;
              int v96 = v71;
              _os_log_impl(&dword_1BBC88000, v30, OS_LOG_TYPE_DEFAULT, "Skipping notifiable event %d because it was marked as having invitation changes, but they were all false positives", buf, 8u);
            }
            goto LABEL_41;
          }
          if (v55)
          {
            unsigned int v56 = CalCalendarItemGetRowID();
            *(_DWORD *)buf = v73;
            int v96 = v79;
            __int16 v97 = 1024;
            unsigned int v98 = InvitationChangedProperties;
            __int16 v99 = 1024;
            unsigned int v100 = v56;
            _os_log_impl(&dword_1BBC88000, v30, OS_LOG_TYPE_DEFAULT, "actualInvitationChangedProperties 0x%x didn't match invitationChangedProperties 0x%x; updating event %d",
              buf,
              0x14u);
          }

          char v75 = 1;
        }
      }
      else
      {
        unsigned int v81 = 0;
        double v32 = v9;
      }
      v57 = (const void *)CalEventOccurrenceCreateForInitialOccurrence();
      CalEventOccurrenceGetDate();
      double v59 = v58;
      CFRelease(v57);
      [*(id *)(a1 + 32) expirationTimestampForEvent:v12 withInitialOccurrenceDate:v74 database:v59];
      if (v60 >= v32) {
        double v32 = v60;
      }
      uint64_t v16 = (id)CADNotificationLogHandle;
      BOOL v61 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v32 <= v5)
      {
        if (v61)
        {
          int v64 = CalCalendarItemGetRowID();
          *(_DWORD *)buf = 67109120;
          int v96 = v64;
          _os_log_impl(&dword_1BBC88000, v16, OS_LOG_TYPE_DEFAULT, "Skipping notifiable event %d because it takes place in the past", buf, 8u);
        }
        goto LABEL_16;
      }
      if (v61)
      {
        int v62 = CalCalendarItemGetRowID();
        *(_DWORD *)buf = 67109888;
        int v96 = v62;
        __int16 v97 = 1024;
        unsigned int v98 = v81;
        __int16 v99 = 1024;
        unsigned int v100 = InvitationChangedProperties;
        __int16 v101 = 2048;
        double v102 = v32;
        _os_log_impl(&dword_1BBC88000, v16, OS_LOG_TYPE_DEFAULT, "Including notifiable event %d with type %d, invitationChangedProperties 0x%x and expiration date %f", buf, 0x1Eu);
      }

      v84 = (void *)[objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:2 entityID:CalCalendarItemGetRowID() databaseID:a2];
      CFArrayRef v63 = (const __CFArray *)v88[3];
      if (v63) {
        CFIndex v80 = CFArrayGetCount(v63);
      }
      else {
        CFIndex v80 = 0;
      }
      int v65 = objc_msgSend(*(id *)(a1 + 32), "expanded", v73);
      if (v80 > 0) {
        int v66 = v65;
      }
      else {
        int v66 = 0;
      }
      if (v66 == 1)
      {
        v67 = [[CADNotification alloc] initWithType:v81 objectID:v84 occurrenceDate:v59 expirationDate:v32];
        CFIndex v68 = 0;
        do
        {
          v69 = objc_msgSend(objc_alloc(MEMORY[0x1E4F57428]), "initWithEntityType:entityID:databaseID:", 7, CFArrayGetValueAtIndex((CFArrayRef)v88[3], v68), a2);
          v70 = [[CADExpandedNotification alloc] initWithType:v81 objectID:v84 occurrenceDate:v69 expirationDate:v59 attendeeObjectID:v32];
          [(CADNotification *)v67 addExpandedNotification:v70];

          ++v68;
        }
        while (v80 != v68);
        [*(id *)(a1 + 32) addNotification:v67];
      }
      else
      {
        v67 = [[CADNotification alloc] initWithType:v81 objectID:v84 occurrenceDate:v59 expirationDate:v32];
        [*(id *)(a1 + 32) addNotification:v67];
      }

      v15[2](v15);
LABEL_17:

      _Block_object_dispose(&v87, 8);
      ++v11;
    }
    while (v11 != v6);
    uint64_t v72 = [obj countByEnumeratingWithState:&v91 objects:v103 count:16];
    uint64_t v6 = v72;
  }
  while (v72);

  if (v75) {
    CalDatabaseSave();
  }
LABEL_104:
}

void __73__CADNotificationUtilities__gatherEventInvitationsAndRepliesWithContext___block_invoke_2(void *a1)
{
  v2 = *(const void **)(*(void *)(a1[4] + 8) + 24);
  if (v2) {
    CFRelease(v2);
  }
  id v3 = (const void *)a1[5];
  if (v3) {
    CFRelease(v3);
  }
  double v4 = (const void *)a1[6];
  if (v4)
  {
    CFRelease(v4);
  }
}

void __64__CADNotificationUtilities__attendeeObjectIDsFromNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 expanded])
  {
    id v3 = *(void **)(a1 + 32);
    double v4 = [v6 attendeeObjectID];
    double v5 = v3;
  }
  else
  {
    double v4 = (void *)[objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:7 entityID:0xFFFFFFFFLL databaseID:0xFFFFFFFFLL];
    double v5 = *(void **)(a1 + 32);
  }
  [v5 addObject:v4];
}

+ (BOOL)storeIsReadOnlyDelegate:(void *)a3
{
  int v3 = objc_msgSend(a1, "_storeIsDelegate:");
  if (v3) {
    LOBYTE(v3) = CalStoreIsWritable() ^ 1;
  }
  return v3;
}

+ (BOOL)_storeIsDelegate:(void *)a3
{
  int v3 = (const void *)CalStoreCopyDelegatedAccountOwnerStoreID();
  double v4 = v3;
  if (v3) {
    CFRelease(v3);
  }
  return v4 != 0;
}

+ (int)_gatherSharedCalendarInviteReplyNotification:(void *)a3 withContext:(id)a4 database:(CalDatabase *)a5 databaseID:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = (const void *)CalInviteReplyNotificationCopyInviteReplyCalendar();
  if (v8) {
    goto LABEL_5;
  }
  CFURLRef v9 = (const __CFURL *)CalInviteReplyNotificationCopyHostURL();
  if (v9)
  {
    uint64_t v8 = v9;
    CFURLGetString(v9);
    uint64_t v10 = CalDatabaseCopyCalendarWithExternalIDInStore();
    if (v10
      || (v18 = CFURLGetString((CFURLRef)v8), (long long v19 = CFStringCreateMutableCopy(0, 0, v18)) != 0)
      && (int v20 = v19,
          CFStringAppend(v19, @"/"),
          uint64_t v10 = CalDatabaseCopyCalendarWithExternalIDInStore(),
          CFRelease(v20),
          v10))
    {
      CFRelease(v8);
      uint64_t v8 = (const void *)v10;
    }
    else
    {
      CFStringRef v21 = CFURLCopyPath((CFURLRef)v8);
      if (!v21) {
        goto LABEL_21;
      }
      CFStringRef v22 = v21;
      MutableCopy = CFStringCreateMutableCopy(0, 0, v21);
      if (MutableCopy)
      {
        long long v24 = MutableCopy;
        CFStringAppend(MutableCopy, @"/");
        uint64_t v25 = CalDatabaseCopyCalendarWithExternalIDInStore();
        CFRelease(v24);
      }
      else
      {
        uint64_t v25 = 0;
      }
      CFRelease(v22);
      CFRelease(v8);
      uint64_t v8 = (const void *)v25;
      if (!v25)
      {
LABEL_22:
        CalNotificationGetCreationDate();
        double v27 = v26 + 2592000.0;
        [v7 now];
        if (v27 >= v28)
        {
          uint64_t UID = CalNotificationGetUID();
          double v35 = (void *)[objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:16 entityID:UID databaseID:v6];
          double v36 = CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            int v40 = 67109120;
            int v41 = UID;
            _os_log_impl(&dword_1BBC88000, v36, OS_LOG_TYPE_DEFAULT, "Including invite reply notification %d", (uint8_t *)&v40, 8u);
          }
          double v37 = [CADNotification alloc];
          uint64_t v38 = [(CADNotification *)v37 initWithType:3 objectID:v35 occurrenceDate:*MEMORY[0x1E4F57888] expirationDate:v27];
          [v7 addNotification:v38];
        }
        else
        {
          int v29 = (void *)CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            long long v30 = v29;
            int v40 = 67109120;
            int v41 = CalNotificationGetUID();
            _os_log_impl(&dword_1BBC88000, v30, OS_LOG_TYPE_DEFAULT, "Skipping invite reply notification %d because it is too old", (uint8_t *)&v40, 8u);
          }
          if ([v7 deleteOldNotifications])
          {
            int v31 = (void *)CADNotificationLogHandle;
            if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              double v32 = v31;
              int v33 = CalNotificationGetUID();
              int v40 = 67109120;
              int v41 = v33;
              _os_log_impl(&dword_1BBC88000, v32, OS_LOG_TYPE_DEFAULT, "Deleting invite reply notification %d because it is too old", (uint8_t *)&v40, 8u);
            }
            CalRemoveNotification();
          }
        }
        goto LABEL_32;
      }
    }
LABEL_5:
    if (CalEntityGetType() == 1 && (CalCalendarCanContainEntityType() & 1) == 0)
    {
      uint64_t v13 = (void *)CADNotificationLogHandle;
      if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = v13;
        int v40 = 67109120;
        int v41 = CalNotificationGetUID();
        _os_log_impl(&dword_1BBC88000, v14, OS_LOG_TYPE_DEFAULT, "Skipping invite reply notification %d because it is on a calendar that does not allow events", (uint8_t *)&v40, 8u);
      }
      goto LABEL_13;
    }
    uint64_t v11 = CalCalendarCopyStore();
    if (v11)
    {
      uint64_t v12 = (const void *)v11;
      if ([v7 shouldSkipNotificationForStore:v11])
      {
        CFRelease(v12);
LABEL_13:
        CFRelease(v8);
        goto LABEL_32;
      }
      char v15 = [v7 shouldSkipNotificationForCalendar:v8];
      CFRelease(v12);
      if (v15) {
        goto LABEL_13;
      }
    }
LABEL_21:
    CFRelease(v8);
    goto LABEL_22;
  }
  uint64_t v16 = (void *)CADNotificationLogHandle;
  if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = v16;
    int v40 = 67109120;
    int v41 = CalNotificationGetUID();
    _os_log_impl(&dword_1BBC88000, v17, OS_LOG_TYPE_DEFAULT, "Skipping invite reply notification %d because it lacks an external ID", (uint8_t *)&v40, 8u);
  }
LABEL_32:

  return 0;
}

+ (int)_gatherSharedCalendarResourceChangeNotification:(void *)a3 withContext:(id)a4 database:(CalDatabase *)a5 databaseID:(int)a6
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  obuint64_t j = (id)CalResourceChangeNotificationCopyChanges();
  uint64_t v7 = [obj countByEnumeratingWithState:&v74 objects:v80 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v75;
    double v10 = *MEMORY[0x1E4F57878];
    double v11 = *MEMORY[0x1E4F57888];
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v75 != v9) {
          objc_enumerationMutation(obj);
        }
        int v13 = CalResourceChangeGetType();
        if (v13 == 5 && CalResourceChangeGetPublicStatus() != 2)
        {
          double v26 = (void *)CADNotificationLogHandle;
          if (!os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_27;
          }
          CFStringRef v22 = v26;
          int v27 = CalResourceChangeGetUID();
          *(_DWORD *)buf = 67109120;
          int v79 = v27;
          long long v24 = v22;
          uint64_t v25 = "Skipping resource change notification %d because it is not public";
          goto LABEL_17;
        }
        uint64_t v14 = CalResourceChangeCopyCalendar();
        if (!v14)
        {
          CFStringRef v21 = (void *)CADNotificationLogHandle;
          if (!os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_27;
          }
          CFStringRef v22 = v21;
          int v23 = CalResourceChangeGetUID();
          *(_DWORD *)buf = 67109120;
          int v79 = v23;
          long long v24 = v22;
          uint64_t v25 = "Skipping resource change notification %d because it has no calendar";
          goto LABEL_17;
        }
        char v15 = (const void *)v14;
        if ((CalCalendarCanContainEntityType() & 1) == 0)
        {
          double v28 = (void *)CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = v28;
            int v29 = CalResourceChangeGetUID();
            *(_DWORD *)buf = 67109120;
            int v79 = v29;
            long long v19 = v17;
            int v20 = "Skipping resource change notification %d because it is on a calendar that does not allow events";
LABEL_20:
            _os_log_impl(&dword_1BBC88000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 8u);
          }
LABEL_21:
          int v30 = 1;
          goto LABEL_23;
        }
        if (CalCalendarIsIgnoringSharedCalendarNotifications())
        {
          uint64_t v16 = (void *)CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = v16;
            int v18 = CalResourceChangeGetUID();
            *(_DWORD *)buf = 67109120;
            int v79 = v18;
            long long v19 = v17;
            int v20 = "Skipping resource change notification %d because it is on a calendar that is ignoring shared calendar notifications";
            goto LABEL_20;
          }
          goto LABEL_21;
        }
        int v30 = 0;
LABEL_23:
        int v31 = v30 | [v6 shouldSkipNotificationForCalendar:v15];
        uint64_t v32 = CalCalendarCopyStore();
        if (v32)
        {
          int v33 = (const void *)v32;
          v31 |= [v6 shouldSkipNotificationForStore:v32];
          CFRelease(v33);
        }
        if (v31) {
          goto LABEL_26;
        }
        if (CalCalendarCanContainEntityType())
        {
          double v34 = CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBC88000, v34, OS_LOG_TYPE_INFO, "Calendar has support for both events and reminders", buf, 2u);
          }
        }
        CFRelease(v15);
        uint64_t v35 = CalResourceChangeCopyCalendarItem();
        if (v35)
        {
          char v15 = (const void *)v35;
          if (CalEntityGetType() != 2)
          {
            BOOL v47 = (void *)CADNotificationLogHandle;
            if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              int v48 = v47;
              int v49 = CalResourceChangeGetUID();
              *(_DWORD *)buf = 67109120;
              int v79 = v49;
              unsigned int v50 = v48;
              double v51 = "Skipping resource change notification %d because it is a change for a non-event";
              goto LABEL_47;
            }
            goto LABEL_26;
          }
          [v6 expirationTimestampForEvent:v15 database:a5];
          double v37 = v36;
          [v6 now];
          if (v37 < v38)
          {
            v39 = (void *)CADNotificationLogHandle;
            if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              int v40 = v39;
              int v41 = CalResourceChangeGetUID();
              *(_DWORD *)buf = 67109120;
              int v79 = v41;
              _os_log_impl(&dword_1BBC88000, v40, OS_LOG_TYPE_DEFAULT, "Skipping resource change notification %d because it is for an event in the past", buf, 8u);
            }
            if ([v6 deleteOldNotifications])
            {
              uint64_t v42 = (void *)CADNotificationLogHandle;
              if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
              {
                v43 = v42;
                int v44 = CalResourceChangeGetUID();
                *(_DWORD *)buf = 67109120;
                int v79 = v44;
                _os_log_impl(&dword_1BBC88000, v43, OS_LOG_TYPE_DEFAULT, "Deleting resource change notification %d because it is for an event in the past", buf, 8u);
              }
              CalRemoveResourceChange();
            }
            goto LABEL_26;
          }
          uint64_t v52 = CalEventCopyStore();
          if (!v52)
          {
            int v62 = (void *)CADNotificationLogHandle;
            if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              int v48 = v62;
              int v63 = CalResourceChangeGetUID();
              *(_DWORD *)buf = 67109120;
              int v79 = v63;
              unsigned int v50 = v48;
              double v51 = "Skipping resource change notification %d because it is for an event not in a store";
              goto LABEL_47;
            }
LABEL_26:
            CFRelease(v15);
            goto LABEL_27;
          }
          int v53 = (const void *)v52;
          int v54 = (const void *)CalStoreCopyUUID();
          if (!v54)
          {
            int v64 = (void *)CADNotificationLogHandle;
            if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              int v65 = v64;
              int v66 = CalResourceChangeGetUID();
              *(_DWORD *)buf = 67109120;
              int v79 = v66;
              _os_log_impl(&dword_1BBC88000, v65, OS_LOG_TYPE_DEFAULT, "Skipping resource change notification %d because it is for an event in a store with no persistent id", buf, 8u);
            }
            CFRelease(v53);
            goto LABEL_26;
          }
          CFRelease(v54);
          CFRelease(v53);
          BOOL v55 = (const void *)CalEventCopyUniqueIdentifier();
          if (!v55)
          {
            v67 = (void *)CADNotificationLogHandle;
            if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              int v48 = v67;
              int v68 = CalResourceChangeGetUID();
              *(_DWORD *)buf = 67109120;
              int v79 = v68;
              unsigned int v50 = v48;
              double v51 = "Skipping resource change notification %d because it is for an event with no unique ID";
LABEL_47:
              _os_log_impl(&dword_1BBC88000, v50, OS_LOG_TYPE_DEFAULT, v51, buf, 8u);
            }
            goto LABEL_26;
          }
          CFRelease(v55);
          CFRelease(v15);
LABEL_52:
          uint64_t v56 = CalResourceChangeGetUID();
          v57 = (void *)[objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:18 entityID:v56 databaseID:a6];
          double v58 = CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            int v79 = v56;
            _os_log_impl(&dword_1BBC88000, v58, OS_LOG_TYPE_DEFAULT, "Including resource change notification %d", buf, 8u);
          }
          double v59 = [[CADNotification alloc] initWithType:4 objectID:v57 occurrenceDate:v11 expirationDate:v37];
          [v6 addNotification:v59];

          goto LABEL_27;
        }
        if (v13 == 2)
        {
          double v60 = (void *)CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v22 = v60;
            int v61 = CalResourceChangeGetUID();
            *(_DWORD *)buf = 67109120;
            int v79 = v61;
            long long v24 = v22;
            uint64_t v25 = "Skipping resource change notification %d because it is an update without an event";
            goto LABEL_17;
          }
        }
        else
        {
          double v37 = v10;
          if (v13 != 1) {
            goto LABEL_52;
          }
          v45 = (void *)CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v22 = v45;
            int v46 = CalResourceChangeGetUID();
            *(_DWORD *)buf = 67109120;
            int v79 = v46;
            long long v24 = v22;
            uint64_t v25 = "Skipping resource change notification %d because it is an add without an event";
LABEL_17:
            _os_log_impl(&dword_1BBC88000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 8u);
          }
        }
LABEL_27:
        ++v12;
      }
      while (v8 != v12);
      uint64_t v69 = [obj countByEnumeratingWithState:&v74 objects:v80 count:16];
      uint64_t v8 = v69;
    }
    while (v69);
  }

  return 0;
}

+ (int)_gatherSuggestionResourceChangeNotification:(void *)a3 withContext:(id)a4 database:(CalDatabase *)a5 databaseID:(int)a6
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = (void *)CalResourceChangeNotificationCopyChanges();
  long long v74 = objc_opt_new();
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v79 objects:v85 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v76 = *(void *)v80;
    double v12 = *MEMORY[0x1E4F57878];
    double v13 = *MEMORY[0x1E4F57888];
    do
    {
      uint64_t v14 = 0;
      uint64_t v75 = v11;
      do
      {
        if (*(void *)v80 != v76) {
          objc_enumerationMutation(v9);
        }
        int v15 = CalResourceChangeGetType();
        uint64_t v16 = CalResourceChangeCopyCalendarItem();
        if (v16)
        {
          uint64_t v17 = (const void *)v16;
          if (CalEntityGetType() != 2)
          {
            int v33 = (void *)CADNotificationLogHandle;
            if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              int v27 = v33;
              int v34 = CalResourceChangeGetUID();
              *(_DWORD *)buf = 67109120;
              int v84 = v34;
              _os_log_impl(&dword_1BBC88000, v27, OS_LOG_TYPE_DEFAULT, "Skipping suggestion resource change notification %d because it is for a non-event", buf, 8u);
              goto LABEL_22;
            }
LABEL_23:
            CFRelease(v17);
            goto LABEL_59;
          }
          [v7 expirationTimestampForEvent:v17 database:a5];
          double v19 = v18;
          [v7 now];
          if (v19 < v20)
          {
            CFStringRef v21 = (void *)CADNotificationLogHandle;
            if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              CFStringRef v22 = v21;
              int v23 = CalResourceChangeGetUID();
              *(_DWORD *)buf = 67109120;
              int v84 = v23;
              _os_log_impl(&dword_1BBC88000, v22, OS_LOG_TYPE_DEFAULT, "Skipping suggestion resource change notification %d because it is for an event in the past", buf, 8u);
            }
            if ([v7 deleteOldNotifications])
            {
              long long v24 = (void *)CADNotificationLogHandle;
              if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v25 = v24;
                int v26 = CalResourceChangeGetUID();
                *(_DWORD *)buf = 67109120;
                int v84 = v26;
                _os_log_impl(&dword_1BBC88000, v25, OS_LOG_TYPE_DEFAULT, "Deleting suggestion resource change notification %d because it is for an event in the past", buf, 8u);
              }
              int v27 = [MEMORY[0x1E4F28ED0] numberWithInt:CPRecordGetID()];
              [v74 addObject:v27];
LABEL_22:
            }
            goto LABEL_23;
          }
          uint64_t v35 = a5;
          id v36 = v9;
          uint64_t v37 = CalEventCopyStore();
          if (v37)
          {
            double v38 = (const void *)v37;
            v39 = (const void *)CalStoreCopyUUID();
            int v40 = v39;
            if (v39)
            {
              CFRelease(v39);
            }
            else
            {
              int v53 = (void *)CADNotificationLogHandle;
              if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
              {
                int v54 = v53;
                int v55 = CalResourceChangeGetUID();
                *(_DWORD *)buf = 67109120;
                int v84 = v55;
                _os_log_impl(&dword_1BBC88000, v54, OS_LOG_TYPE_DEFAULT, "Skipping suggestion resource change notification %d because it is for an event in a store with no persistent id", buf, 8u);
              }
            }
            char v56 = [v7 shouldSkipNotificationForStore:v38];
            CFRelease(v38);
            if (v40 && (v56 & 1) == 0)
            {
              v57 = (const void *)CalEventCopyUniqueIdentifier();
              if (v57)
              {
                CFRelease(v57);
                CFRelease(v17);
                id v9 = v36;
                a5 = v35;
                uint64_t v11 = v75;
LABEL_51:
                uint64_t v66 = CalResourceChangeGetUID();
                int v29 = [objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:18 entityID:v66 databaseID:a6];
                v67 = CADNotificationLogHandle;
                if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  int v84 = v66;
                  _os_log_impl(&dword_1BBC88000, v67, OS_LOG_TYPE_DEFAULT, "Including suggestion resource change notification %d", buf, 8u);
                }
                int v68 = [[CADNotification alloc] initWithType:5 objectID:v29 occurrenceDate:v13 expirationDate:v19];
                [v7 addNotification:v68];

LABEL_54:
                goto LABEL_59;
              }
              uint64_t v69 = (void *)CADNotificationLogHandle;
              if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
              {
                int v49 = v69;
                int v70 = CalResourceChangeGetUID();
                *(_DWORD *)buf = 67109120;
                int v84 = v70;
                double v51 = v49;
                uint64_t v52 = "Skipping suggestion resource change notification %d because it is for an event with no unique ID";
LABEL_57:
                _os_log_impl(&dword_1BBC88000, v51, OS_LOG_TYPE_DEFAULT, v52, buf, 8u);
              }
            }
          }
          else
          {
            int v48 = (void *)CADNotificationLogHandle;
            if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              int v49 = v48;
              int v50 = CalResourceChangeGetUID();
              *(_DWORD *)buf = 67109120;
              int v84 = v50;
              double v51 = v49;
              uint64_t v52 = "Skipping suggestion resource change notification %d because it is for an event not in a store";
              goto LABEL_57;
            }
          }
          CFRelease(v17);
          id v9 = v36;
          a5 = v35;
          uint64_t v11 = v75;
          goto LABEL_59;
        }
        switch(v15)
        {
          case 3:
            v43 = (void *)CADNotificationLogHandle;
            if (!os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_59;
            }
            int v29 = v43;
            int v44 = CalResourceChangeGetUID();
            *(_DWORD *)buf = 67109120;
            int v84 = v44;
            int v31 = v29;
            uint64_t v32 = "Skipping suggestion resource change notification %d because it is a delete (i.e., cancel) without an event";
            goto LABEL_44;
          case 2:
            int v41 = (void *)CADNotificationLogHandle;
            if (!os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_59;
            }
            int v29 = v41;
            int v42 = CalResourceChangeGetUID();
            *(_DWORD *)buf = 67109120;
            int v84 = v42;
            int v31 = v29;
            uint64_t v32 = "Skipping suggestion resource change notification %d because it is an update without an event";
            goto LABEL_44;
          case 1:
            double v28 = (void *)CADNotificationLogHandle;
            if (!os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_59;
            }
            int v29 = v28;
            int v30 = CalResourceChangeGetUID();
            *(_DWORD *)buf = 67109120;
            int v84 = v30;
            int v31 = v29;
            uint64_t v32 = "Skipping suggestion resource change notification %d because it is an add without an event";
LABEL_44:
            _os_log_impl(&dword_1BBC88000, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 8u);
            goto LABEL_54;
        }
        uint64_t v45 = CalResourceChangeCopyCalendar();
        if (!v45)
        {
          double v58 = (void *)CADNotificationLogHandle;
          if (!os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_59;
          }
          int v29 = v58;
          int v59 = CalResourceChangeGetUID();
          *(_DWORD *)buf = 67109120;
          int v84 = v59;
          int v31 = v29;
          uint64_t v32 = "Skipping suggestion resource change notification %d because it has no calendar";
          goto LABEL_44;
        }
        int v46 = (const void *)v45;
        if (CalCalendarCanContainEntityType())
        {
          int v47 = 0;
        }
        else
        {
          double v60 = (void *)CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            int v61 = v60;
            int v62 = CalResourceChangeGetUID();
            *(_DWORD *)buf = 67109120;
            int v84 = v62;
            _os_log_impl(&dword_1BBC88000, v61, OS_LOG_TYPE_DEFAULT, "Skipping suggestion resource change notification %d because it is on a calendar that does not allow events", buf, 8u);
          }
          int v47 = 1;
        }
        int v63 = v47 | [v7 shouldSkipNotificationForCalendar:v46];
        uint64_t v64 = CalCalendarCopyStore();
        if (v64)
        {
          int v65 = (const void *)v64;
          v63 |= [v7 shouldSkipNotificationForStore:v64];
          CFRelease(v65);
        }
        CFRelease(v46);
        double v19 = v12;
        if (!v63) {
          goto LABEL_51;
        }
LABEL_59:
        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v79 objects:v85 count:16];
    }
    while (v11);
  }

  if ([v74 count])
  {
    int v71 = _resourceChangeDeletionQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__CADNotificationUtilities__gatherSuggestionResourceChangeNotification_withContext_database_databaseID___block_invoke;
    block[3] = &unk_1E624E508;
    id v78 = v74;
    dispatch_async(v71, block);
  }
  return 0;
}

void __104__CADNotificationUtilities__gatherSuggestionResourceChangeNotification_withContext_database_databaseID___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = CalDatabaseCreateWithOptions();
  if (v2)
  {
    int v3 = (const void *)v2;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) intValue];
          uint64_t v10 = CalDatabaseCopyResourceChangeWithUID();
          if (v10)
          {
            uint64_t v11 = (const void *)v10;
            double v12 = CADNotificationLogHandle;
            if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)double v13 = 0;
              _os_log_impl(&dword_1BBC88000, v12, OS_LOG_TYPE_DEFAULT, "Removing a resource change due to a pseudo event expiring", v13, 2u);
            }
            CalRemoveResourceChange();
            uint64_t v7 = (v7 + 1);
            CFRelease(v11);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);

      if (v7)
      {
        CalDatabaseSave();
        [MEMORY[0x1E4F57840] trackPseudoEventsExpired:v7];
      }
    }
    else
    {
    }
    CFRelease(v3);
  }
}

@end