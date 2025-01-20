@interface HDCloudSyncValidatePushTargetOperation
+ (BOOL)shouldLogAtOperationStart;
+ (id)operationTagDependencies;
- (BOOL)_validateTargets:(void *)a3 errorOut:;
- (HDCloudSyncValidatePushTargetOperation)initWithConfiguration:(id)a3;
- (uint64_t)_validateAnchorRangesForSequenceRecord:(void *)a3 target:(void *)a4 errorOut:;
- (uint64_t)_validateCurrentSequenceForTarget:(void *)a3 errorOut:;
- (void)_requireRebaseForTarget:(void *)a1;
- (void)_rollOwnershipIdentiferAndFinish;
- (void)main;
@end

@implementation HDCloudSyncValidatePushTargetOperation

+ (BOOL)shouldLogAtOperationStart
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

- (HDCloudSyncValidatePushTargetOperation)initWithConfiguration:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HDCloudSyncValidatePushTargetOperation;
  v3 = [(HDCloudSyncOperation *)&v7 initWithConfiguration:a3 cloudState:0];
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    targetsBySequenceToDelete = v3->_targetsBySequenceToDelete;
    v3->_targetsBySequenceToDelete = v4;
  }
  return v3;
}

- (void)main
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 computedState];
  v5 = [v4 pushTargets];
  targets = self->_targets;
  self->_targets = v5;

  if ([(NSArray *)self->_targets count])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v8 = self->_targets;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v38 objects:&buf count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v39 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          v14 = [v13 store];

          if (!v14)
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Target's %@ push store not set when beginning push target validation.", v13);
            id v20 = (id)objc_claimAutoreleasedReturnValue();
            v19 = v20;
            if (v20) {
              id v21 = v20;
            }

            id v18 = 0;
            goto LABEL_16;
          }
          v15 = [v13 store];
          v16 = [v15 shardPredicate];
          int v17 = [v16 type];

          if (v17 != 2) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v38 objects:&buf count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v18 = v7;
    v19 = 0;
LABEL_16:

    id v22 = v19;
    if (v18)
    {
      if ([v18 count])
      {
        id v37 = v22;
        BOOL v23 = -[HDCloudSyncValidatePushTargetOperation _validateTargets:errorOut:]((uint64_t)self, v18, &v37);
        id v24 = v37;

        if (v23)
        {
          if (self->_requiresOwnershipRoll)
          {
            -[HDCloudSyncValidatePushTargetOperation _rollOwnershipIdentiferAndFinish](self);
LABEL_31:
            id v22 = v24;
            goto LABEL_32;
          }
          if ([(NSMutableDictionary *)self->_targetsBySequenceToDelete count])
          {
            v33 = [HDCloudSyncDeleteSequenceOperation alloc];
            v34 = [(HDCloudSyncOperation *)self configuration];
            v35 = (void *)[(NSMutableDictionary *)self->_targetsBySequenceToDelete copy];
            v36 = [(HDCloudSyncDeleteSequenceOperation *)v33 initWithConfiguration:v34 targetsBySequence:v35];

            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            v43 = __76__HDCloudSyncValidatePushTargetOperation__deleteOldSequenceRecordsAndFinish__block_invoke;
            v44 = &unk_1E62F2950;
            v45 = self;
            [(HDCloudSyncOperation *)v36 setOnError:&buf];
            *(void *)&long long v38 = MEMORY[0x1E4F143A8];
            *((void *)&v38 + 1) = 3221225472;
            *(void *)&long long v39 = __76__HDCloudSyncValidatePushTargetOperation__deleteOldSequenceRecordsAndFinish__block_invoke_2;
            *((void *)&v39 + 1) = &unk_1E62F2928;
            *(void *)&long long v40 = self;
            [(HDCloudSyncOperation *)v36 setOnSuccess:&v38];
            [(HDCloudSyncOperation *)v36 start];

            goto LABEL_31;
          }
          v30 = self;
          uint64_t v31 = 1;
          id v32 = 0;
        }
        else
        {
          v30 = self;
          uint64_t v31 = 0;
          id v32 = v24;
        }
        [(HDCloudSyncOperation *)v30 finishWithSuccess:v31 error:v32];
        goto LABEL_31;
      }
      _HKInitializeLogging();
      v29 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = self;
        _os_log_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: No filtered targets to validate.", (uint8_t *)&buf, 0xCu);
      }
      v26 = self;
      uint64_t v27 = 1;
      id v28 = 0;
    }
    else
    {
      v26 = self;
      uint64_t v27 = 0;
      id v28 = v22;
    }
    [(HDCloudSyncOperation *)v26 finishWithSuccess:v27 error:v28];
