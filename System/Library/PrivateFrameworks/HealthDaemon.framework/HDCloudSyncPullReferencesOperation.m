@interface HDCloudSyncPullReferencesOperation
- (HDCloudSyncPullReferencesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (uint64_t)_persistPendingReferencesIfNeededWithError:(id *)a1;
- (void)_fetchAttachmentRecordAssets;
- (void)main;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncPullReferencesOperation

- (HDCloudSyncPullReferencesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)HDCloudSyncPullReferencesOperation;
  v4 = [(HDCloudSyncOperation *)&v12 initWithConfiguration:a3 cloudState:a4];
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    attachmentRecordsToFetch = v4->_attachmentRecordsToFetch;
    v4->_attachmentRecordsToFetch = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    referencesToPersist = v4->_referencesToPersist;
    v4->_referencesToPersist = v7;

    v9 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = v4->_taskGroup;
    v4->_taskGroup = v9;

    [(HDSynchronousTaskGroup *)v4->_taskGroup setDelegate:v4];
  }
  return v4;
}

- (void)main
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];
  v5 = [v4 profile];
  v6 = [v5 legacyRepositoryProfile];
  id v57 = 0;
  int64_t v7 = HDCloudSyncAttachmentReferenceEpoch(v6, (uint64_t)&v57);
  id v8 = v57;
  self->_epoch = v7;

  if (self->_epoch) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  if (v9)
  {
    id v52 = v8;
    v10 = [(HDCloudSyncOperation *)self configuration];
    v11 = [v10 cachedCloudState];
    objc_super v12 = [(HDCloudSyncOperation *)self configuration];
    v13 = [v12 repository];
    v14 = [v13 primaryCKContainer];
    v15 = [v14 containerIdentifier];
    id v56 = 0;
    v16 = [v11 attachmentZoneForContainerID:v15 error:&v56];
    id v17 = v56;
    attachmentZone = self->_attachmentZone;
    self->_attachmentZone = v16;

    v19 = self->_attachmentZone;
    v20 = v17;
    if (!v19 && v17)
    {
      v21 = self;
      uint64_t v22 = 0;
      id v23 = v17;
LABEL_9:
      [(HDCloudSyncOperation *)v21 finishWithSuccess:v22 error:v23];
LABEL_25:
      id v8 = v52;

      goto LABEL_26;
    }
    if (!v19)
    {
      v24 = [(HDCloudSyncOperation *)self configuration];
      v25 = [v24 repository];
      uint64_t v26 = [v25 profileType];

      if (v26 != 1)
      {
        v21 = self;
        uint64_t v22 = 1;
        id v23 = 0;
        goto LABEL_9;
      }
    }
    v27 = [(HDCloudSyncOperation *)self configuration];
    v28 = [v27 accessibilityAssertion];
    v29 = +[HDDatabaseTransactionContext contextForAccessibilityAssertion:v28];

    v30 = [(HDCloudSyncOperation *)self configuration];
    v31 = [v30 repository];
    v32 = [v31 profile];
    v33 = [v32 database];
    v54[4] = self;
    id v55 = 0;
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __42__HDCloudSyncPullReferencesOperation_main__block_invoke;
    v54[3] = &unk_1E62F6A18;
    char v34 = [v33 performWithTransactionContext:v29 error:&v55 block:v54];
    id v35 = v55;

    if ((v34 & 1) == 0)
    {
      [(HDSynchronousTaskGroup *)self->_taskGroup failTaskWithError:v35];
LABEL_24:

      goto LABEL_25;
    }
    v51 = v29;
    v36 = v20;
    if ([(NSMutableDictionary *)self->_attachmentRecordsToFetch count])
    {
      v37 = objc_alloc_init(HDMutableDatabaseTransactionContext);
      v38 = [(HDCloudSyncOperation *)self configuration];
      v39 = [v38 accessibilityAssertion];
      v40 = [(HDMutableDatabaseTransactionContext *)v37 contextWithAccessibilityAssertion:v39];

      v41 = [(HDCloudSyncOperation *)self configuration];
      v42 = [v41 repository];
      v43 = [v42 profile];
      v44 = [v43 database];
      id v58 = 0;
      *(void *)v63 = MEMORY[0x1E4F143A8];
      *(void *)&v63[8] = 3221225472;
      *(void *)&v63[16] = __68__HDCloudSyncPullReferencesOperation__persistUnsupportedAttachments__block_invoke;
      v64 = &unk_1E62F6A18;
      v65 = self;
      LOBYTE(v37) = [v44 performWithTransactionContext:v40 error:&v58 block:v63];
      id v45 = v58;

      if ((v37 & 1) == 0)
      {
        _HKInitializeLogging();
        v46 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v60 = self;
          __int16 v61 = 2114;
          id v62 = v45;
          _os_log_error_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to ingest unsupported attachments with error: %{public}@", buf, 0x16u);
        }
      }

      -[HDCloudSyncPullReferencesOperation _fetchAttachmentRecordAssets]((id *)&self->super.super.isa);
    }
    else
    {
      id v53 = 0;
      char v47 = -[HDCloudSyncPullReferencesOperation _persistPendingReferencesIfNeededWithError:]((id *)&self->super.super.isa, (uint64_t)&v53);
      id v48 = v53;
      v49 = v48;
      if ((v47 & 1) == 0)
      {
        _HKInitializeLogging();
        v50 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v63 = 138543618;
          *(void *)&v63[4] = self;
          *(_WORD *)&v63[12] = 2114;
          *(void *)&v63[14] = v49;
          _os_log_error_impl(&dword_1BCB7D000, v50, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to persist pending references, %{public}@", v63, 0x16u);
        }
        [(HDSynchronousTaskGroup *)self->_taskGroup failTaskWithError:v49];

        goto LABEL_23;
      }
    }
    [(HDSynchronousTaskGroup *)self->_taskGroup finishTask];
