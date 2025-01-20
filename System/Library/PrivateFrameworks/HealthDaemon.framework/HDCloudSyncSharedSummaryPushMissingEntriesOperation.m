@interface HDCloudSyncSharedSummaryPushMissingEntriesOperation
+ (BOOL)shouldLogAtOperationStart;
- (void)main;
@end

@implementation HDCloudSyncSharedSummaryPushMissingEntriesOperation

- (void)main
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
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
    id v31 = 0;
    v13 = [v8 privateMetadataZoneForContainerID:v12 error:&v31];
    id v14 = v31;

    if (v13)
    {
      id v30 = 0;
      v15 = [v13 recordsForClass:objc_opt_class() error:&v30];
      id v16 = v30;
      if (v15)
      {
        v27 = objc_msgSend(v15, "hk_mapToSet:", &__block_literal_global_3);
        v17 = [HDCloudSyncCompoundOperation alloc];
        v18 = [(HDCloudSyncOperation *)self configuration];
        v19 = [(HDCloudSyncCompoundOperation *)v17 initWithConfiguration:v18 cloudState:0 name:@"Push Pending Invitations" continueOnSubOperationError:0];

        v20 = [(HDCloudSyncOperation *)self configuration];
        v21 = [v20 repository];
        v22 = [v21 cloudSyncShimProvider];
        v23 = [v22 summarySharingEntryShim];

        v24 = [(HDCloudSyncOperation *)self configuration];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __59__HDCloudSyncSharedSummaryPushMissingEntriesOperation_main__block_invoke_2;
        v28[3] = &unk_1E62F3928;
        v28[4] = self;
        v29 = v19;
        v25 = v19;
        [v23 authorizationIdentifiersForEntriesNotExistingParticipants:v27 configuration:v24 completion:v28];
      }
      else
      {
        [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v16];
      }
    }
    else
    {
      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 724, @"Private metadata zone not present.");
        id v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v14];
    }
  }
  else
  {
    _HKInitializeLogging();
    v26 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = self;
      _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping operation because platform/profile does not support summary sharing", buf, 0xCu);
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
  }
}

uint64_t __59__HDCloudSyncSharedSummaryPushMissingEntriesOperation_main__block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

void __59__HDCloudSyncSharedSummaryPushMissingEntriesOperation_main__block_invoke_2(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  v8 = v7;
  if (a3)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = [v7 allKeys];
    uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      uint64_t v12 = MEMORY[0x1E4F1CBF0];
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
          v15 = [HDCloudSyncSharedSummaryUpdateParticipantOperation alloc];
          id v16 = [*(id *)(a1 + 32) configuration];
          v17 = [v8 objectForKeyedSubscript:v14];
          v18 = [(HDCloudSyncSharedSummaryUpdateParticipantOperation *)v15 initWithConfiguration:v16 codableEntry:v14 authorizationIdentifiersToAdd:v17 authorizationIdentifiersToDelete:v12];

          [*(id *)(a1 + 40) addOperation:v18 transitionHandler:0];
          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    [*(id *)(a1 + 32) delegateToOperation:*(void *)(a1 + 40)];
  }
  else
  {
    [*(id *)(a1 + 32) finishWithSuccess:0 error:a4];
  }
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

@end