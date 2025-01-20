@interface HDMetadataValueStatement
+ (HDMetadataValueStatement)metadataValueStatementWithTransaction:(id)a3;
- (BOOL)enumerateResultsForObjectID:(int64_t)a3 error:(id *)a4 block:(id)a5;
- (HDDatabaseTransaction)transaction;
@end

@implementation HDMetadataValueStatement

- (BOOL)enumerateResultsForObjectID:(int64_t)a3 error:(id *)a4 block:(id)a5
{
  id v11 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__HDMetadataValueStatement_enumerateResultsForObjectID_error_block___block_invoke;
  v12[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v12[4] = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__HDMetadataValueStatement_enumerateResultsForObjectID_error_block___block_invoke_2;
  v10[3] = &unk_1E62F33D0;
  id v8 = v11;
  LOBYTE(a4) = [(HDSQLiteStatement *)self enumerateStatementWithError:a4 bindingHandler:v12 block:v10];

  return (char)a4;
}

uint64_t __68__HDMetadataValueStatement_enumerateResultsForObjectID_error_block___block_invoke_2(uint64_t a1, uint64_t a2)
{
  HDSQLiteColumnAsInt64();
  switch(HDSQLiteColumnAsInt64())
  {
    case 0:
      uint64_t v4 = MEMORY[0x1C1879F80](a2, 1);
      goto LABEL_8;
    case 1:
      uint64_t v4 = MEMORY[0x1C1879F70](a2, 2);
      goto LABEL_8;
    case 2:
      uint64_t v4 = MEMORY[0x1C1879F30](a2, 3);
      goto LABEL_8;
    case 3:
      double v6 = MEMORY[0x1C1879F40](a2, 2);
      v7 = MEMORY[0x1C1879F80](a2, 1);
      id v8 = (void *)MEMORY[0x1E4F2B370];
      v9 = [MEMORY[0x1E4F2B618] unitFromString:v7];
      v5 = [v8 quantityWithUnit:v9 doubleValue:v6];

      break;
    case 4:
      uint64_t v4 = MEMORY[0x1C1879F20](a2, 5);
LABEL_8:
      v5 = (void *)v4;
      break;
    default:
      v5 = 0;
      break;
  }
  uint64_t v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v10;
}

+ (HDMetadataValueStatement)metadataValueStatementWithTransaction:(id)a3
{
  id v4 = a3;
  v5 = [HDMetadataValueStatement alloc];
  id v6 = v4;
  if (v5)
  {
    v7 = NSString;
    id v8 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    v9 = [v7 stringWithFormat:@"SELECT %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ?", @"key_id", @"string_value", @"numerical_value", @"date_value", @"value_type", @"data_value", v8, @"object_id"];

    uint64_t v10 = [v6 databaseForEntityClass:objc_opt_class()];
    v14.receiver = v5;
    v14.super_class = (Class)HDMetadataValueStatement;
    id v11 = objc_msgSendSuper2(&v14, sel_initWithSQL_database_, v9, v10);

    if (v11) {
      objc_storeStrong(v11 + 3, a3);
    }
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }

  return (HDMetadataValueStatement *)v12;
}

uint64_t __68__HDMetadataValueStatement_enumerateResultsForObjectID_error_block___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

- (HDDatabaseTransaction)transaction
{
  return self->_transaction;
}

- (void).cxx_destruct
{
}

@end