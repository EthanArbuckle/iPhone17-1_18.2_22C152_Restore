@interface HDCloudSyncUpdateCachedRecordsOperation
- (HDCloudSyncUpdateCachedRecordsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDSynchronousTaskGroup)taskGroup;
- (NSArray)invalidRecordIDs;
- (NSArray)zoneIdentifiersWithIdentityLost;
- (uint64_t)_updateCKCachedZoneForZone:(void *)a3 recordsToAdd:(void *)a4 recordIDsToDelete:(void *)a5 serverChangeToken:(unsigned int)a6 fetchComplete:(void *)a7 container:(void *)a8 database:(void *)a9 error:;
- (void)_fetchChangesForRecordZoneIDs:(void *)a3 container:(void *)a4 database:;
- (void)_limitExceededFetchingChangesForRecordZoneIDs:(void *)a3 container:(void *)a4 database:(void *)a5 error:;
- (void)fetchRecordZoneChangesForContainer:(id)a3 database:(id)a4;
- (void)main;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncUpdateCachedRecordsOperation

- (HDCloudSyncUpdateCachedRecordsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HDCloudSyncUpdateCachedRecordsOperation;
  v4 = [(HDCloudSyncOperation *)&v10 initWithConfiguration:a3 cloudState:0];
  if (v4)
  {
    v5 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = v4->_taskGroup;
    v4->_taskGroup = v5;

    [(HDSynchronousTaskGroup *)v4->_taskGroup setDelegate:v4];
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    invalidRecordIDs = v4->_invalidRecordIDs;
    v4->_invalidRecordIDs = v7;

    v4->_lock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void)main
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];
  v5 = [v4 allCKContainers];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        objc_super v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v11 = [v10 privateCloudDatabase];
        [(HDCloudSyncUpdateCachedRecordsOperation *)self fetchRecordZoneChangesForContainer:v10 database:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(HDSynchronousTaskGroup *)self->_taskGroup finishTask];
}

- (NSArray)invalidRecordIDs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(NSMutableSet *)self->_invalidRecordIDs allObjects];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (void)fetchRecordZoneChangesForContainer:(id)a3 database:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HDCloudSyncOperation *)self configuration];
  v9 = [v8 cachedCloudState];
  objc_super v10 = [v6 containerIdentifier];
  id v26 = 0;
  v11 = objc_msgSend(v9, "zoneIdentifiersRequiringFetchForContainerIdentifier:databaseScope:error:", v10, objc_msgSend(v7, "databaseScope"), &v26);
  id v12 = v26;

  if (v11 || !v12)
  {
    long long v13 = [(HDCloudSyncOperation *)self configuration];
    long long v14 = [v13 repository];
    long long v15 = [v14 syncAvailability];

    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __87__HDCloudSyncUpdateCachedRecordsOperation_fetchRecordZoneChangesForContainer_database___block_invoke;
    v24 = &unk_1E62F5FD8;
    id v25 = v15;
    id v16 = v15;
    uint64_t v17 = objc_msgSend(v11, "hk_filter:", &v21);
    v18 = objc_msgSend(v17, "mutableCopy", v21, v22, v23, v24);

    v19 = objc_msgSend(v18, "hk_map:", &__block_literal_global_31);
    v20 = v19;
    if (v19 && [v19 count]) {
      -[HDCloudSyncUpdateCachedRecordsOperation _fetchChangesForRecordZoneIDs:container:database:]((id *)&self->super.super.isa, v20, v6, v7);
    }
  }
  else
  {
    [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v12];
  }
}

uint64_t __87__HDCloudSyncUpdateCachedRecordsOperation_fetchRecordZoneChangesForContainer_database___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) shouldSyncSummarySharingPull] & 1) != 0
    || ([*(id *)(a1 + 32) shouldSyncSummarySharingPush] & 1) != 0)
  {
    uint64_t v4 = 1;
  }
  else
  {
    v5 = [v3 zoneIdentifier];
    uint64_t v9 = 0;
    id v10 = 0;
    int v6 = objc_msgSend(v5, "hd_isSharedSummaryZoneIDForUserIdentifier:syncCircleIdentifier:", &v10, &v9);
    id v7 = v10;

    uint64_t v4 = v6 ^ 1u;
  }

  return v4;
}

uint64_t __87__HDCloudSyncUpdateCachedRecordsOperation_fetchRecordZoneChangesForContainer_database___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 zoneIdentifier];
}

