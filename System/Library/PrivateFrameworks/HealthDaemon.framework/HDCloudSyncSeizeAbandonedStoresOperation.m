@interface HDCloudSyncSeizeAbandonedStoresOperation
+ (BOOL)shouldLogAtOperationStart;
+ (id)operationTagDependencies;
- (id)anchorMapForTakeoverForTarget:(void *)a1;
- (void)main;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncSeizeAbandonedStoresOperation

+ (id)operationTagDependencies
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = 0x1F1764B60;
  v4[1] = 0x1F1764B80;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void)main
{
  uint64_t v228 = *MEMORY[0x1E4F143B8];
  v2 = [(HDCloudSyncOperation *)self configuration];
  if ([v2 rebaseProhibited])
  {

LABEL_33:
    [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
    return;
  }
  v3 = [(HDCloudSyncOperation *)self profile];
  v4 = [v3 daemon];
  v5 = [v4 behavior];
  char v6 = [v5 canPerformOwnershipTakeover];

  if ((v6 & 1) == 0) {
    goto LABEL_33;
  }
  v7 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
  taskGroup = self->_taskGroup;
  self->_taskGroup = v7;

  [(HDSynchronousTaskGroup *)self->_taskGroup setDelegate:self];
  [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
  v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v10 = [v9 objectForKey:*MEMORY[0x1E4F29618]];
  v11 = v10;
  double v12 = *MEMORY[0x1E4F295F8];
  if (v10)
  {
    [v10 doubleValue];
    if (v12 >= v13) {
      double v12 = v13;
    }
  }

  v14 = [(HDCloudSyncOperation *)self configuration];
  v15 = [v14 computedState];
  v16 = [v15 targets];
  *(void *)v224 = MEMORY[0x1E4F143A8];
  *(void *)&v224[8] = 3221225472;
  *(void *)&v224[16] = __69__HDCloudSyncSeizeAbandonedStoresOperation__computeTargetsForSeizure__block_invoke;
  v225 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E630F430;
  v226 = self;
  double v227 = v12;
  v17 = objc_msgSend(v16, "hk_map:", v224);

  id v194 = 0;
  id v18 = v17;
  id v186 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v19 = v18;
  v20 = [(HDCloudSyncOperation *)self configuration];
  v21 = [v20 computedState];
  v22 = [v21 targets];
  *(void *)&long long v205 = MEMORY[0x1E4F143A8];
  *((void *)&v205 + 1) = 3221225472;
  *(void *)&long long v206 = __76__HDCloudSyncSeizeAbandonedStoresOperation__computeAllActiveTargetsByChild___block_invoke;
  *((void *)&v206 + 1) = &unk_1E62F4740;
  id v176 = v19;
  *(void *)&long long v207 = v176;
  v23 = objc_msgSend(v22, "hk_filter:", &v205);

  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v215 = 0u;
  long long v216 = 0u;
  long long v213 = 0u;
  long long v214 = 0u;
  obuint64_t j = v23;
  uint64_t v185 = [obj countByEnumeratingWithState:&v213 objects:v224 count:16];
  if (v185)
  {
    uint64_t v184 = *(void *)v214;
    do
    {
      v25 = 0;
      do
      {
        if (*(void *)v214 != v184)
        {
          v26 = v25;
          objc_enumerationMutation(obj);
          v25 = v26;
        }
        v187 = v25;
        v27 = *(void **)(*((void *)&v213 + 1) + 8 * (void)v25);
        v28 = [v27 storeRecord];
        if (([v28 isChild] & 1) == 0)
        {
          v29 = [v27 storeRecord];
          v30 = [v29 sequenceRecord];
          v31 = [v30 includedChildSyncIdentities];
          BOOL v32 = [v31 count] == 0;

          if (v32) {
            goto LABEL_29;
          }
          long long v211 = 0u;
          long long v212 = 0u;
          long long v209 = 0u;
          long long v210 = 0u;
          v33 = [v27 storeRecord];
          v34 = [v33 sequenceRecord];
          v28 = [v34 includedChildSyncIdentities];

          uint64_t v35 = [v28 countByEnumeratingWithState:&v209 objects:&v220 count:16];
          if (v35)
          {
            uint64_t v36 = *(void *)v210;
            do
            {
              for (uint64_t i = 0; i != v35; ++i)
              {
                if (*(void *)v210 != v36) {
                  objc_enumerationMutation(v28);
                }
                uint64_t v38 = *(void *)(*((void *)&v209 + 1) + 8 * i);
                v39 = [v24 objectForKeyedSubscript:v38];
                v40 = v39;
                if (v39) {
                  id v41 = v39;
                }
                else {
                  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                }
                v42 = v41;

                v43 = [v27 storeRecord];
                v44 = [v43 syncIdentity];
                BOOL v45 = v44 == 0;

                if (v45)
                {
                  _HKInitializeLogging();
                  v48 = (void *)*MEMORY[0x1E4F29FA8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                  {
                    v49 = v48;
                    v50 = [v27 storeRecord];
                    *(_DWORD *)buf = 138543618;
                    *(void *)&buf[4] = self;
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v50;
                    _os_log_error_impl(&dword_1BCB7D000, v49, OS_LOG_TYPE_ERROR, "%{public}@: StoreRecord has a nil sync identity %{public}@", buf, 0x16u);
                  }
                }
                else
                {
                  v46 = [v27 storeRecord];
                  v47 = [v46 syncIdentity];
                  [v42 addObject:v47];

                  [v24 setObject:v42 forKeyedSubscript:v38];
                }
              }
              uint64_t v35 = [v28 countByEnumeratingWithState:&v209 objects:&v220 count:16];
            }
            while (v35);
          }
        }

LABEL_29:
        v25 = v187 + 1;
      }
      while (v187 + 1 != (char *)v185);
      uint64_t v185 = [obj countByEnumeratingWithState:&v213 objects:v224 count:16];
    }
    while (v185);
  }

  *(void *)v224 = 0;
  *(void *)&v224[8] = v224;
  *(void *)&v224[16] = 0x3032000000;
  v225 = __Block_byref_object_copy__213;
  v226 = (HDCloudSyncSeizeAbandonedStoresOperation *)__Block_byref_object_dispose__213;
  double v227 = 0.0;
  v51 = +[HDMutableDatabaseTransactionContext contextForReading];
  v52 = [(HDCloudSyncOperation *)self configuration];
  uint64_t v53 = [v52 accessibilityAssertion];
  v54 = [v51 contextWithAccessibilityAssertion:v53];

  v55 = [(HDCloudSyncOperation *)self profile];
  v56 = [v55 database];
  *(void *)&long long v220 = MEMORY[0x1E4F143A8];
  *((void *)&v220 + 1) = 3221225472;
  *(void *)&long long v221 = __74__HDCloudSyncSeizeAbandonedStoresOperation__childSyncIdentitiesWithError___block_invoke;
  *((void *)&v221 + 1) = &unk_1E62F9108;
  *((void *)&v222 + 1) = v224;
  *(void *)&long long v222 = self;
  LOBYTE(v53) = [v56 performTransactionWithContext:v54 error:&v194 block:&v220 inaccessibilityHandler:0];

  if (v53) {
    id v178 = *(id *)(*(void *)&v224[8] + 40);
  }
  else {
    id v178 = 0;
  }

  _Block_object_dispose(v224, 8);
  if (!v178) {
    goto LABEL_97;
  }
  long long v218 = 0u;
  long long v219 = 0u;
  memset(buf, 0, sizeof(buf));
  id v188 = v176;
  uint64_t v179 = [v188 countByEnumeratingWithState:buf objects:&v220 count:16];
  if (!v179) {
    goto LABEL_80;
  }
  uint64_t v177 = **(void **)&buf[16];
  do
  {
    v57 = 0;
    do
    {
      if (**(void **)&buf[16] != v177)
      {
        v58 = v57;
        objc_enumerationMutation(v188);
        v57 = v58;
      }
      obja = v57;
      v59 = *(void **)(*(void *)&buf[8] + 8 * (void)v57);
      v60 = [v59 storeRecord];
      int v61 = [v60 isChild];

      v62 = [v59 storeRecord];
      v63 = [v62 syncIdentity];
      int v64 = [v178 containsObject:v63];

      v65 = [v59 storeRecord];
      v66 = [v65 sequenceRecord];
      v67 = [v66 includedChildSyncIdentities];
      uint64_t v68 = [v67 count];

      if (v61)
      {
        id v69 = v59;
        id v70 = v24;
        if (v64)
        {
          _HKInitializeLogging();
          v71 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            v72 = v71;
            v73 = [v69 store];
            v74 = [v73 syncIdentity];
            *(_DWORD *)v224 = 138543618;
            *(void *)&v224[4] = self;
            *(_WORD *)&v224[12] = 2114;
            *(void *)&v224[14] = v74;
            _os_log_impl(&dword_1BCB7D000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@: targetIsAChild: Candidate target is ownChild (%{public}@), continue seizing", v224, 0x16u);
          }
LABEL_77:

          goto LABEL_78;
        }
        v108 = [v69 storeRecord];
        v109 = [v108 syncIdentity];
        v110 = [v70 objectForKeyedSubscript:v109];
        BOOL v111 = [v110 count] == 0;

        _HKInitializeLogging();
        v112 = (void *)*MEMORY[0x1E4F29FA8];
        BOOL v113 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT);
        if (v111)
        {
          if (v113)
          {
            v121 = v112;
            v122 = [v69 store];
            v123 = [v122 syncIdentity];
            *(_DWORD *)v224 = 138543618;
            *(void *)&v224[4] = self;
            *(_WORD *)&v224[12] = 2114;
            *(void *)&v224[14] = v123;
            _os_log_impl(&dword_1BCB7D000, v121, OS_LOG_TYPE_DEFAULT, "%{public}@: targetIsAChild: Candidate target is not ownChild nor another active target's child, continue seizing (%{public}@)", v224, 0x16u);
          }
          goto LABEL_77;
        }
        if (v113)
        {
          v114 = v112;
          v115 = [v69 store];
          v116 = [v115 syncIdentity];
          *(_DWORD *)v224 = 138543618;
          *(void *)&v224[4] = self;
          *(_WORD *)&v224[12] = 2114;
          *(void *)&v224[14] = v116;
          _os_log_impl(&dword_1BCB7D000, v114, OS_LOG_TYPE_DEFAULT, "%{public}@: targetIsAChild: Candidate target is another active target's child, do not seize target (%{public}@)", v224, 0x16u);
        }
        [v186 addObject:v69];
      }
      else if (v68)
      {
        id v75 = v59;
        v76 = [(HDCloudSyncOperation *)self configuration];
        v77 = [v76 computedState];
        v78 = [v77 targets];
        *(void *)v224 = MEMORY[0x1E4F143A8];
        *(void *)&v224[8] = 3221225472;
        *(void *)&v224[16] = __80__HDCloudSyncSeizeAbandonedStoresOperation__childTargetBySyncIdentityForParent___block_invoke;
        v225 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E630F458;
        v190 = (HDCloudSyncSeizeAbandonedStoresOperation *)v75;
        v226 = v190;
        v79 = objc_msgSend(v78, "hk_mapToDictionary:", v224);

        long long v199 = 0u;
        long long v200 = 0u;
        long long v201 = 0u;
        long long v202 = 0u;
        v80 = [(HDCloudSyncSeizeAbandonedStoresOperation *)v190 storeRecord];
        v81 = [v80 sequenceRecord];
        v82 = [v81 includedChildSyncIdentities];

        uint64_t v83 = [v82 countByEnumeratingWithState:&v199 objects:&v213 count:16];
        if (v83)
        {
          uint64_t v84 = *(void *)v200;
          while (2)
          {
            for (uint64_t j = 0; j != v83; ++j)
            {
              if (*(void *)v200 != v84) {
                objc_enumerationMutation(v82);
              }
              v86 = *(uint64_t (**)(uint64_t, uint64_t))(*((void *)&v199 + 1) + 8 * j);
              v87 = [v24 objectForKeyedSubscript:v86];
              if (!v87
                || ([v24 objectForKeyedSubscript:v86],
                    v88 = objc_claimAutoreleasedReturnValue(),
                    BOOL v89 = v88 == 0,
                    v88,
                    v87,
                    v89))
              {
                v94 = [v79 objectForKeyedSubscript:v86];
                BOOL v95 = v94 == 0;

                if (v95)
                {
                  _HKInitializeLogging();
                  v104 = (void *)*MEMORY[0x1E4F29FA8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
                  {
                    v105 = v104;
                    v106 = [(HDCloudSyncSeizeAbandonedStoresOperation *)v190 store];
                    v107 = [v106 syncIdentity];
                    *(_DWORD *)v224 = 138543874;
                    *(void *)&v224[4] = self;
                    *(_WORD *)&v224[12] = 2114;
                    *(void *)&v224[14] = v107;
                    *(_WORD *)&v224[22] = 2114;
                    v225 = v86;
                    _os_log_impl(&dword_1BCB7D000, v105, OS_LOG_TYPE_DEFAULT, "%{public}@: TargetHasChildren: Child does not exist as store, seize both candidate target (%{public}@) & child (%{public}@) ", v224, 0x20u);
                  }
                }
                else
                {
                  v96 = [v79 objectForKeyedSubscript:v86];
                  int v97 = [v188 containsObject:v96];

                  _HKInitializeLogging();
                  v98 = (void *)*MEMORY[0x1E4F29FA8];
                  BOOL v99 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT);
                  if (!v97)
                  {
                    if (v99)
                    {
                      v117 = v98;
                      v118 = [(HDCloudSyncSeizeAbandonedStoresOperation *)v190 store];
                      v119 = [v118 syncIdentity];
                      *(_DWORD *)v224 = 138543874;
                      *(void *)&v224[4] = self;
                      *(_WORD *)&v224[12] = 2114;
                      *(void *)&v224[14] = v86;
                      *(_WORD *)&v224[22] = 2114;
                      v225 = v119;
                      _os_log_impl(&dword_1BCB7D000, v117, OS_LOG_TYPE_DEFAULT, "%{public}@: TargetHasChildren: Child (%{public}@) is not ready to be seized and not owned by another active target, cannot seize candidate target (%{public}@) or any if itschildren.", v224, 0x20u);
                    }
                    v120 = [v79 allValues];
                    [v186 addObjectsFromArray:v120];

                    [v186 addObject:v190];
                    goto LABEL_74;
                  }
                  if (v99)
                  {
                    v100 = v98;
                    v101 = [(HDCloudSyncSeizeAbandonedStoresOperation *)v190 store];
                    v102 = [v101 syncIdentity];
                    *(_DWORD *)v224 = 138543874;
                    *(void *)&v224[4] = self;
                    *(_WORD *)&v224[12] = 2114;
                    *(void *)&v224[14] = v102;
                    *(_WORD *)&v224[22] = 2114;
                    v225 = v86;
                    _os_log_impl(&dword_1BCB7D000, v100, OS_LOG_TYPE_DEFAULT, "%{public}@: TargetHasChildren: Child is also in seized targets, seize both candidate target (%{public}@) & child (%{public}@)", v224, 0x20u);
                  }
                  v103 = [v79 objectForKeyedSubscript:v86];
                  [v186 removeObject:v103];
                }
              }
              else
              {
                _HKInitializeLogging();
                v90 = (void *)*MEMORY[0x1E4F29FA8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
                {
                  v91 = v90;
                  v92 = [(HDCloudSyncSeizeAbandonedStoresOperation *)v190 store];
                  v93 = [v92 syncIdentity];
                  *(_DWORD *)v224 = 138543618;
                  *(void *)&v224[4] = self;
                  *(_WORD *)&v224[12] = 2114;
                  *(void *)&v224[14] = v93;
                  _os_log_impl(&dword_1BCB7D000, v91, OS_LOG_TYPE_DEFAULT, "%{public}@: TargetHasChildren: An active target also owns this child, candidate target (%{public}@) can continue being seized", v224, 0x16u);
                }
              }
            }
            uint64_t v83 = [v82 countByEnumeratingWithState:&v199 objects:&v213 count:16];
            if (v83) {
              continue;
            }
            break;
          }
        }
LABEL_74:
      }
LABEL_78:
      v57 = obja + 1;
    }
    while (obja + 1 != (char *)v179);
    uint64_t v179 = [v188 countByEnumeratingWithState:buf objects:&v220 count:16];
  }
  while (v179);
LABEL_80:

  v124 = (void *)[v188 mutableCopy];
  long long v197 = 0u;
  long long v198 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  id v125 = v186;
  uint64_t v126 = [v125 countByEnumeratingWithState:&v195 objects:&v209 count:16];
  if (v126)
  {
    uint64_t v127 = *(void *)v196;
    do
    {
      for (uint64_t k = 0; k != v126; ++k)
      {
        if (*(void *)v196 != v127) {
          objc_enumerationMutation(v125);
        }
        [v124 removeObject:*(void *)(*((void *)&v195 + 1) + 8 * k)];
      }
      uint64_t v126 = [v125 countByEnumeratingWithState:&v195 objects:&v209 count:16];
    }
    while (v126);
  }

  id v129 = v124;
  v130 = (void *)MEMORY[0x1E4F1CAD0];
  v131 = [(HDCloudSyncOperation *)self configuration];
  v132 = [v131 computedState];
  v133 = [v132 targets];
  v191 = [v130 setWithArray:v133];

  v134 = [MEMORY[0x1E4F1CAD0] setWithArray:v129];
  v135 = objc_msgSend(v191, "hk_minus:", v134);

  id v136 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v207 = 0u;
  long long v208 = 0u;
  long long v205 = 0u;
  long long v206 = 0u;
  id v137 = v135;
  uint64_t v138 = [v137 countByEnumeratingWithState:&v205 objects:v224 count:16];
  if (v138)
  {
    uint64_t v139 = *(void *)v206;
    do
    {
      for (uint64_t m = 0; m != v138; ++m)
      {
        if (*(void *)v206 != v139) {
          objc_enumerationMutation(v137);
        }
        v141 = *(void **)(*((void *)&v205 + 1) + 8 * m);
        v142 = [v141 storeRecord];
        v143 = [v142 syncIdentity];
        BOOL v144 = v143 == 0;

        if (!v144)
        {
          v145 = [v141 storeRecord];
          v146 = [v145 syncIdentity];
          [v136 addObject:v146];
        }
      }
      uint64_t v138 = [v137 countByEnumeratingWithState:&v205 objects:v224 count:16];
    }
    while (v138);
  }

  v203[0] = MEMORY[0x1E4F143A8];
  v203[1] = 3221225472;
  v203[2] = __88__HDCloudSyncSeizeAbandonedStoresOperation__removeTargetsBasedOnUnseizedSyncIdentities___block_invoke;
  v203[3] = &unk_1E62F4740;
  id v204 = v136;
  id v147 = v136;
  v148 = objc_msgSend(v129, "hk_filter:", v203);

  v149 = [(HDCloudSyncOperation *)self configuration];
  v150 = [v149 computedState];
  [v150 replaceTargets:v148];

LABEL_97:
  id v151 = v194;
  v180 = v151;
  if (v178)
  {
    long long v220 = 0u;
    long long v221 = 0u;
    long long v222 = 0u;
    long long v223 = 0u;
    v152 = [(HDCloudSyncOperation *)self configuration];
    v153 = [v152 repository];
    id objb = [v153 allCKContainers];

    uint64_t v192 = [objb countByEnumeratingWithState:&v220 objects:v224 count:16];
    if (v192)
    {
      uint64_t v154 = MEMORY[0x1E4F143A8];
      id v189 = *(id *)v221;
      do
      {
        for (uint64_t n = 0; n != v192; ++n)
        {
          if (*(id *)v221 != v189) {
            objc_enumerationMutation(objb);
          }
          id v156 = *(id *)(*((void *)&v220 + 1) + 8 * n);
          v157 = [(HDCloudSyncOperation *)self configuration];
          v158 = [v157 repository];
          v159 = [v158 cachedOwnerIdentifierForContainer:v156];
          v160 = [v159 string];

          v161 = [(HDCloudSyncOperation *)self configuration];
          v162 = [v161 repository];
          v163 = [v162 syncIdentityManager];
          v164 = [v163 currentSyncIdentity];
          v165 = [v164 identity];

          v166 = [(HDCloudSyncOperation *)self configuration];
          v167 = [v166 computedState];
          v168 = [v167 targets];
          *(void *)&long long v213 = v154;
          *((void *)&v213 + 1) = 3221225472;
          *(void *)&long long v214 = __77__HDCloudSyncSeizeAbandonedStoresOperation__updatedStoreRecordsForContainer___block_invoke;
          *((void *)&v214 + 1) = &unk_1E630F480;
          id v169 = v156;
          *(void *)&long long v215 = v169;
          *((void *)&v215 + 1) = v160;
          *(void *)&long long v216 = v165;
          id v170 = v165;
          id v171 = v160;
          v172 = objc_msgSend(v168, "hk_map:", &v213);

          if ([v172 count])
          {
            [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
            v173 = [HDCloudSyncModifyRecordsOperation alloc];
            v174 = [(HDCloudSyncOperation *)self configuration];
            v175 = [(HDCloudSyncModifyRecordsOperation *)v173 initWithConfiguration:v174 container:v169 recordsToSave:v172 recordIDsToDelete:0];

            *(void *)&long long v205 = v154;
            *((void *)&v205 + 1) = 3221225472;
            *(void *)&long long v206 = __78__HDCloudSyncSeizeAbandonedStoresOperation__markPendingOwnerForSeizureTargets__block_invoke;
            *((void *)&v206 + 1) = &unk_1E62F2950;
            *(void *)&long long v207 = self;
            [(HDCloudSyncOperation *)v175 setOnError:&v205];
            *(void *)&long long v209 = v154;
            *((void *)&v209 + 1) = 3221225472;
            *(void *)&long long v210 = __78__HDCloudSyncSeizeAbandonedStoresOperation__markPendingOwnerForSeizureTargets__block_invoke_297;
            *((void *)&v210 + 1) = &unk_1E62F46F8;
            *(void *)&long long v211 = self;
            *((void *)&v211 + 1) = v172;
            [(HDCloudSyncOperation *)v175 setOnSuccess:&v209];
            [(HDCloudSyncOperation *)v175 start];
          }
        }
        uint64_t v192 = [objb countByEnumeratingWithState:&v220 objects:v224 count:16];
      }
      while (v192);
    }

    [(HDSynchronousTaskGroup *)self->_taskGroup finishTask];
  }
  else
  {
    [(HDSynchronousTaskGroup *)self->_taskGroup failTaskWithError:v151];
  }
}

id __69__HDCloudSyncSeizeAbandonedStoresOperation__computeTargetsForSeizure__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 storeRecord];
  if (!v4 || [v3 purpose] != 1)
  {
    v17 = 0;
    goto LABEL_10;
  }
  v5 = [*(id *)(a1 + 32) configuration];
  char v6 = [v5 repository];
  v7 = [v3 container];
  v8 = [v6 cachedOwnerIdentifierForContainer:v7];

  v9 = [*(id *)(a1 + 32) configuration];
  v10 = [v9 repository];
  v11 = [v10 syncIdentityManager];
  double v12 = [v11 currentSyncIdentity];
  uint64_t v13 = [v12 identity];

  v14 = [v3 storeRecord];
  v15 = [v14 pendingOwner];
  v16 = [v8 string];
  v108 = (void *)v13;
  if (![v15 isEqualToString:v16])
  {
    id v18 = [v3 storeRecord];
    id v19 = [v18 pendingSyncIdentity];
    int v20 = [v19 isEqual:v13];

    if (v20) {
      goto LABEL_7;
    }
    v23 = [v4 record];
    id v24 = [v23 modificationDate];
    v25 = [*(id *)(a1 + 32) configuration];
    v26 = [v25 syncDate];
    [v24 timeIntervalSinceDate:v26];
    double v28 = fabs(v27);

    if (v28 < *(double *)(a1 + 40))
    {
      v17 = 0;
      goto LABEL_8;
    }
    v29 = [*(id *)(a1 + 32) configuration];
    v30 = [v29 syncDate];
    v31 = [v30 dateByAddingTimeInterval:-*(double *)(a1 + 40)];

    _HKInitializeLogging();
    BOOL v32 = (os_log_t *)MEMORY[0x1E4F29FA8];
    v33 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = *(void *)(a1 + 32);
      uint64_t v35 = v33;
      uint64_t v36 = [v4 storeIdentifier];
      v37 = [v4 record];
      uint64_t v38 = [v37 modificationDate];
      *(_DWORD *)buf = 138544130;
      uint64_t v113 = v34;
      BOOL v32 = (os_log_t *)MEMORY[0x1E4F29FA8];
      __int16 v114 = 2114;
      v115 = v36;
      __int16 v116 = 2114;
      v117 = v38;
      __int16 v118 = 2114;
      v119 = v31;
      _os_log_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ was abandoned. lastModifiedDate:(%{public}@), timeoutDateForOwnershipTransfer:(%{public}@)", buf, 0x2Au);
    }
    if ([v4 hasSequenceWithFutureProtocolVersion])
    {
      _HKInitializeLogging();
      v39 = *v32;
      if (!os_log_type_enabled(*v32, OS_LOG_TYPE_DEFAULT))
      {
LABEL_21:
        id v42 = 0;
        v17 = 0;
        v21 = v108;
LABEL_53:

        goto LABEL_9;
      }
      uint64_t v40 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v113 = v40;
      __int16 v114 = 2114;
      v115 = v4;
      id v41 = "%{public}@: store record: %{public}@ is abandoned, but is from the future and cannot be seized by this device.";
LABEL_20:
      _os_log_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_DEFAULT, v41, buf, 0x16u);
      goto LABEL_21;
    }
    v43 = [v4 currentSequenceHeaderRecord];
    if (v43)
    {
    }
    else
    {
      v44 = [v4 record];
      BOOL v45 = [v44 modificationDate];
      v46 = [*(id *)(a1 + 32) configuration];
      v47 = [v46 syncDate];
      [v45 timeIntervalSinceDate:v47];
      double v49 = fabs(v48);
      double v50 = *MEMORY[0x1E4F29620];

      if (v49 < v50)
      {
        _HKInitializeLogging();
        v39 = *v32;
        if (!os_log_type_enabled(*v32, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_21;
        }
        uint64_t v51 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v113 = v51;
        __int16 v114 = 2114;
        v115 = v4;
        id v41 = "%{public}@: store record: %{public}@ is abandoned, but it has no sequence records, so we don't know if we "
              "can safely seize it";
        goto LABEL_20;
      }
    }
    v104 = v31;
    v101 = [*(id *)(a1 + 32) configuration];
    v98 = [v101 repository];
    int v97 = [v98 profile];
    v105 = [v97 legacyRepositoryProfile];
    BOOL v95 = [v4 storeIdentifier];
    v96 = [*(id *)(a1 + 32) configuration];
    v52 = [v96 syncContainerPrefix];
    uint64_t v53 = [v4 ownerIdentifier];
    uint64_t v54 = [v4 syncIdentity];
    v55 = [v3 zoneIdentifier];
    v56 = [v55 containerIdentifier];
    id v111 = 0;
    v57 = (void *)v54;
    v58 = +[HDCloudSyncStore syncStoreForProfile:v105 storeIdentifier:v95 syncCircleName:v52 ownerIdentifier:v53 syncIdentity:v54 containerIdentifier:v56 error:&v111];
    id v100 = v111;

    if (v58)
    {
      id v110 = v100;
      v59 = [v58 receivedSyncAnchorMapWithError:&v110];
      id v42 = v110;

      v60 = -[HDCloudSyncSeizeAbandonedStoresOperation anchorMapForTakeoverForTarget:](*(void **)(a1 + 32), v3);
      int v61 = [v58 _syncAnchorMapByStrippingBlockedEntities:v60];

      if (v61 && (HDSyncAnchorMapIsSuperset(v61, v59) & 1) == 0)
      {
        v103 = v59;
        id v107 = v42;
        _HKInitializeLogging();
        v71 = (os_log_t *)MEMORY[0x1E4F29FA8];
        v72 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          v73 = v58;
          uint64_t v74 = *(void *)(a1 + 32);
          id v75 = v72;
          v76 = [v4 storeIdentifier];
          *(_DWORD *)buf = 138543874;
          uint64_t v113 = v74;
          v58 = v73;
          __int16 v114 = 2114;
          v115 = v76;
          __int16 v116 = 2114;
          v117 = v73;
          _os_log_impl(&dword_1BCB7D000, v75, OS_LOG_TYPE_DEFAULT, "%{public}@: store record: %{public}@ has been abandoned, but the local anchor map in the local store: %{public}@ is less than the received anchor map.", buf, 0x20u);
        }
        _HKInitializeLogging();
        v77 = *v71;
        if (os_log_type_enabled(*v71, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v78 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v113 = v78;
          __int16 v114 = 2114;
          v115 = v103;
          _os_log_impl(&dword_1BCB7D000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@: Local anchor map: %{public}@", buf, 0x16u);
        }
        _HKInitializeLogging();
        v79 = *v71;
        if (os_log_type_enabled(*v71, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v80 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v113 = v80;
          __int16 v114 = 2114;
          v115 = v61;
          _os_log_impl(&dword_1BCB7D000, v79, OS_LOG_TYPE_DEFAULT, "%{public}@: Received anchor map: %{public}@", buf, 0x16u);
        }

        v17 = 0;
        id v42 = v107;
        v21 = v108;
        v31 = v104;
        goto LABEL_52;
      }

      v21 = v108;
      v31 = v104;
      v62 = (os_log_t *)MEMORY[0x1E4F29FA8];
LABEL_49:

      _HKInitializeLogging();
      v93 = *v62;
      if (os_log_type_enabled(*v62, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v94 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v113 = v94;
        __int16 v114 = 2114;
        v115 = v4;
        _os_log_impl(&dword_1BCB7D000, v93, OS_LOG_TYPE_DEFAULT, "%{public}@: store record: %{public}@ has been abandoned, and will be seized.", buf, 0x16u);
      }
      v17 = [v3 targetByAddingOptions:2];
LABEL_52:

      goto LABEL_53;
    }
    BOOL v99 = [v4 storeIdentifier];
    v63 = [*(id *)(a1 + 32) configuration];
    int v64 = [v63 repository];
    v65 = [v64 profile];
    v66 = [v65 legacyRepositoryProfile];
    id v109 = v100;
    v67 = +[HDCloudSyncStoreEntity persistedStateForStoreUUID:v99 profile:v66 error:&v109];
    id v106 = v109;

    if (!v67)
    {
      _HKInitializeLogging();
      v81 = (void *)*MEMORY[0x1E4F29FA8];
      v31 = v104;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v82 = *(void *)(a1 + 32);
        uint64_t v83 = v81;
        uint64_t v84 = [v4 storeIdentifier];
        *(_DWORD *)buf = 138543618;
        uint64_t v113 = v82;
        __int16 v114 = 2114;
        v115 = v84;
        _os_log_impl(&dword_1BCB7D000, v83, OS_LOG_TYPE_DEFAULT, "%{public}@: store record: %{public}@ was not found locally", buf, 0x16u);
      }
      v17 = 0;
      id v42 = v106;
      v21 = v108;
      v58 = 0;
      goto LABEL_52;
    }
    [v67 ownerIdentifier];
    v69 = uint64_t v68 = v67;
    id v70 = [v4 ownerIdentifier];
    v21 = v108;
    v31 = v104;
    v62 = (os_log_t *)MEMORY[0x1E4F29FA8];
    v102 = v68;
    if (v69 == v70)
    {
      v85 = [v68 containerIdentifier];
      v86 = [v3 zoneIdentifier];
      v87 = [v86 containerIdentifier];

      BOOL v88 = v85 == v87;
      v21 = v108;
      if (v88)
      {
        v58 = 0;
        id v42 = v106;
LABEL_48:
        v59 = v102;
        goto LABEL_49;
      }
    }
    else
    {
    }
    _HKInitializeLogging();
    os_log_t v89 = *v62;
    id v42 = v106;
    if (os_log_type_enabled(*v62, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v90 = *(void *)(a1 + 32);
      v91 = v89;
      v92 = [v4 storeIdentifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v113 = v90;
      __int16 v114 = 2114;
      v115 = v92;
      _os_log_impl(&dword_1BCB7D000, v91, OS_LOG_TYPE_DEFAULT, "%{public}@: store record: %{public}@ is also present in another container. Seize this.", buf, 0x16u);

      v21 = v108;
    }
    v58 = 0;
    goto LABEL_48;
  }

LABEL_7:
  v17 = [v3 targetByAddingOptions:2];
LABEL_8:
  v21 = v108;
LABEL_9:

LABEL_10:

  return v17;
}

- (id)anchorMapForTakeoverForTarget:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = [v3 storeRecord];
    char v6 = [v5 shardPredicate];
    int v7 = [v6 type];

    if (v7 == 2)
    {
      v8 = [HDCloudSyncCachedZone alloc];
      v9 = [v4 zoneIdentifier];
      v10 = [a1 configuration];
      v11 = [v10 repository];
      double v12 = [a1 configuration];
      uint64_t v13 = [v12 accessibilityAssertion];
      id v14 = [(HDCloudSyncCachedZone *)v8 initForZoneIdentifier:v9 repository:v11 accessibilityAssertion:v13];

      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x3032000000;
      double v27 = __Block_byref_object_copy__213;
      double v28 = __Block_byref_object_dispose__213;
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v15 = objc_opt_class();
      id v23 = 0;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __74__HDCloudSyncSeizeAbandonedStoresOperation_anchorMapForTakeoverForTarget___block_invoke;
      v20[3] = &unk_1E62F5B50;
      id v21 = v4;
      v22 = &v24;
      [v14 recordsForClass:v15 epoch:0 error:&v23 enumerationHandler:v20];
      id v16 = v23;
      v17 = +[HDSyncAnchorMap syncAnchorMapWithDictionary:v25[5]];

      _Block_object_dispose(&v24, 8);
    }
    else
    {
      id v14 = [v4 storeRecord];
      id v18 = [v14 sequenceRecord];
      v17 = [v18 syncAnchorMap];
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

uint64_t __74__HDCloudSyncSeizeAbandonedStoresOperation_anchorMapForTakeoverForTarget___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 record];
  v5 = [*(id *)(a1 + 32) storeRecord];
  char v6 = [v5 sequenceRecord];
  BOOL v7 = +[HDCloudSyncChangeRecord isChangeRecord:v4 inSequence:v6];

  if (v7)
  {
    v8 = [v3 decodedSyncAnchorRangeMap];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__HDCloudSyncSeizeAbandonedStoresOperation_anchorMapForTakeoverForTarget___block_invoke_2;
    v10[3] = &unk_1E630B1B8;
    v10[4] = *(void *)(a1 + 40);
    [v8 enumerateAnchorRangesAndEntityIdentifiersWithBlock:v10];
  }
  return 1;
}

void __74__HDCloudSyncSeizeAbandonedStoresOperation_anchorMapForTakeoverForTarget___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  char v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v7 = a2;
  v8 = [v6 objectForKeyedSubscript:v7];
  uint64_t v9 = [v8 integerValue];

  if (a4 <= v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = a4;
  }
  v11 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v12 = [NSNumber numberWithLongLong:v10];
  [v11 setObject:v12 forKey:v7];
}

uint64_t __88__HDCloudSyncSeizeAbandonedStoresOperation__removeTargetsBasedOnUnseizedSyncIdentities___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 storeRecord];
  v4 = [v3 syncIdentity];
  LODWORD(v2) = [v2 containsObject:v4];

  return v2 ^ 1;
}

uint64_t __76__HDCloudSyncSeizeAbandonedStoresOperation__computeAllActiveTargetsByChild___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

BOOL __74__HDCloudSyncSeizeAbandonedStoresOperation__childSyncIdentitiesWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 profile];
  v8 = [v7 syncIdentityManager];
  id v18 = 0;
  uint64_t v9 = [v8 childIdentitiesForCurrentSyncIdentityWithTransaction:v6 error:&v18];

  id v10 = v18;
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v9;

  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v13)
  {
    _HKInitializeLogging();
    id v14 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v17;
      __int16 v21 = 2114;
      id v22 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to read child sync identities: %{public}@", buf, 0x16u);
    }
    id v15 = v10;
    if (v15)
    {
      if (a3) {
        *a3 = v15;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v13 != 0;
}

void __80__HDCloudSyncSeizeAbandonedStoresOperation__childTargetBySyncIdentityForParent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  v5 = a3;
  id v6 = [*(id *)(a1 + 32) storeRecord];
  id v7 = [v6 sequenceRecord];
  v8 = [v7 includedChildSyncIdentities];
  uint64_t v9 = [v14 storeRecord];
  id v10 = [v9 syncIdentity];
  int v11 = [v8 containsObject:v10];

  if (v11)
  {
    id v12 = [v14 storeRecord];
    uint64_t v13 = [v12 syncIdentity];
    v5[2](v5, v13, v14);
  }
}

