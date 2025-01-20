@interface HDCloudSyncShareToParticipantOperation
- (HDCloudSyncShareSetupMetadata)result;
- (HDCloudSyncShareToParticipantOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncShareToParticipantOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 identityLookupInfo:(id)a5 requireExistingRelationship:(BOOL)a6 requireZoneDeviceMode:(id)a7;
- (void)main;
@end

@implementation HDCloudSyncShareToParticipantOperation

- (HDCloudSyncShareToParticipantOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncShareToParticipantOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 identityLookupInfo:(id)a5 requireExistingRelationship:(BOOL)a6 requireZoneDeviceMode:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HDCloudSyncShareToParticipantOperation;
  v14 = [(HDCloudSyncOperation *)&v21 initWithConfiguration:a3 cloudState:a4];
  v15 = v14;
  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    uint64_t v16 = [v12 copy];
    identityLookupInfo = v15->_identityLookupInfo;
    v15->_identityLookupInfo = (CKUserIdentityLookupInfo *)v16;

    v15->_requireExistingRelationship = a6;
    uint64_t v18 = [v13 copy];
    expectedDeviceMode = v15->_expectedDeviceMode;
    v15->_expectedDeviceMode = (NSNumber *)v18;
  }
  return v15;
}

- (void)main
{
  v49[1] = *MEMORY[0x1E4F143B8];
  v3 = [HDCloudSyncCompoundOperation alloc];
  v4 = [(HDCloudSyncOperation *)self configuration];
  v5 = [(HDCloudSyncCompoundOperation *)v3 initWithConfiguration:v4 cloudState:0 name:@"Add Sharing Participant" continueOnSubOperationError:0];

  uint64_t v6 = [HDCloudSyncLookupParticipantOperation alloc];
  v7 = [(HDCloudSyncOperation *)self configuration];
  v8 = [(HDCloudSyncLookupParticipantOperation *)v6 initWithConfiguration:v7 cloudState:0 identityLookupInfo:self->_identityLookupInfo];

  [(HDCloudSyncCompoundOperation *)v5 addOperation:v8 transitionHandler:0];
  v9 = [HDCloudSyncRemoveInvalidShareParticipantsOperation alloc];
  v10 = [(HDCloudSyncOperation *)self configuration];
  v11 = [(HDCloudSyncRemoveInvalidShareParticipantsOperation *)v9 initWithConfiguration:v10 cloudState:0];

  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __46__HDCloudSyncShareToParticipantOperation_main__block_invoke;
  v46[3] = &unk_1E62F4820;
  id v12 = v8;
  v47 = v12;
  v48 = v11;
  v38 = v11;
  [(HDCloudSyncCompoundOperation *)v5 addOperation:v38 transitionHandler:v46];
  id v13 = objc_alloc(MEMORY[0x1E4F1A310]);
  v14 = (void *)MEMORY[0x1E4F1A320];
  v15 = [(HDCloudSyncOperation *)self configuration];
  uint64_t v16 = [v15 repository];
  v17 = [v16 syncCircleIdentifier];
  uint64_t v18 = objc_msgSend(v14, "hd_unifiedSyncZoneIDForSyncCircleIdentifier:", v17);
  v19 = (void *)[v13 initWithZoneID:v18];

  v20 = [HDCloudSyncCreateZonesOperation alloc];
  objc_super v21 = [(HDCloudSyncOperation *)self configuration];
  v49[0] = v19;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
  v23 = [(HDCloudSyncOperation *)self configuration];
  v24 = [v23 repository];
  v25 = [v24 primaryCKContainer];
  v26 = [(HDCloudSyncCreateZonesOperation *)v20 initWithConfiguration:v21 cloudState:0 zones:v22 container:v25];

  [(HDCloudSyncCompoundOperation *)v5 addOperation:v26 transitionHandler:0];
  v27 = [HDCloudSyncAddSharingParticipantOperation alloc];
  v28 = [(HDCloudSyncOperation *)self configuration];
  v29 = [(HDCloudSyncAddSharingParticipantOperation *)v27 initWithConfiguration:v28 cloudState:0];

  [(HDCloudSyncAddSharingParticipantOperation *)v29 setRequireExistingRelationship:self->_requireExistingRelationship];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __46__HDCloudSyncShareToParticipantOperation_main__block_invoke_2;
  v42[3] = &unk_1E6305FF0;
  v30 = v29;
  v43 = v30;
  v44 = v12;
  v45 = self;
  v31 = v12;
  [(HDCloudSyncCompoundOperation *)v5 addOperation:v30 transitionHandler:v42];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __46__HDCloudSyncShareToParticipantOperation_main__block_invoke_292;
  v40[3] = &unk_1E62F46F8;
  v40[4] = self;
  v41 = v30;
  v32 = v30;
  [(HDCloudSyncOperation *)v5 setOnSuccess:v40];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __46__HDCloudSyncShareToParticipantOperation_main__block_invoke_2_298;
  v39[3] = &unk_1E62F2950;
  v39[4] = self;
  [(HDCloudSyncOperation *)v5 setOnError:v39];
  [(HDCloudSyncCompoundOperation *)v5 start];
  v33 = [(HDCloudSyncOperation *)v5 progress];
  uint64_t v34 = [v33 totalUnitCount];

  v35 = [(HDCloudSyncOperation *)self progress];
  objc_msgSend(v35, "setTotalUnitCount:", objc_msgSend(v35, "totalUnitCount") + v34);

  v36 = [(HDCloudSyncOperation *)self progress];
  v37 = [(HDCloudSyncOperation *)v5 progress];
  [v36 addChild:v37 withPendingUnitCount:v34];
}

