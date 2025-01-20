@interface HDCloudSyncPushSequenceOperation
+ (BOOL)shouldLogAtOperationStart;
+ (BOOL)shouldPerformRecentRecordRollingForUnfrozenRecords:(id)a3 configuration:(id)a4;
+ (id)operationTagDependencies;
+ (id)unfrozenChangeRecordsForPushTarget:(id)a3 sequenceRecord:(id)a4 configuration:(id)a5 error:(id *)a6;
- (BOOL)hasMadeForwardProgress;
- (BOOL)syncSession:(id)a3 didEndTransactionWithError:(id *)a4;
- (HDCloudSyncPushSequenceOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncPushSequenceOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 target:(id)a5 sequence:(id)a6;
- (HDCloudSyncSequenceState)sequenceState;
- (uint64_t)_lock_finalizeNextChangeRecordForUploadToSession:(int)a3 shouldFreeze:(void *)a4 error:;
- (void)_finalizePushForSession:(uint64_t)a1;
- (void)_uploadChangesForSyncSession:(int)a3 isFinalUpload:(void *)a4 completion:;
- (void)main;
- (void)setSequenceState:(id)a3;
- (void)syncSession:(id)a3 didFinishSuccessfully:(BOOL)a4 error:(id)a5;
- (void)syncSession:(id)a3 sendChanges:(id)a4 completion:(id)a5;
- (void)syncSession:(id)a3 willSyncAnchorRanges:(id)a4;
- (void)syncSessionWillBegin:(id)a3;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncPushSequenceOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

+ (id)operationTagDependencies
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = 0x1F1764B60;
  v4[1] = 0x1F1764B80;
  v4[2] = 0x1F1764BA0;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

- (HDCloudSyncPushSequenceOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncPushSequenceOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 target:(id)a5 sequence:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HDCloudSyncPushSequenceOperation;
  v13 = [(HDCloudSyncOperation *)&v24 initWithConfiguration:a3 cloudState:a4];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_target, a5);
    objc_storeStrong((id *)&v14->_sequenceRecord, a6);
    v14->_lock._os_unfair_lock_opaque = 0;
    v15 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = v14->_taskGroup;
    v14->_taskGroup = v15;

    [(HDSynchronousTaskGroup *)v14->_taskGroup setDelegate:v14];
    uint64_t v17 = HKCreateSerialDispatchQueue();
    syncQueue = v14->_syncQueue;
    v14->_syncQueue = (OS_dispatch_queue *)v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    changeRecordsPendingPush = v14->_changeRecordsPendingPush;
    v14->_changeRecordsPendingPush = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    recordsPendingDeletion = v14->_recordsPendingDeletion;
    v14->_recordsPendingDeletion = v21;
  }
  return v14;
}

