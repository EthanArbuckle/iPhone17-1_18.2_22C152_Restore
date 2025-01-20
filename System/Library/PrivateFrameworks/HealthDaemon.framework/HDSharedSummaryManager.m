@interface HDSharedSummaryManager
- (BOOL)addMetadata:(id)a3 transactionEntity:(id)a4 error:(id *)a5;
- (BOOL)addOrReuseReceivedSharedSummaries:(id)a3 transactionEntity:(id)a4 error:(id *)a5;
- (BOOL)addSharedSummaries:(id)a3 transactionEntity:(id)a4 error:(id *)a5;
- (BOOL)deleteAllTransactionsWithError:(id *)a3;
- (BOOL)deleteTransactions:(id)a3 error:(id *)a4;
- (BOOL)discardTransactionEntity:(id)a3 error:(id *)a4;
- (BOOL)enumerateCommittedTransactionsWithError:(id *)a3 handler:(id)a4;
- (BOOL)enumerateNonCommittedTransactionsWithError:(id *)a3 handler:(id)a4;
- (BOOL)enumerateSummariesInTransaction:(id)a3 package:(id)a4 names:(id)a5 includedObjectTypes:(id)a6 error:(id *)a7 handler:(id)a8;
- (BOOL)enumerateSummariesInTransactionEntity:(id)a3 package:(id)a4 names:(id)a5 error:(id *)a6 handler:(id)a7;
- (BOOL)prepareAndCommitTransactionWithUUID:(id)a3 sourceDeviceIdentifier:(id)a4 metadata:(id)a5 sharedSummaries:(id)a6 error:(id *)a7;
- (BOOL)removeSummariesWithPackage:(id)a3 names:(id)a4 transactionEntity:(id)a5 error:(id *)a6;
- (BOOL)removeSummariesWithUUIDs:(id)a3 transactionEntity:(id)a4 error:(id *)a5;
- (BOOL)reuseSharedSummariesWithPackage:(id)a3 names:(id)a4 transactionEntity:(id)a5 error:(id *)a6;
- (BOOL)reuseSharedSummariesWithUUIDs:(id)a3 transactionEntity:(id)a4 error:(id *)a5;
- (HDSharedSummaryManager)initWithProfile:(id)a3;
- (id)_createTransactionWithUUID:(void *)a3 sourceDeviceIdentifier:(void *)a4 metadata:(void *)a5 error:;
- (id)_transactionForEntity:(void *)a3 databaseTransaction:(void *)a4 error:;
- (id)commitTransactionEntity:(id)a3 error:(id *)a4;
- (id)createNewTransactionWithUUID:(id)a3 error:(id *)a4;
- (id)createReceivedTransactionWithUUID:(id)a3 sourceDeviceIdentifier:(id)a4 metadata:(id)a5 error:(id *)a6;
- (id)deviceIdentifierWithError:(id *)a3;
- (id)fetchAllTransactionsWithError:(id *)a3;
- (id)mostRecentTransactionCreationDateWithError:(id *)a3;
- (id)transactionWithUUID:(id)a3 requireUncommitted:(BOOL)a4 error:(id *)a5;
- (id)unitTest_transactionForEntity:(id)a3 databaseTransaction:(id)a4 error:(id *)a5;
- (uint64_t)_notifyObserversOfTransactionChange;
- (uint64_t)performDatabaseTransactionForWriting:(void *)a3 entity:(void *)a4 error:(void *)a5 block:;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation HDSharedSummaryManager

- (HDSharedSummaryManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDSharedSummaryManager;
  v5 = [(HDSharedSummaryManager *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    id v7 = objc_alloc(MEMORY[0x1E4F2B5F0]);
    v8 = HKLogSharing();
    uint64_t v9 = [v7 initWithName:@"shared-summary-manager-observers" loggingCategory:v8];
    observers = v6->_observers;
    v6->_observers = (HKSynchronousObserverSet *)v9;
  }
  return v6;
}

- (uint64_t)performDatabaseTransactionForWriting:(void *)a3 entity:(void *)a4 error:(void *)a5 block:
{
  id v9 = a5;
  if (!a1)
  {
    uint64_t v12 = 0;
    goto LABEL_22;
  }
  v10 = (id *)(a1 + 8);
  id WeakRetained = objc_loadWeakRetained(v10);
  uint64_t v12 = [WeakRetained database];

  if (v12)
  {
    if ([a3 protectionClass] == 2)
    {
      if (a2) {
        +[HDDatabaseTransactionContext contextForWritingProtectedData];
      }
      else {
        +[HDDatabaseTransactionContext contextForReadingProtectedData];
      }
    }
    else if (a2)
    {
      +[HDDatabaseTransactionContext contextForWriting];
    }
    else
    {
      +[HDDatabaseTransactionContext contextForReading];
    v13 = };
    v14 = v13;
    v15 = (void *)[v13 mutableCopy];
    uint64_t v12 = 1;
    [v15 setCacheScope:1];
    id v16 = objc_loadWeakRetained(v10);
    v17 = [v16 database];
    id v24 = 0;
    char v18 = [v17 performTransactionWithContext:v15 error:&v24 block:v9 inaccessibilityHandler:0];
    id v19 = v24;

    if (v18) {
      goto LABEL_21;
    }
    if (objc_msgSend(v19, "hk_isDatabaseTransactionError"))
    {
      id v20 = objc_loadWeakRetained(v10);
      v21 = [v20 database];
      uint64_t v12 = [v21 performTransactionWithContext:v14 error:a4 block:v9 inaccessibilityHandler:0];

LABEL_20:
LABEL_21:

      goto LABEL_22;
    }
    id v22 = v19;
    id v20 = v22;
    if (v22)
    {
      if (a4)
      {
        id v20 = v22;
        uint64_t v12 = 0;
        *a4 = v20;
        goto LABEL_20;
      }
      _HKLogDroppedError();
    }
    uint64_t v12 = 0;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a4, 1500, @"Nil healthDatabase");
LABEL_22:

  return v12;
}

- (id)createNewTransactionWithUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v13 = 0;
  id v7 = [(HDSharedSummaryManager *)self deviceIdentifierWithError:&v13];
  id v8 = v13;
  id v9 = v8;
  if (v7)
  {
    v10 = -[HDSharedSummaryManager _createTransactionWithUUID:sourceDeviceIdentifier:metadata:error:](self, v6, self->_deviceIdentifier, 0, a4);
  }
  else
  {
    id v11 = v8;
    if (v11)
    {
      if (a4) {
        *a4 = v11;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v10 = 0;
  }

  return v10;
}

- (id)_createTransactionWithUUID:(void *)a3 sourceDeviceIdentifier:(void *)a4 metadata:(void *)a5 error:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    _HKInitializeLogging();
    uint64_t v12 = HKLogSharing();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      id v13 = *(id *)&buf[4];
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Creating new transaction with UUID %{public}@", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v23 = __Block_byref_object_copy__35;
    id v24 = __Block_byref_object_dispose__35;
    id v25 = 0;
    v14 = objc_opt_class();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __91__HDSharedSummaryManager__createTransactionWithUUID_sourceDeviceIdentifier_metadata_error___block_invoke;
    v18[3] = &unk_1E62F3DD8;
    v21 = buf;
    id v19 = v9;
    id v20 = v10;
    -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)a1, 1, v14, a5, v18);
    v15 = *(void **)(*(void *)&buf[8] + 40);
    if (v11 && v15)
    {
      if (![a1 addMetadata:v11 transactionEntity:v15 error:a5])
      {
        id v16 = 0;
        goto LABEL_10;
      }
      v15 = *(void **)(*(void *)&buf[8] + 40);
    }
    id v16 = v15;
LABEL_10:

    _Block_object_dispose(buf, 8);
    goto LABEL_11;
  }
  id v16 = 0;
LABEL_11:

  return v16;
}

