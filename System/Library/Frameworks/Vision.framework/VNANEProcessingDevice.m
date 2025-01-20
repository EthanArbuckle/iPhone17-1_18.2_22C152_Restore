@interface VNANEProcessingDevice
- (BOOL)targetsANE;
- (id)computeDevice;
- (int)espressoStorageType;
@end

@implementation VNANEProcessingDevice

- (id)computeDevice
{
  return +[VNComputeDeviceUtilities mostPerformantNeuralEngineComputeDevice];
}

- (int)espressoStorageType
{
  return 65552;
}

- (BOOL)targetsANE
{
  return 1;
}

@end