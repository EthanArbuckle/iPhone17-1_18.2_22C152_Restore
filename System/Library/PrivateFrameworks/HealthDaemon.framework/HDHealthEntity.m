@interface HDHealthEntity
+ (BOOL)deleteEntitiesWithPredicate:(id)a3 healthDatabase:(id)a4 error:(id *)a5;
+ (BOOL)enumerateEntitiesForSyncWithProperties:(id)a3 predicate:(id)a4 healthDatabase:(id)a5 error:(id *)a6 block:(id)a7;
+ (BOOL)enumerateEntitiesForSyncWithProperties:(id)a3 predicate:(id)a4 session:(id)a5 syncAnchorRange:(HDSyncAnchorRange)a6 limit:(unint64_t)a7 lastSyncAnchor:(int64_t *)a8 healthDatabase:(id)a9 error:(id *)a10 block:(id)a11;
+ (BOOL)enumerateEntitiesForSyncWithProperties:(id)a3 predicate:(id)a4 syncEntityClass:(Class)a5 session:(id)a6 syncAnchorRange:(HDSyncAnchorRange)a7 orderingTerms:(id)a8 limit:(unint64_t)a9 lastSyncAnchor:(int64_t *)a10 distinct:(BOOL)a11 healthDatabase:(id)a12 error:(id *)a13 block:(id)a14;
+ (BOOL)enumerateEntitiesForSyncWithProperties:(id)a3 predicate:(id)a4 syncEntityClass:(Class)a5 session:(id)a6 syncAnchorRange:(HDSyncAnchorRange)a7 orderingTerms:(id)a8 limit:(unint64_t)a9 lastSyncAnchor:(int64_t *)a10 healthDatabase:(id)a11 error:(id *)a12 block:(id)a13;
+ (BOOL)enumerateProperties:(id)a3 withPredicate:(id)a4 healthDatabase:(id)a5 error:(id *)a6 enumerationHandler:(id)a7;
+ (BOOL)enumerateProperties:(id)a3 withPredicate:(id)a4 orderingTerms:(id)a5 groupBy:(id)a6 limit:(unint64_t)a7 healthDatabase:(id)a8 error:(id *)a9 enumerationHandler:(id)a10;
+ (BOOL)performPostFirstJournalMergeCleanupWithTransaction:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)performReadTransactionWithHealthDatabase:(id)a3 context:(id)a4 error:(id *)a5 block:(id)a6;
+ (BOOL)performReadTransactionWithHealthDatabase:(id)a3 error:(id *)a4 block:(id)a5;
+ (BOOL)performWriteTransactionWithHealthDatabase:(id)a3 context:(id)a4 error:(id *)a5 block:(id)a6;
+ (BOOL)performWriteTransactionWithHealthDatabase:(id)a3 context:(id)a4 error:(id *)a5 block:(id)a6 inaccessibilityHandler:(id)a7;
+ (BOOL)performWriteTransactionWithHealthDatabase:(id)a3 error:(id *)a4 block:(id)a5;
+ (BOOL)performWriteTransactionWithHealthDatabase:(id)a3 error:(id *)a4 block:(id)a5 inaccessibilityHandler:(id)a6;
+ (BOOL)updateProperties:(id)a3 predicate:(id)a4 healthDatabase:(id)a5 error:(id *)a6 bindingHandler:(id)a7;
+ (BOOL)validateEntityWithProfile:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5;
+ (const)columnDefinitionsWithBehavior:(id)a3 count:(unint64_t *)a4;
+ (id)_syncQueryDescriptorWithPredicate:(void *)a3 orderingTerms:(uint64_t)a4 limit:(void *)a5 anchorProperty:(uint64_t)a6 distinct:;
+ (id)_syncQueryWithDatabase:(void *)a3 predicate:(void *)a4 orderingTerms:(uint64_t)a5 limit:(void *)a6 anchorProperty:(uint64_t)a7 distinct:;
+ (id)anyWithPredicate:(id)a3 healthDatabase:(id)a4 error:(id *)a5;
+ (id)columnNamesForTimeOffset;
+ (id)countDistinctForProperty:(id)a3 healthDatabase:(id)a4 error:(id *)a5;
+ (id)createTableSQLWithBehavior:(id)a3;
+ (id)createValidationError:(id)a3 rowId:(id)a4;
+ (id)defaultForeignKey;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)indicesWithBehavior:(id)a3;
+ (id)insertOrReplaceEntity:(BOOL)a3 healthDatabase:(id)a4 properties:(id)a5 error:(id *)a6 bindingHandler:(id)a7;
+ (id)maxRowIDForPredicate:(id)a3 healthDatabase:(id)a4 error:(id *)a5;
+ (id)predicateForSyncWithPredicate:(id)a3 syncEntityClass:(Class)a4 session:(id)a5 syncAnchorRange:(HDSyncAnchorRange)a6;
+ (id)propertyForSyncAnchor;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (id)propertyValueForAnyWithProperty:(id)a3 predicate:(id)a4 healthDatabase:(id)a5 error:(id *)a6;
+ (id)transactionContextForWriting:(BOOL)a3 baseContext:(id)a4;
+ (id)triggersWithBehavior:(id)a3;
+ (id)updateSQLForTimeOffsetWithBindingCount:(unint64_t *)a3;
+ (int64_t)countOfObjectsWithPredicate:(id)a3 healthDatabase:(id)a4 error:(id *)a5;
+ (int64_t)nextSyncAnchorWithStartAnchor:(int64_t)a3 predicate:(id)a4 session:(id)a5 healthDatabase:(id)a6 error:(id *)a7;
+ (int64_t)nextSyncAnchorWithStartAnchor:(int64_t)a3 predicate:(id)a4 syncEntityClass:(Class)a5 session:(id)a6 orderingTerms:(id)a7 limit:(unint64_t)a8 healthDatabase:(id)a9 error:(id *)a10;
+ (int64_t)protectionClass;
+ (int64_t)sizeOfDatabaseTableInHealthDatabase:(id)a3 error:(id *)a4;
- (BOOL)getValuesForProperties:(id)a3 healthDatabase:(id)a4 error:(id *)a5 handler:(id)a6;
- (BOOL)setDate:(id)a3 forProperty:(id)a4 transaction:(id)a5 error:(id *)a6;
- (BOOL)setForeignKeyEntity:(id)a3 forProperty:(id)a4 transaction:(id)a5 error:(id *)a6;
- (BOOL)setNumber:(id)a3 forProperty:(id)a4 transaction:(id)a5 error:(id *)a6;
- (BOOL)setString:(id)a3 forProperty:(id)a4 transaction:(id)a5 error:(id *)a6;
- (BOOL)updateProperties:(id)a3 healthDatabase:(id)a4 error:(id *)a5 bindingHandler:(id)a6;
- (BOOL)willDeleteWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (id)dateForProperty:(id)a3 transaction:(id)a4 error:(id *)a5;
- (id)foreignKeyEntity:(Class)a3 forProperty:(id)a4 transaction:(id)a5 error:(id *)a6;
- (id)numberForProperty:(id)a3 transaction:(id)a4 error:(id *)a5;
- (id)stringForProperty:(id)a3 healthDatabase:(id)a4 error:(id *)a5;
- (id)stringForProperty:(id)a3 transaction:(id)a4 error:(id *)a5;
- (id)valueForProperty:(id)a3 healthDatabase:(id)a4 error:(id *)a5;
@end

