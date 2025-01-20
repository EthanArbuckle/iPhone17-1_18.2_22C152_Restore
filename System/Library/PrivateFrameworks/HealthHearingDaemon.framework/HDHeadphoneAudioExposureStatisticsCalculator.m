@interface HDHeadphoneAudioExposureStatisticsCalculator
- (BOOL)isSetup;
- (BOOL)needsRebuild;
- (HDHeadphoneAudioExposureStatisticsCalculator)initWithProfile:(id)a3 keyValueStore:(id)a4;
- (id)_initWithProfile:(id)a3 keyValueStore:(id)a4 daemonDidBecomeReadyHandler:(id)a5;
- (id)_loadBucketsFromProfile:(id)a3 needsRebuild:(BOOL *)a4 error:(id *)a5;
- (id)_loadCacheWithError:(id *)a3;
- (id)_rebuildWithAssertion:(id)a3 allowInitialQueriesToFail:(BOOL)a4 resetDoseToZero:(BOOL)a5 error:(id *)a6;
- (id)_rebuildWithAssertionFromHAENFireDateUpdate:(int64_t)a3 assertion:(id)a4 error:(id *)a5;
- (id)_setupWithAssertion:(id)a3 error:(id *)a4;
- (id)_updateWithExposure:(id)a3 replaying:(BOOL)a4 assertion:(id)a5 error:(id *)a6;
- (id)_updateWithExposure:(id)a3 replaying:(BOOL)a4 error:(id *)a5;
- (id)pruneWithNowDate:(id)a3 limit:(unint64_t)a4 error:(id *)a5;
- (id)rebuildWithAssertion:(id)a3 error:(id *)a4;
- (id)unitTesting_didUpdatePreviousSevenDayNotificationFireDate;
- (id)unitTesting_pendingSamples;
- (id)unitTesting_snapshotBuckets;
- (id)updateWithExposure:(id)a3 assertion:(id)a4 error:(id *)a5;
- (id)updateWithNotifications:(id)a3 assertion:(id)a4 error:(id *)a5;
- (id)updateWithRemoteNotificationDismissalFireDate:(id)a3 assertion:(id)a4 error:(id *)a5;
- (void)_setNeedsRebuild:(BOOL)a3;
- (void)setNeedsRebuild;
- (void)setUnitTesting_didUpdatePreviousSevenDayNotificationFireDate:(id)a3;
- (void)unitTesting_clearNeedsRebuild;
@end

@implementation HDHeadphoneAudioExposureStatisticsCalculator

- (HDHeadphoneAudioExposureStatisticsCalculator)initWithProfile:(id)a3 keyValueStore:(id)a4
{
  return (HDHeadphoneAudioExposureStatisticsCalculator *)[(HDHeadphoneAudioExposureStatisticsCalculator *)self _initWithProfile:a3 keyValueStore:a4 daemonDidBecomeReadyHandler:0];
}

- (id)_initWithProfile:(id)a3 keyValueStore:(id)a4 daemonDidBecomeReadyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 profileIdentifier];
  v11 = [v9 _profileIdentifier];
  char v12 = [v10 isEqual:v11];

  if ((v12 & 1) == 0)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HDHeadphoneAudioExposureStatisticsCalculator.m", 49, @"Invalid parameter not satisfying: %@", @"[profile.profileIdentifier isEqual:keyValueStore._profileIdentifier]" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)HDHeadphoneAudioExposureStatisticsCalculator;
  v13 = [(HDHeadphoneAudioExposureStatisticsCalculator *)&v23 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_profile, v8);
    objc_storeStrong((id *)&v14->_keyValueStore, a4);
    uint64_t v15 = HKCreateSerialDispatchQueue();
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v15;

    *(_WORD *)&v14->_setup = 256;
    memoryCache = v14->_memoryCache;
    v14->_memoryCache = 0;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingSamples = v14->_pendingSamples;
    v14->_pendingSamples = v18;

    v20 = v14;
  }

  return v14;
}

- (id)rebuildWithAssertion:(id)a3 error:(id *)a4
{
  if (self->_setup) {
    [(HDHeadphoneAudioExposureStatisticsCalculator *)self _rebuildWithAssertion:a3 allowInitialQueriesToFail:0 resetDoseToZero:0 error:a4];
  }
  else {
  v4 = [(HDHeadphoneAudioExposureStatisticsCalculator *)self _setupWithAssertion:a3 error:a4];
  }
  return v4;
}

- (id)updateWithNotifications:(id)a3 assertion:(id)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = objc_opt_class();
    __int16 v18 = 2048;
    uint64_t v19 = [v8 count];
    _os_log_impl(&dword_22615C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processing %lu HAEN sample(s)", buf, 0x16u);
  }
  keyValueStore = self->_keyValueStore;
  uint64_t v15 = 0;
  v13 = [(HDHeadphoneAudioExposureStatisticsCalculator *)self _rebuildWithAssertionFromHAENFireDateUpdate:[(HDHeadphoneDoseMetadataStore *)keyValueStore updatePreviousSevenDayLocalNotificationFireDateWithSamplesInserted:v8 error:&v15] assertion:v9 error:a5];

  return v13;
}

