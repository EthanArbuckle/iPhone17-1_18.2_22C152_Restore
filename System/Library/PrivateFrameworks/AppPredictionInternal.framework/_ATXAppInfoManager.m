@interface _ATXAppInfoManager
+ (_ATXAppInfoManager)sharedInstance;
+ (id)sortArrayAndComputeMedian:(id)a3;
- (_ATXAppInfoManager)initWithDataStore:(id)a3;
- (_ATXAppInfoManager)initWithInMemoryStore;
- (id)_appInfoNoLockForBundleId:(id)a3;
- (id)allActionKeys;
- (id)allApps;
- (id)allAppsLaunchedOrInstalledWithin30Days;
- (id)allAppsWithInstallDate;
- (id)app2VecClusterForBundleId:(id)a3;
- (id)appInfoForBundleId:(id)a3;
- (id)averageSecondsBetweenAppActionsForActionKey:(id)a3;
- (id)averageSecondsBetweenLaunchesForBundleId:(id)a3;
- (id)genreIdForBundleId:(id)a3;
- (id)genreIdsForBundleId:(id)a3;
- (id)lastAppActionLaunch;
- (id)lastAppActionLaunchDate;
- (id)lastAppActionLaunchDateForActionKey:(id)a3;
- (id)lastAppLaunch;
- (id)lastAppLaunchDate;
- (id)lastLaunchDateForBundleId:(id)a3;
- (id)lastUnlockDate;
- (id)medianSecondsBetweenAppActionsForActionKey:(id)a3;
- (id)medianSecondsBetweenLaunchesForBundleId:(id)a3;
- (id)secondMostRecentAppLaunch;
- (id)stopInstallDeltaRecording;
- (id)subGenreIdsForBundleId:(id)a3;
- (id)totalSlotsInDatastore;
- (int64_t)launchedAppCount;
- (void)addAverageSecondsBetweenAppActionsForActionKey:(id)a3 average:(id)a4;
- (void)addAverageSecondsBetweenLaunchesForBundleId:(id)a3 average:(id)a4;
- (void)addExtensionLaunchForBundleId:(id)a3 date:(id)a4;
- (void)addInstallForBundleId:(id)a3 date:(id)a4;
- (void)addInstallForBundleInfoMap:(id)a3;
- (void)addLaunchForAppAction:(id)a3 date:(id)a4;
- (void)addLaunchForBundleId:(id)a3 date:(id)a4;
- (void)addMedianSecondsBetweenAppActionsForActionKey:(id)a3 median:(id)a4;
- (void)addMedianSecondsBetweenLaunchesForBundleId:(id)a3 median:(id)a4;
- (void)addScreenLockAtDate:(id)a3;
- (void)addSpotlightLaunchForBundleId:(id)a3 date:(id)a4;
- (void)appLaunchesCalculations:(id)a3;
- (void)clearAppInstallInfo;
- (void)clearAppLaunchInfo;
- (void)computeAverageAndMedianSecondsBetweenAppActions;
- (void)computeAverageAndMedianSecondsBetweenAppActions:(id)a3;
- (void)computeAverageAndMedianSecondsBetweenAppLaunches;
- (void)dealloc;
- (void)removeActionDataForBundleId:(id)a3;
- (void)removeAppInfoForBundleId:(id)a3;
- (void)removeAppInfoForBundleIds:(id)a3;
- (void)removeAppLaunchesForBundleId:(id)a3;
- (void)removeBundleIds:(id)a3;
- (void)removeUninstalledApps;
- (void)startInstallDeltaRecording;
- (void)train;
- (void)updateApp2VecClusterForBundleId:(id)a3 app2VecCluster:(id)a4;
- (void)updateApp2VecClustersForAllApps;
- (void)updateGenreIdsForAllApps;
- (void)updateGenreIdsForBundleId:(id)a3 genreId:(id)a4 subGenreIds:(id)a5;
@end

@implementation _ATXAppInfoManager

- (id)appInfoForBundleId:(id)a3
{
  p_rwlock = &self->_rwlock;
  id v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  v6 = [(_ATXAppInfoManager *)self _appInfoNoLockForBundleId:v5];

  pthread_rwlock_unlock(p_rwlock);
  return v6;
}

