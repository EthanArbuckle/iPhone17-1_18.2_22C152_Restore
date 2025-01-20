@interface HDWorkoutBuilderAssociatedObjectEntity
+ (BOOL)enumerateAssociatedUUIDsForBuilder:(id)a3 transaction:(id)a4 error:(id *)a5 block:(id)a6;
+ (BOOL)removeAssociationFromBuilder:(id)a3 toUUID:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)uniquedColumns;
+ (int64_t)associateObject:(id)a3 timestamp:(double)a4 withBuilder:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (int64_t)protectionClass;
@end

@implementation HDWorkoutBuilderAssociatedObjectEntity

+ (int64_t)associateObject:(id)a3 timestamp:(double)a4 withBuilder:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a5;
  v13 = [a6 databaseForEntityClass:a1];
  id v26 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __98__HDWorkoutBuilderAssociatedObjectEntity_associateObject_timestamp_withBuilder_transaction_error___block_invoke;
  v25[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v25[4] = a1;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __98__HDWorkoutBuilderAssociatedObjectEntity_associateObject_timestamp_withBuilder_transaction_error___block_invoke_2;
  v21[3] = &unk_1E62F9A10;
  id v14 = v12;
  id v22 = v14;
  id v15 = v11;
  id v23 = v15;
  double v24 = a4;
  char v16 = [v13 executeCachedStatementForKey:&associateObject_timestamp_withBuilder_transaction_error__insertKey error:&v26 SQLGenerator:v25 bindingHandler:v21 enumerationHandler:0];
  id v17 = v26;
  v18 = v17;
  if (v16)
  {
    int64_t v19 = 1;
  }
  else if (objc_msgSend(v17, "hd_isConstraintViolation"))
  {
    int64_t v19 = 2;
  }
  else
  {
    int64_t v19 = 0;
  }

  return v19;
}

id __98__HDWorkoutBuilderAssociatedObjectEntity_associateObject_timestamp_withBuilder_transaction_error___block_invoke(uint64_t a1)
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v5[0] = @"workout_builder_id";
  v5[1] = @"object_uuid";
  v5[2] = @"timestamp";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  v3 = [v1 insertSQLForProperties:v2 shouldReplace:0];

  return v3;
}

uint64_t __98__HDWorkoutBuilderAssociatedObjectEntity_associateObject_timestamp_withBuilder_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) persistentID]);
  v4 = [*(id *)(a1 + 40) UUID];
  HDSQLiteBindFoundationValueToStatement();

  double v5 = *(double *)(a1 + 48);

  return sqlite3_bind_double(a2, 3, v5);
}

+ (BOOL)enumerateAssociatedUUIDsForBuilder:(id)a3 transaction:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [a4 databaseForEntityClass:a1];
  id v19 = v10;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __101__HDWorkoutBuilderAssociatedObjectEntity_enumerateAssociatedUUIDsForBuilder_transaction_error_block___block_invoke;
  v20[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v20[4] = a1;
  id v17 = v11;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__HDWorkoutBuilderAssociatedObjectEntity_enumerateAssociatedUUIDsForBuilder_transaction_error_block___block_invoke_2;
  v18[3] = &unk_1E62F43C8;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __101__HDWorkoutBuilderAssociatedObjectEntity_enumerateAssociatedUUIDsForBuilder_transaction_error_block___block_invoke_3;
  v16[3] = &unk_1E62F33D0;
  id v13 = v11;
  id v14 = v10;
  LOBYTE(a5) = [v12 executeCachedStatementForKey:&enumerateAssociatedUUIDsForBuilder_transaction_error_block__enumerationKey error:a5 SQLGenerator:v20 bindingHandler:v18 enumerationHandler:v16];

  return (char)a5;
}

id __101__HDWorkoutBuilderAssociatedObjectEntity_enumerateAssociatedUUIDsForBuilder_transaction_error_block___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"SELECT DISTINCT %@ FROM %@ WHERE %@ = ?", @"object_uuid", v2, @"workout_builder_id", 0];

  return v3;
}

uint64_t __101__HDWorkoutBuilderAssociatedObjectEntity_enumerateAssociatedUUIDsForBuilder_transaction_error_block___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) persistentID];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __101__HDWorkoutBuilderAssociatedObjectEntity_enumerateAssociatedUUIDsForBuilder_transaction_error_block___block_invoke_3(uint64_t a1)
{
  id v3 = *(id *)(a1 + 32);
  uint64_t v1 = HKWithAutoreleasePool();

  return v1;
}

uint64_t __101__HDWorkoutBuilderAssociatedObjectEntity_enumerateAssociatedUUIDsForBuilder_transaction_error_block___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = MEMORY[0x1C1879F90](*(void *)(a1 + 40), 0);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v4, a2);

  return v5;
}

+ (BOOL)removeAssociationFromBuilder:(id)a3 toUUID:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = NSString;
  id v13 = a5;
  id v14 = [a1 disambiguatedDatabaseTable];
  id v15 = [v12 stringWithFormat:@"DELETE FROM %@ WHERE %@ = ? AND %@ = ?", v14, @"workout_builder_id", @"object_uuid"];

  char v16 = [v13 databaseForEntityClass:a1];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __96__HDWorkoutBuilderAssociatedObjectEntity_removeAssociationFromBuilder_toUUID_transaction_error___block_invoke;
  v20[3] = &unk_1E62F2900;
  id v21 = v10;
  id v22 = v11;
  id v17 = v11;
  id v18 = v10;
  LOBYTE(a6) = [v16 executeSQL:v15 error:a6 bindingHandler:v20 enumerationHandler:0];

  return (char)a6;
}

uint64_t __96__HDWorkoutBuilderAssociatedObjectEntity_removeAssociationFromBuilder_toUUID_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) persistentID]);

  return HDSQLiteBindFoundationValueToStatement();
}

+ (id)databaseTable
{
  return @"workout_builder_associated_objects";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_57;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"workout_builder_id";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)uniquedColumns
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"workout_builder_id";
  v4[1] = @"object_uuid";
  v4[2] = @"timestamp";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

+ (int64_t)protectionClass
{
  return 1;
}

@end