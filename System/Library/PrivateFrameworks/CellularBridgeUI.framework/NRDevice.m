@interface NRDevice
@end

@implementation NRDevice

uint64_t __49__NRDevice_Configuration__isRunningInternalBuild__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isRunningInternalBuild_isInternalBuild = result;
  return result;
}

@end