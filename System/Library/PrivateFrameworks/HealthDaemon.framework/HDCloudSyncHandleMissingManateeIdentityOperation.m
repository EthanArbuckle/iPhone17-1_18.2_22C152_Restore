@interface HDCloudSyncHandleMissingManateeIdentityOperation
+ (BOOL)shouldLogAtOperationStart;
- (HDCloudSyncHandleMissingManateeIdentityOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (NSArray)zoneIdentifiersWithIdentityLost;
- (void)main;
- (void)setZoneIdentifiersWithIdentityLost:(id)a3;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncHandleMissingManateeIdentityOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (HDCloudSyncHandleMissingManateeIdentityOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)HDCloudSyncHandleMissingManateeIdentityOperation;
  v4 = [(HDCloudSyncOperation *)&v9 initWithConfiguration:a3 cloudState:0];
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v6 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = v5->_taskGroup;
    v5->_taskGroup = v6;

    [(HDSynchronousTaskGroup *)v5->_taskGroup setDelegate:v5];
  }
  return v5;
}

- (void)main
{
  v2 = self;
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v3 = [(HDCloudSyncOperation *)v2 configuration];
  v4 = [v3 repository];
  v5 = [v4 allCKContainers];

  obuint64_t j = v5;
  uint64_t v63 = [v5 countByEnumeratingWithState:&v72 objects:v102 count:16];
  if (v63)
  {
    uint64_t v62 = *(void *)v73;
    unint64_t v6 = 0x1E4F1C000uLL;
    p_isa = (id *)&v2->super.super.isa;
    do
    {
      for (uint64_t i = 0; i != v63; uint64_t i = v57 + 1)
      {
        if (*(void *)v73 != v62) {
          objc_enumerationMutation(obj);
        }
        uint64_t v67 = i;
        id v8 = *(id *)(*((void *)&v72 + 1) + 8 * i);
        [(HDSynchronousTaskGroup *)v2->_taskGroup beginTask];
        objc_super v9 = [(HDCloudSyncOperation *)v2 configuration];
        v10 = [v9 cachedCloudState];
        v11 = [v8 containerIdentifier];
        v12 = [(HDCloudSyncOperation *)v2 configuration];
        v13 = [v12 repository];
        v14 = [v13 profileIdentifier];
        v66 = v8;
        v15 = HDDatabaseForContainer(v8, v14);
        uint64_t v16 = [v15 databaseScope];
        id v84 = 0;
        v17 = [v10 zoneIdentifiersWithIdentityLossForContainerIdentifier:v11 databaseScope:v16 error:&v84];
        id v18 = v84;

        if (!v17 && v18)
        {
          v2 = (HDCloudSyncHandleMissingManateeIdentityOperation *)p_isa;
          [p_isa[13] failTaskWithError:v18];
LABEL_46:
          uint64_t v57 = v67;
          goto LABEL_47;
        }
        if (![v17 count])
        {
          _HKInitializeLogging();
          v58 = *MEMORY[0x1E4F29FA8];
          v2 = (HDCloudSyncHandleMissingManateeIdentityOperation *)p_isa;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v105 = p_isa;
            _os_log_debug_impl(&dword_1BCB7D000, v58, OS_LOG_TYPE_DEBUG, "%{public}@: Nothing to delete.", buf, 0xCu);
          }
          [p_isa[13] finishTask];
          goto LABEL_46;
        }
        id v60 = v18;
        id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        id v20 = v17;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v80 objects:buf count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v81;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v81 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = *(void **)(*((void *)&v80 + 1) + 8 * j);
              v26 = [v25 containerIdentifier];
              id v27 = [v19 objectForKeyedSubscript:v26];

              if (!v27)
              {
                id v27 = objc_alloc_init(*(Class *)(v6 + 2632));
                v28 = [v25 containerIdentifier];
                [v19 setObject:v27 forKeyedSubscript:v28];
              }
              [v27 addObject:v25];
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v80 objects:buf count:16];
          }
          while (v22);
        }
        v61 = v17;

        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v29 = v19;
        v2 = (HDCloudSyncHandleMissingManateeIdentityOperation *)p_isa;
        uint64_t v71 = [v29 countByEnumeratingWithState:&v76 objects:v103 count:16];
        if (!v71) {
          goto LABEL_40;
        }
        uint64_t v70 = *(void *)v77;
        id v68 = v29;
        do
        {
          uint64_t v30 = 0;
          do
          {
            if (*(void *)v77 != v70) {
              objc_enumerationMutation(v29);
            }
            uint64_t v31 = *(void *)(*((void *)&v76 + 1) + 8 * v30);
            v32 = [(HDCloudSyncOperation *)v2 configuration];
            v33 = [v32 repository];
            v34 = [v33 containerForContainerIdentifier:v31];

            if (!v34)
            {
              v56 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 723, @"Unable to retrieve container for identifier '%@'", v31);
              [(HDCloudSyncOperation *)v2 finishWithSuccess:0 error:v56];

              goto LABEL_42;
            }
            id v35 = [v29 objectForKeyedSubscript:v31];
            id v36 = v34;
            v37 = [(HDCloudSyncOperation *)v2 configuration];
            v38 = [v37 repository];
            v39 = [v38 profileIdentifier];
            v40 = HDDatabaseForContainer(v36, v39);

            uint64_t v41 = [v40 databaseScope];
            if (v41 != 1)
            {
              if (v41 == 3)
              {
                id v42 = v36;
                uint64_t v85 = MEMORY[0x1E4F143A8];
                uint64_t v86 = 3221225472;
                v87 = __115__HDCloudSyncHandleMissingManateeIdentityOperation__leaveSharesForLostManateeIdentitiesInZones_container_database___block_invoke;
                v88 = &unk_1E62FE928;
                v89 = v2;
                objc_msgSend(v35, "hk_map:", &v85);
                id v43 = (id)objc_claimAutoreleasedReturnValue();
                if ([v43 count])
                {
                  [(HDSynchronousTaskGroup *)v2->_taskGroup beginTask];
                  v52 = [HDCloudSyncModifyRecordsOperation alloc];
                  v53 = [(HDCloudSyncOperation *)v2 configuration];
                  v54 = [(HDCloudSyncModifyRecordsOperation *)v52 initWithConfiguration:v53 container:v42 recordsToSave:0 recordIDsToDelete:v43];

                  v2 = (HDCloudSyncHandleMissingManateeIdentityOperation *)p_isa;
                  [(HDCloudSyncModifyRecordsOperation *)v54 setMarkAsParticipantNeedsNewInvitationToken:1];
                  uint64_t v97 = MEMORY[0x1E4F143A8];
                  uint64_t v98 = 3221225472;
                  v99 = __115__HDCloudSyncHandleMissingManateeIdentityOperation__leaveSharesForLostManateeIdentitiesInZones_container_database___block_invoke_299;
                  v100 = &unk_1E62F2950;
                  v101 = p_isa;
                  [(HDCloudSyncOperation *)v54 setOnError:&v97];
                  uint64_t v92 = MEMORY[0x1E4F143A8];
                  uint64_t v93 = 3221225472;
                  v94 = __115__HDCloudSyncHandleMissingManateeIdentityOperation__leaveSharesForLostManateeIdentitiesInZones_container_database___block_invoke_2;
                  v95 = &unk_1E62F2928;
                  v96 = p_isa;
                  [(HDCloudSyncOperation *)v54 setOnSuccess:&v92];
                  [(HDCloudSyncOperation *)v54 start];

                  id v29 = v68;
                }
              }
              else
              {
                if (v41 != 2) {
                  goto LABEL_36;
                }
                id v42 = v35;
                id v43 = v36;
                id v44 = v40;
                if ([v42 count])
                {
                  uint64_t v85 = MEMORY[0x1E4F143A8];
                  uint64_t v86 = 3221225472;
                  v87 = __115__HDCloudSyncHandleMissingManateeIdentityOperation__deleteZonesForLostManateeIdentitiesInZones_container_database___block_invoke;
                  v88 = &unk_1E630DFA8;
                  v89 = v2;
                  id v45 = v43;
                  id v90 = v45;
                  id v91 = v44;
                  v64 = objc_msgSend(v42, "hk_map:", &v85);
                  [(HDSynchronousTaskGroup *)v2->_taskGroup beginTask];
                  v46 = [HDCloudSyncModifyRecordZonesOperation alloc];
                  [p_isa configuration];
                  id v65 = v42;
                  id v47 = v44;
                  v49 = id v48 = v43;
                  v50 = v46;
                  v2 = (HDCloudSyncHandleMissingManateeIdentityOperation *)p_isa;
                  v51 = [(HDCloudSyncModifyRecordZonesOperation *)v50 initWithConfiguration:v49 container:v45 recordZonesToSave:0 recordZoneIDsToDelete:v64];

                  id v43 = v48;
                  id v44 = v47;
                  id v42 = v65;
                  unint64_t v6 = 0x1E4F1C000;
                  uint64_t v97 = MEMORY[0x1E4F143A8];
                  uint64_t v98 = 3221225472;
                  v99 = __115__HDCloudSyncHandleMissingManateeIdentityOperation__deleteZonesForLostManateeIdentitiesInZones_container_database___block_invoke_294;
                  v100 = &unk_1E62F2950;
                  v101 = p_isa;
                  [(HDCloudSyncOperation *)v51 setOnError:&v97];
                  uint64_t v92 = MEMORY[0x1E4F143A8];
                  uint64_t v93 = 3221225472;
                  v94 = __115__HDCloudSyncHandleMissingManateeIdentityOperation__deleteZonesForLostManateeIdentitiesInZones_container_database___block_invoke_2;
                  v95 = &unk_1E62F2928;
                  v96 = p_isa;
                  [(HDCloudSyncOperation *)v51 setOnSuccess:&v92];
                  [(HDCloudSyncOperation *)v51 start];

                  id v29 = v68;
                }
              }
              goto LABEL_34;
            }
            if ([v40 databaseScope] == 1)
            {
              id v42 = [MEMORY[0x1E4F28B00] currentHandler];
              [v42 handleFailureInMethod:sel__handleLostManateeIdentitiesForZones_container_ object:v2 file:@"HDCloudSyncHandleMissingManateeIdentityOperation.m" lineNumber:117 description:@"Unable to handle manatee loss in public scope."];
LABEL_34:
            }
LABEL_36:

            ++v30;
          }
          while (v71 != v30);
          uint64_t v55 = [v29 countByEnumeratingWithState:&v76 objects:v103 count:16];
          uint64_t v71 = v55;
        }
        while (v55);
