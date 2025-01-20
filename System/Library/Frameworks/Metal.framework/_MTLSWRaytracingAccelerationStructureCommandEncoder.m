@interface _MTLSWRaytracingAccelerationStructureCommandEncoder
- (BOOL)isSupportedVersion:(unint64_t)a3;
- (BOOL)writeGenericBVHStructureOfAccelerationStructure:(id)a3 into:(id)a4;
- (BOOL)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 into:(id)a4;
- (MTLDevice)device;
- (_MTLSWRaytracingAccelerationStructureCommandEncoder)initWithCommandBuffer:(id)a3;
- (_MTLSWRaytracingAccelerationStructureCommandEncoder)initWithCommandBuffer:(id)a3 descriptor:(id)a4;
- (id)commandBuffer;
- (id)endEncodingAndRetrieveProgramAddressTable;
- (unint64_t)globalTraceObjectID;
- (void)beginBVHSubstream;
- (void)buildAccelerationStructure:(id)a3 descriptor:(id)a4 scratchBuffer:(id)a5 scratchBufferOffset:(unint64_t)a6;
- (void)copyAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4;
- (void)copyAndCompactAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4;
- (void)dealloc;
- (void)deserializeAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)deserializeAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6;
- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6;
- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6 withDescriptor:(id)a7;
- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 withDescriptor:(id)a6;
- (void)endBVHSubstream;
- (void)endEncoding;
- (void)insertDebugSignpost:(id)a3;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7;
- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7 options:(unint64_t)a8;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)serializeAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
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
- (void)writeDeserializedPrimitiveAccelerationStructureSizes:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizesBufferOffset:(unint64_t)a6;
- (void)writeGenericBVHStructureOfAccelerationStructure:(id)a3 headerBuffer:(id)a4 headerBufferOffset:(unint64_t)a5 innerNodeBuffer:(id)a6 innerNodeBufferOffset:(unint64_t)a7 leafNodeBuffer:(id)a8 leafNodeBufferOffset:(unint64_t)a9 primitiveBuffer:(id)a10 primitiveBufferOffset:(unint64_t)a11 geometryBuffer:(id)a12 geometryOffset:(unint64_t)a13 instanceTransformBuffer:(id)a14 instanceTransformOffset:(unint64_t)a15 controlPointBuffer:(id)a16 controlPointBufferOffset:(unint64_t)a17;
- (void)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizesBufferOffset:(unint64_t)a5;
- (void)writeGeometryOfAccelerationStructure:(id)a3 toBuffer:(id)a4 geometryBufferOffset:(unint64_t)a5;
- (void)writeGeometrySizeOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5;
- (void)writeSerializedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5;
@end

@implementation _MTLSWRaytracingAccelerationStructureCommandEncoder

- (void)writeSerializedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
  progressBins = self->_progressBins;
  if (progressBins)
  {
    [(MTLComputeCommandEncoderSPI *)self->_computeEncoder setSubstream:MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, 8uLL)];
    v10 = self->_progressBins;
    v11 = (void *)[a3 buffer];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __122___MTLSWRaytracingAccelerationStructureCommandEncoder_writeSerializedAccelerationStructureSize_toBuffer_sizeBufferOffset___block_invoke;
    v16[3] = &unk_1E5220B78;
    v16[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 0, (uint64_t)v16);
    v12 = self->_progressBins;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __122___MTLSWRaytracingAccelerationStructureCommandEncoder_writeSerializedAccelerationStructureSize_toBuffer_sizeBufferOffset___block_invoke_2;
    v15[3] = &unk_1E5220B78;
    v15[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, a4, 1, (uint64_t)v15);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeSerializedMTLSWBVHSizeWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:sizeBufferOffset:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5);
  v13 = self->_progressBins;
  if (v13)
  {
    uint64_t v14 = MTLProgressBinsUpdate((uint64_t)v13);
    if ((v14 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v14];
    }
  }
}

- (_MTLSWRaytracingAccelerationStructureCommandEncoder)initWithCommandBuffer:(id)a3 descriptor:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_MTLSWRaytracingAccelerationStructureCommandEncoder;
  v6 = [(_MTLObjectWithLabel *)&v10 init];
  if (v6)
  {
    v6->_device = (MTLDevice *)(id)[a3 device];
    v6->_commandBuffer = (MTLCommandBuffer *)a3;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88___MTLSWRaytracingAccelerationStructureCommandEncoder_initWithCommandBuffer_descriptor___block_invoke;
    block[3] = &unk_1E521F9E8;
    block[4] = v6;
    if (-[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:descriptor:]::onceToken != -1) {
      dispatch_once(&-[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:descriptor:]::onceToken, block);
    }
    if (-[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:descriptor:]::numSubstreams >= 2
      && [a4 enableSubstreams])
    {
      MTLProgressBinsMake();
    }
    v7 = (void *)[a4 convertToComputePassDescriptorWithConcurrentDispatch:-[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:descriptor:]::useConcurrentDispatch];
    v6->_computeEncoder = (MTLComputeCommandEncoderSPI *)(id)[(MTLCommandBuffer *)v6->_commandBuffer computeCommandEncoderWithDescriptor:v7];
  }
  return v6;
}

