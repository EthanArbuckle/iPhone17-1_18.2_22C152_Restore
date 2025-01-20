@interface HDCloudSyncPushReferenceTombstonesOperation
- (HDCloudSyncPushReferenceTombstonesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (void)main;
@end

@implementation HDCloudSyncPushReferenceTombstonesOperation

- (HDCloudSyncPushReferenceTombstonesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)HDCloudSyncPushReferenceTombstonesOperation;
  v4 = [(HDCloudSyncOperation *)&v14 initWithConfiguration:a3 cloudState:a4];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unsynchronizedTombstones = v4->_unsynchronizedTombstones;
    v4->_unsynchronizedTombstones = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    referenceRecordsToDelete = v4->_referenceRecordsToDelete;
    v4->_referenceRecordsToDelete = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    attachmentsRecordsToDelete = v4->_attachmentsRecordsToDelete;
    v4->_attachmentsRecordsToDelete = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    tombstoneRecordsToPush = v4->_tombstoneRecordsToPush;
    v4->_tombstoneRecordsToPush = v11;
  }
  return v4;
}

- (void)main
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 cachedCloudState];
  v5 = [(HDCloudSyncOperation *)self configuration];
  v6 = [v5 repository];
  v7 = [v6 primaryCKContainer];
  v8 = [v7 containerIdentifier];
  id v68 = 0;
  v9 = [v4 attachmentZoneForContainerID:v8 error:&v68];
  id v10 = v68;
  attachmentZone = self->_attachmentZone;
  self->_attachmentZone = v9;

  v12 = self->_attachmentZone;
  if (v12) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v10 == 0;
  }
  if (!v13)
  {
    v60 = self;
    uint64_t v61 = 0;
    id v62 = v10;
LABEL_18:
    [(HDCloudSyncOperation *)v60 finishWithSuccess:v61 error:v62];
    goto LABEL_19;
  }
  if (!v12)
  {
    objc_super v14 = [(HDCloudSyncOperation *)self configuration];
    v15 = [v14 repository];
    uint64_t v16 = [v15 profileType];

    if (v16 != 1)
    {
LABEL_17:
      v60 = self;
      uint64_t v61 = 1;
      id v62 = 0;
      goto LABEL_18;
    }
  }
  id v66 = v10;
  v17 = [(HDCloudSyncOperation *)self configuration];
  v18 = [v17 repository];
  v19 = [v18 profile];
  v20 = [v19 cloudSyncManager];
  uint64_t v21 = [v20 ownerIdentifierManager];
  v22 = [(HDCloudSyncOperation *)self configuration];
  v23 = [v22 repository];
  v24 = [v23 primaryCKContainer];
  v25 = [(id)v21 cachedOwnerIdentifierForContainer:v24];

  v26 = +[HDMutableDatabaseTransactionContext contextForReadingProtectedData];
  v27 = [(HDCloudSyncOperation *)self configuration];
  v28 = [v27 accessibilityAssertion];
  v29 = [v26 contextWithAccessibilityAssertion:v28];

  v30 = [(HDCloudSyncOperation *)self configuration];
  v31 = [v30 repository];
  v32 = [v31 profile];
  v33 = [v32 database];
  v69[0] = 0;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  v71 = __116__HDCloudSyncPushReferenceTombstonesOperation__generateTombstoneRecordsToPushAndReferencesRecordsToDeleteWithError___block_invoke;
  v72 = &unk_1E62F2AE0;
  v73 = self;
  id v74 = v25;
  id v34 = v25;
  LOBYTE(v21) = [v33 performTransactionWithContext:v29 error:v69 block:&buf inaccessibilityHandler:0];
  id v35 = v69[0];

  if ((v21 & 1) == 0)
  {
    [(HDCloudSyncOperation *)self finishWithSuccess:0 error:0];
    id v10 = v66;
    goto LABEL_19;
  }
  if (![(NSMutableSet *)self->_tombstoneRecordsToPush count])
  {
    _HKInitializeLogging();
    v63 = *MEMORY[0x1E4F29FA8];
    id v10 = v66;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_1BCB7D000, v63, OS_LOG_TYPE_DEFAULT, "[attachments] %{public}@ No reference tombstones to push.", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_17;
  }
  id v67 = 0;
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v37 = +[HDMutableDatabaseTransactionContext contextForReadingProtectedData];
  v38 = [(HDCloudSyncOperation *)self configuration];
  v39 = [v38 accessibilityAssertion];
  v40 = [v37 contextWithAccessibilityAssertion:v39];

  v41 = [(HDCloudSyncOperation *)self configuration];
  v42 = [v41 repository];
  v43 = [v42 profile];
  v44 = [v43 database];
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  v71 = __122__HDCloudSyncPushReferenceTombstonesOperation__updateRecordsToDeleteBySkippingAttachmentsWithMultipleReferencesWithError___block_invoke;
  v72 = &unk_1E62F2AE0;
  v73 = self;
  id v45 = v36;
  id v74 = v45;
  int v46 = [v44 performTransactionWithContext:v40 error:&v67 block:&buf inaccessibilityHandler:0];

  if (v46) {
    [(NSMutableSet *)self->_attachmentsRecordsToDelete minusSet:v45];
  }

  id v47 = v67;
  if (v46)
  {
    tombstoneRecordsToPush = self->_tombstoneRecordsToPush;
    [(NSMutableSet *)self->_referenceRecordsToDelete setByAddingObjectsFromSet:self->_attachmentsRecordsToDelete];
    id v65 = v47;
    id v49 = (id)objc_claimAutoreleasedReturnValue();
    v50 = tombstoneRecordsToPush;
    v51 = [HDCloudSyncModifyRecordsOperation alloc];
    v52 = [(HDCloudSyncOperation *)self configuration];
    v53 = [(HDCloudSyncOperation *)self configuration];
    v54 = [v53 repository];
    v55 = [v54 primaryCKContainer];
    v56 = [(NSMutableSet *)v50 allObjects];

    v57 = [v49 allObjects];

    v58 = v51;
    id v47 = v65;
    v59 = [(HDCloudSyncModifyRecordsOperation *)v58 initWithConfiguration:v52 container:v55 recordsToSave:v56 recordIDsToDelete:v57];

    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v71 = __95__HDCloudSyncPushReferenceTombstonesOperation__modifyCloudWithRecordsToSave_recordIDsToDelete___block_invoke;
    v72 = &unk_1E62F2950;
    v73 = self;
    [(HDCloudSyncOperation *)v59 setOnError:&buf];
    v69[0] = (id)MEMORY[0x1E4F143A8];
    v69[1] = (id)3221225472;
    v69[2] = __95__HDCloudSyncPushReferenceTombstonesOperation__modifyCloudWithRecordsToSave_recordIDsToDelete___block_invoke_294;
    v69[3] = &unk_1E62F2928;
    v69[4] = self;
    [(HDCloudSyncOperation *)v59 setOnSuccess:v69];
    [(HDCloudSyncOperation *)v59 start];
  }
  else
  {
    _HKInitializeLogging();
    v64 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_1BCB7D000, v64, OS_LOG_TYPE_DEFAULT, "[attachments] %{public}@ Failed to skip attachments with multiple references.", (uint8_t *)&buf, 0xCu);
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v47];
  }
  id v10 = v66;

