@interface HDDatabase
+ (__CFString)_stateDebugName:(uint64_t)a1;
+ (id)allCurrentAndFutureEntityClasses;
+ (id)allEntityClassesWithBehavior:(id)a3;
- (BOOL)_protectedDataLock_isProtectedDataFlushDeadlinePassed;
- (BOOL)addJournalEntries:(id)a3 error:(id *)a4;
- (BOOL)addJournalEntry:(id)a3 error:(id *)a4;
- (BOOL)didRunPostMigrationUpdates;
- (BOOL)isDataProtectedByFirstUnlockAvailable;
- (BOOL)isInSession;
- (BOOL)isProtectedDataAvailable;
- (BOOL)performHighPriorityTransactionsWithError:(id *)a3 block:(id)a4;
- (BOOL)performTransactionWithContext:(id)a3 error:(id *)a4 block:(id)a5 inaccessibilityHandler:(id)a6;
- (BOOL)performWithJournalType:(int64_t)a3 error:(id *)a4 block:(id)a5;
- (BOOL)performWithTransactionContext:(id)a3 error:(id *)a4 block:(id)a5;
- (HDContentProtectionManager)contentProtectionManager;
- (HDDatabase)initWithConfiguration:(id)a3 profile:(id)a4;
- (HDDatabaseConfiguration)configuration;
- (HDDatabaseJournal)cloudSyncJournal;
- (HDDatabaseJournal)journal;
- (HDProfile)profile;
- (HKProfileIdentifier)profileIdentifier;
- (NSDate)mostRecentObliterationDate;
- (NSString)profileDirectoryPath;
- (double)inactivityFlushInterval;
- (double)offsetTimeInterval;
- (double)protectedDataFlushInterval;
- (id)_checkOutDatabaseForTransaction:(uint64_t)a3 databaseType:(void *)a4 error:;
- (id)_createAndVerifyDatabaseConnectionWithType:(void *)a3 error:;
- (id)_journalForType:(int64_t)a3;
- (id)_newCorruptionEventStore;
- (id)_newDatabaseConnectionWithURL:(id)a3;
- (id)_newTTRPromptControllerWithProfile:(id)a3 domainName:(id)a4 loggingCategory:(id)a5;
- (id)_threadLocalTransactionContext;
- (id)allEntityClassesWithProtectionClass:(int64_t)a3;
- (id)allSeriesEntityClasses;
- (id)beginExtendedTransactionWithContext:(id)a3 transactionTimeout:(double)a4 continuationTimeout:(double)a5 error:(id *)a6;
- (id)checkOutProtectedDatabase:(id)a3 error:(id *)a4;
- (id)checkOutProtectedResources:(id)a3 error:(id *)a4;
- (id)checkOutUnprotectedDatabase:(id)a3 error:(id *)a4;
- (id)cloneAccessibilityAssertion:(id)a3 ownerIdentifier:(id)a4 error:(id *)a5;
- (id)databasePoolForDatabaseType:(int64_t)a3;
- (id)databaseSizeInBytes;
- (id)databaseSizeInBytesForTypeUnprotected:(BOOL)a3 WAL:(BOOL)a4;
- (id)databaseUUIDWithError:(id *)a3;
- (id)diagnosticDescription;
- (id)extendedDatabaseTransactionForIdentifier:(id)a3;
- (id)migrationTransaction:(id)a3 entityClassesWithBehavior:(id)a4;
- (id)newConnectionForPool:(id)a3 error:(id *)a4;
- (id)progressForJournalMergeWithType:(int64_t)a3;
- (id)store:(id)a3 objectForKey:(id)a4;
- (id)takeAccessibilityAssertionWithOwnerIdentifier:(id)a3 shouldPerformTransaction:(BOOL)a4 timeout:(double)a5 error:(id *)a6;
- (id)takeAccessibilityAssertionWithOwnerIdentifier:(id)a3 timeout:(double)a4 error:(id *)a5;
- (id)unitTest_didWaitForJournalMergeHandler;
- (int64_t)corruptedMigrationAttemptsCount;
- (off_t)_fileSizeForURL:(uint64_t)a3 error:;
- (os_unfair_lock_s)_isDatabaseValidWithError:(os_unfair_lock_s *)result;
- (os_unfair_lock_s)isInvalid;
- (uint64_t)_performMigrationWithUnprotectedDatabase:(void *)a3 protectedDatabase:(void *)a4 error:;
- (uint64_t)_performWithTransactionContext:(int)a3 merge:(void *)a4 error:(void *)a5 block:;
- (uint64_t)_protectedDataState;
- (uint64_t)_transitionToState:(uint64_t)a1;
- (unint64_t)journalChapterCountForType:(int64_t)a3;
- (void)_checkInDatabase:(uint64_t)a3 type:(uint64_t)a4 flushImmediately:;
- (void)_checkInProtectedResources:(uint64_t)a1;
- (void)_invalidateProtectedResourceAssertions;
- (void)_mainDatabaseURL;
- (void)_mergeSecondaryJournals;
- (void)_mergeSecondaryJournalsWithActivity:(void *)a3 completion:;
- (void)_performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:(void *)a3 block:;
- (void)_protectedDataQueue_cancelProtectedDataFlushTimer;
- (void)_protectedDataQueue_contentProtectionStateChanged:(uint64_t)a3 previousState:;
- (void)_protectedDataQueue_flushProtectedData;
- (void)_protectedDataQueue_flushProtectedDataIfNecessary;
- (void)_protectedDataQueue_mergeJournalWithPrimaryJournalMergeCompletion:(uint64_t)a1;
- (void)_protectedDataQueue_updateInactivityFlushTimer;
- (void)_protectedDatabaseURL;
- (void)_reportDatabaseMigrationStatus:(int64_t)a3 component:(int64_t)a4 schemaVersion:(int64_t)a5 error:(id)a6;
- (void)_reportMigrationResultIfNecessaryForStatus:(void *)a3 database:(unsigned int)a4 protectedDatabase:(void *)a5 error:;
- (void)_reportSQLiteCorruption:(id)a3 forDatabase:(int64_t)a4 shouldPrompt:(BOOL)a5;
- (void)_threadLocalTransaction;
- (void)_updateInactivityFlushTimer;
- (void)_waitForContentProtectionObservationSetup;
- (void)addDatabaseJournalMergeObserver:(id)a3 journalType:(int64_t)a4 queue:(id)a5;
- (void)addProtectedDataObserver:(id)a3;
- (void)addProtectedDataObserver:(id)a3 queue:(id)a4;
- (void)addProtectedResourceStores:(id)a3;
- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4;
- (void)checkInDatabase:(id)a3 type:(int64_t)a4 protectedResources:(id)a5;
- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4;
- (void)databaseJournalMergeDidComplete:(id)a3;
- (void)databasePool:(id)a3 didFlushConnections:(id)a4;
- (void)dealloc;
- (void)enterStateAddResources;
- (void)enterStateInitialized;
- (void)enterStateRun;
- (void)finalizeExtendedTransactionForIdentifier:(id)a3;
- (void)invalidateAndWait;
- (void)migrationTransaction:(id)a3 didCreateDatabasesWithIdentifier:(id)a4;
- (void)migrationTransaction:(id)a3 didEncounterDatabaseMismatchWithUnprotectedIdentifier:(id)a4 protectedIdentifier:(id)a5;
- (void)migrationTransaction:(id)a3 reportHFDMigrationStatus:(int64_t)a4 schemaVersion:(int64_t)a5 error:(id)a6;
- (void)obliterateWithReason:(id)a3 preserveCopy:(BOOL)a4;
- (void)performAsynchronously:(id)a3;
- (void)performAsynchronouslySerial:(id)a3;
- (void)performInFirstProtectedWriteTransaction:(id)a3;
- (void)performInFirstUnprotectedWriteTransaction:(id)a3;
- (void)performWhenDataProtectedByFirstUnlockIsAvailable:(id)a3;
- (void)performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:(id)a3 block:(id)a4;
- (void)removeDatabaseJournalMergeObserver:(id)a3 journalType:(int64_t)a4;
- (void)removeProtectedDataObserver:(id)a3;
- (void)setCorruptedMigrationAttemptsCount:(int64_t)a3;
- (void)setDidRunPostMigrationUpdates:(BOOL)a3;
- (void)setInactivityFlushInterval:(double)a3;
- (void)setOffsetTimeInterval:(double)a3;
- (void)setProfile:(id)a3;
- (void)setProtectedDataFlushInterval:(double)a3;
- (void)setUnitTest_didWaitForJournalMergeHandler:(id)a3;
- (void)store:(id)a3 setObject:(id)a4 forKey:(id)a5;
- (void)unitTest_clearFirstJournalMergeCleanupFlag;
- (void)unitTest_disableDatabaseAccessibilityAssertions;
- (void)unitTest_enableDatabaseAccessibilityAssertions;
- (void)unitTest_mergeSecondaryJournalsWithActivity:(id)a3 completion:(id)a4;
- (void)unitTest_setContentProtectionStateAndWait:(int64_t)a3;
@end

@implementation HDDatabase

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  protectedDataQueue = self->_protectedDataQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__HDDatabase_contentProtectionStateChanged_previousState___block_invoke;
  block[3] = &unk_1E62FC7E8;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(protectedDataQueue, block);
}

- (void)performAsynchronously:(id)a3
{
}

- (BOOL)isProtectedDataAvailable
{
  return -[HDDatabase _protectedDataState]((uint64_t)self) != 2;
}

- (uint64_t)_protectedDataState
{
  if (!a1) {
    return 0;
  }
  v2 = (os_unfair_lock_s *)(a1 + 80);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  uint64_t v3 = *(void *)(a1 + 96);
  os_unfair_lock_unlock(v2);
  if (v3 == 2) {
    [*(id *)(a1 + 400) recheckContentProtectionState];
  }
  return v3;
}

- (void)addProtectedDataObserver:(id)a3
{
}

- (os_unfair_lock_s)_isDatabaseValidWithError:(os_unfair_lock_s *)result
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    v4 = result + 2;
    os_unfair_lock_lock(result + 2);
    uint64_t v5 = *(void *)&v3[4]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v4);
    if (v5 == 5)
    {
      v7 = (void *)MEMORY[0x1E4F28C58];
      v8 = @"Database invalidated";
LABEL_8:
      objc_msgSend(v7, "hk_assignError:code:description:", a2, 1500, v8);
      return 0;
    }
    if (!v5)
    {
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
      {
        int v9 = 138543362;
        v10 = v3;
        _os_log_fault_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_FAULT, "%{public}@: Attempt to access the database before calling its ready. This represents a bug in the caller; clie"
          "nts should wait on database availability before attempting to open transactions.",
          (uint8_t *)&v9,
          0xCu);
      }
      v7 = (void *)MEMORY[0x1E4F28C58];
      v8 = @"Database not yet available";
      goto LABEL_8;
    }
    return (os_unfair_lock_s *)1;
  }
  return result;
}

- (void)removeProtectedDataObserver:(id)a3
{
}

- (BOOL)isDataProtectedByFirstUnlockAvailable
{
  return [(HDContentProtectionManager *)self->_contentProtectionManager deviceUnlockedSinceBoot];
}

- (BOOL)addJournalEntries:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self
    && ((-[HDDatabase _threadLocalTransactionContext]((uint64_t)self),
         v7 = objc_claimAutoreleasedReturnValue(),
         (v8 = v7) == 0)
      ? (int v9 = self->_journal)
      : (-[HDDatabase _journalForType:](self, "_journalForType:", [v7 journalType]),
         int v9 = (HDDatabaseJournal *)objc_claimAutoreleasedReturnValue()),
        v10 = v9,
        v8,
        v10))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    BOOL v12 = [(HDDatabaseJournal *)v10 addJournalEntries:v6 profile:WeakRetained error:a4];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Attempt to add a journal entry when no journal is active.");
    v10 = 0;
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)addJournalEntry:(id)a3 error:(id *)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v9[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  LOBYTE(a4) = [(HDDatabase *)self addJournalEntries:v7 error:a4];

  return (char)a4;
}

void __58__HDDatabase_contentProtectionStateChanged_previousState___block_invoke(uint64_t *a1)
{
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (double)offsetTimeInterval
{
  return self->_offsetTimeInterval;
}

- (void)performWhenDataProtectedByFirstUnlockIsAvailable:(id)a3
{
}

+ (id)allCurrentAndFutureEntityClasses
{
  v2 = _EntityClasses();
  uint64_t v3 = _FutureEntityClasses();
  v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = MEMORY[0x1E4F1CBF0];
  }
  id v6 = [v2 arrayByAddingObjectsFromArray:v5];

  return v6;
}

+ (id)allEntityClassesWithBehavior:(id)a3
{
  int v3 = [a3 futureMigrationsEnabled];
  v4 = _EntityClasses();
  if (v3)
  {
    uint64_t v5 = _FutureEntityClasses();
    id v6 = (void *)v5;
    if (v5) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = MEMORY[0x1E4F1CBF0];
    }
    uint64_t v8 = [v4 arrayByAddingObjectsFromArray:v7];

    v4 = (void *)v8;
  }

  return v4;
}

- (id)allEntityClassesWithProtectionClass:(int64_t)a3
{
  uint64_t v5 = objc_opt_class();
  id v6 = [(HDDatabase *)self profile];
  uint64_t v7 = [v6 daemon];
  uint64_t v8 = [v7 behavior];
  int v9 = [v5 allEntityClassesWithBehavior:v8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__HDDatabase_BuiltInEntities__allEntityClassesWithProtectionClass___block_invoke;
  v12[3] = &__block_descriptor_40_e8_B16__0_8l;
  v12[4] = a3;
  v10 = objc_msgSend(v9, "hk_filter:", v12);

  return v10;
}

BOOL __67__HDDatabase_BuiltInEntities__allEntityClassesWithProtectionClass___block_invoke(uint64_t a1, void *a2)
{
  return [a2 protectionClass] == *(void *)(a1 + 32);
}

- (id)allSeriesEntityClasses
{
  int v3 = objc_opt_class();
  v4 = [(HDDatabase *)self profile];
  uint64_t v5 = [v4 daemon];
  id v6 = [v5 behavior];
  uint64_t v7 = [v3 allEntityClassesWithBehavior:v6];
  uint64_t v8 = objc_msgSend(v7, "hk_filter:", &__block_literal_global_338);

  return v8;
}

uint64_t __53__HDDatabase_BuiltInEntities__allSeriesEntityClasses__block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_1F182B8E0];
}

- (HDDatabase)initWithConfiguration:(id)a3 profile:(id)a4
{
  v99[2] = *MEMORY[0x1E4F143B8];
  id v89 = a3;
  id v8 = a4;
  if (!v8)
  {
    v85 = [MEMORY[0x1E4F28B00] currentHandler];
    [v85 handleFailureInMethod:a2, self, @"HDDatabase.mm", 195, @"Invalid parameter not satisfying: %@", @"profile != nil" object file lineNumber description];
  }
  int v9 = [v8 directoryPath];

  if (!v9)
  {
    v86 = [MEMORY[0x1E4F28B00] currentHandler];
    [v86 handleFailureInMethod:a2, self, @"HDDatabase.mm", 196, @"Invalid parameter not satisfying: %@", @"[profile directoryPath] != nil" object file lineNumber description];
  }
  if (![v89 concurrentReaderLimit])
  {
    v87 = [MEMORY[0x1E4F28B00] currentHandler];
    [v87 handleFailureInMethod:a2, self, @"HDDatabase.mm", 197, @"Invalid parameter not satisfying: %@", @"configuration.concurrentReaderLimit > 0" object file lineNumber description];
  }
  v93.receiver = self;
  v93.super_class = (Class)HDDatabase;
  v10 = [(HDDatabase *)&v93 init];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_stateLock._os_unfair_lock_opaque = 0;
    v10->_state = 0;
    p_configuration = (id *)&v10->_configuration;
    objc_storeStrong((id *)&v10->_configuration, a3);
    v13 = [v8 directoryPath];
    uint64_t v14 = [v13 copy];
    profileDirectoryPath = v11->_profileDirectoryPath;
    v11->_profileDirectoryPath = (NSString *)v14;

    objc_storeWeak((id *)&v11->_profile, v8);
    v16 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    schemaMigrationLock = v11->_schemaMigrationLock;
    v11->_schemaMigrationLock = v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    activeDatabasesLock = v11->_activeDatabasesLock;
    v11->_activeDatabasesLock = (NSConditionLock *)v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activeDatabases = v11->_activeDatabases;
    v11->_activeDatabases = v20;

    uint64_t v22 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    migratedDatabases = v11->_migratedDatabases;
    v11->_migratedDatabases = (NSHashTable *)v22;

    v24 = NSString;
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    uint64_t v27 = [v24 stringWithFormat:@"%@.%p.transaction", v26, v11];
    threadLocalTransactionKey = v11->_threadLocalTransactionKey;
    v11->_threadLocalTransactionKey = (NSString *)v27;

    v29 = NSString;
    v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    uint64_t v32 = [v29 stringWithFormat:@"%@.%p.transactionContextStack", v31, v11];
    threadLocalTransactionContextStackKey = v11->_threadLocalTransactionContextStackKey;
    v11->_threadLocalTransactionContextStackKey = (NSString *)v32;

    v88 = objc_msgSend(objc_alloc(MEMORY[0x1E4F65CF0]), "initWithConcurrentReaderLimit:delegate:", objc_msgSend(*p_configuration, "concurrentReaderLimit"), v11);
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F65CF0]), "initWithConcurrentReaderLimit:delegate:", objc_msgSend(*p_configuration, "concurrentReaderLimit"), v11);
    v98[0] = &unk_1F17EB5B0;
    v98[1] = &unk_1F17EB5C8;
    v99[0] = v88;
    v99[1] = v34;
    uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:2];
    databasePoolForType = v11->_databasePoolForType;
    v11->_databasePoolForType = (NSDictionary *)v35;

    v37 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v37 addObject:v11];

    v38 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    writeLock = v11->_writeLock;
    v11->_writeLock = v38;

    v40 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    asynchronousOperationQueue = v11->_asynchronousOperationQueue;
    v11->_asynchronousOperationQueue = v40;

    [(NSOperationQueue *)v11->_asynchronousOperationQueue setQualityOfService:-1];
    [(NSOperationQueue *)v11->_asynchronousOperationQueue setMaxConcurrentOperationCount:[(HDDatabaseConfiguration *)v11->_configuration concurrentReaderLimit]];
    uint64_t v42 = HKCreateSerialDispatchQueue();
    serialAsynchronousQueue = v11->_serialAsynchronousQueue;
    v11->_serialAsynchronousQueue = (OS_dispatch_queue *)v42;

    uint64_t v44 = HKCreateSerialDispatchQueue();
    protectedDataQueue = v11->_protectedDataQueue;
    v11->_protectedDataQueue = (OS_dispatch_queue *)v44;

    v11->_protectedDataLock._os_unfair_lock_opaque = 0;
    id v46 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v47 = (id *)MEMORY[0x1E4F29F18];
    uint64_t v48 = [v46 initWithName:@"database-protected-data" loggingCategory:*MEMORY[0x1E4F29F18]];
    protectedDataObservers = v11->_protectedDataObservers;
    v11->_protectedDataObservers = (HKObserverSet *)v48;

    dispatch_group_t v50 = dispatch_group_create();
    contentProtectionObservationGroup = v11->_contentProtectionObservationGroup;
    v11->_contentProtectionObservationGroup = (OS_dispatch_group *)v50;

    dispatch_group_enter((dispatch_group_t)v11->_contentProtectionObservationGroup);
    v52 = [HDDatabaseJournal alloc];
    v53 = [(NSString *)v11->_profileDirectoryPath stringByAppendingPathComponent:@"Journals"];
    uint64_t v54 = [(HDDatabaseJournal *)v52 initWithType:1 path:v53];
    journal = v11->_journal;
    v11->_journal = (HDDatabaseJournal *)v54;

    [(HDDatabaseJournal *)v11->_journal setDelegate:v11];
    *(_OWORD *)&v11->_journalMergeEpoch = xmmword_1BD329BE0;
    v56 = [HDDatabaseJournal alloc];
    v57 = [(NSString *)v11->_profileDirectoryPath stringByAppendingPathComponent:@"CloudSyncJournals"];
    uint64_t v58 = [(HDDatabaseJournal *)v56 initWithType:2 path:v57];
    cloudSyncJournal = v11->_cloudSyncJournal;
    v11->_cloudSyncJournal = (HDDatabaseJournal *)v58;

    [(HDDatabaseJournal *)v11->_cloudSyncJournal setDelegate:v11];
    [(HDDatabaseJournal *)v11->_cloudSyncJournal setMaximumJournalBytes:&unk_1F17EB5E0];
    _HKInitializeLogging();
    objc_initWeak(&location, v11);
    id v60 = objc_alloc(MEMORY[0x1E4F65DC0]);
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14310], 1);
    xpc_dictionary_set_string(empty, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
    id v62 = *v47;
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __44__HDDatabase_initWithConfiguration_profile___block_invoke;
    v90[3] = &unk_1E62FC608;
    objc_copyWeak(&v91, &location);
    uint64_t v63 = [v60 initWithName:@"com.apple.healthd.database.journal.merge.secondary" criteria:empty loggingCategory:v62 handler:v90];
    secondaryJournalMergeActivity = v11->_secondaryJournalMergeActivity;
    v11->_secondaryJournalMergeActivity = (HDXPCGatedActivity *)v63;

    v65 = [[HDCoalescedTaskPoolQuota alloc] initWithAvailableQuota:5 maximumQuota:5 refillInterval:1800.0 minimumInterval:60.0 lastTrigger:0.0];
    [(HDXPCGatedActivity *)v11->_secondaryJournalMergeActivity setQuota:v65];

    v66 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    databaseJournalMergeObserverSetByType = v11->_databaseJournalMergeObserverSetByType;
    v11->_databaseJournalMergeObserverSetByType = v66;

    v68 = (void *)[objc_alloc(MEMORY[0x1E4F2B2D0]) initWithName:@"database-main-journal-observers" loggingCategory:*v47];
    [(NSMutableDictionary *)v11->_databaseJournalMergeObserverSetByType setObject:v68 forKeyedSubscript:&unk_1F17EB5B0];

    v69 = (void *)[objc_alloc(MEMORY[0x1E4F2B2D0]) initWithName:@"database-cloudsync-journal-observers" loggingCategory:*v47];
    [(NSMutableDictionary *)v11->_databaseJournalMergeObserverSetByType setObject:v69 forKeyedSubscript:&unk_1F17EB5F8];

    uint64_t v70 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    protectedResourceStores = v11->_protectedResourceStores;
    v11->_protectedResourceStores = (NSHashTable *)v70;

    v11->_protectedResourceAssertionsLock._os_unfair_lock_opaque = 0;
    v11->_databaseUUIDLock._os_unfair_lock_opaque = 0;
    v72 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E4F65CD0]);
    assertionManager = v11->_assertionManager;
    v11->_assertionManager = v72;

    [(HDAssertionManager *)v11->_assertionManager addObserver:v11 forAssertionIdentifier:@"DatabaseAccessibility" queue:v11->_protectedDataQueue];
    uint64_t v74 = [*p_configuration contentProtectionManager];
    contentProtectionManager = v11->_contentProtectionManager;
    v11->_contentProtectionManager = (HDContentProtectionManager *)v74;

    *(_OWORD *)&v11->_protectedDataState = xmmword_1BD329BF0;
    v11->_protectedDataFlushInterval = 600.0;
    v76 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    firstUnprotectedWriteTransactionBlocks = v11->_firstUnprotectedWriteTransactionBlocks;
    v11->_firstUnprotectedWriteTransactionBlocks = v76;

    v78 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    firstProtectedWriteTransactionBlocks = v11->_firstProtectedWriteTransactionBlocks;
    v11->_firstProtectedWriteTransactionBlocks = v78;

    v11->_transactionStartLock._os_unfair_lock_opaque = 0;
    dispatch_group_t v80 = dispatch_group_create();
    transactionStartGroup = v11->_transactionStartGroup;
    v11->_transactionStartGroup = (OS_dispatch_group *)v80;

    _HKInitializeLogging();
    v82 = *v47;
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v83 = [*p_configuration concurrentReaderLimit];
      *(_DWORD *)buf = 138543618;
      v95 = v11;
      __int16 v96 = 2050;
      uint64_t v97 = v83;
      _os_log_impl(&dword_1BCB7D000, v82, OS_LOG_TYPE_DEFAULT, "%{public}@: HDDatabase allocated with %{public}lu concurrent readers", buf, 0x16u);
    }

    objc_destroyWeak(&v91);
    objc_destroyWeak(&location);
  }
  return v11;
}

