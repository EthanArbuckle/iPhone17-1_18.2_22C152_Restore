@interface HDCloudSyncSharedSummarySynchronizeCloudStateOperation
- (BOOL)_isActiveParticipant:(id)a3;
- (BOOL)_updateOwnerParticipantForParticipantRecord:(id)a3 zone:(id)a4 error:(id *)a5;
- (BOOL)_updateShareForAllNonOwnerParticipantsInZone:(id)a3 error:(id *)a4;
- (BOOL)_validateCloudStateForParticipantRecord:(id)a3 error:(id *)a4;
- (BOOL)_validateParticipantRecordCloudStateWithError:(id *)a3;
- (id)_currentZoneStateForParticipant:(id)a3 zone:(id)a4 error:(id *)a5;
- (id)_deleteInvalidZonesOperationWithError:(id *)a3;
- (id)_removeInvalidSharesOperationWithError:(id *)a3;
- (id)_zoneIdentifierForParticipant:(id)a3;
- (id)_zonesForParticipant:(id)a3 error:(id *)a4;
- (void)main;
@end

@implementation HDCloudSyncSharedSummarySynchronizeCloudStateOperation

- (void)main
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];
  v5 = [v4 syncAvailability];
  char v6 = [v5 shouldSyncSummarySharingPush];

  if (v6)
  {
    v7 = [(HDCloudSyncOperation *)self configuration];
    v8 = [v7 cachedCloudState];
    v9 = [(HDCloudSyncOperation *)self configuration];
    v10 = [v9 repository];
    v11 = [v10 primaryCKContainer];
    v12 = [v11 containerIdentifier];
    id v75 = 0;
    v13 = [v8 privateMetadataZoneForContainerID:v12 error:&v75];
    id v14 = v75;
    privateMetadataZone = self->_privateMetadataZone;
    self->_privateMetadataZone = v13;

    if (!self->_privateMetadataZone && v14)
    {
      [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v14];
LABEL_38:

      return;
    }
    id v69 = v14;
    participantRecords = self->_participantRecords;
    self->_participantRecords = (NSArray *)MEMORY[0x1E4F1CBF0];

    participantRecordsByUUID = self->_participantRecordsByUUID;
    self->_participantRecordsByUUID = (NSDictionary *)MEMORY[0x1E4F1CC08];

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    sharesToDelete = self->_sharesToDelete;
    self->_sharesToDelete = v19;

    v21 = self->_privateMetadataZone;
    if (v21)
    {
      id v74 = 0;
      v22 = [(HDCloudSyncCachedZone *)v21 recordsForClass:objc_opt_class() error:&v74];
      id v23 = v74;
      v24 = self->_participantRecords;
      self->_participantRecords = v22;

      if (!self->_participantRecords)
      {
        [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v23];

        goto LABEL_38;
      }
      _HKInitializeLogging();
      v25 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        v26 = self->_participantRecords;
        v27 = v25;
        uint64_t v28 = [(NSArray *)v26 count];
        *(_DWORD *)buf = 138543618;
        v77 = self;
        __int16 v78 = 2048;
        uint64_t v79 = v28;
        _os_log_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] Found %lu participant records in private metadata zone", buf, 0x16u);
      }
      v29 = [(NSArray *)self->_participantRecords hk_mapToDictionary:&__block_literal_global_96];
      v30 = self->_participantRecordsByUUID;
      self->_participantRecordsByUUID = v29;
    }
    v31 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    updatedParticipantRecordIDs = self->_updatedParticipantRecordIDs;
    self->_updatedParticipantRecordIDs = v31;

    id v73 = 0;
    BOOL v33 = [(HDCloudSyncSharedSummarySynchronizeCloudStateOperation *)self _validateParticipantRecordCloudStateWithError:&v73];
    id v34 = v73;
    v35 = v34;
    if (v33)
    {
      id v72 = v34;
      v36 = [(HDCloudSyncSharedSummarySynchronizeCloudStateOperation *)self _removeInvalidSharesOperationWithError:&v72];
      id v37 = v72;

      if (v36)
      {
        id v71 = v37;
        v38 = [(HDCloudSyncSharedSummarySynchronizeCloudStateOperation *)self _deleteInvalidZonesOperationWithError:&v71];
        id v39 = v71;

        if (v38)
        {
          id v68 = v39;
          v40 = [HDCloudSyncCompoundOperation alloc];
          v41 = [(HDCloudSyncOperation *)self configuration];
          v42 = [(HDCloudSyncCompoundOperation *)v40 initWithConfiguration:v41 cloudState:0 name:@"Synchronize Cloud Summary State" continueOnSubOperationError:0];

          v43 = [v36 deletedRecordIDs];
          uint64_t v44 = [v43 count];

          if (v44) {
            [(HDCloudSyncCompoundOperation *)v42 addOperation:v36 transitionHandler:0];
          }
          v45 = [v38 recordZoneIDsToDelete];
          uint64_t v46 = [v45 count];

          if (v46) {
            [(HDCloudSyncCompoundOperation *)v42 addOperation:v38 transitionHandler:0];
          }
          if ([(NSMutableSet *)self->_updatedParticipantRecordIDs count])
          {
            v47 = self->_participantRecords;
            v70[0] = MEMORY[0x1E4F143A8];
            v70[1] = 3221225472;
            v70[2] = __62__HDCloudSyncSharedSummarySynchronizeCloudStateOperation_main__block_invoke_283;
            v70[3] = &unk_1E6300080;
            v70[4] = self;
            v48 = [(NSArray *)v47 hk_map:v70];
            v49 = [HDCloudSyncModifyRecordsOperation alloc];
            [(HDCloudSyncOperation *)self configuration];
            v67 = v38;
            v51 = v50 = v42;
            v52 = [(HDCloudSyncOperation *)self configuration];
            v53 = [v52 repository];
            v54 = [v53 primaryCKContainer];
            v55 = [(HDCloudSyncModifyRecordsOperation *)v49 initWithConfiguration:v51 container:v54 recordsToSave:v48 recordIDsToDelete:0];

            v42 = v50;
            v38 = v67;
            [(HDCloudSyncCompoundOperation *)v42 addOperation:v55 transitionHandler:0];
          }
          if ([(NSMutableSet *)self->_sharesToDelete count])
          {
            v56 = [(NSMutableSet *)self->_sharesToDelete hk_map:&__block_literal_global_288_0];
            v57 = [v56 allObjects];

            v58 = [HDCloudSyncModifyRecordsOperation alloc];
            v59 = [(HDCloudSyncOperation *)self configuration];
            v60 = [(HDCloudSyncOperation *)self configuration];
            v61 = [v60 repository];
            v62 = [v61 primaryCKContainer];
            v63 = [(HDCloudSyncModifyRecordsOperation *)v58 initWithConfiguration:v59 container:v62 scope:3 recordsToSave:0 recordIDsToDelete:v57];

            [(HDCloudSyncCompoundOperation *)v42 addOperation:v63 transitionHandler:0];
          }
          [(HDCloudSyncOperation *)self delegateToOperation:v42];

          id v39 = v68;
          id v14 = v69;
        }
        else
        {
          _HKInitializeLogging();
          v66 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v77 = self;
            __int16 v78 = 2114;
            uint64_t v79 = (uint64_t)v39;
            _os_log_error_impl(&dword_1BCB7D000, v66, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Failed to compute invalid zones for removal: %{public}@", buf, 0x16u);
          }
          [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v39];
        }

        id v37 = v39;
      }
      else
      {
        _HKInitializeLogging();
        v65 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v77 = self;
          __int16 v78 = 2114;
          uint64_t v79 = (uint64_t)v37;
          _os_log_error_impl(&dword_1BCB7D000, v65, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Failed to compute invalid shares for removal: %{public}@", buf, 0x16u);
        }
        [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v37];
      }

      v35 = v37;
    }
    else
    {
      _HKInitializeLogging();
      v64 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v77 = self;
        __int16 v78 = 2114;
        uint64_t v79 = (uint64_t)v35;
        _os_log_error_impl(&dword_1BCB7D000, v64, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Failed to validate participant records: %{public}@", buf, 0x16u);
      }
      [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v35];
    }

    goto LABEL_38;
  }
  _HKInitializeLogging();
  v16 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v77 = self;
    _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping operation because platform/profile does not support summary sharing", buf, 0xCu);
  }
  [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
}

