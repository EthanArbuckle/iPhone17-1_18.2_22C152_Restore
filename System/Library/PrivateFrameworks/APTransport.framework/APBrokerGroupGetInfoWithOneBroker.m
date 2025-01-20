@interface APBrokerGroupGetInfoWithOneBroker
@end

@implementation APBrokerGroupGetInfoWithOneBroker

void ___APBrokerGroupGetInfoWithOneBroker_block_invoke(uint64_t a1, uint64_t a2, CFTypeRef cf, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v7 = a2;
  uint64_t v9 = *(void *)(a1 + 48);
  int v10 = gLogCategory_APBrokerGroup;
  if (gLogCategory_APBrokerGroup <= 50)
  {
    if (gLogCategory_APBrokerGroup != -1) {
      goto LABEL_3;
    }
    if (_LogCategory_Initialize())
    {
      int v10 = gLogCategory_APBrokerGroup;
LABEL_3:
      if (v10 == -1) {
        _LogCategory_Initialize();
      }
      LogPrintF();
      if (!v7) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
  }
  if (!v7)
  {
LABEL_10:
    *(_DWORD *)(v9 + 4) = 0;
    *(unsigned char *)uint64_t v9 = 1;
    if (cf) {
      CFTypeRef v11 = CFRetain(cf);
    }
    else {
      CFTypeRef v11 = 0;
    }
    *(void *)(v9 + 8) = v11;
    goto LABEL_14;
  }
LABEL_7:
  *(_DWORD *)(v9 + 4) = v7;
LABEL_14:
  (*(void (**)(void, uint64_t, CFTypeRef, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, cf, a4, a5, a6);
  v12 = *(const void **)(a1 + 32);
  _Block_release(v12);
}

@end