@interface APConnectivityHelperHandleCWFEventExternal
@end

@implementation APConnectivityHelperHandleCWFEventExternal

void ___APConnectivityHelperHandleCWFEventExternal_block_invoke(uint64_t a1)
{
  v3 = *(void **)(a1 + 32);
  v2 = *(unsigned char **)(a1 + 40);
  uint64_t v4 = [v3 type];
  if (v2[200]) {
    goto LABEL_43;
  }
  if (v4 > 9)
  {
    if (v4 != 29)
    {
      if (v4 == 10 && (v2[80] || v2[177]))
      {
        if (gLogCategory_APConnectivityHelper <= 40
          && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (v2[80]) {
          _APConnectivityHelperTrySettingWiFiDevice((uint64_t)v2);
        }
        if (v2[177]) {
          _APConnectivityHelperTrySettingAWDLDevice((uint64_t)v2);
        }
      }
      goto LABEL_43;
    }
    if (!v2[75]) {
      goto LABEL_43;
    }
    v9 = v2;
    if (gLogCategory_APConnectivityHelper <= 40
      && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    CFAllocatorRef v5 = CFGetAllocator(v2);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v5, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (Mutable)
    {
      uint64_t v11 = 0;
      _APConnectivityHelperPopulateCurrentWiFiNetworkInfo((uint64_t *)&v9);
      if (v11)
      {
        APSLogErrorAt();
        char v7 = 1;
        CFMutableDictionaryRef v6 = Mutable;
      }
      else
      {
        CFMutableDictionaryRef v6 = Mutable;
        if (_APConnectivityHelperDispatchEvent((uint64_t)v2, (void *)9, Mutable))
        {
          APSLogErrorAt();
          char v7 = 0;
        }
        else
        {
          char v7 = 1;
        }
      }
      if (v6) {
        CFRelease(v6);
      }
      if (v7) {
        goto LABEL_43;
      }
    }
    else
    {
      APSLogErrorAt();
    }
    if (gLogCategory_APConnectivityHelper <= 90
      && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_49;
    }
  }
  else if (v4 == 1)
  {
    if (v2[77])
    {
      if (gLogCategory_APConnectivityHelper <= 40
        && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (_APConnectivityHelperDispatchEvent((uint64_t)v2, (void *)2, 0))
      {
        APSLogErrorAt();
        if (gLogCategory_APConnectivityHelper <= 90
          && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_49;
        }
      }
    }
  }
  else if (v4 == 6 {
         && v2[73]
  }
         && _APConnectivityHelperHandleWiFiLinkChangedInternal(v2, (void *)[v3 info])
         && gLogCategory_APConnectivityHelper <= 90
         && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
  {
LABEL_49:
    LogPrintF();
  }
LABEL_43:

  v8 = *(const void **)(a1 + 40);
  CFRelease(v8);
}

@end