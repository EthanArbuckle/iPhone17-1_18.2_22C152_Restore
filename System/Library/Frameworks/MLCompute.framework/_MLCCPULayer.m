@interface _MLCCPULayer
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensors:(id)a6;
- (MLCDeviceCPU)device;
- (NSArray)deviceOps;
- (_MLCCPULayer)initWithDevice:(id)a3 deviceOps:(id)a4;
- (void)dealloc;
- (void)filter;
- (void)secondaryFilter;
- (void)setDeviceOps:(id)a3;
- (void)setFilter:(void *)a3;
- (void)setSecondaryFilter:(void *)a3;
@end

@implementation _MLCCPULayer

- (_MLCCPULayer)initWithDevice:(id)a3 deviceOps:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_MLCCPULayer;
  v9 = [(_MLCCPULayer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    v10->_filter = 0;
    v10->_secondaryFilter = 0;
    objc_storeStrong((id *)&v10->_deviceOps, a4);
  }

  return v10;
}

- (void)dealloc
{
  filter = self->_filter;
  if (filter)
  {
    BNNSFilterDestroy(filter);
    self->_filter = 0;
  }
  secondaryFilter = self->_secondaryFilter;
  if (secondaryFilter)
  {
    BNNSFilterDestroy(secondaryFilter);
    self->_secondaryFilter = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_MLCCPULayer;
  [(_MLCCPULayer *)&v5 dealloc];
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  return 0;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensors:(id)a6
{
  return 0;
}

- (MLCDeviceCPU)device
{
  return self->_device;
}

- (void)filter
{
  return self->_filter;
}

- (void)setFilter:(void *)a3
{
  self->_filter = a3;
}

- (void)secondaryFilter
{
  return self->_secondaryFilter;
}

- (void)setSecondaryFilter:(void *)a3
{
  self->_secondaryFilter = a3;
}

- (NSArray)deviceOps
{
  return self->_deviceOps;
}

- (void)setDeviceOps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceOps, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end