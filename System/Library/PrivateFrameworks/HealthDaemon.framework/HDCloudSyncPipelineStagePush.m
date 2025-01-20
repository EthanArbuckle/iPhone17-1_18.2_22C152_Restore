@interface HDCloudSyncPipelineStagePush
+ (id)operationTagDependencies;
- (HDCloudSyncPipelineStagePush)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (void)main;
@end

@implementation HDCloudSyncPipelineStagePush

+ (id)operationTagDependencies
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = 0x1F1764B60;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (HDCloudSyncPipelineStagePush)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HDCloudSyncPipelineStagePush;
  v4 = [(HDCloudSyncPipelineStage *)&v7 initWithConfiguration:a3 cloudState:a4];
  v5 = v4;
  if (v4) {
    [(HDCloudSyncPipelineStage *)v4 setExpectedSendSize:2];
  }
  return v5;
}

- (void)main
{
  uint64_t v286 = *MEMORY[0x1E4F143B8];
  v2 = [(HDCloudSyncOperation *)self configuration];
  v3 = [v2 context];
  char v4 = [v3 options];

  if ((v4 & 4) != 0)
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = self;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping due to pipeline options.", buf, 0xCu);
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
    return;
  }
  v5 = [(HDCloudSyncOperation *)self configuration];
  v6 = [v5 repository];
  objc_super v7 = [v6 profile];
  v8 = [v7 legacyRepositoryProfile];
  id v257 = 0;
  int v9 = HDUpgradedToSyncIdentity(v8, (uint64_t)&v257);
  id v10 = v257;

  if (v10)
  {
    [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v10];
    goto LABEL_137;
  }
  if (v9)
  {
    v12 = [(HDCloudSyncOperation *)self profile];
    v13 = [v12 syncIdentityManager];
    v14 = [v13 currentSyncIdentity];
    v15 = [v14 identity];
    currentSyncIdentity = self->_currentSyncIdentity;
    self->_currentSyncIdentity = v15;

    v17 = self;
    BOOL v241 = self == 0;
  }
  else
  {
    v17 = self;
    if (!self)
    {
      id v256 = 0;
      v243 = 0;
LABEL_139:
      v250 = 0;
      goto LABEL_133;
    }
    BOOL v241 = 0;
  }
  v18 = [(HDCloudSyncOperation *)v17 configuration];
  v19 = [v18 computedState];
  v20 = [v19 pushTargets];
  v21 = objc_msgSend(v20, "hk_map:", &__block_literal_global_330);

  id v248 = v21;
  v22 = [(HDCloudSyncOperation *)self configuration];
  v23 = [v22 repository];
  v24 = [v23 primaryCKContainer];

  v25 = [(HDCloudSyncOperation *)self configuration];
  v26 = [v25 repository];
  v27 = [v26 cachedOwnerIdentifierForContainer:v24];
  obuint64_t j = [v27 string];

  v28 = [(HDCloudSyncOperation *)self profile];
  v29 = [(HDCloudSyncOperation *)self configuration];
  v30 = [v29 syncDate];
  v31 = [(HDCloudSyncOperation *)self configuration];
  v32 = [v31 syncContainerPrefix];
  v33 = [v24 containerIdentifier];
  v34 = self->_currentSyncIdentity;
  *(void *)&long long v282 = 0;
  v35 = +[HDCloudSyncStore createOrUpdateShardStoresForProfile:v28 throughDate:v30 syncCircleName:v32 ownerIdentifier:obj containerIdentifier:v33 syncIdentity:v34 error:&v282];
  id v36 = (id)v282;

  if (v35)
  {
    if ([v35 count])
    {
      v37 = objc_msgSend(v248, "hk_mapToSet:", &__block_literal_global_328);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __66__HDCloudSyncPipelineStagePush__pushStoresByAddingShardsToStores___block_invoke_2;
      v280 = &unk_1E62F4868;
      v281[0] = v37;
      id v38 = v37;
      v39 = objc_msgSend(v35, "hk_filter:", buf);
      id v40 = [v248 arrayByAddingObjectsFromArray:v39];

      goto LABEL_17;
    }
  }
  else
  {
    _HKInitializeLogging();
    v41 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v36;
      _os_log_error_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_ERROR, "Failed to lookup look up shards during push store computation: %{public}@", buf, 0xCu);
    }
  }
  id v40 = v248;
