@interface HDCloudSyncStatusProvider
- (BOOL)_shouldPerformLastSyncDateCheckInternalSetting;
- (HDCloudSyncStatus)syncStatus;
- (HDCloudSyncStatusProvider)initWithCoordinator:(id)a3 behavior:(id)a4;
- (id)_lastLongTimeWithoutSuccessfulCloudSyncReportDateKeyWithError:(id *)a3;
- (id)currentSyncProgress;
- (id)lastSuccessfulLitePushDate;
- (id)lastSuccessfulPullDate;
- (id)lastSuccessfulPushDate;
- (void)checkLastSyncDate;
- (void)fetchSyncStatusWithCompletion:(id)a3;
- (void)setDataUploadRequestStatus:(int64_t)a3 profileType:(int64_t)a4;
- (void)unitTest_setLastSuccessfulLitePushDate:(id)a3;
- (void)unitTest_setLastSuccessfulPullDate:(id)a3;
- (void)unitTest_setLastSuccessfulPushDate:(id)a3;
- (void)updateCachedLastSyncDatesWithCompletion:(id)a3;
@end

@implementation HDCloudSyncStatusProvider

- (HDCloudSyncStatusProvider)initWithCoordinator:(id)a3 behavior:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDCloudSyncStatusProvider;
  v8 = [(HDCloudSyncStatusProvider *)&v14 init];
  if (v8)
  {
    uint64_t v9 = HKCreateSerialUtilityDispatchQueue();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v8->_coordinator, v6);
    objc_storeStrong((id *)&v8->_behavior, a4);
    v11 = objc_alloc_init(HDCloudSyncStatus);
    lock_cloudSyncStatus = v8->_lock_cloudSyncStatus;
    v8->_lock_cloudSyncStatus = v11;

    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (void)fetchSyncStatusWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HDCloudSyncStatusProvider_fetchSyncStatusWithCompletion___block_invoke;
  v7[3] = &unk_1E62F4928;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __59__HDCloudSyncStatusProvider_fetchSyncStatusWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v26 = 0;
  char v3 = [WeakRetained canPerformCloudSyncWithError:&v26];
  id v4 = v26;

  if (v3)
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__117;
    v24[4] = __Block_byref_object_dispose__117;
    id v25 = 0;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__117;
    v22[4] = __Block_byref_object_dispose__117;
    id v23 = 0;
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = __Block_byref_object_copy__117;
    v20[4] = __Block_byref_object_dispose__117;
    id v21 = 0;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    char v19 = 0;
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    char v6 = [v5 hasActiveSyncTask];

    char v19 = v6;
    id v7 = objc_alloc(MEMORY[0x1E4F65CD8]);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__HDCloudSyncStatusProvider_fetchSyncStatusWithCompletion___block_invoke_284;
    v11[3] = &unk_1E6303788;
    v13 = v22;
    objc_super v14 = v24;
    v15 = v20;
    id v8 = *(id *)(a1 + 40);
    char v17 = v3;
    id v12 = v8;
    v16 = v18;
    uint64_t v9 = (void *)[v7 initWithDescription:@"Fetch cloud sync status" completion:v11];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__HDCloudSyncStatusProvider_fetchSyncStatusWithCompletion___block_invoke_2;
    v10[3] = &unk_1E63037D8;
    v10[4] = *(void *)(a1 + 32);
    v10[5] = v24;
    v10[6] = v22;
    v10[7] = v20;
    [v9 addTask:v10];
    [v9 begin];

    _Block_object_dispose(v18, 8);
    _Block_object_dispose(v20, 8);

    _Block_object_dispose(v22, 8);
    _Block_object_dispose(v24, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __59__HDCloudSyncStatusProvider_fetchSyncStatusWithCompletion___block_invoke_284(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  char v6 = objc_alloc_init(HDCloudSyncStatus);
  [(HDCloudSyncStatus *)v6 setLastSuccessfulPullDate:*(void *)(*(void *)(a1[5] + 8) + 40)];
  [(HDCloudSyncStatus *)v6 setLastSuccessfulPushDate:*(void *)(*(void *)(a1[6] + 8) + 40)];
  [(HDCloudSyncStatus *)v6 setLastSuccessfulLitePushDate:*(void *)(*(void *)(a1[7] + 8) + 40)];
  (*(void (**)(void))(a1[4] + 16))();
}

void __59__HDCloudSyncStatusProvider_fetchSyncStatusWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v17 = a3;
  _HKInitializeLogging();
  char v6 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v7;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetching cloud sync status for all profiles.", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v9 = [WeakRetained daemon];
  v10 = [v9 profileManager];

  v11 = [v10 allProfileIdentifiers];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * v15);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __59__HDCloudSyncStatusProvider_fetchSyncStatusWithCompletion___block_invoke_286;
        void v18[3] = &unk_1E63037B0;
        v18[4] = *(void *)(a1 + 32);
        v18[5] = v16;
        long long v19 = *(_OWORD *)(a1 + 40);
        uint64_t v20 = *(void *)(a1 + 56);
        objc_msgSend(v5, "addTask:", v18, v17);
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }
  (*((void (**)(id, void, void))v17 + 2))(v17, 0, 0);
}

