@interface MTLIOAccelHeap
- (MTLDevice)device;
- (MTLIOAccelHeap)initWithDevice:(id)a3 size:(unint64_t)a4 options:(unint64_t)a5 args:(IOAccelNewResourceArgs *)a6 argsSize:(unsigned int)a7;
- (MTLIOAccelHeap)initWithDevice:(id)a3 size:(unint64_t)a4 options:(unint64_t)a5 args:(IOAccelNewResourceArgs *)a6 argsSize:(unsigned int)a7 desc:(id)a8;
- (id)newAccelerationStructureWithDescriptor:(id)a3;
- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newSubResourceAtOffset:(unint64_t)a3 withLength:(unint64_t)a4 alignment:(unint64_t)a5 options:(unint64_t)a6;
- (id)newSubResourceWithLength:(unint64_t)a3 alignment:(unint64_t)a4 options:(unint64_t)a5 offset:(unint64_t *)a6;
- (unint64_t)currentAllocatedSize;
- (unint64_t)gpuAddress;
- (unint64_t)maxAvailableSizeWithAlignment:(unint64_t)a3;
- (unint64_t)protectionOptions;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (unint64_t)size;
- (unint64_t)usedSize;
- (void)dealloc;
- (void)deallocHeapSubResource;
- (void)unpinMemoryAtOffset:(unint64_t)a3 withLength:(unint64_t)a4;
@end

@implementation MTLIOAccelHeap

- (MTLDevice)device
{
  return self->_device;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)usedSize
{
  if ([(_MTLHeap *)self type]) {
    return 0;
  }
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  unint64_t size = self->_size;
  unint64_t v3 = size - MTLRangeAllocatorGetFreeSize((unsigned int *)&self->_allocator);
  pthread_mutex_unlock(p_mutex);
  return v3;
}

- (unint64_t)maxAvailableSizeWithAlignment:(unint64_t)a3
{
  unsigned int v3 = a3;
  if ([(_MTLHeap *)self type]) {
    return 0;
  }
  pthread_mutex_lock(&self->_mutex);
  unint64_t MaxFreeSize = MTLRangeAllocatorGetMaxFreeSize((unsigned int *)&self->_allocator, v3);
  pthread_mutex_unlock(&self->_mutex);
  return MaxFreeSize;
}

- (MTLIOAccelHeap)initWithDevice:(id)a3 size:(unint64_t)a4 options:(unint64_t)a5 args:(IOAccelNewResourceArgs *)a6 argsSize:(unsigned int)a7
{
  return [(MTLIOAccelHeap *)self initWithDevice:a3 size:a4 options:a5 args:a6 argsSize:*(void *)&a7 desc:0];
}

- (MTLIOAccelHeap)initWithDevice:(id)a3 size:(unint64_t)a4 options:(unint64_t)a5 args:(IOAccelNewResourceArgs *)a6 argsSize:(unsigned int)a7 desc:(id)a8
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
  v20.receiver = self;
  v20.super_class = (Class)MTLIOAccelHeap;
  v16 = [(_MTLHeap *)&v20 initWithType:v15 options:v14];
  if (a8 && [a8 pinnedGPUAddress])
  {
    a6->var0.var14 = [a8 pinnedGPUAddress];
    a6->var0.var15 = [a8 size];
  }
  a6->var0.var13 = [a8 protectionOptions];
  if (v16)
  {
    v17 = [[MTLIOAccelResource alloc] initWithDevice:a3 options:v14 args:a6 argsSize:v9];
    v16->_resource = v17;
    if (v17)
    {
      v16->_device = (MTLDevice *)a3;
      v16->_unint64_t size = a4;
      pthread_mutex_init(&v16->_mutex, 0);
      if (![(_MTLHeap *)v16 type]) {
        MTLRangeAllocatorInit((uint64_t)&v16->_allocator, v16->_size - 1, 0, 0x80uLL);
      }
    }
    else
    {
      v19.receiver = v16;
      v19.super_class = (Class)MTLIOAccelHeap;
      [(_MTLObjectWithLabel *)&v19 dealloc];
      return 0;
    }
  }
  return v16;
}

- (void)dealloc
{
  if (![(_MTLHeap *)self type]) {
    MTLRangeAllocatorDestroy((void **)&self->_allocator.elements);
  }

  self->_device = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelHeap;
  [(_MTLObjectWithLabel *)&v3 dealloc];
}