@implementation HDHealthEntity

+ (id)maxRowIDForPredicate:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__119;
  v20 = __Block_byref_object_dispose__119;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__HDHealthEntity_Conveniences__maxRowIDForPredicate_healthDatabase_error___block_invoke;
  v12[3] = &unk_1E63039B8;
  v14 = &v16;
  id v15 = a1;
  id v13 = v8;
  id v9 = v8;
  [a1 performReadTransactionWithHealthDatabase:a4 error:a5 block:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v10;
}

+ (id)insertOrReplaceEntity:(BOOL)a3 healthDatabase:(id)a4 properties:(id)a5 error:(id *)a6 bindingHandler:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__119;
  v28 = __Block_byref_object_dispose__119;
  id v29 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __87__HDHealthEntity_insertOrReplaceEntity_healthDatabase_properties_error_bindingHandler___block_invoke;
  v18[3] = &unk_1E6303918;
  id v21 = &v24;
  id v22 = a1;
  BOOL v23 = a3;
  id v19 = v12;
  id v20 = v13;
  id v14 = v13;
  id v15 = v12;
  [a1 performWriteTransactionWithHealthDatabase:a4 error:a6 block:v18];
  id v16 = (id)v25[5];

  _Block_object_dispose(&v24, 8);

  return v16;
}

BOOL __87__HDHealthEntity_insertOrReplaceEntity_healthDatabase_properties_error_bindingHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [v5 databaseForEntityClass:*(void *)(a1 + 56)];
  uint64_t v7 = [*(id *)(a1 + 56) insertOrReplaceEntity:*(unsigned __int8 *)(a1 + 64) database:v6 properties:*(void *)(a1 + 32) error:a3 bindingHandler:*(void *)(a1 + 40)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  BOOL v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
  return v10;
}

+ (BOOL)enumerateProperties:(id)a3 withPredicate:(id)a4 healthDatabase:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (![v13 count])
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"HDHealthEntity.mm", 333, @"Invalid parameter not satisfying: %@", @"[properties count] > 0" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
LABEL_5:
    BOOL v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"HDHealthEntity.mm", 334, @"Invalid parameter not satisfying: %@", @"enumerationHandler != NULL" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v16) {
    goto LABEL_5;
  }
LABEL_3:
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __106__HDHealthEntity_Conveniences__enumerateProperties_withPredicate_healthDatabase_error_enumerationHandler___block_invoke;
  v24[3] = &unk_1E6303968;
  id v28 = a1;
  id v17 = v14;
  id v25 = v17;
  id v18 = v13;
  id v26 = v18;
  id v19 = v16;
  id v27 = v19;
  char v20 = [a1 performReadTransactionWithHealthDatabase:v15 error:a6 block:v24];

  return v20;
}

uint64_t __106__HDHealthEntity_Conveniences__enumerateProperties_withPredicate_healthDatabase_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 56)];
  v6 = [*(id *)(a1 + 56) queryWithDatabase:v5 predicate:*(void *)(a1 + 32)];
  uint64_t v7 = [v6 enumeratePersistentIDsAndProperties:*(void *)(a1 + 40) error:a3 enumerationHandler:*(void *)(a1 + 48)];

  return v7;
}

uint64_t __74__HDHealthEntity_Conveniences__maxRowIDForPredicate_healthDatabase_error___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = [v5 databaseForEntityClass:a1[6]];
  uint64_t v7 = (void *)a1[6];
  uint64_t v8 = *MEMORY[0x1E4F65C70];
  uint64_t v9 = a1[4];
  id v17 = 0;
  uint64_t v10 = [v7 maxValueForProperty:v8 predicate:v9 database:v6 error:&v17];
  id v11 = v17;
  uint64_t v12 = *(void *)(a1[5] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v10;

  uint64_t v14 = *(void *)(a1[5] + 8);
  if (*(void *)(v14 + 40)) {
    goto LABEL_2;
  }
  if (!v11)
  {
    *(void *)(v14 + 40) = &unk_1F17EE9E8;
LABEL_2:
    uint64_t v15 = 1;
    goto LABEL_3;
  }
  uint64_t v15 = 0;
  if (a3) {
    *a3 = v11;
  }
LABEL_3:

  return v15;
}

+ (BOOL)updateProperties:(id)a3 predicate:(id)a4 healthDatabase:(id)a5 error:(id *)a6 bindingHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = objc_opt_class();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __81__HDHealthEntity_updateProperties_predicate_healthDatabase_error_bindingHandler___block_invoke;
  v21[3] = &unk_1E6303968;
  id v25 = a1;
  id v17 = v12;
  id v22 = v17;
  id v18 = v13;
  id v23 = v18;
  id v19 = v15;
  id v24 = v19;
  LOBYTE(a6) = [v16 performWriteTransactionWithHealthDatabase:v14 error:a6 block:v21];

  return (char)a6;
}

uint64_t __81__HDHealthEntity_updateProperties_predicate_healthDatabase_error_bindingHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 56)];
  uint64_t v6 = [*(id *)(a1 + 56) updateProperties:*(void *)(a1 + 32) predicate:*(void *)(a1 + 40) database:v5 error:a3 bindingHandler:*(void *)(a1 + 48)];

  return v6;
}

+ (int64_t)nextSyncAnchorWithStartAnchor:(int64_t)a3 predicate:(id)a4 session:(id)a5 healthDatabase:(id)a6 error:(id *)a7
{
  return [a1 nextSyncAnchorWithStartAnchor:a3 predicate:a4 syncEntityClass:0 session:a5 orderingTerms:0 limit:0 healthDatabase:a6 error:a7];
}

+ (BOOL)enumerateEntitiesForSyncWithProperties:(id)a3 predicate:(id)a4 session:(id)a5 syncAnchorRange:(HDSyncAnchorRange)a6 limit:(unint64_t)a7 lastSyncAnchor:(int64_t *)a8 healthDatabase:(id)a9 error:(id *)a10 block:(id)a11
{
  return objc_msgSend(a1, "enumerateEntitiesForSyncWithProperties:predicate:syncEntityClass:session:syncAnchorRange:orderingTerms:limit:lastSyncAnchor:healthDatabase:error:block:", a3, a4, 0, a5, a6.start, a6.end, 0, a7, a8, a9, a10, a11);
}

