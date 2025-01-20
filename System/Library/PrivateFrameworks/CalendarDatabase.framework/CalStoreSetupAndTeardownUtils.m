@interface CalStoreSetupAndTeardownUtils
+ (BOOL)_clearAllEventsFromStore:(void *)a3 inDatabase:(CalDatabase *)a4;
+ (BOOL)_mergeEntityType:(int)a3 fromStore:(void *)a4 toStore:(void *)a5 inDatabase:(CalDatabase *)a6;
+ (BOOL)clearAllEventsFromStoreForParentAccount:(id)a3 withChildren:(id)a4 inDatabase:(CalDatabase *)a5;
+ (BOOL)drainLocalStoreInDatabase:(CalDatabase *)a3;
+ (BOOL)isLocalStoreEmptyInDatabase:(CalDatabase *)a3;
+ (BOOL)isLocalStoreEnabledInDatabase:(CalDatabase *)a3;
+ (BOOL)isReadOnlyAccount:(id)a3;
+ (BOOL)isStoreEmptyForAccount:(id)a3 inDatabase:(CalDatabase *)a4;
+ (BOOL)mergeEventsFromLocalStoreIntoStore:(void *)a3 inDatabase:(CalDatabase *)a4;
+ (BOOL)mergeEventsIntoLocalStoreFromStore:(void *)a3 inDatabase:(CalDatabase *)a4;
+ (BOOL)setUpCalStoreForParentAccount:(id)a3 withChildren:(id)a4 inDatabase:(CalDatabase *)a5;
+ (id)_calDAVInfoStringForTitle:(id)a3;
+ (void)_cleanKeepAwayFromServerCalsInStore:(void *)a3;
+ (void)_copyStoreWithExternalIdentifier:(id)a3 inDatabase:(CalDatabase *)a4;
+ (void)_enableLocalStoreIfNecessaryIgnoringAccount:(id)a3 inDatabase:(CalDatabase *)a4 accountStore:(id)a5;
+ (void)cleanupAuxDatabaseIfNeededForAccountID:(id)a3 auxDatabase:(CalDatabase *)a4 mainDatabase:(CalDatabase *)a5;
+ (void)copyStoreForAccount:(id)a3 withChildren:(id)a4 inDatabase:(CalDatabase *)a5;
+ (void)removeStoreForAccount:(id)a3 withChildren:(id)a4 inDatabase:(CalDatabase *)a5 mainDatabase:(CalDatabase *)a6 accountStore:(id)a7;
+ (void)removeStoreForDeletedAccountWithIdentifier:(id)a3 inDatabase:(CalDatabase *)a4 mainDatabase:(CalDatabase *)a5 accountStore:(id)a6;
+ (void)setLocalStoreEnabled:(BOOL)a3 inDatabase:(CalDatabase *)a4;
@end

@implementation CalStoreSetupAndTeardownUtils

+ (void)_cleanKeepAwayFromServerCalsInStore:(void *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A8E81000, v4, OS_LOG_TYPE_INFO, "Cleaning out keep away from server calendars", buf, 2u);
  }
  CFArrayRef v5 = CalStoreCopyCalendars((uint64_t)a3);
  if (v5)
  {
    CFArrayRef v6 = v5;
    CFIndex Count = CFArrayGetCount(v5);
    if (Count >= 1)
    {
      CFIndex v8 = Count;
      for (CFIndex i = 0; i != v8; ++i)
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(v6, i);
        CFStringRef v11 = (const __CFString *)CalCalendarCopyType((uint64_t)ValueAtIndex);
        if (CalCalendarIsSubscribed((uint64_t)ValueAtIndex)
          || CalCalendarIsInbox((uint64_t)ValueAtIndex)
          || CalCalendarIsNotificationsCollection((uint64_t)ValueAtIndex)
          || CalCalendarGetSharingStatus((uint64_t)ValueAtIndex) == 3
          || v11
          && (CFEqual(v11, @"caldav")
           || CFEqual(v11, @"urlsubscribe"))
          || CalCalendarGetSharingStatus((uint64_t)ValueAtIndex) == 2
          || CalCalendarIsReadOnly((uint64_t)ValueAtIndex))
        {
          v12 = (void *)CalCalendarCopyTitle((uint64_t)ValueAtIndex);
          uint64_t UID = CalCalendarGetUID();
          v14 = (void *)CDBLogHandle;
          if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
          {
            v15 = NSNumber;
            v16 = v14;
            v17 = [v15 numberWithInt:UID];
            *(_DWORD *)buf = 138412546;
            v19 = v12;
            __int16 v20 = 2112;
            v21 = v17;
            _os_log_impl(&dword_1A8E81000, v16, OS_LOG_TYPE_INFO, "Dropping calendar \"%@\" (%@) from merge since we don't want it going up to the server", buf, 0x16u);
          }
          CalRemoveCalendar(ValueAtIndex);
        }
        if (v11) {
          CFRelease(v11);
        }
      }
    }
    CFRelease(v6);
  }
}