void __62__HDCloudSyncSharedSummarySynchronizeCloudStateOperation_main__block_invoke(uint64_t a1, void *a2, void (**a3)(void, void, void))
{
  v5 = a3;
  id v6 = a2;
  id v7 = [v6 UUID];
  ((void (**)(void, id, id))a3)[2](v5, v7, v6);
}

id __62__HDCloudSyncSharedSummarySynchronizeCloudStateOperation_main__block_invoke_283(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(*(void *)(a1 + 32) + 128);
  v5 = [v3 recordID];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    id v6 = [v3 record];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __62__HDCloudSyncSharedSummarySynchronizeCloudStateOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 recordID];
}

- (BOOL)_validateCloudStateForParticipantRecord:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 relationshipType];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [v6 relationshipType];
    uint64_t v10 = [v9 longValue];

    if (!v10)
    {
      v12 = [v6 relationshipStatus];
      uint64_t v13 = [v12 longValue];

      id v14 = [(HDCloudSyncSharedSummarySynchronizeCloudStateOperation *)self _zonesForParticipant:v6 error:a4];
      v15 = v14;
      if (!v14)
      {
        BOOL v11 = 0;
LABEL_20:

        goto LABEL_21;
      }
      v16 = [v14 firstObject];
      v17 = [(HDCloudSyncSharedSummarySynchronizeCloudStateOperation *)self _currentZoneStateForParticipant:v6 zone:v16 error:a4];
      v18 = v17;
      if (!v17) {
        goto LABEL_10;
      }
      unint64_t v19 = [v17 longValue];
      v20 = [v6 relationshipStatus];

      if (v20)
      {
        if ((unint64_t)(v13 - 2) < 3)
        {
          v21 = [v6 relationshipDirection];
          if ([v21 longValue] == 1)
          {
            BOOL v22 = [(HDCloudSyncSharedSummarySynchronizeCloudStateOperation *)self _updateShareForAllNonOwnerParticipantsInZone:v16 error:a4];

            if (!v22)
            {
LABEL_10:
              BOOL v11 = 0;
LABEL_19:

              goto LABEL_20;
            }
LABEL_18:
            BOOL v11 = 1;
            goto LABEL_19;
          }
LABEL_17:

          goto LABEL_18;
        }
        if (v13 == 1)
        {
          if (v19 >= 2)
          {
            _HKInitializeLogging();
            v31 = (void *)*MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
            {
              v32 = v31;
              BOOL v33 = HKStringForSharingStatus();
              id v34 = HKStringForSharingStatus();
              *(_DWORD *)uint64_t v46 = 138544130;
              *(void *)&v46[4] = self;
              *(_WORD *)&v46[12] = 2112;
              *(void *)&v46[14] = v6;
              *(_WORD *)&v46[22] = 2114;
              v47 = v33;
              LOWORD(v48) = 2114;
              *(void *)((char *)&v48 + 2) = v34;
              _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] %@: Updating status from %{public}@ to %{public}@ due to zone state.", v46, 0x2Au);
            }
            [v6 setRelationshipStatus:v18];
          }
          v35 = [v6 relationshipDirection];
          if ([v35 longValue] == 1)
          {
            v36 = [v6 ownerParticipant];

            if (!v36)
            {
              if (![(HDCloudSyncSharedSummarySynchronizeCloudStateOperation *)self _updateOwnerParticipantForParticipantRecord:v6 zone:v16 error:a4])goto LABEL_10; {
              goto LABEL_16;
              }
            }
          }
          else
          {
          }
          if (v19 < 2) {
            goto LABEL_18;
          }
          goto LABEL_16;
        }
        if (v13) {
          goto LABEL_18;
        }
        uint64_t v28 = [v6 relationshipDirection];
        uint64_t v29 = [v28 longValue];

        if (!v19) {
          goto LABEL_18;
        }
        if (v29)
        {
          if (v19 == 4) {
            goto LABEL_18;
          }
          _HKInitializeLogging();
          v30 = (void *)*MEMORY[0x1E4F29FA8];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_15;
          }
        }
        else
        {
          double Current = CFAbsoluteTimeGetCurrent();
          v38 = [v6 entryInvitationDate];
          [v38 timeIntervalSinceReferenceDate];
          double v40 = Current - v39;

          _HKInitializeLogging();
          v30 = (void *)*MEMORY[0x1E4F29FA8];
          BOOL v41 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT);
          if (v40 < 3600.0 && v19 != 1)
          {
            if (v41)
            {
              v42 = v30;
              v43 = HKStringForSharingStatus();
              *(_DWORD *)uint64_t v46 = 138543874;
              *(void *)&v46[4] = self;
              *(_WORD *)&v46[12] = 2112;
              *(void *)&v46[14] = v6;
              *(_WORD *)&v46[22] = 2114;
              v47 = v43;
              _os_log_impl(&dword_1BCB7D000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] %@: Ignoring new pending participant despite mismatch with zone status %{public}@.", v46, 0x20u);
            }
            goto LABEL_18;
          }
          if (!v41) {
            goto LABEL_15;
          }
        }
        v24 = v30;
        uint64_t v44 = HKStringForSharingStatus();
        v45 = HKStringForSharingStatus();
        *(_DWORD *)uint64_t v46 = 138544130;
        *(void *)&v46[4] = self;
        *(_WORD *)&v46[12] = 2112;
        *(void *)&v46[14] = v6;
        *(_WORD *)&v46[22] = 2114;
        v47 = v44;
        LOWORD(v48) = 2114;
        *(void *)((char *)&v48 + 2) = v45;
        _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] %@: Updating status from %{public}@ to %{public}@ due to zone state.", v46, 0x2Au);
      }
      else
      {
        _HKInitializeLogging();
        id v23 = (void *)*MEMORY[0x1E4F29FA8];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
LABEL_15:
          objc_msgSend(v6, "setRelationshipStatus:", v18, *(_OWORD *)v46, *(void *)&v46[16], v47, v48);
LABEL_16:
          updatedParticipantRecordIDs = self->_updatedParticipantRecordIDs;
          v21 = [v6 recordID];
          [(NSMutableSet *)updatedParticipantRecordIDs addObject:v21];
          goto LABEL_17;
        }
        v24 = v23;
        v25 = HKStringForSharingStatus();
        *(_DWORD *)uint64_t v46 = 138543874;
        *(void *)&v46[4] = self;
        *(_WORD *)&v46[12] = 2112;
        *(void *)&v46[14] = v6;
        *(_WORD *)&v46[22] = 2114;
        v47 = v25;
        _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] %@: Filling out initial status from zone state: %{public}@.", v46, 0x20u);
      }
      goto LABEL_15;
    }
  }
  BOOL v11 = 1;
