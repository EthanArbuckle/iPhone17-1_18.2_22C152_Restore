@interface IOGPUMetalCommandEncoder
- (IOGPUMetalCommandEncoder)initWithCommandBuffer:(id)a3;
- (unint64_t)globalTraceObjectID;
- (void)endEncoding;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation IOGPUMetalCommandEncoder

- (void)setLabel:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IOGPUMetalCommandEncoder;
  -[_MTLObjectWithLabel setLabel:](&v9, sel_setLabel_);
  if (*(_DWORD *)__globalGPUCommPage)
  {
    uint64_t v5 = [*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B78]) deviceRef];
    uint64_t v6 = [(IOGPUMetalCommandEncoder *)self globalTraceObjectID];
    uint64_t v7 = (int)*MEMORY[0x263F12B88];
    uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.isa + v7);
    [a3 cStringUsingEncoding:1];
    *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)IOGPUDeviceTraceObjectLabel(v5, 8, 0, v6, v8);
  }
}

- (IOGPUMetalCommandEncoder)initWithCommandBuffer:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IOGPUMetalCommandEncoder;
  v4 = -[_MTLCommandEncoder initWithCommandBuffer:](&v7, sel_initWithCommandBuffer_);
  uint64_t v5 = v4;
  if (*(_DWORD *)__globalGPUCommPage)
  {
    [*(id *)((char *)&v4->super.super.super.isa + (int)*MEMORY[0x263F12B78]) deviceRef];
    [a3 globalTraceObjectID];
    [(IOGPUMetalCommandEncoder *)v5 globalTraceObjectID];
    [(_MTLCommandEncoder *)v5 getType];
    IOGPUDeviceTraceEvent();
  }
  return v5;
}

- (unint64_t)globalTraceObjectID
{
  uint64_t v3 = (int)*MEMORY[0x263F12B80];
  unint64_t result = *(unint64_t *)((char *)&self->super.super.super.isa + v3);
  if (!result)
  {
    unint64_t result = IOGPUDeviceGetNextGlobalTraceID(objc_msgSend(*(id *)((char *)&self->super.super.super.isa
                                                                + (int)*MEMORY[0x263F12B78]), "deviceRef"));
    *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)result;
  }
  return result;
}

- (void)endEncoding
{
  if (*(_DWORD *)__globalGPUCommPage)
  {
    [*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B78]) deviceRef];
    [*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B70]) globalTraceObjectID];
    [(IOGPUMetalCommandEncoder *)self globalTraceObjectID];
    [(_MTLCommandEncoder *)self getType];
    IOGPUDeviceTraceEvent();
  }
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalCommandEncoder;
  [(_MTLCommandEncoder *)&v3 endEncoding];
}

- (void)popDebugGroup
{
  if (*(_DWORD *)__globalGPUCommPage)
  {
    [*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B78]) deviceRef];
    [(IOGPUMetalCommandEncoder *)self globalTraceObjectID];
    IOGPUDeviceTraceEvent();
  }
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalCommandEncoder;
  [(_MTLCommandEncoder *)&v3 popDebugGroup];
}

- (void)pushDebugGroup:(id)a3
{
  if (*(_DWORD *)__globalGPUCommPage)
  {
    uint64_t v5 = [*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B78]) deviceRef];
    uint64_t v6 = [(IOGPUMetalCommandEncoder *)self globalTraceObjectID];
    [a3 cStringUsingEncoding:1];
    IOGPUDeviceTraceObjectLabel(v5, 8, 12, v6, 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)IOGPUMetalCommandEncoder;
  [(_MTLCommandEncoder *)&v7 pushDebugGroup:a3];
}

@end