@interface IOGPUMetalFence
- (IOGPUMetalFence)initWithDevice:(id)a3;
- (MTLDevice)device;
- (void)dealloc;
@end

@implementation IOGPUMetalFence

- (IOGPUMetalFence)initWithDevice:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IOGPUMetalFence;
  v4 = [(_MTLObjectWithLabel *)&v7 init];
  if (v4)
  {
    v4->_device = (MTLDevice *)a3;
    v5 = -[IOGPUMTLFence initWithDevice:]([IOGPUMTLFence alloc], "initWithDevice:", [a3 deviceRef]);
    v4->_fence = v5;
    if (v5)
    {
      v4->_fenceIndex = v5->_fenceName;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalFence;
  [(_MTLObjectWithLabel *)&v3 dealloc];
}

@end