- (id)updateWithRemoteNotificationDismissalFireDate:(id)a3 assertion:(id)a4 error:(id *)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    int v15 = 138543362;
    uint64_t v16 = objc_opt_class();
    _os_log_impl(&dword_22615C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating last HAE notification fired received", (uint8_t *)&v15, 0xCu);
  }
  int64_t v12 = [(HDHeadphoneDoseMetadataStore *)self->_keyValueStore updatePreviousSevenDayRemoteNotificationFireDateWith:v9 error:a5];

  v13 = [(HDHeadphoneAudioExposureStatisticsCalculator *)self _rebuildWithAssertionFromHAENFireDateUpdate:v12 assertion:v8 error:a5];

  return v13;
}

- (id)_rebuildWithAssertionFromHAENFireDateUpdate:(int64_t)a3 assertion:(id)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if (a3)
  {
    uint64_t v9 = MEMORY[0x22A647340](self->_unitTesting_didUpdatePreviousSevenDayNotificationFireDate);
    v10 = (void *)v9;
    if (v9) {
      (*(void (**)(uint64_t))(v9 + 16))(v9);
    }

    if (a3 == 1)
    {
      v11 = +[HDHeadphoneExposureUpdateDoseResult resultForNoChange];
    }
    else
    {
      _HKInitializeLogging();
      int64_t v12 = (void *)*MEMORY[0x263F09910];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        int v16 = 138543362;
        uint64_t v17 = objc_opt_class();
        _os_log_impl(&dword_22615C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resetting 7-day headphone stats for next notification.", (uint8_t *)&v16, 0xCu);
      }
      [(HDHeadphoneAudioExposureStatisticsCalculator *)self setNeedsRebuild];
      v14 = [(HDHeadphoneAudioExposureStatisticsCalculator *)self _rebuildWithAssertion:v8 allowInitialQueriesToFail:1 resetDoseToZero:a3 == 3 error:a5];
      if (v14)
      {
        v11 = +[HDHeadphoneExposureUpdateDoseResult resultForUpdate:v14];
      }
      else
      {
        v11 = 0;
      }
    }
  }
  else
  {
    [(HDHeadphoneAudioExposureStatisticsCalculator *)self setNeedsRebuild];
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:underlyingError:", a5, 100, @"Process HAEN Failed", 0);
    v11 = 0;
  }

  return v11;
}

- (id)updateWithExposure:(id)a3 assertion:(id)a4 error:(id *)a5
{
  return [(HDHeadphoneAudioExposureStatisticsCalculator *)self _updateWithExposure:a3 replaying:0 assertion:a4 error:a5];
}

- (id)pruneWithNowDate:(id)a3 limit:(unint64_t)a4 error:(id *)a5
{
  memoryCache = self->_memoryCache;
  id v9 = a3;
  [(HDHeadphoneAudioExposureBucketCollection *)memoryCache pruneWithNowDate:v9];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v11 = +[HDHeadphoneAudioExposureStatisticsEntity _pruneWithNowDate:v9 limit:a4 profile:WeakRetained error:a5];

  int64_t v12 = +[HDHeadphoneExposureStatisticsResult resultWithCache:self->_memoryCache prunedCount:v11];

  return v12;
}

- (void)setNeedsRebuild
{
}

- (id)unitTesting_snapshotBuckets
{
  return [(HDHeadphoneAudioExposureBucketCollection *)self->_memoryCache unitTesting_snapshotBuckets];
}

- (id)unitTesting_pendingSamples
{
  v2 = (void *)[(NSMutableArray *)self->_pendingSamples copy];
  return v2;
}

- (void)unitTesting_clearNeedsRebuild
{
}

- (id)_setupWithAssertion:(id)a3 error:(id *)a4
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v83 = a3;
  if ([(HDHeadphoneAudioExposureStatisticsCalculator *)self isSetup])
  {
    v76 = [MEMORY[0x263F08690] currentHandler];
    [v76 handleFailureInMethod:a2, self, @"HDHeadphoneAudioExposureStatisticsCalculator.m", 169, @"Invalid parameter not satisfying: %@", @"self.isSetup == NO" object file lineNumber description];
  }
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    *(_DWORD *)buf = 138543362;
    uint64_t v95 = objc_opt_class();
    _os_log_impl(&dword_22615C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting up 7-Day HAE statistics.", buf, 0xCu);
  }
  keyValueStore = self->_keyValueStore;
  id v93 = 0;
  BOOL v10 = [(HDHeadphoneDoseMetadataStore *)keyValueStore _shouldRebuildSevenDayStatisticsWithError:&v93];
  id v11 = v93;
  int64_t v12 = v11;
  self->_BOOL needsRebuild = v10;
  if (v11)
  {
    if (objc_msgSend(v11, "hk_isHealthStoreUnavailableError"))
    {
      if (a4)
      {
        v13 = 0;
        *a4 = v12;
        goto LABEL_86;
      }
      _HKLogDroppedError();
      goto LABEL_85;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_ERROR)) {
      -[HDHeadphoneAudioExposureStatisticsCalculator _setupWithAssertion:error:].cold.6();
    }
    self->_BOOL needsRebuild = 1;
  }
  SEL v78 = a2;
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int v16 = [WeakRetained database];
  int v17 = [v16 isProtectedDataAvailable];
  v81 = self;
  if (!v17)
  {

LABEL_19:
    goto LABEL_21;
  }
  BOOL needsRebuild = self->_needsRebuild;

  if (needsRebuild)
  {
    _HKInitializeLogging();
    uint64_t v19 = (void *)*MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = v19;
      uint64_t v21 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v95 = v21;
      _os_log_impl(&dword_22615C000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Priming: protected data available; rebuilding.",
        buf,
        0xCu);
    }
    id v92 = 0;
    v13 = [(HDHeadphoneAudioExposureStatisticsCalculator *)v81 _rebuildWithAssertion:v83 allowInitialQueriesToFail:0 resetDoseToZero:0 error:&v92];
    id v22 = v92;
    id WeakRetained = v22;
    if (v13)
    {
      int v17 = 1;
      goto LABEL_24;
    }
    if (objc_msgSend(v22, "hk_isHealthStoreUnavailableError"))
    {
      v28 = v12;
      id v29 = WeakRetained;
      if (v29)
      {
        if (a4) {
          *a4 = v29;
        }
        else {
          _HKLogDroppedError();
        }
      }

      int64_t v12 = v28;
      goto LABEL_85;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_ERROR)) {
      -[HDHeadphoneAudioExposureStatisticsCalculator _setupWithAssertion:error:].cold.5();
    }
    goto LABEL_19;
  }
  int v17 = 0;
