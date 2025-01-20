@interface HDSharedSummaryTransactionBuilderServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (BOOL)_createOrRetrieveTransactionIfNeededWithError:(void *)a1;
- (BOOL)_retrieveTransactionIfNeededWithError:(void *)a1;
- (HDSharedSummaryTransactionBuilderServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (uint64_t)_checkCommitStatusIfNeededWithError:(uint64_t)a1;
- (void)remote_addMetadata:(id)a3 completion:(id)a4;
- (void)remote_addSummaries:(id)a3 completion:(id)a4;
- (void)remote_addedSummariesWithPackage:(id)a3 names:(id)a4 resultsHandler:(id)a5;
- (void)remote_commitAsUrgent:(BOOL)a3 completion:(id)a4;
- (void)remote_discardWithCompletion:(id)a3;
- (void)remote_getCommitStatusWithCompletion:(id)a3;
- (void)remote_removeAllSummariesWithPackage:(id)a3 completion:(id)a4;
- (void)remote_removeSummariesWithPackage:(id)a3 names:(id)a4 completion:(id)a5;
- (void)remote_removeSummariesWithUUIDs:(id)a3 completion:(id)a4;
- (void)remote_reuseAllSummariesWithPackage:(id)a3 completion:(id)a4;
- (void)remote_reuseSummariesWithPackage:(id)a3 names:(id)a4 completion:(id)a5;
- (void)remote_reuseSummariesWithUUIDs:(id)a3 completion:(id)a4;
@end

@implementation HDSharedSummaryTransactionBuilderServer

- (HDSharedSummaryTransactionBuilderServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDSharedSummaryTransactionBuilderServer;
  v11 = [(HDStandardTaskServer *)&v15 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    configuration = v11->_configuration;
    v11->_configuration = (HKSharedSummaryTransactionBuilderTaskConfiguration *)v12;
  }
  return v11;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F2A9D8];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  v6 = [a3 transactionUUID];

  if (!v6) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"Missing transaction UUID");
  }
  return v6 != 0;
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2B4C0] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2B4C0] clientInterface];
}

- (void)remote_getCommitStatusWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void, void))v4;
  if (self->_committed)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, MEMORY[0x1E4F1CC38], 0);
  }
  else
  {
    id v23 = 0;
    BOOL v6 = -[HDSharedSummaryTransactionBuilderServer _retrieveTransactionIfNeededWithError:](self, &v23);
    id v7 = v23;
    v8 = v7;
    if (v6)
    {
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      char v22 = 0;
      v9 = [(HDStandardTaskServer *)self profile];
      id v10 = [v9 database];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __80__HDSharedSummaryTransactionBuilderServer_remote_getCommitStatusWithCompletion___block_invoke;
      v17[3] = &unk_1E62F9108;
      v17[5] = &v19;
      id v18 = v8;
      v17[4] = self;
      BOOL v11 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v10 error:&v18 block:v17];
      id v12 = v18;

      if (v11)
      {
        v13 = [NSNumber numberWithBool:*((unsigned __int8 *)v20 + 24)];
        ((void (**)(void, void *, void))v5)[2](v5, v13, 0);
      }
      else
      {
        ((void (**)(void, void, id))v5)[2](v5, 0, v12);
      }
      _Block_object_dispose(&v19, 8);
    }
    else
    {
      if (objc_msgSend(v7, "hk_isHealthKitErrorWithCode:", 126))
      {
        uint64_t v14 = MEMORY[0x1E4F1CC38];
        objc_super v15 = v5;
        v16 = 0;
      }
      else
      {
        objc_super v15 = v5;
        uint64_t v14 = 0;
        v16 = v8;
      }
      ((void (**)(void, uint64_t, void *))v5)[2](v15, v14, v16);
      id v12 = v8;
    }
  }
}

