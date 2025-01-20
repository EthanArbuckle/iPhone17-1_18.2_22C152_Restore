@interface AGXG17FamilyCommandBuffer
- (AGXG17FamilyCommandBuffer)initWithQueue:(id)a3 retainedReferences:(BOOL)a4;
- (BOOL)disableDeferredEndEncoding;
- (BOOL)isBlitEncoderCoalescingDisabled;
- (BOOL)isComputeEncoderCoalescingDisabled;
- (BOOL)isEncoderCoalescingDisabled;
- (BOOL)tryCoalescingPreviousComputeCommandEncoderWithConfig:(EncoderComputeServiceConfig *)a3 nextEncoderClass:(Class)a4;
- (id).cxx_construct;
- (id)_accelerationStructureCommandEncoderWithDescriptor:(id)a3;
- (id)accelerationStructureCommandEncoder;
- (id)blitCommandEncoder;
- (id)blitCommandEncoderCommon:(id)a3;
- (id)computeCommandEncoder;
- (id)computeCommandEncoderWithConfig:(EncoderComputeServiceConfig *)a3;
- (id)computeCommandEncoderWithDescriptor:(id)a3;
- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3;
- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3 substreamCount:(unsigned int)a4;
- (id)parallelRenderCommandEncoderWithDescriptor:(id)a3;
- (id)renderCommandEncoderWithDescriptor:(id)a3;
- (id)resourceStateCommandEncoder;
- (id)resourceStateCommandEncoderWithDescriptor:(id)a3;
- (id)sampledComputeCommandEncoderWithConfig:(EncoderComputeServiceConfig *)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5;
- (id)sampledComputeCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5;
- (id)sampledComputeCommandEncoderWithDispatchType:(unint64_t)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5;
- (id)sampledComputeCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4;
- (id)sampledRenderCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5;
- (id)sampledSubRenderCommandEncoderWithDescriptor:(id)a3 subEncoderIndex:(unint64_t)a4 framebuffer:(void *)a5 programInfoBuffer:(id *)a6 capacity:(unint64_t)a7;
- (id)subRenderCommandEncoderWithDescriptor:(id)a3 subEncoderIndex:(unint64_t)a4 framebuffer:(void *)a5;
- (unint64_t)deadline;
- (unint64_t)getSupportedAndEnabledErrorOptions;
- (unsigned)deadline_namespace_id;
- (void)commit;
- (void)commitEncoder;
- (void)commitWithDeadline:(unint64_t)a3;
- (void)dealloc;
- (void)dropResourceGroups:(const void *)a3 count:(unint64_t)a4;
- (void)encodeCacheHintFinalize:(unint64_t)a3 resourceGroups:(const void *)a4 count:(unint64_t)a5;
- (void)encodeCacheHintTag:(unint64_t)a3 resourceGroups:(const void *)a4 count:(unint64_t)a5;
- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 value:(unint64_t)a5 forIndex:(unint64_t)a6;
- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 values:(const unint64_t *)a5 indices:(const unint64_t *)a6 count:(unint64_t)a7;
- (void)encodeDashboardTagForResourceGroup:(id)a3;
- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4;
- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4 agentMask:(unint64_t)a5;
- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4;
- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4 timeout:(unsigned int)a5;
- (void)fillCommandBufferArgs:(IOGPUCommandQueueCommandBufferArgs *)a3 commandQueue:(id)a4;
- (void)getDriverEncoderInfoData:(id)a3;
- (void)gtpContinuePreParse;
- (void)reserveKernelCommandBufferSpace:(unint64_t)a3;
- (void)setDeadline:(unint64_t)a3;
- (void)setDeadline_namespace_id:(unsigned int)a3;
- (void)setDisableDeferredEndEncoding:(BOOL)a3;
- (void)setPreviousBlitCommandEncoder:(id)a3;
- (void)setPreviousComputeCommandEncoder:(id)a3;
- (void)setPreviousRenderCommandEncoder:(id)a3;
- (void)setResourceGroups:(const void *)a3 count:(unint64_t)a4;
@end

@implementation AGXG17FamilyCommandBuffer

- (id).cxx_construct
{
  *((void *)self + 84) = 0;
  *((void *)self + 85) = 0;
  *((void *)self + 89) = 0;
  *((void *)self + 90) = 0;
  *((void *)self + 88) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_texturesToEvaluate = &self->texturesToEvaluate;
  begin = self->texturesToEvaluate.__begin_;
  if (begin)
  {
    p_texturesToEvaluate->var0 = begin;
    operator delete(begin);
  }
}

- (void)setDeadline_namespace_id:(unsigned int)a3
{
  self->deadline_namespace_id = a3;
}

- (unsigned)deadline_namespace_id
{
  return self->deadline_namespace_id;
}

- (void)setDeadline:(unint64_t)a3
{
  self->deadline = a3;
}

- (unint64_t)deadline
{
  return self->deadline;
}

- (void)setDisableDeferredEndEncoding:(BOOL)a3
{
  self->_disableDeferredEndEncoding = a3;
}

- (BOOL)disableDeferredEndEncoding
{
  return self->_disableDeferredEndEncoding;
}

- (void)fillCommandBufferArgs:(IOGPUCommandQueueCommandBufferArgs *)a3 commandQueue:(id)a4
{
  *(void *)&a3[1].var2 = [(AGXG17FamilyCommandBuffer *)self deadline];
  a3[1].var0 = [(AGXG17FamilyCommandBuffer *)self deadline_namespace_id];
  v7.receiver = self;
  v7.super_class = (Class)AGXG17FamilyCommandBuffer;
  [(IOGPUMetalCommandBuffer *)&v7 fillCommandBufferArgs:a3 commandQueue:a4];
}

- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3 substreamCount:(unsigned int)a4
{
  objc_super v7 = [(IOGPUMetalCommandBuffer *)self device];
  impl = self->_impl;
  impl[20] = 1;
  int v9 = *((_DWORD *)impl + 4);
  BOOL v10 = a3 == 1 && (*(unsigned char *)(*((void *)v7 + 101) + 7289) & 0x10) == 0;
  v12[0] = v7;
  v12[1] = self;
  v12[2] = 0;
  BOOL v13 = v10;
  uint64_t v14 = 0;
  int v15 = v9;
  unsigned int v16 = a4;
  __int16 v17 = 1;
  return [(AGXG17FamilyCommandBuffer *)self computeCommandEncoderWithConfig:v12];
}

- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 values:(const unint64_t *)a5 indices:(const unint64_t *)a6 count:(unint64_t)a7
{
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
    MTLReportFailure();
  }
  [(AGXG17FamilyCommandBuffer *)self commitEncoder];
  if (a3)
  {
    impl = (id *)self->_impl;
    *(id *)((char *)impl + (((unint64_t)*((unsigned __int16 *)a3 + 4) >> 3) & 0x1FF8) + 72) = (id)(*(unint64_t *)((char *)impl + (((unint64_t)*((unsigned __int16 *)a3 + 4) >> 3) & 0x1FF8) + 72) & ~(1 << *((_WORD *)a3 + 4)));
    uint64_t v13 = [impl[1] reserveKernelCommandBufferSpace:48];
    *(void *)uint64_t v13 = 0x3000010003;
    if (a7)
    {
      *(void *)(v13 + 8) = *a5;
      *(_WORD *)(v13 + 40) = *a6;
      if (a7 != 1)
      {
        *(void *)(v13 + 16) = a5[1];
        *(_WORD *)(v13 + 42) = a6[1];
        if (a7 > 2)
        {
          *(void *)(v13 + 24) = a5[2];
          *(_WORD *)(v13 + 44) = a6[2];
          if (a7 == 3)
          {
            __int16 v14 = -1;
          }
          else
          {
            *(void *)(v13 + 32) = a5[3];
            __int16 v14 = *((_WORD *)a6 + 12);
          }
LABEL_12:
          *(_WORD *)(v13 + 46) = v14;
          [impl[1] commandBufferStorage];
          IOGPUMetalCommandBufferStorageBeginKernelCommands();
          IOGPUMetalCommandBufferStorageEndKernelCommands();
          return;
        }
LABEL_11:
        __int16 v14 = -1;
        *(_WORD *)(v13 + 44) = -1;
        goto LABEL_12;
      }
    }
    else
    {
      *(_WORD *)(v13 + 40) = -1;
    }
    *(_WORD *)(v13 + 42) = -1;
    goto LABEL_11;
  }
}

- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 value:(unint64_t)a5 forIndex:(unint64_t)a6
{
  __int16 v6 = a6;
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
    MTLReportFailure();
  }
  [(AGXG17FamilyCommandBuffer *)self commitEncoder];
  if (a3)
  {
    impl = (id *)self->_impl;
    *(id *)((char *)impl + (((unint64_t)*((unsigned __int16 *)a3 + 4) >> 3) & 0x1FF8) + 72) = (id)(*(unint64_t *)((char *)impl + (((unint64_t)*((unsigned __int16 *)a3 + 4) >> 3) & 0x1FF8) + 72) & ~(1 << *((_WORD *)a3 + 4)));
    uint64_t v11 = [impl[1] reserveKernelCommandBufferSpace:48];
    *(void *)uint64_t v11 = 0x3000010003;
    *(void *)(v11 + 8) = a5;
    *(_WORD *)(v11 + 40) = v6;
    *(_DWORD *)(v11 + 42) = -1;
    *(_WORD *)(v11 + 46) = -1;
    [impl[1] commandBufferStorage];
    IOGPUMetalCommandBufferStorageBeginKernelCommands();
    IOGPUMetalCommandBufferStorageEndKernelCommands();
  }
}

- (void)encodeDashboardTagForResourceGroup:(id)a3
{
  if (a3)
  {
    impl = (int8x8_t *)self->_impl;
    *(void *)((char *)&impl[9] + (((unint64_t)*((unsigned __int16 *)a3 + 4) >> 3) & 0x1FF8)) |= 1 << *((_WORD *)a3 + 4);
    int8x8_t v4 = impl[8];
    if (!*(unsigned char *)(*(void *)&v4 + 480))
    {
      *(unsigned char *)(*(void *)&v4 + 480) = 1;
      unint64_t prime = vcvtps_u32_f32(128.0 / *(float *)impl[7].i32);
      if (prime == 1)
      {
        unint64_t prime = 2;
      }
      else if ((prime & (prime - 1)) != 0)
      {
        unint64_t prime = std::__next_prime(prime);
      }
      int8x8_t v6 = impl[4];
      if (prime > *(void *)&v6) {
        goto LABEL_19;
      }
      if (prime < *(void *)&v6)
      {
        unint64_t v7 = vcvtps_u32_f32((float)(unint64_t)impl[6] / *(float *)impl[7].i32);
        if (*(void *)&v6 < 3uLL || (uint8x8_t v8 = (uint8x8_t)vcnt_s8(v6), v8.i16[0] = vaddlv_u8(v8), v8.u32[0] > 1uLL))
        {
          unint64_t v7 = std::__next_prime(v7);
        }
        else
        {
          uint64_t v9 = 1 << -(char)__clz(v7 - 1);
          if (v7 >= 2) {
            unint64_t v7 = v9;
          }
        }
        if (prime <= v7) {
          unint64_t prime = v7;
        }
        if (prime < *(void *)&v6)
        {
LABEL_19:
          std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__do_rehash<true>((uint64_t)&impl[3], prime);
        }
      }
    }
  }
}