- (id)_appInfoNoLockForBundleId:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D25F6CC0]();
  v6 = [(_ATXDataStore *)self->_dataStore appInfoForBundleId:v4];

  return v6;
}

+ (_ATXAppInfoManager)sharedInstance
{
  if (sharedInstance__pasOnceToken6_28 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_28, &__block_literal_global_159);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_37;
  return (_ATXAppInfoManager *)v2;
}

- (_ATXAppInfoManager)initWithInMemoryStore
{
  v3 = [[_ATXDataStore alloc] initWithInMemoryDataStore];
  id v4 = [(_ATXAppInfoManager *)self initWithDataStore:v3];

  return v4;
}

- (_ATXAppInfoManager)initWithDataStore:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_ATXAppInfoManager.m", 48, @"Invalid parameter not satisfying: %@", @"dataStore" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)_ATXAppInfoManager;
  v7 = [(_ATXAppInfoManager *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_dataStore, a3);
    if (!v6)
    {
      v10 = 0;
      goto LABEL_10;
    }
    pthread_rwlock_init(&v8->_rwlock, 0);
    v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppInfoManager initWithDataStore:]();
    }
  }
  v10 = v8;
LABEL_10:

  return v10;
}

- (void)dealloc
{
  pthread_rwlock_destroy(&self->_rwlock);
  v3.receiver = self;
  v3.super_class = (Class)_ATXAppInfoManager;
  [(_ATXAppInfoManager *)&v3 dealloc];
}

- (id)lastLaunchDateForBundleId:(id)a3
{
  p_rwlock = &self->_rwlock;
  id v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  id v6 = [(_ATXAppInfoManager *)self _appInfoNoLockForBundleId:v5];

  v7 = [v6 lastLaunch];

  pthread_rwlock_unlock(p_rwlock);
  return v7;
}

- (id)averageSecondsBetweenLaunchesForBundleId:(id)a3
{
  p_rwlock = &self->_rwlock;
  id v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  id v6 = [(_ATXAppInfoManager *)self _appInfoNoLockForBundleId:v5];

  v7 = [v6 averageSecondsBetweenLaunches];

  pthread_rwlock_unlock(p_rwlock);
  return v7;
}

- (id)medianSecondsBetweenLaunchesForBundleId:(id)a3
{
  p_rwlock = &self->_rwlock;
  id v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  id v6 = [(_ATXAppInfoManager *)self _appInfoNoLockForBundleId:v5];

  v7 = [v6 medianSecondsBetweenLaunches];

  pthread_rwlock_unlock(p_rwlock);
  return v7;
}

- (id)genreIdForBundleId:(id)a3
{
  p_rwlock = &self->_rwlock;
  id v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  id v6 = [(_ATXAppInfoManager *)self _appInfoNoLockForBundleId:v5];

  v7 = [v6 genreId];

  pthread_rwlock_unlock(p_rwlock);
  return v7;
}

- (id)subGenreIdsForBundleId:(id)a3
{
  p_rwlock = &self->_rwlock;
  id v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  id v6 = [(_ATXAppInfoManager *)self _appInfoNoLockForBundleId:v5];

  v7 = [v6 subGenreIds];
  v8 = (void *)[v7 copy];

  pthread_rwlock_unlock(p_rwlock);
  return v8;
}

- (id)genreIdsForBundleId:(id)a3
{
  p_rwlock = &self->_rwlock;
  id v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  id v6 = [(_ATXAppInfoManager *)self _appInfoNoLockForBundleId:v5];

  v7 = [v6 genreId];
  v8 = [v6 subGenreIds];
  v9 = (void *)[v8 copy];

  pthread_rwlock_unlock(p_rwlock);
  v10 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v7 second:v9];

  return v10;
}

- (id)app2VecClusterForBundleId:(id)a3
{
  p_rwlock = &self->_rwlock;
  id v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  id v6 = [(_ATXAppInfoManager *)self _appInfoNoLockForBundleId:v5];

  v7 = [v6 app2VecCluster];

  pthread_rwlock_unlock(p_rwlock);
  return v7;
}

