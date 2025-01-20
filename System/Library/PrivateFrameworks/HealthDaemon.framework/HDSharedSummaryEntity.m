@interface HDSharedSummaryEntity
+ (BOOL)deleteAllSummariesWithDatabaseTransaction:(id)a3 error:(id *)a4;
+ (BOOL)enumerateEntitiesWithReuseTransactionID:(unint64_t)a3 package:(id)a4 names:(id)a5 databaseTransaction:(id)a6 error:(id *)a7 enumerationHandler:(id)a8;
+ (BOOL)enumerateEntitiesWithTransactionID:(unint64_t)a3 package:(id)a4 names:(id)a5 databaseTransaction:(id)a6 error:(id *)a7 enumerationHandler:(id)a8;
+ (BOOL)enumerateSummariesWithTransactionID:(unint64_t)a3 package:(id)a4 names:(id)a5 includedObjectTypes:(id)a6 databaseTransaction:(id)a7 error:(id *)a8 enumerationHandler:(id)a9;
+ (BOOL)reuseSummariesForTransactionID:(unint64_t)a3 databaseTransaction:(id)a4 error:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_predicateForTransactionID:(void *)a3 package:(void *)a4 names:(void *)a5 reuseTransactionID:;
+ (id)databaseTable;
+ (id)entityWithUUID:(id)a3 databaseTransaction:(id)a4 error:(id *)a5;
+ (id)foreignKeys;
+ (id)insertOrReplaceWithUUID:(id)a3 package:(id)a4 name:(id)a5 version:(id)a6 compatibilityVersion:(id)a7 transactionID:(unint64_t)a8 summaryData:(id)a9 databaseTransaction:(id)a10 error:(id *)a11;
+ (id)uniquedColumns;
+ (int64_t)countOfObjectsForTransactionID:(int64_t)a3 healthDatabase:(id)a4 error:(id *)a5;
+ (int64_t)protectionClass;
+ (uint64_t)_enumerateEntitiesWithTransactionID:(void *)a3 package:(void *)a4 names:(void *)a5 reuseTransactionID:(void *)a6 databaseTransaction:(uint64_t)a7 error:(void *)a8 enumerationHandler:;
- (BOOL)setReuseTransactionID:(id)a3 databaseTransaction:(id)a4 error:(id *)a5;
- (BOOL)setSynced:(BOOL)a3 databaseTransaction:(id)a4 error:(id *)a5;
- (BOOL)syncedInDatabaseTransaction:(id)a3 error:(id *)a4;
- (id)UUIDInDatabaseTransaction:(id)a3 error:(id *)a4;
- (id)compatibilityVersionInDatabaseTransaction:(id)a3 error:(id *)a4;
- (id)nameInDatabaseTransaction:(id)a3 error:(id *)a4;
- (id)packageInDatabaseTransaction:(id)a3 error:(id *)a4;
- (id)reuseTransactionIDInDatabaseTransaction:(id)a3 error:(id *)a4;
- (id)summaryDataInDatabaseTransaction:(id)a3 error:(id *)a4;
- (id)transactionIDInDatabaseTransaction:(id)a3 error:(id *)a4;
- (id)versionInDatabaseTransaction:(id)a3 error:(id *)a4;
@end

@implementation HDSharedSummaryEntity

+ (id)databaseTable
{
  return @"shared_summaries";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 10;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDSharedSummaryEntityColumnDefinitions;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"transaction_id";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)uniquedColumns
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"package";
  v4[1] = @"name";
  v4[2] = @"transaction_id";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)insertOrReplaceWithUUID:(id)a3 package:(id)a4 name:(id)a5 version:(id)a6 compatibilityVersion:(id)a7 transactionID:(unint64_t)a8 summaryData:(id)a9 databaseTransaction:(id)a10 error:(id *)a11
{
  v41[8] = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  v21 = [a10 databaseForEntityClass:a1];
  v41[0] = @"uuid";
  v41[1] = @"package";
  v41[2] = @"name";
  v41[3] = @"version";
  v41[4] = @"compatibility_version";
  v41[5] = @"transaction_id";
  v41[6] = @"summary_data";
  v41[7] = @"synced";
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:8];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __143__HDSharedSummaryEntity_insertOrReplaceWithUUID_package_name_version_compatibilityVersion_transactionID_summaryData_databaseTransaction_error___block_invoke;
  v33[3] = &unk_1E62F84B0;
  id v34 = v31;
  id v35 = v16;
  id v36 = v17;
  id v37 = v18;
  id v39 = v20;
  unint64_t v40 = a8;
  id v38 = v19;
  id v23 = v20;
  id v24 = v19;
  id v25 = v18;
  id v26 = v17;
  id v27 = v16;
  id v28 = v31;
  v29 = [a1 insertOrReplaceEntity:1 database:v21 properties:v22 error:a11 bindingHandler:v33];

  return v29;
}

