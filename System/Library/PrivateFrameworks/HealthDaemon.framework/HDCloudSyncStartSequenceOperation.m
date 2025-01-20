@interface HDCloudSyncStartSequenceOperation
- (BOOL)performWithError:(id *)a3;
- (HDCloudSyncSequenceState)sequenceState;
- (HDCloudSyncStartSequenceOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncStartSequenceOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 target:(id)a5 sequence:(id)a6 replacingSequence:(id)a7 shouldClearRebaselineDeadline:(BOOL)a8;
- (uint64_t)_updateDisplayNameForRegistryRecord:(uint64_t)a3 error:;
@end

@implementation HDCloudSyncStartSequenceOperation

- (HDCloudSyncStartSequenceOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncStartSequenceOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 target:(id)a5 sequence:(id)a6 replacingSequence:(id)a7 shouldClearRebaselineDeadline:(BOOL)a8
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HDCloudSyncStartSequenceOperation;
  v18 = [(HDCloudSyncOperation *)&v21 initWithConfiguration:a3 cloudState:a4];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_target, a5);
    objc_storeStrong((id *)&v19->_sequenceRecord, a6);
    objc_storeStrong((id *)&v19->_replacedSequenceRecord, a7);
    v19->_shouldClearRebaselineDeadline = a8;
  }

  return v19;
}

