@interface HDCloudSyncPullChangeRecordOperation
+ (int64_t)progressCount;
- (HDCloudSyncChangeRecord)changeRecord;
- (HDCloudSyncPullChangeRecordOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncPullChangeRecordOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 target:(id)a5 sequenceRecord:(id)a6 changeRecord:(id)a7;
- (HDCloudSyncSequenceRecord)sequenceRecord;
- (HDCloudSyncTarget)target;
- (id)_assetExtractionFailureCountKey;
- (uint64_t)_shouldSucceedWithAssetExtractionError:(uint64_t)a1;
- (void)_handlePossibleCacheDiscrepancyWithRecordID:(void *)a3 fetchError:(void *)a4 errorOut:;
- (void)_setAssetExtractionFailureCount:(void *)a1;
- (void)main;
@end

@implementation HDCloudSyncPullChangeRecordOperation

- (HDCloudSyncPullChangeRecordOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncPullChangeRecordOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 target:(id)a5 sequenceRecord:(id)a6 changeRecord:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)HDCloudSyncPullChangeRecordOperation;
  v16 = [(HDCloudSyncOperation *)&v19 initWithConfiguration:a3 cloudState:a4];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_target, a5);
    objc_storeStrong((id *)&v17->_sequenceRecord, a6);
    objc_storeStrong((id *)&v17->_changeRecord, a7);
  }

  return v17;
}

+ (int64_t)progressCount
{
  return 200;
}

- (void)main
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncChangeRecord *)self->_changeRecord sequenceRecordID];
  v4 = [(HDCloudSyncRecord *)self->_sequenceRecord recordID];
  char v5 = [v3 isEqual:v4];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1A0A8]);
    v7 = [(HDCloudSyncRecord *)self->_changeRecord recordID];
    v30[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    v9 = (void *)[v6 initWithRecordIDs:v8];

    v10 = +[HDCloudSyncChangeRecord assetKeys];
    v11 = +[HDCloudSyncChangeRecord nonAssetKeys];
    v12 = [v10 arrayByAddingObjectsFromArray:v11];
    [v9 setDesiredKeys:v12];

    BOOL v13 = [(HDCloudSyncChangeRecord *)self->_changeRecord shouldFetchAssetContentInMemory];
    BOOL v14 = v13;
    if (v13)
    {
      [v9 setShouldFetchAssetContentInMemory:1];
      [v9 setDropInMemoryAssetContentASAP:1];
    }
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__98;
    v28[4] = __Block_byref_object_dispose__98;
    id v29 = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __44__HDCloudSyncPullChangeRecordOperation_main__block_invoke;
    v26[3] = &unk_1E63007A8;
    v26[4] = self;
    v26[5] = v28;
    BOOL v27 = v14;
    [v9 setPerRecordCompletionBlock:v26];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __44__HDCloudSyncPullChangeRecordOperation_main__block_invoke_291;
    v25[3] = &unk_1E63007D0;
    v25[4] = self;
    v25[5] = v28;
    [v9 setFetchRecordsCompletionBlock:v25];
    id v15 = [(HDCloudSyncOperation *)self configuration];
    v16 = [v15 cachedCloudState];
    objc_msgSend(v16, "setOperationCountForAnalytics:", objc_msgSend(v16, "operationCountForAnalytics") + 1);

    v17 = [(HDCloudSyncOperation *)self configuration];
    v18 = [v17 operationGroup];
    [v9 setGroup:v18];

    objc_super v19 = [(HDCloudSyncTarget *)self->_target container];
    v20 = [(HDCloudSyncOperation *)self configuration];
    v21 = [v20 repository];
    v22 = [v21 profileIdentifier];
    v23 = HDDatabaseForContainer(v19, v22);

    [v23 addOperation:v9];
    _Block_object_dispose(v28, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 709, @"Change record %@ does not match this sequence record (%@)", self->_changeRecord, self->_sequenceRecord);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v24];
  }
}

void __44__HDCloudSyncPullChangeRecordOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    _HKInitializeLogging();
    char v5 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
    {
      uint64_t v27 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v27;
      _os_log_fault_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_FAULT, "%{public}@: Multiple calls to perRecordCompletionBlock.", buf, 0xCu);
    }
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    char v9 = *(unsigned char *)(a1 + 48);
    id v10 = a2;
    id v11 = a3;
    id v12 = a4;
    if (v8)
    {
      [v8 updateCompletedProgressCount:100];
      _HKInitializeLogging();
      BOOL v13 = (NSObject **)MEMORY[0x1E4F29FA8];
      BOOL v14 = *MEMORY[0x1E4F29FA8];
      id v15 = *MEMORY[0x1E4F29FA8];
      if (v10)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v10;
          _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Persisting fetched change record %{public}@", buf, 0x16u);
        }
        id v16 = v10;
        id v28 = 0;
        id v29 = &v28;
        uint64_t v30 = 0x3032000000;
        v31 = __Block_byref_object_copy__315;
        v32 = __Block_byref_object_dispose__316;
        id v33 = 0;
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __103__HDCloudSyncPullChangeRecordOperation__zipArchiveExtractorForChangeRecord_assetContentInMemory_error___block_invoke;
        v35 = &unk_1E6300820;
        char v39 = v9;
        v38 = &v28;
        id v36 = v8;
        id v17 = v16;
        id v37 = v17;
        if (HKWithAutoreleasePool()) {
          id v18 = v29[5];
        }
        else {
          id v18 = 0;
        }
        id v20 = v18;

        _Block_object_dispose(&v28, 8);
        id v21 = 0;
        id v19 = v21;
        if (v20)
        {
          id v28 = 0;
          v22 = +[HDCloudSyncChangeRecord recordWithCKRecord:v17 error:&v28];
          id v23 = v28;
          if (v22)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __104__HDCloudSyncPullChangeRecordOperation__continuationForFetchedRecord_recordID_inMemoryAsset_fetchError___block_invoke_2;
            v35 = &unk_1E62F9F48;
            id v36 = v22;
            id v37 = v8;
            v38 = (id *)v20;
            v8 = _Block_copy(buf);
          }
          else
          {
            _HKInitializeLogging();
            id v24 = *v13;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v8;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v23;
              _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "%{public}@: change record instantiation failed: %{public}@", buf, 0x16u);
            }
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __104__HDCloudSyncPullChangeRecordOperation__continuationForFetchedRecord_recordID_inMemoryAsset_fetchError___block_invoke_298;
            v35 = &unk_1E62F6A18;
            id v36 = v23;
            v8 = _Block_copy(buf);
          }
        }
        else
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __104__HDCloudSyncPullChangeRecordOperation__continuationForFetchedRecord_recordID_inMemoryAsset_fetchError___block_invoke_297;
          v35 = &unk_1E63007F8;
          id v36 = v21;
          id v37 = v8;
          v8 = _Block_copy(buf);
          id v23 = v36;
        }
      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v12;
          _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch change asset: %{public}@", buf, 0x16u);
        }
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __104__HDCloudSyncPullChangeRecordOperation__continuationForFetchedRecord_recordID_inMemoryAsset_fetchError___block_invoke;
        v35 = &unk_1E62F9F48;
        id v36 = v12;
        id v37 = v8;
        v38 = (id *)v11;
        v8 = _Block_copy(buf);

        id v19 = v36;
      }
    }
    uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 8);
    v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v8;
  }
}

void __44__HDCloudSyncPullChangeRecordOperation_main__block_invoke_291(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v24 = *(void *)(v23 + 128);
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v23;
      __int16 v29 = 2114;
      uint64_t v30 = v24;
      __int16 v31 = 2114;
      id v32 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed record fetch for change %{public}@: %{public}@", buf, 0x20u);
    }
    v8 = *(id **)(a1 + 32);
    char v9 = [v8[16] recordID];
    id v26 = 0;
    -[HDCloudSyncPullChangeRecordOperation _handlePossibleCacheDiscrepancyWithRecordID:fetchError:errorOut:](v8, v9, v6, &v26);
    id v10 = v26;
  }
  else
  {
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v14)
    {
      id v19 = *(id **)(a1 + 32);
      id v20 = (void *)MEMORY[0x1E4F28C58];
      id v21 = [v19[16] recordID];
      v22 = objc_msgSend(v20, "hk_error:format:", 720, @"Failed to fetch requested change record %@", v21);
      [v19 finishWithSuccess:0 error:v22];

      goto LABEL_7;
    }
    id v25 = 0;
    int v15 = (*(uint64_t (**)(uint64_t, id *))(v14 + 16))(v14, &v25);
    id v10 = v25;
    if (v15)
    {
      _HKInitializeLogging();
      id v16 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        uint64_t v18 = *(void *)(v17 + 128);
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = v17;
        __int16 v29 = 2114;
        uint64_t v30 = v18;
        _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished record fetch for change %{public}@", buf, 0x16u);
      }
      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = 1;
      id v13 = 0;
      goto LABEL_6;
    }
  }
  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = 0;
  id v13 = v10;
LABEL_6:
  [v11 finishWithSuccess:v12 error:v13];

LABEL_7:
}