- (HDCloudSyncSequenceState)sequenceState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_sequenceState;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setSequenceState:(id)a3
{
  v5 = (HDCloudSyncSequenceState *)a3;
  if ([(HDCloudSyncOperation *)self status])
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HDCloudSyncPushSequenceOperation.m", 107, @"Invalid parameter not satisfying: %@", @"self.status == HDCloudSyncOperationStatusPending" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  sequenceState = self->_sequenceState;
  self->_sequenceState = v5;
  v7 = v5;

  BOOL v8 = [(HDCloudSyncSequenceState *)self->_sequenceState shouldClearRebaselineDeadline];
  self->_shouldClearRebaselineDeadline = v8;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)main
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  sequenceState = self->_sequenceState;
  if (sequenceState)
  {
    recordsPendingDeletion = self->_recordsPendingDeletion;
    v5 = [(HDCloudSyncSequenceState *)sequenceState recordIDsToDelete];
    [(NSMutableArray *)recordsPendingDeletion addObjectsFromArray:v5];
  }
  uint64_t v6 = [(HDCloudSyncOperation *)self progress];
  [v6 setTotalUnitCount:1000];

  id v149 = 0;
  v7 = +[HDMutableDatabaseTransactionContext contextForReadingProtectedData];
  BOOL v8 = [(HDCloudSyncOperation *)self configuration];
  v9 = [v8 accessibilityAssertion];

  if (v9) {
    [v7 addAccessibilityAssertion:v9];
  }
  v10 = [(HDCloudSyncOperation *)self configuration];
  id v11 = [v10 repository];
  id v12 = [v11 profile];
  v13 = [v12 database];
  char v14 = [v13 performTransactionWithContext:v7 error:&v149 block:&__block_literal_global_353_0 inaccessibilityHandler:0];

  id v15 = v149;
  v141 = v15;
  if (v14)
  {
    [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
    v16 = [(HDCloudSyncTarget *)self->_target store];
    v140 = objc_msgSend(v16, "syncStoreForEpoch:", -[HDCloudSyncSequenceRecord baselineEpoch](self->_sequenceRecord, "baselineEpoch"));

    sequenceRecord = self->_sequenceRecord;
    v18 = [(HDCloudSyncTarget *)self->_target storeRecord];
    v19 = [v18 tombstoneSequenceRecord];
    BOOL v20 = [(HDCloudSyncSequenceRecord *)sequenceRecord isEqual:v19];

    if (v20)
    {
      uint64_t v21 = [v140 syncStoreForTombstoneSyncOnly:1];

      v140 = (void *)v21;
    }
    v22 = [(HDCloudSyncOperation *)self configuration];
    v23 = [v22 repository];
    v138 = [v23 syncEngine];

    objc_super v24 = [(HDCloudSyncOperation *)self configuration];
    v25 = [v24 repository];
    v26 = [v25 profile];
    v27 = [v26 legacyRepositoryProfile];
    id v148 = 0;
    int v28 = HDUpgradedToSyncIdentity(v27, (uint64_t)&v148);
    id v139 = v148;

    if (v139)
    {
      -[HDSynchronousTaskGroup failTaskWithError:](self->_taskGroup, "failTaskWithError:");
LABEL_10:
      id v29 = 0;
LABEL_72:

      goto LABEL_73;
    }
    if (v28)
    {
      id v147 = 0;
      v30 = [(HDCloudSyncOperation *)self profile];
      v31 = [v30 syncIdentityManager];
      v32 = [v31 currentSyncIdentity];
      v33 = [v32 identity];

      *(void *)&long long v150 = 0;
      *((void *)&v150 + 1) = &v150;
      *(void *)&long long v151 = 0x3032000000;
      *((void *)&v151 + 1) = __Block_byref_object_copy__21;
      *(void *)&long long v152 = __Block_byref_object_dispose__21;
      *((void *)&v152 + 1) = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
      v34 = +[HDMutableDatabaseTransactionContext contextForReadingProtectedData];
      v35 = [(HDCloudSyncOperation *)self configuration];
      uint64_t v36 = [v35 accessibilityAssertion];
      v37 = [v34 contextWithAccessibilityAssertion:v36];

      v38 = [(HDCloudSyncOperation *)self profile];
      v39 = [v38 database];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __76__HDCloudSyncPushSequenceOperation__excludedSyncIdentitiesForPushWithError___block_invoke;
      v161 = (__CFString *)&unk_1E62F5CB0;
      *(void *)&long long v162 = self;
      id v40 = v33;
      *((void *)&v162 + 1) = v40;
      v163 = &v150;
      LOBYTE(v36) = [v39 performTransactionWithContext:v37 error:&v147 block:buf inaccessibilityHandler:0];

      if (v36) {
        id v135 = *(id *)(*((void *)&v150 + 1) + 40);
      }
      else {
        id v135 = 0;
      }

      _Block_object_dispose(&v150, 8);
      id v50 = v147;
      v51 = v50;
      if (!v135)
      {
        [(HDSynchronousTaskGroup *)self->_taskGroup failTaskWithError:v50];

        goto LABEL_10;
      }

      v134 = 0;
    }
    else
    {
      v41 = [(HDCloudSyncOperation *)self configuration];
      v42 = [v41 repository];
      v43 = [v42 syncIdentityManager];
      v44 = [v43 currentSyncIdentity];
      v45 = [v44 identity];

      v46 = [(HDCloudSyncOperation *)self configuration];
      v47 = [v46 computedState];
      v48 = [v47 targets];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __62__HDCloudSyncPushSequenceOperation__excludedSyncStoresForPush__block_invoke;
      v161 = (__CFString *)&unk_1E62F5C60;
      *(void *)&long long v162 = self;
      *((void *)&v162 + 1) = v45;
      id v49 = v45;
      v134 = objc_msgSend(v48, "hk_mapToSet:", buf);

      id v135 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
    v52 = [(HDCloudSyncOperation *)self configuration];
    v53 = [v52 repository];
    v54 = [v53 profile];
    v55 = [v54 cloudSyncManager];
    v56 = [(HDCloudSyncOperation *)self configuration];
    v57 = [v56 context];
    [v57 reason];
    v58 = HKCloudSyncReasonToString();
    v59 = [(HDCloudSyncOperation *)self configuration];
    v60 = [v59 accessibilityAssertion];
    v136 = [v55 syncSessionForSyncStore:v140 reason:v58 delegate:self accessibilityAssertion:v60 excludedStores:v134 excludedSyncIdentities:v135];

    [v136 setSequenceRecord:self->_sequenceRecord];
    id v146 = 0;
    v61 = objc_alloc_init(HDSyncAnchorMap);
    v62 = [HDCloudSyncCachedZone alloc];
    v63 = [(HDCloudSyncTarget *)self->_target zoneIdentifier];
    v64 = [(HDCloudSyncOperation *)self configuration];
    v65 = [v64 repository];
    v66 = [(HDCloudSyncOperation *)self configuration];
    v67 = [v66 accessibilityAssertion];
    id v68 = [(HDCloudSyncCachedZone *)v62 initForZoneIdentifier:v63 repository:v65 accessibilityAssertion:v67];

    uint64_t v69 = objc_opt_class();
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __66__HDCloudSyncPushSequenceOperation__anchorsInCloudForStore_error___block_invoke;
    v161 = (__CFString *)&unk_1E62F5BA0;
    *(void *)&long long v162 = self;
    *((void *)&v162 + 1) = v61;
    v70 = v61;
    v71 = [v68 recordsForClass:v69 error:&v146 filter:buf];
    if (v71) {
      v72 = v70;
    }
    else {
      v72 = 0;
    }
    v73 = v72;

    id v29 = v146;
    if (!v73)
    {
      [(HDSynchronousTaskGroup *)self->_taskGroup failTaskWithError:v29];
LABEL_71:

      goto LABEL_72;
    }
    id v145 = 0;
    v74 = [v138 syncAnchorRangesIfRequiredForSession:v136 startingAnchors:v73 error:&v145];
    id v75 = v145;
    v133 = v75;
    if (v74)
    {
      if (objc_msgSend(v74, "anchorRangeCount", v75))
      {
        id v144 = v29;
        id v76 = v140;
        v130 = v73;
        v131 = v76;
        v77 = [v76 shardPredicate];
        BOOL v78 = [v77 type] == 2;

        if (v78)
        {
          v132 = v131;
          v137 = v130;
          if ([(HDSyncAnchorMap *)v137 anchorCount])
          {
LABEL_39:
            _HKInitializeLogging();
            v100 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              *(void *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v132;
              *(_WORD *)&buf[22] = 2114;
              v161 = (__CFString *)v70;
              _os_log_impl(&dword_1BCB7D000, v100, OS_LOG_TYPE_DEFAULT, "%{public}@: Replace persisted anchors for store %{public}@ with (pushed-staging) %{public}@", buf, 0x20u);
            }
            v101 = [(HDCloudSyncSequenceRecord *)self->_sequenceRecord syncAnchorMap];
            if ([(HDSyncAnchorMap *)v132 replacePersistedAnchorMap:v101 error:&v144])v102 = v70; {
            else
            }
              v102 = 0;
            v103 = v102;

LABEL_64:
LABEL_66:

            id v121 = v144;
            if (v103)
            {
              v122 = [(HDCloudSyncOperation *)self configuration];
              v123 = [v122 repository];
              v124 = [v123 profile];
              v125 = [v124 database];
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __77__HDCloudSyncPushSequenceOperation__setInitialForwardProgressDateIfNecessary__block_invoke;
              v161 = (__CFString *)&unk_1E62F3208;
              *(void *)&long long v162 = self;
              [v125 performAsynchronouslySerial:buf];

              [v136 setSequenceRecord:self->_sequenceRecord];
              syncQueue = self->_syncQueue;
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __40__HDCloudSyncPushSequenceOperation_main__block_invoke;
              block[3] = &unk_1E62F31C0;
              block[4] = self;
              id v143 = v136;
              dispatch_async(syncQueue, block);
            }
            else
            {
              [(HDSynchronousTaskGroup *)self->_taskGroup failTaskWithError:v121];
            }

            id v29 = v121;
            goto LABEL_70;
          }
          v79 = v132;
          v80 = objc_alloc_init(HDSyncAnchorMap);
          v81 = +[HDMutableDatabaseTransactionContext contextForReadingProtectedData];
          v82 = [(HDCloudSyncOperation *)self configuration];
          v83 = [v82 accessibilityAssertion];
          v129 = [v81 contextWithAccessibilityAssertion:v83];

          v84 = [(HDCloudSyncOperation *)self configuration];
          v85 = [v84 repository];
          v86 = [v85 profile];
          v87 = [v86 database];
          v157[0] = MEMORY[0x1E4F143A8];
          v157[1] = 3221225472;
          v157[2] = __80__HDCloudSyncPushSequenceOperation__startingSyncAnchorMapForStagingStore_error___block_invoke;
          v157[3] = &unk_1E62F5A88;
          v157[4] = self;
          v88 = v79;
          v158 = v88;
          v70 = v80;
          v159 = v70;
          int v127 = [v87 performTransactionWithContext:v129 error:&v144 block:v157 inaccessibilityHandler:0];

          id v89 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          v90 = [(HDCloudSyncOperation *)self profile];
          v91 = [v90 syncEngine];
          v128 = [v91 allSyncEntitiesByIdentifier];

          v154[0] = MEMORY[0x1E4F143A8];
          v154[1] = 3221225472;
          v154[2] = __80__HDCloudSyncPushSequenceOperation__startingSyncAnchorMapForStagingStore_error___block_invoke_4;
          v154[3] = &unk_1E62F5C38;
          v92 = v88;
          v155 = v92;
          id v93 = v89;
          id v156 = v93;
          [v128 enumerateKeysAndObjectsUsingBlock:v154];
          long long v152 = 0u;
          long long v153 = 0u;
          long long v150 = 0u;
          long long v151 = 0u;
          id v94 = v93;
          uint64_t v95 = [v94 countByEnumeratingWithState:&v150 objects:buf count:16];
          if (v95)
          {
            uint64_t v96 = *(void *)v151;
            do
            {
              for (uint64_t i = 0; i != v95; ++i)
              {
                if (*(void *)v151 != v96) {
                  objc_enumerationMutation(v94);
                }
                [(HDSyncAnchorMap *)v70 setAnchor:0 forSyncEntityIdentifier:*(void *)(*((void *)&v150 + 1) + 8 * i)];
              }
              uint64_t v95 = [v94 countByEnumeratingWithState:&v150 objects:buf count:16];
            }
            while (v95);
          }

          if (v127) {
            v98 = v70;
          }
          else {
            v98 = 0;
          }
          v99 = v98;

          if (v99)
          {
            [(HDCloudSyncSequenceRecord *)self->_sequenceRecord updateSyncAnchorMapWithSyncAnchorMap:v99];
            goto LABEL_39;
          }
        }
        else
        {
          v132 = [(HDCloudSyncSequenceRecord *)self->_sequenceRecord frozenSyncAnchorMap];
          if (!v132) {
            v132 = objc_alloc_init(HDSyncAnchorMap);
          }
          target = self->_target;
          v108 = self->_sequenceRecord;
          v109 = [(HDCloudSyncOperation *)self configuration];
          v137 = +[HDCloudSyncPushSequenceOperation unfrozenChangeRecordsForPushTarget:target sequenceRecord:v108 configuration:v109 error:&v144];

          if (v137)
          {
            v110 = [(HDCloudSyncOperation *)self profile];
            uint64_t v111 = [v110 cloudSyncManager];
            int v112 = [(id)v111 isChild];

            v113 = [(HDCloudSyncOperation *)self configuration];
            LODWORD(v111) = +[HDCloudSyncPushSequenceOperation shouldPerformRecentRecordRollingForUnfrozenRecords:v137 configuration:v113];

            uint64_t v114 = [(HDSyncAnchorMap *)v137 count];
            int v115 = (v112 ^ 1) & v111;
            v116 = v130;
            if (v115) {
              v116 = v132;
            }
            v70 = v116;
            if (v115 == 1)
            {
              [(HDCloudSyncSequenceRecord *)self->_sequenceRecord setFirstUnfrozenChangeRecord:0];
              v117 = [(HDSyncAnchorMap *)v137 hk_map:&__block_literal_global_25];
              [(NSMutableArray *)self->_recordsPendingDeletion addObjectsFromArray:v117];
              [(HDCloudSyncSequenceRecord *)self->_sequenceRecord decrementChildRecordCount:v114];
              [(HDCloudSyncSequenceRecord *)self->_sequenceRecord resetChangeIndex:[(HDCloudSyncSequenceRecord *)self->_sequenceRecord changeIndex] - v114];
              [(HDCloudSyncSequenceRecord *)self->_sequenceRecord replaceSyncAnchorMapWithSyncAnchorMap:v132];
              self->_isPerformingRecentRecordRoll = 1;
            }
            _HKInitializeLogging();
            v118 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
            {
              v119 = @"pushed";
              *(_DWORD *)buf = 138544130;
              *(void *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2114;
              if (v115) {
                v119 = @"frozen";
              }
              *(void *)&buf[14] = v131;
              *(_WORD *)&buf[22] = 2114;
              v161 = v119;
              LOWORD(v162) = 2114;
              *(void *)((char *)&v162 + 2) = v70;
              _os_log_impl(&dword_1BCB7D000, v118, OS_LOG_TYPE_DEFAULT, "%{public}@: Replace persisted anchors for store %{public}@ with (%{public}@) %{public}@", buf, 0x2Au);
            }
            if ([v131 replacePersistedAnchorMap:v70 error:&v144]) {
              v120 = v70;
            }
            else {
              v120 = 0;
            }
            v103 = v120;
            goto LABEL_64;
          }
        }
        v103 = 0;
        goto LABEL_66;
      }
      id v104 = v136;
      [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
      v105 = self->_syncQueue;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __67__HDCloudSyncPushSequenceOperation__synthesizeEmptySyncForSession___block_invoke;
      v161 = (__CFString *)&unk_1E62F31C0;
      *(void *)&long long v162 = self;
      id v106 = v104;
      *((void *)&v162 + 1) = v106;
      dispatch_async(v105, buf);

      [(HDSynchronousTaskGroup *)self->_taskGroup finishTask];
    }
    else
    {
      [(HDSynchronousTaskGroup *)self->_taskGroup failTaskWithError:v75];
    }
LABEL_70:

    goto LABEL_71;
  }
  [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v15];
LABEL_73:
}

uint64_t __40__HDCloudSyncPushSequenceOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 128);
  id v4 = *(id *)(a1 + 40);
  dispatch_assert_queue_V2(v3);
  v5 = [(id)v2 configuration];
  uint64_t v6 = [v5 repository];
  v7 = [v6 syncEngine];

  [*(id *)(v2 + 136) beginTask];
  BOOL v8 = [(id)v2 configuration];
  v9 = [v8 accessibilityAssertion];
  id v35 = 0;
  char v10 = [v7 performSyncSession:v4 accessibilityAssertion:v9 error:&v35];

  id v11 = v35;
  if (v10)
  {
    v32 = v7;
    id v34 = v11;
    id v12 = objc_alloc_init(HDSyncAnchorMap);
    v13 = [*(id *)(v2 + 104) store];
    char v14 = [(id)v2 configuration];
    id v15 = [v14 repository];
    v16 = [v15 profile];
    uint64_t v17 = [v16 legacyRepositoryProfile];
    v33 = v12;
    BOOL v18 = +[HDSyncAnchorEntity getSyncAnchorsOfType:0 anchorMap:v12 store:v13 profile:v17 error:&v34];

    if (v18)
    {
      v31 = [(id)v2 configuration];
      uint64_t v19 = [v31 syncDate];
      BOOL v20 = [*(id *)(v2 + 104) store];
      uint64_t v21 = [(id)v2 configuration];
      v22 = [v21 repository];
      v23 = [v22 profile];
      objc_super v24 = [v23 legacyRepositoryProfile];
      v25 = (void *)v19;
      BOOL v26 = +[HDSyncAnchorEntity updateSyncAnchorsWithMap:v33 type:3 updateDate:v19 store:v20 updatePolicy:2 resetInvalid:0 profile:v24 error:&v34];
    }
    else
    {
      BOOL v26 = 0;
    }

    id v27 = v34;
    int v28 = *(void **)(v2 + 136);
    v7 = v32;
    if (v26) {
      [v28 finishTask];
    }
    else {
      [v28 failTaskWithError:v27];
    }
    id v11 = v27;
  }
  else
  {
    [*(id *)(v2 + 136) failTaskWithError:v11];
  }

  id v29 = *(void **)(*(void *)(a1 + 32) + 136);

  return [v29 finishTask];
}

uint64_t __66__HDCloudSyncPushSequenceOperation__anchorsInCloudForStore_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 sequenceRecordID];
  v5 = [*(id *)(*(void *)(a1 + 32) + 112) recordID];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    v7 = [v3 decodedSyncAnchorRangeMap];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__HDCloudSyncPushSequenceOperation__anchorsInCloudForStore_error___block_invoke_2;
    v9[3] = &unk_1E62F5B78;
    id v10 = *(id *)(a1 + 40);
    [v7 enumerateAnchorRangesAndEntityIdentifiersWithBlock:v9];
  }
  return 0;
}