void __59__HDCloudSyncStatusProvider_fetchSyncStatusWithCompletion___block_invoke_286(void *a1, uint64_t a2, void *a3)
{
  id v24 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  id v5 = [WeakRetained daemon];
  char v6 = [v5 profileManager];
  uint64_t v7 = [v6 profileForIdentifier:a1[5]];

  if (!v7
    || (id v8 = objc_loadWeakRetained((id *)(a1[4] + 8)),
        char v9 = [v8 shouldSyncProfile:v7],
        v8,
        (v9 & 1) == 0))
  {
    (*((void (**)(id, void, void))v24 + 2))(v24, 0, 0);
    goto LABEL_20;
  }
  v10 = [v7 cloudSyncManager];
  v11 = v10;
  if (!v10)
  {
    (*((void (**)(id, void, void))v24 + 2))(v24, 0, 0);
    goto LABEL_19;
  }
  uint64_t v12 = [v10 status];
  uint64_t v13 = [v12 lastSuccessfulPushDate];

  uint64_t v14 = *(void *)(a1[6] + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  if (v15)
  {
    if (!objc_msgSend(v15, "hk_isAfterDate:", v13)) {
      goto LABEL_8;
    }
    uint64_t v14 = *(void *)(a1[6] + 8);
  }
  objc_storeStrong((id *)(v14 + 40), v13);
LABEL_8:
  uint64_t v16 = [v11 status];
  id v17 = [v16 lastSuccessfulPullDate];

  uint64_t v18 = *(void *)(a1[7] + 8);
  long long v19 = *(void **)(v18 + 40);
  if (v19)
  {
    if (!objc_msgSend(v19, "hk_isAfterDate:", v17)) {
      goto LABEL_12;
    }
    uint64_t v18 = *(void *)(a1[7] + 8);
  }
  objc_storeStrong((id *)(v18 + 40), v17);
LABEL_12:
  uint64_t v20 = [v11 status];
  long long v21 = [v20 lastSuccessfulLitePushDate];

  uint64_t v22 = *(void *)(a1[8] + 8);
  long long v23 = *(void **)(v22 + 40);
  if (!v23)
  {
LABEL_15:
    objc_storeStrong((id *)(v22 + 40), v21);
    goto LABEL_16;
  }
  if (objc_msgSend(v23, "hk_isAfterDate:", v21))
  {
    uint64_t v22 = *(void *)(a1[8] + 8);
    goto LABEL_15;
  }
LABEL_16:
  (*((void (**)(id, void, void))v24 + 2))(v24, 0, 0);

LABEL_19:
LABEL_20:
}

- (id)currentSyncProgress
{
  p_coordinator = &self->_coordinator;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  int v4 = [WeakRetained hasActiveSyncTask];

  id v5 = (void *)MEMORY[0x1E4F28F90];
  if (v4)
  {
    id v6 = objc_loadWeakRetained((id *)p_coordinator);
    uint64_t v7 = [v6 progressOfActiveSyncTask];
    id v8 = objc_msgSend(v5, "hd_progressMirroringProgress:", v7);
  }
  else
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F28F90], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
  }

  return v8;
}

