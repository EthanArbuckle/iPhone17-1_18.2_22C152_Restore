@interface CFBundleInfoPlistProcessInfoDictionary
@end

@implementation CFBundleInfoPlistProcessInfoDictionary

void ___CFBundleInfoPlistProcessInfoDictionary_block_invoke(CFMutableArrayRef *a1, const __CFString *cf)
{
  v39[6] = *(void *)off_1ECE0A5B0;
  if (CFGetTypeID(cf) == 7)
  {
    if (!cf) {
      return;
    }
    CFRange v4 = CFStringFind(cf, @"#", 4uLL);
    if (v4.location > 0)
    {
      CFIndex Length = CFStringGetLength(cf);
      v43.uint64_t location = v4.location + v4.length;
      v43.length = Length - (v4.location + v4.length);
      CFStringRef v6 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, cf, v43);
      if (CFEqual(v6, @"CH"))
      {
        if (_isValidSpecialCase_onceToken != -1) {
          dispatch_once(&_isValidSpecialCase_onceToken, &__block_literal_global_62);
        }
        if (_isValidSpecialCase_useSpecialCase) {
          goto LABEL_8;
        }
      }
      else if (CFEqual(v6, @"override"))
      {
LABEL_8:
        v44.uint64_t location = 0;
        v44.length = v4.location;
        CFStringRef v7 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, cf, v44);
        v8 = a1[5];
        Value = CFDictionaryGetValue(a1[6], cf);
        CFDictionarySetValue(v8, v7, Value);
        CFArrayAppendValue(a1[4], cf);
        CFRelease(v7);
        if (v6)
        {
          CFRelease(v6);
        }
        return;
      }
      if (v6) {
        CFRelease(v6);
      }
    }
    CFRange v11 = CFStringFind(cf, @"-", 4uLL);
    uint64_t location = v11.location;
    CFRange v13 = CFStringFind(cf, @"~", 4uLL);
    if ((v11.location != -1 || v13.location != -1)
      && (v11.location == -1 || v13.location == -1 || v13.location > v11.location))
    {
      CFIndex v14 = CFStringGetLength(cf);
      CFIndex v15 = v13.location == -1 ? v14 : v13.location;
      CFIndex v16 = v13.location == -1 ? -1 : v13.location + v13.length;
      CFIndex v17 = v13.location == -1 ? 0 : v14 - (v13.location + v13.length);
      if (v11.location == -1)
      {
        uint64_t location = v13.location;
        CFIndex v18 = -1;
      }
      else
      {
        CFIndex v18 = v11.location + v11.length;
      }
      CFIndex v19 = v11.location == -1 ? 0 : v15 - (v11.location + v11.length);
      if (location >= 1 && (v18 == -1 || v19 >= 1) && (v16 == -1 || v17 >= 1))
      {
        if (v18 != -1 || v16 == -1)
        {
          if (v18 == -1 || v16 != -1)
          {
            v42.uint64_t location = v16;
            v42.length = v17;
            int v20 = _CFBundleSupportedProductName(cf, v42);
            if (v20)
            {
              v46.uint64_t location = v18;
              v46.length = v19;
              int v20 = CFStringFindWithOptions(cf, @"iphoneos", v46, 8uLL, 0) != 0;
            }
          }
          else
          {
            v45.uint64_t location = v18;
            v45.length = v19;
            int v20 = CFStringFindWithOptions(cf, @"iphoneos", v45, 8uLL, 0);
          }
        }
        else
        {
          v41.uint64_t location = v16;
          v41.length = v17;
          int v20 = _CFBundleSupportedProductName(cf, v41);
        }
        if (v20)
        {
          v47.uint64_t location = 0;
          v47.length = location;
          CFStringRef v21 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, cf, v47);
          if (v18 == -1)
          {
            CFStringRef v22 = 0;
          }
          else
          {
            v48.uint64_t location = v18;
            v48.length = v19;
            CFStringRef v22 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, cf, v48);
          }
          if (v16 == -1)
          {
            CFStringRef v23 = 0;
          }
          else
          {
            v49.uint64_t location = v16;
            v49.length = v17;
            CFStringRef v23 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, cf, v49);
          }
          if (!((unint64_t)v22 | (unint64_t)v23))
          {
            CFStringRef v22 = 0;
            goto LABEL_72;
          }
          if (v22)
          {
            if (v23)
            {
              if (_CFGetProductName_onceToken != -1) {
                dispatch_once(&_CFGetProductName_onceToken, &__block_literal_global_46);
              }
              int v24 = CFEqual((CFTypeRef)_CFGetProductName__cfBundlePlatform, v23);
              if (v24) {
                int v24 = CFEqual(@"iphoneos", v22) != 0;
              }
LABEL_71:
              if (!v24)
              {
                CFArrayAppendValue(a1[4], cf);
                if (!v22) {
                  goto LABEL_80;
                }
                goto LABEL_79;
              }
LABEL_72:
              CFMutableArrayRef v27 = a1[6];
              Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
              CFMutableArrayRef v38 = v27;
              if (_CFGetProductName_onceToken != -1) {
                dispatch_once(&_CFGetProductName_onceToken, &__block_literal_global_46);
              }
              CFStringRef v29 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@-%@~%@", v21, @"iphoneos", _CFGetProductName__cfBundlePlatform);
              if (_CFGetProductName_onceToken != -1) {
                dispatch_once(&_CFGetProductName_onceToken, &__block_literal_global_46);
              }
              CFStringRef v30 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@~%@", v21, _CFGetProductName__cfBundlePlatform);
              CFStringRef v31 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@-%@", v21, @"iphoneos");
              CFArrayAppendValue(Mutable, v29);
              CFArrayAppendValue(Mutable, v30);
              CFArrayAppendValue(Mutable, v31);
              CFRelease(v29);
              CFRelease(v30);
              CFRelease(v31);
              CFArrayRef v32 = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
              CFIndex Count = CFArrayGetCount(Mutable);
              v39[0] = off_1ECE0A5A0;
              v39[1] = 0x40000000;
              v39[2] = ___CopySortedOverridesForBaseKey_block_invoke;
              v39[3] = &__block_descriptor_tmp_87;
              v39[4] = v38;
              v39[5] = v32;
              CFArrayApply((uint64_t)Mutable, 0, Count, (uint64_t)v39);
              CFRelease(Mutable);
              ValueAtIndex = CFArrayGetValueAtIndex(v32, 0);
              v35 = a1[5];
              v36 = CFDictionaryGetValue(a1[6], ValueAtIndex);
              CFDictionarySetValue(v35, v21, v36);
              CFIndex v37 = CFArrayGetCount(v32);
              if (v37 >= 1)
              {
                v50.uint64_t location = 1;
                v50.length = v37 - 1;
                CFArrayAppendArray(a1[4], v32, v50);
              }
              CFRelease(v32);
              if (!v22) {
                goto LABEL_80;
              }
LABEL_79:
              CFRelease(v22);
LABEL_80:
              if (v23) {
                CFRelease(v23);
              }
              CFRelease(v21);
              return;
            }
            v25 = @"iphoneos";
            v26 = v22;
          }
          else
          {
            if (_CFGetProductName_onceToken != -1) {
              dispatch_once(&_CFGetProductName_onceToken, &__block_literal_global_46);
            }
            v25 = (__CFString *)_CFGetProductName__cfBundlePlatform;
            v26 = v23;
          }
          int v24 = CFEqual(v25, v26);
          goto LABEL_71;
        }
      }
    }
  }
  else
  {
    v10 = a1[4];
    CFArrayAppendValue(v10, cf);
  }
}

void ___CFBundleInfoPlistProcessInfoDictionary_block_invoke_2(uint64_t a1, const void *a2, const void *a3)
{
}

@end