LABEL_32:

    return;
  }
  _HKInitializeLogging();
  v25 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: No targets to validate.", (uint8_t *)&buf, 0xCu);
  }
  [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
}

- (BOOL)_validateTargets:(void *)a3 errorOut:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v20 = v4;
  if (a1)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = v4;
    uint64_t v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16, v20);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v23;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(unsigned char *)(a1 + 120) != 0;
        if (*(unsigned char *)(a1 + 120)) {
          goto LABEL_21;
        }
        id v11 = *(id *)(*((void *)&v22 + 1) + 8 * v9);
        v12 = [v11 storeRecord];
        v13 = [v12 currentSequenceHeaderRecord];

        if (v13)
        {
          v14 = [v11 storeRecord];
          v15 = [v14 oldSequenceHeaderRecord];

          if (!v15)
          {
            uint64_t v18 = -[HDCloudSyncValidatePushTargetOperation _validateCurrentSequenceForTarget:errorOut:]((unsigned char *)a1, v11, a3);

            if ((v18 & 1) == 0) {
              goto LABEL_21;
            }
            goto LABEL_18;
          }
          int v16 = [v13 isActive];
          if (v16 != [v15 isActive]
            && (![v13 isActive] || (objc_msgSend(v15, "isActive") & 1) != 0))
          {
            char v17 = -[HDCloudSyncValidatePushTargetOperation _validateCurrentSequenceForTarget:errorOut:]((unsigned char *)a1, v11, a3);

            if ((v17 & 1) == 0) {
              goto LABEL_21;
            }
            goto LABEL_18;
          }
          [*(id *)(a1 + 112) setObject:v11 forKeyedSubscript:v15];
        }
LABEL_18:
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    BOOL v10 = 1;
LABEL_21:
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_rollOwnershipIdentiferAndFinish
{
  if (a1)
  {
    v2 = [a1 profile];
    v3 = [v2 cloudSyncManager];
    id v4 = [v3 ownerIdentifierManager];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __74__HDCloudSyncValidatePushTargetOperation__rollOwnershipIdentiferAndFinish__block_invoke;
    v5[3] = &unk_1E62F2978;
    v5[4] = a1;
    [v4 rollOwnerDifferentiatorForReason:@"Found anchors from the future" completion:v5];
  }
}

