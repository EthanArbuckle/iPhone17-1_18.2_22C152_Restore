@interface AGXG17FamilyRenderContext
- (AGXG17FamilyRenderContext)initWithCommandBuffer:(id)a3 descriptor:(id)a4;
- (AGXG17FamilyRenderContext)initWithCommandBuffer:(id)a3 descriptor:(id)a4 subEncoderIndex:(unint64_t)a5 framebuffer:(void *)a6;
- (AGXG17FamilyRenderContext)initWithCommandBuffer:(id)a3 dummyDescriptor:(id)a4;
- (BOOL)commandBatchIdRangeMin:(unsigned int *)a3 max:(unsigned int *)a4;
- (BOOL)isMemorylessRender;
- (BOOL)setMTLCounterSampleLocationWithBuffer:(id)a3 startIndex:(unsigned int)a4 endIndex:(unsigned int)a5 dm:(unsigned int)a6;
- (BOOL)setMTLCounterSampleLocationWithBuffer:(id)a3 vertexStartIndex:(unsigned int)a4 vertexEndIndex:(unsigned int)a5 fragmentStartIndex:(unsigned int)a6 fragmentEndIndex:(unsigned int)a7;
- (unint64_t)tileHeight;
- (unint64_t)tileWidth;
- (unsigned)commandBatchIdOffset;
- (void)addSplitHandler:(id)a3;
- (void)dealloc;
- (void)deferredEndEncoding:(id)a3;
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
- (void)drawMeshThreadgroups:(id *)a3;
- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6;
- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7;
- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9;
- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7;
- (void)endEncoding;
- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)filterCounterRangeWithFirstBatch:(unsigned int)a3 lastBatch:(unsigned int)a4 filterIndex:(unsigned int)a5;
- (void)getImpl;
- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6;
- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)setAlphaTestReferenceValue:(float)a3;
- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6;
- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 atIndex:(unint64_t)a7;
- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7 atIndex:(unint64_t)a8;
- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setCullMode:(unint64_t)a3;
- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5;
- (void)setDepthCleared;
- (void)setDepthClipMode:(unint64_t)a3;
- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6;
- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7;
- (void)setDepthStencilState:(id)a3;
- (void)setDepthStoreAction:(unint64_t)a3;
- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6;
- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setFrontFacingWinding:(unint64_t)a3;
- (void)setLineWidth:(float)a3;
- (void)setMeshAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setMeshBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setMeshBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setMeshBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setMeshIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setMeshIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setMeshSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setMeshSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setMeshSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setMeshSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setMeshTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setMeshTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setMeshVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setMeshVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setObjectAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setObjectBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setObjectBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setObjectIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setObjectSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setObjectSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setObjectSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setObjectSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setObjectTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setObjectTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setObjectVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setObjectVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setPointSize:(float)a3;
- (void)setPrimitiveRestartEnabled:(BOOL)a3;
- (void)setPrimitiveRestartEnabled:(BOOL)a3 index:(unint64_t)a4;
- (void)setProvokingVertexMode:(unint64_t)a3;
- (void)setRenderPipelineState:(id)a3;
- (void)setScissorRect:(id *)a3;
- (void)setScissorRects:(id *)a3 count:(unint64_t)a4;
- (void)setStencilCleared;
- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4;
- (void)setStencilReferenceValue:(unsigned int)a3;
- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6;
- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7;
- (void)setStencilStoreAction:(unint64_t)a3;
- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5;
- (void)setTessellationFactorScale:(float)a3;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setTileIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setTileIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setTileSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setTileSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setTileSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setTileSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setTileVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setTileVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setTriangleFillMode:(unint64_t)a3;
- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4;
- (void)setVertexAmplificationMode:(unint64_t)a3 value:(unint64_t)a4;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6;
- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVertexIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setViewport:(id *)a3;
- (void)setViewportTransformEnabled:(BOOL)a3;
- (void)setViewports:(id *)a3 count:(unint64_t)a4;
- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4;
- (void)updateFence:(id)a3 afterStages:(unint64_t)a4;
- (void)useHeap:(id)a3;
- (void)useHeap:(id)a3 stages:(unint64_t)a4;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5;
- (void)useResidencySet:(id)a3;
- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6;
- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4;
@end

@implementation AGXG17FamilyRenderContext

- (void)setMeshSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  unsigned int length = a6.length;
  unsigned int location = a6.location;
  impl = self->_impl;
  v12 = impl + 4569;
  uint64_t v13 = impl[4569];
  if (!v13)
  {
    uint64_t v19 = impl[4573];
    if (!v19)
    {
      uint64_t v13 = std::__throw_bad_function_call[abi:nn180100]();
      goto LABEL_4;
    }
    uint64_t v13 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v19 + 48))(v19, a2);
    uint64_t *v12 = v13;
  }
  v14 = a3;
  v15 = (unsigned int *)a4;
  v16 = (unsigned int *)a5;
  unsigned int v17 = location;
  unsigned int v18 = length;

LABEL_4:
  AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setMeshProgramSamplersWithLODOverrides(v13, (uint64_t)v14, v15, v16, v17, v18);
}

- (void)setMeshSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  unsigned int v6 = a6;
  impl = self->_impl;
  v11 = impl + 4569;
  uint64_t v12 = impl[4569];
  if (!v12)
  {
    uint64_t v17 = impl[4573];
    if (!v17)
    {
      uint64_t v12 = std::__throw_bad_function_call[abi:nn180100]();
      goto LABEL_4;
    }
    uint64_t v12 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v17 + 48))(v17, a2);
    uint64_t *v11 = v12;
  }
  id v13 = a3;
  float v14 = a4;
  float v15 = a5;
  unsigned int v16 = v6;

LABEL_4:
  AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setMeshProgramSamplerWithLODOverride(v12, (uint64_t)v13, v16, v14, v15);
}

- (void)setMeshSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  LODWORD(length_low) = a4.length;
  unsigned int location = a4.location;
  impl = self->_impl;
  v8 = impl + 4569;
  uint64_t v9 = impl[4569];
  if (v9)
  {
    uint64_t length_low = LODWORD(a4.length);
    if (LODWORD(a4.length))
    {
LABEL_3:
      uint64_t v10 = *(void *)(v9 + 8);
      for (unsigned int i = location; ; ++i)
      {
        id v13 = *a3;
        if (*(void *)(v10 + 1480)) {
          MTLResourceListAddResource();
        }
        uint64_t v14 = v13 ? v13[15] : 0;
        uint64_t v15 = 8 * i;
        *(void *)(*(void *)(v9 + 14464) + v15 + 9784) = v14;
        uint64_t v16 = *(void *)(v9 + 14464);
        if ((~*(void *)(v16 + v15 + 9784) & 0x6000000000000000) == 0) {
          break;
        }
        if (v13) {
          goto LABEL_5;
        }
        uint64_t v12 = 0;
LABEL_7:
        *(void *)(v9 + 8 * i + 22736) = v12;
        uint64_t v10 = *(void *)(v9 + 8);
        *(void *)(v10 + 90088 + 8 * (i > 0x3F) + 224) |= 1 << i;
        *(void *)(v10 + 90472) |= 0x4000000uLL;
        ++a3;
        if (!--length_low) {
          return;
        }
      }
      *(_OWORD *)(v16 + 16 * i + 9912) = *((_OWORD *)v13 + 8);
LABEL_5:
      uint64_t v12 = (char *)(v13 + 6);
      if (*((_DWORD *)v13 + 36)) {
        uint64_t v12 = (char *)*((unsigned int *)v13 + 36);
      }
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v17 = impl[4573];
    if (v17)
    {
      uint64_t v9 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v17 + 48))(v17, a2);
      uint64_t *v8 = v9;
      uint64_t length_low = length_low;
      if (length_low) {
        goto LABEL_3;
      }
    }
    else
    {
      unsigned int v18 = (AGXG17FamilyRenderContext *)std::__throw_bad_function_call[abi:nn180100]();
      [(AGXG17FamilyRenderContext *)v18 setMeshSamplerState:v20 atIndex:v21];
    }
  }
}

- (void)setMeshSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  impl = self->_impl;
  v7 = impl + 4569;
  uint64_t v8 = impl[4569];
  if (v8)
  {
LABEL_2:
    if (*(void *)(*(void *)(v8 + 8) + 1480)) {
      MTLResourceListAddResource();
    }
    if (a3) {
      uint64_t v9 = *((void *)a3 + 15);
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = 8 * v4;
    *(void *)(*(void *)(v8 + 14464) + v10 + 9784) = v9;
    uint64_t v11 = *(void *)(v8 + 14464);
    if ((~*(void *)(v11 + v10 + 9784) & 0x6000000000000000) != 0)
    {
      uint64_t v12 = v8 + 14472;
      if (!a3)
      {
        id v13 = 0;
LABEL_12:
        *(void *)(v12 + 8 * v4 + 8264) = v13;
        uint64_t v14 = *(void *)(v8 + 8) + 90088;
        *(void *)(v14 + 8 * ((v4 & 0xFFFFFFC0) != 0) + 224) |= 1 << v4;
        *(void *)(v14 + 384) |= 0x4000000uLL;
        return;
      }
    }
    else
    {
      *(_OWORD *)(v11 + 16 * v4 + 9912) = *((_OWORD *)a3 + 8);
      uint64_t v12 = v8 + 14472;
    }
    id v13 = (char *)a3 + 48;
    if (*((_DWORD *)a3 + 36)) {
      id v13 = (char *)*((unsigned int *)a3 + 36);
    }
    goto LABEL_12;
  }
  uint64_t v15 = impl[4573];
  if (v15)
  {
    uint64_t v8 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v15 + 48))(v15, a2);
    uint64_t *v7 = v8;
    goto LABEL_2;
  }
  uint64_t v16 = (AGXG17FamilyRenderContext *)std::__throw_bad_function_call[abi:nn180100]();
  [(AGXG17FamilyRenderContext *)v16 setMeshTextures:v18 withRange:v19];
}

- (void)setMeshTextures:(const void *)a3 withRange:(_NSRange)a4
{
  unsigned int length = a4.length;
  unsigned int location = a4.location;
  impl = self->_impl;
  uint64_t v8 = impl + 4569;
  uint64_t v9 = impl[4569];
  if (v9)
  {
    uint64_t length_low = LODWORD(a4.length);
    if (!LODWORD(a4.length)) {
      return;
    }
    goto LABEL_3;
  }
  uint64_t v12 = impl[4573];
  if (!v12)
  {
    uint64_t v13 = std::__throw_bad_function_call[abi:nn180100]();
    AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setTexture<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<true>>(v13, v14, v15, v16);
    return;
  }
  uint64_t v9 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v12 + 48))(v12, a2);
  uint64_t *v8 = v9;
  uint64_t length_low = length;
  if (length)
  {
    do
    {
LABEL_3:
      uint64_t v11 = (uint64_t)*a3++;
      AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setTexture<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<true>>(v9, v11, location++, (void *)(v9 + 14464));
      --length_low;
    }
    while (length_low);
  }
}

- (void)setMeshTexture:(id)a3 atIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  impl = self->_impl;
  v7 = impl + 4569;
  uint64_t v8 = impl[4569];
  if (!v8)
  {
    uint64_t v9 = impl[4573];
    if (!v9)
    {
      uint64_t v10 = (AGXG17FamilyRenderContext *)std::__throw_bad_function_call[abi:nn180100]();
      [(AGXG17FamilyRenderContext *)v10 setMeshBuffers:v12 offsets:v13 withRange:v15];
      return;
    }
    uint64_t v8 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v9 + 48))(v9, a2);
    uint64_t *v7 = v8;
  }

  AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setTexture<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<true>>(v8, (uint64_t)a3, v4, (void *)(v8 + 14464));
}

- (void)setMeshBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  unsigned int length = a5.length;
  unsigned int location = a5.location;
  impl = self->_impl;
  uint64_t v10 = impl + 4569;
  uint64_t v11 = impl[4569];
  if (v11)
  {
    uint64_t length_low = LODWORD(a5.length);
    if (!LODWORD(a5.length)) {
      return;
    }
    goto LABEL_3;
  }
  uint64_t v16 = impl[4573];
  if (!v16)
  {
    uint64_t v17 = std::__throw_bad_function_call[abi:nn180100]();
    AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setBuffer<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<true>>(v17, v18, v19, v20, v21);
    return;
  }
  uint64_t v11 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v16 + 48))(v16, a2);
  *uint64_t v10 = v11;
  uint64_t length_low = length;
  if (length)
  {
    do
    {
LABEL_3:
      uint64_t v14 = (uint64_t)*a3++;
      uint64_t v13 = v14;
      uint64_t v15 = *a4++;
      AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setBuffer<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<true>>(v11, v13, v15, location++, (void *)(v11 + 14464));
      --length_low;
    }
    while (length_low);
  }
}

- (void)setMeshBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  impl = self->_impl;
  v7 = impl + 4569;
  uint64_t v8 = impl[4569];
  if (v8) {
    goto LABEL_2;
  }
  uint64_t v18 = impl[4573];
  if (v18)
  {
    uint64_t v8 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v18 + 48))(v18, a2);
    uint64_t *v7 = v8;
LABEL_2:
    uint64_t v9 = *(void *)(v8 + 8);
    uint64_t v10 = 8 * v4;
    uint64_t v11 = v8 + v10 + 14464;
    uint64_t v12 = *(void *)(v11 + 13064);
    uint64_t v13 = *(void *)(v11 + 13584);
    uint64_t v14 = (void *)(*(void *)(v8 + 14464) + v10);
    uint64_t v15 = v14[67];
    uint64_t v16 = v14[132];
    uint64_t v17 = v12 + a3;
    v14[67] = v17;
    v14[132] = v15 - v17 + v16;
    *uint64_t v14 = v13 + a3;
    *(_DWORD *)(v8 + 4 * v4 + 23136) = *(_DWORD *)(v8 + 4 * v4 + 22876);
    *(void *)(v9 + 90088 + 8 * ((v4 & 0xFFFFFFC0) != 0) + 192) |= 1 << v4;
    *(void *)(v9 + 90472) |= 0x4000000uLL;
    return;
  }
  uint64_t v19 = std::__throw_bad_function_call[abi:nn180100]();
  AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setMeshProgramBufferOffset(v19, v20, v21);
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unsigned int v5 = a5;
  impl = self->_impl;
  uint64_t v9 = impl + 4569;
  uint64_t v10 = impl[4569];
  if (!v10)
  {
    uint64_t v11 = impl[4573];
    if (!v11)
    {
      uint64_t v12 = (AGXG17FamilyRenderContext *)std::__throw_bad_function_call[abi:nn180100]();
      [(AGXG17FamilyRenderContext *)v12 setMeshBytes:v14 length:v15 atIndex:v16];
      return;
    }
    uint64_t v10 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v11 + 48))(v11, a2);
    *uint64_t v9 = v10;
  }

  AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setBuffer<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<true>>(v10, (uint64_t)a3, a4, v5, (void *)(v10 + 14464));
}

- (void)setMeshBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unsigned int v5 = a5;
  impl = self->_impl;
  uint64_t v9 = impl + 4569;
  uint64_t v10 = impl[4569];
  if (!v10)
  {
    uint64_t v24 = impl[4573];
    if (!v24)
    {
      v25 = (AGXG17FamilyRenderContext *)std::__throw_bad_function_call[abi:nn180100]();
      [(AGXG17FamilyRenderContext *)v25 setObjectThreadgroupMemoryLength:v27 atIndex:v28];
      return;
    }
    uint64_t v10 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v24 + 48))(v24, a2);
    *uint64_t v9 = v10;
  }
  uint64_t v11 = *(void **)(v10 + 8);
  unint64_t v12 = (a4 + 15) | 0xF;
  unint64_t v13 = v11[20] + v12;
  if (v13 > v11[19])
  {
    if (!AGX::DataBufferAllocator<34ul>::growNoInline(v11 + 2, 3, 0)) {
      goto LABEL_4;
    }
    unint64_t v13 = v11[20] + v12;
    if (v13 > v11[19]) {
      abort();
    }
  }
  v11[21] = v13;
LABEL_4:
  unint64_t v14 = (a4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v15 = *(void *)(v10 + 8);
  unint64_t v16 = (char *)((*(void *)(v15 + 160) + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(void *)(v15 + 176);
  *(void *)(v15 + 160) = &v16[v14];
  memcpy(v16, a3, a4);
  uint64_t v18 = *(void *)(v10 + 8);
  uint64_t v19 = *(void *)(*(void *)(v18 + 40) + 224);
  uint64_t v20 = (int)*MEMORY[0x263F4B188];
  if (v5 <= 0x22) {
    *(void *)(v10 + 8 * v5 + 27248) = 0;
  }
  uint64_t v21 = v18 + 90088;
  *(void *)(v21 + 8 * (v5 > 0x3F) + 192) |= 1 << v5;
  *(void *)(v21 + 384) |= 0x4000000uLL;
  uint64_t v22 = *(void *)(v10 + 14464) + 8 * v5;
  *(void *)(v22 + 536) = &v16[v17];
  *(void *)(v22 + 1056) = v14;
  *(void *)(v10 + 8 * v5 + 14464 + 9192) = v19 + v20;
  v23 = (_DWORD *)(v10 + 4 * v5 + 14472);
  v23[2101] = a4;
  v23[2166] = a4;
  v23[2231] = (unint64_t)&v16[v17] >> 8;
}

- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  int v5 = a3;
  impl = self->_impl;
  v7 = impl + 4569;
  uint64_t v8 = impl[4569];
  if (v8) {
    goto LABEL_2;
  }
  uint64_t v9 = impl[4573];
  if (v9)
  {
    uint64_t v8 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v9 + 48))(v9, a2);
    uint64_t *v7 = v8;
LABEL_2:
    *(_DWORD *)(v8 + 4 * v4 + 14320) = v5;
    return;
  }
  uint64_t v10 = (AGXG17FamilyRenderContext *)std::__throw_bad_function_call[abi:nn180100]();
  [(AGXG17FamilyRenderContext *)v10 setObjectSamplerStates:v12 lodMinClamps:v13 lodMaxClamps:v14 withRange:v15];
}

- (void)setObjectSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  unsigned int length = a6.length;
  unsigned int location = a6.location;
  impl = self->_impl;
  unint64_t v12 = impl + 4569;
  uint64_t v13 = impl[4569];
  if (!v13)
  {
    uint64_t v19 = impl[4573];
    if (!v19)
    {
      uint64_t v13 = std::__throw_bad_function_call[abi:nn180100]();
      goto LABEL_4;
    }
    uint64_t v13 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v19 + 48))(v19, a2);
    uint64_t *v12 = v13;
  }
  unint64_t v14 = a3;
  _NSRange v15 = (unsigned int *)a4;
  unint64_t v16 = (unsigned int *)a5;
  unsigned int v17 = location;
  unsigned int v18 = length;

LABEL_4:
  AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setObjectProgramSamplersWithLODOverrides(v13, (uint64_t)v14, v15, v16, v17, v18);
}

- (void)setObjectSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  unsigned int v6 = a6;
  impl = self->_impl;
  SEL v11 = impl + 4569;
  uint64_t v12 = impl[4569];
  if (!v12)
  {
    uint64_t v17 = impl[4573];
    if (!v17)
    {
      uint64_t v12 = std::__throw_bad_function_call[abi:nn180100]();
      goto LABEL_4;
    }
    uint64_t v12 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v17 + 48))(v17, a2);
    uint64_t *v11 = v12;
  }
  id v13 = a3;
  float v14 = a4;
  float v15 = a5;
  unsigned int v16 = v6;

LABEL_4:
  AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setObjectProgramSamplerWithLODOverride(v12, (uint64_t)v13, v16, v14, v15);
}

- (void)setObjectSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  LODWORD(length_low) = a4.length;
  unsigned int location = a4.location;
  impl = self->_impl;
  uint64_t v8 = impl + 4569;
  uint64_t v9 = impl[4569];
  if (v9)
  {
    uint64_t length_low = LODWORD(a4.length);
    if (LODWORD(a4.length))
    {
LABEL_3:
      uint64_t v10 = *(void *)(v9 + 8);
      for (unsigned int i = location; ; ++i)
      {
        id v13 = *a3;
        if (*(void *)(v10 + 1480)) {
          MTLResourceListAddResource();
        }
        uint64_t v14 = v13 ? v13[15] : 0;
        uint64_t v15 = 8 * i;
        *(void *)(*(void *)(v9 + 80) + v15 + 9784) = v14;
        uint64_t v16 = *(void *)(v9 + 80);
        if ((~*(void *)(v16 + v15 + 9784) & 0x6000000000000000) == 0) {
          break;
        }
        if (v13) {
          goto LABEL_5;
        }
        uint64_t v12 = 0;
LABEL_7:
        *(void *)(v9 + 8 * i + 8336) = v12;
        uint64_t v10 = *(void *)(v9 + 8);
        *(void *)(v10 + 90088 + 8 * (i > 0x3F) + 128) |= 1 << i;
        *(void *)(v10 + 90472) |= 0x10000uLL;
        ++a3;
        if (!--length_low) {
          return;
        }
      }
      *(_OWORD *)(v16 + 16 * i + 9912) = *((_OWORD *)v13 + 8);
LABEL_5:
      uint64_t v12 = (char *)(v13 + 6);
      if (*((_DWORD *)v13 + 36)) {
        uint64_t v12 = (char *)*((unsigned int *)v13 + 36);
      }
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v17 = impl[4573];
    if (v17)
    {
      uint64_t v9 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v17 + 48))(v17, a2);
      uint64_t *v8 = v9;
      uint64_t length_low = length_low;
      if (length_low) {
        goto LABEL_3;
      }
    }
    else
    {
      unsigned int v18 = (AGXG17FamilyRenderContext *)std::__throw_bad_function_call[abi:nn180100]();
      [(AGXG17FamilyRenderContext *)v18 setObjectSamplerState:v20 atIndex:v21];
    }
  }
}

- (void)setObjectSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  impl = self->_impl;
  v7 = impl + 4569;
  uint64_t v8 = impl[4569];
  if (v8)
  {
LABEL_2:
    if (*(void *)(*(void *)(v8 + 8) + 1480)) {
      MTLResourceListAddResource();
    }
    if (a3) {
      uint64_t v9 = *((void *)a3 + 15);
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = 8 * v4;
    *(void *)(*(void *)(v8 + 80) + v10 + 9784) = v9;
    uint64_t v11 = *(void *)(v8 + 80);
    if ((~*(void *)(v11 + v10 + 9784) & 0x6000000000000000) != 0)
    {
      uint64_t v12 = v8 + 88;
      if (!a3)
      {
        id v13 = 0;
LABEL_12:
        *(void *)(v12 + 8 * v4 + 8248) = v13;
        uint64_t v14 = *(void *)(v8 + 8) + 90088;
        *(void *)(v14 + 8 * ((v4 & 0xFFFFFFC0) != 0) + 128) |= 1 << v4;
        *(void *)(v14 + 384) |= 0x10000uLL;
        return;
      }
    }
    else
    {
      *(_OWORD *)(v11 + 16 * v4 + 9912) = *((_OWORD *)a3 + 8);
      uint64_t v12 = v8 + 88;
    }
    id v13 = (char *)a3 + 48;
    if (*((_DWORD *)a3 + 36)) {
      id v13 = (char *)*((unsigned int *)a3 + 36);
    }
    goto LABEL_12;
  }
  uint64_t v15 = impl[4573];
  if (v15)
  {
    uint64_t v8 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v15 + 48))(v15, a2);
    uint64_t *v7 = v8;
    goto LABEL_2;
  }
  uint64_t v16 = (AGXG17FamilyRenderContext *)std::__throw_bad_function_call[abi:nn180100]();
  [(AGXG17FamilyRenderContext *)v16 setObjectTextures:v18 withRange:v19];
}

- (void)setObjectTextures:(const void *)a3 withRange:(_NSRange)a4
{
  unsigned int length = a4.length;
  unsigned int location = a4.location;
  impl = self->_impl;
  uint64_t v8 = impl + 4569;
  uint64_t v9 = impl[4569];
  if (v9)
  {
    uint64_t length_low = LODWORD(a4.length);
    if (!LODWORD(a4.length)) {
      return;
    }
    goto LABEL_3;
  }
  uint64_t v12 = impl[4573];
  if (!v12)
  {
    uint64_t v13 = std::__throw_bad_function_call[abi:nn180100]();
    AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setTexture<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<false>>(v13, v14, v15, v16);
    return;
  }
  uint64_t v9 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v12 + 48))(v12, a2);
  uint64_t *v8 = v9;
  uint64_t length_low = length;
  if (length)
  {
    do
    {
LABEL_3:
      uint64_t v11 = (uint64_t)*a3++;
      AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setTexture<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<false>>(v9, v11, location++, (void *)(v9 + 80));
      --length_low;
    }
    while (length_low);
  }
}

- (void)setObjectTexture:(id)a3 atIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  impl = self->_impl;
  v7 = impl + 4569;
  uint64_t v8 = impl[4569];
  if (!v8)
  {
    uint64_t v9 = impl[4573];
    if (!v9)
    {
      uint64_t v10 = (AGXG17FamilyRenderContext *)std::__throw_bad_function_call[abi:nn180100]();
      [(AGXG17FamilyRenderContext *)v10 setObjectBuffers:v12 offsets:v13 withRange:v15];
      return;
    }
    uint64_t v8 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v9 + 48))(v9, a2);
    uint64_t *v7 = v8;
  }

  AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setTexture<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<false>>(v8, (uint64_t)a3, v4, (void *)(v8 + 80));
}

- (void)setObjectBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  unsigned int length = a5.length;
  unsigned int location = a5.location;
  impl = self->_impl;
  uint64_t v10 = impl + 4569;
  uint64_t v11 = impl[4569];
  if (v11)
  {
    uint64_t length_low = LODWORD(a5.length);
    if (!LODWORD(a5.length)) {
      return;
    }
    goto LABEL_3;
  }
  uint64_t v16 = impl[4573];
  if (!v16)
  {
    uint64_t v17 = std::__throw_bad_function_call[abi:nn180100]();
    AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setBuffer<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<false>>(v17, v18, v19, v20, v21);
    return;
  }
  uint64_t v11 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v16 + 48))(v16, a2);
  *uint64_t v10 = v11;
  uint64_t length_low = length;
  if (length)
  {
    do
    {
LABEL_3:
      uint64_t v14 = (uint64_t)*a3++;
      uint64_t v13 = v14;
      uint64_t v15 = *a4++;
      AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setBuffer<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<false>>(v11, v13, v15, location++, (void *)(v11 + 80));
      --length_low;
    }
    while (length_low);
  }
}

- (void)setObjectBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  impl = self->_impl;
  v7 = impl + 4569;
  uint64_t v8 = impl[4569];
  if (v8) {
    goto LABEL_2;
  }
  uint64_t v18 = impl[4573];
  if (v18)
  {
    uint64_t v8 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v18 + 48))(v18, a2);
    uint64_t *v7 = v8;
LABEL_2:
    uint64_t v9 = *(void *)(v8 + 8);
    uint64_t v10 = 8 * v4;
    uint64_t v11 = v8 + 80 + v10;
    uint64_t v12 = *(void *)(v11 + 13200);
    uint64_t v13 = *(void *)(v11 + 13720);
    uint64_t v14 = (void *)(*(void *)(v8 + 80) + v10);
    uint64_t v15 = v14[67];
    uint64_t v16 = v14[132];
    uint64_t v17 = v12 + a3;
    v14[67] = v17;
    v14[132] = v15 - v17 + v16;
    *uint64_t v14 = v13 + a3;
    *(_DWORD *)(v8 + 4 * v4 + 8740) = *(_DWORD *)(v8 + 4 * v4 + 8480);
    v9 += 90088;
    *(void *)(v9 + 8 * ((v4 & 0xFFFFFFC0) != 0) + 96) |= 1 << v4;
    *(void *)(v9 + 384) |= 0x10000uLL;
    return;
  }
  uint64_t v19 = std::__throw_bad_function_call[abi:nn180100]();
  AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setObjectProgramBufferOffset(v19, v20, v21);
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unsigned int v5 = a5;
  impl = self->_impl;
  uint64_t v9 = impl + 4569;
  uint64_t v10 = impl[4569];
  if (!v10)
  {
    uint64_t v11 = impl[4573];
    if (!v11)
    {
      uint64_t v12 = (AGXG17FamilyRenderContext *)std::__throw_bad_function_call[abi:nn180100]();
      [(AGXG17FamilyRenderContext *)v12 setObjectBytes:v14 length:v15 atIndex:v16];
      return;
    }
    uint64_t v10 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v11 + 48))(v11, a2);
    *uint64_t v9 = v10;
  }

  AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setBuffer<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<false>>(v10, (uint64_t)a3, a4, v5, (void *)(v10 + 80));
}

- (void)setObjectBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unsigned int v5 = a5;
  impl = self->_impl;
  uint64_t v9 = impl + 4569;
  uint64_t v10 = impl[4569];
  if (!v10)
  {
    uint64_t v24 = impl[4573];
    if (!v24)
    {
      v25 = (AGXG17FamilyRenderContext *)std::__throw_bad_function_call[abi:nn180100]();
      [(AGXG17FamilyRenderContext *)v25 drawMeshThreadgroupsWithIndirectBuffer:v27 indirectBufferOffset:v28 threadsPerObjectThreadgroup:v29 threadsPerMeshThreadgroup:v30];
      return;
    }
    uint64_t v10 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v24 + 48))(v24, a2);
    *uint64_t v9 = v10;
  }
  uint64_t v11 = *(void **)(v10 + 8);
  unint64_t v12 = (a4 + 15) | 0xF;
  unint64_t v13 = v11[20] + v12;
  if (v13 > v11[19])
  {
    if (!AGX::DataBufferAllocator<34ul>::growNoInline(v11 + 2, 3, 0)) {
      goto LABEL_4;
    }
    unint64_t v13 = v11[20] + v12;
    if (v13 > v11[19]) {
      abort();
    }
  }
  v11[21] = v13;
LABEL_4:
  unint64_t v14 = (a4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v15 = *(void *)(v10 + 8);
  unint64_t v16 = (char *)((*(void *)(v15 + 160) + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(void *)(v15 + 176);
  *(void *)(v15 + 160) = &v16[v14];
  memcpy(v16, a3, a4);
  uint64_t v18 = *(void *)(v10 + 8);
  uint64_t v19 = *(void *)(*(void *)(v18 + 40) + 224);
  uint64_t v20 = (int)*MEMORY[0x263F4B188];
  if (v5 <= 0x22) {
    *(void *)(v10 + 8 * v5 + 13000) = 0;
  }
  uint64_t v21 = v18 + 90088;
  *(void *)(v21 + 8 * (v5 > 0x3F) + 96) |= 1 << v5;
  *(void *)(v21 + 384) |= 0x10000uLL;
  uint64_t v22 = *(void *)(v10 + 80) + 8 * v5;
  *(void *)(v22 + 536) = &v16[v17];
  *(void *)(v22 + 1056) = v14;
  *(void *)(v10 + 80 + 8 * v5 + 9328) = v19 + v20;
  v23 = (_DWORD *)(v10 + 4 * v5);
  v23[2120] = a4;
  v23[2185] = a4;
  v23[2250] = (unint64_t)&v16[v17] >> 8;
}

- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6
{
  impl = self->_impl;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13 = *a5;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12 = *a6;
  uint64_t v7 = impl[4569];
  if (v7)
  {
    uint64_t v8 = impl + 11396;
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
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v15 = v13;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v14 = v12;
    AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::drawMeshThreadgroupsWithIndirectBuffer(v7, (uint64_t)a3, a4, &v15, (unsigned int *)&v14);
  }
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  impl = self->_impl;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11 = *a5;
  uint64_t v6 = impl[4569];
  if (v6)
  {
    uint64_t v7 = impl + 11396;
    uint64_t v8 = *(void *)(v6 + 32);
    if (v8)
    {
      BOOL v9 = *(unsigned char *)(v8 + 3410) == 0;
      char v10 = 49;
      if (!v9) {
        char v10 = 50;
      }
    }
    else
    {
      char v10 = 50;
    }
    *v7 |= 1 << v10;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v16 = v13;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v15 = v12;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v14 = v11;
    AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::drawMeshThreads(v6, (uint64_t *)&v16, (unsigned int *)&v15, (unsigned int *)&v14);
  }
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  impl = self->_impl;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11 = *a5;
  uint64_t v6 = impl[4569];
  if (v6)
  {
    uint64_t v7 = impl + 11396;
    uint64_t v8 = *(void *)(v6 + 32);
    if (v8)
    {
      BOOL v9 = *(unsigned char *)(v8 + 3410) == 0;
      char v10 = 49;
      if (!v9) {
        char v10 = 50;
      }
    }
    else
    {
      char v10 = 50;
    }
    *v7 |= 1 << v10;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v16 = v13;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v15 = v12;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v14 = v11;
    AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::drawMeshThreadgroups(v6, (uint64_t)&v16, (uint64_t)&v15, (unsigned int *)&v14);
  }
}

- (void)drawMeshThreadgroups:(id *)a3
{
  uint64_t v3 = *((void *)self->_impl + 4569);
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(v3 + 8) + 38976);
    unint64_t v5 = *(void *)(v4 + 800);
    uint64_t v6 = *(unsigned int *)(v4 + 808);
    unint64_t v7 = *(void *)(v4 + 812);
    uint64_t v8 = *(unsigned int *)(v4 + 820);
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v11 = *a3;
    v10[0] = v5;
    v10[1] = HIDWORD(v5);
    v10[2] = v6;
    v9[0] = v7;
    v9[1] = HIDWORD(v7);
    v9[2] = v8;
    AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::drawMeshThreadgroups(v3, (uint64_t)&v11, (uint64_t)v10, (unsigned int *)v9);
  }
}

- (void)setMeshAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  int v7 = [(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation];
  impl = self->_impl;
  BOOL v9 = impl + 4569;
  uint64_t v10 = impl[4569];
  if (v7)
  {
    if (v10) {
      goto LABEL_3;
    }
    uint64_t v14 = impl[4573];
    if (v14)
    {
      uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v14 + 48))(v14);
      *BOOL v9 = v10;
LABEL_3:
      $F99D9A4FB75BC57F3386B8DC8EE08D7A v11 = (void *)(v10 + 14464);
      id v12 = a3;
      unsigned int v13 = v4;
      goto LABEL_5;
    }
LABEL_14:
    uint64_t v10 = std::__throw_bad_function_call[abi:nn180100]();
LABEL_5:
    AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAccelerationStructure<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<true>,AGXG17FamilyRayTracingAccelerationStructureSW>(v10, (uint64_t)v12, v13, v11);
    return;
  }
  if (!v10)
  {
    uint64_t v15 = impl[4573];
    if (!v15) {
      goto LABEL_14;
    }
    uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v15 + 48))(v15);
    *BOOL v9 = v10;
  }

  AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAccelerationStructure<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<true>,AGXG17FamilyRayTracingAccelerationStructure>(v10, (unsigned int *)a3, v4, (void *)(v10 + 14464));
}

- (void)setObjectAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  int v7 = [(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation];
  impl = self->_impl;
  BOOL v9 = impl + 4569;
  uint64_t v10 = impl[4569];
  if (v7)
  {
    if (v10) {
      goto LABEL_3;
    }
    uint64_t v14 = impl[4573];
    if (v14)
    {
      uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v14 + 48))(v14);
      *BOOL v9 = v10;
LABEL_3:
      $F99D9A4FB75BC57F3386B8DC8EE08D7A v11 = (void *)(v10 + 80);
      id v12 = a3;
      unsigned int v13 = v4;
      goto LABEL_5;
    }
LABEL_14:
    uint64_t v10 = std::__throw_bad_function_call[abi:nn180100]();
LABEL_5:
    AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAccelerationStructure<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<false>,AGXG17FamilyRayTracingAccelerationStructureSW>(v10, (uint64_t)v12, v13, v11);
    return;
  }
  if (!v10)
  {
    uint64_t v15 = impl[4573];
    if (!v15) {
      goto LABEL_14;
    }
    uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v15 + 48))(v15);
    *BOOL v9 = v10;
  }

  AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAccelerationStructure<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<false>,AGXG17FamilyRayTracingAccelerationStructure>(v10, (unsigned int *)a3, v4, (void *)(v10 + 80));
}

- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  int v7 = [(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation];
  impl = (char *)self->_impl;
  BOOL v9 = impl + 2248;
  if (v7)
  {
    if (v4 <= 0x22) {
      *(void *)&v9[8 * v4 + 23192] = 0;
    }
    if (a3)
    {
      uint64_t v10 = *((unsigned int *)a3 + 80);
      goto LABEL_10;
    }
LABEL_14:
    uint64_t v21 = 8 * v4;
    uint64_t v22 = &impl[v21];
    v23 = &v9[v21];
    *((void *)v23 + 76) = 0;
    *((void *)v23 + 141) = 0;
    *((void *)v22 + 290) = 0;
    *((void *)v23 + 2934) = 0;
    *((void *)v23 + 2999) = 0;
    uint64_t v24 = (uint64_t)&v9[4 * v4 + 10264];
    *(_DWORD *)(v24 + 8552) = 0;
    *(_DWORD *)(v24 + 8812) = 0;
    return;
  }
  if (v4 <= 0x22) {
    *(void *)&v9[8 * v4 + 23192] = 0;
  }
  if (!a3) {
    goto LABEL_14;
  }
  uint64_t v10 = *((unsigned int *)a3 + 86);
LABEL_10:
  uint64_t v11 = 8 * v4;
  id v12 = &impl[v11];
  unsigned int v13 = &v9[v11];
  *(void *)&v9[v11 + 608] = v10;
  uint64_t v14 = [a3 buffer];
  uint64_t v15 = (int *)MEMORY[0x263F4B188];
  unint64_t v16 = *(void *)(v14 + (int)*MEMORY[0x263F4B188] + 8);
  uint64_t v17 = *(void *)([a3 buffer] + *v15 + 24);
  uint64_t v18 = *(void *)([a3 buffer] + *v15 + 16);
  *((void *)v13 + 2934) = v16;
  *((void *)v13 + 2999) = v17;
  *((void *)v13 + 141) = v18 & 0xFFFFFFFFFFFFFFLL;
  *((void *)v12 + 290) = v17;
  uint64_t v19 = &v9[4 * v4 + 10264];
  *((_DWORD *)v19 + 2138) = v18;
  *((_DWORD *)v19 + 2203) = v18;
  *((_DWORD *)v19 + 2268) = v16 >> 8;
  uint64_t v20 = [a3 buffer];
  *((void *)v13 + 2450) = v20 + *v15;
  AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource(*((void **)impl + 284), v20, 2u, v4);
  if (*((void *)impl + 285))
  {
    MTLResourceListAddResource();
  }
}

- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  int v7 = [(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation];
  impl = self->_impl;
  if (!v7)
  {
    if (v4 <= 0x22) {
      impl[v4 + 10706] = 0;
    }
    if (a3)
    {
      uint64_t v18 = &impl[v4];
      v18[6215] = *((unsigned int *)a3 + 86);
      uint64_t v19 = [a3 buffer];
      uint64_t v20 = (int *)MEMORY[0x263F4B188];
      unint64_t v21 = *(void *)(v19 + (int)*MEMORY[0x263F4B188] + 8);
      uint64_t v22 = *(void *)([a3 buffer] + *v20 + 24);
      uint64_t v23 = *(void *)([a3 buffer] + *v20 + 16);
      v18[10936] = v21;
      v18[11196] = v22;
      v18[6280] = v23 & 0xFFFFFFFFFFFFFFLL;
      v18[6148] = v22;
      uint64_t v24 = (_DWORD *)impl + v4 + 17190;
      v24[2159] = v23;
      v24[2224] = v23;
      v24[2289] = v21 >> 8;
      uint64_t v25 = [a3 buffer];
      v18[9838] = v25 + *v20;
      AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource((void *)impl[199], v25, 1u, v4);
      if (impl[185]) {
        MTLResourceListAddResource();
      }
      goto LABEL_13;
    }
LABEL_14:
    SEL v26 = &impl[v4];
    v26[9838] = 0;
    v26[10936] = 0;
    v26[11196] = 0;
    v26 += 6148;
    v26[67] = 0;
    v26[132] = 0;
    *SEL v26 = 0;
    uint64_t v27 = (uint64_t)impl + 4 * v4 + 68760;
    *(_DWORD *)(v27 + 8636) = 0;
    *(_DWORD *)(v27 + 8896) = 0;
    goto LABEL_15;
  }
  if (v4 <= 0x22) {
    impl[v4 + 10706] = 0;
  }
  if (!a3) {
    goto LABEL_14;
  }
  BOOL v9 = &impl[v4];
  v9[6215] = *((unsigned int *)a3 + 80);
  uint64_t v10 = [a3 buffer];
  uint64_t v11 = (int *)MEMORY[0x263F4B188];
  unint64_t v12 = *(void *)(v10 + (int)*MEMORY[0x263F4B188] + 8);
  uint64_t v13 = *(void *)([a3 buffer] + *v11 + 24);
  uint64_t v14 = *(void *)([a3 buffer] + *v11 + 16);
  v9[10936] = v12;
  v9[11196] = v13;
  v9[6280] = v14 & 0xFFFFFFFFFFFFFFLL;
  v9[6148] = v13;
  uint64_t v15 = (_DWORD *)impl + v4 + 17190;
  v15[2159] = v14;
  v15[2224] = v14;
  v15[2289] = v12 >> 8;
  uint64_t v16 = [a3 buffer];
  v9[9838] = v16 + *v11;
  AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource((void *)impl[199], v16, 1u, v4);
  if (impl[185]) {
    MTLResourceListAddResource();
  }
  uint64_t v17 = (os_unfair_lock_s *)(*((void *)a3 + 41) + 40);
  os_unfair_lock_lock(v17);
  os_unfair_lock_unlock(v17);
LABEL_13:
  [a3 buffer];
LABEL_15:
  impl[(v4 > 0x3F) + 11297] |= 1 << v4;
  uint64_t v28 = (uint64_t)&impl[(v4 > 0x3F) + 11261];
  *(void *)(v28 + 336) |= 1 << v4;
  impl[11309] |= 0x3000000000uLL;
}

- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  int v7 = [(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation];
  impl = self->_impl;
  if (!v7)
  {
    if (v4 <= 0x22) {
      impl[v4 + 10671] = 0;
    }
    if (a3)
    {
      uint64_t v18 = &impl[v4];
      v18[4941] = *((unsigned int *)a3 + 86);
      uint64_t v19 = [a3 buffer];
      uint64_t v20 = (int *)MEMORY[0x263F4B188];
      unint64_t v21 = *(void *)(v19 + (int)*MEMORY[0x263F4B188] + 8);
      uint64_t v22 = *(void *)([a3 buffer] + *v20 + 24);
      uint64_t v23 = *(void *)([a3 buffer] + *v20 + 16);
      v18[10741] = v21;
      v18[11001] = v22;
      v18[5006] = v23 & 0xFFFFFFFFFFFFFFLL;
      v18[4874] = v22;
      uint64_t v24 = (_DWORD *)impl + v4 + 14844;
      v24[2150] = v23;
      v24[2215] = v23;
      v24[2280] = v21 >> 8;
      uint64_t v25 = [a3 buffer];
      v18[9773] = v25 + *v20;
      AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource((void *)impl[199], v25, 0, v4);
      if (impl[185]) {
        MTLResourceListAddResource();
      }
      goto LABEL_13;
    }
LABEL_14:
    SEL v26 = &impl[v4];
    v26[9773] = 0;
    v26[10741] = 0;
    v26[11001] = 0;
    v26 += 4874;
    v26[67] = 0;
    v26[132] = 0;
    *SEL v26 = 0;
    uint64_t v27 = (uint64_t)impl + 4 * v4 + 59376;
    *(_DWORD *)(v27 + 8600) = 0;
    *(_DWORD *)(v27 + 8860) = 0;
    goto LABEL_15;
  }
  if (v4 <= 0x22) {
    impl[v4 + 10671] = 0;
  }
  if (!a3) {
    goto LABEL_14;
  }
  BOOL v9 = &impl[v4];
  v9[4941] = *((unsigned int *)a3 + 80);
  uint64_t v10 = [a3 buffer];
  uint64_t v11 = (int *)MEMORY[0x263F4B188];
  unint64_t v12 = *(void *)(v10 + (int)*MEMORY[0x263F4B188] + 8);
  uint64_t v13 = *(void *)([a3 buffer] + *v11 + 24);
  uint64_t v14 = *(void *)([a3 buffer] + *v11 + 16);
  v9[10741] = v12;
  v9[11001] = v13;
  v9[5006] = v14 & 0xFFFFFFFFFFFFFFLL;
  v9[4874] = v13;
  uint64_t v15 = (_DWORD *)impl + v4 + 14844;
  v15[2150] = v14;
  v15[2215] = v14;
  v15[2280] = v12 >> 8;
  uint64_t v16 = [a3 buffer];
  v9[9773] = v16 + *v11;
  AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource((void *)impl[199], v16, 0, v4);
  if (impl[185]) {
    MTLResourceListAddResource();
  }
  uint64_t v17 = (os_unfair_lock_s *)(*((void *)a3 + 41) + 40);
  os_unfair_lock_lock(v17);
  os_unfair_lock_unlock(v17);
LABEL_13:
  [a3 buffer];
LABEL_15:
  impl[(v4 > 0x3F) + 11261] |= 1 << v4;
  uint64_t v28 = (uint64_t)&impl[(v4 > 0x3F) + 11261];
  *(void *)(v28 + 48) |= 1 << v4;
  impl[11309] |= 0xC0uLL;
}

- (void)setMeshIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v23[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = [(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation];
  if (v8)
  {
    MEMORY[0x270FA5388](v8);
    unint64_t v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v11 = (char *)v23 - v10;
    if (length)
    {
      unint64_t v12 = (void *)((char *)v23 - v10);
      NSUInteger v13 = length;
      do
      {
        uint64_t v14 = (void *)*a3++;
        *v12++ = [v14 visibleFunctionTable];
        --v13;
      }
      while (v13);
    }
    -[AGXG17FamilyRenderContext setMeshVisibleFunctionTables:withBufferRange:](self, "setMeshVisibleFunctionTables:withBufferRange:", v11, location, length);
  }
  else
  {
    for (; length; --length)
    {
      uint64_t v15 = *a3;
      uint64_t v16 = (uint64_t *)((char *)self->_impl + 36552);
      uint64_t v17 = *v16;
      if (!*v16)
      {
        uint64_t v18 = *((void *)self->_impl + 4573);
        if (!v18)
        {
          uint64_t v19 = std::__throw_bad_function_call[abi:nn180100]();
          AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setIntersectionFunctionTable<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<true>>(v19, v20, v21, v22);
          return;
        }
        uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)v18 + 48))(v18);
        uint64_t *v16 = v17;
      }
      AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setIntersectionFunctionTable<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<true>>(v17, (uint64_t)v15, location, (void *)(v17 + 14464));
      LODWORD(location) = location + 1;
      ++a3;
    }
  }
}

- (void)setMeshIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    uint64_t v7 = [a3 visibleFunctionTable];
    [(AGXG17FamilyRenderContext *)self setMeshVisibleFunctionTable:v7 atBufferIndex:a4];
  }
  else
  {
    impl = self->_impl;
    uint64_t v9 = impl + 4569;
    uint64_t v10 = impl[4569];
    if (!v10)
    {
      uint64_t v11 = impl[4573];
      if (!v11)
      {
        unint64_t v12 = (AGXG17FamilyRenderContext *)std::__throw_bad_function_call[abi:nn180100]();
        [(AGXG17FamilyRenderContext *)v12 setObjectIntersectionFunctionTables:v14 withBufferRange:v16];
        return;
      }
      uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 48))(v11);
      *uint64_t v9 = v10;
    }
    AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setIntersectionFunctionTable<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<true>>(v10, (uint64_t)a3, a4, (void *)(v10 + 14464));
  }
}

- (void)setObjectIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v23[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = [(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation];
  if (v8)
  {
    MEMORY[0x270FA5388](v8);
    unint64_t v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v11 = (char *)v23 - v10;
    if (length)
    {
      unint64_t v12 = (void *)((char *)v23 - v10);
      NSUInteger v13 = length;
      do
      {
        uint64_t v14 = (void *)*a3++;
        *v12++ = [v14 visibleFunctionTable];
        --v13;
      }
      while (v13);
    }
    -[AGXG17FamilyRenderContext setObjectVisibleFunctionTables:withBufferRange:](self, "setObjectVisibleFunctionTables:withBufferRange:", v11, location, length);
  }
  else
  {
    for (; length; --length)
    {
      uint64_t v15 = *a3;
      _NSRange v16 = (uint64_t *)((char *)self->_impl + 36552);
      uint64_t v17 = *v16;
      if (!*v16)
      {
        uint64_t v18 = *((void *)self->_impl + 4573);
        if (!v18)
        {
          uint64_t v19 = std::__throw_bad_function_call[abi:nn180100]();
          AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setIntersectionFunctionTable<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<false>>(v19, v20, v21, v22);
          return;
        }
        uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)v18 + 48))(v18);
        uint64_t *v16 = v17;
      }
      AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setIntersectionFunctionTable<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<false>>(v17, (uint64_t)v15, location, (void *)(v17 + 80));
      LODWORD(location) = location + 1;
      ++a3;
    }
  }
}

- (void)setObjectIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    uint64_t v7 = [a3 visibleFunctionTable];
    [(AGXG17FamilyRenderContext *)self setObjectVisibleFunctionTable:v7 atBufferIndex:a4];
  }
  else
  {
    impl = self->_impl;
    uint64_t v9 = impl + 4569;
    uint64_t v10 = impl[4569];
    if (!v10)
    {
      uint64_t v11 = impl[4573];
      if (!v11)
      {
        unint64_t v12 = (AGXG17FamilyRenderContext *)std::__throw_bad_function_call[abi:nn180100]();
        [(AGXG17FamilyRenderContext *)v12 setTileIntersectionFunctionTables:v14 withBufferRange:v16];
        return;
      }
      uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 48))(v11);
      *uint64_t v9 = v10;
    }
    AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setIntersectionFunctionTable<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<false>>(v10, (uint64_t)a3, a4, (void *)(v10 + 80));
  }
}

- (void)setTileIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    v9.receiver = self;
    v9.super_class = (Class)AGXG17FamilyRenderContext;
    -[IOGPUMetalRenderCommandEncoder setTileIntersectionFunctionTables:withBufferRange:](&v9, sel_setTileIntersectionFunctionTables_withBufferRange_, a3, location, length);
  }
  else
  {
    for (; length; --length)
    {
      uint64_t v8 = (uint64_t)*a3++;
      AGX::RenderTileDispatchContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setTileProgramIntersectionFunctionTable((uint64_t)self->_impl + 2248, v8, location);
      LODWORD(location) = location + 1;
    }
  }
}

- (void)setTileIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    v8.receiver = self;
    v8.super_class = (Class)AGXG17FamilyRenderContext;
    [(IOGPUMetalRenderCommandEncoder *)&v8 setTileIntersectionFunctionTable:a3 atBufferIndex:a4];
  }
  else
  {
    uint64_t v7 = (char *)self->_impl + 2248;
    AGX::RenderTileDispatchContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setTileProgramIntersectionFunctionTable((uint64_t)v7, (uint64_t)a3, a4);
  }
}

- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    v9.receiver = self;
    v9.super_class = (Class)AGXG17FamilyRenderContext;
    -[IOGPUMetalRenderCommandEncoder setFragmentIntersectionFunctionTables:withBufferRange:](&v9, sel_setFragmentIntersectionFunctionTables_withBufferRange_, a3, location, length);
  }
  else
  {
    for (; length; --length)
    {
      uint64_t v8 = (uint64_t)*a3++;
      AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setFragmentProgramIntersectionFunctionTable((uint64_t)self->_impl, v8, location);
      LODWORD(location) = location + 1;
    }
  }
}

- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    v8.receiver = self;
    v8.super_class = (Class)AGXG17FamilyRenderContext;
    [(IOGPUMetalRenderCommandEncoder *)&v8 setFragmentIntersectionFunctionTable:a3 atBufferIndex:a4];
  }
  else
  {
    impl = self->_impl;
    AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setFragmentProgramIntersectionFunctionTable((uint64_t)impl, (uint64_t)a3, a4);
  }
}

- (void)setVertexIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    v9.receiver = self;
    v9.super_class = (Class)AGXG17FamilyRenderContext;
    -[IOGPUMetalRenderCommandEncoder setVertexIntersectionFunctionTables:withBufferRange:](&v9, sel_setVertexIntersectionFunctionTables_withBufferRange_, a3, location, length);
  }
  else
  {
    for (; length; --length)
    {
      uint64_t v8 = (uint64_t)*a3++;
      AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setVertexProgramIntersectionFunctionTable((uint64_t)self->_impl, v8, location);
      LODWORD(location) = location + 1;
    }
  }
}

- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    v8.receiver = self;
    v8.super_class = (Class)AGXG17FamilyRenderContext;
    [(IOGPUMetalRenderCommandEncoder *)&v8 setVertexIntersectionFunctionTable:a3 atBufferIndex:a4];
  }
  else
  {
    impl = self->_impl;
    AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setVertexProgramIntersectionFunctionTable((uint64_t)impl, (uint64_t)a3, a4);
  }
}

- (void)setMeshVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    unsigned int location = a4.location;
    do
    {
      objc_super v8 = *a3;
      objc_super v9 = (uint64_t *)((char *)self->_impl + 36552);
      uint64_t v10 = *v9;
      if (!*v9)
      {
        uint64_t v11 = *((void *)self->_impl + 4573);
        if (!v11)
        {
          uint64_t v12 = std::__throw_bad_function_call[abi:nn180100]();
          AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setVisibleFunctionTable<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<true>>(v12, v13, v14, v15);
          return;
        }
        uint64_t v10 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v11 + 48))(v11, a2);
        *objc_super v9 = v10;
      }
      AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setVisibleFunctionTable<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<true>>(v10, (uint64_t)v8, location++, (void *)(v10 + 14464));
      ++a3;
      --length;
    }
    while (length);
  }
}

- (void)setMeshVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  impl = self->_impl;
  uint64_t v7 = impl + 4569;
  uint64_t v8 = impl[4569];
  if (!v8)
  {
    uint64_t v9 = impl[4573];
    if (!v9)
    {
      uint64_t v10 = (AGXG17FamilyRenderContext *)std::__throw_bad_function_call[abi:nn180100]();
      [(AGXG17FamilyRenderContext *)v10 setObjectVisibleFunctionTables:v12 withBufferRange:v14];
      return;
    }
    uint64_t v8 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v9 + 48))(v9, a2);
    uint64_t *v7 = v8;
  }

  AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setVisibleFunctionTable<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<true>>(v8, (uint64_t)a3, v4, (void *)(v8 + 14464));
}

- (void)setObjectVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    unsigned int location = a4.location;
    do
    {
      uint64_t v8 = *a3;
      uint64_t v9 = (uint64_t *)((char *)self->_impl + 36552);
      uint64_t v10 = *v9;
      if (!*v9)
      {
        uint64_t v11 = *((void *)self->_impl + 4573);
        if (!v11)
        {
          uint64_t v12 = std::__throw_bad_function_call[abi:nn180100]();
          AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setVisibleFunctionTable<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<false>>(v12, v13, v14, v15);
          return;
        }
        uint64_t v10 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v11 + 48))(v11, a2);
        *uint64_t v9 = v10;
      }
      AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setVisibleFunctionTable<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<false>>(v10, (uint64_t)v8, location++, (void *)(v10 + 80));
      ++a3;
      --length;
    }
    while (length);
  }
}

- (void)setObjectVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  impl = self->_impl;
  uint64_t v7 = impl + 4569;
  uint64_t v8 = impl[4569];
  if (!v8)
  {
    uint64_t v9 = impl[4573];
    if (!v9)
    {
      uint64_t v10 = (AGXG17FamilyRenderContext *)std::__throw_bad_function_call[abi:nn180100]();
      [(AGXG17FamilyRenderContext *)v10 setTileVisibleFunctionTables:v12 withBufferRange:v14];
      return;
    }
    uint64_t v8 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v9 + 48))(v9, a2);
    uint64_t *v7 = v8;
  }

  AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setVisibleFunctionTable<AGX::HWGeometryPipelineContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::StageBindInfo<false>>(v8, (uint64_t)a3, v4, (void *)(v8 + 80));
}

- (void)setTileVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    unsigned int location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      AGX::RenderTileDispatchContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setTileProgramVisibleFunctionTable((uint64_t)self->_impl + 2248, v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setTileVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    unsigned int location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setFragmentProgramVisibleFunctionTable((uint64_t)self->_impl, v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    unsigned int location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setVertexProgramVisibleFunctionTable((uint64_t)self->_impl, v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (BOOL)setMTLCounterSampleLocationWithBuffer:(id)a3 vertexStartIndex:(unsigned int)a4 vertexEndIndex:(unsigned int)a5 fragmentStartIndex:(unsigned int)a6 fragmentEndIndex:(unsigned int)a7
{
  if (!a3) {
    return 0;
  }
  impl = (unsigned int *)self->_impl;
  impl[22650] = a4;
  impl[22651] = a5;
  impl[22652] = a6;
  impl[22653] = a7;
  char v9 = AGX::CounterSamplingContextGen1::validateSampleIndex(a3, impl + 22650);
  char v10 = AGX::CounterSamplingContextGen1::validateSampleIndex(a3, impl + 22651);
  char v11 = AGX::CounterSamplingContextGen1::validateSampleIndex(a3, impl + 22652);
  int v12 = AGX::CounterSamplingContextGen1::validateSampleIndex(a3, impl + 22653);
  if ((v9 & 1) == 0 && (v10 & 1) == 0 && (v11 & 1) == 0 && !v12) {
    return 0;
  }

  return AGX::CounterSamplingContextGen1::setCounterSampleBuffer((AGX::CounterSamplingContextGen1 *)(impl + 22648), (AGXMTLCounterSampleBuffer *)a3);
}

- (BOOL)setMTLCounterSampleLocationWithBuffer:(id)a3 startIndex:(unsigned int)a4 endIndex:(unsigned int)a5 dm:(unsigned int)a6
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: %s:%d:%s: *** Please use setMTLCounterSampleLocationWithBuffer:vertexStartIndex:vertexEndIndex:fragmentStartIndex:fragmentEndIndex:\n", "agxa_render_objc.mm", 1299, "-[AGXG17FamilyRenderContext setMTLCounterSampleLocationWithBuffer:startIndex:endIndex:dm:]");
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    char v10 = "agxa_render_objc.mm";
    __int16 v11 = 1024;
    int v12 = 1299;
    __int16 v13 = 2080;
    _NSRange v14 = "-[AGXG17FamilyRenderContext setMTLCounterSampleLocationWithBuffer:startIndex:endIndex:dm:]";
    _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** Please use setMTLCounterSampleLocationWithBuffer:vertexStartIndex:vertexEndIndex:fragmentStartIndex:fragmentEndIndex:\n", buf, 0x1Cu);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    char v10 = "agxa_render_objc.mm";
    __int16 v11 = 1024;
    int v12 = 1299;
    __int16 v13 = 2080;
    _NSRange v14 = "-[AGXG17FamilyRenderContext setMTLCounterSampleLocationWithBuffer:startIndex:endIndex:dm:]";
    _os_log_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** Please use setMTLCounterSampleLocationWithBuffer:vertexStartIndex:vertexEndIndex:fragmentStartIndex:fragmentEndIndex:\n", buf, 0x1Cu);
  }
  [(AGXG17FamilyRenderContext *)self doesNotRecognizeSelector:a2];
  return 0;
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
}

- (unsigned)commandBatchIdOffset
{
  return self->_user_draw_token_offset;
}

- (BOOL)commandBatchIdRangeMin:(unsigned int *)a3 max:(unsigned int *)a4
{
  return AGX::ContextCommon<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::userDrawTokenIndex((uint64_t)self->_impl, a3, a4);
}

- (void)filterCounterRangeWithFirstBatch:(unsigned int)a3 lastBatch:(unsigned int)a4 filterIndex:(unsigned int)a5
{
  impl = self->_impl;
  impl[379] = a3;
  impl[380] = a4;
}

- (void)addSplitHandler:(id)a3
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3052000000;
  v8[3] = __Block_byref_object_copy__4564;
  v8[4] = __Block_byref_object_dispose__4565;
  v8[5] = self;
  impl = (uint64_t *)self->_impl;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__AGXG17FamilyRenderContext_addSplitHandler___block_invoke;
  v7[3] = &unk_26516F6F0;
  v7[4] = a3;
  v7[5] = v8;
  unsigned int v4 = _Block_copy(v7);
  impl += 4867;
  uint64_t v5 = *impl;
  uint64_t v6 = operator new(0x10uLL);
  *uint64_t v6 = v5;
  v6[1] = v4;
  uint64_t *impl = (uint64_t)v6;
  _Block_object_dispose(v8, 8);
}

uint64_t __45__AGXG17FamilyRenderContext_addSplitHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v5 = (char *)self->_impl + 4 * a5;
  *((_DWORD *)v5 + 5230) = a4;
  *((_DWORD *)v5 + 19304) = a4;
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4 withRenderTargetArrayIndex:(unsigned int)a5
{
  impl = self->_impl;
  impl[382] = impl[381];
  int64x2_t v7 = *(int64x2_t *)&a3->var0;
  unint64_t var2 = a3->var2;
  long long v8 = *(_OWORD *)&a4->var0.var2;
  v9[0] = *(_OWORD *)&a4->var0.var0;
  v9[1] = v8;
  v9[2] = *(_OWORD *)&a4->var1.var1;
  int64x2_t v10 = v7;
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::dispatchWarpedThreads((uint64_t)impl, &v10, v9, a5 | 0x100000000);
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4
{
  impl = self->_impl;
  impl[382] = impl[381];
  int64x2_t v6 = *(int64x2_t *)&a3->var0;
  unint64_t var2 = a3->var2;
  long long v7 = *(_OWORD *)&a4->var0.var2;
  v8[0] = *(_OWORD *)&a4->var0.var0;
  v8[1] = v7;
  v8[2] = *(_OWORD *)&a4->var1.var1;
  int64x2_t v9 = v6;
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::dispatchWarpedThreads((uint64_t)impl, &v9, v8, 0);
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)dispatchThreadsPerTile:(id *)a3
{
  impl = self->_impl;
  impl[382] = impl[381];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v8 = *a3;
  uint64_t v5 = *((void *)impl + 246);
  memset(v9, 0, sizeof(v9));
  uint64_t v6 = *(void *)(v5 + 2576);
  *(void *)&long long v7 = v6;
  *((void *)&v7 + 1) = HIDWORD(v6);
  long long v10 = v7;
  uint64_t v11 = 1;
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::dispatchThreadsImpl<false>((uint64_t)impl, (long long *)&v8, (uint64_t)v9, 1uLL, 0);
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)setTileSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  uint64_t length_low = LODWORD(a6.length);
  if (LODWORD(a6.length))
  {
    unsigned int location = a6.location;
    impl = self->_impl;
    int v12 = (char *)(impl + 281);
    while (*a3)
    {
      uint64_t v14 = impl[3352];
      uint64_t v15 = *(void *)(v14 + 808);
      unsigned int v16 = *(_DWORD *)a4;
      unsigned int v17 = *(_DWORD *)a5;
      uint64_t v18 = (char *)*a3 + 48;
      long long v20 = *((_OWORD *)*a3 + 4);
      long long v19 = *((_OWORD *)*a3 + 5);
      v25[0] = *(_OWORD *)v18;
      v25[1] = v20;
      v25[2] = v19;
      if (v18[71] < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)v18 + 6), *((void *)v18 + 7));
      }
      else
      {
        long long v21 = *((_OWORD *)v18 + 3);
        __p.__r_.__value_.__r.__words[2] = *((void *)v18 + 8);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v21;
      }
      *((void *)&v25[0] + 1) = __PAIR64__(v17, v16);
      Sampler = AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::findOrCreateSampler(v15, (uint64_t)v25, v14, 0);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        if (!impl[285]) {
          goto LABEL_15;
        }
LABEL_14:
        MTLResourceListAddResource();
        goto LABEL_15;
      }
      if (impl[285]) {
        goto LABEL_14;
      }
LABEL_15:
      uint64_t v23 = location;
      uint64_t v24 = &v12[8 * location];
      if (Sampler)
      {
        p_impl = &Sampler->_impl;
        *((void *)v24 + 1232) = *(void *)&Sampler->_impl.desc.label.__r_.var0;
        if (LODWORD(Sampler[1].super._device)) {
          p_impl = (Sampler *)LODWORD(Sampler[1].super._device);
        }
      }
      else
      {
        p_impl = 0;
        *((void *)v24 + 1232) = 0;
      }
      ++location;
      *(void *)&v12[8 * v23 + 18544] = p_impl;
      ++a5;
      ++a4;
      ++a3;
      if (!--length_low) {
        return;
      }
    }
    Sampler = 0;
    if (!impl[285]) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
}

- (void)setTileSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  unsigned int v6 = a6;
  impl = self->_impl;
  if (a3)
  {
    uint64_t v10 = impl[3352];
    uint64_t v11 = *(void *)(v10 + 808);
    long long v12 = *((_OWORD *)a3 + 4);
    v17[0] = *((_OWORD *)a3 + 3);
    v17[1] = v12;
    v17[2] = *((_OWORD *)a3 + 5);
    if (*((char *)a3 + 119) < 0) {
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a3 + 12), *((void *)a3 + 13));
    }
    else {
      std::string __p = *(std::string *)((unsigned char *)a3 + 4);
    }
    *((void *)&v17[0] + 1) = __PAIR64__(LODWORD(a5), LODWORD(a4));
    Sampler = AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::findOrCreateSampler(v11, (uint64_t)v17, v10, 0);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    Sampler = 0;
  }
  if (impl[285]) {
    MTLResourceListAddResource();
  }
  uint64_t v14 = (char *)(impl + 281);
  if (Sampler)
  {
    p_impl = &Sampler->_impl;
    uint64_t v16 = v6;
    *(void *)&v14[8 * v6 + 9856] = *(void *)&Sampler->_impl.desc.label.__r_.var0;
    if (LODWORD(Sampler[1].super._device)) {
      p_impl = (Sampler *)LODWORD(Sampler[1].super._device);
    }
  }
  else
  {
    p_impl = 0;
    uint64_t v16 = v6;
    *(void *)&v14[8 * v6 + 9856] = 0;
  }
  *(void *)&v14[8 * v16 + 18544] = p_impl;
}

- (void)setTileSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  unsigned int length = a4.length;
  int location = a4.location;
  unsigned int v6 = a3;
  impl = self->_impl;
  if (LODWORD(a4.length) && impl[285])
  {
    uint64_t length_low = LODWORD(a4.length);
    int64x2_t v9 = a3;
    do
    {
      if (*v9) {
        MTLResourceListAddResource();
      }
      ++v9;
      --length_low;
    }
    while (length_low);
  }
  if (length)
  {
    uint64_t v10 = (char *)(impl + 281);
    uint64_t v11 = length;
    do
    {
      long long v12 = *v6;
      __int16 v13 = &v10[8 * location];
      if (*v6)
      {
        v12 += 6;
        *((void *)v13 + 1232) = v12[9];
        if (*((_DWORD *)v12 + 24)) {
          long long v12 = (void *)*((unsigned int *)v12 + 24);
        }
      }
      else
      {
        *((void *)v13 + 1232) = 0;
      }
      *(void *)&v10[8 * location++ + 18544] = v12;
      ++v6;
      --v11;
    }
    while (v11);
  }
}

- (void)setTileSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  impl = self->_impl;
  if (impl[285]) {
    MTLResourceListAddResource();
  }
  long long v7 = (char *)(impl + 281);
  if (a3)
  {
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v8 = (char *)a3 + 48;
    uint64_t v9 = v4;
    *(void *)&v7[8 * v4 + 9856] = *((void *)a3 + 15);
    if (*((_DWORD *)a3 + 36)) {
      $F99D9A4FB75BC57F3386B8DC8EE08D7A v8 = (char *)*((unsigned int *)a3 + 36);
    }
  }
  else
  {
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v8 = 0;
    uint64_t v9 = v4;
    *(void *)&v7[8 * v4 + 9856] = 0;
  }
  *(void *)&v7[8 * v9 + 18544] = v8;
}

- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4
{
  unsigned int length = a4.length;
  unsigned int location = a4.location;
  unsigned int v6 = a3;
  impl = (char *)self->_impl;
  if (LODWORD(a4.length) && *((void *)impl + 285))
  {
    uint64_t length_low = LODWORD(a4.length);
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v8 = a3;
    do
    {
      if (*v8) {
        MTLResourceListAddResource();
      }
      ++v8;
      --length_low;
    }
    while (length_low);
  }
  if (length)
  {
    uint64_t v9 = impl + 2248;
    v41 = impl + 19696;
    v40 = impl + 19712;
    uint64_t v10 = length;
    unsigned int v11 = location;
    unsigned int v12 = 3 * location;
    do
    {
      uint64_t v23 = (uint64_t)*v6;
      if (*v6)
      {
        uint64_t v24 = *(void *)(v23 + 536);
        uint64_t v25 = &impl[32 * v11 + 3912];
        long long v26 = *(_OWORD *)(v24 + 416);
        *(_OWORD *)uint64_t v25 = *(_OWORD *)(v24 + 400);
        *((_OWORD *)v25 + 1) = v26;
        uint64_t v27 = &impl[32 * v11 + 8008];
        long long v28 = *(_OWORD *)(v24 + 448);
        *(_OWORD *)uint64_t v27 = *(_OWORD *)(v24 + 432);
        *((_OWORD *)v27 + 1) = v28;
        uint64_t v29 = *(void *)(v23 + 536);
        if (v29)
        {
          uint64_t v31 = *(void *)(v29 + 496);
          uint64_t v30 = *(void *)(v29 + 504);
        }
        else
        {
          uint64_t v31 = 0;
          uint64_t v30 = 0;
        }
        AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource(*((void **)impl + 284), v23, 5u, v11);
        v32 = (int *)MEMORY[0x263F4B188];
        *(void *)&v9[8 * v12 + 20120] = v23 + (int)*MEMORY[0x263F4B188];
        if (v31) {
          uint64_t v33 = v31 + *v32;
        }
        else {
          uint64_t v33 = 0;
        }
        *(void *)&v9[8 * v12 + 20128] = v33;
        if (v30) {
          uint64_t v34 = v30 + *v32;
        }
        else {
          uint64_t v34 = 0;
        }
        *(void *)&v9[8 * v12 + 20136] = v34;
        v35 = &v9[56 * v11];
        long long v36 = *(_OWORD *)(v24 + 72);
        long long v37 = *(_OWORD *)(v24 + 88);
        long long v38 = *(_OWORD *)(v24 + 104);
        *((void *)v35 + 1291) = *(void *)(v24 + 120);
        *(_OWORD *)(v35 + 10296) = v37;
        *(_OWORD *)(v35 + 10312) = v38;
        *(_OWORD *)(v35 + 10280) = v36;
        *(void *)&v41[8 * (v11 > 0x3F)] |= 1 << v11;
        uint64_t v39 = *(void *)(v24 + 488);
        if (v39) {
          LODWORD(v39) = *(_DWORD *)(v39 + 1080) != 0;
        }
        *(void *)&v40[8 * (v11 > 0x3F)] = *(void *)&v40[8 * (v11 > 0x3F)] & ~(1 << v11) | ((unint64_t)v39 << (v11 & 0x3F));
        uint64_t v14 = *(unsigned int *)(*(void *)(v23 + 536) + 120);
      }
      else
      {
        __int16 v13 = &v9[56 * v11];
        bzero(v13 + 10280, 0x38uLL);
        uint64_t v14 = 0;
        *((_DWORD *)v13 + 2582) = 0;
        uint64_t v15 = 8 * (v11 > 0x3F);
        *(void *)&v41[v15] &= ~(1 << v11);
        *(void *)&v40[v15] &= ~(1 << v11);
        uint64_t v16 = *(void *)(*((void *)impl + 3352) + 808);
        long long v17 = *(_OWORD *)(v16 + 7312);
        long long v18 = *(_OWORD *)(v16 + 7328);
        long long v19 = &impl[32 * v11 + 3912];
        *(_OWORD *)long long v19 = v17;
        *((_OWORD *)v19 + 1) = v18;
        uint64_t v20 = *(void *)(*((void *)impl + 3352) + 808);
        long long v21 = &impl[32 * v11 + 8008];
        long long v22 = *(_OWORD *)(v20 + 7360);
        *(_OWORD *)long long v21 = *(_OWORD *)(v20 + 7344);
        *((_OWORD *)v21 + 1) = v22;
      }
      *(void *)&v9[8 * v11++ + 17520] = v14;
      ++v6;
      v12 += 3;
      --v10;
    }
    while (v10);
  }
}

- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  impl = (char *)self->_impl;
  unsigned int v6 = impl + 2248;
  if (a3)
  {
    uint64_t v8 = *((void *)a3 + 67);
    if (v8)
    {
      uint64_t v10 = *(void *)(v8 + 496);
      uint64_t v9 = *(void *)(v8 + 504);
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v9 = 0;
    }
    AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource(*((void **)impl + 284), (uint64_t)a3, 5u, a4);
    int v22 = 3 * v4;
    uint64_t v23 = (int *)MEMORY[0x263F4B188];
    *(void *)&v6[24 * v4 + 20120] = (char *)a3 + (int)*MEMORY[0x263F4B188];
    if (v10) {
      uint64_t v24 = v10 + *v23;
    }
    else {
      uint64_t v24 = 0;
    }
    *(void *)&v6[8 * (v22 + 1) + 20120] = v24;
    if (v9) {
      uint64_t v25 = v9 + *v23;
    }
    else {
      uint64_t v25 = 0;
    }
    *(void *)&v6[8 * (v22 + 2) + 20120] = v25;
    uint64_t v11 = v4;
    long long v26 = &v6[56 * v4];
    long long v27 = *(_OWORD *)(v8 + 72);
    long long v28 = *(_OWORD *)(v8 + 88);
    long long v29 = *(_OWORD *)(v8 + 104);
    *((void *)v26 + 1291) = *(void *)(v8 + 120);
    *(_OWORD *)(v26 + 10296) = v28;
    *(_OWORD *)(v26 + 10312) = v29;
    *(_OWORD *)(v26 + 10280) = v27;
    *(void *)&impl[8 * (v4 > 0x3F) + 19696] |= 1 << v4;
    uint64_t v30 = *(void *)(v8 + 488);
    if (v30) {
      uint64_t v30 = *(_DWORD *)(v30 + 1080) != 0;
    }
    *(void *)&impl[8 * (v4 > 0x3F) + 19712] = *(void *)&impl[8 * (v4 > 0x3F) + 19712] & ~(1 << v4) | (v30 << (v4 & 0x3F));
    uint64_t v31 = &impl[32 * v4 + 3912];
    long long v32 = *(_OWORD *)(v8 + 416);
    *(_OWORD *)uint64_t v31 = *(_OWORD *)(v8 + 400);
    *((_OWORD *)v31 + 1) = v32;
    uint64_t v33 = &impl[32 * v4 + 8008];
    long long v34 = *(_OWORD *)(v8 + 448);
    *(_OWORD *)uint64_t v33 = *(_OWORD *)(v8 + 432);
    *((_OWORD *)v33 + 1) = v34;
    if (*((void *)impl + 285)) {
      MTLResourceListAddResource();
    }
    uint64_t v13 = *(unsigned int *)(*((void *)a3 + 67) + 120);
  }
  else
  {
    uint64_t v11 = a4;
    unsigned int v12 = &v6[56 * a4];
    bzero(v12 + 10280, 0x38uLL);
    uint64_t v13 = 0;
    *((_DWORD *)v12 + 2582) = 0;
    uint64_t v14 = &impl[8 * (v4 > 0x3F)];
    *((void *)v14 + 2462) &= ~(1 << v4);
    *((void *)v14 + 2464) &= ~(1 << v4);
    uint64_t v15 = *(void *)(*((void *)impl + 3352) + 808);
    long long v16 = *(_OWORD *)(v15 + 7312);
    long long v17 = *(_OWORD *)(v15 + 7328);
    long long v18 = &impl[32 * v11 + 3912];
    *(_OWORD *)long long v18 = v16;
    *((_OWORD *)v18 + 1) = v17;
    uint64_t v19 = *(void *)(*((void *)impl + 3352) + 808);
    uint64_t v20 = &impl[32 * v4 + 8008];
    long long v21 = *(_OWORD *)(v19 + 7360);
    *(_OWORD *)uint64_t v20 = *(_OWORD *)(v19 + 7344);
    *((_OWORD *)v20 + 1) = v21;
  }
  *(void *)&v6[8 * v11 + 17520] = v13;
}

- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  LODWORD(v5) = a5.length;
  unsigned int location = a5.location;
  uint64_t v8 = a3;
  impl = self->_impl;
  if (LODWORD(a5.length) && impl[285])
  {
    uint64_t length_low = LODWORD(a5.length);
    uint64_t v11 = a3;
    do
    {
      if (*v11) {
        MTLResourceListAddResource();
      }
      ++v11;
      --length_low;
    }
    while (length_low);
  }
  if (v5)
  {
    unsigned int v12 = (char *)(impl + 281);
    uint64_t v13 = (char *)(impl + 290);
    uint64_t v5 = v5;
    uint64_t v14 = (int *)MEMORY[0x263F4B188];
    do
    {
      if (location <= 0x22) {
        *(void *)&v12[8 * location + 23192] = 0;
      }
      uint64_t v18 = (uint64_t)*v8;
      uint64_t v19 = &v12[4 * location];
      if (*v8)
      {
        uint64_t v20 = v18 + *v14;
        unint64_t v21 = *(void *)(v20 + 8);
        uint64_t v24 = v20 + 16;
        uint64_t v22 = *(void *)(v20 + 16);
        uint64_t v23 = *(void *)(v24 + 8);
        unint64_t v25 = *a4;
        uint64_t v26 = 8 * location;
        long long v27 = &v12[v26];
        *((void *)v27 + 76) = *a4 + v21;
        *(void *)&v13[v26] = v23 + v25;
        *((void *)v27 + 141) = (v22 & 0xFFFFFFFFFFFFFFLL) - v25;
        *((void *)v27 + 2934) = v21;
        *((void *)v27 + 2999) = v23;
        long long v28 = v19 + 10264;
        v28[2138] = v22;
        v28[2203] = v22;
        v28[2268] = v21 >> 8;
        *((void *)v27 + 2450) = v18 + *v14;
        AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource((void *)impl[284], v18, 2u, location);
      }
      else
      {
        uint64_t v15 = 8 * location;
        long long v16 = &v12[v15];
        *((void *)v16 + 76) = 0;
        long long v17 = v19 + 10264;
        *((_DWORD *)v17 + 2138) = 0;
        *((void *)v16 + 141) = 0;
        *(void *)&v13[v15] = 0;
        *((void *)v16 + 2934) = 0;
        *((void *)v16 + 2999) = 0;
        *((_DWORD *)v17 + 2203) = 0;
      }
      ++location;
      ++a4;
      ++v8;
      --v5;
    }
    while (v5);
  }
}

- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  impl = self->_impl;
  uint64_t v5 = &impl[2 * a4];
  uint64_t v6 = v5[3280];
  uint64_t v7 = v5[357];
  uint64_t v8 = v5[422];
  unint64_t v9 = v5[3215] + a3;
  v5[357] = v9;
  v5[422] = v7 - v9 + v8;
  v5[290] = v6 + a3;
  impl[a4 + 5331] = impl[a4 + 5266];
}

- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  impl = (char *)self->_impl;
  uint64_t v6 = impl + 2248;
  if (a5 <= 0x22) {
    *(void *)&v6[8 * a5 + 23192] = 0;
  }
  if (a3)
  {
    uint64_t v7 = (int *)MEMORY[0x263F4B188];
    uint64_t v8 = (char *)a3 + (int)*MEMORY[0x263F4B188];
    unint64_t v9 = *((void *)v8 + 1);
    unsigned int v12 = v8 + 16;
    uint64_t v10 = *((void *)v8 + 2);
    uint64_t v11 = *((void *)v12 + 1);
    uint64_t v13 = 8 * a5;
    uint64_t v14 = &v6[v13];
    *((void *)v14 + 2934) = v9;
    *((void *)v14 + 2999) = v11;
    *((void *)v14 + 76) = v9 + a4;
    *((void *)v14 + 141) = (v10 & 0xFFFFFFFFFFFFFFLL) - a4;
    *(void *)&impl[v13 + 2320] = v11 + a4;
    uint64_t v15 = &v6[4 * a5 + 10264];
    *((_DWORD *)v15 + 2138) = v10;
    *((_DWORD *)v15 + 2203) = v10;
    *((_DWORD *)v15 + 2268) = v9 >> 8;
    *((void *)v14 + 2450) = (char *)a3 + *v7;
    AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource(*((void **)impl + 284), (uint64_t)a3, 2u, a5);
    if (*((void *)impl + 285))
    {
      MTLResourceListAddResource();
    }
  }
  else
  {
    uint64_t v16 = 8 * a5;
    long long v17 = &v6[v16];
    *((void *)v17 + 76) = 0;
    *((void *)v17 + 141) = 0;
    uint64_t v18 = (uint64_t)&v6[4 * a5 + 10264];
    *(_DWORD *)(v18 + 8552) = 0;
    *(void *)&impl[v16 + 2320] = 0;
    *((void *)v17 + 2934) = 0;
    *((void *)v17 + 2999) = 0;
    *(_DWORD *)(v18 + 8812) = 0;
  }
}

- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unsigned int v5 = a5;
  impl = self->_impl;
  unint64_t v9 = a4 + 15;
  uint64_t v10 = (void *)impl[283];
  unint64_t v11 = (a4 + 15) | 0xF;
  unint64_t v12 = v10[22] + v11;
  if (v12 <= v10[21])
  {
LABEL_2:
    v10[23] = v12;
    goto LABEL_3;
  }
  if (AGX::DataBufferAllocator<34ul>::growNoInline(impl[283], 4, 0))
  {
    unint64_t v12 = v10[22] + v11;
    if (v12 > v10[21]) {
      abort();
    }
    goto LABEL_2;
  }
