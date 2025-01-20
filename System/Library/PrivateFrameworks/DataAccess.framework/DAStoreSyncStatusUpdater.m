@interface DAStoreSyncStatusUpdater
+ (BOOL)_isCanceledError:(id)a3;
+ (id)_eventStore;
+ (id)_eventStorePurger;
+ (id)_mappedAccountErrorFromError:(id)a3;
+ (unint64_t)_accountErrorCodeForNSError:(id)a3;
+ (unint64_t)_codeForLastSyncError:(id)a3 userInfo:(id *)a4;
+ (unint64_t)_ekAccountErrorFromCoreDAVErrorCode:(int)a3;
+ (unint64_t)_ekAccountErrorFromCoreDAVHTTPStatusCode:(int64_t)a3;
+ (unint64_t)_ekAccountErrorFromDAErrorCode:(int64_t)a3;
+ (unint64_t)_ekAccountErrorFromDAValidationErrorCode:(unint64_t)a3;
+ (unint64_t)_ekAccountErrorFromSubCalErrorCode:(int64_t)a3;
+ (unint64_t)_ekAccountErrorFromURLError:(id)a3;
+ (void)_updateStatusForCalendar:(id)a3 lastSyncStartDate:(id)a4 lastSyncEndDate:(id)a5 lastSyncError:(id)a6 canceled:(BOOL)a7;
+ (void)_updateStatusForCalendarWithExternalID:(id)a3 sourceExternalID:(id)a4 lastSyncStartDate:(id)a5 lastSyncEndDate:(id)a6 lastSyncError:(id)a7 canceled:(BOOL)a8;
+ (void)_updateStatusForSource:(id)a3 lastSyncStartDate:(id)a4 lastSyncEndDate:(id)a5 lastSyncError:(id)a6 canceled:(BOOL)a7;
+ (void)_updateStatusForStoreWithExternalID:(id)a3 lastSyncStartDate:(id)a4 lastSyncEndDate:(id)a5 lastSyncError:(id)a6 canceled:(BOOL)a7;
+ (void)resetSyncStatusIfNecessaryForStoresOfType:(unint64_t)a3;
+ (void)syncEndedForCalendar:(id)a3 withError:(id)a4;
+ (void)syncEndedForCalendarWithExternalID:(id)a3 sourceExternalID:(id)a4 withError:(id)a5;
+ (void)syncEndedForStoreWithExternalID:(id)a3 withError:(id)a4;
+ (void)syncStartedForCalendar:(id)a3;
+ (void)syncStartedForCalendarWithExternalID:(id)a3 sourceExternalID:(id)a4;
+ (void)syncStartedForStoreWithExternalID:(id)a3;
@end

@implementation DAStoreSyncStatusUpdater

+ (void)syncStartedForStoreWithExternalID:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 date];
  [a1 _updateStatusForStoreWithExternalID:v5 lastSyncStartDate:v6 lastSyncEndDate:0 lastSyncError:0 canceled:0];
}

+ (void)syncEndedForStoreWithExternalID:(id)a3 withError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [a1 _mappedAccountErrorFromError:v6];
  uint64_t v8 = [a1 _isCanceledError:v6];

  v9 = [MEMORY[0x1E4F1C9C8] date];
  [a1 _updateStatusForStoreWithExternalID:v7 lastSyncStartDate:0 lastSyncEndDate:v9 lastSyncError:v10 canceled:v8];
}

+ (void)resetSyncStatusIfNecessaryForStoresOfType:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((DAStoreSyncStatusUpdaterAlreadyResetStatus & 1) == 0)
  {
    DAStoreSyncStatusUpdaterAlreadyResetStatus = 1;
    [a1 _eventStore];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v14 = long long v18 = 0u;
    id v5 = [v14 sources];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      uint64_t v9 = *MEMORY[0x1E4F256A0];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v11 isSyncing])
          {
            if (((1 << [v11 sourceType]) & a3) != 0)
            {
              v12 = [MEMORY[0x1E4F28C58] errorWithDomain:v9 code:1 userInfo:0];
              v13 = [MEMORY[0x1E4F1C9C8] date];
              [a1 _updateStatusForSource:v11 lastSyncStartDate:0 lastSyncEndDate:v13 lastSyncError:v12 canceled:0];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
  }
}

