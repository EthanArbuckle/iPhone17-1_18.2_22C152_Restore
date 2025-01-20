@interface HDCloudSyncPushStoreOperation
+ (BOOL)shouldLogAtOperationStart;
+ (id)operationTagDependencies;
- (HDCloudSyncCompoundOperation)_operationForNewSequenceRecord:(void *)a3 replacingSequence:(uint64_t)a4 isRebaseline:;
- (HDCloudSyncPushSequenceOperation)_operationForExistingSequenceRecord:(void *)a3 includedChildSyncIdentites:;
- (HDCloudSyncPushStoreOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncPushStoreOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 target:(id)a5;
- (HDCloudSyncTarget)target;
- (id)_validatedSequenceRecordOperationsForPushWithError:(uint64_t)a1;
- (id)analyticsDictionary;
- (int64_t)rebaseReason;
- (void)main;
- (void)setRebaseReason:(int64_t)a3;
- (void)setTarget:(id)a3;
@end

@implementation HDCloudSyncPushStoreOperation

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

- (HDCloudSyncPushStoreOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncPushStoreOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 target:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncPushStoreOperation;
  v10 = [(HDCloudSyncOperation *)&v13 initWithConfiguration:a3 cloudState:a4];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_target, a5);
    v11->_lock._os_unfair_lock_opaque = 0;
  }

  return v11;
}

- (HDCloudSyncTarget)target
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_target;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setTarget:(id)a3
{
  id v5 = a3;
  if ([(HDCloudSyncOperation *)self status])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDCloudSyncPushStoreOperation.m", 73, @"Invalid parameter not satisfying: %@", @"self.status == HDCloudSyncOperationStatusPending" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = (HDCloudSyncTarget *)[v5 copy];

  target = self->_target;
  self->_target = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)main
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  target = self->_target;
  if (target)
  {
    v4 = [(HDCloudSyncTarget *)target store];
    id v33 = 0;
    id v5 = [v4 persistedStateWithError:&v33];
    id v6 = v33;
    storeState = self->_storeState;
    self->_storeState = v5;

    if (self->_storeState)
    {
      self->_rebaseReason = -1;
      v8 = [HDCloudSyncCompoundOperation alloc];
      id v9 = [(HDCloudSyncOperation *)self configuration];
      v10 = [(HDCloudSyncOperation *)self cloudState];
      v11 = [(HDCloudSyncCompoundOperation *)v8 initWithConfiguration:v9 cloudState:v10 name:@"Push Sequences" continueOnSubOperationError:1];

      id v32 = 0;
      v12 = -[HDCloudSyncPushStoreOperation _validatedSequenceRecordOperationsForPushWithError:]((uint64_t)self, (uint64_t)&v32);
      id v13 = v32;
      if (v12)
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v14 = v12;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v29 != v17) {
                objc_enumerationMutation(v14);
              }
              [(HDCloudSyncCompoundOperation *)v11 addOperation:*(void *)(*((void *)&v28 + 1) + 8 * i) transitionHandler:0];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v34 count:16];
          }
          while (v16);
        }

        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __37__HDCloudSyncPushStoreOperation_main__block_invoke;
        v27[3] = &unk_1E62F2950;
        v27[4] = self;
        [(HDCloudSyncOperation *)v11 setOnError:v27];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __37__HDCloudSyncPushStoreOperation_main__block_invoke_2;
        v26[3] = &unk_1E62F2928;
        v26[4] = self;
        [(HDCloudSyncOperation *)v11 setOnSuccess:v26];
        v19 = [(HDCloudSyncOperation *)v11 progress];
        uint64_t v20 = [v19 totalUnitCount];
        v21 = [(HDCloudSyncOperation *)self progress];
        [v21 setTotalUnitCount:v20];

        v22 = [(HDCloudSyncOperation *)self progress];
        v23 = [(HDCloudSyncOperation *)v11 progress];
        v24 = [(HDCloudSyncOperation *)v11 progress];
        objc_msgSend(v22, "addChild:withPendingUnitCount:", v23, objc_msgSend(v24, "totalUnitCount"));

        [(HDCloudSyncCompoundOperation *)v11 start];
      }
      else
      {
        [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v13];
      }
    }
    else
    {
      [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v6];
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"No target set when beginning push."");
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0);
  }
}