LABEL_19:
}

BOOL __116__HDCloudSyncPushReferenceTombstonesOperation__generateTombstoneRecordsToPushAndReferencesRecordsToDeleteWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__130;
  uint64_t v21 = __Block_byref_object_dispose__130;
  id v22 = 0;
  v6 = HDAttachmentReferencePredicateForUnsynchronizedTombstones();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __116__HDCloudSyncPushReferenceTombstonesOperation__generateTombstoneRecordsToPushAndReferencesRecordsToDeleteWithError___block_invoke_280;
  v14[3] = &unk_1E6304D18;
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  uint64_t v16 = &v17;
  v14[4] = v7;
  id v15 = v8;
  BOOL v9 = +[HDAttachmentReferenceEntity enumerateReferencesWithPredicate:v6 transaction:v5 error:a3 enumerationHandler:v14];

  if (v9)
  {
    id v10 = (void *)v18[5];
    if (v10)
    {
      v11 = *(void **)(*(void *)(a1 + 32) + 128);
      v12 = [v10 record];
      [v11 addObject:v12];
    }
  }

  _Block_object_dispose(&v17, 8);
  return v9;
}

uint64_t __116__HDCloudSyncPushReferenceTombstonesOperation__generateTombstoneRecordsToPushAndReferencesRecordsToDeleteWithError___block_invoke_280(uint64_t a1, void *a2, void *a3)
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v77 = a2;
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v5)
  {
    uint64_t v75 = a3;
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) string];
    if (v6)
    {
      v87[0] = 0;
      v87[1] = v87;
      v87[2] = 0x2020000000;
      v87[3] = 0;
      uint64_t v81 = 0;
      v82 = &v81;
      uint64_t v83 = 0x3032000000;
      v84 = __Block_byref_object_copy__130;
      v85 = __Block_byref_object_dispose__130;
      id v86 = 0;
      v8 = *(void **)(v6 + 136);
      uint64_t v9 = objc_opt_class();
      id v80 = 0;
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __101__HDCloudSyncPushReferenceTombstonesOperation_tombstoneRecordToPushForZoneWithOwnerIdentifier_error___block_invoke;
      v89 = &unk_1E6304D40;
      id v10 = v7;
      id v90 = v10;
      v91 = v87;
      v92 = &v81;
      char v11 = [v8 recordsForClass:v9 epoch:0 error:&v80 enumerationHandler:buf];
      id v12 = v80;
      BOOL v13 = v12;
      if (v11)
      {
        objc_super v14 = (void *)v82[5];
        if (!v14)
        {
          id v15 = [HDCloudSyncAttachmentReferenceTombstoneRecord alloc];
          uint64_t v16 = [*(id *)(v6 + 136) zoneIdentifier];
          uint64_t v17 = [v16 zoneIdentifier];
          uint64_t v18 = [(HDCloudSyncAttachmentReferenceTombstoneRecord *)v15 initWithOwnerIdentifier:v10 recordIndex:0 zoneID:v17];
          uint64_t v19 = (void *)v82[5];
          v82[5] = v18;

          objc_super v14 = (void *)v82[5];
        }
        if ([v14 attachmentReferenceTombstoneCount] >= 10000)
        {
          uint64_t v20 = [(id)v82[5] recordIndex];
          uint64_t v21 = [HDCloudSyncAttachmentReferenceTombstoneRecord alloc];
          id v22 = [*(id *)(v6 + 136) zoneIdentifier];
          v23 = [v22 zoneIdentifier];
          uint64_t v24 = [(HDCloudSyncAttachmentReferenceTombstoneRecord *)v21 initWithOwnerIdentifier:v10 recordIndex:v20 + 1 zoneID:v23];
          v25 = (void *)v82[5];
          v82[5] = v24;
        }
        id v26 = (id)v82[5];
        id v27 = 0;
      }
      else
      {
        if (v12)
        {
          id v27 = v12;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failed to retrieve tombstone record from cache.");
          id v28 = (id)objc_claimAutoreleasedReturnValue();
          id v27 = v28;
          if (v28) {
            id v29 = v28;
          }
        }
        id v26 = 0;
      }

      _Block_object_dispose(&v81, 8);
      _Block_object_dispose(v87, 8);
    }
    else
    {
      id v27 = 0;
      id v26 = 0;
    }

    id v30 = v27;
    uint64_t v31 = *(void *)(*(void *)(a1 + 48) + 8);
    v32 = *(void **)(v31 + 40);
    *(void *)(v31 + 40) = v26;

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      id v70 = v30;
      id v51 = v70;
      if (v70)
      {
        if (v75)
        {
          id v51 = v70;
          uint64_t v52 = 0;
          *uint64_t v75 = v51;
        }
        else
        {
          _HKLogDroppedError();
          uint64_t v52 = 0;
        }
        id v47 = v51;
      }
      else
      {
        id v47 = 0;
        uint64_t v52 = 1;
      }
      goto LABEL_46;
    }

    id v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  if ([v5 attachmentReferenceTombstoneCount] >= 10000)
  {
    v33 = *(void **)(*(void *)(a1 + 32) + 128);
    id v34 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) record];
    [v33 addObject:v34];

    uint64_t v35 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) recordIndex];
    id v36 = [HDCloudSyncAttachmentReferenceTombstoneRecord alloc];
    v37 = [*(id *)(a1 + 40) string];
    v38 = [*(id *)(*(void *)(a1 + 32) + 136) zoneIdentifier];
    v39 = [v38 zoneIdentifier];
    uint64_t v40 = [(HDCloudSyncAttachmentReferenceTombstoneRecord *)v36 initWithOwnerIdentifier:v37 recordIndex:v35 + 1 zoneID:v39];
    uint64_t v41 = *(void *)(*(void *)(a1 + 48) + 8);
    v42 = *(void **)(v41 + 40);
    *(void *)(v41 + 40) = v40;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addAttachmentReferenceTombstone:v77];
  v43 = [v77 identifier];
  v44 = [v43 UUIDString];
  id v45 = [*(id *)(*(void *)(a1 + 32) + 136) zoneIdentifier];
  int v46 = [v45 zoneIdentifier];
  id v47 = +[HDCloudSyncAttachmentReferenceRecord recordIDForReferenceIdentifier:v44 zoneID:v46];

  v48 = *(void **)(*(void *)(a1 + 32) + 136);
  id v79 = 0;
  id v49 = [v48 recordForRecordID:v47 class:objc_opt_class() error:&v79];
  id v50 = v79;
  id v51 = v50;
  if (v49 || !v50)
  {
    if (v49)
    {
      v53 = [v49 attachmentIdentifier];
      v54 = [*(id *)(*(void *)(a1 + 32) + 136) zoneIdentifier];
      v55 = [v54 zoneIdentifier];
      v76 = +[HDCloudSyncAttachmentRecord recordIDForAttachmentIdentifier:v53 zoneID:v55];

      v56 = *(void **)(*(void *)(a1 + 32) + 136);
      id v78 = 0;
      v57 = [v56 recordForRecordID:v76 class:objc_opt_class() error:&v78];
      id v58 = v78;
      v59 = v58;
      if (v57) {
        BOOL v60 = 1;
      }
      else {
        BOOL v60 = v58 == 0;
      }
      uint64_t v52 = v60;
      if (v60)
      {
        if (v57)
        {
          uint64_t v62 = *(void *)(a1 + 32);
          uint64_t v61 = a1 + 32;
          v63 = *(void **)(v62 + 112);
          v64 = [v49 record];
          id v65 = [v64 recordID];
          [v63 addObject:v65];

          id v66 = *(void **)(*(void *)v61 + 120);
          id v67 = [v57 record];
          id v68 = [v67 recordID];
          [v66 addObject:v68];

          [*(id *)(*(void *)v61 + 104) addObject:v77];
        }
        else
        {
          _HKInitializeLogging();
          v71 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
          {
            uint64_t v74 = *(void *)(a1 + 32);
            *(_DWORD *)long long buf = 138543618;
            *(void *)&buf[4] = v74;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v49;
            _os_log_fault_impl(&dword_1BCB7D000, v71, OS_LOG_TYPE_FAULT, "[attachments] %{public}@ Missing attachment record for corresponding reference %{public}@.", buf, 0x16u);
          }
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      v69 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v73 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138543618;
        *(void *)&buf[4] = v73;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v77;
        _os_log_error_impl(&dword_1BCB7D000, v69, OS_LOG_TYPE_ERROR, "[attachments] %{public}@ Failed to find record for reference %{public}@.", buf, 0x16u);
      }
      uint64_t v52 = 1;
    }
  }
  else
  {
    uint64_t v52 = 0;
  }

LABEL_46:
  return v52;
}

