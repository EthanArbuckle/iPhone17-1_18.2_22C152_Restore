@interface GEOOfflineDataConfiguration
+ (GEOOfflineDataConfiguration)sharedConfiguration;
- (BOOL)_isUpdateAvailableIsolated;
- (BOOL)_isUpdateRequiredIsolated;
- (BOOL)isUpdateAvailable;
- (BOOL)isUpdateRequired;
- (GEOOfflineDataConfiguration)init;
- (GEOPBOfflineTileMetadata)tileMetadata;
- (NSArray)requiredLayers;
- (NSDate)lastUpdatedDate;
- (NSDictionary)activeVersions;
- (NSDictionary)latestAvailableVersions;
- (id)_configurationIsolated;
- (id)_requiredLayersIsolated;
- (id)captureStatePlistWithHints:(os_state_hints_s *)a3;
- (unint64_t)activeReleaseDataVersion;
- (unsigned)regulatoryRegionID;
- (void)_broadcastUpdateAvailability;
- (void)_regulatoryRegionOverrideDidChange;
- (void)_setLatestReleaseDataVersionIsCurrentWithConfiguration:(id)a3;
- (void)_updateAvailableOverrideChanged;
- (void)_writeConfiguration;
- (void)dealloc;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5;
- (void)setActiveReleaseDataVersion:(unint64_t)a3;
- (void)setLastUpdatedDateToNow;
- (void)setLatestAvailableVersions:(id)a3;
- (void)setTileMetadata:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateCompletedWithVersions:(id)a3 tileMetadata:(id)a4;
@end

@implementation GEOOfflineDataConfiguration

- (NSDictionary)activeVersions
{
  v6 = self->_configurationIsolation;
  _geo_isolate_lock();
  v3 = [(GEOOfflineDataConfiguration *)self _configurationIsolated];
  v4 = self->_activeVersions;

  _geo_isolate_unlock();

  return v4;
}

- (NSDate)lastUpdatedDate
{
  v7 = self->_configurationIsolation;
  _geo_isolate_lock_data();
  uint64_t v3 = [(GEOOfflineDataConfiguration *)self _configurationIsolated];
  v4 = (void *)v3;
  if (v3 && (*(unsigned char *)(v3 + 108) & 2) != 0)
  {
    v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)*(unint64_t *)(v3 + 80)];
  }
  else
  {
    v5 = 0;
  }

  _geo_isolate_unlock();

  return (NSDate *)v5;
}

- (id)_configurationIsolated
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  geo_assert_isolated();
  configuration = self->_configuration;
  if (!configuration)
  {
    v4 = +[GEOFilePaths urlFor:38];
    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    v6 = [v4 path];
    int v7 = [v5 fileExistsAtPath:v6];

    if (v7)
    {
      id v32 = 0;
      v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4 options:0 error:&v32];
      id v9 = v32;
      if (!v8)
      {
        v10 = GEOGetOfflineDataConfigurationLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v34 = v9;
          _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "Failed to read existing config: %{public}@", buf, 0xCu);
        }
      }
      v11 = [[GEOPBOfflineDataConfiguration alloc] initWithData:v8];
      v12 = self->_configuration;
      self->_configuration = v11;

      if (!self->_configuration)
      {
        v13 = GEOGetOfflineDataConfigurationLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_FAULT, "Failed to decode existing config", buf, 2u);
        }
      }
    }
    v14 = self->_configuration;
    if (!v14)
    {
      v15 = GEOGetOfflineDataConfigurationLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEBUG, "Generating empty config", buf, 2u);
      }

      v16 = objc_alloc_init(GEOPBOfflineDataConfiguration);
      v17 = self->_configuration;
      self->_configuration = v16;

      v14 = self->_configuration;
      if (!v14) {
        goto LABEL_28;
      }
    }
    -[GEOPBOfflineDataConfiguration _readActiveVersions]((uint64_t)v14);
    v14 = (GEOPBOfflineDataConfiguration *)v14->_activeVersions;
    v18 = self->_configuration;
    if (v18)
    {
      -[GEOPBOfflineDataConfiguration _readActiveVersions]((uint64_t)self->_configuration);
      uint64_t activeVersionsCount = v18->_activeVersionsCount;
    }
    else
    {
LABEL_28:
      uint64_t activeVersionsCount = 0;
    }
    _versionDictionaryFromProtobuf((uint64_t)v14, activeVersionsCount);
    v20 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    activeVersions = self->_activeVersions;
    self->_activeVersions = v20;

    v22 = self->_configuration;
    if (v22
      && (-[GEOPBOfflineDataConfiguration _readLatestAvailableVersions]((uint64_t)self->_configuration),
          v22 = (GEOPBOfflineDataConfiguration *)v22->_latestAvailableVersions,
          (v23 = self->_configuration) != 0))
    {
      -[GEOPBOfflineDataConfiguration _readLatestAvailableVersions]((uint64_t)self->_configuration);
      uint64_t latestAvailableVersionsCount = v23->_latestAvailableVersionsCount;
    }
    else
    {
      uint64_t latestAvailableVersionsCount = 0;
    }
    _versionDictionaryFromProtobuf((uint64_t)v22, latestAvailableVersionsCount);
    v25 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    latestAvailableVersions = self->_latestAvailableVersions;
    self->_latestAvailableVersions = v25;

    if (GEOConfigGetBOOL(GeoOfflineConfig_SimulateDataIncompatible, (uint64_t)off_1E9115868))
    {
      v27 = (NSDictionary *)[(NSDictionary *)self->_activeVersions mutableCopy];
      v28 = [(NSDictionary *)v27 allKeys];
      v29 = [v28 firstObject];
      [(NSDictionary *)v27 removeObjectForKey:v29];

      v30 = self->_activeVersions;
      self->_activeVersions = v27;
    }
    configuration = self->_configuration;
  }

  return configuration;
}