- (BOOL)getValuesForProperties:(id)a3 healthDatabase:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = objc_opt_class();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__HDHealthEntity_Conveniences__getValuesForProperties_healthDatabase_error_handler___block_invoke;
  v17[3] = &unk_1E6303940;
  v17[4] = self;
  id v14 = v10;
  id v18 = v14;
  id v15 = v12;
  id v19 = v15;
  LOBYTE(a5) = [v13 performReadTransactionWithHealthDatabase:v11 error:a5 block:v17];

  return (char)a5;
}

uint64_t __84__HDHealthEntity_Conveniences__getValuesForProperties_healthDatabase_error_handler___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 databaseForEntity:*(void *)(a1 + 32)];
  uint64_t v4 = [*(id *)(a1 + 32) getValuesForProperties:*(void *)(a1 + 40) database:v3 handler:*(void *)(a1 + 48)];

  return v4;
}

+ (int64_t)countOfObjectsWithPredicate:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__HDHealthEntity_Conveniences__countOfObjectsWithPredicate_healthDatabase_error___block_invoke;
  v12[3] = &unk_1E6303990;
  id v14 = &v16;
  id v15 = a1;
  id v13 = v8;
  id v9 = v8;
  [a1 performReadTransactionWithHealthDatabase:a4 error:a5 block:v12];
  int64_t v10 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v10;
}

BOOL __81__HDHealthEntity_Conveniences__countOfObjectsWithPredicate_healthDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 databaseForEntityClass:*(void *)(a1 + 48)];
  uint64_t v7 = [*(id *)(a1 + 48) countValueForProperty:*MEMORY[0x1E4F65C78] predicate:*(void *)(a1 + 32) database:v6 error:a3];
  id v8 = v7;
  if (v7) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 longValue];
  }

  return v8 != 0;
}

+ (id)anyWithPredicate:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__119;
  char v20 = __Block_byref_object_dispose__119;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__HDHealthEntity_Conveniences__anyWithPredicate_healthDatabase_error___block_invoke;
  v12[3] = &unk_1E63039B8;
  id v14 = &v16;
  id v15 = a1;
  id v13 = v8;
  id v9 = v8;
  [a1 performReadTransactionWithHealthDatabase:a4 error:a5 block:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v10;
}

uint64_t __70__HDHealthEntity_Conveniences__anyWithPredicate_healthDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 databaseForEntityClass:*(void *)(a1 + 48)];
  uint64_t v7 = [*(id *)(a1 + 48) anyInDatabase:v6 predicate:*(void *)(a1 + 32) error:a3];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return 1;
}

- (id)valueForProperty:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  char v20 = __Block_byref_object_copy__119;
  id v21 = __Block_byref_object_dispose__119;
  id v22 = 0;
  id v10 = objc_opt_class();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__HDHealthEntity_Conveniences__valueForProperty_healthDatabase_error___block_invoke;
  v14[3] = &unk_1E62FCCF8;
  v14[4] = self;
  uint64_t v16 = &v17;
  id v11 = v8;
  id v15 = v11;
  [v10 performReadTransactionWithHealthDatabase:v9 error:a5 block:v14];
  id v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v12;
}

uint64_t __70__HDHealthEntity_Conveniences__valueForProperty_healthDatabase_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 databaseForEntity:*(void *)(a1 + 32)];
  uint64_t v5 = [*(id *)(a1 + 32) valueForProperty:*(void *)(a1 + 40) database:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return 1;
}

+ (BOOL)enumerateEntitiesForSyncWithProperties:(id)a3 predicate:(id)a4 syncEntityClass:(Class)a5 session:(id)a6 syncAnchorRange:(HDSyncAnchorRange)a7 orderingTerms:(id)a8 limit:(unint64_t)a9 lastSyncAnchor:(int64_t *)a10 healthDatabase:(id)a11 error:(id *)a12 block:(id)a13
{
  LOBYTE(v14) = 1;
  return objc_msgSend(a1, "enumerateEntitiesForSyncWithProperties:predicate:syncEntityClass:session:syncAnchorRange:orderingTerms:limit:lastSyncAnchor:distinct:healthDatabase:error:block:", a3, a4, a5, a6, a7.start, a7.end, a8, a9, a10, v14, a11, a12, a13);
}

+ (BOOL)enumerateEntitiesForSyncWithProperties:(id)a3 predicate:(id)a4 syncEntityClass:(Class)a5 session:(id)a6 syncAnchorRange:(HDSyncAnchorRange)a7 orderingTerms:(id)a8 limit:(unint64_t)a9 lastSyncAnchor:(int64_t *)a10 distinct:(BOOL)a11 healthDatabase:(id)a12 error:(id *)a13 block:(id)a14
{
  int64_t end = a7.end;
  int64_t start = a7.start;
  id v18 = a3;
  id v19 = a4;
  id v20 = a6;
  id v37 = a8;
  id v21 = a12;
  id v22 = a14;
  id v23 = [a1 propertyForSyncAnchor];
  if (!v23)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, a1, @"HDHealthEntity+Sync.m", 90, @"Invalid parameter not satisfying: %@", @"anchorProperty != nil" object file lineNumber description];
  }
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __184__HDHealthEntity_Sync__enumerateEntitiesForSyncWithProperties_predicate_syncEntityClass_session_syncAnchorRange_orderingTerms_limit_lastSyncAnchor_distinct_healthDatabase_error_block___block_invoke;
  v40[3] = &unk_1E62FEF18;
  id v24 = v18;
  id v41 = v24;
  id v25 = v23;
  id v42 = v25;
  id v48 = a1;
  id v26 = v19;
  id v43 = v26;
  Class v49 = a5;
  id v27 = v20;
  id v44 = v27;
  int64_t v28 = start;
  int64_t v50 = start;
  int64_t v51 = end;
  id v29 = v37;
  unint64_t v52 = a9;
  BOOL v53 = a11;
  id v45 = v29;
  v47 = &v54;
  id v30 = v22;
  id v46 = v30;
  char v31 = [a1 performReadTransactionWithHealthDatabase:v21 error:a13 block:v40];
  char v32 = v31 ^ 1;
  if (!a10) {
    char v32 = 1;
  }
  if ((v32 & 1) == 0)
  {
    int64_t v33 = v55[3];
    if (!v33) {
      int64_t v33 = v28;
    }
    *a10 = v33;
  }

  _Block_object_dispose(&v54, 8);
  return v31;
}

