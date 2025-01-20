@interface GEOResourceManifestServerLocalProxy
- (BOOL)_updateManifestIfNecessary:(id)a3;
- (BOOL)_writeActiveTileGroupToDisk:(id)a3 error:(id *)a4;
- (BOOL)_writeManifestToDisk:(id)a3 error:(id *)a4;
- (BOOL)_writeManifestToDiskWithUpdatedMetadataForURL:(id)a3 eTag:(id)a4 error:(id *)a5;
- (GEOActiveTileGroup)activeTileGroup;
- (GEOResourceManifestServerLocalProxy)initWithDelegate:(id)a3 configuration:(id)a4;
- (GEOResourceManifestServerProxyDelegate)delegate;
- (id)_idealTileGroupToUse;
- (id)_manifestURL;
- (id)authToken;
- (id)captureStatePlistWithHints:(os_state_hints_s *)a3;
- (id)configuration;
- (id)migrationTaskOptions;
- (id)serverOperationQueue;
- (id)serverQueue;
- (id)updateProgress;
- (unsigned)maximumZoomLevelForStyle:(int)a3 scale:(int)a4 outSize:(int *)a5;
- (void)_activeTileGroupOverridesChanged:(id)a3;
- (void)_addManifestUpdateCompletionHandler:(id)a3;
- (void)_addOpportunisticManifestUpdateCompletionHandler:(id)a3;
- (void)_cancelManifestUpdate;
- (void)_cancelMigrationTasks;
- (void)_changeActiveTileGroupIfNeededForManifestURL:(id)a3 oldURL:(id)a4;
- (void)_considerChangingActiveTileGroup;
- (void)_countryProvidersDidChange:(id)a3;
- (void)_createMigrators;
- (void)_forceChangeActiveTileGroup:(id)a3 flushTileCache:(BOOL)a4;
- (void)_handleManifestUpdateError:(id)a3;
- (void)_loadFromDisk;
- (void)_manifestURLDidChange:(id)a3;
- (void)_networkDefaultsDidChange:(id)a3;
- (void)_notifyImmediateManifestUpdateCompletionHandlers:(id)a3;
- (void)_notifyManifestUpdateCompletionHandlers:(id)a3;
- (void)_notifyOpportunisticManifestUpdateCompletionHandlers:(id)a3;
- (void)_reachabilityChanged:(id)a3;
- (void)_resetCurrentUpdateState;
- (void)_scheduleTileGroupUpdateTimerWithTimeInterval:(double)a3;
- (void)_scheduleUpdateTimerWithTimeInterval:(double)a3;
- (void)_setCurrentUpdateType:(int64_t)a3 completionBlock:(id)a4;
- (void)_startServer;
- (void)_terminationRequested:(id)a3;
- (void)_tileGroupTimerFired;
- (void)_updateManifest:(id)a3;
- (void)_updateTimerFired;
- (void)activateResourceName:(id)a3;
- (void)activateResourceScale:(int)a3;
- (void)activateResourceScenario:(int)a3;
- (void)activationSession:(id)a3 didChangeActiveTileGroup:(id)a4 completionHandler:(id)a5;
- (void)activationSession:(id)a3 didCompleteWithErrors:(id)a4;
- (void)cancelCurrentManifestUpdate;
- (void)deactivateResourceName:(id)a3;
- (void)deactivateResourceScale:(int)a3;
- (void)deactivateResourceScenario:(int)a3;
- (void)dealloc;
- (void)filtersManagerDidChangeActiveFilters:(id)a3;
- (void)forceUpdate:(int64_t)a3 completionHandler:(id)a4;
- (void)getResourceManifestWithHandler:(id)a3;
- (void)performOpportunisticResourceLoading;
- (void)protectedDataDidBecomeAvailable:(id)a3;
- (void)resetActiveTileGroup;
- (void)setActiveTileGroup:(id)a3;
- (void)setActiveTileGroupIdentifier:(id)a3;
- (void)setActiveTileGroupIdentifier:(id)a3 updateType:(int64_t)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setManifestToken:(id)a3 completionHandler:(id)a4;
- (void)updateIfNecessary:(id)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation GEOResourceManifestServerLocalProxy

- (id)authToken
{
  p_authTokenLock = &self->_authTokenLock;
  os_unfair_lock_lock_with_options();
  v4 = self->_authToken;
  os_unfair_lock_unlock(p_authTokenLock);

  return v4;
}

void __55__GEOResourceManifestServerLocalProxy__updateManifest___block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    v14 = *(void **)(a1 + 32);
    if (v14 == *((void **)WeakRetained + 2))
    {
      *((void *)WeakRetained + 2) = 0;

      v15 = *(void **)(a1 + 40);
      if (v11)
      {
        [v15 _handleManifestUpdateError:v11];
        goto LABEL_21;
      }
      v15[13] = 0;
      v16 = [*(id *)(*(void *)(a1 + 40) + 80) metadata];
      v17 = [v16 url];

      if (a4)
      {
        v18 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_DEBUG, "Existing manifest is current. Updating timestamp on-disk", buf, 2u);
        }

        v19 = *(void **)(a1 + 40);
        uint64_t v20 = *(void *)(a1 + 48);
        uint64_t v21 = *(void *)(a1 + 56);
        id v40 = 0;
        char v22 = [v19 _writeManifestToDiskWithUpdatedMetadataForURL:v20 eTag:v21 error:&v40];
        id v23 = v40;
        if ((v22 & 1) == 0)
        {
          v24 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v42 = v23;
            _os_log_impl(&dword_188D96000, v24, OS_LOG_TYPE_ERROR, "Error writing manifest to disk: %{public}@", buf, 0xCu);
          }

          v25 = *(void **)(a1 + 40);
          id v26 = 0;
LABEL_19:
          [v25 _handleManifestUpdateError:v26];
          goto LABEL_20;
        }
      }
      else
      {
        v27 = *(void **)(*(void *)(a1 + 40) + 80);
        if (!v27)
        {
          v28 = objc_alloc_init(GEOResourceManifestDownload);
          uint64_t v29 = *(void *)(a1 + 40);
          v30 = *(void **)(v29 + 80);
          *(void *)(v29 + 80) = v28;

          v27 = *(void **)(*(void *)(a1 + 40) + 80);
        }
        [v27 setResources:v9];
        os_unfair_lock_lock_with_options();
        uint64_t v31 = [v9 authToken];
        uint64_t v32 = *(void *)(a1 + 40);
        v33 = *(void **)(v32 + 136);
        *(void *)(v32 + 136) = v31;

        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 144));
        v34 = *(void **)(a1 + 40);
        uint64_t v35 = *(void *)(a1 + 48);
        id v39 = 0;
        char v36 = [v34 _writeManifestToDiskWithUpdatedMetadataForURL:v35 eTag:v10 error:&v39];
        id v23 = v39;
        if ((v36 & 1) == 0)
        {
          v38 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v42 = v23;
            _os_log_impl(&dword_188D96000, v38, OS_LOG_TYPE_ERROR, "Error writing manifest to disk: %{public}@", buf, 0xCu);
          }

          v25 = *(void **)(a1 + 40);
          id v26 = v23;
          goto LABEL_19;
        }
      }

      objc_msgSend(*(id *)(a1 + 40), "_scheduleUpdateTimerWithTimeInterval:", (double)GEOConfigGetInteger(GeoServicesConfig_ResourceManifestUpdateTimeInterval, (uint64_t)off_1E9113968));
      v37 = *(void **)(a1 + 40);
      id v23 = [*(id *)(a1 + 48) absoluteString];
      [v37 _changeActiveTileGroupIfNeededForManifestURL:v23 oldURL:v17];
LABEL_20:
    }
  }
LABEL_21:
}

- (void)_scheduleUpdateTimerWithTimeInterval:(double)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v18 = a3;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Scheduling manifest update in %f seconds", buf, 0xCu);
  }

  manifestUpdateTimer = self->_manifestUpdateTimer;
  if (manifestUpdateTimer)
  {
    dispatch_source_cancel(manifestUpdateTimer);
    v7 = self->_manifestUpdateTimer;
    self->_manifestUpdateTimer = 0;
  }
  objc_initWeak((id *)buf, self);
  v8 = [(GEOResourceManifestServerLocalProxy *)self serverQueue];
  dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v8);
  id v11 = self->_manifestUpdateTimer;
  p_manifestUpdateTimer = (dispatch_object_t *)&self->_manifestUpdateTimer;
  dispatch_object_t *p_manifestUpdateTimer = v9;

  v12 = *p_manifestUpdateTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __76__GEOResourceManifestServerLocalProxy__scheduleUpdateTimerWithTimeInterval___block_invoke;
  handler[3] = &unk_1E53D7B90;
  objc_copyWeak(&v16, (id *)buf);
  dispatch_source_set_event_handler(v12, handler);
  v13 = *p_manifestUpdateTimer;
  dispatch_time_t v14 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
  dispatch_activate(*p_manifestUpdateTimer);
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (id)serverQueue
{
  return self->_workQueue;
}

- (void)_changeActiveTileGroupIfNeededForManifestURL:(id)a3 oldURL:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v6 && ([v10 isEqualToString:v6] & 1) != 0)
  {
    [(GEOResourceManifestServerLocalProxy *)self _considerChangingActiveTileGroup];
  }
  else
  {
    if ([(GEOResourceManifestConfiguration *)self->_configuration isDefaultConfiguration]) {
      _setValue(GeoServicesConfig_LastResourceManifestURL, (uint64_t)off_1E9113908, v10, 1, 0);
    }
    v7 = [(GEOResourceManifestDownload *)self->_resourceManifest resources];
    uint64_t v8 = [v7 tileGroupsCount];

    if (v8)
    {
      dispatch_source_t v9 = [(GEOResourceManifestServerLocalProxy *)self _idealTileGroupToUse];
      [(GEOResourceManifestServerLocalProxy *)self _forceChangeActiveTileGroup:v9 flushTileCache:v6 != 0];
    }
  }
}

