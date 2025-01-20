@interface DNDSExplicitRegionLocationLifetimeMonitor
- (BOOL)_saveDataToBackingStoreWithError:(id *)a3;
- (DNDSAggregateLocationLifetimeMonitor)aggregateMonitor;
- (DNDSExplicitRegionLocationLifetimeMonitor)initWithAggregateMonitor:(id)a3;
- (DNDSLifetimeMonitorDataSource)dataSource;
- (DNDSLifetimeMonitorDelegate)delegate;
- (NSArray)activeLifetimeAssertionUUIDs;
- (id)_queue_locationMonitorClientIdentifierForModeIdentifier:(id)a3 region:(id)a4;
- (void)_loadDataFromBackingStore;
- (void)_queue_invalidateAssertionOnExitFromRegion:(id)a3;
- (void)_queue_refreshMonitor;
- (void)_queue_resolveEnteredRegionIdentifiersWithAssertionRegionIdentifiers:(id)a3;
- (void)_queue_startMonitoringForRegion:(id)a3;
- (void)_queue_stopMonitoringForRegion:(id)a3;
- (void)_queue_takeAssertionOnEntryIntoRegion:(id)a3;
- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)setAggregateMonitor:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DNDSExplicitRegionLocationLifetimeMonitor

- (DNDSExplicitRegionLocationLifetimeMonitor)initWithAggregateMonitor:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DNDSExplicitRegionLocationLifetimeMonitor;
  v5 = [(DNDSExplicitRegionLocationLifetimeMonitor *)&v20 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_aggregateMonitor, v4);
    activeLifetimeAssertionUUIDs = v6->_activeLifetimeAssertionUUIDs;
    v6->_activeLifetimeAssertionUUIDs = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v8 = +[DNDSLocationTriggerConfiguration emptyConfiguration];
    currentConfiguration = v6->_currentConfiguration;
    v6->_currentConfiguration = (DNDSLocationTriggerConfiguration *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    enteredRegionIdentifiers = v6->_enteredRegionIdentifiers;
    v6->_enteredRegionIdentifiers = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    enteredRegionIdentifiersPendingExit = v6->_enteredRegionIdentifiersPendingExit;
    v6->_enteredRegionIdentifiersPendingExit = (NSMutableSet *)v12;

    v14 = [DNDSJSONBackingStore alloc];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_locationAssertionExplicitRegionFileURL");
    uint64_t v17 = [(DNDSJSONBackingStore *)v14 initWithRecordClass:v15 fileURL:v16 versionNumber:0];
    backingStore = v6->_backingStore;
    v6->_backingStore = (DNDSBackingStore *)v17;

    [(DNDSExplicitRegionLocationLifetimeMonitor *)v6 _loadDataFromBackingStore];
  }

  return v6;
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  id v12 = v9;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    uint64_t v15 = [(DNDSLocationTriggerConfiguration *)self->_currentConfiguration regionIdentifiers];
    v16 = [v14 identifier];
    int v17 = [v15 containsObject:v16];

    if (v17)
    {
      v18 = DNDSLogLocationLifetimeMonitor;
      if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 134218498;
        id v20 = v8;
        __int16 v21 = 2112;
        id v22 = v12;
        __int16 v23 = 2114;
        id v24 = v10;
        _os_log_impl(&dword_1D3052000, v18, OS_LOG_TYPE_DEFAULT, "Explicit region monitoring failed for region; manager=%p, region=%@, error=%{public}@",
          (uint8_t *)&v19,
          0x20u);
      }
    }
  }
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)DNDSLogLocationLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a4 > 2) {
      uint64_t v11 = @"<invalid>";
    }
    else {
      uint64_t v11 = off_1E6973EC8[a4];
    }
    *(_DWORD *)v46 = 134218498;
    *(void *)&v46[4] = v8;
    *(_WORD *)&v46[12] = 2114;
    *(void *)&v46[14] = v11;
    *(_WORD *)&v46[22] = 2112;
    id v47 = v9;
    id v12 = v10;
    _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_DEFAULT, "Explicit region region state was determined; manager=%p, state=%{public}@, region=%@",
      v46,
      0x20u);
  }
  uint64_t v13 = objc_opt_class();
  id v14 = v9;
  if (v13)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v16 = v15;

  if (v16)
  {
    int v17 = [(DNDSLocationTriggerConfiguration *)self->_currentConfiguration regionIdentifiers];
    v18 = [v16 identifier];
    int v19 = [v17 containsObject:v18];

    if (v19)
    {
      if (a4 == 2)
      {
        enteredRegionIdentifiers = self->_enteredRegionIdentifiers;
        v27 = [v16 identifier];
        LODWORD(enteredRegionIdentifiers) = [(NSMutableSet *)enteredRegionIdentifiers containsObject:v27];

        if (enteredRegionIdentifiers)
        {
          enteredRegionIdentifiersPendingExit = self->_enteredRegionIdentifiersPendingExit;
          v29 = [v16 identifier];
          int v30 = [(NSMutableSet *)enteredRegionIdentifiersPendingExit containsObject:v29];

          v31 = DNDSLogLocationLifetimeMonitor;
          BOOL v32 = os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT);
          if (v30)
          {
            if (v32)
            {
              *(_DWORD *)v46 = 138412290;
              *(void *)&v46[4] = v14;
              _os_log_impl(&dword_1D3052000, v31, OS_LOG_TYPE_DEFAULT, "Confirmed explicit region exit for a region pending exit following early invalidation of the assertion associated with prior entry, will note exit; region=%@",
                v46,
                0xCu);
            }
            v33 = self->_enteredRegionIdentifiers;
            v34 = objc_msgSend(v16, "identifier", *(_OWORD *)v46, *(void *)&v46[16], v47);
            [(NSMutableSet *)v33 removeObject:v34];

            v35 = self->_enteredRegionIdentifiersPendingExit;
            v36 = [v16 identifier];
            [(NSMutableSet *)v35 removeObject:v36];

            [(DNDSExplicitRegionLocationLifetimeMonitor *)self _saveDataToBackingStoreWithError:0];
          }
          else
          {
            if (v32)
            {
              *(_DWORD *)v46 = 138412290;
              *(void *)&v46[4] = v14;
              _os_log_impl(&dword_1D3052000, v31, OS_LOG_TYPE_DEFAULT, "Confirmed explicit region exit, will invalidate all assertions; region=%@",
                v46,
                0xCu);
            }
            v44 = self->_enteredRegionIdentifiers;
            v45 = objc_msgSend(v16, "identifier", *(void *)v46, *(_OWORD *)&v46[8], v47);
            [(NSMutableSet *)v44 removeObject:v45];

            [(DNDSExplicitRegionLocationLifetimeMonitor *)self _queue_invalidateAssertionOnExitFromRegion:v16];
          }
        }
        else
        {
          id v24 = DNDSLogLocationLifetimeMonitor;
          if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v46 = 138412290;
            *(void *)&v46[4] = v14;
            uint64_t v25 = "Received unexpected explicit region exit, region=%@";
            goto LABEL_33;
          }
        }
      }
      else if (a4 == 1)
      {
        id v20 = self->_enteredRegionIdentifiers;
        __int16 v21 = [v16 identifier];
        LOBYTE(v20) = [(NSMutableSet *)v20 containsObject:v21];

        if (v20)
        {
          id v22 = self->_enteredRegionIdentifiersPendingExit;
          __int16 v23 = [v16 identifier];
          LODWORD(v22) = [(NSMutableSet *)v22 containsObject:v23];

          if (v22)
          {
            id v24 = DNDSLogLocationLifetimeMonitor;
            if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v46 = 138412290;
              *(void *)&v46[4] = v14;
              uint64_t v25 = "Confirmed explicit region entry, not taking assertion until explicit exit following early invalidati"
                    "on of the assertion associated with prior entry; region=%@";
LABEL_33:
              _os_log_impl(&dword_1D3052000, v24, OS_LOG_TYPE_DEFAULT, v25, v46, 0xCu);
            }
          }
        }
        else
        {
          v41 = DNDSLogLocationLifetimeMonitor;
          if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v46 = 138412290;
            *(void *)&v46[4] = v14;
            _os_log_impl(&dword_1D3052000, v41, OS_LOG_TYPE_DEFAULT, "Confirmed explicit region entry; region=%@",
              v46,
              0xCu);
          }
          v42 = self->_enteredRegionIdentifiers;
          v43 = objc_msgSend(v16, "identifier", *(void *)v46, *(_OWORD *)&v46[8], v47);
          [(NSMutableSet *)v42 addObject:v43];

          [(DNDSExplicitRegionLocationLifetimeMonitor *)self _queue_takeAssertionOnEntryIntoRegion:v16];
        }
      }
      else
      {
        v37 = (void *)DNDSLogLocationLifetimeMonitor;
        if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
        {
          v38 = @"<invalid>";
          if (!a4) {
            v38 = @"unknown";
          }
          v39 = v38;
          *(_DWORD *)v46 = 138543618;
          *(void *)&v46[4] = v39;
          *(_WORD *)&v46[12] = 2112;
          *(void *)&v46[14] = v14;
          v40 = v37;
          _os_log_impl(&dword_1D3052000, v40, OS_LOG_TYPE_DEFAULT, "Did not handle explicit region state %{public}@; region=%@",
            v46,
            0x16u);
        }
      }
    }
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = DNDSLogLocationLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218242;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Explicit region monitoring encountered a failure; manager=%p, error=%{public}@",
      (uint8_t *)&v8,
      0x16u);
  }
}

