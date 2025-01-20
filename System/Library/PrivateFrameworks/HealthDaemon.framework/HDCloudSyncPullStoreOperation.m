@interface HDCloudSyncPullStoreOperation
+ (BOOL)shouldLogAtOperationStart;
- (BOOL)_copyAnchorsOfType:(void *)a1 from:(void *)a2 to:(void *)a3 error:(uint64_t)a4;
- (BOOL)finishWithSuccess:(BOOL)a3 error:(id)a4;
- (BOOL)hasAppliedChange;
- (HDCloudSyncPullStoreOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncPullStoreOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 target:(id)a5;
- (HDCloudSyncTarget)target;
- (uint64_t)_requiresSyncForSequence:(uint64_t)a3 error:;
- (void)main;
@end

@implementation HDCloudSyncPullStoreOperation

- (HDCloudSyncPullStoreOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncPullStoreOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 target:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncPullStoreOperation;
  v10 = [(HDCloudSyncOperation *)&v13 initWithConfiguration:a3 cloudState:a4];
  v11 = v10;
  if (v10)
  {
    v10->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v10->_target, a5);
    v11->_hasAppliedChange = 0;
  }

  return v11;
}

- (void)main
{
  uint64_t v280 = *MEMORY[0x1E4F143B8];
  v2 = [(HDCloudSyncTarget *)self->_target storeRecord];
  int v3 = [v2 requiredProtocolVersion];

  if (v3 >= 2)
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      target = self->_target;
      v53 = v4;
      v54 = [(HDCloudSyncTarget *)target storeRecord];
      int v55 = [v54 requiredProtocolVersion];
      v56 = [(HDCloudSyncTarget *)self->_target storeRecord];
      v57 = [v56 systemBuildVersion];
      v58 = [(HDCloudSyncTarget *)self->_target storeRecord];
      v59 = [v58 productType];
      v60 = [(HDCloudSyncTarget *)self->_target storeRecord];
      v61 = [v60 deviceName];
      *(_DWORD *)buf = 138544386;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v55;
      *(_WORD *)&buf[22] = 2114;
      v272 = v57;
      *(_WORD *)v273 = 2114;
      *(void *)&v273[2] = v59;
      *(_WORD *)&v273[10] = 2114;
      *(void *)&v273[12] = v61;
      _os_log_error_impl(&dword_1BCB7D000, v53, OS_LOG_TYPE_ERROR, "%{public}@: Found incomprehensible required protocol version %ld (from %{public}@ on a %{public}@: '%{public}@')", buf, 0x34u);
    }
    v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 703, @"Health data from a future system version is present in iCloud and cannot be handled by this device.");
    v263[0] = *MEMORY[0x1E4F29B58];
    uint64_t v6 = [(HDCloudSyncTarget *)self->_target storeRecord];
    uint64_t v7 = [v6 deviceName];
    v8 = (void *)v7;
    if (v7) {
      id v9 = (__CFString *)v7;
    }
    else {
      id v9 = &stru_1F1728D60;
    }
    v264[0] = v9;
    v263[1] = *MEMORY[0x1E4F29B60];
    v10 = [(HDCloudSyncTarget *)self->_target storeRecord];
    uint64_t v11 = [v10 productType];
    v12 = (void *)v11;
    if (v11) {
      objc_super v13 = (__CFString *)v11;
    }
    else {
      objc_super v13 = &stru_1F1728D60;
    }
    v264[1] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v264 forKeys:v263 count:2];
    v15 = objc_msgSend(v5, "hk_errorByAddingEntriesToUserInfo:", v14);

    [(HDCloudSyncPullStoreOperation *)self finishWithSuccess:0 error:v15];
    return;
  }
  v16 = [(HDCloudSyncTarget *)self->_target storeRecord];
  v17 = [v16 orderedSequenceRecords];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    v19 = [(HDCloudSyncTarget *)self->_target storeRecord];
    v20 = [v19 orderedSequenceRecords];
    uint64_t v21 = [v20 count];
    v22 = [(HDCloudSyncOperation *)self progress];
    [v22 setTotalUnitCount:300 * v21 + 200];

    v23 = [(HDCloudSyncTarget *)self->_target store];
    id v239 = 0;
    v217 = [v23 persistedStateWithError:&v239];
    id v216 = v239;

    if (!v217)
    {
      [(HDCloudSyncPullStoreOperation *)self finishWithSuccess:0 error:v216];
      goto LABEL_146;
    }
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      v25 = self->_target;
      v26 = v24;
      v27 = [(HDCloudSyncTarget *)v25 storeRecord];
      v28 = [v27 shortDescription];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v28;
      _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Store: %{public}@", buf, 0x16u);
    }
    _HKInitializeLogging();
    v29 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      v30 = self->_target;
      v31 = v29;
      v32 = [(HDCloudSyncTarget *)v30 storeRecord];
      v33 = [v32 activeSequenceHeaderRecord];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v33;
      _os_log_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: Sequence: %{public}@", buf, 0x16u);
    }
    if ([v217 syncProtocolVersion] == 16)
    {
      id v230 = v216;
    }
    else
    {
      _HKInitializeLogging();
      v34 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        v35 = v34;
        int v36 = [v217 syncProtocolVersion];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v36;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = 16;
        _os_log_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: detected sync protocol version change %d -> %d", buf, 0x18u);
      }
      id v238 = v216;
      id v37 = v217;
      v38 = [HDCloudSyncCachedZone alloc];
      v39 = [(HDCloudSyncTarget *)self->_target zoneIdentifier];
      v40 = [(HDCloudSyncOperation *)self configuration];
      v41 = [v40 repository];
      v42 = [(HDCloudSyncOperation *)self configuration];
      v43 = [v42 accessibilityAssertion];
      id v44 = [(HDCloudSyncCachedZone *)v38 initForZoneIdentifier:v39 repository:v41 accessibilityAssertion:v43];

      uint64_t v265 = 0;
      uint64_t v266 = (uint64_t)&v265;
      uint64_t v267 = 0x2020000000;
      LOBYTE(v268) = 0;
      uint64_t v45 = objc_opt_class();
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __55__HDCloudSyncPullStoreOperation__resetPullState_error___block_invoke;
      v272 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E630E4A8;
      *(void *)v273 = self;
      id v46 = v37;
      *(void *)&v273[8] = v46;
      *(void *)&v273[16] = &v265;
      if ([v44 recordsForClass:v45 epoch:0 error:&v238 enumerationHandler:buf])
      {
        if (*(unsigned char *)(v266 + 24))
        {
          v47 = [(HDCloudSyncTarget *)self->_target store];
          LODWORD(v48) = [v47 resetReceivedSyncAnchorMapWithError:&v238];

          if (v48)
          {
            uint64_t v49 = [v46 stateWithSyncProtocolVersion:16];

            v50 = [(HDCloudSyncTarget *)self->_target store];
            LODWORD(v48) = [v50 persistState:v49 error:&v238];

            if (v48)
            {
              v51 = [(HDCloudSyncOperation *)self configuration];
              uint64_t v48 = [v51 operationGroup];
              [(id)v48 setExpectedReceiveSize:3];

              LOBYTE(v48) = 1;
            }
            id v46 = (id)v49;
          }
        }
        else
        {
          _HKInitializeLogging();
          v62 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v274 = 138543362;
            *(void *)&v274[4] = self;
            _os_log_impl(&dword_1BCB7D000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@: detected sync protocol version, but none of the change records have a greater protocol version. Skipping re-ingest.", v274, 0xCu);
          }
          LOBYTE(v48) = 1;
        }
      }
      else
      {
        LOBYTE(v48) = 0;
      }

      _Block_object_dispose(&v265, 8);
      id v230 = v238;

      if ((v48 & 1) == 0)
      {
        [(HDCloudSyncPullStoreOperation *)self finishWithSuccess:0 error:v230];
        id v216 = v230;
        goto LABEL_146;
      }
    }
    v63 = [(HDCloudSyncTarget *)self->_target storeRecord];
    v64 = [v63 activeSequenceHeaderRecord];
    unint64_t v65 = [v64 baselineEpoch];
    LODWORD(v65) = v65 > [v217 baselineEpoch];

    if (v65)
    {
      id v237 = v230;
      id v232 = v217;
      _HKInitializeLogging();
      v66 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        v67 = v66;
        uint64_t v68 = [v232 baselineEpoch];
        v69 = [(HDCloudSyncTarget *)self->_target storeRecord];
        v70 = [v69 activeSequenceHeaderRecord];
        uint64_t v71 = [v70 baselineEpoch];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v68;
        *(_WORD *)&buf[22] = 2048;
        v272 = (uint64_t (*)(uint64_t, uint64_t))v71;
        _os_log_impl(&dword_1BCB7D000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@: detected this is a pull of a new epoch %llu -> %llu", buf, 0x20u);
      }
      v222 = [_HDCloudSyncStorePersistableState alloc];
      v228 = [(HDCloudSyncTarget *)self->_target storeRecord];
      v226 = [v228 activeSequenceHeaderRecord];
      uint64_t v220 = [v226 baselineEpoch];
      v224 = [v232 rebaseDeadline];
      v72 = [v232 lastSyncDate];
      v73 = [v232 emptyZoneDateByZoneID];
      v74 = [v232 lastCheckDate];
      v75 = [(HDCloudSyncTarget *)self->_target storeRecord];
      v76 = [v75 ownerIdentifier];
      v77 = [(HDCloudSyncTarget *)self->_target container];
      v78 = [v77 containerIdentifier];
      v79 = [(HDCloudSyncTarget *)self->_target storeRecord];
      v80 = [v79 syncIdentity];
      LODWORD(v203) = [v232 syncProtocolVersion];
      v223 = [(_HDCloudSyncStorePersistableState *)v222 initWithServerChangeToken:0 baselineEpoch:v220 rebaseDeadline:v224 lastSyncDate:v72 emptyZones:v73 lastCheckDate:v74 ownerIdentifier:v76 containerIdentifier:v78 syncIdentity:v80 syncProtocolVersion:v203];

      v81 = [(HDCloudSyncTarget *)self->_target store];
      v82 = [(HDCloudSyncTarget *)self->_target storeRecord];
      v83 = [v82 activeSequenceHeaderRecord];
      v84 = objc_msgSend(v81, "syncStoreForEpoch:", objc_msgSend(v83, "baselineEpoch"));

      if ([v232 hasEncounteredGapInCurrentEpoch])
      {
        v85 = [(_HDCloudSyncStorePersistableState *)v223 stateWithGapEncountered:0];

        if (([v84 resetReceivedSyncAnchorMapWithError:&v237] & 1) == 0)
        {
LABEL_60:
          buf[0] = 0;
LABEL_62:

          char v101 = buf[0];
          id v216 = v237;

          if ((v101 & 1) == 0)
          {
            [(HDCloudSyncPullStoreOperation *)self finishWithSuccess:0 error:v216];
            goto LABEL_146;
          }
          id v102 = v216;
          goto LABEL_67;
        }
      }
      else
      {
        v93 = [(HDCloudSyncTarget *)self->_target store];
        BOOL v94 = -[HDCloudSyncPullStoreOperation _copyAnchorsOfType:from:to:error:](self, v93, v84, (uint64_t)&v237);

        if (!v94
          || ([(HDCloudSyncTarget *)self->_target store],
              v95 = objc_claimAutoreleasedReturnValue(),
              BOOL v96 = -[HDCloudSyncPullStoreOperation _copyAnchorsOfType:from:to:error:](self, v95, v84, (uint64_t)&v237),
              v95,
              !v96))
        {
          buf[0] = 0;
          v85 = v223;
          goto LABEL_62;
        }
        v85 = v223;
      }
      if ([v84 persistState:v85 error:&v237])
      {
        v97 = [v85 serverChangeToken];
        BOOL v98 = v97 == 0;

        if (v98)
        {
          v99 = [(HDCloudSyncOperation *)self configuration];
          v100 = [v99 operationGroup];
          [v100 setExpectedReceiveSize:3];
        }
        buf[0] = 1;
        goto LABEL_62;
      }
      goto LABEL_60;
    }
    id v236 = v230;
    v86 = [(HDCloudSyncTarget *)self->_target storeRecord];
    v87 = [v86 tombstoneSequenceRecord];

    if (!v87) {
      goto LABEL_45;
    }
    uint64_t v88 = -[HDCloudSyncPullStoreOperation _requiresSyncForSequence:error:]((id *)&self->super.super.isa, v87, (uint64_t)&v236);
    if (!v88)
    {
LABEL_79:

      id v216 = v236;
      [(HDCloudSyncPullStoreOperation *)self finishWithSuccess:0 error:v216];
      goto LABEL_146;
    }
    if (v88 != 1)
    {
LABEL_45:
      v89 = [(HDCloudSyncTarget *)self->_target storeRecord];
      v90 = [v89 sequenceRecord];

      if (!v90)
      {
LABEL_49:

        id v216 = v236;
        _HKInitializeLogging();
        v92 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = self;
          _os_log_impl(&dword_1BCB7D000, v92, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping pull; local anchors are up-to-date.",
            buf,
            0xCu);
        }
        [(HDCloudSyncPullStoreOperation *)self finishWithSuccess:1 error:0];
        goto LABEL_146;
      }
      uint64_t v91 = -[HDCloudSyncPullStoreOperation _requiresSyncForSequence:error:]((id *)&self->super.super.isa, v90, (uint64_t)&v236);
      if (!v91) {
        goto LABEL_78;
      }
      if (v91 != 1)
      {
        if (v91 == 2) {
          goto LABEL_49;
        }
        v127 = [MEMORY[0x1E4F28B00] currentHandler];
        [v127 handleFailureInMethod:sel__requiresSyncWithError_ object:self file:@"HDCloudSyncPullStoreOperation.m" lineNumber:392 description:@"Invalid return value form _queue_requiresSyncForSequence:error:; fell out of switch."];

LABEL_78:
        goto LABEL_79;
      }
    }
    id v102 = v236;