- (BOOL)_retrieveTransactionIfNeededWithError:(void *)a1
{
  uint64_t v2 = (uint64_t)a1;
  if (a1)
  {
    uint64_t v3 = a1[6];
    if (!v3)
    {
      v5 = [a1 profile];
      BOOL v6 = [v5 sharedSummaryManager];
      id v7 = [*(id *)(v2 + 40) transactionUUID];
      int v8 = [*(id *)(v2 + 40) allowCommitted];
      id v18 = 0;
      uint64_t v9 = [v6 transactionWithUUID:v7 requireUncommitted:v8 ^ 1u error:&v18];
      uint64_t v10 = (uint64_t)v18;
      BOOL v11 = *(void **)(v2 + 48);
      *(void *)(v2 + 48) = v9;

      uint64_t v12 = *(void *)(v2 + 48);
      if (!(v12 | v10))
      {
        v13 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v14 = [(id)v2 taskUUID];
        objc_super v15 = [v14 UUIDString];
        uint64_t v10 = objc_msgSend(v13, "hk_error:format:", 118, @"Transaction with UUID %@ not found", v15);

        uint64_t v12 = *(void *)(v2 + 48);
      }
      if (v12)
      {
        uint64_t v2 = -[HDSharedSummaryTransactionBuilderServer _checkCommitStatusIfNeededWithError:](v2, (uint64_t)a2);

        return v2;
      }
      id v17 = (id)v10;
      if (v17)
      {
        if (a2) {
          *a2 = v17;
        }
        else {
          _HKLogDroppedError();
        }
      }

      uint64_t v3 = *(void *)(v2 + 48);
    }
    return v3 != 0;
  }
  return v2;
}

BOOL __80__HDSharedSummaryTransactionBuilderServer_remote_getCommitStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(*(void *)(a1 + 32) + 48);
  id v10 = 0;
  char v6 = [v5 committedInDatabaseTransaction:a2 error:&v10];
  id v7 = v10;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  id v8 = v7;
  if (v8)
  {
    if (a3) {
      *a3 = v8;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v8 == 0;
}

- (void)remote_addSummaries:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (self->_committed)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 126, @"Transaction already committed");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7[2](v7, 0, v8);
    goto LABEL_6;
  }
  id v16 = 0;
  BOOL v9 = -[HDSharedSummaryTransactionBuilderServer _createOrRetrieveTransactionIfNeededWithError:](self, &v16);
  id v8 = v16;
  if (!v9) {
    goto LABEL_5;
  }
  id v10 = [(HDStandardTaskServer *)self profile];
  BOOL v11 = [v10 sharedSummaryManager];
  transactionEntity = self->_transactionEntity;
  id v15 = v8;
  uint64_t v13 = [v11 addSharedSummaries:v6 transactionEntity:transactionEntity error:&v15];
  id v14 = v15;

  v7[2](v7, v13, v14);
  id v8 = v14;
LABEL_6:
}

- (BOOL)_createOrRetrieveTransactionIfNeededWithError:(void *)a1
{
  uint64_t v2 = (uint64_t)a1;
  if (a1)
  {
    uint64_t v3 = a1[6];
    if (!v3)
    {
      v5 = [a1 profile];
      id v6 = [v5 sharedSummaryManager];
      id v7 = [*(id *)(v2 + 40) transactionUUID];
      int v8 = [*(id *)(v2 + 40) allowCommitted];
      id v21 = 0;
      uint64_t v9 = [v6 transactionWithUUID:v7 requireUncommitted:v8 ^ 1u error:&v21];
      unint64_t v10 = (unint64_t)v21;
      BOOL v11 = *(void **)(v2 + 48);
      *(void *)(v2 + 48) = v9;

      uint64_t v12 = *(void *)(v2 + 48);
      if (!(v12 | v10))
      {
        uint64_t v13 = [(id)v2 profile];
        id v14 = [v13 sharedSummaryManager];
        id v15 = [*(id *)(v2 + 40) transactionUUID];
        id v20 = 0;
        uint64_t v16 = [v14 createNewTransactionWithUUID:v15 error:&v20];
        unint64_t v10 = (unint64_t)v20;
        id v17 = *(void **)(v2 + 48);
        *(void *)(v2 + 48) = v16;

        uint64_t v12 = *(void *)(v2 + 48);
      }
      if (v12)
      {
        uint64_t v2 = -[HDSharedSummaryTransactionBuilderServer _checkCommitStatusIfNeededWithError:](v2, (uint64_t)a2);

        return v2;
      }
      id v19 = (id)v10;
      if (v19)
      {
        if (a2) {
          *a2 = v19;
        }
        else {
          _HKLogDroppedError();
        }
      }

      uint64_t v3 = *(void *)(v2 + 48);
    }
    return v3 != 0;
  }
  return v2;
}

