@interface ACHEarnedInstanceEntity
+ (ACHEarnedInstanceEntityJournalEntryAppliedObserver)journalEntryAppliedObserver;
+ (ACHEarnedInstanceEntitySyncedEarnedInstancesObserver)syncedEarnedInstancesObserver;
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (BOOL)removeAllEarnedInstancesWithProfile:(id)a3 error:(id *)a4;
+ (BOOL)removeEarnedInstances:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)removeEarnedInstancesForTemplateUniqueName:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)supportsSyncStore:(id)a3;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_earnedInstancesWithPredicate:(id)a3 limit:(unint64_t)a4 ascendingByEarnedDate:(BOOL)a5 profile:(id)a6 error:(id *)a7;
+ (id)_earnedInstancesWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)_insertEarnedInstance:(id)a3 provenance:(int64_t)a4 syncIdentity:(int64_t)a5 database:(id)a6 error:(id *)a7;
+ (id)_insertEarnedInstances:(id)a3 provenance:(int64_t)a4 useLegacySyncIdentity:(BOOL)a5 profile:(id)a6 databaseContext:(id)a7 error:(id *)a8;
+ (id)allEarnedInstancesWithProfile:(id)a3 error:(id *)a4;
+ (id)codableEarnedInstanceForEarnedInstanceInDatabase:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)createTableSQL;
+ (id)databaseTable;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)earnedInstancesForDateComponents:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)earnedInstancesForTemplateUniqueName:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)insertEarnedInstances:(id)a3 provenance:(int64_t)a4 useLegacySyncIdentity:(BOOL)a5 profile:(id)a6 databaseContext:(id)a7 error:(id *)a8;
+ (id)mostRecentEarnedInstanceForTemplateUniqueName:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)protectionClass;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
+ (unint64_t)_countOfEarnedInstancesWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5;
+ (unint64_t)countOfEarnedInstancesForTemplateUniqueName:(id)a3 profile:(id)a4 error:(id *)a5;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
+ (void)setJournalEntryAppliedObserver:(id)a3;
+ (void)setSyncedEarnedInstancesObserver:(id)a3;
@end

@implementation ACHEarnedInstanceEntity

+ (void)setSyncedEarnedInstancesObserver:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&syncObserverLock);
  objc_storeWeak(&_syncObserver, v3);

  os_unfair_lock_unlock((os_unfair_lock_t)&syncObserverLock);
}

+ (ACHEarnedInstanceEntitySyncedEarnedInstancesObserver)syncedEarnedInstancesObserver
{
  os_unfair_lock_lock((os_unfair_lock_t)&syncObserverLock);
  id WeakRetained = objc_loadWeakRetained(&_syncObserver);
  os_unfair_lock_unlock((os_unfair_lock_t)&syncObserverLock);
  return (ACHEarnedInstanceEntitySyncedEarnedInstancesObserver *)WeakRetained;
}

+ (void)setJournalEntryAppliedObserver:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&journalAppliedObserverLock);
  objc_storeWeak(&_journalEntryAppliedObserver, v3);

  os_unfair_lock_unlock((os_unfair_lock_t)&journalAppliedObserverLock);
}

+ (ACHEarnedInstanceEntityJournalEntryAppliedObserver)journalEntryAppliedObserver
{
  os_unfair_lock_lock((os_unfair_lock_t)&journalAppliedObserverLock);
  id WeakRetained = objc_loadWeakRetained(&_journalEntryAppliedObserver);
  os_unfair_lock_unlock((os_unfair_lock_t)&journalAppliedObserverLock);
  return (ACHEarnedInstanceEntityJournalEntryAppliedObserver *)WeakRetained;
}

+ (id)databaseTable
{
  return (id)[NSString stringWithFormat:@"%@_earned_instances", *MEMORY[0x263F23448]];
}