LABEL_67:
    v103 = [(HDCloudSyncTarget *)self->_target storeRecord];
    int v104 = [v103 isChild];

    if (v104)
    {
      id v235 = v102;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v272 = __Block_byref_object_copy__205;
      *(void *)v273 = __Block_byref_object_dispose__205;
      *(void *)&v273[8] = 0;
      v105 = +[HDDatabaseTransactionContext contextForReading];
      v106 = [(HDCloudSyncOperation *)self profile];
      v107 = [v106 database];
      uint64_t v265 = MEMORY[0x1E4F143A8];
      uint64_t v266 = 3221225472;
      uint64_t v267 = (uint64_t)__63__HDCloudSyncPullStoreOperation__childSyncIdentitiesWithError___block_invoke;
      v268 = &unk_1E62F9108;
      v270 = buf;
      v269 = self;
      char v108 = [v107 performTransactionWithContext:v105 error:&v235 block:&v265 inaccessibilityHandler:0];

      if (v108) {
        id v109 = *(id *)(*(void *)&buf[8] + 40);
      }
      else {
        id v109 = 0;
      }

      _Block_object_dispose(buf, 8);
      if (v109
        && ([(HDCloudSyncTarget *)self->_target storeRecord],
            v110 = objc_claimAutoreleasedReturnValue(),
            [v110 syncIdentity],
            v111 = objc_claimAutoreleasedReturnValue(),
            int v112 = [v109 containsObject:v111],
            v111,
            v110,
            v112))
      {
        v113 = objc_alloc_init(HDSyncAnchorMap);
        v114 = [(HDCloudSyncTarget *)self->_target store];
        v115 = [(HDCloudSyncOperation *)self configuration];
        v116 = [v115 repository];
        v117 = [v116 profile];
        v118 = [v117 legacyRepositoryProfile];
        BOOL v119 = +[HDSyncAnchorEntity getSyncAnchorsOfType:4 anchorMap:v113 store:v114 profile:v118 error:&v235];

        if (v119)
        {
          v233 = [(HDCloudSyncOperation *)self configuration];
          v120 = [v233 syncDate];
          v121 = [(HDCloudSyncTarget *)self->_target store];
          v122 = [(HDCloudSyncOperation *)self configuration];
          v123 = [v122 repository];
          v124 = [v123 profile];
          v125 = [v124 legacyRepositoryProfile];
          BOOL v126 = +[HDSyncAnchorEntity updateSyncAnchorsWithMap:v113 type:3 updateDate:v120 store:v121 updatePolicy:2 resetInvalid:0 profile:v125 error:&v235];
        }
        else
        {
          BOOL v126 = 0;
        }
      }
      else
      {
        BOOL v126 = 0;
      }

      id v216 = v235;
      if (v126)
      {
        _HKInitializeLogging();
        v128 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = self;
          _os_log_impl(&dword_1BCB7D000, v128, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping pull from own child, updated received anchors", buf, 0xCu);
        }
        [(HDCloudSyncPullStoreOperation *)self finishWithSuccess:1 error:0];
        goto LABEL_146;
      }
    }
    else
    {
      id v216 = v102;
    }
    v129 = [HDCloudSyncCachedZone alloc];
    v130 = [(HDCloudSyncTarget *)self->_target zoneIdentifier];
    v131 = [(HDCloudSyncOperation *)self configuration];
    v132 = [v131 repository];
    v133 = [(HDCloudSyncOperation *)self configuration];
    v134 = [v133 accessibilityAssertion];
    id v205 = [(HDCloudSyncCachedZone *)v129 initForZoneIdentifier:v130 repository:v132 accessibilityAssertion:v134];

    uint64_t v135 = objc_opt_class();
    v240[0] = MEMORY[0x1E4F143A8];
    v240[1] = 3221225472;
    v240[2] = __52__HDCloudSyncPullStoreOperation__fetchChangeRecords__block_invoke;
    v240[3] = &unk_1E62F50B8;
    v240[4] = self;
    id v241 = 0;
    v206 = [v205 recordsForClass:v135 error:&v241 filter:v240];
    v204 = (uint64_t (*)(uint64_t, uint64_t))v241;
    if (!v206)
    {
      _HKInitializeLogging();
      v195 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        v200 = self->_target;
        v201 = v195;
        v202 = [(HDCloudSyncTarget *)v200 zoneIdentifier];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v202;
        *(_WORD *)&buf[22] = 2114;
        v272 = v204;
        _os_log_error_impl(&dword_1BCB7D000, v201, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get change records for %{public}@, %{public}@", buf, 0x20u);
      }
      [(HDCloudSyncPullStoreOperation *)self finishWithSuccess:0 error:v204];
      goto LABEL_145;
    }
    if (![v206 count])
    {
      _HKInitializeLogging();
      v196 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        v197 = self->_target;
        v198 = v196;
        v199 = [(HDCloudSyncTarget *)v197 zoneIdentifier];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v199;
        *(_WORD *)&buf[22] = 2114;
        v272 = v204;
        _os_log_impl(&dword_1BCB7D000, v198, OS_LOG_TYPE_DEFAULT, "%{public}@ No change records fetched from cache for %{public}@, %{public}@", buf, 0x20u);
      }
      [(HDCloudSyncPullStoreOperation *)self finishWithSuccess:1 error:0];
      goto LABEL_145;
    }
    id v136 = v206;
    v137 = [(HDCloudSyncTarget *)self->_target storeRecord];
    v138 = [v137 orderedSequenceRecords];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __97__HDCloudSyncPullStoreOperation__orderedChangeRecordsBySequenceRecordIDWithFetchedChangeRecords___block_invoke;
    v272 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E630E4F8;
    id v139 = v136;
    *(void *)v273 = v139;
    v210 = objc_msgSend(v138, "hk_mapToDictionary:", buf);

    v140 = [HDCloudSyncCompoundOperation alloc];
    v141 = [(HDCloudSyncOperation *)self configuration];
    v207 = [(HDCloudSyncCompoundOperation *)v140 initWithConfiguration:v141 cloudState:0 name:@"Pull Sequences" continueOnSubOperationError:0];

    long long v245 = 0u;
    long long v243 = 0u;
    long long v244 = 0u;
    long long v242 = 0u;
    v142 = [(HDCloudSyncTarget *)self->_target storeRecord];
    id obj = [v142 orderedSequenceRecords];

    uint64_t v211 = [obj countByEnumeratingWithState:&v242 objects:&v265 count:16];
    if (!v211)
    {
LABEL_136:

      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __55__HDCloudSyncPullStoreOperation__fetchedChangeRecords___block_invoke;
      v272 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E62F2950;
      *(void *)v273 = self;
      [(HDCloudSyncOperation *)v207 setOnError:buf];
      *(void *)v274 = MEMORY[0x1E4F143A8];
      *(void *)&v274[8] = 3221225472;
      *(void *)&v274[16] = __55__HDCloudSyncPullStoreOperation__fetchedChangeRecords___block_invoke_2;
      v275 = &unk_1E62F2928;
      *(void *)&long long v276 = self;
      [(HDCloudSyncOperation *)v207 setOnSuccess:v274];
      v190 = [(HDCloudSyncOperation *)self progress];
      v191 = [(HDCloudSyncOperation *)v207 progress];
      v192 = [(HDCloudSyncOperation *)self progress];
      uint64_t v193 = [v192 totalUnitCount];
      v194 = [(HDCloudSyncOperation *)self progress];
      objc_msgSend(v190, "addChild:withPendingUnitCount:", v191, v193 - objc_msgSend(v194, "completedUnitCount"));

      [(HDCloudSyncCompoundOperation *)v207 start];
      goto LABEL_144;
    }
    uint64_t v209 = *(void *)v243;
    while (1)
    {
      uint64_t v143 = 0;
      do
      {
        if (*(void *)v243 != v209)
        {
          uint64_t v144 = v143;
          objc_enumerationMutation(obj);
          uint64_t v143 = v144;
        }
        uint64_t v213 = v143;
        v145 = *(void **)(*((void *)&v242 + 1) + 8 * v143);
        v146 = [v145 recordID];
        v215 = [v210 objectForKeyedSubscript:v146];

        if ([v215 count])
        {
          id v147 = v215;
          id v214 = v145;
          id v221 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v148 = [(HDCloudSyncTarget *)self->_target store];
          v229 = objc_msgSend(v148, "syncStoreForEpoch:", objc_msgSend(v214, "baselineEpoch"));

          id v252 = 0;
          v231 = [v229 receivedSyncAnchorMapWithError:&v252];
          id v212 = v252;
          v149 = v231;
          if (!v231)
          {
            _HKInitializeLogging();
            v150 = *MEMORY[0x1E4F29FA8];
            v149 = 0;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v212;
              _os_log_error_impl(&dword_1BCB7D000, v150, OS_LOG_TYPE_ERROR, "%{public}@: error calling receivedSyncAnchorMapWithError: %{public}@", buf, 0x16u);
            }
          }
          v227 = (void *)[v149 copy];
          long long v250 = 0u;
          long long v251 = 0u;
          long long v248 = 0u;
          long long v249 = 0u;
          id v218 = v147;
          uint64_t v234 = [v218 countByEnumeratingWithState:&v248 objects:buf count:16];
          if (v234)
          {
            uint64_t v225 = *(void *)v249;
            do
            {
              for (uint64_t i = 0; i != v234; ++i)
              {
                if (*(void *)v249 != v225) {
                  objc_enumerationMutation(v218);
                }
                v152 = *(void **)(*((void *)&v248 + 1) + 8 * i);
                v153 = [v152 decodedSyncAnchorRangeMap];
                v154 = [v229 shardPredicate];
                BOOL v155 = [v154 type] == 2;
                id v156 = v153;
                id v157 = v227;
                if (v156 && (![v156 anchorRangeCount] ? (BOOL v158 = 1) : (BOOL v158 = v227 == 0), !v158))
                {
                  v161 = [(HDCloudSyncOperation *)self configuration];
                  v162 = [v161 repository];
                  v163 = [v162 profile];
                  v164 = [v163 legacyRepositoryProfile];

                  uint64_t v259 = 0;
                  v260 = &v259;
                  uint64_t v261 = 0x2020000000;
                  char v262 = 1;
                  uint64_t v253 = 0;
                  v254 = &v253;
                  uint64_t v255 = 0x3032000000;
                  v256 = __Block_byref_object_copy__205;
                  v257 = __Block_byref_object_dispose__205;
                  id v258 = 0;
                  *(void *)v274 = MEMORY[0x1E4F143A8];
                  *(void *)&v274[8] = 3221225472;
                  *(void *)&v274[16] = __93__HDCloudSyncPullStoreOperation__isValidAnchorRangeMap_lastAnchorMap_allowStartingGap_error___block_invoke;
                  v275 = &unk_1E630E520;
                  id v165 = v164;
                  *(void *)&long long v276 = v165;
                  id v166 = v157;
                  BOOL v279 = v155;
                  *((void *)&v276 + 1) = v166;
                  v277 = &v253;
                  v278 = &v259;
                  [v156 enumerateAnchorRangesAndEntityIdentifiersWithBlock:v274];
                  id v167 = (id)v254[5];
                  v159 = v167;
                  if (v167) {
                    id v168 = v167;
                  }

                  BOOL v160 = *((unsigned char *)v260 + 24) != 0;
                  _Block_object_dispose(&v253, 8);

                  _Block_object_dispose(&v259, 8);
                }
                else
                {
                  v159 = 0;
                  BOOL v160 = 1;
                }

                id v169 = v159;
                if (!v160)
                {
                  _HKInitializeLogging();
                  v170 = (void *)*MEMORY[0x1E4F29FA8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                  {
                    v179 = v170;
                    uint64_t v180 = [v152 changeIndex];
                    *(_DWORD *)v274 = 138544130;
                    *(void *)&v274[4] = self;
                    *(_WORD *)&v274[12] = 2048;
                    *(void *)&v274[14] = v180;
                    *(_WORD *)&v274[22] = 2114;
                    v275 = v156;
                    LOWORD(v276) = 2114;
                    *(void *)((char *)&v276 + 2) = v169;
                    _os_log_error_impl(&dword_1BCB7D000, v179, OS_LOG_TYPE_ERROR, "%{public}@: %lld %{public}@ - failed validity check: %{public}@", v274, 0x2Au);
                  }
                }
                BOOL v171 = v156 == 0;
                v246[0] = MEMORY[0x1E4F143A8];
                v246[1] = 3221225472;
                v246[2] = __95__HDCloudSyncPullStoreOperation__requiredRecordsWithOrderedChangeRecords_sequenceRecord_error___block_invoke;
                v246[3] = &unk_1E62F5B78;
                id v247 = v157;
                [v156 enumerateAnchorRangesAndEntityIdentifiersWithBlock:v246];
                id v172 = v156;
                id v173 = v231;
                if (!v171 && [v172 anchorRangeCount] && objc_msgSend(v173, "anchorCount"))
                {
                  uint64_t v253 = 0;
                  v254 = &v253;
                  uint64_t v255 = 0x2020000000;
                  LOBYTE(v256) = 0;
                  *(void *)v274 = MEMORY[0x1E4F143A8];
                  *(void *)&v274[8] = 3221225472;
                  *(void *)&v274[16] = __78__HDCloudSyncPullStoreOperation__shouldApplyAnchorRangeMap_receivedAnchorMap___block_invoke;
                  v275 = &unk_1E62F5D70;
                  id v174 = v173;
                  *(void *)&long long v276 = v174;
                  *((void *)&v276 + 1) = &v253;
                  [v172 enumerateAnchorRangesAndEntityIdentifiersWithBlock:v274];
                  BOOL v175 = *((unsigned char *)v254 + 24) == 0;

                  _Block_object_dispose(&v253, 8);
                  if (v175) {
                    goto LABEL_123;
                  }
                }
                else
                {
                }
                _HKInitializeLogging();
                v176 = (void *)*MEMORY[0x1E4F29FA8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
                {
                  v177 = v176;
                  uint64_t v178 = [v152 changeIndex];
                  *(_DWORD *)v274 = 138543874;
                  *(void *)&v274[4] = self;
                  *(_WORD *)&v274[12] = 2048;
                  *(void *)&v274[14] = v178;
                  *(_WORD *)&v274[22] = 2114;
                  v275 = v172;
                  _os_log_impl(&dword_1BCB7D000, v177, OS_LOG_TYPE_DEFAULT, "%{public}@: %lld %{public}@", v274, 0x20u);
                }
                [v221 addObject:v152];
LABEL_123:
              }
              uint64_t v234 = [v218 countByEnumeratingWithState:&v248 objects:buf count:16];
            }
            while (v234);
          }

          if (!v221)
          {
            [(HDCloudSyncPullStoreOperation *)self finishWithSuccess:0 error:0];

LABEL_144:
LABEL_145:

LABEL_146:
            return;
          }
          _HKInitializeLogging();
          v181 = (id)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled(v181, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v182 = [v214 slot];
            if ((v182 - 1) >= 3)
            {
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v182);
              v183 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v183 = off_1E630E540[(int)v182 - 1];
            }
            v184 = v183;
            uint64_t v185 = [v221 count];
            uint64_t v186 = [v218 count];
            *(_DWORD *)buf = 138544130;
            *(void *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v183;
            *(_WORD *)&buf[22] = 2048;
            v272 = (uint64_t (*)(uint64_t, uint64_t))v185;
            *(_WORD *)v273 = 2048;
            *(void *)&v273[2] = v186;
            _os_log_impl(&dword_1BCB7D000, v181, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: %lu/%lu required changes.", buf, 0x2Au);
          }
          if ([v221 count])
          {
            v187 = [HDCloudSyncPullSequenceOperation alloc];
            v188 = [(HDCloudSyncOperation *)self configuration];
            v189 = [(HDCloudSyncPullSequenceOperation *)v187 initWithConfiguration:v188 cloudState:0 target:self->_target sequence:v214 changes:v221];

            [(HDCloudSyncCompoundOperation *)v207 addOperation:v189 transitionHandler:0];
          }
        }
        uint64_t v143 = v213 + 1;
      }
      while (v213 + 1 != v211);
      uint64_t v211 = [obj countByEnumeratingWithState:&v242 objects:&v265 count:16];
      if (!v211) {
        goto LABEL_136;
      }
    }
  }

  [(HDCloudSyncPullStoreOperation *)self finishWithSuccess:1 error:0];
}