- (id)_validatedSequenceRecordOperationsForPushWithError:(uint64_t)a1
{
  uint64_t v223 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v201 = 0;
    goto LABEL_140;
  }
  v2 = [*(id *)(a1 + 104) storeRecord];
  v3 = [v2 syncIdentity];

  if (!v3)
  {
    obuint64_t j = [MEMORY[0x1E4F1CA80] set];
    goto LABEL_53;
  }
  v4 = [*(id *)(a1 + 104) storeRecord];
  int v5 = [v4 isChild];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v7 = [*(id *)(a1 + 104) storeRecord];
    v8 = [v7 syncIdentity];
    obuint64_t j = (id)objc_msgSend(v6, "initWithObjects:", v8, 0);

    goto LABEL_53;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v10 = [*(id *)(a1 + 104) storeRecord];
  v11 = [v10 syncIdentity];

  if (v11)
  {
    v12 = [*(id *)(a1 + 104) storeRecord];
    id v13 = [v12 syncIdentity];
    [v9 addObject:v13];
  }
  id v14 = [*(id *)(a1 + 104) storeRecord];
  uint64_t v15 = [v14 currentSequenceHeaderRecord];
  uint64_t v16 = [v15 includedSyncIdentities];

  if (v16)
  {
    uint64_t v17 = [*(id *)(a1 + 104) storeRecord];
    v18 = [v17 currentSequenceHeaderRecord];
    v19 = [v18 includedSyncIdentities];
    [v9 unionSet:v19];
  }
  uint64_t v20 = [(id)a1 profile];
  v21 = [v20 syncIdentityManager];
  v202[0] = MEMORY[0x1E4F143A8];
  v202[1] = 3221225472;
  v202[2] = __77__HDCloudSyncPushStoreOperation__currentOwnedSyncIdentitiesForPushWithError___block_invoke;
  v202[3] = &unk_1E6300528;
  id v200 = v9;
  id v203 = v200;
  int v22 = [v21 enumerateConcreteIdentitiesError:a2 enumerationHandler:v202];

  if (!v22)
  {
    obuint64_t j = 0;
    goto LABEL_52;
  }
  long long v210 = 0u;
  long long v211 = 0u;
  long long v208 = 0u;
  long long v209 = 0u;
  v23 = [(id)a1 configuration];
  v24 = [v23 computedState];
  id obja = [v24 targets];

  uint64_t v25 = [obja countByEnumeratingWithState:&v208 objects:v216 count:16];
  if (!v25) {
    goto LABEL_36;
  }
  uint64_t v26 = *(void *)v209;
  do
  {
    for (uint64_t i = 0; i != v25; ++i)
    {
      if (*(void *)v209 != v26) {
        objc_enumerationMutation(obja);
      }
      long long v28 = *(void **)(*((void *)&v208 + 1) + 8 * i);
      if ([v28 purpose]) {
        LODWORD(v29) = 0;
      }
      else {
        unint64_t v29 = ((unint64_t)[v28 options] >> 2) & 1;
      }
      if ((v29 | ((unint64_t)[v28 options] >> 1) & 1) == 1)
      {
        long long v30 = [*(id *)(a1 + 104) storeRecord];
        long long v31 = [v30 sequenceRecord];
        id v32 = [v31 includedChildSyncIdentities];
        id v33 = [v28 storeRecord];
        v34 = [v33 syncIdentity];
        int v35 = [v32 containsObject:v34];

        if (v35)
        {
          _HKInitializeLogging();
          v36 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            v37 = v36;
            v38 = [v28 storeRecord];
            v39 = [v38 syncIdentity];
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = a1;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v39;
            _os_log_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding seized target that is your own child %{public}@", buf, 0x16u);
          }
          v40 = [v28 storeRecord];
          v41 = [v40 syncIdentity];
          [v200 removeObject:v41];
          goto LABEL_32;
        }
        v42 = [v28 storeRecord];
        v40 = [v42 sequenceRecord];

        if (v40)
        {
          v43 = [v40 includedSyncIdentities];
          BOOL v44 = [v43 count] == 0;

          if (!v44)
          {
            _HKInitializeLogging();
            v45 = (void *)*MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
            {
              v46 = v45;
              v47 = [v40 includedSyncIdentities];
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = a1;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v47;
              _os_log_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding includedSyncIdentities of seized target %{public}@", buf, 0x16u);
            }
          }
          v48 = [v40 includedSyncIdentities];
          [v200 unionSet:v48];

          v49 = [v40 includedChildSyncIdentities];
          BOOL v50 = [v49 count] == 0;

          if (!v50)
          {
            _HKInitializeLogging();
            v51 = (void *)*MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
            {
              v52 = v51;
              v53 = [v40 includedChildSyncIdentities];
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = a1;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v53;
              _os_log_impl(&dword_1BCB7D000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding includedChildSyncIdentities of seized target %{public}@", buf, 0x16u);
            }
          }
          v41 = [v40 includedChildSyncIdentities];
          [v200 unionSet:v41];
LABEL_32:
        }
        continue;
      }
    }
    uint64_t v25 = [obja countByEnumeratingWithState:&v208 objects:v216 count:16];
  }
  while (v25);