+ (id)createTableSQL
{
  v2 = NSString;
  id v3 = [a1 databaseTable];
  v4 = [v2 stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@             (%@ INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ REAL, %@ TEXT, %@ REAL, %@ TEXT, %@ TEXT, %@ INTEGER, %@ INTEGER, %@ INTEGER NOT NULL)", v3, *MEMORY[0x263F43488], @"template_unique_name", @"created_date", @"earned_date", @"value_in_canonical_unit", @"value_canonical_unit", @"external_identifier", @"creator_device", @"sync_provenance", @"sync_identity"];

  return v4;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 10;
  return (const $27325D3925FB5ACF38BB0AF4A70276FF *)columnDefinitionsWithCount__columnDefinitions;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [(HDEntityEncoder *)[ACHEarnedInstanceEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (id)insertEarnedInstances:(id)a3 provenance:(int64_t)a4 useLegacySyncIdentity:(BOOL)a5 profile:(id)a6 databaseContext:(id)a7 error:(id *)a8
{
  BOOL v10 = a5;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  v16 = [(id)objc_opt_class() _insertEarnedInstances:v15 provenance:a4 useLegacySyncIdentity:v10 profile:v14 databaseContext:v13 error:a8];

  return v16;
}

+ (id)allEarnedInstancesWithProfile:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x263F434D0];
  id v6 = a3;
  v7 = [v5 truePredicate];
  v8 = [(id)objc_opt_class() _earnedInstancesWithPredicate:v7 profile:v6 error:a4];

  return v8;
}

+ (id)mostRecentEarnedInstanceForTemplateUniqueName:(id)a3 profile:(id)a4 error:(id *)a5
{
  v7 = (void *)MEMORY[0x263F434A0];
  id v8 = a4;
  v9 = [v7 predicateWithProperty:@"template_unique_name" equalToValue:a3];
  BOOL v10 = [(id)objc_opt_class() _earnedInstancesWithPredicate:v9 limit:1 ascendingByEarnedDate:0 profile:v8 error:a5];

  id v11 = [v10 lastObject];

  return v11;
}

+ (id)earnedInstancesForTemplateUniqueName:(id)a3 profile:(id)a4 error:(id *)a5
{
  v7 = (void *)MEMORY[0x263F434A0];
  id v8 = a4;
  v9 = [v7 predicateWithProperty:@"template_unique_name" equalToValue:a3];
  BOOL v10 = [(id)objc_opt_class() _earnedInstancesWithPredicate:v9 profile:v8 error:a5];

  return v10;
}

+ (unint64_t)countOfEarnedInstancesForTemplateUniqueName:(id)a3 profile:(id)a4 error:(id *)a5
{
  v7 = (void *)MEMORY[0x263F434A0];
  id v8 = a4;
  v9 = [v7 predicateWithProperty:@"template_unique_name" equalToValue:a3];
  unint64_t v10 = [(id)objc_opt_class() _countOfEarnedInstancesWithPredicate:v9 profile:v8 error:a5];

  return v10;
}

+ (id)earnedInstancesForDateComponents:(id)a3 profile:(id)a4 error:(id *)a5
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = ACHYearMonthDayStringFromDateComponents();
  if (v7)
  {
    id v8 = [MEMORY[0x263F434A0] predicateWithProperty:@"earned_date" equalToValue:v7];
    v9 = [(id)objc_opt_class() _earnedInstancesWithPredicate:v8 profile:v6 error:a5];
  }
  else
  {
    unint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08320];
    v15[0] = @"Unable to parse date components";
    id v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v12 = [v10 errorWithDomain:@"com.apple.ActivityAchievements" code:133 userInfo:v11];
    if (v12)
    {
      if (a5) {
        *a5 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v9 = (void *)MEMORY[0x263EFFA68];
  }

  return v9;
}

+ (BOOL)removeEarnedInstances:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    unint64_t v10 = ACHEarnedInstancePredicateUsingKey(v8);
    id v11 = [v9 database];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __63__ACHEarnedInstanceEntity_removeEarnedInstances_profile_error___block_invoke;
    v18[3] = &unk_264516350;
    id v21 = a1;
    id v19 = v10;
    id v20 = v9;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    void v15[2] = __63__ACHEarnedInstanceEntity_removeEarnedInstances_profile_error___block_invoke_2;
    v15[3] = &unk_264516378;
    id v16 = v8;
    id v17 = v20;
    id v12 = v10;
    char v13 = [a1 performWriteTransactionWithHealthDatabase:v11 error:a5 block:v18 inaccessibilityHandler:v15];
  }
  else
  {
    char v13 = 1;
  }

  return v13;
}

uint64_t __63__ACHEarnedInstanceEntity_removeEarnedInstances_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(a1 + 48);
  id v6 = [*(id *)(a1 + 40) database];
  uint64_t v7 = [v5 deleteEntitiesWithPredicate:v4 healthDatabase:v6 error:a3];

  return v7;
}