- (void)_queue_refreshMonitor
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  v3 = [(DNDSExplicitRegionLocationLifetimeMonitor *)self aggregateMonitor];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  id v5 = [v3 dataSource];
  id v6 = DNDSLogLocationLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "Refreshing explicit region monitor", buf, 2u);
  }
  v7 = self->_currentConfiguration;
  int v8 = [v5 locationTriggerConfigurationForLifetimeMonitor:v3];
  currentConfiguration = self->_currentConfiguration;
  self->_currentConfiguration = v8;

  v49 = v7;
  __int16 v10 = [(DNDSLocationTriggerConfiguration *)v7 regions];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1CAD0] set];
  }
  uint64_t v13 = v12;

  id v14 = [(DNDSLocationTriggerConfiguration *)self->_currentConfiguration regions];
  uint64_t v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [MEMORY[0x1E4F1CAD0] set];
  }
  int v17 = v16;

  v18 = (void *)[v13 mutableCopy];
  [v18 minusSet:v17];
  id v47 = v17;
  int v19 = (void *)[v17 mutableCopy];
  uint64_t v48 = v13;
  [v19 minusSet:v13];
  v50 = v5;
  v51 = v3;
  id v20 = [v5 lifetimeMonitor:v3 modeAssertionsWithLifetimeClass:objc_opt_class()];
  v53 = [MEMORY[0x1E4F1CA48] array];
  v52 = [MEMORY[0x1E4F1CA48] array];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v21 = v18;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v63 objects:v70 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v64 != v24) {
          objc_enumerationMutation(v21);
        }
        [(DNDSExplicitRegionLocationLifetimeMonitor *)self _queue_stopMonitoringForRegion:*(void *)(*((void *)&v63 + 1) + 8 * i)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v63 objects:v70 count:16];
    }
    while (v23);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v26 = v19;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v59 objects:v69 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v60 != v29) {
          objc_enumerationMutation(v26);
        }
        [(DNDSExplicitRegionLocationLifetimeMonitor *)self _queue_startMonitoringForRegion:*(void *)(*((void *)&v59 + 1) + 8 * j)];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v59 objects:v69 count:16];
    }
    while (v28);
  }
  v46 = v26;

  v54 = [MEMORY[0x1E4F1CA80] set];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v31 = v20;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v55 objects:v68 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v56;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v56 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = *(void **)(*((void *)&v55 + 1) + 8 * k);
        v37 = [v36 details];
        v38 = [v37 lifetime];
        v39 = [v38 region];

        LODWORD(v37) = [v21 containsObject:v39];
        v40 = [v36 UUID];
        if (v37)
        {
          v41 = v53;
        }
        else
        {
          [v52 addObject:v40];

          v40 = [v39 identifier];
          v41 = v54;
        }
        [v41 addObject:v40];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v55 objects:v68 count:16];
    }
    while (v33);
  }

  [(DNDSExplicitRegionLocationLifetimeMonitor *)self _queue_resolveEnteredRegionIdentifiersWithAssertionRegionIdentifiers:v54];
  if (([(NSArray *)self->_activeLifetimeAssertionUUIDs isEqual:v52] & 1) == 0)
  {
    v42 = (NSArray *)[v52 copy];
    activeLifetimeAssertionUUIDs = self->_activeLifetimeAssertionUUIDs;
    self->_activeLifetimeAssertionUUIDs = v42;
  }
  v44 = [v51 delegate];
  v45 = [MEMORY[0x1E4F1C9C8] date];
  [v44 lifetimeMonitor:v51 lifetimeDidExpireForAssertionUUIDs:v53 expirationDate:v45];
}

