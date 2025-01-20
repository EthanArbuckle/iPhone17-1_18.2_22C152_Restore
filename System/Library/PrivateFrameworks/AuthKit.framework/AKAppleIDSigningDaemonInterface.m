@interface AKAppleIDSigningDaemonInterface
+ (NSXPCInterface)XPCInterface;
@end

@implementation AKAppleIDSigningDaemonInterface

+ (NSXPCInterface)XPCInterface
{
  if (XPCInterface_onceToken_5 != -1) {
    dispatch_once(&XPCInterface_onceToken_5, &__block_literal_global_22);
  }
  v2 = (void *)XPCInterface_XPCInterface;

  return (NSXPCInterface *)v2;
}

uint64_t __47__AKAppleIDSigningDaemonInterface_XPCInterface__block_invoke()
{
  XPCInterface_XPCInterface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE45EEC0];

  return MEMORY[0x1F41817F8]();
}

@end