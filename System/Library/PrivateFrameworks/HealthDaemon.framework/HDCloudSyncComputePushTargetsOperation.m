@interface HDCloudSyncComputePushTargetsOperation
+ (BOOL)shouldLogAtOperationEnd;
+ (BOOL)shouldLogAtOperationStart;
+ (id)finishedOperationTags;
- (void)main;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncComputePushTargetsOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

+ (BOOL)shouldLogAtOperationEnd
{
  return 0;
}

+ (id)finishedOperationTags
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = 0x1F1764B60;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (void)main
{
  uint64_t v180 = *MEMORY[0x1E4F143B8];
  v3 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
  taskGroup = self->_taskGroup;
  self->_taskGroup = v3;

  [(HDSynchronousTaskGroup *)self->_taskGroup setDelegate:self];
  [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
  v5 = [(HDCloudSyncOperation *)self configuration];
  v6 = [v5 repository];
  v7 = [v6 profile];
  v8 = [v7 legacyRepositoryProfile];
  id v149 = 0;
  char v9 = HDUpgradedToSyncIdentity(v8, (uint64_t)&v149);
  id v10 = v149;
  self->_BOOL hasUpgradedToSyncIdentity = v9;

  if (v10)
  {
    v11 = self->_taskGroup;
  }
  else
  {
    if (self->_hasUpgradedToSyncIdentity)
    {
      v12 = [(HDCloudSyncOperation *)self profile];
      v13 = [v12 syncIdentityManager];
      v14 = [v13 currentSyncIdentity];
      v15 = [v14 identity];
      currentSyncIdentity = self->_currentSyncIdentity;
      self->_currentSyncIdentity = v15;
    }
    id v148 = 0;
    v17 = [(HDCloudSyncOperation *)self configuration];
    v18 = [v17 repository];
    v19 = [v18 primaryCKContainer];

    v20 = [(HDCloudSyncOperation *)self configuration];
    v21 = [v20 repository];
    v22 = [v21 cachedOwnerIdentifierForContainer:v19];
    v23 = [v22 string];

    id v24 = v19;
    id v25 = v23;
    v26 = [(HDCloudSyncOperation *)self configuration];
    v27 = [v26 repository];
    v28 = [v27 profileIdentifier];
    v145 = v24;
    v29 = HDDatabaseForContainer(v24, v28);
    uint64_t v142 = [v29 databaseScope];

    v30 = [(HDCloudSyncOperation *)self configuration];
    v31 = [v30 cachedCloudState];
    id v164 = 0;
    v32 = [v31 zonesByIdentifierWithError:&v164];
    id v33 = v164;

    if (v32 || !v33)
    {
      if (v32)
      {
        id v130 = v33;
        id v143 = v25;
        id v144 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v160 = 0u;
        long long v161 = 0u;
        long long v162 = 0u;
        long long v163 = 0u;
        v129 = v32;
        id obj = [v32 allValues];
        uint64_t v36 = [obj countByEnumeratingWithState:&v160 objects:buf count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v161;
          while (2)
          {
            for (uint64_t i = 0; i != v37; ++i)
            {
              if (*(void *)v161 != v38) {
                objc_enumerationMutation(obj);
              }
              v40 = *(void **)(*((void *)&v160 + 1) + 8 * i);
              uint64_t v41 = objc_opt_class();
              id v159 = 0;
              v156[0] = MEMORY[0x1E4F143A8];
              v156[1] = 3221225472;
              v156[2] = __89__HDCloudSyncComputePushTargetsOperation__pushTargetsForContainer_ownerIdentifier_error___block_invoke;
              v156[3] = &unk_1E63035F0;
              v156[4] = self;
              v156[5] = v40;
              id v157 = v25;
              id v158 = v144;
              LOBYTE(v41) = [v40 recordsForClass:v41 epoch:0 error:&v159 enumerationHandler:v156];
              id v42 = v159;
              if ((v41 & 1) == 0)
              {
                _HKInitializeLogging();
                v81 = (void *)*MEMORY[0x1E4F29FA8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                {
                  v111 = v81;
                  v112 = [v40 zoneIdentifier];
                  *(_DWORD *)v165 = 138543874;
                  v166 = self;
                  __int16 v167 = 2114;
                  v168 = v112;
                  __int16 v169 = 2114;
                  id v170 = v42;
                  _os_log_error_impl(&dword_1BCB7D000, v111, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve records for zone identifier: %{public}@, %{public}@", v165, 0x20u);
                }
                id v82 = v42;
                v83 = v82;
                if (v82) {
                  id v148 = v82;
                }

                id v35 = 0;
                goto LABEL_72;
              }
            }
            uint64_t v37 = [obj countByEnumeratingWithState:&v160 objects:buf count:16];
            if (v37) {
              continue;
            }
            break;
          }
        }

        v43 = [(HDCloudSyncOperation *)self configuration];
        v44 = [v43 syncDate];
        uint64_t v45 = objc_msgSend(v144, "hk_foldRightFrom:with:", v44, &__block_literal_global_134);

        v46 = [(HDCloudSyncOperation *)self profile];
        v47 = [(HDCloudSyncOperation *)self configuration];
        v48 = [v47 syncContainerPrefix];
        v49 = [v145 containerIdentifier];
        id obj = (id)v45;
        uint64_t v50 = v45;
        id v25 = v143;
        v51 = +[HDCloudSyncStore createOrUpdateShardStoresForProfile:v46 throughDate:v50 syncCircleName:v48 ownerIdentifier:v143 containerIdentifier:v49 syncIdentity:self->_currentSyncIdentity error:&v148];

        if (v51)
        {
          v128 = v51;
          uint64_t v52 = objc_msgSend(v51, "hk_mapToDictionary:", &__block_literal_global_299_0);
          id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v152 = 0u;
          long long v153 = 0u;
          long long v154 = 0u;
          long long v155 = 0u;
          v54 = (void *)v52;
          id v132 = v144;
          uint64_t v140 = [v132 countByEnumeratingWithState:&v152 objects:v165 count:16];
          v131 = (void *)v52;
          if (v140)
          {
            v138 = v53;
            uint64_t v139 = *(void *)v153;
LABEL_23:
            uint64_t v55 = 0;
            while (1)
            {
              if (*(void *)v153 != v139) {
                objc_enumerationMutation(v132);
              }
              v56 = *(void **)(*((void *)&v152 + 1) + 8 * v55);
              v57 = [v56 recordID];
              v58 = [v57 zoneID];
              v59 = [v145 containerIdentifier];
              v146 = +[HDCloudSyncZoneIdentifier identifierForZone:v58 container:v59 scope:v142];

              v60 = [v56 storeIdentifier];
              uint64_t v61 = [v54 objectForKeyedSubscript:v60];

              if (v61)
              {
                v62 = [HDCloudSyncTarget alloc];
                v63 = [(HDCloudSyncOperation *)self configuration];
                v64 = [v63 repository];
                v65 = [v64 primaryCKContainer];
                uint64_t v66 = [(HDCloudSyncTarget *)v62 initWithPurpose:0 container:v65 zoneIdentifier:v146 storeRecord:v56 store:v61 options:0];
                v67 = (void *)v61;
                v68 = (void *)v66;

                id v53 = v138;
                [v138 addObject:v68];
              }
              else
              {
                v136 = [(HDCloudSyncOperation *)self configuration];
                v135 = [v136 repository];
                v134 = [v135 profile];
                v133 = [v134 legacyRepositoryProfile];
                v69 = [v56 storeIdentifier];
                v70 = [(HDCloudSyncOperation *)self configuration];
                v71 = [v70 syncContainerPrefix];
                v72 = [v56 ownerIdentifier];
                [v56 syncIdentity];
                v74 = v73 = self;
                v75 = [v146 containerIdentifier];
                id v151 = 0;
                v68 = +[HDCloudSyncStore syncStoreForProfile:v133 storeIdentifier:v69 syncCircleName:v71 ownerIdentifier:v72 syncIdentity:v74 containerIdentifier:v75 error:&v151];
                id v137 = v151;

                if (!v68)
                {
                  id v150 = 0;
                  id v86 = v56;
                  id v147 = v146;
                  v87 = [v86 storeIdentifier];
                  v88 = v73;
                  v89 = [(HDCloudSyncOperation *)v73 configuration];
                  v90 = [v89 repository];
                  v91 = [v90 profile];
                  v92 = [v91 legacyRepositoryProfile];
                  v93 = +[HDCloudSyncStoreEntity persistedStateForStoreUUID:v87 profile:v92 error:&v150];

                  if (v93)
                  {
                    v94 = [v93 ownerIdentifier];
                    v95 = [v86 ownerIdentifier];
                    int v96 = [v94 isEqualToString:v95];

                    v97 = [v93 containerIdentifier];
                    v98 = v147;
                    v99 = [v147 containerIdentifier];
                    int v100 = [v97 isEqualToString:v99];

                    BOOL hasUpgradedToSyncIdentity = v88->_hasUpgradedToSyncIdentity;
                    self = v88;
                    v32 = v129;
                    if (hasUpgradedToSyncIdentity)
                    {
                      v102 = [v93 syncIdentity];
                      v103 = [v86 syncIdentity];
                      int v104 = [v102 isEqual:v103] ^ 1;
                    }
                    else
                    {
                      int v104 = 0;
                    }
                    if ((v96 & v100) == 1 && !v104)
                    {

                      id v110 = v150;
                      _HKInitializeLogging();
                      v113 = (void *)*MEMORY[0x1E4F29FA8];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
                      {
                        v114 = v113;
                        v115 = [v86 storeIdentifier];
                        *(_DWORD *)v177 = 138543874;
                        *(void *)&v177[4] = self;
                        *(_WORD *)&v177[12] = 2114;
                        *(void *)&v177[14] = v115;
                        *(_WORD *)&v177[22] = 2114;
                        v178 = v137;
                        _os_log_impl(&dword_1BCB7D000, v114, OS_LOG_TYPE_DEFAULT, "%{public}@: Could not create local push store: %{public}@ error: %{public}@", v177, 0x20u);
                      }
                      id v109 = v137;
                      id v25 = v143;
                      id v53 = v138;
                      if (v109)
                      {
                        id v109 = v109;
                        id v148 = v109;
                      }
                      goto LABEL_69;
                    }
                    v116 = @"no";
                    if (v96) {
                      v117 = @"YES";
                    }
                    else {
                      v117 = @"no";
                    }
                    if (v100) {
                      v118 = @"YES";
                    }
                    else {
                      v118 = @"no";
                    }
                    if (!v104) {
                      v116 = @"YES";
                    }
                    v119 = [NSString stringWithFormat:@"Invalid push store found: sameOwnerID=%@, sameContainerID=%@, sameSyncIdentity=%@", v117, v118, v116];
                    [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
                    v120 = [(HDCloudSyncOperation *)self profile];
                    v121 = [v120 cloudSyncManager];
                    v122 = [v121 ownerIdentifierManager];
                    *(void *)v177 = MEMORY[0x1E4F143A8];
                    *(void *)&v177[8] = 3221225472;
                    *(void *)&v177[16] = __103__HDCloudSyncComputePushTargetsOperation__hasStateMismatchForStoreForStoreRecord_zoneIdentifier_error___block_invoke;
                    v178 = &unk_1E62F2978;
                    v179 = self;
                    [v122 rollOwnerDifferentiatorForReason:v119 completion:v177];

                    id v110 = v150;
                    id v35 = (id)MEMORY[0x1E4F1CBF0];
                    id v25 = v143;
                    id v53 = v138;
                  }
                  else
                  {
                    v98 = v147;

                    id v105 = v150;
                    _HKInitializeLogging();
                    v106 = (void *)*MEMORY[0x1E4F29FA8];
                    self = v88;
                    v32 = v129;
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
                    {
                      v107 = v106;
                      v108 = [v86 storeIdentifier];
                      *(_DWORD *)v177 = 138543874;
                      *(void *)&v177[4] = self;
                      *(_WORD *)&v177[12] = 2114;
                      *(void *)&v177[14] = v108;
                      *(_WORD *)&v177[22] = 2114;
                      v178 = v105;
                      _os_log_impl(&dword_1BCB7D000, v107, OS_LOG_TYPE_DEFAULT, "%{public}@: Could not validate state mismatch error when looking up local push store: %{public}@ error: %{public}@", v177, 0x20u);
                    }
                    id v109 = v105;
                    id v25 = v143;
                    if (v109)
                    {
                      id v109 = v109;
                      id v110 = v109;
                      id v148 = v109;
                    }
                    else
                    {
                      id v110 = 0;
                    }
                    id v53 = v138;
LABEL_69:

                    id v35 = 0;
                  }

                  goto LABEL_71;
                }
                v76 = [HDCloudSyncTarget alloc];
                self = v73;
                v77 = [(HDCloudSyncOperation *)v73 configuration];
                v78 = [v77 repository];
                v79 = [v78 primaryCKContainer];
                v54 = v131;
                v80 = -[HDCloudSyncTarget initWithPurpose:container:zoneIdentifier:storeRecord:store:options:](v76, "initWithPurpose:container:zoneIdentifier:storeRecord:store:options:", 0, v79, v146, v56, v68, 4 * ([v131 count] != 0));

                id v53 = v138;
                [v138 addObject:v80];

                v67 = v137;
              }

              if (v140 == ++v55)
              {
                uint64_t v140 = [v132 countByEnumeratingWithState:&v152 objects:v165 count:16];
                if (v140) {
                  goto LABEL_23;
                }
                break;
              }
            }
          }

          id v35 = v53;
          id v25 = v143;
          v32 = v129;
LABEL_71:

          v83 = v128;
        }
        else
        {
          _HKInitializeLogging();
          v85 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v165 = 138543362;
            v166 = self;
            _os_log_error_impl(&dword_1BCB7D000, v85, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create or update push shards.", v165, 0xCu);
          }
          v83 = 0;
          id v35 = 0;
        }
LABEL_72:

        id v33 = v130;
      }
      else
      {
        _HKInitializeLogging();
        v84 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v172 = self;
          _os_log_debug_impl(&dword_1BCB7D000, v84, OS_LOG_TYPE_DEBUG, "%{public}@ No cached zones found while generating push targets.", buf, 0xCu);
        }
        id v35 = (id)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      _HKInitializeLogging();
      v34 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v172 = self;
        __int16 v173 = 2114;
        uint64_t v174 = (uint64_t)v33;
        _os_log_error_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached zone identifiers while generating push targets, %{public}@", buf, 0x16u);
      }
      id v35 = 0;
      id v148 = v33;
    }

    if (v35)
    {
      v123 = [(HDCloudSyncOperation *)self configuration];
      v124 = [v123 computedState];
      [v124 addTargets:v35];

      _HKInitializeLogging();
      v125 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        v126 = v125;
        uint64_t v127 = [v35 count];
        *(_DWORD *)buf = 138543874;
        v172 = self;
        __int16 v173 = 2048;
        uint64_t v174 = v127;
        __int16 v175 = 2114;
        id v176 = v25;
        _os_log_impl(&dword_1BCB7D000, v126, OS_LOG_TYPE_DEFAULT, "%{public}@: Found %ld push targets for owner %{public}@", buf, 0x20u);
      }
    }

    id v10 = v148;
    v11 = self->_taskGroup;
    if (v35)
    {
      [(HDSynchronousTaskGroup *)v11 finishTask];
      goto LABEL_78;
    }
  }
  [(HDSynchronousTaskGroup *)v11 failTaskWithError:v10];
LABEL_78:
}

uint64_t __103__HDCloudSyncComputePushTargetsOperation__hasStateMismatchForStoreForStoreRecord_zoneIdentifier_error___block_invoke(uint64_t a1, int a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 104);
  if (a2) {
    return [v2 finishTask];
  }
  else {
    return objc_msgSend(v2, "failTaskWithError:");
  }
}

uint64_t __89__HDCloudSyncComputePushTargetsOperation__pushTargetsForContainer_ownerIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(unsigned char **)(a1 + 32);
  v5 = [*(id *)(a1 + 40) zoneIdentifier];
  v6 = *(void **)(a1 + 48);
  id v7 = v3;
  id v8 = v5;
  id v9 = v6;
  id v10 = v9;
  if (!v4) {
    goto LABEL_11;
  }
  v11 = v7;
  v12 = v9;
  v13 = v8;
  v14 = [v8 containerIdentifier];
  v32 = v4;
  v15 = [v4 configuration];
  v16 = [v15 repository];
  v17 = [v16 primaryCKContainer];
  v18 = [v17 containerIdentifier];
  char v19 = [v14 isEqualToString:v18];

  if (v19)
  {
    id v7 = v11;
    v20 = [v11 ownerIdentifier];
    id v10 = v12;
    int v21 = [v20 isEqualToString:v12];

    id v8 = v13;
    if (v21)
    {
      if (!v32[120])
      {
        _HKInitializeLogging();
        id v24 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v34 = v32;
          __int16 v35 = 2114;
          uint64_t v36 = v13;
          v26 = "%{public}@: %{public}@: Valid push candidate. Upgrade to Sync Identity unavailable.";
          goto LABEL_15;
        }
LABEL_16:

        [*(id *)(a1 + 56) addObject:v11];
        goto LABEL_12;
      }
      v22 = [v11 syncIdentity];
      char v23 = [v22 isEqual:*((void *)v32 + 14)];

      _HKInitializeLogging();
      id v24 = *MEMORY[0x1E4F29FA8];
      BOOL v25 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT);
      if (v23)
      {
        if (v25)
        {
          *(_DWORD *)buf = 138543618;
          v34 = v32;
          __int16 v35 = 2114;
          uint64_t v36 = v13;
          v26 = "%{public}@: %{public}@: Valid push candidate.";
LABEL_15:
          _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_DEFAULT, v26, buf, 0x16u);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      if (v25)
      {
        v28 = v24;
        v29 = [v11 syncIdentity];
        *(_DWORD *)buf = 138543874;
        v34 = v32;
        __int16 v35 = 2114;
        uint64_t v36 = v13;
        __int16 v37 = 2114;
        uint64_t v38 = v29;
        v30 = "%{public}@: %{public}@: Not a push candidate, wrong sync identity '%{public}@'";
        goto LABEL_10;
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v27 = (void *)*MEMORY[0x1E4F29FA8];
    id v10 = v12;
    id v7 = v11;
    id v8 = v13;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      v28 = v27;
      v29 = [v13 containerIdentifier];
      *(_DWORD *)buf = 138543874;
      v34 = v32;
      __int16 v35 = 2114;
      uint64_t v36 = v13;
      __int16 v37 = 2114;
      uint64_t v38 = v29;
      v30 = "%{public}@: %{public}@: Not a push candidate, wrong container '%{public}@'";
LABEL_10:
      _os_log_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_DEFAULT, v30, buf, 0x20u);
    }
  }
LABEL_11:

LABEL_12:
  return 1;
}

id __89__HDCloudSyncComputePushTargetsOperation__pushTargetsForContainer_ownerIdentifier_error___block_invoke_293(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 shardPredicate];
  v6 = [v5 endDate];

  if (v6)
  {
    id v7 = [v5 endDate];
    if (objc_msgSend(v4, "hk_isBeforeDate:", v7))
    {
      id v8 = [v5 endDate];
    }
    else
    {
      id v8 = v4;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = v4;
  }

  return v9;
}

void __89__HDCloudSyncComputePushTargetsOperation__pushTargetsForContainer_ownerIdentifier_error___block_invoke_296(uint64_t a1, void *a2, void (**a3)(void, void, void))
{
  v5 = a3;
  id v6 = a2;
  id v7 = [v6 storeIdentifier];
  ((void (**)(void, id, id))a3)[2](v5, v7, v6);
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  BOOL v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(HDCloudSyncOperation *)self finishWithSuccess:v5 error:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSyncIdentity, 0);

  objc_storeStrong((id *)&self->_taskGroup, 0);
}

@end