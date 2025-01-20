@interface SetProperty
@end

@implementation SetProperty

void __localStream_SetProperty_block_invoke(void *a1)
{
  MEMORY[0x1D25EB370](*(void *)(a1[4] + 136));
  uint64_t v3 = a1[4];
  v2 = (const void *)a1[5];
  v4 = *(const void **)(v3 + 152);
  *(void *)(v3 + 152) = v2;
  if (v2) {
    CFRetain(v2);
  }
  if (v4) {
    CFRelease(v4);
  }
  MEMORY[0x1D25EB390](*(void *)(a1[4] + 136));
  uint64_t v5 = *(void *)(a1[4] + 216);
  if (v5)
  {
    uint64_t v6 = a1[5];
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v8 = v7 ? v7 : 0;
    v9 = *(void (**)(uint64_t, void, uint64_t))(v8 + 56);
    if (v9) {
      v9(v5, *MEMORY[0x1E4F4A098], v6);
    }
  }
  v10 = (const void *)a1[5];
  if (v10) {
    CFRelease(v10);
  }
  v11 = (const void *)a1[6];
  if (v11)
  {
    CFRelease(v11);
  }
}

uint64_t __localStream_SetProperty_block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 216);
  if (v1)
  {
    uint64_t v2 = *(void *)(result + 40);
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v5 = *(void *)(VTable + 8);
    result = VTable + 8;
    uint64_t v4 = v5;
    uint64_t v6 = v5 ? v4 : 0;
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 56);
    if (v7)
    {
      uint64_t v8 = *MEMORY[0x1E4F4A080];
      return v7(v1, v8, v2);
    }
  }
  return result;
}

uint64_t __localStream_SetProperty_block_invoke_3(uint64_t a1)
{
  return localStream_setAndCacheSBARProperty(*(void *)(a1 + 32), *MEMORY[0x1E4F4A078], *(void *)(a1 + 40));
}

uint64_t __localStream_SetProperty_block_invoke_4(uint64_t a1)
{
  return localStream_setAndCacheSBARProperty(*(void *)(a1 + 32), *MEMORY[0x1E4F4A088], *(void *)(a1 + 40));
}

void __carEndpoint_SetProperty_block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 40) + 152))
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    int v9 = -16723;
    goto LABEL_36;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F20D10]))
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 324) = CFBooleanGetValue(*(CFBooleanRef *)(a1 + 56));
    return;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F20F98]))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = *(const void **)(v2 + 296);
    uint64_t v4 = *(const void **)(a1 + 56);
    *(void *)(v2 + 296) = v4;
    if (v4) {
      CFRetain(v4);
    }
    if (v3)
    {
      CFRelease(v3);
    }
    return;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F20CE8]))
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 412) = CFBooleanGetValue(*(CFBooleanRef *)(a1 + 56));
    return;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), @"DisplayCornerMasks"))
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(*(CFTypeRef *)(a1 + 56)))
    {
      if (gLogCategory_APEndpointCarPlay <= 50
        && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
      {
        CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 56));
        LogPrintF();
      }
      if (!*(void *)(*(void *)(a1 + 40) + 432))
      {
        CFAllocatorRef v6 = CFGetAllocator(*(CFTypeRef *)(a1 + 64));
        *(void *)(*(void *)(a1 + 40) + 432) = CFDictionaryCreateMutable(v6, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      }
      CFDictionaryApplyBlock();
      return;
    }
    APSLogErrorAt();
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    int v9 = -16720;
LABEL_36:
    *(_DWORD *)(v8 + 24) = v9;
    return;
  }
  if (!CFEqual(*(CFTypeRef *)(a1 + 48), @"PreviousSessionAnalytics"))
  {
    if (gLogCategory_APEndpointCarPlay <= 30
      && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    int v9 = -12784;
    goto LABEL_36;
  }
  if (gLogCategory_APEndpointCarPlay <= 50
    && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFTypeRef v7 = *(CFTypeRef *)(a1 + 56);
  if (v7) {
    CFTypeRef v7 = CFRetain(v7);
  }
  *(void *)(*(void *)(a1 + 40) + 448) = v7;
}

uint64_t __carEndpoint_SetProperty_block_invoke_2(uint64_t a1, const void *a2, const void *a3)
{
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(void *)(a1 + 40) + 432), a2, a3);
  if (gLogCategory_APEndpointCarPlay <= 50
    && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t result = carEndpoint_updateDisplayCornerMasks();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __audioHoseManagerBuffered_SetProperty_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (((*(unsigned __int16 *)(a3 + 10) - *(unsigned __int16 *)(result + 40)) & 0x8000) != 0)
  {
    uint64_t v4 = result;
    if (gLogCategory_APAudioHoseManagerBuffered <= 50)
    {
      if (gLogCategory_APAudioHoseManagerBuffered != -1 || (uint64_t result = _LogCategory_Initialize(), result))
      {
        if (*(void *)(v4 + 32)) {
          CMBaseObjectGetDerivedStorage();
        }
        uint64_t result = LogPrintF();
      }
    }
    *(_WORD *)(a3 + 10) = *(_WORD *)(v4 + 40);
  }
  return result;
}

void __audioHoseManagerBuffered_SetProperty_block_invoke_2()
{
  v0[0] = 0;
  v0[1] = v0;
  v0[2] = 0x2000000000;
  int v1 = 0;
  if (*(unsigned char *)(CMBaseObjectGetDerivedStorage() + 186)) {
    CFDictionaryApplyBlock();
  }
  _Block_object_dispose(v0, 8);
}

const void *__audioHoseManagerBuffered_SetProperty_block_invoke_3(uint64_t a1)
{
  uint64_t result = (const void *)FigCFEqual();
  if (!result)
  {
    uint64_t v3 = *(const void **)(*(void *)(a1 + 32) + 200);
    if (v3) {
      CFRelease(v3);
    }
    uint64_t result = *(const void **)(a1 + 40);
    if (result) {
      uint64_t result = CFRetain(result);
    }
    *(void *)(*(void *)(a1 + 32) + 200) = result;
  }
  return result;
}

const void *__audioHoseManagerBuffered_SetProperty_block_invoke_4(uint64_t a1)
{
  uint64_t result = (const void *)FigCFEqual();
  if (!result)
  {
    uint64_t v3 = *(const void **)(*(void *)(a1 + 32) + 160);
    if (v3) {
      CFRelease(v3);
    }
    uint64_t result = *(const void **)(a1 + 40);
    if (result) {
      uint64_t result = CFRetain(result);
    }
    *(void *)(*(void *)(a1 + 32) + 160) = result;
  }
  return result;
}

void __screenstream_SetProperty_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v1 = *(const void **)(a1 + 40);
  uint64_t v3 = *(const void **)(v2 + 488);
  *(void *)(v2 + 488) = v1;
  if (v1) {
    CFRetain(v1);
  }
  if (v3)
  {
    CFRelease(v3);
  }
}

@end