LABEL_21:

  return v11;
}

- (id)_zoneIdentifierForParticipant:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 relationshipDirection];
  if (v5
    && (id v6 = (void *)v5,
        [v4 relationshipDirection],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 longValue],
        v7,
        v6,
        v8))
  {
    uint64_t v9 = 3;
  }
  else
  {
    uint64_t v9 = 2;
  }
  uint64_t v21 = v9;
  uint64_t v10 = (void *)MEMORY[0x1E4F1A320];
  BOOL v11 = [(HDCloudSyncOperation *)self configuration];
  v12 = [v11 syncContainerPrefix];
  uint64_t v13 = [v4 UUID];
  id v14 = objc_msgSend(v10, "hd_sharedSummaryZoneIDWithSyncCircleIdentifier:userIdentifier:", v12, v13);
  v15 = [(HDCloudSyncOperation *)self configuration];
  v16 = [v15 repository];
  v17 = [v16 primaryCKContainer];
  v18 = [v17 containerIdentifier];
  unint64_t v19 = +[HDCloudSyncZoneIdentifier identifierForZone:v14 container:v18 scope:v21];

  return v19;
}

- (BOOL)_validateParticipantRecordCloudStateWithError:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_participantRecords;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!-[HDCloudSyncSharedSummarySynchronizeCloudStateOperation _validateCloudStateForParticipantRecord:error:](self, "_validateCloudStateForParticipantRecord:error:", *(void *)(*((void *)&v12 + 1) + 8 * i), a3, (void)v12))
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (id)_zonesForParticipant:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v23 = [(HDCloudSyncSharedSummarySynchronizeCloudStateOperation *)self _zoneIdentifierForParticipant:v6];
  uint64_t v7 = [v6 relationshipDirection];
  if (v7
    && (uint64_t v8 = (void *)v7,
        [v6 relationshipDirection],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 longValue],
        v9,
        v8,
        v10))
  {
    uint64_t v11 = 3;
  }
  else
  {
    uint64_t v11 = 2;
  }
  long long v12 = [(HDCloudSyncOperation *)self configuration];
  long long v13 = [v12 cachedCloudState];
  long long v14 = [(HDCloudSyncOperation *)self configuration];
  long long v15 = [v14 repository];
  v16 = [v15 primaryCKContainer];
  uint64_t v17 = [v16 containerIdentifier];
  v18 = [v13 zoneIdentifiersForContainerIdentifier:v17 databaseScope:v11 error:a4];

  if (v18)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __85__HDCloudSyncSharedSummarySynchronizeCloudStateOperation__zonesForParticipant_error___block_invoke;
    v24[3] = &unk_1E63000C8;
    unint64_t v19 = v23;
    id v25 = v23;
    v26 = self;
    v20 = objc_msgSend(v18, "hk_map:", v24);
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v21 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = self;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to load zones when looking for state for participant %@", buf, 0x16u);
    }
    v20 = 0;
    unint64_t v19 = v23;
  }

  return v20;
}

