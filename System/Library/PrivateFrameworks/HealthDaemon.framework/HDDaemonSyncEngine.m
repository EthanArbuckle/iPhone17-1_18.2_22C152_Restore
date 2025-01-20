@interface HDDaemonSyncEngine
- (BOOL)applyAcknowledgedAnchorMap:(id)a3 forStore:(id)a4 resetNext:(BOOL)a5 resetInvalid:(BOOL)a6 error:(id *)a7;
- (BOOL)applySyncChange:(id)a3 forStore:(id)a4 error:(id *)a5;
- (BOOL)getReceivedAnchorMap:(id)a3 forStore:(id)a4 error:(id *)a5;
- (BOOL)performSyncSession:(id)a3 accessibilityAssertion:(id)a4 error:(id *)a5;
- (BOOL)resetNextAnchorsForStore:(id)a3 profile:(id)a4 minimumElapsedTime:(double)a5 error:(id *)a6;
- (BOOL)updateLocalVersionsForStore:(id)a3 profile:(id)a4 error:(id *)a5;
- (HDDaemonSyncEngine)initWithProfile:(id)a3;
- (HDSyncAnchorRangeMap)_syncAnchorRangeMapForSession:(uint64_t)a1 store:(void *)a2 syncEntities:(void *)a3 startingAnchors:(void *)a4 error:(uint64_t)a5;
- (NSArray)allOrderedSyncEntities;
- (NSDictionary)allSyncEntitiesByIdentifier;
- (id)syncAnchorRangesIfRequiredForSession:(id)a3 startingAnchors:(id)a4 error:(id *)a5;
- (id)unitTest_didCompleteReadTransaction;
- (uint64_t)_applySyncChange:(objc_class *)a3 entity:(void *)a4 store:(void *)a5 error:;
- (uint64_t)_nextSyncAnchorForEntity:(void *)a3 session:(uint64_t)a4 startSyncAnchor:(uint64_t)a5 error:;
- (uint64_t)_validateAnchorsForSyncChange:(void *)a3 store:(void *)a4 error:;
- (void)resetAnchorsWithFailedChanges:(id)a3 store:(id)a4;
- (void)resetStore:(id)a3;
- (void)setUnitTest_didCompleteReadTransaction:(id)a3;
@end

@implementation HDDaemonSyncEngine

- (BOOL)applyAcknowledgedAnchorMap:(id)a3 forStore:(id)a4 resetNext:(BOOL)a5 resetInvalid:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  p_profile = &self->_profile;
  id v12 = a4;
  id v13 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a7) = +[HDSyncAnchorEntity setAcknowledgedAnchorsWithMap:v13 store:v12 resetNext:v9 resetInvalid:v8 profile:WeakRetained error:a7];

  return (char)a7;
}

- (BOOL)getReceivedAnchorMap:(id)a3 forStore:(id)a4 error:(id *)a5
{
  p_profile = &self->_profile;
  id v8 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a5) = +[HDSyncAnchorEntity getSyncAnchorsOfType:3 anchorMap:v9 store:v8 profile:WeakRetained error:a5];

  return (char)a5;
}

- (BOOL)applySyncChange:(id)a3 forStore:(id)a4 error:(id *)a5
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = &unk_1F181B8F8;
  if (([v7 conformsToProtocol:v9] & 1) == 0)
  {
    v47 = (void *)MEMORY[0x1E4F28C58];
    v48 = NSStringFromProtocol((Protocol *)v9);
    objc_msgSend(v47, "hk_assignError:code:format:", a5, 125, @"%@ does not conform to %@", v7, v48);

    BOOL v46 = 0;
    goto LABEL_35;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v13 = [v7 syncEntityClassForProfile:WeakRetained];

  _HKInitializeLogging();
  v14 = (os_log_t *)MEMORY[0x1E4F29FA8];
  v15 = *MEMORY[0x1E4F29FA8];
  v112 = (HDDaemonSyncEngine *)v13;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
  {
    v16 = v15;
    uint64_t v17 = [v7 syncAnchorRange];
    [v7 syncAnchorRange];
    id v18 = v8;
    v19 = v9;
    v21 = v20;
    v22 = [v7 sequenceNumber];
    *(_DWORD *)buf = 138544130;
    v122 = (HDDaemonSyncEngine *)v13;
    __int16 v123 = 2048;
    v124 = (HDDaemonSyncEngine *)v17;
    v14 = (os_log_t *)MEMORY[0x1E4F29FA8];
    __int16 v125 = 2048;
    id v126 = v21;
    id v9 = v19;
    id v8 = v18;
    p_profile = &self->_profile;
    __int16 v127 = 2114;
    uint64_t v128 = (uint64_t)v22;
    _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_INFO, "Apply Sync change for %{public}@ over range (%lld, %lld) with sequence %{public}@", buf, 0x2Au);

    v15 = *v14;
  }
  os_signpost_id_t v23 = os_signpost_id_make_with_pointer(v15, self);
  _HKInitializeLogging();
  os_log_t v24 = *v14;
  if (os_signpost_enabled(*v14))
  {
    v25 = v24;
    v26 = v25;
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      uint64_t v27 = [v7 syncAnchorRange];
      [v7 syncAnchorRange];
      v28 = p_profile;
      id v29 = v8;
      v30 = v14;
      v32 = v31;
      [v7 sequenceNumber];
      v33 = v110 = v9;
      uint64_t v34 = [v33 integerValue];
      *(_DWORD *)buf = 138544130;
      v122 = v112;
      __int16 v123 = 2048;
      v124 = (HDDaemonSyncEngine *)v27;
      __int16 v125 = 2048;
      id v126 = v32;
      v14 = v30;
      id v8 = v29;
      p_profile = v28;
      __int16 v127 = 2048;
      uint64_t v128 = v34;
      _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v23, "apply-sync-change", "syncEntityClass=%{public}@, start=%lld, end=%lld, sequence=%ld", buf, 0x2Au);

      id v9 = v110;
    }
  }
  if (!v112)
  {
    _HKInitializeLogging();
    os_log_t v53 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      v50 = v53;
      v89 = [v7 syncEntityIdentifier];
      *(_DWORD *)buf = 138543362;
      v122 = v89;
      _os_log_error_impl(&dword_1BCB7D000, v50, OS_LOG_TYPE_ERROR, "No sync entity available for change with sync entity identifier %{public}@; change will be ignored.",
        buf,
        0xCu);

      goto LABEL_55;
    }
