@interface HDCloudSyncUpdateCachedZonesOperation
+ (BOOL)shouldLogAtOperationStart;
- (HDCloudSyncUpdateCachedZonesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDSynchronousTaskGroup)taskGroup;
- (uint64_t)_updateCKCachedZonesWithServerChangeToken:(void *)a3 recordZonesIDsToAdd:(void *)a4 recordZonesIDsToDelete:(void *)a5 container:(void *)a6 database:(void *)a7 error:;
- (void)fetchChangesForContainer:(id)a3 database:(id)a4;
- (void)main;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncUpdateCachedZonesOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (HDCloudSyncUpdateCachedZonesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncUpdateCachedZonesOperation;
  v4 = [(HDCloudSyncOperation *)&v8 initWithConfiguration:a3 cloudState:0];
  if (v4)
  {
    v5 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = v4->_taskGroup;
    v4->_taskGroup = v5;

    [(HDSynchronousTaskGroup *)v4->_taskGroup setDelegate:v4];
  }
  return v4;
}

- (void)main
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];
  v5 = [v4 allCKContainers];
  v6 = [v5 allObjects];

  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = v7;
    uint64_t v9 = [v6 count];
    v10 = [v6 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138543874;
    v24 = self;
    __int16 v25 = 2048;
    uint64_t v26 = v9;
    __int16 v27 = 2114;
    v28 = v10;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning fetches for private database in %ld containers: %{public}@", buf, 0x20u);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "privateCloudDatabase", (void)v18);
        [(HDCloudSyncUpdateCachedZonesOperation *)self fetchChangesForContainer:v16 database:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  [(HDSynchronousTaskGroup *)self->_taskGroup finishTask];
}

- (void)fetchChangesForContainer:(id)a3 database:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2810000000;
  v49[3] = &unk_1BD44B655;
  int v50 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__2;
  v47[4] = __Block_byref_object_dispose__2;
  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__2;
  v45[4] = __Block_byref_object_dispose__2;
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_super v8 = [(HDCloudSyncOperation *)self configuration];
  uint64_t v9 = [v8 cachedCloudState];
  v10 = [v6 containerIdentifier];
  id v44 = 0;
  id v11 = objc_msgSend(v9, "serverChangeTokenForContainerIdentifier:databaseScope:error:", v10, objc_msgSend(v7, "databaseScope"), &v44);
  id v12 = v44;

  if (v12)
  {
    _HKInitializeLogging();
    uint64_t v13 = (id)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v23 = [v6 containerIdentifier];
      uint64_t v24 = [v7 databaseScope];
      *(_DWORD *)buf = 138544130;
      v52 = self;
      __int16 v53 = 2114;
      v54 = v23;
      __int16 v55 = 2048;
      uint64_t v56 = v24;
      __int16 v57 = 2114;
      id v58 = v12;
      _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch server change token for container %{public}@, database, %ld, %{public}@", buf, 0x2Au);
    }
  }
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1A038]) initWithPreviousServerChangeToken:v11];
  [v14 setFetchAllChanges:1];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __75__HDCloudSyncUpdateCachedZonesOperation_fetchChangesForContainer_database___block_invoke;
  v43[3] = &unk_1E62F3030;
  v43[4] = v49;
  v43[5] = v47;
  [v14 setRecordZoneWithIDChangedBlock:v43];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __75__HDCloudSyncUpdateCachedZonesOperation_fetchChangesForContainer_database___block_invoke_2;
  v42[3] = &unk_1E62F3030;
  v42[4] = v49;
  v42[5] = v45;
  [v14 setRecordZoneWithIDWasDeletedBlock:v42];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __75__HDCloudSyncUpdateCachedZonesOperation_fetchChangesForContainer_database___block_invoke_3;
  v41[3] = &unk_1E62F3030;
  v41[4] = v49;
  v41[5] = v45;
  [v14 setRecordZoneWithIDWasPurgedBlock:v41];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __75__HDCloudSyncUpdateCachedZonesOperation_fetchChangesForContainer_database___block_invoke_4;
  v35[3] = &unk_1E62F3058;
  v39 = v47;
  v40 = v45;
  v38 = v49;
  v35[4] = self;
  id v15 = v6;
  id v36 = v15;
  id v16 = v7;
  id v37 = v16;
  [v14 setChangeTokenUpdatedBlock:v35];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  __int16 v27 = __75__HDCloudSyncUpdateCachedZonesOperation_fetchChangesForContainer_database___block_invoke_284;
  v28 = &unk_1E62F3080;
  v33 = v47;
  v34 = v45;
  v32 = v49;
  uint64_t v29 = self;
  id v17 = v15;
  id v30 = v17;
  id v18 = v16;
  id v31 = v18;
  [v14 setFetchDatabaseChangesCompletionBlock:&v25];
  [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
  long long v19 = [(HDCloudSyncOperation *)self configuration];
  long long v20 = [v19 cachedCloudState];
  objc_msgSend(v20, "setOperationCountForAnalytics:", objc_msgSend(v20, "operationCountForAnalytics") + 1);

  long long v21 = [(HDCloudSyncOperation *)self configuration];
  v22 = [v21 operationGroup];
  [v14 setGroup:v22];

  objc_msgSend(v18, "hd_addOperation:", v14);
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v49, 8);
}