id __85__HDCloudSyncSharedSummarySynchronizeCloudStateOperation__zonesForParticipant_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEquivalentIgnoringOwnerToZone:*(void *)(a1 + 32)])
  {
    id v4 = [HDCloudSyncCachedZone alloc];
    uint64_t v5 = [*(id *)(a1 + 40) configuration];
    id v6 = [v5 repository];
    uint64_t v7 = [*(id *)(a1 + 40) configuration];
    uint64_t v8 = [v7 accessibilityAssertion];
    id v9 = [(HDCloudSyncCachedZone *)v4 initForZoneIdentifier:v3 repository:v6 accessibilityAssertion:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_currentZoneStateForParticipant:(id)a3 zone:(id)a4 error:(id *)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = v8;
  if (a4)
  {
    id v38 = 0;
    uint64_t v10 = [a4 zoneShareWithError:&v38];
    id v11 = v38;
    long long v12 = v11;
    if (v10)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v13 = objc_msgSend(v10, "participants", 0);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v35;
        uint64_t v17 = &unk_1F17ECBE8;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v35 != v16) {
              objc_enumerationMutation(v13);
            }
            unint64_t v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            if ([v19 role] != 1)
            {
              if ([v19 acceptanceStatus] == 2) {
                goto LABEL_23;
              }
              if ([v19 acceptanceStatus] == 1)
              {
                uint64_t v17 = &unk_1F17ECC00;
LABEL_23:

                goto LABEL_35;
              }
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      v20 = [v9 relationshipStatus];
      if ([v20 longValue] == 1)
      {
      }
      else
      {
        v27 = [v9 relationshipStatus];
        uint64_t v28 = [v27 longValue];

        if (v28)
        {
LABEL_29:
          uint64_t v17 = &unk_1F17ECC18;
LABEL_35:

          goto LABEL_36;
        }
      }
      _HKInitializeLogging();
      __int16 v29 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        BOOL v41 = self;
        __int16 v42 = 2112;
        v43 = v9;
        _os_log_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Failed to find participant on share for %@: Marking as declined.", buf, 0x16u);
      }
      goto LABEL_29;
    }
    if (v11)
    {
      if (a5)
      {
        uint64_t v17 = 0;
        *a5 = v11;
      }
      else
      {
        _HKLogDroppedError();
        uint64_t v17 = 0;
      }
      goto LABEL_35;
    }
    v26 = [v9 relationshipStatus];
    if ([v26 longValue] == 1)
    {
    }
    else
    {
      id v30 = [v9 relationshipStatus];
      uint64_t v31 = [v30 longValue];

      if (v31)
      {
LABEL_34:
        uint64_t v17 = &unk_1F17ECBD0;
        goto LABEL_35;
      }
    }
    _HKInitializeLogging();
    v32 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      BOOL v41 = self;
      __int16 v42 = 2112;
      v43 = v9;
      _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Failed to find share for %@: Marking as revoked.", buf, 0x16u);
    }
    goto LABEL_34;
  }
  uint64_t v21 = [v8 relationshipStatus];
  uint64_t v22 = [v21 longValue];

  if (v22 == 1)
  {
    _HKInitializeLogging();
    id v23 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      id v25 = [(HDCloudSyncSharedSummarySynchronizeCloudStateOperation *)self _zoneIdentifierForParticipant:v9];
      *(_DWORD *)buf = 138543874;
      BOOL v41 = self;
      __int16 v42 = 2114;
      v43 = v25;
      __int16 v44 = 2112;
      v45 = v9;
      _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Failed to find zone %{public}@ for %@: Marking as revoked", buf, 0x20u);
    }
  }
  uint64_t v17 = &unk_1F17ECBD0;
