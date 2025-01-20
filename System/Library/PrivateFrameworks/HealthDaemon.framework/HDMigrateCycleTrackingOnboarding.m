@interface HDMigrateCycleTrackingOnboarding
@end

@implementation HDMigrateCycleTrackingOnboarding

uint64_t ___HDMigrateCycleTrackingOnboarding_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F70](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

uint64_t ___HDMigrateCycleTrackingOnboarding_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F30](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

uint64_t ___HDMigrateCycleTrackingOnboarding_block_invoke_951(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = MEMORY[0x1C1879F30](a2, 0);
  [v2 addObject:v3];

  return 1;
}

BOOL ___HDMigrateCycleTrackingOnboarding_block_invoke_2_952(uint64_t a1, void *a2)
{
  [a2 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  return fabs(v2) < 1.0;
}

uint64_t ___HDMigrateCycleTrackingOnboarding_block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
  HDSQLiteBindFoundationValueToStatement();

  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 3, 1);
  HDSQLiteBindFoundationValueToStatement();
  v5 = [MEMORY[0x1E4F1C9C8] date];
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int(a2, 6, 0);
  sqlite3_bind_int64(a2, 7, 0);
  sqlite3_int64 v6 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 8, v6);
}

@end