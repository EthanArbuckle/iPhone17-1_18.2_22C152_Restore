@interface PASSqliteDatabase
@end

@implementation PASSqliteDatabase

uint64_t __73___PASSqliteDatabase_ATXExtras__atx_countRowsOfTable_returnValueOnError___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __73___PASSqliteDatabase_ATXExtras__atx_countRowsOfTable_returnValueOnError___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(void *)(a1 + 40);
  return *MEMORY[0x1E4F93C10];
}

@end