@interface HDNotificationInstructionEntity
+ (BOOL)attemptProtectedReadTransactionWithUnprotectedFallbackWithHealthDatabase:(id)a3 error:(id *)a4 block:(id)a5;
+ (BOOL)enumerateAllNotificationInstructionsWithTransaction:(id)a3 predicate:(id)a4 limit:(unint64_t)a5 ascending:(BOOL)a6 error:(id *)a7 enumerationHandler:(id)a8;
+ (BOOL)enumerateNotificationInstructionsWithClientIdentifier:(id)a3 action:(int64_t)a4 notExpiredBeforeDate:(id)a5 transaction:(id)a6 error:(id *)a7 enumerationHandler:(id)a8;
+ (BOOL)enumerateNotificationInstructionsWithSetCriteriaNotExpiredBeforeDate:(id)a3 transaction:(id)a4 limit:(unint64_t)a5 error:(id *)a6 enumerationHandler:(id)a7;
+ (BOOL)insertOrIgnoreNotificationInstruction:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (BOOL)invalidateNotificationInstructionWithMessageIdentifier:(id)a3 modificationDate:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)obliterateNotificationInstructionsWithTransaction:(id)a3 error:(id *)a4;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)pruneWithProfile:(id)a3 nowDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6;
+ (int64_t)protectionClass;
@end

@implementation HDNotificationInstructionEntity

+ (BOOL)attemptProtectedReadTransactionWithUnprotectedFallbackWithHealthDatabase:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = +[HDHealthEntity transactionContextForWriting:0 baseContext:0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __120__HDNotificationInstructionEntity_attemptProtectedReadTransactionWithUnprotectedFallbackWithHealthDatabase_error_block___block_invoke;
  v14[3] = &unk_1E62FEC08;
  id v16 = v9;
  id v17 = a1;
  id v15 = v8;
  id v11 = v9;
  id v12 = v8;
  LOBYTE(a4) = [v12 performTransactionWithContext:v10 error:a4 block:v11 inaccessibilityHandler:v14];

  return (char)a4;
}

uint64_t __120__HDNotificationInstructionEntity_attemptProtectedReadTransactionWithUnprotectedFallbackWithHealthDatabase_error_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  v6 = [*(id *)(a1 + 48) transactionContextForWriting:0 baseContext:0];
  uint64_t v7 = [v5 performTransactionWithContext:v6 error:a3 block:*(void *)(a1 + 40) inaccessibilityHandler:0];

  return v7;
}

+ (BOOL)enumerateNotificationInstructionsWithClientIdentifier:(id)a3 action:(int64_t)a4 notExpiredBeforeDate:(id)a5 transaction:(id)a6 error:(id *)a7 enumerationHandler:(id)a8
{
  v29[4] = *MEMORY[0x1E4F143B8];
  v26 = (void *)MEMORY[0x1E4F65D08];
  id v12 = (void *)MEMORY[0x1E4F65D00];
  v13 = NSNumber;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a3;
  v18 = [v13 numberWithInteger:a4];
  v19 = [v12 predicateWithProperty:@"action" equalToValue:v18];
  v29[0] = v19;
  v20 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"client_identifier" equalToValue:v17];

  v29[1] = v20;
  v21 = HDNotificationInstructionPredicateForIsValid(1);
  v29[2] = v21;
  v22 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"expiration_date" greaterThanOrEqualToValue:v16];

  v29[3] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  v24 = [v26 predicateMatchingAllPredicates:v23];

  LOBYTE(v21) = [a1 enumerateAllNotificationInstructionsWithTransaction:v15 predicate:v24 limit:0 ascending:1 error:a7 enumerationHandler:v14];
  return (char)v21;
}

+ (BOOL)enumerateNotificationInstructionsWithSetCriteriaNotExpiredBeforeDate:(id)a3 transaction:(id)a4 limit:(unint64_t)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v12 = (void *)MEMORY[0x1E4F65D08];
  v13 = (void *)MEMORY[0x1E4F65D48];
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v13 isNotNullPredicateWithProperty:@"criteria"];
  v18 = HDNotificationInstructionPredicateForIsValid(1);
  v19 = objc_msgSend(MEMORY[0x1E4F65D00], "predicateWithProperty:greaterThanOrEqualToValue:", @"expiration_date", v16, v17, v18);

  v23[2] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  v21 = [v12 predicateMatchingAllPredicates:v20];

  LOBYTE(a6) = [a1 enumerateAllNotificationInstructionsWithTransaction:v15 predicate:v21 limit:a5 ascending:1 error:a6 enumerationHandler:v14];
  return (char)a6;
}

