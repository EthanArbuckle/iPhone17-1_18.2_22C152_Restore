@interface AXRemoveNotificationObserver
@end

@implementation AXRemoveNotificationObserver

void ___AXRemoveNotificationObserver_block_invoke(uint64_t a1)
{
  CFDictionaryGetValue((CFDictionaryRef)ObserverDictionary, (const void *)*(int *)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v2 = (void *)[objc_allocWithZone((Class)AXObserverElementPair) initWithObserver:*(void *)(a1 + 32)];
    [v3 removeObject:v2];
  }
}

@end