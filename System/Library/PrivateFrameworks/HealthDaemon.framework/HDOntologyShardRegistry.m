@interface HDOntologyShardRegistry
+ (BOOL)_rawEnumerateEntriesWithPredicate:(void *)a3 orderingTerms:(void *)a4 transaction:(uint64_t)a5 error:(void *)a6 enumerationHandler:;
+ (BOOL)insertEntry:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)importedMercuryZipTSVEntriesWithTransaction:(id)a3 error:(id *)a4;
+ (id)nextAvailableMercuryZipTSVSlotWithTransaction:(id)a3 error:(id *)a4;
+ (uint64_t)_deleteStagedFileWithURL:(void *)a3 fileManager:(void *)a4 error:;
+ (uint64_t)_deleteStagedFilesForEntry:(void *)a3 stagingDirectory:(void *)a4 fileManager:(void *)a5 error:;
+ (uint64_t)_enumerateStagedShardFileURLsWithFileManager:(void *)a3 stagingDirectory:(void *)a4 error:(void *)a5 handler:;
+ (uint64_t)_isCacheableEntry:(uint64_t)a1;
- (BOOL)copyToStagingDirectoryFileWithLocalURL:(id)a3 entry:(id)a4 error:(id *)a5;
- (BOOL)deleteStagedFilesNotMatchingEntries:(id)a3 error:(id *)a4;
- (BOOL)deleteStagedShardFileForEntry:(id)a3 error:(id *)a4;
- (BOOL)entryWithIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 entryOut:(id *)a6 transaction:(id)a7 error:(id *)a8;
- (BOOL)enumerateEntriesWithPredicate:(id)a3 orderingTerms:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
- (BOOL)insertEntries:(id)a3 error:(id *)a4;
- (BOOL)insertEntry:(id)a3 error:(id *)a4;
- (BOOL)moveStagedShardFileForEntry:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)stageShardFileWithLocalURL:(id)a3 entry:(id)a4 error:(id *)a5;
- (BOOL)stagedShardFileEntryForEntry:(id)a3 entryOut:(id *)a4 error:(id *)a5;
- (BOOL)unitTesting_stageFileWithLocalURL:(id)a3 error:(id *)a4;
- (BOOL)unzipStagedShardFileForEntry:(id)a3 toURL:(id)a4 error:(id *)a5;
- (HDDaemon)daemon;
- (HDOntologyShardRegistry)init;
- (HDOntologyShardRegistry)initWithOntologyUpdateCoordinator:(id)a3;
- (HDOntologyUpdateCoordinator)updateCoordinator;
- (id)_openFileHandleForEntry:(uint64_t)a3 error:;
- (id)_stagedShardFileURLForEntry:(id *)a1;
- (id)entriesWithPredicate:(id)a3 orderingTerms:(id)a4 error:(id *)a5;
- (id)openShardFileForEntry:(id)a3 error:(id *)a4;
- (id)stagedShardFileEntriesWithError:(id *)a3;
- (id)takeFileHandleAssertionForOwnerIdentifier:(id)a3 error:(id *)a4;
- (id)unitTesting_cachedFileHandles;
- (id)unitTesting_stagedShardFileFullPathForEntry:(id)a3;
- (id)unitTesting_stagedShardFileNamesWithError:(id *)a3;
- (int64_t)purgeSpaceForStagedShards;
- (int64_t)purgeableSpaceForStagedShards;
- (uint64_t)_enumerateEntriesWithPredicate:(void *)a3 orderingTerms:(void *)a4 transaction:(uint64_t)a5 error:(void *)a6 enumerationHandler:;
- (uint64_t)_enumerateStagedShardFileEntriesWithWithError:(void *)a3 handler:;
- (uint64_t)_stageShardFileWithLocalURL:(void *)a3 entry:(char)a4 shouldCopy:(void *)a5 error:;
- (void)_assertionQueue_closeFileHandles;
- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4;
- (void)dealloc;
@end

@implementation HDOntologyShardRegistry

- (HDOntologyShardRegistry)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDOntologyShardRegistry)initWithOntologyUpdateCoordinator:(id)a3
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HDOntologyShardRegistry;
  v5 = [(HDOntologyShardRegistry *)&v19 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_updateCoordinator, v4);
    id v7 = v4;
    self;
    v8 = (void *)MEMORY[0x1E4F1CB10];
    v9 = [v7 daemon];

    v10 = [v9 healthDirectoryPath];
    v20[0] = v10;
    v20[1] = @"ontology";
    v20[2] = @"staging";
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
    uint64_t v12 = [v8 fileURLWithPathComponents:v11];

    stagingDirectoryURL = v6->_stagingDirectoryURL;
    v6->_stagingDirectoryURL = (NSURL *)v12;

    uint64_t v14 = HKCreateSerialDispatchQueue();
    cachedFileHandlesAssertionQueue = v6->_cachedFileHandlesAssertionQueue;
    v6->_cachedFileHandlesAssertionQueue = (OS_dispatch_queue *)v14;

    v16 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E4F65CD0]);
    cachedFileHandlesAssertionManager = v6->_cachedFileHandlesAssertionManager;
    v6->_cachedFileHandlesAssertionManager = v16;

    [(HDAssertionManager *)v6->_cachedFileHandlesAssertionManager addObserver:v6 forAssertionIdentifier:@"OntologyShardRegistryAssertionIdentifierCachedFileHandles" queue:v6->_cachedFileHandlesAssertionQueue];
  }

  return v6;
}

