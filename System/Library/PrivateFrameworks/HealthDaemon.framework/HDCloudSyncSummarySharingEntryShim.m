@interface HDCloudSyncSummarySharingEntryShim
- (HDCloudSyncSummarySharingEntryShim)initWithProfile:(id)a3;
- (void)authorizationIdentifiersByContactIdentifierForParticipants:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)authorizationIdentifiersForEntriesNotExistingParticipants:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)codableEntryWithUUID:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)disableAllSharingEntriesWithConfiguration:(id)a3 completion:(id)a4;
- (void)insertOrReplaceCodableSharingEntries:(id)a3 shouldResolveCNContact:(BOOL)a4 completion:(id)a5;
- (void)pauseStatusForEntriesWithUUIDs:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)sharingEntryExistsWithPredicate:(id)a3 configuration:(id)a4 completion:(id)a5;
@end

@implementation HDCloudSyncSummarySharingEntryShim

- (HDCloudSyncSummarySharingEntryShim)initWithProfile:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDCloudSyncSummarySharingEntryShim;
  v6 = [(HDCloudSyncSummarySharingEntryShim *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    uint64_t v8 = HKCreateSerialDispatchQueue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (void)disableAllSharingEntriesWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[HDMutableDatabaseTransactionContext contextForWritingProtectedData];
  v9 = [v7 accessibilityAssertion];

  v10 = [v8 contextWithAccessibilityAssertion:v9];

  [v10 setCacheScope:1];
  objc_super v11 = [(HDProfile *)self->_profile database];
  id v21 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __91__HDCloudSyncSummarySharingEntryShim_disableAllSharingEntriesWithConfiguration_completion___block_invoke;
  v20[3] = &unk_1E62F6130;
  v20[4] = self;
  LOBYTE(v8) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v11 context:v10 error:&v21 block:v20];
  id v12 = v21;

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__HDCloudSyncSummarySharingEntryShim_disableAllSharingEntriesWithConfiguration_completion___block_invoke_2;
  block[3] = &unk_1E62F61A8;
  char v19 = (char)v8;
  id v17 = v12;
  id v18 = v6;
  id v14 = v12;
  id v15 = v6;
  dispatch_async(queue, block);
}

uint64_t __91__HDCloudSyncSummarySharingEntryShim_disableAllSharingEntriesWithConfiguration_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = [*(id *)(*(void *)(a1 + 32) + 8) sharingEntryManager];
  uint64_t v5 = [v4 disableAllSharingEntriesWithError:a3];

  return v5;
}

uint64_t __91__HDCloudSyncSummarySharingEntryShim_disableAllSharingEntriesWithConfiguration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)sharingEntryExistsWithPredicate:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = +[HDMutableDatabaseTransactionContext contextForReadingProtectedData];
  id v12 = [v9 accessibilityAssertion];
  v13 = [v11 contextWithAccessibilityAssertion:v12];

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  char v30 = 0;
  id v14 = [(HDProfile *)self->_profile database];
  id v28 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __95__HDCloudSyncSummarySharingEntryShim_sharingEntryExistsWithPredicate_configuration_completion___block_invoke;
  v25[3] = &unk_1E62F5CB0;
  v25[4] = self;
  id v15 = v8;
  id v26 = v15;
  v27 = v29;
  LOBYTE(v12) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v14 context:v13 error:&v28 block:v25];
  id v16 = v28;

  queue = self->_queue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __95__HDCloudSyncSummarySharingEntryShim_sharingEntryExistsWithPredicate_configuration_completion___block_invoke_2;
  v20[3] = &unk_1E6308360;
  char v24 = (char)v12;
  id v22 = v10;
  v23 = v29;
  id v21 = v16;
  id v18 = v16;
  id v19 = v10;
  dispatch_async(queue, v20);

  _Block_object_dispose(v29, 8);
}

uint64_t __95__HDCloudSyncSummarySharingEntryShim_sharingEntryExistsWithPredicate_configuration_completion___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1[4] + 8) sharingEntryManager];
  uint64_t v6 = [v5 lookupEntryWithPredicate:a1[5] wasFound:*(void *)(a1[6] + 8) + 24 error:a3];

  return v6;
}