uint64_t __63__ACHEarnedInstanceEntity_removeEarnedInstances_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        id v12 = [ACHEarnedInstanceJournalEntry alloc];
        char v13 = -[ACHEarnedInstanceJournalEntry initWithEarnedInstance:provenance:useLegacySyncIdentity:action:](v12, "initWithEarnedInstance:provenance:useLegacySyncIdentity:action:", v11, 0, 0, 1, (void)v17);
        [v5 addObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v14 = [*(id *)(a1 + 40) database];
  uint64_t v15 = [v14 addJournalEntries:v5 error:a3];

  return v15;
}

+ (BOOL)removeEarnedInstancesForTemplateUniqueName:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [a1 earnedInstancesForTemplateUniqueName:a3 profile:v8 error:a5];
  LOBYTE(a5) = [(id)objc_opt_class() removeEarnedInstances:v9 profile:v8 error:a5];

  return (char)a5;
}

+ (BOOL)removeAllEarnedInstancesWithProfile:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(id)objc_opt_class() allEarnedInstancesWithProfile:v5 error:a4];
  LOBYTE(a4) = [(id)objc_opt_class() removeEarnedInstances:v6 profile:v5 error:a4];

  return (char)a4;
}

+ (unint64_t)_countOfEarnedInstancesWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [a4 database];
  unint64_t v10 = [a1 countOfObjectsWithPredicate:v8 healthDatabase:v9 error:a5];

  return v10;
}

+ (id)_earnedInstancesWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5
{
  return (id)[a1 _earnedInstancesWithPredicate:a3 limit:*MEMORY[0x263F434E8] ascendingByEarnedDate:1 profile:a4 error:a5];
}

+ (id)_earnedInstancesWithPredicate:(id)a3 limit:(unint64_t)a4 ascendingByEarnedDate:(BOOL)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  id v31 = (id)MEMORY[0x263EFFA68];
  uint64_t v14 = [v13 database];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __99__ACHEarnedInstanceEntity__earnedInstancesWithPredicate_limit_ascendingByEarnedDate_profile_error___block_invoke;
  v19[3] = &unk_2645163C8;
  id v23 = a1;
  id v15 = v13;
  id v20 = v15;
  id v16 = v12;
  unint64_t v24 = a4;
  BOOL v25 = a5;
  id v21 = v16;
  uint64_t v22 = &v26;
  [a1 performReadTransactionWithHealthDatabase:v14 error:a7 block:v19];

  id v17 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v17;
}

uint64_t __99__ACHEarnedInstanceEntity__earnedInstancesWithPredicate_limit_ascendingByEarnedDate_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v24[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:*(void *)(a1 + 56)];
  uint64_t v7 = [*(id *)(a1 + 56) entityEncoderForProfile:*(void *)(a1 + 32) transaction:v5 purpose:1 encodingOptions:0 authorizationFilter:0];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = [MEMORY[0x263F434C8] orderingTermWithProperty:@"earned_date" entityClass:v9 ascending:*(unsigned __int8 *)(a1 + 72)];
  v24[0] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  id v13 = [v9 queryWithDatabase:v6 predicate:v8 limit:v10 orderingTerms:v12 groupBy:0];

  uint64_t v14 = [v7 orderedProperties];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __99__ACHEarnedInstanceEntity__earnedInstancesWithPredicate_limit_ascendingByEarnedDate_profile_error___block_invoke_2;
  v19[3] = &unk_2645163A0;
  id v20 = v7;
  id v21 = *(id *)(a1 + 32);
  id v22 = v5;
  uint64_t v23 = *(void *)(a1 + 48);
  id v15 = v5;
  id v16 = v7;
  uint64_t v17 = [v13 enumeratePersistentIDsAndProperties:v14 error:a3 enumerationHandler:v19];

  return v17;
}

BOOL __99__ACHEarnedInstanceEntity__earnedInstancesWithPredicate_limit_ascendingByEarnedDate_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v19 = 0;
  uint64_t v4 = objc_msgSend(v3, "objectForPersistentID:row:error:", a2);
  id v5 = v19;
  uint64_t v6 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v7 = [*(id *)(a1 + 40) syncIdentityManager];
  uint64_t v8 = *(void *)(a1 + 48);
  id v18 = v5;
  uint64_t v9 = [v7 identityForEntityID:v6 transaction:v8 error:&v18];
  id v10 = v18;

  if (v9)
  {
    uint64_t v11 = [v9 identity];
    id v12 = achSyncIdentity(v11);

    if (v12) {
      [v4 setSyncIdentity:v12];
    }
    BOOL v13 = v4 != 0;
    if (v4)
    {
      uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) arrayByAddingObject:v4];
      uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
      id v16 = *(NSObject **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
    else
    {
      id v16 = ACHLogDatabase();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __99__ACHEarnedInstanceEntity__earnedInstancesWithPredicate_limit_ascendingByEarnedDate_profile_error___block_invoke_2_cold_2();
      }
    }
  }
  else
  {
    id v12 = ACHLogDatabase();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __99__ACHEarnedInstanceEntity__earnedInstancesWithPredicate_limit_ascendingByEarnedDate_profile_error___block_invoke_2_cold_1();
    }
    BOOL v13 = 0;
  }

  return v13;
}