LABEL_40:

        [(HDSynchronousTaskGroup *)v2->_taskGroup finishTask];
LABEL_42:

        uint64_t v57 = v67;
        id v18 = v60;
        v17 = v61;
LABEL_47:
      }
      uint64_t v63 = [obj countByEnumeratingWithState:&v72 objects:v102 count:16];
    }
    while (v63);
  }

  [(HDSynchronousTaskGroup *)v2->_taskGroup finishTask];
}

id __115__HDCloudSyncHandleMissingManateeIdentityOperation__deleteZonesForLostManateeIdentitiesInZones_container_database___block_invoke(id *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    id v15 = a1[4];
    uint64_t v16 = v4;
    v17 = [v3 zoneIdentifier];
    int v18 = 138543618;
    id v19 = v15;
    __int16 v20 = 2114;
    uint64_t v21 = v17;
    _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Zone %{public}@ is missing manatee identity and will be deleted", (uint8_t *)&v18, 0x16u);
  }
  v5 = [a1[4] configuration];
  unint64_t v6 = [v5 repository];
  v7 = [v6 profile];
  id v8 = [v7 daemon];
  objc_super v9 = [v8 analyticsSubmissionCoordinator];
  v10 = [a1[5] containerIdentifier];
  v11 = [v3 zoneIdentifier];
  v12 = [v11 zoneName];
  objc_msgSend(v9, "cloudSync_reportMissingManateeIdentityDuringFetchInContainer:zoneName:databaseScope:", v10, v12, objc_msgSend(a1[6], "databaseScope"));

  v13 = [v3 zoneIdentifier];

  return v13;
}

