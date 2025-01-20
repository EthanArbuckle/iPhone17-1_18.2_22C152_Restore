@interface HDCloudSyncSharedSummaryRevokeParticipantOperation
- (HDCloudSyncSharedSummaryRevokeParticipantOperation)initWithConfiguration:(id)a3 codableEntry:(id)a4;
- (id)_deleteZonesOperationForParticipant:(id)a3 error:(id *)a4;
- (id)_updatedParticipantRecordInZone:(id)a3 entry:(id)a4 error:(id *)a5;
- (void)main;
@end

@implementation HDCloudSyncSharedSummaryRevokeParticipantOperation

- (HDCloudSyncSharedSummaryRevokeParticipantOperation)initWithConfiguration:(id)a3 codableEntry:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDCloudSyncSharedSummaryRevokeParticipantOperation;
  v7 = [(HDCloudSyncOperation *)&v11 initWithConfiguration:a3 cloudState:0];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    codableEntry = v7->_codableEntry;
    v7->_codableEntry = (HDCodableSummarySharingEntry *)v8;
  }
  return v7;
}

- (void)main
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 cachedCloudState];
  v5 = [(HDCloudSyncOperation *)self configuration];
  id v6 = [v5 repository];
  v7 = [v6 primaryCKContainer];
  uint64_t v8 = [v7 containerIdentifier];
  id v45 = 0;
  v9 = [v4 privateMetadataZoneForContainerID:v8 error:&v45];
  id v10 = v45;

  if (v9)
  {
    codableEntry = self->_codableEntry;
    id v44 = 0;
    v12 = [(HDCloudSyncSharedSummaryRevokeParticipantOperation *)self _updatedParticipantRecordInZone:v9 entry:codableEntry error:&v44];
    id v13 = v44;
    if (v12)
    {
      id v43 = 0;
      v14 = [(HDCloudSyncSharedSummaryRevokeParticipantOperation *)self _deleteZonesOperationForParticipant:v12 error:&v43];
      id v15 = v43;
      if (v14)
      {
        v16 = [HDCloudSyncCompoundOperation alloc];
        v17 = [(HDCloudSyncOperation *)self configuration];
        v18 = [(HDCloudSyncCompoundOperation *)v16 initWithConfiguration:v17 cloudState:0 name:@"Revoke Participant" continueOnSubOperationError:0];

        [(HDCloudSyncCompoundOperation *)v18 addOperation:v14 transitionHandler:0];
        id v39 = v15;
        v19 = [HDCloudSyncModifyRecordsOperation alloc];
        uint64_t v20 = [(HDCloudSyncOperation *)self configuration];
        v38 = [(HDCloudSyncOperation *)self configuration];
        [v38 repository];
        v21 = id v41 = v13;
        [v21 primaryCKContainer];
        v22 = v40 = v14;
        [v12 record];
        v23 = id v42 = v10;
        v46 = v23;
        [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
        v24 = v9;
        v26 = v25 = v12;
        v27 = v19;
        v28 = (void *)v20;
        v29 = [(HDCloudSyncModifyRecordsOperation *)v27 initWithConfiguration:v20 container:v22 recordsToSave:v26 recordIDsToDelete:0];

        v12 = v25;
        v9 = v24;

        id v10 = v42;
        v14 = v40;

        id v13 = v41;
        [(HDCloudSyncCompoundOperation *)v18 addOperation:v29 transitionHandler:0];
        [(HDCloudSyncOperation *)self delegateToOperation:v18];

        id v15 = v39;
      }
      else
      {
        _HKInitializeLogging();
        v33 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          v36 = v33;
          v37 = [v9 zoneIdentifier];
          *(_DWORD *)buf = 138543874;
          v48 = self;
          __int16 v49 = 2114;
          v50 = v37;
          __int16 v51 = 2114;
          id v52 = v15;
          _os_log_error_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@ Failed to find zone for participant %{public}@, %{public}@", buf, 0x20u);
        }
        [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v15];
      }
    }
    else
    {
      _HKInitializeLogging();
      v30 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        v34 = v30;
        v35 = [v9 zoneIdentifier];
        *(_DWORD *)buf = 138543874;
        v48 = self;
        __int16 v49 = 2114;
        v50 = v35;
        __int16 v51 = 2114;
        id v52 = v13;
        _os_log_error_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@ Failed to find participant record for %{public}@, %{public}@", buf, 0x20u);
      }
      if (v13)
      {
        uint64_t v31 = 0;
        id v32 = v13;
      }
      else
      {
        uint64_t v31 = 1;
        id v32 = 0;
      }
      [(HDCloudSyncOperation *)self finishWithSuccess:v31 error:v32];
    }
  }
  else
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 724, @"Private metadata zone not present.");
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v10];
  }
}