uint64_t __184__HDHealthEntity_Sync__enumerateEntitiesForSyncWithProperties_predicate_syncEntityClass_session_syncAnchorRange_orderingTerms_limit_lastSyncAnchor_distinct_healthDatabase_error_block___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = *(id *)(a1 + 32);
  char v7 = [*(id *)(a1 + 40) isEqualToString:*MEMORY[0x1E4F65C70]];
  if (v7)
  {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    if (!v6 || (uint64_t v9 = [v6 indexOfObject:*(void *)(a1 + 40)], v9 == 0x7FFFFFFFFFFFFFFFLL))
    {
      id v10 = *(void **)(a1 + 32);
      if (v10)
      {
        uint64_t v11 = [v10 arrayByAddingObject:*(void *)(a1 + 40)];
      }
      else
      {
        v28[0] = *(void *)(a1 + 40);
        uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
      }
      id v6 = (id)v11;
      uint64_t v9 = [*(id *)(a1 + 32) count];
    }
    uint64_t v8 = v9;
  }
  id v12 = objc_msgSend(*(id *)(a1 + 88), "predicateForSyncWithPredicate:syncEntityClass:session:syncAnchorRange:", *(void *)(a1 + 48), *(void *)(a1 + 96), *(void *)(a1 + 56), *(void *)(a1 + 104), *(void *)(a1 + 112));
  uint64_t v13 = *(void *)(a1 + 88);
  uint64_t v14 = [v5 databaseForEntityClass:v13];
  id v15 = +[HDHealthEntity _syncQueryWithDatabase:predicate:orderingTerms:limit:anchorProperty:distinct:](v13, v14, v12, *(void **)(a1 + 64), *(void *)(a1 + 120), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 128));

  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __184__HDHealthEntity_Sync__enumerateEntitiesForSyncWithProperties_predicate_syncEntityClass_session_syncAnchorRange_orderingTerms_limit_lastSyncAnchor_distinct_healthDatabase_error_block___block_invoke_2;
  v21[3] = &unk_1E62FEEF0;
  uint64_t v16 = *(void *)(a1 + 88);
  char v26 = v7;
  uint64_t v24 = v16;
  uint64_t v25 = v8;
  long long v20 = *(_OWORD *)(a1 + 72);
  id v17 = (id)v20;
  long long v22 = v20;
  id v23 = v27;
  uint64_t v18 = [v15 enumeratePersistentIDsAndProperties:v6 error:a3 enumerationHandler:v21];

  _Block_object_dispose(v27, 8);
  return v18;
}

+ (id)_syncQueryWithDatabase:(void *)a3 predicate:(void *)a4 orderingTerms:(uint64_t)a5 limit:(void *)a6 anchorProperty:(uint64_t)a7 distinct:
{
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = a2;
  uint64_t v16 = self;
  id v17 = +[HDHealthEntity _syncQueryDescriptorWithPredicate:orderingTerms:limit:anchorProperty:distinct:](v16, v14, v13, a5, v12, a7);

  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F65D60]) initWithDatabase:v15 descriptor:v17];

  return v18;
}

uint64_t __184__HDHealthEntity_Sync__enumerateEntitiesForSyncWithProperties_predicate_syncEntityClass_session_syncAnchorRange_orderingTerms_limit_lastSyncAnchor_distinct_healthDatabase_error_block___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)[objc_alloc(*(Class *)(a1 + 56)) initWithPersistentID:a2];
  if (!*(unsigned char *)(a1 + 72)) {
    a2 = HDSQLiteColumnAsInt64();
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(a1 + 32);
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v8 = (*(unsigned int (**)(void))(v7 + 16))();

  return v8;
}

+ (BOOL)enumerateEntitiesForSyncWithProperties:(id)a3 predicate:(id)a4 healthDatabase:(id)a5 error:(id *)a6 block:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __100__HDHealthEntity_Sync__enumerateEntitiesForSyncWithProperties_predicate_healthDatabase_error_block___block_invoke;
  v19[3] = &unk_1E62FEF68;
  id v20 = v13;
  id v21 = v12;
  id v22 = v14;
  id v23 = a1;
  id v15 = v14;
  id v16 = v12;
  id v17 = v13;
  LOBYTE(a6) = [a1 performReadTransactionWithHealthDatabase:a5 error:a6 block:v19];

  return (char)a6;
}

uint64_t __100__HDHealthEntity_Sync__enumerateEntitiesForSyncWithProperties_predicate_healthDatabase_error_block___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = [v5 databaseForEntityClass:v6];
  uint64_t v8 = +[HDHealthEntity _syncQueryWithDatabase:predicate:orderingTerms:limit:anchorProperty:distinct:](v6, v7, *(void **)(a1 + 32), 0, 0, (void *)*MEMORY[0x1E4F65C70], 1);

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__HDHealthEntity_Sync__enumerateEntitiesForSyncWithProperties_predicate_healthDatabase_error_block___block_invoke_2;
  v13[3] = &unk_1E62FEF40;
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 56);
  id v14 = v9;
  id v15 = v17;
  uint64_t v11 = [v8 enumeratePersistentIDsAndProperties:v10 error:a3 enumerationHandler:v13];

  _Block_object_dispose(v17, 8);
  return v11;
}

uint64_t __100__HDHealthEntity_Sync__enumerateEntitiesForSyncWithProperties_predicate_healthDatabase_error_block___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  id v5 = (objc_class *)a1[6];
  id v6 = a3;
  uint64_t v7 = (void *)[[v5 alloc] initWithPersistentID:a2];
  uint64_t v8 = a1[4];
  ++*(void *)(*(void *)(a1[5] + 8) + 24);
  unsigned int v9 = (*(uint64_t (**)(void))(v8 + 16))();

  return v9;
}

+ (int64_t)nextSyncAnchorWithStartAnchor:(int64_t)a3 predicate:(id)a4 syncEntityClass:(Class)a5 session:(id)a6 orderingTerms:(id)a7 limit:(unint64_t)a8 healthDatabase:(id)a9 error:(id *)a10
{
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  id v21 = [a1 propertyForSyncAnchor];
  if (!v21)
  {
    int64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"HDHealthEntity+Sync.m", 216, @"Invalid parameter not satisfying: %@", @"anchorProperty != nil" object file lineNumber description];
  }
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = -1;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __129__HDHealthEntity_Sync__nextSyncAnchorWithStartAnchor_predicate_syncEntityClass_session_orderingTerms_limit_healthDatabase_error___block_invoke;
  v29[3] = &unk_1E62FEF90;
  id v35 = a1;
  id v22 = v17;
  id v30 = v22;
  Class v36 = a5;
  id v23 = v18;
  id v31 = v23;
  int64_t v37 = a3;
  id v24 = v19;
  id v32 = v24;
  unint64_t v38 = a8;
  id v25 = v21;
  id v33 = v25;
  v34 = &v39;
  [a1 performReadTransactionWithHealthDatabase:v20 error:a10 block:v29];
  int64_t v26 = v40[3];

  _Block_object_dispose(&v39, 8);
  return v26;
}

