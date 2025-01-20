@interface HDCloudSyncManagerSyncTask
- (BOOL)combineWithTask:(id)a3;
- (id)pipelineForRepository:(id)a3;
- (void)didFailWithErrors:(id)a3;
- (void)didFinishWithSuccess;
@end

@implementation HDCloudSyncManagerSyncTask

- (id)pipelineForRepository:(id)a3
{
  uint64_t v183 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = [(HDCloudSyncManagerRepositoryTask *)self context];
    int v179 = 138543618;
    v180 = self;
    __int16 v181 = 2114;
    v182 = v7;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting cloud sync task with context %{public}@", (uint8_t *)&v179, 0x16u);
  }
  v8 = [HDCloudSyncPipeline alloc];
  v9 = [(HDCloudSyncManagerRepositoryTask *)self context];
  v10 = [(HDCloudSyncManagerPipelineTask *)self accessibilityAssertion];
  v11 = [(HDCloudSyncManagerRepositoryTask *)self manager];
  v12 = [v11 queue];
  id v13 = [(HDCloudSyncPipeline *)v8 initForContext:v9 repository:v4 accessibilityAssertion:v10 queue:v12];

  id v14 = v13;
  v15 = v14;
  if (self)
  {
    v16 = [(HDCloudSyncManagerRepositoryTask *)self context];
    __int16 v17 = [v16 options];

    if ((v17 & 0x800) == 0)
    {
      v18 = [HDCloudSyncPipelineStageFetchAndUpdateCache alloc];
      v19 = [v15 operationConfiguration];
      v20 = [(HDCloudSyncPipelineStage *)v18 initWithConfiguration:v19 cloudState:0];
      [v15 addStage:v20];
    }
    id v21 = v15;
    v22 = [HDCloudSyncDetectSyncDisabledOperation alloc];
    v23 = [v21 operationConfiguration];
    v24 = [(HDCloudSyncOperation *)v22 initWithConfiguration:v23 cloudState:0];

    v25 = [(HDCloudSyncOperation *)v24 asPipelineStage];
    [v21 addStage:v25];

    id v26 = v4;
    id v27 = v21;
    v28 = [(HDCloudSyncManagerRepositoryTask *)self context];
    id v29 = [v28 syncRequest];
    if (v29)
    {
      v30 = v29;
      v31 = [v29 contextSyncRequest];

      if (!v31) {
        goto LABEL_17;
      }
    }
    else
    {
    }
    v32 = [v26 syncAvailability];
    int v33 = [v32 shouldSyncDeviceContext];

    if (v33)
    {
      v34 = [(HDCloudSyncManagerRepositoryTask *)self context];
      v35 = [v34 syncRequest];

      if (!v35)
      {
        v50 = [HDCloudSyncPipelineStageContextSyncPush alloc];
        v51 = [v27 operationConfiguration];
        v49 = [(HDCloudSyncPipelineStage *)v50 initWithConfiguration:v51 cloudState:0];

        [(HDCloudSyncPipelineStage *)v49 setCriticalFailureOnError:0];
        [v27 addStage:v49];
        v52 = [HDCloudSyncPipelineStageContextSyncPull alloc];
        v53 = [v27 operationConfiguration];
        v54 = [(HDCloudSyncPipelineStage *)v52 initWithConfiguration:v53 cloudState:0];

        [(HDCloudSyncPipelineStage *)v54 setCriticalFailureOnError:0];
        [v27 addStage:v54];

        goto LABEL_16;
      }
      v36 = [(HDCloudSyncManagerRepositoryTask *)self context];
      v37 = [v36 syncRequest];
      v38 = [v37 contextSyncRequest];
      int v39 = [v38 push];

      if (v39)
      {
        v40 = [HDCloudSyncPipelineStageContextSyncPush alloc];
        v41 = [v27 operationConfiguration];
        v42 = [(HDCloudSyncPipelineStage *)v40 initWithConfiguration:v41 cloudState:0];

        [(HDCloudSyncPipelineStage *)v42 setCriticalFailureOnError:0];
        [v27 addStage:v42];
      }
      v43 = [(HDCloudSyncManagerRepositoryTask *)self context];
      v44 = [v43 syncRequest];
      v45 = [v44 contextSyncRequest];
      int v46 = [v45 pull];

      if (v46)
      {
        v47 = [HDCloudSyncPipelineStageContextSyncPull alloc];
        v48 = [v27 operationConfiguration];
        v49 = [(HDCloudSyncPipelineStage *)v47 initWithConfiguration:v48 cloudState:0];

        [(HDCloudSyncPipelineStage *)v49 setCriticalFailureOnError:0];
        [v27 addStage:v49];
LABEL_16:
      }
    }
  }
  else
  {

    id v171 = v4;
    id v172 = v15;
  }
