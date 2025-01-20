@interface HDAddHealthRecordsAccountCount
@end

@implementation HDAddHealthRecordsAccountCount

uint64_t ___HDAddHealthRecordsAccountCount_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t ___HDAddHealthRecordsAccountCount_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  v4 = [NSNumber numberWithInteger:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
  HDSQLiteBindFoundationValueToStatement();

  v5 = [MEMORY[0x1E4F1C9C8] date];
  HDSQLiteBindFoundationValueToStatement();

  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_int64 v6 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 7, v6);
}

@end