@interface HDCloudSyncRepairStoreRecordsOperation
+ (BOOL)shouldLogAtOperationStart;
- (void)_repairRecordsForContainer:(void *)a3 database:;
- (void)_repairStoreRecordWithRandomOwnerIdentifier:(uint64_t)a1;
- (void)main;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncRepairStoreRecordsOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void)main
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
  taskGroup = self->_taskGroup;
  self->_taskGroup = v3;

  [(HDSynchronousTaskGroup *)self->_taskGroup setDelegate:self];
  [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(HDCloudSyncOperation *)self configuration];
  v6 = [v5 repository];
  v7 = [v6 allCKContainers];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v13 = [v12 privateCloudDatabase];
        -[HDCloudSyncRepairStoreRecordsOperation _repairRecordsForContainer:database:](self, v12, v13);

        v14 = [v12 sharedCloudDatabase];
        -[HDCloudSyncRepairStoreRecordsOperation _repairRecordsForContainer:database:](self, v12, v14);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [(HDSynchronousTaskGroup *)self->_taskGroup finishTask];
}

- (void)_repairRecordsForContainer:(void *)a3 database:
{
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = [a1 configuration];
    uint64_t v9 = [v8 cachedCloudState];
    uint64_t v10 = [v5 containerIdentifier];
    id v123 = 0;
    v11 = objc_msgSend(v9, "zoneIdentifiersForContainerIdentifier:databaseScope:error:", v10, objc_msgSend(v6, "databaseScope"), &v123);
    id v12 = v123;

    id v100 = v12;
    v94 = v11;
    if (!v11 && v12)
    {
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x1E4F29FA8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
LABEL_74:

        goto LABEL_75;
      }
      v14 = v13;
      long long v15 = [v5 containerIdentifier];
      [v6 databaseScope];
      long long v16 = CKDatabaseScopeString();
      *(_DWORD *)buf = 138544130;
      v145 = a1;
      __int16 v146 = 2114;
      uint64_t v147 = (uint64_t)v15;
      __int16 v148 = 2114;
      v149 = v16;
      __int16 v150 = 2114;
      id v151 = v12;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get zone identifiers for container %{public}@, database %{public}@, %{public}@", buf, 0x2Au);
      goto LABEL_77;
    }
    if (!v11)
    {
      _HKInitializeLogging();
      v92 = (void *)*MEMORY[0x1E4F29FA8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG)) {
        goto LABEL_74;
      }
      v14 = v92;
      long long v15 = [v5 containerIdentifier];
      [v6 databaseScope];
      long long v16 = CKDatabaseScopeString();
      *(_DWORD *)buf = 138543874;
      v145 = a1;
      __int16 v146 = 2114;
      uint64_t v147 = (uint64_t)v15;
      __int16 v148 = 2114;
      v149 = v16;
      _os_log_debug_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ No zones cached for container %{public}@, database %{public}@", buf, 0x20u);
LABEL_77:

LABEL_72:
      goto LABEL_74;
    }
    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    obuint64_t j = v11;
    long long v17 = v5;
    id v95 = v7;
    id v96 = v5;
    v93 = v6;
    uint64_t v101 = [obj countByEnumeratingWithState:&v119 objects:v130 count:16];
    if (!v101)
    {
LABEL_57:

      v14 = v7;
      id v5 = v17;
      id v69 = v17;
      id v6 = v93;
      id v70 = v93;
      if (v14 && [v14 count])
      {
        _HKInitializeLogging();
        v71 = (os_log_t *)MEMORY[0x1E4F29FA8];
        v72 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          v73 = v72;
          uint64_t v74 = [v14 count];
          v75 = [v69 containerIdentifier];
          v76 = HDCKDatabaseScopeToString([v70 databaseScope]);
          *(_DWORD *)buf = 138544130;
          v145 = a1;
          __int16 v146 = 2048;
          uint64_t v147 = v74;
          __int16 v148 = 2114;
          v149 = v75;
          __int16 v150 = 2114;
          id v151 = v76;
          _os_log_impl(&dword_1BCB7D000, v73, OS_LOG_TYPE_DEFAULT, "%{public}@: Saving %ld repaired records in %{public}@:%{public}@", buf, 0x2Au);
        }
        id v113 = v70;
        id v115 = v69;
        v77 = (id *)a1;
        long long v133 = 0u;
        long long v134 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        v117 = v14;
        v78 = v14;
        uint64_t v79 = [v78 countByEnumeratingWithState:&v131 objects:buf count:16];
        if (v79)
        {
          uint64_t v80 = v79;
          uint64_t v81 = *(void *)v132;
          do
          {
            for (uint64_t i = 0; i != v80; ++i)
            {
              if (*(void *)v132 != v81) {
                objc_enumerationMutation(v78);
              }
              v83 = *(void **)(*((void *)&v131 + 1) + 8 * i);
              _HKInitializeLogging();
              os_log_t v84 = *v71;
              if (os_log_type_enabled(*v71, OS_LOG_TYPE_DEFAULT))
              {
                v85 = v84;
                v86 = [v83 recordID];
                *(_DWORD *)v135 = 138543618;
                *(void *)&v135[4] = v77;
                *(_WORD *)&v135[12] = 2114;
                *(void *)&v135[14] = v86;
                _os_log_impl(&dword_1BCB7D000, v85, OS_LOG_TYPE_DEFAULT, "%{public}@: Repaired %{public}@", v135, 0x16u);
              }
            }
            uint64_t v80 = [v78 countByEnumeratingWithState:&v131 objects:buf count:16];
          }
          while (v80);
        }

        v87 = v77;
        [v77[13] beginTask];
        v88 = [v78 hk_map:&__block_literal_global_177];
        v89 = [HDCloudSyncModifyRecordsOperation alloc];
        v90 = [v77 configuration];
        id v69 = v115;
        v91 = [(HDCloudSyncModifyRecordsOperation *)v89 initWithConfiguration:v90 container:v115 recordsToSave:v88 recordIDsToDelete:0];

        *(void *)v135 = MEMORY[0x1E4F143A8];
        *(void *)&v135[8] = 3221225472;
        *(void *)&v135[16] = __82__HDCloudSyncRepairStoreRecordsOperation__saveRepairedRecords_container_database___block_invoke_2;
        *(void *)&v135[24] = &unk_1E62F2950;
        *(void *)&long long v136 = v87;
        [(HDCloudSyncOperation *)v91 setOnError:v135];
        *(void *)&long long v124 = MEMORY[0x1E4F143A8];
        *((void *)&v124 + 1) = 3221225472;
        *(void *)&long long v125 = __82__HDCloudSyncRepairStoreRecordsOperation__saveRepairedRecords_container_database___block_invoke_3;
        *((void *)&v125 + 1) = &unk_1E62F2928;
        *(void *)&long long v126 = v87;
        [(HDCloudSyncOperation *)v91 setOnSuccess:&v124];
        [(HDCloudSyncOperation *)v91 start];

        id v7 = v95;
        id v5 = v96;
        id v6 = v93;
        id v12 = v100;
        v14 = v117;
        id v70 = v113;
      }

      goto LABEL_72;
    }
    uint64_t v99 = *(void *)v120;
    long long v18 = (os_log_t *)MEMORY[0x1E4F29FA8];
    uint64_t v104 = (uint64_t)a1;