LABEL_17:

  if ([v40 count])
  {
    id v42 = v40;
  }
  else
  {
    v43 = [(HDCloudSyncOperation *)self configuration];
    v44 = [(HDCloudSyncOperation *)self configuration];
    v45 = [v44 repository];
    v46 = [v45 primaryCKContainer];
    *(void *)&long long v282 = 0;
    v47 = [v43 pushStoresForContainer:v46 error:&v282];
    id v48 = (id)v282;
    v49 = [v47 firstObject];
    v50 = [v49 storeIdentifier];

    if (v50)
    {
      id v51 = v50;
    }
    else
    {
      if (v48)
      {
        _HKInitializeLogging();
        v52 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v48;
          _os_log_error_impl(&dword_1BCB7D000, v52, OS_LOG_TYPE_ERROR, "Failed to compute sync store identifier: %{public}@", buf, 0xCu);
        }
      }
      id v51 = [MEMORY[0x1E4F29128] UUID];
    }
    v53 = v51;

    v54 = [(HDCloudSyncOperation *)self configuration];
    v55 = [(HDCloudSyncOperation *)self configuration];
    v56 = [v55 repository];
    v57 = [v56 primaryCKContainer];
    *(void *)v276 = 0;
    v58 = [v54 pushStoreWithIdentifier:v53 container:v57 error:v276];
    id v59 = *(id *)v276;

    if (v58)
    {
      v273[0] = v58;
      id v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v273 count:1];
    }
    else
    {
      _HKInitializeLogging();
      v60 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v53;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v59;
        _os_log_error_impl(&dword_1BCB7D000, v60, OS_LOG_TYPE_ERROR, "Failed to create sync store with ID: %{public}@ error:%{public}@", buf, 0x16u);
      }
      id v42 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  id v256 = 0;
  id v61 = v42;
  v243 = v61;
  if (v241) {
    goto LABEL_139;
  }
  v242 = objc_msgSend(v61, "hk_firstObjectPassingTest:", &__block_literal_global_295);
  v238 = objc_msgSend(v243, "hk_filter:", &__block_literal_global_297);
  if (!v242)
  {
    _HKInitializeLogging();
    v110 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = self;
      _os_log_impl(&dword_1BCB7D000, v110, OS_LOG_TYPE_DEFAULT, "%{public}@: Full sync required; no staging store found",
        buf,
        0xCu);
    }
    v240 = 0;
    uint64_t v236 = 1;
    goto LABEL_65;
  }
  id v249 = v242;
  id v62 = v243;
  v63 = [(HDCloudSyncOperation *)self configuration];
  v64 = [v63 computedState];
  v65 = [v64 pushTargets];
  BOOL v66 = [v65 count] == 0;

  if (v66)
  {
    _HKInitializeLogging();
    v111 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v276 = 138543362;
      *(void *)&v276[4] = self;
      _os_log_impl(&dword_1BCB7D000, v111, OS_LOG_TYPE_DEFAULT, "%{public}@: Full sync required; no push targets found",
        v276,
        0xCu);
    }
    uint64_t v112 = 2;
    goto LABEL_62;
  }
  v67 = [(HDCloudSyncOperation *)self configuration];
  v68 = [v67 context];
  BOOL v69 = ([v68 options] & 8) == 0;

  if (!v69)
  {
    uint64_t v112 = 3;
LABEL_62:
    uint64_t v236 = v112;

    v240 = 0;
    goto LABEL_63;
  }
  long long v284 = 0u;
  long long v285 = 0u;
  long long v282 = 0u;
  long long v283 = 0u;
  id obja = v62;
  uint64_t v70 = [obja countByEnumeratingWithState:&v282 objects:buf count:16];
  if (!v70) {
    goto LABEL_48;
  }
  uint64_t v71 = *(void *)v283;
  while (2)
  {
    for (uint64_t i = 0; i != v70; ++i)
    {
      if (*(void *)v283 != v71) {
        objc_enumerationMutation(obja);
      }
      v73 = *(void **)(*((void *)&v282 + 1) + 8 * i);
      v74 = [v73 persistedStateWithError:&v256];
      v75 = v74;
      if (!v74)
      {
        uint64_t v236 = 0;
        id v211 = 0;
        uint64_t v105 = 0;
        goto LABEL_122;
      }
      v76 = [v74 rebaseDeadline];
      BOOL v77 = v76 == 0;

      if (!v77)
      {
        v78 = [v75 rebaseDeadline];
        v79 = [(HDCloudSyncOperation *)self configuration];
        v80 = [v79 syncDate];
        [v78 timeIntervalSinceDate:v80];
        double v82 = v81;

        if (v82 < *MEMORY[0x1E4F2BD00])
        {
          _HKInitializeLogging();
          v216 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            v217 = v216;
            v218 = [v75 rebaseDeadline];
            uint64_t v219 = *MEMORY[0x1E4F2BD00];
            *(_DWORD *)v276 = 138544386;
            *(void *)&v276[4] = self;
            *(_WORD *)&v276[12] = 2114;
            *(void *)&v276[14] = v73;
            *(_WORD *)&v276[22] = 2114;
            v277 = v218;
            *(_WORD *)v278 = 2048;
            *(void *)&v278[2] = v219;
            *(_WORD *)&v278[10] = 2048;
            *(double *)&v278[12] = v82;
            _os_log_impl(&dword_1BCB7D000, v217, OS_LOG_TYPE_DEFAULT, "%{public}@: Full sync required; %{public}@ near rebase deadline of %{public}@ (trigger threshold is %0.1lf"
              "s, remaining interval is %0.1lfs)",
              v276,
              0x34u);
          }
          v220 = [v73 storeIdentifier];
          v221 = [v249 storeIdentifier];
          char v222 = [v220 isEqual:v221];

          if (v222)
          {
            uint64_t v236 = 0;
            id v211 = 0;
            goto LABEL_121;
          }
          uint64_t v215 = 4;
LABEL_120:
          uint64_t v236 = v215;
          v223 = [v73 shardPredicate];
          id v211 = [v223 description];

LABEL_121:
          uint64_t v105 = 1;
LABEL_122:

          v224 = obja;
          goto LABEL_128;
        }
      }
      v83 = [v73 storeIdentifier];
      v84 = [v249 storeIdentifier];
      char v85 = [v83 isEqual:v84];

      if ((v85 & 1) == 0)
      {
        v86 = [v75 lastSyncDate];
        if (!v86) {
          goto LABEL_110;
        }
        v87 = [v75 lastSyncDate];
        v88 = [(HDCloudSyncOperation *)self configuration];
        v89 = [v88 syncDate];
        [v87 timeIntervalSinceDate:v89];
        BOOL v91 = v90 < -1814400.0;

        if (v91)
        {
LABEL_110:
          _HKInitializeLogging();
          v212 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            v213 = v212;
            v214 = [v75 lastSyncDate];
            *(_DWORD *)v276 = 138544130;
            *(void *)&v276[4] = self;
            *(_WORD *)&v276[12] = 2114;
            *(void *)&v276[14] = v73;
            *(_WORD *)&v276[22] = 2114;
            v277 = v214;
            *(_WORD *)v278 = 2114;
            *(void *)&v278[2] = v73;
            _os_log_impl(&dword_1BCB7D000, v213, OS_LOG_TYPE_DEFAULT, "%{public}@: Full sync required; %{public}@ last sync date (%{public}@) is too old for %{public}@",
              v276,
              0x2Au);
          }
          uint64_t v215 = 5;
          goto LABEL_120;
        }
      }
    }
    uint64_t v70 = [obja countByEnumeratingWithState:&v282 objects:buf count:16];
    if (v70) {
      continue;
    }
    break;
  }
