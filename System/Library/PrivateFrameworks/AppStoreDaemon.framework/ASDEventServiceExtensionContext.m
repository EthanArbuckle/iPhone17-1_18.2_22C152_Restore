@interface ASDEventServiceExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation ASDEventServiceExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_MergedGlobals_25 != -1) {
    dispatch_once(&_MergedGlobals_25, &__block_literal_global_1);
  }
  v2 = (void *)qword_1EB4D6430;
  return v2;
}

uint64_t __66__ASDEventServiceExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  qword_1EB4D6430 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC5E4B8];
  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_1EB4D6438 != -1) {
    dispatch_once(&qword_1EB4D6438, &__block_literal_global_43);
  }
  v2 = (void *)qword_1EB4D6440;
  return v2;
}

uint64_t __68__ASDEventServiceExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  qword_1EB4D6440 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC5A2D0];
  return MEMORY[0x1F41817F8]();
}

@end