+ (id)_eventStorePurger
{
  if (_eventStorePurger_onceToken != -1) {
    dispatch_once(&_eventStorePurger_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)_eventStorePurger_eventStorePurger;
  return v2;
}

uint64_t __45__DAStoreSyncStatusUpdater__eventStorePurger__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F25648]);
  v1 = (void *)_eventStorePurger_eventStorePurger;
  _eventStorePurger_eventStorePurger = (uint64_t)v0;

  [(id)_eventStorePurger_eventStorePurger setTimeout:30.0];
  [(id)_eventStorePurger_eventStorePurger setPurgingAllowed:1];
  v2 = (void *)_eventStorePurger_eventStorePurger;
  return [v2 setCreationBlock:&__block_literal_global_6];
}

id __45__DAStoreSyncStatusUpdater__eventStorePurger__block_invoke_2()
{
  id v0 = (void *)[objc_alloc(MEMORY[0x1E4F25550]) initWithEKOptions:128];
  return v0;
}

+ (id)_eventStore
{
  v2 = [a1 _eventStorePurger];
  v3 = [v2 acquireCachedEventStoreOrCreate:1];

  return v3;
}

+ (void)_updateStatusForSource:(id)a3 lastSyncStartDate:(id)a4 lastSyncEndDate:(id)a5 lastSyncError:(id)a6 canceled:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  long long v16 = DALoggingwithCategory();
  uint64_t v17 = MEMORY[0x1E4F5E9A0];
  os_log_type_t v18 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
  if (os_log_type_enabled(v16, v18))
  {
    v19 = [v12 sourceIdentifier];
    uint64_t v20 = [NSNumber numberWithBool:v7];
    *(_DWORD *)buf = 138544386;
    v35 = v19;
    __int16 v36 = 2114;
    id v37 = v13;
    __int16 v38 = 2114;
    id v39 = v14;
    __int16 v40 = 2114;
    v41 = v20;
    __int16 v42 = 2112;
    id v43 = v15;
    _os_log_impl(&dword_1BA384000, v16, v18, "Saving sync status for source with identifier %{public}@: lastSyncStartDate = %{public}@, lastSyncEndDate = %{public}@, canceled=%{public}@ lastSyncError = %@", buf, 0x34u);

    uint64_t v17 = MEMORY[0x1E4F5E9A0];
  }

  if (v7
    && ([v12 lastSyncEndDate], v21 = objc_claimAutoreleasedReturnValue(), v21, !v21))
  {
    v24 = DALoggingwithCategory();
    if (os_log_type_enabled(v24, v18))
    {
      v25 = [v12 sourceIdentifier];
      *(_DWORD *)buf = 138543362;
      v35 = v25;
      _os_log_impl(&dword_1BA384000, v24, v18, "Initial sync canceled. Clearing start date for source with identifier %{public}@", buf, 0xCu);
    }
    [v12 setLastSyncStartDate:0];
  }
  else
  {
    if (v13) {
      [v12 setLastSyncStartDate:v13];
    }
    if (v14) {
      [v12 setLastSyncEndDate:v14];
    }
    if (v15)
    {
      id v33 = 0;
      uint64_t v22 = [a1 _codeForLastSyncError:v15 userInfo:&v33];
      id v23 = v33;
      [v12 setLastSyncError:v22 userInfo:v23];
    }
  }
  v26 = [v12 eventStore];
  id v32 = 0;
  char v27 = [v26 saveSource:v12 commit:1 error:&v32];
  id v28 = v32;

  if ((v27 & 1) == 0)
  {
    v29 = DALoggingwithCategory();
    os_log_type_t v30 = *(unsigned char *)(v17 + 3);
    if (os_log_type_enabled(v29, v30))
    {
      v31 = [v12 sourceIdentifier];
      *(_DWORD *)buf = 138412546;
      v35 = v31;
      __int16 v36 = 2112;
      id v37 = v28;
      _os_log_impl(&dword_1BA384000, v29, v30, "Failed to save source sync status with source identifier %@. Error = %@", buf, 0x16u);
    }
  }
}