- (void)_considerChangingActiveTileGroup
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  self->_wantsTileGroupUpdateOnReachabilityChange = 0;
  v3 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Considering changing active tile group", buf, 2u);
  }

  v4 = [(GEOResourceManifestDownload *)self->_resourceManifest resources];
  uint64_t v5 = [v4 tileGroupsCount];

  if (v5)
  {
    id v6 = [(GEOResourceManifestServerLocalProxy *)self _idealTileGroupToUse];
    if (!v6)
    {
      uint64_t v43 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v52 = @"Did not find a usable tile group";
        _os_log_impl(&dword_188D96000, v43, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      dispatch_source_t v9 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"Did not find a usable tile group"];
      [(GEOResourceManifestServerLocalProxy *)self _notifyManifestUpdateCompletionHandlers:v9];
      goto LABEL_54;
    }
    activeTileGroup = self->_activeTileGroup;
    uint64_t v8 = [(GEOResourceManifestDownload *)self->_resourceManifest resources];
    dispatch_source_t v9 = [v8 preferredDataSetForMapsABClient];

    id v10 = [(GEOResourceManifestDownload *)self->_resourceManifest metadata];
    id v11 = [v10 url];
    v12 = [(GEOResourceFiltersManager *)self->_filtersManager activeScales];
    v13 = [(GEOResourceFiltersManager *)self->_filtersManager activeScenarios];
    dispatch_time_t v14 = uniqueIdentifierForTileGroup(v6, v11, v12, v13, v9);

    v15 = [(GEOActiveTileGroup *)self->_activeTileGroup uniqueIdentifier];
    int v16 = [v15 isEqualToString:v14] ^ 1;
    if (activeTileGroup) {
      char v17 = v16;
    }
    else {
      char v17 = 1;
    }

    unsigned int v18 = [(GEOActiveTileGroup *)self->_activeTileGroup identifier];
    if (v18 != [v6 identifier]) {
      char v17 = 1;
    }
    if ([(GEOActiveTileGroup *)self->_activeTileGroup modelVersion] != 13) {
      char v17 = 1;
    }
    if ([(GEOActiveTileGroup *)self->_activeTileGroup staleResourcesCount]) {
      char v17 = 1;
    }
    if (v9 || [(GEOActiveTileGroup *)self->_activeTileGroup hasDataSet])
    {
      uint64_t v19 = [(GEOActiveTileGroup *)self->_activeTileGroup dataSet];
      int v20 = [v19 identifier];
      if (v20 != [v9 identifier]) {
        char v17 = 1;
      }

      if (v17) {
        goto LABEL_44;
      }
    }
    else if (v17)
    {
      goto LABEL_44;
    }
    uint64_t v21 = [(GEOResourceFiltersManager *)self->_filtersManager activeScales];
    char v22 = [MEMORY[0x1E4F1CA80] set];
    if ([(GEOActiveTileGroup *)self->_activeTileGroup activeScalesCount])
    {
      unint64_t v23 = 0;
      do
      {
        uint64_t v24 = [(GEOActiveTileGroup *)self->_activeTileGroup activeScaleAtIndex:v23];
        v25 = [NSNumber numberWithInt:v24];
        [v22 addObject:v25];

        ++v23;
      }
      while (v23 < [(GEOActiveTileGroup *)self->_activeTileGroup activeScalesCount]);
    }
    int v26 = [v22 isEqualToSet:v21];

    if (v26)
    {
      v27 = [(GEOResourceFiltersManager *)self->_filtersManager activeScenarios];
      v28 = [MEMORY[0x1E4F1CA80] set];
      if ([(GEOActiveTileGroup *)self->_activeTileGroup activeScenariosCount])
      {
        unint64_t v29 = 0;
        do
        {
          uint64_t v30 = [(GEOActiveTileGroup *)self->_activeTileGroup activeScenarioAtIndex:v29];
          uint64_t v31 = [NSNumber numberWithInt:v30];
          [v28 addObject:v31];

          ++v29;
        }
        while (v29 < [(GEOActiveTileGroup *)self->_activeTileGroup activeScenariosCount]);
      }
      int v32 = [v28 isEqualToSet:v27];

      if (v32)
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        v33 = self->_tileGroupMigrators;
        uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v46 objects:v50 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          v45 = v14;
          uint64_t v36 = *(void *)v47;
          while (2)
          {
            for (uint64_t i = 0; i != v35; ++i)
            {
              if (*(void *)v47 != v36) {
                objc_enumerationMutation(v33);
              }
              v38 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              if (objc_opt_respondsToSelector())
              {
                id v39 = [(GEOResourceManifestDownload *)self->_resourceManifest resources];
                char v40 = [v38 needsMigrationForNewTileGroup:v6 inResourceManifest:v39 oldTileGroup:self->_activeTileGroup dataSet:v9];

                if (v40)
                {
                  char v41 = 1;
                  goto LABEL_57;
                }
              }
            }
            uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v46 objects:v50 count:16];
            if (v35) {
              continue;
            }
            break;
          }
          char v41 = 0;
LABEL_57:
          dispatch_time_t v14 = v45;
        }
        else
        {
          char v41 = 0;
        }

LABEL_45:
        if (self->_activeTileGroup
          && GEOConfigGetBOOL(GeoServicesConfig_DisableUpdatingActiveTileGroup, (uint64_t)off_1E9114218))
        {
          v44 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_188D96000, v44, OS_LOG_TYPE_INFO, "Not changing active tile group because GEODisableUpdatingActiveTileGroup is set", buf, 2u);
          }
        }
        else if (v41)
        {
          [(GEOResourceManifestServerLocalProxy *)self _forceChangeActiveTileGroup:v6 flushTileCache:0];
LABEL_53:

LABEL_54:
          goto LABEL_55;
        }
        [(GEOResourceManifestServerLocalProxy *)self _notifyManifestUpdateCompletionHandlers:0];
        goto LABEL_53;
      }
    }
LABEL_44:
    char v41 = 1;
    goto LABEL_45;
  }
  id v42 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v52 = @"No tile groups available";
    _os_log_impl(&dword_188D96000, v42, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"No tile groups available"];
  [(GEOResourceManifestServerLocalProxy *)self _notifyManifestUpdateCompletionHandlers:v6];
LABEL_55:
}

- (id)_idealTileGroupToUse
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(GEOResourceManifestDownload *)self->_resourceManifest resources];
  uint64_t v4 = [v3 tileGroupsCount];

  if (!v4)
  {
LABEL_15:
    v13 = 0;
    goto LABEL_19;
  }
  if (_GEOConfigHasValue(GeoServicesConfig_OverrideTileGroup, (uint64_t)off_1E9113FB8)
    || [(GEOResourceManifestConfiguration *)self->_configuration tileGroupIdentifier])
  {
    unsigned int UInteger = GEOConfigGetUInteger(GeoServicesConfig_OverrideTileGroup, (uint64_t)off_1E9113FB8);
    if ([(GEOResourceManifestConfiguration *)self->_configuration tileGroupIdentifier]) {
      unsigned int UInteger = [(GEOResourceManifestConfiguration *)self->_configuration tileGroupIdentifier];
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = [(GEOResourceManifestDownload *)self->_resourceManifest resources];
    v7 = [v6 tileGroups];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v12 identifier] == UInteger)
          {
            id v14 = v12;
            goto LABEL_18;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    goto LABEL_15;
  }
  v7 = [(GEOResourceManifestDownload *)self->_resourceManifest resources];
  id v14 = [v7 tileGroupAtIndex:0];
LABEL_18:
  v13 = v14;

LABEL_19:

  return v13;
}

- (void)_notifyManifestUpdateCompletionHandlers:(id)a3
{
  id v4 = a3;
  [(GEOResourceManifestServerLocalProxy *)self _resetCurrentUpdateState];
  [(GEOResourceManifestServerLocalProxy *)self _notifyImmediateManifestUpdateCompletionHandlers:v4];
  [(GEOResourceManifestServerLocalProxy *)self _notifyOpportunisticManifestUpdateCompletionHandlers:v4];
}

- (void)_resetCurrentUpdateState
{
  self->_currentManifestUpdateType = 0;
  if ([(NSProgress *)self->_currentUpdateProgress totalUnitCount] < 1) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = [(NSProgress *)self->_currentUpdateProgress totalUnitCount];
  }
  [(NSProgress *)self->_currentUpdateProgress setTotalUnitCount:v3];
  [(NSProgress *)self->_currentUpdateProgress setCompletedUnitCount:[(NSProgress *)self->_currentUpdateProgress totalUnitCount]];
  id v4 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
  currentUpdateProgress = self->_currentUpdateProgress;
  self->_currentUpdateProgress = v4;

  [(NSProgress *)self->_currentUpdateProgress setCompletedUnitCount:1];
  updateProgress = self->_updateProgress;
  v7 = self->_currentUpdateProgress;

  [(NSProgress *)updateProgress _geo_mirroredProgressReplaceObservedProgressWith:v7];
}

- (void)_notifyOpportunisticManifestUpdateCompletionHandlers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)[(NSMutableArray *)self->_opportunisticManifestUpdateCompletionHandlers copy];
  [(NSMutableArray *)self->_opportunisticManifestUpdateCompletionHandlers removeAllObjects];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_notifyImmediateManifestUpdateCompletionHandlers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)[(NSMutableArray *)self->_manifestUpdateCompletionHandlers copy];
  [(NSMutableArray *)self->_manifestUpdateCompletionHandlers removeAllObjects];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

uint64_t __65__GEOResourceManifestServerLocalProxy__networkDefaultsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateManifestIfNecessary:0];
}

- (void)activateResourceScale:(int)a3
{
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == GeoServicesConfig_AdditionalTransitMarkets && a3.var1 == off_1E9114828)
  {
    -[GEOResourceManifestServerLocalProxy _manifestURLDidChange:](self, "_manifestURLDidChange:", 0, a3.var1);
    notify_post("com.apple.GeoServices.additionalEnabledMarketsChanged");
  }
  else if (a3.var0 == GeoServicesConfig_ActiveTileGroupOverrides && a3.var1 == off_1E9114208)
  {
    -[GEOResourceManifestServerLocalProxy _activeTileGroupOverridesChanged:](self, "_activeTileGroupOverridesChanged:", 0, a3.var1);
  }
  else
  {
    -[GEOResourceManifestServerLocalProxy _manifestURLDidChange:](self, "_manifestURLDidChange:", 0, a3.var1);
  }
}

