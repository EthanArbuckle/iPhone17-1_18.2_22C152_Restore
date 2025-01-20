@interface HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation
- (HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation)initWithConfiguration:(id)a3 participants:(id)a4;
- (void)_deleteLocalProfileIfNecessaryForParticipant:(id)a3 completion:(id)a4;
- (void)main;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation

- (HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation)initWithConfiguration:(id)a3 participants:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation;
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
  v2 = self;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 112;
  [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v4 = v2->_participantRecords;
  uint64_t v22 = [(NSArray *)v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v22)
  {
    uint64_t v5 = *(void *)v26;
    id v6 = v24;
    v21 = v2;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * v7);
        v9 = [v8 relationshipDirection];
        if ([v9 longValue] == 1)
        {
          v10 = [v8 relationshipType];
          if (![v10 longValue])
          {
            [v8 relationshipStatus];
            uint64_t v13 = v5;
            v15 = uint64_t v14 = v3;
            v16 = v6;
            v17 = v4;
            uint64_t v18 = [v15 longValue];

            uint64_t v3 = v14;
            uint64_t v5 = v13;

            BOOL v19 = v18 == 1;
            v4 = v17;
            id v6 = v16;
            v2 = v21;
            if (v19) {
              goto LABEL_12;
            }
            goto LABEL_10;
          }
        }
LABEL_10:
        v11 = [v8 relationshipStatus];
        uint64_t v12 = [v11 longValue];

        if (v12)
        {
          [*(id *)((char *)&v2->super.super.isa + v3) beginTask];
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v24[0] = __75__HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation_main__block_invoke;
          v24[1] = &unk_1E62F2978;
          v24[2] = v2;
          [(HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation *)v2 _deleteLocalProfileIfNecessaryForParticipant:v8 completion:v23];
        }
LABEL_12:
        ++v7;
      }
      while (v22 != v7);
      uint64_t v20 = [(NSArray *)v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
      uint64_t v22 = v20;
    }
    while (v20);
  }

  [*(id *)((char *)&v2->super.super.isa + v3) finishTask];
}

uint64_t __75__HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "failTaskWithError:");
  }
  v4 = *(void **)(*(void *)(a1 + 32) + 112);

  return [v4 finishTask];
}

- (void)_deleteLocalProfileIfNecessaryForParticipant:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, uint64_t, void))a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F2B358];
  uint64_t v8 = [a3 UUID];
  v9 = [v7 _profileWithUUID:v8 type:2];

  v10 = [(HDCloudSyncOperation *)self configuration];
  v11 = [v10 repository];
  uint64_t v12 = [v11 profileIdentifier];
  int v13 = [v9 isEqual:v12];

  if (v13)
  {
    v6[2](v6, 1, 0);
  }
  else
  {
    uint64_t v14 = [(HDCloudSyncOperation *)self configuration];
    v15 = [v14 repository];
    v16 = [v15 cloudSyncShimProvider];
    v17 = [v16 profileManagementShim];

    uint64_t v18 = [(HDCloudSyncOperation *)self configuration];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __127__HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation__deleteLocalProfileIfNecessaryForParticipant_completion___block_invoke;
    v20[3] = &unk_1E62F4F30;
    v24 = v6;
    id v21 = v17;
    id v22 = v9;
    v23 = self;
    id v19 = v17;
    [v19 profileExistsForProfileIdentifier:v22 configuration:v18 completion:v20];
  }
}

void __127__HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation__deleteLocalProfileIfNecessaryForParticipant_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 2)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    if (a2)
    {
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      v9 = [*(id *)(a1 + 48) configuration];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __127__HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation__deleteLocalProfileIfNecessaryForParticipant_completion___block_invoke_2;
      v10[3] = &unk_1E62F29A0;
      id v11 = *(id *)(a1 + 56);
      [v7 deleteProfile:v8 configuration:v9 completion:v10];

      goto LABEL_7;
    }
    id v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v6();
LABEL_7:
}

uint64_t __127__HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation__deleteLocalProfileIfNecessaryForParticipant_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
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