void __66__HDCloudSyncPushSequenceOperation__anchorsInCloudForStore_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  if (a4 > objc_msgSend(*(id *)(a1 + 32), "anchorForSyncEntityIdentifier:")) {
    [*(id *)(a1 + 32) setAnchor:a4 forSyncEntityIdentifier:v6];
  }
}

uint64_t __92__HDCloudSyncPushSequenceOperation__prepareLocalSyncAnchorMapForStore_anchorsInCloud_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 recordID];
}

uint64_t __80__HDCloudSyncPushSequenceOperation__startingSyncAnchorMapForStagingStore_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v5 = [*(id *)(a1 + 32) configuration];
  id v6 = [v5 computedState];
  v7 = [v6 pushTargets];

  id obj = v7;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v44;
    id v34 = v40;
    uint64_t v35 = v4;
    uint64_t v33 = *(void *)v44;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v36 = v9;
      do
      {
        if (*(void *)v44 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v43 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "store", v33, v34);
        char v14 = [v13 storeIdentifier];
        id v15 = [*(id *)(v4 + 40) storeIdentifier];
        char v16 = [v14 isEqual:v15];

        if ((v16 & 1) == 0)
        {
          uint64_t v17 = [v12 storeRecord];
          if (v17)
          {
            BOOL v18 = (void *)v17;
            v38 = [*(id *)(v4 + 32) configuration];
            uint64_t v19 = [v38 cachedCloudState];
            BOOL v20 = [v18 recordID];
            uint64_t v21 = [*(id *)(v4 + 32) configuration];
            v22 = [v21 repository];
            [v22 primaryCKContainer];
            objc_super v24 = v23 = a3;
            v25 = [v24 containerIdentifier];
            BOOL v26 = [v19 zoneForRecordID:v20 containerIdentifier:v25 error:v23];

            a3 = v23;
            id v27 = v18;

            uint64_t v4 = v35;
            if (!v26) {
              goto LABEL_14;
            }
            uint64_t v28 = objc_opt_class();
            v39[0] = MEMORY[0x1E4F143A8];
            v39[1] = 3221225472;
            v40[0] = __80__HDCloudSyncPushSequenceOperation__startingSyncAnchorMapForStagingStore_error___block_invoke_2;
            v40[1] = &unk_1E62F5C10;
            id v29 = v18;
            id v41 = v29;
            id v42 = *(id *)(v35 + 48);
            v30 = [v26 recordsForClass:v28 error:v23 filter:v39];

            if (!v30)
            {
LABEL_14:

              uint64_t v31 = 0;
              goto LABEL_15;
            }

            uint64_t v10 = v33;
            uint64_t v9 = v36;
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v31 = 1;
LABEL_15:

  return v31;
}

uint64_t __80__HDCloudSyncPushSequenceOperation__startingSyncAnchorMapForStagingStore_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 storeIdentifier];
  v5 = [*(id *)(a1 + 32) storeIdentifier];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    v7 = [v3 syncAnchorMap];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__HDCloudSyncPushSequenceOperation__startingSyncAnchorMapForStagingStore_error___block_invoke_3;
    v9[3] = &unk_1E62F5BE8;
    id v10 = *(id *)(a1 + 40);
    [v7 enumerateAnchorsAndEntityIdentifiersWithBlock:v9];
  }
  return 0;
}

void __80__HDCloudSyncPushSequenceOperation__startingSyncAnchorMapForStagingStore_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "anchorForSyncEntityIdentifier:") < a3) {
    [*(id *)(a1 + 32) setAnchor:a3 forSyncEntityIdentifier:v5];
  }
}

void __80__HDCloudSyncPushSequenceOperation__startingSyncAnchorMapForStagingStore_error___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(a3, "syncEntityDependenciesForSyncProtocolVersion:", objc_msgSend(*(id *)(a1 + 32), "protocolVersion"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(a1 + 40);
        id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) syncEntityIdentifier];
        [v9 addObject:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

uint64_t __67__HDCloudSyncPushSequenceOperation__synthesizeEmptySyncForSession___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Synthesizing empty sync (no anchors require push).", (uint8_t *)&v5, 0xCu);
  }
  -[HDCloudSyncPushSequenceOperation _finalizePushForSession:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  return [*(id *)(*(void *)(a1 + 32) + 136) finishTask];
}

- (void)_finalizePushForSession:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    uint64_t v4 = [*(id *)(a1 + 144) archiveCreator];
    int v5 = [v4 archiveIsValid];

    if (v5)
    {
      id v12 = 0;
      char v6 = -[HDCloudSyncPushSequenceOperation _lock_finalizeNextChangeRecordForUploadToSession:shouldFreeze:error:](a1, v3, 0, &v12);
      id v7 = v12;
      uint64_t v8 = v7;
      if ((v6 & 1) == 0)
      {
        [*(id *)(a1 + 144) finishProgress];
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
        goto LABEL_7;
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
    [*(id *)(a1 + 136) beginTask];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__HDCloudSyncPushSequenceOperation__finalizePushForSession___block_invoke;
    v9[3] = &unk_1E62F5D48;
    id v10 = v3;
    uint64_t v11 = a1;
    -[HDCloudSyncPushSequenceOperation _uploadChangesForSyncSession:isFinalUpload:completion:](a1, v10, 1, v9);
    uint64_t v8 = v10;
LABEL_7:
  }
}

