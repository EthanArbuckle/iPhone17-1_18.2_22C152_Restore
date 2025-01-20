@interface DNDSCalendarEventLifetimeMonitor
+ (Class)lifetimeClass;
- (DNDSCalendarEventLifetimeMonitor)init;
- (id)_eventForCalendarEventLifetime:(id)a3 assertionStartDate:(id)a4;
- (id)_eventStore;
- (id)_eventStoreCreatingIfNeeded;
- (id)activeDateIntervalForCalendarEventLifetime:(id)a3 assertionStartDate:(id)a4;
- (id)updateForModeAssertions:(id)a3 date:(id)a4;
- (void)_calendarEventStoreChangedWithNotification:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DNDSCalendarEventLifetimeMonitor

- (DNDSCalendarEventLifetimeMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)DNDSCalendarEventLifetimeMonitor;
  v2 = [(DNDSBaseLifetimeMonitor *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__calendarEventStoreChangedWithNotification_ name:*MEMORY[0x1E4F25460] object:0];
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DNDSCalendarEventLifetimeMonitor;
  [(DNDSBaseLifetimeMonitor *)&v8 setDelegate:v4];
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__DNDSCalendarEventLifetimeMonitor_setDelegate___block_invoke;
    v5[3] = &unk_1E6973AA8;
    objc_copyWeak(&v6, &location);
    [v4 lifetimeMonitor:self registerTimerHandlerWithServiceIdentifier:@"com.apple.donotdisturb.server.CalendarEventLifetimeMonitor.timer" handler:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __48__DNDSCalendarEventLifetimeMonitor_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isEqualToString:@"com.apple.donotdisturb.server.CalendarEventLifetimeMonitor.timer"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v3 = [MEMORY[0x1E4F1C9C8] date];
    [WeakRetained refreshMonitorForDate:v3];
  }
}

- (id)activeDateIntervalForCalendarEventLifetime:(id)a3 assertionStartDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(DNDSCalendarEventLifetimeMonitor *)self _eventForCalendarEventLifetime:v7 assertionStartDate:v6];
  LOBYTE(self) = [v7 isOnlyDuringEvent];

  if (self)
  {
    id v9 = [v8 startDate];
  }
  else
  {
    id v9 = v6;
  }
  v10 = v9;
  uint64_t v11 = [v8 endDate];
  v12 = (void *)v11;
  v13 = 0;
  if (v10 && v11)
  {
    if ([v10 compare:v11] == -1) {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v10 endDate:v12];
    }
    else {
      v13 = 0;
    }
  }

  return v13;
}

+ (Class)lifetimeClass
{
  return (Class)objc_opt_class();
}