void __44__HDDatabase_initWithConfiguration_profile___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a2;
  id v6 = a4;
  uint64_t v7 = (id *)(a1 + 32);
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained(v7);
  if (WeakRetained) {
    atomic_store(0, WeakRetained + 232);
  }

  id v9 = objc_loadWeakRetained(v7);
  -[HDDatabase _mergeSecondaryJournalsWithActivity:completion:]((uint64_t)v9, v10, v6);
}

- (void)_mergeSecondaryJournalsWithActivity:(void *)a3 completion:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = [*(id *)(a1 + 304) mergeQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__HDDatabase__mergeSecondaryJournalsWithActivity_completion___block_invoke;
    block[3] = &unk_1E62FC8D8;
    block[4] = a1;
    id v9 = v5;
    id v10 = v6;
    dispatch_sync(v7, block);
  }
}

- (void)dealloc
{
  [(HDAssertionManager *)self->_assertionManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)HDDatabase;
  [(HDDatabase *)&v3 dealloc];
}

+ (__CFString)_stateDebugName:(uint64_t)a1
{
  self;
  if (a2 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"HDDatabaseState Unknown (%d)", a2);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v3 = off_1E62FCA08[a2];
  }

  return v3;
}

- (uint64_t)_transitionToState:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v4 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5 != a2)
  {
    switch(a2)
    {
      case 1uLL:
        if (!v5) {
          goto LABEL_14;
        }
        _HKInitializeLogging();
        id v6 = (id)*MEMORY[0x1E4F29F18];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          uint64_t v7 = +[HDDatabase _stateDebugName:]((uint64_t)HDDatabase, *(void *)(a1 + 16));
          int v15 = 138543362;
          v16 = v7;
          _os_log_fault_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_FAULT, "HDDatabase attempted to transition to HDDatabaseStateInitialized from %{public}@", (uint8_t *)&v15, 0xCu);
        }
        goto LABEL_22;
      case 2uLL:
        if (v5 == 1) {
          goto LABEL_14;
        }
        _HKInitializeLogging();
        id v6 = (id)*MEMORY[0x1E4F29F18];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          id v8 = +[HDDatabase _stateDebugName:]((uint64_t)HDDatabase, *(void *)(a1 + 16));
          int v15 = 138543362;
          v16 = v8;
          _os_log_fault_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_FAULT, "HDDatabase attempted to transition to HDDatabaseStateAddResources from %{public}@", (uint8_t *)&v15, 0xCu);
        }
        goto LABEL_22;
      case 3uLL:
        if ((unint64_t)(v5 - 1) < 2) {
          goto LABEL_14;
        }
        _HKInitializeLogging();
        id v6 = (id)*MEMORY[0x1E4F29F18];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          id v9 = +[HDDatabase _stateDebugName:]((uint64_t)HDDatabase, *(void *)(a1 + 16));
          int v15 = 138543362;
          v16 = v9;
          _os_log_fault_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_FAULT, "HDDatabase attempted to transition to HDDatabaseStateStart from %{public}@", (uint8_t *)&v15, 0xCu);
        }
        goto LABEL_22;
      case 4uLL:
        if (v5 == 3)
        {
LABEL_14:
          *(void *)(a1 + 16) = a2;
LABEL_16:
          id v10 = +[HDDatabase _stateDebugName:]((uint64_t)HDDatabase, a2);
          os_unfair_lock_unlock(v4);
          if (v10)
          {
            _HKInitializeLogging();
            uint64_t v11 = *MEMORY[0x1E4F29F18];
            uint64_t v12 = 1;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
            {
              int v15 = 138543362;
              v16 = v10;
              _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_INFO, "HDDatabase transitioned to state %{public}@", (uint8_t *)&v15, 0xCu);
            }
          }
          else
          {
            uint64_t v12 = 1;
          }
          goto LABEL_24;
        }
        _HKInitializeLogging();
        id v6 = (id)*MEMORY[0x1E4F29F18];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          uint64_t v14 = +[HDDatabase _stateDebugName:]((uint64_t)HDDatabase, *(void *)(a1 + 16));
          int v15 = 138543362;
          v16 = v14;
          _os_log_fault_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_FAULT, "HDDatabase attempted to transition to HDDatabaseStateRun from %{public}@", (uint8_t *)&v15, 0xCu);
        }
LABEL_22:

        break;
      case 5uLL:
        *(void *)(a1 + 16) = 5;
        if (v5 == 5) {
          break;
        }
        goto LABEL_16;
      default:
        break;
    }
  }
  os_unfair_lock_unlock(v4);
  uint64_t v12 = 0;
  id v10 = 0;
LABEL_24:

  return v12;
}

- (void)enterStateInitialized
{
  if (-[HDDatabase _transitionToState:]((uint64_t)self, 1uLL))
  {
    transactionStartGroup = self->_transactionStartGroup;
    dispatch_group_enter(transactionStartGroup);
  }
}

- (void)enterStateRun
{
  protectedDataQueue = self->_protectedDataQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__HDDatabase_enterStateRun__block_invoke;
  block[3] = &unk_1E62FC630;
  block[4] = self;
  dispatch_sync(protectedDataQueue, block);
}

void __27__HDDatabase_enterStateRun__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (-[HDDatabase _transitionToState:](*(void *)(a1 + 32), 3uLL))
  {
    if ([*(id *)(*(void *)(a1 + 32) + 400) deviceUnlockedSinceBoot])
    {
      id v2 = *(id *)(*(void *)(a1 + 32) + 176);
      uint64_t v3 = *(void *)(a1 + 32);
      v4 = *(void **)(v3 + 176);
      *(void *)(v3 + 176) = 0;

      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = v2;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v11;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v5);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v8));
            ++v8;
          }
          while (v6 != v8);
          uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v6);
      }
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      if (!*(unsigned char *)(v9 + 112))
      {
        *(unsigned char *)(v9 + 184) = 1;
        os_unfair_lock_lock((os_unfair_lock_t)(v9 + 80));
        *(void *)(v9 + 104) = 0;
        os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 80));
        [*(id *)(v9 + 400) addSynchronousContentProtectionObserver:v9];
        -[HDDatabase _protectedDataQueue_contentProtectionStateChanged:previousState:](v9, [*(id *)(v9 + 400) observedState], 0);
        *(unsigned char *)(v9 + 112) = 1;
        dispatch_group_leave(*(dispatch_group_t *)(v9 + 120));
        uint64_t v9 = *(void *)(a1 + 32);
      }
    }
    -[HDDatabase _transitionToState:](v9, 4uLL);
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 168));
  }
}

- (void)enterStateAddResources
{
}

- (void)addProtectedResourceStores:(id)a3
{
  id v4 = a3;
  if (self
    && (os_unfair_lock_lock(&self->_stateLock),
        int64_t state = self->_state,
        os_unfair_lock_unlock(&self->_stateLock),
        state == 2)
    || (-[HDDatabase _transitionToState:]((uint64_t)self, 2uLL) & 1) != 0)
  {
    protectedDataQueue = self->_protectedDataQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __41__HDDatabase_addProtectedResourceStores___block_invoke;
    v8[3] = &unk_1E62FC658;
    id v9 = v4;
    long long v10 = self;
    dispatch_sync(protectedDataQueue, v8);
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v7 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_FAULT, "Unable to add protected resources", buf, 2u);
    }
  }
}

void __41__HDDatabase_addProtectedResourceStores___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 264), "addObject:", *(void *)(*((void *)&v6 + 1) + 8 * v5++), (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_threadLocalTransaction
{
  v1 = a1;
  if (a1)
  {
    id v2 = [MEMORY[0x1E4F29060] currentThread];
    uint64_t v3 = [v2 threadDictionary];
    v1 = [v3 objectForKey:v1[40]];
  }

  return v1;
}

- (id)_threadLocalTransactionContext
{
  if (a1)
  {
    id v2 = [MEMORY[0x1E4F29060] currentThread];
    uint64_t v3 = [v2 threadDictionary];
    uint64_t v4 = [v3 objectForKey:*(void *)(a1 + 328)];

    uint64_t v5 = [v4 lastObject];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (off_t)_fileSizeForURL:(uint64_t)a3 error:
{
  id v5 = a2;
  long long v6 = v5;
  if (a1)
  {
    id v7 = v5;
    if (stat((const char *)[v7 fileSystemRepresentation], &v12))
    {
      if (*__error() != 2)
      {
        long long v8 = (void *)MEMORY[0x1E4F28C58];
        long long v9 = __error();
        objc_msgSend(v8, "hk_assignError:code:format:", a3, 102, @"Failed to retrieve size for file at '%@': %s", v7, strerror(*v9));
      }
      off_t st_size = -1;
    }
    else
    {
      off_t st_size = v12.st_size;
    }
  }
  else
  {
    off_t st_size = 0;
  }

  return st_size;
}

void __62__HDDatabase__canAccessProtectedDatabaseForTransaction_error___block_invoke(uint64_t a1)
{
}

- (void)_protectedDataQueue_mergeJournalWithPrimaryJournalMergeCompletion:(uint64_t)a1
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 72));
    id v2 = [*(id *)(a1 + 296) mergeQueue];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __80__HDDatabase__protectedDataQueue_mergeJournalWithPrimaryJournalMergeCompletion___block_invoke;
    v3[3] = &unk_1E62FC6D0;
    v3[4] = a1;
    id v4 = 0;
    dispatch_async(v2, v3);
  }
}

- (id)databasePoolForDatabaseType:(int64_t)a3
{
  databasePoolForType = self->_databasePoolForType;
  id v7 = objc_msgSend(NSNumber, "numberWithInteger:");
  long long v8 = [(NSDictionary *)databasePoolForType objectForKeyedSubscript:v7];

  if (!v8)
  {
    long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = HDStringFromHDDatabaseType(a3);
    [v10 handleFailureInMethod:a2, self, @"HDDatabase.mm", 516, @"Missing database pool for type %@", v11 object file lineNumber description];
  }

  return v8;
}

- (uint64_t)_performWithTransactionContext:(int)a3 merge:(void *)a4 error:(void *)a5 block:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  long long v10 = a5;
  if (!a1)
  {
    char v21 = 0;
    goto LABEL_28;
  }
  uint64_t v11 = -[HDDatabase _threadLocalTransaction](a1);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Cannot set database transaction context inside transaction");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    long long v13 = v12;
    if (v12)
    {
      if (a4) {
        *a4 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }

    _HKInitializeLogging();
    v20 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      int v27 = 138543362;
      id v28 = v13;
      _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "Failed to set transaction context: %{public}@", (uint8_t *)&v27, 0xCu);
    }

    char v21 = 0;
    goto LABEL_27;
  }
  uint64_t v14 = [MEMORY[0x1E4F29060] currentThread];
  uint64_t v15 = [v14 threadDictionary];

  id v16 = [v15 objectForKeyedSubscript:a1[41]];
  if (!v16)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v15 setObject:v16 forKey:a1[41]];
  }
  id v17 = v9;
  if (([v17 requiresProtectedData] & 1) != 0 || objc_msgSend(v17, "requiresWrite"))
  {
    _HKInitializeLogging();
    uint64_t v18 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
    {
      int v27 = 138543362;
      id v28 = v17;
      _os_log_fault_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_FAULT, "Over-specified transaction context for performWithTransactionContext:error:block:. Contexts should not specify transaction properties like requiresProtectedData or requiresWrite. (%{public}@)", (uint8_t *)&v27, 0xCu);
    }
    id v19 = (id)[v17 mutableCopy];
    [v19 setRequiresProtectedData:0];
    [v19 setRequiresWrite:0];
  }
  else
  {
    id v19 = v17;
  }

  if (a3)
  {
    uint64_t v22 = -[HDDatabase _threadLocalTransactionContext]((uint64_t)a1);
    v23 = v22;
    if (v22)
    {
      uint64_t v24 = [v22 mergedContextWithContext:v19 error:a4];
    }
    else
    {
      uint64_t v24 = [v19 copy];
    }
    v25 = (void *)v24;
    if (!v24)
    {

      char v21 = 0;
      goto LABEL_26;
    }
    [v16 addObject:v24];
  }
  else
  {
    [v16 addObject:v19];
  }
  char v21 = v10[2](v10, a4);
  [v16 removeLastObject];
LABEL_26:

LABEL_27:
LABEL_28:

  return v21 & 1;
}

- (BOOL)performWithTransactionContext:(id)a3 error:(id *)a4 block:(id)a5
{
  return -[HDDatabase _performWithTransactionContext:merge:error:block:](self, a3, 1, a4, a5);
}