- (id)lastAppLaunch
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  id v4 = [(_ATXDataStore *)self->_dataStore lastLaunchedApp];
  pthread_rwlock_unlock(p_rwlock);
  return v4;
}

- (id)secondMostRecentAppLaunch
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  id v4 = [(_ATXDataStore *)self->_dataStore nthMostRecentAppLaunch:1];
  pthread_rwlock_unlock(p_rwlock);
  return v4;
}

- (id)lastAppLaunchDate
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  id v4 = [(_ATXDataStore *)self->_dataStore lastLaunchDate];
  pthread_rwlock_unlock(p_rwlock);
  return v4;
}

- (id)allActionKeys
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  id v4 = [(_ATXDataStore *)self->_dataStore loadAppActionsFromAppActionInfo];
  pthread_rwlock_unlock(p_rwlock);
  id v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];

  return v5;
}

- (id)totalSlotsInDatastore
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  id v4 = [(_ATXDataStore *)self->_dataStore totalSlotsInDatastore];
  pthread_rwlock_unlock(p_rwlock);
  return v4;
}

- (id)lastAppActionLaunch
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  id v4 = [(_ATXDataStore *)self->_dataStore loadAppActionInfo];
  id v5 = [v4 first];
  pthread_rwlock_unlock(p_rwlock);

  return v5;
}

- (id)lastAppActionLaunchDate
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  id v4 = [(_ATXDataStore *)self->_dataStore loadAppActionInfo];
  id v5 = [v4 second];
  pthread_rwlock_unlock(p_rwlock);

  return v5;
}

- (id)lastAppActionLaunchDateForActionKey:(id)a3
{
  p_rwlock = &self->_rwlock;
  id v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  id v6 = [(_ATXDataStore *)self->_dataStore lastAppActionLaunchDateForAppAction:v5];

  pthread_rwlock_unlock(p_rwlock);
  return v6;
}

- (id)averageSecondsBetweenAppActionsForActionKey:(id)a3
{
  p_rwlock = &self->_rwlock;
  id v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  id v6 = [(_ATXDataStore *)self->_dataStore averageSecondsBetweenAppActionsForAppAction:v5];

  pthread_rwlock_unlock(p_rwlock);
  return v6;
}

- (id)medianSecondsBetweenAppActionsForActionKey:(id)a3
{
  p_rwlock = &self->_rwlock;
  id v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  id v6 = [(_ATXDataStore *)self->_dataStore medianSecondsBetweenAppActionsForAppAction:v5];

  pthread_rwlock_unlock(p_rwlock);
  return v6;
}

- (id)lastUnlockDate
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  id v4 = [(_ATXDataStore *)self->_dataStore appInfoForBundleId:@"com.apple.DEC.AppPredictionInternal.backlightActivated"];
  id v5 = [v4 lastLaunch];

  pthread_rwlock_unlock(p_rwlock);
  return v5;
}

- (int64_t)launchedAppCount
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  int64_t v4 = [(_ATXDataStore *)self->_dataStore launchedAppCount];
  pthread_rwlock_unlock(p_rwlock);
  return v4;
}

- (id)allApps
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  int64_t v4 = [(_ATXDataStore *)self->_dataStore allApps];
  pthread_rwlock_unlock(p_rwlock);
  return v4;
}

- (id)allAppsWithInstallDate
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  int64_t v4 = [(_ATXDataStore *)self->_dataStore allAppsWithInstallDate];
  pthread_rwlock_unlock(p_rwlock);
  return v4;
}

- (id)allAppsLaunchedOrInstalledWithin30Days
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  int64_t v4 = [(_ATXDataStore *)self->_dataStore allAppsLaunchedOrInstalledWithin30Days];
  pthread_rwlock_unlock(p_rwlock);
  return v4;
}