- (BOOL)performWithError:(id *)a3
{
  v3 = self;
  v108[1] = *MEMORY[0x1E4F143B8];
  if (self)
  {
    replacedSequenceRecord = self->_replacedSequenceRecord;
    if (replacedSequenceRecord)
    {
      uint64_t v6 = [(HDCloudSyncRecord *)replacedSequenceRecord recordID];
      v108[0] = v6;
      v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:1];
    }
    else
    {
      v7 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v8 = [(HDCloudSyncTarget *)v3->_target zoneIdentifier];
    uint64_t v9 = [v8 type];

    if (v9 != 2)
    {
      v32 = [HDCloudSyncSequenceState alloc];
      uint64_t v33 = [(HDCloudSyncSequenceState *)v32 initWithRecordsToSave:MEMORY[0x1E4F1CBF0] recordIDsToDelete:v7 shouldClearRebaselineDeadline:v3->_shouldClearRebaselineDeadline];
      sequenceState = v3->_sequenceState;
      v3->_sequenceState = (HDCloudSyncSequenceState *)v33;
      LOBYTE(v3) = 1;
LABEL_45:

      return (char)v3;
    }
    v97 = v7;
    v10 = [(HDCloudSyncOperation *)v3 configuration];
    v11 = [v10 repository];
    v12 = [(HDCloudSyncOperation *)v3 configuration];
    v13 = [v12 repository];
    v14 = [v13 primaryCKContainer];
    id v15 = [v11 cachedOwnerIdentifierForContainer:v14];
    sequenceState = [v15 string];

    id v17 = [(HDCloudSyncOperation *)v3 configuration];
    v18 = [v17 repository];
    v19 = [v18 syncIdentityManager];
    v20 = [v19 currentSyncIdentity];
    v98 = [v20 identity];

    objc_super v21 = [HDCloudSyncCachedZone alloc];
    v22 = [(HDCloudSyncTarget *)v3->_target zoneIdentifier];
    v23 = [(HDCloudSyncOperation *)v3 configuration];
    v24 = [v23 repository];
    v25 = [(HDCloudSyncOperation *)v3 configuration];
    v26 = [v25 accessibilityAssertion];
    id v27 = [(HDCloudSyncCachedZone *)v21 initForZoneIdentifier:v22 repository:v24 accessibilityAssertion:v26];

    id v100 = 0;
    v28 = [v27 recordsForClass:objc_opt_class() error:&v100];
    id v29 = v100;
    v30 = v29;
    if (!v28 && v29)
    {
      _HKInitializeLogging();
      v31 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        target = v3->_target;
        v84 = v31;
        v85 = [(HDCloudSyncTarget *)target zoneIdentifier];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v3;
        __int16 v104 = 2114;
        v105 = v85;
        __int16 v106 = 2114;
        v107 = v30;
        _os_log_error_impl(&dword_1BCB7D000, v84, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get registry records for %{public}@, %{public}@", buf, 0x20u);
      }
      if (a3)
      {
        LOBYTE(v3) = 0;
        *a3 = v30;
      }
      else
      {
        _HKLogDroppedError();
        LOBYTE(v3) = 0;
      }
      v7 = v97;
      goto LABEL_44;
    }
    v91 = a3;
    v94 = sequenceState;
    if ((unint64_t)[v28 count] >= 2)
    {
      _HKInitializeLogging();
      v34 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        v86 = v3->_target;
        v87 = v34;
        v88 = [(HDCloudSyncTarget *)v86 zoneIdentifier];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v3;
        __int16 v104 = 2114;
        v105 = v88;
        _os_log_error_impl(&dword_1BCB7D000, v87, OS_LOG_TYPE_ERROR, "%{public}@ Retrieved multiple cached registry records for %{public}@,", buf, 0x16u);
      }
    }
    v35 = [v28 firstObject];
    BOOL v92 = v35 == 0;
    if (!v35)
    {
      v89 = v30;
      v95 = v27;
      v36 = [HDCloudSyncRegistryRecord alloc];
      v37 = [(HDCloudSyncTarget *)v3->_target zoneIdentifier];
      v38 = [v37 zoneIdentifier];
      v39 = [(HDCloudSyncOperation *)v3 configuration];
      v40 = [v39 repository];
      v41 = [v40 profile];
      uint64_t v42 = [v41 profileIdentifier];
      id v43 = [(HDCloudSyncRegistryRecord *)v36 initInZone:v38 ownerProfileIdentifier:v42];

      v35 = v43;
      *(void *)buf = 0;
      LOBYTE(v42) = -[HDCloudSyncStartSequenceOperation _updateDisplayNameForRegistryRecord:error:](v3, v43, (uint64_t)buf);
      id v44 = *(id *)buf;
      if ((v42 & 1) == 0)
      {
        id v79 = v44;
        id v27 = v95;
        v7 = v97;
        sequenceState = v94;
        v30 = v89;
        if (!v79) {
          goto LABEL_42;
        }
        goto LABEL_39;
      }

      id v27 = v95;
      v30 = v89;
    }
    v96 = v35;
    v45 = [v35 storeIdentifiersForSyncIdentity:v98];
    v46 = [(HDCloudSyncTarget *)v3->_target store];
    v47 = [v46 storeIdentifier];
    char v48 = [v45 containsObject:v47];

    if ((v48 & 1) == 0)
    {
      v93 = [(HDCloudSyncTarget *)v3->_target store];
      v49 = [v93 storeIdentifier];
      v90 = [(HDCloudSyncOperation *)v3 configuration];
      v50 = [v90 repository];
      v51 = [v50 syncIdentityManager];
      [v51 currentSyncIdentity];
      v52 = v28;
      v54 = v53 = v27;
      [v54 identity];
      v56 = v55 = v30;
      [v96 addStoreIdentifier:v49 ownerIdentifier:v94 syncIdentity:v56];

      v30 = v55;
      id v27 = v53;
      v28 = v52;

      BOOL v92 = 1;
    }
    v57 = [(HDCloudSyncTarget *)v3->_target zoneIdentifier];
    uint64_t v58 = [v57 scope];

    if (v58 == 2)
    {
      v35 = v96;
      v59 = [v96 ownerProfileIdentifier];

      if (!v59)
      {
        v60 = [(HDCloudSyncOperation *)v3 configuration];
        v61 = [v60 repository];
        v62 = [v61 profile];
        v63 = [v62 profileIdentifier];
        [v96 setOwnerProfileIdentifier:v63];

        v35 = v96;
        BOOL v92 = 1;
      }
      v64 = [v35 sharedProfileIdentifier];

      if (!v64)
      {
        v65 = [(HDCloudSyncOperation *)v3 configuration];
        v66 = [v65 repository];
        v67 = [v66 profile];
        [v67 profileIdentifier];
        v68 = v30;
        v69 = v28;
        v71 = v70 = v27;
        v72 = +[HDCloudSyncRegistryRecord sharedProfileIdentifierForOwnerProfileIdentifier:v71];
        [v96 setSharedProfileIdentifier:v72];

        id v27 = v70;
        v28 = v69;
        v30 = v68;

        v35 = v96;
        BOOL v92 = 1;
      }
    }
    else
    {
      v35 = v96;
    }
    v73 = [(HDCloudSyncOperation *)v3 configuration];
    v74 = [v73 repository];
    uint64_t v75 = [v74 profileType];

    if (v75 != 3)
    {
      v7 = v97;
      sequenceState = v94;
      if (!v92)
      {
        id v79 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_37;
      }
LABEL_31:
      v78 = [v35 record];
      v102 = v78;
      id v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];

LABEL_37:
      v80 = [[HDCloudSyncSequenceState alloc] initWithRecordsToSave:v79 recordIDsToDelete:v7 shouldClearRebaselineDeadline:v3->_shouldClearRebaselineDeadline];
      v81 = v3->_sequenceState;
      v3->_sequenceState = v80;

      BOOL v101 = 1;
LABEL_43:

      LOBYTE(v3) = v101;
LABEL_44:

      goto LABEL_45;
    }
    id v99 = 0;
    int v76 = -[HDCloudSyncStartSequenceOperation _updateDisplayNameForRegistryRecord:error:](v3, v35, (uint64_t)&v99);
    id v77 = v99;
    v7 = v97;
    sequenceState = v94;
    if (v76)
    {

      goto LABEL_31;
    }
    id v79 = v77;
    if (!v79)
    {
LABEL_42:

      BOOL v101 = v79 == 0;
      goto LABEL_43;
    }
LABEL_39:
    if (v91) {
      id *v91 = v79;
    }
    else {
      _HKLogDroppedError();
    }
    goto LABEL_42;
  }
  return (char)v3;
}

- (uint64_t)_updateDisplayNameForRegistryRecord:(uint64_t)a3 error:
{
  id v5 = a2;
  uint64_t v6 = [a1 configuration];
  v7 = [v6 repository];
  v8 = [v7 profile];
  uint64_t v9 = [v8 legacyRepositoryProfile];
  id v14 = 0;
  id v15 = 0;
  uint64_t v10 = [v9 fetchDisplayFirstName:&v15 lastName:&v14 error:a3];
  id v11 = v15;
  id v12 = v14;

  if (v10)
  {
    if (v11) {
      [v5 setDisplayFirstName:v11];
    }
    if (v12) {
      [v5 setDisplayLastName:v12];
    }
  }

  return v10;
}

- (HDCloudSyncSequenceState)sequenceState
{
  return self->_sequenceState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceState, 0);
  objc_storeStrong((id *)&self->_replacedSequenceRecord, 0);
  objc_storeStrong((id *)&self->_sequenceRecord, 0);

  objc_storeStrong((id *)&self->_target, 0);
}

@end