- (void)_queue_resolveEnteredRegionIdentifiersWithAssertionRegionIdentifiers:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(DNDSExplicitRegionLocationLifetimeMonitor *)self aggregateMonitor];
  id v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  v7 = (void *)[(NSMutableSet *)self->_enteredRegionIdentifiers mutableCopy];
  [v7 minusSet:v4];

  if (([v7 isEqualToSet:self->_enteredRegionIdentifiersPendingExit] & 1) == 0)
  {
    int v8 = (void *)DNDSLogLocationLifetimeMonitor;
    if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      __int16 v10 = [v7 allObjects];
      int v11 = 138543362;
      id v12 = v10;
      _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "Assertion(s) for region(s) invalidated without exit from region(s); regions=%{public}@",
        (uint8_t *)&v11,
        0xCu);
    }
    objc_storeStrong((id *)&self->_enteredRegionIdentifiersPendingExit, v7);
    [(DNDSExplicitRegionLocationLifetimeMonitor *)self _saveDataToBackingStoreWithError:0];
  }
}

- (void)_queue_startMonitoringForRegion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(DNDSExplicitRegionLocationLifetimeMonitor *)self aggregateMonitor];
  id v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  v7 = DNDSLogLocationLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Start monitoring for region; region=%@",
      (uint8_t *)&v9,
      0xCu);
  }
  int v8 = [v5 locationManager];
  [v8 startMonitoringForRegion:v4];
}