- (void)updateGenreIdsForBundleId:(id)a3 genreId:(id)a4 subGenreIds:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = pthread_rwlock_wrlock(&self->_rwlock);
  v11 = (void *)MEMORY[0x1D25F6CC0](v10);
  v12 = [(_ATXAppInfoManager *)self _appInfoNoLockForBundleId:v22];
  if (!v12)
  {
    pthread_rwlock_unlock(&self->_rwlock);
    goto LABEL_14;
  }
  objc_super v13 = v12;
  v14 = [v12 genreId];
  if (![v8 isEqual:v14]) {
    goto LABEL_11;
  }
  v15 = [v13 subGenreIds];
  id v16 = v9;
  id v17 = v15;
  if (v17 != v16)
  {
    v18 = v17;
    if (v16 && v17)
    {
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v16];
      v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v18];
      char v20 = [v21 isEqualToSet:v19];

      if (v20) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }

LABEL_11:
LABEL_12:
    [v13 setGenreId:v8];
    [v13 setSubGenreIds:v9];
    [(_ATXDataStore *)self->_dataStore writeGenreId:v8 subGenreIds:v9 forBundleId:v22];
    goto LABEL_13;
  }

LABEL_13:
  pthread_rwlock_unlock(&self->_rwlock);
LABEL_14:
}

- (void)updateApp2VecClusterForBundleId:(id)a3 app2VecCluster:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  pthread_rwlock_wrlock(&self->_rwlock);
  v7 = [(_ATXAppInfoManager *)self _appInfoNoLockForBundleId:v11];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 app2VecCluster];
    char v10 = [v6 isEqual:v9];

    if ((v10 & 1) == 0)
    {
      [v8 setApp2VecCluster:v6];
      [(_ATXDataStore *)self->_dataStore writeApp2VecCluster:v6 forBundleId:v11];
    }
  }
  pthread_rwlock_unlock(&self->_rwlock);
}

- (void)addInstallForBundleId:(id)a3 date:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11[0] = a4;
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];

  [(_ATXAppInfoManager *)self addInstallForBundleInfoMap:v9];
}

- (void)addInstallForBundleInfoMap:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  pthread_rwlock_wrlock(&self->_rwlock);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v4;
  uint64_t v21 = [obj countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v7 = (void *)MEMORY[0x1D25F6CC0]();
        id v8 = [obj objectForKeyedSubscript:v6];
        id v9 = __atxlog_handle_app_install();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v29 = v8;
          __int16 v30 = 2112;
          uint64_t v31 = v6;
          _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "ATXAppInfoManager: Adding install date %{public}@ for bundleId %@", buf, 0x16u);
        }

        id v10 = +[ATXLaunchServicesHelper getGenreIdsForBundleId:v6];
        uint64_t v11 = [v10 first];
        v12 = (void *)v11;
        objc_super v13 = &unk_1F27F1B78;
        if (v11) {
          objc_super v13 = (void *)v11;
        }
        id v14 = v13;

        v15 = [v10 second];
        id v16 = +[ATXApp2VecClustering sharedInstance];
        id v17 = [v16 getClosestClusterCentroidForBundleId:v6];

        [(_ATXDataStore *)self->_dataStore addAppInstallForBundleId:v6 date:v8 genreId:v14 subGenreIds:v15 app2VecCluster:v17];
        installDeltaLog = self->_installDeltaLog;
        if (installDeltaLog)
        {
          v27[0] = v6;
          v27[1] = v8;
          v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
          [(NSMutableArray *)installDeltaLog addObject:v19];
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v21);
  }

  pthread_rwlock_unlock(&self->_rwlock);
}

- (void)addExtensionLaunchForBundleId:(id)a3 date:(id)a4
{
  p_rwlock = &self->_rwlock;
  id v7 = a4;
  id v8 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  [(_ATXDataStore *)self->_dataStore addExtensionLaunchForBundleId:v8 date:v7];

  pthread_rwlock_unlock(p_rwlock);
}

- (void)addLaunchForBundleId:(id)a3 date:(id)a4
{
  p_rwlock = &self->_rwlock;
  id v7 = a4;
  id v8 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  [(_ATXDataStore *)self->_dataStore addAppLaunchForBundleId:v8 date:v7 withLaunchType:0];

  pthread_rwlock_unlock(p_rwlock);
}

