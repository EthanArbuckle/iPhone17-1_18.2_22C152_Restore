@interface AGXG17FamilySampledRenderContext
- (AGXG17FamilySampledRenderContext)initWithCommandBuffer:(id)a3 descriptor:(id)a4 subEncoderIndex:(unint64_t)a5 framebuffer:(void *)a6 programInfoBuffer:(id *)a7 capacity:(unint64_t)a8;
- (id)endEncodingAndRetrieveProgramAddressTable;
- (void)dealloc;
- (void)destroyImpl;
- (void)dispatchThreadsPerTile:(id *)a3;
- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4;
- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4 withRenderTargetArrayIndex:(unsigned int)a5;
- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9;
- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8;
- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6;
- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7;
- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9;
- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7;
- (void)setRenderPipelineState:(id)a3;
@end

@implementation AGXG17FamilySampledRenderContext

- (void)destroyImpl
{
  v2 = self;
  uint64_t v75 = *MEMORY[0x263EF8340];
  if (!self->super._impl) {
    goto LABEL_74;
  }
  sampled_impl = (unsigned int *)self->_sampled_impl;
  if (!sampled_impl || !*((unsigned char *)sampled_impl + 64)) {
    goto LABEL_74;
  }
  uint64_t v4 = *((void *)sampled_impl + 6);
  if (!*(unsigned char *)(v4 + 36658)) {
    goto LABEL_71;
  }
  uint64_t v5 = *(void *)(*(void *)(v4 + 1456) + 808);
  v6 = (uint64_t *)operator new(0x38uLL);
  uint64_t v61 = v5;
  v62 = v2;
  AGX::Framebuffer<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::populateFastClearConfig(*(unsigned char **)(v4 + 1968), (unsigned int *)&block);
  int v66 = 95;
  v68 = 0;
  uint64_t v69 = 0;
  __p = 0;
  v65 = &unk_26F8531D0;
  unsigned int v70 = 6;
  uint64_t v63 = v4;
  uint64_t *v6 = AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::findOrCreateBlitProgramVariant(*(void *)(*(void *)(v4 + 1456) + 808), (uint64_t)&v65);
  v70 &= ~4u;
  v73[0] = 0;
  v73[1] = 0;
  char v74 = 0;
  uint64_t v7 = block;
  if (block)
  {
    v8 = v72;
    do
    {
      uint64_t v9 = *v8;
      unsigned int v10 = *(unsigned __int8 *)(*(void *)(*v8 + 208) + 88);
      BOOL isLargeMacroblock = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::isLargeMacroblock(*v8);
      LODWORD(v12) = 4 * v10;
      if (isLargeMacroblock) {
        uint64_t v12 = v12;
      }
      else {
        uint64_t v12 = v10;
      }
      uint64_t v13 = *(void *)(v9 + 32);
      unint64_t v14 = v13 & 0xFFFFFFFFFFFFFFFELL;
      if ((unint64_t)(v13 - 631) < 2
        || v14 == 552
        || v14 == 638
        || v14 == 640
        || (unint64_t)(v13 - 633) < 5
        || v13 == 630)
      {
        uint64_t v12 = 5;
      }
      *((unsigned char *)v73 + v12) = 1;
      v8 += 16;
      --v7;
    }
    while (v7);
  }
  v21 = v6 + 1;
  v20 = v6;
  v22 = (char *)(v6 + 7);
  v23 = &AGX::BlitDispatchParametersGen2_2<AGX::HAL200::Encoders,AGX::HAL200::Classes>::validTexelSize;
  uint64_t v24 = v4;
  do
  {
    if (!*((unsigned char *)v73 + *v23)) {
      goto LABEL_30;
    }
    unsigned int v70 = v70 & 0xFFFFF807 | (8 * *v23);
    uint64_t BlitProgramVariant = AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::findOrCreateBlitProgramVariant(*(void *)(*(void *)(v24 + 1456) + 808), (uint64_t)&v65);
    uint64_t v26 = BlitProgramVariant;
    if (v21 < (uint64_t *)v22)
    {
      *v21++ = BlitProgramVariant;
      goto LABEL_30;
    }
    int64_t v27 = (char *)v21 - (char *)v20;
    uint64_t v28 = v21 - v20;
    unint64_t v29 = v28 + 1;
    if ((unint64_t)(v28 + 1) >> 61) {
      abort();
    }
    if ((v22 - (char *)v20) >> 2 > v29) {
      unint64_t v29 = (v22 - (char *)v20) >> 2;
    }
    if ((unint64_t)(v22 - (char *)v20) >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v30 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v30 = v29;
    }
    if (v30)
    {
      if (v30 >> 61) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      v31 = (char *)operator new(8 * v30);
      v32 = v21;
    }
    else
    {
      v32 = v21;
      v31 = 0;
    }
    v33 = (uint64_t *)&v31[8 * v28];
    uint64_t *v33 = v26;
    v34 = v33 + 1;
    if (v32 != v20)
    {
      v35 = v32;
      v36 = v32 - 1;
      unint64_t v37 = (char *)(v32 - 1) - (char *)v20;
      if (v37 >= 0x58)
      {
        if ((unint64_t)((char *)v36 - &v31[v27] + 8) >= 0x20)
        {
          uint64_t v39 = (v37 >> 3) + 1;
          v40 = v35;
          v38 = &v35[-(v39 & 0x3FFFFFFFFFFFFFFCLL)];
          v41 = &v31[8 * v28 - 16];
          v42 = (long long *)(v40 - 2);
          uint64_t v43 = v39 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v44 = *v42;
            *((_OWORD *)v41 - 1) = *(v42 - 1);
            *(_OWORD *)v41 = v44;
            v41 -= 32;
            v42 -= 2;
            v43 -= 4;
          }
          while (v43);
          v33 -= v39 & 0x3FFFFFFFFFFFFFFCLL;
          if (v39 == (v39 & 0x3FFFFFFFFFFFFFFCLL)) {
            goto LABEL_52;
          }
        }
        else
        {
          v38 = v35;
        }
      }
      else
      {
        v38 = v35;
      }
      do
      {
        uint64_t v45 = *--v38;
        *--v33 = v45;
      }
      while (v38 != v20);
    }
LABEL_52:
    v22 = &v31[8 * v30];
    if (v20) {
      operator delete(v20);
    }
    v20 = v33;
    v21 = v34;
    uint64_t v24 = v63;
LABEL_30:
    ++v23;
  }
  while (v23 != (int *)&agxaBindNullResourceToHardwareCommand(IOGPUResourceList *,unsigned int)::null_resource_data);
  v65 = &unk_26F853210;
  if (__p)
  {
    v68 = __p;
    operator delete(__p);
  }
  if (v20 != v21)
  {
    v46 = (unsigned __int8 *)(v61 + 7456);
    v47 = v20;
    do
    {
      uint64_t v48 = *v47;
      uint64_t v49 = *((void *)sampled_impl + 3) + 24 * sampled_impl[9];
      int v50 = *v46;
      *(unsigned char *)uint64_t v49 = 102;
      int v51 = *(_DWORD *)(*((void *)sampled_impl + 6) + 1508);
      if (v50)
      {
        *(_DWORD *)(v49 + 4) = v51;
        *(_DWORD *)uint64_t v49 = -154;
      }
      else
      {
        *(_DWORD *)uint64_t v49 = (v51 << 8) | 0x66;
        *(_DWORD *)(v49 + 4) = -1;
      }
      *(void *)(v49 + 8) = *(void *)(v48 + 608);
      *(void *)(v49 + 16) = *(void *)(v48 + 832) + *(void *)(v48 + 608);
      sampled_impl[9] = (sampled_impl[9] + 1) % sampled_impl[8];
      uint64_t v52 = *(void *)(v48 + 520);
      v53 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:*(void *)(v48 + 656) length:*(void *)(v48 + 832)];
      uint64_t v54 = [objc_alloc(MEMORY[0x263F12AF0]) initWithBinary:v53 uniqueIdentifier:v52 debugIdentifier:*(unsigned int *)(v48 + 512)];

      id v55 = (id)[*((id *)sampled_impl + 2) objectForKey:@"blit-vertex-fast-clear"];
      if (!v55)
      {
        id v55 = objc_alloc_init(MEMORY[0x263EFF980]);
        [*((id *)sampled_impl + 2) setObject:v55 forKeyedSubscript:@"blit-vertex-fast-clear"];
      }
      objc_msgSend(v55, "addObject:", v54, v61);
      objc_msgSend(*(id *)sampled_impl, "addObject:", objc_msgSend(objc_alloc(MEMORY[0x263F12B00]), "initWithMappedAddress:mappedSize:binaryUniqueId:type:", *(void *)(v48 + 608), *(void *)(v48 + 832), v52, @"blit-vertex-fast-clear"));
      ++v47;
    }
    while (v47 != v21);
  }
  uint64_t v56 = *((void *)sampled_impl + 6);
  v2 = v62;
  if (HIWORD(*(void *)(v56 + 1624)) + (unsigned __int16)WORD2(*(void *)(v56 + 1624)))
  {
    uint64_t v57 = *(void *)(*(void *)(v56 + 1456) + 808);
    uint64_t block = MEMORY[0x263EF8330];
    v72[0] = 3221225472;
    v72[1] = ___ZN3AGX6DeviceINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE36setupDriverIntersectionTableIfNeededEv_block_invoke;
    v72[2] = &__block_descriptor_40_e5_v8__0l;
    v72[3] = v57;
    if (AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setupDriverIntersectionTableIfNeeded(void)::onceToken != -1) {
      dispatch_once(&AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setupDriverIntersectionTableIfNeeded(void)::onceToken, &block);
    }
    AGX::DriverIntersectionFunctionTableGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::appendProgramAddressTables(*(void *)(*(void *)(v57 + 5152) + 144), *(void *)(*(void *)(v57 + 5152) + 152), *(void **)sampled_impl, *((void **)sampled_impl + 2));
  }
  if (v20) {
    operator delete(v20);
  }
