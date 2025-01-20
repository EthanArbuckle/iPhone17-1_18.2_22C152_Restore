@interface HDCloudSyncAddSharingParticipantOperation
- (BOOL)requireExistingRelationship;
- (CKShareParticipant)ownerParticipant;
- (CKShareParticipant)participant;
- (HDCloudSyncAddSharingParticipantOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (NSArray)shareURLs;
- (NSArray)zoneIdentifiers;
- (NSDictionary)invitationTokensByShareURL;
- (void)_foundOwnerParticipant:(uint64_t)a1;
- (void)main;
- (void)setParticipant:(id)a3;
- (void)setRequireExistingRelationship:(BOOL)a3;
- (void)setZoneIdentifiers:(id)a3;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncAddSharingParticipantOperation

- (HDCloudSyncAddSharingParticipantOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncAddSharingParticipantOperation;
  v4 = [(HDCloudSyncOperation *)&v15 initWithConfiguration:a3 cloudState:a4];
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    clonedParticipants = v5->_clonedParticipants;
    v5->_clonedParticipants = v6;

    zoneIdentifiers = v5->_zoneIdentifiers;
    v9 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v5->_zoneIdentifiers = (NSArray *)MEMORY[0x1E4F1CBF0];

    v10 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = v5->_taskGroup;
    v5->_taskGroup = v10;

    [(HDSynchronousTaskGroup *)v5->_taskGroup setDelegate:v5];
    shareURLs = v5->_shareURLs;
    v5->_shareURLs = v9;

    invitationTokensByShareURL = v5->_invitationTokensByShareURL;
    v5->_invitationTokensByShareURL = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  return v5;
}

- (CKShareParticipant)participant
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_participant;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setParticipant:(id)a3
{
  v5 = (CKShareParticipant *)a3;
  if ([(HDCloudSyncOperation *)self status])
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HDCloudSyncAddSharingParticipantOperation.m", 80, @"Invalid parameter not satisfying: %@", @"self.status == HDCloudSyncOperationStatusPending" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  participant = self->_participant;
  self->_participant = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)zoneIdentifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_zoneIdentifiers;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setZoneIdentifiers:(id)a3
{
  id v5 = a3;
  if ([(HDCloudSyncOperation *)self status])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDCloudSyncAddSharingParticipantOperation.m", 96, @"Invalid parameter not satisfying: %@", @"self.status == HDCloudSyncOperationStatusPending" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  v6 = (NSArray *)[v5 copy];

  zoneIdentifiers = self->_zoneIdentifiers;
  self->_zoneIdentifiers = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)requireExistingRelationship
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_requireExistingRelationship;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setRequireExistingRelationship:(BOOL)a3
{
  if ([(HDCloudSyncOperation *)self status])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HDCloudSyncAddSharingParticipantOperation.m", 112, @"Invalid parameter not satisfying: %@", @"self.status == HDCloudSyncOperationStatusPending" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  self->_requireExistingRelationship = a3;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)main
{
  v2 = self;
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  participant = self->_participant;
  if (participant)
  {
    if (!self->_requireExistingRelationship) {
      goto LABEL_26;
    }
    v144 = participant;
    memset(v159, 0, sizeof(v159));
    long long v160 = 0u;
    long long v161 = 0u;
    obj = v2->_zoneIdentifiers;
    uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:v159 objects:v157 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = **(void **)&v159[16];
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (**(void **)&v159[16] != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*(void *)&v159[8] + 8 * i);
          v9 = [HDCloudSyncCachedZone alloc];
          v10 = [(HDCloudSyncOperation *)self configuration];
          v11 = [v10 repository];
          v12 = [(HDCloudSyncOperation *)self configuration];
          v13 = [v12 accessibilityAssertion];
          id v14 = [(HDCloudSyncCachedZone *)v9 initForZoneIdentifier:v8 repository:v11 accessibilityAssertion:v13];

          *(void *)buf = 0;
          objc_super v15 = [v14 zoneShareWithError:buf];
          id v16 = *(id *)buf;
          v17 = v16;
          if (v15) {
            BOOL v18 = 1;
          }
          else {
            BOOL v18 = v16 == 0;
          }
          if (!v18)
          {
            _HKInitializeLogging();
            v23 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v167 = 138543874;
              *(void *)&v167[4] = self;
              *(_WORD *)&v167[12] = 2114;
              *(void *)&v167[14] = v8;
              *(_WORD *)&v167[22] = 2114;
              v168 = v17;
              _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch CKShare for cached zone %{public}@, %{public}@", v167, 0x20u);
            }
            id v25 = v17;

            id v22 = v25;
            [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v22];
            goto LABEL_24;
          }
          if (v15)
          {
            v19 = [v15 participants];
            char v20 = [v19 containsObject:v144];

            if (v20)
            {

              v2 = self;
LABEL_26:
              [(HDSynchronousTaskGroup *)v2->_taskGroup beginTask];
              long long v151 = 0u;
              long long v152 = 0u;
              long long v153 = 0u;
              long long v154 = 0u;
              v26 = [(HDCloudSyncOperation *)v2 configuration];
              v27 = [v26 repository];
              v28 = [v27 allCKContainers];

              v29 = self;
              id v128 = v28;
              uint64_t v130 = [v28 countByEnumeratingWithState:&v151 objects:v156 count:16];
              if (!v130) {
                goto LABEL_109;
              }
              uint64_t v129 = *(void *)v152;
              v30 = &off_1E62EE000;
              while (2)
              {
                uint64_t v31 = 0;
LABEL_29:
                if (*(void *)v152 != v129) {
                  objc_enumerationMutation(v128);
                }
                uint64_t v131 = v31;
                v32 = *(void **)(*((void *)&v151 + 1) + 8 * v31);
                [(HDSynchronousTaskGroup *)v29->_taskGroup beginTask];
                v134 = v29->_participant;
                id v33 = v32;
                id v132 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                memset(v159, 0, sizeof(v159));
                long long v160 = 0u;
                long long v161 = 0u;
                v145 = v29->_zoneIdentifiers;
                uint64_t v34 = [(NSArray *)v145 countByEnumeratingWithState:v159 objects:v157 count:16];
                if (v34)
                {
                  id v35 = (id)v34;
                  uint64_t v36 = **(void **)&v159[16];
                  uint64_t v136 = **(void **)&v159[16];
                  id v139 = v33;
                  while (2)
                  {
                    v37 = 0;
                    id obja = v35;
                    do
                    {
                      if (**(void **)&v159[16] != v36) {
                        objc_enumerationMutation(v145);
                      }
                      v38 = *(void **)(*(void *)&v159[8] + 8 * (void)v37);
                      v39 = [v38 containerIdentifier];
                      v40 = [v33 containerIdentifier];
                      int v41 = [v39 isEqualToString:v40];

                      if (v41)
                      {
                        id v42 = objc_alloc((Class)v30[510]);
                        v43 = [(HDCloudSyncOperation *)v29 configuration];
                        v44 = [v43 repository];
                        v45 = [(HDCloudSyncOperation *)v29 configuration];
                        v46 = [v45 accessibilityAssertion];
                        v47 = (void *)[v42 initForZoneIdentifier:v38 repository:v44 accessibilityAssertion:v46];

                        if ([v47 zoneType] != 4)
                        {
                          id v155 = 0;
                          v48 = [v47 zoneShareWithError:&v155];
                          id v49 = v155;
                          v50 = v49;
                          if (!v48 && v49)
                          {
                            _HKInitializeLogging();
                            v73 = *MEMORY[0x1E4F29FA8];
                            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)v167 = 138543874;
                              *(void *)&v167[4] = v29;
                              *(_WORD *)&v167[12] = 2114;
                              *(void *)&v167[14] = v38;
                              *(_WORD *)&v167[22] = 2114;
                              v168 = v50;
                              _os_log_error_impl(&dword_1BCB7D000, v73, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch CKShare for cached zone %{public}@, %{public}@", v167, 0x20u);
                            }
                            id v72 = v50;

                            id v71 = 0;
                            id v33 = v139;
                            v70 = v132;
                            goto LABEL_62;
                          }
                          if (!v48)
                          {
                            id v51 = objc_alloc(MEMORY[0x1E4F1A390]);
                            v52 = [v38 zoneIdentifier];
                            v48 = (void *)[v51 initWithRecordZoneID:v52];
                          }
                          v53 = v134;
                          id v54 = v38;
                          id v55 = v48;
                          v56 = [v55 participants];
                          *(void *)v167 = MEMORY[0x1E4F143A8];
                          *(void *)&v167[8] = 3221225472;
                          *(void *)&v167[16] = __90__HDCloudSyncAddSharingParticipantOperation__addParticipantIfNeeded_zoneIdentifier_share___block_invoke;
                          v168 = &unk_1E62FA838;
                          v57 = v53;
                          v169 = v57;
                          v58 = objc_msgSend(v56, "hk_firstObjectPassingTest:", v167);

                          if (v58
                            && (id v59 = v58,
                                uint64_t v60 = [v59 acceptanceStatus],
                                uint64_t v61 = [v59 permission],
                                v59,
                                v60 == 2)
                            && v61 == 3)
                          {
                            _HKInitializeLogging();
                            v62 = *MEMORY[0x1E4F29FA8];
                            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)buf = 138543874;
                              v63 = self;
                              *(void *)&buf[4] = self;
                              __int16 v163 = 2114;
                              id v164 = v54;
                              __int16 v165 = 2114;
                              id v166 = v59;
                              _os_log_impl(&dword_1BCB7D000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: Skipping, zone already contains this participant: %{public}@.", buf, 0x20u);
                              v64 = 0;
                            }
                            else
                            {
                              v64 = 0;
                              v63 = self;
                            }
                          }
                          else
                          {
                            v64 = (void *)[(CKShareParticipant *)v57 copy];
                            v65 = [MEMORY[0x1E4F29128] UUID];
                            v66 = [v65 UUIDString];
                            [v64 setParticipantID:v66];

                            [v64 setPermission:3];
                            [v55 addParticipant:v64];
                            v63 = self;
                            os_unfair_lock_lock(&self->_lock);
                            [(NSMutableArray *)self->_clonedParticipants addObject:v64];
                            os_unfair_lock_unlock(&self->_lock);
                          }

                          if (v64)
                          {
                            _HKInitializeLogging();
                            v67 = *MEMORY[0x1E4F29FA8];
                            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)v167 = 138543874;
                              *(void *)&v167[4] = v63;
                              *(_WORD *)&v167[12] = 2114;
                              *(void *)&v167[14] = v54;
                              *(_WORD *)&v167[22] = 2114;
                              v168 = v64;
                              _os_log_impl(&dword_1BCB7D000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: Added participant: %{public}@", v167, 0x20u);
                            }
                            [v132 setObject:v55 forKeyedSubscript:v54];
                          }
                          v68 = [v55 owner];
                          -[HDCloudSyncAddSharingParticipantOperation _foundOwnerParticipant:]((uint64_t)self, v68);

                          v29 = self;
                          v30 = &off_1E62EE000;
                        }

                        uint64_t v36 = v136;
                        id v33 = v139;
                        id v35 = obja;
                      }
                      v37 = (char *)v37 + 1;
                    }
                    while (v35 != v37);
                    uint64_t v69 = [(NSArray *)v145 countByEnumeratingWithState:v159 objects:v157 count:16];
                    id v35 = (id)v69;
                    if (v69) {
                      continue;
                    }
                    break;
                  }
                }

                v70 = v132;
                id v71 = v132;
                id v72 = 0;
LABEL_62:

                id v74 = v72;
                v75 = v74;
                if (!v71 && v74)
                {
                  [(HDSynchronousTaskGroup *)v29->_taskGroup failTaskWithError:v74];
                  goto LABEL_107;
                }
                v76 = [v71 allValues];
                uint64_t v77 = [v76 count];

                if (!v77)
                {
                  v29 = self;
                  [(HDSynchronousTaskGroup *)self->_taskGroup finishTask];
                  goto LABEL_107;
                }
                v78 = [v71 allValues];
                id v79 = v33;
                v80 = [(HDCloudSyncOperation *)self configuration];
                v81 = [v80 repository];

                v82 = [v81 behavior];
                int v83 = [v82 tinkerModeEnabled];

                if (!v83)
                {
                  v89 = 0;
                  goto LABEL_104;
                }
                v84 = [(HDCloudSyncOperation *)self configuration];
                v85 = [v84 cachedCloudState];
                *(void *)v167 = 0;
                v86 = [v85 zonesByIdentifierWithError:v167];
                id v87 = *(id *)v167;

                if (!v86 && v87)
                {
                  _HKInitializeLogging();
                  v88 = *MEMORY[0x1E4F29FA8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v159 = 138543618;
                    *(void *)&v159[4] = self;
                    *(_WORD *)&v159[12] = 2114;
                    *(void *)&v159[14] = v87;
                    _os_log_error_impl(&dword_1BCB7D000, v88, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached unified zone, %{public}@", v159, 0x16u);
                  }
                  v89 = 0;
LABEL_103:

LABEL_104:
                  if (v89)
                  {
                    uint64_t v115 = [v78 arrayByAddingObject:v89];

                    v78 = (void *)v115;
                  }
                  v116 = [HDCloudSyncModifyRecordsOperation alloc];
                  v117 = [(HDCloudSyncOperation *)self configuration];
                  v118 = [(HDCloudSyncModifyRecordsOperation *)v116 initWithConfiguration:v117 container:v79 recordsToSave:v78 recordIDsToDelete:0];

                  v29 = self;
                  [(HDCloudSyncModifyRecordsOperation *)v118 setTreatAnyErrorAsFatal:1];
                  v150[0] = MEMORY[0x1E4F143A8];
                  v150[1] = 3221225472;
                  v150[2] = __49__HDCloudSyncAddSharingParticipantOperation_main__block_invoke;
                  v150[3] = &unk_1E62F2950;
                  v150[4] = self;
                  [(HDCloudSyncOperation *)v118 setOnError:v150];
                  v149[0] = MEMORY[0x1E4F143A8];
                  v149[1] = 3221225472;
                  v149[2] = __49__HDCloudSyncAddSharingParticipantOperation_main__block_invoke_297;
                  v149[3] = &unk_1E62F2928;
                  v149[4] = self;
                  [(HDCloudSyncOperation *)v118 setOnSuccess:v149];
                  [(HDCloudSyncOperation *)v118 start];

LABEL_107:
                  uint64_t v31 = v131 + 1;
                  if (v131 + 1 == v130)
                  {
                    uint64_t v130 = [v128 countByEnumeratingWithState:&v151 objects:v156 count:16];
                    if (!v130)
                    {
LABEL_109:

                      [(HDSynchronousTaskGroup *)v29->_taskGroup finishTask];
                      return;
                    }
                    continue;
                  }
                  goto LABEL_29;
                }
                break;
              }
              v140 = v86;
              v90 = [v86 allValues];
              v157[0] = MEMORY[0x1E4F143A8];
              v157[1] = 3221225472;
              v157[2] = __88__HDCloudSyncAddSharingParticipantOperation__updatedRegistryRecordIfNeededForContainer___block_invoke;
              v157[3] = &unk_1E62F4338;
              id v91 = v79;
              id v158 = v91;
              v92 = objc_msgSend(v90, "hk_filter:", v157);

              id v146 = v92;
              if ((unint64_t)[v92 count] >= 2)
              {
                _HKInitializeLogging();
                v93 = (void *)*MEMORY[0x1E4F29FA8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
                {
                  v119 = v93;
                  [v91 containerIdentifier];
                  v120 = id v138 = v87;
                  v121 = [v81 profileIdentifier];
                  v122 = HDDatabaseForContainer(v91, v121);
                  [v122 databaseScope];
                  v123 = CKDatabaseScopeString();
                  *(_DWORD *)v159 = 138543874;
                  *(void *)&v159[4] = self;
                  *(_WORD *)&v159[12] = 2114;
                  *(void *)&v159[14] = v120;
                  *(_WORD *)&v159[22] = 2114;
                  *(void *)&v159[24] = v123;
                  _os_log_fault_impl(&dword_1BCB7D000, v119, OS_LOG_TYPE_FAULT, "%{public}@ Retrieved multiple cached unified zone for container %{public}@, database %{public}@. This is unexpected.", v159, 0x20u);

                  v30 = &off_1E62EE000;
                  id v87 = v138;
                }
              }
              uint64_t v94 = [v146 firstObject];
              id objb = (id)v94;
              if (!v94)
              {
                _HKInitializeLogging();
                v100 = *MEMORY[0x1E4F29FA8];
                v86 = v140;
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v159 = 138543362;
                  *(void *)&v159[4] = self;
                  _os_log_error_impl(&dword_1BCB7D000, v100, OS_LOG_TYPE_ERROR, "%{public}@ Unified zone does not exist.", v159, 0xCu);
                }
                v89 = 0;
                goto LABEL_102;
              }
              v95 = (void *)v94;
              id v137 = v87;
              uint64_t v96 = objc_opt_class();
              *(void *)buf = 0;
              v97 = [v95 recordsForClass:v96 error:buf];
              id v98 = *(id *)buf;
              v86 = v140;
              v135 = v98;
              if (!v97 && v98)
              {
                _HKInitializeLogging();
                v99 = (void *)*MEMORY[0x1E4F29FA8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                {
                  v124 = v99;
                  v125 = [v95 zoneIdentifier];
                  *(_DWORD *)v159 = 138543874;
                  *(void *)&v159[4] = self;
                  *(_WORD *)&v159[12] = 2114;
                  *(void *)&v159[14] = v125;
                  *(_WORD *)&v159[22] = 2114;
                  *(void *)&v159[24] = v135;
                  _os_log_error_impl(&dword_1BCB7D000, v124, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get registry records for %{public}@, %{public}@", v159, 0x20u);
                }
                v89 = 0;
LABEL_101:

                id v87 = v137;
LABEL_102:

                goto LABEL_103;
              }
              if ((unint64_t)[v97 count] >= 2)
              {
                _HKInitializeLogging();
                v101 = (void *)*MEMORY[0x1E4F29FA8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
                {
                  v126 = v101;
                  v127 = [objb zoneIdentifier];
                  *(_DWORD *)v159 = 138543618;
                  *(void *)&v159[4] = self;
                  *(_WORD *)&v159[12] = 2114;
                  *(void *)&v159[14] = v127;
                  _os_log_fault_impl(&dword_1BCB7D000, v126, OS_LOG_TYPE_FAULT, "%{public}@ Retrieved multiple registry records for %{public}@. This is unexpected.", v159, 0x16u);
                }
              }
              v102 = [v97 firstObject];
              if (v102)
              {
                id v103 = v102;
                uint64_t v104 = [v102 sharedProfileIdentifier];
                if (v104)
                {
                  v105 = (void *)v104;
                  v106 = [v103 ownerProfileIdentifier];

                  if (v106)
                  {
                    v89 = 0;
                    goto LABEL_99;
                  }
                }
                v107 = [v103 ownerProfileIdentifier];

                if (!v107)
                {
                  v108 = [v81 profileIdentifier];
                  [v103 setOwnerProfileIdentifier:v108];
                }
                v109 = [v103 sharedProfileIdentifier];

                v30 = &off_1E62EE000;
                if (!v109)
                {
                  v110 = [v81 profileIdentifier];
                  v111 = +[HDCloudSyncRegistryRecord sharedProfileIdentifierForOwnerProfileIdentifier:v110];
                  [v103 setSharedProfileIdentifier:v111];

                  v30 = &off_1E62EE000;
                }
                v89 = [v103 record];
              }
              else
              {
                v112 = [HDCloudSyncRegistryRecord alloc];
                v133 = [objb zoneIdentifier];
                v113 = [v133 zoneIdentifier];
                v114 = [v81 profileIdentifier];
                id v103 = [(HDCloudSyncRegistryRecord *)v112 initInZone:v113 ownerProfileIdentifier:v114];

                v89 = [v103 record];
LABEL_99:
                v30 = &off_1E62EE000;
              }

              goto LABEL_101;
            }
          }
        }
        uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:v159 objects:v157 count:16];
      }
      while (v5);
    }

    v21 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 707, @"Participant not found on any zones: %@", self->_participant);
    [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v21];

    id v22 = 0;
