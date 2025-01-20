@interface AKAnisetteProvisioningDaemonInterface
+ (id)XPCInterface;
@end

@implementation AKAnisetteProvisioningDaemonInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_11 != -1) {
    dispatch_once(&XPCInterface_onceToken_11, &__block_literal_global_40);
  }
  v2 = (void *)XPCInterface_interface_10;

  return v2;
}

uint64_t __53__AKAnisetteProvisioningDaemonInterface_XPCInterface__block_invoke()
{
  XPCInterface_interface_10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE462350];

  return MEMORY[0x1F41817F8]();
}

@end