+ (GEOOfflineDataConfiguration)sharedConfiguration
{
  if (qword_1EB2A0208 != -1) {
    dispatch_once(&qword_1EB2A0208, &__block_literal_global_5_0);
  }
  v2 = (void *)qword_1EB2A0200;

  return (GEOOfflineDataConfiguration *)v2;
}

void __50__GEOOfflineDataConfiguration_sharedConfiguration__block_invoke()
{
  v0 = objc_alloc_init(GEOOfflineDataConfiguration);
  v1 = (void *)qword_1EB2A0200;
  qword_1EB2A0200 = (uint64_t)v0;
}

- (GEOOfflineDataConfiguration)init
{
  v24.receiver = self;
  v24.super_class = (Class)GEOOfflineDataConfiguration;
  v2 = [(GEOOfflineDataConfiguration *)&v24 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    configurationIsolation = v2->_configurationIsolation;
    v2->_configurationIsolation = (geo_isolater *)v3;

    uint64_t v5 = geo_dispatch_queue_create();
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v5;

    int v7 = [[GEOObserverHashTable alloc] initWithProtocol:&unk_1ED747DB0 queue:0];
    observers = v2->_observers;
    v2->_observers = v7;

    uint64_t v9 = +[GEOResourceManifestManager modernManager];
    manifestManager = v2->_manifestManager;
    v2->_manifestManager = (GEOResourceManifestManager *)v9;

    [(GEOResourceManifestManager *)v2->_manifestManager addTileGroupObserver:v2 queue:v2->_observerQueue];
    GEORegisterPListStateCaptureLegacy();
    objc_initWeak(&location, v2);
    v11 = v2->_observerQueue;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __35__GEOOfflineDataConfiguration_init__block_invoke;
    v21[3] = &unk_1E53D8A60;
    objc_copyWeak(&v22, &location);
    uint64_t v12 = _GEOConfigAddBlockListenerForKey(GeoOfflineConfig_OverrideRegulatoryRegionID, (uint64_t)off_1E9115808, v11, v21);
    id regulatoryRegionOverrideConfigObserver = v2->_regulatoryRegionOverrideConfigObserver;
    v2->_id regulatoryRegionOverrideConfigObserver = (id)v12;

    v14 = v2->_observerQueue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __35__GEOOfflineDataConfiguration_init__block_invoke_2;
    v19[3] = &unk_1E53D8A60;
    objc_copyWeak(&v20, &location);
    uint64_t v15 = _GEOConfigAddBlockListenerForKey(GeoOfflineConfig_SimulateDataUpdateAvailable, (uint64_t)off_1E9115858, v14, v19);
    id simulateUpdateAvailableConfigObserver = v2->_simulateUpdateAvailableConfigObserver;
    v2->_id simulateUpdateAvailableConfigObserver = (id)v15;

    v17 = v2;
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v2;
}

void __35__GEOOfflineDataConfiguration_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _regulatoryRegionOverrideDidChange];
}

void __35__GEOOfflineDataConfiguration_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateAvailableOverrideChanged];
}