- (void)dealloc
{
  [(HDAssertionManager *)self->_cachedFileHandlesAssertionManager invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDOntologyShardRegistry;
  [(HDOntologyShardRegistry *)&v3 dealloc];
}

- (HDDaemon)daemon
{
  v2 = [(HDOntologyShardRegistry *)self updateCoordinator];
  objc_super v3 = [v2 daemon];

  return (HDDaemon *)v3;
}

- (BOOL)insertEntry:(id)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  v8 = [v6 arrayWithObjects:&v10 count:1];

  LOBYTE(a4) = -[HDOntologyShardRegistry insertEntries:error:](self, "insertEntries:error:", v8, a4, v10, v11);
  return (char)a4;
}

- (BOOL)insertEntries:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v8 = [_HDOntologyShardRegistryInsertOperation alloc];
  id v9 = v7;
  if (v8)
  {
    v15.receiver = v8;
    v15.super_class = (Class)_HDOntologyShardRegistryInsertOperation;
    id v10 = [(HDOntologyShardRegistry *)&v15 init];
    v8 = (_HDOntologyShardRegistryInsertOperation *)v10;
    if (v10) {
      objc_storeStrong((id *)&v10->_cachedFileHandlesAssertionQueue, a3);
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateCoordinator);
  uint64_t v12 = [WeakRetained profile];
  BOOL v13 = [(HDJournalableOperation *)v8 performOrJournalWithProfile:v12 error:a4];

  return v13;
}

+ (BOOL)insertEntry:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = [a4 graphDatabase];
  id v9 = [v8 underlyingDatabase];
  LOBYTE(a5) = +[HDOntologyShardRegistryEntity insertEntry:v7 database:v9 error:a5];

  return (char)a5;
}

- (BOOL)entryWithIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 entryOut:(id *)a6 transaction:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  v17 = HDOntologyShardRegistryPredicateForEntry((uint64_t)v14, v15, a5);
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__43;
  v27 = __Block_byref_object_dispose__43;
  id v28 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __99__HDOntologyShardRegistry_entryWithIdentifier_schemaType_schemaVersion_entryOut_transaction_error___block_invoke;
  v22[3] = &unk_1E62F91F8;
  v22[4] = &v23;
  char v18 = -[HDOntologyShardRegistry _enumerateEntriesWithPredicate:orderingTerms:transaction:error:enumerationHandler:](self, v17, 0, v16, (uint64_t)a8, v22);
  BOOL v19 = v18;
  if (a6) {
    char v20 = v18;
  }
  else {
    char v20 = 0;
  }
  if (v20) {
    *a6 = (id) v24[5];
  }
  _Block_object_dispose(&v23, 8);

  return v19;
}

uint64_t __99__HDOntologyShardRegistry_entryWithIdentifier_schemaType_schemaVersion_entryOut_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (uint64_t)_enumerateEntriesWithPredicate:(void *)a3 orderingTerms:(void *)a4 transaction:(uint64_t)a5 error:(void *)a6 enumerationHandler:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (a1)
  {
    if (v13) {
      uint64_t v15 = +[HDOntologyShardRegistry _rawEnumerateEntriesWithPredicate:orderingTerms:transaction:error:enumerationHandler:]((uint64_t)HDOntologyShardRegistry, v11, v12, v13, a5, v14);
    }
    else {
      uint64_t v15 = [a1 enumerateEntriesWithPredicate:v11 orderingTerms:v12 error:a5 enumerationHandler:v14];
    }
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)entriesWithPredicate:(id)a3 orderingTerms:(id)a4 error:(id *)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__HDOntologyShardRegistry_entriesWithPredicate_orderingTerms_error___block_invoke;
  v16[3] = &unk_1E62F9220;
  id v17 = v11;
  id v12 = v11;
  LODWORD(a5) = [(HDOntologyShardRegistry *)self enumerateEntriesWithPredicate:v10 orderingTerms:v9 error:a5 enumerationHandler:v16];

  if (a5) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  return v14;
}

uint64_t __68__HDOntologyShardRegistry_entriesWithPredicate_orderingTerms_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (BOOL)enumerateEntriesWithPredicate:(id)a3 orderingTerms:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateCoordinator);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __96__HDOntologyShardRegistry_enumerateEntriesWithPredicate_orderingTerms_error_enumerationHandler___block_invoke;
  v18[3] = &unk_1E62F9248;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  LOBYTE(a5) = [WeakRetained performOntologyTransactionForWrite:0 databaseTransaction:0 error:a5 transactionHandler:v18];

  return (char)a5;
}

uint64_t __96__HDOntologyShardRegistry_enumerateEntriesWithPredicate_orderingTerms_error_enumerationHandler___block_invoke(void **a1, void *a2, uint64_t a3)
{
  return -[HDOntologyShardRegistry _enumerateEntriesWithPredicate:orderingTerms:transaction:error:enumerationHandler:](a1[4], a1[5], a1[6], a2, a3, a1[7]);
}

+ (id)nextAvailableMercuryZipTSVSlotWithTransaction:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v6 = *MEMORY[0x1E4F2A2F8];
  id v7 = a3;
  v8 = [v5 predicateWithProperty:@"schema_type" equalToValue:v6];
  id v9 = [v7 graphDatabase];

  id v10 = [v9 underlyingDatabase];
  id v11 = +[HDOntologyShardRegistryEntity nextAvailableSlotInAllowedRange:predicate:database:error:](HDOntologyShardRegistryEntity, "nextAvailableSlotInAllowedRange:predicate:database:error:", 0, 64, v8, v10, a4);

  return v11;
}

