@interface HDCloudSyncPushReferencesOperation
- (HDCloudSyncPushReferencesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (uint64_t)_updateReferencesToSynchronizedWithError:(void *)a1;
- (void)main;
@end

@implementation HDCloudSyncPushReferencesOperation

- (HDCloudSyncPushReferencesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)HDCloudSyncPushReferencesOperation;
  v4 = [(HDCloudSyncOperation *)&v12 initWithConfiguration:a3 cloudState:a4];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unsynchronizedReferences = v4->_unsynchronizedReferences;
    v4->_unsynchronizedReferences = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    referencesToPush = v4->_referencesToPush;
    v4->_referencesToPush = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    attachmentRecordsToPush = v4->_attachmentRecordsToPush;
    v4->_attachmentRecordsToPush = v9;
  }
  return v4;
}

- (void)main
{
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 cachedCloudState];
  v5 = [(HDCloudSyncOperation *)self configuration];
  v6 = [v5 repository];
  v7 = [v6 primaryCKContainer];
  v8 = [v7 containerIdentifier];
  id v45 = 0;
  v9 = [v4 attachmentZoneForContainerID:v8 error:&v45];
  id v10 = v45;
  attachmentZone = self->_attachmentZone;
  self->_attachmentZone = v9;

  objc_super v12 = self->_attachmentZone;
  if (v12) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v10 == 0;
  }
  if (v13)
  {
    if (!v12)
    {
      v14 = [(HDCloudSyncOperation *)self configuration];
      v15 = [v14 repository];
      uint64_t v16 = [v15 profileType];

      if (v16 != 1)
      {
        v38 = self;
        uint64_t v39 = 1;
        id v40 = 0;
        goto LABEL_12;
      }
    }
    id v44 = 0;
    v17 = +[HDMutableDatabaseTransactionContext contextForReadingProtectedData];
    v18 = [(HDCloudSyncOperation *)self configuration];
    v19 = [v18 accessibilityAssertion];
    v20 = [v17 contextWithAccessibilityAssertion:v19];

    v21 = [(HDCloudSyncOperation *)self configuration];
    v22 = [v21 repository];
    v23 = [v22 profile];
    v24 = [v23 database];
    id v47 = (id)MEMORY[0x1E4F143A8];
    uint64_t v48 = 3221225472;
    v49 = __86__HDCloudSyncPushReferencesOperation__generateReferenceAndAttachmentRecordsWithError___block_invoke;
    v50 = &unk_1E62F6130;
    v51 = self;
    char v25 = [v24 performTransactionWithContext:v20 error:&v44 block:&v47 inaccessibilityHandler:0];

    id v26 = v44;
    if ((v25 & 1) == 0)
    {
      [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v26];
LABEL_20:

      goto LABEL_21;
    }
    referencesToPush = self->_referencesToPush;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __42__HDCloudSyncPushReferencesOperation_main__block_invoke;
    v43[3] = &unk_1E630B2D0;
    v43[4] = self;
    v28 = [(NSMutableArray *)referencesToPush hk_map:v43];
    v29 = (void *)[v28 mutableCopy];

    v30 = [(NSMutableSet *)self->_attachmentRecordsToPush allObjects];
    [v29 addObjectsFromArray:v30];

    id v31 = v29;
    if ([v31 count])
    {
      v32 = [HDCloudSyncModifyRecordsOperation alloc];
      v33 = [(HDCloudSyncOperation *)self configuration];
      v34 = [(HDCloudSyncOperation *)self configuration];
      v35 = [v34 repository];
      v36 = [v35 primaryCKContainer];
      v37 = [(HDCloudSyncModifyRecordsOperation *)v32 initWithConfiguration:v33 container:v36 recordsToSave:v31 recordIDsToDelete:0];

      id v47 = (id)MEMORY[0x1E4F143A8];
      uint64_t v48 = 3221225472;
      v49 = __73__HDCloudSyncPushReferencesOperation__pushToCloudKitAndFinishForRecords___block_invoke;
      v50 = &unk_1E62F2950;
      v51 = self;
      [(HDCloudSyncOperation *)v37 setOnError:&v47];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __73__HDCloudSyncPushReferencesOperation__pushToCloudKitAndFinishForRecords___block_invoke_293;
      v46[3] = &unk_1E62F2928;
      v46[4] = self;
      [(HDCloudSyncOperation *)v37 setOnSuccess:v46];
      [(HDCloudSyncOperation *)v37 start];
LABEL_11:

LABEL_19:
      goto LABEL_20;
    }
    if ([(NSMutableArray *)self->_unsynchronizedReferences count])
    {
      id v47 = 0;
      char v41 = -[HDCloudSyncPushReferencesOperation _updateReferencesToSynchronizedWithError:](self, (uint64_t)&v47);
      v42 = (HDCloudSyncModifyRecordsOperation *)v47;
      v37 = v42;
      if ((v41 & 1) == 0)
      {
        [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v42];
        goto LABEL_11;
      }
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
    goto LABEL_19;
  }
  v38 = self;
  uint64_t v39 = 0;
  id v40 = v10;
LABEL_12:
  [(HDCloudSyncOperation *)v38 finishWithSuccess:v39 error:v40];
LABEL_21:
}

id __42__HDCloudSyncPushReferencesOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [HDCloudSyncAttachmentReferenceRecord alloc];
  v5 = [*(id *)(*(void *)(a1 + 32) + 128) zoneIdentifier];
  v6 = [v5 zoneIdentifier];
  v7 = [(HDCloudSyncAttachmentReferenceRecord *)v4 initWithAttachmentReference:v3 zoneID:v6];

  v8 = [(HDCloudSyncRecord *)v7 record];

  return v8;
}

BOOL __86__HDCloudSyncPushReferencesOperation__generateReferenceAndAttachmentRecordsWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = HDAttachmentReferencePredicateForUnsynchronizedReferences();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__HDCloudSyncPushReferencesOperation__generateReferenceAndAttachmentRecordsWithError___block_invoke_2;
  v9[3] = &unk_1E62FB1C0;
  v9[4] = *(void *)(a1 + 32);
  BOOL v7 = +[HDAttachmentReferenceEntity enumerateReferencesWithPredicate:v6 transaction:v5 error:a3 enumerationHandler:v9];

  return v7;
}

BOOL __86__HDCloudSyncPushReferencesOperation__generateReferenceAndAttachmentRecordsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = [v5 identifier];
  BOOL v7 = [v6 UUIDString];
  v8 = [*(id *)(*(void *)(a1 + 32) + 128) zoneIdentifier];
  v9 = [v8 zoneIdentifier];
  id v10 = +[HDCloudSyncAttachmentReferenceRecord recordIDForReferenceIdentifier:v7 zoneID:v9];

  v11 = [v5 attachmentIdentifier];
  objc_super v12 = [v11 UUIDString];
  BOOL v13 = [*(id *)(*(void *)(a1 + 32) + 128) zoneIdentifier];
  v14 = [v13 zoneIdentifier];
  v15 = +[HDCloudSyncAttachmentRecord recordIDForAttachmentIdentifier:v12 zoneID:v14];

  [*(id *)(*(void *)(a1 + 32) + 104) addObject:v5];
  uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 128) containsRecordWithRecordID:v10 error:a3];
  if (v16)
  {
    if (v16 != 2)
    {
LABEL_12:
      BOOL v23 = 1;
      goto LABEL_13;
    }
    [*(id *)(*(void *)(a1 + 32) + 112) addObject:v5];
    v17 = *(void **)(*(void *)(a1 + 32) + 120);
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __86__HDCloudSyncPushReferencesOperation__generateReferenceAndAttachmentRecordsWithError___block_invoke_3;
    v54[3] = &unk_1E62F6518;
    id v18 = v15;
    id v55 = v18;
    if (objc_msgSend(v17, "hk_containsObjectPassingTest:", v54))
    {
LABEL_11:

      goto LABEL_12;
    }
    v19 = *(void **)(*(void *)(a1 + 32) + 128);
    id v53 = 0;
    v20 = [v19 recordForRecordID:v18 class:objc_opt_class() error:&v53];
    id v21 = v53;
    if (v21)
    {
      id v22 = v21;
      if (a3) {
        *a3 = v21;
      }
      else {
        _HKLogDroppedError();
      }

      goto LABEL_16;
    }
    if (v20)
    {
      id v24 = 0;
LABEL_10:
      char v25 = *(void **)(*(void *)(a1 + 32) + 120);
      id v26 = [v20 record];
      [v25 addObject:v26];

      goto LABEL_11;
    }
    id v44 = [v5 attachmentIdentifier];
    id v47 = [*(id *)(a1 + 32) configuration];
    v28 = [v47 repository];
    v29 = [v28 profile];
    v30 = [v29 legacyRepositoryProfile];
    id v52 = 0;
    v49 = +[HDAttachmentEntity attachmentWithIdentifier:v44 profile:v30 error:&v52];
    id v22 = v52;

    if (!v49)
    {
      if (!v22)
      {
        _HKInitializeLogging();
        char v41 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
        {
          uint64_t v43 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v57 = v43;
          __int16 v58 = 2114;
          id v59 = v5;
          _os_log_fault_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_FAULT, "%{public}@ No attachment found for reference %{public}@", buf, 0x16u);
        }
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 118, @"No attachment found for reference %@", v5);
        id v42 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v23 = v42 == 0;
        if (v42)
        {
          if (a3) {
            *a3 = v42;
          }
          else {
            _HKLogDroppedError();
          }
        }

        id v22 = 0;
        goto LABEL_17;
      }
      if (a3)
      {
        id v22 = v22;
        BOOL v23 = 0;
        *a3 = v22;
        goto LABEL_17;
      }
      _HKLogDroppedError();