- (void)dealloc
{
  GEOUnregisterStateCaptureLegacy();
  GEOConfigRemoveBlockListener(self->_simulateUpdateAvailableConfigObserver);
  GEOConfigRemoveBlockListener(self->_regulatoryRegionOverrideConfigObserver);
  [(GEOResourceManifestManager *)self->_manifestManager removeTileGroupObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)GEOOfflineDataConfiguration;
  [(GEOOfflineDataConfiguration *)&v3 dealloc];
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
}

- (void)unregisterObserver:(id)a3
{
}

- (void)_updateAvailableOverrideChanged
{
  objc_super v3 = self->_configurationIsolation;
  _geo_isolate_lock();
  [(GEOOfflineDataConfiguration *)self _broadcastUpdateAvailability];
  _geo_isolate_unlock();
}

- (void)updateCompletedWithVersions:(id)a3 tileMetadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  _setValue(GeoOfflineConfig_SimulateDataUpdateAvailable, (uint64_t)off_1E9115858, 0, 0, 0);
  _setValue(GeoOfflineConfig_SimulateDataIncompatible, (uint64_t)off_1E9115868, 0, 0, 0);
  uint64_t v9 = v6;
  id v7 = v5;
  id v8 = v6;
  geo_isolate_sync_data();
  _setValue(GeoOfflineConfig_HasNotifiedForUpcomingUpdateRequiredExpiration, (uint64_t)off_1E9115848, 0, 0, 0);
}

void __72__GEOOfflineDataConfiguration_updateCompletedWithVersions_tileMetadata___block_invoke(id *a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] _configurationIsolated];
  -[GEOPBOfflineDataConfiguration setTileMetadata:](v2, a1[5]);
  if ([*((id *)a1[4] + 5) isEqualToDictionary:a1[6]])
  {
    [a1[4] _setLatestReleaseDataVersionIsCurrentWithConfiguration:v2];
  }
  else
  {
    objc_super v3 = GEOGetOfflineDataConfigurationLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "Setting new active versions", buf, 2u);
    }

    -[GEOPBOfflineDataConfiguration clearActiveVersions](v2);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = a1[6];
    uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v30;
      uint64_t v25 = v2;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v30 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v9 = [a1[6] objectForKeyedSubscript:v8];
          uint64_t v10 = [v8 unsignedIntegerValue];
          uint64_t v11 = [v9 unsignedLongLongValue];
          *(_DWORD *)buf = v10;
          *(_DWORD *)id v34 = 0;
          *(void *)&v34[4] = v11;
          v34[12] = 3;
          *(_DWORD *)&v34[13] = 0;
          *(_DWORD *)&v34[16] = 0;
          -[GEOPBOfflineDataConfiguration addActiveVersion:](v2, (__n128 *)buf);
          uint64_t v12 = GEOGetOfflineDataConfigurationLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            if (v10 >= 0x15)
            {
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v13 = off_1E53EA550[(int)v10];
            }
            v14 = [*((id *)a1[4] + 5) objectForKeyedSubscript:v8];
            uint64_t v15 = [v14 unsignedLongLongValue];
            uint64_t v16 = [v9 unsignedLongLongValue];
            *(_DWORD *)buf = 138543874;
            *(void *)id v34 = v13;
            *(_WORD *)&v34[8] = 2048;
            *(void *)&v34[10] = v15;
            *(_WORD *)&v34[18] = 2048;
            uint64_t v35 = v16;
            _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_INFO, "Layer %{public}@ version: %llu -> %llu", buf, 0x20u);

            uint64_t v2 = v25;
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
      }
      while (v5);
    }

    v17 = [*((id *)a1[4] + 2) activeTileGroup];
    v18 = [v17 offlineMetadata];
    uint64_t v19 = [v18 dataVersion];
    if (v2)
    {
      *(unsigned char *)(v2 + 108) |= 0x40u;
      *(unsigned char *)(v2 + 108) |= 1u;
      *(void *)(v2 + 72) = v19;
    }

    double Current = CFAbsoluteTimeGetCurrent();
    if (v2)
    {
      *(unsigned char *)(v2 + 108) |= 0x40u;
      *(unsigned char *)(v2 + 108) |= 2u;
      *(void *)(v2 + 80) = (unint64_t)Current;
    }
    objc_msgSend(a1[4], "_writeConfiguration", Current);
    v21 = (void *)[a1[6] copy];
    objc_storeStrong((id *)a1[4] + 5, v21);
    id v22 = a1[4];
    v23 = *((void *)v22 + 7);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__GEOOfflineDataConfiguration_updateCompletedWithVersions_tileMetadata___block_invoke_64;
    block[3] = &unk_1E53D8998;
    block[4] = v22;
    id v28 = v21;
    id v24 = v21;
    dispatch_async(v23, block);
    [a1[4] _broadcastUpdateAvailability];
  }
}

