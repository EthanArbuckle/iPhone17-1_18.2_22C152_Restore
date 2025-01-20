@interface DNDSScheduleLifetimeMonitor
+ (Class)lifetimeClass;
- (NSCalendar)calendar;
- (id)_activeDateIntervalForScheduleLifetime:(id)a3 assertion:(id)a4 date:(id)a5 ignoreMatchScheduleStartDate:(BOOL)a6;
- (id)_activeDateIntervalForScheduleLifetime:(id)a3 assertionStartDate:(id)a4 date:(id)a5 scheduleSettings:(id)a6 calendar:(id)a7 ignoreMatchScheduleStartDate:(BOOL)a8;
- (id)activeDateIntervalForScheduleLifetime:(id)a3 assertion:(id)a4 date:(id)a5;
- (id)nextActiveDateIntervalForScheduleLifetime:(id)a3 assertion:(id)a4 date:(id)a5;
- (id)updateForModeAssertions:(id)a3 date:(id)a4;
- (void)setCalendar:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DNDSScheduleLifetimeMonitor

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DNDSScheduleLifetimeMonitor;
  [(DNDSBaseLifetimeMonitor *)&v8 setDelegate:v4];
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__DNDSScheduleLifetimeMonitor_setDelegate___block_invoke;
    v5[3] = &unk_1E6973AA8;
    objc_copyWeak(&v6, &location);
    [v4 lifetimeMonitor:self registerTimerHandlerWithServiceIdentifier:@"com.apple.donotdisturb.server.ScheduleLifetimeMonitor.timer" handler:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __43__DNDSScheduleLifetimeMonitor_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isEqualToString:@"com.apple.donotdisturb.server.ScheduleLifetimeMonitor.timer"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v3 = [MEMORY[0x1E4F1C9C8] date];
    [WeakRetained refreshMonitorForDate:v3];
  }
}

- (id)activeDateIntervalForScheduleLifetime:(id)a3 assertion:(id)a4 date:(id)a5
{
  return [(DNDSScheduleLifetimeMonitor *)self _activeDateIntervalForScheduleLifetime:a3 assertion:a4 date:a5 ignoreMatchScheduleStartDate:1];
}

- (id)nextActiveDateIntervalForScheduleLifetime:(id)a3 assertion:(id)a4 date:(id)a5
{
  return [(DNDSScheduleLifetimeMonitor *)self _activeDateIntervalForScheduleLifetime:a3 assertion:a4 date:a5 ignoreMatchScheduleStartDate:0];
}

- (id)_activeDateIntervalForScheduleLifetime:(id)a3 assertion:(id)a4 date:(id)a5 ignoreMatchScheduleStartDate:(BOOL)a6
{
  BOOL v6 = a6;
  v53[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [v11 details];
  v14 = [v13 modeIdentifier];

  v15 = [(DNDSBaseLifetimeMonitor *)self dataSource];
  v16 = [v15 scheduleSettingsByModeIdentifierForScheduleLifetimeMonitor:self];

  if ([v14 isEqualToString:*MEMORY[0x1E4F5F550]])
  {
    id v17 = (id)*MEMORY[0x1E4F5F518];

    v14 = v17;
  }
  uint64_t v44 = [v11 startDate];
  calendar = self->_calendar;
  if (calendar)
  {
    v19 = calendar;
  }
  else
  {
    v19 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  }
  v43 = v19;
  v41 = v14;
  v20 = [v16 objectForKeyedSubscript:v14];
  v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    v23 = +[DNDSScheduleSettings defaultScheduleSettings];
    v53[0] = v23;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
  }
  v40 = v16;
  v42 = v11;

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v22;
  uint64_t v47 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  v24 = 0;
  if (v47)
  {
    uint64_t v46 = *(void *)v49;
    v26 = v43;
    v25 = (void *)v44;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v49 != v46) {
          objc_enumerationMutation(obj);
        }
        v28 = -[DNDSScheduleLifetimeMonitor _activeDateIntervalForScheduleLifetime:assertionStartDate:date:scheduleSettings:calendar:ignoreMatchScheduleStartDate:](self, "_activeDateIntervalForScheduleLifetime:assertionStartDate:date:scheduleSettings:calendar:ignoreMatchScheduleStartDate:", v10, v25, v12, *(void *)(*((void *)&v48 + 1) + 8 * i), v26, v6, v40);
        v29 = v28;
        if (!v24) {
          goto LABEL_18;
        }
        if (v28)
        {
          v30 = [v28 endDate];
          [v24 endDate];
          v32 = id v31 = v12;
          v33 = self;
          BOOL v34 = v6;
          id v35 = v10;
          uint64_t v36 = [v30 compare:v32];

          id v12 = v31;
          v26 = v43;

          BOOL v37 = v36 == -1;
          id v10 = v35;
          BOOL v6 = v34;
          self = v33;
          v25 = (void *)v44;
          if (v37)
          {
LABEL_18:
            id v38 = v29;

            v24 = v38;
          }
        }
      }
      uint64_t v47 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v47);
  }
  else
  {
    v26 = v43;
    v25 = (void *)v44;
  }

  return v24;
}

