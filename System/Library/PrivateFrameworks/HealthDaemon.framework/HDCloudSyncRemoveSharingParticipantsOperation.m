@interface HDCloudSyncRemoveSharingParticipantsOperation
- (HDCloudSyncRemoveSharingParticipantsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncRemoveSharingParticipantsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 participantsToRemove:(id)a5;
- (void)main;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncRemoveSharingParticipantsOperation

- (HDCloudSyncRemoveSharingParticipantsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncRemoveSharingParticipantsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 participantsToRemove:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDCloudSyncRemoveSharingParticipantsOperation;
  v9 = [(HDCloudSyncOperation *)&v16 initWithConfiguration:a3 cloudState:a4];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    uint64_t v11 = [v8 copy];
    participantsToRemove = v10->_participantsToRemove;
    v10->_participantsToRemove = (NSSet *)v11;

    v13 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = v10->_taskGroup;
    v10->_taskGroup = v13;

    [(HDSynchronousTaskGroup *)v10->_taskGroup setDelegate:v10];
  }

  return v10;
}

- (void)main
{
  v2 = self;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];
  v5 = [v4 allCKContainers];
  uint64_t v6 = [v5 count];
  v7 = [(HDCloudSyncOperation *)v2 progress];
  [v7 setTotalUnitCount:v6];

  [(HDSynchronousTaskGroup *)v2->_taskGroup beginTask];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v8 = [(HDCloudSyncOperation *)v2 configuration];
  v9 = [v8 repository];
  v10 = [v9 allCKContainers];

  obuint64_t j = v10;
  uint64_t v69 = [v10 countByEnumeratingWithState:&v76 objects:v86 count:16];
  if (v69)
  {
    uint64_t v68 = *(void *)v77;
    *(void *)&long long v11 = 138543618;
    long long v63 = v11;
    v64 = v2;
    do
    {
      for (uint64_t i = 0; i != v69; ++i)
      {
        if (*(void *)v77 != v68) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        [(HDSynchronousTaskGroup *)v2->_taskGroup beginTask];
        v14 = v2->_participantsToRemove;
        id v15 = v13;
        objc_super v16 = [(HDCloudSyncOperation *)v2 configuration];
        v17 = [v16 cachedCloudState];
        id v85 = 0;
        v18 = [v17 zonesByIdentifierWithError:&v85];
        id v19 = v85;

        v70 = v18;
        if (v18 || !v19)
        {
          id v66 = v19;
          uint64_t v67 = i;
          id v71 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          memset(buf, 0, sizeof(buf));
          long long v100 = 0u;
          long long v101 = 0u;
          id v75 = [v18 allValues];
          uint64_t v24 = [v75 countByEnumeratingWithState:buf objects:v95 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = **(void **)&buf[16];
            uint64_t v72 = **(void **)&buf[16];
            id v73 = v15;
            while (2)
            {
              uint64_t v27 = 0;
              uint64_t v74 = v25;
              do
              {
                if (**(void **)&buf[16] != v26) {
                  objc_enumerationMutation(v75);
                }
                v28 = *(void **)(*(void *)&buf[8] + 8 * v27);
                v29 = [v28 zoneIdentifier];
                v30 = [v29 containerIdentifier];
                v31 = [v15 containerIdentifier];
                int v32 = [v30 isEqualToString:v31];

                if (v32)
                {
                  id v84 = 0;
                  v33 = [v28 zoneShareWithError:&v84];
                  id v34 = v84;
                  v35 = v34;
                  if (v33) {
                    BOOL v36 = 1;
                  }
                  else {
                    BOOL v36 = v34 == 0;
                  }
                  if (!v36)
                  {
                    _HKInitializeLogging();
                    v45 = (void *)*MEMORY[0x1E4F29FA8];
                    BOOL v46 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR);
                    v2 = v64;
                    if (v46)
                    {
                      v61 = v45;
                      v62 = [v28 zoneIdentifier];
                      *(_DWORD *)v89 = 138543874;
                      v90 = v64;
                      __int16 v91 = 2114;
                      v92 = v62;
                      __int16 v93 = 2114;
                      v94 = v35;
                      _os_log_error_impl(&dword_1BCB7D000, v61, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch CKShare for cached zone %{public}@, %{public}@", v89, 0x20u);
                    }
                    id v21 = v35;

                    id v23 = 0;
                    v44 = v71;
                    goto LABEL_41;
                  }
                  long long v82 = 0u;
                  long long v83 = 0u;
                  long long v80 = 0u;
                  long long v81 = 0u;
                  v37 = [v33 participants];
                  uint64_t v38 = [v37 countByEnumeratingWithState:&v80 objects:v87 count:16];
                  if (v38)
                  {
                    uint64_t v39 = v38;
                    char v40 = 0;
                    uint64_t v41 = *(void *)v81;
                    do
                    {
                      for (uint64_t j = 0; j != v39; ++j)
                      {
                        if (*(void *)v81 != v41) {
                          objc_enumerationMutation(v37);
                        }
                        uint64_t v43 = *(void *)(*((void *)&v80 + 1) + 8 * j);
                        if ([(NSSet *)v14 containsObject:v43])
                        {
                          [v33 removeParticipant:v43];
                          char v40 = 1;
                        }
                      }
                      uint64_t v39 = [v37 countByEnumeratingWithState:&v80 objects:v87 count:16];
                    }
                    while (v39);

                    uint64_t v26 = v72;
                    id v15 = v73;
                    if (v40) {
                      [v71 addObject:v33];
                    }
                  }
                  else
                  {
                  }
                  uint64_t v25 = v74;
                }
                ++v27;
              }
              while (v27 != v25);
              uint64_t v25 = [v75 countByEnumeratingWithState:buf objects:v95 count:16];
              if (v25) {
                continue;
              }
              break;
            }
          }

          v44 = v71;
          id v23 = v71;
          id v21 = 0;
          v2 = v64;
LABEL_41:

          v22 = v66;
          uint64_t i = v67;
        }
        else
        {
          _HKInitializeLogging();
          v20 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v95 = v63;
            *(void *)&v95[4] = v2;
            *(_WORD *)&v95[12] = 2114;
            *(void *)&v95[14] = v19;
            _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached zones, %{public}@", v95, 0x16u);
          }
          id v21 = v19;
          v22 = v19;
          id v23 = 0;
        }

        id v47 = v21;
        v48 = v47;
        if (v23 || !v47)
        {
          if ([v23 count])
          {
            uint64_t v49 = i;
            id v50 = v23;
            id v51 = v15;
            _HKInitializeLogging();
            v52 = (void *)*MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
            {
              v53 = v52;
              uint64_t v54 = [v50 count];
              v55 = [v51 containerIdentifier];
              *(_DWORD *)buf = 138543874;
              *(void *)&buf[4] = v2;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v54;
              *(_WORD *)&buf[22] = 2114;
              *(void *)&buf[24] = v55;
              _os_log_impl(&dword_1BCB7D000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@: Saving %ld updated share records in %{public}@", buf, 0x20u);
            }
            v56 = [HDCloudSyncModifyRecordsOperation alloc];
            v57 = [(HDCloudSyncOperation *)v2 configuration];
            v58 = [(HDCloudSyncModifyRecordsOperation *)v56 initWithConfiguration:v57 container:v51 recordsToSave:v50 recordIDsToDelete:0];

            [(HDCloudSyncModifyRecordsOperation *)v58 setTreatAnyErrorAsFatal:1];
            *(void *)v95 = MEMORY[0x1E4F143A8];
            *(void *)&v95[8] = 3221225472;
            *(void *)&v95[16] = __78__HDCloudSyncRemoveSharingParticipantsOperation__saveUpdatedShares_container___block_invoke;
            v96 = &unk_1E62F6020;
            v97 = v2;
            id v59 = v51;
            id v98 = v59;
            [(HDCloudSyncOperation *)v58 setOnError:v95];
            v87[0] = MEMORY[0x1E4F143A8];
            v87[1] = 3221225472;
            v87[2] = __78__HDCloudSyncRemoveSharingParticipantsOperation__saveUpdatedShares_container___block_invoke_284;
            v87[3] = &unk_1E62F46F8;
            v87[4] = v2;
            id v60 = v59;
            id v88 = v60;
            [(HDCloudSyncOperation *)v58 setOnSuccess:v87];
            [(HDCloudSyncOperation *)v58 start];

            uint64_t i = v49;
          }
          else
          {
            [(HDSynchronousTaskGroup *)v2->_taskGroup finishTask];
          }
        }
        else
        {
          [(HDSynchronousTaskGroup *)v2->_taskGroup failTaskWithError:v47];
        }
      }
      uint64_t v69 = [obj countByEnumeratingWithState:&v76 objects:v86 count:16];
    }
    while (v69);
  }

  [(HDSynchronousTaskGroup *)v2->_taskGroup finishTask];
}

void __78__HDCloudSyncRemoveSharingParticipantsOperation__saveUpdatedShares_container___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 40);
    id v8 = v5;
    v9 = [v6 containerIdentifier];
    int v10 = 138543874;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    v13 = v9;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update share records in %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 32) + 112) failTaskWithError:v4];
}

uint64_t __78__HDCloudSyncRemoveSharingParticipantsOperation__saveUpdatedShares_container___block_invoke_284(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    uint64_t v6 = [v3 containerIdentifier];
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully updated share records in %{public}@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(*(void *)(a1 + 32) + 112) finishTask];
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
  objc_storeStrong((id *)&self->_taskGroup, 0);

  objc_storeStrong((id *)&self->_participantsToRemove, 0);
}

@end