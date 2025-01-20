void H10ISP::H10ISPAppendNamedValuesToCFString(__CFString *this, __CFString *a2, const __CFArray *a3, const __CFArray *a4)
{
  unsigned int v4;
  int v5;
  CFIndex v7;
  CFDictionaryRef ValueAtIndex;
  CFDictionaryRef v9;
  CFDictionaryRef v10;
  CFDictionaryRef v11;
  BOOL v12;
  int CString;
  char *v14;
  char *v15;
  BOOL v16;
  int v17;
  BOOL v18;
  const char *v19;
  int v20;
  unsigned int v21;
  CFIndex Count;
  char v24[256];
  char buffer[256];
  uint64_t v26;

  v4 = a4;
  v5 = (int)a2;
  v26 = *MEMORY[0x263EF8340];
  Count = CFArrayGetCount(a3);
  if (Count >= 1)
  {
    v7 = 0;
    v21 = v4;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v7);
      v9 = Name(ValueAtIndex);
      v10 = Value(ValueAtIndex);
      v11 = List(ValueAtIndex);
      if (v9)
      {
        v12 = CFStringGetCString((CFStringRef)v9, buffer, 256, 0x8000100u) != 0;
        if (!v10) {
          goto LABEL_12;
        }
      }
      else
      {
        v12 = 0;
        if (!v10)
        {
LABEL_12:
          v16 = !v12;
          v15 = "";
          if (v16) {
            v14 = "";
          }
          else {
            v14 = buffer;
          }
          goto LABEL_15;
        }
      }
      CString = CFStringGetCString((CFStringRef)v10, v24, 256, 0x8000100u);
      if (v12) {
        v14 = buffer;
      }
      else {
        v14 = "";
      }
      if (CString) {
        v15 = v24;
      }
      else {
        v15 = "";
      }
LABEL_15:
      v17 = v5;
      if (v5 >= 1)
      {
        do
        {
          CFStringAppendCString(this, "    ", 0x8000100u);
          --v17;
        }
        while (v17);
      }
      if (v11)
      {
        if (v21)
        {
          CFStringAppendCString(this, "<name>", 0x8000100u);
          CFStringAppendCString(this, v14, 0x8000100u);
          CFStringAppendCString(this, "</name>", 0x8000100u);
          v14 = "<value>";
        }
        CFStringAppendCString(this, v14, 0x8000100u);
        CFStringAppendCString(this, "\n", 0x8000100u);
        H10ISP::H10ISPAppendNamedValuesToCFString((H10ISP *)this, (__CFString *)(v5 + 1), (int)v11, (const __CFArray *)v21, v18);
        if (!v5) {
          CFStringAppendCString(this, "\n", 0x8000100u);
        }
        v19 = "</value>\n";
        if ((v21 & 1) == 0) {
          goto LABEL_37;
        }
      }
      else
      {
        if (v9) {
          LODWORD(v9) = CFStringGetLength((CFStringRef)v9);
        }
        if (v21)
        {
          CFStringAppendCString(this, "<name>", 0x8000100u);
          CFStringAppendCString(this, v14, 0x8000100u);
          v14 = "</name>";
        }
        CFStringAppendCString(this, v14, 0x8000100u);
        if ((int)v9 <= 37)
        {
          if (((38 - v9) & ~((38 - (int)v9) >> 31)) <= 1) {
            v20 = 1;
          }
          else {
            v20 = (38 - v9) & ~((38 - (int)v9) >> 31);
          }
          do
          {
            CFStringAppendCString(this, " ", 0x8000100u);
            --v20;
          }
          while (v20);
        }
        CFStringAppendCString(this, "\t", 0x8000100u);
        if (v21)
        {
          CFStringAppendCString(this, "<value>", 0x8000100u);
          CFStringAppendCString(this, v15, 0x8000100u);
          v15 = "</value>";
        }
        CFStringAppendCString(this, v15, 0x8000100u);
        v19 = "\n";
      }
      CFStringAppendCString(this, v19, 0x8000100u);
LABEL_37:
      ++v7;
    }
    while (v7 != Count);
  }
}

__CFString *H10ISP::H10ISPCreateFrameMetaDataAsCFString(uint64_t a1, const __CFArray *a2)
{
  Mutable = CFStringCreateMutable(0, 0);
  if (!Mutable) {
    return @"Apple H10 MetaData\n";
  }
  v5 = Mutable;
  CFStringAppendCString(Mutable, "Apple H10 Metadata\n", 0x8000100u);
  if (!a1)
  {
    v8 = "No additional frame metadata.\n";
LABEL_8:
    CFStringAppendCString(v5, v8, 0x8000100u);
    return v5;
  }
  CFArrayRef FormatedMetadata = (const __CFArray *)H10ISP::CreateFormatedMetadata(a1);
  if (!FormatedMetadata)
  {
    v8 = "Frame metadata could not be formatted.\n";
    goto LABEL_8;
  }
  CFArrayRef v7 = FormatedMetadata;
  H10ISP::H10ISPAppendNamedValuesToCFString(v5, 0, FormatedMetadata, a2);
  CFRelease(v7);
  return v5;
}

__CFDictionary *H10ISP::H10ISPCreateFrameMetaDataAsCFDictionary(uint64_t a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFArrayRef FormatedMetadata = (const __CFArray *)H10ISP::CreateFormatedMetadata(a1);
  if (FormatedMetadata)
  {
    CFArrayRef v5 = FormatedMetadata;
    CFIndex Count = CFArrayGetCount(FormatedMetadata);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      CFIndex v8 = 0;
      v9 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
      v10 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v8);
        CFDictionaryRef v12 = List(ValueAtIndex);
        if (v12)
        {
          v13 = v12;
          v14 = CFDictionaryCreateMutable(v2, 0, v9, v10);
          H10ISP::AddMetadataToDictionary(v14, v13, v15);
          CFDictionaryRef v16 = Name(ValueAtIndex);
          CFDictionaryAddValue(Mutable, v16, v14);
          CFRelease(v14);
        }
        else
        {
          CFDictionaryRef v17 = Name(ValueAtIndex);
          CFDictionaryRef v18 = Value(ValueAtIndex);
          CFDictionaryAddValue(Mutable, v17, v18);
        }
        ++v8;
      }
      while (v7 != v8);
    }
  }
  return Mutable;
}

const __CFArray *H10ISP::AddMetadataToDictionary(H10ISP *this, __CFDictionary *a2, __CFArray *a3)
{
  CFArrayRef result = CountNamedValues(a2);
  if ((int)result >= 1)
  {
    int v6 = 0;
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFIndex v8 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
    v9 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
    do
    {
      CFArrayRef NamedValue = GetNamedValue(a2, v6);
      CFDictionaryRef v11 = List(NamedValue);
      if (v11)
      {
        CFDictionaryRef v12 = v11;
        Mutable = CFDictionaryCreateMutable(v7, 0, v8, v9);
        H10ISP::AddMetadataToDictionary(Mutable, v12, v14);
        CFDictionaryRef v15 = Name(NamedValue);
        CFDictionaryAddValue(this, v15, Mutable);
        CFRelease(Mutable);
      }
      else
      {
        CFDictionaryRef v16 = Name(NamedValue);
        CFDictionaryRef v17 = Value(NamedValue);
        CFDictionaryAddValue(this, v16, v17);
      }
      ++v6;
      CFArrayRef result = CountNamedValues(a2);
    }
    while (v6 < (int)result);
  }
  return result;
}

__CFDictionary *H10ISP::H10ISPCreateEXIFDictFromMetadataDict(H10ISP *this, const __CFDictionary *a2, int a3)
{
  int v56 = (int)a2;
  int v55 = a3;
  uint64_t valuePtr = 0;
  CFTypeRef cf = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    CFNumberRef v6 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
    CFTypeRef cf = v6;
    if (v6)
    {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0F4C8], v6);
      CFRelease(cf);
    }
    CFMutableDictionaryRef v7 = CFDictionaryCreateMutable(v4, 18, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (v7)
    {
      CFIndex v8 = v7;
      if (v56 && v55)
      {
        CFNumberRef v9 = CFNumberCreate(v4, kCFNumberSInt32Type, &v56);
        CFTypeRef cf = v9;
        if (v9)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F2E8], v9);
          CFRelease(cf);
        }
        CFNumberRef v10 = CFNumberCreate(v4, kCFNumberSInt32Type, &v55);
        CFTypeRef cf = v10;
        if (v10)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F2F0], v10);
          CFRelease(cf);
        }
      }
      if (this)
      {
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x263F2D090], &cf))
        {
          double v51 = 0.0;
          long double v52 = 0.0;
          CFNumberGetValue((CFNumberRef)cf, kCFNumberFloat64Type, &v51);
          double v50 = 0.0;
          if (v51 > 0.0) {
            double v50 = 1.0 / (double)(int)(1.0 / v51 + 0.5);
          }
          CFNumberRef v11 = CFNumberCreate(v4, kCFNumberFloat64Type, &v50);
          if (v11)
          {
            CFNumberRef v12 = v11;
            CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F270], cf);
            CFRelease(v12);
          }
          if (v51 > 0.0) {
            long double v52 = -log2(v51);
          }
          CFNumberRef v13 = CFNumberCreate(v4, kCFNumberFloat64Type, &v52);
          CFTypeRef cf = v13;
          if (v13)
          {
            CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F310], v13);
            CFRelease(cf);
          }
        }
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x263F2D108], &cf))
        {
          double v51 = 0.0;
          long double v52 = 0.0;
          CFNumberGetValue((CFNumberRef)cf, kCFNumberFloat64Type, &v52);
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F278], cf);
          if (v52 > 0.0)
          {
            long double v14 = log2(v52);
            double v51 = v14 + v14;
          }
          CFNumberRef v15 = CFNumberCreate(v4, kCFNumberFloat64Type, &v51);
          CFTypeRef cf = v15;
          if (v15)
          {
            CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F1B8], v15);
            CFRelease(cf);
          }
        }
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x263F2D208], &cf))
        {
          LOWORD(v52) = 0;
          uint64_t v16 = 2u;
          CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt16Type, &v52);
          __int16 v17 = 12;
          while (SLOWORD(v52) > (*(__int16 *)((char *)&unk_236A1E494 + v16) + v17) >> 1)
          {
            __int16 v17 = *(_WORD *)((char *)&unk_236A1E494 + v16);
            v16 += 2;
            if (v16 == 64) {
              goto LABEL_32;
            }
          }
          LOWORD(v52) = v17;