LABEL_9:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v120 != v99) {
        objc_enumerationMutation(obj);
      }
      uint64_t v103 = v19;
      id v20 = *(id *)(*((void *)&v119 + 1) + 8 * v19);
      id v106 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v21 = [HDCloudSyncCachedZone alloc];
      v22 = [a1 configuration];
      v23 = [v22 repository];
      v24 = [a1 configuration];
      v25 = [v24 accessibilityAssertion];
      id v107 = v20;
      id v26 = [(HDCloudSyncCachedZone *)v21 initForZoneIdentifier:v20 repository:v23 accessibilityAssertion:v25];

      v27 = v26;
      uint64_t v28 = objc_opt_class();
      id v128 = 0;
      v29 = [v26 recordsForClass:v28 error:&v128];
      id v30 = v128;
      BOOL v31 = v29 || v30 == 0;
      v102 = v30;
      if (v31) {
        break;
      }
      id v64 = v30;
      _HKInitializeLogging();
      os_log_t v65 = *v18;
      if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
      {
        v67 = v65;
        v68 = [v27 zoneIdentifier];
        *(_DWORD *)buf = 138543874;
        v145 = a1;
        __int16 v146 = 2114;
        uint64_t v147 = (uint64_t)v68;
        __int16 v148 = 2114;
        v149 = v64;
        _os_log_error_impl(&dword_1BCB7D000, v67, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get store records for %{public}@, %{public}@", buf, 0x20u);
      }
LABEL_54:
      id v62 = 0;
      uint64_t v63 = v103;
      v33 = v106;
      v32 = v107;
LABEL_55:

      [v7 addObjectsFromArray:v62];
      uint64_t v19 = v63 + 1;
      id v12 = v100;
      if (v19 == v101)
      {
        uint64_t v101 = [obj countByEnumeratingWithState:&v119 objects:v130 count:16];
        if (!v101) {
          goto LABEL_57;
        }
        goto LABEL_9;
      }
    }
    if (!v29) {
      goto LABEL_54;
    }
    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    v98 = v29;
    id v111 = v29;
    v33 = v106;
    v32 = v107;
    uint64_t v116 = [v111 countByEnumeratingWithState:&v124 objects:&v131 count:16];
    if (!v116) {
      goto LABEL_51;
    }
    uint64_t v114 = *(void *)v125;
    v105 = v26;
