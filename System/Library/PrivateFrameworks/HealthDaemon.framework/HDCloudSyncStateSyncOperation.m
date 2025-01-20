@interface HDCloudSyncStateSyncOperation
- (HDCloudSyncStateSyncOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncStateSyncOperation)initWithConfiguration:(id)a3 containers:(id)a4;
- (id)stateDataForStateSyncZone:(void *)a1;
- (void)_notifyStateEntities:(void *)a3 stateSyncZones:;
- (void)main;
@end

@implementation HDCloudSyncStateSyncOperation

- (HDCloudSyncStateSyncOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncStateSyncOperation)initWithConfiguration:(id)a3 containers:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDCloudSyncStateSyncOperation;
  v8 = [(HDCloudSyncOperation *)&v12 initWithConfiguration:a3 cloudState:0];
  if (v8)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    recordsToBeSaved = v8->_recordsToBeSaved;
    v8->_recordsToBeSaved = v9;

    objc_storeStrong((id *)&v8->_containers, a4);
  }

  return v8;
}

- (void)main
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 cachedCloudState];
  containers = self->_containers;
  id v45 = 0;
  uint64_t v6 = [v4 zonesByIdentifierForContainers:containers error:&v45 filter:&__block_literal_global_112];
  id v7 = v45;

  if (v6)
  {
    id v37 = v7;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __37__HDCloudSyncStateSyncOperation_main__block_invoke_286;
    v43[3] = &unk_1E62F5D48;
    v40 = self;
    v43[4] = self;
    v38 = v6;
    id v44 = v6;
    id v8 = v44;
    v9 = v43;
    id v10 = objc_alloc_init(MEMORY[0x1E4F65D90]);
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __69__HDCloudSyncStateSyncOperation__performStateSyncInZones_completion___block_invoke;
    v57[3] = &unk_1E62F4EB8;
    v36 = v9;
    id v58 = v36;
    [v10 setDidFinish:v57];
    [v10 beginTask];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v11 = v8;
    uint64_t v42 = [v11 countByEnumeratingWithState:&v53 objects:v63 count:16];
    if (v42)
    {
      uint64_t v12 = *(void *)v54;
      id v39 = v11;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v54 != v12) {
            objc_enumerationMutation(v11);
          }
          v14 = *(void **)(*((void *)&v53 + 1) + 8 * v13);
          [v10 beginTask];
          v15 = [v11 objectForKeyedSubscript:v14];
          v16 = [v14 zoneIdentifier];
          id v51 = 0;
          id v52 = 0;
          int v17 = objc_msgSend(v16, "hd_isStateSyncZoneIDForSyncCircleIdentifier:domain:", &v52, &v51);
          id v18 = v52;
          id v19 = v51;

          if (v17) {
            BOOL v20 = v19 == 0;
          }
          else {
            BOOL v20 = 1;
          }
          if (v20)
          {
            v21 = (void *)MEMORY[0x1E4F28C58];
            v22 = [NSString stringWithFormat:@"Unable to extract domain and sync circle identifier from %@.", v15];
            v30 = objc_msgSend(v21, "hk_error:description:", 738, v22);

            _HKInitializeLogging();
            v23 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v60 = v40;
              __int16 v61 = 2114;
              v62 = v30;
              _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "%{public}@: Error processing zone :%{public}@", buf, 0x16u);
            }
            [v10 failTaskWithError:v30];
          }
          else
          {
            v24 = [HDCloudSyncStateStore alloc];
            v25 = -[HDCloudSyncStateSyncOperation stateDataForStateSyncZone:](v15);
            v26 = [(HDCloudSyncStateStore *)v24 initWithData:v25];

            v27 = [(HDCloudSyncOperation *)v40 configuration];
            v28 = [v27 repository];
            [v28 cloudSyncShimProvider];
            v29 = id v41 = v18;
            v30 = [v29 stateSyncShim];

            v31 = [(HDCloudSyncOperation *)v40 configuration];
            v46[0] = MEMORY[0x1E4F143A8];
            v46[1] = 3221225472;
            v46[2] = __69__HDCloudSyncStateSyncOperation__performStateSyncInZones_completion___block_invoke_298;
            v46[3] = &unk_1E63017E8;
            v46[4] = v40;
            id v32 = v19;
            id v47 = v32;
            id v48 = v10;
            v49 = v26;
            id v50 = v15;
            v33 = v26;
            id v34 = v32;
            id v18 = v41;
            [v30 mergeStateDataWithStore:v33 domain:v34 configuration:v31 completion:v46];

            id v11 = v39;
          }

          ++v13;
        }
        while (v42 != v13);
        uint64_t v42 = [v11 countByEnumeratingWithState:&v53 objects:v63 count:16];
      }
      while (v42);
    }

    [v10 finishTask];
    id v7 = v37;
    uint64_t v6 = v38;
  }
  else
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 739, @"No State Sync Zones present");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    _HKInitializeLogging();
    v35 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v63 = 138543618;
      v64 = self;
      __int16 v65 = 2114;
      id v66 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching state sync zones :%{public}@", v63, 0x16u);
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v7];
  }
}

