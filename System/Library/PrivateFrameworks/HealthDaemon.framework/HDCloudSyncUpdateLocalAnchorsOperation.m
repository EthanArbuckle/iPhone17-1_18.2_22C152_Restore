@interface HDCloudSyncUpdateLocalAnchorsOperation
+ (BOOL)shouldLogAtOperationStart;
+ (id)finishedOperationTags;
+ (id)operationTagDependencies;
- (BOOL)performWithError:(id *)a3;
@end

@implementation HDCloudSyncUpdateLocalAnchorsOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

+ (id)finishedOperationTags
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = 0x1F1764BA0;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (id)operationTagDependencies
{
  void v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = 0x1F1764B60;
  v4[1] = 0x1F1764B80;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (BOOL)performWithError:(id *)a3
{
  v5 = [(HDCloudSyncOperation *)self configuration];
  v6 = [v5 repository];
  v7 = [v6 profile];
  v8 = [v7 legacyRepositoryProfile];

  v9 = [v8 database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__HDCloudSyncUpdateLocalAnchorsOperation_performWithError___block_invoke;
  v11[3] = &unk_1E62F6130;
  v11[4] = self;
  LOBYTE(a3) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v9 error:a3 block:v11];

  return (char)a3;
}

uint64_t __59__HDCloudSyncUpdateLocalAnchorsOperation_performWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v5 = [*(id *)(a1 + 32) configuration];
  v6 = [v5 computedState];
  v7 = [v6 targets];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v65 objects:v73 count:16];
  if (!v8)
  {
    uint64_t v49 = 1;
    goto LABEL_43;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v66;
  uint64_t v59 = v4;
  v60 = v7;
  uint64_t v55 = *(void *)v66;
  while (2)
  {
    uint64_t v11 = 0;
    uint64_t v56 = v9;
    do
    {
      if (*(void *)v66 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v65 + 1) + 8 * v11);
      uint64_t v13 = [v12 purpose];
      if (v13)
      {
        if (v13 != 1) {
          goto LABEL_32;
        }
        v14 = *(void **)(v4 + 32);
        id v15 = v12;
        v16 = v15;
        v63 = v14;
        if (!v14)
        {
LABEL_41:

          _HKInitializeLogging();
          v50 = *MEMORY[0x1E4F29FA8];
          v7 = v60;
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR)) {
            goto LABEL_42;
          }
          uint64_t v54 = *(void *)(v59 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v75 = v54;
          __int16 v76 = 2114;
          v77 = v16;
          v52 = "%{public}@: Failed to update expected sync anchors for %{public}@";
          goto LABEL_45;
        }
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        v17 = [v15 storeRecord];
        v18 = [v17 orderedSequenceRecords];

        obuint64_t j = v18;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v69 objects:buf count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v62 = *(void *)v70;
          uint64_t v57 = v11;
          while (2)
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              uint64_t v22 = a3;
              if (*(void *)v70 != v62) {
                objc_enumerationMutation(obj);
              }
              id v23 = *(id *)(*((void *)&v69 + 1) + 8 * i);
              v24 = v16;
              v25 = [v16 store];
              v26 = objc_msgSend(v25, "syncStoreForEpoch:", objc_msgSend(v23, "baselineEpoch"));

              v27 = [v63 configuration];
              v28 = [v27 repository];
              v29 = [v28 profile];
              v30 = [v29 legacyRepositoryProfile];

              a3 = v22;
              if (!+[HDSyncAnchorEntity resetSyncAnchorsOfType:4 store:v26 profile:v30 error:v22])
              {

LABEL_40:
                v16 = v24;
                goto LABEL_41;
              }
              v31 = [v23 syncAnchorMap];
              BOOL v32 = +[HDSyncAnchorEntity updateSyncAnchorsWithMap:v31 type:4 store:v26 updatePolicy:2 resetInvalid:0 profile:v30 error:v22];

              if (!v32) {
                goto LABEL_40;
              }
              v16 = v24;
            }
            uint64_t v20 = [obj countByEnumeratingWithState:&v69 objects:buf count:16];
            uint64_t v11 = v57;
            uint64_t v4 = v59;
            uint64_t v10 = v55;
            uint64_t v9 = v56;
            if (v20) {
              continue;
            }
            break;
          }
        }

        v7 = v60;
      }
      else
      {
        uint64_t v58 = v11;
        uint64_t v64 = a3;
        uint64_t v33 = *(void *)(v4 + 32);
        id v34 = v12;
        v35 = v34;
        if (!v33)
        {
LABEL_37:

          _HKInitializeLogging();
          v50 = *MEMORY[0x1E4F29FA8];
          v7 = v60;
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
LABEL_42:
            uint64_t v49 = 0;
            goto LABEL_43;
          }
          uint64_t v51 = *(void *)(v59 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v75 = v51;
          __int16 v76 = 2114;
          v77 = v35;
          v52 = "%{public}@: Failed to update frozen sync anchors for %{public}@";
LABEL_45:
          _os_log_error_impl(&dword_1BCB7D000, v50, OS_LOG_TYPE_ERROR, v52, buf, 0x16u);
          goto LABEL_42;
        }
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        v36 = [v34 storeRecord];
        v37 = [v36 orderedSequenceRecords];

        uint64_t v38 = [v37 countByEnumeratingWithState:&v69 objects:buf count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v70;
          while (2)
          {
            for (uint64_t j = 0; j != v39; ++j)
            {
              if (*(void *)v70 != v40) {
                objc_enumerationMutation(v37);
              }
              v42 = *(void **)(*((void *)&v69 + 1) + 8 * j);
              v43 = [v35 store];
              v44 = objc_msgSend(v43, "syncStoreForEpoch:", objc_msgSend(v42, "baselineEpoch"));

              if (v44)
              {
                v45 = [v42 frozenSyncAnchorMap];
                if (v45)
                {
                  v46 = [v42 record];
                  v47 = [v46 modificationDate];
                  int v48 = [v44 replaceFrozenAnchorMap:v45 updateDate:v47 error:v64];

                  if (!v48)
                  {

                    goto LABEL_37;
                  }
                }
              }
            }
            uint64_t v39 = [v37 countByEnumeratingWithState:&v69 objects:buf count:16];
            if (v39) {
              continue;
            }
            break;
          }
        }

        uint64_t v4 = v59;
        v7 = v60;
        a3 = v64;
        uint64_t v10 = v55;
        uint64_t v9 = v56;
        uint64_t v11 = v58;
      }
LABEL_32:
      ++v11;
    }
    while (v11 != v9);
    uint64_t v9 = [v7 countByEnumeratingWithState:&v65 objects:v73 count:16];
    uint64_t v49 = 1;
    if (v9) {
      continue;
    }
    break;
  }
LABEL_43:

  return v49;
}

@end