LABEL_32:
          CFTypeRef cf = CFNumberCreate(v4, kCFNumberSInt16Type, &v52);
          if (cf)
          {
            CFArrayRef v18 = CFArrayCreate(v4, &cf, 1, MEMORY[0x263EFFF70]);
            CFRelease(cf);
            if (v18)
            {
              CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F298], v18);
              CFRelease(v18);
            }
          }
        }
        if (CFDictionaryGetValueIfPresent(this, @"FocusWindow", &cf))
        {
          LODWORD(v52) = 0;
          LOWORD(v51) = 0;
          LOWORD(v50) = 0;
          int v49 = 0;
          CFMutableArrayRef v19 = CFArrayCreateMutable(v4, 4, MEMORY[0x263EFFF70]);
          if (v19)
          {
            v20 = v19;
            CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)cf, 0);
            CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &v52);
            LOWORD(v51) = v56 * LODWORD(v52) / 0x3E8u;
            CFNumberRef v22 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)cf, 1);
            CFNumberGetValue(v22, kCFNumberIntType, &v52);
            LOWORD(v50) = v55 * LODWORD(v52) / 0x3E8u;
            CFNumberRef v23 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)cf, 2);
            CFNumberGetValue(v23, kCFNumberIntType, &v52);
            HIWORD(v49) = v56 * LODWORD(v52) / 0x3E8u;
            CFNumberRef v24 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)cf, 3);
            CFNumberGetValue(v24, kCFNumberIntType, &v52);
            LOWORD(v49) = v55 * LODWORD(v52) / 0x3E8u;
            LOWORD(v51) += (__int16)(HIWORD(v49) + (HIWORD(v49) >> 15)) >> 1;
            LOWORD(v50) += (__int16)(v49 + (((v55 * LODWORD(v52) / 0x3E8u) & 0x8000) >> 15)) >> 1;
            CFNumberRef v25 = CFNumberCreate(v4, kCFNumberShortType, &v51);
            if (v25)
            {
              CFNumberRef v26 = v25;
              CFArrayAppendValue(v20, v25);
              CFRelease(v26);
            }
            CFNumberRef v27 = CFNumberCreate(v4, kCFNumberShortType, &v50);
            if (v27)
            {
              CFNumberRef v28 = v27;
              CFArrayAppendValue(v20, v27);
              CFRelease(v28);
            }
            CFNumberRef v29 = CFNumberCreate(v4, kCFNumberShortType, (char *)&v49 + 2);
            if (v29)
            {
              CFNumberRef v30 = v29;
              CFArrayAppendValue(v20, v29);
              CFRelease(v30);
            }
            CFNumberRef v31 = CFNumberCreate(v4, kCFNumberShortType, &v49);
            if (v31)
            {
              CFNumberRef v32 = v31;
              CFArrayAppendValue(v20, v31);
              CFRelease(v32);
            }
            CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F328], v20);
            CFRelease(v20);
          }
        }
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x263F2D508], &cf))
        {
          LODWORD(v52) = -1;
          LODWORD(v51) = 0;
          CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &v52);
          if ((LODWORD(v52) & 0x80000000) == 0)
          {
            if (LODWORD(v52) > 8)
            {
              int v33 = LODWORD(v52) > 0xC ? 2 : 1;
              LODWORD(v51) = v33;
            }
            else
            {
              LODWORD(v51) = 0;
            }
            CFNumberRef v34 = CFNumberCreate(v4, kCFNumberSInt32Type, &v51);
            if (v34)
            {
              CFNumberRef v35 = v34;
              CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F308], v34);
              CFRelease(v35);
            }
          }
        }
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x263F2D118], &cf)) {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F290], cf);
        }
        int ValueIfPresent = CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x263F2D658], &cf);
        v37 = (const void **)MEMORY[0x263F0F350];
        if (ValueIfPresent) {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F350], cf);
        }
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x263F2D110], &cf)) {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F288], cf);
        }
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x263F2D258], &cf)) {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F2A0], cf);
        }
        HIDWORD(valuePtr) = 1;
        if (CFDictionaryGetValueIfPresent(this, @"MeteringMode", &cf)) {
          CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, (char *)&valuePtr + 4);
        }
        CFNumberRef v38 = CFNumberCreate(v4, kCFNumberSInt32Type, (char *)&valuePtr + 4);
        CFTypeRef cf = v38;
        if (v38)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F2C8], v38);
          CFRelease(cf);
        }
        LODWORD(valuePtr) = 2;
        CFNumberRef v39 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        CFTypeRef cf = v39;
        if (v39)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F268], v39);
          CFRelease(cf);
        }
        CFTypeRef cf = @"H10ISP Test Application";
        CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F2C0], @"H10ISP Test Application");
        CFRelease(cf);
        LODWORD(valuePtr) = 0;
        if (CFDictionaryGetValueIfPresent(this, @"GlobalShutterFlag", &cf))
        {
          LODWORD(v52) = -1;
          CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &v52);
        }
        LODWORD(valuePtr) = 32;
        CFNumberRef v40 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        CFTypeRef cf = v40;
        if (v40)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F280], v40);
          CFRelease(cf);
        }
        LODWORD(valuePtr) = 2;
        CFNumberRef v41 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        CFTypeRef cf = v41;
        if (v41)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F300], v41);
          CFRelease(cf);
        }
        LODWORD(valuePtr) = 1;
        CFNumberRef v42 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        CFTypeRef cf = v42;
        if (v42)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F2F8], v42);
          CFRelease(cf);
        }
        LODWORD(valuePtr) = 0;
        CFNumberRef v43 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        CFTypeRef cf = v43;
        if (v43)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F260], v43);
          CFRelease(cf);
        }
        LODWORD(valuePtr) = 0;
        CFNumberRef v44 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        CFTypeRef cf = v44;
        if (v44)
        {
          CFDictionaryAddValue(v8, *v37, v44);
          CFRelease(cf);
        }
        CFDataRef Value = (const __CFData *)CFDictionaryGetValue(this, (const void *)*MEMORY[0x263F2D410]);
        if (Value)
        {
          BytePtr = CFDataGetBytePtr(Value);
          if (BytePtr)
          {
            v47 = H10ISP::H10ISPCreateFrameMetaDataAsCFString((uint64_t)BytePtr, 0);
            CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F340], v47);
            CFRelease(v47);
          }
        }
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0F248], v8);
      }
      CFRelease(v8);
    }
  }
  return Mutable;
}

