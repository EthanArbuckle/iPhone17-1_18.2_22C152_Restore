@interface APTNANDataSessionInvalidate
@end

@implementation APTNANDataSessionInvalidate

void ___APTNANDataSessionInvalidate_block_invoke(void *a1)
{
  pthread_mutex_lock(*(pthread_mutex_t **)(a1[5] + 40));
  v2 = *(void **)(a1[5] + 56);
  if (v2 == (void *)a1[6])
  {

    uint64_t v3 = a1[5];
    *(void *)(v3 + 56) = 0;
    if (*(_DWORD *)(v3 + 64))
    {
      *(void *)(*(void *)(a1[4] + 8) + 24) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      if (*(void *)(*(void *)(a1[4] + 8) + 24))
      {
        CFDictionarySetInt64();
      }
      else if (gLogCategory_APTNANDataSession <= 90 {
             && (gLogCategory_APTNANDataSession != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF();
      }
    }
    CMNotificationCenterGetDefaultLocalCenter();
    FigDispatchAsyncPostNotification();
  }
  else if (gLogCategory_APTNANDataSession <= 50 {
         && (gLogCategory_APTNANDataSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1[5] + 40));
  v4 = *(const void **)(*(void *)(a1[4] + 8) + 24);
  if (v4) {
    CFRelease(v4);
  }
  v5 = (const void *)a1[7];
  CFRelease(v5);
}

@end