@interface MTLIOAccelFence
- (MTLDevice)device;
- (MTLIOAccelFence)initWithDevice:(id)a3 fenceIndex:(unsigned int)a4;
- (void)dealloc;
@end

@implementation MTLIOAccelFence

- (MTLDevice)device
{
  return self->_device;
}

- (MTLIOAccelFence)initWithDevice:(id)a3 fenceIndex:(unsigned int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MTLIOAccelFence;
  v6 = [(_MTLObjectWithLabel *)&v8 init];
  if (v6)
  {
    v6->_device = (MTLDevice *)a3;
    v6->_fenceIndex = a4;
  }
  return v6;
}

- (void)dealloc
{
  if (self->_fenceIndex) {
    -[MTLDevice releaseFenceIndex:](self->_device, "releaseFenceIndex:");
  }
  self->_fenceIndex = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelFence;
  [(_MTLObjectWithLabel *)&v3 dealloc];
}

@end