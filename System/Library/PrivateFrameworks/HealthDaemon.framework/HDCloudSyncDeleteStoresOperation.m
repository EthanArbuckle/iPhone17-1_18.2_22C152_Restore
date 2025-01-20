@interface HDCloudSyncDeleteStoresOperation
- (HDCloudSyncDeleteStoresOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncDeleteStoresOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 storeRecordsToDelete:(id)a5;
- (NSArray)storeRecordsToDelete;
- (void)main;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncDeleteStoresOperation

- (HDCloudSyncDeleteStoresOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncDeleteStoresOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 storeRecordsToDelete:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncDeleteStoresOperation;
  v9 = [(HDCloudSyncOperation *)&v13 initWithConfiguration:a3 cloudState:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    storeRecordsToDelete = v9->_storeRecordsToDelete;
    v9->_storeRecordsToDelete = (NSArray *)v10;
  }
  return v9;
}

- (void)main
{
  v2 = self;
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_storeRecordsToDelete count])
  {
    v3 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = v2->_taskGroup;
    v2->_taskGroup = v3;

    [(HDSynchronousTaskGroup *)v2->_taskGroup setDelegate:v2];
    [(HDSynchronousTaskGroup *)v2->_taskGroup beginTask];
    v5 = [(NSArray *)v2->_storeRecordsToDelete hk_mapToSet:&__block_literal_global_45];
    uint64_t v6 = [(HDCloudSyncOperation *)v2 configuration];
    v7 = [v6 cachedCloudState];
    v118[0] = 0;
    id v8 = [v7 zonesByIdentifierWithError:v118];
    id v9 = v118[0];

    if (v8 || !v9)
    {
      if (!v8)
      {
        _HKInitializeLogging();
        v12 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v2;
          _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ No cached zones found.", buf, 0xCu);
        }
      }
      objc_super v13 = [v8 allValues];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __60__HDCloudSyncDeleteStoresOperation__individualZonesToDelete__block_invoke_282;
      v121 = &unk_1E62F87D0;
      v122 = v2;
      id v123 = v5;
      v11 = objc_msgSend(v13, "hk_map:", buf);
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v10 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v2;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v9;
        _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached zones, %{public}@", buf, 0x16u);
      }
      [(HDCloudSyncOperation *)v2 finishWithSuccess:0 error:v9];
      v11 = 0;
    }

    if ([v11 count])
    {
      [(HDSynchronousTaskGroup *)v2->_taskGroup beginTask];
      v14 = [HDCloudSyncDeleteZonesOperation alloc];
      v15 = [(HDCloudSyncOperation *)v2 configuration];
      v16 = [(HDCloudSyncOperation *)v2 cloudState];
      v17 = [(HDCloudSyncDeleteZonesOperation *)v14 initWithConfiguration:v15 cloudState:v16];

      [(HDCloudSyncDeleteZonesOperation *)v17 setZonesToDelete:v11];
      _HKInitializeLogging();
      v18 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        uint64_t v20 = [v11 count];
        v21 = [v11 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v2;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v20;
        *(_WORD *)&buf[22] = 2112;
        v121 = v21;
        _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting %ld individual sync zones: %@", buf, 0x20u);
      }
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __63__HDCloudSyncDeleteStoresOperation__deleteIndividualZoneStores__block_invoke;
      v121 = &unk_1E62F2950;
      v122 = v2;
      [(HDCloudSyncOperation *)v17 setOnError:buf];
      v118[0] = (id)MEMORY[0x1E4F143A8];
      v118[1] = (id)3221225472;
      v118[2] = __63__HDCloudSyncDeleteStoresOperation__deleteIndividualZoneStores__block_invoke_2;
      v118[3] = &unk_1E62F2928;
      v118[4] = v2;
      [(HDCloudSyncOperation *)v17 setOnSuccess:v118];
      [(HDCloudSyncOperation *)v17 start];
    }
    [(HDSynchronousTaskGroup *)v2->_taskGroup beginTask];
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    v22 = [(HDCloudSyncOperation *)v2 configuration];
    v23 = [v22 repository];
    v24 = [v23 allCKContainers];

    uint64_t v25 = [v24 countByEnumeratingWithState:&v103 objects:v118 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v104;
      uint64_t v86 = *(void *)v104;
      v85 = v24;
      v97 = v2;
      do
      {
        for (uint64_t i = 0; i != v26; uint64_t i = v41 + 1)
        {
          if (*(void *)v104 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v96 = i;
          id v29 = *(id *)(*((void *)&v103 + 1) + 8 * i);
          v30 = [(HDCloudSyncOperation *)v2 configuration];
          v31 = [v30 repository];
          v32 = [v31 cachedOwnerIdentifierForContainer:v29];
          uint64_t v33 = [v32 string];

          v102 = (void *)v33;
          if (v33)
          {
            uint64_t v95 = [(NSArray *)v2->_storeRecordsToDelete hk_mapToSet:&__block_literal_global_298_0];
            v34 = [(HDCloudSyncOperation *)v2 configuration];
            v35 = [v34 cachedCloudState];
            id v94 = v29;
            v36 = [v29 containerIdentifier];
            id v117 = 0;
            uint64_t v37 = [v35 unifiedSyncZoneForContainerID:v36 error:&v117];
            id v38 = v117;

            v39 = (void *)v37;
            v93 = v38;
            if (v37 || !v38)
            {
              v42 = (void *)v95;
              uint64_t v41 = v96;
              if (v39)
              {
                uint64_t v44 = objc_opt_class();
                id v116 = 0;
                v91 = v39;
                v45 = [v39 recordsForClass:v44 error:&v116];
                id v46 = v116;
                v92 = v45;
                if (v45 || !v46)
                {
                  id v89 = v46;
                  if ((unint64_t)[v45 count] >= 2)
                  {
                    _HKInitializeLogging();
                    v50 = (void *)*MEMORY[0x1E4F29FA8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
                    {
                      v80 = v50;
                      v81 = [v39 zoneIdentifier];
                      *(_DWORD *)buf = 138543618;
                      *(void *)&buf[4] = v2;
                      *(_WORD *)&buf[12] = 2114;
                      *(void *)&buf[14] = v81;
                      _os_log_fault_impl(&dword_1BCB7D000, v80, OS_LOG_TYPE_FAULT, "%{public}@ Retrieved multiple registry records for %{public}@. This is unexpected.", buf, 0x16u);
                    }
                  }
                  v100 = [v92 firstObject];
                  uint64_t v51 = objc_opt_class();
                  id v115 = 0;
                  v52 = [v91 recordsForClass:v51 error:&v115];
                  id v53 = v115;
                  v90 = v52;
                  if (v52 || !v53)
                  {
                    id v88 = v53;
                    v56 = objc_msgSend(v52, "hk_mapToSet:", &__block_literal_global_303);
                    if ([v56 intersectsSet:v95])
                    {
                      uint64_t v87 = v26;
                      id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                      long long v111 = 0u;
                      long long v112 = 0u;
                      long long v113 = 0u;
                      long long v114 = 0u;
                      obuint64_t j = v2->_storeRecordsToDelete;
                      uint64_t v58 = [(NSArray *)obj countByEnumeratingWithState:&v111 objects:buf count:16];
                      if (v58)
                      {
                        uint64_t v59 = v58;
                        uint64_t v60 = *(void *)v112;
                        uint64_t v98 = *(void *)v112;
                        v99 = v56;
                        do
                        {
                          for (uint64_t j = 0; j != v59; ++j)
                          {
                            if (*(void *)v112 != v60) {
                              objc_enumerationMutation(obj);
                            }
                            v62 = *(void **)(*((void *)&v111 + 1) + 8 * j);
                            v63 = [v62 storeIdentifier];
                            if ([v56 containsObject:v63])
                            {
                              v64 = [(HDCloudSyncOperation *)v2 configuration];
                              v65 = [v64 repository];
                              v66 = [v65 syncIdentityManager];
                              [v66 currentSyncIdentity];
                              v68 = v67 = v57;
                              v69 = [v68 identity];
                              [v100 removeStoreIdentifier:v63 ownerIdentifier:v102 syncIdentity:v69];

                              id v57 = v67;
                              v2 = v97;

                              v56 = v99;
                              v70 = [v62 recordID];
                              [v67 addObject:v70];

                              uint64_t v60 = v98;
                            }
                          }
                          uint64_t v59 = [(NSArray *)obj countByEnumeratingWithState:&v111 objects:buf count:16];
                        }
                        while (v59);
                      }

                      [(HDSynchronousTaskGroup *)v2->_taskGroup beginTask];
                      v71 = [HDCloudSyncModifyRecordsOperation alloc];
                      v72 = [(HDCloudSyncOperation *)v2 configuration];
                      if (v100)
                      {
                        v73 = [v100 record];
                        v119 = v73;
                        [MEMORY[0x1E4F1C978] arrayWithObjects:&v119 count:1];
                        v75 = id v74 = v57;
                        v76 = v94;
                        v77 = [(HDCloudSyncModifyRecordsOperation *)v71 initWithConfiguration:v72 container:v94 recordsToSave:v75 recordIDsToDelete:v74];

                        id v57 = v74;
                      }
                      else
                      {
                        v76 = v94;
                        v77 = [(HDCloudSyncModifyRecordsOperation *)v71 initWithConfiguration:v72 container:v94 recordsToSave:MEMORY[0x1E4F1CBF0] recordIDsToDelete:v57];
                      }
                      uint64_t v27 = v86;
                      uint64_t v26 = v87;

                      v108[0] = MEMORY[0x1E4F143A8];
                      v108[1] = 3221225472;
                      v108[2] = __72__HDCloudSyncDeleteStoresOperation__deleteUnifiedZoneStoresInContainer___block_invoke_2;
                      v108[3] = &unk_1E62F6020;
                      id v109 = v76;
                      v110 = v2;
                      [(HDCloudSyncOperation *)v77 setOnError:v108];
                      v107[0] = MEMORY[0x1E4F143A8];
                      v107[1] = 3221225472;
                      v107[2] = __72__HDCloudSyncDeleteStoresOperation__deleteUnifiedZoneStoresInContainer___block_invoke_307;
                      v107[3] = &unk_1E62F2928;
                      v107[4] = v2;
                      [(HDCloudSyncOperation *)v77 setOnSuccess:v107];
                      [(HDCloudSyncOperation *)v77 start];

                      v24 = v85;
                      v42 = (void *)v95;
                      uint64_t v41 = v96;
                    }

                    v54 = v88;
                  }
                  else
                  {
                    v54 = v53;
                    _HKInitializeLogging();
                    v55 = (void *)*MEMORY[0x1E4F29FA8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                    {
                      v82 = v55;
                      v83 = [v91 zoneIdentifier];
                      *(_DWORD *)buf = 138543874;
                      *(void *)&buf[4] = v2;
                      *(_WORD *)&buf[12] = 2114;
                      *(void *)&buf[14] = v83;
                      *(_WORD *)&buf[22] = 2114;
                      v121 = v54;
                      _os_log_error_impl(&dword_1BCB7D000, v82, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get store records for %{public}@, %{public}@", buf, 0x20u);

                      v42 = (void *)v95;
                      uint64_t v41 = v96;
                    }
                    [(HDCloudSyncOperation *)v2 finishWithSuccess:0 error:v54];
                  }

                  v49 = v89;
                }
                else
                {
                  id v47 = v46;
                  _HKInitializeLogging();
                  v48 = (void *)*MEMORY[0x1E4F29FA8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                  {
                    v78 = v48;
                    v79 = [v39 zoneIdentifier];
                    *(_DWORD *)buf = 138543874;
                    *(void *)&buf[4] = v2;
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v79;
                    *(_WORD *)&buf[22] = 2114;
                    v121 = v47;
                    _os_log_error_impl(&dword_1BCB7D000, v78, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get registry records for %{public}@, %{public}@", buf, 0x20u);
                  }
                  v49 = v47;
                  [(HDCloudSyncOperation *)v2 finishWithSuccess:0 error:v47];
                }

                v39 = v91;
              }
            }
            else
            {
              _HKInitializeLogging();
              v40 = *MEMORY[0x1E4F29FA8];
              uint64_t v41 = v96;
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                *(void *)&buf[4] = v2;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v38;
                _os_log_error_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached unified zone, %{public}@", buf, 0x16u);
              }
              [(HDCloudSyncOperation *)v2 finishWithSuccess:0 error:v38];
              v42 = (void *)v95;
            }

            v43 = v94;
          }
          else
          {
            v42 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:class:selector:format:", 3, objc_opt_class(), sel__deleteUnifiedZoneStoresInContainer_, @"No cached owner identifier for %@", v29);
            [(HDCloudSyncOperation *)v2 finishWithSuccess:0 error:v42];
            v43 = v29;
            uint64_t v41 = v96;
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v103 objects:v118 count:16];
      }
      while (v26);
    }

    [(HDSynchronousTaskGroup *)v2->_taskGroup finishTask];
    v84 = v2->_taskGroup;
    [(HDSynchronousTaskGroup *)v84 finishTask];
  }
  else
  {
    [(HDCloudSyncOperation *)v2 finishWithSuccess:1 error:0];
  }
}

uint64_t __60__HDCloudSyncDeleteStoresOperation__individualZonesToDelete__block_invoke(uint64_t a1, void *a2)
{
  return [a2 storeIdentifier];
}

id __60__HDCloudSyncDeleteStoresOperation__individualZonesToDelete__block_invoke_282(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 zoneType] == 1)
  {
    id v21 = 0;
    v4 = [v3 recordsForClass:objc_opt_class() error:&v21];
    id v5 = v21;
    uint64_t v6 = v5;
    if (v4) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v5 == 0;
    }
    if (v7)
    {
      if ((unint64_t)[v4 count] >= 2)
      {
        _HKInitializeLogging();
        id v8 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
        {
          uint64_t v18 = *(void *)(a1 + 32);
          v19 = v8;
          uint64_t v20 = [v3 zoneIdentifier];
          *(_DWORD *)buf = 138543618;
          uint64_t v23 = v18;
          __int16 v24 = 2114;
          uint64_t v25 = v20;
          _os_log_fault_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_FAULT, "%{public}@ Retrieved multiple store records for %{public}@. This is unexpected.", buf, 0x16u);
        }
      }
      id v9 = [v4 firstObject];
      uint64_t v10 = [v9 storeIdentifier];
      if (v10 && [*(id *)(a1 + 40) containsObject:v10])
      {
        v11 = [v3 zoneIdentifier];
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      _HKInitializeLogging();
      v12 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        v16 = v12;
        v17 = [v3 zoneIdentifier];
        *(_DWORD *)buf = 138543874;
        uint64_t v23 = v15;
        __int16 v24 = 2114;
        uint64_t v25 = v17;
        __int16 v26 = 2114;
        uint64_t v27 = v6;
        _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get store records for %{public}@, %{public}@", buf, 0x20u);
      }
      [*(id *)(a1 + 32) finishWithSuccess:0 error:v6];
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __63__HDCloudSyncDeleteStoresOperation__deleteIndividualZoneStores__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "failTaskWithError:");
}

uint64_t __63__HDCloudSyncDeleteStoresOperation__deleteIndividualZoneStores__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) finishTask];
}