- (void)checkLastSyncDate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__HDCloudSyncStatusProvider_checkLastSyncDate__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__HDCloudSyncStatusProvider_checkLastSyncDate__block_invoke(uint64_t a1)
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) syncStatus];
  if (+[HDCloudSyncTapToRadar isTapToRadarAllowed])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    id v120 = 0;
    char v4 = [WeakRetained canPerformCloudSyncWithError:&v120];
    id v5 = v120;
    if (v4)
    {
      char v6 = [*(id *)(a1 + 32) _shouldPerformLastSyncDateCheckInternalSetting];

      if (v6)
      {
        uint64_t v7 = *(void **)(a1 + 32);
        id v119 = 0;
        id v8 = [v7 _lastLongTimeWithoutSuccessfulCloudSyncReportDateKeyWithError:&v119];
        id v9 = v119;
        if (!v8)
        {
          _HKInitializeLogging();
          uint64_t v22 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            uint64_t v23 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            uint64_t v122 = v23;
            __int16 v123 = 2114;
            double v124 = *(double *)&v9;
            _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Unable to get create lastLongTimeWithoutSuccessfulCloudSyncReportDateKey: %{public}@", buf, 0x16u);
          }
          goto LABEL_65;
        }
        v10 = [MEMORY[0x1E4F1C9C8] date];
        v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        uint64_t v12 = [v11 objectForKey:v8];

        if (!v12)
        {
          id v24 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          objc_msgSend(v24, "hk_removeObjectsForKeysWithPrefix:", @"HDLastLongTimeWithoutSuccessfulCloudSyncReportDate");

          _HKInitializeLogging();
          id v25 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v26 = *(void *)(a1 + 32);
            uint64_t v27 = v25;
            HKDiagnosticStringFromDate();
            uint64_t v28 = v10;
            v30 = v29 = v8;
            *(_DWORD *)buf = 138543618;
            uint64_t v122 = v26;
            uint64_t v12 = 0;
            __int16 v123 = 2114;
            double v124 = *(double *)&v30;
            _os_log_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: lastCloudSyncReportDate has never been set, set to %{public}@", buf, 0x16u);

            id v8 = v29;
            v10 = v28;
          }
          v31 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          [v31 setObject:v10 forKey:v8];

          goto LABEL_64;
        }
        [v10 timeIntervalSinceDate:v12];
        if (v13 < 2419200.0)
        {
          double v14 = v13;
          _HKInitializeLogging();
          uint64_t v15 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543874;
            uint64_t v122 = v16;
            __int16 v123 = 2048;
            double v124 = v14;
            __int16 v125 = 2048;
            uint64_t v126 = 0x4142750000000000;
            id v17 = "%{public}@: skip last sync date check, timeSinceLastCloudSyncReportDate (%f) < (%f)";
            uint64_t v18 = v15;
            uint32_t v19 = 32;
LABEL_27:
            _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
            goto LABEL_64;
          }
          goto LABEL_64;
        }
        v110 = v12;
        os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
        uint64_t v32 = *(void *)(a1 + 32);
        int v33 = *(unsigned __int8 *)(v32 + 44);
        os_unfair_lock_unlock((os_unfair_lock_t)(v32 + 40));
        if (!v33)
        {
          _HKInitializeLogging();
          v43 = *MEMORY[0x1E4F29FA8];
          uint64_t v12 = v110;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v44 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543362;
            uint64_t v122 = v44;
            id v17 = "%{public}@: skip last sync date check, cached sync dates haven't been updated yet";
            uint64_t v18 = v43;
            uint32_t v19 = 12;
            goto LABEL_27;
          }