CFDictionaryRef CreateNamedValue(const char *cStr, const char *a2, __CFArray *a3)
{
  keys[3] = *(void **)MEMORY[0x263EF8340];
  memset(keys, 0, 24);
  values = 0;
  CFTypeRef cf = 0;
  uint64_t v12 = 0;
  __int16 v9 = 0;
  CFArrayRef v5 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (cStr)
  {
    keys[0] = @"Name";
    values = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x8000100u);
    unsigned int v6 = 1;
    LOBYTE(v9) = 1;
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  unsigned int v6 = 0;
  if (a2)
  {
LABEL_3:
    keys[v6] = @"Value";
    *(&values + v6) = (void *)CFStringCreateWithCString(*v5, a2, 0x8000100u);
    *(unsigned char *)((unint64_t)&v9 | v6++) = 1;
  }
LABEL_4:
  if (a3)
  {
    keys[v6] = @"List";
    *(&values + v6++) = a3;
  }
  else if (!v6)
  {
    return 0;
  }
  CFDictionaryRef v7 = CFDictionaryCreate(*v5, (const void **)keys, (const void **)&values, v6, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if ((_BYTE)v9) {
    CFRelease(values);
  }
  if (HIBYTE(v9)) {
    CFRelease(cf);
  }
  return v7;
}

void ReleaseNamedValue(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

CFDictionaryRef Name(const __CFDictionary *result)
{
  value = 0;
  if (result)
  {
    CFDictionaryGetValueIfPresent(result, @"Name", (const void **)&value);
    return (const __CFDictionary *)value;
  }
  return result;
}

CFDictionaryRef Value(const __CFDictionary *result)
{
  value = 0;
  if (result)
  {
    CFDictionaryGetValueIfPresent(result, @"Value", (const void **)&value);
    return (const __CFDictionary *)value;
  }
  return result;
}

CFDictionaryRef List(const __CFDictionary *result)
{
  value = 0;
  if (result)
  {
    CFDictionaryGetValueIfPresent(result, @"List", (const void **)&value);
    return (const __CFDictionary *)value;
  }
  return result;
}

CFMutableArrayRef CreateNamedValues(void)
{
  return CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
}

void ReleaseNamedValues(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void ClearNamedValues(CFMutableArrayRef theArray)
{
  if (theArray) {
    CFArrayRemoveAllValues(theArray);
  }
}

void AppendNamedValue(CFMutableArrayRef theArray, const void *value)
{
  if (theArray) {
    CFArrayAppendValue(theArray, value);
  }
}

CFArrayRef CountNamedValues(const __CFArray *theArray)
{
  if (theArray) {
    return (const __CFArray *)CFArrayGetCount(theArray);
  }
  return theArray;
}

CFArrayRef GetNamedValue(const __CFArray *result, int a2)
{
  if (result) {
    return (const __CFArray *)CFArrayGetValueAtIndex(result, a2);
  }
  return result;
}

void NamedValue::NamedValue(NamedValue *this)
{
  *(void *)this = 0;
}

{
  *(void *)this = 0;
}

void NamedValue::NamedValue(NamedValue *this, const char *a2, const char *a3, __CFArray *a4)
{
  *(void *)this = 0;
  NamedValue::Set((const void **)this, a2, a3, a4);
}

{
  *(void *)this = 0;
  NamedValue::Set((const void **)this, a2, a3, a4);
}

CFDictionaryRef NamedValue::Set(const void **this, const char *cStr, const char *a3, __CFArray *a4)
{
  CFIndex v8 = *this;
  if (v8) {
    CFRelease(v8);
  }
  CFDictionaryRef result = CreateNamedValue(cStr, a3, a4);
  *this = result;
  return result;
}

void NamedValue::~NamedValue(const void **this)
{
  v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

{
  const void *v1;

  v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void NamedValue::Name(Name *this)
{
  CFDictionaryRef v1 = *(const __CFDictionary **)this;
  value = 0;
  if (v1) {
    CFDictionaryGetValueIfPresent(v1, @"Name", (const void **)&value);
  }
}

const __CFDictionary *NamedValue::Value(const __CFDictionary **this)
{
  CFDictionaryRef result = *this;
  value = 0;
  if (result)
  {
    CFDictionaryGetValueIfPresent(result, @"Value", (const void **)&value);
    return (const __CFDictionary *)value;
  }
  return result;
}

const __CFDictionary *NamedValue::List(const __CFDictionary **this)
{
  CFDictionaryRef result = *this;
  value = 0;
  if (result)
  {
    CFDictionaryGetValueIfPresent(result, @"List", (const void **)&value);
    return (const __CFDictionary *)value;
  }
  return result;
}

void NamedValues::NamedValues(NamedValues *this)
{
  *(void *)this = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
}

{
  *(void *)this = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
}

void NamedValues::~NamedValues(const void **this)
{
  CFDictionaryRef v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

{
  const void *v1;

  CFDictionaryRef v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void NamedValues::push_back(__CFArray **this, const void **a2)
{
  CFAllocatorRef v2 = *this;
  if (v2) {
    CFArrayAppendValue(v2, *a2);
  }
}

const __CFArray *NamedValues::size(const __CFArray **this)
{
  CFArrayRef result = *this;
  if (result) {
    return (const __CFArray *)CFArrayGetCount(result);
  }
  return result;
}

void NamedValues::clear(__CFArray **this)
{
  CFDictionaryRef v1 = *this;
  if (v1) {
    CFArrayRemoveAllValues(v1);
  }
}

H10ISP::H10ISPThreadReadySyncer *H10ISP::H10ISPThreadReadySyncer::H10ISPThreadReadySyncer(H10ISP::H10ISPThreadReadySyncer *this)
{
  return this;
}

void H10ISP::H10ISPThreadReadySyncer::~H10ISPThreadReadySyncer(H10ISP::H10ISPThreadReadySyncer *this)
{
}

{
  pthread_cond_destroy((pthread_cond_t *)((char *)this + 64));
  pthread_mutex_destroy((pthread_mutex_t *)this);
}

uint64_t H10ISP::H10ISPThreadReadySyncer::wait(pthread_mutex_t *this)
{
  return pthread_cond_wait((pthread_cond_t *)&this[1], this);
}

uint64_t H10ISP::H10ISPThreadReadySyncer::signalAndUnlock(H10ISP::H10ISPThreadReadySyncer *this)
{
  pthread_cond_signal((pthread_cond_t *)((char *)this + 64));
  return pthread_mutex_unlock((pthread_mutex_t *)this);
}

CFTypeRef H10ISP::CreateFormatedMetadata(uint64_t a1)
{
  uint64_t v127 = *MEMORY[0x263EF8340];
  if (*(_WORD *)a1 != 3393) {
    return 0;
  }
  NamedValues::NamedValues((NamedValues *)&cf);
  NamedValues::NamedValues((NamedValues *)&v116);
  *(void *)v126 = 20;
  uint64_t v3 = *(unsigned int *)(a1 + 16);
  if ((int)v3 >= 1)
  {
    uint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = *(unsigned int *)(a1 + 4 * v4 + 20);
      if (v5) {
        break;
      }
LABEL_139:
      if (++v4 == v3) {
        goto LABEL_140;
      }
    }
    NamedValues::NamedValues((NamedValues *)&v115);
    CFDictionaryRef v7 = (unsigned __int16 *)(a1 + v5);
    CFIndex v8 = "Shared AiCam";
    switch((int)v4)
    {
      case 0:
        *(double *)v126 = COERCE_DOUBLE("unknown");
        switch(*((_DWORD *)v7 + 4))
        {
          case 0:
            __int16 v9 = "green-red";
            goto LABEL_98;
          case 1:
            __int16 v9 = "red";
            goto LABEL_98;
          case 2:
            __int16 v9 = "blue";
            goto LABEL_98;
          case 3:
            __int16 v9 = "green-blue";
LABEL_98:
            *(double *)v126 = *(double *)&v9;
            break;
          default:
            break;
        }
        *(void *)__str = "unknown";
        int v99 = v7[14];
        if (v99 == 2)
        {
          v100 = "binning 1/4";
        }
        else if (v99 == 1)
        {
          v100 = "binning 1/2";
        }
        else
        {
          if (v7[14]) {
            goto LABEL_106;
          }
          v100 = "binning disabled";
        }
        *(void *)__str = v100;
LABEL_106:
        *(void *)v123 = "unknown";
        int v101 = v7[15];
        if (v101 == 2)
        {
          v102 = "binning 1/4";
        }
        else if (v101 == 1)
        {
          v102 = "binning 1/2";
        }
        else
        {
          if (v7[15]) {
            goto LABEL_113;
          }
          v102 = "binning disabled";
        }
        *(void *)v123 = v102;
LABEL_113:
        *(void *)v122 = "unknown";
        switch(v7[34])
        {
          case 0u:
            v103 = "raw8";
            goto LABEL_118;
          case 1u:
            v103 = "raw10";
            goto LABEL_118;
          case 2u:
            v103 = "raw12";
            goto LABEL_118;
          case 3u:
            v103 = "raw14";
LABEL_118:
            *(void *)v122 = v103;
            break;
          default:
            break;
        }
        *(void *)v121 = "unknown";
        if (v7[35] == 1)
        {
          v104 = "unpacked";
        }
        else
        {
          if (v7[35])
          {
LABEL_124:
            *(void *)&double v120 = 760;
            LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((unsigned __int8 *)v7 + 43);
            LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((unsigned __int8 *)v7 + 44);
            LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((unsigned __int8 *)v7 + 45);
            LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((unsigned __int8 *)v7 + 46);
            LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((unsigned __int8 *)v7 + 47);
            LODWORD(v105) = *((_DWORD *)v7 + 12);
            double v120 = (double)v105 * 0.00390625;
            LOWORD(v106) = v7[32];
            double v120 = (double)v106 * 0.00390625;
            LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((unsigned __int8 *)v7 + 72);
            LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((unsigned __int8 *)v7 + 73);
            double v120 = COERCE_DOUBLE(bswap64(*(void *)(v7 + 37)));
            *(void *)&double v120 = v7 + 48;
            *(void *)&double v120 = v7 + 64;
            *(void *)&double v120 = v7 + 80;
            *(void *)&double v120 = v7 + 96;
            unsigned int v107 = *((_DWORD *)v7 + 80);
            unsigned int v108 = *((_DWORD *)v7 + 81);
            unsigned int v119 = bswap32(v108);
            LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = bswap32(v107);
            int v118 = v107;
            int v118 = BYTE1(v107);
            int v118 = BYTE2(v107);
            int v118 = HIBYTE(v107) & 0xF;
            int v118 = v107 >> 28;
            int v118 = HIBYTE(v108);
            int v118 = BYTE2(v108);
            int v118 = BYTE1(v108);
            int v118 = v108;
            int v118 = (__int16)v7[168];
            int v118 = *((unsigned __int8 *)v7 + 338);
            int v118 = *((unsigned __int8 *)v7 + 339);
            int v118 = *((unsigned __int8 *)v7 + 460);
            int v118 = *((unsigned __int8 *)v7 + 461);
            int v118 = v7[229];
            int v118 = v7[246];
            int v118 = v7[247];
            int v118 = v7[248];
            int v118 = v7[249];
            int v118 = *((unsigned __int8 *)v7 + 500);
            int v118 = *((unsigned __int8 *)v7 + 501);
            int v118 = v7[254];
            int v118 = v7[255];
            int v118 = v7[256];
            int v118 = v7[257];
            int v118 = *((_DWORD *)v7 + 129);
            int v118 = *((_DWORD *)v7 + 130);
            int v118 = *((_DWORD *)v7 + 131);
            int v118 = *((_DWORD *)v7 + 132);
            int v118 = *((_DWORD *)v7 + 133);
            int v118 = *((_DWORD *)v7 + 134);
            int v118 = *((_DWORD *)v7 + 135);
            int v118 = v7[272];
            int v118 = v7[273];
            int v118 = v7[282];
            int v118 = v7[283];
            int v118 = v7[284];
            int v118 = v7[285];
            int v118 = v7[286];
            int v118 = v7[287];
            int v118 = v7[288];
            int v118 = v7[289];
            int v118 = *((_DWORD *)v7 + 145);
            int v118 = *((_DWORD *)v7 + 146);
            int v118 = v7[294];
            int v118 = *((_DWORD *)v7 + 148);
            int v118 = *((_DWORD *)v7 + 149);
            int v118 = *((_DWORD *)v7 + 150);
            int v118 = *((unsigned __int8 *)v7 + 604);
            int v118 = *((unsigned __int8 *)v7 + 605);
            int v118 = *((_DWORD *)v7 + 152);
            int v118 = *((_DWORD *)v7 + 153);
            int v118 = *((_DWORD *)v7 + 154);
            int v118 = v7[312];
            int v118 = v7[313];
            int v118 = v7[314];
            int v118 = v7[315];
            int v118 = *((_DWORD *)v7 + 155);
            int v118 = *((unsigned __int8 *)v7 + 632);
            int v118 = v7[317];
            int v118 = *((_DWORD *)v7 + 159);
            int v118 = *((_DWORD *)v7 + 162);
            int v118 = v7[326];
            int v118 = v7[327];
            int v118 = v7[328];
            int v118 = v7[329];
            int v118 = *((unsigned __int8 *)v7 + 660);
            int v118 = *((unsigned __int8 *)v7 + 661);
            int v118 = *((_DWORD *)v7 + 167);
            int v118 = *((_DWORD *)v7 + 168);
            int v118 = v7[338];
            int v118 = v7[339];
            int v118 = v7[340];
            int v118 = v7[341];
            int v118 = *((_DWORD *)v7 + 173);
            int v118 = v7[348];
            int v118 = v7[349];
            int v118 = v7[350];
            int v118 = v7[351];
            int v118 = v7[352];
            int v118 = v7[353];
            int v118 = v7[354];
            int v118 = v7[355];
            int v118 = v7[356];
            int v118 = v7[357];
            int v118 = v7[358];
            int v118 = v7[359];
            int v118 = v7[360];
            int v118 = v7[361];
            int v118 = v7[362];
            int v118 = v7[363];
            int v118 = v7[364];
            int v118 = v7[365];
            int v118 = v7[366];
            int v118 = v7[367];
            int v118 = v7[368];
            int v118 = v7[369];
            int v118 = v7[370];
            int v118 = v7[371];
            int v118 = v7[372];
            int v118 = v7[373];
            int v118 = *((unsigned __int8 *)v7 + 748);
            int v118 = *((unsigned __int8 *)v7 + 749);
            int v118 = *((char *)v7 + 750);
            int v118 = v7[377];
            CFIndex v8 = "Shared Input";
            goto LABEL_137;
          }
          v104 = "packed";
        }
        *(void *)v121 = v104;
        goto LABEL_124;
      case 1:
        CFNumberRef v10 = "unknown";
        *(double *)v126 = COERCE_DOUBLE("unknown");
        int v11 = *v7;
        if (v11 == 2)
        {
          uint64_t v12 = "R'G'B'";
        }
        else if (v11 == 1)
        {
          uint64_t v12 = "Y'CbCr 4:2:2";
        }
        else
        {
          if (*v7) {
            goto LABEL_93;
          }
          uint64_t v12 = "Y'CbCr 4:2:0";
        }
        *(double *)v126 = *(double *)&v12;
LABEL_93:
        *(void *)__str = "unknown";
        switch(v7[1])
        {
          case 0u:
            v98 = "BackEnd";
            goto LABEL_129;
          case 1u:
            v98 = "StatsBlock";
            goto LABEL_129;
          case 2u:
            v98 = "RawProcBlock";
            goto LABEL_129;
          case 3u:
            v98 = "RGBProcBlock";
            goto LABEL_129;
          case 4u:
            v98 = "YCCProcBlock";
LABEL_129:
            *(void *)__str = v98;
            break;
          default:
            break;
        }
        v109 = "RGBY";
        if (!*((unsigned char *)v7 + 9)) {
          v109 = "RGGB";
        }
        *(void *)v123 = v109;
        int v110 = *((_DWORD *)v7 + 1028);
        if (v110 == 1)
        {
          CFNumberRef v10 = "log2";
        }
        else if (!v110)
        {
          CFNumberRef v10 = "linear";
        }
        *(void *)v122 = v10;
        *(void *)v121 = 4280;
        NamedValues::NamedValues((NamedValues *)v121);
        LODWORD(v112) = *((_DWORD *)v7 + 1027);
        double v120 = (double)v112 * 0.0625;
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((unsigned __int8 *)v7 + 4138);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((unsigned __int8 *)v7 + 4139);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 1035);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 1036);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 1037);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 1038);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 1039);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 1040);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 1041);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 1042);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 1043);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 1044);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 1045);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 1046);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((unsigned __int8 *)v7 + 4188);
        NamedValues::~NamedValues((const void **)v121);
        CFIndex v8 = "Shared Output";