+ (BOOL)_mergeEntityType:(int)a3 fromStore:(void *)a4 toStore:(void *)a5 inDatabase:(CalDatabase *)a6
{
  uint64_t v8 = (uint64_t)a4;
  v27[6] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t CountOfCalendarItemsInStore = CalDatabaseGetCountOfCalendarItemsInStore(a6, a3, (uint64_t)a4);
    if (a5) {
      uint64_t v12 = CalDatabaseGetCountOfCalendarItemsInStore(a6, a3, (uint64_t)a5);
    }
    else {
      uint64_t v12 = 0;
    }
    if (a3 == 2) {
      [a1 _cleanKeepAwayFromServerCalsInStore:v8];
    }
    BOOL v13 = CalDatabaseMigrateCalendarsWithEntityType((os_unfair_lock_s *)a6, a3, v8, (uint64_t)a5);
    BOOL v14 = !v13;
    uint64_t v8 = CalDatabaseGetCountOfCalendarItemsInStore(a6, a3, v8);
    if (a5) {
      goto LABEL_10;
    }
LABEL_5:
    uint64_t v15 = 0;
    goto LABEL_11;
  }
  BOOL v13 = 0;
  uint64_t CountOfCalendarItemsInStore = 0;
  BOOL v14 = 0;
  uint64_t v12 = 0;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_10:
  uint64_t v15 = CalDatabaseGetCountOfCalendarItemsInStore(a6, a3, (uint64_t)a5);
LABEL_11:
  BOOL v16 = CountOfCalendarItemsInStore != v15 - v12;
  v26[0] = @"PreMergeSourceCalendarItemCount";
  v17 = [NSNumber numberWithInt:CountOfCalendarItemsInStore];
  v27[0] = v17;
  v26[1] = @"PreMergeDestiniationCalendarItemCount";
  v18 = [NSNumber numberWithInt:v12];
  v27[1] = v18;
  v26[2] = @"PostMergeSourceCalendarItemCount";
  v19 = [NSNumber numberWithInt:v8];
  v27[2] = v19;
  v26[3] = @"PostMergeDestinationCalendarItemCount";
  __int16 v20 = [NSNumber numberWithInt:v15];
  v27[3] = v20;
  v26[4] = @"ErrorCount";
  v21 = [NSNumber numberWithInt:v14];
  v27[4] = v21;
  v26[5] = @"CountMismatch";
  uint64_t v22 = [NSNumber numberWithBool:v16];
  v27[5] = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:6];

  CalAnalyticsSendEvent();
  if (v13) {
    char v24 = CalDatabaseSave((uint64_t)a6);
  }
  else {
    char v24 = 0;
  }

  return v24;
}