uint64_t __95__HDCloudSyncSummarySharingEntryShim_sharingEntryExistsWithPredicate_configuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 56)) {
    BOOL v3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 0;
  }
  else {
    BOOL v3 = 0;
  }
  return (*(uint64_t (**)(uint64_t, BOOL, BOOL, void))(v2 + 16))(v2, v3, *(unsigned char *)(a1 + 56) != 0, *(void *)(a1 + 32));
}

- (void)authorizationIdentifiersForEntriesNotExistingParticipants:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = +[HDMutableDatabaseTransactionContext contextForReadingProtectedData];
  id v12 = [v9 accessibilityAssertion];
  v13 = [v11 contextWithAccessibilityAssertion:v12];

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  void v29[3] = __Block_byref_object_copy__160;
  v29[4] = __Block_byref_object_dispose__160;
  id v30 = 0;
  id v14 = [(HDProfile *)self->_profile database];
  v27 = v29;
  id v28 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __121__HDCloudSyncSummarySharingEntryShim_authorizationIdentifiersForEntriesNotExistingParticipants_configuration_completion___block_invoke;
  v25[3] = &unk_1E62F3DD8;
  v25[4] = self;
  id v15 = v8;
  id v26 = v15;
  LOBYTE(v12) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v14 context:v13 error:&v28 block:v25];
  id v16 = v28;

  queue = self->_queue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __121__HDCloudSyncSummarySharingEntryShim_authorizationIdentifiersForEntriesNotExistingParticipants_configuration_completion___block_invoke_2;
  v20[3] = &unk_1E6308360;
  id v22 = v10;
  v23 = v29;
  char v24 = (char)v12;
  id v21 = v16;
  id v18 = v16;
  id v19 = v10;
  dispatch_async(queue, v20);

  _Block_object_dispose(v29, 8);
}

BOOL __121__HDCloudSyncSummarySharingEntryShim_authorizationIdentifiersForEntriesNotExistingParticipants_configuration_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = [*(id *)(a1[4] + 8) sharingEntryManager];
  uint64_t v6 = [v5 authorizationIdentifiersForEntriesNotPresentInSet:a1[5] error:a3];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return *a3 == 0;
}

uint64_t __121__HDCloudSyncSummarySharingEntryShim_authorizationIdentifiersForEntriesNotExistingParticipants_configuration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
}

- (void)pauseStatusForEntriesWithUUIDs:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  objc_super v11 = +[HDMutableDatabaseTransactionContext contextForReadingProtectedData];
  id v12 = [v10 accessibilityAssertion];

  v13 = [v11 contextWithAccessibilityAssertion:v12];

  id v14 = [(HDProfile *)self->_profile database];
  id v20 = v9;
  id v21 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94__HDCloudSyncSummarySharingEntryShim_pauseStatusForEntriesWithUUIDs_configuration_completion___block_invoke;
  v18[3] = &unk_1E63083B0;
  v18[4] = self;
  id v19 = v8;
  id v15 = v9;
  id v16 = v8;
  +[HDHealthEntity performReadTransactionWithHealthDatabase:v14 context:v13 error:&v21 block:v18];
  id v17 = v21;
}

uint64_t __94__HDCloudSyncSummarySharingEntryShim_pauseStatusForEntriesWithUUIDs_configuration_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) sharingEntryManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __94__HDCloudSyncSummarySharingEntryShim_pauseStatusForEntriesWithUUIDs_configuration_completion___block_invoke_2;
  v5[3] = &unk_1E6308388;
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v2 pauseStatusesForUUIDS:v3 completion:v5];

  return 1;
}