- (void)remote_reuseSummariesWithUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (self->_committed)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 126, @"Transaction already committed");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7[2](v7, 0, v8);
    goto LABEL_6;
  }
  id v16 = 0;
  BOOL v9 = -[HDSharedSummaryTransactionBuilderServer _createOrRetrieveTransactionIfNeededWithError:](self, &v16);
  id v8 = v16;
  if (!v9) {
    goto LABEL_5;
  }
  unint64_t v10 = [(HDStandardTaskServer *)self profile];
  BOOL v11 = [v10 sharedSummaryManager];
  transactionEntity = self->_transactionEntity;
  id v15 = v8;
  uint64_t v13 = [v11 reuseSharedSummariesWithUUIDs:v6 transactionEntity:transactionEntity error:&v15];
  id v14 = v15;

  v7[2](v7, v13, v14);
  id v8 = v14;
LABEL_6:
}

- (void)remote_reuseSummariesWithPackage:(id)a3 names:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = (void (**)(id, void, id))a5;
  if (self->_committed)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 126, @"Transaction already committed");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10[2](v10, 0, v11);
    goto LABEL_6;
  }
  id v19 = 0;
  BOOL v12 = -[HDSharedSummaryTransactionBuilderServer _createOrRetrieveTransactionIfNeededWithError:](self, &v19);
  id v11 = v19;
  if (!v12) {
    goto LABEL_5;
  }
  uint64_t v13 = [(HDStandardTaskServer *)self profile];
  id v14 = [v13 sharedSummaryManager];
  transactionEntity = self->_transactionEntity;
  id v18 = v11;
  uint64_t v16 = [v14 reuseSharedSummariesWithPackage:v8 names:v9 transactionEntity:transactionEntity error:&v18];
  id v17 = v18;

  v10[2](v10, v16, v17);
  id v11 = v17;
LABEL_6:
}

- (void)remote_reuseAllSummariesWithPackage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (self->_committed)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 126, @"Transaction already committed");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7[2](v7, 0, v8);
    goto LABEL_6;
  }
  id v16 = 0;
  BOOL v9 = -[HDSharedSummaryTransactionBuilderServer _createOrRetrieveTransactionIfNeededWithError:](self, &v16);
  id v8 = v16;
  if (!v9) {
    goto LABEL_5;
  }
  unint64_t v10 = [(HDStandardTaskServer *)self profile];
  id v11 = [v10 sharedSummaryManager];
  transactionEntity = self->_transactionEntity;
  id v15 = v8;
  uint64_t v13 = [v11 reuseSharedSummariesWithPackage:v6 names:0 transactionEntity:transactionEntity error:&v15];
  id v14 = v15;

  v7[2](v7, v13, v14);
  id v8 = v14;
LABEL_6:
}

