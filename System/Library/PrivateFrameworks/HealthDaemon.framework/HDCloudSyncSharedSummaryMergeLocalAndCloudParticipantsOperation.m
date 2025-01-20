@interface HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation
- (BOOL)_mergeFoundEntry:(id)a3 withParticipant:(id)a4 error:(id *)a5;
- (HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation)initWithConfiguration:(id)a3 privateMetadataZone:(id)a4 participants:(id)a5;
- (NSArray)participantRecords;
- (NSMutableArray)updatedAuthorizationRecords;
- (NSMutableArray)updatedLocalEntries;
- (NSMutableSet)updatedParticipantRecordIDs;
- (id)_authorizationRecordForParticipant:(id)a3 error:(id *)a4;
- (id)_createSummarySharingEntryForParticipant:(id)a3 error:(id *)a4;
- (void)_mergeLocalAndCloudParticipant:(id)a3 completion:(id)a4;
- (void)main;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation

- (HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation)initWithConfiguration:(id)a3 privateMetadataZone:(id)a4 participants:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation;
  v11 = [(HDCloudSyncOperation *)&v23 initWithConfiguration:a3 cloudState:0];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    participantRecords = v11->_participantRecords;
    v11->_participantRecords = (NSArray *)v12;

    objc_storeStrong((id *)&v11->_privateMetadataZone, a4);
    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    updatedParticipantRecordIDs = v11->_updatedParticipantRecordIDs;
    v11->_updatedParticipantRecordIDs = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    updatedLocalEntries = v11->_updatedLocalEntries;
    v11->_updatedLocalEntries = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    updatedAuthorizationRecords = v11->_updatedAuthorizationRecords;
    v11->_updatedAuthorizationRecords = v18;

    v20 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = v11->_taskGroup;
    v11->_taskGroup = v20;

    [(HDSynchronousTaskGroup *)v11->_taskGroup setDelegate:v11];
  }

  return v11;
}

- (void)main
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_participantRecords;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __71__HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation_main__block_invoke;
        v9[3] = &unk_1E62F2978;
        v9[4] = self;
        [(HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation *)self _mergeLocalAndCloudParticipant:v8 completion:v9];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(HDSynchronousTaskGroup *)self->_taskGroup finishTask];
}

void __71__HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation_main__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(*(void *)(a1 + 32) + 144) finishTask];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v6 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Failed to merge local and cloud participants: %{public}@", (uint8_t *)&v8, 0x16u);
    }
    [*(id *)(*(void *)(a1 + 32) + 144) failTaskWithError:v5];
  }
}

- (void)_mergeLocalAndCloudParticipant:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HDCloudSyncOperation *)self configuration];
  uint64_t v9 = [v8 repository];
  __int16 v10 = [v9 cloudSyncShimProvider];
  id v11 = [v10 summarySharingEntryShim];

  uint64_t v12 = [v6 UUID];
  long long v13 = [(HDCloudSyncOperation *)self configuration];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __109__HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation__mergeLocalAndCloudParticipant_completion___block_invoke;
  v16[3] = &unk_1E6309918;
  id v17 = v6;
  id v18 = v7;
  v16[4] = self;
  id v14 = v6;
  id v15 = v7;
  [v11 codableEntryWithUUID:v12 configuration:v13 completion:v16];
}

void __109__HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation__mergeLocalAndCloudParticipant_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5)
  {
    if ((objc_msgSend(v6, "hk_isHealthKitErrorWithCode:", 118) & 1) == 0)
    {
      (*(void (**)(void))(a1[6] + 16))();
      goto LABEL_8;
    }
    id v11 = (void *)a1[4];
    uint64_t v12 = a1[5];
    id v15 = v7;
    id v5 = [v11 _createSummarySharingEntryForParticipant:v12 error:&v15];
    id v13 = v15;

    if (!v5)
    {
      (*(void (**)(void))(a1[6] + 16))();
      id v7 = v13;
      goto LABEL_8;
    }
    id v7 = v13;
  }
  int v8 = (void *)a1[4];
  uint64_t v9 = a1[5];
  id v14 = v7;
  [v8 _mergeFoundEntry:v5 withParticipant:v9 error:&v14];
  id v10 = v14;

  (*(void (**)(void))(a1[6] + 16))();
  id v7 = v10;
LABEL_8:
}