- (void)_handlePossibleCacheDiscrepancyWithRecordID:(void *)a3 fetchError:(void *)a4 errorOut:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a1)
  {
    id v8 = a2;
    char v9 = [a1 configuration];
    id v10 = [v9 cachedCloudState];
    id v11 = [a1[14] container];
    uint64_t v12 = [v11 containerIdentifier];
    id v25 = 0;
    id v13 = [v10 zoneForRecordID:v8 containerIdentifier:v12 error:&v25];

    id v14 = v25;
    if (v13)
    {
      int v15 = [a1[14] container];
      id v16 = [a1 configuration];
      uint64_t v17 = [v16 repository];
      uint64_t v18 = [v17 profileIdentifier];
      HDDatabaseForContainer(v15, v18);
      id v19 = v14;
      v21 = id v20 = a4;

      v22 = [a1[14] container];
      [v13 handleCloudError:v7 operation:a1 container:v22 database:v21];

      a4 = v20;
      id v14 = v19;
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v23 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v27 = a1;
        __int16 v28 = 2114;
        id v29 = v14;
        _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "%{public}@: Failed to lookup zone during cache discrepancy reporting %{public}@", buf, 0x16u);
      }
    }
    id v24 = v7;
    if (v24)
    {
      if (a4) {
        *a4 = v24;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
}

uint64_t __104__HDCloudSyncPullChangeRecordOperation__continuationForFetchedRecord_recordID_inMemoryAsset_fetchError___block_invoke(uint64_t a1, void *a2)
{
  v4 = [*(id *)(a1 + 32) domain];
  char v5 = [v4 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v5)
  {
    -[HDCloudSyncPullChangeRecordOperation _handlePossibleCacheDiscrepancyWithRecordID:fetchError:errorOut:](*(id **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 32), a2);
  }
  else
  {
    id v6 = *(id *)(a1 + 32);
    if (v6)
    {
      if (a2) {
        *a2 = v6;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return 0;
}

uint64_t __104__HDCloudSyncPullChangeRecordOperation__continuationForFetchedRecord_recordID_inMemoryAsset_fetchError___block_invoke_297(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  if (v4)
  {
    if (a2) {
      *a2 = v4;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return -[HDCloudSyncPullChangeRecordOperation _shouldSucceedWithAssetExtractionError:](v5, v6);
}

- (uint64_t)_shouldSucceedWithAssetExtractionError:(uint64_t)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = [(id)a1 configuration];
    uint64_t v5 = [v4 repository];
    id v6 = [v5 profile];
    id v7 = [v6 legacyRepositoryProfile];
    id v8 = HDCloudSyncKeyValueDomainWithProfile(v7);

    char v9 = -[HDCloudSyncPullChangeRecordOperation _assetExtractionFailureCountKey](a1);
    id v31 = 0;
    id v10 = [v8 numberForKey:v9 error:&v31];
    id v11 = v31;
    uint64_t v12 = v11;
    id v13 = (os_log_t *)MEMORY[0x1E4F29FA8];
    if (!v10)
    {
      if (v11)
      {
        _HKInitializeLogging();
        id v14 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v33 = (uint64_t)v9;
          __int16 v34 = 2114;
          id v35 = v12;
          _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "Failed to get value for %{public}@: %{public}@.", buf, 0x16u);
        }
      }
    }
    uint64_t v15 = [v10 integerValue];

    _HKInitializeLogging();
    id v16 = *v13;
    BOOL v17 = os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR);
    if (v15 > 1)
    {
      if (v17)
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v33 = a1;
        __int16 v34 = 2114;
        id v35 = v3;
        _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "%{public}@: skip record due to multiple failures to extract archive: %{public}@", buf, 0x16u);
      }
      id v29 = v3;
      -[HDCloudSyncPullChangeRecordOperation _setAssetExtractionFailureCount:]((void *)a1, 0);
      uint64_t v18 = [*(id *)(a1 + 128) decodedSyncAnchorRangeMap];
      id v19 = +[HDSyncAnchorMap syncAnchorMapWithSyncAnchorRangeMap:v18];
      id v20 = [*(id *)(a1 + 112) store];
      id v21 = [(id)a1 configuration];
      v22 = [v21 repository];
      uint64_t v23 = [v22 profile];
      id v24 = [v23 legacyRepositoryProfile];
      id v30 = 0;
      BOOL v25 = +[HDSyncAnchorEntity updateSyncAnchorsWithMap:v19 type:3 store:v20 updatePolicy:1 resetInvalid:0 profile:v24 error:&v30];
      id v26 = v30;

      if (!v25)
      {
        _HKInitializeLogging();
        uint64_t v27 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v33 = a1;
          __int16 v34 = 2114;
          id v35 = v26;
          _os_log_error_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update anchors when skipping record due to extraction failures: %{public}@", buf, 0x16u);
        }
      }

      a1 = 1;
      id v3 = v29;
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v33 = a1;
        __int16 v34 = 2114;
        id v35 = v3;
        _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "%{public}@: zip extraction failed: %{public}@", buf, 0x16u);
      }
      -[HDCloudSyncPullChangeRecordOperation _setAssetExtractionFailureCount:]((void *)a1, v15 + 1);
      a1 = 0;
    }
  }

  return a1;
}