- (uint64_t)_validateCurrentSequenceForTarget:(void *)a3 errorOut:
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = [v4 storeRecord];
  uint64_t v6 = [v5 currentSequenceHeaderRecord];

  if ([v6 childRecordCount] >= 501)
  {
    uint64_t v7 = [a1 configuration];
    int v8 = [v7 rebaseProhibited];

    _HKInitializeLogging();
    uint64_t v9 = (void *)*MEMORY[0x1E4F29FA8];
    BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        id v11 = v9;
        v12 = HDCloudSyncRebaseReasonToString(0);
        *(_DWORD *)long long buf = 138543874;
        *(void *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2114;
        v142 = v6;
        _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: rebase required but prohibited (%{public}@) for sequence record %{public}@", buf, 0x20u);
      }
    }
    else
    {
      if (v10)
      {
        v13 = v9;
        v14 = HDCloudSyncRebaseReasonToString(0);
        *(_DWORD *)long long buf = 138543874;
        *(void *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2114;
        v142 = v6;
        _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: rebase required (%{public}@) for sequence record %{public}@", buf, 0x20u);
      }
      v15 = kHDEventNameCloudSync;
      v136 = @"operation";
      v137 = @"rebase-reason";
      *(void *)long long buf = &unk_1F17EB700;
      *(void *)&buf[8] = &unk_1F17EB700;
      v138 = @"record-count";
      int v16 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "childRecordCount"));
      *(void *)&buf[16] = v16;
      char v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v136 count:3];
      HDPowerLog(v15, v17, 2);

      -[HDCloudSyncValidatePushTargetOperation _requireRebaseForTarget:](a1, v4);
    }
  }

  id v119 = v4;
  uint64_t v18 = [v119 storeRecord];
  v19 = [v18 currentSequenceHeaderRecord];

  id v20 = v119;
  if (v19
    && (-[HDCloudSyncValidatePushTargetOperation _validateAnchorRangesForSequenceRecord:target:errorOut:](a1, v19, v119, a3) & 1) == 0)
  {
    goto LABEL_16;
  }
  id v21 = [v119 storeRecord];
  long long v22 = [v21 oldSequenceHeaderRecord];

  id v20 = v119;
  if (v22
    && (-[HDCloudSyncValidatePushTargetOperation _validateAnchorRangesForSequenceRecord:target:errorOut:](a1, v22, v119, a3) & 1) == 0)
  {

LABEL_16:
    uint64_t v28 = 0;
    goto LABEL_89;
  }

  id v23 = v119;
  long long v24 = [v23 store];
  v131[0] = 0;
  long long v25 = [v24 persistedStateWithError:v131];
  id v26 = v131[0];

  if (v25)
  {
    uint64_t v27 = [a1 configuration];
    if ([v27 rebaseProhibited])
    {
    }
    else
    {
      uint64_t v31 = [v25 rebaseDeadline];
      BOOL v32 = v31 == 0;

      if (!v32)
      {
        v33 = [v25 rebaseDeadline];
        v34 = [a1 configuration];
        v35 = [v34 syncDate];
        [v33 timeIntervalSinceDate:v35];
        double v37 = v36;

        long long v38 = (uint64_t *)MEMORY[0x1E4F2BD00];
        if (v37 < *MEMORY[0x1E4F2BD00])
        {
          _HKInitializeLogging();
          long long v39 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            long long v40 = v39;
            long long v41 = [v23 store];
            v42 = HDCloudSyncRebaseReasonToString(1);
            v43 = [v25 rebaseDeadline];
            uint64_t v44 = *v38;
            *(_DWORD *)long long buf = 138544642;
            *(void *)&buf[4] = a1;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v41;
            *(_WORD *)&buf[22] = 2114;
            v142 = v42;
            __int16 v143 = 2114;
            v144 = v43;
            __int16 v145 = 2048;
            uint64_t v146 = v44;
            __int16 v147 = 2048;
            double v148 = v37;
            _os_log_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] rebase required (%{public}@), rebase deadline of %{public}@ (trigger threshold is %0.1lfs, remaining interval is %0.1lfs)", buf, 0x3Eu);
          }
          v45 = kHDEventNameCloudSync;
          *(void *)&long long v149 = @"operation";
          *((void *)&v149 + 1) = @"rebase-reason";
          v136 = (__CFString *)&unk_1F17EB700;
          v137 = (__CFString *)&unk_1F17EB718;
          *(void *)&long long v150 = @"deadline";
          uint64_t v46 = NSNumber;
          v47 = [v25 rebaseDeadline];
          [v47 timeIntervalSinceReferenceDate];
          objc_msgSend(v46, "numberWithDouble:");
          v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v138 = v48;
          v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v149 count:3];
          HDPowerLog(v45, v49, 2);

          -[HDCloudSyncValidatePushTargetOperation _requireRebaseForTarget:](a1, v23);
        }
      }
    }