+ (id)importedMercuryZipTSVEntriesWithTransaction:(id)a3 error:(id *)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1E4F65D00];
  id v7 = a3;
  v8 = [v6 predicateWithProperty:@"current_version" greaterThanValue:&unk_1F17EB3E8];
  v19[0] = v8;
  id v9 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"schema_type" equalToValue:*MEMORY[0x1E4F2A2F8]];
  v19[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];

  id v11 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v10];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__HDOntologyShardRegistry_importedMercuryZipTSVEntriesWithTransaction_error___block_invoke;
  v17[3] = &unk_1E62F9220;
  id v18 = v12;
  id v13 = v12;
  LODWORD(a4) = +[HDOntologyShardRegistry _rawEnumerateEntriesWithPredicate:orderingTerms:transaction:error:enumerationHandler:]((uint64_t)a1, v11, 0, v7, (uint64_t)a4, v17);

  if (a4) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  return v15;
}

uint64_t __77__HDOntologyShardRegistry_importedMercuryZipTSVEntriesWithTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (BOOL)_rawEnumerateEntriesWithPredicate:(void *)a3 orderingTerms:(void *)a4 transaction:(uint64_t)a5 error:(void *)a6 enumerationHandler:
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  self;
  id v14 = [v11 graphDatabase];

  id v15 = [v14 underlyingDatabase];
  BOOL v16 = +[HDOntologyShardRegistryEntity enumerateEntriesWithPredicate:v13 orderingTerms:v12 database:v15 error:a5 enumerationHandler:v10];

  return v16;
}

- (id)takeFileHandleAssertionForOwnerIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F65CC8]) initWithAssertionIdentifier:@"OntologyShardRegistryAssertionIdentifierCachedFileHandles" ownerIdentifier:v6];
  if ([(HDAssertionManager *)self->_cachedFileHandlesAssertionManager takeAssertion:v7])
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 1;
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__43;
    id v18 = __Block_byref_object_dispose__43;
    id v19 = 0;
    cachedFileHandlesAssertionQueue = self->_cachedFileHandlesAssertionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__HDOntologyShardRegistry_takeFileHandleAssertionForOwnerIdentifier_error___block_invoke;
    block[3] = &unk_1E62F9270;
    block[4] = self;
    block[5] = &v20;
    block[6] = &v14;
    dispatch_sync(cachedFileHandlesAssertionQueue, block);
    if (*((unsigned char *)v21 + 24))
    {
      id v9 = v7;
    }
    else
    {
      [v7 invalidate];
      id v10 = (id)v15[5];
      id v11 = v10;
      if (v10)
      {
        if (a4) {
          *a4 = v10;
        }
        else {
          _HKLogDroppedError();
        }
      }

      id v9 = 0;
    }
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    [v7 invalidate];
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 100, @"Unable to take assertion /'%@/' for owner %@", @"OntologyShardRegistryAssertionIdentifierCachedFileHandles", v6);
    id v9 = 0;
  }

  return v9;
}

void __75__HDOntologyShardRegistry_takeFileHandleAssertionForOwnerIdentifier_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v3 + 40);
  v5 = (id *)(v3 + 40);
  id v4 = v6;
  id obj = v6;
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
    if (!*(void *)(v2 + 32))
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v8 = *(void **)(v2 + 32);
      *(void *)(v2 + 32) = v7;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__HDOntologyShardRegistry__assertionQueue_openFileHandlesWithError___block_invoke;
    v10[3] = &unk_1E62F9298;
    v10[4] = v2;
    LOBYTE(v2) = -[HDOntologyShardRegistry _enumerateStagedShardFileEntriesWithWithError:handler:](v2, &obj, v10);
    id v4 = obj;
  }
  objc_storeStrong(v5, v4);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v2;
}

- (id)stagedShardFileEntriesWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__HDOntologyShardRegistry_stagedShardFileEntriesWithError___block_invoke;
  v9[3] = &unk_1E62F9298;
  id v6 = v5;
  id v10 = v6;
  if (-[HDOntologyShardRegistry _enumerateStagedShardFileEntriesWithWithError:handler:]((uint64_t)self, a3, v9))id v7 = v6; {
  else
  }
    id v7 = 0;

  return v7;
}