LABEL_23:
    v20 = v36;
    v29 = v51;
    goto LABEL_24;
  }
  [(HDSynchronousTaskGroup *)self->_taskGroup failTaskWithError:v8];
LABEL_26:
}

uint64_t __42__HDCloudSyncPullReferencesOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(*(void *)(a1 + 32) + 120);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 128);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__HDCloudSyncPullReferencesOperation_main__block_invoke_2;
  v9[3] = &unk_1E6301888;
  v9[4] = v6;
  return [v4 recordsForClass:v5 epoch:v7 error:a2 enumerationHandler:v9];
}

uint64_t __42__HDCloudSyncPullReferencesOperation_main__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(v8 + 128);
  if (v9 <= a3) {
    uint64_t v9 = a3;
  }
  *(void *)(v8 + 128) = v9;
  v10 = objc_msgSend(v6, "attachmentReference", a4);
  v11 = *(void **)(*(void *)(a1 + 32) + 112);
  objc_super v12 = [v7 referenceIdentifier];
  [v11 setObject:v10 forKeyedSubscript:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F29128]);
  v14 = [v7 attachmentIdentifier];
  v15 = (void *)[v13 initWithUUIDString:v14];
  v16 = [*(id *)(a1 + 32) configuration];
  id v17 = [v16 repository];
  v18 = [v17 profile];
  v19 = [v18 legacyRepositoryProfile];
  id v47 = 0;
  v20 = +[HDAttachmentEntity attachmentWithIdentifier:v15 profile:v19 error:&v47];
  id v21 = v47;

  if (!v20 && v21)
  {
    if (v43)
    {
      id v22 = v21;
      uint64_t v23 = 0;
      void *v43 = v22;
      goto LABEL_29;
    }
    _HKLogDroppedError();
    uint64_t v23 = 0;
LABEL_22:
    id v22 = v21;
    goto LABEL_29;
  }
  if (v20)
  {
    uint64_t v23 = 1;
    goto LABEL_22;
  }
  v24 = *(void **)(*(void *)(a1 + 32) + 120);
  v25 = [v7 attachmentIdentifier];
  uint64_t v26 = [*(id *)(*(void *)(a1 + 32) + 120) zoneIdentifier];
  v27 = [v26 zoneIdentifier];
  v28 = +[HDCloudSyncAttachmentRecord recordIDForAttachmentIdentifier:v25 zoneID:v27];
  id v46 = v21;
  v29 = [v24 recordForRecordID:v28 class:objc_opt_class() error:&v46];
  id v22 = v46;

  if (v29) {
    BOOL v30 = 1;
  }
  else {
    BOOL v30 = v22 == 0;
  }
  uint64_t v23 = v30;
  if (v30)
  {
    if (v29)
    {
      v31 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __42__HDCloudSyncPullReferencesOperation_main__block_invoke_283;
      v44[3] = &unk_1E6301860;
      id v32 = v29;
      id v45 = v32;
      char v33 = objc_msgSend(v31, "hk_containsObjectPassingTest:", v44);

      if ((v33 & 1) == 0)
      {
        char v34 = *(void **)(*(void *)(a1 + 32) + 104);
        id v35 = [v7 attachmentIdentifier];
        [v34 setObject:v32 forKeyedSubscript:v35];
      }
    }
    else
    {
      _HKInitializeLogging();
      v36 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
      {
        uint64_t v37 = *(void *)(a1 + 32);
        v38 = v36;
        v39 = [v7 attachmentIdentifier];
        v40 = [v7 referenceIdentifier];
        *(_DWORD *)buf = 138543874;
        uint64_t v49 = v37;
        __int16 v50 = 2114;
        v51 = v39;
        __int16 v52 = 2114;
        id v53 = v40;
        _os_log_fault_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_FAULT, "%{public}@ Failed to find attachment record %{public}@ for reference %{public}@ in the cache", buf, 0x20u);
      }
    }
  }
  else if (v43)
  {
    void *v43 = v22;
  }
  else
  {
    _HKLogDroppedError();
  }