- (void)_fetchChangesForRecordZoneIDs:(void *)a3 container:(void *)a4 database:
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    [a1[13] beginTask];
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x2810000000;
    v68[3] = &unk_1BD44B655;
    int v69 = 0;
    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x3032000000;
    v66[3] = __Block_byref_object_copy__26;
    v66[4] = __Block_byref_object_dispose__26;
    id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v64[0] = 0;
    v64[1] = v64;
    v64[2] = 0x3032000000;
    v64[3] = __Block_byref_object_copy__26;
    v64[4] = __Block_byref_object_dispose__26;
    id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x3032000000;
    v62[3] = __Block_byref_object_copy__26;
    v62[4] = __Block_byref_object_dispose__26;
    id v63 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    if (v7 && [v7 count])
    {
      if ((unint64_t)[v7 count] < 0x190)
      {
        long long v13 = [v8 containerIdentifier];
        uint64_t v14 = [v9 databaseScope];
        id v15 = v13;
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __108__HDCloudSyncUpdateCachedRecordsOperation__configurationsByRecordZoneIDs_containerIdentifier_databaseScope___block_invoke;
        v73 = &unk_1E62F65D8;
        id v16 = v15;
        *((void *)&v74 + 1) = a1;
        uint64_t v75 = v14;
        *(void *)&long long v74 = v16;
        v34 = objc_msgSend(v7, "hk_mapToDictionary:", buf);

        _HKInitializeLogging();
        uint64_t v17 = (id)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = [v8 containerIdentifier];
          [v9 databaseScope];
          CKDatabaseScopeString();
          id v19 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = [v7 count];
          *(_DWORD *)buf = 138544130;
          *(void *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v18;
          *(_WORD *)&buf[22] = 2114;
          v73 = v19;
          LOWORD(v74) = 2048;
          *(void *)((char *)&v74 + 2) = v20;
          _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: %{public}@: Beginning fetch of %ld record zone changes", buf, 0x2Au);
        }
        id v33 = v8;
        uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F1A070]) initWithRecordZoneIDs:v7 configurationsByRecordZoneID:v34];
        [v21 setFetchAllChanges:1];
        [v21 setShouldFetchAssetContents:0];
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke;
        v56[3] = &unk_1E62F64C8;
        v56[4] = a1;
        id v22 = v8;
        id v57 = v22;
        id v23 = v9;
        id v58 = v23;
        v59 = v68;
        v60 = v62;
        v61 = v66;
        [v21 setRecordWasChangedBlock:v56];
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_290;
        v55[3] = &unk_1E62F64F0;
        v55[4] = v68;
        v55[5] = v64;
        [v21 setRecordWithIDWasDeletedBlock:v55];
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_2;
        v47[3] = &unk_1E62F6568;
        id v24 = v22;
        id v48 = v24;
        id v25 = v23;
        id v49 = v25;
        v50 = a1;
        v51 = v68;
        v52 = v62;
        v53 = v66;
        v54 = v64;
        [v21 setRecordZoneChangeTokensUpdatedBlock:v47];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_298;
        v39[3] = &unk_1E62F6590;
        id v26 = v24;
        id v40 = v26;
        id v27 = v25;
        id v41 = v27;
        v42 = a1;
        v43 = v68;
        v44 = v62;
        v45 = v66;
        v46 = v64;
        [v21 setRecordZoneFetchCompletionBlock:v39];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_302;
        v35[3] = &unk_1E62F3EE8;
        v35[4] = a1;
        id v36 = v26;
        id v28 = v27;
        id v37 = v28;
        id v38 = v7;
        [v21 setFetchRecordZoneChangesCompletionBlock:v35];
        v29 = [a1 configuration];
        v30 = [v29 cachedCloudState];
        objc_msgSend(v30, "setOperationCountForAnalytics:", objc_msgSend(v30, "operationCountForAnalytics") + 1);

        v31 = [a1 configuration];
        v32 = [v31 operationGroup];
        [v21 setGroup:v32];

        objc_msgSend(v28, "hd_addOperation:", v21);
        id v8 = v33;

        goto LABEL_7;
      }
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v70 = *MEMORY[0x1E4F28568];
      v71 = @"Synthesized error for preemptive split.";
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      id v12 = [v10 errorWithDomain:*MEMORY[0x1E4F19C40] code:27 userInfo:v11];
      -[HDCloudSyncUpdateCachedRecordsOperation _limitExceededFetchingChangesForRecordZoneIDs:container:database:error:]((uint64_t)a1, v7, v8, v9, v12);
    }
    [a1[13] finishTask];
LABEL_7:
    _Block_object_dispose(v62, 8);

    _Block_object_dispose(v64, 8);
    _Block_object_dispose(v66, 8);

    _Block_object_dispose(v68, 8);
  }
}

- (void)_limitExceededFetchingChangesForRecordZoneIDs:(void *)a3 container:(void *)a4 database:(void *)a5 error:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    uint64_t v13 = [v9 count];
    _HKInitializeLogging();
    uint64_t v14 = *MEMORY[0x1E4F29FA8];
    id v15 = *MEMORY[0x1E4F29FA8];
    if (v13 == 1)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v20 = 138543362;
        uint64_t v21 = a1;
        _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Received limit exceeded error for a single record zone. This is unexpected.", (uint8_t *)&v20, 0xCu);
      }
      [*(id *)(a1 + 104) beginTask];
      [*(id *)(a1 + 104) failTaskWithError:v12];
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = v14;
        int v20 = 138543618;
        uint64_t v21 = a1;
        __int16 v22 = 2048;
        uint64_t v23 = [v9 count];
        _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Received limit exceeded error; retrying by splitting record zone request in half and re-fetching (%ld zones).",
          (uint8_t *)&v20,
          0x16u);
      }
      uint64_t v17 = objc_msgSend(v9, "hk_splitWithBucketCount:", 2);
      v18 = [v17 objectAtIndexedSubscript:0];
      -[HDCloudSyncUpdateCachedRecordsOperation _fetchChangesForRecordZoneIDs:container:database:](a1, v18, v10, v11);

      id v19 = [v17 objectAtIndexedSubscript:1];
      -[HDCloudSyncUpdateCachedRecordsOperation _fetchChangesForRecordZoneIDs:container:database:](a1, v19, v10, v11);
    }
  }
}

