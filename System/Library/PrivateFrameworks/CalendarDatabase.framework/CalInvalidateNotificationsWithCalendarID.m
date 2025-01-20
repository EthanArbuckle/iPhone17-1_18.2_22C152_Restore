@interface CalInvalidateNotificationsWithCalendarID
@end

@implementation CalInvalidateNotificationsWithCalendarID

BOOL ___CalInvalidateNotificationsWithCalendarID_block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 32);
  if (a2)
  {
    if (CDBLockingAssertionsEnabled)
    {
      if (CPRecordGetStore())
      {
        Context = (const os_unfair_lock *)CPRecordStoreGetContext();
        if (Context) {
          os_unfair_lock_assert_owner(Context + 20);
        }
      }
    }
  }
  return v2 == CPRecordGetProperty();
}

@end