LABEL_21:
  _HKInitializeLogging();
  objc_super v23 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    v24 = v23;
    uint64_t v25 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    uint64_t v95 = v25;
    _os_log_impl(&dword_22615C000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Priming: protected data unavailable; loading statistics from disk.",
      buf,
      0xCu);
  }
  id v91 = 0;
  v13 = [(HDHeadphoneAudioExposureStatisticsCalculator *)v81 _loadCacheWithError:&v91];
  id v26 = v91;
  id WeakRetained = v26;
  if (v13)
  {
LABEL_24:

    if (([v13 needsRebuildOnNextUnlock] & 1) == 0 && !v81->_needsRebuild) {
      goto LABEL_58;
    }
    goto LABEL_41;
  }
  id v27 = v26;
  if (v27)
  {
    if (a4) {
      *a4 = v27;
    }
    else {
      _HKLogDroppedError();
    }
  }

  if (objc_msgSend(v27, "hk_isHealthStoreUnavailableError"))
  {

LABEL_85:
    v13 = 0;
    goto LABEL_86;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_ERROR)) {
    -[HDHeadphoneAudioExposureStatisticsCalculator _setupWithAssertion:error:].cold.4();
  }

  v13 = 0;
LABEL_41:
  id v30 = objc_loadWeakRetained((id *)p_profile);
  v31 = [v30 database];
  int v32 = [v31 isProtectedDataAvailable];

  if (v32 && !v17)
  {
    v33 = v13;
    _HKInitializeLogging();
    v34 = (void *)*MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
    {
      v35 = v34;
      uint64_t v36 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v95 = v36;
      _os_log_impl(&dword_22615C000, v35, OS_LOG_TYPE_DEFAULT, "[%{public}@] Priming failed: protected data available; rebuilding.",
        buf,
        0xCu);
    }
    id v90 = 0;
    v13 = [(HDHeadphoneAudioExposureStatisticsCalculator *)v81 _rebuildWithAssertion:v83 allowInitialQueriesToFail:0 resetDoseToZero:0 error:&v90];
    id v37 = v90;

    if (!v13)
    {
      id v38 = v37;
      if (v38)
      {
        if (a4) {
          *a4 = v38;
        }
        else {
          _HKLogDroppedError();
        }
      }

      if (objc_msgSend(v38, "hk_isHealthStoreUnavailableError"))
      {

        goto LABEL_85;
      }
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_ERROR)) {
        -[HDHeadphoneAudioExposureStatisticsCalculator _setupWithAssertion:error:]();
      }
    }
  }
  if (!v13)
  {
LABEL_82:
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
      -[HDHeadphoneAudioExposureStatisticsCalculator _setupWithAssertion:error:]();
    }

    goto LABEL_85;
  }