id __62__HDCloudSyncPushSequenceOperation__excludedSyncStoresForPush__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 purpose])
  {
    uint64_t v4 = [*(id *)(a1 + 32) configuration];
    int v5 = [v4 repository];
    char v6 = [v3 container];
    id v7 = [v5 cachedOwnerIdentifierForContainer:v6];

    uint64_t v8 = [v3 storeRecord];
    uint64_t v9 = [v8 pendingOwner];
    id v10 = [v7 string];
    char v11 = [v9 isEqualToString:v10];

    if ((v11 & 1) != 0
      || ([v3 storeRecord],
          id v12 = objc_claimAutoreleasedReturnValue(),
          [v12 pendingSyncIdentity],
          long long v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v13 isEqual:*(void *)(a1 + 40)],
          v13,
          v12,
          (v14 & 1) != 0))
    {
      id v15 = 0;
    }
    else
    {
      id v15 = [v3 store];
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

BOOL __76__HDCloudSyncPushSequenceOperation__excludedSyncIdentitiesForPushWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  char v6 = *(void **)(a1 + 32);
  id v75 = v5;
  v72 = a3;
  if (v6)
  {
    id v7 = v5;
    uint64_t v8 = [v6 profile];
    uint64_t v9 = [v8 syncIdentityManager];
    *(void *)&long long v84 = 0;
    id v10 = [v9 childIdentitiesForCurrentSyncIdentityWithTransaction:v7 error:&v84];

    id v11 = (id)v84;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      _HKInitializeLogging();
      long long v13 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v89 = v6;
        __int16 v90 = 2114;
        id v91 = v11;
        _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Unable to get child sync identities from local storage: %{public}@", buf, 0x16u);
      }
      id v14 = v11;
      if (v14)
      {
        if (a3) {
          *a3 = v14;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    id v10 = 0;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v16 = [*(id *)(a1 + 32) configuration];
  uint64_t v17 = [v16 computedState];
  BOOL v18 = [v17 targets];
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __76__HDCloudSyncPushSequenceOperation__excludedSyncIdentitiesForPushWithError___block_invoke_2;
  v78[3] = &unk_1E62F5C88;
  id v19 = v10;
  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v21 = *(void **)(a1 + 40);
  id v74 = v19;
  id v79 = v19;
  uint64_t v80 = v20;
  id v81 = v21;
  id v22 = v15;
  id v82 = v22;
  [v18 enumerateObjectsUsingBlock:v78];

  uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + 104) storeRecord];
  objc_super v24 = [v23 sequenceRecord];
  v25 = [v24 includedSyncIdentities];
  id v76 = v22;
  [v22 minusSet:v25];

  uint64_t v73 = a1;
  BOOL v26 = *(void **)(a1 + 32);
  if (!v26)
  {
    id v64 = 0;
    v39 = v75;
    goto LABEL_53;
  }
  id v27 = [*(id *)(a1 + 32) profile];
  uint64_t v28 = [v27 syncIdentityManager];
  id v29 = [v28 legacySyncIdentity];
  v30 = [v29 identity];

  uint64_t v31 = [HDKeyValueDomain alloc];
  v32 = [v26 profile];
  uint64_t v33 = [(HDKeyValueDomain *)v31 initWithCategory:0 domainName:@"CloudSync" profile:v32];

  uint64_t v34 = *MEMORY[0x1E4F2BDA8];
  *(void *)&long long v84 = 0;
  uint64_t v35 = [(HDKeyValueDomain *)v33 numberForKey:v34 error:&v84];
  id v36 = (id)v84;
  if (v35 && [v35 BOOLValue])
  {
    [v76 removeObject:v30];
    _HKInitializeLogging();
    v37 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v89 = v26;
      _os_log_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: Not excluding legacySyncIdentity because device is paired to old watch", buf, 0xCu);
    }
    goto LABEL_21;
  }
  if (!v36)
  {
LABEL_21:
    id v42 = [v26 profile];
    long long v43 = [v42 daemon];
    long long v44 = [v43 behavior];
    int v45 = [v44 isAppleWatch];

    if (v45) {
      [v76 addObject:v30];
    }
    id v40 = 0;
    char v41 = 1;
    v39 = v75;
    goto LABEL_24;
  }
  _HKInitializeLogging();
  v38 = *MEMORY[0x1E4F29FA8];
  v39 = v75;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v89 = v26;
    __int16 v90 = 2114;
    id v91 = v36;
    _os_log_error_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_ERROR, "%{public}@: Unable to read if device HasEverBeenPairedToOldWatch: %{public}@", buf, 0x16u);
  }
  id v40 = v36;
  char v41 = 0;
LABEL_24:

  id v46 = v40;
  if ((v41 & 1) == 0)
  {
    id v63 = v46;
    id v64 = v63;
    if (v63)
    {
      v65 = v74;
      if (v72)
      {
        id v64 = v63;
        void *v72 = v64;
      }
      else
      {
        _HKLogDroppedError();
      }
      goto LABEL_54;
    }
LABEL_53:
    v65 = v74;
LABEL_54:

    BOOL v68 = 0;
    goto LABEL_55;
  }
  id v71 = v46;
  v47 = *(void **)(v73 + 32);
  id v48 = v76;
  id v49 = v39;
  if (v47)
  {
    id v77 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v70 = v48;
    id v50 = v48;
    uint64_t v51 = [v50 countByEnumeratingWithState:&v84 objects:buf count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v85;
      while (2)
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v85 != v53) {
            objc_enumerationMutation(v50);
          }
          uint64_t v55 = *(void *)(*((void *)&v84 + 1) + 8 * i);
          v56 = [v47 profile];
          v57 = [v56 syncIdentityManager];
          id v83 = 0;
          v58 = [v57 concreteIdentityForIdentity:v55 shouldCreate:0 transaction:v49 error:&v83];
          id v59 = v83;

          if (v58) {
            BOOL v60 = 1;
          }
          else {
            BOOL v60 = v59 == 0;
          }
          if (!v60)
          {
            if (v72) {
              void *v72 = v59;
            }
            else {
              _HKLogDroppedError();
            }
            id v48 = v70;

            id v62 = 0;
            v61 = v77;
            goto LABEL_49;
          }
          if (v58) {
            [v77 addObject:v58];
          }
        }
        uint64_t v52 = [v50 countByEnumeratingWithState:&v84 objects:buf count:16];
        if (v52) {
          continue;
        }
        break;
      }
    }

    v61 = v77;
    id v62 = v77;
    id v48 = v70;
LABEL_49:
  }
  else
  {
    id v62 = 0;
  }
  v39 = v75;
  id v64 = v71;

  uint64_t v66 = *(void *)(*(void *)(v73 + 48) + 8);
  v67 = *(void **)(v66 + 40);
  *(void *)(v66 + 40) = v62;

  BOOL v68 = *(void *)(*(void *)(*(void *)(v73 + 48) + 8) + 40) != 0;
  v65 = v74;
LABEL_55:

  return v68;
}

void __76__HDCloudSyncPushSequenceOperation__excludedSyncIdentitiesForPushWithError___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![v3 purpose]) {
    goto LABEL_14;
  }
  uint64_t v4 = [v3 storeRecord];
  uint64_t v5 = [v4 syncIdentity];
  if (!v5)
  {

    goto LABEL_7;
  }
  char v6 = (void *)v5;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v3 storeRecord];
  uint64_t v9 = [v8 syncIdentity];
  LODWORD(v7) = [v7 containsObject:v9];

  if (!v7)
  {
LABEL_7:
    id v15 = [*(id *)(a1 + 40) configuration];
    uint64_t v16 = [v15 repository];
    uint64_t v17 = [v3 container];
    long long v13 = [v16 cachedOwnerIdentifierForContainer:v17];

    BOOL v18 = [v3 storeRecord];
    id v19 = [v18 pendingOwner];
    uint64_t v20 = [v13 string];
    char v21 = [v19 isEqualToString:v20];

    if ((v21 & 1) == 0)
    {
      id v22 = [v3 storeRecord];
      uint64_t v23 = [v22 pendingSyncIdentity];
      char v24 = [v23 isEqual:*(void *)(a1 + 48)];

      if ((v24 & 1) == 0)
      {
        v25 = [v3 storeRecord];
        BOOL v26 = [v25 syncIdentity];

        if (v26)
        {
          id v27 = *(void **)(a1 + 56);
          uint64_t v28 = [v3 storeRecord];
          id v29 = [v28 syncIdentity];
          [v27 addObject:v29];
        }
        v30 = [v3 storeRecord];
        uint64_t v31 = [v30 sequenceRecord];
        v32 = [v31 includedSyncIdentities];

        if (v32)
        {
          uint64_t v33 = *(void **)(a1 + 56);
          uint64_t v34 = [v3 storeRecord];
          uint64_t v35 = [v34 sequenceRecord];
          id v36 = [v35 includedSyncIdentities];
          [v33 unionSet:v36];
        }
      }
    }
    goto LABEL_13;
  }
  _HKInitializeLogging();
  id v10 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = v10;
    long long v13 = [v3 storeRecord];
    id v14 = [v13 syncIdentity];
    int v37 = 138543618;
    uint64_t v38 = v11;
    __int16 v39 = 2114;
    id v40 = v14;
    _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Not excluding my child %{public}@ from push.", (uint8_t *)&v37, 0x16u);

LABEL_13:
  }
LABEL_14:
}

uint64_t __69__HDCloudSyncPushSequenceOperation__validateArchiveFileHandle_error___block_invoke(uint64_t result)
{
  return result;
}