uint64_t __94__HDCloudSyncSummarySharingEntryShim_pauseStatusForEntriesWithUUIDs_configuration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)authorizationIdentifiersByContactIdentifierForParticipants:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = +[HDMutableDatabaseTransactionContext contextForReadingProtectedData];
  id v12 = [v9 accessibilityAssertion];
  v13 = [v11 contextWithAccessibilityAssertion:v12];

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  void v29[3] = __Block_byref_object_copy__160;
  v29[4] = __Block_byref_object_dispose__160;
  id v30 = 0;
  id v14 = [(HDProfile *)self->_profile database];
  v27 = v29;
  id v28 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __122__HDCloudSyncSummarySharingEntryShim_authorizationIdentifiersByContactIdentifierForParticipants_configuration_completion___block_invoke;
  v25[3] = &unk_1E62F3DD8;
  v25[4] = self;
  id v15 = v8;
  id v26 = v15;
  LOBYTE(v12) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v14 context:v13 error:&v28 block:v25];
  id v16 = v28;

  queue = self->_queue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __122__HDCloudSyncSummarySharingEntryShim_authorizationIdentifiersByContactIdentifierForParticipants_configuration_completion___block_invoke_2;
  v20[3] = &unk_1E6308360;
  id v22 = v10;
  v23 = v29;
  char v24 = (char)v12;
  id v21 = v16;
  id v18 = v16;
  id v19 = v10;
  dispatch_async(queue, v20);

  _Block_object_dispose(v29, 8);
}

BOOL __122__HDCloudSyncSummarySharingEntryShim_authorizationIdentifiersByContactIdentifierForParticipants_configuration_completion___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1[4] + 8) sharingEntryManager];
  uint64_t v6 = [v5 authorizationIdentifiersByContactIdentifiersForOutgoingPendingAndAcceptedParticipants:a1[5] error:a3];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
}

uint64_t __122__HDCloudSyncSummarySharingEntryShim_authorizationIdentifiersByContactIdentifierForParticipants_configuration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
}

- (void)codableEntryWithUUID:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = +[HDMutableDatabaseTransactionContext contextForReadingProtectedData];
  id v12 = [v9 accessibilityAssertion];
  v13 = [v11 contextWithAccessibilityAssertion:v12];

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__160;
  v28[4] = __Block_byref_object_dispose__160;
  id v29 = 0;
  id v14 = [(HDProfile *)self->_profile database];
  id v26 = v28;
  id v27 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __84__HDCloudSyncSummarySharingEntryShim_codableEntryWithUUID_configuration_completion___block_invoke;
  v24[3] = &unk_1E62F3DD8;
  v24[4] = self;
  id v15 = v8;
  id v25 = v15;
  +[HDHealthEntity performReadTransactionWithHealthDatabase:v14 context:v13 error:&v27 block:v24];
  id v16 = v27;

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__HDCloudSyncSummarySharingEntryShim_codableEntryWithUUID_configuration_completion___block_invoke_2;
  block[3] = &unk_1E63083D8;
  id v22 = v10;
  v23 = v28;
  id v21 = v16;
  id v18 = v16;
  id v19 = v10;
  dispatch_async(queue, block);

  _Block_object_dispose(v28, 8);
}

BOOL __84__HDCloudSyncSummarySharingEntryShim_codableEntryWithUUID_configuration_completion___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1[4] + 8) sharingEntryManager];
  uint64_t v6 = [v5 codableEntryWithUUID:a1[5] errorOut:a3];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
}

uint64_t __84__HDCloudSyncSummarySharingEntryShim_codableEntryWithUUID_configuration_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], *(void *)(*(void *)(a1[6] + 8) + 40), a1[4]);
}

- (void)insertOrReplaceCodableSharingEntries:(id)a3 shouldResolveCNContact:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if (a3)
  {
    profile = self->_profile;
    id v10 = a3;
    objc_super v11 = [(HDProfile *)profile sharingEntryManager];
    id v20 = 0;
    char v12 = [v11 insertOrReplaceCodableEntries:v10 shouldResolveCNContact:v5 error:&v20];

    a3 = v20;
  }
  else
  {
    char v12 = 1;
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __109__HDCloudSyncSummarySharingEntryShim_insertOrReplaceCodableSharingEntries_shouldResolveCNContact_completion___block_invoke;
  v16[3] = &unk_1E62F61A8;
  char v19 = v12;
  id v17 = a3;
  id v18 = v8;
  id v14 = a3;
  id v15 = v8;
  dispatch_async(queue, v16);
}

uint64_t __109__HDCloudSyncSummarySharingEntryShim_insertOrReplaceCodableSharingEntries_shouldResolveCNContact_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end