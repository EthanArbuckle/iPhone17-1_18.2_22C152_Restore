@interface EKAccountRefresher
- (BOOL)_allCalendarsRefreshed;
- (BOOL)_allSourcesRefreshed;
- (BOOL)_areAnyCalendarsCurrentlySyncing;
- (BOOL)_areAnySourcesCurrentlySyncing;
- (BOOL)allAccountsOffline;
- (BOOL)calendarFinishedRefreshing:(id)a3;
- (BOOL)refreshing;
- (BOOL)sourceFinishedRefreshing:(id)a3;
- (EKAccountRefresher)initWithEventStore:(id)a3;
- (EKAccountRefresherDelegate)delegate;
- (void)_beginMaximumTimeElapsedTimeout;
- (void)_beginSyncStartTimeout;
- (void)_cancelMaximumTimeElapsedTimeout;
- (void)_cancelSyncStartTimeout;
- (void)_eventStoreChanged:(id)a3;
- (void)_refreshControlMaximumVisibleTimeElapsed;
- (void)_syncCompleted;
- (void)_syncDidEnd;
- (void)_syncStartTimeoutExpired;
- (void)refresh;
- (void)setDelegate:(id)a3;
@end

@implementation EKAccountRefresher

- (EKAccountRefresher)initWithEventStore:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKAccountRefresher;
  v6 = [(EKAccountRefresher *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventStore, a3);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel__eventStoreChanged_ name:@"EKEventStoreChangedNotification" object:v5];
  }
  return v7;
}

- (void)_eventStoreChanged:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_refreshing)
  {
    BOOL v5 = [(EKAccountRefresher *)self _areAnySourcesCurrentlySyncing];
    BOOL v6 = [(EKAccountRefresher *)self _areAnyCalendarsCurrentlySyncing];
    int v7 = v5 || v6;
    BOOL currentlySyncing = self->_currentlySyncing;
    v9 = EKLogHandle;
    BOOL v10 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT);
    if (currentlySyncing == (v5 || v6))
    {
      if (v10)
      {
        int v12 = 67109632;
        int v13 = v5 || v6;
        __int16 v14 = 1024;
        int v15 = v5;
        __int16 v16 = 1024;
        BOOL v17 = v6;
        _os_log_impl(&dword_1A4E47000, v9, OS_LOG_TYPE_DEFAULT, "-[EKAccountRefresher _eventStoreChanged], and _currentlySyncing is still %{BOOL}i (sources=%{BOOL}i; calendars=%{BOOL}i)",
          (uint8_t *)&v12,
          0x14u);
      }
    }
    else
    {
      if (v10)
      {
        BOOL v11 = self->_currentlySyncing;
        int v12 = 67109888;
        int v13 = v11;
        __int16 v14 = 1024;
        int v15 = v5 || v6;
        __int16 v16 = 1024;
        BOOL v17 = v5;
        __int16 v18 = 1024;
        BOOL v19 = v6;
        _os_log_impl(&dword_1A4E47000, v9, OS_LOG_TYPE_DEFAULT, "-[EKAccountRefresher _eventStoreChanged], and _currentlySyncing changed from %{BOOL}i to %{BOOL}i (sources=%{BOOL}i; calendars=%{BOOL}i)",
          (uint8_t *)&v12,
          0x1Au);
      }
      self->_BOOL currentlySyncing = v7;
      if (v7) {
        [(EKAccountRefresher *)self _syncDidStart];
      }
      else {
        [(EKAccountRefresher *)self _syncDidEnd];
      }
    }
  }
}

- (void)_syncDidEnd
{
  if ([(EKAccountRefresher *)self _allSourcesRefreshed]
    && [(EKAccountRefresher *)self _allCalendarsRefreshed])
  {
    [(EKAccountRefresher *)self _syncCompleted];
  }
  else
  {
    [(EKAccountRefresher *)self _beginSyncStartTimeout];
  }
}