- (void)writeDeserializedPrimitiveAccelerationStructureSizes:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizesBufferOffset:(unint64_t)a6
{
  [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
  progressBins = self->_progressBins;
  if (progressBins)
  {
    [(MTLComputeCommandEncoderSPI *)self->_computeEncoder setSubstream:MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, 8uLL)];
    v12 = self->_progressBins;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __152___MTLSWRaytracingAccelerationStructureCommandEncoder_writeDeserializedPrimitiveAccelerationStructureSizes_serializedOffset_toBuffer_sizesBufferOffset___block_invoke;
    v17[3] = &unk_1E5220B78;
    v17[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, a3, 0, (uint64_t)v17);
    v13 = self->_progressBins;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __152___MTLSWRaytracingAccelerationStructureCommandEncoder_writeDeserializedPrimitiveAccelerationStructureSizes_serializedOffset_toBuffer_sizesBufferOffset___block_invoke_2;
    v16[3] = &unk_1E5220B78;
    v16[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v13, a5, 1, (uint64_t)v16);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeDeserializedMTLSWPrimitiveBVHSizesWithEncoder:serializedBuffer:serializedBufferOffset:toBuffer:sizesBufferOffset:", self->_computeEncoder, a3, a4, a5, a6);
  uint64_t v14 = self->_progressBins;
  if (v14)
  {
    uint64_t v15 = MTLProgressBinsUpdate((uint64_t)v14);
    if ((v15 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v15];
    }
  }
}

- (void)writeGeometrySizeOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, [a3 size]));
    objc_super v10 = self->_progressBins;
    v11 = (void *)[a3 buffer];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __122___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGeometrySizeOfAccelerationStructure_toBuffer_sizeBufferOffset___block_invoke;
    v16[3] = &unk_1E5220B78;
    v16[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 0, (uint64_t)v16);
    v12 = self->_progressBins;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __122___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGeometrySizeOfAccelerationStructure_toBuffer_sizeBufferOffset___block_invoke_2;
    v15[3] = &unk_1E5220B78;
    v15[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, a4, 1, (uint64_t)v15);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeSerializedGeometrySizeWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:sizeBufferOffset:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5);
  v13 = self->_progressBins;
  if (v13)
  {
    uint64_t v14 = MTLProgressBinsUpdate((uint64_t)v13);
    if ((v14 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v14];
    }
  }
}

- (void)substreamSynchronizeDescriptor:(id)a3 access:(unint64_t)a4
{
  v7 = objc_opt_class();
  if ([v7 isSubclassOfClass:objc_opt_class()])
  {
    if ((unint64_t)([a3 instanceDescriptorType] - 3) > 1)
    {
      uint64_t v8 = [a3 instancedAccelerationStructures];
      [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self substreamSynchronizeAccelerationStructures:v8 access:a4];
      return;
    }
  }
  else
  {
    v9 = objc_opt_class();
    if (![v9 isSubclassOfClass:objc_opt_class()]) {
      return;
    }
  }
  progressBins = self->_progressBins;
  computeEncoder = self->_computeEncoder;

  MTLProgressBinsForceBarrier(progressBins, computeEncoder);
}

- (void)substreamSynchronizeAccelerationStructures:(id)a3 access:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(a3);
        }
        progressBins = self->_progressBins;
        v11 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v9) buffer];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __105___MTLSWRaytracingAccelerationStructureCommandEncoder_substreamSynchronizeAccelerationStructures_access___block_invoke;
        v13[3] = &unk_1E5220B78;
        v13[4] = self;
        MTLProgressBinsSynchronizeBufferAccess((uint64_t)progressBins, v11, a4, (uint64_t)v13);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)beginBVHSubstream
{
  if (self->_virtualSubstreamsEnabled)
  {
    BOOL virtualSubstreamOpen = self->_virtualSubstreamOpen;
    computeEncoder = self->_computeEncoder;
    if (virtualSubstreamOpen)
    {
      [(MTLComputeCommandEncoderSPI *)computeEncoder nextVirtualSubstream];
    }
    else
    {
      [(MTLComputeCommandEncoderSPI *)computeEncoder beginVirtualSubstream];
      self->_BOOL virtualSubstreamOpen = 1;
    }
  }
}

- (void)endBVHSubstream
{
  if (self->_virtualSubstreamOpen)
  {
    [(MTLComputeCommandEncoderSPI *)self->_computeEncoder endVirtualSubstream];
    self->_BOOL virtualSubstreamOpen = 0;
    progressBins = self->_progressBins;
    if (progressBins)
    {
      std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear((void *)progressBins + 12);
      *((void *)progressBins + 3) = 0;
      *((void *)progressBins + 4) = 0;
      *((_WORD *)progressBins + 21) = 0;
      *((_DWORD *)progressBins + 35) = 0;
    }
  }
}

- (_MTLSWRaytracingAccelerationStructureCommandEncoder)initWithCommandBuffer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_MTLSWRaytracingAccelerationStructureCommandEncoder;
  v4 = [(_MTLObjectWithLabel *)&v9 init];
  if (v4)
  {
    v4->_device = (MTLDevice *)(id)[a3 device];
    v4->_commandBuffer = (MTLCommandBuffer *)a3;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77___MTLSWRaytracingAccelerationStructureCommandEncoder_initWithCommandBuffer___block_invoke;
    block[3] = &unk_1E521F9E8;
    block[4] = v4;
    if (-[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:]::onceToken != -1) {
      dispatch_once(&-[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:]::onceToken, block);
    }
    v5 = objc_alloc_init(MTLComputePassDescriptor);
    uint64_t v6 = v5;
    if (-[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:]::useConcurrentDispatch) {
      [(MTLComputePassDescriptor *)v5 setDispatchType:1];
    }
    if (-[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:]::numSubstreams >= 2) {
      MTLProgressBinsMake();
    }
    v4->_computeEncoder = (MTLComputeCommandEncoderSPI *)(id)[a3 computeCommandEncoderWithDescriptor:v6];
  }
  return v4;
}

- (unint64_t)globalTraceObjectID
{
  return [(MTLComputeCommandEncoderSPI *)self->_computeEncoder globalTraceObjectID];
}

- (MTLDevice)device
{
  return self->_device;
}

- (id)commandBuffer
{
  return self->_commandBuffer;
}

- (void)dealloc
{
  progressBins = self->_progressBins;
  if (progressBins)
  {
    MTLAccelerationStructureCommandProgressBinsInternal::~MTLAccelerationStructureCommandProgressBinsInternal((MTLAccelerationStructureCommandProgressBinsInternal *)progressBins);
    MEMORY[0x18530C140]();
  }

  v4.receiver = self;
  v4.super_class = (Class)_MTLSWRaytracingAccelerationStructureCommandEncoder;
  [(_MTLObjectWithLabel *)&v4 dealloc];
}