- (void)forceUpdate:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  uint64_t v7 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__GEOResourceManifestServerLocalProxy_forceUpdate_completionHandler___block_invoke;
  v10[3] = &unk_1E53E2DF8;
  id v8 = v7;
  id v11 = v8;
  objc_copyWeak(&v13, &location);
  id v9 = v6;
  id v12 = v9;
  [(GEOResourceManifestServerLocalProxy *)self _setCurrentUpdateType:a3 completionBlock:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_setCurrentUpdateType:(int64_t)a3 completionBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(GEOResourceManifestServerLocalProxy *)self serverQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__GEOResourceManifestServerLocalProxy__setCurrentUpdateType_completionBlock___block_invoke;
  block[3] = &unk_1E53E2DD0;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)_manifestURLDidChange:(id)a3
{
}

void __77__GEOResourceManifestServerLocalProxy__setCurrentUpdateType_completionBlock___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[22];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v3 <= v4) {
    uint64_t v5 = *(void *)(a1 + 48);
  }
  else {
    uint64_t v5 = v2[22];
  }
  if (v3 < v4 || (v4 == 2 ? (BOOL v6 = v5 == 2) : (BOOL v6 = 0), v6))
  {
    [v2 _cancelManifestUpdate];
    [*(id *)(a1 + 32) _cancelMigrationTasks];
    v2 = *(void **)(a1 + 32);
  }
  if (v2[2]) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v2[28] != 0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__GEOResourceManifestServerLocalProxy__setCurrentUpdateType_completionBlock___block_invoke_2;
  v10[3] = &unk_1E53E2DA8;
  void v10[4] = v2;
  uint64_t v12 = v5;
  id v11 = *(id *)(a1 + 40);
  uint64_t v8 = MEMORY[0x18C120660](v10);
  id v9 = (void *)v8;
  if (v7) {
    [*(id *)(a1 + 32) _addOpportunisticManifestUpdateCompletionHandler:v8];
  }
  else {
    (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
  }
}

uint64_t __77__GEOResourceManifestServerLocalProxy__setCurrentUpdateType_completionBlock___block_invoke_2(void *a1)
{
  *(void *)(a1[4] + 176) = a1[6];
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __69__GEOResourceManifestServerLocalProxy_forceUpdate_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) becomeCurrentWithPendingUnitCount:1];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _updateManifest:*(void *)(a1 + 40)];

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 resignCurrent];
}

- (BOOL)_updateManifestIfNecessary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void))a3;
  self->_wantsManifestUpdateOnReachabilityChange = 0;
  uint64_t v5 = [(GEOResourceManifestServerLocalProxy *)self _manifestURL];
  BOOL v6 = [(GEOResourceManifestDownload *)self->_resourceManifest metadata];
  BOOL v7 = [v6 url];
  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CB10];
    id v9 = [(GEOResourceManifestDownload *)self->_resourceManifest metadata];
    id v10 = [v9 url];
    id v11 = [v8 URLWithString:v10];
  }
  else
  {
    id v11 = 0;
  }

  int v12 = [v5 isEqual:v11];
  id v13 = [MEMORY[0x1E4F1C9C8] date];
  [v13 timeIntervalSince1970];
  double v15 = v14;

  uint64_t v16 = [(GEOResourceManifestDownload *)self->_resourceManifest metadata];
  [v16 timestamp];
  double v18 = v15 - v17;

  long long v19 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    int v20 = @"Manifest URL has changed";
    int v23 = 138478339;
    uint64_t v24 = v5;
    if (v12) {
      int v20 = @"Manifest URL has not changed";
    }
    __int16 v25 = 2113;
    int v26 = v20;
    __int16 v27 = 2048;
    double v28 = v18;
    _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_DEBUG, "Considering updating manifest from URL: %{private}@. %{private}@. Time since last update: %f.", (uint8_t *)&v23, 0x20u);
  }

  if (v12)
  {
    if (v18 >= (double)GEOConfigGetInteger(GeoServicesConfig_ResourceManifestUpdateTimeInterval, (uint64_t)off_1E9113968))
    {
      [(GEOResourceManifestServerLocalProxy *)self forceUpdate:0 completionHandler:v4];
      BOOL v21 = 1;
    }
    else
    {
      if (v4) {
        v4[2](v4, 0);
      }
      BOOL v21 = 0;
    }
  }
  else
  {
    BOOL v21 = 1;
    [(GEOResourceManifestServerLocalProxy *)self forceUpdate:1 completionHandler:v4];
  }

  return v21;
}

- (void)_updateManifest:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Updating resource manifest", buf, 2u);
  }

  self->_wantsManifestUpdateOnReachabilityChange = 0;
  [(GEOResourceManifestServerLocalProxy *)self _addManifestUpdateCompletionHandler:v4];
  manifestDownloadTask = self->_manifestDownloadTask;
  if (manifestDownloadTask)
  {
    [(GEOResourceManifestDownloadTask *)manifestDownloadTask cancel];
    BOOL v7 = self->_manifestDownloadTask;
    self->_manifestDownloadTask = 0;
  }
  uint64_t v8 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:-1];
  currentUpdateProgress = self->_currentUpdateProgress;
  self->_currentUpdateProgress = v8;

  id v10 = +[GEOResourceManifestUpdateAssertionRegistry sharedRegistry];
  int v11 = [v10 hasActiveAssertions];

  if (!v11) {
    goto LABEL_14;
  }
  int64_t currentManifestUpdateType = self->_currentManifestUpdateType;
  if ((unint64_t)(currentManifestUpdateType - 1) < 2)
  {
    id v13 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      double v14 = +[GEOResourceManifestUpdateAssertionRegistry sharedRegistry];
      double v15 = [v14 activeAssertionsDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v15;
      _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_INFO, "Allowing manifest update despite active assertions: %{public}@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if (currentManifestUpdateType)
  {
LABEL_14:
    if (self->_currentManifestUpdateType == 2) {
      [(NSProgress *)self->_updateProgress _geo_mirroredProgressReplaceObservedProgressWith:self->_currentUpdateProgress];
    }
    char v22 = [MEMORY[0x1E4F28F90] currentProgress];
    BOOL v23 = v22 == 0;

    if (!v23)
    {
      uint64_t v24 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
      __int16 v25 = objc_msgSend(MEMORY[0x1E4F28F90], "_geo_progressMirroringProgress:", self->_currentUpdateProgress);
      [v24 addChild:v25 withPendingUnitCount:1];
    }
    double Current = CFAbsoluteTimeGetCurrent();
    double lastManifestRetryTimestamp = self->_lastManifestRetryTimestamp;
    if (Current - lastManifestRetryTimestamp > GEOConfigGetDouble(GeoServicesConfig_TileGroupRetryCountResetInterval, (uint64_t)off_1E9113F78))self->_manifestRetryCount = 0; {
    double v28 = [(GEOResourceManifestServerLocalProxy *)self _manifestURL];
    }
    uint64_t v29 = [(GEOResourceManifestDownload *)self->_resourceManifest metadata];
    if ([v29 hasEtag])
    {
      uint64_t v30 = [(GEOResourceManifestDownload *)self->_resourceManifest metadata];
      uint64_t v31 = [v30 etag];
    }
    else
    {
      uint64_t v31 = 0;
    }

    int v32 = [[GEOResourceManifestDownloadTask alloc] initWithURL:v28 eTag:v31];
    v33 = self->_manifestDownloadTask;
    self->_manifestDownloadTask = v32;

    objc_initWeak((id *)buf, self);
    uint64_t v34 = [(GEOResourceManifestServerLocalProxy *)self serverQueue];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __55__GEOResourceManifestServerLocalProxy__updateManifest___block_invoke;
    v36[3] = &unk_1E53E2D80;
    objc_copyWeak(&v41, (id *)buf);
    uint64_t v35 = v32;
    v37 = v35;
    v38 = self;
    id v20 = v28;
    id v39 = v20;
    id v21 = v31;
    id v40 = v21;
    [(GEOResourceManifestDownloadTask *)v35 startWithQueue:v34 completionHandler:v36];

    objc_destroyWeak(&v41);
    objc_destroyWeak((id *)buf);

    goto LABEL_24;
  }
  uint64_t v16 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    double v17 = +[GEOResourceManifestUpdateAssertionRegistry sharedRegistry];
    double v18 = [v17 activeAssertionsDescription];
    *(_DWORD *)buf = 138543362;
    uint64_t v43 = v18;
    _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_INFO, "Blocking manifest update due to active assertions: %{public}@", buf, 0xCu);
  }
  [(GEOResourceManifestServerLocalProxy *)self _scheduleUpdateTimerWithTimeInterval:(double)GEOConfigGetInteger(GeoServicesConfig_ResourceManifestUpdateTimeInterval, (uint64_t)off_1E9113968)];
  long long v19 = (void *)MEMORY[0x1E4F28C58];
  GEOStringForError((__CFString *)0xFFFFFFFFFFFFFFE5);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = [v19 GEOErrorWithCode:-27 reason:v20];
  [(GEOResourceManifestServerLocalProxy *)self _notifyManifestUpdateCompletionHandlers:v21];
LABEL_24:
}

- (id)_manifestURL
{
  return GEOResourceManifestURLForConfiguration(self->_configuration);
}

- (BOOL)_writeManifestToDiskWithUpdatedMetadataForURL:(id)a3 eTag:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (self->_resourceManifest)
  {
    v33 = a5;
    int v32 = objc_alloc_init(GEODownloadMetadata);
    -[GEOResourceManifestDownload setMetadata:](self->_resourceManifest, "setMetadata:");
    id v10 = [v8 absoluteString];
    int v11 = [(GEOResourceManifestDownload *)self->_resourceManifest metadata];
    [v11 setUrl:v10];

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v13 = v12 + 978307200.0;
    double v14 = [(GEOResourceManifestDownload *)self->_resourceManifest metadata];
    [v14 setTimestamp:v13];

    double v15 = [(GEOResourceManifestDownload *)self->_resourceManifest metadata];
    id v34 = v9;
    [v15 setEtag:v9];

    id v35 = v8;
    uint64_t v16 = [MEMORY[0x1E4F29088] componentsWithURL:v8 resolvingAgainstBaseURL:0];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    double v17 = [v16 queryItems];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v17);
          }
          char v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          BOOL v23 = [v22 name];
          int v24 = [v23 isEqualToString:@"environment"];

          if (v24)
          {
            __int16 v25 = [v22 value];
            int v26 = [(GEOResourceManifestDownload *)self->_resourceManifest metadata];
            [v26 setEnvironment:v25];

            goto LABEL_12;
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v41 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    __int16 v27 = [(GEOResourceManifestDownload *)self->_resourceManifest metadata];
    char v28 = [v27 hasEnvironment];

    if ((v28 & 1) == 0)
    {
      uint64_t v29 = [(GEOResourceManifestDownload *)self->_resourceManifest metadata];
      [v29 setEnvironment:@"prod"];
    }
    BOOL v30 = [(GEOResourceManifestServerLocalProxy *)self _writeManifestToDisk:self->_resourceManifest error:v33];

    id v9 = v34;
    id v8 = v35;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _resourceManifest", buf, 2u);
    }
    BOOL v30 = 0;
  }

  return v30;
}