LABEL_24:
    BOOL v46 = 1;
    goto LABEL_35;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![(HDDaemonSyncEngine *)v112 supportsSyncStore:v8]
    || ([v8 canRecieveSyncObjectsForEntityClass:v112] & 1) == 0)
  {
    _HKInitializeLogging();
    os_log_t v49 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      v50 = v49;
      [(HDDaemonSyncEngine *)v112 syncEntityIdentifier];
      id v51 = v8;
      v52 = (HDDaemonSyncEngine *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v122 = v112;
      __int16 v123 = 2114;
      v124 = v52;
      __int16 v125 = 2114;
      id v126 = v51;
      _os_log_error_impl(&dword_1BCB7D000, v50, OS_LOG_TYPE_ERROR, "Ignoring sync change with sync entity class %{public}@ (%{public}@), unsupported by %{public}@", buf, 0x20u);

      id v8 = v51;
LABEL_55:

      goto LABEL_24;
    }
    goto LABEL_24;
  }
  v111 = v9;
  id v35 = v7;
  id v36 = v8;
  v37 = v36;
  if (!self)
  {

    goto LABEL_19;
  }
  if (![v36 shouldEnforceSequenceOrdering])
  {
LABEL_29:
    os_signpost_id_t v106 = v23;
    id v109 = v8;

    id v58 = objc_loadWeakRetained((id *)p_profile);
    v59 = [v58 database];
    v117[0] = MEMORY[0x1E4F143A8];
    v117[1] = 3221225472;
    v117[2] = __53__HDDaemonSyncEngine_applySyncChange_forStore_error___block_invoke;
    v117[3] = &unk_1E62FD1C0;
    v120 = v112;
    id v60 = v37;
    id v118 = v60;
    id v61 = v35;
    id v119 = v61;
    BOOL v62 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v59 error:a5 block:v117];

    if (!v62)
    {
LABEL_33:
      BOOL v46 = 0;
      id v8 = v109;
      id v9 = v111;
LABEL_34:

      goto LABEL_35;
    }
    if ([v61 isSpeculative])
    {
      if (([v60 supportsSpeculativeChangesForSyncEntityClass:v112] & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 100, @"%@ does not support speculative changes", v112);
        goto LABEL_33;
      }
LABEL_40:
      char v67 = -[HDDaemonSyncEngine _applySyncChange:entity:store:error:]((uint64_t)self, v61, (objc_class *)v112, v60, a5);
      _HKInitializeLogging();
      v68 = (os_log_t *)MEMORY[0x1E4F29FA8];
      v69 = *MEMORY[0x1E4F29FA8];
      BOOL v70 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO);
      if (v67)
      {
        v105 = v60;
        if (v70)
        {
          v71 = v69;
          uint64_t v72 = [v61 syncAnchorRange];
          [v61 syncAnchorRange];
          v74 = v73;
          v75 = [v61 sequenceNumber];
          CFAbsoluteTime v76 = CFAbsoluteTimeGetCurrent();
          *(_DWORD *)buf = 138544386;
          v122 = v112;
          __int16 v123 = 2048;
          v124 = (HDDaemonSyncEngine *)v72;
          __int16 v125 = 2048;
          id v126 = v74;
          __int16 v127 = 2114;
          uint64_t v128 = (uint64_t)v75;
          __int16 v129 = 2048;
          double v130 = v76 - Current;
          _os_log_impl(&dword_1BCB7D000, v71, OS_LOG_TYPE_INFO, "Applied sync change for %{public}@ over range (%lld, %lld) sequence %{public}@ in %.3f seconds", buf, 0x34u);

          v68 = (os_log_t *)MEMORY[0x1E4F29FA8];
        }
        _HKInitializeLogging();
        os_log_t v77 = *v68;
        id v8 = v109;
        if (os_signpost_enabled(*v68))
        {
          v78 = v77;
          v79 = v78;
          if (v106 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
          {
            uint64_t v80 = [v61 syncAnchorRange];
            [v61 syncAnchorRange];
            v82 = v81;
            v83 = [v61 sequenceNumber];
            uint64_t v84 = [v83 integerValue];
            *(_DWORD *)buf = 138544130;
            v122 = v112;
            __int16 v123 = 2048;
            v124 = (HDDaemonSyncEngine *)v80;
            id v8 = v109;
            __int16 v125 = 2048;
            id v126 = v82;
            __int16 v127 = 2048;
            uint64_t v128 = v84;
            _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v79, OS_SIGNPOST_INTERVAL_END, v106, "apply-sync-change", "syncEntityClass=%{public}@, start=%lld, end=%lld, sequence=%ld", buf, 0x2Au);

            v68 = (os_log_t *)MEMORY[0x1E4F29FA8];
          }
        }
        v85 = [v61 sequenceNumber];
        int v86 = [v61 done];
        if (v85
          && ((int v87 = v86, ([v61 done] & 1) == 0)
            ? (uint64_t v88 = [v85 integerValue] + 1)
            : (uint64_t v88 = 0),
              [v105 setExpectedSequenceNumber:v88 forSyncEntityClass:v112],
              !v87)
          || ([v61 isSpeculative] & 1) != 0)
        {
          BOOL v46 = 1;
          id v9 = v111;
        }
        else
        {
          v107 = v85;
          [v61 syncAnchorRange];
          uint64_t v93 = v92;
          v94 = [(HDDaemonSyncEngine *)v112 syncEntityIdentifier];
          id v95 = objc_loadWeakRetained((id *)p_profile);
          v103 = a5;
          uint64_t v114 = v93;
          LOBYTE(v93) = +[HDSyncAnchorEntity updateSyncAnchor:v93 type:3 entityIdentifier:v94 store:v105 updatePolicy:1 profile:v95 error:v103];

          if (v93)
          {
            unint64_t v96 = (unint64_t)[v61 versionRange] >> 32;
            if ((int)HDCurrentSyncVersionForSyncEntity(v112) >= (int)v96)
            {
              v98 = [(HDDaemonSyncEngine *)v112 syncEntityIdentifier];
              id v99 = objc_loadWeakRetained((id *)p_profile);
              id v115 = 0;
              BOOL v100 = +[HDSyncAnchorEntity updateSyncAnchor:v114 type:5 entityIdentifier:v98 store:v105 updatePolicy:1 profile:v99 error:&v115];
              id v101 = v115;

              id v9 = v111;
              if (!v100)
              {
                _HKInitializeLogging();
                v102 = *v68;
                if (os_log_type_enabled(*v68, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  v122 = self;
                  __int16 v123 = 2114;
                  v124 = v112;
                  __int16 v125 = 2114;
                  id v126 = v101;
                  _os_log_error_impl(&dword_1BCB7D000, v102, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update validated anchor for %{public}@: %{public}@", buf, 0x20u);
                }
              }

              BOOL v46 = 1;
              id v8 = v109;
            }
            else
            {
              BOOL v46 = 1;
              id v8 = v109;
              id v9 = v111;
            }
            v85 = v107;
          }
          else
          {
            _HKInitializeLogging();
            v97 = *v68;
            id v8 = v109;
            id v9 = v111;
            v85 = v107;
            if (os_log_type_enabled(*v68, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BCB7D000, v97, OS_LOG_TYPE_INFO, "failed to write received anchor", buf, 2u);
            }
            BOOL v46 = 0;
          }
        }
      }
      else
      {
        id v8 = v109;
        id v9 = v111;
        if (v70)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BCB7D000, v69, OS_LOG_TYPE_INFO, "Failed to apply object collection.", buf, 2u);
        }
        BOOL v46 = 0;
      }
      goto LABEL_34;
    }
    id v116 = 0;
    v64 = v60;
    uint64_t v65 = -[HDDaemonSyncEngine _validateAnchorsForSyncChange:store:error:]((uint64_t)self, v61, v60, &v116);
    id v66 = v116;
    id v8 = v109;
    if (v65 == 1)
    {
      BOOL v46 = 1;
      id v9 = v111;
    }
    else
    {
      if (v65 != 2 || ([v64 shouldContinueAfterAnchorValidationError:v66] & 1) != 0)
      {

        id v60 = v64;
        goto LABEL_40;
      }
      id v90 = v66;
      v91 = v90;
      id v9 = v111;
      if (v90)
      {
        if (a5) {
          *a5 = v90;
        }
        else {
          _HKLogDroppedError();
        }
      }

      BOOL v46 = 0;
    }

    goto LABEL_34;
  }
  id v38 = objc_loadWeakRetained((id *)p_profile);
  uint64_t v39 = [v35 syncEntityClassForProfile:v38];

  v108 = v35;
  v40 = [v35 sequenceNumber];
  if (!v40) {
    goto LABEL_28;
  }
  uint64_t v41 = v39;
  uint64_t v42 = v39;
  v43 = v40;
  uint64_t v44 = [v37 expectedSequenceNumberForSyncEntityClass:v42];
  v104 = v43;
  uint64_t v45 = [v43 integerValue];
  if (!v45)
  {
    v40 = v43;
    if (v44)
    {
      v54 = (HDDaemonSyncEngine *)v41;
      uint64_t v55 = v44;
      _HKInitializeLogging();
      v56 = *MEMORY[0x1E4F29FA8];
      BOOL v57 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO);
      v40 = v104;
      if (v57)
      {
        *(_DWORD *)buf = 138543618;
        v122 = v54;
        __int16 v123 = 2048;
        v124 = (HDDaemonSyncEngine *)v55;
        _os_log_impl(&dword_1BCB7D000, v56, OS_LOG_TYPE_INFO, "Received restart of sequence for %{public}@ (expecting %ld)", buf, 0x16u);
        v40 = v104;
      }
    }
    goto LABEL_28;
  }
  v40 = v43;
  if (v44 == v45)
  {
LABEL_28:

    id v35 = v108;
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 1402, @"Received out-of-order message for %@: Expected sequence number %ld but received %ld", v41, v44, v45);

LABEL_19:
  BOOL v46 = 0;
  id v9 = v111;
LABEL_35:

  return v46;
}

