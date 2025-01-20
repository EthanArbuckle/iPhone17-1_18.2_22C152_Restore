@interface NSHTTPCookieStorageUtils
+ (__CFString)copyStringAndLowerCase:(uint64_t)a1;
+ (id)getEffectiveTLDPlusOne:(uint64_t)a1;
+ (uint64_t)isURLInMainDocumentDomain:(const __CFURL *)a3 withMainDocumentURL:(int)a4 ignoringTLD:;
+ (uint64_t)looksLikeIPAddress:(uint64_t)a1;
@end

@implementation NSHTTPCookieStorageUtils

+ (id)getEffectiveTLDPlusOne:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  if (v2)
  {
    v3 = [v2 componentsSeparatedByString:@"."];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = objc_msgSend(@".", "stringByAppendingString:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
          [v4 addObject:v9];
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }

    uint64_t v10 = [v4 count];
    v11 = &stru_1ECFAD558;
    while ((int)v10 > 0)
    {
      v12 = [v4 objectAtIndexedSubscript:--v10];
      v13 = [v12 stringByAppendingString:v11];

      v11 = v13;
      if (!isTopLevelDomain(v13, 1))
      {
        v14 = [(__CFString *)v13 lowercaseString];
        v11 = v13;
        goto LABEL_15;
      }
    }
    v14 = 0;
LABEL_15:
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (uint64_t)looksLikeIPAddress:(uint64_t)a1
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  self;
  CFIndex Length = CFStringGetLength(a2);
  uint64_t result = 0;
  if (Length && Length <= 23)
  {
    if (CFStringGetCharacterAtIndex(a2, 0) == 46
      && Length == 1
      && (*(_DWORD *)(MEMORY[0x1E4F14390] + 244) & 0x10000) == 0)
    {
      return 0;
    }
    else
    {
      uint64_t result = CFStringGetCString(a2, buffer, 24, 0x600u);
      if (result)
      {
        uint64_t result = inet_pton(2, buffer, v6);
        if (result != 1) {
          return inet_pton(30, buffer, v6) == 1;
        }
      }
    }
  }
  return result;
}

+ (__CFString)copyStringAndLowerCase:(uint64_t)a1
{
  self;
  CFAllocatorRef v3 = CFGetAllocator(a2);
  MutableCopy = CFStringCreateMutableCopy(v3, 0, a2);
  CFLocaleRef System = CFLocaleGetSystem();
  CFStringLowercase(MutableCopy, System);
  return MutableCopy;
}

+ (uint64_t)isURLInMainDocumentDomain:(const __CFURL *)a3 withMainDocumentURL:(int)a4 ignoringTLD:
{
  self;
  CFStringRef v7 = CFURLCopyHostName(a2);
  CFStringRef v8 = CFURLCopyHostName(a3);
  if (!((unint64_t)v7 | (unint64_t)v8))
  {
    CFStringRef v7 = (const __CFString *)CFRetain(@".^filecookies^");
    CFStringRef v8 = (const __CFString *)CFRetain(@".^filecookies^");
  }
  CFStringRef v9 = v8;
  if (v7 && v8)
  {
    uint64_t v10 = +[NSHTTPCookieStorageUtils copyStringAndLowerCase:]((uint64_t)NSHTTPCookieStorageUtils, v7);
    v11 = +[NSHTTPCookieStorageUtils copyStringAndLowerCase:]((uint64_t)NSHTTPCookieStorageUtils, v9);
    if (CFEqual(v10, v11))
    {
      uint64_t v22 = 1;
      if (!v10) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
    CFURLRef v24 = a3;
    CFStringRef v26 = v7;
    self;
    CFAllocatorRef alloc = CFGetAllocator(v10);
    CFStringFind(v10, @".", 8uLL);
    CFStringFind(v11, @".", 8uLL);
    CFIndex location = CFStringFind(v10, @".", 4uLL).location;
    if (location == -1 || (CFIndex Length = location, location != CFStringGetLength(v10) - 1)) {
      CFIndex Length = CFStringGetLength(v10);
    }
    CFStringRef v25 = v9;
    CFRange v14 = CFStringFind(v11, @".", 4uLL);
    CFRange result = v14;
    if (v14.location == -1 || (CFIndex v15 = v14.location, v14.location != CFStringGetLength(v11) - 1)) {
      CFIndex v15 = CFStringGetLength(v11);
    }
    if (Length < 1)
    {
LABEL_23:
      CFStringRef v9 = v25;
      CFStringRef v7 = v26;
    }
    else
    {
      CFIndex v16 = 0;
      CFIndex v17 = Length;
      while (1)
      {
        CFIndex v18 = v15 >= v17 ? v17 : v15;
        v29.CFIndex location = v16;
        v29.length = v17;
        CFStringRef v19 = CFStringCreateWithSubstring(alloc, v10, v29);
        v30.CFIndex location = (v15 - v17) & ~((v15 - v17) >> 63);
        v30.length = v18;
        if (CFStringCompareWithOptions(v11, v19, v30, 1uLL) == kCFCompareEqualTo) {
          break;
        }
        v31.CFIndex location = v16;
        v31.length = v17;
        int v20 = CFStringFindWithOptions(v10, @".", v31, 0, &result);
        CFIndex v21 = result.location;
        CFRelease(v19);
        if (v20) {
          CFIndex v16 = v21 + 1;
        }
        else {
          CFIndex v16 = -1;
        }
        if (v20)
        {
          CFIndex v17 = Length + ~v21;
          if (v17 > 0) {
            continue;
          }
        }
        goto LABEL_23;
      }
      CFStringRef v9 = v25;
      CFStringRef v7 = v26;
      if (v19)
      {
        uint64_t v22 = a4 | !isTopLevelDomain(v19, 1);
        CFRelease(v19);
        if (!v10)
        {
LABEL_31:
          if (v11) {
            CFRelease(v11);
          }
          goto LABEL_33;
        }
LABEL_30:
        CFRelease(v10);
        goto LABEL_31;
      }
    }
    uint64_t v22 = v24 == 0;
    if (!v10) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  uint64_t v22 = 0;
  if (!v8)
  {
    uint64_t v22 = 0;
    if (!v7) {
      return v22;
    }
    goto LABEL_34;
  }
LABEL_33:
  CFRelease(v9);
  if (v7) {
LABEL_34:
  }
    CFRelease(v7);
  return v22;
}

@end