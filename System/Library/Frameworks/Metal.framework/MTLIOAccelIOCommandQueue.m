@interface MTLIOAccelIOCommandQueue
- (MTLIOAccelIOCommandQueue)initWithDevice:(id)a3 descriptor:(id)a4;
- (id)commandBuffer;
- (id)commandBufferWithUnretainedReferences;
- (void)setLabel:(id)a3;
@end

@implementation MTLIOAccelIOCommandQueue

- (MTLIOAccelIOCommandQueue)initWithDevice:(id)a3 descriptor:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelIOCommandQueue;
  return [(_MTLIOCommandQueue *)&v5 initWithDevice:a3 descriptor:a4];
}

- (id)commandBuffer
{
  v2 = [[MTLIOAccelIOCommandBuffer alloc] initWithQueue:self resourceList:self->super._resourceListPool retained:1];

  return v2;
}

- (id)commandBufferWithUnretainedReferences
{
  v2 = [[MTLIOAccelIOCommandBuffer alloc] initWithQueue:self resourceList:self->super._resourceListPool retained:0];

  return v2;
}

- (void)setLabel:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelIOCommandQueue;
  -[_MTLObjectWithLabel setLabel:](&v5, sel_setLabel_);
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [(_MTLIOCommandQueue *)self globalTraceObjectID];
    [a3 cStringUsingEncoding:1];
    self->super._labelTraceID = IOAccelDeviceTraceObjectLabel();
  }
}

@end