- (void)remote_addMetadata:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (self->_committed)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 126, @"Transaction already committed");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7[2](v7, 0, v8);
    goto LABEL_6;
  }
  id v16 = 0;
  BOOL v9 = -[HDSharedSummaryTransactionBuilderServer _createOrRetrieveTransactionIfNeededWithError:](self, &v16);
  id v8 = v16;
  if (!v9) {
    goto LABEL_5;
  }
  unint64_t v10 = [(HDStandardTaskServer *)self profile];
  id v11 = [v10 sharedSummaryManager];
  transactionEntity = self->_transactionEntity;
  id v15 = v8;
  uint64_t v13 = [v11 addMetadata:v6 transactionEntity:transactionEntity error:&v15];
  id v14 = v15;

  v7[2](v7, v13, v14);
  id v8 = v14;
LABEL_6:
}

- (void)remote_removeSummariesWithUUIDs:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t, id))a4;
  if (self->_committed)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 126, @"Transaction already committed");
  }
  else
  {
    if (self->_transactionEntity)
    {
      id v11 = [(HDStandardTaskServer *)self profile];
      BOOL v12 = [v11 sharedSummaryManager];
      transactionEntity = self->_transactionEntity;
      id v15 = 0;
      uint64_t v14 = [v12 removeSummariesWithUUIDs:v7 transactionEntity:transactionEntity error:&v15];
      id v10 = v15;

      v8[2](v8, v14, v10);
      goto LABEL_6;
    }
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Transaction not found"");
  }
  id v10 = (id)v9;
  v8[2](v8, 0, (id)v9);
LABEL_6:
}

- (void)remote_removeSummariesWithPackage:(id)a3 names:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, uint64_t, id))a5;
  if (self->_committed)
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 126, @"Transaction already committed");
  }
  else
  {
    if (self->_transactionEntity)
    {
      uint64_t v14 = [(HDStandardTaskServer *)self profile];
      id v15 = [v14 sharedSummaryManager];
      transactionEntity = self->_transactionEntity;
      id v18 = 0;
      uint64_t v17 = [v15 removeSummariesWithPackage:v9 names:v10 transactionEntity:transactionEntity error:&v18];
      id v13 = v18;

      v11[2](v11, v17, v13);
      goto LABEL_6;
    }
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Transaction not found"");
  }
  id v13 = (id)v12;
  v11[2](v11, 0, (id)v12);
LABEL_6:
}

- (void)remote_removeAllSummariesWithPackage:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t, id))a4;
  if (self->_committed)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 126, @"Transaction already committed");
  }
  else
  {
    if (self->_transactionEntity)
    {
      id v11 = [(HDStandardTaskServer *)self profile];
      uint64_t v12 = [v11 sharedSummaryManager];
      transactionEntity = self->_transactionEntity;
      id v15 = 0;
      uint64_t v14 = [v12 removeSummariesWithPackage:v7 names:0 transactionEntity:transactionEntity error:&v15];
      id v10 = v15;

      v8[2](v8, v14, v10);
      goto LABEL_6;
    }
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Transaction not found"");
  }
  id v10 = (id)v9;
  v8[2](v8, 0, (id)v9);
LABEL_6:
}

- (void)remote_commitAsUrgent:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void, id))a4;
  if (self->_committed)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 126, @"Transaction already committed");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v7);
  }
  else
  {
    id v19 = 0;
    BOOL v8 = -[HDSharedSummaryTransactionBuilderServer _createOrRetrieveTransactionIfNeededWithError:](self, &v19);
    id v9 = v19;
    if (v8)
    {
      id v10 = [(HDStandardTaskServer *)self profile];
      id v11 = [v10 sharedSummaryManager];
      transactionEntity = self->_transactionEntity;
      id v18 = v9;
      id v13 = [v11 commitTransactionEntity:transactionEntity error:&v18];
      id v7 = v18;

      self->_committed = v13 != 0;
      if (v13)
      {
        uint64_t v14 = [(HDStandardTaskServer *)self profile];
        id v15 = [v14 cloudSyncManager];
        id v16 = [v15 sharedSummaryManager];
        uint64_t v17 = v16;
        if (v4) {
          [v16 scheduleUrgentPush];
        }
        else {
          [v16 scheduleBackgroundPush];
        }
      }
      ((void (**)(id, void *, id))v6)[2](v6, v13, v7);
    }
    else
    {
      v6[2](v6, 0, v9);
      id v7 = v9;
    }
  }
}

