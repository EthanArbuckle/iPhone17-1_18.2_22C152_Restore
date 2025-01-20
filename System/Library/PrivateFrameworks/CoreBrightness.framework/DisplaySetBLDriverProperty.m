@interface DisplaySetBLDriverProperty
@end

@implementation DisplaySetBLDriverProperty

uint64_t ____DisplaySetBLDriverProperty_block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(*(void *)(result + 40) + 128);
  *(void *)(*(void *)(result + 40) + 128) = 0;
  return result;
}

void ____DisplaySetBLDriverProperty_block_invoke(uint64_t a1)
{
  uint64_t v21 = a1;
  uint64_t v20 = a1;
  uint64_t v15 = 0;
  v16 = &v15;
  int v17 = 0x20000000;
  int v18 = 32;
  uint64_t v19 = 0;
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 144);
  v8 = (void (*)(void))MEMORY[0x1E4F143A8];
  int v9 = -1073741824;
  int v10 = 0;
  v11 = ____DisplaySetBLDriverProperty_block_invoke_2;
  v12 = &unk_1E621A490;
  v13 = &v15;
  uint64_t v14 = *(void *)(a1 + 32);
  disp_dispatch_sync(v2, &v8);
  if (v16[3])
  {
    CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)v16[3]);
    if (Count > 0)
    {
      CFTypeRef property = CFDictionaryGetValue((CFDictionaryRef)v16[3], @"brightness-nits-cap");
      if (property)
      {
        if ((DisplayHasDCP(*(void *)(a1 + 32)) & 1) != 0
          && *(_DWORD *)(*(void *)(a1 + 32) + 108)
          && (*(unsigned char *)(*(void *)(a1 + 32) + 321) & 1) == 0)
        {
          IORegistryEntrySetCFProperty(*(_DWORD *)(*(void *)(a1 + 32) + 108), @"BLNitsCap", property);
        }
        else
        {
          __SetBLDriverProperty(@"brightness-nits-cap", property, *(void *)(a1 + 32));
        }
        CFDictionaryRemoveValue((CFMutableDictionaryRef)v16[3], @"brightness-nits-cap");
        --Count;
      }
      Value = CFDictionaryGetValue((CFDictionaryRef)v16[3], @"PreStrobeConfigNits");
      if (Value)
      {
        __SetBLDriverProperty(@"PreStrobeConfigNits", Value, *(void *)(a1 + 32));
        CFDictionaryRemoveValue((CFMutableDictionaryRef)v16[3], @"PreStrobeConfigNits");
        --Count;
      }
      CFTypeRef cf = CFDictionaryGetValue((CFDictionaryRef)v16[3], @"DisplayBrightnessSliderPosition");
      if (cf)
      {
        CFRetain(cf);
        CFDictionaryRemoveValue((CFMutableDictionaryRef)v16[3], @"DisplayBrightnessSliderPosition");
        --Count;
      }
      if (Count > 0) {
        CFDictionaryApplyFunction((CFDictionaryRef)v16[3], (CFDictionaryApplierFunction)__SetBLDriverProperty, *(void **)(a1 + 32));
      }
      if (cf)
      {
        __SetBLDriverProperty(@"DisplayBrightnessSliderPosition", cf, *(void *)(a1 + 32));
        CFRelease(cf);
      }
    }
    CFRelease((CFTypeRef)v16[3]);
  }
  _Block_object_dispose(&v15, 8);
}

@end