@interface DNDSUntilExitLocationLifetimeMonitor
- (BOOL)_saveDataToBackingStoreWithError:(id *)a3;
- (BOOL)hasCurrentRegion;
- (DNDSAggregateLocationLifetimeMonitor)aggregateMonitor;
- (DNDSLifetimeMonitorDataSource)dataSource;
- (DNDSLifetimeMonitorDelegate)delegate;
- (DNDSUntilExitLocationLifetimeMonitor)initWithAggregateMonitor:(id)a3;
- (NSArray)activeLifetimeAssertionUUIDs;
- (void)_loadDataFromBackingStore;
- (void)_queue_beginMonitoringCurrentLocation;
- (void)_queue_geofenceLocation:(id)a3;
- (void)_queue_geofenceRegion:(id)a3;
- (void)_queue_refreshMonitor;
- (void)_queue_sendExpiryEventForAllLocationAssertions;
- (void)_queue_stopMonitoringCurrentLocation;
- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)setAggregateMonitor:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DNDSUntilExitLocationLifetimeMonitor

- (DNDSUntilExitLocationLifetimeMonitor)initWithAggregateMonitor:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DNDSUntilExitLocationLifetimeMonitor;
  v5 = [(DNDSUntilExitLocationLifetimeMonitor *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_aggregateMonitor, v4);
    activeLifetimeAssertionUUIDs = v6->_activeLifetimeAssertionUUIDs;
    v6->_activeLifetimeAssertionUUIDs = (NSArray *)MEMORY[0x1E4F1CBF0];

    v8 = [DNDSJSONBackingStore alloc];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_locationAssertionUntilExitRegionFileURL");
    uint64_t v11 = [(DNDSJSONBackingStore *)v8 initWithRecordClass:v9 fileURL:v10 versionNumber:0];
    backingStore = v6->_backingStore;
    v6->_backingStore = (DNDSBackingStore *)v11;

    [(DNDSUntilExitLocationLifetimeMonitor *)v6 _loadDataFromBackingStore];
  }

  return v6;
}

- (BOOL)hasCurrentRegion
{
  return self->_currentRegion != 0;
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CLRegion *)self->_currentRegion isEqual:v9])
  {
    uint64_t v11 = DNDSLogLocationLifetimeMonitor;
    if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218498;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_DEFAULT, "Until I leave location monitoring failed for region, will stop monitor and invalidate all assertions; manager=%p"
        ", region=%@, error=%{public}@",
        (uint8_t *)&v12,
        0x20u);
    }
    [(DNDSUntilExitLocationLifetimeMonitor *)self _queue_stopMonitoringCurrentLocation];
    [(DNDSUntilExitLocationLifetimeMonitor *)self _queue_sendExpiryEventForAllLocationAssertions];
  }
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(CLRegion *)self->_currentRegion identifier];
  uint64_t v11 = [v9 identifier];
  int v12 = [v10 isEqualToString:v11];

  if (v12)
  {
    id v13 = (void *)DNDSLogLocationLifetimeMonitor;
    if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)a4 > 2) {
        __int16 v14 = @"<invalid>";
      }
      else {
        __int16 v14 = off_1E6973EC8[a4];
      }
      *(_DWORD *)v24 = 134218498;
      *(void *)&v24[4] = v8;
      *(_WORD *)&v24[12] = 2114;
      *(void *)&v24[14] = v14;
      *(_WORD *)&v24[22] = 2112;
      id v25 = v9;
      id v15 = v13;
      _os_log_impl(&dword_1D3052000, v15, OS_LOG_TYPE_DEFAULT, "Until I leave location region state was determined; manager=%p, state=%{public}@, region=%@",
        v24,
        0x20u);
    }
    if (a4 == 2)
    {
      BOOL regionEntered = self->_regionEntered;
      uint64_t v18 = DNDSLogLocationLifetimeMonitor;
      BOOL v19 = os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT);
      if (regionEntered)
      {
        if (v19)
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_1D3052000, v18, OS_LOG_TYPE_DEFAULT, "Confirmed until I leave region exit, will invalidate all assertions", v24, 2u);
        }
        [(DNDSUntilExitLocationLifetimeMonitor *)self _queue_sendExpiryEventForAllLocationAssertions];
      }
      else
      {
        if (v19)
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_1D3052000, v18, OS_LOG_TYPE_DEFAULT, "Received unexpected until I leave region exit, will start region monitoring again", v24, 2u);
        }
        [(DNDSUntilExitLocationLifetimeMonitor *)self _queue_stopMonitoringCurrentLocation];
        [(DNDSUntilExitLocationLifetimeMonitor *)self _queue_beginMonitoringCurrentLocation];
      }
    }
    else if (a4 == 1)
    {
      if (!self->_regionEntered)
      {
        __int16 v16 = DNDSLogLocationLifetimeMonitor;
        if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_1D3052000, v16, OS_LOG_TYPE_DEFAULT, "Confirmed until I leave region entry", v24, 2u);
        }
        self->_BOOL regionEntered = 1;
        -[DNDSUntilExitLocationLifetimeMonitor _saveDataToBackingStoreWithError:](self, "_saveDataToBackingStoreWithError:", 0, *(_OWORD *)v24, *(void *)&v24[16], v25);
      }
    }
    else
    {
      v20 = (void *)DNDSLogLocationLifetimeMonitor;
      if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
      {
        v21 = @"<invalid>";
        if (!a4) {
          v21 = @"unknown";
        }
        v22 = v21;
        *(_DWORD *)v24 = 138543362;
        *(void *)&v24[4] = v22;
        v23 = v20;
        _os_log_impl(&dword_1D3052000, v23, OS_LOG_TYPE_DEFAULT, "Did not handle until I leave region state %{public}@", v24, 0xCu);
      }
    }
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = DNDSLogLocationLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218242;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Until I leave location monitoring found location, will update geofence; manager=%p, locations=%@",
      (uint8_t *)&v10,
      0x16u);
  }
  id v9 = [v7 lastObject];
  [(DNDSUntilExitLocationLifetimeMonitor *)self _queue_geofenceLocation:v9];
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = DNDSLogLocationLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Until I leave location monitoring failed, will stop monitor and invalidate all assertions; manager=%p, error=%{public}@",
      (uint8_t *)&v9,
      0x16u);
  }
  [(DNDSUntilExitLocationLifetimeMonitor *)self _queue_stopMonitoringCurrentLocation];
  [(DNDSUntilExitLocationLifetimeMonitor *)self _queue_sendExpiryEventForAllLocationAssertions];
}

