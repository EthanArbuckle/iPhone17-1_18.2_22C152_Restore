@interface PUPickerExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
+ (void)setAllowedClassesForExtensionAuxiliaryHostInterface:(id)a3;
@end

@implementation PUPickerExtensionContext

+ (void)setAllowedClassesForExtensionAuxiliaryHostInterface:(id)a3
{
  v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v6 forSelector:sel__pickerDidFinishPicking_ argumentIndex:0 ofReply:0];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__PUPickerExtensionContext__extensionAuxiliaryHostProtocol__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_extensionAuxiliaryHostProtocol_onceToken_848 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_848, block);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_interface_849;

  return v2;
}

uint64_t __59__PUPickerExtensionContext__extensionAuxiliaryHostProtocol__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C852070];
  v3 = (void *)_extensionAuxiliaryHostProtocol_interface_849;
  _extensionAuxiliaryHostProtocol_interface_849 = v2;

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = _extensionAuxiliaryHostProtocol_interface_849;

  return [v4 setAllowedClassesForExtensionAuxiliaryHostInterface:v5];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_852 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_852, &__block_literal_global_853);
  }
  uint64_t v2 = (void *)_extensionAuxiliaryVendorProtocol_interface_854;

  return v2;
}

uint64_t __61__PUPickerExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C851EC0];
  _extensionAuxiliaryVendorProtocol_interface_854 = v0;

  return MEMORY[0x270F9A758](v0);
}

@end