+ (BOOL)setUpCalStoreForParentAccount:(id)a3 withChildren:(id)a4 inDatabase:(CalDatabase *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [v8 calSyncingAccountUsingChildAccounts:a4];
  v10 = v9;
  if (v9)
  {
    CFStringRef v11 = [v9 identifier];
    uint64_t v12 = (const void *)[a1 _copyStoreWithExternalIdentifier:v11 inDatabase:a5];

    if (v12)
    {
      BOOL v13 = CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
      {
        LOWORD(v38) = 0;
        _os_log_impl(&dword_1A8E81000, v13, OS_LOG_TYPE_INFO, "Found existing Cal store. Updating...", (uint8_t *)&v38, 2u);
      }
      CalStoreSetAllowsEvents((uint64_t)v12, 1);
      goto LABEL_20;
    }
    Store = CalDatabaseCreateStore((os_unfair_lock_s *)a5);
    uint64_t v15 = CDBLogHandle;
    if (Store)
    {
      uint64_t v12 = Store;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
      {
        BOOL v16 = v15;
        v17 = [v10 identifier];
        int v38 = 138543362;
        v39 = v17;
        _os_log_impl(&dword_1A8E81000, v16, OS_LOG_TYPE_INFO, "Creating new Cal store with External ID: %{public}@", (uint8_t *)&v38, 0xCu);
      }
      v18 = [v10 accountType];
      v19 = [v18 identifier];
      int v20 = [v19 isEqualToString:*MEMORY[0x1E4F17770]];

      if (v20)
      {
        uint64_t v21 = (uint64_t)v12;
        goto LABEL_18;
      }
      v23 = [v10 accountType];
      char v24 = [v23 identifier];
      if ([v24 isEqualToString:*MEMORY[0x1E4F17798]])
      {
      }
      else
      {
        v25 = [v10 accountType];
        v26 = [v25 identifier];
        int v27 = [v26 isEqualToString:*MEMORY[0x1E4F177D0]];

        if (!v27)
        {
          v32 = [v10 accountType];
          v33 = [v32 identifier];
          int v34 = [v33 isEqualToString:*MEMORY[0x1E4F17858]];

          if (!v34)
          {
            v35 = (void *)CDBLogHandle;
            if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
            {
              v36 = v35;
              v37 = [v8 accountType];
              int v38 = 138543362;
              v39 = v37;
              _os_log_impl(&dword_1A8E81000, v36, OS_LOG_TYPE_ERROR, "Don't know what CalStoreType to set for ACAccountType %{public}@", (uint8_t *)&v38, 0xCu);
            }
            goto LABEL_19;
          }
          uint64_t v21 = (uint64_t)v12;
LABEL_18:
          CalStoreSetType(v21);
LABEL_19:
          v28 = [v10 identifier];
          CalStoreSetExternalID((uint64_t)v12);

          v29 = [v10 identifier];
          CalStoreSetUUID((uint64_t)v12, (uint64_t)v29);

          CalStoreSetAllowsEvents((uint64_t)v12, 1);
          v30 = [v8 accountDescription];
          CalStoreSetName((uint64_t)v12);

LABEL_20:
          CFRelease(v12);
          char v22 = CalDatabaseSave((uint64_t)a5);
          goto LABEL_21;
        }
      }
      uint64_t v21 = (uint64_t)v12;
      goto LABEL_18;
    }
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v38) = 0;
      _os_log_impl(&dword_1A8E81000, v15, OS_LOG_TYPE_ERROR, "No new Cal store: CalDatabaseCreateStore failed.", (uint8_t *)&v38, 2u);
    }
  }
  char v22 = 0;
LABEL_21:

  return v22;
}

+ (id)_calDAVInfoStringForTitle:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@-CalDAVInfo", a3];
}

+ (BOOL)_clearAllEventsFromStore:(void *)a3 inDatabase:(CalDatabase *)a4
{
  char v4 = 0;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    CFArrayRef v7 = CalStoreCopyCalendars((uint64_t)a3);
    if (v7)
    {
      CFArrayRef v8 = v7;
      CFIndex Count = CFArrayGetCount(v7);
      if (Count >= 1)
      {
        CFIndex v10 = Count;
        for (CFIndex i = 0; i != v10; ++i)
        {
          ValueAtIndex = (void *)CFArrayGetValueAtIndex(v8, i);
          BOOL v13 = (void *)CalCalendarCopyTitle((uint64_t)ValueAtIndex);
          BOOL v14 = [a1 _calDAVInfoStringForTitle:v13];
          CalDatabaseSetProperty((os_unfair_lock_s *)a4, (uint64_t)v14, 0);
          uint64_t v15 = CDBLogHandle;
          if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v18 = v13;
            _os_log_impl(&dword_1A8E81000, v15, OS_LOG_TYPE_INFO, "Removing calendar with name: %@", buf, 0xCu);
          }
          CalRemoveCalendar(ValueAtIndex);
        }
      }
      char v4 = CalDatabaseSave((uint64_t)a4);
      CFRelease(v8);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

+ (BOOL)clearAllEventsFromStoreForParentAccount:(id)a3 withChildren:(id)a4 inDatabase:(CalDatabase *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [a1 copyStoreForAccount:v8 withChildren:a4 inDatabase:a5];
  if (v9)
  {
    CFIndex v10 = (const void *)v9;
    char v11 = [a1 _clearAllEventsFromStore:v9 inDatabase:a5];
    CFRelease(v10);
  }
  else
  {
    uint64_t v12 = (void *)CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      BOOL v13 = v12;
      BOOL v14 = [v8 identifier];
      int v16 = 138543362;
      v17 = v14;
      _os_log_impl(&dword_1A8E81000, v13, OS_LOG_TYPE_ERROR, "Could not clear events from store for account with identifier %{public}@ because no store was found.", (uint8_t *)&v16, 0xCu);
    }
    char v11 = 0;
  }

  return v11;
}

