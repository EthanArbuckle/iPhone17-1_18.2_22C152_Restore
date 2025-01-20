@interface CalDatabaseGetChangedObjectIDsSinceSequenceNumberForClient
@end

@implementation CalDatabaseGetChangedObjectIDsSinceSequenceNumberForClient

void ___CalDatabaseGetChangedObjectIDsSinceSequenceNumberForClient_block_invoke(uint64_t a1, uint64_t a2, int a3, int a4, void *a5)
{
  id v8 = a5;
  v9 = (id *)(a1 + 40);
  v10 = (id *)(a1 + 56);
  if (a4) {
    v10 = (id *)(a1 + 48);
  }
  if (a3 == 6) {
    v10 = (id *)(a1 + 32);
  }
  if (a3 != 26) {
    v9 = v10;
  }
  id v11 = *v9;
  uint64_t RecordStore = _CalDatabaseGetRecordStore(*(void *)(a1 + 88));
  if (CDBLockingAssertionsEnabled) {
    BOOL v13 = RecordStore == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    Context = (const os_unfair_lock *)CPRecordStoreGetContext();
    if (Context) {
      os_unfair_lock_assert_owner(Context + 20);
    }
  }
  CPRecordStoreGetChangesForClassWithBindBlockAndProperties();
}

@end