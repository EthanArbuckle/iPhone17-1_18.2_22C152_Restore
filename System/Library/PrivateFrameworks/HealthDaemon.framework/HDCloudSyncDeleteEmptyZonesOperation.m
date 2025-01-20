@interface HDCloudSyncDeleteEmptyZonesOperation
+ (BOOL)shouldLogAtOperationStart;
- (HDCloudSyncDeleteEmptyZonesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (void)main;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncDeleteEmptyZonesOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (HDCloudSyncDeleteEmptyZonesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)HDCloudSyncDeleteEmptyZonesOperation;
  v4 = [(HDCloudSyncOperation *)&v9 initWithConfiguration:a3 cloudState:a4];
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v6 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = v5->_taskGroup;
    v5->_taskGroup = v6;

    [(HDSynchronousTaskGroup *)v5->_taskGroup setDelegate:v5];
  }
  return v5;
}

- (void)main
{
  v2 = self;
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];
  v5 = [v4 allCKContainers];

  uint64_t v6 = [v5 count];
  v7 = [(HDCloudSyncOperation *)v2 progress];
  [v7 setTotalUnitCount:v6];

  [(HDSynchronousTaskGroup *)v2->_taskGroup beginTask];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v8 = v5;
  uint64_t v67 = [v8 countByEnumeratingWithState:&v72 objects:v93 count:16];
  if (v67)
  {
    uint64_t v66 = *(void *)v73;
    *(void *)&long long v9 = 138543874;
    long long v57 = v9;
    id v58 = v8;
    v59 = v2;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v73 != v66) {
          objc_enumerationMutation(v8);
        }
        id v11 = *(id *)(*((void *)&v72 + 1) + 8 * v10);
        v12 = [(HDCloudSyncOperation *)v2 configuration];
        v13 = [v12 cachedCloudState];
        v14 = [v11 containerIdentifier];
        id v81 = 0;
        v15 = [v13 zonesForContainerID:v14 error:&v81];
        id v16 = v81;

        if (v15) {
          BOOL v17 = 1;
        }
        else {
          BOOL v17 = v16 == 0;
        }
        if (v17) {
          goto LABEL_13;
        }
        _HKInitializeLogging();
        v18 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v96 = v2;
          __int16 v97 = 2114;
          id v98 = v16;
          _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached zones, %{public}@", buf, 0x16u);
        }
        v19 = [(HDCloudSyncOperation *)v2 configuration];
        v20 = [v19 repository];
        id v21 = [v20 primaryCKContainer];

        if (v21 == v11)
        {
          [(HDCloudSyncOperation *)v2 finishWithSuccess:0 error:v16];
        }
        else
        {
LABEL_13:
          id v68 = v16;
          uint64_t v70 = v10;
          v71 = v11;
          id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v77 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          v69 = v15;
          id v23 = v15;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v77 objects:v94 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v78;
            while (2)
            {
              for (uint64_t i = 0; i != v25; ++i)
              {
                if (*(void *)v78 != v26) {
                  objc_enumerationMutation(v23);
                }
                v28 = *(void **)(*((void *)&v77 + 1) + 8 * i);
                if (objc_msgSend(v28, "zoneType", v57) == 1)
                {
                  id v76 = 0;
                  uint64_t v29 = [v28 containsRecordsWithError:&v76];
                  id v30 = v76;
                  if (v29 == 2)
                  {
                    v31 = [v28 zoneIdentifier];
                    [v22 addObject:v31];
                  }
                  else if (!v29)
                  {
                    _HKInitializeLogging();
                    v52 = (void *)*MEMORY[0x1E4F29FA8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                    {
                      v54 = v52;
                      v55 = [v28 zoneIdentifier];
                      *(_DWORD *)buf = v57;
                      v96 = v2;
                      __int16 v97 = 2114;
                      id v98 = v55;
                      __int16 v99 = 2114;
                      id v100 = v30;
                      _os_log_error_impl(&dword_1BCB7D000, v54, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch status of containsRecords for %{public}@, %{public}@", buf, 0x20u);
                    }
                    goto LABEL_37;
                  }
                }
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v77 objects:v94 count:16];
              if (v25) {
                continue;
              }
              break;
            }
          }

          id v11 = v71;
          if ([v22 count])
          {
            id v23 = [(HDCloudSyncOperation *)v2 configuration];
            id v30 = [v23 repository];
            v65 = [v30 profileIdentifier];
            v32 = HDDatabaseForContainer(v71, v65);
            id v33 = v22;
            id v61 = v71;
            id v63 = v32;
            [(HDSynchronousTaskGroup *)v2->_taskGroup beginTask];
            id v34 = objc_alloc_init(MEMORY[0x1E4F1A060]);
            [v34 setDesiredKeys:MEMORY[0x1E4F1CBF0]];
            [v34 setResultsLimit:1];
            [v34 setPreviousServerChangeToken:0];
            id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            long long v89 = 0u;
            long long v90 = 0u;
            long long v91 = 0u;
            long long v92 = 0u;
            id v36 = v33;
            uint64_t v37 = [v36 countByEnumeratingWithState:&v89 objects:buf count:16];
            if (v37)
            {
              uint64_t v38 = v37;
              uint64_t v39 = *(void *)v90;
              do
              {
                for (uint64_t j = 0; j != v38; ++j)
                {
                  if (*(void *)v90 != v39) {
                    objc_enumerationMutation(v36);
                  }
                  v41 = objc_msgSend(*(id *)(*((void *)&v89 + 1) + 8 * j), "zoneIdentifier", v57);
                  [v35 setObject:v34 forKeyedSubscript:v41];
                }
                uint64_t v38 = [v36 countByEnumeratingWithState:&v89 objects:buf count:16];
              }
              while (v38);
            }

            id v42 = objc_alloc(MEMORY[0x1E4F1A070]);
            v43 = [v35 allKeys];
            v44 = (void *)[v42 initWithRecordZoneIDs:v43 configurationsByRecordZoneID:v35];

            id v45 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            v87[0] = MEMORY[0x1E4F143A8];
            v87[1] = 3221225472;
            v87[2] = __104__HDCloudSyncDeleteEmptyZonesOperation__validateZonesAreEmptyWithDeletionCandidates_container_database___block_invoke;
            v87[3] = &unk_1E6307D70;
            v2 = v59;
            v87[4] = v59;
            id v46 = v45;
            id v88 = v46;
            [v44 setRecordWasChangedBlock:v87];
            [v44 setRecordZoneFetchCompletionBlock:&__block_literal_global_290_2];
            v82[0] = MEMORY[0x1E4F143A8];
            v82[1] = 3221225472;
            v82[2] = __104__HDCloudSyncDeleteEmptyZonesOperation__validateZonesAreEmptyWithDeletionCandidates_container_database___block_invoke_2;
            v82[3] = &unk_1E6307DE0;
            v82[4] = v59;
            id v62 = v61;
            id v83 = v62;
            id v47 = v63;
            id v84 = v47;
            id v85 = v46;
            id v64 = v36;
            id v86 = v64;
            id v60 = v46;
            [v44 setFetchRecordZoneChangesCompletionBlock:v82];
            v48 = [(HDCloudSyncOperation *)v59 configuration];
            v49 = [v48 cachedCloudState];
            objc_msgSend(v49, "setOperationCountForAnalytics:", objc_msgSend(v49, "operationCountForAnalytics") + 1);

            v50 = [(HDCloudSyncOperation *)v59 configuration];
            v51 = [v50 operationGroup];
            [v44 setGroup:v51];

            [v47 addOperation:v44];
            id v8 = v58;
LABEL_37:
            id v11 = v71;
          }
          v15 = v69;
          uint64_t v10 = v70;
          id v16 = v68;
        }

        ++v10;
      }
      while (v10 != v67);
      uint64_t v56 = [v8 countByEnumeratingWithState:&v72 objects:v93 count:16];
      uint64_t v67 = v56;
    }
    while (v56);
  }

  [(HDSynchronousTaskGroup *)v2->_taskGroup finishTask];
}