- (BOOL)finishWithSuccess:(BOOL)a3 error:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)HDCloudSyncPullStoreOperation;
  unsigned int v5 = [(HDCloudSyncOperation *)&v16 finishWithSuccess:a3 error:a4] && a3;
  if (v5 == 1)
  {
    uint64_t v6 = [(HDCloudSyncOperation *)self configuration];
    uint64_t v7 = [v6 repository];
    v8 = [v7 profile];
    id v9 = [v8 legacyRepositoryProfile];

    if ([v9 profileType] != 3
      || ([(HDCloudSyncTarget *)self->_target storeRecord],
          v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 deviceMode],
          v10,
          v11 == 2))
    {
      v12 = [(HDCloudSyncTarget *)self->_target storeRecord];
      objc_super v13 = [v12 record];
      v14 = [v13 modificationDate];

      HDCloudSyncDidPullUpdateWithDate(v14, v9);
    }
  }
  return v5;
}

uint64_t __52__HDCloudSyncPullStoreOperation__fetchChangeRecords__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return 0;
  }
  int v3 = [a2 record];
  v4 = [*(id *)(v2 + 112) storeRecord];
  unsigned int v5 = [v4 tombstoneSequenceRecord];
  if (v5)
  {
    uint64_t v6 = [*(id *)(v2 + 112) storeRecord];
    uint64_t v7 = [v6 tombstoneSequenceRecord];
    BOOL v8 = +[HDCloudSyncChangeRecord isChangeRecord:v3 inSequence:v7];
  }
  else
  {
    BOOL v8 = 0;
  }

  id v9 = [*(id *)(v2 + 112) storeRecord];
  v10 = [v9 sequenceRecord];

  uint64_t v11 = v8 | +[HDCloudSyncChangeRecord isChangeRecord:v3 inSequence:v10];
  if ((v11 & 1) == 0)
  {
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
    {
      v14 = v12;
      v15 = [v3 recordID];
      int v16 = 138543618;
      uint64_t v17 = v2;
      __int16 v18 = 2114;
      v19 = v15;
      _os_log_debug_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@: is not in tombstone sequence or pull sequence, do not add", (uint8_t *)&v16, 0x16u);
    }
  }

  return v11;
}