void __75__HDCloudSyncUpdateCachedZonesOperation_fetchChangesForContainer_database___block_invoke(uint64_t a1, void *a2)
{
  v3 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v4];

  v5 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);

  os_unfair_lock_unlock(v5);
}

void __75__HDCloudSyncUpdateCachedZonesOperation_fetchChangesForContainer_database___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v4];

  v5 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);

  os_unfair_lock_unlock(v5);
}

void __75__HDCloudSyncUpdateCachedZonesOperation_fetchChangesForContainer_database___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v4];

  v5 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);

  os_unfair_lock_unlock(v5);
}

void __75__HDCloudSyncUpdateCachedZonesOperation_fetchChangesForContainer_database___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 56) + 8) + 32);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  v5 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) copy];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  objc_super v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) copy];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
  uint64_t v13 = *(void **)(a1 + 32);
  uint64_t v14 = *(void **)(a1 + 40);
  id v15 = *(void **)(a1 + 48);
  id v24 = 0;
  char v16 = -[HDCloudSyncUpdateCachedZonesOperation _updateCKCachedZonesWithServerChangeToken:recordZonesIDsToAdd:recordZonesIDsToDelete:container:database:error:](v13, v4, v5, v9, v14, v15, &v24);

  id v17 = v24;
  if ((v16 & 1) == 0)
  {
    _HKInitializeLogging();
    id v18 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      long long v19 = *(void **)(a1 + 40);
      long long v21 = v18;
      v22 = [v19 containerIdentifier];
      [*(id *)(a1 + 48) databaseScope];
      v23 = CKDatabaseScopeString();
      *(_DWORD *)buf = 138544386;
      uint64_t v26 = v20;
      __int16 v27 = 2080;
      v28 = "-[HDCloudSyncUpdateCachedZonesOperation fetchChangesForContainer:database:]_block_invoke_4";
      __int16 v29 = 2114;
      id v30 = v22;
      __int16 v31 = 2114;
      v32 = v23;
      __int16 v33 = 2114;
      id v34 = v17;
      _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "%{public}@ %s@: Failed to cache zones for container %{public}@, database %{public}@, %{public}@", buf, 0x34u);
    }
  }
}