LABEL_36:

  return v17;
}

- (BOOL)_updateShareForAllNonOwnerParticipantsInZone:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    id v31 = 0;
    id v8 = [v6 zoneShareWithError:&v31];
    id v9 = v31;
    if (v8)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v10 = [v8 participants];
      id v11 = (void *)[v10 copy];

      uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        id v24 = v9;
        id v25 = v8;
        v26 = v7;
        char v14 = 0;
        uint64_t v15 = (os_log_t *)MEMORY[0x1E4F29FA8];
        uint64_t v16 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v11);
            }
            v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if ([v18 role] != 1)
            {
              _HKInitializeLogging();
              unint64_t v19 = *v15;
              if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                long long v34 = self;
                _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] Participant on the share is not an owner.", buf, 0xCu);
              }
              if ([v18 acceptanceStatus] == 1 || objc_msgSend(v18, "acceptanceStatus") == 2)
              {
                _HKInitializeLogging();
                v20 = *v15;
                if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  long long v34 = self;
                  __int16 v35 = 2112;
                  long long v36 = v18;
                  _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Deleting share for participant %@.", buf, 0x16u);
                }
                char v14 = 1;
              }
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v13);

        id v9 = v24;
        if (v14)
        {
          id v8 = v25;
          [(NSMutableSet *)self->_sharesToDelete addObject:v25];
          BOOL v21 = 1;
        }
        else
        {
          BOOL v21 = 1;
          id v8 = v25;
        }
        uint64_t v7 = v26;
        goto LABEL_31;
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v22 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        long long v34 = self;
        __int16 v35 = 2112;
        long long v36 = v7;
        __int16 v37 = 2114;
        id v38 = v9;
        _os_log_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Failed to find share for zone %@ with error %{public}@.", buf, 0x20u);
      }
      if (v9)
      {
        if (a4)
        {
          BOOL v21 = 0;
          *a4 = v9;
        }
        else
        {
          _HKLogDroppedError();
          BOOL v21 = 0;
        }
        goto LABEL_31;
      }
    }
    BOOL v21 = 1;