LABEL_48:

  v92 = [(HDCloudSyncOperation *)self configuration];
  v93 = [v92 computedState];
  v94 = [v93 pushTargets];
  v266[0] = MEMORY[0x1E4F143A8];
  v266[1] = 3221225472;
  v266[2] = __107__HDCloudSyncPipelineStagePush__requiresFullSyncWithStagingStore_pushStores_reason_shardResponsible_error___block_invoke;
  v266[3] = &unk_1E62F4740;
  id v239 = v249;
  id v267 = v239;
  v95 = objc_msgSend(v94, "hk_firstObjectPassingTest:", v266);

  if (!v95)
  {
    uint64_t v236 = 0;
    goto LABEL_126;
  }
  v96 = [(HDCloudSyncOperation *)self configuration];
  v97 = [v96 cachedCloudState];
  v98 = [v95 storeRecord];
  v99 = [v98 recordID];
  v100 = [(HDCloudSyncOperation *)self configuration];
  v101 = [v100 repository];
  v102 = [v101 primaryCKContainer];
  v103 = [v102 containerIdentifier];
  v104 = [v97 zoneForRecordID:v99 containerIdentifier:v103 error:&v256];

  if (v104)
  {
    *(void *)v276 = 0;
    *(void *)&v276[8] = v276;
    *(void *)&v276[16] = 0x2020000000;
    v277 = 0;
    uint64_t v105 = objc_opt_class();
    v273[0] = MEMORY[0x1E4F143A8];
    v273[1] = 3221225472;
    v273[2] = __107__HDCloudSyncPipelineStagePush__requiresFullSyncWithStagingStore_pushStores_reason_shardResponsible_error___block_invoke_2;
    v273[3] = &unk_1E62F4768;
    id v274 = v239;
    v275 = v276;
    v106 = [v104 recordsForClass:v105 error:&v256 filter:v273];
    if (v106)
    {
      if (*(uint64_t *)(*(void *)&v276[8] + 24) < 400)
      {
        uint64_t v236 = 0;
        int v109 = 1;
      }
      else
      {
        _HKInitializeLogging();
        v107 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v108 = *(void *)(*(void *)&v276[8] + 24);
          *(_DWORD *)v269 = 138543618;
          v270 = self;
          __int16 v271 = 2048;
          uint64_t v272 = v108;
          _os_log_impl(&dword_1BCB7D000, v107, OS_LOG_TYPE_DEFAULT, "%{public}@: Full sync required; staging store has too many change records (%ld)",
            v269,
            0x16u);
        }
        int v109 = 0;
        uint64_t v105 = 1;
        uint64_t v236 = 6;
      }
    }
    else
    {
      uint64_t v236 = 0;
      int v109 = 0;
      uint64_t v105 = 0;
    }

    _Block_object_dispose(v276, 8);
    if (v109) {
LABEL_126:
    }
      uint64_t v105 = 2;
  }
  else
  {
    uint64_t v236 = 0;
    uint64_t v105 = 0;
  }

  id v211 = 0;
  v224 = v267;
