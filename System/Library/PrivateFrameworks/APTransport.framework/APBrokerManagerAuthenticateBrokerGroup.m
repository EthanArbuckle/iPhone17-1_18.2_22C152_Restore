@interface APBrokerManagerAuthenticateBrokerGroup
@end

@implementation APBrokerManagerAuthenticateBrokerGroup

void ___APBrokerManagerAuthenticateBrokerGroup_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  FigSimpleMutexCheckIsNotLockedOnThisThread();
  pthread_mutex_lock(*(pthread_mutex_t **)(v6 + 96));
  if (gLogCategory_APBrokerManager <= 50
    && (gLogCategory_APBrokerManager != -1 || _LogCategory_Initialize()))
  {
    if (a3) {
      IsAppleInternalBuild();
    }
    if (gLogCategory_APBrokerManager == -1) {
      _LogCategory_Initialize();
    }
    LogPrintF();
  }
  *(_DWORD *)(v6 + 216) = a2;
  if (a2 && !FigCFEqual())
  {
    pthread_mutex_unlock(*(pthread_mutex_t **)(v6 + 96));
  }
  else
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    FigCFDictionarySetValueFromKeyInDict();
    _APBrokerManagerCallAuthenticationCallback(v6, *(_DWORD *)(v6 + 216), Mutable, *(void **)(v6 + 208));
    _APBrokerManagerClearAuthCallbackState(v6);
    pthread_mutex_unlock(*(pthread_mutex_t **)(v6 + 96));
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
  v8 = *(const void **)(a1 + 32);
  CFRelease(v8);
}

@end