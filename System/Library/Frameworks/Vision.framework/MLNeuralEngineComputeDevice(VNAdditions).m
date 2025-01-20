@interface MLNeuralEngineComputeDevice(VNAdditions)
- (uint64_t)VNComputeDevicePerformanceScore;
- (uint64_t)VNComputeDeviceType;
@end

@implementation MLNeuralEngineComputeDevice(VNAdditions)

- (uint64_t)VNComputeDevicePerformanceScore
{
  return 100;
}

- (uint64_t)VNComputeDeviceType
{
  return 4;
}

@end