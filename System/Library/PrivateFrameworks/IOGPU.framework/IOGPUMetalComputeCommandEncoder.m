@interface IOGPUMetalComputeCommandEncoder
- (id)getComputePipelineState;
- (unint64_t)getType;
- (void)getBufferContentsAtIndex:(unint64_t)a3;
- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4;
- (void)memoryBarrierWithScope:(unint64_t)a3;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFunctionTable:(id)a3 atIndex:(unint64_t)a4;
- (void)setFunctionTables:(const void *)a3 withRange:(_NSRange)a4;
- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)updateFence:(id)a3;
- (void)waitForFence:(id)a3;
@end

@implementation IOGPUMetalComputeCommandEncoder

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

- (void)memoryBarrierWithScope:(unint64_t)a3
{
  if ([(_MTLCommandEncoder *)self dispatchType] == 1) {
    [(IOGPUMetalComputeCommandEncoder *)self doesNotRecognizeSelector:a2];
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
      if (objc_opt_respondsToSelector()) {
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
  [(IOGPUMetalComputeCommandEncoder *)self memoryBarrierWithScope:v7];
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
}

- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    uint64_t v8 = [a3 buffer];
    uint64_t v9 = [a3 bufferOffset];
    [(IOGPUMetalComputeCommandEncoder *)self setBuffer:v8 offset:v9 atIndex:a4];
  }
  else
  {
    [(IOGPUMetalComputeCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
}

- (void)setFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    uint64_t v8 = [a3 visibleFunctionTable];
    [(IOGPUMetalComputeCommandEncoder *)self setVisibleFunctionTable:v8 atBufferIndex:a4];
  }
  else
  {
    [(IOGPUMetalComputeCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v12[1] = *MEMORY[0x263EF8340];
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    if (length)
    {
      uint64_t v9 = (void *)((char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
      NSUInteger v10 = length;
      do
      {
        v11 = (void *)*a3++;
        *v9++ = [v11 visibleFunctionTable];
        --v10;
      }
      while (v10);
    }
    -[IOGPUMetalComputeCommandEncoder setVisibleFunctionTables:withBufferRange:](self, "setVisibleFunctionTables:withBufferRange:", (char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  }
  else
  {
    [(IOGPUMetalComputeCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
}

@end