- (void)_queue_refreshMonitor
{
  v3 = [(DNDSUntilExitLocationLifetimeMonitor *)self aggregateMonitor];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  v5 = DNDSLogLocationLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v11 = 0;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Refreshing until I leave monitor", v11, 2u);
  }
  id v6 = [v3 dataSource];
  id v7 = [v6 lifetimeMonitor:v3 modeAssertionsWithLifetimeClass:objc_opt_class()];

  id v8 = objc_msgSend(v7, "bs_mapNoNulls:", &__block_literal_global_5);
  if (![(NSArray *)self->_activeLifetimeAssertionUUIDs isEqualToArray:v8])
  {
    int v9 = (NSArray *)[v8 copy];
    activeLifetimeAssertionUUIDs = self->_activeLifetimeAssertionUUIDs;
    self->_activeLifetimeAssertionUUIDs = v9;
  }
  if ([(NSArray *)self->_activeLifetimeAssertionUUIDs count] && !self->_hasActiveLifetimes)
  {
    self->_hasActiveLifetimes = 1;
    [(DNDSUntilExitLocationLifetimeMonitor *)self _queue_beginMonitoringCurrentLocation];
  }
  else if (![(NSArray *)self->_activeLifetimeAssertionUUIDs count] && self->_hasActiveLifetimes)
  {
    [(DNDSUntilExitLocationLifetimeMonitor *)self _queue_stopMonitoringCurrentLocation];
    self->_hasActiveLifetimes = 0;
  }
}

uint64_t __61__DNDSUntilExitLocationLifetimeMonitor__queue_refreshMonitor__block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

- (void)_queue_beginMonitoringCurrentLocation
{
  v2 = [(DNDSUntilExitLocationLifetimeMonitor *)self aggregateMonitor];
  v3 = [v2 queue];
  dispatch_assert_queue_V2(v3);

  id v4 = DNDSLogLocationLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Requesting current location to begin monitoring until I leave", v6, 2u);
  }
  v5 = [v2 locationManager];
  [v5 requestLocation];
}

- (void)_queue_stopMonitoringCurrentLocation
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(DNDSUntilExitLocationLifetimeMonitor *)self aggregateMonitor];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  if (self->_currentRegion)
  {
    v5 = DNDSLogLocationLifetimeMonitor;
    if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      currentRegion = self->_currentRegion;
      int v9 = 138412290;
      id v10 = currentRegion;
      _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Until I leave location monitoring stopping for geofence; region=%@",
        (uint8_t *)&v9,
        0xCu);
    }
    id v7 = [v3 locationManager];
    [v7 stopMonitoringForRegion:self->_currentRegion];

    id v8 = self->_currentRegion;
    self->_currentRegion = 0;

    self->_BOOL regionEntered = 0;
    [(DNDSUntilExitLocationLifetimeMonitor *)self _saveDataToBackingStoreWithError:0];
  }
}

