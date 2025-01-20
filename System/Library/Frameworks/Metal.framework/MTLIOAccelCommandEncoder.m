@interface MTLIOAccelCommandEncoder
- (MTLIOAccelCommandEncoder)initWithCommandBuffer:(id)a3;
- (unint64_t)globalTraceObjectID;
- (void)endEncoding;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation MTLIOAccelCommandEncoder

- (MTLIOAccelCommandEncoder)initWithCommandBuffer:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTLIOAccelCommandEncoder;
  v4 = -[_MTLCommandEncoder initWithCommandBuffer:](&v7, sel_initWithCommandBuffer_);
  v5 = v4;
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [(MTLDevice *)v4->super._device deviceRef];
    [a3 globalTraceObjectID];
    [(MTLIOAccelCommandEncoder *)v5 globalTraceObjectID];
    [(_MTLCommandEncoder *)v5 getType];
    IOAccelDeviceTraceEvent();
  }
  return v5;
}

- (void)endEncoding
{
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [(MTLDevice *)self->super._device deviceRef];
    [(MTLCommandBuffer *)self->super._commandBuffer globalTraceObjectID];
    [(MTLIOAccelCommandEncoder *)self globalTraceObjectID];
    [(_MTLCommandEncoder *)self getType];
    IOAccelDeviceTraceEvent();
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelCommandEncoder;
  [(_MTLCommandEncoder *)&v3 endEncoding];
}

- (void)setLabel:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelCommandEncoder;
  -[_MTLObjectWithLabel setLabel:](&v5, sel_setLabel_);
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [(MTLDevice *)self->super._device deviceRef];
    [(MTLIOAccelCommandEncoder *)self globalTraceObjectID];
    [a3 cStringUsingEncoding:1];
    self->super._labelTraceID = IOAccelDeviceTraceObjectLabel();
  }
}

- (void)pushDebugGroup:(id)a3
{
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [(MTLDevice *)self->super._device deviceRef];
    [(MTLIOAccelCommandEncoder *)self globalTraceObjectID];
    [a3 cStringUsingEncoding:1];
    IOAccelDeviceTraceObjectLabel();
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelCommandEncoder;
  [(_MTLCommandEncoder *)&v5 pushDebugGroup:a3];
}

- (void)popDebugGroup
{
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [(MTLDevice *)self->super._device deviceRef];
    [(MTLIOAccelCommandEncoder *)self globalTraceObjectID];
    IOAccelDeviceTraceEvent();
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelCommandEncoder;
  [(_MTLCommandEncoder *)&v3 popDebugGroup];
}

- (unint64_t)globalTraceObjectID
{
  unint64_t result = self->super._globalTraceObjectID;
  if (!result)
  {
    [(MTLDevice *)self->super._device deviceRef];
    unint64_t result = IOAccelDeviceGetNextGlobalTraceID();
    self->super._globalTraceObjectID = result;
  }
  return result;
}

@end