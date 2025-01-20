@interface _MTLIndirectRenderCommand
- (BOOL)hasBarrier;
- (id)drawArguments;
- (id)drawIndexedArguments;
- (id)drawIndexedPatchesArguments;
- (id)drawMeshThreadgroupsArguments;
- (id)drawMeshThreadsArguments;
- (id)drawPatchesArguments;
- (id)getTessellationFactorArguments;
- (unint64_t)getCommandType;
- (unint64_t)getMeshBufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)getObjectBufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)getObjectThreadgroupMemoryLengthAtIndex:(unint64_t)a3;
- (unint64_t)getOptimizedStatus;
- (unint64_t)getPipelineStateUniqueIdentifier;
- (unint64_t)getVertexAttributeStrideAtIndex:(unint64_t)a3;
- (void)clearBarrier;
- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11 tessellationFactorBuffer:(id)a12 tessellationFactorBufferOffset:(unint64_t)a13 tessellationFactorBufferInstanceStride:(unint64_t)a14;
- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11 tessellationFactorBuffer:(id)a12 tessellationFactorBufferOffset:(unint64_t)a13 tessellationFactorBufferInstanceStride:(unint64_t)a14 tessellationFactorBufferScale:(float)a15;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10;
- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9 tessellationFactorBuffer:(id)a10 tessellationFactorBufferOffset:(unint64_t)a11 tessellationFactorBufferInstanceStride:(unint64_t)a12;
- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9 tessellationFactorBuffer:(id)a10 tessellationFactorBufferOffset:(unint64_t)a11 tessellationFactorBufferInstanceStride:(unint64_t)a12 tessellationFactorBufferScale:(float)a13;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7;
- (void)getFragmentBufferAtIndex:(unint64_t)a3;
- (void)getVertexBufferAtIndex:(unint64_t)a3;
- (void)reset;
- (void)setBarrier;
- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setRenderPipelineState:(id)a3;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
@end

@implementation _MTLIndirectRenderCommand

- (void)getVertexBufferAtIndex:(unint64_t)a3
{
  return 0;
}

- (void)getFragmentBufferAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)getVertexAttributeStrideAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)getObjectBufferAddressAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)getMeshBufferAddressAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)getCommandType
{
  return 0;
}

- (id)drawArguments
{
  return 0;
}

- (id)drawIndexedArguments
{
  return 0;
}

- (id)drawPatchesArguments
{
  return 0;
}

- (id)drawIndexedPatchesArguments
{
  return 0;
}

- (id)drawMeshThreadgroupsArguments
{
  return 0;
}

- (id)drawMeshThreadsArguments
{
  return 0;
}

- (unint64_t)getPipelineStateUniqueIdentifier
{
  return 0;
}

- (id)getTessellationFactorArguments
{
  return 0;
}

- (unint64_t)getOptimizedStatus
{
  return 0;
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11 tessellationFactorBuffer:(id)a12 tessellationFactorBufferOffset:(unint64_t)a13 tessellationFactorBufferInstanceStride:(unint64_t)a14
{
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11 tessellationFactorBuffer:(id)a12 tessellationFactorBufferOffset:(unint64_t)a13 tessellationFactorBufferInstanceStride:(unint64_t)a14 tessellationFactorBufferScale:(float)a15
{
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9 tessellationFactorBuffer:(id)a10 tessellationFactorBufferOffset:(unint64_t)a11 tessellationFactorBufferInstanceStride:(unint64_t)a12
{
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9 tessellationFactorBuffer:(id)a10 tessellationFactorBufferOffset:(unint64_t)a11 tessellationFactorBufferInstanceStride:(unint64_t)a12 tessellationFactorBufferScale:(float)a13
{
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
}

- (void)reset
{
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setRenderPipelineState:(id)a3
{
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setBarrier
{
}

- (void)clearBarrier
{
}

- (BOOL)hasBarrier
{
  return 0;
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
}

- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (unint64_t)getObjectThreadgroupMemoryLengthAtIndex:(unint64_t)a3
{
  return 0;
}

@end