- (uint64_t)_updateCKCachedZonesWithServerChangeToken:(void *)a3 recordZonesIDsToAdd:(void *)a4 recordZonesIDsToDelete:(void *)a5 container:(void *)a6 database:(void *)a7 error:
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v95 = a4;
  id v94 = a5;
  id v93 = a6;
  v98 = a1;
  if (a1)
  {
    uint64_t v15 = [v14 count];
    char v16 = (NSObject **)MEMORY[0x1E4F29FA8];
    id v92 = v13;
    v89 = a7;
    if (v15 || [v95 count])
    {
      _HKInitializeLogging();
      id v17 = *v16;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = v17;
        uint64_t v19 = [v14 count];
        uint64_t v20 = [v95 count];
        [v93 databaseScope];
        long long v21 = CKDatabaseScopeString();
        v22 = [v94 containerIdentifier];
        *(_DWORD *)buf = 138544386;
        v128 = a1;
        __int16 v129 = 2048;
        uint64_t v130 = v19;
        __int16 v131 = 2048;
        uint64_t v132 = v20;
        __int16 v133 = 2114;
        id v134 = v21;
        __int16 v135 = 2114;
        v136 = v22;
        _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Found %ld modified and %ld deleted zone changes for %{public}@ database in %{public}@", buf, 0x34u);
      }
      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      obuint64_t j = v14;
      uint64_t v23 = [obj countByEnumeratingWithState:&v108 objects:v120 count:16];
      id v24 = (os_log_t *)MEMORY[0x1E4F29FA8];
      if (v23)
      {
        uint64_t v25 = v23;
        uint64_t v26 = 0;
        uint64_t v27 = *(void *)v109;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v109 != v27) {
              objc_enumerationMutation(obj);
            }
            uint64_t v29 = *(void *)(*((void *)&v108 + 1) + 8 * i);
            _HKInitializeLogging();
            id v30 = *v24;
            if (os_log_type_enabled(*v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v128 = (void *)(v26 + i);
              __int16 v129 = 2114;
              uint64_t v130 = v29;
              _os_log_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_DEFAULT, "Modified:\t%ld: + %{public}@", buf, 0x16u);
            }
          }
          uint64_t v25 = [obj countByEnumeratingWithState:&v108 objects:v120 count:16];
          v26 += i;
        }
        while (v25);
      }

      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      id v31 = v95;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v104 objects:v119 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = 0;
        uint64_t v35 = *(void *)v105;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v105 != v35) {
              objc_enumerationMutation(v31);
            }
            uint64_t v37 = *(void *)(*((void *)&v104 + 1) + 8 * j);
            _HKInitializeLogging();
            v38 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v128 = (void *)(v34 + j);
              __int16 v129 = 2114;
              uint64_t v130 = v37;
              _os_log_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_DEFAULT, "Deleted: \t%ld: + %{public}@", buf, 0x16u);
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v104 objects:v119 count:16];
          v34 += j;
        }
        while (v33);
      }

      v102[0] = MEMORY[0x1E4F143A8];
      v102[1] = 3221225472;
      v102[2] = __151__HDCloudSyncUpdateCachedZonesOperation__updateCKCachedZonesWithServerChangeToken_recordZonesIDsToAdd_recordZonesIDsToDelete_container_database_error___block_invoke;
      v102[3] = &unk_1E62F30A8;
      id v103 = v31;
      objc_msgSend(obj, "hk_filter:", v102);
      id v14 = (id)objc_claimAutoreleasedReturnValue();

      id v13 = v92;
    }
    v39 = [v98 configuration];
    v40 = [v39 cachedCloudState];
    objc_msgSend(v40, "setChangedZonesCount:", objc_msgSend(v40, "changedZonesCount") + objc_msgSend(v14, "count"));

    v41 = [v98 configuration];
    v42 = [v41 cachedCloudState];
    objc_msgSend(v42, "setDeletedZonesCount:", objc_msgSend(v42, "deletedZonesCount") + objc_msgSend(v95, "count"));

    v43 = [v94 containerIdentifier];
    id obja = (id)[v93 databaseScope];
    id v44 = v14;
    id v91 = v95;
    id v90 = v13;
    id v45 = v43;
    id v46 = v44;
    id v47 = v45;
    long long v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    id v14 = v46;
    uint64_t v48 = [v14 countByEnumeratingWithState:&v115 objects:buf count:16];
    v99 = v14;
    if (v48)
    {
      uint64_t v49 = v48;
      id v50 = 0;
      uint64_t v51 = *(void *)v116;
      while (2)
      {
        uint64_t v52 = 0;
        __int16 v53 = v50;
        do
        {
          if (*(void *)v116 != v51) {
            objc_enumerationMutation(v99);
          }
          id v54 = v47;
          id v55 = [[HDCloudSyncZoneIdentifier alloc] initForZone:*(void *)(*((void *)&v115 + 1) + 8 * v52) container:v47 scope:obja];
          uint64_t v56 = [v98 configuration];
          __int16 v57 = [v56 cachedCloudState];
          id v114 = v53;
          char v58 = [v57 addZoneWithIdentifier:v55 error:&v114];
          id v50 = v114;

          if ((v58 & 1) == 0)
          {
            _HKInitializeLogging();
            uint64_t v59 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v121 = 138543874;
              v122 = v98;
              __int16 v123 = 2114;
              id v124 = v55;
              __int16 v125 = 2114;
              id v126 = v50;
              _os_log_error_impl(&dword_1BCB7D000, v59, OS_LOG_TYPE_ERROR, "%{public}@ Failed to add cached record zone %{public}@, %{public}@", v121, 0x20u);
            }
            id v50 = v50;
            id v14 = v99;
            id v47 = v54;
            if (v50)
            {
              if (v89) {
                void *v89 = v50;
              }
              else {
                _HKLogDroppedError();
              }
            }

            v121[0] = v50 == 0;
            goto LABEL_43;
          }

          ++v52;
          __int16 v53 = v50;
          id v47 = v54;
        }
        while (v49 != v52);
        id v14 = v99;
        uint64_t v49 = [v99 countByEnumeratingWithState:&v115 objects:buf count:16];
        if (v49) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v50 = 0;
    }

    v121[0] = 1;