LABEL_137:
LABEL_138:
        NamedValues::~NamedValues((const void **)&v115);
        goto LABEL_139;
      case 2:
        *(void *)v126 = 5264;
        LOWORD(v13) = v7[2];
        *(double *)v126 = (double)v13 * 0.00390625;
        LODWORD(v14) = *((_DWORD *)v7 + 1313);
        *(double *)v126 = (double)v14 * 0.00390625;
        LOWORD(v15) = v7[4];
        *(double *)v126 = (double)v15 * 0.00390625;
        *(_DWORD *)v126 = v7[5];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 13);
        LODWORD(v16) = *((_DWORD *)v7 + 5);
        *(double *)v126 = (double)v16 * 0.0000152587891;
        NamedValues::NamedValues((NamedValues *)v122);
        NamedValues::NamedValues((NamedValues *)v121);
        uint64_t v17 = 0;
        uint64_t v18 = a1 + 60 + v5;
        do
        {
          snprintf(__str, 0x40uLL, "row[%d]", v17);
          unint64_t v19 = 0;
          strcpy(v126, "{");
          int v20 = 1;
          do
          {
            int v21 = snprintf(&v126[v20], (1024 - v20), "%3d ", *(unsigned __int8 *)(v18 + v19));
            v20 += v21;
            if (v21 <= 0) {
              int v22 = 1024;
            }
            else {
              int v22 = v20;
            }
            if (v19 > 0xE) {
              break;
            }
            ++v19;
          }
          while (v22 < 1024);
          if (v22 <= 1023) {
            snprintf(&v126[v22], (1024 - v22), "}");
          }
          NamedValue::NamedValue((NamedValue *)v123, __str, v126, 0);
          NamedValues::push_back((__CFArray **)v121, (const void **)v123);
          NamedValue::~NamedValue((const void **)v123);
          ++v17;
          v18 += 16;
        }
        while (v17 != 32);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 1732);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 434);
        *(_DWORD *)v126 = v7[870];
        *(_DWORD *)v126 = v7[871];
        *(_DWORD *)v126 = v7[872];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 437);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 438);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 439);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 440);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 441);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 442);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 443);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 444);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 445);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 446);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 447);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 448);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 449);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 450);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 451);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 452);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 453);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 454);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 455);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 456);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 457);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 458);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 459);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 460);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 461);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 462);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 463);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 464);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 465);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 466);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 467);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 468);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 469);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 470);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 471);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 472);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 473);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 474);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 475);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 476);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 477);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 478);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 479);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 480);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 481);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 482);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 483);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 484);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 485);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 486);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 487);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 488);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 489);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 490);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 491);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 492);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 493);
        *(_DWORD *)v126 = v7[988];
        *(_DWORD *)v126 = v7[989];
        *(_DWORD *)v126 = v7[990];
        *(_DWORD *)v126 = v7[991];
        *(_DWORD *)v126 = v7[992];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 497);
        NamedValues::NamedValues((NamedValues *)v126);
        *(_DWORD *)v123 = *((unsigned __int8 *)v7 + 592);
        *(_DWORD *)v123 = *((unsigned __int8 *)v7 + 593);
        NamedValues::NamedValues((NamedValues *)v123);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 405);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 406);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 407);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 408);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 409);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 410);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 411);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 412);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 413);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 414);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 415);
        LODWORD(v12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 416);
        NamedValues::~NamedValues((const void **)v123);
        NamedValues::~NamedValues((const void **)v126);
        NamedValues::~NamedValues((const void **)v121);
        NamedValues::~NamedValues((const void **)v122);
        CFIndex v8 = "Shared Auto Exposure";
        goto LABEL_137;
      case 3:
        *(void *)v126 = 3652;
        NamedValues::NamedValues((NamedValues *)v122);
        *(_DWORD *)v126 = v7[80];
        *(_DWORD *)v126 = v7[81];
        *(_DWORD *)v126 = v7[82];
        *(_DWORD *)v126 = v7[83];
        *(_DWORD *)v126 = v7[1292];
        *(_DWORD *)v126 = v7[1293];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 2716);
        *(_DWORD *)v126 = v7[1360];
        *(_DWORD *)v126 = v7[1361];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 682);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 2732);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 2733);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 2734);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 684);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 685);
        *(_DWORD *)v126 = (__int16)v7[1372];
        *(_DWORD *)v126 = v7[1373];
        *(_DWORD *)v126 = v7[1390];
        *(_DWORD *)v126 = v7[1391];
        *(_DWORD *)v126 = v7[1392];
        *(_DWORD *)v126 = v7[1393];
        *(_DWORD *)v126 = v7[1394];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 775);
        std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v126);
        std::ostream::operator<<();
        std::stringbuf::str();
        if (v125 >= 0) {
          CFNumberRef v28 = __str;
        }
        else {
          CFNumberRef v28 = *(char **)__str;
        }
        NamedValue::NamedValue((NamedValue *)v123, "roiType", v28, 0);
        if (v125 < 0) {
          operator delete(*(void **)__str);
        }
        NamedValues::push_back(&v115, (const void **)v123);
        NamedValue::~NamedValue((const void **)v123);
        std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v126);
        *(_DWORD *)v126 = v7[1695];
        NamedValues::~NamedValues((const void **)v122);
        CFIndex v8 = "Shared Auto Focus";
        goto LABEL_137;
      case 4:
        *(void *)v126 = 876;
        LOWORD(v29) = v7[6];
        LOWORD(v3pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v7[7];
        LOWORD(v31) = v7[8];
        LOWORD(v33) = v7[9];
        LOWORD(v34) = v7[10];
        LOWORD(v35) = v7[11];
        LOWORD(v4pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v7[21];
        *(double *)v126 = (double)v40 * 0.0000610351562;
        LOWORD(v41) = v7[22];
        *(double *)v126 = (double)v41 * 0.0000610351562;
        LODWORD(v42) = *((_DWORD *)v7 + 13);
        *(double *)v126 = (double)v42 * 0.000244140625;
        *(_DWORD *)v126 = v7[73];
        *(_DWORD *)v126 = v7[86];
        *(_DWORD *)v126 = v7[87];
        *(_DWORD *)v126 = v7[88];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 178);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 179);
        *(_DWORD *)v126 = v7[90];
        *(_DWORD *)v126 = v7[91];
        *(_DWORD *)v126 = v7[92];
        *(_DWORD *)v126 = v7[93];
        *(_DWORD *)v126 = v7[94];
        *(_DWORD *)v126 = v7[95];
        *(_DWORD *)v126 = v7[96];
        *(_DWORD *)v126 = v7[97];
        *(_DWORD *)v126 = v7[98];
        *(_DWORD *)v126 = v7[99];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 68);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 86);
        *(_DWORD *)v126 = v7[206];
        LOWORD(v43) = v7[138];
        *(double *)v126 = (double)v43 * 0.0000610351562;
        LOWORD(v44) = v7[139];
        *(double *)v126 = (double)v44 * 0.0000610351562;
        *(_DWORD *)v126 = *((_DWORD *)v7 + 70);
        LODWORD(v45) = *((_DWORD *)v7 + 71);
        LODWORD(v46) = *((_DWORD *)v7 + 72);
        LODWORD(v47) = *((_DWORD *)v7 + 73);
        LODWORD(v49) = *((_DWORD *)v7 + 74);
        LODWORD(v5pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((_DWORD *)v7 + 75);
        LODWORD(v51) = *((_DWORD *)v7 + 76);
        CFIndex v8 = "Shared Auto White Balance";
        goto LABEL_137;
      case 5:
        *(void *)v126 = 24;
        CFIndex v8 = "Adaptive Tone Curve";
        goto LABEL_137;
      case 6:
        *(void *)v126 = 24;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        *(_DWORD *)v126 = v7[2];
        *(_DWORD *)v126 = v7[3];
        *(_DWORD *)v126 = v7[4];
        *(_DWORD *)v126 = v7[5];
        *(_DWORD *)v126 = v7[10];
        CFIndex v8 = "Shared LTM";
        goto LABEL_137;
      case 7:
        *(void *)v126 = 396;
        LODWORD(v56) = *((_DWORD *)v7 + 5);
        *(double *)v126 = (double)v56 * 0.00390625;
        LODWORD(v57) = *((_DWORD *)v7 + 10);
        *(double *)v126 = (double)v57 * 0.00390625;
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 60);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 61);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 62);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 63);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 64);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 65);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 66);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 67);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 68);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 69);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 70);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 71);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 72);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 73);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 74);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 75);
        *(_DWORD *)v126 = v7[38];
        *(_DWORD *)v126 = v7[39];
        *(_DWORD *)v126 = (__int16)v7[40];
        *(_DWORD *)v126 = v7[41];
        LOWORD(v58) = v7[44];
        LOWORD(v59) = v7[45];
        LOWORD(v6pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v7[46];
        LOWORD(v65) = v7[56];
        *(double *)v126 = (double)v65 * 0.0000610351562;
        LOWORD(v66) = v7[57];
        *(double *)v126 = (double)v66 * 0.0000610351562;
        LOWORD(v67) = v7[58];
        *(double *)v126 = (double)v67 * 0.000244140625;
        LOWORD(v68) = v7[59];
        *(double *)v126 = (double)v68 * 0.000244140625;
        LOWORD(v69) = v7[60];
        *(double *)v126 = (double)v69 * 0.000244140625;
        LOWORD(v7pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v7[61];
        *(double *)v126 = (double)v70 * 0.000244140625;
        LOWORD(v71) = v7[62];
        *(double *)v126 = (double)v71 * 0.000244140625;
        LOWORD(v72) = v7[63];
        *(double *)v126 = (double)v72 * 0.000244140625;
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 128);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 129);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 132);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 133);
        *(_DWORD *)v126 = v7[67];
        *(_DWORD *)v126 = v7[68];
        *(_DWORD *)v126 = v7[69];
        *(_DWORD *)v126 = v7[76];
        *(_DWORD *)v126 = v7[77];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 160);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 161);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 162);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 41);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 44);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 45);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 46);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 47);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 48);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 49);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 50);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 51);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 52);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 53);
        *(_DWORD *)v126 = v7[108];
        *(_DWORD *)v126 = v7[109];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 243);
        *(_DWORD *)v126 = (__int16)v7[149];
        *(_DWORD *)v126 = (__int16)v7[154];
        *(_DWORD *)v126 = (__int16)v7[155];
        uint64_t v73 = 0;
        v74 = (unsigned __int8 *)(a1 + 250 + v5);
        do
        {
          NamedValues::NamedValues((NamedValues *)__str);
          v75 = &v7[8 * v73];
          *(_DWORD *)v123 = *((_DWORD *)v75 + 61);
          *(_DWORD *)v123 = *((unsigned __int8 *)v75 + 248);
          uint64_t v76 = 0;
          v77 = v74;
          do
          {
            NamedValues::NamedValues((NamedValues *)v123);
            *(_DWORD *)v122 = *(v77 - 1);
            *(_DWORD *)v122 = *v77;
            snprintf(v126, 0x40uLL, "strength[%d]", v76);
            NamedValues::~NamedValues((const void **)v123);
            ++v76;
            v77 += 2;
          }
          while (v76 != 5);
          snprintf(v126, 0x40uLL, "mbnrConfig[%d]", v73);
          NamedValues::~NamedValues((const void **)__str);
          ++v73;
          v74 += 16;
        }
        while (v73 != 3);
        CFIndex v8 = "Shared RAW Proc";
        goto LABEL_137;
      case 8:
        *(void *)v126 = 772;
        *(_DWORD *)v126 = v7[2];
        *(_DWORD *)v126 = v7[275];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 552);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 553);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 554);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 555);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 568);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 640);
        CFIndex v8 = "Shared RGB Proc";
        goto LABEL_137;
      case 9:
        *(void *)v126 = 188;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 2);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 3);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 4);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 5);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 6);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 7);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 8);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 9);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 10);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 11);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 12);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 13);
        *(_DWORD *)v126 = v7[7];
        *(_DWORD *)v126 = v7[8];
        *(_DWORD *)v126 = v7[9];
        *(_DWORD *)v126 = v7[10];
        *(_DWORD *)v126 = v7[11];
        *(_DWORD *)v126 = v7[12];
        *(_DWORD *)v126 = v7[79];
        *(_DWORD *)v126 = v7[80];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 162);
        *(_DWORD *)v126 = v7[82];
        *(_DWORD *)v126 = v7[83];
        *(_DWORD *)v126 = v7[84];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 43);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 44);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 45);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 184);
        CFIndex v8 = "Shared YCC Proc";
        goto LABEL_137;
      case 10:
        *(void *)v126 = 4;
        *(_DWORD *)v126 = *(unsigned __int8 *)v7;
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 1);
        CFIndex v8 = "Shared BES Proc";
        goto LABEL_137;
      case 11:
        *(void *)v126 = 19528;
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 164);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 165);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 166);
        *(_DWORD *)v126 = v7[84];
        *(_DWORD *)v126 = v7[85];
        *(_DWORD *)v126 = v7[86];
        *(_DWORD *)v126 = v7[87];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 166);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 166);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 166);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 166);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 166);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 166);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 166);
        *(_DWORD *)v126 = v7[90];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 182);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 183);
        *(_DWORD *)v126 = v7[94];
        *(_DWORD *)v126 = v7[95];
        *(_DWORD *)v126 = v7[96];
        *(_DWORD *)v126 = v7[97];
        *(_DWORD *)v126 = v7[98];
        *(_DWORD *)v126 = v7[99];
        *(_DWORD *)v126 = v7[100];
        *(_DWORD *)v126 = v7[101];
        LOWORD(v84) = v7[106];
        LOWORD(v85) = v7[107];
        LOWORD(v86) = v7[108];
        LOWORD(v88) = v7[109];
        LOWORD(v89) = v7[110];
        LOWORD(v9pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v7[111];
        *(_DWORD *)v126 = v7[112];
        *(_DWORD *)v126 = v7[113];
        *(_DWORD *)v126 = v7[118];
        *(_DWORD *)v126 = v7[119];
        *(_DWORD *)v126 = v7[120];
        *(_DWORD *)v126 = v7[121];
        *(_DWORD *)v126 = v7[124];
        *(_DWORD *)v126 = v7[125];
        *(_DWORD *)v126 = v7[132];
        *(_DWORD *)v126 = v7[133];
        *(_DWORD *)v126 = v7[134];
        *(_DWORD *)v126 = v7[135];
        *(_DWORD *)v126 = v7[136];
        *(_DWORD *)v126 = v7[137];
        *(_DWORD *)v126 = v7[260];
        *(_DWORD *)v126 = v7[261];
        *(_DWORD *)v126 = v7[262];
        *(_DWORD *)v126 = v7[263];
        *(_DWORD *)v126 = v7[264];
        *(_DWORD *)v126 = v7[265];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 4031);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 4032);
        CFIndex v8 = "Shared Stats";
        goto LABEL_137;
      case 12:
        *(void *)v126 = 2048;
        CFIndex v8 = "Shared Debug";
        goto LABEL_137;
      case 13:
        *(void *)v126 = 54888;
        CFIndex v8 = "Shared OIS";
        goto LABEL_137;
      case 14:
        *(void *)v126 = 32840;
        CFIndex v8 = "Shared FocusPixel";
        goto LABEL_137;
      case 15:
        *(void *)v126 = 6156;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        *(_DWORD *)v126 = v7[2];
        *(_DWORD *)v126 = v7[3];
        *(_DWORD *)v126 = v7[4];
        *(_DWORD *)v126 = v7[5];
        CFIndex v8 = "Shared LocalHist";
        goto LABEL_137;
      case 16:
        *(void *)v126 = 65540;
        CFIndex v8 = "Shared VIS";
        goto LABEL_137;
      case 17:
        *(void *)v126 = 16388;
        CFIndex v8 = "Shared TNR";
        goto LABEL_137;
      case 18:
        *(void *)v126 = 64;
        *(_DWORD *)v126 = (__int16)v7[8];
        *(_DWORD *)v126 = (__int16)v7[9];
        *(_DWORD *)v126 = (__int16)v7[10];
        *(_DWORD *)v126 = (__int16)v7[11];
        *(_DWORD *)v126 = (__int16)v7[12];
        *(_DWORD *)v126 = (__int16)v7[13];
        *(_DWORD *)v126 = (__int16)v7[14];
        *(_DWORD *)v126 = (__int16)v7[15];
        *(_DWORD *)v126 = v7[16];
        *(_DWORD *)v126 = v7[17];
        *(_DWORD *)v126 = v7[28];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 58);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 59);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 60);
        CFIndex v8 = "Shared System";
        goto LABEL_137;
      case 19:
        *(void *)v126 = 35900;
        *(_DWORD *)v126 = v7[17667];
        *(_DWORD *)v126 = v7[17668];
        *(_DWORD *)v126 = v7[17669];
        *(_DWORD *)v126 = v7[17670];
        *(_DWORD *)v126 = v7[17671];
        *(_DWORD *)v126 = v7[17672];
        *(_DWORD *)v126 = v7[17673];
        *(_DWORD *)v126 = v7[17674];
        *(_DWORD *)v126 = v7[17933];
        *(_DWORD *)v126 = v7[17934];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 8968);
        *(_DWORD *)v126 = v7[17938];
        *(_DWORD *)v126 = v7[17939];
        *(_DWORD *)v126 = v7[17940];
        CFIndex v8 = "Shared LTM LUTs";
        goto LABEL_137;
      case 20:
        *(void *)v126 = 1736;
        CFIndex v8 = "Shared VIS Info";
        goto LABEL_137;
      case 21:
        *(void *)v126 = 11008;
        CFIndex v8 = "Shared Motion Info";
        goto LABEL_137;
      case 22:
        *(void *)v126 = 4144;
        CFIndex v8 = "Shared AF FocusMap";
        goto LABEL_137;
      case 23:
        *(void *)v126 = 644;
        *(_DWORD *)v126 = *(_DWORD *)v7;
        CFIndex v8 = "Shared DMA Config";
        goto LABEL_137;
      case 24:
        *(void *)v126 = 9236;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        *(_DWORD *)v126 = v7[2];
        *(_DWORD *)v126 = v7[3];
        *(_DWORD *)v126 = v7[4];
        *(_DWORD *)v126 = v7[5];
        *(_DWORD *)v126 = v7[6];
        *(_DWORD *)v126 = v7[7];
        *(_DWORD *)v126 = v7[8];
        *(_DWORD *)v126 = v7[9];
        CFIndex v8 = "Shared HITH";
        goto LABEL_137;
      case 25:
        *(void *)v126 = 61208;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 15301);
        CFIndex v8 = "Shared APS";
        goto LABEL_137;
      case 26:
        *(void *)v126 = 786600;
        CFIndex v8 = "Shared SideBand";
        goto LABEL_137;
      case 27:
        *(void *)v126 = 33012;
        *(_DWORD *)v126 = *(_DWORD *)v7;
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 4);
        CFIndex v8 = "Shared VisionProc";
        goto LABEL_137;
      case 28:
        *(void *)v126 = 116;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        *(_DWORD *)v126 = v7[2];
        *(_DWORD *)v126 = v7[3];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 2);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 3);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 4);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 5);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 14);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 15);
        *(_DWORD *)v126 = v7[14];
        *(_DWORD *)v126 = v7[15];
        *(double *)v126 = (double)*((int *)v7 + 8) * 0.03125;
        *(double *)v126 = (double)*((int *)v7 + 9) * 0.03125;
        *(double *)v126 = (double)*((int *)v7 + 10) * 0.03125;
        *(double *)v126 = (double)*((int *)v7 + 11) * 0.03125;
        *(double *)v126 = (double)*((int *)v7 + 12) * 0.03125;
        *(double *)v126 = (double)*((int *)v7 + 13) * 0.03125;
        *(double *)v126 = (double)*((int *)v7 + 16) * 0.03125;
        *(_DWORD *)v126 = *((_DWORD *)v7 + 18);
        *(_DWORD *)v126 = v7[34];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 19);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 20);
        CFIndex v8 = "Shared Projector";
        goto LABEL_137;
      case 29:
        *(void *)v126 = 456;
        *(_DWORD *)v126 = *(_DWORD *)v7;
        *(_DWORD *)v126 = *((_DWORD *)v7 + 1);
        CFIndex v8 = "Shared BodyDetector";
        goto LABEL_137;
      case 30:
        *(void *)v126 = 96;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        *(_DWORD *)v126 = v7[6];
        *(_DWORD *)v126 = v7[7];
        *(_DWORD *)v126 = v7[8];
        *(_DWORD *)v126 = v7[9];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 5);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 8);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 9);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 10);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 11);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 12);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 13);
        *(_DWORD *)v126 = v7[30];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 16);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 17);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 18);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 19);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 20);
        CFIndex v8 = "Shared Distortion";
        goto LABEL_137;
      case 31:
        *(void *)v126 = 1024;
        CFIndex v8 = "BodyDetector Debug";
        goto LABEL_137;
      case 32:
        *(void *)v126 = 1453212;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        CFIndex v8 = "PDE Debug";
        goto LABEL_137;
      case 33:
        *(void *)v126 = 44;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        *(double *)v126 = (double)*((int *)v7 + 3) * 0.03125;
        *(double *)v126 = (double)*((int *)v7 + 4) * 0.03125;
        *(double *)v126 = (double)*((int *)v7 + 5) * 0.03125;
        *(double *)v126 = (double)*((int *)v7 + 6) * 0.03125;
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 8);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 9);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 10);
        CFIndex v8 = "Shared Powersupply";
        goto LABEL_137;
      case 34:
        *(void *)v126 = 1252;
        *(_DWORD *)v126 = *((_DWORD *)v7 + 312);
        *(_DWORD *)v126 = 0;
        if (*((_DWORD *)v7 + 312))
        {
          unint64_t v92 = 0;
          v93 = v7;
          do
          {
            *(_DWORD *)__str = *v93;
            *(_DWORD *)__str = v93[1];
            *(_DWORD *)__str = *((_DWORD *)v93 + 1);
            *(_DWORD *)__str = *((_DWORD *)v93 + 2);
            *(_DWORD *)__str = *((_DWORD *)v93 + 3);
            *(_DWORD *)__str = *((_DWORD *)v93 + 4);
            *(_DWORD *)__str = *((_DWORD *)v93 + 5);
            *(_DWORD *)__str = *((_DWORD *)v93 + 6);
            *(_DWORD *)__str = *((_DWORD *)v93 + 7);
            *(_DWORD *)__str = v93[16];
            *(_DWORD *)__str = v93[17];
            *(_DWORD *)__str = *((_DWORD *)v93 + 9);
            *(_DWORD *)__str = v93[20];
            *(_DWORD *)__str = v93[21];
            *(_DWORD *)__str = v93[22];
            *(_DWORD *)__str = *((_DWORD *)v93 + 101);
            *(_DWORD *)__str = *((unsigned __int8 *)v93 + 51);
            *(_DWORD *)__str = v93[24];
            *(_DWORD *)__str = *((_DWORD *)v93 + 13);
            *(_DWORD *)__str = (__int16)v93[28];
            *(_DWORD *)__str = v93[29];
            *(_DWORD *)__str = *((_DWORD *)v93 + 15);
            *(_DWORD *)__str = *((_DWORD *)v93 + 16);
            *(_DWORD *)__str = *((_DWORD *)v93 + 17);
            *(_DWORD *)__str = *((_DWORD *)v93 + 18);
            *(_DWORD *)__str = *((_DWORD *)v93 + 19);
            *(_DWORD *)__str = v93[40];
            *(_DWORD *)__str = v93[201];
            *(_DWORD *)v126 = ++v92;
            v93 += 208;
          }
          while (v92 < *((unsigned int *)v7 + 312));
        }
        CFIndex v8 = "Shared Multi Slave";
        goto LABEL_137;
      case 35:
        *(void *)v126 = 10032;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = HIWORD(*(_DWORD *)v7) & 1;
        *(_DWORD *)v126 = v7[2];
        CFIndex v8 = "Shared FD DCN";
        goto LABEL_137;
      case 36:
        *(void *)v126 = 4212;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = HIWORD(*(_DWORD *)v7) & 1;
        *(_DWORD *)v126 = (*(_DWORD *)v7 >> 18) & 1;
        *(_DWORD *)v126 = (*(_DWORD *)v7 >> 19) & 1;
        *(_DWORD *)v126 = (*(_DWORD *)v7 >> 20) & 1;
        *(_DWORD *)v126 = (*(_DWORD *)v7 >> 21) & 1;
        *(_DWORD *)v126 = *((_DWORD *)v7 + 1);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 2);
        CFIndex v8 = "Shared FID DCN";
        goto LABEL_137;
      case 37:
        *(void *)v126 = 1036;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        *(_DWORD *)v126 = v7[2];
        *(_DWORD *)v126 = v7[3];
        *(_DWORD *)v126 = v7[4];
        *(_DWORD *)v126 = v7[5];
        CFIndex v8 = "Shared YCC Histogram";
        goto LABEL_137;
      case 38:
        *(void *)v126 = 148024;
        *(_DWORD *)v126 = *v7;
        CFIndex v8 = "Shared FD DCN Debug";
        goto LABEL_137;
      case 39:
        *(void *)v126 = 695440;
        *(_DWORD *)v126 = *v7;
        CFIndex v8 = "Shared FID DCN Debug";
        goto LABEL_137;
      case 40:
        *(void *)v126 = 1788;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = HIWORD(*(_DWORD *)v7) & 1;
        *(_DWORD *)v126 = (*(_DWORD *)v7 >> 17) & 1;
        *(_DWORD *)v126 = *((_DWORD *)v7 + 1);
        CFIndex v8 = "Shared Attention";
        goto LABEL_137;
      case 41:
        *(void *)v126 = 246036;
        *(_DWORD *)v126 = *v7;
        CFIndex v8 = "Shared Attention Debug";
        goto LABEL_137;
      case 42:
        *(void *)v126 = 2945604;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        CFIndex v8 = "Shared IR PDP Debug";
        goto LABEL_137;
      case 43:
        *(void *)v126 = 3848;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 1);
        CFIndex v8 = "Shared MasterSlave AF";
        goto LABEL_137;
      case 44:
        *(void *)v126 = 452;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        *(_DWORD *)v126 = v7[2];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 2);
        *(_DWORD *)v126 = v7[6];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6);
        *(_DWORD *)v126 = v7[14];
        *(_DWORD *)v126 = v7[15];
        *(_DWORD *)v126 = (__int16)v7[36];
        if (*((_DWORD *)v7 + 91))
        {
          *(_DWORD *)v126 = v7[186];
          *(_DWORD *)v126 = v7[187];
          *(_DWORD *)v126 = (__int16)v7[208];
        }
        *(_DWORD *)v126 = v7[38];
        *(_DWORD *)v126 = v7[39];
        *(_DWORD *)v126 = v7[40];
        *(_DWORD *)v126 = (__int16)v7[41];
        *(_DWORD *)v126 = v7[7];
        *(_DWORD *)v126 = v7[8];
        *(_DWORD *)v126 = v7[42];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 22);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 23);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 24);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 25);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 26);
        *(_DWORD *)v126 = v7[37];
        CFIndex v8 = "Shared PDE";
        goto LABEL_137;
      case 45:
        *(void *)v126 = 132608;
        *(_DWORD *)v126 = *(_DWORD *)v7;
        *(_DWORD *)v126 = *((_DWORD *)v7 + 9);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 40);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 49);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 52);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 212);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 105);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 824);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 207);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 208);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 209);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 210);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 213);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 215);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 221);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 222);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 223);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 224);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 225);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 226);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 227);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 912);
        *(_DWORD *)v126 = v7[457];
        *(_DWORD *)v126 = v7[458];
        *(_DWORD *)v126 = v7[459];
        *(_DWORD *)v126 = v7[460];
        *(_DWORD *)v126 = v7[461];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 940);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 956);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 957);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 958);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 959);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 240);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 964);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 242);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 243);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 992);
        *(_DWORD *)v126 = (__int16)v7[497];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 249);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 250);
        *(_DWORD *)v126 = v7[1182];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6052);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25556);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25557);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25558);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25559);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25560);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25561);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25562);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25563);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25564);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25565);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25566);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25567);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25568);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25569);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25570);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25571);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25572);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25573);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25574);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25575);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25656);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25664);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25665);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25666);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25667);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25668);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25669);
        *(_DWORD *)v126 = (int)*((float *)v7 + 6422);
        *(_DWORD *)v126 = (int)*((float *)v7 + 6711);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6985);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6986);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6987);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6988);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6994);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6995);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6997);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7000);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7005);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7014);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7015);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7020);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7021);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7025);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7026);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7027);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7028);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7534);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7535);
        CFIndex v8 = "Shared CBAF Debug";
        goto LABEL_137;
      case 46:
        *(void *)v126 = 10033888;
        CFIndex v8 = "Shared PDAFHW Debug";
        goto LABEL_137;
      case 47:
        *(void *)v126 = 256;
        CFIndex v8 = "Shared CRC Check";
        goto LABEL_137;
      case 48:
        *(void *)v126 = 24;
        CFIndex v8 = "Shared Calibration";
        goto LABEL_137;
      case 49:
        *(void *)v126 = 32;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = (int)*((float *)v7 + 1);
        *(_DWORD *)v126 = (int)*((float *)v7 + 2);
        *(_DWORD *)v126 = (int)*((float *)v7 + 3);
        *(_DWORD *)v126 = (int)*((float *)v7 + 4);
        *(_DWORD *)v126 = (int)*((float *)v7 + 5);
        *(_DWORD *)v126 = (int)*((float *)v7 + 6);
        CFIndex v8 = "Shared Motion Stats";
        goto LABEL_137;
      case 50:
        *(void *)v126 = 44;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = (int)*((float *)v7 + 1);
        *(_DWORD *)v126 = (int)*((float *)v7 + 2);
        *(_DWORD *)v126 = (int)*((float *)v7 + 3);
        CFIndex v8 = "Shared APS Stats";
        goto LABEL_137;
      case 51:
        *(void *)v126 = 100;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = (int)*((float *)v7 + 1);
        *(_DWORD *)v126 = (int)*((float *)v7 + 4);
        *(_DWORD *)v126 = (int)*((float *)v7 + 5);
        CFIndex v8 = "Shared OIS Stats";
        goto LABEL_137;
      case 52:
        goto LABEL_137;
      case 53:
        CFIndex v8 = "Shared AiCam Debug";
        goto LABEL_137;
      case 54:
        *(void *)v126 = 40;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        LOWORD(v94) = v7[8];
        *(double *)v126 = (double)v94 * 0.00390625;
        LODWORD(v95) = *((_DWORD *)v7 + 9);
        *(double *)v126 = (double)v95 * 0.00390625;
        LOWORD(v96) = v7[10];
        *(double *)v126 = (double)v96 * 0.00390625;
        LOWORD(v97) = v7[11];
        *(double *)v126 = (double)v97 * 0.00390625;
        CFIndex v8 = "Shared SIFR";
        goto LABEL_137;
      case 55:
        *(_DWORD *)v126 = *(_DWORD *)v7;
        *(_DWORD *)v126 = *((_DWORD *)v7 + 1);
        CFIndex v8 = "Shared FPC";
        goto LABEL_137;
      case 56:
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        CFIndex v8 = "Shared Reduced APS";
        goto LABEL_137;
      default:
        goto LABEL_138;
    }
  }