- (BOOL)performTransactionWithContext:(id)a3 error:(id *)a4 block:(id)a5 inaccessibilityHandler:(id)a6
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v128 = a5;
  id v11 = a6;
  if (-[HDDatabase _isDatabaseValidWithError:]((os_unfair_lock_s *)self, (uint64_t)a4))
  {
    if ([(HDContentProtectionManager *)self->_contentProtectionManager deviceUnlockedSinceBoot])
    {
      v126 = v11;
      id v12 = [MEMORY[0x1E4F29060] currentThread];
      v124 = [v12 threadDictionary];

      -[HDDatabase _threadLocalTransaction](self);
      v127 = (HDDatabaseTransaction *)objc_claimAutoreleasedReturnValue();
      int v123 = [v10 requiresWrite];
      if (v127)
      {
        long long v13 = [(HDDatabaseTransaction *)v127 rootContext];
        id v138 = 0;
        char v14 = [v13 containsContext:v10 error:&v138];
        id v15 = v138;

        if ((v14 & 1) == 0)
        {
          _HKInitializeLogging();
          char v21 = (id)*MEMORY[0x1E4F29F18];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
          {
            uint64_t v58 = [v15 localizedDescription];
            *(_DWORD *)buf = 138412290;
            v156 = v58;
            _os_log_fault_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_FAULT, "Incompatible nested transaction context: %@", buf, 0xCu);
          }
          uint64_t v22 = (HDDatabaseJournal *)v15;
          v23 = v22;
          if (v22)
          {
            if (a4)
            {
              v23 = v22;
              char v24 = 0;
              *a4 = v23;
            }
            else
            {
              _HKLogDroppedError();
              char v24 = 0;
            }
            v122 = v23;
          }
          else
          {
            v122 = 0;
            char v24 = 0;
          }
          goto LABEL_145;
        }

        id v16 = v127;
      }
      else
      {
        id v19 = -[HDDatabase _threadLocalTransactionContext]((uint64_t)self);
        if (!v19)
        {
          if (v10) {
            v20 = (HDDatabaseTransactionContext *)v10;
          }
          else {
            v20 = objc_alloc_init(HDDatabaseTransactionContext);
          }
          id v19 = v20;
        }
        v25 = [v19 mergedContextWithContext:v10 error:a4];

        if (!v25)
        {
          char v24 = 0;
LABEL_146:

          id v11 = v126;
          goto LABEL_147;
        }
        id v16 = [[HDDatabaseTransaction alloc] initWithDatabase:self provider:self rootContext:v25];
      }
      v26 = [(HDDatabaseTransaction *)v16 rootContext];
      v125 = v16;
      -[HDDatabase _journalForType:](self, "_journalForType:", [v26 journalType]);
      v122 = (HDDatabaseJournal *)objc_claimAutoreleasedReturnValue();

      if (v127)
      {
        LOBYTE(v123) = 0;
        v23 = 0;
        goto LABEL_111;
      }
      [(HDDatabaseTransaction *)v16 rootContext];
      v137 = 0;
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock(&self->_stateLock);
      int64_t state = self->_state;
      os_unfair_lock_unlock(&self->_stateLock);
      id v120 = v27;
      if (state != 4)
      {
        uint64_t v29 = [(HDDatabase *)self profile];
        v30 = [v29 daemon];
        v31 = [v30 behavior];
        int v32 = [v31 isAppleInternalInstall];

        if (v32)
        {
          _HKInitializeLogging();
          v33 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_FAULT, "Detected transaction start before profileReady. Please delay access to the database until profileReady has been called for the profile; this is already mandatory for protected data transactions and will block all"
              " transactions in the future. Reach out to the HealthKit team with questions.",
              buf,
              2u);
          }
        }
      }
      if ([v27 skipTransactionStartTasks])
      {
        char v34 = 1;
        goto LABEL_89;
      }
      if ([v27 requiresProtectedData])
      {
        -[HDDatabase _journalForType:](self, "_journalForType:", [v27 journalType]);
        uint64_t v35 = (HDDatabaseJournal *)objc_claimAutoreleasedReturnValue();
        if (v35 != self->_journal && ([v27 skipJournalMerge] & 1) == 0)
        {
          v36 = objc_alloc_init(HDDatabaseTransactionContext);
          v139[0] = MEMORY[0x1E4F143A8];
          v139[1] = 3221225472;
          v139[2] = __68__HDDatabase__waitForTransactionStartTasksIfNeededForContext_error___block_invoke;
          v139[3] = &unk_1E62FC900;
          v37 = v35;
          v140 = v37;
          v141 = self;
          char v38 = -[HDDatabase _performWithTransactionContext:merge:error:block:](self, v36, 0, &v137, v139);

          if ((v38 & 1) == 0)
          {

LABEL_87:
            char v34 = 0;
            goto LABEL_88;
          }
        }
        dispatch_group_wait((dispatch_group_t)self->_transactionStartGroup, 0xFFFFFFFFFFFFFFFFLL);
      }
      os_unfair_lock_lock(&self->_transactionStartLock);
      id v39 = v27;
      locuint64_t k = &self->_transactionStartLock;
      os_unfair_lock_assert_owner(&self->_transactionStartLock);
      p_firstUnprotectedWriteTransactionBlocks = (id *)&self->_firstUnprotectedWriteTransactionBlocks;
      if (self->_firstUnprotectedWriteTransactionBlocks) {
        goto LABEL_42;
      }
      if ([v39 requiresProtectedData])
      {
        if (self->_firstProtectedWriteTransactionBlocks || self->_journalMergeEpoch != self->_mergedJournalEpoch)
        {
LABEL_42:

LABEL_43:
          id v117 = v39;
          os_unfair_lock_assert_owner(lock);
          id obja = *p_firstUnprotectedWriteTransactionBlocks;
          v41 = (os_unfair_lock_s *)*p_firstUnprotectedWriteTransactionBlocks;
          id v42 = *p_firstUnprotectedWriteTransactionBlocks;
          id *p_firstUnprotectedWriteTransactionBlocks = 0;

          if ([v117 requiresProtectedData])
          {
            v115 = self->_firstProtectedWriteTransactionBlocks;
            firstProtectedWriteTransactionBlocks = self->_firstProtectedWriteTransactionBlocks;
            self->_firstProtectedWriteTransactionBlocks = 0;
          }
          else
          {
            v115 = 0;
          }
          if (![(os_unfair_lock_s *)v41 count] && ![(NSMutableArray *)v115 count])
          {

            p_transactionStartLocuint64_t k = &self->_transactionStartLock;
            os_unfair_lock_unlock(lock);
LABEL_81:
            id v118 = v117;
            if (([v118 requiresProtectedData] & 1) == 0) {
              goto LABEL_85;
            }
            if ([v118 skipJournalMerge])
            {
              -[HDDatabase _journalForType:](self, "_journalForType:", [v118 journalType]);
              id v62 = (HDDatabaseJournal *)objc_claimAutoreleasedReturnValue();
              BOOL v63 = v62 == self->_journal;

              p_transactionStartLocuint64_t k = &self->_transactionStartLock;
              if (v63) {
                goto LABEL_85;
              }
            }
            os_unfair_lock_lock(p_transactionStartLock);
            os_unfair_lock_lock(&self->_protectedDataLock);
            unint64_t journalMergeEpoch = self->_journalMergeEpoch;
            int64_t protectedDataState = self->_protectedDataState;
            os_unfair_lock_unlock(&self->_protectedDataLock);
            os_unfair_lock_unlock(p_transactionStartLock);
            if (protectedDataState)
            {
LABEL_85:
              char v34 = 1;
LABEL_86:

              goto LABEL_88;
            }
            obuint64_t j = 138543362;
            p_protectedDataLocuint64_t k = &self->_protectedDataLock;
            while (1)
            {
              id v91 = v118;
              id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
              if (WeakRetained)
              {
                objc_super v93 = objc_alloc_init(HDMutableDatabaseTransactionContext);
                id v116 = v91;
                [(HDMutableDatabaseTransactionContext *)v93 setSkipTransactionStartTasks:1];
                long long v144 = 0u;
                long long v145 = 0u;
                long long v142 = 0u;
                long long v143 = 0u;
                v94 = [v91 accessibilityAssertions];
                uint64_t v95 = [v94 countByEnumeratingWithState:&v142 objects:buf count:16];
                if (v95)
                {
                  uint64_t v96 = *(void *)v143;
                  do
                  {
                    for (uint64_t i = 0; i != v95; ++i)
                    {
                      if (*(void *)v143 != v96) {
                        objc_enumerationMutation(v94);
                      }
                      -[HDMutableDatabaseTransactionContext addAccessibilityAssertion:](v93, "addAccessibilityAssertion:", *(void *)(*((void *)&v142 + 1) + 8 * i), obj);
                    }
                    uint64_t v95 = [v94 countByEnumeratingWithState:&v142 objects:buf count:16];
                  }
                  while (v95);
                }

                id v91 = v116;
                id v151 = 0;
                *(void *)&long long v147 = MEMORY[0x1E4F143A8];
                *((void *)&v147 + 1) = 3221225472;
                *(void *)&long long v148 = __51__HDDatabase__mergePrimaryJournalForContext_error___block_invoke;
                *((void *)&v148 + 1) = &unk_1E62FC900;
                *(void *)&long long v149 = self;
                *((void *)&v149 + 1) = WeakRetained;
                char v34 = -[HDDatabase _performWithTransactionContext:merge:error:block:](self, v93, 0, &v151, &v147);
                v98 = (HDMutableDatabaseTransactionContext *)v151;
                v99 = v98;
                if ((v34 & 1) == 0)
                {
                  if ([(HDMutableDatabaseTransactionContext *)v98 hk_isDatabaseAccessibilityError])
                  {
                    v100 = v99;
                    if (v100)
                    {
                      v101 = v100;
                      v137 = v101;
                    }
                    else
                    {
                      v101 = 0;
                    }
                  }
                  else
                  {
                    _HKInitializeLogging();
                    v103 = *MEMORY[0x1E4F29F18];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v153 = obj;
                      v154 = v99;
                      _os_log_error_impl(&dword_1BCB7D000, v103, OS_LOG_TYPE_ERROR, "Journal merge failed with non-accessibility error: %{public}@", v153, 0xCu);
                    }
                    objc_msgSend(MEMORY[0x1E4F28C58], "hk_protectedDataInaccessibilityError", obj);
                    v104 = (HDMutableDatabaseTransactionContext *)(id)objc_claimAutoreleasedReturnValue();
                    v101 = v104;
                    if (v104) {
                      v137 = v104;
                    }
                  }
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E4F28C58], "hk_protectedDataInaccessibilityError");
                id v102 = (id)objc_claimAutoreleasedReturnValue();
                if (v102)
                {
                  v99 = (HDMutableDatabaseTransactionContext *)v102;
                  char v34 = 0;
                  v137 = v99;
                  objc_super v93 = v99;
                }
                else
                {
                  v99 = 0;
                  objc_super v93 = 0;
                  char v34 = 0;
                }
              }

              os_unfair_lock_lock(lock);
              os_unfair_lock_lock(p_protectedDataLock);
              unint64_t v105 = self->_journalMergeEpoch;
              if ((v34 & 1) == 0) {
                break;
              }
              if (journalMergeEpoch == v105) {
                self->_mergedJournalEpoch = journalMergeEpoch;
              }
              else {
                unint64_t journalMergeEpoch = self->_mergedJournalEpoch;
              }
              int64_t v106 = self->_protectedDataState;
              if (v105 != journalMergeEpoch || v106)
              {
                if (v105 != journalMergeEpoch) {
                  goto LABEL_183;
                }
LABEL_182:
                BOOL v107 = 0;
                goto LABEL_184;
              }
              BOOL v107 = 0;
              self->_int64_t protectedDataState = 1;
LABEL_184:
              os_unfair_lock_unlock(p_protectedDataLock);
              os_unfair_lock_unlock(lock);
              char v108 = v34 & v107;
              unint64_t journalMergeEpoch = v105;
              if ((v108 & 1) == 0) {
                goto LABEL_86;
              }
            }
            if (v105 != self->_mergedJournalEpoch)
            {
              int64_t v106 = self->_protectedDataState;
LABEL_183:
              BOOL v107 = v106 == 0;
              goto LABEL_184;
            }
            goto LABEL_182;
          }
          if ([v117 requiresProtectedData]) {
            +[HDMutableDatabaseTransactionContext contextForWritingProtectedData];
          }
          else {
          id v46 = +[HDMutableDatabaseTransactionContext contextForWriting];
          }
          os_unfair_lock_t v112 = v41;
          [v46 setSkipTransactionStartTasks:1];
          [v46 setSkipJournalMerge:1];
          long long v149 = 0u;
          long long v150 = 0u;
          long long v147 = 0u;
          long long v148 = 0u;
          v47 = [v117 accessibilityAssertions];
          uint64_t v48 = [v47 countByEnumeratingWithState:&v147 objects:buf count:16];
          if (v48)
          {
            uint64_t v49 = *(void *)v148;
            do
            {
              for (uint64_t j = 0; j != v48; ++j)
              {
                if (*(void *)v148 != v49) {
                  objc_enumerationMutation(v47);
                }
                [v46 addAccessibilityAssertion:*(void *)(*((void *)&v147 + 1) + 8 * j)];
              }
              uint64_t v48 = [v47 countByEnumeratingWithState:&v147 objects:buf count:16];
            }
            while (v48);
          }

          v51 = objc_alloc_init(HDDatabaseTransactionContext);
          id v151 = 0;
          *(void *)&long long v142 = MEMORY[0x1E4F143A8];
          *((void *)&v142 + 1) = 3221225472;
          *(void *)&long long v143 = __86__HDDatabase__transactionStartLock_runFirstTransactionBlocksIfNeededForContext_error___block_invoke;
          *((void *)&v143 + 1) = &unk_1E62FC950;
          *(void *)&long long v144 = self;
          id v111 = v46;
          *((void *)&v144 + 1) = v111;
          v52 = v112;
          *(void *)&long long v145 = v52;
          id v53 = v117;
          *((void *)&v145 + 1) = v53;
          uint64_t v54 = v115;
          v146 = v54;
          char v55 = -[HDDatabase _performWithTransactionContext:merge:error:block:](self, v51, 0, &v151, &v142);
          id location = (id *)v151;

          if ((v55 & 1) == 0)
          {
            if (objc_msgSend(location, "hk_isDatabaseAccessibilityError"))
            {
              v56 = location;
              if (v56)
              {
                v57 = v56;
                v137 = (HDMutableDatabaseTransactionContext *)v57;
              }
              else
              {
                v57 = 0;
              }
            }
            else
            {
              if ((HKIsUnitTesting() & 1) == 0)
              {
                _HKInitializeLogging();
                v59 = *MEMORY[0x1E4F29F18];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v153 = 138543362;
                  v154 = (HDMutableDatabaseTransactionContext *)location;
                  _os_log_error_impl(&dword_1BCB7D000, v59, OS_LOG_TYPE_ERROR, "First transaction block failed with non-accessibility error: %{public}@", v153, 0xCu);
                }
              }
              objc_msgSend(MEMORY[0x1E4F28C58], "hk_protectedDataInaccessibilityError");
              id v60 = (id *)(id)objc_claimAutoreleasedReturnValue();
              v57 = v60;
              if (v60) {
                v137 = v60;
              }
            }
            objc_storeStrong((id *)&self->_firstUnprotectedWriteTransactionBlocks, (id)obj);
            if ([v53 requiresProtectedData]) {
              objc_storeStrong((id *)&self->_firstProtectedWriteTransactionBlocks, v115);
            }
          }

          p_transactionStartLocuint64_t k = &self->_transactionStartLock;
          os_unfair_lock_unlock(lock);
          if (v55) {
            goto LABEL_81;
          }
          goto LABEL_87;
        }
        -[HDDatabase _journalForType:](self, "_journalForType:", [v39 journalType]);
        uint64_t v44 = (HDDatabaseJournal *)objc_claimAutoreleasedReturnValue();
        BOOL v45 = v44 == self->_journal;

        if (!v45) {
          goto LABEL_43;
        }
      }
      else
      {
      }
      os_unfair_lock_unlock(lock);
      char v34 = 1;
LABEL_88:
      id v27 = v120;
LABEL_89:

      v66 = v137;
      v67 = [(HDDatabaseTransaction *)v125 rootContext];
      if ([v67 requiresProtectedData])
      {
        v68 = [(HDDatabaseTransaction *)v125 rootContext];
        char v69 = [v68 skipTransactionStartTasks];

        if (v69) {
          goto LABEL_94;
        }
        uint64_t v70 = _Block_copy(self->_unitTest_didWaitForJournalMergeHandler);
        v67 = v70;
        if (v70) {
          (*((void (**)(void *, HDDatabase *))v70 + 2))(v70, self);
        }
      }

LABEL_94:
      if (v123)
      {
        v71 = [(HDDatabaseTransaction *)v125 rootContext];
        char v72 = [v71 skipJournalMerge];

        v73 = (uint64_t (**)(void, id, id *))v126;
        if ((v72 & 1) == 0) {
          [(HDDatabaseJournal *)v122 lock];
        }
        if (v122 == self->_journal)
        {
          [(HDDatabaseJournal *)self->_cloudSyncJournal interruptJournalMerge];
          v23 = (HDDatabaseJournal *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [(HDDatabaseJournal *)v23 addObject:self->_cloudSyncJournal];
        }
        else
        {
          v23 = 0;
        }
        [(NSLock *)self->_writeLock lock];
        goto LABEL_109;
      }
      uint64_t v74 = [(HDDatabaseTransaction *)v125 rootContext];
      if ([v74 requiresProtectedData])
      {
        v75 = [(HDDatabaseTransaction *)v125 rootContext];
        int v76 = [v75 allowsJournalingDuringProtectedRead];
        if (v126) {
          int v77 = v76;
        }
        else {
          int v77 = 0;
        }

        if (!v77) {
          goto LABEL_106;
        }
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __79__HDDatabase_performTransactionWithContext_error_block_inaccessibilityHandler___block_invoke;
        aBlock[3] = &unk_1E62FC680;
        v135 = v122;
        id v136 = v126;
        v126 = _Block_copy(aBlock);

        uint64_t v74 = v135;
      }

LABEL_106:
      v23 = 0;
      v73 = (uint64_t (**)(void, id, id *))v126;
LABEL_109:
      objc_msgSend(v124, "setObject:forKeyedSubscript:", v125, self->_threadLocalTransactionKey, obj);
      v126 = v73;
      if ((v34 & 1) == 0)
      {
        int v86 = [(HDMutableDatabaseTransactionContext *)v66 hk_isDatabaseAccessibilityError];
        if (v73) {
          int v87 = v86;
        }
        else {
          int v87 = 0;
        }
        if (v87 == 1)
        {
          char v24 = v73[2](v73, v66, a4);
        }
        else
        {
          v88 = v66;
          id v89 = v88;
          if (v88)
          {
            v121 = v88;
            if (a4)
            {
              *a4 = v88;
              id v89 = v121;
            }
            else
            {
              id v89 = v88;
              _HKLogDroppedError();
            }
          }

          char v24 = 0;
        }

        dispatch_group_t v80 = 0;
        BOOL v78 = 0;
        if (!v123) {
          goto LABEL_139;
        }
        goto LABEL_116;
      }

LABEL_111:
      id v133 = 0;
      BOOL v78 = [(HDDatabaseTransaction *)v125 performWithContext:v10 error:&v133 block:v128 inaccessibilityHandler:v126];
      id v79 = v133;
      dispatch_group_t v80 = v79;
      if (v79)
      {
        if (a4) {
          *a4 = v79;
        }
        else {
          _HKLogDroppedError();
        }
      }

      char v24 = v78;
      if ((v123 & 1) == 0)
      {
LABEL_126:
        if (v127)
        {
LABEL_144:

          v127 = v125;
LABEL_145:

          goto LABEL_146;
        }
LABEL_139:
        [v124 removeObjectForKey:self->_threadLocalTransactionKey];
        if (v78)
        {
          [(HDDatabaseTransaction *)v125 transactionDidEndWithError:0];
        }
        else
        {
          if (!v80)
          {
            dispatch_group_t v80 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 124, @"Transaction failed with unknown error");
          }
          [(HDDatabaseTransaction *)v125 transactionDidEndWithError:v80];
        }
        goto LABEL_144;
      }
LABEL_116:
      long long v131 = 0u;
      long long v132 = 0u;
      long long v129 = 0u;
      long long v130 = 0u;
      v23 = v23;
      uint64_t v81 = [(HDDatabaseJournal *)v23 countByEnumeratingWithState:&v129 objects:v152 count:16];
      if (v81)
      {
        uint64_t v82 = *(void *)v130;
        do
        {
          for (uint64_t k = 0; k != v81; ++k)
          {
            if (*(void *)v130 != v82) {
              objc_enumerationMutation(v23);
            }
            [*(id *)(*((void *)&v129 + 1) + 8 * k) resumeJournalMerge];
          }
          uint64_t v81 = [(HDDatabaseJournal *)v23 countByEnumeratingWithState:&v129 objects:v152 count:16];
        }
        while (v81);
      }

      v84 = [(HDDatabaseTransaction *)v125 rootContext];
      char v85 = [v84 skipJournalMerge];

      if ((v85 & 1) == 0) {
        [(HDDatabaseJournal *)v122 unlock];
      }
      [(NSLock *)self->_writeLock unlock];
      goto LABEL_126;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_databaseInaccessibleBeforeFirstUnlockError");
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = v17;
    if (v17)
    {
      if (a4) {
        *a4 = v17;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  char v24 = 0;
LABEL_147:

  return v24;
}

uint64_t __79__HDDatabase_performTransactionWithContext_error_block_inaccessibilityHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) lock];
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) unlock];

  return v4;
}

- (BOOL)performHighPriorityTransactionsWithError:(id *)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = +[HDDatabaseTransactionContext highPriorityContext];
  LOBYTE(a3) = [(HDDatabase *)self performWithTransactionContext:v7 error:a3 block:v6];

  return (char)a3;
}

- (void)_performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:(void *)a3 block:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1 && v6)
  {
    if (!v5)
    {
      dispatch_get_global_queue(21, 0);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__HDDatabase__performWhenDataProtectedByFirstUnlockIsAvailableOnQueue_block___block_invoke;
    aBlock[3] = &unk_1E62FC6D0;
    id v5 = v5;
    id v17 = v5;
    id v18 = v7;
    long long v8 = _Block_copy(aBlock);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__HDDatabase__performWhenDataProtectedByFirstUnlockIsAvailableOnQueue_block___block_invoke_3;
    v14[3] = &unk_1E62FC6F8;
    v14[4] = a1;
    id v7 = v8;
    id v15 = v7;
    id v9 = (uint64_t (**)(void))_Block_copy(v14);
    if ((v9[2]() & 1) == 0)
    {
      id v10 = *(NSObject **)(a1 + 72);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __77__HDDatabase__performWhenDataProtectedByFirstUnlockIsAvailableOnQueue_block___block_invoke_4;
      block[3] = &unk_1E62FC720;
      block[4] = a1;
      id v12 = v9;
      id v13 = v7;
      dispatch_async(v10, block);
    }
  }
}