uint64_t __59__HDOntologyShardRegistry_stagedShardFileEntriesWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (uint64_t)_enumerateStagedShardFileEntriesWithWithError:(void *)a3 handler:
{
  id v5 = a3;
  if (a1)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    v8 = *(void **)(a1 + 8);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __81__HDOntologyShardRegistry__enumerateStagedShardFileEntriesWithWithError_handler___block_invoke;
    v12[3] = &unk_1E62F9388;
    id v13 = v7;
    id v14 = v5;
    id v9 = v7;
    uint64_t v10 = +[HDOntologyShardRegistry _enumerateStagedShardFileURLsWithFileManager:stagingDirectory:error:handler:]((uint64_t)HDOntologyShardRegistry, v6, v8, a2, v12);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)stagedShardFileEntryForEntry:(id)a3 entryOut:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__43;
  id v21 = __Block_byref_object_dispose__43;
  id v22 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__HDOntologyShardRegistry_stagedShardFileEntryForEntry_entryOut_error___block_invoke;
  v14[3] = &unk_1E62F92C0;
  id v9 = v8;
  id v15 = v9;
  uint64_t v16 = &v17;
  char v10 = -[HDOntologyShardRegistry _enumerateStagedShardFileEntriesWithWithError:handler:]((uint64_t)self, a5, v14);
  BOOL v11 = v10;
  if (a4) {
    char v12 = v10;
  }
  else {
    char v12 = 0;
  }
  if (v12) {
    *a4 = (id) v18[5];
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __71__HDOntologyShardRegistry_stagedShardFileEntryForEntry_entryOut_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isEqual:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v5 = 2;
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

- (BOOL)stageShardFileWithLocalURL:(id)a3 entry:(id)a4 error:(id *)a5
{
  return -[HDOntologyShardRegistry _stageShardFileWithLocalURL:entry:shouldCopy:error:]((uint64_t)self, a3, a4, 0, a5);
}

- (uint64_t)_stageShardFileWithLocalURL:(void *)a3 entry:(char)a4 shouldCopy:(void *)a5 error:
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  if (!a1)
  {
    uint64_t v18 = 0;
    goto LABEL_18;
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  if (![v11 createDirectoryAtURL:*(void *)(a1 + 8) withIntermediateDirectories:1 attributes:0 error:a5])
  {
LABEL_6:
    uint64_t v18 = 0;
    goto LABEL_17;
  }
  id v12 = v9;
  id v13 = v10;
  id v14 = *(NSObject **)(a1 + 16);
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  v30 = __80__HDOntologyShardRegistry__attemptToCacheFileHandleIfNecessaryForFileURL_entry___block_invoke;
  v31 = &unk_1E62F30F8;
  uint64_t v32 = a1;
  id v15 = v13;
  id v33 = v15;
  id v16 = v12;
  id v34 = v16;
  dispatch_sync(v14, &block);

  if (a4)
  {
    if (+[HDOntologyShardRegistry _deleteStagedFilesForEntry:stagingDirectory:fileManager:error:]((uint64_t)HDOntologyShardRegistry, v15, *(void **)(a1 + 8), v11, a5))
    {
      -[HDOntologyShardRegistry _stagedShardFileURLForEntry:]((id *)a1, v15);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = [v11 copyItemAtURL:v16 toURL:v17 error:a5];
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_6;
  }
  id v27 = v9;
  id v17 = [v16 path];
  id v19 = v11;
  self;
  uint64_t v20 = *MEMORY[0x1E4F28348];
  uint64_t v21 = *MEMORY[0x1E4F28330];
  v35[0] = *MEMORY[0x1E4F28370];
  v35[1] = v21;
  uint64_t block = v20;
  uint64_t v29 = (uint64_t)&unk_1F17EB400;
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&block forKeys:v35 count:2];
  char v23 = [v19 setAttributes:v22 ofItemAtPath:v17 error:a5];

  if ((v23 & 1) == 0)
  {
    v24 = [NSString stringWithFormat:@"Error setting protection class for %@", v17];
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:underlyingError:", 102, v24, 0);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = v27;
    if (v25)
    {
      if (a5) {
        *a5 = v25;
      }
      else {
        _HKLogDroppedError();
      }
    }

    uint64_t v18 = 0;
    goto LABEL_16;
  }

  if (+[HDOntologyShardRegistry _deleteStagedFilesForEntry:stagingDirectory:fileManager:error:]((uint64_t)HDOntologyShardRegistry, v15, *(void **)(a1 + 8), v19, a5))
  {
    -[HDOntologyShardRegistry _stagedShardFileURLForEntry:]((id *)a1, v15);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v19 moveItemAtURL:v16 toURL:v17 error:a5];
    id v9 = v27;
    goto LABEL_16;
  }
  uint64_t v18 = 0;
  id v9 = v27;
LABEL_17:

LABEL_18:
  return v18;
}

- (BOOL)copyToStagingDirectoryFileWithLocalURL:(id)a3 entry:(id)a4 error:(id *)a5
{
  return -[HDOntologyShardRegistry _stageShardFileWithLocalURL:entry:shouldCopy:error:]((uint64_t)self, a3, a4, 1, a5);
}

+ (uint64_t)_deleteStagedFilesForEntry:(void *)a3 stagingDirectory:(void *)a4 fileManager:(void *)a5 error:
{
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  uint64_t v11 = self;
  id v12 = NSString;
  id v13 = [v10 identifier];
  id v14 = [v10 schemaType];
  uint64_t v15 = [v10 schemaVersion];

  id v16 = [v12 stringWithFormat:@"%@:%@:%ld", v13, v14, v15];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __89__HDOntologyShardRegistry__deleteStagedFilesForEntry_stagingDirectory_fileManager_error___block_invoke;
  v21[3] = &unk_1E62F93B0;
  id v23 = v8;
  uint64_t v24 = v11;
  id v22 = v16;
  id v17 = v8;
  id v18 = v16;
  uint64_t v19 = +[HDOntologyShardRegistry _enumerateStagedShardFileURLsWithFileManager:stagingDirectory:error:handler:](v11, v17, v9, a5, v21);

  return v19;
}

- (id)_stagedShardFileURLForEntry:(id *)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    uint64_t v3 = NSString;
    id v4 = a2;
    uint64_t v5 = [v4 identifier];
    id v6 = [v4 schemaType];
    uint64_t v7 = [v4 schemaVersion];
    uint64_t v8 = [v4 availableVersion];

    id v9 = [v3 stringWithFormat:@"%@:%@:%ld:%ld", v5, v6, v7, v8];

    uint64_t v2 = [v2[1] URLByAppendingPathComponent:v9];
  }

  return v2;
}