LABEL_36:

  long long v206 = 0u;
  long long v207 = 0u;
  long long v204 = 0u;
  long long v205 = 0u;
  v54 = [(id)a1 configuration];
  v55 = [v54 computedState];
  v56 = [v55 targets];

  uint64_t v57 = [v56 countByEnumeratingWithState:&v204 objects:buf count:16];
  if (v57)
  {
    uint64_t v58 = *(void *)v205;
    do
    {
      for (uint64_t j = 0; j != v57; ++j)
      {
        if (*(void *)v205 != v58) {
          objc_enumerationMutation(v56);
        }
        v60 = *(void **)(*((void *)&v204 + 1) + 8 * j);
        if ([v60 purpose] == 1 && (objc_msgSend(v60, "options") & 2) == 0)
        {
          v61 = [v60 storeRecord];
          v62 = [v61 sequenceRecord];

          if (v62)
          {
            v63 = [v62 includedSyncIdentities];
            [v200 minusSet:v63];

            v64 = [v62 includedChildSyncIdentities];
            [v200 minusSet:v64];
          }
        }
      }
      uint64_t v57 = [v56 countByEnumeratingWithState:&v204 objects:buf count:16];
    }
    while (v57);
  }

  v65 = [(id)a1 profile];
  v66 = [v65 daemon];
  v67 = [v66 behavior];
  int v68 = [v67 isAppleWatch];

  if (v68)
  {
    v69 = [(id)a1 profile];
    v70 = [v69 syncIdentityManager];
    v71 = [v70 legacySyncIdentity];
    v72 = [v71 identity];

    [v200 removeObject:v72];
  }
  v73 = [(id)a1 profile];
  v74 = [v73 syncIdentityManager];
  v75 = [v74 currentSyncIdentity];
  v76 = [v75 identity];
  [v200 addObject:v76];

  obuint64_t j = v200;
LABEL_52:

