@interface CDDeviceInfo
@end

@implementation CDDeviceInfo

uint64_t __41___CDDeviceInfo_isRunningOnInternalBuild__block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  isRunningOnInternalBuild_isInternalBuild = result;
  return result;
}

@end