uint64_t __104__HDCloudSyncPullChangeRecordOperation__continuationForFetchedRecord_recordID_inMemoryAsset_fetchError___block_invoke_298(uint64_t a1, void *a2)
{
  id v3 = *(id *)(a1 + 32);
  if (v3)
  {
    if (a2) {
      *a2 = v3;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return 0;
}

uint64_t __104__HDCloudSyncPullChangeRecordOperation__continuationForFetchedRecord_recordID_inMemoryAsset_fetchError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v80[2] = *MEMORY[0x1E4F143B8];
  CFAbsoluteTimeGetCurrent();
  id v3 = (NSObject **)MEMORY[0x1E4F29FA8];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer((os_log_t)*MEMORY[0x1E4F29FA8], *(const void **)(a1 + 32));
  _HKInitializeLogging();
  uint64_t v5 = *v3;
  if (os_signpost_enabled(v5))
  {
    id v6 = v5;
    id v7 = v6;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      id v8 = [*(id *)(a1 + 40) configuration];
      char v9 = [v8 descriptionForSignpost];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v9;
      _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v4, "cloud-sync-persist-asset", "%{public}@", buf, 0xCu);
    }
  }
  id v11 = *(id **)(a1 + 40);
  id v10 = *(void **)(a1 + 48);
  uint64_t v12 = objc_msgSend(*(id *)(a1 + 32), "protocolVersion", a2);
  id v13 = v10;
  if (v11)
  {
    _HKInitializeLogging();
    id v14 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: persist asset archive", buf, 0xCu);
    }
    uint64_t v15 = [v11[14] store];
    id v16 = objc_msgSend(v15, "syncStoreForEpoch:", objc_msgSend(v11[15], "baselineEpoch"));

    if ((int)[v16 protocolVersion] >= (int)v12)
    {
      uint64_t v20 = [v16 syncStoreForProtocolVersion:v12];

      id v16 = (void *)v20;
    }
    else
    {
      _HKInitializeLogging();
      BOOL v17 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = v17;
        int v19 = [v16 protocolVersion];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v11;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = (int)v12;
        *(_WORD *)&buf[22] = 2048;
        v72 = (void *)v19;
        _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Change record has protocol version %ld, which is later than store protocol version %ld. Attempting pull and will re-ingest upon upgrade.", buf, 0x20u);
      }
    }
    id v21 = [v13 numberOfEntriesWithError:0];
    v22 = v21;
    if (v21)
    {
      uint64_t v23 = objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", objc_msgSend(v21, "integerValue"));
      if (v23)
      {
        id v24 = [v11 progress];
        [v24 addChild:v23 withPendingUnitCount:100];
      }
    }
    else
    {
      uint64_t v23 = 0;
    }
    uint64_t v67 = 0;
    v68 = &v67;
    uint64_t v69 = 0x2020000000;
    char v70 = 1;
    id v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__315;
    v65 = __Block_byref_object_dispose__316;
    id v66 = 0;
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x2020000000;
    v60[3] = 0;
    BOOL v25 = (void *)MEMORY[0x1E4F1CAD0];
    v80[0] = objc_opt_class();
    v80[1] = objc_opt_class();
    id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:2];
    uint64_t v27 = [v25 setWithArray:v26];

    __int16 v28 = v62 + 5;
    id obj = v62[5];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __90__HDCloudSyncPullChangeRecordOperation__persistFetchedArchiveAsset_protocolVersion_error___block_invoke;
    v72 = &unk_1E6300898;
    v73 = v11;
    v77 = &v61;
    id v29 = v27;
    id v74 = v29;
    v78 = &v67;
    id v30 = v16;
    id v75 = v30;
    v79 = v60;
    id v31 = v23;
    id v76 = v31;
    LODWORD(v11) = [v13 enumerateEntriesWithError:&obj block:buf];
    objc_storeStrong(v28, obj);
    *((unsigned char *)v68 + 24) = (_BYTE)v11;
    if (v11)
    {
      id v32 = 0;
    }
    else
    {
      id v33 = v62[5];
      id v32 = v33;
      if (v33) {
        id v34 = v33;
      }
    }
    _Block_object_dispose(v60, 8);
    _Block_object_dispose(&v61, 8);

    _Block_object_dispose(&v67, 8);
  }
  else
  {
    id v32 = 0;
  }

  id v35 = v32;
  _HKInitializeLogging();
  uint64_t v36 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
  {
    uint64_t v37 = *(void *)(a1 + 32);
    uint64_t v38 = *(void *)(a1 + 40);
    char v39 = v36;
    CFAbsoluteTimeGetCurrent();
    uint64_t v40 = HKDiagnosticStringFromDuration();
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v38;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v37;
    *(_WORD *)&buf[22] = 2114;
    v72 = v40;
    _os_log_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_INFO, "%{public}@: persisted %@ in %{public}@", buf, 0x20u);
  }
  _HKInitializeLogging();
  v41 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F29FA8]))
  {
    v42 = v41;
    v43 = v42;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      v44 = [*(id *)(a1 + 40) configuration];
      v45 = [v44 descriptionForSignpost];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[8] = 2114;
      *(void *)&buf[10] = v45;
      _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v43, OS_SIGNPOST_INTERVAL_END, v4, "cloud-sync-persist-asset", "success=%{BOOL}d, %{public}@", buf, 0x12u);
    }
  }
  if (!v11)
  {
    if (v35)
    {
      id v35 = v35;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 122, @"Asset extraction failed without producing an error.");
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      if (!v35)
      {
LABEL_46:
        uint64_t v55 = -[HDCloudSyncPullChangeRecordOperation _shouldSucceedWithAssetExtractionError:](*(void *)(a1 + 40), v35);
        goto LABEL_47;
      }
    }
    if (v58) {
      void *v58 = v35;
    }
    else {
      _HKLogDroppedError();
    }

    goto LABEL_46;
  }
  v47 = *(void **)(a1 + 40);
  v46 = (id *)(a1 + 40);
  -[HDCloudSyncPullChangeRecordOperation _setAssetExtractionFailureCount:](v47, 0);
  id v48 = *v46;
  if (*v46)
  {
    v49 = [*v46 profile];
    v50 = HDCloudSyncKeyValueDomainWithProfile(v49);

    _HKInitializeLogging();
    v51 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v48;
      _os_log_impl(&dword_1BCB7D000, v51, OS_LOG_TYPE_INFO, "%{public}@: Recording pull operation applied changes", buf, 0xCu);
    }
    id v61 = 0;
    char v52 = [v50 setNumber:MEMORY[0x1E4F1CC38] forKey:@"HDCloudSyncHasPullAppliedChange" error:&v61];
    id v53 = v61;
    if ((v52 & 1) == 0)
    {
      _HKInitializeLogging();
      v54 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v53;
        _os_log_error_impl(&dword_1BCB7D000, v54, OS_LOG_TYPE_ERROR, "Failed to record pull operation applied changes: %{public}@.", buf, 0xCu);
      }
    }
  }
  uint64_t v55 = 1;