LABEL_53:
  if (!obj)
  {
    id v201 = 0;
    goto LABEL_139;
  }
  *(void *)v216 = 0;
  *(void *)&v216[8] = v216;
  *(void *)&v216[16] = 0x3032000000;
  v217 = __Block_byref_object_copy__95;
  *(void *)v218 = __Block_byref_object_dispose__95;
  *(void *)&v218[8] = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  v77 = [*(id *)(a1 + 104) storeRecord];
  int v78 = [v77 isChild];

  if (v78) {
    goto LABEL_56;
  }
  v79 = [(id)a1 profile];
  v80 = [v79 database];
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __82__HDCloudSyncPushStoreOperation__currentOwnedChildSyncIdentitiesForPushWithError___block_invoke;
  v213 = &unk_1E62F3DB0;
  uint64_t v214 = a1;
  v215 = v216;
  BOOL v81 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v80 error:a2 block:buf];

  if (v81) {
LABEL_56:
  }
    id v82 = *(id *)(*(void *)&v216[8] + 40);
  else {
    id v82 = 0;
  }
  v196 = v82;
  _Block_object_dispose(v216, 8);

  v83 = v196;
  if (!v196)
  {
    id v201 = 0;
    goto LABEL_138;
  }
  objc_msgSend(obj, "minusSet:");
  id v84 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v85 = [*(id *)(a1 + 104) store];
  v86 = [v85 storeIdentifier];
  [v84 addObject:v86];

  uint64_t v87 = [*(id *)(a1 + 104) storeRecord];
  v88 = [(id)v87 currentSequenceHeaderRecord];
  v89 = [v88 includedIdentifiers];
  [v84 unionSet:v89];

  v90 = [*(id *)(a1 + 104) storeRecord];
  LOBYTE(v87) = [v90 isChild];

  if ((v87 & 1) == 0)
  {
    long long v210 = 0u;
    long long v211 = 0u;
    long long v208 = 0u;
    long long v209 = 0u;
    v91 = [(id)a1 configuration];
    v92 = [v91 computedState];
    v93 = [v92 targets];

    uint64_t v94 = [v93 countByEnumeratingWithState:&v208 objects:v216 count:16];
    if (v94)
    {
      uint64_t v95 = *(void *)v209;
      do
      {
        for (uint64_t k = 0; k != v94; ++k)
        {
          if (*(void *)v209 != v95) {
            objc_enumerationMutation(v93);
          }
          v97 = *(void **)(*((void *)&v208 + 1) + 8 * k);
          if ([v97 purpose]) {
            LODWORD(v98) = 0;
          }
          else {
            unint64_t v98 = ((unint64_t)[v97 options] >> 2) & 1;
          }
          if ((v98 | ((unint64_t)[v97 options] >> 1) & 1) == 1)
          {
            v99 = [v97 storeRecord];
            v100 = [v99 sequenceRecord];

            if (v100)
            {
              v101 = [v100 includedIdentifiers];
              [v84 unionSet:v101];
            }
          }
        }
        uint64_t v94 = [v93 countByEnumeratingWithState:&v208 objects:v216 count:16];
      }
      while (v94);
    }

    long long v206 = 0u;
    long long v207 = 0u;
    long long v204 = 0u;
    long long v205 = 0u;
    v102 = [(id)a1 configuration];
    v103 = [v102 computedState];
    v104 = [v103 targets];

    uint64_t v105 = [v104 countByEnumeratingWithState:&v204 objects:buf count:16];
    if (v105)
    {
      uint64_t v106 = *(void *)v205;
      do
      {
        for (uint64_t m = 0; m != v105; ++m)
        {
          if (*(void *)v205 != v106) {
            objc_enumerationMutation(v104);
          }
          v108 = *(void **)(*((void *)&v204 + 1) + 8 * m);
          if ([v108 purpose] == 1 && (objc_msgSend(v108, "options") & 2) == 0)
          {
            v109 = [v108 storeRecord];
            v110 = [v109 sequenceRecord];

            if (v110)
            {
              v111 = [v110 includedIdentifiers];
              [v84 minusSet:v111];
            }
          }
        }
        uint64_t v105 = [v104 countByEnumeratingWithState:&v204 objects:buf count:16];
      }
      while (v105);
    }
  }
  id v201 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v193 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v112 = [(id)a1 configuration];
  v113 = [v112 context];
  __int16 v114 = [v113 options];

  if ((v114 & 0x100) != 0)
  {
    v115 = [*(id *)(a1 + 104) storeRecord];
    v116 = [v115 tombstoneSequenceRecord];

    if (v116)
    {
      v117 = -[HDCloudSyncPushStoreOperation _operationForExistingSequenceRecord:includedChildSyncIdentites:]((void *)a1, v116, v196);
      [v201 addObject:v117];
    }
    else
    {
      _HKInitializeLogging();
      v118 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v216 = 138543362;
        *(void *)&v216[4] = a1;
        _os_log_impl(&dword_1BCB7D000, v118, OS_LOG_TYPE_DEFAULT, "%{public}@: Sync options require separate tombstones but no tombstone sequence record exists. Creating it now.", v216, 0xCu);
      }
      v119 = [*(id *)(a1 + 104) storeRecord];
      v116 = [v119 addNewTombstoneSequenceHeaderRecordWithIncludedIdentifiers:v84 includedSyncIdentities:obj includedChildSyncIdentities:v196];

      v120 = -[HDCloudSyncPushStoreOperation _operationForNewSequenceRecord:replacingSequence:isRebaseline:]((id *)a1, v116, 0, 0);
      [v201 addObject:v120];
    }
    [v193 addObject:@"tombstone"];
  }
  v121 = [*(id *)(a1 + 104) storeRecord];
  v190 = [v121 activeSequenceHeaderRecord];

  if (v190)
  {
    v122 = -[HDCloudSyncPushStoreOperation _operationForExistingSequenceRecord:includedChildSyncIdentites:]((void *)a1, v190, v196);
    [v201 addObject:v122];

    [v193 addObject:@"active"];
  }
  id v195 = v84;
  id v191 = obj;
  id v192 = v196;
  v123 = [*(id *)(a1 + 104) storeRecord];
  uint64_t v124 = [v123 activeSequenceHeaderRecord];

  v125 = [*(id *)(a1 + 104) storeRecord];
  uint64_t v126 = [v125 pendingSequenceHeaderRecord];

  v127 = [*(id *)(a1 + 104) storeRecord];
  v128 = [v127 currentSequenceHeaderRecord];

  if (!(v124 | v126))
  {
    _HKInitializeLogging();
    v129 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v216 = 138543362;
      *(void *)&v216[4] = a1;
      _os_log_impl(&dword_1BCB7D000, v129, OS_LOG_TYPE_DEFAULT, "%{public}@: No current or active sequence; creating a new one and syncing.",
        v216,
        0xCu);
    }
    v130 = [*(id *)(a1 + 104) storeRecord];
    v131 = objc_alloc_init(HDSyncAnchorMap);
    v132 = [v130 addNewSequenceHeaderRecordWithSyncAnchorMap:v131 includedIdentifiers:v195 includedSyncIdentities:v191 includedChildSyncIdentities:v192];

    v188 = -[HDCloudSyncPushStoreOperation _operationForNewSequenceRecord:replacingSequence:isRebaseline:]((id *)a1, v132, 0, 1);

    goto LABEL_128;
  }
  v133 = [(id)a1 configuration];
  if (![v133 rebaseProhibited])
  {
    v135 = [*(id *)(a1 + 104) store];
    int v136 = [v135 supportsRebase];

    uint64_t v134 = a1;
    if (!v136) {
      goto LABEL_114;
    }
    v137 = [(id)a1 configuration];
    v138 = [v137 context];
    unint64_t v139 = [v138 options];

    char v140 = [*(id *)(a1 + 104) options];
    v141 = [v128 includedIdentifiers];
    int v142 = [v141 isEqualToSet:v195];

    v143 = [v128 includedSyncIdentities];
    int v144 = [v143 isEqualToSet:v191];

    uint64_t v145 = v140 & 1;
    uint64_t v134 = a1;
    if ((v139 >> 3))
    {
      *(void *)(a1 + 128) = 8;
      if ((v140 & 1) == 0)
      {
LABEL_107:
        if (v142)
        {
LABEL_109:
          int v146 = v142 ^ 1;
          unint64_t v147 = v139 & 8;
          if (v144)
          {
            if (v147 | v145) {
              int v148 = 1;
            }
            else {
              int v148 = v142 ^ 1;
            }
            if ((v148 | v144 ^ 1) != 1) {
              goto LABEL_114;
            }
          }
          else
          {
            *(void *)(a1 + 128) = 7;
          }
          _HKInitializeLogging();
          v152 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v216 = 138544386;
            *(void *)&v216[4] = a1;
            *(_WORD *)&v216[12] = 1024;
            *(_DWORD *)&v216[14] = v147 >> 3;
            *(_WORD *)&v216[18] = 1024;
            *(_DWORD *)&v216[20] = v145;
            LOWORD(v217) = 1024;
            *(_DWORD *)((char *)&v217 + 2) = v144 ^ 1;
            HIWORD(v217) = 1024;
            *(_DWORD *)v218 = v146;
            _os_log_impl(&dword_1BCB7D000, v152, OS_LOG_TYPE_DEFAULT, "%{public}@: Rebasing and pushing to new sequence record (requested: %{BOOL}d, target: %{BOOL}d, mismatch identities: %{BOOL}d, mismatch identifiers: %{BOOL}d).", v216, 0x24u);
          }
          v153 = *(void **)(a1 + 104);
          id v154 = v192;
          id v155 = v191;
          id v189 = v195;
          v156 = [v153 storeRecord];
          v157 = [v156 pendingSequenceHeaderRecord];

          if (v157)
          {
            v158 = [*(id *)(a1 + 104) storeRecord];
            id v159 = (id)[v158 clearPendingSequenceHeaderRecord];
          }
          v160 = [*(id *)(a1 + 104) storeRecord];
          v161 = objc_alloc_init(HDSyncAnchorMap);
          v162 = [v160 addNewSequenceHeaderRecordWithSyncAnchorMap:v161 includedIdentifiers:v189 includedSyncIdentities:v155 includedChildSyncIdentities:v154];

          v188 = -[HDCloudSyncPushStoreOperation _operationForNewSequenceRecord:replacingSequence:isRebaseline:]((id *)a1, v162, (void *)v126, 1);

          goto LABEL_128;
        }
LABEL_108:
        *(void *)(a1 + 128) = 6;
        goto LABEL_109;
      }
    }
    else if ((v140 & 1) == 0)
    {
      goto LABEL_107;
    }
    *(void *)(a1 + 128) = 10;
    if (v142) {
      goto LABEL_109;
    }
    goto LABEL_108;
  }

  uint64_t v134 = a1;
