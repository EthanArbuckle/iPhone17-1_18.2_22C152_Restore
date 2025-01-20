@interface CalDatabaseMigrateStoreToSeparateDB
@end

@implementation CalDatabaseMigrateStoreToSeparateDB

void ___CalDatabaseMigrateStoreToSeparateDB_block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(sqlite3_stmt **)(a2 + 8);
  id v3 = [*(id *)(a1 + 32) path];
  sqlite3_bind_text(v2, 1, (const char *)[v3 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t ___CalDatabaseMigrateStoreToSeparateDB_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return sqlite3_bind_int64(*(sqlite3_stmt **)(a2 + 8), 1, *(void *)(a1 + 32));
}

uint64_t ___CalDatabaseMigrateStoreToSeparateDB_block_invoke_3(uint64_t a1, uint64_t a2)
{
  v4 = *(sqlite3_stmt **)(a2 + 8);
  id v5 = [*(id *)(a1 + 32) path];
  sqlite3_bind_text(v4, 1, (const char *)[v5 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  v6 = *(sqlite3_stmt **)(a2 + 8);
  v7 = (const char *)[*(id *)(a1 + 40) UTF8String];
  return sqlite3_bind_text(v6, 2, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t ___CalDatabaseMigrateStoreToSeparateDB_block_invoke_63(uint64_t a1, uint64_t a2)
{
  sqlite3_bind_text(*(sqlite3_stmt **)(a2 + 8), 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  id v3 = *(sqlite3_stmt **)(a2 + 8);
  int ID = CPRecordGetID();
  return sqlite3_bind_int(v3, 2, ID);
}

@end