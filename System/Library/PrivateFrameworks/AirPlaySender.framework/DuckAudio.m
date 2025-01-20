@interface DuckAudio
@end

@implementation DuckAudio

uint64_t __carEndpoint_DuckAudio_block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(*(void *)(result + 40) + 304))
  {
    if (gLogCategory_APEndpointCarPlay <= 50)
    {
      if (gLogCategory_APEndpointCarPlay != -1 || (result = _LogCategory_Initialize(), result)) {
        result = LogPrintF();
      }
    }
    *(unsigned char *)(*(void *)(v1 + 40) + 304) = 0;
  }
  else
  {
    result = carEndpoint_sendCommandInternal(*(const void **)(result + 48), @"duckAudio", *(const void **)(result + 56), 0, 0);
    *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = result;
  }
  return result;
}

uint64_t __carEndpoint_DuckAudio_block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(result + 40) + 240))
  {
    uint64_t v1 = result;
    result = carEndpoint_getStreamInfoForSubtype();
    if (result)
    {
      uint64_t v12 = 0;
      CFAllocatorRef v2 = CFGetAllocator(*(CFTypeRef *)(v1 + 48));
      uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
      uint64_t VTable = CMBaseObjectGetVTable();
      uint64_t v6 = *(void *)(VTable + 8);
      result = VTable + 8;
      uint64_t v5 = v6;
      uint64_t v7 = v6 ? v5 : 0;
      v8 = *(void (**)(uint64_t, __CFString *, CFAllocatorRef, uint64_t *))(v7 + 48);
      if (v8)
      {
        v8(CMBaseObject, @"AudioFormatInfo", v2, &v12);
        result = v12;
        if (v12)
        {
          LODWORD(v9) = *(_DWORD *)(APCarPlayAudioFormatInfoGetLatencyInfo(v12) + 8);
          double v10 = (double)v9;
          result = APCarPlayAudioFormatInfoGetDescription(v12);
          *(void *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = (unint64_t)(v10
                                                                                         / *(double *)result
                                                                                         * 1000000000.0);
          uint64_t v11 = *(void *)(v1 + 32);
          if (*(void *)(*(void *)(v11 + 8) + 24) > 0x1DCD6500uLL)
          {
            if (gLogCategory_APEndpointCarPlay <= 50)
            {
              if (gLogCategory_APEndpointCarPlay != -1
                || (result = _LogCategory_Initialize(), uint64_t v11 = *(void *)(v1 + 32), result))
              {
                result = LogPrintF();
                uint64_t v11 = *(void *)(v1 + 32);
              }
            }
            *(void *)(*(void *)(v11 + 8) + 24) = 500000000;
          }
        }
      }
    }
  }
  return result;
}

void __carEndpoint_DuckAudio_block_invoke_3(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  CFAllocatorRef v2 = *(const void **)(a1 + 48);
  int v4 = *(_DWORD *)(v3 + 204);
  *(unsigned char *)(v3 + 304) = 1;
  CFRetain(v2);
  uint64_t v5 = *(const void **)(a1 + 56);
  if (v5) {
    CFRetain(v5);
  }
  dispatch_time_t v6 = dispatch_time(0, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  uint64_t v7 = *(void *)(a1 + 40);
  v8 = *(NSObject **)(v7 + 144);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = __carEndpoint_DuckAudio_block_invoke_4;
  block[3] = &__block_descriptor_tmp_1038;
  block[4] = v7;
  int v12 = v4;
  int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
  uint64_t v11 = *(void *)(a1 + 48);
  dispatch_after(v6, v8, block);
}

void __carEndpoint_DuckAudio_block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v1 + 204) == *(_DWORD *)(a1 + 64))
  {
    if (*(unsigned char *)(v1 + 304))
    {
      carEndpoint_sendCommandInternal(*(const void **)(a1 + 40), @"unduckAudio", *(const void **)(a1 + 48), 0, 0);
      *(unsigned char *)(*(void *)(a1 + 32) + 304) = 0;
    }
    else if (gLogCategory_APEndpointCarPlay <= 50 {
           && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
    uint64_t v3 = *(const void **)(a1 + 48);
    if (v3) {
      CFRelease(v3);
    }
    int v4 = *(const void **)(a1 + 56);
    CFRelease(v4);
  }
}

@end