void __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    _HKInitializeLogging();
    id v10 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      int v22 = 138543874;
      uint64_t v23 = v21;
      __int16 v24 = 2114;
      id v25 = v7;
      __int16 v26 = 2114;
      id v27 = v9;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@: recordWasChangedBlock failed to fetch changes for record %{public}@, %{public}@", (uint8_t *)&v22, 0x20u);
    }
    id v11 = [HDCloudSyncZoneIdentifier alloc];
    id v12 = [v7 zoneID];
    uint64_t v13 = [*(id *)(a1 + 40) containerIdentifier];
    id v14 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v11, "initForZone:container:scope:", v12, v13, [*(id *)(a1 + 48) databaseScope]);

    id v15 = [HDCloudSyncCachedZone alloc];
    id v16 = [*(id *)(a1 + 32) configuration];
    uint64_t v17 = [v16 repository];
    v18 = [*(id *)(a1 + 32) configuration];
    id v19 = [v18 accessibilityAssertion];
    id v20 = [(HDCloudSyncCachedZone *)v15 initForZoneIdentifier:v14 repository:v17 accessibilityAssertion:v19];

    [v20 handleCloudError:v9 operation:*(void *)(a1 + 32) container:*(void *)(a1 + 40) database:*(void *)(a1 + 48)];
    if (objc_msgSend(v9, "hd_shouldPreventCloudKitCacheUpdate"))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v14];
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
    }
  }
  else if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v8];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
  }
}

void __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_290(uint64_t a1, void *a2)
{
  id v3 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v4];

  v5 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);

  os_unfair_lock_unlock(v5);
}

void __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = [HDCloudSyncZoneIdentifier alloc];
  id v8 = [*(id *)(a1 + 32) containerIdentifier];
  id v9 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v7, "initForZone:container:scope:", v6, v8, [*(id *)(a1 + 40) databaseScope]);

  id v10 = [HDCloudSyncCachedZone alloc];
  id v11 = [*(id *)(a1 + 48) configuration];
  id v12 = [v11 repository];
  uint64_t v13 = [*(id *)(a1 + 48) configuration];
  id v14 = [v13 accessibilityAssertion];
  id v15 = [(HDCloudSyncCachedZone *)v10 initForZoneIdentifier:v9 repository:v12 accessibilityAssertion:v14];

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) containsObject:v9])
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
    _HKInitializeLogging();
    id v16 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 48);
      v18 = *(void **)(a1 + 32);
      id v19 = v16;
      id v20 = [v18 containerIdentifier];
      [*(id *)(a1 + 40) databaseScope];
      uint64_t v21 = CKDatabaseScopeString();
      *(_DWORD *)buf = 138544386;
      uint64_t v46 = v17;
      __int16 v47 = 2080;
      id v48 = "-[HDCloudSyncUpdateCachedRecordsOperation _fetchChangesForRecordZoneIDs:container:database:]_block_invoke_2";
      __int16 v49 = 2114;
      id v50 = v9;
      __int16 v51 = 2114;
      v52 = v20;
      __int16 v53 = 2114;
      v54 = v21;
      _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "%{public}@ %s@: recordZoneChangeTokensUpdatedBlock with incomplete zone %{public}@, container %{public}@, database %{public}@.", buf, 0x34u);
    }
  }
  else
  {
    int v22 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_292;
    v43[3] = &unk_1E62F6518;
    id v23 = v15;
    id v44 = v23;
    __int16 v24 = objc_msgSend(v22, "hk_filter:", v43);
    id v25 = (void *)[v24 copy];

    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) removeObjectsInArray:v25];
    __int16 v26 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_2_294;
    v41[3] = &unk_1E62F6540;
    id v27 = v23;
    id v42 = v27;
    uint64_t v28 = objc_msgSend(v26, "hk_filter:", v41);
    v29 = (void *)[v28 copy];

    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) removeObjectsInArray:v29];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
    v31 = *(void **)(a1 + 40);
    v30 = *(void **)(a1 + 48);
    v32 = *(void **)(a1 + 32);
    id v40 = 0;
    LOBYTE(v27) = -[HDCloudSyncUpdateCachedRecordsOperation _updateCKCachedZoneForZone:recordsToAdd:recordIDsToDelete:serverChangeToken:fetchComplete:container:database:error:](v30, v27, v25, v29, v5, 0, v32, v31, &v40);
    id v33 = v40;
    if ((v27 & 1) == 0)
    {
      _HKInitializeLogging();
      v34 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v39 = *(void *)(a1 + 48);
        v35 = *(void **)(a1 + 32);
        id v36 = v34;
        id v37 = [v35 containerIdentifier];
        [*(id *)(a1 + 40) databaseScope];
        id v38 = CKDatabaseScopeString();
        *(_DWORD *)buf = 138544642;
        uint64_t v46 = v39;
        __int16 v47 = 2080;
        id v48 = "-[HDCloudSyncUpdateCachedRecordsOperation _fetchChangesForRecordZoneIDs:container:database:]_block_invoke_3";
        __int16 v49 = 2114;
        id v50 = v9;
        __int16 v51 = 2114;
        v52 = v37;
        __int16 v53 = 2114;
        v54 = v38;
        __int16 v55 = 2114;
        id v56 = v33;
        _os_log_error_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_ERROR, "%{public}@ %s@: recordZoneChangeTokensUpdatedBlock failed to cache records for zone %{public}@, container %{public}@, database %{public}@, %{public}@", buf, 0x3Eu);
      }
    }
  }
}