LABEL_64:

LABEL_65:
          goto LABEL_14;
        }
        v109 = v10;
        v107 = v8;
        id v34 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
        v35 = [v34 daemon];
        v36 = [v35 primaryProfile];
        id v118 = 0;
        v37 = +[HDKeyValueEntity retrieveDatabaseIdentifierCreationDateFromProfile:v36 error:&v118];
        id v108 = v118;

        if (!v37)
        {
          _HKInitializeLogging();
          v45 = *MEMORY[0x1E4F29FA8];
          id v8 = v107;
          v10 = v109;
          uint64_t v12 = v110;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            uint64_t v46 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            uint64_t v122 = v46;
            __int16 v123 = 2114;
            double v124 = *(double *)&v108;
            _os_log_error_impl(&dword_1BCB7D000, v45, OS_LOG_TYPE_ERROR, "%{public}@: unable to determine age of database, necessary for last sync date check %{public}@", buf, 0x16u);
          }
          goto LABEL_63;
        }
        v10 = v109;
        [v109 timeIntervalSinceDate:v37];
        uint64_t v12 = v110;
        if (v38 < 2419200.0)
        {
          double v39 = v38;
          _HKInitializeLogging();
          v40 = *MEMORY[0x1E4F29FA8];
          id v8 = v107;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v41 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543874;
            uint64_t v122 = v41;
            __int16 v123 = 2048;
            double v124 = v39;
            __int16 v125 = 2048;
            uint64_t v126 = 0x4142750000000000;
            v42 = "%{public}@: skip last sync date check, timeSinceDatabaseCreation (%f) < (%f)";
LABEL_33:
            _os_log_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_DEFAULT, v42, buf, 0x20u);
            goto LABEL_63;
          }
          goto LABEL_63;
        }
        id v47 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
        v48 = [v47 periodicActivityScheduler];
        uint64_t v49 = [v48 periodicActivityErrorCount];

        if (v49 <= 27)
        {
          uint64_t v50 = v49;
          _HKInitializeLogging();
          v40 = *MEMORY[0x1E4F29FA8];
          id v8 = v107;
          v10 = v109;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v51 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543874;
            uint64_t v122 = v51;
            __int16 v123 = 2048;
            double v124 = *(double *)&v50;
            __int16 v125 = 2048;
            uint64_t v126 = 28;
            v42 = "%{public}@: skip last sync date check, periodicSyncErrorCount (%ld) < (%ld)";
            goto LABEL_33;
          }