LABEL_114:
  if (v126)
  {
    *(void *)(v134 + 128) = 9;
    _HKInitializeLogging();
    v149 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v216 = 138543362;
      *(void *)&v216[4] = a1;
      _os_log_impl(&dword_1BCB7D000, v149, OS_LOG_TYPE_DEFAULT, "%{public}@: Pushing to existing incomplete sequence.", v216, 0xCu);
    }
    v150 = [(id)a1 configuration];
    v151 = [v150 computedState];
    objc_msgSend(v151, "setCountOfRebaselineOperations:", objc_msgSend(v151, "countOfRebaselineOperations") + 1);

    v188 = -[HDCloudSyncPushStoreOperation _operationForExistingSequenceRecord:includedChildSyncIdentites:]((void *)a1, (void *)v126, v192);
  }
  else
  {
    v188 = 0;
  }
LABEL_128:

  if (v188)
  {
    [v201 addObject:v188];
    [v193 addObject:@"current"];
  }
  _HKInitializeLogging();
  v163 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    v164 = *(void **)(a1 + 104);
    v165 = v163;
    v166 = [v164 store];
    v167 = [*(id *)(a1 + 104) storeRecord];
    *(_DWORD *)v216 = 138543874;
    *(void *)&v216[4] = a1;
    *(_WORD *)&v216[12] = 2114;
    *(void *)&v216[14] = v166;
    *(_WORD *)&v216[22] = 2114;
    v217 = v167;
    _os_log_impl(&dword_1BCB7D000, v165, OS_LOG_TYPE_DEFAULT, "%{public}@: Pushing to store: %{public}@ with storeRecord: %{public}@", v216, 0x20u);
  }
  _HKInitializeLogging();
  v168 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    v169 = *(void **)(a1 + 104);
    v170 = v168;
    v171 = [v169 store];
    v172 = [v193 componentsJoinedByString:@", "];
    uint64_t v173 = [v195 count];
    v174 = [v195 allObjects];
    v175 = [v174 componentsJoinedByString:@", "];
    uint64_t v176 = [v191 count];
    v177 = [v191 allObjects];
    v178 = [v177 componentsJoinedByString:@", "];
    *(_DWORD *)v216 = 138544898;
    *(void *)&v216[4] = a1;
    *(_WORD *)&v216[12] = 2114;
    *(void *)&v216[14] = v171;
    *(_WORD *)&v216[22] = 2114;
    v217 = v172;
    *(_WORD *)v218 = 2048;
    *(void *)&v218[2] = v173;
    *(_WORD *)&v218[10] = 2114;
    *(void *)&v218[12] = v175;
    __int16 v219 = 2048;
    uint64_t v220 = v176;
    __int16 v221 = 2114;
    v222 = v178;
    _os_log_impl(&dword_1BCB7D000, v170, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Pushing to sequences (%{public}@) with %ld included sync identifiers: %{public}@ and %ld included sync identities: %{public}@", v216, 0x48u);
  }
  if ([v192 count])
  {
    _HKInitializeLogging();
    v179 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      v180 = *(void **)(a1 + 104);
      v181 = v179;
      v182 = [v180 store];
      v183 = [v193 componentsJoinedByString:@", "];
      uint64_t v184 = [v192 count];
      v185 = [v192 allObjects];
      v186 = [v185 componentsJoinedByString:@", "];
      *(_DWORD *)v216 = 138544386;
      *(void *)&v216[4] = a1;
      *(_WORD *)&v216[12] = 2114;
      *(void *)&v216[14] = v182;
      *(_WORD *)&v216[22] = 2114;
      v217 = v183;
      *(_WORD *)v218 = 2048;
      *(void *)&v218[2] = v184;
      *(_WORD *)&v218[10] = 2114;
      *(void *)&v218[12] = v186;
      _os_log_impl(&dword_1BCB7D000, v181, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Pushing to sequences (%{public}@) with %ld included child sync identities: %{public}@", v216, 0x34u);
    }
  }

  v83 = v196;
