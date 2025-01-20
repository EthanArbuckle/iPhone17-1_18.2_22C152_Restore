@interface AFPreferencesNotificationCenterSharedLock
@end

@implementation AFPreferencesNotificationCenterSharedLock

void ___AFPreferencesNotificationCenterSharedLock_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  v1 = (void *)_AFPreferencesNotificationCenterSharedLock_sharedLock;
  _AFPreferencesNotificationCenterSharedLock_sharedLock = (uint64_t)v0;
}

@end