- (BOOL)deleteStagedShardFileForEntry:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (+[HDOntologyShardRegistry _isCacheableEntry:]((uint64_t)HDOntologyShardRegistry, v6))
  {
    id v7 = v6;
    uint64_t v8 = v7;
    if (self)
    {
      cachedFileHandlesAssertionQueue = self->_cachedFileHandlesAssertionQueue;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __59__HDOntologyShardRegistry__removeCachedFileHandleForEntry___block_invoke;
      v14[3] = &unk_1E62F31C0;
      void v14[4] = self;
      id v15 = v7;
      dispatch_sync(cachedFileHandlesAssertionQueue, v14);
    }
  }
  stagingDirectoryURL = self->_stagingDirectoryURL;
  id v11 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  char v12 = +[HDOntologyShardRegistry _deleteStagedFilesForEntry:stagingDirectory:fileManager:error:]((uint64_t)HDOntologyShardRegistry, v6, stagingDirectoryURL, v11, a4);

  return v12;
}

+ (uint64_t)_isCacheableEntry:(uint64_t)a1
{
  id v3 = a2;
  self;
  id v4 = [v3 schemaType];
  uint64_t v5 = (void *)*MEMORY[0x1E4F2A2F8];
  BOOL v6 = v4 != (void *)*MEMORY[0x1E4F2A2F8];
  if (v4 == (void *)*MEMORY[0x1E4F2A2F8]) {
    goto LABEL_5;
  }
  if (!v5)
  {
    BOOL v6 = 0;
    int v7 = 0;
    goto LABEL_8;
  }
  uint64_t v2 = [v3 schemaType];
  if ([v2 isEqualToString:v5])
  {
LABEL_5:
    uint64_t v8 = [v3 schemaVersion];
    uint64_t v5 = [v3 identifier];
    int v7 = 1;
    uint64_t v9 = 1;
    if (v8 == HKCurrentSchemaVersionForShardIdentifier()) {
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  int v7 = 0;
  BOOL v6 = 1;
LABEL_8:
  id v10 = [v3 schemaType];
  id v11 = v10;
  uint64_t v9 = *MEMORY[0x1E4F2A2E8];
  if (v10 == (void *)*MEMORY[0x1E4F2A2E8])
  {
    uint64_t v9 = [v3 schemaVersion] == 1;
LABEL_13:

    if (v7) {
      goto LABEL_14;
    }
LABEL_20:
    if (!v6) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (v9)
  {
    char v12 = [v3 schemaType];
    if ([v12 isEqualToString:v9])
    {
      uint64_t v9 = [v3 schemaVersion] == 1;

      goto LABEL_13;
    }

    uint64_t v9 = 0;
    if ((v7 & 1) == 0) {
      goto LABEL_20;
    }
  }
  else
  {

    if (!v7) {
      goto LABEL_20;
    }
  }
LABEL_14:

  if (v6) {
LABEL_15:
  }

LABEL_16:
  return v9;
}

- (BOOL)deleteStagedFilesNotMatchingEntries:(id)a3 error:(id *)a4
{
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__HDOntologyShardRegistry_deleteStagedFilesNotMatchingEntries_error___block_invoke;
  v16[3] = &unk_1E62F92E8;
  void v16[4] = self;
  BOOL v6 = objc_msgSend(a3, "hk_mapToSet:", v16);
  id v7 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  stagingDirectoryURL = self->_stagingDirectoryURL;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__HDOntologyShardRegistry_deleteStagedFilesNotMatchingEntries_error___block_invoke_2;
  v12[3] = &unk_1E62F9310;
  id v13 = v6;
  id v14 = v7;
  id v15 = self;
  id v9 = v7;
  id v10 = v6;
  LOBYTE(a4) = +[HDOntologyShardRegistry _enumerateStagedShardFileURLsWithFileManager:stagingDirectory:error:handler:]((uint64_t)HDOntologyShardRegistry, v9, stagingDirectoryURL, a4, v12);

  return (char)a4;
}

id __69__HDOntologyShardRegistry_deleteStagedFilesNotMatchingEntries_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = -[HDOntologyShardRegistry _stagedShardFileURLForEntry:](*(id **)(a1 + 32), a2);
  id v3 = [v2 lastPathComponent];

  return v3;
}

uint64_t __69__HDOntologyShardRegistry_deleteStagedFilesNotMatchingEntries_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  BOOL v6 = [v5 lastPathComponent];
  if ([*(id *)(a1 + 32) containsObject:v6])
  {
LABEL_7:
    uint64_t v8 = 1;
    goto LABEL_9;
  }
  if (!+[HDOntologyShardRegistry _deleteStagedFileWithURL:fileManager:error:]((uint64_t)HDOntologyShardRegistry, v5, *(void **)(a1 + 40), a3))
  {
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  _HKInitializeLogging();
  id v7 = HKLogHealthOntology();
  uint64_t v8 = 1;
  BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);

  if (v9)
  {
    id v10 = HKLogHealthOntology();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_INFO, "%{public}@: deleted from staging directory %{public}@", (uint8_t *)&v13, 0x16u);
    }

    goto LABEL_7;
  }
LABEL_9:

  return v8;
}

