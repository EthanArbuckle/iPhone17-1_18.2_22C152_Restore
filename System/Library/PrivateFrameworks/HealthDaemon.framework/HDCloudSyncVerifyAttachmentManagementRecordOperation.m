@interface HDCloudSyncVerifyAttachmentManagementRecordOperation
- (void)_updateAllAttachmentReferencesToUnsynchronizedWithError:(void *)result;
- (void)main;
@end

@implementation HDCloudSyncVerifyAttachmentManagementRecordOperation

- (void)main
{
  v83[1] = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 cachedCloudState];
  v5 = [(HDCloudSyncOperation *)self configuration];
  v6 = [v5 repository];
  v7 = [v6 primaryCKContainer];
  v8 = [v7 containerIdentifier];
  id v76 = 0;
  v9 = [v4 attachmentZoneForContainerID:v8 error:&v76];
  id v10 = v76;

  if (v9 || !v10)
  {
    if (!v9)
    {
      v11 = [(HDCloudSyncOperation *)self configuration];
      v12 = [v11 repository];
      BOOL v13 = [v12 profileType] == 1;

      if (!v13)
      {
        [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
        goto LABEL_42;
      }
    }
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__136;
    v74 = __Block_byref_object_dispose__136;
    id v75 = 0;
    uint64_t v14 = objc_opt_class();
    v68[4] = &v70;
    id v69 = 0;
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __60__HDCloudSyncVerifyAttachmentManagementRecordOperation_main__block_invoke;
    v68[3] = &unk_1E6305898;
    char v15 = [v9 recordsForClass:v14 epoch:0 error:&v69 enumerationHandler:v68];
    id v16 = v69;
    v62 = v16;
    if ((v15 & 1) == 0)
    {
      [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v16];
LABEL_41:
      _Block_object_dispose(&v70, 8);

      goto LABEL_42;
    }
    if (v71[5])
    {
      v17 = [(HDCloudSyncOperation *)self configuration];
      v18 = [v17 repository];
      v19 = [v18 profile];
      v20 = [v19 legacyRepositoryProfile];
      id v66 = 0;
      HDCloudSyncAttachmentManagementUUID(v20, (uint64_t)&v66);
      id v61 = (id)objc_claimAutoreleasedReturnValue();
      id v21 = v66;

      if (v21)
      {
        _HKInitializeLogging();
        v22 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v21;
          _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to fetch local attachment management UUID, %{public}@", buf, 0x16u);
        }
        [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v21];
      }
      else
      {
        v36 = (void *)v71[5];
        if (!v61)
        {
          v40 = [v36 UUID];
          v41 = [(HDCloudSyncOperation *)self configuration];
          v42 = [v41 repository];
          v43 = [v42 profile];
          v44 = [v43 legacyRepositoryProfile];
          id v65 = 0;
          uint64_t v45 = HDSetCloudSyncAttachmentManagementUUID(v40, v44, (uint64_t)&v65);
          id v21 = v65;

          if ((v45 & 1) == 0)
          {
            _HKInitializeLogging();
            v46 = (id)*MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              v57 = [(id)v71[5] UUID];
              *(_DWORD *)buf = 138543874;
              *(void *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v57;
              *(_WORD *)&buf[22] = 2114;
              v80 = v21;
              _os_log_error_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to set previously nil local management UUID %{public}@, %{public}@", buf, 0x20u);
            }
          }
          [(HDCloudSyncOperation *)self finishWithSuccess:v45 error:v21];

          goto LABEL_40;
        }
        v37 = [v36 UUID];
        char v38 = [v61 isEqual:v37];

        if (v38)
        {
          [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
          id v21 = 0;
        }
        else
        {
          id v64 = 0;
          unsigned __int8 v47 = -[HDCloudSyncVerifyAttachmentManagementRecordOperation _updateAllAttachmentReferencesToUnsynchronizedWithError:](self, (uint64_t)&v64);
          id v48 = v64;
          if (v47)
          {
            v49 = [(id)v71[5] UUID];
            v50 = v48;
            v51 = [(HDCloudSyncOperation *)self configuration];
            v52 = [v51 repository];
            v53 = [v52 profile];
            v54 = [v53 legacyRepositoryProfile];
            id v63 = 0;
            unsigned int v60 = HDSetCloudSyncAttachmentManagementUUID(v49, v54, (uint64_t)&v63);
            id v21 = v63;

            if ((v60 & 1) == 0)
            {
              _HKInitializeLogging();
              v55 = (id)*MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
              {
                v58 = [(id)v71[5] UUID];
                *(_DWORD *)buf = 138543874;
                *(void *)&buf[4] = self;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v58;
                *(_WORD *)&buf[22] = 2114;
                v80 = v21;
                _os_log_error_impl(&dword_1BCB7D000, v55, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to set previously nil local management UUID %{public}@, %{public}@", buf, 0x20u);
              }
            }
            [(HDCloudSyncOperation *)self finishWithSuccess:v60 error:v21];
          }
          else
          {
            _HKInitializeLogging();
            v50 = v48;
            v56 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v50;
              _os_log_error_impl(&dword_1BCB7D000, v56, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to update local attachment references to state unsynchronized, %{public}@", buf, 0x16u);
            }
            [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v50];
            id v21 = 0;
          }
        }
      }
    }
    else
    {
      id v67 = 0;
      unsigned __int8 v23 = -[HDCloudSyncVerifyAttachmentManagementRecordOperation _updateAllAttachmentReferencesToUnsynchronizedWithError:](self, (uint64_t)&v67);
      id v21 = v67;
      if ((v23 & 1) == 0)
      {
        _HKInitializeLogging();
        v39 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v21;
          _os_log_error_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to update local attachment references to state unsynchronized, %{public}@", buf, 0x16u);
        }
        [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v21];
        goto LABEL_40;
      }
      v24 = [HDCloudSyncAttachmentManagementRecord alloc];
      v25 = [v9 zoneIdentifier];
      v26 = [v25 zoneIdentifier];
      id v27 = [(HDCloudSyncAttachmentManagementRecord *)v24 initInZoneID:v26];

      id v61 = v27;
      if (self)
      {
        v28 = [HDCloudSyncModifyRecordsOperation alloc];
        v59 = [(HDCloudSyncOperation *)self configuration];
        v29 = [(HDCloudSyncOperation *)self configuration];
        v30 = [v29 repository];
        v31 = [v30 primaryCKContainer];
        v32 = [v61 record];
        v83[0] = v32;
        v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:1];
        v34 = [(HDCloudSyncModifyRecordsOperation *)v28 initWithConfiguration:v59 container:v31 recordsToSave:v33 recordIDsToDelete:0];

        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __101__HDCloudSyncVerifyAttachmentManagementRecordOperation__modifyCloudKitAndFinishWithManagementRecord___block_invoke;
        v80 = &unk_1E63058C0;
        v81 = self;
        id v35 = v61;
        id v82 = v35;
        [(HDCloudSyncOperation *)v34 setOnError:buf];
        v77[0] = MEMORY[0x1E4F143A8];
        v77[1] = 3221225472;
        v77[2] = __101__HDCloudSyncVerifyAttachmentManagementRecordOperation__modifyCloudKitAndFinishWithManagementRecord___block_invoke_284;
        v77[3] = &unk_1E6302F00;
        v77[4] = self;
        id v78 = v35;
        [(HDCloudSyncOperation *)v34 setOnSuccess:v77];
        [(HDCloudSyncOperation *)v34 start];
      }
    }

LABEL_40:
    goto LABEL_41;
  }
  [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v10];