LABEL_26:
    id v118 = v23;
    v50 = [a1 configuration];
    v51 = [v50 repository];
    v52 = [v118 zoneIdentifier];
    v53 = [v52 containerIdentifier];
    *(void *)&v117[4] = [v51 containerForContainerIdentifier:v53];

    if (!*(void *)&v117[4])
    {
      v85 = (void *)MEMORY[0x1E4F28C58];
      v86 = [v118 zoneIdentifier];
      v87 = [v86 containerIdentifier];
      objc_msgSend(v85, "hk_error:format:", 723, @"Unable to find container for identifier %@", v87);
      id v88 = (id)objc_claimAutoreleasedReturnValue();
      *(void *)v117 = v88 == 0;
      if (v88)
      {
        if (a3) {
          *a3 = v88;
        }
        else {
          _HKLogDroppedError();
        }
      }

      goto LABEL_88;
    }
    v54 = [v118 storeRecord];
    v55 = [v54 currentSequenceHeaderRecord];

    if (!v55)
    {
      *(_DWORD *)v117 = 1;
LABEL_88:

      id v20 = v119;
      uint64_t v28 = *(unsigned int *)v117;
      goto LABEL_89;
    }
    v56 = [v118 storeRecord];
    v57 = [HDCloudSyncCachedZone alloc];
    v58 = [v118 zoneIdentifier];
    v59 = [a1 configuration];
    v60 = [v59 repository];
    v61 = [a1 configuration];
    v62 = [v61 accessibilityAssertion];
    id v63 = [(HDCloudSyncCachedZone *)v57 initForZoneIdentifier:v58 repository:v60 accessibilityAssertion:v62];

    id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v65 = objc_opt_class();
    id v126 = 0;
    v123[0] = MEMORY[0x1E4F143A8];
    v123[1] = 3221225472;
    v123[2] = __92__HDCloudSyncValidatePushTargetOperation__validateCurrentSequenceChangesForTarget_errorOut___block_invoke;
    v123[3] = &unk_1E62FD6F8;
    v123[4] = a1;
    id v113 = v56;
    id v124 = v113;
    id v116 = v64;
    id v125 = v116;
    v114 = v63;
    *(_DWORD *)v117 = [v63 recordsForClass:v65 epoch:0 error:&v126 enumerationHandler:v123];
    id v115 = v126;
    if ((v117[0] & 1) == 0)
    {
      _HKInitializeLogging();
      v89 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        v105 = v89;
        v106 = [v63 zoneIdentifier];
        *(_DWORD *)long long buf = 138543618;
        *(void *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v106;
        _os_log_error_impl(&dword_1BCB7D000, v105, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached change records from zone %{public}@", buf, 0x16u);
      }
      id v90 = v115;
      v91 = v90;
      if (v90)
      {
        if (a3) {
          *a3 = v90;
        }
        else {
          _HKLogDroppedError();
        }
      }

      goto LABEL_87;
    }
    [v116 sortUsingSelector:sel_compare_];
    id v66 = v116;
    v67 = [v66 lastObject];
    v112 = v67;
    if (v67)
    {
      char v68 = [v67 finalForSequence];
      _HKInitializeLogging();
      v69 = *MEMORY[0x1E4F29FA8];
      v70 = *MEMORY[0x1E4F29FA8];
      if (v68)
      {
        if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
        {
          v71 = v69;
          uint64_t v72 = [v66 count];
          *(_DWORD *)v153 = 138543618;
          *(void *)&v153[4] = a1;
          *(_WORD *)&v153[12] = 2048;
          *(void *)&v153[14] = v72;
          _os_log_impl(&dword_1BCB7D000, v71, OS_LOG_TYPE_INFO, "%{public}@: Checking for hole in %ld fetched records", v153, 0x16u);
        }
        *(void *)v153 = 0;
        *(void *)&v153[8] = v153;
        *(void *)&v153[16] = 0x2020000000;
        char v154 = 0;
        v111 = objc_opt_new();
        long long v151 = 0u;
        long long v152 = 0u;
        long long v149 = 0u;
        long long v150 = 0u;
        obuint64_t j = v66;
        uint64_t v73 = [obj countByEnumeratingWithState:&v149 objects:buf count:16];
        int v74 = 0;
        if (v73)
        {
          uint64_t v75 = *(void *)v150;
          while (2)
          {
            for (uint64_t i = 0; i != v73; ++i)
            {
              if (*(void *)v150 != v75) {
                objc_enumerationMutation(obj);
              }
              v77 = *(void **)(*((void *)&v149 + 1) + 8 * i);
              v78 = [v77 decodedSyncAnchorRangeMap];
              _HKInitializeLogging();
              v79 = (void *)*MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
              {
                v80 = v79;
                if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
                {
                  v81 = [v77 record];
                  v82 = [v81 recordID];
                  v83 = [v82 recordName];
                  *(_DWORD *)v139 = 67109634;
                  *(_DWORD *)v140 = v74;
                  *(_WORD *)&v140[4] = 2114;
                  *(void *)&v140[6] = v83;
                  *(_WORD *)&v140[14] = 2114;
                  *(void *)&v140[16] = v78;
                  _os_log_impl(&dword_1BCB7D000, v80, OS_LOG_TYPE_INFO, "\t%02d: [Record: %{public}@] %{public}@", v139, 0x1Cu);

                  ++v74;
                }
              }
              if (!v78 || ![v78 anchorRangeCount])
              {
                _HKInitializeLogging();
                v92 = (id)*MEMORY[0x1E4F29FA8];
                if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
                {
                  v108 = [v77 record];
                  v109 = [v108 recordID];
                  v110 = [v109 recordName];
                  *(_DWORD *)v139 = 138543618;
                  *(void *)v140 = a1;
                  *(_WORD *)&v140[8] = 2114;
                  *(void *)&v140[10] = v110;
                  _os_log_error_impl(&dword_1BCB7D000, v92, OS_LOG_TYPE_ERROR, "%{public}@: [Record: %{public}@]: ordered change record with nil or empty anchor range map found, this may indicate a hole in the sequence", v139, 0x16u);
                }
                *(unsigned char *)(*(void *)&v153[8] + 24) = 1;
LABEL_71:

                goto LABEL_72;
              }
              v131[0] = (id)MEMORY[0x1E4F143A8];
              v131[1] = (id)3221225472;
              v131[2] = __85__HDCloudSyncValidatePushTargetOperation__orderedChangeRecordSequenceRequiresRebase___block_invoke;
              v131[3] = &unk_1E62FD720;
              id v132 = v111;
              v133 = a1;
              v134 = v77;
              v135 = v153;
              [v78 enumerateAnchorRangesAndEntityIdentifiersWithBlock:v131];
              BOOL v84 = *(unsigned char *)(*(void *)&v153[8] + 24) == 0;

              if (!v84) {
                goto LABEL_71;
              }
            }
            uint64_t v73 = [obj countByEnumeratingWithState:&v149 objects:buf count:16];
            if (v73) {
              continue;
            }
            break;
          }
        }
LABEL_72:

        if (!*(unsigned char *)(*(void *)&v153[8] + 24))
        {

          _Block_object_dispose(v153, 8);
          goto LABEL_87;
        }
        _HKInitializeLogging();
        v93 = (id)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
        {
          uint64_t v107 = [obj count];
          *(_DWORD *)v139 = 138543618;
          *(void *)v140 = a1;
          *(_WORD *)&v140[8] = 2048;
          *(void *)&v140[10] = v107;
          _os_log_error_impl(&dword_1BCB7D000, v93, OS_LOG_TYPE_ERROR, "%{public}@: Found hole in %ld fetched records", v139, 0x16u);
        }

        long long v129 = 0u;
        long long v130 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        id v122 = obj;
        uint64_t v94 = [v122 countByEnumeratingWithState:&v127 objects:&v136 count:16];
        if (v94)
        {
          uint64_t v95 = *(void *)v128;
          do
          {
            for (uint64_t j = 0; j != v94; ++j)
            {
              if (*(void *)v128 != v95) {
                objc_enumerationMutation(v122);
              }
              v97 = *(void **)(*((void *)&v127 + 1) + 8 * j);
              v98 = [v97 decodedSyncAnchorRangeMap];
              _HKInitializeLogging();
              v99 = (id)*MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
              {
                v100 = [v97 record];
                v101 = [v100 recordID];
                v102 = [v101 recordName];
                *(_DWORD *)v139 = 67109634;
                *(_DWORD *)v140 = v74;
                *(_WORD *)&v140[4] = 2114;
                *(void *)&v140[6] = v102;
                *(_WORD *)&v140[14] = 2114;
                *(void *)&v140[16] = v98;
                _os_log_impl(&dword_1BCB7D000, v99, OS_LOG_TYPE_DEFAULT, "\t%02d: [Record: %{public}@] %{public}@", v139, 0x1Cu);

                ++v74;
              }
            }
            uint64_t v94 = [v122 countByEnumeratingWithState:&v127 objects:&v136 count:16];
          }
          while (v94);
        }

        BOOL v103 = *(unsigned char *)(*(void *)&v153[8] + 24) == 0;
        _Block_object_dispose(v153, 8);

        if (v103) {
          goto LABEL_87;
        }
      }
      else
      {
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v153 = 138543618;
          *(void *)&v153[4] = a1;
          *(_WORD *)&v153[12] = 2114;
          *(void *)&v153[14] = v112;
          _os_log_error_impl(&dword_1BCB7D000, v69, OS_LOG_TYPE_ERROR, "%{public}@: Final ordered change record (%{public}@) is not final for sequence; rebase required to repair damage.",
            v153,
            0x16u);
        }
      }
      -[HDCloudSyncValidatePushTargetOperation _requireRebaseForTarget:](a1, v118);
    }
    else
    {
    }
