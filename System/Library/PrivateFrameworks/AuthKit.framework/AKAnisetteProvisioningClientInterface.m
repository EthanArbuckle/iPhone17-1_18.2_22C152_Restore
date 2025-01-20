@interface AKAnisetteProvisioningClientInterface
+ (id)XPCInterface;
@end

@implementation AKAnisetteProvisioningClientInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_10 != -1) {
    dispatch_once(&XPCInterface_onceToken_10, &__block_literal_global_35);
  }
  v2 = (void *)XPCInterface_interface_9;

  return v2;
}

uint64_t __53__AKAnisetteProvisioningClientInterface_XPCInterface__block_invoke()
{
  XPCInterface_interface_9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE443038];

  return MEMORY[0x1F41817F8]();
}

@end