LABEL_16:
      BOOL v23 = 0;
LABEL_17:

      goto LABEL_13;
    }
    id v45 = [*(id *)(a1 + 32) configuration];
    id v31 = [v45 repository];
    v32 = [v31 attachmentManager];
    id v51 = 0;
    uint64_t v33 = [v32 fileHandleForAttachment:v49 error:&v51];
    id v48 = v51;

    v34 = (void *)v33;
    if (v33)
    {
      v35 = [*(id *)(*(void *)(a1 + 32) + 128) zoneIdentifier];
      v36 = [v35 zoneIdentifier];
      id v50 = v22;
      +[HDCloudSyncAttachmentRecord recordWithAttachment:v49 fileHandle:v34 zoneID:v36 error:&v50];
      v20 = v46 = v34;
      id v24 = v50;

      if (v20)
      {

        goto LABEL_10;
      }
      v34 = v46;
      id v40 = v24;
      id v39 = v40;
      if (v40)
      {
        v37 = v48;
        if (a3)
        {
          id v39 = v40;
          BOOL v23 = 0;
          *a3 = v39;
        }
        else
        {
          _HKLogDroppedError();
          BOOL v23 = 0;
        }
        id v22 = v39;
      }
      else
      {
        id v22 = 0;
        BOOL v23 = 1;
        v37 = v48;
      }
    }
    else
    {
      v37 = v48;
      id v38 = v48;
      id v39 = v38;
      if (v38)
      {
        if (a3)
        {
          id v39 = v38;
          BOOL v23 = 0;
          *a3 = v39;
        }
        else
        {
          _HKLogDroppedError();
          BOOL v23 = 0;
        }
      }
      else
      {
        BOOL v23 = 1;
      }
    }

    goto LABEL_17;
  }
  BOOL v23 = 0;
LABEL_13:

  return v23;
}

uint64_t __86__HDCloudSyncPushReferencesOperation__generateReferenceAndAttachmentRecordsWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 recordID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (uint64_t)_updateReferencesToSynchronizedWithError:(void *)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = +[HDMutableDatabaseTransactionContext contextForWritingProtectedData];
  id v5 = [a1 configuration];
  v6 = [v5 accessibilityAssertion];
  BOOL v7 = [v4 contextWithAccessibilityAssertion:v6];

  v8 = [a1 configuration];
  v9 = [v8 repository];
  id v10 = [v9 profile];
  v11 = [v10 database];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__HDCloudSyncPushReferencesOperation__updateReferencesToSynchronizedWithError___block_invoke;
  v14[3] = &unk_1E62F6130;
  v14[4] = a1;
  uint64_t v12 = [v11 performTransactionWithContext:v7 error:a2 block:v14 inaccessibilityHandler:0];

  return v12;
}

void __73__HDCloudSyncPushReferencesOperation__pushToCloudKitAndFinishForRecords___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to modify records: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 32) finishWithSuccess:0 error:v4];
}

void __73__HDCloudSyncPushReferencesOperation__pushToCloudKitAndFinishForRecords___block_invoke_293(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v14 = 0;
  char v3 = -[HDCloudSyncPushReferencesOperation _updateReferencesToSynchronizedWithError:](v2, (uint64_t)&v14);
  id v4 = v14;
  if (v3)
  {
    _HKInitializeLogging();
    id v5 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = *(void **)(v6 + 112);
      uint64_t v8 = v5;
      uint64_t v9 = [v7 count];
      uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 120) count];
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v6;
      __int16 v17 = 2048;
      uint64_t v18 = v9;
      __int16 v19 = 2048;
      uint64_t v20 = v10;
      _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[attachments] %{public}@: Successfully pushed %lu reference and %lu attachments records", buf, 0x20u);
    }
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = 1;
    id v13 = 0;
  }
  else
  {
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = 0;
    id v13 = v4;
  }
  [v11 finishWithSuccess:v12 error:v13];
}

BOOL __79__HDCloudSyncPushReferencesOperation__updateReferencesToSynchronizedWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDAttachmentReferenceEntity setCloudStatus:1 references:*(void *)(*(void *)(a1 + 32) + 104) transaction:a2 error:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentZone, 0);
  objc_storeStrong((id *)&self->_attachmentRecordsToPush, 0);
  objc_storeStrong((id *)&self->_referencesToPush, 0);

  objc_storeStrong((id *)&self->_unsynchronizedReferences, 0);
}

@end