LABEL_47:

  return v55;
}

- (void)_setAssetExtractionFailureCount:(void *)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_signpost_id_t v4 = [a1 configuration];
    uint64_t v5 = [v4 repository];
    id v6 = [(id)v5 profile];
    id v7 = [v6 legacyRepositoryProfile];
    id v8 = HDCloudSyncKeyValueDomainWithProfile(v7);

    char v9 = -[HDCloudSyncPullChangeRecordOperation _assetExtractionFailureCountKey]((uint64_t)a1);
    id v10 = [NSNumber numberWithInteger:a2];
    id v13 = 0;
    LOBYTE(v5) = [v8 setNumber:v10 forKey:v9 error:&v13];
    id v11 = v13;

    if ((v5 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v12 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v15 = v9;
        __int16 v16 = 2114;
        id v17 = v11;
        _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "Failed to set value for %{public}@: %{public}@.", buf, 0x16u);
      }
    }
  }
}

uint64_t __103__HDCloudSyncPullChangeRecordOperation__zipArchiveExtractorForChangeRecord_assetContentInMemory_error___block_invoke(uint64_t a1, void *a2)
{
  *(void *)((char *)&v84[2] + 2) = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(id **)(a1 + 32);
  os_signpost_id_t v4 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 56))
  {
    if (!v5)
    {
      uint64_t v37 = 0;
      goto LABEL_57;
    }
    uint64_t v6 = +[HDCloudSyncChangeRecord changesetArchiveContentDataForCKRecord:v4 error:a2];
    if (v6)
    {
      id v7 = (void *)v6;
      _HKInitializeLogging();
      id v8 = (os_log_t *)MEMORY[0x1E4F29FA8];
      char v9 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v9;
        *(_DWORD *)buf = 138543618;
        v82 = v5;
        __int16 v83 = 2048;
        v84[0] = [v7 length];
        _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: fetched asset data size (%lu)", buf, 0x16u);
      }
      if ((unint64_t)[v7 length] <= 0x40000)
      {
        uint64_t v39 = [v7 copy];
      }
      else
      {
        id v76 = [MEMORY[0x1E4F29128] UUID];
        id v11 = [v76 UUIDString];
        self;
        id v12 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
        uint64_t v13 = [NSString stringWithFormat:@"syncarchive-%@", v11];
        id v75 = v11;

        id v14 = [v12 temporaryDirectory];
        id v74 = (void *)v13;
        uint64_t v15 = [v14 URLByAppendingPathComponent:v13];
        __int16 v16 = [v15 URLByAppendingPathExtension:@"zip"];

        _HKInitializeLogging();
        os_log_t v17 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
        {
          char v52 = v17;
          id v53 = [v16 path];
          *(_DWORD *)buf = 138543362;
          v82 = v53;
          _os_log_debug_impl(&dword_1BCB7D000, v52, OS_LOG_TYPE_DEBUG, "Creating asset file %{public}@", buf, 0xCu);
        }
        uint64_t v18 = [v16 path];
        char v19 = [v12 createFileAtPath:v18 contents:0 attributes:0];

        v73 = v12;
        if (v19)
        {
          id v78 = 0;
          id v20 = [MEMORY[0x1E4F28CB0] fileHandleForUpdatingURL:v16 error:&v78];
          id v21 = v78;
          v22 = v21;
          if (v20)
          {
            id v72 = v21;
            if (fcntl([v20 fileDescriptor], 48, 1))
            {
              _HKInitializeLogging();
              uint64_t v23 = (void *)*MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
              {
                v60 = v23;
                id v61 = [v16 path];
                id v62 = v12;
                int v63 = *__error();
                v64 = __error();
                v65 = strerror(*v64);
                *(_DWORD *)buf = 138543874;
                v82 = v61;
                __int16 v83 = 1024;
                LODWORD(v84[0]) = v63;
                id v12 = v62;
                WORD2(v84[0]) = 2082;
                *(void *)((char *)v84 + 6) = v65;
                _os_log_error_impl(&dword_1BCB7D000, v60, OS_LOG_TYPE_ERROR, "Error setting F_NOCACHE on file at %{public}@ failed (%d): %{public}s", buf, 0x1Cu);
              }
            }
            uint64_t v24 = *MEMORY[0x1E4F28348];
            uint64_t v25 = *MEMORY[0x1E4F28330];
            v79[0] = *MEMORY[0x1E4F28370];
            v79[1] = v25;
            v80[0] = v24;
            v80[1] = &unk_1F17ECC90;
            uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:2];
            uint64_t v27 = [v16 path];
            id v77 = 0;
            v71 = (void *)v26;
            char v28 = [v12 setAttributes:v26 ofItemAtPath:v27 error:&v77];
            id v29 = v77;

            if (v28)
            {
              id v30 = [v16 path];
              int v31 = unlink((const char *)[v30 fileSystemRepresentation]);

              if (v31)
              {
                _HKInitializeLogging();
                id v32 = (void *)*MEMORY[0x1E4F29FA8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                {
                  id v66 = v32;
                  uint64_t v67 = [v16 path];
                  int v68 = *__error();
                  uint64_t v69 = __error();
                  char v70 = strerror(*v69);
                  *(_DWORD *)buf = 138543874;
                  v82 = v67;
                  __int16 v83 = 1024;
                  LODWORD(v84[0]) = v68;
                  WORD2(v84[0]) = 2082;
                  *(void *)((char *)v84 + 6) = v70;
                  _os_log_error_impl(&dword_1BCB7D000, v66, OS_LOG_TYPE_ERROR, "Error unlinking file at %{public}@ failed (%d): %{public}s", buf, 0x1Cu);
                }
              }
              id v33 = v20;
              id v34 = v71;
              v22 = v72;
            }
            else
            {
              id v48 = NSString;
              v49 = [v16 path];
              v50 = [v48 stringWithFormat:@"Error setting protection class for %@", v49];

              objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:underlyingError:", 102, v50, v29);
              id v51 = (id)objc_claimAutoreleasedReturnValue();
              if (v51)
              {
                if (a2) {
                  *a2 = v51;
                }
                else {
                  _HKLogDroppedError();
                }
              }

              id v33 = 0;
              id v34 = v71;
              v22 = v72;
            }
          }
          else
          {
            v45 = [v16 path];
            [v12 removeItemAtPath:v45 error:0];

            v46 = NSString;
            v47 = [v16 path];
            id v34 = [v46 stringWithFormat:@"Failed to create fileHandle at %@", v47];

            objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:underlyingError:", 102, v34, v22);
            id v29 = (id)objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              if (a2) {
                *a2 = v29;
              }
              else {
                _HKLogDroppedError();
              }
            }

            id v33 = 0;
          }
        }
        else
        {
          v41 = (void *)MEMORY[0x1E4F28C58];
          v42 = [v16 path];
          v43 = objc_msgSend(v41, "hk_error:format:", 102, @"Error creating file at %@", v42);

          id v44 = v43;
          id v20 = v44;
          if (v44)
          {
            if (a2)
            {
              id v20 = v44;
              id v33 = 0;
              *a2 = v20;
            }
            else
            {
              _HKLogDroppedError();
              id v33 = 0;
            }
            v22 = v20;
          }
          else
          {
            v22 = 0;
            id v33 = 0;
          }
        }

        id v54 = v5[13];
        v5[13] = v33;

        id v55 = v5[13];
        if (!v55)
        {
          uint64_t v37 = 0;
          uint64_t v38 = v7;
          goto LABEL_56;
        }
        [v55 writeData:v7];
        [v5[13] fileDescriptor];
        uint64_t v39 = mmapFileDescriptor();
      }
      uint64_t v38 = (void *)v39;

      if (v38)
      {
        if ([v38 length])
        {
          uint64_t v37 = [objc_alloc(MEMORY[0x1E4F2B9C8]) initWithData:v38];
LABEL_56:

          goto LABEL_57;
        }
        objc_msgSend(NSString, "stringWithFormat:", @"has data size (%lu)", objc_msgSend(v38, "length"));
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v56 = @"is nil";
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a2, 3, @"cloud sync archive data %@", v56);
    }
    else
    {
      uint64_t v38 = 0;
    }
    uint64_t v37 = 0;
    goto LABEL_56;
  }
  id v35 = v4;
  if (v5)
  {
    uint64_t v36 = +[HDCloudSyncChangeRecord changesetArchiveFileHandleForCKRecord:v35 error:a2];
    if (v36)
    {
      uint64_t v37 = [objc_alloc(MEMORY[0x1E4F2B9C8]) initWithFileHandle:v36];
    }
    else
    {
      uint64_t v40 = +[HDCloudSyncChangeRecord changesetArchiveURLForCKRecord:v35 error:a2];
      if (v40) {
        uint64_t v37 = [objc_alloc(MEMORY[0x1E4F2B9C8]) initWithURL:v40];
      }
      else {
        uint64_t v37 = 0;
      }
    }
  }
  else
  {
    uint64_t v37 = 0;
  }