uint64_t __77__HDCloudSyncDeleteEmptyZonesOperation__deleteEmptyZones_container_database___block_invoke(uint64_t a1, void *a2)
{
  return [a2 zoneIdentifier];
}

void __77__HDCloudSyncDeleteEmptyZonesOperation__deleteEmptyZones_container_database___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  v4 = [*(id *)(a1 + 32) containerIdentifier];
  v5 = [*(id *)(a1 + 40) configuration];
  uint64_t v6 = [v5 repository];
  v7 = [v6 primaryCKContainer];
  id v8 = [v7 containerIdentifier];
  int v9 = [v4 isEqualToString:v8];

  uint64_t v10 = *(void **)(*(void *)(a1 + 40) + 112);
  if (v9) {
    [v10 failTaskWithError:v11];
  }
  else {
    [v10 finishTask];
  }
}

uint64_t __77__HDCloudSyncDeleteEmptyZonesOperation__deleteEmptyZones_container_database___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) finishTask];
}

void __104__HDCloudSyncDeleteEmptyZonesOperation__validateZonesAreEmptyWithDeletionCandidates_container_database___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 104));
    id v8 = *(void **)(a1 + 40);
    int v9 = [v6 recordID];
    uint64_t v10 = [v9 zoneID];
    [v8 addObject:v10];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 104));
  }
  else
  {
    _HKInitializeLogging();
    id v11 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138543618;
      uint64_t v14 = v12;
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching record change %{public}@.", (uint8_t *)&v13, 0x16u);
    }
  }
}

