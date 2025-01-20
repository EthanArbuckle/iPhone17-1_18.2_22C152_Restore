@interface HDFixLapLengthColumnInActivitiesTable
@end

@implementation HDFixLapLengthColumnInActivitiesTable

uint64_t ___HDFixLapLengthColumnInActivitiesTable_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = 1;
  v6 = MEMORY[0x1C1879F20](a2, 1);
  if (v6)
  {
    id v14 = 0;
    v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v14];
    id v8 = v14;
    if (v7)
    {

      uint64_t v5 = 1;
    }
    else
    {
      uint64_t v9 = HDSQLiteColumnAsInt64();
      v11 = *(void **)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = ___HDFixLapLengthColumnInActivitiesTable_block_invoke_2;
      v13[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
      v13[4] = v9;
      uint64_t v5 = [v11 executeSQL:v10 error:a3 bindingHandler:v13 enumerationHandler:0];
    }
  }
  return v5;
}

uint64_t ___HDFixLapLengthColumnInActivitiesTable_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

@end