+ (BOOL)enumerateAllNotificationInstructionsWithTransaction:(id)a3 predicate:(id)a4 limit:(unint64_t)a5 ascending:(BOOL)a6 error:(id *)a7 enumerationHandler:(id)a8
{
  BOOL v9 = a6;
  v27[12] = *MEMORY[0x1E4F143B8];
  id v14 = a8;
  id v15 = a4;
  id v16 = [a3 databaseForEntityClass:a1];
  id v17 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:*MEMORY[0x1E4F65C70] entityClass:a1 ascending:v9];
  v26 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v19 = [a1 queryWithDatabase:v16 predicate:v15 limit:a5 orderingTerms:v18 groupBy:0];

  v27[0] = @"action";
  v27[1] = @"category_identifier";
  v27[2] = @"client_identifier";
  v27[3] = @"criteria";
  v27[4] = @"creation_date";
  v27[5] = @"expiration_date";
  v27[6] = @"is_invalid";
  v27[7] = @"message_identifier";
  v27[8] = @"modification_date";
  v27[9] = @"received_date";
  v27[10] = @"sending_device_info";
  v27[11] = @"sending_device_name";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:12];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __138__HDNotificationInstructionEntity_enumerateAllNotificationInstructionsWithTransaction_predicate_limit_ascending_error_enumerationHandler___block_invoke;
  v23[3] = &unk_1E62F87F8;
  id v24 = v14;
  id v25 = a1;
  id v21 = v14;
  LOBYTE(a7) = [v19 enumerateProperties:v20 error:a7 enumerationHandler:v23];

  return (char)a7;
}

uint64_t __138__HDNotificationInstructionEntity_enumerateAllNotificationInstructionsWithTransaction_predicate_limit_ascending_error_enumerationHandler___block_invoke(uint64_t a1)
{
  self;
  uint64_t v17 = HDSQLiteColumnWithNameAsInt64();
  id v16 = HDSQLiteColumnWithNameAsString();
  id v15 = HDSQLiteColumnWithNameAsString();
  uint64_t v1 = HDSQLiteColumnWithNameAsDate();
  objc_opt_class();
  id v14 = HDSQLiteColumnWithNameAsObject();
  v2 = HDSQLiteColumnWithNameAsDate();
  char v3 = HDSQLiteColumnWithNameAsBoolean();
  v4 = HDSQLiteColumnWithNameAsString();
  v5 = HDSQLiteColumnWithNameAsDate();
  v6 = HDSQLiteColumnWithNameAsDate();
  uint64_t v7 = HDSQLiteColumnWithNameAsString();
  id v8 = HDSQLiteColumnWithNameAsString();
  LOBYTE(v13) = v3;
  BOOL v9 = (void *)v1;
  v10 = [[HDNotificationInstruction alloc] initWithMessageIdentifier:v4 creationDate:v1 receivedDate:v6 modificationDate:v5 sendingDeviceName:v8 sendingDeviceInfo:v7 action:v17 clientIdentifier:v15 categoryIdentifier:v16 expirationDate:v2 criteria:v14 isInvalid:v13];

  uint64_t v11 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  return v11;
}

+ (BOOL)insertOrIgnoreNotificationInstruction:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  BOOL v9 = [a4 databaseForEntityClass:a1];
  id v13 = v8;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__HDNotificationInstructionEntity_insertOrIgnoreNotificationInstruction_transaction_error___block_invoke;
  v14[3] = &__block_descriptor_40_e15___NSString_8__0l;
  void v14[4] = a1;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__HDNotificationInstructionEntity_insertOrIgnoreNotificationInstruction_transaction_error___block_invoke_2;
  v12[3] = &unk_1E62F43C8;
  id v10 = v8;
  LOBYTE(a5) = [v9 executeCachedStatementForKey:&insertOrIgnoreNotificationInstruction_transaction_error__lookupKey error:a5 SQLGenerator:v14 bindingHandler:v12 enumerationHandler:0];

  return (char)a5;
}

id __91__HDNotificationInstructionEntity_insertOrIgnoreNotificationInstruction_transaction_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  char v3 = [v1 stringWithFormat:@"INSERT OR IGNORE INTO %@ (%@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", v2, @"action", @"category_identifier", @"client_identifier", @"creation_date", @"criteria", @"expiration_date", @"is_invalid", @"message_identifier", @"modification_date", @"received_date", @"sending_device_info", @"sending_device_name"];

  return v3;
}

