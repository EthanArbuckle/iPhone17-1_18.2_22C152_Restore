@interface IOGPUMetalIndirectCommandBuffer
- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasResource:(id)a3;
- (BOOL)isAliasable;
- (BOOL)isComplete;
- (IOGPUMetalBuffer)privateICBuffer;
- (IOGPUMetalIndirectCommandBuffer)initWithBuffer:(id)a3 descriptor:(id)a4 maxCommandCount:(unint64_t)a5;
- (MTLIndirectCommandBufferDescriptor)descriptor;
- (id)indirectComputeCommandAtIndex:(unint64_t)a3;
- (id)indirectRenderCommandAtIndex:(unint64_t)a3;
- (unint64_t)commandBufferType;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (unint64_t)size;
- (unint64_t)storageMode;
- (unint64_t)uniqueIdentifier;
- (void)dealloc;
- (void)getHeader:(void *)a3 headerSize:(unint64_t *)a4;
- (void)makeAliasable;
- (void)resetWithRange:(_NSRange)a3;
- (void)uniqueIdentifier;
- (void)waitUntilComplete;
@end

@implementation IOGPUMetalIndirectCommandBuffer

- (IOGPUMetalIndirectCommandBuffer)initWithBuffer:(id)a3 descriptor:(id)a4 maxCommandCount:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)IOGPUMetalIndirectCommandBuffer;
  v8 = -[IOGPUMetalResource initWithResource:](&v14, sel_initWithResource_);
  v8->_privateICBuffer = (IOGPUMetalBuffer *)a3;
  v8->_maxCommandCount = a5;
  v8->_privateIndirectRenderEncoder = 0;
  v8->_privateIndirectComputeEncoder = 0;
  v8->_descriptor = (MTLIndirectCommandBufferDescriptor *)[a4 copy];
  v8->_internalHeader.size = v8->_maxCommandCount;
  v8->_internalHeader.commandTypes = [a4 commandTypes];
  v8->_internalHeader.headerSize = 32;
  v8->_internalHeader.inheritBuffers = [a4 inheritBuffers];
  v8->_internalHeader.inheritPipelineState = [a4 inheritPipelineState];
  v8->_internalHeader.maxFragmentBufferBindCount = [a4 maxFragmentBufferBindCount];
  v8->_internalHeader.maxVertexBufferBindCount = [a4 maxVertexBufferBindCount];
  v8->_internalHeader.maxKernelBufferBindCount = [a4 maxKernelBufferBindCount];
  v8->_internalHeader.maxObjectBufferBindCount = [a4 maxObjectBufferBindCount];
  v8->_internalHeader.maxMeshBufferBindCount = [a4 maxMeshBufferBindCount];
  v8->_internalHeader.supportRayTracing = [a4 supportRayTracing];
  v8->_internalHeader.supportDynamicAttributeStride = [a4 supportDynamicAttributeStride];
  v8->_internalHeader.maxKernelThreadgroupMemoryBindCount = [a4 maxKernelThreadgroupMemoryBindCount];
  v8->_internalHeader.maxObjectThreadgroupMemoryBindCount = [a4 maxObjectThreadgroupMemoryBindCount];
  if ([a3 storageMode] != 2)
  {
    char v9 = [a4 commandTypes];
    v10 = *(void **)&v8->super._anon_50[32];
    privateICBuffer = v8->_privateICBuffer;
    if ((v9 & 0x60) != 0)
    {
      v8->_privateIndirectComputeEncoder = (MTLIndirectComputeCommandEncoder *)[v10 newIndirectComputeCommandEncoderWithBuffer:privateICBuffer];
      uint64_t v12 = 2;
    }
    else
    {
      v8->_privateIndirectRenderEncoder = (MTLIndirectRenderCommandEncoder *)[v10 newIndirectRenderCommandEncoderWithBuffer:privateICBuffer];
      uint64_t v12 = 1;
    }
    v8->_commandBufferType = v12;
  }
  return v8;
}

- (MTLIndirectCommandBufferDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)getHeader:(void *)a3 headerSize:(unint64_t *)a4
{
  if (a3) {
    *a3 = &self->_internalHeader;
  }
  if (a4) {
    *a4 = 32;
  }
}

- (unint64_t)storageMode
{
  return [(IOGPUMetalResource *)self->_privateICBuffer storageMode];
}

- (id)indirectRenderCommandAtIndex:(unint64_t)a3
{
  return (id)[(MTLIndirectRenderCommandEncoder *)self->_privateIndirectRenderEncoder objectAtIndexedSubscript:a3];
}

- (id)indirectComputeCommandAtIndex:(unint64_t)a3
{
  return (id)[(MTLIndirectComputeCommandEncoder *)self->_privateIndirectComputeEncoder objectAtIndexedSubscript:a3];
}

- (void)resetWithRange:(_NSRange)a3
{
  if (a3.location < a3.location + a3.length)
  {
    uint64_t v15 = v8;
    uint64_t v16 = v7;
    uint64_t v17 = v6;
    uint64_t v18 = v5;
    uint64_t v19 = v4;
    uint64_t v20 = v3;
    uint64_t v21 = v9;
    uint64_t v22 = v10;
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    do
    {
      privateIndirectRenderEncoder = self->_privateIndirectRenderEncoder;
      if (!privateIndirectRenderEncoder) {
        privateIndirectRenderEncoder = self->_privateIndirectComputeEncoder;
      }
      objc_msgSend((id)-[MTLIndirectRenderCommandEncoder objectAtIndexedSubscript:](privateIndirectRenderEncoder, "objectAtIndexedSubscript:", location++, v15, v16, v17, v18, v19, v20, v21, v22), "reset");
      --length;
    }
    while (length);
  }
}

- (unint64_t)size
{
  return self->_maxCommandCount;
}

- (unint64_t)commandBufferType
{
  return self->_commandBufferType;
}

- (void)dealloc
{
  privateIndirectComputeEncoder = self->_privateIndirectComputeEncoder;
  if (privateIndirectComputeEncoder) {

  }
  privateIndirectRenderEncoder = self->_privateIndirectRenderEncoder;
  if (privateIndirectRenderEncoder) {

  }
  v5.receiver = self;
  v5.super_class = (Class)IOGPUMetalIndirectCommandBuffer;
  [(IOGPUMetalResource *)&v5 dealloc];
}

- (unint64_t)uniqueIdentifier
{
  unint64_t result = [(IOGPUMetalResource *)self->_privateICBuffer gpuAddress];
  if (!result) {
    -[IOGPUMetalIndirectCommandBuffer uniqueIdentifier]();
  }
  return result;
}

- (IOGPUMetalBuffer)privateICBuffer
{
  return self->_privateICBuffer;
}

- (BOOL)isAliasable
{
  return 0;
}

- (void)makeAliasable
{
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  return [(IOGPUMetalResource *)self->_privateICBuffer setPurgeableState:a3];
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  return [(IOGPUMetalResource *)self->_privateICBuffer doesAliasAllResources:a3 count:a4];
}

- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4
{
  return [(IOGPUMetalResource *)self->_privateICBuffer doesAliasAnyResources:a3 count:a4];
}

- (BOOL)doesAliasResource:(id)a3
{
  return [(IOGPUMetalResource *)self->_privateICBuffer doesAliasResource:a3];
}

- (BOOL)isComplete
{
  return [(IOGPUMetalResource *)self->_privateICBuffer isComplete];
}

- (void)waitUntilComplete
{
}

- (void)uniqueIdentifier
{
}

@end