void __143__HDSharedSummaryEntity_insertOrReplaceWithUUID_package_name_version_compatibilityVersion_transactionID_summaryData_databaseTransaction_error___block_invoke(void *a1, uint64_t a2)
{
  MEMORY[0x1C1879EF0](a2, @"uuid", a1[4]);
  MEMORY[0x1C1879EC0](a2, @"package", a1[5]);
  MEMORY[0x1C1879EC0](a2, @"name", a1[6]);
  MEMORY[0x1C1879EC0](a2, @"version", a1[7]);
  MEMORY[0x1C1879EC0](a2, @"compatibility_version", a1[8]);
  MEMORY[0x1C1879E80](a2, @"transaction_id", a1[10]);
  MEMORY[0x1C1879E30](a2, @"summary_data", a1[9]);

  JUMPOUT(0x1C1879E20);
}

+ (BOOL)deleteAllSummariesWithDatabaseTransaction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_opt_class();
  v7 = [v5 protectedDatabase];

  v8 = [v6 queryWithDatabase:v7 predicate:0];

  LOBYTE(a4) = [v8 deleteAllEntitiesWithError:a4];
  return (char)a4;
}

+ (BOOL)enumerateEntitiesWithTransactionID:(unint64_t)a3 package:(id)a4 names:(id)a5 databaseTransaction:(id)a6 error:(id *)a7 enumerationHandler:(id)a8
{
  v14 = NSNumber;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = [v14 numberWithUnsignedLongLong:a3];
  LOBYTE(a7) = +[HDSharedSummaryEntity _enumerateEntitiesWithTransactionID:package:names:reuseTransactionID:databaseTransaction:error:enumerationHandler:]((uint64_t)a1, v19, v18, v17, 0, v16, (uint64_t)a7, v15);

  return (char)a7;
}

+ (uint64_t)_enumerateEntitiesWithTransactionID:(void *)a3 package:(void *)a4 names:(void *)a5 reuseTransactionID:(void *)a6 databaseTransaction:(uint64_t)a7 error:(void *)a8 enumerationHandler:
{
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = a2;
  id v20 = self;
  v21 = +[HDSharedSummaryEntity _predicateForTransactionID:package:names:reuseTransactionID:]((uint64_t)HDSharedSummaryEntity, v19, v18, v17, v16);

  v22 = [v15 databaseForEntityClass:objc_opt_class()];

  id v23 = [v20 queryWithDatabase:v22 predicate:v21];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __139__HDSharedSummaryEntity__enumerateEntitiesWithTransactionID_package_names_reuseTransactionID_databaseTransaction_error_enumerationHandler___block_invoke;
  v27[3] = &unk_1E62F35F0;
  id v28 = v14;
  id v24 = v14;
  uint64_t v25 = [v23 enumeratePersistentIDsAndProperties:MEMORY[0x1E4F1CBF0] error:a7 enumerationHandler:v27];

  return v25;
}

+ (BOOL)enumerateEntitiesWithReuseTransactionID:(unint64_t)a3 package:(id)a4 names:(id)a5 databaseTransaction:(id)a6 error:(id *)a7 enumerationHandler:(id)a8
{
  id v14 = NSNumber;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = [v14 numberWithUnsignedLongLong:a3];
  LOBYTE(a7) = +[HDSharedSummaryEntity _enumerateEntitiesWithTransactionID:package:names:reuseTransactionID:databaseTransaction:error:enumerationHandler:]((uint64_t)a1, 0, v18, v17, v19, v16, (uint64_t)a7, v15);

  return (char)a7;
}