- (void)_queue_stopMonitoringForRegion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(DNDSExplicitRegionLocationLifetimeMonitor *)self aggregateMonitor];
  id v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  v7 = DNDSLogLocationLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v4;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Stop monitoring for region; region=%@",
      (uint8_t *)&v19,
      0xCu);
  }
  enteredRegionIdentifiers = self->_enteredRegionIdentifiers;
  int v9 = [v4 identifier];
  LODWORD(enteredRegionIdentifiers) = [(NSMutableSet *)enteredRegionIdentifiers containsObject:v9];

  if (enteredRegionIdentifiers)
  {
    id v10 = DNDSLogLocationLifetimeMonitor;
    if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v4;
      _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_DEFAULT, "Monitoring stopped for an entered region, associated assertion will be invalidated and entrance reset; region=%@",
        (uint8_t *)&v19,
        0xCu);
    }
    uint64_t v11 = self->_enteredRegionIdentifiers;
    id v12 = [v4 identifier];
    [(NSMutableSet *)v11 removeObject:v12];

    enteredRegionIdentifiersPendingExit = self->_enteredRegionIdentifiersPendingExit;
    id v14 = [v4 identifier];
    LODWORD(enteredRegionIdentifiersPendingExit) = [(NSMutableSet *)enteredRegionIdentifiersPendingExit containsObject:v14];

    if (enteredRegionIdentifiersPendingExit)
    {
      uint64_t v15 = DNDSLogLocationLifetimeMonitor;
      if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        id v20 = v4;
        _os_log_impl(&dword_1D3052000, v15, OS_LOG_TYPE_DEFAULT, "Monitoring stopped for an entered region pending exit following early invalidation of the assertion associated with prior entry, entrance will be reset; region=%@",
          (uint8_t *)&v19,
          0xCu);
      }
      id v16 = self->_enteredRegionIdentifiersPendingExit;
      int v17 = [v4 identifier];
      [(NSMutableSet *)v16 removeObject:v17];

      [(DNDSExplicitRegionLocationLifetimeMonitor *)self _saveDataToBackingStoreWithError:0];
    }
  }
  v18 = [v5 locationManager];
  [v18 stopMonitoringForRegion:v4];
}

- (void)_queue_takeAssertionOnEntryIntoRegion:(id)a3
{
  id v4 = a3;
  id v12 = [(DNDSExplicitRegionLocationLifetimeMonitor *)self aggregateMonitor];
  id v5 = [v12 queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(DNDSLocationTriggerConfiguration *)self->_currentConfiguration modeIdentifierForRegion:v4];
  v7 = [(DNDSExplicitRegionLocationLifetimeMonitor *)self _queue_locationMonitorClientIdentifierForModeIdentifier:v6 region:v4];
  id v8 = objc_alloc_init(MEMORY[0x1E4F5F700]);
  [v8 setIdentifier:v7];
  int v9 = [MEMORY[0x1E4F5F638] lifetimeWithExplicitRegion:v4];

  [v8 setLifetime:v9];
  [v8 setModeIdentifier:v6];
  [v8 setReason:3];
  id v10 = [v12 delegate];
  id v11 = (id)[v10 lifetimeMonitor:v12 takeModeAssertionWithDetails:v8 clientIdentifier:v7 error:0];
}

