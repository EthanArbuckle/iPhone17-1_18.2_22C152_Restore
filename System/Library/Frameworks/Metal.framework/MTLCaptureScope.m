@interface MTLCaptureScope
- (MTLCaptureScope)initWithDevice:(id)a3 commandQueue:(id)a4;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (void)dealloc;
@end

@implementation MTLCaptureScope

- (MTLCaptureScope)initWithDevice:(id)a3 commandQueue:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MTLCaptureScope;
  v6 = [(_MTLObjectWithLabel *)&v8 init];
  if (v6)
  {
    v6->_device = (MTLDevice *)a3;
    v6->_commandQueue = (MTLCommandQueue *)a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLCaptureScope;
  [(_MTLObjectWithLabel *)&v3 dealloc];
}

- (MTLDevice)device
{
  return self->_device;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

@end