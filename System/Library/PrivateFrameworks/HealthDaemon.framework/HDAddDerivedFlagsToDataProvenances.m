@interface HDAddDerivedFlagsToDataProvenances
@end

@implementation HDAddDerivedFlagsToDataProvenances

uint64_t ___HDAddDerivedFlagsToDataProvenances_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = HDSQLiteColumnAsInt64();
  uint64_t v6 = HDSQLiteColumnAsInt64();
  v7 = [*(id *)(a1 + 32) unprotectedDatabase];
  uint64_t v8 = *(void *)(a1 + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = ___HDAddDerivedFlagsToDataProvenances_block_invoke_2;
  v15[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v15[4] = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___HDAddDerivedFlagsToDataProvenances_block_invoke_3;
  v11[3] = &unk_1E62F9D90;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 48);
  uint64_t v14 = v5;
  uint64_t v9 = [v7 executeSQL:v8 error:a3 bindingHandler:v15 enumerationHandler:v11];

  return v9;
}

uint64_t ___HDAddDerivedFlagsToDataProvenances_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t ___HDAddDerivedFlagsToDataProvenances_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = MEMORY[0x1C1879F00](a2, 0);
  uint64_t v6 = [*(id *)(a1 + 32) protectedDatabase];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___HDAddDerivedFlagsToDataProvenances_block_invoke_4;
  v11[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  void v11[4] = v5;
  v11[5] = v8;
  uint64_t v9 = [v6 executeSQL:v7 error:a3 bindingHandler:v11 enumerationHandler:0];

  return v9;
}

uint64_t ___HDAddDerivedFlagsToDataProvenances_block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

@end