LABEL_128:

  v240 = (__CFString *)v211;
  if (!v105) {
    goto LABEL_131;
  }
  if (v105 == 1)
  {
LABEL_63:
    v113 = [v249 persistedStateWithError:&v256];
    v114 = v113;
    if (v113)
    {
      v115 = [v113 stateByRequiringUrgentRebase];
      int v116 = [v249 persistState:v115 error:&v256];

      if (v116)
      {
LABEL_65:
        id v117 = v238;
        int v235 = 1;
        goto LABEL_66;
      }
    }
LABEL_131:
    v250 = 0;
    goto LABEL_132;
  }
  id v268 = v249;
  id v117 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v268 count:1];
  int v235 = 0;
LABEL_66:
  id v237 = v117;
  v118 = [HDCloudSyncCompoundOperation alloc];
  v119 = [(HDCloudSyncOperation *)self configuration];
  v250 = [(HDCloudSyncCompoundOperation *)v118 initWithConfiguration:v119 cloudState:0 name:@"Push Stores" continueOnSubOperationError:1];

  v120 = [(HDCloudSyncOperation *)self configuration];
  v121 = [v120 context];
  BOOL v122 = ([v121 options] & 0x80) == 0;

  if (v122) {
    [(HDCloudSyncCompoundOperation *)v250 addOperationOfClass:objc_opt_class() transitionHandler:0];
  }
  id objb = [v237 sortedArrayUsingComparator:&__block_literal_global_12];
  long long v284 = 0u;
  long long v285 = 0u;
  long long v282 = 0u;
  long long v283 = 0u;
  uint64_t v123 = [objb countByEnumeratingWithState:&v282 objects:buf count:16];
  if (v123)
  {
    uint64_t v124 = *(void *)v283;
    do
    {
      for (uint64_t j = 0; j != v123; ++j)
      {
        if (*(void *)v283 != v124) {
          objc_enumerationMutation(objb);
        }
        id v126 = *(id *)(*((void *)&v282 + 1) + 8 * j);
        v127 = [HDCloudSyncCompoundOperation alloc];
        v128 = [(HDCloudSyncOperation *)self configuration];
        v129 = [(HDCloudSyncCompoundOperation *)v127 initWithConfiguration:v128 cloudState:0 name:@"Prepare & Push" continueOnSubOperationError:0];

        v130 = [HDCloudSyncPreparePushZoneForStoreOperation alloc];
        v131 = [(HDCloudSyncOperation *)self configuration];
        v132 = [(HDCloudSyncPreparePushZoneForStoreOperation *)v130 initWithConfiguration:v131 cloudState:0 store:v126];

        [(HDCloudSyncCompoundOperation *)v129 addOperation:v132 transitionHandler:0];
        v133 = [HDCloudSyncPushStoreOperation alloc];
        v134 = [(HDCloudSyncOperation *)self configuration];
        v135 = [(HDCloudSyncOperation *)self cloudState];
        v136 = [(HDCloudSyncPushStoreOperation *)v133 initWithConfiguration:v134 cloudState:v135 target:0];

        *(void *)v276 = MEMORY[0x1E4F143A8];
        *(void *)&v276[8] = 3221225472;
        *(void *)&v276[16] = __56__HDCloudSyncPipelineStagePush__pushOperationWithStore___block_invoke;
        v277 = &unk_1E62F4820;
        *(void *)v278 = v136;
        *(void *)&v278[8] = v132;
        v137 = v132;
        v138 = v136;
        [(HDCloudSyncCompoundOperation *)v129 addOperation:v138 transitionHandler:v276];

        [(HDCloudSyncCompoundOperation *)v250 addOperation:v129 transitionHandler:0];
      }
      uint64_t v123 = [objb countByEnumeratingWithState:&v282 objects:buf count:16];
    }
    while (v123);
  }

  v139 = [(HDCloudSyncOperation *)self configuration];
  v140 = [v139 repository];
  v141 = [v140 profile];
  v142 = [v141 cloudSyncManager];
  if ([v142 supportsRebase])
  {
    v143 = [(HDCloudSyncOperation *)self configuration];
    v144 = [v143 context];
    BOOL v145 = ([v144 options] & 0x40) == 0;

    if (v145)
    {
      v139 = [(HDCloudSyncOperation *)self configuration];
      v140 = [v139 computedState];
      v141 = [v140 pushTargets];
      objc_msgSend(v141, "hk_map:", &__block_literal_global_292);
      id objc = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_79;
    }
    id objc = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {

    id objc = (id)MEMORY[0x1E4F1CBF0];
LABEL_79:
  }
  if (v235)
  {
    v146 = [(HDCloudSyncOperation *)self configuration];
    v147 = [v146 computedState];
    uint64_t v148 = [v147 pushTargets];
    v264[0] = MEMORY[0x1E4F143A8];
    v264[1] = 3221225472;
    v264[2] = __83__HDCloudSyncPipelineStagePush__computePushAndCleanupOperationForPushStores_error___block_invoke_298;
    v264[3] = &unk_1E62F4740;
    id v265 = v242;
    v149 = objc_msgSend((id)v148, "hk_firstObjectPassingTest:", v264);

    v150 = [v149 storeRecord];
    LOBYTE(v148) = v150 == 0;

    if ((v148 & 1) == 0)
    {
      v151 = [v149 storeRecord];
      uint64_t v152 = [objc arrayByAddingObject:v151];

      id objc = (id)v152;
    }
  }
  if ([objc count])
  {
    v153 = [HDCloudSyncDeleteStoresOperation alloc];
    v154 = [(HDCloudSyncOperation *)self configuration];
    v155 = [(HDCloudSyncOperation *)self cloudState];
    v156 = [(HDCloudSyncDeleteStoresOperation *)v153 initWithConfiguration:v154 cloudState:v155 storeRecordsToDelete:objc];
    v262[0] = MEMORY[0x1E4F143A8];
    v262[1] = 3221225472;
    v262[2] = __83__HDCloudSyncPipelineStagePush__computePushAndCleanupOperationForPushStores_error___block_invoke_2_300;
    v262[3] = &unk_1E62F47D0;
    v157 = v250;
    v263 = v157;
    v158 = [(HDCloudSyncOperation *)v156 operationWithRunCondition:v262];

    [(HDCloudSyncCompoundOperation *)v157 addOperation:v158 transitionHandler:0];
  }
  char v159 = v235 ^ 1;
  if (!v242) {
    char v159 = 1;
  }
  if ((v159 & 1) == 0)
  {
    v160 = [HDCloudSyncBlockOperation alloc];
    v161 = [(HDCloudSyncOperation *)self configuration];
    v162 = [(HDCloudSyncOperation *)self cloudState];
    v260[0] = MEMORY[0x1E4F143A8];
    v260[1] = 3221225472;
    v260[2] = __83__HDCloudSyncPipelineStagePush__computePushAndCleanupOperationForPushStores_error___block_invoke_3;
    v260[3] = &unk_1E62F47F8;
    id v261 = v242;
    v163 = [(HDCloudSyncBlockOperation *)v160 initWithConfiguration:v161 cloudState:v162 synchronousBlock:v260];
    v258[0] = MEMORY[0x1E4F143A8];
    v258[1] = 3221225472;
    v258[2] = __83__HDCloudSyncPipelineStagePush__computePushAndCleanupOperationForPushStores_error___block_invoke_4;
    v258[3] = &unk_1E62F47D0;
    v164 = v250;
    v259 = v164;
    v165 = [(HDCloudSyncOperation *)v163 operationWithRunCondition:v258];

    [(HDCloudSyncCompoundOperation *)v164 addOperation:v165 transitionHandler:0];
  }
  v240 = v240;
  v166 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v166 doubleForKey:@"HDCloudSyncFullSyncStartTime"];
  double v168 = v167;

  v169 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_msgSend(v169, "doubleForKey:");
  double v171 = v170;

  v172 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v234 = [v172 integerForKey:@"HDCloudSyncFullSyncNumberOfRuns"];

  v173 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v174 = objc_msgSend(v173, "dictionaryForKey:");

  double Current = CFAbsoluteTimeGetCurrent();
  if (v174)
  {
    _HKInitializeLogging();
    v176 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      v177 = v176;
      v178 = [v174 objectForKeyedSubscript:@"fullSyncReason"];
      v179 = [NSNumber numberWithDouble:v168];
      v180 = [NSNumber numberWithDouble:v171];
      v181 = [NSNumber numberWithLongLong:v234];
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = v178;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v179;
      *(_WORD *)&buf[22] = 2112;
      v280 = v180;
      LOWORD(v281[0]) = 2112;
      *(id *)((char *)v281 + 2) = v181;
      _os_log_impl(&dword_1BCB7D000, v177, OS_LOG_TYPE_DEFAULT, "Ongoing Full Sync started with reason: %@, startTime: %@, actively spent time: %@, number of runs completed %@  ", buf, 0x2Au);
    }
    if (v236)
    {
      v182 = [v174 objectForKeyedSubscript:@"fullSyncReason"];
      v183 = HKCloudSyncFullSyncReasonToString();
      BOOL v184 = v182 == v183;

      if (!v184)
      {
        _HKInitializeLogging();
        v185 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          v186 = v185;
          v187 = HKCloudSyncFullSyncReasonToString();
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v187;
          _os_log_impl(&dword_1BCB7D000, v186, OS_LOG_TYPE_DEFAULT, "Full Sync was ongoing, but restarted with new reason: %@", buf, 0xCu);
        }
        v188 = [(HDCloudSyncOperation *)self configuration];
        v189 = [v188 repository];
        v190 = [v189 profile];
        v191 = [v190 daemon];
        v192 = [v191 analyticsSubmissionCoordinator];

        v193 = [v174 objectForKeyedSubscript:@"fullSyncReason"];
        v194 = [v174 objectForKeyedSubscript:@"shardResponsible"];
        v195 = [v174 objectForKeyedSubscript:@"daysSincePreviousFullSync"];
        v196 = [NSNumber numberWithLongLong:v234];
        objc_msgSend(v192, "cloudSync_reportFullSyncMetricsWithReason:shard:daysSincePreviousFullSync:totalDuration:activeDuration:numberOfRuns:incomplete:", v193, v194, v195, v196, 1, Current - v168, v171);
      }