+ (BOOL)drainLocalStoreInDatabase:(CalDatabase *)a3
{
  if (!a3) {
    return 0;
  }
  CFArrayRef v5 = CalDatabaseCopyLocalStore((uint64_t)a3);
  if (!v5) {
    return 0;
  }
  CFArrayRef v6 = v5;
  char v7 = [a1 _clearAllEventsFromStore:v5 inDatabase:a3];
  CFRelease(v6);
  return v7;
}

+ (void)copyStoreForAccount:(id)a3 withChildren:(id)a4 inDatabase:(CalDatabase *)a5
{
  char v7 = [a3 calSyncingAccountUsingChildAccounts:a4];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 identifier];
    CFIndex v10 = (void *)[a1 _copyStoreWithExternalIdentifier:v9 inDatabase:a5];
  }
  else
  {
    CFIndex v10 = 0;
  }

  return v10;
}

+ (void)_copyStoreWithExternalIdentifier:(id)a3 inDatabase:(CalDatabase *)a4
{
  if (a4) {
    return (void *)CalDatabaseCopyStoreWithExternalID((os_unfair_lock_s *)a4, (const __CFString *)a3);
  }
  else {
    return 0;
  }
}

+ (BOOL)isLocalStoreEnabledInDatabase:(CalDatabase *)a3
{
  if (!a3) {
    return 0;
  }
  v3 = CalDatabaseCopyLocalStore((uint64_t)a3);
  if (!v3) {
    return 0;
  }
  char v4 = v3;
  BOOL v5 = CalStoreAllowsEvents((uint64_t)v3);
  CFRelease(v4);
  return v5;
}