LABEL_20:
    uint64_t v34 = 0;
    while (1)
    {
      if (*(void *)v125 != v114) {
        objc_enumerationMutation(v111);
      }
      id v35 = *(id *)(*((void *)&v124 + 1) + 8 * v34);
      v36 = [v35 ownerIdentifier];

      if (v36) {
        goto LABEL_49;
      }
      if ([v32 type] != 2) {
        break;
      }
      id v118 = v35;
      id v37 = v27;
      uint64_t v38 = objc_opt_class();
      id v129 = 0;
      v110 = v37;
      v39 = [v37 recordsForClass:v38 error:&v129];
      id v40 = v129;
      v109 = v40;
      if (v39 || !v40)
      {
        if (v39)
        {
          v108 = v39;
          if ((unint64_t)[v39 count] >= 2)
          {
            _HKInitializeLogging();
            os_log_t v44 = *v18;
            if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
            {
              v60 = v44;
              v61 = [v110 zoneIdentifier];
              *(_DWORD *)v138 = 138543618;
              uint64_t v139 = (uint64_t)a1;
              __int16 v140 = 2114;
              v141 = v61;
              _os_log_error_impl(&dword_1BCB7D000, v60, OS_LOG_TYPE_ERROR, "%{public}@ Retrieved multiple cached registry records for %{public}@,", v138, 0x16u);
            }
          }
          v45 = objc_msgSend(v39, "firstObject", v93, v94);
          v46 = [v45 ownerIdentifiers];
          memset(v135, 0, sizeof(v135));
          long long v136 = 0u;
          long long v137 = 0u;
          id v112 = v46;
          uint64_t v47 = [v112 countByEnumeratingWithState:v135 objects:buf count:16];
          if (v47)
          {
            uint64_t v48 = v47;
            uint64_t v49 = **(void **)&v135[16];
            while (2)
            {
              for (uint64_t j = 0; j != v48; ++j)
              {
                if (**(void **)&v135[16] != v49) {
                  objc_enumerationMutation(v112);
                }
                v51 = *(void **)(*(void *)&v135[8] + 8 * j);
                v52 = [v45 storeIdentifiersForOwnerIdentifier:v51];
                v53 = [v118 storeIdentifier];
                int v54 = [v52 containsObject:v53];

                if (v54)
                {
                  _HKInitializeLogging();
                  long long v18 = (os_log_t *)MEMORY[0x1E4F29FA8];
                  v57 = (void *)*MEMORY[0x1E4F29FA8];
                  a1 = (void *)v104;
                  v56 = v118;
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
                  {
                    v58 = v57;
                    v59 = [v118 storeIdentifier];
                    *(_DWORD *)v138 = 138543874;
                    uint64_t v139 = v104;
                    __int16 v140 = 2114;
                    v141 = v59;
                    __int16 v142 = 2114;
                    v143 = v51;
                    _os_log_impl(&dword_1BCB7D000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@: Found broken store identifier %{public}@ in set for owner %{public}@; repairing.",
                      v138,
                      0x20u);
                  }
                  [v118 repairOwnerIdentifier:v51];
                  [v118 setRepaired:1];
                  v55 = v112;

                  goto LABEL_47;
                }
              }
              uint64_t v48 = [v112 countByEnumeratingWithState:v135 objects:buf count:16];
              if (v48) {
                continue;
              }
              break;
            }
          }
          v55 = v112;

          a1 = (void *)v104;
          v56 = v118;
          -[HDCloudSyncRepairStoreRecordsOperation _repairStoreRecordWithRandomOwnerIdentifier:](v104, v118);
          long long v18 = (os_log_t *)MEMORY[0x1E4F29FA8];
LABEL_47:

          v33 = v106;
          v32 = v107;
          v27 = v105;
          goto LABEL_48;
        }
      }
      else
      {
        _HKInitializeLogging();
        os_log_t v41 = *v18;
        if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
        {
          v42 = v41;
          v43 = [v110 zoneIdentifier];
          *(_DWORD *)v138 = 138543874;
          uint64_t v139 = (uint64_t)a1;
          __int16 v140 = 2114;
          v141 = v43;
          __int16 v142 = 2114;
          v143 = v109;
          _os_log_error_impl(&dword_1BCB7D000, v42, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get registry records for %{public}@, %{public}@", v138, 0x20u);

          v27 = v105;
        }
      }

LABEL_49:
      if (++v34 == v116)
      {
        uint64_t v116 = [v111 countByEnumeratingWithState:&v124 objects:&v131 count:16];
        if (!v116)
        {
LABEL_51:

          id v62 = v33;
          id v7 = v95;
          long long v17 = v96;
          uint64_t v63 = v103;
          v29 = v98;
          goto LABEL_55;
        }
        goto LABEL_20;
      }
    }
    -[HDCloudSyncRepairStoreRecordsOperation _repairStoreRecordWithRandomOwnerIdentifier:]((uint64_t)a1, v35);
LABEL_48:
    objc_msgSend(v33, "addObject:", v35, v93);
    goto LABEL_49;
  }
LABEL_75:
}

- (void)_repairStoreRecordWithRandomOwnerIdentifier:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = [v3 storeIdentifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = a1;
    __int16 v17 = 2114;
    long long v18 = v6;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Repairing broken store record with identifier %{public}@ by generating random owner identifier.", buf, 0x16u);
  }
  id v7 = NSString;
  uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v9 = [v8 UUIDString];
  uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
  v11 = [v10 UUIDString];
  id v12 = [MEMORY[0x1E4F29128] UUID];
  v13 = [v12 UUIDString];
  v14 = [v7 stringWithFormat:@"%@:%@:%@", v9, v11, v13];
  [v3 repairOwnerIdentifier:v14];

  [v3 setRepaired:1];
}

uint64_t __82__HDCloudSyncRepairStoreRecordsOperation__saveRepairedRecords_container_database___block_invoke(uint64_t a1, void *a2)
{
  return [a2 record];
}

uint64_t __82__HDCloudSyncRepairStoreRecordsOperation__saveRepairedRecords_container_database___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "failTaskWithError:");
}

uint64_t __82__HDCloudSyncRepairStoreRecordsOperation__saveRepairedRecords_container_database___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) finishTask];
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