- (void)encodeCacheHintFinalize:(unint64_t)a3 resourceGroups:(const void *)a4 count:(unint64_t)a5
{
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
    MTLReportFailure();
  }
  [(AGXG17FamilyCommandBuffer *)self commitEncoder];
  if (a5)
  {
    if (a3 == 1)
    {
      unint64_t v9 = 0;
      unsigned int v10 = 1;
      do
      {
        uint64_t v11 = (unsigned __int16 *)a4[v9];
        if (v11)
        {
          impl = (char *)self->_impl;
          unint64_t v13 = v11[4];
          uint64_t v14 = (v13 >> 3) & 0x1FF8;
          *(void *)&impl[v14 + 72] &= ~(1 << v13);
          *(void *)&impl[v14 + 104] &= ~(1 << v13);
          int8x16_t v15 = vorrq_s8(*(int8x16_t *)(impl + 72), *(int8x16_t *)(impl + 88));
          if (!*(void *)&vorr_s8(*(int8x8_t *)v15.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL))) {
            *(unsigned char *)(*((void *)impl + 8) + 480) = 0;
          }
          uint64_t v16 = [*((id *)impl + 1) reserveKernelCommandBufferSpace:16];
          *(void *)uint64_t v16 = 0x1000010002;
          *(_WORD *)(v16 + 8) = v13;
          [*((id *)impl + 1) commandBufferStorage];
          IOGPUMetalCommandBufferStorageBeginKernelCommands();
          IOGPUMetalCommandBufferStorageEndKernelCommands();
        }
        unint64_t v9 = v10++;
      }
      while (v9 < a5);
    }
    else
    {
      uint64_t v17 = 0;
      do
      {
        v18 = (unsigned __int16 *)a4[v17];
        if (v18)
        {
          v19 = (char *)self->_impl;
          unint64_t v20 = v18[4];
          uint64_t v21 = (v20 >> 3) & 0x1FF8;
          uint64_t v22 = 1 << v20;
          *(void *)&v19[v21 + 72] &= ~v22;
          *(void *)&v19[v21 + 136] &= ~v22;
          int8x16_t v23 = vorrq_s8(*(int8x16_t *)(v19 + 72), *(int8x16_t *)(v19 + 88));
          if (!*(void *)&vorr_s8(*(int8x8_t *)v23.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v23, v23, 8uLL))) {
            *(unsigned char *)(*((void *)v19 + 8) + 480) = 0;
          }
        }
        ++v17;
      }
      while (a5 > v17);
    }
  }
}

- (void)encodeCacheHintTag:(unint64_t)a3 resourceGroups:(const void *)a4 count:(unint64_t)a5
{
  if (a5)
  {
    unint64_t v9 = 0;
    unsigned int v10 = 1;
    do
    {
      uint64_t v11 = (unsigned __int16 *)a4[v9];
      if (v11) {
        AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResourceGroup((uint64_t)self->_impl + 24, v11[4], a3 == 1);
      }
      unint64_t v9 = v10++;
    }
    while (v9 < a5);
  }
}

- (void)setResourceGroups:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v7 = 0;
    unsigned int v8 = 1;
    do
    {
      AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResourceGroup((uint64_t)self->_impl + 24, *((unsigned __int16 *)a3[v7] + 4), 1);
      unint64_t v7 = v8++;
    }
    while (v7 < a4);
  }
}

- (void)dropResourceGroups:(const void *)a3 count:(unint64_t)a4
{
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
    MTLReportFailure();
  }
  [(AGXG17FamilyCommandBuffer *)self commitEncoder];
  if (a4)
  {
    unint64_t v7 = 0;
    unsigned int v8 = 1;
    do
    {
      impl = (char *)self->_impl;
      unint64_t v11 = *((unsigned __int16 *)a3[v7] + 4);
      uint64_t v12 = (v11 >> 3) & 0x1FF8;
      *(void *)&impl[v12 + 72] &= ~(1 << v11);
      *(void *)&impl[v12 + 104] &= ~(1 << v11);
      int8x16_t v13 = vorrq_s8(*(int8x16_t *)(impl + 72), *(int8x16_t *)(impl + 88));
      if (!*(void *)&vorr_s8(*(int8x8_t *)v13.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL))) {
        *(unsigned char *)(*((void *)impl + 8) + 480) = 0;
      }
      uint64_t v9 = [*((id *)impl + 1) reserveKernelCommandBufferSpace:16];
      *(void *)uint64_t v9 = 0x1000010002;
      *(_WORD *)(v9 + 8) = v11;
      [*((id *)impl + 1) commandBufferStorage];
      IOGPUMetalCommandBufferStorageBeginKernelCommands();
      IOGPUMetalCommandBufferStorageEndKernelCommands();
      unint64_t v7 = v8++;
    }
    while (v7 < a4);
  }
}

- (void)reserveKernelCommandBufferSpace:(unint64_t)a3
{
  v5 = [(IOGPUMetalCommandBuffer *)self commandBufferStorage];
  result = v5->var5;
  var6 = v5->var6;
  unsigned int v8 = result;
  if (var6 - (unsigned char *)result < a3)
  {
    [(IOGPUMetalCommandBuffer *)self growKernelCommandBuffer:a3];
    [(IOGPUMetalCommandBuffer *)self getCurrentKernelCommandBufferPointer:&v8 end:&var6];
    result = v8;
  }
  v5->var5 = (char *)result + a3;
  return result;
}

- (void)commitEncoder
{
  previousBlitCommandEncoder = self->_previousBlitCommandEncoder;
  previousComputeCommandEncoder = self->_previousComputeCommandEncoder;
  previousRenderCommandEncoder = self->_previousRenderCommandEncoder;
  if (previousBlitCommandEncoder)
  {
    [(AGXG17FamilyBlitContext *)previousBlitCommandEncoder deferredEndEncoding];

    self->_previousBlitCommandEncoder = 0;
  }
  if (previousComputeCommandEncoder)
  {
    [(AGXG17FamilyComputeContext *)self->_previousComputeCommandEncoder deferredEndEncoding];

    self->_previousComputeCommandEncoder = 0;
  }
  if (previousRenderCommandEncoder)
  {
    [(AGXG17FamilyRenderContext *)self->_previousRenderCommandEncoder deferredEndEncoding:0];

    self->_previousRenderCommandEncoder = 0;
  }
}

- (void)setPreviousRenderCommandEncoder:(id)a3
{
  self->_previousRenderCommandEncoder = (AGXG17FamilyRenderContext *)a3;
}

- (void)setPreviousComputeCommandEncoder:(id)a3
{
  self->_previousComputeCommandEncoder = (AGXG17FamilyComputeContext *)a3;
}

- (void)setPreviousBlitCommandEncoder:(id)a3
{
  self->_previousBlitCommandEncoder = (AGXG17FamilyBlitContext *)a3;
}

- (id)sampledComputeCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  uint64_t v9 = [(IOGPUMetalCommandBuffer *)self device];
  impl = self->_impl;
  impl[20] = 1;
  int v11 = *((_DWORD *)impl + 4);
  BOOL v12 = [a3 dispatchType] == 1 && (*(unsigned char *)(*((void *)v9 + 101) + 7289) & 0x10) == 0;
  v14[0] = v9;
  v14[1] = self;
  v14[2] = 0;
  BOOL v15 = v12;
  id v16 = a3;
  int v17 = v11;
  int v18 = [a3 substreamCount];
  char v19 = [a3 allowCommandEncoderCoalescing];
  char v20 = 0;
  return [(AGXG17FamilyCommandBuffer *)self sampledComputeCommandEncoderWithConfig:v14 programInfoBuffer:a4 capacity:a5];
}

- (id)sampledComputeCommandEncoderWithDispatchType:(unint64_t)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  uint64_t v9 = [(IOGPUMetalCommandBuffer *)self device];
  impl = self->_impl;
  impl[20] = 1;
  int v11 = *((_DWORD *)impl + 4);
  BOOL v12 = a3 == 1 && (*(unsigned char *)(*((void *)v9 + 101) + 7289) & 0x10) == 0;
  v14[0] = v9;
  v14[1] = self;
  v14[2] = 0;
  BOOL v15 = v12;
  uint64_t v16 = 0;
  int v17 = v11;
  int v18 = 0;
  __int16 v19 = 1;
  return [(AGXG17FamilyCommandBuffer *)self sampledComputeCommandEncoderWithConfig:v14 programInfoBuffer:a4 capacity:a5];
}

- (id)sampledComputeCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  impl = self->_impl;
  impl[20] = 1;
  int v8 = *((_DWORD *)impl + 4);
  v10[0] = [(IOGPUMetalCommandBuffer *)self device];
  v10[1] = self;
  v10[2] = 0;
  int v11 = 0;
  uint64_t v12 = 0;
  int v13 = v8;
  int v14 = 0;
  __int16 v15 = 0;
  return [(AGXG17FamilyCommandBuffer *)self sampledComputeCommandEncoderWithConfig:v10 programInfoBuffer:a3 capacity:a4];
}

- (id)sampledComputeCommandEncoderWithConfig:(EncoderComputeServiceConfig *)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  uint64_t v9 = *(void *)([(IOGPUMetalCommandBuffer *)self device] + 808);
  if (!*(unsigned char *)(v9 + 7456) && !*(void *)(v9 + 7448)) {
    MTLReportFailure();
  }
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
    MTLReportFailure();
  }
  if (self->_captureProgramAddressTable) {
    a3->var8 = 1;
  }
  long long v10 = *(_OWORD *)&a3->var2;
  v17[0] = *(_OWORD *)&a3->var0;
  v17[1] = v10;
  v17[2] = *(_OWORD *)&a3->var4;
  uint64_t v18 = *(void *)&a3->var7;
  if ([(AGXG17FamilyCommandBuffer *)self tryCoalescingPreviousComputeCommandEncoderWithConfig:v17 nextEncoderClass:objc_opt_class()])
  {
    int v11 = (AGXG17FamilySampledComputeContext *)[(AGXG17FamilyComputeContext *)self->_previousComputeCommandEncoder reInitWithCommandBuffer:self programInfoBuffer:a4 capacity:a5];
  }
  else
  {
    [(AGXG17FamilyCommandBuffer *)self commitEncoder];
    uint64_t v12 = [AGXG17FamilySampledComputeContext alloc];
    long long v13 = *(_OWORD *)&a3->var2;
    v15[0] = *(_OWORD *)&a3->var0;
    v15[1] = v13;
    v15[2] = *(_OWORD *)&a3->var4;
    uint64_t v16 = *(void *)&a3->var7;
    int v11 = [(AGXG17FamilySampledComputeContext *)v12 initWithCommandBuffer:self config:v15 programInfoBuffer:a4 capacity:a5];
  }
  return v11;
}

