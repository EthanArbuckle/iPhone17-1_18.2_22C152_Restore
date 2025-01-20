@interface CloseCommChannel
@end

@implementation CloseCommChannel

void __carEndpoint_CloseCommChannel_block_invoke(uint64_t a1)
{
  if (gLogCategory_APEndpointCarPlay <= 50
    && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFDictionaryRef v2 = *(const __CFDictionary **)(*(void *)(a1 + 64) + 440);
  if (!v2)
  {
    APSLogErrorAt();
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
    int v14 = -16720;
LABEL_32:
    *(_DWORD *)(v13 + 24) = v14;
    return;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFDictionaryGetValue(v2, *(const void **)(a1 + 48));
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (!v3)
  {
    APSLogErrorAt();
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
    int v14 = -16725;
    goto LABEL_32;
  }
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = *(uint64_t (**)(uint64_t))(v5 + 24);
  if (v6) {
    int v7 = v6(v3);
  }
  else {
    int v7 = -12782;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    APSLogErrorAt();
  }
  else if (FigCFEqual())
  {
    v8 = *(const void **)(*(void *)(a1 + 64) + 72);
    if (v8)
    {
      CFRelease(v8);
      *(void *)(*(void *)(a1 + 64) + 72) = 0;
    }
  }
  else if (FigCFEqual())
  {
    v9 = *(const void **)(*(void *)(a1 + 64) + 88);
    if (v9)
    {
      CFRelease(v9);
      *(void *)(*(void *)(a1 + 64) + 88) = 0;
    }
  }
  else if (FigCFEqual())
  {
    v10 = *(const void **)(*(void *)(a1 + 64) + 96);
    if (v10)
    {
      CFRelease(v10);
      *(void *)(*(void *)(a1 + 64) + 96) = 0;
    }
  }
  else if (FigCFEqual())
  {
    v11 = *(const void **)(*(void *)(a1 + 64) + 112);
    if (v11)
    {
      CFRelease(v11);
      *(void *)(*(void *)(a1 + 64) + 112) = 0;
    }
  }
  else if (FigCFEqual())
  {
    v12 = *(const void **)(*(void *)(a1 + 64) + 128);
    if (v12)
    {
      CFRelease(v12);
      *(void *)(*(void *)(a1 + 64) + 128) = 0;
    }
  }
}

@end