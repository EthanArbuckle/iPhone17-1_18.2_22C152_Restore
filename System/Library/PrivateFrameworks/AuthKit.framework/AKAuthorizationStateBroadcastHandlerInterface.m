@interface AKAuthorizationStateBroadcastHandlerInterface
+ (id)XPCInterface;
@end

@implementation AKAuthorizationStateBroadcastHandlerInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_1 != -1) {
    dispatch_once(&XPCInterface_onceToken_1, &__block_literal_global_7);
  }
  v2 = (void *)XPCInterface_interface_1;

  return v2;
}

uint64_t __61__AKAuthorizationStateBroadcastHandlerInterface_XPCInterface__block_invoke()
{
  XPCInterface_interface_1 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE462050];

  return MEMORY[0x1F41817F8]();
}

@end