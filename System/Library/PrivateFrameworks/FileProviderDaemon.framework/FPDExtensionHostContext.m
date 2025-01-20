@interface FPDExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation FPDExtensionHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_interface;
  return v2;
}

uint64_t __58__FPDExtensionHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol_interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2EE2DB0];
  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_interface;
  return v2;
}

uint64_t __60__FPDExtensionHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol_interface = FPXVendorXPCInterface();
  return MEMORY[0x1F41817F8]();
}

@end