LABEL_138:

LABEL_139:
LABEL_140:

  return v201;
}

uint64_t __37__HDCloudSyncPushStoreOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithSuccess:0 error:a3];
}

void __37__HDCloudSyncPushStoreOperation_main__block_invoke_2(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v1 = *(id **)(a1 + 32);
  if (v1)
  {
    v2 = [v1[13] storeRecord];
    v3 = [v2 oldSequenceHeaderRecord];

    v4 = [v1[13] storeRecord];
    int v5 = [v4 currentSequenceHeaderRecord];
    int v6 = [v5 isActive];

    if (v6) {
      BOOL v7 = v3 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      [v1 finishWithSuccess:1 error:0];
    }
    else
    {
      v8 = [HDCloudSyncDeleteSequenceOperation alloc];
      id v9 = [v1 configuration];
      id v14 = v3;
      v15[0] = v1[13];
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      v11 = [(HDCloudSyncDeleteSequenceOperation *)v8 initWithConfiguration:v9 targetsBySequence:v10];

      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __69__HDCloudSyncPushStoreOperation__sequencePushesDidFinishSuccessfully__block_invoke;
      v13[3] = &unk_1E62F2950;
      v13[4] = v1;
      [(HDCloudSyncOperation *)v11 setOnError:v13];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __69__HDCloudSyncPushStoreOperation__sequencePushesDidFinishSuccessfully__block_invoke_2;
      v12[3] = &unk_1E62F2928;
      v12[4] = v1;
      [(HDCloudSyncOperation *)v11 setOnSuccess:v12];
      [(HDCloudSyncOperation *)v11 start];
    }
  }
}

