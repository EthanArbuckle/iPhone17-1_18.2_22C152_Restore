@interface MLCPUComputeDevice
+ (id)physicalDevice;
- (NSString)description;
@end

@implementation MLCPUComputeDevice

void __36__MLCPUComputeDevice_physicalDevice__block_invoke()
{
  v0 = objc_alloc_init(MLCPUComputeDevice);
  v1 = (void *)physicalDevice_cpuDevice;
  physicalDevice_cpuDevice = (uint64_t)v0;
}

+ (id)physicalDevice
{
  if (physicalDevice_onceToken != -1) {
    dispatch_once(&physicalDevice_onceToken, &__block_literal_global_8656);
  }
  v2 = (void *)physicalDevice_cpuDevice;

  return v2;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<MLCPUComputeDevice: %p>", self);
}

@end