- (BOOL)_allSourcesRefreshed
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_refreshingSources;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (!-[EKAccountRefresher sourceFinishedRefreshing:](self, "sourceFinishedRefreshing:", v8, (void)v12))
        {
          BOOL v10 = EKLogHandle;
          BOOL v9 = 0;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v17 = v8;
            _os_log_impl(&dword_1A4E47000, v10, OS_LOG_TYPE_DEFAULT, "%@ has not yet finished refreshing", buf, 0xCu);
            BOOL v9 = 0;
          }
          goto LABEL_12;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_12:

  return v9;
}

- (BOOL)_areAnySourcesCurrentlySyncing
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_refreshingSources;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isSyncing", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_allCalendarsRefreshed
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = self->_refreshingCalendars;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (!-[EKAccountRefresher calendarFinishedRefreshing:](self, "calendarFinishedRefreshing:", v8, (void)v12))
        {
          long long v10 = EKLogHandle;
          BOOL v9 = 0;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v17 = v8;
            _os_log_impl(&dword_1A4E47000, v10, OS_LOG_TYPE_DEFAULT, "%@ has not yet finished refreshing", buf, 0xCu);
            BOOL v9 = 0;
          }
          goto LABEL_12;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_12:

  return v9;
}

- (BOOL)_areAnyCalendarsCurrentlySyncing
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_refreshingCalendars;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isSyncing", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)refresh
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (self->_refreshStartDate)
  {
    v2 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E47000, v2, OS_LOG_TYPE_DEFAULT, "Calling -[EKAccountRefresher refresh] more than once is not supported.", buf, 2u);
    }
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    refreshStartDate = self->_refreshStartDate;
    self->_refreshStartDate = v4;

    [(EKAccountRefresher *)self _beginMaximumTimeElapsedTimeout];
    [(EKAccountRefresher *)self _beginSyncStartTimeout];
    self->_refreshing = 1;
    uint64_t v6 = [MEMORY[0x1E4F5E950] sharedConnection];
    [v6 resetTimersAndWarnings];

    v29 = self;
    long long v7 = [(EKEventStore *)self->_eventStore refreshEverythingIfNecessary:1];
    long long v8 = (void *)[v7 mutableCopy];

    long long v9 = objc_opt_new();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          __int16 v16 = [v15 calendarsForEntityType:0];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v42 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v31;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v31 != v19) {
                  objc_enumerationMutation(v16);
                }
                v21 = *(void **)(*((void *)&v30 + 1) + 8 * j);
                if ([v21 isSubscribed]
                  && ([v21 isSubscribedHolidayCalendar] & 1) == 0)
                {
                  [v9 addObject:v21];
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v42 count:16];
            }
            while (v18);
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v12);
    }

    v22 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_23];
    [v10 filterUsingPredicate:v22];

    v23 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      uint64_t v25 = [v10 count];
      uint64_t v26 = [v9 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v39 = v25;
      __int16 v40 = 2048;
      uint64_t v41 = v26;
      _os_log_impl(&dword_1A4E47000, v24, OS_LOG_TYPE_DEFAULT, "Started a refresh of %lu accounts and %lu subscribed calendars", buf, 0x16u);
    }
    uint64_t v27 = [v10 allObjects];
    refreshingSources = v29->_refreshingSources;
    v29->_refreshingSources = (NSArray *)v27;

    objc_storeStrong((id *)&v29->_refreshingCalendars, v9);
    if (![(NSArray *)v29->_refreshingSources count] && ![(NSArray *)v29->_refreshingCalendars count]) {
      [(EKAccountRefresher *)v29 _syncCompleted];
    }
  }
}

BOOL __29__EKAccountRefresher_refresh__block_invoke(uint64_t a1, void *a2)
{
  return [a2 sourceType] != 4;
}

