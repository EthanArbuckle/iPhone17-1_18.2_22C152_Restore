@interface IOGPUMetalHeap
- (BOOL)detachBacking;
- (BOOL)replaceBackingWithRanges:(id)a3 readOnly:(BOOL)a4;
- (IOGPUMetalHeap)initWithDevice:(id)a3 size:(unint64_t)a4 options:(unint64_t)a5 args:(IOGPUNewResourceArgs *)a6 argsSize:(unsigned int)a7;
- (IOGPUMetalHeap)initWithDevice:(id)a3 size:(unint64_t)a4 options:(unint64_t)a5 args:(IOGPUNewResourceArgs *)a6 argsSize:(unsigned int)a7 desc:(id)a8;
- (MTLDevice)device;
- (id)newAccelerationStructureWithDescriptor:(id)a3;
- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newSubResourceAtOffset:(unint64_t)a3 withLength:(unint64_t)a4 alignment:(unint64_t)a5 options:(unint64_t)a6;
- (id)newSubResourceWithLength:(unint64_t)a3 alignment:(unint64_t)a4 options:(unint64_t)a5 offset:(unint64_t *)a6;
- (unint64_t)currentAllocatedSize;
- (unint64_t)globalTraceObjectID;
- (unint64_t)gpuAddress;
- (unint64_t)maxAvailableSizeWithAlignment:(unint64_t)a3;
- (unint64_t)protectionOptions;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (unint64_t)size;
- (unint64_t)usedSize;
- (void)dealloc;
- (void)deallocHeapSubResource;
- (void)setLabel:(id)a3;
- (void)unpinMemoryAtOffset:(unint64_t)a3 withLength:(unint64_t)a4;
@end

@implementation IOGPUMetalHeap

- (unint64_t)maxAvailableSizeWithAlignment:(unint64_t)a3
{
  if ((a3 & (a3 - 1)) != 0) {
    -[IOGPUMetalHeap maxAvailableSizeWithAlignment:]();
  }
  if ([(_MTLHeap *)self type]) {
    return 0;
  }
  pthread_mutex_lock(&self->_mutex);
  unint64_t MaxFreeSize = MTLRangeAllocatorGetMaxFreeSize();
  pthread_mutex_unlock(&self->_mutex);
  return MaxFreeSize;
}

- (void)unpinMemoryAtOffset:(unint64_t)a3 withLength:(unint64_t)a4
{
  if ([(_MTLHeap *)self type]) {
    -[IOGPUMetalHeap unpinMemoryAtOffset:withLength:]();
  }
  pthread_mutex_lock(&self->_mutex);
  MTLRangeAllocatorDeallocate();
  pthread_mutex_unlock(&self->_mutex);
}

- (id)newSubResourceWithLength:(unint64_t)a3 alignment:(unint64_t)a4 options:(unint64_t)a5 offset:(unint64_t *)a6
{
  unsigned __int8 v6 = a5;
  if ([(_MTLHeap *)self type]) {
    -[IOGPUMetalHeap newSubResourceWithLength:alignment:options:offset:]();
  }
  if (self->_size < a3) {
    return 0;
  }
  uint64_t v10 = *(void *)&self->_resource->_anon_50[88];
  if ((v6 & 0xF) != (unint64_t)(v10 & 0xF))
  {
    MTLCPUCacheModeString();
    MTLCPUCacheModeString();
    MTLReportFailure();
    uint64_t v10 = *(void *)&self->_resource->_anon_50[88];
  }
  uint64_t v11 = v6 >> 4;
  if (v11 != 3 && v11 != v10 >> 4)
  {
    MTLStorageModeString();
    MTLStorageModeString();
    MTLReportFailure();
  }
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  if (MTLRangeAllocatorAllocate()) {
    v9 = self->_resource;
  }
  else {
    v9 = 0;
  }
  pthread_mutex_unlock(p_mutex);
  return v9;
}

- (void)deallocHeapSubResource
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);

  pthread_mutex_unlock(p_mutex);
}

- (MTLDevice)device
{
  return self->_device;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)protectionOptions
{
  return [(IOGPUMetalResource *)self->_resource protectionOptions];
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  unint64_t v6 = [(IOGPUMetalResource *)self->_resource setPurgeableState:a3];
  pthread_mutex_unlock(p_mutex);
  return v6;
}