LABEL_87:

    goto LABEL_88;
  }
  id v29 = v26;
  if (!v29)
  {

    goto LABEL_26;
  }
  v30 = v29;
  if (a3) {
    *a3 = v29;
  }
  else {
    _HKLogDroppedError();
  }

  uint64_t v28 = 0;
  id v20 = v119;
LABEL_89:

  return v28;
}

uint64_t __76__HDCloudSyncValidatePushTargetOperation__deleteOldSequenceRecordsAndFinish__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithSuccess:0 error:a3];
}

void __76__HDCloudSyncValidatePushTargetOperation__deleteOldSequenceRecordsAndFinish__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [*(id *)(v2 + 112) allValues];
  id v9 = 0;
  BOOL v4 = -[HDCloudSyncValidatePushTargetOperation _validateTargets:errorOut:](v2, v3, &v9);
  id v5 = v9;

  uint64_t v6 = *(unsigned char **)(a1 + 32);
  if (!v4)
  {
    uint64_t v7 = 0;
    id v8 = v5;
LABEL_6:
    [v6 finishWithSuccess:v7 error:v8];
    goto LABEL_7;
  }
  if (!v6[120])
  {
    uint64_t v7 = 1;
    id v8 = 0;
    goto LABEL_6;
  }
  -[HDCloudSyncValidatePushTargetOperation _rollOwnershipIdentiferAndFinish](v6);