LABEL_63:

          goto LABEL_64;
        }
        v104 = v37;
        id v52 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
        v53 = [v52 daemon];
        v54 = [v53 primaryProfile];
        id v117 = 0;
        v106 = +[HDCloudSyncStoreEntity persistedMostRecentLastSyncDateForProfile:v54 error:&v117];
        id v55 = v117;

        if (v55)
        {
          _HKInitializeLogging();
          v56 = *MEMORY[0x1E4F29FA8];
          v105 = v55;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v57 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            uint64_t v122 = v57;
            __int16 v123 = 2114;
            double v124 = *(double *)&v55;
            _os_log_impl(&dword_1BCB7D000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@: Could not get most recent successful push %{public}@", buf, 0x16u);
          }
          id v8 = v107;
          v10 = v109;
          uint64_t v12 = v110;
          v37 = v104;
          goto LABEL_62;
        }
        id v58 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
        v59 = [v58 daemon];
        v60 = [v59 primaryProfile];
        id v116 = 0;
        v103 = HDMostRecentSuccessfulPullDateForProfile(v60, &v116);
        id v61 = v116;

        v105 = v61;
        if (v61)
        {
          _HKInitializeLogging();
          v62 = *MEMORY[0x1E4F29FA8];
          id v8 = v107;
          v10 = v109;
          uint64_t v12 = v110;
          v37 = v104;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v63 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            uint64_t v122 = v63;
            __int16 v123 = 2114;
            double v124 = *(double *)&v105;
            v64 = "%{public}@: Could not get most recent successful pull %{public}@";
            v65 = v62;
            uint32_t v66 = 22;
LABEL_51:
            _os_log_impl(&dword_1BCB7D000, v65, OS_LOG_TYPE_DEFAULT, v64, buf, v66);
          }
        }
        else
        {
          id v8 = v107;
          v37 = v104;
          if (v106)
          {
            objc_msgSend(v109, "timeIntervalSinceDate:");
            double v68 = v67;
          }
          else
          {
            v69 = [MEMORY[0x1E4F1C9C8] distantPast];
            [v109 timeIntervalSinceDate:v69];
            double v68 = v70;
          }
          if (v103)
          {
            v10 = v109;
            objc_msgSend(v109, "timeIntervalSinceDate:");
            double v72 = v71;
          }
          else
          {
            v73 = [MEMORY[0x1E4F1C9C8] distantPast];
            [v109 timeIntervalSinceDate:v73];
            double v72 = v74;

            v10 = v109;
          }
          uint64_t v12 = v110;
          if (v68 >= 2419200.0 || v72 >= 2419200.0)
          {
            os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
            id v102 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            if (v68 >= 2419200.0)
            {
              v77 = NSString;
              v78 = [v2 lastSuccessfulPushDate];
              v79 = HKDiagnosticStringFromDate();
              v80 = [v77 stringWithFormat:@"push: %@", v79];
              [v102 addObject:v80];

              v81 = [v2 lastSuccessfulPushDate];

              if (v81)
              {
                v82 = objc_msgSend(NSString, "stringWithFormat:", @"%0.1f seconds ago", *(void *)&v68);
                [v102 addObject:v82];
              }
            }
            if (v72 >= 2419200.0)
            {
              v83 = NSString;
              v84 = [v2 lastSuccessfulPullDate];
              v85 = HKDiagnosticStringFromDate();
              v86 = [v83 stringWithFormat:@"pull: %@", v85];
              [v102 addObject:v86];

              v87 = [v2 lastSuccessfulPullDate];

              if (v87)
              {
                v88 = objc_msgSend(NSString, "stringWithFormat:", @"%0.1f seconds ago", *(void *)&v72);
                [v102 addObject:v88];
              }
            }
            os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
            v89 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
            v90 = [v89 stringArrayForKey:@"HDLongTimeWithoutSuccessfulCloudSyncPeriodicSyncErrorStrings"];

            id v91 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
            v92 = [v91 accountProvider];
            v93 = [v92 getPersistedAccountInfo];

            v94 = NSString;
            v95 = [v102 componentsJoinedByString:@", "];
            v101 = v90;
            v96 = [v90 componentsJoinedByString:@"\n"];
            v97 = [v94 stringWithFormat:@"Date of last successful Health data sync (%@) was too long ago and periodic sync has failed (%ld) times, pop the alert!\nPlease file a bug against \"Health (New Bugs) | All\"\nAccount Info: (%@)\nRecent Periodic Sync Errors: %@", v95, v49, v93, v96];

            _HKInitializeLogging();
            v98 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              uint64_t v100 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 138543618;
              uint64_t v122 = v100;
              __int16 v123 = 2114;
              double v124 = *(double *)&v97;
              _os_log_error_impl(&dword_1BCB7D000, v98, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);
            }
            v114[0] = MEMORY[0x1E4F143A8];
            v114[1] = 3221225472;
            v114[2] = __46__HDCloudSyncStatusProvider_checkLastSyncDate__block_invoke_321;
            v114[3] = &unk_1E62F3208;
            id v115 = v97;
            v111[0] = MEMORY[0x1E4F143A8];
            v111[1] = 3221225472;
            v111[2] = __46__HDCloudSyncStatusProvider_checkLastSyncDate__block_invoke_3;
            v111[3] = &unk_1E62F91D0;
            id v112 = v109;
            id v8 = v107;
            id v113 = v107;
            id v99 = v97;
            v10 = v109;
            +[HDCloudSyncTapToRadar showTapToRadarRequestWithTitle:@"Health Not Cloud Syncing" message:@"It has been a long time since your Health data has fully synced to iCloud. Please file a radar with Tap-to-Radar against 'Health'" proceed:v114 disable:&__block_literal_global_137 completion:v111];

            uint64_t v12 = v110;
            v37 = v104;
            goto LABEL_61;
          }
          _HKInitializeLogging();
          v75 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v76 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138544130;
            uint64_t v122 = v76;
            __int16 v123 = 2048;
            double v124 = v68;
            __int16 v125 = 2048;
            uint64_t v126 = *(void *)&v72;
            __int16 v127 = 2048;
            uint64_t v128 = 0x4142750000000000;
            v64 = "%{public}@: skip last sync date check, time since last successful sync push (%f) and pull (%f) are less than (%f)";
            v65 = v75;
            uint32_t v66 = 42;
            goto LABEL_51;
          }
        }
