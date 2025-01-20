@interface AKAuthorizationNotificationHandlerInterface
+ (id)XPCInterface;
@end

@implementation AKAuthorizationNotificationHandlerInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_9 != -1) {
    dispatch_once(&XPCInterface_onceToken_9, &__block_literal_global_30);
  }
  v2 = (void *)XPCInterface_interface_8;

  return v2;
}

uint64_t __59__AKAuthorizationNotificationHandlerInterface_XPCInterface__block_invoke()
{
  XPCInterface_interface_8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE462290];

  return MEMORY[0x1F41817F8]();
}

@end