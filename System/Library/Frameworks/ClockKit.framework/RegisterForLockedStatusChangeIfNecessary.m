@interface RegisterForLockedStatusChangeIfNecessary
@end

@implementation RegisterForLockedStatusChangeIfNecessary

uint64_t ___RegisterForLockedStatusChangeIfNecessary_block_invoke()
{
  return notify_register_dispatch("com.apple.mobile.keybagd.lock_status", (int *)&_RegisterForLockedStatusChangeIfNecessary_notifyToken, MEMORY[0x263EF83A0], &__block_literal_global_640);
}

void ___RegisterForLockedStatusChangeIfNecessary_block_invoke_2()
{
  id v2 = +[CLKDevice currentDevice];
  uint64_t v0 = MKBGetDeviceLockState();
  if (v0 != [v2 cachedKeybagLockState])
  {
    [v2 setCachedKeybagLockState:v0];
    v1 = [MEMORY[0x263F08A00] defaultCenter];
    [v1 postNotificationName:@"CLKDeviceLockStateChangedNotification" object:0];
  }
}

@end