LABEL_61:

LABEL_62:
        goto LABEL_63;
      }
    }
    else
    {
    }
  }
  else
  {
    id v5 = 0;
  }
  _HKInitializeLogging();
  uint64_t v20 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v122 = v21;
    _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: check for last sync date is disabled", buf, 0xCu);
  }
  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_msgSend(v9, "hk_removeObjectsForKeysWithPrefix:", @"HDLastLongTimeWithoutSuccessfulCloudSyncReportDate");
LABEL_14:
}

uint64_t __46__HDCloudSyncStatusProvider_checkLastSyncDate__block_invoke_321(uint64_t a1)
{
  return +[HDCloudSyncTapToRadar openTapToRadarWithTitle:@"[Cloud Sync] Long Time Without Successful Health Sync" description:*(void *)(a1 + 32)];
}

void __46__HDCloudSyncStatusProvider_checkLastSyncDate__block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v0 setObject:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F2BEB0]];
}

void __46__HDCloudSyncStatusProvider_checkLastSyncDate__block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v4 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
  }
}

- (id)lastSuccessfulPullDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(HDCloudSyncStatus *)self->_lock_cloudSyncStatus lastSuccessfulPullDate];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)lastSuccessfulPushDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(HDCloudSyncStatus *)self->_lock_cloudSyncStatus lastSuccessfulPushDate];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)lastSuccessfulLitePushDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(HDCloudSyncStatus *)self->_lock_cloudSyncStatus lastSuccessfulLitePushDate];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setDataUploadRequestStatus:(int64_t)a3 profileType:(int64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_coordinator = &self->_coordinator;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  uint64_t v7 = [WeakRetained daemon];
  id v8 = [v7 profileManager];
  id v9 = [v8 allProfileIdentifiers];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v15 type] == a4)
        {
          id v16 = objc_loadWeakRetained((id *)p_coordinator);
          id v17 = [v16 daemon];
          uint64_t v18 = [v17 profileManager];
          uint32_t v19 = [v18 profileForIdentifier:v15];

          uint64_t v20 = [v19 cloudSyncManager];
          [v20 updateDataUploadRequestStatus:a3];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }
}