LABEL_58:
  v39 = v81;
  if (!v81->_memoryCache) {
    goto LABEL_82;
  }
  _HKInitializeLogging();
  v40 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    v41 = v40;
    uint64_t v42 = objc_opt_class();
    uint64_t v43 = [(NSMutableArray *)v81->_pendingSamples count];
    *(_DWORD *)buf = 138543618;
    uint64_t v95 = v42;
    __int16 v96 = 2048;
    uint64_t v97 = v43;
    _os_log_impl(&dword_22615C000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] Replaying %lu HAE sample batches that arrived during setup.", buf, 0x16u);
  }
  v77 = v12;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  obj = v81->_pendingSamples;
  uint64_t v84 = [(NSMutableArray *)obj countByEnumeratingWithState:&v86 objects:v102 count:16];
  uint64_t v44 = 0;
  if (v84)
  {
    uint64_t v45 = 0;
    uint64_t v46 = *(void *)v87;
    uint64_t v80 = *(void *)v87;
    do
    {
      uint64_t v47 = 0;
      do
      {
        if (*(void *)v87 != v46) {
          objc_enumerationMutation(obj);
        }
        v48 = *(void **)(*((void *)&v86 + 1) + 8 * v47);
        uint64_t v49 = v45 + v47 + 1;
        _HKInitializeLogging();
        v50 = (void *)*MEMORY[0x263F09910];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
        {
          v51 = v50;
          uint64_t v52 = objc_opt_class();
          v53 = v39;
          uint64_t v54 = v45 + v47 + 1;
          uint64_t v55 = v52;
          uint64_t v56 = [(NSMutableArray *)v53->_pendingSamples count];
          [v48 samples];
          uint64_t v57 = v44;
          uint64_t v58 = v45;
          v60 = v59 = v13;
          uint64_t v61 = [v60 count];
          *(_DWORD *)buf = 138544130;
          uint64_t v95 = v55;
          uint64_t v49 = v54;
          __int16 v96 = 2048;
          uint64_t v97 = v54;
          __int16 v98 = 2048;
          uint64_t v99 = v56;
          v39 = v81;
          __int16 v100 = 2048;
          uint64_t v101 = v61;
          _os_log_impl(&dword_22615C000, v51, OS_LOG_TYPE_DEFAULT, "[%{public}@] Replaying HAE batch (%lu of %lu) containing %lu samples.", buf, 0x2Au);

          v13 = v59;
          uint64_t v45 = v58;
          uint64_t v44 = v57;
          uint64_t v46 = v80;
        }
        id v85 = 0;
        v62 = [(HDHeadphoneAudioExposureStatisticsCalculator *)v39 _updateWithExposure:v48 replaying:1 assertion:v83 error:&v85];
        id v63 = v85;
        if (v62)
        {
          id v64 = v62;

          v65 = [v64 cache];

          if (!v65)
          {
            v71 = [MEMORY[0x263F08690] currentHandler];
            [v71 handleFailureInMethod:v78, v39, @"HDHeadphoneAudioExposureStatisticsCalculator.m", 261, @"Invalid parameter not satisfying: %@", @"result.cache" object file lineNumber description];
          }
          uint64_t v44 = [v64 eligbleForUserNotification] | v44;
          v13 = v64;
        }
        else
        {
          uint64_t v66 = v49;
          _HKInitializeLogging();
          v67 = (void *)*MEMORY[0x263F09910];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT))
          {
            v79 = v13;
            v68 = v67;
            uint64_t v69 = objc_opt_class();
            uint64_t v70 = [(NSMutableArray *)v39->_pendingSamples count];
            *(_DWORD *)buf = 138544130;
            uint64_t v95 = v69;
            __int16 v96 = 2048;
            uint64_t v97 = v66;
            __int16 v98 = 2048;
            uint64_t v99 = v70;
            __int16 v100 = 2112;
            uint64_t v101 = (uint64_t)v63;
            _os_log_fault_impl(&dword_22615C000, v68, OS_LOG_TYPE_FAULT, "[%{public}@] Replaying HAE batch (%lu of %lu) failed with error: %@", buf, 0x2Au);

            v13 = v79;
          }
          [(HDHeadphoneAudioExposureStatisticsCalculator *)v39 setNeedsRebuild];
        }

        ++v47;
      }
      while (v84 != v47);
      v45 += v47;
      uint64_t v84 = [(NSMutableArray *)obj countByEnumeratingWithState:&v86 objects:v102 count:16];
    }
    while (v84);
  }

  if ((v44 & 1) != [v13 eligbleForUserNotification])
  {
    uint64_t v72 = objc_msgSend(v13, "copyWithEligbleForUserNotificationOverride:");
    v73 = v13;
    v13 = (void *)v72;
  }
  int64_t v12 = v77;
  [(NSMutableArray *)v39->_pendingSamples removeAllObjects];
  if (v13 && v39->_memoryCache)
  {
    v39->_setup = 1;
  }
  else
  {
    _HKInitializeLogging();
    v75 = (void *)*MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
      -[HDHeadphoneAudioExposureStatisticsCalculator _setupWithAssertion:error:](v75);
    }
  }
LABEL_86:

  return v13;
}