- (void)endEncoding
{
  self->_device = 0;
  self->_commandBuffer = 0;
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  v3 = (void *)[(MTLComputeCommandEncoderSPI *)self->_computeEncoder endEncodingAndRetrieveProgramAddressTable];

  self->_device = 0;
  self->_commandBuffer = 0;
  return v3;
}

- (void)setLabel:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_MTLSWRaytracingAccelerationStructureCommandEncoder;
  -[_MTLObjectWithLabel setLabel:](&v5, sel_setLabel_);
  [(MTLComputeCommandEncoderSPI *)self->_computeEncoder setLabel:a3];
}

- (void)buildAccelerationStructure:(id)a3 descriptor:(id)a4 scratchBuffer:(id)a5 scratchBufferOffset:(unint64_t)a6
{
  char v10 = [a4 isInstanceDescriptor];
  if (v10)
  {
    uint64_t v11 = [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self endBVHSubstream];
  }
  else
  {
    uint64_t v11 = [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
    progressBins = self->_progressBins;
    if (progressBins)
    {
      computeEncoder = self->_computeEncoder;
      unint64_t PrimitiveCountFromDescriptor = MTLProgressBinsGetPrimitiveCountFromDescriptor((MTLAccelerationStructureDescriptor *)a4);
      [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:MTLProgressBinsSelectSubstreamWithPrimitiveCount((uint64_t)progressBins, 0, PrimitiveCountFromDescriptor)];
      long long v15 = self->_progressBins;
      long long v16 = (void *)[a3 buffer];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __127___MTLSWRaytracingAccelerationStructureCommandEncoder_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset___block_invoke;
      v46[3] = &unk_1E5220B78;
      v46[4] = self;
      MTLProgressBinsSynchronizeBufferAccess((uint64_t)v15, v16, 1, (uint64_t)v46);
      [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self substreamSynchronizeDescriptor:a4 access:0];
      long long v17 = self->_progressBins;
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __127___MTLSWRaytracingAccelerationStructureCommandEncoder_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset___block_invoke_2;
      v45[3] = &unk_1E5220B78;
      v45[4] = self;
      uint64_t v11 = MTLProgressBinsSynchronizeBufferAccess((uint64_t)v17, a5, 1, (uint64_t)v45);
    }
  }
  uint64_t v18 = MEMORY[0x18530C9F0](v11);
  uint64_t v19 = objc_opt_class();
  char v43 = v10;
  id v40 = a3;
  v41 = (void *)v18;
  if ([v19 isSubclassOfClass:objc_opt_class()])
  {
    if ([a4 instanceDescriptorType] == 2 || objc_msgSend(a4, "instanceDescriptorType") == 4) {
      uint64_t v20 = 56 * [a4 instanceCount];
    }
    else {
      uint64_t v20 = 24 * [a4 instanceCount];
    }
  }
  else
  {
    v21 = objc_opt_class();
    if (![v21 isSubclassOfClass:objc_opt_class()])
    {
      uint64_t v20 = 0;
      id v24 = 0;
      goto LABEL_16;
    }
    uint64_t v22 = [a4 instanceDescriptorType];
    uint64_t v23 = [a4 maxInstanceCount];
    if (v22 == 4) {
      uint64_t v20 = 56 * v23;
    }
    else {
      uint64_t v20 = 24 * v23;
    }
  }
  id v24 = a4;
LABEL_16:
  context = (void *)MEMORY[0x18530C9F0]();
  v25 = MTLBVHDescriptorForMTLAccelerationStructureDescriptor(a4);
  v26 = (void *)[(MTLDevice *)self->_device GPUBVHBuilder];
  unint64_t v27 = [v26 getBuildScratchBufferSizeForDescriptor:v25];
  unint64_t v28 = [v26 getEncodeMTLSWBVHScratchBufferSizeForDescriptor:a4 bvhDescriptor:v25];
  if (v27 <= v28) {
    unint64_t v29 = v28;
  }
  else {
    unint64_t v29 = v27;
  }
  unint64_t v30 = (v29 + 255) & 0xFFFFFFFFFFFFFF00;
  unint64_t v31 = (v20 + v30 + 255) & 0xFFFFFFFFFFFFFF00;
  if (v24)
  {
    unint64_t v32 = v30 + a6;
    [v26 getMTLInstanceBoundingBoxesWithEncoder:self->_computeEncoder descriptor:v24 boundingBoxBuffer:a5 boundingBoxBufferOffset:v30 + a6];
    id v33 = [(NSArray *)[(MTLBVHDescriptor *)v25 geometryDescriptors] objectAtIndexedSubscript:0];
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v33, "boundingBoxBuffers"), "objectAtIndexedSubscript:", 0), "setBuffer:", a5);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v33, "boundingBoxBuffers"), "objectAtIndexedSubscript:", 0), "setOffset:", v32);
  }
  v34 = objc_opt_class();
  int v35 = [v34 isSubclassOfClass:objc_opt_class()];
  v36 = self->_computeEncoder;
  unint64_t v44 = v31 + a6;
  if (v35) {
    objc_msgSend(v26, "buildGenericBVHWithEncoder:descriptor:outputBuffer:outputBufferOffset:scratchBuffer:scratchBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:", v36, v25, a5, v44, a5, a6, objc_msgSend(a4, "instanceCountBuffer"), objc_msgSend(a4, "instanceCountBufferOffset"));
  }
  else {
    [v26 buildGenericBVHWithEncoder:v36 descriptor:v25 outputBuffer:a5 outputBufferOffset:v44 scratchBuffer:a5 scratchBufferOffset:a6];
  }
  objc_msgSend(v26, "encodeMTLSWBVHWithEncoder:descriptor:bvhDescriptor:outputBuffer:outputBufferOffset:genericBVHBuffer:genericBVHBufferOffset:scratchBuffer:scratchBufferOffset:gpuResourceID:accelerationStructureUniqueIdentifier:", self->_computeEncoder, a4, v25, objc_msgSend(v40, "buffer"), objc_msgSend(v40, "bufferOffset"), a5, v44, a5, a6, objc_msgSend(v40, "gpuResourceID"), objc_msgSend(v40, "accelerationStructureUniqueIdentifier"));
  if ((v43 & 1) == 0)
  {
    v37 = self->_progressBins;
    if (v37)
    {
      uint64_t v38 = MTLProgressBinsUpdate((uint64_t)v37);
      if ((v38 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
        [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v38];
      }
    }
  }
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
  progressBins = self->_progressBins;
  if (progressBins)
  {
    [(MTLComputeCommandEncoderSPI *)self->_computeEncoder setSubstream:MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, 8uLL)];
    char v10 = self->_progressBins;
    uint64_t v11 = (void *)[a3 buffer];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __111___MTLSWRaytracingAccelerationStructureCommandEncoder_writeCompactedAccelerationStructureSize_toBuffer_offset___block_invoke;
    v16[3] = &unk_1E5220B78;
    v16[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 0, (uint64_t)v16);
    v12 = self->_progressBins;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __111___MTLSWRaytracingAccelerationStructureCommandEncoder_writeCompactedAccelerationStructureSize_toBuffer_offset___block_invoke_2;
    v15[3] = &unk_1E5220B78;
    v15[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, a4, 1, (uint64_t)v15);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeCompactedMTLSWBVHSizeWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:sizeBufferOffset:sizeDataType:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5, 33);
  v13 = self->_progressBins;
  if (v13)
  {
    uint64_t v14 = MTLProgressBinsUpdate((uint64_t)v13);
    if ((v14 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v14];
    }
  }
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5 sizeDataType:(unint64_t)a6
{
  [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
  progressBins = self->_progressBins;
  if (progressBins)
  {
    [(MTLComputeCommandEncoderSPI *)self->_computeEncoder setSubstream:MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, 8uLL)];
    v12 = self->_progressBins;
    v13 = (void *)[a3 buffer];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __124___MTLSWRaytracingAccelerationStructureCommandEncoder_writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType___block_invoke;
    v18[3] = &unk_1E5220B78;
    v18[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, v13, 0, (uint64_t)v18);
    uint64_t v14 = self->_progressBins;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __124___MTLSWRaytracingAccelerationStructureCommandEncoder_writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType___block_invoke_2;
    v17[3] = &unk_1E5220B78;
    v17[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v14, a4, 1, (uint64_t)v17);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeCompactedMTLSWBVHSizeWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:sizeBufferOffset:sizeDataType:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5, a6);
  long long v15 = self->_progressBins;
  if (v15)
  {
    uint64_t v16 = MTLProgressBinsUpdate((uint64_t)v15);
    if ((v16 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v16];
    }
  }
}