- (uint64_t)_validateAnchorsForSyncChange:(void *)a3 store:(void *)a4 error:
{
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    uint64_t v18 = 0;
    goto LABEL_15;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  v10 = (void *)[v7 syncEntityClassForProfile:WeakRetained];

  v11 = [v8 profile];
  id v12 = [v7 requiredAnchorMapWithProfile:v11 error:a4];

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a4, 1400, @"invalid required anchor map");
LABEL_13:
    uint64_t v18 = 2;
    goto LABEL_14;
  }
  uint64_t v13 = [v10 syncEntityIdentifier];
  id v14 = objc_loadWeakRetained((id *)(a1 + 8));
  unint64_t v15 = +[HDSyncAnchorEntity syncAnchorOfType:3 entityIdentifier:v13 store:v8 profile:v14 error:a4];

  if ((v15 & 0x8000000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 1400, @"invalid last anchor %lld", v15);
    goto LABEL_13;
  }
  unint64_t v16 = [v7 syncAnchorRange];
  if ((v16 & 0x8000000000000000) != 0 || v17 < 0 || (uint64_t)v16 > v17)
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    v20 = HDSyncAnchorRangeDescription(v16, v17);
    objc_msgSend(v19, "hk_assignError:code:format:", a4, 1400, @"invalid anchor range %@", v20);

    goto LABEL_13;
  }
  if (v16 >= v15 || v17 > v15)
  {
    if (v16 <= v15)
    {
      uint64_t v37 = 0;
      id v38 = &v37;
      uint64_t v39 = 0x2020000000;
      char v40 = 1;
      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x3032000000;
      uint64_t v34 = __Block_byref_object_copy__179;
      id v35 = __Block_byref_object_dispose__179;
      id v36 = 0;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __64__HDDaemonSyncEngine__validateAnchorsForSyncChange_store_error___block_invoke;
      v26[3] = &unk_1E630B190;
      id v27 = v8;
      uint64_t v28 = a1;
      id v29 = &v31;
      v30 = &v37;
      [v12 enumerateAnchorsAndEntityIdentifiersWithBlock:v26];
      if (*((unsigned char *)v38 + 24))
      {
        uint64_t v18 = 0;
      }
      else
      {
        id v24 = (id)v32[5];
        v25 = v24;
        if (v24)
        {
          if (a4) {
            *a4 = v24;
          }
          else {
            _HKLogDroppedError();
          }
        }

        uint64_t v18 = 2 * (*((unsigned char *)v38 + 24) == 0);
      }

      _Block_object_dispose(&v31, 8);
      _Block_object_dispose(&v37, 8);
      goto LABEL_14;
    }
    v22 = (void *)MEMORY[0x1E4F28C58];
    os_signpost_id_t v23 = HDSyncAnchorRangeDescription(v16, v17);
    objc_msgSend(v22, "hk_assignError:code:format:", a4, 1400, @"unexpected anchor range %@ for %@, last anchor %lld", v23, v10, v15);

    goto LABEL_13;
  }
  uint64_t v18 = 1;
LABEL_14:

LABEL_15:
  return v18;
}

void __64__HDDaemonSyncEngine__validateAnchorsForSyncChange_store_error___block_invoke(void *a1, void *a2, int64_t a3, unsigned char *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = a1[4];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 8));
  id v19 = 0;
  int64_t v10 = +[HDSyncAnchorEntity syncAnchorOfType:3 entityIdentifier:v7 store:v8 profile:WeakRetained error:&v19];
  id v11 = v19;
  id v12 = v19;

  if (v10 == -1 && v12 != 0)
  {
    _HKInitializeLogging();
    uint64_t v17 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_INFO, "Failed to lookup existing anchor for sync entity: %{public}@", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v11);
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
    goto LABEL_11;
  }
  if (v10 < a3)
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 1400, @"change requires anchor %lld for %@, but we only have %lld", a3, v7, v10);
    uint64_t v15 = *(void *)(a1[6] + 8);
    unint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

LABEL_11:
    *a4 = 1;
  }
}

- (HDDaemonSyncEngine)initWithProfile:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDDaemonSyncEngine;
  v5 = [(HDDaemonSyncEngine *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    id v7 = [HDDaemonSyncEntityManager alloc];
    uint64_t v8 = [v4 daemon];
    uint64_t v9 = [(HDDaemonSyncEntityManager *)v7 initWithDaemon:v8];
    entityManager = v6->_entityManager;
    v6->_entityManager = (HDDaemonSyncEntityManager *)v9;
  }
  return v6;
}

- (NSArray)allOrderedSyncEntities
{
  return [(HDDaemonSyncEntityManager *)self->_entityManager orderedSyncEntities];
}

- (NSDictionary)allSyncEntitiesByIdentifier
{
  return [(HDDaemonSyncEntityManager *)self->_entityManager syncEntitiesByIdentifier];
}

- (BOOL)updateLocalVersionsForStore:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 orderedSyncEntities];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __64__HDDaemonSyncEngine_updateLocalVersionsForStore_profile_error___block_invoke;
  v19[3] = &unk_1E63034B8;
  id v10 = v7;
  id v20 = v10;
  id v11 = objc_msgSend(v9, "hk_filter:", v19);

  objc_super v12 = [v8 database];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__HDDaemonSyncEngine_updateLocalVersionsForStore_profile_error___block_invoke_2;
  v16[3] = &unk_1E62F2AE0;
  id v17 = v11;
  id v18 = v10;
  id v13 = v10;
  id v14 = v11;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v12 error:a5 block:v16];

  return (char)a5;
}

uint64_t __64__HDDaemonSyncEngine_updateLocalVersionsForStore_profile_error___block_invoke(uint64_t a1, void *a2)
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  uint64_t v4 = *(void *)(a1 + 32);

  return [a2 supportsSyncStore:v4];
}

uint64_t __64__HDDaemonSyncEngine_updateLocalVersionsForStore_profile_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        unint64_t v11 = HDCurrentSyncVersionForSyncEntity(v10);
        objc_super v12 = [v10 syncEntityIdentifier];
        BOOL v13 = +[HDSyncAnchorEntity updateLocalVersion:v11 entityIdentifier:v12 store:*(void *)(a1 + 40) transaction:v5 error:a3];

        if (!v13)
        {
          uint64_t v14 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 1;
LABEL_11:

  return v14;
}

- (uint64_t)_applySyncChange:(objc_class *)a3 entity:(void *)a4 store:(void *)a5 error:
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a4;
  unint64_t v11 = v10;
  if (!a1) {
    goto LABEL_7;
  }
  if (([v10 canRecieveSyncObjectsForEntityClass:a3] & 1) == 0)
  {
    os_signpost_id_t v23 = (void *)MEMORY[0x1E4F28C58];
    id v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    v26 = NSStringFromClass(a3);
    objc_msgSend(v23, "hk_assignError:code:format:", a5, 1401, @"Ignoring sync objects from %@; syncEntityClass was %@",
      v25,
      v26);

LABEL_7:
    uint64_t v27 = 0;
    goto LABEL_29;
  }
  objc_super v12 = +[HKDaemonTransaction transactionWithOwner:a1 activityName:@"ApplyChange"];
  BOOL v13 = (id *)(a1 + 8);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  id v48 = 0;
  uint64_t v15 = [v9 decodedObjectsForProfile:WeakRetained error:&v48];
  id v16 = v48;

  uint64_t v45 = v15;
  if (v15)
  {
    v43 = a5;
    uint64_t v44 = v12;
    uint64_t v17 = [v9 versionRange];
    id v47 = v16;
    id v18 = v15;
    id v19 = v11;
    char v20 = objc_opt_respondsToSelector();
    id v21 = objc_loadWeakRetained(v13);
    if (v20) {
      uint64_t v22 = [(objc_class *)a3 receiveSyncObjects:v18 version:v17 syncStore:v19 profile:v21 error:&v47];
    }
    else {
      uint64_t v22 = [(objc_class *)a3 receiveSyncObjects:v18 syncStore:v19 profile:v21 error:&v47];
    }
    uint64_t v29 = v22;

    id v28 = v47;
    objc_super v12 = v44;
    if (v29 == 1)
    {
      if (objc_msgSend(v28, "hk_isHealthKitErrorWithCode:", 1403))
      {
        _HKInitializeLogging();
        v30 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543874;
          v50 = a3;
          __int16 v51 = 2114;
          id v52 = v19;
          __int16 v53 = 2114;
          id v54 = v28;
          _os_log_fault_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_FAULT, "Client %{public}@ requested a reset of received sync anchor for store %{public}@ with error %{public}@.", buf, 0x20u);
        }
        id v31 = objc_loadWeakRetained(v13);
        id v46 = 0;
        BOOL v32 = +[HDSyncAnchorEntity resetSyncAnchorsOfType:3 store:v19 profile:v31 error:&v46];
        uint64_t v33 = (objc_class *)v46;

        if (!v32)
        {
          _HKInitializeLogging();
          uint64_t v34 = *MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v50 = v33;
            _os_log_error_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_ERROR, "Failed to reset sync Anchors %{public}@", buf, 0xCu);
          }
        }
      }
      else
      {
        int v35 = objc_msgSend(v28, "hk_isHealthKitErrorWithCode:", 123);
        _HKInitializeLogging();
        id v36 = *MEMORY[0x1E4F29FA8];
        BOOL v37 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR);
        if (!v35)
        {
          if (v37)
          {
            *(_DWORD *)buf = 138543618;
            v50 = a3;
            __int16 v51 = 2114;
            id v52 = v28;
            _os_log_error_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_ERROR, "Failed to receive sync objects for '%{public}@' with ignorable error: %{public}@", buf, 0x16u);
          }
          id v40 = objc_loadWeakRetained(v13);
          uint64_t v41 = [v40 daemon];
          uint64_t v42 = [v41 autoBugCaptureReporter];
          [v42 reportApplyDataFailure:a3 duringSyncFromStore:v19 error:v28];

          id v28 = 0;
          uint64_t v27 = 1;
          a5 = v43;
          objc_super v12 = v44;
          goto LABEL_24;
        }
        if (v37)
        {
          *(_DWORD *)buf = 138543618;
          v50 = a3;
          __int16 v51 = 2114;
          id v52 = v28;
          _os_log_error_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_ERROR, "Failed to receive sync objects for '%{public}@' because the journal is full: %{public}@", buf, 0x16u);
        }
      }
      uint64_t v27 = 0;
    }
    else
    {
      uint64_t v27 = 1;
    }
    a5 = v43;
  }
  else
  {
    uint64_t v27 = 0;
    id v28 = v16;
  }
