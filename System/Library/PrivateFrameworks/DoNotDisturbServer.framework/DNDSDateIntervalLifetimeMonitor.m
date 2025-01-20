@interface DNDSDateIntervalLifetimeMonitor
+ (Class)lifetimeClass;
- (id)updateForModeAssertions:(id)a3 date:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation DNDSDateIntervalLifetimeMonitor

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DNDSDateIntervalLifetimeMonitor;
  [(DNDSBaseLifetimeMonitor *)&v8 setDelegate:v4];
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __47__DNDSDateIntervalLifetimeMonitor_setDelegate___block_invoke;
    v5[3] = &unk_1E6973AA8;
    objc_copyWeak(&v6, &location);
    [v4 lifetimeMonitor:self registerTimerHandlerWithServiceIdentifier:@"com.apple.donotdisturb.server.DateIntervalLifetimeMonitor.timer" handler:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __47__DNDSDateIntervalLifetimeMonitor_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isEqualToString:@"com.apple.donotdisturb.server.DateIntervalLifetimeMonitor.timer"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v3 = [MEMORY[0x1E4F1C9C8] date];
    [WeakRetained refreshMonitorForDate:v3];
  }
}

+ (Class)lifetimeClass
{
  return (Class)objc_opt_class();
}

- (id)updateForModeAssertions:(id)a3 date:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(DNDSBaseLifetimeMonitor *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = DNDSLogDateIntervalLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogDateIntervalLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v48 = v7;
    _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "Refreshing monitor, date=%{public}@", buf, 0xCu);
  }
  v39 = self;
  v10 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v41 = [MEMORY[0x1E4F1CA48] array];
  v40 = [MEMORY[0x1E4F1CA48] array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v17 = [v16 details];
        v18 = [v17 lifetime];

        v19 = [v18 dateInterval];
        uint64_t v20 = objc_msgSend(v19, "dnds_lifetimePhaseForDate:", v7);
        if (v20 == 2)
        {
          v23 = [v16 UUID];
          [v40 addObject:v23];
        }
        else
        {
          if (v20 == 1)
          {
            v22 = [v16 UUID];
            [v41 addObject:v22];

            uint64_t v21 = [v19 endDate];
          }
          else
          {
            if (v20) {
              goto LABEL_16;
            }
            uint64_t v21 = [v19 startDate];
          }
          v23 = (void *)v21;
          uint64_t v24 = [v10 earlierDate:v21];

          v10 = (void *)v24;
        }

LABEL_16:
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v13);
  }

  v25 = [MEMORY[0x1E4F1C9C8] distantFuture];
  char v26 = [v10 isEqualToDate:v25];

  p_lifetimeTimerFireDate = (id *)&v39->_lifetimeTimerFireDate;
  int v28 = [v10 isEqualToDate:v39->_lifetimeTimerFireDate];
  v29 = [(DNDSBaseLifetimeMonitor *)v39 delegate];
  if ((v26 & 1) != 0 || !v28)
  {
    v30 = DNDSLogDateIntervalLifetimeMonitor;
    if (os_log_type_enabled((os_log_t)DNDSLogDateIntervalLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = *p_lifetimeTimerFireDate;
      *(_DWORD *)buf = 138543362;
      id v48 = v31;
      _os_log_impl(&dword_1D3052000, v30, OS_LOG_TYPE_DEFAULT, "Invalidating existing timer; fireDate=%{public}@",
        buf,
        0xCu);
    }
    v32 = [[DNDSXPCTimer alloc] initWithFireDate:0 serviceIdentifier:@"com.apple.donotdisturb.server.DateIntervalLifetimeMonitor.timer" userVisible:1];
    [v29 lifetimeMonitor:v39 setTimer:v32];

    id v33 = *p_lifetimeTimerFireDate;
    id *p_lifetimeTimerFireDate = 0;
  }
  if ((v26 & 1) == 0)
  {
    char v34 = *p_lifetimeTimerFireDate ? v28 : 0;
    if ((v34 & 1) == 0)
    {
      v35 = DNDSLogDateIntervalLifetimeMonitor;
      if (os_log_type_enabled((os_log_t)DNDSLogDateIntervalLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v48 = v10;
        _os_log_impl(&dword_1D3052000, v35, OS_LOG_TYPE_DEFAULT, "Scheduling timer; nextUpdateDate=%{public}@",
          buf,
          0xCu);
      }
      v36 = [[DNDSXPCTimer alloc] initWithFireDate:v10 serviceIdentifier:@"com.apple.donotdisturb.server.DateIntervalLifetimeMonitor.timer" userVisible:1];
      [v29 lifetimeMonitor:v39 setTimer:v36];

      objc_storeStrong(p_lifetimeTimerFireDate, v10);
    }
  }
  v37 = [[DNDSLifetimeMonitorResult alloc] initWithActiveUUIDs:v41 expiredUUIDs:v40];

  return v37;
}

- (void).cxx_destruct
{
}

@end