+ (unint64_t)_codeForLastSyncError:(id)a3 userInfo:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 domain];
  BOOL v7 = (void *)*MEMORY[0x1E4F256A0];

  if (v6 == v7)
  {
    unint64_t v8 = [v5 code];
    uint64_t v9 = [v5 userInfo];
    id v10 = v9;
    if (v8)
    {
      id v11 = (id)[v9 count];
      if (v11) {
        id v11 = v10;
      }
    }
    else
    {
      id v11 = 0;
    }
    *a4 = v11;
  }
  else
  {
    unint64_t v8 = 1;
  }

  return v8;
}

+ (void)_updateStatusForStoreWithExternalID:(id)a3 lastSyncStartDate:(id)a4 lastSyncEndDate:(id)a5 lastSyncError:(id)a6 canceled:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    long long v16 = [a1 _eventStore];
    uint64_t v17 = [v16 sourceWithExternalID:v12];
    os_log_type_t v18 = DALoggingwithCategory();
    os_log_type_t v19 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
    if (os_log_type_enabled(v18, v19))
    {
      int v23 = 138412546;
      id v24 = v15;
      __int16 v25 = 2114;
      id v26 = v12;
      _os_log_impl(&dword_1BA384000, v18, v19, "Updating sync status (%@) for source with externalID %{public}@", (uint8_t *)&v23, 0x16u);
    }

    if (v17)
    {
      [a1 _updateStatusForSource:v17 lastSyncStartDate:v13 lastSyncEndDate:v14 lastSyncError:v15 canceled:v7];
    }
    else
    {
      v21 = DALoggingwithCategory();
      os_log_type_t v22 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
      if (os_log_type_enabled(v21, v22))
      {
        int v23 = 138543618;
        id v24 = v12;
        __int16 v25 = 2112;
        id v26 = v15;
        _os_log_impl(&dword_1BA384000, v21, v22, "Tried to update status for store, but could not get a corresponding EKSource for externalID %{public}@. lastSyncError is %@", (uint8_t *)&v23, 0x16u);
      }
    }
  }
  else
  {
    long long v16 = DALoggingwithCategory();
    os_log_type_t v20 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v16, v20))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1BA384000, v16, v20, "Tried to update status for store with nil externalID", (uint8_t *)&v23, 2u);
    }
  }
}

+ (void)syncStartedForCalendarWithExternalID:(id)a3 sourceExternalID:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 date];
  [a1 _updateStatusForCalendarWithExternalID:v8 sourceExternalID:v7 lastSyncStartDate:v9 lastSyncEndDate:0 lastSyncError:0 canceled:0];
}

+ (void)syncEndedForCalendarWithExternalID:(id)a3 sourceExternalID:(id)a4 withError:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v13 = [a1 _mappedAccountErrorFromError:v8];
  uint64_t v11 = [a1 _isCanceledError:v8];

  id v12 = [MEMORY[0x1E4F1C9C8] date];
  [a1 _updateStatusForCalendarWithExternalID:v10 sourceExternalID:v9 lastSyncStartDate:0 lastSyncEndDate:v12 lastSyncError:v13 canceled:v11];
}

+ (void)syncStartedForCalendar:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 date];
  [a1 _updateStatusForCalendar:v5 lastSyncStartDate:v6 lastSyncEndDate:0 lastSyncError:0 canceled:0];
}

