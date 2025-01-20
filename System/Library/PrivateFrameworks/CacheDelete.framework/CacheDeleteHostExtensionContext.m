@interface CacheDeleteHostExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation CacheDeleteHostExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_MergedGlobals_7 != -1) {
    dispatch_once(&_MergedGlobals_7, &__block_literal_global_8);
  }
  v2 = (void *)qword_1EB30C4C0;
  return v2;
}

uint64_t __66__CacheDeleteHostExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  qword_1EB30C4C0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFB32370];
  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_1EB30C4C8 != -1) {
    dispatch_once(&qword_1EB30C4C8, &__block_literal_global_42);
  }
  v2 = (void *)qword_1EB30C4D0;
  return v2;
}

uint64_t __68__CacheDeleteHostExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  qword_1EB30C4D0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFB32F28];
  return MEMORY[0x1F41817F8]();
}

@end