+ (BOOL)enumerateSummariesWithTransactionID:(unint64_t)a3 package:(id)a4 names:(id)a5 includedObjectTypes:(id)a6 databaseTransaction:(id)a7 error:(id *)a8 enumerationHandler:(id)a9
{
  v61[2] = *MEMORY[0x1E4F143B8];
  id v14 = NSNumber;
  id v15 = a9;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = [v14 numberWithUnsignedLongLong:a3];
  v21 = [NSNumber numberWithUnsignedLongLong:a3];
  id v22 = v17;
  id v23 = v16;
  id v52 = v15;
  id v24 = v21;
  id v25 = v18;
  id v26 = v19;
  id v27 = v20;
  id v28 = self;
  v29 = +[HDSharedSummaryEntity _predicateForTransactionID:package:names:reuseTransactionID:]((uint64_t)HDSharedSummaryEntity, v27, v26, v25, v24);

  v55 = v25;
  v53 = v26;

  v54 = v27;
  unint64_t v30 = 0x1E4F1C000;
  if (v22)
  {
    id v31 = [v22 allObjects];
    v32 = objc_msgSend(v31, "hk_map:", &__block_literal_global_42);
    v33 = [v32 componentsJoinedByString:@", "];

    id v34 = [v22 allObjects];
    id v35 = objc_msgSend(v34, "hk_map:", &__block_literal_global_356);

    id v36 = NSString;
    id v37 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    id v51 = v24;
    id v38 = +[HDSharedSummaryEntity databaseTable];
    id v39 = [v36 stringWithFormat:@"EXISTS (SELECT * FROM %@ WHERE %@ = %@.%@ AND %@ IN (%@))", v37, @"summary_id", v38, *MEMORY[0x1E4F65C70], @"object_type", v33];

    unint64_t v40 = [MEMORY[0x1E4F65D78] predicateWithSQL:v39 overProperties:MEMORY[0x1E4F1CBF0] values:v35];
    v41 = (void *)MEMORY[0x1E4F65D08];
    v61[0] = v29;
    v61[1] = v40;
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
    uint64_t v43 = [v41 predicateMatchingAllPredicates:v42];

    id v24 = v51;
    unint64_t v30 = 0x1E4F1C000uLL;

    v29 = (void *)v43;
  }
  v44 = [v23 databaseForEntityClass:objc_opt_class()];
  v45 = [v28 queryWithDatabase:v44 predicate:v29];
  v60[0] = @"uuid";
  v60[1] = @"package";
  v60[2] = @"name";
  v60[3] = @"version";
  v60[4] = @"compatibility_version";
  v60[5] = @"summary_data";
  v46 = [*(id *)(v30 + 2424) arrayWithObjects:v60 count:6];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __160__HDSharedSummaryEntity__enumerateSummariesWithTransactionID_package_names_includedObjectTypes_reuseTransactionID_databaseTransaction_error_enumerationHandler___block_invoke_3;
  v57[3] = &unk_1E62F8518;
  id v58 = v23;
  id v59 = v52;
  id v47 = v52;
  id v48 = v23;
  char v49 = [v45 enumeratePersistentIDsAndProperties:v46 error:a8 enumerationHandler:v57];

  return v49;
}

+ (id)entityWithUUID:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x1E4F65D00];
  id v10 = a4;
  v11 = [v9 predicateWithProperty:@"uuid" equalToValue:v8];
  v12 = [v10 databaseForEntityClass:objc_opt_class()];

  id v20 = 0;
  v13 = [a1 anyInDatabase:v12 predicate:v11 error:&v20];
  id v14 = v20;
  id v15 = v14;
  if (!v13)
  {
    if (v14)
    {
      id v15 = v14;
LABEL_5:
      if (a5) {
        *a5 = v15;
      }
      else {
        _HKLogDroppedError();
      }

      goto LABEL_9;
    }
    id v16 = (void *)MEMORY[0x1E4F28C58];
    id v17 = [v8 UUIDString];
    id v18 = objc_msgSend(v16, "hk_error:format:", 118, @"Cannot find summary with UUID %@", v17);

    id v15 = v18;
    if (v15) {
      goto LABEL_5;
    }
  }
LABEL_9:

  return v13;
}

