@interface WiFiScanCallback
@end

@implementation WiFiScanCallback

void ___WiFiScanCallback_block_invoke(uint64_t a1)
{
  v1 = (void *)a1;
  uint64_t v2 = *(unsigned int *)(a1 + 56);
  v3 = (void (*)(uint64_t, __CFArray *, uint64_t))v1[5];
  uint64_t v4 = v1[6];
  if (v2) {
    goto LABEL_42;
  }
  CFArrayRef v5 = (const __CFArray *)v1[4];
  if (!v5)
  {
    uint64_t v2 = 4294960596;
LABEL_42:
    v3(v2, 0, v4);
    goto LABEL_36;
  }
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  if (!Mutable)
  {
    uint64_t v2 = 4294960568;
    goto LABEL_42;
  }
  v7 = Mutable;
  CFIndex Count = CFArrayGetCount(v5);
  if (Count < 1)
  {
    v3(0, v7, v4);
    goto LABEL_35;
  }
  CFIndex v9 = Count;
  uint64_t v24 = v4;
  v25 = v3;
  v26 = v1;
  CFIndex v10 = 0;
  v11 = (const void *)*MEMORY[0x1E4F1CFD0];
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v5, v10);
    CFMutableDictionaryRef v13 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (!v13) {
      break;
    }
    v14 = v13;
    if (WiFiNetworkIsAdHoc()) {
      CFDictionarySetValue(v14, @"adhoc", v11);
    }
    __int16 v28 = 0;
    int v27 = 0;
    CFStringRef Property = (const __CFString *)WiFiNetworkGetProperty();
    CFGetHardwareAddress(Property, (char *)&v27, 6uLL, 0);
    CFDictionarySetHardwareAddress(v14, @"bssid", (unsigned __int8 *)&v27, 6);
    Channel = (const void *)WiFiNetworkGetChannel();
    if (Channel) {
      CFDictionarySetValue(v14, @"channel", Channel);
    }
    if (WiFiNetworkGetDirectedState()) {
      CFDictionarySetValue(v14, @"directed", v11);
    }
    if (WiFiNetworkIsEAP()) {
      CFDictionarySetValue(v14, @"enterprise", v11);
    }
    if (WiFiNetworkIsHidden()) {
      CFDictionarySetValue(v14, @"hidden", v11);
    }
    if (WiFiNetworkIsHotspot20())
    {
      uint64_t v17 = 2;
LABEL_21:
      CFDictionarySetInt64(v14, @"hotspot", v17);
      goto LABEL_22;
    }
    if (WiFiNetworkIsHotspot())
    {
      uint64_t v17 = 1;
      goto LABEL_21;
    }
LABEL_22:
    v18 = (const void *)WiFiNetworkGetProperty();
    if (v18) {
      CFDictionarySetValue(v14, @"ie", v18);
    }
    CFDictionarySetValue(v14, @"platformNetwork", ValueAtIndex);
    if (WiFiNetworkIsProfileBased()) {
      CFDictionarySetValue(v14, @"profileBased", v11);
    }
    v19 = (const void *)WiFiNetworkGetProperty();
    if (v19) {
      CFDictionarySetValue(v14, @"rssi", v19);
    }
    uint64_t SSID = WiFiNetworkGetSSID();
    if (SSID) {
      v21 = (__CFString *)SSID;
    }
    else {
      v21 = &stru_1EDD2ACE8;
    }
    CFDictionarySetValue(v14, @"ssid", v21);
    CFArrayAppendValue(v7, v14);
    CFRelease(v14);
    if (v9 == ++v10)
    {
      uint64_t v22 = 0;
      goto LABEL_33;
    }
  }
  uint64_t v22 = 4294960568;
LABEL_33:
  v1 = v26;
  v25(v22, v7, v24);
LABEL_35:
  CFRelease(v7);
LABEL_36:
  v23 = (const void *)v1[4];
  if (v23) {
    CFRelease(v23);
  }
}

@end