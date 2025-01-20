@interface AXAddNotificationObserver
@end

@implementation AXAddNotificationObserver

void ___AXAddNotificationObserver_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = CFDictionaryGetValue((CFDictionaryRef)ObserverDictionary, (const void *)*(int *)(a1 + 40));
  if (!v2)
  {
    v2 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA48]) init];
    CFDictionarySetValue((CFMutableDictionaryRef)ObserverDictionary, (const void *)*(int *)(a1 + 40), v2);
  }
  v3 = (void *)[objc_allocWithZone((Class)AXObserverElementPair) initWithObserver:*(void *)(a1 + 32)];
  v4 = AXRuntimeLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(_DWORD *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 1024;
    int v10 = v6;
    _os_log_impl(&dword_1BA657000, v4, OS_LOG_TYPE_INFO, "Adding observer for %@ -> %d", (uint8_t *)&v7, 0x12u);
  }

  if (([v2 containsObject:v3] & 1) == 0) {
    [v2 addObject:v3];
  }
}

@end