+ (void)syncEndedForCalendar:(id)a3 withError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [a1 _mappedAccountErrorFromError:v6];
  uint64_t v8 = [a1 _isCanceledError:v6];

  id v9 = [MEMORY[0x1E4F1C9C8] date];
  [a1 _updateStatusForCalendar:v7 lastSyncStartDate:0 lastSyncEndDate:v9 lastSyncError:v10 canceled:v8];
}

+ (void)_updateStatusForCalendarWithExternalID:(id)a3 sourceExternalID:(id)a4 lastSyncStartDate:(id)a5 lastSyncEndDate:(id)a6 lastSyncError:(id)a7 canceled:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v14)
  {
    BOOL v27 = v8;
    id v28 = v16;
    os_log_type_t v19 = [a1 _eventStore];
    os_log_type_t v20 = [v19 sourceWithExternalID:v15];
    v21 = [v20 calendarWithExternalIdentifier:v14];
    os_log_type_t v22 = DALoggingwithCategory();
    os_log_type_t v23 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
    if (os_log_type_enabled(v22, v23))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v18;
      __int16 v31 = 2112;
      id v32 = v14;
      _os_log_impl(&dword_1BA384000, v22, v23, "Updating sync status (%@) for calendar with externalID %@", buf, 0x16u);
    }

    if (v21)
    {
      id v16 = v28;
      [a1 _updateStatusForCalendar:v21 lastSyncStartDate:v28 lastSyncEndDate:v17 lastSyncError:v18 canceled:v27];
    }
    else
    {
      __int16 v25 = DALoggingwithCategory();
      os_log_type_t v26 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
      if (os_log_type_enabled(v25, v26))
      {
        *(_DWORD *)buf = 138412802;
        id v30 = v14;
        __int16 v31 = 2112;
        id v32 = v15;
        __int16 v33 = 2112;
        id v34 = v18;
        _os_log_impl(&dword_1BA384000, v25, v26, "Tried to update status for calendar, but could not get a corresponding EKCalendar for externalID %@ in source with external ID %@. lastSyncError is %@", buf, 0x20u);
      }

      id v16 = v28;
    }
  }
  else
  {
    os_log_type_t v19 = DALoggingwithCategory();
    os_log_type_t v24 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v19, v24))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA384000, v19, v24, "Tried to update status for calendar with nil externalID", buf, 2u);
    }
  }
}

+ (void)_updateStatusForCalendar:(id)a3 lastSyncStartDate:(id)a4 lastSyncEndDate:(id)a5 lastSyncError:(id)a6 canceled:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = DALoggingwithCategory();
  uint64_t v17 = MEMORY[0x1E4F5E9A0];
  os_log_type_t v18 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
  if (os_log_type_enabled(v16, v18))
  {
    os_log_type_t v19 = [v12 externalID];
    os_log_type_t v20 = [NSNumber numberWithBool:v7];
    *(_DWORD *)buf = 138413314;
    uint64_t v35 = v19;
    __int16 v36 = 2114;
    id v37 = v13;
    __int16 v38 = 2114;
    id v39 = v14;
    __int16 v40 = 2114;
    v41 = v20;
    __int16 v42 = 2112;
    id v43 = v15;
    _os_log_impl(&dword_1BA384000, v16, v18, "Saving sync status for calendar with external identifier %@: lastSyncStartDate = %{public}@, lastSyncEndDate = %{public}@, canceled=%{public}@ lastSyncError = %@", buf, 0x34u);

    uint64_t v17 = MEMORY[0x1E4F5E9A0];
  }

  if (v7
    && ([v12 lastSyncEndDate], v21 = objc_claimAutoreleasedReturnValue(), v21, !v21))
  {
    os_log_type_t v24 = DALoggingwithCategory();
    if (os_log_type_enabled(v24, v18))
    {
      __int16 v25 = [v12 externalID];
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = v25;
      _os_log_impl(&dword_1BA384000, v24, v18, "Initial sync canceled. Clearing start date for calendar with external identifier %@", buf, 0xCu);
    }
    [v12 setLastSyncStartDate:0];
  }
  else
  {
    if (v13) {
      [v12 setLastSyncStartDate:v13];
    }
    if (v14) {
      [v12 setLastSyncEndDate:v14];
    }
    if (v15)
    {
      id v33 = 0;
      uint64_t v22 = [a1 _codeForLastSyncError:v15 userInfo:&v33];
      id v23 = v33;
      [v12 setLastSyncError:v22 userInfo:v23];
    }
  }
  os_log_type_t v26 = [v12 eventStore];
  id v32 = 0;
  char v27 = [v26 saveCalendar:v12 commit:1 error:&v32];
  id v28 = v32;

  if ((v27 & 1) == 0)
  {
    v29 = DALoggingwithCategory();
    os_log_type_t v30 = *(unsigned char *)(v17 + 3);
    if (os_log_type_enabled(v29, v30))
    {
      __int16 v31 = [v12 externalID];
      *(_DWORD *)buf = 138412546;
      uint64_t v35 = v31;
      __int16 v36 = 2112;
      id v37 = v28;
      _os_log_impl(&dword_1BA384000, v29, v30, "Failed to save calendar sync status with calendar external ID %@. Error = %@", buf, 0x16u);
    }
  }
}