uint64_t __55__HDCloudSyncPullStoreOperation__resetPullState_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 record];
  unsigned int v5 = [*(id *)(*(void *)(a1 + 32) + 112) storeRecord];
  uint64_t v6 = [v5 currentSequenceHeaderRecord];
  if (+[HDCloudSyncChangeRecord isChangeRecord:v4 inSequence:v6])
  {
  }
  else
  {
    uint64_t v7 = [v3 record];
    BOOL v8 = [*(id *)(*(void *)(a1 + 32) + 112) storeRecord];
    id v9 = [v8 oldSequenceHeaderRecord];
    BOOL v10 = +[HDCloudSyncChangeRecord isChangeRecord:v7 inSequence:v9];

    if (!v10)
    {
      uint64_t v12 = 1;
      goto LABEL_7;
    }
  }
  int v11 = [v3 protocolVersion];
  uint64_t v12 = 1;
  if (v11 > (int)[*(id *)(a1 + 40) syncProtocolVersion])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v12 = 0;
  }
LABEL_7:

  return v12;
}

- (BOOL)_copyAnchorsOfType:(void *)a1 from:(void *)a2 to:(void *)a3 error:(uint64_t)a4
{
  id v23 = a3;
  id v7 = a2;
  BOOL v8 = objc_alloc_init(HDSyncAnchorMap);
  id v9 = [a1 configuration];
  BOOL v10 = [v9 repository];
  int v11 = [v10 profile];
  uint64_t v12 = [v11 legacyRepositoryProfile];
  BOOL v13 = +[HDSyncAnchorEntity getSyncAnchorsOfType:3 anchorMap:v8 store:v7 profile:v12 error:a4];

  if (v13)
  {
    v14 = [a1 configuration];
    v15 = [v14 syncDate];
    int v16 = [a1 configuration];
    uint64_t v17 = [v16 repository];
    __int16 v18 = [v17 profile];
    v19 = [v18 legacyRepositoryProfile];
    uint64_t v20 = v23;
    BOOL v21 = +[HDSyncAnchorEntity updateSyncAnchorsWithMap:v8 type:3 updateDate:v15 store:v23 updatePolicy:2 resetInvalid:0 profile:v19 error:a4];
  }
  else
  {
    BOOL v21 = 0;
    uint64_t v20 = v23;
  }

  return v21;
}

