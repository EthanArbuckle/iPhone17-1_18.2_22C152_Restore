@interface __IOGCFastPathClient
- (id)description;
- (void)dealloc;
@end

@implementation __IOGCFastPathClient

- (void)dealloc
{
  clientInterface = self->clientInterface;
  if (clientInterface)
  {
    ((void (*)(IOGCFastPathClientInterface **, SEL))(*clientInterface)->var3)(clientInterface, a2);
    self->clientInterface = 0;
  }
  pluginInterface = self->pluginInterface;
  if (pluginInterface)
  {
    IODestroyPlugInInterface(pluginInterface);
    self->pluginInterface = 0;
  }
  io_object_t service = self->service;
  if (service)
  {
    IOObjectRelease(service);
    self->io_object_t service = 0;
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
    v7.super_class = (Class)__IOGCFastPathClient;
    [(__IOGCFastPathClient *)&v7 dealloc];
  }
}

- (id)description
{
  clientInterface = self->clientInterface;
  if (!clientInterface) {
    return +[NSString stringWithFormat:@"IOGCFastPathClient %#010llx", self->providerID];
  }
  if (!*clientInterface) {
    return +[NSString stringWithFormat:@"IOGCFastPathClient %#010llx", self->providerID];
  }
  var7 = (uint64_t (*)(IOGCFastPathClientInterface **, SEL))(*clientInterface)->var7;
  if (!var7) {
    return +[NSString stringWithFormat:@"IOGCFastPathClient %#010llx", self->providerID];
  }
  v4 = (void *)var7(self->clientInterface, a2);

  return v4;
}

@end