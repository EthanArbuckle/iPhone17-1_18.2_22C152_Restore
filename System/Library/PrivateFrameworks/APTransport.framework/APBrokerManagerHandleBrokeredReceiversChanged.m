@interface APBrokerManagerHandleBrokeredReceiversChanged
@end

@implementation APBrokerManagerHandleBrokeredReceiversChanged

void ___APBrokerManagerHandleBrokeredReceiversChanged_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(const void **)(a1 + 40);
  int v6 = 0;
  FigSimpleMutexCheckIsNotLockedOnThisThread();
  pthread_mutex_lock(*(pthread_mutex_t **)(v2 + 96));
  if (*(unsigned char *)(v2 + 104))
  {
    if (gLogCategory_APBrokerManager > 30
      || gLogCategory_APBrokerManager == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_18;
    }
LABEL_13:
    LogPrintF();
LABEL_18:
    pthread_mutex_unlock(*(pthread_mutex_t **)(v2 + 96));
    goto LABEL_7;
  }
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v2 + 112), v3);
  if (!Value)
  {
    if (gLogCategory_APBrokerManager > 30
      || gLogCategory_APBrokerManager == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_18;
    }
    goto LABEL_13;
  }
  CFDictionaryRef v5 = APBrokerGroupCopyReceivers((uint64_t)Value, &v6);
  if (v6) {
    APSLogErrorAt();
  }
  else {
    _APBrokerManagerUpdateBrokerGroupReceiversWithList(v2, v3, (uint64_t)v5);
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)(v2 + 96));
  if (v5) {
    CFRelease(v5);
  }
LABEL_7:
  CFRelease(*(CFTypeRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end