- (id)_lastLongTimeWithoutSuccessfulCloudSyncReportDateKeyWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  id v5 = [WeakRetained daemon];
  char v6 = [v5 primaryProfile];
  id v15 = 0;
  uint64_t v7 = +[HDKeyValueEntity retrieveDatabaseIdentifierFromProfile:v6 error:&v15];
  id v8 = v15;

  id v9 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", v7);
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = NSString;
    id v12 = [v9 UUIDString];
    uint64_t v13 = [v11 stringWithFormat:@"%@-%@", @"HDLastLongTimeWithoutSuccessfulCloudSyncReportDate", v12];
LABEL_10:

    goto LABEL_11;
  }
  if (v8)
  {
    id v12 = v8;
LABEL_6:
    if (a3)
    {
      id v12 = v12;
      uint64_t v13 = 0;
      *a3 = v12;
    }
    else
    {
      _HKLogDroppedError();
      uint64_t v13 = 0;
    }
    id v8 = v12;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 124, @"Unable to get the database UUID");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12) {
    goto LABEL_6;
  }
  id v8 = 0;
  uint64_t v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)_shouldPerformLastSyncDateCheckInternalSetting
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 objectForKey:*MEMORY[0x1E4F2BEB0]];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)updateCachedLastSyncDatesWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__HDCloudSyncStatusProvider_updateCachedLastSyncDatesWithCompletion___block_invoke;
  v6[3] = &unk_1E6303800;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HDCloudSyncStatusProvider *)self fetchSyncStatusWithCompletion:v6];
}

void __69__HDCloudSyncStatusProvider_updateCachedLastSyncDatesWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v13 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  if (!a5) {
    *(unsigned char *)(*(void *)(a1 + 32) + 44) = 1;
  }
  id v7 = [v13 lastSuccessfulPullDate];

  if (v7)
  {
    id v8 = [v13 lastSuccessfulPullDate];
    [*(id *)(*(void *)(a1 + 32) + 32) setLastSuccessfulPullDate:v8];
  }
  id v9 = [v13 lastSuccessfulPushDate];

  if (v9)
  {
    id v10 = [v13 lastSuccessfulPushDate];
    [*(id *)(*(void *)(a1 + 32) + 32) setLastSuccessfulPushDate:v10];
  }
  uint64_t v11 = [v13 lastSuccessfulLitePushDate];

  if (v11)
  {
    id v12 = [v13 lastSuccessfulLitePushDate];
    [*(id *)(*(void *)(a1 + 32) + 32) setLastSuccessfulLitePushDate:v12];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (HDCloudSyncStatus)syncStatus
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = objc_alloc_init(HDCloudSyncStatus);
  id v5 = [(HDCloudSyncStatus *)self->_lock_cloudSyncStatus lastSuccessfulPullDate];
  char v6 = (void *)[v5 copy];
  [(HDCloudSyncStatus *)v4 setLastSuccessfulPullDate:v6];

  id v7 = [(HDCloudSyncStatus *)self->_lock_cloudSyncStatus lastSuccessfulPushDate];
  id v8 = (void *)[v7 copy];
  [(HDCloudSyncStatus *)v4 setLastSuccessfulPushDate:v8];

  id v9 = [(HDCloudSyncStatus *)self->_lock_cloudSyncStatus lastSuccessfulLitePushDate];
  id v10 = (void *)[v9 copy];
  [(HDCloudSyncStatus *)v4 setLastSuccessfulLitePushDate:v10];

  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)unitTest_setLastSuccessfulPullDate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(HDCloudSyncStatus *)self->_lock_cloudSyncStatus setLastSuccessfulPullDate:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)unitTest_setLastSuccessfulPushDate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(HDCloudSyncStatus *)self->_lock_cloudSyncStatus setLastSuccessfulPushDate:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)unitTest_setLastSuccessfulLitePushDate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(HDCloudSyncStatus *)self->_lock_cloudSyncStatus setLastSuccessfulLitePushDate:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_cloudSyncStatus, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_behavior, 0);

  objc_destroyWeak((id *)&self->_coordinator);
}

@end