void __91__HDNotificationInstructionEntity_insertOrIgnoreNotificationInstruction_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  v4 = [*(id *)(a1 + 32) criteria];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F28DB0];
    v6 = [*(id *)(a1 + 32) criteria];
    id v16 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
  }
  else
  {
    id v16 = 0;
  }

  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) action]);
  uint64_t v7 = [*(id *)(a1 + 32) categoryIdentifier];
  HDSQLiteBindFoundationValueToStatement();

  id v8 = [*(id *)(a1 + 32) clientIdentifier];
  HDSQLiteBindFoundationValueToStatement();

  BOOL v9 = [*(id *)(a1 + 32) creationDate];
  HDSQLiteBindFoundationValueToStatement();

  HDSQLiteBindFoundationValueToStatement();
  id v10 = [*(id *)(a1 + 32) expirationDate];
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int(a2, 7, [*(id *)(a1 + 32) isInvalid]);
  uint64_t v11 = [*(id *)(a1 + 32) messageIdentifier];
  HDSQLiteBindFoundationValueToStatement();

  id v12 = [*(id *)(a1 + 32) modificationDate];
  HDSQLiteBindFoundationValueToStatement();

  id v13 = [*(id *)(a1 + 32) receivedDate];
  HDSQLiteBindFoundationValueToStatement();

  id v14 = [*(id *)(a1 + 32) sendingDeviceInfo];
  HDSQLiteBindFoundationValueToStatement();

  id v15 = [*(id *)(a1 + 32) sendingDeviceName];
  HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)invalidateNotificationInstructionWithMessageIdentifier:(id)a3 modificationDate:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [a5 databaseForEntityClass:a1];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __125__HDNotificationInstructionEntity_invalidateNotificationInstructionWithMessageIdentifier_modificationDate_transaction_error___block_invoke;
  v19[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v19[4] = a1;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __125__HDNotificationInstructionEntity_invalidateNotificationInstructionWithMessageIdentifier_modificationDate_transaction_error___block_invoke_2;
  v16[3] = &unk_1E62F2900;
  id v17 = v11;
  id v18 = v10;
  id v13 = v10;
  id v14 = v11;
  LOBYTE(a6) = [v12 executeCachedStatementForKey:&invalidateNotificationInstructionWithMessageIdentifier_modificationDate_transaction_error__lookupKey error:a6 SQLGenerator:v19 bindingHandler:v16 enumerationHandler:0];

  return (char)a6;
}

id __125__HDNotificationInstructionEntity_invalidateNotificationInstructionWithMessageIdentifier_modificationDate_transaction_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  char v3 = [v1 stringWithFormat:@"UPDATE %@ SET %@ = ?, %@ = ? WHERE %@ = ?", v2, @"is_invalid", @"modification_date", @"message_identifier"];

  return v3;
}

uint64_t __125__HDNotificationInstructionEntity_invalidateNotificationInstructionWithMessageIdentifier_modificationDate_transaction_error___block_invoke_2(int a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, 1);
  HDSQLiteBindFoundationValueToStatement();

  return HDSQLiteBindStringToStatement();
}

+ (BOOL)obliterateNotificationInstructionsWithTransaction:(id)a3 error:(id *)a4
{
  uint64_t v7 = [a3 databaseForEntityClass:a1];
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HDNotificationInstructionEntity.m", 247, @"Invalid parameter not satisfying: %@", @"database != nil" object file lineNumber description];
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F65D68]);
  [v8 setEntityClass:a1];
  [v8 setLimitCount:*MEMORY[0x1E4F65DE0]];
  BOOL v9 = (void *)[objc_alloc(MEMORY[0x1E4F65D60]) initWithDatabase:v7 descriptor:v8];
  char v10 = [v9 deleteAllEntitiesWithError:a4];

  return v10;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)databaseTable
{
  return @"notification_instructions";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 13;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_46;
}

+ (id)pruneWithProfile:(id)a3 nowDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
  id v13 = [v12 dateByAddingUnit:0x2000 value:-1 toDate:v11 options:0];

  id v14 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"expiration_date" lessThanValue:v13];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v30 = 0;
  id v15 = [v10 database];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __72__HDNotificationInstructionEntity_pruneWithProfile_nowDate_limit_error___block_invoke;
  v22 = &unk_1E62FE6C8;
  id v25 = a1;
  id v16 = v14;
  unint64_t v26 = a5;
  id v23 = v16;
  id v24 = &v27;
  LODWORD(a6) = [a1 performWriteTransactionWithHealthDatabase:v15 error:a6 block:&v19];

  if (a6)
  {
    id v17 = objc_msgSend(NSNumber, "numberWithInt:", *((unsigned int *)v28 + 6), v19, v20, v21, v22);
  }
  else
  {
    id v17 = 0;
  }

  _Block_object_dispose(&v27, 8);

  return v17;
}

uint64_t __72__HDNotificationInstructionEntity_pruneWithProfile_nowDate_limit_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v5 = [a2 databaseForEntityClass:a1[6]];
  uint64_t v6 = a1[4];
  uint64_t v7 = (void *)a1[6];
  uint64_t v8 = a1[7];
  BOOL v9 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:*MEMORY[0x1E4F65C70] entityClass:v7 ascending:1];
  v14[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v11 = [v7 queryWithDatabase:v5 predicate:v6 limit:v8 orderingTerms:v10 groupBy:0];

  uint64_t v12 = [v11 deleteAllEntitiesWithError:a3];
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = [v5 getChangesCount];

  return v12;
}

@end