LABEL_31:

    goto LABEL_32;
  }
  BOOL v21 = 1;
LABEL_32:

  return v21;
}

- (BOOL)_updateOwnerParticipantForParticipantRecord:(id)a3 zone:(id)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a4)
  {
    id v19 = 0;
    id v9 = [a4 zoneShareWithError:&v19];
    id v10 = v19;
    id v11 = v10;
    if (v9)
    {
      uint64_t v12 = [v9 participants];
      uint64_t v13 = objc_msgSend(v12, "hk_firstObjectPassingTest:", &__block_literal_global_302_3);

      if (v13)
      {
        [v8 setOwnerParticipant:v13];
      }
      else
      {
        _HKInitializeLogging();
        uint64_t v16 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          BOOL v21 = self;
          __int16 v22 = 2112;
          id v23 = v8;
          _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Share contains no owner attempting to update owner participant for %@.", buf, 0x16u);
        }
      }
    }
    else
    {
      if (v10)
      {
        if (a5)
        {
          BOOL v15 = 0;
          *a5 = v10;
        }
        else
        {
          _HKLogDroppedError();
          BOOL v15 = 0;
        }
        goto LABEL_15;
      }
      _HKInitializeLogging();
      v18 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        BOOL v21 = self;
        __int16 v22 = 2112;
        id v23 = v8;
        _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: No share for participant %@ when attempting to update owner participant.", buf, 0x16u);
      }
    }
    BOOL v15 = 1;