- (void)copyAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, [a4 size] + objc_msgSend(a3, "size")));
    uint64_t v8 = self->_progressBins;
    objc_super v9 = (void *)[a3 buffer];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __105___MTLSWRaytracingAccelerationStructureCommandEncoder_copyAccelerationStructure_toAccelerationStructure___block_invoke;
    v15[3] = &unk_1E5220B78;
    v15[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v8, v9, 0, (uint64_t)v15);
    char v10 = self->_progressBins;
    uint64_t v11 = (void *)[a4 buffer];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __105___MTLSWRaytracingAccelerationStructureCommandEncoder_copyAccelerationStructure_toAccelerationStructure___block_invoke_2;
    v14[3] = &unk_1E5220B78;
    v14[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 1, (uint64_t)v14);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "copyMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), objc_msgSend(a4, "buffer"), objc_msgSend(a4, "bufferOffset"), objc_msgSend(a4, "gpuResourceID"), objc_msgSend(a4, "accelerationStructureUniqueIdentifier"));
  objc_msgSend(a4, "setDescriptor:", objc_msgSend(a3, "descriptor"));
  v12 = self->_progressBins;
  if (v12)
  {
    uint64_t v13 = MTLProgressBinsUpdate((uint64_t)v12);
    if ((v13 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v13];
    }
  }
}