uint64_t __101__HDCloudSyncPushReferenceTombstonesOperation_tombstoneRecordToPushForZoneWithOwnerIdentifier_error___block_invoke(void *a1, void *a2)
{
  id v4 = a2;
  id v5 = [v4 ownerIdentifier];
  int v6 = [v5 isEqualToString:a1[4]];

  if (v6 && [v4 recordIndex] >= *(void *)(*(void *)(a1[5] + 8) + 24))
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = [v4 recordIndex];
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }

  return 1;
}

uint64_t __122__HDCloudSyncPushReferenceTombstonesOperation__updateRecordsToDeleteBySkippingAttachmentsWithMultipleReferencesWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 120);
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v21 = 0;
        id v22 = &v21;
        uint64_t v23 = 0x2020000000;
        char v24 = 0;
        id v8 = objc_alloc(MEMORY[0x1E4F29128]);
        uint64_t v9 = +[HDCloudSyncAttachmentRecord attachmentIdentifierForRecordID:v7];
        id v10 = (void *)[v8 initWithUUIDString:v9];

        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __122__HDCloudSyncPushReferenceTombstonesOperation__updateRecordsToDeleteBySkippingAttachmentsWithMultipleReferencesWithError___block_invoke_2;
        v20[3] = &unk_1E63013D0;
        v20[4] = &v21;
        if (!+[HDAttachmentReferenceEntity enumerateReferencesForAttachmentIdentifier:v10 type:0 transaction:v19 error:a3 enumerationHandler:v20])
        {

          _Block_object_dispose(&v21, 8);
          uint64_t v15 = 0;
          goto LABEL_15;
        }
        if (*((unsigned char *)v22 + 24))
        {
          _HKInitializeLogging();
          char v11 = (id)*MEMORY[0x1E4F29F18];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v12 = a3;
            uint64_t v13 = *(void *)(a1 + 32);
            objc_super v14 = [v10 UUIDString];
            *(_DWORD *)long long buf = 138543618;
            uint64_t v30 = v13;
            __int16 v31 = 2114;
            v32 = v14;
            _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "[attachments] %{public}@: Skipping deletion for attachment with multiple references %{public}@", buf, 0x16u);

            a3 = v12;
          }

          [*(id *)(a1 + 40) addObject:v7];
        }

        _Block_object_dispose(&v21, 8);
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 1;
LABEL_15:

  return v15;
}