uint64_t __72__GEOOfflineDataConfiguration_updateCompletedWithVersions_tileMetadata___block_invoke_64(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) offlineDataConfiguration:*(void *)(a1 + 32) didChangeActiveVersions:*(void *)(a1 + 40)];
  v1 = GEOOfflineDataActiveVersionsDidChangeDarwinNotification;

  return notify_post(v1);
}

- (void)_setLatestReleaseDataVersionIsCurrentWithConfiguration:(id)a3
{
  uint64_t v4 = a3;
  geo_assert_isolated();
  uint64_t v5 = [(GEOResourceManifestManager *)self->_manifestManager activeTileGroup];
  uint64_t v6 = [v5 offlineMetadata];
  uint64_t v7 = [v6 dataVersion];

  if (v4) {
    uint64_t v8 = v4[9];
  }
  else {
    uint64_t v8 = 0;
  }
  if (v8 != v7)
  {
    uint64_t v9 = GEOGetOfflineDataConfigurationLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_INFO, "Marking release data version as current", v11, 2u);
    }

    if (v4)
    {
      *((unsigned char *)v4 + 108) |= 0x40u;
      *((unsigned char *)v4 + 108) |= 1u;
      v4[9] = v7;
      unint64_t Current = (unint64_t)CFAbsoluteTimeGetCurrent();
      *((unsigned char *)v4 + 108) |= 0x40u;
      *((unsigned char *)v4 + 108) |= 2u;
      v4[10] = Current;
    }
    else
    {
      CFAbsoluteTimeGetCurrent();
    }
    [(GEOOfflineDataConfiguration *)self _writeConfiguration];
    [(GEOOfflineDataConfiguration *)self _broadcastUpdateAvailability];
  }
}

- (GEOPBOfflineTileMetadata)tileMetadata
{
  uint64_t v6 = self->_configurationIsolation;
  _geo_isolate_lock_data();
  objc_super v3 = [(GEOOfflineDataConfiguration *)self _configurationIsolated];
  uint64_t v4 = -[GEOPBOfflineDataConfiguration tileMetadata](v3);

  _geo_isolate_unlock();

  return (GEOPBOfflineTileMetadata *)v4;
}

- (void)setTileMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v6 = self->_configurationIsolation;
  _geo_isolate_lock();
  uint64_t v5 = [(GEOOfflineDataConfiguration *)self _configurationIsolated];
  -[GEOPBOfflineDataConfiguration setTileMetadata:]((uint64_t)v5, v4);
  [(GEOOfflineDataConfiguration *)self _writeConfiguration];

  _geo_isolate_unlock();
}

- (void)setLastUpdatedDateToNow
{
}

void __54__GEOOfflineDataConfiguration_setLastUpdatedDateToNow__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _configurationIsolated];
  objc_super v3 = GEOGetOfflineDataConfigurationLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "Setting last-updated date", v5, 2u);
  }

  double Current = CFAbsoluteTimeGetCurrent();
  if (v2)
  {
    *(unsigned char *)(v2 + 108) |= 0x40u;
    *(unsigned char *)(v2 + 108) |= 2u;
    *(void *)(v2 + 8_setValue(GeoOfflineConfig_HasNotifiedForUpcomingUpdateRequiredExpiration, (uint64_t)off_1E9115848, 0, 0, 0) = (unint64_t)Current;
  }
  objc_msgSend(*(id *)(a1 + 32), "_writeConfiguration", Current);
}

- (unint64_t)activeReleaseDataVersion
{
  uint64_t v6 = self->_configurationIsolation;
  _geo_isolate_lock();
  objc_super v3 = [(GEOOfflineDataConfiguration *)self _configurationIsolated];
  if (v3) {
    unint64_t v4 = v3[9];
  }
  else {
    unint64_t v4 = 0;
  }

  _geo_isolate_unlock();
  return v4;
}

- (void)setActiveReleaseDataVersion:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = self->_configurationIsolation;
  _geo_isolate_lock();
  uint64_t v5 = [(GEOOfflineDataConfiguration *)self _configurationIsolated];
  uint64_t v6 = v5;
  if (v5) {
    uint64_t v7 = *(void *)(v5 + 72);
  }
  else {
    uint64_t v7 = 0;
  }
  if (v7 != a3)
  {
    uint64_t v8 = GEOGetOfflineDataConfigurationLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v11 = a3;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_INFO, "Setting new latest active release version: %llu", buf, 0xCu);
    }

    if (v6)
    {
      *(unsigned char *)(v6 + 108) |= 0x40u;
      *(unsigned char *)(v6 + 108) |= 1u;
      *(void *)(v6 + 72) = a3;
    }
    [(GEOOfflineDataConfiguration *)self _writeConfiguration];
    [(GEOOfflineDataConfiguration *)self _broadcastUpdateAvailability];
  }

  _geo_isolate_unlock();
}