uint64_t __129__HDHealthEntity_Sync__nextSyncAnchorWithStartAnchor_predicate_syncEntityClass_session_orderingTerms_limit_healthDatabase_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 80);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 88);
  id v8 = a2;
  uint64_t v9 = HDSyncAnchorRangeMake(v7, 0x7FFFFFFFFFFFFFFFLL);
  uint64_t v11 = objc_msgSend(v3, "predicateForSyncWithPredicate:syncEntityClass:session:syncAnchorRange:", v5, v4, v6, v9, v10);
  id v12 = +[HDHealthEntity _syncQueryDescriptorWithPredicate:orderingTerms:limit:anchorProperty:distinct:](*(void *)(a1 + 72), v11, *(void **)(a1 + 48), *(void *)(a1 + 96), *(void **)(a1 + 56), 0);
  id v13 = *(void **)(a1 + 72);
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v15 = *MEMORY[0x1E4F65CB8];
  uint64_t v16 = [v8 databaseForEntityClass:v13];

  id v21 = 0;
  id v17 = [v13 aggregateSingleValueForProperty:v14 function:v15 queryDescriptor:v12 database:v16 error:&v21];
  id v18 = v21;

  if (v17) {
    uint64_t v19 = [v17 longLongValue];
  }
  else {
    uint64_t v19 = *(void *)(a1 + 88);
  }
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v19;

  return 1;
}

+ (id)_syncQueryDescriptorWithPredicate:(void *)a3 orderingTerms:(uint64_t)a4 limit:(void *)a5 anchorProperty:(uint64_t)a6 distinct:
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a2;
  uint64_t v13 = self;
  id v14 = objc_alloc_init(MEMORY[0x1E4F65D68]);
  [v14 setEntityClass:v13];
  [v14 setLimitCount:a4];
  [v14 setPredicate:v12];

  [v14 setReturnsDistinctEntities:a6];
  if (v10)
  {
    [v14 setOrderingTerms:v10];
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:v11 entityClass:v13 ascending:1];
    v18[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v14 setOrderingTerms:v16];
  }

  return v14;
}

+ (id)predicateForSyncWithPredicate:(id)a3 syncEntityClass:(Class)a4 session:(id)a5 syncAnchorRange:(HDSyncAnchorRange)a6
{
  int64_t end = a6.end;
  int64_t start = a6.start;
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = [a1 propertyForSyncAnchor];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v15 = [NSNumber numberWithLongLong:start];
  id v30 = (void *)v13;
  uint64_t v16 = [MEMORY[0x1E4F65D00] predicateWithProperty:v13 greaterThanValue:v15];
  [v14 addObject:v16];

  if (end != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v17 = [NSNumber numberWithLongLong:end];
    id v18 = [MEMORY[0x1E4F65D00] predicateWithProperty:v30 lessThanOrEqualToValue:v17];
    [v14 addObject:v18];
  }
  if (objc_opt_respondsToSelector()) {
    [(objc_class *)a4 excludedSyncStoresForSession:v12];
  }
  else {
  uint64_t v19 = [v12 excludedSyncStores];
  }
  if ([v19 count])
  {
    id v20 = objc_msgSend(v19, "hk_map:", &__block_literal_global_88);
    id v21 = (void *)MEMORY[0x1E4F65D10];
    id v22 = [a1 propertyForSyncProvenance];
    id v23 = [v21 doesNotContainPredicateWithProperty:v22 values:v20];
    [v14 addObject:v23];
  }
  if (objc_opt_respondsToSelector()) {
    [(objc_class *)a4 excludedSyncIdentitiesForSession:v12];
  }
  else {
  id v24 = [v12 excludedSyncIdentities];
  }
  id v25 = [a1 propertyForSyncIdentity];
  if (v25)
  {
    int64_t v26 = objc_msgSend(v24, "hk_map:", &__block_literal_global_301);
    id v27 = [MEMORY[0x1E4F65D10] doesNotContainPredicateWithProperty:v25 values:v26];
    [v14 addObject:v27];
  }
  if (v11) {
    [v14 addObject:v11];
  }
  int64_t v28 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v14];

  return v28;
}

uint64_t __94__HDHealthEntity_Sync__predicateForSyncWithPredicate_syncEntityClass_session_syncAnchorRange___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 syncProvenance];

  return [v2 numberWithLongLong:v3];
}

id __94__HDHealthEntity_Sync__predicateForSyncWithPredicate_syncEntityClass_session_syncAnchorRange___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 entity];
  uint64_t v4 = objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "persistentID"));

  return v4;
}

+ (int64_t)protectionClass
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"+[%@ %@] not implemented", a1, v5 format];

  return 1;
}

+ (id)defaultForeignKey
{
  id v3 = objc_alloc(MEMORY[0x1E4F65D20]);
  uint64_t v4 = (void *)[v3 initWithEntityClass:a1 property:*MEMORY[0x1E4F65C70] deletionAction:2];

  return v4;
}

+ (BOOL)validateEntityWithProfile:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5
{
  return 1;
}

+ (id)createValidationError:(id)a3 rowId:(id)a4
{
  void v17[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 120, v6);
  v16[0] = *MEMORY[0x1E4F29B38];
  uint64_t v9 = [a1 databaseTable];
  uint64_t v10 = *MEMORY[0x1E4F28A50];
  v17[0] = v9;
  v17[1] = v8;
  uint64_t v11 = *MEMORY[0x1E4F29B30];
  v16[1] = v10;
  v16[2] = v11;
  v17[2] = v7;
  v16[3] = *MEMORY[0x1E4F29B48];
  id v12 = [NSString stringWithFormat:@"ROWID %@", v7];
  v17[3] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];

  id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:userInfo:", 120, v13);

  return v14;
}

+ (id)propertyForSyncAnchor
{
  return (id)*MEMORY[0x1E4F65C70];
}

+ (id)propertyForSyncProvenance
{
  return 0;
}

+ (id)propertyForSyncIdentity
{
  return 0;
}

+ (id)createTableSQLWithBehavior:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  [a1 columnDefinitionsWithBehavior:v4 count:&v12];
  uint64_t v5 = [a1 disambiguatedDatabaseTable];
  id v6 = [a1 foreignKeys];
  id v7 = [a1 primaryKeyColumns];
  id v8 = [a1 uniquedColumns];
  uint64_t v9 = [a1 checkConstraints];
  [a1 hasROWID];
  uint64_t v10 = HDSQLiteEntityCreateTableSQL();

  return v10;
}

