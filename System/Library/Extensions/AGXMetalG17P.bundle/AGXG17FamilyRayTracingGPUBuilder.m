@interface AGXG17FamilyRayTracingGPUBuilder
- (AGXG17FamilyRayTracingGPUBuilder)initWithCommandBuffer:(id)a3 descriptor:(id)a4;
- (BOOL)writeGenericBVHStructureOfAccelerationStructure:(id)a3 into:(id)a4;
- (BOOL)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 into:(id)a4;
- (MTLDevice)device;
- (unint64_t)globalTraceObjectID;
- (void)_beginVirtualSubstream;
- (void)_endVirtualSubstream;
- (void)buildAccelerationStructure:(id)a3 descriptor:(id)a4 scratchBuffer:(id)a5 scratchBufferOffset:(unint64_t)a6;
- (void)copyAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4;
- (void)copyAndCompactAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4;
- (void)dealloc;
- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6;
- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6 withDescriptor:(id)a7;
- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 withDescriptor:(id)a6;
- (void)endEncoding;
- (void)insertDebugSignpost:(id)a3;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7;
- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7 options:(unint64_t)a8;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)serializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 toBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6;
- (void)serializePrimitiveAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)setLabel:(id)a3;
- (void)substreamSynchronizeAccelerationStructures:(id)a3 access:(unint64_t)a4;
- (void)substreamSynchronizeDescriptor:(id)a3 access:(unint64_t)a4;
- (void)updateFence:(id)a3;
- (void)useHeap:(id)a3;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
- (void)waitForFence:(id)a3;
- (void)writeAccelerationStructureSerializationData:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5;
- (void)writeAccelerationStructureTraversalDepth:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5;
- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5;
- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5 sizeDataType:(unint64_t)a6;
- (void)writeDeserializedAccelerationStructureSize:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizeBufferOffset:(unint64_t)a6;
- (void)writeGenericBVHStructureOfAccelerationStructure:(id)a3 headerBuffer:(id)a4 headerBufferOffset:(unint64_t)a5 innerNodeBuffer:(id)a6 innerNodeBufferOffset:(unint64_t)a7 leafNodeBuffer:(id)a8 leafNodeBufferOffset:(unint64_t)a9 primitiveBuffer:(id)a10 primitiveBufferOffset:(unint64_t)a11 geometryBuffer:(id)a12 geometryOffset:(unint64_t)a13 instanceTransformBuffer:(id)a14 instanceTransformOffset:(unint64_t)a15 controlPointBuffer:(id)a16 controlPointBufferOffset:(unint64_t)a17;
- (void)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizesBufferOffset:(unint64_t)a5;
- (void)writeGeometryOfAccelerationStructure:(id)a3 toBuffer:(id)a4 geometryBufferOffset:(unint64_t)a5;
- (void)writeGeometrySizeOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5;
- (void)writeSerializedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5;
@end

@implementation AGXG17FamilyRayTracingGPUBuilder

- (void)_endVirtualSubstream
{
  if (self->virtualSubstreamOpen)
  {
    [(MTLComputeCommandEncoderSPI *)self->_computeEncoder endVirtualSubstream];
    self->virtualSubstreamOpen = 0;
    progressBins = self->_progressBins;
    if (progressBins)
    {
      if (progressBins[15])
      {
        v4 = (void *)progressBins[14];
        if (v4)
        {
          do
          {
            v5 = (void *)*v4;
            operator delete(v4);
            v4 = v5;
          }
          while (v5);
        }
        progressBins[14] = 0;
        uint64_t v6 = progressBins[13];
        if (v6)
        {
          for (uint64_t i = 0; i != v6; ++i)
            *(void *)(progressBins[12] + 8 * i) = 0;
        }
        progressBins[15] = 0;
      }
      progressBins[3] = 0;
      progressBins[4] = 0;
      *((_WORD *)progressBins + 21) = 0;
      *((_DWORD *)progressBins + 35) = 0;
    }
  }
}

- (void)_beginVirtualSubstream
{
  if (self->virtualSubstreamOpen)
  {
    computeEncoder = self->_computeEncoder;
    [(MTLComputeCommandEncoderSPI *)computeEncoder nextVirtualSubstream];
  }
  else if (self->virtualSubstreamsEnabled)
  {
    [(MTLComputeCommandEncoderSPI *)self->_computeEncoder beginVirtualSubstream];
    self->virtualSubstreamOpen = 1;
  }
}

- (void)waitForFence:(id)a3
{
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
}

- (void)useHeap:(id)a3
{
}

- (void)updateFence:(id)a3
{
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
}

- (void)pushDebugGroup:(id)a3
{
}

- (void)popDebugGroup
{
}

- (void)insertDebugSignpost:(id)a3
{
}

- (void)writeAccelerationStructureTraversalDepth:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    unint64_t v11 = [a3 size];
    unint64_t v12 = *((unsigned __int16 *)progressBins + 20);
    if (v12 < 2)
    {
      unsigned __int16 v14 = 0;
    }
    else
    {
      uint64_t v13 = 0;
      unsigned __int16 v14 = 0;
      float v15 = progressBins[6];
      unint64_t v16 = v12 - 1;
      do
      {
        float v17 = progressBins[v13++ + 7];
        if (v17 < v15)
        {
          unsigned __int16 v14 = v13;
          float v15 = v17;
        }
      }
      while (v16 != v13);
    }
    float v18 = *progressBins + (float)(progressBins[1] * (float)v11);
    *((_WORD *)progressBins + 21) = v14;
    progressBins[11] = v18;
    [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:v14];
    v19 = self->_progressBins;
    unint64_t v20 = [a3 buffer];
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __93__AGXG17FamilyRayTracingGPUBuilder_writeAccelerationStructureTraversalDepth_toBuffer_offset___block_invoke;
    v54[3] = &unk_26516F6A0;
    v54[4] = self;
    ProgressBinsSynchronizeBufferAccess((uint64_t)v19, v20, 0, (uint64_t)v54);
    v21 = self->_progressBins;
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __93__AGXG17FamilyRayTracingGPUBuilder_writeAccelerationStructureTraversalDepth_toBuffer_offset___block_invoke_2;
    v53[3] = &unk_26516F6A0;
    v53[4] = self;
    ProgressBinsSynchronizeBufferAccess((uint64_t)v21, (unint64_t)a4, 1, (uint64_t)v53);
  }
  impl = (id *)self->_impl;
  [impl[1] useResource:a3 usage:1];
  uint64_t v23 = [a3 buffer];
  uint64_t v24 = [a3 bufferOffset];
  uint64_t v25 = *((void *)impl[1] + 11);
  unint64_t Pipeline = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 65, 0);
  *(void *)(v25 + 15248) = 0;
  v27 = (int *)MEMORY[0x263F4B188];
  if (v23)
  {
    uint64_t v28 = v23 + (int)*MEMORY[0x263F4B188];
    unint64_t v29 = *(void *)(v28 + 8);
    uint64_t v30 = *(void *)(v28 + 24);
    LODWORD(v28) = *(_DWORD *)(v28 + 16);
    *(void *)(v25 + 15528) = v29;
    *(void *)(v25 + 16048) = v30;
    v31 = *(void **)(v25 + 1936);
    v31[67] = v29 + v24;
    void *v31 = v30 + v24;
    *(_DWORD *)(v25 + 10728) = v28;
    *(_DWORD *)(v25 + 10988) = v28;
    *(_DWORD *)(v25 + 11248) = v29 >> 8;
    *(void *)(v25 + 11656) = v23 + *v27;
    AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource(*(void **)(v25 + 1592), v23, 0, 0);
    *(void *)(v25 + 16624) |= 1uLL;
    *(_DWORD *)(v25 + 16656) |= 1u;
    if (*(void *)(v25 + 1480)) {
      MTLResourceListAddResource();
    }
  }
  else
  {
    uint64_t v32 = *(void *)(v25 + 1896);
    *(void *)(v25 + 15528) = v32;
    *(void *)(v25 + 16048) = 0;
    v33 = *(void **)(v25 + 1936);
    v33[67] = v32;
    void *v33 = 0;
    *(_DWORD *)(v25 + 10728) = 0;
    *(_DWORD *)(v25 + 10988) = 0;
    *(_DWORD *)(v25 + 11248) = *(void *)(v25 + 1896) >> 8;
    *(void *)(v25 + 11656) = 0;
  }
  *(_DWORD *)(v25 + 10588) = 0;
  *(void *)(v25 + 15256) = 0;
  if (a4)
  {
    v34 = (char *)a4 + *v27;
    unint64_t v35 = *((void *)v34 + 1);
    uint64_t v36 = *((void *)v34 + 3);
    int v37 = *((_DWORD *)v34 + 4);
    *(void *)(v25 + 15536) = v35;
    *(void *)(v25 + 16056) = v36;
    uint64_t v38 = *(void *)(v25 + 1936);
    *(void *)(v38 + 544) = v35 + a5;
    *(void *)(v38 + 8) = v36 + a5;
    *(_DWORD *)(v25 + 10732) = v37;
    *(_DWORD *)(v25 + 10992) = v37;
    *(_DWORD *)(v25 + 11252) = v35 >> 8;
    *(void *)(v25 + 11664) = v34;
    AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource(*(void **)(v25 + 1592), (uint64_t)a4, 0, 1u);
    *(void *)(v25 + 16624) |= 2uLL;
    *(_DWORD *)(v25 + 16656) |= 1u;
    if (*(void *)(v25 + 1480)) {
      MTLResourceListAddResource();
    }
  }
  else
  {
    uint64_t v39 = *(void *)(v25 + 1896);
    *(void *)(v25 + 15536) = v39;
    *(void *)(v25 + 16056) = 0;
    uint64_t v40 = *(void *)(v25 + 1936);
    *(void *)(v40 + 544) = v39;
    *(void *)(v40 + 8) = 0;
    *(_DWORD *)(v25 + 10732) = 0;
    *(_DWORD *)(v25 + 10992) = 0;
    *(_DWORD *)(v25 + 11252) = *(void *)(v25 + 1896) >> 8;
    *(void *)(v25 + 11664) = 0;
  }
  uint64_t v41 = *(void *)(v25 + 1920);
  *(_DWORD *)(v25 + 10592) = 0;
  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v25, Pipeline);
  int64x2_t v57 = vdupq_n_s64(1uLL);
  uint64_t v58 = 1;
  int64x2_t v55 = v57;
  uint64_t v56 = 1;
  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsPerGridImpl(v25, 22, v57.i32, &v55);
  if (*(_DWORD *)(v25 + 1880) == 1) {
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::encodeBarrier(v25, 22);
  }
  if (v41) {
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v25, v41);
  }
  v42 = (float *)self->_progressBins;
  if (v42)
  {
    uint64_t v43 = *((unsigned __int16 *)v42 + 21);
    v42[v43 + 6] = v42[11] + v42[v43 + 6];
    v42[11] = 0.0;
    if (*((unsigned char *)v42 + 48))
    {
      v44 = (uint64_t *)*((void *)v42 + 9);
      if (v44)
      {
        int v45 = *((_DWORD *)v42 + 35);
        do
        {
          *((_DWORD *)v44 + 8) = v45;
          *((_DWORD *)v44 + 9) = v43;
          v44 = (uint64_t *)*v44;
        }
        while (v44);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((void *)v42 + 12, (void *)v42 + 7);
      ++*((_DWORD *)v42 + 35);
    }
    else if (*((void *)v42 + 22))
    {
      uint64_t v46 = *((unsigned int *)v42 + 35);
      *((_DWORD *)v42 + 35) = v46 + 1;
      v47 = (void *)*((void *)v42 + 21);
      if (v47)
      {
        uint64_t v48 = *((void *)v42 + 18);
        v49 = (uint64_t **)*((void *)v42 + 21);
        do
        {
          *(_DWORD *)(v48 + 4 * *((unsigned int *)v49 + 4)) = v46;
          v49 = (uint64_t **)*v49;
        }
        while (v49);
        do
        {
          v50 = (void *)*v47;
          operator delete(v47);
          v47 = v50;
        }
        while (v50);
      }
      *((void *)v42 + 21) = 0;
      uint64_t v51 = *((void *)v42 + 20);
      if (v51)
      {
        for (uint64_t i = 0; i != v51; ++i)
          *(void *)(*((void *)v42 + 19) + 8 * i) = 0;
      }
      *((void *)v42 + 22) = 0;
      if ((v46 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled) {
        [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v46];
      }
    }
  }
}

uint64_t __93__AGXG17FamilyRayTracingGPUBuilder_writeAccelerationStructureTraversalDepth_toBuffer_offset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __93__AGXG17FamilyRayTracingGPUBuilder_writeAccelerationStructureTraversalDepth_toBuffer_offset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

- (void)writeAccelerationStructureSerializationData:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  [(AGXG17FamilyRayTracingGPUBuilder *)self _beginVirtualSubstream];
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    unint64_t v11 = [a3 size];
    unint64_t v12 = *((unsigned __int16 *)progressBins + 20);
    if (v12 < 2)
    {
      unsigned __int16 v14 = 0;
    }
    else
    {
      uint64_t v13 = 0;
      unsigned __int16 v14 = 0;
      float v15 = progressBins[6];
      unint64_t v16 = v12 - 1;
      do
      {
        float v17 = progressBins[v13++ + 7];
        if (v17 < v15)
        {
          unsigned __int16 v14 = v13;
          float v15 = v17;
        }
      }
      while (v16 != v13);
    }
    float v18 = *progressBins + (float)(progressBins[1] * (float)v11);
    *((_WORD *)progressBins + 21) = v14;
    progressBins[11] = v18;
    [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:v14];
    v19 = self->_progressBins;
    unint64_t v20 = [a3 buffer];
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __96__AGXG17FamilyRayTracingGPUBuilder_writeAccelerationStructureSerializationData_toBuffer_offset___block_invoke;
    v54[3] = &unk_26516F6A0;
    v54[4] = self;
    ProgressBinsSynchronizeBufferAccess((uint64_t)v19, v20, 0, (uint64_t)v54);
    v21 = self->_progressBins;
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __96__AGXG17FamilyRayTracingGPUBuilder_writeAccelerationStructureSerializationData_toBuffer_offset___block_invoke_2;
    v53[3] = &unk_26516F6A0;
    v53[4] = self;
    ProgressBinsSynchronizeBufferAccess((uint64_t)v21, (unint64_t)a4, 1, (uint64_t)v53);
  }
  impl = (id *)self->_impl;
  [impl[1] useResource:a3 usage:1];
  v50 = (void *)[a3 buffer];
  uint64_t v23 = [a3 bufferOffset];
  uint64_t v24 = *((void *)impl[1] + 11);
  unint64_t Pipeline = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 140, 0);
  v26 = (void *)*((void *)impl[1] + 11);
  uint64_t v27 = v26[20];
  uint64_t v28 = v27 + 63;
  id v52 = a4;
  uint64_t v51 = Pipeline;
  if ((unint64_t)(v27 + 63) > v26[19])
  {
    int v49 = AGX::DataBufferAllocator<34ul>::growNoInline(v26 + 2, 3, 0);
    uint64_t v27 = v26[20];
    if (!v49) {
      goto LABEL_12;
    }
    uint64_t v28 = v27 + 63;
    if ((unint64_t)(v27 + 63) > v26[19]) {
      abort();
    }
  }
  v26[21] = v28;
LABEL_12:
  unint64_t v29 = (v27 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v30 = v26[22];
  v26[20] = v29 + 48;
  uint64_t v31 = *(void *)(v26[5] + 224);
  uint64_t v32 = (int)*MEMORY[0x263F4B188];
  *(void *)(v29 + 32) = 0;
  *(_OWORD *)unint64_t v29 = 0u;
  *(_OWORD *)(v29 + 16) = 0u;
  {
    AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride = 0;
  }
  uint64_t v33 = v29 + v30;
  uint64_t v34 = v31 + v32;
  int v35 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride;
  if (AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride <= 0) {
    int v35 = 2;
  }
  *(_DWORD *)(v29 + 28) = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::kBvhChipCodes[v35];
  {
    AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride = 0;
  }
  int v36 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride;
  if (AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride <= 0) {
    int v36 = 2;
  }
  *(void *)(v29 + 32) = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::kBvhVersions[v36] & 0x1FFFFFFF;
  *(void *)unint64_t v29 = [v50 gpuAddress] + v23;
  [impl[1] useResource:v50 usage:1];
  *(void *)(v29 + 8) = [v52 gpuAddress] + a5;
  [impl[1] useResource:v52 usage:2];
  *(void *)(v24 + 15712) = v33;
  *(void *)(*(void *)(v24 + 1936) + 720) = v33;
  *(void *)(v24 + 11840) = v34;
  *(void *)(v24 + 16624) |= 0x800000uLL;
  *(_DWORD *)(v24 + 16656) |= 1u;
  uint64_t v37 = *(void *)(v24 + 1920);
  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v24, v51);
  int64x2_t v57 = vdupq_n_s64(1uLL);
  uint64_t v58 = 1;
  int64x2_t v55 = v57;
  uint64_t v56 = 1;
  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsPerGridImpl(v24, 22, v57.i32, &v55);
  if (*(_DWORD *)(v24 + 1880) == 1) {
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::encodeBarrier(v24, 22);
  }
  if (v37) {
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v24, v37);
  }
  uint64_t v38 = (float *)self->_progressBins;
  if (v38)
  {
    uint64_t v39 = *((unsigned __int16 *)v38 + 21);
    v38[v39 + 6] = v38[11] + v38[v39 + 6];
    v38[11] = 0.0;
    if (*((unsigned char *)v38 + 48))
    {
      uint64_t v40 = (uint64_t *)*((void *)v38 + 9);
      if (v40)
      {
        int v41 = *((_DWORD *)v38 + 35);
        do
        {
          *((_DWORD *)v40 + 8) = v41;
          *((_DWORD *)v40 + 9) = v39;
          uint64_t v40 = (uint64_t *)*v40;
        }
        while (v40);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((void *)v38 + 12, (void *)v38 + 7);
      ++*((_DWORD *)v38 + 35);
    }
    else if (*((void *)v38 + 22))
    {
      uint64_t v42 = *((unsigned int *)v38 + 35);
      *((_DWORD *)v38 + 35) = v42 + 1;
      uint64_t v43 = (void *)*((void *)v38 + 21);
      if (v43)
      {
        uint64_t v44 = *((void *)v38 + 18);
        int v45 = (uint64_t **)*((void *)v38 + 21);
        do
        {
          *(_DWORD *)(v44 + 4 * *((unsigned int *)v45 + 4)) = v42;
          int v45 = (uint64_t **)*v45;
        }
        while (v45);
        do
        {
          uint64_t v46 = (void *)*v43;
          operator delete(v43);
          uint64_t v43 = v46;
        }
        while (v46);
      }
      *((void *)v38 + 21) = 0;
      uint64_t v47 = *((void *)v38 + 20);
      if (v47)
      {
        for (uint64_t i = 0; i != v47; ++i)
          *(void *)(*((void *)v38 + 19) + 8 * i) = 0;
      }
      *((void *)v38 + 22) = 0;
      if ((v42 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled) {
        [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v42];
      }
    }
  }
}

uint64_t __96__AGXG17FamilyRayTracingGPUBuilder_writeAccelerationStructureSerializationData_toBuffer_offset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __96__AGXG17FamilyRayTracingGPUBuilder_writeAccelerationStructureSerializationData_toBuffer_offset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

- (void)writeGenericBVHStructureOfAccelerationStructure:(id)a3 headerBuffer:(id)a4 headerBufferOffset:(unint64_t)a5 innerNodeBuffer:(id)a6 innerNodeBufferOffset:(unint64_t)a7 leafNodeBuffer:(id)a8 leafNodeBufferOffset:(unint64_t)a9 primitiveBuffer:(id)a10 primitiveBufferOffset:(unint64_t)a11 geometryBuffer:(id)a12 geometryOffset:(unint64_t)a13 instanceTransformBuffer:(id)a14 instanceTransformOffset:(unint64_t)a15 controlPointBuffer:(id)a16 controlPointBufferOffset:(unint64_t)a17
{
}

- (void)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizesBufferOffset:(unint64_t)a5
{
}

- (BOOL)writeGenericBVHStructureOfAccelerationStructure:(id)a3 into:(id)a4
{
  BOOL result = 0;
  if (!a3 || !a4) {
    return result;
  }
  if ((unint64_t)([a4 version] - 256) > 5) {
    return 0;
  }
  [(AGXG17FamilyRayTracingGPUBuilder *)self _beginVirtualSubstream];
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    unint64_t v10 = [a3 size];
    unint64_t v11 = *((unsigned __int16 *)progressBins + 20);
    if (v11 < 2)
    {
      unsigned __int16 v13 = 0;
    }
    else
    {
      uint64_t v12 = 0;
      unsigned __int16 v13 = 0;
      float v14 = progressBins[6];
      unint64_t v15 = v11 - 1;
      do
      {
        float v16 = progressBins[v12++ + 7];
        if (v16 < v14)
        {
          unsigned __int16 v13 = v12;
          float v14 = v16;
        }
      }
      while (v15 != v12);
    }
    float v17 = *progressBins + (float)(progressBins[1] * (float)v10);
    *((_WORD *)progressBins + 21) = v13;
    progressBins[11] = v17;
    [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:v13];
    float v18 = self->_progressBins;
    unint64_t v19 = [a3 buffer];
    v135[0] = MEMORY[0x263EF8330];
    v135[1] = 3221225472;
    v135[2] = __89__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke;
    v135[3] = &unk_26516F6A0;
    v135[4] = self;
    ProgressBinsSynchronizeBufferAccess((uint64_t)v18, v19, 0, (uint64_t)v135);
    if ([a4 innerNodeBuffer])
    {
      unint64_t v20 = self->_progressBins;
      unint64_t v21 = [a4 innerNodeBuffer];
      v134[0] = MEMORY[0x263EF8330];
      v134[1] = 3221225472;
      v134[2] = __89__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_2;
      v134[3] = &unk_26516F6A0;
      v134[4] = self;
      ProgressBinsSynchronizeBufferAccess((uint64_t)v20, v21, 1, (uint64_t)v134);
    }
    if ([a4 leafNodeBuffer])
    {
      v22 = self->_progressBins;
      unint64_t v23 = [a4 leafNodeBuffer];
      v133[0] = MEMORY[0x263EF8330];
      v133[1] = 3221225472;
      v133[2] = __89__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_3;
      v133[3] = &unk_26516F6A0;
      v133[4] = self;
      ProgressBinsSynchronizeBufferAccess((uint64_t)v22, v23, 1, (uint64_t)v133);
    }
    if ([a4 primitiveBuffer])
    {
      uint64_t v24 = self->_progressBins;
      unint64_t v25 = [a4 primitiveBuffer];
      v132[0] = MEMORY[0x263EF8330];
      v132[1] = 3221225472;
      v132[2] = __89__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_4;
      v132[3] = &unk_26516F6A0;
      v132[4] = self;
      ProgressBinsSynchronizeBufferAccess((uint64_t)v24, v25, 1, (uint64_t)v132);
    }
    if ([a4 geometryBuffer])
    {
      v26 = self->_progressBins;
      unint64_t v27 = [a4 geometryBuffer];
      v131[0] = MEMORY[0x263EF8330];
      v131[1] = 3221225472;
      v131[2] = __89__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_5;
      v131[3] = &unk_26516F6A0;
      v131[4] = self;
      ProgressBinsSynchronizeBufferAccess((uint64_t)v26, v27, 1, (uint64_t)v131);
    }
    if ([a4 instanceTransformBuffer])
    {
      uint64_t v28 = self->_progressBins;
      unint64_t v29 = [a4 instanceTransformBuffer];
      v130[0] = MEMORY[0x263EF8330];
      v130[1] = 3221225472;
      v130[2] = __89__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_6;
      v130[3] = &unk_26516F6A0;
      v130[4] = self;
      ProgressBinsSynchronizeBufferAccess((uint64_t)v28, v29, 1, (uint64_t)v130);
    }
    if ([a4 perPrimitiveDataBuffer])
    {
      uint64_t v30 = self->_progressBins;
      unint64_t v31 = [a4 perPrimitiveDataBuffer];
      v129[0] = MEMORY[0x263EF8330];
      v129[1] = 3221225472;
      v129[2] = __89__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_7;
      v129[3] = &unk_26516F6A0;
      v129[4] = self;
      ProgressBinsSynchronizeBufferAccess((uint64_t)v30, v31, 1, (uint64_t)v129);
    }
    if ([a4 controlPointBuffer])
    {
      uint64_t v32 = self->_progressBins;
      unint64_t v33 = [a4 controlPointBuffer];
      v128[0] = MEMORY[0x263EF8330];
      v128[1] = 3221225472;
      v128[2] = __89__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_8;
      v128[3] = &unk_26516F6A0;
      v128[4] = self;
      ProgressBinsSynchronizeBufferAccess((uint64_t)v32, v33, 1, (uint64_t)v128);
    }
  }
  v109 = self;
  impl = (id *)self->_impl;
  uint64_t v121 = [a4 headerBuffer];
  uint64_t v114 = [a4 headerBufferOffset];
  uint64_t v127 = [a4 innerNodeBuffer];
  uint64_t v35 = [a4 innerNodeBufferOffset];
  uint64_t v120 = [a4 leafNodeBuffer];
  uint64_t v113 = [a4 leafNodeBufferOffset];
  uint64_t v118 = [a4 primitiveBuffer];
  uint64_t v112 = [a4 primitiveBufferOffset];
  uint64_t v116 = [a4 geometryBuffer];
  uint64_t v111 = [a4 geometryBufferOffset];
  uint64_t v115 = [a4 instanceTransformBuffer];
  uint64_t v110 = [a4 instanceTransformBufferOffset];
  int v36 = (char *)[a4 perPrimitiveDataBuffer];
  uint64_t v37 = [a4 perPrimitiveDataBufferOffset];
  uint64_t v38 = [a4 controlPointBuffer];
  uint64_t v39 = [a4 controlPointBufferOffset];
  uint64_t v40 = [a4 version];
  unsigned __int8 v41 = v40;
  uint64_t v149 = v40;
  [impl[1] useResource:a3 usage:1];
  uint64_t v42 = [a3 buffer];
  uint64_t v43 = [a3 bufferOffset];
  int v123 = dword_242EAAE0C[v41];
  uint64_t v44 = impl[1];
  uint64_t v45 = v44[11];
  uint64_t v125 = v43;
  v126 = (char *)v42;
  objc_msgSend(v44, "setBuffer:offset:atIndex:", v42);
  [impl[1] setBuffer:v121 offset:v114 atIndex:10];
  uint64_t v122 = v35;
  [impl[1] setBuffer:v127 offset:v35 atIndex:11];
  [impl[1] setBuffer:v120 offset:v113 atIndex:12];
  [impl[1] setBuffer:v118 offset:v112 atIndex:13];
  [impl[1] setBuffer:v116 offset:v111 atIndex:14];
  [impl[1] setBuffer:v115 offset:v110 atIndex:15];
  uint64_t v117 = v37;
  [impl[1] setBuffer:v36 offset:v37 atIndex:16];
  uint64_t v119 = v39;
  [impl[1] setBuffer:v38 offset:v39 atIndex:17];
  int64x2_t v150 = 0uLL;
  *(void *)&long long v151 = 0;
  AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::allocateInline((uint64_t)&v150, (uint64_t)impl[1], 48, 1);
  uint64_t v47 = v150.i64[1];
  uint64_t v46 = v151;
  uint64_t v48 = impl[1];
  uint64_t v49 = v48[11];
  *(void *)(v49 + 15600) = v150.i64[1];
  *(void *)(*(void *)(v49 + 1936) + 608) = v47;
  *(void *)(v49 + 11728) = v46;
  *(void *)(v49 + 16624) |= 0x200uLL;
  *(_DWORD *)(v49 + 16656) |= 1u;
  [v48 setBytes:&v149 length:8 atIndex:8];
  unint64_t Pipeline = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, v123, 0);
  uint64_t v51 = *(void *)(v45 + 1920);
  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v45, Pipeline);
  int64x2_t v150 = vdupq_n_s64(1uLL);
  *(void *)&long long v151 = 1;
  int64x2_t v146 = v150;
  uint64_t v147 = 1;
  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsPerGridImpl(v45, 22, v150.i32, &v146);
  if (*(_DWORD *)(v45 + 1880) == 1) {
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::encodeBarrier(v45, 22);
  }
  if (v51) {
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v45, v51);
  }
  uint64_t v52 = *((void *)impl[1] + 11);
  unint64_t v53 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 152, 0);
  uint64_t v54 = *(void *)(v52 + 1920);
  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v52, v53);
  int64x2_t v150 = vdupq_n_s64(1uLL);
  *(void *)&long long v151 = 1;
  int64x2_t v146 = v150;
  uint64_t v147 = 1;
  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsPerGridImpl(v52, 22, v150.i32, &v146);
  if (*(_DWORD *)(v52 + 1880) == 1) {
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::encodeBarrier(v52, 22);
  }
  if (v54) {
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v52, v54);
  }
  uint64_t v55 = *((void *)impl[1] + 11);
  unint64_t v56 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 153, 0);
  uint64_t v57 = *(void *)(v55 + 1920);
  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v55, v56);
  int64x2_t v150 = vdupq_n_s64(1uLL);
  *(void *)&long long v151 = 1;
  int64x2_t v146 = v150;
  uint64_t v147 = 1;
  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsPerGridImpl(v55, 22, v150.i32, &v146);
  if (*(_DWORD *)(v55 + 1880) == 1) {
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::encodeBarrier(v55, 22);
  }
  v124 = (char *)v38;
  if (v57) {
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v55, v57);
  }
  int v58 = 31;
  do
  {
    [impl[1] setBytes:&v149 length:8 atIndex:8];
    unint64_t v59 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 57, 0);
    int64x2_t v150 = 0u;
    long long v151 = 0u;
    AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::dispatchWithIndirectThreadCountExtended((uint64_t)impl, v59, v47 + 8, v46, v150.i64, 1, 0);
    uint64_t v60 = *((void *)impl[1] + 11);
    unint64_t v61 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 151, 0);
    uint64_t v62 = *(void *)(v60 + 1920);
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v60, v61);
    int64x2_t v150 = vdupq_n_s64(1uLL);
    *(void *)&long long v151 = 1;
    int64x2_t v146 = v150;
    uint64_t v147 = 1;
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsPerGridImpl(v60, 22, v150.i32, &v146);
    if (*(_DWORD *)(v60 + 1880) == 1) {
      AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::encodeBarrier(v60, 22);
    }
    if (v62) {
      AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v60, v62);
    }
    unint64_t v63 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 64, 0);
    int64x2_t v150 = 0u;
    long long v151 = 0u;
    AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::dispatchWithIndirectThreadCountExtended((uint64_t)impl, v63, v47 + 16, v46, v150.i64, 1, 0);
    uint64_t v64 = *((void *)impl[1] + 11);
    unint64_t v65 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 152, 0);
    uint64_t v66 = *(void *)(v64 + 1920);
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v64, v65);
    int64x2_t v150 = vdupq_n_s64(1uLL);
    *(void *)&long long v151 = 1;
    int64x2_t v146 = v150;
    uint64_t v147 = 1;
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsPerGridImpl(v64, 22, v150.i32, &v146);
    if (*(_DWORD *)(v64 + 1880) == 1) {
      AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::encodeBarrier(v64, 22);
    }
    if (v66) {
      AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v64, v66);
    }
    uint64_t v67 = *((void *)impl[1] + 11);
    unint64_t v68 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 153, 0);
    uint64_t v69 = *(void *)(v67 + 1920);
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v67, v68);
    int64x2_t v150 = vdupq_n_s64(1uLL);
    *(void *)&long long v151 = 1;
    int64x2_t v146 = v150;
    uint64_t v147 = 1;
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsPerGridImpl(v67, 22, v150.i32, &v146);
    if (*(_DWORD *)(v67 + 1880) == 1) {
      AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::encodeBarrier(v67, 22);
    }
    if (v69) {
      AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v67, v69);
    }
    --v58;
  }
  while (v58);
  unint64_t v70 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, dword_242EAAE24[v149], 0);
  int64x2_t v150 = 0u;
  long long v151 = 0u;
  AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::dispatchWithIndirectThreadCountExtended((uint64_t)impl, v70, v47 + 20, v46, v150.i64, 1, 0);
  unint64_t v71 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 144, 0);
  int64x2_t v150 = 0u;
  long long v151 = 0u;
  AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::dispatchWithIndirectThreadCountExtended((uint64_t)impl, v71, v47 + 44, v46, v150.i64, 1, 0);
  v72 = (void *)*((void *)impl[1] + 11);
  uint64_t v73 = v72[20];
  uint64_t v74 = v73 + 31;
  if ((unint64_t)(v73 + 31) > v72[19])
  {
    int v108 = AGX::DataBufferAllocator<34ul>::growNoInline(v72 + 2, 3, 0);
    uint64_t v73 = v72[20];
    if (!v108) {
      goto LABEL_55;
    }
    uint64_t v74 = v73 + 31;
    if ((unint64_t)(v73 + 31) > v72[19]) {
      abort();
    }
  }
  v72[21] = v74;