+ (uint64_t)_deleteStagedFileWithURL:(void *)a3 fileManager:(void *)a4 error:
{
  id v6 = a3;
  id v7 = a2;
  self;
  id v14 = 0;
  char v8 = [v6 removeItemAtURL:v7 error:&v14];

  id v9 = v14;
  id v10 = v9;
  if (v8 & 1) != 0 || (objc_msgSend(v9, "hk_isCocoaNoSuchFileError"))
  {
    uint64_t v11 = 1;
  }
  else
  {
    id v12 = v10;
    if (v12)
    {
      if (a4) {
        *a4 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }

    uint64_t v11 = 0;
  }

  return v11;
}

+ (uint64_t)_enumerateStagedShardFileURLsWithFileManager:(void *)a3 stagingDirectory:(void *)a4 error:(void *)a5 handler:
{
  id v8 = a5;
  id v9 = a3;
  id v10 = a2;
  self;
  id v17 = 0;
  char v11 = objc_msgSend(v10, "hk_enumerateDirectoryAtURL:includingPropertiesForKeys:options:error:handler:", v9, MEMORY[0x1E4F1CBF0], 0, &v17, v8);

  id v12 = v17;
  int v13 = v12;
  if (v11 & 1) != 0 || (objc_msgSend(v12, "hk_isCocoaNoSuchFileError"))
  {
    uint64_t v14 = 1;
  }
  else
  {
    id v15 = v13;
    if (v15)
    {
      if (a4) {
        *a4 = v15;
      }
      else {
        _HKLogDroppedError();
      }
    }

    uint64_t v14 = 0;
  }

  return v14;
}

- (int64_t)purgeableSpaceForStagedShards
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  stagingDirectoryURL = self->_stagingDirectoryURL;
  v12[5] = &v14;
  id v13 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__HDOntologyShardRegistry_purgeableSpaceForStagedShards__block_invoke;
  v12[3] = &unk_1E62F9338;
  void v12[4] = self;
  char v5 = +[HDOntologyShardRegistry _enumerateStagedShardFileURLsWithFileManager:stagingDirectory:error:handler:]((uint64_t)HDOntologyShardRegistry, v3, stagingDirectoryURL, &v13, v12);
  id v6 = v13;
  if ((v5 & 1) == 0)
  {
    _HKInitializeLogging();
    id v7 = HKLogHealthOntology();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);

    if (v8)
    {
      id v9 = HKLogHealthOntology();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = self;
        __int16 v20 = 2114;
        id v21 = v6;
        _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_INFO, "%{public}@: error during enumeration to determine purgeable space: %{public}@", buf, 0x16u);
      }
    }
  }
  int64_t v10 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v10;
}

uint64_t __56__HDOntologyShardRegistry_purgeableSpaceForStagedShards__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v11 = 0;
  id v4 = objc_msgSend(v3, "hk_fileSizeWithError:", &v11);
  id v5 = v11;
  if (v4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v4 longLongValue];
  }
  else
  {
    _HKInitializeLogging();
    id v6 = HKLogHealthOntology();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);

    if (v7)
    {
      BOOL v8 = HKLogHealthOntology();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        uint64_t v13 = v9;
        __int16 v14 = 2114;
        id v15 = v3;
        __int16 v16 = 2114;
        id v17 = v5;
        _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_INFO, "%{public}@: unable to determine size of %{public}@: %{public}@", buf, 0x20u);
      }
    }
  }

  return 1;
}

- (int64_t)purgeSpaceForStagedShards
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  cachedFileHandlesAssertionQueue = self->_cachedFileHandlesAssertionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HDOntologyShardRegistry_purgeSpaceForStagedShards__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_sync(cachedFileHandlesAssertionQueue, block);
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  stagingDirectoryURL = self->_stagingDirectoryURL;
  id v16 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__HDOntologyShardRegistry_purgeSpaceForStagedShards__block_invoke_2;
  v13[3] = &unk_1E62F9360;
  v13[4] = self;
  id v6 = v4;
  id v14 = v6;
  id v15 = &v17;
  LOBYTE(stagingDirectoryURL) = +[HDOntologyShardRegistry _enumerateStagedShardFileURLsWithFileManager:stagingDirectory:error:handler:]((uint64_t)HDOntologyShardRegistry, v6, stagingDirectoryURL, &v16, v13);
  id v7 = v16;
  if ((stagingDirectoryURL & 1) == 0)
  {
    _HKInitializeLogging();
    BOOL v8 = HKLogHealthOntology();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

    if (v9)
    {
      int64_t v10 = HKLogHealthOntology();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        id v23 = self;
        __int16 v24 = 2114;
        id v25 = v7;
        _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_INFO, "%{public}@: error during purge enumeration: %{public}@", buf, 0x16u);
      }
    }
  }
  int64_t v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __52__HDOntologyShardRegistry_purgeSpaceForStagedShards__block_invoke(uint64_t a1)
{
}

- (void)_assertionQueue_closeFileHandles
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "allValues", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v6++) closeFile];
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }

    id v7 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;
  }
}