- (uint64_t)_lock_finalizeNextChangeRecordForUploadToSession:(int)a3 shouldFreeze:(void *)a4 error:
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 120));
    uint64_t v8 = [*(id *)(a1 + 144) pendingAnchorRangeMap];
    uint64_t v9 = [v8 anchorRangeCount];

    if (v9)
    {
      id v10 = [*(id *)(a1 + 144) archiveCreator];
      char v11 = [v10 archiveIsValid];

      if (v11)
      {
        id v12 = [*(id *)(a1 + 144) pendingAnchorRangeMap];
        long long v13 = +[HDSyncAnchorMap syncAnchorMapWithSyncAnchorRangeMap:v12];

        id v14 = [*(id *)(a1 + 144) archiveCreator];
        [v14 closeArchive];

        id v15 = [v7 sequenceRecord];
        uint64_t v16 = v15;
        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 718, @"No sequence record for current session.");
          a1 = 0;
LABEL_54:

          goto LABEL_55;
        }
        [v15 incrementChangeIndex];
        [v16 updateSyncAnchorMapWithSyncAnchorMap:v13];
        uint64_t v17 = [*(id *)(a1 + 144) archiveCreator];
        BOOL v18 = [v17 fileHandle];

        id v19 = v18;
        if ([v19 seekToOffset:0 error:a4])
        {
          uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F2B9C8]) initWithFileHandle:v19];
          uint64_t v67 = 0;
          BOOL v68 = &v67;
          uint64_t v69 = 0x2020000000;
          uint64_t v70 = 0;
          v65[4] = &v67;
          id v66 = 0;
          v65[0] = MEMORY[0x1E4F143A8];
          v65[1] = 3221225472;
          v65[2] = __69__HDCloudSyncPushSequenceOperation__validateArchiveFileHandle_error___block_invoke;
          v65[3] = &unk_1E62F5CD8;
          char v21 = [v20 enumerateEntriesWithError:&v66 block:v65];
          id v22 = v66;
          if (v21)
          {

            _Block_object_dispose(&v67, 8);
            uint64_t v23 = [HDCloudSyncChangeRecord alloc];
            char v24 = [*(id *)(a1 + 144) pendingAnchorRangeMap];
            v25 = -[HDCloudSyncChangeRecord initWithSyncAnchorRangeMap:finalForSequence:changesetArchiveFileHandle:sequenceRecord:protocolVersion:](v23, "initWithSyncAnchorRangeMap:finalForSequence:changesetArchiveFileHandle:sequenceRecord:protocolVersion:", v24, [*(id *)(a1 + 144) hasOpenSequence] ^ 1, v19, v16, 16);

            id v64 = 0;
            id v62 = v25;
            BOOL v26 = [(HDCloudSyncRecord *)v25 validateWithError:&v64];
            id v27 = v64;
            uint64_t v28 = v27;
            if (v26)
            {

              v65[0] = 0;
              id v63 = 0;
              char v29 = [v19 seekToEndReturningOffset:v65 error:&v63];
              id v30 = v63;
              if (v29)
              {
                uint64_t v31 = v65[0];
                v32 = [(HDCloudSyncChangeRecord *)v62 changeSize];
                LOBYTE(v31) = v31 == [v32 unsignedLongLongValue];

                if (v31)
                {
                  if (a3 && *(unsigned char *)(a1 + 168))
                  {
                    _HKInitializeLogging();
                    uint64_t v33 = *MEMORY[0x1E4F29FA8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      uint64_t v72 = a1;
                      __int16 v73 = 2114;
                      unint64_t v74 = (unint64_t)v13;
                      _os_log_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Update sequence record's frozen sync anchors with %{public}@", buf, 0x16u);
                    }
                    [v16 updateFrozenSyncAnchorMapWithSyncAnchorMap:v13];
                    [v16 setFirstUnfrozenChangeRecord:0];
                  }
                  else
                  {
                    int v45 = [v16 firstUnfrozenChangeRecord];
                    BOOL v46 = v45 == 0;

                    if (v46)
                    {
                      v47 = [(HDCloudSyncRecord *)v62 record];
                      id v48 = [v47 recordID];
                      [v16 setFirstUnfrozenChangeRecord:v48];
                    }
                  }
                  unint64_t v49 = [*(id *)(a1 + 144) archiveSize];
                  _HKInitializeLogging();
                  id v50 = (void *)*MEMORY[0x1E4F29FA8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v51 = *(void **)(a1 + 144);
                    uint64_t v52 = v50;
                    uint64_t v53 = [v51 pendingAnchorRangeMap];
                    *(_DWORD *)buf = 138543874;
                    uint64_t v72 = a1;
                    __int16 v73 = 2048;
                    unint64_t v74 = v49;
                    __int16 v75 = 2114;
                    id v76 = v53;
                    _os_log_impl(&dword_1BCB7D000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@: Finalized change record for push: assetSize: (%llu), anchorRangeMap: %{public}@", buf, 0x20u);
                  }
                  if (v49 > 0x100000)
                  {
                    v54 = [(id)a1 configuration];
                    uint64_t v55 = [v54 operationGroup];
                    [v55 setExpectedSendSize:2];
                  }
                  [*(id *)(a1 + 152) addObject:v62];
                  a1 = 1;
                  goto LABEL_52;
                }
                _HKInitializeLogging();
                id v42 = (void *)*MEMORY[0x1E4F29FA8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
                {
                  BOOL v60 = v42;
                  v61 = [(HDCloudSyncChangeRecord *)v62 changeSize];
                  *(_DWORD *)buf = 138543874;
                  uint64_t v72 = a1;
                  __int16 v73 = 2114;
                  unint64_t v74 = (unint64_t)v61;
                  __int16 v75 = 2048;
                  id v76 = (void *)v65[0];
                  _os_log_fault_impl(&dword_1BCB7D000, v60, OS_LOG_TYPE_FAULT, "%{public}@: Change size %{public}@ does not match computed file size: %llu", buf, 0x20u);
                }
                long long v43 = (void *)MEMORY[0x1E4F28C58];
                long long v44 = [(HDCloudSyncChangeRecord *)v62 changeSize];
                objc_msgSend(v43, "hk_assignError:code:format:", a4, 709, @"Change size %@ does not match computed file size: %llu", v44, v65[0]);
              }
              else
              {
                _HKInitializeLogging();
                uint64_t v38 = *MEMORY[0x1E4F29FA8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  uint64_t v72 = a1;
                  __int16 v73 = 2114;
                  unint64_t v74 = (unint64_t)v30;
                  _os_log_error_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_ERROR, "%{public}@: Failed to compute archive file size: %{public}@", buf, 0x16u);
                }
                id v39 = v30;
                id v40 = v39;
                if (v39)
                {
                  if (a4) {
                    *a4 = v39;
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
              id v36 = *MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543618;
                uint64_t v72 = a1;
                __int16 v73 = 2114;
                unint64_t v74 = (unint64_t)v28;
                _os_log_fault_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_FAULT, "%{public}@: Failed to validate store record after creation: %{public}@", buf, 0x16u);
              }
              id v37 = v28;
              id v30 = v37;
              if (v37)
              {
                if (a4) {
                  *a4 = v37;
                }
                else {
                  _HKLogDroppedError();
                }
              }
            }
            a1 = 0;
LABEL_52:

            goto LABEL_53;
          }
          id v34 = v22;
          uint64_t v35 = v34;
          if (v34)
          {
            if (a4) {
              *a4 = v34;
            }
            else {
              _HKLogDroppedError();
            }
          }

          _HKInitializeLogging();
          uint64_t v41 = (id)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            v56 = [*(id *)(a1 + 144) archiveURL];
            v57 = [v56 path];
            v58 = (void *)v68[3];
            *(_DWORD *)buf = 138544130;
            uint64_t v72 = a1;
            __int16 v73 = 2114;
            unint64_t v74 = (unint64_t)v57;
            __int16 v75 = 2048;
            id v76 = v58;
            __int16 v77 = 2114;
            BOOL v78 = v35;
            _os_log_error_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_ERROR, "%{public}@: Failed to validate change record archive %{public}@ (enumerated %lld entries): %{public}@", buf, 0x2Au);
          }
          _Block_object_dispose(&v67, 8);
        }
        else
        {
        }
        a1 = 0;
LABEL_53:

        goto LABEL_54;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 717, @"Unable to create change record with invalid archive.");
      a1 = 0;
    }
    else
    {
      a1 = 1;
    }
  }
LABEL_55:

  return a1;
}