uint64_t __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_292(uint64_t a1, void *a2)
{
  id v3 = [a2 recordID];
  id v4 = [v3 zoneID];
  id v5 = [*(id *)(a1 + 32) zoneIdentifier];
  id v6 = [v5 zoneIdentifier];
  uint64_t v7 = [v4 isEqual:v6];

  return v7;
}

uint64_t __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_2_294(uint64_t a1, void *a2)
{
  id v3 = [a2 zoneID];
  id v4 = [*(id *)(a1 + 32) zoneIdentifier];
  id v5 = [v4 zoneIdentifier];
  uint64_t v6 = [v3 isEqual:v5];

  return v6;
}

- (uint64_t)_updateCKCachedZoneForZone:(void *)a3 recordsToAdd:(void *)a4 recordIDsToDelete:(void *)a5 serverChangeToken:(unsigned int)a6 fetchComplete:(void *)a7 container:(void *)a8 database:(void *)a9 error:
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  uint64_t v21 = 0;
  v116 = a1;
  if (a1 && v18)
  {
    id v107 = v15;
    id v105 = v18;
    int v22 = v20;
    id v23 = [v116 configuration];
    __int16 v24 = [v23 cachedCloudState];
    objc_msgSend(v24, "setChangedRecordsCount:", objc_msgSend(v24, "changedRecordsCount") + objc_msgSend(v16, "count"));

    id v25 = [v116 configuration];
    __int16 v26 = [v25 cachedCloudState];
    objc_msgSend(v26, "setDeletedRecordsCount:", objc_msgSend(v26, "deletedRecordsCount") + objc_msgSend(v17, "count"));

    id v104 = v19;
    id v27 = v19;
    id v103 = v22;
    id v110 = v22;
    id v28 = v16;
    id v106 = v17;
    id v29 = v17;
    v109 = v27;
    if ([v28 count] || objc_msgSend(v29, "count"))
    {
      _HKInitializeLogging();
      v30 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        v31 = v30;
        v32 = [v27 containerIdentifier];
        uint64_t v33 = [v28 count];
        uint64_t v34 = [v29 count];
        [v110 databaseScope];
        v35 = CKDatabaseScopeString();
        *(_DWORD *)buf = 138544386;
        v138 = v116;
        __int16 v139 = 2114;
        v140 = v32;
        __int16 v141 = 2048;
        uint64_t v142 = v33;
        id v27 = v109;
        __int16 v143 = 2048;
        uint64_t v144 = v34;
        __int16 v145 = 2114;
        v146 = v35;
        _os_log_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: Fetched %ld changed records and %ld deleted records in database %{public}@. Updating cache.", buf, 0x34u);
      }
    }
    id v36 = [v27 containerIdentifier];
    uint64_t v114 = [v110 databaseScope];
    id v37 = v28;
    id v111 = v29;
    id v38 = v36;
    id v39 = v37;
    id v40 = v38;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    obuint64_t j = v39;
    uint64_t v41 = [obj countByEnumeratingWithState:&v123 objects:buf count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v124;
      while (2)
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v124 != v43) {
            objc_enumerationMutation(obj);
          }
          uint64_t v45 = *(void *)(*((void *)&v123 + 1) + 8 * i);
          *(void *)&long long v119 = MEMORY[0x1E4F143A8];
          *((void *)&v119 + 1) = 3221225472;
          *(void *)&long long v120 = __119__HDCloudSyncUpdateCachedRecordsOperation__addRecordToCacheWithChangedRecords_containerIdentifier_databaseScope_error___block_invoke;
          *((void *)&v120 + 1) = &unk_1E62F6600;
          *(void *)&long long v121 = v45;
          id v46 = v40;
          id v47 = v40;
          *((void *)&v121 + 1) = v47;
          *(void *)&long long v122 = v116;
          *((void *)&v122 + 1) = v114;
          int v48 = HKWithAutoreleasePool();

          if (!v48)
          {

            uint64_t v21 = 0;
            id v18 = v105;
            id v17 = v106;
            id v20 = v103;
            id v19 = v104;
            id v15 = v107;
            goto LABEL_68;
          }
          id v40 = v46;
        }
        uint64_t v42 = [obj countByEnumeratingWithState:&v123 objects:buf count:16];
        if (v42) {
          continue;
        }
        break;
      }
    }

    id v102 = v16;
    if ([obj count])
    {
      v101 = v40;
      _HKInitializeLogging();
      __int16 v49 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        id v50 = v49;
        uint64_t v51 = [obj count];
        *(_DWORD *)v130 = 138543618;
        *(void *)&v130[4] = v116;
        *(_WORD *)&v130[12] = 2048;
        *(void *)&v130[14] = v51;
        _os_log_impl(&dword_1BCB7D000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ Updated cache with %ld changed records:", v130, 0x16u);
      }
      long long v128 = 0u;
      long long v129 = 0u;
      memset(v127, 0, sizeof(v127));
      id v52 = obj;
      uint64_t v53 = [v52 countByEnumeratingWithState:v127 objects:v131 count:16];
      v54 = (os_log_t *)MEMORY[0x1E4F29FA8];
      if (v53)
      {
        uint64_t v55 = v53;
        int v56 = 0;
        uint64_t v57 = **(void **)&v127[16];
        do
        {
          for (uint64_t j = 0; j != v55; ++j)
          {
            if (**(void **)&v127[16] != v57) {
              objc_enumerationMutation(v52);
            }
            v59 = *(void **)(*(void *)&v127[8] + 8 * j);
            _HKInitializeLogging();
            os_log_t v60 = *v54;
            if (os_log_type_enabled(*v54, OS_LOG_TYPE_DEFAULT))
            {
              v61 = v60;
              v62 = [v59 recordID];
              *(_DWORD *)v130 = 67109378;
              *(_DWORD *)&v130[4] = v56;
              *(_WORD *)&v130[8] = 2114;
              *(void *)&v130[10] = v62;
              _os_log_impl(&dword_1BCB7D000, v61, OS_LOG_TYPE_DEFAULT, "\t\t%3d. %{public}@", v130, 0x12u);

              ++v56;
              v54 = (os_log_t *)MEMORY[0x1E4F29FA8];
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              _HKInitializeLogging();
              os_log_t v63 = *v54;
              if (os_log_type_enabled(*v54, OS_LOG_TYPE_DEFAULT))
              {
                v64 = v63;
                id v65 = [v59 description];
                *(_DWORD *)v130 = 138543362;
                *(void *)&v130[4] = v65;
                _os_log_impl(&dword_1BCB7D000, v64, OS_LOG_TYPE_DEFAULT, "Participant Record Status %{public}@", v130, 0xCu);
              }
            }
          }
          uint64_t v55 = [v52 countByEnumeratingWithState:v127 objects:v131 count:16];
        }
        while (v55);
      }

      id v40 = v101;
    }
    else
    {
    }
    id v66 = v111;
    id v117 = v40;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    id v67 = v66;
    uint64_t v68 = [v67 countByEnumeratingWithState:&v123 objects:buf count:16];
    id v112 = v67;
    if (v68)
    {
      uint64_t v69 = v68;
      id v70 = 0;
      uint64_t v118 = *(void *)v124;
      while (2)
      {
        uint64_t v71 = 0;
        v72 = v70;
        do
        {
          if (*(void *)v124 != v118) {
            objc_enumerationMutation(v112);
          }
          v73 = *(void **)(*((void *)&v123 + 1) + 8 * v71);
          long long v74 = [HDCloudSyncZoneIdentifier alloc];
          uint64_t v75 = [v73 zoneID];
          id v76 = [(HDCloudSyncZoneIdentifier *)v74 initForZone:v75 container:v117 scope:v114];

          v77 = [HDCloudSyncCachedZone alloc];
          v78 = [v116 configuration];
          uint64_t v79 = [v78 repository];
          v80 = [v116 configuration];
          v81 = [v80 accessibilityAssertion];
          id v82 = [(HDCloudSyncCachedZone *)v77 initForZoneIdentifier:v76 repository:v79 accessibilityAssertion:v81];

          *(void *)v130 = v72;
          LOBYTE(v79) = [v82 deleteRecordID:v73 error:v130];
          id v70 = *(id *)v130;

          if ((v79 & 1) == 0)
          {
            _HKInitializeLogging();
            v83 = *MEMORY[0x1E4F29FA8];
            v84 = a9;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v131 = 138543874;
              v132 = v116;
              __int16 v133 = 2114;
              uint64_t v134 = (uint64_t)v73;
              __int16 v135 = 2114;
              id v136 = v70;
              _os_log_error_impl(&dword_1BCB7D000, v83, OS_LOG_TYPE_ERROR, "%{public}@ Failed to delete cached recordID %{public}@, %{public}@", v131, 0x20u);
            }
            id v85 = v70;
            v86 = v85;
            id v17 = v106;
            id v15 = v107;
            id v16 = v102;
            id v18 = v105;
            if (v85)
            {
              if (a9) {
                *a9 = v85;
              }
              else {
                _HKLogDroppedError();
              }
            }

            v127[0] = v86 == 0;
            v98 = v112;

            goto LABEL_64;
          }

          ++v71;
          v72 = v70;
        }
        while (v69 != v71);
        id v67 = v112;
        uint64_t v69 = [v112 countByEnumeratingWithState:&v123 objects:buf count:16];
        if (v69) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v70 = 0;
    }
    id v115 = v70;

    if ([v67 count])
    {
      _HKInitializeLogging();
      v87 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        v88 = v87;
        uint64_t v89 = [v112 count];
        *(_DWORD *)v131 = 138543618;
        v132 = v116;
        __int16 v133 = 2048;
        uint64_t v134 = v89;
        _os_log_impl(&dword_1BCB7D000, v88, OS_LOG_TYPE_DEFAULT, "%{public}@ Updated cache with %ld deleted records:", v131, 0x16u);
      }
      long long v121 = 0u;
      long long v122 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      id v90 = v112;
      uint64_t v91 = [v90 countByEnumeratingWithState:&v119 objects:v131 count:16];
      if (v91)
      {
        uint64_t v92 = v91;
        int v93 = 0;
        uint64_t v94 = *(void *)v120;
        do
        {
          for (uint64_t k = 0; k != v92; ++k)
          {
            if (*(void *)v120 != v94) {
              objc_enumerationMutation(v90);
            }
            uint64_t v96 = *(void *)(*((void *)&v119 + 1) + 8 * k);
            _HKInitializeLogging();
            v97 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v127 = 67109378;
              *(_DWORD *)&v127[4] = v93;
              *(_WORD *)&v127[8] = 2114;
              *(void *)&v127[10] = v96;
              _os_log_impl(&dword_1BCB7D000, v97, OS_LOG_TYPE_DEFAULT, "\t\t%3d. %{public}@", v127, 0x12u);
              ++v93;
            }
          }
          uint64_t v92 = [v90 countByEnumeratingWithState:&v119 objects:v131 count:16];
        }
        while (v92);
      }
    }
    v127[0] = 1;
    id v17 = v106;
    id v15 = v107;
    id v16 = v102;
    id v18 = v105;
    v84 = a9;
    v86 = v115;
    v98 = v112;