LABEL_17:

  id v55 = v4;
  id v56 = v15;
  v57 = v56;
  if (!self)
  {

    id v173 = v57;
    id v174 = v173;

    id v175 = v55;
    id v176 = v174;
    goto LABEL_50;
  }
  v58 = [(HDCloudSyncManagerRepositoryTask *)self context];
  id v59 = [v58 syncRequest];
  if (v59)
  {
    v60 = v59;
    v61 = [v59 stateSyncRequest];

    if (!v61) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v62 = [v55 syncAvailability];
  int v63 = [v62 shouldSyncStateEntities];

  if (v63)
  {
    v64 = [HDCloudSyncPipelineStageStateSync alloc];
    v65 = [v57 operationConfiguration];
    v66 = [(HDCloudSyncPipelineStage *)v64 initWithConfiguration:v65 cloudState:0];

    [(HDCloudSyncPipelineStage *)v66 setCriticalFailureOnError:0];
    [v57 addStage:v66];
  }
LABEL_23:

  id v67 = v57;
  v68 = [(HDCloudSyncManagerRepositoryTask *)self context];
  v69 = [v68 syncRequest];
  v70 = v69;
  if (!v69
    || ([(HDCloudSyncPipelineStageSynchronize *)v69 summarySharingSyncRequest],
        v71 = objc_claimAutoreleasedReturnValue(),
        v71,
        v71)
    || ([(HDCloudSyncPipelineStageSynchronize *)v70 medicalIDSyncRequest],
        v72 = objc_claimAutoreleasedReturnValue(),
        v72,
        v72))
  {

    goto LABEL_27;
  }
  v168 = [(HDCloudSyncPipelineStageSynchronize *)v70 changesSyncRequest];

  if (!v168)
  {

    goto LABEL_28;
  }
  v169 = [(HDCloudSyncPipelineStageSynchronize *)v70 changesSyncRequest];
  char v170 = [v169 lite];

  if ((v170 & 1) == 0)
  {
LABEL_27:
    v73 = [HDCloudSyncPipelineStageSynchronize alloc];
    v68 = [v67 operationConfiguration];
    v70 = [(HDCloudSyncPipelineStage *)v73 initWithConfiguration:v68 cloudState:0];
    [v67 addStage:v70];
LABEL_28:
  }
  id v74 = v67;
  v75 = [(HDCloudSyncManagerRepositoryTask *)self context];
  v76 = [v75 syncRequest];
  if (!v76)
  {

LABEL_33:
    v81 = [(HDCloudSyncManagerRepositoryTask *)self context];
    __int16 v82 = [v81 options];

    if ((v82 & 0x200) == 0)
    {
      v83 = [HDCloudSyncPipelineStageCheckForRequiredProfileDeletion alloc];
      v75 = [v74 operationConfiguration];
      v77 = [(HDCloudSyncPipelineStage *)v83 initWithConfiguration:v75 cloudState:0];
      [v74 addStage:v77];
LABEL_36:

      goto LABEL_37;
    }
    goto LABEL_37;
  }
  v77 = v76;
  v78 = [(HDCloudSyncPipelineStageCheckForRequiredProfileDeletion *)v76 changesSyncRequest];

  if (!v78)
  {

    goto LABEL_36;
  }
  v79 = [(HDCloudSyncPipelineStageCheckForRequiredProfileDeletion *)v77 changesSyncRequest];
  char v80 = [v79 lite];

  if ((v80 & 1) == 0) {
    goto LABEL_33;
  }
LABEL_37:

  id v84 = v55;
  id v85 = v74;
  v86 = [v84 syncAvailability];
  if ([v86 shouldSyncSummarySharingPull])
  {
  }
  else
  {
    v87 = [v84 syncAvailability];
    int v88 = [v87 shouldSyncSummarySharingPush];

    if (!v88) {
      goto LABEL_50;
    }
  }
  v89 = [(HDCloudSyncManagerRepositoryTask *)self context];
  id v90 = [(HDCloudSyncPipelineStageSharedSummarySynchronizeSharingEntryState *)v89 syncRequest];
  id v91 = v84;
  if (!v90
    || ([v90 summarySharingSyncRequest],
        v92 = objc_claimAutoreleasedReturnValue(),
        v92,
        v92))
  {

    goto LABEL_43;
  }
  v115 = [v90 changesSyncRequest];

  if (!v115)
  {

    goto LABEL_48;
  }
  v116 = [v90 changesSyncRequest];
  char v117 = [v116 lite];

  if ((v117 & 1) == 0)
  {
LABEL_43:
    v93 = [HDCloudSyncPipelineStageSharedSummarySynchronizeSharingEntryState alloc];
    v94 = [v85 operationConfiguration];
    v89 = [(HDCloudSyncPipelineStage *)v93 initWithConfiguration:v94 cloudState:0];

    [(HDCloudSyncPipelineStage *)v89 setCriticalFailureOnError:0];
    v95 = [v91 syncAvailability];
    int v96 = [v95 shouldSyncSummarySharingPull];

    if (v96)
    {
      v97 = HDCloudSyncPipelineStageSharedSummaryPull;
    }
    else
    {
      v98 = [v91 syncAvailability];
      int v99 = [v98 shouldSyncSummarySharingPush];

      if (!v99)
      {
LABEL_49:

        goto LABEL_50;
      }
      v97 = HDCloudSyncPipelineStageSharedSummaryPush;
    }
    id v100 = [v97 alloc];
    v101 = [v85 operationConfiguration];
    id v90 = (id)[v100 initWithConfiguration:v101 cloudState:0];

    [v90 setCriticalFailureOnError:0];
    [v85 addStage:v89];
    [v85 addStage:v90];
LABEL_48:

    goto LABEL_49;
  }
LABEL_50:

  id v102 = v55;
  id v103 = v57;
  v104 = v103;
  if (self)
  {
    v105 = [(HDCloudSyncManagerRepositoryTask *)self context];
    id v106 = [(HDCloudSyncPipelineStageMedicalID *)v105 syncRequest];
    id v107 = v102;
    v108 = [v107 behavior];
    int v109 = [v108 supportsMedicalIDSync];

    if (v109)
    {
      if (!v106
        || ([v106 medicalIDSyncRequest],
            v110 = objc_claimAutoreleasedReturnValue(),
            v110,
            v110))
      {

LABEL_55:
        v111 = [v107 syncAvailability];
        int v112 = [v111 shouldSyncMedicalID];

        if (!v112) {
          goto LABEL_65;
        }
        v113 = [HDCloudSyncPipelineStageMedicalID alloc];
        v114 = [v104 operationConfiguration];
        v105 = [(HDCloudSyncPipelineStage *)v113 initWithConfiguration:v114 cloudState:0];

        [(HDCloudSyncPipelineStage *)v105 setCriticalFailureOnError:0];
        [v104 addStage:v105];
        goto LABEL_64;
      }
      v118 = [v106 changesSyncRequest];

      if (v118)
      {
        v119 = [v106 changesSyncRequest];
        char v120 = [v119 lite];

        if (v120)
        {
LABEL_65:

          id v121 = v107;
          id v122 = v104;
          v123 = [(HDCloudSyncManagerRepositoryTask *)self context];
          id v124 = [v123 syncRequest];
          if (v124)
          {
            v125 = v124;
            v126 = [v124 changesSyncRequest];

            if (!v126) {
              goto LABEL_85;
            }
          }
          else
          {
          }
          v127 = [v121 syncAvailability];
          if ([v127 shouldPush])
          {
          }
          else
          {
            v128 = [v121 syncAvailability];
            int v129 = [v128 shouldPull];

            if (!v129) {
              goto LABEL_85;
            }
          }
          v130 = [HDCloudSyncPipelineStagePush alloc];
          v131 = [v122 operationConfiguration];
          v132 = [(HDCloudSyncPipelineStagePush *)v130 initWithConfiguration:v131 cloudState:0];

          [(HDCloudSyncPipelineStage *)v132 setCriticalFailureOnError:0];
          v133 = [HDCloudSyncPipelineStagePull alloc];
          v134 = [v122 operationConfiguration];
          v135 = [(HDCloudSyncPipelineStagePull *)v133 initWithConfiguration:v134 cloudState:0];

          [(HDCloudSyncPipelineStage *)v135 setCriticalFailureOnError:0];
          v136 = [(HDCloudSyncManagerRepositoryTask *)self context];
          int v137 = [v136 isFastPushOrPull];

          v138 = [HDCloudSyncPipelineStagePrepareForSync alloc];
          v139 = [v122 operationConfiguration];
          v140 = [(HDCloudSyncPipelineStage *)v138 initWithConfiguration:v139 cloudState:0];
          [v122 addStage:v140];

          if (v137)
          {
            v141 = [(HDCloudSyncManagerRepositoryTask *)self context];
            if (([v141 options] & 0x80) != 0)
            {
              v146 = [v121 syncAvailability];
              int v147 = [v146 shouldPush];

              if (v147)
              {
                v148 = [HDCloudSyncDeleteStoreOnChildOperation alloc];
                v149 = [v122 operationConfiguration];
                v150 = [(HDCloudSyncOperation *)v148 initWithConfiguration:v149 cloudState:0];
                v151 = [(HDCloudSyncOperation *)v150 asPipelineStage];
                [v122 addStage:v151];

                [v122 addStage:v132];
              }
            }
            else
            {
            }
            v152 = [(HDCloudSyncManagerRepositoryTask *)self context];
            if (([v152 options] & 0x1000) == 0)
            {

LABEL_84:
              goto LABEL_85;
            }
            v153 = [v121 syncAvailability];
            int v154 = [v153 shouldPull];

            if (!v154) {
              goto LABEL_84;
            }
          }
          else
          {
            v142 = [v121 syncAvailability];
            int v143 = [v142 shouldPush];

            if (v143) {
              [v122 addStage:v132];
            }
            v144 = [v121 syncAvailability];
            int v145 = [v144 shouldPull];

            if (!v145) {
              goto LABEL_84;
            }
          }
          [v122 addStage:v135];
          goto LABEL_84;
        }
        goto LABEL_55;
      }
    }

LABEL_64:
    goto LABEL_65;
  }

  id v177 = v102;
  id v178 = v104;
LABEL_85:

  id v155 = v102;
  id v156 = v104;
  if (!self) {
    goto LABEL_96;
  }
  v157 = [(HDCloudSyncManagerRepositoryTask *)self context];
  v158 = [v157 syncRequest];
  id v159 = v155;
  v160 = v159;
  if (v158)
  {
    v161 = [(HDCloudSyncPipelineStageAttachments *)v158 changesSyncRequest];

    if (!v161)
    {

LABEL_94:
      goto LABEL_95;
    }
    v162 = [(HDCloudSyncPipelineStageAttachments *)v158 changesSyncRequest];
    char v163 = [v162 lite];

    if (v163) {
      goto LABEL_96;
    }
  }
  else
  {
  }
  v157 = [(HDCloudSyncManagerRepositoryTask *)self context];
  if (([v157 options] & 0x800) == 0)
  {
    v164 = [v160 syncAvailability];
    int v165 = [v164 shouldSyncAttachments];

    if (!v165) {
      goto LABEL_96;
    }
    v166 = [HDCloudSyncPipelineStageAttachments alloc];
    v157 = [v156 operationConfiguration];
    v158 = [(HDCloudSyncPipelineStage *)v166 initWithConfiguration:v157 cloudState:0];
    [v156 addStage:v158];
    goto LABEL_94;
  }
LABEL_95:

LABEL_96:

  return v156;
}