+ (id)_insertEarnedInstances:(id)a3 provenance:(int64_t)a4 useLegacySyncIdentity:(BOOL)a5 profile:(id)a6 databaseContext:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  if (!v16)
  {
    id v16 = [MEMORY[0x263F431E0] contextForWritingProtectedData];
  }
  id v18 = [v15 database];
  id v19 = (void *)[v16 copyForWritingProtectedData];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __113__ACHEarnedInstanceEntity__insertEarnedInstances_provenance_useLegacySyncIdentity_profile_databaseContext_error___block_invoke;
  v32[3] = &unk_2645163F0;
  id v33 = v14;
  BOOL v38 = a5;
  id v34 = v15;
  id v36 = a1;
  int64_t v37 = a4;
  id v20 = v17;
  id v35 = v20;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __113__ACHEarnedInstanceEntity__insertEarnedInstances_provenance_useLegacySyncIdentity_profile_databaseContext_error___block_invoke_2;
  v27[3] = &unk_264516418;
  id v21 = v33;
  id v28 = v21;
  int64_t v30 = a4;
  BOOL v31 = a5;
  id v22 = v34;
  id v29 = v22;
  char v23 = [v18 performTransactionWithContext:v19 error:a8 block:v32 inaccessibilityHandler:v27];

  if ((v23 & 1) == 0)
  {
    unint64_t v24 = ACHLogDatabase();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[ACHEarnedInstanceEntity _insertEarnedInstances:provenance:useLegacySyncIdentity:profile:databaseContext:error:]();
    }
  }
  BOOL v25 = ACHSortedEarnedInstances();

  return v25;
}

uint64_t __113__ACHEarnedInstanceEntity__insertEarnedInstances_provenance_useLegacySyncIdentity_profile_databaseContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a2;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = 1;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"key" ascending:1];
  id v29 = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
  uint64_t v9 = [v5 sortedArrayUsingDescriptors:v8];

  id obj = v9;
  uint64_t v23 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v12 = ACHEarnedInstanceSyncIdentityFromEarnedInstance(v11, *(unsigned __int8 *)(a1 + 72), *(void **)(a1 + 40), v4);
        BOOL v13 = objc_opt_class();
        uint64_t v14 = *(void *)(a1 + 64);
        id v15 = [v12 entity];
        uint64_t v16 = [v15 persistentID];
        id v17 = [v4 protectedDatabase];
        id v18 = [v13 _insertEarnedInstance:v11 provenance:v14 syncIdentity:v16 database:v17 error:a3];

        id v19 = (void *)[v11 copy];
        objc_msgSend(v19, "setKey:", objc_msgSend(v18, "persistentID"));
        if (!v19)
        {

          uint64_t v6 = 0;
          goto LABEL_11;
        }
        [*(id *)(a1 + 48) addObject:v19];
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v23) {
        continue;
      }
      break;
    }
    uint64_t v6 = 1;
  }
LABEL_11:

  return v6;
}

uint64_t __113__ACHEarnedInstanceEntity__insertEarnedInstances_provenance_useLegacySyncIdentity_profile_databaseContext_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        id v12 = [ACHEarnedInstanceJournalEntry alloc];
        BOOL v13 = -[ACHEarnedInstanceJournalEntry initWithEarnedInstance:provenance:useLegacySyncIdentity:action:](v12, "initWithEarnedInstance:provenance:useLegacySyncIdentity:action:", v11, *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), 0, (void)v17);
        [v5 addObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v14 = [*(id *)(a1 + 40) database];
  uint64_t v15 = [v14 addJournalEntries:v5 error:a3];

  return v15;
}