+ (BOOL)reuseSummariesForTransactionID:(unint64_t)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [v8 databaseForEntityClass:objc_opt_class()];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__HDSharedSummaryEntity_reuseSummariesForTransactionID_databaseTransaction_error___block_invoke;
  v15[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v15[4] = a1;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__HDSharedSummaryEntity_reuseSummariesForTransactionID_databaseTransaction_error___block_invoke_2;
  v14[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v14[4] = a3;
  if ([v9 executeCachedStatementForKey:&reuseSummariesForTransactionID_databaseTransaction_error__reuseIntoTransactionKey error:a5 SQLGenerator:v15 bindingHandler:v14 enumerationHandler:0])
  {
    v12[4] = a3;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __82__HDSharedSummaryEntity_reuseSummariesForTransactionID_databaseTransaction_error___block_invoke_3;
    v13[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v13[4] = a1;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__HDSharedSummaryEntity_reuseSummariesForTransactionID_databaseTransaction_error___block_invoke_4;
    v12[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
    char v10 = [v9 executeCachedStatementForKey:&reuseSummariesForTransactionID_databaseTransaction_error__clearReuseTransactionKey error:a5 SQLGenerator:v13 bindingHandler:v12 enumerationHandler:0];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

id __82__HDSharedSummaryEntity_reuseSummariesForTransactionID_databaseTransaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"UPDATE OR IGNORE %@ SET %@=? WHERE %@=?", v2, @"transaction_id", @"reuse_transaction_id"];

  return v3;
}

uint64_t __82__HDSharedSummaryEntity_reuseSummariesForTransactionID_databaseTransaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_int64 v4 = *(void *)(a1 + 32);

  return sqlite3_bind_int64(a2, 2, v4);
}

id __82__HDSharedSummaryEntity_reuseSummariesForTransactionID_databaseTransaction_error___block_invoke_3(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"UPDATE %@ SET %@=NULL WHERE %@=?", v2, @"reuse_transaction_id", @"reuse_transaction_id"];

  return v3;
}

uint64_t __82__HDSharedSummaryEntity_reuseSummariesForTransactionID_databaseTransaction_error___block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

+ (int64_t)countOfObjectsForTransactionID:(int64_t)a3 healthDatabase:(id)a4 error:(id *)a5
{
  v7 = (void *)MEMORY[0x1E4F65D00];
  id v8 = NSNumber;
  id v9 = a4;
  char v10 = [v8 numberWithLongLong:a3];
  v11 = [v7 predicateWithProperty:@"transaction_id" equalToValue:v10];

  int64_t v12 = +[HDHealthEntity countOfObjectsWithPredicate:v11 healthDatabase:v9 error:a5];
  return v12;
}

- (BOOL)setSynced:(BOOL)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = NSNumber;
  id v9 = a4;
  char v10 = [v8 numberWithBool:v6];
  LOBYTE(a5) = [(HDHealthEntity *)self setNumber:v10 forProperty:@"synced" transaction:v9 error:a5];

  return (char)a5;
}

- (BOOL)syncedInDatabaseTransaction:(id)a3 error:(id *)a4
{
  sqlite3_int64 v4 = [(HDHealthEntity *)self numberForProperty:@"synced" transaction:a3 error:a4];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)UUIDInDatabaseTransaction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL v6 = [v5 databaseForEntityClass:objc_opt_class()];

  v7 = [(HDSQLiteEntity *)self UUIDForProperty:@"uuid" database:v6];

  return v7;
}

- (id)packageInDatabaseTransaction:(id)a3 error:(id *)a4
{
  return [(HDHealthEntity *)self stringForProperty:@"package" transaction:a3 error:a4];
}

- (id)nameInDatabaseTransaction:(id)a3 error:(id *)a4
{
  return [(HDHealthEntity *)self stringForProperty:@"name" transaction:a3 error:a4];
}

- (id)versionInDatabaseTransaction:(id)a3 error:(id *)a4
{
  return [(HDHealthEntity *)self stringForProperty:@"version" transaction:a3 error:a4];
}

- (id)compatibilityVersionInDatabaseTransaction:(id)a3 error:(id *)a4
{
  return [(HDHealthEntity *)self stringForProperty:@"compatibility_version" transaction:a3 error:a4];
}

- (id)summaryDataInDatabaseTransaction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL v6 = [v5 databaseForEntityClass:objc_opt_class()];

  v7 = [(HDSQLiteEntity *)self valueForProperty:@"summary_data" database:v6];

  return v7;
}

- (id)transactionIDInDatabaseTransaction:(id)a3 error:(id *)a4
{
  return [(HDHealthEntity *)self numberForProperty:@"transaction_id" transaction:a3 error:a4];
}

- (BOOL)setReuseTransactionID:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  char v10 = [v9 databaseForEntityClass:objc_opt_class()];

  v16[0] = @"reuse_transaction_id";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__HDSharedSummaryEntity_setReuseTransactionID_databaseTransaction_error___block_invoke;
  v14[3] = &unk_1E62F35C8;
  id v15 = v8;
  id v12 = v8;
  LOBYTE(a5) = [(HDSQLiteEntity *)self updateProperties:v11 database:v10 error:a5 bindingHandler:v14];

  return (char)a5;
}