+ (id)_mappedAccountErrorFromError:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "cal_serializableError");
  id v6 = (void *)v5;
  if (v5)
  {
    uint64_t v11 = *MEMORY[0x1E4F28A50];
    v12[0] = v5;
    BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  }
  else
  {
    BOOL v7 = 0;
  }
  uint64_t v8 = [a1 _accountErrorCodeForNSError:v4];
  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F256A0] code:v8 userInfo:v7];

  return v9;
}

+ (unint64_t)_accountErrorCodeForNSError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 domain];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F5B310]];

    if (v7)
    {
      uint64_t v8 = objc_msgSend(a1, "_ekAccountErrorFromCoreDAVErrorCode:", objc_msgSend(v5, "code"));
LABEL_19:
      unint64_t v9 = v8;
      goto LABEL_20;
    }
    id v10 = [v5 domain];
    int v11 = [v10 isEqualToString:*MEMORY[0x1E4F5E920]];

    if (v11)
    {
      uint64_t v8 = objc_msgSend(a1, "_ekAccountErrorFromDAErrorCode:", objc_msgSend(v5, "code"));
      goto LABEL_19;
    }
    id v12 = [v5 domain];
    int v13 = [v12 isEqualToString:@"DAAccountValidationDomain"];

    if (v13)
    {
      uint64_t v8 = objc_msgSend(a1, "_ekAccountErrorFromDAValidationErrorCode:", objc_msgSend(v5, "code"));
      goto LABEL_19;
    }
    if ((objc_msgSend(v5, "cal_isCertificateError") & 1) == 0)
    {
      id v14 = [v5 domain];
      int v15 = [v14 isEqualToString:*MEMORY[0x1E4F5B330]];

      if (v15)
      {
        uint64_t v8 = objc_msgSend(a1, "_ekAccountErrorFromCoreDAVHTTPStatusCode:", objc_msgSend(v5, "code"));
      }
      else
      {
        id v16 = [v5 domain];
        int v17 = [v16 isEqualToString:*MEMORY[0x1E4F289A0]];

        if (v17)
        {
          uint64_t v8 = [a1 _ekAccountErrorFromURLError:v5];
        }
        else
        {
          os_log_type_t v18 = [v5 domain];
          if ([v18 isEqualToString:*MEMORY[0x1E4F5EF08]])
          {
          }
          else
          {
            os_log_type_t v19 = [v5 domain];
            int v20 = [v19 isEqualToString:*MEMORY[0x1E4F5EF00]];

            if (!v20)
            {
              unint64_t v9 = 1;
              goto LABEL_20;
            }
          }
          uint64_t v8 = objc_msgSend(a1, "_ekAccountErrorFromSubCalErrorCode:", objc_msgSend(v5, "code"));
        }
      }
      goto LABEL_19;
    }
    unint64_t v9 = 6;
  }
  else
  {
    unint64_t v9 = 0;
  }