id __77__HDCloudSyncSeizeAbandonedStoresOperation__updatedStoreRecordsForContainer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 container];
  v5 = [v4 containerIdentifier];
  id v6 = [*(id *)(a1 + 32) containerIdentifier];
  int v7 = [v5 isEqualToString:v6];

  if (!v7) {
    goto LABEL_5;
  }
  if (([v3 options] & 2) == 0) {
    goto LABEL_5;
  }
  v8 = [v3 storeRecord];
  uint64_t v9 = [v8 pendingOwner];
  char v10 = [v9 isEqualToString:*(void *)(a1 + 40)];

  if (v10) {
    goto LABEL_5;
  }
  int v11 = [v3 storeRecord];
  id v12 = [v11 pendingSyncIdentity];
  char v13 = [v12 isEqual:*(void *)(a1 + 48)];

  if ((v13 & 1) == 0)
  {
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = [v3 storeRecord];
    [v17 setPendingOwner:v16];

    uint64_t v18 = *(void *)(a1 + 48);
    id v19 = [v3 storeRecord];
    [v19 setPendingSyncIdentity:v18];

    uint64_t v20 = [v3 storeRecord];
    id v14 = [v20 record];
  }
  else
  {
LABEL_5:
    id v14 = 0;
  }

  return v14;
}

void __78__HDCloudSyncSeizeAbandonedStoresOperation__markPendingOwnerForSeizureTargets__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to mark pending owner for store records: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 32) finishWithSuccess:0 error:v4];
}

uint64_t __78__HDCloudSyncSeizeAbandonedStoresOperation__markPendingOwnerForSeizureTargets__block_invoke_297(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    v5 = v2;
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = [v3 count];
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Marked pending owner in %ld store records.", (uint8_t *)&v7, 0x16u);
  }
  return [*(id *)(*(void *)(a1 + 32) + 104) finishTask];
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
}

- (void).cxx_destruct
{
}

@end