LABEL_29:
  return v23;
}

uint64_t __42__HDCloudSyncPullReferencesOperation_main__block_invoke_283(uint64_t a1, void *a2)
{
  v3 = [a2 recordID];
  v4 = [*(id *)(a1 + 32) recordID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)_fetchAttachmentRecordAssets
{
  v24[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1[17] beginTask];
    if ([a1[13] count])
    {
      v23[0] = 0;
      v23[1] = v23;
      v23[2] = 0x2020000000;
      v23[3] = 0;
      v22[0] = 0;
      v22[1] = v22;
      v22[2] = 0x2020000000;
      v22[3] = 0;
      v2 = [a1[13] allValues];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __66__HDCloudSyncPullReferencesOperation__fetchAttachmentRecordAssets__block_invoke;
      v21[3] = &unk_1E63018D8;
      v21[4] = v23;
      v21[5] = v22;
      v3 = objc_msgSend(v2, "hk_map:", v21);

      if ([v3 count])
      {
        if (!v3) {
          goto LABEL_12;
        }
      }
      else
      {
        uint64_t v5 = [a1[13] allValues];
        id v6 = [v5 firstObject];
        uint64_t v7 = [v6 recordID];
        v24[0] = v7;
        uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];

        v3 = (void *)v8;
        if (!v8) {
          goto LABEL_12;
        }
      }
      if ([v3 count])
      {
        uint64_t v9 = [HDCloudSyncFetchRecordsOperation alloc];
        v10 = [a1 configuration];
        v11 = [a1 configuration];
        objc_super v12 = [v11 repository];
        id v13 = [v12 primaryCKContainer];
        v14 = [(HDCloudSyncFetchRecordsOperation *)v9 initWithConfiguration:v10 container:v13 recordIDs:v3];

        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __66__HDCloudSyncPullReferencesOperation__fetchAttachmentRecordAssets__block_invoke_2;
        v19[3] = &unk_1E6301900;
        v19[4] = a1;
        id v15 = v3;
        id v20 = v15;
        [(HDCloudSyncOperation *)v14 setOnError:v19];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __66__HDCloudSyncPullReferencesOperation__fetchAttachmentRecordAssets__block_invoke_293;
        v17[3] = &unk_1E6301928;
        v17[4] = a1;
        id v18 = v15;
        [(HDCloudSyncOperation *)v14 setOnSuccess:v17];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __66__HDCloudSyncPullReferencesOperation__fetchAttachmentRecordAssets__block_invoke_295;
        v16[3] = &unk_1E6301950;
        v16[4] = a1;
        [(HDCloudSyncFetchRecordsOperation *)v14 setRecordHandler:v16];
        [(HDCloudSyncOperation *)v14 start];

LABEL_13:
        _Block_object_dispose(v22, 8);
        _Block_object_dispose(v23, 8);
        return;
      }
LABEL_12:
      [a1[17] finishTask];
      goto LABEL_13;
    }
    id v4 = a1[17];
    [v4 finishTask];
  }
}

