@interface HDAdvanceUDCSyncAnchors
@end

@implementation HDAdvanceUDCSyncAnchors

uint64_t ___HDAdvanceUDCSyncAnchors_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t ___HDAdvanceUDCSyncAnchors_block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t ___HDAdvanceUDCSyncAnchors_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = HDSQLiteColumnAsInt64();
  v6 = [*(id *)(a1 + 32) protectedDatabase];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___HDAdvanceUDCSyncAnchors_block_invoke_4;
  v10[3] = &unk_1E62F59C8;
  id v11 = *(id *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___HDAdvanceUDCSyncAnchors_block_invoke_5;
  v9[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v9[4] = *(void *)(a1 + 48);
  v9[5] = v5;
  uint64_t v7 = [v6 executeCachedStatementForKey:&_HDAdvanceUDCSyncAnchors_statementKey error:a3 SQLGenerator:v10 bindingHandler:v9 enumerationHandler:0];

  return v7;
}

id ___HDAdvanceUDCSyncAnchors_block_invoke_4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t ___HDAdvanceUDCSyncAnchors_block_invoke_5(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

@end