LABEL_64:

    int v99 = v127[0];
    id v19 = v104;
    if (v99 == 1) {
      uint64_t v21 = [v15 setServerChangeToken:v18 fetchComplete:a6 error:v84];
    }
    else {
      uint64_t v21 = 0;
    }
    id v20 = v103;
  }
LABEL_68:

  return v21;
}

void __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_298(uint64_t a1, void *a2, void *a3, uint64_t a4, int a5, void *a6)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = a2;
  uint64_t v13 = [HDCloudSyncZoneIdentifier alloc];
  id v14 = [*(id *)(a1 + 32) containerIdentifier];
  id v15 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v13, "initForZone:container:scope:", v12, v14, [*(id *)(a1 + 40) databaseScope]);

  id v16 = [HDCloudSyncCachedZone alloc];
  id v17 = [*(id *)(a1 + 48) configuration];
  id v18 = [v17 repository];
  id v19 = [*(id *)(a1 + 48) configuration];
  id v20 = [v19 accessibilityAssertion];
  id v21 = [(HDCloudSyncCachedZone *)v16 initForZoneIdentifier:v15 repository:v18 accessibilityAssertion:v20];

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
  if (![*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) containsObject:v15])
  {
    id v29 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_299;
    v60[3] = &unk_1E62F6518;
    id v30 = v21;
    id v61 = v30;
    v31 = objc_msgSend(v29, "hk_filter:", v60);
    v32 = (void *)[v31 copy];

    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) removeObjectsInArray:v32];
    uint64_t v33 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_2_300;
    v58[3] = &unk_1E62F6540;
    id v34 = v30;
    id v59 = v34;
    v35 = objc_msgSend(v33, "hk_filter:", v58);
    id v36 = (void *)[v35 copy];

    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) removeObjectsInArray:v36];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
    id v38 = *(void **)(a1 + 40);
    id v37 = *(void **)(a1 + 48);
    if (v11) {
      unsigned int v39 = 0;
    }
    else {
      unsigned int v39 = a5 ^ 1;
    }
    id v40 = *(void **)(a1 + 32);
    id v56 = v10;
    id v57 = 0;
    char v41 = -[HDCloudSyncUpdateCachedRecordsOperation _updateCKCachedZoneForZone:recordsToAdd:recordIDsToDelete:serverChangeToken:fetchComplete:container:database:error:](v37, v34, v32, v36, v10, v39, v40, v38, &v57);
    id v42 = v57;
    uint64_t v43 = (os_log_t *)MEMORY[0x1E4F29FA8];
    if ((v41 & 1) == 0 && (_HKInitializeLogging(), os_log_t v44 = *v43, os_log_type_enabled(*v43, OS_LOG_TYPE_ERROR)))
    {
      id v50 = *(void **)(a1 + 32);
      uint64_t v53 = *(void *)(a1 + 48);
      loga = v44;
      int v48 = [v50 containerIdentifier];
      [*(id *)(a1 + 40) databaseScope];
      uint64_t v51 = CKDatabaseScopeString();
      *(_DWORD *)buf = 138544642;
      uint64_t v63 = v53;
      __int16 v64 = 2080;
      id v65 = "-[HDCloudSyncUpdateCachedRecordsOperation _fetchChangesForRecordZoneIDs:container:database:]_block_invoke_3";
      __int16 v66 = 2114;
      id v67 = v15;
      __int16 v68 = 2114;
      uint64_t v69 = v48;
      __int16 v70 = 2114;
      uint64_t v71 = v51;
      __int16 v72 = 2114;
      id v73 = v42;
      _os_log_error_impl(&dword_1BCB7D000, loga, OS_LOG_TYPE_ERROR, "%{public}@ %s@: recordZoneFetchCompletionBlock failed to cache records for zone %{public}@, container %{public}@, database %{public}@, %{public}@", buf, 0x3Eu);

      if (v11) {
        goto LABEL_10;
      }
    }
    else if (v11)
    {
LABEL_10:
      _HKInitializeLogging();
      os_log_t v45 = *v43;
      if (os_log_type_enabled(*v43, OS_LOG_TYPE_ERROR))
      {
        uint64_t v52 = *(void *)(a1 + 48);
        id v46 = *(void **)(a1 + 32);
        log = v45;
        __int16 v49 = [v46 containerIdentifier];
        [*(id *)(a1 + 40) databaseScope];
        id v47 = CKDatabaseScopeString();
        *(_DWORD *)buf = 138544642;
        uint64_t v63 = v52;
        __int16 v64 = 2080;
        id v65 = "-[HDCloudSyncUpdateCachedRecordsOperation _fetchChangesForRecordZoneIDs:container:database:]_block_invoke";
        __int16 v66 = 2114;
        id v67 = v15;
        __int16 v68 = 2114;
        uint64_t v69 = v49;
        __int16 v70 = 2114;
        uint64_t v71 = v47;
        __int16 v72 = 2114;
        id v73 = v11;
        _os_log_error_impl(&dword_1BCB7D000, log, OS_LOG_TYPE_ERROR, "%{public}@ %s: recordZoneFetchCompletionBlock failed for zone %{public}@ in container %{public}@, database %{public}@, %{public}@", buf, 0x3Eu);
      }
      [v34 handleCloudError:v11 operation:*(void *)(a1 + 48) container:*(void *)(a1 + 32) database:*(void *)(a1 + 40)];
    }

    id v10 = v56;
    goto LABEL_14;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
  _HKInitializeLogging();
  int v22 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    id v23 = v10;
    uint64_t v24 = *(void *)(a1 + 48);
    id v25 = *(void **)(a1 + 32);
    __int16 v26 = v22;
    id v27 = [v25 containerIdentifier];
    [*(id *)(a1 + 40) databaseScope];
    id v28 = CKDatabaseScopeString();
    *(_DWORD *)buf = 138544386;
    uint64_t v63 = v24;
    id v10 = v23;
    __int16 v64 = 2080;
    id v65 = "-[HDCloudSyncUpdateCachedRecordsOperation _fetchChangesForRecordZoneIDs:container:database:]_block_invoke";
    __int16 v66 = 2114;
    id v67 = v15;
    __int16 v68 = 2114;
    uint64_t v69 = v27;
    __int16 v70 = 2114;
    uint64_t v71 = v28;
    _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "%{public}@ %s@: recordZoneFetchCompletionBlock with incomplete zone %{public}@, container %{public}@, database %{public}@.", buf, 0x34u);
  }
