@interface HDCloudSyncRemoveInvalidShareParticipantsOperation
- (HDCloudSyncRemoveInvalidShareParticipantsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (NSArray)participantsToCheck;
- (int64_t)requiredPermission;
- (void)main;
- (void)setParticipantsToCheck:(id)a3;
- (void)setRequiredPermission:(int64_t)a3;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncRemoveInvalidShareParticipantsOperation

- (HDCloudSyncRemoveInvalidShareParticipantsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HDCloudSyncRemoveInvalidShareParticipantsOperation;
  result = [(HDCloudSyncOperation *)&v5 initWithConfiguration:a3 cloudState:a4];
  if (result) {
    result->_requiredPermission = 3;
  }
  return result;
}

- (void)setRequiredPermission:(int64_t)a3
{
  if ([(HDCloudSyncOperation *)self status])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HDCloudSyncRemoveInvalidShareParticipantsOperation.m", 42, @"Invalid parameter not satisfying: %@", @"self.status == HDCloudSyncOperationStatusPending" object file lineNumber description];
  }
  self->_requiredPermission = a3;
}

- (void)setParticipantsToCheck:(id)a3
{
  id v8 = a3;
  if ([(HDCloudSyncOperation *)self status])
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HDCloudSyncRemoveInvalidShareParticipantsOperation.m", 48, @"Invalid parameter not satisfying: %@", @"self.status == HDCloudSyncOperationStatusPending" object file lineNumber description];
  }
  objc_super v5 = (NSArray *)[v8 copy];
  participantsToCheck = self->_participantsToCheck;
  self->_participantsToCheck = v5;
}