uint64_t __77__HDCloudSyncPushStoreOperation__currentOwnedSyncIdentitiesForPushWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 identity];
  [v2 addObject:v3];

  return 1;
}

uint64_t __82__HDCloudSyncPushStoreOperation__currentOwnedChildSyncIdentitiesForPushWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v5 = *(void **)(a1 + 32);
  id v6 = a2;
  BOOL v7 = [v5 profile];
  v8 = [v7 syncIdentityManager];
  id v19 = 0;
  id v9 = [v8 childIdentitiesForCurrentSyncIdentityWithTransaction:v6 error:&v19];

  id v10 = v19;
  if (v9)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v13 = *(id *)(v12 + 40);
    *(void *)(v12 + 40) = v11;
LABEL_3:
    uint64_t v14 = 1;
    goto LABEL_4;
  }
  _HKInitializeLogging();
  uint64_t v16 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v18;
    __int16 v22 = 2114;
    id v23 = v10;
    _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Unable to get child sync identities from local storage: %{public}@", buf, 0x16u);
  }
  id v17 = v10;
  id v13 = v17;
  if (!v17) {
    goto LABEL_3;
  }
  if (a3)
  {
    id v13 = v17;
    uint64_t v14 = 0;
    *a3 = v13;
  }
  else
  {
    _HKLogDroppedError();
    uint64_t v14 = 0;
  }
LABEL_4:

  return v14;
}