- (uint64_t)_requiresSyncForSequence:(uint64_t)a3 error:
{
  id v5 = a2;
  uint64_t v6 = [a1[14] store];
  v30 = v5;
  uint64_t v7 = objc_msgSend(v6, "syncStoreForEpoch:", objc_msgSend(v5, "baselineEpoch"));

  BOOL v8 = [a1 configuration];
  id v9 = [v8 repository];
  BOOL v10 = [v9 syncEngine];
  int v11 = [a1 configuration];
  uint64_t v12 = [v11 repository];
  BOOL v13 = [v12 profile];
  v14 = [v13 legacyRepositoryProfile];
  v29 = (void *)v7;
  LODWORD(v7) = [v10 updateLocalVersionsForStore:v7 profile:v14 error:a3];

  if (v7)
  {
    v15 = v30;
    int v16 = [v30 syncAnchorMap];
    uint64_t v17 = objc_alloc_init(HDSyncAnchorMap);
    __int16 v18 = [a1 configuration];
    v19 = [v18 repository];
    uint64_t v20 = [v19 profile];
    BOOL v21 = [v20 legacyRepositoryProfile];
    v22 = v29;
    BOOL v23 = +[HDSyncAnchorEntity getSyncAnchorsOfType:3 anchorMap:v17 store:v29 profile:v21 error:a3];

    if (v23)
    {
      uint64_t v34 = 0;
      v35 = &v34;
      uint64_t v36 = 0x3032000000;
      id v37 = __Block_byref_object_copy__205;
      v38 = __Block_byref_object_dispose__205;
      id v39 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v24 = [v29 orderedSyncEntities];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __64__HDCloudSyncPullStoreOperation__requiresSyncForSequence_error___block_invoke;
      v31[3] = &unk_1E63084E8;
      id v25 = v24;
      id v32 = v25;
      v33 = &v34;
      [v16 enumerateAnchorsAndEntityIdentifiersWithBlock:v31];
      v26 = +[HDSyncAnchorMap syncAnchorMapWithDictionary:v35[5]];
      if (HDSyncAnchorMapIsSuperset(v26, v17)) {
        uint64_t v27 = 2;
      }
      else {
        uint64_t v27 = 1;
      }

      _Block_object_dispose(&v34, 8);
    }
    else
    {
      uint64_t v27 = 0;
    }
  }
  else
  {
    uint64_t v27 = 0;
    v22 = v29;
    v15 = v30;
  }

  return v27;
}

