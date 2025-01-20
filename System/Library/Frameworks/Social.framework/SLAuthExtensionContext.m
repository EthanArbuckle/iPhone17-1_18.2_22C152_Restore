@interface SLAuthExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation SLAuthExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_0 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_0, &__block_literal_global_10);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface_0;

  return v2;
}

uint64_t __59__SLAuthExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol___interface_0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E69D58];

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_0 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_0, &__block_literal_global_2_1);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol___interface_0;

  return v2;
}

uint64_t __57__SLAuthExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol___interface_0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E69DB8];

  return MEMORY[0x1F41817F8]();
}

@end