- (id)sampledSubRenderCommandEncoderWithDescriptor:(id)a3 subEncoderIndex:(unint64_t)a4 framebuffer:(void *)a5 programInfoBuffer:(id *)a6 capacity:(unint64_t)a7
{
  uint64_t v13 = *(void *)([(IOGPUMetalCommandBuffer *)self device] + 808);
  if (!*(unsigned char *)(v13 + 7456) && !*(void *)(v13 + 7448)) {
    MTLReportFailure();
  }
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
    MTLReportFailure();
  }
  [(AGXG17FamilyCommandBuffer *)self commitEncoder];
  int v14 = [[AGXG17FamilySampledRenderContext alloc] initWithCommandBuffer:self descriptor:a3 subEncoderIndex:a4 framebuffer:a5 programInfoBuffer:a6 capacity:a7];

  return v14;
}

- (id)sampledRenderCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  uint64_t v9 = *(void *)([(IOGPUMetalCommandBuffer *)self device] + 808);
  if (!*(unsigned char *)(v9 + 7456) && !*(void *)(v9 + 7448)) {
    MTLReportFailure();
  }
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
    MTLReportFailure();
  }
  [(AGXG17FamilyCommandBuffer *)self commitEncoder];
  long long v10 = [[AGXG17FamilySampledRenderContext alloc] initWithCommandBuffer:self descriptor:a3 subEncoderIndex:0 framebuffer:0 programInfoBuffer:a4 capacity:a5];

  return v10;
}

- (id)parallelRenderCommandEncoderWithDescriptor:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
    MTLReportFailure();
  }
  [(AGXG17FamilyCommandBuffer *)self commitEncoder];
  v5 = [[AGXG17FamilyThreadedRenderPass alloc] initWithCommandBuffer:self renderPassDescriptor:a3];

  return v5;
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4 agentMask:(unint64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)AGXG17FamilyCommandBuffer;
  [(IOGPUMetalCommandBuffer *)&v7 encodeSignalEvent:a3 value:a4 agentMask:a5];
  [a3 _encodeIOGPUKernelSignalEventAgentCommandArgs:v6 value:0 agentMask:0];
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)AGXG17FamilyCommandBuffer;
  [(IOGPUMetalCommandBuffer *)&v6 encodeSignalEvent:a3 value:a4];
  [a3 _encodeIOGPUKernelSignalEventCommandArgs:&v5 value:0];
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4 timeout:(unsigned int)a5
{
  v7.receiver = self;
  v7.super_class = (Class)AGXG17FamilyCommandBuffer;
  [(IOGPUMetalCommandBuffer *)&v7 encodeWaitForEvent:a3 value:a4 timeout:*(void *)&a5];
  [a3 _encodeIOGPUKernelWaitEventCommandArgs:&v6 value:0 timeout:0];
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)AGXG17FamilyCommandBuffer;
  [(IOGPUMetalCommandBuffer *)&v6 encodeWaitForEvent:a3 value:a4];
  [a3 _encodeIOGPUKernelWaitEventCommandArgs:&v5 value:0 timeout:0];
}

- (id)computeCommandEncoderWithDescriptor:(id)a3
{
  uint64_t v5 = [(IOGPUMetalCommandBuffer *)self device];
  impl = self->_impl;
  impl[20] = 1;
  int v7 = *((_DWORD *)impl + 4);
  BOOL v8 = [a3 dispatchType] == 1 && (*(unsigned char *)(*((void *)v5 + 101) + 7289) & 0x10) == 0;
  v10[0] = v5;
  v10[1] = self;
  v10[2] = 0;
  BOOL v11 = v8;
  id v12 = a3;
  int v13 = v7;
  int v14 = [a3 substreamCount];
  char v15 = [a3 allowCommandEncoderCoalescing];
  char v16 = 0;
  return [(AGXG17FamilyCommandBuffer *)self computeCommandEncoderWithConfig:v10];
}

- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3
{
  uint64_t v5 = [(IOGPUMetalCommandBuffer *)self device];
  impl = self->_impl;
  impl[20] = 1;
  int v7 = *((_DWORD *)impl + 4);
  BOOL v8 = a3 == 1 && (*(unsigned char *)(*((void *)v5 + 101) + 7289) & 0x10) == 0;
  v10[0] = v5;
  v10[1] = self;
  v10[2] = 0;
  BOOL v11 = v8;
  uint64_t v12 = 0;
  int v13 = v7;
  int v14 = 0;
  __int16 v15 = 1;
  return [(AGXG17FamilyCommandBuffer *)self computeCommandEncoderWithConfig:v10];
}

- (id)computeCommandEncoder
{
  impl = self->_impl;
  impl[20] = 1;
  int v4 = *((_DWORD *)impl + 4);
  v6[0] = [(IOGPUMetalCommandBuffer *)self device];
  v6[1] = self;
  v6[2] = 0;
  int v7 = 0;
  uint64_t v8 = 0;
  int v9 = v4;
  int v10 = 0;
  __int16 v11 = 1;
  return [(AGXG17FamilyCommandBuffer *)self computeCommandEncoderWithConfig:v6];
}

- (id)computeCommandEncoderWithConfig:(EncoderComputeServiceConfig *)a3
{
  long long v5 = *(_OWORD *)&a3->var2;
  v12[0] = *(_OWORD *)&a3->var0;
  v12[1] = v5;
  v12[2] = *(_OWORD *)&a3->var4;
  uint64_t v13 = *(void *)&a3->var7;
  if ([(AGXG17FamilyCommandBuffer *)self tryCoalescingPreviousComputeCommandEncoderWithConfig:v12 nextEncoderClass:objc_opt_class()])
  {
    objc_super v6 = [(AGXG17FamilyComputeContext *)self->_previousComputeCommandEncoder reInitWithCommandBuffer:self];
  }
  else
  {
    [(AGXG17FamilyCommandBuffer *)self commitEncoder];
    int v7 = [AGXG17FamilyComputeContext alloc];
    long long v8 = *(_OWORD *)&a3->var2;
    v10[0] = *(_OWORD *)&a3->var0;
    v10[1] = v8;
    v10[2] = *(_OWORD *)&a3->var4;
    uint64_t v11 = *(void *)&a3->var7;
    objc_super v6 = [(AGXG17FamilyComputeContext *)v7 initWithCommandBuffer:self config:v10];
  }
  return v6;
}

- (BOOL)tryCoalescingPreviousComputeCommandEncoderWithConfig:(EncoderComputeServiceConfig *)a3 nextEncoderClass:(Class)a4
{
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
    MTLReportFailure();
  }
  previousComputeCommandEncoder = self->_previousComputeCommandEncoder;
  if (previousComputeCommandEncoder)
  {
    LODWORD(previousComputeCommandEncoder) = [(AGXG17FamilyComputeContext *)previousComputeCommandEncoder isMemberOfClass:a4];
    if (previousComputeCommandEncoder)
    {
      {
        -[AGXG17FamilyCommandBuffer tryCoalescingPreviousComputeCommandEncoderWithConfig:nextEncoderClass:]::disableComputeEncoderRecycling = [(AGXG17FamilyCommandBuffer *)self isComputeEncoderCoalescingDisabled];
      }
      {
        -[AGXG17FamilyCommandBuffer tryCoalescingPreviousComputeCommandEncoderWithConfig:nextEncoderClass:]::disableEncoderRecycling = [(AGXG17FamilyCommandBuffer *)self isEncoderCoalescingDisabled];
      }
      impl = self->_previousComputeCommandEncoder->_impl;
      AGX::ComputeCounterSamplingContextGen1::ComputeCounterSamplingContextGen1((AGX::ComputeCounterSamplingContextGen1 *)&v16, (MTLComputePassDescriptor *)a3->var4);
      int v9 = [(IOGPUMetalCommandBuffer *)self device];
      if (-[AGXG17FamilyCommandBuffer tryCoalescingPreviousComputeCommandEncoderWithConfig:nextEncoderClass:]::disableComputeEncoderRecycling | -[AGXG17FamilyCommandBuffer tryCoalescingPreviousComputeCommandEncoderWithConfig:nextEncoderClass:]::disableEncoderRecycling
        || impl[1888]
        || *((_DWORD *)impl + 4172))
      {
        goto LABEL_10;
      }
      int v10 = v9;
      uint64_t v11 = *((void *)impl + 2111);
      if (v11)
      {
        if (v11 != v16 && v16 != 0 || v17 != -1) {
          goto LABEL_10;
        }
      }
      else if (v17 != -1)
      {
        goto LABEL_10;
      }
      if (*((_DWORD *)impl + 4225) == -1
        && ([(MTLDevice *)v9 disableComputeEncoderCoalescing] & 1) == 0
        && ([(MTLDevice *)v10 disableEncoderCoalescing] & 1) == 0
        && a3->var7)
      {
        if (v16) {
          *((void *)impl + 2111) = v16;
        }
        if (v17 != -1) {
          *((_DWORD *)impl + 4224) = v17;
        }
        if (v18 != -1) {
          *((_DWORD *)impl + 4225) = v18;
        }
        if (*((_DWORD *)impl + 470) == 1 || *((_DWORD *)impl + 4172) >= 2u)
        {
          AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::insertBarrierForCoalescingImpl((uint64_t)impl);
          *((_WORD *)impl + 8580) = 0;
          if (a3->var3 == 1 || a3->var6 >= 2)
          {
            ComputeCoalescingResourceTrackerImpl = (void *)AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::getComputeCoalescingResourceTrackerImpl((uint64_t)impl);
            AGX::ComputeCoalescingResourceTracker<AGX::HAL200::Encoders,AGX::HAL200::Classes>::merge(ComputeCoalescingResourceTrackerImpl);
          }
        }
        *((_DWORD *)impl + 471) = *((_DWORD *)impl + 470);
        *((_DWORD *)impl + 470) = a3->var3;
        LOBYTE(previousComputeCommandEncoder) = 1;
        return (char)previousComputeCommandEncoder;
      }
LABEL_10:
      LOBYTE(previousComputeCommandEncoder) = 0;
    }
  }
  return (char)previousComputeCommandEncoder;
}