+ (id)indicesWithBehavior:(id)a3
{
  id v3 = objc_msgSend(a1, "indices", a3);

  return v3;
}

+ (id)triggersWithBehavior:(id)a3
{
  id v3 = objc_msgSend(a1, "triggers", a3);

  return v3;
}

+ (const)columnDefinitionsWithBehavior:(id)a3 count:(unint64_t *)a4
{
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)[a1 columnDefinitionsWithCount:a4];
}

+ (BOOL)performReadTransactionWithHealthDatabase:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  self;
  if (v8)
  {
    uint64_t v10 = [a1 transactionContextForWriting:0 baseContext:0];
    char v11 = [v8 performTransactionWithContext:v10 error:a4 block:v9 inaccessibilityHandler:0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a4, 1500, @"Nil healthDatabase");
    char v11 = 0;
  }

  return v11;
}

+ (BOOL)performReadTransactionWithHealthDatabase:(id)a3 context:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  self;
  if (v10)
  {
    uint64_t v13 = [a1 transactionContextForWriting:0 baseContext:v11];
    char v14 = [v10 performTransactionWithContext:v13 error:a5 block:v12 inaccessibilityHandler:0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a5, 1500, @"Nil healthDatabase");
    char v14 = 0;
  }

  return v14;
}

+ (BOOL)performWriteTransactionWithHealthDatabase:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  self;
  if (v8)
  {
    id v10 = [a1 transactionContextForWriting:1 baseContext:0];
    char v11 = [v8 performTransactionWithContext:v10 error:a4 block:v9 inaccessibilityHandler:0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a4, 1500, @"Nil healthDatabase");
    char v11 = 0;
  }

  return v11;
}

+ (BOOL)performWriteTransactionWithHealthDatabase:(id)a3 context:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  self;
  if (v10)
  {
    uint64_t v13 = [a1 transactionContextForWriting:1 baseContext:v11];
    char v14 = [v10 performTransactionWithContext:v13 error:a5 block:v12 inaccessibilityHandler:0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a5, 1500, @"Nil healthDatabase");
    char v14 = 0;
  }

  return v14;
}

+ (BOOL)performWriteTransactionWithHealthDatabase:(id)a3 error:(id *)a4 block:(id)a5 inaccessibilityHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  self;
  if (v10)
  {
    uint64_t v13 = [a1 transactionContextForWriting:1 baseContext:0];
    char v14 = [v10 performTransactionWithContext:v13 error:a4 block:v11 inaccessibilityHandler:v12];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a4, 1500, @"Nil healthDatabase");
    char v14 = 0;
  }

  return v14;
}

+ (BOOL)performWriteTransactionWithHealthDatabase:(id)a3 context:(id)a4 error:(id *)a5 block:(id)a6 inaccessibilityHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  self;
  if (v12)
  {
    uint64_t v16 = [a1 transactionContextForWriting:1 baseContext:v13];
    char v17 = [v12 performTransactionWithContext:v16 error:a5 block:v14 inaccessibilityHandler:v15];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a5, 1500, @"Nil healthDatabase");
    char v17 = 0;
  }

  return v17;
}

+ (id)transactionContextForWriting:(BOOL)a3 baseContext:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([a1 protectionClass] != 2)
  {
    if (!v4)
    {
      if (v6)
      {
        id v10 = v6;
      }
      else
      {
        id v10 = +[HDDatabaseTransactionContext contextForReading];
      }
      id v9 = v10;
      goto LABEL_15;
    }
    id v7 = (void *)[v6 copyForWriting];
    if (!v7)
    {
      id v8 = +[HDDatabaseTransactionContext contextForWriting];
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (!v4)
  {
    id v7 = (void *)[v6 copyForReadingProtectedData];
    if (!v7)
    {
      id v8 = +[HDDatabaseTransactionContext contextForReadingProtectedData];
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v7 = (void *)[v6 copyForWritingProtectedData];
  if (v7)
  {
LABEL_9:
    id v8 = v7;
    goto LABEL_10;
  }
  id v8 = +[HDDatabaseTransactionContext contextForWritingProtectedData];
LABEL_10:
  id v9 = v8;

LABEL_15:

  return v9;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  return 0;
}

- (BOOL)updateProperties:(id)a3 healthDatabase:(id)a4 error:(id *)a5 bindingHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = objc_opt_class();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__HDHealthEntity_updateProperties_healthDatabase_error_bindingHandler___block_invoke;
  v17[3] = &unk_1E6303940;
  void v17[4] = self;
  id v14 = v10;
  id v18 = v14;
  id v15 = v12;
  id v19 = v15;
  LOBYTE(a5) = [v13 performWriteTransactionWithHealthDatabase:v11 error:a5 block:v17];

  return (char)a5;
}

uint64_t __71__HDHealthEntity_updateProperties_healthDatabase_error_bindingHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 databaseForEntity:*(void *)(a1 + 32)];
  uint64_t v6 = [*(id *)(a1 + 32) updateProperties:*(void *)(a1 + 40) database:v5 error:a3 bindingHandler:*(void *)(a1 + 48)];

  return v6;
}

+ (BOOL)performPostFirstJournalMergeCleanupWithTransaction:(id)a3 profile:(id)a4 error:(id *)a5
{
  return 1;
}

+ (id)countDistinctForProperty:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__119;
  id v20 = __Block_byref_object_dispose__119;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__HDHealthEntity_Conveniences__countDistinctForProperty_healthDatabase_error___block_invoke;
  v12[3] = &unk_1E63039B8;
  id v14 = &v16;
  id v15 = a1;
  id v9 = v8;
  id v13 = v9;
  if ([a1 performReadTransactionWithHealthDatabase:a4 error:a5 block:v12]) {
    id v10 = (id)v17[5];
  }
  else {
    id v10 = &unk_1F17EE9D0;
  }

  _Block_object_dispose(&v16, 8);

  return v10;
}

BOOL __78__HDHealthEntity_Conveniences__countDistinctForProperty_healthDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 databaseForEntityClass:*(void *)(a1 + 48)];
  uint64_t v7 = [*(id *)(a1 + 48) countDistinctForProperty:*(void *)(a1 + 32) predicate:0 database:v6 error:a3];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  BOOL v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
  return v10;
}