uint64_t __72__HDCloudSyncDeleteStoresOperation__deleteUnifiedZoneStoresInContainer___block_invoke(uint64_t a1, void *a2)
{
  return [a2 storeIdentifier];
}

uint64_t __72__HDCloudSyncDeleteStoresOperation__deleteUnifiedZoneStoresInContainer___block_invoke_300(uint64_t a1, void *a2)
{
  return [a2 storeIdentifier];
}

void __72__HDCloudSyncDeleteStoresOperation__deleteUnifiedZoneStoresInContainer___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void **)(a1 + 32);
    BOOL v7 = v5;
    id v8 = [v6 containerIdentifier];
    int v9 = 138543618;
    uint64_t v10 = v8;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Failed to delete store records and update registry in container %{public}@: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(*(void *)(a1 + 40) + 104) failTaskWithError:v4];
}

uint64_t __72__HDCloudSyncDeleteStoresOperation__deleteUnifiedZoneStoresInContainer___block_invoke_307(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) finishTask];
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  if (a4)
  {
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0, a5);
  }
  else
  {
    objc_msgSend(a5, "firstObject", a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v6];
  }
}

- (NSArray)storeRecordsToDelete
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeRecordsToDelete, 0);

  objc_storeStrong((id *)&self->_taskGroup, 0);
}

@end