- (id)_createSummarySharingEntryForParticipant:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 shareSetupMetadata];

  if (v7)
  {
    int v8 = [v6 shareSetupMetadata];
  }
  else
  {
    int v8 = 0;
  }
  _HKInitializeLogging();
  uint64_t v9 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v42 = self;
    __int16 v43 = 2112;
    id v44 = v6;
    _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: No local entry found for participant: %@", buf, 0x16u);
  }
  id v10 = [(HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation *)self _authorizationRecordForParticipant:v6 error:a4];
  if (v10)
  {
    v38 = v10;
    id v11 = [v10 authorizationIdentifiers];
    uint64_t v12 = HKSharingAuthorizationsFromAuthorizationIdentifiers();

    v35 = [HDCodableSummarySharingEntry alloc];
    v40 = [v6 UUID];
    v33 = [v6 invitationUUID];
    v31 = [v6 cloudKitIdentifier];
    v30 = [v6 contactIdentifier];
    v29 = [v6 allContactIdentifiers];
    v28 = [v6 firstName];
    v22 = [v6 lastName];
    v34 = [v6 userWheelchairMode];
    uint64_t v37 = [v34 longValue];
    v32 = [v6 relationshipType];
    uint64_t v24 = [v32 longValue];
    v27 = [v6 relationshipDirection];
    v39 = self;
    uint64_t v23 = [v27 longValue];
    v26 = [v6 relationshipStatus];
    uint64_t v13 = [v26 longValue];
    v25 = [v6 notificationStatus];
    uint64_t v14 = [v25 longValue];
    id v15 = [v6 entryModificationDate];
    v16 = [v6 entryInvitationDate];
    id v17 = [v6 entryAcceptanceDate];
    id v18 = [v6 ownerParticipant];
    uint64_t v36 = -[HDCodableSummarySharingEntry initWithUUID:invitationUUID:cloudKitIdentifier:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:sharingAuthorizations:userWheelchairMode:type:direction:status:notificationStatus:dateModified:dateInvited:dateAccepted:setupMetadata:ownerParticipant:](v35, "initWithUUID:invitationUUID:cloudKitIdentifier:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:sharingAuthorizations:userWheelchairMode:type:direction:status:notificationStatus:dateModified:dateInvited:dateAccepted:setupMetadata:ownerParticipant:", v40, v33, v31, v30, v29, v28, v22, v12, v37, v24, v23, v13, v14, v15, v16,
            v17,
            v8,
            v18);

    _HKInitializeLogging();
    v19 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v42 = v39;
      __int16 v43 = 2112;
      id v44 = v6;
      _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Local save required for participant: %@", buf, 0x16u);
    }
    v20 = (void *)v36;
    [(NSMutableArray *)v39->_updatedLocalEntries addObject:v36];

    id v10 = v38;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)_mergeFoundEntry:(id)a3 withParticipant:(id)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 entryModificationDate];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;

  [v8 dateModified];
  double v14 = v13;
  int v15 = 0;
  int v16 = 0;
  switch([v9 mergeWithLocalEntry:v8 error:a5])
  {
    case 1:
      int v16 = 0;
      int v15 = 1;
      goto LABEL_6;
    case 2:
      int v15 = 0;
      goto LABEL_5;
    case 3:
      int v15 = 1;
LABEL_5:
      int v16 = 1;
      goto LABEL_6;
    case 5:
      _HKInitializeLogging();
      v30 = (os_log_t *)MEMORY[0x1E4F29FA8];
      v31 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v44 = self;
        __int16 v45 = 2112;
        id v46 = v9;
        _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Participant: %@", buf, 0x16u);
      }
      _HKInitializeLogging();
      v32 = *v30;
      if (os_log_type_enabled(*v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v44 = self;
        __int16 v45 = 2112;
        id v46 = v8;
        _os_log_error_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Entry: %@", buf, 0x16u);
      }
      _HKInitializeLogging();
      v33 = *v30;
      if (os_log_type_enabled(*v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v44 = self;
        _os_log_error_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: An error occured merging the participant and entry.", buf, 0xCu);
      }
      BOOL v19 = 1;
      goto LABEL_31;
    default:
LABEL_6:
      id v17 = [(HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation *)self _authorizationRecordForParticipant:v9 error:a5];
      id v18 = v17;
      BOOL v19 = v17 != 0;
      if (!v17) {
        goto LABEL_30;
      }
      v41 = self;
      uint64_t v20 = [v17 authorizationIdentifiers];
      v21 = [v8 sharingAuthorizations];
      uint64_t v22 = HDAuthorizationIdentifiersFromCodableSharingAuthorizations(v21);

      v42 = (void *)v20;
      uint64_t v23 = [MEMORY[0x1E4F1CAD0] setWithArray:v20];
      uint64_t v24 = (void *)v22;
      v25 = [MEMORY[0x1E4F1CAD0] setWithArray:v22];
      LOBYTE(v20) = [v23 isEqual:v25];

      if (v20) {
        goto LABEL_21;
      }
      if (v14 > v12)
      {
        _HKInitializeLogging();
        v26 = *MEMORY[0x1E4F29FA8];
        v27 = v41;
        BOOL v19 = 1;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v44 = v41;
          __int16 v45 = 2112;
          id v46 = v18;
          _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Cloud save required for authorization: %@", buf, 0x16u);
        }
        [v18 replaceAuthorizationIdentifiers:v24];
        updatedAuthorizationRecords = v41->_updatedAuthorizationRecords;
        v29 = [v18 record];
        [(NSMutableArray *)updatedAuthorizationRecords addObject:v29];

        if (!v15) {
          goto LABEL_25;
        }
LABEL_22:
        _HKInitializeLogging();
        uint64_t v36 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v44 = v27;
          __int16 v45 = 2112;
          id v46 = v9;
          _os_log_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Cloud save required for participant: %@", buf, 0x16u);
        }
        updatedParticipantRecordIDs = v27->_updatedParticipantRecordIDs;
        v38 = [v9 recordID];
        [(NSMutableSet *)updatedParticipantRecordIDs addObject:v38];

        goto LABEL_25;
      }
      v34 = (void *)[v42 mutableCopy];
      [v8 setAuthorizationCategories:v34];

      v35 = HDCodableSharingAuthorizationsFromAuthorizationIdentifiers(v42);
      [v8 setSharingAuthorizations:v35];

      int v16 = 1;