- (id)_rebuildWithAssertion:(id)a3 allowInitialQueriesToFail:(BOOL)a4 resetDoseToZero:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v11 = a3;
  if (v7 && !a4)
  {
    uint64_t v55 = [MEMORY[0x263F08690] currentHandler];
    [v55 handleFailureInMethod:a2, self, @"HDHeadphoneAudioExposureStatisticsCalculator.m", 287, @"Invalid parameter not satisfying: %@", @"!resetDoseToZero || (resetDoseToZero && allowInitialQueriesToFail)" object file lineNumber description];
  }
  _HKInitializeLogging();
  int64_t v12 = (os_log_t *)MEMORY[0x263F09910];
  v13 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    *(_DWORD *)buf = 138543362;
    uint64_t v67 = objc_opt_class();
    _os_log_impl(&dword_22615C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Rebuilding 7-Day HAE Statistics.", buf, 0xCu);
  }
  keyValueStore = self->_keyValueStore;
  id v65 = 0;
  BOOL v16 = [(HDHeadphoneDoseMetadataStore *)keyValueStore rebuildCachedFireDateFromLocalHAENStoreIfNeededWithError:&v65];
  id v17 = v65;
  uint64_t v18 = v17;
  if (v16)
  {
LABEL_13:
    id v22 = self->_keyValueStore;
    id v64 = 0;
    objc_super v23 = +[HDHeadphoneAudioExposurePolicyDeterminer determinePreviousFireDateWithStore:v22 error:&v64];
    id v24 = v64;
    id v20 = v24;
    if (!v23 && v24)
    {
      [(HDHeadphoneAudioExposureStatisticsCalculator *)self setNeedsRebuild];
      if (a6)
      {
        uint64_t v21 = 0;
        *a6 = v20;
      }
      else
      {
        _HKLogDroppedError();
        uint64_t v21 = 0;
      }
      goto LABEL_48;
    }
    uint64_t v57 = a6;
    uint64_t v58 = v18;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v26 = +[HDHeadphoneAudioExposureStatisticsBucket makeBucketsForProfile:WeakRetained earliestStartDate:v23];

    id v27 = v11;
    v28 = [MEMORY[0x263F431E0] contextForAccessibilityAssertion:v11];
    uint64_t v29 = [v28 mutableCopy];

    [(id)v29 setCacheScope:1];
    id v30 = objc_loadWeakRetained((id *)&self->_profile);
    v31 = [v30 database];
    id v63 = 0;
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __118__HDHeadphoneAudioExposureStatisticsCalculator__rebuildWithAssertion_allowInitialQueriesToFail_resetDoseToZero_error___block_invoke;
    v61[3] = &unk_2647960A0;
    id v32 = v26;
    id v62 = v32;
    uint64_t v56 = (void *)v29;
    LOBYTE(v29) = [v31 performWithTransactionContext:v29 error:&v63 block:v61];
    id v59 = v63;

    if (v29)
    {
      id v11 = v27;
      uint64_t v18 = v58;
      p_profile = &self->_profile;
    }
    else
    {
      if (!a4)
      {
        [(HDHeadphoneAudioExposureStatisticsCalculator *)self setNeedsRebuild];
        v41 = v59;
        id v42 = v59;
        uint64_t v43 = v42;
        id v11 = v27;
        uint64_t v18 = v58;
        if (v42)
        {
          if (v57) {
            *uint64_t v57 = v42;
          }
          else {
            _HKLogDroppedError();
          }
        }

        uint64_t v21 = 0;
        goto LABEL_47;
      }
      _HKInitializeLogging();
      v34 = (os_log_t *)MEMORY[0x263F09910];
      v35 = (void *)*MEMORY[0x263F09910];
      id v11 = v27;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_ERROR))
      {
        uint64_t v52 = v35;
        uint64_t v53 = objc_opt_class();
        uint64_t v54 = [v32 count];
        *(_DWORD *)buf = 138543874;
        uint64_t v67 = v53;
        __int16 v68 = 2048;
        uint64_t v69 = v54;
        __int16 v70 = 2112;
        id v71 = v59;
        _os_log_error_impl(&dword_22615C000, v52, OS_LOG_TYPE_ERROR, "[%{public}@] Resetting %lu buckets after initial query failure: %@.", buf, 0x20u);
      }
      uint64_t v18 = v58;
      if (!v23 && v7)
      {
        _HKInitializeLogging();
        os_log_t v36 = *v34;
        if (os_log_type_enabled(*v34, OS_LOG_TYPE_FAULT)) {
          -[HDHeadphoneAudioExposureStatisticsCalculator _rebuildWithAssertion:allowInitialQueriesToFail:resetDoseToZero:error:](v36);
        }
        [(HDHeadphoneAudioExposureStatisticsCalculator *)self setNeedsRebuild];
        BOOL v7 = 0;
      }
      memoryCache = self->_memoryCache;
      id v60 = 0;
      id v38 = [(HDHeadphoneAudioExposureBucketCollection *)memoryCache _bucketsWithEarliestStartDate:v23 resetDoseToZero:v7 error:&v60];
      id v39 = v60;
      if (v38)
      {
        id v40 = v38;

        id v32 = v40;
      }
      else
      {
        uint64_t v44 = self->_memoryCache;
        _HKInitializeLogging();
        uint64_t v45 = *v34;
        BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
        if (v44)
        {
          if (v46) {
            -[HDHeadphoneAudioExposureStatisticsCalculator _rebuildWithAssertion:allowInitialQueriesToFail:resetDoseToZero:error:]();
          }
        }
        else if (v46)
        {
          -[HDHeadphoneAudioExposureStatisticsCalculator _rebuildWithAssertion:allowInitialQueriesToFail:resetDoseToZero:error:](v45);
        }
      }
      p_profile = &self->_profile;
    }
    id v47 = objc_loadWeakRetained((id *)p_profile);
    BOOL v48 = +[HDHeadphoneAudioExposureStatisticsEntity _replaceExistingWithBuckets:v32 profile:v47 error:v57];

    if (v48)
    {
      uint64_t v49 = [[HDHeadphoneAudioExposureBucketCollection alloc] initWithBuckets:v32];
      v50 = self->_memoryCache;
      self->_memoryCache = v49;

      [(HDHeadphoneAudioExposureStatisticsCalculator *)self _setNeedsRebuild:0];
      uint64_t v21 = +[HDHeadphoneExposureStatisticsResult resultWithCache:self->_memoryCache eligbleForUserNotification:0];
    }
    else
    {
      [(HDHeadphoneAudioExposureStatisticsCalculator *)self setNeedsRebuild];
      uint64_t v21 = 0;
    }
    v41 = v59;
LABEL_47:

LABEL_48:
    goto LABEL_49;
  }
  if (!objc_msgSend(v17, "hk_isHealthStoreUnavailableError"))
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
      -[HDHeadphoneAudioExposureStatisticsCalculator _rebuildWithAssertion:allowInitialQueriesToFail:resetDoseToZero:error:].cold.4();
    }
    goto LABEL_13;
  }
  id v19 = v18;
  id v20 = v19;
  if (v19)
  {
    if (a6)
    {
      id v20 = v19;
      uint64_t v21 = 0;
      *a6 = v20;
      goto LABEL_49;
    }
    _HKLogDroppedError();
  }
  uint64_t v21 = 0;
LABEL_49:

  return v21;
}

uint64_t __118__HDHeadphoneAudioExposureStatisticsCalculator__rebuildWithAssertion_allowInitialQueriesToFail_resetDoseToZero_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "queryForInitialStatisticsWithError:", a2, (void)v11);

        if (!v8)
        {
          uint64_t v9 = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 1;
LABEL_11:

  return v9;
}

- (id)_loadBucketsFromProfile:(id)a3 needsRebuild:(BOOL *)a4 error:(id *)a5
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  BOOL v10 = self->_keyValueStore;
  uint64_t v22 = 0;
  objc_super v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__2;
  id v26 = __Block_byref_object_dispose__2;
  id v27 = 0;
  long long v11 = [WeakRetained database];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __91__HDHeadphoneAudioExposureStatisticsCalculator__loadBucketsFromProfile_needsRebuild_error___block_invoke;
  v17[3] = &unk_264796110;
  id v20 = &v22;
  id v12 = WeakRetained;
  id v18 = v12;
  long long v13 = v10;
  id v19 = v13;
  uint64_t v21 = a4;
  LODWORD(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v11 error:a5 block:v17];

  if (a5) {
    long long v14 = (void *)v23[5];
  }
  else {
    long long v14 = 0;
  }
  id v15 = v14;

  _Block_object_dispose(&v22, 8);
  return v15;
}

BOOL __91__HDHeadphoneAudioExposureStatisticsCalculator__loadBucketsFromProfile_needsRebuild_error___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = +[HDHeadphoneAudioExposureStatisticsEntity _loadBucketsFromProfile:a1[4] error:a3];
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (!v8) {
    return 0;
  }
  if ([v8 count])
  {
    uint64_t v9 = [MEMORY[0x263EFF910] now];
    char v10 = objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "hk_containsObjectPassingTest:", &__block_literal_global_4);
    char v11 = objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "hk_containsObjectPassingTest:", &__block_literal_global_314);
    id v12 = *(void **)(*(void *)(a1[6] + 8) + 40);
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    v28 = __91__HDHeadphoneAudioExposureStatisticsCalculator__loadBucketsFromProfile_needsRebuild_error___block_invoke_4;
    uint64_t v29 = &unk_2647960E8;
    id v13 = v9;
    id v30 = v13;
    long long v14 = objc_msgSend(v12, "hk_map:", &v26);
    unint64_t v15 = objc_msgSend(v14, "count", v26, v27, v28, v29);

    if ((v10 & 1) != 0 || (v11 & 1) != 0 || v15 < 3)
    {
      uint64_t v16 = (unsigned char *)a1[7];
      if (v16) {
        *uint64_t v16 = 1;
      }
    }
    BOOL v17 = [*(id *)(*(void *)(a1[6] + 8) + 40) count] != 0;
    id v18 = v30;
  }
  else
  {
    uint64_t v19 = a1[5];
    id v31 = 0;
    id v18 = +[HDHeadphoneAudioExposurePolicyDeterminer determinePreviousFireDateWithStore:v19 error:&v31];
    id v20 = v31;
    id v13 = v20;
    if (v18 || !v20)
    {
      uint64_t v21 = +[HDHeadphoneAudioExposureStatisticsBucket makeBucketsForProfile:a1[4] earliestStartDate:v18];
      uint64_t v22 = *(void *)(a1[6] + 8);
      objc_super v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;

      uint64_t v24 = (unsigned char *)a1[7];
      if (v24) {
        unsigned char *v24 = 1;
      }
      BOOL v17 = +[HDHeadphoneAudioExposureStatisticsEntity _replaceExistingWithBuckets:*(void *)(*(void *)(a1[6] + 8) + 40) profile:a1[4] error:a3];
    }
    else if (a3)
    {
      id v13 = v20;
      BOOL v17 = 0;
      *a3 = v13;
    }
    else
    {
      _HKLogDroppedError();
      BOOL v17 = 0;
    }
  }

  return v17;
}

uint64_t __91__HDHeadphoneAudioExposureStatisticsCalculator__loadBucketsFromProfile_needsRebuild_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 includesJournaledSamples];
}

uint64_t __91__HDHeadphoneAudioExposureStatisticsCalculator__loadBucketsFromProfile_needsRebuild_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 hasPreviousStatistics];
}

