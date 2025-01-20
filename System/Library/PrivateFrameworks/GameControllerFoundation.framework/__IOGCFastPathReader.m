@interface __IOGCFastPathReader
- (id)description;
- (void)dealloc;
@end

@implementation __IOGCFastPathReader

- (void)dealloc
{
  kdebug_trace();
  readerInterface = self->readerInterface;
  if (readerInterface)
  {
    ((void (*)(IOGCFastPathReaderInterface **))(*readerInterface)->var3)(readerInterface);
    self->readerInterface = 0;
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
    v5.super_class = (Class)__IOGCFastPathReader;
    [(__IOGCFastPathReader *)&v5 dealloc];
  }
  kdebug_trace();
}

- (id)description
{
  readerInterface = self->readerInterface;
  if (readerInterface && *readerInterface && (var7 = (uint64_t (*)(void))(*readerInterface)->var7) != 0)
  {
    objc_super v5 = (void *)var7();
    return v5;
  }
  else
  {
    queue = self->queue;
    if (queue)
    {
      unint64_t providerID = queue->client->providerID;
      queue = (__IOGCFastPathInputQueue *)queue->queueID;
    }
    else
    {
      unint64_t providerID = 0;
    }
    return +[NSString stringWithFormat:@"IOGCFastPathReader %#010llx / %#010llx", providerID, queue];
  }
}

@end