LABEL_140:
  CFTypeRef v113 = cf;
  CFRetain(cf);
  NamedValues::~NamedValues((const void **)&v116);
  NamedValues::~NamedValues(&cf);
  return v113;
}

void sub_236A164C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, const void *a15, const void *a16, const void *a17, uint64_t a18, uint64_t a19, char a20,int a21,const void *a22,__int16 a23,char a24,char a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void anonymous namespace'::AppendMetadataList(__CFArray **this, NamedValues *a2, __CFArray **a3, NamedValues *a4)
{
  NamedValue::NamedValue((NamedValue *)&v5, (const char *)a2, 0, *a3);
  NamedValues::push_back(this, &v5);
  NamedValue::~NamedValue(&v5);
}

void sub_236A1697C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  NamedValue::~NamedValue((const void **)va);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

uint64_t anonymous namespace'::AppendMetadataItem<unsigned long>(__CFArray **a1)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v7);
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v5 >= 0) {
    p_p = (const char *)&__p;
  }
  else {
    p_p = (const char *)__p;
  }
  NamedValue::NamedValue((NamedValue *)&v6, "size", p_p, 0);
  if (v5 < 0) {
    operator delete(__p);
  }
  NamedValues::push_back(a1, &v6);
  NamedValue::~NamedValue(&v6);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v7);
}

