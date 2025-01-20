@interface MTLIOAccelComputeCommandEncoder
- (id)getComputePipelineState;
- (unint64_t)getType;
- (void)getBufferContentsAtIndex:(unint64_t)a3;
- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4;
- (void)memoryBarrierWithScope:(unint64_t)a3;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)setEmulationBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setEmulationSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setEmulationTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)updateFence:(id)a3;
- (void)useHeap:(id)a3;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)waitForFence:(id)a3;
@end

@implementation MTLIOAccelComputeCommandEncoder

- (unint64_t)getType
{
  return 1;
}

- (void)updateFence:(id)a3
{
}

- (void)waitForFence:(id)a3
{
}

- (id)getComputePipelineState
{
  return 0;
}

- (void)getBufferContentsAtIndex:(unint64_t)a3
{
  return 0;
}

- (void)useHeap:(id)a3
{
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
}

- (void)setEmulationBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
}

- (void)setEmulationTextures:(const void *)a3 withRange:(_NSRange)a4
{
}

- (void)setEmulationSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
}

- (void)memoryBarrierWithScope:(unint64_t)a3
{
  if ([(_MTLCommandEncoder *)self dispatchType] == 1) {
    [(MTLIOAccelComputeCommandEncoder *)self doesNotRecognizeSelector:a2];
  }

  [(_MTLCommandEncoder *)self memoryBarrierNotificationWithScope:a3];
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v5 = a4;
    uint64_t v7 = 0;
    do
    {
      ++a3;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v8 = 2;
      }
      else {
        uint64_t v8 = 1;
      }
      v7 |= v8;
      --v5;
    }
    while (v5);
  }
  else
  {
    uint64_t v7 = 0;
  }

  [(MTLIOAccelComputeCommandEncoder *)self memoryBarrierWithScope:v7];
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    uint64_t v8 = [a3 visibleFunctionTable];
    [(MTLIOAccelComputeCommandEncoder *)self setVisibleFunctionTable:v8 atBufferIndex:a4];
  }
  else
  {
    [(MTLIOAccelComputeCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v12[1] = *MEMORY[0x1E4F143B8];
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    if (length)
    {
      v9 = (void *)((char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
      NSUInteger v10 = length;
      do
      {
        v11 = (void *)*a3++;
        *v9++ = [v11 visibleFunctionTable];
        --v10;
      }
      while (v10);
    }
    -[MTLIOAccelComputeCommandEncoder setVisibleFunctionTables:withBufferRange:](self, "setVisibleFunctionTables:withBufferRange:", (char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  }
  else
  {
    [(MTLIOAccelComputeCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
}

@end