- (void)_uploadChangesForSyncSession:(int)a3 isFinalUpload:(void *)a4 completion:
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (a1)
  {
    uint64_t v8 = [a2 sequenceRecord];
    if (!v8)
    {
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 718, @"No sequence record for current session.");
      v7[2](v7, 0, v17);
LABEL_31:

      goto LABEL_32;
    }
    uint64_t v9 = [*(id *)(a1 + 104) store];
    id v10 = [v9 shardPredicate];
    char v11 = [*(id *)(a1 + 104) storeRecord];
    [v11 setShardPredicate:v10];

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    id v12 = objc_msgSend(*(id *)(a1 + 152), "hk_map:", &__block_literal_global_337);
    uint64_t v13 = [v12 mutableCopy];

    [*(id *)(a1 + 152) removeAllObjects];
    id v76 = (void *)[*(id *)(a1 + 160) copy];
    id v14 = *(void **)(a1 + 160);
    *(void *)(a1 + 160) = 0;

    __int16 v75 = (void *)v13;
    if (!a3)
    {
      char v18 = 0;
LABEL_12:
      unint64_t v74 = v8;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
      uint64_t v23 = [*(id *)(a1 + 104) storeRecord];
      char v24 = [v23 record];
      v25 = [v24 modificationDate];
      BOOL v26 = [(id)a1 configuration];
      id v27 = [v26 syncDate];
      [v25 timeIntervalSinceDate:v27];
      double v29 = v28;

      if ((v18 & 1) != 0 || v29 < -1209600.0 || [v76 count] || objc_msgSend(v75, "count"))
      {
        _HKInitializeLogging();
        id v30 = (os_log_t *)MEMORY[0x1E4F29FA8];
        uint64_t v31 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          v32 = "interim";
          if (a3) {
            v32 = "FINAL";
          }
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = a1;
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v32;
          _os_log_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: Uploading %{public}s changeset record to CloudKit", buf, 0x16u);
        }
        __int16 v73 = v7;
        uint64_t v33 = [(id)a1 configuration];
        id v34 = [v33 repository];
        uint64_t v35 = [v34 behavior];

        id v36 = [v35 currentDeviceProductType];
        id v37 = [*(id *)(a1 + 104) storeRecord];
        [v37 setProductType:v36];

        uint64_t v38 = [v35 currentOSBuild];
        id v39 = [*(id *)(a1 + 104) storeRecord];
        [v39 setSystemBuildVersion:v38];

        id v40 = [v35 currentDeviceDisplayName];
        uint64_t v41 = [*(id *)(a1 + 104) storeRecord];
        [v41 setDeviceName:v40];

        id v42 = [*(id *)(a1 + 104) storeRecord];
        [v42 setSupportedProtocolVersion:0];

        long long v43 = [*(id *)(a1 + 104) storeRecord];
        [v43 setRequiredProtocolVersion:0];

        long long v44 = [(id)a1 configuration];
        int v45 = [v44 repository];
        uint64_t v46 = [v45 deviceMode];
        v47 = [*(id *)(a1 + 104) storeRecord];
        [v47 setDeviceMode:v46];

        id v48 = [*(id *)(a1 + 104) storeRecord];
        unint64_t v49 = [v48 record];
        [v75 addObject:v49];

        id v50 = [v74 record];
        [v75 addObject:v50];

        uint64_t v51 = *(void **)(a1 + 176);
        if (v51)
        {
          uint64_t v52 = [v51 recordsToSave];
          [v75 addObjectsFromArray:v52];

          uint64_t v53 = *(void **)(a1 + 176);
          *(void *)(a1 + 176) = 0;
        }
        uint64_t v72 = [(id)a1 configuration];
        id v71 = [v72 repository];
        v54 = [v71 primaryCKContainer];
        uint64_t v55 = [v54 containerIdentifier];
        id v56 = v75;
        id v57 = v76;
        id v58 = v55;
        id v59 = v73;
        BOOL v60 = [(id)a1 configuration];
        v61 = [v60 repository];
        id v62 = [v61 containerForContainerIdentifier:v58];

        if (v62)
        {
          id v63 = objc_msgSend(v56, "hk_map:", &__block_literal_global_345);
          _HKInitializeLogging();
          id v64 = *v30;
          if (os_log_type_enabled(*v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138544130;
            *(void *)&uint8_t buf[4] = a1;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v63;
            *(_WORD *)&buf[22] = 2114;
            uint64_t v80 = v57;
            LOWORD(v81) = 2114;
            *(void *)((char *)&v81 + 2) = v62;
            _os_log_impl(&dword_1BCB7D000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@: save:%{public}@, delete:%{public}@ container:%{public}@", buf, 0x2Au);
          }
          v65 = [HDCloudSyncModifyRecordsOperation alloc];
          id v66 = [(id)a1 configuration];
          uint64_t v67 = [(HDCloudSyncModifyRecordsOperation *)v65 initWithConfiguration:v66 container:v62 recordsToSave:v56 recordIDsToDelete:v57];

          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __90__HDCloudSyncPushSequenceOperation__pushRecords_recordIDsToDelete_containerID_completion___block_invoke_347;
          uint64_t v80 = &unk_1E62F3F60;
          *(void *)&long long v81 = a1;
          id v68 = v59;
          *((void *)&v81 + 1) = v68;
          [(HDCloudSyncOperation *)v67 setOnError:buf];
          v77[0] = MEMORY[0x1E4F143A8];
          v77[1] = 3221225472;
          v77[2] = __90__HDCloudSyncPushSequenceOperation__pushRecords_recordIDsToDelete_containerID_completion___block_invoke_349;
          v77[3] = &unk_1E62F5D20;
          v77[4] = a1;
          id v78 = v68;
          [(HDCloudSyncOperation *)v67 setOnSuccess:v77];
          [(HDCloudSyncOperation *)v67 start];
        }
        else
        {
          _HKInitializeLogging();
          uint64_t v69 = *v30;
          if (os_log_type_enabled(*v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = a1;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v58;
            _os_log_error_impl(&dword_1BCB7D000, v69, OS_LOG_TYPE_ERROR, "%{public}@: Container not found for container ID: %{public}@", buf, 0x16u);
          }
          id v63 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 723, @"Invalid container ID %@", v58);
          (*((void (**)(id, void, void *))v59 + 2))(v59, 0, v63);
        }
        uint64_t v8 = v74;

        id v7 = (void (**)(id, void, void *))v73;
      }
      else
      {
        _HKInitializeLogging();
        uint64_t v70 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = a1;
          _os_log_impl(&dword_1BCB7D000, v70, OS_LOG_TYPE_DEFAULT, "%{public}@: No upload required at the present time; skipping record save.",
            buf,
            0xCu);
        }
        *(unsigned char *)(a1 + 184) = 1;
        v7[2](v7, 1, 0);
        uint64_t v8 = v74;
      }
      uint64_t v17 = v75;

      goto LABEL_31;
    }
    id v15 = [*(id *)(a1 + 104) storeRecord];
    uint64_t v16 = [v15 pendingOwner];
    if (v16)
    {
    }
    else
    {
      id v19 = [*(id *)(a1 + 104) storeRecord];
      uint64_t v20 = [v19 pendingSyncIdentity];

      if (!v20)
      {
        char v18 = 0;
LABEL_10:
        if (([v8 isActive] & 1) == 0)
        {
          char v18 = 1;
          [v8 setActive:1];
        }
        goto LABEL_12;
      }
    }
    char v21 = [*(id *)(a1 + 104) storeRecord];
    [v21 setPendingOwner:0];

    id v22 = [*(id *)(a1 + 104) storeRecord];
    [v22 setPendingSyncIdentity:0];

    char v18 = 1;
    goto LABEL_10;
  }
LABEL_32:
}

uint64_t __90__HDCloudSyncPushSequenceOperation__uploadChangesForSyncSession_isFinalUpload_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 record];
}

uint64_t __90__HDCloudSyncPushSequenceOperation__pushRecords_recordIDsToDelete_containerID_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 recordID];
}

void __90__HDCloudSyncPushSequenceOperation__pushRecords_recordIDsToDelete_containerID_completion___block_invoke_347(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to upload changes: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __90__HDCloudSyncPushSequenceOperation__pushRecords_recordIDsToDelete_containerID_completion___block_invoke_349(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully uploaded changes", (uint8_t *)&buf, 0xCu);
  }
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 configuration];
  uint64_t v6 = [v5 repository];
  int v7 = [v6 profile];
  uint64_t v8 = [v7 database];
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  v25 = __62__HDCloudSyncPushSequenceOperation__recordForwardProgressDate__block_invoke;
  BOOL v26 = &unk_1E62F3208;
  id v27 = v4;
  [v8 performAsynchronouslySerial:&buf];

  *(unsigned char *)(*(void *)(a1 + 32) + 184) = 1;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120));
  uint64_t v9 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v9 + 169)) {
    goto LABEL_16;
  }
  id v10 = [*(id *)(v9 + 104) store];
  *(void *)&long long buf = 0;
  uint64_t v11 = [v10 persistedStateWithError:&buf];
  id v12 = (id)buf;

  if (v11)
  {
    uint64_t v13 = [v11 stateByResettingRebaselineDeadline];

    id v14 = [*(id *)(v9 + 104) store];
    id v23 = v12;
    char v15 = [v14 persistState:v13 error:&v23];
    id v16 = v23;

    if (v15)
    {
      id v17 = 0;
      int v18 = 1;
      goto LABEL_14;
    }
    id v19 = v16;
    if (!v19)
    {
      id v17 = 0;
      int v18 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    id v19 = v12;
    id v17 = 0;
    if (!v19)
    {
      int v18 = 1;
      uint64_t v13 = 0;
      goto LABEL_13;
    }
    uint64_t v13 = 0;
  }
  id v17 = v19;
  int v18 = 0;
LABEL_13:

  id v16 = v17;
LABEL_14:

  id v20 = v17;
  char v21 = v20;
  uint64_t v22 = *(void *)(a1 + 32);
  if (v18)
  {
    *(unsigned char *)(v22 + 169) = 0;

    uint64_t v9 = *(void *)(a1 + 32);
LABEL_16:
    os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 120));
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    return;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v22 + 120));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __60__HDCloudSyncPushSequenceOperation__finalizePushForSession___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [*(id *)(a1 + 32) syncStore];
    id v32 = 0;
    int v7 = [v6 persistedStateWithError:&v32];
    id v8 = v32;

    if (v7)
    {
      uint64_t v9 = [*(id *)(a1 + 40) configuration];
      id v10 = [v9 syncDate];

      uint64_t v11 = [v7 stateByRecordingLastSyncDate:v10];

      id v12 = [v11 lastCheckDate];

      if (!v12)
      {
        uint64_t v13 = [v11 stateByRecordingLastCheckDate:v10];

        uint64_t v11 = (void *)v13;
      }
      _HKInitializeLogging();
      id v14 = (os_log_t *)MEMORY[0x1E4F29FA8];
      char v15 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        id v16 = *(void **)(a1 + 32);
        uint64_t v17 = *(void *)(a1 + 40);
        int v18 = v15;
        id v19 = [v16 syncStore];
        id v20 = [v11 lastSyncDate];
        *(_DWORD *)long long buf = 138543874;
        uint64_t v34 = v17;
        __int16 v35 = 2114;
        id v36 = v19;
        __int16 v37 = 2114;
        id v38 = v20;
        _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Update persisted state for %{public}@ with successful sync date %{public}@", buf, 0x20u);
      }
      char v21 = [*(id *)(a1 + 32) syncStore];
      id v31 = v8;
      char v22 = [v21 persistState:v11 error:&v31];
      id v23 = v31;

      if ((v22 & 1) == 0)
      {
        _HKInitializeLogging();
        char v24 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v30 = *(void *)(a1 + 40);
          *(_DWORD *)long long buf = 138543618;
          uint64_t v34 = v30;
          __int16 v35 = 2114;
          id v36 = v23;
          _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Failed to record sync completion date: %{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      BOOL v26 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138543618;
        uint64_t v34 = v29;
        __int16 v35 = 2114;
        id v36 = v8;
        _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve persisted sync store state for recording completion date: %{public}@", buf, 0x16u);
      }
      id v23 = v8;
    }
    [*(id *)(*(void *)(a1 + 40) + 136) finishTask];
  }
  else
  {
    _HKInitializeLogging();
    v25 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = *(void **)(a1 + 32);
      uint64_t v27 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138543874;
      uint64_t v34 = v27;
      __int16 v35 = 2114;
      id v36 = v28;
      __int16 v37 = 2114;
      id v38 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Sync session %{public}@ failed during upload: %{public}@", buf, 0x20u);
    }
    [*(id *)(*(void *)(a1 + 40) + 136) failTaskWithError:v5];
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 120));
  [*(id *)(*(void *)(a1 + 40) + 144) finishProgress];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 120));
}