LABEL_55:
  v75 = (void *)((v73 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = (int *)MEMORY[0x263F4B188];
  uint64_t v77 = (int)*MEMORY[0x263F4B188];
  v150.i64[0] = (uint64_t)v75 + v72[22];
  v150.i64[1] = (uint64_t)v75;
  void *v75 = 0;
  v72[20] = v75 + 2;
  uint64_t v78 = *(void *)(v72[5] + 224) + v77;
  *(void *)&long long v151 = 8;
  *((void *)&v151 + 1) = v78;
  uint64_t v79 = [v126 contents];
  uint64_t v80 = [v126 gpuAddress];
  uint64_t v81 = [v126 length];
  v82 = &v126[*v76];
  uint64_t v83 = v80 + v125;
  uint64_t v84 = v125 + v79;
  v146.i64[0] = v80 + v125;
  v146.i64[1] = v125 + v79;
  uint64_t v147 = v81;
  v148 = v82;
  [impl[1] useResource:v126 usage:1];
  if (v36)
  {
    int64x2_t v140 = 0uLL;
    uint64_t v141 = 0;
    AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::allocateInline((uint64_t)&v140, (uint64_t)impl[1], 8, 1);
    v143.i64[0] = v140.i64[1];
    v143.i64[1] = v140.i64[0];
    uint64_t v144 = 8;
    uint64_t v145 = v141;
    v140.i64[0] = v83 + 40;
    v140.i64[1] = v84 + 40;
    uint64_t v141 = v81;
    v142 = v82;
    uint64_t v136 = v83 + 112;
    uint64_t v137 = v84 + 112;
    uint64_t v138 = v81;
    v139 = v82;
    AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeStridedCopy((uint64_t)impl, v140.i64, &v136, 8, (void *)1, 1u, 8, v143.i64, v150.i64, 8);
    v140.i64[0] = v83 + 136;
    v140.i64[1] = v84 + 136;
    uint64_t v141 = v81;
    v142 = v82;
    uint64_t v85 = [v36 contents];
    uint64_t v86 = [v36 gpuAddress];
    uint64_t v87 = [v36 length];
    v88 = &v36[*MEMORY[0x263F4B188]];
    uint64_t v136 = v86 + v117;
    uint64_t v137 = v117 + v85;
    uint64_t v138 = v87;
    v139 = v88;
    [impl[1] useResource:v36 usage:1];
    AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeStridedCopy((uint64_t)impl, v146.i64, v140.i64, 4, &v143, 0, 4, &v136, v150.i64, 4);
  }
  v89 = (int *)MEMORY[0x263F4B188];
  if (v124)
  {
    int64x2_t v140 = 0uLL;
    uint64_t v141 = 0;
    AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::allocateInline((uint64_t)&v140, (uint64_t)impl[1], 8, 1);
    v143.i64[0] = v140.i64[1];
    v143.i64[1] = v140.i64[0];
    uint64_t v144 = 8;
    uint64_t v145 = v141;
    *(void *)v140.i64[0] = 0;
    v140.i64[0] = v83 + 8;
    v140.i64[1] = v84 + 8;
    uint64_t v141 = v81;
    v142 = v82;
    uint64_t v136 = v83 + 112;
    uint64_t v137 = v84 + 112;
    uint64_t v138 = v81;
    v139 = v82;
    AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeStridedCopy((uint64_t)impl, v140.i64, &v136, 4, (void *)1, 1u, 4, v143.i64, v150.i64, 4);
    v140.i64[0] = v83 + 152;
    v140.i64[1] = v84 + 152;
    uint64_t v141 = v81;
    v142 = v82;
    uint64_t v90 = [v124 contents];
    uint64_t v91 = [v124 gpuAddress];
    uint64_t v92 = [v124 length];
    v93 = &v124[*v89];
    uint64_t v136 = v91 + v119;
    uint64_t v137 = v119 + v90;
    uint64_t v138 = v92;
    v139 = v93;
    [impl[1] useResource:v124 usage:1];
    AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeStridedCopy((uint64_t)impl, v146.i64, v140.i64, 16, &v143, 0, 16, &v136, v150.i64, 16);
  }
  [impl[1] setBuffer:v126 offset:v125 atIndex:7];
  [impl[1] setBuffer:v127 offset:v122 atIndex:11];
  uint64_t v94 = *((void *)impl[1] + 11);
  unint64_t v95 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 154, 0);
  uint64_t v96 = *(void *)(v94 + 1920);
  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v94, v95);
  int64x2_t v143 = vdupq_n_s64(1uLL);
  uint64_t v144 = 1;
  int64x2_t v140 = v143;
  uint64_t v141 = 1;
  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsPerGridImpl(v94, 22, v143.i32, &v140);
  if (*(_DWORD *)(v94 + 1880) == 1) {
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::encodeBarrier(v94, 22);
  }
  if (v96) {
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v94, v96);
  }
  v97 = (float *)v109->_progressBins;
  if (v97)
  {
    uint64_t v98 = *((unsigned __int16 *)v97 + 21);
    v97[v98 + 6] = v97[11] + v97[v98 + 6];
    v97[11] = 0.0;
    if (*((unsigned char *)v97 + 48))
    {
      v99 = (uint64_t *)*((void *)v97 + 9);
      if (v99)
      {
        int v100 = *((_DWORD *)v97 + 35);
        do
        {
          *((_DWORD *)v99 + 8) = v100;
          *((_DWORD *)v99 + 9) = v98;
          v99 = (uint64_t *)*v99;
        }
        while (v99);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((void *)v97 + 12, (void *)v97 + 7);
      ++*((_DWORD *)v97 + 35);
    }
    else if (*((void *)v97 + 22))
    {
      uint64_t v101 = *((unsigned int *)v97 + 35);
      *((_DWORD *)v97 + 35) = v101 + 1;
      v102 = (void *)*((void *)v97 + 21);
      if (v102)
      {
        uint64_t v103 = *((void *)v97 + 18);
        v104 = (uint64_t **)*((void *)v97 + 21);
        do
        {
          *(_DWORD *)(v103 + 4 * *((unsigned int *)v104 + 4)) = v101;
          v104 = (uint64_t **)*v104;
        }
        while (v104);
        do
        {
          v105 = (void *)*v102;
          operator delete(v102);
          v102 = v105;
        }
        while (v105);
      }
      *((void *)v97 + 21) = 0;
      uint64_t v106 = *((void *)v97 + 20);
      if (v106)
      {
        for (uint64_t i = 0; i != v106; ++i)
          *(void *)(*((void *)v97 + 19) + 8 * i) = 0;
      }
      *((void *)v97 + 22) = 0;
      if ((v101 & 0x80000000) == 0 && !v109->virtualSubstreamsEnabled) {
        [(MTLComputeCommandEncoderSPI *)v109->_computeEncoder signalProgress:v101];
      }
    }
  }
  return 1;
}