LABEL_15:

    goto LABEL_16;
  }
  _HKInitializeLogging();
  char v14 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    BOOL v21 = self;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: No zone for participant %@ when attempting to update owner participant.", buf, 0x16u);
  }
  BOOL v15 = 1;
LABEL_16:

  return v15;
}

BOOL __113__HDCloudSyncSharedSummarySynchronizeCloudStateOperation__updateOwnerParticipantForParticipantRecord_zone_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 role] == 1;
}

- (id)_removeInvalidSharesOperationWithError:(id *)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(HDCloudSyncOperation *)self configuration];
  uint64_t v7 = [v6 cachedCloudState];
  id v8 = [(HDCloudSyncOperation *)self configuration];
  id v9 = [v8 repository];
  id v10 = [v9 primaryCKContainer];
  id v11 = [v10 containerIdentifier];
  uint64_t v12 = [v7 zoneIdentifiersForContainerIdentifier:v11 databaseScope:3 error:a3];

  if (v12)
  {
    BOOL v41 = v5;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v39 = v12;
    id obj = v12;
    uint64_t v13 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v46;
      uint64_t v40 = *MEMORY[0x1E4F19D48];
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v46 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          v18 = objc_msgSend(v17, "zoneIdentifier", v39);
          id v43 = 0;
          id v44 = 0;
          int v19 = objc_msgSend(v18, "hd_isSharedSummaryZoneIDForUserIdentifier:syncCircleIdentifier:", &v44, &v43);
          id v20 = v44;
          id v21 = v43;

          if (v19)
          {
            __int16 v22 = [(HDCloudSyncOperation *)self configuration];
            id v23 = [v22 syncContainerPrefix];
            int v24 = [v21 isEqualToString:v23];

            if (v24)
            {
              id v25 = [(NSDictionary *)self->_participantRecordsByUUID objectForKeyedSubscript:v20];
              v26 = [v25 relationshipDirection];
              uint64_t v27 = [v26 longValue];

              if (v27 == 1
                && ![(HDCloudSyncSharedSummarySynchronizeCloudStateOperation *)self _isActiveParticipant:v25])
              {
                id v28 = objc_alloc(MEMORY[0x1E4F1A2F8]);
                long long v29 = [v17 zoneIdentifier];
                long long v30 = (void *)[v28 initWithRecordName:v40 zoneID:v29];

                [v41 addObject:v30];
              }
            }
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v14);
    }

    id v31 = [HDCloudSyncModifyRecordsOperation alloc];
    v32 = [(HDCloudSyncOperation *)self configuration];
    BOOL v33 = [(HDCloudSyncOperation *)self configuration];
    long long v34 = [v33 repository];
    __int16 v35 = [v34 primaryCKContainer];
    long long v36 = v31;
    id v5 = v41;
    __int16 v37 = [(HDCloudSyncModifyRecordsOperation *)v36 initWithConfiguration:v32 container:v35 scope:3 recordsToSave:0 recordIDsToDelete:v41];

    uint64_t v12 = v39;
  }
  else
  {
    __int16 v37 = 0;
  }

  return v37;
}