BOOL __37__HDCloudSyncStateSyncOperation_main__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 6;
}

void __37__HDCloudSyncStateSyncOperation_main__block_invoke_286(uint64_t a1, char a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    id v7 = *(id **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    if (v7)
    {
      if ([v7[13] count])
      {
        v9 = [HDCloudSyncModifyRecordsOperation alloc];
        id v10 = [v7 configuration];
        id v11 = [v7 configuration];
        uint64_t v12 = [v11 repository];
        uint64_t v13 = [v12 primaryCKContainer];
        v14 = [(HDCloudSyncModifyRecordsOperation *)v9 initWithConfiguration:v10 container:v13 recordsToSave:v7[13] recordIDsToDelete:0];

        v15 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v20 = MEMORY[0x1E4F143A8];
        uint64_t v21 = 3221225472;
        v22 = __66__HDCloudSyncStateSyncOperation__pushUpdatedStateRecordsForZones___block_invoke;
        v23 = &unk_1E62F6020;
        v24 = v7;
        id v16 = v8;
        id v25 = v16;
        [(HDCloudSyncOperation *)v14 setOnError:&v20];
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __66__HDCloudSyncStateSyncOperation__pushUpdatedStateRecordsForZones___block_invoke_310;
        v27 = &unk_1E62F6048;
        v28 = v7;
        id v29 = v15;
        id v30 = v16;
        id v17 = v15;
        -[HDCloudSyncOperation setOnSuccess:](v14, "setOnSuccess:", buf, v20, v21, v22, v23, v24);
        [(HDCloudSyncOperation *)v14 start];
      }
      else
      {
        -[HDCloudSyncStateSyncOperation _notifyStateEntities:stateSyncZones:](v7, 1u, v8);
        [v7 finishWithSuccess:1 error:0];
      }
    }
  }
  else
  {
    if (!v5)
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 738, @"Error processing state");
    }
    _HKInitializeLogging();
    id v18 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);
    }
    -[HDCloudSyncStateSyncOperation _notifyStateEntities:stateSyncZones:](*(void **)(a1 + 32), 0, *(void **)(a1 + 40));
    [*(id *)(a1 + 32) finishWithSuccess:0 error:v6];
  }
}

- (void)_notifyStateEntities:(void *)a3 stateSyncZones:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (a1)
  {
    id v5 = [a1 configuration];
    uint64_t v6 = [v5 repository];
    id v7 = [v6 cloudSyncShimProvider];
    id v29 = [v7 stateSyncShim];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v27 = v4;
    id v8 = v4;
    uint64_t v30 = [v8 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v30)
    {
      v9 = a1;
      uint64_t v10 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v13 = [v12 zoneIdentifier];
          id v32 = 0;
          id v33 = 0;
          int v14 = objc_msgSend(v13, "hd_isStateSyncZoneIDForSyncCircleIdentifier:domain:", &v33, &v32);
          id v15 = v33;
          id v16 = v32;

          if (v14) {
            BOOL v17 = v16 == 0;
          }
          else {
            BOOL v17 = 1;
          }
          if (v17)
          {
            id v18 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v19 = [NSString stringWithFormat:@"Unable to extract domain and sync circle identifier from %@.", v12];
            objc_msgSend(v18, "hk_error:description:", 738, v19);
            v26 = (HDCloudSyncStateStore *)objc_claimAutoreleasedReturnValue();

            _HKInitializeLogging();
            uint64_t v20 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              id v39 = v9;
              __int16 v40 = 2114;
              id v41 = v26;
              _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Error notifying state entity :%{public}@", buf, 0x16u);
            }
          }
          else
          {
            uint64_t v21 = [HDCloudSyncStateStore alloc];
            v22 = [v8 objectForKeyedSubscript:v12];
            -[HDCloudSyncStateSyncOperation stateDataForStateSyncZone:](v22);
            id v23 = v8;
            id v25 = v24 = v9;
            v26 = [(HDCloudSyncStateStore *)v21 initWithData:v25];

            v9 = v24;
            id v8 = v23;

            v31[0] = MEMORY[0x1E4F143A8];
            v31[1] = 3221225472;
            v31[2] = __69__HDCloudSyncStateSyncOperation__notifyStateEntities_stateSyncZones___block_invoke;
            v31[3] = &unk_1E62F2978;
            v31[4] = v9;
            [v29 syncDidFinishWithResult:a2 domain:v16 stateStore:v26 completion:v31];
          }
        }
        uint64_t v30 = [v8 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v30);
    }

    id v4 = v27;
  }
}

