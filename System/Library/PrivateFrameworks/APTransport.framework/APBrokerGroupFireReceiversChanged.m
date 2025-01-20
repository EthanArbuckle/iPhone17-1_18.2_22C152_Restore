@interface APBrokerGroupFireReceiversChanged
@end

@implementation APBrokerGroupFireReceiversChanged

void ___APBrokerGroupFireReceiversChanged_block_invoke(uint64_t a1)
{
  pthread_mutex_lock(*(pthread_mutex_t **)(*(void *)(a1 + 32) + 24));
  int v2 = *(_DWORD *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(_DWORD *)(v3 + 88);
  pthread_mutex_unlock(*(pthread_mutex_t **)(v3 + 24));
  if (v2 == v4)
  {
    if (gLogCategory_APBrokerGroup <= 30
      && (gLogCategory_APBrokerGroup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(void, void))(a1 + 40))(*(void *)(a1 + 32), *(void *)(a1 + 48));
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
  v5 = *(const void **)(a1 + 48);
  if (v5)
  {
    CFRelease(v5);
  }
}

@end