- (void)_addManifestUpdateCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    if (!self->_manifestUpdateCompletionHandlers)
    {
      uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      manifestUpdateCompletionHandlers = self->_manifestUpdateCompletionHandlers;
      self->_manifestUpdateCompletionHandlers = v5;
    }
    BOOL v7 = (void *)[v10 copy];
    id v8 = self->_manifestUpdateCompletionHandlers;
    id v9 = (void *)MEMORY[0x18C120660]();
    [(NSMutableArray *)v8 addObject:v9];

    id v4 = v10;
  }
}

- (BOOL)_writeManifestToDisk:(id)a3 error:(id *)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  int v32 = (void *)[a3 copy];
  BOOL v6 = [v32 data];
  BOOL v7 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v8 = GEOResourceManifestPath(self->_configuration);
  id v9 = [v7 fileURLWithPath:v8 isDirectory:0];

  id v10 = [v9 URLByDeletingLastPathComponent];
  int v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v12 = *MEMORY[0x1E4F28330];
  uint64_t v43 = *MEMORY[0x1E4F28330];
  v44[0] = &unk_1ED73DD50;
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
  id v36 = 0;
  LOBYTE(v8) = [v11 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:v13 error:&v36];
  id v14 = v36;
  uint64_t v31 = v6;
  if (v8)
  {
    id v35 = 0;
    char v15 = [v6 writeToURL:v9 options:268435457 error:&v35];
    id v16 = v35;
    double v17 = v16;
    if ((v15 & 1) == 0)
    {
      if (a4) {
        *a4 = v16;
      }
      goto LABEL_14;
    }
    id v29 = v16;
    uint64_t v18 = [v9 path];
    id v34 = 0;
    BOOL v30 = [v11 attributesOfItemAtPath:v18 error:&v34];
    id v19 = v34;

    if (!v19)
    {
      uint64_t v20 = [v30 objectForKeyedSubscript:v12];
      uint64_t v21 = [v20 isEqualToNumber:&unk_1ED73DD68];

      if ((v21 & 1) == 0)
      {
        uint64_t v25 = *MEMORY[0x1E4F28378];
        v41[0] = *MEMORY[0x1E4F28370];
        v41[1] = v12;
        v42[0] = v25;
        v42[1] = &unk_1ED73DD68;
        char v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];

        int v26 = [v9 path];
        id v33 = 0;
        [v11 setAttributes:v22 ofItemAtPath:v26 error:&v33];
        id v19 = v33;

        if (v19)
        {
          __int16 v27 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            char v28 = [v9 path];
            *(_DWORD *)buf = 138543618;
            id v38 = v28;
            __int16 v39 = 2114;
            id v40 = v19;
            _os_log_impl(&dword_188D96000, v27, OS_LOG_TYPE_ERROR, "Couldn't set permissions for resource manifest %{public}@: %{public}@", buf, 0x16u);
          }
        }
        goto LABEL_7;
      }
      id v19 = 0;
    }
    char v22 = v30;
LABEL_7:

    double v17 = v29;
LABEL_14:

    goto LABEL_15;
  }
  BOOL v23 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v14;
    _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_ERROR, "Unable to create manifest directory: %@", buf, 0xCu);
  }

  char v15 = 0;
  if (a4) {
    *a4 = v14;
  }
LABEL_15:

  return v15;
}

- (void)_cancelMigrationTasks
{
  [(GEOTileGroupActivationSession *)self->_tileGroupActivationSession cancel];
  tileGroupActivationSession = self->_tileGroupActivationSession;
  self->_tileGroupActivationSession = 0;
}

- (void)_cancelManifestUpdate
{
  manifestDownloadTask = self->_manifestDownloadTask;
  if (manifestDownloadTask)
  {
    [(GEOResourceManifestDownloadTask *)manifestDownloadTask cancel];
    id v4 = self->_manifestDownloadTask;
    self->_manifestDownloadTask = 0;
  }
}

- (void)_networkDefaultsDidChange:(id)a3
{
  id v4 = [(GEOResourceManifestServerLocalProxy *)self serverQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__GEOResourceManifestServerLocalProxy__networkDefaultsDidChange___block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (id)serverOperationQueue
{
  return self->_workOperationQueue;
}

- (GEOResourceManifestServerLocalProxy)initWithDelegate:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)GEOResourceManifestServerLocalProxy;
  uint64_t v8 = [(GEOResourceManifestServerLocalProxy *)&v27 init];
  if (v8)
  {
    uint64_t v9 = geo_dispatch_queue_create();
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = geo_isolater_create();
    activeTileGroupIsolater = v8->_activeTileGroupIsolater;
    v8->_activeTileGroupIsolater = (geo_isolater *)v11;

    double v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    workOperationQueue = v8->_workOperationQueue;
    v8->_workOperationQueue = v13;

    [(NSOperationQueue *)v8->_workOperationQueue setName:@"com.apple.geo.ResourceManifest.LocalProxy"];
    [(NSOperationQueue *)v8->_workOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v8->_workOperationQueue setUnderlyingQueue:v8->_workQueue];
    objc_storeWeak((id *)&v8->_delegate, v6);
    if (v7) {
      char v15 = (GEOResourceManifestConfiguration *)v7;
    }
    else {
      char v15 = objc_alloc_init(GEOResourceManifestConfiguration);
    }
    configuration = v8->_configuration;
    v8->_configuration = v15;

    v8->_authTokenLock._os_unfair_lock_opaque = 0;
    double v17 = [[GEOResourceFiltersManager alloc] initWithConfiguration:v8->_configuration];
    filtersManager = v8->_filtersManager;
    v8->_filtersManager = v17;

    [(GEOResourceFiltersManager *)v8->_filtersManager setDelegate:v8];
    [(GEOResourceManifestServerLocalProxy *)v8 _createMigrators];
    id v19 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:0];
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28F90], "_geo_progressMirroringProgress:", v19);
    updateProgress = v8->_updateProgress;
    v8->_updateProgress = (NSProgress *)v20;

    char v22 = [(GEOResourceManifestServerLocalProxy *)v8 serverQueue];
    objc_opt_class();
    GEORegisterPListStateCaptureLegacy();

    BOOL v23 = v8->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__GEOResourceManifestServerLocalProxy_initWithDelegate_configuration___block_invoke;
    block[3] = &unk_1E53D79D8;
    int v26 = v8;
    dispatch_async(v23, block);
  }
  return v8;
}

uint64_t __70__GEOResourceManifestServerLocalProxy_initWithDelegate_configuration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadFromDisk];
}

- (void)_createMigrators
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 addObject:objc_opt_class()];
  [v3 addObject:objc_opt_class()];
  [v3 addObject:objc_opt_class()];
  [v3 addObject:objc_opt_class()];
  [v3 addObject:objc_opt_class()];
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_alloc(*(Class *)(*((void *)&v13 + 1) + 8 * v9));
        uint64_t v11 = objc_msgSend(v10, "initWithManifestConfiguration:mapLayerDataManager:", self->_configuration, 0, (void)v13);
        if (v11) {
          [(NSArray *)v4 addObject:v11];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  tileGroupMigrators = self->_tileGroupMigrators;
  self->_tileGroupMigrators = v4;
}

- (void)dealloc
{
  GEOUnregisterStateCaptureLegacy();
  GEOConfigRemoveDelegateListenerForKey(GEOConfigKey_Invalid, unk_1E91186C0, self);
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = +[GEONetworkObserver sharedNetworkObserver];
  [v4 removeNetworkReachableObserver:self];

  [(GEOResourceManifestServerLocalProxy *)self _cancelManifestUpdate];
  [(GEOResourceManifestServerLocalProxy *)self _cancelMigrationTasks];
  manifestUpdateTimer = self->_manifestUpdateTimer;
  if (manifestUpdateTimer) {
    dispatch_source_cancel(manifestUpdateTimer);
  }
  tileGroupUpdateTimer = self->_tileGroupUpdateTimer;
  if (tileGroupUpdateTimer) {
    dispatch_source_cancel(tileGroupUpdateTimer);
  }
  [(GEOResourceFiltersManager *)self->_filtersManager setDelegate:0];
  v7.receiver = self;
  v7.super_class = (Class)GEOResourceManifestServerLocalProxy;
  [(GEOResourceManifestServerLocalProxy *)&v7 dealloc];
}

- (id)configuration
{
  return self->_configuration;
}

