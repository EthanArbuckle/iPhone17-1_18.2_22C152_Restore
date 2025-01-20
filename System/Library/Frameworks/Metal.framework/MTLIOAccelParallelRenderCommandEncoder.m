@interface MTLIOAccelParallelRenderCommandEncoder
- (BOOL)isMemorylessRender;
- (MTLIOAccelParallelRenderCommandEncoder)initWithCommandBuffer:(id)a3 renderPassDescriptor:(id)a4;
- (unint64_t)getType;
- (void)endEncoding;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation MTLIOAccelParallelRenderCommandEncoder

- (MTLIOAccelParallelRenderCommandEncoder)initWithCommandBuffer:(id)a3 renderPassDescriptor:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MTLIOAccelParallelRenderCommandEncoder;
  v5 = [(_MTLParallelRenderCommandEncoder *)&v8 initWithCommandBuffer:a3 renderPassDescriptor:a4];
  v6 = v5;
  if (v5)
  {
    [(MTLDevice *)v5->super._device deviceRef];
    v6->super._globalTraceObjectID = IOAccelDeviceGetNextGlobalTraceID();
    if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
    {
      [(MTLDevice *)v6->super._device deviceRef];
      [a3 globalTraceObjectID];
      [(MTLIOAccelParallelRenderCommandEncoder *)v6 getType];
      IOAccelDeviceTraceEvent();
    }
  }
  return v6;
}

- (void)setLabel:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelParallelRenderCommandEncoder;
  -[_MTLObjectWithLabel setLabel:](&v5, sel_setLabel_);
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [(MTLDevice *)self->super._device deviceRef];
    [a3 cStringUsingEncoding:1];
    self->super._labelTraceID = IOAccelDeviceTraceObjectLabel();
  }
}

- (void)endEncoding
{
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [(MTLDevice *)self->super._device deviceRef];
    [(MTLCommandBuffer *)self->super._commandBuffer globalTraceObjectID];
    [(MTLIOAccelParallelRenderCommandEncoder *)self getType];
    IOAccelDeviceTraceEvent();
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelParallelRenderCommandEncoder;
  [(_MTLParallelRenderCommandEncoder *)&v3 endEncoding];
}

- (void)pushDebugGroup:(id)a3
{
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [(MTLDevice *)self->super._device deviceRef];
    [a3 cStringUsingEncoding:1];
    IOAccelDeviceTraceObjectLabel();
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelParallelRenderCommandEncoder;
  [(_MTLParallelRenderCommandEncoder *)&v5 pushDebugGroup:a3];
}

- (void)popDebugGroup
{
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [(MTLDevice *)self->super._device deviceRef];
    IOAccelDeviceTraceEvent();
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelParallelRenderCommandEncoder;
  [(_MTLParallelRenderCommandEncoder *)&v3 popDebugGroup];
}

- (unint64_t)getType
{
  return 3;
}

- (BOOL)isMemorylessRender
{
  return 0;
}

@end