void __46__HDCloudSyncShareToParticipantOperation_main__block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) participant];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) participant];
    v7[0] = v3;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [*(id *)(a1 + 40) setParticipantsToCheck:v4];
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
    [v5 setParticipantsToCheck:v6];
  }
}

void __46__HDCloudSyncShareToParticipantOperation_main__block_invoke_2(id *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1[5] participant];
  [a1[4] setParticipant:v2];

  v3 = [a1[6] configuration];
  v4 = [v3 cachedCloudState];
  id v10 = 0;
  v5 = [v4 zonesByIdentifierWithError:&v10];
  id v6 = v10;

  if (v5)
  {
    v7 = [v5 allKeys];
    [a1[4] setZoneIdentifiers:v7];
  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      id v9 = a1[6];
      *(_DWORD *)buf = 138543618;
      id v12 = v9;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached zones, %{public}@", buf, 0x16u);
    }
  }
}

void __46__HDCloudSyncShareToParticipantOperation_main__block_invoke_292(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) configuration];
  v3 = [v2 repository];

  v4 = [*(id *)(a1 + 32) configuration];
  v5 = [v4 cachedCloudState];
  id v6 = [v3 primaryCKContainer];
  v7 = [v6 containerIdentifier];
  id v38 = 0;
  v8 = [v5 unifiedSyncZoneForContainerID:v7 error:&v38];
  id v9 = v38;

  if (v8) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  v11 = (os_log_t *)MEMORY[0x1E4F29FA8];
  if (!v10)
  {
    _HKInitializeLogging();
    id v12 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v25;
      __int16 v41 = 2114;
      id v42 = v9;
      _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached unified zone, %{public}@", buf, 0x16u);
    }
  }
  id v37 = 0;
  __int16 v13 = [v8 recordsForClass:objc_opt_class() error:&v37];
  id v14 = v37;
  uint64_t v15 = v14;
  if (!v13)
  {
    if (v14)
    {
      _HKInitializeLogging();
      os_log_t v16 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = *(void *)(a1 + 32);
        v27 = v16;
        v28 = [v8 zoneIdentifier];
        *(_DWORD *)buf = 138543874;
        uint64_t v40 = v26;
        __int16 v41 = 2114;
        id v42 = v28;
        __int16 v43 = 2114;
        v44 = v15;
        _os_log_error_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get registry records for %{public}@, %{public}@", buf, 0x20u);
      }
    }
  }
  if ((unint64_t)[v13 count] >= 2)
  {
    _HKInitializeLogging();
    os_log_t v17 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_FAULT))
    {
      uint64_t v29 = *(void *)(a1 + 32);
      v30 = v17;
      v31 = [v8 zoneIdentifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v29;
      __int16 v41 = 2114;
      id v42 = v31;
      _os_log_fault_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_FAULT, "%{public}@ Retrieved multiple registry records for %{public}@. This is unexpected.", buf, 0x16u);
    }
  }
  uint64_t v18 = [v13 firstObject];
  v19 = [v18 sharedProfileIdentifier];
  if (!v19)
  {
    _HKInitializeLogging();
    v20 = *v11;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = v32;
      _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieved shared profile identifier for registry record when adding a sharing participant.", buf, 0xCu);
    }
  }
  objc_super v21 = [v3 primaryCKContainer];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __46__HDCloudSyncShareToParticipantOperation_main__block_invoke_294;
  v33[3] = &unk_1E6306018;
  v22 = *(void **)(a1 + 40);
  v33[4] = *(void *)(a1 + 32);
  id v34 = v3;
  id v35 = v19;
  id v36 = v22;
  id v23 = v19;
  id v24 = v3;
  [v21 fetchFullNameAndPrimaryEmailOnAccountWithCompletionHandler:v33];
}

void __46__HDCloudSyncShareToParticipantOperation_main__block_invoke_294(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v19 = a3;
  if (a4)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = 0;
    uint64_t v8 = a4;
  }
  else
  {
    id v9 = [HDCloudSyncShareSetupMetadata alloc];
    BOOL v10 = [*(id *)(a1 + 40) syncCircleIdentifier];
    v11 = *(void **)(a1 + 48);
    id v12 = v11;
    if (!v11)
    {
      id v12 = [*(id *)(a1 + 40) profileIdentifier];
    }
    __int16 v13 = [*(id *)(a1 + 56) shareURLs];
    id v14 = [*(id *)(a1 + 56) participant];
    uint64_t v15 = [*(id *)(a1 + 56) invitationTokensByShareURL];
    uint64_t v16 = [(HDCloudSyncShareSetupMetadata *)v9 initWithSyncCircleIdentifier:v10 profileIdentifier:v12 shareURLs:v13 ownerCloudKitEmailAddress:v19 shareParticipant:v14 invitationTokensByShareURL:v15];
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void **)(v17 + 168);
    *(void *)(v17 + 168) = v16;

    if (!v11) {
    id v6 = *(void **)(a1 + 32);
    }
    uint64_t v7 = 1;
    uint64_t v8 = 0;
  }
  [v6 finishWithSuccess:v7 error:v8];
}

uint64_t __46__HDCloudSyncShareToParticipantOperation_main__block_invoke_2_298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithSuccess:0 error:a3];
}

- (HDCloudSyncShareSetupMetadata)result
{
  return (HDCloudSyncShareSetupMetadata *)objc_getProperty(self, a2, 168, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_addedParticipants, 0);
  objc_storeStrong((id *)&self->_participantPushZone, 0);
  objc_storeStrong((id *)&self->_expectedDeviceMode, 0);
  objc_storeStrong((id *)&self->_ownerIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);

  objc_storeStrong((id *)&self->_identityLookupInfo, 0);
}

@end