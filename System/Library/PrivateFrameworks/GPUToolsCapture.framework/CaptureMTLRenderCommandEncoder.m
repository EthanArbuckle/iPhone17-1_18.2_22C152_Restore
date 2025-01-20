@interface CaptureMTLRenderCommandEncoder
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isMemorylessRender;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLRenderCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4;
- (CaptureMTLRenderCommandEncoder)initWithBaseObject:(id)a3 captureParallelRenderCommandEncoder:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLRenderCommandEncoder)baseObject;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)streamReference;
- (unint64_t)tileHeight;
- (unint64_t)tileWidth;
- (void)dealloc;
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
- (void)endEncoding;
- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)insertDebugSignpost:(id)a3;
- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6;
- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)setAlphaTestReferenceValue:(float)a3;
- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6;
- (void)setClipPlane:(float)a3 p2:(float)a4 p3:(float)a5 p4:(float)a6 atIndex:(unint64_t)a7;
- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 atIndex:(unint64_t)a7;
- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7 atIndex:(unint64_t)a8;
- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setCommandDataCorruptModeSPI:(unint64_t)a3;
- (void)setCullMode:(unint64_t)a3;
- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5;
- (void)setDepthCleared;
- (void)setDepthClipMode:(unint64_t)a3;
- (void)setDepthClipModeSPI:(unint64_t)a3;
- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6;
- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7;
- (void)setDepthStencilState:(id)a3;
- (void)setDepthStoreAction:(unint64_t)a3;
- (void)setDepthStoreActionOptions:(unint64_t)a3;
- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 lodBias:(float)a6 atIndex:(unint64_t)a7;
- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6;
- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setFrontFacingWinding:(unint64_t)a3;
- (void)setLabel:(id)a3;
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
- (void)setStencilStoreActionOptions:(unint64_t)a3;
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
- (void)setTransformFeedbackState:(unint64_t)a3;
- (void)setTriangleFillMode:(unint64_t)a3;
- (void)setTriangleFrontFillMode:(unint64_t)a3 backFillMode:(unint64_t)a4;
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
- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 lodBias:(float)a6 atIndex:(unint64_t)a7;
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
- (void)touch;
- (void)updateFence:(id)a3 afterStages:(unint64_t)a4;
- (void)useHeap:(id)a3;
- (void)useHeap:(id)a3 stages:(unint64_t)a4;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5;
- (void)useResidencySet:(id)a3;
- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5;
- (void)useResourceGroup:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6;
- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4;
@end

@implementation CaptureMTLRenderCommandEncoder

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_captureCommandBuffer);
  objc_storeStrong((id *)&self->_retainedObjects, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject waitForFence:v9 beforeStages:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16125;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  v15 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6
{
  unint64_t v31 = a6;
  RetainArray(self->_retainedObjects, (id *)a3, a4);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  uint64_t v10 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v32);
  baseObject = self->_baseObject;
  unint64_t v12 = 8 * a4;
  __chkstk_darwin(v10, v13);
  bzero((char *)&v30 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a4);
  if (a4)
  {
    uint64_t v14 = a3;
    v15 = (uint64_t *)((char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v16 = a4;
    do
    {
      v17 = (void *)*v14++;
      *v15++ = [v17 baseObject];
      --v16;
    }
    while (v16);
  }
  unint64_t v18 = v31;
  [(MTLRenderCommandEncoderSPI *)baseObject useResources:(char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0) count:a4 usage:a5 stages:v31];
  uint64_t v19 = v33;
  *(_DWORD *)(v33 + 8) = -15818;
  char v20 = BYTE9(v34);
  if (BYTE9(v34) > 0x18uLL)
  {
    uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 24);
    uint64_t v23 = BYTE10(v34);
    ++BYTE10(v34);
    long long v21 = GTTraceMemPool_allocateBytes(v22, *((uint64_t *)&v33 + 1), v23 | 0x2800000000) + 16;
    char v20 = v23;
  }
  else
  {
    long long v21 = (char *)(v19 + BYTE9(v34));
    BYTE9(v34) += 40;
  }
  *(unsigned char *)(v19 + 13) = v20;
  v24 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v24, v25);
  bzero((char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a4);
  char v27 = StreamArray((uint64_t)&v32, (uint64_t *)((char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, a4);
  *(void *)long long v21 = var0;
  *((void *)v21 + 1) = a4;
  *((void *)v21 + 2) = a5;
  *((void *)v21 + 3) = v18;
  v21[32] = v27;
  *(_DWORD *)(v21 + 33) = 0;
  *((_DWORD *)v21 + 9) = 0;
  s();
  *(void *)uint64_t v28 = v29;
  *(unsigned char *)(v28 + 8) = BYTE8(v34);
  *(unsigned char *)(v33 + 15) |= 8u;
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  RetainArray(self->_retainedObjects, (id *)a3, a4);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  v9 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v28);
  baseObject = self->_baseObject;
  unint64_t v11 = 8 * a4;
  __chkstk_darwin(v9, v12);
  bzero((char *)&v28 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a4);
  if (a4)
  {
    uint64_t v13 = a3;
    uint64_t v14 = (void *)((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v15 = a4;
    do
    {
      unint64_t v16 = (void *)*v13++;
      *v14++ = [v16 baseObject];
      --v15;
    }
    while (v15);
  }
  [(MTLRenderCommandEncoderSPI *)baseObject useResources:(char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0) count:a4 usage:a5];
  uint64_t v17 = v29;
  *(_DWORD *)(v29 + 8) = -16042;
  char v18 = BYTE9(v30);
  if (BYTE9(v30) > 0x20uLL)
  {
    uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 24);
    uint64_t v21 = BYTE10(v30);
    ++BYTE10(v30);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, *((uint64_t *)&v29 + 1), v21 | 0x2000000000) + 16;
    char v18 = v21;
  }
  else
  {
    uint64_t v19 = (char *)(v17 + BYTE9(v30));
    BYTE9(v30) += 32;
  }
  *(unsigned char *)(v17 + 13) = v18;
  uint64_t v22 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v22, v23);
  bzero((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a4);
  char v25 = StreamArray((uint64_t)&v28, (long long *)((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, a4);
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = a4;
  *((void *)v19 + 2) = a5;
  v19[24] = v25;
  *(_DWORD *)(v19 + 25) = 0;
  *((_DWORD *)v19 + 7) = 0;
  s();
  *(void *)uint64_t v26 = v27;
  *(unsigned char *)(v26 + 8) = BYTE8(v30);
  *(unsigned char *)(v29 + 15) |= 8u;
}

- (void)useResourceGroup:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  id v12 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderCommandEncoder_useResourceGroup_usage_stages", (uint64_t)"Resource groups", 0, 0);
  [v12 touch];
  v8 = v12;
  if (v12)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      [(NSMutableSet *)retainedObjects addObject:v12];
      v8 = v12;
    }
  }
  baseObject = self->_baseObject;
  unint64_t v11 = [v8 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject useResourceGroup:v11 usage:a4 stages:a5];
}

- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  unint64_t v11 = [v8 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject useResource:v11 usage:a4 stages:a5];

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15819;
  char v13 = BYTE9(v25);
  if (BYTE9(v25) > 0x20uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v16 = BYTE10(v25);
    ++BYTE10(v25);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x2000000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v25));
    BYTE9(v25) += 32;
  }
  *(unsigned char *)(v12 + 13) = v13;
  uint64_t v17 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject useResource:v9 usage:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16043;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  uint64_t v15 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderCommandEncoder_useResidencySets_count", (uint64_t)"Deprecated Residency Set API", 0, 0);
  RetainArray(self->_retainedObjects, (id *)a3, a4);
  baseObject = self->_baseObject;
  __chkstk_darwin(v8, 8 * a4);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v10, v9);
  if (a4)
  {
    char v11 = v10;
    unint64_t v12 = a4;
    do
    {
      uint64_t v13 = (void *)*a3++;
      *(void *)char v11 = [v13 baseObject];
      v11 += 8;
      --v12;
    }
    while (v12);
  }
  [(MTLRenderCommandEncoderSPI *)baseObject useResidencySets:v10 count:a4];
}

- (void)useResidencySet:(id)a3
{
  id v8 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderCommandEncoder_useResidencySet", (uint64_t)"Deprecated Residency Set API", 0, 0);
  [v8 touch];
  v4 = v8;
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      [(NSMutableSet *)retainedObjects addObject:v8];
      v4 = v8;
    }
  }
  baseObject = self->_baseObject;
  v7 = [v4 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject useResidencySet:v7];
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5
{
  RetainArray(self->_retainedObjects, (id *)a3, a4);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  size_t v9 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v28);
  baseObject = self->_baseObject;
  unint64_t v11 = 8 * a4;
  __chkstk_darwin(v9, v12);
  bzero((char *)&v28 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a4);
  if (a4)
  {
    uint64_t v13 = a3;
    uint64_t v14 = (void *)((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v15 = a4;
    do
    {
      uint64_t v16 = (void *)*v13++;
      *v14++ = [v16 baseObject];
      --v15;
    }
    while (v15);
  }
  [(MTLRenderCommandEncoderSPI *)baseObject useHeaps:(char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0) count:a4 stages:a5];
  uint64_t v17 = v29;
  *(_DWORD *)(v29 + 8) = -15820;
  char v18 = BYTE9(v30);
  if (BYTE9(v30) > 0x20uLL)
  {
    uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 24);
    uint64_t v21 = BYTE10(v30);
    ++BYTE10(v30);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, *((uint64_t *)&v29 + 1), v21 | 0x2000000000) + 16;
    char v18 = v21;
  }
  else
  {
    uint64_t v19 = (char *)(v17 + BYTE9(v30));
    BYTE9(v30) += 32;
  }
  *(unsigned char *)(v17 + 13) = v18;
  long long v22 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v22, v23);
  bzero((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a4);
  char v25 = StreamArray((uint64_t)&v28, (long long *)((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, a4);
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = a4;
  *((void *)v19 + 2) = a5;
  v19[24] = v25;
  *(_DWORD *)(v19 + 25) = 0;
  *((_DWORD *)v19 + 7) = 0;
  s();
  *(void *)uint64_t v26 = v27;
  *(unsigned char *)(v26 + 8) = BYTE8(v30);
  *(unsigned char *)(v29 + 15) |= 8u;
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  RetainArray(self->_retainedObjects, (id *)a3, a4);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  v7 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v26);
  baseObject = self->_baseObject;
  unint64_t v9 = 8 * a4;
  __chkstk_darwin(v7, v10);
  bzero((char *)&v26 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a4);
  if (a4)
  {
    unint64_t v11 = a3;
    uint64_t v12 = (void *)((char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v13 = a4;
    do
    {
      uint64_t v14 = (void *)*v11++;
      *v12++ = [v14 baseObject];
      --v13;
    }
    while (v13);
  }
  [(MTLRenderCommandEncoderSPI *)baseObject useHeaps:(char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0) count:a4];
  uint64_t v15 = v27;
  *(_DWORD *)(v27 + 8) = -16040;
  char v16 = BYTE9(v28);
  if (BYTE9(v28) > 0x28uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v19 = BYTE10(v28);
    ++BYTE10(v28);
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v27 + 1), v19 | 0x1800000000) + 16;
    char v16 = v19;
  }
  else
  {
    uint64_t v17 = (char *)(v15 + BYTE9(v28));
    BYTE9(v28) += 24;
  }
  *(unsigned char *)(v15 + 13) = v16;
  uint64_t v20 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v20, v21);
  bzero((char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a4);
  char v23 = StreamArray((uint64_t)&v26, (long long *)((char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, a4);
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = a4;
  v17[16] = v23;
  *(_DWORD *)(v17 + 17) = 0;
  *((_DWORD *)v17 + 5) = 0;
  s();
  *(void *)uint64_t v24 = v25;
  *(unsigned char *)(v24 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;
}

- (void)useHeap:(id)a3 stages:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  unint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject useHeap:v9 stages:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15821;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  uint64_t v15 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)useHeap:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v4];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  baseObject = self->_baseObject;
  v7 = [v4 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject useHeap:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16041;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  uint64_t v13 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)updateFence:(id)a3 afterStages:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  char v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject updateFence:v9 afterStages:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16126;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  uint64_t v15 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setVisibilityResultMode:a3 offset:a4];
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16252;
  char v8 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v11 = BYTE10(v18);
    ++BYTE10(v18);
    char v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v17 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    char v9 = (char *)(v7 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)char v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
}