LABEL_21:
      v27 = v41;
      BOOL v19 = 1;
      if (v15) {
        goto LABEL_22;
      }
LABEL_25:
      if (v16)
      {
        _HKInitializeLogging();
        v39 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v44 = v27;
          __int16 v45 = 2112;
          id v46 = v9;
          _os_log_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Local save required for participant: %@", buf, 0x16u);
        }
        [(NSMutableArray *)v27->_updatedLocalEntries addObject:v8];
      }

LABEL_30:
LABEL_31:

      return v19;
  }
}

- (id)_authorizationRecordForParticipant:(id)a3 error:(id *)a4
{
  id v6 = a3;
  privateMetadataZone = self->_privateMetadataZone;
  if (privateMetadataZone)
  {
    uint64_t v8 = objc_opt_class();
    id v20 = 0;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __108__HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation__authorizationRecordForParticipant_error___block_invoke;
    id v18 = &unk_1E62FAD30;
    id v19 = v6;
    id v9 = [(HDCloudSyncCachedZone *)privateMetadataZone recordsForClass:v8 error:&v20 filter:&v15];
    id v10 = v20;
    double v11 = v10;
    if (v9)
    {
      double v12 = objc_msgSend(v9, "firstObject", v15, v16, v17, v18);
    }
    else
    {
      id v13 = v10;
      if (v13)
      {
        if (a4) {
          *a4 = v13;
        }
        else {
          _HKLogDroppedError();
        }
      }

      double v12 = 0;
    }
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

uint64_t __108__HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation__authorizationRecordForParticipant_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 participantRecordID];
  uint64_t v4 = [*(id *)(a1 + 32) recordID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  BOOL v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(HDCloudSyncOperation *)self finishWithSuccess:v5 error:v7];
}

- (NSArray)participantRecords
{
  return self->_participantRecords;
}

- (NSMutableSet)updatedParticipantRecordIDs
{
  return self->_updatedParticipantRecordIDs;
}

- (NSMutableArray)updatedAuthorizationRecords
{
  return self->_updatedAuthorizationRecords;
}

- (NSMutableArray)updatedLocalEntries
{
  return self->_updatedLocalEntries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskGroup, 0);
  objc_storeStrong((id *)&self->_participantRecords, 0);
  objc_storeStrong((id *)&self->_updatedLocalEntries, 0);
  objc_storeStrong((id *)&self->_updatedAuthorizationRecords, 0);
  objc_storeStrong((id *)&self->_updatedParticipantRecordIDs, 0);

  objc_storeStrong((id *)&self->_privateMetadataZone, 0);
}

@end