@interface HDCloudSyncLeaveAllSharesOperation
- (void)main;
@end

@implementation HDCloudSyncLeaveAllSharesOperation

- (void)main
{
  v2 = self;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  if (!self)
  {
    id v8 = 0;
    id v9 = 0;
    goto LABEL_32;
  }
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 cachedCloudState];
  id v76 = 0;
  v5 = [v4 zonesByIdentifierWithError:&v76];
  id v6 = v76;

  if (v5 || !v6)
  {
    id v59 = v6;
    v60 = v5;
    id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id obj = [v5 allValues];
    uint64_t v10 = [obj countByEnumeratingWithState:&v72 objects:buf count:16];
    if (!v10)
    {
LABEL_26:

      v43 = v61;
      id v9 = v61;
      id v8 = 0;
      id v6 = v59;
      v5 = v60;
LABEL_30:

      goto LABEL_31;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v73;
    uint64_t v62 = *(void *)v73;
    v68 = v2;
LABEL_9:
    uint64_t v13 = 0;
    uint64_t v63 = v11;
    while (1)
    {
      uint64_t v14 = v11;
      uint64_t v15 = v12;
      if (*(void *)v73 != v12) {
        objc_enumerationMutation(obj);
      }
      v16 = *(void **)(*((void *)&v72 + 1) + 8 * v13);
      v17 = [v16 zoneIdentifier];
      v18 = [v17 containerIdentifier];

      v19 = [(HDCloudSyncOperation *)v2 configuration];
      v20 = [v19 repository];
      v21 = [v20 containerForContainerIdentifier:v18];

      v22 = [(HDCloudSyncOperation *)v2 configuration];
      v23 = [v22 repository];
      v24 = [v23 profileIdentifier];
      v25 = HDDatabaseForContainer(v21, v24);

      uint64_t v11 = v14;
      uint64_t v12 = v15;
      if ([v25 databaseScope] != 3) {
        goto LABEL_24;
      }
      v65 = v25;
      v66 = v21;
      v67 = v18;
      id v26 = v16;
      v27 = [v26 zoneIdentifier];
      v28 = [v27 zoneIdentifier];
      id v78 = 0;
      *(void *)v79 = 0;
      char v29 = objc_msgSend(v28, "hd_isSharedSummaryZoneIDForUserIdentifier:syncCircleIdentifier:", v79, &v78);
      id v30 = *(id *)v79;
      id v31 = v78;

      v32 = [v26 zoneIdentifier];

      v33 = [v32 zoneIdentifier];
      id v77 = v31;
      char v34 = objc_msgSend(v33, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v77);
      id v35 = v77;

      v36 = [(HDCloudSyncOperation *)v68 configuration];
      v37 = [v36 repository];
      uint64_t v38 = [v37 profileType];

      if (v38 == 2)
      {
        if (v29) {
          goto LABEL_18;
        }
      }
      else if (v38 == 3 && (v34 & 1) != 0)
      {
LABEL_18:

        id v71 = 0;
        v39 = [v26 zoneShareWithError:&v71];
        id v40 = v71;
        v41 = v40;
        if (!v39 && v40)
        {
          _HKInitializeLogging();
          v44 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            v57 = v44;
            v58 = [v26 zoneIdentifier];
            *(_DWORD *)v79 = 138543874;
            *(void *)&v79[4] = v68;
            __int16 v80 = 2114;
            v81 = v58;
            __int16 v82 = 2114;
            v83 = v41;
            _os_log_error_impl(&dword_1BCB7D000, v57, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch CKShare for cached zone %{public}@, %{public}@", v79, 0x20u);
          }
          id v8 = v41;

          id v9 = 0;
          id v6 = v59;
          v5 = v60;
          v43 = v61;
          v2 = v68;
          goto LABEL_30;
        }
        v18 = v67;
        uint64_t v11 = v63;
        if (v39)
        {
          v42 = [v39 recordID];
          [v61 addObject:v42];
        }
        uint64_t v12 = v62;
        goto LABEL_23;
      }

      v18 = v67;
      uint64_t v12 = v62;
      uint64_t v11 = v63;
LABEL_23:
      v25 = v65;
      v21 = v66;
LABEL_24:

      ++v13;
      v2 = v68;
      if (v11 == v13)
      {
        uint64_t v11 = [obj countByEnumeratingWithState:&v72 objects:buf count:16];
        if (v11) {
          goto LABEL_9;
        }
        goto LABEL_26;
      }
    }
  }
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v85 = v2;
    __int16 v86 = 2114;
    id v87 = v6;
    _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached zones, %{public}@", buf, 0x16u);
  }
  id v8 = v6;
  id v9 = 0;
LABEL_31:

LABEL_32:
  id v45 = v8;
  v46 = v45;
  if (!v9 && v45)
  {
    v47 = v2;
    uint64_t v48 = 0;
    v49 = v46;
LABEL_40:
    [(HDCloudSyncOperation *)v47 finishWithSuccess:v48 error:v49];
    goto LABEL_41;
  }
  if (![v9 count])
  {
    _HKInitializeLogging();
    v56 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v85 = v2;
      _os_log_impl(&dword_1BCB7D000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@: There do not appear to be any shared zones to remove ourselves from.", buf, 0xCu);
    }
    v47 = v2;
    uint64_t v48 = 1;
    v49 = 0;
    goto LABEL_40;
  }
  v50 = [(HDCloudSyncOperation *)v2 configuration];
  v51 = [v50 repository];
  v52 = [v51 primaryCKContainer];

  v53 = [HDCloudSyncModifyRecordsOperation alloc];
  v54 = [(HDCloudSyncOperation *)v2 configuration];
  v55 = [(HDCloudSyncModifyRecordsOperation *)v53 initWithConfiguration:v54 container:v52 recordsToSave:0 recordIDsToDelete:v9];

  [(HDCloudSyncModifyRecordsOperation *)v55 setTreatAnyErrorAsFatal:1];
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __42__HDCloudSyncLeaveAllSharesOperation_main__block_invoke;
  v70[3] = &unk_1E62F2950;
  v70[4] = v2;
  [(HDCloudSyncOperation *)v55 setOnError:v70];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __42__HDCloudSyncLeaveAllSharesOperation_main__block_invoke_278;
  v69[3] = &unk_1E62F2928;
  v69[4] = v2;
  [(HDCloudSyncOperation *)v55 setOnSuccess:v69];
  [(HDCloudSyncOperation *)v55 start];

LABEL_41:
}

void __42__HDCloudSyncLeaveAllSharesOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete shares: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 32) finishWithSuccess:0 error:v4];
}

uint64_t __42__HDCloudSyncLeaveAllSharesOperation_main__block_invoke_278(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully deleted share records", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) finishWithSuccess:1 error:0];
}

@end