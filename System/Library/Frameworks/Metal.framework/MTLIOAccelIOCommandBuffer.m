@interface MTLIOAccelIOCommandBuffer
- (MTLIOAccelIOCommandBuffer)initWithQueue:(id)a3;
- (MTLIOAccelIOCommandBuffer)initWithQueue:(id)a3 resourceList:(id)a4 retained:(BOOL)a5;
- (void)setLabel:(id)a3;
@end

@implementation MTLIOAccelIOCommandBuffer

- (MTLIOAccelIOCommandBuffer)initWithQueue:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTLIOAccelIOCommandBuffer;
  return [(_MTLIOCommandBuffer *)&v4 initWithQueue:a3];
}

- (MTLIOAccelIOCommandBuffer)initWithQueue:(id)a3 resourceList:(id)a4 retained:(BOOL)a5
{
  v6.receiver = self;
  v6.super_class = (Class)MTLIOAccelIOCommandBuffer;
  return [(_MTLIOCommandBuffer *)&v6 initWithQueue:a3 resourceList:a4 retained:a5];
}

- (void)setLabel:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelIOCommandBuffer;
  -[_MTLObjectWithLabel setLabel:](&v5, sel_setLabel_);
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [(_MTLIOCommandBuffer *)self globalTraceObjectID];
    [a3 cStringUsingEncoding:1];
    self->super._labelTraceID = IOAccelDeviceTraceObjectLabel();
  }
}

@end