- (void)addLaunchForAppAction:(id)a3 date:(id)a4
{
  p_rwlock = &self->_rwlock;
  id v7 = a4;
  id v8 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  [(_ATXDataStore *)self->_dataStore addAppActionLaunchForAppAction:v8 date:v7];

  pthread_rwlock_unlock(p_rwlock);
}

- (void)addSpotlightLaunchForBundleId:(id)a3 date:(id)a4
{
  p_rwlock = &self->_rwlock;
  id v7 = a4;
  id v8 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  [(_ATXDataStore *)self->_dataStore addAppLaunchForBundleId:v8 date:v7 withLaunchType:1];

  pthread_rwlock_unlock(p_rwlock);
}

- (void)addAverageSecondsBetweenLaunchesForBundleId:(id)a3 average:(id)a4
{
  p_rwlock = &self->_rwlock;
  id v7 = a4;
  id v8 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  [(_ATXDataStore *)self->_dataStore writeAverageSecondsBetweenLaunches:v7 forBundleId:v8];

  pthread_rwlock_unlock(p_rwlock);
}

- (void)addMedianSecondsBetweenLaunchesForBundleId:(id)a3 median:(id)a4
{
  p_rwlock = &self->_rwlock;
  id v7 = a4;
  id v8 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  [(_ATXDataStore *)self->_dataStore writeMedianSecondsBetweenLaunches:v7 forBundleId:v8];

  pthread_rwlock_unlock(p_rwlock);
}

- (void)addAverageSecondsBetweenAppActionsForActionKey:(id)a3 average:(id)a4
{
  p_rwlock = &self->_rwlock;
  id v7 = a4;
  id v8 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  [(_ATXDataStore *)self->_dataStore writeAverageSecondsBetweenAppActions:v7 forAppAction:v8];

  pthread_rwlock_unlock(p_rwlock);
}

- (void)addMedianSecondsBetweenAppActionsForActionKey:(id)a3 median:(id)a4
{
  p_rwlock = &self->_rwlock;
  id v7 = a4;
  id v8 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  [(_ATXDataStore *)self->_dataStore writeMedianSecondsBetweenAppActions:v7 forAppAction:v8];

  pthread_rwlock_unlock(p_rwlock);
}

- (void)addScreenLockAtDate:(id)a3
{
  if (a3) {
    [(_ATXAppInfoManager *)self addLaunchForBundleId:@"com.apple.DEC.AppPredictionInternal.backlightActivated" date:a3];
  }
}

- (void)removeAppInfoForBundleId:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  [(_ATXAppInfoManager *)self removeAppInfoForBundleIds:v4];
}

- (void)removeAppInfoForBundleIds:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  pthread_rwlock_wrlock(&self->_rwlock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v11 = __atxlog_handle_deletions();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v17 = v10;
          _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "_ATXAppInfoManager: Uninstall occurred for %@ - Deleting appInfo and action data related to it.", buf, 0xCu);
        }

        [(_ATXDataStore *)self->_dataStore removeAppInfoForBundleId:v10];
        [(_ATXDataStore *)self->_dataStore removeActionDataForBundleId:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v7);
  }

  pthread_rwlock_unlock(&self->_rwlock);
}

- (void)removeAppLaunchesForBundleId:(id)a3
{
  p_rwlock = &self->_rwlock;
  id v5 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  [(_ATXDataStore *)self->_dataStore removeAppLaunchesForBundleId:v5];

  pthread_rwlock_unlock(p_rwlock);
}

- (void)removeActionDataForBundleId:(id)a3
{
  p_rwlock = &self->_rwlock;
  id v5 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  [(_ATXDataStore *)self->_dataStore removeActionDataForBundleId:v5];

  pthread_rwlock_unlock(p_rwlock);
}

- (void)clearAppLaunchInfo
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  [(_ATXDataStore *)self->_dataStore clearAppLaunchInfo];
  pthread_rwlock_unlock(p_rwlock);
}