- (BOOL)isEncoderCoalescingDisabled
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFE68];
  CFPreferencesSynchronize(@"com.apple.Metal", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  CFBooleanRef v4 = (const __CFBoolean *)CFPreferencesCopyValue(@"disableEncoderCoalescing", @"com.apple.Metal", v2, v3);
  if (!v4) {
    return 0;
  }
  CFBooleanRef v5 = v4;
  BOOL v6 = CFBooleanGetValue(v4) != 0;
  CFRelease(v5);
  return v6;
}

- (BOOL)isBlitEncoderCoalescingDisabled
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFE68];
  CFPreferencesSynchronize(@"com.apple.Metal", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  CFBooleanRef v4 = (const __CFBoolean *)CFPreferencesCopyValue(@"disableBlitEncoderCoalescing", @"com.apple.Metal", v2, v3);
  if (!v4) {
    return 0;
  }
  CFBooleanRef v5 = v4;
  BOOL v6 = CFBooleanGetValue(v4) != 0;
  CFRelease(v5);
  return v6;
}

- (BOOL)isComputeEncoderCoalescingDisabled
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFE68];
  CFPreferencesSynchronize(@"com.apple.Metal", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  CFBooleanRef v4 = (const __CFBoolean *)CFPreferencesCopyValue(@"disableComputeEncoderCoalescing", @"com.apple.Metal", v2, v3);
  if (!v4) {
    return 0;
  }
  CFBooleanRef v5 = v4;
  BOOL v6 = CFBooleanGetValue(v4) != 0;
  CFRelease(v5);
  return v6;
}

- (id)subRenderCommandEncoderWithDescriptor:(id)a3 subEncoderIndex:(unint64_t)a4 framebuffer:(void *)a5
{
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
    MTLReportFailure();
  }
  [(AGXG17FamilyCommandBuffer *)self commitEncoder];
  int v9 = [[AGXG17FamilyRenderContext alloc] initWithCommandBuffer:self descriptor:a3 subEncoderIndex:a4 framebuffer:a5];

  return v9;
}

- (id)renderCommandEncoderWithDescriptor:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
    MTLReportFailure();
  }
  previousRenderCommandEncoder = self->_previousRenderCommandEncoder;
  if (previousRenderCommandEncoder)
  {
    [(AGXG17FamilyRenderContext *)previousRenderCommandEncoder deferredEndEncoding:a3];

    self->_previousRenderCommandEncoder = 0;
  }
  [(AGXG17FamilyCommandBuffer *)self commitEncoder];
  {
    -[AGXG17FamilyCommandBuffer renderCommandEncoderWithDescriptor:]::dcmp_check_mode = 0;
  }
  if (-[AGXG17FamilyCommandBuffer renderCommandEncoderWithDescriptor:]::dcmp_check_mode)
  {
    {
      -[AGXG17FamilyCommandBuffer renderCommandEncoderWithDescriptor:]::induce_corruption = 0;
    }
    for (uint64_t i = 0; i != 8; ++i)
    {
      int v12 = -[AGXG17FamilyCommandBuffer renderCommandEncoderWithDescriptor:]::dcmp_check_mode;
      if (-[AGXG17FamilyCommandBuffer renderCommandEncoderWithDescriptor:]::dcmp_check_mode == 1)
      {
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "objectAtIndexedSubscript:", i), "texture")&& objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "objectAtIndexedSubscript:", i), "texture"), "iosurface"))
        {
          if (!-[AGXG17FamilyCommandBuffer renderCommandEncoderWithDescriptor:]::induce_corruption) {
            goto LABEL_13;
          }
          uint64_t BaseAddressOfPlane = (uint64_t)IOSurfaceGetBaseAddressOfPlane((IOSurfaceRef)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "objectAtIndexedSubscript:", i), "texture"), "iosurface"), 0);
          goto LABEL_12;
        }
        int v12 = -[AGXG17FamilyCommandBuffer renderCommandEncoderWithDescriptor:]::dcmp_check_mode;
      }
      if (v12 != 2
        || !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "objectAtIndexedSubscript:", i), "texture"))
      {
        continue;
      }
      if (-[AGXG17FamilyCommandBuffer renderCommandEncoderWithDescriptor:]::induce_corruption
        && AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getCPUPtr(*(void *)(objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "objectAtIndexedSubscript:", i), "texture")+ 536), 0, 0, 0))
      {
        uint64_t BaseAddressOfPlane = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getCPUPtr(*(void *)(objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "objectAtIndexedSubscript:", i), "texture")+ 536), 0, 0, 0);
LABEL_12:
        int v9 = (void *)BaseAddressOfPlane;
        int v10 = getpagesize();
        memset(v9, 222, v10);
      }
LABEL_13:
      id v11 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "objectAtIndexedSubscript:", i), "texture");
      std::vector<AGXG17FamilyTexture *>::push_back[abi:nn180100]((uint64_t)&self->texturesToEvaluate, objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "objectAtIndexedSubscript:", i), "texture"));
    }
  }
  BOOL v6 = [[AGXG17FamilyRenderContext alloc] initWithCommandBuffer:self descriptor:a3];

  return v6;
}

- (id)accelerationStructureCommandEncoder
{
  return [(AGXG17FamilyCommandBuffer *)self _accelerationStructureCommandEncoderWithDescriptor:0];
}

- (id)_accelerationStructureCommandEncoderWithDescriptor:(id)a3
{
  self->_telemetryUsage.usage[0] |= 0x80uLL;
  if ([(MTLDevice *)[(IOGPUMetalCommandBuffer *)self device] buildBVHForRIA])
  {
    if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
      MTLReportFailure();
    }
    [(AGXG17FamilyCommandBuffer *)self commitEncoder];
    CFBooleanRef v5 = [[AGXG17FamilyRayTracingGPUBuilder alloc] initWithCommandBuffer:self descriptor:a3];
    return v5;
  }
  else if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)AGXG17FamilyCommandBuffer;
    return [(_MTLCommandBuffer *)&v7 accelerationStructureCommandEncoderWithDescriptor:a3];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AGXG17FamilyCommandBuffer;
    return [(_MTLCommandBuffer *)&v8 accelerationStructureCommandEncoder];
  }
}

- (id)resourceStateCommandEncoderWithDescriptor:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
    MTLReportFailure();
  }
  [(AGXG17FamilyCommandBuffer *)self commitEncoder];
  CFBooleanRef v5 = [[AGXG17FamilyResourceStateContext alloc] initWithCommandBuffer:self descriptor:a3];

  return v5;
}

- (id)resourceStateCommandEncoder
{
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
    MTLReportFailure();
  }
  [(AGXG17FamilyCommandBuffer *)self commitEncoder];
  CFStringRef v3 = [[AGXG17FamilyResourceStateContext alloc] initWithCommandBuffer:self descriptor:0];

  return v3;
}

- (id)blitCommandEncoder
{
  return [(AGXG17FamilyCommandBuffer *)self blitCommandEncoderCommon:0];
}

- (id)blitCommandEncoderCommon:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
    MTLReportFailure();
  }
  {
    -[AGXG17FamilyCommandBuffer blitCommandEncoderCommon:]::disableBlitEncoderRecycling = [(AGXG17FamilyCommandBuffer *)self isBlitEncoderCoalescingDisabled];
  }
  {
    -[AGXG17FamilyCommandBuffer blitCommandEncoderCommon:]::disableEncoderRecycling = [(AGXG17FamilyCommandBuffer *)self isEncoderCoalescingDisabled];
  }
  char v5 = [(AGXG17FamilyCommandBuffer *)self getSupportedAndEnabledErrorOptions];
  previousBlitCommandEncoder = self->_previousBlitCommandEncoder;
  if (previousBlitCommandEncoder)
  {
    impl = (char *)previousBlitCommandEncoder->_impl;
    BOOL v8 = impl == 0;
    if (impl) {
      int v9 = impl;
    }
    else {
      int v9 = 0;
    }
    if (impl) {
      int v10 = impl + 1960;
    }
    else {
      int v10 = 0;
    }
  }
  else
  {
    int v9 = 0;
    int v10 = 0;
    BOOL v8 = 1;
  }
  AGX::BlitCounterSamplingContextGen1::BlitCounterSamplingContextGen1((AGX::BlitCounterSamplingContextGen1 *)&v15, (MTLBlitPassDescriptor *)a3, 0);
  if (-[AGXG17FamilyCommandBuffer blitCommandEncoderCommon:]::disableBlitEncoderRecycling | -[AGXG17FamilyCommandBuffer blitCommandEncoderCommon:]::disableEncoderRecycling
    || ([(MTLDevice *)[(IOGPUMetalCommandBuffer *)self device] disableBlitEncoderCoalescing] & 1) != 0|| ((v8 | [(MTLDevice *)[(IOGPUMetalCommandBuffer *)self device] disableEncoderCoalescing]) & 1) != 0|| (uint64_t v13 = *((void *)v9 + 243)) != 0 && *(_DWORD *)(v13 + 528)|| (v5 & 1) != 0|| !v10|| *(void *)v10 && (*(void *)v10 != v15 ? (v14 = v15 == 0) : (v14 = 1), !v14)|| v16 != -1|| *((_DWORD *)v10 + 3) != -1)
  {
    [(AGXG17FamilyCommandBuffer *)self commitEncoder];
    id v11 = [[AGXG17FamilyBlitContext alloc] initWithCommandBuffer:self descriptor:a3];
  }
  else
  {
    if (v15) {
      *(void *)int v10 = v15;
    }
    if (v17 != -1) {
      *((_DWORD *)v10 + 3) = v17;
    }
    id v11 = [(AGXG17FamilyBlitContext *)self->_previousBlitCommandEncoder reInitWithCommandBuffer:self];
  }
  return v11;
}

