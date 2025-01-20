@interface HDSharedSummaryTransactionEntity
+ (BOOL)deleteAllEntriesWithDatabaseTransaction:(id)a3 error:(id *)a4;
+ (BOOL)enumerateTransactionsWithDatabaseTransaction:(id)a3 includeNonCommitted:(BOOL)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)insertWithUUID:(id)a3 sourceDevice:(id)a4 databaseTransaction:(id)a5 error:(id *)a6;
+ (id)mostRecentTransactionCreationDateWithDatabaseTransaction:(id)a3 error:(id *)a4;
+ (id)pruneWithProfile:(id)a3 nowDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6;
+ (id)transactionEntityWithUUID:(id)a3 databaseTransaction:(id)a4 error:(id *)a5;
+ (int64_t)protectionClass;
- (BOOL)committedInDatabaseTransaction:(id)a3 error:(id *)a4;
- (BOOL)deleteWithDatabaseTransaction:(id)a3 error:(id *)a4;
- (BOOL)setCommitted:(BOOL)a3 databaseTransaction:(id)a4 error:(id *)a5;
- (BOOL)unit_testSetCreationDate:(id)a3 databaseTransaction:(id)a4 error:(id *)a5;
- (id)creationDateInDatabaseTransaction:(id)a3 error:(id *)a4;
- (id)sourceDeviceIdentiferInDatabaseTransaction:(id)a3 error:(id *)a4;
- (id)uuidInDatabaseTransaction:(id)a3 error:(id *)a4;
@end

@implementation HDSharedSummaryTransactionEntity

+ (id)databaseTable
{
  return @"shared_summary_transactions";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDSharedSummaryTransactionEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)insertWithUUID:(id)a3 sourceDevice:(id)a4 databaseTransaction:(id)a5 error:(id *)a6
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = [a5 databaseForEntityClass:a1];
  v21[0] = @"uuid";
  v21[1] = @"source_device";
  v21[2] = @"committed";
  v21[3] = @"creation_date";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __90__HDSharedSummaryTransactionEntity_insertWithUUID_sourceDevice_databaseTransaction_error___block_invoke;
  v18[3] = &unk_1E62F3A88;
  id v19 = v10;
  id v20 = v11;
  id v14 = v11;
  id v15 = v10;
  v16 = [a1 insertOrReplaceEntity:0 database:v12 properties:v13 error:a6 bindingHandler:v18];

  return v16;
}

void __90__HDSharedSummaryTransactionEntity_insertWithUUID_sourceDevice_databaseTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879EF0](a2, @"uuid", *(void *)(a1 + 32));
  MEMORY[0x1C1879EC0](a2, @"source_device", *(void *)(a1 + 40));
  MEMORY[0x1C1879E20](a2, @"committed", 0);
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  MEMORY[0x1C1879E40](a2, @"creation_date", v4);
}

+ (BOOL)enumerateTransactionsWithDatabaseTransaction:(id)a3 includeNonCommitted:(BOOL)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (a4)
  {
    v12 = 0;
  }
  else
  {
    v12 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"committed" equalToValue:MEMORY[0x1E4F1CC38]];
  }
  v13 = [v10 databaseForEntityClass:objc_opt_class()];
  id v14 = [a1 queryWithDatabase:v13 predicate:v12];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __126__HDSharedSummaryTransactionEntity_enumerateTransactionsWithDatabaseTransaction_includeNonCommitted_error_enumerationHandler___block_invoke;
  v18[3] = &unk_1E62F35F0;
  id v19 = v11;
  id v15 = v11;
  char v16 = [v14 enumeratePersistentIDsAndProperties:MEMORY[0x1E4F1CBF0] error:a5 enumerationHandler:v18];

  return v16;
}

uint64_t __126__HDSharedSummaryTransactionEntity_enumerateTransactionsWithDatabaseTransaction_includeNonCommitted_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [NSNumber numberWithLongLong:a2];
  id v4 = +[HDSQLiteEntity entityWithPersistentID:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return 1;
}

+ (id)transactionEntityWithUUID:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [a4 databaseForEntityClass:a1];
  id v10 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"uuid" equalToValue:v8];

  id v11 = [a1 anyInDatabase:v9 predicate:v10 error:a5];

  return v11;
}

