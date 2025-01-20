@interface IsLLVMDylibLoaded
@end

@implementation IsLLVMDylibLoaded

void ___IsLLVMDylibLoaded_block_invoke(id a1)
{
  uint32_t v1 = _dyld_image_count();
  if (v1)
  {
    uint32_t v2 = v1;
    uint32_t v3 = 0;
    while (1)
    {
      image_name = (char *)_dyld_get_image_name(v3);
      if (strstr(image_name, "libLLVM.dylib")) {
        break;
      }
      if (v2 == ++v3) {
        return;
      }
    }
    _IsLLVMDylibLoaded_llvmLoaded = 1;
  }
}

@end