- (AGXG17FamilyCommandBuffer)initWithQueue:(id)a3 retainedReferences:(BOOL)a4
{
  v23.receiver = self;
  v23.super_class = (Class)AGXG17FamilyCommandBuffer;
  char v5 = [(IOGPUMetalCommandBuffer *)&v23 initWithQueue:a3 retainedReferences:a4];
  BOOL v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(_MTLCommandBuffer *)v5 commandQueue];
    BOOL v8 = (void *)[a3 device];
    uint64_t v9 = v8[101];
    if (*(void *)(v9 + 6624) <= 0x23FuLL)
    {
      v6->_impl = 0;
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v9 + 6636));
      int v10 = *(_DWORD *)(v9 + 6632);
      if (v10)
      {
        unsigned int v11 = v10 - 1;
        *(_DWORD *)(v9 + 6632) = v11;
        int v12 = *(unsigned char **)(v9 + 8 * v11 + 6640);
        os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 6636));
        if (v12)
        {
          bzero(v12, *(void *)(v9 + 6624));
          v6->_impl = v12;
          goto LABEL_8;
        }
      }
      else
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 6636));
      }
      int v12 = malloc_type_calloc(*(void *)(v9 + 6624), 1uLL, 0xC8454162uLL);
      v6->_impl = v12;
      if (v12)
      {
LABEL_8:
        int v13 = *(_DWORD *)(v7 + 972);
        uint64_t v14 = v8[101];
        *int v12 = 1;
        *((void *)v12 + 1) = v6;
        *((_DWORD *)v12 + 4) = v13;
        long long v15 = 0uLL;
        *(_OWORD *)(v12 + 24) = 0u;
        v12[20] = 0;
        *(_OWORD *)(v12 + 40) = 0u;
        *((_DWORD *)v12 + 14) = 1065353216;
        if (*(void *)(v14 + 7008) < 0x1E8uLL)
        {
          __int16 v19 = 0;
          goto LABEL_15;
        }
        int v16 = (size_t *)(v14 + 7008);
        os_unfair_lock_lock((os_unfair_lock_t)(v14 + 7020));
        int v17 = *(_DWORD *)(v14 + 7016);
        if (v17)
        {
          unsigned int v18 = v17 - 1;
          *(_DWORD *)(v14 + 7016) = v18;
          __int16 v19 = (void *)v16[v18 + 2];
          os_unfair_lock_unlock((os_unfair_lock_t)(v14 + 7020));
          if (v19)
          {
            bzero(v19, *v16);
LABEL_14:
            long long v15 = 0uLL;
LABEL_15:
            *((_OWORD *)v12 + 12) = v15;
            *((void *)v12 + 8) = v19;
            *(_OWORD *)(v12 + 72) = v15;
            *(_OWORD *)(v12 + 88) = v15;
            *(_OWORD *)(v12 + 104) = v15;
            *(_OWORD *)(v12 + 120) = v15;
            *(_OWORD *)(v12 + 136) = v15;
            *(_OWORD *)(v12 + 152) = v15;
            *((void *)v12 + 22) = v14;
            *((void *)v12 + 23) = v19;
            *((_OWORD *)v12 + 13) = v15;
            *((_DWORD *)v12 + 56) = 1065353216;
            char v20 = operator new(0x80uLL);
            *((void *)v12 + 24) = v20;
            *((void *)v12 + 25) = 16;
            v20[6] = 0u;
            v20[7] = 0u;
            v20[4] = 0u;
            v20[5] = 0u;
            v20[2] = 0u;
            v20[3] = 0u;
            *char v20 = 0u;
            v20[1] = 0u;
            *((_DWORD *)v12 + 122) = 0;
            bzero(v12 + 232, 0x100uLL);
            uint64_t v21 = *((void *)v12 + 8);
            if (v21)
            {
              *(void *)(v21 + 480) = 0;
              *(_OWORD *)(v21 + 448) = 0uLL;
              *(_OWORD *)(v21 + 464) = 0uLL;
              *(_OWORD *)(v21 + 416) = 0uLL;
              *(_OWORD *)(v21 + 432) = 0uLL;
              *(_OWORD *)(v21 + 384) = 0uLL;
              *(_OWORD *)(v21 + 400) = 0uLL;
              *(_OWORD *)(v21 + 352) = 0uLL;
              *(_OWORD *)(v21 + 368) = 0uLL;
              *(_OWORD *)(v21 + 320) = 0uLL;
              *(_OWORD *)(v21 + 336) = 0uLL;
              *(_OWORD *)(v21 + 288) = 0uLL;
              *(_OWORD *)(v21 + 304) = 0uLL;
              *(_OWORD *)(v21 + 256) = 0uLL;
              *(_OWORD *)(v21 + 272) = 0uLL;
              *(_OWORD *)(v21 + 224) = 0uLL;
              *(_OWORD *)(v21 + 240) = 0uLL;
              *(_OWORD *)(v21 + 192) = 0uLL;
              *(_OWORD *)(v21 + 208) = 0uLL;
              *(_OWORD *)(v21 + 160) = 0uLL;
              *(_OWORD *)(v21 + 176) = 0uLL;
              *(_OWORD *)(v21 + 128) = 0uLL;
              *(_OWORD *)(v21 + 144) = 0uLL;
              *(_OWORD *)(v21 + 96) = 0uLL;
              *(_OWORD *)(v21 + 112) = 0uLL;
              *(_OWORD *)(v21 + 64) = 0uLL;
              *(_OWORD *)(v21 + 80) = 0uLL;
              *(_OWORD *)(v21 + 32) = 0uLL;
              *(_OWORD *)(v21 + 48) = 0uLL;
              *(_OWORD *)uint64_t v21 = 0uLL;
              *(_OWORD *)(v21 + 16) = 0uLL;
            }
            *((_DWORD *)v12 + 134) = 0;
            *((void *)v12 + 66) = 0;
            *((_OWORD *)v12 + 32) = 0uLL;
            *((void *)v12 + 68) = 0;
            v12[568] = 0;
            *(_OWORD *)(v12 + 552) = 0uLL;
            goto LABEL_20;
          }
        }
        else
        {
          os_unfair_lock_unlock((os_unfair_lock_t)(v14 + 7020));
        }
        __int16 v19 = malloc_type_calloc(*v16, 1uLL, 0xC8454162uLL);
        goto LABEL_14;
      }
    }
    [(AGXG17FamilyCommandBuffer *)v6 commit];

    BOOL v6 = 0;
LABEL_20:
    [v8 alertCommandBufferActivityStart];
    v6->deadline = 0;
    v6->deadline_namespace_id = 0;
  }
  return v6;
}

- (void)getDriverEncoderInfoData:(id)a3
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  impl = self->_impl;
  uint64_t v59 = 0;
  v60 = (float *)&v59;
  uint64_t v61 = 0x5812000000;
  v62 = __Block_byref_object_copy__873;
  long long v64 = 0u;
  long long v65 = 0u;
  v63 = __Block_byref_object_dispose__874;
  uint64_t v66 = 0;
  int v67 = 1065353216;
  char v5 = (void *)impl[1];
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v56 = ___ZNK3AGX13CommandBufferINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE39processDebugBufferAndUpdateEncoderInfosEP7NSArrayIPU38objcproto27MTLCommandBufferEncoderInfo11objc_objectE_block_invoke;
  v57 = &unk_26516F328;
  v58 = &v59;
  *(void *)&v68[0] = 0;
  *(void *)&long long v51 = 0;
  [v5 getDebugBufferPointerStart:v68 end:&v51];
  if (*(void *)&v68[0] && (void)v51 && (uint64_t)(v51 - *(void *)&v68[0]) >= 8) {
    ((void (*)(void *))v56)(v55);
  }
  uint64_t v6 = impl[68];
  uint64_t v7 = impl[69];
LABEL_7:
  while (v6 != v7)
  {
    if (**(unsigned char **)v6)
    {
      v6 += 24;
      continue;
    }
    unint64_t v8 = *(void *)(v6 + 16);
    uint64_t v9 = v60;
    int8x8_t v10 = *(int8x8_t *)(v60 + 14);
    if (!*(void *)&v10) {
      goto LABEL_29;
    }
    uint8x8_t v11 = (uint8x8_t)vcnt_s8(v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v12 = *(void *)(v6 + 16);
      if (v8 >= *(void *)&v10) {
        unint64_t v12 = v8 % *(void *)&v10;
      }
    }
    else
    {
      unint64_t v12 = (*(void *)&v10 - 1) & v8;
    }
    uint64_t v13 = *((void *)v60 + 6);
    uint64_t v14 = *(void ***)(v13 + 8 * v12);
    if (!v14 || (long long v15 = (float *)*v14) == 0)
    {
LABEL_29:
      uint64_t v19 = v6 + 24;
      while (v19 != v7)
      {
        uint64_t v20 = *(void *)(v19 + 16);
        v19 += 24;
        if (v20 != v8)
        {
          uint64_t v6 = v19 - 24;
          goto LABEL_7;
        }
      }
      break;
    }
    uint64_t v16 = *(void *)&v10 - 1;
    if (v11.u32[0] < 2uLL)
    {
      while (1)
      {
        uint64_t v17 = *((void *)v15 + 1);
        if (v17 == v8)
        {
          if (*((void *)v15 + 2) == v8) {
            goto LABEL_33;
          }
        }
        else if ((v17 & v16) != v12)
        {
          goto LABEL_29;
        }
        long long v15 = *(float **)v15;
        if (!v15) {
          goto LABEL_29;
        }
      }
    }
    while (1)
    {
      unint64_t v18 = *((void *)v15 + 1);
      if (v18 == v8) {
        break;
      }
      if (v18 >= *(void *)&v10) {
        v18 %= *(void *)&v10;
      }
      if (v18 != v12) {
        goto LABEL_29;
      }
LABEL_24:
      long long v15 = *(float **)v15;
      if (!v15) {
        goto LABEL_29;
      }
    }
    if (*((void *)v15 + 2) != v8) {
      goto LABEL_24;
    }
LABEL_33:
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v21 = *(void *)(v6 + 16);
      if (v8 >= *(void *)&v10) {
        unint64_t v21 = v8 % *(void *)&v10;
      }
    }
    else
    {
      unint64_t v21 = v16 & v8;
    }
    char v22 = *((unsigned char *)v15 + 24);
    objc_super v23 = *(float **)(v13 + 8 * v21);
    do
    {
      v24 = v23;
      objc_super v23 = *(float **)v23;
    }
    while (v23 != v15);
    if (v24 == v60 + 16) {
      goto LABEL_50;
    }
    unint64_t v25 = *((void *)v24 + 1);
    if (v11.u32[0] > 1uLL)
    {
      if (v25 >= *(void *)&v10) {
        v25 %= *(void *)&v10;
      }
    }
    else
    {
      v25 &= v16;
    }
    if (v25 != v21)
    {
LABEL_50:
      if (!*(void *)v15) {
        goto LABEL_51;
      }
      unint64_t v26 = *(void *)(*(void *)v15 + 8);
      if (v11.u32[0] > 1uLL)
      {
        if (v26 >= *(void *)&v10) {
          v26 %= *(void *)&v10;
        }
      }
      else
      {
        v26 &= v16;
      }
      if (v26 != v21) {
LABEL_51:
      }
        *(void *)(v13 + 8 * v21) = 0;
    }
    v27 = *(float **)v15;
    if (*(void *)v15)
    {
      unint64_t v28 = *((void *)v27 + 1);
      if (v11.u32[0] > 1uLL)
      {
        if (v28 >= *(void *)&v10) {
          v28 %= *(void *)&v10;
        }
      }
      else
      {
        v28 &= v16;
      }
      if (v28 != v21)
      {
        *(void *)(*((void *)v9 + 6) + 8 * v28) = v24;
        v27 = *(float **)v15;
      }
    }
    *(void *)v24 = v27;
    *(void *)long long v15 = 0;
    --*((void *)v9 + 9);
    operator delete(v15);
    *(void *)&v68[0] = *(void *)(v6 + 8);
    BYTE8(v68[0]) = v22;
    std::__hash_table<std::__hash_value_type<unsigned long long,AGXSDebugBuffer::KickStatus>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,AGXSDebugBuffer::KickStatus>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,AGXSDebugBuffer::KickStatus>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,AGXSDebugBuffer::KickStatus>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long const,AGXSDebugBuffer::KickStatus>>(v60 + 12, *(unint64_t *)&v68[0], v68);
    v6 += 24;
    uint64_t v7 = impl[69];
    if (v6 == v7) {
      break;
    }
    while (*(void *)(v6 + 16) == v8)
    {
      if (!**(unsigned char **)v6)
      {
        *(void *)&v68[0] = *(void *)(v6 + 8);
        BYTE8(v68[0]) = 0;
        std::__hash_table<std::__hash_value_type<unsigned long long,AGXSDebugBuffer::KickStatus>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,AGXSDebugBuffer::KickStatus>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,AGXSDebugBuffer::KickStatus>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,AGXSDebugBuffer::KickStatus>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long const,AGXSDebugBuffer::KickStatus>>(v60 + 12, *(unint64_t *)&v68[0], v68);
        uint64_t v7 = impl[69];
      }
      v6 += 24;
      if (v6 == v7) {
        goto LABEL_64;
      }
    }
  }