id __91__HDHeadphoneAudioExposureStatisticsCalculator__loadBucketsFromProfile_needsRebuild_error___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  if ([v3 isExpiredForNowDate:v2]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (id)_loadCacheWithError:(id *)a3
{
  unsigned __int8 v11 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v6 = [(HDHeadphoneAudioExposureStatisticsCalculator *)self _loadBucketsFromProfile:WeakRetained needsRebuild:&v11 error:a3];

  if ([v6 count])
  {
    uint64_t v7 = [[HDHeadphoneAudioExposureBucketCollection alloc] initWithBuckets:v6];
    memoryCache = self->_memoryCache;
    self->_memoryCache = v7;

    uint64_t v9 = +[HDHeadphoneExposureStatisticsResult resultWithCache:self->_memoryCache eligbleForUserNotification:0];
    [v9 setNeedsRebuildOnNextUnlock:v11];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_updateWithExposure:(id)a3 replaying:(BOOL)a4 assertion:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  if (v11)
  {
    id v12 = [MEMORY[0x263F431E0] contextForReading];
    id v13 = (void *)[v12 mutableCopy];

    [v13 addAccessibilityAssertion:v11];
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__2;
    v28 = __Block_byref_object_dispose__2;
    id v29 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    unint64_t v15 = [WeakRetained database];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __94__HDHeadphoneAudioExposureStatisticsCalculator__updateWithExposure_replaying_assertion_error___block_invoke;
    v20[3] = &unk_264796138;
    uint64_t v22 = &v24;
    v20[4] = self;
    id v21 = v10;
    BOOL v23 = v8;
    int v16 = [v15 performWithTransactionContext:v13 error:a6 block:v20];

    if (v16) {
      BOOL v17 = (void *)v25[5];
    }
    else {
      BOOL v17 = 0;
    }
    id v18 = v17;

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    id v18 = [(HDHeadphoneAudioExposureStatisticsCalculator *)self _updateWithExposure:v10 replaying:v8 error:a6];
  }

  return v18;
}

BOOL __94__HDHeadphoneAudioExposureStatisticsCalculator__updateWithExposure_replaying_assertion_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _updateWithExposure:*(void *)(a1 + 40) replaying:*(unsigned __int8 *)(a1 + 56) error:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
}

- (id)_updateWithExposure:(id)a3 replaying:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  memoryCache = self->_memoryCache;
  _HKInitializeLogging();
  id v10 = (os_log_t *)MEMORY[0x263F09910];
  id v11 = (void *)*MEMORY[0x263F09910];
  id v12 = *MEMORY[0x263F09910];
  if (memoryCache)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v11;
      uint64_t v14 = objc_opt_class();
      unint64_t v15 = [v8 samples];
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v14;
      __int16 v34 = 2048;
      uint64_t v35 = [v15 count];
      _os_log_impl(&dword_22615C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processing HAE sample batch (%lu).", buf, 0x16u);
    }
    buf[0] = 0;
    int v16 = [(HDHeadphoneAudioExposureBucketCollection *)self->_memoryCache _updateWithSampleBatch:v8 needsRebuild:buf error:a5];
    if (buf[0])
    {
      keyValueStore = self->_keyValueStore;
      id v31 = 0;
      BOOL v18 = [(HDHeadphoneDoseMetadataStore *)keyValueStore _setShouldRebuildSevenDayStatistics:1 error:&v31];
      id v19 = v31;
      if (!v18)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR)) {
          -[HDHeadphoneAudioExposureStatisticsCalculator _updateWithExposure:replaying:error:]();
        }
      }
    }
    if ([v16 count])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      id v21 = objc_opt_class();
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __84__HDHeadphoneAudioExposureStatisticsCalculator__updateWithExposure_replaying_error___block_invoke;
      v30[3] = &unk_264796160;
      v30[5] = WeakRetained;
      v30[6] = v21;
      v30[4] = v16;
      uint64_t v22 = (void *)MEMORY[0x22A647340](v30);
      BOOL v23 = [WeakRetained database];
      char v24 = [v21 performWriteTransactionWithHealthDatabase:v23 error:a5 block:v22];

      if (v24)
      {
        uint64_t v25 = +[HDHeadphoneExposureStatisticsResult resultWithCache:eligbleForUserNotification:](HDHeadphoneExposureStatisticsResult, "resultWithCache:eligbleForUserNotification:", self->_memoryCache, [v8 canTriggerUserNotification]);
      }
      else
      {
        [(HDHeadphoneAudioExposureStatisticsCalculator *)self setNeedsRebuild];
        uint64_t v25 = 0;
      }
    }
    else
    {
      uint64_t v25 = 0;
    }
  }
  else if (v6)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[HDHeadphoneAudioExposureStatisticsCalculator _updateWithExposure:replaying:error:]();
    }
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a5, 100, @"cannot flush pending samples without memory cache.");
    uint64_t v25 = 0;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = v11;
      uint64_t v27 = objc_opt_class();
      v28 = [v8 samples];
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v27;
      __int16 v34 = 2048;
      uint64_t v35 = [v28 count];
      _os_log_impl(&dword_22615C000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Caching HAE sample batch (%lu) for replay after initial rebuild.", buf, 0x16u);
    }
    [(NSMutableArray *)self->_pendingSamples addObject:v8];
    uint64_t v25 = +[HDHeadphoneExposureStatisticsResult resultForAppendedSamplesDuringStartup];
  }

  return v25;
}

uint64_t __84__HDHeadphoneAudioExposureStatisticsCalculator__updateWithExposure_replaying_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 48) _replaceExistingWithBuckets:*(void *)(a1 + 32) profile:*(void *)(a1 + 40) error:a3];
}

