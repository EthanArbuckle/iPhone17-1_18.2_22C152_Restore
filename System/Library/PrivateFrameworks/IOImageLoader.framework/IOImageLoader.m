const void *IOImageLoaderImageDictionary::getAttributes(IOImageLoaderImageDictionary *this, __CFDictionary *a2, const char *a3)
{
  CFStringRef v5;
  CFStringRef v6;
  CFIndex Count;
  const void *Value;

  v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], (const char *)a2, 0x8000100u);
  v6 = v5;
  if (this && v5)
  {
    Count = CFDictionaryGetCount(this);
    Value = 0;
    if (a2 && Count) {
      Value = CFDictionaryGetValue(this, v6);
    }
  }
  else
  {
    Value = 0;
    if (!v5) {
      return Value;
    }
  }
  CFRelease(v6);
  return Value;
}

const void *IOImageLoaderImageDictionary::getAttributes(IOImageLoaderImageDictionary *this, const __CFString *a2, const __CFString *a3)
{
  if (!this) {
    return 0;
  }
  CFIndex Count = CFDictionaryGetCount(this);
  if (!a2 || !Count) {
    return 0;
  }
  CStringPtr = (__CFDictionary *)CFStringGetCStringPtr(a2, 0x8000100u);

  return IOImageLoaderImageDictionary::getAttributes(this, CStringPtr, v7);
}

const void *IOImageLoaderImageDictionary::getAttribute(IOImageLoaderImageDictionary *this, __CFDictionary *a2, const char *a3)
{
  CFStringRef v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], (const char *)a2, 0x8000100u);
  CFStringRef v6 = v5;
  if (this && v5)
  {
    CFIndex Count = CFDictionaryGetCount(this);
    Value = 0;
    if (a2 && Count) {
      Value = CFDictionaryGetValue(this, v6);
    }
  }
  else
  {
    Value = 0;
    if (!v5) {
      return Value;
    }
  }
  CFRelease(v6);
  return Value;
}

const void *IOImageLoaderImageDictionary::getAttribute(IOImageLoaderImageDictionary *this, const __CFString *a2, const __CFString *a3)
{
  if (!this) {
    return 0;
  }
  CFIndex Count = CFDictionaryGetCount(this);
  if (!a2 || !Count) {
    return 0;
  }
  CStringPtr = (__CFDictionary *)CFStringGetCStringPtr(a2, 0x8000100u);

  return IOImageLoaderImageDictionary::getAttribute(this, CStringPtr, v7);
}

uint64_t IOImageLoaderImageDictionary::setAttributeWithObject(IOImageLoaderImageDictionary *this, __CFDictionary *a2, const char *a3, void *a4)
{
  uint64_t result = 0;
  if (this && a2 && a3)
  {
    uint64_t result = (uint64_t)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], (const char *)a2, 0x8000100u);
    if (result)
    {
      v7 = (const void *)result;
      CFDictionarySetValue(this, (const void *)result, a3);
      CFRelease(v7);
      return 1;
    }
  }
  return result;
}

uint64_t IOImageLoaderImageDictionary::setAttributeWithObject(IOImageLoaderImageDictionary *this, CFStringRef theString, const __CFString *a3, void *a4)
{
  if (!this || !theString || !a3) {
    return 0;
  }
  CStringPtr = (__CFDictionary *)CFStringGetCStringPtr(theString, 0x8000100u);

  return IOImageLoaderImageDictionary::setAttributeWithObject(this, CStringPtr, (const char *)a3, v7);
}