LABEL_64:
  if (*((void *)v60 + 9))
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v29 = [a3 countByEnumeratingWithState:&v51 objects:v68 count:16];
    if (!v29) {
      goto LABEL_105;
    }
    uint64_t v30 = *(void *)v52;
    while (1)
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v52 != v30) {
          objc_enumerationMutation(a3);
        }
        v32 = *(void **)(*((void *)&v51 + 1) + 8 * v31);
        unint64_t v33 = [v32 uniqueID];
        int8x8_t v34 = *(int8x8_t *)(v60 + 14);
        if (!*(void *)&v34) {
          goto LABEL_90;
        }
        uint8x8_t v35 = (uint8x8_t)vcnt_s8(v34);
        v35.i16[0] = vaddlv_u8(v35);
        if (v35.u32[0] > 1uLL)
        {
          unint64_t v36 = v33;
          if (v33 >= *(void *)&v34) {
            unint64_t v36 = v33 % *(void *)&v34;
          }
        }
        else
        {
          unint64_t v36 = (*(void *)&v34 - 1) & v33;
        }
        v37 = *(uint64_t ****)(*((void *)v60 + 6) + 8 * v36);
        if (!v37 || (v38 = *v37) == 0)
        {
LABEL_90:
          uint64_t v42 = 1;
          goto LABEL_91;
        }
        if (v35.u32[0] < 2uLL)
        {
          uint64_t v39 = *(void *)&v34 - 1;
          while (1)
          {
            v41 = v38[1];
            if (v41 == (uint64_t *)v33)
            {
              if (v38[2] == (uint64_t *)v33) {
                goto LABEL_93;
              }
            }
            else if (((unint64_t)v41 & v39) != v36)
            {
              goto LABEL_90;
            }
            v38 = (uint64_t **)*v38;
            if (!v38) {
              goto LABEL_90;
            }
          }
        }
        while (1)
        {
          unint64_t v40 = (unint64_t)v38[1];
          if (v40 == v33) {
            break;
          }
          if (v40 >= *(void *)&v34) {
            v40 %= *(void *)&v34;
          }
          if (v40 != v36) {
            goto LABEL_90;
          }
LABEL_80:
          v38 = (uint64_t **)*v38;
          if (!v38) {
            goto LABEL_90;
          }
        }
        if (v38[2] != (uint64_t *)v33) {
          goto LABEL_80;
        }
LABEL_93:
        unint64_t v43 = *((unsigned __int8 *)v38 + 24);
        if (v43 >= 4) {
          uint64_t v42 = 0;
        }
        else {
          uint64_t v42 = qword_242EAA2F8[v43];
        }
LABEL_91:
        [v32 setErrorState:v42];
        ++v31;
      }
      while (v31 != v29);
      uint64_t v44 = [a3 countByEnumeratingWithState:&v51 objects:v68 count:16];
      uint64_t v29 = v44;
      if (!v44) {
        goto LABEL_105;
      }
    }
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v45 = [a3 countByEnumeratingWithState:&v51 objects:v68 count:16];
  if (v45)
  {
    uint64_t v46 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v52 != v46) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v51 + 1) + 8 * i) setErrorState:1];
      }
      uint64_t v45 = [a3 countByEnumeratingWithState:&v51 objects:v68 count:16];
    }
    while (v45);
  }
LABEL_105:
  _Block_object_dispose(&v59, 8);
  v48 = (void *)*((void *)&v65 + 1);
  if (*((void *)&v65 + 1))
  {
    do
    {
      v49 = (void *)*v48;
      operator delete(v48);
      v48 = v49;
    }
    while (v49);
  }
  v50 = (void *)*((void *)&v64 + 1);
  *((void *)&v64 + 1) = 0;
  if (v50) {
    operator delete(v50);
  }
}

- (void)commitWithDeadline:(unint64_t)a3
{
  [(AGXG17FamilyCommandBuffer *)self setDeadline:a3];
  [(AGXG17FamilyCommandBuffer *)self setDeadline_namespace_id:*((unsigned int *)self->_impl + 134)];

  [(AGXG17FamilyCommandBuffer *)self commit];
}

- (void)commit
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  v53.receiver = self;
  v53.super_class = (Class)AGXG17FamilyCommandBuffer;
  [(IOGPUMetalCommandBuffer *)&v53 validate];
  CFStringRef v3 = [(IOGPUMetalCommandBuffer *)self device];
  CFBooleanRef v4 = [(_MTLCommandBuffer *)self commandQueue];
  char v5 = v4;
  uint64_t v6 = (atomic_ullong *)((char *)v3 + 816);
  unsigned int v7 = *((_DWORD *)v4 + 111);
  if (v7 <= 1) {
    unsigned int v7 = 1;
  }
  atomic_fetch_or((atomic_uint *volatile)v3 + 216, v7);
  unint64_t v8 = self->_telemetryUsage.usage[1];
  atomic_fetch_or(v6, self->_telemetryUsage.usage[0]);
  atomic_fetch_or((atomic_ullong *volatile)v3 + 103, v8);
  if (!*((unsigned char *)v4 + 968))
  {
    if (AGXATelemetry::shouldCaptureTelemetryData(void)::onceToken != -1) {
      dispatch_once(&AGXATelemetry::shouldCaptureTelemetryData(void)::onceToken, &__block_literal_global_6595);
    }
    if (AGXATelemetry::shouldCaptureTelemetryData(void)::shouldCapture)
    {
      unsigned int v22 = atomic_load((unsigned __int16 *)AGXATelemetry::backtracesCaptured);
      if (v22 <= 9)
      {
        v54[0] = MEMORY[0x263EF8330];
        v54[1] = 3221225472;
        v54[2] = ___ZN13AGXATelemetry26telemetryEmitBacktraceInfoEPK26AGXATelemetryBacktraceInfo_block_invoke;
        v54[3] = &__block_descriptor_40_e5_v8__0l;
        v54[4] = (char *)v3 + 816;
        if (AGXATelemetry::telemetryEmitBacktraceInfo(AGXATelemetryBacktraceInfo const*)::onceToken != -1) {
          dispatch_once(&AGXATelemetry::telemetryEmitBacktraceInfo(AGXATelemetryBacktraceInfo const*)::onceToken, v54);
        }
        objc_super v23 = malloc_type_malloc(0x208uLL, 0x1080040751F5E6CuLL);
        v24 = v23;
        if (v23)
        {
          memcpy(v23, (char *)v5 + 448, 0x208uLL);
          unint64_t v25 = v6[9];
          uint64_t block = MEMORY[0x263EF8330];
          uint64_t v56 = 3221225472;
          v57 = ___ZN13AGXATelemetry26telemetryEmitBacktraceInfoEPK26AGXATelemetryBacktraceInfo_block_invoke_2;
          v58 = &__block_descriptor_48_e5_v8__0l;
          uint64_t v59 = v6;
          v60 = v24;
          dispatch_async(v25, &block);
        }
        *((unsigned char *)v5 + 968) = 1;
      }
    }
  }
  impl = self->_impl;
  if (impl[20])
  {
    impl[20] = 1;
    int v10 = *((_DWORD *)impl + 4);
    int v11 = *((_DWORD *)v5 + 243);
    if (v10 != v11)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        impl[20] = 1;
        LODWORD(block) = 67109376;
        HIDWORD(block) = v10;
        LOWORD(v56) = 1024;
        *(_DWORD *)((char *)&v56 + 2) = v11;
        _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: MTLComputeEncoder encoded with priority %u, but MTLCommandQueue is currently set to priority %u, could result in suboptimal perf or higher than expected memory footprint!\n", (uint8_t *)&block, 0xEu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        uint64_t v30 = self->_impl;
        v30[20] = 1;
        LODWORD(v30) = *((_DWORD *)v30 + 4);
        int v31 = *((_DWORD *)v5 + 243);
        LODWORD(block) = 67109376;
        HIDWORD(block) = v30;
        LOWORD(v56) = 1024;
        *(_DWORD *)((char *)&v56 + 2) = v31;
        _os_log_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGX: MTLComputeEncoder encoded with priority %u, but MTLCommandQueue is currently set to priority %u, could result in suboptimal perf or higher than expected memory footprint!\n", (uint8_t *)&block, 0xEu);
      }
    }
  }
  {
    -[AGXG17FamilyCommandBuffer commit]::dcmp_check_mode = 0;
  }
  if (-[AGXG17FamilyCommandBuffer commit]::dcmp_check_mode)
  {
    p_texturesToEvaluate = &self->texturesToEvaluate;
    if (self->texturesToEvaluate.__begin_ != self->texturesToEvaluate.var0)
    {
      id v42 = [(AGXG17FamilyCommandBuffer *)self blitCommandEncoder];
      {
        -[AGXG17FamilyCommandBuffer commit]::dcmp_check_pixel_format = 0;
      }
      if (!v42) {
        abort();
      }
      begin = (id *)p_texturesToEvaluate->__begin_;
      var0 = self->texturesToEvaluate.var0;
      if (p_texturesToEvaluate->__begin_ != var0)
      {
        uint64_t v29 = -[AGXG17FamilyCommandBuffer commit]::dcmp_check_pixel_format;
        do
        {
          id v32 = *begin;
          if (!v29 || [*begin pixelFormat] == v29)
          {
            if ([v32 pixelFormat] == 550 && objc_msgSend(v32, "iosurface"))
            {
              unint64_t v33 = objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 554, objc_msgSend(v32, "width"), objc_msgSend(v32, "height"), 0);
              objc_msgSend(v33, "setUsage:", objc_msgSend(v32, "usage"));
              objc_msgSend(v33, "setStorageMode:", objc_msgSend(v32, "storageMode"));
              id v34 = (id)objc_msgSend((id)objc_msgSend(v32, "device"), "newTextureWithDescriptor:iosurface:plane:", v33, objc_msgSend(v32, "iosurface"), 0);
              [v33 setPixelFormat:1];
              id v35 = (id)objc_msgSend((id)objc_msgSend(v32, "device"), "newTextureWithDescriptor:iosurface:plane:", v33, objc_msgSend(v32, "iosurface"), 1);
              memset(v52, 0, sizeof(v52));
              uint64_t v36 = [v32 width];
              uint64_t v37 = [v32 height];
              v51[0] = v36;
              v51[1] = v37;
              v51[2] = 1;
              memset(v50, 0, sizeof(v50));
              [v42 copyFromTexture:v34 sourceSlice:0 sourceLevel:0 sourceOrigin:v52 sourceSize:v51 toTexture:v34 destinationSlice:0 destinationLevel:0 destinationOrigin:v50];
              memset(v49, 0, sizeof(v49));
              uint64_t v38 = [v32 width];
              uint64_t v39 = [v32 height];
              v48[0] = v38;
              v48[1] = v39;
              v48[2] = 1;
              memset(v47, 0, sizeof(v47));
              [v42 copyFromTexture:v35 sourceSlice:0 sourceLevel:0 sourceOrigin:v49 sourceSize:v48 toTexture:v35 destinationSlice:0 destinationLevel:0 destinationOrigin:v47];
            }
            else
            {
              memset(v46, 0, sizeof(v46));
              uint64_t v40 = [v32 width];
              uint64_t v41 = [v32 height];
              v45[0] = v40;
              v45[1] = v41;
              v45[2] = 1;
              memset(v44, 0, sizeof(v44));
              [v42 copyFromTexture:v32 sourceSlice:0 sourceLevel:0 sourceOrigin:v46 sourceSize:v45 toTexture:v32 destinationSlice:0 destinationLevel:0 destinationOrigin:v44];
            }
          }
          ++begin;
        }
        while (begin != (id *)var0);
      }
      [v42 endEncoding];
    }
  }
  [(AGXG17FamilyCommandBuffer *)self commitEncoder];
  if ([(AGXG17FamilyCommandBuffer *)self getSupportedAndEnabledErrorOptions])
  {
    unint64_t v12 = (id *)self->_impl;
    [v12[1] allocDebugBuffer];
    uint64_t block = 0;
    v54[0] = 0;
    [v12[1] getDebugBufferPointerStart:&block end:v54];
    uint64_t v13 = [v12[1] commandBufferStorage];
    if (block)
    {
      if (v54[0])
      {
        unint64_t v14 = v54[0] - block;
        if (v54[0] - block >= 1)
        {
          if ((unint64_t v15 = (16 * (((unint64_t)(2 * *(_DWORD *)(v13 + 840)) >> 1) & 0x7FFFFFFF)) | 8,
                v15 > v14)
            && (([v12[1] growDebugBuffer:(v15 - v14)],
                 [v12[1] getDebugBufferPointerStart:&block end:v54],
                 unint64_t v14 = v54[0] - block,
                 block)
              ? (BOOL v16 = v54[0] == 0)
              : (BOOL v16 = 1),
                !v16 ? (char v17 = 0) : (char v17 = 1),
                (v17 & 1) != 0)
            || (uint64_t)v14 < (uint64_t)v15)
          {
            AGX::CommandBuffer<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::prepareDebugBufferForSubmission(void)::{lambda(void)#1}::operator()[abi:[AGX] Failed assertion _debugBufferStart __ nullptr && debugBufferEnd __ nullptr && ptrDelta(debugBufferStart_ debugBufferEnd) __ static_cast_intptr_t_(requiredDebugBufferSize)_]();
          }
        }
      }
    }
  }
  unint64_t v18 = self->_impl;
  uint64_t v19 = (void *)*((void *)v18 + 8);
  if (v19)
  {
    uint64_t v20 = (os_unfair_lock_s *)*((void *)v18 + 22);
    os_unfair_lock_lock(v20 + 1755);
    uint64_t os_unfair_lock_opaque = v20[1754]._os_unfair_lock_opaque;
    if (os_unfair_lock_opaque > 7)
    {
      os_unfair_lock_unlock(v20 + 1755);
      free(v19);
    }
    else
    {
      v20[1754]._uint64_t os_unfair_lock_opaque = os_unfair_lock_opaque + 1;
      *(void *)&v20[2 * os_unfair_lock_opaque + 1756]._uint64_t os_unfair_lock_opaque = v19;
      os_unfair_lock_unlock(v20 + 1755);
    }
  }
  *((void *)v18 + 8) = 0;
  [(AGXG17FamilyCommandBuffer *)self gtpContinuePreParse];
  v43.receiver = self;
  v43.super_class = (Class)AGXG17FamilyCommandBuffer;
  [(IOGPUMetalCommandBuffer *)&v43 commit];
}

