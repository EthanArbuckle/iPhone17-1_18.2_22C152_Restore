@interface CalDatabasePerformStatementWithWriteLock
@end

@implementation CalDatabasePerformStatementWithWriteLock

uint64_t ___CalDatabasePerformStatementWithWriteLock_block_invoke(uint64_t a1)
{
  v2 = *(uint64_t ***)(a1 + 40);
  if (CDBLockingAssertionsEnabled) {
    BOOL v3 = v2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    if (*v2)
    {
      uint64_t v4 = **v2;
      if (v4)
      {
        if (*(void *)(v4 + 104))
        {
          Context = (const os_unfair_lock *)CPRecordStoreGetContext();
          if (Context) {
            os_unfair_lock_assert_owner(Context + 20);
          }
        }
      }
    }
  }
  uint64_t result = CPSqliteStatementPerform();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end