@interface HandleConnectionDemise
@end

@implementation HandleConnectionDemise

void __figXPCConnection_HandleConnectionDemise_block_invoke(uint64_t a1)
{
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 32);
  if (v2) {
    CFDictionaryApplyFunction(v2, (CFDictionaryApplierFunction)figXPCConnection_DeadConnectionObjectApplierFunction, *(void **)(a1 + 40));
  }
  v3 = *(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 16) + 56);
  if (v3) {
    v3();
  }
  DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification(DefaultLocalCenter, @"xpcConnectionNotification_ServerDied", *(const void **)(a1 + 40), 0);
  CFRelease(*(CFTypeRef *)(a1 + 40));
  v5 = *(const void **)(a1 + 32);
  if (v5)
  {
    CFRelease(v5);
  }
}

@end