@interface IOGPUMemoryInfo
+ (id)initialize;
- (IOGPUMemoryInfo)init;
- (__CFArray)annotationList;
- (void)addDataSource:(id)a3;
- (void)addResourceToList:(id)a3;
- (void)dealloc;
- (void)lock;
- (void)removeDataSource:(void *)a3;
- (void)removeResourceFromList:(id)a3;
- (void)shutdown;
- (void)unlock;
@end

@implementation IOGPUMemoryInfo

- (void)addResourceToList:(id)a3
{
  p_memoryInfoLock = &self->_memoryInfoLock;
  os_unfair_lock_lock(&self->_memoryInfoLock);
  *((void *)a3 + 32) = self->fResourceListHead;
  *((void *)a3 + 33) = self->fResourceListHead->prev;
  self->fResourceListHead->prev->next = (IOGPUMetalResource *)a3;
  self->fResourceListHead->prev = (IOGPUMetalResource *)a3;
  os_unfair_lock_unlock(p_memoryInfoLock);
}

- (void)removeResourceFromList:(id)a3
{
  p_memoryInfoLock = &self->_memoryInfoLock;
  os_unfair_lock_lock(&self->_memoryInfoLock);
  *(void *)(*((void *)a3 + 32) + 264) = *((void *)a3 + 33);
  *(void *)(*((void *)a3 + 33) + 256) = *((void *)a3 + 32);
  *((void *)a3 + 32) = 0;
  *((void *)a3 + 33) = 0;
  os_unfair_lock_unlock(p_memoryInfoLock);
}

+ (id)initialize
{
  if (initialize_been_here != -1) {
    dispatch_once(&initialize_been_here, &__block_literal_global_2);
  }
  return (id)_ioGPUMemoryInfo;
}

uint64_t __29__IOGPUMemoryInfo_initialize__block_invoke()
{
  _ioGPUMemoryInfo = objc_alloc_init(IOGPUMemoryInfo);
  uint64_t result = [(id)_ioGPUMemoryInfo addDataSource:&__block_literal_global_3_0];
  *(void *)(_ioGPUMemoryInfo + 8) = result;
  return result;
}

- (IOGPUMemoryInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)IOGPUMemoryInfo;
  v2 = [(IOGPUMemoryInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_memoryInfoLock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(IOGPUMetalResource);
    v3->fResourceListHead = v4;
    v4->next = v4;
    v3->fResourceListHead->prev = v3->fResourceListHead;
  }
  return v3;
}

- (void)addDataSource:(id)a3
{
  return (void *)MEMORY[0x270F3D2B0](a3, a2);
}

uint64_t __29__IOGPUMemoryInfo_initialize__block_invoke_2()
{
  return [(id)_ioGPUMemoryInfo annotationList];
}

- (__CFArray)annotationList
{
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  fResourceListHead = self->fResourceListHead;
  os_unfair_lock_lock(&self->_memoryInfoLock);
  while (1)
  {
    fResourceListHead = fResourceListHead->next;
    if (fResourceListHead == self->fResourceListHead) {
      break;
    }
    CFArrayRef v5 = [(IOGPUMetalResource *)fResourceListHead copyAnnotations];
    if (v5)
    {
      CFArrayRef v6 = v5;
      v8.length = CFArrayGetCount(v5);
      v8.location = 0;
      CFArrayAppendArray(Mutable, v6, v8);
      CFRelease(v6);
    }
  }
  os_unfair_lock_unlock(&self->_memoryInfoLock);
  return Mutable;
}

- (void)shutdown
{
  [(IOGPUMemoryInfo *)self removeDataSource:self->memlist_key];
  [(IOGPUMemoryInfo *)self dealloc];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMemoryInfo;
  [(IOGPUMemoryInfo *)&v3 dealloc];
}

- (void)removeDataSource:(void *)a3
{
}

- (void)lock
{
}

- (void)unlock
{
}

@end