LABEL_43:

    int v60 = v121[0];
    if (v60 != 1) {
      goto LABEL_65;
    }
    id v61 = v91;
    id v88 = v47;
    id v62 = v47;
    long long v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    id v63 = v61;
    uint64_t v64 = [v63 countByEnumeratingWithState:&v115 objects:buf count:16];
    id v96 = v63;
    if (v64)
    {
      uint64_t v65 = v64;
      id v66 = 0;
      uint64_t v97 = *(void *)v116;
      while (2)
      {
        uint64_t v67 = 0;
        v68 = v66;
        do
        {
          if (*(void *)v116 != v97) {
            objc_enumerationMutation(v96);
          }
          id v69 = v62;
          id v70 = [[HDCloudSyncZoneIdentifier alloc] initForZone:*(void *)(*((void *)&v115 + 1) + 8 * v67) container:v62 scope:obja];
          v71 = [HDCloudSyncCachedZone alloc];
          v72 = [v98 configuration];
          v73 = [v72 repository];
          v74 = [v98 configuration];
          uint64_t v75 = [v74 accessibilityAssertion];
          id v76 = [(HDCloudSyncCachedZone *)v71 initForZoneIdentifier:v70 repository:v73 accessibilityAssertion:v75];

          id v114 = v68;
          LOBYTE(v75) = [v76 deleteZoneWithError:&v114];
          id v66 = v114;

          if ((v75 & 1) == 0)
          {
            _HKInitializeLogging();
            v77 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v121 = 138543874;
              v122 = v98;
              __int16 v123 = 2114;
              id v124 = v70;
              __int16 v125 = 2114;
              id v126 = v66;
              _os_log_error_impl(&dword_1BCB7D000, v77, OS_LOG_TYPE_ERROR, "%{public}@ Failed to delete cached record zone %{public}@, %{public}@", v121, 0x20u);
            }
            id v66 = v66;
            id v14 = v99;
            id v63 = v96;
            if (v66)
            {
              if (v89) {
                void *v89 = v66;
              }
              else {
                _HKLogDroppedError();
              }
            }

            v121[0] = v66 == 0;
            id v62 = v69;
            goto LABEL_62;
          }

          ++v67;
          v68 = v66;
          id v62 = v69;
        }
        while (v65 != v67);
        id v63 = v96;
        uint64_t v65 = [v96 countByEnumeratingWithState:&v115 objects:buf count:16];
        if (v65) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v66 = 0;
    }

    v121[0] = 1;
    id v14 = v99;