- (void)main
{
  v2 = self;
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  participantsToCheck = self->_participantsToCheck;
  if (participantsToCheck && ![(NSArray *)participantsToCheck count])
  {
    _HKInitializeLogging();
    v61 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v102 = 138543362;
      v103 = v2;
      _os_log_impl(&dword_1BCB7D000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@: No participants to check; nothing to do.",
        v102,
        0xCu);
    }
    [(HDCloudSyncOperation *)v2 finishWithSuccess:1 error:0];
  }
  else
  {
    v4 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = v2->_taskGroup;
    v2->_taskGroup = v4;

    [(HDSynchronousTaskGroup *)v2->_taskGroup setDelegate:v2];
    [(HDSynchronousTaskGroup *)v2->_taskGroup beginTask];
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    v6 = [(HDCloudSyncOperation *)v2 configuration];
    v7 = [v6 repository];
    id v8 = [v7 allCKContainers];

    id obj = v8;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v80 objects:v94 count:16];
    if (v9)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(void *)v81;
      unint64_t v13 = 0x1E4F1C000uLL;
      *(void *)&long long v10 = 138543874;
      long long v62 = v10;
      uint64_t v63 = *(void *)v81;
      v69 = v2;
      do
      {
        uint64_t v14 = 0;
        uint64_t v64 = v11;
        do
        {
          if (*(void *)v81 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v66 = v14;
          v15 = *(void **)(*((void *)&v80 + 1) + 8 * v14);
          [(HDSynchronousTaskGroup *)v2->_taskGroup beginTask];
          id v16 = v15;
          id v68 = objc_alloc_init(*(Class *)(v13 + 2632));
          v17 = [(HDCloudSyncOperation *)v2 configuration];
          v18 = [v17 cachedCloudState];
          id v93 = 0;
          v19 = [v18 zonesByIdentifierWithError:&v93];
          id v20 = v93;

          v67 = v19;
          if (v19 || !v20)
          {
            long long v91 = 0u;
            long long v92 = 0u;
            long long v89 = 0u;
            long long v90 = 0u;
            id v74 = [v19 allValues];
            uint64_t v24 = [v74 countByEnumeratingWithState:&v89 objects:v102 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v90;
              id v70 = v16;
              id v76 = v20;
              uint64_t v72 = *(void *)v90;
              while (2)
              {
                uint64_t v27 = 0;
                uint64_t v73 = v25;
                do
                {
                  if (*(void *)v90 != v26) {
                    objc_enumerationMutation(v74);
                  }
                  v28 = *(void **)(*((void *)&v89 + 1) + 8 * v27);
                  v29 = [v28 zoneIdentifier];
                  v30 = [v29 containerIdentifier];
                  v31 = [v16 containerIdentifier];
                  int v32 = [v30 isEqualToString:v31];

                  id v20 = v76;
                  if (v32)
                  {
                    uint64_t v75 = v27;
                    id v88 = 0;
                    v33 = [v28 zoneShareWithError:&v88];
                    id v34 = v88;
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
                      v52 = (void *)*MEMORY[0x1E4F29FA8];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                      {
                        v59 = v52;
                        v60 = [v28 zoneIdentifier];
                        *(_DWORD *)buf = v62;
                        v97 = v69;
                        __int16 v98 = 2114;
                        id v99 = v60;
                        __int16 v100 = 2114;
                        v101 = v35;
                        _os_log_error_impl(&dword_1BCB7D000, v59, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached CKShare for zone %{public}@, %{public}@", buf, 0x20u);
                      }
                      id v22 = v35;

                      id v23 = 0;
                      uint64_t v11 = v64;
                      uint64_t v12 = v63;
                      unint64_t v13 = 0x1E4F1C000;
                      id v20 = v76;
                      goto LABEL_52;
                    }
                    if (v33)
                    {
                      long long v86 = 0u;
                      long long v87 = 0u;
                      long long v84 = 0u;
                      long long v85 = 0u;
                      v37 = [v33 participants];
                      v38 = (void *)[v37 copy];

                      uint64_t v39 = [v38 countByEnumeratingWithState:&v84 objects:v95 count:16];
                      if (v39)
                      {
                        uint64_t v40 = v39;
                        v77 = v33;
                        v71 = v35;
                        char v41 = 0;
                        uint64_t v42 = *(void *)v85;
                        do
                        {
                          for (uint64_t i = 0; i != v40; ++i)
                          {
                            if (*(void *)v85 != v42) {
                              objc_enumerationMutation(v38);
                            }
                            v44 = *(void **)(*((void *)&v84 + 1) + 8 * i);
                            if ([v44 role] != 1)
                            {
                              int64_t requiredPermission = v69->_requiredPermission;
                              id v46 = v44;
                              uint64_t v47 = [v46 acceptanceStatus];
                              uint64_t v48 = [v46 permission];

                              if (v47 != 2 || v48 != requiredPermission)
                              {
                                v50 = v69->_participantsToCheck;
                                if (!v50 || [(NSArray *)v50 containsObject:v46])
                                {
                                  _HKInitializeLogging();
                                  v51 = *MEMORY[0x1E4F29FA8];
                                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
                                  {
                                    *(_DWORD *)buf = 138543618;
                                    v97 = v69;
                                    __int16 v98 = 2114;
                                    id v99 = v46;
                                    _os_log_impl(&dword_1BCB7D000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@: Found invalid participant %{public}@, removing.", buf, 0x16u);
                                  }
                                  [v77 removeParticipant:v46];
                                  char v41 = 1;
                                }
                              }
                            }
                          }
                          uint64_t v40 = [v38 countByEnumeratingWithState:&v84 objects:v95 count:16];
                        }
                        while (v40);

                        id v16 = v70;
                        v35 = v71;
                        id v20 = v76;
                        v33 = v77;
                        if (v41) {
                          [v68 addObject:v77];
                        }
                      }
                      else
                      {

                        id v16 = v70;
                      }
                    }

                    uint64_t v26 = v72;
                    uint64_t v25 = v73;
                    uint64_t v27 = v75;
                  }
                  ++v27;
                }
                while (v27 != v25);
                uint64_t v25 = [v74 countByEnumeratingWithState:&v89 objects:v102 count:16];
                if (v25) {
                  continue;
                }
                break;
              }
            }

            id v23 = v68;
            id v22 = 0;
            uint64_t v11 = v64;
            uint64_t v12 = v63;
            unint64_t v13 = 0x1E4F1C000;
          }
          else
          {
            _HKInitializeLogging();
            v21 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v102 = 138543618;
              v103 = v69;
              __int16 v104 = 2114;
              id v105 = v20;
              _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve cached zones, %{public}@", v102, 0x16u);
            }
            id v22 = v20;
            id v23 = 0;
          }
LABEL_52:

          id v54 = v22;
          v55 = v54;
          if (v23 || !v54)
          {
            v2 = v69;
            if ([v23 count])
            {
              v56 = [HDCloudSyncModifyRecordsOperation alloc];
              v57 = [(HDCloudSyncOperation *)v69 configuration];
              v58 = [(HDCloudSyncModifyRecordsOperation *)v56 initWithConfiguration:v57 container:v16 recordsToSave:v23 recordIDsToDelete:0];

              v2 = v69;
              v79[0] = MEMORY[0x1E4F143A8];
              v79[1] = 3221225472;
              v79[2] = __58__HDCloudSyncRemoveInvalidShareParticipantsOperation_main__block_invoke;
              v79[3] = &unk_1E62F6020;
              v79[4] = v69;
              v79[5] = v16;
              [(HDCloudSyncOperation *)v58 setOnError:v79];
              v78[0] = MEMORY[0x1E4F143A8];
              v78[1] = 3221225472;
              v78[2] = __58__HDCloudSyncRemoveInvalidShareParticipantsOperation_main__block_invoke_289;
              v78[3] = &unk_1E62F46F8;
              v78[4] = v69;
              v78[5] = v16;
              [(HDCloudSyncOperation *)v58 setOnSuccess:v78];
              [(HDCloudSyncOperation *)v58 start];
            }
            else
            {
              [(HDSynchronousTaskGroup *)v69->_taskGroup finishTask];
            }
          }
          else
          {
            v2 = v69;
            [(HDSynchronousTaskGroup *)v69->_taskGroup failTaskWithError:v54];
          }

          uint64_t v14 = v66 + 1;
        }
        while (v66 + 1 != v11);
        uint64_t v11 = [obj countByEnumeratingWithState:&v80 objects:v94 count:16];
      }
      while (v11);
    }

    [(HDSynchronousTaskGroup *)v2->_taskGroup finishTask];
  }
}

void __58__HDCloudSyncRemoveInvalidShareParticipantsOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  objc_super v5 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    id v8 = v5;
    uint64_t v9 = [v6 containerIdentifier];
    int v10 = 138543874;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    unint64_t v13 = v9;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update shares in %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 32) + 104) failTaskWithError:v4];
}

uint64_t __58__HDCloudSyncRemoveInvalidShareParticipantsOperation_main__block_invoke_289(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    objc_super v5 = v2;
    v6 = [v3 containerIdentifier];
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully updated share records for %{public}@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(*(void *)(a1 + 32) + 104) finishTask];
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  BOOL v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(HDCloudSyncOperation *)self finishWithSuccess:v5 error:v7];
}

- (int64_t)requiredPermission
{
  return self->_requiredPermission;
}

- (NSArray)participantsToCheck
{
  return self->_participantsToCheck;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantsToCheck, 0);

  objc_storeStrong((id *)&self->_taskGroup, 0);
}

@end