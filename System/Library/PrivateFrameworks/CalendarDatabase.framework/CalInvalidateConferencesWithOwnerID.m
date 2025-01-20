@interface CalInvalidateConferencesWithOwnerID
@end

@implementation CalInvalidateConferencesWithOwnerID

BOOL ___CalInvalidateConferencesWithOwnerID_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
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
  int Property = CPRecordGetProperty();
  if (v2 == Property)
  {
    v5 = (void *)CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEBUG))
    {
      v6 = v5;
      v8[0] = 67109120;
      v8[1] = CPRecordGetID();
      _os_log_impl(&dword_1A8E81000, v6, OS_LOG_TYPE_DEBUG, "INV: Invalidating conference %d", (uint8_t *)v8, 8u);
    }
  }
  return v2 == Property;
}

@end