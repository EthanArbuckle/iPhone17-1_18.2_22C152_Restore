@interface SYSharedServiceDB
@end

@implementation SYSharedServiceDB

uint64_t __32___SYSharedServiceDB_initialize__block_invoke()
{
  return +[_SYSharedServiceDB pairingStorePathWasReset];
}

uint64_t __48___SYSharedServiceDB__ensureSchemaVersionsTable__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_LOCKED_ensureSchemaVersionsTableInDB:", a2);
}

uint64_t __44___SYSharedServiceDB__LOCKED_ensureDBExists__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_LOCKED_runSchemaUpdate:forClientNamed:", a3, a2);
}

const char *__46___SYSharedServiceDB_UnitTestHelpers___dbPath__block_invoke(uint64_t a1, sqlite3 *db)
{
  result = sqlite3_db_filename(db, "main");
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [[NSString alloc] initWithUTF8String:result];
    return (const char *)MEMORY[0x270F9A758]();
  }
  return result;
}

@end