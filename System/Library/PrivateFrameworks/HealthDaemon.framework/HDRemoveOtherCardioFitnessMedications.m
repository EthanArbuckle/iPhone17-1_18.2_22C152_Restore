@interface HDRemoveOtherCardioFitnessMedications
@end

@implementation HDRemoveOtherCardioFitnessMedications

uint64_t ___HDRemoveOtherCardioFitnessMedications_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return (*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >> 2) & 1;
}

uint64_t ___HDRemoveOtherCardioFitnessMedications_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];

  return sqlite3_bind_double(a2, 2, v4);
}

@end