- (NSDictionary)latestAvailableVersions
{
  uint64_t v6 = self->_configurationIsolation;
  _geo_isolate_lock();
  objc_super v3 = [(GEOOfflineDataConfiguration *)self _configurationIsolated];
  unint64_t v4 = self->_latestAvailableVersions;

  _geo_isolate_unlock();

  return v4;
}

- (void)setLatestAvailableVersions:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync_data();
}

void __58__GEOOfflineDataConfiguration_setLatestAvailableVersions___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _configurationIsolated];
  if (([*(id *)(*(void *)(a1 + 32) + 32) isEqualToDictionary:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v3 = GEOGetOfflineDataConfigurationLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "Setting new latest available versions", buf, 2u);
    }

    -[GEOPBOfflineDataConfiguration clearLatestAvailableVersions]((uint64_t)v2);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = *(id *)(a1 + 40);
    uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v32 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v26;
      v21 = v2;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v26 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
          uint64_t v10 = [v8 unsignedIntegerValue];
          uint64_t v11 = [v9 unsignedLongLongValue];
          *(_DWORD *)buf = v10;
          *(_DWORD *)long long v30 = 0;
          *(void *)&v30[4] = v11;
          v30[12] = 3;
          *(_DWORD *)&v30[13] = 0;
          *(_DWORD *)&v30[16] = 0;
          -[GEOPBOfflineDataConfiguration addLatestAvailableVersion:]((uint64_t)v2, (__n128 *)buf);
          uint64_t v12 = GEOGetOfflineDataConfigurationLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            if (v10 >= 0x15)
            {
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v13 = off_1E53EA550[(int)v10];
            }
            v14 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v8];
            uint64_t v15 = [v14 unsignedLongLongValue];
            uint64_t v16 = [v9 unsignedLongLongValue];
            *(_DWORD *)buf = 138543874;
            *(void *)long long v30 = v13;
            *(_WORD *)&v30[8] = 2048;
            *(void *)&v30[10] = v15;
            *(_WORD *)&v30[18] = 2048;
            uint64_t v31 = v16;
            _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_INFO, "Layer %{public}@ version: %llu -> %llu", buf, 0x20u);

            uint64_t v2 = v21;
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v32 count:16];
      }
      while (v5);
    }

    [*(id *)(a1 + 32) _writeConfiguration];
    v17 = (void *)[*(id *)(a1 + 40) copy];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), v17);
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(NSObject **)(v18 + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__GEOOfflineDataConfiguration_setLatestAvailableVersions___block_invoke_65;
    block[3] = &unk_1E53D8998;
    block[4] = v18;
    id v24 = v17;
    id v20 = v17;
    dispatch_async(v19, block);
    [*(id *)(a1 + 32) _broadcastUpdateAvailability];
  }
}

uint64_t __58__GEOOfflineDataConfiguration_setLatestAvailableVersions___block_invoke_65(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) offlineDataConfiguration:*(void *)(a1 + 32) didChangeLatestAvailableVersions:*(void *)(a1 + 40)];
}

- (NSArray)requiredLayers
{
  uint64_t v5 = self->_configurationIsolation;
  _geo_isolate_lock();
  id v3 = [(GEOOfflineDataConfiguration *)self _requiredLayersIsolated];
  _geo_isolate_unlock();

  return (NSArray *)v3;
}

