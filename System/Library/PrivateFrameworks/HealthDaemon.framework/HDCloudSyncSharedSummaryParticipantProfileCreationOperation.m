@interface HDCloudSyncSharedSummaryParticipantProfileCreationOperation
- (HDCloudSyncSharedSummaryParticipantProfileCreationOperation)initWithConfiguration:(id)a3 participants:(id)a4;
- (void)_createProfileIfNecessaryForParticipant:(id)a3 completion:(id)a4;
- (void)_createProfileWithProfileIdentifier:(id)a3 contactIdentifier:(id)a4 firstName:(id)a5 lastName:(id)a6 completion:(id)a7;
- (void)_createProfileWithUUID:(id)a3 contactIdentifier:(id)a4 firstName:(id)a5 lastName:(id)a6 ownerParticipant:(id)a7 completion:(id)a8;
- (void)_setUpOwnerParticipantForProfileIdentifier:(id)a3 ownerParticipant:(id)a4 completion:(id)a5;
- (void)main;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncSharedSummaryParticipantProfileCreationOperation

- (HDCloudSyncSharedSummaryParticipantProfileCreationOperation)initWithConfiguration:(id)a3 participants:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncSharedSummaryParticipantProfileCreationOperation;
  v7 = [(HDCloudSyncOperation *)&v13 initWithConfiguration:a3 cloudState:0];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    participantRecords = v7->_participantRecords;
    v7->_participantRecords = (NSArray *)v8;

    v10 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = v7->_taskGroup;
    v7->_taskGroup = v10;

    [(HDSynchronousTaskGroup *)v7->_taskGroup setDelegate:v7];
  }

  return v7;
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
        v9[2] = __67__HDCloudSyncSharedSummaryParticipantProfileCreationOperation_main__block_invoke;
        v9[3] = &unk_1E62F2978;
        v9[4] = self;
        [(HDCloudSyncSharedSummaryParticipantProfileCreationOperation *)self _createProfileIfNecessaryForParticipant:v8 completion:v9];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(HDSynchronousTaskGroup *)self->_taskGroup finishTask];
}

uint64_t __67__HDCloudSyncSharedSummaryParticipantProfileCreationOperation_main__block_invoke(uint64_t a1, char a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 112);
  if (a2) {
    return [v2 finishTask];
  }
  else {
    return objc_msgSend(v2, "failTaskWithError:");
  }
}

- (void)_createProfileIfNecessaryForParticipant:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v8 = [v6 relationshipType];
  if ([v8 longValue]) {
    goto LABEL_6;
  }
  v9 = [v6 relationshipDirection];
  if ([v9 longValue] != 1)
  {

LABEL_6:
    goto LABEL_7;
  }
  long long v10 = [v6 relationshipStatus];
  uint64_t v11 = [v10 longValue];

  if (v11 != 1)
  {
LABEL_7:
    v7[2](v7, 1, 0);
    goto LABEL_8;
  }
  long long v12 = [v6 UUID];
  long long v13 = [v6 contactIdentifier];
  v14 = [v6 firstName];
  uint64_t v15 = [v6 lastName];
  v16 = [v6 ownerParticipant];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __114__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileIfNecessaryForParticipant_completion___block_invoke;
  v17[3] = &unk_1E62F29A0;
  v18 = v7;
  [(HDCloudSyncSharedSummaryParticipantProfileCreationOperation *)self _createProfileWithUUID:v12 contactIdentifier:v13 firstName:v14 lastName:v15 ownerParticipant:v16 completion:v17];

LABEL_8:
}

