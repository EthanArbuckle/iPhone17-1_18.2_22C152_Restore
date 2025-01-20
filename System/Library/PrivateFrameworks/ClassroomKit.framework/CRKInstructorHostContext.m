@interface CRKInstructorHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation CRKInstructorHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_38);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_interface;

  return v2;
}

uint64_t __59__CRKInstructorHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol_interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D829580];

  return MEMORY[0x270F9A758]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_42);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_interface;

  return v2;
}

uint64_t __61__CRKInstructorHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol_interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D829A58];

  return MEMORY[0x270F9A758]();
}

@end