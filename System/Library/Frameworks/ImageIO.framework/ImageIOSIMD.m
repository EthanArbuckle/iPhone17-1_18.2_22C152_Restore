@interface ImageIOSIMD
@end

@implementation ImageIOSIMD

void __ImageIOSIMD_GetVectorLevel_block_invoke()
{
  if (ImageIOSIMD_GetHardwareVectorLevel::hardwarePredicate != -1) {
    dispatch_once(&ImageIOSIMD_GetHardwareVectorLevel::hardwarePredicate, &__block_literal_global_13);
  }
  vectorLevel = ImageIOSIMD_GetHardwareVectorLevel::hardwareLevel;
}

uint64_t __ImageIOSIMD_GetHardwareVectorLevel_block_invoke()
{
  int v4 = 0;
  size_t v3 = 4;
  uint64_t result = sysctlbyname("hw.optional.FEAT_FP16", &v4, &v3, 0, 0);
  if (v4) {
    BOOL v1 = result == 0;
  }
  else {
    BOOL v1 = 0;
  }
  uint64_t v2 = 5;
  if (!v1) {
    uint64_t v2 = 1;
  }
  ImageIOSIMD_GetHardwareVectorLevel::hardwareLevel = v2;
  return result;
}

@end