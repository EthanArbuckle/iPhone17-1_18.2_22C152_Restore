@interface UpdateLastUpdatedTime
@end

@implementation UpdateLastUpdatedTime

void __figMobileAsset_UpdateLastUpdatedTime_block_invoke(uint64_t a1)
{
  if (figMobileAsset_IsAssetTypeRegistered(*(void **)(a1 + 32)))
  {
    Value = (CFAbsoluteTime *)CFDictionaryGetValue((CFDictionaryRef)gRegisteredAssetTypes, *(const void **)(a1 + 32));
    Value[5] = CFAbsoluteTimeGetCurrent();
    CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    CFDictionaryRef v5 = (const __CFDictionary *)CFPreferencesCopyValue(@"mobileAssetUpdateTimes", @"com.apple.celestial", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    CFDictionaryRef v6 = v5;
    if (v5 && (CFTypeID v7 = CFGetTypeID(v5), v7 == CFDictionaryGetTypeID())) {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v6);
    }
    else {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    CFMutableDictionaryRef v9 = MutableCopy;
    FigCFDictionarySetDouble(MutableCopy, *(const void **)(a1 + 32), Value[5]);
    CFPreferencesSetValue(@"mobileAssetUpdateTimes", v9, @"com.apple.celestial", v3, v4);
    CFPreferencesSynchronize(@"com.apple.celestial", v3, v4);
  }
  else
  {
    CFDictionaryRef v6 = 0;
    CFMutableDictionaryRef v9 = 0;
  }
  v10 = *(const void **)(a1 + 32);
  if (v10) {
    CFRelease(v10);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v9)
  {
    CFRelease(v9);
  }
}

@end