uint64_t __114__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileIfNecessaryForParticipant_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_createProfileWithUUID:(id)a3 contactIdentifier:(id)a4 firstName:(id)a5 lastName:(id)a6 ownerParticipant:(id)a7 completion:(id)a8
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v18)
  {
    v20 = [MEMORY[0x1E4F2B358] _profileWithUUID:v14 type:2];
    v21 = [(HDCloudSyncOperation *)self configuration];
    [v21 repository];
    v22 = id v31 = v14;
    [v22 cloudSyncShimProvider];
    v23 = v17;
    id v24 = v16;
    v26 = id v25 = v15;
    v30 = [v26 profileManagementShim];

    id v15 = v25;
    id v16 = v24;
    id v17 = v23;

    v27 = [(HDCloudSyncOperation *)self configuration];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __151__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileWithUUID_contactIdentifier_firstName_lastName_ownerParticipant_completion___block_invoke;
    v32[3] = &unk_1E62F29F0;
    id v38 = v19;
    v32[4] = self;
    id v33 = v20;
    id v34 = v15;
    id v35 = v16;
    id v36 = v23;
    id v37 = v18;
    id v28 = v20;
    [v30 profileExistsForProfileIdentifier:v28 configuration:v27 completion:v32];

    id v14 = v31;
  }
  else
  {
    _HKInitializeLogging();
    v29 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v40 = self;
      __int16 v41 = 2114;
      id v42 = v14;
      __int16 v43 = 2112;
      id v44 = v15;
      _os_log_error_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: No owner participant on sharing entry metadata; unable to create a new local profi"
        "le for accepted sharing entry %{public}@: %@",
        buf,
        0x20u);
    }
    (*((void (**)(id, uint64_t, void))v19 + 2))(v19, 1, 0);
  }
}

void __151__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileWithUUID_contactIdentifier_firstName_lastName_ownerParticipant_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 2)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __151__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileWithUUID_contactIdentifier_firstName_lastName_ownerParticipant_completion___block_invoke_2;
    v17[3] = &unk_1E62F29C8;
    void v17[4] = v7;
    id v18 = v6;
    id v20 = *(id *)(a1 + 80);
    id v19 = *(id *)(a1 + 72);
    [v7 _createProfileWithProfileIdentifier:v18 contactIdentifier:v8 firstName:v9 lastName:v10 completion:v17];

    uint64_t v11 = v18;
LABEL_6:

    goto LABEL_7;
  }
  if (a2)
  {
    long long v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __151__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileWithUUID_contactIdentifier_firstName_lastName_ownerParticipant_completion___block_invoke_2_280;
    v15[3] = &unk_1E62F29A0;
    uint64_t v14 = *(void *)(a1 + 72);
    id v16 = *(id *)(a1 + 80);
    [v12 _setUpOwnerParticipantForProfileIdentifier:v13 ownerParticipant:v14 completion:v15];
    uint64_t v11 = v16;
    goto LABEL_6;
  }
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
LABEL_7:
}