void __77__HDCloudSyncPushSequenceOperation__setInitialForwardProgressDateIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) configuration];
  uint64_t v3 = [v2 repository];
  id v4 = [v3 profile];
  id v5 = [v4 legacyRepositoryProfile];
  uint64_t v6 = HDCloudSyncKeyValueDomainWithProfile(v5);

  id v19 = 0;
  int v7 = [v6 dateForKey:@"HDCloudSyncPrimaryLastPushForwardProgressDate" error:&v19];
  id v8 = v19;
  uint64_t v9 = v8;
  if (v7) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (v10)
  {
    if (!v7)
    {
      uint64_t v11 = [*(id *)(a1 + 32) configuration];
      id v12 = [v11 syncDate];
      id v18 = v9;
      char v13 = [v6 setDate:v12 forKey:@"HDCloudSyncPrimaryLastPushForwardProgressDate" error:&v18];
      id v14 = v18;

      if ((v13 & 1) == 0)
      {
        _HKInitializeLogging();
        char v15 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543618;
          char v21 = @"HDCloudSyncPrimaryLastPushForwardProgressDate";
          __int16 v22 = 2114;
          id v23 = v14;
          _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "Failed to update %{public}@: %{public}@.", buf, 0x16u);
        }
      }
      uint64_t v9 = v14;
    }
  }
  else
  {
    _HKInitializeLogging();
    id v16 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      char v21 = @"HDCloudSyncPrimaryLastPushForwardProgressDate";
      __int16 v22 = 2114;
      id v23 = v9;
      _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "Unable to determine value for %{public}@: %{public}@.", buf, 0x16u);
    }
  }
}

void __62__HDCloudSyncPushSequenceOperation__recordForwardProgressDate__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) configuration];
  uint64_t v3 = [v2 repository];
  uint64_t v4 = [v3 profile];
  id v5 = [(id)v4 legacyRepositoryProfile];
  uint64_t v6 = HDCloudSyncKeyValueDomainWithProfile(v5);

  int v7 = [*(id *)(a1 + 32) configuration];
  id v8 = [v7 syncDate];
  id v11 = 0;
  LOBYTE(v4) = [v6 setDate:v8 forKey:@"HDCloudSyncPrimaryLastPushForwardProgressDate" error:&v11];
  id v9 = v11;

  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    BOOL v10 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v13 = v9;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "Failed to record push operation forward progress: %{public}@.", buf, 0xCu);
    }
  }
}

uint64_t __85__HDCloudSyncPushSequenceOperation__canPerformProtectedDatabaseTransactionWithError___block_invoke()
{
  return 1;
}

+ (BOOL)shouldPerformRecentRecordRollingForUnfrozenRecords:(id)a3 configuration:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v5);
          }
          id v12 = [*(id *)(*((void *)&v22 + 1) + 8 * i) changeSize];
          v9 += [v12 longLongValue];
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v9 = 0;
    }
    uint64_t v14 = [v5 count];
    char v15 = [v6 repository];
    id v16 = [v15 profile];
    uint64_t v17 = [v16 cloudSyncManager];
    uint64_t v18 = [v17 bytesPerChangeRecordAssetThreshold];

    BOOL v13 = v14 > 21 || v9 > v18 || v14 == 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (id)unfrozenChangeRecordsForPushTarget:(id)a3 sequenceRecord:(id)a4 configuration:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  id v12 = [v9 frozenSyncAnchorMap];
  if (!v12) {
    id v12 = objc_alloc_init(HDSyncAnchorMap);
  }
  BOOL v13 = [HDCloudSyncCachedZone alloc];
  uint64_t v14 = [v11 zoneIdentifier];

  char v15 = [v10 repository];
  id v16 = [v10 accessibilityAssertion];

  id v17 = [(HDCloudSyncCachedZone *)v13 initForZoneIdentifier:v14 repository:v15 accessibilityAssertion:v16];
  uint64_t v18 = objc_opt_class();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __106__HDCloudSyncPushSequenceOperation_unfrozenChangeRecordsForPushTarget_sequenceRecord_configuration_error___block_invoke;
  v23[3] = &unk_1E62F5BA0;
  id v24 = v9;
  long long v25 = v12;
  id v19 = v12;
  id v20 = v9;
  char v21 = [v17 recordsForClass:v18 error:a6 filter:v23];

  return v21;
}