- (id)transactionWithUUID:(id)a3 requireUncommitted:(BOOL)a4 error:(id *)a5
{
  id v9 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__35;
  id v25 = __Block_byref_object_dispose__35;
  id v26 = 0;
  id v10 = objc_opt_class();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__HDSharedSummaryManager_transactionWithUUID_requireUncommitted_error___block_invoke;
  v15[3] = &unk_1E62F80F0;
  char v18 = &v21;
  id v11 = v9;
  BOOL v20 = a4;
  id v16 = v11;
  v17 = self;
  SEL v19 = a2;
  if (-[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 0, v10, a5, v15))uint64_t v12 = (void *)v22[5]; {
  else
  }
    uint64_t v12 = 0;
  id v13 = v12;

  _Block_object_dispose(&v21, 8);

  return v13;
}

uint64_t __71__HDSharedSummaryManager_transactionWithUUID_requireUncommitted_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v22 = 0;
  uint64_t v7 = +[HDSharedSummaryTransactionEntity transactionEntityWithUUID:v6 databaseTransaction:v5 error:&v22];
  id v8 = v22;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;

  id v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v11)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      id v21 = v8;
      int v12 = [v11 committedInDatabaseTransaction:v5 error:&v21];
      id v13 = v21;

      if (v12)
      {
        v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v15 = objc_opt_class();
        uint64_t v16 = *(void *)(a1 + 56);
        v17 = [*(id *)(a1 + 32) UUIDString];
        objc_msgSend(v14, "hk_error:class:selector:format:", 126, v15, v16, @"Transaction with UUID %@ already committed", v17);
        id v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v8 = v13;
      }
    }
    id v18 = v8;
    if (v18)
    {
      if (a3) {
        goto LABEL_11;
      }
      goto LABEL_7;
    }
LABEL_12:
    uint64_t v19 = 1;
    goto LABEL_13;
  }
  id v18 = v8;
  if (!v18) {
    goto LABEL_12;
  }
  if (a3)
  {
LABEL_11:
    id v18 = v18;
    uint64_t v19 = 0;
    *a3 = v18;
    goto LABEL_13;
  }
LABEL_7:
  _HKLogDroppedError();
  uint64_t v19 = 0;
LABEL_13:

  return v19;
}

- (BOOL)addSharedSummaries:(id)a3 transactionEntity:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_opt_class();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__HDSharedSummaryManager_addSharedSummaries_transactionEntity_error___block_invoke;
  v14[3] = &unk_1E62F5A88;
  id v15 = v8;
  uint64_t v16 = self;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  LOBYTE(a5) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v10, a5, v14);

  return (char)a5;
}

uint64_t __69__HDSharedSummaryManager_addSharedSummaries_transactionEntity_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  LODWORD(v4) = a1;
  v70[1] = *MEMORY[0x1E4F143B8];
  id v55 = a2;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v53 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
  if (v53)
  {
    uint64_t v52 = *(void *)v59;
    v49 = a3;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v59 != v52) {
          objc_enumerationMutation(obj);
        }
        uint64_t v56 = v5;
        uint64_t v6 = *(void **)(*((void *)&v58 + 1) + 8 * v5);
        id v7 = *(id *)(a1 + 40);
        id v8 = *(void **)(a1 + 48);
        id v9 = v6;
        id v10 = v8;
        id v11 = v55;
        if (v7)
        {
          id v12 = [v9 UUID];
          id v13 = [v9 package];
          v14 = [v9 name];
          id v15 = [v9 version];
          uint64_t v16 = [v9 compatibilityVersion];
          v57 = v10;
          uint64_t v17 = [v10 persistentID];
          id v18 = [v9 summaryData];
          id v67 = 0;
          uint64_t v19 = +[HDSharedSummaryEntity insertOrReplaceWithUUID:v12 package:v13 name:v14 version:v15 compatibilityVersion:v16 transactionID:v17 summaryData:v18 databaseTransaction:v11 error:&v67];
          id v20 = v67;

          if (v19)
          {
            uint64_t v21 = [v19 persistentID];
            id v22 = [v9 authorizationIdentifiers];
            id v66 = v20;
            uint64_t v23 = +[HDSharedSummaryAuthorizationIdentifierEntity insertWithSummaryID:v21 authorizationIdentifiers:v22 databaseTransaction:v11 error:&v66];
            id v24 = v66;

            if (v23)
            {
              uint64_t v25 = [v19 persistentID];
              id v26 = [v9 objectTypes];
              id v65 = v24;
              v27 = +[HDSharedSummaryObjectTypeEntity insertWithSummaryID:v25 objectTypes:v26 databaseTransaction:v11 error:&v65];
              id v28 = v65;

              id v10 = v57;
              if (v27)
              {
                v50 = v27;
                uint64_t v29 = [v57 persistentID];
                [v9 package];
                v31 = v30 = v11;
                v32 = [v9 name];
                v70[0] = v32;
                v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:1];
                id v64 = v28;
                v62[0] = MEMORY[0x1E4F143A8];
                v62[1] = 3221225472;
                v62[2] = __88__HDSharedSummaryManager__addSharedSummary_transactionEntity_databaseTransaction_error___block_invoke;
                v62[3] = &unk_1E62F8320;
                id v63 = v30;
                LOBYTE(v29) = +[HDSharedSummaryEntity enumerateEntitiesWithReuseTransactionID:v29 package:v31 names:v33 databaseTransaction:v63 error:&v64 enumerationHandler:v62];
                id v7 = v64;

                if (v29)
                {
                  id v4 = 0;
                  id v10 = v57;
                  v27 = v50;
                  id v11 = v30;
                  BOOL v34 = 1;
                }
                else
                {
                  id v41 = v7;
                  id v4 = v41;
                  BOOL v34 = v41 == 0;
                  if (v41) {
                    id v42 = v41;
                  }

                  id v10 = v57;
                  v27 = v50;
                  id v11 = v30;
                }
                BOOL v68 = v34;
              }
              else
              {
                id v39 = v28;
                id v4 = v39;
                if (v39) {
                  id v40 = v39;
                }

                BOOL v68 = v4 == 0;
                id v7 = v4;
              }
            }
            else
            {
              id v37 = v24;
              id v4 = v37;
              id v10 = v57;
              if (v37) {
                id v38 = v37;
              }

              BOOL v68 = v4 == 0;
              id v7 = v4;
            }
          }
          else
          {
            id v35 = v20;
            id v4 = v35;
            if (v35) {
              id v36 = v35;
            }

            BOOL v68 = v4 == 0;
            id v7 = v4;
            id v10 = v57;
          }

          LOBYTE(v7) = v68;
        }
        else
        {
          id v4 = 0;
        }

        id v43 = v4;
        if ((v7 & 1) == 0)
        {
          id v46 = v43;
          v47 = v46;
          LODWORD(v4) = v46 == 0;
          if (v46)
          {
            if (v49) {
              void *v49 = v46;
            }
            else {
              _HKLogDroppedError();
            }
          }

          int v45 = 0;
          goto LABEL_39;
        }

        uint64_t v5 = v56 + 1;
      }
      while (v53 != v56 + 1);
      uint64_t v44 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
      uint64_t v53 = v44;
      if (v44) {
        continue;
      }
      break;
    }
  }
  int v45 = 1;
LABEL_39:

  return (v4 | v45) & 1;
}

- (BOOL)addMetadata:(id)a3 transactionEntity:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_opt_class();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__HDSharedSummaryManager_addMetadata_transactionEntity_error___block_invoke;
  v14[3] = &unk_1E62F2AE0;
  id v15 = v9;
  id v16 = v8;
  id v11 = v8;
  id v12 = v9;
  LOBYTE(a5) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v10, a5, v14);

  return (char)a5;
}

