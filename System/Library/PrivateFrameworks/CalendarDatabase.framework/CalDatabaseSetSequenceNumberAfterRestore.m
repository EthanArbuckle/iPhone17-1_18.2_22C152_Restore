@interface CalDatabaseSetSequenceNumberAfterRestore
@end

@implementation CalDatabaseSetSequenceNumberAfterRestore

uint64_t ___CalDatabaseSetSequenceNumberAfterRestore_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (CDBLockingAssertionsEnabled) {
    BOOL v2 = v1 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2)
  {
    if (*(void *)v1)
    {
      if (*(void *)(*(void *)v1 + 104))
      {
        Context = (const os_unfair_lock *)CPRecordStoreGetContext();
        if (Context) {
          os_unfair_lock_assert_owner(Context + 20);
        }
      }
    }
  }
  return CPSqliteConnectionSetIntegerForProperty();
}

@end