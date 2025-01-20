@interface NSXPCInterface(CXNotificationServiceExtensionVoIPXPCClientSupport)
+ (uint64_t)cx_notificationServiceExtensionInterface;
@end

@implementation NSXPCInterface(CXNotificationServiceExtensionVoIPXPCClientSupport)

+ (uint64_t)cx_notificationServiceExtensionInterface
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC442E8];
}

@end