- (id)_deleteInvalidZonesOperationWithError:(id *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(HDCloudSyncOperation *)self configuration];
  uint64_t v7 = [v6 cachedCloudState];
  id v8 = [(HDCloudSyncOperation *)self configuration];
  id v9 = [v8 repository];
  id v10 = [v9 primaryCKContainer];
  id v11 = [v10 containerIdentifier];
  uint64_t v12 = [v7 zoneIdentifiersForContainerIdentifier:v11 databaseScope:2 error:a3];

  if (v12)
  {
    long long v36 = v12;
    __int16 v37 = v5;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v12;
    uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v42 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          v18 = [v17 zoneIdentifier];
          id v39 = 0;
          id v40 = 0;
          int v19 = objc_msgSend(v18, "hd_isSharedSummaryZoneIDForUserIdentifier:syncCircleIdentifier:", &v40, &v39);
          id v20 = v40;
          id v21 = v39;

          if (v19)
          {
            __int16 v22 = [(HDCloudSyncOperation *)self configuration];
            id v23 = [v22 syncContainerPrefix];
            int v24 = [v21 isEqualToString:v23];

            if (v24)
            {
              id v25 = [(NSDictionary *)self->_participantRecordsByUUID objectForKeyedSubscript:v20];
              v26 = [v25 relationshipDirection];
              uint64_t v27 = [v26 longValue];

              if (!v27
                && ![(HDCloudSyncSharedSummarySynchronizeCloudStateOperation *)self _isActiveParticipant:v25])
              {
                id v28 = [v17 zoneIdentifier];
                [v37 addObject:v28];
              }
            }
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v14);
    }

    long long v29 = [HDCloudSyncModifyRecordZonesOperation alloc];
    long long v30 = [(HDCloudSyncOperation *)self configuration];
    id v31 = [(HDCloudSyncOperation *)self configuration];
    v32 = [v31 repository];
    BOOL v33 = [v32 primaryCKContainer];
    id v5 = v37;
    long long v34 = [(HDCloudSyncModifyRecordZonesOperation *)v29 initWithConfiguration:v30 container:v33 scope:2 recordZonesToSave:0 recordZoneIDsToDelete:v37];

    uint64_t v12 = v36;
  }
  else
  {
    long long v34 = 0;
  }

  return v34;
}

- (BOOL)_isActiveParticipant:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 relationshipStatus];
    if ([v5 longValue])
    {
      id v6 = [v4 relationshipStatus];
      BOOL v7 = [v6 longValue] == 1;
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharesToDelete, 0);
  objc_storeStrong((id *)&self->_updatedParticipantRecordIDs, 0);
  objc_storeStrong((id *)&self->_participantRecordsByUUID, 0);
  objc_storeStrong((id *)&self->_participantRecords, 0);

  objc_storeStrong((id *)&self->_privateMetadataZone, 0);
}

@end