- (id)_updatedParticipantRecordInZone:(id)a3 entry:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F29128];
  id v9 = a3;
  id v10 = [v8 alloc];
  objc_super v11 = [v7 uuid];
  v12 = (void *)[v10 initWithUUIDString:v11];

  uint64_t v13 = objc_opt_class();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __98__HDCloudSyncSharedSummaryRevokeParticipantOperation__updatedParticipantRecordInZone_entry_error___block_invoke;
  v21[3] = &unk_1E62FAD08;
  id v22 = v12;
  id v14 = v12;
  id v15 = [v9 recordsForClass:v13 error:a5 filter:v21];

  if (v15)
  {
    v16 = [v15 firstObject];
    v17 = v16;
    if (v16)
    {
      if ([v16 updateWithLocalEntry:v7 error:a5]) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }
      id v19 = v18;
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

uint64_t __98__HDCloudSyncSharedSummaryRevokeParticipantOperation__updatedParticipantRecordInZone_entry_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 UUID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)_deleteZonesOperationForParticipant:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HDCloudSyncOperation *)self configuration];
  uint64_t v8 = [v7 repository];

  id v9 = (void *)MEMORY[0x1E4F1A320];
  id v10 = [v8 syncCircleIdentifier];
  objc_super v11 = [v6 UUID];

  v12 = objc_msgSend(v9, "hd_sharedSummaryZoneIDWithSyncCircleIdentifier:userIdentifier:", v10, v11);

  uint64_t v13 = [v8 primaryCKContainer];
  id v14 = [v13 containerIdentifier];
  id v15 = +[HDCloudSyncZoneIdentifier identifierForZone:v12 container:v14 scope:2];

  v16 = [(HDCloudSyncOperation *)self configuration];
  v17 = [v16 cachedCloudState];
  id v33 = 0;
  v18 = [v17 zonesByIdentifierWithError:&v33];
  id v19 = v33;

  if (v18 || !v19)
  {
    v21 = [v18 allValues];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __96__HDCloudSyncSharedSummaryRevokeParticipantOperation__deleteZonesOperationForParticipant_error___block_invoke;
    v31[3] = &unk_1E62F4338;
    id v22 = v15;
    id v32 = v22;
    v23 = objc_msgSend(v21, "hk_filter:", v31);

    if ((unint64_t)[v23 count] >= 2)
    {
      _HKInitializeLogging();
      v24 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        __int16 v37 = 2114;
        id v38 = v22;
        _os_log_fault_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_FAULT, "[summary-sharing] %{public}@ Retrieved multiple cached participant zones for identifier %{public}@. This is unexpected.", buf, 0x16u);
      }
    }
    v25 = [v23 firstObject];
    v26 = [HDCloudSyncDeleteZonesOperation alloc];
    v27 = [(HDCloudSyncOperation *)self configuration];
    uint64_t v20 = [(HDCloudSyncDeleteZonesOperation *)v26 initWithConfiguration:v27 cloudState:0];

    if (v25)
    {
      v28 = [v25 zoneIdentifier];
      v34 = v28;
      v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
      [(HDCloudSyncDeleteZonesOperation *)v20 setZonesToDelete:v29];
    }
  }
  else if (a4)
  {
    uint64_t v20 = 0;
    *a4 = v19;
  }
  else
  {
    _HKLogDroppedError();
    uint64_t v20 = 0;
  }

  return v20;
}

uint64_t __96__HDCloudSyncSharedSummaryRevokeParticipantOperation__deleteZonesOperationForParticipant_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 zoneType] == 3)
  {
    uint64_t v4 = [v3 zoneIdentifier];
    uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end