+ (BOOL)isLocalStoreEmptyInDatabase:(CalDatabase *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 1;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v4 = (id)CalDatabaseCopyOfAllStores((os_unfair_lock_s *)a3);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (!CalStoreGetType(v9)
          && CalStoreAllowsEvents(v9)
          && CalDatabaseGetCountOfEventsInStore(a3, v9))
        {
          BOOL v10 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_15:

  return v10;
}

+ (BOOL)isStoreEmptyForAccount:(id)a3 inDatabase:(CalDatabase *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 childAccounts];
  id v8 = (const void *)[a1 copyStoreForAccount:v6 withChildren:v7 inDatabase:a4];

  if (v8)
  {
    if (a4) {
      LOBYTE(a4) = CalDatabaseGetCountOfEventsInStore(a4, (uint64_t)v8) == 0;
    }
    CFRelease(v8);
  }
  else
  {
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

+ (void)setLocalStoreEnabled:(BOOL)a3 inDatabase:(CalDatabase *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a4) {
    return;
  }
  BOOL v5 = a3;
  if (CalDatabaseIsAuxiliaryDatabase((uint64_t)a4))
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:a1 file:@"CalStoreSetupAndTeardownUtils.m" lineNumber:296 description:@"Cannot enable/disable local store in an auxiliary database"];
  }
  id v8 = CalDatabaseCopyLocalStore((uint64_t)a4);
  if (v8)
  {
    uint64_t v9 = v8;
    CFMutableArrayRef v22 = CalStoreCopyCalendars((uint64_t)v8);
    if (CalStoreAllowsEvents((uint64_t)v9) == v5)
    {
      if (!v5)
      {
        char v15 = 0;
LABEL_24:
        CFRelease(v9);

        goto LABEL_25;
      }
      if ([(__CFArray *)v22 count])
      {
        CFRelease(v9);

        return;
      }
    }
    CalStoreSetAllowsEvents((uint64_t)v9, v5);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    BOOL v10 = v22;
    uint64_t v11 = [(__CFArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          CalStoreRemoveCalendar((uint64_t)v9, *(void **)(*((void *)&v27 + 1) + 8 * i));
        }
        uint64_t v12 = [(__CFArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v12);
    }

    if (v5)
    {
      CalCalendarInsertInitialLocalCalendar((os_unfair_lock_s *)a4);
      CFRelease(v9);

LABEL_36:
      CalDatabaseSave((uint64_t)a4);
      return;
    }
    char v15 = 1;
    goto LABEL_24;
  }
  if (v5) {
    return;
  }
  char v15 = 0;
LABEL_25:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int v16 = (id)CalDatabaseCopyOfAllStores((os_unfair_lock_s *)a4);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        if (!CalStoreGetType(*(void *)(*((void *)&v23 + 1) + 8 * j))
          && CalStoreGetUID() != 1)
        {
          CalRemoveStore();
          char v15 = 1;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  if (v15) {
    goto LABEL_36;
  }
}

+ (void)_enableLocalStoreIfNecessaryIgnoringAccount:(id)a3 inDatabase:(CalDatabase *)a4 accountStore:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v28 = a5;
  uint64_t v9 = CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A8E81000, v9, OS_LOG_TYPE_INFO, "Calendars DCO was asked to enable the local store if necessary.", buf, 2u);
  }
  [v28 allAccountTypes];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (!v29) {
    goto LABEL_34;
  }
  long long v24 = a4;
  uint64_t v27 = *(void *)v38;
  uint64_t v32 = *MEMORY[0x1E4F17A80];
  char v26 = 1;
  do
  {
    for (uint64_t i = 0; i != v29; ++i)
    {
      if (*(void *)v38 != v27) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = [v28 accountsWithAccountType:*(void *)(*((void *)&v37 + 1) + 8 * i)];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v43 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v30 = i;
        uint64_t v15 = *(void *)v34;
        while (2)
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v34 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v33 + 1) + 8 * j);
            if (v8
              && ([*(id *)(*((void *)&v33 + 1) + 8 * j) identifier],
                  BOOL v5 = objc_claimAutoreleasedReturnValue(),
                  [v8 identifier],
                  uint64_t v9 = objc_claimAutoreleasedReturnValue(),
                  [v5 isEqualToString:v9]))
            {
            }
            else
            {
              uint64_t v18 = [v17 parentAccountIdentifier];
              if (v18 || ![v17 isEnabledForDataclass:v32]) {
                int v19 = 0;
              }
              else {
                int v19 = [a1 isReadOnlyAccount:v17] ^ 1;
              }

              if (v8)
              {

                if (v19) {
                  goto LABEL_27;
                }
              }
              else if (v19)
              {
LABEL_27:
                int v20 = (void *)CDBLogHandle;
                if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
                {
                  uint64_t v21 = v20;
                  CFMutableArrayRef v22 = [v17 identifier];
                  *(_DWORD *)buf = 138543362;
                  v42 = v22;
                  _os_log_impl(&dword_1A8E81000, v21, OS_LOG_TYPE_INFO, "Account with identifier %{public}@ is syncing calendars. Will not enable local store!", buf, 0xCu);
                }
                char v26 = 0;
                goto LABEL_30;
              }
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v43 count:16];
          if (v14) {
            continue;
          }
          break;
        }
LABEL_30:
        uint64_t i = v30;
      }
    }
    uint64_t v29 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
  }
  while (v29);
  a4 = v24;
  if (v26)
  {
LABEL_34:
    long long v23 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A8E81000, v23, OS_LOG_TYPE_INFO, "Enabling local store for events because we didn't find any syncing accounts", buf, 2u);
    }
    [a1 setLocalStoreEnabled:1 inDatabase:a4];
  }
}

+ (void)cleanupAuxDatabaseIfNeededForAccountID:(id)a3 auxDatabase:(CalDatabase *)a4 mainDatabase:(CalDatabase *)a5
{
  CFTypeRef v7 = CalDatabaseCopyAuxDatabaseAccountForAccountID((os_unfair_lock_s *)a5);
  if (v7)
  {
    id v8 = v7;
    CFTypeRef v9 = CalAuxDatabaseAccountCopyAuxDatabase((uint64_t)v7);
    CalRemoveAuxDatabaseAccount(v8);
    CalDatabaseSave((uint64_t)a5);
    CFRelease(v8);
    if (v9)
    {
      CFArrayRef v10 = CalAuxDatabaseCopyAccounts((uint64_t)v9);
      if (v10)
      {
        CFArrayRef v11 = v10;
        if (!CFArrayGetCount(v10)) {
          CalDatabaseVacuum((uint64_t)a4);
        }
        CFRelease(v11);
      }
      CFRelease(v9);
    }
  }
}