LABEL_20:

  return v9;
}

+ (unint64_t)_ekAccountErrorFromCoreDAVErrorCode:(int)a3
{
  if (a3 > 5) {
    return 1;
  }
  else {
    return qword_1BA3C7D10[a3];
  }
}

+ (unint64_t)_ekAccountErrorFromDAErrorCode:(int64_t)a3
{
  unint64_t result = 5;
  char v4 = a3 + 2;
  if ((unint64_t)(a3 + 2) <= 0x37)
  {
    if (((1 << v4) & 0x80000800040888) != 0) {
      return result;
    }
    if (((1 << v4) & 0x4003) != 0) {
      return 0;
    }
    if (!a3) {
      return 3;
    }
  }
  char v5 = a3 - 63;
  if ((unint64_t)(a3 - 63) > 0x34) {
    return 1;
  }
  if (((1 << v5) & 0x11800000020000) == 0)
  {
    if (((1 << v5) & 0x21) != 0) {
      return 2;
    }
    if (a3 == 92) {
      return 8;
    }
    return 1;
  }
  return result;
}

+ (unint64_t)_ekAccountErrorFromDAValidationErrorCode:(unint64_t)a3
{
  if (a3 - 101 > 2) {
    return 1;
  }
  else {
    return qword_1BA3C7D40[a3 - 101];
  }
}

+ (unint64_t)_ekAccountErrorFromCoreDAVHTTPStatusCode:(int64_t)a3
{
  unint64_t v3 = 5;
  if (a3 == 401) {
    unint64_t v3 = 2;
  }
  if (a3 >= 400) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (unint64_t)_ekAccountErrorFromSubCalErrorCode:(int64_t)a3
{
  if ((unint64_t)a3 > 9) {
    return 0;
  }
  else {
    return qword_1BA3C7D58[a3];
  }
}

+ (unint64_t)_ekAccountErrorFromURLError:(id)a3
{
  if ([a3 code] == -999) {
    return 0;
  }
  else {
    return 3;
  }
}

+ (BOOL)_isCanceledError:(id)a3
{
  id v3 = a3;
  char v4 = v3;
  if (v3)
  {
    char v5 = [v3 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F5B310]])
    {
      uint64_t v6 = [v4 code];

      if (v6 == 1) {
        goto LABEL_28;
      }
    }
    else
    {
    }
    int v7 = [v4 domain];
    if ([v7 isEqualToString:*MEMORY[0x1E4F5E920]])
    {
      if ([v4 code] == -1)
      {
        LOBYTE(v6) = 1;
        goto LABEL_27;
      }
      uint64_t v8 = [v4 code];

      if (v8 == -2) {
        goto LABEL_18;
      }
    }
    else
    {
    }
    unint64_t v9 = [v4 domain];
    if ([v9 isEqualToString:@"DAAccountValidationDomain"])
    {
      uint64_t v10 = [v4 code];

      if (v10 == 103) {
        goto LABEL_18;
      }
    }
    else
    {
    }
    int v11 = [v4 domain];
    if ([v11 isEqualToString:*MEMORY[0x1E4F289A0]])
    {
      uint64_t v12 = [v4 code];

      if (v12 == -999)
      {
LABEL_18:
        LOBYTE(v6) = 1;
        goto LABEL_28;
      }
    }
    else
    {
    }
    int v7 = [v4 domain];
    if ([v7 isEqualToString:*MEMORY[0x1E4F5EF08]])
    {
      LOBYTE(v6) = [v4 code] == 2;
    }
    else
    {
      int v13 = [v4 domain];
      if ([v13 isEqualToString:*MEMORY[0x1E4F5EF00]]) {
        LOBYTE(v6) = [v4 code] == 2;
      }
      else {
        LOBYTE(v6) = 0;
      }
    }
LABEL_27:

    goto LABEL_28;
  }
  LOBYTE(v6) = 0;
LABEL_28:

  return v6;
}

@end