+ (int64_t)sizeOfDatabaseTableInHealthDatabase:(id)a3 error:(id *)a4
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__HDHealthEntity_Conveniences__sizeOfDatabaseTableInHealthDatabase_error___block_invoke;
  v6[3] = &unk_1E63039E0;
  v6[4] = &v7;
  v6[5] = a1;
  if ([a1 performReadTransactionWithHealthDatabase:a3 error:a4 block:v6]) {
    int64_t v4 = v8[3];
  }
  else {
    int64_t v4 = -1;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __74__HDHealthEntity_Conveniences__sizeOfDatabaseTableInHealthDatabase_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = [v3 databaseForEntityClass:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [*(id *)(a1 + 40) sizeOfEntityTableInDatabase:v4];

  return 1;
}

+ (BOOL)enumerateProperties:(id)a3 withPredicate:(id)a4 orderingTerms:(id)a5 groupBy:(id)a6 limit:(unint64_t)a7 healthDatabase:(id)a8 error:(id *)a9 enumerationHandler:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a10;
  if (![v16 count])
  {
    id v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, a1, @"HDHealthEntity.mm", 355, @"Invalid parameter not satisfying: %@", @"[properties count] > 0" object file lineNumber description];

    if (v21) {
      goto LABEL_3;
    }
LABEL_5:
    id v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, a1, @"HDHealthEntity.mm", 356, @"Invalid parameter not satisfying: %@", @"enumerationHandler != NULL" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v21) {
    goto LABEL_5;
  }
LABEL_3:
  id v22 = v19;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __134__HDHealthEntity_Conveniences__enumerateProperties_withPredicate_orderingTerms_groupBy_limit_healthDatabase_error_enumerationHandler___block_invoke;
  v33[3] = &unk_1E6303A08;
  id v39 = a1;
  id v23 = v17;
  id v34 = v23;
  unint64_t v40 = a7;
  id v24 = v18;
  id v35 = v24;
  id v25 = v22;
  id v36 = v25;
  id v26 = v16;
  id v37 = v26;
  id v27 = v21;
  id v38 = v27;
  char v28 = [a1 performReadTransactionWithHealthDatabase:v20 error:a9 block:v33];

  return v28;
}

uint64_t __134__HDHealthEntity_Conveniences__enumerateProperties_withPredicate_orderingTerms_groupBy_limit_healthDatabase_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 72)];
  uint64_t v6 = [*(id *)(a1 + 72) queryWithDatabase:v5 predicate:*(void *)(a1 + 32) limit:*(void *)(a1 + 80) orderingTerms:*(void *)(a1 + 40) groupBy:*(void *)(a1 + 48)];
  uint64_t v7 = [v6 enumeratePersistentIDsAndProperties:*(void *)(a1 + 56) error:a3 enumerationHandler:*(void *)(a1 + 64)];

  return v7;
}

+ (BOOL)deleteEntitiesWithPredicate:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__HDHealthEntity_Conveniences__deleteEntitiesWithPredicate_healthDatabase_error___block_invoke;
  v11[3] = &unk_1E6303A30;
  id v12 = v8;
  id v13 = a1;
  id v9 = v8;
  LOBYTE(a5) = [a1 performWriteTransactionWithHealthDatabase:a4 error:a5 block:v11];

  return (char)a5;
}

uint64_t __81__HDHealthEntity_Conveniences__deleteEntitiesWithPredicate_healthDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 40)];
  uint64_t v6 = [*(id *)(a1 + 40) deleteEntitiesInDatabase:v5 predicate:*(void *)(a1 + 32) error:a3];

  return v6;
}

+ (id)propertyValueForAnyWithProperty:(id)a3 predicate:(id)a4 healthDatabase:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__119;
  id v25 = __Block_byref_object_dispose__119;
  id v26 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __95__HDHealthEntity_Conveniences__propertyValueForAnyWithProperty_predicate_healthDatabase_error___block_invoke;
  v16[3] = &unk_1E6303A58;
  id v19 = &v21;
  id v20 = a1;
  id v17 = v10;
  id v18 = v11;
  id v12 = v11;
  id v13 = v10;
  [a1 performReadTransactionWithHealthDatabase:a5 error:a6 block:v16];
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);

  return v14;
}

uint64_t __95__HDHealthEntity_Conveniences__propertyValueForAnyWithProperty_predicate_healthDatabase_error___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 databaseForEntityClass:a1[7]];
  uint64_t v7 = (void *)a1[7];
  uint64_t v8 = a1[4];
  uint64_t v9 = a1[5];
  id v20 = 0;
  uint64_t v10 = [v7 propertyValueForAnyInDatabase:v6 property:v8 predicate:v9 error:&v20];
  id v11 = v20;
  uint64_t v12 = *(void *)(a1[6] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v10;

  uint64_t v14 = *(void *)(*(void *)(a1[6] + 8) + 40);
  id v15 = v11;
  id v16 = v15;
  if (v15)
  {
    if (a3) {
      *a3 = v15;
    }
    else {
      _HKLogDroppedError();
    }
  }

  if (v16) {
    BOOL v17 = v14 == 0;
  }
  else {
    BOOL v17 = 0;
  }
  uint64_t v18 = !v17;

  return v18;
}

- (id)stringForProperty:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__119;
  id v22 = __Block_byref_object_dispose__119;
  id v23 = 0;
  uint64_t v10 = objc_opt_class();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__HDHealthEntity_Conveniences__stringForProperty_healthDatabase_error___block_invoke;
  v15[3] = &unk_1E62FCCF8;
  v15[4] = self;
  BOOL v17 = &v18;
  id v11 = v8;
  id v16 = v11;
  if ([v10 performReadTransactionWithHealthDatabase:v9 error:a5 block:v15]) {
    uint64_t v12 = (void *)v19[5];
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  _Block_object_dispose(&v18, 8);

  return v13;
}

uint64_t __71__HDHealthEntity_Conveniences__stringForProperty_healthDatabase_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = [v3 databaseForEntity:*(void *)(a1 + 32)];
  uint64_t v5 = [*(id *)(a1 + 32) stringForProperty:*(void *)(a1 + 40) database:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return 1;
}

- (id)dateForProperty:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__119;
  id v23 = __Block_byref_object_dispose__119;
  id v24 = 0;
  v25[0] = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  id v11 = objc_msgSend(v9, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__HDHealthEntity_Conveniences__dateForProperty_transaction_error___block_invoke;
  v16[3] = &unk_1E6303A80;
  uint64_t v18 = &v19;
  id v12 = v8;
  id v17 = v12;
  LODWORD(a5) = [(HDSQLiteEntity *)self getValuesForProperties:v10 database:v11 error:a5 handler:v16];

  if (a5) {
    id v13 = (void *)v20[5];
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  _Block_object_dispose(&v19, 8);

  return v14;
}

void __66__HDHealthEntity_Conveniences__dateForProperty_transaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsDate();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)setDate:(id)a3 forProperty:(id)a4 transaction:(id)a5 error:(id *)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21[0] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  id v14 = objc_msgSend(v12, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __70__HDHealthEntity_Conveniences__setDate_forProperty_transaction_error___block_invoke;
  v18[3] = &unk_1E6303AA8;
  id v15 = v11;
  id v19 = v15;
  id v16 = v10;
  id v20 = v16;
  LOBYTE(a6) = [(HDSQLiteEntity *)self updateProperties:v13 database:v14 error:a6 bindingHandler:v18];

  return (char)a6;
}