LABEL_100:
      v197 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v197 setDouble:@"HDCloudSyncFullSyncRunStartTime" forKey:Current];

      v198 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v198 doubleForKey:@"HDCloudSyncFullSyncStartTime"];
      double v200 = v199;

      if (v200 <= 0.0) {
        unint64_t v201 = -1;
      }
      else {
        unint64_t v201 = llround((Current - v200) / 86400.0);
      }
      *(void *)&long long v282 = @"fullSyncReason";
      uint64_t v202 = HKCloudSyncFullSyncReasonToString();
      v203 = (void *)v202;
      v204 = @"none";
      if (v240) {
        v204 = v240;
      }
      *(void *)buf = v202;
      *(void *)&buf[8] = v204;
      *((void *)&v282 + 1) = @"shardResponsible";
      *(void *)&long long v283 = @"daysSincePreviousFullSync";
      v205 = [NSNumber numberWithInteger:v201];
      *(void *)&buf[16] = v205;
      uint64_t v206 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v282 count:3];

      v207 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v207 setDouble:@"HDCloudSyncFullSyncStartTime" forKey:Current];

      v208 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v208 setInteger:0 forKey:@"HDCloudSyncFullSyncNumberOfRuns"];

      v209 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v209 setDouble:@"HDCloudSyncFullSyncActiveDuration" forKey:0.0];

      v210 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v210 setObject:v206 forKey:@"HDCloudSyncFullSyncOngoing"];
      v174 = (void *)v206;
    }
    else
    {
      v210 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v210 setDouble:@"HDCloudSyncFullSyncRunStartTime" forKey:Current];
    }
  }
  else if (v236)
  {
    goto LABEL_100;
  }

