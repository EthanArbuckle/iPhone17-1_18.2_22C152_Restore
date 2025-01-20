@interface HDOTAFeatureAvailabilityManager
- (BOOL)downloadImmediatelyWithError:(id *)a3;
- (HDOTAFeatureAvailabilityManager)initWithDaemon:(id)a3;
- (NSDictionary)unitTest_factorFileCache;
- (NSString)factorPackID;
- (NSString)unitTest_factorPath;
- (NSUserDefaults)unitTest_legacyDisableAndExpiryDefaults;
- (id)_fileURLForFileNamed:(id)a3 factorPath:(id)a4;
- (id)_infoDictionaryRepresentationForFileNamed:(void *)a3 error:;
- (id)disableAndExpiryConditionsDictionaryWithError:(id *)a3;
- (id)featureAvailabilityInfoForFeature:(id)a3 error:(id *)a4;
- (id)unitTest_daemonReadyObserverDidFinish;
- (uint64_t)_queue_refreshClientAndNotifyObservers;
- (void)_queue_syncDisableAndExpiryConditionsToLegacyPairedWatches;
- (void)_unitTest_refreshClientAndNotifyObservers;
- (void)daemonReady:(id)a3;
- (void)dealloc;
- (void)downloadWithCompletion:(id)a3;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)setUnitTest_daemonReadyObserverDidFinish:(id)a3;
- (void)setUnitTest_factorPath:(id)a3;
- (void)setUnitTest_legacyDisableAndExpiryDefaults:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation HDOTAFeatureAvailabilityManager

- (HDOTAFeatureAvailabilityManager)initWithDaemon:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HDOTAFeatureAvailabilityManager;
  v5 = [(HDOTAFeatureAvailabilityManager *)&v21 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    uint64_t v7 = [MEMORY[0x1E4FB0098] clientWithIdentifier:275];
    trialClient = v6->_trialClient;
    v6->_trialClient = (TRIClient *)v7;

    uint64_t v9 = HKLogInfrastructure();
    loggingCategory = v6->_loggingCategory;
    v6->_loggingCategory = (OS_os_log *)v9;

    id v11 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v12 = [(HDOTAFeatureAvailabilityManager *)v6 hk_classNameWithTag:@"observers"];
    uint64_t v13 = [v11 initWithName:v12 loggingCategory:v6->_loggingCategory];
    observers = v6->_observers;
    v6->_observers = (HKObserverSet *)v13;

    uint64_t v15 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v15;

    v6->_lock._os_unfair_lock_opaque = 0;
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lock_factorFileCache = v6->_lock_factorFileCache;
    v6->_lock_factorFileCache = v17;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_daemon);
    [WeakRetained registerDaemonReadyObserver:v6 queue:v6->_queue];
  }
  return v6;
}

- (void)dealloc
{
  [(TRIClient *)self->_trialClient removeUpdateHandlerForToken:self->_trialToken];
  v3.receiver = self;
  v3.super_class = (Class)HDOTAFeatureAvailabilityManager;
  [(HDOTAFeatureAvailabilityManager *)&v3 dealloc];
}