- (void)clearAppInstallInfo
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  [(_ATXDataStore *)self->_dataStore clearAppInstallInfo];
  pthread_rwlock_unlock(p_rwlock);
}

- (void)startInstallDeltaRecording
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  id v4 = (NSMutableArray *)objc_opt_new();
  installDeltaLog = self->_installDeltaLog;
  self->_installDeltaLog = v4;

  pthread_rwlock_unlock(p_rwlock);
}

- (id)stopInstallDeltaRecording
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  id v4 = self->_installDeltaLog;
  installDeltaLog = self->_installDeltaLog;
  self->_installDeltaLog = 0;

  pthread_rwlock_unlock(p_rwlock);
  return v4;
}

- (void)train
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "_ATXAppInfoManager: Updating GenreIds for all apps.", v2, v3, v4, v5, v6);
}

- (void)removeUninstalledApps
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) bundleIdentifier];
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  [(_ATXDataStore *)self->_dataStore removeAppInfoForBundleIdsNotInSet:v3];
}

+ (id)sortArrayAndComputeMedian:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    [v3 sortUsingSelector:sel_compare_];
    int v4 = [v3 count];
    if (v4 >= 0) {
      int v5 = v4;
    }
    else {
      int v5 = v4 + 1;
    }
    char v6 = [v3 count];
    uint64_t v7 = [v3 objectAtIndexedSubscript:(uint64_t)v5 >> 1];
    uint64_t v8 = v7;
    if ((v6 & 1) == 0)
    {
      [v7 doubleValue];
      double v10 = v9;
      long long v11 = [v3 objectAtIndexedSubscript:(v5 >> 1) - 1];
      [v11 doubleValue];
      double v13 = (v10 + v12) * 0.5;

      uint64_t v8 = [NSNumber numberWithDouble:v13];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)computeAverageAndMedianSecondsBetweenAppLaunches
{
  id v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
  int v4 = objc_opt_new();
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__72;
  v18[4] = __Block_byref_object_dispose__72;
  id v19 = 0;
  int v5 = BiomeLibrary();
  char v6 = [v5 App];
  uint64_t v7 = [v6 InFocus];
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  double v9 = objc_msgSend(v7, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v3, v8, 0, 0, 0);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  long long v14 = __70___ATXAppInfoManager_computeAverageAndMedianSecondsBetweenAppLaunches__block_invoke_45;
  uint64_t v15 = &unk_1E68ACE38;
  id v10 = v4;
  id v16 = v10;
  uint64_t v17 = v18;
  id v11 = (id)[v9 sinkWithCompletion:&__block_literal_global_44 shouldContinue:&v12];

  -[_ATXAppInfoManager appLaunchesCalculations:](self, "appLaunchesCalculations:", v10, v12, v13, v14, v15);
  _Block_object_dispose(v18, 8);
}