BOOL __62__HDSharedSummaryManager_addMetadata_transactionEntity_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = +[HDSharedSummaryTransactionMetadataEntity insertWithTransactionID:metadata:databaseTransaction:error:](HDSharedSummaryTransactionMetadataEntity, "insertWithTransactionID:metadata:databaseTransaction:error:", [v5 persistentID], *(void *)(a1 + 40), v6, a3);

  return v7 != 0;
}

- (BOOL)reuseSharedSummariesWithUUIDs:(id)a3 transactionEntity:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_opt_class();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__HDSharedSummaryManager_reuseSharedSummariesWithUUIDs_transactionEntity_error___block_invoke;
  v14[3] = &unk_1E62F2AE0;
  id v15 = v8;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  LOBYTE(a5) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v10, a5, v14);

  return (char)a5;
}

uint64_t __80__HDSharedSummaryManager_reuseSharedSummariesWithUUIDs_transactionEntity_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v6)
  {
    id v8 = 0;
    int v15 = 1;
    goto LABEL_20;
  }
  uint64_t v7 = v6;
  id v18 = a3;
  id v8 = 0;
  uint64_t v9 = *(void *)v23;
  while (2)
  {
    a3 = 0;
    do
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * (void)a3);
      id v21 = v8;
      id v11 = +[HDSharedSummaryEntity entityWithUUID:databaseTransaction:error:](HDSharedSummaryEntity, "entityWithUUID:databaseTransaction:error:", v10, v5, &v21, v18);
      id v12 = v21;

      if (!v11)
      {
        id v16 = v12;
LABEL_14:
        id v8 = v16;
        if (v16)
        {
          if (v18)
          {
            id v8 = v16;
            LODWORD(a3) = 0;
            *id v18 = v8;
          }
          else
          {
            _HKLogDroppedError();
            LODWORD(a3) = 0;
          }
        }
        else
        {
          LODWORD(a3) = 1;
        }

        int v15 = 0;
        goto LABEL_20;
      }
      id v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "persistentID"));
      id v20 = v12;
      char v14 = [v11 setReuseTransactionID:v13 databaseTransaction:v5 error:&v20];
      id v8 = v20;

      if ((v14 & 1) == 0)
      {
        id v16 = v8;
        goto LABEL_14;
      }

      a3 = (void *)((char *)a3 + 1);
    }
    while ((void *)v7 != a3);
    uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    int v15 = 1;
    if (v7) {
      continue;
    }
    break;
  }
LABEL_20:

  return (v15 | a3) & 1;
}

- (BOOL)reuseSharedSummariesWithPackage:(id)a3 names:(id)a4 transactionEntity:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_opt_class();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__HDSharedSummaryManager_reuseSharedSummariesWithPackage_names_transactionEntity_error___block_invoke;
  v18[3] = &unk_1E62F5A88;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  LOBYTE(a6) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v13, a6, v18);

  return (char)a6;
}

BOOL __88__HDSharedSummaryManager_reuseSharedSummariesWithPackage_names_transactionEntity_error___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  id v25 = 0;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __88__HDSharedSummaryManager_reuseSharedSummariesWithPackage_names_transactionEntity_error___block_invoke_2;
  id v19 = &unk_1E62F8140;
  id v20 = a1[4];
  id v21 = a1[5];
  id v6 = v5;
  id v22 = v6;
  long long v24 = &v26;
  id v23 = a1[6];
  BOOL v7 = +[HDSharedSummaryTransactionEntity enumerateTransactionsWithDatabaseTransaction:v6 includeNonCommitted:0 error:&v25 enumerationHandler:&v16];
  id v8 = v25;
  if (v7)
  {
    unint64_t v9 = v27[3];
    id v10 = a1[5];
    if (v9)
    {
      if (v9 >= [a1[5] count]) {
        goto LABEL_10;
      }
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 118, @"Some summaries not found in package %@ with names %@", a1[4], a1[5], v16, v17, v18, v19, v20, v21, v22);
    }
    else
    {
      if (v10) {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 118, @"No summaries for reuse were found in package %@ with names %@", a1[4], v10, v16, v17, v18, v19, v20, v21, v22);
      }
      else {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 118, @"No summaries for reuse were found in package %@", a1[4]);
      }
    }
    id v12 = (void *)v11;

    id v8 = v12;
  }
LABEL_10:
  id v13 = v8;
  id v14 = v13;
  if (v13)
  {
    if (a3) {
      *a3 = v13;
    }
    else {
      _HKLogDroppedError();
    }
  }

  _Block_object_dispose(&v26, 8);
  return v14 == 0;
}

BOOL __88__HDSharedSummaryManager_reuseSharedSummariesWithPackage_names_transactionEntity_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 persistentID];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = *(void **)(a1 + 48);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__HDSharedSummaryManager_reuseSharedSummariesWithPackage_names_transactionEntity_error___block_invoke_3;
  v13[3] = &unk_1E62F8118;
  id v14 = v8;
  long long v12 = *(_OWORD *)(a1 + 56);
  id v9 = (id)v12;
  long long v15 = v12;
  BOOL v10 = +[HDSharedSummaryEntity enumerateEntitiesWithTransactionID:v5 package:v6 names:v7 databaseTransaction:v14 error:a3 enumerationHandler:v13];

  return v10;
}

uint64_t __88__HDSharedSummaryManager_reuseSharedSummariesWithPackage_names_transactionEntity_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v17 = 0;
  uint64_t v7 = [v5 nameInDatabaseTransaction:v6 error:&v17];
  id v8 = v17;
  id v9 = v8;
  if (!v7)
  {
    id v13 = v8;
    if (v13)
    {
      if (a3)
      {
LABEL_9:
        id v13 = v13;
        uint64_t v14 = 0;
        *a3 = v13;
        goto LABEL_11;
      }
LABEL_6:
      _HKLogDroppedError();
      uint64_t v14 = 0;
LABEL_11:

      goto LABEL_12;
    }
LABEL_10:
    uint64_t v14 = 1;
    goto LABEL_11;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  BOOL v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "persistentID"));
  uint64_t v11 = *(void *)(a1 + 32);
  id v16 = v9;
  char v12 = [v5 setReuseTransactionID:v10 databaseTransaction:v11 error:&v16];
  id v13 = v16;

  if ((v12 & 1) == 0)
  {
    id v13 = v13;
    if (v13)
    {
      if (a3) {
        goto LABEL_9;
      }
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  uint64_t v14 = 1;
LABEL_12:

  return v14;
}

- (BOOL)removeSummariesWithUUIDs:(id)a3 transactionEntity:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = objc_opt_class();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__HDSharedSummaryManager_removeSummariesWithUUIDs_transactionEntity_error___block_invoke;
  v15[3] = &unk_1E62F2E18;
  id v16 = v9;
  id v17 = v10;
  id v18 = self;
  SEL v19 = a2;
  id v12 = v10;
  id v13 = v9;
  LOBYTE(a5) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v11, a5, v15);

  return (char)a5;
}

