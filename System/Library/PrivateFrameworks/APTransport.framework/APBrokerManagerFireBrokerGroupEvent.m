@interface APBrokerManagerFireBrokerGroupEvent
@end

@implementation APBrokerManagerFireBrokerGroupEvent

void ___APBrokerManagerFireBrokerGroupEvent_block_invoke(uint64_t a1)
{
  pthread_mutex_lock(*(pthread_mutex_t **)(*(void *)(a1 + 32) + 96));
  int v2 = *(_DWORD *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(_DWORD *)(v3 + 200);
  pthread_mutex_unlock(*(pthread_mutex_t **)(v3 + 96));
  if (v2 == v4) {
    (*(void (**)(void, void, void))(a1 + 40))(*(void *)(a1 + 32), *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  v5 = *(const void **)(a1 + 56);
  if (v5)
  {
    CFRelease(v5);
  }
}

@end