LABEL_57:
  uint64_t v57 = *(void *)(*(void *)(a1 + 48) + 8);
  v58 = *(void **)(v57 + 40);
  *(void *)(v57 + 40) = v37;

  return 1;
}

void __90__HDCloudSyncPullChangeRecordOperation__persistFetchedArchiveAsset_protocolVersion_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  os_signpost_id_t v4 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = v4;
    id v7 = [v3 pathname];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: persist change set file %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__315;
  uint64_t v24 = __Block_byref_object_dispose__316;
  id v25 = 0;
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v8 + 40);
  id v9 = v3;
  id v20 = *(id *)(a1 + 40);
  int v10 = HKWithAutoreleasePool();
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v10)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    id v19 = *(id *)(v11 + 40);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __90__HDCloudSyncPullChangeRecordOperation__persistFetchedArchiveAsset_protocolVersion_error___block_invoke_322;
    __int16 v16 = &unk_1E6300870;
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = *(id *)(a1 + 48);
    char v12 = HKWithAutoreleasePool();
    objc_storeStrong((id *)(v11 + 40), v19);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v12;
  }
  objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), v13, v14, v15, v16, v17);

  _Block_object_dispose(buf, 8);
}

BOOL __90__HDCloudSyncPullChangeRecordOperation__persistFetchedArchiveAsset_protocolVersion_error___block_invoke_320(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  id v17 = 0;
  id v3 = [v2 dataWithError:&v17];
  id v4 = v17;
  if (v3)
  {
    uint64_t v5 = a1[6];
    id v16 = 0;
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28DC0], "hk_unarchivedObjectOfClasses:forKey:data:error:", v5, @"changes", v3, &v16);
    id v7 = v16;
    uint64_t v8 = *(void *)(a1[7] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v6;

    if (*(void *)(*(void *)(a1[7] + 8) + 40))
    {
      int v10 = 0;
    }
    else
    {
      _HKInitializeLogging();
      char v12 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = a1[5];
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = v15;
        __int16 v20 = 2114;
        id v21 = v7;
        _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to unarchive changes: %{public}@", buf, 0x16u);
      }
      int v10 = 1;
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v11 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = a1[5];
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v14;
      __int16 v20 = 2114;
      id v21 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to extract data from archive: %{public}@", buf, 0x16u);
    }
    int v10 = 1;
  }

  return v10 == 0;
}

