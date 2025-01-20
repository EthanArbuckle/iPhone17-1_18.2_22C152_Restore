@interface BRKRegisterForLockedStatusChange
@end

@implementation BRKRegisterForLockedStatusChange

uint64_t ___BRKRegisterForLockedStatusChange_block_invoke()
{
  return notify_register_dispatch("com.apple.mobile.keybagd.lock_status", (int *)&_BRKRegisterForLockedStatusChange_notifyToken, MEMORY[0x263EF83A0], &__block_literal_global_61);
}

void ___BRKRegisterForLockedStatusChange_block_invoke_2()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"BRKDeviceLockStateChangedNotification" object:0];
}

@end