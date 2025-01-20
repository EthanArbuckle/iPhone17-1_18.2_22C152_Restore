@interface IOGPUMetalRenderCommandEncoder
- (BOOL)isMemorylessRender;
- (IOGPUMetalRenderCommandEncoder)initWithCommandBuffer:(id)a3 descriptor:(id)a4;
- (id)getRenderPipelineState;
- (unint64_t)getType;
- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)getFragmentBufferContentsAtIndex:(unint64_t)a3;
- (void)getVertexBufferContentsAtIndex:(unint64_t)a3;
- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6;
- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setDepthStoreAction:(unint64_t)a3;
- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setMeshAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setMeshIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setMeshIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setObjectAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setObjectIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setObjectIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setStencilStoreAction:(unint64_t)a3;
- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setTileIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setTileIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setTileVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setTileVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4;
- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVertexIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)textureBarrier;
- (void)updateFence:(id)a3 afterStages:(unint64_t)a4;
- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4;
@end

@implementation IOGPUMetalRenderCommandEncoder

- (unint64_t)getType
{
  return 0;
}

- (IOGPUMetalRenderCommandEncoder)initWithCommandBuffer:(id)a3 descriptor:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)IOGPUMetalRenderCommandEncoder;
  return -[IOGPUMetalCommandEncoder initWithCommandBuffer:](&v5, sel_initWithCommandBuffer_, a3, a4);
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setDepthStoreAction:(unint64_t)a3
{
}

- (void)setStencilStoreAction:(unint64_t)a3
{
}

- (void)textureBarrier
{
}

- (void)updateFence:(id)a3 afterStages:(unint64_t)a4
{
}

- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4
{
}

- (BOOL)isMemorylessRender
{
  return 0;
}

- (void)getVertexBufferContentsAtIndex:(unint64_t)a3
{
  return 0;
}

- (void)getFragmentBufferContentsAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)getRenderPipelineState
{
  return 0;
}

- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5
{
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6
{
  if (a4)
  {
    unint64_t v9 = a4;
    uint64_t v11 = 0;
    do
    {
      ++a3;
      if (objc_opt_respondsToSelector()) {
        uint64_t v12 = 2;
      }
      else {
        uint64_t v12 = 1;
      }
      v11 |= v12;
      --v9;
    }
    while (v9);
  }
  else
  {
    uint64_t v11 = 0;
  }
  [(IOGPUMetalRenderCommandEncoder *)self memoryBarrierWithScope:v11 afterStages:a5 beforeStages:a6];
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
}

- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4
{
}

- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setTileVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setTileVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    uint64_t v8 = [a3 visibleFunctionTable];
    [(IOGPUMetalRenderCommandEncoder *)self setVertexVisibleFunctionTable:v8 atBufferIndex:a4];
  }
  else
  {
    [(IOGPUMetalRenderCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
}

- (void)setVertexIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v12[1] = *MEMORY[0x263EF8340];
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    if (length)
    {
      unint64_t v9 = (void *)((char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
      NSUInteger v10 = length;
      do
      {
        uint64_t v11 = (void *)*a3++;
        *v9++ = [v11 visibleFunctionTable];
        --v10;
      }
      while (v10);
    }
    -[IOGPUMetalRenderCommandEncoder setVertexVisibleFunctionTables:withBufferRange:](self, "setVertexVisibleFunctionTables:withBufferRange:", (char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  }
  else
  {
    [(IOGPUMetalRenderCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
}

- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    uint64_t v8 = [a3 visibleFunctionTable];
    [(IOGPUMetalRenderCommandEncoder *)self setFragmentVisibleFunctionTable:v8 atBufferIndex:a4];
  }
  else
  {
    [(IOGPUMetalRenderCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
}

- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v12[1] = *MEMORY[0x263EF8340];
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    if (length)
    {
      unint64_t v9 = (void *)((char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
      NSUInteger v10 = length;
      do
      {
        uint64_t v11 = (void *)*a3++;
        *v9++ = [v11 visibleFunctionTable];
        --v10;
      }
      while (v10);
    }
    -[IOGPUMetalRenderCommandEncoder setFragmentVisibleFunctionTables:withBufferRange:](self, "setFragmentVisibleFunctionTables:withBufferRange:", (char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  }
  else
  {
    [(IOGPUMetalRenderCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
}

- (void)setTileIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    uint64_t v8 = [a3 visibleFunctionTable];
    [(IOGPUMetalRenderCommandEncoder *)self setTileVisibleFunctionTable:v8 atBufferIndex:a4];
  }
  else
  {
    [(IOGPUMetalRenderCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
}

- (void)setTileIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v12[1] = *MEMORY[0x263EF8340];
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    if (length)
    {
      unint64_t v9 = (void *)((char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
      NSUInteger v10 = length;
      do
      {
        uint64_t v11 = (void *)*a3++;
        *v9++ = [v11 visibleFunctionTable];
        --v10;
      }
      while (v10);
    }
    -[IOGPUMetalRenderCommandEncoder setTileVisibleFunctionTables:withBufferRange:](self, "setTileVisibleFunctionTables:withBufferRange:", (char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  }
  else
  {
    [(IOGPUMetalRenderCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
}

- (void)setObjectIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    uint64_t v8 = [a3 visibleFunctionTable];
    [(_MTLCommandEncoder *)self setObjectVisibleFunctionTable:v8 atBufferIndex:a4];
  }
  else
  {
    [(IOGPUMetalRenderCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
}

- (void)setObjectIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v12[1] = *MEMORY[0x263EF8340];
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    if (length)
    {
      unint64_t v9 = (void *)((char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
      NSUInteger v10 = length;
      do
      {
        uint64_t v11 = (void *)*a3++;
        *v9++ = [v11 visibleFunctionTable];
        --v10;
      }
      while (v10);
    }
    -[_MTLCommandEncoder setObjectVisibleFunctionTables:withBufferRange:](self, "setObjectVisibleFunctionTables:withBufferRange:", (char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  }
  else
  {
    [(IOGPUMetalRenderCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
}

- (void)setMeshIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    uint64_t v8 = [a3 visibleFunctionTable];
    [(_MTLCommandEncoder *)self setMeshVisibleFunctionTable:v8 atBufferIndex:a4];
  }
  else
  {
    [(IOGPUMetalRenderCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
}

- (void)setMeshIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v12[1] = *MEMORY[0x263EF8340];
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    if (length)
    {
      unint64_t v9 = (void *)((char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
      NSUInteger v10 = length;
      do
      {
        uint64_t v11 = (void *)*a3++;
        *v9++ = [v11 visibleFunctionTable];
        --v10;
      }
      while (v10);
    }
    -[_MTLCommandEncoder setMeshVisibleFunctionTables:withBufferRange:](self, "setMeshVisibleFunctionTables:withBufferRange:", (char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  }
  else
  {
    [(IOGPUMetalRenderCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
}

- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    uint64_t v8 = [a3 buffer];
    uint64_t v9 = [a3 bufferOffset];
    [(IOGPUMetalRenderCommandEncoder *)self setVertexBuffer:v8 offset:v9 atIndex:a4];
  }
  else
  {
    [(IOGPUMetalRenderCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
}

- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    uint64_t v8 = [a3 buffer];
    uint64_t v9 = [a3 bufferOffset];
    [(IOGPUMetalRenderCommandEncoder *)self setFragmentBuffer:v8 offset:v9 atIndex:a4];
  }
  else
  {
    [(IOGPUMetalRenderCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
}

- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    uint64_t v8 = [a3 buffer];
    uint64_t v9 = [a3 bufferOffset];
    [(IOGPUMetalRenderCommandEncoder *)self setTileBuffer:v8 offset:v9 atIndex:a4];
  }
  else
  {
    [(IOGPUMetalRenderCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
}

- (void)setObjectAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    uint64_t v8 = [a3 buffer];
    uint64_t v9 = [a3 bufferOffset];
    [(_MTLCommandEncoder *)self setObjectBuffer:v8 offset:v9 atIndex:a4];
  }
  else
  {
    [(IOGPUMetalRenderCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
}

- (void)setMeshAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    uint64_t v8 = [a3 buffer];
    uint64_t v9 = [a3 bufferOffset];
    [(_MTLCommandEncoder *)self setMeshBuffer:v8 offset:v9 atIndex:a4];
  }
  else
  {
    [(IOGPUMetalRenderCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
}

@end