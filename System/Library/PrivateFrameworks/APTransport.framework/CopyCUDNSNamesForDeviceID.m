@interface CopyCUDNSNamesForDeviceID
@end

@implementation CopyCUDNSNamesForDeviceID

void __browser_CopyCUDNSNamesForDeviceID_block_invoke(void *a1)
{
  v21[3] = *MEMORY[0x1E4F143B8];
  v2 = (const void *)a1[5];
  v3 = (CFMutableArrayRef *)a1[7];
  uint64_t valuePtr = a1[6];
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v5 = *(void *)(DerivedStorage + 56);
  v21[0] = @"RAOPBonjourInfo";
  v21[1] = v5;
  v21[2] = @"AirPlayP2PBonjourInfo";
  if (!v3)
  {
    APSLogErrorAt();
    int v19 = -6705;
    goto LABEL_14;
  }
  uint64_t v6 = DerivedStorage;
  if (*(unsigned char *)(DerivedStorage + 229))
  {
    int v19 = -6723;
    goto LABEL_14;
  }
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  if (!Mutable)
  {
    APSLogErrorAt();
    int v19 = -6728;
    goto LABEL_14;
  }
  CFMutableArrayRef v9 = Mutable;
  CFAllocatorRef v10 = CFGetAllocator(v2);
  CFNumberRef v11 = CFNumberCreate(v10, kCFNumberSInt64Type, &valuePtr);
  if (!v11)
  {
    APSLogErrorAt();
    int v19 = -6728;
    goto LABEL_20;
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(v6 + 200), v11);
  if (!Value)
  {
    int v19 = -6727;
LABEL_20:
    CFRelease(v9);
    if (!v11) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  CFDictionaryRef v13 = Value;
  uint64_t v14 = 0;
  CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x1E4F1CF90];
  do
  {
    if (CFDictionaryGetValue(v13, (const void *)v21[v14]))
    {
      v16 = (const char *)BonjourDevice_CopyDNSNames();
      if (v16)
      {
        CFStringRef v17 = CFStringCreateWithCStringNoCopy(v7, v16, 0x8000100u, v15);
        if (v17)
        {
          CFStringRef v18 = v17;
          CFArrayAppendValue(v9, v17);
          CFRelease(v18);
        }
      }
    }
    ++v14;
  }
  while (v14 != 3);
  int v19 = 0;
  CFMutableArrayRef *v3 = v9;
LABEL_13:
  CFRelease(v11);
LABEL_14:
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v19;
}

@end