@interface _MTLIndirectComputeCommand
- ($34D5C35368F688BCCD66CCEA543B57DA)getStageInRegion;
- (BOOL)hasBarrier;
- (id)dispatchThreadgroupsArguments;
- (id)dispatchThreadsArguments;
- (id)getImageBlockSize;
- (unint64_t)getCommandType;
- (unint64_t)getKernelAttributeStrideAtIndex:(unint64_t)a3;
- (unint64_t)getOptimizedStatus;
- (unint64_t)getPipelineStateUniqueIdentifier;
- (unint64_t)getThreadgroupMemoryLengthAtIndex:(unint64_t)a3;
- (void)clearBarrier;
- (void)concurrentDispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)concurrentDispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)getKernelBufferAtIndex:(unint64_t)a3;
- (void)reset;
- (void)setBarrier;
- (void)setComputePipelineState:(id)a3;
- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4;
- (void)setKernelArgument:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setStageInRegion:(id *)a3;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
@end

@implementation _MTLIndirectComputeCommand

- (unint64_t)getPipelineStateUniqueIdentifier
{
  return 0;
}

- (void)concurrentDispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
}

- (void)concurrentDispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
}

- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4
{
}

- (void)setBarrier
{
}

- (void)clearBarrier
{
}

- (unint64_t)getThreadgroupMemoryLengthAtIndex:(unint64_t)a3
{
  return 0;
}

- ($34D5C35368F688BCCD66CCEA543B57DA)getStageInRegion
{
  result = ($34D5C35368F688BCCD66CCEA543B57DA *)[(_MTLIndirectComputeCommand *)self doesNotRecognizeSelector:a3];
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var2 = 0u;
  *(int64x2_t *)&retstr->var1.var1 = vdupq_n_s64(1uLL);
  return result;
}

- (BOOL)hasBarrier
{
  return 0;
}

- (id)getImageBlockSize
{
  return 0;
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setStageInRegion:(id *)a3
{
}

- (void)reset
{
}

- (void)setComputePipelineState:(id)a3
{
}

- (void)setKernelArgument:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
}

- (unint64_t)getOptimizedStatus
{
  return 0;
}

- (id)dispatchThreadgroupsArguments
{
  return 0;
}

- (id)dispatchThreadsArguments
{
  return 0;
}

- (unint64_t)getCommandType
{
  return 0;
}

- (void)getKernelBufferAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)getKernelAttributeStrideAtIndex:(unint64_t)a3
{
  return 0;
}

@end