- (uint64_t)_persistPendingReferencesIfNeededWithError:(id *)a1
{
  if (!a1) {
    return 0;
  }
  id v4 = [a1[14] allValues];
  uint64_t v5 = [v4 count];

  if (!v5) {
    return 1;
  }
  id v6 = +[HDMutableDatabaseTransactionContext contextForWritingProtectedData];
  uint64_t v7 = [a1 configuration];
  uint64_t v8 = [v7 accessibilityAssertion];
  uint64_t v9 = [v6 contextWithAccessibilityAssertion:v8];

  v10 = [a1 configuration];
  v11 = [v10 repository];
  objc_super v12 = [v11 profile];
  id v13 = [v12 database];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__HDCloudSyncPullReferencesOperation__persistPendingReferencesIfNeededWithError___block_invoke;
  v16[3] = &unk_1E62F6A18;
  v16[4] = a1;
  uint64_t v14 = [v13 performWithTransactionContext:v9 error:a2 block:v16];

  return v14;
}

uint64_t __68__HDCloudSyncPullReferencesOperation__persistUnsupportedAttachments__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
  uint64_t v42 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (v42)
  {
    v39 = a2;
    uint64_t v41 = *(void *)v57;
    while (2)
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v57 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = v4;
        uint64_t v5 = *(void **)(*((void *)&v56 + 1) + 8 * v4);
        id v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "allValues", v39);
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __68__HDCloudSyncPullReferencesOperation__persistUnsupportedAttachments__block_invoke_2;
        v55[3] = &unk_1E63018B0;
        v43 = v5;
        v55[4] = v5;
        uint64_t v7 = objc_msgSend(v6, "hk_filter:", v55);

        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v51 objects:v61 count:16];
        id v45 = v8;
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v52;
          while (2)
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v52 != v11) {
                objc_enumerationMutation(v45);
              }
              id v13 = *(void **)(*((void *)&v51 + 1) + 8 * i);
              uint64_t v14 = [*(id *)(a1 + 32) configuration];
              id v15 = [v14 repository];
              v16 = [v15 attachmentManager];
              uint64_t v17 = [v16 supportedSchemaVersionForReference:v13];

              if (!v17 || v17 >= [v13 schemaVersion])
              {
                char v34 = v45;
                id v23 = v45;
                goto LABEL_25;
              }
            }
            id v8 = v45;
            uint64_t v10 = [v45 countByEnumeratingWithState:&v51 objects:v61 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }

        id v18 = [*(id *)(a1 + 32) configuration];
        v19 = [v18 repository];
        id v20 = [v19 attachmentManager];
        id v21 = [v43 attachment];
        id v50 = 0;
        char v22 = [v20 insertAttachmentReferences:v8 attachment:v21 error:&v50];
        id v23 = v50;

        if ((v22 & 1) == 0)
        {
          id v36 = v23;
          uint64_t v37 = v36;
          if (v36)
          {
            if (v39) {
              void *v39 = v36;
            }
            else {
              _HKLogDroppedError();
            }
          }

          uint64_t v35 = 0;
          goto LABEL_33;
        }
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v24 = v8;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v46 objects:v60 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v47;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v47 != v27) {
                objc_enumerationMutation(v24);
              }
              v29 = *(void **)(*(void *)(a1 + 32) + 112);
              BOOL v30 = [*(id *)(*((void *)&v46 + 1) + 8 * j) identifier];
              v31 = [v30 UUIDString];
              [v29 removeObjectForKey:v31];
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v46 objects:v60 count:16];
          }
          while (v26);
        }

        id v32 = *(void **)(*(void *)(a1 + 32) + 104);
        char v33 = [v43 attachmentIdentifier];
        [v32 removeObjectForKey:v33];

        char v34 = v45;
