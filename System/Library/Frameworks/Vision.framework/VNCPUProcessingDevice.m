@interface VNCPUProcessingDevice
- (BOOL)targetsCPU;
- (id)computeDevice;
- (id)metalDevice;
- (int)espressoEngine;
- (int)espressoStorageType;
@end

@implementation VNCPUProcessingDevice

- (int)espressoStorageType
{
  return 65568;
}

- (int)espressoEngine
{
  return 0;
}

- (id)metalDevice
{
  return 0;
}

- (BOOL)targetsCPU
{
  return 1;
}

- (id)computeDevice
{
  return +[VNComputeDeviceUtilities mostPerformantCPUComputeDevice];
}

@end