- (void)setViewportTransformEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setViewportTransformEnabled:v3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15720;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    uint64_t v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (void)setViewport:(id *)a3
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  baseObject = self->_baseObject;
  long long v6 = *(_OWORD *)&a3->var2;
  v18[0] = *(_OWORD *)&a3->var0;
  v18[1] = v6;
  v18[2] = *(_OWORD *)&a3->var4;
  [(MTLRenderCommandEncoderSPI *)baseObject setViewport:v18];
  uint64_t v7 = v20;
  *(_DWORD *)(v20 + 8) = -16270;
  char v8 = BYTE9(v21);
  if (BYTE9(v21) > 8uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v11 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v20 + 1), v11 | 0x3800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v21));
    BYTE9(v21) += 56;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v9 = var0;
  long long v14 = *(_OWORD *)&a3->var2;
  long long v15 = *(_OWORD *)&a3->var4;
  *(_OWORD *)(v9 + 8) = *(_OWORD *)&a3->var0;
  *(_OWORD *)(v9 + 24) = v14;
  *(_OWORD *)(v9 + 40) = v15;
  s();
  *(void *)uint64_t v16 = v17;
  *(unsigned char *)(v16 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  char v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  bzero((char *)&v27 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = (void *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v14 = length;
    do
    {
      long long v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  -[MTLRenderCommandEncoderSPI setVertexVisibleFunctionTables:withBufferRange:](baseObject, "setVertexVisibleFunctionTables:withBufferRange:", (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15445;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    long long v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    long long v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  long long v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v21, v22);
  bzero((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v24 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  *(void *)long long v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setVertexVisibleFunctionTable:v9 atBufferIndex:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15446;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  long long v15 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  char v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  bzero((char *)&v27 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = (void *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v14 = length;
    do
    {
      long long v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  -[MTLRenderCommandEncoderSPI setVertexTextures:withRange:](baseObject, "setVertexTextures:withRange:", (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16275;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  long long v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v21, v22);
  bzero((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v24 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setVertexTexture:v9 atIndex:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16276;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  long long v15 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  char v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  bzero((char *)&v27 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = (void *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v14 = length;
    do
    {
      long long v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  -[MTLRenderCommandEncoderSPI setVertexSamplerStates:withRange:](baseObject, "setVertexSamplerStates:withRange:", (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16273;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  long long v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v21, v22);
  bzero((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v24 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  long long v34 = (float *)a4;
  RetainArray(self->_retainedObjects, (id *)a3, a6.length);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  uint64_t v10 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v35);
  baseObject = self->_baseObject;
  uint64_t v12 = 8 * length;
  __chkstk_darwin(v10, v13);
  bzero((char *)&location - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    NSUInteger v14 = a3;
    long long v15 = (NSUInteger *)((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v16 = length;
    do
    {
      char v17 = (void *)*v14++;
      *v15++ = objc_msgSend(v17, "baseObject", location);
      --v16;
    }
    while (v16);
  }
  NSUInteger v18 = location;
  uint64_t v19 = (float *)a5;
  -[MTLRenderCommandEncoderSPI setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:](baseObject, "setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:", (char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v34, a5, location, length, location);
  uint64_t v20 = v36;
  *(_DWORD *)(v36 + 8) = -16271;
  char v21 = BYTE9(v37);
  if (BYTE9(v37) > 0x20uLL)
  {
    uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 24);
    uint64_t v24 = BYTE10(v37);
    ++BYTE10(v37);
    uint64_t v22 = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v36 + 1), v24 | 0x2000000000) + 16;
    char v21 = v24;
  }
  else
  {
    uint64_t v22 = (char *)(v20 + BYTE9(v37));
    BYTE9(v37) += 32;
  }
  *(unsigned char *)(v20 + 13) = v21;
  uint64_t v25 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v25, v26);
  bzero((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v28 = StreamArray((uint64_t)&v35, (NSUInteger *)((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  char v29 = GTTraceEncoder_storeBytes((uint64_t)&v35, v34, 4 * length);
  char v30 = GTTraceEncoder_storeBytes((uint64_t)&v35, v19, 4 * length);
  *(void *)uint64_t v22 = var0;
  *((void *)v22 + 1) = v18;
  *((void *)v22 + 2) = length;
  v22[24] = v28;
  v22[25] = v29;
  v22[26] = v30;
  *(_DWORD *)(v22 + 27) = 0;
  v22[31] = 0;
  s();
  *(void *)uint64_t v31 = v32;
  *(unsigned char *)(v31 + 8) = BYTE8(v37);
  *(unsigned char *)(v36 + 15) |= 8u;
}

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 lodBias:(float)a6 atIndex:(unint64_t)a7
{
  id v19 = a3;
  [v19 touch];
  uint64_t v12 = v19;
  if (v19)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      [(NSMutableSet *)retainedObjects addObject:v19];
      uint64_t v12 = v19;
    }
  }
  baseObject = self->_baseObject;
  long long v15 = [v12 baseObject];
  *(float *)&double v16 = a4;
  *(float *)&double v17 = a5;
  *(float *)&double v18 = a6;
  [(MTLRenderCommandEncoderSPI *)baseObject setVertexSamplerState:v15 lodMinClamp:a7 lodMaxClamp:v16 lodBias:v17 atIndex:v18];
}

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v10 = a3;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v10];
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v13 = [v10 baseObject];
  *(float *)&double v14 = a4;
  *(float *)&double v15 = a5;
  [(MTLRenderCommandEncoderSPI *)baseObject setVertexSamplerState:v13 lodMinClamp:a6 lodMaxClamp:v14 atIndex:v15];

  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16272;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    double v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    double v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  char v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v23 = (uint64_t *)[v10 traceStream];
  if (v23) {
    uint64_t v24 = *v23;
  }
  else {
    uint64_t v24 = 0;
  }
  *(void *)double v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a6;
  *((float *)v18 + 6) = a4;
  *((float *)v18 + 7) = a5;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setVertexSamplerState:v9 atIndex:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16274;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  double v15 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setVertexIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  char v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  bzero((char *)&v27 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = (void *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v14 = length;
    do
    {
      double v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  -[MTLRenderCommandEncoderSPI setVertexIntersectionFunctionTables:withBufferRange:](baseObject, "setVertexIntersectionFunctionTables:withBufferRange:", (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15447;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  long long v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v21, v22);
  bzero((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v24 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setVertexIntersectionFunctionTable:v9 atBufferIndex:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15448;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  double v15 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setVertexBytes:a3 length:a4 attributeStride:a5 atIndex:a6];
  uint64_t v11 = v22;
  *(_DWORD *)(v22 + 8) = -15272;
  char v12 = BYTE9(v23);
  if (BYTE9(v23) > 0x18uLL)
  {
    uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v15 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v13 = GTTraceMemPool_allocateBytes(v14, *((uint64_t *)&v22 + 1), v15 | 0x2800000000) + 16;
    char v12 = v15;
  }
  else
  {
    uint64_t v13 = (char *)(v11 + BYTE9(v23));
    BYTE9(v23) += 40;
  }
  *(unsigned char *)(v11 + 13) = v12;
  uint64_t v16 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v18 = GTTraceEncoder_storeBlob((uint64_t)&v21, a3, a4);
  }
  else {
    char v18 = 0;
  }
  *(void *)uint64_t v13 = var0;
  *((void *)v13 + 1) = a4;
  *((void *)v13 + 2) = a5;
  *((void *)v13 + 3) = a6;
  v13[32] = v18;
  *(_DWORD *)(v13 + 33) = 0;
  *((_DWORD *)v13 + 9) = 0;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setVertexBytes:a3 length:a4 atIndex:a5];
  uint64_t v9 = v20;
  *(_DWORD *)(v20 + 8) = -16225;
  char v10 = BYTE9(v21);
  if (BYTE9(v21) > 0x20uLL)
  {
    uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v13 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v11 = GTTraceMemPool_allocateBytes(v12, *((uint64_t *)&v20 + 1), v13 | 0x2000000000) + 16;
    char v10 = v13;
  }
  else
  {
    uint64_t v11 = (char *)(v9 + BYTE9(v21));
    BYTE9(v21) += 32;
  }
  *(unsigned char *)(v9 + 13) = v10;
  uint64_t v14 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v16 = GTTraceEncoder_storeBlob((uint64_t)&v19, a3, a4);
  }
  else {
    char v16 = 0;
  }
  *(void *)uint64_t v11 = var0;
  *((void *)v11 + 1) = a4;
  *((void *)v11 + 2) = a5;
  v11[24] = v16;
  *(_DWORD *)(v11 + 25) = 0;
  *((_DWORD *)v11 + 7) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  RetainArray(self->_retainedObjects, (id *)a3, a5.length);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  uint64_t v9 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v32);
  baseObject = self->_baseObject;
  uint64_t v11 = 8 * length;
  __chkstk_darwin(v9, v12);
  bzero((char *)&v30 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v13 = a3;
    uint64_t v14 = (uint64_t *)((char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v15 = length;
    do
    {
      char v16 = (void *)*v13++;
      *v14++ = [v16 baseObject];
      --v15;
    }
    while (v15);
  }
  NSUInteger v17 = location;
  -[MTLRenderCommandEncoderSPI setVertexBuffers:offsets:withRange:](baseObject, "setVertexBuffers:offsets:withRange:", (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a4, location, length);
  uint64_t v18 = v33;
  *(_DWORD *)(v33 + 8) = -16277;
  char v19 = BYTE9(v34);
  if (BYTE9(v34) > 0x20uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 24);
    uint64_t v22 = BYTE10(v34);
    ++BYTE10(v34);
    long long v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v33 + 1), v22 | 0x2000000000) + 16;
    char v19 = v22;
  }
  else
  {
    long long v20 = (char *)(v18 + BYTE9(v34));
    BYTE9(v34) += 32;
  }
  *(unsigned char *)(v18 + 13) = v19;
  long long v23 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v23, v24);
  bzero((char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v26 = StreamArray((uint64_t)&v32, (uint64_t *)((char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  char v27 = GTTraceEncoder_storeBytes((uint64_t)&v32, (void *)a4, 8 * length);
  *(void *)long long v20 = var0;
  *((void *)v20 + 1) = v17;
  *((void *)v20 + 2) = length;
  v20[24] = v26;
  v20[25] = v27;
  *(_DWORD *)(v20 + 26) = 0;
  *((_WORD *)v20 + 15) = 0;
  s();
  *(void *)uint64_t v28 = v29;
  *(unsigned char *)(v28 + 8) = BYTE8(v34);
  *(unsigned char *)(v33 + 15) |= 8u;
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  long long v35 = a4;
  RetainArray(self->_retainedObjects, (id *)a3, a6.length);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  char v10 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v36);
  baseObject = self->_baseObject;
  uint64_t v12 = 8 * length;
  __chkstk_darwin(v10, v13);
  bzero((char *)&location - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v14 = a3;
    NSUInteger v15 = (NSUInteger *)((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v16 = length;
    do
    {
      NSUInteger v17 = (void *)*v14++;
      *v15++ = objc_msgSend(v17, "baseObject", location);
      --v16;
    }
    while (v16);
  }
  NSUInteger v18 = location;
  char v19 = a5;
  -[MTLRenderCommandEncoderSPI setVertexBuffers:offsets:attributeStrides:withRange:](baseObject, "setVertexBuffers:offsets:attributeStrides:withRange:", (char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v35, a5, location, length, location);
  uint64_t v20 = v37;
  *(_DWORD *)(v37 + 8) = -15273;
  char v21 = BYTE9(v38);
  if (BYTE9(v38) > 0x20uLL)
  {
    uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 24);
    uint64_t v24 = BYTE10(v38);
    ++BYTE10(v38);
    uint64_t v22 = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v37 + 1), v24 | 0x2000000000) + 16;
    char v21 = v24;
  }
  else
  {
    uint64_t v22 = (char *)(v20 + BYTE9(v38));
    BYTE9(v38) += 32;
  }
  *(unsigned char *)(v20 + 13) = v21;
  uint64_t v25 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v25, v26);
  bzero((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v28 = StreamArray((uint64_t)&v36, (NSUInteger *)((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  uint64_t v29 = boundaryTrackerInstance;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    char v30 = GTTraceEncoder_storeBlob((uint64_t)&v36, v35, length);
    uint64_t v29 = boundaryTrackerInstance;
  }
  else
  {
    char v30 = 0;
  }
  if ((*(_DWORD *)(v29 + 20) & 0xFFFFFFFE) == 2) {
    char v31 = GTTraceEncoder_storeBlob((uint64_t)&v36, v19, length);
  }
  else {
    char v31 = 0;
  }
  *(void *)uint64_t v22 = var0;
  *((void *)v22 + 1) = v18;
  *((void *)v22 + 2) = length;
  v22[24] = v28;
  v22[25] = v30;
  v22[26] = v31;
  *(_DWORD *)(v22 + 27) = 0;
  v22[31] = 0;
  s();
  *(void *)uint64_t v32 = v33;
  *(unsigned char *)(v32 + 8) = BYTE8(v38);
  *(unsigned char *)(v37 + 15) |= 8u;
}

- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v18);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setVertexBufferOffset:a3 attributeStride:a4 atIndex:a5];
  uint64_t v9 = v19;
  *(_DWORD *)(v19 + 8) = -15274;
  char v10 = BYTE9(v20);
  if (BYTE9(v20) > 0x20uLL)
  {
    uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 24);
    uint64_t v13 = BYTE10(v20);
    ++BYTE10(v20);
    uint64_t v11 = GTTraceMemPool_allocateBytes(v12, *((uint64_t *)&v19 + 1), v13 | 0x2000000000) + 16;
    char v10 = v13;
  }
  else
  {
    uint64_t v11 = (char *)(v9 + BYTE9(v20));
    BYTE9(v20) += 32;
  }
  *(unsigned char *)(v9 + 13) = v10;
  uint64_t v14 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v11 = var0;
  *((void *)v11 + 1) = a3;
  *((void *)v11 + 2) = a4;
  *((void *)v11 + 3) = a5;
  s();
  *(void *)uint64_t v16 = v17;
  *(unsigned char *)(v16 + 8) = BYTE8(v20);
  *(unsigned char *)(v19 + 15) |= 8u;
}

- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setVertexBufferOffset:a3 atIndex:a4];
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16224;
  char v8 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v11 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v17 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  id v10 = a3;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v10];
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v25);
  baseObject = self->_baseObject;
  uint64_t v13 = [v10 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setVertexBuffer:v13 offset:a4 attributeStride:a5 atIndex:a6];

  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15275;
  char v15 = BYTE9(v27);
  if (BYTE9(v27) > 0x18uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v18 = BYTE10(v27);
    ++BYTE10(v27);
    long long v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x2800000000) + 16;
    char v15 = v18;
  }
  else
  {
    long long v16 = (char *)(v14 + BYTE9(v27));
    BYTE9(v27) += 40;
  }
  *(unsigned char *)(v14 + 13) = v15;
  long long v19 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v21 = (uint64_t *)[v10 traceStream];
  if (v21) {
    uint64_t v22 = *v21;
  }
  else {
    uint64_t v22 = 0;
  }
  *(void *)long long v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a4;
  *((void *)v16 + 3) = a5;
  *((void *)v16 + 4) = a6;
  s();
  *(void *)uint64_t v23 = v24;
  *(unsigned char *)(v23 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  uint64_t v11 = [v8 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setVertexBuffer:v11 offset:a4 atIndex:a5];

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -16278;
  char v13 = BYTE9(v25);
  if (BYTE9(v25) > 0x20uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v16 = BYTE10(v25);
    ++BYTE10(v25);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x2000000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v25));
    BYTE9(v25) += 32;
  }
  *(unsigned char *)(v12 + 13) = v13;
  uint64_t v17 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
}

- (void)setVertexAmplificationMode:(unint64_t)a3 value:(unint64_t)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setVertexAmplificationMode:a3 value:a4];
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -15812;
  char v8 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v11 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v17 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
}

- (void)setTriangleFrontFillMode:(unint64_t)a3 backFillMode:(unint64_t)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setTriangleFrontFillMode:a3 backFillMode:a4];
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -15721;
  char v8 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v11 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v17 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
}

- (void)setTriangleFillMode:(unint64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setTriangleFillMode:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16264;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    uint64_t v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (void)setTransformFeedbackState:(unint64_t)a3
{
}

- (void)setTileVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  uint64_t v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  bzero((char *)&v27 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = (void *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v14 = length;
    do
    {
      long long v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  -[MTLRenderCommandEncoderSPI setTileVisibleFunctionTables:withBufferRange:](baseObject, "setTileVisibleFunctionTables:withBufferRange:", (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15450;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    long long v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    long long v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  uint64_t v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v21, v22);
  bzero((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v24 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  *(void *)long long v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setTileVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setTileVisibleFunctionTable:v9 atBufferIndex:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15451;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  long long v15 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  uint64_t v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  bzero((char *)&v27 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = (void *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v14 = length;
    do
    {
      long long v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  -[MTLRenderCommandEncoderSPI setTileTextures:withRange:](baseObject, "setTileTextures:withRange:", (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16086;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  long long v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v21, v22);
  bzero((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v24 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setTileTexture:v9 atIndex:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16140;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  long long v15 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setTileSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  uint64_t v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  bzero((char *)&v27 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = (void *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v14 = length;
    do
    {
      long long v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  -[MTLRenderCommandEncoderSPI setTileSamplerStates:withRange:](baseObject, "setTileSamplerStates:withRange:", (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16085;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  long long v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v21, v22);
  bzero((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v24 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setTileSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  long long v34 = (float *)a4;
  RetainArray(self->_retainedObjects, (id *)a3, a6.length);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  uint64_t v10 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v35);
  baseObject = self->_baseObject;
  uint64_t v12 = 8 * length;
  __chkstk_darwin(v10, v13);
  bzero((char *)&location - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    NSUInteger v14 = a3;
    long long v15 = (NSUInteger *)((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v16 = length;
    do
    {
      char v17 = (void *)*v14++;
      *v15++ = objc_msgSend(v17, "baseObject", location);
      --v16;
    }
    while (v16);
  }
  NSUInteger v18 = location;
  uint64_t v19 = (float *)a5;
  -[MTLRenderCommandEncoderSPI setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:](baseObject, "setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:", (char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v34, a5, location, length, location);
  uint64_t v20 = v36;
  *(_DWORD *)(v36 + 8) = -16084;
  char v21 = BYTE9(v37);
  if (BYTE9(v37) > 0x20uLL)
  {
    uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 24);
    uint64_t v24 = BYTE10(v37);
    ++BYTE10(v37);
    uint64_t v22 = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v36 + 1), v24 | 0x2000000000) + 16;
    char v21 = v24;
  }
  else
  {
    uint64_t v22 = (char *)(v20 + BYTE9(v37));
    BYTE9(v37) += 32;
  }
  *(unsigned char *)(v20 + 13) = v21;
  uint64_t v25 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v25, v26);
  bzero((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v28 = StreamArray((uint64_t)&v35, (NSUInteger *)((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  char v29 = GTTraceEncoder_storeBytes((uint64_t)&v35, v34, 4 * length);
  char v30 = GTTraceEncoder_storeBytes((uint64_t)&v35, v19, 4 * length);
  *(void *)uint64_t v22 = var0;
  *((void *)v22 + 1) = v18;
  *((void *)v22 + 2) = length;
  v22[24] = v28;
  v22[25] = v29;
  v22[26] = v30;
  *(_DWORD *)(v22 + 27) = 0;
  v22[31] = 0;
  s();
  *(void *)uint64_t v31 = v32;
  *(unsigned char *)(v31 + 8) = BYTE8(v37);
  *(unsigned char *)(v36 + 15) |= 8u;
}

- (void)setTileSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v10 = a3;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v10];
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v13 = [v10 baseObject];
  *(float *)&double v14 = a4;
  *(float *)&double v15 = a5;
  [(MTLRenderCommandEncoderSPI *)baseObject setTileSamplerState:v13 lodMinClamp:a6 lodMaxClamp:v14 atIndex:v15];

  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16138;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    NSUInteger v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    NSUInteger v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  char v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v23 = (uint64_t *)[v10 traceStream];
  if (v23) {
    uint64_t v24 = *v23;
  }
  else {
    uint64_t v24 = 0;
  }
  *(void *)NSUInteger v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a6;
  *((float *)v18 + 6) = a4;
  *((float *)v18 + 7) = a5;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setTileSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setTileSamplerState:v9 atIndex:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16139;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  double v15 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setTileIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  uint64_t v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  bzero((char *)&v27 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = (void *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v14 = length;
    do
    {
      double v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  -[MTLRenderCommandEncoderSPI setTileIntersectionFunctionTables:withBufferRange:](baseObject, "setTileIntersectionFunctionTables:withBufferRange:", (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15452;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  long long v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v21, v22);
  bzero((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v24 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setTileIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setTileIntersectionFunctionTable:v9 atBufferIndex:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15453;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  double v15 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setTileBytes:a3 length:a4 atIndex:a5];
  uint64_t v9 = v20;
  *(_DWORD *)(v20 + 8) = -16143;
  char v10 = BYTE9(v21);
  if (BYTE9(v21) > 0x20uLL)
  {
    uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v13 = BYTE10(v21);
    ++BYTE10(v21);
    char v11 = GTTraceMemPool_allocateBytes(v12, *((uint64_t *)&v20 + 1), v13 | 0x2000000000) + 16;
    char v10 = v13;
  }
  else
  {
    char v11 = (char *)(v9 + BYTE9(v21));
    BYTE9(v21) += 32;
  }
  *(unsigned char *)(v9 + 13) = v10;
  uint64_t v14 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v16 = GTTraceEncoder_storeBlob((uint64_t)&v19, a3, a4);
  }
  else {
    char v16 = 0;
  }
  *(void *)char v11 = var0;
  *((void *)v11 + 1) = a4;
  *((void *)v11 + 2) = a5;
  v11[24] = v16;
  *(_DWORD *)(v11 + 25) = 0;
  *((_DWORD *)v11 + 7) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  RetainArray(self->_retainedObjects, (id *)a3, a5.length);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  uint64_t v9 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v34);
  baseObject = self->_baseObject;
  uint64_t v11 = 8 * length;
  __chkstk_darwin(v9, v12);
  bzero((char *)&v32 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v13 = a3;
    uint64_t v14 = (uint64_t *)((char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v15 = length;
    do
    {
      char v16 = (void *)*v13++;
      *v14++ = [v16 baseObject];
      --v15;
    }
    while (v15);
  }
  uint64_t v17 = a4;
  uint64_t v18 = a4;
  NSUInteger v19 = location;
  -[MTLRenderCommandEncoderSPI setTileBuffers:offsets:withRange:](baseObject, "setTileBuffers:offsets:withRange:", (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v18, location, length);
  uint64_t v20 = v35;
  *(_DWORD *)(v35 + 8) = -16087;
  char v21 = BYTE9(v36);
  if (BYTE9(v36) > 0x20uLL)
  {
    uint64_t v23 = *(void *)(*((void *)&v34 + 1) + 24);
    uint64_t v24 = BYTE10(v36);
    ++BYTE10(v36);
    long long v22 = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v35 + 1), v24 | 0x2000000000) + 16;
    char v21 = v24;
  }
  else
  {
    long long v22 = (char *)(v20 + BYTE9(v36));
    BYTE9(v36) += 32;
  }
  *(unsigned char *)(v20 + 13) = v21;
  uint64_t v25 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v25, v26);
  bzero((char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v28 = StreamArray((uint64_t)&v34, (uint64_t *)((char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v29 = GTTraceEncoder_storeBlob((uint64_t)&v34, v17, length);
  }
  else {
    char v29 = 0;
  }
  *(void *)long long v22 = var0;
  *((void *)v22 + 1) = v19;
  *((void *)v22 + 2) = length;
  v22[24] = v28;
  v22[25] = v29;
  *(_DWORD *)(v22 + 26) = 0;
  *((_WORD *)v22 + 15) = 0;
  s();
  *(void *)uint64_t v30 = v31;
  *(unsigned char *)(v30 + 8) = BYTE8(v36);
  *(unsigned char *)(v35 + 15) |= 8u;
}

- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setTileBufferOffset:a3 atIndex:a4];
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16141;
  char v8 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v11 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v17 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
}

- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  uint64_t v11 = [v8 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setTileBuffer:v11 offset:a4 atIndex:a5];

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -16142;
  char v13 = BYTE9(v25);
  if (BYTE9(v25) > 0x20uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v16 = BYTE10(v25);
    ++BYTE10(v25);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x2000000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v25));
    BYTE9(v25) += 32;
  }
  *(unsigned char *)(v12 + 13) = v13;
  long long v17 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  NSUInteger v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v18);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setThreadgroupMemoryLength:a3 offset:a4 atIndex:a5];
  uint64_t v9 = v19;
  *(_DWORD *)(v19 + 8) = -16074;
  char v10 = BYTE9(v20);
  if (BYTE9(v20) > 0x20uLL)
  {
    uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 24);
    uint64_t v13 = BYTE10(v20);
    ++BYTE10(v20);
    uint64_t v11 = GTTraceMemPool_allocateBytes(v12, *((uint64_t *)&v19 + 1), v13 | 0x2000000000) + 16;
    char v10 = v13;
  }
  else
  {
    uint64_t v11 = (char *)(v9 + BYTE9(v20));
    BYTE9(v20) += 32;
  }
  *(unsigned char *)(v9 + 13) = v10;
  uint64_t v14 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v11 = var0;
  *((void *)v11 + 1) = a3;
  *((void *)v11 + 2) = a4;
  *((void *)v11 + 3) = a5;
  s();
  *(void *)uint64_t v16 = v17;
  *(unsigned char *)(v16 + 8) = BYTE8(v20);
  *(unsigned char *)(v19 + 15) |= 8u;
}

- (void)setTessellationFactorScale:(float)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v15);
  *(float *)&double v5 = a3;
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setTessellationFactorScale:v5];
  uint64_t v6 = v16;
  *(_DWORD *)(v16 + 8) = -16132;
  char v7 = BYTE9(v17);
  if (BYTE9(v17) > 0x30uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 24);
    uint64_t v10 = BYTE10(v17);
    ++BYTE10(v17);
    id v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v16 + 1), v10 | 0x1000000000) + 16;
    char v7 = v10;
  }
  else
  {
    id v8 = (char *)(v6 + BYTE9(v17));
    BYTE9(v17) += 16;
  }
  *(unsigned char *)(v6 + 13) = v7;
  uint64_t v11 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)id v8 = var0;
  *((float *)v8 + 2) = a3;
  *((_DWORD *)v8 + 3) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v17);
  *(unsigned char *)(v16 + 15) |= 8u;
}

- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5
{
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  uint64_t v11 = [v8 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setTessellationFactorBuffer:v11 offset:a4 instanceStride:a5];

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -16148;
  char v13 = BYTE9(v25);
  if (BYTE9(v25) > 0x20uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v16 = BYTE10(v25);
    ++BYTE10(v25);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x2000000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v25));
    BYTE9(v25) += 32;
  }
  *(unsigned char *)(v12 + 13) = v13;
  long long v17 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
}

- (void)setStencilStoreActionOptions:(unint64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setStencilStoreActionOptions:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16020;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    char v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    char v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)char v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setStencilStoreAction:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16157;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    char v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    char v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)char v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  [v12 touch];
  if (v12)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v12];
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  long long v15 = [v12 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setStencilResolveTexture:v15 slice:a4 depthPlane:a5 level:a6 yInvert:v7];

  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15722;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x10uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    long long v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x3000000000) + 16;
    char v17 = v20;
  }
  else
  {
    long long v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 48;
  }
  *(unsigned char *)(v16 + 13) = v17;
  uint64_t v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v23 = (uint64_t *)[v12 traceStream];
  if (v23) {
    uint64_t v24 = *v23;
  }
  else {
    uint64_t v24 = 0;
  }
  *(void *)long long v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  *((void *)v18 + 3) = a5;
  *((void *)v18 + 4) = a6;
  *((_DWORD *)v18 + 10) = v7;
  *((_DWORD *)v18 + 11) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6
{
  id v10 = a3;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v10];
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v25);
  baseObject = self->_baseObject;
  uint64_t v13 = [v10 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setStencilResolveTexture:v13 slice:a4 depthPlane:a5 level:a6];

  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15723;
  char v15 = BYTE9(v27);
  if (BYTE9(v27) > 0x18uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v18 = BYTE10(v27);
    ++BYTE10(v27);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x2800000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v27));
    BYTE9(v27) += 40;
  }
  *(unsigned char *)(v14 + 13) = v15;
  uint64_t v19 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v21 = (uint64_t *)[v10 traceStream];
  if (v21) {
    uint64_t v22 = *v21;
  }
  else {
    uint64_t v22 = 0;
  }
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a4;
  *((void *)v16 + 3) = a5;
  *((void *)v16 + 4) = a6;
  s();
  *(void *)uint64_t v23 = v24;
  *(unsigned char *)(v23 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;
}

- (void)setStencilReferenceValue:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setStencilReferenceValue:v3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16253;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    BOOL v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    BOOL v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  id v10 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)BOOL v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setStencilFrontReferenceValue:v5 backReferenceValue:v4];
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16219;
  char v8 = BYTE9(v18);
  if (BYTE9(v18) > 0x30uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v11 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v17 + 1), v11 | 0x1000000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v18));
    BYTE9(v18) += 16;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v9 = var0;
  *((_DWORD *)v9 + 2) = v5;
  *((_DWORD *)v9 + 3) = v4;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
}

- (void)setStencilCleared
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setStencilCleared];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15724;
  char v4 = BYTE9(v14);
  if (BYTE9(v14) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 24);
    uint64_t v7 = BYTE10(v14);
    ++BYTE10(v14);
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v13 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    uint64_t v5 = (char *)(v3 + BYTE9(v14));
    BYTE9(v14) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  char v8 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v14);
  *(unsigned char *)(v13 + 15) |= 8u;
}

- (void)setScissorRect:(id *)a3
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v18);
  baseObject = self->_baseObject;
  long long v6 = *(_OWORD *)&a3->var2;
  v17[0] = *(_OWORD *)&a3->var0;
  v17[1] = v6;
  [(MTLRenderCommandEncoderSPI *)baseObject setScissorRect:v17];
  uint64_t v7 = v19;
  *(_DWORD *)(v19 + 8) = -16265;
  char v8 = BYTE9(v20);
  if (BYTE9(v20) > 0x18uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 24);
    uint64_t v11 = BYTE10(v20);
    ++BYTE10(v20);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v19 + 1), v11 | 0x2800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v20));
    BYTE9(v20) += 40;
  }
  *(unsigned char *)(v7 + 13) = v8;
  long long v12 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v9 = var0;
  long long v14 = *(_OWORD *)&a3->var2;
  *(_OWORD *)(v9 + 8) = *(_OWORD *)&a3->var0;
  *(_OWORD *)(v9 + 24) = v14;
  s();
  *(void *)uint64_t v15 = v16;
  *(unsigned char *)(v15 + 8) = BYTE8(v20);
  *(unsigned char *)(v19 + 15) |= 8u;
}

