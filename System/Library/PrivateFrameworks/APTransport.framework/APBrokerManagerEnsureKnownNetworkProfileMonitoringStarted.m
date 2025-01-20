@interface APBrokerManagerEnsureKnownNetworkProfileMonitoringStarted
@end

@implementation APBrokerManagerEnsureKnownNetworkProfileMonitoringStarted

void ___APBrokerManagerEnsureKnownNetworkProfileMonitoringStarted_block_invoke(uint64_t a1)
{
  uint64_t v9 = 0;
  FigSimpleMutexCheckIsNotLockedOnThisThread();
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___APBrokerManagerEnsureKnownNetworkProfileMonitoringStarted_block_invoke_2;
  v8[3] = &__block_descriptor_40_e18_v16__0__CWFEvent_8l;
  v8[4] = v2;
  [v3 setEventHandler:v8];
  [*(id *)(*(void *)(a1 + 32) + 16) startMonitoringEventType:30 error:&v9];
  char v4 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "currentKnownNetworkProfile"), "isPublicAirPlayNetwork");
  pthread_mutex_lock(*(pthread_mutex_t **)(*(void *)(a1 + 32) + 96));
  uint64_t v5 = *(void *)(a1 + 32);
  if (v9)
  {
    *(unsigned char *)(v5 + 280) = 0;
    int v6 = 90;
  }
  else
  {
    int v6 = 50;
  }
  *(unsigned char *)(v5 + 281) = v4;
  if (v6 >= gLogCategory_APBrokerManager)
  {
    if (gLogCategory_APBrokerManager != -1 || (v7 = _LogCategory_Initialize(), uint64_t v5 = *(void *)(a1 + 32), v7))
    {
      LogPrintF();
      uint64_t v5 = *(void *)(a1 + 32);
    }
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)(v5 + 96));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t ___APBrokerManagerEnsureKnownNetworkProfileMonitoringStarted_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 type];
  if (result == 30)
  {
    int v5 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "currentKnownNetworkProfile"), "isPublicAirPlayNetwork");
    FigSimpleMutexCheckIsNotLockedOnThisThread();
    pthread_mutex_lock(*(pthread_mutex_t **)(*(void *)(a1 + 32) + 96));
    uint64_t v8 = *(void *)(a1 + 32);
    if (*(unsigned __int8 *)(v8 + 281) != v5)
    {
      if (gLogCategory_APBrokerManager <= 50)
      {
        if (gLogCategory_APBrokerManager != -1 || (int v9 = _LogCategory_Initialize(), v8 = *(void *)(a1 + 32), v9))
        {
          LogPrintF();
          uint64_t v8 = *(void *)(a1 + 32);
        }
      }
      *(unsigned char *)(v8 + 281) = v5;
      _APBrokerManagerUpdateBrowsing(v8, v6, v7);
      uint64_t v8 = *(void *)(a1 + 32);
    }
    v10 = *(pthread_mutex_t **)(v8 + 96);
    return pthread_mutex_unlock(v10);
  }
  else if (gLogCategory_APBrokerManager <= 60)
  {
    if (gLogCategory_APBrokerManager != -1 || (uint64_t result = _LogCategory_Initialize(), result))
    {
      [a2 type];
      return LogPrintF();
    }
  }
  return result;
}

@end