- (id)newSubResourceWithLength:(unint64_t)a3 alignment:(unint64_t)a4 options:(unint64_t)a5 offset:(unint64_t *)a6
{
  if (self->_size < a3) {
    return 0;
  }
  unsigned __int8 v8 = a5;
  uint64_t v12 = *(void *)&self->_resource->_anon_50[96];
  uint64_t v13 = v12 & 0xF;
  if ((a5 & 0xF) != v13)
  {
    v18 = MTLCPUCacheModeString(a5 & 0xF);
    MTLCPUCacheModeString(v13);
    MTLReportFailure(0, "-[MTLIOAccelHeap newSubResourceWithLength:alignment:options:offset:]", 175, @"The requested CPU cache mode (%@) does not match the heap's mode (%@)", v19, v20, v21, v22, (uint64_t)v18);
    uint64_t v12 = *(void *)&self->_resource->_anon_50[96];
  }
  unint64_t v14 = v8 >> 4;
  if (v14 != 3)
  {
    unint64_t v15 = v12 >> 4;
    if (v14 != v15)
    {
      v23 = MTLStorageModeString(v14);
      MTLStorageModeString(v15);
      MTLReportFailure(0, "-[MTLIOAccelHeap newSubResourceWithLength:alignment:options:offset:]", 184, @"The requested storage mode (%@) is not compatible with the heap's mode (%@)", v24, v25, v26, v27, (uint64_t)v23);
    }
  }
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  if (MTLRangeAllocatorAllocate((uint64_t)&self->_allocator, a3, (uint64_t *)a6, a4)) {
    v6 = self->_resource;
  }
  else {
    v6 = 0;
  }
  pthread_mutex_unlock(p_mutex);
  return v6;
}

- (void)unpinMemoryAtOffset:(unint64_t)a3 withLength:(unint64_t)a4
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  MTLRangeAllocatorDeallocate(&self->_allocator.elements, a3, a4);

  pthread_mutex_unlock(p_mutex);
}

- (void)deallocHeapSubResource
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);

  pthread_mutex_unlock(p_mutex);
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  unint64_t v6 = [(MTLIOAccelResource *)self->_resource setPurgeableState:a3];
  pthread_mutex_unlock(p_mutex);
  return v6;
}

- (unint64_t)currentAllocatedSize
{
  return [(MTLIOAccelResource *)self->_resource allocatedSize];
}

- (id)newSubResourceAtOffset:(unint64_t)a3 withLength:(unint64_t)a4 alignment:(unint64_t)a5 options:(unint64_t)a6
{
  unsigned __int8 v6 = a6;
  uint64_t v11 = *(void *)&self->_resource->_anon_50[96];
  uint64_t v12 = v11 & 0xF;
  if ((a6 & 0xF) != v12)
  {
    v17 = MTLCPUCacheModeString(a6 & 0xF);
    MTLCPUCacheModeString(v12);
    MTLReportFailure(0, "-[MTLIOAccelHeap newSubResourceAtOffset:withLength:alignment:options:]", 255, @"The requested CPU cache mode (%@) does not match the heap's mode (%@)", v18, v19, v20, v21, (uint64_t)v17);
    uint64_t v11 = *(void *)&self->_resource->_anon_50[96];
  }
  unint64_t v13 = v6 >> 4;
  unint64_t v14 = v11 >> 4;
  if (v13 != v14)
  {
    uint64_t v22 = MTLStorageModeString(v13);
    MTLStorageModeString(v14);
    MTLReportFailure(0, "-[MTLIOAccelHeap newSubResourceAtOffset:withLength:alignment:options:]", 260, @"The requested storage mode (%@) is not compatible with the heap's mode (%@)", v23, v24, v25, v26, (uint64_t)v22);
  }
  if (__CFADD__(a3, a4) || a3 + a4 > self->_size || ((a5 | a3) & (a5 - 1)) != 0) {
    return 0;
  }
  resource = self->_resource;

  return resource;
}

- (unint64_t)gpuAddress
{
  return [(MTLIOAccelResource *)self->_resource gpuAddress];
}