void __70__HDHealthEntity_Conveniences__setDate_forProperty_transaction_error___block_invoke()
{
}

- (id)stringForProperty:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__119;
  id v23 = __Block_byref_object_dispose__119;
  id v24 = 0;
  v25[0] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  id v11 = objc_msgSend(v9, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__HDHealthEntity_Conveniences__stringForProperty_transaction_error___block_invoke;
  v16[3] = &unk_1E6303A80;
  uint64_t v18 = &v19;
  id v12 = v8;
  id v17 = v12;
  LODWORD(a5) = [(HDSQLiteEntity *)self getValuesForProperties:v10 database:v11 error:a5 handler:v16];

  if (a5) {
    id v13 = (void *)v20[5];
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  _Block_object_dispose(&v19, 8);

  return v14;
}

void __68__HDHealthEntity_Conveniences__stringForProperty_transaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsString();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)setString:(id)a3 forProperty:(id)a4 transaction:(id)a5 error:(id *)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21[0] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  id v14 = objc_msgSend(v12, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __72__HDHealthEntity_Conveniences__setString_forProperty_transaction_error___block_invoke;
  v18[3] = &unk_1E6303AA8;
  id v15 = v11;
  id v19 = v15;
  id v16 = v10;
  id v20 = v16;
  LOBYTE(a6) = [(HDSQLiteEntity *)self updateProperties:v13 database:v14 error:a6 bindingHandler:v18];

  return (char)a6;
}

void __72__HDHealthEntity_Conveniences__setString_forProperty_transaction_error___block_invoke()
{
}

- (id)numberForProperty:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__119;
  id v23 = __Block_byref_object_dispose__119;
  id v24 = 0;
  v25[0] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  id v11 = objc_msgSend(v9, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__HDHealthEntity_Conveniences__numberForProperty_transaction_error___block_invoke;
  v16[3] = &unk_1E6303A80;
  uint64_t v18 = &v19;
  id v12 = v8;
  id v17 = v12;
  LODWORD(a5) = [(HDSQLiteEntity *)self getValuesForProperties:v10 database:v11 error:a5 handler:v16];

  if (a5) {
    id v13 = (void *)v20[5];
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  _Block_object_dispose(&v19, 8);

  return v14;
}

void __68__HDHealthEntity_Conveniences__numberForProperty_transaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsNumber();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)setNumber:(id)a3 forProperty:(id)a4 transaction:(id)a5 error:(id *)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21[0] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  id v14 = objc_msgSend(v12, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __72__HDHealthEntity_Conveniences__setNumber_forProperty_transaction_error___block_invoke;
  v18[3] = &unk_1E6303AA8;
  id v15 = v11;
  id v19 = v15;
  id v16 = v10;
  id v20 = v16;
  LOBYTE(a6) = [(HDSQLiteEntity *)self updateProperties:v13 database:v14 error:a6 bindingHandler:v18];

  return (char)a6;
}

void __72__HDHealthEntity_Conveniences__setNumber_forProperty_transaction_error___block_invoke()
{
}

- (id)foreignKeyEntity:(Class)a3 forProperty:(id)a4 transaction:(id)a5 error:(id *)a6
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__119;
  id v26 = __Block_byref_object_dispose__119;
  id v27 = 0;
  v28[0] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  id v13 = [v11 databaseForEntity:self];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __79__HDHealthEntity_Conveniences__foreignKeyEntity_forProperty_transaction_error___block_invoke;
  v18[3] = &unk_1E6303AD0;
  id v14 = v10;
  id v19 = v14;
  id v20 = &v22;
  Class v21 = a3;
  LODWORD(a6) = [(HDSQLiteEntity *)self getValuesForProperties:v12 database:v13 error:a6 handler:v18];

  if (a6) {
    id v15 = (void *)v23[5];
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  _Block_object_dispose(&v22, 8);

  return v16;
}

void __79__HDHealthEntity_Conveniences__foreignKeyEntity_forProperty_transaction_error___block_invoke(uint64_t a1)
{
  if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
  {
    uint64_t v2 = [objc_alloc(*(Class *)(a1 + 48)) initWithPersistentID:HDSQLiteColumnWithNameAsInt64()];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    int64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (BOOL)setForeignKeyEntity:(id)a3 forProperty:(id)a4 transaction:(id)a5 error:(id *)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21[0] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  id v14 = [v12 databaseForEntity:self];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __82__HDHealthEntity_Conveniences__setForeignKeyEntity_forProperty_transaction_error___block_invoke;
  v18[3] = &unk_1E6303AA8;
  id v15 = v10;
  id v19 = v15;
  id v16 = v11;
  id v20 = v16;
  LOBYTE(a6) = [(HDSQLiteEntity *)self updateProperties:v13 database:v14 error:a6 bindingHandler:v18];

  return (char)a6;
}

void __82__HDHealthEntity_Conveniences__setForeignKeyEntity_forProperty_transaction_error___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    [v1 persistentID];
    JUMPOUT(0x1C1879E80);
  }

  JUMPOUT(0x1C1879E90);
}

- (BOOL)willDeleteWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v6 = a4;
  uint64_t v7 = [v6 databaseForEntityClass:objc_opt_class()];
  [(HDSQLiteEntity *)self willDeleteFromDatabase:v7];

  return 1;
}

+ (id)updateSQLForTimeOffsetWithBindingCount:(unint64_t *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v17 = [a1 columnNamesForTimeOffset];
  unint64_t v5 = [v17 count];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F28E78];
    uint64_t v7 = [a1 disambiguatedDatabaseTable];
    id v8 = [v6 stringWithFormat:@"UPDATE %@ SET ", v7];
    id v16 = a3;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v17;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      uint64_t v12 = 1;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v9);
          }
          if (v12 + i >= v5) {
            id v14 = "";
          }
          else {
            id v14 = ", ";
          }
          [v8 appendFormat:@"%@ = %@ + ?%s", *(void *)(*((void *)&v18 + 1) + 8 * i), *(void *)(*((void *)&v18 + 1) + 8 * i), v14];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        v12 += i;
      }
      while (v10);
    }

    if (v16) {
      *id v16 = v5;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)columnNamesForTimeOffset
{
  return 0;
}

@end