void __104__HDCloudSyncDeleteEmptyZonesOperation__validateZonesAreEmptyWithDeletionCandidates_container_database___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) updateCompletedProgressCount:1];
  if (v3)
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(a1 + 40);
      id v7 = v4;
      id v8 = [v6 containerIdentifier];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2114;
      id v63 = v3;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetch record zone changes failed for container %{public}@: %{public}@", buf, 0x20u);
    }
    int v9 = [*(id *)(a1 + 40) containerIdentifier];
    uint64_t v10 = [*(id *)(a1 + 32) configuration];
    id v11 = [v10 repository];
    uint64_t v12 = [v11 primaryCKContainer];
    int v13 = [v12 containerIdentifier];
    int v14 = [v9 isEqualToString:v13];

    if (v14)
    {
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __104__HDCloudSyncDeleteEmptyZonesOperation__validateZonesAreEmptyWithDeletionCandidates_container_database___block_invoke_291;
      v56[3] = &unk_1E6307DB8;
      id v57 = *(id *)(a1 + 40);
      id v15 = *(id *)(a1 + 48);
      uint64_t v16 = *(void *)(a1 + 32);
      id v58 = v15;
      uint64_t v59 = v16;
      objc_msgSend(v3, "hd_enumerateCloudKitPartialErrorsByKeyWithHandler:", v56);
      [*(id *)(*(void *)(a1 + 32) + 112) failTaskWithError:v3];

      uint64_t v17 = v57;
LABEL_23:

      goto LABEL_24;
    }
    [*(id *)(*(void *)(a1 + 32) + 112) finishTask];
  }
  else
  {
    if (![*(id *)(a1 + 56) count])
    {
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __104__HDCloudSyncDeleteEmptyZonesOperation__validateZonesAreEmptyWithDeletionCandidates_container_database___block_invoke_299;
      v50[3] = &unk_1E62F5FD8;
      id v33 = *(void **)(a1 + 64);
      id v51 = *(id *)(a1 + 56);
      id v34 = objc_msgSend(v33, "hk_filter:", v50);
      _HKInitializeLogging();
      id v35 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v36 = *(void *)(a1 + 32);
        uint64_t v37 = v35;
        uint64_t v38 = [v34 count];
        uint64_t v39 = [*(id *)(a1 + 40) containerIdentifier];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v38;
        *(_WORD *)&buf[22] = 2114;
        id v63 = v39;
        _os_log_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: Confirmed %ld empty zones in container %{public}@", buf, 0x20u);
      }
      v40 = *(id **)(a1 + 32);
      id v41 = *(id *)(a1 + 40);
      if (v40)
      {
        id v42 = objc_msgSend(v34, "hk_map:", &__block_literal_global_188);
        [v40[14] beginTask];
        v43 = [HDCloudSyncModifyRecordZonesOperation alloc];
        v44 = [v40 configuration];
        id v45 = [(HDCloudSyncModifyRecordZonesOperation *)v43 initWithConfiguration:v44 container:v41 recordZonesToSave:0 recordZoneIDsToDelete:v42];

        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __77__HDCloudSyncDeleteEmptyZonesOperation__deleteEmptyZones_container_database___block_invoke_2;
        id v63 = &unk_1E62F6020;
        id v64 = v41;
        v65 = v40;
        [(HDCloudSyncOperation *)v45 setOnError:buf];
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __77__HDCloudSyncDeleteEmptyZonesOperation__deleteEmptyZones_container_database___block_invoke_3;
        v60[3] = &unk_1E62F2928;
        v60[4] = v40;
        [(HDCloudSyncOperation *)v45 setOnSuccess:v60];
        [(HDCloudSyncOperation *)v45 start];
      }
      [*(id *)(*(void *)(a1 + 32) + 112) finishTask];

      uint64_t v17 = v51;
      goto LABEL_23;
    }
    _HKInitializeLogging();
    v18 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
    {
      uint64_t v46 = *(void *)(a1 + 32);
      uint64_t v47 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v46;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v47;
      _os_log_fault_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_FAULT, "%{public}@ Something went wrong. Cache incorrectly claims to have empty zones %{public}@", buf, 0x16u);
    }
    v49 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 725, @"Cache incorrectly claims to have empty zones %@", *(void *)(a1 + 56));
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    obuint64_t j = *(id *)(a1 + 56);
    uint64_t v19 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v53 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void *)(*((void *)&v52 + 1) + 8 * i);
          uint64_t v24 = [HDCloudSyncZoneIdentifier alloc];
          uint64_t v25 = [*(id *)(a1 + 40) containerIdentifier];
          id v26 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v24, "initForZone:container:scope:", v23, v25, [*(id *)(a1 + 48) databaseScope]);

          v27 = [HDCloudSyncCachedZone alloc];
          v28 = [*(id *)(a1 + 32) configuration];
          uint64_t v29 = [v28 repository];
          id v30 = [*(id *)(a1 + 32) configuration];
          v31 = [v30 accessibilityAssertion];
          id v32 = [(HDCloudSyncCachedZone *)v27 initForZoneIdentifier:v26 repository:v29 accessibilityAssertion:v31];

          [v32 handleCloudError:v49 operation:*(void *)(a1 + 32) container:*(void *)(a1 + 40) database:*(void *)(a1 + 48)];
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
      }
      while (v20);
    }

    [*(id *)(*(void *)(a1 + 32) + 112) failTaskWithError:v49];
    id v3 = 0;
  }
LABEL_24:
}

void __104__HDCloudSyncDeleteEmptyZonesOperation__validateZonesAreEmptyWithDeletionCandidates_container_database___block_invoke_291(id *a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  id v6 = [HDCloudSyncZoneIdentifier alloc];
  id v7 = [a1[4] containerIdentifier];
  id v8 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v6, "initForZone:container:scope:", v15, v7, [a1[5] databaseScope]);

  int v9 = [HDCloudSyncCachedZone alloc];
  uint64_t v10 = [a1[6] configuration];
  id v11 = [v10 repository];
  uint64_t v12 = [a1[6] configuration];
  int v13 = [v12 accessibilityAssertion];
  id v14 = [(HDCloudSyncCachedZone *)v9 initForZoneIdentifier:v8 repository:v11 accessibilityAssertion:v13];

  [v14 handleCloudError:v5 operation:a1[6] container:a1[4] database:a1[5]];
}

uint64_t __104__HDCloudSyncDeleteEmptyZonesOperation__validateZonesAreEmptyWithDeletionCandidates_container_database___block_invoke_299(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 zoneIdentifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  BOOL v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(HDCloudSyncOperation *)self finishWithSuccess:v5 error:v7];
}

- (void).cxx_destruct
{
}

@end