uint64_t __52__HDOntologyShardRegistry_purgeSpaceForStagedShards__block_invoke_2(void *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v24 = 0;
  uint64_t v4 = objc_msgSend(v3, "hk_fileSizeWithError:", &v24);
  id v5 = v24;
  if (v4)
  {
    if ([v4 longLongValue] >= 1)
    {
      uint64_t v6 = (void *)a1[5];
      id v23 = v5;
      char v7 = [v6 removeItemAtURL:v3 error:&v23];
      id v8 = v23;

      if (v7 & 1) != 0 || (objc_msgSend(v8, "hk_isCocoaNoSuchFileError"))
      {
        _HKInitializeLogging();
        long long v9 = HKLogHealthOntology();
        BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

        if (v10)
        {
          long long v11 = HKLogHealthOntology();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            uint64_t v12 = a1[4];
            uint64_t v13 = [v3 lastPathComponent];
            *(_DWORD *)buf = 138543618;
            uint64_t v26 = v12;
            __int16 v27 = 2114;
            id v28 = v13;
            _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_INFO, "%{public}@: purged from staging directory %{public}@", buf, 0x16u);
          }
        }
        *(void *)(*(void *)(a1[6] + 8) + 24) += [v4 longLongValue];
      }
      else
      {
        _HKInitializeLogging();
        uint64_t v19 = HKLogHealthOntology();
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);

        if (v20)
        {
          id v21 = HKLogHealthOntology();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            uint64_t v22 = a1[4];
            *(_DWORD *)buf = 138543874;
            uint64_t v26 = v22;
            __int16 v27 = 2114;
            id v28 = v3;
            __int16 v29 = 2114;
            id v30 = v8;
            _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_INFO, "%{public}@: unable to purge %{public}@: %{public}@", buf, 0x20u);
          }
        }
      }
      id v5 = v8;
    }
  }
  else
  {
    _HKInitializeLogging();
    id v14 = HKLogHealthOntology();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);

    if (v15)
    {
      id v16 = HKLogHealthOntology();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = a1[4];
        *(_DWORD *)buf = 138543874;
        uint64_t v26 = v17;
        __int16 v27 = 2114;
        id v28 = v3;
        __int16 v29 = 2114;
        id v30 = v5;
        _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_INFO, "%{public}@: unable to determine purgeable size of %{public}@: %{public}@", buf, 0x20u);
      }
    }
  }

  return 1;
}

- (id)openShardFileForEntry:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (+[HDOntologyShardRegistry _isCacheableEntry:]((uint64_t)HDOntologyShardRegistry, v6))
  {
    id v7 = v6;
    id v8 = v7;
    if (self)
    {
      uint64_t v24 = 0;
      id v25 = &v24;
      uint64_t v26 = 0x3032000000;
      __int16 v27 = __Block_byref_object_copy__43;
      id v28 = __Block_byref_object_dispose__43;
      id v29 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = &v18;
      uint64_t v20 = 0x3032000000;
      id v21 = __Block_byref_object_copy__43;
      uint64_t v22 = __Block_byref_object_dispose__43;
      id v23 = 0;
      cachedFileHandlesAssertionQueue = self->_cachedFileHandlesAssertionQueue;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __65__HDOntologyShardRegistry__getCacheableFileHandleForEntry_error___block_invoke;
      v14[3] = &unk_1E62F93D8;
      id v16 = &v24;
      void v14[4] = self;
      id v15 = v7;
      uint64_t v17 = &v18;
      dispatch_sync(cachedFileHandlesAssertionQueue, v14);
      id v10 = (id)v19[5];
      long long v11 = v10;
      if (v10)
      {
        if (a4) {
          *a4 = v10;
        }
        else {
          _HKLogDroppedError();
        }
      }

      id v12 = (id)v25[5];
      _Block_object_dispose(&v18, 8);

      _Block_object_dispose(&v24, 8);
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    -[HDOntologyShardRegistry _openFileHandleForEntry:error:]((id *)&self->super.isa, v6, (uint64_t)a4);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)_openFileHandleForEntry:(uint64_t)a3 error:
{
  if (a1)
  {
    uint64_t v4 = -[HDOntologyShardRegistry _stagedShardFileURLForEntry:](a1, a2);
    id v5 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:v4 error:a3];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)moveStagedShardFileForEntry:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v8 = a4;
  long long v9 = -[HDOntologyShardRegistry _stagedShardFileURLForEntry:]((id *)&self->super.isa, a3);
  id v10 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  LOBYTE(a5) = [v10 moveItemAtURL:v9 toURL:v8 error:a5];

  return (char)a5;
}

- (BOOL)unzipStagedShardFileForEntry:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v8 = a4;
  long long v9 = -[HDOntologyShardRegistry _stagedShardFileURLForEntry:]((id *)&self->super.isa, a3);
  id v10 = objc_alloc_init(HDFileArchiver);
  LOBYTE(a5) = [(HDFileArchiver *)v10 decompressArchiveAt:v9 to:v8 error:a5];

  return (char)a5;
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  cachedFileHandlesAssertionQueue = self->_cachedFileHandlesAssertionQueue;
  id v6 = a3;
  dispatch_assert_queue_V2(cachedFileHandlesAssertionQueue);
  LOBYTE(cachedFileHandlesAssertionQueue) = [v6 hasActiveAssertionForIdentifier:@"OntologyShardRegistryAssertionIdentifierCachedFileHandles"];

  if ((cachedFileHandlesAssertionQueue & 1) == 0)
  {
    -[HDOntologyShardRegistry _assertionQueue_closeFileHandles]((uint64_t)self);
  }
}

uint64_t __81__HDOntologyShardRegistry__enumerateStagedShardFileEntriesWithWithError_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 lastPathComponent];
  uint64_t v4 = [v3 componentsSeparatedByString:@":"];

  if ([v4 count] == 4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F2B2F8]);
    id v6 = [v4 objectAtIndexedSubscript:0];
    id v7 = [v4 objectAtIndexedSubscript:1];
    id v8 = [v4 objectAtIndexedSubscript:2];
    uint64_t v9 = [v8 integerValue];
    id v10 = [v4 objectAtIndexedSubscript:3];
    long long v11 = objc_msgSend(v5, "initWithIdentifier:schemaType:schemaVersion:availableVersion:date:", v6, v7, v9, objc_msgSend(v10, "integerValue"), *(void *)(a1 + 32));

    uint64_t v12 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v12 = 1;
  }

  return v12;
}

