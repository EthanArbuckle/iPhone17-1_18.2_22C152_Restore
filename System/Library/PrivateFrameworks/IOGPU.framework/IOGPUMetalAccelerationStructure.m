@interface IOGPUMetalAccelerationStructure
- (BOOL)isAliasable;
- (IOGPUMetalAccelerationStructure)initWithBuffer:(id)a3 offset:(unint64_t)a4;
- (IOGPUMetalAccelerationStructure)initWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (MTLAccelerationStructureDescriptor)descriptor;
- (MTLBuffer)buffer;
- (MTLHeap)heap;
- (unint64_t)accelerationStructureUniqueIdentifier;
- (unint64_t)allocatedSize;
- (unint64_t)bufferOffset;
- (unint64_t)heapOffset;
- (unint64_t)resourceIndex;
- (unint64_t)size;
- (unint64_t)uniqueIdentifier;
- (void)copyPropertiesFromBuffer:(id)a3;
- (void)dealloc;
- (void)makeAliasable;
- (void)setDescriptor:(id)a3;
@end

@implementation IOGPUMetalAccelerationStructure

- (unint64_t)uniqueIdentifier
{
  return [(MTLBuffer *)self->_buffer gpuAddress];
}

- (unint64_t)accelerationStructureUniqueIdentifier
{
  return [(MTLBuffer *)self->_buffer gpuAddress];
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

- (unint64_t)bufferOffset
{
  return self->_bufferOffset;
}

- (unint64_t)size
{
  return [(MTLBuffer *)self->_buffer length];
}

- (MTLHeap)heap
{
  return (MTLHeap *)[(MTLBuffer *)self->_buffer heap];
}

- (unint64_t)heapOffset
{
  return [(MTLBuffer *)self->_buffer heapOffset];
}

- (unint64_t)allocatedSize
{
  return [(MTLBuffer *)self->_buffer allocatedSize];
}

- (void)makeAliasable
{
}

- (BOOL)isAliasable
{
  return [(MTLBuffer *)self->_buffer isAliasable];
}

- (void)copyPropertiesFromBuffer:(id)a3
{
  v4 = (char *)a3 + 32;
  id v5 = *((id *)a3 + 27);
  uint64_t v6 = *((void *)v4 + 24);
  *(void *)&self->super._anon_50[136] = v5;
  *(void *)&self->super._anon_50[144] = v6;
  *(_OWORD *)&self->super._anon_50[152] = *(_OWORD *)(v4 + 200);
  self->super._anon_50[168] = v4[216];
  *(void *)&self->super._anon_50[24] = *((void *)v4 + 9);
  *(void *)&self->super._anon_50[80] = *((void *)v4 + 16);
}

- (IOGPUMetalAccelerationStructure)initWithBuffer:(id)a3 offset:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)IOGPUMetalAccelerationStructure;
  uint64_t v6 = -[IOGPUMetalResource initWithResource:](&v8, sel_initWithResource_);
  if (v6)
  {
    v6->_buffer = (MTLBuffer *)a3;
    v6->_bufferOffset = a4;
    [(IOGPUMetalAccelerationStructure *)v6 copyPropertiesFromBuffer:a3];
  }
  return v6;
}

- (IOGPUMetalAccelerationStructure)initWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)IOGPUMetalAccelerationStructure;
  objc_super v8 = -[IOGPUMetalResource initWithResource:](&v10, sel_initWithResource_);
  if (v8)
  {
    v8->_buffer = (MTLBuffer *)a3;
    v8->_bufferOffset = a4;
    v8->_resourceIndex = a5;
    [(IOGPUMetalAccelerationStructure *)v8 copyPropertiesFromBuffer:a3];
  }
  return v8;
}

- (void)dealloc
{
  *(void *)&self->super._anon_50[136] = 0;
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalAccelerationStructure;
  [(IOGPUMetalResource *)&v3 dealloc];
}

- (MTLAccelerationStructureDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (unint64_t)resourceIndex
{
  return self->_resourceIndex;
}

@end