uint64_t __122__HDCloudSyncPushReferenceTombstonesOperation__updateRecordsToDeleteBySkippingAttachmentsWithMultipleReferencesWithError___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

void __95__HDCloudSyncPushReferenceTombstonesOperation__modifyCloudWithRecordsToSave_recordIDsToDelete___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = *MEMORY[0x1E4F29FA8];
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

void __95__HDCloudSyncPushReferenceTombstonesOperation__modifyCloudWithRecordsToSave_recordIDsToDelete___block_invoke_294(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v22 = 0;
  if (!v2)
  {
    id v12 = 0;
    goto LABEL_7;
  }
  v3 = +[HDMutableDatabaseTransactionContext contextForWritingProtectedData];
  id v4 = [v2 configuration];
  uint64_t v5 = [v4 accessibilityAssertion];
  uint64_t v6 = [v3 contextWithAccessibilityAssertion:v5];

  int v7 = [v2 configuration];
  uint64_t v8 = [v7 repository];
  __int16 v9 = [v8 profile];
  id v10 = [v9 database];
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __88__HDCloudSyncPushReferenceTombstonesOperation__updateTombstonesToSynchronizedWithError___block_invoke;
  char v24 = &unk_1E62F6130;
  long long v25 = v2;
  char v11 = [v10 performTransactionWithContext:v6 error:&v22 block:buf inaccessibilityHandler:0];

  id v12 = v22;
  if ((v11 & 1) == 0)
  {
LABEL_7:
    id v19 = *(void **)(a1 + 32);
    uint64_t v20 = 0;
    id v21 = v12;
    goto LABEL_8;
  }
  _HKInitializeLogging();
  uint64_t v13 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void **)(v14 + 112);
    uint64_t v16 = v13;
    uint64_t v17 = [v15 count];
    uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 120) count];
    *(_DWORD *)long long buf = 138543874;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2048;
    char v24 = (void *)v18;
    _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "[attachments] %{public}@: Successfully deleted %lu reference and %lu attachments records", buf, 0x20u);
  }
  id v19 = *(void **)(a1 + 32);
  uint64_t v20 = 1;
  id v21 = 0;
LABEL_8:
  [v19 finishWithSuccess:v20 error:v21];
}

BOOL __88__HDCloudSyncPushReferenceTombstonesOperation__updateTombstonesToSynchronizedWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDAttachmentReferenceEntity setCloudStatus:1 references:*(void *)(*(void *)(a1 + 32) + 104) transaction:a2 error:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentZone, 0);
  objc_storeStrong((id *)&self->_tombstoneRecordsToPush, 0);
  objc_storeStrong((id *)&self->_attachmentsRecordsToDelete, 0);
  objc_storeStrong((id *)&self->_referenceRecordsToDelete, 0);

  objc_storeStrong((id *)&self->_unsynchronizedTombstones, 0);
}

@end