void __64__HDCloudSyncPullStoreOperation__requiresSyncForSequence_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__HDCloudSyncPullStoreOperation__requiresSyncForSequence_error___block_invoke_2;
  v9[3] = &unk_1E63034B8;
  id v7 = v5;
  id v10 = v7;
  if (objc_msgSend(v6, "hk_containsObjectPassingTest:", v9))
  {
    BOOL v8 = [NSNumber numberWithLongLong:a3];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v8 forKeyedSubscript:v7];
  }
}

uint64_t __64__HDCloudSyncPullStoreOperation__requiresSyncForSequence_error___block_invoke_2(uint64_t a1, void *a2)
{
  v4 = [a2 syncEntityIdentifier];
  id v5 = *(void **)(a1 + 32);
  if (v4 == v5)
  {
    uint64_t v7 = 1;
  }
  else if (v5)
  {
    uint64_t v6 = [a2 syncEntityIdentifier];
    uint64_t v7 = [v6 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __55__HDCloudSyncPullStoreOperation__fetchedChangeRecords___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithSuccess:0 error:a3];
}

uint64_t __55__HDCloudSyncPullStoreOperation__fetchedChangeRecords___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithSuccess:1 error:0];
}

void __97__HDCloudSyncPullStoreOperation__orderedChangeRecordsBySequenceRecordIDWithFetchedChangeRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __97__HDCloudSyncPullStoreOperation__orderedChangeRecordsBySequenceRecordIDWithFetchedChangeRecords___block_invoke_2;
  v12[3] = &unk_1E630E4D0;
  id v8 = v5;
  id v13 = v8;
  id v9 = objc_msgSend(v7, "hk_filter:", v12);
  id v10 = [v9 sortedArrayUsingSelector:sel_compare_];

  if ([v10 count])
  {
    int v11 = [v8 recordID];
    v6[2](v6, v11, v10);
  }
}

