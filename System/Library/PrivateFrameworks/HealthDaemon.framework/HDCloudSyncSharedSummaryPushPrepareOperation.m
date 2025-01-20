@interface HDCloudSyncSharedSummaryPushPrepareOperation
- (HDCloudSyncCachedZone)privateMetadataZone;
- (NSArray)allTransactions;
- (NSArray)pendingAndAcceptedParticipants;
- (NSDictionary)authorizationIdentifiersByContactIdentifier;
- (void)_fetchAllTransactionsWithCompletion:(id)a3;
- (void)_fetchAuthorizationIdentifiersByContactIdentifierForParticipants:(id)a3 completion:(id)a4;
- (void)_pendingAndAcceptedParticipantRecordsInZone:(id)a3 completion:(id)a4;
- (void)main;
@end

@implementation HDCloudSyncSharedSummaryPushPrepareOperation

- (void)main
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];

  v5 = [(HDCloudSyncOperation *)self configuration];
  v6 = [v5 cachedCloudState];
  v7 = [v4 primaryCKContainer];
  v8 = [v7 containerIdentifier];
  id v19 = 0;
  v9 = [v6 privateMetadataZoneForContainerID:v8 error:&v19];
  id v10 = v19;
  privateMetadataZone = self->_privateMetadataZone;
  self->_privateMetadataZone = v9;

  v12 = self->_privateMetadataZone;
  if (v12) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v10 == 0;
  }
  if (!v13)
  {
    v14 = self;
    uint64_t v15 = 0;
    id v16 = v10;
LABEL_11:
    [(HDCloudSyncOperation *)v14 finishWithSuccess:v15 error:v16];
    goto LABEL_12;
  }
  if (!v12)
  {
    _HKInitializeLogging();
    v17 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = self;
      _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] The metadata zone does not exist. Unable to continue push operation.", buf, 0xCu);
    }
    v14 = self;
    uint64_t v15 = 1;
    id v16 = 0;
    goto LABEL_11;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__HDCloudSyncSharedSummaryPushPrepareOperation_main__block_invoke;
  v18[3] = &unk_1E62FBAC8;
  v18[4] = self;
  [(HDCloudSyncSharedSummaryPushPrepareOperation *)self _fetchAllTransactionsWithCompletion:v18];
LABEL_12:
}

void __52__HDCloudSyncSharedSummaryPushPrepareOperation_main__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  v7 = *(id **)(a1 + 32);
  if (v6)
  {
    objc_storeStrong(v7 + 13, a2);
    v8 = *(void **)(a1 + 32);
    uint64_t v9 = v8[16];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__HDCloudSyncSharedSummaryPushPrepareOperation_main__block_invoke_2;
    v10[3] = &unk_1E62FBAC8;
    v10[4] = v8;
    [v8 _pendingAndAcceptedParticipantRecordsInZone:v9 completion:v10];
  }
  else
  {
    [v7 finishWithSuccess:0 error:a3];
  }
}

void __52__HDCloudSyncSharedSummaryPushPrepareOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (!v6)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = 0;
    id v11 = v7;
LABEL_8:
    [v9 finishWithSuccess:v10 error:v11];
    goto LABEL_9;
  }
  if (![v6 count])
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v13;
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] No pending or accepted participants found", buf, 0xCu);
    }
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = 1;
    id v11 = 0;
    goto LABEL_8;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), a2);
  v8 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__HDCloudSyncSharedSummaryPushPrepareOperation_main__block_invoke_277;
  v14[3] = &unk_1E62FBAA0;
  v14[4] = v8;
  [v8 _fetchAuthorizationIdentifiersByContactIdentifierForParticipants:v6 completion:v14];
LABEL_9:
}

void __52__HDCloudSyncSharedSummaryPushPrepareOperation_main__block_invoke_277(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = *(id **)(a1 + 32);
  id v11 = v6;
  if (v6)
  {
    objc_storeStrong(v7 + 15, a2);
    id v8 = a3;
    uint64_t v9 = *(id **)(a1 + 32);
    uint64_t v10 = 1;
  }
  else
  {
    id v8 = a3;
    uint64_t v9 = v7;
    uint64_t v10 = 0;
  }
  [v9 finishWithSuccess:v10 error:v8];
}

- (void)_fetchAllTransactionsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(HDCloudSyncOperation *)self configuration];
  id v6 = [v5 repository];
  id v7 = [v6 cloudSyncShimProvider];
  id v8 = [v7 sharedSummariesShim];

  uint64_t v9 = [(HDCloudSyncOperation *)self configuration];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__HDCloudSyncSharedSummaryPushPrepareOperation__fetchAllTransactionsWithCompletion___block_invoke;
  v11[3] = &unk_1E62FBAF0;
  id v12 = v4;
  id v10 = v4;
  [v8 fetchAllTransactionsWithConfiguration:v9 completion:v11];
}