- (id)_requiredLayersIsolated
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  p_requiredLayers = &self->_requiredLayers;
  requiredLayers = self->_requiredLayers;
  if (requiredLayers) {
    goto LABEL_46;
  }
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v5 = v4;
  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: gsFramework != ((void *)0)", buf, 2u);
    }
    uint64_t v15 = &unk_1ED73EF08;
    goto LABEL_40;
  }
  uint64_t v6 = [v4 bundleURL];
  uint64_t v7 = [v6 URLByAppendingPathComponent:@"MapsOfflineService.bundle"];

  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleWithURL:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 URLForResource:@"SupportedLayers" withExtension:@"plist"];
    if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v10 options:1 error:0];
      if (v11)
      {
        id v41 = 0;
        uint64_t v12 = [MEMORY[0x1E4F28F98] propertyListWithData:v11 options:0 format:0 error:&v41];
        id v13 = v41;
        v14 = v13;
        if (!v12)
        {
          uint64_t v16 = GEOGetOfflineDataConfigurationLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            v43 = v14;
            _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_FAULT, "Failed to decode SupportedLayers.plist. Can not determine required layers: %{public}@", buf, 0xCu);
          }
          goto LABEL_37;
        }

        v14 = (void *)v12;
      }
      else
      {
        v14 = 0;
      }
      uint64_t v16 = [v14 objectForKeyedSubscript:@"Layers"];
      if (v16)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v33 = v14;
          id v34 = v11;
          uint64_t v35 = v5;
          uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v32 = v16;
          v17 = v16;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:buf count:16];
          if (!v18) {
            goto LABEL_34;
          }
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v38;
          while (1)
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v38 != v20) {
                objc_enumerationMutation(v17);
              }
              id v22 = *(void **)(*((void *)&v37 + 1) + 8 * v21);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v23 = [v22 objectForKeyedSubscript:@"id"];
                if (v23)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    [v15 addObject:v23];
LABEL_23:

                    goto LABEL_24;
                  }
                  if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
                    goto LABEL_23;
                  }
                  *(_WORD *)v36 = 0;
                  id v24 = MEMORY[0x1E4F14500];
                  long long v25 = "Assertion failed: [layerID isKindOfClass:NSNumber.class]";
                }
                else
                {
                  if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
                    goto LABEL_23;
                  }
                  *(_WORD *)v36 = 0;
                  id v24 = MEMORY[0x1E4F14500];
                  long long v25 = "Assertion failed: layerID != nil";
                }
                _os_log_fault_impl(&dword_188D96000, v24, OS_LOG_TYPE_FAULT, v25, v36, 2u);
                goto LABEL_23;
              }
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)v36 = 0;
                _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [layer isKindOfClass:NSDictionary.class]", v36, 2u);
              }
LABEL_24:
              ++v21;
            }
            while (v19 != v21);
            uint64_t v26 = [v17 countByEnumeratingWithState:&v37 objects:buf count:16];
            uint64_t v19 = v26;
            if (!v26)
            {
LABEL_34:

              uint64_t v5 = v35;
              v14 = v33;
              uint64_t v11 = v34;
              uint64_t v16 = v32;
              goto LABEL_38;
            }
          }
        }
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
          goto LABEL_37;
        }
        *(_WORD *)buf = 0;
        long long v30 = MEMORY[0x1E4F14500];
        uint64_t v31 = "Assertion failed: [layerInfos isKindOfClass:NSArray.class]";
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
          goto LABEL_37;
        }
        *(_WORD *)buf = 0;
        long long v30 = MEMORY[0x1E4F14500];
        uint64_t v31 = "Assertion failed: layerInfos != ((void *)0)";
      }
      _os_log_fault_impl(&dword_188D96000, v30, OS_LOG_TYPE_FAULT, v31, buf, 2u);
LABEL_37:
      uint64_t v15 = &unk_1ED73EF08;
LABEL_38:

      goto LABEL_39;
    }
  }
  else
  {
    uint64_t v10 = GEOGetOfflineDataConfigurationLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_FAULT, "Could not find MapsOfflineService.bundle. Can not determine required layers", buf, 2u);
    }
  }
  uint64_t v15 = &unk_1ED73EF08;
LABEL_39:

LABEL_40:
  if ([v15 count])
  {
    uint64_t v27 = [v15 arrayByAddingObjectsFromArray:&unk_1ED73EEF0];

    uint64_t v15 = (void *)v27;
  }
  if (v15) {
    long long v28 = v15;
  }
  else {
    long long v28 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)p_requiredLayers, v28);

  requiredLayers = *p_requiredLayers;
LABEL_46:

  return requiredLayers;
}

- (void)_writeConfiguration
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  geo_assert_isolated();
  id v3 = [(GEOPBOfflineDataConfiguration *)self->_configuration data];
  uint64_t v4 = +[GEOFilePaths urlFor:38];
  id v8 = 0;
  char v5 = [v3 writeToURL:v4 options:268435457 error:&v8];
  id v6 = v8;

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = GEOGetOfflineDataConfigurationLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_FAULT, "Failed to write configuration: %{public}@", buf, 0xCu);
    }
  }
}