uint64_t __97__HDCloudSyncPullStoreOperation__orderedChangeRecordsBySequenceRecordIDWithFetchedChangeRecords___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 sequenceRecordID];
  v4 = [*(id *)(a1 + 32) recordID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __95__HDCloudSyncPullStoreOperation__requiredRecordsWithOrderedChangeRecords_sequenceRecord_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) setAnchor:a4 forSyncEntityIdentifier:a2];
}

void __93__HDCloudSyncPullStoreOperation__isValidAnchorRangeMap_lastAnchorMap_allowStartingGap_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  id v10 = [*(id *)(a1 + 32) syncEngine];
  int v11 = [v10 allSyncEntitiesByIdentifier];
  uint64_t v12 = [v11 objectForKeyedSubscript:v9];

  if (v12)
  {
    uint64_t v13 = [*(id *)(a1 + 40) anchorForSyncEntityIdentifier:v9];
    if (a3 > v13)
    {
      uint64_t v14 = v13;
      if (v13 > 0 || !*(unsigned char *)(a1 + 64))
      {
        v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
        id obj = *(id *)(v16 + 40);
        uint64_t v17 = HDSyncAnchorRangeDescription(a3, a4);
        objc_msgSend(v15, "hk_assignError:code:format:", &obj, 1400, @"anchor range %@ invalid for %@, last anchor %lld", v17, v9, v14);
        objc_storeStrong((id *)(v16 + 40), obj);

        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        *a5 = 1;
      }
    }
  }
}

uint64_t __78__HDCloudSyncPullStoreOperation__shouldApplyAnchorRangeMap_receivedAnchorMap___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [*(id *)(a1 + 32) anchorForSyncEntityIdentifier:a2];
  if (a4 > result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

BOOL __63__HDCloudSyncPullStoreOperation__childSyncIdentitiesWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 profile];
  id v8 = [v7 syncIdentityManager];
  uint64_t v9 = [v8 childIdentitiesForCurrentSyncIdentityWithTransaction:v6 error:a3];

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  int v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (BOOL)hasAppliedChange
{
  return self->_hasAppliedChange;
}

- (HDCloudSyncTarget)target
{
  return self->_target;
}

- (void).cxx_destruct
{
}

@end