- (void)performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:(id)a3 block:(id)a4
{
}

void __77__HDDatabase__performWhenDataProtectedByFirstUnlockIsAvailableOnQueue_block___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__HDDatabase__performWhenDataProtectedByFirstUnlockIsAvailableOnQueue_block___block_invoke_2;
  block[3] = &unk_1E62FC6A8;
  v1 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

void __77__HDDatabase__performWhenDataProtectedByFirstUnlockIsAvailableOnQueue_block___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1C187C0E0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__HDDatabase__performWhenDataProtectedByFirstUnlockIsAvailableOnQueue_block___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 400) deviceUnlockedSinceBoot];
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3
      && (uint64_t v4 = (os_unfair_lock_s *)(v3 + 8),
          os_unfair_lock_lock((os_unfair_lock_t)(v3 + 8)),
          uint64_t v5 = *(void *)(v3 + 16),
          os_unfair_lock_unlock(v4),
          v5 == 4))
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void __77__HDDatabase__performWhenDataProtectedByFirstUnlockIsAvailableOnQueue_block___block_invoke_4(uint64_t a1)
{
  if ((-[HDDatabase isInvalid](*(os_unfair_lock_s **)(a1 + 32)) & 1) == 0
    && ((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))() & 1) == 0)
  {
    id v2 = *(void **)(*(void *)(a1 + 32) + 176);
    if (!v2)
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void **)(v4 + 176);
      *(void *)(v4 + 176) = v3;

      id v2 = *(void **)(*(void *)(a1 + 32) + 176);
    }
    id v6 = _Block_copy(*(const void **)(a1 + 48));
    objc_msgSend(v2, "addObject:");
  }
}

- (os_unfair_lock_s)isInvalid
{
  if (result)
  {
    v1 = result;
    id v2 = result + 2;
    os_unfair_lock_lock(result + 2);
    uint64_t v3 = *(void *)&v1[4]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)(v3 == 5);
  }
  return result;
}

- (void)performAsynchronouslySerial:(id)a3
{
}

- (BOOL)performWithJournalType:(int64_t)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a5;
  id v9 = objc_alloc_init(HDMutableDatabaseTransactionContext);
  [(HDMutableDatabaseTransactionContext *)v9 setJournalType:a3];
  LOBYTE(a4) = [(HDDatabase *)self performWithTransactionContext:v9 error:a4 block:v8];

  return (char)a4;
}

- (id)beginExtendedTransactionWithContext:(id)a3 transactionTimeout:(double)a4 continuationTimeout:(double)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = [[HDExtendedDatabaseTransaction alloc] initWithDatabase:self context:v10 transactionTimeout:a6 continuationTimeout:a4 error:a5];
  id v12 = v11;
  if (v11)
  {
    protectedDataQueue = self->_protectedDataQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __95__HDDatabase_beginExtendedTransactionWithContext_transactionTimeout_continuationTimeout_error___block_invoke;
    v15[3] = &unk_1E62FC658;
    v15[4] = self;
    id v16 = v11;
    dispatch_sync(protectedDataQueue, v15);
  }

  return v12;
}

void __95__HDDatabase_beginExtendedTransactionWithContext_transactionTimeout_continuationTimeout_error___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 384);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 384);
    *(void *)(v4 + 384) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 384);
  }
  id v6 = *(void **)(a1 + 40);
  id v7 = [v6 transactionIdentifier];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6);
}

- (id)extendedDatabaseTransactionForIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HDDatabase.mm", 881, @"Invalid parameter not satisfying: %@", @"transactionIdentifier != nil" object file lineNumber description];
  }
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__68;
  id v18 = __Block_byref_object_dispose__68;
  id v19 = 0;
  protectedDataQueue = self->_protectedDataQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HDDatabase_extendedDatabaseTransactionForIdentifier___block_invoke;
  block[3] = &unk_1E62FC748;
  id v12 = v5;
  id v13 = &v14;
  void block[4] = self;
  id v7 = v5;
  dispatch_sync(protectedDataQueue, block);
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v8;
}

void __55__HDDatabase_extendedDatabaseTransactionForIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 384) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)finalizeExtendedTransactionForIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDDatabase.mm", 891, @"Invalid parameter not satisfying: %@", @"transactionIdentifier != nil" object file lineNumber description];
  }
  protectedDataQueue = self->_protectedDataQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HDDatabase_finalizeExtendedTransactionForIdentifier___block_invoke;
  block[3] = &unk_1E62FC658;
  void block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(protectedDataQueue, block);
}

uint64_t __55__HDDatabase_finalizeExtendedTransactionForIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 384) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)databaseSizeInBytesForTypeUnprotected:(BOOL)a3 WAL:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3) {
    -[HDDatabase _mainDatabaseURL](self);
  }
  else {
  id v7 = -[HDDatabase _protectedDatabaseURL](self);
  }
  id v8 = v7;
  if (v4)
  {
    id v9 = v7;
    id v10 = v9;
    if (self)
    {
      id v11 = [v9 URLByDeletingPathExtension];
      id v12 = [v11 URLByAppendingPathExtension:@"sqlite-wal"];
    }
    else
    {
      id v12 = 0;
    }

    id v22 = 0;
    off_t v13 = -[HDDatabase _fileSizeForURL:error:]((uint64_t)self, v12, (uint64_t)&v22);
    id v14 = v22;

    if ((v13 & 0x8000000000000000) == 0) {
      goto LABEL_8;
    }
  }
  else
  {
    id v21 = 0;
    off_t v13 = -[HDDatabase _fileSizeForURL:error:]((uint64_t)self, v7, (uint64_t)&v21);
    id v14 = v21;
    if ((v13 & 0x8000000000000000) == 0)
    {
LABEL_8:
      id v15 = [NSNumber numberWithLongLong:v13];
      goto LABEL_19;
    }
  }
  if (v14)
  {
    uint64_t v16 = @"protected";
    if (v5) {
      uint64_t v16 = @"unprotected";
    }
    id v17 = &stru_1F1728D60;
    if (v4) {
      id v17 = @"WAL";
    }
    id v18 = [NSString stringWithFormat:@"%@,%@", v16, v17];
    _HKInitializeLogging();
    id v19 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      char v24 = v18;
      __int16 v25 = 2114;
      id v26 = v14;
      _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "Failed to get database size for %@ : %{public}@", buf, 0x16u);
    }
  }
  id v15 = 0;
LABEL_19:

  return v15;
}

- (void)_mainDatabaseURL
{
  if (a1)
  {
    a1 = [MEMORY[0x1E4F65D18] mainDatabaseURLWithProfileDirectoryPath:a1[4]];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_protectedDatabaseURL
{
  if (a1)
  {
    a1 = [MEMORY[0x1E4F65D18] protectedDatabaseURLWithProfileDirectoryPath:a1[4]];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)databaseSizeInBytes
{
  uint64_t v3 = [(HDDatabase *)self databaseSizeInBytesForTypeUnprotected:1 WAL:0];
  BOOL v4 = v3;
  BOOL v5 = v3 == 0;
  if (v3) {
    uint64_t v6 = [v3 longLongValue];
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = [(HDDatabase *)self databaseSizeInBytesForTypeUnprotected:1 WAL:1];
  id v8 = v7;
  if (v7) {
    v6 += [v7 longLongValue];
  }
  else {
    BOOL v5 = 1;
  }
  id v9 = [(HDDatabase *)self databaseSizeInBytesForTypeUnprotected:0 WAL:0];
  id v10 = v9;
  if (v9) {
    v6 += [v9 longLongValue];
  }
  else {
    BOOL v5 = 1;
  }
  id v11 = [(HDDatabase *)self databaseSizeInBytesForTypeUnprotected:0 WAL:1];
  id v12 = v11;
  if (v11 && (uint64_t v13 = [v11 longLongValue], !v5))
  {
    id v14 = [NSNumber numberWithLongLong:v13 + v6];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)_reportDatabaseMigrationStatus:(int64_t)a3 component:(int64_t)a4 schemaVersion:(int64_t)a5 error:(id)a6
{
  id v10 = a6;
  id v24 = [(HDDatabase *)self _newCorruptionEventStore];
  if (!v10) {
    goto LABEL_7;
  }
  uint64_t v25 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v12 = [WeakRetained profileIdentifier];
  uint64_t v13 = [v24 mostRecentMigrationFailureEventForProfile:v12 component:a4 schemaVersion:&v25];

  if (!v13
    || ([MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0],
        id v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = [v13 compare:v14],
        uint64_t v16 = v25,
        v14,
        v15 != 1)
    || v16 != a5)
  {
    id v17 = objc_loadWeakRetained((id *)&self->_profile);
    id v18 = [v17 profileIdentifier];
    [v24 persistMigrationFailureEventForProfile:v18 component:a4 schemaVersion:a5];

LABEL_7:
    id v19 = HDStringFromDatabaseComponentIdentifier(a4);
    v20 = [(HDDatabase *)self profile];
    id v21 = [v20 daemon];
    id v22 = [v21 analyticsSubmissionCoordinator];
    id v23 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v22, "database_reportDatabaseMigrationStatus:database:schemaVersion:error:profileType:", a3, v19, a5, v10, objc_msgSend(v23, "profileType"));

    goto LABEL_8;
  }

LABEL_8:
}

- (void)_reportSQLiteCorruption:(id)a3 forDatabase:(int64_t)a4 shouldPrompt:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (atomic_exchange(&self->_hasFaultedForCorruptionError._Value, 1u))
  {
    _HKInitializeLogging();
    id v11 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      BOOL v45 = "protected";
      if (!a4) {
        BOOL v45 = "unprotected";
      }
      *(_DWORD *)buf = 136315394;
      v52 = v45;
      __int16 v53 = 2112;
      id v54 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "Corruption of the %s database detected:%@", buf, 0x16u);
    }
  }
  else
  {
    _HKInitializeLogging();
    id v9 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
    {
      id v10 = "protected";
      if (!a4) {
        id v10 = "unprotected";
      }
      *(_DWORD *)buf = 136315394;
      v52 = v10;
      __int16 v53 = 2112;
      id v54 = v8;
      _os_log_fault_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_FAULT, "Corruption of the %s database detected:%@", buf, 0x16u);
    }
  }
  id v49 = [(HDDatabase *)self _newCorruptionEventStore];
  id v50 = 0;
  [v49 dateOfMostRecentObliteration:&v50];
  v47 = BOOL v46 = v5;
  id v48 = v50;
  if (v47)
  {
    id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v13 = NSString;
    -[HDDatabase _protectedDatabaseURL](self);
    id v14 = objc_claimAutoreleasedReturnValue();
    uint64_t v15 = objc_msgSend(v13, "stringWithUTF8String:", objc_msgSend(v14, "fileSystemRepresentation"));
    uint64_t v16 = [v12 attributesOfItemAtPath:v15 error:0];
    id v17 = [v16 fileCreationDate];

    id v18 = NSString;
    -[HDDatabase _mainDatabaseURL](self);
    id v19 = objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "stringWithUTF8String:", objc_msgSend(v19, "fileSystemRepresentation"));
    id v21 = [v12 attributesOfItemAtPath:v20 error:0];
    id v22 = [v21 fileCreationDate];

    if (v17 && [v47 compare:v17] == 1)
    {
      BOOL v23 = 1;
    }
    else if (v22)
    {
      BOOL v23 = [v47 compare:v22] == 1;
    }
    else
    {
      BOOL v23 = 0;
    }
  }
  else
  {
    BOOL v23 = 0;
  }
  id v24 = [(HDDatabase *)self profile];
  uint64_t v25 = +[HDDatabaseCorruptionEvent createForProfile:v24 component:a4 != 0 error:v8 failedObliterationReason:v48];

  [v49 persistCorruptionEvent:v25];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v27 = [WeakRetained daemon];
  id v28 = [v27 analyticsSubmissionCoordinator];

  uint64_t v29 = objc_msgSend(v8, "hd_sqliteExtendedErrorCode");
  id v30 = objc_loadWeakRetained((id *)&self->_profile);
  v31 = [v8 localizedDescription];
  uint64_t v32 = objc_msgSend(v8, "hd_failingSQLStatement");
  v33 = (void *)v32;
  if (v32) {
    char v34 = (__CFString *)v32;
  }
  else {
    char v34 = &stru_1F1728D60;
  }
  objc_msgSend(v28, "database_reportSQLiteCorruptionWithExtendedErrorCode:type:profile:description:sqlStatement:failedObliterationAttempt:", v29, a4, v30, v31, v34, v23);

  if (v46)
  {
    uint64_t v35 = [HDDatabaseCorruptionTTRPrompter alloc];
    v36 = [(HDDatabase *)self profile];
    v37 = [v36 daemon];
    char v38 = [v37 behavior];
    id v39 = [(HDDatabaseCorruptionTTRPrompter *)v35 initWithStore:v49 behavior:v38];

    [(HDDatabaseCorruptionTTRPrompter *)v39 promptForEvent:v25];
  }
  v40 = [(HDDatabase *)self profile];
  v41 = [v40 daemon];
  id v42 = [v41 autoBugCaptureReporter];
  uint64_t v43 = objc_msgSend(v8, "hd_sqliteExtendedErrorCode");
  if (a4) {
    uint64_t v44 = @"protected";
  }
  else {
    uint64_t v44 = @"unprotected";
  }
  [v42 reportCorruptionForDatabase:v44 resultCode:v43];
}

- (NSDate)mostRecentObliterationDate
{
  id v2 = [(HDDatabase *)self _newCorruptionEventStore];
  uint64_t v3 = [v2 dateOfMostRecentObliteration:0];

  return (NSDate *)v3;
}

- (id)_newCorruptionEventStore
{
  uint64_t v3 = [HDDatabaseCorruptionEventStore alloc];

  return [(HDDatabaseCorruptionEventStore *)v3 initWithDelegate:self];
}

- (id)_newTTRPromptControllerWithProfile:(id)a3 domainName:(id)a4 loggingCategory:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [[HDTTRPromptController alloc] initWithProfile:v7 domainName:v8 loggingCategory:v9];

  return v10;
}

- (void)store:(id)a3 setObject:(id)a4 forKey:(id)a5
{
  id v8 = a4;
  id v6 = a5;
  id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v7 setObject:v8 forKey:v6];
}

- (id)store:(id)a3 objectForKey:(id)a4
{
  id v4 = a4;
  BOOL v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)_newDatabaseConnectionWithURL:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F65D18]) initWithDatabaseURL:v3];

  return v4;
}

- (id)_createAndVerifyDatabaseConnectionWithType:(void *)a3 error:
{
  *(void *)&v24[5] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  if (a2) {
    [MEMORY[0x1E4F65D18] protectedDatabaseURLWithProfileDirectoryPath:v6];
  }
  else {
  id v7 = [MEMORY[0x1E4F65D18] mainDatabaseURLWithProfileDirectoryPath:v6];
  }
  id v8 = (void *)[(id)a1 _newDatabaseConnectionWithURL:v7];
  [v8 setDelegate:a1];
  if (a2 == 1)
  {
    id v9 = (void *)MEMORY[0x1E4F28348];
  }
  else if (a2)
  {
    _HKInitializeLogging();
    id v10 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)id v24 = a2;
      _os_log_fault_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_FAULT, "Unexpected database type (%ld), defaulting to complete protection.", buf, 0xCu);
    }
    id v9 = (void *)MEMORY[0x1E4F28340];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F28358];
  }
  [v8 setFileProtectionType:*v9];

  id v11 = [v8 fileURL];
  id v22 = 0;
  uint64_t v12 = [v8 openWithError:&v22];
  id v13 = v22;
  if (!v12)
  {
    id v17 = v8;
    goto LABEL_23;
  }
  [v8 close];

  if (v12 == 26)
  {
LABEL_15:
    [(id)a1 _reportSQLiteCorruption:v13 forDatabase:a2 shouldPrompt:1];
    id v14 = @"unprotected";
    if (a2 == 1) {
      id v14 = @"protected";
    }
    uint64_t v15 = [NSString stringWithFormat:@"Corrupt %@ database (%d)", v14, v12];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 312));
    [WeakRetained obliterateAndTerminateWithOptions:2 reason:v15 completion:0];

    goto LABEL_22;
  }
  if (v12 != 13)
  {
    if (v12 != 11)
    {
      _HKInitializeLogging();
      uint64_t v15 = (id)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v21 = [v11 path];
        *(_DWORD *)buf = 67109378;
        v24[0] = v12;
        LOWORD(v24[1]) = 2114;
        *(void *)((char *)&v24[1] + 2) = v21;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "Unable to open database: [%d, %{public}@]", buf, 0x12u);
      }
      goto LABEL_22;
    }
    goto LABEL_15;
  }
  uint64_t v15 = [(id)a1 _newCorruptionEventStore];
  [v15 persistDeviceOutOfSpaceEvent];
LABEL_22:

  id v17 = 0;
LABEL_23:
  id v18 = v13;
  id v19 = v18;
  if (v18)
  {
    if (a3) {
      *a3 = v18;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v17;
}

- (uint64_t)_performMigrationWithUnprotectedDatabase:(void *)a3 protectedDatabase:(void *)a4 error:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v35 = a2;
  id v6 = a3;
  id v7 = -[HDDatabase _threadLocalTransaction]((void *)a1);
  if (v7)
  {
    if (v6)
    {
LABEL_3:
      v36 = [v7 protectedDatabase];
      goto LABEL_6;
    }
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:sel__performMigrationWithUnprotectedDatabase_protectedDatabase_error_ object:a1 file:@"HDDatabase.mm" lineNumber:1313 description:@"Migration must be performed inside a database transaction"];

    if (v6) {
      goto LABEL_3;
    }
  }
  v36 = [v7 unprotectedDatabase];
LABEL_6:
  if (v36)
  {
    uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:sel__performMigrationWithUnprotectedDatabase_protectedDatabase_error_ object:a1 file:@"HDDatabase.mm" lineNumber:1316 description:@"Transaction database connection must be nil before migration"];
  }
  [v7 setPerformingMigration:1];
  id v9 = [(id)a1 profile];
  id v10 = [v9 daemon];

  id v11 = [v10 pluginManager];
  uint64_t v12 = [v11 pluginsConformingToProtocol:&unk_1F1803B80];
  id v13 = [v12 allValues];

  id v14 = [HDDatabaseMigrationTransaction alloc];
  uint64_t v15 = [v10 behavior];
  uint64_t v16 = [(HDDatabaseMigrationTransaction *)v14 initWithUnprotectedDatabase:v35 protectedDatabase:v6 schemaProviders:v13 behavior:v15];

  [(HDDatabaseMigrationTransaction *)v16 setDelegate:a1];
  id v38 = 0;
  uint64_t v17 = [(HDDatabaseMigrationTransaction *)v16 migrateOrCreateSchemaWithError:&v38];
  id v18 = v38;
  if (!v17)
  {
    v20 = [v7 protectedDatabase];
    BOOL v21 = v20 == 0;

    if (v21)
    {
      uint64_t v17 = 0;
      goto LABEL_23;
    }
    [v7 protectedDatabase];
    id v37 = v18;
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v33 = [MEMORY[0x1E4F28B00] currentHandler];
      [v33 handleFailureInMethod:sel__runPostMigrationUpdatesWithDatabase_error_, a1, @"HDDatabase.mm", 1359, @"Invalid parameter not satisfying: %@", @"database != nil" object file lineNumber description];
    }
    [(id)a1 offsetTimeInterval];
    if (v23 == 0.0 || *(unsigned char *)(a1 + 289))
    {
      char v24 = 1;
    }
    else
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __57__HDDatabase__runPostMigrationUpdatesWithDatabase_error___block_invoke;
      v40 = &unk_1E62FC798;
      uint64_t v41 = a1;
      double v42 = v23;
      int v30 = [v22 performTransactionWithType:1 error:&v37 usingBlock:buf];
      char v24 = v30;
      if (v30) {
        *(unsigned char *)(a1 + 289) = 1;
      }
    }

    id v25 = v37;
    if (v24)
    {
      uint64_t v17 = 0;
      id v18 = v25;
      goto LABEL_23;
    }
    _HKInitializeLogging();
    uint64_t v29 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_error_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_ERROR, "Failed to run post-migration updates: %{public}@", buf, 0xCu);
    }
    uint64_t v17 = 1;
    id v18 = v25;
  }
  if (objc_msgSend(v18, "hd_isCorruptionError"))
  {
    objc_msgSend((id)a1, "setCorruptedMigrationAttemptsCount:", objc_msgSend((id)a1, "corruptedMigrationAttemptsCount") + 1);
    if ([(id)a1 corruptedMigrationAttemptsCount] >= 6)
    {
      _HKInitializeLogging();
      id v19 = (id)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = [(id)a1 corruptedMigrationAttemptsCount];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v31;
        _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "%@ received database corruption errors from %ld migration attempts.", buf, 0x16u);
      }

      uint64_t v17 = 2;
    }
  }
