@interface MLCPUComputeDevice(VNAdditions)
- (uint64_t)VNComputeDevicePerformanceScore;
- (uint64_t)VNComputeDeviceType;
@end

@implementation MLCPUComputeDevice(VNAdditions)

- (uint64_t)VNComputeDevicePerformanceScore
{
  return 1;
}

- (uint64_t)VNComputeDeviceType
{
  return 1;
}

@end