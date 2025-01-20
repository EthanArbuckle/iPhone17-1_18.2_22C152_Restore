@interface __IOGCFastPathInputQueue
- (id)description;
- (void)dealloc;
@end

@implementation __IOGCFastPathInputQueue

- (void)dealloc
{
  kdebug_trace();
  if (self->_dispatchMach)
  {
    dispatch_mach_cancel();
    dispatch_release((dispatch_object_t)self->_dispatchMach);
    self->_dispatchMach = 0;
  }
  id cancelHandler = self->_cancelHandler;
  if (cancelHandler)
  {
    _Block_release(cancelHandler);
    self->_id cancelHandler = 0;
  }
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  queueInterface = self->queueInterface;
  if (queueInterface)
  {
    ((void (*)(IOGCFastPathInputQueueInterface **))(*queueInterface)->var3)(queueInterface);
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
    v7.receiver = self;
    v7.super_class = (Class)__IOGCFastPathInputQueue;
    [(__IOGCFastPathInputQueue *)&v7 dealloc];
  }
  kdebug_trace();
}

- (id)description
{
  queueInterface = self->queueInterface;
  if (queueInterface
    && *queueInterface
    && (var7 = (uint64_t (*)(IOGCFastPathInputQueueInterface **, SEL))(*queueInterface)->var7) != 0)
  {
    v4 = (void *)var7(self->queueInterface, a2);
    return v4;
  }
  else
  {
    client = self->client;
    if (client) {
      client = (__IOGCFastPathClient *)client->providerID;
    }
    return +[NSString stringWithFormat:@"IOGCFastPathInputQueue %#010llx / %#010llx", client, self->queueID];
  }
}

@end