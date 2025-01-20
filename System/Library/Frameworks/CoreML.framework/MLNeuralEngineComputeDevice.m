@interface MLNeuralEngineComputeDevice
+ (id)physicalDevice;
- (BOOL)isAccessible;
- (MLNeuralEngineComputeDevice)initWithTotalCoreCount:(int64_t)a3;
- (NSInteger)totalCoreCount;
- (NSString)description;
@end

@implementation MLNeuralEngineComputeDevice

- (BOOL)isAccessible
{
  return 1;
}

void __45__MLNeuralEngineComputeDevice_physicalDevice__block_invoke()
{
  if ([get_ANEDeviceInfoClass() hasANE])
  {
    v0 = -[MLNeuralEngineComputeDevice initWithTotalCoreCount:]([MLNeuralEngineComputeDevice alloc], "initWithTotalCoreCount:", [get_ANEDeviceInfoClass() numANECores]);
    v1 = (void *)+[MLNeuralEngineComputeDevice physicalDevice]::computeDevice;
    +[MLNeuralEngineComputeDevice physicalDevice]::computeDevice = (uint64_t)v0;
  }
}

- (MLNeuralEngineComputeDevice)initWithTotalCoreCount:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MLNeuralEngineComputeDevice;
  result = [(MLNeuralEngineComputeDevice *)&v5 init];
  if (result) {
    result->_totalCoreCount = a3;
  }
  return result;
}

+ (id)physicalDevice
{
  if (+[MLNeuralEngineComputeDevice physicalDevice]::onceToken != -1) {
    dispatch_once(&+[MLNeuralEngineComputeDevice physicalDevice]::onceToken, &__block_literal_global_4439);
  }
  v2 = (void *)+[MLNeuralEngineComputeDevice physicalDevice]::computeDevice;

  return v2;
}

- (NSInteger)totalCoreCount
{
  return self->_totalCoreCount;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<MLNeuralEngineComputeDevice: %p>", self);
}

@end