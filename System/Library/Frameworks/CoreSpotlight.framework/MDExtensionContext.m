@interface MDExtensionContext
@end

@implementation MDExtensionContext

uint64_t __54___MDExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol___interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDBE05D8];

  return MEMORY[0x1F41817F8]();
}

uint64_t __56___MDExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol___interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDBEF488];

  return MEMORY[0x1F41817F8]();
}

@end