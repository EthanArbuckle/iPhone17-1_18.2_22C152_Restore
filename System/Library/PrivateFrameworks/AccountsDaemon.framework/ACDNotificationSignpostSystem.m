@interface ACDNotificationSignpostSystem
@end

@implementation ACDNotificationSignpostSystem

uint64_t ___ACDNotificationSignpostSystem_block_invoke()
{
  _ACDNotificationSignpostSystem_log = (uint64_t)os_log_create("com.apple.accounts", "notification.signpost");

  return MEMORY[0x270F9A758]();
}

@end