LABEL_23:
  id v26 = v18;
  uint64_t v27 = v26;
  if (v26)
  {
    if (a4) {
      *a4 = v26;
    }
    else {
      _HKLogDroppedError();
    }
  }

  [v7 setPerformingMigration:0];
  return v17;
}

- (void)_reportMigrationResultIfNecessaryForStatus:(void *)a3 database:(unsigned int)a4 protectedDatabase:(void *)a5 error:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  if ((a2 > 4 || ((1 << a2) & 0x19) == 0) && (objc_msgSend(v10, "hk_isDatabaseSchemaRolledBackError") & 1) == 0)
  {
    uint64_t v12 = @"unprotected";
    if (a4) {
      uint64_t v12 = @"protected";
    }
    id v22 = v12;
    BOOL v21 = HDDatabaseMigrationStatusToString(a2);
    id v24 = 0;
    uint64_t v13 = [v9 userVersionWithDatabaseName:0 error:&v24];
    id v23 = v24;
    id v14 = (os_log_t *)MEMORY[0x1E4F29F18];
    if (v13 == -1)
    {
      _HKInitializeLogging();
      uint64_t v15 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v26 = v22;
        __int16 v27 = 2114;
        id v28 = v23;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "Unable to get schema version for database %{public}@: %{public}@", buf, 0x16u);
      }
    }
    uint64_t v16 = [NSString stringWithFormat:@"%@ %@ %lld", v22, v21, v13];
    _HKInitializeLogging();
    uint64_t v17 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v26 = v16;
      __int16 v27 = 2114;
      id v28 = v11;
      _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "Report %{public}@ database migration failure %{public}@", buf, 0x16u);
    }
    id v18 = [a1 profile];
    id v19 = [v18 daemon];
    v20 = [v19 autoBugCaptureReporter];
    [v20 reportDatabaseMigrationFailureWithContext:v16];

    [a1 _reportDatabaseMigrationStatus:a2 component:a4 schemaVersion:v13 error:v11];
  }
}

void __74__HDDatabase__migrateOrCreateProtectedSchemaInDatabase_transaction_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setRequiresWrite:1];
  [*(id *)(a1 + 32) setHighPriority:0];
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  obuint64_t j = *(id *)(v4 + 40);
  unsigned __int8 v5 = [v2 performTransactionWithContext:v3 error:&obj block:&__block_literal_global_70 inaccessibilityHandler:0];
  objc_storeStrong((id *)(v4 + 40), obj);
  atomic_store(v5, (unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
}

uint64_t __74__HDDatabase__migrateOrCreateProtectedSchemaInDatabase_transaction_error___block_invoke_2()
{
  return 1;
}

uint64_t __57__HDDatabase__runPostMigrationUpdatesWithDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v18 = a2;
  if (v4)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = objc_opt_class();
    id v7 = [v4 profile];
    id v8 = [v7 daemon];
    id v9 = [v8 behavior];
    id v10 = [v6 allEntityClassesWithBehavior:v9];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v22;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v21 + 1) + 8 * v13);
          uint64_t v20 = 0;
          if ([v14 isSubclassOfClass:objc_opt_class()])
          {
            uint64_t v15 = [v14 updateSQLForTimeOffsetWithBindingCount:&v20];
            if (v15)
            {
              v19[0] = MEMORY[0x1E4F143A8];
              v19[1] = 3221225472;
              v19[2] = __54__HDDatabase__applyOffsetTimeInterval_database_error___block_invoke;
              v19[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
              v19[4] = v20;
              v19[5] = v5;
              if (([v18 executeUncachedSQL:v15 error:a3 bindingHandler:v19 enumerationHandler:0] & 1) == 0)
              {

                uint64_t v16 = 0;
                goto LABEL_15;
              }
            }
          }
          else
          {
            uint64_t v15 = 0;
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }
    uint64_t v16 = 1;
LABEL_15:
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

uint64_t __54__HDDatabase__applyOffsetTimeInterval_database_error___block_invoke(uint64_t result, sqlite3_stmt *a2)
{
  if (*(void *)(result + 32))
  {
    uint64_t v3 = result;
    unint64_t v4 = 0;
    do
      uint64_t result = sqlite3_bind_double(a2, ++v4, *(double *)(v3 + 40));
    while (*(void *)(v3 + 32) > v4);
  }
  return result;
}

- (void)migrationTransaction:(id)a3 didCreateDatabasesWithIdentifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = v5;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "Inserting identifier %{public}@ in user defaults", (uint8_t *)&v13, 0xCu);
  }
  id v7 = [(HDDatabase *)self profile];
  id v8 = [v7 profileIdentifier];

  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v10 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", v5);
  uint64_t v11 = [v10 UUIDString];
  uint64_t v12 = HDDatabaseIdentifierDefaultKeyForProfileIdentifier(v8);
  [v9 setObject:v11 forKey:v12];
}

- (void)migrationTransaction:(id)a3 didEncounterDatabaseMismatchWithUnprotectedIdentifier:(id)a4 protectedIdentifier:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [(HDDatabase *)self profile];
  id v9 = [v8 daemon];
  id v10 = [v9 analyticsSubmissionCoordinator];
  objc_msgSend(v10, "database_reportUnprotectedDatabaseIdentifier:doesNotMatchProtectedDatabaseIdentifier:", v11, v7);
}

- (void)migrationTransaction:(id)a3 reportHFDMigrationStatus:(int64_t)a4 schemaVersion:(int64_t)a5 error:(id)a6
{
  -[HDDatabase _reportDatabaseMigrationStatus:component:schemaVersion:error:](self, "_reportDatabaseMigrationStatus:component:schemaVersion:error:", a6 != 0, 2, a5);
}

- (id)migrationTransaction:(id)a3 entityClassesWithBehavior:(id)a4
{
  unint64_t v4 = +[HDDatabase allEntityClassesWithBehavior:a4];

  return v4;
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_protectedDataQueue);

  -[HDDatabase _protectedDataQueue_flushProtectedDataIfNecessary]((uint64_t)self);
}

- (void)_protectedDataQueue_flushProtectedDataIfNecessary
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 72));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    uint64_t v2 = *(void *)(a1 + 104);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    if (v2 == 2 && !*(unsigned char *)(a1 + 208))
    {
      uint64_t v3 = [*(id *)(a1 + 336) activeAssertionsForIdentifier:@"DatabaseAccessibility"];
      if ([v3 count])
      {
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
        BOOL isProtectedDataFlushDeadline = -[HDDatabase _protectedDataLock_isProtectedDataFlushDeadlinePassed](a1);
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
        if (!isProtectedDataFlushDeadline)
        {
          id v5 = 0;
LABEL_14:

          return;
        }
        objc_msgSend(NSString, "stringWithFormat:", @" with %lu active assertions", objc_msgSend(v3, "count"));
        id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v5 = 0;
      }
      _HKInitializeLogging();
      id v6 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
      {
        id v7 = &stru_1F1728D60;
        if (v5) {
          id v7 = v5;
        }
        *(_DWORD *)buf = 138543362;
        id v9 = v7;
        _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "Flushing protected data%{public}@", buf, 0xCu);
      }
      -[HDDatabase _protectedDataQueue_flushProtectedData](a1);
      goto LABEL_14;
    }
  }
}

- (id)checkOutProtectedDatabase:(id)a3 error:(id *)a4
{
  unint64_t v4 = -[HDDatabase _checkOutDatabaseForTransaction:databaseType:error:](self, a3, 1, a4);

  return v4;
}

- (id)_checkOutDatabaseForTransaction:(uint64_t)a3 databaseType:(void *)a4 error:
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (a1)
  {
    if ((-[HDDatabase _isDatabaseValidWithError:]((os_unfair_lock_s *)a1, (uint64_t)a4) & 1) == 0)
    {
      a1 = 0;
      goto LABEL_78;
    }
    id v8 = [v7 rootContext];
    uint64_t v9 = [v8 requiresWrite];
    if (v9)
    {
      if ([v8 highPriority])
      {
        id v49 = [MEMORY[0x1E4F28B00] currentHandler];
        [v49 handleFailureInMethod:sel__checkOutDatabaseForTransaction_databaseType_error_ object:a1 file:@"HDDatabase.mm" lineNumber:1566 description:@"Transaction may not be both high priority and write"];
      }
      uint64_t v10 = 1;
    }
    else if ([v8 highPriority])
    {
      uint64_t v10 = 2;
    }
    else
    {
      uint64_t v10 = 0;
    }
    if ([v8 requiresNewDatabaseConnection]) {
      uint64_t v11 = v10 | 8;
    }
    else {
      uint64_t v11 = v10;
    }
    if (a3 == 1)
    {
      id v12 = v7;
      uint64_t v13 = -[HDDatabase _protectedDataState]((uint64_t)a1);
      if (v13)
      {
        if (v13 != 1)
        {
          if (v13 != 2)
          {
LABEL_68:

            a1 = 0;
LABEL_77:

            goto LABEL_78;
          }
          id v55 = v12;
          id v14 = [v55 rootContext];
          uint64_t v15 = [v14 accessibilityAssertions];

          if (![v15 count]) {
            goto LABEL_21;
          }
          os_unfair_lock_lock((os_unfair_lock_t)a1 + 20);
          if (-[HDDatabase _protectedDataLock_isProtectedDataFlushDeadlinePassed]((uint64_t)a1))
          {
            os_unfair_lock_unlock((os_unfair_lock_t)a1 + 20);
LABEL_21:

LABEL_22:
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_protectedDataInaccessibilityError");
            id v16 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v17 = v16;
            if (v16)
            {
              if (a4) {
                *a4 = v16;
              }
              else {
                _HKLogDroppedError();
              }
            }

            goto LABEL_68;
          }
          v52 = [*((id *)a1 + 42) activeAssertionsForIdentifier:@"DatabaseAccessibility"];
          char v50 = [v52 intersectsSet:v15];

          os_unfair_lock_unlock((os_unfair_lock_t)a1 + 20);
          if ((v50 & 1) == 0) {
            goto LABEL_22;
          }
        }
      }
      else
      {
        id v18 = [v12 rootContext];
        char v19 = [v18 skipJournalMerge];

        if ((v19 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_protectedDataInaccessibilityError");
          id v20 = (id)objc_claimAutoreleasedReturnValue();
          long long v21 = v20;
          if (v20)
          {
            if (a4) {
              *a4 = v20;
            }
            else {
              _HKLogDroppedError();
            }
          }

          uint64_t v44 = *((void *)a1 + 9);
          blocuint64_t k = MEMORY[0x1E4F143A8];
          uint64_t v58 = 3221225472;
          v59 = __62__HDDatabase__canAccessProtectedDatabaseForTransaction_error___block_invoke;
          id v60 = &unk_1E62FC630;
          id v61 = a1;
          dispatch_async(v44, &block);
          goto LABEL_68;
        }
      }

      if (([v8 requiresNewDatabaseConnection] & 1) == 0
        && ![*((id *)a1 + 50) isProtectedDataAvailable])
      {
        v11 |= 4uLL;
      }
    }
    long long v22 = [a1 databasePoolForDatabaseType:a3];
    long long v23 = [v22 checkOutConnectionWithOptions:v11 error:a4];
    long long v24 = v23;
    if (!v23) {
      goto LABEL_65;
    }
    [v23 setWriter:v9];
    if (a3 == 1)
    {
      id v25 = v24;
      id v56 = v7;
      id v26 = v25;
      [*((id *)a1 + 43) lock];
      if ((-[HDDatabase _isDatabaseValidWithError:]((os_unfair_lock_s *)a1, (uint64_t)a4) & 1) == 0)
      {
        [*((id *)a1 + 43) unlock];

        goto LABEL_64;
      }
      if ([*((id *)a1 + 46) containsObject:v26])
      {
        __int16 v27 = 0;
        unint64_t v28 = 0;
      }
      else
      {
        uint64_t v29 = -[HDDatabase _createAndVerifyDatabaseConnectionWithType:error:]((uint64_t)a1, 0, a4);
        id v30 = v26;
        __int16 v53 = v30;
        if (v29)
        {
          id v65 = 0;
          unint64_t v28 = -[HDDatabase _performMigrationWithUnprotectedDatabase:protectedDatabase:error:]((uint64_t)a1, v29, v30, &v65);
          __int16 v27 = (__CFString *)v65;
          [v29 close];
        }
        else
        {
          _HKInitializeLogging();
          uint64_t v31 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "Failed to open unprotected database to perform protected migration", (uint8_t *)&buf, 2u);
          }
          __int16 v27 = 0;
          unint64_t v28 = 1;
        }
        -[HDDatabase _reportMigrationResultIfNecessaryForStatus:database:protectedDatabase:error:](a1, v28, v53, 1u, v27);
        if (v28 - 1 > 2)
        {
          if (!v28) {
            [*((id *)a1 + 46) addObject:v53];
          }
        }
        else
        {
          _HKInitializeLogging();
          uint64_t v32 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            id v48 = @"(intentional)";
            if (v27) {
              id v48 = v27;
            }
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v48;
            _os_log_error_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_ERROR, "Failed to migrate schema for protected database: %{public}@", (uint8_t *)&buf, 0xCu);
          }
          if (v28 == 2)
          {
            _HKInitializeLogging();
            v33 = *MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf) = 0;
              _os_log_error_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_ERROR, "Destroying both databases - fatal error while accessing protected database", (uint8_t *)&buf, 2u);
            }
            v51 = [NSString stringWithFormat:@"Fatal migration failure accessing protected database: %@", v27];
            id WeakRetained = objc_loadWeakRetained((id *)a1 + 39);
            [WeakRetained obliterateAndTerminateWithOptions:0 reason:v51 completion:0];

            uint64_t v35 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Invalid database pair (removed)");

            __int16 v27 = (__CFString *)v35;
          }
        }
      }
      [*((id *)a1 + 43) unlock];
      v36 = v27;
      id v37 = v36;
      if (v36)
      {
        if (a4) {
          *a4 = v36;
        }
        else {
          _HKLogDroppedError();
        }
      }

      if (v28 == 4)
      {
        id v65 = 0;
        v66 = &v65;
        uint64_t v67 = 0x2020000000;
        char v68 = 0;
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v70 = 0x3032000000;
        v71 = __Block_byref_object_copy__68;
        char v72 = __Block_byref_object_dispose__68;
        id v73 = 0;
        id v38 = [v56 rootContext];
        id v39 = (void *)[v38 mutableCopy];

        blocuint64_t k = MEMORY[0x1E4F143A8];
        uint64_t v58 = 3221225472;
        v59 = __74__HDDatabase__migrateOrCreateProtectedSchemaInDatabase_transaction_error___block_invoke;
        id v60 = &unk_1E62FC770;
        id v54 = v39;
        id v61 = v54;
        id v62 = a1;
        p_long long buf = &buf;
        v64 = &v65;
        dispatch_block_t v40 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &block);
        HKDispatchAsyncOnGlobalConcurrentQueue();
        dispatch_time_t v41 = dispatch_time(0, 60000000000);
        intptr_t v42 = dispatch_block_wait(v40, v41);
        unsigned __int8 v43 = atomic_load((unsigned __int8 *)v66 + 24);
        if ((v43 & 1) == 0)
        {
          if (v42)
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a4, 103, @"Timed out waiting for protected database migration transaction.");
          }
          else
          {
            id v45 = *(id *)(*((void *)&buf + 1) + 40);
            BOOL v46 = v45;
            if (v45)
            {
              if (a4) {
                *a4 = v45;
              }
              else {
                _HKLogDroppedError();
              }
            }
          }
        }

        _Block_object_dispose(&buf, 8);
        _Block_object_dispose(&v65, 8);

        if (v43) {
          goto LABEL_75;
        }
        goto LABEL_64;
      }

      if (v28)
      {
LABEL_64:
        -[HDDatabase _checkInDatabase:type:flushImmediately:](a1, v26, 1, 1);
LABEL_65:
        a1 = 0;
LABEL_76:

        goto LABEL_77;
      }
    }
LABEL_75:
    -[HDDatabase _updateInactivityFlushTimer]((uint64_t)a1);
    a1 = v24;
    goto LABEL_76;
  }
LABEL_78:

  return a1;
}

- (id)checkOutUnprotectedDatabase:(id)a3 error:(id *)a4
{
  unint64_t v4 = -[HDDatabase _checkOutDatabaseForTransaction:databaseType:error:](self, a3, 0, a4);

  return v4;
}

- (id)checkOutProtectedResources:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [NSString alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v7 = [WeakRetained profileIdentifier];
  id v8 = [v7 identifier];
  intptr_t v42 = (void *)[v5 initWithFormat:@"%@:%@", @"HDDatabase", v8];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = self->_protectedResourceStores;
  uint64_t v9 = [(NSHashTable *)obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (!v9)
  {

LABEL_36:
    uint64_t v32 = (void *)[v38 copy];
    goto LABEL_47;
  }
  uint64_t v39 = v9;
  uint64_t v40 = *(void *)v47;
  locuint64_t k = &self->_protectedResourceAssertionsLock;
  char v35 = 1;
  do
  {
    uint64_t v10 = 0;
    uint64_t v11 = WeakRetained;
    do
    {
      if (*(void *)v47 != v40) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(void **)(*((void *)&v46 + 1) + 8 * v10);
      id v45 = 0;
      id v13 = v12;
      id v14 = v42;
      os_unfair_lock_lock(lock);
      protectedResourceAssertionsByIdentifier = self->_protectedResourceAssertionsByIdentifier;
      if (!protectedResourceAssertionsByIdentifier)
      {
        id v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v17 = self->_protectedResourceAssertionsByIdentifier;
        self->_protectedResourceAssertionsByIdentifier = v16;

        protectedResourceAssertionsByIdentifier = self->_protectedResourceAssertionsByIdentifier;
      }
      id v18 = [v13 protectedResourceIdentifier];
      char v19 = [(NSMutableDictionary *)protectedResourceAssertionsByIdentifier objectForKeyedSubscript:v18];

      if (v19 && [v19 state] != 3)
      {
        long long v22 = v19;
      }
      else
      {
        if ([v19 state] == 3)
        {
          _HKInitializeLogging();
          id v20 = (id)*MEMORY[0x1E4F29F18];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            long long v21 = [v13 protectedResourceIdentifier];
            *(_DWORD *)long long buf = 138543362;
            v52 = v21;
            _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "Protected resource assertion for %{public}@ is unexpectedly invalid", buf, 0xCu);
          }
        }
        long long v22 = [v13 requestProtectedResourceAccessAssertionForOwnerIdentifier:v14 error:&v45];

        if (v22)
        {
          long long v23 = self->_protectedResourceAssertionsByIdentifier;
          long long v24 = [v13 protectedResourceIdentifier];
          [(NSMutableDictionary *)v23 setObject:v22 forKeyedSubscript:v24];
        }
      }
      os_unfair_lock_unlock(lock);

      id v25 = v45;
      id v26 = v25;
      if (!v22)
      {
        if (v25)
        {
          id v33 = v25;
          goto LABEL_40;
        }
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 122, @"Protected data store %@ failed to acquire protected resource assertion without providing an error.", v13);
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        if (v33)
        {
LABEL_40:
          if (a4) {
            *a4 = v33;
          }
          else {
            _HKLogDroppedError();
          }

          if (!v26) {
            goto LABEL_44;
          }
        }
        else
        {
LABEL_44:
        }
        goto LABEL_46;
      }
      id v44 = 0;
      __int16 v27 = [v13 checkOutProtectedResourceWithAssertion:v22 transaction:v41 error:&v44];
      id v28 = v44;
      uint64_t v29 = v28;
      if (v27)
      {
        id WeakRetained = [v13 protectedResourceIdentifier];
        [v38 setObject:v27 forKeyedSubscript:WeakRetained];
LABEL_20:

        id WeakRetained = v11;
        goto LABEL_28;
      }
      if (v28)
      {
        id v30 = v28;
        id WeakRetained = v11;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 122, @"Protected data store %@ failed to check out a required protected resource without providing an error.", v13);
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        id WeakRetained = v30;
        if (!v30)
        {
          char v35 = 0;
          uint64_t v11 = 0;
          goto LABEL_20;
        }
      }
      if (a4) {
        *a4 = v30;
      }
      else {
        _HKLogDroppedError();
      }

      char v35 = 0;
      uint64_t v11 = WeakRetained;
      if (!v29) {
        goto LABEL_20;
      }