uint64_t __115__HDCloudSyncHandleMissingManateeIdentityOperation__deleteZonesForLostManateeIdentitiesInZones_container_database___block_invoke_294(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) finishTask];
}

uint64_t __115__HDCloudSyncHandleMissingManateeIdentityOperation__deleteZonesForLostManateeIdentitiesInZones_container_database___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) finishTask];
}

id __115__HDCloudSyncHandleMissingManateeIdentityOperation__leaveSharesForLostManateeIdentitiesInZones_container_database___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [HDCloudSyncCachedZone alloc];
  v5 = [*(id *)(a1 + 32) configuration];
  unint64_t v6 = [v5 repository];
  v7 = [*(id *)(a1 + 32) configuration];
  id v8 = [v7 accessibilityAssertion];
  id v9 = [(HDCloudSyncCachedZone *)v4 initForZoneIdentifier:v3 repository:v6 accessibilityAssertion:v8];

  id v22 = 0;
  v10 = [v9 zoneShareWithError:&v22];
  id v11 = v22;
  _HKInitializeLogging();
  v12 = (void *)*MEMORY[0x1E4F29FA8];
  BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR);
  if (v10 || !v11)
  {
    if (v13)
    {
      uint64_t v19 = *(void *)(a1 + 32);
      __int16 v20 = v12;
      uint64_t v21 = [v3 zoneIdentifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v19;
      __int16 v25 = 2114;
      v26 = v21;
      _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Zone %{public}@ is missing manatee identity; removing the share.",
        buf,
        0x16u);
    }
    v14 = [v10 recordID];
  }
  else
  {
    if (v13)
    {
      uint64_t v16 = *(void *)(a1 + 32);
      v17 = v12;
      int v18 = [v3 zoneIdentifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v16;
      __int16 v25 = 2114;
      v26 = v18;
      _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve share from zone %{public}@ with missing manatee identity.", buf, 0x16u);
    }
    v14 = 0;
  }

  return v14;
}

uint64_t __115__HDCloudSyncHandleMissingManateeIdentityOperation__leaveSharesForLostManateeIdentitiesInZones_container_database___block_invoke_299(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) finishTask];
}

uint64_t __115__HDCloudSyncHandleMissingManateeIdentityOperation__leaveSharesForLostManateeIdentitiesInZones_container_database___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) finishTask];
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
}

- (NSArray)zoneIdentifiersWithIdentityLost
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setZoneIdentifiersWithIdentityLost:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifiersWithIdentityLost, 0);

  objc_storeStrong((id *)&self->_taskGroup, 0);
}

@end