LABEL_14:
}

uint64_t __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_299(uint64_t a1, void *a2)
{
  id v3 = [a2 recordID];
  id v4 = [v3 zoneID];
  id v5 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v6 = [v5 zoneIdentifier];
  uint64_t v7 = [v4 isEqual:v6];

  return v7;
}

uint64_t __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_2_300(uint64_t a1, void *a2)
{
  id v3 = [a2 zoneID];
  id v4 = [*(id *)(a1 + 32) zoneIdentifier];
  id v5 = [v4 zoneIdentifier];
  uint64_t v6 = [v3 isEqual:v5];

  return v6;
}

void __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_302(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    _HKInitializeLogging();
    id v4 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      id v12 = *(void **)(a1 + 40);
      id v14 = v4;
      id v15 = [v12 containerIdentifier];
      [*(id *)(a1 + 48) databaseScope];
      id v16 = CKDatabaseScopeString();
      int v17 = 138544386;
      uint64_t v18 = v13;
      __int16 v19 = 2080;
      id v20 = "-[HDCloudSyncUpdateCachedRecordsOperation _fetchChangesForRecordZoneIDs:container:database:]_block_invoke";
      __int16 v21 = 2114;
      int v22 = v15;
      __int16 v23 = 2114;
      uint64_t v24 = v16;
      __int16 v25 = 2114;
      id v26 = v3;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@ %s@: Failed for container %{public}@, database %{public}@, %{public}@", (uint8_t *)&v17, 0x34u);
    }
    if (objc_msgSend(v3, "hk_isErrorInDomain:code:", *MEMORY[0x1E4F19C40], 27))
    {
      -[HDCloudSyncUpdateCachedRecordsOperation _limitExceededFetchingChangesForRecordZoneIDs:container:database:error:](*(void *)(a1 + 32), *(void **)(a1 + 56), *(void **)(a1 + 40), *(void **)(a1 + 48), v3);
    }
    else
    {
      id v5 = objc_msgSend(v3, "hd_errorStrippingCloudKitPartialFailuresWithShouldIgnoreBlock:", &__block_literal_global_306);
      if (v5)
      {
        uint64_t v6 = *(void **)(a1 + 40);
        uint64_t v7 = [*(id *)(a1 + 32) configuration];
        id v8 = [v7 repository];
        id v9 = [v8 primaryCKContainer];

        if (v6 == v9)
        {
          id v10 = *(void **)(*(void *)(a1 + 32) + 104);
          id v11 = objc_msgSend(v5, "hd_errorSurfacingFatalCloudKitPartialFailure");
          [v10 failTaskWithError:v11];

          goto LABEL_10;
        }
      }
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 104) finishTask];
LABEL_10:
}

