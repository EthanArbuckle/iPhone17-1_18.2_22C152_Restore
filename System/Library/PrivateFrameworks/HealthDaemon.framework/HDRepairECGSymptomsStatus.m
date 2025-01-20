@interface HDRepairECGSymptomsStatus
@end

@implementation HDRepairECGSymptomsStatus

uint64_t ___HDRepairECGSymptomsStatus_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = HDSQLiteColumnAsInt64();
  unsigned __int8 IsNonNull = HDSQLiteColumnIsNonNull();
  uint64_t v7 = HDSQLiteColumnAsInt64();
  if ((IsNonNull & (v7 < 2)) != 0) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 2;
  }
  v9 = [*(id *)(a1 + 32) protectedDatabase];
  uint64_t v10 = *(void *)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = ___HDRepairECGSymptomsStatus_block_invoke_2;
  v13[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v13[4] = v8;
  v13[5] = v5;
  uint64_t v11 = [v9 executeSQL:v10 error:a3 bindingHandler:v13 enumerationHandler:0];

  return v11;
}

uint64_t ___HDRepairECGSymptomsStatus_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

@end