LABEL_25:

        uint64_t v4 = v44 + 1;
      }
      while (v44 + 1 != v42);
      uint64_t v42 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
      if (v42) {
        continue;
      }
      break;
    }
  }
  uint64_t v35 = 1;
LABEL_33:

  return v35;
}

uint64_t __68__HDCloudSyncPullReferencesOperation__persistUnsupportedAttachments__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 attachmentIdentifier];
  uint64_t v5 = [v3 attachmentIdentifier];

  id v6 = [v5 UUIDString];
  uint64_t v7 = [v4 isEqualToString:v6];

  return v7;
}

id __66__HDCloudSyncPullReferencesOperation__fetchAttachmentRecordAssets__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) <= 99
    && (uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), [v3 fileSize] + v5 <= 104857600))
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v4 fileSize];
    id v6 = [v4 recordID];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __66__HDCloudSyncPullReferencesOperation__fetchAttachmentRecordAssets__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to fetch recordIDs %{public}@: %{public}@", (uint8_t *)&v8, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 32) + 136) failTaskWithError:v4];
}

uint64_t __66__HDCloudSyncPullReferencesOperation__fetchAttachmentRecordAssets__block_invoke_293(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    uint64_t v5 = v2;
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = [v3 count];
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[attachments] %{public}@: Successfully fetched %lu records", (uint8_t *)&v7, 0x16u);
  }
  -[HDCloudSyncPullReferencesOperation _fetchAttachmentRecordAssets](*(void *)(a1 + 32));
  return [*(id *)(*(void *)(a1 + 32) + 136) finishTask];
}

uint64_t __66__HDCloudSyncPullReferencesOperation__fetchAttachmentRecordAssets__block_invoke_295(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = +[HDCloudSyncRecord recordWithCKRecord:a2 error:a3];
    if (v5)
    {
      uint64_t v6 = [*(id *)(v3 + 112) allValues];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __66__HDCloudSyncPullReferencesOperation__ingestAssetForRecord_error___block_invoke;
      v42[3] = &unk_1E63018B0;
      char v33 = v5;
      id v7 = v5;
      id v43 = v7;
      uint64_t v8 = objc_msgSend(v6, "hk_filter:", v42);

      __int16 v9 = objc_alloc_init(HDMutableDatabaseTransactionContext);
      uint64_t v10 = [(id)v3 configuration];
      uint64_t v11 = [v10 accessibilityAssertion];
      uint64_t v12 = [(HDMutableDatabaseTransactionContext *)v9 contextWithAccessibilityAssertion:v11];

      id v13 = [(id)v3 configuration];
      uint64_t v14 = [v13 repository];
      id v15 = [v14 profile];
      v16 = [v15 database];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __66__HDCloudSyncPullReferencesOperation__ingestAssetForRecord_error___block_invoke_2;
      v38[3] = &unk_1E62F9F48;
      id v39 = v7;
      uint64_t v40 = v3;
      id v17 = v8;
      id v41 = v17;
      id v32 = (void *)v12;
      unsigned int v31 = [v16 performWithTransactionContext:v12 error:a3 block:v38];

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v44 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v35 != v21) {
              objc_enumerationMutation(v18);
            }
            id v23 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            id v24 = *(void **)(v3 + 112);
            uint64_t v25 = [v23 identifier];
            uint64_t v26 = [v25 UUIDString];
            [v24 removeObjectForKey:v26];

            uint64_t v27 = *(void **)(v3 + 104);
            v28 = [v23 attachmentIdentifier];
            v29 = [v28 UUIDString];
            [v27 removeObjectForKey:v29];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v44 count:16];
        }
        while (v20);
      }

      uint64_t v5 = v33;
      uint64_t v3 = v31;
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

