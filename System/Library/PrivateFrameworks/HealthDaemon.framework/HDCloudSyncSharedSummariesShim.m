@interface HDCloudSyncSharedSummariesShim
- (HDCloudSyncSharedSummariesShim)initWithProfile:(id)a3;
- (void)deleteAllSharedSummaryTransactionsWithConfiguration:(id)a3 completion:(id)a4;
- (void)deleteTransactions:(id)a3 completion:(id)a4;
- (void)deviceIdentifierWithCompletion:(id)a3;
- (void)fetchAllSharedSummaryTransactionsWithRepository:(id)a3 completion:(id)a4;
- (void)fetchAllTransactionsWithConfiguration:(id)a3 completion:(id)a4;
- (void)prepareAndCommitRepository:(id)a3 transactionWithUUID:(id)a4 sourceDeviceIdentifier:(id)a5 metadata:(id)a6 sharedSummaries:(id)a7 completion:(id)a8;
- (void)summariesFromTransaction:(id)a3 authorizationIdentifiers:(id)a4 completion:(id)a5;
@end

@implementation HDCloudSyncSharedSummariesShim

- (HDCloudSyncSharedSummariesShim)initWithProfile:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDCloudSyncSharedSummariesShim;
  v6 = [(HDCloudSyncSharedSummariesShim *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_profile, a3);
  }

  return v7;
}

- (void)deleteAllSharedSummaryTransactionsWithConfiguration:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, BOOL, id))a4;
  id v7 = a3;
  v8 = +[HDMutableDatabaseTransactionContext contextForWritingProtectedData];
  objc_super v9 = [v7 accessibilityAssertion];
  v10 = [v8 contextWithAccessibilityAssertion:v9];

  [v10 setCacheScope:1];
  v11 = [v7 repository];

  v12 = [v11 profile];
  v13 = [v12 database];

  v16[4] = self;
  id v17 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __97__HDCloudSyncSharedSummariesShim_deleteAllSharedSummaryTransactionsWithConfiguration_completion___block_invoke;
  v16[3] = &unk_1E62F6130;
  BOOL v14 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v13 context:v10 error:&v17 block:v16];
  id v15 = v17;
  v6[2](v6, v14, v15);
}

uint64_t __97__HDCloudSyncSharedSummariesShim_deleteAllSharedSummaryTransactionsWithConfiguration_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = [*(id *)(*(void *)(a1 + 32) + 8) sharedSummaryManager];
  uint64_t v5 = [v4 deleteAllTransactionsWithError:a3];

  return v5;
}

- (void)fetchAllSharedSummaryTransactionsWithRepository:(id)a3 completion:(id)a4
{
  uint64_t v5 = (void (**)(id, void *, id))a4;
  v6 = [a3 sharedSummaryManager];
  id v9 = 0;
  id v7 = [v6 fetchAllTransactionsWithError:&v9];
  id v8 = v9;

  v5[2](v5, v7, v8);
}

- (void)prepareAndCommitRepository:(id)a3 transactionWithUUID:(id)a4 sourceDeviceIdentifier:(id)a5 metadata:(id)a6 sharedSummaries:(id)a7 completion:(id)a8
{
  profile = self->_profile;
  v13 = (void (**)(id, uint64_t, id))a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  v18 = [(HDProfile *)profile sharedSummaryManager];
  id v21 = 0;
  uint64_t v19 = [v18 prepareAndCommitTransactionWithUUID:v17 sourceDeviceIdentifier:v16 metadata:v15 sharedSummaries:v14 error:&v21];

  id v20 = v21;
  v13[2](v13, v19, v20);
}

- (void)deleteTransactions:(id)a3 completion:(id)a4
{
  profile = self->_profile;
  v6 = (void (**)(id, uint64_t, id))a4;
  id v7 = a3;
  id v8 = [(HDProfile *)profile sharedSummaryManager];
  id v11 = 0;
  uint64_t v9 = [v8 deleteTransactions:v7 error:&v11];

  id v10 = v11;
  v6[2](v6, v9, v10);
}

- (void)fetchAllTransactionsWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v8 = +[HDMutableDatabaseTransactionContext contextForReadingProtectedData];
  uint64_t v9 = [v6 accessibilityAssertion];
  id v10 = [v8 contextWithAccessibilityAssertion:v9];

  [v10 setCacheScope:1];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__42;
  uint64_t v19 = __Block_byref_object_dispose__42;
  id v20 = 0;
  id v11 = [(HDProfile *)self->_profile database];
  v13[5] = &v15;
  id v14 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__HDCloudSyncSharedSummariesShim_fetchAllTransactionsWithConfiguration_completion___block_invoke;
  v13[3] = &unk_1E62F9108;
  v13[4] = self;
  [v11 performTransactionWithContext:v10 error:&v14 block:v13 inaccessibilityHandler:0];
  id v12 = v14;

  v7[2](v7, v16[5], v12);
  _Block_object_dispose(&v15, 8);
}

BOOL __83__HDCloudSyncSharedSummariesShim_fetchAllTransactionsWithConfiguration_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) sharedSummaryManager];
  uint64_t v6 = [v5 fetchCommittedTransactionsWithError:a3];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (void)deviceIdentifierWithCompletion:(id)a3
{
  profile = self->_profile;
  v4 = (void (**)(id, void *, id))a3;
  uint64_t v5 = [(HDProfile *)profile sharedSummaryManager];
  id v8 = 0;
  uint64_t v6 = [v5 deviceIdentifierWithError:&v8];
  id v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)summariesFromTransaction:(id)a3 authorizationIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v10 = (void (**)(id, uint64_t, id, id, id))a5;
  id v11 = a3;
  id v12 = objc_alloc_init(v9);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v14 = [(HDProfile *)self->_profile sharedSummaryManager];
  id v23 = v12;
  id v24 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __95__HDCloudSyncSharedSummariesShim_summariesFromTransaction_authorizationIdentifiers_completion___block_invoke;
  v20[3] = &unk_1E62F9130;
  id v21 = v8;
  id v22 = v13;
  id v15 = v12;
  id v16 = v13;
  id v17 = v8;
  uint64_t v18 = [v14 enumerateSummariesInTransaction:v11 package:0 names:0 includedObjectTypes:0 error:&v24 handler:v20];

  id v19 = v24;
  v10[2](v10, v18, v15, v16, v19);
}

void __95__HDCloudSyncSharedSummariesShim_summariesFromTransaction_authorizationIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  v3 = [v10 authorizationIdentifiers];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v10 authorizationIdentifiers];
    id v7 = [v6 allObjects];
    LODWORD(v5) = objc_msgSend(v5, "hk_containsObjectsInArray:", v7);

    if (v5)
    {
      id v8 = *(void **)(a1 + 40);
      uint64_t v9 = [v10 UUID];
      [v8 addObject:v9];

      [*(id *)(a1 + 48) addObject:v10];
    }
  }
}

- (void).cxx_destruct
{
}

@end