- (unsigned)regulatoryRegionID
{
  if (_GEOConfigHasValue(GeoOfflineConfig_OverrideRegulatoryRegionID, (uint64_t)off_1E9115808)) {
    return GEOConfigGetUInteger(GeoOfflineConfig_OverrideRegulatoryRegionID, (uint64_t)off_1E9115808);
  }
  uint64_t v4 = [(GEOResourceManifestManager *)self->_manifestManager activeTileGroup];
  char v5 = [v4 offlineMetadata];
  unsigned int v6 = [v5 regulatoryRegionId];

  return v6;
}

- (void)_regulatoryRegionOverrideDidChange
{
  observers = self->_observers;
  uint64_t v4 = [(GEOOfflineDataConfiguration *)self regulatoryRegionID];

  [(GEOObserverHashTable *)observers offlineDataConfiguration:self didChangeRegulatoryRegionID:v4];
}

- (BOOL)isUpdateAvailable
{
  uint64_t v2 = self;
  uint64_t v4 = self->_configurationIsolation;
  _geo_isolate_lock();
  LOBYTE(v2) = [(GEOOfflineDataConfiguration *)v2 _isUpdateAvailableIsolated];
  _geo_isolate_unlock();

  return (char)v2;
}

- (BOOL)_isUpdateAvailableIsolated
{
  geo_assert_isolated();
  uint64_t v3 = [(GEOOfflineDataConfiguration *)self _configurationIsolated];
  uint64_t v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = *(void *)(v3 + 72);
  }
  else {
    uint64_t v5 = 0;
  }
  unsigned int v6 = [(GEOResourceManifestManager *)self->_manifestManager activeTileGroup];
  uint64_t v7 = [v6 offlineMetadata];
  if (v5 == [v7 dataVersion]
    && ((latestAvailableVersions = self->_latestAvailableVersions, latestAvailableVersions == self->_activeVersions)
     || -[NSDictionary isEqualToDictionary:](latestAvailableVersions, "isEqualToDictionary:"))
    && ![(GEOOfflineDataConfiguration *)self _isUpdateRequiredIsolated])
  {
    char BOOL = GEOConfigGetBOOL(GeoOfflineConfig_SimulateDataUpdateAvailable, (uint64_t)off_1E9115858);
  }
  else
  {
    char BOOL = 1;
  }

  return BOOL;
}

- (BOOL)isUpdateRequired
{
  uint64_t v2 = self;
  uint64_t v4 = self->_configurationIsolation;
  _geo_isolate_lock();
  LOBYTE(v2) = [(GEOOfflineDataConfiguration *)v2 _isUpdateRequiredIsolated];
  _geo_isolate_unlock();

  return (char)v2;
}

- (BOOL)_isUpdateRequiredIsolated
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  geo_assert_isolated();
  uint64_t v3 = [(GEOOfflineDataConfiguration *)self _configurationIsolated];
  uint64_t v4 = [(NSDictionary *)self->_activeVersions allKeys];
  [(GEOOfflineDataConfiguration *)self _requiredLayersIsolated];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (!objc_msgSend(v4, "containsObject:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_broadcastUpdateAvailability
{
  geo_assert_isolated();
  BOOL v3 = [(GEOOfflineDataConfiguration *)self _isUpdateAvailableIsolated];
  observerQueue = self->_observerQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__GEOOfflineDataConfiguration__broadcastUpdateAvailability__block_invoke;
  v5[3] = &unk_1E53E3168;
  v5[4] = self;
  BOOL v6 = v3;
  dispatch_async(observerQueue, v5);
}

uint64_t __59__GEOOfflineDataConfiguration__broadcastUpdateAvailability__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "offlineDataConfiguration:didChangeUpdateAvailability:");
}

- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 offlineMetadata];
  int v10 = [v9 regulatoryRegionId];
  long long v11 = [v8 offlineMetadata];
  int v12 = [v11 regulatoryRegionId];

  if (v10 != v12)
  {
    long long v13 = GEOGetOfflineDataConfigurationLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = [v8 offlineMetadata];
      uint64_t v15 = [v14 regulatoryRegionId];
      uint64_t v16 = [v7 offlineMetadata];
      *(_DWORD *)buf = 134218240;
      uint64_t v30 = v15;
      __int16 v31 = 2048;
      uint64_t v32 = [v16 regulatoryRegionId];
      _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_INFO, "Offline regulatory region ID changed (%llu -> %llu)", buf, 0x16u);
    }
    observerQueue = self->_observerQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__GEOOfflineDataConfiguration_resourceManifestManager_didChangeActiveTileGroup_fromOldTileGroup___block_invoke;
    block[3] = &unk_1E53D79D8;
    block[4] = self;
    dispatch_async(observerQueue, block);
  }
  uint64_t v18 = [v7 offlineMetadata];
  uint64_t v19 = [v18 dataVersion];
  uint64_t v20 = [v8 offlineMetadata];
  uint64_t v21 = [v20 dataVersion];

  if (v19 != v21)
  {
    id v22 = GEOGetOfflineDataConfigurationLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = [v8 offlineMetadata];
      uint64_t v24 = [v23 dataVersion];
      long long v25 = [v7 offlineMetadata];
      uint64_t v26 = [v25 dataVersion];
      unint64_t v27 = [(GEOOfflineDataConfiguration *)self activeReleaseDataVersion];
      *(_DWORD *)buf = 134218496;
      uint64_t v30 = v24;
      __int16 v31 = 2048;
      uint64_t v32 = v26;
      __int16 v33 = 2048;
      unint64_t v34 = v27;
      _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_INFO, "Offline release data version changed (latest: %llu -> %llu, active: %llu). Update available", buf, 0x20u);
    }
    geo_isolate_sync();
  }
}