- (void)appLaunchesCalculations:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v39 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
  int v4 = objc_opt_new();
  int v5 = objc_opt_new();
  char v6 = objc_opt_new();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v3;
  uint64_t v44 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v44)
  {
    id v41 = *(id *)v51;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(id *)v51 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        double v9 = (void *)MEMORY[0x1D25F6CC0]();
        id v10 = [v8 bundleId];
        id v11 = [v4 objectForKeyedSubscript:v10];

        if (!v11)
        {
          uint64_t v12 = objc_opt_new();
          [v4 setObject:v12 forKeyedSubscript:v10];
        }
        uint64_t v13 = [v5 objectForKeyedSubscript:v10];

        if (!v13) {
          [v5 setObject:v39 forKeyedSubscript:v10];
        }
        long long v14 = [v8 startDate];
        uint64_t v15 = [v5 objectForKeyedSubscript:v10];
        [v14 timeIntervalSinceDate:v15];
        double v17 = v16;

        v18 = [v4 objectForKeyedSubscript:v10];
        id v19 = [NSNumber numberWithDouble:v17];
        [v18 addObject:v19];

        uint64_t v20 = NSNumber;
        uint64_t v21 = [v6 objectForKeyedSubscript:v10];
        [v21 doubleValue];
        long long v23 = [v20 numberWithDouble:v17 + v22];
        [v6 setObject:v23 forKeyedSubscript:v10];

        long long v24 = [v8 endDate];
        [v5 setObject:v24 forKeyedSubscript:v10];
      }
      uint64_t v44 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v44);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v42 = [(_ATXAppInfoManager *)self allApps];
  uint64_t v25 = [v42 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v45 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v47 != v45) {
          objc_enumerationMutation(v42);
        }
        uint64_t v28 = *(void *)(*((void *)&v46 + 1) + 8 * j);
        v29 = (void *)MEMORY[0x1D25F6CC0]();
        __int16 v30 = [v6 objectForKeyedSubscript:v28];

        if (v30)
        {
          uint64_t v31 = [v6 objectForKeyedSubscript:v28];
          [v31 doubleValue];
          double v33 = v32;
          v34 = [v4 objectForKeyedSubscript:v28];
          double v35 = v33 / (double)(unint64_t)[v34 count];

          v36 = [NSNumber numberWithDouble:v35];
          [(_ATXAppInfoManager *)self addAverageSecondsBetweenLaunchesForBundleId:v28 average:v36];

          v37 = [v4 objectForKeyedSubscript:v28];
          v38 = +[_ATXAppInfoManager sortArrayAndComputeMedian:v37];
          [(_ATXAppInfoManager *)self addMedianSecondsBetweenLaunchesForBundleId:v28 median:v38];
        }
        else
        {
          [(_ATXAppInfoManager *)self addAverageSecondsBetweenLaunchesForBundleId:v28 average:0];
          [(_ATXAppInfoManager *)self addMedianSecondsBetweenLaunchesForBundleId:v28 median:0];
        }
      }
      uint64_t v26 = [v42 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v26);
  }
}

- (void)computeAverageAndMedianSecondsBetweenAppActions
{
  id v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
  id v3 = objc_opt_new();
  id v4 = objc_alloc_init(MEMORY[0x1E4F4B100]);
  int v5 = [v4 getIntentEventsBetweenStartDate:v14 endDate:v3 forSource:1];

  id v6 = objc_alloc_init(MEMORY[0x1E4F4B3B8]);
  uint64_t v7 = [v6 getActivityIntentEventsBetweenStartDate:v14 endDate:v3];

  id v8 = v7;
  id v9 = v5;
  id v10 = v9;
  if (v9) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (v8) {
      id v12 = v8;
    }
    else {
      id v12 = v9;
    }
  }
  else
  {
    id v12 = [v8 arrayByAddingObjectsFromArray:v9];
  }
  uint64_t v13 = v12;

  [(_ATXAppInfoManager *)self computeAverageAndMedianSecondsBetweenAppActions:v13];
}

