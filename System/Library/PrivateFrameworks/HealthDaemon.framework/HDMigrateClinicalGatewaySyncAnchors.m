@interface HDMigrateClinicalGatewaySyncAnchors
@end

@implementation HDMigrateClinicalGatewaySyncAnchors

uint64_t ___HDMigrateClinicalGatewaySyncAnchors_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t ___HDMigrateClinicalGatewaySyncAnchors_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

uint64_t ___HDMigrateClinicalGatewaySyncAnchors_block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t ___HDMigrateClinicalGatewaySyncAnchors_block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  sqlite3_bind_double(a2, 2, v4);
  sqlite3_int64 v5 = *(void *)(a1 + 48);

  return sqlite3_bind_int64(a2, 3, v5);
}

@end