+ (id)_insertEarnedInstance:(id)a3 provenance:(int64_t)a4 syncIdentity:(int64_t)a5 database:(id)a6 error:(id *)a7
{
  id v12 = a3;
  uint64_t v13 = _insertEarnedInstance_provenance_syncIdentity_database_error__onceToken;
  id v14 = a6;
  if (v13 != -1) {
    dispatch_once(&_insertEarnedInstance_provenance_syncIdentity_database_error__onceToken, &__block_literal_global_360);
  }
  uint64_t v15 = _insertEarnedInstance_provenance_syncIdentity_database_error__earnedInstanceProperties;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __88__ACHEarnedInstanceEntity__insertEarnedInstance_provenance_syncIdentity_database_error___block_invoke_2;
  v19[3] = &unk_264516440;
  id v20 = v12;
  int64_t v21 = a4;
  int64_t v22 = a5;
  id v16 = v12;
  long long v17 = [a1 insertOrReplaceEntity:1 database:v14 properties:v15 error:a7 bindingHandler:v19];

  return v17;
}

uint64_t __88__ACHEarnedInstanceEntity__insertEarnedInstance_provenance_syncIdentity_database_error___block_invoke()
{
  _insertEarnedInstance_provenance_syncIdentity_database_error__earnedInstanceProperties = ACHEarnedInstanceAllKeys();
  return MEMORY[0x270F9A758]();
}

void __88__ACHEarnedInstanceEntity__insertEarnedInstance_provenance_syncIdentity_database_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) templateUniqueName];
  MEMORY[0x223C4FE30](a2, @"template_unique_name", v4);

  id v5 = [*(id *)(a1 + 32) createdDate];
  MEMORY[0x223C4FDE0](a2, @"created_date", v5);

  id v6 = [*(id *)(a1 + 32) earnedDateComponents];
  uint64_t v7 = ACHYearMonthDayStringFromDateComponents();
  MEMORY[0x223C4FE30](a2, @"earned_date", v7);

  MEMORY[0x223C4FE10](a2, @"creator_device", [*(id *)(a1 + 32) creatorDevice]);
  MEMORY[0x223C4FE10](a2, @"sync_provenance", *(void *)(a1 + 40));
  MEMORY[0x223C4FE10](a2, @"sync_identity", *(void *)(a1 + 48));
  uint64_t v8 = [*(id *)(a1 + 32) value];

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 32) value];
    uint64_t v10 = ACHCanonicalEarnedInstanceUnitForQuantity();

    uint64_t v11 = [*(id *)(a1 + 32) value];
    [v11 doubleValueForUnit:v10];
    double v13 = v12;

    MEMORY[0x223C4FDF0](a2, @"value_in_canonical_unit", v13);
    id v14 = [v10 unitString];
    MEMORY[0x223C4FE30](a2, @"value_canonical_unit", v14);
  }
  else
  {
    MEMORY[0x223C4FE20](a2, @"value_in_canonical_unit");
    MEMORY[0x223C4FE20](a2, @"value_canonical_unit");
  }
  id v15 = [*(id *)(a1 + 32) externalIdentifier];
  MEMORY[0x223C4FE30](a2, @"external_identifier", v15);
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return [a3 syncStoreType] == 1;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  id v2 = objc_alloc(MEMORY[0x263F433C8]);
  id v3 = (void *)[v2 initWithEntityIdentifier:*MEMORY[0x263F234E8] schemaIdentifier:*MEMORY[0x263F23448]];
  return (HDSyncEntityIdentifier *)v3;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F23678];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithData:v4];

  return v5;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (id)propertyForSyncProvenance
{
  return @"sync_provenance";
}