- (void)_startServer
{
  uint64_t v3 = [(GEOResourceManifestServerLocalProxy *)self serverQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__GEOResourceManifestServerLocalProxy__startServer__block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __51__GEOResourceManifestServerLocalProxy__startServer__block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (!v2[96])
  {
    uint64_t v3 = [v2 serverQueue];
    _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_ResourceManifestURL, *((uint64_t *)&GeoServicesConfig_ResourceManifestURL + 1), v3, *(void **)(a1 + 32));

    id v4 = [*(id *)(a1 + 32) serverQueue];
    _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_ResourceManifestEnvironment, (uint64_t)off_1E9113958, v4, *(void **)(a1 + 32));

    id v5 = [*(id *)(a1 + 32) serverQueue];
    _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_CustomEnvironmentConfiguration, (uint64_t)off_1E91155F8, v5, *(void **)(a1 + 32));

    uint64_t v6 = [*(id *)(a1 + 32) serverQueue];
    _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_AdditionalTransitMarkets, (uint64_t)off_1E9114828, v6, *(void **)(a1 + 32));

    objc_super v7 = [*(id *)(a1 + 32) serverQueue];
    _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_ActiveTileGroupOverrides, (uint64_t)off_1E9114208, v7, *(void **)(a1 + 32));

    uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:*(void *)(a1 + 32) selector:sel__countryProvidersDidChange_ name:@"GEOCountryConfigurationProvidersDidChangeNotification" object:0];

    uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:*(void *)(a1 + 32) selector:sel__networkDefaultsDidChange_ name:@"GEONetworkDefaultsDidChangeNotification" object:0];

    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:*(void *)(a1 + 32) selector:sel__terminationRequested_ name:@"GEODaemonShouldTerminateNotification" object:0];

    uint64_t v11 = +[GEONetworkObserver sharedNetworkObserver];
    [v11 addNetworkReachableObserver:*(void *)(a1 + 32) selector:sel__reachabilityChanged_];

    *(unsigned char *)(*(void *)(a1 + 32) + 96) = 1;
    v2 = *(unsigned char **)(a1 + 32);
  }
  uint64_t result = [v2 _updateManifestIfNecessary:0];
  if ((result & 1) == 0)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v14 = v13 + 978307200.0;
    long long v15 = [*(id *)(*(void *)(a1 + 32) + 80) metadata];
    [v15 timestamp];
    double v17 = v16;

    objc_msgSend(*(id *)(a1 + 32), "_scheduleUpdateTimerWithTimeInterval:", v17- v14+ (double)GEOConfigGetInteger(GeoServicesConfig_ResourceManifestUpdateTimeInterval, (uint64_t)off_1E9113968));
    uint64_t v18 = *(void **)(a1 + 32);
    return [v18 _considerChangingActiveTileGroup];
  }
  return result;
}

- (void)_loadFromDisk
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  resourceManifest = self->_resourceManifest;
  self->_resourceManifest = 0;

  [(GEOResourceManifestServerLocalProxy *)self setActiveTileGroup:0];
  id v4 = GEOResourceManifestPath(self->_configuration);
  if ([v4 length])
  {
    id v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v4 options:1 error:0];
    if (v5)
    {
      uint64_t v6 = [[GEOResourceManifestDownload alloc] initWithData:v5];
      objc_super v7 = self->_resourceManifest;
      self->_resourceManifest = v6;

      uint64_t v8 = [(GEOResourceManifestDownload *)self->_resourceManifest resources];
      char v9 = [v8 isValid];

      if ((v9 & 1) == 0)
      {
        id v10 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "Invalid manifest on-disk. Removing...", buf, 2u);
        }

        uint64_t v11 = self->_resourceManifest;
        self->_resourceManifest = 0;

        uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v23 = 0;
        [v12 removeItemAtPath:v4 error:&v23];
        id v13 = v23;

        if (v13)
        {
          double v14 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v25 = v13;
            _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_ERROR, "Error removing corrupt resource manifest: %{public}@", buf, 0xCu);
          }
        }
      }
    }
  }
  else
  {
    id v5 = 0;
  }
  os_unfair_lock_lock_with_options();
  long long v15 = [(GEOResourceManifestDownload *)self->_resourceManifest resources];
  double v16 = [v15 authToken];
  authToken = self->_authToken;
  self->_authToken = v16;

  os_unfair_lock_unlock(&self->_authTokenLock);
  uint64_t v18 = GEOActiveTileGroupPath(self->_configuration);
  if ([v18 length])
  {
    uint64_t v19 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v18];
    if (v19)
    {
      uint64_t v20 = (void *)v19;
      uint64_t v21 = [[GEOActiveTileGroup alloc] initWithData:v19];
      [(GEOResourceManifestServerLocalProxy *)self setActiveTileGroup:v21];
      if (v21)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained serverProxy:self didLoadActiveTileGroup:v21];
      }
    }
  }
}

- (GEOActiveTileGroup)activeTileGroup
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  objc_super v7 = __Block_byref_object_copy__41;
  uint64_t v8 = __Block_byref_object_dispose__41;
  id v9 = 0;
  geo_isolate_sync_data();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (GEOActiveTileGroup *)v2;
}

void __54__GEOResourceManifestServerLocalProxy_activeTileGroup__block_invoke(uint64_t a1)
{
}

- (void)setActiveTileGroup:(id)a3
{
  uint64_t v4 = (GEOActiveTileGroup *)a3;
  id v5 = v4;
  if (self->_activeTileGroup != v4)
  {
    uint64_t v6 = v4;
    geo_isolate_sync_data();
  }
}

void __58__GEOResourceManifestServerLocalProxy_setActiveTileGroup___block_invoke(uint64_t a1)
{
}

- (void)_scheduleTileGroupUpdateTimerWithTimeInterval:(double)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v18 = a3;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Scheduling tile group update in %f seconds", buf, 0xCu);
  }

  tileGroupUpdateTimer = self->_tileGroupUpdateTimer;
  if (tileGroupUpdateTimer)
  {
    dispatch_source_cancel(tileGroupUpdateTimer);
    objc_super v7 = self->_tileGroupUpdateTimer;
    self->_tileGroupUpdateTimer = 0;
  }
  objc_initWeak((id *)buf, self);
  uint64_t v8 = [(GEOResourceManifestServerLocalProxy *)self serverQueue];
  dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v8);
  uint64_t v11 = self->_tileGroupUpdateTimer;
  p_tileGroupUpdateTimer = (dispatch_object_t *)&self->_tileGroupUpdateTimer;
  dispatch_object_t *p_tileGroupUpdateTimer = v9;

  uint64_t v12 = *p_tileGroupUpdateTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __85__GEOResourceManifestServerLocalProxy__scheduleTileGroupUpdateTimerWithTimeInterval___block_invoke;
  handler[3] = &unk_1E53D7B90;
  objc_copyWeak(&v16, (id *)buf);
  dispatch_source_set_event_handler(v12, handler);
  id v13 = *p_tileGroupUpdateTimer;
  dispatch_time_t v14 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
  dispatch_activate(*p_tileGroupUpdateTimer);
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __85__GEOResourceManifestServerLocalProxy__scheduleTileGroupUpdateTimerWithTimeInterval___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _tileGroupTimerFired];
}

- (void)_tileGroupTimerFired
{
  tileGroupUpdateTimer = self->_tileGroupUpdateTimer;
  if (tileGroupUpdateTimer)
  {
    dispatch_source_cancel(tileGroupUpdateTimer);
    uint64_t v4 = self->_tileGroupUpdateTimer;
    self->_tileGroupUpdateTimer = 0;
  }

  [(GEOResourceManifestServerLocalProxy *)self _considerChangingActiveTileGroup];
}

- (void)performOpportunisticResourceLoading
{
  uint64_t v3 = [(GEOResourceManifestServerLocalProxy *)self serverQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__GEOResourceManifestServerLocalProxy_performOpportunisticResourceLoading__block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __74__GEOResourceManifestServerLocalProxy_performOpportunisticResourceLoading__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _considerChangingActiveTileGroup];
}

- (void)_forceChangeActiveTileGroup:(id)a3 flushTileCache:(BOOL)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(GEOResourceFiltersManager *)self->_filtersManager activeScales];
  objc_super v7 = [(GEOResourceFiltersManager *)self->_filtersManager activeScenarios];
  uint64_t v8 = [(GEOResourceFiltersManager *)self->_filtersManager activeNames];
  dispatch_source_t v9 = [(GEOResourceManifestDownload *)self->_resourceManifest resources];
  id v10 = [v9 preferredDataSetForMapsABClient];

  uint64_t v11 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [(GEOResourceManifestDownload *)self->_resourceManifest metadata];
    id v13 = [v12 url];
    uniqueIdentifierForTileGroup(v5, v13, v6, v7, v10);
    dispatch_time_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v52 = v14;
    _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEBUG, "Trying to change to new tile group: %{private}@", buf, 0xCu);
  }
  if (v5)
  {
    long long v15 = [(GEOResourceManifestDownload *)self->_resourceManifest metadata];
    id v16 = [v15 url];
    uniqueIdentifierForTileGroup(v5, v16, v6, v7, v10);
    double v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    tileGroupActivationSession = self->_tileGroupActivationSession;
    if (tileGroupActivationSession
      && ([(GEOTileGroupActivationSession *)tileGroupActivationSession uniqueIdentifier],
          uint64_t v19 = objc_claimAutoreleasedReturnValue(),
          int v20 = [(__CFString *)v17 isEqualToString:v19],
          v19,
          v20))
    {
      uint64_t v21 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138477827;
        v52 = v17;
        _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_DEBUG, "Already attempting to change to tile group '%{private}@'", buf, 0xCu);
      }
    }
    else
    {
      v45 = v17;
      long long v48 = v10;
      long long v49 = v8;
      id v47 = v5;
      [(GEOResourceManifestServerLocalProxy *)self _cancelMigrationTasks];
      char v22 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478083;
        v52 = v6;
        __int16 v53 = 2113;
        v54 = v7;
        _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_DEBUG, "Active scales: %{private}@. Active Scenarios: %{private}@", buf, 0x16u);
      }

      id v23 = [GEOTileGroupActivationSession alloc];
      configuration = self->_configuration;
      int v24 = [(GEOResourceManifestDownload *)self->_resourceManifest resources];
      id v25 = [(GEOResourceManifestDownload *)self->_resourceManifest metadata];
      [v25 environment];
      v27 = uint64_t v26 = v6;
      activeTileGroup = self->_activeTileGroup;
      tileGroupMigrators = self->_tileGroupMigrators;
      int64_t currentManifestUpdateType = self->_currentManifestUpdateType;
      uint64_t v31 = [(GEOResourceManifestServerLocalProxy *)self serverQueue];
      int v32 = v7;
      id v33 = (void *)v31;
      uint64_t v42 = tileGroupMigrators;
      int64_t v43 = currentManifestUpdateType;
      id v5 = v47;
      id v34 = v32;
      id v41 = v26;
      long long v46 = v26;
      double v17 = v45;
      id v35 = [(GEOTileGroupActivationSession *)v23 initWithIdentifier:v45 configuration:configuration tileGroup:v47 inResourceManifest:v24 environmentName:v27 oldTileGroup:activeTileGroup activeScales:v41 activeScenarios:v32 activeNames:v49 dataSet:v48 migrators:v42 updateType:v43 delegate:self delegateQueue:v31];
      id v36 = self->_tileGroupActivationSession;
      self->_tileGroupActivationSession = v35;

      self->_tileGroupActivationSessionHasFinishedFirstTileGroupChange = 0;
      self->_tileGroupActivationShouldFlushTileCache = a4;
      [(NSProgress *)self->_currentUpdateProgress setTotalUnitCount:1];
      currentUpdateProgress = self->_currentUpdateProgress;
      id v38 = [(GEOTileGroupActivationSession *)self->_tileGroupActivationSession progress];
      [(NSProgress *)currentUpdateProgress addChild:v38 withPendingUnitCount:1];

      double v39 = CFAbsoluteTimeGetCurrent() - self->_lastTileGroupRetryTimestamp;
      if (v39 > GEOConfigGetDouble(GeoServicesConfig_TileGroupRetryCountResetInterval, (uint64_t)off_1E9113F78)) {
        self->_tileGroupRetryCount = 0;
      }
      [(GEOTileGroupActivationSession *)self->_tileGroupActivationSession start];
      uint64_t v6 = v46;
      objc_super v7 = v34;
      id v10 = v48;
      uint64_t v8 = v49;
    }
  }
  else
  {
    id v40 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v52 = @"Tried to change to nil tile group. Ignoring...";
      _os_log_impl(&dword_188D96000, v40, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    double v17 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"Tried to change to nil tile group. Ignoring..."];
    [(GEOResourceManifestServerLocalProxy *)self _notifyManifestUpdateCompletionHandlers:v17];
  }
}

