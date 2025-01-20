@interface AXBroadcastEventProcessNotification
@end

@implementation AXBroadcastEventProcessNotification

void ___AXBroadcastEventProcessNotification_block_invoke_2(uint64_t a1)
{
  AXBroadcastNotificationToAllClients(*(_DWORD *)(a1 + 48), *(void *)(a1 + 32), *(CFTypeRef *)(a1 + 40));
  v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
  }
}

void ___AXBroadcastEventProcessNotification_block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("rebroadcast-ax-notify", v2);
  v1 = (void *)_AXBroadcastEventProcessNotification_replayQueue;
  _AXBroadcastEventProcessNotification_replayQueue = (uint64_t)v0;
}

@end