LABEL_24:
  [v12 invalidate];
  id v38 = v28;
  if (v38)
  {
    if (a5) {
      *a5 = v38;
    }
    else {
      _HKLogDroppedError();
    }
  }

LABEL_29:
  return v27;
}

BOOL __53__HDDaemonSyncEngine_applySyncChange_forStore_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = HDCurrentSyncVersionForSyncEntity(*(void **)(a1 + 48));
  uint64_t v7 = [*(id *)(a1 + 48) syncEntityIdentifier];
  BOOL v8 = +[HDSyncAnchorEntity updateLocalVersion:v6 entityIdentifier:v7 store:*(void *)(a1 + 32) transaction:v5 error:a3];

  if (v8)
  {
    unint64_t v9 = (unint64_t)[*(id *)(a1 + 40) versionRange] >> 32;
    id v10 = [*(id *)(a1 + 40) syncEntityIdentifier];
    BOOL v11 = +[HDSyncAnchorEntity updateReceivedVersion:v9 entityIdentifier:v10 store:*(void *)(a1 + 32) transaction:v5 error:a3];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)syncAnchorRangesIfRequiredForSession:(id)a3 startingAnchors:(id)a4 error:(id *)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 databaseAccessibilityAssertion];

  if (v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_super v12 = [WeakRetained database];
    BOOL v13 = [v8 databaseAccessibilityAssertion];
    uint64_t v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    id v42 = 0;
    id v16 = [v12 cloneAccessibilityAssertion:v13 ownerIdentifier:v15 error:&v42];
    id v17 = v42;

    if (v16)
    {
LABEL_7:
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v44 = 0x3032000000;
      uint64_t v45 = __Block_byref_object_copy__179;
      id v46 = __Block_byref_object_dispose__179;
      id v47 = 0;
      uint64_t v37 = 0;
      id v38 = &v37;
      uint64_t v39 = 0x2020000000;
      char v40 = 0;
      os_signpost_id_t v23 = objc_alloc_init(HDMutableDatabaseTransactionContext);
      [(HDMutableDatabaseTransactionContext *)v23 setRequiresProtectedData:1];
      [(HDMutableDatabaseTransactionContext *)v23 setCacheScope:1];
      [(HDMutableDatabaseTransactionContext *)v23 addAccessibilityAssertion:v16];
      id v24 = objc_loadWeakRetained((id *)&self->_profile);
      v25 = [v24 database];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __81__HDDaemonSyncEngine_syncAnchorRangesIfRequiredForSession_startingAnchors_error___block_invoke;
      v31[3] = &unk_1E630A0D8;
      p_long long buf = &buf;
      id v32 = v8;
      uint64_t v33 = self;
      id v34 = v9;
      id v36 = &v37;
      int v26 = [v25 performTransactionWithContext:v23 error:a5 block:v31 inaccessibilityHandler:0];

      [v16 invalidate];
      if (v26)
      {
        if (*((unsigned char *)v38 + 24)) {
          uint64_t v27 = (HDSyncAnchorRangeMap *)*(id *)(*((void *)&buf + 1) + 40);
        }
        else {
          uint64_t v27 = objc_alloc_init(HDSyncAnchorRangeMap);
        }
        id v28 = v27;
      }
      else
      {
        id v28 = 0;
      }

      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(&buf, 8);

      goto LABEL_18;
    }
  }
  else
  {
    id v17 = 0;
  }
  id v18 = objc_loadWeakRetained((id *)&self->_profile);
  id v19 = [v18 database];
  char v20 = (objc_class *)objc_opt_class();
  id v21 = NSStringFromClass(v20);
  [v8 databaseAccessibilityTimeout];
  id v41 = v17;
  objc_msgSend(v19, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v21, &v41);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v22 = v41;

  if (v16)
  {
    id v17 = v22;
    goto LABEL_7;
  }
  if ((objc_msgSend(v22, "hk_isDatabaseAccessibilityError") & 1) == 0
    && (_HKInitializeLogging(),
        uint64_t v29 = *MEMORY[0x1E4F29FA8],
        os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR)))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v22;
    _os_log_error_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_ERROR, "Failed to acquire database accessibility assertion for sync: %{public}@", (uint8_t *)&buf, 0xCu);
    if (v22) {
      goto LABEL_14;
    }
  }
  else if (v22)
  {
LABEL_14:
    id v16 = v22;
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failed to acquire database accessibility assertion for sync with no error.");
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
LABEL_24:
    if (a5) {
      *a5 = v16;
    }
    else {
      _HKLogDroppedError();
    }

    id v17 = 0;
    id v28 = 0;
    if (v22) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  id v17 = 0;
  id v28 = 0;
LABEL_18:

  id v22 = v17;
LABEL_19:

  return v28;
}

BOOL __81__HDDaemonSyncEngine_syncAnchorRangesIfRequiredForSession_startingAnchors_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = [*(id *)(a1 + 32) syncStore];
  uint64_t v7 = [v6 orderedSyncEntities];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __81__HDDaemonSyncEngine_syncAnchorRangesIfRequiredForSession_startingAnchors_error___block_invoke_2;
  v20[3] = &unk_1E63034B8;
  id v8 = v6;
  id v21 = v8;
  id v9 = objc_msgSend(v7, "hk_filter:", v20);

  uint64_t v10 = -[HDDaemonSyncEngine _syncAnchorRangeMapForSession:store:syncEntities:startingAnchors:error:](*(void *)(a1 + 40), *(void **)(a1 + 32), v9, *(void **)(a1 + 48), a3);
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  objc_super v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  BOOL v13 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v13)
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __81__HDDaemonSyncEngine_syncAnchorRangesIfRequiredForSession_startingAnchors_error___block_invoke_3;
    v15[3] = &unk_1E630B1B8;
    v15[4] = &v16;
    [v13 enumerateAnchorRangesAndEntityIdentifiersWithBlock:v15];
    if (*((unsigned char *)v17 + 24)) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) requiresSyncForChangesFromAnchorRangeMap:*(void *)(*(void *)(*(void *)(a1 + 56) + 8)+ 40)];
    }
    _Block_object_dispose(&v16, 8);
  }

  return v13 != 0;
}

uint64_t __81__HDDaemonSyncEngine_syncAnchorRangesIfRequiredForSession_startingAnchors_error___block_invoke_2(uint64_t a1, void *a2)
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  uint64_t v4 = *(void *)(a1 + 32);

  return [a2 supportsSyncStore:v4];
}