- (void)copyAndCompactAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, [a4 size] + objc_msgSend(a3, "size")));
    uint64_t v8 = self->_progressBins;
    objc_super v9 = (void *)[a3 buffer];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __115___MTLSWRaytracingAccelerationStructureCommandEncoder_copyAndCompactAccelerationStructure_toAccelerationStructure___block_invoke;
    v15[3] = &unk_1E5220B78;
    v15[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v8, v9, 0, (uint64_t)v15);
    char v10 = self->_progressBins;
    uint64_t v11 = (void *)[a4 buffer];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __115___MTLSWRaytracingAccelerationStructureCommandEncoder_copyAndCompactAccelerationStructure_toAccelerationStructure___block_invoke_2;
    v14[3] = &unk_1E5220B78;
    v14[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 1, (uint64_t)v14);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "copyAndCompactMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), objc_msgSend(a4, "buffer"), objc_msgSend(a4, "bufferOffset"), objc_msgSend(a4, "gpuResourceID"), objc_msgSend(a4, "accelerationStructureUniqueIdentifier"));
  objc_msgSend(a4, "setDescriptor:", objc_msgSend(a3, "descriptor"));
  v12 = self->_progressBins;
  if (v12)
  {
    uint64_t v13 = MTLProgressBinsUpdate((uint64_t)v12);
    if ((v13 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v13];
    }
  }
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7
{
  uint64_t v12 = [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
  progressBins = self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    unint64_t PrimitiveCountFromDescriptor = MTLProgressBinsGetPrimitiveCountFromDescriptor((MTLAccelerationStructureDescriptor *)a4);
    [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:MTLProgressBinsSelectSubstreamWithPrimitiveCount((uint64_t)progressBins, 1, PrimitiveCountFromDescriptor)];
    uint64_t v16 = self->_progressBins;
    long long v17 = (void *)[a3 buffer];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __139___MTLSWRaytracingAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset___block_invoke;
    v27[3] = &unk_1E5220B78;
    v27[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v16, v17, 0, (uint64_t)v27);
    uint64_t v18 = self->_progressBins;
    uint64_t v19 = (void *)[a5 buffer];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __139___MTLSWRaytracingAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset___block_invoke_2;
    v26[3] = &unk_1E5220B78;
    v26[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v18, v19, 1, (uint64_t)v26);
    uint64_t v20 = self->_progressBins;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __139___MTLSWRaytracingAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset___block_invoke_3;
    v25[3] = &unk_1E5220B78;
    v25[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v20, a6, 1, (uint64_t)v25);
    uint64_t v12 = [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self substreamSynchronizeDescriptor:a4 access:0];
  }
  context = (void *)MEMORY[0x18530C9F0](v12);
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "refitMTLSWBVHWithEncoder:descriptor:bvhDescriptor:sourceBuffer:sourceBufferOffset:destinationBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:scratchBuffer:scratchBufferOffset:", self->_computeEncoder, a4, MTLBVHDescriptorForMTLAccelerationStructureDescriptor(a4), objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), objc_msgSend(a5, "buffer"), objc_msgSend(a5, "bufferOffset"), objc_msgSend(a5, "gpuResourceID"), objc_msgSend(a5, "accelerationStructureUniqueIdentifier"), a6, a7);
  v21 = self->_progressBins;
  if (v21)
  {
    uint64_t v22 = MTLProgressBinsUpdate((uint64_t)v21);
    if ((v22 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v22];
    }
  }
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7 options:(unint64_t)a8
{
  uint64_t v13 = [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
  progressBins = self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    unint64_t PrimitiveCountFromDescriptor = MTLProgressBinsGetPrimitiveCountFromDescriptor((MTLAccelerationStructureDescriptor *)a4);
    [(MTLComputeCommandEncoderSPI *)computeEncoder setSubstream:MTLProgressBinsSelectSubstreamWithPrimitiveCount((uint64_t)progressBins, 1, PrimitiveCountFromDescriptor)];
    long long v17 = self->_progressBins;
    uint64_t v18 = (void *)[a3 buffer];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __147___MTLSWRaytracingAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options___block_invoke;
    v29[3] = &unk_1E5220B78;
    v29[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v17, v18, 0, (uint64_t)v29);
    uint64_t v19 = self->_progressBins;
    uint64_t v20 = (void *)[a5 buffer];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __147___MTLSWRaytracingAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options___block_invoke_2;
    v28[3] = &unk_1E5220B78;
    v28[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v19, v20, 1, (uint64_t)v28);
    v21 = self->_progressBins;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __147___MTLSWRaytracingAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options___block_invoke_3;
    v27[3] = &unk_1E5220B78;
    v27[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v21, a6, 1, (uint64_t)v27);
    uint64_t v13 = [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self substreamSynchronizeDescriptor:a4 access:0];
  }
  context = (void *)MEMORY[0x18530C9F0](v13);
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "refitMTLSWBVHWithEncoder:descriptor:bvhDescriptor:sourceBuffer:sourceBufferOffset:destinationBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:scratchBuffer:scratchBufferOffset:options:", self->_computeEncoder, a4, MTLBVHDescriptorForMTLAccelerationStructureDescriptor(a4), objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), objc_msgSend(a5, "buffer"), objc_msgSend(a5, "bufferOffset"), objc_msgSend(a5, "gpuResourceID"), objc_msgSend(a5, "accelerationStructureUniqueIdentifier"), a6, a7, a8);
  uint64_t v22 = self->_progressBins;
  if (v22)
  {
    uint64_t v23 = MTLProgressBinsUpdate((uint64_t)v22);
    if ((v23 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v23];
    }
  }
}

- (void)writeDeserializedAccelerationStructureSize:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizeBufferOffset:(unint64_t)a6
{
  [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
  progressBins = self->_progressBins;
  if (progressBins)
  {
    [(MTLComputeCommandEncoderSPI *)self->_computeEncoder setSubstream:MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, 8uLL)];
    uint64_t v12 = self->_progressBins;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __141___MTLSWRaytracingAccelerationStructureCommandEncoder_writeDeserializedAccelerationStructureSize_serializedOffset_toBuffer_sizeBufferOffset___block_invoke;
    v17[3] = &unk_1E5220B78;
    v17[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, a3, 0, (uint64_t)v17);
    uint64_t v13 = self->_progressBins;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __141___MTLSWRaytracingAccelerationStructureCommandEncoder_writeDeserializedAccelerationStructureSize_serializedOffset_toBuffer_sizeBufferOffset___block_invoke_2;
    v16[3] = &unk_1E5220B78;
    v16[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v13, a5, 1, (uint64_t)v16);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeDeserializedMTLSWBVHSizeWithEncoder:serializedBuffer:serializedBufferOffset:toBuffer:sizeBufferOffset:", self->_computeEncoder, a3, a4, a5, a6);
  uint64_t v14 = self->_progressBins;
  if (v14)
  {
    uint64_t v15 = MTLProgressBinsUpdate((uint64_t)v14);
    if ((v15 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v15];
    }
  }
}

- (void)serializePrimitiveAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, [a3 size]));
    char v10 = self->_progressBins;
    uint64_t v11 = (void *)[a3 buffer];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __127___MTLSWRaytracingAccelerationStructureCommandEncoder_serializePrimitiveAccelerationStructure_toBuffer_serializedBufferOffset___block_invoke;
    v16[3] = &unk_1E5220B78;
    v16[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 0, (uint64_t)v16);
    uint64_t v12 = self->_progressBins;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __127___MTLSWRaytracingAccelerationStructureCommandEncoder_serializePrimitiveAccelerationStructure_toBuffer_serializedBufferOffset___block_invoke_2;
    v15[3] = &unk_1E5220B78;
    v15[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, a4, 1, (uint64_t)v15);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeSerializedMTLSWBVHWithEncoder:BVHBuffer:BVHBufferOffset:primitiveAccelerationStructures:toBuffer:serializedBufferOffset:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), 0, a4, a5);
  uint64_t v13 = self->_progressBins;
  if (v13)
  {
    uint64_t v14 = MTLProgressBinsUpdate((uint64_t)v13);
    if ((v14 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v14];
    }
  }
}

