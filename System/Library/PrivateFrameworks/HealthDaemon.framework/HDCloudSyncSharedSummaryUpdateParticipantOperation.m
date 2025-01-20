@interface HDCloudSyncSharedSummaryUpdateParticipantOperation
- (BOOL)_containsOnlyCategoriesToAddWithError:(id *)a3;
- (HDCloudSyncSharedSummaryUpdateParticipantOperation)initWithConfiguration:(id)a3 codableEntry:(id)a4 authorizationIdentifiersToAdd:(id)a5 authorizationIdentifiersToDelete:(id)a6;
- (HDCodableSummarySharingEntry)entry;
- (id)_createOrUpdateAuthorizationRecordInZone:(id)a3 participantRecord:(id)a4 error:(id *)a5;
- (id)_createOrUpdateParticipantRecordInZone:(id)a3 entry:(id)a4 error:(id *)a5;
- (void)main;
- (void)setEntry:(id)a3;
@end

@implementation HDCloudSyncSharedSummaryUpdateParticipantOperation

- (HDCloudSyncSharedSummaryUpdateParticipantOperation)initWithConfiguration:(id)a3 codableEntry:(id)a4 authorizationIdentifiersToAdd:(id)a5 authorizationIdentifiersToDelete:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HDCloudSyncSharedSummaryUpdateParticipantOperation;
  v13 = [(HDCloudSyncOperation *)&v21 initWithConfiguration:a3 cloudState:0];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    entry = v13->_entry;
    v13->_entry = (HDCodableSummarySharingEntry *)v14;

    uint64_t v16 = [v11 copy];
    authorizationIdentifiersToAdd = v13->_authorizationIdentifiersToAdd;
    v13->_authorizationIdentifiersToAdd = (NSArray *)v16;

    uint64_t v18 = [v12 copy];
    authorizationIdentifiersToDelete = v13->_authorizationIdentifiersToDelete;
    v13->_authorizationIdentifiersToDelete = (NSArray *)v18;
  }
  return v13;
}

- (void)main
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 cachedCloudState];
  v5 = [(HDCloudSyncOperation *)self configuration];
  v6 = [v5 repository];
  v7 = [v6 primaryCKContainer];
  v8 = [v7 containerIdentifier];
  id v40 = 0;
  v9 = [v4 privateMetadataZoneForContainerID:v8 error:&v40];
  id v10 = v40;

  if (v9)
  {
    entry = self->_entry;
    id v39 = 0;
    id v12 = [(HDCloudSyncSharedSummaryUpdateParticipantOperation *)self _createOrUpdateParticipantRecordInZone:v9 entry:entry error:&v39];
    id v13 = v39;
    if (v12)
    {
      id v38 = 0;
      uint64_t v14 = [(HDCloudSyncSharedSummaryUpdateParticipantOperation *)self _createOrUpdateAuthorizationRecordInZone:v9 participantRecord:v12 error:&v38];
      id v15 = v38;
      if (v14)
      {
        v36 = [HDCloudSyncModifyRecordsOperation alloc];
        uint64_t v16 = [(HDCloudSyncOperation *)self configuration];
        v32 = [(HDCloudSyncOperation *)self configuration];
        v17 = [v32 repository];
        [v17 primaryCKContainer];
        uint64_t v18 = v35 = v13;
        [v12 record];
        v19 = id v34 = v15;
        v41[0] = v19;
        [v14 record];
        v33 = v12;
        objc_super v21 = v20 = v14;
        v41[1] = v21;
        v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
        uint64_t v23 = [(HDCloudSyncModifyRecordsOperation *)v36 initWithConfiguration:v16 container:v18 recordsToSave:v22 recordIDsToDelete:0];
        id v37 = v10;
        v24 = (void *)v23;

        uint64_t v14 = v20;
        id v12 = v33;

        id v15 = v34;
        id v13 = v35;

        [(HDCloudSyncOperation *)self delegateToOperation:v24];
        id v10 = v37;
      }
      else
      {
        _HKInitializeLogging();
        v26 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          v29 = v26;
          [v9 zoneIdentifier];
          v31 = v30 = v12;
          *(_DWORD *)buf = 138543874;
          v43 = self;
          __int16 v44 = 2114;
          v45 = v31;
          __int16 v46 = 2114;
          id v47 = v15;
          _os_log_error_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@ Failed to create or update authorization record for %{public}@, %{public}@", buf, 0x20u);

          id v12 = v30;
        }
        [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v15];
      }
    }
    else
    {
      _HKInitializeLogging();
      v25 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        v27 = v25;
        v28 = [v9 zoneIdentifier];
        *(_DWORD *)buf = 138543874;
        v43 = self;
        __int16 v44 = 2114;
        v45 = v28;
        __int16 v46 = 2114;
        id v47 = v13;
        _os_log_error_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@ Failed to create or update relationship record for %{public}@, %{public}@", buf, 0x20u);
      }
      [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v13];
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