uint64_t __75__HDSharedSummaryManager_removeSummariesWithUUIDs_transactionEntity_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v28 = [v5 databaseForEntityClass:objc_opt_class()];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v32 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v31 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (!v31)
  {
    id v6 = 0;
    int v18 = 1;
    goto LABEL_43;
  }
  uint64_t v27 = a3;
  id v6 = 0;
  uint64_t v7 = *(void *)v39;
  id v30 = v5;
  while (2)
  {
    for (uint64_t i = 0; i != v31; ++i)
    {
      if (*(void *)v39 != v7) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      id v37 = v6;
      id v10 = +[HDSharedSummaryEntity entityWithUUID:v9 databaseTransaction:v5 error:&v37];
      id v11 = v37;

      if (!v10)
      {
        id v19 = v11;
        id v10 = v19;
        LODWORD(a3) = v19 == 0;
        if (v19)
        {
          if (v27) {
            void *v27 = v19;
          }
          else {
            _HKLogDroppedError();
          }
        }
        id v6 = v10;
        goto LABEL_42;
      }
      id v36 = v11;
      id v12 = [v10 transactionIDInDatabaseTransaction:v5 error:&v36];
      a3 = v36;

      if (!v12)
      {
        id v20 = a3;
        goto LABEL_25;
      }
      uint64_t v13 = [*(id *)(v32 + 40) persistentID];
      if (v13 == [v12 unsignedLongLongValue])
      {
        id v35 = a3;
        char v14 = [v10 deleteFromDatabase:v28 error:&v35];
        id v6 = v35;

        if ((v14 & 1) == 0)
        {
          id v20 = v6;
LABEL_25:
          long long v15 = v20;
          if (v20)
          {
            if (v27)
            {
              long long v15 = v20;
              LODWORD(a3) = 0;
              void *v27 = v15;
            }
            else
            {
              _HKLogDroppedError();
              LODWORD(a3) = 0;
            }
            id v6 = v15;
            goto LABEL_39;
          }
          id v6 = 0;
          goto LABEL_30;
        }
      }
      else
      {
        id v34 = a3;
        long long v15 = [v10 reuseTransactionIDInDatabaseTransaction:v5 error:&v34];
        id v16 = v34;

        if (!v15
          || (uint64_t v17 = [*(id *)(v32 + 40) persistentID], v17 != objc_msgSend(v15, "unsignedLongLongValue")))
        {
          if (v16)
          {
            id v6 = v16;
LABEL_34:
            if (v27)
            {
              id v6 = v6;
              LODWORD(a3) = 0;
              void *v27 = v6;
            }
            else
            {
              _HKLogDroppedError();
              LODWORD(a3) = 0;
            }
LABEL_37:

LABEL_39:
            id v5 = v30;
LABEL_42:

            int v18 = 0;
            goto LABEL_43;
          }
          id v21 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v22 = objc_opt_class();
          uint64_t v23 = *(void *)(v32 + 56);
          long long v24 = [v9 UUIDString];
          id v25 = objc_msgSend(v21, "hk_error:class:selector:format:", 126, v22, v23, @"Summary %@ not in transaction", v24);

          id v6 = v25;
          if (v6) {
            goto LABEL_34;
          }
LABEL_30:
          LODWORD(a3) = 1;
          goto LABEL_39;
        }
        id v33 = v16;
        LODWORD(a3) = [v10 setReuseTransactionID:0 databaseTransaction:v30 error:&v33];
        id v6 = v33;

        if ((a3 & 1) == 0)
        {
          id v6 = v6;
          if (v6) {
            goto LABEL_34;
          }
          LODWORD(a3) = 1;
          goto LABEL_37;
        }

        id v5 = v30;
      }
    }
    int v18 = 1;
    uint64_t v31 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v31) {
      continue;
    }
    break;
  }
LABEL_43:

  return (v18 | a3) & 1;
}

- (BOOL)removeSummariesWithPackage:(id)a3 names:(id)a4 transactionEntity:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = objc_opt_class();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__HDSharedSummaryManager_removeSummariesWithPackage_names_transactionEntity_error___block_invoke;
  v18[3] = &unk_1E62F5A88;
  id v19 = v12;
  id v20 = v10;
  id v21 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  LOBYTE(a6) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v13, a6, v18);

  return (char)a6;
}

BOOL __83__HDSharedSummaryManager_removeSummariesWithPackage_names_transactionEntity_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  id v6 = [v5 databaseForEntityClass:objc_opt_class()];
  uint64_t v7 = [*(id *)(a1 + 32) persistentID];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __83__HDSharedSummaryManager_removeSummariesWithPackage_names_transactionEntity_error___block_invoke_2;
  v31[3] = &unk_1E62F8168;
  id v33 = &v35;
  id v34 = 0;
  id v10 = v6;
  id v32 = v10;
  BOOL v11 = +[HDSharedSummaryEntity enumerateEntitiesWithTransactionID:v7 package:v8 names:v9 databaseTransaction:v5 error:&v34 enumerationHandler:v31];
  id v12 = v34;
  uint64_t v13 = v12;
  if (!v11)
  {
    id v20 = v12;
    id v21 = v20;
    if (v20)
    {
      if (a3)
      {
        id v21 = v20;
        BOOL v22 = 0;
        *a3 = v21;
      }
      else
      {
        _HKLogDroppedError();
        BOOL v22 = 0;
      }
      uint64_t v23 = v21;
    }
    else
    {
      uint64_t v23 = 0;
      BOOL v22 = 1;
    }
    goto LABEL_19;
  }
  uint64_t v14 = [*(id *)(a1 + 32) persistentID];
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 48);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __83__HDSharedSummaryManager_removeSummariesWithPackage_names_transactionEntity_error___block_invoke_3;
  v27[3] = &unk_1E62F8168;
  uint64_t v29 = &v35;
  id v30 = v13;
  id v28 = v5;
  LODWORD(v14) = +[HDSharedSummaryEntity enumerateEntitiesWithReuseTransactionID:v14 package:v15 names:v16 databaseTransaction:v28 error:&v30 enumerationHandler:v27];
  id v17 = v30;

  if (v14)
  {
    unint64_t v18 = v36[3];
    if (!v18)
    {
      id v19 = @"No summaries to remove were found with package %@ and names %@";
      goto LABEL_13;
    }
    if (v18 < [*(id *)(a1 + 48) count])
    {
      id v19 = @"Some summaries to remove were not found with package %@ and names %@";
LABEL_13:
      uint64_t v24 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 118, v19, *(void *)(a1 + 40), *(void *)(a1 + 48));

      id v17 = (id)v24;
    }
  }
  id v25 = v17;
  uint64_t v23 = v25;
  BOOL v22 = v25 == 0;
  if (v25)
  {
    if (a3) {
      *a3 = v25;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v21 = v28;
LABEL_19:

  _Block_object_dispose(&v35, 8);
  return v22;
}

uint64_t __83__HDSharedSummaryManager_removeSummariesWithPackage_names_transactionEntity_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 deleteFromDatabase:*(void *)(a1 + 32) error:a3];
}

uint64_t __83__HDSharedSummaryManager_removeSummariesWithPackage_names_transactionEntity_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 setReuseTransactionID:0 databaseTransaction:*(void *)(a1 + 32) error:a3];
}

- (id)commitTransactionEntity:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  _HKInitializeLogging();
  uint64_t v7 = HKLogSharing();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v8 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Committing transaction", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__35;
  uint64_t v38 = __Block_byref_object_dispose__35;
  id v39 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v9 = objc_opt_class();
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __56__HDSharedSummaryManager_commitTransactionEntity_error___block_invoke;
  BOOL v22 = &unk_1E62F8190;
  id v10 = v6;
  id v23 = v10;
  uint64_t v24 = self;
  id v25 = &v27;
  p_long long buf = &buf;
  if (-[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v9, a4, &v19))
  {
    _HKInitializeLogging();
    BOOL v11 = HKLogSharing();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = objc_opt_class();
      uint64_t v13 = (__CFString *)v28[3];
      *(_DWORD *)uint64_t v31 = 138543618;
      id v32 = v12;
      __int16 v33 = 2048;
      id v34 = v13;
      id v14 = v12;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Successfully committing transaction with %ld summaries", v31, 0x16u);
    }
  }
  else
  {
    _HKInitializeLogging();
    BOOL v11 = HKLogSharing();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (id)objc_opt_class();
      if (a4)
      {
        objc_msgSend(*a4, "localizedDescription", v19, v20, v21, v22);
        uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v16 = @"<lost>";
      }
      *(_DWORD *)uint64_t v31 = 138543618;
      id v32 = v15;
      __int16 v33 = 2114;
      id v34 = v16;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Failed to commit transaction - %{public}@", v31, 0x16u);
      if (a4) {
    }
      }
  }

  id v17 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&buf, 8);

  return v17;
}