- (void)_queue_invalidateAssertionOnExitFromRegion:(id)a3
{
  id v4 = a3;
  id v5 = [(DNDSExplicitRegionLocationLifetimeMonitor *)self aggregateMonitor];
  id v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  v7 = [v5 dataSource];
  id v8 = [v7 lifetimeMonitor:self modeAssertionsWithLifetimeClass:objc_opt_class()];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__DNDSExplicitRegionLocationLifetimeMonitor__queue_invalidateAssertionOnExitFromRegion___block_invoke;
  v13[3] = &unk_1E6973E68;
  id v14 = v4;
  id v9 = v4;
  id v10 = objc_msgSend(v8, "bs_mapNoNulls:", v13);
  id v11 = [v5 delegate];
  id v12 = [MEMORY[0x1E4F1C9C8] date];
  [v11 lifetimeMonitor:v5 lifetimeDidExpireForAssertionUUIDs:v10 expirationDate:v12];
}

id __88__DNDSExplicitRegionLocationLifetimeMonitor__queue_invalidateAssertionOnExitFromRegion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 details];
  id v5 = [v4 lifetime];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = [v9 region];

  if ([v10 isEqual:*(void *)(a1 + 32)])
  {
    id v11 = [v3 UUID];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_queue_locationMonitorClientIdentifierForModeIdentifier:(id)a3 region:(id)a4
{
  id v5 = NSString;
  id v6 = a3;
  id v7 = [a4 identifier];
  id v8 = [v5 stringWithFormat:@"%@.private.region.%@", v6, v7];

  return v8;
}

- (void)_loadDataFromBackingStore
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to load current explicit region database, will request a radar; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (BOOL)_saveDataToBackingStoreWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[(DNDSExplicitRegionStore *)self->_store mutableCopy];
  [v5 setEnteredRegionIdentifiersPendingExit:self->_enteredRegionIdentifiersPendingExit];
  backingStore = self->_backingStore;
  id v15 = 0;
  uint64_t v7 = [(DNDSBackingStore *)backingStore writeRecord:v5 error:&v15];
  id v8 = v15;
  if (v7)
  {
    if (v7 == 1)
    {
      uint64_t v13 = DNDSLogLocationLifetimeMonitor;
      if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v17 = v8;
        id v10 = "Failed to write explicit region store, but error can be ignored; error=%{public}@";
        id v11 = v13;
        uint32_t v12 = 12;
        goto LABEL_11;
      }
    }
    else if (v7 == 2)
    {
      uint64_t v9 = DNDSLogLocationLifetimeMonitor;
      if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v10 = "Wrote out explicit region store to file";
        id v11 = v9;
        uint32_t v12 = 2;
LABEL_11:
        _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_ERROR)) {
      -[DNDSExplicitRegionLocationLifetimeMonitor _saveDataToBackingStoreWithError:]();
    }
    _DNDSRequestRadar(@"Failed to write store", v8, 0, @"/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSLocationLifetimeMonitor.m", 498);
  }
  if (a3 && v8) {
    *a3 = v8;
  }

  return v7 == 2;
}

- (DNDSAggregateLocationLifetimeMonitor)aggregateMonitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_aggregateMonitor);
  return (DNDSAggregateLocationLifetimeMonitor *)WeakRetained;
}

- (void)setAggregateMonitor:(id)a3
{
}

- (NSArray)activeLifetimeAssertionUUIDs
{
  return self->_activeLifetimeAssertionUUIDs;
}

- (DNDSLifetimeMonitorDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (DNDSLifetimeMonitorDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (DNDSLifetimeMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDSLifetimeMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_activeLifetimeAssertionUUIDs, 0);
  objc_destroyWeak((id *)&self->_aggregateMonitor);
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_enteredRegionIdentifiersPendingExit, 0);
  objc_storeStrong((id *)&self->_enteredRegionIdentifiers, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
}

- (void)_saveDataToBackingStoreWithError:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to write explicit region store, will request radar; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

@end