- (HDSyncAnchorRangeMap)_syncAnchorRangeMapForSession:(uint64_t)a1 store:(void *)a2 syncEntities:(void *)a3 startingAnchors:(void *)a4 error:(uint64_t)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    id v27 = v10;
    id v28 = objc_alloc_init(HDSyncAnchorRangeMap);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v10;
    uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v17 = [v16 syncEntityIdentifier];
          unint64_t v18 = [v11 anchorForSyncEntityIdentifier:v17];
          unint64_t v19 = -[HDDaemonSyncEngine _nextSyncAnchorForEntity:session:startSyncAnchor:error:](a1, v16, v9, v18, a5);
          if ((v18 & 0x8000000000000000) != 0 || (unint64_t v20 = v19, (v19 & 0x8000000000000000) != 0))
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 1400, @"Start or final anchor is invalid.");

            id v24 = 0;
            os_signpost_id_t v23 = v28;
            goto LABEL_17;
          }
          if (v19 < v18)
          {
            int v26 = [MEMORY[0x1E4F28B00] currentHandler];
            [v26 handleFailureInMethod:sel__syncAnchorRangeMapForSession_store_syncEntities_startingAnchors_error_, a1, @"HDDaemonSyncEngine.m", 748, @"Invalid parameter not satisfying: %@", @"finalAnchor >= startAnchor" object file lineNumber description];
          }
          if (v20 > v18)
          {
            uint64_t v21 = HDSyncAnchorRangeMake(v18, v20);
            -[HDSyncAnchorRangeMap setAnchorRange:forSyncEntityIdentifier:](v28, "setAnchorRange:forSyncEntityIdentifier:", v21, v22, v17);
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    os_signpost_id_t v23 = v28;
    id v24 = v28;
LABEL_17:

    id v10 = v27;
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

uint64_t __81__HDDaemonSyncEngine_syncAnchorRangesIfRequiredForSession_startingAnchors_error___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a4 > a3)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (BOOL)performSyncSession:(id)a3 accessibilityAssertion:(id)a4 error:(id *)a5
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v8 = a4;
    id v9 = a3;
    [v9 syncWillBegin];
    id v10 = v9;
    id v11 = v8;
    v104 = v10;
    uint64_t v93 = a5;
    v98 = v11;
    if (self)
    {
      id v12 = v11;
      v107 = self;
      id v94 = v12;
      if (v12)
      {
        id v97 = 0;
        id v99 = v12;
        goto LABEL_8;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      uint64_t v15 = [WeakRetained database];
      uint64_t v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      [v104 databaseAccessibilityTimeout];
      id v109 = 0;
      id v99 = objc_msgSend(v15, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v17, &v109);
      id v97 = v109;

      if (v99)
      {
        id v10 = v104;
LABEL_8:
        id v18 = [v10 syncStore];
        if (!v18)
        {
          v91 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v92 = [NSString stringWithUTF8String:"BOOL _VerifySyncEntityOrderForStore(id<HDSyncStore>  _Nonnull __strong)"];
          [v91 handleFailureInFunction:v92, @"HDDaemonSyncEngine.m", 1024, @"Invalid parameter not satisfying: %@", @"syncStore != nil" file lineNumber description];

          id v18 = 0;
        }
        v103 = v18;
        if (([v18 enforceSyncEntityOrdering] & 1) == 0)
        {

          goto LABEL_31;
        }
        unint64_t v19 = [v103 orderedSyncEntities];
        id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v112 = 0u;
        long long v113 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        id v21 = v19;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v110 objects:buf count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v111;
          uint64_t v105 = *(void *)v111;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v111 != v23) {
                objc_enumerationMutation(v21);
              }
              uint64_t v25 = *(void *)(*((void *)&v110 + 1) + 8 * i);
              long long v120 = 0u;
              long long v121 = 0u;
              long long v122 = 0u;
              long long v123 = 0u;
              int v26 = [v103 syncEntityDependenciesForSyncEntity:v25];
              uint64_t v27 = [v26 countByEnumeratingWithState:&v120 objects:v118 count:16];
              if (v27)
              {
                uint64_t v28 = *(void *)v121;
                do
                {
                  for (uint64_t j = 0; j != v27; ++j)
                  {
                    if (*(void *)v121 != v28) {
                      objc_enumerationMutation(v26);
                    }
                    uint64_t v30 = *(void *)(*((void *)&v120 + 1) + 8 * j);
                    if (([v20 containsObject:v30] & 1) == 0)
                    {
                      _HKInitializeLogging();
                      long long v31 = *MEMORY[0x1E4F29FA8];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)id v115 = 138543618;
                        *(void *)&v115[4] = v30;
                        __int16 v116 = 2114;
                        uint64_t v117 = v25;
                        _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "%{public}@ is not ordered before %{public}@ in sync entities", v115, 0x16u);
                      }

                      long long v32 = [MEMORY[0x1E4F28B00] currentHandler];
                      [v32 handleFailureInMethod:sel__performSyncSession_databaseAccessibilityAssertion_error_, v107, @"HDDaemonSyncEngine.m", 916, @"Invalid parameter not satisfying: %@", @"_VerifySyncEntityOrderForStore(store)" object file lineNumber description];

LABEL_31:
                      _HKInitializeLogging();
                      long long v33 = (NSObject **)MEMORY[0x1E4F29FA8];
                      id v34 = *MEMORY[0x1E4F29FA8];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)long long buf = 138543618;
                        uint64_t v35 = v104;
                        *(void *)&uint8_t buf[4] = v104;
                        *(_WORD *)&buf[12] = 2114;
                        *(void *)&buf[14] = v103;
                        _os_log_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_DEFAULT, "beginning sync session %{public}@ with store %{public}@", buf, 0x16u);
                        id v34 = *v33;
                      }
                      else
                      {
                        uint64_t v35 = v104;
                      }
                      os_signpost_id_t v96 = os_signpost_id_make_with_pointer(v34, v35);
                      id v36 = NSString;
                      uint64_t v37 = [v35 reason];
                      uint64_t v38 = [v103 syncStoreType];
                      uint64_t v39 = [v103 syncStoreIdentifier];
                      id v95 = [v36 stringWithFormat:@"reason=%@, storeType=%ld, storeID=%@, storeEpoch=%lld", v37, v38, v39, objc_msgSend(v103, "syncEpoch")];

                      _HKInitializeLogging();
                      char v40 = (void *)*MEMORY[0x1E4F29FA8];
                      if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F29FA8]))
                      {
                        id v41 = v40;
                        id v42 = v41;
                        if (v96 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
                        {
                          *(_DWORD *)long long buf = 138543362;
                          *(void *)&uint8_t buf[4] = v95;
                          _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v42, OS_SIGNPOST_INTERVAL_BEGIN, v96, "sync-session", "%{public}@", buf, 0xCu);
                        }
                      }
                      double Current = CFAbsoluteTimeGetCurrent();
                      id v101 = objc_alloc_init(HDMutableDatabaseTransactionContext);
                      [(HDMutableDatabaseTransactionContext *)v101 setRequiresProtectedData:1];
                      [(HDMutableDatabaseTransactionContext *)v101 setCacheScope:1];
                      [(HDMutableDatabaseTransactionContext *)v101 addAccessibilityAssertion:v99];
                      uint64_t v44 = [v104 databaseAccessibilityAssertion];

                      if (v44)
                      {
                        uint64_t v45 = [v104 databaseAccessibilityAssertion];
                        [(HDMutableDatabaseTransactionContext *)v101 addAccessibilityAssertion:v45];
                      }
                      int v46 = 0;
                      id v100 = 0;
                      location = (id *)&v107->_profile;
                      while (2)
                      {
                        _HKInitializeLogging();
                        id v47 = *MEMORY[0x1E4F29FA8];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)long long buf = 138543874;
                          *(void *)&uint8_t buf[4] = v104;
                          *(_WORD *)&buf[12] = 1024;
                          *(_DWORD *)&buf[14] = v46;
                          *(_WORD *)&buf[18] = 2114;
                          *(void *)&buf[20] = v103;
                          _os_log_impl(&dword_1BCB7D000, v47, OS_LOG_TYPE_DEFAULT, "beginning sync session %{public}@ transaction %d with store %{public}@", buf, 0x1Cu);
                        }
                        double v48 = CFAbsoluteTimeGetCurrent();
                        id v49 = v104;
                        id v50 = v103;
                        v108 = v101;
                        __int16 v51 = [MEMORY[0x1E4F1CA48] array];
                        *(void *)&long long v110 = 0;
                        *((void *)&v110 + 1) = &v110;
                        *(void *)&long long v111 = 0x2020000000;
                        *((void *)&v111 + 1) = 1;
                        id v52 = objc_loadWeakRetained(location);
                        __int16 v53 = [v52 database];
                        *(void *)id v115 = 0;
                        *(void *)long long buf = MEMORY[0x1E4F143A8];
                        *(void *)&buf[8] = 3221225472;
                        *(void *)&buf[16] = __87__HDDaemonSyncEngine__performSyncTransactionForSession_store_transactionContext_error___block_invoke;
                        *(void *)&buf[24] = &unk_1E630B230;
                        id v54 = v49;
                        *(void *)&buf[32] = v54;
                        __int16 v125 = v107;
                        id v106 = v50;
                        id v126 = v106;
                        id v55 = v51;
                        __int16 v129 = sel__performSyncTransactionForSession_store_transactionContext_error_;
                        id v127 = v55;
                        uint64_t v128 = &v110;
                        int v56 = [v53 performTransactionWithContext:v108 error:v115 block:buf inaccessibilityHandler:0];
                        id v57 = *(id *)v115;

                        id v58 = _Block_copy(v107->_unitTest_didCompleteReadTransaction);
                        v59 = v58;
                        if (v58) {
                          (*((void (**)(void *))v58 + 2))(v58);
                        }
                        if (v56)
                        {
                          id v60 = (void *)[(HDMutableDatabaseTransactionContext *)v108 mutableCopy];
                          [v60 setRequiresWrite:1];
                          id v61 = objc_loadWeakRetained(location);
                          BOOL v62 = [v61 database];
                          id v114 = v57;
                          v118[0] = MEMORY[0x1E4F143A8];
                          v118[1] = 3221225472;
                          v118[2] = __87__HDDaemonSyncEngine__performSyncTransactionForSession_store_transactionContext_error___block_invoke_445;
                          v118[3] = &unk_1E62F6130;
                          id v119 = v55;
                          int v63 = [v62 performTransactionWithContext:v60 error:&v114 block:v118 inaccessibilityHandler:0];
                          id v64 = v114;

                          if (!v63)
                          {
                            if (objc_msgSend(v64, "hk_isDatabaseAccessibilityError"))
                            {
                              _HKInitializeLogging();
                              v68 = *MEMORY[0x1E4F29FA8];
                              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
                              {
                                LODWORD(v120) = 138543362;
                                *(void *)((char *)&v120 + 4) = v64;
                                _os_log_debug_impl(&dword_1BCB7D000, v68, OS_LOG_TYPE_DEBUG, "error during sync write transaction: %{public}@", (uint8_t *)&v120, 0xCu);
                              }
                            }
                            else
                            {
                              _HKInitializeLogging();
                              v69 = *MEMORY[0x1E4F29FA8];
                              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                              {
                                LODWORD(v120) = 138543362;
                                *(void *)((char *)&v120 + 4) = v64;
                                _os_log_error_impl(&dword_1BCB7D000, v69, OS_LOG_TYPE_ERROR, "error during sync write transaction: %{public}@", (uint8_t *)&v120, 0xCu);
                              }
                            }

                            id v57 = v64;
                            goto LABEL_63;
                          }
                          if (*(void *)(*((void *)&v110 + 1) + 24) == 2)
                          {
                            *(void *)&long long v120 = v64;
                            char v65 = [v54 transactionDidEndWithError:&v120];
                            id v57 = (id)v120;

                            if (v65)
                            {
                              id v64 = v57;
                              goto LABEL_67;
                            }
LABEL_63:
                            *(void *)(*((void *)&v110 + 1) + 24) = 0;
                            id v70 = v57;
                            if (v70)
                            {
                              id v100 = v70;
                              id v64 = v100;
                              id v60 = v100;
                            }
                            else
                            {
                              id v60 = 0;
                              id v64 = 0;
                            }
                          }
                          else
                          {
                          }
LABEL_67:
                          uint64_t v71 = *(void *)(*((void *)&v110 + 1) + 24);

                          _Block_object_dispose(&v110, 8);
                          double v72 = CFAbsoluteTimeGetCurrent();
                          _HKInitializeLogging();
                          v73 = *MEMORY[0x1E4F29FA8];
                          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)long long buf = 67109890;
                            v74 = "YES";
                            if (!v71) {
                              v74 = "NO";
                            }
                            *(_DWORD *)&uint8_t buf[4] = v46;
                            *(_WORD *)&buf[8] = 2048;
                            *(double *)&buf[10] = v72 - v48;
                            *(_WORD *)&buf[18] = 2080;
                            *(void *)&buf[20] = v74;
                            *(_WORD *)&buf[28] = 2048;
                            *(void *)&buf[30] = v71;
                            _os_log_impl(&dword_1BCB7D000, v73, OS_LOG_TYPE_DEFAULT, "finished sync transaction %d in %lfs; success=%s, status=%ld",
                              buf,
                              0x26u);
                          }
                          ++v46;
                          if (v71 != 2)
                          {
                            if (!v94) {
                              [v99 invalidate];
                            }
                            double v75 = CFAbsoluteTimeGetCurrent();
                            _HKInitializeLogging();
                            CFAbsoluteTime v76 = *MEMORY[0x1E4F29FA8];
                            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)long long buf = 138544130;
                              os_log_t v77 = "YES";
                              if (!v71) {
                                os_log_t v77 = "NO";
                              }
                              *(void *)&uint8_t buf[4] = v104;
                              *(_WORD *)&buf[12] = 2048;
                              *(double *)&buf[14] = v75 - Current;
                              *(_WORD *)&buf[22] = 1024;
                              *(_DWORD *)&buf[24] = v46;
                              *(_WORD *)&buf[28] = 2080;
                              *(void *)&buf[30] = v77;
                              _os_log_impl(&dword_1BCB7D000, v76, OS_LOG_TYPE_DEFAULT, "finished sync session %{public}@ in %lfs with %d transactions; success=%s",
                                buf,
                                0x26u);
                            }
                            _HKInitializeLogging();
                            v78 = (void *)*MEMORY[0x1E4F29FA8];
                            if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F29FA8]))
                            {
                              v79 = v78;
                              uint64_t v80 = v79;
                              if (v96 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
                              {
                                v81 = "YES";
                                if (!v71) {
                                  v81 = "NO";
                                }
                                *(_DWORD *)long long buf = 136315394;
                                *(void *)&uint8_t buf[4] = v81;
                                *(_WORD *)&buf[12] = 2114;
                                *(void *)&buf[14] = v95;
                                _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v80, OS_SIGNPOST_INTERVAL_END, v96, "sync-session", "success=%s, %{public}@", buf, 0x16u);
                              }
                            }
                            buf[0] = v71 != 0;

                            v82 = v97;
                            goto LABEL_86;
                          }
                          continue;
                        }
                        break;
                      }
                      if (objc_msgSend(v57, "hk_isDatabaseAccessibilityError"))
                      {
                        _HKInitializeLogging();
                        id v66 = *MEMORY[0x1E4F29FA8];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
                        {
                          LODWORD(v120) = 138543362;
                          *(void *)((char *)&v120 + 4) = v57;
                          _os_log_debug_impl(&dword_1BCB7D000, v66, OS_LOG_TYPE_DEBUG, "error during sync read transaction: %{public}@", (uint8_t *)&v120, 0xCu);
                        }
                      }
                      else
                      {
                        _HKInitializeLogging();
                        char v67 = *MEMORY[0x1E4F29FA8];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                        {
                          LODWORD(v120) = 138543362;
                          *(void *)((char *)&v120 + 4) = v57;
                          _os_log_error_impl(&dword_1BCB7D000, v67, OS_LOG_TYPE_ERROR, "error during sync read transaction: %{public}@", (uint8_t *)&v120, 0xCu);
                        }
                      }
                      goto LABEL_63;
                    }
                  }
                  uint64_t v27 = [v26 countByEnumeratingWithState:&v120 objects:v118 count:16];
                }
                while (v27);
              }

              [v20 addObject:v25];
              uint64_t v23 = v105;
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v110 objects:buf count:16];
            uint64_t v23 = v105;
          }
          while (v22);
        }

        goto LABEL_31;
      }
      if ((objc_msgSend(v97, "hk_isDatabaseAccessibilityError") & 1) == 0)
      {
        _HKInitializeLogging();
        int v86 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543362;
          *(void *)&uint8_t buf[4] = v97;
          _os_log_error_impl(&dword_1BCB7D000, v86, OS_LOG_TYPE_ERROR, "Failed to acquire database accessibility assertion for sync: %{public}@", buf, 0xCu);
        }
      }
      id v87 = v97;
      if (v87)
      {
        id v88 = v87;
        id v89 = v87;
        id v87 = v88;
      }
      id v100 = v87;

      buf[0] = 0;
      v82 = v100;