BOOL IOImageLoaderImageDictionary::setAttributeWithString(IOImageLoaderImageDictionary *this, __CFDictionary *a2, const char *a3, const char *a4)
{
  BOOL v4 = 0;
  if (this && a2 && a3)
  {
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFStringRef v8 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], (const char *)a2, 0x8000100u);
    if (v8)
    {
      CFStringRef v9 = v8;
      CFStringRef v10 = CFStringCreateWithCString(v7, a3, 0x8000100u);
      BOOL v4 = v10 != 0;
      if (v10)
      {
        CFStringRef v11 = v10;
        CFDictionarySetValue(this, v9, v10);
        CFRelease(v9);
        CFStringRef v9 = v11;
      }
      CFRelease(v9);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

BOOL IOImageLoaderImageDictionary::setAttributeWithString(IOImageLoaderImageDictionary *this, CFStringRef theString, const __CFString *a3, const __CFString *a4)
{
  if (!this || !theString || !a3) {
    return 0;
  }
  CStringPtr = (__CFDictionary *)CFStringGetCStringPtr(theString, 0x8000100u);
  CFAllocatorRef v7 = CFStringGetCStringPtr(a3, 0x8000100u);

  return IOImageLoaderImageDictionary::setAttributeWithString(this, CStringPtr, v7, v8);
}

uint64_t IOImageLoaderImageDictionary::setAttributeWithNumber(IOImageLoaderImageDictionary *this, __CFDictionary *a2, const char *a3)
{
  v16[1] = *MEMORY[0x263EF8340];
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v7 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], (const char *)a2, 0x8000100u);
  v16[0] = a3;
  CFNumberRef v8 = CFNumberCreate(v6, kCFNumberLongLongType, v16);
  CFNumberRef v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v12 = v10 || this == 0 || a2 == 0;
  int v13 = v12;
  if (v12)
  {
    if (!v8)
    {
      uint64_t v14 = 0;
      if (!v7) {
        return v14;
      }
      goto LABEL_16;
    }
  }
  else
  {
    CFDictionarySetValue(this, v7, v8);
  }
  uint64_t v14 = v13 ^ 1u;
  CFRelease(v9);
  if (v7) {
LABEL_16:
  }
    CFRelease(v7);
  return v14;
}

uint64_t IOImageLoaderImageDictionary::setAttributeWithNumber(IOImageLoaderImageDictionary *this, const __CFString *a2, const __CFString *a3, const __CFNumber *a4)
{
  valuePtr[1] = *(const char **)MEMORY[0x263EF8340];
  valuePtr[0] = 0;
  printf("DEBUG: %s:%d\n", "setAttributeWithNumber", 258);
  uint64_t result = 0;
  if (this && a2 && a3)
  {
    uint64_t result = CFNumberGetValue((CFNumberRef)a3, kCFNumberLongLongType, valuePtr);
    if (result)
    {
      CStringPtr = (__CFDictionary *)CFStringGetCStringPtr(a2, 0x8000100u);
      return IOImageLoaderImageDictionary::setAttributeWithNumber(this, CStringPtr, valuePtr[0]);
    }
  }
  return result;
}

uint64_t IOImageLoaderImageDictionary::setAttributeWithNumber(IOImageLoaderImageDictionary *this, const __CFString *a2, const __CFString *a3)
{
  v10[1] = *(char **)MEMORY[0x263EF8340];
  v10[0] = (char *)a3;
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberLongLongType, v10);
  CFNumberRef v6 = v5;
  if (this && a2 && v5)
  {
    CStringPtr = (__CFDictionary *)CFStringGetCStringPtr(a2, 0x8000100u);
    uint64_t v8 = IOImageLoaderImageDictionary::setAttributeWithNumber(this, CStringPtr, v10[0]);
LABEL_5:
    CFRelease(v6);
    return v8;
  }
  uint64_t v8 = 0;
  uint64_t result = 0;
  if (v6) {
    goto LABEL_5;
  }
  return result;
}

uint64_t IOImageLoaderImageDictionary::setAttributeWithNumber(IOImageLoaderImageDictionary *this, __CFDictionary *a2, CFNumberRef number, const __CFNumber *a4)
{
  v7[1] = *(char **)MEMORY[0x263EF8340];
  v7[0] = 0;
  if (!number) {
    return 0;
  }
  uint64_t result = CFNumberGetValue(number, kCFNumberLongLongType, v7);
  if (result) {
    return IOImageLoaderImageDictionary::setAttributeWithNumber(this, a2, v7[0]);
  }
  return result;
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}