LABEL_62:

    int v78 = v121[0];
    id v47 = v88;
    if (v78 == 1)
    {
      v79 = [v98 configuration];
      v80 = [v79 cachedCloudState];
      id v113 = 0;
      v81 = v62;
      char v82 = [v80 setServerChangeToken:v90 containerIdentifier:v62 databaseScope:obja error:&v113];
      id v83 = v113;

      id v13 = v92;
      if (v82)
      {

LABEL_75:
        unsigned __int8 v112 = 1;
        goto LABEL_68;
      }
      _HKInitializeLogging();
      v85 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        v128 = v98;
        __int16 v129 = 2114;
        uint64_t v130 = (uint64_t)v81;
        __int16 v131 = 2048;
        uint64_t v132 = (uint64_t)obja;
        __int16 v133 = 2114;
        id v134 = v83;
        _os_log_error_impl(&dword_1BCB7D000, v85, OS_LOG_TYPE_ERROR, "%{public}@ Failed to update cached server change token for container %{public}@, database, %ld, %{public}@", buf, 0x2Au);
      }
      id v86 = v83;
      if (!v86)
      {

        goto LABEL_75;
      }
      v87 = v86;
      if (v89) {
        void *v89 = v86;
      }
      else {
        _HKLogDroppedError();
      }
    }
    else
    {
LABEL_65:

      id v13 = v92;
    }
  }
  unsigned __int8 v112 = 0;
LABEL_68:

  return v112;
}

