@interface MLGPUComputeDevice(VNAdditions)
- (uint64_t)VNComputeDevicePerformanceScore;
- (uint64_t)VNComputeDeviceType;
@end

@implementation MLGPUComputeDevice(VNAdditions)

- (uint64_t)VNComputeDevicePerformanceScore
{
  return 20;
}

- (uint64_t)VNComputeDeviceType
{
  return 2;
}

@end