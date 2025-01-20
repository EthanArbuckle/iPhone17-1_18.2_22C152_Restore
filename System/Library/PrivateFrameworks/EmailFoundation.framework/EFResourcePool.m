@interface EFResourcePool
- (EFQueue)activeResources;
- (EFResourcePool)initWithCount:(unint64_t)a3;
- (NSMutableSet)inactiveResources;
- (id)acquireResource;
- (unint64_t)uncreatedResourcesCount;
- (void)releaseResource:(id)a3;
- (void)setUncreatedResourcesCount:(unint64_t)a3;
@end

@implementation EFResourcePool

- (void)releaseResource:(id)a3
{
  id v4 = a3;
  [v4 unlock];
  os_unfair_lock_lock(&self->_handleResourceLock);
  if ([v4 returnResource])
  {
    [(EFQueue *)self->_activeResources dequeueObject:v4];
    [(NSMutableSet *)self->_inactiveResources addObject:v4];
  }
  os_unfair_lock_unlock(&self->_handleResourceLock);
}

- (id)acquireResource
{
  p_handleResourceLock = &self->_handleResourceLock;
  os_unfair_lock_lock(&self->_handleResourceLock);
  v5 = [(NSMutableSet *)self->_inactiveResources anyObject];
  if (v5)
  {
    [(NSMutableSet *)self->_inactiveResources removeObject:v5];
  }
  else if (!self->_uncreatedResourcesCount || (v5 = objc_opt_new(), --self->_uncreatedResourcesCount, !v5))
  {
    v5 = [(EFQueue *)self->_activeResources dequeue];
    if (!v5)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"EFResource.m" lineNumber:76 description:@"No active resources in the queue and no uncreated resources."];
    }
  }
  [(EFQueue *)self->_activeResources enqueue:v5];
  [v5 holdResource];
  os_unfair_lock_unlock(p_handleResourceLock);
  [v5 lock];
  return v5;
}

- (EFResourcePool)initWithCount:(unint64_t)a3
{
  if (!a3)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"EFResource.m" lineNumber:44 description:@"Pool should not be initialized with a count of 0"];
  }
  v14.receiver = self;
  v14.super_class = (Class)EFResourcePool;
  v5 = [(EFResourcePool *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v5->_handleResourceLock._os_unfair_lock_opaque = 0;
    v5->_uncreatedResourcesCount = a3;
    uint64_t v7 = +[EFQueue boundedQueueWithCapacity:a3 overflowHandler:&__block_literal_global_26];
    activeResources = v6->_activeResources;
    v6->_activeResources = (EFQueue *)v7;

    uint64_t v9 = objc_opt_new();
    inactiveResources = v6->_inactiveResources;
    v6->_inactiveResources = (NSMutableSet *)v9;
  }
  return v6;
}

void __32__EFResourcePool_initWithCount___block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B00] currentHandler];
  v0 = [NSString stringWithUTF8String:"-[EFResourcePool initWithCount:]_block_invoke"];
  [v1 handleFailureInFunction:v0 file:@"EFResource.m" lineNumber:51 description:@"Queue is over capacity. Active resources in queue should not exceed pool count provided"];
}

- (unint64_t)uncreatedResourcesCount
{
  return self->_uncreatedResourcesCount;
}

- (void)setUncreatedResourcesCount:(unint64_t)a3
{
  self->_uncreatedResourcesCount = a3;
}

- (EFQueue)activeResources
{
  return self->_activeResources;
}

- (NSMutableSet)inactiveResources
{
  return self->_inactiveResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveResources, 0);
  objc_storeStrong((id *)&self->_activeResources, 0);
}

@end