uint64_t __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_303(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 domain];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v4)
  {
    uint64_t v5 = [v2 code];
    BOOL v6 = v5 == 112;
    if (v5 == 22) {
      BOOL v6 = 1;
    }
    uint64_t v7 = v5 == 11 || v6;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __108__HDCloudSyncUpdateCachedRecordsOperation__configurationsByRecordZoneIDs_containerIdentifier_databaseScope___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  BOOL v6 = a3;
  id v7 = [[HDCloudSyncZoneIdentifier alloc] initForZone:v5 container:*(void *)(a1 + 32) scope:*(void *)(a1 + 48)];
  id v8 = [HDCloudSyncCachedZone alloc];
  id v9 = [*(id *)(a1 + 40) configuration];
  id v10 = [v9 repository];
  id v11 = [*(id *)(a1 + 40) configuration];
  id v12 = [v11 accessibilityAssertion];
  id v13 = [(HDCloudSyncCachedZone *)v8 initForZoneIdentifier:v7 repository:v10 accessibilityAssertion:v12];

  id v20 = 0;
  id v14 = [v13 serverChangeTokenWithError:&v20];
  id v15 = v20;
  id v16 = v15;
  if (!v14)
  {
    if (v15)
    {
      _HKInitializeLogging();
      int v17 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        uint64_t v22 = v19;
        __int16 v23 = 2114;
        id v24 = v7;
        __int16 v25 = 2114;
        id v26 = v16;
        _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve previous server change token for %{public}@, %{public}@", buf, 0x20u);
      }
    }
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F1A060]);
  [v18 setPreviousServerChangeToken:v14];
  [v18 setResultsLimit:0];
  [v18 setDesiredKeys:0];
  v6[2](v6, v5, v18);
}