LABEL_28:

      if (!v27) {
        goto LABEL_33;
      }
      ++v10;
      uint64_t v11 = WeakRetained;
    }
    while (v39 != v10);
    uint64_t v31 = [(NSHashTable *)obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    uint64_t v39 = v31;
  }
  while (v31);
LABEL_33:

  if (v35) {
    goto LABEL_36;
  }
LABEL_46:
  -[HDDatabase _checkInProtectedResources:]((uint64_t)self, v38);
  uint64_t v32 = 0;
LABEL_47:

  return v32;
}

- (void)_checkInProtectedResources:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = *(id *)(a1 + 264);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          uint64_t v9 = objc_msgSend(v8, "protectedResourceIdentifier", (void)v11);
          uint64_t v10 = [v3 objectForKeyedSubscript:v9];

          if (v10) {
            [v8 checkInProtectedResource:v10];
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
  }
}

- (void)checkInDatabase:(id)a3 type:(int64_t)a4 protectedResources:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  -[HDDatabase _checkInDatabase:type:flushImmediately:](self, v9, a4, 0);
  if (a4 == 1 && v8) {
    -[HDDatabase _checkInProtectedResources:]((uint64_t)self, v8);
  }
  -[HDDatabase _updateInactivityFlushTimer]((uint64_t)self);
}

- (void)_checkInDatabase:(uint64_t)a3 type:(uint64_t)a4 flushImmediately:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = v7;
  if (a1)
  {
    if ([v7 checkpointRequired])
    {
      id v23 = 0;
      char v9 = [v8 executeUncachedSQL:@"PRAGMA wal_checkpoint(truncate)" error:&v23 bindingHandler:0 enumerationHandler:0];
      id v10 = v23;
      if ((v9 & 1) == 0)
      {
        _HKInitializeLogging();
        long long v11 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543362;
          id v25 = v10;
          _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "Failed to truncate the wal after a transaction requiring checkpointing: %{public}@", buf, 0xCu);
        }
      }
      [v8 setCheckpointRequired:0];
    }
    if ([v8 isWriter])
    {
      id v22 = 0;
      char v12 = [v8 incrementalVacuumDatabaseIfNeeded:0 error:&v22];
      id v13 = v22;
      if ((v12 & 1) == 0)
      {
        _HKInitializeLogging();
        long long v14 = (void *)*MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEBUG))
        {
          uint64_t v15 = v14;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            long long v21 = HDStringFromHDDatabaseType(a3);
            *(_DWORD *)long long buf = 138543618;
            id v25 = v13;
            __int16 v26 = 2114;
            __int16 v27 = v21;
            _os_log_debug_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEBUG, "Error vacuuming %{public}@ database: %{public}@", buf, 0x16u);
          }
        }
      }
      -[HDDatabase _mergeSecondaryJournals]((uint64_t)a1);
    }
    uint64_t v16 = [v8 corruptionError];
    BOOL v17 = v16 == 0;

    if (!v17)
    {
      id v18 = [v8 corruptionError];
      [a1 _reportSQLiteCorruption:v18 forDatabase:a3 shouldPrompt:1];

      a4 = 1;
    }
    if ([v8 encounteredOutOfSpace])
    {
      char v19 = (void *)[a1 _newCorruptionEventStore];
      [v19 persistDeviceOutOfSpaceEvent];

      [v8 setEncounteredOutOfSpace:0];
    }
    id v20 = [a1 databasePoolForDatabaseType:a3];
    [v20 checkInConnection:v8 flushImmediately:a4];
  }
}

- (void)_updateInactivityFlushTimer
{
  if (a1)
  {
    uint64_t v1 = *(NSObject **)(a1 + 72);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__HDDatabase__updateInactivityFlushTimer__block_invoke;
    block[3] = &unk_1E62FC630;
    void block[4] = a1;
    dispatch_async(v1, block);
  }
}

- (void)_mergeSecondaryJournals
{
  if (a1)
  {
    char v2 = 0;
    atomic_compare_exchange_strong((atomic_uchar *volatile)(a1 + 232), (unsigned __int8 *)&v2, 1u);
    if (!v2)
    {
      id v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
      id v4 = [v3 features];
      int v5 = [v4 xpcGatedSecondaryJournalMerge];

      if (v5)
      {
        objc_initWeak(&location, (id)a1);
        uint64_t v6 = *(void **)(a1 + 240);
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        void v9[2] = __37__HDDatabase__mergeSecondaryJournals__block_invoke;
        v9[3] = &unk_1E62FC888;
        objc_copyWeak(&v10, &location);
        [v6 requestRunWithMaximumDelay:v9 completion:300.0];
        objc_destroyWeak(&v10);
        objc_destroyWeak(&location);
      }
      else
      {
        id v7 = [*(id *)(a1 + 304) mergeQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __37__HDDatabase__mergeSecondaryJournals__block_invoke_2;
        block[3] = &unk_1E62FC630;
        void block[4] = a1;
        dispatch_async(v7, block);
      }
    }
  }
}

- (id)newConnectionForPool:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (-[HDDatabase _isDatabaseValidWithError:]((os_unfair_lock_s *)self, (uint64_t)a4))
  {
    [(NSConditionLock *)self->_activeDatabasesLock lock];
    id v7 = v6;
    id v8 = [(HDDatabase *)self databasePoolForDatabaseType:0];

    id v9 = [(HDDatabase *)self databasePoolForDatabaseType:1];

    if (v8 != v7 && v9 != v7)
    {
      uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:sel__databaseTypeForDatabasePool_, self, @"HDDatabase.mm", 524, @"Database pool %@ not created by %@", v7, self object file lineNumber description];
    }
    if ((-[HDDatabase _isDatabaseValidWithError:]((os_unfair_lock_s *)self, (uint64_t)a4) & 1) == 0) {
      goto LABEL_29;
    }
    [(NSLock *)self->_schemaMigrationLock lock];
    id v30 = 0;
    uint64_t v10 = -[HDDatabase _createAndVerifyDatabaseConnectionWithType:error:]((uint64_t)self, v8 != v7, &v30);
    uint64_t v11 = (uint64_t)v30;
    if (v10)
    {
      if (v8 == v7) {
        char v12 = (void *)v10;
      }
      else {
        char v12 = 0;
      }
      if (v8 == v7) {
        id v13 = 0;
      }
      else {
        id v13 = (void *)v10;
      }
      id v14 = v12;
      id v15 = v13;
      if (v8 == v7)
      {
        id v29 = (id)v11;
        unint64_t v16 = -[HDDatabase _performMigrationWithUnprotectedDatabase:protectedDatabase:error:]((uint64_t)self, (void *)v10, 0, &v29);
        BOOL v17 = (__CFString *)v29;

        uint64_t v11 = (uint64_t)v17;
        -[HDDatabase _reportMigrationResultIfNecessaryForStatus:database:protectedDatabase:error:](self, v16, (void *)v10, 0, v17);
        if (v16)
        {
          _HKInitializeLogging();
          id v18 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            __int16 v27 = @"(intentional)";
            if (v17) {
              __int16 v27 = v17;
            }
            *(_DWORD *)long long buf = 138543362;
            uint64_t v32 = v27;
            _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "Failed to migrate database: %{public}@", buf, 0xCu);
          }
          if (v16 == 2)
          {
            char v19 = NSString;
            id v20 = [(id)v10 fileURL];
            long long v21 = [v20 path];
            id v22 = [v19 stringWithFormat:@"Failed migrations for %@, error: %@", v21, v11];

            id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
            [WeakRetained obliterateAndTerminateWithOptions:0 reason:v22 completion:0];
          }
          [(id)v10 close];

          uint64_t v10 = 0;
        }
      }
    }
    [(NSLock *)self->_schemaMigrationLock unlock];
    if (!(v10 | v11))
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Failed to open database");
    }
    id v24 = (id)v11;
    id v25 = v24;
    if (v24)
    {
      if (a4) {
        *a4 = v24;
      }
      else {
        _HKLogDroppedError();
      }
    }

    if (v10) {
      [(NSMutableSet *)self->_activeDatabases addObject:v10];
    }
    else {
LABEL_29:
    }
      uint64_t v10 = 0;
    [(NSConditionLock *)self->_activeDatabasesLock unlockWithCondition:[(NSMutableSet *)self->_activeDatabases count] != 0];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return (id)v10;
}

- (void)databasePool:(id)a3 didFlushConnections:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [(NSConditionLock *)self->_activeDatabasesLock lock];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        -[NSMutableSet removeObject:](self->_activeDatabases, "removeObject:", v10, (void)v11);
        [v10 close];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(NSConditionLock *)self->_activeDatabasesLock unlockWithCondition:[(NSMutableSet *)self->_activeDatabases count] != 0];
}

void __41__HDDatabase__updateInactivityFlushTimer__block_invoke(uint64_t a1)
{
}

- (void)_protectedDataQueue_updateInactivityFlushTimer
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 72));
    char v2 = [(id)a1 databasePoolForDatabaseType:0];
    uint64_t v3 = [v2 checkedOutDatabaseCount];

    if (v3 || *(double *)(a1 + 424) <= 0.0 || *(unsigned char *)(a1 + 136))
    {
      id v4 = *(NSObject **)(a1 + 128);
      if (v4)
      {
        dispatch_source_cancel(v4);
        id v5 = *(void **)(a1 + 128);
        *(void *)(a1 + 128) = 0;
      }
      if (v3 >= 1) {
        *(unsigned char *)(a1 + 136) = 0;
      }
    }
    else if (!*(void *)(a1 + 128))
    {
      objc_initWeak(&location, (id)a1);
      dispatch_source_t v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(a1 + 72));
      uint64_t v7 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = v6;

      uint64_t v8 = *(NSObject **)(a1 + 128);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __60__HDDatabase__protectedDataQueue_updateInactivityFlushTimer__block_invoke;
      v11[3] = &unk_1E62FC7C0;
      objc_copyWeak(&v12, &location);
      dispatch_source_set_event_handler(v8, v11);
      id v9 = *(NSObject **)(a1 + 128);
      dispatch_time_t v10 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 424) * 1000000000.0));
      dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      dispatch_resume(*(dispatch_object_t *)(a1 + 128));
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

void __60__HDDatabase__protectedDataQueue_updateInactivityFlushTimer__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 9));
    uint64_t v1 = [*((id *)WeakRetained + 42) activeAssertionsForIdentifier:@"DatabaseAccessibility"];
    if (![v1 count]
      || (os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 20),
          BOOL isProtectedDataFlushDeadline = -[HDDatabase _protectedDataLock_isProtectedDataFlushDeadlinePassed]((uint64_t)WeakRetained),
          os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 20),
          isProtectedDataFlushDeadline))
    {
      *((unsigned char *)WeakRetained + 136) = 1;
      _HKInitializeLogging();
      uint64_t v3 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138543362;
        id v8 = WeakRetained;
        _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_INFO, "%{public}@: Flushing connections due to inactivity.", buf, 0xCu);
      }
      id v4 = [WeakRetained databasePoolForDatabaseType:0];
      id v5 = (id)[v4 flush];

      -[HDDatabase _protectedDataQueue_flushProtectedData]((uint64_t)WeakRetained);
      -[HDDatabase _protectedDataQueue_updateInactivityFlushTimer](WeakRetained);
    }
  }
}

- (BOOL)_protectedDataLock_isProtectedDataFlushDeadlinePassed
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 80));
  if (*(void *)(a1 + 104) != 2) {
    return 0;
  }
  char v2 = *(void **)(a1 + 192);
  if (!v2)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:sel__protectedDataLock_isProtectedDataFlushDeadlinePassed, a1, @"HDDatabase.mm", 2184, @"Invalid parameter not satisfying: %@", @"_protectedDataFlushDeadlineDate != nil" object file lineNumber description];

    char v2 = *(void **)(a1 + 192);
  }
  [v2 timeIntervalSinceNow];
  return v3 <= 0.0;
}

- (void)_protectedDataQueue_flushProtectedData
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 72));
  char v2 = [*(id *)(a1 + 392) objectForKeyedSubscript:&unk_1F17EB5B0];
  double v3 = [v2 flush];

  id v4 = *(NSObject **)(a1 + 72);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HDDatabase__protectedDataQueue_flushProtectedData__block_invoke;
  block[3] = &unk_1E62FC630;
  void block[4] = a1;
  dispatch_group_notify(v3, v4, block);
  *(unsigned char *)(a1 + 208) = 1;
}

- (void)setProtectedDataFlushInterval:(double)a3
{
  if (a3 < 0.0)
  {
    dispatch_source_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HDDatabase.mm", 1777, @"Invalid parameter not satisfying: %@", @"protectedDataFlushInterval >= 0.0" object file lineNumber description];
  }
  self->_protectedDataFlushInterval = a3;
}

- (void)_protectedDataQueue_contentProtectionStateChanged:(uint64_t)a3 previousState:
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 72));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    int v6 = [MEMORY[0x1E4F65CE0] isProtectedDataAvailableWithState:*(void *)(a1 + 104)];
    int v7 = [MEMORY[0x1E4F65CE0] isProtectedDataAvailableWithState:a2];
    _HKInitializeLogging();
    id v8 = (id)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = HDStringFromContentProtectionState();
      uint64_t v10 = HDStringFromContentProtectionState();
      long long v11 = (void *)v10;
      id v12 = @"unavailable";
      *(_DWORD *)long long buf = 138544130;
      uint64_t v52 = (uint64_t)v9;
      if (v6) {
        long long v13 = @"available";
      }
      else {
        long long v13 = @"unavailable";
      }
      id v54 = v13;
      __int16 v53 = 2114;
      if (v7) {
        id v12 = @"available";
      }
      __int16 v55 = 2114;
      uint64_t v56 = v10;
      __int16 v57 = 2114;
      uint64_t v58 = v12;
      _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "Got content protection state change notification %{public}@ (%{public}@) -> %{public}@ (%{public}@).", buf, 0x2Au);
    }
    if (*(void *)(a1 + 104) != a3)
    {
      _HKInitializeLogging();
      long long v14 = (id)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = HDStringFromContentProtectionState();
        uint64_t v16 = HDStringFromContentProtectionState();
        *(_DWORD *)long long buf = 138543618;
        uint64_t v52 = (uint64_t)v15;
        __int16 v53 = 2114;
        id v54 = v16;
        _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "Previous content protection state %{public}@ does not match observed content protection state %{public}@", buf, 0x16u);
      }
    }
    *(void *)(a1 + 104) = a2;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    if (v7)
    {
      BOOL v17 = *(void **)(a1 + 192);
      *(void *)(a1 + 192) = 0;

      -[HDDatabase _protectedDataQueue_cancelProtectedDataFlushTimer](a1);
      [*(id *)(a1 + 336) suspendBudgetConsumption];
    }
    else
    {
      [*(id *)(a1 + 336) resumeBudgetConsumption];
      if (!*(void *)(a1 + 192))
      {
        id v18 = (void *)MEMORY[0x1E4F1C9C8];
        [(id)a1 protectedDataFlushInterval];
        uint64_t v19 = objc_msgSend(v18, "dateWithTimeIntervalSinceNow:");
        id v20 = *(void **)(a1 + 192);
        *(void *)(a1 + 192) = v19;

        *(unsigned char *)(a1 + 208) = 0;
        if (*(double *)(a1 + 416) > 0.0)
        {
          -[HDDatabase _protectedDataQueue_cancelProtectedDataFlushTimer](a1);
          dispatch_source_t v21 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(a1 + 72));
          id v22 = *(void **)(a1 + 200);
          *(void *)(a1 + 200) = v21;

          dispatch_time_t v23 = dispatch_walltime(0, (unint64_t)(*(double *)(a1 + 416) * 1000000000.0));
          dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 200), v23, 0xFFFFFFFFFFFFFFFFLL, 0);
          objc_initWeak((id *)buf, (id)a1);
          id v24 = *(NSObject **)(a1 + 200);
          handler[0] = MEMORY[0x1E4F143A8];
          handler[1] = 3221225472;
          handler[2] = __78__HDDatabase__protectedDataQueue_contentProtectionStateChanged_previousState___block_invoke;
          handler[3] = &unk_1E62FC7C0;
          objc_copyWeak(&v49, (id *)buf);
          dispatch_source_set_event_handler(v24, handler);
          dispatch_activate(*(dispatch_object_t *)(a1 + 200));
          objc_destroyWeak(&v49);
          objc_destroyWeak((id *)buf);
        }
        _HKInitializeLogging();
        id v25 = (id)*MEMORY[0x1E4F29F18];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v26 = HKDiagnosticStringFromDate();
          *(_DWORD *)long long buf = 138543362;
          uint64_t v52 = (uint64_t)v26;
          _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEFAULT, "Started protected data flush timer with deadline %{public}@", buf, 0xCu);
        }
      }
    }
    -[HDDatabase _protectedDataQueue_flushProtectedDataIfNecessary](a1);
    if (v6 != v7)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
      if (v7)
      {
        if (*(unsigned char *)(a1 + 184)
          && (os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8)),
              uint64_t v27 = *(void *)(a1 + 16),
              os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8)),
              v27 == 4))
        {
          *(unsigned char *)(a1 + 184) = 0;
          id v28 = *(id *)(a1 + 176);
          id v29 = *(void **)(a1 + 176);
          *(void *)(a1 + 176) = 0;

          int v30 = 1;
        }
        else
        {
          id v28 = 0;
          int v30 = 0;
        }
        *(void *)(a1 + 96) = 0;
        ++*(void *)(a1 + 216);
        -[HDDatabase _protectedDataQueue_mergeJournalWithPrimaryJournalMergeCompletion:](a1);
      }
      else
      {
        id v28 = 0;
        int v30 = 0;
        *(void *)(a1 + 96) = 2;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
      _HKInitializeLogging();
      uint64_t v31 = (id)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = [*(id *)(a1 + 88) count];
        uint64_t v33 = "unavailable";
        if (v7) {
          uint64_t v33 = "available";
        }
        *(_DWORD *)long long buf = 134218242;
        uint64_t v52 = v32;
        __int16 v53 = 2082;
        id v54 = (void *)v33;
        _os_log_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_DEFAULT, "Notifying %lu observers of protected data availability change: %{public}s", buf, 0x16u);
      }

      char v34 = *(void **)(a1 + 88);
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __78__HDDatabase__protectedDataQueue_contentProtectionStateChanged_previousState___block_invoke_516;
      v46[3] = &unk_1E62FC810;
      v46[4] = a1;
      char v47 = v7;
      [v34 notifyObservers:v46];
      char v35 = (const char **)MEMORY[0x1E4F2A598];
      if (!v7) {
        char v35 = (const char **)MEMORY[0x1E4F2A5A0];
      }
      notify_post(*v35);
      if (v30)
      {
        _HKInitializeLogging();
        v36 = (id)*MEMORY[0x1E4F29F18];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v37 = [v28 count];
          *(_DWORD *)long long buf = 134217984;
          uint64_t v52 = v37;
          _os_log_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_DEFAULT, "Running %lu first unlock blocks", buf, 0xCu);
        }

        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v38 = v28;
        uint64_t v39 = [v38 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v39)
        {
          uint64_t v40 = *(void *)v43;
          do
          {
            uint64_t v41 = 0;
            do
            {
              if (*(void *)v43 != v40) {
                objc_enumerationMutation(v38);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v42 + 1) + 8 * v41) + 16))(*(void *)(*((void *)&v42 + 1) + 8 * v41));
              ++v41;
            }
            while (v39 != v41);
            uint64_t v39 = [v38 countByEnumeratingWithState:&v42 objects:v50 count:16];
          }
          while (v39);
        }
      }
    }
  }
}