LABEL_86:

      uint64_t v13 = buf[0];
    }
    else
    {
      id v100 = 0;
      uint64_t v13 = 0;
    }

    id v83 = v100;
    [v104 syncDidFinishWithSuccess:v13 error:v83];

    if ((v13 & 1) == 0)
    {
      id v84 = v83;
      v85 = v84;
      if (v84)
      {
        if (v93) {
          *uint64_t v93 = v84;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }
  return v13;
}

- (void)resetAnchorsWithFailedChanges:(id)a3 store:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id obj = a3;
  id v23 = a4;
  if (v23)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      p_profile = &self->_profile;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v12 = [v11 syncAnchorRange];
          uint64_t v14 = v13;
          id WeakRetained = objc_loadWeakRetained((id *)p_profile);
          uint64_t v16 = (void *)[v11 syncEntityClassForProfile:WeakRetained];

          if ((v12 & 0x8000000000000000) == 0 && (v14 & 0x8000000000000000) == 0 && v12 <= v14 && v16 != 0)
          {
            id v18 = [v16 syncEntityIdentifier];
            id v19 = objc_loadWeakRetained((id *)p_profile);
            id v25 = 0;
            BOOL v20 = +[HDSyncAnchorEntity updateSyncAnchor:v12 type:0 entityIdentifier:v18 store:v23 updatePolicy:0 profile:v19 error:&v25];
            id v21 = v25;

            if (!v20)
            {
              _HKInitializeLogging();
              uint64_t v22 = *MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 134218498;
                uint64_t v31 = v12;
                __int16 v32 = 2114;
                long long v33 = v16;
                __int16 v34 = 2114;
                id v35 = v21;
                _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "failed to reset next anchor to %lld for %{public}@: %{public}@", buf, 0x20u);
              }
            }
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)resetNextAnchorsForStore:(id)a3 profile:(id)a4 minimumElapsedTime:(double)a5 error:(id *)a6
{
  return +[HDSyncAnchorEntity resetNextAnchorsIfNeededForStore:a3 profile:a4 minimumElapsedTime:a6 error:a5];
}