uint64_t __89__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __89__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __89__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_3(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __89__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_4(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __89__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_5(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __89__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_6(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __89__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_7(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __89__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_8(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

- (BOOL)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 into:(id)a4
{
  BOOL result = 0;
  if (a3 && a4)
  {
    if ((unint64_t)([a4 version] - 256) > 5)
    {
      return 0;
    }
    else
    {
      [(AGXG17FamilyRayTracingGPUBuilder *)self _beginVirtualSubstream];
      uint64_t v8 = [(MTLDevice *)self->_device newBufferWithLength:64 options:0];
      progressBins = (float *)self->_progressBins;
      if (progressBins)
      {
        computeEncoder = self->_computeEncoder;
        unint64_t v11 = *((unsigned __int16 *)progressBins + 20);
        if (v11 < 2)
        {
          unsigned __int16 v13 = 0;
        }
        else
        {
          uint64_t v12 = 0;
          unsigned __int16 v13 = 0;
          float v14 = progressBins[6];
          unint64_t v15 = v11 - 1;
          do
          {
            float v16 = progressBins[v12++ + 7];
            if (v16 < v14)
            {
              unsigned __int16 v13 = v12;
              float v14 = v16;
            }
          }
          while (v15 != v12);
        }
        float v17 = *progressBins + (float)(progressBins[1] * 64.0);
        *((_WORD *)progressBins + 21) = v13;
        progressBins[11] = v17;
        [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:v13];
        float v18 = self->_progressBins;
        unint64_t v19 = [a3 buffer];
        v57[0] = MEMORY[0x263EF8330];
        v57[1] = 3221225472;
        v57[2] = __94__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureSizesOfAccelerationStructure_into___block_invoke;
        v57[3] = &unk_26516F6A0;
        v57[4] = self;
        ProgressBinsSynchronizeBufferAccess((uint64_t)v18, v19, 0, (uint64_t)v57);
        unint64_t v20 = self->_progressBins;
        v56[0] = MEMORY[0x263EF8330];
        v56[1] = 3221225472;
        v56[2] = __94__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureSizesOfAccelerationStructure_into___block_invoke_2;
        v56[3] = &unk_26516F6A0;
        v56[4] = self;
        ProgressBinsSynchronizeBufferAccess((uint64_t)v20, v8, 1, (uint64_t)v56);
      }
      impl = (id *)self->_impl;
      unsigned __int8 v22 = [a4 version];
      [impl[1] useResource:a3 usage:1];
      int v23 = dword_242EAADF4[v22];
      uint64_t v24 = *((void *)impl[1] + 11);
      unint64_t Pipeline = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, v23, 0);
      uint64_t v26 = [a3 buffer];
      uint64_t v27 = [a3 bufferOffset];
      *(void *)(v24 + 15248) = 0;
      uint64_t v28 = (int *)MEMORY[0x263F4B188];
      if (v26)
      {
        uint64_t v29 = v26 + (int)*MEMORY[0x263F4B188];
        unint64_t v30 = *(void *)(v29 + 8);
        uint64_t v31 = *(void *)(v29 + 24);
        LODWORD(v29) = *(_DWORD *)(v29 + 16);
        *(void *)(v24 + 15528) = v30;
        *(void *)(v24 + 16048) = v31;
        uint64_t v32 = *(void **)(v24 + 1936);
        v32[67] = v30 + v27;
        *uint64_t v32 = v31 + v27;
        *(_DWORD *)(v24 + 10728) = v29;
        *(_DWORD *)(v24 + 10988) = v29;
        *(_DWORD *)(v24 + 11248) = v30 >> 8;
        *(void *)(v24 + 11656) = v26 + *v28;
        AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource(*(void **)(v24 + 1592), v26, 0, 0);
        *(void *)(v24 + 16624) |= 1uLL;
        *(_DWORD *)(v24 + 16656) |= 1u;
        if (*(void *)(v24 + 1480)) {
          MTLResourceListAddResource();
        }
      }
      else
      {
        uint64_t v33 = *(void *)(v24 + 1896);
        *(void *)(v24 + 15528) = v33;
        *(void *)(v24 + 16048) = 0;
        uint64_t v34 = *(void **)(v24 + 1936);
        v34[67] = v33;
        void *v34 = 0;
        *(_DWORD *)(v24 + 10728) = 0;
        *(_DWORD *)(v24 + 10988) = 0;
        *(_DWORD *)(v24 + 11248) = *(void *)(v24 + 1896) >> 8;
        *(void *)(v24 + 11656) = 0;
      }
      *(_DWORD *)(v24 + 10588) = 0;
      *(void *)(v24 + 15256) = 0;
      if (v8)
      {
        uint64_t v35 = v8 + *v28;
        unint64_t v36 = *(void *)(v35 + 8);
        uint64_t v37 = *(void *)(v35 + 24);
        int v38 = *(_DWORD *)(v35 + 16);
        *(void *)(v24 + 15536) = v36;
        *(void *)(v24 + 16056) = v37;
        uint64_t v39 = *(void *)(v24 + 1936);
        *(void *)(v39 + 544) = v36;
        *(void *)(v39 + 8) = v37;
        *(_DWORD *)(v24 + 10732) = v38;
        *(_DWORD *)(v24 + 10992) = v38;
        *(_DWORD *)(v24 + 11252) = v36 >> 8;
        *(void *)(v24 + 11664) = v35;
        AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource(*(void **)(v24 + 1592), v8, 0, 1u);
        *(void *)(v24 + 16624) |= 2uLL;
        *(_DWORD *)(v24 + 16656) |= 1u;
        if (*(void *)(v24 + 1480)) {
          MTLResourceListAddResource();
        }
      }
      else
      {
        uint64_t v40 = *(void *)(v24 + 1896);
        *(void *)(v24 + 15536) = v40;
        *(void *)(v24 + 16056) = 0;
        uint64_t v41 = *(void *)(v24 + 1936);
        *(void *)(v41 + 544) = v40;
        *(void *)(v41 + 8) = 0;
        *(_DWORD *)(v24 + 10732) = 0;
        *(_DWORD *)(v24 + 10992) = 0;
        *(_DWORD *)(v24 + 11252) = *(void *)(v24 + 1896) >> 8;
        *(void *)(v24 + 11664) = 0;
      }
      uint64_t v42 = *(void *)(v24 + 1920);
      *(_DWORD *)(v24 + 10592) = 0;
      AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v24, Pipeline);
      int64x2_t v60 = vdupq_n_s64(1uLL);
      uint64_t v61 = 1;
      int64x2_t v58 = v60;
      uint64_t v59 = 1;
      AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsPerGridImpl(v24, 22, v60.i32, &v58);
      if (*(_DWORD *)(v24 + 1880) == 1) {
        AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::encodeBarrier(v24, 22);
      }
      if (v42) {
        AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v24, v42);
      }
      commandBuffer = self->_commandBuffer;
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __94__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureSizesOfAccelerationStructure_into___block_invoke_3;
      v55[3] = &unk_26516F6C8;
      v55[4] = v8;
      v55[5] = a4;
      [(MTLCommandBuffer *)commandBuffer addCompletedHandler:v55];
      uint64_t v44 = (float *)self->_progressBins;
      if (v44)
      {
        uint64_t v45 = *((unsigned __int16 *)v44 + 21);
        v44[v45 + 6] = v44[11] + v44[v45 + 6];
        v44[11] = 0.0;
        if (*((unsigned char *)v44 + 48))
        {
          uint64_t v46 = (uint64_t *)*((void *)v44 + 9);
          if (v46)
          {
            int v47 = *((_DWORD *)v44 + 35);
            do
            {
              *((_DWORD *)v46 + 8) = v47;
              *((_DWORD *)v46 + 9) = v45;
              uint64_t v46 = (uint64_t *)*v46;
            }
            while (v46);
          }
          std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((void *)v44 + 12, (void *)v44 + 7);
          ++*((_DWORD *)v44 + 35);
        }
        else if (*((void *)v44 + 22))
        {
          uint64_t v48 = *((unsigned int *)v44 + 35);
          *((_DWORD *)v44 + 35) = v48 + 1;
          uint64_t v49 = (void *)*((void *)v44 + 21);
          if (v49)
          {
            uint64_t v50 = *((void *)v44 + 18);
            uint64_t v51 = (uint64_t **)*((void *)v44 + 21);
            do
            {
              *(_DWORD *)(v50 + 4 * *((unsigned int *)v51 + 4)) = v48;
              uint64_t v51 = (uint64_t **)*v51;
            }
            while (v51);
            do
            {
              uint64_t v52 = (void *)*v49;
              operator delete(v49);
              uint64_t v49 = v52;
            }
            while (v52);
          }
          *((void *)v44 + 21) = 0;
          uint64_t v53 = *((void *)v44 + 20);
          if (v53)
          {
            for (uint64_t i = 0; i != v53; ++i)
              *(void *)(*((void *)v44 + 19) + 8 * i) = 0;
          }
          *((void *)v44 + 22) = 0;
          if ((v48 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled) {
            [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v48];
          }
        }
      }
      return 1;
    }
  }
  return result;
}

uint64_t __94__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureSizesOfAccelerationStructure_into___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __94__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureSizesOfAccelerationStructure_into___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

void __94__AGXG17FamilyRayTracingGPUBuilder_writeGenericBVHStructureSizesOfAccelerationStructure_into___block_invoke_3(uint64_t a1)
{
  unsigned int v2 = (void *)[*(id *)(a1 + 32) contents];
  [*(id *)(a1 + 40) setHeaderBufferSize:*v2];
  [*(id *)(a1 + 40) setInnerNodeBufferSize:v2[1]];
  [*(id *)(a1 + 40) setLeafNodeBufferSize:v2[2]];
  [*(id *)(a1 + 40) setPrimitiveBufferSize:v2[3]];
  [*(id *)(a1 + 40) setGeometryBufferSize:v2[4]];
  [*(id *)(a1 + 40) setInstanceTransformBufferSize:v2[5]];
  [*(id *)(a1 + 40) setPerPrimitiveDataBufferSize:v2[6]];
  [*(id *)(a1 + 40) setControlPointBufferSize:v2[7]];
  v3 = *(void **)(a1 + 32);
}

- (void)writeGeometryOfAccelerationStructure:(id)a3 toBuffer:(id)a4 geometryBufferOffset:(unint64_t)a5
{
}

- (void)writeGeometrySizeOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6 withDescriptor:(id)a7
{
  [(AGXG17FamilyRayTracingGPUBuilder *)self _beginVirtualSubstream];
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    unint64_t v14 = [a3 size];
    unint64_t v15 = *((unsigned __int16 *)progressBins + 20);
    if (v15 < 2)
    {
      unsigned __int16 v17 = 0;
    }
    else
    {
      uint64_t v16 = 0;
      unsigned __int16 v17 = 0;
      float v18 = progressBins[6];
      unint64_t v19 = v15 - 1;
      do
      {
        float v20 = progressBins[v16++ + 7];
        if (v20 < v18)
        {
          unsigned __int16 v17 = v16;
          float v18 = v20;
        }
      }
      while (v19 != v16);
    }
    float v21 = *progressBins + (float)(progressBins[1] * (float)v14);
    *((_WORD *)progressBins + 21) = v17;
    progressBins[11] = v21;
    [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:v17];
    unsigned __int8 v22 = self->_progressBins;
    unint64_t v23 = [a3 buffer];
    uint64_t v24 = [a3 bufferOffset];
    uint64_t v25 = [a3 size];
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __158__AGXG17FamilyRayTracingGPUBuilder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke;
    v55[3] = &unk_26516F6A0;
    v55[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v22, v23, v24, v25, 1, (uint64_t)v55);
    [(AGXG17FamilyRayTracingGPUBuilder *)self substreamSynchronizeAccelerationStructures:a4 access:0];
    uint64_t v26 = self->_progressBins;
    uint64_t v27 = [a3 size];
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __158__AGXG17FamilyRayTracingGPUBuilder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke_2;
    v54[3] = &unk_26516F6A0;
    v54[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v26, (unint64_t)a5, a6, v27, 0, (uint64_t)v54);
  }
  impl = (id *)self->_impl;
  uint64_t v53 = [a3 accelerationStructureUniqueIdentifier];
  [impl[1] useResource:a3 usage:2];
  uint64_t v29 = (void *)[a3 buffer];
  uint64_t v30 = [a3 bufferOffset];
  uint64_t v31 = [v29 contents];
  unint64_t v32 = a6;
  uint64_t v33 = [v29 gpuAddress];
  uint64_t v34 = [v29 length];
  id v35 = a4;
  unint64_t v36 = (int *)MEMORY[0x263F4B188];
  uint64_t v37 = (uint64_t)v29 + (int)*MEMORY[0x263F4B188];
  v57[0] = v33 + v30;
  v57[1] = v30 + v31;
  v57[2] = v34;
  v57[3] = v37;
  [impl[1] useResource:v29 usage:2];
  uint64_t v38 = [a5 contents];
  uint64_t v39 = [a5 gpuAddress];
  uint64_t v40 = [a5 length];
  uint64_t v41 = (char *)a5 + *v36;
  v56[0] = v39 + v32;
  v56[1] = v38 + v32;
  v56[2] = v40;
  v56[3] = v41;
  [impl[1] useResource:a5 usage:1];
  AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeDeserialize_impl((uint64_t)impl, v57, v35, v56, v53);
  uint64_t v42 = (float *)self->_progressBins;
  if (v42)
  {
    uint64_t v43 = *((unsigned __int16 *)v42 + 21);
    v42[v43 + 6] = v42[11] + v42[v43 + 6];
    v42[11] = 0.0;
    if (*((unsigned char *)v42 + 48))
    {
      uint64_t v44 = (uint64_t *)*((void *)v42 + 9);
      if (v44)
      {
        int v45 = *((_DWORD *)v42 + 35);
        do
        {
          *((_DWORD *)v44 + 8) = v45;
          *((_DWORD *)v44 + 9) = v43;
          uint64_t v44 = (uint64_t *)*v44;
        }
        while (v44);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((void *)v42 + 12, (void *)v42 + 7);
      ++*((_DWORD *)v42 + 35);
    }
    else if (*((void *)v42 + 22))
    {
      uint64_t v46 = *((unsigned int *)v42 + 35);
      *((_DWORD *)v42 + 35) = v46 + 1;
      int v47 = (void *)*((void *)v42 + 21);
      if (v47)
      {
        uint64_t v48 = *((void *)v42 + 18);
        uint64_t v49 = (uint64_t **)*((void *)v42 + 21);
        do
        {
          *(_DWORD *)(v48 + 4 * *((unsigned int *)v49 + 4)) = v46;
          uint64_t v49 = (uint64_t **)*v49;
        }
        while (v49);
        do
        {
          uint64_t v50 = (void *)*v47;
          operator delete(v47);
          int v47 = v50;
        }
        while (v50);
      }
      *((void *)v42 + 21) = 0;
      uint64_t v51 = *((void *)v42 + 20);
      if (v51)
      {
        for (uint64_t i = 0; i != v51; ++i)
          *(void *)(*((void *)v42 + 19) + 8 * i) = 0;
      }
      *((void *)v42 + 22) = 0;
      if ((v46 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled) {
        [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v46];
      }
    }
  }
}

uint64_t __158__AGXG17FamilyRayTracingGPUBuilder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __158__AGXG17FamilyRayTracingGPUBuilder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 withDescriptor:(id)a6
{
  [(AGXG17FamilyRayTracingGPUBuilder *)self _beginVirtualSubstream];
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    unint64_t v12 = [a3 size];
    unint64_t v13 = *((unsigned __int16 *)progressBins + 20);
    if (v13 < 2)
    {
      unsigned __int16 v15 = 0;
    }
    else
    {
      uint64_t v14 = 0;
      unsigned __int16 v15 = 0;
      float v16 = progressBins[6];
      unint64_t v17 = v13 - 1;
      do
      {
        float v18 = progressBins[v14++ + 7];
        if (v18 < v16)
        {
          unsigned __int16 v15 = v14;
          float v16 = v18;
        }
      }
      while (v17 != v14);
    }
    float v19 = *progressBins + (float)(progressBins[1] * (float)v12);
    *((_WORD *)progressBins + 21) = v15;
    progressBins[11] = v19;
    [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:v15];
    float v20 = self->_progressBins;
    unint64_t v21 = [a3 buffer];
    uint64_t v22 = [a3 bufferOffset];
    uint64_t v23 = [a3 size];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __127__AGXG17FamilyRayTracingGPUBuilder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke;
    v51[3] = &unk_26516F6A0;
    v51[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v20, v21, v22, v23, 1, (uint64_t)v51);
    uint64_t v24 = self->_progressBins;
    uint64_t v25 = [a3 size];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __127__AGXG17FamilyRayTracingGPUBuilder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke_2;
    v50[3] = &unk_26516F6A0;
    v50[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v24, (unint64_t)a4, a5, v25, 0, (uint64_t)v50);
  }
  impl = (id *)self->_impl;
  uint64_t v49 = [a3 accelerationStructureUniqueIdentifier];
  [impl[1] useResource:a3 usage:2];
  uint64_t v27 = (void *)[a3 buffer];
  uint64_t v28 = [a3 bufferOffset];
  uint64_t v29 = [v27 contents];
  uint64_t v30 = [v27 gpuAddress];
  uint64_t v31 = [v27 length];
  unint64_t v32 = (int *)MEMORY[0x263F4B188];
  uint64_t v33 = (uint64_t)v27 + (int)*MEMORY[0x263F4B188];
  v53[0] = v30 + v28;
  v53[1] = v28 + v29;
  v53[2] = v31;
  v53[3] = v33;
  [impl[1] useResource:v27 usage:2];
  uint64_t v34 = [a4 contents];
  uint64_t v35 = [a4 gpuAddress];
  uint64_t v36 = [a4 length];
  uint64_t v37 = (char *)a4 + *v32;
  v52[0] = v35 + a5;
  v52[1] = v34 + a5;
  v52[2] = v36;
  v52[3] = v37;
  [impl[1] useResource:a4 usage:1];
  AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeDeserialize_impl((uint64_t)impl, v53, 0, v52, v49);
  uint64_t v38 = (float *)self->_progressBins;
  if (v38)
  {
    uint64_t v39 = *((unsigned __int16 *)v38 + 21);
    v38[v39 + 6] = v38[11] + v38[v39 + 6];
    v38[11] = 0.0;
    if (*((unsigned char *)v38 + 48))
    {
      uint64_t v40 = (uint64_t *)*((void *)v38 + 9);
      if (v40)
      {
        int v41 = *((_DWORD *)v38 + 35);
        do
        {
          *((_DWORD *)v40 + 8) = v41;
          *((_DWORD *)v40 + 9) = v39;
          uint64_t v40 = (uint64_t *)*v40;
        }
        while (v40);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((void *)v38 + 12, (void *)v38 + 7);
      ++*((_DWORD *)v38 + 35);
    }
    else if (*((void *)v38 + 22))
    {
      uint64_t v42 = *((unsigned int *)v38 + 35);
      *((_DWORD *)v38 + 35) = v42 + 1;
      uint64_t v43 = (void *)*((void *)v38 + 21);
      if (v43)
      {
        uint64_t v44 = *((void *)v38 + 18);
        int v45 = (uint64_t **)*((void *)v38 + 21);
        do
        {
          *(_DWORD *)(v44 + 4 * *((unsigned int *)v45 + 4)) = v42;
          int v45 = (uint64_t **)*v45;
        }
        while (v45);
        do
        {
          uint64_t v46 = (void *)*v43;
          operator delete(v43);
          uint64_t v43 = v46;
        }
        while (v46);
      }
      *((void *)v38 + 21) = 0;
      uint64_t v47 = *((void *)v38 + 20);
      if (v47)
      {
        for (uint64_t i = 0; i != v47; ++i)
          *(void *)(*((void *)v38 + 19) + 8 * i) = 0;
      }
      *((void *)v38 + 22) = 0;
      if ((v42 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled) {
        [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v42];
      }
    }
  }
}

uint64_t __127__AGXG17FamilyRayTracingGPUBuilder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __127__AGXG17FamilyRayTracingGPUBuilder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  [(AGXG17FamilyRayTracingGPUBuilder *)self _beginVirtualSubstream];
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    unint64_t v13 = [a3 size];
    unint64_t v14 = *((unsigned __int16 *)progressBins + 20);
    if (v14 < 2)
    {
      unsigned __int16 v16 = 0;
    }
    else
    {
      uint64_t v15 = 0;
      unsigned __int16 v16 = 0;
      float v17 = progressBins[6];
      unint64_t v18 = v14 - 1;
      do
      {
        float v19 = progressBins[v15++ + 7];
        if (v19 < v17)
        {
          unsigned __int16 v16 = v15;
          float v17 = v19;
        }
      }
      while (v18 != v15);
    }
    float v20 = *progressBins + (float)(progressBins[1] * (float)v13);
    *((_WORD *)progressBins + 21) = v16;
    progressBins[11] = v20;
    [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:v16];
    unint64_t v21 = self->_progressBins;
    unint64_t v22 = [a3 buffer];
    uint64_t v23 = [a3 bufferOffset];
    uint64_t v24 = [a3 size];
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __143__AGXG17FamilyRayTracingGPUBuilder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset___block_invoke;
    v54[3] = &unk_26516F6A0;
    v54[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v21, v22, v23, v24, 1, (uint64_t)v54);
    [(AGXG17FamilyRayTracingGPUBuilder *)self substreamSynchronizeAccelerationStructures:a4 access:0];
    uint64_t v25 = self->_progressBins;
    uint64_t v26 = [a3 size];
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __143__AGXG17FamilyRayTracingGPUBuilder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset___block_invoke_2;
    v53[3] = &unk_26516F6A0;
    v53[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v25, (unint64_t)a5, a6, v26, 0, (uint64_t)v53);
  }
  impl = (id *)self->_impl;
  uint64_t v52 = [a3 accelerationStructureUniqueIdentifier];
  [impl[1] useResource:a3 usage:2];
  uint64_t v28 = (void *)[a3 buffer];
  uint64_t v29 = [a3 bufferOffset];
  uint64_t v30 = [v28 contents];
  unint64_t v31 = a6;
  uint64_t v32 = [v28 gpuAddress];
  uint64_t v33 = [v28 length];
  id v34 = a4;
  uint64_t v35 = (int *)MEMORY[0x263F4B188];
  uint64_t v36 = (uint64_t)v28 + (int)*MEMORY[0x263F4B188];
  v56[0] = v32 + v29;
  v56[1] = v29 + v30;
  v56[2] = v33;
  v56[3] = v36;
  [impl[1] useResource:v28 usage:2];
  uint64_t v37 = [a5 contents];
  uint64_t v38 = [a5 gpuAddress];
  uint64_t v39 = [a5 length];
  uint64_t v40 = (char *)a5 + *v35;
  v55[0] = v38 + v31;
  v55[1] = v37 + v31;
  v55[2] = v39;
  v55[3] = v40;
  [impl[1] useResource:a5 usage:1];
  AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeDeserialize_impl((uint64_t)impl, v56, v34, v55, v52);
  int v41 = (float *)self->_progressBins;
  if (v41)
  {
    uint64_t v42 = *((unsigned __int16 *)v41 + 21);
    v41[v42 + 6] = v41[11] + v41[v42 + 6];
    v41[11] = 0.0;
    if (*((unsigned char *)v41 + 48))
    {
      uint64_t v43 = (uint64_t *)*((void *)v41 + 9);
      if (v43)
      {
        int v44 = *((_DWORD *)v41 + 35);
        do
        {
          *((_DWORD *)v43 + 8) = v44;
          *((_DWORD *)v43 + 9) = v42;
          uint64_t v43 = (uint64_t *)*v43;
        }
        while (v43);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((void *)v41 + 12, (void *)v41 + 7);
      ++*((_DWORD *)v41 + 35);
    }
    else if (*((void *)v41 + 22))
    {
      uint64_t v45 = *((unsigned int *)v41 + 35);
      *((_DWORD *)v41 + 35) = v45 + 1;
      uint64_t v46 = (void *)*((void *)v41 + 21);
      if (v46)
      {
        uint64_t v47 = *((void *)v41 + 18);
        uint64_t v48 = (uint64_t **)*((void *)v41 + 21);
        do
        {
          *(_DWORD *)(v47 + 4 * *((unsigned int *)v48 + 4)) = v45;
          uint64_t v48 = (uint64_t **)*v48;
        }
        while (v48);
        do
        {
          uint64_t v49 = (void *)*v46;
          operator delete(v46);
          uint64_t v46 = v49;
        }
        while (v49);
      }
      *((void *)v41 + 21) = 0;
      uint64_t v50 = *((void *)v41 + 20);
      if (v50)
      {
        for (uint64_t i = 0; i != v50; ++i)
          *(void *)(*((void *)v41 + 19) + 8 * i) = 0;
      }
      *((void *)v41 + 22) = 0;
      if ((v45 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled) {
        [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v45];
      }
    }
  }
}

uint64_t __143__AGXG17FamilyRayTracingGPUBuilder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __143__AGXG17FamilyRayTracingGPUBuilder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  [(AGXG17FamilyRayTracingGPUBuilder *)self _beginVirtualSubstream];
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    unint64_t v11 = [a3 size];
    unint64_t v12 = *((unsigned __int16 *)progressBins + 20);
    if (v12 < 2)
    {
      unsigned __int16 v14 = 0;
    }
    else
    {
      uint64_t v13 = 0;
      unsigned __int16 v14 = 0;
      float v15 = progressBins[6];
      unint64_t v16 = v12 - 1;
      do
      {
        float v17 = progressBins[v13++ + 7];
        if (v17 < v15)
        {
          unsigned __int16 v14 = v13;
          float v15 = v17;
        }
      }
      while (v16 != v13);
    }
    float v18 = *progressBins + (float)(progressBins[1] * (float)v11);
    *((_WORD *)progressBins + 21) = v14;
    progressBins[11] = v18;
    [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:v14];
    float v19 = self->_progressBins;
    unint64_t v20 = [a3 buffer];
    uint64_t v21 = [a3 bufferOffset];
    uint64_t v22 = [a3 size];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __112__AGXG17FamilyRayTracingGPUBuilder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset___block_invoke;
    v38[3] = &unk_26516F6A0;
    v38[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v19, v20, v21, v22, 1, (uint64_t)v38);
    uint64_t v23 = self->_progressBins;
    uint64_t v24 = [a3 size];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __112__AGXG17FamilyRayTracingGPUBuilder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset___block_invoke_2;
    v37[3] = &unk_26516F6A0;
    v37[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v23, (unint64_t)a4, a5, v24, 0, (uint64_t)v37);
  }
  uint64_t v25 = objc_opt_new();
  [(AGXG17FamilyRayTracingGPUBuilder *)self deserializePrimitiveAccelerationStructure:a3 fromBuffer:a4 serializedBufferOffset:a5 withDescriptor:v25];

  uint64_t v26 = (float *)self->_progressBins;
  if (v26)
  {
    uint64_t v27 = *((unsigned __int16 *)v26 + 21);
    v26[v27 + 6] = v26[11] + v26[v27 + 6];
    v26[11] = 0.0;
    if (*((unsigned char *)v26 + 48))
    {
      uint64_t v28 = (uint64_t *)*((void *)v26 + 9);
      if (v28)
      {
        int v29 = *((_DWORD *)v26 + 35);
        do
        {
          *((_DWORD *)v28 + 8) = v29;
          *((_DWORD *)v28 + 9) = v27;
          uint64_t v28 = (uint64_t *)*v28;
        }
        while (v28);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((void *)v26 + 12, (void *)v26 + 7);
      ++*((_DWORD *)v26 + 35);
    }
    else if (*((void *)v26 + 22))
    {
      uint64_t v30 = *((unsigned int *)v26 + 35);
      *((_DWORD *)v26 + 35) = v30 + 1;
      unint64_t v31 = (void *)*((void *)v26 + 21);
      if (v31)
      {
        uint64_t v32 = *((void *)v26 + 18);
        uint64_t v33 = (uint64_t **)*((void *)v26 + 21);
        do
        {
          *(_DWORD *)(v32 + 4 * *((unsigned int *)v33 + 4)) = v30;
          uint64_t v33 = (uint64_t **)*v33;
        }
        while (v33);
        do
        {
          id v34 = (void *)*v31;
          operator delete(v31);
          unint64_t v31 = v34;
        }
        while (v34);
      }
      *((void *)v26 + 21) = 0;
      uint64_t v35 = *((void *)v26 + 20);
      if (v35)
      {
        for (uint64_t i = 0; i != v35; ++i)
          *(void *)(*((void *)v26 + 19) + 8 * i) = 0;
      }
      *((void *)v26 + 22) = 0;
      if ((v30 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled) {
        [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v30];
      }
    }
  }
}

uint64_t __112__AGXG17FamilyRayTracingGPUBuilder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __112__AGXG17FamilyRayTracingGPUBuilder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

- (void)serializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 toBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  [(AGXG17FamilyRayTracingGPUBuilder *)self _beginVirtualSubstream];
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    unint64_t v13 = [a3 size];
    unint64_t v14 = *((unsigned __int16 *)progressBins + 20);
    if (v14 < 2)
    {
      unsigned __int16 v16 = 0;
    }
    else
    {
      uint64_t v15 = 0;
      unsigned __int16 v16 = 0;
      float v17 = progressBins[6];
      unint64_t v18 = v14 - 1;
      do
      {
        float v19 = progressBins[v15++ + 7];
        if (v19 < v17)
        {
          unsigned __int16 v16 = v15;
          float v17 = v19;
        }
      }
      while (v18 != v15);
    }
    float v20 = *progressBins + (float)(progressBins[1] * (float)v13);
    *((_WORD *)progressBins + 21) = v16;
    progressBins[11] = v20;
    [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:v16];
    uint64_t v21 = self->_progressBins;
    unint64_t v22 = [a3 buffer];
    uint64_t v23 = [a3 bufferOffset];
    uint64_t v24 = [a3 size];
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __139__AGXG17FamilyRayTracingGPUBuilder_serializeInstanceAccelerationStructure_primitiveAccelerationStructures_toBuffer_serializedBufferOffset___block_invoke;
    v52[3] = &unk_26516F6A0;
    void v52[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v21, v22, v23, v24, 0, (uint64_t)v52);
    [(AGXG17FamilyRayTracingGPUBuilder *)self substreamSynchronizeAccelerationStructures:a4 access:0];
    uint64_t v25 = self->_progressBins;
    uint64_t v26 = [a3 size];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __139__AGXG17FamilyRayTracingGPUBuilder_serializeInstanceAccelerationStructure_primitiveAccelerationStructures_toBuffer_serializedBufferOffset___block_invoke_2;
    v51[3] = &unk_26516F6A0;
    v51[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v25, (unint64_t)a5, a6, v26, 1, (uint64_t)v51);
  }
  impl = (id *)self->_impl;
  [impl[1] useResource:a3 usage:1];
  uint64_t v28 = (void *)[a3 buffer];
  uint64_t v29 = [a3 bufferOffset];
  uint64_t v30 = [v28 contents];
  uint64_t v31 = [v28 gpuAddress];
  uint64_t v32 = [v28 length];
  id v33 = a4;
  id v34 = (int *)MEMORY[0x263F4B188];
  uint64_t v35 = (uint64_t)v28 + (int)*MEMORY[0x263F4B188];
  v54[0] = v31 + v29;
  v54[1] = v29 + v30;
  v54[2] = v32;
  v54[3] = v35;
  [impl[1] useResource:v28 usage:1];
  uint64_t v36 = [a5 contents];
  uint64_t v37 = [a5 gpuAddress];
  uint64_t v38 = [a5 length];
  uint64_t v39 = (char *)a5 + *v34;
  v53[0] = v37 + a6;
  v53[1] = v36 + a6;
  v53[2] = v38;
  v53[3] = v39;
  [impl[1] useResource:a5 usage:1];
  AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeSerialize_impl(impl, v54, v33, v53);
  uint64_t v40 = (float *)self->_progressBins;
  if (v40)
  {
    uint64_t v41 = *((unsigned __int16 *)v40 + 21);
    v40[v41 + 6] = v40[11] + v40[v41 + 6];
    v40[11] = 0.0;
    if (*((unsigned char *)v40 + 48))
    {
      uint64_t v42 = (uint64_t *)*((void *)v40 + 9);
      if (v42)
      {
        int v43 = *((_DWORD *)v40 + 35);
        do
        {
          *((_DWORD *)v42 + 8) = v43;
          *((_DWORD *)v42 + 9) = v41;
          uint64_t v42 = (uint64_t *)*v42;
        }
        while (v42);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((void *)v40 + 12, (void *)v40 + 7);
      ++*((_DWORD *)v40 + 35);
    }
    else if (*((void *)v40 + 22))
    {
      uint64_t v44 = *((unsigned int *)v40 + 35);
      *((_DWORD *)v40 + 35) = v44 + 1;
      uint64_t v45 = (void *)*((void *)v40 + 21);
      if (v45)
      {
        uint64_t v46 = *((void *)v40 + 18);
        uint64_t v47 = (uint64_t **)*((void *)v40 + 21);
        do
        {
          *(_DWORD *)(v46 + 4 * *((unsigned int *)v47 + 4)) = v44;
          uint64_t v47 = (uint64_t **)*v47;
        }
        while (v47);
        do
        {
          uint64_t v48 = (void *)*v45;
          operator delete(v45);
          uint64_t v45 = v48;
        }
        while (v48);
      }
      *((void *)v40 + 21) = 0;
      uint64_t v49 = *((void *)v40 + 20);
      if (v49)
      {
        for (uint64_t i = 0; i != v49; ++i)
          *(void *)(*((void *)v40 + 19) + 8 * i) = 0;
      }
      *((void *)v40 + 22) = 0;
      if ((v44 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled) {
        [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v44];
      }
    }
  }
}

uint64_t __139__AGXG17FamilyRayTracingGPUBuilder_serializeInstanceAccelerationStructure_primitiveAccelerationStructures_toBuffer_serializedBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __139__AGXG17FamilyRayTracingGPUBuilder_serializeInstanceAccelerationStructure_primitiveAccelerationStructures_toBuffer_serializedBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

- (void)serializePrimitiveAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  [(AGXG17FamilyRayTracingGPUBuilder *)self _beginVirtualSubstream];
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    unint64_t v11 = [a3 size];
    unint64_t v12 = *((unsigned __int16 *)progressBins + 20);
    if (v12 < 2)
    {
      unsigned __int16 v14 = 0;
    }
    else
    {
      uint64_t v13 = 0;
      unsigned __int16 v14 = 0;
      float v15 = progressBins[6];
      unint64_t v16 = v12 - 1;
      do
      {
        float v17 = progressBins[v13++ + 7];
        if (v17 < v15)
        {
          unsigned __int16 v14 = v13;
          float v15 = v17;
        }
      }
      while (v16 != v13);
    }
    float v18 = *progressBins + (float)(progressBins[1] * (float)v11);
    *((_WORD *)progressBins + 21) = v14;
    progressBins[11] = v18;
    [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:v14];
    float v19 = self->_progressBins;
    unint64_t v20 = [a3 buffer];
    uint64_t v21 = [a3 bufferOffset];
    uint64_t v22 = [a3 size];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __108__AGXG17FamilyRayTracingGPUBuilder_serializePrimitiveAccelerationStructure_toBuffer_serializedBufferOffset___block_invoke;
    v49[3] = &unk_26516F6A0;
    v49[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v19, v20, v21, v22, 0, (uint64_t)v49);
    uint64_t v23 = self->_progressBins;
    uint64_t v24 = [a3 size];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __108__AGXG17FamilyRayTracingGPUBuilder_serializePrimitiveAccelerationStructure_toBuffer_serializedBufferOffset___block_invoke_2;
    v48[3] = &unk_26516F6A0;
    v48[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v23, (unint64_t)a4, a5, v24, 1, (uint64_t)v48);
  }
  impl = (id *)self->_impl;
  [impl[1] useResource:a3 usage:1];
  uint64_t v26 = (void *)[a3 buffer];
  uint64_t v27 = [a3 bufferOffset];
  uint64_t v28 = [v26 contents];
  uint64_t v29 = [v26 gpuAddress];
  uint64_t v30 = [v26 length];
  uint64_t v31 = (int *)MEMORY[0x263F4B188];
  uint64_t v32 = (uint64_t)v26 + (int)*MEMORY[0x263F4B188];
  v51[0] = v29 + v27;
  v51[1] = v27 + v28;
  v51[2] = v30;
  v51[3] = v32;
  [impl[1] useResource:v26 usage:1];
  uint64_t v33 = [a4 contents];
  uint64_t v34 = [a4 gpuAddress];
  uint64_t v35 = [a4 length];
  uint64_t v36 = (char *)a4 + *v31;
  v50[0] = v34 + a5;
  v50[1] = v33 + a5;
  v50[2] = v35;
  v50[3] = v36;
  [impl[1] useResource:a4 usage:1];
  AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeSerialize_impl(impl, v51, 0, v50);
  uint64_t v37 = (float *)self->_progressBins;
  if (v37)
  {
    uint64_t v38 = *((unsigned __int16 *)v37 + 21);
    v37[v38 + 6] = v37[11] + v37[v38 + 6];
    v37[11] = 0.0;
    if (*((unsigned char *)v37 + 48))
    {
      uint64_t v39 = (uint64_t *)*((void *)v37 + 9);
      if (v39)
      {
        int v40 = *((_DWORD *)v37 + 35);
        do
        {
          *((_DWORD *)v39 + 8) = v40;
          *((_DWORD *)v39 + 9) = v38;
          uint64_t v39 = (uint64_t *)*v39;
        }
        while (v39);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((void *)v37 + 12, (void *)v37 + 7);
      ++*((_DWORD *)v37 + 35);
    }
    else if (*((void *)v37 + 22))
    {
      uint64_t v41 = *((unsigned int *)v37 + 35);
      *((_DWORD *)v37 + 35) = v41 + 1;
      uint64_t v42 = (void *)*((void *)v37 + 21);
      if (v42)
      {
        uint64_t v43 = *((void *)v37 + 18);
        uint64_t v44 = (uint64_t **)*((void *)v37 + 21);
        do
        {
          *(_DWORD *)(v43 + 4 * *((unsigned int *)v44 + 4)) = v41;
          uint64_t v44 = (uint64_t **)*v44;
        }
        while (v44);
        do
        {
          uint64_t v45 = (void *)*v42;
          operator delete(v42);
          uint64_t v42 = v45;
        }
        while (v45);
      }
      *((void *)v37 + 21) = 0;
      uint64_t v46 = *((void *)v37 + 20);
      if (v46)
      {
        for (uint64_t i = 0; i != v46; ++i)
          *(void *)(*((void *)v37 + 19) + 8 * i) = 0;
      }
      *((void *)v37 + 22) = 0;
      if ((v41 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled) {
        [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v41];
      }
    }
  }
}

uint64_t __108__AGXG17FamilyRayTracingGPUBuilder_serializePrimitiveAccelerationStructure_toBuffer_serializedBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __108__AGXG17FamilyRayTracingGPUBuilder_serializePrimitiveAccelerationStructure_toBuffer_serializedBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

- (void)writeDeserializedAccelerationStructureSize:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizeBufferOffset:(unint64_t)a6
{
  [(AGXG17FamilyRayTracingGPUBuilder *)self _beginVirtualSubstream];
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    unint64_t v13 = *((unsigned __int16 *)progressBins + 20);
    if (v13 < 2)
    {
      unsigned __int16 v15 = 0;
    }
    else
    {
      uint64_t v14 = 0;
      unsigned __int16 v15 = 0;
      float v16 = progressBins[6];
      unint64_t v17 = v13 - 1;
      do
      {
        float v18 = progressBins[v14++ + 7];
        if (v18 < v16)
        {
          unsigned __int16 v15 = v14;
          float v16 = v18;
        }
      }
      while (v17 != v14);
    }
    float v19 = *progressBins + (float)(progressBins[1] * 8.0);
    *((_WORD *)progressBins + 21) = v15;
    progressBins[11] = v19;
    [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:v15];
    unint64_t v20 = self->_progressBins;
    uint64_t v21 = [a3 length];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __122__AGXG17FamilyRayTracingGPUBuilder_writeDeserializedAccelerationStructureSize_serializedOffset_toBuffer_sizeBufferOffset___block_invoke;
    v49[3] = &unk_26516F6A0;
    v49[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v20, (unint64_t)a3, a4, v21 - a4, 0, (uint64_t)v49);
    uint64_t v22 = self->_progressBins;
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __122__AGXG17FamilyRayTracingGPUBuilder_writeDeserializedAccelerationStructureSize_serializedOffset_toBuffer_sizeBufferOffset___block_invoke_2;
    v48[3] = &unk_26516F6A0;
    v48[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v22, (unint64_t)a5, a6, 4, 1, (uint64_t)v48);
  }
  impl = self->_impl;
  uint64_t v24 = *(void *)(*((void *)impl + 1) + 88);
  [a3 contents];
  uint64_t v25 = [a3 gpuAddress];
  [a3 length];
  uint64_t v26 = (int *)MEMORY[0x263F4B188];
  uint64_t v27 = (char *)a3 + (int)*MEMORY[0x263F4B188];
  unint64_t v28 = v25 + a4;
  [*((id *)impl + 1) useResource:a3 usage:1];
  [a5 contents];
  uint64_t v29 = [a5 gpuAddress];
  [a5 length];
  uint64_t v30 = (char *)a5 + *v26;
  unint64_t v31 = v29 + a6;
  [*((id *)impl + 1) useResource:a5 usage:1];
  uint64_t v32 = *((void *)impl + 1);
  uint64_t v33 = *(void *)(v32 + 88);
  *(void *)(v33 + 15528) = v28;
  *(void *)(*(void *)(v33 + 1936) + 536) = v28;
  *(void *)(v33 + 11656) = v27;
  *(void *)(v33 + 16624) |= 1uLL;
  *(_DWORD *)(v33 + 16656) |= 1u;
  uint64_t v34 = *(void *)(v32 + 88);
  *(void *)(v34 + 15536) = v31;
  *(void *)(*(void *)(v34 + 1936) + 544) = v31;
  *(void *)(v34 + 11664) = v30;
  *(void *)(v34 + 16624) |= 2uLL;
  *(_DWORD *)(v34 + 16656) |= 1u;
  unint64_t Pipeline = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 138, 0);
  uint64_t v36 = *(void *)(v24 + 1920);
  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v24, Pipeline);
  int64x2_t v52 = vdupq_n_s64(1uLL);
  uint64_t v53 = 1;
  int64x2_t v50 = v52;
  uint64_t v51 = 1;
  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsPerGridImpl(v24, 22, v52.i32, &v50);
  if (*(_DWORD *)(v24 + 1880) == 1) {
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::encodeBarrier(v24, 22);
  }
  if (v36) {
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v24, v36);
  }
  uint64_t v37 = (float *)self->_progressBins;
  if (v37)
  {
    uint64_t v38 = *((unsigned __int16 *)v37 + 21);
    v37[v38 + 6] = v37[11] + v37[v38 + 6];
    v37[11] = 0.0;
    if (*((unsigned char *)v37 + 48))
    {
      uint64_t v39 = (uint64_t *)*((void *)v37 + 9);
      if (v39)
      {
        int v40 = *((_DWORD *)v37 + 35);
        do
        {
          *((_DWORD *)v39 + 8) = v40;
          *((_DWORD *)v39 + 9) = v38;
          uint64_t v39 = (uint64_t *)*v39;
        }
        while (v39);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((void *)v37 + 12, (void *)v37 + 7);
      ++*((_DWORD *)v37 + 35);
    }
    else if (*((void *)v37 + 22))
    {
      uint64_t v41 = *((unsigned int *)v37 + 35);
      *((_DWORD *)v37 + 35) = v41 + 1;
      uint64_t v42 = (void *)*((void *)v37 + 21);
      if (v42)
      {
        uint64_t v43 = *((void *)v37 + 18);
        uint64_t v44 = (uint64_t **)*((void *)v37 + 21);
        do
        {
          *(_DWORD *)(v43 + 4 * *((unsigned int *)v44 + 4)) = v41;
          uint64_t v44 = (uint64_t **)*v44;
        }
        while (v44);
        do
        {
          uint64_t v45 = (void *)*v42;
          operator delete(v42);
          uint64_t v42 = v45;
        }
        while (v45);
      }
      *((void *)v37 + 21) = 0;
      uint64_t v46 = *((void *)v37 + 20);
      if (v46)
      {
        for (uint64_t i = 0; i != v46; ++i)
          *(void *)(*((void *)v37 + 19) + 8 * i) = 0;
      }
      *((void *)v37 + 22) = 0;
      if ((v41 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled) {
        [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v41];
      }
    }
  }
}

uint64_t __122__AGXG17FamilyRayTracingGPUBuilder_writeDeserializedAccelerationStructureSize_serializedOffset_toBuffer_sizeBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __122__AGXG17FamilyRayTracingGPUBuilder_writeDeserializedAccelerationStructureSize_serializedOffset_toBuffer_sizeBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

- (void)writeSerializedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  [(AGXG17FamilyRayTracingGPUBuilder *)self _beginVirtualSubstream];
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    unint64_t v11 = *((unsigned __int16 *)progressBins + 20);
    if (v11 < 2)
    {
      unsigned __int16 v13 = 0;
    }
    else
    {
      uint64_t v12 = 0;
      unsigned __int16 v13 = 0;
      float v14 = progressBins[6];
      unint64_t v15 = v11 - 1;
      do
      {
        float v16 = progressBins[v12++ + 7];
        if (v16 < v14)
        {
          unsigned __int16 v13 = v12;
          float v14 = v16;
        }
      }
      while (v15 != v12);
    }
    float v17 = *progressBins + (float)(progressBins[1] * 8.0);
    *((_WORD *)progressBins + 21) = v13;
    progressBins[11] = v17;
    [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:v13];
    float v18 = self->_progressBins;
    unint64_t v19 = [a3 buffer];
    uint64_t v20 = [a3 bufferOffset];
    uint64_t v21 = [a3 size];
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __103__AGXG17FamilyRayTracingGPUBuilder_writeSerializedAccelerationStructureSize_toBuffer_sizeBufferOffset___block_invoke;
    v52[3] = &unk_26516F6A0;
    void v52[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v18, v19, v20, v21, 0, (uint64_t)v52);
    uint64_t v22 = self->_progressBins;
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __103__AGXG17FamilyRayTracingGPUBuilder_writeSerializedAccelerationStructureSize_toBuffer_sizeBufferOffset___block_invoke_2;
    v51[3] = &unk_26516F6A0;
    v51[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v22, (unint64_t)a4, a5, 4, 1, (uint64_t)v51);
  }
  impl = self->_impl;
  uint64_t v24 = (void *)*((void *)impl + 1);
  uint64_t v25 = v24[11];
  [v24 useResource:a3 usage:1];
  uint64_t v26 = (char *)[a3 buffer];
  uint64_t v27 = [a3 bufferOffset];
  [v26 contents];
  uint64_t v28 = v27 + [v26 gpuAddress];
  [v26 length];
  uint64_t v29 = (int *)MEMORY[0x263F4B188];
  uint64_t v30 = &v26[*MEMORY[0x263F4B188]];
  uint64_t v31 = v28 + 64;
  [*((id *)impl + 1) useResource:v26 usage:1];
  [a4 contents];
  uint64_t v32 = [a4 gpuAddress];
  [a4 length];
  uint64_t v33 = (char *)a4 + *v29;
  unint64_t v34 = v32 + a5;
  [*((id *)impl + 1) useResource:a4 usage:1];
  uint64_t v35 = *((void *)impl + 1);
  uint64_t v36 = *(void *)(v35 + 88);
  *(void *)(v36 + 15528) = v31;
  *(void *)(*(void *)(v36 + 1936) + 536) = v31;
  *(void *)(v36 + 11656) = v30;
  *(void *)(v36 + 16624) |= 1uLL;
  *(_DWORD *)(v36 + 16656) |= 1u;
  uint64_t v37 = *(void *)(v35 + 88);
  *(void *)(v37 + 15536) = v34;
  *(void *)(*(void *)(v37 + 1936) + 544) = v34;
  *(void *)(v37 + 11664) = v33;
  *(void *)(v37 + 16624) |= 2uLL;
  *(_DWORD *)(v37 + 16656) |= 1u;
  unint64_t Pipeline = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 137, 0);
  uint64_t v39 = *(void *)(v25 + 1920);
  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v25, Pipeline);
  int64x2_t v55 = vdupq_n_s64(1uLL);
  uint64_t v56 = 1;
  int64x2_t v53 = v55;
  uint64_t v54 = 1;
  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsPerGridImpl(v25, 22, v55.i32, &v53);
  if (*(_DWORD *)(v25 + 1880) == 1) {
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::encodeBarrier(v25, 22);
  }
  if (v39) {
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v25, v39);
  }
  int v40 = (float *)self->_progressBins;
  if (v40)
  {
    uint64_t v41 = *((unsigned __int16 *)v40 + 21);
    v40[v41 + 6] = v40[11] + v40[v41 + 6];
    v40[11] = 0.0;
    if (*((unsigned char *)v40 + 48))
    {
      uint64_t v42 = (uint64_t *)*((void *)v40 + 9);
      if (v42)
      {
        int v43 = *((_DWORD *)v40 + 35);
        do
        {
          *((_DWORD *)v42 + 8) = v43;
          *((_DWORD *)v42 + 9) = v41;
          uint64_t v42 = (uint64_t *)*v42;
        }
        while (v42);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((void *)v40 + 12, (void *)v40 + 7);
      ++*((_DWORD *)v40 + 35);
    }
    else if (*((void *)v40 + 22))
    {
      uint64_t v44 = *((unsigned int *)v40 + 35);
      *((_DWORD *)v40 + 35) = v44 + 1;
      uint64_t v45 = (void *)*((void *)v40 + 21);
      if (v45)
      {
        uint64_t v46 = *((void *)v40 + 18);
        uint64_t v47 = (uint64_t **)*((void *)v40 + 21);
        do
        {
          *(_DWORD *)(v46 + 4 * *((unsigned int *)v47 + 4)) = v44;
          uint64_t v47 = (uint64_t **)*v47;
        }
        while (v47);
        do
        {
          uint64_t v48 = (void *)*v45;
          operator delete(v45);
          uint64_t v45 = v48;
        }
        while (v48);
      }
      *((void *)v40 + 21) = 0;
      uint64_t v49 = *((void *)v40 + 20);
      if (v49)
      {
        for (uint64_t i = 0; i != v49; ++i)
          *(void *)(*((void *)v40 + 19) + 8 * i) = 0;
      }
      *((void *)v40 + 22) = 0;
      if ((v44 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled) {
        [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v44];
      }
    }
  }
}

uint64_t __103__AGXG17FamilyRayTracingGPUBuilder_writeSerializedAccelerationStructureSize_toBuffer_sizeBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __103__AGXG17FamilyRayTracingGPUBuilder_writeSerializedAccelerationStructureSize_toBuffer_sizeBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7 options:(unint64_t)a8
{
  char v9 = a8;
  uint64_t v349 = *MEMORY[0x263EF8340];
  {
    -[AGXG17FamilyRayTracingGPUBuilder refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:options:]::forceBuildOnRefit = 0;
  }
  if (-[AGXG17FamilyRayTracingGPUBuilder refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:options:]::forceBuildOnRefit)
  {
    unint64_t v346 = 0;
    int64x2_t v347 = 0uLL;
    device = self->_device;
    if (device) {
      -[MTLDevice accelerationStructureSizesWithDescriptor:](device, "accelerationStructureSizesWithDescriptor:", a4, a4, a5, a6, a7);
    }
    id v13 = a5;
    if (v346 > [a3 size]) {
      id v13 = (id)[(MTLDevice *)self->_device newAccelerationStructureWithSize:v346];
    }
    float v14 = objc_msgSend((id)-[MTLComputeCommandEncoderSPI device](self->_computeEncoder, "device"), "newBufferWithLength:options:", v347.i64[0], 32);
    [(AGXG17FamilyRayTracingGPUBuilder *)self buildAccelerationStructure:v13 descriptor:a4 scratchBuffer:v14 scratchBufferOffset:0];
    if (v13 != a5) {
      [(AGXG17FamilyRayTracingGPUBuilder *)self copyAndCompactAccelerationStructure:v13 toAccelerationStructure:a5];
    }

    return;
  }
  char v303 = objc_msgSend(a4, "isInstanceDescriptor", a3, a4, a5, a6, a7);
  if (v303)
  {
    uint64_t v15 = [(AGXG17FamilyRayTracingGPUBuilder *)self _endVirtualSubstream];
  }
  else
  {
    uint64_t v15 = [(AGXG17FamilyRayTracingGPUBuilder *)self _beginVirtualSubstream];
    progressBins = (float *)self->_progressBins;
    if (progressBins)
    {
      computeEncoder = self->_computeEncoder;
      unint64_t PrimitiveCountFromDescriptor = ProgressBinsGetPrimitiveCountFromDescriptor((MTLAccelerationStructureDescriptor *)a4);
      unint64_t v19 = *((unsigned __int16 *)progressBins + 20);
      if (v19 < 2)
      {
        unsigned __int16 v21 = 0;
      }
      else
      {
        uint64_t v20 = 0;
        unsigned __int16 v21 = 0;
        float v22 = progressBins[6];
        unint64_t v23 = v19 - 1;
        do
        {
          float v24 = progressBins[v20++ + 7];
          if (v24 < v22)
          {
            unsigned __int16 v21 = v20;
            float v22 = v24;
          }
        }
        while (v23 != v20);
      }
      float v25 = progressBins[4] + (float)(progressBins[5] * (float)PrimitiveCountFromDescriptor);
      *((_WORD *)progressBins + 21) = v21;
      progressBins[11] = v25;
      [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:v21];
      uint64_t v26 = self->_progressBins;
      unint64_t v27 = [a3 buffer];
      uint64_t v28 = [a3 bufferOffset];
      uint64_t v29 = [a3 size];
      v329[0] = MEMORY[0x263EF8330];
      v329[1] = 3221225472;
      v329[2] = __128__AGXG17FamilyRayTracingGPUBuilder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options___block_invoke;
      v329[3] = &unk_26516F6A0;
      v329[4] = self;
      ProgressBinsSynchronizeBufferAccessRange((uint64_t)v26, v27, v28, v29, 0, (uint64_t)v329);
      uint64_t v30 = self->_progressBins;
      unint64_t v31 = [a5 buffer];
      uint64_t v32 = [a5 bufferOffset];
      uint64_t v33 = [a5 size];
      v328[0] = MEMORY[0x263EF8330];
      v328[1] = 3221225472;
      v328[2] = __128__AGXG17FamilyRayTracingGPUBuilder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options___block_invoke_2;
      v328[3] = &unk_26516F6A0;
      v328[4] = self;
      ProgressBinsSynchronizeBufferAccessRange((uint64_t)v30, v31, v32, v33, 1, (uint64_t)v328);
      uint64_t v15 = [(AGXG17FamilyRayTracingGPUBuilder *)self substreamSynchronizeDescriptor:a4 access:0];
    }
  }
  context = (void *)MEMORY[0x24566F2C0](v15);
  impl = self->_impl;
  [a5 accelerationStructureUniqueIdentifier];
  id v34 = a3;
  if (a5)
  {
    id v34 = a3;
    if ([a5 buffer])
    {
      if (a3 != a5)
      {
        uint64_t v35 = [a3 buffer];
        if (v35 != [a5 buffer]
          || (uint64_t v36 = [a3 bufferOffset], v36 != objc_msgSend(a5, "bufferOffset")))
        {
          AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeCopy((uint64_t)impl, a3, a5);
        }
      }
      id v34 = a5;
    }
  }
  int v306 = [a4 isInstanceDescriptor];
  if ((((v9 & 3) == 0) & ~v306) == 0)
  {
    v316 = (char *)[a3 buffer];
    uint64_t v298 = [a3 bufferOffset];
    [v316 contents];
    uint64_t v297 = [v316 gpuAddress];
    [v316 length];
    uint64_t v296 = (int)*MEMORY[0x263F4B188];
    [*((id *)impl + 1) useResource:v316 usage:1];
    uint64_t v37 = (void *)[v34 buffer];
    uint64_t v38 = [v34 bufferOffset];
    uint64_t v39 = [v37 contents];
    uint64_t v40 = [v37 gpuAddress];
    uint64_t v41 = [v37 length];
    uint64_t v42 = (uint64_t)v37 + (int)*MEMORY[0x263F4B188];
    uint64_t v335 = v40 + v38;
    uint64_t v336 = v38 + v39;
    uint64_t v337 = v41;
    uint64_t v338 = v42;
    [*((id *)impl + 1) useResource:v37 usage:2];
    unint64_t BVHDescriptor = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createBVHDescriptor(a4, 1, *((_DWORD *)impl + 8));
    unint64_t v318 = BVHDescriptor;
    if (BVHDescriptor) {
      BOOL v308 = *(unsigned __int8 *)(BVHDescriptor + 83) != 0;
    }
    else {
      BOOL v308 = 0;
    }
    uint64_t v44 = *(void **)(*((void *)impl + 1) + 88);
    uint64_t v45 = v44[20];
    uint64_t v46 = v45 + 143;
    if ((unint64_t)(v45 + 143) > v44[19])
    {
      int v291 = AGX::DataBufferAllocator<34ul>::growNoInline(v44 + 2, 3, 0);
      uint64_t v45 = v44[20];
      if (!v291)
      {
LABEL_33:
        unint64_t v47 = (v45 + 15) & 0xFFFFFFFFFFFFFFF0;
        unint64_t v48 = v47 + v44[22];
        v44[20] = v47 + 128;
        uint64_t v49 = *(void *)(v44[5] + 224) + (int)*MEMORY[0x263F4B188];
        *(_OWORD *)(v47 + 48) = 0u;
        *(_OWORD *)(v47 + 64) = 0u;
        *(_OWORD *)(v47 + 16) = 0u;
        *(_OWORD *)(v47 + 32) = 0u;
        *(_OWORD *)unint64_t v47 = 0u;
        *(void *)(v47 + 80) = 1;
        *(void *)(v47 + 88) = 0;
        *(_DWORD *)(v47 + 96) = -1;
        *(void *)(v47 + 100) = 0;
        int64x2_t v50 = (unsigned char *)(v47 + 100);
        *(void *)(v47 + 116) = 0;
        *(void *)(v47 + 108) = 0;
        unint64_t v51 = *(void *)(*((void *)impl + 1) + 88);
        *(void *)(v51 + 15584) = v48;
        unint64_t v307 = v48;
        *(void *)(*(void *)(v51 + 1936) + 592) = v48;
        uint64_t v304 = v49;
        *(void *)(v51 + 11712) = v49;
        *(void *)(v51 + 16624) |= 0x80uLL;
        *(_DWORD *)(v51 + 16656) |= 1u;
        uint64_t v309 = v9 & 1;
        *(unsigned char *)(v47 + 101) = v9 & 1;
        unint64_t v322 = v47;
        *(unsigned char *)(v47 + 102) = (v9 & 2) != 0;
        LOBYTE(v51) = v318;
        if (v318) {
          unint64_t v51 = ((unint64_t)[*(id *)(v318 + 48) usage] >> 1) & 1;
        }
        unint64_t v52 = v322;
        *(unsigned char *)(v322 + 103) = v51;
        {
          shouldUpdateOpacityAndShaderTableOffsets(void)::updateOpacityAndShaderTableOffsets = dyld_program_sdk_at_least() ^ 1;
          unint64_t v52 = v322;
        }
        *(unsigned char *)(v52 + 107) = shouldUpdateOpacityAndShaderTableOffsets(void)::updateOpacityAndShaderTableOffsets;
        LOBYTE(v53) = v318;
        if (v318)
        {
          if ([*(id *)(v318 + 48) usage]) {
            LOBYTE(v54) = 1;
          }
          else {
            unint64_t v54 = ((unint64_t)[*(id *)(v318 + 48) usage] >> 1) & 1;
          }
          unint64_t v55 = v322;
          *(unsigned char *)(v322 + 106) = v54;
          uint64_t v53 = *(void *)(v318 + 16);
        }
        else
        {
          unint64_t v55 = v322;
          *(unsigned char *)(v322 + 106) = 0;
        }
        *(unsigned char *)(v55 + 108) = v53;
        memset(v334, 0, sizeof(v334));
        memset(__p, 0, sizeof(__p));
        if (v306)
        {
          uint64_t v56 = objc_opt_class();
          if ([v56 isSubclassOfClass:objc_opt_class()])
          {
            uint64_t v57 = [a4 motionTransformType];
            switch([a4 instanceDescriptorType])
            {
              case 0:
                unint64_t v58 = v322;
                *(_WORD *)(v322 + 120) = 7;
                *(_DWORD *)(v322 + 88) = 128;
                int v323 = 35;
                int v325 = 34;
                break;
              case 1:
                unint64_t v58 = v322;
                *(_WORD *)(v322 + 120) = 8;
                *(_DWORD *)(v322 + 88) = 128;
                int v323 = 37;
                int v325 = 36;
                break;
              case 2:
                if (v57 == 1) {
                  __int16 v85 = 11;
                }
                else {
                  __int16 v85 = 10;
                }
                *(_WORD *)(v322 + 120) = v85;
                *(_DWORD *)(v322 + 88) = 48;
                int v74 = [a4 motionTransformType];
                BOOL v75 = v57 == 1;
                if (v57 == 1) {
                  int v86 = 43;
                }
                else {
                  int v86 = 41;
                }
                int v323 = v86;
                int v77 = 40;
                int v78 = 42;
                goto LABEL_94;
              case 3:
                unint64_t v58 = v322;
                *(_WORD *)(v322 + 120) = 9;
                *(_DWORD *)(v322 + 88) = 128;
                int v323 = 39;
                int v325 = 38;
                break;
              case 4:
                if (v57 == 1) {
                  __int16 v73 = 13;
                }
                else {
                  __int16 v73 = 12;
                }
                *(_WORD *)(v322 + 120) = v73;
                *(_DWORD *)(v322 + 88) = 48;
                int v74 = [a4 motionTransformType];
                BOOL v75 = v57 == 1;
                if (v57 == 1) {
                  int v76 = 47;
                }
                else {
                  int v76 = 45;
                }
                int v323 = v76;
                int v77 = 44;
                int v78 = 46;
LABEL_94:
                if (v75) {
                  int v77 = v78;
                }
                int v325 = v77;
                unint64_t v58 = v322;
                *(_DWORD *)(v322 + 84) = v74;
                break;
              default:
                int v323 = -1;
                int v325 = -1;
                unint64_t v58 = v322;
                break;
            }
          }
          else
          {
            uint64_t v62 = [a4 motionTransformType];
            switch([a4 instanceDescriptorType])
            {
              case 0:
                unint64_t v58 = v322;
                *(_WORD *)(v322 + 120) = 7;
                *(_DWORD *)(v322 + 88) = 128;
                int v323 = 35;
                int v325 = 34;
                break;
              case 1:
                unint64_t v58 = v322;
                *(_WORD *)(v322 + 120) = 8;
                *(_DWORD *)(v322 + 88) = 128;
                int v323 = 37;
                int v325 = 36;
                break;
              case 2:
                if (v62 == 1) {
                  __int16 v87 = 11;
                }
                else {
                  __int16 v87 = 10;
                }
                *(_WORD *)(v322 + 120) = v87;
                *(_DWORD *)(v322 + 88) = 48;
                int v80 = [a4 motionTransformType];
                BOOL v81 = v62 == 1;
                if (v62 == 1) {
                  int v88 = 43;
                }
                else {
                  int v88 = 41;
                }
                int v323 = v88;
                int v83 = 40;
                int v84 = 42;
                goto LABEL_104;
              case 3:
                unint64_t v58 = v322;
                *(_WORD *)(v322 + 120) = 9;
                *(_DWORD *)(v322 + 88) = 128;
                int v323 = 39;
                int v325 = 38;
                break;
              case 4:
                if (v62 == 1) {
                  __int16 v79 = 13;
                }
                else {
                  __int16 v79 = 12;
                }
                *(_WORD *)(v322 + 120) = v79;
                *(_DWORD *)(v322 + 88) = 48;
                int v80 = [a4 motionTransformType];
                BOOL v81 = v62 == 1;
                if (v62 == 1) {
                  int v82 = 47;
                }
                else {
                  int v82 = 45;
                }
                int v323 = v82;
                int v83 = 44;
                int v84 = 46;
LABEL_104:
                if (v81) {
                  int v83 = v84;
                }
                int v325 = v83;
                unint64_t v58 = v322;
                *(_DWORD *)(v322 + 84) = v80;
                break;
              default:
                int v323 = -1;
                int v325 = -1;
                unint64_t v58 = v322;
                break;
            }
          }
          *(_DWORD *)(v58 + 96) = 0;
          *(_DWORD *)(v58 + 56) = 1;
          unsigned int v59 = 0;
          int v295 = 0;
          *(unsigned char *)(v322 + 104) = [a4 instanceTransformationMatrixLayout] == 1;
          int v299 = -1;
          int v300 = -1;
          int v301 = -1;
          goto LABEL_115;
        }
        if (!objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "count"))
        {
          unsigned int v59 = 0;
          int v295 = 0;
          int v299 = -1;
          int v300 = -1;
          int v323 = -1;
          int v325 = -1;
          goto LABEL_164;
        }
        unsigned int v59 = objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "count");
        if (v318 && *(void *)(v318 + 40))
        {
          unint64_t v60 = 0;
          unint64_t v61 = 0;
          do
          {
            if (v61 <= objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "objectAtIndexedSubscript:", v60), "primitiveDataElementSize"))unint64_t v61 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "objectAtIndexedSubscript:", v60), "primitiveDataElementSize"); {
            ++v60;
            }
          }
          while (*(void *)(v318 + 40) > v60);
          BOOL v63 = v61 != 0;
        }
        else
        {
          BOOL v63 = 0;
        }
        *(_DWORD *)(v322 + 96) = 1;
        *(_DWORD *)(v322 + 56) = [a4 motionKeyframeCount];
        if ((unint64_t)[a4 motionKeyframeCount] >= 2)
        {
          [a4 motionStartTime];
          *(_DWORD *)(v322 + 64) = v64;
          [a4 motionEndTime];
          *(_DWORD *)(v322 + 68) = v65;
          *(_DWORD *)(v322 + 72) = [a4 motionStartBorderMode];
          *(_DWORD *)(v322 + 76) = [a4 motionEndBorderMode];
          *(_DWORD *)(v322 + 60) = 64;
        }
        [a4 motionKeyframeCount];
        *(_DWORD *)(v322 + 80) = 1;
        if (v318)
        {
          unsigned int v66 = *(_DWORD *)(v318 + 136);
          if (v66 > 7)
          {
            if (v63)
            {
              int v323 = -1;
              int v325 = -1;
              int v300 = -1;
              int v301 = 0;
              int v299 = -1;
              goto LABEL_135;
            }
            int v71 = 4;
            *(_DWORD *)(v322 + 88) = 4;
            int v323 = -1;
            int v325 = -1;
            int v299 = -1;
            int v300 = -1;
            goto LABEL_163;
          }
          int v67 = 1 << v66;
          if ((v67 & 0xD2) != 0)
          {
            if ((unint64_t)[a4 motionKeyframeCount] < 2)
            {
              int v68 = 0;
              *(_WORD *)(v322 + 120) = 2;
              int v300 = -1;
              int v69 = 1;
              int v323 = 29;
              int v325 = 28;
              unsigned int v70 = 36;
            }
            else
            {
              int v68 = 0;
              *(_WORD *)(v322 + 120) = 3;
              int v300 = -1;
              int v69 = 1;
              int v323 = 113;
              int v325 = 112;
              unsigned int v70 = 64;
            }
            int v71 = 4;
            int v301 = 1;
LABEL_132:
            int v299 = -1;
            goto LABEL_133;
          }
          if ((v67 & 9) == 0)
          {
            if ((unint64_t)[a4 motionKeyframeCount] < 2)
            {
              if (getCoarseCurveTestMode((MTLAccelerationStructureDescriptor *)a4) == 1)
              {
                unint64_t v72 = v322;
                *(_WORD *)(v322 + 120) = 6;
                int v323 = 33;
                int v325 = 32;
                unsigned int v70 = 64;
              }
              else
              {
                unint64_t v72 = v322;
                *(_WORD *)(v322 + 120) = 4;
                int v323 = 31;
                int v325 = 30;
                unsigned int v70 = 24;
              }
            }
            else
            {
              unint64_t v72 = v322;
              *(_WORD *)(v322 + 120) = 5;
              int v323 = 115;
              int v325 = 114;
              unsigned int v70 = 32;
            }
            unint64_t v91 = *(_DWORD *)(v72 + 56) * v59;
            if (v91)
            {
              std::vector<unsigned long long>::__append((uint64_t)__p, v91);
              uint64_t v92 = __p[0];
            }
            else
            {
              uint64_t v92 = 0;
            }
            AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::calculateCurveControlPointTotalSizeAndOffsets<true>(v318, a4, (uint64_t)v92);
            int v68 = 0;
            int v69 = 0;
            int v300 = -1;
            int v301 = 2;
            int v71 = 4;
            goto LABEL_132;
          }
          if (*(_DWORD *)(v318 + 140) == 2) {
            [a4 motionKeyframeCount];
          }
        }
        if ((unint64_t)[a4 motionKeyframeCount] >= 2)
        {
          int v69 = 0;
          int v68 = 1;
          *(_WORD *)(v322 + 120) = 1;
          *(unsigned char *)(v322 + 122) = 2;
          int v299 = -1;
          int v300 = 116;
          int v301 = 0;
          int v323 = 111;
          int v325 = 110;
          unsigned int v70 = 88;
          int v71 = 128;
LABEL_133:
          if (v63)
          {
            if ((v68 & 1) == 0)
            {
              int v95 = 0;
              if (v69)
              {
                BOOL v97 = (unint64_t)[a4 motionKeyframeCount] > 1;
                int v98 = 48;
                int v99 = 96;
              }
              else
              {
                BOOL v97 = (unint64_t)[a4 motionKeyframeCount] > 1;
                int v98 = 32;
                int v99 = 48;
              }
              if (v97) {
                int v98 = v99;
              }
              *(_DWORD *)(v322 + 88) = v98;
LABEL_152:
              if (v59)
              {
                std::vector<unsigned long long>::__append((uint64_t)v334, v59);
                int v100 = v334[0];
              }
              else
              {
                int v100 = 0;
              }
              AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::calculateOutOfLinePerPrimitiveDataTotalSizeAndOffsets<true>(v318, a4, v100);
              int v295 = 1;
              if (v95) {
                goto LABEL_164;
              }
LABEL_115:
              *(_DWORD *)(v322 + 92) = *(_DWORD *)(v322 + 88);
              {
              }
              {
              }
              BOOL v89 = 0;
              unsigned char *v50 = 0;
              unint64_t v90 = v322;
LABEL_168:
              *(unsigned char *)(v90 + 105) = v89;
              if ([a4 isInstanceDescriptor])
              {
                unint64_t v346 = (unint64_t)impl;
                v347.i64[0] = (uint64_t)&v335;
                v102 = objc_opt_class();
                if ([v102 isSubclassOfClass:objc_opt_class()]) {
                  AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeCopyMotionTransforms(MTLAccelerationStructureDescriptor *,AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::BuilderBuffer const&)::{lambda(AGX::HAL200::Encoders *)#1}::operator()<MTLIndirectInstanceAccelerationStructureDescriptor>((uint64_t *)&v346, a4);
                }
                else {
                  AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeCopyMotionTransforms(MTLAccelerationStructureDescriptor *,AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::BuilderBuffer const&)::{lambda(AGX::HAL200::Encoders *)#1}::operator()<MTLInstanceAccelerationStructureDescriptor>((uint64_t *)&v346, a4);
                }
                v104 = objc_opt_class();
                if ([v104 isSubclassOfClass:objc_opt_class()])
                {
                  v105 = (void *)[a4 instanceDescriptorBuffer];
                  uint64_t v106 = [a4 instanceDescriptorBufferOffset];
                  [v105 contents];
                  uint64_t v107 = [v105 gpuAddress];
                  [v105 length];
                  [*((id *)impl + 1) useResource:v105 usage:1];
                  *(void *)(v322 + 24) = v107 + v106;
                  *(_DWORD *)(v322 + 112) = [a4 instanceDescriptorStride];
                  if (([a4 usage] & 4) != 0) {
                    int v108 = -1;
                  }
                  else {
                    int v108 = 255;
                  }
                  *(_DWORD *)(v322 + 116) = v108;
                }
                else
                {
                  v133 = (void *)[a4 instanceDescriptorBuffer];
                  uint64_t v134 = [a4 instanceDescriptorBufferOffset];
                  [v133 contents];
                  uint64_t v135 = [v133 gpuAddress];
                  [v133 length];
                  [*((id *)impl + 1) useResource:v133 usage:1];
                  *(void *)(v322 + 24) = v135 + v134;
                  *(_DWORD *)(v322 + 112) = [a4 instanceDescriptorStride];
                  if (([a4 usage] & 4) != 0) {
                    int v136 = -1;
                  }
                  else {
                    int v136 = 255;
                  }
                  *(_DWORD *)(v322 + 116) = v136;
                  uint64_t v137 = (void *)[a4 instancedAccelerationStructures];
                  unint64_t v138 = [v137 count];
                  unint64_t v139 = v138;
                  if (v138 <= 1) {
                    uint64_t v140 = 1;
                  }
                  else {
                    uint64_t v140 = v138;
                  }
                  AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::BuilderBufferForPrivateAllocation((uint64_t *)v341, (uint64_t)impl, 8 * v140, 0);
                  if (v139)
                  {
                    uint64_t v141 = 0;
                    uint64_t v142 = *(void *)&v341[8];
                    do
                    {
                      int64x2_t v143 = (void *)[v137 objectAtIndexedSubscript:v141];
                      uint64_t v144 = objc_msgSend((id)objc_msgSend(v143, "buffer"), "gpuAddress");
                      *(void *)(v142 + 8 * v141++) = [v143 bufferOffset] + v144;
                    }
                    while (v139 != v141);
                  }
                  uint64_t v145 = [v137 count];
                  if ((unint64_t)[v137 count] < 2) {
                    unint64_t v146 = 4;
                  }
                  else {
                    unint64_t v146 = 4 * [v137 count];
                  }
                  AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::BuilderBufferForPrivateAllocation((uint64_t *)v339, (uint64_t)impl, v146, 0);
                  if (v145)
                  {
                    uint64_t v287 = 0;
                    uint64_t v288 = *(void *)&v339[8];
                    do
                    {
                      *(_DWORD *)(v288 + 4 * v287) = *(_DWORD *)([v137 objectAtIndexedSubscript:v287]
                                                               + 344);
                      ++v287;
                    }
                    while (v145 != v287);
                  }
                  uint64_t v289 = *(void *)v341;
                  *(void *)(v322 + 40) = *(void *)v339;
                  *(void *)(v322 + 48) = v289;
                  long long v344 = 0u;
                  long long v345 = 0u;
                  memset(v343, 0, sizeof(v343));
                  for (uint64_t i = [v137 countByEnumeratingWithState:v343 objects:&v346 count:16];
                        i;
                        uint64_t i = [v137 countByEnumeratingWithState:v343 objects:&v346 count:16])
                  {
                    [*((id *)impl + 1) useResources:v343[1] count:i usage:1];
                  }
                }
              }
              else if (objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "count"))
              {
                AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::BuilderBufferForPrivateAllocation((uint64_t *)&v346, (uint64_t)impl, [(id)v318 resourceBufferLength], 0);
                unint64_t v103 = v346;
                [(id)v318 setResourceBufferContents:v347.i64[0] resourceBufferAddress:v346 instanceBoundingBoxBufferAddress:0 useResourcesOnEncoder:*((void *)impl + 1)];
                *(void *)(v322 + 16) = v103;
              }
              *(void *)unint64_t v322 = v335;
              *(void *)(v322 + 8) = v337;
              uint64_t v109 = *((void *)impl + 2);
              if (v109)
              {
                *(void *)(v322 + 32) = *(void *)(v109 + (int)*MEMORY[0x263F4B188] + 8);
                objc_msgSend(*((id *)impl + 1), "useResource:usage:");
              }
              [*((id *)impl + 1) setThreadgroupMemoryLength:1536 atIndex:0];
              if (v318 && v301 == 2 && (v9 & 1) != 0)
              {
                uint64_t v110 = *(void **)(v318 + 48);
                int v111 = *(_DWORD *)(v318 + 136);
                if (v111 == 2)
                {
                  v314 = (void *)[v110 geometryDescriptors];
                  if (v59)
                  {
                    uint64_t v147 = 0;
                    uint64_t v148 = v59;
                    uint64_t v149 = __p[0];
                    do
                    {
                      int64x2_t v150 = (void *)[v314 objectAtIndexedSubscript:v147];
                      long long v151 = (char *)[v150 controlPointBuffer];
                      uint64_t v152 = [v150 controlPointBufferOffset];
                      uint64_t v153 = [v151 contents];
                      uint64_t v154 = [v151 gpuAddress];
                      uint64_t v155 = [v151 length];
                      v156 = &v151[*MEMORY[0x263F4B188]];
                      unint64_t v346 = v154 + v152;
                      v347.i64[0] = v152 + v153;
                      v347.i64[1] = v155;
                      uint64_t v348 = (uint64_t)v156;
                      [*((id *)impl + 1) useResource:v151 usage:1];
                      LODWORD(v151) = [v150 controlPointStride];
                      MTLAttributeFormat v157 = [v150 controlPointFormat];
                      v158 = (void *)[v150 radiusBuffer];
                      uint64_t v159 = [v150 radiusBufferOffset];
                      uint64_t v160 = [v158 contents];
                      uint64_t v161 = [v158 gpuAddress];
                      uint64_t v162 = [v158 length];
                      uint64_t v163 = (uint64_t)v158 + (int)*MEMORY[0x263F4B188];
                      v343[0] = v161 + v159;
                      v343[1] = v159 + v160;
                      v343[2] = v162;
                      v343[3] = v163;
                      [*((id *)impl + 1) useResource:v158 usage:1];
                      LODWORD(v158) = [v150 radiusStride];
                      MTLAttributeFormat v8 = [v150 radiusFormat];
                      uint64_t v164 = [v150 controlPointCount];
                      uint64_t v165 = v335 + v149[v147];
                      *(void *)v341 = v335 + 152;
                      *(void *)&v341[8] = v336 + 152;
                      *(void *)&v341[16] = v337;
                      uint64_t v342 = v338;
                      AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeCopyControlPoints((uint64_t)impl, &v346, (int)v151, v157, v343, (int)v158, v8, v164, v165, v338, (uint64_t *)v341);
                      ++v147;
                    }
                    while (v148 != v147);
                  }
                }
                else if (v111 == 5)
                {
                  v313 = (void *)[v110 geometryDescriptors];
                  if (v59)
                  {
                    MTLAttributeFormat v8 = MTLAttributeFormatInvalid;
                    uint64_t v311 = v59;
                    uint64_t v112 = __p[0];
                    do
                    {
                      uint64_t v113 = [v313 objectAtIndexedSubscript:v8];
                      if (*(_DWORD *)(v322 + 56))
                      {
                        uint64_t v114 = (void *)v113;
                        unint64_t v115 = 0;
                        do
                        {
                          uint64_t v116 = (char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v114, "controlPointBuffers"), "objectAtIndexedSubscript:", v115), "buffer");
                          uint64_t v117 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v114, "controlPointBuffers"), "objectAtIndexedSubscript:", v115), "offset");
                          uint64_t v118 = [v116 contents];
                          uint64_t v119 = [v116 gpuAddress];
                          uint64_t v120 = [v116 length];
                          uint64_t v121 = &v116[*MEMORY[0x263F4B188]];
                          unint64_t v346 = v119 + v117;
                          v347.i64[0] = v117 + v118;
                          v347.i64[1] = v120;
                          uint64_t v348 = (uint64_t)v121;
                          [*((id *)impl + 1) useResource:v116 usage:1];
                          int v122 = [v114 controlPointStride];
                          MTLAttributeFormat v123 = [v114 controlPointFormat];
                          v124 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v114, "radiusBuffers"), "objectAtIndexedSubscript:", v115), "buffer");
                          uint64_t v125 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v114, "radiusBuffers"), "objectAtIndexedSubscript:", v115), "offset");
                          uint64_t v126 = [v124 contents];
                          uint64_t v127 = [v124 gpuAddress];
                          uint64_t v128 = [v124 length];
                          uint64_t v129 = (uint64_t)v124 + (int)*MEMORY[0x263F4B188];
                          v343[0] = v127 + v125;
                          v343[1] = v125 + v126;
                          v343[2] = v128;
                          v343[3] = v129;
                          [*((id *)impl + 1) useResource:v124 usage:1];
                          LODWORD(v124) = [v114 radiusStride];
                          MTLAttributeFormat v130 = [v114 radiusFormat];
                          uint64_t v131 = [v114 controlPointCount];
                          uint64_t v132 = v335 + v112[v115 + v8 * *(unsigned int *)(v322 + 56)];
                          *(void *)v341 = v335 + 152;
                          *(void *)&v341[8] = v336 + 152;
                          *(void *)&v341[16] = v337;
                          uint64_t v342 = v338;
                          AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeCopyControlPoints((uint64_t)impl, &v346, v122, v123, v343, (int)v124, v130, v131, v132, v338, (uint64_t *)v341);
                          ++v115;
                        }
                        while (v115 < *(unsigned int *)(v322 + 56));
                      }
                      ++v8;
                    }
                    while (v8 != v311);
                  }
                }
              }
              if (v308)
              {
                unsigned int v166 = 1;
              }
              else
              {
                unsigned int v166 = *(_DWORD *)(v322 + 56) - 1;
                if (v166 <= 1) {
                  unsigned int v166 = 1;
                }
              }
              unsigned int v315 = v166;
              if (*(_DWORD *)*MEMORY[0x263F4B1E8]) {
                IOGPUDeviceTraceEvent();
              }
              if ([(id)v318 buildAlgorithm] == 1 || objc_msgSend((id)v318, "buildAlgorithm") == 2)
              {
                unint64_t Pipeline = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 96, 0);
                unint64_t v168 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 97, 0);
                v321 = (MTLAccelerationStructureDescriptor *)AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 95, 0);
                uint64_t v169 = *(void *)(*((void *)impl + 1) + 88);
                unsigned __int8 v170 = [(id)v318 buildAlgorithm];
                unint64_t v346 = 0;
                int64x2_t v347 = 0uLL;
                AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::allocateInline((uint64_t)&v346, *((void *)impl + 1), 72, 1);
                v171 = (_OWORD *)v346;
                int64x2_t v172 = v347;
                *(void *)(v346 + 64) = 0;
                v171[2] = 0u;
                v171[3] = 0u;
                _OWORD *v171 = 0u;
                v171[1] = 0u;
                v173 = *(void **)(*((void *)impl + 1) + 88);
                uint64_t v174 = v173[20];
                uint64_t v175 = v174 + 31;
                if ((unint64_t)(v174 + 31) > v173[19])
                {
                  int v292 = AGX::DataBufferAllocator<34ul>::growNoInline(v173 + 2, 3, 0);
                  uint64_t v174 = v173[20];
                  if (!v292)
                  {
LABEL_217:
                    BOOL v324 = 0;
                    uint64_t v326 = v170;
                    v176 = (unsigned __int16 *)((v174 + 15) & 0xFFFFFFFFFFFFFFF0);
                    uint64_t v177 = v173[22];
                    v173[20] = v176 + 8;
                    uint64_t v178 = *(void *)(v173[5] + 224);
                    uint64_t v179 = (int)*MEMORY[0x263F4B188];
                    v176[2] = 0;
                    *(_DWORD *)v176 = 0;
                    if (*((_DWORD *)impl + 8) >= 2u && v309) {
                      BOOL v324 = *(unsigned char *)(v322 + 122) != 0;
                    }
                    if (v326 == 2)
                    {
                      {
                        AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodePLOCRefit(AGXG17FamilyRayTracingAccelerationStructure *,MTLAccelerationStructureDescriptor *,BVHDescriptor const*,AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::BuilderBuffer const&,AGXG17FamilyRayTracingAccelerationStructure *,AGXG17FamilyBuffer *,unsigned long,unsigned long long,BOOL,BOOL)::mediumRefitSingleThreadgroupSize = 128;
                      }
                      LOWORD(v180) = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodePLOCRefit(AGXG17FamilyRayTracingAccelerationStructure *,MTLAccelerationStructureDescriptor *,BVHDescriptor const*,AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::BuilderBuffer const&,AGXG17FamilyRayTracingAccelerationStructure *,AGXG17FamilyBuffer *,unsigned long,unsigned long long,BOOL,BOOL)::mediumRefitSingleThreadgroupSize;
                      uint64_t v181 = v172.i64[0];
                    }
                    else
                    {
                      {
                        AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodePLOCRefit(AGXG17FamilyRayTracingAccelerationStructure *,MTLAccelerationStructureDescriptor *,BVHDescriptor const*,AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::BuilderBuffer const&,AGXG17FamilyRayTracingAccelerationStructure *,AGXG17FamilyBuffer *,unsigned long,unsigned long long,BOOL,BOOL)::smallRefitSingleThreadgroupSize = 0;
                      }
                      if (AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodePLOCRefit(AGXG17FamilyRayTracingAccelerationStructure *,MTLAccelerationStructureDescriptor *,BVHDescriptor const*,AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::BuilderBuffer const&,AGXG17FamilyRayTracingAccelerationStructure *,AGXG17FamilyBuffer *,unsigned long,unsigned long long,BOOL,BOOL)::smallRefitSingleThreadgroupSize)
                      {
                        if (((AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodePLOCRefit(AGXG17FamilyRayTracingAccelerationStructure *,MTLAccelerationStructureDescriptor *,BVHDescriptor const*,AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::BuilderBuffer const&,AGXG17FamilyRayTracingAccelerationStructure *,AGXG17FamilyBuffer *,unsigned long,unsigned long long,BOOL,BOOL)::smallRefitSingleThreadgroupSize
                             + 31) & 0xFFFFFC00) != 0)
                          LOWORD(v180) = 1024;
                        else {
                          LOWORD(v180) = (AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodePLOCRefit(AGXG17FamilyRayTracingAccelerationStructure *,MTLAccelerationStructureDescriptor *,BVHDescriptor const*,AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::BuilderBuffer const&,AGXG17FamilyRayTracingAccelerationStructure *,AGXG17FamilyBuffer *,unsigned long,unsigned long long,BOOL,BOOL)::smallRefitSingleThreadgroupSize
                        }
                                        + 31) & 0xFFE0;
                        uint64_t v181 = v172.i64[0];
                      }
                      else
                      {
                        unsigned int v180 = v318;
                        uint64_t v181 = v172.i64[0];
                        if (v318) {
                          unsigned int v180 = ((*(_DWORD *)(v318 + 24) >> 4) + 31) & 0x1FFFFFE0;
                        }
                        if (v180 <= 0x40) {
                          unsigned int v180 = 64;
                        }
                        if (v180 >= 0x400) {
                          LOWORD(v180) = 1024;
                        }
                      }
                    }
                    v257 = (char *)v176 + v177;
                    uint64_t v258 = v178 + v179;
                    unsigned __int16 *v176 = v180;
                    __int16 v259 = v324;
                    if (v324)
                    {
                      int v260 = *(unsigned __int8 *)(v322 + 122);
                      if (v260 == 3) {
                        int v261 = 1024;
                      }
                      else {
                        int v261 = 640;
                      }
                      if (v260 != 3 && v326 != 2) {
                        int v261 = (-[BVHDescriptor maxInnerNodeCount](v318) + 31) & 0xFFFFFFE0;
                      }
                      v262 = &unk_268D5A000;
                      {
                        v262 = &unk_268D5A000;
                        if (v293)
                        {
                          AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodePLOCRefit(AGXG17FamilyRayTracingAccelerationStructure *,MTLAccelerationStructureDescriptor *,BVHDescriptor const*,AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::BuilderBuffer const&,AGXG17FamilyRayTracingAccelerationStructure *,AGXG17FamilyBuffer *,unsigned long,unsigned long long,BOOL,BOOL)::smallRefitQtbSingleThreadgroupSizeEv = 0;
                          v262 = (_DWORD *)&unk_268D5A000;
                        }
                      }
                      v263 = &unk_268D5A000;
                      {
                        v263 = &unk_268D5A000;
                        v262 = (_DWORD *)&unk_268D5A000;
                        if (v294)
                        {
                          AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodePLOCRefit(AGXG17FamilyRayTracingAccelerationStructure *,MTLAccelerationStructureDescriptor *,BVHDescriptor const*,AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::BuilderBuffer const&,AGXG17FamilyRayTracingAccelerationStructure *,AGXG17FamilyBuffer *,unsigned long,unsigned long long,BOOL,BOOL)::mediumRefitQtbSingleThreadgroupSizeEv = 0;
                          v263 = (_DWORD *)&unk_268D5A000;
                          v262 = (_DWORD *)&unk_268D5A000;
                        }
                      }
                      int v264 = v262[246];
                      if (!v264) {
                        int v264 = v261;
                      }
                      int v265 = v263[250];
                      if (!v265) {
                        int v265 = v261;
                      }
                      if (v326 == 2) {
                        int v264 = v265;
                      }
                      int v266 = v264 + 31;
                      if ((v266 & 0xFFFFFC00) != 0) {
                        __int16 v267 = 1024;
                      }
                      else {
                        __int16 v267 = v266 & 0xFFE0;
                      }
                      v176[2] = v267;
                      if (v260 == 3) {
                        __int16 v259 = 4;
                      }
                      else {
                        __int16 v259 = 1;
                      }
                      uint64_t v268 = 2;
                      uint64_t v181 = v172.i64[0];
                    }
                    else
                    {
                      v176[2] = 0;
                      uint64_t v268 = 1;
                    }
                    v176[1] = v259;
                    uint64_t v269 = *((void *)impl + 1);
                    uint64_t v270 = *(void *)(v269 + 88);
                    *(void *)(v270 + 15584) = v307;
                    *(void *)(*(void *)(v270 + 1936) + 592) = v307;
                    *(void *)(v270 + 11712) = v304;
                    *(void *)(v270 + 16624) |= 0x80uLL;
                    *(_DWORD *)(v270 + 16656) |= 1u;
                    uint64_t v271 = *(void *)(v269 + 88);
                    *(void *)(v271 + 15592) = v257;
                    *(void *)(*(void *)(v271 + 1936) + 600) = v257;
                    *(void *)(v271 + 11720) = v258;
                    *(void *)(v271 + 16624) |= 0x100uLL;
                    *(_DWORD *)(v271 + 16656) |= 1u;
                    uint64_t v272 = *(void *)(v269 + 88);
                    *(void *)(v272 + 15600) = v181;
                    *(void *)(*(void *)(v272 + 1936) + 608) = v181;
                    *(void *)(v272 + 11728) = v172.i64[1];
                    *(void *)(v272 + 16624) |= 0x200uLL;
                    *(_DWORD *)(v272 + 16656) |= 1u;
                    uint64_t v273 = [(id)v318 buildAlgorithm];
                    uint64_t v274 = *(void *)(v169 + 1920);
                    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v169, (uint64_t)v321);
                    unint64_t v275 = 32;
                    if (v273) {
                      unint64_t v275 = 1;
                    }
                    unint64_t v346 = v275;
                    int64x2_t v347 = vdupq_n_s64(1uLL);
                    v343[0] = v268;
                    *(int64x2_t *)&v343[1] = v347;
                    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelCommonImpl(v169, 0x16u, (uint64_t *)&v346, (int *)v343);
                    if (*(_DWORD *)(v169 + 1880) == 1) {
                      AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::encodeBarrier(v169, 22);
                    }
                    if (v274) {
                      AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v169, v274);
                    }
                    LODWORD(v346) = v326 == 2;
                    [*((id *)impl + 1) setBytes:&v346 length:4 atIndex:12];
                    [*((id *)impl + 1) setThreadgroupMemoryLength:24 * ((*v176 + 7) & 0x1FFF8) atIndex:0];
                    AGX::ComputeService<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsIndirectInternal(v169, 22, Pipeline, v181, v172.i64[1]);
                    if (v324) {
                      AGX::ComputeService<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsIndirectInternal(v169, 22, v168, v181 + 24, v172.i64[1]);
                    }
                    if (v326 == 2)
                    {
                      LODWORD(v346) = 2;
                      [*((id *)impl + 1) setBytes:&v346 length:4 atIndex:12];
                      AGX::ComputeService<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsIndirectInternal(v169, 22, Pipeline, v181 + 48, v172.i64[1]);
                    }