LABEL_7:
}

void __74__HDCloudSyncValidatePushTargetOperation__rollOwnershipIdentiferAndFinish__block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  BOOL v4 = *(id **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v4[13], "hk_map:", &__block_literal_global_79);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [*(id *)(a1 + 32) configuration];
    uint64_t v6 = [v5 computedState];
    [v6 replaceTargets:v7];

    [*(id *)(a1 + 32) finishWithSuccess:1 error:0];
  }
  else
  {
    [v4 finishWithSuccess:0 error:a3];
  }
}

uint64_t __74__HDCloudSyncValidatePushTargetOperation__rollOwnershipIdentiferAndFinish__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 targetByUpdatingPurpose:1];
}

- (uint64_t)_validateAnchorRangesForSequenceRecord:(void *)a3 target:(void *)a4 errorOut:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = [a1 configuration];
  char v10 = [v9 rebaseProhibited];

  if ((v10 & 1) == 0)
  {
    v12 = [v8 store];
    v13 = objc_msgSend(v12, "syncStoreForEpoch:", objc_msgSend(v7, "baselineEpoch"));

    id v39 = 0;
    v14 = [v13 getPersistedAnchorMapWithError:&v39];
    id v15 = v39;
    int v16 = v15;
    if (v14)
    {
      char v17 = [a1 configuration];
      id v18 = +[HDCloudSyncPushSequenceOperation unfrozenChangeRecordsForPushTarget:v8 sequenceRecord:v7 configuration:v17 error:a4];

      if (v18)
      {
        v19 = [a1 configuration];
        BOOL v20 = +[HDCloudSyncPushSequenceOperation shouldPerformRecentRecordRollingForUnfrozenRecords:v18 configuration:v19];

        if (v20) {
          [v7 frozenSyncAnchorMap];
        }
        else {
        long long v22 = [v7 syncAnchorMap];
        }
        if (([v14 isEqual:v22] & 1) == 0)
        {
          id v23 = @"pushed";
          if (v20) {
            id v23 = @"frozen";
          }
          long long v24 = v23;
          uint64_t v35 = 0;
          double v36 = &v35;
          uint64_t v37 = 0x2020000000;
          char v38 = 0;
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __97__HDCloudSyncValidatePushTargetOperation__validateAnchorRangesForSequenceRecord_target_errorOut___block_invoke;
          v28[3] = &unk_1E62FD6D0;
          BOOL v34 = v20;
          id v29 = v14;
          v30 = a1;
          long long v25 = v24;
          uint64_t v31 = v25;
          id v32 = v13;
          v33 = &v35;
          [v22 enumerateAnchorsAndEntityIdentifiersWithBlock:v28];
          if (*((unsigned char *)v36 + 24))
          {
            a1[120] = 1;
            _HKInitializeLogging();
            id v26 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138543618;
              long long v41 = a1;
              __int16 v42 = 2112;
              v43 = v25;
              _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Found %@ anchors from the future", buf, 0x16u);
            }
          }

          _Block_object_dispose(&v35, 8);
        }

        goto LABEL_19;
      }
    }
    else
    {
      id v21 = v15;
      id v18 = v21;
      if (!v21)
      {
LABEL_19:
        uint64_t v11 = 1;
        goto LABEL_22;
      }
      if (a4)
      {
        id v18 = v21;
        uint64_t v11 = 0;
        *a4 = v18;
LABEL_22:

        goto LABEL_23;
      }
      _HKLogDroppedError();
    }
    uint64_t v11 = 0;
    goto LABEL_22;
  }
  uint64_t v11 = 1;