- (id)updateForModeAssertions:(id)a3 date:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v66 = (NSDate *)a4;
  v64 = self;
  id v7 = [(DNDSBaseLifetimeMonitor *)self queue];
  dispatch_assert_queue_V2(v7);

  objc_super v8 = DNDSLogCalendarEventLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogCalendarEventLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v72 = v66;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Refreshing monitor, date=%{public}@", buf, 0xCu);
  }
  id v9 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v63 = [MEMORY[0x1E4F1CA48] array];
  v62 = [MEMORY[0x1E4F1CA48] array];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v67 objects:v75 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v68;
    *(void *)&long long v11 = 138543618;
    long long v61 = v11;
    v14 = self;
    while (1)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v68 != v13) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "details", v61);
        v18 = [v17 lifetime];

        v19 = [v16 startDate];
        v20 = [(DNDSCalendarEventLifetimeMonitor *)v14 activeDateIntervalForCalendarEventLifetime:v18 assertionStartDate:v19];

        if (!v20)
        {
          v29 = [v16 source];
          v30 = [v29 deviceIdentifier];

          if (v30)
          {
            v31 = (void *)DNDSLogCalendarEventLifetimeMonitor;
            if (os_log_type_enabled((os_log_t)DNDSLogCalendarEventLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
            {
              v32 = v31;
              v33 = [v18 eventUniqueID];
              v34 = [v16 UUID];
              *(_DWORD *)buf = v61;
              v72 = v33;
              __int16 v73 = 2114;
              v74 = v34;
              _os_log_impl(&dword_1D3052000, v32, OS_LOG_TYPE_DEFAULT, "Unable to find matching event for synced assertion; eventIdentifier=%{public}@; assertionIdentifier=%{public}@",
                buf,
                0x16u);

              v14 = v64;
            }
            v35 = [v16 UUID];
            [v63 addObject:v35];
          }
          else
          {
            v44 = [v16 UUID];
            [v62 addObject:v44];

            v45 = (void *)DNDSLogCalendarEventLifetimeMonitor;
            if (!os_log_type_enabled((os_log_t)DNDSLogCalendarEventLifetimeMonitor, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_28;
            }
            v35 = v45;
            v41 = [v18 eventUniqueID];
            *(_DWORD *)buf = 138543362;
            v72 = v41;
            v42 = v35;
            v43 = "No date interval for event; eventIdentifier=%{public}@";
LABEL_26:
            _os_log_impl(&dword_1D3052000, v42, OS_LOG_TYPE_DEFAULT, v43, buf, 0xCu);

            v14 = v64;
          }

          goto LABEL_28;
        }
        uint64_t v21 = objc_msgSend(v20, "dnds_lifetimePhaseForDate:", v66);
        if (v21 != 2)
        {
          if (v21 == 1)
          {
            v36 = [v16 UUID];
            [v63 addObject:v36];

            v37 = [v20 endDate];
            uint64_t v23 = [(NSDate *)v9 earlierDate:v37];

            v38 = (void *)DNDSLogCalendarEventLifetimeMonitor;
            if (os_log_type_enabled((os_log_t)DNDSLogCalendarEventLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
            {
              v25 = v38;
              v26 = [v18 eventUniqueID];
              *(_DWORD *)buf = 138543362;
              v72 = v26;
              v27 = v25;
              v28 = "Active date interval for event; eventIdentifier=%{public}@";
LABEL_20:
              _os_log_impl(&dword_1D3052000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);

              v14 = v64;
            }
          }
          else
          {
            if (v21) {
              goto LABEL_28;
            }
            v22 = [v20 startDate];
            uint64_t v23 = [(NSDate *)v9 earlierDate:v22];

            v24 = (void *)DNDSLogCalendarEventLifetimeMonitor;
            if (os_log_type_enabled((os_log_t)DNDSLogCalendarEventLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
            {
              v25 = v24;
              v26 = [v18 eventUniqueID];
              *(_DWORD *)buf = 138543362;
              v72 = v26;
              v27 = v25;
              v28 = "Pending date interval for event; eventIdentifier=%{public}@";
              goto LABEL_20;
            }
          }
          id v9 = (NSDate *)v23;
          goto LABEL_28;
        }
        v39 = [v16 UUID];
        [v62 addObject:v39];

        v40 = (void *)DNDSLogCalendarEventLifetimeMonitor;
        if (os_log_type_enabled((os_log_t)DNDSLogCalendarEventLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
        {
          v35 = v40;
          v41 = [v18 eventUniqueID];
          *(_DWORD *)buf = 138543362;
          v72 = v41;
          v42 = v35;
          v43 = "Expired date interval for event; eventIdentifier=%{public}@";
          goto LABEL_26;
        }
LABEL_28:
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v67 objects:v75 count:16];
      if (!v12) {
        goto LABEL_32;
      }
    }
  }
  v14 = self;
LABEL_32:

  v46 = [MEMORY[0x1E4F1C9C8] distantFuture];
  BOOL v47 = [(NSDate *)v9 isEqualToDate:v46];

  p_lifetimeTimerFireDate = &v14->_lifetimeTimerFireDate;
  BOOL v49 = [(NSDate *)v9 isEqualToDate:v14->_lifetimeTimerFireDate];
  v50 = [(DNDSBaseLifetimeMonitor *)v14 delegate];
  if (v47 || !v49)
  {
    v51 = DNDSLogCalendarEventLifetimeMonitor;
    if (os_log_type_enabled((os_log_t)DNDSLogCalendarEventLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      v52 = *p_lifetimeTimerFireDate;
      *(_DWORD *)buf = 138543362;
      v72 = v52;
      _os_log_impl(&dword_1D3052000, v51, OS_LOG_TYPE_DEFAULT, "Invalidating existing timer; fireDate=%{public}@",
        buf,
        0xCu);
    }
    v53 = [(DNDSCalendarEventLifetimeMonitor *)v14 _eventStore];
    [v53 reset];

    v54 = [[DNDSXPCTimer alloc] initWithFireDate:0 serviceIdentifier:@"com.apple.donotdisturb.server.CalendarEventLifetimeMonitor.timer" userVisible:1];
    [v50 lifetimeMonitor:v14 setTimer:v54];

    v55 = *p_lifetimeTimerFireDate;
    *p_lifetimeTimerFireDate = 0;
  }
  if (!v47 && (!*p_lifetimeTimerFireDate || !v49))
  {
    v57 = DNDSLogCalendarEventLifetimeMonitor;
    if (os_log_type_enabled((os_log_t)DNDSLogCalendarEventLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v72 = v9;
      _os_log_impl(&dword_1D3052000, v57, OS_LOG_TYPE_DEFAULT, "Scheduling timer; nextUpdateDate=%{public}@", buf, 0xCu);
    }
    v58 = [[DNDSXPCTimer alloc] initWithFireDate:v9 serviceIdentifier:@"com.apple.donotdisturb.server.CalendarEventLifetimeMonitor.timer" userVisible:1];
    [v50 lifetimeMonitor:v14 setTimer:v58];

    objc_storeStrong((id *)&v14->_lifetimeTimerFireDate, v9);
  }
  v59 = [[DNDSLifetimeMonitorResult alloc] initWithActiveUUIDs:v63 expiredUUIDs:v62];

  return v59;
}

- (void)_calendarEventStoreChangedWithNotification:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1C9C8], "date", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(DNDSBaseLifetimeMonitor *)self refreshMonitorForDate:v4];
}

- (id)_eventStoreCreatingIfNeeded
{
  eventStore = self->_eventStore;
  if (!eventStore)
  {
    id v4 = (EKEventStore *)[objc_alloc(MEMORY[0x1E4F25550]) initWithEKOptions:128];
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__DNDSCalendarEventLifetimeMonitor__eventStoreCreatingIfNeeded__block_invoke;
    v10[3] = &unk_1E69735E0;
    dispatch_semaphore_t v11 = v5;
    id v6 = v5;
    [(EKEventStore *)v4 requestFullAccessToEventsWithCompletion:v10];
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    id v7 = self->_eventStore;
    self->_eventStore = v4;
    objc_super v8 = v4;

    eventStore = self->_eventStore;
  }
  return eventStore;
}

void __63__DNDSCalendarEventLifetimeMonitor__eventStoreCreatingIfNeeded__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = DNDSLogCalendarEventLifetimeMonitor;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogCalendarEventLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109378;
      v7[1] = 1;
      __int16 v8 = 2114;
      id v9 = v5;
      _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "Requested access to events, granted=%{BOOL}d error=%{public}@", (uint8_t *)v7, 0x12u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogCalendarEventLifetimeMonitor, OS_LOG_TYPE_ERROR))
  {
    __63__DNDSCalendarEventLifetimeMonitor__eventStoreCreatingIfNeeded__block_invoke_cold_1((uint64_t)v5, v6);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_eventStore
{
  return self->_eventStore;
}

- (id)_eventForCalendarEventLifetime:(id)a3 assertionStartDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isOnlyDuringEvent])
  {
    id v8 = [v6 occurrenceDate];
  }
  else
  {
    id v8 = v7;
  }
  id v9 = v8;
  uint64_t v10 = [v8 dateByAddingTimeInterval:900.0];
  dispatch_semaphore_t v11 = [(DNDSCalendarEventLifetimeMonitor *)self _eventStoreCreatingIfNeeded];
  uint64_t v12 = [v11 predicateForEventsWithStartDate:v9 endDate:v10 calendars:0];
  uint64_t v13 = [v11 eventsMatchingPredicate:v12];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__DNDSCalendarEventLifetimeMonitor__eventForCalendarEventLifetime_assertionStartDate___block_invoke;
  v18[3] = &unk_1E6973AD0;
  id v19 = v6;
  id v14 = v6;
  v15 = objc_msgSend(v13, "bs_filter:", v18);
  v16 = [v15 firstObject];

  return v16;
}

uint64_t __86__DNDSCalendarEventLifetimeMonitor__eventForCalendarEventLifetime_assertionStartDate___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueId];
  id v4 = [*(id *)(a1 + 32) eventUniqueID];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lifetimeTimerFireDate, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

void __63__DNDSCalendarEventLifetimeMonitor__eventStoreCreatingIfNeeded__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109378;
  v2[1] = 0;
  __int16 v3 = 2114;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "Requested access to events, granted=%{BOOL}d error=%{public}@", (uint8_t *)v2, 0x12u);
}

@end