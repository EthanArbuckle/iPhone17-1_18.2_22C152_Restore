@interface Suspend
@end

@implementation Suspend

void __screenstreamudp_Suspend_block_invoke(void *a1)
{
  v2 = (const void *)a1[4];
  if (a1[6]) {
    v3 = a1 + 7;
  }
  else {
    v3 = 0;
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)(DerivedStorage + 24))
  {
    APSLogErrorAt();
    screenstreamudp_dispatchCallback(v2, v3, -16762);
    screenstreamudp_handleFatalError(v2, -16762, @"Suspend failed");
  }
  else if (*(unsigned char *)(DerivedStorage + 26))
  {
    if (*(unsigned char *)(DerivedStorage + 25))
    {
      if (!*(unsigned char *)(DerivedStorage + 248))
      {
        [*(id *)(DerivedStorage + 40) stopWithCompletion:v3];
        screenstreamudp_teardownStream();
        if (gLogCategory_APEndpointStreamScreenUDP <= 50
          && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
    }
  }
  v5 = (const void *)a1[5];
  if (v5) {
    CFRelease(v5);
  }
  v6 = (const void *)a1[4];
  CFRelease(v6);
}

void __audioEngineCarPlay_Suspend_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 120))
  {
    *(unsigned char *)(v1 + 120) = 0;
    v3 = *(const void **)(v1 + 88);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(*(void *)(a1 + 32) + 88) = 0;
    }
    CFRetain(*(CFTypeRef *)(a1 + 40));
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 0x40000000;
    v4[2] = __audioEngineCarPlay_Suspend_block_invoke_2;
    v4[3] = &__block_descriptor_tmp_25_0;
    dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 128), v4);
  }
}

void __audioEngineCarPlay_Suspend_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  *(unsigned char *)(v2 + 136) = 0;
  uint64_t v3 = *(void *)(v2 + 184);
  if (v3)
  {
    v4 = *(void **)(CMBaseObjectGetVTable() + 16);
    if (v4) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    if (*v5 >= 2uLL)
    {
      v6 = (void (*)(uint64_t))v5[5];
      if (v6) {
        v6(v3);
      }
    }
    uint64_t v2 = *(void *)(a1 + 32);
    v7 = *(const void **)(v2 + 184);
    if (v7)
    {
      CFRelease(v7);
      *(void *)(*(void *)(a1 + 32) + 184) = 0;
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  *(void *)(v2 + 176) = 0;
  *(_OWORD *)(v2 + 144) = 0u;
  *(_OWORD *)(v2 + 160) = 0u;
  v8 = *(void **)(a1 + 32);
  v9 = (const void *)v8[24];
  if (v9)
  {
    CFRelease(v9);
    *(void *)(*(void *)(a1 + 32) + 192) = 0;
    v8 = *(void **)(a1 + 32);
  }
  v10 = (const void *)v8[25];
  if (v10)
  {
    CFRelease(v10);
    *(void *)(*(void *)(a1 + 32) + 200) = 0;
    v8 = *(void **)(a1 + 32);
  }
  v11 = (const void *)v8[26];
  if (v11)
  {
    CFRelease(v11);
    *(void *)(*(void *)(a1 + 32) + 208) = 0;
    v8 = *(void **)(a1 + 32);
  }
  v8[27] = 0;
  *(void *)(*(void *)(a1 + 32) + 224) = 0;
  uint64_t v13 = *(void *)(a1 + 32);
  v12 = *(const void **)(a1 + 40);
  *(_DWORD *)(v13 + 232) = 0;
  *(unsigned char *)(v13 + 236) = 0;
  CFRelease(v12);
}

uint64_t __audioHoseManagerBuffered_Suspend_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = audioHoseManagerBuffered_releaseCryptors(*(void *)(a1 + 40), MEMORY[0x1E4F1F9F8]);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
    || (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = audioHoseManagerBuffered_releaseMagicCookies(*(void *)(a1 + 40), MEMORY[0x1E4F1F9F8]), uint64_t result = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), result))
  {
    return APSLogErrorAt();
  }
  return result;
}

void __screenstream_Suspend_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 32);
  uint64_t DerivedStorage = (unsigned char *)CMBaseObjectGetDerivedStorage();
  if (DerivedStorage[24])
  {
    int v9 = -16762;
    APSLogErrorAt();
  }
  else
  {
    v4 = DerivedStorage;
    if (!DerivedStorage[26] || !DerivedStorage[25])
    {
LABEL_13:
      int v9 = 0;
      goto LABEL_14;
    }
    screenstream_stopStatsTimer();
    uint64_t v5 = *((void *)v4 + 20);
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    v8 = *(void (**)(uint64_t))(v7 + 24);
    if (v8) {
      v8(v5);
    }
    screenstream_teardownTransportStream();
    CMBufferQueueReset(*((CMBufferQueueRef *)v4 + 13));
    screenStream_setResumedAndNotifiyObservers(v2, 0);
    int v9 = 0;
    if (gLogCategory_APEndpointStreamScreen <= 50)
    {
      if (gLogCategory_APEndpointStreamScreen != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      goto LABEL_13;
    }
  }
LABEL_14:
  if (*(void *)(a1 + 48))
  {
    CFRetain(*(CFTypeRef *)(a1 + 32));
    v10 = *(NSObject **)(*(void *)(a1 + 56) + 96);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 0x40000000;
    block[2] = __screenstream_Suspend_block_invoke_2;
    block[3] = &__block_descriptor_tmp_99_0;
    uint64_t v11 = *(void *)(a1 + 32);
    block[4] = *(void *)(a1 + 48);
    block[5] = v11;
    int v14 = v9;
    block[6] = *(void *)(a1 + 64);
    dispatch_async(v10, block);
  }
  v12 = *(const void **)(a1 + 40);
  if (v12) {
    CFRelease(v12);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __screenstream_Suspend_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void, void, void))(a1 + 32))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 56), *(void *)(a1 + 48));
  uint64_t v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

@end