+ (id)propertyForSyncIdentity
{
  return @"sync_identity";
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v11 = [a5 database];
  int64_t v12 = [a1 nextSyncAnchorWithStartAnchor:a4 predicate:0 session:v10 healthDatabase:v11 error:a6];

  double v13 = ACHLogSync();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    +[ACHEarnedInstanceEntity nextSyncAnchorWithSession:startSyncAnchor:profile:error:]();
  }

  return v12;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a5;
  id v35 = a6;
  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  uint64_t v66 = -1;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  uint64_t v62 = 0;
  uint64_t v16 = [v13 maxEncodedBytesPerCodableChangeForSyncEntityClass:a1];
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  uint64_t v58 = 0;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  long long v17 = ACHLogSync();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v68 = v13;
    __int16 v69 = 2048;
    int64_t v70 = var0;
    __int16 v71 = 2048;
    int64_t v72 = var1;
    _os_log_debug_impl(&dword_21F5DA000, v17, OS_LOG_TYPE_DEBUG, "Earned Instance Entity generating sync objects for session (%@), Anchor Range Start (%lld), Anchor Range End (%lld)", buf, 0x20u);
  }

  long long v18 = [v14 database];
  uint64_t v36 = MEMORY[0x263EF8330];
  uint64_t v37 = 3221225472;
  BOOL v38 = __102__ACHEarnedInstanceEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v39 = &unk_264516490;
  id v47 = a1;
  id v19 = v14;
  id v40 = v19;
  id v20 = v13;
  int64_t v48 = var0;
  int64_t v49 = var1;
  id v41 = v20;
  v43 = &v63;
  v44 = &v51;
  v45 = &v55;
  uint64_t v50 = v16;
  id v21 = v15;
  id v42 = v21;
  v46 = &v59;
  int v22 = [a1 performReadTransactionWithHealthDatabase:v18 error:a7 block:&v36];

  if (v22)
  {
    uint64_t v23 = ACHLogSync();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
      *(_DWORD *)buf = 138543362;
      id v68 = v24;
      _os_log_impl(&dword_21F5DA000, v23, OS_LOG_TYPE_DEFAULT, "Earned Instance sync generated (%{public}@} objects for sync.", buf, 0xCu);
    }
    if (v52[3] > 999 || v56[3] >= v16)
    {
      uint64_t v25 = v60[3];
      v64[3] = v25;
    }
    else
    {
      uint64_t v25 = v64[3];
    }
    char v33 = objc_msgSend(v35, "sendCodableChange:resultAnchor:sequence:done:error:", v21, v25, 0, 1, a7, v35, v36, v37, v38, v39, v40, v41);
  }
  else
  {
    long long v26 = ACHLogSync();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      +[ACHEarnedInstanceEntity generateSyncObjectsForSession:syncAnchorRange:profile:messageHandler:error:]((uint64_t)a7, v26, v27, v28, v29, v30, v31, v32);
    }

    char v33 = 0;
  }

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);

  return v33;
}

uint64_t __102__ACHEarnedInstanceEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v5 = [*(id *)(a1 + 88) entityEncoderForProfile:*(void *)(a1 + 32) transaction:v4 purpose:0 encodingOptions:0 authorizationFilter:0];
  id v6 = *(void **)(a1 + 88);
  uint64_t v7 = [v5 orderedProperties];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8) + 24;
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) database];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __102__ACHEarnedInstanceEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v21[3] = &unk_264516468;
  uint64_t v26 = *(void *)(a1 + 64);
  id v22 = v5;
  id v23 = *(id *)(a1 + 32);
  id v24 = v4;
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v27 = *(void *)(a1 + 72);
  uint64_t v29 = v11;
  id v12 = *(id *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 80);
  id v25 = v12;
  uint64_t v28 = v13;
  uint64_t v15 = *(void *)(a1 + 96);
  uint64_t v14 = *(void *)(a1 + 104);
  id v16 = v4;
  id v17 = v5;
  uint64_t v18 = objc_msgSend(v6, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v7, 0, v9, v15, v14, 0, v8, v10, a3, v21);

  return v18;
}