void __69__HDCloudSyncStateSyncOperation__performStateSyncInZones_completion___block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a3)
  {
    id v5 = *(void (**)(uint64_t, uint64_t, void))(v4 + 16);
    uint64_t v6 = *(void *)(a1 + 32);
    v5(v6, 1, 0);
  }
  else
  {
    id v7 = [a4 firstObject];
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v7);
  }
}

- (id)stateDataForStateSyncZone:(void *)a1
{
  v1 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  uint64_t v4 = objc_opt_class();
  id v10 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__HDCloudSyncStateSyncOperation_stateDataForStateSyncZone___block_invoke;
  v8[3] = &unk_1E6301838;
  id v5 = v3;
  id v9 = v5;
  [v2 recordsForClass:v4 epoch:0 error:&v10 enumerationHandler:v8];

  id v6 = v10;

  return v5;
}

void __69__HDCloudSyncStateSyncOperation__performStateSyncInZones_completion___block_invoke_298(uint64_t a1, char a2, void *a3)
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = *(id **)(a1 + 32);
    id v7 = *(void **)(a1 + 56);
    id v8 = *(void **)(a1 + 64);
    id v71 = 0;
    id v9 = v7;
    id v10 = v8;
    id v66 = v6;
    if (!v6) {
      goto LABEL_54;
    }
    uint64_t v11 = [v9 mergedData];
    if (!v11) {
      goto LABEL_47;
    }
    uint64_t v12 = (void *)v11;
    [v9 mergedData];
    uint64_t v13 = v65 = v10;
    uint64_t v14 = [v13 count];

    id v10 = v65;
    if (!v14)
    {
LABEL_47:
      _HKInitializeLogging();
      long long v54 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v83 = 138543618;
        v84 = v66;
        __int16 v85 = 2114;
        id v86 = v9;
        _os_log_debug_impl(&dword_1BCB7D000, v54, OS_LOG_TYPE_DEBUG, "%{public}@: Store %{public}@ has no data to be pushed", v83, 0x16u);
      }
      LOBYTE(v6) = 1;
      goto LABEL_54;
    }
    id v15 = v66[14];
    if ([v15 count] == 1)
    {
      id v16 = [v15 anyObject];
      if (v16)
      {
        uint64_t v62 = a1;
        id v63 = v5;
        BOOL v17 = [v66 configuration];
        id v18 = [v17 repository];
        uint64_t v19 = [v18 primaryCKContainer];
        uint64_t v20 = [v19 containerIdentifier];

        if (v20)
        {
          uint64_t v21 = [v16 containerIdentifier];
          char v22 = [v21 isEqualToString:v20];

          id v10 = v65;
          if (v22)
          {
            long long v75 = 0u;
            long long v76 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            id v23 = [v9 mergedData];
            v24 = [v23 allKeys];

            uint64_t v70 = [v24 countByEnumeratingWithState:&v73 objects:v83 count:16];
            if (!v70)
            {
              char v68 = 1;
              goto LABEL_62;
            }
            char v68 = 1;
            uint64_t v69 = *(void *)v74;
            id v25 = v66;
            uint64_t v67 = v24;
            id v64 = v9;
            while (1)
            {
              for (uint64_t i = 0; i != v70; ++i)
              {
                if (*(void *)v74 != v69) {
                  objc_enumerationMutation(v24);
                }
                id v27 = *(id **)(*((void *)&v73 + 1) + 8 * i);
                uint64_t v28 = objc_opt_class();
                v72[0] = MEMORY[0x1E4F143A8];
                v72[1] = 3221225472;
                v72[2] = __74__HDCloudSyncStateSyncOperation__updateRecordsToSaveWithStore_zone_error___block_invoke;
                v72[3] = &unk_1E6301810;
                v72[4] = v27;
                id v29 = [v10 recordsForClass:v28 error:&v71 filter:v72];
                uint64_t v30 = v29;
                if (!v29)
                {
                  char v68 = 0;
                  goto LABEL_41;
                }
                if ((unint64_t)[v29 count] >= 2)
                {
                  _HKInitializeLogging();
                  uint64_t v31 = *MEMORY[0x1E4F29FA8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v78 = v27;
                    _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "Expected one record per key. Multiple records for key: %@", buf, 0xCu);
                  }
                  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 738, @"Expected one record per key. Multiple records for key: %@", v27);
                  id v32 = (id)objc_claimAutoreleasedReturnValue();
                  if (v32)
                  {
                    id v33 = v32;
                    char v68 = 0;
                    id v71 = v33;
                    long long v34 = v33;
                  }
                  else
                  {
                    id v33 = 0;
                    long long v34 = 0;
                    char v68 = 0;
                  }
                  goto LABEL_39;
                }
                long long v35 = [v9 mergedData];
                long long v34 = [v35 objectForKeyedSubscript:v27];

                if (!v34)
                {
                  _HKInitializeLogging();
                  uint64_t v43 = *MEMORY[0x1E4F29FA8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v78 = v27;
                    _os_log_error_impl(&dword_1BCB7D000, v43, OS_LOG_TYPE_ERROR, "Nil merged data for key %@", buf, 0xCu);
                  }
                  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 738, @"Nil merged data for key %@", v27);
                  id v44 = (id)objc_claimAutoreleasedReturnValue();
                  if (v44)
                  {
                    id v45 = v44;
                    char v68 = 0;
                    id v71 = v45;
                    id v33 = v45;
                  }
                  else
                  {
                    id v45 = 0;
                    id v33 = 0;
                    char v68 = 0;
                  }
LABEL_38:

LABEL_39:
                  goto LABEL_40;
                }
                if ((unint64_t)[v34 length] >> 11 >= 0x19)
                {
                  _HKInitializeLogging();
                  long long v36 = (void *)*MEMORY[0x1E4F29FA8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                  {
                    id v51 = v36;
                    uint64_t v52 = [v34 length];
                    *(_DWORD *)buf = 138543874;
                    v78 = v25;
                    __int16 v79 = 2050;
                    uint64_t v80 = v52;
                    __int16 v81 = 2050;
                    uint64_t v82 = 51200;
                    _os_log_error_impl(&dword_1BCB7D000, v51, OS_LOG_TYPE_ERROR, "[%{public}@] Record size: %{public}lu exceeds soft size limit: %{public}lu", buf, 0x20u);
                  }
                  long long v37 = [v25 profile];
                  v38 = [v37 daemon];
                  id v39 = [v38 analyticsSubmissionCoordinator];
                  objc_msgSend(v39, "stateSync_recordSize:", objc_msgSend(v34, "length"));

                  v24 = v67;
                }
                if ([v30 count])
                {
                  uint64_t v40 = [v30 firstObject];
                  if (v40)
                  {
                    id v33 = (id)v40;
                    id v41 = [v9 mergedData];
                    uint64_t v42 = [v41 objectForKeyedSubscript:v27];
                    [v33 setStateData:v42];

LABEL_35:
                    id v50 = v25[13];
                    id v45 = [v33 record];
                    [v50 addObject:v45];
                    goto LABEL_38;
                  }
                }
                else
                {
                  v46 = [v9 mergedData];
                  id v47 = [v46 objectForKeyedSubscript:v27];
                  id v48 = [v10 zoneIdentifier];
                  v49 = [v48 zoneIdentifier];
                  id v33 = +[HDCloudSyncStateRecord recordWithStateData:v47 zoneID:v49 recordIdentifier:v27 error:&v71];

                  id v25 = v66;
                  id v10 = v65;

                  id v9 = v64;
                  v24 = v67;
                  if (v33) {
                    goto LABEL_35;
                  }
                }
                char v68 = 0;
LABEL_40:

LABEL_41:
              }
              uint64_t v70 = [v24 countByEnumeratingWithState:&v73 objects:v83 count:16];
              if (!v70)
              {
LABEL_62:

                a1 = v62;
                id v5 = v63;
                LOBYTE(v6) = v68;
                goto LABEL_54;
              }
            }
          }
          goto LABEL_52;
        }
      }

      id v10 = v65;
    }