- (void)setRenderPipelineState:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v4];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  baseObject = self->_baseObject;
  uint64_t v7 = [v4 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setRenderPipelineState:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16279;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  long long v13 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)setProvokingVertexMode:(unint64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setProvokingVertexMode:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15725;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    uint64_t v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (void)setPrimitiveRestartEnabled:(BOOL)a3 index:(unint64_t)a4
{
  BOOL v5 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setPrimitiveRestartEnabled:v5 index:a4];
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -15984;
  char v8 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v11 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v17 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a4;
  *((_DWORD *)v9 + 4) = v5;
  *((_DWORD *)v9 + 5) = 0;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
}

- (void)setPrimitiveRestartEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setPrimitiveRestartEnabled:v3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15970;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    uint64_t v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (void)setPointSize:(float)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v15);
  *(float *)&double v5 = a3;
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setPointSize:v5];
  uint64_t v6 = v16;
  *(_DWORD *)(v16 + 8) = -15988;
  char v7 = BYTE9(v17);
  if (BYTE9(v17) > 0x30uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 24);
    uint64_t v10 = BYTE10(v17);
    ++BYTE10(v17);
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v16 + 1), v10 | 0x1000000000) + 16;
    char v7 = v10;
  }
  else
  {
    uint64_t v8 = (char *)(v6 + BYTE9(v17));
    BYTE9(v17) += 16;
  }
  *(unsigned char *)(v6 + 13) = v7;
  uint64_t v11 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v8 = var0;
  *((float *)v8 + 2) = a3;
  *((_DWORD *)v8 + 3) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v17);
  *(unsigned char *)(v16 + 15) |= 8u;
}

- (void)setObjectVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderCommandEncoder_setObjectVisibleFunctionTables_withBufferRange", (uint64_t)"Mesh shaders with Function Pointers", 0, 0);
  RetainArray(self->_retainedObjects, (id *)a3, length);
  baseObject = self->_baseObject;
  __chkstk_darwin(v9, 8 * length);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v11, v10);
  if (length)
  {
    uint64_t v12 = v11;
    NSUInteger v13 = length;
    do
    {
      uint64_t v14 = (void *)*a3++;
      *(void *)uint64_t v12 = [v14 baseObject];
      v12 += 8;
      --v13;
    }
    while (v13);
  }
  -[MTLRenderCommandEncoderSPI setObjectVisibleFunctionTables:withBufferRange:](baseObject, "setObjectVisibleFunctionTables:withBufferRange:", v11, location, length);
}

- (void)setObjectVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v10 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderCommandEncoder_setObjectVisibleFunctionTable_atBufferIndex", (uint64_t)"Mesh shaders with Function Pointers", 0, 0);
  [v10 touch];
  uint64_t v6 = v10;
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      [(NSMutableSet *)retainedObjects addObject:v10];
      uint64_t v6 = v10;
    }
  }
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setObjectVisibleFunctionTable:v9 atBufferIndex:a4];
}

- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setObjectThreadgroupMemoryLength:a3 atIndex:a4];
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -15381;
  char v8 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v11 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v17 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
}

- (void)setObjectTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  char v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  bzero((char *)&v27 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v12 = a3;
    NSUInteger v13 = (void *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v14 = length;
    do
    {
      uint64_t v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  -[MTLRenderCommandEncoderSPI setObjectTextures:withRange:](baseObject, "setObjectTextures:withRange:", (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15382;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    long long v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    long long v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  long long v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v21, v22);
  bzero((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v24 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  *(void *)long long v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setObjectTexture:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setObjectTexture:v9 atIndex:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15383;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  uint64_t v15 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setObjectSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  char v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  bzero((char *)&v27 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = (void *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v14 = length;
    do
    {
      uint64_t v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  -[MTLRenderCommandEncoderSPI setObjectSamplerStates:withRange:](baseObject, "setObjectSamplerStates:withRange:", (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15384;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  long long v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v21, v22);
  bzero((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v24 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setObjectSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  long long v35 = a4;
  RetainArray(self->_retainedObjects, (id *)a3, a6.length);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  uint64_t v10 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v36);
  baseObject = self->_baseObject;
  uint64_t v12 = 8 * length;
  __chkstk_darwin(v10, v13);
  bzero((char *)&location - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    NSUInteger v14 = a3;
    uint64_t v15 = (NSUInteger *)((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v16 = length;
    do
    {
      char v17 = (void *)*v14++;
      *v15++ = objc_msgSend(v17, "baseObject", location);
      --v16;
    }
    while (v16);
  }
  NSUInteger v18 = location;
  uint64_t v19 = a5;
  -[MTLRenderCommandEncoderSPI setObjectSamplerStates:lodMinClamps:lodMaxClamps:withRange:](baseObject, "setObjectSamplerStates:lodMinClamps:lodMaxClamps:withRange:", (char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v35, a5, location, length, location);
  uint64_t v20 = v37;
  *(_DWORD *)(v37 + 8) = -15385;
  char v21 = BYTE9(v38);
  if (BYTE9(v38) > 0x20uLL)
  {
    uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 24);
    uint64_t v24 = BYTE10(v38);
    ++BYTE10(v38);
    uint64_t v22 = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v37 + 1), v24 | 0x2000000000) + 16;
    char v21 = v24;
  }
  else
  {
    uint64_t v22 = (char *)(v20 + BYTE9(v38));
    BYTE9(v38) += 32;
  }
  *(unsigned char *)(v20 + 13) = v21;
  uint64_t v25 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v25, v26);
  bzero((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v28 = StreamArray((uint64_t)&v36, (NSUInteger *)((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  uint64_t v29 = boundaryTrackerInstance;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    char v30 = GTTraceEncoder_storeBlob((uint64_t)&v36, v35, length);
    uint64_t v29 = boundaryTrackerInstance;
  }
  else
  {
    char v30 = 0;
  }
  if ((*(_DWORD *)(v29 + 20) & 0xFFFFFFFE) == 2) {
    char v31 = GTTraceEncoder_storeBlob((uint64_t)&v36, v19, length);
  }
  else {
    char v31 = 0;
  }
  *(void *)uint64_t v22 = var0;
  *((void *)v22 + 1) = v18;
  *((void *)v22 + 2) = length;
  v22[24] = v28;
  v22[25] = v30;
  v22[26] = v31;
  *(_DWORD *)(v22 + 27) = 0;
  v22[31] = 0;
  s();
  *(void *)uint64_t v32 = v33;
  *(unsigned char *)(v32 + 8) = BYTE8(v38);
  *(unsigned char *)(v37 + 15) |= 8u;
}

- (void)setObjectSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v10 = a3;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v10];
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v13 = [v10 baseObject];
  *(float *)&double v14 = a4;
  *(float *)&double v15 = a5;
  [(MTLRenderCommandEncoderSPI *)baseObject setObjectSamplerState:v13 lodMinClamp:a6 lodMaxClamp:v14 atIndex:v15];

  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15386;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    NSUInteger v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    NSUInteger v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  char v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v23 = (uint64_t *)[v10 traceStream];
  if (v23) {
    uint64_t v24 = *v23;
  }
  else {
    uint64_t v24 = 0;
  }
  *(void *)NSUInteger v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a6;
  *((float *)v18 + 6) = a4;
  *((float *)v18 + 7) = a5;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setObjectSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setObjectSamplerState:v9 atIndex:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15387;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  double v15 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setObjectIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderCommandEncoder_setObjectIntersectionFunctionTables_withBufferRange", (uint64_t)"Mesh shaders with Raytracing", 0, 0);
  RetainArray(self->_retainedObjects, (id *)a3, length);
  baseObject = self->_baseObject;
  __chkstk_darwin(v9, 8 * length);
  char v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v11, v10);
  if (length)
  {
    uint64_t v12 = v11;
    NSUInteger v13 = length;
    do
    {
      uint64_t v14 = (void *)*a3++;
      *(void *)uint64_t v12 = [v14 baseObject];
      v12 += 8;
      --v13;
    }
    while (v13);
  }
  -[MTLRenderCommandEncoderSPI setObjectIntersectionFunctionTables:withBufferRange:](baseObject, "setObjectIntersectionFunctionTables:withBufferRange:", v11, location, length);
}

- (void)setObjectIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v10 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderCommandEncoder_setObjectIntersectionFunctionTable_atBufferIndex", (uint64_t)"Mesh shaders with Raytracing", 0, 0);
  [v10 touch];
  id v6 = v10;
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      [(NSMutableSet *)retainedObjects addObject:v10];
      id v6 = v10;
    }
  }
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setObjectIntersectionFunctionTable:v9 atBufferIndex:a4];
}

- (void)setObjectBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setObjectBytes:a3 length:a4 atIndex:a5];
  uint64_t v9 = v20;
  *(_DWORD *)(v20 + 8) = -15388;
  char v10 = BYTE9(v21);
  if (BYTE9(v21) > 0x20uLL)
  {
    uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v13 = BYTE10(v21);
    ++BYTE10(v21);
    char v11 = GTTraceMemPool_allocateBytes(v12, *((uint64_t *)&v20 + 1), v13 | 0x2000000000) + 16;
    char v10 = v13;
  }
  else
  {
    char v11 = (char *)(v9 + BYTE9(v21));
    BYTE9(v21) += 32;
  }
  *(unsigned char *)(v9 + 13) = v10;
  uint64_t v14 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v16 = GTTraceEncoder_storeBlob((uint64_t)&v19, a3, a4);
  }
  else {
    char v16 = 0;
  }
  *(void *)char v11 = var0;
  *((void *)v11 + 1) = a4;
  *((void *)v11 + 2) = a5;
  v11[24] = v16;
  *(_DWORD *)(v11 + 25) = 0;
  *((_DWORD *)v11 + 7) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)setObjectBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  RetainArray(self->_retainedObjects, (id *)a3, a5.length);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  uint64_t v9 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v34);
  baseObject = self->_baseObject;
  uint64_t v11 = 8 * length;
  __chkstk_darwin(v9, v12);
  bzero((char *)&v32 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v13 = a3;
    uint64_t v14 = (uint64_t *)((char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v15 = length;
    do
    {
      char v16 = (void *)*v13++;
      *v14++ = [v16 baseObject];
      --v15;
    }
    while (v15);
  }
  uint64_t v17 = a4;
  uint64_t v18 = a4;
  NSUInteger v19 = location;
  -[MTLRenderCommandEncoderSPI setObjectBuffers:offsets:withRange:](baseObject, "setObjectBuffers:offsets:withRange:", (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v18, location, length);
  uint64_t v20 = v35;
  *(_DWORD *)(v35 + 8) = -15389;
  char v21 = BYTE9(v36);
  if (BYTE9(v36) > 0x20uLL)
  {
    uint64_t v23 = *(void *)(*((void *)&v34 + 1) + 24);
    uint64_t v24 = BYTE10(v36);
    ++BYTE10(v36);
    long long v22 = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v35 + 1), v24 | 0x2000000000) + 16;
    char v21 = v24;
  }
  else
  {
    long long v22 = (char *)(v20 + BYTE9(v36));
    BYTE9(v36) += 32;
  }
  *(unsigned char *)(v20 + 13) = v21;
  uint64_t v25 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v25, v26);
  bzero((char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v28 = StreamArray((uint64_t)&v34, (uint64_t *)((char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v29 = GTTraceEncoder_storeBlob((uint64_t)&v34, v17, length);
  }
  else {
    char v29 = 0;
  }
  *(void *)long long v22 = var0;
  *((void *)v22 + 1) = v19;
  *((void *)v22 + 2) = length;
  v22[24] = v28;
  v22[25] = v29;
  *(_DWORD *)(v22 + 26) = 0;
  *((_WORD *)v22 + 15) = 0;
  s();
  *(void *)uint64_t v30 = v31;
  *(unsigned char *)(v30 + 8) = BYTE8(v36);
  *(unsigned char *)(v35 + 15) |= 8u;
}

- (void)setObjectBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setObjectBufferOffset:a3 atIndex:a4];
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -15390;
  char v8 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v11 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v17 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  uint64_t v11 = [v8 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setObjectBuffer:v11 offset:a4 atIndex:a5];

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15391;
  char v13 = BYTE9(v25);
  if (BYTE9(v25) > 0x20uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v16 = BYTE10(v25);
    ++BYTE10(v25);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x2000000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v25));
    BYTE9(v25) += 32;
  }
  *(unsigned char *)(v12 + 13) = v13;
  long long v17 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  NSUInteger v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
}

- (void)setObjectAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v10 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderCommandEncoder_setObjectAccelerationStructure_atBufferIndex", (uint64_t)"Mesh shaders with Raytracing", 0, 0);
  [v10 touch];
  id v6 = v10;
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      [(NSMutableSet *)retainedObjects addObject:v10];
      id v6 = v10;
    }
  }
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setObjectAccelerationStructure:v9 atBufferIndex:a4];
}