- (unint64_t)protectionOptions
{
  return [(MTLIOAccelResource *)self->_resource protectionOptions];
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  if ([(MTLDevice *)self->_device requiresRaytracingEmulation])
  {
    if ([(_MTLHeap *)self storageMode] != 2) {
      MTLReportFailure(0, "-[MTLIOAccelHeap newAccelerationStructureWithSize:]", 294, @"newAccelerationStructureWithSize: Acceleration structure allocation requires MTLResourceStorageModePrivate storage mode", v6, v7, v8, v9, v14);
    }
    uint64_t v10 = [(MTLIOAccelHeap *)self newBufferWithLength:a3 options:[(_MTLHeap *)self resourceOptions]];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      uint64_t v12 = (void *)[(MTLDevice *)self->_device newAccelerationStructureWithBuffer:v10 offset:0];

      return v12;
    }
  }
  else
  {
    [(MTLIOAccelHeap *)self doesNotRecognizeSelector:a2];
  }
  return 0;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  if ([(_MTLHeap *)self storageMode] != 2) {
    MTLReportFailure(0, "-[MTLIOAccelHeap newAccelerationStructureWithDescriptor:]", 306, @"newAccelerationStructureWithDescriptor: Acceleration structure allocation requires MTLResourceStorageModePrivate storage mode", v5, v6, v7, v8, v11);
  }
  uint64_t v9 = [(MTLDevice *)self->_device heapAccelerationStructureSizeAndAlignWithDescriptor:a3];

  return [(MTLIOAccelHeap *)self newAccelerationStructureWithSize:v9];
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4
{
  if ([(MTLDevice *)self->_device requiresRaytracingEmulation])
  {
    if ([(_MTLHeap *)self storageMode] != 2) {
      MTLReportFailure(0, "-[MTLIOAccelHeap newAccelerationStructureWithSize:offset:]", 320, @"newAccelerationStructureWithSize:offset: Acceleration structure allocation requires MTLResourceStorageModePrivate storage mode", v8, v9, v10, v11, v16);
    }
    id v12 = [(_MTLHeap *)self newBufferWithLength:a3 options:[(_MTLHeap *)self resourceOptions] offset:a4];
    if (v12)
    {
      unint64_t v13 = v12;
      uint64_t v14 = (void *)[(MTLDevice *)self->_device newAccelerationStructureWithBuffer:v12 offset:0];

      return v14;
    }
  }
  else
  {
    [(MTLIOAccelHeap *)self doesNotRecognizeSelector:a2];
  }
  return 0;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  if ([(_MTLHeap *)self storageMode] != 2) {
    MTLReportFailure(0, "-[MTLIOAccelHeap newAccelerationStructureWithDescriptor:offset:]", 332, @"newAccelerationStructureWithDescriptor:offset: Acceleration structure allocation requires MTLResourceStorageModePrivate storage mode", v7, v8, v9, v10, v13);
  }
  uint64_t v11 = [(MTLDevice *)self->_device heapAccelerationStructureSizeAndAlignWithDescriptor:a3];

  return [(MTLIOAccelHeap *)self newAccelerationStructureWithSize:v11 offset:a4];
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  if ([(MTLDevice *)self->_device requiresRaytracingEmulation])
  {
    if ([(_MTLHeap *)self storageMode] != 2) {
      MTLReportFailure(0, "-[MTLIOAccelHeap newAccelerationStructureWithSize:resourceIndex:]", 346, @"newAccelerationStructureWithSize:offset:resourceIndex: Acceleration structure allocation requires MTLResourceStorageModePrivate storage mode", v8, v9, v10, v11, v16);
    }
    uint64_t v12 = [(MTLIOAccelHeap *)self newBufferWithLength:a3 options:[(_MTLHeap *)self resourceOptions]];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      uint64_t v14 = (void *)[(MTLDevice *)self->_device newAccelerationStructureWithBuffer:v12 offset:0 resourceIndex:a4];

      return v14;
    }
  }
  else
  {
    [(MTLIOAccelHeap *)self doesNotRecognizeSelector:a2];
  }
  return 0;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  if ([(MTLDevice *)self->_device requiresRaytracingEmulation])
  {
    if ([(_MTLHeap *)self storageMode] != 2) {
      MTLReportFailure(0, "-[MTLIOAccelHeap newAccelerationStructureWithSize:offset:resourceIndex:]", 364, @"newAccelerationStructureWithDescriptor:offset:resourceIndex: Acceleration structure allocation requires MTLResourceStorageModePrivate storage mode", v10, v11, v12, v13, v18);
    }
    id v14 = [(_MTLHeap *)self newBufferWithLength:a3 options:[(_MTLHeap *)self resourceOptions] offset:a4];
    if (v14)
    {
      unint64_t v15 = v14;
      uint64_t v16 = (void *)[(MTLDevice *)self->_device newAccelerationStructureWithBuffer:v14 offset:0 resourceIndex:a5];

      return v16;
    }
  }
  else
  {
    [(MTLIOAccelHeap *)self doesNotRecognizeSelector:a2];
  }
  return 0;
}

@end