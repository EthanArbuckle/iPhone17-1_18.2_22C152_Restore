@interface HDCloudSyncDetectSyncDisabledOperation
+ (BOOL)shouldLogAtOperationStart;
- (void)_disableSyncLocally;
- (void)main;
@end

@implementation HDCloudSyncDetectSyncDisabledOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void)main
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];

  v5 = [v4 profile];
  v6 = [v5 cloudSyncManager];
  v7 = [v6 ownerIdentifierManager];

  v8 = [v4 allCKContainers];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __46__HDCloudSyncDetectSyncDisabledOperation_main__block_invoke;
  v69[3] = &unk_1E630A980;
  id v9 = v7;
  id v70 = v9;
  v61 = objc_msgSend(v8, "hk_map:", v69);

  v10 = [(HDCloudSyncOperation *)self configuration];
  v11 = [v10 cachedCloudState];
  id v68 = 0;
  v12 = [v11 zonesByIdentifierWithError:&v68];
  id v13 = v68;

  if (!v12 && v13)
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v72 = self;
      __int16 v73 = 2114;
      id v74 = v13;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve cached zones, %{public}@", buf, 0x16u);
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v13];
    goto LABEL_44;
  }
  id v56 = v13;
  v57 = v12;
  id v58 = v9;
  v59 = v4;
  v60 = self;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v15 = [v12 allValues];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v64 objects:v77 count:16];
  if (!v16) {
    goto LABEL_35;
  }
  uint64_t v18 = v16;
  uint64_t v19 = *(void *)v65;
  v20 = (os_log_t *)MEMORY[0x1E4F29FA8];
  *(void *)&long long v17 = 138543618;
  long long v55 = v17;
  while (2)
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v65 != v19) {
        objc_enumerationMutation(v15);
      }
      v22 = *(void **)(*((void *)&v64 + 1) + 8 * i);
      v23 = objc_msgSend(v22, "zoneIdentifier", v55);
      uint64_t v24 = [v23 scope];

      if (v24 != 3)
      {
        if ([v22 zoneType] == 2)
        {
          uint64_t v25 = objc_opt_class();
          id v63 = 0;
          v26 = [v22 recordsForClass:v25 error:&v63];
          id v27 = v63;
          if (v27)
          {
            v28 = v27;
            _HKInitializeLogging();
            os_log_t v29 = *v20;
            if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
            {
              v30 = v29;
              v31 = [v22 zoneIdentifier];
              *(_DWORD *)buf = 138543874;
              v72 = v60;
              __int16 v73 = 2114;
              id v74 = v31;
              __int16 v75 = 2114;
              v76 = v28;
              _os_log_error_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve registry record from zone %{public}@, %{public}@", buf, 0x20u);
            }
LABEL_32:

            continue;
          }
          if ((unint64_t)[v26 count] >= 2)
          {
            _HKInitializeLogging();
            os_log_t v32 = *v20;
            if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
            {
              v46 = v32;
              v47 = [v22 zoneIdentifier];
              *(_DWORD *)buf = v55;
              v72 = v60;
              __int16 v73 = 2114;
              id v74 = v47;
              _os_log_error_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_ERROR, "%{public}@: Retrieved multiple registry records from zone %{public}@, This is unexpected.", buf, 0x16u);
            }
          }
          v33 = [v26 firstObject];
          v34 = v33;
          if (v33)
          {
            v35 = [v33 disabledOwnerIdentifiers];
            int v36 = [v35 intersectsSet:v61];

            if (v36)
            {
              _HKInitializeLogging();
              v50 = *v20;
              if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543874;
                v51 = v60;
                v72 = v60;
                __int16 v73 = 2114;
                id v74 = v34;
                __int16 v75 = 1024;
                LODWORD(v76) = 1;
                _os_log_impl(&dword_1BCB7D000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@: Registry record %{public}@ contains our info (ownerIdentifier:%d); sync is disabled.",
                  buf,
                  0x1Cu);
                goto LABEL_40;
              }
LABEL_42:
              v4 = v59;
              v51 = v60;
              goto LABEL_43;
            }
          }
        }
        if ([v22 zoneType]) {
          continue;
        }
        uint64_t v37 = objc_opt_class();
        id v62 = 0;
        v38 = [v22 recordsForClass:v37 error:&v62];
        id v39 = v62;
        if (v39)
        {
          v28 = v39;
          _HKInitializeLogging();
          os_log_t v40 = *v20;
          if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
          {
            v44 = v40;
            v45 = [v22 zoneIdentifier];
            *(_DWORD *)buf = 138543874;
            v72 = v60;
            __int16 v73 = 2114;
            id v74 = v45;
            __int16 v75 = 2114;
            v76 = v28;
            _os_log_error_impl(&dword_1BCB7D000, v44, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve master record from zone %{public}@, %{public}@", buf, 0x20u);
          }
          v26 = v38;
        }
        else
        {
          if ((unint64_t)[v38 count] >= 2)
          {
            _HKInitializeLogging();
            os_log_t v41 = *v20;
            if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
            {
              v48 = v41;
              v49 = [v22 zoneIdentifier];
              *(_DWORD *)buf = v55;
              v72 = v60;
              __int16 v73 = 2114;
              id v74 = v49;
              _os_log_error_impl(&dword_1BCB7D000, v48, OS_LOG_TYPE_ERROR, "%{public}@: Retrieved multiple master records from zone %{public}@, This is unexpected.", buf, 0x16u);
            }
          }
          v26 = [v38 firstObject];
          v42 = [v26 disabledOwnerIdentifiers];
          int v43 = [v42 intersectsSet:v61];

          if (v43)
          {
            _HKInitializeLogging();
            os_log_t v52 = *v20;
            if (!os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
            {
              v34 = v26;
              v26 = v38;
              goto LABEL_42;
            }
            v53 = v52;
            v54 = [v38 firstObject];
            *(_DWORD *)buf = v55;
            v51 = v60;
            v72 = v60;
            __int16 v73 = 2114;
            id v74 = v54;
            _os_log_impl(&dword_1BCB7D000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@: Master record %{public}@ contains one of our owner identifier; sync is disabled.",
              buf,
              0x16u);

            v34 = v26;
            v26 = v38;
LABEL_40:
            v4 = v59;
LABEL_43:
            v12 = v57;
            id v9 = v58;
            id v13 = v56;
            -[HDCloudSyncDetectSyncDisabledOperation _disableSyncLocally](v51);

            goto LABEL_44;
          }
          v28 = v38;
        }
        goto LABEL_32;
      }
    }
    uint64_t v18 = [v15 countByEnumeratingWithState:&v64 objects:v77 count:16];
    if (v18) {
      continue;
    }
    break;
  }