LABEL_342:
                    if (__p[0]) {
                      operator delete(__p[0]);
                    }
                    if (v334[0]) {
                      operator delete(v334[0]);
                    }
                    goto LABEL_346;
                  }
                  uint64_t v175 = v174 + 31;
                  if ((unint64_t)(v174 + 31) > v173[19]) {
                    abort();
                  }
                }
                v173[21] = v175;
                goto LABEL_217;
              }
              if (v318) {
                uint64_t v182 = *(void *)(v318 + 16);
              }
              else {
                LODWORD(v182) = 0;
              }
              if (*(_DWORD *)(*(void *)(*(void *)impl + 808) + 5876) <= 0x1Eu) {
                unint64_t v183 = 6;
              }
              else {
                unint64_t v183 = 7;
              }
              BOOL v185 = v300 != -1 && v309 != 0;
              BOOL v186 = *((_DWORD *)impl + 8) >= 2u && v185;
              unint64_t v312 = (v182 - 1);
              BOOL v310 = v186;
              unsigned int v332 = v182 - 1 + v186;
              AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::BuilderBufferForPrivateAllocation((uint64_t *)&v346, (uint64_t)impl, 24 * v332, 1);
              AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::BuilderBufferForPrivateAllocation(v343, (uint64_t)impl, 32 * v332, 0);
              v187 = (void *)*((void *)impl + 1);
              uint64_t v188 = v187[11];
              unsigned int v189 = v332;
              if (v332)
              {
                if (v182 != 1)
                {
                  unint64_t v191 = v346;
                  uint64_t v190 = v347.i64[0];
                  unint64_t v192 = (v182 - 1);
                  uint64_t v193 = v343[1];
                  uint64_t v194 = 4 * v192 + 128;
                  do
                  {
                    BOOL v195 = v192-- >= v183;
                    uint64_t v196 = 24 * v192;
                    unint64_t v197 = v191 + v196;
                    uint64_t v198 = v196 + v190;
                    *(_OWORD *)uint64_t v198 = xmmword_242EA8510;
                    *(void *)(v198 + 16) = 0x100000001;
                    uint64_t v199 = v193 + 32 * v192;
                    *(void *)uint64_t v199 = v197;
                    *(void *)(v199 + 8) = 120;
                    if (v195) {
                      int v200 = 1;
                    }
                    else {
                      int v200 = 8;
                    }
                    *(void *)(v199 + 16) = v194;
                    *(_DWORD *)(v199 + 24) = v200;
                    v194 -= 4;
                  }
                  while (v192);
                }
                if (v310)
                {
                  uint64_t v201 = v189 - 1;
                  if (v182 >= 0x14 || v299 == -1) {
                    int v203 = 1;
                  }
                  else {
                    int v203 = 4;
                  }
                  uint64_t v204 = v343[1];
                  uint64_t v205 = 8 * (v201 + 2 * v201);
                  unint64_t v206 = v205 + v346;
                  uint64_t v207 = v205 + v347.i64[0];
                  *(_OWORD *)uint64_t v207 = xmmword_242EA8510;
                  *(void *)(v207 + 16) = 0x100000001;
                  uint64_t v208 = v204 + 32 * v201;
                  *(void *)uint64_t v208 = v206;
                  *(void *)(v208 + 8) = 120;
                  *(void *)(v208 + 16) = 4 * v312;
                  *(_DWORD *)(v208 + 24) = v203;
                }
                [v187 setBytes:&v332 length:4 atIndex:1];
                uint64_t v209 = *((void *)impl + 1);
                uint64_t v210 = *(void *)(v209 + 88);
                *(void *)(v210 + 15528) = v297 + v298;
                *(void *)(*(void *)(v210 + 1936) + 536) = v297 + v298;
                *(void *)(v210 + 11656) = &v316[v296];
                *(void *)(v210 + 16624) |= 1uLL;
                *(_DWORD *)(v210 + 16656) |= 1u;
                uint64_t v211 = *(void *)(v209 + 88);
                uint64_t v212 = v343[0];
                uint64_t v213 = v343[3];
                *(void *)(v211 + 15544) = v343[0];
                *(void *)(*(void *)(v211 + 1936) + 552) = v212;
                *(void *)(v211 + 11672) = v213;
                *(void *)(v211 + 16624) |= 4uLL;
                *(_DWORD *)(v211 + 16656) |= 1u;
                unint64_t v214 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 128, 0);
                uint64_t v215 = v332;
                uint64_t v216 = *(void *)(v188 + 1920);
                AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v188, v214);
                *(void *)v341 = v215;
                *(int64x2_t *)&v341[8] = vdupq_n_s64(1uLL);
                *(void *)v339 = v215;
                *(_OWORD *)&v339[8] = *(_OWORD *)&v341[8];
                AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsPerGridImpl(v188, 22, (int *)v341, v339);
                if (*(_DWORD *)(v188 + 1880) == 1) {
                  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::encodeBarrier(v188, 22);
                }
                if (v216) {
                  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v188, v216);
                }
              }
              unsigned int v217 = 0;
              BOOL v218 = !v308;
              uint64_t v317 = v218 | 0x100;
              BOOL v219 = v182 >= 0x14 || v299 == -1;
              int v220 = v300;
              if (!v219) {
                int v220 = v299;
              }
              int v305 = v220;
              unint64_t v221 = v346;
              uint64_t v222 = v348;
              do
              {
                for (unint64_t j = v312;
                      j;
                      AGX::ComputeService<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsIndirectInternal(v188, 22, v226, v221 + 24 * j, v222))
                {
                  *(_DWORD *)v341 = v217;
                  *(_DWORD *)&v341[4] = j;
                  [*((id *)impl + 1) setBytes:v341 length:8 atIndex:11];
                  if (j >= v183) {
                    int v224 = v323;
                  }
                  else {
                    int v224 = v325;
                  }
                  unint64_t v225 = v8 & 0xFFFFFFFFFFFF0000 | v218;
                  MTLAttributeFormat v8 = v225 | 0x100;
                  unint64_t v226 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, v224, (unsigned __int16)v225 | 0x100u);
                  --j;
                }
                v331[0] = v217;
                [*((id *)impl + 1) setBytes:v331 length:8 atIndex:11];
                uint64_t v227 = *(void *)(*((void *)impl + 1) + 88);
                unint64_t v318 = v318 & 0xFFFFFFFFFFFF0000 | v317;
                unint64_t v228 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, v325, v317);
                uint64_t v229 = *(void *)(v227 + 1920);
                AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v227, v228);
                *(_OWORD *)v341 = xmmword_242EA8500;
                *(void *)&v341[16] = 1;
                *(_OWORD *)v339 = xmmword_242EA8500;
                *(void *)&v339[16] = 1;
                AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsPerGridImpl(v227, 22, (int *)v341, v339);
                if (*(_DWORD *)(v227 + 1880) == 1) {
                  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::encodeBarrier(v227, 22);
                }
                if (v229) {
                  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v227, v229);
                }
                if (v310)
                {
                  unsigned int v230 = v332;
                  unint64_t v307 = v307 & 0xFFFFFFFFFFFF0000 | v317;
                  unint64_t v231 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, v305, v317);
                  AGX::ComputeService<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsIndirectInternal(v188, 22, v231, v221 + 24 * (v230 - 1), v222);
                }
                ++v217;
              }
              while (v217 != v315);
              if ((v306 & 1) != 0 || !*(unsigned char *)(v322 + 102) || !v295) {
                goto LABEL_342;
              }
              unint64_t v232 = 0;
              v233 = v334[0];
              while (1)
              {
                if (objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "count") <= v232) {
                  goto LABEL_342;
                }
                v234 = objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "objectAtIndexedSubscript:", v232);
                v235 = v234;
                if (v301 == 1) {
                  unsigned int v236 = [v234 boundingBoxCount];
                }
                else {
                  unsigned int v236 = v301 ? [v234 segmentCount] : objc_msgSend(v234, "triangleCount");
                }
                unint64_t v237 = v236;
                if (v236) {
                  break;
                }