LABEL_52:
    _HKInitializeLogging();
    v57 = *MEMORY[0x1E4F29FA8];
    LOBYTE(v6) = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v83 = 138543618;
      v84 = v66;
      __int16 v85 = 2114;
      id v86 = v9;
      _os_log_impl(&dword_1BCB7D000, v57, OS_LOG_TYPE_INFO, "%{public}@: Store %{public}@ is from a secondary container which is not pushed.", v83, 0x16u);
    }
LABEL_54:

    id v58 = v71;
    if (v6)
    {
      [*(id *)(a1 + 48) finishTask];
    }
    else
    {
      _HKInitializeLogging();
      v59 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        v60 = *(id **)(a1 + 32);
        __int16 v61 = *(void **)(a1 + 40);
        *(_DWORD *)v83 = 138543874;
        v84 = v60;
        __int16 v85 = 2114;
        id v86 = v58;
        __int16 v87 = 2114;
        id v88 = v61;
        _os_log_error_impl(&dword_1BCB7D000, v59, OS_LOG_TYPE_ERROR, "%{public}@: Error creating record %{public}@ for %{public}@", v83, 0x20u);
      }
      [*(id *)(a1 + 48) failTaskWithError:v58];
    }

    goto LABEL_60;
  }
  _HKInitializeLogging();
  long long v53 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    long long v55 = *(id **)(a1 + 32);
    long long v56 = *(void **)(a1 + 40);
    *(_DWORD *)v83 = 138543874;
    v84 = v55;
    __int16 v85 = 2114;
    id v86 = v56;
    __int16 v87 = 2114;
    id v88 = v5;
    _os_log_error_impl(&dword_1BCB7D000, v53, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ Ignorable failure to update data %{public}@", v83, 0x20u);
  }
  [*(id *)(a1 + 48) finishTask];
