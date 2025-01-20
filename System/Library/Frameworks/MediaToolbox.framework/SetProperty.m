@interface SetProperty
@end

@implementation SetProperty

uint64_t __audioRendererCentral_SetProperty_block_invoke(uint64_t a1)
{
  uint64_t result = audioRendererCentral_setFigAudioSession(*(void *)(a1 + 40), *(const void **)(a1 + 48));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __audioRendererCentral_SetProperty_block_invoke_2(uint64_t a1)
{
  uint64_t result = audioRendererCentral_setFigAudioSession(*(void *)(a1 + 40), *(const void **)(a1 + 48));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __audioRendererAirPlay_SetProperty_block_invoke(uint64_t a1)
{
  uint64_t result = audioRendererAirPlay_setRoutingContextAndRemoteDeviceIDInternal(*(void *)(a1 + 40), *(const void **)(a1 + 48), *(const void **)(*(void *)(a1 + 56) + 32));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __audioRendererAirPlay_SetProperty_block_invoke_2(uint64_t a1)
{
  uint64_t result = audioRendererAirPlay_setRoutingContextAndRemoteDeviceIDInternal(*(void *)(a1 + 40), *(const void **)(a1 + 48), *(const void **)(*(void *)(a1 + 56) + 32));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __audioRendererAirPlay_SetProperty_block_invoke_3(uint64_t a1)
{
  uint64_t result = audioRendererAirPlay_setRoutingContextAndRemoteDeviceIDInternal(*(void *)(a1 + 40), *(const void **)(*(void *)(a1 + 48) + 24), *(const void **)(a1 + 56));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __videoReceiver_SetProperty_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&v7.value = *(_OWORD *)(a1 + 40);
  v7.epoch = *(void *)(a1 + 56);
  CMBaseObjectGetDerivedStorage();
  CMTime time = v7;
  CMTimeGetSeconds(&time);
  Float32 = (const void *)FigCFNumberCreateFloat32();
  if (dword_1E9350E80 >= 2)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CFArrayRef v3 = (const __CFArray *)FigCFDictionaryCopyArrayOfValues();
  if (v3)
  {
    CFArrayRef v4 = v3;
    if (CFArrayGetCount(v3) >= 1)
    {
      CFIndex v5 = 0;
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, v5);
        CFDictionaryGetValue(ValueAtIndex, @"ImageQueueReceiverKey");
        CAXPCImageQueueReceiverSetProperty();
        ++v5;
      }
      while (v5 < CFArrayGetCount(v4));
    }
    CFRelease(v4);
  }
  if (Float32) {
    CFRelease(Float32);
  }
}

void __videoReceiver_SetProperty_block_invoke_2()
{
  CMBaseObjectGetDerivedStorage();
  if (dword_1E9350E80 >= 2)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CFArrayRef v1 = (const __CFArray *)FigCFDictionaryCopyArrayOfValues();
  if (v1)
  {
    CFArrayRef v2 = v1;
    if (CFArrayGetCount(v1) >= 1)
    {
      CFIndex v3 = 0;
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v2, v3);
        CFDictionaryGetValue(ValueAtIndex, @"ImageQueueReceiverKey");
        CAXPCImageQueueReceiverSetDisplayedPixelCount();
        ++v3;
      }
      while (v3 < CFArrayGetCount(v2));
    }
    CFRelease(v2);
  }
}

uint64_t __remoteSampleCursor_SetProperty_block_invoke(uint64_t a1, CMBlockBufferRef theBuffer)
{
  size_t v6 = 0;
  dataPointerOut = 0;
  uint64_t result = CMBlockBufferGetDataPointer(theBuffer, 0, &v6, 0, &dataPointerOut);
  if (!result)
  {
    CFArrayRef v4 = dataPointerOut;
    uint64_t result = 4294949526;
    if ((dataPointerOut & 7) == 0 && v6 > 0x197)
    {
      *((void *)dataPointerOut + 50) = 0;
      *((_OWORD *)v4 + 23) = 0u;
      *((_OWORD *)v4 + 24) = 0u;
      *((_OWORD *)v4 + 21) = 0u;
      *((_OWORD *)v4 + 22) = 0u;
      *((_OWORD *)v4 + 19) = 0u;
      *((_OWORD *)v4 + 20) = 0u;
      *((_OWORD *)v4 + 17) = 0u;
      *((_OWORD *)v4 + 18) = 0u;
      *((_OWORD *)v4 + 15) = 0u;
      *((_OWORD *)v4 + 16) = 0u;
      *((_OWORD *)v4 + 13) = 0u;
      *((_OWORD *)v4 + 14) = 0u;
      *((_OWORD *)v4 + 11) = 0u;
      *((_OWORD *)v4 + 12) = 0u;
      *((_OWORD *)v4 + 9) = 0u;
      *((_OWORD *)v4 + 10) = 0u;
      *((_OWORD *)v4 + 7) = 0u;
      *((_OWORD *)v4 + 8) = 0u;
      *((_OWORD *)v4 + 5) = 0u;
      *((_OWORD *)v4 + 6) = 0u;
      *((_OWORD *)v4 + 3) = 0u;
      *((_OWORD *)v4 + 4) = 0u;
      *((_OWORD *)v4 + 1) = 0u;
      *((_OWORD *)v4 + 2) = 0u;
      *(_OWORD *)CFArrayRef v4 = 0u;
      CFIndex v5 = dataPointerOut;
      *(void *)dataPointerOut = *(void *)(a1 + 32);
      *((void *)v5 + 1) = 0;
      *((_DWORD *)v5 + 4) = 779314548;
      uint64_t result = FigInMemorySerializerAppendCFString();
      if (!result) {
        v5[344] = *(unsigned char *)(a1 + 56);
      }
    }
  }
  return result;
}

