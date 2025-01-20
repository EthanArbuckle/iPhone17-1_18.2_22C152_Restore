@interface AGXG17FamilySampledComputeContext
- (AGXG17FamilySampledComputeContext)initWithCommandBuffer:(id)a3 config:(EncoderComputeServiceConfig *)a4 programInfoBuffer:(id *)a5 capacity:(unint64_t)a6;
- (id)endEncodingAndRetrieveProgramAddressTable;
- (id)reInitWithCommandBuffer:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5;
- (void)dealloc;
- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5;
- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4;
- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
@end

@implementation AGXG17FamilySampledComputeContext

- (id)endEncodingAndRetrieveProgramAddressTable
{
  sampled_impl = self->_sampled_impl;
  if (*((unsigned char *)sampled_impl + 56))
  {
    uint64_t v4 = *((void *)sampled_impl + 6);
    if (HIWORD(*(void *)(v4 + 1624)) + (unsigned __int16)WORD2(*(void *)(v4 + 1624)))
    {
      if (!*((unsigned char *)sampled_impl + 58))
      {
        uint64_t v5 = *(void *)([*(id *)v4 device] + 808);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = ___ZN3AGX6DeviceINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE36setupDriverIntersectionTableIfNeededEv_block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0l;
        block[4] = v5;
        if (AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setupDriverIntersectionTableIfNeeded(void)::onceToken != -1)
        {
          uint64_t v7 = v5;
          dispatch_once(&AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setupDriverIntersectionTableIfNeeded(void)::onceToken, block);
          uint64_t v5 = v7;
        }
        AGX::DriverIntersectionFunctionTableGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::appendProgramAddressTables(*(void *)(*(void *)(v5 + 5152) + 144), *(void *)(*(void *)(v5 + 5152) + 152), *((void **)sampled_impl + 1), *((void **)sampled_impl + 2));
        *((unsigned char *)sampled_impl + 58) = 1;
      }
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)AGXG17FamilySampledComputeContext;
  [(AGXG17FamilyComputeContext *)&v8 endEncoding];
  return (id)[objc_alloc(MEMORY[0x263F12AF8]) initWithEncoderMappings:*((void *)self->_sampled_impl + 1) perInvocationMappings:*(void *)self->_sampled_impl internalMappings:*((void *)self->_sampled_impl + 2)];
}

- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  if (a4->var1 * a4->var0 * a4->var2 <= *(unsigned int *)(*((void *)self->super._impl + 240) + 440))
  {
    sampled_impl = self->_sampled_impl;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v11 = *a3;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v10 = *a4;
    AGX::SampledComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsPerGridImpl(sampled_impl[6], 22, (int *)&v11, &v10);
    if (*((unsigned char *)sampled_impl + 56))
    {
      id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v6 = sampled_impl[6];
      uint64_t v7 = (void *)sampled_impl[2];
      AGX::ComputePipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::appendProgramAddressTables(*(void *)(v6 + 1920), v5);
      uint64_t v8 = *(void *)(v6 + 1720);
      if (v8)
      {
        AGX::StateLoaderProgramsTracker<AGX::HAL200::Device>::appendProgramAddressTables(v8, v5, v7);
        *(_DWORD *)(*(void *)(v6 + 1720) + 8) = 0;
      }
      v9 = (void *)*sampled_impl;
      [v9 addObject:v5];
    }
  }
}

- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  sampled_impl = self->_sampled_impl;
  AGX::SampledComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
  AGX::ComputeService<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithImprovedIndirectBuffer(sampled_impl[6], (uint64_t)a3, a4);
  if (*((unsigned char *)sampled_impl + 56))
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v8 = sampled_impl[6];
    v9 = (void *)sampled_impl[2];
    AGX::ComputePipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::appendProgramAddressTables(*(void *)(v8 + 1920), v7);
    uint64_t v10 = *(void *)(v8 + 1720);
    if (v10)
    {
      AGX::StateLoaderProgramsTracker<AGX::HAL200::Device>::appendProgramAddressTables(v10, v7, v9);
      *(_DWORD *)(*(void *)(v8 + 1720) + 8) = 0;
    }
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v11 = (void *)*sampled_impl;
    [v11 addObject:v7];
  }
}

- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  if (a5->var1 * a5->var0 * a5->var2 <= *(unsigned int *)(*((void *)self->super._impl + 240) + 440))
  {
    sampled_impl = self->_sampled_impl;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v12 = *a5;
    AGX::SampledComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
    AGX::ComputeService<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithIndirectBuffer(sampled_impl[6], (uint64_t)a3, a4, &v12);
    if (*((unsigned char *)sampled_impl + 56))
    {
      id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v9 = sampled_impl[6];
      uint64_t v10 = (void *)sampled_impl[2];
      AGX::ComputePipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::appendProgramAddressTables(*(void *)(v9 + 1920), v8);
      uint64_t v11 = *(void *)(v9 + 1720);
      if (v11)
      {
        AGX::StateLoaderProgramsTracker<AGX::HAL200::Device>::appendProgramAddressTables(v11, v8, v10);
        *(_DWORD *)(*(void *)(v9 + 1720) + 8) = 0;
      }
      objc_msgSend((id)*sampled_impl, "addObject:", v8, *(_OWORD *)&v12.var0, v12.var2);
    }
  }
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  if (LODWORD(a4.length))
  {
    uint64_t v4 = *((void *)self->_sampled_impl + 6);
    v5[0] = 1;
    v5[2] = a4.location;
    v5[3] = LODWORD(a4.location) + LODWORD(a4.length) - 1;
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeCommandsInBufferCommon(v4, (uint64_t)a3, v5);
  }
}

- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  if (a4->var1 * a4->var0 * a4->var2 <= *(unsigned int *)(*((void *)self->super._impl + 240) + 440))
  {
    sampled_impl = self->_sampled_impl;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v10 = *a4;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v9 = *a3;
    AGX::SampledComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernel(sampled_impl[6], (long long *)&v10, (long long *)&v9);
    if (*((unsigned char *)sampled_impl + 56))
    {
      id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v6 = sampled_impl[6];
      id v7 = (void *)sampled_impl[2];
      AGX::ComputePipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::appendProgramAddressTables(*(void *)(v6 + 1920), v5);
      uint64_t v8 = *(void *)(v6 + 1720);
      if (v8)
      {
        AGX::StateLoaderProgramsTracker<AGX::HAL200::Device>::appendProgramAddressTables(v8, v5, v7);
        *(_DWORD *)(*(void *)(v6 + 1720) + 8) = 0;
      }
      objc_msgSend((id)*sampled_impl, "addObject:", v5, *(_OWORD *)&v9.var0, v9.var2);
    }
  }
}

- (void)dealloc
{
  sampled_impl = (id *)self->_sampled_impl;
  if (sampled_impl)
  {

    free(self->_sampled_impl);
    self->_sampled_impl = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AGXG17FamilySampledComputeContext;
  [(AGXG17FamilyComputeContext *)&v4 dealloc];
}

- (id)reInitWithCommandBuffer:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  int v5 = a5;
  v10.receiver = self;
  v10.super_class = (Class)AGXG17FamilySampledComputeContext;
  [(AGXG17FamilyComputeContext *)&v10 reInitWithCommandBuffer:a3];
  sampled_impl = self->_sampled_impl;
  sampled_impl[3] = a4;
  *((_DWORD *)sampled_impl + 8) = v5;
  *((_DWORD *)sampled_impl + 9) = 0;
  return self;
}

- (AGXG17FamilySampledComputeContext)initWithCommandBuffer:(id)a3 config:(EncoderComputeServiceConfig *)a4 programInfoBuffer:(id *)a5 capacity:(unint64_t)a6
{
  int v6 = a6;
  long long v8 = *(_OWORD *)&a4->var2;
  v23[0] = *(_OWORD *)&a4->var0;
  v23[1] = v8;
  v23[2] = *(_OWORD *)&a4->var4;
  uint64_t v24 = *(void *)&a4->var7;
  v22.receiver = self;
  v22.super_class = (Class)AGXG17FamilySampledComputeContext;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v9 = [(AGXG17FamilyComputeContext *)&v22 initWithCommandBuffer:a3 config:v23];
  if (v9)
  {
    objc_super v10 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x5F2CBA36uLL);
    v9->_sampled_impl = v10;
    impl = (unsigned __int8 **)v9->super._impl;
    *(void *)objc_super v10 = 0;
    *((void *)v10 + 1) = 0;
    *((void *)v10 + 2) = 0;
    *((void *)v10 + 3) = a5;
    *((_DWORD *)v10 + 9) = 0;
    *((_DWORD *)v10 + 10) = 0;
    *((_DWORD *)v10 + 8) = v6;
    *((void *)v10 + 6) = impl;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v12 = *impl;
    v10[56] = (*impl)[728];
    *(_WORD *)(v10 + 57) = v12[729];
    uint64_t v13 = *(void *)([v12 device] + 808);
    if (!*(unsigned char *)(v13 + 7456))
    {
      uint64_t v14 = *((void *)v10 + 6);
      do
      {
        int v15 = *(_DWORD *)(v13 + 7460);
        if (v15 == -2) {
          unsigned int v16 = 0;
        }
        else {
          unsigned int v16 = v15 + 1;
        }
        int v17 = *(_DWORD *)(v13 + 7460);
        atomic_compare_exchange_strong((atomic_uint *volatile)(v13 + 7460), (unsigned int *)&v17, v16);
      }
      while (v17 != v15);
      *(_DWORD *)(v14 + 1508) = v15;
      *(unsigned char *)(v14 + 1512) = 1;
    }
    if (v10[56])
    {
      *(void *)objc_super v10 = objc_alloc_init(MEMORY[0x263EFF980]);
      *((void *)v10 + 2) = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
      *((void *)v10 + 1) = v18;
      if (v10[56])
      {
        AGX::USCProfileControlStateLoaderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes>::appendProgramAddressTables((void *)AGX::USCProfileControlStateLoaderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes>::instance, v18, *((void **)v10 + 2));
        if (v10[56])
        {
          uint64_t v19 = *((void *)v10 + 6);
          if (HIWORD(*(void *)(v19 + 1624)) + (unsigned __int16)WORD2(*(void *)(v19 + 1624)))
          {
            if (!v10[58])
            {
              uint64_t v20 = *(void *)([*(id *)v19 device] + 808);
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = ___ZN3AGX6DeviceINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE36setupDriverIntersectionTableIfNeededEv_block_invoke;
              block[3] = &__block_descriptor_40_e5_v8__0l;
              block[4] = v20;
              if (AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setupDriverIntersectionTableIfNeeded(void)::onceToken != -1) {
                dispatch_once(&AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setupDriverIntersectionTableIfNeeded(void)::onceToken, block);
              }
              AGX::DriverIntersectionFunctionTableGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::appendProgramAddressTables(*(void *)(*(void *)(v20 + 5152) + 144), *(void *)(*(void *)(v20 + 5152) + 152), *((void **)v10 + 1), *((void **)v10 + 2));
              v10[58] = 1;
            }
          }
        }
      }
    }
  }
  return v9;
}

@end