BOOL __56__HDSharedSummaryManager_commitTransactionEntity_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) persistentID];
  id v52 = 0;
  BOOL v7 = +[HDSharedSummaryEntity reuseSummariesForTransactionID:v6 databaseTransaction:v5 error:&v52];
  id v8 = v52;
  uint64_t v9 = v8;
  if (v7)
  {
    id v10 = *(void **)(a1 + 32);
    id v51 = v9;
    id v11 = [v10 sourceDeviceIdentiferInDatabaseTransaction:v5 error:&v51];
    id v12 = v51;

    if (v11)
    {
      uint64_t v13 = *(void *)(a1 + 40);
      id v50 = v12;
      id v14 = v5;
      id v15 = v11;
      if (v13)
      {
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __107__HDSharedSummaryManager__deleteCommittedTransactionsWithDatabaseTransaction_sourceDeviceIdentifier_error___block_invoke;
        v53[3] = &unk_1E62F82D0;
        v53[4] = v13;
        id v16 = v14;
        id v54 = v16;
        id v55 = v15;
        BOOL v17 = +[HDSharedSummaryTransactionEntity enumerateTransactionsWithDatabaseTransaction:v16 includeNonCommitted:0 error:&v50 enumerationHandler:v53];
      }
      else
      {
        BOOL v17 = 0;
      }

      id v18 = v50;
      if (v17)
      {
        uint64_t v19 = *(void **)(a1 + 32);
        id v49 = v18;
        char v20 = [v19 setCommitted:1 databaseTransaction:v14 error:&v49];
        id v21 = v49;

        if (v20)
        {
          uint64_t v22 = [*(id *)(a1 + 32) persistentID];
          id v48 = v21;
          id v23 = +[HDSharedSummaryTransactionMetadataEntity metadataForTransactionID:v22 databaseTransaction:v14 error:&v48];
          id v24 = v48;

          if (v23)
          {
            uint64_t v25 = [*(id *)(a1 + 32) persistentID];
            id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
            uint64_t v26 = [WeakRetained database];
            id v47 = v24;
            int64_t v43 = +[HDSharedSummaryEntity countOfObjectsForTransactionID:v25 healthDatabase:v26 error:&v47];
            id v27 = v47;

            *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v43;
            if (v27)
            {
              if (a3)
              {
                id v27 = v27;
                BOOL v28 = 0;
                *a3 = v27;
              }
              else
              {
                _HKLogDroppedError();
                BOOL v28 = 0;
              }
            }
            else
            {
              uint64_t v31 = *(void **)(a1 + 32);
              id v46 = 0;
              id v32 = [v31 uuidInDatabaseTransaction:v14 error:&v46];
              id v33 = v46;
              id v27 = v33;
              if (v32)
              {
                uint64_t v34 = [objc_alloc(MEMORY[0x1E4F2B4B8]) initWithUUID:v32 sourceDeviceIdentifier:v15 metadata:v23];
                uint64_t v35 = *(void *)(*(void *)(a1 + 56) + 8);
                uint64_t v36 = *(void **)(v35 + 40);
                *(void *)(v35 + 40) = v34;

                id v37 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
                uint64_t v38 = [v37 profileType];

                if (v38 == 1)
                {
                  id v39 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
                  uint64_t v40 = [v39 sharingAuthorizationManager];
                  [v40 deleteMarkedSharingAuthorizations];
                }
                v45[0] = MEMORY[0x1E4F143A8];
                v45[1] = 3221225472;
                v45[2] = __56__HDSharedSummaryManager_commitTransactionEntity_error___block_invoke_2;
                v45[3] = &unk_1E62F3208;
                v45[4] = *(void *)(a1 + 40);
                objc_msgSend(v14, "onCommit:orRollback:", v45, 0, v43);
                BOOL v28 = 1;
              }
              else
              {
                id v41 = v33;
                BOOL v28 = v41 == 0;
                if (v41)
                {
                  if (a3) {
                    *a3 = v41;
                  }
                  else {
                    _HKLogDroppedError();
                  }
                }
              }
            }
          }
          else
          {
            id v27 = v24;
            BOOL v28 = v27 == 0;
            if (v27)
            {
              if (a3) {
                *a3 = v27;
              }
              else {
                _HKLogDroppedError();
              }
            }

            id v23 = 0;
          }
          goto LABEL_42;
        }
        id v30 = v21;
      }
      else
      {
        id v30 = v18;
      }
    }
    else
    {
      id v30 = v12;
    }
    id v23 = v30;
    if (v30)
    {
      if (a3)
      {
        id v23 = v30;
        BOOL v28 = 0;
        *a3 = v23;
      }
      else
      {
        _HKLogDroppedError();
        BOOL v28 = 0;
      }
      id v27 = v23;
    }
    else
    {
      id v27 = 0;
      BOOL v28 = 1;
    }
LABEL_42:

    goto LABEL_43;
  }
  id v29 = v8;
  id v11 = v29;
  if (v29)
  {
    if (a3)
    {
      id v11 = v29;
      BOOL v28 = 0;
      *a3 = v11;
    }
    else
    {
      _HKLogDroppedError();
      BOOL v28 = 0;
    }
    id v27 = v11;
  }
  else
  {
    id v27 = 0;
    BOOL v28 = 1;
  }
LABEL_43:

  return v28;
}

uint64_t __56__HDSharedSummaryManager_commitTransactionEntity_error___block_invoke_2(uint64_t a1)
{
  return -[HDSharedSummaryManager _notifyObserversOfTransactionChange](*(void *)(a1 + 32));
}

- (uint64_t)_notifyObserversOfTransactionChange
{
  if (result)
  {
    v1 = *(void **)(result + 24);
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __61__HDSharedSummaryManager__notifyObserversOfTransactionChange__block_invoke;
    v2[3] = &unk_1E62F82F8;
    v2[4] = result;
    return [v1 notifyObservers:v2];
  }
  return result;
}

- (BOOL)discardTransactionEntity:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  _HKInitializeLogging();
  BOOL v7 = HKLogSharing();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v17 = (id)objc_opt_class();
    id v8 = v17;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Discarding transaction", buf, 0xCu);
  }
  uint64_t v9 = objc_opt_class();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__HDSharedSummaryManager_discardTransactionEntity_error___block_invoke;
  v13[3] = &unk_1E62F2AE0;
  id v14 = v6;
  id v15 = self;
  id v10 = v6;
  char v11 = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v9, a4, v13);

  return v11;
}

BOOL __57__HDSharedSummaryManager_discardTransactionEntity_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v12 = 0;
  char v6 = [v5 deleteWithDatabaseTransaction:a2 error:&v12];
  id v7 = v12;
  id v8 = v7;
  if (v6)
  {
    -[HDSharedSummaryManager _notifyObserversOfTransactionChange](*(void *)(a1 + 40));
    BOOL v9 = 1;
  }
  else
  {
    id v10 = v7;
    BOOL v9 = v10 == 0;
    if (v10)
    {
      if (a3) {
        *a3 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v9;
}

- (id)fetchAllTransactionsWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__HDSharedSummaryManager_fetchAllTransactionsWithError___block_invoke;
  v9[3] = &unk_1E62F81B8;
  id v6 = v5;
  id v10 = v6;
  if ([(HDSharedSummaryManager *)self enumerateCommittedTransactionsWithError:a3 handler:v9])
  {
    id v7 = (void *)[v6 copy];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __56__HDSharedSummaryManager_fetchAllTransactionsWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (BOOL)enumerateCommittedTransactionsWithError:(id *)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = objc_opt_class();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__HDSharedSummaryManager_enumerateCommittedTransactionsWithError_handler___block_invoke;
  v10[3] = &unk_1E62F8050;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  LOBYTE(a3) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 0, v7, a3, v10);

  return (char)a3;
}

BOOL __74__HDSharedSummaryManager_enumerateCommittedTransactionsWithError_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__HDSharedSummaryManager_enumerateCommittedTransactionsWithError_handler___block_invoke_2;
  v10[3] = &unk_1E62F81E0;
  id v6 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v7 = v5;
  BOOL v8 = +[HDSharedSummaryTransactionEntity enumerateTransactionsWithDatabaseTransaction:v7 includeNonCommitted:0 error:a3 enumerationHandler:v10];

  return v8;
}