- (id)migrationTaskOptions
{
  return 0;
}

- (void)setActiveTileGroupIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOResourceManifestServerLocalProxy *)self serverQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__GEOResourceManifestServerLocalProxy_setActiveTileGroupIdentifier___block_invoke;
  v7[3] = &unk_1E53D8998;
  id v8 = v4;
  dispatch_source_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __68__GEOResourceManifestServerLocalProxy_setActiveTileGroupIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) unsignedIntValue];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 80), "resources", 0);
  id v4 = [v3 tileGroups];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        dispatch_source_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v9 identifier] == v2)
        {
          [*(id *)(a1 + 40) _forceChangeActiveTileGroup:v9 flushTileCache:0];
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)setActiveTileGroupIdentifier:(id)a3 updateType:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v10 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  long long v11 = [(GEOResourceManifestServerLocalProxy *)self serverQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__GEOResourceManifestServerLocalProxy_setActiveTileGroupIdentifier_updateType_completionHandler___block_invoke;
  block[3] = &unk_1E53E2D38;
  id v16 = v8;
  double v17 = self;
  id v19 = v9;
  int64_t v20 = a4;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);
}

void __97__GEOResourceManifestServerLocalProxy_setActiveTileGroupIdentifier_updateType_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) unsignedIntValue];
  if (v2)
  {
    int v3 = v2;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = [*(id *)(*(void *)(a1 + 40) + 80) resources];
    uint64_t v5 = [v4 tileGroups];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v9 identifier] == v3)
          {
            id v10 = v9;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    id v10 = 0;
LABEL_12:

    if (v10) {
      goto LABEL_13;
    }
  }
  else
  {
    id v10 = [*(id *)(a1 + 40) _idealTileGroupToUse];
    if (v10)
    {
LABEL_13:
      objc_initWeak(&location, *(id *)(a1 + 40));
      long long v11 = *(void **)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 64);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __97__GEOResourceManifestServerLocalProxy_setActiveTileGroupIdentifier_updateType_completionHandler___block_invoke_2;
      v15[3] = &unk_1E53E2D10;
      objc_copyWeak(&v19, &location);
      id v16 = *(id *)(a1 + 48);
      id v18 = *(id *)(a1 + 56);
      id v17 = v10;
      [v11 _setCurrentUpdateType:v12 completionBlock:v15];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      goto LABEL_17;
    }
  }
  uint64_t v13 = *(void *)(a1 + 56);
  if (v13)
  {
    id v14 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12 reason:@"No matching tile group"];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
  }
LABEL_17:
}

void __97__GEOResourceManifestServerLocalProxy_setActiveTileGroupIdentifier_updateType_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v2 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:-1];
    int v3 = (void *)*((void *)WeakRetained + 27);
    *((void *)WeakRetained + 27) = v2;

    objc_msgSend(*((id *)WeakRetained + 26), "_geo_mirroredProgressReplaceObservedProgressWith:", *((void *)WeakRetained + 27));
    [*(id *)(a1 + 32) addChild:*((void *)WeakRetained + 27) withPendingUnitCount:1];
    [WeakRetained _addOpportunisticManifestUpdateCompletionHandler:*(void *)(a1 + 48)];
    [WeakRetained _forceChangeActiveTileGroup:*(void *)(a1 + 40) flushTileCache:0];
  }
}

- (void)resetActiveTileGroup
{
  int v3 = [(GEOResourceManifestServerLocalProxy *)self serverQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__GEOResourceManifestServerLocalProxy_resetActiveTileGroup__block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __59__GEOResourceManifestServerLocalProxy_resetActiveTileGroup__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) resources];
  uint64_t v3 = [v2 tileGroupsCount];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 _idealTileGroupToUse];
    [v4 _forceChangeActiveTileGroup:v5 flushTileCache:0];
  }
}

- (void)_activeTileGroupOverridesChanged:(id)a3
{
  id v4 = [(GEOResourceManifestServerLocalProxy *)self serverQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__GEOResourceManifestServerLocalProxy__activeTileGroupOverridesChanged___block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __72__GEOResourceManifestServerLocalProxy__activeTileGroupOverridesChanged___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 _idealTileGroupToUse];
  [v1 _forceChangeActiveTileGroup:v2 flushTileCache:0];
}

- (BOOL)_writeActiveTileGroupToDisk:(id)a3 error:(id *)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a3 data];
  uint64_t v7 = GEOActiveTileGroupPath(self->_configuration);
  id v8 = [v7 stringByDeletingLastPathComponent];
  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v26 = 0;
  if ([v9 fileExistsAtPath:v8 isDirectory:&v26]) {
    BOOL v10 = v26 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    uint64_t v33 = *MEMORY[0x1E4F28330];
    v34[0] = &unk_1ED73DD50;
    long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    [v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:v11 error:0];
  }
  int v12 = [v6 writeToFile:v7 options:268435457 error:a4];
  if (v12)
  {
    id v25 = 0;
    uint64_t v13 = [v9 attributesOfItemAtPath:v7 error:&v25];
    id v14 = v25;
    if (v14)
    {
      id v15 = v14;
    }
    else
    {
      uint64_t v16 = *MEMORY[0x1E4F28330];
      id v17 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F28330]];
      char v18 = [v17 isEqualToNumber:&unk_1ED73DD68];

      if ((v18 & 1) == 0)
      {
        uint64_t v21 = *MEMORY[0x1E4F28378];
        v31[0] = *MEMORY[0x1E4F28370];
        v31[1] = v16;
        v32[0] = v21;
        v32[1] = &unk_1ED73DD68;
        id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];

        id v24 = 0;
        [v9 setAttributes:v19 ofItemAtPath:v7 error:&v24];
        id v15 = v24;
        if (v15)
        {
          long long v22 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            long long v23 = [v15 localizedDescription];
            *(_DWORD *)buf = 138478083;
            char v28 = v7;
            __int16 v29 = 2113;
            BOOL v30 = v23;
            _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_DEBUG, "Couldn't set permissions for active tile group %{private}@\n%{private}@", buf, 0x16u);
          }
        }
        goto LABEL_13;
      }
      id v15 = 0;
    }
    id v19 = v13;
LABEL_13:
  }
  return v12;
}

- (void)_countryProvidersDidChange:(id)a3
{
  id v4 = [(GEOResourceManifestServerLocalProxy *)self serverQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__GEOResourceManifestServerLocalProxy__countryProvidersDidChange___block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __66__GEOResourceManifestServerLocalProxy__countryProvidersDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) forceUpdate:1 completionHandler:0];
}

- (void)_terminationRequested:(id)a3
{
  id v4 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "Process termination requested. Canceling in-progress manifest update (if one exists)", v5, 2u);
  }

  [(GEOResourceManifestServerLocalProxy *)self cancelCurrentManifestUpdate];
}

- (void)_reachabilityChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOResourceManifestServerLocalProxy *)self serverQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__GEOResourceManifestServerLocalProxy__reachabilityChanged___block_invoke;
  v7[3] = &unk_1E53D8998;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__GEOResourceManifestServerLocalProxy__reachabilityChanged___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  uint64_t v3 = [v2 objectForKey:@"GEONetworkObserverReachable"];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    id v5 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Reachability changed to become reachable", v7, 2u);
    }

    uint64_t v6 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v6 + 48))
    {
      *(void *)(v6 + 104) = 0;
      [*(id *)(a1 + 40) forceUpdate:0 completionHandler:0];
      uint64_t v6 = *(void *)(a1 + 40);
    }
    if (*(unsigned char *)(v6 + 64))
    {
      *(void *)(v6 + 120) = 0;
      [*(id *)(a1 + 40) _considerChangingActiveTileGroup];
    }
  }
}

- (void)protectedDataDidBecomeAvailable:(id)a3
{
  int v4 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "Device unlocked, attempting tile group change", buf, 2u);
  }

  id v5 = [(GEOResourceManifestServerLocalProxy *)self serverQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__GEOResourceManifestServerLocalProxy_protectedDataDidBecomeAvailable___block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __71__GEOResourceManifestServerLocalProxy_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 120) = 0;
  return [*(id *)(a1 + 32) _considerChangingActiveTileGroup];
}

- (void)updateIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOResourceManifestServerLocalProxy *)self serverQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__GEOResourceManifestServerLocalProxy_updateIfNecessary___block_invoke;
  v7[3] = &unk_1E53D7ED0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __57__GEOResourceManifestServerLocalProxy_updateIfNecessary___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateManifestIfNecessary:*(void *)(a1 + 40)];
}