- (void)didFinishWithSuccess
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncManagerRepositoryTask *)self manager];
  [v3 updateErrorRequiringUserAction:0];

  [(HDCloudSyncManagerPipelineTask *)self callCompletionWithSuccess:1 error:0];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(HDCloudSyncManagerTask *)self mirroringTasks];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) didFinishWithSuccess];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)didFailWithErrors:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HDCloudSyncManagerRepositoryTask *)self manager];
  uint64_t v6 = [v4 firstObject];
  [v5 updateErrorRequiringUserAction:v6];

  uint64_t v7 = [v4 firstObject];
  [(HDCloudSyncManagerPipelineTask *)self callCompletionWithSuccess:0 error:v7];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v8 = [(HDCloudSyncManagerTask *)self mirroringTasks];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) didFailWithErrors:v4];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)combineWithTask:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v5 = [(HDCloudSyncManagerRepositoryTask *)self context];
  uint64_t v6 = [v4 context];
  if (([v5 isEquivalent:v6] & 1) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v7 = [(HDCloudSyncManagerRepositoryTask *)self manager];
  uint64_t v8 = [v7 profile];
  uint64_t v9 = [v8 profileIdentifier];
  uint64_t v10 = [v4 manager];
  uint64_t v11 = [v10 profile];
  uint64_t v12 = [v11 profileIdentifier];
  int v15 = [v9 isEqual:v12];

  if (!v15)
  {
LABEL_6:
    BOOL v13 = 0;
    goto LABEL_7;
  }
  [v4 mirrorTask:self];
  BOOL v13 = 1;
LABEL_7:

  return v13;
}

@end