uint64_t __74__HDSharedSummaryManager_enumerateCommittedTransactionsWithError_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = -[HDSharedSummaryManager _transactionForEntity:databaseTransaction:error:](*(void *)(a1 + 32), a2, *(void **)(a1 + 40), a3);
  if (v4) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }

  return 1;
}

- (id)_transactionForEntity:(void *)a3 databaseTransaction:(void *)a4 error:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    id v22 = 0;
    BOOL v9 = [v7 uuidInDatabaseTransaction:v8 error:&v22];
    id v10 = v22;
    id v11 = v10;
    if (!v9)
    {
      id v17 = v10;
      id v12 = v17;
      if (v17)
      {
        if (a4)
        {
          id v12 = v17;
          id v16 = 0;
          *a4 = v12;
        }
        else
        {
          _HKLogDroppedError();
          id v16 = 0;
        }
        id v15 = v12;
      }
      else
      {
        id v15 = 0;
        id v16 = 0;
      }
      goto LABEL_25;
    }
    id v21 = v10;
    id v12 = [v7 sourceDeviceIdentiferInDatabaseTransaction:v8 error:&v21];
    id v13 = v21;

    if (v12)
    {
      id v20 = v13;
      +[HDSharedSummaryTransactionMetadataEntity metadataForTransactionID:databaseTransaction:error:](HDSharedSummaryTransactionMetadataEntity, "metadataForTransactionID:databaseTransaction:error:", [v7 persistentID], v8, &v20);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      id v15 = v20;

      if (v14)
      {
        id v16 = (void *)[objc_alloc(MEMORY[0x1E4F2B4B8]) initWithUUID:v9 sourceDeviceIdentifier:v12 metadata:v14];
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      id v15 = v15;
      if (v15)
      {
        if (a4) {
          *a4 = v15;
        }
        else {
          _HKLogDroppedError();
        }
      }

      id v14 = 0;
    }
    else
    {
      id v18 = v13;
      id v14 = v18;
      if (v18)
      {
        if (a4)
        {
          id v14 = v18;
          id v16 = 0;
          *a4 = v14;
        }
        else
        {
          _HKLogDroppedError();
          id v16 = 0;
        }
        id v15 = v14;
        goto LABEL_24;
      }
      id v15 = 0;
    }
    id v16 = 0;
    goto LABEL_24;
  }
  id v16 = 0;
LABEL_26:

  return v16;
}

- (BOOL)enumerateNonCommittedTransactionsWithError:(id *)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = objc_opt_class();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__HDSharedSummaryManager_enumerateNonCommittedTransactionsWithError_handler___block_invoke;
  v10[3] = &unk_1E62F8050;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  LOBYTE(a3) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 0, v7, a3, v10);

  return (char)a3;
}

BOOL __77__HDSharedSummaryManager_enumerateNonCommittedTransactionsWithError_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__HDSharedSummaryManager_enumerateNonCommittedTransactionsWithError_handler___block_invoke_2;
  v11[3] = &unk_1E62F81E0;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = v6;
  id v14 = v7;
  id v8 = v5;
  BOOL v9 = +[HDSharedSummaryTransactionEntity enumerateTransactionsWithDatabaseTransaction:v8 includeNonCommitted:1 error:a3 enumerationHandler:v11];

  return v9;
}

BOOL __77__HDSharedSummaryManager_enumerateNonCommittedTransactionsWithError_handler___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = a1[4];
  id v21 = 0;
  char v7 = [v5 committedInDatabaseTransaction:v6 error:&v21];
  id v8 = v21;
  if (v8)
  {
    id v9 = v8;
    if (a3)
    {
      id v9 = v8;
      BOOL v10 = 0;
      *a3 = v9;
    }
    else
    {
      _HKLogDroppedError();
      BOOL v10 = 0;
    }
LABEL_20:

    goto LABEL_21;
  }
  if ((v7 & 1) == 0)
  {
    id v12 = (void *)a1[4];
    uint64_t v11 = a1[5];
    id v20 = 0;
    uint64_t v13 = -[HDSharedSummaryManager _transactionForEntity:databaseTransaction:error:](v11, v5, v12, &v20);
    id v14 = v20;
    id v15 = v14;
    if (v13)
    {
      uint64_t v16 = a1[4];
      id v19 = v14;
      id v17 = [v5 creationDateInDatabaseTransaction:v16 error:&v19];
      id v9 = v19;

      if (v17)
      {
        [v13 _setCreationDate:v17];
        (*(void (**)(void))(a1[6] + 16))();

        BOOL v10 = 1;
      }
      else
      {
        id v9 = v9;
        BOOL v10 = v9 == 0;
        if (v9)
        {
          if (a3) {
            *a3 = v9;
          }
          else {
            _HKLogDroppedError();
          }
        }
      }
    }
    else
    {
      id v9 = v14;
      BOOL v10 = v9 == 0;
      if (v9)
      {
        if (a3) {
          *a3 = v9;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    goto LABEL_20;
  }
  BOOL v10 = 1;
LABEL_21:

  return v10;
}

- (BOOL)enumerateSummariesInTransaction:(id)a3 package:(id)a4 names:(id)a5 includedObjectTypes:(id)a6 error:(id *)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = objc_opt_class();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __106__HDSharedSummaryManager_enumerateSummariesInTransaction_package_names_includedObjectTypes_error_handler___block_invoke;
  v26[3] = &unk_1E62F8230;
  id v27 = v14;
  id v28 = v15;
  id v29 = v16;
  id v30 = v17;
  id v31 = v18;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  LOBYTE(a7) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 0, v19, a7, v26);

  return (char)a7;
}

BOOL __106__HDSharedSummaryManager_enumerateSummariesInTransaction_package_names_includedObjectTypes_error_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) UUID];
  id v28 = 0;
  char v7 = +[HDSharedSummaryTransactionEntity transactionEntityWithUUID:v6 databaseTransaction:v5 error:&v28];
  id v8 = v28;

  if (v7)
  {
    uint64_t v9 = [v7 persistentID];
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = [*(id *)(a1 + 48) allObjects];
    uint64_t v12 = *(void *)(a1 + 56);
    id v27 = v8;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __106__HDSharedSummaryManager_enumerateSummariesInTransaction_package_names_includedObjectTypes_error_handler___block_invoke_2;
    v24[3] = &unk_1E62F8208;
    id v25 = *(id *)(a1 + 32);
    id v26 = *(id *)(a1 + 64);
    BOOL v13 = +[HDSharedSummaryEntity enumerateSummariesWithTransactionID:v9 package:v10 names:v11 includedObjectTypes:v12 databaseTransaction:v5 error:&v27 enumerationHandler:v24];
    id v14 = v27;

    if (v13)
    {
      BOOL v15 = 1;
    }
    else
    {
      id v17 = v14;
      id v18 = v17;
      BOOL v15 = v17 == 0;
      if (v17)
      {
        if (a3) {
          *a3 = v17;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    id v16 = v25;
  }
  else
  {
    if (v8)
    {
      id v16 = v8;
    }
    else
    {
      id v19 = (void *)MEMORY[0x1E4F28C58];
      id v20 = [*(id *)(a1 + 32) UUID];
      id v21 = [v20 UUIDString];
      id v22 = objc_msgSend(v19, "hk_error:format:", 118, @"Transaction with UUID %@ not found", v21);

      id v16 = v22;
      if (!v16)
      {
        id v14 = 0;
        BOOL v15 = 1;
        goto LABEL_18;
      }
    }
    if (a3)
    {
      id v16 = v16;
      BOOL v15 = 0;
      *a3 = v16;
    }
    else
    {
      _HKLogDroppedError();
      BOOL v15 = 0;
    }
    id v14 = v16;
  }

LABEL_18:
  return v15;
}

uint64_t __106__HDSharedSummaryManager_enumerateSummariesInTransaction_package_names_includedObjectTypes_error_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 _setTransaction:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  return 1;
}

- (BOOL)enumerateSummariesInTransactionEntity:(id)a3 package:(id)a4 names:(id)a5 error:(id *)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = objc_opt_class();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __92__HDSharedSummaryManager_enumerateSummariesInTransactionEntity_package_names_error_handler___block_invoke;
  v22[3] = &unk_1E62F8280;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  LOBYTE(a6) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 0, v16, a6, v22);

  return (char)a6;
}