- (void)_queue_geofenceLocation:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_aggregateMonitor);
  v5 = [WeakRetained queue];
  dispatch_assert_queue_V2(v5);

  if (self->_hasActiveLifetimes)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1E5A8]);
    [v9 coordinate];
    id v7 = (CLRegion *)objc_msgSend(v6, "initWithCenter:radius:identifier:", @"com.apple.donotdisturb.server.until-i-leave");
    currentRegion = self->_currentRegion;
    self->_currentRegion = v7;

    [(CLRegion *)self->_currentRegion setNotifyOnExit:1];
    [(CLRegion *)self->_currentRegion setNotifyOnEntry:0];
    self->_BOOL regionEntered = 0;
    [(DNDSUntilExitLocationLifetimeMonitor *)self _queue_geofenceRegion:self->_currentRegion];
  }
}

- (void)_queue_geofenceRegion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = [(DNDSUntilExitLocationLifetimeMonitor *)self aggregateMonitor];
  v5 = [v4 queue];
  dispatch_assert_queue_V2(v5);

  if (self->_hasActiveLifetimes)
  {
    id v6 = [v4 locationManager];
    [v6 startMonitoringForRegion:self->_currentRegion];

    [(DNDSUntilExitLocationLifetimeMonitor *)self _saveDataToBackingStoreWithError:0];
    id v7 = DNDSLogLocationLifetimeMonitor;
    if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      currentRegion = self->_currentRegion;
      int v9 = 138412290;
      id v10 = currentRegion;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Until I leave location monitoring started for geofence; region=%@",
        (uint8_t *)&v9,
        0xCu);
    }
  }
}

- (void)_queue_sendExpiryEventForAllLocationAssertions
{
  id v8 = [(DNDSUntilExitLocationLifetimeMonitor *)self aggregateMonitor];
  v3 = [v8 queue];
  dispatch_assert_queue_V2(v3);

  if ([(NSArray *)self->_activeLifetimeAssertionUUIDs count])
  {
    activeLifetimeAssertionUUIDs = self->_activeLifetimeAssertionUUIDs;
    self->_activeLifetimeAssertionUUIDs = (NSArray *)MEMORY[0x1E4F1CBF0];
    v5 = activeLifetimeAssertionUUIDs;

    id v6 = [v8 delegate];
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    [v6 lifetimeMonitor:v8 lifetimeDidExpireForAssertionUUIDs:v5 expirationDate:v7];
  }
}

- (void)_loadDataFromBackingStore
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to load current until I leave region database, will request a radar; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

uint64_t __65__DNDSUntilExitLocationLifetimeMonitor__loadDataFromBackingStore__block_invoke(uint64_t a1)
{
  uint64_t v2 = DNDSLogLocationLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D3052000, v2, OS_LOG_TYPE_DEFAULT, "Found existing until I leave region to begin monitoring", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_geofenceRegion:", *(void *)(*(void *)(a1 + 32) + 8));
}

- (BOOL)_saveDataToBackingStoreWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[(DNDSUntilExitRegionStore *)self->_store mutableCopy];
  [v5 setActiveLifetimeAssertionUUIDs:self->_activeLifetimeAssertionUUIDs];
  uint8_t v6 = [NSNumber numberWithBool:self->_hasActiveLifetimes];
  [v5 setHasActiveLifetimes:v6];

  [v5 setCurrentRegion:self->_currentRegion];
  id v7 = [NSNumber numberWithBool:self->_regionEntered];
  [v5 setRegionEntered:v7];

  backingStore = self->_backingStore;
  id v17 = 0;
  uint64_t v9 = [(DNDSBackingStore *)backingStore writeRecord:v5 error:&v17];
  id v10 = v17;
  if (v9)
  {
    if (v9 == 1)
    {
      uint64_t v15 = DNDSLogLocationLifetimeMonitor;
      if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = v10;
        id v12 = "Failed to write until I leave store, but error can be ignored; error=%{public}@";
        uint64_t v13 = v15;
        uint32_t v14 = 12;
        goto LABEL_11;
      }
    }
    else if (v9 == 2)
    {
      uint64_t v11 = DNDSLogLocationLifetimeMonitor;
      if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v12 = "Wrote out until I leave store to file";
        uint64_t v13 = v11;
        uint32_t v14 = 2;
LABEL_11:
        _os_log_impl(&dword_1D3052000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_ERROR)) {
      -[DNDSUntilExitLocationLifetimeMonitor _saveDataToBackingStoreWithError:]();
    }
    _DNDSRequestRadar(@"Failed to write store", v10, 0, @"/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSLocationLifetimeMonitor.m", 940);
  }
  if (a3 && v10) {
    *a3 = v10;
  }

  return v9 == 2;
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
  objc_storeStrong((id *)&self->_currentRegion, 0);
}

- (void)_saveDataToBackingStoreWithError:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to write until I leave store, will request radar; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

@end