- (void)remote_discardWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void, id))a3;
  if (self->_committed)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 126, @"Transaction already committed");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v4[2](v4, 0, v5);
    goto LABEL_6;
  }
  id v13 = 0;
  BOOL v6 = -[HDSharedSummaryTransactionBuilderServer _retrieveTransactionIfNeededWithError:](self, &v13);
  id v5 = v13;
  if (!v6) {
    goto LABEL_5;
  }
  id v7 = [(HDStandardTaskServer *)self profile];
  BOOL v8 = [v7 sharedSummaryManager];
  transactionEntity = self->_transactionEntity;
  id v12 = v5;
  uint64_t v10 = [v8 discardTransactionEntity:transactionEntity error:&v12];
  id v11 = v12;

  v4[2](v4, v10, v11);
  id v5 = v11;
LABEL_6:
}

- (void)remote_addedSummariesWithPackage:(id)a3 names:(id)a4 resultsHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, uint64_t, id))a5;
  if (self)
  {
    id v26 = 0;
    BOOL v11 = -[HDSharedSummaryTransactionBuilderServer _createOrRetrieveTransactionIfNeededWithError:](self, &v26);
    id v12 = v26;
    if (!v11)
    {
      v10[2](v10, 0, 1, v12);
LABEL_15:

      goto LABEL_16;
    }
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v14 = [(HDStandardTaskServer *)self profile];
    id v15 = [v14 sharedSummaryManager];
    transactionEntity = self->_transactionEntity;
    id v25 = v12;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __91__HDSharedSummaryTransactionBuilderServer__addedSummariesWithPackage_names_resultsHandler___block_invoke;
    v23[3] = &unk_1E6308930;
    id v17 = v13;
    id v24 = v17;
    LODWORD(transactionEntity) = [v15 enumerateSummariesInTransactionEntity:transactionEntity package:v8 names:v9 error:&v25 handler:v23];
    id v18 = v25;

    if (transactionEntity)
    {
      unint64_t v19 = [v17 count];
      if (v9)
      {
        if (v19 < [v9 count])
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 118, @"Some names not found for package %@ in %@", v8, v9);
          uint64_t v20 = LABEL_10:;

          id v18 = (id)v20;
        }
      }
      else if (!v19)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 118, @"Cannot find summaries for package %@", v8, v22);
        goto LABEL_10;
      }
    }
    if ([v17 count]) {
      id v21 = v17;
    }
    else {
      id v21 = 0;
    }
    ((void (**)(id, id, uint64_t, id))v10)[2](v10, v21, 1, v18);

    id v12 = v18;
    goto LABEL_15;
  }
LABEL_16:
}

- (uint64_t)_checkCommitStatusIfNeededWithError:(uint64_t)a1
{
  if (![*(id *)(a1 + 40) allowCommitted] || !*(void *)(a1 + 48)) {
    return 1;
  }
  BOOL v4 = [(id)a1 profile];
  id v5 = [v4 database];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__HDSharedSummaryTransactionBuilderServer__checkCommitStatusIfNeededWithError___block_invoke;
  v8[3] = &unk_1E62F6130;
  v8[4] = a1;
  BOOL v6 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v5 error:a2 block:v8];

  return v6;
}

uint64_t __79__HDSharedSummaryTransactionBuilderServer__checkCommitStatusIfNeededWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 48);
  id v12 = 0;
  char v6 = [v5 committedInDatabaseTransaction:a2 error:&v12];
  id v7 = v12;
  id v8 = v7;
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = v6;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 56)) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  uint64_t v10 = v9;
  if (!v9)
  {
    if (a3) {
      *a3 = v7;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v10;
}

uint64_t __91__HDSharedSummaryTransactionBuilderServer__addedSummariesWithPackage_names_resultsHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionEntity, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end