- (unint64_t)getSupportedAndEnabledErrorOptions
{
  CFStringRef v3 = [(IOGPUMetalCommandBuffer *)self device];
  return *(void *)(*((void *)v3 + 101) + 7872) & [(_MTLCommandBuffer *)self errorOptions];
}

- (void)gtpContinuePreParse
{
  {
  }
  uint64_t v53 = 0;
  unint64_t v54 = 0;
  unint64_t v52 = 0;
  if ([(IOGPUMetalCommandBuffer *)self commandBufferStorage])
  {
    unsigned __int8 v12 = [(IOGPUMetalCommandBuffer *)self getCurrentKernelCommandBufferStart:&v54 current:&v52 end:&v53];
    unint64_t v20 = v54;
    if (v54)
    {
      unint64_t v21 = v52;
      if (v52)
      {
        if (v53 && v54 < v52)
        {
          int v22 = 0;
          while (1)
          {
            unsigned int v24 = *(_DWORD *)v20;
            if (*(int *)v20 >= 0x10000)
            {
              if (v24 - 65539 < 2) {
                goto LABEL_9;
              }
              if (v24 == 0x10000)
              {
                int v23 = *(_DWORD *)(v20 + 32);
                if ((v23 - 2) < 4) {
                  goto LABEL_9;
                }
                if (v23 == 1)
                {
                  *(_WORD *)(v20 + 533) = 0;
                  if (!*(unsigned char *)(v20 + 532)) {
                    goto LABEL_9;
                  }
                  if (v22 > 0)
                  {
                    unsigned int v26 = *(unsigned __int8 *)(v20 + 535);
                    uint64_t v27 = *(unsigned __int8 *)(v20 + 536);
                    if (__PAIR64__(v27, v26) != __PAIR64__(v16, v15)) {
                      goto LABEL_62;
                    }
                    if (*(unsigned __int8 *)(v20 + 537) != v18
                      || *(unsigned __int8 *)(v20 + 538) != v12
                      || *(unsigned __int8 *)(v20 + 539) != v13
                      || *(unsigned __int8 *)(v20 + 540) != v51
                      || *(unsigned __int8 *)(v20 + 541) != v50
                      || *(unsigned __int8 *)(v20 + 542) != v49
                      || *(unsigned __int8 *)(v20 + 543) != v48
                      || *(unsigned __int8 *)(v20 + 544) != v47
                      || *(unsigned __int8 *)(v20 + 545) != v46
                      || *(unsigned __int8 *)(v20 + 546) != v45
                      || *(unsigned __int8 *)(v20 + 547) != v44
                      || *(unsigned __int8 *)(v20 + 548) != v43
                      || *(unsigned __int8 *)(v20 + 549) != v42
                      || *(unsigned __int8 *)(v20 + 550) != v41
                      || *(unsigned __int8 *)(v20 + 551) != v40
                      || *(unsigned __int8 *)(v20 + 552) != v39
                      || *(unsigned __int8 *)(v20 + 553) != v38
                      || *(unsigned __int8 *)(v20 + 554) != v37
                      || *(unsigned __int8 *)(v20 + 555) != v36
                      || *(unsigned __int8 *)(v20 + 556) != v35
                      || *(unsigned __int8 *)(v20 + 557) != v34
                      || *(unsigned __int8 *)(v20 + 558) != self
                      || *(unsigned __int8 *)(v20 + 559) != v2
                      || *(unsigned __int8 *)(v20 + 560) != v3
                      || *(unsigned __int8 *)(v20 + 561) != v4
                      || *(unsigned __int8 *)(v20 + 562) != v14
                      || *(unsigned __int8 *)(v20 + 563) != v5
                      || *(unsigned __int8 *)(v20 + 564) != v6
                      || *(unsigned __int8 *)(v20 + 565) != v7
                      || *(unsigned __int8 *)(v20 + 566) != v8)
                    {
                      uint64_t v27 = v16;
LABEL_62:
                      unsigned __int8 v18 = *(unsigned char *)(v20 + 537);
                      unsigned __int8 v12 = *(unsigned char *)(v20 + 538);
                      unsigned __int8 v13 = *(unsigned char *)(v20 + 539);
                      unsigned __int8 v50 = *(unsigned char *)(v20 + 541);
                      unsigned __int8 v51 = *(unsigned char *)(v20 + 540);
                      unsigned __int8 v49 = *(unsigned char *)(v20 + 542);
                      unsigned __int8 v47 = *(unsigned char *)(v20 + 544);
                      unsigned __int8 v48 = *(unsigned char *)(v20 + 543);
                      unsigned __int8 v45 = *(unsigned char *)(v20 + 546);
                      unsigned __int8 v46 = *(unsigned char *)(v20 + 545);
                      unsigned __int8 v43 = *(unsigned char *)(v20 + 548);
                      unsigned __int8 v44 = *(unsigned char *)(v20 + 547);
                      unsigned __int8 v41 = *(unsigned char *)(v20 + 550);
                      unsigned __int8 v42 = *(unsigned char *)(v20 + 549);
                      unsigned __int8 v39 = *(unsigned char *)(v20 + 552);
                      unsigned __int8 v40 = *(unsigned char *)(v20 + 551);
                      unsigned __int8 v37 = *(unsigned char *)(v20 + 554);
                      unsigned __int8 v38 = *(unsigned char *)(v20 + 553);
                      unsigned __int8 v35 = *(unsigned char *)(v20 + 556);
                      unsigned __int8 v36 = *(unsigned char *)(v20 + 555);
                      unsigned __int8 v34 = *(unsigned char *)(v20 + 557);
                      LOBYTE(self) = *(unsigned char *)(v20 + 558);
                      unsigned __int8 v2 = *(unsigned char *)(v20 + 559);
                      unsigned __int8 v3 = *(unsigned char *)(v20 + 560);
                      unsigned __int8 v4 = *(unsigned char *)(v20 + 561);
                      unsigned __int8 v14 = *(unsigned char *)(v20 + 562);
                      unsigned __int8 v5 = *(unsigned char *)(v20 + 563);
                      unsigned __int8 v6 = *(unsigned char *)(v20 + 564);
                      unsigned __int8 v7 = *(unsigned char *)(v20 + 565);
                      unsigned __int8 v8 = *(unsigned char *)(v20 + 566);
                      int v22 = 1;
                      unint64_t v9 = *(void *)(v20 + 1368);
                      if (v17 == 1)
                      {
                        unint64_t v10 = v20 + 40;
                        unint64_t v19 = v20 + 40;
                      }
                      else
                      {
                        *(unsigned char *)(v19 + 494) = 1;
                        *(unsigned char *)(v10 + 494) = 0;
                        unint64_t v10 = v20 + 40;
                        unint64_t v19 = v20 + 40;
                        int v17 = 1;
                      }
                      uint64_t v16 = v27;
                      unsigned __int8 v15 = v26;
                      goto LABEL_11;
                    }
                    unint64_t v30 = *(void *)(v20 + 1368);
                    unsigned int v32 = v30 >> 20;
                    if (((((v30 >> 20) | (v30 >> 40) | (v30 >> 30)) ^ ((v9 >> 20) | (v9 >> 40) | (v9 >> 30))) & 0x3FF) != 0)
                    {
LABEL_58:
                      if (v17 != 1) {
                        goto LABEL_59;
                      }
                    }
                    else
                    {
                      int v28 = ((v30 >> 20) | BYTE5(v30) | (v30 >> 30));
                      if ((v30 >> 20) | (BYTE5(v30) | (v30 >> 30)))
                      {
                        uint64_t v31 = (v30 >> 40) & 0x3FF;
                        uint64_t v33 = (v9 >> 40) & 0x3FF;
                        do
                        {
                          int v29 = v28 & -v28;
                          if ((v33 & v29 & (v9 >> 20)) != 0)
                          {
                            if (((HIDWORD(v30) >> 8) & 0x3FF & (unsigned __int16)v32 & (unsigned __int16)v29) == 0) {
                              goto LABEL_58;
                            }
                          }
                          else if ((v29 & v31 & v32) == 0)
                          {
                            if ((v33 & v29) != 0)
                            {
                              if ((v29 & v31) == 0) {
                                goto LABEL_58;
                              }
                            }
                            else if (((v9 >> 20) & 0x3FF & v29) != 0 {
                                   && ((v30 >> 20) & 0x3FF & v29) == 0)
                            }
                            {
                              goto LABEL_58;
                            }
                          }
                          if ((v30 & 0x3FF & (unsigned __int16)v29) != 0) {
                            goto LABEL_58;
                          }
                          v28 ^= v29;
                        }
                        while (v28);
                      }
                      if (v17)
                      {
                        *(_WORD *)(v20 + 533) = 257;
                        ++v17;
                        int v22 = 1;
                        unint64_t v9 = v30;
                        unint64_t v10 = v20 + 40;
                        goto LABEL_11;
                      }
LABEL_59:
                      *(unsigned char *)(v19 + 494) = 1;
                      *(unsigned char *)(v10 + 494) = 0;
                    }
                  }
                  unsigned __int8 v15 = *(unsigned char *)(v20 + 535);
                  uint64_t v16 = *(unsigned __int8 *)(v20 + 536);
                  unsigned __int8 v18 = *(unsigned char *)(v20 + 537);
                  unsigned __int8 v12 = *(unsigned char *)(v20 + 538);
                  unsigned __int8 v13 = *(unsigned char *)(v20 + 539);
                  unsigned __int8 v50 = *(unsigned char *)(v20 + 541);
                  unsigned __int8 v51 = *(unsigned char *)(v20 + 540);
                  unsigned __int8 v49 = *(unsigned char *)(v20 + 542);
                  unsigned __int8 v47 = *(unsigned char *)(v20 + 544);
                  unsigned __int8 v48 = *(unsigned char *)(v20 + 543);
                  unsigned __int8 v45 = *(unsigned char *)(v20 + 546);
                  unsigned __int8 v46 = *(unsigned char *)(v20 + 545);
                  unsigned __int8 v43 = *(unsigned char *)(v20 + 548);
                  unsigned __int8 v44 = *(unsigned char *)(v20 + 547);
                  unsigned __int8 v41 = *(unsigned char *)(v20 + 550);
                  unsigned __int8 v42 = *(unsigned char *)(v20 + 549);
                  unsigned __int8 v39 = *(unsigned char *)(v20 + 552);
                  unsigned __int8 v40 = *(unsigned char *)(v20 + 551);
                  unsigned __int8 v37 = *(unsigned char *)(v20 + 554);
                  unsigned __int8 v38 = *(unsigned char *)(v20 + 553);
                  unsigned __int8 v35 = *(unsigned char *)(v20 + 556);
                  unsigned __int8 v36 = *(unsigned char *)(v20 + 555);
                  unsigned __int8 v34 = *(unsigned char *)(v20 + 557);
                  LOBYTE(self) = *(unsigned char *)(v20 + 558);
                  unsigned __int8 v2 = *(unsigned char *)(v20 + 559);
                  unsigned __int8 v3 = *(unsigned char *)(v20 + 560);
                  unsigned __int8 v4 = *(unsigned char *)(v20 + 561);
                  unsigned __int8 v14 = *(unsigned char *)(v20 + 562);
                  unsigned __int8 v5 = *(unsigned char *)(v20 + 563);
                  unsigned __int8 v6 = *(unsigned char *)(v20 + 564);
                  unsigned __int8 v7 = *(unsigned char *)(v20 + 565);
                  unint64_t v10 = v20 + 40;
                  unint64_t v19 = v20 + 40;
                  unsigned __int8 v8 = *(unsigned char *)(v20 + 566);
                  unint64_t v9 = *(void *)(v20 + 1368);
                  int v17 = 1;
                  int v22 = 1;
                }
              }
              else if (v24 == 65538)
              {
                goto LABEL_9;
              }
            }
            else if (v24 <= 0xC)
            {
              int v25 = 1 << v24;
              if ((v25 & 0x1C78) != 0 || (v25 & 0x380) != 0)
              {
LABEL_9:
                if (v22 < 1 || v17 == 1)
                {
                  int v22 = 0;
                }
                else
                {
                  int v22 = 0;
                  *(unsigned char *)(v19 + 494) = 1;
                  *(unsigned char *)(v10 + 494) = 0;
                }
              }
            }
LABEL_11:
            v20 += *(unsigned int *)(v20 + 4);
            if (v21 <= v20)
            {
              if (v22 >= 1 && v17 != 1)
              {
                *(unsigned char *)(v19 + 494) = 1;
                *(unsigned char *)(v10 + 494) = 0;
              }
              return;
            }
          }
        }
      }
    }
  }
}