- (id)_activeDateIntervalForScheduleLifetime:(id)a3 assertionStartDate:(id)a4 date:(id)a5 scheduleSettings:(id)a6 calendar:(id)a7 ignoreMatchScheduleStartDate:(BOOL)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [a3 behavior];
  if (v17 == 1)
  {
    v18 = objc_msgSend(MEMORY[0x1E4F28C18], "dnds_dateIntervalUntilEndOfScheduleForScheduleSettings:startDate:calendar:", v15, v13, v16);
    if (v18) {
      goto LABEL_11;
    }
    id v23 = objc_alloc(MEMORY[0x1E4F28C18]);
    v19 = [MEMORY[0x1E4F1C9C8] distantFuture];
    v18 = (void *)[v23 initWithStartDate:v13 endDate:v19];
    goto LABEL_9;
  }
  if (!v17)
  {
    v18 = objc_msgSend(MEMORY[0x1E4F28C18], "dnds_dateIntervalForScheduleSettings:date:calendar:", v15, v14, v16);
    if (a8) {
      goto LABEL_11;
    }
    v19 = [v15 creationDate];
    if ([v19 compare:v13] == -1)
    {
      int v20 = [v18 containsDate:v13];

      if (!v20) {
        goto LABEL_11;
      }
      v21 = (void *)MEMORY[0x1E4F28C18];
      v19 = [v18 endDate];
      uint64_t v22 = objc_msgSend(v21, "dnds_dateIntervalForScheduleSettings:date:calendar:", v15, v19, v16);

      v18 = (void *)v22;
    }
LABEL_9:

    goto LABEL_11;
  }
  v18 = 0;
LABEL_11:

  return v18;
}

+ (Class)lifetimeClass
{
  return (Class)objc_opt_class();
}

