@interface CalDatabaseGetImageWithIdentifierInStoreID
@end

@implementation CalDatabaseGetImageWithIdentifierInStoreID

uint64_t ___CalDatabaseGetImageWithIdentifierInStoreID_block_invoke(uint64_t a1, uint64_t a2)
{
  sqlite3_bind_int64(*(sqlite3_stmt **)(a2 + 8), 1, *(void *)(a1 + 32));
  v4 = *(sqlite3_stmt **)(a2 + 8);
  v5 = (const char *)[*(id *)(a1 + 40) UTF8String];
  return sqlite3_bind_text(v4, 2, v5, -1, 0);
}

@end