- (void)setMeshVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderCommandEncoder_setMeshVisibleFunctionTables_withBufferRange", (uint64_t)"Mesh shaders with Function Pointers", 0, 0);
  RetainArray(self->_retainedObjects, (id *)a3, length);
  baseObject = self->_baseObject;
  __chkstk_darwin(v9, 8 * length);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v11, v10);
  if (length)
  {
    uint64_t v12 = v11;
    NSUInteger v13 = length;
    do
    {
      uint64_t v14 = (void *)*a3++;
      *(void *)uint64_t v12 = [v14 baseObject];
      v12 += 8;
      --v13;
    }
    while (v13);
  }
  -[MTLRenderCommandEncoderSPI setMeshVisibleFunctionTables:withBufferRange:](baseObject, "setMeshVisibleFunctionTables:withBufferRange:", v11, location, length);
}

- (void)setMeshVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v10 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderCommandEncoder_setMeshVisibleFunctionTable_atBufferIndex", (uint64_t)"Mesh shaders with Function Pointers", 0, 0);
  [v10 touch];
  id v6 = v10;
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      [(NSMutableSet *)retainedObjects addObject:v10];
      id v6 = v10;
    }
  }
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setMeshVisibleFunctionTable:v9 atBufferIndex:a4];
}

- (void)setMeshTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  id v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  bzero((char *)&v27 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v12 = a3;
    NSUInteger v13 = (void *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v14 = length;
    do
    {
      uint64_t v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  -[MTLRenderCommandEncoderSPI setMeshTextures:withRange:](baseObject, "setMeshTextures:withRange:", (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15392;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    long long v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    long long v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  uint64_t v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v21, v22);
  bzero((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v24 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  *(void *)long long v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setMeshTexture:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setMeshTexture:v9 atIndex:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15393;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  uint64_t v15 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setMeshSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  id v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  bzero((char *)&v27 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = (void *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v14 = length;
    do
    {
      uint64_t v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  -[MTLRenderCommandEncoderSPI setMeshSamplerStates:withRange:](baseObject, "setMeshSamplerStates:withRange:", (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15394;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  long long v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v21, v22);
  bzero((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v24 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setMeshSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  long long v35 = a4;
  RetainArray(self->_retainedObjects, (id *)a3, a6.length);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  uint64_t v10 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v36);
  baseObject = self->_baseObject;
  uint64_t v12 = 8 * length;
  __chkstk_darwin(v10, v13);
  bzero((char *)&location - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    NSUInteger v14 = a3;
    uint64_t v15 = (NSUInteger *)((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v16 = length;
    do
    {
      char v17 = (void *)*v14++;
      *v15++ = objc_msgSend(v17, "baseObject", location);
      --v16;
    }
    while (v16);
  }
  NSUInteger v18 = location;
  uint64_t v19 = a5;
  -[MTLRenderCommandEncoderSPI setMeshSamplerStates:lodMinClamps:lodMaxClamps:withRange:](baseObject, "setMeshSamplerStates:lodMinClamps:lodMaxClamps:withRange:", (char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v35, a5, location, length, location);
  uint64_t v20 = v37;
  *(_DWORD *)(v37 + 8) = -15395;
  char v21 = BYTE9(v38);
  if (BYTE9(v38) > 0x20uLL)
  {
    uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 24);
    uint64_t v24 = BYTE10(v38);
    ++BYTE10(v38);
    uint64_t v22 = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v37 + 1), v24 | 0x2000000000) + 16;
    char v21 = v24;
  }
  else
  {
    uint64_t v22 = (char *)(v20 + BYTE9(v38));
    BYTE9(v38) += 32;
  }
  *(unsigned char *)(v20 + 13) = v21;
  uint64_t v25 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v25, v26);
  bzero((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v28 = StreamArray((uint64_t)&v36, (NSUInteger *)((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  uint64_t v29 = boundaryTrackerInstance;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    char v30 = GTTraceEncoder_storeBlob((uint64_t)&v36, v35, length);
    uint64_t v29 = boundaryTrackerInstance;
  }
  else
  {
    char v30 = 0;
  }
  if ((*(_DWORD *)(v29 + 20) & 0xFFFFFFFE) == 2) {
    char v31 = GTTraceEncoder_storeBlob((uint64_t)&v36, v19, length);
  }
  else {
    char v31 = 0;
  }
  *(void *)uint64_t v22 = var0;
  *((void *)v22 + 1) = v18;
  *((void *)v22 + 2) = length;
  v22[24] = v28;
  v22[25] = v30;
  v22[26] = v31;
  *(_DWORD *)(v22 + 27) = 0;
  v22[31] = 0;
  s();
  *(void *)uint64_t v32 = v33;
  *(unsigned char *)(v32 + 8) = BYTE8(v38);
  *(unsigned char *)(v37 + 15) |= 8u;
}

- (void)setMeshSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v10 = a3;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v10];
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v13 = [v10 baseObject];
  *(float *)&double v14 = a4;
  *(float *)&double v15 = a5;
  [(MTLRenderCommandEncoderSPI *)baseObject setMeshSamplerState:v13 lodMinClamp:a6 lodMaxClamp:v14 atIndex:v15];

  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15396;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    NSUInteger v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    NSUInteger v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  char v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v23 = (uint64_t *)[v10 traceStream];
  if (v23) {
    uint64_t v24 = *v23;
  }
  else {
    uint64_t v24 = 0;
  }
  *(void *)NSUInteger v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a6;
  *((float *)v18 + 6) = a4;
  *((float *)v18 + 7) = a5;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setMeshSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setMeshSamplerState:v9 atIndex:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15397;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  double v15 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setMeshIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderCommandEncoder_setMeshIntersectionFunctionTables_withBufferRange", (uint64_t)"Mesh shaders with Raytracing", 0, 0);
  RetainArray(self->_retainedObjects, (id *)a3, length);
  baseObject = self->_baseObject;
  __chkstk_darwin(v9, 8 * length);
  char v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v11, v10);
  if (length)
  {
    uint64_t v12 = v11;
    NSUInteger v13 = length;
    do
    {
      uint64_t v14 = (void *)*a3++;
      *(void *)uint64_t v12 = [v14 baseObject];
      v12 += 8;
      --v13;
    }
    while (v13);
  }
  -[MTLRenderCommandEncoderSPI setMeshIntersectionFunctionTables:withBufferRange:](baseObject, "setMeshIntersectionFunctionTables:withBufferRange:", v11, location, length);
}

- (void)setMeshIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v10 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderCommandEncoder_setMeshIntersectionFunctionTable_atBufferIndex", (uint64_t)"Mesh shaders with Raytracing", 0, 0);
  [v10 touch];
  id v6 = v10;
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      [(NSMutableSet *)retainedObjects addObject:v10];
      id v6 = v10;
    }
  }
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setMeshIntersectionFunctionTable:v9 atBufferIndex:a4];
}

- (void)setMeshBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setMeshBytes:a3 length:a4 atIndex:a5];
  uint64_t v9 = v20;
  *(_DWORD *)(v20 + 8) = -15398;
  char v10 = BYTE9(v21);
  if (BYTE9(v21) > 0x20uLL)
  {
    uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v13 = BYTE10(v21);
    ++BYTE10(v21);
    char v11 = GTTraceMemPool_allocateBytes(v12, *((uint64_t *)&v20 + 1), v13 | 0x2000000000) + 16;
    char v10 = v13;
  }
  else
  {
    char v11 = (char *)(v9 + BYTE9(v21));
    BYTE9(v21) += 32;
  }
  *(unsigned char *)(v9 + 13) = v10;
  uint64_t v14 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v16 = GTTraceEncoder_storeBlob((uint64_t)&v19, a3, a4);
  }
  else {
    char v16 = 0;
  }
  *(void *)char v11 = var0;
  *((void *)v11 + 1) = a4;
  *((void *)v11 + 2) = a5;
  v11[24] = v16;
  *(_DWORD *)(v11 + 25) = 0;
  *((_DWORD *)v11 + 7) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)setMeshBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  RetainArray(self->_retainedObjects, (id *)a3, a5.length);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  uint64_t v9 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v34);
  baseObject = self->_baseObject;
  uint64_t v11 = 8 * length;
  __chkstk_darwin(v9, v12);
  bzero((char *)&v32 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v13 = a3;
    uint64_t v14 = (uint64_t *)((char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v15 = length;
    do
    {
      char v16 = (void *)*v13++;
      *v14++ = [v16 baseObject];
      --v15;
    }
    while (v15);
  }
  uint64_t v17 = a4;
  uint64_t v18 = a4;
  NSUInteger v19 = location;
  -[MTLRenderCommandEncoderSPI setMeshBuffers:offsets:withRange:](baseObject, "setMeshBuffers:offsets:withRange:", (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v18, location, length);
  uint64_t v20 = v35;
  *(_DWORD *)(v35 + 8) = -15399;
  char v21 = BYTE9(v36);
  if (BYTE9(v36) > 0x20uLL)
  {
    uint64_t v23 = *(void *)(*((void *)&v34 + 1) + 24);
    uint64_t v24 = BYTE10(v36);
    ++BYTE10(v36);
    long long v22 = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v35 + 1), v24 | 0x2000000000) + 16;
    char v21 = v24;
  }
  else
  {
    long long v22 = (char *)(v20 + BYTE9(v36));
    BYTE9(v36) += 32;
  }
  *(unsigned char *)(v20 + 13) = v21;
  uint64_t v25 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v25, v26);
  bzero((char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v28 = StreamArray((uint64_t)&v34, (uint64_t *)((char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v29 = GTTraceEncoder_storeBlob((uint64_t)&v34, v17, length);
  }
  else {
    char v29 = 0;
  }
  *(void *)long long v22 = var0;
  *((void *)v22 + 1) = v19;
  *((void *)v22 + 2) = length;
  v22[24] = v28;
  v22[25] = v29;
  *(_DWORD *)(v22 + 26) = 0;
  *((_WORD *)v22 + 15) = 0;
  s();
  *(void *)uint64_t v30 = v31;
  *(unsigned char *)(v30 + 8) = BYTE8(v36);
  *(unsigned char *)(v35 + 15) |= 8u;
}

- (void)setMeshBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setMeshBufferOffset:a3 atIndex:a4];
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -15400;
  char v8 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v11 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v17 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  uint64_t v11 = [v8 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setMeshBuffer:v11 offset:a4 atIndex:a5];

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15401;
  char v13 = BYTE9(v25);
  if (BYTE9(v25) > 0x20uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v16 = BYTE10(v25);
    ++BYTE10(v25);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x2000000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v25));
    BYTE9(v25) += 32;
  }
  *(unsigned char *)(v12 + 13) = v13;
  long long v17 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  NSUInteger v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
}

- (void)setMeshAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v10 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderCommandEncoder_setMeshAccelerationStructure_atBufferIndex", (uint64_t)"Mesh shaders with Raytracing", 0, 0);
  [v10 touch];
  id v6 = v10;
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      [(NSMutableSet *)retainedObjects addObject:v10];
      id v6 = v10;
    }
  }
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setMeshAccelerationStructure:v9 atBufferIndex:a4];
}

- (void)setLineWidth:(float)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v15);
  *(float *)&double v5 = a3;
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setLineWidth:v5];
  uint64_t v6 = v16;
  *(_DWORD *)(v16 + 8) = -16247;
  char v7 = BYTE9(v17);
  if (BYTE9(v17) > 0x30uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 24);
    uint64_t v10 = BYTE10(v17);
    ++BYTE10(v17);
    id v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v16 + 1), v10 | 0x1000000000) + 16;
    char v7 = v10;
  }
  else
  {
    id v8 = (char *)(v6 + BYTE9(v17));
    BYTE9(v17) += 16;
  }
  *(unsigned char *)(v6 + 13) = v7;
  uint64_t v11 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)id v8 = var0;
  *((float *)v8 + 2) = a3;
  *((_DWORD *)v8 + 3) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v17);
  *(unsigned char *)(v16 + 15) |= 8u;
}

