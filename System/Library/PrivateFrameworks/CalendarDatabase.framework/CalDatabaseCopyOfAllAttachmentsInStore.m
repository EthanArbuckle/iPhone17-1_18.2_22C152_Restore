@interface CalDatabaseCopyOfAllAttachmentsInStore
@end

@implementation CalDatabaseCopyOfAllAttachmentsInStore

uint64_t ___CalDatabaseCopyOfAllAttachmentsInStore_block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(sqlite3_stmt **)(a2 + 8);
  int ID = CPRecordGetID();
  return sqlite3_bind_int(v2, 1, ID);
}

@end