- (IOGPUMetalHeap)initWithDevice:(id)a3 size:(unint64_t)a4 options:(unint64_t)a5 args:(IOGPUNewResourceArgs *)a6 argsSize:(unsigned int)a7 desc:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  if ((a5 & 0x300) != 0) {
    unint64_t v14 = a5;
  }
  else {
    unint64_t v14 = a5 & 0xFFFFFFFFFFFFFCFFLL | 0x100;
  }
  if (a8) {
    uint64_t v15 = [a8 type];
  }
  else {
    uint64_t v15 = 0;
  }
  v22.receiver = self;
  v22.super_class = (Class)IOGPUMetalHeap;
  v16 = [(_MTLHeap *)&v22 initWithType:v15 options:v14];
  a6->var0.var11 = [a8 protectionOptions];
  if ((a6->var0.var0 & 0xF) == 0 && [a8 memoryPoolId])
  {
    a6->var0.var10 |= 0x100000u;
    a6->var0.var16.var0.var3.var1 = [a8 memoryPoolId];
  }
  uint64_t v17 = [a8 addressRanges];
  if (v17)
  {
    v18 = (void *)v17;
    if ([a8 memoryPoolId]) {
      MTLReportFailure();
    }
    a6->var0.var0 = 128;
    a6->var0.var16.var0.var0 = [v18 ranges];
    a6->var0.var16.var0.var1 = [v18 count];
    a6->var0.var10 |= 0x200000u;
  }
  if (v16)
  {
    v19 = [[IOGPUMetalResource alloc] initWithDevice:a3 options:v14 args:a6 argsSize:v9];
    v16->_resource = v19;
    if (v19)
    {
      v16->_device = (MTLDevice *)a3;
      v16->_size = a4;
      [(IOGPUMetalResource *)v16->_resource setLabel:@"IOGPUMetalHeap"];
      pthread_mutex_init(&v16->_mutex, 0);
      if (![(_MTLHeap *)v16 type]) {
        MTLRangeAllocatorInit();
      }
    }
    else
    {
      v21.receiver = v16;
      v21.super_class = (Class)IOGPUMetalHeap;
      [(_MTLObjectWithLabel *)&v21 dealloc];
      return 0;
    }
  }
  return v16;
}

- (void)dealloc
{
  if (![(_MTLHeap *)self type]) {
    MTLRangeAllocatorDestroy();
  }

  self->_device = 0;
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalHeap;
  [(_MTLObjectWithLabel *)&v3 dealloc];
}

- (unint64_t)usedSize
{
  if ([(_MTLHeap *)self type]) {
    return 0;
  }
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  unint64_t size = self->_size;
  unint64_t v3 = size - MTLRangeAllocatorGetFreeSize();
  pthread_mutex_unlock(p_mutex);
  return v3;
}

- (unint64_t)globalTraceObjectID
{
  return *(void *)&self->_resource->_anon_50[48];
}

- (IOGPUMetalHeap)initWithDevice:(id)a3 size:(unint64_t)a4 options:(unint64_t)a5 args:(IOGPUNewResourceArgs *)a6 argsSize:(unsigned int)a7
{
  return [(IOGPUMetalHeap *)self initWithDevice:a3 size:a4 options:a5 args:a6 argsSize:*(void *)&a7 desc:0];
}

- (void)setLabel:(id)a3
{
  v5 = (void *)MEMORY[0x21D4AEE90](self, a2);
  -[IOGPUMetalResource setLabel:](self->_resource, "setLabel:", [@"IOGPUMetalHeap" stringByAppendingFormat:@", \"%@\"", a3]);
  v6.receiver = self;
  v6.super_class = (Class)IOGPUMetalHeap;
  [(_MTLObjectWithLabel *)&v6 setLabel:a3];
}

- (unint64_t)currentAllocatedSize
{
  return [(IOGPUMetalResource *)self->_resource allocatedSize];
}

- (id)newSubResourceAtOffset:(unint64_t)a3 withLength:(unint64_t)a4 alignment:(unint64_t)a5 options:(unint64_t)a6
{
  unsigned __int8 v6 = a6;
  if ([(_MTLHeap *)self type] != 1) {
    -[IOGPUMetalHeap newSubResourceAtOffset:withLength:alignment:options:]();
  }
  uint64_t v11 = *(void *)&self->_resource->_anon_50[88];
  if ((v6 & 0xF) != (unint64_t)(v11 & 0xF))
  {
    MTLCPUCacheModeString();
    MTLCPUCacheModeString();
    MTLReportFailure();
    uint64_t v11 = *(void *)&self->_resource->_anon_50[88];
  }
  if (v6 >> 4 != (unint64_t)(v11 >> 4))
  {
    MTLStorageModeString();
    MTLStorageModeString();
    MTLReportFailure();
  }
  if (__CFADD__(a3, a4) || a3 + a4 > self->_size || ((a5 | a3) & (a5 - 1)) != 0) {
    return 0;
  }
  resource = self->_resource;
  return resource;
}