LABEL_284:
                ++v232;
              }
              unsigned int v238 = [v235 primitiveDataElementSize];
              unsigned int v239 = v238;
              if (v238 < 2)
              {
                int v240 = 1;
              }
              else if (v238 > 0x10)
              {
                int v240 = 32;
              }
              else
              {
                int v240 = 1 << -__clz(v238 - 1);
              }
              v241 = (char *)[v235 primitiveDataBuffer];
              uint64_t v242 = [v235 primitiveDataBufferOffset];
              uint64_t v243 = [v241 contents];
              uint64_t v244 = [v241 gpuAddress];
              uint64_t v245 = [v241 length];
              v246 = &v241[*MEMORY[0x263F4B188]];
              *(void *)v341 = v244 + v242;
              *(void *)&v341[8] = v242 + v243;
              *(void *)&v341[16] = v245;
              uint64_t v342 = (uint64_t)v246;
              [*((id *)impl + 1) useResource:v241 usage:1];
              v247 = *(void **)(*((void *)impl + 1) + 88);
              uint64_t v248 = v247[20];
              uint64_t v249 = v248 + 31;
              if ((unint64_t)(v248 + 31) > v247[19])
              {
                int v256 = AGX::DataBufferAllocator<34ul>::growNoInline(v247 + 2, 3, 0);
                uint64_t v248 = v247[20];
                if (!v256) {
                  goto LABEL_298;
                }
                uint64_t v249 = v248 + 31;
                if ((unint64_t)(v248 + 31) > v247[19]) {
                  abort();
                }
              }
              v247[21] = v249;