LABEL_132:
LABEL_133:

  id v10 = v256;
  if (v250)
  {
    v225 = [(HDCloudSyncOperation *)self configuration];
    v226 = [v225 repository];
    v227 = [v226 profile];
    v228 = [v227 legacyRepositoryProfile];
    HDUpdateOldestSampleStartDateForProfile(v228);

    v253[0] = MEMORY[0x1E4F143A8];
    v253[1] = 3221225472;
    v253[2] = __36__HDCloudSyncPipelineStagePush_main__block_invoke;
    v253[3] = &unk_1E62F46F8;
    id v254 = v243;
    v255 = self;
    [(HDCloudSyncOperation *)v250 setOnSuccess:v253];
    v252[0] = MEMORY[0x1E4F143A8];
    v252[1] = 3221225472;
    v252[2] = __36__HDCloudSyncPipelineStagePush_main__block_invoke_279;
    v252[3] = &unk_1E62F2950;
    v252[4] = self;
    [(HDCloudSyncOperation *)v250 setOnError:v252];
    v229 = [(HDCloudSyncOperation *)v250 progress];
    uint64_t v230 = [v229 totalUnitCount];

    v231 = [(HDCloudSyncOperation *)self progress];
    objc_msgSend(v231, "setTotalUnitCount:", objc_msgSend(v231, "totalUnitCount") + v230);

    v232 = [(HDCloudSyncOperation *)self progress];
    v233 = [(HDCloudSyncOperation *)v250 progress];
    [v232 addChild:v233 withPendingUnitCount:v230];

    [(HDCloudSyncCompoundOperation *)v250 start];
  }
  else
  {
    [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v10];
  }

LABEL_137:
}