LABEL_3:
  uint64_t v13 = (char *)(impl + 281);
  unint64_t v14 = v9 & 0xFFFFFFFFFFFFFFF0;
  uint64_t v15 = impl[283];
  uint64_t v16 = (char *)((*(void *)(v15 + 176) + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(void *)(v15 + 192);
  *(void *)(v15 + 176) = &v16[v14];
  memcpy(v16, a3, a4);
  uint64_t v18 = *(void *)(*(void *)(impl[283] + 24) + 288);
  uint64_t v19 = (int)*MEMORY[0x263F4B188];
  if (v5 <= 0x22) {
    *(void *)&v13[8 * v5 + 23192] = 0;
  }
  uint64_t v20 = &v13[8 * v5];
  *((void *)v20 + 76) = &v16[v17];
  *((void *)v20 + 141) = v14;
  *((void *)v20 + 2450) = v18 + v19;
  unint64_t v21 = &v13[4 * v5 + 10264];
  *((_DWORD *)v21 + 2138) = a4;
  *((_DWORD *)v21 + 2203) = a4;
  *((_DWORD *)v21 + 2268) = (unint64_t)&v16[v17] >> 8;
}

- (unint64_t)tileHeight
{
  return *(unsigned int *)(*((void *)self->_impl + 246) + 3944);
}

- (unint64_t)tileWidth
{
  return *(unsigned int *)(*((void *)self->_impl + 246) + 3940);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9
{
  impl = self->_impl;
  impl[382] = impl[381];
  *((void *)impl + 11397) |= 0x40uLL;
  impl[16955] = a3;
  impl[16946] = a4 != 0;
  *((void *)impl + 11271) |= 0x20uLL;
  *((void *)impl + 11309) |= 0x40uLL;
  AGX::HWTessellationContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::drawPatches((uint64_t)(impl + 9088), (uint64_t)a2, (uint64_t)a4, a5, (uint64_t)a6, a7, (uint64_t)a8, a9);
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11
{
  impl = self->_impl;
  impl[382] = impl[381];
  *((void *)impl + 11397) |= 0x40uLL;
  impl[16955] = a3;
  impl[16946] = a6 != 0;
  impl[16944] = a11;
  *((void *)impl + 11271) |= 0x20uLL;
  *((void *)impl + 11309) |= 0x40uLL;
  AGX::HWTessellationContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::drawPatches((uint64_t)(impl + 9088), (uint64_t)a2, a4, a5, (uint64_t)a6, a7, (uint64_t)a8, a9, a10, a11);
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7
{
  impl = self->_impl;
  impl[382] = impl[381];
  *((void *)impl + 11397) |= 0x40uLL;
  impl[16955] = a3;
  impl[16946] = a4 != 0;
  *((void *)impl + 11271) |= 0x20uLL;
  *((void *)impl + 11309) |= 0x40uLL;
  AGX::HWTessellationContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::drawPatches((uint64_t)(impl + 9088), (uint64_t)a2, (uint64_t)a4, a5, 0, 0, (uint64_t)a6, a7);
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9
{
  impl = self->_impl;
  impl[382] = impl[381];
  *((void *)impl + 11397) |= 0x40uLL;
  impl[16955] = a3;
  impl[16946] = a6 != 0;
  impl[16944] = a9;
  *((void *)impl + 11271) |= 0x20uLL;
  *((void *)impl + 11309) |= 0x40uLL;
  AGX::HWTessellationContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::drawPatches((uint64_t)(impl + 9088), (uint64_t)a2, a4, a5, (uint64_t)a6, a7, 0, 0, a8, a9);
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5
{
  int v5 = a5;
  uint64_t v7 = (char *)self->_impl + 36360;
  uint64_t v8 = (int *)MEMORY[0x263F4B188];
  if (a3)
  {
    unint64_t v9 = (char *)a3 + (int)*MEMORY[0x263F4B188];
    uint64_t v10 = *((void *)v9 + 2);
    unint64_t v11 = *((void *)v9 + 1) + a4;
    unint64_t v12 = (unint64_t)(v10 + 3) >> 2;
  }
  else
  {
    unint64_t v11 = 0;
    LODWORD(v12) = 0;
  }
  if (*((void *)self->_impl + 4548) != v11 || *((_DWORD *)self->_impl + 9099) != a5)
  {
    *((void *)self->_impl + 4548) = v11;
    *((_DWORD *)v7 + 8) = v12;
    uint64_t v13 = *(void *)v7;
    unint64_t v14 = (void *)(*(void *)v7 + 90088);
    uint64_t v15 = (void *)(*(void *)v7 + 78464);
    uint64_t v16 = (_DWORD *)(*(void *)v7 + 68116);
    uint64_t v17 = (void *)(*(void *)v7 + 39272);
    if (a3)
    {
      uint64_t v18 = (char *)a3 + *v8;
      uint64_t v20 = v18[2];
      uint64_t v19 = v18[3];
      unint64_t v21 = v18[1];
      *(void *)(*(void *)v7 + 86208) = v21;
      v15[1228] = v19;
      v17[67] = v21 + a4;
      v17[132] = (v20 & 0xFFFFFFFFFFFFFFLL) - a4;
      *uint64_t v17 = v19 + a4;
      _DWORD *v16 = v20;
      v16[65] = v20;
      v16[130] = v21 >> 8;
      void *v15 = v18;
      AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource(*(void **)(v13 + 1592), (uint64_t)a3, 0, 0x23u);
      if (*(void *)(v13 + 1480)) {
        MTLResourceListAddResource();
      }
    }
    else
    {
      void *v15 = 0;
      v17[67] = 0;
      v17[132] = 0;
      *uint64_t v17 = 0;
      v15[968] = 0;
      v15[1228] = 0;
      _DWORD *v16 = 0;
      v16[65] = 0;
    }
    *v14 |= 0x800000000uLL;
    v14[6] |= 0x800000000uLL;
    v14[48] |= 0xC0uLL;
    *((_DWORD *)v7 + 9) = v5;
    if (*((id *)v7 + 9) != a3)
    {
      *((void *)v7 + 9) = a3;
      if (*(void *)(*(void *)v7 + 1480)) {
        MTLResourceListAddResource();
      }
      *((_DWORD *)v7 + 26) |= 2u;
    }
  }
}

- (void)setTessellationFactorScale:(float)a3
{
  uint64_t v3 = (char *)self->_impl + 36424;
  if (*(float *)v3 != a3)
  {
    *(float *)uint64_t v3 = a3;
    *((_DWORD *)v3 + 10) |= 1u;
  }
}

- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4
{
  char v4 = a4;
  impl = self->_impl;
  uint64_t v7 = (AGX::FenceList **)(impl + 11315);
  if (impl[185]) {
    MTLResourceListAddResource();
  }
  uint64_t v8 = (int *)MEMORY[0x263F4B168];
  if (v4)
  {
    if (!*v7) {
      operator new();
    }
    AGX::FenceList::insertFence(*v7, *(unsigned __int16 *)((char *)a3 + (int)*MEMORY[0x263F4B168]));
  }
  if ((v4 & 6) != 0)
  {
    unint64_t v9 = (AGX::FenceList *)impl[11316];
    if (!v9) {
      operator new();
    }
    AGX::FenceList::insertFence(v9, *(unsigned __int16 *)((char *)a3 + *v8));
  }
  if ((v4 & 8) != 0)
  {
    uint64_t v10 = (AGX::FenceList *)impl[11317];
    if (!v10) {
      operator new();
    }
    AGX::FenceList::insertFence(v10, *(unsigned __int16 *)((char *)a3 + *v8));
  }
  if ((v4 & 0x10) != 0)
  {
    unint64_t v11 = (AGX::FenceList *)impl[11318];
    if (!v11) {
      operator new();
    }
    unsigned int v12 = *(unsigned __int16 *)((char *)a3 + *v8);
    AGX::FenceList::insertFence(v11, v12);
  }
}

- (void)updateFence:(id)a3 afterStages:(unint64_t)a4
{
  char v4 = a4;
  impl = self->_impl;
  uint64_t v7 = (AGX::FenceList **)(impl + 11311);
  if (impl[185]) {
    MTLResourceListAddResource();
  }
  uint64_t v8 = (int *)MEMORY[0x263F4B168];
  if (v4)
  {
    if (!*v7) {
      operator new();
    }
    AGX::FenceList::insertFence(*v7, *(unsigned __int16 *)((char *)a3 + (int)*MEMORY[0x263F4B168]));
  }
  if ((v4 & 6) != 0)
  {
    unint64_t v9 = (AGX::FenceList *)impl[11312];
    if (!v9) {
      operator new();
    }
    AGX::FenceList::insertFence(v9, *(unsigned __int16 *)((char *)a3 + *v8));
  }
  if ((v4 & 8) != 0)
  {
    uint64_t v10 = (AGX::FenceList *)impl[11313];
    if (!v10) {
      operator new();
    }
    AGX::FenceList::insertFence(v10, *(unsigned __int16 *)((char *)a3 + *v8));
  }
  if ((v4 & 0x10) != 0)
  {
    unint64_t v11 = (AGX::FenceList *)impl[11314];
    if (!v11) {
      operator new();
    }
    unsigned int v12 = *(unsigned __int16 *)((char *)a3 + *v8);
    AGX::FenceList::insertFence(v11, v12);
  }
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8
{
  unsigned int v8 = a8;
  unsigned int v32 = a6;
  impl = (char *)self->_impl;
  unint64_t v14 = impl + 38641;
  *((_DWORD *)impl + 382) = *((_DWORD *)impl + 381);
  uint64_t v15 = (int *)MEMORY[0x263F4B188];
  if (((*(void *)(*((void *)impl + 4870) + 2024) | *(void *)(*((void *)impl + 4870) + 1976)) & 0x700000000000) != 0)
  {
    uint64_t v16 = (char *)a7 + (int)*MEMORY[0x263F4B188];
    uint64_t v17 = *((void *)v16 + 1);
    *((void *)impl + 11261) |= 0x700000000000uLL;
    *((void *)impl + 11309) |= 0x40uLL;
    *(int64x2_t *)(impl + 39880) = vaddq_s64(vdupq_n_s64(v17 + (unint64_t)a8), (int64x2_t)xmmword_242EA8740);
    *((int64x2_t *)impl + 2525) = vaddq_s64(*((int64x2_t *)impl + 2525), (int64x2_t)xmmword_242EA8750);
    *((void *)impl + 9817) = v16;
    *((void *)impl + 9818) = v16;
  }
  if (!*v14)
  {
    *unint64_t v14 = 1;
    *((void *)impl + 11309) |= 1uLL;
  }
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeISPPrimitiveType((uint64_t)impl, a3);
  uint64_t v18 = *v15;
  int64x2_t v31 = *(int64x2_t *)((char *)a5 + v18 + 8);
  if (*((id *)impl + 4833) != a5)
  {
    AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(*((void **)impl + 199), (uint64_t)a5, 1);
    IOGPUResourceListAddResource();
    if (*((void *)impl + 185)) {
      MTLResourceListAddResource();
    }
    *((void *)impl + 4833) = a5;
    uint64_t v18 = *v15;
  }
  uint64_t v19 = *(void *)((char *)a7 + v18 + 8);
  if (*((id *)impl + 4834) != a7)
  {
    AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(*((void **)impl + 199), (uint64_t)a7, 65);
    IOGPUResourceListAddResource();
    if (*((void *)impl + 185)) {
      MTLResourceListAddResource();
    }
    *((void *)impl + 4834) = a7;
  }
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeAndEmitRenderState((unint64_t)impl, *((void *)impl + 4870), *((void *)impl + 4871), (uint64_t)(impl + 38992), (uint64_t)(impl + 49184), (uint64_t)(impl + 90088), 0);
  if (*(unsigned char *)(*((void *)impl + 246) + 3908))
  {
    unsigned int v20 = (0x114u >> a3) & 1;
    if (a3 >= 9) {
      unsigned int v20 = 0;
    }
  }
  else
  {
    unsigned int v20 = impl[38643] != 0;
  }
  LODWORD(v21) = *((_DWORD *)impl + 9661);
  uint64_t v22 = v19 + v8;
  if (v21 >= 0xFFFF) {
    unsigned int v23 = 0xFFFF;
  }
  else {
    unsigned int v23 = *((_DWORD *)impl + 9661);
  }
  if (a4 == 1) {
    uint64_t v21 = v21;
  }
  else {
    uint64_t v21 = v23;
  }
  uint64_t v24 = (int8x8_t *)*((void *)impl + 8);
  *uint64_t v24 = (int8x8_t)((v21 << 32) | 0x40000001);
  *((void *)impl + 11397) |= 1uLL;
  unsigned int v25 = (AGX::VDMEncoderGen5<AGX::HAL200::ESLEncoder,AGX::HAL200::DeviceConstants,AGX::HAL200::VsStateConfig>::PrimitiveTypeToVDMCTRLTypeIndexedDrawIndirect[a3]
       + (a4 << 17)) & 0xFFEEFF00;
  if (v20) {
    int v26 = 0x10000;
  }
  else {
    int v26 = 0;
  }
  *((void *)impl + 8) = v24 + 4;
  int64x2_t v27 = vdupq_n_s64(3uLL);
  v24[2].i32[0] = WORD2(v22);
  v24[2].i32[1] = v22 & 0xFFFFFFFC;
  v27.i64[0] = v32;
  uint64x2_t v28 = (uint64x2_t)vaddq_s64(v31, v27);
  __int32 v29 = v28.i32[0];
  int v30 = v28.u8[4] | v26 | v25 | 0x100000;
  *(int32x2_t *)v28.i8 = vmovn_s64((int64x2_t)vshlq_u64(v28, (uint64x2_t)xmmword_242EA80E0));
  v24[1].i32[0] = v30;
  v24[1].i32[1] = v29;
  v24[3] = vext_s8((int8x8_t)vadd_s32(*(int32x2_t *)v28.i8, (int32x2_t)-1), (int8x8_t)v28.u8[0], 4uLL);
  ++*((_DWORD *)impl + 381);
  impl[1544] = 0;
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  unsigned int v5 = a5;
  impl = (char *)self->_impl;
  *((_DWORD *)impl + 382) = *((_DWORD *)impl + 381);
  uint64_t v10 = (int *)MEMORY[0x263F4B188];
  if (((*(void *)(*((void *)impl + 4870) + 2024) | *(void *)(*((void *)impl + 4870) + 1976)) & 0x700000000000) != 0)
  {
    unint64_t v11 = impl + 78536;
    *((void *)impl + 11261) |= 0x700000000000uLL;
    *((void *)impl + 11309) |= 0x40uLL;
    unsigned int v12 = (char *)a4 + *v10;
    uint64_t v13 = *((void *)v12 + 1) + a5;
    *((void *)impl + 4986) = v13 + 12;
    *((void *)impl + 5051) = (*((void *)v12 + 2) & 0xFFFFFFFFFFFFFFLL) - a5 - 12;
    *((void *)impl + 9818) = v12;
    if (impl[38496])
    {
      *((void *)impl + 4985) = v13 + 8;
      *((void *)impl + 5050) = (*((void *)v12 + 2) & 0xFFFFFFFFFFFFFFLL) - a5 - 8;
LABEL_7:
      void *v11 = v12;
      goto LABEL_8;
    }
    unint64_t v14 = (_DWORD *)*((void *)impl + 20);
    uint64_t v15 = v14 + 1;
    if ((unint64_t)(v14 + 1) > *((void *)impl + 19))
    {
      int v21 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 16, 3, 0);
      unint64_t v14 = (_DWORD *)*((void *)impl + 20);
      if (!v21)
      {
        unint64_t v11 = impl + 78536;
        goto LABEL_6;
      }
      uint64_t v15 = v14 + 1;
      unint64_t v11 = impl + 78536;
      if ((unint64_t)(v14 + 1) > *((void *)impl + 19)) {
        abort();
      }
    }
    *((void *)impl + 21) = v15;
LABEL_6:
    uint64_t v16 = (char *)v14 + *((void *)impl + 22);
    *unint64_t v14 = 0;
    *((void *)impl + 20) = v14 + 1;
    *((void *)impl + 4985) = v16;
    *((void *)impl + 5050) = 1;
    unsigned int v12 = (char *)(*(void *)(*((void *)impl + 5) + 224) + *v10);
    goto LABEL_7;
  }
LABEL_8:
  if (impl[38641])
  {
    impl[38641] = 0;
    *((void *)impl + 11309) |= 1uLL;
  }
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeISPPrimitiveType((uint64_t)impl, a3);
  uint64_t v17 = *(void *)((char *)a4 + *v10 + 8);
  if (*((id *)impl + 4834) != a4)
  {
    AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(*((void **)impl + 199), (uint64_t)a4, 65);
    IOGPUResourceListAddResource();
    if (*((void *)impl + 185)) {
      MTLResourceListAddResource();
    }
    *((void *)impl + 4834) = a4;
  }
  uint64_t v18 = v17 + v5;
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeAndEmitRenderState((unint64_t)impl, *((void *)impl + 4870), *((void *)impl + 4871), (uint64_t)(impl + 38992), (uint64_t)(impl + 49184), (uint64_t)(impl + 90088), 0);
  *((void *)impl + 11397) |= 1uLL;
  uint64_t v19 = v18 & 0xFFFF00000000 | AGX::VDMEncoderGen5<AGX::HAL200::ESLEncoder,AGX::HAL200::DeviceConstants,AGX::HAL200::VsStateConfig>::PrimitiveTypeToVDMCTRLTypeNonIndexedDrawIndirect[a3];
  uint64_t v20 = *((void *)impl + 8);
  *((void *)impl + 8) = v20 + 12;
  *(void *)uint64_t v20 = v19;
  *(_DWORD *)(v20 + 8) = v18 & 0xFFFFFFFC;
  ++*((_DWORD *)impl + 381);
  impl[1544] = 0;
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  int v34 = a8;
  unsigned int v32 = a7;
  unsigned int v12 = a4;
  impl = (char *)self->_impl;
  *((_DWORD *)impl + 382) = *((_DWORD *)impl + 381);
  uint64_t v15 = (int *)MEMORY[0x263F4B188];
  if (((*(void *)(*((void *)impl + 4870) + 2024) | *(void *)(*((void *)impl + 4870) + 1976)) & 0x700000000000) != 0)
  {
    *((void *)impl + 11261) |= 0x700000000000uLL;
    *((void *)impl + 11309) |= 0x40uLL;
    *((void *)impl + 4987) = a10;
    uint64_t v16 = (_DWORD *)*((void *)impl + 20);
    uint64_t v17 = v16 + 2;
    if ((unint64_t)(v16 + 2) > *((void *)impl + 19))
    {
      int v30 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 16, 3, 0);
      uint64_t v16 = (_DWORD *)*((void *)impl + 20);
      if (!v30) {
        goto LABEL_4;
      }
      uint64_t v17 = v16 + 2;
      if ((unint64_t)(v16 + 2) > *((void *)impl + 19)) {
        abort();
      }
    }
    *((void *)impl + 21) = v17;
LABEL_4:
    uint64_t v18 = (char *)v16 + *((void *)impl + 22);
    *((void *)impl + 20) = v16 + 2;
    *((void *)impl + 4985) = v18;
    *((void *)impl + 4986) = v18 + 4;
    _DWORD *v16 = a9;
    v16[1] = a10;
    uint64_t v19 = *(void *)(*((void *)impl + 5) + 224) + *v15;
    *((void *)impl + 9817) = v19;
    *((void *)impl + 9818) = v19;
  }
  if (!impl[38641])
  {
    impl[38641] = 1;
    *((void *)impl + 11309) |= 1uLL;
  }
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeISPPrimitiveType((uint64_t)impl, a3);
  int64x2_t v31 = *(int64x2_t *)((char *)a6 + *v15 + 8);
  if (*((id *)impl + 4833) != a6)
  {
    AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(*((void **)impl + 199), (uint64_t)a6, 1);
    IOGPUResourceListAddResource();
    if (*((void *)impl + 185)) {
      MTLResourceListAddResource();
    }
    *((void *)impl + 4833) = a6;
  }
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeAndEmitRenderState((unint64_t)impl, *((void *)impl + 4870), *((void *)impl + 4871), (uint64_t)(impl + 38992), (uint64_t)(impl + 49184), (uint64_t)(impl + 90088), 0);
  if (*(unsigned char *)(*((void *)impl + 246) + 3908))
  {
    unsigned int v20 = (0x114u >> a3) & 1;
    if (a3 >= 9) {
      unsigned int v20 = 0;
    }
  }
  else
  {
    unsigned int v20 = impl[38643] != 0;
  }
  LODWORD(v21) = *((_DWORD *)impl + 9661);
  if (v21 >= 0xFFFF) {
    unsigned int v22 = 0xFFFF;
  }
  else {
    unsigned int v22 = *((_DWORD *)impl + 9661);
  }
  if (a5 == 1) {
    uint64_t v21 = v21;
  }
  else {
    uint64_t v21 = v22;
  }
  uint64_t v23 = *((void *)impl + 8);
  *(void *)uint64_t v23 = (v21 << 32) | 0x40000001;
  unsigned int v24 = (AGX::VDMEncoderGen5<AGX::HAL200::ESLEncoder,AGX::HAL200::DeviceConstants,AGX::HAL200::VsStateConfig>::PrimitiveTypeToVDMCTRLTypeIndexedDraw[a3]
       + (a5 << 17)) & 0xFFEEFF00;
  if (v20) {
    int v25 = 0x10000;
  }
  else {
    int v25 = 0;
  }
  *(_DWORD *)(v23 + 16) = v12;
  *(_DWORD *)(v23 + 20) = v34;
  *(_DWORD *)(v23 + 24) = a9;
  int64x2_t v26 = vdupq_n_s64(3uLL);
  v26.i64[0] = v32;
  uint64x2_t v27 = (uint64x2_t)vaddq_s64(v31, v26);
  __int32 v28 = v27.i32[0];
  int v29 = v27.u8[4] | v25 | v24 | 0x100000;
  *(int32x2_t *)v27.i8 = vmovn_s64((int64x2_t)vshlq_u64(v27, (uint64x2_t)xmmword_242EA80E0));
  *(_DWORD *)(v23 + 8) = v29;
  *(_DWORD *)(v23 + 12) = v28;
  *(int8x8_t *)(v23 + 28) = vext_s8((int8x8_t)vadd_s32(*(int32x2_t *)v27.i8, (int32x2_t)-1), (int8x8_t)v27.u8[0], 4uLL);
  *((void *)impl + 8) = v23 + 36;
  ++*((_DWORD *)impl + 381);
  switch((int)a3)
  {
    case 1:
      v12 >>= 1;
      break;
    case 2:
      --v12;
      break;
    case 3:
    case 9:
      v12 /= 3u;
      break;
    case 4:
    case 6:
      v12 -= 2;
      break;
    case 7:
      v12 >>= 2;
      break;
    case 8:
      unsigned int v12 = ((v12 - 4) >> 1) + 1;
      break;
    default:
      break;
  }
  *((_DWORD *)impl + 385) += v12 * v34;
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8
{
  int v8 = a8;
  unsigned int v11 = a4;
  unsigned int v32 = a7;
  impl = (char *)self->_impl;
  *((_DWORD *)impl + 382) = *((_DWORD *)impl + 381);
  uint64_t v15 = (int *)MEMORY[0x263F4B188];
  if (((*(void *)(*((void *)impl + 4870) + 2024) | *(void *)(*((void *)impl + 4870) + 1976)) & 0x700000000000) != 0)
  {
    *((void *)impl + 11261) |= 0x700000000000uLL;
    *((void *)impl + 11309) |= 0x40uLL;
    *((void *)impl + 4987) = 0;
    uint64_t v16 = (void *)*((void *)impl + 20);
    uint64_t v17 = v16 + 1;
    if ((unint64_t)(v16 + 1) > *((void *)impl + 19))
    {
      int v30 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 16, 3, 0);
      uint64_t v16 = (void *)*((void *)impl + 20);
      if (!v30) {
        goto LABEL_4;
      }
      uint64_t v17 = v16 + 1;
      if ((unint64_t)(v16 + 1) > *((void *)impl + 19)) {
        abort();
      }
    }
    *((void *)impl + 21) = v17;
LABEL_4:
    uint64_t v18 = (char *)v16 + *((void *)impl + 22);
    *((void *)impl + 20) = v16 + 1;
    *((void *)impl + 4985) = v18;
    *((void *)impl + 4986) = v18 + 4;
    void *v16 = 0;
    uint64_t v19 = *(void *)(*((void *)impl + 5) + 224) + *v15;
    *((void *)impl + 9817) = v19;
    *((void *)impl + 9818) = v19;
  }
  if (!impl[38641])
  {
    impl[38641] = 1;
    *((void *)impl + 11309) |= 1uLL;
  }
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeISPPrimitiveType((uint64_t)impl, a3);
  int64x2_t v31 = *(int64x2_t *)((char *)a6 + *v15 + 8);
  if (*((id *)impl + 4833) != a6)
  {
    AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(*((void **)impl + 199), (uint64_t)a6, 1);
    IOGPUResourceListAddResource();
    if (*((void *)impl + 185)) {
      MTLResourceListAddResource();
    }
    *((void *)impl + 4833) = a6;
  }
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeAndEmitRenderState((unint64_t)impl, *((void *)impl + 4870), *((void *)impl + 4871), (uint64_t)(impl + 38992), (uint64_t)(impl + 49184), (uint64_t)(impl + 90088), 0);
  if (*(unsigned char *)(*((void *)impl + 246) + 3908))
  {
    unsigned int v20 = (0x114u >> a3) & 1;
    if (a3 >= 9) {
      unsigned int v20 = 0;
    }
  }
  else
  {
    unsigned int v20 = impl[38643] != 0;
  }
  LODWORD(v21) = *((_DWORD *)impl + 9661);
  if (v21 >= 0xFFFF) {
    unsigned int v22 = 0xFFFF;
  }
  else {
    unsigned int v22 = *((_DWORD *)impl + 9661);
  }
  if (a5 == 1) {
    uint64_t v21 = v21;
  }
  else {
    uint64_t v21 = v22;
  }
  uint64_t v23 = *((void *)impl + 8);
  *(void *)uint64_t v23 = (v21 << 32) | 0x40000001;
  unsigned int v24 = (AGX::VDMEncoderGen5<AGX::HAL200::ESLEncoder,AGX::HAL200::DeviceConstants,AGX::HAL200::VsStateConfig>::PrimitiveTypeToVDMCTRLTypeIndexedDraw[a3]
       + (a5 << 17)) & 0xFFEEFF00;
  if (v20) {
    int v25 = 0x10000;
  }
  else {
    int v25 = 0;
  }
  *(_DWORD *)(v23 + 16) = v11;
  *(_DWORD *)(v23 + 20) = v8;
  *(_DWORD *)(v23 + 24) = 0;
  int64x2_t v26 = vdupq_n_s64(3uLL);
  v26.i64[0] = v32;
  uint64x2_t v27 = (uint64x2_t)vaddq_s64(v31, v26);
  __int32 v28 = v27.i32[0];
  int v29 = v27.u8[4] | v25 | v24 | 0x100000;
  *(int32x2_t *)v27.i8 = vmovn_s64((int64x2_t)vshlq_u64(v27, (uint64x2_t)xmmword_242EA80E0));
  *(_DWORD *)(v23 + 8) = v29;
  *(_DWORD *)(v23 + 12) = v28;
  *(int8x8_t *)(v23 + 28) = vext_s8((int8x8_t)vadd_s32(*(int32x2_t *)v27.i8, (int32x2_t)-1), (int8x8_t)v27.u8[0], 4uLL);
  *((void *)impl + 8) = v23 + 36;
  ++*((_DWORD *)impl + 381);
  switch((int)a3)
  {
    case 1:
      v11 >>= 1;
      break;
    case 2:
      --v11;
      break;
    case 3:
    case 9:
      v11 /= 3u;
      break;
    case 4:
    case 6:
      v11 -= 2;
      break;
    case 7:
      v11 >>= 2;
      break;
    case 8:
      unsigned int v11 = ((v11 - 4) >> 1) + 1;
      break;
    default:
      break;
  }
  *((_DWORD *)impl + 385) += v11 * v8;
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7
{
  unsigned int v31 = a7;
  unsigned int v9 = a4;
  impl = (char *)self->_impl;
  *((_DWORD *)impl + 382) = *((_DWORD *)impl + 381);
  uint64_t v13 = (int *)MEMORY[0x263F4B188];
  if (((*(void *)(*((void *)impl + 4870) + 2024) | *(void *)(*((void *)impl + 4870) + 1976)) & 0x700000000000) != 0)
  {
    *((void *)impl + 11261) |= 0x700000000000uLL;
    *((void *)impl + 11309) |= 0x40uLL;
    *((void *)impl + 4987) = 0;
    unint64_t v14 = (void *)*((void *)impl + 20);
    uint64_t v15 = v14 + 1;
    if ((unint64_t)(v14 + 1) > *((void *)impl + 19))
    {
      int v29 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 16, 3, 0);
      unint64_t v14 = (void *)*((void *)impl + 20);
      if (!v29) {
        goto LABEL_4;
      }
      uint64_t v15 = v14 + 1;
      if ((unint64_t)(v14 + 1) > *((void *)impl + 19)) {
        abort();
      }
    }
    *((void *)impl + 21) = v15;
LABEL_4:
    uint64_t v16 = (char *)v14 + *((void *)impl + 22);
    *((void *)impl + 20) = v14 + 1;
    *((void *)impl + 4985) = v16;
    *((void *)impl + 4986) = v16 + 4;
    *unint64_t v14 = 0;
    uint64_t v17 = *(void *)(*((void *)impl + 5) + 224) + *v13;
    *((void *)impl + 9817) = v17;
    *((void *)impl + 9818) = v17;
  }
  if (!impl[38641])
  {
    impl[38641] = 1;
    *((void *)impl + 11309) |= 1uLL;
  }
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeISPPrimitiveType((uint64_t)impl, a3);
  int64x2_t v30 = *(int64x2_t *)((char *)a6 + *v13 + 8);
  if (*((id *)impl + 4833) != a6)
  {
    AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(*((void **)impl + 199), (uint64_t)a6, 1);
    IOGPUResourceListAddResource();
    if (*((void *)impl + 185)) {
      MTLResourceListAddResource();
    }
    *((void *)impl + 4833) = a6;
  }
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeAndEmitRenderState((unint64_t)impl, *((void *)impl + 4870), *((void *)impl + 4871), (uint64_t)(impl + 38992), (uint64_t)(impl + 49184), (uint64_t)(impl + 90088), 0);
  if (*(unsigned char *)(*((void *)impl + 246) + 3908))
  {
    unsigned int v18 = (0x114u >> a3) & 1;
    if (a3 >= 9) {
      unsigned int v18 = 0;
    }
  }
  else
  {
    unsigned int v18 = impl[38643] != 0;
  }
  LODWORD(v19) = *((_DWORD *)impl + 9661);
  if (v19 >= 0xFFFF) {
    unsigned int v20 = 0xFFFF;
  }
  else {
    unsigned int v20 = *((_DWORD *)impl + 9661);
  }
  if (a5 == 1) {
    uint64_t v19 = v19;
  }
  else {
    uint64_t v19 = v20;
  }
  uint64_t v21 = *((void *)impl + 8);
  *(void *)uint64_t v21 = (v19 << 32) | 0x40000001;
  unsigned int v22 = (AGX::VDMEncoderGen5<AGX::HAL200::ESLEncoder,AGX::HAL200::DeviceConstants,AGX::HAL200::VsStateConfig>::PrimitiveTypeToVDMCTRLTypeIndexedDraw[a3]
       + (a5 << 17)) & 0xFFEEFF00;
  if (v18) {
    int v23 = 0x10000;
  }
  else {
    int v23 = 0;
  }
  *(_DWORD *)(v21 + 16) = v9;
  *(void *)(v21 + 20) = 1;
  int64x2_t v24 = vdupq_n_s64(3uLL);
  v24.i64[0] = v31;
  uint64x2_t v25 = (uint64x2_t)vaddq_s64(v30, v24);
  __int32 v26 = v25.i32[0];
  int v27 = v25.u8[4] | v23 | v22 | 0x100000;
  *(int32x2_t *)v25.i8 = vmovn_s64((int64x2_t)vshlq_u64(v25, (uint64x2_t)xmmword_242EA80E0));
  *(_DWORD *)(v21 + 8) = v27;
  *(_DWORD *)(v21 + 12) = v26;
  *(int8x8_t *)(v21 + 28) = vext_s8((int8x8_t)vadd_s32(*(int32x2_t *)v25.i8, (int32x2_t)-1), (int8x8_t)v25.u8[0], 4uLL);
  *((void *)impl + 8) = v21 + 36;
  ++*((_DWORD *)impl + 381);
  __int32 v28 = self;
  switch((int)a3)
  {
    case 1:
      v9 >>= 1;
      break;
    case 2:
      --v9;
      break;
    case 3:
    case 9:
      v9 /= 3u;
      break;
    case 4:
    case 6:
      v9 -= 2;
      break;
    case 5:
      break;
    case 7:
      v9 >>= 2;
      break;
    case 8:
      unsigned int v9 = ((v9 - 4) >> 1) + 1;
      break;
    default:
      __int32 v28 = self;
      break;
  }
  *((_DWORD *)impl + 385) += v9;
  *((_DWORD *)v28->_impl + 383) = *((_DWORD *)v28->_impl + 381);
}

- (BOOL)isMemorylessRender
{
  return *(unsigned char *)(*((void *)self->_impl + 246) + 3965);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  unsigned int v21 = a6;
  unsigned int v7 = a5;
  unsigned int v8 = a4;
  impl = (char *)self->_impl;
  *((_DWORD *)impl + 382) = *((_DWORD *)impl + 381);
  if (impl[38496]) {
    int v12 = a4;
  }
  else {
    int v12 = 0;
  }
  if (((*(void *)(*((void *)impl + 4870) + 2024) | *(void *)(*((void *)impl + 4870) + 1976)) & 0x700000000000) != 0)
  {
    int v13 = a7;
    *((void *)impl + 11261) |= 0x700000000000uLL;
    *((void *)impl + 11309) |= 0x40uLL;
    *((void *)impl + 4987) = a7;
    unint64_t v14 = (_DWORD *)*((void *)impl + 20);
    uint64_t v15 = v14 + 2;
    if ((unint64_t)(v14 + 2) > *((void *)impl + 19))
    {
      int v20 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 16, 3, 0);
      unint64_t v14 = (_DWORD *)*((void *)impl + 20);
      if (!v20) {
        goto LABEL_7;
      }
      uint64_t v15 = v14 + 2;
      if ((unint64_t)(v14 + 2) > *((void *)impl + 19)) {
        abort();
      }
    }
    *((void *)impl + 21) = v15;
LABEL_7:
    uint64_t v16 = (char *)v14 + *((void *)impl + 22);
    *((void *)impl + 20) = v14 + 2;
    *((void *)impl + 4985) = v16;
    *((void *)impl + 4986) = v16 + 4;
    *unint64_t v14 = v12;
    v14[1] = v13;
    uint64_t v17 = *(void *)(*((void *)impl + 5) + 224) + (int)*MEMORY[0x263F4B188];
    *((void *)impl + 9817) = v17;
    *((void *)impl + 9818) = v17;
  }
  if (impl[38641])
  {
    impl[38641] = 0;
    *((void *)impl + 11309) |= 1uLL;
  }
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeISPPrimitiveType((uint64_t)impl, a3);
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeAndEmitRenderState((unint64_t)impl, *((void *)impl + 4870), *((void *)impl + 4871), (uint64_t)(impl + 38992), (uint64_t)(impl + 49184), (uint64_t)(impl + 90088), 0);
  LODWORD(v18) = AGX::VDMEncoderGen5<AGX::HAL200::ESLEncoder,AGX::HAL200::DeviceConstants,AGX::HAL200::VsStateConfig>::PrimitiveTypeToVDMCTRLTypeNonIndexedDraw[a3] & 0xFFFEFFFF;
  DWORD1(v18) = v7;
  *((void *)&v18 + 1) = __PAIR64__(v8, v21);
  uint64_t v19 = (_OWORD *)*((void *)impl + 8);
  *uint64_t v19 = v18;
  *((void *)impl + 8) = v19 + 1;
  ++*((_DWORD *)impl + 381);
  switch((int)a3)
  {
    case 1:
      v7 >>= 1;
      break;
    case 2:
      --v7;
      break;
    case 3:
    case 9:
      v7 /= 3u;
      break;
    case 4:
    case 6:
      v7 -= 2;
      break;
    case 7:
      v7 >>= 2;
      break;
    case 8:
      unsigned int v7 = ((v7 - 4) >> 1) + 1;
      break;
    default:
      break;
  }
  *((_DWORD *)impl + 385) += v7 * v21;
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6
{
  unsigned int v6 = a6;
  unsigned int v7 = a5;
  unsigned int v8 = a4;
  impl = (char *)self->_impl;
  *((_DWORD *)impl + 382) = *((_DWORD *)impl + 381);
  if (impl[38496]) {
    int v12 = a4;
  }
  else {
    int v12 = 0;
  }
  if (((*(void *)(*((void *)impl + 4870) + 2024) | *(void *)(*((void *)impl + 4870) + 1976)) & 0x700000000000) != 0)
  {
    *((void *)impl + 11261) |= 0x700000000000uLL;
    *((void *)impl + 11309) |= 0x40uLL;
    *((void *)impl + 4987) = 0;
    int v13 = (_DWORD *)*((void *)impl + 20);
    unint64_t v14 = v13 + 2;
    if ((unint64_t)(v13 + 2) > *((void *)impl + 19))
    {
      int v19 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 16, 3, 0);
      int v13 = (_DWORD *)*((void *)impl + 20);
      if (!v19) {
        goto LABEL_7;
      }
      unint64_t v14 = v13 + 2;
      if ((unint64_t)(v13 + 2) > *((void *)impl + 19)) {
        abort();
      }
    }
    *((void *)impl + 21) = v14;
LABEL_7:
    uint64_t v15 = (char *)v13 + *((void *)impl + 22);
    *((void *)impl + 20) = v13 + 2;
    *((void *)impl + 4985) = v15;
    *((void *)impl + 4986) = v15 + 4;
    *int v13 = v12;
    v13[1] = 0;
    uint64_t v16 = *(void *)(*((void *)impl + 5) + 224) + (int)*MEMORY[0x263F4B188];
    *((void *)impl + 9817) = v16;
    *((void *)impl + 9818) = v16;
  }
  if (impl[38641])
  {
    impl[38641] = 0;
    *((void *)impl + 11309) |= 1uLL;
  }
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeISPPrimitiveType((uint64_t)impl, a3);
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeAndEmitRenderState((unint64_t)impl, *((void *)impl + 4870), *((void *)impl + 4871), (uint64_t)(impl + 38992), (uint64_t)(impl + 49184), (uint64_t)(impl + 90088), 0);
  LODWORD(v17) = AGX::VDMEncoderGen5<AGX::HAL200::ESLEncoder,AGX::HAL200::DeviceConstants,AGX::HAL200::VsStateConfig>::PrimitiveTypeToVDMCTRLTypeNonIndexedDraw[a3] & 0xFFFEFFFF;
  DWORD1(v17) = v7;
  *((void *)&v17 + 1) = __PAIR64__(v8, v6);
  long long v18 = (_OWORD *)*((void *)impl + 8);
  *long long v18 = v17;
  *((void *)impl + 8) = v18 + 1;
  ++*((_DWORD *)impl + 381);
  switch((int)a3)
  {
    case 1:
      v7 >>= 1;
      break;
    case 2:
      --v7;
      break;
    case 3:
    case 9:
      v7 /= 3u;
      break;
    case 4:
    case 6:
      v7 -= 2;
      break;
    case 7:
      v7 >>= 2;
      break;
    case 8:
      unsigned int v7 = ((v7 - 4) >> 1) + 1;
      break;
    default:
      break;
  }
  *((_DWORD *)impl + 385) += v7 * v6;
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  unsigned int v5 = a5;
  int v6 = a4;
  impl = (char *)self->_impl;
  *((_DWORD *)impl + 382) = *((_DWORD *)impl + 381);
  if (impl[38496]) {
    int v10 = a4;
  }
  else {
    int v10 = 0;
  }
  if (((*(void *)(*((void *)impl + 4870) + 2024) | *(void *)(*((void *)impl + 4870) + 1976)) & 0x700000000000) != 0)
  {
    *((void *)impl + 11261) |= 0x700000000000uLL;
    *((void *)impl + 11309) |= 0x40uLL;
    *((void *)impl + 4987) = 0;
    unsigned int v11 = (_DWORD *)*((void *)impl + 20);
    int v12 = v11 + 2;
    if ((unint64_t)(v11 + 2) > *((void *)impl + 19))
    {
      int v17 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 16, 3, 0);
      unsigned int v11 = (_DWORD *)*((void *)impl + 20);
      if (!v17) {
        goto LABEL_7;
      }
      int v12 = v11 + 2;
      if ((unint64_t)(v11 + 2) > *((void *)impl + 19)) {
        abort();
      }
    }
    *((void *)impl + 21) = v12;
LABEL_7:
    int v13 = (char *)v11 + *((void *)impl + 22);
    *((void *)impl + 20) = v11 + 2;
    *((void *)impl + 4985) = v13;
    *((void *)impl + 4986) = v13 + 4;
    _DWORD *v11 = v10;
    v11[1] = 0;
    uint64_t v14 = *(void *)(*((void *)impl + 5) + 224) + (int)*MEMORY[0x263F4B188];
    *((void *)impl + 9817) = v14;
    *((void *)impl + 9818) = v14;
  }
  if (impl[38641])
  {
    impl[38641] = 0;
    *((void *)impl + 11309) |= 1uLL;
  }
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeISPPrimitiveType((uint64_t)impl, a3);
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeAndEmitRenderState((unint64_t)impl, *((void *)impl + 4870), *((void *)impl + 4871), (uint64_t)(impl + 38992), (uint64_t)(impl + 49184), (uint64_t)(impl + 90088), 0);
  DWORD2(v15) = 1;
  LODWORD(v15) = AGX::VDMEncoderGen5<AGX::HAL200::ESLEncoder,AGX::HAL200::DeviceConstants,AGX::HAL200::VsStateConfig>::PrimitiveTypeToVDMCTRLTypeNonIndexedDraw[a3] & 0xFFFEFFFF;
  DWORD1(v15) = v5;
  HIDWORD(v15) = v6;
  uint64_t v16 = (_OWORD *)*((void *)impl + 8);
  _OWORD *v16 = v15;
  *((void *)impl + 8) = v16 + 1;
  ++*((_DWORD *)impl + 381);
  switch((int)a3)
  {
    case 1:
      v5 >>= 1;
      break;
    case 2:
      --v5;
      break;
    case 3:
    case 9:
      v5 /= 3u;
      break;
    case 4:
    case 6:
      v5 -= 2;
      break;
    case 7:
      v5 >>= 2;
      break;
    case 8:
      unsigned int v5 = ((v5 - 4) >> 1) + 1;
      break;
    default:
      break;
  }
  *((_DWORD *)impl + 385) += v5;
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)setStencilCleared
{
  impl = self->_impl;
  if ((impl[4802] & 4) == 0) {
    *(_WORD *)(impl[246] + 4378) |= 4u;
  }
}

- (void)setDepthCleared
{
  impl = self->_impl;
  if ((impl[4802] & 1) == 0) {
    *(_WORD *)(impl[246] + 4378) |= 1u;
  }
}

- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7
{
  unsigned int v7 = a6;
  unsigned int v8 = a5;
  unsigned int v9 = a4;
  impl = self->_impl;
  long long v11 = 0uLL;
  if (a3)
  {
    uint64_t v12 = *((void *)a3 + 67);
    if (v12) {
      long long v11 = *(_OWORD *)(v12 + 496);
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = impl[246];
  uint64_t v14 = impl[185];
  long long v15 = (void *)impl[199];
  *(void *)(v13 + 5152) = a3;
  *(_OWORD *)(v13 + 5160) = v11;
  *(void *)(v13 + 5184) = v12;
  uint64_t v16 = *(void *)(v12 + 208);
  unsigned int v17 = *(_DWORD *)(v16 + 24);
  if (*(_DWORD *)(v12 + 236))
  {
    unsigned int v18 = v17 >= 2 && *(_DWORD *)(v16 + 80) != 0;
    uint64_t GPUVirtualAddress = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getGPUVirtualAddress(v12, a4, 0, v8, v18);
    unsigned int v20 = 0;
    *(void *)(v13 + 5096) = GPUVirtualAddress;
    uint64_t v21 = *(void *)(v13 + 5184);
    uint64_t v22 = *(void *)(v21 + 208);
    if (*(_DWORD *)(v22 + 24) >= 2u) {
      unsigned int v20 = *(_DWORD *)(v22 + 80) != 0;
    }
    *(void *)(v13 + 5112) = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getLevelOffset<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)0>(v21, v7, v20);
  }
  else
  {
    unsigned int v23 = v17 >= 2 && *(_DWORD *)(v16 + 80) != 0;
    *(void *)(v13 + 5096) = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getGPUVirtualAddress(v12, a4, a6, v8, v23);
  }
  *(_DWORD *)(v13 + 5124) = 1;
  if (v14) {
    MTLResourceListAddResource();
  }
  AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(v15, *(void *)(v13 + 5152), 12);
  IOGPUResourceListAddResource();
  if (*(void *)(v13 + 5160)) {
    IOGPUResourceListAddResource();
  }
  if (*(void *)(v13 + 5168)) {
    IOGPUResourceListAddResource();
  }
  uint64_t v24 = *(void *)(v12 + 488);
  if (v24 && *(_DWORD *)(v24 + 1080) > v7)
  {
    uint64_t v25 = *(void *)(v12 + 208);
    BOOL v26 = *(_DWORD *)(v25 + 24) >= 2u && *(_DWORD *)(v25 + 80) != 0;
    *(void *)(v13 + 5240) = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getGPUVirtualAddress(v24 + 536 * v26, v9, v7, v8, 0);
  }
  if (!*(void *)(impl[187] + 520))
  {
    if (*(unsigned char *)(impl[246] + 3965) || *((unsigned char *)impl + 36652)) {
      fwrite("Failed to satisfy render split.\n", 0x20uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    }
    AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::restartRenderPass((uint64_t)impl, impl + 11309, 0, 1);
  }
}

- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7
{
  unsigned int v7 = a6;
  unsigned int v8 = a5;
  unsigned int v9 = a4;
  impl = self->_impl;
  long long v11 = 0uLL;
  if (a3)
  {
    uint64_t v12 = *((void *)a3 + 67);
    if (v12) {
      long long v11 = *(_OWORD *)(v12 + 496);
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = impl[246];
  uint64_t v14 = impl[185];
  long long v15 = (void *)impl[199];
  *(void *)(v13 + 5128) = a3;
  *(_OWORD *)(v13 + 5136) = v11;
  *(void *)(v13 + 5176) = v12;
  if (*(_DWORD *)(v12 + 236))
  {
    *(void *)(v13 + 5088) = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getGPUVirtualAddress(v12, a4, 0, a5, 0);
    *(void *)(v13 + 5104) = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getLevelOffset<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)0>(*(void *)(v13 + 5176), v7, v8);
  }
  else
  {
    *(void *)(v13 + 5088) = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getGPUVirtualAddress(v12, a4, a6, a5, 0);
  }
  *(_DWORD *)(v13 + 5120) = 1;
  if (v14) {
    MTLResourceListAddResource();
  }
  AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(v15, *(void *)(v13 + 5128), 12);
  IOGPUResourceListAddResource();
  if (*(void *)(v13 + 5136)) {
    IOGPUResourceListAddResource();
  }
  if (*(void *)(v13 + 5144)) {
    IOGPUResourceListAddResource();
  }
  uint64_t v16 = *(void *)(v12 + 488);
  if (v16 && *(_DWORD *)(v16 + 1080) > v7) {
    *(void *)(v13 + 5232) = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getGPUVirtualAddress(v16, v9, v7, v8, 0);
  }
  if (!*(void *)(impl[187] + 520))
  {
    if (*(unsigned char *)(impl[246] + 3965) || *((unsigned char *)impl + 36652)) {
      fwrite("Failed to satisfy render split.\n", 0x20uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    }
    AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::restartRenderPass((uint64_t)impl, impl + 11309, 0, 1);
  }
}

- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7 atIndex:(unint64_t)a8
{
  impl = self->_impl;
  long long v9 = 0uLL;
  if (a3)
  {
    uint64_t v10 = *((void *)a3 + 67);
    if (v10) {
      long long v9 = *(_OWORD *)(v10 + 496);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  long long v11 = (_DWORD *)impl[246];
  uint64_t v12 = impl[185];
  *(void *)&v11[2 * a8 + 628] = v10;
  uint64_t v13 = v11 + 560;
  int v14 = 3 * a8;
  *(void *)&v13[2 * (3 * a8)] = a3;
  *(void *)&v13[2 * (3 * a8 + 1)] = v9;
  uint64_t v15 = (3 * a8 + 2);
  *(void *)&v11[2 * v15 + 560] = *((void *)&v9 + 1);
  v11[990] |= 1 << a8;
  AGX::Framebuffer<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::configurePBE((uint64_t)v11, v10, a5, a6, a4, (uint64_t)(v11 + 102), (uint64_t)&v11[a8 + 102], a8, 1, (v11[994] & (1 << a8)) != 0, a7, (v11[1230] & (1 << a8)) != 0);
  IOGPUResourceListAddResource();
  if (*(void *)&v13[2 * (v14 + 1)]) {
    IOGPUResourceListAddResource();
  }
  if (*(void *)&v13[2 * v15]) {
    IOGPUResourceListAddResource();
  }
  if (v12) {
    MTLResourceListAddResource();
  }
  if (!*(void *)(impl[187] + 520))
  {
    if (*(unsigned char *)(impl[246] + 3965) || *((unsigned char *)impl + 36652)) {
      fwrite("Failed to satisfy render split.\n", 0x20uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    }
    AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::restartRenderPass((uint64_t)impl, impl + 11309, 0, 1);
  }
}

- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6
{
  unsigned int v6 = a6;
  unsigned int v7 = a5;
  unsigned int v8 = a4;
  impl = self->_impl;
  long long v10 = 0uLL;
  if (a3)
  {
    uint64_t v11 = *((void *)a3 + 67);
    if (v11) {
      long long v10 = *(_OWORD *)(v11 + 496);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = impl[246];
  uint64_t v13 = impl[185];
  int v14 = (void *)impl[199];
  *(void *)(v12 + 5152) = a3;
  *(_OWORD *)(v12 + 5160) = v10;
  *(void *)(v12 + 5184) = v11;
  uint64_t v15 = *(void *)(v11 + 208);
  unsigned int v16 = *(_DWORD *)(v15 + 24);
  if (*(_DWORD *)(v11 + 236))
  {
    unsigned int v17 = v16 >= 2 && *(_DWORD *)(v15 + 80) != 0;
    uint64_t GPUVirtualAddress = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getGPUVirtualAddress(v11, a4, 0, v7, v17);
    unsigned int v19 = 0;
    *(void *)(v12 + 5096) = GPUVirtualAddress;
    uint64_t v20 = *(void *)(v12 + 5184);
    uint64_t v21 = *(void *)(v20 + 208);
    if (*(_DWORD *)(v21 + 24) >= 2u) {
      unsigned int v19 = *(_DWORD *)(v21 + 80) != 0;
    }
    *(void *)(v12 + 5112) = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getLevelOffset<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)0>(v20, v6, v19);
  }
  else
  {
    unsigned int v22 = v16 >= 2 && *(_DWORD *)(v15 + 80) != 0;
    *(void *)(v12 + 5096) = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getGPUVirtualAddress(v11, a4, a6, v7, v22);
  }
  *(_DWORD *)(v12 + 5124) = 1;
  if (v13) {
    MTLResourceListAddResource();
  }
  AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(v14, *(void *)(v12 + 5152), 12);
  IOGPUResourceListAddResource();
  if (*(void *)(v12 + 5160)) {
    IOGPUResourceListAddResource();
  }
  if (*(void *)(v12 + 5168)) {
    IOGPUResourceListAddResource();
  }
  uint64_t v23 = *(void *)(v11 + 488);
  if (v23 && *(_DWORD *)(v23 + 1080) > v6)
  {
    uint64_t v24 = *(void *)(v11 + 208);
    BOOL v25 = *(_DWORD *)(v24 + 24) >= 2u && *(_DWORD *)(v24 + 80) != 0;
    *(void *)(v12 + 5240) = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getGPUVirtualAddress(v23 + 536 * v25, v8, v6, v7, 0);
  }
  if (!*(void *)(impl[187] + 520))
  {
    if (*(unsigned char *)(impl[246] + 3965) || *((unsigned char *)impl + 36652)) {
      fwrite("Failed to satisfy render split.\n", 0x20uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    }
    AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::restartRenderPass((uint64_t)impl, impl + 11309, 0, 1);
  }
}

- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6
{
  unsigned int v6 = a6;
  unsigned int v7 = a5;
  unsigned int v8 = a4;
  impl = self->_impl;
  long long v10 = 0uLL;
  if (a3)
  {
    uint64_t v11 = *((void *)a3 + 67);
    if (v11) {
      long long v10 = *(_OWORD *)(v11 + 496);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = impl[246];
  uint64_t v13 = impl[185];
  int v14 = (void *)impl[199];
  *(void *)(v12 + 5128) = a3;
  *(_OWORD *)(v12 + 5136) = v10;
  *(void *)(v12 + 5176) = v11;
  if (*(_DWORD *)(v11 + 236))
  {
    *(void *)(v12 + 5088) = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getGPUVirtualAddress(v11, a4, 0, a5, 0);
    *(void *)(v12 + 5104) = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getLevelOffset<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)0>(*(void *)(v12 + 5176), v6, v7);
  }
  else
  {
    *(void *)(v12 + 5088) = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getGPUVirtualAddress(v11, a4, a6, a5, 0);
  }
  *(_DWORD *)(v12 + 5120) = 1;
  if (v13) {
    MTLResourceListAddResource();
  }
  AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(v14, *(void *)(v12 + 5128), 12);
  IOGPUResourceListAddResource();
  if (*(void *)(v12 + 5136)) {
    IOGPUResourceListAddResource();
  }
  if (*(void *)(v12 + 5144)) {
    IOGPUResourceListAddResource();
  }
  uint64_t v15 = *(void *)(v11 + 488);
  if (v15 && *(_DWORD *)(v15 + 1080) > v6) {
    *(void *)(v12 + 5232) = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getGPUVirtualAddress(v15, v8, v6, v7, 0);
  }
  if (!*(void *)(impl[187] + 520))
  {
    if (*(unsigned char *)(impl[246] + 3965) || *((unsigned char *)impl + 36652)) {
      fwrite("Failed to satisfy render split.\n", 0x20uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    }
    AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::restartRenderPass((uint64_t)impl, impl + 11309, 0, 1);
  }
}

- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 atIndex:(unint64_t)a7
{
  impl = (unint64_t *)self->_impl;
  long long v8 = 0uLL;
  if (a3)
  {
    uint64_t v9 = *((void *)a3 + 67);
    if (v9) {
      long long v8 = *(_OWORD *)(v9 + 496);
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  long long v10 = (_DWORD *)impl[246];
  unint64_t v11 = impl[185];
  *(void *)&v10[2 * a7 + 628] = v9;
  uint64_t v12 = v10 + 560;
  int v13 = 3 * a7;
  *(void *)&v12[2 * (3 * a7)] = a3;
  *(void *)&v12[2 * (3 * a7 + 1)] = v8;
  uint64_t v14 = (3 * a7 + 2);
  *(void *)&v10[2 * v14 + 560] = *((void *)&v8 + 1);
  v10[990] |= 1 << a7;
  AGX::Framebuffer<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::configurePBE((uint64_t)v10, v9, a5, a6, a4, (uint64_t)(v10 + 102), (uint64_t)&v10[a7 + 102], a7, 1, (v10[994] & (1 << a7)) != 0, (v10[993] & (1 << a7)) != 0, (v10[1230] & (1 << a7)) != 0);
  IOGPUResourceListAddResource();
  if (*(void *)&v12[2 * (v13 + 1)]) {
    IOGPUResourceListAddResource();
  }
  if (*(void *)&v12[2 * v14]) {
    IOGPUResourceListAddResource();
  }
  if (v11) {
    MTLResourceListAddResource();
  }
  if (!*(void *)(impl[187] + 520))
  {
    if (*(unsigned char *)(impl[246] + 3965) || *((unsigned char *)impl + 36652))
    {
      unint64_t v15 = impl[194] - impl[196];
      *(_DWORD *)(v15 + 12) = 1;
      if ((*(unsigned char *)(v15 + 8) & 4) != 0) {
        **(unsigned char **)(*impl + 688) = 1;
      }
    }
    else
    {
      AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::restartRenderPass((uint64_t)impl, impl + 11309, 0, 1);
    }
  }
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  impl = self->_impl;
  uint64_t v4 = impl[246];
  if ((*(unsigned char *)(v4 + 4917) & 2) != 0)
  {
    switch(a3)
    {
      case 0uLL:
        *(_DWORD *)(v4 + 4912) &= ~0x200u;
        LODWORD(v5) = *(void *)(v4 + 4904) & 0xFFFFFDFF;
        HIDWORD(v5) = (*(void *)(v4 + 4904) | 0x20000000200uLL) >> 32;
        *(void *)(v4 + 4904) = v5;
        __int16 v6 = *(_WORD *)(v4 + 4380) | 8;
        goto LABEL_9;
      case 1uLL:
        unsigned int v7 = *(_DWORD *)(v4 + 4912) & 0xFFFFFDFF;
        goto LABEL_7;
      case 2uLL:
        *(_DWORD *)(v4 + 4912) |= 0x200u;
        *(void *)(v4 + 4904) &= 0xFFFFFDFFFFFFFDFFLL;
        goto LABEL_8;
      case 3uLL:
        unsigned int v7 = *(_DWORD *)(v4 + 4912) | 0x200;
LABEL_7:
        *(_DWORD *)(v4 + 4912) = v7;
        LODWORD(v8) = *(void *)(v4 + 4904) | 0x200;
        HIDWORD(v8) = (*(void *)(v4 + 4904) & 0xFFFFFDFFFFFFFDFFLL) >> 32;
        *(void *)(v4 + 4904) = v8;
LABEL_8:
        __int16 v6 = *(_WORD *)(v4 + 4380) & 0xFFF7;
LABEL_9:
        *(_WORD *)(v4 + 4380) = v6;
        break;
      default:
        break;
    }
  }
  uint64_t v9 = 0x2000000000000000;
  if (a3 != 1) {
    uint64_t v9 = 1;
  }
  impl[11396] |= v9;
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  impl = self->_impl;
  uint64_t v4 = impl[246];
  if (*(unsigned char *)(v4 + 4917))
  {
    switch(a3)
    {
      case 0uLL:
        *(_DWORD *)(v4 + 4912) &= ~0x100u;
        LODWORD(v6) = *(void *)(v4 + 4904) & 0xFFFFFEFF;
        HIDWORD(v6) = (*(void *)(v4 + 4904) | 0x10000000100uLL) >> 32;
        *(void *)(v4 + 4904) = v6;
        __int16 v7 = *(_WORD *)(v4 + 4380) | 2;
        goto LABEL_9;
      case 1uLL:
      case 5uLL:
        unsigned int v5 = *(_DWORD *)(v4 + 4912) & 0xFFFFFEFF;
        goto LABEL_7;
      case 2uLL:
        *(_DWORD *)(v4 + 4912) |= 0x100u;
        *(void *)(v4 + 4904) &= 0xFFFFFEFFFFFFFEFFLL;
        goto LABEL_8;
      case 3uLL:
        unsigned int v5 = *(_DWORD *)(v4 + 4912) | 0x100;
LABEL_7:
        *(_DWORD *)(v4 + 4912) = v5;
        LODWORD(v8) = *(void *)(v4 + 4904) | 0x100;
        HIDWORD(v8) = (*(void *)(v4 + 4904) & 0xFFFFFEFFFFFFFEFFLL) >> 32;
        *(void *)(v4 + 4904) = v8;
LABEL_8:
        __int16 v7 = *(_WORD *)(v4 + 4380) & 0xFFFD;
LABEL_9:
        *(_WORD *)(v4 + 4380) = v7;
        break;
      default:
        break;
    }
  }
  uint64_t v9 = 0x1000000000000000;
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    uint64_t v9 = 1;
  }
  impl[11396] |= v9;
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4
{
  impl = (char *)self->_impl;
  unsigned int v5 = impl + 90472;
  *((_WORD *)impl + 19246) = a4 >> 3;
  *((_DWORD *)impl + 9301) = ((a3 != 0) << 15) | ((a3 == 1) << 14) | *((_DWORD *)impl + 9301) & 0xFFFF3FFF;
  *((_DWORD *)impl + 9306) = *((_DWORD *)impl + 9306) & 0x1FFFF | ((unsigned __int16)(a4 >> 3) << 17);
  uint64_t v6 = *((void *)impl + 11309);
  *((void *)impl + 11309) = v6 | 0x100000000000;
  if (a3 && impl[38494])
  {
    *(void *)unsigned int v5 = v6 | 0x20100000000000;
    *((void *)impl + 11397) |= 0x80uLL;
  }
  char v7 = impl[38495] | (a3 != 0);
  impl[38495] = v7;
  if (v7)
  {
    if ((impl[90480] & 2) != 0)
    {
      AGX::FramebufferGen3_2<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::addGPUResources(*((void *)impl + 246), *((void *)impl + 187), *((void **)impl + 199), 64);
      *((_DWORD *)v5 + 2) &= ~2u;
    }
  }
}

- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4
{
  impl = self->_impl;
  if (a3 >= 0xFF) {
    unsigned int v5 = 255;
  }
  else {
    unsigned int v5 = a3;
  }
  impl[9614] = v5;
  if (a4 >= 0xFF) {
    unsigned int v6 = 255;
  }
  else {
    unsigned int v6 = a4;
  }
  impl[9615] = v6;
  *((unsigned char *)impl + 37208) = v5;
  *((unsigned char *)impl + 37216) = v6;
  *((void *)impl + 11309) |= 0x100000000000uLL;
}

- (void)setStencilReferenceValue:(unsigned int)a3
{
  impl = self->_impl;
  if (a3 >= 0xFF) {
    unsigned int v4 = 255;
  }
  else {
    unsigned int v4 = a3;
  }
  impl[9614] = v4;
  impl[9615] = v4;
  *((unsigned char *)impl + 37208) = v4;
  *((unsigned char *)impl + 37216) = v4;
  *((void *)impl + 11309) |= 0x100000000000uLL;
}

- (void)setDepthStencilState:(id)a3
{
  impl = (char *)self->_impl;
  unsigned int v4 = (int8x8_t *)(impl + 37204);
  uint64_t v5 = *((void *)a3 + 9);
  *(void *)(impl + 37268) = v5;
  int v6 = *((_DWORD *)impl + 9302);
  unsigned int v7 = *((_DWORD *)impl + 9301) & 0xFFF7FFFF | (((*((_DWORD *)a3 + 16) >> 19) & 1) << 19);
  *((_DWORD *)impl + 9301) = v7;
  uint64_t v8 = impl + 90472;
  *((_DWORD *)impl + 9301) = v7 & 0xFFFBFFFF | (((*((_DWORD *)a3 + 16) >> 18) & 1) << 18);
  unsigned int v9 = v6 & 0xFFDFFFFF | (((*((_DWORD *)a3 + 17) >> 21) & 1) << 21);
  *((_DWORD *)impl + 9302) = v9;
  *((_DWORD *)impl + 9302) = v9 & 0xF8FFFFFF | ((HIBYTE(*((_DWORD *)a3 + 17)) & 7) << 24);
  unsigned int v10 = *((_DWORD *)impl + 9304) & 0xFFDFFFFF | (((*((_DWORD *)a3 + 17) >> 21) & 1) << 21);
  *((_DWORD *)impl + 9304) = v10;
  unsigned int v11 = v10 & 0xF8FFFFFF | ((HIBYTE(*((_DWORD *)a3 + 17)) & 7) << 24);
  *((_DWORD *)impl + 9303) = v5;
  *((_DWORD *)impl + 9304) = v11;
  *((_DWORD *)impl + 9305) = HIDWORD(v5);
  uint64_t v12 = *((void *)impl + 4871);
  if (v12) {
    int v13 = *(unsigned __int8 *)(v12 + 3390);
  }
  else {
    int v13 = 3;
  }
  BOOL v14 = (v13 - 1) < 2;
  int v15 = (v13 & 3) << 22;
  if (v14 && (*(void *)(*(void *)(*((void *)impl + 182) + 808) + 7288) & 0x8000) != 0) {
    unsigned int v16 = 0;
  }
  else {
    unsigned int v16 = v15;
  }
  v4[4] = vorr_s8((int8x8_t)(*(void *)&v4[4] & 0xFF3FFFFFFF3FFFFFLL), (int8x8_t)vdup_n_s32(v16));
  *v8 |= 0x100000000000uLL;
  __int16 v17 = *((_WORD *)a3 + 28);
  v4[151].i16[3] = v17;
  v4[151].i16[2] |= v17;
  v4[152].i16[0] = *((_WORD *)a3 + 29);
}

- (void)setPrimitiveRestartEnabled:(BOOL)a3 index:(unint64_t)a4
{
  unsigned int v4 = (BOOL *)self->_impl + 38643;
  *unsigned int v4 = a3;
  *(_DWORD *)(v4 + 1) = a4;
}

- (void)setPrimitiveRestartEnabled:(BOOL)a3
{
  uint64_t v3 = (BOOL *)self->_impl + 38643;
  *uint64_t v3 = a3;
  *(_DWORD *)(v3 + 1) = -1;
}

- (void)setProvokingVertexMode:(unint64_t)a3
{
  impl = self->_impl;
  uint64_t v4 = impl[11309];
  impl[11309] = v4 | 0x2000000000001;
  if (impl[4871])
  {
    impl[11309] = v4 | 0x2001000000003;
    impl[11307] |= 0x400uLL;
  }
  if (a3 == 1) {
    int v5 = 2;
  }
  else {
    int v5 = 1;
  }
  if (!a3) {
    int v5 = 0;
  }
  *((_DWORD *)impl + 9662) = v5;
  *((_DWORD *)impl + 9299) = *((_DWORD *)impl + 9299) & 0xFFFFFE7F | (((((v5 << 7) + 128) >> 7) & 3) << 7);
  *((_DWORD *)impl + 19544) = a3 == 2;
}

- (void)setViewportTransformEnabled:(BOOL)a3
{
  impl = self->_impl;
  impl[11309] |= 0x2000000000000uLL;
  if (a3) {
    int v4 = 0;
  }
  else {
    int v4 = 64;
  }
  *((_DWORD *)impl + 9299) = *((_DWORD *)impl + 9299) & 0xFFFFFFBF | v4;
}

- (void)setPointSize:(float)a3
{
  impl = (float *)self->_impl;
  if (impl[9657] != a3)
  {
    impl[9657] = a3;
    *((void *)impl + 11309) |= 0x100000000000uLL;
  }
}

- (void)setAlphaTestReferenceValue:(float)a3
{
  impl = (float *)self->_impl;
  impl[19345] = a3;
  *((void *)impl + 11309) |= 0x1000000000uLL;
  *((void *)impl + 11307) |= 8uLL;
}

- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  impl = (float *)self->_impl;
  unsigned int v7 = impl + 22614;
  impl += 19339;
  float *impl = a3;
  impl[1] = a4;
  impl[2] = a5;
  impl[3] = a6;
  v7[2] |= 0x1000000000uLL;
  *v7 |= 1uLL;
}

- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  impl = self->_impl;
  unsigned int location = a6.location;
  int length = a6.length;
  if (LODWORD(a6.length))
  {
    uint64_t length_low = LODWORD(a6.length);
    unsigned int v11 = impl + 7387;
    uint64_t v12 = impl + 7371;
    unsigned int v13 = a6.location;
    do
    {
      if (*a3)
      {
        uint64_t v15 = impl[182];
        uint64_t v16 = *(void *)(v15 + 808);
        unsigned int v17 = *(_DWORD *)a4;
        unsigned int v18 = *(_DWORD *)a5;
        unsigned int v19 = (char *)*a3 + 48;
        long long v21 = *((_OWORD *)*a3 + 4);
        long long v20 = *((_OWORD *)*a3 + 5);
        v33[0] = *(_OWORD *)v19;
        v33[1] = v21;
        v33[2] = v20;
        if (v19[71] < 0)
        {
          std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)v19 + 6), *((void *)v19 + 7));
        }
        else
        {
          long long v22 = *((_OWORD *)v19 + 3);
          __p.__r_.__value_.__r.__words[2] = *((void *)v19 + 8);
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v22;
        }
        *((void *)&v33[0] + 1) = __PAIR64__(v18, v17);
        Sampler = AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::findOrCreateSampler(v16, (uint64_t)v33, v15, 0);
        if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
          if (!impl[185]) {
            goto LABEL_16;
          }
LABEL_15:
          MTLResourceListAddResource();
          goto LABEL_16;
        }
        operator delete(__p.__r_.__value_.__l.__data_);
        if (impl[185]) {
          goto LABEL_15;
        }
      }
      else
      {
        Sampler = 0;
        if (impl[185]) {
          goto LABEL_15;
        }
      }
LABEL_16:
      uint64_t v24 = (uint64_t)&impl[v13 + 6148];
      if (Sampler)
      {
        *(void *)(v24 + 9784) = *(void *)&Sampler->_impl.desc.label.__r_.var0;
        if ((~*v12 & 0x6000000000000000) == 0) {
LABEL_3:
        }
          _OWORD *v11 = *(_OWORD *)&Sampler->_impl.desc.label.var0;
        p_impl = &Sampler->_impl;
        if (LODWORD(Sampler[1].super._device)) {
          p_impl = (Sampler *)LODWORD(Sampler[1].super._device);
        }
        goto LABEL_6;
      }
      *(void *)(v24 + 9784) = 0;
      if ((~*v12 & 0x6000000000000000) == 0) {
        goto LABEL_3;
      }
      p_impl = 0;
LABEL_6:
      impl[v13++ + 9634] = p_impl;
      ++v12;
      ++v11;
      ++a5;
      ++a4;
      ++a3;
      --length_low;
    }
    while (length_low);
  }
  unsigned int v25 = length + location;
  if (length + location == 128) {
    uint64_t v26 = -1;
  }
  else {
    uint64_t v26 = ~(-1 << (length + location));
  }
  if (v25 < 0x40) {
    uint64_t v27 = ~(-1 << (length + location));
  }
  else {
    uint64_t v27 = -1;
  }
  if (v25 >= 0x40) {
    uint64_t v28 = v26;
  }
  else {
    uint64_t v28 = 0;
  }
  uint64_t v29 = -1 << location;
  if (location < 0x40) {
    uint64_t v29 = -1;
  }
  uint64_t v30 = -1 << location;
  if (location >= 0x40) {
    uint64_t v30 = 0;
  }
  impl[11301] |= v27 & v30;
  impl[11302] |= v28 & v29;
  impl[11309] |= 0x1000000000uLL;
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  unsigned int v6 = a6;
  impl = self->_impl;
  if (a3)
  {
    uint64_t v10 = impl[182];
    uint64_t v11 = *(void *)(v10 + 808);
    long long v12 = *((_OWORD *)a3 + 4);
    v17[0] = *((_OWORD *)a3 + 3);
    v17[1] = v12;
    v17[2] = *((_OWORD *)a3 + 5);
    if (*((char *)a3 + 119) < 0) {
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a3 + 12), *((void *)a3 + 13));
    }
    else {
      std::string __p = *(std::string *)((unsigned char *)a3 + 4);
    }
    *((void *)&v17[0] + 1) = __PAIR64__(LODWORD(a5), LODWORD(a4));
    Sampler = AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::findOrCreateSampler(v11, (uint64_t)v17, v10, 0);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    Sampler = 0;
  }
  if (impl[185]) {
    MTLResourceListAddResource();
  }
  if (Sampler)
  {
    p_impl = &Sampler->_impl;
    uint64_t v15 = *(void *)&Sampler->_impl.desc.label.__r_.var0;
    uint64_t v16 = v6;
    impl[v6 + 7371] = v15;
    if ((~v15 & 0x6000000000000000) == 0) {
      *(_OWORD *)&impl[2 * v6 + 7387] = *(_OWORD *)&Sampler->_impl.desc.label.var0;
    }
    if (LODWORD(Sampler[1].super._device)) {
      p_impl = (Sampler *)LODWORD(Sampler[1].super._device);
    }
  }
  else
  {
    p_impl = 0;
    uint64_t v16 = v6;
    impl[v6 + 7371] = 0;
  }
  impl[v16 + 9634] = p_impl;
  impl[((v6 & 0xFFFFFFC0) != 0) + 11301] |= 1 << v6;
  impl[11309] |= 0x1000000000uLL;
}

- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  unsigned int length = a4.length;
  unsigned int location = a4.location;
  unsigned int v6 = a3;
  impl = self->_impl;
  if (LODWORD(a4.length) && impl[185])
  {
    uint64_t length_low = LODWORD(a4.length);
    unsigned int v9 = a3;
    do
    {
      if (*v9) {
        MTLResourceListAddResource();
      }
      ++v9;
      --length_low;
    }
    while (length_low);
  }
  if (length)
  {
    uint64_t v10 = length;
    uint64_t v11 = impl + 7387;
    long long v12 = impl + 7371;
    unsigned int v13 = location;
    while (1)
    {
      uint64_t v16 = *v6;
      uint64_t v17 = (uint64_t)&impl[v13 + 6148];
      if (*v6) {
        break;
      }
      *(void *)(v17 + 9784) = 0;
      if ((~*v12 & 0x6000000000000000) == 0) {
        goto LABEL_9;
      }
      uint64_t v15 = 0;
LABEL_12:
      impl[v13++ + 9634] = v15;
      ++v12;
      ++v11;
      ++v6;
      if (!--v10) {
        goto LABEL_18;
      }
    }
    *(void *)(v17 + 9784) = v16[15];
    if ((~*v12 & 0x6000000000000000) == 0) {
LABEL_9:
    }
      _OWORD *v11 = *((_OWORD *)v16 + 8);
    BOOL v14 = (char *)(v16 + 6);
    uint64_t v15 = (char *)*((unsigned int *)v14 + 24);
    if (!v15) {
      uint64_t v15 = v14;
    }
    goto LABEL_12;
  }
LABEL_18:
  unsigned int v18 = length + location;
  if (length + location == 128) {
    uint64_t v19 = -1;
  }
  else {
    uint64_t v19 = ~(-1 << (length + location));
  }
  if (v18 < 0x40) {
    uint64_t v20 = ~(-1 << (length + location));
  }
  else {
    uint64_t v20 = -1;
  }
  if (v18 >= 0x40) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t v22 = -1 << location;
  if (location < 0x40) {
    uint64_t v22 = -1;
  }
  uint64_t v23 = -1 << location;
  if (location >= 0x40) {
    uint64_t v23 = 0;
  }
  impl[11301] |= v20 & v23;
  impl[11302] |= v21 & v22;
  impl[11309] |= 0x1000000000uLL;
}

- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  impl = self->_impl;
  if (impl[185]) {
    MTLResourceListAddResource();
  }
  if (a3)
  {
    unsigned int v7 = (char *)a3 + 48;
    uint64_t v8 = *((void *)a3 + 15);
    uint64_t v9 = v4;
    impl[v4 + 7371] = v8;
    if ((~v8 & 0x6000000000000000) == 0) {
      *(_OWORD *)&impl[2 * v4 + 7387] = *((_OWORD *)a3 + 8);
    }
    if (*((_DWORD *)a3 + 36)) {
      unsigned int v7 = (char *)*((unsigned int *)a3 + 36);
    }
  }
  else
  {
    unsigned int v7 = 0;
    uint64_t v9 = v4;
    impl[v4 + 7371] = 0;
  }
  impl[v9 + 9634] = v7;
  impl[((v4 & 0xFFFFFFC0) != 0) + 11301] |= 1 << v4;
  impl[11309] |= 0x1000000000uLL;
}

- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4
{
  unsigned int length = a4.length;
  unsigned int location = a4.location;
  int v5 = a3;
  impl = (int8x16_t *)self->_impl;
  v55 = &impl[5649].i64[1];
  if (LODWORD(a4.length) && impl[92].i64[1])
  {
    uint64_t length_low = LODWORD(a4.length);
    uint64_t v8 = a3;
    do
    {
      if (*v8) {
        MTLResourceListAddResource();
      }
      ++v8;
      --length_low;
    }
    while (length_low);
  }
  unsigned int v56 = length;
  if (length)
  {
    v60 = &impl[2279].i32[3];
    v61 = &impl[4747].i8[8];
    v62 = &impl[4746].i8[8];
    uint64_t v9 = length;
    v59 = &impl[5143].i8[8];
    v58 = &impl[3173].i8[8];
    unsigned int v10 = location;
    unsigned int v11 = 3 * location;
    do
    {
      uint64_t v23 = (uint64_t)*v5;
      if (*v5)
      {
        uint64_t v24 = *(void *)(v23 + 536);
        uint64_t v12 = v10;
        unsigned int v25 = &impl[2 * v10 + 3173].u64[1];
        long long v26 = *(_OWORD *)(v24 + 416);
        *(_OWORD *)unsigned int v25 = *(_OWORD *)(v24 + 400);
        *((_OWORD *)v25 + 1) = v26;
        uint64_t v27 = &impl[2 * v10 + 3429].u64[1];
        long long v28 = *(_OWORD *)(v24 + 448);
        *(_OWORD *)uint64_t v27 = *(_OWORD *)(v24 + 432);
        *((_OWORD *)v27 + 1) = v28;
        uint64_t v29 = *(void *)(v23 + 536);
        if (v29)
        {
          uint64_t v30 = *(void *)(v29 + 496);
          uint64_t v31 = *(void *)(v29 + 504);
        }
        else
        {
          uint64_t v30 = 0;
          uint64_t v31 = 0;
        }
        AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource((void *)impl[99].i64[1], v23, 4u, v10);
        unsigned int v32 = (int *)MEMORY[0x263F4B188];
        impl[5143].i64[v11 + 1] = v23 + (int)*MEMORY[0x263F4B188];
        if (v30) {
          uint64_t v33 = v30 + *v32;
        }
        else {
          uint64_t v33 = 0;
        }
        impl[5144].i64[v11] = v33;
        if (v31) {
          uint64_t v34 = v31 + *v32;
        }
        else {
          uint64_t v34 = 0;
        }
        impl[5144].i64[v11 + 1] = v34;
        uint64_t v35 = (uint64_t)&impl[4298].i64[7 * v10 + 1];
        long long v36 = *(_OWORD *)(v24 + 72);
        long long v37 = *(_OWORD *)(v24 + 88);
        long long v38 = *(_OWORD *)(v24 + 104);
        *(void *)(v35 + 48) = *(void *)(v24 + 120);
        *(_OWORD *)(v35 + 16) = v37;
        *(_OWORD *)(v35 + 32) = v38;
        *(_OWORD *)uint64_t v35 = v36;
        *(void *)&v62[8 * (v10 > 0x3F)] |= 1 << v10;
        uint64_t v39 = *(void *)(v24 + 488);
        if (v39) {
          LODWORD(v39) = *(_DWORD *)(v39 + 1080) != 0;
        }
        *(void *)&v61[8 * (v10 > 0x3F)] = *(void *)&v61[8 * (v10 > 0x3F)] & ~(1 << v10) | ((unint64_t)v39 << (v10 & 0x3F));
        __int32 v40 = *v60;
        __int32 v41 = impl[2280].i32[0];
        if (*(unsigned char *)(v24 + 380)) {
          ++v41;
        }
        else {
          ++v40;
        }
        __int32 *v60 = v40;
        impl[2280].i32[0] = v41;
        uint64_t v13 = *(unsigned int *)(*(void *)(v23 + 536) + 120);
      }
      else
      {
        *(void *)&v59[8 * v11] = 0;
        *(void *)&v59[8 * v11 + 8] = 0;
        *(void *)&v59[8 * v11 + 16] = 0;
        uint64_t v12 = v10;
        bzero(&impl[4298].u64[7 * v10 + 1], 0x38uLL);
        uint64_t v13 = 0;
        uint64_t v14 = 8 * (v10 > 0x3F);
        *(void *)&v62[v14] &= ~(1 << v10);
        *(void *)&v61[v14] &= ~(1 << v10);
        impl[4301].i32[14 * v10 + 2] = 0;
        uint64_t v15 = impl[91].i64[0];
        uint64_t v16 = *(void *)(v15 + 808);
        long long v17 = *(_OWORD *)(v16 + 7312);
        long long v18 = *(_OWORD *)(v16 + 7328);
        uint64_t v19 = &v58[32 * v10];
        *(_OWORD *)uint64_t v19 = v17;
        *((_OWORD *)v19 + 1) = v18;
        uint64_t v20 = *(void *)(v15 + 808);
        uint64_t v21 = &v58[32 * v10 + 4096];
        long long v22 = *(_OWORD *)(v20 + 7360);
        *(_OWORD *)uint64_t v21 = *(_OWORD *)(v20 + 7344);
        *((_OWORD *)v21 + 1) = v22;
      }
      impl[4753].i64[v12] = v13;
      ++v10;
      ++v5;
      v11 += 3;
      --v9;
    }
    while (v9);
  }
  unsigned int v42 = v56 + location;
  uint64_t v43 = -1 << (v56 + location);
  if (v56 + location == 128) {
    uint64_t v44 = -1;
  }
  else {
    uint64_t v44 = ~(-1 << (v56 + location));
  }
  if (v42 < 0x40) {
    uint64_t v45 = ~v43;
  }
  else {
    uint64_t v45 = -1;
  }
  if (v42 >= 0x40) {
    uint64_t v46 = v44;
  }
  else {
    uint64_t v46 = 0;
  }
  uint64_t v47 = -1 << location;
  if (location >= 0x40) {
    uint64_t v47 = 0;
  }
  uint64_t v48 = *v55 | v45 & v47;
  uint64_t v49 = -1 << location;
  if (location < 0x40) {
    uint64_t v49 = -1;
  }
  uint64_t v50 = impl[5650].i64[0] | v46 & v49;
  uint64_t *v55 = v48;
  impl[5650].i64[0] = v50;
  if (v42 == 128) {
    uint64_t v51 = -1;
  }
  else {
    uint64_t v51 = ~(-1 << v42);
  }
  if (v42 < 0x40) {
    uint64_t v52 = ~v43;
  }
  else {
    uint64_t v52 = -1;
  }
  if (v42 >= 0x40) {
    uint64_t v53 = v51;
  }
  else {
    uint64_t v53 = 0;
  }
  impl[5652].i64[1] |= v52 & v47;
  impl[5654].i64[1] |= 0x5000000000uLL;
  int8x16_t v54 = (int8x16_t)vdupq_n_s64(0x10uLL);
  v54.i64[0] = v53 & v49;
  impl[5653] = vorrq_s8(impl[5653], v54);
}

- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6
{
  unsigned int v7 = a4;
  impl = (char *)self->_impl;
  uint64_t v9 = impl + 90456;
  if (a3)
  {
    uint64_t v11 = *((void *)a3 + 67);
    int v51 = a6;
    if (v11)
    {
      uint64_t v13 = *(void *)(v11 + 496);
      uint64_t v12 = *(void *)(v11 + 504);
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v12 = 0;
    }
    AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource(*((void **)impl + 199), (uint64_t)a3, 4u, a4);
    int v27 = 3 * v7;
    long long v28 = (int *)MEMORY[0x263F4B188];
    *(void *)&impl[24 * v7 + 82296] = (char *)a3 + (int)*MEMORY[0x263F4B188];
    if (v13) {
      uint64_t v29 = v13 + *v28;
    }
    else {
      uint64_t v29 = 0;
    }
    *(void *)&impl[8 * (v27 + 1) + 82296] = v29;
    if (v12) {
      uint64_t v30 = v12 + *v28;
    }
    else {
      uint64_t v30 = 0;
    }
    *(void *)&impl[8 * (v27 + 2) + 82296] = v30;
    uint64_t v31 = v7;
    uint64_t v32 = (uint64_t)&impl[56 * v7 + 68760];
    long long v33 = *(_OWORD *)(v11 + 72);
    long long v34 = *(_OWORD *)(v11 + 88);
    long long v35 = *(_OWORD *)(v11 + 104);
    *(void *)(v32 + 64) = *(void *)(v11 + 120);
    *(_OWORD *)(v32 + 32) = v34;
    *(_OWORD *)(v32 + 48) = v35;
    *(_OWORD *)(v32 + 16) = v33;
    BOOL v36 = v7 > 0x3F;
    uint64_t v37 = 1 << v7;
    *(void *)&impl[8 * v36 + 75944] |= 1 << v7;
    uint64_t v38 = *(void *)(v11 + 488);
    if (v38) {
      uint64_t v38 = *(_DWORD *)(v38 + 1080) != 0;
    }
    *(void *)&impl[8 * v36 + 75960] = *(void *)&impl[8 * v36 + 75960] & ~v37 | (v38 << (v7 & 0x3F));
    uint64_t v39 = &impl[32 * v7 + 50776];
    long long v40 = *(_OWORD *)(v11 + 416);
    *(_OWORD *)uint64_t v39 = *(_OWORD *)(v11 + 400);
    *((_OWORD *)v39 + 1) = v40;
    __int32 v41 = &impl[32 * v7 + 54872];
    long long v42 = *(_OWORD *)(v11 + 448);
    *(_OWORD *)__int32 v41 = *(_OWORD *)(v11 + 432);
    *((_OWORD *)v41 + 1) = v42;
    if (*((void *)impl + 185))
    {
      MTLResourceListAddResource();
      if (*((void *)impl + 185)) {
        MTLResourceListAddResource();
      }
    }
    uint64_t v43 = (int *)(impl + 36476);
    uint64_t v44 = a5;
    uint64_t v45 = (char *)a5 + 48;
    if (*(_DWORD *)(*(void *)(v11 + 208) + 24) >= 2u) {
      AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getGPUVirtualAddress(v11, 0, 0, 0, 1u);
    }
    uint64_t v46 = *((void *)v45 + 9);
    int v23 = v51;
    *(void *)&impl[8 * v51 + 58968] = v46;
    uint64_t v20 = v44;
    if ((~v46 & 0x6000000000000000) == 0) {
      *(_OWORD *)&impl[16 * v51 + 59096] = *((_OWORD *)v44 + 8);
    }
    int v47 = *v43;
    int v48 = *((_DWORD *)impl + 9120);
    if (*(unsigned char *)(v11 + 380)) {
      ++v48;
    }
    else {
      ++v47;
    }
    *uint64_t v43 = v47;
    *((_DWORD *)impl + 9120) = v48;
    uint64_t v49 = (uint64_t)&impl[8 * v36 + 90088];
    *(void *)(v49 + 304) |= v37;
    *(void *)(v49 + 352) |= v37;
    *(void *)&impl[8 * ((v51 & 0xFFFFFFC0) != 0) + 90408] |= 1 << v51;
    uint64_t v9 = impl + 90456;
    uint64_t v50 = *((void *)a3 + 67);
    *((void *)impl + 11309) |= 0x5000000000uLL;
    *(void *)&impl[8 * v31 + 76048] = *(unsigned int *)(v50 + 120);
  }
  else
  {
    *(void *)&impl[8 * (3 * a4) + 82296] = 0;
    *(void *)&impl[8 * (3 * a4 + 1) + 82296] = 0;
    *(void *)&impl[8 * (3 * a4 + 2) + 82296] = 0;
    uint64_t v14 = (uint64_t)&impl[56 * a4 + 68760];
    int v15 = a6;
    bzero((void *)(v14 + 16), 0x38uLL);
    *(_DWORD *)(v14 + 64) = 0;
    uint64_t v16 = (uint64_t)&impl[8 * (v7 > 0x3F) + 68760];
    *(void *)(v16 + 7184) &= ~(1 << v7);
    uint64_t v17 = *((void *)impl + 182);
    uint64_t v18 = *(void *)(v17 + 808);
    *(void *)(v16 + 7200) &= ~(1 << v7);
    uint64_t v19 = &impl[32 * v7 + 50776];
    uint64_t v20 = a5;
    long long v21 = *(_OWORD *)(v18 + 7328);
    *(_OWORD *)uint64_t v19 = *(_OWORD *)(v18 + 7312);
    *((_OWORD *)v19 + 1) = v21;
    uint64_t v22 = *(void *)(v17 + 808);
    int v23 = v15;
    uint64_t v24 = &impl[32 * v7 + 54872];
    long long v25 = *(_OWORD *)(v22 + 7360);
    *(_OWORD *)uint64_t v24 = *(_OWORD *)(v22 + 7344);
    *((_OWORD *)v24 + 1) = v25;
    *(void *)&impl[8 * v7 + 76048] = 0;
    if (!a5)
    {
      unint64_t v26 = 0;
      goto LABEL_28;
    }
  }
  unint64_t v26 = (unint64_t)(v20 + 12);
  if (v20[36]) {
    unint64_t v26 = v20[36];
  }
LABEL_28:
  *(void *)&impl[8 * v23 + 77072] = v26;
  *v9 |= 0x10uLL;
}

- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  impl = (char *)self->_impl;
  unsigned int v6 = impl + 90456;
  if (a3)
  {
    uint64_t v8 = *((void *)a3 + 67);
    if (v8)
    {
      uint64_t v10 = *(void *)(v8 + 496);
      uint64_t v9 = *(void *)(v8 + 504);
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v9 = 0;
    }
    AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource(*((void **)impl + 199), (uint64_t)a3, 4u, a4);
    int v25 = 3 * v4;
    unint64_t v26 = (int *)MEMORY[0x263F4B188];
    *(void *)&impl[24 * v4 + 82296] = (char *)a3 + (int)*MEMORY[0x263F4B188];
    if (v10) {
      uint64_t v27 = v10 + *v26;
    }
    else {
      uint64_t v27 = 0;
    }
    *(void *)&impl[8 * (v25 + 1) + 82296] = v27;
    if (v9) {
      uint64_t v28 = v9 + *v26;
    }
    else {
      uint64_t v28 = 0;
    }
    uint64_t v29 = (int *)(impl + 36476);
    *(void *)&impl[8 * (v25 + 2) + 82296] = v28;
    uint64_t v11 = v4;
    uint64_t v30 = (uint64_t)&impl[56 * v4 + 68760];
    long long v31 = *(_OWORD *)(v8 + 72);
    long long v32 = *(_OWORD *)(v8 + 88);
    long long v33 = *(_OWORD *)(v8 + 104);
    *(void *)(v30 + 64) = *(void *)(v8 + 120);
    *(_OWORD *)(v30 + 32) = v32;
    *(_OWORD *)(v30 + 48) = v33;
    *(_OWORD *)(v30 + 16) = v31;
    BOOL v15 = v4 > 0x3F;
    uint64_t v14 = 1 << v4;
    *(void *)&impl[8 * v15 + 75944] |= 1 << v4;
    uint64_t v34 = *(void *)(v8 + 488);
    if (v34) {
      uint64_t v34 = *(_DWORD *)(v34 + 1080) != 0;
    }
    *(void *)&impl[8 * v15 + 75960] = *(void *)&impl[8 * v15 + 75960] & ~v14 | (v34 << (v4 & 0x3F));
    long long v35 = &impl[32 * v4 + 50776];
    long long v36 = *(_OWORD *)(v8 + 416);
    *(_OWORD *)long long v35 = *(_OWORD *)(v8 + 400);
    *((_OWORD *)v35 + 1) = v36;
    uint64_t v37 = &impl[32 * v4 + 54872];
    long long v38 = *(_OWORD *)(v8 + 448);
    *(_OWORD *)uint64_t v37 = *(_OWORD *)(v8 + 432);
    *((_OWORD *)v37 + 1) = v38;
    if (*((void *)impl + 185)) {
      MTLResourceListAddResource();
    }
    int v39 = *v29;
    int v40 = *((_DWORD *)impl + 9120);
    if (*(unsigned char *)(v8 + 380)) {
      ++v40;
    }
    else {
      ++v39;
    }
    int *v29 = v39;
    *((_DWORD *)impl + 9120) = v40;
    uint64_t v13 = *(unsigned int *)(*((void *)a3 + 67) + 120);
  }
  else
  {
    *v6 |= 0x10uLL;
    *(void *)&impl[8 * (3 * a4) + 82296] = 0;
    *(void *)&impl[8 * (3 * a4 + 1) + 82296] = 0;
    *(void *)&impl[8 * (3 * a4 + 2) + 82296] = 0;
    uint64_t v11 = a4;
    uint64_t v12 = (uint64_t)&impl[56 * a4 + 68760];
    bzero((void *)(v12 + 16), 0x38uLL);
    uint64_t v13 = 0;
    *(_DWORD *)(v12 + 64) = 0;
    uint64_t v14 = 1 << v4;
    BOOL v15 = v4 > 0x3F;
    uint64_t v16 = (uint64_t)&impl[8 * v15 + 68760];
    *(void *)(v16 + 7184) &= ~(1 << v4);
    *(void *)(v16 + 7200) &= ~(1 << v4);
    uint64_t v17 = *((void *)impl + 182);
    uint64_t v18 = *(void *)(v17 + 808);
    long long v19 = *(_OWORD *)(v18 + 7312);
    long long v20 = *(_OWORD *)(v18 + 7328);
    long long v21 = &impl[32 * v11 + 50776];
    *(_OWORD *)long long v21 = v19;
    *((_OWORD *)v21 + 1) = v20;
    uint64_t v22 = *(void *)(v17 + 808);
    int v23 = &impl[32 * v4 + 54872];
    long long v24 = *(_OWORD *)(v22 + 7360);
    *(_OWORD *)int v23 = *(_OWORD *)(v22 + 7344);
    *((_OWORD *)v23 + 1) = v24;
  }
  *(void *)&impl[8 * v11 + 76048] = v13;
  uint64_t v41 = (uint64_t)&impl[8 * v15 + 90088];
  *(void *)(v41 + 304) = *(void *)&impl[8 * v15 + 90392] | v14;
  *(void *)(v41 + 352) = *(void *)&impl[8 * v15 + 90440] | v14;
  *((void *)impl + 11309) |= 0x5000000000uLL;
  *v6 |= 0x10uLL;
}

- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  unsigned int length = a5.length;
  unsigned int location = a5.location;
  uint64_t v8 = a3;
  impl = self->_impl;
  uint64_t v45 = impl + 11297;
  if (LODWORD(a5.length) && impl[185])
  {
    uint64_t length_low = LODWORD(a5.length);
    uint64_t v11 = a3;
    do
    {
      if (*v11) {
        MTLResourceListAddResource();
      }
      ++v11;
      --length_low;
    }
    while (length_low);
  }
  if (length)
  {
    uint64_t v12 = (char *)(impl + 6148);
    uint64_t v13 = length;
    uint64_t v14 = (int *)MEMORY[0x263F4B188];
    unsigned int v15 = location;
    do
    {
      if (location <= 0x22) {
        impl[location + 10706] = 0;
      }
      uint64_t v20 = (uint64_t)*v8;
      long long v21 = (char *)impl + 4 * v15;
      if (*v8)
      {
        uint64_t v22 = v20 + *v14;
        unint64_t v23 = *(void *)(v22 + 8);
        uint64_t v26 = v22 + 16;
        uint64_t v24 = *(void *)(v22 + 16);
        uint64_t v25 = *(void *)(v26 + 8);
        unint64_t v27 = *a4;
        uint64_t v28 = v15;
        uint64_t v29 = &impl[v28];
        uint64_t v30 = (uint64_t)&impl[v28 + 6148];
        *(void *)(v30 + 536) = *a4 + v23;
        *(void *)(v30 + 1056) = (v24 & 0xFFFFFFFFFFFFFFLL) - v27;
        *(void *)&v12[v28 * 8] = v25 + v27;
        v29[10936] = v23;
        v29[11196] = v25;
        long long v31 = v21 + 68760;
        v31[2159] = v24;
        v31[2224] = v24;
        v31[2289] = v23 >> 8;
        v29[9838] = v20 + *v14;
        AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource((void *)impl[199], v20, 1u, v15);
      }
      else
      {
        uint64_t v16 = v15;
        uint64_t v17 = &impl[v16];
        v17[9838] = 0;
        uint64_t v18 = (uint64_t)&impl[v16 + 6148];
        *(void *)(v18 + 536) = 0;
        *(void *)&v12[v16 * 8] = 0;
        v17[10936] = 0;
        *(void *)(v18 + 1056) = 0;
        v17[11196] = 0;
        long long v19 = v21 + 68760;
        *((_DWORD *)v19 + 2159) = 0;
        *((_DWORD *)v19 + 2224) = 0;
      }
      ++v15;
      ++a4;
      ++v8;
      --v13;
    }
    while (v13);
  }
  unsigned int v32 = length + location;
  uint64_t v33 = -1 << (length + location);
  if (length + location == 128) {
    uint64_t v34 = -1;
  }
  else {
    uint64_t v34 = ~(-1 << (length + location));
  }
  if (v32 < 0x40) {
    uint64_t v35 = ~v33;
  }
  else {
    uint64_t v35 = -1;
  }
  if (v32 >= 0x40) {
    uint64_t v36 = v34;
  }
  else {
    uint64_t v36 = 0;
  }
  uint64_t v37 = -1 << location;
  if (location >= 0x40) {
    uint64_t v37 = 0;
  }
  uint64_t v38 = *v45 | v35 & v37;
  uint64_t v39 = -1 << location;
  if (location < 0x40) {
    uint64_t v39 = -1;
  }
  uint64_t v40 = impl[11298] | v36 & v39;
  *uint64_t v45 = v38;
  impl[11298] = v40;
  if (v32 == 128) {
    uint64_t v41 = -1;
  }
  else {
    uint64_t v41 = ~(-1 << v32);
  }
  if (v32 < 0x40) {
    uint64_t v42 = ~v33;
  }
  else {
    uint64_t v42 = -1;
  }
  if (v32 >= 0x40) {
    uint64_t v43 = v41;
  }
  else {
    uint64_t v43 = 0;
  }
  uint64_t v44 = impl[11304] | v43 & v39;
  impl[11303] |= v42 & v37;
  impl[11304] = v44;
  impl[11309] |= 0x3000000000uLL;
}

- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  impl = self->_impl;
  int v5 = &impl[2 * a4];
  uint64_t v6 = v5[10936];
  uint64_t v7 = v5[11196];
  v5 += 6148;
  uint64_t v8 = v5[67];
  uint64_t v9 = v5[132];
  uint64_t v10 = v6 + a3;
  v5[67] = v10;
  v5[132] = v8 - v10 + v9;
  *int v5 = v7 + a3;
  impl[a4 + 19414] = impl[a4 + 19349];
  impl += 22522;
  *(void *)&impl[2 * ((a4 & 0xFFFFFFC0) != 0) + 72] |= 1 << a4;
  *((void *)impl + 48) |= 0x1000000000uLL;
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unsigned int v5 = a5;
  impl = self->_impl;
  if (a5 <= 0x22) {
    impl[a5 + 10706] = 0;
  }
  if (a3)
  {
    uint64_t v7 = (int *)MEMORY[0x263F4B188];
    uint64_t v8 = (char *)a3 + (int)*MEMORY[0x263F4B188];
    unint64_t v9 = *((void *)v8 + 1);
    uint64_t v12 = v8 + 16;
    uint64_t v10 = *((void *)v8 + 2);
    uint64_t v11 = *((void *)v12 + 1);
    uint64_t v13 = &impl[a5];
    v13[10936] = v9;
    v13[11196] = v11;
    v13[6215] = v9 + a4;
    v13[6280] = (v10 & 0xFFFFFFFFFFFFFFLL) - a4;
    v13[6148] = v11 + a4;
    uint64_t v14 = (_DWORD *)impl + a5 + 17190;
    v14[2159] = v10;
    v14[2224] = v10;
    v14[2289] = v9 >> 8;
    v13[9838] = (char *)a3 + *v7;
    AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource((void *)impl[199], (uint64_t)a3, 1u, a5);
    if (impl[185]) {
      MTLResourceListAddResource();
    }
  }
  else
  {
    unsigned int v15 = &impl[a5];
    v15[9838] = 0;
    v15[10936] = 0;
    v15[11196] = 0;
    v15 += 6148;
    v15[67] = 0;
    v15[132] = 0;
    void *v15 = 0;
    uint64_t v16 = (uint64_t)impl + 4 * a5 + 68760;
    *(_DWORD *)(v16 + 8636) = 0;
    *(_DWORD *)(v16 + 8896) = 0;
  }
  uint64_t v17 = (uint64_t)&impl[(v5 > 0x3F) + 11261];
  *(void *)(v17 + 288) |= 1 << v5;
  *(void *)(v17 + 336) |= 1 << v5;
  impl[11309] |= 0x3000000000uLL;
}

- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unsigned int v5 = a5;
  impl = self->_impl;
  unint64_t v9 = a4 + 15;
  unint64_t v10 = (a4 + 15) | 0xF;
  uint64_t v11 = impl[24];
  uint64_t v12 = v11 + v10;
  if (v11 + v10 <= impl[23])
  {
LABEL_2:
    impl[25] = v12;
    goto LABEL_3;
  }
  int v20 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 2, 4, 0);
  uint64_t v11 = impl[24];
  if (v20)
  {
    uint64_t v12 = v11 + v10;
    if (v11 + v10 > impl[23]) {
      abort();
    }
    goto LABEL_2;
  }
LABEL_3:
  unint64_t v13 = v9 & 0xFFFFFFFFFFFFFFF0;
  uint64_t v14 = (char *)((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = impl[26];
  impl[24] = &v14[v13];
  memcpy(v14, a3, a4);
  uint64_t v16 = *(void *)(impl[5] + 288);
  uint64_t v17 = (int)*MEMORY[0x263F4B188];
  if (v5 <= 0x22) {
    impl[v5 + 10706] = 0;
  }
  impl[(v5 > 0x3F) + 11297] |= 1 << v5;
  impl[11309] |= 0x1000000000uLL;
  uint64_t v18 = &impl[v5];
  v18[6215] = &v14[v15];
  v18[6280] = v13;
  v18[9838] = v16 + v17;
  long long v19 = (_DWORD *)impl + v5 + 17190;
  v19[2159] = a4;
  v19[2224] = a4;
  v19[2289] = (unint64_t)&v14[v15] >> 8;
}

- (void)setTriangleFillMode:(unint64_t)a3
{
  impl = self->_impl;
  if (impl[4827] != a3) {
    impl[11309] |= 0x100000000000uLL;
  }
  impl[4827] = a3;
  *((_DWORD *)impl + 9302) = impl[4651] & 0xFFF3FFFF | ((a3 & 3) << 18);
  *((_DWORD *)impl + 9304) = impl[4652] & 0xFFF3FFFF | ((a3 & 3) << 18);
  unint64_t v4 = 73;
  if (a3 != 1) {
    unint64_t v4 = 0;
  }
  *(void *)((char *)impl + ((v4 >> 3) & 8) + 91168) |= 1 << (v4 & 0x3F);
}

- (void)setScissorRects:(id *)a3 count:(unint64_t)a4
{
  impl = self->_impl;
  AGX::ClipRectContextGen3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setScissors((uint64_t)(impl + 4660), (int64x2_t *)a3, a4);
  impl[11309] |= 0x200000000000uLL;
}

- (void)setScissorRect:(id *)a3
{
  impl = self->_impl;
  AGX::ClipRectContextGen3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setScissors((uint64_t)(impl + 4660), (int64x2_t *)a3, 1u);
  impl[11309] |= 0x200000000000uLL;
}

- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5
{
  impl = (char *)self->_impl;
  if (*((float *)impl + 9606) != a3 || *((float *)impl + 9607) != a4 || *((float *)impl + 9608) != a5)
  {
    uint64_t v6 = impl + 90472;
    *((float *)impl + 9606) = a3;
    *((float *)impl + 9607) = a4;
    *((float *)impl + 9608) = a5;
    uint64_t v7 = *((void *)impl + 11309);
    if (a3 == 0.0 && a4 == 0.0)
    {
      *uint64_t v6 = v7 & 0xFFFFBFFFFFFFFFFFLL;
    }
    else
    {
      *uint64_t v6 = v7 | 0x400000000000;
      *((void *)impl + 11396) |= 0x400000000000000uLL;
    }
  }
}

- (void)setLineWidth:(float)a3
{
  impl = (float *)self->_impl;
  if (impl[9656] != a3)
  {
    impl[9656] = a3;
    *((void *)impl + 11309) |= 0x100000000000uLL;
  }
}

- (void)setDepthClipMode:(unint64_t)a3
{
  impl = self->_impl;
  impl[4829] = a3;
  *((_DWORD *)impl + 9299) = *((_DWORD *)impl + 9299) & 0xFFFFF3FF | ((((1024 << a3) >> 10) & 3) << 10);
  int v4 = a3 == 1;
  int v5 = *((unsigned __int8 *)impl + 38084);
  *((unsigned char *)impl + 38084) = v4;
  uint64_t v6 = 0x200000000000000;
  if (a3 != 1) {
    uint64_t v6 = 1;
  }
  if (v5 == v4) {
    uint64_t v7 = impl[11309];
  }
  else {
    uint64_t v7 = impl[11309] | 0xC0200000000000;
  }
  impl[11309] = v7 | 0x2000000000000;
  impl[11396] |= v6;
}

- (void)setCullMode:(unint64_t)a3
{
  impl = self->_impl;
  impl[4805] = a3;
  *((_DWORD *)impl + 9299) = a3 & 3 | ((impl[4806] & 1) << 16) | *((_DWORD *)impl + 9299) & 0xFFFEFFFC;
  impl[11309] |= 0x2000000000000uLL;
}

- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4
{
}

- (void)setVertexAmplificationMode:(unint64_t)a3 value:(unint64_t)a4
{
  impl = (char *)self->_impl;
  uint64_t v6 = impl + 90168;
  uint64_t v7 = (unsigned __int32 *)(impl + 67840);
  uint64_t v8 = impl + 36552;
  v4.i32[0] = (unsigned __int16)a4;
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v4);
  v9.i16[0] = vaddlv_u8(v9);
  if (a3 == 1) {
    int v10 = (unsigned __int16)a4;
  }
  else {
    int v10 = ~(-1 << a4);
  }
  if (a3 == 1) {
    unsigned __int32 v11 = v9.i32[0];
  }
  else {
    unsigned __int32 v11 = a4;
  }
  *((_DWORD *)v8 + 526) = v11;
  unsigned __int32 *v7 = v11;
  v7[1] = v10;
  uint64_t v12 = v6[38];
  v6[38] = v12 | 0x40;
  *v6 |= 0x80uLL;
  uint64_t v13 = *((void *)v8 + 301);
  if (v13)
  {
    uint64_t v14 = *(void *)(v13 + 3576);
    *((_DWORD *)v8 + 175) = *((_DWORD *)v8 + 175) & 0xF0E3FF00 | v14 & 0xF1C00FF;
    *((_DWORD *)v8 + 177) = *((_DWORD *)v8 + 177) & 0xFFFFFFF8 | ((_BYTE)v11 - 1) & 7;
    *((_DWORD *)v8 + 178) = HIDWORD(v14);
    *((_DWORD *)v8 + 176) = 0;
    v6[38] = v12 | 0x44;
  }
  uint64_t v15 = *(void *)v8;
  if (*(void *)v8)
  {
    uint64_t v16 = *(void **)(v15 + 8);
    uint64_t v17 = 8 * v11;
    uint64_t v18 = (v17 + 15) | 0xF;
    unint64_t v19 = v16[20] + v18;
    if (v19 > v16[19])
    {
      if (!AGX::DataBufferAllocator<34ul>::growNoInline(v16 + 2, 3, 0))
      {
LABEL_12:
        int v20 = v16 + 11327;
        uint64_t v21 = (v17 + 15) & 0xFFFFFFFF0;
        uint64_t v22 = *(void *)(v15 + 8);
        unint64_t v23 = (char *)((*(void *)(v22 + 160) + 15) & 0xFFFFFFFFFFFFFFF0);
        unint64_t v24 = (unint64_t)&v23[*(void *)(v22 + 176)];
        *(void *)(v22 + 160) = &v23[v21];
        memcpy(v23, v20, 8 * v11);
        uint64_t v25 = *(void **)(v15 + 8);
        uint64_t v26 = *(void *)(v25[5] + 224) + (int)*MEMORY[0x263F4B188];
        unint64_t v27 = v25 + 11285;
        v25[11285] |= 0x400000000000000uLL;
        v25[11309] |= 0x4000000uLL;
        uint64_t v28 = *(void *)(v15 + 14464);
        *(void *)(v28 + 1000) = v24;
        *(void *)(v28 + 1520) = v21;
        *(void *)(v15 + 24120) = v26;
        *(_DWORD *)(v15 + 23108) = 8 * v11;
        *(_DWORD *)(v15 + 23368) = 8 * v11;
        *(_DWORD *)(v15 + 23628) = v24 >> 8;
        *(_DWORD *)(v15 + 9404) = v11;
        *(_DWORD *)(v15 + 22868) = v11;
        uint64_t v29 = *(void *)(v15 + 40);
        if (v29)
        {
          uint64_t v30 = (_DWORD *)v25 + 9313;
          unint64_t v31 = *(void *)(v29 + 3344);
          int v32 = *(_DWORD *)(v29 + 3352);
          unint64_t v33 = HIDWORD(v31);
          LODWORD(v31) = *v30 & 0xF0E3FF00 | v31 & 0xF1C00FF;
          v30[2] = v30[2] & 0xFFFFFFF8 | (v30[351] - 1) & 7;
          v30[3] = v33;
          _DWORD *v30 = v31;
          v30[1] = v32;
          v27[24] |= 4uLL;
        }
        return;
      }
      unint64_t v19 = v16[20] + v18;
      if (v19 > v16[19]) {
        abort();
      }
    }
    v16[21] = v19;
    goto LABEL_12;
  }
}

- (void)setFrontFacingWinding:(unint64_t)a3
{
  impl = (char *)self->_impl;
  int8x8_t v4 = impl + 38440;
  int v5 = impl + 37196;
  *((void *)impl + 4806) = a3;
  int v6 = *((_DWORD *)impl + 9309) >> 28;
  if (v6) {
    BOOL v7 = (v6 - 5) > 1;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    uint64_t v8 = impl + 77384;
    *(_DWORD *)uint64_t v8 = 0;
    int v9 = *((_DWORD *)v5 + 19);
    *((_DWORD *)v5 + 4) = *((_DWORD *)v5 + 18);
    *((_DWORD *)v5 + 6) = v9;
    int v10 = v4[5];
    v5[12] = v4[4];
    v5[20] = v10;
    uint64_t v11 = *((void *)v8 + 1636);
    *(_DWORD *)int v5 = *v4 & 3 | ((a3 & 1) << 16) | *(_DWORD *)v5 & 0xFFFEFFFC;
    *((void *)v8 + 1636) = v11 | 0x2100000000000;
  }
}

- (void)setViewports:(id *)a3 count:(unint64_t)a4
{
  unsigned int v4 = a4;
  impl = self->_impl;
  int v6 = impl + 11309;
  AGX::ClipRectContextGen3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setViewports((uint64_t)(impl + 4660), (uint64_t)a3, a4, *(unsigned __int8 *)(impl[246] + 3907));
  *v6 |= 0x81200000000000uLL;
  if (v4 >= 2) {
    v6[88] |= 0x100000uLL;
  }
}

- (void)setViewport:(id *)a3
{
  impl = self->_impl;
  AGX::ClipRectContextGen3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setViewports((uint64_t)(impl + 4660), (uint64_t)a3, 1u, *(unsigned __int8 *)(impl[246] + 3907));
  impl[11309] |= 0x81200000000000uLL;
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  impl = self->_impl;
  impl[382] = impl[381];
  if (*((void *)impl + 185)) {
    MTLResourceListAddResource();
  }
  AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(*((void **)impl + 199), (uint64_t)a4, 65);
  IOGPUResourceListAddResource();
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::executeCommandsInBufferCommon((uint64_t)impl);
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  impl = self->_impl;
  int v6 = impl[381];
  impl[382] = v6;
  if (LODWORD(a4.length))
  {
    AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::executeCommandsInBufferCommon((uint64_t)impl);
    impl = self->_impl;
    int v6 = impl[381];
  }
  impl[383] = v6;
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v4 = a4;
    if (*((void *)self->_impl + 185))
    {
      do
      {
        if (*a3)
        {
          MTLResourceListAddResource();
          IOGPUResourceListAddResource();
        }
        ++a3;
        --v4;
      }
      while (v4);
    }
    else
    {
      do
      {
        if (*a3) {
          IOGPUResourceListAddResource();
        }
        ++a3;
        --v4;
      }
      while (v4);
    }
  }
}

- (void)useResidencySet:(id)a3
{
  if (*((void *)self->_impl + 185))
  {
    if (!a3) {
      return;
    }
    MTLResourceListAddResource();
  }
  else if (!a3)
  {
    return;
  }

  IOGPUResourceListAddResource();
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
}

- (void)useHeap:(id)a3
{
  impl = self->_impl;
  if ([a3 type] == 2)
  {
    for (uint64_t i = *((void *)a3 + 7); i != *((void *)a3 + 8); i += 8)
    {
      if (impl[185]) {
        MTLResourceListAddResource();
      }
      IOGPUResourceListAddResource();
    }
  }
  else if (a3)
  {
    if (impl[185]) {
      MTLResourceListAddResource();
    }
    IOGPUResourceListAddResource();
  }
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5
{
}

- (void)useHeap:(id)a3 stages:(unint64_t)a4
{
  impl = self->_impl;
  if ([a3 type] == 2)
  {
    for (uint64_t i = *((void *)a3 + 7); i != *((void *)a3 + 8); i += 8)
    {
      if (impl[185]) {
        MTLResourceListAddResource();
      }
      IOGPUResourceListAddResource();
    }
  }
  else if (a3)
  {
    if (impl[185]) {
      MTLResourceListAddResource();
    }
    IOGPUResourceListAddResource();
  }
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  char v5 = a5;
  unsigned int v6 = a4;
  impl = (void **)self->_impl;
  if (a4)
  {
    uint64_t v9 = a4;
    int v10 = (int *)MEMORY[0x263F4B188];
    uint64_t v11 = a3;
    do
    {
      uint64_t v12 = *v11;
      if (*v11 && *(void *)((char *)v12 + *v10 + 16) >> 61 == 3)
      {
        AGX::UserIntersectionFunctionTableGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::bindResources(v12[37]);
        AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(impl[199], *(void *)(v12[37] + 96), 5);
      }
      ++v11;
      --v9;
    }
    while (v9);
  }
  if ((v5 & 7) != 0) {
    int v13 = 5;
  }
  else {
    int v13 = 0;
  }
  if ((v5 & 2) != 0) {
    int v14 = 13;
  }
  else {
    int v14 = v13;
  }

  AGX::ContextCommon<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::useResourcesCommon((uint64_t)impl, (uint64_t *)a3, v6, 5, v14);
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  if ((a4 & 7) != 0) {
    int v4 = 5;
  }
  else {
    int v4 = 0;
  }
  if ((a4 & 2) != 0) {
    int v5 = 13;
  }
  else {
    int v5 = v4;
  }
  if (a3)
  {
    impl = (void **)self->_impl;
    if (*(void *)((char *)a3 + *MEMORY[0x263F4B188] + 16) >> 61 == 3)
    {
      AGX::UserIntersectionFunctionTableGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::bindResources(*((void *)a3 + 37));
      AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(impl[199], *(void *)(*((void *)a3 + 37) + 96), 5);
    }
    AGX::ContextCommon<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::useResourceCommon((uint64_t)impl, (uint64_t)a3, 5, v5);
  }
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6
{
  unsigned int v6 = a4;
  int v7 = a6 & 1;
  if ((a6 & 0x18) != 0) {
    int v7 = 1;
  }
  int v8 = v7 | 4;
  if ((a6 & 6) == 0) {
    int v8 = v7;
  }
  int v9 = v8 | 2;
  if (!v7) {
    int v9 = 0;
  }
  unsigned int v10 = v7 | 0xC;
  if ((a6 & 6) != 0)
  {
    char v11 = 1;
  }
  else
  {
    unsigned int v10 = v9;
    char v11 = 0;
  }
  if (v7) {
    unsigned int v12 = (a5 & 7) != 0;
  }
  else {
    unsigned int v12 = 0;
  }
  if ((((a5 & 7) != 0) & v11) != 0) {
    v12 |= 4u;
  }
  if ((a5 & 2) != 0) {
    uint64_t v13 = v10;
  }
  else {
    uint64_t v13 = v12;
  }
  if (a4)
  {
    unint64_t v15 = 0;
    impl = (void **)self->_impl;
    uint64_t v17 = 8 * a4;
    uint64_t v18 = (int *)MEMORY[0x263F4B188];
    do
    {
      unint64_t v19 = a3[v15 / 8];
      if (v19 && *(void *)((char *)v19 + *v18 + 16) >> 61 == 3)
      {
        AGX::UserIntersectionFunctionTableGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::bindResources(v19[37]);
        AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(impl[199], *(void *)(v19[37] + 96), v13);
      }
      v15 += 8;
    }
    while (v17 != v15);
    AGX::ContextCommon<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::useResourcesCommon((uint64_t)impl, (uint64_t *)a3, v6, v13, v13);
  }
}

- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  int v5 = a5 & 1;
  if ((a5 & 0x18) != 0) {
    int v5 = 1;
  }
  int v6 = v5 | 4;
  if ((a5 & 6) == 0) {
    int v6 = v5;
  }
  int v7 = v6 | 2;
  if (!v5) {
    int v7 = 0;
  }
  unsigned int v8 = v5 | 0xC;
  if ((a5 & 6) != 0)
  {
    char v9 = 1;
  }
  else
  {
    unsigned int v8 = v7;
    char v9 = 0;
  }
  if (v5) {
    unsigned int v10 = (a4 & 7) != 0;
  }
  else {
    unsigned int v10 = 0;
  }
  if ((((a4 & 7) != 0) & v9) != 0) {
    v10 |= 4u;
  }
  if ((a4 & 2) != 0) {
    uint64_t v11 = v8;
  }
  else {
    uint64_t v11 = v10;
  }
  if (a3)
  {
    impl = (void **)self->_impl;
    if (*(void *)((char *)a3 + *MEMORY[0x263F4B188] + 16) >> 61 == 3)
    {
      AGX::UserIntersectionFunctionTableGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::bindResources(*((void *)a3 + 37));
      AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(impl[199], *(void *)(*((void *)a3 + 37) + 96), v11);
    }
    AGX::ContextCommon<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::useResourceCommon((uint64_t)impl, (uint64_t)a3, v11, v11);
  }
}

- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  impl = self->_impl;
  unsigned int location = a6.location;
  int length = a6.length;
  if (LODWORD(a6.length))
  {
    unsigned int v10 = impl + 6097;
    uint64_t length_low = LODWORD(a6.length);
    unsigned int v12 = impl + 6113;
    unsigned int v13 = a6.location;
    do
    {
      if (*a3)
      {
        uint64_t v15 = impl[182];
        uint64_t v16 = *(void *)(v15 + 808);
        unsigned int v17 = *(_DWORD *)a4;
        unsigned int v18 = *(_DWORD *)a5;
        unint64_t v19 = (char *)*a3 + 48;
        long long v21 = *((_OWORD *)*a3 + 4);
        long long v20 = *((_OWORD *)*a3 + 5);
        v33[0] = *(_OWORD *)v19;
        v33[1] = v21;
        v33[2] = v20;
        if (v19[71] < 0)
        {
          std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)v19 + 6), *((void *)v19 + 7));
        }
        else
        {
          long long v22 = *((_OWORD *)v19 + 3);
          __p.__r_.__value_.__r.__words[2] = *((void *)v19 + 8);
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v22;
        }
        *((void *)&v33[0] + 1) = __PAIR64__(v18, v17);
        Sampler = AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::findOrCreateSampler(v16, (uint64_t)v33, v15, 0);
        if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
          if (!impl[185]) {
            goto LABEL_16;
          }
LABEL_15:
          MTLResourceListAddResource();
          goto LABEL_16;
        }
        operator delete(__p.__r_.__value_.__l.__data_);
        if (impl[185]) {
          goto LABEL_15;
        }
      }
      else
      {
        Sampler = 0;
        if (impl[185]) {
          goto LABEL_15;
        }
      }