BOOL __102__ACHEarnedInstanceEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7, uint64_t a8)
{
  id v13 = a2;
  uint64_t v14 = v13;
  if (*(uint64_t *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) < 1000)
  {
    id v16 = objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", objc_msgSend(v13, "persistentID"), a4, a8);
    uint64_t v17 = HDSQLiteColumnWithNameAsInt64();
    uint64_t v18 = [*(id *)(a1 + 40) syncIdentityManager];
    id v19 = [v18 identityForEntityID:v17 transaction:*(void *)(a1 + 48) error:a8];

    if (v19)
    {
      uint64_t v33 = a5;
      id v20 = objc_alloc_init(MEMORY[0x263F23690]);
      id v21 = [v19 identity];
      id v22 = [v21 hardwareIdentifier];
      id v23 = objc_msgSend(v22, "hk_dataForUUIDBytes");
      [v20 setHardwareIdentifier:v23];

      id v24 = [v19 identity];
      id v25 = [v24 databaseIdentifier];
      uint64_t v26 = objc_msgSend(v25, "hk_dataForUUIDBytes");
      [v20 setDatabaseIdentifier:v26];

      uint64_t v27 = [v19 identity];
      uint64_t v28 = [v27 instanceDiscriminator];
      [v20 setInstanceDiscriminator:v28];

      [v16 setSyncIdentity:v20];
      BOOL v15 = v16 != 0;
      if (v16)
      {
        uint64_t v29 = [v16 encodedByteCount];
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += v29;
        uint64_t v30 = ACHLogSync();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          __102__ACHEarnedInstanceEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2_cold_1(a1 + 72, v29, v30);
        }

        if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) >= *(void *)(a1 + 88))
        {
          *a7 = 1;
        }
        else
        {
          [*(id *)(a1 + 56) addObject:v16];
          *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v33;
          ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        }
      }
      else
      {
        uint64_t v31 = ACHLogSync();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          __102__ACHEarnedInstanceEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2_cold_2();
        }
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 1;
    *a7 = 1;
  }

  return v15;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = ACHLogSync();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    *(_DWORD *)buf = 138543362;
    id v42 = v13;
    _os_log_impl(&dword_21F5DA000, v12, OS_LOG_TYPE_DEFAULT, "Earned Instance Entity received sync objects, count: %{public}@", buf, 0xCu);
  }
  if ([v9 count])
  {
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v15 = v9;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v37;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v37 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = (void *)[objc_alloc(MEMORY[0x263F236B8]) initWithCodable:*(void *)(*((void *)&v36 + 1) + 8 * v19)];
          if (v20) {
            [v14 addObject:v20];
          }

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v17);
    }

    uint64_t v21 = [v14 count];
    id v22 = ACHLogSync();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v21)
    {
      if (v23)
      {
        id v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject count](v14, "count"));
        *(_DWORD *)buf = 138543362;
        id v42 = v24;
        _os_log_impl(&dword_21F5DA000, v22, OS_LOG_TYPE_DEFAULT, "Decoded %{public}@ earned instances from sync.", buf, 0xCu);
      }
      os_unfair_lock_lock((os_unfair_lock_t)&syncObserverLock);
      id WeakRetained = objc_loadWeakRetained(&_syncObserver);

      uint64_t v26 = ACHLogSync();
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      if (WeakRetained)
      {
        if (v27)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F5DA000, v26, OS_LOG_TYPE_DEFAULT, "Earned Instance Entity received sync objects and sync observer is set, passing to sync observer", buf, 2u);
        }

        id v28 = objc_loadWeakRetained(&_syncObserver);
        char v29 = objc_msgSend(v28, "earnedInstanceEntityDidReceiveSyncedEarnedInstances:provenance:", v14, objc_msgSend(v10, "syncProvenance"));

        if (v29) {
          goto LABEL_35;
        }
        uint64_t v30 = ACHLogSync();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          +[ACHEarnedInstanceEntity receiveSyncObjects:version:syncStore:profile:error:](v30);
        }
      }
      else
      {
        if (v27)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F5DA000, v26, OS_LOG_TYPE_DEFAULT, "Earned Instance Entity received sync objects, but no sync observer is registered yet. Writing directly to database.", buf, 2u);
        }

        uint64_t v31 = [MEMORY[0x263EFFA08] setWithArray:v14];
        id v35 = 0;
        id v32 = (id)objc_msgSend((id)objc_opt_class(), "insertEarnedInstances:provenance:useLegacySyncIdentity:profile:databaseContext:error:", v31, objc_msgSend(v10, "syncProvenance"), 1, v11, 0, &v35);
        uint64_t v30 = v35;
        if (v30)
        {
          uint64_t v33 = ACHLogSync();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            +[ACHEarnedInstanceEntity receiveSyncObjects:version:syncStore:profile:error:]();
          }
        }
      }

LABEL_35:
      os_unfair_lock_unlock((os_unfair_lock_t)&syncObserverLock);
      goto LABEL_36;
    }
    if (v23)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v22, OS_LOG_TYPE_DEFAULT, "Received zero decodable earned instances from sync, nothing to do.", buf, 2u);
    }
  }
  else
  {
    uint64_t v14 = ACHLogSync();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v14, OS_LOG_TYPE_DEFAULT, "Received zero earned instance sync objects, nothing to do.", buf, 2u);
    }
  }
LABEL_36:

  return 0;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  if (a3 > 7)
  {
    unint64_t v4 = 3;
  }
  else
  {
    id v3 = ACHLogSync();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v3, OS_LOG_TYPE_DEFAULT, "Earned Instnace got sync protocol version less than supported, returing direction: None", buf, 2u);
    }

    unint64_t v4 = 0;
  }
  id v5 = ACHLogSync();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Earned Instance got supported sync protocol version, returing direction: Both", v7, 2u);
  }

  return v4;
}

