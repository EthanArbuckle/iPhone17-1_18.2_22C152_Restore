@interface HKBackgroundObservationExtensionContext
@end

@implementation HKBackgroundObservationExtensionContext

uint64_t __75___HKBackgroundObservationExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED30778];
  uint64_t v1 = _extensionAuxiliaryHostProtocol_interface;
  _extensionAuxiliaryHostProtocol_interface = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __77___HKBackgroundObservationExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED07428];
  uint64_t v1 = _extensionAuxiliaryVendorProtocol_interface;
  _extensionAuxiliaryVendorProtocol_interface = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end