- (void)cancelCurrentManifestUpdate
{
  uint64_t v3 = [(GEOResourceManifestServerLocalProxy *)self serverQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__GEOResourceManifestServerLocalProxy_cancelCurrentManifestUpdate__block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __66__GEOResourceManifestServerLocalProxy_cancelCurrentManifestUpdate__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 216) totalUnitCount] < 1) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 216) totalUnitCount];
  }
  [*(id *)(*(void *)(a1 + 32) + 216) setTotalUnitCount:v2];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 216), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 216), "totalUnitCount"));
  uint64_t v3 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 216);
  *(void *)(v4 + 216) = v3;

  [*(id *)(*(void *)(a1 + 32) + 216) setCompletedUnitCount:1];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 208), "_geo_mirroredProgressReplaceObservedProgressWith:", *(void *)(*(void *)(a1 + 32) + 216));
  [*(id *)(a1 + 32) _cancelManifestUpdate];
  id v6 = *(void **)(a1 + 32);

  return [v6 _cancelMigrationTasks];
}

- (id)updateProgress
{
  return self->_updateProgress;
}

- (void)getResourceManifestWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOResourceManifestServerLocalProxy *)self serverQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__GEOResourceManifestServerLocalProxy_getResourceManifestWithHandler___block_invoke;
  v7[3] = &unk_1E53D7C50;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __70__GEOResourceManifestServerLocalProxy_getResourceManifestWithHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(void *)(v2 + 80))
    {
      id v3 = 0;
    }
    else
    {
      if (*(void *)(v2 + 16))
      {
        id v4 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-20];
      }
      else
      {
        id v4 = *(id *)(v2 + 152);
      }
      id v3 = v4;
    }
    id v5 = v3;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)deactivateResourceScale:(int)a3
{
}

- (void)activateResourceScenario:(int)a3
{
}

- (void)deactivateResourceScenario:(int)a3
{
}

- (void)activateResourceName:(id)a3
{
}

- (void)deactivateResourceName:(id)a3
{
}

- (unsigned)maximumZoomLevelForStyle:(int)a3 scale:(int)a4 outSize:(int *)a5
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  workQueue = self->_workQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__GEOResourceManifestServerLocalProxy_maximumZoomLevelForStyle_scale_outSize___block_invoke;
  v11[3] = &unk_1E53E2E20;
  int v12 = a3;
  int v13 = a4;
  v11[4] = self;
  v11[5] = &v14;
  v11[6] = a5;
  dispatch_sync(workQueue, v11);
  LODWORD(a5) = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);
  return a5;
}

void __78__GEOResourceManifestServerLocalProxy_maximumZoomLevelForStyle_scale_outSize___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 88) activeTileSetForTileType:*(unsigned int *)(a1 + 56) scale:*(unsigned int *)(a1 + 60)];
  id v3 = v2;
  if (v2)
  {
    id v8 = v2;
    int v4 = objc_msgSend(v2, "maximumZoomLevelInRect:", 0.0, 0.0, 268435456.0, 268435456.0);
    id v3 = v8;
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
    if (!v5) {
      goto LABEL_6;
    }
    int v6 = [v8 size];
    id v3 = v8;
    uint64_t v7 = *(int **)(a1 + 48);
  }
  else
  {
    uint64_t v7 = *(int **)(a1 + 48);
    int v6 = -1;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -1;
    if (!v7) {
      goto LABEL_6;
    }
  }
  int *v7 = v6;
LABEL_6:
}

void __76__GEOResourceManifestServerLocalProxy__scheduleUpdateTimerWithTimeInterval___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateTimerFired];
}

- (void)_updateTimerFired
{
  manifestUpdateTimer = self->_manifestUpdateTimer;
  if (manifestUpdateTimer)
  {
    dispatch_source_cancel(manifestUpdateTimer);
    int v4 = self->_manifestUpdateTimer;
    self->_manifestUpdateTimer = 0;
  }

  [(GEOResourceManifestServerLocalProxy *)self forceUpdate:0 completionHandler:0];
}

- (void)setManifestToken:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GEOResourceManifestServerLocalProxy *)self serverQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__GEOResourceManifestServerLocalProxy_setManifestToken_completionHandler___block_invoke;
  block[3] = &unk_1E53D7F70;
  id v12 = v6;
  int v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __74__GEOResourceManifestServerLocalProxy_setManifestToken_completionHandler___block_invoke(uint64_t a1)
{
  _setValue(GeoServicesConfig_ResourceManifestRequestToken, (uint64_t)off_1E9114228, *(void **)(a1 + 32), 1, 0);
  CFAbsoluteTimeGetCurrent();
  GEOConfigSetDouble(GeoServicesConfig_ResourceManifestRequestTokenTimestamp, (uint64_t)off_1E9114238);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 forceUpdate:1 completionHandler:v3];
}

- (void)_handleManifestUpdateError:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (__CFString *)a3;
  id v6 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v24 = 138543362;
    id v25 = v5;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "Error loading resource manifest: %{public}@", (uint8_t *)&v24, 0xCu);
  }

  objc_storeStrong((id *)&self->_lastResourceManifestLoadError, a3);
  [(GEOResourceManifestServerLocalProxy *)self _notifyManifestUpdateCompletionHandlers:v5];
  id v7 = +[GEONetworkObserver sharedNetworkObserver];
  char v8 = [v7 isNetworkReachable];

  if (v8)
  {
    id v9 = [(__CFString *)v5 domain];
    id v10 = GEOErrorDomain();
    if ([v9 isEqualToString:v10] && -[__CFString code](v5, "code") == -11)
    {

      goto LABEL_12;
    }
    id v12 = [(__CFString *)v5 domain];
    int v13 = (void *)*MEMORY[0x1E4F289A0];
    if ([v12 isEqualToString:*MEMORY[0x1E4F289A0]])
    {
      uint64_t v14 = [(__CFString *)v5 code];

      if (v14 != -1001)
      {
LABEL_12:
        id v15 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          LOWORD(v24) = 0;
          _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_INFO, "Network is supposedly reachable, but manifest loading encountered network-related issues. Will manifest update when reachability changes", (uint8_t *)&v24, 2u);
        }
        goto LABEL_19;
      }
    }
    else
    {
    }
    ++self->_manifestRetryCount;
    self->_double lastManifestRetryTimestamp = CFAbsoluteTimeGetCurrent();
    unint64_t manifestRetryCount = self->_manifestRetryCount;
    if (manifestRetryCount <= GEOConfigGetUInteger(GeoServicesConfig_MaxManifestUpdateRetries, (uint64_t)off_1E9113F48))
    {
      double v19 = GEOConfigGetDouble(GeoServicesConfig_ManifestUpdateRetryBaseInterval, (uint64_t)off_1E9113F58)
          * (double)(1 << LODWORD(self->_manifestRetryCount));
      int64_t v20 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = [(__CFString *)v5 domain];
        if ([v21 isEqualToString:v13] && -[__CFString code](v5, "code") == -1001)
        {
          int v22 = 0;
          long long v23 = @"Timed out";
        }
        else
        {
          int v13 = [(__CFString *)v5 domain];
          id v12 = GEOErrorDomain();
          long long v23 = @"Encountered non-network-related error";
          if ([v13 isEqualToString:v12] && -[__CFString code](v5, "code") == -19) {
            long long v23 = @"Timed out";
          }
          int v22 = 1;
        }
        int v24 = 138478083;
        id v25 = v23;
        __int16 v26 = 2048;
        double v27 = v19;
        _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_INFO, "%{private}@. Retrying manifest update in %f seconds.", (uint8_t *)&v24, 0x16u);
        if (v22)
        {
        }
      }

      char v18 = self;
      double Integer = v19;
      goto LABEL_32;
    }
    id v15 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "Retried manifest update too many times. Giving up. Will retry when reachability changes.", (uint8_t *)&v24, 2u);
    }
LABEL_19:

    self->_wantsManifestUpdateOnReachabilityChange = 1;
    double Integer = (double)GEOConfigGetInteger(GeoServicesConfig_ResourceManifestUpdateTimeInterval, (uint64_t)off_1E9113968);
    char v18 = self;
LABEL_32:
    [(GEOResourceManifestServerLocalProxy *)v18 _scheduleUpdateTimerWithTimeInterval:Integer];
    goto LABEL_33;
  }
  long long v11 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LOWORD(v24) = 0;
    _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_INFO, "Network is not reachable. Will retry manifest update when reachability changes.", (uint8_t *)&v24, 2u);
  }

  self->_wantsManifestUpdateOnReachabilityChange = 1;
LABEL_33:
}

- (void)filtersManagerDidChangeActiveFilters:(id)a3
{
  int v4 = [(GEOResourceManifestServerLocalProxy *)self serverQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__GEOResourceManifestServerLocalProxy_filtersManagerDidChangeActiveFilters___block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __76__GEOResourceManifestServerLocalProxy_filtersManagerDidChangeActiveFilters___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _considerChangingActiveTileGroup];
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  int v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  if ([(GEOActiveTileGroup *)self->_activeTileGroup hasUniqueIdentifier])
  {
    uint64_t v5 = [(GEOActiveTileGroup *)self->_activeTileGroup uniqueIdentifier];
    [v4 setObject:v5 forKeyedSubscript:@"TileGroup"];
  }
  tileGroupActivationSession = self->_tileGroupActivationSession;
  if (tileGroupActivationSession)
  {
    id v7 = [(GEOTileGroupActivationSession *)tileGroupActivationSession uniqueIdentifier];
    [v4 setObject:v7 forKeyedSubscript:@"MigrationTileGroup"];
  }

  return v4;
}

- (void)_addOpportunisticManifestUpdateCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    if (!self->_opportunisticManifestUpdateCompletionHandlers)
    {
      uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      opportunisticManifestUpdateCompletionHandlers = self->_opportunisticManifestUpdateCompletionHandlers;
      self->_opportunisticManifestUpdateCompletionHandlers = v5;
    }
    id v7 = (void *)[v10 copy];
    char v8 = self->_opportunisticManifestUpdateCompletionHandlers;
    id v9 = (void *)MEMORY[0x18C120660]();
    [(NSMutableArray *)v8 addObject:v9];

    id v4 = v10;
  }
}

