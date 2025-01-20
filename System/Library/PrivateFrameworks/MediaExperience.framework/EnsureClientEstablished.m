@interface EnsureClientEstablished
@end

@implementation EnsureClientEstablished

void __routingContextRemoteXPC_EnsureClientEstablished_block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  gFigRoutingContextRemoteObject_1 = (uint64_t)dispatch_queue_create("com.apple.coremedia.remoteRoutingContext.contextWeakRef", v0);
  if (gFigRoutingContextRemoteObject_1
    && (routingContextRemoteXPC_EnsureClientEstablished_sFigRoutingContextRemoteClientMutex = FigSimpleMutexCreate()) != 0
    && (gFigRoutingContextRemoteObject_0 = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540])) != 0)
  {
    if (!routingContextRemoteXPC_EnsureClientEstablished_err) {
      return;
    }
  }
  else
  {
    routingContextRemoteXPC_EnsureClientEstablished_err = FigSignalErrorAt();
    if (!routingContextRemoteXPC_EnsureClientEstablished_err) {
      return;
    }
  }
  if (gFigRoutingContextRemoteObject_1)
  {
    dispatch_release((dispatch_object_t)gFigRoutingContextRemoteObject_1);
    gFigRoutingContextRemoteObject_1 = 0;
  }
  if (routingContextRemoteXPC_EnsureClientEstablished_sFigRoutingContextRemoteClientMutex)
  {
    FigSimpleMutexDestroy();
    routingContextRemoteXPC_EnsureClientEstablished_sFigRoutingContextRemoteClientMutex = 0;
  }
  if (gFigRoutingContextRemoteObject_0)
  {
    CFRelease((CFTypeRef)gFigRoutingContextRemoteObject_0);
    gFigRoutingContextRemoteObject_0 = 0;
  }
}

void __figRouteDiscovererRemoteXPC_EnsureClientEstablished_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v1 = (id)objc_msgSend(v0, "initWithObjectsAndKeys:", @"RouteDiscoverer_ServerConnectionDied", *MEMORY[0x1E4F22080], 0);
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  figRouteDiscovererRemoteXPC_EnsureClientEstablished_err = FigXPCRemoteClientCreate();
}

uint64_t __remoteSTS_EnsureClientEstablished_block_invoke()
{
  uint64_t result = FigXPCRemoteClientCreate();
  remoteSTS_EnsureClientEstablished_err = result;
  return result;
}

@end