BOOL __92__HDSharedSummaryManager_enumerateSummariesInTransactionEntity_package_names_error_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 persistentID];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__HDSharedSummaryManager_enumerateSummariesInTransactionEntity_package_names_error_handler___block_invoke_2;
  v12[3] = &unk_1E62F8258;
  id v13 = *(id *)(a1 + 56);
  BOOL v10 = +[HDSharedSummaryEntity enumerateSummariesWithTransactionID:v7 package:v8 names:v9 includedObjectTypes:0 databaseTransaction:v6 error:a3 enumerationHandler:v12];

  return v10;
}

uint64_t __92__HDSharedSummaryManager_enumerateSummariesInTransactionEntity_package_names_error_handler___block_invoke_2(uint64_t a1)
{
  return 1;
}

- (id)mostRecentTransactionCreationDateWithError:(id *)a3
{
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__35;
  id v13 = __Block_byref_object_dispose__35;
  id v14 = 0;
  id v5 = objc_opt_class();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__HDSharedSummaryManager_mostRecentTransactionCreationDateWithError___block_invoke;
  v8[3] = &unk_1E62F82A8;
  v8[4] = &v9;
  if (-[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 0, v5, a3, v8)) {
    id v6 = (id)v10[5];
  }
  else {
    id v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __69__HDSharedSummaryManager_mostRecentTransactionCreationDateWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = 0;
  uint64_t v5 = +[HDSharedSummaryTransactionEntity mostRecentTransactionCreationDateWithDatabaseTransaction:a2 error:&v12];
  id v6 = v12;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v6 == 0;
  }
  uint64_t v10 = v9;
  if (!v9)
  {
    if (a3) {
      *a3 = v6;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v10;
}

- (void)registerObserver:(id)a3
{
}

- (void)unregisterObserver:(id)a3
{
}

- (BOOL)prepareAndCommitTransactionWithUUID:(id)a3 sourceDeviceIdentifier:(id)a4 metadata:(id)a5 sharedSummaries:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v24 = 0;
  id v13 = [(HDSharedSummaryManager *)self createReceivedTransactionWithUUID:a3 sourceDeviceIdentifier:a4 metadata:a5 error:&v24];
  id v14 = v24;
  id v15 = v14;
  if (!v13)
  {
    id v18 = v14;
    if (v18)
    {
      if (!a7)
      {
LABEL_12:
        _HKLogDroppedError();
        BOOL v20 = 0;
        id v19 = v18;
        goto LABEL_17;
      }
LABEL_9:
      id v18 = v18;
      BOOL v20 = 0;
      *a7 = v18;
      id v19 = v18;
      goto LABEL_17;
    }
LABEL_13:
    id v19 = 0;
    goto LABEL_14;
  }
  id v23 = v14;
  BOOL v16 = [(HDSharedSummaryManager *)self addOrReuseReceivedSharedSummaries:v12 transactionEntity:v13 error:&v23];
  id v17 = v23;

  if (!v16)
  {
    id v18 = v17;
    if (v18)
    {
      if (!a7) {
        goto LABEL_12;
      }
      goto LABEL_9;
    }
    goto LABEL_13;
  }
  id v22 = v17;
  id v18 = [(HDSharedSummaryManager *)self commitTransactionEntity:v13 error:&v22];
  id v19 = v22;

  if (v18)
  {
LABEL_14:
    BOOL v20 = 1;
    goto LABEL_17;
  }
  id v19 = v19;
  BOOL v20 = v19 == 0;
  if (v19)
  {
    if (a7) {
      *a7 = v19;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v18 = 0;
LABEL_17:

  return v20;
}

- (id)createReceivedTransactionWithUUID:(id)a3 sourceDeviceIdentifier:(id)a4 metadata:(id)a5 error:(id *)a6
{
  return -[HDSharedSummaryManager _createTransactionWithUUID:sourceDeviceIdentifier:metadata:error:](self, a3, a4, a5, a6);
}

- (BOOL)addOrReuseReceivedSharedSummaries:(id)a3 transactionEntity:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_opt_class();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__HDSharedSummaryManager_addOrReuseReceivedSharedSummaries_transactionEntity_error___block_invoke;
  v14[3] = &unk_1E62F5A88;
  id v15 = v8;
  BOOL v16 = self;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  LOBYTE(a5) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v10, a5, v14);

  return (char)a5;
}

uint64_t __84__HDSharedSummaryManager_addOrReuseReceivedSharedSummaries_transactionEntity_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v30 = a1;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (!v6)
  {
    int v19 = 1;
    goto LABEL_38;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v35;
  id v28 = v5;
  id v29 = v4;
  while (2)
  {
    a1 = 0;
    do
    {
      if (*(void *)v35 != v8) {
        objc_enumerationMutation(v5);
      }
      id v9 = *(void **)(*((void *)&v34 + 1) + 8 * a1);
      uint64_t v10 = [v9 UUID];
      id v33 = 0;
      id v11 = +[HDSharedSummaryEntity entityWithUUID:v10 databaseTransaction:v4 error:&v33];
      id v12 = v33;

      if (!v11)
      {
        if (objc_msgSend(v12, "hk_isObjectNotFoundError"))
        {
          id v15 = *(void **)(v30 + 40);
          uint64_t v38 = v9;
          BOOL v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
          uint64_t v17 = *(void *)(v30 + 48);
          id v32 = 0;
          LODWORD(v15) = [v15 addSharedSummaries:v16 transactionEntity:v17 error:&v32];
          id v18 = v32;

          if (!v15)
          {
            id v25 = v18;
            id v22 = v25;
            if (v25)
            {
              if (a3)
              {
                id v22 = v25;
                LODWORD(a1) = 0;
                *a3 = v22;
              }
              else
              {
                _HKLogDroppedError();
                LODWORD(a1) = 0;
              }
              id v11 = v22;
            }
            else
            {
              id v11 = 0;
              LODWORD(a1) = 1;
            }
            id v5 = v28;
            id v4 = v29;
            goto LABEL_36;
          }

          id v4 = v29;
          id v5 = v28;
          goto LABEL_13;
        }
        id v24 = v12;
        if (!v12)
        {
          LODWORD(a1) = 1;
LABEL_37:

          int v19 = 0;
          goto LABEL_38;
        }
LABEL_22:
        id v23 = a3;
        if (!a3)
        {
          _HKLogDroppedError();
          LODWORD(a1) = 0;
          id v22 = v12;
          goto LABEL_36;
        }
        id v21 = v12;
LABEL_24:
        id v22 = v21;
        LODWORD(a1) = 0;
        *id v23 = v22;
        id v12 = v22;
LABEL_36:

        goto LABEL_37;
      }
      if (v12)
      {
        id v20 = v12;
        goto LABEL_22;
      }
      id v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(v30 + 48), "persistentID"));
      id v31 = 0;
      char v14 = [v11 setReuseTransactionID:v13 databaseTransaction:v4 error:&v31];
      id v12 = v31;

      if ((v14 & 1) == 0)
      {
        id v21 = v12;
        id v22 = v21;
        if (!v21)
        {
          id v12 = 0;
          LODWORD(a1) = 1;
          goto LABEL_36;
        }
        id v23 = a3;
        if (!a3)
        {
          _HKLogDroppedError();
          LODWORD(a1) = 0;
          id v12 = v22;
          goto LABEL_36;
        }
        goto LABEL_24;
      }
LABEL_13:

      ++a1;
    }
    while (v7 != a1);
    uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
    int v19 = 1;
    if (v7) {
      continue;
    }
    break;
  }
