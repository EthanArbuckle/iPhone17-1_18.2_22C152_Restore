@interface APBrokerGroupResolveReceiverDNSNameWithOneBroker
@end

@implementation APBrokerGroupResolveReceiverDNSNameWithOneBroker

void ___APBrokerGroupResolveReceiverDNSNameWithOneBroker_block_invoke(uint64_t a1, int a2, CFTypeRef cf)
{
  uint64_t v6 = *(void *)(a1 + 48);
  int v7 = gLogCategory_APBrokerGroup;
  if (gLogCategory_APBrokerGroup <= 50)
  {
    if (gLogCategory_APBrokerGroup == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_9;
      }
      int v7 = gLogCategory_APBrokerGroup;
    }
    if (v7 == -1) {
      _LogCategory_Initialize();
    }
    LogPrintF();
  }
LABEL_9:
  if (a2)
  {
    APSLogErrorAt();
LABEL_18:
    *(_DWORD *)(v6 + 4) = a2;
    goto LABEL_13;
  }
  if (!cf)
  {
    APSLogErrorAt();
    a2 = -6705;
    goto LABEL_18;
  }
  *(unsigned char *)uint64_t v6 = 1;
  *(_DWORD *)(v6 + 4) = 0;
  v8 = *(const void **)(v6 + 8);
  *(void *)(v6 + 8) = cf;
  CFRetain(cf);
  if (v8) {
    CFRelease(v8);
  }
LABEL_13:
  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v9, v10, v11, v12, v13);
  v14 = *(const void **)(a1 + 32);
  _Block_release(v14);
}

@end