uint64_t __90__HDCloudSyncPullChangeRecordOperation__persistFetchedArchiveAsset_protocolVersion_error___block_invoke_322(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v24 = 0;
  id v7 = v5;
  id v8 = v4;
  if (v6)
  {
    id v9 = [(id)v6 configuration];
    int v10 = [v9 repository];
    uint64_t v11 = [v10 profile];
    char v12 = [v11 legacyRepositoryProfile];

    uint64_t v13 = objc_alloc_init(HDMutableDatabaseTransactionContext);
    [(HDMutableDatabaseTransactionContext *)v13 setJournalType:2];
    [(HDMutableDatabaseTransactionContext *)v13 setCacheScope:1];
    uint64_t v14 = [(id)v6 configuration];
    uint64_t v15 = [v14 accessibilityAssertion];

    if (v15) {
      [(HDMutableDatabaseTransactionContext *)v13 addAccessibilityAssertion:v15];
    }
    id v16 = [v12 database];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __70__HDCloudSyncPullChangeRecordOperation__applySyncChanges_store_error___block_invoke;
    uint64_t v26 = &unk_1E62FA130;
    id v27 = v12;
    id v28 = v7;
    uint64_t v29 = v6;
    id v30 = v8;
    id v17 = v12;
    uint64_t v6 = [v16 performWithTransactionContext:v13 error:&v24 block:buf];
  }
  id v18 = v24;
  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v19 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      uint64_t v23 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2114;
      uint64_t v26 = v18;
      _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Error applying sync changes to store %{public}@ with error %{public}@", buf, 0x20u);
    }
    **(unsigned char **)(a1 + 56) = 1;
    id v20 = v18;
    if (v20)
    {
      if (a2) {
        *a2 = v20;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v6;
}

uint64_t __70__HDCloudSyncPullChangeRecordOperation__applySyncChanges_store_error___block_invoke(id *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] syncEngine];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a1[5];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v11 = a1[4];
        id v12 = v2;
        id v13 = a1[7];
        int v8 = HKWithAutoreleasePool();

        if (!v8)
        {
          uint64_t v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 1;
LABEL_11:

  return v9;
}