- (unint64_t)gpuAddress
{
  return [(IOGPUMetalResource *)self->_resource gpuAddress];
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  if ([(MTLDevice *)self->_device requiresRaytracingEmulation])
  {
    if ([(_MTLHeap *)self storageMode] != 2) {
      MTLReportFailure();
    }
    uint64_t v6 = [(IOGPUMetalHeap *)self newBufferWithLength:a3 options:[(_MTLHeap *)self resourceOptions]];
    if (v6)
    {
      v7 = (void *)v6;
      v8 = (void *)[(MTLDevice *)self->_device newAccelerationStructureWithBuffer:v6 offset:0];

      return v8;
    }
  }
  else
  {
    [(IOGPUMetalHeap *)self doesNotRecognizeSelector:a2];
  }
  return 0;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  if ([(MTLDevice *)self->_device requiresRaytracingEmulation])
  {
    if ([(_MTLHeap *)self storageMode] != 2) {
      MTLReportFailure();
    }
    uint64_t v6 = [(MTLDevice *)self->_device heapAccelerationStructureSizeAndAlignWithDescriptor:a3];
    return [(IOGPUMetalHeap *)self newAccelerationStructureWithSize:v6];
  }
  else
  {
    [(IOGPUMetalHeap *)self doesNotRecognizeSelector:a2];
    return 0;
  }
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4
{
  if ([(MTLDevice *)self->_device requiresRaytracingEmulation])
  {
    if ([(_MTLHeap *)self storageMode] != 2) {
      MTLReportFailure();
    }
    id v8 = [(_MTLHeap *)self newBufferWithLength:a3 options:[(_MTLHeap *)self resourceOptions] offset:a4];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = (void *)[(MTLDevice *)self->_device newAccelerationStructureWithBuffer:v8 offset:0];

      return v10;
    }
  }
  else
  {
    [(IOGPUMetalHeap *)self doesNotRecognizeSelector:a2];
  }
  return 0;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  if ([(MTLDevice *)self->_device requiresRaytracingEmulation])
  {
    if ([(_MTLHeap *)self storageMode] != 2) {
      MTLReportFailure();
    }
    uint64_t v8 = [(MTLDevice *)self->_device heapAccelerationStructureSizeAndAlignWithDescriptor:a3];
    return [(IOGPUMetalHeap *)self newAccelerationStructureWithSize:v8 offset:a4];
  }
  else
  {
    [(IOGPUMetalHeap *)self doesNotRecognizeSelector:a2];
    return 0;
  }
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  if ([(MTLDevice *)self->_device requiresRaytracingEmulation])
  {
    if ([(_MTLHeap *)self storageMode] != 2) {
      MTLReportFailure();
    }
    uint64_t v8 = [(IOGPUMetalHeap *)self newBufferWithLength:a3 options:[(_MTLHeap *)self resourceOptions]];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = (void *)[(MTLDevice *)self->_device newAccelerationStructureWithBuffer:v8 offset:0 resourceIndex:a4];

      return v10;
    }
  }
  else
  {
    [(IOGPUMetalHeap *)self doesNotRecognizeSelector:a2];
  }
  return 0;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  if ([(MTLDevice *)self->_device requiresRaytracingEmulation])
  {
    if ([(_MTLHeap *)self storageMode] != 2) {
      MTLReportFailure();
    }
    id v10 = [(_MTLHeap *)self newBufferWithLength:a3 options:[(_MTLHeap *)self resourceOptions] offset:a4];
    if (v10)
    {
      uint64_t v11 = v10;
      v12 = (void *)[(MTLDevice *)self->_device newAccelerationStructureWithBuffer:v10 offset:0 resourceIndex:a5];

      return v12;
    }
  }
  else
  {
    [(IOGPUMetalHeap *)self doesNotRecognizeSelector:a2];
  }
  return 0;
}

- (BOOL)detachBacking
{
  return IOGPUResourceDetachBacking((uint64_t)[(IOGPUMetalResource *)self->_resource resourceRef]) == 0;
}

- (BOOL)replaceBackingWithRanges:(id)a3 readOnly:(BOOL)a4
{
  return IOGPUResourceReplaceBackingWithRanges((uint64_t)-[IOGPUMetalResource resourceRef](self->_resource, "resourceRef"), [a3 ranges], objc_msgSend(a3, "count"), a4, 0, 0) == 0;
}

- (void)maxAvailableSizeWithAlignment:.cold.1()
{
}

- (void)newSubResourceWithLength:alignment:options:offset:.cold.1()
{
  __assert_rtn("-[IOGPUMetalHeap newSubResourceWithLength:alignment:options:offset:]", "IOGPUMetalHeap.m", 195, "self.type == MTLHeapTypeAutomatic && \"Automatic suballocation only supported on automatic heap type\"");
}

- (void)unpinMemoryAtOffset:withLength:.cold.1()
{
  __assert_rtn("-[IOGPUMetalHeap unpinMemoryAtOffset:withLength:]", "IOGPUMetalHeap.m", 238, "self.type == MTLHeapTypeAutomatic && \"Automatic suballocation only supported on automatic heap type\"");
}

- (void)newSubResourceAtOffset:withLength:alignment:options:.cold.1()
{
  __assert_rtn("-[IOGPUMetalHeap newSubResourceAtOffset:withLength:alignment:options:]", "IOGPUMetalHeap.m", 278, "self.type == MTLHeapTypePlacement && \"Placement suballocation only supported on placement heap type\"");
}

@end