- (void)serializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 toBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, [a3 size]));
    uint64_t v12 = self->_progressBins;
    uint64_t v13 = (void *)[a3 buffer];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __158___MTLSWRaytracingAccelerationStructureCommandEncoder_serializeInstanceAccelerationStructure_primitiveAccelerationStructures_toBuffer_serializedBufferOffset___block_invoke;
    v18[3] = &unk_1E5220B78;
    v18[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, v13, 0, (uint64_t)v18);
    [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self substreamSynchronizeAccelerationStructures:a4 access:0];
    uint64_t v14 = self->_progressBins;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __158___MTLSWRaytracingAccelerationStructureCommandEncoder_serializeInstanceAccelerationStructure_primitiveAccelerationStructures_toBuffer_serializedBufferOffset___block_invoke_2;
    v17[3] = &unk_1E5220B78;
    v17[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v14, a5, 1, (uint64_t)v17);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeSerializedMTLSWBVHWithEncoder:BVHBuffer:BVHBufferOffset:primitiveAccelerationStructures:toBuffer:serializedBufferOffset:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5, a6);
  uint64_t v15 = self->_progressBins;
  if (v15)
  {
    uint64_t v16 = MTLProgressBinsUpdate((uint64_t)v15);
    if ((v16 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v16];
    }
  }
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, [a3 size]));
    char v10 = self->_progressBins;
    uint64_t v11 = (void *)[a3 buffer];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __131___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset___block_invoke;
    v17[3] = &unk_1E5220B78;
    v17[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 1, (uint64_t)v17);
    uint64_t v12 = self->_progressBins;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __131___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset___block_invoke_2;
    v16[3] = &unk_1E5220B78;
    v16[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, a4, 0, (uint64_t)v16);
  }
  uint64_t v13 = objc_opt_new();
  [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self deserializePrimitiveAccelerationStructure:a3 fromBuffer:a4 serializedBufferOffset:a5 withDescriptor:v13];

  uint64_t v14 = self->_progressBins;
  if (v14)
  {
    uint64_t v15 = MTLProgressBinsUpdate((uint64_t)v14);
    if ((v15 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v15];
    }
  }
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, [a3 size]));
    uint64_t v12 = self->_progressBins;
    uint64_t v13 = (void *)[a3 buffer];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __162___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset___block_invoke;
    v19[3] = &unk_1E5220B78;
    v19[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, v13, 1, (uint64_t)v19);
    [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self substreamSynchronizeAccelerationStructures:a4 access:0];
    uint64_t v14 = self->_progressBins;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __162___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset___block_invoke_2;
    v18[3] = &unk_1E5220B78;
    v18[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v14, a5, 0, (uint64_t)v18);
  }
  uint64_t v15 = objc_opt_new();
  [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self deserializeInstanceAccelerationStructure:a3 primitiveAccelerationStructures:a4 fromBuffer:a5 serializedBufferOffset:a6 withDescriptor:v15];

  uint64_t v16 = self->_progressBins;
  if (v16)
  {
    uint64_t v17 = MTLProgressBinsUpdate((uint64_t)v16);
    if ((v17 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v17];
    }
  }
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 withDescriptor:(id)a6
{
  [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, [a3 size]));
    char v10 = self->_progressBins;
    uint64_t v11 = (void *)[a3 buffer];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __146___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke;
    v17[3] = &unk_1E5220B78;
    v17[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 1, (uint64_t)v17);
    uint64_t v12 = self->_progressBins;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __146___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke_2;
    v16[3] = &unk_1E5220B78;
    v16[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, a4, 0, (uint64_t)v16);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeDeserializedMTLSWBVHWithEncoder:BVHBuffer:BVHBufferOffset:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:accelerationStructureMTLResourceID:accelerationStructureUniqueIdentifier:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), 0, a4, a5, objc_msgSend(a3, "gpuResourceID"), objc_msgSend(a3, "accelerationStructureUniqueIdentifier"));
  uint64_t v13 = self->_progressBins;
  if (v13)
  {
    uint64_t v14 = MTLProgressBinsUpdate((uint64_t)v13);
    if ((v14 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v14];
    }
  }
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6 withDescriptor:(id)a7
{
  [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, [a3 size]));
    uint64_t v12 = self->_progressBins;
    uint64_t v13 = (void *)[a3 buffer];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __177___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke;
    v19[3] = &unk_1E5220B78;
    v19[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, v13, 1, (uint64_t)v19);
    [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self substreamSynchronizeAccelerationStructures:a4 access:0];
    uint64_t v14 = self->_progressBins;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __177___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke_2;
    v18[3] = &unk_1E5220B78;
    v18[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v14, a5, 0, (uint64_t)v18);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeDeserializedMTLSWBVHWithEncoder:BVHBuffer:BVHBufferOffset:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:accelerationStructureMTLResourceID:accelerationStructureUniqueIdentifier:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5, a6, objc_msgSend(a3, "gpuResourceID"), objc_msgSend(a3, "accelerationStructureUniqueIdentifier"));
  uint64_t v15 = self->_progressBins;
  if (v15)
  {
    uint64_t v16 = MTLProgressBinsUpdate((uint64_t)v15);
    if ((v16 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v16];
    }
  }
}

- (void)serializeAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
}

- (void)deserializeAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
}

- (void)deserializeAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
}

- (void)writeGeometryOfAccelerationStructure:(id)a3 toBuffer:(id)a4 geometryBufferOffset:(unint64_t)a5
{
  [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, [a3 size]));
    char v10 = self->_progressBins;
    uint64_t v11 = (void *)[a3 buffer];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __122___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGeometryOfAccelerationStructure_toBuffer_geometryBufferOffset___block_invoke;
    v16[3] = &unk_1E5220B78;
    v16[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 0, (uint64_t)v16);
    uint64_t v12 = self->_progressBins;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __122___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGeometryOfAccelerationStructure_toBuffer_geometryBufferOffset___block_invoke_2;
    v15[3] = &unk_1E5220B78;
    v15[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, a4, 1, (uint64_t)v15);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeSerializedGeometryWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:geometryBufferOffset:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5);
  uint64_t v13 = self->_progressBins;
  if (v13)
  {
    uint64_t v14 = MTLProgressBinsUpdate((uint64_t)v13);
    if ((v14 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v14];
    }
  }
}