uint64_t __66__HDCloudSyncPullReferencesOperation__ingestAssetForRecord_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 attachmentIdentifier];
  uint64_t v4 = [v3 UUIDString];
  uint64_t v5 = [*(id *)(a1 + 32) attachmentIdentifier];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

uint64_t __66__HDCloudSyncPullReferencesOperation__ingestAssetForRecord_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) hasAssetData])
  {
    uint64_t v4 = [*(id *)(a1 + 40) configuration];
    uint64_t v5 = [v4 repository];
    uint64_t v6 = [v5 attachmentManager];
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = [*(id *)(a1 + 32) attachment];
    __int16 v9 = [*(id *)(a1 + 32) assetData];
    id v42 = 0;
    char v10 = [v6 insertAttachmentReferences:v7 attachment:v8 fileData:v9 encrypt:0 error:&v42];
    uint64_t v11 = (HDInsertSynchronisedAttachmentReferences *)v42;

    if ((v10 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v12 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        unsigned int v31 = *(void **)(a1 + 32);
        uint64_t v30 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        uint64_t v44 = v30;
        __int16 v45 = 2114;
        long long v46 = v31;
        __int16 v47 = 2114;
        long long v48 = v11;
        _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to ingest attachment record %{public}@, %{public}@", buf, 0x20u);
      }
      id v13 = v11;
      uint64_t v14 = v13 == 0;
      if (!v13) {
        goto LABEL_17;
      }
      if (a2) {
        goto LABEL_7;
      }
LABEL_16:
      _HKLogDroppedError();
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  id v15 = (void *)MEMORY[0x1E4F28CB0];
  v16 = [*(id *)(a1 + 32) assetURL];
  id v41 = 0;
  id v13 = [v15 fileHandleForReadingFromURL:v16 error:&v41];
  uint64_t v11 = (HDInsertSynchronisedAttachmentReferences *)v41;

  if (v13)
  {
    id v17 = [*(id *)(a1 + 40) configuration];
    id v18 = [v17 repository];
    uint64_t v19 = [v18 attachmentManager];
    uint64_t v20 = *(void *)(a1 + 48);
    uint64_t v21 = [*(id *)(a1 + 32) attachment];
    id v40 = 0;
    int v22 = [v19 insertAttachmentReferences:v20 attachment:v21 fileHandle:v13 encrypt:0 error:&v40];
    id v23 = (HDInsertSynchronisedAttachmentReferences *)v40;

    [(HDInsertSynchronisedAttachmentReferences *)v13 closeFile];
    if (!v22)
    {
      _HKInitializeLogging();
      v28 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        id v39 = *(void **)(a1 + 32);
        uint64_t v38 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        uint64_t v44 = v38;
        __int16 v45 = 2114;
        long long v46 = v39;
        __int16 v47 = 2114;
        long long v48 = v23;
        _os_log_error_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to ingest attachment record %{public}@, %{public}@", buf, 0x20u);
      }
      id v24 = v23;
      uint64_t v14 = v24 == 0;
      if (v24)
      {
        if (a2) {
          *a2 = v24;
        }
        else {
          _HKLogDroppedError();
        }
      }

      goto LABEL_25;
    }

LABEL_11:
    uint64_t v11 = [[HDInsertSynchronisedAttachmentReferences alloc] initWithAttachmentReferences:*(void *)(a1 + 48)];
    id v13 = [*(id *)(a1 + 40) configuration];
    id v24 = [(HDInsertSynchronisedAttachmentReferences *)v13 repository];
    uint64_t v25 = [(HDInsertSynchronisedAttachmentReferences *)v24 profile];
    uint64_t v26 = [v25 legacyRepositoryProfile];
    uint64_t v14 = [(HDJournalableOperation *)v11 performOrJournalWithProfile:v26 error:a2];

LABEL_25:
    goto LABEL_26;
  }
  _HKInitializeLogging();
  uint64_t v27 = (void *)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    uint64_t v34 = a1 + 32;
    id v32 = *(void **)(a1 + 32);
    uint64_t v33 = *(void *)(v34 + 8);
    long long v35 = v27;
    long long v36 = [v32 assetURL];
    long long v37 = [v36 path];
    *(_DWORD *)buf = 138543874;
    uint64_t v44 = v33;
    __int16 v45 = 2114;
    long long v46 = v37;
    __int16 v47 = 2114;
    long long v48 = v11;
    _os_log_error_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to retreive fileHandle for %{public}@, %{public}@", buf, 0x20u);
  }
  id v13 = v11;
  uint64_t v14 = v13 == 0;
  if (!v13) {
    goto LABEL_17;
  }
  if (!a2) {
    goto LABEL_16;
  }