- (id)_createOrUpdateParticipantRecordInZone:(id)a3 entry:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc(MEMORY[0x1E4F29128]);
  id v11 = [v9 uuid];
  id v12 = (void *)[v10 initWithUUIDString:v11];

  uint64_t v13 = objc_opt_class();
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __105__HDCloudSyncSharedSummaryUpdateParticipantOperation__createOrUpdateParticipantRecordInZone_entry_error___block_invoke;
  v27[3] = &unk_1E62FAD08;
  id v14 = v12;
  id v28 = v14;
  id v15 = [v8 recordsForClass:v13 error:a5 filter:v27];
  uint64_t v16 = v15;
  if (!v15) {
    goto LABEL_12;
  }
  uint64_t v17 = [v15 firstObject];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    _HKInitializeLogging();
    v19 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      v30 = self;
      __int16 v31 = 2113;
      id v32 = v9;
      _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Updating participant with entry %{private}@.", buf, 0x16u);
    }
    if ([v18 updateWithLocalEntry:v9 error:a5]) {
      v20 = v18;
    }
    else {
      v20 = 0;
    }
    id v21 = v20;

    goto LABEL_13;
  }
  if (![(HDCloudSyncSharedSummaryUpdateParticipantOperation *)self _containsOnlyCategoriesToAddWithError:a5])
  {
LABEL_12:
    id v21 = 0;
    goto LABEL_13;
  }
  v22 = [HDCloudSyncSharedSummaryParticipantRecord alloc];
  uint64_t v23 = [v8 zoneIdentifier];
  v24 = [v23 zoneIdentifier];
  id v21 = [(HDCloudSyncSharedSummaryParticipantRecord *)v22 initInZone:v24 codableEntry:v9];

  _HKInitializeLogging();
  v25 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v30 = self;
    _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Adding new participant.", buf, 0xCu);
  }
LABEL_13:

  return v21;
}

uint64_t __105__HDCloudSyncSharedSummaryUpdateParticipantOperation__createOrUpdateParticipantRecordInZone_entry_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 UUID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)_createOrUpdateAuthorizationRecordInZone:(id)a3 participantRecord:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v10 authorizationRecordIdentifier];
  id v12 = off_1E62EF000;
  if (!v11)
  {
    id v15 = [MEMORY[0x1E4F29128] UUID];
LABEL_18:
    id v26 = objc_alloc(v12[153]);
    v27 = [v9 zoneIdentifier];
    id v28 = [v27 zoneIdentifier];
    a5 = (id *)[v26 initInZone:v28 UUID:v15 authorizationIdentifiers:self->_authorizationIdentifiersToAdd participantRecord:v10];

    [v10 setAuthorizationRecord:a5];
    goto LABEL_19;
  }
  uint64_t v13 = (void *)v11;
  uint64_t v14 = objc_opt_class();
  id v35 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __119__HDCloudSyncSharedSummaryUpdateParticipantOperation__createOrUpdateAuthorizationRecordInZone_participantRecord_error___block_invoke;
  v33[3] = &unk_1E62FAD30;
  id v15 = v13;
  id v34 = v15;
  uint64_t v16 = [v9 recordsForClass:v14 error:&v35 filter:v33];
  id v17 = v35;
  uint64_t v18 = v17;
  if (v16)
  {
    id v32 = v17;
    v19 = [v16 firstObject];
    v20 = v19;
    if (v19)
    {
      [v19 updateAuthorizationWithIdentifiersToAdd:self->_authorizationIdentifiersToAdd identifiersToDelete:self->_authorizationIdentifiersToDelete];
      id v21 = [v20 authorizationIdentifiers];
      uint64_t v22 = [v21 count];

      if (v22)
      {
        a5 = v20;
        int v23 = 1;
        id v12 = off_1E62EF000;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"There are no remaining authorization categories. You must remove the participant from the share instead."");
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        id v12 = off_1E62EF000;
        if (v25)
        {
          if (a5) {
            *a5 = v25;
          }
          else {
            _HKLogDroppedError();
          }
        }

        a5 = 0;
        int v23 = 1;
      }
    }
    else
    {
      int v23 = 0;
    }

    uint64_t v18 = v32;
  }
  else
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      v30 = v24;
      __int16 v31 = [v9 zoneIdentifier];
      *(_DWORD *)buf = 138543874;
      id v37 = self;
      __int16 v38 = 2114;
      id v39 = v31;
      __int16 v40 = 2114;
      v41 = v18;
      _os_log_error_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@ Failed to get authorization records for %{public}@, %{public}@", buf, 0x20u);
    }
    a5 = 0;
    int v23 = 1;
  }

  if (!v23) {
    goto LABEL_18;
  }
LABEL_19:

  return a5;
}

uint64_t __119__HDCloudSyncSharedSummaryUpdateParticipantOperation__createOrUpdateAuthorizationRecordInZone_participantRecord_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 UUID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)_containsOnlyCategoriesToAddWithError:(id *)a3
{
  NSUInteger v5 = [(NSArray *)self->_authorizationIdentifiersToDelete count];
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Deleting authorization categories is not supported for new records"");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (a3) {
        *a3 = v6;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v5 == 0;
}

- (HDCodableSummarySharingEntry)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_authorizationIdentifiersToDelete, 0);

  objc_storeStrong((id *)&self->_authorizationIdentifiersToAdd, 0);
}

@end