LABEL_35:

  [(HDCloudSyncOperation *)v60 finishWithSuccess:1 error:0];
  id v9 = v58;
  v4 = v59;
  id v13 = v56;
  v12 = v57;
LABEL_44:
}

id __46__HDCloudSyncDetectSyncDisabledOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) cachedOwnerIdentifierForContainer:a2];
  v3 = [v2 string];

  return v3;
}

- (void)_disableSyncLocally
{
  if (a1)
  {
    v2 = [HDCloudSyncDisableSyncLocallyOperation alloc];
    v3 = [a1 configuration];
    v4 = [a1 cloudState];
    v5 = [(HDCloudSyncOperation *)v2 initWithConfiguration:v3 cloudState:v4];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__HDCloudSyncDetectSyncDisabledOperation__disableSyncLocally__block_invoke;
    v7[3] = &unk_1E62F2950;
    v7[4] = a1;
    [(HDCloudSyncOperation *)v5 setOnError:v7];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__HDCloudSyncDetectSyncDisabledOperation__disableSyncLocally__block_invoke_285;
    v6[3] = &unk_1E62F2928;
    v6[4] = a1;
    [(HDCloudSyncOperation *)v5 setOnSuccess:v6];
    [(HDCloudSyncOperation *)v5 start];
  }
}

void __61__HDCloudSyncDetectSyncDisabledOperation__disableSyncLocally__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v9 = 138543618;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to disable sync locally after detecting sync disablement for this owner identifier: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  v7 = *(void **)(a1 + 32);
  v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 701, @"Cloud sync has been disabled for this device.");
  [v7 finishWithSuccess:0 error:v8];
}

void __61__HDCloudSyncDetectSyncDisabledOperation__disableSyncLocally__block_invoke_285(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Disabled sync locally after detecting sync disablement for this owner identifier.", (uint8_t *)&v6, 0xCu);
  }
  id v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 701, @"Cloud sync has been disabled for this device.");
  [v4 finishWithSuccess:0 error:v5];
}

@end