LABEL_24:

    return;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForNilArgument:class:selector:", @"_participant", objc_opt_class(), a2);
  id v148 = (id)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation finishWithSuccess:error:](v2, "finishWithSuccess:error:", 0);
}

void __49__HDCloudSyncAddSharingParticipantOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update shares: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(*(void *)(a1 + 32) + 144) failTaskWithError:v4];
}

void __49__HDCloudSyncAddSharingParticipantOperation_main__block_invoke_297(uint64_t a1, void *a2)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v65 = v5;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully updated share records", buf, 0xCu);
  }
  uint64_t v6 = [v3 savedRecords];

  int v7 = objc_msgSend(v6, "hk_map:", &__block_literal_global_56);

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v7;
  if (v8)
  {
    uint64_t v40 = a1;
    os_unfair_lock_lock((os_unfair_lock_t)(v8 + 104));
    id v46 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v39 = v9;
    obuint64_t j = v9;
    uint64_t v43 = [obj countByEnumeratingWithState:&v51 objects:buf count:16];
    if (!v43) {
      goto LABEL_33;
    }
    uint64_t v42 = *(void *)v52;
    while (1)
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v52 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "owner", v39);
        -[HDCloudSyncAddSharingParticipantOperation _foundOwnerParticipant:](v8, v12);

        _HKInitializeLogging();
        v13 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v55 = 138543618;
          uint64_t v56 = v8;
          __int16 v57 = 2114;
          v58 = v11;
          _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Looking for added participant on share: %{public}@", v55, 0x16u);
        }
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v14 = [v11 participants];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v47 objects:v63 count:16];
        if (!v15)
        {

LABEL_29:
          _HKInitializeLogging();
          v30 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            uint64_t v31 = v30;
            v32 = [v11 participants];
            id v33 = [v11 recordID];
            uint64_t v34 = [v33 zoneID];
            *(_DWORD *)id v55 = 138543874;
            uint64_t v56 = v8;
            __int16 v57 = 2114;
            v58 = v32;
            __int16 v59 = 2114;
            uint64_t v60 = v34;
            _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "%{public}@: Failed to find a matching participant with pending status in the participants (%{public}@) for zone %{public}@", v55, 0x20u);
          }
          continue;
        }
        uint64_t v16 = v15;
        uint64_t v44 = i;
        char v17 = 0;
        uint64_t v18 = *(void *)v48;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v48 != v18) {
              objc_enumerationMutation(v14);
            }
            char v20 = *(void **)(*((void *)&v47 + 1) + 8 * j);
            _HKInitializeLogging();
            v21 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)id v55 = 138543618;
              uint64_t v56 = v8;
              __int16 v57 = 2114;
              v58 = v20;
              _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Found candidate participant: %{public}@", v55, 0x16u);
            }
            if ([*(id *)(v8 + 120) containsObject:v20])
            {
              if ([v20 acceptanceStatus] == 1)
              {
                id v22 = [v11 URL];

                if (v22)
                {
                  v23 = [v11 URL];
                  [v45 addObject:v23];

                  v24 = [v20 invitationToken];
                  id v25 = [v11 URL];
                  [v46 setObject:v24 forKeyedSubscript:v25];

                  _HKInitializeLogging();
                  v26 = (void *)*MEMORY[0x1E4F29FA8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
                  {
                    v27 = v26;
                    v28 = [v11 URL];
                    v29 = [v20 invitationToken];
                    *(_DWORD *)id v55 = 138544130;
                    uint64_t v56 = v8;
                    __int16 v57 = 2114;
                    v58 = v20;
                    __int16 v59 = 2114;
                    uint64_t v60 = v28;
                    __int16 v61 = 2114;
                    v62 = v29;
                    _os_log_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: Found added participant: %{public}@ with share URL: %{public}@ and token: %{public}@", v55, 0x2Au);
                  }
                  char v17 = 1;
                }
              }
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v47 objects:v63 count:16];
        }
        while (v16);

        uint64_t i = v44;
        if ((v17 & 1) == 0) {
          goto LABEL_29;
        }
      }
      uint64_t v43 = [obj countByEnumeratingWithState:&v51 objects:buf count:16];
      if (!v43)
      {
LABEL_33:

        uint64_t v35 = [*(id *)(v8 + 152) arrayByAddingObjectsFromArray:v45];
        uint64_t v36 = *(void **)(v8 + 152);
        *(void *)(v8 + 152) = v35;

        uint64_t v37 = objc_msgSend(*(id *)(v8 + 160), "hk_dictionaryByAddingEntriesFromDictionary:", v46);
        v38 = *(void **)(v8 + 160);
        *(void *)(v8 + 160) = v37;

        os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 104));
        id v9 = v39;
        a1 = v40;
        break;
      }
    }
  }

  [*(id *)(*(void *)(a1 + 32) + 144) finishTask];
}