LABEL_298:
              v250 = (void *)((v248 + 15) & 0xFFFFFFFFFFFFFFF0);
              uint64_t v251 = (int)*MEMORY[0x263F4B188];
              *(void *)v339 = (char *)v250 + v247[22];
              *(void *)&v339[8] = v250;
              void *v250 = 0;
              v247[20] = v250 + 2;
              uint64_t v252 = *(void *)(v247[5] + 224) + v251;
              *(void *)&v339[16] = 8;
              uint64_t v340 = v252;
              int v253 = [v235 primitiveDataStride];
              int v254 = [v235 primitiveDataElementSize];
              uint64_t v255 = v233[v232];
              v331[0] = v335 + v255;
              v331[1] = v255 + v336;
              v331[2] = v337;
              v331[3] = v338;
              v330[0] = v335 + 136;
              v330[1] = v336 + 136;
              v330[2] = v337;
              v330[3] = v338;
              AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeStridedCopy((uint64_t)impl, (uint64_t *)v341, (uint64_t *)v339, v253, (void *)v237, 1u, v254, v331, v330, (v239 + v240 - 1) & -v240);
              goto LABEL_284;
            }
LABEL_135:
            if ((unint64_t)[a4 motionKeyframeCount] <= 1) {
              int v93 = 64;
            }
            else {
              int v93 = 96;
            }
            *(_DWORD *)(v322 + 88) = v93;
            if ((unint64_t)[a4 motionKeyframeCount] <= 1) {
              int v94 = 96;
            }
            else {
              int v94 = 128;
            }
            *(_DWORD *)(v322 + 92) = v94;
            int v95 = 1;
            goto LABEL_152;
          }
          if (v70 < 0x21)
          {
            int v96 = 32;
            goto LABEL_159;
          }
          if (v70 < 0x31)
          {
            int v96 = 48;
            goto LABEL_159;
          }
          if (v70 < 0x41)
          {
            int v96 = 64;
LABEL_159:
            *(_DWORD *)(v322 + 88) = v96;
            if (!v68)
            {
LABEL_160:
              int v295 = 0;
              goto LABEL_115;
            }
            goto LABEL_163;
          }
          *(_DWORD *)(v322 + 88) = 96;
          if ((v68 & 1) == 0) {
            goto LABEL_160;
          }
LABEL_163:
          int v295 = 0;
          *(_DWORD *)(v322 + 92) = v71;
LABEL_164:
          unsigned int v101 = *((_DWORD *)impl + 8);
          {
          }
          {
          }
          int v301 = 0;
          BOOL v89 = v101 > 1;
          unint64_t v90 = v322;
          *(unsigned char *)(v322 + 100) = v101 > 1;
          if (*(_DWORD *)(v322 + 56) >= 3u) {
            BOOL v89 = 0;
          }
          goto LABEL_168;
        }
        *(_WORD *)(v322 + 120) = 0;
        int v68 = 1;
        *(unsigned char *)(v322 + 122) = 1;
        int v69 = v318;
        if (v318)
        {
          if (*(_DWORD *)(v318 + 140) == 2)
          {
            int v69 = 0;
            *(unsigned char *)(v322 + 122) = 4;
            int v299 = 49;
            int v300 = 50;
            int v301 = 0;
            int v68 = 1;
            int v323 = 27;
            int v325 = 26;
            unsigned int v70 = 48;
            int v71 = 64;
            goto LABEL_133;
          }
          int v69 = 0;
          int v301 = 0;
          int v299 = -1;
          int v68 = 1;
        }
        else
        {
          int v301 = 0;
          int v299 = -1;
        }
        int v323 = 27;
        int v325 = 26;
        unsigned int v70 = 48;
        int v71 = 64;
        int v300 = 48;
        goto LABEL_133;
      }
      uint64_t v46 = v45 + 143;
      if ((unint64_t)(v45 + 143) > v44[19]) {
        abort();
      }
    }
    v44[21] = v46;
    goto LABEL_33;
  }