- (BOOL)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 into:(id)a4
{
  if (!a4) {
    return 0;
  }
  [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
  progressBins = self->_progressBins;
  if (progressBins)
  {
    [(MTLComputeCommandEncoderSPI *)self->_computeEncoder setSubstream:MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, 0x40uLL)];
    uint64_t v8 = self->_progressBins;
    objc_super v9 = (void *)[a3 buffer];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __113___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureSizesOfAccelerationStructure_into___block_invoke;
    v17[3] = &unk_1E5220B78;
    v17[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v8, v9, 0, (uint64_t)v17);
  }
  uint64_t v10 = [(MTLDevice *)self->_device newBufferWithLength:64 options:0];
  char v11 = objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeGenericBVHStructureSizesWithEncoder:version:BVHBuffer:BVHBufferOffset:toBuffer:sizesBufferOffset:", self->_computeEncoder, objc_msgSend(a4, "version"), objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), v10, 0);
  commandBuffer = self->_commandBuffer;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __113___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureSizesOfAccelerationStructure_into___block_invoke_2;
  v16[3] = &unk_1E5220BA0;
  v16[4] = v10;
  void v16[5] = a4;
  [(MTLCommandBuffer *)commandBuffer addCompletedHandler:v16];
  uint64_t v13 = self->_progressBins;
  if (v13)
  {
    uint64_t v14 = MTLProgressBinsUpdate((uint64_t)v13);
    if ((v14 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v14];
    }
  }
  return v11;
}

- (BOOL)isSupportedVersion:(unint64_t)a3
{
  return a3 - 256 < 5;
}

- (BOOL)writeGenericBVHStructureOfAccelerationStructure:(id)a3 into:(id)a4
{
  id v4 = a4;
  if (a4)
  {
    if (-[_MTLSWRaytracingAccelerationStructureCommandEncoder isSupportedVersion:](self, "isSupportedVersion:", [a4 version]))
    {
      [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
      progressBins = self->_progressBins;
      if (progressBins)
      {
        -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, [a3 size]));
        uint64_t v8 = self->_progressBins;
        objc_super v9 = (void *)[a3 buffer];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke;
        v37[3] = &unk_1E5220B78;
        v37[4] = self;
        MTLProgressBinsSynchronizeBufferAccess((uint64_t)v8, v9, 0, (uint64_t)v37);
        uint64_t v10 = self->_progressBins;
        char v11 = (void *)[v4 headerBuffer];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_2;
        v36[3] = &unk_1E5220B78;
        v36[4] = self;
        MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 1, (uint64_t)v36);
        if ([v4 innerNodeBuffer])
        {
          uint64_t v12 = self->_progressBins;
          uint64_t v13 = (void *)[v4 innerNodeBuffer];
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_3;
          v35[3] = &unk_1E5220B78;
          v35[4] = self;
          MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, v13, 1, (uint64_t)v35);
        }
        if ([v4 leafNodeBuffer])
        {
          uint64_t v14 = self->_progressBins;
          uint64_t v15 = (void *)[v4 leafNodeBuffer];
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_4;
          v34[3] = &unk_1E5220B78;
          v34[4] = self;
          MTLProgressBinsSynchronizeBufferAccess((uint64_t)v14, v15, 1, (uint64_t)v34);
        }
        if ([v4 primitiveBuffer])
        {
          uint64_t v16 = self->_progressBins;
          uint64_t v17 = (void *)[v4 primitiveBuffer];
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_5;
          v33[3] = &unk_1E5220B78;
          v33[4] = self;
          MTLProgressBinsSynchronizeBufferAccess((uint64_t)v16, v17, 1, (uint64_t)v33);
        }
        if ([v4 geometryBuffer])
        {
          uint64_t v18 = self->_progressBins;
          uint64_t v19 = (void *)[v4 geometryBuffer];
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_6;
          v32[3] = &unk_1E5220B78;
          v32[4] = self;
          MTLProgressBinsSynchronizeBufferAccess((uint64_t)v18, v19, 1, (uint64_t)v32);
        }
        if ([v4 instanceTransformBuffer])
        {
          uint64_t v20 = self->_progressBins;
          v21 = (void *)[v4 instanceTransformBuffer];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_7;
          v31[3] = &unk_1E5220B78;
          v31[4] = self;
          MTLProgressBinsSynchronizeBufferAccess((uint64_t)v20, v21, 1, (uint64_t)v31);
        }
        if ([v4 perPrimitiveDataBuffer])
        {
          uint64_t v22 = self->_progressBins;
          uint64_t v23 = (void *)[v4 perPrimitiveDataBuffer];
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_8;
          v30[3] = &unk_1E5220B78;
          v30[4] = self;
          MTLProgressBinsSynchronizeBufferAccess((uint64_t)v22, v23, 1, (uint64_t)v30);
        }
        if ([v4 controlPointBuffer])
        {
          id v24 = self->_progressBins;
          v25 = (void *)[v4 controlPointBuffer];
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_9;
          v29[3] = &unk_1E5220B78;
          v29[4] = self;
          MTLProgressBinsSynchronizeBufferAccess((uint64_t)v24, v25, 1, (uint64_t)v29);
        }
      }
      LOBYTE(v4) = objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeGenericBVHStructureWithEncoder:BVHBuffer:BVHBufferOffset:into:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), v4);
      v26 = self->_progressBins;
      if (v26)
      {
        uint64_t v27 = MTLProgressBinsUpdate((uint64_t)v26);
        if ((v27 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
          [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v27];
        }
      }
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return (char)v4;
}

