@interface HDCloudSyncComputePullTargetsOperation
+ (BOOL)shouldLogAtOperationEnd;
+ (BOOL)shouldLogAtOperationStart;
+ (id)finishedOperationTags;
+ (id)operationTagDependencies;
- (BOOL)performWithError:(id *)a3;
@end

@implementation HDCloudSyncComputePullTargetsOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

+ (BOOL)shouldLogAtOperationEnd
{
  return 0;
}

+ (id)operationTagDependencies
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = 0x1F1764B60;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (id)finishedOperationTags
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = 0x1F1764B80;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (BOOL)performWithError:(id *)a3
{
  v4 = self;
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  v5 = [(HDCloudSyncOperation *)self configuration];
  v6 = [v5 repository];
  v7 = [v6 profile];
  v8 = [v7 cloudSyncManager];
  char v9 = [v8 isChild];

  if (v9) {
    return 1;
  }
  v11 = [(HDCloudSyncOperation *)v4 configuration];
  v12 = [v11 repository];
  v13 = [v12 primaryCKContainer];

  v14 = [(HDCloudSyncOperation *)v4 configuration];
  v15 = [v14 repository];
  v16 = [v15 cachedOwnerIdentifierForContainer:v13];
  v17 = [v16 string];

  if (v4)
  {
    v18 = [(HDCloudSyncOperation *)v4 configuration];
    v19 = [v18 computedState];
    v20 = [v19 pushTargets];
    v71 = objc_msgSend(v20, "hk_mapToSet:", &__block_literal_global_164);

    v21 = [(HDCloudSyncOperation *)v4 configuration];
    v22 = [v21 cachedCloudState];
    id v105 = 0;
    v23 = [v22 zonesByIdentifierWithError:&v105];
    id v24 = v105;

    if (v23 || !v24)
    {
      if (v23)
      {
        v85 = a3;
        id v66 = v24;
        v68 = v17;
        v69 = v13;
        v78 = v4;
        id v70 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v101 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        v67 = v23;
        obuint64_t j = [v23 allValues];
        uint64_t v27 = [obj countByEnumeratingWithState:&v101 objects:v116 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v102;
          while (2)
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v102 != v29) {
                objc_enumerationMutation(obj);
              }
              v31 = *(void **)(*((void *)&v101 + 1) + 8 * i);
              uint64_t v32 = objc_opt_class();
              id v100 = 0;
              v96[0] = MEMORY[0x1E4F143A8];
              v96[1] = 3221225472;
              v96[2] = __64__HDCloudSyncComputePullTargetsOperation__pullTargetsWithError___block_invoke_280;
              v96[3] = &unk_1E62FD6F8;
              id v97 = v71;
              id v98 = v70;
              v99 = v31;
              LOBYTE(v32) = [v31 recordsForClass:v32 epoch:0 error:&v100 enumerationHandler:v96];
              id v33 = v100;
              if ((v32 & 1) == 0)
              {
                _HKInitializeLogging();
                v56 = (void *)*MEMORY[0x1E4F29FA8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                {
                  v64 = v56;
                  v65 = [v31 zoneIdentifier];
                  *(_DWORD *)buf = 138543874;
                  v107 = v4;
                  __int16 v108 = 2114;
                  id v109 = v65;
                  __int16 v110 = 2114;
                  id v111 = v33;
                  _os_log_error_impl(&dword_1BCB7D000, v64, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get store records for %{public}@, %{public}@", buf, 0x20u);
                }
                v17 = v68;
                v13 = v69;
                if (v33)
                {
                  if (v85) {
                    id *v85 = v33;
                  }
                  else {
                    _HKLogDroppedError();
                  }
                }

                id v77 = 0;
                goto LABEL_51;
              }
            }
            uint64_t v28 = [obj countByEnumeratingWithState:&v101 objects:v116 count:16];
            if (v28) {
              continue;
            }
            break;
          }
        }

        id v77 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v92 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        obuint64_t j = v70;
        uint64_t v73 = [obj countByEnumeratingWithState:&v92 objects:v115 count:16];
        if (v73)
        {
          uint64_t v72 = *(void *)v93;
          do
          {
            uint64_t v34 = 0;
            do
            {
              if (*(void *)v93 != v72) {
                objc_enumerationMutation(obj);
              }
              uint64_t v75 = v34;
              v35 = *(void **)(*((void *)&v92 + 1) + 8 * v34);
              v36 = [obj objectForKeyedSubscript:v35];
              long long v88 = 0u;
              long long v89 = 0u;
              long long v90 = 0u;
              long long v91 = 0u;
              id v76 = v36;
              uint64_t v81 = [v36 countByEnumeratingWithState:&v88 objects:v114 count:16];
              if (v81)
              {
                v79 = v35;
                uint64_t v80 = *(void *)v89;
                do
                {
                  for (uint64_t j = 0; j != v81; ++j)
                  {
                    if (*(void *)v89 != v80) {
                      objc_enumerationMutation(v76);
                    }
                    v38 = *(void **)(*((void *)&v88 + 1) + 8 * j);
                    v84 = [(HDCloudSyncOperation *)v4 configuration];
                    v83 = [v84 repository];
                    v82 = [v83 profile];
                    v39 = [v82 legacyRepositoryProfile];
                    v40 = [v38 storeIdentifier];
                    v41 = [(HDCloudSyncOperation *)v4 configuration];
                    v42 = [v41 syncContainerPrefix];
                    v43 = [v38 ownerIdentifier];
                    v44 = [v38 syncIdentity];
                    v45 = [v35 containerIdentifier];
                    id v87 = 0;
                    v46 = +[HDCloudSyncStore syncStoreForProfile:v39 storeIdentifier:v40 syncCircleName:v42 ownerIdentifier:v43 syncIdentity:v44 containerIdentifier:v45 error:&v87];
                    id v86 = v87;

                    if (v46)
                    {
                      v47 = [HDCloudSyncTarget alloc];
                      v48 = [(HDCloudSyncOperation *)v78 configuration];
                      v49 = [v48 repository];
                      v50 = [v79 containerIdentifier];
                      v51 = [v49 containerForContainerIdentifier:v50];
                      v52 = [(HDCloudSyncTarget *)v47 initWithPurpose:1 container:v51 zoneIdentifier:v79 storeRecord:v38 store:v46 options:0];

                      [v77 addObject:v52];
                      v4 = v78;
                      v35 = v79;
                      v53 = v86;
                    }
                    else
                    {
                      v54 = v38;
                      _HKInitializeLogging();
                      v55 = *MEMORY[0x1E4F29FA8];
                      v4 = v78;
                      v35 = v79;
                      v53 = v86;
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138544130;
                        v107 = v78;
                        __int16 v108 = 2114;
                        id v109 = v54;
                        __int16 v110 = 2114;
                        id v111 = v79;
                        __int16 v112 = 2114;
                        id v113 = v86;
                        _os_log_error_impl(&dword_1BCB7D000, v55, OS_LOG_TYPE_ERROR, "%{public}@: Failed to lookup store for store record: %{public}@ zone: %{public}@ error: %{public}@", buf, 0x2Au);
                      }
                    }
                  }
                  uint64_t v81 = [v76 countByEnumeratingWithState:&v88 objects:v114 count:16];
                }
                while (v81);
              }

              uint64_t v34 = v75 + 1;
            }
            while (v75 + 1 != v73);
            uint64_t v73 = [obj countByEnumeratingWithState:&v92 objects:v115 count:16];
          }
          while (v73);
          v13 = v69;
        }
        else
        {
          v13 = v69;
        }
        v23 = v67;
        v17 = v68;
        id v24 = v66;
LABEL_51:

        v26 = v77;
      }
      else
      {
        _HKInitializeLogging();
        v57 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v107 = v4;
          _os_log_debug_impl(&dword_1BCB7D000, v57, OS_LOG_TYPE_DEBUG, "%{public}@ No cached zones found while generating pull targets.", buf, 0xCu);
        }
        v26 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      _HKInitializeLogging();
      v25 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v107 = v4;
        __int16 v108 = 2114;
        id v109 = v24;
        _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached zone identifiers while generating pull targets, %{public}@", buf, 0x16u);
      }
      if (a3)
      {
        v26 = 0;
        *a3 = v24;
      }
      else
      {
        _HKLogDroppedError();
        v26 = 0;
      }
    }

    if (v26)
    {
      v58 = [(HDCloudSyncOperation *)v4 configuration];
      v59 = [v58 computedState];
      [v59 addTargets:v26];

      _HKInitializeLogging();
      v60 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        v61 = v60;
        uint64_t v62 = [v26 count];
        *(_DWORD *)v116 = 138543874;
        v117 = v4;
        __int16 v118 = 2048;
        uint64_t v119 = v62;
        __int16 v120 = 2114;
        v121 = v17;
        _os_log_impl(&dword_1BCB7D000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@: Found %ld pull targets for owner %{public}@", v116, 0x20u);
      }
      BOOL v10 = 1;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
    v26 = 0;
  }

  return v10;
}

id __64__HDCloudSyncComputePullTargetsOperation__pullTargetsWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 storeRecord];
  v3 = [v2 storeIdentifier];

  return v3;
}

uint64_t __64__HDCloudSyncComputePullTargetsOperation__pullTargetsWithError___block_invoke_280(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = [v3 storeIdentifier];
  LOBYTE(v4) = [v4 containsObject:v5];

  if ((v4 & 1) == 0)
  {
    v6 = *(void **)(a1 + 40);
    v7 = [*(id *)(a1 + 48) zoneIdentifier];
    v8 = [v6 objectForKeyedSubscript:v7];

    if (v8)
    {
      [v8 addObject:v3];
    }
    else
    {
      char v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v3, 0);
      BOOL v10 = *(void **)(a1 + 40);
      v11 = [*(id *)(a1 + 48) zoneIdentifier];
      [v10 setObject:v9 forKeyedSubscript:v11];
    }
  }

  return 1;
}

- (void).cxx_destruct
{
}

@end