- (void)resetStore:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    _HKInitializeLogging();
    id v5 = (os_log_t *)MEMORY[0x1E4F29FA8];
    uint64_t v6 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v14 = v4;
      _os_log_debug_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEBUG, "resetting store %@", buf, 0xCu);
    }
    id v7 = v4;
    if (self)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      id v12 = 0;
      BOOL v9 = +[HDSyncAnchorEntity resetSyncStore:v7 profile:WeakRetained error:&v12];
      id v10 = v12;

      if (!v9)
      {
        _HKInitializeLogging();
        id v11 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543618;
          id v14 = v7;
          __int16 v15 = 2114;
          id v16 = v10;
          _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "failed to reset sync store %{public}@: %{public}@", buf, 0x16u);
        }
      }
    }
  }
}

void __110__HDDaemonSyncEngine__synchronizeSyncEntityClass_session_startAnchor_finalAnchor_postTransactionBlocks_error___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) currentAnchor];
  v3 = [*(id *)(a1 + 56) syncEntityIdentifier];
  uint64_t v4 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
  id v9 = 0;
  LOBYTE(v2) = +[HDSyncAnchorEntity updateSyncAnchor:v2 type:0 entityIdentifier:v3 store:v4 updatePolicy:1 profile:WeakRetained error:&v9];
  id v6 = v9;

  if ((v2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v7 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 56);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Failed to update next sync anchor for %{public}@: %{public}@", buf, 0x16u);
    }
  }
}

uint64_t __59__HDDaemonSyncEngine__prepareSyncAnchorsForStore_entities___block_invoke(uint64_t a1, void *a2)
{
  return [a2 syncEntityIdentifier];
}

- (uint64_t)_nextSyncAnchorForEntity:(void *)a3 session:(uint64_t)a4 startSyncAnchor:(uint64_t)a5 error:
{
  id v9 = a3;
  char v10 = objc_opt_respondsToSelector();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (v10) {
    uint64_t v12 = [a2 nextSyncAnchorWithSession:v9 startSyncAnchor:a4 profile:WeakRetained error:a5];
  }
  else {
    uint64_t v12 = [a2 nextSyncAnchorWithSession:v9 predicate:0 startSyncAnchor:a4 profile:WeakRetained error:a5];
  }
  uint64_t v13 = v12;

  return v13;
}

uint64_t __87__HDDaemonSyncEngine__performSyncTransactionForSession_store_transactionContext_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = (void *)a1[4];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 8));
  uint64_t v57 = a3;
  LODWORD(v6) = [v6 syncDidBeginWithProfile:WeakRetained error:a3];

  if (v6)
  {
    id v51 = v5;
    id v54 = a1;
    id v9 = (void *)a1[6];
    uint64_t v8 = (id *)(a1 + 6);
    char v10 = [v9 orderedSyncEntities];
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __87__HDDaemonSyncEngine__performSyncTransactionForSession_store_transactionContext_error___block_invoke_2;
    v69[3] = &unk_1E63034B8;
    id v70 = *v8;
    uint64_t v11 = objc_msgSend(v10, "hk_filter:", v69);

    uint64_t v12 = v54[5];
    uint64_t v13 = (void *)v54[7];
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __87__HDDaemonSyncEngine__performSyncTransactionForSession_store_transactionContext_error___block_invoke_3;
    v66[3] = &unk_1E62F30F8;
    v66[4] = v12;
    id v67 = *v8;
    id v14 = v11;
    id v68 = v14;
    __int16 v15 = (void *)[v66 copy];
    id v16 = _Block_copy(v15);
    [v13 addObject:v16];

    uint64_t v17 = v54[5];
    id v18 = *v8;
    id v53 = v14;
    if (v17)
    {
      id v19 = objc_alloc_init(HDSyncAnchorMap);
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id obj = v53;
      uint64_t v20 = [obj countByEnumeratingWithState:&v71 objects:buf count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v72;
        uint64_t v22 = (id *)(v17 + 8);
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v72 != v21) {
              objc_enumerationMutation(obj);
            }
            id v24 = [*(id *)(*((void *)&v71 + 1) + 8 * i) syncEntityIdentifier];
            id v25 = objc_loadWeakRetained(v22);
            int64_t v26 = +[HDSyncAnchorEntity syncAnchorOfType:0 entityIdentifier:v24 store:v18 profile:v25 error:v57];

            if (v26 < 0)
            {
              objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", v57, 1400, @"Failed to lookup next anchor for %@.", v24);

              id v52 = 0;
              goto LABEL_14;
            }
            [(HDSyncAnchorMap *)v19 setAnchor:v26 forSyncEntityIdentifier:v24];
          }
          uint64_t v20 = [obj countByEnumeratingWithState:&v71 objects:buf count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }

      id v52 = v19;
LABEL_14:
    }
    else
    {
      id v52 = 0;
    }

    long long v28 = -[HDDaemonSyncEngine _syncAnchorRangeMapForSession:store:syncEntities:startingAnchors:error:](v54[5], (void *)v54[4], v53, v52, v57);
    long long v29 = v28;
    if (v28)
    {
      if ([v28 anchorRangeCount])
      {
        if ([(id)v54[4] requiresSyncForChangesFromAnchorRangeMap:v29])
        {
          [(id)v54[4] willSyncAnchorRanges:v29];
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v48 = v53;
          uint64_t v50 = [v48 countByEnumeratingWithState:&v62 objects:v75 count:16];
          if (v50)
          {
            uint64_t v49 = *(void *)v63;
            while (2)
            {
              for (uint64_t j = 0; j != v50; ++j)
              {
                if (*(void *)v63 != v49) {
                  objc_enumerationMutation(v48);
                }
                uint64_t v31 = *(void **)(*((void *)&v62 + 1) + 8 * j);
                __int16 v32 = [v31 syncEntityIdentifier];
                uint64_t v60 = 0;
                uint64_t v61 = 0;
                uint64_t v60 = HDSyncAnchorRangeMake(-1, -1);
                uint64_t v61 = v33;
                if ([v29 getAnchorRange:&v60 forSyncEntityIdentifier:v32])
                {
                  *(void *)&long long v71 = 0;
                  *((void *)&v71 + 1) = &v71;
                  *(void *)&long long v72 = 0x2020000000;
                  uint64_t v34 = v60;
                  uint64_t v35 = v61;
                  *((void *)&v72 + 1) = v60;
                  if (v61 < v60)
                  {
                    id v41 = [MEMORY[0x1E4F28B00] currentHandler];
                    [v41 handleFailureInMethod:v54[9], v54[5], @"HDDaemonSyncEngine.m", 823, @"Invalid parameter not satisfying: %@", @"finalAnchor >= startAnchor" object file lineNumber description];

                    uint64_t v34 = *(void *)(*((void *)&v71 + 1) + 24);
                  }
                  if (v35 > v34)
                  {
                    while (1)
                    {
                      *(_OWORD *)obja = *((_OWORD *)v54 + 2);
                      id v36 = obja[0];
                      int8x16_t v58 = vextq_s8(*(int8x16_t *)obja, *(int8x16_t *)obja, 8uLL);
                      id v59 = (id)v54[7];
                      if ((HKWithAutoreleasePool() & 1) == 0) {
                        break;
                      }
                      if (*(void *)(*((void *)&v71 + 1) + 24) <= v34)
                      {
                        _HKInitializeLogging();
                        uint64_t v37 = *MEMORY[0x1E4F29FA8];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                        {
                          uint64_t v38 = *(void **)(*((void *)&v71 + 1) + 24);
                          *(_DWORD *)long long buf = 134218754;
                          uint64_t v77 = v34;
                          __int16 v78 = 2048;
                          v79 = v38;
                          __int16 v80 = 2048;
                          uint64_t v81 = v35;
                          __int16 v82 = 2114;
                          id v83 = v31;
                          _os_log_error_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_ERROR, "Start anchor did not increase (original: %lld, updated: %lld, expected final: %lld) during sync of %{public}@; skipping this entity.",
                            buf,
                            0x2Au);
                        }
                        goto LABEL_36;
                      }
                      if (*(void *)(*(void *)(v54[8] + 8) + 24) == 2)
                      {
                        _HKInitializeLogging();
                        uint64_t v39 = *MEMORY[0x1E4F29FA8];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
                        {
                          uint64_t v40 = v54[4];
                          *(_DWORD *)long long buf = 138543618;
                          uint64_t v77 = v40;
                          __int16 v78 = 2114;
                          v79 = v31;
                          _os_log_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_INFO, "Delegate for sync session %{public}@ signaled that this sync session should start a new transaction, stop getting changes for %{public}@", buf, 0x16u);
                        }
LABEL_36:

                        goto LABEL_37;
                      }

                      uint64_t v34 = *(void *)(*((void *)&v71 + 1) + 24);
                      if (v35 <= v34) {
                        goto LABEL_37;
                      }
                    }

                    _HKInitializeLogging();
                    uint64_t v44 = *MEMORY[0x1E4F29FA8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)long long buf = 138543362;
                      uint64_t v77 = (uint64_t)v31;
                      _os_log_impl(&dword_1BCB7D000, v44, OS_LOG_TYPE_INFO, "Sync for entity %{public}@ was unsuccessful. Skipping sync.", buf, 0xCu);
                    }
                    uint64_t v27 = 0;
                    goto LABEL_49;
                  }
LABEL_37:
                  if (*(void *)(*(void *)(v54[8] + 8) + 24) == 2)
                  {
                    _HKInitializeLogging();
                    int v46 = *MEMORY[0x1E4F29FA8];
                    uint64_t v27 = 1;
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
                    {
                      uint64_t v47 = v54[4];
                      *(_DWORD *)long long buf = 138543362;
                      uint64_t v77 = v47;
                      _os_log_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_INFO, "Delegate for sync session %{public}@ signaled that this sync session should start a new transaction, stop getting changes for any sync entity", buf, 0xCu);
                    }
LABEL_49:
                    _Block_object_dispose(&v71, 8);

                    goto LABEL_51;
                  }
                  _Block_object_dispose(&v71, 8);
                }
              }
              uint64_t v50 = [v48 countByEnumeratingWithState:&v62 objects:v75 count:16];
              uint64_t v27 = 1;
              if (v50) {
                continue;
              }
              break;
            }
          }
          else
          {
            uint64_t v27 = 1;
          }