LABEL_23:

  return v11;
}

void __97__HDCloudSyncValidatePushTargetOperation__validateAnchorRangesForSequenceRecord_target_errorOut___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) anchorForSyncEntityIdentifier:v5];
  uint64_t v7 = v6;
  if (v6 <= a3)
  {
    if (v6 < a3)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 40);
        uint64_t v14 = *(void *)(a1 + 48);
        int v15 = 138544386;
        uint64_t v16 = v13;
        __int16 v17 = 2114;
        uint64_t v18 = v14;
        __int16 v19 = 2048;
        uint64_t v20 = a3;
        __int16 v21 = 2048;
        uint64_t v22 = v7;
        __int16 v23 = 2114;
        id v24 = v5;
        _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Sequence Record %{public}@ sync anchor (%lld) greater than local sync anchor (%lld) for sync entity %{public}@. Invalid state can be fixed with a forced ownership change", (uint8_t *)&v15, 0x34u);
      }
    }
  }
  else if (!*(unsigned char *)(a1 + 72))
  {
    _HKInitializeLogging();
    id v8 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = *(void *)(a1 + 56);
      int v15 = 138544642;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      __int16 v19 = 2048;
      uint64_t v20 = a3;
      __int16 v21 = 2048;
      uint64_t v22 = v7;
      __int16 v23 = 2114;
      id v24 = v5;
      __int16 v25 = 2114;
      uint64_t v26 = v11;
      _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Sequence Record %{public}@ sync anchor (%lld) less than local sync anchor (%lld) for sync entity %{public}@. Last upload to store %{public}@ must have failed", (uint8_t *)&v15, 0x3Eu);
    }
  }
}

- (void)_requireRebaseForTarget:(void *)a1
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [v3 targetByAddingOptions:1];

  id v5 = [a1 configuration];
  uint64_t v6 = [v5 computedState];
  v8[0] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v6 replaceTargets:v7];
}

uint64_t __92__HDCloudSyncValidatePushTargetOperation__validateCurrentSequenceChangesForTarget_errorOut___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [v3 record];
  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = v5;
  id v8 = v6;
  if (v4 && +[HDCloudSyncChangeRecord isChangeRecord:v7])
  {
    uint64_t v9 = [v8 currentSequenceHeaderRecord];
    BOOL v10 = +[HDCloudSyncChangeRecord isChangeRecord:v7 inSequence:v9];

    if (v10) {
      [*(id *)(a1 + 48) addObject:v3];
    }
  }
  else
  {
  }
  return 1;
}

void __85__HDCloudSyncValidatePushTargetOperation__orderedChangeRecordSequenceRequiresRebase___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  uint64_t v10 = [*(id *)(a1 + 32) anchorForSyncEntityIdentifier:v9];
  if (a3 <= v10)
  {
    [*(id *)(a1 + 32) setAnchor:a4 forSyncEntityIdentifier:v9];
  }
  else
  {
    uint64_t v11 = v10;
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v13 = *(void **)(a1 + 48);
      int v15 = v12;
      uint64_t v16 = [v13 record];
      __int16 v17 = [v16 recordID];
      uint64_t v18 = [v17 recordName];
      int v19 = 138544386;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      uint64_t v22 = v18;
      __int16 v23 = 2114;
      id v24 = v9;
      __int16 v25 = 2048;
      uint64_t v26 = a3;
      __int16 v27 = 2048;
      uint64_t v28 = v11;
      _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [Record: %{public}@]: hole found for %{public}@: %lld != %lld", (uint8_t *)&v19, 0x34u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *a5 = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetsBySequenceToDelete, 0);

  objc_storeStrong((id *)&self->_targets, 0);
}

@end