LABEL_16:
      uint64_t v24 = (uint64_t)&impl[v13 + 4874];
      if (Sampler)
      {
        *(void *)(v24 + 9784) = *(void *)&Sampler->_impl.desc.label.__r_.var0;
        if ((~*v10 & 0x6000000000000000) == 0) {
LABEL_3:
        }
          _OWORD *v12 = *(_OWORD *)&Sampler->_impl.desc.label.var0;
        p_impl = &Sampler->_impl;
        if (LODWORD(Sampler[1].super._device)) {
          p_impl = (Sampler *)LODWORD(Sampler[1].super._device);
        }
        goto LABEL_6;
      }
      *(void *)(v24 + 9784) = 0;
      if ((~*v10 & 0x6000000000000000) == 0) {
        goto LABEL_3;
      }
      p_impl = 0;
LABEL_6:
      impl[v13++ + 8452] = p_impl;
      ++v10;
      ++v12;
      ++a5;
      ++a4;
      ++a3;
      --length_low;
    }
    while (length_low);
  }
  unsigned int v25 = length + location;
  if (length + location == 128) {
    uint64_t v26 = -1;
  }
  else {
    uint64_t v26 = ~(-1 << (length + location));
  }
  if (v25 < 0x40) {
    uint64_t v27 = ~(-1 << (length + location));
  }
  else {
    uint64_t v27 = -1;
  }
  if (v25 >= 0x40) {
    uint64_t v28 = v26;
  }
  else {
    uint64_t v28 = 0;
  }
  uint64_t v29 = -1 << location;
  if (location < 0x40) {
    uint64_t v29 = -1;
  }
  uint64_t v30 = -1 << location;
  if (location >= 0x40) {
    uint64_t v30 = 0;
  }
  impl[11265] |= v27 & v30;
  impl[11266] |= v28 & v29;
  impl[11309] |= 0x40uLL;
}

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  unsigned int v6 = a6;
  impl = self->_impl;
  if (a3)
  {
    uint64_t v10 = impl[182];
    uint64_t v11 = *(void *)(v10 + 808);
    long long v12 = *((_OWORD *)a3 + 4);
    v17[0] = *((_OWORD *)a3 + 3);
    v17[1] = v12;
    v17[2] = *((_OWORD *)a3 + 5);
    if (*((char *)a3 + 119) < 0) {
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a3 + 12), *((void *)a3 + 13));
    }
    else {
      std::string __p = *(std::string *)((unsigned char *)a3 + 4);
    }
    *((void *)&v17[0] + 1) = __PAIR64__(LODWORD(a5), LODWORD(a4));
    Sampler = AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::findOrCreateSampler(v11, (uint64_t)v17, v10, 0);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    Sampler = 0;
  }
  if (impl[185]) {
    MTLResourceListAddResource();
  }
  if (Sampler)
  {
    p_impl = &Sampler->_impl;
    uint64_t v15 = *(void *)&Sampler->_impl.desc.label.__r_.var0;
    uint64_t v16 = v6;
    impl[v6 + 6097] = v15;
    if ((~v15 & 0x6000000000000000) == 0) {
      *(_OWORD *)&impl[2 * v6 + 6113] = *(_OWORD *)&Sampler->_impl.desc.label.var0;
    }
    if (LODWORD(Sampler[1].super._device)) {
      p_impl = (Sampler *)LODWORD(Sampler[1].super._device);
    }
  }
  else
  {
    p_impl = 0;
    uint64_t v16 = v6;
    impl[v6 + 6097] = 0;
  }
  impl[v16 + 8452] = p_impl;
  impl[((v6 & 0xFFFFFFC0) != 0) + 11265] |= 1 << v6;
  impl[11309] |= 0x40uLL;
}

- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  unsigned int length = a4.length;
  unsigned int location = a4.location;
  unsigned int v6 = a3;
  impl = self->_impl;
  if (LODWORD(a4.length) && impl[185])
  {
    uint64_t length_low = LODWORD(a4.length);
    char v9 = a3;
    do
    {
      if (*v9) {
        MTLResourceListAddResource();
      }
      ++v9;
      --length_low;
    }
    while (length_low);
  }
  if (length)
  {
    uint64_t v10 = length;
    uint64_t v11 = impl + 6113;
    long long v12 = impl + 6097;
    unsigned int v13 = location;
    while (1)
    {
      uint64_t v16 = *v6;
      uint64_t v17 = (uint64_t)&impl[v13 + 4874];
      if (*v6) {
        break;
      }
      *(void *)(v17 + 9784) = 0;
      if ((~*v12 & 0x6000000000000000) == 0) {
        goto LABEL_9;
      }
      uint64_t v15 = 0;
LABEL_12:
      impl[v13++ + 8452] = v15;
      ++v12;
      ++v11;
      ++v6;
      if (!--v10) {
        goto LABEL_18;
      }
    }
    *(void *)(v17 + 9784) = v16[15];
    if ((~*v12 & 0x6000000000000000) == 0) {
LABEL_9:
    }
      _OWORD *v11 = *((_OWORD *)v16 + 8);
    int v14 = (char *)(v16 + 6);
    uint64_t v15 = (char *)*((unsigned int *)v14 + 24);
    if (!v15) {
      uint64_t v15 = v14;
    }
    goto LABEL_12;
  }
LABEL_18:
  unsigned int v18 = length + location;
  if (length + location == 128) {
    uint64_t v19 = -1;
  }
  else {
    uint64_t v19 = ~(-1 << (length + location));
  }
  if (v18 < 0x40) {
    uint64_t v20 = ~(-1 << (length + location));
  }
  else {
    uint64_t v20 = -1;
  }
  if (v18 >= 0x40) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t v22 = -1 << location;
  if (location < 0x40) {
    uint64_t v22 = -1;
  }
  uint64_t v23 = -1 << location;
  if (location >= 0x40) {
    uint64_t v23 = 0;
  }
  impl[11265] |= v20 & v23;
  impl[11266] |= v21 & v22;
  impl[11309] |= 0x40uLL;
}

- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  impl = self->_impl;
  if (impl[185]) {
    MTLResourceListAddResource();
  }
  if (a3)
  {
    int v7 = (char *)a3 + 48;
    uint64_t v8 = *((void *)a3 + 15);
    uint64_t v9 = v4;
    impl[v4 + 6097] = v8;
    if ((~v8 & 0x6000000000000000) == 0) {
      *(_OWORD *)&impl[2 * v4 + 6113] = *((_OWORD *)a3 + 8);
    }
    if (*((_DWORD *)a3 + 36)) {
      int v7 = (char *)*((unsigned int *)a3 + 36);
    }
  }
  else
  {
    int v7 = 0;
    uint64_t v9 = v4;
    impl[v4 + 6097] = 0;
  }
  impl[v9 + 8452] = v7;
  impl[((v4 & 0xFFFFFFC0) != 0) + 11265] |= 1 << v4;
  impl[11309] |= 0x40uLL;
}

- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4
{
  unsigned int length = a4.length;
  unsigned int location = a4.location;
  int v5 = a3;
  impl = (int8x16_t *)self->_impl;
  uint64_t v53 = &impl[5631].i64[1];
  if (LODWORD(a4.length) && impl[92].i64[1])
  {
    uint64_t length_low = LODWORD(a4.length);
    uint64_t v8 = a3;
    do
    {
      if (*v8) {
        MTLResourceListAddResource();
      }
      ++v8;
      --length_low;
    }
    while (length_low);
  }
  unsigned int v54 = length;
  if (length)
  {
    v58 = impl + 4161;
    v59 = impl + 4160;
    uint64_t v9 = length;
    v57 = &impl[4951].i8[8];
    unsigned int v56 = &impl[2536].i8[8];
    unsigned int v10 = location;
    unsigned int v11 = 3 * location;
    do
    {
      uint64_t v23 = (uint64_t)*v5;
      if (*v5)
      {
        uint64_t v24 = *(void *)(v23 + 536);
        uint64_t v12 = v10;
        unsigned int v25 = &impl[2 * v10 + 2536].u64[1];
        long long v26 = *(_OWORD *)(v24 + 416);
        *(_OWORD *)unsigned int v25 = *(_OWORD *)(v24 + 400);
        *((_OWORD *)v25 + 1) = v26;
        uint64_t v27 = &impl[2 * v10 + 2792].u64[1];
        long long v28 = *(_OWORD *)(v24 + 448);
        *(_OWORD *)uint64_t v27 = *(_OWORD *)(v24 + 432);
        *((_OWORD *)v27 + 1) = v28;
        uint64_t v29 = *(void *)(v23 + 536);
        if (v29)
        {
          uint64_t v31 = *(void *)(v29 + 496);
          uint64_t v30 = *(void *)(v29 + 504);
        }
        else
        {
          uint64_t v31 = 0;
          uint64_t v30 = 0;
        }
        AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource((void *)impl[99].i64[1], v23, 3u, v10);
        int v32 = (int *)MEMORY[0x263F4B188];
        impl[4951].i64[v11 + 1] = v23 + (int)*MEMORY[0x263F4B188];
        if (v31) {
          uint64_t v33 = v31 + *v32;
        }
        else {
          uint64_t v33 = 0;
        }
        impl[4952].i64[v11] = v33;
        if (v30) {
          uint64_t v34 = v30 + *v32;
        }
        else {
          uint64_t v34 = 0;
        }
        impl[4952].i64[v11 + 1] = v34;
        uint64_t v35 = &impl->i8[56 * v10];
        long long v36 = *(_OWORD *)(v24 + 72);
        long long v37 = *(_OWORD *)(v24 + 88);
        long long v38 = *(_OWORD *)(v24 + 104);
        *((void *)v35 + 7430) = *(void *)(v24 + 120);
        *((_OWORD *)v35 + 3714) = v38;
        *((_OWORD *)v35 + 3713) = v37;
        *((_OWORD *)v35 + 3712) = v36;
        v59->i64[v10 > 0x3F] |= 1 << v10;
        uint64_t v39 = *(void *)(v24 + 488);
        if (v39) {
          LODWORD(v39) = *(_DWORD *)(v39 + 1080) != 0;
        }
        v58->i64[v10 > 0x3F] = v58->i64[v10 > 0x3F] & ~(1 << v10) | ((unint64_t)v39 << (v10 & 0x3F));
        uint64_t v13 = *(unsigned int *)(*(void *)(v23 + 536) + 120);
      }
      else
      {
        *(void *)&v57[8 * v11] = 0;
        *(void *)&v57[8 * v11 + 8] = 0;
        *(void *)&v57[8 * v11 + 16] = 0;
        uint64_t v12 = v10;
        bzero((char *)&impl[3712] + 56 * v10, 0x38uLL);
        uint64_t v13 = 0;
        uint64_t v14 = v10 > 0x3F;
        v59->i64[v14] &= ~(1 << v10);
        v58->i64[v14] &= ~(1 << v10);
        impl[3715].i32[14 * v10] = 0;
        uint64_t v15 = impl[91].i64[0];
        uint64_t v16 = *(void *)(v15 + 808);
        long long v17 = *(_OWORD *)(v16 + 7312);
        long long v18 = *(_OWORD *)(v16 + 7328);
        uint64_t v19 = &v56[32 * v10];
        *(_OWORD *)uint64_t v19 = v17;
        *((_OWORD *)v19 + 1) = v18;
        uint64_t v20 = *(void *)(v15 + 808);
        uint64_t v21 = &v56[32 * v10 + 4096];
        long long v22 = *(_OWORD *)(v20 + 7360);
        *(_OWORD *)uint64_t v21 = *(_OWORD *)(v20 + 7344);
        *((_OWORD *)v21 + 1) = v22;
      }
      impl[4162].i64[v12] = v13;
      ++v10;
      ++v5;
      v11 += 3;
      --v9;
    }
    while (v9);
  }
  unsigned int v40 = v54 + location;
  uint64_t v41 = -1 << (v54 + location);
  if (v54 + location == 128) {
    uint64_t v42 = -1;
  }
  else {
    uint64_t v42 = ~(-1 << (v54 + location));
  }
  if (v40 < 0x40) {
    uint64_t v43 = ~v41;
  }
  else {
    uint64_t v43 = -1;
  }
  if (v40 >= 0x40) {
    uint64_t v44 = v42;
  }
  else {
    uint64_t v44 = 0;
  }
  uint64_t v45 = -1 << location;
  if (location >= 0x40) {
    uint64_t v45 = 0;
  }
  uint64_t v46 = *v53 | v43 & v45;
  uint64_t v47 = -1 << location;
  if (location < 0x40) {
    uint64_t v47 = -1;
  }
  uint64_t v48 = impl[5632].i64[0] | v44 & v47;
  *uint64_t v53 = v46;
  impl[5632].i64[0] = v48;
  if (v40 == 128) {
    uint64_t v49 = -1;
  }
  else {
    uint64_t v49 = ~(-1 << v40);
  }
  if (v40 < 0x40) {
    uint64_t v50 = ~v41;
  }
  else {
    uint64_t v50 = -1;
  }
  if (v40 >= 0x40) {
    uint64_t v51 = v49;
  }
  else {
    uint64_t v51 = 0;
  }
  impl[5634].i64[1] |= v50 & v45;
  impl[5654].i64[1] |= 0x140uLL;
  int8x16_t v52 = (int8x16_t)vdupq_n_s64(0x10uLL);
  v52.i64[0] = v51 & v47;
  impl[5635] = vorrq_s8(impl[5635], v52);
}

- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  impl = (char *)self->_impl;
  unsigned int v6 = impl + 90168;
  if (a3)
  {
    uint64_t v8 = *((void *)a3 + 67);
    if (v8)
    {
      uint64_t v10 = *(void *)(v8 + 496);
      uint64_t v9 = *(void *)(v8 + 504);
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v9 = 0;
    }
    AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource(*((void **)impl + 199), (uint64_t)a3, 3u, a4);
    int v25 = 3 * v4;
    long long v26 = (int *)MEMORY[0x263F4B188];
    *(void *)&impl[24 * v4 + 79224] = (char *)a3 + (int)*MEMORY[0x263F4B188];
    if (v10) {
      uint64_t v27 = v10 + *v26;
    }
    else {
      uint64_t v27 = 0;
    }
    *(void *)&impl[8 * (v25 + 1) + 79224] = v27;
    if (v9) {
      uint64_t v28 = v9 + *v26;
    }
    else {
      uint64_t v28 = 0;
    }
    *(void *)&impl[8 * (v25 + 2) + 79224] = v28;
    uint64_t v11 = v4;
    uint64_t v29 = (uint64_t)&impl[56 * v4 + 59376];
    long long v30 = *(_OWORD *)(v8 + 72);
    long long v31 = *(_OWORD *)(v8 + 88);
    long long v32 = *(_OWORD *)(v8 + 104);
    *(void *)(v29 + 64) = *(void *)(v8 + 120);
    *(_OWORD *)(v29 + 32) = v31;
    *(_OWORD *)(v29 + 48) = v32;
    *(_OWORD *)(v29 + 16) = v30;
    BOOL v15 = v4 > 0x3F;
    uint64_t v14 = 1 << v4;
    *(void *)&impl[8 * v15 + 66560] |= 1 << v4;
    uint64_t v33 = *(void *)(v8 + 488);
    if (v33) {
      uint64_t v33 = *(_DWORD *)(v33 + 1080) != 0;
    }
    *(void *)&impl[8 * v15 + 66576] = *(void *)&impl[8 * v15 + 66576] & ~v14 | (v33 << (v4 & 0x3F));
    uint64_t v34 = &impl[32 * v4 + 40584];
    long long v35 = *(_OWORD *)(v8 + 416);
    *(_OWORD *)uint64_t v34 = *(_OWORD *)(v8 + 400);
    *((_OWORD *)v34 + 1) = v35;
    long long v36 = &impl[32 * v4 + 44680];
    long long v37 = *(_OWORD *)(v8 + 448);
    *(_OWORD *)long long v36 = *(_OWORD *)(v8 + 432);
    *((_OWORD *)v36 + 1) = v37;
    if (*((void *)impl + 185)) {
      MTLResourceListAddResource();
    }
    uint64_t v13 = *(unsigned int *)(*((void *)a3 + 67) + 120);
  }
  else
  {
    *v6 |= 0x10uLL;
    *(void *)&impl[8 * (3 * a4) + 79224] = 0;
    *(void *)&impl[8 * (3 * a4 + 1) + 79224] = 0;
    *(void *)&impl[8 * (3 * a4 + 2) + 79224] = 0;
    uint64_t v11 = a4;
    uint64_t v12 = (uint64_t)&impl[56 * a4 + 59376];
    bzero((void *)(v12 + 16), 0x38uLL);
    uint64_t v13 = 0;
    *(_DWORD *)(v12 + 64) = 0;
    uint64_t v14 = 1 << v4;
    BOOL v15 = v4 > 0x3F;
    uint64_t v16 = (uint64_t)&impl[8 * v15 + 59376];
    *(void *)(v16 + 7184) &= ~(1 << v4);
    *(void *)(v16 + 7200) &= ~(1 << v4);
    uint64_t v17 = *((void *)impl + 182);
    uint64_t v18 = *(void *)(v17 + 808);
    long long v19 = *(_OWORD *)(v18 + 7312);
    long long v20 = *(_OWORD *)(v18 + 7328);
    uint64_t v21 = &impl[32 * v11 + 40584];
    *(_OWORD *)uint64_t v21 = v19;
    *((_OWORD *)v21 + 1) = v20;
    uint64_t v22 = *(void *)(v17 + 808);
    uint64_t v23 = &impl[32 * v4 + 44680];
    long long v24 = *(_OWORD *)(v22 + 7360);
    *(_OWORD *)uint64_t v23 = *(_OWORD *)(v22 + 7344);
    *((_OWORD *)v23 + 1) = v24;
  }
  *(void *)&impl[8 * v11 + 66592] = v13;
  uint64_t v38 = (uint64_t)&impl[8 * v15 + 90088];
  *(void *)(v38 + 16) = *(void *)&impl[8 * v15 + 90104] | v14;
  *(void *)(v38 + 64) = *(void *)&impl[8 * v15 + 90152] | v14;
  *((void *)impl + 11309) |= 0x140uLL;
  *v6 |= 0x10uLL;
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
}

- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  impl = self->_impl;
  unsigned int v6 = &impl[2 * a5];
  uint64_t v7 = v6[10741];
  uint64_t v8 = v6[11001];
  v6 += 4874;
  uint64_t v9 = v6[67];
  uint64_t v10 = v6[132];
  uint64_t v11 = v7 + a3;
  v6[67] = v11;
  v6[132] = v9 - v11 + v10;
  *unsigned int v6 = v8 + a3;
  impl[a5 + 17059] = impl[a5 + 16994];
  if (a5 <= 0x1E) {
    impl[a5 + 16963] = a4;
  }
  uint64_t v12 = (char *)(impl + 22522);
  *(void *)&v12[8 * (a5 > 0x3F)] |= 1 << a5;
  *((void *)v12 + 48) |= 0x40uLL;
}

- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  impl = self->_impl;
  int v5 = &impl[2 * a4];
  uint64_t v6 = v5[10741];
  uint64_t v7 = v5[11001];
  v5 += 4874;
  uint64_t v8 = v5[67];
  uint64_t v9 = v5[132];
  uint64_t v10 = v6 + a3;
  v5[67] = v10;
  v5[132] = v8 - v10 + v9;
  *int v5 = v7 + a3;
  impl[a4 + 17059] = impl[a4 + 16994];
  if (a4 <= 0x1E) {
    impl[a4 + 16963] = 0;
  }
  uint64_t v11 = (char *)(impl + 22522);
  *(void *)&v11[8 * (a4 > 0x3F)] |= 1 << a4;
  *((void *)v11 + 48) |= 0x40uLL;
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  unsigned int v6 = a6;
  int v7 = a5;
  impl = self->_impl;
  unint64_t v11 = a4 + 15;
  unint64_t v12 = (a4 + 15) | 0xF;
  uint64_t v13 = impl[20];
  uint64_t v14 = v13 + v12;
  if (v13 + v12 <= impl[19])
  {
LABEL_2:
    impl[21] = v14;
    goto LABEL_3;
  }
  int v21 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 2, 3, 0);
  uint64_t v13 = impl[20];
  if (v21)
  {
    uint64_t v14 = v13 + v12;
    if (v13 + v12 > impl[19]) {
      abort();
    }
    goto LABEL_2;
  }
LABEL_3:
  unint64_t v15 = v11 & 0xFFFFFFFFFFFFFFF0;
  uint64_t v16 = (char *)((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v17 = (unint64_t)&v16[impl[22]];
  impl[20] = &v16[v15];
  memcpy(v16, a3, a4);
  uint64_t v18 = *(void *)(impl[5] + 224) + (int)*MEMORY[0x263F4B188];
  if (v6 <= 0x22) {
    impl[v6 + 10671] = 0;
  }
  impl[(v6 > 0x3F) + 11261] |= 1 << v6;
  impl[11309] |= 0x40uLL;
  long long v19 = &impl[v6];
  v19[4941] = v17;
  v19[5006] = v15;
  v19[9773] = v18;
  if (v6 <= 0x1E) {
    *((_DWORD *)impl + v6 + 16963) = v7;
  }
  long long v20 = (_DWORD *)impl + v6 + 14844;
  v20[2150] = a4;
  v20[2215] = a4;
  v20[2280] = v17 >> 8;
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unsigned int v5 = a5;
  impl = self->_impl;
  unint64_t v9 = a4 + 15;
  unint64_t v10 = (a4 + 15) | 0xF;
  uint64_t v11 = impl[20];
  uint64_t v12 = v11 + v10;
  if (v11 + v10 <= impl[19])
  {
LABEL_2:
    impl[21] = v12;
    goto LABEL_3;
  }
  int v19 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 2, 3, 0);
  uint64_t v11 = impl[20];
  if (v19)
  {
    uint64_t v12 = v11 + v10;
    if (v11 + v10 > impl[19]) {
      abort();
    }
    goto LABEL_2;
  }
LABEL_3:
  unint64_t v13 = v9 & 0xFFFFFFFFFFFFFFF0;
  uint64_t v14 = (char *)((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v15 = (unint64_t)&v14[impl[22]];
  impl[20] = &v14[v13];
  memcpy(v14, a3, a4);
  uint64_t v16 = *(void *)(impl[5] + 224) + (int)*MEMORY[0x263F4B188];
  if (v5 <= 0x22) {
    impl[v5 + 10671] = 0;
  }
  impl[(v5 > 0x3F) + 11261] |= 1 << v5;
  impl[11309] |= 0x40uLL;
  unint64_t v17 = &impl[v5];
  v17[4941] = v15;
  v17[5006] = v13;
  v17[9773] = v16;
  if (v5 <= 0x1E) {
    *((_DWORD *)impl + v5 + 16963) = 0;
  }
  uint64_t v18 = (_DWORD *)impl + v5 + 14844;
  v18[2150] = a4;
  v18[2215] = a4;
  v18[2280] = v15 >> 8;
}

- (void)setRenderPipelineState:(id)a3
{
  impl = self->_impl;
  if (impl[185]) {
    MTLResourceListAddResource();
  }

  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setRenderPipelineStateCommon((uint64_t)impl, (uint64_t)a3 + 144);
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6
{
}

- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5
{
}

- (void)deferredEndEncoding:(id)a3
{
  impl = (char *)self->_impl;
  uint64_t v8 = (int8x8_t *)*((void *)impl + 246);
  __int32 v9 = v8[614].i32[1];
  __int32 v10 = v8[613].i32[0];
  __int32 v11 = v8[614].i32[0];
  __int32 v12 = v8[613].i32[1];
  LOWORD(v13) = v9 & ~(v11 | v10 | v12);
  if ((v9 & ~(v11 | v10 | v12)) == 0) {
    goto LABEL_13;
  }
  if (((unsigned __int16)v9 & (unsigned __int16)~(v11 | v10 | v12) & 0x100) != 0)
  {
    v10 &= ~0x100u;
    v8[613].i32[0] = v10;
    v11 &= ~0x100u;
    v8[614].i32[0] = v11;
    v12 |= 0x100u;
    v8[613].i32[1] = v12;
    v8[547].i16[2] |= 2u;
    if ((v13 & 0x200) == 0)
    {
LABEL_4:
      unsigned int v13 = v13;
      if (!(_BYTE)v13) {
        goto LABEL_13;
      }
      goto LABEL_10;
    }
  }
  else if (((unsigned __int16)v9 & (unsigned __int16)~(v11 | v10 | v12) & 0x200) == 0)
  {
    goto LABEL_4;
  }
  v10 &= ~0x200u;
  v8[613].i32[0] = v10;
  v11 &= ~0x200u;
  v8[614].i32[0] = v11;
  v12 |= 0x200u;
  v8[613].i32[1] = v12;
  v8[547].i16[2] |= 8u;
  unsigned int v13 = v13;
  if (!(_BYTE)v13) {
    goto LABEL_13;
  }
  do
  {
LABEL_10:
    char v14 = __clz(__rbit32(v13));
    int v15 = 1 << v14;
    if (((1 << v14) & v9) != 0)
    {
      *(int32x2_t *)v4.i8 = vdup_n_s32(~(257 << v14));
      v3.n128_u64[0] = (unint64_t)vand_s8(v8[184], *(int8x8_t *)v4.i8);
      v8[184] = (int8x8_t)v3.n128_u64[0];
      v10 &= ~v15;
      v8[613].i32[0] = v10;
      v11 &= ~v15;
      v8[614].i32[0] = v11;
      v12 |= v15;
      v8[613].i32[1] = v12;
    }
    v13 ^= v15;
  }
  while (v13);
  impl = (char *)self->_impl;
LABEL_13:
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::endRenderPassCommon((uint64_t)impl, 1, 0, 1, 1, v3, v4, v5);
  if (*(unsigned char *)(*((void *)impl + 246) + 3964)) {
    AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeDepthCopy((uint64_t *)impl);
  }
  unint64_t v16 = *((void *)impl + 11397);
  unint64_t v17 = (atomic_ullong *)(*((void *)impl + 182) + 816);
  atomic_fetch_or(v17, *((void *)impl + 11396));
  atomic_fetch_or(v17 + 1, v16);
  *((void *)impl + 4) = 0;
  *((void *)impl + 5) = 0;
  *((void *)impl + 6) = 0;
  *(void *)impl = 0;
  *(_OWORD *)(impl + 1480) = 0u;
  self->_user_draw_token_offset = *((_DWORD *)self->_impl + 384);

  [(AGXG17FamilyRenderContext *)self destroyImpl];
}

- (void)endEncoding
{
  uint64_t v3 = (int)*MEMORY[0x263F12B70];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3)) {
    MTLReportFailure();
  }
  if (self->_impl && !self->parallelSubContext)
  {
    int32x4_t v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    if (([v4 disableDeferredEndEncoding] & 1) != 0 || v4[728]) {
      [(AGXG17FamilyRenderContext *)self deferredEndEncoding:0];
    }
    else {
      [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setPreviousRenderCommandEncoder:self];
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AGXG17FamilyRenderContext;
  [(IOGPUMetalCommandEncoder *)&v5 endEncoding];
}

- (void)destroyImpl
{
  uint64_t v3 = *(os_unfair_lock_s **)([(_MTLCommandEncoder *)self device] + 808);
  impl = (char *)self->_impl;
  if (!impl) {
    goto LABEL_68;
  }
  objc_super v5 = (uint64_t *)(impl + 90488);
  unsigned int v6 = impl + 36488;
  for (uint64_t i = (const void **)(impl + 38936); ; _Block_release(i[1]))
  {
    uint64_t i = (const void **)*i;
    if (!i) {
      break;
    }
  }
  uint64_t v8 = *((void *)impl + 11315);
  if (v8)
  {
    unint64_t v9 = *(void *)(v8 + 512);
    if (v9)
    {
      uint64_t v10 = MEMORY[0x263EF8330];
      do
      {
        uint64_t v11 = *(void *)(v8 + 520);
        uint64_t v12 = *(void *)(v8 + 8 * __clz(__rbit64(v9)));
        unsigned int v13 = *(NSObject **)(v11 + 16);
        uint64_t v70 = v10;
        uint64_t v71 = 3221225472;
        v72 = ___ZN3AGX14FenceGroupPool17releaseFenceGroupEPNS_10FenceGroupE_block_invoke;
        v73 = &__block_descriptor_48_e5_v8__0l;
        uint64_t v74 = v11;
        uint64_t v75 = v12;
        dispatch_sync(v13, &v70);
        unint64_t v9 = (*(void *)(v8 + 512) - 1) & *(void *)(v8 + 512);
        *(void *)(v8 + 512) = v9;
      }
      while (v9);
    }
    MEMORY[0x24566ED90](v8, 0x1020C40C758419CLL);
  }
  uint64_t v14 = *v5;
  if (*v5)
  {
    unint64_t v15 = *(void *)(v14 + 512);
    if (v15)
    {
      uint64_t v16 = MEMORY[0x263EF8330];
      do
      {
        uint64_t v17 = *(void *)(v14 + 520);
        uint64_t v18 = *(void *)(v14 + 8 * __clz(__rbit64(v15)));
        int v19 = *(NSObject **)(v17 + 16);
        uint64_t v70 = v16;
        uint64_t v71 = 3221225472;
        v72 = ___ZN3AGX14FenceGroupPool17releaseFenceGroupEPNS_10FenceGroupE_block_invoke;
        v73 = &__block_descriptor_48_e5_v8__0l;
        uint64_t v74 = v17;
        uint64_t v75 = v18;
        dispatch_sync(v19, &v70);
        unint64_t v15 = (*(void *)(v14 + 512) - 1) & *(void *)(v14 + 512);
        *(void *)(v14 + 512) = v15;
      }
      while (v15);
    }
    MEMORY[0x24566ED90](v14, 0x1020C40C758419CLL);
  }
  uint64_t v20 = *((void *)impl + 11316);
  if (v20)
  {
    unint64_t v21 = *(void *)(v20 + 512);
    if (v21)
    {
      uint64_t v22 = MEMORY[0x263EF8330];
      do
      {
        uint64_t v23 = *(void *)(v20 + 520);
        uint64_t v24 = *(void *)(v20 + 8 * __clz(__rbit64(v21)));
        int v25 = *(NSObject **)(v23 + 16);
        uint64_t v70 = v22;
        uint64_t v71 = 3221225472;
        v72 = ___ZN3AGX14FenceGroupPool17releaseFenceGroupEPNS_10FenceGroupE_block_invoke;
        v73 = &__block_descriptor_48_e5_v8__0l;
        uint64_t v74 = v23;
        uint64_t v75 = v24;
        dispatch_sync(v25, &v70);
        unint64_t v21 = (*(void *)(v20 + 512) - 1) & *(void *)(v20 + 512);
        *(void *)(v20 + 512) = v21;
      }
      while (v21);
    }
    MEMORY[0x24566ED90](v20, 0x1020C40C758419CLL);
  }
  uint64_t v26 = *((void *)impl + 11312);
  if (v26)
  {
    unint64_t v27 = *(void *)(v26 + 512);
    if (v27)
    {
      uint64_t v28 = MEMORY[0x263EF8330];
      do
      {
        uint64_t v29 = *(void *)(v26 + 520);
        uint64_t v30 = *(void *)(v26 + 8 * __clz(__rbit64(v27)));
        long long v31 = *(NSObject **)(v29 + 16);
        uint64_t v70 = v28;
        uint64_t v71 = 3221225472;
        v72 = ___ZN3AGX14FenceGroupPool17releaseFenceGroupEPNS_10FenceGroupE_block_invoke;
        v73 = &__block_descriptor_48_e5_v8__0l;
        uint64_t v74 = v29;
        uint64_t v75 = v30;
        dispatch_sync(v31, &v70);
        unint64_t v27 = (*(void *)(v26 + 512) - 1) & *(void *)(v26 + 512);
        *(void *)(v26 + 512) = v27;
      }
      while (v27);
    }
    MEMORY[0x24566ED90](v26, 0x1020C40C758419CLL);
  }
  uint64_t v32 = *((void *)impl + 11317);
  if (v32)
  {
    unint64_t v33 = *(void *)(v32 + 512);
    if (v33)
    {
      uint64_t v34 = MEMORY[0x263EF8330];
      do
      {
        uint64_t v35 = *(void *)(v32 + 520);
        uint64_t v36 = *(void *)(v32 + 8 * __clz(__rbit64(v33)));
        long long v37 = *(NSObject **)(v35 + 16);
        uint64_t v70 = v34;
        uint64_t v71 = 3221225472;
        v72 = ___ZN3AGX14FenceGroupPool17releaseFenceGroupEPNS_10FenceGroupE_block_invoke;
        v73 = &__block_descriptor_48_e5_v8__0l;
        uint64_t v74 = v35;
        uint64_t v75 = v36;
        dispatch_sync(v37, &v70);
        unint64_t v33 = (*(void *)(v32 + 512) - 1) & *(void *)(v32 + 512);
        *(void *)(v32 + 512) = v33;
      }
      while (v33);
    }
    MEMORY[0x24566ED90](v32, 0x1020C40C758419CLL);
  }
  uint64_t v38 = *((void *)impl + 11313);
  if (v38)
  {
    unint64_t v39 = *(void *)(v38 + 512);
    if (v39)
    {
      uint64_t v40 = MEMORY[0x263EF8330];
      do
      {
        uint64_t v41 = *(void *)(v38 + 520);
        uint64_t v42 = *(void *)(v38 + 8 * __clz(__rbit64(v39)));
        uint64_t v43 = *(NSObject **)(v41 + 16);
        uint64_t v70 = v40;
        uint64_t v71 = 3221225472;
        v72 = ___ZN3AGX14FenceGroupPool17releaseFenceGroupEPNS_10FenceGroupE_block_invoke;
        v73 = &__block_descriptor_48_e5_v8__0l;
        uint64_t v74 = v41;
        uint64_t v75 = v42;
        dispatch_sync(v43, &v70);
        unint64_t v39 = (*(void *)(v38 + 512) - 1) & *(void *)(v38 + 512);
        *(void *)(v38 + 512) = v39;
      }
      while (v39);
    }
    MEMORY[0x24566ED90](v38, 0x1020C40C758419CLL);
  }
  uint64_t v44 = *((void *)impl + 11318);
  if (v44)
  {
    unint64_t v45 = *(void *)(v44 + 512);
    if (v45)
    {
      uint64_t v46 = MEMORY[0x263EF8330];
      do
      {
        uint64_t v47 = *(void *)(v44 + 520);
        uint64_t v48 = *(void *)(v44 + 8 * __clz(__rbit64(v45)));
        uint64_t v49 = *(NSObject **)(v47 + 16);
        uint64_t v70 = v46;
        uint64_t v71 = 3221225472;
        v72 = ___ZN3AGX14FenceGroupPool17releaseFenceGroupEPNS_10FenceGroupE_block_invoke;
        v73 = &__block_descriptor_48_e5_v8__0l;
        uint64_t v74 = v47;
        uint64_t v75 = v48;
        dispatch_sync(v49, &v70);
        unint64_t v45 = (*(void *)(v44 + 512) - 1) & *(void *)(v44 + 512);
        *(void *)(v44 + 512) = v45;
      }
      while (v45);
    }
    MEMORY[0x24566ED90](v44, 0x1020C40C758419CLL);
  }
  uint64_t v50 = *((void *)impl + 11314);
  if (v50)
  {
    unint64_t v51 = *(void *)(v50 + 512);
    if (v51)
    {
      uint64_t v52 = MEMORY[0x263EF8330];
      do
      {
        uint64_t v53 = *(void *)(v50 + 520);
        uint64_t v54 = *(void *)(v50 + 8 * __clz(__rbit64(v51)));
        v55 = *(NSObject **)(v53 + 16);
        uint64_t v70 = v52;
        uint64_t v71 = 3221225472;
        v72 = ___ZN3AGX14FenceGroupPool17releaseFenceGroupEPNS_10FenceGroupE_block_invoke;
        v73 = &__block_descriptor_48_e5_v8__0l;
        uint64_t v74 = v53;
        uint64_t v75 = v54;
        dispatch_sync(v55, &v70);
        unint64_t v51 = (*(void *)(v50 + 512) - 1) & *(void *)(v50 + 512);
        *(void *)(v50 + 512) = v51;
      }
      while (v51);
    }
    MEMORY[0x24566ED90](v50, 0x1020C40C758419CLL);
  }

  unsigned int v56 = (void *)*((void *)impl + 4867);
  if (v56)
  {
    do
    {
      v57 = (void *)*v56;
      operator delete(v56);
      unsigned int v56 = v57;
    }
    while (v57);
  }
  *((void *)impl + 4867) = 0;

  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::PointerWithOnDemandObjectCreation<AGX::HAL200::HWGeometryPipelineContext>::~PointerWithOnDemandObjectCreation((uint64_t *)impl + 4569);
  v58 = (char *)*((void *)impl + 4568);
  if (v58 == impl + 36520)
  {
    (*(void (**)(char *))(*((void *)impl + 4565) + 32))(impl + 36520);
  }
  else if (v58)
  {
    (*(void (**)(char *))(*(void *)v58 + 40))(v58);
  }
  v59 = (char *)*((void *)impl + 4564);
  if (v59 == v6)
  {
    (*(void (**)(char *))(*(void *)v6 + 32))(impl + 36488);
    v60 = (void **)*((void *)impl + 219);
    if (!v60) {
      goto LABEL_56;
    }
  }
  else
  {
    if (v59) {
      (*(void (**)(char *))(*(void *)v59 + 40))(v59);
    }
    v60 = (void **)*((void *)impl + 219);
    if (!v60) {
      goto LABEL_56;
    }
  }
  free(*v60);
  MEMORY[0x24566ED90](v60, 0x1020C4014030ADELL);
LABEL_56:
  v61 = (void **)*((void *)impl + 177);
  v62 = (void **)*((void *)impl + 178);
  if (v61 != v62)
  {
    do
    {
      v63 = *v61++;
      free(v63);
    }
    while (v61 != v62);
    v61 = (void **)*((void *)impl + 177);
  }
  if (v61)
  {
    *((void *)impl + 178) = v61;
    operator delete(v61);
  }
  v64 = self->_impl;
  if (v64)
  {
    os_unfair_lock_lock(v3 + 1679);
    uint64_t os_unfair_lock_opaque = v3[1678]._os_unfair_lock_opaque;
    if (os_unfair_lock_opaque > 7)
    {
      os_unfair_lock_unlock(v3 + 1679);
      free(v64);
    }
    else
    {
      v3[1678]._uint64_t os_unfair_lock_opaque = os_unfair_lock_opaque + 1;
      *(void *)&v3[2 * os_unfair_lock_opaque + 1680]._uint64_t os_unfair_lock_opaque = v64;
      os_unfair_lock_unlock(v3 + 1679);
    }
  }
  self->_impl = 0;
LABEL_68:
  framebuffer = (void **)self->_framebuffer;
  if (framebuffer)
  {
    free(framebuffer[663]);
    v67 = framebuffer[653];
    if (v67) {

    }
    AGX::Framebuffer<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::~Framebuffer((uint64_t)framebuffer);
    v68 = self->_framebuffer;
    if (v68)
    {
      os_unfair_lock_lock(v3 + 1735);
      uint64_t v69 = v3[1734]._os_unfair_lock_opaque;
      if (v69 > 7)
      {
        os_unfair_lock_unlock(v3 + 1735);
        free(v68);
      }
      else
      {
        v3[1734]._uint64_t os_unfair_lock_opaque = v69 + 1;
        *(void *)&v3[2 * v69 + 1736]._uint64_t os_unfair_lock_opaque = v68;
        os_unfair_lock_unlock(v3 + 1735);
      }
    }
    self->_framebuffer = 0;
  }
}

- (void)dealloc
{
  [(AGXG17FamilyRenderContext *)self destroyImpl];
  v3.receiver = self;
  v3.super_class = (Class)AGXG17FamilyRenderContext;
  [(_MTLCommandEncoder *)&v3 dealloc];
}

- (AGXG17FamilyRenderContext)initWithCommandBuffer:(id)a3 dummyDescriptor:(id)a4
{
  return [(AGXG17FamilyRenderContext *)self initWithCommandBuffer:a3 descriptor:a4 subEncoderIndex:0 framebuffer:0];
}

- (AGXG17FamilyRenderContext)initWithCommandBuffer:(id)a3 descriptor:(id)a4 subEncoderIndex:(unint64_t)a5 framebuffer:(void *)a6
{
  uint64_t v204 = *MEMORY[0x263EF8340];
  v195.receiver = self;
  v195.super_class = (Class)AGXG17FamilyRenderContext;
  unint64_t v9 = -[IOGPUMetalCommandEncoder initWithCommandBuffer:](&v195, sel_initWithCommandBuffer_);
  if (!v9) {
    goto LABEL_166;
  }
  uint64_t v10 = (atomic_ullong *)[a3 device];
  if (*(unsigned char *)([a4 _descriptorPrivate] + 43))
  {
    uint64_t v11 = v10[109];
    if (v11)
    {
      *(void *)block = MEMORY[0x263EF8330];
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = ___ZN13AGXATelemetry16disableTelemetryEv_block_invoke;
      *(void *)&block[24] = &__block_descriptor_40_e5_v8__0l;
      *(void *)&block[32] = v10 + 102;
      dispatch_sync(v11, block);
    }
  }
  v9->BOOL parallelSubContext = [a3 ownedByParallelEncoder];
  atomic_ullong v12 = v10[101];
  if (!a6)
  {
    v201.i64[0] = 0;
    v199[0] = 0;
    [a4 validate:v10 width:&v201 height:v199];
    if (!v201.i64[0] || !v199[0] || *(void *)(v12 + 6928) >> 3 < 0x2A9uLL) {
      goto LABEL_166;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(v12 + 6940));
    int v16 = *(_DWORD *)(v12 + 6936);
    if (v16)
    {
      unsigned int v17 = v16 - 1;
      *(_DWORD *)(v12 + 6936) = v17;
      a6 = *(void **)(v12 + 8 * v17 + 6944);
      os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 6940));
      if (a6)
      {
        bzero(a6, *(void *)(v12 + 6928));
LABEL_58:
        AGX::FramebufferDriverConfigGen3_3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::FramebufferDriverConfigGen3_3((uint64_t)block, a4, *(_DWORD *)(v10[101] + 7764), *(_WORD *)(v12 + 7290) & 0x1F);
        AGX::FramebufferGen3_3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::FramebufferGen3_3((uint64_t)a6, v10, *((void *)a3 + 86), (uint64_t)block, v201.i32[0], v199[0], 0);
        v9->_framebuffer = a6;
        goto LABEL_6;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 6940));
    }
    a6 = malloc_type_calloc(*(void *)(v12 + 6928), 1uLL, 0xC8454162uLL);
    if (!a6) {
      goto LABEL_166;
    }
    goto LABEL_58;
  }
LABEL_6:
  if (*(void *)(v12 + 6704) <= 0x1642FuLL)
  {
    v9->_impl = 0;
    goto LABEL_166;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v12 + 6716));
  int v13 = *(_DWORD *)(v12 + 6712);
  if (v13)
  {
    unsigned int v14 = v13 - 1;
    *(_DWORD *)(v12 + 6712) = v14;
    unint64_t v15 = *(void **)(v12 + 8 * v14 + 6720);
    os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 6716));
    if (v15)
    {
      bzero(v15, *(void *)(v12 + 6704));
      p_impl = (uint64_t *)&v9->_impl;
      v9->_impl = v15;
      goto LABEL_18;
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 6716));
  }
  unint64_t v15 = malloc_type_calloc(*(void *)(v12 + 6704), 1uLL, 0xC8454162uLL);
  p_impl = (uint64_t *)&v9->_impl;
  v9->_impl = v15;
  if (!v15)
  {
LABEL_166:
    [(AGXG17FamilyRenderContext *)v9 endEncoding];

    return 0;
  }