- (void)downloadWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__HDOTAFeatureAvailabilityManager_downloadWithCompletion___block_invoke;
  v7[3] = &unk_1E62F4928;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __58__HDOTAFeatureAvailabilityManager_downloadWithCompletion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v4 = 0;
  [v2 downloadImmediatelyWithError:&v4];
  id v3 = v4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)downloadImmediatelyWithError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v5 = HKLogInfrastructure();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = (id)objc_opt_class();
    id v6 = v18;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting immediate download from Trial", buf, 0xCu);
  }
  trialClient = self->_trialClient;
  id v8 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2A278]];
  id v16 = 0;
  char v9 = [(TRIClient *)trialClient immediateDownloadForNamespaceNames:v8 allowExpensiveNetworking:1 error:&v16];
  id v10 = v16;

  if ((v9 & 1) == 0)
  {
    id v11 = v10;
    if (v11)
    {
      if (a3) {
        *a3 = v11;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  _HKInitializeLogging();
  v12 = HKLogInfrastructure();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v18 = v13;
    id v14 = v13;
    _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ending immediate download from Trial", buf, 0xCu);
  }
  return v9;
}

- (void)daemonReady:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  trialClient = self->_trialClient;
  uint64_t v6 = *MEMORY[0x1E4F2A278];
  queue = self->_queue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __47__HDOTAFeatureAvailabilityManager_daemonReady___block_invoke;
  v20[3] = &unk_1E62FEE80;
  objc_copyWeak(&v21, &location);
  id v8 = [(TRIClient *)trialClient addUpdateHandlerForNamespaceName:v6 queue:queue usingBlock:v20];
  trialToken = self->_trialToken;
  self->_trialToken = v8;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  id v11 = [WeakRetained behavior];
  int v12 = [v11 isCompanionCapable];

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_daemon);
    id v14 = [v13 maintenanceWorkCoordinator];
    uint64_t v15 = self->_queue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __47__HDOTAFeatureAvailabilityManager_daemonReady___block_invoke_2;
    v18[3] = &unk_1E62F6BD0;
    objc_copyWeak(&v19, &location);
    id v16 = +[HDMaintenanceOperation maintenanceOperationWithName:@"HDOTAFeatureAvailabilityManager:syncDisableAndExpiryConditionsToLegacyPairedWatches" queue:v15 synchronousBlock:v18];
    [v14 enqueueMaintenanceOperation:v16];

    objc_destroyWeak(&v19);
  }
  unitTest_daemonReadyObserverDidFinish = (void (**)(void))self->_unitTest_daemonReadyObserverDidFinish;
  if (unitTest_daemonReadyObserverDidFinish) {
    unitTest_daemonReadyObserverDidFinish[2]();
  }
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __47__HDOTAFeatureAvailabilityManager_daemonReady___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDOTAFeatureAvailabilityManager _queue_refreshClientAndNotifyObservers]((uint64_t)WeakRetained);
}

- (uint64_t)_queue_refreshClientAndNotifyObservers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 16) refresh];
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 8));
    id v3 = [WeakRetained behavior];
    int v4 = [v3 isCompanionCapable];

    if (v4) {
      -[HDOTAFeatureAvailabilityManager _queue_syncDisableAndExpiryConditionsToLegacyPairedWatches](v1);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 56));
    [*(id *)(v1 + 64) removeAllObjects];
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
    _HKInitializeLogging();
    v5 = *(NSObject **)(v1 + 32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v5;
      *(_DWORD *)buf = 138543362;
      id v11 = (id)objc_opt_class();
      id v7 = v11;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observers of new feature availability information", buf, 0xCu);
    }
    id v8 = *(void **)(v1 + 24);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73__HDOTAFeatureAvailabilityManager__queue_refreshClientAndNotifyObservers__block_invoke;
    v9[3] = &unk_1E62FEEA8;
    v9[4] = v1;
    return [v8 notifyObservers:v9];
  }
  return result;
}

void __47__HDOTAFeatureAvailabilityManager_daemonReady___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDOTAFeatureAvailabilityManager _queue_syncDisableAndExpiryConditionsToLegacyPairedWatches]((uint64_t)WeakRetained);
}

