@interface MTLIOMemoryInfo
+ (id)initialize;
- (MTLIOMemoryInfo)init;
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

@implementation MTLIOMemoryInfo

+ (id)initialize
{
  if (initialize_been_here != -1) {
    dispatch_once(&initialize_been_here, &__block_literal_global_11);
  }
  return (id)_memoryInfo;
}

uint64_t __29__MTLIOMemoryInfo_initialize__block_invoke()
{
  _memoryInfo = objc_alloc_init(MTLIOMemoryInfo);
  uint64_t result = [(id)_memoryInfo addDataSource:&__block_literal_global_3];
  *(void *)(_memoryInfo + 8) = result;
  return result;
}

uint64_t __29__MTLIOMemoryInfo_initialize__block_invoke_2()
{
  return [(id)_memoryInfo annotationList];
}

- (__CFArray)annotationList
{
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  fResourceListHead = self->fResourceListHead;
  os_unfair_lock_lock(&self->_memoryInfoLock);
  while (1)
  {
    fResourceListHead = fResourceListHead->next;
    if (fResourceListHead == self->fResourceListHead) {
      break;
    }
    CFArrayRef v5 = [(MTLIOAccelResource *)fResourceListHead copyAnnotations];
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
  [(MTLIOMemoryInfo *)self removeDataSource:self->memlist_key];

  [(MTLIOMemoryInfo *)self dealloc];
}

- (MTLIOMemoryInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTLIOMemoryInfo;
  v2 = [(MTLIOMemoryInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_memoryInfoLock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(MTLIOAccelResource);
    v3->fResourceListHead = v4;
    v4->next = v4;
    v3->fResourceListHead->prev = v3->fResourceListHead;
  }
  return v3;
}

- (void)addResourceToList:(id)a3
{
  p_memoryInfoLock = &self->_memoryInfoLock;
  os_unfair_lock_lock(&self->_memoryInfoLock);
  *((void *)a3 + 35) = self->fResourceListHead;
  *((void *)a3 + 36) = self->fResourceListHead->prev;
  self->fResourceListHead->prev->next = (MTLIOAccelResource *)a3;
  self->fResourceListHead->prev = (MTLIOAccelResource *)a3;

  os_unfair_lock_unlock(p_memoryInfoLock);
}

- (void)removeResourceFromList:(id)a3
{
  p_memoryInfoLock = &self->_memoryInfoLock;
  os_unfair_lock_lock(&self->_memoryInfoLock);
  *(void *)(*((void *)a3 + 35) + 288) = *((void *)a3 + 36);
  *(void *)(*((void *)a3 + 36) + 280) = *((void *)a3 + 35);
  *((void *)a3 + 35) = 0;
  *((void *)a3 + 36) = 0;

  os_unfair_lock_unlock(p_memoryInfoLock);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLIOMemoryInfo;
  [(MTLIOMemoryInfo *)&v3 dealloc];
}

- (void)addDataSource:(id)a3
{
  return (void *)MEMORY[0x1F41248C8](a3, a2);
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