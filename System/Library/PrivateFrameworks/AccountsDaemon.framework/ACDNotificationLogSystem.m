@interface ACDNotificationLogSystem
@end

@implementation ACDNotificationLogSystem

uint64_t ___ACDNotificationLogSystem_block_invoke()
{
  _ACDNotificationLogSystem_log = (uint64_t)os_log_create("com.apple.accounts", "notification");

  return MEMORY[0x270F9A758]();
}

@end