- (void)_setNeedsRebuild:(BOOL)a3
{
  BOOL v3 = a3;
  self->_BOOL needsRebuild = a3;
  keyValueStore = self->_keyValueStore;
  id v12 = 0;
  BOOL v6 = -[HDHeadphoneDoseMetadataStore _setShouldRebuildSevenDayStatistics:error:](keyValueStore, "_setShouldRebuildSevenDayStatistics:error:");
  id v7 = v12;
  if (!v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_ERROR))
    {
      -[HDHeadphoneAudioExposureStatisticsCalculator _setNeedsRebuild:]();
      if (v3) {
        goto LABEL_4;
      }
LABEL_8:
      id v10 = v7;
      goto LABEL_9;
    }
  }
  if (!v3) {
    goto LABEL_8;
  }
LABEL_4:
  id v8 = self->_keyValueStore;
  id v11 = v7;
  BOOL v9 = [(HDHeadphoneDoseMetadataStore *)v8 _setShouldRebuildPreviousSevenDayNotification:1 error:&v11];
  id v10 = v11;

  if (!v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_ERROR)) {
      -[HDHeadphoneAudioExposureStatisticsCalculator _setNeedsRebuild:]();
    }
  }
LABEL_9:
}

- (BOOL)needsRebuild
{
  return self->_needsRebuild;
}

- (BOOL)isSetup
{
  return self->_setup;
}

- (id)unitTesting_didUpdatePreviousSevenDayNotificationFireDate
{
  return self->_unitTesting_didUpdatePreviousSevenDayNotificationFireDate;
}

- (void)setUnitTesting_didUpdatePreviousSevenDayNotificationFireDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didUpdatePreviousSevenDayNotificationFireDate, 0);
  objc_storeStrong((id *)&self->_pendingSamples, 0);
  objc_storeStrong((id *)&self->_memoryCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_setupWithAssertion:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = v3;
  uint64_t v5 = OUTLINED_FUNCTION_3();
  uint64_t v6 = *(void *)(v1 + 40);
  int v7 = 138543874;
  uint64_t v8 = v5;
  __int16 v9 = 1024;
  BOOL v10 = v0 != 0;
  __int16 v11 = 1024;
  BOOL v12 = v6 != 0;
  _os_log_fault_impl(&dword_22615C000, v2, OS_LOG_TYPE_FAULT, "[%{public}@] Priming Failed (success: %d, memory cache exists: %d).", (uint8_t *)&v7, 0x18u);
}

- (void)_setupWithAssertion:(void *)a1 error:.cold.2(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_22615C000, v2, v3, "[%{public}@] Setup failed with an unexpected error.", v4, v5, v6, v7, v8);
}

- (void)_setupWithAssertion:error:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_22615C000, v0, v1, "Setup failed to rebuild HAE stats (after failed load) with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_setupWithAssertion:error:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_22615C000, v0, v1, "Setup failed to load HAE stats with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_setupWithAssertion:error:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_22615C000, v0, v1, "Setup failed to rebuild HAE stats with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_setupWithAssertion:error:.cold.6()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_22615C000, v3, v4, "[%{public}@] Unable to load rebuild flag due to error (defaulting to YES): %@", v5, v6, v7, v8, v9);
}

- (void)_rebuildWithAssertion:(void *)a1 allowInitialQueriesToFail:resetDoseToZero:error:.cold.1(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  id v1 = a1;
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_22615C000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] No dose to reset since HAEN arrived before initial setup.", v2, 0xCu);
}

- (void)_rebuildWithAssertion:allowInitialQueriesToFail:resetDoseToZero:error:.cold.2()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_22615C000, v3, v4, "[%{public}@] Failed to update buckets to exclude additional historical HAE datums while preserving existing: %@.", v5, v6, v7, v8, v9);
}

- (void)_rebuildWithAssertion:(void *)a1 allowInitialQueriesToFail:resetDoseToZero:error:.cold.3(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_22615C000, v2, v3, "[%{public}@] Reset dose to zero without HAEN fire date is unsupported.", v4, v5, v6, v7, v8);
}

- (void)_rebuildWithAssertion:allowInitialQueriesToFail:resetDoseToZero:error:.cold.4()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_22615C000, v3, v4, "[%{public}@] Unable to optimistically rebuild Previous 7-Day HAEN FireDate: %@", v5, v6, v7, v8, v9);
}

- (void)_updateWithExposure:replaying:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = v2;
  uint64_t v4 = OUTLINED_FUNCTION_3();
  uint64_t v5 = [v0 samples];
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  uint64_t v9 = [v5 count];
  _os_log_fault_impl(&dword_22615C000, v1, OS_LOG_TYPE_FAULT, "[%{public}@] Unable to replay HAE Batch (%lu samples) with no cache available.", (uint8_t *)&v6, 0x16u);
}

- (void)_updateWithExposure:replaying:error:.cold.2()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_22615C000, v3, v4, "[%{public}@] Error performing rebuild while processing HAE sample batch: %@", v5, v6, v7, v8, v9);
}

- (void)_setNeedsRebuild:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_22615C000, v3, v4, "[%{public}@] Failed to request Previous 7-Day HAEN Fire Date rebuild: %@", v5, v6, v7, v8, v9);
}

- (void)_setNeedsRebuild:.cold.2()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_22615C000, v3, v4, "[%{public}@] Failed to request 7-Day HAE rebuild: %@", v5, v6, v7, v8, v9);
}

@end