LABEL_346:
  if ((v303 & 1) == 0)
  {
    v276 = (float *)self->_progressBins;
    if (v276)
    {
      uint64_t v277 = *((unsigned __int16 *)v276 + 21);
      v276[v277 + 6] = v276[11] + v276[v277 + 6];
      v276[11] = 0.0;
      if (*((unsigned char *)v276 + 48))
      {
        v278 = (uint64_t *)*((void *)v276 + 9);
        if (v278)
        {
          int v279 = *((_DWORD *)v276 + 35);
          do
          {
            *((_DWORD *)v278 + 8) = v279;
            *((_DWORD *)v278 + 9) = v277;
            v278 = (uint64_t *)*v278;
          }
          while (v278);
        }
        std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((void *)v276 + 12, (void *)v276 + 7);
        ++*((_DWORD *)v276 + 35);
      }
      else if (*((void *)v276 + 22))
      {
        uint64_t v280 = *((unsigned int *)v276 + 35);
        *((_DWORD *)v276 + 35) = v280 + 1;
        v281 = (void *)*((void *)v276 + 21);
        if (v281)
        {
          uint64_t v282 = *((void *)v276 + 18);
          v283 = (uint64_t **)*((void *)v276 + 21);
          do
          {
            *(_DWORD *)(v282 + 4 * *((unsigned int *)v283 + 4)) = v280;
            v283 = (uint64_t **)*v283;
          }
          while (v283);
          do
          {
            v284 = (void *)*v281;
            operator delete(v281);
            v281 = v284;
          }
          while (v284);
        }
        *((void *)v276 + 21) = 0;
        uint64_t v285 = *((void *)v276 + 20);
        if (v285)
        {
          for (uint64_t k = 0; k != v285; ++k)
            *(void *)(*((void *)v276 + 19) + 8 * k) = 0;
        }
        *((void *)v276 + 22) = 0;
        if ((v280 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled) {
          [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v280];
        }
      }
    }
  }
}

uint64_t __128__AGXG17FamilyRayTracingGPUBuilder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __128__AGXG17FamilyRayTracingGPUBuilder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7
{
}

- (void)copyAndCompactAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  [(AGXG17FamilyRayTracingGPUBuilder *)self _beginVirtualSubstream];
  if (self->_progressBins)
  {
    unint64_t v7 = [a3 size];
    if (v7 >= [a4 size]) {
      id v8 = a4;
    }
    else {
      id v8 = a3;
    }
    unint64_t v9 = [v8 size];
    computeEncoder = self->_computeEncoder;
    progressBins = (float *)self->_progressBins;
    unint64_t v12 = *((unsigned __int16 *)progressBins + 20);
    if (v12 < 2)
    {
      unsigned __int16 v14 = 0;
    }
    else
    {
      uint64_t v13 = 0;
      unsigned __int16 v14 = 0;
      float v15 = progressBins[6];
      unint64_t v16 = v12 - 1;
      do
      {
        float v17 = progressBins[v13++ + 7];
        if (v17 < v15)
        {
          unsigned __int16 v14 = v13;
          float v15 = v17;
        }
      }
      while (v16 != v13);
    }
    float v18 = *progressBins + (float)(progressBins[1] * (float)v9);
    *((_WORD *)progressBins + 21) = v14;
    progressBins[11] = v18;
    [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:v14];
    unint64_t v19 = self->_progressBins;
    unint64_t v20 = [a3 buffer];
    uint64_t v21 = [a3 bufferOffset];
    uint64_t v22 = [a3 size];
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __96__AGXG17FamilyRayTracingGPUBuilder_copyAndCompactAccelerationStructure_toAccelerationStructure___block_invoke;
    v63[3] = &unk_26516F6A0;
    v63[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v19, v20, v21, v22, 0, (uint64_t)v63);
    unint64_t v23 = self->_progressBins;
    unint64_t v24 = [a4 buffer];
    uint64_t v25 = [a4 bufferOffset];
    uint64_t v26 = [a4 size];
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __96__AGXG17FamilyRayTracingGPUBuilder_copyAndCompactAccelerationStructure_toAccelerationStructure___block_invoke_2;
    v62[3] = &unk_26516F6A0;
    v62[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v23, v24, v25, v26, 1, (uint64_t)v62);
  }
  impl = (id *)self->_impl;
  {
    AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeCopyAndCompact(AGXG17FamilyRayTracingAccelerationStructure *,AGXG17FamilyRayTracingAccelerationStructure *)::enableMediumCompaction = 1;
  }
  if (!AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeCopyAndCompact(AGXG17FamilyRayTracingAccelerationStructure *,AGXG17FamilyRayTracingAccelerationStructure *)::enableMediumCompaction)
  {
    AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeCopy((uint64_t)impl, a3, a4);
    unint64_t v51 = (float *)self->_progressBins;
    if (!v51) {
      return;
    }
    goto LABEL_29;
  }
  uint64_t v28 = (void *)[a3 buffer];
  uint64_t v29 = [a3 bufferOffset];
  [v28 contents];
  uint64_t v30 = [v28 gpuAddress];
  [v28 length];
  uint64_t v31 = v30 + v29;
  [impl[1] useResource:v28 usage:1];
  uint64_t v32 = (void *)[a4 buffer];
  uint64_t v33 = [a4 bufferOffset];
  [v32 contents];
  uint64_t v34 = [v32 gpuAddress];
  [v32 length];
  uint64_t v35 = v34 + v33;
  [impl[1] useResource:v32 usage:2];
  uint64_t v36 = [a4 accelerationStructureUniqueIdentifier];
  if (*(_DWORD *)*MEMORY[0x263F4B1E8])
  {
    objc_msgSend((id)objc_msgSend(a3, "buffer"), "length");
    objc_msgSend((id)objc_msgSend(a4, "buffer"), "length");
    IOGPUDeviceTraceEvent();
  }
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  unsigned int v66 = 0;
  AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::allocateInline((uint64_t)&v64, (uint64_t)impl[1], 96, 1);
  uint64_t v37 = v64;
  uint64_t v38 = v65;
  uint64_t v39 = (uint64_t)v66;
  *(void *)(v64 + 88) = 0;
  *(_OWORD *)(v37 + 72) = 0u;
  *(_OWORD *)(v37 + 56) = 0u;
  *(_OWORD *)(v37 + 40) = 0u;
  uint64_t v40 = [a3 size];
  *(void *)uint64_t v37 = v31;
  *(void *)(v37 + 8) = v40;
  uint64_t v41 = [a4 size];
  *(void *)(v37 + 16) = v35;
  *(void *)(v37 + 24) = v41;
  *(void *)(v37 + 32) = v36;
  uint64_t v42 = *((void *)impl[1] + 11);
  *(void *)(v42 + 15624) = v38;
  *(void *)(*(void *)(v42 + 1936) + 632) = v38;
  *(void *)(v42 + 11752) = v39;
  *(void *)(v42 + 16624) |= 0x1000uLL;
  *(_DWORD *)(v42 + 16656) |= 1u;
  uint64_t v69 = 0;
  uint64_t v70 = 0;
  {
    {
    }
    {
    }
    if (shouldDumpOrVerifyBVHs(void)::once != -1) {
      dispatch_once(&shouldDumpOrVerifyBVHs(void)::once, &__block_literal_global_607);
    }
    AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeCopyAndCompact(AGXG17FamilyRayTracingAccelerationStructure *,AGXG17FamilyRayTracingAccelerationStructure *)::verify = 0;
  }
  if (AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeCopyAndCompact(AGXG17FamilyRayTracingAccelerationStructure *,AGXG17FamilyRayTracingAccelerationStructure *)::verify)
  {
    int v43 = (void *)[*impl newBufferWithLength:4718984 options:0];
    uint64_t v44 = (void *)[v43 contents];
    uint64_t v45 = [v43 gpuAddress];
    MTLResourceListAddResource();
    IOGPUResourceListAddResource();

    bzero(v44, 0x480188uLL);
    v44[1] = -1;
    uint64_t v46 = (void *)**((void **)impl[1] + 11);
    uint64_t v64 = MEMORY[0x263EF8330];
    uint64_t v65 = 3221225472;
    unsigned int v66 = ___ZN3AGX24RayTracingGPUBuilderGen1INS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE20encodeCopyAndCompactEP43AGXG17FamilyRayTracingAccelerationStructureS7__block_invoke;
    int v67 = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
    int v68 = v44;
    [v46 addCompletedHandler:&v64];
    uint64_t v69 = v45;
    LODWORD(v70) = 0;
    [impl[1] setBytes:&v69 length:16 atIndex:4];
    LODWORD(v70) = v70 + 1;
  }
  uint64_t v47 = *((void *)impl[1] + 11);
  unint64_t Pipeline = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 68, 0);
  uint64_t v49 = *(void *)(v47 + 1920);
  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v47, Pipeline);
  long long v73 = xmmword_242EA8590;
  uint64_t v74 = 1;
  int64x2_t v71 = vdupq_n_s64(1uLL);
  uint64_t v72 = 1;
  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelCommonImpl(v47, 0x16u, (uint64_t *)&v73, v71.i32);
  if (*(_DWORD *)(v47 + 1880) == 1) {
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::encodeBarrier(v47, 22);
  }
  if (v49) {
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon(v47, v49);
  }
  [impl[1] memoryBarrierWithScope:1];
  if (AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeCopyAndCompact(AGXG17FamilyRayTracingAccelerationStructure *,AGXG17FamilyRayTracingAccelerationStructure *)::verify)
  {
    [impl[1] setBytes:&v69 length:16 atIndex:4];
    LODWORD(v70) = v70 + 1;
  }
  unint64_t v50 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 67, 0);
  AGX::ComputeService<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsIndirectInternal(v47, 22, v50, v38 + 72, v39);
  unint64_t v51 = (float *)self->_progressBins;
  if (v51)
  {
LABEL_29:
    uint64_t v52 = *((unsigned __int16 *)v51 + 21);
    v51[v52 + 6] = v51[11] + v51[v52 + 6];
    v51[11] = 0.0;
    if (*((unsigned char *)v51 + 48))
    {
      uint64_t v53 = (uint64_t *)*((void *)v51 + 9);
      if (v53)
      {
        int v54 = *((_DWORD *)v51 + 35);
        do
        {
          *((_DWORD *)v53 + 8) = v54;
          *((_DWORD *)v53 + 9) = v52;
          uint64_t v53 = (uint64_t *)*v53;
        }
        while (v53);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((void *)v51 + 12, (void *)v51 + 7);
      ++*((_DWORD *)v51 + 35);
    }
    else if (*((void *)v51 + 22))
    {
      uint64_t v55 = *((unsigned int *)v51 + 35);
      *((_DWORD *)v51 + 35) = v55 + 1;
      uint64_t v56 = (void *)*((void *)v51 + 21);
      if (v56)
      {
        uint64_t v57 = *((void *)v51 + 18);
        unint64_t v58 = (uint64_t **)*((void *)v51 + 21);
        do
        {
          *(_DWORD *)(v57 + 4 * *((unsigned int *)v58 + 4)) = v55;
          unint64_t v58 = (uint64_t **)*v58;
        }
        while (v58);
        do
        {
          unsigned int v59 = (void *)*v56;
          operator delete(v56);
          uint64_t v56 = v59;
        }
        while (v59);
      }
      *((void *)v51 + 21) = 0;
      uint64_t v60 = *((void *)v51 + 20);
      if (v60)
      {
        for (uint64_t i = 0; i != v60; ++i)
          *(void *)(*((void *)v51 + 19) + 8 * i) = 0;
      }
      *((void *)v51 + 22) = 0;
      if ((v55 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled) {
        [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v55];
      }
    }
  }
}

uint64_t __96__AGXG17FamilyRayTracingGPUBuilder_copyAndCompactAccelerationStructure_toAccelerationStructure___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __96__AGXG17FamilyRayTracingGPUBuilder_copyAndCompactAccelerationStructure_toAccelerationStructure___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

- (void)copyAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  [(AGXG17FamilyRayTracingGPUBuilder *)self _beginVirtualSubstream];
  if (self->_progressBins)
  {
    unint64_t v7 = [a3 size];
    if (v7 >= [a4 size]) {
      id v8 = a4;
    }
    else {
      id v8 = a3;
    }
    unint64_t v9 = [v8 size];
    computeEncoder = self->_computeEncoder;
    progressBins = (float *)self->_progressBins;
    unint64_t v12 = *((unsigned __int16 *)progressBins + 20);
    if (v12 < 2)
    {
      unsigned __int16 v14 = 0;
    }
    else
    {
      uint64_t v13 = 0;
      unsigned __int16 v14 = 0;
      float v15 = progressBins[6];
      unint64_t v16 = v12 - 1;
      do
      {
        float v17 = progressBins[v13++ + 7];
        if (v17 < v15)
        {
          unsigned __int16 v14 = v13;
          float v15 = v17;
        }
      }
      while (v16 != v13);
    }
    float v18 = *progressBins + (float)(progressBins[1] * (float)v9);
    *((_WORD *)progressBins + 21) = v14;
    progressBins[11] = v18;
    [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:v14];
    unint64_t v19 = self->_progressBins;
    unint64_t v20 = [a3 buffer];
    uint64_t v21 = [a3 bufferOffset];
    uint64_t v22 = [a3 size];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __86__AGXG17FamilyRayTracingGPUBuilder_copyAccelerationStructure_toAccelerationStructure___block_invoke;
    v39[3] = &unk_26516F6A0;
    v39[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v19, v20, v21, v22, 0, (uint64_t)v39);
    unint64_t v23 = self->_progressBins;
    unint64_t v24 = [a4 buffer];
    uint64_t v25 = [a4 bufferOffset];
    uint64_t v26 = [a4 size];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __86__AGXG17FamilyRayTracingGPUBuilder_copyAccelerationStructure_toAccelerationStructure___block_invoke_2;
    v38[3] = &unk_26516F6A0;
    v38[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v23, v24, v25, v26, 1, (uint64_t)v38);
  }
  AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeCopy((uint64_t)self->_impl, a3, a4);
  unint64_t v27 = (float *)self->_progressBins;
  if (v27)
  {
    uint64_t v28 = *((unsigned __int16 *)v27 + 21);
    v27[v28 + 6] = v27[11] + v27[v28 + 6];
    v27[11] = 0.0;
    if (*((unsigned char *)v27 + 48))
    {
      uint64_t v29 = (uint64_t *)*((void *)v27 + 9);
      if (v29)
      {
        int v30 = *((_DWORD *)v27 + 35);
        do
        {
          *((_DWORD *)v29 + 8) = v30;
          *((_DWORD *)v29 + 9) = v28;
          uint64_t v29 = (uint64_t *)*v29;
        }
        while (v29);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((void *)v27 + 12, (void *)v27 + 7);
      ++*((_DWORD *)v27 + 35);
    }
    else if (*((void *)v27 + 22))
    {
      uint64_t v31 = *((unsigned int *)v27 + 35);
      *((_DWORD *)v27 + 35) = v31 + 1;
      uint64_t v32 = (void *)*((void *)v27 + 21);
      if (v32)
      {
        uint64_t v33 = *((void *)v27 + 18);
        uint64_t v34 = (uint64_t **)*((void *)v27 + 21);
        do
        {
          *(_DWORD *)(v33 + 4 * *((unsigned int *)v34 + 4)) = v31;
          uint64_t v34 = (uint64_t **)*v34;
        }
        while (v34);
        do
        {
          uint64_t v35 = (void *)*v32;
          operator delete(v32);
          uint64_t v32 = v35;
        }
        while (v35);
      }
      *((void *)v27 + 21) = 0;
      uint64_t v36 = *((void *)v27 + 20);
      if (v36)
      {
        for (uint64_t i = 0; i != v36; ++i)
          *(void *)(*((void *)v27 + 19) + 8 * i) = 0;
      }
      *((void *)v27 + 22) = 0;
      if ((v31 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled) {
        [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v31];
      }
    }
  }
}

uint64_t __86__AGXG17FamilyRayTracingGPUBuilder_copyAccelerationStructure_toAccelerationStructure___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __86__AGXG17FamilyRayTracingGPUBuilder_copyAccelerationStructure_toAccelerationStructure___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5 sizeDataType:(unint64_t)a6
{
  [(AGXG17FamilyRayTracingGPUBuilder *)self _beginVirtualSubstream];
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    if (a6 == 33) {
      unint64_t v12 = 4;
    }
    else {
      unint64_t v12 = 8;
    }
    computeEncoder = self->_computeEncoder;
    unint64_t v14 = *((unsigned __int16 *)progressBins + 20);
    if (v14 < 2)
    {
      unsigned __int16 v16 = 0;
    }
    else
    {
      uint64_t v15 = 0;
      unsigned __int16 v16 = 0;
      float v17 = progressBins[6];
      unint64_t v18 = v14 - 1;
      do
      {
        float v19 = progressBins[v15++ + 7];
        if (v19 < v17)
        {
          unsigned __int16 v16 = v15;
          float v17 = v19;
        }
      }
      while (v18 != v15);
    }
    float v20 = *progressBins + (float)(progressBins[1] * (float)v12);
    *((_WORD *)progressBins + 21) = v16;
    progressBins[11] = v20;
    uint64_t v37 = v12;
    [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:v16];
    uint64_t v21 = self->_progressBins;
    unint64_t v22 = [a3 buffer];
    uint64_t v23 = [a3 bufferOffset];
    uint64_t v24 = [a3 size];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __105__AGXG17FamilyRayTracingGPUBuilder_writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType___block_invoke;
    v39[3] = &unk_26516F6A0;
    v39[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v21, v22, v23, v24, 0, (uint64_t)v39);
    uint64_t v25 = self->_progressBins;
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __105__AGXG17FamilyRayTracingGPUBuilder_writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType___block_invoke_2;
    v38[3] = &unk_26516F6A0;
    v38[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v25, (unint64_t)a4, a5, v37, 1, (uint64_t)v38);
  }
  AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeWriteCompactedSize((id *)self->_impl, a3, a4, a5, a6);
  uint64_t v26 = (float *)self->_progressBins;
  if (v26)
  {
    uint64_t v27 = *((unsigned __int16 *)v26 + 21);
    v26[v27 + 6] = v26[11] + v26[v27 + 6];
    v26[11] = 0.0;
    if (*((unsigned char *)v26 + 48))
    {
      uint64_t v28 = (uint64_t *)*((void *)v26 + 9);
      if (v28)
      {
        int v29 = *((_DWORD *)v26 + 35);
        do
        {
          *((_DWORD *)v28 + 8) = v29;
          *((_DWORD *)v28 + 9) = v27;
          uint64_t v28 = (uint64_t *)*v28;
        }
        while (v28);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((void *)v26 + 12, (void *)v26 + 7);
      ++*((_DWORD *)v26 + 35);
    }
    else if (*((void *)v26 + 22))
    {
      uint64_t v30 = *((unsigned int *)v26 + 35);
      *((_DWORD *)v26 + 35) = v30 + 1;
      uint64_t v31 = (void *)*((void *)v26 + 21);
      if (v31)
      {
        uint64_t v32 = *((void *)v26 + 18);
        uint64_t v33 = (uint64_t **)*((void *)v26 + 21);
        do
        {
          *(_DWORD *)(v32 + 4 * *((unsigned int *)v33 + 4)) = v30;
          uint64_t v33 = (uint64_t **)*v33;
        }
        while (v33);
        do
        {
          uint64_t v34 = (void *)*v31;
          operator delete(v31);
          uint64_t v31 = v34;
        }
        while (v34);
      }
      *((void *)v26 + 21) = 0;
      uint64_t v35 = *((void *)v26 + 20);
      if (v35)
      {
        for (uint64_t i = 0; i != v35; ++i)
          *(void *)(*((void *)v26 + 19) + 8 * i) = 0;
      }
      *((void *)v26 + 22) = 0;
      if ((v30 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled) {
        [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v30];
      }
    }
  }
}

uint64_t __105__AGXG17FamilyRayTracingGPUBuilder_writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __105__AGXG17FamilyRayTracingGPUBuilder_writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  [(AGXG17FamilyRayTracingGPUBuilder *)self _beginVirtualSubstream];
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    unint64_t v11 = *((unsigned __int16 *)progressBins + 20);
    if (v11 < 2)
    {
      unsigned __int16 v13 = 0;
    }
    else
    {
      uint64_t v12 = 0;
      unsigned __int16 v13 = 0;
      float v14 = progressBins[6];
      unint64_t v15 = v11 - 1;
      do
      {
        float v16 = progressBins[v12++ + 7];
        if (v16 < v14)
        {
          unsigned __int16 v13 = v12;
          float v14 = v16;
        }
      }
      while (v15 != v12);
    }
    float v17 = *progressBins + (float)(progressBins[1] * 8.0);
    *((_WORD *)progressBins + 21) = v13;
    progressBins[11] = v17;
    [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:v13];
    unint64_t v18 = self->_progressBins;
    unint64_t v19 = [a3 buffer];
    uint64_t v20 = [a3 bufferOffset];
    uint64_t v21 = [a3 size];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __92__AGXG17FamilyRayTracingGPUBuilder_writeCompactedAccelerationStructureSize_toBuffer_offset___block_invoke;
    v35[3] = &unk_26516F6A0;
    v35[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v18, v19, v20, v21, 0, (uint64_t)v35);
    unint64_t v22 = self->_progressBins;
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __92__AGXG17FamilyRayTracingGPUBuilder_writeCompactedAccelerationStructureSize_toBuffer_offset___block_invoke_2;
    v34[3] = &unk_26516F6A0;
    v34[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v22, (unint64_t)a4, a5, 4, 1, (uint64_t)v34);
  }
  AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeWriteCompactedSize((id *)self->_impl, a3, a4, a5, 33);
  uint64_t v23 = (float *)self->_progressBins;
  if (v23)
  {
    uint64_t v24 = *((unsigned __int16 *)v23 + 21);
    v23[v24 + 6] = v23[11] + v23[v24 + 6];
    v23[11] = 0.0;
    if (*((unsigned char *)v23 + 48))
    {
      uint64_t v25 = (uint64_t *)*((void *)v23 + 9);
      if (v25)
      {
        int v26 = *((_DWORD *)v23 + 35);
        do
        {
          *((_DWORD *)v25 + 8) = v26;
          *((_DWORD *)v25 + 9) = v24;
          uint64_t v25 = (uint64_t *)*v25;
        }
        while (v25);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((void *)v23 + 12, (void *)v23 + 7);
      ++*((_DWORD *)v23 + 35);
    }
    else if (*((void *)v23 + 22))
    {
      uint64_t v27 = *((unsigned int *)v23 + 35);
      *((_DWORD *)v23 + 35) = v27 + 1;
      uint64_t v28 = (void *)*((void *)v23 + 21);
      if (v28)
      {
        uint64_t v29 = *((void *)v23 + 18);
        uint64_t v30 = (uint64_t **)*((void *)v23 + 21);
        do
        {
          *(_DWORD *)(v29 + 4 * *((unsigned int *)v30 + 4)) = v27;
          uint64_t v30 = (uint64_t **)*v30;
        }
        while (v30);
        do
        {
          uint64_t v31 = (void *)*v28;
          operator delete(v28);
          uint64_t v28 = v31;
        }
        while (v31);
      }
      *((void *)v23 + 21) = 0;
      uint64_t v32 = *((void *)v23 + 20);
      if (v32)
      {
        for (uint64_t i = 0; i != v32; ++i)
          *(void *)(*((void *)v23 + 19) + 8 * i) = 0;
      }
      *((void *)v23 + 22) = 0;
      if ((v27 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled) {
        [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v27];
      }
    }
  }
}

uint64_t __92__AGXG17FamilyRayTracingGPUBuilder_writeCompactedAccelerationStructureSize_toBuffer_offset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __92__AGXG17FamilyRayTracingGPUBuilder_writeCompactedAccelerationStructureSize_toBuffer_offset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

- (void)buildAccelerationStructure:(id)a3 descriptor:(id)a4 scratchBuffer:(id)a5 scratchBufferOffset:(unint64_t)a6
{
  char v9 = [a4 isInstanceDescriptor];
  context = (void *)MEMORY[0x24566F2C0]();
  {
    -[AGXG17FamilyRayTracingGPUBuilder buildAccelerationStructure:descriptor:scratchBuffer:scratchBufferOffset:]::riaBvhGen = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getSelectedRiaBvhGen();
  }
  unint64_t BVHDescriptor = (void *)AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createBVHDescriptor(a4, 0, -[AGXG17FamilyRayTracingGPUBuilder buildAccelerationStructure:descriptor:scratchBuffer:scratchBufferOffset:]::riaBvhGen);
  uint64_t v240 = 0;
  LOBYTE(v233[0]) = 0;
  v233[1] = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::calcRiaBvhSize((unint64_t)BVHDescriptor, a4, -[AGXG17FamilyRayTracingGPUBuilder buildAccelerationStructure:descriptor:scratchBuffer:scratchBufferOffset:]::riaBvhGen, (unint64_t *)&v240);
  v233[2] = 0;
  long long v234 = 0u;
  long long v235 = 0u;
  long long v236 = 0u;
  long long v237 = 0u;
  long long v238 = 0u;
  long long v239 = 0u;
  v138[0] = 0;
  v138[1] = -1;
  v138[2] = -1;
  int v139 = 0;
  uint64_t v140 = 0;
  uint64_t v141 = -1;
  uint64_t v142 = -1;
  int v143 = 0;
  uint64_t v144 = 0;
  uint64_t v145 = -1;
  uint64_t v146 = -1;
  int v147 = 0;
  uint64_t v148 = 0;
  uint64_t v149 = -1;
  uint64_t v150 = -1;
  int v151 = 0;
  uint64_t v154 = -1;
  uint64_t v152 = 0;
  uint64_t v153 = -1;
  int v155 = 0;
  uint64_t v156 = 0;
  uint64_t v157 = -1;
  uint64_t v158 = -1;
  int v159 = 0;
  uint64_t v160 = 0;
  uint64_t v161 = -1;
  uint64_t v162 = -1;
  int v163 = 0;
  uint64_t v164 = 0;
  uint64_t v165 = -1;
  uint64_t v166 = -1;
  int v167 = 0;
  uint64_t v168 = 0;
  uint64_t v169 = -1;
  uint64_t v170 = -1;
  int v171 = 0;
  uint64_t v174 = -1;
  uint64_t v172 = 0;
  uint64_t v173 = -1;
  int v175 = 0;
  uint64_t v176 = 0;
  uint64_t v177 = -1;
  uint64_t v178 = -1;
  int v179 = 0;
  uint64_t v180 = 0;
  uint64_t v181 = -1;
  uint64_t v182 = -1;
  int v183 = 0;
  uint64_t v184 = 0;
  uint64_t v185 = -1;
  uint64_t v186 = -1;
  int v187 = 0;
  uint64_t v188 = 0;
  uint64_t v189 = -1;
  uint64_t v190 = -1;
  int v191 = 0;
  uint64_t v194 = -1;
  uint64_t v192 = 0;
  uint64_t v193 = -1;
  int v195 = 0;
  uint64_t v198 = -1;
  uint64_t v196 = 0;
  uint64_t v197 = -1;
  int v199 = 0;
  uint64_t v200 = 0;
  uint64_t v202 = -1;
  uint64_t v201 = -1;
  int v203 = 0;
  uint64_t v204 = 0;
  uint64_t v206 = -1;
  uint64_t v205 = -1;
  int v207 = 0;
  uint64_t v208 = 0;
  uint64_t v210 = -1;
  uint64_t v209 = -1;
  int v211 = 0;
  uint64_t v212 = 0;
  uint64_t v214 = -1;
  uint64_t v213 = -1;
  int v215 = 0;
  uint64_t v216 = 0;
  uint64_t v218 = -1;
  uint64_t v217 = -1;
  int v219 = 0;
  uint64_t v220 = 0;
  uint64_t v222 = -1;
  uint64_t v221 = -1;
  int v223 = 0;
  uint64_t v224 = 0;
  uint64_t v226 = -1;
  uint64_t v225 = -1;
  int v227 = 0;
  uint64_t v228 = 0;
  uint64_t v230 = -1;
  uint64_t v229 = -1;
  int v231 = 0;
  int v232 = 0;
  __dst[0] = 0;
  __dst[1] = -1;
  __dst[2] = -1;
  int v54 = 0;
  uint64_t v55 = 0;
  uint64_t v56 = -1;
  uint64_t v57 = -1;
  int v58 = 0;
  uint64_t v59 = 0;
  uint64_t v60 = -1;
  uint64_t v61 = -1;
  int v62 = 0;
  uint64_t v63 = 0;
  uint64_t v64 = -1;
  uint64_t v65 = -1;
  int v66 = 0;
  uint64_t v69 = -1;
  uint64_t v67 = 0;
  uint64_t v68 = -1;
  int v70 = 0;
  int v71 = 0;
  uint64_t v72 = 0;
  uint64_t v73 = -1;
  uint64_t v74 = -1;
  int v75 = 0;
  uint64_t v76 = 0;
  uint64_t v77 = -1;
  uint64_t v78 = -1;
  int v79 = 0;
  uint64_t v80 = 0;
  uint64_t v81 = -1;
  uint64_t v82 = -1;
  int v83 = 0;
  uint64_t v86 = -1;
  uint64_t v84 = 0;
  uint64_t v85 = -1;
  int v87 = 0;
  uint64_t v90 = -1;
  uint64_t v88 = 0;
  uint64_t v89 = -1;
  int v91 = 0;
  uint64_t v92 = 0;
  uint64_t v93 = -1;
  uint64_t v94 = -1;
  int v95 = 0;
  uint64_t v96 = 0;
  uint64_t v97 = -1;
  uint64_t v98 = -1;
  int v99 = 0;
  uint64_t v100 = 0;
  uint64_t v101 = -1;
  uint64_t v102 = -1;
  int v103 = 0;
  uint64_t v104 = 0;
  uint64_t v105 = -1;
  uint64_t v106 = -1;
  int v107 = 0;
  uint64_t v110 = -1;
  uint64_t v108 = 0;
  uint64_t v109 = -1;
  int v111 = 0;
  int v112 = 0;
  uint64_t v115 = -1;
  uint64_t v113 = 0;
  uint64_t v114 = -1;
  int v116 = 0;
  uint64_t v117 = 0;
  uint64_t v119 = -1;
  uint64_t v118 = -1;
  int v120 = 0;
  uint64_t v121 = 0;
  uint64_t v123 = -1;
  uint64_t v122 = -1;
  int v124 = 0;
  uint64_t v125 = 0;
  uint64_t v127 = -1;
  uint64_t v126 = -1;
  int v128 = 0;
  int v129 = 0;
  uint64_t v130 = 0;
  uint64_t v132 = -1;
  uint64_t v131 = -1;
  int v133 = 0;
  uint64_t v134 = 0;
  uint64_t v136 = -1;
  uint64_t v135 = -1;
  int v137 = 0;
  if ([BVHDescriptor buildAlgorithm] - 1 > 1)
  {
    AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::allocateTopDownScratch(__src, (uint64_t)self->_device, (unint64_t)BVHDescriptor, a4, v233, v240);
    unint64_t v11 = __dst;
    uint64_t v12 = __dst;
    size_t v13 = 696;
  }
  else
  {
    AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::allocatePLOCScratch(__src, (unint64_t)BVHDescriptor, v233);
    unint64_t v11 = v138;
    uint64_t v12 = v138;
    size_t v13 = 772;
  }
  memcpy(v12, __src, v13);
  unint64_t v14 = *((void *)&v235 + 1);
  if (*((void *)&v235 + 1) <= *((void *)&v236 + 1)) {
    unint64_t v14 = *((void *)&v236 + 1);
  }
  if (v14 <= *((void *)&v237 + 1)) {
    unint64_t v14 = *((void *)&v237 + 1);
  }
  if (v14 <= *((void *)&v238 + 1)) {
    unint64_t v15 = *((void *)&v238 + 1);
  }
  else {
    unint64_t v15 = v14;
  }
  char v16 = v9;
  if (v9)
  {
    [(AGXG17FamilyRayTracingGPUBuilder *)self _endVirtualSubstream];
  }
  else
  {
    uint64_t v17 = *((void *)&v239 + 1);
    [(AGXG17FamilyRayTracingGPUBuilder *)self _beginVirtualSubstream];
    progressBins = (float *)self->_progressBins;
    if (progressBins)
    {
      unint64_t v45 = v17 + ((v15 + 63) & 0xFFFFFFFFFFFFFFC0) + 64;
      computeEncoder = self->_computeEncoder;
      unint64_t PrimitiveCountFromDescriptor = ProgressBinsGetPrimitiveCountFromDescriptor((MTLAccelerationStructureDescriptor *)a4);
      float v21 = progressBins[2];
      float v22 = progressBins[3];
      unint64_t v23 = *((unsigned __int16 *)progressBins + 20);
      if (v23 < 2)
      {
        unsigned __int16 v25 = 0;
      }
      else
      {
        uint64_t v24 = 0;
        unsigned __int16 v25 = 0;
        float v26 = progressBins[6];
        unint64_t v27 = v23 - 1;
        do
        {
          float v28 = progressBins[v24++ + 7];
          if (v28 < v26)
          {
            unsigned __int16 v25 = v24;
            float v26 = v28;
          }
        }
        while (v27 != v24);
      }
      *((_WORD *)progressBins + 21) = v25;
      progressBins[11] = v21 + (float)(v22 * (float)PrimitiveCountFromDescriptor);
      -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v25, v45);
      uint64_t v29 = self->_progressBins;
      unint64_t v30 = [a3 buffer];
      uint64_t v31 = [a3 bufferOffset];
      uint64_t v32 = [a3 size];
      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = __108__AGXG17FamilyRayTracingGPUBuilder_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset___block_invoke;
      v51[3] = &unk_26516F6A0;
      v51[4] = self;
      ProgressBinsSynchronizeBufferAccessRange((uint64_t)v29, v30, v31, v32, 1, (uint64_t)v51);
      [(AGXG17FamilyRayTracingGPUBuilder *)self substreamSynchronizeDescriptor:a4 access:0];
      uint64_t v33 = self->_progressBins;
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __108__AGXG17FamilyRayTracingGPUBuilder_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset___block_invoke_2;
      v50[3] = &unk_26516F6A0;
      void v50[4] = self;
      ProgressBinsSynchronizeBufferAccessRange((uint64_t)v33, (unint64_t)a5, a6, v46, 1, (uint64_t)v50);
    }
  }
  AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeBuildAndEncodeRiaBvh((id *)self->_impl, (unint64_t)BVHDescriptor, (uint64_t)v233, (uint64_t)v11, a3, a4, a5, a6);
  if ((v16 & 1) == 0)
  {
    uint64_t v34 = (float *)self->_progressBins;
    if (v34)
    {
      uint64_t v35 = *((unsigned __int16 *)v34 + 21);
      v34[v35 + 6] = v34[11] + v34[v35 + 6];
      v34[11] = 0.0;
      if (*((unsigned char *)v34 + 48))
      {
        uint64_t v36 = (uint64_t *)*((void *)v34 + 9);
        if (v36)
        {
          int v37 = *((_DWORD *)v34 + 35);
          do
          {
            *((_DWORD *)v36 + 8) = v37;
            *((_DWORD *)v36 + 9) = v35;
            uint64_t v36 = (uint64_t *)*v36;
          }
          while (v36);
        }
        std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((void *)v34 + 12, (void *)v34 + 7);
        ++*((_DWORD *)v34 + 35);
      }
      else if (*((void *)v34 + 22))
      {
        uint64_t v38 = *((unsigned int *)v34 + 35);
        *((_DWORD *)v34 + 35) = v38 + 1;
        uint64_t v39 = (void *)*((void *)v34 + 21);
        if (v39)
        {
          uint64_t v40 = *((void *)v34 + 18);
          uint64_t v41 = (uint64_t **)*((void *)v34 + 21);
          do
          {
            *(_DWORD *)(v40 + 4 * *((unsigned int *)v41 + 4)) = v38;
            uint64_t v41 = (uint64_t **)*v41;
          }
          while (v41);
          do
          {
            uint64_t v42 = (void *)*v39;
            operator delete(v39);
            uint64_t v39 = v42;
          }
          while (v42);
        }
        *((void *)v34 + 21) = 0;
        uint64_t v43 = *((void *)v34 + 20);
        if (v43)
        {
          for (uint64_t i = 0; i != v43; ++i)
            *(void *)(*((void *)v34 + 19) + 8 * i) = 0;
        }
        *((void *)v34 + 22) = 0;
        if ((v38 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled) {
          [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v38];
        }
      }
    }
  }
}

uint64_t __108__AGXG17FamilyRayTracingGPUBuilder_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

uint64_t __108__AGXG17FamilyRayTracingGPUBuilder_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

- (void)setLabel:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AGXG17FamilyRayTracingGPUBuilder;
  -[_MTLObjectWithLabel setLabel:](&v5, sel_setLabel_);
  [(MTLComputeCommandEncoderSPI *)self->_computeEncoder setLabel:a3];
}

- (void)endEncoding
{
  self->_device = 0;
  self->_commandBuffer = 0;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)dealloc
{
  progressBins = self->_progressBins;
  if (progressBins)
  {
    uint64_t v4 = progressBins[18];
    if (v4) {
      MEMORY[0x24566ED70](v4, 0x1000C8052888210);
    }
    objc_super v5 = (void *)progressBins[21];
    if (v5)
    {
      do
      {
        uint64_t v6 = (void *)*v5;
        operator delete(v5);
        objc_super v5 = v6;
      }
      while (v6);
    }
    unint64_t v7 = (void *)progressBins[19];
    progressBins[19] = 0;
    if (v7) {
      operator delete(v7);
    }
    id v8 = (void *)progressBins[14];
    if (v8)
    {
      do
      {
        char v9 = (void *)*v8;
        operator delete(v8);
        id v8 = v9;
      }
      while (v9);
    }
    unint64_t v10 = (void *)progressBins[12];
    progressBins[12] = 0;
    if (v10) {
      operator delete(v10);
    }
    unint64_t v11 = (void *)progressBins[9];
    if (v11)
    {
      do
      {
        uint64_t v12 = (void *)*v11;
        operator delete(v11);
        unint64_t v11 = v12;
      }
      while (v12);
    }
    size_t v13 = (void *)progressBins[7];
    progressBins[7] = 0;
    if (v13) {
      operator delete(v13);
    }
    MEMORY[0x24566ED90](progressBins, 0x10B0C404C6F8B55);
  }

  impl = self->_impl;
  if (impl)
  {
    free(impl);
    self->_impl = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)AGXG17FamilyRayTracingGPUBuilder;
  [(_MTLCommandEncoder *)&v15 dealloc];
}

- (AGXG17FamilyRayTracingGPUBuilder)initWithCommandBuffer:(id)a3 descriptor:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v31.receiver = self;
  v31.super_class = (Class)AGXG17FamilyRayTracingGPUBuilder;
  uint64_t v6 = [(_MTLObjectWithLabel *)&v31 init];
  if (!v6) {
    return v6;
  }
  v6->_device = (MTLDevice *)(id)[a3 device];
  v6->_commandBuffer = (MTLCommandBuffer *)a3;
  unint64_t v7 = (void *)[a4 convertToComputePassDescriptor];
  if (objc_opt_respondsToSelector())
  {
    unsigned int v8 = [(MTLDevice *)v6->_device maximumComputeSubstreams];
    if (!a4) {
      goto LABEL_4;
    }
LABEL_7:
    int v9 = [a4 enableSubstreams] ^ 1;
    if (v8 < 2) {
      goto LABEL_10;
    }
LABEL_8:
    if ((v9 & 1) == 0) {
      operator new();
    }
    goto LABEL_10;
  }
  unsigned int v8 = 0;
  if (a4) {
    goto LABEL_7;
  }
LABEL_4:
  LOBYTE(v9) = 0;
  if (v8 >= 2) {
    goto LABEL_8;
  }
LABEL_10:
  if (v7)
  {
    v6->_computeEncoder = (MTLComputeCommandEncoderSPI *)(id)[a3 computeCommandEncoderWithDescriptor:v7];
  }
  else
  {
    v6->_computeEncoder = (MTLComputeCommandEncoderSPI *)(id)[(MTLCommandBuffer *)v6->_commandBuffer computeCommandEncoder];
  }
  unint64_t v10 = malloc_type_calloc(0x28uLL, 1uLL, 0x20789CCCuLL);
  unint64_t v11 = v10;
  v6->_impl = v10;
  if (v10)
  {
    device = v6->_device;
    computeEncoder = v6->_computeEncoder;
    *(void *)unint64_t v10 = device;
    *((void *)v10 + 1) = computeEncoder;
    *((void *)v10 + 2) = 0;
    *((void *)v10 + 3) = 0;
    v10[8] = 0;
    {
      AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride = 0;
    }
    unsigned int v14 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride;
    if (AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride <= 0) {
      unsigned int v14 = 2;
    }
    v11[8] = v14;
    unint64_t v15 = 0x268D57000uLL;
    if (v14 >= 2)
    {
      uint64_t v16 = *(void *)(*(void *)v11 + 808);
      explicit = (void *)atomic_load_explicit((atomic_ullong *volatile)(v16 + 7888), memory_order_acquire);
      if (!explicit)
      {
        unint64_t v18 = (os_unfair_lock_s *)(v16 + 7752);
        os_unfair_lock_lock((os_unfair_lock_t)(v16 + 7752));
        explicit = *(void **)(v16 + 7888);
        if (!explicit)
        {
          if (v11[8] < 2u)
          {
            explicit = 0;
          }
          else
          {
            long long v32 = xmmword_242EA8670;
            long long v33 = xmmword_242EA8680;
            long long v34 = xmmword_242EA8690;
            long long v35 = xmmword_242EA86A0;
            long long v36 = xmmword_242EA86B0;
            long long v37 = xmmword_242EA86C0;
            long long v38 = xmmword_242EA86D0;
            long long v39 = xmmword_242EA86E0;
            uint64_t v40 = 0x14F8000014ECLL;
            explicit = (void *)[*(id *)v11 newBufferWithLength:5380 options:0];
            uint64_t v19 = [explicit contents];
            uint64_t v20 = 0;
            long long v21 = v39;
            *(_OWORD *)(v19 + 96) = v38;
            *(_OWORD *)(v19 + 112) = v21;
            *(void *)(v19 + 128) = v40;
            long long v22 = v35;
            *(_OWORD *)(v19 + 32) = v34;
            *(_OWORD *)(v19 + 48) = v22;
            long long v23 = v37;
            *(_OWORD *)(v19 + 64) = v36;
            *(_OWORD *)(v19 + 80) = v23;
            long long v24 = v33;
            unsigned __int16 v25 = &dword_26516F460;
            *(_OWORD *)uint64_t v19 = v32;
            *(_OWORD *)(v19 + 16) = v24;
            do
            {
              float v26 = (const void *)*((void *)v25 - 1);
              unsigned int v27 = *v25;
              v25 += 4;
              memcpy((void *)(v19 + *((unsigned int *)&v32 + v20++)), v26, v27);
            }
            while (v20 != 34);
            unint64_t v18 = (os_unfair_lock_s *)(v16 + 7752);
            unint64_t v15 = 0x268D57000;
          }
          atomic_store((unint64_t)explicit, (unint64_t *)(v16 + 7888));
        }
        os_unfair_lock_unlock(v18);
      }
      *((void *)v11 + 2) = explicit;
    }
    uint64_t v28 = *(void *)((char *)device + *(int *)(v15 + 2064));
    uint64_t v29 = (BVHTopDownBuilder *)atomic_load_explicit((atomic_ullong *volatile)(v28 + 7896), memory_order_acquire);
    if (!v29)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v28 + 7756));
      uint64_t v29 = *(BVHTopDownBuilder **)(v28 + 7896);
      if (!v29)
      {
        uint64_t v29 = [[BVHTopDownBuilder alloc] initWithDevice:device];
        atomic_store((unint64_t)v29, (unint64_t *)(v28 + 7896));
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v28 + 7756));
    }
    *((void *)v11 + 3) = v29;
    *(unsigned char *)(*(void *)(*((void *)v11 + 1) + 88) + 1545) = 1;
  }
  else
  {

    return 0;
  }
  return v6;
}

