@interface APBrokerManagerGetInfoFromBrokerGroup
@end

@implementation APBrokerManagerGetInfoFromBrokerGroup

void ___APBrokerManagerGetInfoFromBrokerGroup_block_invoke(uint64_t a1, int a2, const void *a3, const void *a4)
{
  uint64_t v8 = *(void *)(a1 + 32);
  FigSimpleMutexCheckIsNotLockedOnThisThread();
  pthread_mutex_lock(*(pthread_mutex_t **)(v8 + 96));
  if (gLogCategory_APBrokerManager > 50
    || gLogCategory_APBrokerManager == -1 && !_LogCategory_Initialize())
  {
    if (a2) {
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  if (a3) {
    IsAppleInternalBuild();
  }
  if (gLogCategory_APBrokerManager == -1) {
    _LogCategory_Initialize();
  }
  LogPrintF();
  if (!a2)
  {
LABEL_12:
    Mutable = *(__CFDictionary **)(v8 + 264);
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      *(void *)(v8 + 264) = Mutable;
    }
    CFDictionarySetValue(Mutable, a3, a4);
  }
LABEL_15:
  if (FigCFEqual())
  {
    _APBrokerManagerCallGetInfoCallback(v8, a2, *(void *)(v8 + 264), *(const void **)(v8 + 248));
    _APBrokerManagerClearGetInfoCallbackState(v8);
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)(v8 + 96));
  v10 = *(const void **)(a1 + 32);
  CFRelease(v10);
}

@end