uint64_t __97__GEOOfflineDataConfiguration_resourceManifestManager_didChangeActiveTileGroup_fromOldTileGroup___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = (void *)v1[8];
  uint64_t v3 = [v1 regulatoryRegionID];

  return [v2 offlineDataConfiguration:v1 didChangeRegulatoryRegionID:v3];
}

uint64_t __97__GEOOfflineDataConfiguration_resourceManifestManager_didChangeActiveTileGroup_fromOldTileGroup___block_invoke_74(uint64_t a1)
{
  return [*(id *)(a1 + 32) _broadcastUpdateAvailability];
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v45 = self->_configurationIsolation;
  _geo_isolate_lock_data();
  uint64_t v35 = [(GEOOfflineDataConfiguration *)self _configurationIsolated];
  id v36 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(NSDictionary *)self->_activeVersions allKeys];
  id v5 = objc_msgSend(v4, "sortedArrayUsingSelector:");

  BOOL v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSDictionary count](self->_activeVersions, "count"));
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(v7);
        }
        long long v11 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v12 = [v11 unsignedIntValue];
        if (v12 >= 0x15)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
          long long v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          long long v13 = off_1E53EA550[(int)v12];
        }
        v14 = [(NSDictionary *)self->_activeVersions objectForKeyedSubscript:v11];
        [v6 setObject:v14 forKeyedSubscript:v13];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v8);
  }

  [v36 setObject:v6 forKeyedSubscript:@"ActiveVersions"];
  if (v35) {
    uint64_t v15 = *(void *)(v35 + 72);
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = [NSNumber numberWithUnsignedLongLong:v15];
  [v36 setObject:v16 forKeyedSubscript:@"ActiveReleaseDataVersion"];

  v17 = [(NSDictionary *)self->_latestAvailableVersions allKeys];
  uint64_t v18 = [v17 sortedArrayUsingSelector:sel_compare_];

  uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSDictionary count](self->_latestAvailableVersions, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v20 = v18;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(v20);
        }
        uint64_t v24 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        uint64_t v25 = [v24 unsignedIntValue];
        if (v25 >= 0x15)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v25);
          uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v26 = off_1E53EA550[(int)v25];
        }
        unint64_t v27 = [(NSDictionary *)self->_latestAvailableVersions objectForKeyedSubscript:v24];
        [v19 setObject:v27 forKeyedSubscript:v26];
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v21);
  }

  [v36 setObject:v19 forKeyedSubscript:@"LatestKnownVersions"];
  long long v28 = NSNumber;
  long long v29 = [(GEOResourceManifestManager *)self->_manifestManager activeTileGroup];
  uint64_t v30 = [v29 offlineMetadata];
  __int16 v31 = objc_msgSend(v28, "numberWithUnsignedLongLong:", objc_msgSend(v30, "dataVersion"));
  [v36 setObject:v31 forKeyedSubscript:@"LatestReleaseDataVersion"];

  uint64_t v32 = (void *)v35;
  if (v35 && *(void *)(v35 + 80))
  {
    __int16 v33 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    [v36 setObject:v33 forKeyedSubscript:@"LastUpdatedTimestamp"];

    uint64_t v32 = (void *)v35;
  }

  _geo_isolate_unlock();

  return v36;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_simulateUpdateAvailableConfigObserver, 0);
  objc_storeStrong(&self->_regulatoryRegionOverrideConfigObserver, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_requiredLayers, 0);
  objc_storeStrong((id *)&self->_activeVersions, 0);
  objc_storeStrong((id *)&self->_latestAvailableVersions, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);

  objc_storeStrong((id *)&self->_configurationIsolation, 0);
}

@end