- (void)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizesBufferOffset:(unint64_t)a5
{
  [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
  progressBins = self->_progressBins;
  if (progressBins)
  {
    [(MTLComputeCommandEncoderSPI *)self->_computeEncoder setSubstream:MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, 8uLL)];
    uint64_t v10 = self->_progressBins;
    char v11 = (void *)[a3 buffer];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __135___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureSizesOfAccelerationStructure_toBuffer_sizesBufferOffset___block_invoke;
    v16[3] = &unk_1E5220B78;
    v16[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 0, (uint64_t)v16);
    uint64_t v12 = self->_progressBins;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __135___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureSizesOfAccelerationStructure_toBuffer_sizesBufferOffset___block_invoke_2;
    v15[3] = &unk_1E5220B78;
    v15[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, a4, 1, (uint64_t)v15);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeGenericBVHStructureSizesWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:sizesBufferOffset:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5);
  uint64_t v13 = self->_progressBins;
  if (v13)
  {
    uint64_t v14 = MTLProgressBinsUpdate((uint64_t)v13);
    if ((v14 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v14];
    }
  }
}

- (void)writeGenericBVHStructureOfAccelerationStructure:(id)a3 headerBuffer:(id)a4 headerBufferOffset:(unint64_t)a5 innerNodeBuffer:(id)a6 innerNodeBufferOffset:(unint64_t)a7 leafNodeBuffer:(id)a8 leafNodeBufferOffset:(unint64_t)a9 primitiveBuffer:(id)a10 primitiveBufferOffset:(unint64_t)a11 geometryBuffer:(id)a12 geometryOffset:(unint64_t)a13 instanceTransformBuffer:(id)a14 instanceTransformOffset:(unint64_t)a15 controlPointBuffer:(id)a16 controlPointBufferOffset:(unint64_t)a17
{
  [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, [a3 size]));
    v21 = self->_progressBins;
    uint64_t v22 = (void *)[a3 buffer];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke;
    v43[3] = &unk_1E5220B78;
    v43[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v21, v22, 0, (uint64_t)v43);
    uint64_t v23 = self->_progressBins;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke_2;
    v42[3] = &unk_1E5220B78;
    v42[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v23, a4, 1, (uint64_t)v42);
    id v24 = self->_progressBins;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke_3;
    v41[3] = &unk_1E5220B78;
    v41[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v24, a6, 1, (uint64_t)v41);
    v25 = self->_progressBins;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke_4;
    v40[3] = &unk_1E5220B78;
    v40[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v25, a8, 1, (uint64_t)v40);
    v26 = self->_progressBins;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke_5;
    v39[3] = &unk_1E5220B78;
    v39[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v26, a10, 1, (uint64_t)v39);
    uint64_t v27 = self->_progressBins;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke_6;
    v38[3] = &unk_1E5220B78;
    v38[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v27, a12, 1, (uint64_t)v38);
    unint64_t v28 = self->_progressBins;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke_7;
    v37[3] = &unk_1E5220B78;
    v37[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v28, a14, 1, (uint64_t)v37);
    unint64_t v29 = self->_progressBins;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke_8;
    v36[3] = &unk_1E5220B78;
    v36[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v29, a16, 1, (uint64_t)v36);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeGenericBVHStructureWithEncoder:BVHBuffer:BVHBufferOffset:header:headerBufferOffset:innerNodes:innerNodeBufferOffset:leafNodes:leafNodeBufferOffset:primitives:primitiveBufferOffset:geometry:geometryOffset:instanceTransform:instanceTransformOffset:controlPoints:controlPointBufferOffset:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
    a16,
    a17);
  unint64_t v30 = self->_progressBins;
  if (v30)
  {
    uint64_t v31 = MTLProgressBinsUpdate((uint64_t)v30);
    if ((v31 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v31];
    }
  }
}

- (void)writeAccelerationStructureSerializationData:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  [(_MTLSWRaytracingAccelerationStructureCommandEncoder *)self beginBVHSubstream];
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, [a3 size]));
    uint64_t v10 = self->_progressBins;
    char v11 = (void *)[a3 buffer];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __115___MTLSWRaytracingAccelerationStructureCommandEncoder_writeAccelerationStructureSerializationData_toBuffer_offset___block_invoke;
    v16[3] = &unk_1E5220B78;
    v16[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 0, (uint64_t)v16);
    uint64_t v12 = self->_progressBins;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __115___MTLSWRaytracingAccelerationStructureCommandEncoder_writeAccelerationStructureSerializationData_toBuffer_offset___block_invoke_2;
    v15[3] = &unk_1E5220B78;
    v15[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, a4, 1, (uint64_t)v15);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeAccelerationStructureSerializationDataWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:offset:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5);
  uint64_t v13 = self->_progressBins;
  if (v13)
  {
    uint64_t v14 = MTLProgressBinsUpdate((uint64_t)v13);
    if ((v14 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v14];
    }
  }
}

- (void)insertDebugSignpost:(id)a3
{
}

- (void)popDebugGroup
{
}

- (void)pushDebugGroup:(id)a3
{
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
}

- (void)updateFence:(id)a3
{
}

- (void)useHeap:(id)a3
{
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
}

- (void)waitForFence:(id)a3
{
}

- (void)writeAccelerationStructureTraversalDepth:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  progressBins = self->_progressBins;
  if (progressBins)
  {
    [(MTLComputeCommandEncoderSPI *)self->_computeEncoder setSubstream:MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, 8uLL)];
    uint64_t v10 = self->_progressBins;
    char v11 = (void *)[a3 buffer];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __112___MTLSWRaytracingAccelerationStructureCommandEncoder_writeAccelerationStructureTraversalDepth_toBuffer_offset___block_invoke;
    v16[3] = &unk_1E5220B78;
    v16[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 0, (uint64_t)v16);
    uint64_t v12 = self->_progressBins;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __112___MTLSWRaytracingAccelerationStructureCommandEncoder_writeAccelerationStructureTraversalDepth_toBuffer_offset___block_invoke_2;
    v15[3] = &unk_1E5220B78;
    v15[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, a4, 1, (uint64_t)v15);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeMTLSWBVHAccelerationStructureDepthWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:sizeBufferOffset:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5);
  uint64_t v13 = self->_progressBins;
  if (v13)
  {
    uint64_t v14 = MTLProgressBinsUpdate((uint64_t)v13);
    if ((v14 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled) {
      [(MTLComputeCommandEncoderSPI *)self->_computeEncoder signalProgress:v14];
    }
  }
}

@end