void __36__HDCloudSyncPipelineStagePush_main__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [*(id *)(a1 + 40) configuration];
  char v4 = [v3 repository];
  v5 = [v4 profile];
  v6 = [v5 legacyRepositoryProfile];
  id v87 = 0;
  BOOL v7 = +[HDCloudSyncStoreEntity resetLastSyncDateExcludingStores:v2 profile:v6 error:&v87];
  v8 = (__CFString *)v87;

  int v9 = (os_log_t *)MEMORY[0x1E4F29FA8];
  if (!v7)
  {
    _HKInitializeLogging();
    id v10 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      v76 = *(void **)(v1 + 40);
      *(_DWORD *)buf = 138543618;
      id v93 = v76;
      __int16 v94 = 2114;
      v95 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to reset last sync dates, %{public}@", buf, 0x16u);
    }
  }
  v11 = *(void **)(v1 + 40);
  if (v11)
  {
    v12 = [*(id *)(v1 + 40) configuration];
    v13 = [v12 syncDate];

    v14 = [v11 configuration];
    v15 = [v14 repository];

    v16 = [v15 profile];
    v17 = [v16 legacyRepositoryProfile];

    v86 = HDCloudSyncKeyValueDomainWithProfile(v17);
    v18 = [v15 primaryCKContainer];
    v19 = [v18 containerIdentifier];
    char v85 = HDCloudSyncLastSuccessfulPushKeyForContainerIdentifier((uint64_t)v19);

    v83 = v15;
    v20 = [v15 primaryCKContainer];
    v21 = [v20 containerIdentifier];
    v84 = HDCloudSyncLastSuccessfulLitePushKeyForContainerIdentifier((uint64_t)v21);

    v22 = [v11 configuration];
    v23 = [v22 context];
    char v24 = [v23 options];

    _HKInitializeLogging();
    v25 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v26 = @"lite ";
      if ((v24 & 0x80) == 0) {
        v26 = &stru_1F1728D60;
      }
      *(_DWORD *)buf = 138543618;
      id v93 = v11;
      __int16 v94 = 2114;
      v95 = v26;
      _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Recording successful cloud sync %{public}@push", buf, 0x16u);
    }
    if (v24 < 0) {
      v27 = v84;
    }
    else {
      v27 = v85;
    }
    id v91 = 0;
    int v28 = [v86 setDate:v13 forKey:v27 error:&v91];
    id v29 = v91;
    if (v28)
    {
      v30 = [v11 profile];
      v31 = [v30 cloudSyncManager];
      v32 = v31;
      if (v24 < 0) {
        [v31 didCompleteSuccessfulLitePushWithDate:v13];
      }
      else {
        [v31 didCompleteSuccessfulPushWithDate:v13];
      }
    }
    else
    {
      _HKInitializeLogging();
      v33 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        v34 = @"Lite ";
        if ((v24 & 0x80) == 0) {
          v34 = &stru_1F1728D60;
        }
        *(_DWORD *)buf = 138543618;
        id v93 = v29;
        __int16 v94 = 2114;
        v95 = v34;
        _os_log_error_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_ERROR, "Failed to record successful %{public}@push: %{public}@.", buf, 0x16u);
      }
    }
    id v90 = v29;
    int v35 = HDUpgradedToSyncIdentity(v17, (uint64_t)&v90);
    id v36 = v90;

    if (v35)
    {
      id v89 = v36;
      char v37 = HDSetCompletedTransitionToSyncIdentity(1, v17, (uint64_t)&v89);
      id v38 = v89;

      if ((v37 & 1) == 0)
      {
        _HKInitializeLogging();
        v39 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v93 = v38;
          _os_log_error_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_ERROR, "Failed to record completion of transition to sync identity: %{public}@.", buf, 0xCu);
        }
      }
    }
    else
    {
      id v38 = v36;
    }
    id v88 = v38;
    char v40 = HDSetUpgradedToSyncIdentity(1, v17, (uint64_t)&v88);
    id v41 = v88;

    if ((v40 & 1) == 0)
    {
      _HKInitializeLogging();
      id v42 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v93 = v41;
        _os_log_error_impl(&dword_1BCB7D000, v42, OS_LOG_TYPE_ERROR, "Failed to record has upgraded to sync identity based stores: %{public}@.", buf, 0xCu);
      }
    }
    HDSetCloudSyncLastSuccessfulPushDateForCoordinatedSync(v13, v17);
    v43 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v44 = objc_msgSend(v43, "dictionaryForKey:");

    if (v44)
    {
      id v79 = v41;
      v80 = v13;
      double v81 = v8;
      uint64_t v82 = v1;
      double Current = CFAbsoluteTimeGetCurrent();
      v46 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v46 doubleForKey:@"HDCloudSyncFullSyncStartTime"];
      double v48 = v47;

      v49 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      objc_msgSend(v49, "doubleForKey:");
      double v51 = v50;

      v52 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      objc_msgSend(v52, "doubleForKey:");
      double v54 = v53;

      v55 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      uint64_t v56 = objc_msgSend(v55, "integerForKey:");

      v57 = [v11 configuration];
      v58 = [v57 repository];
      id v59 = [v58 profile];
      v60 = [v59 daemon];
      uint64_t v77 = [v60 analyticsSubmissionCoordinator];

      _HKInitializeLogging();
      os_log_t v61 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        id v62 = v61;
        v63 = [v44 objectForKeyedSubscript:@"fullSyncReason"];
        v64 = [NSNumber numberWithDouble:v48];
        v65 = [NSNumber numberWithDouble:v54];
        BOOL v66 = [NSNumber numberWithInteger:v56];
        *(_DWORD *)buf = 138413058;
        id v93 = v63;
        __int16 v94 = 2112;
        v95 = v64;
        __int16 v96 = 2112;
        v97 = v65;
        __int16 v98 = 2112;
        v99 = v66;
        _os_log_impl(&dword_1BCB7D000, v62, OS_LOG_TYPE_DEFAULT, "Full Sync Completed with following stats: reason: %@, startTime: %@, actively spent time: %@, number of runs completed %@  ", buf, 0x2Au);
      }
      v67 = objc_msgSend(v44, "objectForKeyedSubscript:", @"fullSyncReason", v77);
      v68 = [v44 objectForKeyedSubscript:@"shardResponsible"];
      BOOL v69 = [v44 objectForKeyedSubscript:@"daysSincePreviousFullSync"];
      uint64_t v70 = [NSNumber numberWithInteger:v56 + 1];
      objc_msgSend(v78, "cloudSync_reportFullSyncMetricsWithReason:shard:daysSincePreviousFullSync:totalDuration:activeDuration:numberOfRuns:incomplete:", v67, v68, v69, v70, 0, Current - v48, Current - v51 + v54);

      uint64_t v71 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v71 removeObjectForKey:@"HDCloudSyncFullSyncOngoing"];

      v72 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v72 removeObjectForKey:@"HDCloudSyncFullSyncActiveDuration"];

      v73 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v73 removeObjectForKey:@"HDCloudSyncFullSyncNumberOfRuns"];

      v74 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v74 removeObjectForKey:@"HDCloudSyncFullSyncRunStartTime"];

      v8 = v81;
      uint64_t v1 = v82;
      id v41 = v79;
      v13 = v80;
    }

    v75 = *(void **)(v1 + 40);
  }
  else
  {
    v75 = 0;
  }
  [v75 finishWithSuccess:1 error:0];
}