- (HDCloudSyncCompoundOperation)_operationForNewSequenceRecord:(void *)a3 replacingSequence:(uint64_t)a4 isRebaseline:
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = [a1 configuration];
  id v10 = [v9 computedState];
  objc_msgSend(v10, "setCountOfRebaselineOperations:", objc_msgSend(v10, "countOfRebaselineOperations") + a4);

  uint64_t v11 = [HDCloudSyncCompoundOperation alloc];
  uint64_t v12 = [a1 configuration];
  id v13 = [a1 cloudState];
  uint64_t v14 = [(HDCloudSyncCompoundOperation *)v11 initWithConfiguration:v12 cloudState:v13 name:@"Setup & Push" continueOnSubOperationError:0];

  uint64_t v15 = [v8 recordID];
  uint64_t v16 = [v7 recordID];
  int v17 = [v15 isEqual:v16];

  if (v17)
  {
    uint64_t v18 = [HDCloudSyncModifyRecordsOperation alloc];
    id v19 = [a1 configuration];
    uint64_t v20 = [a1[13] container];
    uint64_t v21 = [v8 recordID];
    v33[0] = v21;
    __int16 v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    id v23 = [(HDCloudSyncModifyRecordsOperation *)v18 initWithConfiguration:v19 container:v20 recordsToSave:0 recordIDsToDelete:v22];

    [(HDCloudSyncCompoundOperation *)v14 addOperation:v23 transitionHandler:0];
    id v8 = 0;
  }
  uint64_t v24 = [HDCloudSyncStartSequenceOperation alloc];
  uint64_t v25 = [a1 configuration];
  uint64_t v26 = [a1 cloudState];
  v27 = [(HDCloudSyncStartSequenceOperation *)v24 initWithConfiguration:v25 cloudState:v26 target:a1[13] sequence:v7 replacingSequence:v8 shouldClearRebaselineDeadline:a4];

  long long v28 = [HDCloudSyncPushSequenceOperation alloc];
  unint64_t v29 = [a1 configuration];
  long long v30 = [a1 cloudState];
  long long v31 = [(HDCloudSyncPushSequenceOperation *)v28 initWithConfiguration:v29 cloudState:v30 target:a1[13] sequence:v7];

  [(HDCloudSyncCompoundOperation *)v14 addOperation:v27 transitionHandler:0];
  [(HDCloudSyncCompoundOperation *)v14 addOperation:v31 transitionHandler:&__block_literal_global_101];

  return v14;
}

void __95__HDCloudSyncPushStoreOperation__operationForNewSequenceRecord_replacingSequence_isRebaseline___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 sequenceState];
  [v4 setSequenceState:v5];
}

- (HDCloudSyncPushSequenceOperation)_operationForExistingSequenceRecord:(void *)a3 includedChildSyncIdentites:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 includedChildSyncIdentities];
  char v8 = [v7 isEqualToSet:v6];

  if ((v8 & 1) == 0)
  {
    _HKInitializeLogging();
    id v9 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      uint64_t v11 = [v6 allObjects];
      uint64_t v12 = [v11 componentsJoinedByString:@", "];
      int v18 = 138543618;
      id v19 = a1;
      __int16 v20 = 2114;
      uint64_t v21 = v12;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating sequence record to include child sync identities: %{public}@.", (uint8_t *)&v18, 0x16u);
    }
    [v5 setIncludedChildSyncIdentities:v6];
  }
  id v13 = [HDCloudSyncPushSequenceOperation alloc];
  uint64_t v14 = [a1 configuration];
  uint64_t v15 = [a1 cloudState];
  uint64_t v16 = [(HDCloudSyncPushSequenceOperation *)v13 initWithConfiguration:v14 cloudState:v15 target:a1[13] sequence:v5];

  return v16;
}

uint64_t __69__HDCloudSyncPushStoreOperation__sequencePushesDidFinishSuccessfully__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithSuccess:0 error:a3];
}

uint64_t __69__HDCloudSyncPushStoreOperation__sequencePushesDidFinishSuccessfully__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 cloudState];
  [*(id *)(a1 + 32) setCloudState:v3];

  id v4 = *(void **)(a1 + 32);

  return [v4 finishWithSuccess:1 error:0];
}

- (id)analyticsDictionary
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncPushStoreOperation;
  v3 = [(HDCloudSyncOperation *)&v8 analyticsDictionary];
  if (self->_rebaseReason != -1)
  {
    id v9 = @"rebaseReason";
    id v4 = objc_msgSend(NSNumber, "numberWithInteger:");
    v10[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v6 = objc_msgSend(v5, "hk_dictionaryByAddingEntriesFromDictionary:", v3);

    v3 = (void *)v6;
  }

  return v3;
}

- (int64_t)rebaseReason
{
  return self->_rebaseReason;
}

- (void)setRebaseReason:(int64_t)a3
{
  self->_rebaseReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeState, 0);

  objc_storeStrong((id *)&self->_target, 0);
}

@end