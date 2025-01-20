@interface HDDeletedObjectEntity
+ (BOOL)deleteEntitiesWithPredicate:(id)a3 healthDatabase:(id)a4 error:(id *)a5;
+ (BOOL)deleteObjectsWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)requiresSampleTypePredicate;
+ (Class)baseDataEntityClass;
+ (id)deletedObjectEntityForDeletedObject:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)deletedObjectEntityWithUUID:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)insertDeletedObject:(id)a3 provenanceIdentifier:(id)a4 deletionDate:(id)a5 inDatabase:(id)a6 error:(id *)a7;
+ (int64_t)preferredEntityType;
@end

@implementation HDDeletedObjectEntity

+ (BOOL)deleteObjectsWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [a1 predicateMatchingPreferredEntityTypeIfRequiredWithPredicate:a3];
  v10 = [v8 database];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__HDDeletedObjectEntity_deleteObjectsWithPredicate_profile_error___block_invoke;
  v14[3] = &unk_1E62F4200;
  id v16 = v9;
  id v17 = a1;
  id v15 = v8;
  id v11 = v9;
  id v12 = v8;
  LOBYTE(a5) = [a1 performWriteTransactionWithHealthDatabase:v10 error:a5 block:v14];

  return (char)a5;
}

+ (BOOL)requiresSampleTypePredicate
{
  return 1;
}

+ (int64_t)preferredEntityType
{
  return 2;
}

uint64_t __66__HDDeletedObjectEntity_deleteObjectsWithPredicate_profile_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [[HDDataEntityDeletionContext alloc] initWithProfile:a1[4] transaction:v5];
  v7 = (void *)a1[6];
  id v8 = [v5 databaseForEntityClass:v7];

  v9 = [v7 queryWithDatabase:v8 predicate:a1[5]];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__HDDeletedObjectEntity_deleteObjectsWithPredicate_profile_error___block_invoke_2;
  v14[3] = &unk_1E62F66B0;
  uint64_t v10 = a1[6];
  id v15 = v6;
  uint64_t v16 = v10;
  id v11 = v6;
  uint64_t v12 = [v9 enumeratePersistentIDsAndProperties:0 error:a3 enumerationHandler:v14];

  return v12;
}

+ (id)insertDeletedObject:(id)a3 provenanceIdentifier:(id)a4 deletionDate:(id)a5 inDatabase:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __96__HDDeletedObjectEntity_insertDeletedObject_provenanceIdentifier_deletionDate_inDatabase_error___block_invoke_2;
  v21[3] = &unk_1E62F2DF0;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  int v18 = [v14 executeCachedStatementForKey:&insertDeletedObject_provenanceIdentifier_deletionDate_inDatabase_error__insertKey error:a7 SQLGenerator:&__block_literal_global_33 bindingHandler:v21 enumerationHandler:0];
  v19 = 0;
  if (v18)
  {
    v19 = [v14 lastInsertRowID];
  }

  return v19;
}

id __96__HDDeletedObjectEntity_insertDeletedObject_provenanceIdentifier_deletionDate_inDatabase_error___block_invoke()
{
  v0 = NSString;
  v1 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v2 = [v0 stringWithFormat:@"INSERT INTO %@ (%@, %@, %@, %@) VALUES (?, ?, ?, ?)", v1, @"uuid", @"provenance", @"type", @"creation_date", 0];

  return v2;
}

uint64_t __96__HDDeletedObjectEntity_insertDeletedObject_provenanceIdentifier_deletionDate_inDatabase_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  v3 = [*(id *)(a1 + 32) UUID];
  v4 = _HDSQLiteValueForUUID();
  HDSQLiteBindFoundationValueToStatement();

  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 3, 2);

  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __66__HDDeletedObjectEntity_deleteObjectsWithPredicate_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (id)deletedObjectEntityForDeletedObject:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__27;
  id v23 = __Block_byref_object_dispose__27;
  id v24 = 0;
  uint64_t v10 = [v9 database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__HDDeletedObjectEntity_deletedObjectEntityForDeletedObject_profile_error___block_invoke;
  v15[3] = &unk_1E62F66D8;
  id v17 = &v19;
  id v18 = a1;
  id v11 = v8;
  id v16 = v11;
  LODWORD(a5) = [a1 performReadTransactionWithHealthDatabase:v10 error:a5 block:v15];

  if (a5) {
    id v12 = (void *)v20[5];
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  _Block_object_dispose(&v19, 8);

  return v13;
}

BOOL __75__HDDeletedObjectEntity_deletedObjectEntityForDeletedObject_profile_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = (void *)a1[6];
  v6 = (void *)a1[4];
  id v7 = a2;
  id v8 = [v6 UUID];
  uint64_t v9 = [v5 deletedObjectEntityWithUUID:v8 transaction:v7 error:a3];

  uint64_t v10 = *(void *)(a1[5] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  return *(void *)(*(void *)(a1[5] + 8) + 40) != 0;
}

+ (id)deletedObjectEntityWithUUID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [a4 databaseForEntityClass:a1];
  uint64_t v10 = HDDataEntityPredicateForDataUUID();

  id v11 = [a1 predicateMatchingPreferredEntityTypeIfRequiredWithPredicate:v10];
  id v12 = [a1 anyInDatabase:v9 predicate:v11 error:a5];

  return v12;
}

+ (Class)baseDataEntityClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)deleteEntitiesWithPredicate:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [a1 predicateMatchingPreferredEntityTypeIfRequiredWithPredicate:a3];
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___HDDeletedObjectEntity;
  LOBYTE(a5) = objc_msgSendSuper2(&v11, sel_deleteEntitiesWithPredicate_healthDatabase_error_, v9, v8, a5);

  return (char)a5;
}

@end