- (void)dealloc
{
  self->_previousComputeCommandEncoder = 0;
  self->_previousBlitCommandEncoder = 0;
  [(AGXG17FamilyRenderContext *)self->_previousRenderCommandEncoder deferredEndEncoding:0];

  self->_previousRenderCommandEncoder = 0;
  unsigned __int8 v3 = [(IOGPUMetalCommandBuffer *)self device];
  impl = self->_impl;
  if (!impl) {
    goto LABEL_33;
  }
  uint64_t v5 = *((void *)v3 + 101);
  uint64_t v6 = impl[64];
  uint64_t v7 = impl[65];
  *((_OWORD *)impl + 32) = 0u;
  if (v6 > 0 || v7 >= 1)
  {
    if (v6
      && atomic_fetch_add((atomic_ullong *volatile)&AGX::BackgroundObjectProgramVariant<AGX::HAL200::Encoders,AGX::HAL200::Classes>::liveUberVariantUses, -v6) == v6)
    {
      unint64_t v9 = *(NSObject **)(v5 + 8064);
      dispatch_time_t v10 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    }
    if (v7
      && atomic_fetch_add((atomic_ullong *volatile)&AGX::EndOfTileProgramVariant<AGX::HAL200::Encoders,AGX::HAL200::Classes>::liveUberVariantUses, -v7) == v7)
    {
      int v11 = *(NSObject **)(v5 + 8072);
      dispatch_time_t v12 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    }
    impl = self->_impl;
  }
  unsigned __int8 v13 = (void *)impl[68];
  if (v13)
  {
    impl[69] = v13;
    operator delete(v13);
  }
  unsigned __int8 v14 = (void *)impl[8];
  if (!v14)
  {
LABEL_18:
    int v17 = (void *)impl[26];
    if (v17) {
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  unsigned __int8 v15 = (os_unfair_lock_s *)impl[22];
  os_unfair_lock_lock(v15 + 1755);
  uint64_t os_unfair_lock_opaque = v15[1754]._os_unfair_lock_opaque;
  if (os_unfair_lock_opaque <= 7)
  {
    v15[1754]._uint64_t os_unfair_lock_opaque = os_unfair_lock_opaque + 1;
    *(void *)&v15[2 * os_unfair_lock_opaque + 1756]._uint64_t os_unfair_lock_opaque = v14;
    os_unfair_lock_unlock(v15 + 1755);
    goto LABEL_18;
  }
  os_unfair_lock_unlock(v15 + 1755);
  free(v14);
  int v17 = (void *)impl[26];
  if (v17)
  {
    do
    {
LABEL_19:
      unsigned __int8 v18 = (void *)*v17;
      operator delete(v17);
      int v17 = v18;
    }
    while (v18);
  }
LABEL_20:
  unint64_t v19 = (void *)impl[24];
  impl[24] = 0;
  if (v19) {
    operator delete(v19);
  }
  unint64_t v20 = (void *)impl[5];
  if (v20)
  {
    do
    {
      unint64_t v21 = (void *)*v20;
      operator delete(v20);
      unint64_t v20 = v21;
    }
    while (v21);
  }
  int v22 = (void *)impl[3];
  impl[3] = 0;
  if (v22) {
    operator delete(v22);
  }
  int v23 = self->_impl;
  if (v23)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v5 + 6636));
    uint64_t v24 = *(unsigned int *)(v5 + 6632);
    if (v24 > 7)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 6636));
      free(v23);
    }
    else
    {
      *(_DWORD *)(v5 + 6632) = v24 + 1;
      *(void *)(v5 + 8 * v24 + 6640) = v23;
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 6636));
    }
  }
  self->_impl = 0;
LABEL_33:
  objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12B48]), "device"), "alertCommandBufferActivityComplete");
  uint64_t v25 = (int)*MEMORY[0x263F12B28];

  *(Class *)((char *)&self->super.super.super.super.isa + v25) = 0;
  v26.receiver = self;
  v26.super_class = (Class)AGXG17FamilyCommandBuffer;
  [(IOGPUMetalCommandBuffer *)&v26 dealloc];
}

@end