LABEL_71:
  v58 = v2->_sampled_impl;
  if (*((unsigned char *)v58 + 64))
  {
    uint64_t v59 = *((void *)v58 + 6);
    uint64_t v60 = *(void *)(v59 + 1752);
    if (v60)
    {
      AGX::StateLoaderProgramsTracker<AGX::HAL200::Device>::appendProgramAddressTables(v60, *(void **)v58, *((void **)v58 + 2));
      *(_DWORD *)(*(void *)(v59 + 1752) + 8) = 0;
    }
  }
LABEL_74:
  v64.receiver = v2;
  v64.super_class = (Class)AGXG17FamilySampledRenderContext;
  [(AGXG17FamilyRenderContext *)&v64 destroyImpl];
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  v4.receiver = self;
  v4.super_class = (Class)AGXG17FamilySampledRenderContext;
  [(AGXG17FamilyRenderContext *)&v4 endEncoding];
  return (id)[objc_alloc(MEMORY[0x263F12AF8]) initWithEncoderMappings:*(void *)self->_sampled_impl perInvocationMappings:*((void *)self->_sampled_impl + 1) internalMappings:*((void *)self->_sampled_impl + 2)];
}

- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6
{
  unsigned int v6 = a4;
  sampled_impl = self->_sampled_impl;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = *a5;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20 = *a6;
  AGX::SampledRenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
  uint64_t v9 = sampled_impl[6];
  uint64_t v10 = *(void *)(v9 + 36552);
  if (v10)
  {
    v11 = (void *)(v9 + 91168);
    uint64_t v12 = *(void *)(v10 + 32);
    if (v12)
    {
      BOOL v13 = *(unsigned char *)(v12 + 3410) == 0;
      char v14 = 49;
      if (!v13) {
        char v14 = 50;
      }
    }
    else
    {
      char v14 = 50;
    }
    *v11 |= 1 << v14;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = v21;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = v20;
    AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::drawMeshThreadgroupsWithIndirectBuffer(v10, (uint64_t)a3, v6, &v23, (unsigned int *)&v22);
  }
  if (*((unsigned char *)sampled_impl + 64))
  {
    id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v16 = sampled_impl[6];
    v17 = (void *)sampled_impl[2];
    AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::appendProgramAddressTables(*(void *)(v16 + 38976), v15);
    uint64_t v18 = *(void *)(v16 + 1752);
    if (v18)
    {
      AGX::StateLoaderProgramsTracker<AGX::HAL200::Device>::appendProgramAddressTables(v18, v15, v17);
      *(_DWORD *)(*(void *)(v16 + 1752) + 8) = 0;
    }
    v19 = (void *)sampled_impl[1];
    [v19 addObject:v15];
  }
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  sampled_impl = self->_sampled_impl;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v19 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v18 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v17 = *a5;
  AGX::SampledRenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
  uint64_t v6 = sampled_impl[6];
  uint64_t v7 = *(void *)(v6 + 36552);
  if (v7)
  {
    v8 = (void *)(v6 + 91168);
    uint64_t v9 = *(void *)(v7 + 32);
    if (v9)
    {
      BOOL v10 = *(unsigned char *)(v9 + 3410) == 0;
      char v11 = 49;
      if (!v10) {
        char v11 = 50;
      }
    }
    else
    {
      char v11 = 50;
    }
    *v8 |= 1 << v11;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = v19;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = v18;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v20 = v17;
    AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::drawMeshThreads(v7, (uint64_t *)&v22, (unsigned int *)&v21, (unsigned int *)&v20);
  }
  if (*((unsigned char *)sampled_impl + 64))
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v13 = sampled_impl[6];
    char v14 = (void *)sampled_impl[2];
    AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::appendProgramAddressTables(*(void *)(v13 + 38976), v12);
    uint64_t v15 = *(void *)(v13 + 1752);
    if (v15)
    {
      AGX::StateLoaderProgramsTracker<AGX::HAL200::Device>::appendProgramAddressTables(v15, v12, v14);
      *(_DWORD *)(*(void *)(v13 + 1752) + 8) = 0;
    }
    uint64_t v16 = (void *)sampled_impl[1];
    [v16 addObject:v12];
  }
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  sampled_impl = self->_sampled_impl;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v19 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v18 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v17 = *a5;
  AGX::SampledRenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
  uint64_t v6 = sampled_impl[6];
  uint64_t v7 = *(void *)(v6 + 36552);
  if (v7)
  {
    v8 = (void *)(v6 + 91168);
    uint64_t v9 = *(void *)(v7 + 32);
    if (v9)
    {
      BOOL v10 = *(unsigned char *)(v9 + 3410) == 0;
      char v11 = 49;
      if (!v10) {
        char v11 = 50;
      }
    }
    else
    {
      char v11 = 50;
    }
    *v8 |= 1 << v11;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = v19;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = v18;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v20 = v17;
    AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::drawMeshThreadgroups(v7, (uint64_t)&v22, (uint64_t)&v21, (unsigned int *)&v20);
  }
  if (*((unsigned char *)sampled_impl + 64))
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v13 = sampled_impl[6];
    char v14 = (void *)sampled_impl[2];
    AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::appendProgramAddressTables(*(void *)(v13 + 38976), v12);
    uint64_t v15 = *(void *)(v13 + 1752);
    if (v15)
    {
      AGX::StateLoaderProgramsTracker<AGX::HAL200::Device>::appendProgramAddressTables(v15, v12, v14);
      *(_DWORD *)(*(void *)(v13 + 1752) + 8) = 0;
    }
    uint64_t v16 = (void *)sampled_impl[1];
    [v16 addObject:v12];
  }
}

- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9
{
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11
{
}

- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7
{
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9
{
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8
{
  unsigned int v8 = a8;
  unsigned int v37 = a6;
  sampled_impl = self->_sampled_impl;
  AGX::SampledRenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
  unint64_t v13 = sampled_impl[6];
  char v14 = (unsigned char *)(v13 + 38641);
  uint64_t v15 = (int *)MEMORY[0x263F4B188];
  if (((*(void *)(*(void *)(v13 + 38960) + 2024) | *(void *)(*(void *)(v13 + 38960) + 1976)) & 0x700000000000) != 0)
  {
    uint64_t v16 = (char *)a7 + (int)*MEMORY[0x263F4B188];
    uint64_t v17 = *((void *)v16 + 1);
    *(void *)(v13 + 90088) |= 0x700000000000uLL;
    *(void *)(v13 + 90472) |= 0x40uLL;
    *(int64x2_t *)(v13 + 39880) = vaddq_s64(vdupq_n_s64(v17 + (unint64_t)v8), (int64x2_t)xmmword_242EA8740);
    *(int64x2_t *)(v13 + 40400) = vaddq_s64(*(int64x2_t *)(v13 + 40400), (int64x2_t)xmmword_242EA8750);
    *(void *)(v13 + 78536) = v16;
    *(void *)(v13 + 78544) = v16;
  }
  if (!*v14)
  {
    *char v14 = 1;
    *(void *)(v13 + 90472) |= 1uLL;
  }
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeISPPrimitiveType(v13, a3);
  uint64_t v18 = *v15;
  int64x2_t v36 = *(int64x2_t *)((char *)a5 + v18 + 8);
  if (*(id *)(v13 + 38664) != a5)
  {
    AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(*(void **)(v13 + 1592), (uint64_t)a5, 1);
    IOGPUResourceListAddResource();
    if (*(void *)(v13 + 1480)) {
      MTLResourceListAddResource();
    }
    *(void *)(v13 + 38664) = a5;
    uint64_t v18 = *v15;
  }
  uint64_t v19 = *(void *)((char *)a7 + v18 + 8);
  if (*(id *)(v13 + 38672) != a7)
  {
    AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(*(void **)(v13 + 1592), (uint64_t)a7, 65);
    IOGPUResourceListAddResource();
    if (*(void *)(v13 + 1480)) {
      MTLResourceListAddResource();
    }
    *(void *)(v13 + 38672) = a7;
  }
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeAndEmitRenderState(v13, *(void *)(v13 + 38960), *(void *)(v13 + 38968), v13 + 38992, v13 + 49184, v13 + 90088, 0);
  if (*(unsigned char *)(*(void *)(v13 + 1968) + 3908))
  {
    unsigned int v20 = (0x114u >> a3) & 1;
    if (a3 >= 9) {
      unsigned int v20 = 0;
    }
  }
  else
  {
    unsigned int v20 = *(unsigned char *)(v13 + 38643) != 0;
  }
  LODWORD(v21) = *(_DWORD *)(v13 + 38644);
  if (v21 >= 0xFFFF) {
    unsigned int v22 = 0xFFFF;
  }
  else {
    unsigned int v22 = *(_DWORD *)(v13 + 38644);
  }
  if (a4 == 1) {
    uint64_t v21 = v21;
  }
  else {
    uint64_t v21 = v22;
  }
  uint64_t v23 = v19 + v8;
  uint64_t v24 = *(int8x8_t **)(v13 + 64);
  *uint64_t v24 = (int8x8_t)((v21 << 32) | 0x40000001);
  int v25 = AGX::VDMEncoderGen5<AGX::HAL200::ESLEncoder,AGX::HAL200::DeviceConstants,AGX::HAL200::VsStateConfig>::PrimitiveTypeToVDMCTRLTypeIndexedDrawIndirect[a3];
  *(void *)(v13 + 91176) |= 1uLL;
  if (v20) {
    int v26 = 0x10000;
  }
  else {
    int v26 = 0;
  }
  *(void *)(v13 + 64) = v24 + 4;
  v24[2].i32[0] = WORD2(v23);
  v24[2].i32[1] = v23 & 0xFFFFFFFC;
  int64x2_t v27 = vdupq_n_s64(3uLL);
  v27.i64[0] = v37;
  uint64x2_t v28 = (uint64x2_t)vaddq_s64(v36, v27);
  __int32 v29 = v28.i32[0];
  unsigned int v30 = v28.u8[4] | v26 | (v25 + (a4 << 17)) & 0xFFEEFF00 | 0x100000;
  *(int32x2_t *)v28.i8 = vmovn_s64((int64x2_t)vshlq_u64(v28, (uint64x2_t)xmmword_242EA80E0));
  v24[1].i32[0] = v30;
  v24[1].i32[1] = v29;
  v24[3] = vext_s8((int8x8_t)vadd_s32(*(int32x2_t *)v28.i8, (int32x2_t)-1), (int8x8_t)v28.u8[0], 4uLL);
  ++*(_DWORD *)(v13 + 1524);
  *(unsigned char *)(v13 + 1544) = 0;
  if (*((unsigned char *)sampled_impl + 64))
  {
    id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v32 = sampled_impl[6];
    v33 = (void *)sampled_impl[2];
    AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::appendProgramAddressTables(*(void *)(v32 + 38976), v31);
    uint64_t v34 = *(void *)(v32 + 1752);
    if (v34)
    {
      AGX::StateLoaderProgramsTracker<AGX::HAL200::Device>::appendProgramAddressTables(v34, v31, v33);
      *(_DWORD *)(*(void *)(v32 + 1752) + 8) = 0;
    }
    v35 = (void *)sampled_impl[1];
    [v35 addObject:v31];
  }
}

- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  unsigned int v5 = a5;
  sampled_impl = self->_sampled_impl;
  AGX::SampledRenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
  unint64_t v9 = sampled_impl[6];
  BOOL v10 = (int *)MEMORY[0x263F4B188];
  if (((*(void *)(*(void *)(v9 + 38960) + 2024) | *(void *)(*(void *)(v9 + 38960) + 1976)) & 0x700000000000) != 0)
  {
    char v11 = (void *)(v9 + 78536);
    *(void *)(v9 + 90088) |= 0x700000000000uLL;
    *(void *)(v9 + 90472) |= 0x40uLL;
    id v12 = (char *)a4 + *v10;
    uint64_t v13 = *((void *)v12 + 1) + v5;
    *(void *)(v9 + 39888) = v13 + 12;
    *(void *)(v9 + 40408) = (*((void *)v12 + 2) & 0xFFFFFFFFFFFFFFLL) - v5 - 12;
    *(void *)(v9 + 78544) = v12;
    if (*(unsigned char *)(v9 + 38496))
    {
      *(void *)(v9 + 39880) = v13 + 8;
      *(void *)(v9 + 40400) = (*((void *)v12 + 2) & 0xFFFFFFFFFFFFFFLL) - v5 - 8;
LABEL_7:
      void *v11 = v12;
      goto LABEL_8;
    }
    char v14 = *(_DWORD **)(v9 + 160);
    uint64_t v15 = v14 + 1;
    if ((unint64_t)(v14 + 1) > *(void *)(v9 + 152))
    {
      int v26 = AGX::DataBufferAllocator<34ul>::growNoInline(v9 + 16, 3, 0);
      char v14 = *(_DWORD **)(v9 + 160);
      if (!v26)
      {
        char v11 = (void *)(v9 + 78536);
        goto LABEL_6;
      }
      uint64_t v15 = v14 + 1;
      char v11 = (void *)(v9 + 78536);
      if ((unint64_t)(v14 + 1) > *(void *)(v9 + 152)) {
        abort();
      }
    }
    *(void *)(v9 + 168) = v15;
LABEL_6:
    uint64_t v16 = (char *)v14 + *(void *)(v9 + 176);
    *char v14 = 0;
    *(void *)(v9 + 160) = v14 + 1;
    *(void *)(v9 + 39880) = v16;
    *(void *)(v9 + 40400) = 1;
    id v12 = (char *)(*(void *)(*(void *)(v9 + 40) + 224) + *v10);
    goto LABEL_7;
  }
LABEL_8:
  if (*(unsigned char *)(v9 + 38641))
  {
    *(unsigned char *)(v9 + 38641) = 0;
    *(void *)(v9 + 90472) |= 1uLL;
  }
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeISPPrimitiveType(v9, a3);
  uint64_t v17 = *(void *)((char *)a4 + *v10 + 8);
  if (*(id *)(v9 + 38672) != a4)
  {
    AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(*(void **)(v9 + 1592), (uint64_t)a4, 65);
    IOGPUResourceListAddResource();
    if (*(void *)(v9 + 1480)) {
      MTLResourceListAddResource();
    }
    *(void *)(v9 + 38672) = a4;
  }
  uint64_t v18 = v17 + v5;
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeAndEmitRenderState(v9, *(void *)(v9 + 38960), *(void *)(v9 + 38968), v9 + 38992, v9 + 49184, v9 + 90088, 0);
  *(void *)(v9 + 91176) |= 1uLL;
  uint64_t v19 = v18 & 0xFFFF00000000 | AGX::VDMEncoderGen5<AGX::HAL200::ESLEncoder,AGX::HAL200::DeviceConstants,AGX::HAL200::VsStateConfig>::PrimitiveTypeToVDMCTRLTypeNonIndexedDrawIndirect[a3];
  uint64_t v20 = *(void *)(v9 + 64);
  *(void *)(v9 + 64) = v20 + 12;
  *(void *)uint64_t v20 = v19;
  *(_DWORD *)(v20 + 8) = v18 & 0xFFFFFFFC;
  ++*(_DWORD *)(v9 + 1524);
  *(unsigned char *)(v9 + 1544) = 0;
  if (*((unsigned char *)sampled_impl + 64))
  {
    id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v22 = sampled_impl[6];
    uint64_t v23 = (void *)sampled_impl[2];
    AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::appendProgramAddressTables(*(void *)(v22 + 38976), v21);
    uint64_t v24 = *(void *)(v22 + 1752);
    if (v24)
    {
      AGX::StateLoaderProgramsTracker<AGX::HAL200::Device>::appendProgramAddressTables(v24, v21, v23);
      *(_DWORD *)(*(void *)(v22 + 1752) + 8) = 0;
    }
    int v25 = (void *)sampled_impl[1];
    [v25 addObject:v21];
  }
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4 withRenderTargetArrayIndex:(unsigned int)a5
{
  sampled_impl = self->_sampled_impl;
  int64x2_t v8 = *(int64x2_t *)&a3->var0;
  unint64_t var2 = a3->var2;
  long long v6 = *(_OWORD *)&a4->var0.var2;
  v7[0] = *(_OWORD *)&a4->var0.var0;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a4->var1.var1;
  AGX::SampledRenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::dispatchThreads((uint64_t)sampled_impl, &v8, v7, a5 | 0x100000000);
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4
{
  sampled_impl = self->_sampled_impl;
  int64x2_t v7 = *(int64x2_t *)&a3->var0;
  unint64_t var2 = a3->var2;
  long long v5 = *(_OWORD *)&a4->var0.var2;
  v6[0] = *(_OWORD *)&a4->var0.var0;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a4->var1.var1;
  AGX::SampledRenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::dispatchThreads((uint64_t)sampled_impl, &v7, v6, 0);
}

- (void)dispatchThreadsPerTile:(id *)a3
{
  sampled_impl = self->_sampled_impl;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12 = *a3;
  AGX::SampledRenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
  uint64_t v4 = *((void *)sampled_impl + 6);
  uint64_t v5 = *(void *)(v4 + 1968);
  memset(v13, 0, sizeof(v13));
  uint64_t v6 = *(void *)(v5 + 2576);
  *(void *)&long long v7 = v6;
  *((void *)&v7 + 1) = HIDWORD(v6);
  long long v14 = v7;
  uint64_t v15 = 1;
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::dispatchThreadsImpl<false>(v4, (long long *)&v12, (uint64_t)v13, 1uLL, 0);
  if (*((unsigned char *)sampled_impl + 64))
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v9 = *((void *)sampled_impl + 6);
    BOOL v10 = (void *)*((void *)sampled_impl + 2);
    AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::appendProgramAddressTables(*(void *)(v9 + 38976), v8);
    uint64_t v11 = *(void *)(v9 + 1752);
    if (v11)
    {
      AGX::StateLoaderProgramsTracker<AGX::HAL200::Device>::appendProgramAddressTables(v11, v8, v10);
      *(_DWORD *)(*(void *)(v9 + 1752) + 8) = 0;
    }
    objc_msgSend(*((id *)sampled_impl + 1), "addObject:", v8, *(_OWORD *)&v12.var0, v12.var2);
  }
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8
{
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7
{
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6
{
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5
{
}

- (void)setRenderPipelineState:(id)a3
{
  sampled_impl = self->_sampled_impl;
  sampled_impl[7] = a3;
  uint64_t v5 = sampled_impl[6];
  if (*(void *)(v5 + 1480)) {
    MTLResourceListAddResource();
  }

  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setRenderPipelineStateCommon(v5, (uint64_t)a3 + 144);
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
  v4.super_class = (Class)AGXG17FamilySampledRenderContext;
  [(AGXG17FamilyRenderContext *)&v4 dealloc];
}

- (AGXG17FamilySampledRenderContext)initWithCommandBuffer:(id)a3 descriptor:(id)a4 subEncoderIndex:(unint64_t)a5 framebuffer:(void *)a6 programInfoBuffer:(id *)a7 capacity:(unint64_t)a8
{
  unsigned int v8 = a8;
  v43.receiver = self;
  v43.super_class = (Class)AGXG17FamilySampledRenderContext;
  BOOL v10 = [(AGXG17FamilyRenderContext *)&v43 initWithCommandBuffer:a3 descriptor:a4 subEncoderIndex:a5 framebuffer:a6];
  if (v10)
  {
    uint64_t v11 = (unsigned int *)malloc_type_calloc(0x48uLL, 1uLL, 0xB2D29C5uLL);
    v10->_sampled_impl = v11;
    if (v11)
    {
      $F99D9A4FB75BC57F3386B8DC8EE08D7A v12 = v11;
      impl = v10->super._impl;
      *(void *)uint64_t v11 = 0;
      *((void *)v11 + 1) = 0;
      *((void *)v11 + 2) = 0;
      *((void *)v11 + 3) = a7;
      v11[9] = 0;
      v11[10] = 0;
      v11[8] = v8;
      *((void *)v11 + 6) = impl;
      *((void *)v11 + 7) = 0;
      uint64_t v14 = *impl;
      *((unsigned char *)v11 + 64) = *(unsigned char *)(*impl + 728);
      *((unsigned char *)v11 + 65) = *(unsigned char *)(v14 + 729);
      uint64_t v15 = *(void *)(impl[182] + 808);
      uint64_t v16 = (unsigned __int8 *)(v15 + 7456);
      if (!*(unsigned char *)(v15 + 7456))
      {
        do
        {
          int v17 = *(_DWORD *)(v15 + 7460);
          if (v17 == -2) {
            unsigned int v18 = 0;
          }
          else {
            unsigned int v18 = v17 + 1;
          }
          int v19 = *(_DWORD *)(v15 + 7460);
          atomic_compare_exchange_strong((atomic_uint *volatile)(v15 + 7460), (unsigned int *)&v19, v18);
        }
        while (v19 != v17);
        *((_DWORD *)impl + 377) = v17;
        *((unsigned char *)impl + 1512) = 1;
        impl = (void *)*((void *)v11 + 6);
      }
      uint64_t v20 = impl[246];
      uint64_t v21 = *(void *)(v20 + 4384);
      if (v21)
      {
        uint64_t v22 = *((void *)v11 + 3) + 24 * v11[9];
        int v23 = *v16;
        *(unsigned char *)uint64_t v22 = 100;
        int v24 = *(_DWORD *)(*((void *)v11 + 6) + 1508);
        if (v23)
        {
          int v25 = -156;
        }
        else
        {
          int v25 = (v24 << 8) | 0x64;
          int v24 = -1;
        }
        *(_DWORD *)uint64_t v22 = v25;
        *(_DWORD *)(v22 + 4) = v24;
        *(void *)(v22 + 8) = *(void *)(v21 + 608);
        *(void *)(v22 + 16) = *(void *)(v21 + 832) + *(void *)(v21 + 608);
        v11[9] = (v11[9] + 1) % v11[8];
        uint64_t v20 = *(void *)(*((void *)v11 + 6) + 1968);
      }
      uint64_t v26 = *(void *)(v20 + 4856);
      if (v26)
      {
        uint64_t v27 = *((void *)v11 + 3) + 24 * v11[9];
        int v28 = *v16;
        *(unsigned char *)uint64_t v27 = 101;
        int v29 = *(_DWORD *)(*((void *)v11 + 6) + 1508);
        if (v28)
        {
          int v30 = -155;
        }
        else
        {
          int v30 = (v29 << 8) | 0x65;
          int v29 = -1;
        }
        *(_DWORD *)uint64_t v27 = v30;
        *(_DWORD *)(v27 + 4) = v29;
        *(void *)(v27 + 8) = *(void *)(v26 + 168);
        *(void *)(v27 + 16) = *(void *)(v26 + 344) + *(void *)(v26 + 168);
        v11[9] = (v11[9] + 1) % v11[8];
      }
      if (*((unsigned char *)v11 + 64))
      {
        *((void *)v11 + 1) = objc_alloc_init(MEMORY[0x263EFF980]);
        *((void *)v12 + 2) = objc_alloc_init(MEMORY[0x263EFF9A0]);
        *(void *)$F99D9A4FB75BC57F3386B8DC8EE08D7A v12 = objc_alloc_init(MEMORY[0x263EFF980]);
        if (v21)
        {
          uint64_t v31 = *(void *)(v21 + 520);
          uint64_t v32 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:*(void *)(v21 + 656) length:*(void *)(v21 + 832)];
          uint64_t v33 = [objc_alloc(MEMORY[0x263F12AF0]) initWithBinary:v32 uniqueIdentifier:v31 debugIdentifier:*(unsigned int *)(v21 + 512)];

          id v34 = (id)[*((id *)v12 + 2) objectForKey:@"bgo"];
          if (!v34)
          {
            id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
            [*((id *)v12 + 2) setObject:v34 forKeyedSubscript:@"bgo"];
          }
          [v34 addObject:v33];
          objc_msgSend(*(id *)v12, "addObject:", objc_msgSend(objc_alloc(MEMORY[0x263F12B00]), "initWithMappedAddress:mappedSize:binaryUniqueId:type:", *(void *)(v21 + 608), *(void *)(v21 + 832), v31, @"bgo"));
        }
        if (v26)
        {
          uint64_t v35 = *(void *)(v26 + 112);
          int64x2_t v36 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:*(void *)(v26 + 192) length:*(void *)(v26 + 344)];
          uint64_t v37 = [objc_alloc(MEMORY[0x263F12AF0]) initWithBinary:v36 uniqueIdentifier:v35 debugIdentifier:*(unsigned int *)(v26 + 108)];

          id v38 = (id)[*((id *)v12 + 2) objectForKey:@"eot"];
          if (!v38)
          {
            id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
            [*((id *)v12 + 2) setObject:v38 forKeyedSubscript:@"eot"];
          }
          [v38 addObject:v37];
          objc_msgSend(*(id *)v12, "addObject:", objc_msgSend(objc_alloc(MEMORY[0x263F12B00]), "initWithMappedAddress:mappedSize:binaryUniqueId:type:", *(void *)(v26 + 168), *(void *)(v26 + 344), v35, @"eot"));
        }
        if (*((unsigned char *)v12 + 64))
        {
          uint64_t v39 = *((void *)v12 + 6);
          uint64_t v40 = *(void *)(v39 + 1752);
          id v41 = *(id *)v12;
          if (!v40)
          {
LABEL_33:
            AGX::USCProfileControlStateLoaderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes>::appendProgramAddressTables((void *)AGX::USCProfileControlStateLoaderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes>::instance, v41, *((void **)v12 + 2));
            return v10;
          }
          AGX::StateLoaderProgramsTracker<AGX::HAL200::Device>::appendProgramAddressTables(v40, v41, *((void **)v12 + 2));
          *(_DWORD *)(*(void *)(v39 + 1752) + 8) = 0;
          if (*((unsigned char *)v12 + 64))
          {
            id v41 = *(id *)v12;
            goto LABEL_33;
          }
        }
      }
    }
    else
    {
      [(AGXG17FamilyRenderContext *)v10 endEncoding];

      return 0;
    }
  }
  return v10;
}

@end