BOOL __89__HDOntologyShardRegistry__deleteStagedFilesForEntry_stagingDirectory_fileManager_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [v5 lastPathComponent];
  int v7 = [v6 hasPrefix:*(void *)(a1 + 32)];

  BOOL v8 = !v7
    || +[HDOntologyShardRegistry _deleteStagedFileWithURL:fileManager:error:](*(void *)(a1 + 48), v5, *(void **)(a1 + 40), a3);

  return v8;
}

void __59__HDOntologyShardRegistry__removeCachedFileHandleForEntry___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v2 closeFile];
  [*(id *)(*(void *)(a1 + 32) + 32) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

void __65__HDOntologyShardRegistry__getCacheableFileHandleForEntry_error___block_invoke(void *a1)
{
  uint64_t v3 = a1[4];
  id v2 = (void *)a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id v6 = *(void **)(v4 + 40);
  id v5 = (id *)(v4 + 40);
  id obj = v6;
  id v7 = v2;
  if (v3)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 16));
    BOOL v8 = [*(id *)(v3 + 32) objectForKeyedSubscript:v7];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      -[HDOntologyShardRegistry _openFileHandleForEntry:error:]((id *)v3, v7, (uint64_t)&obj);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      [*(id *)(v3 + 32) setObject:v10 forKeyedSubscript:v7];
    }
  }
  else
  {
    id v10 = 0;
  }

  objc_storeStrong(v5, obj);
  uint64_t v11 = *(void *)(a1[6] + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

void __80__HDOntologyShardRegistry__attemptToCacheFileHandleIfNecessaryForFileURL_entry___block_invoke(void *a1)
{
  if (*(void *)(a1[4] + 32))
  {
    id v2 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:a1[6] error:0];
    [*(id *)(a1[4] + 32) setObject:v2 forKeyedSubscript:a1[5]];
  }
}

uint64_t __68__HDOntologyShardRegistry__assertionQueue_openFileHandlesWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (+[HDOntologyShardRegistry _isCacheableEntry:]((uint64_t)HDOntologyShardRegistry, v5))
  {
    uint64_t v6 = -[HDOntologyShardRegistry _openFileHandleForEntry:error:](*(id **)(a1 + 32), v5, a3);
    if (!v6)
    {
      uint64_t v8 = 0;
      goto LABEL_6;
    }
    id v7 = (void *)v6;
    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v6 forKeyedSubscript:v5];
  }
  uint64_t v8 = 1;
LABEL_6:

  return v8;
}

- (id)unitTesting_stagedShardFileFullPathForEntry:(id)a3
{
  uint64_t v3 = -[HDOntologyShardRegistry _stagedShardFileURLForEntry:]((id *)&self->super.isa, a3);
  uint64_t v4 = [v3 path];

  return v4;
}

- (id)unitTesting_stagedShardFileNamesWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  stagingDirectoryURL = self->_stagingDirectoryURL;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__HDOntologyShardRegistry_unitTesting_stagedShardFileNamesWithError___block_invoke;
  v12[3] = &unk_1E62F9400;
  id v13 = v5;
  id v8 = v5;
  if (+[HDOntologyShardRegistry _enumerateStagedShardFileURLsWithFileManager:stagingDirectory:error:handler:]((uint64_t)HDOntologyShardRegistry, v6, stagingDirectoryURL, a3, v12))uint64_t v9 = v8; {
  else
  }
    uint64_t v9 = 0;
  id v10 = v9;

  return v10;
}

uint64_t __69__HDOntologyShardRegistry_unitTesting_stagedShardFileNamesWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 lastPathComponent];
  objc_msgSend(v2, "hk_addNonNilObject:", v3);

  return 1;
}

- (BOOL)unitTesting_stageFileWithLocalURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  if ([v7 createDirectoryAtURL:self->_stagingDirectoryURL withIntermediateDirectories:1 attributes:0 error:a4])
  {
    stagingDirectoryURL = self->_stagingDirectoryURL;
    uint64_t v9 = [v6 lastPathComponent];
    id v10 = [(NSURL *)stagingDirectoryURL URLByAppendingPathComponent:v9];
    char v11 = [v7 moveItemAtURL:v6 toURL:v10 error:a4];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)unitTesting_cachedFileHandles
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__43;
  id v10 = __Block_byref_object_dispose__43;
  id v11 = 0;
  cachedFileHandlesAssertionQueue = self->_cachedFileHandlesAssertionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__HDOntologyShardRegistry_unitTesting_cachedFileHandles__block_invoke;
  v5[3] = &unk_1E62F3230;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cachedFileHandlesAssertionQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __56__HDOntologyShardRegistry_unitTesting_cachedFileHandles__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (HDOntologyUpdateCoordinator)updateCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateCoordinator);

  return (HDOntologyUpdateCoordinator *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updateCoordinator);
  objc_storeStrong((id *)&self->_cachedFileHandles, 0);
  objc_storeStrong((id *)&self->_cachedFileHandlesAssertionManager, 0);
  objc_storeStrong((id *)&self->_cachedFileHandlesAssertionQueue, 0);

  objc_storeStrong((id *)&self->_stagingDirectoryURL, 0);
}

@end