LABEL_42:
}

uint64_t __60__HDCloudSyncVerifyAttachmentManagementRecordOperation_main__block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

- (void)_updateAllAttachmentReferencesToUnsynchronizedWithError:(void *)result
{
  if (result)
  {
    v3 = result;
    v4 = +[HDMutableDatabaseTransactionContext contextForWritingProtectedData];
    v5 = [v3 configuration];
    v6 = [v5 accessibilityAssertion];
    v7 = [v4 contextWithAccessibilityAssertion:v6];

    v8 = [v3 configuration];
    v9 = [v8 repository];
    id v10 = [v9 profile];
    v11 = [v10 database];
    uint64_t v12 = [v11 performTransactionWithContext:v7 error:a2 block:&__block_literal_global_167 inaccessibilityHandler:0];

    return (void *)v12;
  }
  return result;
}

BOOL __112__HDCloudSyncVerifyAttachmentManagementRecordOperation__updateAllAttachmentReferencesToUnsynchronizedWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDAttachmentReferenceEntity setCloudStatus:0 transaction:a2 error:a3];
}

void __101__HDCloudSyncVerifyAttachmentManagementRecordOperation__modifyCloudKitAndFinishWithManagementRecord___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v8 = v5;
    v9 = [v6 recordID];
    int v10 = 138543874;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    BOOL v13 = v9;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to modify management attachment record %{public}@, %{public}@", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(a1 + 32) finishWithSuccess:0 error:v4];
}

void __101__HDCloudSyncVerifyAttachmentManagementRecordOperation__modifyCloudKitAndFinishWithManagementRecord___block_invoke_284(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (os_log_t *)MEMORY[0x1E4F29FA8];
  v3 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    v6 = v3;
    uint64_t v7 = [v4 recordID];
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = v5;
    __int16 v26 = 2114;
    id v27 = v7;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[attachments] %{public}@: Successfully modified management attachment record %{public}@", buf, 0x16u);
  }
  v8 = [*(id *)(a1 + 40) UUID];
  v9 = [*(id *)(a1 + 32) configuration];
  int v10 = [v9 repository];
  uint64_t v11 = [v10 profile];
  __int16 v12 = [v11 legacyRepositoryProfile];
  id v23 = 0;
  char v13 = HDSetCloudSyncAttachmentManagementUUID(v8, v12, (uint64_t)&v23);
  id v14 = v23;

  if (v13)
  {
    id v15 = *(void **)(a1 + 32);
    uint64_t v16 = 1;
    id v17 = 0;
  }
  else
  {
    _HKInitializeLogging();
    os_log_t v18 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      v19 = *(void **)(a1 + 40);
      id v21 = v18;
      v22 = [v19 UUID];
      *(_DWORD *)buf = 138543874;
      uint64_t v25 = v20;
      __int16 v26 = 2114;
      id v27 = v22;
      __int16 v28 = 2114;
      id v29 = v14;
      _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to persist local attachment management UUID %{public}@, %{public}@", buf, 0x20u);
    }
    id v15 = *(void **)(a1 + 32);
    uint64_t v16 = 0;
    id v17 = v14;
  }
  [v15 finishWithSuccess:v16 error:v17];
}

@end