id __49__HDCloudSyncAddSharingParticipantOperation_main__block_invoke_298(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hd_isCKShare")) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

uint64_t __88__HDCloudSyncAddSharingParticipantOperation__updatedRegistryRecordIfNeededForContainer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 zoneType] == 2)
  {
    id v4 = [v3 zoneIdentifier];
    uint64_t v5 = [v4 containerIdentifier];
    uint64_t v6 = [*(id *)(a1 + 32) containerIdentifier];
    uint64_t v7 = [v5 isEqualToString:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __90__HDCloudSyncAddSharingParticipantOperation__addParticipantIfNeeded_zoneIdentifier_share___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

- (void)_foundOwnerParticipant:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = v4;
  if (!*(void *)(a1 + 168))
  {
    uint64_t v6 = [v4 userIdentity];
    uint64_t v7 = [v6 userRecordID];
    uint64_t v8 = [v7 recordName];
    int v9 = [v8 isEqualToString:*MEMORY[0x1E4F19C08]];

    _HKInitializeLogging();
    id v10 = *MEMORY[0x1E4F29FA8];
    BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        int v12 = 138543618;
        uint64_t v13 = a1;
        __int16 v14 = 2114;
        uint64_t v15 = v5;
        _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring candidate owner %{public}@ with default record name.", (uint8_t *)&v12, 0x16u);
      }
    }
    else
    {
      if (v11)
      {
        int v12 = 138543618;
        uint64_t v13 = a1;
        __int16 v14 = 2114;
        uint64_t v15 = v5;
        _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Found owner participant: %{public}@", (uint8_t *)&v12, 0x16u);
      }
      objc_storeStrong((id *)(a1 + 168), a2);
    }
  }
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  BOOL v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(HDCloudSyncOperation *)self finishWithSuccess:v5 error:v7];
}

- (NSArray)shareURLs
{
  return self->_shareURLs;
}

- (NSDictionary)invitationTokensByShareURL
{
  return self->_invitationTokensByShareURL;
}

- (CKShareParticipant)ownerParticipant
{
  return self->_ownerParticipant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerParticipant, 0);
  objc_storeStrong((id *)&self->_invitationTokensByShareURL, 0);
  objc_storeStrong((id *)&self->_shareURLs, 0);
  objc_storeStrong((id *)&self->_taskGroup, 0);
  objc_storeStrong((id *)&self->_zoneIdentifiers, 0);
  objc_storeStrong((id *)&self->_clonedParticipants, 0);

  objc_storeStrong((id *)&self->_participant, 0);
}

@end