@interface KSDeviceStateMonitor
@end

@implementation KSDeviceStateMonitor

void __43___KSDeviceStateMonitor_deviceStateMonitor__block_invoke()
{
  v0 = objc_alloc_init(_KSDeviceStateMonitor);
  v1 = (void *)deviceStateMonitor_sharedInstance;
  deviceStateMonitor_sharedInstance = (uint64_t)v0;
}

uint64_t __49___KSDeviceStateMonitor_isRunningOnInternalBuild__block_invoke()
{
  uint64_t result = softLinkMGGetBoolAnswer(@"InternalBuild");
  isRunningOnInternalBuild_isInternalBuild = result;
  return result;
}

@end