- (void)activationSession:(id)a3 didChangeActiveTileGroup:(id)a4 completionHandler:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (self->_tileGroupActivationSession == a3)
  {
    BOOL v11 = !self->_tileGroupActivationSessionHasFinishedFirstTileGroupChange;
    self->_tileGroupActivationSessionHasFinishedFirstTileGroupChange = 1;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __100__GEOResourceManifestServerLocalProxy_activationSession_didChangeActiveTileGroup_completionHandler___block_invoke;
    v38[3] = &unk_1E53E2E48;
    BOOL v40 = v11;
    v38[4] = self;
    id v39 = v9;
    id v12 = (void (**)(void, void))MEMORY[0x18C120660](v38);
    int v13 = self->_activeTileGroup;
    [(GEOResourceManifestServerLocalProxy *)self setActiveTileGroup:v8];
    activeTileGroup = self->_activeTileGroup;
    id v37 = 0;
    BOOL v15 = [(GEOResourceManifestServerLocalProxy *)self _writeActiveTileGroupToDisk:activeTileGroup error:&v37];
    id v16 = v37;
    if (v15)
    {
      if (-[GEOActiveTileGroup hasDataSet](v13, "hasDataSet") || [v8 hasDataSet])
      {
        int v17 = [(GEOActiveTileGroup *)v13 dataSet];
        int v18 = [v17 identifier];
        double v19 = [v8 dataSet];
        BOOL v20 = v18 != [v19 identifier];
      }
      else
      {
        BOOL v20 = 0;
      }
      long long v23 = [[GEOTileEditionUpdate alloc] initWithActiveTileGroup:v8 oldActiveTileGroup:v13 dataSetDiffers:v20 flushEverything:self->_tileGroupActivationShouldFlushTileCache];
      int v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v23 forKey:@"GEOTileEditionUpdateKey"];
      [v24 postNotificationName:@"GEOTileEditionUpdateNotification" object:0 userInfo:v25];

      __int16 v26 = GEOGetResourceManifestLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        double v27 = [(GEOActiveTileGroup *)self->_activeTileGroup uniqueIdentifier];
        *(_DWORD *)buf = 138477827;
        uint64_t v42 = v27;
        _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_INFO, "Successfully changed active tile group (%{private}@). Informing clients.", buf, 0xCu);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      __int16 v29 = self->_activeTileGroup;
      uint64_t v31 = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      uint64_t v33 = __100__GEOResourceManifestServerLocalProxy_activationSession_didChangeActiveTileGroup_completionHandler___block_invoke_112;
      id v34 = &unk_1E53D7ED0;
      id v35 = self;
      id v36 = v12;
      [WeakRetained serverProxy:self didChangeActiveTileGroup:v29 finishedCallback:&v31];

      if ([(GEOActiveTileGroup *)self->_activeTileGroup staleResourcesCount])
      {
        id v30 = objc_loadWeakRetained((id *)&self->_delegate);
        [v30 serverProxyNeedsWiFiResourceActivity:self];
      }
    }
    else
    {
      uint64_t v21 = GEOGetResourceManifestLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        int v22 = [(GEOActiveTileGroup *)self->_activeTileGroup uniqueIdentifier];
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v22;
        __int16 v43 = 2114;
        id v44 = v16;
        _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_ERROR, "Failed to write new active tile group (%{public}@) to disk: %{public}@", buf, 0x16u);
      }
      [(GEOResourceManifestServerLocalProxy *)self setActiveTileGroup:v13];
      ((void (**)(void, id))v12)[2](v12, v16);
    }
  }
}

void __100__GEOResourceManifestServerLocalProxy_activationSession_didChangeActiveTileGroup_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) _notifyImmediateManifestUpdateCompletionHandlers:v3];
    id v3 = v5;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    id v3 = v5;
  }
}

void __100__GEOResourceManifestServerLocalProxy_activationSession_didChangeActiveTileGroup_completionHandler___block_invoke_112(uint64_t a1)
{
  uint64_t v2 = GEOGetResourceManifestLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "Finished informing clients of tile group change", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) serverQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__GEOResourceManifestServerLocalProxy_activationSession_didChangeActiveTileGroup_completionHandler___block_invoke_113;
  block[3] = &unk_1E53DA028;
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, block);
}

uint64_t __100__GEOResourceManifestServerLocalProxy_activationSession_didChangeActiveTileGroup_completionHandler___block_invoke_113(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)activationSession:(id)a3 didCompleteWithErrors:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = v6;
  if (self->_tileGroupActivationSession == a3)
  {
    id v47 = self;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v52 objects:v59 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v53;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v53 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v52 + 1) + 8 * v12);
        uint64_t v14 = [v13 domain];
        BOOL v15 = GEOErrorDomain();
        BOOL v16 = [v14 isEqualToString:v15] && objc_msgSend(v13, "code") == -2;

        int v17 = [v13 domain];
        int v18 = GEOErrorDomain();
        BOOL v19 = [v17 isEqualToString:v18] && objc_msgSend(v13, "code") == -26;

        if (v16 || v19) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v52 objects:v59 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_16;
        }
      }

      if (v16)
      {
        BOOL v20 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2 reason:@"Canceled"];
        char v21 = 1;
        goto LABEL_23;
      }
      if (v19)
      {
        uint64_t v22 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-26 reason:@"Device never unlocked"];
        goto LABEL_22;
      }
    }
    else
    {
LABEL_16:
    }
    uint64_t v22 = [v8 firstObject];
LABEL_22:
    BOOL v20 = (void *)v22;
    char v21 = 0;
LABEL_23:
    tileGroupActivationSession = v47->_tileGroupActivationSession;
    v47->_tileGroupActivationSession = 0;

    [(GEOResourceManifestServerLocalProxy *)v47 _notifyManifestUpdateCompletionHandlers:v20];
    if ((v21 & 1) == 0 && [v8 count])
    {
      int v24 = +[GEONetworkObserver sharedNetworkObserver];
      char v25 = [v24 isNetworkReachable];

      if (v25)
      {
        id v44 = v20;
        uint64_t v45 = v7;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id obj = v8;
        uint64_t v26 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v49;
          uint64_t v29 = *MEMORY[0x1E4F289A0];
          while (2)
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v49 != v28) {
                objc_enumerationMutation(obj);
              }
              uint64_t v31 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              uint64_t v32 = objc_msgSend(v31, "domain", v44, v45);
              uint64_t v33 = GEOErrorDomain();
              if ([v32 isEqualToString:v33] && objc_msgSend(v31, "code") == -11) {
                goto LABEL_49;
              }
              id v34 = [v31 domain];
              if ([v34 isEqualToString:v29] && objc_msgSend(v31, "code") != -1001)
              {

LABEL_49:
LABEL_50:

                id v41 = GEOGetResourceManifestLog();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_188D96000, v41, OS_LOG_TYPE_INFO, "Network is supposedly reachable, but migration encountered network-related issues. Will retry tile group change when reachability changes", buf, 2u);
                }

                v47->_wantsTileGroupUpdateOnReachabilityChange = 1;
                BOOL v20 = v44;
                id v7 = v45;
                goto LABEL_56;
              }
              id v35 = [v31 domain];
              id v36 = GEOErrorDomain();
              if ([v35 isEqualToString:v36])
              {
                uint64_t v37 = [v31 code];

                if (v37 == -19) {
                  goto LABEL_50;
                }
              }
              else
              {
              }
            }
            uint64_t v27 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
            if (v27) {
              continue;
            }
            break;
          }
        }

        ++v47->_tileGroupRetryCount;
        v47->_lastTileGroupRetryTimestamp = CFAbsoluteTimeGetCurrent();
        unint64_t tileGroupRetryCount = v47->_tileGroupRetryCount;
        if (tileGroupRetryCount <= GEOConfigGetUInteger(GeoServicesConfig_MaxTileGroupChangeRetries, (uint64_t)off_1E9113F88))
        {
          double v42 = GEOConfigGetDouble(GeoServicesConfig_TileGroupChangeRetryBaseInterval, (uint64_t)off_1E9113F68)
              * (double)(1 << LODWORD(v47->_tileGroupRetryCount));
          __int16 v43 = GEOGetResourceManifestLog();
          BOOL v20 = v44;
          id v7 = v45;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            double v57 = v42;
            _os_log_impl(&dword_188D96000, v43, OS_LOG_TYPE_INFO, "Encountered non-network-related error. Retrying tile group change in %f seconds.", buf, 0xCu);
          }

          [(GEOResourceManifestServerLocalProxy *)v47 _scheduleTileGroupUpdateTimerWithTimeInterval:v42];
        }
        else
        {
          id v39 = GEOGetResourceManifestLog();
          BOOL v20 = v44;
          id v7 = v45;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_188D96000, v39, OS_LOG_TYPE_ERROR, "Retried tile group change too many times. Giving up. Will retry when reachability changes.", buf, 2u);
          }

          v47->_wantsTileGroupUpdateOnReachabilityChange = 1;
        }
      }
      else
      {
        BOOL v40 = GEOGetResourceManifestLog();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v40, OS_LOG_TYPE_INFO, "Network is not reachable. Will retry tile group change when reachability changes.", buf, 2u);
        }

        v47->_wantsTileGroupUpdateOnReachabilityChange = 1;
      }
    }
LABEL_56:
  }
}

- (GEOResourceManifestServerProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOResourceManifestServerProxyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTileGroupIsolater, 0);
  objc_storeStrong((id *)&self->_tileGroupActivationSession, 0);
  objc_storeStrong((id *)&self->_currentUpdateProgress, 0);
  objc_storeStrong((id *)&self->_updateProgress, 0);
  objc_storeStrong((id *)&self->_tileGroupMigrators, 0);
  objc_storeStrong((id *)&self->_filtersManager, 0);
  objc_storeStrong((id *)&self->_opportunisticManifestUpdateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_manifestUpdateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_lastResourceManifestLoadError, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_activeTileGroup, 0);
  objc_storeStrong((id *)&self->_resourceManifest, 0);
  objc_storeStrong((id *)&self->_tileGroupUpdateTimer, 0);
  objc_storeStrong((id *)&self->_manifestUpdateTimer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_workOperationQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_manifestDownloadTask, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end