+ (id)codableEarnedInstanceForEarnedInstanceInDatabase:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__2;
  id v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  id v10 = ACHEarnedInstancePredicateForKey(v8);
  id v11 = [v9 database];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __90__ACHEarnedInstanceEntity_codableEarnedInstanceForEarnedInstanceInDatabase_profile_error___block_invoke;
  v16[3] = &unk_2645164E0;
  id v20 = a1;
  id v12 = v9;
  id v17 = v12;
  id v13 = v10;
  id v18 = v13;
  uint64_t v19 = &v21;
  [a1 performReadTransactionWithHealthDatabase:v11 error:a5 block:v16];

  id v14 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v14;
}

uint64_t __90__ACHEarnedInstanceEntity_codableEarnedInstanceForEarnedInstanceInDatabase_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 56) entityEncoderForProfile:*(void *)(a1 + 32) transaction:a2 purpose:1 encodingOptions:0 authorizationFilter:0];
  id v6 = *(void **)(a1 + 56);
  uint64_t v7 = [v5 orderedProperties];
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [*(id *)(a1 + 32) database];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __90__ACHEarnedInstanceEntity_codableEarnedInstanceForEarnedInstanceInDatabase_profile_error___block_invoke_2;
  v14[3] = &unk_2645164B8;
  uint64_t v10 = *(void *)(a1 + 48);
  id v15 = v5;
  uint64_t v16 = v10;
  id v11 = v5;
  uint64_t v12 = [v6 enumerateProperties:v7 withPredicate:v8 healthDatabase:v9 error:a3 enumerationHandler:v14];

  return v12;
}

BOOL __90__ACHEarnedInstanceEntity_codableEarnedInstanceForEarnedInstanceInDatabase_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v12 = 0;
  uint64_t v8 = [v7 codableRepresentationForPersistentID:a2 row:a4 error:&v12];
  id v9 = v12;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);
  }
  else
  {
    uint64_t v10 = ACHLogDatabase();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __90__ACHEarnedInstanceEntity_codableEarnedInstanceForEarnedInstanceInDatabase_profile_error___block_invoke_2_cold_1();
    }

    if (*a5) {
      *a5 = v9;
    }
  }

  return v8 != 0;
}

void __99__ACHEarnedInstanceEntity__earnedInstancesWithPredicate_limit_ascendingByEarnedDate_profile_error___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v0, v1, "Error fetching sync identity for earned instance: %{public}@, %{public}@");
}

void __99__ACHEarnedInstanceEntity__earnedInstancesWithPredicate_limit_ascendingByEarnedDate_profile_error___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error instantiating earned instance during database retrieval: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_insertEarnedInstances:provenance:useLegacySyncIdentity:profile:databaseContext:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v0, v1, "Error inserting earned instances %{public}@: %{public}@");
}

+ (void)nextSyncAnchorWithSession:startSyncAnchor:profile:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_21F5DA000, v0, OS_LOG_TYPE_DEBUG, "Earned Instance Entity returning next sync anchor: %lld", v1, 0xCu);
}

+ (void)generateSyncObjectsForSession:(uint64_t)a3 syncAnchorRange:(uint64_t)a4 profile:(uint64_t)a5 messageHandler:(uint64_t)a6 error:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __102__ACHEarnedInstanceEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)(*(void *)a1 + 8) + 24);
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_21F5DA000, log, OS_LOG_TYPE_DEBUG, "codeable encodedByteCount (%lld), accumulated bytes (%lld)", (uint8_t *)&v4, 0x16u);
}

void __102__ACHEarnedInstanceEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v0, v1, "Error creating codable representation of Earned Instance (%@): %@");
}

+ (void)receiveSyncObjects:version:syncStore:profile:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error directly applying earned instance sync objects to database (doesn't fail sync though): %{public}@", v2, v3, v4, v5, v6);
}

+ (void)receiveSyncObjects:(os_log_t)log version:syncStore:profile:error:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21F5DA000, log, OS_LOG_TYPE_ERROR, "Earned instance entity sync received failed (doesn't fail sync though)", v1, 2u);
}

void __90__ACHEarnedInstanceEntity_codableEarnedInstanceForEarnedInstanceInDatabase_profile_error___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error instantiating codable during database retrieval: %{public}@", v2, v3, v4, v5, v6);
}

@end