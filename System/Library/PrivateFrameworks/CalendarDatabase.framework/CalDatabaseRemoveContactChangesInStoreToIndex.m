@interface CalDatabaseRemoveContactChangesInStoreToIndex
@end

@implementation CalDatabaseRemoveContactChangesInStoreToIndex

uint64_t ___CalDatabaseRemoveContactChangesInStoreToIndex_block_invoke(uint64_t a1)
{
  uint64_t RecordStore = _CalDatabaseGetRecordStore(*(void *)(a1 + 40));
  if (CDBLockingAssertionsEnabled) {
    BOOL v3 = RecordStore == 0;
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
  uint64_t result = CPRecordStoreDeleteChangesForClassToIndexWhere();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end