LABEL_7:
  *a2 = v13;
LABEL_17:
  uint64_t v11 = v13;
LABEL_26:

  return v14;
}

uint64_t __81__HDCloudSyncPullReferencesOperation__persistPendingReferencesIfNeededWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [HDInsertSynchronisedAttachmentReferences alloc];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 112) allValues];
  uint64_t v6 = [(HDInsertSynchronisedAttachmentReferences *)v4 initWithAttachmentReferences:v5];

  uint64_t v7 = [*(id *)(a1 + 32) configuration];
  uint64_t v8 = [v7 repository];
  __int16 v9 = [v8 profile];
  char v10 = [v9 legacyRepositoryProfile];
  uint64_t v11 = [(HDJournalableOperation *)v6 performOrJournalWithProfile:v10 error:a2];

  return v11;
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  BOOL v6 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    id v24 = 0;
    char v10 = -[HDCloudSyncPullReferencesOperation _persistPendingReferencesIfNeededWithError:]((id *)&self->super.super.isa, (uint64_t)&v24);
    id v11 = v24;
    if ((v10 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v21 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = self;
        __int16 v27 = 2114;
        id v28 = v11;
        _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to persist pending references, %{public}@", buf, 0x16u);
      }
      uint64_t v19 = self;
      BOOL v20 = 0;
      goto LABEL_9;
    }
    id v22 = v8;
    int64_t epoch = self->_epoch;
    id v13 = [(HDCloudSyncOperation *)self configuration];
    uint64_t v14 = [v13 repository];
    id v15 = [v14 profile];
    v16 = [v15 legacyRepositoryProfile];
    id v23 = 0;
    int v17 = HDSetCloudSyncAttachmentReferenceEpoch(epoch, v16, (uint64_t)&v23);
    id v18 = v23;

    if (!v17)
    {
      [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v18];

      id v8 = v22;
      goto LABEL_10;
    }

    id v8 = v22;
  }
  id v11 = [v9 firstObject];
  uint64_t v19 = self;
  BOOL v20 = v6;
LABEL_9:
  [(HDCloudSyncOperation *)v19 finishWithSuccess:v20 error:v11];
LABEL_10:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskGroup, 0);
  objc_storeStrong((id *)&self->_attachmentZone, 0);
  objc_storeStrong((id *)&self->_referencesToPersist, 0);

  objc_storeStrong((id *)&self->_attachmentRecordsToFetch, 0);
}

@end