+ (void)removeStoreForAccount:(id)a3 withChildren:(id)a4 inDatabase:(CalDatabase *)a5 mainDatabase:(CalDatabase *)a6 accountStore:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  uint64_t v14 = [a1 copyStoreForAccount:v12 withChildren:a4 inDatabase:a5];
  uint64_t v15 = (const void *)v14;
  if (a5 && v14)
  {
    int v16 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1A8E81000, v16, OS_LOG_TYPE_INFO, "Removing store because events were disabled or the account was deleted.", v18, 2u);
    }
    CalRemoveStore();
    CalDatabaseSave((uint64_t)a5);
    uint64_t v17 = [v12 identifier];
    [a1 cleanupAuxDatabaseIfNeededForAccountID:v17 auxDatabase:a5 mainDatabase:a6];

    goto LABEL_7;
  }
  if (v14) {
LABEL_7:
  }
    CFRelease(v15);
  [a1 _enableLocalStoreIfNecessaryIgnoringAccount:v12 inDatabase:a6 accountStore:v13];
}

+ (void)removeStoreForDeletedAccountWithIdentifier:(id)a3 inDatabase:(CalDatabase *)a4 mainDatabase:(CalDatabase *)a5 accountStore:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [a1 _copyStoreForAccountWithIdentifier:v10 inDatabase:a4];
  id v13 = (const void *)v12;
  if (a4 && v12)
  {
    uint64_t v14 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_1A8E81000, v14, OS_LOG_TYPE_INFO, "Removing store because the account was deleted.", v15, 2u);
    }
    CalRemoveStore();
    CalDatabaseSave((uint64_t)a4);
    [a1 cleanupAuxDatabaseIfNeededForAccountID:v10 auxDatabase:a4 mainDatabase:a5];
    goto LABEL_7;
  }
  if (v12) {
LABEL_7:
  }
    CFRelease(v13);
  [a1 _enableLocalStoreIfNecessaryIgnoringAccount:0 inDatabase:a5 accountStore:v11];
}

+ (BOOL)mergeEventsFromLocalStoreIntoStore:(void *)a3 inDatabase:(CalDatabase *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  CFTypeRef v7 = CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A8E81000, v7, OS_LOG_TYPE_INFO, "Attempting to move local store events into a sync store.", buf, 2u);
  }
  BOOL result = 0;
  if (a3 && a4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    CFTypeRef v9 = (id)CalDatabaseCopyOfAllStores((os_unfair_lock_s *)a4);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      char v12 = 0;
      char v13 = 0;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v9);
          }
          uint64_t v16 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          if (!CalStoreGetType(v16) && CalStoreAllowsEvents(v16))
          {
            if (!objc_msgSend(a1, "_mergeEntityType:fromStore:toStore:inDatabase:", 2, v16, a3, a4, (void)v17))char v12 = 1; {
            char v13 = 1;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v11);
    }
    else
    {
      char v12 = 0;
      char v13 = 0;
    }

    return v13 & ((v12 & 1) == 0);
  }
  return result;
}

+ (BOOL)mergeEventsIntoLocalStoreFromStore:(void *)a3 inDatabase:(CalDatabase *)a4
{
  CFTypeRef v7 = CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)char v12 = 0;
    _os_log_impl(&dword_1A8E81000, v7, OS_LOG_TYPE_INFO, "Attempting to move sync store events into local store.", v12, 2u);
  }
  char v8 = 0;
  if (a3 && a4)
  {
    CFTypeRef v9 = CalDatabaseCopyLocalStore((uint64_t)a4);
    if (v9)
    {
      uint64_t v10 = v9;
      char v8 = [a1 _mergeEntityType:2 fromStore:a3 toStore:v9 inDatabase:a4];
      CFRelease(v10);
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

+ (BOOL)isReadOnlyAccount:(id)a3
{
  v3 = [a3 accountType];
  char v4 = [v3 identifier];

  if ([v4 isEqualToString:*MEMORY[0x1E4F17858]]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEqualToString:*MEMORY[0x1E4F177C8]];
  }

  return v5;
}

@end