void __36__HDCloudSyncPipelineStagePush_main__block_invoke_279(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v19 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v6 = [v5 dictionaryForKey:@"HDCloudSyncFullSyncOngoing"];

    if (v6)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      uint64_t v9 = [v8 integerForKey:@"HDCloudSyncFullSyncNumberOfRuns"];

      id v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v10 doubleForKey:@"HDCloudSyncFullSyncRunStartTime"];
      double v12 = v11;

      v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v13 doubleForKey:@"HDCloudSyncFullSyncActiveDuration"];
      double v15 = v14;

      uint64_t v16 = v9 + 1;
      v17 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v17 setInteger:v16 forKey:@"HDCloudSyncFullSyncNumberOfRuns"];

      v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v18 setDouble:@"HDCloudSyncFullSyncActiveDuration" forKey:Current - v12 + v15];
    }
  }
  [*(id *)(a1 + 32) finishWithSuccess:0 error:v19];
}

uint64_t __64__HDCloudSyncPipelineStagePush__combinedPushOperationForStores___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 shardPredicate];
  uint64_t v7 = [v5 shardPredicate];
  v8 = (void *)v7;
  if (!v6) {
    goto LABEL_4;
  }
  if (!v7)
  {
    uint64_t v9 = -1;
    goto LABEL_6;
  }
  uint64_t v9 = [v6 compare:v7];
  if (!v9)
  {
LABEL_4:
    id v10 = [v4 storeIdentifier];
    double v11 = [v5 storeIdentifier];
    uint64_t v9 = [v10 compare:v11];
  }
LABEL_6:

  return v9;
}

uint64_t __107__HDCloudSyncPipelineStagePush__requiresFullSyncWithStagingStore_pushStores_reason_shardResponsible_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 store];
  id v4 = [v3 storeIdentifier];
  id v5 = [*(id *)(a1 + 32) storeIdentifier];
  uint64_t v6 = [v4 isEqual:v5];

  return v6;
}

uint64_t __107__HDCloudSyncPipelineStagePush__requiresFullSyncWithStagingStore_pushStores_reason_shardResponsible_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 storeIdentifier];
  id v5 = [*(id *)(a1 + 32) storeIdentifier];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v8 = [v3 childRecordCount];
    if (v7 <= v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v7;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
  }

  return 0;
}

id __63__HDCloudSyncPipelineStagePush__obsoleteStoreRecordsForCleanup__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (![v2 purpose] && (objc_msgSend(v2, "options") & 4) != 0)
  {
    id v3 = [v2 storeRecord];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

BOOL __83__HDCloudSyncPipelineStagePush__computePushAndCleanupOperationForPushStores_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 shardPredicate];
  BOOL v3 = [v2 type] == 2;

  return v3;
}

BOOL __83__HDCloudSyncPipelineStagePush__computePushAndCleanupOperationForPushStores_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 shardPredicate];
  BOOL v3 = [v2 type] != 2;

  return v3;
}

uint64_t __83__HDCloudSyncPipelineStagePush__computePushAndCleanupOperationForPushStores_error___block_invoke_298(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 store];
  id v4 = [v3 storeIdentifier];
  id v5 = [*(id *)(a1 + 32) storeIdentifier];
  uint64_t v6 = [v4 isEqual:v5];

  return v6;
}

uint64_t __83__HDCloudSyncPipelineStagePush__computePushAndCleanupOperationForPushStores_error___block_invoke_2_300(uint64_t a1)
{
  return [*(id *)(a1 + 32) hasEncounteredSubOperationError] ^ 1;
}

uint64_t __83__HDCloudSyncPipelineStagePush__computePushAndCleanupOperationForPushStores_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_msgSend(*(id *)(a1 + 32), "persistedStateWithError:");
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v5 stateByResettingRebaselineDeadline];
    uint64_t v9 = [v7 persistState:v8 error:a3];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __83__HDCloudSyncPipelineStagePush__computePushAndCleanupOperationForPushStores_error___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) hasEncounteredSubOperationError] ^ 1;
}

void __56__HDCloudSyncPipelineStagePush__pushOperationWithStore___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) pushTarget];
  [*(id *)(a1 + 32) setTarget:v2];
}

uint64_t __66__HDCloudSyncPipelineStagePush__pushStoresByAddingShardsToStores___block_invoke(uint64_t a1, void *a2)
{
  return [a2 storeIdentifier];
}

uint64_t __66__HDCloudSyncPipelineStagePush__pushStoresByAddingShardsToStores___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = [a2 storeIdentifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

id __43__HDCloudSyncPipelineStagePush__pushStores__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 options] & 4) != 0)
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = [v2 store];
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end