- (void)substreamSynchronizeAccelerationStructures:(id)a3 access:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(a3);
        }
        unint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        progressBins = self->_progressBins;
        unint64_t v12 = [v10 buffer];
        uint64_t v13 = [v10 bufferOffset];
        uint64_t v14 = [v10 size];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __86__AGXG17FamilyRayTracingGPUBuilder_substreamSynchronizeAccelerationStructures_access___block_invoke;
        v16[3] = &unk_26516F6A0;
        v16[4] = self;
        ProgressBinsSynchronizeBufferAccessRange((uint64_t)progressBins, v12, v13, v14, a4, (uint64_t)v16);
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
}

uint64_t __86__AGXG17FamilyRayTracingGPUBuilder_substreamSynchronizeAccelerationStructures_access___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  objc_super v5 = *(void **)(v4 + 112);
  if (*(unsigned char *)(v4 + 128))
  {
    objc_msgSend(v5, "setSubstream:");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v6 waitForVirtualSubstream:v2];
  }
  else
  {
    return [v5 waitForProgress:a2];
  }
}

- (void)substreamSynchronizeDescriptor:(id)a3 access:(unint64_t)a4
{
  uint64_t v7 = objc_opt_class();
  if ([v7 isSubclassOfClass:objc_opt_class()])
  {
    if ((unint64_t)([a3 instanceDescriptorType] - 3) > 1)
    {
      uint64_t v18 = [a3 instancedAccelerationStructures];
      [(AGXG17FamilyRayTracingGPUBuilder *)self substreamSynchronizeAccelerationStructures:v18 access:a4];
      return;
    }
    progressBins = self->_progressBins;
    if (!progressBins) {
      return;
    }
    computeEncoder = self->_computeEncoder;
    if (!*((unsigned char *)progressBins + 48))
    {
      uint64_t v10 = *((unsigned __int16 *)progressBins + 21);
      uint64_t v11 = progressBins[35];
      progressBins[35] = v11 + 1;
      [(MTLComputeCommandEncoderSPI *)computeEncoder signalProgress:v11];
      if (*((_WORD *)progressBins + 20))
      {
        uint64_t v12 = 0;
        do
        {
          [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:v12];
          [(MTLComputeCommandEncoderSPI *)computeEncoder waitForProgress:v11];
          uint64_t v12 = (v12 + 1);
        }
        while (v12 < *((unsigned __int16 *)progressBins + 20));
      }
      [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:v10];
      if (*((void *)progressBins + 22))
      {
        uint64_t v13 = (void *)*((void *)progressBins + 21);
        if (v13)
        {
          do
          {
            uint64_t v14 = (void *)*v13;
            operator delete(v13);
            uint64_t v13 = v14;
          }
          while (v14);
        }
        *((void *)progressBins + 21) = 0;
        uint64_t v15 = *((void *)progressBins + 20);
        if (v15)
        {
          for (uint64_t i = 0; i != v15; ++i)
            *(void *)(*((void *)progressBins + 19) + 8 * i) = 0;
        }
LABEL_33:
        *((void *)progressBins + 22) = 0;
        return;
      }
      return;
    }
LABEL_18:
    [(MTLComputeCommandEncoderSPI *)computeEncoder endVirtualSubstream];
    [(MTLComputeCommandEncoderSPI *)computeEncoder beginVirtualSubstream];
    return;
  }
  long long v17 = objc_opt_class();
  if (![v17 isSubclassOfClass:objc_opt_class()]) {
    return;
  }
  progressBins = self->_progressBins;
  if (!progressBins) {
    return;
  }
  computeEncoder = self->_computeEncoder;
  if (*((unsigned char *)progressBins + 48)) {
    goto LABEL_18;
  }
  uint64_t v19 = *((unsigned __int16 *)progressBins + 21);
  uint64_t v20 = progressBins[35];
  progressBins[35] = v20 + 1;
  [(MTLComputeCommandEncoderSPI *)computeEncoder signalProgress:v20];
  if (*((_WORD *)progressBins + 20))
  {
    uint64_t v21 = 0;
    do
    {
      [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:v21];
      [(MTLComputeCommandEncoderSPI *)computeEncoder waitForProgress:v20];
      uint64_t v21 = (v21 + 1);
    }
    while (v21 < *((unsigned __int16 *)progressBins + 20));
  }
  [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:v19];
  if (*((void *)progressBins + 22))
  {
    uint64_t v22 = (void *)*((void *)progressBins + 21);
    if (v22)
    {
      do
      {
        long long v23 = (void *)*v22;
        operator delete(v22);
        uint64_t v22 = v23;
      }
      while (v23);
    }
    *((void *)progressBins + 21) = 0;
    uint64_t v24 = *((void *)progressBins + 20);
    if (v24)
    {
      for (uint64_t j = 0; j != v24; ++j)
        *(void *)(*((void *)progressBins + 19) + 8 * j) = 0;
    }
    goto LABEL_33;
  }
}

- (unint64_t)globalTraceObjectID
{
  return [(MTLComputeCommandEncoderSPI *)self->_computeEncoder globalTraceObjectID];
}

@end