- (void)_queue_syncDisableAndExpiryConditionsToLegacyPairedWatches
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    v2 = *(void **)(a1 + 80);
    if (v2)
    {
      id v3 = v2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F1CB18], "hk_remoteFeatureAvailabilityUserDefaults");
      id v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    int v4 = v3;
    id v28 = 0;
    v5 = [(id)a1 disableAndExpiryConditionsDictionaryWithError:&v28];
    id v6 = v28;
    if (v5)
    {
      id v7 = [v4 dictionaryRepresentation];
      id v8 = [v7 allKeys];
      char v9 = objc_msgSend(v8, "hk_filter:", &__block_literal_global_87);

      id v10 = [v5 allKeys];
      id v11 = [v9 arrayByAddingObjectsFromArray:v10];

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            id v18 = objc_msgSend(v5, "objectForKeyedSubscript:", v17, (void)v24);
            [v4 setObject:v18 forKey:v17];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v14);
      }

      id v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
      HKSynchronizeNanoPreferencesUserDefaults();

      notify_post((const char *)*MEMORY[0x1E4F2A980]);
    }
    else
    {
      _HKInitializeLogging();
      v20 = HKLogInfrastructure();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);

      if (!v21)
      {
LABEL_18:

        return;
      }
      uint64_t v12 = HKLogInfrastructure();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v22 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v31 = v22;
        __int16 v32 = 2114;
        id v33 = v6;
        id v23 = v22;
        _os_log_debug_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEBUG, "[%{public}@] No disable and expiry conditions found: %{public}@", buf, 0x16u);
      }
    }

    goto LABEL_18;
  }
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
}

- (void)unregisterObserver:(id)a3
{
}

- (void)_unitTest_refreshClientAndNotifyObservers
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__HDOTAFeatureAvailabilityManager__unitTest_refreshClientAndNotifyObservers__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __76__HDOTAFeatureAvailabilityManager__unitTest_refreshClientAndNotifyObservers__block_invoke(uint64_t a1)
{
  return -[HDOTAFeatureAvailabilityManager _queue_refreshClientAndNotifyObservers](*(void *)(a1 + 32));
}

uint64_t __73__HDOTAFeatureAvailabilityManager__queue_refreshClientAndNotifyObservers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 OTAFeatureAvailabilityManagerDidUpdateFeatureAvailabilityInfo:*(void *)(a1 + 32)];
}

- (NSString)factorPackID
{
  v2 = [(TRIClient *)self->_trialClient rolloutIdentifiersWithNamespaceName:*MEMORY[0x1E4F2A278]];
  id v3 = [v2 factorPackId];
  int v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (id)_fileURLForFileNamed:(id)a3 factorPath:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = NSString;
  id v7 = a4;
  id v8 = [v6 stringWithFormat:@"%@.plist", a3];
  char v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:1];

  id v10 = [v5 fileURLWithPath:v8 isDirectory:0 relativeToURL:v9];

  return v10;
}

- (id)_infoDictionaryRepresentationForFileNamed:(void *)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = *(void **)(a1 + 72);
    if (v6)
    {
      id v7 = v6;
    }
    else
    {
      id v8 = [*(id *)(a1 + 16) levelForFactor:@"Feature Availability" withNamespaceName:*MEMORY[0x1E4F2A278]];
      char v9 = [v8 directoryValue];
      if ([v9 hasPath])
      {
        id v7 = [v9 path];
      }
      else
      {
        id v7 = 0;
      }

      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 11, @"Asset factor not downloaded");
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          if (a3) {
            *a3 = v14;
          }
          else {
            _HKLogDroppedError();
          }
        }

        id v7 = 0;
        uint64_t v12 = 0;
        goto LABEL_23;
      }
    }
    id v10 = [(id)a1 _fileURLForFileNamed:v5 factorPath:v7];
    id v11 = (os_unfair_lock_s *)(a1 + 56);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    uint64_t v12 = [*(id *)(a1 + 64) objectForKey:v10];
    if (v12)
    {
LABEL_22:
      os_unfair_lock_unlock(v11);

LABEL_23:
      goto LABEL_24;
    }
    id v19 = 0;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v10 error:&v19];
    id v13 = v19;
    [*(id *)(a1 + 64) setObject:v12 forKeyedSubscript:v10];
    if (!v12)
    {
      if ((objc_msgSend(v13, "hk_isCocoaNoSuchFileError") & 1) == 0 && v13)
      {
        id v13 = v13;
LABEL_17:
        if (a3) {
          *a3 = v13;
        }
        else {
          _HKLogDroppedError();
        }

        goto LABEL_21;
      }
      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      id v16 = [NSString stringWithFormat:@"No plist found with name %@", v5];
      uint64_t v17 = objc_msgSend(v15, "hk_error:description:underlyingError:", 11, v16, v13);

      id v13 = v17;
      if (v13) {
        goto LABEL_17;
      }
    }
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v12 = 0;
LABEL_24:

  return v12;
}