LABEL_60:
}

uint64_t __74__HDCloudSyncStateSyncOperation__updateRecordsToSaveWithStore_zone_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 key];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

void __66__HDCloudSyncStateSyncOperation__pushUpdatedStateRecordsForZones___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  _HKInitializeLogging();
  id v7 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138543618;
    uint64_t v13 = v11;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to modify records: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) profile];
  id v9 = [v8 daemon];
  id v10 = [v9 analyticsSubmissionCoordinator];
  objc_msgSend(v10, "stateSync_operationFailed:error:", v6, v5);

  -[HDCloudSyncStateSyncOperation _notifyStateEntities:stateSyncZones:](*(void **)(a1 + 32), 0, *(void **)(a1 + 40));
  [*(id *)(a1 + 32) finishWithSuccess:0 error:v5];
}

uint64_t __66__HDCloudSyncStateSyncOperation__pushUpdatedStateRecordsForZones___block_invoke_310(id *a1, void *a2)
{
  id v3 = a1[4];
  id v4 = a2;
  id v5 = [v3 profile];
  id v6 = [v5 daemon];
  id v7 = [v6 analyticsSubmissionCoordinator];
  [a1[5] timeIntervalSinceNow];
  objc_msgSend(v7, "stateSync_triggerDuration:");

  id v8 = [a1[4] profile];
  id v9 = [v8 daemon];
  id v10 = [v9 analyticsSubmissionCoordinator];
  objc_msgSend(v10, "stateSync_operationSucceeded:", v4);

  -[HDCloudSyncStateSyncOperation _notifyStateEntities:stateSyncZones:](a1[4], 1u, a1[6]);
  id v11 = a1[4];

  return [v11 finishWithSuccess:1 error:0];
}

void __69__HDCloudSyncStateSyncOperation__notifyStateEntities_stateSyncZones___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Error notifying state entity :%{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

uint64_t __59__HDCloudSyncStateSyncOperation_stateDataForStateSyncZone___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = [v6 key];
  int v8 = [*(id *)(a1 + 32) objectForKey:v7];
  if (v8)
  {
    _HKInitializeLogging();
    uint64_t v9 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v7;
      _os_log_fault_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_FAULT, "Expected one record per key. Multiple records for key: %@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 738, @"Expected one record per key. Multiple records for key: %@", v7);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }

LABEL_16:
    uint64_t v13 = 0;
    goto LABEL_17;
  }
  if (([v6 hasStateData] & 1) == 0)
  {
    __int16 v14 = (void *)MEMORY[0x1E4F28C58];
    id v10 = [NSString stringWithFormat:@"No state data or state data asset url in %@", v6];
    objc_msgSend(v14, "hk_error:description:", 738, v10);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (a4) {
        *a4 = v15;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_16;
  }
  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = [v6 stateData];
  [v11 setObject:v12 forKey:v7];

  uint64_t v13 = 1;
LABEL_17:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containers, 0);

  objc_storeStrong((id *)&self->_recordsToBeSaved, 0);
}

@end