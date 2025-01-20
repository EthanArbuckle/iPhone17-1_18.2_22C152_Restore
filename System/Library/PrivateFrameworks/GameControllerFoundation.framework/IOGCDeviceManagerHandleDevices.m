@interface IOGCDeviceManagerHandleDevices
@end

@implementation IOGCDeviceManagerHandleDevices

BOOL ____IOGCDeviceManagerHandleDevices_block_invoke(uint64_t a1, void *a2)
{
  Value = CFSetGetValue(*(CFSetRef *)(*(void *)(a1 + 32) + 32), a2);
  if (!*(void *)(*(void *)(a1 + 32) + 56)) {
    goto LABEL_7;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (!*(void *)(v5 + 56)) {
    goto LABEL_9;
  }
  CFDictionaryRef Mutable = *(const __CFDictionary **)(v5 + 72);
  if (!Mutable)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(*(CFAllocatorRef *)(v5 + 8), 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    *(void *)(v5 + 72) = Mutable;
  }
  if (CFDictionaryContainsKey(Mutable, a2)) {
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(v5 + 56);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = ____IOGCDeviceManagerStartObservingDevice_block_invoke;
  v10[3] = &__block_descriptor_48_e12_v20__0I8_v12l;
  v10[4] = v5;
  v10[5] = a2;
  v8 = (const void *)[a2 addInterestNotification:v7 type:"IOGeneralInterest" handler:v10];
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v5 + 72), a2, v8);
  if (v8)
  {
LABEL_7:
    if (!Value) {
      return _IOGCDeviceGetPlugInInterface((uint64_t)a2) != 0;
    }
  }
  else
  {
LABEL_9:
    if (Value) {
      CFSetAddValue(*(CFMutableSetRef *)(a1 + 48), Value);
    }
  }
  return 0;
}

void ____IOGCDeviceManagerHandleDevices_block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = ____IOGCDeviceManagerHandleDevices_block_invoke_3;
  v6[3] = &__block_descriptor_48_e12_v24__0_8_B16l;
  long long v7 = *(_OWORD *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v6];
  v3 = *(void **)(a1 + 56);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = ____IOGCDeviceManagerHandleDevices_block_invoke_4;
  v4[3] = &__block_descriptor_48_e12_v24__0_8_B16l;
  long long v5 = *(_OWORD *)(a1 + 40);
  [v3 enumerateObjectsUsingBlock:v4];
  CFRelease(*(CFTypeRef *)(a1 + 56));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t ____IOGCDeviceManagerHandleDevices_block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(a1 + 32))(*(void *)(a1 + 40), a2, 0);
}

uint64_t ____IOGCDeviceManagerHandleDevices_block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(a1 + 32))(*(void *)(a1 + 40), a2, 1);
}

@end