void sub_236A16A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
}

uint64_t anonymous namespace'::AppendMetadataItem<unsigned short>(__CFArray **a1, const char *a2, _WORD *a3, int a4)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v16);
  if (a4 == 1)
  {
    CFNumberRef v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"0x", 2);
    *(_DWORD *)((char *)v10 + *(void *)(*v10 - 24) + 8) = *(_DWORD *)((unsigned char *)v10 + *(void *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
    goto LABEL_11;
  }
  if (a4 != 2)
  {
LABEL_11:
    std::ostream::operator<<();
    goto LABEL_12;
  }
  if (*a3) {
    CFIndex v8 = "yes";
  }
  else {
    CFIndex v8 = "no";
  }
  if (*a3) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 2;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)v8, v9);
LABEL_12:
  std::stringbuf::str();
  if (v14 >= 0) {
    p_p = (const char *)&__p;
  }
  else {
    p_p = (const char *)__p;
  }
  NamedValue::NamedValue((NamedValue *)&v15, a2, p_p, 0);
  if (v14 < 0) {
    operator delete(__p);
  }
  NamedValues::push_back(a1, &v15);
  NamedValue::~NamedValue(&v15);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v16);
}

void sub_236A16BD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
}

uint64_t anonymous namespace'::AppendMetadataItem<unsigned long long>(__CFArray **a1, const char *a2, uint64_t a3, int a4)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v13);
  if (a4 == 1)
  {
    CFDictionaryRef v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)"0x", 2);
    *(_DWORD *)((char *)v7 + *(void *)(*v7 - 24) + 8) = *(_DWORD *)((unsigned char *)v7 + *(void *)(*v7 - 24) + 8) & 0xFFFFFFB5 | 8;
  }
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v11 >= 0) {
    p_p = (const char *)&__p;
  }
  else {
    p_p = (const char *)__p;
  }
  NamedValue::NamedValue((NamedValue *)&v12, a2, p_p, 0);
  if (v11 < 0) {
    operator delete(__p);
  }
  NamedValues::push_back(a1, &v12);
  NamedValue::~NamedValue(&v12);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v13);
}