+ (id)mostRecentTransactionCreationDateWithDatabaseTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [NSString alloc];
  id v8 = [a1 databaseTable];
  v9 = (void *)[v7 initWithFormat:@"SELECT MAX(%@) FROM %@", @"creation_date", v8];

  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__28;
  v18 = __Block_byref_object_dispose__28;
  id v19 = 0;
  id v10 = [v6 databaseForEntityClass:a1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __99__HDSharedSummaryTransactionEntity_mostRecentTransactionCreationDateWithDatabaseTransaction_error___block_invoke;
  v13[3] = &unk_1E62F3640;
  v13[4] = &v14;
  LOBYTE(a4) = [v10 executeSQL:v9 error:a4 bindingHandler:0 enumerationHandler:v13];

  if (a4) {
    id v11 = (id)v15[5];
  }
  else {
    id v11 = 0;
  }
  _Block_object_dispose(&v14, 8);

  return v11;
}

uint64_t __99__HDSharedSummaryTransactionEntity_mostRecentTransactionCreationDateWithDatabaseTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F30](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

+ (BOOL)deleteAllEntriesWithDatabaseTransaction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_opt_class();
  id v7 = [v5 protectedDatabase];

  id v8 = [v6 queryWithDatabase:v7 predicate:0];

  LOBYTE(a4) = [v8 deleteAllEntitiesWithError:a4];
  return (char)a4;
}

- (BOOL)deleteWithDatabaseTransaction:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v7 = *MEMORY[0x1E4F65C70];
  id v8 = NSNumber;
  id v9 = a3;
  id v10 = objc_msgSend(v8, "numberWithLongLong:", -[HDSQLiteEntity persistentID](self, "persistentID"));
  id v11 = [v6 predicateWithProperty:v7 equalToValue:v10];

  v12 = [v9 databaseForEntityClass:objc_opt_class()];

  LOBYTE(a4) = [(id)objc_opt_class() deleteEntitiesInDatabase:v12 predicate:v11 error:a4];
  return (char)a4;
}

- (id)uuidInDatabaseTransaction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 databaseForEntityClass:objc_opt_class()];

  uint64_t v7 = [(HDSQLiteEntity *)self UUIDForProperty:@"uuid" database:v6];

  return v7;
}

- (id)sourceDeviceIdentiferInDatabaseTransaction:(id)a3 error:(id *)a4
{
  return [(HDHealthEntity *)self stringForProperty:@"source_device" transaction:a3 error:a4];
}

- (BOOL)setCommitted:(BOOL)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = NSNumber;
  id v9 = a4;
  id v10 = [v8 numberWithBool:v6];
  LOBYTE(a5) = [(HDHealthEntity *)self setNumber:v10 forProperty:@"committed" transaction:v9 error:a5];

  return (char)a5;
}

- (BOOL)committedInDatabaseTransaction:(id)a3 error:(id *)a4
{
  uint64_t v4 = [(HDHealthEntity *)self numberForProperty:@"committed" transaction:a3 error:a4];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)creationDateInDatabaseTransaction:(id)a3 error:(id *)a4
{
  return [(HDHealthEntity *)self dateForProperty:@"creation_date" transaction:a3 error:a4];
}

- (BOOL)unit_testSetCreationDate:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  return [(HDHealthEntity *)self setDate:a3 forProperty:@"creation_date" transaction:a4 error:a5];
}

+ (id)pruneWithProfile:(id)a3 nowDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  id v11 = [v9 database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__HDSharedSummaryTransactionEntity_pruneWithProfile_nowDate_limit_error___block_invoke;
  v15[3] = &unk_1E62F6778;
  id v18 = a1;
  id v12 = v10;
  id v16 = v12;
  v17 = &v19;
  LODWORD(a6) = [a1 performWriteTransactionWithHealthDatabase:v11 error:a6 block:v15];

  if (a6)
  {
    v13 = [NSNumber numberWithInt:*((unsigned int *)v20 + 6)];
  }
  else
  {
    v13 = 0;
  }

  _Block_object_dispose(&v19, 8);

  return v13;
}

BOOL __73__HDSharedSummaryTransactionEntity_pruneWithProfile_nowDate_limit_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  BOOL v6 = [v5 databaseForEntityClass:objc_opt_class()];

  uint64_t v7 = [*(id *)(a1 + 32) dateByAddingTimeInterval:-1209600.0];
  id v8 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"committed" equalToValue:MEMORY[0x1E4F1CC28]];
  id v9 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"creation_date" lessThanValue:v7];
  id v10 = (void *)MEMORY[0x1E4F65D08];
  v20[0] = v8;
  v20[1] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  id v12 = [v10 predicateMatchingAllPredicates:v11];

  id v19 = 0;
  char v13 = [(id)objc_opt_class() deleteEntitiesInDatabase:v6 predicate:v12 error:&v19];
  id v14 = v19;
  id v15 = v14;
  if (v13)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 getChangesCount];
    BOOL v16 = 1;
  }
  else
  {
    id v17 = v14;
    BOOL v16 = v17 == 0;
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
  return v16;
}

@end