LABEL_51:

          goto LABEL_52;
        }
        _HKInitializeLogging();
        id v42 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v43 = v54[4];
          *(_DWORD *)long long buf = 138543618;
          uint64_t v77 = v43;
          __int16 v78 = 2114;
          v79 = v29;
          _os_log_impl(&dword_1BCB7D000, v42, OS_LOG_TYPE_DEFAULT, "session %{public}@ does not require sync for computed anchor map %{public}@", buf, 0x16u);
        }
      }
      uint64_t v27 = 1;
    }
    else
    {
      uint64_t v27 = 0;
    }
LABEL_52:

    id v5 = v51;
    goto LABEL_53;
  }
  uint64_t v27 = 0;
LABEL_53:

  return v27;
}

uint64_t __87__HDDaemonSyncEngine__performSyncTransactionForSession_store_transactionContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  uint64_t v4 = *(void *)(a1 + 32);

  return [a2 supportsSyncStore:v4];
}

void __87__HDDaemonSyncEngine__performSyncTransactionForSession_store_transactionContext_error___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  if (v1)
  {
    uint64_t v4 = objc_msgSend(v2, "hk_map:", &__block_literal_global_214);
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 8));
    id v9 = 0;
    BOOL v6 = +[HDSyncAnchorEntity prepareSyncAnchorsForEntityIdentifiers:v4 store:v3 profile:WeakRetained error:&v9];
    id v7 = v9;

    if (!v6)
    {
      _HKInitializeLogging();
      uint64_t v8 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        id v11 = v3;
        __int16 v12 = 2114;
        id v13 = v7;
        _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "Failed to prepare sync entities for store %{public}@: %{public}@", buf, 0x16u);
      }
    }
  }
}

BOOL __87__HDDaemonSyncEngine__performSyncTransactionForSession_store_transactionContext_error___block_invoke_442(uint64_t a1, HDDaemonSyncMessageHandler **a2)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 72);
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v6 = *(void *)(a1 + 80);
  id v7 = *(void **)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  id v45 = v7;
  if (!v3)
  {
    uint64_t v30 = 0;
    long long v28 = v45;
    goto LABEL_41;
  }
  uint64_t v43 = [v8 syncStore];
  uint64_t v39 = v5;
  uint64_t v9 = HDSyncAnchorRangeMake(*(void *)(v5 + 24), v6);
  uint64_t v41 = v10;
  id v47 = 0;
  id v11 = v8;
  __int16 v12 = [v11 syncStore];
  id v13 = [v12 syncEntityDependenciesForSyncEntity:v4];
  uint64_t v14 = objc_alloc_init(HDSyncAnchorMap);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v48 objects:aBlock count:16];
  id v46 = v8;
  id v42 = v4;
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v40 = v9;
    uint64_t v18 = *(void *)v49;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v21 = -[HDDaemonSyncEngine _nextSyncAnchorForEntity:session:startSyncAnchor:error:](v3, v20, v11, 0, (uint64_t)&v47);
        if (v21 < 0)
        {

          uint64_t v14 = 0;
          goto LABEL_12;
        }
        [(HDSyncAnchorMap *)v14 setAnchor:v21 forSyncEntity:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v48 objects:aBlock count:16];
      if (v17) {
        continue;
      }
      break;
    }
LABEL_12:
    id v8 = v46;
    uint64_t v4 = v42;
    uint64_t v9 = v40;
  }

  id v22 = v47;
  if (!v14)
  {
    _HKInitializeLogging();
    __int16 v32 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)aBlock = 138543618;
      *(void *)&aBlock[4] = v4;
      *(_WORD *)&aBlock[12] = 2114;
      *(void *)&aBlock[14] = v22;
      _os_log_error_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_ERROR, "Failed to retrieve sync anchor map for entity class %{public}@: %{public}@", aBlock, 0x16u);
    }
    uint64_t v33 = (HDDaemonSyncMessageHandler *)v22;
    id v23 = v33;
    if (v33)
    {
      long long v28 = v45;
      long long v29 = v43;
      if (a2)
      {
        id v23 = v33;
        uint64_t v30 = 0;
        *a2 = v23;
      }
      else
      {
        _HKLogDroppedError();
        uint64_t v30 = 0;
      }
      id v26 = v23;
    }
    else
    {
      id v26 = 0;
      uint64_t v30 = 0;
      long long v28 = v45;
      long long v29 = v43;
    }
    goto LABEL_40;
  }
  id v23 = -[HDDaemonSyncMessageHandler initWithSyncEntityClass:anchorRange:session:requiredAnchorMap:]([HDDaemonSyncMessageHandler alloc], "initWithSyncEntityClass:anchorRange:session:requiredAnchorMap:", v4, v9, v41, v11, v14);
  id WeakRetained = objc_loadWeakRetained((id *)(v3 + 8));
  *(void *)&long long v48 = v22;
  char v25 = objc_msgSend(v4, "generateSyncObjectsForSession:syncAnchorRange:profile:messageHandler:error:", v11, v9, v41, WeakRetained, v23, &v48);
  id v26 = (id)v48;

  if ((v25 & 1) == 0)
  {
    [(HDDaemonSyncMessageHandler *)v23 abandonUnsentChangesForError:v26];
    id v34 = v26;
    uint64_t v35 = v34;
    long long v28 = v45;
    id v8 = v46;
    long long v29 = v43;
    if (v34)
    {
      if (a2) {
        *a2 = (HDDaemonSyncMessageHandler *)v34;
      }
      else {
        _HKLogDroppedError();
      }
    }

LABEL_30:
    id v36 = [(HDDaemonSyncMessageHandler *)v23 sendChangesError];

    if (v36)
    {
      uint64_t v37 = [(HDDaemonSyncMessageHandler *)v23 sendChangesError];

      id v26 = (id)v37;
    }
    if (v26)
    {
      id v26 = v26;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 124, @"Unknown error generating and sending sync messages for entity %@", v42);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
LABEL_39:
        uint64_t v30 = 0;
        goto LABEL_40;
      }
    }
    if (a2) {
      *a2 = (HDDaemonSyncMessageHandler *)v26;
    }
    else {
      _HKLogDroppedError();
    }

    goto LABEL_39;
  }
  uint64_t v27 = [(HDDaemonSyncMessageHandler *)v23 sendChangesStatus];
  long long v28 = v45;
  id v8 = v46;
  long long v29 = v43;
  if (!v27) {
    goto LABEL_30;
  }
  uint64_t v30 = v27;
  *(void *)aBlock = MEMORY[0x1E4F143A8];
  *(void *)&aBlock[8] = 3221225472;
  *(void *)&aBlock[16] = __110__HDDaemonSyncEngine__synchronizeSyncEntityClass_session_startAnchor_finalAnchor_postTransactionBlocks_error___block_invoke;
  id v53 = &unk_1E630B1E0;
  id v23 = v23;
  id v54 = v23;
  uint64_t v57 = v42;
  id v55 = v43;
  uint64_t v56 = v3;
  uint64_t v31 = _Block_copy(aBlock);
  [v45 addObject:v31];

  *(void *)(v39 + 24) = [(HDDaemonSyncMessageHandler *)v23 currentAnchor];
LABEL_40:

LABEL_41:
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v30;
  return *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != 0;
}

uint64_t __87__HDDaemonSyncEngine__performSyncTransactionForSession_store_transactionContext_error___block_invoke_445(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v7 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }

  return 1;
}

- (id)unitTest_didCompleteReadTransaction
{
  return self->_unitTest_didCompleteReadTransaction;
}

- (void)setUnitTest_didCompleteReadTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_didCompleteReadTransaction, 0);
  objc_storeStrong((id *)&self->_entityManager, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end