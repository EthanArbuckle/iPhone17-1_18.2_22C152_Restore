@interface CalDatabaseCopyOfAllAttachmentFilesInStore
@end

@implementation CalDatabaseCopyOfAllAttachmentFilesInStore

uint64_t ___CalDatabaseCopyOfAllAttachmentFilesInStore_block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32))
  {
    v2 = *(sqlite3_stmt **)(a2 + 8);
    if (CDBLockingAssertionsEnabled) {
      BOOL v3 = *(void *)(result + 40) == 0;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3)
    {
      Context = (const os_unfair_lock *)CPRecordStoreGetContext();
      if (Context) {
        os_unfair_lock_assert_owner(Context + 20);
      }
    }
    CPRecordGetID();
    sqlite3_int64 RowidForRecordID = CPRecordStoreGetRowidForRecordID();
    return sqlite3_bind_int64(v2, 1, RowidForRecordID);
  }
  return result;
}

@end