- (void)_refreshControlMaximumVisibleTimeElapsed
{
  if (self->_refreshing)
  {
    uint64_t v3 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_DEFAULT, "_refreshControlMaximumVisibleTimeElapsed; calling sync completed",
        v4,
        2u);
    }
    [(EKAccountRefresher *)self _syncCompleted];
    [(EKAccountRefresher *)self _cancelSyncStartTimeout];
  }
}

- (void)_syncStartTimeoutExpired
{
  if (self->_refreshing)
  {
    uint64_t v3 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_DEFAULT, "timed out waiting for sync to start; calling sync completed",
        v4,
        2u);
    }
    [(EKAccountRefresher *)self _syncCompleted];
    [(EKAccountRefresher *)self _cancelMaximumTimeElapsedTimeout];
  }
}

- (void)_beginSyncStartTimeout
{
}

- (void)_cancelSyncStartTimeout
{
}

- (void)_beginMaximumTimeElapsedTimeout
{
}

- (void)_cancelMaximumTimeElapsedTimeout
{
}

- (void)_syncCompleted
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    refreshStartDate = self->_refreshStartDate;
    uint64_t v5 = v3;
    [(NSDate *)refreshStartDate timeIntervalSinceNow];
    int v8 = 134217984;
    double v9 = -v6;
    _os_log_impl(&dword_1A4E47000, v5, OS_LOG_TYPE_DEFAULT, "Hiding sync spinner after %fs", (uint8_t *)&v8, 0xCu);
  }
  [(EKAccountRefresher *)self _cancelSyncStartTimeout];
  [(EKAccountRefresher *)self _cancelMaximumTimeElapsedTimeout];
  self->_refreshing = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained accountRefreshFinished:self];
}

- (BOOL)sourceFinishedRefreshing:(id)a3
{
  if (!self->_refreshStartDate) {
    return 0;
  }
  uint64_t v4 = [a3 lastSyncEndDate];
  uint64_t v5 = v4;
  if (v4)
  {
    double v6 = [v4 laterDate:self->_refreshStartDate];
    BOOL v7 = v6 == v5;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)calendarFinishedRefreshing:(id)a3
{
  if (!self->_refreshStartDate) {
    return 0;
  }
  uint64_t v4 = [a3 lastSyncEndDate];
  uint64_t v5 = v4;
  if (v4)
  {
    double v6 = [v4 laterDate:self->_refreshStartDate];
    BOOL v7 = v6 == v5;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)allAccountsOffline
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!self->_refreshing
    && self->_refreshStartDate
    && ([(NSArray *)self->_refreshingSources count] || [(NSArray *)self->_refreshingCalendars count]))
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v4 = self->_refreshingSources;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v21;
LABEL_8:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
        if (![(EKAccountRefresher *)self sourceFinishedRefreshing:v9]
          || [v9 lastSyncError] != 3)
        {
          break;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v6) {
            goto LABEL_8;
          }
          goto LABEL_15;
        }
      }
    }
    else
    {
LABEL_15:

      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v4 = self->_refreshingCalendars;
      uint64_t v10 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (!v10)
      {
        BOOL v2 = 1;
        goto LABEL_26;
      }
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
LABEL_17:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v4);
        }
        long long v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        if (!-[EKAccountRefresher calendarFinishedRefreshing:](self, "calendarFinishedRefreshing:", v14, (void)v16)
          || [v14 lastSyncError] != 3)
        {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
          BOOL v2 = 1;
          if (v11) {
            goto LABEL_17;
          }
          goto LABEL_26;
        }
      }
    }
    BOOL v2 = 0;
LABEL_26:

    return v2;
  }
  return 0;
}

- (EKAccountRefresherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKAccountRefresherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)refreshing
{
  return self->_refreshing;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_refreshingCalendars, 0);
  objc_storeStrong((id *)&self->_refreshingSources, 0);
  objc_storeStrong((id *)&self->_refreshStartDate, 0);

  objc_storeStrong((id *)&self->_eventStore, 0);
}

@end