- (id)disableAndExpiryConditionsDictionaryWithError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  if (([v5 isAppleInternalInstall] & 1) == 0)
  {

    goto LABEL_7;
  }
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v7 = [v6 BOOLForKey:@"HDFeatureAvailabilityAssetManagerTestMode"];

  if (!v7)
  {
LABEL_7:
    uint64_t v12 = -[HDOTAFeatureAvailabilityManager _infoDictionaryRepresentationForFileNamed:error:]((uint64_t)self, @"DisableAndExpireConditions", a3);
    goto LABEL_8;
  }
  id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/mobile/Library/HXMobileAssetTester/ActiveOverride" isDirectory:1];
  char v9 = [v8 URLByAppendingPathComponent:@"Conditions.plist" isDirectory:0];
  _HKInitializeLogging();
  id v10 = HKLogInfrastructure();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v15 = 138543618;
    id v16 = (id)objc_opt_class();
    __int16 v17 = 2112;
    id v18 = v9;
    id v14 = v16;
    _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Running in HXMobileAssetTester test mode, looking for asset in %@", (uint8_t *)&v15, 0x16u);
  }
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v9 error:a3];
  uint64_t v12 = objc_msgSend(v11, "hk_dictionaryByAddingEntriesFromDictionary:", &unk_1F17EF6C0);

LABEL_8:

  return v12;
}

- (id)featureAvailabilityInfoForFeature:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v15 = 0;
  int v7 = -[HDOTAFeatureAvailabilityManager _infoDictionaryRepresentationForFileNamed:error:]((uint64_t)self, v6, &v15);
  id v8 = v15;
  char v9 = v8;
  if (v7)
  {
    id v10 = [[HDOTAFeatureAvailabilityInfo alloc] initWithDictionaryRepresentation:v7];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = v11;
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 100, @"Could not decode info %@ for feature %@", v7, v6);
    id v11 = 0;
  }
  else
  {
    id v13 = (HDOTAFeatureAvailabilityInfo *)v8;
    id v11 = v13;
    if (v13)
    {
      if (a4)
      {
        id v11 = v13;
        uint64_t v12 = 0;
        *a4 = v11;
        goto LABEL_10;
      }
      _HKLogDroppedError();
    }
  }
  uint64_t v12 = 0;
LABEL_10:

  return v12;
}

uint64_t __93__HDOTAFeatureAvailabilityManager__queue_syncDisableAndExpiryConditionsToLegacyPairedWatches__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v2 hasPrefix:@"Expire"]) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = [v2 hasPrefix:@"Disable"];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (NSDictionary)unitTest_factorFileCache
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v4 = (void *)[(NSMutableDictionary *)self->_lock_factorFileCache copy];
  os_unfair_lock_unlock(p_lock);

  return (NSDictionary *)v4;
}

- (NSString)unitTest_factorPath
{
  return self->_unitTest_factorPath;
}

- (void)setUnitTest_factorPath:(id)a3
{
}

- (NSUserDefaults)unitTest_legacyDisableAndExpiryDefaults
{
  return self->_unitTest_legacyDisableAndExpiryDefaults;
}

- (void)setUnitTest_legacyDisableAndExpiryDefaults:(id)a3
{
}

- (id)unitTest_daemonReadyObserverDidFinish
{
  return self->_unitTest_daemonReadyObserverDidFinish;
}

- (void)setUnitTest_daemonReadyObserverDidFinish:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_daemonReadyObserverDidFinish, 0);
  objc_storeStrong((id *)&self->_unitTest_legacyDisableAndExpiryDefaults, 0);
  objc_storeStrong((id *)&self->_unitTest_factorPath, 0);
  objc_storeStrong((id *)&self->_lock_factorFileCache, 0);
  objc_storeStrong((id *)&self->_trialToken, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);

  objc_destroyWeak((id *)&self->_daemon);
}

@end