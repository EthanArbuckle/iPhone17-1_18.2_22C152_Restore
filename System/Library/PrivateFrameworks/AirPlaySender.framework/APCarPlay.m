@interface APCarPlay
@end

@implementation APCarPlay

intptr_t __APCarPlay_AddSignPostTimeInfoToTimeStore_block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    if (!IsAppleInternalBuild()) {
      goto LABEL_12;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = mach_absolute_time();
    if (gLogCategory_APCarPlayCarServicesInterface > 50
      || gLogCategory_APCarPlayCarServicesInterface == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_12;
    }
    UpTicksToMilliseconds();
LABEL_8:
    LogPrintF();
    goto LABEL_12;
  }
  if (gLogCategory_APCarPlayCarServicesInterface <= 90
    && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_8;
  }
LABEL_12:
  v3 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v3);
}

intptr_t __APCarPlay_CRFetchInstrumentClusterURLs_block_invoke(void *a1, const void *a2, void *a3)
{
  if ([a3 code])
  {
    if (gLogCategory_APCarPlayCarServicesInterface <= 90
      && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = [a3 localizedDescription];
      LogPrintF();
    }
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = objc_msgSend(a3, "code", v8);
  }
  else
  {
    if (IsAppleInternalBuild())
    {
      *(void *)(*(void *)(a1[6] + 8) + 24) = mach_absolute_time();
      if (gLogCategory_APCarPlayCarServicesInterface <= 50
        && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
      {
        UpTicksToMilliseconds();
        LogPrintF();
      }
    }
    if (a2)
    {
      *(void *)(*(void *)(a1[7] + 8) + 24) = CFRetain(a2);
      if (gLogCategory_APCarPlayCarServicesInterface <= 50
        && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
  v6 = a1[4];
  return dispatch_semaphore_signal(v6);
}

intptr_t __APCarPlay_CRFetchScaledDisplays_block_invoke(void *a1, const void *a2, void *a3)
{
  if ([a3 code])
  {
    if (gLogCategory_APCarPlayCarServicesInterface <= 90
      && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = [a3 localizedDescription];
      LogPrintF();
    }
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = objc_msgSend(a3, "code", v8);
  }
  else
  {
    if (IsAppleInternalBuild())
    {
      *(void *)(*(void *)(a1[6] + 8) + 24) = mach_absolute_time();
      if (gLogCategory_APCarPlayCarServicesInterface <= 50
        && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
      {
        UpTicksToMilliseconds();
        LogPrintF();
      }
    }
    if (a2)
    {
      *(void *)(*(void *)(a1[7] + 8) + 24) = CFRetain(a2);
      if (gLogCategory_APCarPlayCarServicesInterface <= 50
        && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
  v6 = a1[4];
  return dispatch_semaphore_signal(v6);
}

intptr_t __APCarPlay_FetchUIContextMasterURLList_block_invoke(void *a1, const void *a2, void *a3)
{
  if (a3)
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = [a3 code];
    if (gLogCategory_APCarPlayCarServicesInterface <= 90
      && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
    {
LABEL_14:
      LogPrintF();
    }
  }
  else
  {
    if (IsAppleInternalBuild())
    {
      *(void *)(*(void *)(a1[6] + 8) + 24) = mach_absolute_time();
      if (gLogCategory_APCarPlayCarServicesInterface <= 50
        && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
      {
        UpTicksToMilliseconds();
        LogPrintF();
      }
    }
    *(void *)(*(void *)(a1[7] + 8) + 24) = CFRetain(a2);
    if (gLogCategory_APCarPlayCarServicesInterface <= 50
      && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_14;
    }
  }
  v5 = a1[4];
  return dispatch_semaphore_signal(v5);
}

intptr_t __APCarPlay_FetchSessionFeatureKeysWithIdentifier_block_invoke(void *a1, const void *a2, void *a3)
{
  if (a3)
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = [a3 code];
    if (gLogCategory_APCarPlayCarServicesInterface <= 90
      && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
    {
LABEL_14:
      LogPrintF();
    }
  }
  else
  {
    if (IsAppleInternalBuild())
    {
      *(void *)(*(void *)(a1[6] + 8) + 24) = mach_absolute_time();
      if (gLogCategory_APCarPlayCarServicesInterface <= 50
        && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
      {
        UpTicksToMilliseconds();
        LogPrintF();
      }
    }
    *(void *)(*(void *)(a1[7] + 8) + 24) = CFRetain(a2);
    if (gLogCategory_APCarPlayCarServicesInterface <= 50
      && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_14;
    }
  }
  v5 = a1[4];
  return dispatch_semaphore_signal(v5);
}

intptr_t __APCarPlay_AddAnalyticsValues_block_invoke(void *a1, void *a2)
{
  if (a2)
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = [a2 code];
    if (gLogCategory_APCarPlayCarServicesInterface <= 90
      && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_9;
    }
  }
  else if (IsAppleInternalBuild())
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = mach_absolute_time();
    if (gLogCategory_APCarPlayCarServicesInterface <= 50
      && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
    {
      UpTicksToMilliseconds();
LABEL_9:
      LogPrintF();
    }
  }
  v3 = (const void *)a1[8];
  if (v3) {
    CFRelease(v3);
  }
  v4 = a1[4];
  return dispatch_semaphore_signal(v4);
}

@end