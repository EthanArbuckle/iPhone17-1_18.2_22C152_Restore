@interface NSURL
@end

@implementation NSURL

uint64_t __40__NSURL_UTIAdditions____is_coreTypesURL__block_invoke()
{
  __is_coreTypesURL_coreTypesURL = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/System/Library/CoreServices/MobileCoreTypes.bundle"];
  return MEMORY[0x1F41817F8]();
}

void __80__NSURL_IconServicesInternalAdditions___is_unregisteredPersonlityFileExtensions__block_invoke()
{
  v0 = (void *)_is_unregisteredPersonlityFileExtensions_personalityMap;
  _is_unregisteredPersonlityFileExtensions_personalityMap = MEMORY[0x1E4F1CC08];
}

uint64_t __55__NSURL_IconServicesInternalAdditions____is__isNetBoot__block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 0;
  *(void *)v3 = 0x2800000001;
  size_t v1 = 4;
  uint64_t result = sysctl(v3, 2u, &v2, &v1, 0, 0);
  __is__isNetBoot_uint64_t result = v2 != 0;
  return result;
}

@end