BOOL __106__HDCloudSyncPushSequenceOperation_unfrozenChangeRecordsForPushTarget_sequenceRecord_configuration_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 sequenceRecordID];
  id v5 = [*(id *)(a1 + 32) recordID];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    uint64_t v7 = [v3 decodedSyncAnchorRangeMap];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __106__HDCloudSyncPushSequenceOperation_unfrozenChangeRecordsForPushTarget_sequenceRecord_configuration_error___block_invoke_2;
    v10[3] = &unk_1E62F5D70;
    id v11 = *(id *)(a1 + 40);
    id v12 = &v13;
    [v7 enumerateAnchorRangesAndEntityIdentifiersWithBlock:v10];

    BOOL v8 = *((unsigned char *)v14 + 24) != 0;
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __106__HDCloudSyncPushSequenceOperation_unfrozenChangeRecordsForPushTarget_sequenceRecord_configuration_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [*(id *)(a1 + 32) anchorForSyncEntityIdentifier:a2];
  if (a4 > result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (void)syncSessionWillBegin:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
  _HKInitializeLogging();
  id v5 = (os_log_t *)MEMORY[0x1E4F29FA8];
  int v6 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning sync session: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  _HKInitializeLogging();
  os_log_t v7 = *v5;
  if (os_signpost_enabled(*v5))
  {
    BOOL v8 = v7;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(*v5, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        id v11 = [(HDCloudSyncOperation *)self configuration];
        id v12 = [v11 descriptionForSignpost];
        int v13 = 138543362;
        uint64_t v14 = v12;
        _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "cloud-sync-push-session", "%{public}@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

- (void)syncSession:(id)a3 willSyncAnchorRanges:(id)a4
{
  id v16 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  if (!self->_sessionContext)
  {
    id v5 = [HDCloudSyncSessionContext alloc];
    uint64_t v6 = [v16 anchorRangeCount];
    os_log_t v7 = [(HDCloudSyncOperation *)self configuration];
    BOOL v8 = [v7 repository];
    os_signpost_id_t v9 = [v8 profile];
    os_signpost_id_t v10 = [v9 legacyRepositoryProfile];
    id v11 = [(HDCloudSyncSessionContext *)v5 initWithChangedSyncEntityCount:v6 profile:v10];
    sessionContext = self->_sessionContext;
    self->_sessionContext = v11;

    int v13 = [(HDCloudSyncOperation *)self progress];
    uint64_t v14 = [(HDCloudSyncSessionContext *)self->_sessionContext progress];
    __int16 v15 = [(HDCloudSyncOperation *)self progress];
    objc_msgSend(v13, "addChild:withPendingUnitCount:", v14, objc_msgSend(v15, "totalUnitCount"));
  }
}

- (void)syncSession:(id)a3 sendChanges:(id)a4 completion:(id)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v54 = [MEMORY[0x1E4F28B00] currentHandler];
    [v54 handleFailureInMethod:a2, self, @"HDCloudSyncPushSequenceOperation.m", 1058, @"Invalid parameter not satisfying: %@", @"[session isKindOfClass:[HDCloudSyncSession class]]" object file lineNumber description];
  }
  id v12 = [(HDCloudSyncOperation *)self configuration];
  int v13 = [v12 context];
  uint64_t v14 = [v13 xpcActivity];
  int v15 = [v14 shouldDefer];

  if (v15)
  {
    _HKInitializeLogging();
    id v16 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v66 = self;
      _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Operation deferral requested.", buf, 0xCu);
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = [(HDCloudSyncOperation *)self configuration];
    id v19 = [v18 context];
    id v20 = [v19 xpcActivity];
    char v21 = objc_msgSend(v17, "hk_error:format:", 708, @"Canceling sync, xpc activity %@ indicated deferral.", v20);
    v11[2](v11, 0, v21);

    goto LABEL_34;
  }
  uint64_t v18 = objc_msgSend(v10, "hk_mapToSet:", &__block_literal_global_364);
  long long v22 = [v18 allObjects];
  id v19 = [v22 componentsJoinedByString:@", "];

  os_unfair_lock_lock(&self->_lock);
  sessionContext = self->_sessionContext;
  v61 = v9;
  id v24 = [v9 sessionUUID];
  id v64 = 0;
  BOOL v25 = [(HDCloudSyncSessionContext *)sessionContext resetInvalidArchiveCreatorWithSessionUUID:v24 error:&v64];
  id v20 = v64;

  unint64_t v26 = [(HDCloudSyncSessionContext *)self->_sessionContext archiveSize];
  os_unfair_lock_unlock(&self->_lock);
  if (v25)
  {
    uint64_t v55 = v11;
    id v58 = v18;
    uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    id v60 = v10;
    [v27 encodeObject:v10 forKey:@"changes"];
    id v56 = v27;
    id v59 = [v27 encodedData];
    unint64_t v28 = [v59 length] + v26;
    _HKInitializeLogging();
    uint64_t v29 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = v29;
      uint64_t v31 = [v59 length];
      *(_DWORD *)long long buf = 138544386;
      id v66 = self;
      __int16 v67 = 2112;
      id v68 = v19;
      __int16 v69 = 2048;
      unint64_t v70 = v28;
      __int16 v71 = 2048;
      unint64_t v72 = v26;
      __int16 v73 = 2048;
      uint64_t v74 = v31;
      _os_log_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: Archiving changes for (%@): total: (%llu), assetSize: (%llu), data.length: (%lu)", buf, 0x34u);
    }
    id v57 = v19;
    id v32 = [(HDCloudSyncOperation *)self configuration];
    uint64_t v33 = [v32 repository];
    uint64_t v34 = [v33 profile];
    __int16 v35 = [v34 cloudSyncManager];
    unint64_t v36 = [v35 bytesPerChangeRecordAssetThresholdHardLimit];

    __int16 v37 = [(HDCloudSyncOperation *)self configuration];
    id v38 = [v37 repository];
    uint64_t v39 = [v38 profile];
    [v39 cloudSyncManager];
    v41 = unint64_t v40 = v28;
    unint64_t v42 = [v41 bytesPerChangeRecordAssetThreshold];

    unint64_t v43 = v40;
    if (v40 >= v36)
    {
      _HKInitializeLogging();
      uint64_t v46 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138544130;
        id v66 = self;
        __int16 v67 = 2114;
        id v68 = v61;
        __int16 v69 = 2048;
        unint64_t v70 = v40;
        __int16 v71 = 2048;
        unint64_t v72 = v36;
        _os_log_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: Estimated asset data size (%llu) is over threshold hard limit (%ld), and needs to be uploaded", buf, 0x2Au);
      }

      os_unfair_lock_lock(&self->_lock);
      id v63 = 0;
      id v9 = v61;
      char v47 = -[HDCloudSyncPushSequenceOperation _lock_finalizeNextChangeRecordForUploadToSession:shouldFreeze:error:]((uint64_t)self, v61, 1, &v63);
      id v20 = v63;
      os_unfair_lock_unlock(&self->_lock);
      if ((v47 & 1) == 0)
      {
        id v11 = v55;
        v55[2](v55, 0, v20);
        id v10 = v60;
        id v19 = v57;
        uint64_t v18 = v58;
        id v48 = v59;
LABEL_33:

        goto LABEL_34;
      }
      char v44 = 0;
    }
    else
    {
      if (v40 >= v42)
      {
        _HKInitializeLogging();
        unint64_t v49 = *MEMORY[0x1E4F29FA8];
        id v48 = v59;
        id v11 = v55;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138544130;
          id v66 = self;
          __int16 v67 = 2114;
          id v68 = v61;
          __int16 v69 = 2048;
          unint64_t v70 = v43;
          __int16 v71 = 2048;
          unint64_t v72 = v42;
          id v9 = v61;
          _os_log_impl(&dword_1BCB7D000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: Estimated asset data size (%llu) is over threshold (%ld), and needs to be uploaded", buf, 0x2Au);
          char v44 = 1;
        }
        else
        {
          char v44 = 1;
          id v9 = v61;
        }
LABEL_25:
        id v50 = v20;
        uint64_t v51 = self->_sessionContext;
        uint64_t v52 = [v9 sessionUUID];
        id v62 = v20;
        LOBYTE(v51) = [(HDCloudSyncSessionContext *)v51 addChangeData:v48 changes:v60 sessionIdentifier:v52 outError:&v62];
        id v20 = v62;

        if (v51)
        {
          id v19 = v57;
          if ((v44 & 1) != 0 || [(NSMutableArray *)self->_changeRecordsPendingPush count])
          {
            if ([(HDCloudSyncSessionContext *)self->_sessionContext hasOpenSequence]) {
              uint64_t v53 = 1;
            }
            else {
              uint64_t v53 = 2;
            }
          }
          else
          {
            uint64_t v53 = 1;
          }
          id v10 = v60;
          uint64_t v18 = v58;
          v11[2](v11, v53, 0);
        }
        else
        {
          v11[2](v11, 0, v20);
          id v10 = v60;
          id v19 = v57;
          uint64_t v18 = v58;
        }
        goto LABEL_33;
      }
      char v44 = 0;
      id v9 = v61;
    }
    id v48 = v59;
    id v11 = v55;
    goto LABEL_25;
  }
  _HKInitializeLogging();
  int v45 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543618;
    id v66 = self;
    __int16 v67 = 2114;
    id v68 = v20;
    _os_log_error_impl(&dword_1BCB7D000, v45, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset invalid archive creator: (%{public}@)", buf, 0x16u);
  }
  v11[2](v11, 0, v20);
  id v9 = v61;
LABEL_34:
}

uint64_t __71__HDCloudSyncPushSequenceOperation_syncSession_sendChanges_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 syncEntityIdentifier];
}

- (BOOL)syncSession:(id)a3 didEndTransactionWithError:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HDCloudSyncPushSequenceOperation.m", 1129, @"Invalid parameter not satisfying: %@", @"[session isKindOfClass:[HDCloudSyncSession class]]" object file lineNumber description];
  }
  _HKInitializeLogging();
  BOOL v8 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: didEndTransaction called for session: %{public}@", buf, 0x16u);
  }
  os_unfair_lock_lock(&self->_lock);
  int v9 = -[HDCloudSyncPushSequenceOperation _lock_finalizeNextChangeRecordForUploadToSession:shouldFreeze:error:]((uint64_t)self, v7, 1, a4);
  os_unfair_lock_unlock(&self->_lock);
  if (v9)
  {
    uint64_t v21 = 0;
    long long v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    unint64_t v26 = __Block_byref_object_copy__21;
    uint64_t v27 = __Block_byref_object_dispose__21;
    id v28 = 0;
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __75__HDCloudSyncPushSequenceOperation_syncSession_didEndTransactionWithError___block_invoke;
    v17[3] = &unk_1E62F5DB8;
    id v19 = &v21;
    id v20 = buf;
    id v11 = v10;
    uint64_t v18 = v11;
    -[HDCloudSyncPushSequenceOperation _uploadChangesForSyncSession:isFinalUpload:completion:]((uint64_t)self, v7, 0, v17);
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    if (*((unsigned char *)v22 + 24))
    {
      BOOL v12 = 1;
    }
    else
    {
      id v13 = *(id *)(*(void *)&buf[8] + 40);
      uint64_t v14 = v13;
      if (v13)
      {
        if (a4) {
          *a4 = v13;
        }
        else {
          _HKLogDroppedError();
        }
      }

      BOOL v12 = *((unsigned char *)v22 + 24) != 0;
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

void __75__HDCloudSyncPushSequenceOperation_syncSession_didEndTransactionWithError___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)syncSession:(id)a3 didFinishSuccessfully:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"HDCloudSyncPushSequenceOperation.m", 1163, @"Invalid parameter not satisfying: %@", @"[session isKindOfClass:[HDCloudSyncSession class]]" object file lineNumber description];
  }
  _HKInitializeLogging();
  id v11 = (os_log_t *)MEMORY[0x1E4F29FA8];
  BOOL v12 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F29FA8]))
  {
    id v13 = v12;
    os_signpost_id_t v14 = os_signpost_id_make_with_pointer(*v11, self);
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v15 = v14;
      if (os_signpost_enabled(v13))
      {
        id v16 = [(HDCloudSyncOperation *)self configuration];
        uint64_t v17 = [v16 descriptionForSignpost];
        *(_DWORD *)long long buf = 67109378;
        *(_DWORD *)long long v22 = v6;
        *(_WORD *)&v22[4] = 2114;
        *(void *)&v22[6] = v17;
        _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v13, OS_SIGNPOST_INTERVAL_END, v15, "cloud-sync-push-session", "success=%{BOOL}d, %{public}@", buf, 0x12u);
      }
    }
  }
  _HKInitializeLogging();
  uint64_t v18 = *v11;
  id v19 = *v11;
  if (v6)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      *(void *)long long v22 = self;
      *(_WORD *)&v22[8] = 2114;
      *(void *)&v22[10] = v9;
      _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished session: %{public}@", buf, 0x16u);
    }
    -[HDCloudSyncPushSequenceOperation _finalizePushForSession:]((uint64_t)self, v9);
    [(HDSynchronousTaskGroup *)self->_taskGroup finishTask];
  }
  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543874;
      *(void *)long long v22 = self;
      *(_WORD *)&v22[8] = 2114;
      *(void *)&v22[10] = v9;
      __int16 v23 = 2114;
      id v24 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Sync session %{public}@ failed: %{public}@", buf, 0x20u);
    }
    os_unfair_lock_lock(&self->_lock);
    [(HDCloudSyncSessionContext *)self->_sessionContext finishProgress];
    os_unfair_lock_unlock(&self->_lock);
    [(HDSynchronousTaskGroup *)self->_taskGroup failTaskWithError:v10];
  }
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  BOOL v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(HDCloudSyncOperation *)self finishWithSuccess:v5 error:v7];
}

- (BOOL)hasMadeForwardProgress
{
  return self->_hasMadeForwardProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceState, 0);
  objc_storeStrong((id *)&self->_recordsPendingDeletion, 0);
  objc_storeStrong((id *)&self->_changeRecordsPendingPush, 0);
  objc_storeStrong((id *)&self->_sessionContext, 0);
  objc_storeStrong((id *)&self->_taskGroup, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_sequenceRecord, 0);

  objc_storeStrong((id *)&self->_target, 0);
}

@end