void __73__HDSharedSummaryEntity_setReuseTransactionID_databaseTransaction_error___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    [v1 unsignedLongLongValue];
    JUMPOUT(0x1C1879E80);
  }

  JUMPOUT(0x1C1879E90);
}

- (id)reuseTransactionIDInDatabaseTransaction:(id)a3 error:(id *)a4
{
  return [(HDHealthEntity *)self numberForProperty:@"reuse_transaction_id" transaction:a3 error:a4];
}

+ (id)_predicateForTransactionID:(void *)a3 package:(void *)a4 names:(void *)a5 reuseTransactionID:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  self;
  if (v8)
  {
    id v12 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"transaction_id" equalToValue:v8];
  }
  else
  {
    id v12 = 0;
  }
  if (v11)
  {
    v13 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"reuse_transaction_id" equalToValue:v11];
    uint64_t v14 = [MEMORY[0x1E4F65D58] disjunctionWithPredicate:v12 otherPredicate:v13];

    id v12 = (void *)v14;
  }
  if (v9)
  {
    id v15 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"package" equalToValue:v9];
    uint64_t v16 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v12 otherPredicate:v15];

    id v12 = (void *)v16;
  }
  if (v10)
  {
    id v26 = v12;
    id v27 = v11;
    id v28 = v10;
    id v29 = v9;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v17 = v10;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
    id v30 = v8;
    if (v18)
    {
      uint64_t v19 = v18;
      id v20 = 0;
      uint64_t v21 = *(void *)v32;
      do
      {
        uint64_t v22 = 0;
        id v23 = v20;
        do
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v17);
          }
          id v24 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"name" equalToValue:*(void *)(*((void *)&v31 + 1) + 8 * v22)];
          id v20 = [MEMORY[0x1E4F65D58] disjunctionWithPredicate:v23 otherPredicate:v24];

          ++v22;
          id v23 = v20;
        }
        while (v19 != v22);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v19);
    }
    else
    {
      id v20 = 0;
    }

    id v12 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v26 otherPredicate:v20];

    id v9 = v29;
    id v8 = v30;
    id v11 = v27;
    id v10 = v28;
  }

  return v12;
}

uint64_t __139__HDSharedSummaryEntity__enumerateEntitiesWithTransactionID_package_names_reuseTransactionID_databaseTransaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [NSNumber numberWithLongLong:a2];
  sqlite3_int64 v4 = +[HDSQLiteEntity entityWithPersistentID:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return 1;
}

__CFString *__160__HDSharedSummaryEntity__enumerateSummariesWithTransactionID_package_names_includedObjectTypes_reuseTransactionID_databaseTransaction_error_enumerationHandler___block_invoke()
{
  return @"?";
}

uint64_t __160__HDSharedSummaryEntity__enumerateSummariesWithTransactionID_package_names_includedObjectTypes_reuseTransactionID_databaseTransaction_error_enumerationHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 code];

  return [v2 numberWithInteger:v3];
}

uint64_t __160__HDSharedSummaryEntity__enumerateSummariesWithTransactionID_package_names_includedObjectTypes_reuseTransactionID_databaseTransaction_error_enumerationHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v8 = +[HDSharedSummaryAuthorizationIdentifierEntity authorizationIdentifiersForSummaryID:databaseTransaction:error:](HDSharedSummaryAuthorizationIdentifierEntity, "authorizationIdentifiersForSummaryID:databaseTransaction:error:", a2, *(void *)(a1 + 32));
  if (v8)
  {
    id v9 = +[HDSharedSummaryObjectTypeEntity objectTypesForSummaryID:a2 databaseTransaction:*(void *)(a1 + 32) error:a5];
    if (v9)
    {
      uint64_t v18 = HDSQLiteColumnWithNameAsUUID();
      id v10 = HDSQLiteColumnWithNameAsString();
      id v11 = HDSQLiteColumnWithNameAsString();
      id v12 = HDSQLiteColumnWithNameAsString();
      v13 = HDSQLiteColumnWithNameAsString();
      uint64_t v14 = HDSQLiteColumnWithNameAsData();
      id v15 = (void *)[objc_alloc(MEMORY[0x1E4F2B4A0]) _initWithUUID:v18 package:v10 name:v11 version:v12 compatibilityVersion:v13 authorizationIdentifiers:v8 objectTypes:v9 summaryData:v14];
      uint64_t v16 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

@end