uint64_t __84__HDCloudSyncSharedSummaryPushPrepareOperation__fetchAllTransactionsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_pendingAndAcceptedParticipantRecordsInZone:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v21 = 0;
  id v8 = [v7 recordsForClass:objc_opt_class() error:&v21];

  id v9 = v21;
  if (v8)
  {
    id v10 = [(HDCloudSyncOperation *)self configuration];
    id v11 = [v10 repository];
    id v12 = [v11 cloudSyncShimProvider];
    uint64_t v13 = [v12 summarySharingEntryShim];

    v14 = objc_msgSend(v8, "hk_filter:", &__block_literal_global_67);
    uint64_t v15 = objc_msgSend(v14, "hk_map:", &__block_literal_global_283);
    uint64_t v16 = [(HDCloudSyncOperation *)self configuration];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __103__HDCloudSyncSharedSummaryPushPrepareOperation__pendingAndAcceptedParticipantRecordsInZone_completion___block_invoke_3;
    v18[3] = &unk_1E62FBB38;
    v18[4] = self;
    id v19 = v14;
    id v20 = v6;
    id v17 = v14;
    [v13 pauseStatusForEntriesWithUUIDs:v15 configuration:v16 completion:v18];
  }
  else
  {
    (*((void (**)(id, void, id))v6 + 2))(v6, 0, v9);
  }
}

BOOL __103__HDCloudSyncSharedSummaryPushPrepareOperation__pendingAndAcceptedParticipantRecordsInZone_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 relationshipDirection];
  uint64_t v4 = [v3 longValue];

  if (v4 == 1)
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [v2 relationshipStatus];
    unint64_t v7 = [v6 longValue];

    BOOL v5 = v7 < 2;
  }

  return v5;
}

uint64_t __103__HDCloudSyncSharedSummaryPushPrepareOperation__pendingAndAcceptedParticipantRecordsInZone_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

void __103__HDCloudSyncSharedSummaryPushPrepareOperation__pendingAndAcceptedParticipantRecordsInZone_completion___block_invoke_3(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    unint64_t v7 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = a1[4];
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Failed to read pause status for participants with error %{public}@.", buf, 0x16u);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    id v8 = (void *)a1[5];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __103__HDCloudSyncSharedSummaryPushPrepareOperation__pendingAndAcceptedParticipantRecordsInZone_completion___block_invoke_284;
    v11[3] = &unk_1E62FAD08;
    id v12 = v5;
    id v9 = objc_msgSend(v8, "hk_filter:", v11);
    (*(void (**)(void))(a1[6] + 16))();
  }
}

uint64_t __103__HDCloudSyncSharedSummaryPushPrepareOperation__pendingAndAcceptedParticipantRecordsInZone_completion___block_invoke_284(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) allKeys];
  id v5 = [v3 UUID];
  if ([v4 containsObject:v5])
  {
    id v6 = *(void **)(a1 + 32);
    unint64_t v7 = [v3 UUID];
    id v8 = [v6 objectForKeyedSubscript:v7];
    uint64_t v9 = [v8 isEqual:MEMORY[0x1E4F1CC28]];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_fetchAuthorizationIdentifiersByContactIdentifierForParticipants:(id)a3 completion:(id)a4
{
  id v6 = a4;
  unint64_t v7 = objc_msgSend(a3, "hk_mapToSet:", &__block_literal_global_286_0);
  id v8 = [(HDCloudSyncOperation *)self configuration];
  uint64_t v9 = [v8 repository];
  uint64_t v10 = [v9 cloudSyncShimProvider];
  id v11 = [v10 summarySharingEntryShim];

  id v12 = [(HDCloudSyncOperation *)self configuration];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __124__HDCloudSyncSharedSummaryPushPrepareOperation__fetchAuthorizationIdentifiersByContactIdentifierForParticipants_completion___block_invoke_2;
  v14[3] = &unk_1E62FBB60;
  id v15 = v6;
  id v13 = v6;
  [v11 authorizationIdentifiersByContactIdentifierForParticipants:v7 configuration:v12 completion:v14];
}

uint64_t __124__HDCloudSyncSharedSummaryPushPrepareOperation__fetchAuthorizationIdentifiersByContactIdentifierForParticipants_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contactIdentifier];
}

uint64_t __124__HDCloudSyncSharedSummaryPushPrepareOperation__fetchAuthorizationIdentifiersByContactIdentifierForParticipants_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSArray)allTransactions
{
  return self->_allTransactions;
}

- (NSArray)pendingAndAcceptedParticipants
{
  return self->_pendingAndAcceptedParticipants;
}

- (NSDictionary)authorizationIdentifiersByContactIdentifier
{
  return self->_authorizationIdentifiersByContactIdentifier;
}

- (HDCloudSyncCachedZone)privateMetadataZone
{
  return self->_privateMetadataZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateMetadataZone, 0);
  objc_storeStrong((id *)&self->_authorizationIdentifiersByContactIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingAndAcceptedParticipants, 0);

  objc_storeStrong((id *)&self->_allTransactions, 0);
}

@end