uint64_t __70__HDCloudSyncPullChangeRecordOperation__applySyncChanges_store_error___block_invoke_2(uint64_t *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(id)a1[4] syncEntityClassForProfile:a1[5]])
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = (void *)a1[7];
    uint64_t v6 = a1[8];
    id v16 = 0;
    uint64_t v7 = [v5 applySyncChange:v4 forStore:v6 error:&v16];
    id v8 = v16;
    if ((v7 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v9 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = a1[4];
        *(_DWORD *)buf = 138543618;
        uint64_t v18 = v15;
        __int16 v19 = 2114;
        id v20 = v8;
        _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "failed to apply request change %{public}@: %{public}@", buf, 0x16u);
      }
      id v10 = v8;
      if (v10)
      {
        if (a2) {
          *a2 = v10;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v11 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = a1[6];
      id v13 = (void *)a1[4];
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v12;
      __int16 v19 = 2114;
      id v20 = v13;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: cannot apply change %{public}@ because it is for an unknown (possibly future) sync entity.", buf, 0x16u);
    }
    return 1;
  }
  return v7;
}

- (id)_assetExtractionFailureCountKey
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 112) storeRecord];
  id v3 = [v2 storeIdentifier];
  uint64_t v4 = [v3 UUIDString];
  uint64_t v5 = [v1 stringWithFormat:@"%@%@", @"FailedAssetExtractionCount-", v4];

  return v5;
}

- (HDCloudSyncTarget)target
{
  return self->_target;
}

- (HDCloudSyncSequenceRecord)sequenceRecord
{
  return self->_sequenceRecord;
}

- (HDCloudSyncChangeRecord)changeRecord
{
  return self->_changeRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeRecord, 0);
  objc_storeStrong((id *)&self->_sequenceRecord, 0);
  objc_storeStrong((id *)&self->_target, 0);

  objc_storeStrong((id *)&self->_fileHandle, 0);
}

@end