- (id)updateForModeAssertions:(id)a3 date:(id)a4
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v85 = a4;
  v86 = self;
  v7 = [(DNDSBaseLifetimeMonitor *)self queue];
  dispatch_assert_queue_V2(v7);

  objc_super v8 = DNDSLogScheduleLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogScheduleLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v104 = v85;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Refreshing monitor, date=%{public}@", buf, 0xCu);
  }
  v9 = [(DNDSBaseLifetimeMonitor *)v86 dataSource];
  calendar = v86->_calendar;
  if (calendar)
  {
    id v11 = calendar;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  }
  v84 = v11;
  v70 = v9;
  v76 = [v9 scheduleSettingsByModeIdentifierForScheduleLifetimeMonitor:v86];
  v80 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v95 objects:v102 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v96;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v96 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        v18 = [v17 details];
        v19 = [v18 modeIdentifier];

        int v20 = [v80 objectForKeyedSubscript:v19];
        char v21 = [v20 BOOLValue];

        uint64_t v22 = [v17 details];
        id v23 = [v22 lifetime];

        v24 = NSNumber;
        BOOL v25 = (v21 & 1) != 0 || [v23 behavior] == 1;
        v26 = [v24 numberWithInt:v25];
        [v80 setObject:v26 forKey:v19];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v95 objects:v102 count:16];
    }
    while (v14);
  }

  v83 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v71 = [MEMORY[0x1E4F1CA48] array];
  v81 = [MEMORY[0x1E4F1CA48] array];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id obj = v12;
  uint64_t v77 = [obj countByEnumeratingWithState:&v91 objects:v101 count:16];
  if (v77)
  {
    uint64_t v75 = *(void *)v92;
    uint64_t v74 = *MEMORY[0x1E4F5F550];
    v72 = (void *)*MEMORY[0x1E4F5F518];
    do
    {
      for (uint64_t j = 0; j != v77; ++j)
      {
        if (*(void *)v92 != v75) {
          objc_enumerationMutation(obj);
        }
        v28 = *(void **)(*((void *)&v91 + 1) + 8 * j);
        v29 = [v28 details];
        v30 = [v29 modeIdentifier];

        if ([v30 isEqualToString:v74])
        {
          id v31 = v72;

          v30 = v31;
        }
        v32 = [v76 objectForKeyedSubscript:v30];
        v33 = v32;
        if (v32)
        {
          id v34 = v32;
        }
        else
        {
          id v35 = +[DNDSScheduleSettings defaultScheduleSettings];
          v100 = v35;
          id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
        }
        uint64_t v36 = [v28 details];
        BOOL v37 = [v36 lifetime];

        id v38 = [v80 objectForKeyedSubscript:v30];
        uint64_t v39 = [v38 BOOLValue];

        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        id v40 = v34;
        uint64_t v41 = [v40 countByEnumeratingWithState:&v87 objects:v99 count:16];
        if (!v41)
        {
          v55 = v40;
LABEL_48:

          goto LABEL_50;
        }
        uint64_t v42 = v41;
        v78 = v30;
        uint64_t v79 = j;
        char v82 = 0;
        uint64_t v43 = *(void *)v88;
        do
        {
          uint64_t v44 = 0;
          do
          {
            if (*(void *)v88 != v43) {
              objc_enumerationMutation(v40);
            }
            uint64_t v45 = *(void *)(*((void *)&v87 + 1) + 8 * v44);
            uint64_t v46 = [v28 startDate];
            uint64_t v47 = [(DNDSScheduleLifetimeMonitor *)v86 _activeDateIntervalForScheduleLifetime:v37 assertionStartDate:v46 date:v85 scheduleSettings:v45 calendar:v84 ignoreMatchScheduleStartDate:v39];

            if (v47)
            {
              uint64_t v48 = objc_msgSend(v47, "dnds_lifetimePhaseForDate:", v85);
              if (v48 == 2)
              {
                if ([v37 behavior] == 1)
                {
                  v53 = [v28 UUID];
                  [v81 addObject:v53];
                }
              }
              else
              {
                if (v48 == 1)
                {
                  v52 = [v47 endDate];
                  uint64_t v50 = [v83 earlierDate:v52];

                  char v82 = 1;
                }
                else
                {
                  if (v48) {
                    goto LABEL_40;
                  }
                  long long v49 = [v47 startDate];
                  uint64_t v50 = [v83 earlierDate:v49];
                }
                v83 = (void *)v50;
              }
            }
            else
            {
              long long v51 = DNDSLogScheduleLifetimeMonitor;
              if (os_log_type_enabled((os_log_t)DNDSLogScheduleLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                id v104 = v37;
                _os_log_impl(&dword_1D3052000, v51, OS_LOG_TYPE_DEFAULT, "Skipping inactive lifetime, lifetime=%{public}@", buf, 0xCu);
              }
            }
LABEL_40:

            ++v44;
          }
          while (v42 != v44);
          uint64_t v54 = [v40 countByEnumeratingWithState:&v87 objects:v99 count:16];
          uint64_t v42 = v54;
        }
        while (v54);

        if (v82)
        {
          v55 = [v28 UUID];
          [v71 addObject:v55];
          v30 = v78;
          uint64_t j = v79;
          goto LABEL_48;
        }
        v30 = v78;
        uint64_t j = v79;
LABEL_50:
      }
      uint64_t v77 = [obj countByEnumeratingWithState:&v91 objects:v101 count:16];
    }
    while (v77);
  }

  v56 = [MEMORY[0x1E4F1C9C8] distantFuture];
  char v57 = [v83 isEqualToDate:v56];

  p_lifetimeTimerFireDate = (id *)&v86->_lifetimeTimerFireDate;
  int v59 = [v83 isEqualToDate:v86->_lifetimeTimerFireDate];
  v60 = [(DNDSBaseLifetimeMonitor *)v86 delegate];
  if ((v57 & 1) != 0 || !v59)
  {
    v61 = DNDSLogScheduleLifetimeMonitor;
    if (os_log_type_enabled((os_log_t)DNDSLogScheduleLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      id v62 = *p_lifetimeTimerFireDate;
      *(_DWORD *)buf = 138543362;
      id v104 = v62;
      _os_log_impl(&dword_1D3052000, v61, OS_LOG_TYPE_DEFAULT, "Invalidating existing timer; fireDate=%{public}@",
        buf,
        0xCu);
    }
    v63 = [[DNDSXPCTimer alloc] initWithFireDate:0 serviceIdentifier:@"com.apple.donotdisturb.server.ScheduleLifetimeMonitor.timer" userVisible:1];
    [v60 lifetimeMonitor:v86 setTimer:v63];

    id v64 = *p_lifetimeTimerFireDate;
    id *p_lifetimeTimerFireDate = 0;
  }
  if ((v57 & 1) == 0)
  {
    char v65 = *p_lifetimeTimerFireDate ? v59 : 0;
    if ((v65 & 1) == 0)
    {
      v66 = DNDSLogScheduleLifetimeMonitor;
      if (os_log_type_enabled((os_log_t)DNDSLogScheduleLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v104 = v83;
        _os_log_impl(&dword_1D3052000, v66, OS_LOG_TYPE_DEFAULT, "Scheduling timer; nextUpdateDate=%{public}@",
          buf,
          0xCu);
      }
      v67 = [[DNDSXPCTimer alloc] initWithFireDate:v83 serviceIdentifier:@"com.apple.donotdisturb.server.ScheduleLifetimeMonitor.timer" userVisible:1];
      [v60 lifetimeMonitor:v86 setTimer:v67];

      objc_storeStrong(p_lifetimeTimerFireDate, v83);
    }
  }
  v68 = [[DNDSLifetimeMonitorResult alloc] initWithActiveUUIDs:v71 expiredUUIDs:v81];

  return v68;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_lifetimeTimerFireDate, 0);
}

@end