uint64_t __remoteSampleCursor_SetProperty_block_invoke_2()
{
  return 0;
}

void __vq_SetProperty_block_invoke(uint64_t a1)
{
  if (!FigCFEqual())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    CFArrayRef v2 = *(const void **)(a1 + 40);
    CFArrayRef v4 = *(const void **)(v3 + 632);
    *(void *)(v3 + 632) = v2;
    if (v2) {
      CFRetain(v2);
    }
    if (v4) {
      CFRelease(v4);
    }
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 376);
    if (v6)
    {
      uint64_t v7 = *(void *)(v5 + 632);
      uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v9 = v8 ? v8 : 0;
      v10 = *(void (**)(uint64_t, __CFString *, uint64_t))(v9 + 56);
      if (v10)
      {
        v10(v6, @"DisplayList", v7);
      }
    }
  }
}

void __surrogateAIG_SetProperty_block_invoke(uint64_t a1)
{
  CFTypeRef v2 = *(CFTypeRef *)(*(void *)(a1 + 48) + 24);
  if (v2) {
    CFTypeRef v2 = CFRetain(v2);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = *(__CFDictionary **)(*(void *)(a1 + 48) + 32);
    if (v3
      || (CFAllocatorRef v4 = CFGetAllocator(*(CFTypeRef *)(a1 + 56)),
          *(void *)(*(void *)(a1 + 48) + 32) = CFDictionaryCreateMutable(v4, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]), (uint64_t v3 = *(__CFDictionary **)(*(void *)(a1 + 48) + 32)) != 0))
    {
      uint64_t v5 = *(const void **)(a1 + 64);
      uint64_t v6 = *(const void **)(a1 + 72);
      CFDictionarySetValue(v3, v5, v6);
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = FigSignalErrorAt();
    }
  }
}

CFTypeID __fpic_SetProperty_block_invoke(uint64_t a1)
{
  CFTypeID result = FigCFEqual();
  if (result)
  {
    if (*(void *)(a1 + 48))
    {
      CFTypeID TypeID = CFDictionaryGetTypeID();
      CFTypeID result = CFGetTypeID(*(CFTypeRef *)(a1 + 48));
      if (TypeID == result)
      {
        CFAllocatorRef v4 = *(const void **)(a1 + 48);
        uint64_t v5 = *(void *)(a1 + 56);
        uint64_t v6 = *(const void **)(v5 + 1032);
        *(void *)(v5 + 1032) = v4;
        if (v4) {
          CFRetain(v4);
        }
        if (v6) {
          CFRelease(v6);
        }
        uint64_t v8 = *(void *)(a1 + 64);
        uint64_t v7 = *(void *)(a1 + 72);
        uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
        CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(DerivedStorage + 600));
        if (Count < 1)
        {
LABEL_12:
          CFTypeID result = 0;
        }
        else
        {
          CFIndex v11 = Count;
          CFIndex v12 = 0;
          while (1)
          {
            CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(DerivedStorage + 600), v12);
            CFTypeID result = fpic_updateIntegratedTimelineOffsetTimesOnItemForEvent(v8, v7, (uint64_t)ValueAtIndex);
            if (result) {
              break;
            }
            if (v11 == ++v12) {
              goto LABEL_12;
            }
          }
        }
        goto LABEL_18;
      }
    }
  }
  else
  {
    CFTypeID result = FigCFEqual();
    if (!result)
    {
      CFTypeID result = FigSignalErrorAt();
LABEL_18:
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
      return result;
    }
    if (*(void *)(a1 + 48))
    {
      CFTypeID v14 = CFNumberGetTypeID();
      CFTypeID result = CFGetTypeID(*(CFTypeRef *)(a1 + 48));
      if (v14 == result)
      {
        CFTypeID result = FigCFNumberGetSInt32();
        *(_DWORD *)(*(void *)(a1 + 56) + 1084) = result;
      }
    }
  }
  return result;
}

@end