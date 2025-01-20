@interface AGXG17FamilyResourceStateContext
- (AGXG17FamilyResourceStateContext)initWithCommandBuffer:(id)a3;
- (AGXG17FamilyResourceStateContext)initWithCommandBuffer:(id)a3 descriptor:(id)a4;
- (void)endEncoding;
- (void)moveTextureMappingsFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11;
- (void)updateFence:(id)a3;
- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 indirectBuffer:(id)a5 indirectBufferOffset:(unint64_t)a6;
- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 region:(id *)a5 mipLevel:(unint64_t)a6 slice:(unint64_t)a7;
- (void)updateTextureMappings:(id)a3 mode:(unint64_t)a4 regions:(id *)a5 mipLevels:(const unint64_t *)a6 slices:(const unint64_t *)a7 numRegions:(unint64_t)a8;
- (void)waitForFence:(id)a3;
@end

@implementation AGXG17FamilyResourceStateContext

- (void)moveTextureMappingsFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  v11[0] = *a6;
  v11[1] = *a7;
  AGX::BlitDispatchContextGen2<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::sparseTexture((uint32x2_t *)self->_impl, (uint64_t)a3, (int *)v11, a5, a4, 0, 0, 0, 0, (uint64_t)a8, (uint64_t)a11, a10, a9);
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 indirectBuffer:(id)a5 indirectBufferOffset:(unint64_t)a6
{
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 region:(id *)a5 mipLevel:(unint64_t)a6 slice:(unint64_t)a7
{
}

- (void)updateTextureMappings:(id)a3 mode:(unint64_t)a4 regions:(id *)a5 mipLevels:(const unint64_t *)a6 slices:(const unint64_t *)a7 numRegions:(unint64_t)a8
{
  uint64_t v8 = a8;
  if (a8)
  {
    int v12 = a4;
    impl = (uint32x2_t *)self->_impl;
    do
    {
      unsigned int v16 = *(_DWORD *)a6++;
      uint64_t v15 = v16;
      unsigned int v17 = *(_DWORD *)a7++;
      AGX::BlitDispatchContextGen2<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::sparseTexture(impl, (uint64_t)a3, (int *)a5++, v15, v17, v12, 0, 0, 0, 0, 0, 0, 0);
      --v8;
    }
    while (v8);
  }
}

- (void)waitForFence:(id)a3
{
  impl = self->_impl;
  if (*((void *)impl + 186)) {
    MTLResourceListAddResource();
  }
  if (!*((void *)impl + 244)) {
    operator new();
  }
  unsigned int v5 = *(unsigned __int16 *)((char *)a3 + (int)*MEMORY[0x263F4B168]);
  v6 = (AGX::FenceList *)*((void *)impl + 244);

  AGX::FenceList::insertFence(v6, v5);
}

- (void)updateFence:(id)a3
{
  impl = self->_impl;
  if (*((void *)impl + 186)) {
    MTLResourceListAddResource();
  }
  if (!*((void *)impl + 243)) {
    operator new();
  }
  unsigned int v5 = *(unsigned __int16 *)((char *)a3 + (int)*MEMORY[0x263F4B168]);
  v6 = (AGX::FenceList *)*((void *)impl + 243);

  AGX::FenceList::insertFence(v6, v5);
}

- (void)endEncoding
{
  if (self->_impl)
  {
    uint64_t v3 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F12B70]) device];
    impl = self->_impl;
    unint64_t v5 = impl[248];
    unint64_t v6 = impl[249];
    atomic_fetch_or((atomic_ullong *volatile)(v3 + 816), v5);
    atomic_fetch_or((atomic_ullong *volatile)(v3 + 824), v6);
    AGX::BlitDispatchContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::commit((uint64_t)self->_impl, v7, v8, v9);
    AGX::BlitDispatchContextGen2<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::~BlitDispatchContextGen2((void *)self->_impl);
    free(self->_impl);
    self->_impl = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)AGXG17FamilyResourceStateContext;
  [(IOGPUMetalCommandEncoder *)&v10 endEncoding];
}

- (AGXG17FamilyResourceStateContext)initWithCommandBuffer:(id)a3 descriptor:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)AGXG17FamilyResourceStateContext;
  id v6 = -[IOGPUMetalCommandEncoder initWithCommandBuffer:](&v11, sel_initWithCommandBuffer_);
  if (v6)
  {
    __n128 v7 = malloc_type_calloc(0x1A50uLL, 1uLL, 0xFEF93785uLL);
    *((void *)v6 + 11) = v7;
    if (v7)
    {
      v10[2] = objc_msgSend(a3, "commandBufferStorage", objc_msgSend(a3, "device"), a3);
      v10[3] = v6;
      v10[4] = [a3 globalTraceObjectID];
      v10[5] = [v6 globalTraceObjectID];
      uint64x2_t v8 = (void *)AGX::BlitDispatchContextGen2<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::BlitDispatchContextGen2(*((void *)v6 + 11), v10, 0, (MTLResourceStatePassDescriptor *)a4);
      *uint64x2_t v8 = &unk_26F851FA0;
      v8[840] = v8[183];
      v8[841] = 0;
    }
    else
    {
      [v6 endEncoding];

      return 0;
    }
  }
  return (AGXG17FamilyResourceStateContext *)v6;
}

- (AGXG17FamilyResourceStateContext)initWithCommandBuffer:(id)a3
{
  return [(AGXG17FamilyResourceStateContext *)self initWithCommandBuffer:a3 descriptor:0];
}

@end