void sub_236A16D20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
}

uint64_t anonymous namespace'::AppendMetadataItem<unsigned int>(__CFArray **a1, const char *a2, _DWORD *a3, int a4)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v16);
  if (a4 == 1)
  {
    CFNumberRef v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"0x", 2);
    *(_DWORD *)((char *)v10 + *(void *)(*v10 - 24) + 8) = *(_DWORD *)((unsigned char *)v10 + *(void *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
    goto LABEL_11;
  }
  if (a4 != 2)
  {
LABEL_11:
    std::ostream::operator<<();
    goto LABEL_12;
  }
  if (*a3) {
    CFIndex v8 = "yes";
  }
  else {
    CFIndex v8 = "no";
  }
  if (*a3) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 2;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)v8, v9);
LABEL_12:
  std::stringbuf::str();
  if (v14 >= 0) {
    p_p = (const char *)&__p;
  }
  else {
    p_p = (const char *)__p;
  }
  NamedValue::NamedValue((NamedValue *)&v15, a2, p_p, 0);
  if (v14 < 0) {
    operator delete(__p);
  }
  NamedValues::push_back(a1, &v15);
  NamedValue::~NamedValue(&v15);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v16);
}

void sub_236A16EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 128) = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  char v5 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  CFIndex v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  uint64_t v9 = MEMORY[0x263F8C328] + 24;
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  uint64_t v10 = v5[5];
  uint64_t v11 = v5[4];
  *(void *)(a1 + 16) = v11;
  *(void *)(v3 + *(void *)(v11 - 24)) = v10;
  uint64_t v12 = v5[1];
  *(void *)a1 = v12;
  *(void *)(a1 + *(void *)(v12 - 24)) = v5[6];
  *(void *)a1 = v9;
  *(void *)(a1 + 128) = v2;
  *(void *)(a1 + 16) = v4;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 24;
  return a1;
}