LABEL_38:

  return (v19 | a1) & 1;
}

BOOL __91__HDSharedSummaryManager__createTransactionWithUUID_sourceDeviceIdentifier_metadata_error___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a1[4];
  uint64_t v6 = a1[5];
  id v14 = 0;
  uint64_t v7 = +[HDSharedSummaryTransactionEntity insertWithUUID:v5 sourceDevice:v6 databaseTransaction:a2 error:&v14];
  id v8 = v14;
  uint64_t v9 = *(void *)(a1[6] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;

  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    BOOL v11 = 1;
  }
  else
  {
    id v12 = v8;
    BOOL v11 = v12 == 0;
    if (v12)
    {
      if (a3) {
        *a3 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v11;
}

- (BOOL)deleteAllTransactionsWithError:(id *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v5 = HKLogSharing();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = (id)objc_opt_class();
    id v6 = v10;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Deleting all transactions", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = objc_opt_class();
  return -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v7, a3, &__block_literal_global_41);
}

uint64_t __57__HDSharedSummaryManager_deleteAllTransactionsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v13 = 0;
  BOOL v5 = +[HDSharedSummaryTransactionEntity deleteAllEntriesWithDatabaseTransaction:v4 error:&v13];
  id v6 = v13;
  uint64_t v7 = v6;
  if (!v5)
  {
    id v9 = v6;
    if (v9)
    {
      if (!a3)
      {
LABEL_9:
        _HKLogDroppedError();
        uint64_t v10 = 0;
        goto LABEL_11;
      }
LABEL_6:
      id v9 = v9;
      uint64_t v10 = 0;
      *a3 = v9;
LABEL_11:

      goto LABEL_12;
    }
LABEL_10:
    uint64_t v10 = 1;
    goto LABEL_11;
  }
  id v12 = v6;
  BOOL v8 = +[HDSharedSummaryEntity deleteAllSummariesWithDatabaseTransaction:v4 error:&v12];
  id v9 = v12;

  if (!v8)
  {
    id v9 = v9;
    if (v9)
    {
      if (!a3) {
        goto LABEL_9;
      }
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  uint64_t v10 = 1;
LABEL_12:

  return v10;
}

- (BOOL)deleteTransactions:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  _HKInitializeLogging();
  uint64_t v7 = HKLogSharing();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = objc_opt_class();
    id v9 = v8;
    *(_DWORD *)long long buf = 138543618;
    id v18 = v8;
    __int16 v19 = 2048;
    uint64_t v20 = [v6 count];
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Deleting %ld transactions", buf, 0x16u);
  }
  uint64_t v10 = objc_opt_class();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__HDSharedSummaryManager_deleteTransactions_error___block_invoke;
  v14[3] = &unk_1E62F2AE0;
  id v15 = v6;
  BOOL v16 = self;
  id v11 = v6;
  char v12 = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v10, a4, v14);

  return v12;
}

uint64_t __51__HDSharedSummaryManager_deleteTransactions_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v16 = a1;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v19 + 1) + 8 * v10) UUID];
        id v18 = 0;
        char v12 = +[HDSharedSummaryTransactionEntity transactionEntityWithUUID:v11 databaseTransaction:v5 error:&v18];
        id v13 = v18;

        if (v12)
        {
          if (![v12 deleteWithDatabaseTransaction:v5 error:a3]) {
            goto LABEL_16;
          }
        }
        else if (v13)
        {
          if (a3) {
            *a3 = v13;
          }
          else {
            _HKLogDroppedError();
          }
LABEL_16:

          uint64_t v14 = 0;
          goto LABEL_17;
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__HDSharedSummaryManager_deleteTransactions_error___block_invoke_2;
  v17[3] = &unk_1E62F3208;
  v17[4] = *(void *)(v16 + 40);
  [v5 onCommit:v17 orRollback:0];
  uint64_t v14 = 1;
LABEL_17:

  return v14;
}

uint64_t __51__HDSharedSummaryManager_deleteTransactions_error___block_invoke_2(uint64_t a1)
{
  return -[HDSharedSummaryManager _notifyObserversOfTransactionChange](*(void *)(a1 + 32));
}

- (id)unitTest_transactionForEntity:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  return -[HDSharedSummaryManager _transactionForEntity:databaseTransaction:error:]((uint64_t)self, a3, a4, a5);
}

- (id)deviceIdentifierWithError:(id *)a3
{
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
  {
    id v4 = deviceIdentifier;
    goto LABEL_19;
  }
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v9 = [WeakRetained sourceManager];
  id v20 = 0;
  uint64_t v10 = [v9 localDeviceSourceWithError:&v20];
  id v11 = v20;

  if (!v10)
  {
    id v17 = v11;
    id v13 = v17;
    if (v17)
    {
      if (a3)
      {
        id v13 = v17;
        id v4 = 0;
        *a3 = v13;
      }
      else
      {
        _HKLogDroppedError();
        id v4 = 0;
      }
      id v14 = v13;
      goto LABEL_18;
    }
    id v14 = 0;
    goto LABEL_17;
  }
  id v12 = objc_loadWeakRetained((id *)p_profile);
  id v19 = v11;
  id v13 = [v10 sourceWithProfile:v12 error:&v19];
  id v14 = v19;

  if (!v13)
  {
    id v14 = v14;
    if (v14)
    {
      if (a3) {
        *a3 = v14;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v13 = 0;
LABEL_17:
    id v4 = 0;
    goto LABEL_18;
  }
  id v15 = [v13 bundleIdentifier];
  uint64_t v16 = self->_deviceIdentifier;
  self->_deviceIdentifier = v15;

  id v4 = self->_deviceIdentifier;
LABEL_18:

LABEL_19:

  return v4;
}

uint64_t __107__HDSharedSummaryManager__deleteCommittedTransactionsWithDatabaseTransaction_sourceDeviceIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v7 = [WeakRetained profileType];

  if (v7 == 1)
  {
LABEL_4:
    uint64_t v13 = [v5 deleteWithDatabaseTransaction:*(void *)(a1 + 40) error:a3];
    goto LABEL_11;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  id v16 = 0;
  uint64_t v9 = [v5 sourceDeviceIdentiferInDatabaseTransaction:v8 error:&v16];
  id v10 = v16;
  id v11 = v10;
  if (v9)
  {
    int v12 = [*(id *)(a1 + 48) isEqualToString:v9];

    if (!v12)
    {
      uint64_t v13 = 1;
      goto LABEL_11;
    }
    goto LABEL_4;
  }
  id v14 = v10;
  uint64_t v13 = v14 == 0;
  if (v14)
  {
    if (a3) {
      *a3 = v14;
    }
    else {
      _HKLogDroppedError();
    }
  }

LABEL_11:
  return v13;
}

uint64_t __61__HDSharedSummaryManager__notifyObserversOfTransactionChange__block_invoke(uint64_t a1, void *a2)
{
  return [a2 sharedSummaryManagerCommittedTransactionsDidChange:*(void *)(a1 + 32)];
}

uint64_t __88__HDSharedSummaryManager__addSharedSummary_transactionEntity_databaseTransaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 setReuseTransactionID:0 databaseTransaction:*(void *)(a1 + 32) error:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end