void __75__HDCloudSyncUpdateCachedZonesOperation_fetchChangesForContainer_database___block_invoke_284(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 56) + 8) + 32);
  id v8 = a2;
  os_unfair_lock_lock(v7);
  uint64_t v9 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) copy];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  id v13 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) copy];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
  char v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
  id v17 = *(void **)(a1 + 32);
  id v18 = *(void **)(a1 + 40);
  uint64_t v19 = *(void **)(a1 + 48);
  id v80 = 0;
  char v20 = -[HDCloudSyncUpdateCachedZonesOperation _updateCKCachedZonesWithServerChangeToken:recordZonesIDsToAdd:recordZonesIDsToDelete:container:database:error:](v17, v8, v9, v13, v18, v19, &v80);

  id v21 = v80;
  v22 = (os_log_t *)MEMORY[0x1E4F29FA8];
  if (v6)
  {
    char v77 = v20;
    _HKInitializeLogging();
    os_log_t v23 = *v22;
    if (os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v56 = v13;
      uint64_t v57 = *(void *)(a1 + 32);
      char v58 = *(void **)(a1 + 40);
      uint64_t v59 = v23;
      int v60 = [v58 containerIdentifier];
      [*(id *)(a1 + 48) databaseScope];
      CKDatabaseScopeString();
      v62 = id v61 = v21;
      *(_DWORD *)buf = 138544386;
      uint64_t v82 = v57;
      __int16 v83 = 2080;
      v84 = "-[HDCloudSyncUpdateCachedZonesOperation fetchChangesForContainer:database:]_block_invoke";
      __int16 v85 = 2114;
      id v86 = v60;
      __int16 v87 = 2114;
      id v88 = v62;
      __int16 v89 = 2114;
      id v90 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v59, OS_LOG_TYPE_ERROR, "%{public}@ %s@: Failed to fetch database changes for container %{public}@, database %{public}@, %{public}@", buf, 0x34u);

      id v13 = v56;
      id v21 = v61;
    }
    int v78 = v13;
    if (objc_msgSend(v6, "hk_isErrorInDomain:code:", *MEMORY[0x1E4F19C40], 21))
    {
      id v74 = v6;
      id v75 = v21;
      id v76 = v9;
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) removeAllObjects];
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) removeAllObjects];
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
      id v24 = [*(id *)(a1 + 32) configuration];
      uint64_t v25 = [v24 cachedCloudState];
      uint64_t v26 = [*(id *)(a1 + 40) containerIdentifier];
      uint64_t v27 = [*(id *)(a1 + 48) databaseScope];
      id v79 = 0;
      char v28 = [v25 resetServerChangeTokenForContainerIdentifier:v26 databaseScope:v27 error:&v79];
      id v29 = v79;

      if ((v28 & 1) == 0)
      {
        _HKInitializeLogging();
        os_log_t v30 = *v22;
        if (os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v68 = *(void *)(a1 + 32);
          id v69 = *(void **)(a1 + 40);
          id v70 = v30;
          v71 = [v69 containerIdentifier];
          [*(id *)(a1 + 48) databaseScope];
          v72 = CKDatabaseScopeString();
          *(_DWORD *)buf = 138544130;
          uint64_t v82 = v68;
          __int16 v83 = 2114;
          v84 = v71;
          __int16 v85 = 2114;
          id v86 = v72;
          __int16 v87 = 2114;
          id v88 = v29;
          _os_log_error_impl(&dword_1BCB7D000, v70, OS_LOG_TYPE_ERROR, " %{public}@ Failed to delete %{public}@ %{public}@ from cache in response to CKErrorChangeTokenExpired, error %{public}@", buf, 0x2Au);
        }
      }
      id v31 = [*(id *)(a1 + 32) configuration];
      uint64_t v32 = [v31 repository];
      uint64_t v33 = [v32 profile];
      uint64_t v34 = [v33 daemon];
      uint64_t v35 = [v34 analyticsSubmissionCoordinator];
      v73 = v29;
      id v36 = v22;
      uint64_t v37 = *(void *)(a1 + 32);
      v38 = [*(id *)(a1 + 40) containerIdentifier];
      [*(id *)(a1 + 48) databaseScope];
      v39 = CKDatabaseScopeString();
      uint64_t v40 = v37;
      v22 = v36;
      id v6 = v74;
      objc_msgSend(v35, "cloudCache_reportCacheDiscrepancyForOperation:reason:containerIdentifier:databaseScope:error:", v40, &stru_1F1728D60, v38, v39, v74);

      id v21 = v75;
      uint64_t v9 = v76;
      id v13 = v78;
    }
    v41 = objc_msgSend(v6, "hd_errorSurfacingFatalCloudKitPartialFailure");
    if (v41)
    {
      id v42 = v21;
      v43 = v9;
      id v44 = v6;
      id v45 = v22;
      id v46 = *(void **)(a1 + 40);
      id v47 = [*(id *)(a1 + 32) configuration];
      uint64_t v48 = [v47 repository];
      uint64_t v49 = [v48 primaryCKContainer];

      BOOL v50 = v46 == v49;
      v22 = v45;
      id v6 = v44;
      uint64_t v9 = v43;
      id v21 = v42;
      id v13 = v78;
      if (v50)
      {
        [*(id *)(*(void *)(a1 + 32) + 104) failTaskWithError:v41];

        goto LABEL_17;
      }
    }

    char v20 = v77;
  }
  if (v20) {
    goto LABEL_16;
  }
  _HKInitializeLogging();
  uint64_t v51 = *v22;
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
  {
    uint64_t v64 = *(void *)(a1 + 32);
    id v63 = *(void **)(a1 + 40);
    uint64_t v65 = v51;
    id v66 = [v63 containerIdentifier];
    [*(id *)(a1 + 48) databaseScope];
    uint64_t v67 = CKDatabaseScopeString();
    *(_DWORD *)buf = 138544386;
    uint64_t v82 = v64;
    __int16 v83 = 2080;
    v84 = "-[HDCloudSyncUpdateCachedZonesOperation fetchChangesForContainer:database:]_block_invoke";
    __int16 v85 = 2114;
    id v86 = v66;
    __int16 v87 = 2114;
    id v88 = v67;
    __int16 v89 = 2114;
    id v90 = v21;
    _os_log_error_impl(&dword_1BCB7D000, v65, OS_LOG_TYPE_ERROR, "%{public}@ %s@: Failed to cache zones for container %{public}@, database %{public}@, %{public}@", buf, 0x34u);
  }
  uint64_t v52 = *(void **)(a1 + 40);
  __int16 v53 = [*(id *)(a1 + 32) configuration];
  id v54 = [v53 repository];
  id v55 = [v54 primaryCKContainer];

  if (v52 == v55) {
    [*(id *)(*(void *)(a1 + 32) + 104) failTaskWithError:v21];
  }
  else {
LABEL_16:
  }
    [*(id *)(*(void *)(a1 + 32) + 104) finishTask];
LABEL_17:
}

uint64_t __151__HDCloudSyncUpdateCachedZonesOperation__updateCKCachedZonesWithServerChangeToken_recordZonesIDsToAdd_recordZonesIDsToDelete_container_database_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) containsObject:v3];
  if (v4)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v3;
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "\tZone %{public}@ was both modified and deleted and will be ignored.", (uint8_t *)&v7, 0xCu);
    }
  }

  return v4 ^ 1u;
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  BOOL v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(HDCloudSyncOperation *)self finishWithSuccess:v5 error:v7];
}

- (HDSynchronousTaskGroup)taskGroup
{
  return self->_taskGroup;
}

- (void).cxx_destruct
{
}

@end