BOOL __119__HDCloudSyncUpdateCachedRecordsOperation__addRecordToCacheWithChangedRecords_containerIdentifier_databaseScope_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v4 = [HDCloudSyncZoneIdentifier alloc];
  id v5 = [*(id *)(a1 + 32) recordID];
  BOOL v6 = [v5 zoneID];
  id v7 = [(HDCloudSyncZoneIdentifier *)v4 initForZone:v6 container:*(void *)(a1 + 40) scope:*(void *)(a1 + 56)];

  id v8 = [HDCloudSyncCachedZone alloc];
  id v9 = [*(id *)(a1 + 48) configuration];
  uint64_t v10 = [v9 repository];
  id v11 = [*(id *)(a1 + 48) configuration];
  id v12 = [v11 accessibilityAssertion];
  id v13 = [(HDCloudSyncCachedZone *)v8 initForZoneIdentifier:v7 repository:v10 accessibilityAssertion:v12];

  uint64_t v14 = *(void *)(a1 + 32);
  id v24 = 0;
  LOBYTE(v10) = [v13 addRecord:v14 error:&v24];
  id v15 = v24;
  if (v10) {
    goto LABEL_7;
  }
  _HKInitializeLogging();
  id v16 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v22 = *(void *)(a1 + 48);
    uint64_t v23 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    uint64_t v26 = v22;
    __int16 v27 = 2114;
    uint64_t v28 = v23;
    __int16 v29 = 2114;
    id v30 = v15;
    _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Failed to cache record %{public}@, %{public}@", buf, 0x20u);
  }
  if ([v15 code] == 713) {
    goto LABEL_7;
  }
  if ([v15 code] == 709)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 120));
    int v17 = *(void **)(*(void *)(a1 + 48) + 112);
    id v18 = [*(id *)(a1 + 32) recordID];
    [v17 addObject:v18];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 120));
LABEL_7:
    BOOL v19 = 1;
    goto LABEL_8;
  }
  id v21 = v15;
  BOOL v19 = v21 == 0;
  if (v21)
  {
    if (a2) {
      *a2 = v21;
    }
    else {
      _HKLogDroppedError();
    }
  }

LABEL_8:
  return v19;
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  BOOL v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(HDCloudSyncOperation *)self finishWithSuccess:v5 error:v7];
}

- (NSArray)zoneIdentifiersWithIdentityLost
{
  return self->_zoneIdentifiersWithIdentityLost;
}

- (HDSynchronousTaskGroup)taskGroup
{
  return self->_taskGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifiersWithIdentityLost, 0);
  objc_storeStrong((id *)&self->_invalidRecordIDs, 0);

  objc_storeStrong((id *)&self->_taskGroup, 0);
}

@end