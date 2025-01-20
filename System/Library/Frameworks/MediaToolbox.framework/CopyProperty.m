@interface CopyProperty
@end

@implementation CopyProperty

CFTypeRef __audioRendererAirPlay_CopyProperty_block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 40) + 32);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  **(void **)(a1 + 32) = result;
  return result;
}

CFTypeRef __audioRendererAirPlay_CopyProperty_block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 40) + 56)) {
    v2 = (CFTypeRef *)MEMORY[0x1E4F1CFD0];
  }
  else {
    v2 = (CFTypeRef *)MEMORY[0x1E4F1CFC8];
  }
  CFTypeRef result = CFRetain(*v2);
  **(void **)(a1 + 32) = result;
  return result;
}

CFTypeRef __audioRendererAirPlay_CopyProperty_block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 40) + 77)) {
    v2 = (CFTypeRef *)MEMORY[0x1E4F1CFD0];
  }
  else {
    v2 = (CFTypeRef *)MEMORY[0x1E4F1CFC8];
  }
  CFTypeRef result = CFRetain(*v2);
  **(void **)(a1 + 32) = result;
  return result;
}

void __videoReceiver_CopyProperty_block_invoke(uint64_t a1)
{
  CFArrayRef v2 = (const __CFArray *)FigCFDictionaryCopyArrayOfValues();
  if (v2)
  {
    CFArrayRef v3 = v2;
    if (CFArrayGetCount(v2) >= 1)
    {
      CFIndex v4 = 0;
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, v4);
        Value = CFDictionaryGetValue(ValueAtIndex, @"ImageQueueReceiverKey");
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), Value);
        ++v4;
      }
      while (v4 < CFArrayGetCount(v3));
    }
    CFRelease(v3);
  }
}

CFArrayRef __videoReceiver_CopyProperty_block_invoke_2(uint64_t a1)
{
  for (CFIndex i = 0; ; ++i)
  {
    CFArrayRef result = *(const __CFArray **)(*(void *)(a1 + 40) + 72);
    if (result) {
      CFArrayRef result = (const __CFArray *)CFArrayGetCount(result);
    }
    if (i >= (uint64_t)result) {
      break;
    }
    CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 40) + 72), i);
    CFIndex v4 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
    if (v4)
    {
      v5 = v4;
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v4);
      CFRelease(v5);
    }
  }
  return result;
}

CFTypeRef __remoteXPCItem_CopyProperty_block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 40) + 192);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  **(void **)(a1 + 32) = result;
  return result;
}

uint64_t __remoteSampleCursor_CopyProperty_block_invoke()
{
  return FigXPCMessageSetCFString();
}

CFTypeRef __itemairplay_CopyProperty_block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 32) + 576);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  **(void **)(a1 + 40) = result;
  return result;
}

CFTypeRef __itemairplay_CopyProperty_block_invoke_2(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 40) + 624);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

CFTypeRef __itemairplay_CopyProperty_block_invoke_3(uint64_t a1)
{
  int v2 = pap_AirPlayState(*(const void **)(a1 + 40));
  if (v2) {
    BOOL v3 = v2 == 10;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (!*(unsigned char *)(v4 + 249) && *(float *)(v4 + 48) > 1.0)
    {
      uint64_t v5 = *(void *)(a1 + 56);
      if (*(unsigned char *)(v5 + 508))
      {
        CFTypeRef result = *(CFTypeRef *)(v5 + 624);
        if (!result) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
  }
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 56) + 616);
  if (result) {
LABEL_9:
  }
    CFTypeRef result = CFRetain(result);
LABEL_10:
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

CFTypeRef __itemairplay_CopyProperty_block_invoke_4(uint64_t a1)
{
  CFTypeRef result = itemairplay_copySelectedMediaArray();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

CFTypeRef __itemairplay_CopyProperty_block_invoke_5(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 40) + 832);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __vq_CopyProperty_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(_DWORD *)v2 || (uint64_t v8 = *(void *)(v2 + 376)) == 0)
  {
    CFAllocatorRef v3 = *(const __CFAllocator **)(a1 + 56);
    uint64_t v4 = (const void **)kFigVideoQueueExternalProtectionStatus_Protected;
    uint64_t v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
    v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
LABEL_3:
    uint64_t result = (uint64_t)CFDictionaryCreate(v3, (const void **)kFigVideoQueueExternalProtectionStatusKey_Video, v4, 1, v5, v6);
    **(void **)(a1 + 48) = result;
    if (!**(void **)(a1 + 48)) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -12081;
    }
    return result;
  }
  int v15 = 0;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v10 + 24);
  if (v11) {
    uint64_t result = v11(v8, 7, &v15);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    BOOL v12 = v15 == 1 || v15 == 4;
    v13 = kFigVideoQueueExternalProtectionStatus_Protected;
    if (!v12) {
      v13 = kFigVideoQueueExternalProtectionStatus_NotProtected;
    }
    v14 = *v13;
    CFAllocatorRef v3 = *(const __CFAllocator **)(a1 + 56);
    uint64_t v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
    v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
    uint64_t v4 = (const void **)&v14;
    goto LABEL_3;
  }
  return result;
}

CFTypeRef __videoQueueRemote_CopyProperty_block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 40) + 112);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  **(void **)(a1 + 32) = result;
  return result;
}

CFTypeRef __videoQueueRemote_CopyProperty_block_invoke_2(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 40) + 128);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  **(void **)(a1 + 32) = result;
  return result;
}

@end