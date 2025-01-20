@interface __IOGCFastPathControlQueue
- (id)description;
- (void)dealloc;
@end

@implementation __IOGCFastPathControlQueue

- (void)dealloc
{
  queueInterface = self->queueInterface;
  if (queueInterface)
  {
    (*((void (**)(IOGCFastPathControlQueueInterface **, SEL))*queueInterface + 3))(queueInterface, a2);
    self->queueInterface = 0;
  }

  allocator = self->allocator;
  if (allocator)
  {
    objc_destructInstance(self);
    CFAllocatorDeallocate(allocator, self);
    CFRelease(allocator);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)__IOGCFastPathControlQueue;
    [(__IOGCFastPathControlQueue *)&v5 dealloc];
  }
}

- (id)description
{
  queueInterface = self->queueInterface;
  if (queueInterface && *queueInterface && (v4 = (uint64_t (*)(void))*((void *)*queueInterface + 5)) != 0)
  {
    objc_super v5 = (void *)v4();
    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)__IOGCFastPathControlQueue;
    return [(__IOGCFastPathControlQueue *)&v7 description];
  }
}

@end