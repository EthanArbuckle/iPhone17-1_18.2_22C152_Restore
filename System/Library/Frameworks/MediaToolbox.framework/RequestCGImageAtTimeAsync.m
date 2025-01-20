@interface RequestCGImageAtTimeAsync
@end

@implementation RequestCGImageAtTimeAsync

CFTypeRef __surrogateAIG_RequestCGImageAtTimeAsync_block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 40) + 24);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __surrogateAIG_RequestCGImageAtTimeAsync_block_invoke_2(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)(DerivedStorage + 40)) {
    goto LABEL_8;
  }
  uint64_t v3 = DerivedStorage;
  if (surrogateAIG_EnsureSubGeneratorCreated(*(const void **)(a1 + 32))) {
    goto LABEL_8;
  }
  uint64_t v4 = *(void *)(v3 + 24);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  long long v16 = *(_OWORD *)(a1 + 56);
  uint64_t v17 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  uint64_t v8 = v7 ? v7 : 0;
  v9 = *(unsigned int (**)(uint64_t, long long *, uint64_t, uint64_t))(v8 + 16);
  if (!v9 || (long long v18 = v16, v19 = v17, v9(v4, &v18, v5, v6)))
  {
LABEL_8:
    CFDictionaryRef v10 = *(const __CFDictionary **)(a1 + 40);
    if (v10) {
      Value = CFDictionaryGetValue(v10, @"RequestID");
    }
    else {
      Value = 0;
    }
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (Mutable)
    {
      v13 = Mutable;
      FigCFDictionarySetInt32();
      if (Value) {
        CFDictionarySetValue(v13, @"RequestID", Value);
      }
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterPostNotification();
      CFRelease(v13);
    }
    else
    {
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterPostNotification();
    }
  }
  v14 = *(const void **)(a1 + 48);
  if (v14) {
    CFRelease(v14);
  }
  v15 = *(const void **)(a1 + 40);
  if (v15) {
    CFRelease(v15);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end