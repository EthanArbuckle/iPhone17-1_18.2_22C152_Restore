@interface APAdvertiserHandleConnectivityHelperEvent
@end

@implementation APAdvertiserHandleConnectivityHelperEvent

void ___APAdvertiserHandleConnectivityHelperEvent_block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 48);
  if (v2 == 7)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v4 + 49))
    {
      if (gLogCategory_APAdvertiser <= 50)
      {
        if (gLogCategory_APAdvertiser != -1 || (v6 = _LogCategory_Initialize(), uint64_t v4 = *(void *)(a1 + 32), v6))
        {
          LogPrintF();
          uint64_t v4 = *(void *)(a1 + 32);
        }
      }
      *(unsigned char *)(v4 + 49) = 1;
      _APAdvertiserUpdate(v4);
      if (APConnectivityHelperDeregisterForEvent()) {
        goto LABEL_24;
      }
    }
  }
  else if (v2 == 1)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v3 + 48))
    {
      if (gLogCategory_APAdvertiser <= 50)
      {
        if (gLogCategory_APAdvertiser != -1 || (v5 = _LogCategory_Initialize(), uint64_t v3 = *(void *)(a1 + 32), v5))
        {
          LogPrintF();
          uint64_t v3 = *(void *)(a1 + 32);
        }
      }
      *(unsigned char *)(v3 + 48) = 1;
      _APAdvertiserUpdate(v3);
      if (APConnectivityHelperDeregisterForEvent()) {
LABEL_24:
      }
        APSLogErrorAt();
    }
  }
  else if (gLogCategory_APAdvertiser <= 40 {
         && (gLogCategory_APAdvertiser != -1 || _LogCategory_Initialize()))
  }
  {
    APConnectivityHelperGetEventString();
    LogPrintF();
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
  v7 = *(const void **)(a1 + 40);

  CFRelease(v7);
}

@end