void __80__HDDatabase__protectedDataQueue_mergeJournalWithPrimaryJournalMergeCompletion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v2 = *(void **)(a1 + 32);
  double v3 = +[HDDatabaseTransactionContext contextForReadingProtectedData];
  id v9 = 0;
  uint64_t v4 = [v2 performTransactionWithContext:v3 error:&v9 block:&__block_literal_global_506 inaccessibilityHandler:0];
  id v5 = v9;

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v4, v5);
  }
  if (v4)
  {
    -[HDDatabase _mergeSecondaryJournals](*(void *)(a1 + 32));
  }
  else
  {
    _HKInitializeLogging();
    int v7 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Post-unlock journal merge trigger transaction failed: %{public}@", buf, 0x16u);
    }
  }
}

uint64_t __80__HDDatabase__protectedDataQueue_mergeJournalWithPrimaryJournalMergeCompletion___block_invoke_2()
{
  return 1;
}

- (void)_waitForContentProtectionObservationSetup
{
  if (a1)
  {
    char v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    uint64_t v3 = *(void *)(a1 + 16);
    os_unfair_lock_unlock(v2);
    if (v3)
    {
      uint64_t v4 = *(NSObject **)(a1 + 120);
      dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      _HKInitializeLogging();
      id v5 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_fault_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_FAULT, "_waitForContentProtectionObservationSetup skipped", v6, 2u);
      }
    }
  }
}

- (BOOL)isInSession
{
  -[HDDatabase _waitForContentProtectionObservationSetup]((uint64_t)self);
  contentProtectionManager = self->_contentProtectionManager;

  return [(HDContentProtectionManager *)contentProtectionManager isInSession];
}

- (void)_protectedDataQueue_cancelProtectedDataFlushTimer
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 72));
    char v2 = *(NSObject **)(a1 + 200);
    if (v2)
    {
      dispatch_source_cancel(v2);
      uint64_t v3 = *(void **)(a1 + 200);
      *(void *)(a1 + 200) = 0;
    }
  }
}

void __78__HDDatabase__protectedDataQueue_contentProtectionStateChanged_previousState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDDatabase _protectedDataQueue_flushProtectedDataIfNecessary]((uint64_t)WeakRetained);
}

uint64_t __78__HDDatabase__protectedDataQueue_contentProtectionStateChanged_previousState___block_invoke_516(uint64_t a1, void *a2)
{
  return [a2 database:*(void *)(a1 + 32) protectedDataDidBecomeAvailable:*(unsigned __int8 *)(a1 + 40)];
}

- (void)addProtectedDataObserver:(id)a3 queue:(id)a4
{
}

- (id)takeAccessibilityAssertionWithOwnerIdentifier:(id)a3 timeout:(double)a4 error:(id *)a5
{
  id v5 = [(HDDatabase *)self takeAccessibilityAssertionWithOwnerIdentifier:a3 shouldPerformTransaction:1 timeout:a5 error:a4];

  return v5;
}

- (id)takeAccessibilityAssertionWithOwnerIdentifier:(id)a3 shouldPerformTransaction:(BOOL)a4 timeout:(double)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v41 = 0;
  long long v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__68;
  uint64_t v39 = __Block_byref_object_dispose__68;
  id v40 = 0;
  uint64_t v29 = 0;
  int v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__68;
  uint64_t v33 = __Block_byref_object_dispose__68;
  id v34 = 0;
  protectedDataQueue = self->_protectedDataQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__HDDatabase_takeAccessibilityAssertionWithOwnerIdentifier_shouldPerformTransaction_timeout_error___block_invoke;
  block[3] = &unk_1E62FC838;
  void block[4] = self;
  id v25 = &v41;
  __int16 v26 = &v29;
  uint64_t v27 = &v35;
  id v12 = v10;
  id v24 = v12;
  double v28 = a5;
  dispatch_sync(protectedDataQueue, block);
  id v13 = (void *)v36[5];
  if (v13)
  {
    if (v8 && v42[3] >= 1)
    {
      uint64_t v14 = objc_alloc_init(HDMutableDatabaseTransactionContext);
      [(HDMutableDatabaseTransactionContext *)v14 addAccessibilityAssertion:v36[5]];
      [(HDMutableDatabaseTransactionContext *)v14 setRequiresProtectedData:1];
      [(HDMutableDatabaseTransactionContext *)v14 setRequiresNewDatabaseConnection:1];
      [(HDMutableDatabaseTransactionContext *)v14 setHighPriority:1];
      id v22 = 0;
      BOOL v15 = [(HDDatabase *)self performTransactionWithContext:v14 error:&v22 block:&__block_literal_global_523 inaccessibilityHandler:0];
      id v16 = v22;
      if (!v15)
      {
        _HKInitializeLogging();
        BOOL v17 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543618;
          id v46 = v12;
          __int16 v47 = 2114;
          id v48 = v16;
          _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "Failed to pre-emptively check out database for accessibility assertion owner \"%{public}@\": %{public}@", buf, 0x16u);
        }
      }

      id v13 = (void *)v36[5];
    }
    id v18 = v13;
  }
  else
  {
    id v19 = (id)v30[5];
    id v20 = v19;
    if (v19)
    {
      if (a6) {
        *a6 = v19;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v18 = 0;
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);

  return v18;
}

void __99__HDDatabase_takeAccessibilityAssertionWithOwnerIdentifier_shouldPerformTransaction_timeout_error___block_invoke(uint64_t a1)
{
  id v14 = [*(id *)(*(void *)(a1 + 32) + 392) objectForKeyedSubscript:&unk_1F17EB5B0];
  if ([*(id *)(*(void *)(a1 + 32) + 400) observedState] == 2)
  {
    if (![v14 count] || *(unsigned char *)(*(void *)(a1 + 32) + 209))
    {
      uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_protectedDataInaccessibilityError");
      uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v4 = *(void **)(v3 + 40);
      *(void *)(v3 + 40) = v2;
LABEL_10:

      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v5 = [v14 cacheSize];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5 - [v14 count];
  }
  uint64_t v6 = [objc_alloc(MEMORY[0x1E4F65CC8]) initWithAssertionIdentifier:@"DatabaseAccessibility" ownerIdentifier:*(void *)(a1 + 40)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  BOOL v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  double v9 = *(double *)(a1 + 72);
  if (v9 <= 0.0) {
    double v9 = 10.0;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setBudget:v9];
  if (([*(id *)(*(void *)(a1 + 32) + 336) takeAssertion:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)] & 1) == 0)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Failed to take database accessibility assertion");
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v4 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;
    goto LABEL_10;
  }
LABEL_11:
}

uint64_t __99__HDDatabase_takeAccessibilityAssertionWithOwnerIdentifier_shouldPerformTransaction_timeout_error___block_invoke_2()
{
  return 1;
}

- (id)cloneAccessibilityAssertion:(id)a3 ownerIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 assertionIdentifier];
  char v11 = [v10 isEqualToString:@"DatabaseAccessibility"];

  if ((v11 & 1) == 0)
  {
    _HKInitializeLogging();
    id v16 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_fault_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_FAULT, "Attempting to clone improper database accessibility assertion: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_10;
  }
  if ([v8 state] != 2)
  {
LABEL_10:
    id v17 = 0;
    goto LABEL_16;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  double v28 = __Block_byref_object_copy__68;
  uint64_t v29 = __Block_byref_object_dispose__68;
  id v30 = [v8 cloneWithOwnerIdentifier:v9];
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    uint64_t v20 = 0;
    dispatch_source_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    dispatch_time_t v23 = __Block_byref_object_copy__68;
    id v24 = __Block_byref_object_dispose__68;
    id v25 = 0;
    protectedDataQueue = self->_protectedDataQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__HDDatabase_cloneAccessibilityAssertion_ownerIdentifier_error___block_invoke;
    block[3] = &unk_1E62FC860;
    void block[4] = self;
    void block[5] = &buf;
    block[6] = &v20;
    dispatch_sync(protectedDataQueue, block);
    uint64_t v13 = *(void **)(*((void *)&buf + 1) + 40);
    if (!v13)
    {
      id v14 = (id)v21[5];
      BOOL v15 = v14;
      if (v14)
      {
        if (a5) {
          *a5 = v14;
        }
        else {
          _HKLogDroppedError();
        }
      }

      uint64_t v13 = *(void **)(*((void *)&buf + 1) + 40);
    }
    id v17 = v13;
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v17 = 0;
  }
  _Block_object_dispose(&buf, 8);

LABEL_16:

  return v17;
}

void __64__HDDatabase_cloneAccessibilityAssertion_ownerIdentifier_error___block_invoke(void *a1)
{
  if (([*(id *)(a1[4] + 336) takeAssertion:*(void *)(*(void *)(a1[5] + 8) + 40)] & 1) == 0)
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Failed to take cloned database accessibility assertion");
    uint64_t v3 = *(void *)(a1[6] + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    uint64_t v5 = *(void *)(a1[5] + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

uint64_t __52__HDDatabase__protectedDataQueue_flushProtectedData__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 352) lock];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 392) objectForKeyedSubscript:&unk_1F17EB5B0];
  uint64_t v3 = [v2 checkedOutDatabaseCount];

  if (!v3) {
    -[HDDatabase _invalidateProtectedResourceAssertions](*(void *)(a1 + 32));
  }
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 352);

  return [v4 unlock];
}

- (void)_invalidateProtectedResourceAssertions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    _HKInitializeLogging();
    uint64_t v2 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v15 = a1;
      _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_INFO, "%{public}@: Invalidate protected resource assertions", buf, 0xCu);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    uint64_t v3 = [*(id *)(a1 + 280) allValues];
    uint64_t v4 = *(void **)(a1 + 280);
    *(void *)(a1 + 280) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "invalidate", (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (id)progressForJournalMergeWithType:(int64_t)a3
{
  uint64_t v3 = [(HDDatabase *)self _journalForType:a3];
  uint64_t v4 = [v3 progressForJournalMerge];

  return v4;
}

- (id)_journalForType:(int64_t)a3
{
  uint64_t v3 = 296;
  if (a3 == 2) {
    uint64_t v3 = 304;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

void __37__HDDatabase__mergeSecondaryJournals__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    -[HDDatabase _mergeSecondaryJournals]();
  }
}

void __37__HDDatabase__mergeSecondaryJournals__block_invoke_2(uint64_t a1)
{
  atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 232));
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 304);
  id WeakRetained = objc_loadWeakRetained((id *)(v1 + 312));
  objc_msgSend(v2, "mergeWithProfile:shouldContinueHandler:");
}

void __61__HDDatabase__mergeSecondaryJournalsWithActivity_completion___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = (os_log_t *)MEMORY[0x1E4F29F18];
  uint64_t v3 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v32 = v4;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting to merge secondary journals using activity", buf, 0xCu);
  }
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  [*(id *)(*(void *)(a1 + 32) + 304) resetJournalMergeInterruptionsCount];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 304);
  id WeakRetained = objc_loadWeakRetained((id *)(v6 + 312));
  long long v9 = *(void **)(a1 + 40);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __61__HDDatabase__mergeSecondaryJournalsWithActivity_completion___block_invoke_541;
  v29[3] = &unk_1E62FC8B0;
  id v30 = v9;
  char v10 = [v7 mergeWithProfile:WeakRetained activity:v30 shouldContinueHandler:v29];

  long long v11 = [MEMORY[0x1E4F1C9C8] now];
  [v11 timeIntervalSinceDate:v5];
  double v13 = v12;

  if ([*(id *)(a1 + 40) shouldDefer])
  {
    _HKInitializeLogging();
    id v14 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v32 = v15;
      _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Journal merge activity deffered", buf, 0xCu);
    }
    id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 312));
    id v17 = [v16 daemon];
    id v18 = [v17 analyticsSubmissionCoordinator];
    id v19 = [*(id *)(*(void *)(a1 + 32) + 304) journalMergeInterruptions];
    objc_msgSend(v18, "database_reportJournalMergeActivityResult:duration:interruptions:error:", 2, v19, 0, v13);
LABEL_11:

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_15;
  }
  if (v10)
  {
    _HKInitializeLogging();
    uint64_t v20 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v32 = v21;
      _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Completing journal merge activity successfully", buf, 0xCu);
    }
    id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 312));
    id v17 = [v16 daemon];
    id v18 = [v17 analyticsSubmissionCoordinator];
    id v19 = [*(id *)(*(void *)(a1 + 32) + 304) journalMergeInterruptions];
    objc_msgSend(v18, "database_reportJournalMergeActivityResult:duration:interruptions:error:", 0, v19, 0, v13);
    goto LABEL_11;
  }
  _HKInitializeLogging();
  uint64_t v22 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v28 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v32 = v28;
    _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Error merging secondary journal", buf, 0xCu);
  }
  dispatch_time_t v23 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Error merging secondary journals");
  id v24 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 312));
  id v25 = [v24 daemon];
  __int16 v26 = [v25 analyticsSubmissionCoordinator];
  uint64_t v27 = [*(id *)(*(void *)(a1 + 32) + 304) journalMergeInterruptions];
  objc_msgSend(v26, "database_reportJournalMergeActivityResult:duration:interruptions:error:", 1, v27, v23, v13);

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_15:
}

uint64_t __61__HDDatabase__mergeSecondaryJournalsWithActivity_completion___block_invoke_541(uint64_t a1, uint64_t a2)
{
  int v3 = [*(id *)(a1 + 32) shouldDefer];
  if (v3) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a2, 708, @"Interrupting secondary journal merge activity due to activity deferral request.");
  }
  return v3 ^ 1u;
}

- (unint64_t)journalChapterCountForType:(int64_t)a3
{
  int v3 = [(HDDatabase *)self _journalForType:a3];
  unint64_t v4 = [v3 journalChapterCount];

  return v4;
}

- (void)performInFirstUnprotectedWriteTransaction:(id)a3
{
  id v13 = a3;
  p_transactionStartLocuint64_t k = &self->_transactionStartLock;
  os_unfair_lock_lock(&self->_transactionStartLock);
  uint64_t v6 = v13;
  firstUnprotectedWriteTransactionBlocks = self->_firstUnprotectedWriteTransactionBlocks;
  if (firstUnprotectedWriteTransactionBlocks
    || (uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]),
        long long v9 = self->_firstUnprotectedWriteTransactionBlocks,
        self->_firstUnprotectedWriteTransactionBlocks = v8,
        v9,
        firstUnprotectedWriteTransactionBlocks = self->_firstUnprotectedWriteTransactionBlocks,
        uint64_t v6 = v13,
        firstUnprotectedWriteTransactionBlocks))
  {
    char v10 = (void *)[v6 copy];
    long long v11 = _Block_copy(v10);
    [(NSMutableArray *)firstUnprotectedWriteTransactionBlocks addObject:v11];

    os_unfair_lock_unlock(p_transactionStartLock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_transactionStartLock);
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"HDDatabase.mm" lineNumber:2356 description:@"Attempt to add a first unprotected write transaction block after blocks have already been run."];
  }
}

- (void)performInFirstProtectedWriteTransaction:(id)a3
{
  id v10 = a3;
  p_transactionStartLocuint64_t k = &self->_transactionStartLock;
  os_unfair_lock_lock(&self->_transactionStartLock);
  firstProtectedWriteTransactionBlocks = self->_firstProtectedWriteTransactionBlocks;
  if (firstProtectedWriteTransactionBlocks)
  {
    uint64_t v7 = (void *)[v10 copy];
    uint64_t v8 = _Block_copy(v7);
    [(NSMutableArray *)firstProtectedWriteTransactionBlocks addObject:v8];

    os_unfair_lock_unlock(p_transactionStartLock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_transactionStartLock);
    long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"HDDatabase.mm" lineNumber:2367 description:@"Attempt to add a first protected write transaction block after blocks have already been run."];
  }
}

uint64_t __68__HDDatabase__waitForTransactionStartTasksIfNeededForContext_error___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 312));
  uint64_t v5 = [v3 mergeWithProfile:WeakRetained shouldContinueHandler:0];

  if ((v5 & 1) == 0) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a2, 6, @"Failed to merge required journal.");
  }
  return v5;
}

uint64_t __86__HDDatabase__transactionStartLock_runFirstTransactionBlocksIfNeededForContext_error___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__HDDatabase__transactionStartLock_runFirstTransactionBlocksIfNeededForContext_error___block_invoke_2;
  v8[3] = &unk_1E62FC928;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  uint64_t v6 = [v4 performTransactionWithContext:v5 error:a2 block:v8 inaccessibilityHandler:0];

  return v6;
}

uint64_t __86__HDDatabase__transactionStartLock_runFirstTransactionBlocksIfNeededForContext_error___block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = a1[4];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v31;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v31 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void *)(*((void *)&v30 + 1) + 8 * v9);
      id v29 = 0;
      char v11 = (*(uint64_t (**)(void))(v10 + 16))();
      id v12 = v29;
      id v13 = v12;
      if ((v11 & 1) == 0) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    if (v12)
    {
      id v21 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 122, @"First unprotected transaction block failed without reporting an error.");
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      if (!v21) {
        goto LABEL_28;
      }
    }
    if (a3) {
      *a3 = v21;
    }
    else {
      _HKLogDroppedError();
    }
    BOOL v22 = v13 == 0;

    goto LABEL_27;
  }
LABEL_9:

  if ([a1[5] requiresProtectedData])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v6 = a1[6];
    uint64_t v14 = [v6 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (!v14)
    {
      uint64_t v20 = 1;
LABEL_30:

      goto LABEL_31;
    }
    uint64_t v15 = *(void *)v26;
LABEL_12:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v26 != v15) {
        objc_enumerationMutation(v6);
      }
      uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * v16);
      id v24 = 0;
      char v18 = (*(uint64_t (**)(void))(v17 + 16))();
      id v19 = v24;
      id v13 = v19;
      if ((v18 & 1) == 0) {
        break;
      }

      if (v14 == ++v16)
      {
        uint64_t v14 = [v6 countByEnumeratingWithState:&v25 objects:v34 count:16];
        uint64_t v20 = 1;
        if (v14) {
          goto LABEL_12;
        }
        goto LABEL_30;
      }
    }
    if (v19)
    {
      id v21 = v19;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 122, @"First protected transaction block failed without reporting an error.");
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      if (!v21) {
        goto LABEL_28;
      }
    }
    if (a3) {
      *a3 = v21;
    }
    else {
      _HKLogDroppedError();
    }
    BOOL v22 = v13 == 0;

LABEL_27:
    if (v22)
    {
LABEL_28:

      id v13 = 0;
    }

    uint64_t v20 = 0;
    goto LABEL_30;
  }
  uint64_t v20 = 1;
LABEL_31:

  return v20;
}

