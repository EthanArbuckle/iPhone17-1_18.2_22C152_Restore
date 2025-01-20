@interface FAFamilyPresenterHostInterface
+ (id)XPCInterface;
@end

@implementation FAFamilyPresenterHostInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken != -1) {
    dispatch_once(&XPCInterface_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)XPCInterface_interface;
  return v2;
}

uint64_t __46__FAFamilyPresenterHostInterface_XPCInterface__block_invoke()
{
  XPCInterface_interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F29541D0];
  return MEMORY[0x1F41817F8]();
}

@end