- (void)setFrontFacingWinding:(unint64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setFrontFacingWinding:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16269;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    char v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    char v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)char v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  uint64_t v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  bzero((char *)&v27 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = (void *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v14 = length;
    do
    {
      long long v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  -[MTLRenderCommandEncoderSPI setFragmentVisibleFunctionTables:withBufferRange:](baseObject, "setFragmentVisibleFunctionTables:withBufferRange:", (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15455;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    long long v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    long long v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  uint64_t v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v21, v22);
  bzero((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v24 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  *(void *)long long v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setFragmentVisibleFunctionTable:v9 atBufferIndex:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15456;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  long long v15 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  uint64_t v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  bzero((char *)&v27 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = (void *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v14 = length;
    do
    {
      long long v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  -[MTLRenderCommandEncoderSPI setFragmentTextures:withRange:](baseObject, "setFragmentTextures:withRange:", (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16260;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  long long v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v21, v22);
  bzero((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v24 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v10];
    }
  }
  [v11 touch];
  if (v11)
  {
    uint64_t v13 = self->_retainedObjects;
    if (v13) {
      [(NSMutableSet *)v13 addObject:v11];
    }
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v30);
  baseObject = self->_baseObject;
  long long v15 = [v10 baseObject];
  uint64_t v16 = [v11 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setFragmentTexture:v15 atTextureIndex:a4 samplerState:v16 atSamplerIndex:a6];

  uint64_t v17 = v31;
  *(_DWORD *)(v31 + 8) = -16214;
  char v18 = BYTE9(v32);
  if (BYTE9(v32) > 0x18uLL)
  {
    uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 24);
    uint64_t v21 = BYTE10(v32);
    ++BYTE10(v32);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, *((uint64_t *)&v31 + 1), v21 | 0x2800000000) + 16;
    char v18 = v21;
  }
  else
  {
    uint64_t v19 = (char *)(v17 + BYTE9(v32));
    BYTE9(v32) += 40;
  }
  *(unsigned char *)(v17 + 13) = v18;
  uint64_t v22 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v24 = (uint64_t *)[v10 traceStream];
  if (v24) {
    uint64_t v25 = *v24;
  }
  else {
    uint64_t v25 = 0;
  }
  uint64_t v26 = (uint64_t *)[v11 traceStream];
  if (v26) {
    uint64_t v27 = *v26;
  }
  else {
    uint64_t v27 = 0;
  }
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  *((void *)v19 + 2) = a4;
  *((void *)v19 + 3) = v27;
  *((void *)v19 + 4) = a6;
  s();
  *(void *)uint64_t v28 = v29;
  *(unsigned char *)(v28 + 8) = BYTE8(v32);
  *(unsigned char *)(v31 + 15) |= 8u;
}

- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setFragmentTexture:v9 atIndex:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16261;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  long long v15 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  uint64_t v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  bzero((char *)&v27 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = (void *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v14 = length;
    do
    {
      long long v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  -[MTLRenderCommandEncoderSPI setFragmentSamplerStates:withRange:](baseObject, "setFragmentSamplerStates:withRange:", (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16258;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  long long v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v21, v22);
  bzero((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v24 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  long long v34 = (float *)a4;
  RetainArray(self->_retainedObjects, (id *)a3, a6.length);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  uint64_t v10 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v35);
  baseObject = self->_baseObject;
  uint64_t v12 = 8 * length;
  __chkstk_darwin(v10, v13);
  bzero((char *)&location - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    NSUInteger v14 = a3;
    long long v15 = (NSUInteger *)((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v16 = length;
    do
    {
      char v17 = (void *)*v14++;
      *v15++ = objc_msgSend(v17, "baseObject", location);
      --v16;
    }
    while (v16);
  }
  NSUInteger v18 = location;
  uint64_t v19 = (float *)a5;
  -[MTLRenderCommandEncoderSPI setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:](baseObject, "setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:", (char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v34, a5, location, length, location);
  uint64_t v20 = v36;
  *(_DWORD *)(v36 + 8) = -16256;
  char v21 = BYTE9(v37);
  if (BYTE9(v37) > 0x20uLL)
  {
    uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 24);
    uint64_t v24 = BYTE10(v37);
    ++BYTE10(v37);
    uint64_t v22 = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v36 + 1), v24 | 0x2000000000) + 16;
    char v21 = v24;
  }
  else
  {
    uint64_t v22 = (char *)(v20 + BYTE9(v37));
    BYTE9(v37) += 32;
  }
  *(unsigned char *)(v20 + 13) = v21;
  uint64_t v25 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v25, v26);
  bzero((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v28 = StreamArray((uint64_t)&v35, (NSUInteger *)((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  char v29 = GTTraceEncoder_storeBytes((uint64_t)&v35, v34, 4 * length);
  char v30 = GTTraceEncoder_storeBytes((uint64_t)&v35, v19, 4 * length);
  *(void *)uint64_t v22 = var0;
  *((void *)v22 + 1) = v18;
  *((void *)v22 + 2) = length;
  v22[24] = v28;
  v22[25] = v29;
  v22[26] = v30;
  *(_DWORD *)(v22 + 27) = 0;
  v22[31] = 0;
  s();
  *(void *)uint64_t v31 = v32;
  *(unsigned char *)(v31 + 8) = BYTE8(v37);
  *(unsigned char *)(v36 + 15) |= 8u;
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 lodBias:(float)a6 atIndex:(unint64_t)a7
{
  id v19 = a3;
  [v19 touch];
  uint64_t v12 = v19;
  if (v19)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      [(NSMutableSet *)retainedObjects addObject:v19];
      uint64_t v12 = v19;
    }
  }
  baseObject = self->_baseObject;
  long long v15 = [v12 baseObject];
  *(float *)&double v16 = a4;
  *(float *)&double v17 = a5;
  *(float *)&double v18 = a6;
  [(MTLRenderCommandEncoderSPI *)baseObject setFragmentSamplerState:v15 lodMinClamp:a7 lodMaxClamp:v16 lodBias:v17 atIndex:v18];
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v10 = a3;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v10];
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v13 = [v10 baseObject];
  *(float *)&double v14 = a4;
  *(float *)&double v15 = a5;
  [(MTLRenderCommandEncoderSPI *)baseObject setFragmentSamplerState:v13 lodMinClamp:a6 lodMaxClamp:v14 atIndex:v15];

  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16257;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    double v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    double v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  char v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v23 = (uint64_t *)[v10 traceStream];
  if (v23) {
    uint64_t v24 = *v23;
  }
  else {
    uint64_t v24 = 0;
  }
  *(void *)double v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a6;
  *((float *)v18 + 6) = a4;
  *((float *)v18 + 7) = a5;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setFragmentSamplerState:v9 atIndex:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16259;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  double v15 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  uint64_t v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  bzero((char *)&v27 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = (void *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v14 = length;
    do
    {
      double v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  -[MTLRenderCommandEncoderSPI setFragmentIntersectionFunctionTables:withBufferRange:](baseObject, "setFragmentIntersectionFunctionTables:withBufferRange:", (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15457;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  long long v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v21, v22);
  bzero((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v24 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setFragmentIntersectionFunctionTable:v9 atBufferIndex:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15458;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  double v15 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setFragmentBytes:a3 length:a4 atIndex:a5];
  uint64_t v9 = v20;
  *(_DWORD *)(v20 + 8) = -16223;
  char v10 = BYTE9(v21);
  if (BYTE9(v21) > 0x20uLL)
  {
    uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v13 = BYTE10(v21);
    ++BYTE10(v21);
    char v11 = GTTraceMemPool_allocateBytes(v12, *((uint64_t *)&v20 + 1), v13 | 0x2000000000) + 16;
    char v10 = v13;
  }
  else
  {
    char v11 = (char *)(v9 + BYTE9(v21));
    BYTE9(v21) += 32;
  }
  *(unsigned char *)(v9 + 13) = v10;
  uint64_t v14 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v16 = GTTraceEncoder_storeBlob((uint64_t)&v19, a3, a4);
  }
  else {
    char v16 = 0;
  }
  *(void *)char v11 = var0;
  *((void *)v11 + 1) = a4;
  *((void *)v11 + 2) = a5;
  v11[24] = v16;
  *(_DWORD *)(v11 + 25) = 0;
  *((_DWORD *)v11 + 7) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  RetainArray(self->_retainedObjects, (id *)a3, a5.length);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  uint64_t v9 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v32);
  baseObject = self->_baseObject;
  uint64_t v11 = 8 * length;
  __chkstk_darwin(v9, v12);
  bzero((char *)&v30 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v13 = a3;
    uint64_t v14 = (uint64_t *)((char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v15 = length;
    do
    {
      char v16 = (void *)*v13++;
      *v14++ = [v16 baseObject];
      --v15;
    }
    while (v15);
  }
  NSUInteger v17 = location;
  -[MTLRenderCommandEncoderSPI setFragmentBuffers:offsets:withRange:](baseObject, "setFragmentBuffers:offsets:withRange:", (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a4, location, length);
  uint64_t v18 = v33;
  *(_DWORD *)(v33 + 8) = -16262;
  char v19 = BYTE9(v34);
  if (BYTE9(v34) > 0x20uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 24);
    uint64_t v22 = BYTE10(v34);
    ++BYTE10(v34);
    long long v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v33 + 1), v22 | 0x2000000000) + 16;
    char v19 = v22;
  }
  else
  {
    long long v20 = (char *)(v18 + BYTE9(v34));
    BYTE9(v34) += 32;
  }
  *(unsigned char *)(v18 + 13) = v19;
  long long v23 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v23, v24);
  bzero((char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v26 = StreamArray((uint64_t)&v32, (uint64_t *)((char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  char v27 = GTTraceEncoder_storeBytes((uint64_t)&v32, (void *)a4, 8 * length);
  *(void *)long long v20 = var0;
  *((void *)v20 + 1) = v17;
  *((void *)v20 + 2) = length;
  v20[24] = v26;
  v20[25] = v27;
  *(_DWORD *)(v20 + 26) = 0;
  *((_WORD *)v20 + 15) = 0;
  s();
  *(void *)uint64_t v28 = v29;
  *(unsigned char *)(v28 + 8) = BYTE8(v34);
  *(unsigned char *)(v33 + 15) |= 8u;
}

- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setFragmentBufferOffset:a3 atIndex:a4];
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16222;
  char v8 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v11 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v17 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  uint64_t v11 = [v8 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setFragmentBuffer:v11 offset:a4 atIndex:a5];

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -16263;
  char v13 = BYTE9(v25);
  if (BYTE9(v25) > 0x20uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v16 = BYTE10(v25);
    ++BYTE10(v25);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x2000000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v25));
    BYTE9(v25) += 32;
  }
  *(unsigned char *)(v12 + 13) = v13;
  long long v17 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
}

- (void)setDepthStoreActionOptions:(unint64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setDepthStoreActionOptions:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16021;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    uint64_t v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setDepthStoreAction:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16158;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    uint64_t v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (void)setDepthStencilState:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v4];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  baseObject = self->_baseObject;
  uint64_t v7 = [v4 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setDepthStencilState:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16254;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  uint64_t v13 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  [v12 touch];
  if (v12)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v12];
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  long long v15 = [v12 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setDepthResolveTexture:v15 slice:a4 depthPlane:a5 level:a6 yInvert:v7];

  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15726;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x10uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x3000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 48;
  }
  *(unsigned char *)(v16 + 13) = v17;
  long long v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v23 = (uint64_t *)[v12 traceStream];
  if (v23) {
    uint64_t v24 = *v23;
  }
  else {
    uint64_t v24 = 0;
  }
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  *((void *)v18 + 3) = a5;
  *((void *)v18 + 4) = a6;
  *((_DWORD *)v18 + 10) = v7;
  *((_DWORD *)v18 + 11) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6
{
  id v10 = a3;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v10];
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v25);
  baseObject = self->_baseObject;
  uint64_t v13 = [v10 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setDepthResolveTexture:v13 slice:a4 depthPlane:a5 level:a6];

  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -16155;
  char v15 = BYTE9(v27);
  if (BYTE9(v27) > 0x18uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v18 = BYTE10(v27);
    ++BYTE10(v27);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x2800000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v27));
    BYTE9(v27) += 40;
  }
  *(unsigned char *)(v14 + 13) = v15;
  uint64_t v19 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v21 = (uint64_t *)[v10 traceStream];
  if (v21) {
    uint64_t v22 = *v21;
  }
  else {
    uint64_t v22 = 0;
  }
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a4;
  *((void *)v16 + 3) = a5;
  *((void *)v16 + 4) = a6;
  s();
  *(void *)uint64_t v23 = v24;
  *(unsigned char *)(v23 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;
}

- (void)setDepthClipModeSPI:(unint64_t)a3
{
}

- (void)setDepthClipMode:(unint64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setDepthClipMode:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16267;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    BOOL v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    BOOL v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  id v10 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)BOOL v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (void)setDepthCleared
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setDepthCleared];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15727;
  char v4 = BYTE9(v14);
  if (BYTE9(v14) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 24);
    uint64_t v7 = BYTE10(v14);
    ++BYTE10(v14);
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v13 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    uint64_t v5 = (char *)(v3 + BYTE9(v14));
    BYTE9(v14) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v14);
  *(unsigned char *)(v13 + 15) |= 8u;
}

- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  *(float *)&double v9 = a3;
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setDepthBias:v9 slopeScale:v10 clamp:v11];
  uint64_t v12 = v22;
  *(_DWORD *)(v22 + 8) = -16266;
  char v13 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v16 = BYTE10(v23);
    ++BYTE10(v23);
    long long v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v22 + 1), v16 | 0x1800000000) + 16;
    char v13 = v16;
  }
  else
  {
    long long v14 = (char *)(v12 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v12 + 13) = v13;
  uint64_t v17 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)long long v14 = var0;
  *((float *)v14 + 2) = a3;
  *((float *)v14 + 3) = a4;
  *((float *)v14 + 4) = a5;
  *((_DWORD *)v14 + 5) = 0;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setCullMode:(unint64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setCullMode:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16268;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    uint64_t v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  double v10 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (void)setCommandDataCorruptModeSPI:(unint64_t)a3
{
}

- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setColorStoreActionOptions:a3 atIndex:a4];
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16022;
  char v8 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v11 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v17 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setColorStoreAction:a3 atIndex:a4];
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16159;
  char v8 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v11 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v17 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
}

- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7 atIndex:(unint64_t)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  [v14 touch];
  if (v14)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v14];
    }
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v29);
  baseObject = self->_baseObject;
  long long v17 = [v14 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setColorResolveTexture:v17 slice:a4 depthPlane:a5 level:a6 yInvert:v9 atIndex:a8];

  uint64_t v18 = v30;
  *(_DWORD *)(v30 + 8) = -15728;
  char v19 = BYTE9(v31);
  if (BYTE9(v31) > 8uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 24);
    uint64_t v22 = BYTE10(v31);
    ++BYTE10(v31);
    uint64_t v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v30 + 1), v22 | 0x3800000000) + 16;
    char v19 = v22;
  }
  else
  {
    uint64_t v20 = (char *)(v18 + BYTE9(v31));
    BYTE9(v31) += 56;
  }
  *(unsigned char *)(v18 + 13) = v19;
  long long v23 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v25 = (uint64_t *)[v14 traceStream];
  if (v25) {
    uint64_t v26 = *v25;
  }
  else {
    uint64_t v26 = 0;
  }
  *(void *)uint64_t v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = a4;
  *((void *)v20 + 3) = a5;
  *((void *)v20 + 4) = a6;
  *((void *)v20 + 5) = a8;
  *((_DWORD *)v20 + 12) = v9;
  *((_DWORD *)v20 + 13) = 0;
  s();
  *(void *)uint64_t v27 = v28;
  *(unsigned char *)(v27 + 8) = BYTE8(v31);
  *(unsigned char *)(v30 + 15) |= 8u;
}

- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 atIndex:(unint64_t)a7
{
  id v12 = a3;
  [v12 touch];
  if (v12)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v12];
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v15 = [v12 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject setColorResolveTexture:v15 slice:a4 depthPlane:a5 level:a6 atIndex:a7];

  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16156;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x10uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x3000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 48;
  }
  *(unsigned char *)(v16 + 13) = v17;
  uint64_t v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v23 = (uint64_t *)[v12 traceStream];
  if (v23) {
    uint64_t v24 = *v23;
  }
  else {
    uint64_t v24 = 0;
  }
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  *((void *)v18 + 3) = a5;
  *((void *)v18 + 4) = a6;
  *((void *)v18 + 5) = a7;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setClipPlane:(float)a3 p2:(float)a4 p3:(float)a5 p4:(float)a6 atIndex:(unint64_t)a7
{
}

- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v24);
  *(float *)&double v11 = a3;
  *(float *)&double v12 = a4;
  *(float *)&double v13 = a5;
  *(float *)&double v14 = a6;
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setBlendColorRed:v11 green:v12 blue:v13 alpha:v14];
  uint64_t v15 = v25;
  *(_DWORD *)(v25 + 8) = -16255;
  char v16 = BYTE9(v26);
  if (BYTE9(v26) > 0x28uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 24);
    uint64_t v19 = BYTE10(v26);
    ++BYTE10(v26);
    char v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v25 + 1), v19 | 0x1800000000) + 16;
    char v16 = v19;
  }
  else
  {
    char v17 = (char *)(v15 + BYTE9(v26));
    BYTE9(v26) += 24;
  }
  *(unsigned char *)(v15 + 13) = v16;
  uint64_t v20 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)char v17 = var0;
  *((float *)v17 + 2) = a3;
  *((float *)v17 + 3) = a4;
  *((float *)v17 + 4) = a5;
  *((float *)v17 + 5) = a6;
  s();
  *(void *)uint64_t v22 = v23;
  *(unsigned char *)(v22 + 8) = BYTE8(v26);
  *(unsigned char *)(v25 + 15) |= 8u;
}

- (void)setAlphaTestReferenceValue:(float)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v15);
  *(float *)&double v5 = a3;
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setAlphaTestReferenceValue:v5];
  uint64_t v6 = v16;
  *(_DWORD *)(v16 + 8) = -15729;
  char v7 = BYTE9(v17);
  if (BYTE9(v17) > 0x30uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 24);
    uint64_t v10 = BYTE10(v17);
    ++BYTE10(v17);
    char v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v16 + 1), v10 | 0x1000000000) + 16;
    char v7 = v10;
  }
  else
  {
    char v8 = (char *)(v6 + BYTE9(v17));
    BYTE9(v17) += 16;
  }
  *(unsigned char *)(v6 + 13) = v7;
  double v11 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)char v8 = var0;
  *((float *)v8 + 2) = a3;
  *((_DWORD *)v8 + 3) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v17);
  *(unsigned char *)(v16 + 15) |= 8u;
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  double v11 = [v8 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject sampleCountersInBuffer:v11 atSampleIndex:a4 withBarrier:v5];

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15750;
  char v13 = BYTE9(v25);
  if (BYTE9(v25) > 0x20uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v16 = BYTE10(v25);
    ++BYTE10(v25);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x2000000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v25));
    BYTE9(v25) += 32;
  }
  *(unsigned char *)(v12 + 13) = v13;
  long long v17 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((_DWORD *)v14 + 6) = v5;
  *((_DWORD *)v14 + 7) = 0;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
}

- (void)pushDebugGroup:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject pushDebugGroup:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16244;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    char v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    char v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v12 = v4;
  id v13 = [v12 UTF8String];
  if (v13)
  {
    id v14 = v12;
    id v15 = [v14 UTF8String];
    size_t v16 = strlen((const char *)[v14 UTF8String]);
    LOBYTE(v13) = GTTraceEncoder_storeBytes((uint64_t)&v19, v15, v16 + 1);
  }
  *(void *)char v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)popDebugGroup
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject popDebugGroup];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16243;
  char v4 = BYTE9(v14);
  if (BYTE9(v14) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 24);
    uint64_t v7 = BYTE10(v14);
    ++BYTE10(v14);
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v13 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    uint64_t v5 = (char *)(v3 + BYTE9(v14));
    BYTE9(v14) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v14);
  *(unsigned char *)(v13 + 15) |= 8u;
}

- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v18);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject memoryBarrierWithScope:a3 afterStages:a4 beforeStages:a5];
  uint64_t v9 = v19;
  *(_DWORD *)(v19 + 8) = -16004;
  char v10 = BYTE9(v20);
  if (BYTE9(v20) > 0x20uLL)
  {
    uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 24);
    uint64_t v13 = BYTE10(v20);
    ++BYTE10(v20);
    uint64_t v11 = GTTraceMemPool_allocateBytes(v12, *((uint64_t *)&v19 + 1), v13 | 0x2000000000) + 16;
    char v10 = v13;
  }
  else
  {
    uint64_t v11 = (char *)(v9 + BYTE9(v20));
    BYTE9(v20) += 32;
  }
  *(unsigned char *)(v9 + 13) = v10;
  long long v14 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v11 = var0;
  *((void *)v11 + 1) = a3;
  *((void *)v11 + 2) = a4;
  *((void *)v11 + 3) = a5;
  s();
  *(void *)uint64_t v16 = v17;
  *(unsigned char *)(v16 + 8) = BYTE8(v20);
  *(unsigned char *)(v19 + 15) |= 8u;
  if (a4 == 1 && a5 == 1) {
    CaptureClearFuncSnapshot((apr_hash_index_t *)a3, (uint64_t)self->_snapshotMap);
  }
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6
{
  unint64_t v33 = a5;
  unint64_t v7 = a4;
  uint64_t v8 = a3;
  RetainArray(self->_retainedObjects, (id *)a3, a4);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  char v10 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v34);
  baseObject = self->_baseObject;
  uint64_t v12 = 8 * v7;
  __chkstk_darwin(v10, v13);
  bzero((char *)&v32 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v7);
  if (v7)
  {
    long long v14 = (void **)v8;
    id v15 = (uint64_t *)((char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v16 = v7;
    do
    {
      uint64_t v17 = *v14++;
      *v15++ = [v17 baseObject];
      --v16;
    }
    while (v16);
  }
  unint64_t v18 = v33;
  [(MTLRenderCommandEncoderSPI *)baseObject memoryBarrierWithResources:(char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0) count:v7 afterStages:v33 beforeStages:a6];
  uint64_t v19 = v35;
  *(_DWORD *)(v35 + 8) = -16003;
  char v20 = BYTE9(v36);
  if (BYTE9(v36) > 0x18uLL)
  {
    uint64_t v22 = *(void *)(*((void *)&v34 + 1) + 24);
    uint64_t v23 = BYTE10(v36);
    ++BYTE10(v36);
    long long v21 = GTTraceMemPool_allocateBytes(v22, *((uint64_t *)&v35 + 1), v23 | 0x2800000000) + 16;
    char v20 = v23;
    unint64_t v18 = v33;
  }
  else
  {
    long long v21 = (char *)(v19 + BYTE9(v36));
    BYTE9(v36) += 40;
  }
  *(unsigned char *)(v19 + 13) = v20;
  long long v24 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v24, v25);
  bzero((char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v7);
  char v27 = StreamArray((uint64_t)&v34, (uint64_t *)((char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)v8, v7);
  *(void *)long long v21 = var0;
  *((void *)v21 + 1) = v7;
  *((void *)v21 + 2) = v18;
  *((void *)v21 + 3) = a6;
  v21[32] = v27;
  *(_DWORD *)(v21 + 33) = 0;
  *((_DWORD *)v21 + 9) = 0;
  s();
  *(void *)uint64_t v28 = v29;
  *(unsigned char *)(v28 + 8) = BYTE8(v36);
  *(unsigned char *)(v35 + 15) |= 8u;
  if (v7)
  {
    BOOL v31 = v18 == 1 && a6 == 1;
    do
    {
      if (v31) {
        CaptureRemoveFuncSnapshot((void *)*v8, self->_snapshotMap);
      }
      ++v8;
      --v7;
    }
    while (v7);
  }
}

- (BOOL)isMemorylessRender
{
  return [(MTLRenderCommandEncoderSPI *)self->_baseObject isMemorylessRender];
}

- (void)insertDebugSignpost:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject insertDebugSignpost:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16245;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    unint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    unint64_t v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  char v10 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v12 = v4;
  id v13 = [v12 UTF8String];
  if (v13)
  {
    id v14 = v12;
    id v15 = [v14 UTF8String];
    size_t v16 = strlen((const char *)[v14 UTF8String]);
    LOBYTE(v13) = GTTraceEncoder_storeBytes((uint64_t)&v19, v15, v16 + 1);
  }
  *(void *)unint64_t v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)endEncoding
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject endEncoding];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16246;
  char v4 = BYTE9(v14);
  if (BYTE9(v14) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 24);
    uint64_t v7 = BYTE10(v14);
    ++BYTE10(v14);
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v13 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    uint64_t v5 = (char *)(v3 + BYTE9(v14));
    BYTE9(v14) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v14);
  *(unsigned char *)(v13 + 15) |= 8u;
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v22);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject drawPrimitives:a3 vertexStart:a4 vertexCount:a5 instanceCount:a6 baseInstance:a7];
  uint64_t v13 = v23;
  *(_DWORD *)(v23 + 8) = -16218;
  char v14 = BYTE9(v24);
  if (BYTE9(v24) > 0x10uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 24);
    uint64_t v17 = BYTE10(v24);
    ++BYTE10(v24);
    id v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v23 + 1), v17 | 0x3000000000) + 16;
    char v14 = v17;
  }
  else
  {
    id v15 = (char *)(v13 + BYTE9(v24));
    BYTE9(v24) += 48;
  }
  *(unsigned char *)(v13 + 13) = v14;
  uint64_t v18 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)id v15 = var0;
  *((void *)v15 + 1) = a3;
  *((void *)v15 + 2) = a4;
  *((void *)v15 + 3) = a5;
  *((void *)v15 + 4) = a6;
  *((void *)v15 + 5) = a7;
  s();
  *(void *)uint64_t v20 = v21;
  *(unsigned char *)(v20 + 8) = BYTE8(v24);
  *(unsigned char *)(v23 + 15) |= 8u;
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v20);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject drawPrimitives:a3 vertexStart:a4 vertexCount:a5 instanceCount:a6];
  uint64_t v11 = v21;
  *(_DWORD *)(v21 + 8) = -16251;
  char v12 = BYTE9(v22);
  if (BYTE9(v22) > 0x18uLL)
  {
    uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 24);
    uint64_t v15 = BYTE10(v22);
    ++BYTE10(v22);
    uint64_t v13 = GTTraceMemPool_allocateBytes(v14, *((uint64_t *)&v21 + 1), v15 | 0x2800000000) + 16;
    char v12 = v15;
  }
  else
  {
    uint64_t v13 = (char *)(v11 + BYTE9(v22));
    BYTE9(v22) += 40;
  }
  *(unsigned char *)(v11 + 13) = v12;
  uint64_t v16 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v13 = var0;
  *((void *)v13 + 1) = a3;
  *((void *)v13 + 2) = a4;
  *((void *)v13 + 3) = a5;
  *((void *)v13 + 4) = a6;
  s();
  *(void *)uint64_t v18 = v19;
  *(unsigned char *)(v18 + 8) = BYTE8(v22);
  *(unsigned char *)(v21 + 15) |= 8u;
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v18);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject drawPrimitives:a3 vertexStart:a4 vertexCount:a5];
  uint64_t v9 = v19;
  *(_DWORD *)(v19 + 8) = -16250;
  char v10 = BYTE9(v20);
  if (BYTE9(v20) > 0x20uLL)
  {
    uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 24);
    uint64_t v13 = BYTE10(v20);
    ++BYTE10(v20);
    uint64_t v11 = GTTraceMemPool_allocateBytes(v12, *((uint64_t *)&v19 + 1), v13 | 0x2000000000) + 16;
    char v10 = v13;
  }
  else
  {
    uint64_t v11 = (char *)(v9 + BYTE9(v20));
    BYTE9(v20) += 32;
  }
  *(unsigned char *)(v9 + 13) = v10;
  uint64_t v14 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v11 = var0;
  *((void *)v11 + 1) = a3;
  *((void *)v11 + 2) = a4;
  *((void *)v11 + 3) = a5;
  s();
  *(void *)uint64_t v16 = v17;
  *(unsigned char *)(v16 + 8) = BYTE8(v20);
  *(unsigned char *)(v19 + 15) |= 8u;
}

- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  id v8 = a4;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  uint64_t v11 = [v8 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject drawPrimitives:a3 indirectBuffer:v11 indirectBufferOffset:a5];

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -16216;
  char v13 = BYTE9(v25);
  if (BYTE9(v25) > 0x20uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v16 = BYTE10(v25);
    ++BYTE10(v25);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x2000000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v25));
    BYTE9(v25) += 32;
  }
  *(unsigned char *)(v12 + 13) = v13;
  uint64_t v17 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = a3;
  *((void *)v14 + 2) = v20;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9
{
  id v15 = a6;
  [v15 touch];
  if (v15)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v15];
    }
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v32);
  baseObject = self->_baseObject;
  long long v18 = [v15 baseObject];
  unint64_t v31 = a7;
  unint64_t v19 = a7;
  unint64_t v20 = a8;
  [(MTLRenderCommandEncoderSPI *)baseObject drawPatches:a3 patchStart:a4 patchCount:a5 patchIndexBuffer:v18 patchIndexBufferOffset:v19 instanceCount:a8 baseInstance:a9];

  uint64_t v21 = (char *)v33;
  *(_DWORD *)(v33 + 8) = -16147;
  if (BYTE9(v34))
  {
    uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 24);
    uint64_t v23 = BYTE10(v34);
    ++BYTE10(v34);
    long long v24 = GTTraceMemPool_allocateBytes(v22, *((uint64_t *)&v33 + 1), v23 | 0x4000000000) + 16;
  }
  else
  {
    LOBYTE(v23) = 0;
    BYTE9(v34) = 64;
    long long v24 = v21;
  }
  v21[13] = v23;
  long long v25 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v27 = (uint64_t *)[v15 traceStream];
  if (v27) {
    uint64_t v28 = *v27;
  }
  else {
    uint64_t v28 = 0;
  }
  *(void *)long long v24 = var0;
  *((void *)v24 + 1) = a3;
  *((void *)v24 + 2) = a4;
  *((void *)v24 + 3) = a5;
  *((void *)v24 + 4) = v28;
  *((void *)v24 + 5) = v31;
  *((void *)v24 + 6) = v20;
  *((void *)v24 + 7) = a9;
  s();
  *(void *)uint64_t v29 = v30;
  *(unsigned char *)(v29 + 8) = BYTE8(v34);
  *(unsigned char *)(v33 + 15) |= 8u;
}

- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7
{
  id v12 = a4;
  id v13 = a6;
  [v12 touch];
  if (v12)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v12];
    }
  }
  [v13 touch];
  if (v13)
  {
    id v15 = self->_retainedObjects;
    if (v15) {
      [(NSMutableSet *)v15 addObject:v13];
    }
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v32);
  baseObject = self->_baseObject;
  uint64_t v17 = [v12 baseObject];
  long long v18 = [v13 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject drawPatches:a3 patchIndexBuffer:v17 patchIndexBufferOffset:a5 indirectBuffer:v18 indirectBufferOffset:a7];

  uint64_t v19 = v33;
  *(_DWORD *)(v33 + 8) = -16146;
  char v20 = BYTE9(v34);
  if (BYTE9(v34) > 0x10uLL)
  {
    uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 24);
    uint64_t v23 = BYTE10(v34);
    ++BYTE10(v34);
    uint64_t v21 = GTTraceMemPool_allocateBytes(v22, *((uint64_t *)&v33 + 1), v23 | 0x3000000000) + 16;
    char v20 = v23;
  }
  else
  {
    uint64_t v21 = (char *)(v19 + BYTE9(v34));
    BYTE9(v34) += 48;
  }
  *(unsigned char *)(v19 + 13) = v20;
  long long v24 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v26 = (uint64_t *)[v12 traceStream];
  if (v26) {
    uint64_t v27 = *v26;
  }
  else {
    uint64_t v27 = 0;
  }
  uint64_t v28 = (uint64_t *)[v13 traceStream];
  if (v28) {
    uint64_t v29 = *v28;
  }
  else {
    uint64_t v29 = 0;
  }
  *(void *)uint64_t v21 = var0;
  *((void *)v21 + 1) = a3;
  *((void *)v21 + 2) = v27;
  *((void *)v21 + 3) = a5;
  *((void *)v21 + 4) = v29;
  *((void *)v21 + 5) = a7;
  s();
  *(void *)uint64_t v30 = v31;
  *(unsigned char *)(v30 + 8) = BYTE8(v34);
  *(unsigned char *)(v33 + 15) |= 8u;
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v26);
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = *a5;
  [(MTLRenderCommandEncoderSPI *)baseObject drawMeshThreads:&v25 threadsPerObjectThreadgroup:&v24 threadsPerMeshThreadgroup:&v23];
  uint64_t v10 = v27;
  *(_DWORD *)(v27 + 8) = -15414;
  uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 24);
  uint64_t v12 = BYTE10(v28);
  ++BYTE10(v28);
  Bytes = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v27 + 1), v12 | 0x5000000000);
  *(unsigned char *)(v10 + 13) = v12;
  uint64_t v14 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t var2 = a3->var2;
  unint64_t v17 = a4->var2;
  unint64_t v18 = a5->var2;
  *((void *)Bytes + 2) = var0;
  long long v19 = *(_OWORD *)&a4->var0;
  long long v20 = *(_OWORD *)&a5->var0;
  *(_OWORD *)(Bytes + 24) = *(_OWORD *)&a3->var0;
  *((void *)Bytes + 5) = var2;
  *((_OWORD *)Bytes + 3) = v19;
  *((void *)Bytes + 8) = v17;
  *(_OWORD *)(Bytes + 72) = v20;
  *((void *)Bytes + 11) = v18;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;
}

- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6
{
  id v10 = a3;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v10];
    }
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v31);
  baseObject = self->_baseObject;
  id v13 = [v10 baseObject];
  long long v29 = *(_OWORD *)&a5->var0;
  unint64_t var2 = a5->var2;
  long long v27 = *(_OWORD *)&a6->var0;
  unint64_t v28 = a6->var2;
  [(MTLRenderCommandEncoderSPI *)baseObject drawMeshThreadgroupsWithIndirectBuffer:v13 indirectBufferOffset:a4 threadsPerObjectThreadgroup:&v29 threadsPerMeshThreadgroup:&v27];

  uint64_t v14 = v32;
  *(_DWORD *)(v32 + 8) = -15415;
  uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 24);
  uint64_t v16 = BYTE10(v33);
  ++BYTE10(v33);
  Bytes = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v32 + 1), v16 | 0x4800000000);
  *(unsigned char *)(v14 + 13) = v16;
  unint64_t v18 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v20 = (uint64_t *)[v10 traceStream];
  if (v20) {
    uint64_t v21 = *v20;
  }
  else {
    uint64_t v21 = 0;
  }
  unint64_t v22 = a5->var2;
  unint64_t v23 = a6->var2;
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v21;
  *((void *)Bytes + 4) = a4;
  long long v24 = *(_OWORD *)&a6->var0;
  *(_OWORD *)(Bytes + 40) = *(_OWORD *)&a5->var0;
  *((void *)Bytes + 7) = v22;
  *((_OWORD *)Bytes + 4) = v24;
  *((void *)Bytes + 10) = v23;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v33);
  *(unsigned char *)(v32 + 15) |= 8u;
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v26);
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = *a5;
  [(MTLRenderCommandEncoderSPI *)baseObject drawMeshThreadgroups:&v25 threadsPerObjectThreadgroup:&v24 threadsPerMeshThreadgroup:&v23];
  uint64_t v10 = v27;
  *(_DWORD *)(v27 + 8) = -15416;
  uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 24);
  uint64_t v12 = BYTE10(v28);
  ++BYTE10(v28);
  Bytes = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v27 + 1), v12 | 0x5000000000);
  *(unsigned char *)(v10 + 13) = v12;
  uint64_t v14 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t var2 = a3->var2;
  unint64_t v17 = a4->var2;
  unint64_t v18 = a5->var2;
  *((void *)Bytes + 2) = var0;
  long long v19 = *(_OWORD *)&a4->var0;
  long long v20 = *(_OWORD *)&a5->var0;
  *(_OWORD *)(Bytes + 24) = *(_OWORD *)&a3->var0;
  *((void *)Bytes + 5) = var2;
  *((_OWORD *)Bytes + 3) = v19;
  *((void *)Bytes + 8) = v17;
  *(_OWORD *)(Bytes + 72) = v20;
  *((void *)Bytes + 11) = v18;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8
{
  id v14 = a5;
  id v15 = a7;
  [v14 touch];
  if (v14)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v14];
    }
  }
  [v15 touch];
  if (v15)
  {
    unint64_t v17 = self->_retainedObjects;
    if (v17) {
      [(NSMutableSet *)v17 addObject:v15];
    }
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v34);
  baseObject = self->_baseObject;
  long long v19 = [v14 baseObject];
  long long v20 = [v15 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject drawIndexedPrimitives:a3 indexType:a4 indexBuffer:v19 indexBufferOffset:a6 indirectBuffer:v20 indirectBufferOffset:a8];

  uint64_t v21 = v35;
  *(_DWORD *)(v35 + 8) = -16215;
  char v22 = BYTE9(v36);
  if (BYTE9(v36) > 8uLL)
  {
    uint64_t v24 = *(void *)(*((void *)&v34 + 1) + 24);
    uint64_t v25 = BYTE10(v36);
    ++BYTE10(v36);
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = GTTraceMemPool_allocateBytes(v24, *((uint64_t *)&v35 + 1), v25 | 0x3800000000) + 16;
    char v22 = v25;
  }
  else
  {
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = (char *)(v21 + BYTE9(v36));
    BYTE9(v36) += 56;
  }
  *(unsigned char *)(v21 + 13) = v22;
  long long v26 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v26) {
    unint64_t var0 = v26->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v28 = (uint64_t *)[v14 traceStream];
  if (v28) {
    uint64_t v29 = *v28;
  }
  else {
    uint64_t v29 = 0;
  }
  uint64_t v30 = (uint64_t *)[v15 traceStream];
  if (v30) {
    uint64_t v31 = *v30;
  }
  else {
    uint64_t v31 = 0;
  }
  *(void *)$F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = var0;
  *((void *)v23 + 1) = a3;
  *((void *)v23 + 2) = a4;
  *((void *)v23 + 3) = v29;
  *((void *)v23 + 4) = a6;
  *((void *)v23 + 5) = v31;
  *((void *)v23 + 6) = a8;
  s();
  *(void *)uint64_t v32 = v33;
  *(unsigned char *)(v32 + 8) = BYTE8(v36);
  *(unsigned char *)(v35 + 15) |= 8u;
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  id v16 = a6;
  [v16 touch];
  if (v16)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v16];
    }
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v33);
  baseObject = self->_baseObject;
  long long v19 = [v16 baseObject];
  unint64_t v20 = a7;
  unint64_t v21 = a7;
  unint64_t v22 = a8;
  [(MTLRenderCommandEncoderSPI *)baseObject drawIndexedPrimitives:a3 indexCount:a4 indexType:a5 indexBuffer:v19 indexBufferOffset:v21 instanceCount:a8 baseVertex:a9 baseInstance:a10];

  uint64_t v23 = v34;
  *(_DWORD *)(v34 + 8) = -16217;
  uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 24);
  uint64_t v25 = BYTE10(v35);
  ++BYTE10(v35);
  Bytes = GTTraceMemPool_allocateBytes(v24, *((uint64_t *)&v34 + 1), v25 | 0x4800000000);
  *(unsigned char *)(v23 + 13) = v25;
  long long v27 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v27) {
    unint64_t var0 = v27->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v29 = (uint64_t *)[v16 traceStream];
  if (v29) {
    uint64_t v30 = *v29;
  }
  else {
    uint64_t v30 = 0;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = a3;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = a5;
  *((void *)Bytes + 6) = v30;
  *((void *)Bytes + 7) = v20;
  *((void *)Bytes + 8) = v22;
  *((void *)Bytes + 9) = a9;
  *((void *)Bytes + 10) = a10;
  s();
  *(void *)uint64_t v31 = v32;
  *(unsigned char *)(v31 + 8) = BYTE8(v35);
  *(unsigned char *)(v34 + 15) |= 8u;
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8
{
  id v14 = a6;
  [v14 touch];
  if (v14)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v14];
    }
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v29);
  baseObject = self->_baseObject;
  unint64_t v17 = [v14 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject drawIndexedPrimitives:a3 indexCount:a4 indexType:a5 indexBuffer:v17 indexBufferOffset:a7 instanceCount:a8];

  uint64_t v18 = v30;
  *(_DWORD *)(v30 + 8) = -16249;
  char v19 = BYTE9(v31);
  if (BYTE9(v31) > 8uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 24);
    uint64_t v22 = BYTE10(v31);
    ++BYTE10(v31);
    unint64_t v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v30 + 1), v22 | 0x3800000000) + 16;
    char v19 = v22;
  }
  else
  {
    unint64_t v20 = (char *)(v18 + BYTE9(v31));
    BYTE9(v31) += 56;
  }
  *(unsigned char *)(v18 + 13) = v19;
  uint64_t v23 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v25 = (uint64_t *)[v14 traceStream];
  if (v25) {
    uint64_t v26 = *v25;
  }
  else {
    uint64_t v26 = 0;
  }
  *(void *)unint64_t v20 = var0;
  *((void *)v20 + 1) = a3;
  *((void *)v20 + 2) = a4;
  *((void *)v20 + 3) = a5;
  *((void *)v20 + 4) = v26;
  *((void *)v20 + 5) = a7;
  *((void *)v20 + 6) = a8;
  s();
  *(void *)uint64_t v27 = v28;
  *(unsigned char *)(v27 + 8) = BYTE8(v31);
  *(unsigned char *)(v30 + 15) |= 8u;
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7
{
  id v12 = a6;
  [v12 touch];
  if (v12)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v12];
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  id v15 = [v12 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject drawIndexedPrimitives:a3 indexCount:a4 indexType:a5 indexBuffer:v15 indexBufferOffset:a7];

  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16248;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x10uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x3000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 48;
  }
  *(unsigned char *)(v16 + 13) = v17;
  uint64_t v21 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v23 = (uint64_t *)[v12 traceStream];
  if (v23) {
    uint64_t v24 = *v23;
  }
  else {
    uint64_t v24 = 0;
  }
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = a3;
  *((void *)v18 + 2) = a4;
  *((void *)v18 + 3) = a5;
  *((void *)v18 + 4) = v24;
  *((void *)v18 + 5) = a7;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11
{
  id v14 = a6;
  id v15 = a8;
  [v14 touch];
  if (v14)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v14];
    }
  }
  [v15 touch];
  if (v15)
  {
    char v17 = self->_retainedObjects;
    if (v17) {
      [(NSMutableSet *)v17 addObject:v15];
    }
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v36);
  baseObject = self->_baseObject;
  uint64_t v19 = [v14 baseObject];
  uint64_t v20 = [v15 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject drawIndexedPatches:a3 patchStart:a4 patchCount:a5 patchIndexBuffer:v19 patchIndexBufferOffset:a7 controlPointIndexBuffer:v20 controlPointIndexBufferOffset:a9 instanceCount:a10 baseInstance:a11];

  uint64_t v21 = v37;
  *(_DWORD *)(v37 + 8) = -16145;
  uint64_t v22 = *(void *)(*((void *)&v36 + 1) + 24);
  uint64_t v23 = BYTE10(v38);
  ++BYTE10(v38);
  Bytes = GTTraceMemPool_allocateBytes(v22, *((uint64_t *)&v37 + 1), v23 | 0x5000000000);
  *(unsigned char *)(v21 + 13) = v23;
  uint64_t v25 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v27 = (uint64_t *)[v14 traceStream];
  if (v27) {
    uint64_t v28 = *v27;
  }
  else {
    uint64_t v28 = 0;
  }
  long long v29 = (uint64_t *)[v15 traceStream];
  if (v29) {
    uint64_t v30 = *v29;
  }
  else {
    uint64_t v30 = 0;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = a3;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = a5;
  *((void *)Bytes + 6) = v28;
  *((void *)Bytes + 7) = a7;
  *((void *)Bytes + 8) = v30;
  *((void *)Bytes + 9) = a9;
  *((void *)Bytes + 10) = a10;
  *((void *)Bytes + 11) = a11;
  s();
  *(void *)uint64_t v31 = v32;
  *(unsigned char *)(v31 + 8) = BYTE8(v38);
  *(unsigned char *)(v37 + 15) |= 8u;
}

- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9
{
  id v13 = a4;
  id v14 = a6;
  id v15 = a8;
  [v13 touch];
  if (v13)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v13];
    }
  }
  [v14 touch];
  if (v14)
  {
    char v17 = self->_retainedObjects;
    if (v17) {
      [(NSMutableSet *)v17 addObject:v14];
    }
  }
  [v15 touch];
  if (v15)
  {
    uint64_t v18 = self->_retainedObjects;
    if (v18) {
      [(NSMutableSet *)v18 addObject:v15];
    }
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v39 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v39);
  baseObject = self->_baseObject;
  uint64_t v20 = [v13 baseObject];
  uint64_t v21 = [v14 baseObject];
  uint64_t v22 = [v15 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject drawIndexedPatches:a3 patchIndexBuffer:v20 patchIndexBufferOffset:a5 controlPointIndexBuffer:v21 controlPointIndexBufferOffset:a7 indirectBuffer:v22 indirectBufferOffset:a9];

  uint64_t v23 = (char *)v40;
  *(_DWORD *)(v40 + 8) = -16144;
  if (BYTE9(v41))
  {
    uint64_t v24 = *(void *)(*((void *)&v39 + 1) + 24);
    uint64_t v25 = BYTE10(v41);
    ++BYTE10(v41);
    uint64_t v26 = GTTraceMemPool_allocateBytes(v24, *((uint64_t *)&v40 + 1), v25 | 0x4000000000) + 16;
  }
  else
  {
    LOBYTE(v25) = 0;
    BYTE9(v41) = 64;
    uint64_t v26 = v23;
  }
  v23[13] = v25;
  long long v27 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v27) {
    unint64_t var0 = v27->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v29 = (uint64_t *)[v13 traceStream];
  if (v29) {
    uint64_t v30 = *v29;
  }
  else {
    uint64_t v30 = 0;
  }
  uint64_t v31 = (uint64_t *)[v14 traceStream];
  if (v31) {
    uint64_t v32 = *v31;
  }
  else {
    uint64_t v32 = 0;
  }
  long long v33 = (uint64_t *)[v15 traceStream];
  if (v33) {
    uint64_t v34 = *v33;
  }
  else {
    uint64_t v34 = 0;
  }
  *(void *)uint64_t v26 = var0;
  *((void *)v26 + 1) = a3;
  *((void *)v26 + 2) = v30;
  *((void *)v26 + 3) = a5;
  *((void *)v26 + 4) = v32;
  *((void *)v26 + 5) = a7;
  *((void *)v26 + 6) = v34;
  *((void *)v26 + 7) = a9;
  s();
  *(void *)uint64_t v35 = v36;
  *(unsigned char *)(v35 + 8) = BYTE8(v41);
  *(unsigned char *)(v40 + 15) |= 8u;
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4 withRenderTargetArrayIndex:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  long long v10 = *(_OWORD *)&a3->var0;
  unint64_t var2 = a3->var2;
  long long v11 = *(_OWORD *)&a4->var0.var2;
  v24[0] = *(_OWORD *)&a4->var0.var0;
  v24[1] = v11;
  v24[2] = *(_OWORD *)&a4->var1.var1;
  long long v25 = v10;
  [(MTLRenderCommandEncoderSPI *)baseObject dispatchThreadsPerTile:&v25 inRegion:v24 withRenderTargetArrayIndex:v5];
  uint64_t v12 = v28;
  *(_DWORD *)(v28 + 8) = -15297;
  uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 24);
  uint64_t v14 = BYTE10(v29);
  ++BYTE10(v29);
  Bytes = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v28 + 1), v14 | 0x5800000000);
  *(unsigned char *)(v12 + 13) = v14;
  uint64_t v16 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t v18 = a3->var2;
  *((void *)Bytes + 2) = var0;
  long long v19 = *(_OWORD *)&a4->var0.var0;
  long long v20 = *(_OWORD *)&a4->var0.var2;
  long long v21 = *(_OWORD *)&a4->var1.var1;
  *(_OWORD *)(Bytes + 24) = *(_OWORD *)&a3->var0;
  *((void *)Bytes + 5) = v18;
  *((_OWORD *)Bytes + 3) = v19;
  *((_OWORD *)Bytes + 4) = v20;
  *((_OWORD *)Bytes + 5) = v21;
  *((_DWORD *)Bytes + 24) = v5;
  *((_DWORD *)Bytes + 25) = 0;
  s();
  *(void *)uint64_t v22 = v23;
  *(unsigned char *)(v22 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4
{
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v25);
  baseObject = self->_baseObject;
  long long v8 = *(_OWORD *)&a3->var0;
  unint64_t var2 = a3->var2;
  long long v9 = *(_OWORD *)&a4->var0.var2;
  v22[0] = *(_OWORD *)&a4->var0.var0;
  v22[1] = v9;
  v22[2] = *(_OWORD *)&a4->var1.var1;
  long long v23 = v8;
  [(MTLRenderCommandEncoderSPI *)baseObject dispatchThreadsPerTile:&v23 inRegion:v22];
  uint64_t v10 = v26;
  *(_DWORD *)(v26 + 8) = -15486;
  uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 24);
  uint64_t v12 = BYTE10(v27);
  ++BYTE10(v27);
  Bytes = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v26 + 1), v12 | 0x5000000000);
  *(unsigned char *)(v10 + 13) = v12;
  uint64_t v14 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t v16 = a3->var2;
  *((void *)Bytes + 2) = var0;
  long long v17 = *(_OWORD *)&a4->var0.var0;
  long long v18 = *(_OWORD *)&a4->var0.var2;
  long long v19 = *(_OWORD *)&a4->var1.var1;
  *(_OWORD *)(Bytes + 24) = *(_OWORD *)&a3->var0;
  *((void *)Bytes + 5) = v16;
  *((_OWORD *)Bytes + 3) = v17;
  *((_OWORD *)Bytes + 4) = v18;
  *((_OWORD *)Bytes + 5) = v19;
  s();
  *(void *)uint64_t v20 = v21;
  *(unsigned char *)(v20 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;
}

- (void)dispatchThreadsPerTile:(id *)a3
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v17);
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v16 = *a3;
  [(MTLRenderCommandEncoderSPI *)baseObject dispatchThreadsPerTile:&v16];
  uint64_t v6 = v18;
  *(_DWORD *)(v18 + 8) = -16137;
  char v7 = BYTE9(v19);
  if (BYTE9(v19) > 0x20uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 24);
    uint64_t v10 = BYTE10(v19);
    ++BYTE10(v19);
    long long v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v18 + 1), v10 | 0x2000000000) + 16;
    char v7 = v10;
  }
  else
  {
    long long v8 = (char *)(v6 + BYTE9(v19));
    BYTE9(v19) += 32;
  }
  *(unsigned char *)(v6 + 13) = v7;
  uint64_t v11 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t var2 = a3->var2;
  *(void *)long long v8 = var0;
  *(_OWORD *)(v8 + 8) = *(_OWORD *)&a3->var0;
  *((void *)v8 + 3) = var2;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v19);
  *(unsigned char *)(v18 + 15) |= 8u;
}

- (unint64_t)tileWidth
{
  return (unint64_t)[(MTLRenderCommandEncoderSPI *)self->_baseObject tileWidth];
}

- (unint64_t)tileHeight
{
  return (unint64_t)[(MTLRenderCommandEncoderSPI *)self->_baseObject tileHeight];
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16281;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    char v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    char v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v12 = v4;
  id v13 = [v12 UTF8String];
  if (v13)
  {
    id v14 = v12;
    id v15 = [v14 UTF8String];
    size_t v16 = strlen((const char *)[v14 UTF8String]);
    LOBYTE(v13) = GTTraceEncoder_storeBytes((uint64_t)&v19, v15, v16 + 1);
  }
  *(void *)char v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (NSString)label
{
  return (NSString *)[(MTLRenderCommandEncoderSPI *)self->_baseObject label];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLRenderCommandEncoderSPI *)baseObject conformsToProtocol:v4];

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return CaptureRespondsToSelector((uint64_t)self->_baseObject, a3);
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)CaptureMTLRenderCommandEncoder;
  uint64_t v3 = [(CaptureMTLRenderCommandEncoder *)&v7 description];
  id v4 = [(MTLRenderCommandEncoderSPI *)self->_baseObject description];
  unsigned __int8 v5 = +[NSString stringWithFormat:@"%@ -> %@", v3, v4];

  return (NSString *)v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_baseObject;
}

- (unint64_t)streamReference
{
  traceStream = self->_traceStream;
  if (traceStream) {
    return traceStream->var0;
  }
  else {
    return 0;
  }
}

- (GTTraceStream)traceStream
{
  return self->_traceStream;
}

- (GTTraceContext)traceContext
{
  return self->_traceContext;
}

- (void)touch
{
  traceStream = self->_traceStream;
  uint64_t v3 = mach_absolute_time();
  if (traceStream)
  {
    unint64_t v4 = atomic_load(&traceStream[1].var1);
    unint64_t v5 = v4;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)&traceStream[1].var1, &v5, v4 & 0x1F | v3 & 0xFFFFFFFFFFFFFFE0);
      BOOL v6 = v5 == v4;
      unint64_t v4 = v5;
    }
    while (!v6);
  }
}

- (id)originalObject
{
  return DEVICEOBJECT(self->_baseObject);
}

- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = a3;
  objc_super v7 = [v6 device];
  unsigned __int8 v8 = [v7 captureRaytracingEnabled];

  if (v8)
  {
    [v6 touch];
    if (v6)
    {
      retainedObjects = self->_retainedObjects;
      if (retainedObjects) {
        [(NSMutableSet *)retainedObjects addObject:v6];
      }
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v25);
    baseObject = self->_baseObject;
    uint64_t v11 = [v6 baseObject];
    [(MTLRenderCommandEncoderSPI *)baseObject setTileAccelerationStructure:v11 atBufferIndex:a4];

    uint64_t v12 = v26;
    *(_DWORD *)(v26 + 8) = -15454;
    char v13 = BYTE9(v27);
    if (BYTE9(v27) > 0x28uLL)
    {
      uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
      uint64_t v18 = BYTE10(v27);
      ++BYTE10(v27);
      id v14 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x1800000000) + 16;
      char v13 = v18;
    }
    else
    {
      id v14 = (char *)(v12 + BYTE9(v27));
      BYTE9(v27) += 24;
    }
    *(unsigned char *)(v12 + 13) = v13;
    long long v19 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
    if (v19) {
      unint64_t var0 = v19->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    long long v21 = (uint64_t *)[v6 traceStream];
    if (v21) {
      uint64_t v22 = *v21;
    }
    else {
      uint64_t v22 = 0;
    }
    *(void *)id v14 = var0;
    *((void *)v14 + 1) = v22;
    *((void *)v14 + 2) = a4;
    s();
    *(void *)uint64_t v23 = v24;
    *(unsigned char *)(v23 + 8) = BYTE8(v27);
    *(unsigned char *)(v26 + 15) |= 8u;
  }
  else
  {
    GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderCommandEncoder_setTileAccelerationStructure_atBufferIndex", (uint64_t)"Raytracing", 0, 0);
    id v15 = self->_baseObject;
    size_t v16 = [v6 baseObject];
    [(MTLRenderCommandEncoderSPI *)v15 setTileAccelerationStructure:v16 atBufferIndex:a4];
  }
}

- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = a3;
  objc_super v7 = [v6 device];
  unsigned __int8 v8 = [v7 captureRaytracingEnabled];

  if (v8)
  {
    [v6 touch];
    if (v6)
    {
      retainedObjects = self->_retainedObjects;
      if (retainedObjects) {
        [(NSMutableSet *)retainedObjects addObject:v6];
      }
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v25);
    baseObject = self->_baseObject;
    uint64_t v11 = [v6 baseObject];
    [(MTLRenderCommandEncoderSPI *)baseObject setFragmentAccelerationStructure:v11 atBufferIndex:a4];

    uint64_t v12 = v26;
    *(_DWORD *)(v26 + 8) = -15459;
    char v13 = BYTE9(v27);
    if (BYTE9(v27) > 0x28uLL)
    {
      uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
      uint64_t v18 = BYTE10(v27);
      ++BYTE10(v27);
      id v14 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x1800000000) + 16;
      char v13 = v18;
    }
    else
    {
      id v14 = (char *)(v12 + BYTE9(v27));
      BYTE9(v27) += 24;
    }
    *(unsigned char *)(v12 + 13) = v13;
    long long v19 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
    if (v19) {
      unint64_t var0 = v19->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    long long v21 = (uint64_t *)[v6 traceStream];
    if (v21) {
      uint64_t v22 = *v21;
    }
    else {
      uint64_t v22 = 0;
    }
    *(void *)id v14 = var0;
    *((void *)v14 + 1) = v22;
    *((void *)v14 + 2) = a4;
    s();
    *(void *)uint64_t v23 = v24;
    *(unsigned char *)(v23 + 8) = BYTE8(v27);
    *(unsigned char *)(v26 + 15) |= 8u;
  }
  else
  {
    GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderCommandEncoder_setFragmentAccelerationStructure_atBufferIndex", (uint64_t)"Raytracing", 0, 0);
    id v15 = self->_baseObject;
    size_t v16 = [v6 baseObject];
    [(MTLRenderCommandEncoderSPI *)v15 setFragmentAccelerationStructure:v16 atBufferIndex:a4];
  }
}

- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = a3;
  objc_super v7 = [v6 device];
  unsigned __int8 v8 = [v7 captureRaytracingEnabled];

  if (v8)
  {
    [v6 touch];
    if (v6)
    {
      retainedObjects = self->_retainedObjects;
      if (retainedObjects) {
        [(NSMutableSet *)retainedObjects addObject:v6];
      }
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v25);
    baseObject = self->_baseObject;
    uint64_t v11 = [v6 baseObject];
    [(MTLRenderCommandEncoderSPI *)baseObject setVertexAccelerationStructure:v11 atBufferIndex:a4];

    uint64_t v12 = v26;
    *(_DWORD *)(v26 + 8) = -15449;
    char v13 = BYTE9(v27);
    if (BYTE9(v27) > 0x28uLL)
    {
      uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
      uint64_t v18 = BYTE10(v27);
      ++BYTE10(v27);
      id v14 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x1800000000) + 16;
      char v13 = v18;
    }
    else
    {
      id v14 = (char *)(v12 + BYTE9(v27));
      BYTE9(v27) += 24;
    }
    *(unsigned char *)(v12 + 13) = v13;
    long long v19 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
    if (v19) {
      unint64_t var0 = v19->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    long long v21 = (uint64_t *)[v6 traceStream];
    if (v21) {
      uint64_t v22 = *v21;
    }
    else {
      uint64_t v22 = 0;
    }
    *(void *)id v14 = var0;
    *((void *)v14 + 1) = v22;
    *((void *)v14 + 2) = a4;
    s();
    *(void *)uint64_t v23 = v24;
    *(unsigned char *)(v23 + 8) = BYTE8(v27);
    *(unsigned char *)(v26 + 15) |= 8u;
  }
  else
  {
    GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderCommandEncoder_setVertexAccelerationStructure_atBufferIndex", (uint64_t)"Raytracing", 0, 0);
    id v15 = self->_baseObject;
    size_t v16 = [v6 baseObject];
    [(MTLRenderCommandEncoderSPI *)v15 setVertexAccelerationStructure:v16 atBufferIndex:a4];
  }
}

- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v17);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setVertexAmplificationCount:a3 viewMappings:a4];
  uint64_t v7 = v18;
  *(_DWORD *)(v18 + 8) = -15822;
  char v8 = BYTE9(v19);
  if (BYTE9(v19) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 24);
    uint64_t v11 = BYTE10(v19);
    ++BYTE10(v19);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v18 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v19));
    BYTE9(v19) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (!v12)
  {
    unint64_t var0 = 0;
    if (a4) {
      goto LABEL_6;
    }
LABEL_8:
    char v14 = 0;
    goto LABEL_9;
  }
  unint64_t var0 = v12->var0;
  if (!a4) {
    goto LABEL_8;
  }
LABEL_6:
  char v14 = GTTraceEncoder_storeBlob((uint64_t)&v17, a4, 8 * a3);
LABEL_9:
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a3;
  v9[16] = v14;
  *(_DWORD *)(v9 + 17) = 0;
  *((_DWORD *)v9 + 5) = 0;
  s();
  *(void *)uint64_t v15 = v16;
  *(unsigned char *)(v15 + 8) = BYTE8(v19);
  *(unsigned char *)(v18 + 15) |= 8u;
}

- (void)setViewports:(id *)a3 count:(unint64_t)a4
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v17);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setViewports:a3 count:a4];
  uint64_t v7 = v18;
  *(_DWORD *)(v18 + 8) = -16077;
  char v8 = BYTE9(v19);
  if (BYTE9(v19) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 24);
    uint64_t v11 = BYTE10(v19);
    ++BYTE10(v19);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v18 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v19));
    BYTE9(v19) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v14 = GTTraceEncoder_storeBlob((uint64_t)&v17, a3, 48 * a4);
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a4;
  v9[16] = v14;
  *(_DWORD *)(v9 + 17) = 0;
  *((_DWORD *)v9 + 5) = 0;
  s();
  *(void *)uint64_t v15 = v16;
  *(unsigned char *)(v15 + 8) = BYTE8(v19);
  *(unsigned char *)(v18 + 15) |= 8u;
}

- (void)setScissorRects:(id *)a3 count:(unint64_t)a4
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v17);
  [(MTLRenderCommandEncoderSPI *)self->_baseObject setScissorRects:a3 count:a4];
  uint64_t v7 = v18;
  *(_DWORD *)(v18 + 8) = -16076;
  char v8 = BYTE9(v19);
  if (BYTE9(v19) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 24);
    uint64_t v11 = BYTE10(v19);
    ++BYTE10(v19);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v18 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v19));
    BYTE9(v19) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v14 = GTTraceEncoder_storeBlob((uint64_t)&v17, a3, 32 * a4);
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a4;
  v9[16] = v14;
  *(_DWORD *)(v9 + 17) = 0;
  *((_DWORD *)v9 + 5) = 0;
  s();
  *(void *)uint64_t v15 = v16;
  *(unsigned char *)(v15 + 8) = BYTE8(v19);
  *(unsigned char *)(v18 + 15) |= 8u;
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  [v9 touch];
  if (v9)
  {
    uint64_t v11 = self->_retainedObjects;
    if (v11) {
      [(NSMutableSet *)v11 addObject:v9];
    }
  }
  long long v75 = 0u;
  long long v76 = 0u;
  long long v74 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v74);
  baseObject = self->_baseObject;
  char v13 = [v8 baseObject];
  char v14 = [v9 baseObject];
  [(MTLRenderCommandEncoderSPI *)baseObject executeCommandsInBuffer:v13 indirectBuffer:v14 indirectBufferOffset:a5];

  uint64_t v15 = v75;
  *(_DWORD *)(v75 + 8) = -15961;
  char v16 = BYTE9(v76);
  if (BYTE9(v76) > 0x10uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v74 + 1) + 24);
    uint64_t v19 = BYTE10(v76);
    ++BYTE10(v76);
    long long v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v75 + 1), v19 | 0x3000000000) + 16;
    char v16 = v19;
  }
  else
  {
    long long v17 = (char *)(v15 + BYTE9(v76));
    BYTE9(v76) += 48;
  }
  *(unsigned char *)(v15 + 13) = v16;
  long long v20 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v22 = (uint64_t *)[v8 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0;
  }
  uint64_t v24 = (uint64_t *)[v9 traceStream];
  if (v24) {
    uint64_t v25 = *v24;
  }
  else {
    uint64_t v25 = 0;
  }
  *(void *)long long v17 = var0;
  *((void *)v17 + 1) = v23;
  *((void *)v17 + 2) = v25;
  *((void *)v17 + 3) = a5;
  *((void *)v17 + 4) = 0;
  *((void *)v17 + 5) = 0;
  s();
  *(void *)uint64_t v26 = v27;
  *(unsigned char *)(v26 + 8) = BYTE8(v76);
  *(unsigned char *)(v75 + 15) |= 8u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  unsigned int v29 = [WeakRetained isCapturing];

  if (v29)
  {
    NSUInteger location = (id *)&self->_captureCommandBuffer;
    unint64_t v30 = a5;
    id v65 = v8;
    id v31 = v8;
    uint64_t v32 = MTLIndirectCommandBuffer_descriptor((uint64_t)[v31 traceStream]);
    long long v33 = MakeMTLIndirectCommandBufferDescriptorWithoutResourceIndex(v32);
    uint64_t FuncSnapshot = CaptureFindFuncSnapshot(v31, (uint64_t)self->_snapshotMap);
    v60 = v31;
    v58 = v33;
    if (FuncSnapshot)
    {
      uint64_t v35 = (void *)FuncSnapshot;
      id v61 = 0;
      v62 = 0;
      v59 = *(char **)(FuncSnapshot + 8);
    }
    else
    {
      id v73 = 0;
      v62 = CreateIndirectRenderCommandBufferSnapshot(self, v31, v33, &v73);
      id v61 = v73;
      SnapshotMemory = AllocateSnapshotMemory((uint64_t)&v74, v32, (int)[v31 size]);
      pool = self->_pool;
      snapshotMap = self->_snapshotMap;
      id v39 = [v31 streamReference];
      uint64_t v35 = apr_palloc(pool, 0x18uLL);
      *uint64_t v35 = v39;
      apr_hash_set(snapshotMap, v35, 8, v35);
      v59 = SnapshotMemory;
      v35[1] = SnapshotMemory;
      v35[2] = *(void *)v75;
    }
    long long v40 = self;
    id v41 = v9;
    v42 = [(CaptureMTLRenderCommandEncoder *)v40 device];
    v43 = DEVICEOBJECT(v41);

    v44 = [v43 device];
    id v45 = [v44 newBufferWithLength:8 options:0];
    v46 = DEVICEOBJECT(v40);

    [v46 setVertexBuffer:v45 offset:0 atIndex:0];
    [v46 setVertexBuffer:v43 offset:v30 atIndex:1];
    v47 = [v42 renderPipelineCopyBuffer];
    [v46 setRenderPipelineState:v47];

    [v46 drawPrimitives:0 vertexStart:0 vertexCount:8];
    uint64_t v48 = *(void *)(*((void *)&v74 + 1) + 24);
    uint64_t v49 = BYTE10(v76);
    ++BYTE10(v76);
    Bytes = GTTraceMemPool_allocateBytes(v48, *((uint64_t *)&v75 + 1), v49 | 0x1000000100);
    RestoreRenderCommandEncoder((uint64_t)v40, v51);
    v17[40] = v59[8];
    v17[41] = Bytes[8];
    *((void *)v17 + 4) = v35[2];
    id v52 = objc_loadWeakRetained(location);
    v53 = DEVICEOBJECT(v52);

    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = __94__CaptureMTLRenderCommandEncoder_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset___block_invoke;
    v66[3] = &unk_221CE0;
    id v67 = v61;
    id v68 = v62;
    id v69 = v58;
    id v70 = v45;
    v71 = v59;
    v72 = Bytes;
    id v54 = v45;
    id v55 = v58;
    id v56 = v62;
    id v57 = v61;
    [v53 addCompletedHandler:v66];

    id v8 = v65;
  }
}

float __94__CaptureMTLRenderCommandEncoder_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) length];
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = GTMTLDecodeIndirectCommandBuffer(v2, *(void **)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 64);
    if (v4) {
      unint64_t v5 = (void *)(v4 + 16);
    }
    else {
      unint64_t v5 = 0;
    }
    id v6 = v3;
    memcpy(v5, [v6 bytes], (size_t)objc_msgSend(v6, "length"));
  }
  uint64_t v7 = [*(id *)(a1 + 56) contents];
  uint64_t v8 = *(void *)(a1 + 72);
  if (v8) {
    id v9 = (_OWORD *)(v8 + 16);
  }
  else {
    id v9 = 0;
  }
  *(void *)&long long v10 = *v7;
  *((void *)&v10 + 1) = HIDWORD(*v7);
  LODWORD(result) = *v7;
  _OWORD *v9 = v10;
  return result;
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  [v7 touch];
  if (v7)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v7];
    }
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v48 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v48);
  baseObject = self->_baseObject;
  long long v10 = [v7 baseObject];
  -[MTLRenderCommandEncoderSPI executeCommandsInBuffer:withRange:](baseObject, "executeCommandsInBuffer:withRange:", v10, location, length);

  uint64_t v11 = v49;
  *(_DWORD *)(v49 + 8) = -15962;
  char v12 = BYTE9(v50);
  if (BYTE9(v50) > 0x10uLL)
  {
    uint64_t v14 = *(void *)(*((void *)&v48 + 1) + 24);
    uint64_t v15 = BYTE10(v50);
    ++BYTE10(v50);
    char v13 = GTTraceMemPool_allocateBytes(v14, *((uint64_t *)&v49 + 1), v15 | 0x3000000000) + 16;
    char v12 = v15;
  }
  else
  {
    char v13 = (char *)(v11 + BYTE9(v50));
    BYTE9(v50) += 48;
  }
  *(unsigned char *)(v11 + 13) = v12;
  char v16 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v18 = (uint64_t *)[v7 traceStream];
  if (v18) {
    uint64_t v19 = *v18;
  }
  else {
    uint64_t v19 = 0;
  }
  *(void *)char v13 = var0;
  *((void *)v13 + 1) = v19;
  *((void *)v13 + 2) = location;
  *((void *)v13 + 3) = length;
  *((void *)v13 + 4) = 0;
  *((void *)v13 + 5) = 0;
  s();
  *(void *)uint64_t v20 = v21;
  *(unsigned char *)(v20 + 8) = BYTE8(v50);
  *(unsigned char *)(v49 + 15) |= 8u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  unsigned int v23 = [WeakRetained isCapturing];

  if (v23)
  {
    id v24 = v7;
    uint64_t v25 = MTLIndirectCommandBuffer_descriptor((uint64_t)[v24 traceStream]);
    uint64_t v26 = MakeMTLIndirectCommandBufferDescriptorWithoutResourceIndex(v25);
    uint64_t FuncSnapshot = CaptureFindFuncSnapshot(v24, (uint64_t)self->_snapshotMap);
    if (FuncSnapshot)
    {
      unsigned int v29 = (void *)FuncSnapshot;
      id v30 = 0;
      long long v40 = 0;
      SnapshotMemory = *(char **)(FuncSnapshot + 8);
    }
    else
    {
      id v47 = 0;
      long long v40 = CreateIndirectRenderCommandBufferSnapshot(self, v24, v26, &v47);
      id v30 = v47;
      SnapshotMemory = AllocateSnapshotMemory((uint64_t)&v48, v25, (int)[v24 size]);
      pool = self->_pool;
      ht = self->_snapshotMap;
      id v33 = [v24 streamReference];
      unsigned int v29 = apr_palloc(pool, 0x18uLL);
      *unsigned int v29 = v33;
      apr_hash_set(ht, v29, 8, v29);
      v29[1] = SnapshotMemory;
      v29[2] = *(void *)v49;
    }
    RestoreRenderCommandEncoder((uint64_t)self, v28);
    v13[40] = SnapshotMemory[8];
    *((void *)v13 + 4) = v29[2];
    id v34 = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
    uint64_t v35 = DEVICEOBJECT(v34);

    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = __68__CaptureMTLRenderCommandEncoder_executeCommandsInBuffer_withRange___block_invoke;
    v42[3] = &unk_221D08;
    id v43 = v30;
    id v44 = v40;
    id v45 = v26;
    v46 = SnapshotMemory;
    id v36 = v26;
    id v37 = v40;
    id v38 = v30;
    [v35 addCompletedHandler:v42];
  }
}

void __68__CaptureMTLRenderCommandEncoder_executeCommandsInBuffer_withRange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) length];
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = GTMTLDecodeIndirectCommandBuffer(v2, *(void **)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4) {
      unint64_t v5 = (void *)(v4 + 16);
    }
    else {
      unint64_t v5 = 0;
    }
    id v6 = v3;
    memcpy(v5, [v6 bytes], (size_t)objc_msgSend(v6, "length"));
  }
}

- (void)dealloc
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -16280;
  char v4 = BYTE9(v16);
  if (BYTE9(v16) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v7 = BYTE10(v16);
    ++BYTE10(v16);
    unint64_t v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v15 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    unint64_t v5 = (char *)(v3 + BYTE9(v16));
    BYTE9(v16) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLRenderCommandEncoder *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)unint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  [WeakRetained unionRetainSet:self->_retainedObjects];

  apr_pool_destroy(self->_pool);
  v13.receiver = self;
  v13.super_class = (Class)CaptureMTLRenderCommandEncoder;
  [(CaptureMTLRenderCommandEncoder *)&v13 dealloc];
}

- (CaptureMTLRenderCommandEncoder)initWithBaseObject:(id)a3 captureParallelRenderCommandEncoder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CaptureMTLRenderCommandEncoder;
  id v9 = [(CaptureMTLRenderCommandEncoder *)&v23 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    uint64_t v11 = [v8 device];
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (CaptureMTLDevice *)v11;

    objc_super v13 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v13;
    long long v14 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v13, (unint64_t)v14, 0);

    apr_pool_create_ex(&v10->_pool, 0, 0, 0);
    v10->_snapshotMap = apr_hash_make(v10->_pool);
    long long v15 = [v8 commandBuffer];
    objc_storeWeak((id *)&v10->_captureCommandBuffer, v15);

    id WeakRetained = objc_loadWeakRetained((id *)&v10->_captureCommandBuffer);
    long long v17 = [WeakRetained retainedObjects];

    if (v17)
    {
      uint64_t v18 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      retainedObjects = v10->_retainedObjects;
      v10->_retainedObjects = v18;

      uint64_t v20 = v10->_retainedObjects;
      uint64_t v21 = DEVICEOBJECT(v10->_baseObject);
      [(NSMutableSet *)v20 addObject:v21];
    }
  }

  return v10;
}

- (CaptureMTLRenderCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CaptureMTLRenderCommandEncoder;
  id v9 = [(CaptureMTLRenderCommandEncoder *)&v20 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    uint64_t v11 = [v8 device];
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (CaptureMTLDevice *)v11;

    objc_super v13 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v13;
    long long v14 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openEncoderStream((uint64_t)v13, (unint64_t)v14, *((void *)[v8 traceStream] + 3));

    objc_storeWeak((id *)&v10->_captureCommandBuffer, v8);
    uint64_t v15 = [v8 retainedObjects];
    retainedObjects = v10->_retainedObjects;
    v10->_retainedObjects = (NSMutableSet *)v15;

    apr_pool_create_ex(&v10->_pool, 0, 0, 0);
    v10->_snapshotMap = apr_hash_make(v10->_pool);
    long long v17 = v10->_retainedObjects;
    uint64_t v18 = DEVICEOBJECT(v10->_baseObject);
    [(NSMutableSet *)v17 addObject:v18];
  }
  return v10;
}

- (MTLRenderCommandEncoder)baseObject
{
  return self->_baseObject;
}

@end