uint64_t __54__HDDatabase__performFirstJournalMergeCleanupIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = objc_msgSend(*(id *)(a1 + 32), "allEntityClassesWithProtectionClass:", 2, 0, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_opt_respondsToSelector())
        {
          uint64_t v10 = objc_opt_class();
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 312));
          LOBYTE(v10) = [(id)v10 performPostFirstJournalMergeCleanupWithTransaction:v5 profile:WeakRetained error:a3];

          if ((v10 & 1) == 0)
          {
            uint64_t v12 = 0;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 1;
LABEL_12:

  return v12;
}

uint64_t __51__HDDatabase__mergePrimaryJournalForContext_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 296) mergeWithProfile:*(void *)(a1 + 40) shouldContinueHandler:0];
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      unsigned __int8 v6 = atomic_load((unsigned __int8 *)(v5 + 248));
      if ((v6 & 1) == 0)
      {
        uint64_t v7 = *(void **)(v5 + 296);
        id WeakRetained = objc_loadWeakRetained((id *)(v5 + 312));
        v16[4] = v5;
        id v17 = 0;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __54__HDDatabase__performFirstJournalMergeCleanupIfNeeded__block_invoke;
        v16[3] = &unk_1E62FC978;
        int v9 = [v7 performMergeTransactionWithProfile:WeakRetained transactionContext:0 error:&v17 block:v16];
        id v10 = v17;

        if (v9)
        {
          atomic_store(1u, (unsigned __int8 *)(v5 + 248));
          _HKInitializeLogging();
          char v11 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "Finished first journal merge cleanup.", buf, 2u);
          }
        }
        else
        {
          _HKInitializeLogging();
          long long v14 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138543362;
            id v19 = v10;
            _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "Failed to perform post-journal merge cleanup (will retry at next journal merge): %{public}@", buf, 0xCu);
          }
        }
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_protectedDataInaccessibilityError");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = v12;
    if (v12)
    {
      if (a2) {
        *a2 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v4;
}

- (id)diagnosticDescription
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  int v3 = [(HDDatabase *)self databaseSizeInBytes];
  unint64_t v4 = [v3 unsignedLongLongValue];

  os_unfair_lock_lock(&self->_protectedDataLock);
  uint64_t v5 = (void *)MEMORY[0x1E4F28E78];
  unsigned __int8 v6 = HDStringFromContentProtectionState();
  uint64_t v7 = [v5 stringWithFormat:@"Observed content protection state: %@", v6];

  os_unfair_lock_unlock(&self->_protectedDataLock);
  unint64_t protectedDataState = self->_protectedDataState;
  if (protectedDataState >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"invalid (%ld)", self->_protectedDataState);
    int v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v9 = off_1E62FCA58[protectedDataState];
  }
  [v7 appendFormat:@"\nProtected data availability state: %@", v9];

  uint64_t v35 = self->_protectedDataFlushDeadlineDate;
  if (v35 && !self->_hasFlushedProtectedData)
  {
    [(NSDate *)v35 timeIntervalSinceNow];
    if (v10 <= 0.0)
    {
      [v7 appendFormat:@"\nProtected data flush required NOW"];
    }
    else
    {
      char v11 = HKDiagnosticStringFromDate();
      [v7 appendFormat:@"\nProtected data flush required by %@", v11];
    }
  }
  [v7 appendFormat:@"\nDatabase aggregate size: %.2f MB", (double)v4 * 0.000000953674316];
  id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v13 = [(NSString *)self->_profileDirectoryPath stringByAppendingPathComponent:@"Journals"];
  id v44 = 0;
  long long v14 = [v12 contentsOfDirectoryAtPath:v13 error:&v44];
  id v15 = v44;
  uint64_t v16 = [v14 count];

  if (v16)
  {
    id v17 = "s";
    if (v16 == 1) {
      id v17 = "";
    }
    objc_msgSend(v7, "appendFormat:", @"\n  -- Includes %d journal chapter%s.", v16, v17);
  }
  char v18 = [(HDAssertionManager *)self->_assertionManager activeAssertionsForIdentifier:@"DatabaseAccessibility"];
  if ([v18 count])
  {
    objc_msgSend(v7, "appendFormat:", @"\n\nAccessibility Assertions (%lu):", objc_msgSend(v18, "count"));
    id v19 = objc_alloc(MEMORY[0x1E4F28BD0]);
    uint64_t v20 = [v18 allObjects];
    id v21 = objc_msgSend(v20, "hk_map:", &__block_literal_global_593);
    BOOL v22 = (void *)[v19 initWithArray:v21];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v41 != v25) {
            objc_enumerationMutation(v23);
          }
          [v7 appendFormat:@"\n\t%@ (%lu)", *(void *)(*((void *)&v40 + 1) + 8 * i), objc_msgSend(v23, "countForObject:", *(void *)(*((void *)&v40 + 1) + 8 * i))];
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v24);
    }
  }
  long long v27 = [(HKObserverSet *)self->_protectedDataObservers allObservers];
  uint64_t v28 = [v27 count];
  id v29 = &stru_1F1728D60;
  if (!v28) {
    id v29 = @"none";
  }
  [v7 appendFormat:@"\n\nProtected Data Observers: %@", v29];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v30 = v27;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v37 != v32) {
          objc_enumerationMutation(v30);
        }
        [v7 appendFormat:@"\n\t%@", *(void *)(*((void *)&v36 + 1) + 8 * j)];
      }
      uint64_t v31 = [v30 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v31);
  }

  objc_msgSend(v7, "appendFormat:", @"\n\nConcurrent Readers: %lu", -[HDDatabaseConfiguration concurrentReaderLimit](self->_configuration, "concurrentReaderLimit"));

  return v7;
}

id __35__HDDatabase_diagnosticDescription__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 ownerIdentifier];

  return v2;
}

- (void)addDatabaseJournalMergeObserver:(id)a3 journalType:(int64_t)a4 queue:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  databaseJournalMergeObserverSetByType = self->_databaseJournalMergeObserverSetByType;
  double v10 = [NSNumber numberWithInteger:a4];
  char v11 = [(NSMutableDictionary *)databaseJournalMergeObserverSetByType objectForKeyedSubscript:v10];
  [v11 registerObserver:v12 queue:v8];
}

- (void)removeDatabaseJournalMergeObserver:(id)a3 journalType:(int64_t)a4
{
  id v9 = a3;
  databaseJournalMergeObserverSetByType = self->_databaseJournalMergeObserverSetByType;
  uint64_t v7 = [NSNumber numberWithInteger:a4];
  id v8 = [(NSMutableDictionary *)databaseJournalMergeObserverSetByType objectForKeyedSubscript:v7];
  [v8 unregisterObserver:v9];
}

- (void)databaseJournalMergeDidComplete:(id)a3
{
  id v4 = a3;
  databaseJournalMergeObserverSetByType = self->_databaseJournalMergeObserverSetByType;
  unsigned __int8 v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "type"));
  uint64_t v7 = [(NSMutableDictionary *)databaseJournalMergeObserverSetByType objectForKeyedSubscript:v6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __46__HDDatabase_databaseJournalMergeDidComplete___block_invoke;
  v9[3] = &unk_1E62FC9C0;
  void v9[4] = self;
  id v8 = v4;
  id v10 = v8;
  [v7 notifyObservers:v9];
}

void __46__HDDatabase_databaseJournalMergeDidComplete___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 312));
  objc_msgSend(v4, "databaseJournalMergeDidCompleteForProfile:type:", WeakRetained, objc_msgSend(*(id *)(a1 + 40), "type"));
}

- (void)invalidateAndWait
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (-[HDDatabase _transitionToState:]((uint64_t)self, 5uLL))
  {
    protectedDataQueue = self->_protectedDataQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__HDDatabase_invalidateAndWait__block_invoke;
    block[3] = &unk_1E62FC630;
    void block[4] = self;
    dispatch_sync(protectedDataQueue, block);
    [(HDAssertionManager *)self->_assertionManager invalidate];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [(NSDictionary *)self->_databasePoolForType allValues];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = [*(id *)(*((void *)&v14 + 1) + 8 * v8) flush];
          dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v21 count:16];
      }
      while (v6);
    }

    -[HDDatabase _invalidateProtectedResourceAssertions]((uint64_t)self);
    id unitTest_didWaitForJournalMergeHandler = self->_unitTest_didWaitForJournalMergeHandler;
    self->_id unitTest_didWaitForJournalMergeHandler = 0;

    [(HDDatabaseJournal *)self->_journal invalidate];
    [(HDDatabaseJournal *)self->_cloudSyncJournal invalidate];
    _HKInitializeLogging();
    char v11 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v20 = self;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Health database invalidated", buf, 0xCu);
    }
  }
  [(NSConditionLock *)self->_activeDatabasesLock lockWhenCondition:0];
  uint64_t v12 = [(NSMutableSet *)self->_activeDatabases count];
  [(NSConditionLock *)self->_activeDatabasesLock unlock];
  if (v12)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDDatabase.mm", 2837, @"Invalid parameter not satisfying: %@", @"activeDatabaseCount == 0" object file lineNumber description];
  }
}

void __31__HDDatabase_invalidateAndWait__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 176) removeAllObjects];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(v2 + 176);
  *(void *)(v2 + 176) = 0;

  uint64_t v4 = *(void *)(a1 + 32);

  -[HDDatabase _protectedDataQueue_cancelProtectedDataFlushTimer](v4);
}

- (void)obliterateWithReason:(id)a3 preserveCopy:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  if ((-[HDDatabase isInvalid]((os_unfair_lock_s *)self) & 1) == 0)
  {
    long long v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"HDDatabase.mm", 2841, @"Invalid parameter not satisfying: %@", @"self.isInvalid" object file lineNumber description];
  }
  [(NSConditionLock *)self->_activeDatabasesLock lockWhenCondition:0];
  long long v41 = self;
  id v34 = [(HDDatabase *)self _newCorruptionEventStore];
  [v34 persistObliterationForReason:v38];
  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v39 = [(HDDatabase *)v41 profileDirectoryPath];
  if (!_HDIsUnitTesting)
  {
    _HKInitializeLogging();
    uint64_t v8 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v52 = v39;
      __int16 v53 = 2112;
      id v54 = v38;
      _os_log_fault_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_FAULT, "Deleting Health databases in \"%@\": %@", buf, 0x16u);
    }
  }
  uint64_t v35 = [MEMORY[0x1E4F65D18] mainDatabaseURLWithProfileDirectoryPath:v39];
  long long v36 = [MEMORY[0x1E4F65D18] protectedDatabaseURLWithProfileDirectoryPath:v39];
  long long v37 = [MEMORY[0x1E4F65D18] highFrequencyDatabaseURLWithProfileDirectoryPath:v39];
  objc_msgSend(v7, "hd_removeSQLiteDatabaseAtURL:preserveCopy:", v35, v4);
  objc_msgSend(v7, "hd_removeSQLiteDatabaseAtURL:preserveCopy:", v36, v4);
  objc_msgSend(v7, "hd_removeHFDDatabaseAtURL:preserveCopy:", v37, v4);
  id v9 = [(NSString *)v41->_profileDirectoryPath stringByAppendingPathComponent:@"Journals"];
  v50[0] = v9;
  id v10 = [(NSString *)v41->_profileDirectoryPath stringByAppendingPathComponent:@"CloudSyncJournals"];
  v50[1] = v10;
  char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];

  uint64_t v12 = [(HDDatabase *)v41 profile];
  long long v40 = [v12 attachmentManager];

  if (v40)
  {
    id v13 = [v40 filesDirectoryURL];
    long long v14 = [v13 path];
    v49[0] = v14;
    long long v15 = [v40 unconfirmedFilesDirectoryURL];
    long long v16 = [v15 path];
    v49[1] = v16;
    long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
    uint64_t v18 = [v11 arrayByAddingObjectsFromArray:v17];

    char v11 = (void *)v18;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v19 = v11;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v45;
    uint64_t v22 = (os_log_t *)MEMORY[0x1E4F29F18];
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v45 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v44 + 1) + 8 * v23);
        id v43 = 0;
        char v25 = objc_msgSend(v7, "hd_removeAllFilesAtDirectoryPath:error:", v24, &v43);
        id v26 = v43;
        if ((v25 & 1) == 0)
        {
          _HKInitializeLogging();
          long long v27 = *v22;
          if (os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138543618;
            uint64_t v52 = v24;
            __int16 v53 = 2114;
            id v54 = v26;
            _os_log_error_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_ERROR, "Failed to delete all files in directory \"%{public}@\": %{public}@", buf, 0x16u);
          }
        }

        ++v23;
      }
      while (v20 != v23);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v20);
  }

  uint64_t v28 = [(HDDatabase *)v41 profile];
  BOOL v29 = [v28 profileType] == 1;

  if (!v29)
  {
    id v42 = 0;
    char v30 = [v7 removeItemAtPath:v39 error:&v42];
    id v31 = v42;
    if ((v30 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v32 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v52 = v39;
        __int16 v53 = 2114;
        id v54 = v31;
        _os_log_error_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_ERROR, "Failed to delete directory at path \"%{public}@\": %{public}@", buf, 0x16u);
      }
    }
  }
  [(NSConditionLock *)v41->_activeDatabasesLock unlock];
}

- (id)databaseUUIDWithError:(id *)a3
{
  p_databaseUUIDLocuint64_t k = &self->_databaseUUIDLock;
  os_unfair_lock_lock(&self->_databaseUUIDLock);
  uint64_t v6 = self->_databaseUUID;
  os_unfair_lock_unlock(p_databaseUUIDLock);
  if (v6)
  {
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    long long v14 = __Block_byref_object_copy__68;
    long long v15 = __Block_byref_object_dispose__68;
    id v16 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__HDDatabase_databaseUUIDWithError___block_invoke;
    v10[3] = &unk_1E62FC9E8;
    v10[4] = self;
    v10[5] = &v11;
    [(HDDatabase *)self performHighPriorityTransactionsWithError:a3 block:v10];
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", v12[5]);
    os_unfair_lock_lock(p_databaseUUIDLock);
    if (!self->_databaseUUID) {
      objc_storeStrong((id *)&self->_databaseUUID, v8);
    }
    os_unfair_lock_unlock(p_databaseUUIDLock);
    uint64_t v7 = v8;
    _Block_object_dispose(&v11, 8);
  }

  return v7;
}

BOOL __36__HDDatabase_databaseUUIDWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v4 = [*(id *)(a1 + 32) profile];
  uint64_t v5 = +[HDKeyValueEntity retrieveDatabaseIdentifierFromProfile:v4 error:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (void)unitTest_setContentProtectionStateAndWait:(int64_t)a3
{
  uint64_t v5 = [(HDDatabase *)self contentProtectionManager];
  [v5 setContentProtectionState:a3];

  protectedDataQueue = self->_protectedDataQueue;

  dispatch_sync(protectedDataQueue, &__block_literal_global_618);
}

- (void)unitTest_clearFirstJournalMergeCleanupFlag
{
}

- (void)unitTest_disableDatabaseAccessibilityAssertions
{
  protectedDataQueue = self->_protectedDataQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__HDDatabase_unitTest_disableDatabaseAccessibilityAssertions__block_invoke;
  block[3] = &unk_1E62FC630;
  void block[4] = self;
  dispatch_sync(protectedDataQueue, block);
}

void __61__HDDatabase_unitTest_disableDatabaseAccessibilityAssertions__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 209) = 1;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v1 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 336), "allAssertionsForIdentifier:", @"DatabaseAccessibility", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v6;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v6 != v3) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v5 + 1) + 8 * v4++) invalidate];
      }
      while (v2 != v4);
      uint64_t v2 = [v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
    }
    while (v2);
  }
}

- (void)unitTest_enableDatabaseAccessibilityAssertions
{
  protectedDataQueue = self->_protectedDataQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HDDatabase_unitTest_enableDatabaseAccessibilityAssertions__block_invoke;
  block[3] = &unk_1E62FC630;
  void block[4] = self;
  dispatch_sync(protectedDataQueue, block);
}

uint64_t __60__HDDatabase_unitTest_enableDatabaseAccessibilityAssertions__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 209) = 0;
  return result;
}

- (NSString)profileDirectoryPath
{
  return self->_profileDirectoryPath;
}

- (HKProfileIdentifier)profileIdentifier
{
  uint64_t v2 = [(HDDatabase *)self profile];
  uint64_t v3 = [v2 profileIdentifier];

  return (HKProfileIdentifier *)v3;
}

- (void)unitTest_mergeSecondaryJournalsWithActivity:(id)a3 completion:(id)a4
{
}

- (HDDatabaseJournal)journal
{
  return self->_journal;
}

- (HDDatabaseJournal)cloudSyncJournal
{
  return self->_cloudSyncJournal;
}

- (HDDatabaseConfiguration)configuration
{
  return self->_configuration;
}

- (void)setProfile:(id)a3
{
}

- (HDContentProtectionManager)contentProtectionManager
{
  return self->_contentProtectionManager;
}

- (void)setOffsetTimeInterval:(double)a3
{
  self->_offsetTimeInterval = a3;
}

- (double)protectedDataFlushInterval
{
  return self->_protectedDataFlushInterval;
}

- (double)inactivityFlushInterval
{
  return self->_inactivityFlushInterval;
}

- (void)setInactivityFlushInterval:(double)a3
{
  self->_inactivityFlushInterval = a3;
}

- (BOOL)didRunPostMigrationUpdates
{
  return self->_didRunPostMigrationUpdates;
}

- (void)setDidRunPostMigrationUpdates:(BOOL)a3
{
  self->_didRunPostMigrationUpdates = a3;
}

- (int64_t)corruptedMigrationAttemptsCount
{
  return self->_corruptedMigrationAttemptsCount;
}

- (void)setCorruptedMigrationAttemptsCount:(int64_t)a3
{
  self->_corruptedMigrationAttemptsCount = a3;
}

- (id)unitTest_didWaitForJournalMergeHandler
{
  return self->_unitTest_didWaitForJournalMergeHandler;
}

- (void)setUnitTest_didWaitForJournalMergeHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_didWaitForJournalMergeHandler, 0);
  objc_storeStrong((id *)&self->_contentProtectionManager, 0);
  objc_storeStrong((id *)&self->_databasePoolForType, 0);
  objc_storeStrong((id *)&self->_extendedTransactions, 0);
  objc_storeStrong((id *)&self->_asynchronousOperationQueue, 0);
  objc_storeStrong((id *)&self->_migratedDatabases, 0);
  objc_storeStrong((id *)&self->_activeDatabases, 0);
  objc_storeStrong((id *)&self->_activeDatabasesLock, 0);
  objc_storeStrong((id *)&self->_schemaMigrationLock, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_threadLocalTransactionContextStackKey, 0);
  objc_storeStrong((id *)&self->_threadLocalTransactionKey, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_cloudSyncJournal, 0);
  objc_storeStrong((id *)&self->_journal, 0);
  objc_storeStrong((id *)&self->_protectedResourceAssertionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_protectedResourceStores, 0);
  objc_storeStrong((id *)&self->_databaseJournalMergeObserverSetByType, 0);
  objc_storeStrong((id *)&self->_secondaryJournalMergeActivity, 0);
  objc_storeStrong((id *)&self->_protectedDataFlushDeadlineTimer, 0);
  objc_storeStrong((id *)&self->_protectedDataFlushDeadlineDate, 0);
  objc_storeStrong((id *)&self->_firstUnlockBlocks, 0);
  objc_storeStrong((id *)&self->_transactionStartGroup, 0);
  objc_storeStrong((id *)&self->_firstProtectedWriteTransactionBlocks, 0);
  objc_storeStrong((id *)&self->_firstUnprotectedWriteTransactionBlocks, 0);
  objc_storeStrong((id *)&self->_inactivityFlushTimer, 0);
  objc_storeStrong((id *)&self->_contentProtectionObservationGroup, 0);
  objc_storeStrong((id *)&self->_protectedDataObservers, 0);
  objc_storeStrong((id *)&self->_protectedDataQueue, 0);
  objc_storeStrong((id *)&self->_writeLock, 0);
  objc_storeStrong((id *)&self->_serialAsynchronousQueue, 0);
  objc_storeStrong((id *)&self->_databaseUUID, 0);
  objc_storeStrong((id *)&self->_profileDirectoryPath, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end