- (void)computeAverageAndMedianSecondsBetweenAppActions:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v45 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
  id v4 = objc_opt_new();
  int v5 = objc_opt_new();
  id v6 = objc_opt_new();
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v3;
  uint64_t v50 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v50)
  {
    id v47 = *(id *)v57;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(id *)v57 != v47) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        id v9 = (void *)MEMORY[0x1D25F6CC0]();
        id v10 = (void *)MEMORY[0x1E4F4AE38];
        BOOL v11 = [v8 bundleId];
        id v12 = [v8 intentType];
        uint64_t v13 = [v10 getActionKeyForBundleId:v11 actionType:v12];

        id v14 = [v4 objectForKeyedSubscript:v13];

        if (!v14)
        {
          uint64_t v15 = objc_opt_new();
          [v4 setObject:v15 forKeyedSubscript:v13];
        }
        double v16 = [v5 objectForKeyedSubscript:v13];

        if (!v16) {
          [v5 setObject:v45 forKeyedSubscript:v13];
        }
        double v17 = [v8 startDate];
        v18 = [v5 objectForKeyedSubscript:v13];
        [v17 timeIntervalSinceDate:v18];
        double v20 = v19;

        uint64_t v21 = [v4 objectForKeyedSubscript:v13];
        double v22 = [NSNumber numberWithDouble:v20];
        [v21 addObject:v22];

        long long v23 = NSNumber;
        long long v24 = [v6 objectForKeyedSubscript:v13];
        [v24 doubleValue];
        uint64_t v26 = [v23 numberWithDouble:v20 + v25];
        [v6 setObject:v26 forKeyedSubscript:v13];

        v27 = [v8 endDate];
        [v5 setObject:v27 forKeyedSubscript:v13];
      }
      uint64_t v50 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v50);
  }

  uint64_t v28 = [(_ATXAppInfoManager *)self allActionKeys];
  v29 = [v6 allKeys];
  __int16 v30 = [v28 setByAddingObjectsFromArray:v29];

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v48 = v30;
  uint64_t v31 = [v48 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v51 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v53 != v51) {
          objc_enumerationMutation(v48);
        }
        uint64_t v34 = *(void *)(*((void *)&v52 + 1) + 8 * j);
        double v35 = (void *)MEMORY[0x1D25F6CC0]();
        v36 = [v6 objectForKeyedSubscript:v34];

        if (v36)
        {
          v37 = [v6 objectForKeyedSubscript:v34];
          [v37 doubleValue];
          double v39 = v38;
          v40 = [v4 objectForKeyedSubscript:v34];
          double v41 = v39 / (double)(unint64_t)[v40 count];

          id v42 = [NSNumber numberWithDouble:v41];
          [(_ATXAppInfoManager *)self addAverageSecondsBetweenAppActionsForActionKey:v34 average:v42];

          v43 = [v4 objectForKeyedSubscript:v34];
          uint64_t v44 = +[_ATXAppInfoManager sortArrayAndComputeMedian:v43];
          [(_ATXAppInfoManager *)self addMedianSecondsBetweenAppActionsForActionKey:v34 median:v44];
        }
        else
        {
          [(_ATXAppInfoManager *)self addAverageSecondsBetweenLaunchesForBundleId:v34 average:0];
          [(_ATXAppInfoManager *)self addMedianSecondsBetweenLaunchesForBundleId:v34 median:0];
        }
      }
      uint64_t v32 = [v48 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v32);
  }
}

- (void)updateGenreIdsForAllApps
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(_ATXAppInfoManager *)self allApps];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v8 = (void *)MEMORY[0x1D25F6CC0]();
        id v9 = +[ATXLaunchServicesHelper getGenreIdsForBundleId:v7];
        uint64_t v10 = [v9 first];
        BOOL v11 = (void *)v10;
        if (v10) {
          id v12 = (void *)v10;
        }
        else {
          id v12 = &unk_1F27F1B78;
        }
        uint64_t v13 = [v9 second];
        id v14 = (void *)v13;
        if (v13) {
          uint64_t v15 = v13;
        }
        else {
          uint64_t v15 = MEMORY[0x1E4F1CBF0];
        }
        [(_ATXAppInfoManager *)self updateGenreIdsForBundleId:v7 genreId:v12 subGenreIds:v15];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }
}

- (void)updateApp2VecClustersForAllApps
{
  uint64_t v3 = [(_ATXAppInfoManager *)self allApps];
  uint64_t v4 = [v3 allObjects];
  id v11 = (id)[v4 mutableCopy];

  uint64_t v5 = +[ATXApp2VecClustering sharedInstance];
  id v6 = [v5 getClusterCentroidsForBundleIds:v11];
  if ([v11 count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = (void *)MEMORY[0x1D25F6CC0]();
      id v9 = [v11 objectAtIndexedSubscript:v7];
      uint64_t v10 = [v6 objectAtIndexedSubscript:v7];
      [(_ATXAppInfoManager *)self updateApp2VecClusterForBundleId:v9 app2VecCluster:v10];

      ++v7;
    }
    while ([v11 count] > v7);
  }
}

- (void)removeBundleIds:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        [(_ATXAppInfoManager *)self removeAppLaunchesForBundleId:v9];
        [(_ATXAppInfoManager *)self removeActionDataForBundleId:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installDeltaLog, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

- (void)initWithDataStore:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "_ATXAppInfoManager initialized", v2, v3, v4, v5, v6);
}

@end