void __151__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileWithUUID_contactIdentifier_firstName_lastName_ownerParticipant_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29FA8];
  uint64_t v7 = *MEMORY[0x1E4F29FA8];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v8;
      __int16 v19 = 2114;
      uint64_t v20 = v9;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Created local profile for identifier %{public}@", buf, 0x16u);
    }
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __151__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileWithUUID_contactIdentifier_firstName_lastName_ownerParticipant_completion___block_invoke_279;
    v15[3] = &unk_1E62F29A0;
    uint64_t v12 = *(void *)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    [v10 _setUpOwnerParticipantForProfileIdentifier:v11 ownerParticipant:v12 completion:v15];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v13;
      __int16 v19 = 2114;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      id v22 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to create profile for identifier %{public}@: %{public}@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __151__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileWithUUID_contactIdentifier_firstName_lastName_ownerParticipant_completion___block_invoke_279(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __151__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileWithUUID_contactIdentifier_firstName_lastName_ownerParticipant_completion___block_invoke_2_280(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setUpOwnerParticipantForProfileIdentifier:(id)a3 ownerParticipant:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v11 = [(HDCloudSyncOperation *)self configuration];
  uint64_t v12 = [v11 repository];
  uint64_t v13 = [v12 cloudSyncShimProvider];
  uint64_t v14 = [v13 profileManagementShim];

  id v15 = [(HDCloudSyncOperation *)self configuration];
  id v16 = [v15 repository];
  id v17 = [v16 profileManager];
  uint64_t v18 = [v17 profileForIdentifier:v8];

  __int16 v19 = [v18 cloudSyncManager];
  id v32 = 0;
  id v20 = [v19 shareOwnerParticipantWithError:&v32];
  id v21 = v32;

  if (v20)
  {
    v10[2](v10, 1, 0);
  }
  else
  {
    id v20 = v9;
    id v22 = [v18 cloudSyncManager];
    id v31 = 0;
    int v23 = [v22 setShareOwnerParticipant:v20 error:&v31];
    id v27 = v31;

    _HKInitializeLogging();
    id v24 = *MEMORY[0x1E4F29FA8];
    id v25 = *MEMORY[0x1E4F29FA8];
    if (v23)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v34 = self;
        __int16 v35 = 2114;
        id v36 = v20;
        _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Stored owner participant: %{public}@", buf, 0x16u);
      }
      v10[2](v10, 1, 0);
    }
    else
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v34 = self;
        __int16 v35 = 2114;
        id v36 = v27;
        _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to store owner participant: %{public}@", buf, 0x16u);
      }
      v26 = [(HDCloudSyncOperation *)self configuration];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __134__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__setUpOwnerParticipantForProfileIdentifier_ownerParticipant_completion___block_invoke;
      v28[3] = &unk_1E62F2A18;
      v28[4] = self;
      id v29 = v8;
      v30 = v10;
      [v14 deleteProfile:v29 configuration:v26 completion:v28];
    }
  }
}

void __134__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__setUpOwnerParticipantForProfileIdentifier_ownerParticipant_completion___block_invoke(void *a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[4];
      uint64_t v8 = a1[5];
      int v9 = 138543874;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to delete profile for identifier %{public}@: %{public}@", (uint8_t *)&v9, 0x20u);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)_createProfileWithProfileIdentifier:(id)a3 contactIdentifier:(id)a4 firstName:(id)a5 lastName:(id)a6 completion:(id)a7
{
  id v12 = a4;
  __int16 v13 = (__CFString *)a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = v13;
  if (!v13)
  {
    if (v14) {
      id v16 = &stru_1F1728D60;
    }
    else {
      id v16 = (__CFString *)v12;
    }
  }
  id v25 = v13;
  id v17 = a3;
  uint64_t v18 = [(HDCloudSyncOperation *)self configuration];
  __int16 v19 = [v18 repository];
  [v19 cloudSyncShimProvider];
  v21 = id v20 = v12;
  id v22 = [v21 profileManagementShim];

  int v23 = [(HDCloudSyncOperation *)self configuration];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __147__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileWithProfileIdentifier_contactIdentifier_firstName_lastName_completion___block_invoke;
  v26[3] = &unk_1E62F2A40;
  v26[4] = self;
  id v27 = v15;
  id v24 = v15;
  [v22 createProfileForIdentifier:v17 firstName:v16 lastName:v14 configuration:v23 completion:v26];
}

void __147__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileWithProfileIdentifier_contactIdentifier_firstName_lastName_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  _HKInitializeLogging();
  uint64_t v7 = *MEMORY[0x1E4F29FA8];
  uint64_t v8 = *MEMORY[0x1E4F29FA8];
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v12 = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Created local profile for identifier %{public}@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138543874;
      uint64_t v13 = v11;
      __int16 v14 = 2114;
      id v15 = 0;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to create profile for identifier %{public}@: %{public}@", (uint8_t *)&v12, 0x20u);
    }
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v10();
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  BOOL v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(HDCloudSyncOperation *)self finishWithSuccess:v5 error:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskGroup, 0);

  objc_storeStrong((id *)&self->_participantRecords, 0);
}

@end