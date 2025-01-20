@interface IOGPUMetalParallelRenderCommandEncoder
- (BOOL)isMemorylessRender;
- (IOGPUMetalParallelRenderCommandEncoder)initWithCommandBuffer:(id)a3 renderPassDescriptor:(id)a4;
- (id)_renderCommandEncoderCommon;
- (unint64_t)getType;
- (void)endEncoding;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation IOGPUMetalParallelRenderCommandEncoder

- (IOGPUMetalParallelRenderCommandEncoder)initWithCommandBuffer:(id)a3 renderPassDescriptor:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)IOGPUMetalParallelRenderCommandEncoder;
  v5 = [(_MTLParallelRenderCommandEncoder *)&v9 initWithCommandBuffer:a3 renderPassDescriptor:a4];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = (int)*MEMORY[0x263F12C78];
    *(Class *)((char *)&v5->super.super.super.isa + (int)*MEMORY[0x263F12C80]) = (Class)IOGPUDeviceGetNextGlobalTraceID([*(id *)((char *)&v5->super.super.super.isa+ v7) deviceRef]);
    if (*(_DWORD *)__globalGPUCommPage)
    {
      [*(id *)((char *)&v6->super.super.super.isa + v7) deviceRef];
      [a3 globalTraceObjectID];
      [(IOGPUMetalParallelRenderCommandEncoder *)v6 getType];
      IOGPUDeviceTraceEvent();
    }
  }
  return v6;
}

- (void)setLabel:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IOGPUMetalParallelRenderCommandEncoder;
  -[_MTLObjectWithLabel setLabel:](&v9, sel_setLabel_);
  if (*(_DWORD *)__globalGPUCommPage)
  {
    uint64_t v5 = [*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12C78]) deviceRef];
    uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12C80]);
    uint64_t v7 = (int)*MEMORY[0x263F12C88];
    uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.isa + v7);
    [a3 cStringUsingEncoding:1];
    *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)IOGPUDeviceTraceObjectLabel(v5, 8, 0, v6, v8);
  }
}

- (void)endEncoding
{
  if (*(_DWORD *)__globalGPUCommPage)
  {
    [*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12C78]) deviceRef];
    [*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12C60]) globalTraceObjectID];
    [(IOGPUMetalParallelRenderCommandEncoder *)self getType];
    IOGPUDeviceTraceEvent();
  }
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalParallelRenderCommandEncoder;
  [(_MTLParallelRenderCommandEncoder *)&v3 endEncoding];
}

- (void)pushDebugGroup:(id)a3
{
  if (*(_DWORD *)__globalGPUCommPage)
  {
    uint64_t v5 = [*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12C78]) deviceRef];
    uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12C80]);
    [a3 cStringUsingEncoding:1];
    IOGPUDeviceTraceObjectLabel(v5, 8, 12, v6, 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)IOGPUMetalParallelRenderCommandEncoder;
  [(_MTLParallelRenderCommandEncoder *)&v7 pushDebugGroup:a3];
}

- (void)popDebugGroup
{
  if (*(_DWORD *)__globalGPUCommPage)
  {
    [*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12C78]) deviceRef];
    IOGPUDeviceTraceEvent();
  }
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalParallelRenderCommandEncoder;
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

- (id)_renderCommandEncoderCommon
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  *(void *)(StatusReg + 288) = 11181;
  v4.receiver = self;
  v4.super_class = (Class)IOGPUMetalParallelRenderCommandEncoder;
  id result = [(_MTLParallelRenderCommandEncoder *)&v4 _renderCommandEncoderCommon];
  *(void *)(StatusReg + 288) = 0;
  return result;
}

@end