void sub_236A1719C(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x237E091A0](v1);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B8];
  uint64_t v3 = *MEMORY[0x263F8C2B8];
  *(void *)a1 = *MEMORY[0x263F8C2B8];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x237E091A0](a1 + 128);
  return a1;
}

void sub_236A17300(_Unwind_Exception *a1)
{
  MEMORY[0x237E091A0](v1 + 128);
  _Unwind_Resume(a1);
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x237E09090](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      uint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x237E090A0](v13);
  return a1;
}

void sub_236A1746C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x237E090A0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x236A1744CLL);
}

void sub_236A174C4(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      unint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_236A17644(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264CBA6A0, MEMORY[0x263F8C060]);
}

void sub_236A1776C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  CFArrayRef result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

uint64_t anonymous namespace'::AppendMetadataItem<char const*>(__CFArray **a1, const char *a2, const char **a3)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v13);
  uint64_t v6 = *a3;
  size_t v7 = strlen(v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)v6, v7);
  std::stringbuf::str();
  if (v11 >= 0) {
    p_p = (const char *)&__p;
  }
  else {
    p_p = (const char *)__p;
  }
  NamedValue::NamedValue((NamedValue *)&v12, a2, p_p, 0);
  if (v11 < 0) {
    operator delete(__p);
  }
  NamedValues::push_back(a1, &v12);
  NamedValue::~NamedValue(&v12);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v13);
}

void sub_236A1787C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
}

uint64_t anonymous namespace'::AppendMetadataItem<unsigned char>(__CFArray **a1, const char *a2, unsigned char *a3, int a4)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v15);
  if (a4 == 3)
  {
    if (*a3) {
      size_t v8 = "on";
    }
    else {
      size_t v8 = "off";
    }
    if (*a3) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 3;
    }
    goto LABEL_15;
  }
  if (a4 == 2)
  {
    if (*a3) {
      size_t v8 = "yes";
    }
    else {
      size_t v8 = "no";
    }
    if (*a3) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 2;
    }
LABEL_15:
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)v8, v9);
    goto LABEL_17;
  }
  LOBYTE(__p[0]) = *a3;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)__p, 1);
LABEL_17:
  std::stringbuf::str();
  if (v13 >= 0) {
    uint64_t v10 = __p;
  }
  else {
    uint64_t v10 = (void **)__p[0];
  }
  NamedValue::NamedValue((NamedValue *)&v14, a2, (const char *)v10, 0);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  NamedValues::push_back(a1, &v14);
  NamedValue::~NamedValue(&v14);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v15);
}

void sub_236A179F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
}

uint64_t anonymous namespace'::AppendMetadataItem<int>(__CFArray **a1, const char *a2, uint64_t a3, int a4)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v13);
  if (a4 == 1)
  {
    size_t v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)"0x", 2);
    *(_DWORD *)((char *)v7 + *(void *)(*v7 - 24) + 8) = *(_DWORD *)((unsigned char *)v7 + *(void *)(*v7 - 24) + 8) & 0xFFFFFFB5 | 8;
  }
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v11 >= 0) {
    p_p = (const char *)&__p;
  }
  else {
    p_p = (const char *)__p;
  }
  NamedValue::NamedValue((NamedValue *)&v12, a2, p_p, 0);
  if (v11 < 0) {
    operator delete(__p);
  }
  NamedValues::push_back(a1, &v12);
  NamedValue::~NamedValue(&v12);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v13);
}

void sub_236A17B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
}

uint64_t anonymous namespace'::AppendMetadataItem<double>(__CFArray **a1, const char *a2)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v9);
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v7 >= 0) {
    p_p = (const char *)&__p;
  }
  else {
    p_p = (const char *)__p;
  }
  NamedValue::NamedValue((NamedValue *)&v8, a2, p_p, 0);
  if (v7 < 0) {
    operator delete(__p);
  }
  NamedValues::push_back(a1, &v8);
  NamedValue::~NamedValue(&v8);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v9);
}

void sub_236A17C3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
}

uint64_t anonymous namespace'::AppendMetadataItem<short>(__CFArray **a1, const char *a2, _WORD *a3, int a4)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v16);
  if (a4 == 1)
  {
    uint64_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"0x", 2);
    *(_DWORD *)((char *)v10 + *(void *)(*v10 - 24) + 8) = *(_DWORD *)((unsigned char *)v10 + *(void *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
    goto LABEL_11;
  }
  if (a4 != 2)
  {
LABEL_11:
    std::ostream::operator<<();
    goto LABEL_12;
  }
  if (*a3) {
    size_t v8 = "yes";
  }
  else {
    size_t v8 = "no";
  }
  if (*a3) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 2;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)v8, v9);
LABEL_12:
  std::stringbuf::str();
  if (v14 >= 0) {
    p_p = (const char *)&__p;
  }
  else {
    p_p = (const char *)__p;
  }
  NamedValue::NamedValue((NamedValue *)&v15, a2, p_p, 0);
  if (v14 < 0) {
    operator delete(__p);
  }
  NamedValues::push_back(a1, &v15);
  NamedValue::~NamedValue(&v15);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v16);
}

void sub_236A17DC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
}

uint64_t anonymous namespace'::AppendMetadataItem<char [4]>(__CFArray **a1, const char *a2)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"...", 3);
  std::stringbuf::str();
  if (v7 >= 0) {
    p_p = (const char *)&__p;
  }
  else {
    p_p = (const char *)__p;
  }
  NamedValue::NamedValue((NamedValue *)&v8, a2, p_p, 0);
  if (v7 < 0) {
    operator delete(__p);
  }
  NamedValues::push_back(a1, &v8);
  NamedValue::~NamedValue(&v8);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v9);
}

void sub_236A17EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
}

uint64_t anonymous namespace'::AppendMetadataItem<float>(__CFArray **a1, const char *a2)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v9);
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v7 >= 0) {
    p_p = (const char *)&__p;
  }
  else {
    p_p = (const char *)__p;
  }
  NamedValue::NamedValue((NamedValue *)&v8, a2, p_p, 0);
  if (v7 < 0) {
    operator delete(__p);
  }
  NamedValues::push_back(a1, &v8);
  NamedValue::~NamedValue(&v8);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v9);
}

void sub_236A17FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
}

uint64_t anonymous namespace'::AppendMetadataItem<eCIspFocusingMethod>(__CFArray **a1)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v7);
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v5 >= 0) {
    p_p = (const char *)&__p;
  }
  else {
    p_p = (const char *)__p;
  }
  NamedValue::NamedValue((NamedValue *)&v6, "lastFocusingMethod", p_p, 0);
  if (v5 < 0) {
    operator delete(__p);
  }
  NamedValues::push_back(a1, &v6);
  NamedValue::~NamedValue(&v6);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v7);
}

void sub_236A180A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
}

uint64_t anonymous namespace'::AppendMetadataItem(__CFArray **this, NamedValues *a2, const char *a3, double a4, double a5, double a6)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v15);
  *(void *)((char *)&v16[2] + *(void *)(v16[0] - 24)) = 5;
  size_t v8 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)", ", 2);
  uint64_t v9 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)", ", 2);
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v13 >= 0) {
    p_p = (const char *)&__p;
  }
  else {
    p_p = (const char *)__p;
  }
  NamedValue::NamedValue((NamedValue *)&v14, (const char *)a2, p_p, 0);
  if (v13 < 0) {
    operator delete(__p);
  }
  NamedValues::push_back(this, &v14);
  NamedValue::~NamedValue(&v14);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v15);
}

void sub_236A18208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
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

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98790]();
}

{
  return MEMORY[0x270F987A0]();
}

{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987C0]();
}

{
  return MEMORY[0x270F987C8]();
}

{
  return MEMORY[0x270F987D0]();
}

{
  return MEMORY[0x270F987E0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE58](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE68](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}