LABEL_18:
  int v18 = *((unsigned __int8 *)a3 + 728);
  BOOL parallelSubContext = v9->parallelSubContext;
  uint64_t v19 = [a3 commandBufferStorage];
  uint64_t v20 = [a3 globalTraceObjectID];
  uint64_t v21 = [(IOGPUMetalCommandEncoder *)v9 globalTraceObjectID];
  v185 = v9;
  v191 = v15 + 185;
  uint64_t v22 = v10[101] + 5864;
  *(void *)block = MEMORY[0x263EF8330];
  *(void *)&block[8] = 3221225472;
  *(void *)&block[16] = ___ZN3AGX20RenderUSCStateLoaderINS_6HAL2008EncodersENS1_7ClassesEE17dataBufferConfigsERK16AGXGPUCoreConfig_block_invoke;
  *(void *)&block[24] = &__block_descriptor_40_e5_v8__0l;
  *(void *)&block[32] = v22;
  if (AGX::RenderUSCStateLoader<AGX::HAL200::Encoders,AGX::HAL200::Classes>::dataBufferConfigs(AGXGPUCoreConfig const&)::once != -1) {
    dispatch_once(&AGX::RenderUSCStateLoader<AGX::HAL200::Encoders,AGX::HAL200::Classes>::dataBufferConfigs(AGXGPUCoreConfig const&)::once, block);
  }
  void *v15 = a3;
  v15[1] = v19;
  v15[2] = &AGX::RenderUSCStateLoader<AGX::HAL200::Encoders,AGX::HAL200::Classes>::databuffer_configs;
  uint64_t v23 = v15 + 2;
  v15[3] = v10;
  v15[4] = v19;
  uint64_t v24 = *(void *)(v19 + 768);
  v15[177] = 0;
  *((_OWORD *)v15 + 89) = 0u;
  *((_DWORD *)v15 + 360) = 0;
  v15[5] = v24;
  v15[6] = v19 + 144;
  v15[181] = *(void *)(v19 + 784);
  v15[183] = v19;
  v15[184] = v19 + 64;
  *((unsigned char *)v15 + 1504) = 0;
  *((unsigned char *)v15 + 1545) = 0;
  v15[197] = v20;
  v15[198] = v21;
  v15[199] = *((void *)a3 + 86) + 24;
  *((_OWORD *)v15 + 100) = 0u;
  v15[202] = 0xFFFFFFFF00000001;
  v15[203] = 1610612736;
  v15[208] = 0;
  *((_OWORD *)v15 + 103) = 0u;
  *((_OWORD *)v15 + 102) = 0u;
  *(void *)&long long v25 = -1;
  *((void *)&v25 + 1) = -1;
  *(_OWORD *)(v15 + 213) = v25;
  *(_OWORD *)(v15 + 211) = v25;
  *(_OWORD *)(v15 + 209) = v25;
  v15[182] = v10;
  _OWORD *v191 = *(_OWORD *)(v19 + 728);
  v15[187] = v19 + 144;
  v15[194] = *(void *)(v19 + 48);
  v15[195] = *(void *)(v19 + 56);
  *((_DWORD *)v15 + 377) = v21;
  *(void *)((char *)v15 + 1516) = 0xFFFFFFFF00000000;
  *((_DWORD *)v15 + 385) = 0;
  *((unsigned char *)v15 + 1544) = 1;
  atomic_ullong v26 = v10[101];
  unsigned int v27 = *(_DWORD *)(v26 + 5912);
  DWORD1(v25) = 1792;
  LODWORD(v25) = (((96 * (*(_DWORD *)(v26 + 5876) / v27) + 367) & 0xFFFFFFE0) + 127) & 0xFFFFFF80;
  int32x2_t v28 = vmla_s32((int32x2_t)0xD8000000080, *(int32x2_t *)&v25, vdup_n_s32(v27));
  *(void *)&long long v29 = v28.u32[0];
  *((void *)&v29 + 1) = v28.u32[1];
  *(_OWORD *)(v15 + 215) = v29;
  _ZF = v27 == 1;
  if (v27 == 1) {
    uint64_t v31 = 640;
  }
  else {
    uint64_t v31 = (640 * v27 + 671) & 0xFFFFFF80;
  }
  v15[217] = v31;
  LODWORD(v32) = 1632 * v27 + 2016;
  if (_ZF) {
    uint64_t v32 = 1632;
  }
  else {
    uint64_t v32 = v32;
  }
  v15[218] = v31 + v32;
  if (v18) {
    operator new();
  }
  unint64_t v33 = v15 + 219;
  v15[219] = 0;
  v15[239] = 0;
  unsigned int v34 = *((_DWORD *)a6 + 987);
  unsigned int v35 = *((_DWORD *)a6 + 647);
  int v36 = *((_DWORD *)a6 + 985);
  int v37 = *((_DWORD *)a6 + 986);
  int v38 = *((_DWORD *)a6 + 1268);
  *(void *)((char *)v15 + 1924) = 0;
  *((_WORD *)v15 + 966) = 0;
  memset(block, 0, 44);
  uint64_t v39 = v34 >> 2;
  if (v35 <= 1) {
    uint64_t v40 = 1;
  }
  else {
    uint64_t v40 = v35;
  }
  int v41 = 4 * v40 * v39;
  if (v37 * v36 * v41 && (int v42 = 1 << -__clz(v36 - 1), v43 = -__clz(v37 - 1), (v42 << v43) * v41))
  {
    *(void *)&block[8] = AGX::ESLInstructionEncoderGen3<AGX::HAL200::Encoders>::SpecLM::encodeImageBlockData(v39, v40, v42, 1 << (v43 & 0x1F));
    *(void *)&block[16] = v44;
    int v45 = 0x10000;
  }
  else
  {
    int v45 = 0;
  }
  int v46 = (v38 + 63) & 0xFFC0;
  if (((v38 + 63) & 0xFFFFFFC0) == 0x10000) {
    int v46 = 0;
  }
  *(_DWORD *)&block[2] = v46 | v45;
  block[0] = v38 != 0;
  AGX::ESLInstructionEncoderGen3<AGX::HAL200::Encoders>::AGX3EncodedInstr<AGXIotoInstruction_SPECLM_0>::AGX3EncodedInstr((unint64_t *)&v201, block);
  *(void *)((char *)v15 + 1934) = v201.i64[0];
  v15[245] = *(void *)(v26 + 6000);
  *((_DWORD *)v15 + 480) = 0;
  v15[243] = 0;
  *((_DWORD *)v15 + 488) = 0;
  v15[246] = a6;
  uint64_t v47 = v15[182];
  uint64_t v48 = v15[187];
  uint64_t v49 = *(void *)(v47 + 808);
  v15[259] = v49;
  v15[260] = v15;
  v15[261] = a6;
  v15[262] = v33;
  v15[263] = v23;
  uint64_t v50 = (_OWORD *)AGX::SpillInfoGen3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::SpillInfoGen3((uint64_t)(v15 + 264), *(void *)(v47 + 808), *(void *)(v49 + 6032));
  v15[279] = v48;
  *((_DWORD *)v15 + 560) = 0;
  *uint64_t v50 = 0u;
  v50[1] = 0u;
  v50[2] = 0u;
  uint64_t v51 = v15[182];
  uint64_t v52 = v15[199];
  uint64_t v53 = v15[185];
  uint64_t v54 = v15[187];
  uint64_t v55 = v15[186];
  v15[281] = a6;
  v15[282] = v33;
  v15[283] = v23;
  v15[284] = v52;
  v15[285] = v53;
  v15[286] = v54;
  v15[287] = v55;
  *((_OWORD *)v15 + 782) = xmmword_242EA7390;
  v15[3347] = v15 + 249;
  v15[3352] = v51;
  v15[3353] = v15 + 4852;
  v15[3354] = v15 + 247;
  *((unsigned char *)v15 + 26844) = 0;
  *((_OWORD *)v15 + 1678) = *(_OWORD *)(v15 + 197);
  v15[355] = v15 + 290;
  v15[356] = v15 + 1564;
  LODWORD(v53) = *((_DWORD *)a6 + 986);
  *((_DWORD *)v15 + 4932) = ((*((_DWORD *)a6 + 985) + *((_DWORD *)a6 + 644) - 1) & -*((_DWORD *)a6 + 985))
                          / *((_DWORD *)a6 + 985);
  *((_DWORD *)v15 + 4933) = ((v53 + *((_DWORD *)a6 + 645) - 1) & -(int)v53) / v53;
  *((_DWORD *)v15 + 5230) = 0;
  *((_DWORD *)v15 + 5265) = *((_DWORD *)a6 + 1268);
  v15[288] = *(void *)(v51 + 808) + 6472;
  v15[289] = *(void *)(v51 + 808) + 6536;
  v15[3358] = a6;
  v15[3359] = v33;
  v15[3360] = v54;
  v15[3361] = v55;
  v15[3362] = v15 + 4852;
  *(_OWORD *)(v15 + 3363) = xmmword_242EA7390;
  v15[4532] = v15 + 249;
  uint64_t v56 = *(void *)(v51 + 808);
  v15[4533] = v33;
  v15[4534] = v54;
  v15[4535] = v55;
  v15[4536] = v23;
  v15[4542] = 0;
  v15[4543] = 0;
  v15[4539] = 0;
  v15[4540] = 0;
  *((_DWORD *)v15 + 9082) = 0;
  *(void *)block = MEMORY[0x263EF8330];
  *(void *)&block[8] = 3221225472;
  *(void *)&block[16] = ___ZN3AGX34RenderIndirectExecutionContextGen4INS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE20getVDMPatchUpVariantEPNS1_6DeviceE_block_invoke;
  *(void *)&block[24] = &__block_descriptor_40_e5_v8__0l;
  *(void *)&block[32] = v56;
  if (AGX::RenderIndirectExecutionContextGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getVDMPatchUpVariant(AGX::HAL200::Device *)::execute_indirect_stateless_shaders_pred != -1) {
    dispatch_once(&AGX::RenderIndirectExecutionContextGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getVDMPatchUpVariant(AGX::HAL200::Device *)::execute_indirect_stateless_shaders_pred, block);
  }
  uint64_t v57 = *(void *)(v56 + 7392);
  uint64_t v58 = AGX::RenderIndirectExecutionContextGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getVDMPatchUpVariant(AGX::HAL200::Device *)::execute_indirect_pipeline;
  *(_DWORD *)(v57 + 48) = 1;
  int v59 = *(_DWORD *)(v58 + 44);
  if (v59 > *(_DWORD *)(v57 + 4))
  {
    *(_DWORD *)(v57 + 4) = v59;
    *(_DWORD *)uint64_t v57 = *(_DWORD *)(v58 + 40);
    *(_OWORD *)(v57 + 8) = *(_OWORD *)(v58 + 48);
  }
  int v60 = *(_DWORD *)(v58 + 64);
  if (*(_DWORD *)(v57 + 24) > v60) {
    int v60 = *(_DWORD *)(v57 + 24);
  }
  *(_DWORD *)(v57 + 24) = v60;
  uint64_t v61 = *(void *)(v56 + 7416);
  *(_DWORD *)(v61 + 48) = 1;
  int v62 = *(_DWORD *)(v58 + 44);
  if (v62 > *(_DWORD *)(v61 + 4))
  {
    *(_DWORD *)(v61 + 4) = v62;
    *(_DWORD *)uint64_t v61 = *(_DWORD *)(v58 + 40);
    *(_OWORD *)(v61 + 8) = *(_OWORD *)(v58 + 48);
  }
  int v63 = *(_DWORD *)(v58 + 64);
  if (*(_DWORD *)(v61 + 24) > v63) {
    int v63 = *(_DWORD *)(v61 + 24);
  }
  *(_DWORD *)(v61 + 24) = v63;
  v15[4537] = v58;
  *(void *)block = MEMORY[0x263EF8330];
  *(void *)&block[8] = 3221225472;
  *(void *)&block[16] = ___ZN3AGX34RenderIndirectExecutionContextGen4INS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE24getRangeExecutionVariantEPNS1_6DeviceE_block_invoke;
  *(void *)&block[24] = &__block_descriptor_40_e5_v8__0l;
  *(void *)&block[32] = v56;
  if (AGX::RenderIndirectExecutionContextGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getRangeExecutionVariant(AGX::HAL200::Device *)::execute_indirect_stateless_shaders_pred != -1) {
    dispatch_once(&AGX::RenderIndirectExecutionContextGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getRangeExecutionVariant(AGX::HAL200::Device *)::execute_indirect_stateless_shaders_pred, block);
  }
  v15[4538] = AGX::RenderIndirectExecutionContextGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getRangeExecutionVariant(AGX::HAL200::Device *)::range_execution_pipeline;
  v15[4545] = v15;
  v15[4546] = v15 + 219;
  v15[4547] = v23;
  v15[4550] = 0x200000003;
  *((_DWORD *)v15 + 9102) = 4;
  *((_DWORD *)v15 + 9104) = 16;
  v15[4544] = &unk_26F853250;
  v15[4559] = 0;
  v15[4560] = 0xC000000000000000;
  v15[4561] = &unk_26F8532A0;
  v15[4562] = v15;
  v15[4564] = v15 + 4561;
  v15[4565] = &unk_26F853918;
  v15[4566] = v15;
  v15[4568] = v15 + 4565;
  v200 = v199;
  v199[0] = &unk_26F8532A0;
  v199[1] = v15;
  v197[1] = v15;
  v15[4569] = 0;
  v198 = v197;
  v197[0] = &unk_26F853918;
  v64 = v15 + 4570;
  v15[4573] = 0;
  v65 = v15 + 4574;
  v15[4577] = 0;
  *(void *)&block[24] = block;
  std::__function::__func<AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::{lambda(void)#1},std::allocator<AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::{lambda(void)#1}>,AGX::HAL200::HWGeometryPipelineContext * ()(void)>::__clone((uint64_t)v199, block);
  if (v15 + 4570 == (void *)block)
  {
LABEL_60:
    v67 = *(unsigned char **)&block[24];
    goto LABEL_61;
  }
  uint64_t v66 = *(void *)&block[24];
  v67 = (unsigned char *)v15[4573];
  if (*(unsigned char **)&block[24] == block)
  {
    if (v67 != v64)
    {
      (*(void (**)(unsigned char *, void *))(*(void *)block + 24))(block, v15 + 4570);
      (*(void (**)(void))(**(void **)&block[24] + 32))(*(void *)&block[24]);
      v67 = (unsigned char *)v15[4573];
      *(void *)&block[24] = v67;
      v15[4573] = v64;
      goto LABEL_61;
    }
    (*(void (**)(unsigned char *, int64x2_t *))(*(void *)block + 24))(block, &v201);
    (*(void (**)(void))(**(void **)&block[24] + 32))(*(void *)&block[24]);
    *(void *)&block[24] = 0;
    (*(void (**)(void, unsigned char *))(*(void *)v15[4573] + 24))(v15[4573], block);
    (*(void (**)(void))(*(void *)v15[4573] + 32))(v15[4573]);
    v15[4573] = 0;
    *(void *)&block[24] = block;
    (*(void (**)(int64x2_t *, void *))(v201.i64[0] + 24))(&v201, v15 + 4570);
    (*(void (**)(int64x2_t *))(v201.i64[0] + 32))(&v201);
    v15[4573] = v64;
    goto LABEL_60;
  }
  if (v67 == v64)
  {
    (*(void (**)(void *, unsigned char *))(v15[4570] + 24))(v15 + 4570, block);
    (*(void (**)(void))(*(void *)v15[4573] + 32))(v15[4573]);
    v15[4573] = *(void *)&block[24];
    *(void *)&block[24] = block;
LABEL_64:
    (*(void (**)(unsigned char *))(*(void *)block + 32))(block);
    goto LABEL_65;
  }
  *(void *)&block[24] = v15[4573];
  v15[4573] = v66;
LABEL_61:
  if (v67 == block) {
    goto LABEL_64;
  }
  if (v67) {
    (*(void (**)(unsigned char *))(*(void *)v67 + 40))(v67);
  }
LABEL_65:
  uint64_t v68 = (uint64_t)v198;
  if (!v198)
  {
LABEL_68:
    *(void *)&block[24] = v68;
    goto LABEL_70;
  }
  if (v198 != v197)
  {
    uint64_t v68 = (*(uint64_t (**)(void))(*v198 + 16))();
    goto LABEL_68;
  }
  *(void *)&block[24] = block;
  (*(void (**)(void *, unsigned char *))(v197[0] + 24))(v197, block);
LABEL_70:
  if (v65 != block)
  {
    uint64_t v69 = *(void *)&block[24];
    uint64_t v70 = (unsigned char *)v15[4577];
    if (*(unsigned char **)&block[24] == block)
    {
      if (v70 == v65)
      {
        (*(void (**)(unsigned char *, int64x2_t *))(*(void *)block + 24))(block, &v201);
        (*(void (**)(void))(**(void **)&block[24] + 32))(*(void *)&block[24]);
        *(void *)&block[24] = 0;
        (*(void (**)(void, unsigned char *))(*(void *)v15[4577] + 24))(v15[4577], block);
        (*(void (**)(void))(*(void *)v15[4577] + 32))(v15[4577]);
        v15[4577] = 0;
        *(void *)&block[24] = block;
        (*(void (**)(int64x2_t *, void *))(v201.i64[0] + 24))(&v201, v15 + 4574);
        (*(void (**)(int64x2_t *))(v201.i64[0] + 32))(&v201);
      }
      else
      {
        (*(void (**)(unsigned char *, void *))(*(void *)block + 24))(block, v15 + 4574);
        (*(void (**)(void))(**(void **)&block[24] + 32))(*(void *)&block[24]);
        *(void *)&block[24] = v15[4577];
      }
      v15[4577] = v65;
    }
    else if (v70 == v65)
    {
      (*(void (**)(void *, unsigned char *))(v15[4574] + 24))(v15 + 4574, block);
      (*(void (**)(void))(*(void *)v15[4577] + 32))(v15[4577]);
      v15[4577] = *(void *)&block[24];
      *(void *)&block[24] = block;
    }
    else
    {
      *(void *)&block[24] = v15[4577];
      v15[4577] = v69;
    }
  }
  if (*(unsigned char **)&block[24] == block)
  {
    (*(void (**)(unsigned char *))(*(void *)block + 32))(block);
    BOOL v71 = a5 == 0;
  }
  else
  {
    BOOL v71 = a5 == 0;
    if (*(void *)&block[24]) {
      (*(void (**)(void))(**(void **)&block[24] + 40))();
    }
  }
  if (v198 == v197)
  {
    (*(void (**)(void *))(v197[0] + 32))(v197);
  }
  else if (v198)
  {
    (*(void (**)(void))(*v198 + 40))();
  }
  if (v200 == v199)
  {
    (*(void (**)(void *))(v199[0] + 32))(v199);
  }
  else if (v200)
  {
    (*(void (**)(void))(*v200 + 40))();
  }
  *((unsigned char *)v15 + 36632) = 0;
  *((unsigned char *)v15 + 36648) = 0;
  int32x2_t v72 = *(int32x2_t *)((char *)a6 + 2576);
  *((_DWORD *)v15 + 9165) = 3072;
  *((unsigned char *)v15 + 36625) = v71;
  *((unsigned char *)v15 + 36640) = 0;
  *((unsigned char *)v15 + 36652) = 0;
  *((_WORD *)v15 + 18328) = 0;
  *((unsigned char *)v15 + 36658) = 0;
  *((_DWORD *)v15 + 9198) = 0;
  v15[4583] = vand_s8((int8x8_t)vshr_n_u32((uint32x2_t)vadd_s32(v72, (int32x2_t)-1), 5uLL), (int8x8_t)0x100000001);
  float32x2_t v73 = vmul_f32(vcvt_f32_u32((uint32x2_t)v72), (float32x2_t)0x3F0000003F000000);
  *((_DWORD *)v15 + 9199) = v73.i32[0];
  v15[4600] = v73;
  *((float *)v15 + 9202) = -v73.f32[1];
  *(void *)((char *)v15 + 36812) = 0x3F80000000000000;
  *(void *)((char *)v15 + 37180) = 256;
  v15[4649] = 0x48000200000;
  *((_DWORD *)v15 + 9306) = 0;
  *((_OWORD *)v15 + 2325) = xmmword_242EA8780;
  v15[4652] = 0xE00000007200F00;
  *(_OWORD *)((char *)v15 + 37228) = xmmword_242EA8790;
  *(void *)((char *)v15 + 37244) = 0xC0A000000000000;
  *(void *)((char *)v15 + 37260) = 0;
  *(void *)((char *)v15 + 37252) = 0;
  v15[4660] = (char *)v15 + 36660;
  *(void *)((char *)v15 + 37268) |= 0xE0000000E000000uLL;
  uint64_t v74 = *((unsigned int *)a6 + 644);
  uint64_t v75 = *((unsigned int *)a6 + 645);
  *((_DWORD *)v15 + 9514) = 0;
  *(void *)((char *)v15 + 38060) = v74;
  *((_DWORD *)v15 + 9517) = v75;
  *((_WORD *)v15 + 19036) = 1;
  *((unsigned char *)v15 + 38074) = 1;
  *(void *)((char *)v15 + 38076) = 0;
  *((unsigned char *)v15 + 38084) = 0;
  v15[4761] = v15;
  *((unsigned char *)v15 + 38112) = 0;
  *(_OWORD *)((char *)v15 + 38116) = xmmword_242EA87A0;
  *(_OWORD *)((char *)v15 + 38132) = xmmword_242EA87A0;
  *(_OWORD *)((char *)v15 + 38148) = xmmword_242EA87A0;
  *(_OWORD *)((char *)v15 + 38164) = xmmword_242EA87A0;
  *(_OWORD *)((char *)v15 + 38180) = xmmword_242EA87A0;
  *(_OWORD *)((char *)v15 + 38196) = xmmword_242EA87A0;
  *(_OWORD *)((char *)v15 + 38212) = xmmword_242EA87A0;
  *(_OWORD *)((char *)v15 + 38228) = xmmword_242EA87A0;
  *(_OWORD *)((char *)v15 + 38244) = xmmword_242EA87A0;
  *(_OWORD *)((char *)v15 + 38260) = xmmword_242EA87A0;
  *(_OWORD *)((char *)v15 + 38276) = xmmword_242EA87A0;
  *(_OWORD *)((char *)v15 + 38292) = xmmword_242EA87A0;
  *(_OWORD *)((char *)v15 + 38308) = xmmword_242EA87A0;
  *(_OWORD *)((char *)v15 + 38324) = xmmword_242EA87A0;
  *(_OWORD *)((char *)v15 + 38340) = xmmword_242EA87A0;
  *(_OWORD *)((char *)v15 + 38356) = xmmword_242EA87A0;
  *(void *)((char *)v15 + 38372) = 0x3F80000000000000;
  v76 = (void *)[a4 rasterizationRateMap];
  v15[4762] = v76;
  id v77 = v76;
  if (v76)
  {
    uint64_t v78 = *(void *)(v15[4762] + 64);
    v15[4763] = v78;
  }
  else
  {
    uint64_t v78 = v15[4763];
  }
  *(_OWORD *)block = 0uLL;
  *(double *)&block[16] = (double)v74;
  *(double *)&block[24] = (double)v75;
  *(_OWORD *)&block[32] = xmmword_242EA87B0;
  int64x2_t v201 = 0uLL;
  uint64_t v202 = v74;
  uint64_t v203 = v75;
  if (v78)
  {
    int v79 = *(unsigned __int8 *)(v78 + 24744);
    *((unsigned char *)v15 + 38112) = v79;
    if (v79)
    {
      float v80 = (float)*(unsigned int *)(v78 + 24656);
      float v81 = (float)*(unsigned int *)(v78 + 24660);
    }
    else
    {
      uint64_t v82 = *(unsigned int *)(v78 + 16);
      if (v82)
      {
        v83 = (unsigned int *)(v78 + 24664);
        float v80 = 3.4028e38;
        uint64_t v84 = v78;
        do
        {
          unsigned int v85 = *(v83 - 5);
          if (v85 >= v74) {
            unsigned int v85 = v74;
          }
          float v86 = (float)v85;
          unsigned int v87 = *v83++;
          unsigned int v88 = v87 - 1;
          if (v87 <= (float)((float)v85 * 0.03125)) {
            unsigned int v89 = v88;
          }
          else {
            unsigned int v89 = (float)((float)v85 * 0.03125);
          }
          float v90 = *(float *)(v84 + 8 * v89 + 20) * (float)(v86 - *(float *)(v84 + 8 * v89 + 24));
          if (v80 >= v90) {
            float v80 = v90;
          }
          v84 += 4104;
          --v82;
        }
        while (v82);
      }
      else
      {
        float v80 = 3.4028e38;
      }
      unsigned int v91 = *(_DWORD *)(v78 + 24672);
      if (v91 <= (float)((float)v75 * 0.03125)) {
        unsigned int v92 = v91 - 1;
      }
      else {
        unsigned int v92 = (float)((float)v75 * 0.03125);
      }
      float v81 = *(float *)(v78 + 8 * v92 + 16436)
          * (float)((float)v75 - *(float *)(v78 + 8 * v92 + 16440));
    }
    *(double *)&block[16] = v80;
    *(double *)&block[24] = v81;
    uint64_t v202 = v80;
    uint64_t v203 = v81;
  }
  AGX::ClipRectContextGen3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setViewports((uint64_t)(v15 + 4660), (uint64_t)block, 1u, 0);
  AGX::ClipRectContextGen3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setScissors((uint64_t)(v15 + 4660), &v201, 1u);
  *((unsigned char *)v15 + 38400) = 1;
  *(void *)((char *)v15 + 38500) = 0;
  *((unsigned char *)v15 + 38512) = 0;
  v15[4815] = 0;
  v15[4823] = 0;
  v15[4827] = 0;
  *(_OWORD *)(v15 + 4805) = 0u;
  *(_OWORD *)(v15 + 4807) = 0u;
  __asm { FMOV            V0.2S, #1.0 }
  v15[4828] = _D0;
  v15[4829] = 0;
  *((unsigned char *)v15 + 38640) = 1;
  *((unsigned char *)v15 + 38643) = 1;
  *((_DWORD *)v15 + 9661) = -1;
  *((unsigned char *)v15 + 38652) = 0;
  *((_DWORD *)v15 + 9664) = 1;
  AGX::SpillInfoGen3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::SpillInfoGen3((uint64_t)(v15 + 4837), *(void *)(v15[182] + 808), *(void *)(*(void *)(v15[182] + 808) + 6032));
  AGX::SpillInfoGen3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::SpillInfoGen3((uint64_t)(v15 + 4852), *(void *)(v15[182] + 808), *(void *)(*(void *)(v15[182] + 808) + 6040));
  v15[4867] = 0;
  *((_OWORD *)v15 + 3711) = xmmword_242EA7390;
  *((_DWORD *)v15 + 16959) = 1065353216;
  v15[8480] = 0x100000001;
  *(_OWORD *)(v15 + 8595) = xmmword_242EA7390;
  *(void *)((char *)v15 + 77372) = -3229614080;
  *((_DWORD *)v15 + 19345) = 1065353216;
  v15[11309] = 0;
  *((_DWORD *)v15 + 22620) = 0;
  v15[11321] = 0;
  bzero(v15 + 10671, 0x230uLL);
  *((unsigned char *)v15 + 90576) = parallelSubContext;
  char v97 = [a4 pointCoordYFlipEnabled];
  v15[11324] = 0;
  *((unsigned char *)v15 + 90578) = v97;
  *(void *)((char *)v15 + 90580) = 1;
  v15[11325] = -1;
  v184 = (unsigned int *)(v15 + 11325);
  v15[11326] = -1;
  v190 = (unsigned int *)(v15 + 11326);
  v192 = (void *)[a4 sampleBufferAttachments];
  if (v192)
  {
    v98 = (void *)[v192 _descriptorAtIndex:0];
    v99 = v98;
    v187 = (unsigned int *)v15 + 22651;
    v186 = (unsigned int *)v15 + 22653;
    if (v98)
    {
      v100 = (AGXMTLCounterSampleBuffer *)[v98 sampleBuffer];
      unsigned int v181 = [v99 startOfVertexSampleIndex];
      unsigned int v101 = [v99 endOfVertexSampleIndex];
      unsigned int v102 = [v99 startOfFragmentSampleIndex];
      unsigned int v103 = [v99 endOfFragmentSampleIndex];
      if (v100)
      {
        unsigned int *v184 = v181;
        unsigned int *v187 = v101;
        unsigned int *v190 = v102;
        unsigned int *v186 = v103;
        int v104 = AGX::CounterSamplingContextGen1::validateSampleIndex(v100, v184);
        int v105 = AGX::CounterSamplingContextGen1::validateSampleIndex(v100, v187);
        int v106 = AGX::CounterSamplingContextGen1::validateSampleIndex(v100, v190);
        if ((v104 | v105 | v106 | AGX::CounterSamplingContextGen1::validateSampleIndex(v100, v186)) == 1) {
          AGX::CounterSamplingContextGen1::setCounterSampleBuffer((AGX::CounterSamplingContextGen1 *)(v15 + 11324), v100);
        }
      }
    }
    v107 = (void *)[v192 _descriptorAtIndex:1];
    v108 = v107;
    if (v107)
    {
      v109 = (AGXMTLCounterSampleBuffer *)[v107 sampleBuffer];
      unsigned int v182 = [v108 startOfVertexSampleIndex];
      unsigned int v110 = [v108 endOfVertexSampleIndex];
      unsigned int v111 = [v108 startOfFragmentSampleIndex];
      unsigned int v112 = [v108 endOfFragmentSampleIndex];
      if (v109)
      {
        unsigned int *v184 = v182;
        unsigned int *v187 = v110;
        unsigned int *v190 = v111;
        unsigned int *v186 = v112;
        int v113 = AGX::CounterSamplingContextGen1::validateSampleIndex(v109, v184);
        int v114 = AGX::CounterSamplingContextGen1::validateSampleIndex(v109, v187);
        int v115 = AGX::CounterSamplingContextGen1::validateSampleIndex(v109, v190);
        if ((v113 | v114 | v115 | AGX::CounterSamplingContextGen1::validateSampleIndex(v109, v186)) == 1) {
          AGX::CounterSamplingContextGen1::setCounterSampleBuffer((AGX::CounterSamplingContextGen1 *)(v15 + 11324), v109);
        }
      }
    }
    v116 = (void *)[v192 _descriptorAtIndex:2];
    v117 = v116;
    if (v116)
    {
      v118 = (AGXMTLCounterSampleBuffer *)[v116 sampleBuffer];
      unsigned int v183 = [v117 startOfVertexSampleIndex];
      unsigned int v119 = [v117 endOfVertexSampleIndex];
      unsigned int v120 = [v117 startOfFragmentSampleIndex];
      unsigned int v121 = [v117 endOfFragmentSampleIndex];
      if (v118)
      {
        unsigned int *v184 = v183;
        unsigned int *v187 = v119;
        unsigned int *v190 = v120;
        unsigned int *v186 = v121;
        int v122 = AGX::CounterSamplingContextGen1::validateSampleIndex(v118, v184);
        int v123 = AGX::CounterSamplingContextGen1::validateSampleIndex(v118, v187);
        int v124 = AGX::CounterSamplingContextGen1::validateSampleIndex(v118, v190);
        if ((v122 | v123 | v124 | AGX::CounterSamplingContextGen1::validateSampleIndex(v118, v186)) == 1) {
          AGX::CounterSamplingContextGen1::setCounterSampleBuffer((AGX::CounterSamplingContextGen1 *)(v15 + 11324), v118);
        }
      }
    }
    v125 = (void *)[v192 _descriptorAtIndex:3];
    v126 = v125;
    if (v125)
    {
      v127 = (AGXMTLCounterSampleBuffer *)[v125 sampleBuffer];
      unsigned int v193 = [v126 startOfVertexSampleIndex];
      unsigned int v128 = [v126 endOfVertexSampleIndex];
      unsigned int v129 = [v126 startOfFragmentSampleIndex];
      unsigned int v130 = [v126 endOfFragmentSampleIndex];
      if (v127)
      {
        unsigned int *v184 = v193;
        unsigned int *v187 = v128;
        unsigned int *v190 = v129;
        unsigned int *v186 = v130;
        int v131 = AGX::CounterSamplingContextGen1::validateSampleIndex(v127, v184);
        int v132 = AGX::CounterSamplingContextGen1::validateSampleIndex(v127, v187);
        int v133 = AGX::CounterSamplingContextGen1::validateSampleIndex(v127, v190);
        if ((v131 | v132 | v133 | AGX::CounterSamplingContextGen1::validateSampleIndex(v127, v186)) == 1) {
          AGX::CounterSamplingContextGen1::setCounterSampleBuffer((AGX::CounterSamplingContextGen1 *)(v15 + 11324), v127);
        }
      }
    }
  }
  int v134 = *(unsigned __int8 *)(*(void *)(v15[182] + 808) + 5105);
  int v135 = *(unsigned __int8 *)(*(void *)(v15[182] + 808) + 5106);
  *((_DWORD *)v15 + 22694) = 0;
  *((_OWORD *)v15 + 5674) = 0u;
  *((_OWORD *)v15 + 5675) = 0u;
  *((_OWORD *)v15 + 5676) = 0u;
  *((_OWORD *)v15 + 5677) = 0u;
  *((_OWORD *)v15 + 5678) = 0u;
  *((_OWORD *)v15 + 5679) = 0u;
  *((_OWORD *)v15 + 5680) = 0u;
  *((_OWORD *)v15 + 5681) = 0u;
  *((_OWORD *)v15 + 5682) = 0u;
  *((_OWORD *)v15 + 5683) = 0u;
  *((_OWORD *)v15 + 5684) = 0u;
  *((_OWORD *)v15 + 5685) = 0u;
  *((_OWORD *)v15 + 5686) = 0u;
  *((_OWORD *)v15 + 5687) = 0u;
  *((_OWORD *)v15 + 5688) = 0u;
  *((_OWORD *)v15 + 5689) = 0u;
  *((_OWORD *)v15 + 5690) = 0u;
  *((_OWORD *)v15 + 5691) = 0u;
  *((_OWORD *)v15 + 5692) = 0u;
  *((_OWORD *)v15 + 5693) = 0u;
  *((_OWORD *)v15 + 5694) = 0u;
  if (v134) {
    int v136 = 68;
  }
  else {
    int v136 = 4;
  }
  *((_DWORD *)v15 + 22692) = v136 | (v135 << 7);
  *((_DWORD *)v15 + 22693) = 0;
  *((_OWORD *)v15 + 5695) = 0uLL;
  *((_OWORD *)v15 + 5698) = xmmword_242EA87C0;
  AGX::FramebufferGen3_2<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::addAPIResources(v15[246], v15[185], v15[186]);
  *((_WORD *)v15 + 19208) = *(_WORD *)(v15[246] + 4376);
  *((_DWORD *)v15 + 9308) = v15[4654] & 0x199FFFFF | 0x200000;
  *((_DWORD *)v15 + 9311) &= 0xFFFE0000;
  *(void *)((char *)v15 + 37236) |= 0xC0000000C00000uLL;
  uint64_t v137 = v15[11309];
  *((_DWORD *)v15 + 9313) &= 0xFF1EFFFF;
  v15[11309] = v137 | 0x5F500000000004;
  *((_DWORD *)v15 + 22620) = 5;
  *(_OWORD *)(v15 + 11327) = 0u;
  *(_OWORD *)(v15 + 11329) = 0u;
  *(_OWORD *)(v15 + 11331) = 0u;
  *(_OWORD *)(v15 + 11333) = 0u;
  *(_OWORD *)(v15 + 11335) = 0u;
  *(_OWORD *)(v15 + 11337) = 0u;
  *(_OWORD *)(v15 + 11339) = 0u;
  *(_OWORD *)(v15 + 11341) = 0u;
  uint64_t v138 = v15[182];
  unsigned int v139 = *(_DWORD *)(*(void *)(v138 + 808) + 7764);
  *((unsigned char *)v15 + 38494) = v139 > 0x8FFFF;
  *((unsigned char *)v15 + 38496) = v139 > 0xAFFFF;
  v15[4939] = v15 + 4874;
  v15[4940] = v15 + 7422;
  v15[6213] = v15 + 6148;
  v15[6214] = v15 + 8595;
  uint64_t v140 = *(void *)(v138 + 808);
  long long v141 = *(_OWORD *)(v140 + 7328);
  *(_OWORD *)block = *(_OWORD *)(v140 + 7312);
  *(_OWORD *)&block[16] = v141;
  v142 = v15 + 5073;
  uint64_t v143 = 128;
  do
  {
    long long v144 = *(_OWORD *)block;
    v142[638] = *(_OWORD *)&block[16];
    v142[637] = v144;
    long long v145 = *(_OWORD *)&block[16];
    _OWORD *v142 = *(_OWORD *)block;
    v142[1] = v145;
    v142 += 2;
    --v143;
  }
  while (v143);
  uint64_t v146 = *(void *)(v138 + 808);
  long long v147 = *(_OWORD *)(v146 + 7360);
  *(_OWORD *)block = *(_OWORD *)(v146 + 7344);
  *(_OWORD *)&block[16] = v147;
  v148 = v15 + 5585;
  uint64_t v149 = 128;
  do
  {
    long long v150 = *(_OWORD *)block;
    v148[638] = *(_OWORD *)&block[16];
    v148[637] = v150;
    long long v151 = *(_OWORD *)&block[16];
    _OWORD *v148 = *(_OWORD *)block;
    v148[1] = v151;
    v148 += 2;
    --v149;
  }
  while (v149);
  uint64_t v152 = v15[246];
  uint64_t v153 = *(unsigned int *)(v152 + 2584);
  if (!v153) {
    goto LABEL_146;
  }
  if (v153 >= 4)
  {
    uint64_t v155 = 0;
    uint64_t v154 = v153 & 0xFFFFFFFC;
    v156 = (const float *)(v152 + 2592);
    float32x4_t v157 = (float32x4_t)vdupq_n_s32(0x3D800000u);
    do
    {
      float32x4x2_t v205 = vld2q_f32(v156);
      v156 += 8;
      v206.val[0] = vmulq_f32(vcvtq_f32_u32((uint32x4_t)v205.val[0]), v157);
      v206.val[1] = vmulq_f32(vcvtq_f32_u32((uint32x4_t)v205.val[1]), v157);
      v158 = (float *)v15 + (v155 & 0xFFFFFFF8) + 18996;
      vst2q_f32(v158, v206);
      v155 += 8;
    }
    while (((2 * v153) & 0x1FFFFFFF8) != v155);
    if (v154 == v153) {
      goto LABEL_146;
    }
  }
  else
  {
    uint64_t v154 = 0;
  }
  uint64_t v159 = v153 - v154;
  uint64_t v160 = 2 * v154;
  v161 = (uint32x2_t *)(v152 + 8 * v154 + 2592);
  float32x2_t v162 = (float32x2_t)vdup_n_s32(0x3D800000u);
  do
  {
    uint32x2_t v163 = *v161++;
    *(float32x2_t *)((char *)v15 + 4 * (v160 & 0xFFFFFFFE) + 75984) = vmul_f32(vcvt_f32_u32(v163), v162);
    v160 += 2;
    --v159;
  }
  while (v159);
LABEL_146:
  v15[11307] |= 0x40uLL;
  *((_DWORD *)v15 + 19304) = 0;
  *((_DWORD *)v15 + 19348) = *(_DWORD *)(v152 + 5072);
  *((_OWORD *)v15 + 1234) = *(_OWORD *)(v152 + 5208);
  *((_OWORD *)v15 + 4825) = *(_OWORD *)(v152 + 5208);
  *((_DWORD *)v15 + 16962) = *(_DWORD *)(v152 + 5248) > 1u;
  uint64_t v164 = [a4 threadgroupMemoryLength];
  unint64_t v165 = 80;
  if (!v164) {
    unint64_t v165 = 0;
  }
  *(void *)((char *)v15 + ((v165 >> 3) & 8) + 91168) |= 1 << (v165 & 0x10);
  if ((unint64_t)objc_msgSend(a4, "renderTargetArrayLength", AGX::FramebufferGen3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::updateResourceGroupUsage(v15[246], (void *)v15[199])) >= 2)v15[11397] |= 0x80000uLL; {
  uint64_t v166 = [a4 rasterizationRateMap];
  }
  if (v166)
  {
    if (*(void *)v191) {
      MTLResourceListAddResource();
    }
    v15[11321] = v166;
    v15[11397] |= 0x200000uLL;
  }
  uint64_t v167 = v15[182];
  v15[11319] = *(void *)(v167 + 808) + 6472;
  v15[11320] = *(void *)(v167 + 808) + 6536;
  v168 = (_DWORD *)v15[246];
  int v169 = v168[1268];
  int v170 = v168[1269];
  int v171 = v168[1270];
  if (v170) {
    int v172 = v170 + 64;
  }
  else {
    int v172 = 0;
  }
  unsigned int v173 = ((v172 + 4095) >> 12) + ((v169 + 0x1FFF) >> 12);
  unsigned int v174 = ((v169 + 69631) >> 16) + ((v172 + 0xFFFF) >> 16);
  unsigned int v175 = v173 + ((v171 + 4095) >> 12);
  unsigned int v176 = v174 + ((v171 + 0xFFFF) >> 16);
  if (*(unsigned char *)(v15[4859] + 7815)) {
    unsigned int v177 = 11;
  }
  else {
    unsigned int v177 = 6;
  }
  if (v177 >= 8) {
    int v178 = 8;
  }
  else {
    int v178 = v177;
  }
  v15[247] = (v178 * v176 + v177 * v175) | ((unint64_t)(v176 + v175) << 32);
  *((_DWORD *)v15 + 496) = v176;
  *((_DWORD *)v15 + 19347) = (v168[644] + v168[985] - 1) / v168[985];
  *((_DWORD *)v15 + 381) = 1;
  AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::beginRenderPass(*p_impl);
  v179 = v185;
  if (!a5) {
    AGX::FramebufferGen3_2<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::allocateDatabufferResources(*(void *)(*p_impl + 1968), (void *)(*p_impl + 16));
  }
  return v179;
}

- (AGXG17FamilyRenderContext)initWithCommandBuffer:(id)a3 descriptor:(id)a4
{
  return [(AGXG17FamilyRenderContext *)self initWithCommandBuffer:a3 descriptor:a4 subEncoderIndex:0 framebuffer:0];
}

- (void)getImpl
{
  return self->_impl;
}

@end