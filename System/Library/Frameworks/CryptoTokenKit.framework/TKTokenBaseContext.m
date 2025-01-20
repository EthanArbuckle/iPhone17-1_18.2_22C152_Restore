@interface TKTokenBaseContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation TKTokenBaseContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_interface;

  return v2;
}

uint64_t __55__TKTokenBaseContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol_interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F19FA368];

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_240);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_interface;

  return v2;
}

uint64_t __53__TKTokenBaseContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol_interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A01BC8];

  return MEMORY[0x1F41817F8]();
}

@end