void LDCreateSystemLexiconCompatibilityVersion(const __CFLocale *a1)
{
  uint64_t v1;
  uint64_t v2;
  double (*v3)(uint64_t, uint64_t, unsigned char *);
  void *v4;
  void *v5;
  void v6[8];

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x4002000000;
  v6[3] = sub_2129D94DC;
  v6[4] = sub_2129D94F8;
  memset(&v6[5], 0, 24);
  v1 = MEMORY[0x263EF8330];
  v2 = 0x40000000;
  v3 = sub_2129D950C;
  v4 = &unk_264197520;
  v5 = v6;
  sub_2129D70B0(a1, 0, 0);
}

void sub_2129D6D04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void LDEnumerateAssetDataItems(CFTypeRef cf, char a2, const void *a3)
{
  if (cf)
  {
    uint64_t v24 = 0;
    v25 = (const void **)&v24;
    uint64_t v26 = 0x3002000000;
    v27 = sub_2129D95AC;
    v28 = sub_2129D95BC;
    CFTypeRef cfa = 0;
    sub_2129D95C8(&cfa, cf);
    CFStringRef Value = (const __CFString *)CFLocaleGetValue((CFLocaleRef)v25[5], (CFLocaleKey)*MEMORY[0x263EFFCE8]);
    CFStringRef v7 = (const __CFString *)LDCopyLocaleIdentifierOverrideForLocaleIdentifier(Value);
    if (v7)
    {
      CFLocaleRef v8 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v7);
      if (v8) {
        sub_2129D8224(v25 + 5, v8);
      }
    }
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2000000000;
    char v23 = 0;
    CFLocaleRef v9 = (const __CFLocale *)v25[5];
    v19[1] = (const void *)MEMORY[0x263EF8330];
    v19[2] = (const void *)0x40000000;
    v19[3] = sub_2129D7E04;
    v19[4] = &unk_264197548;
    v19[5] = a3;
    v19[6] = &v24;
    v19[7] = &v20;
    sub_2129D9400(v9, a2);
    if (!*((unsigned char *)v21 + 24))
    {
      CFTypeRef v10 = CFLocaleGetValue((CFLocaleRef)cf, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
      if (qword_26AA50948 != -1) {
        dispatch_once(&qword_26AA50948, &unk_26C3C9A58);
      }
      if (qword_26AA50940)
      {
        CFArrayRef v11 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)qword_26AA50940, v10);
        CFArrayRef v12 = v11;
        if (v11)
        {
          CFIndex Count = CFArrayGetCount(v11);
          if (Count >= 1)
          {
            CFIndex v14 = 0;
            CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
            do
            {
              if (*((unsigned char *)v21 + 24)) {
                break;
              }
              CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v12, v14);
              CFLocaleRef v17 = CFLocaleCreate(v15, ValueAtIndex);
              if (v17)
              {
                v19[0] = 0;
                sub_2129D95C8(v19, v17);
                v18 = v19[0];
                sub_2129D9400((const __CFLocale *)v19[0], a2);
                if (v18) {
                  CFRelease(v18);
                }
              }
              ++v14;
            }
            while (Count != v14);
          }
        }
      }
    }
    _Block_object_dispose(&v20, 8);
    if (v7) {
      CFRelease(v7);
    }
    _Block_object_dispose(&v24, 8);
    if (cfa) {
      CFRelease(cfa);
    }
  }
}

void sub_2129D7020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,CFTypeRef cf)
{
  _Block_object_dispose(&a24, 8);
  if (v33) {
    CFRelease(v33);
  }
  _Block_object_dispose(&a28, 8);
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(a1);
}

void sub_2129D70B0(const __CFLocale *a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0
    && !CFPreferencesGetAppBooleanValue(@"LMDisableMobileAssets", (CFStringRef)*MEMORY[0x263EFFE48], 0)
    && (_os_feature_enabled_impl() & 1) != 0)
  {
    operator new();
  }
  operator new();
}

void sub_2129D7480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_2129D85C0((const void **)va, 0);
  _Unwind_Resume(a1);
}

CFStringRef sub_2129D74D4(const __CFString *a1, int a2, uint64_t a3)
{
  if ((a2 - 1) > 2) {
    v6 = @"RequiredAssets";
  }
  else {
    v6 = *(&off_2641975B8 + (a2 - 1));
  }
  v50 = @"/System/Library/LinguisticData/";
  CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"%@/%@_%@.bundle", @"/System/Library/LinguisticData/", v6, a1);
  CFStringRef v49 = v7;
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 1024);
  CFStringRef v9 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], "/", 0x8000100u);
  CFStringAppend(Mutable, v9);
  if (v7) {
    CFStringAppend(Mutable, v7);
  }
  CFRelease(v9);
  CFMutableStringRef v48 = Mutable;
  sub_2129D80B0(Mutable, v46);
  memset(&v45, 0, sizeof(v45));
  if ((v47 & 0x80u) == 0) {
    CFTypeRef v10 = v46;
  }
  else {
    CFTypeRef v10 = (void **)v46[0];
  }
  if ((v47 & 0x80u) == 0) {
    std::string::size_type v11 = v47;
  }
  else {
    std::string::size_type v11 = (std::string::size_type)v46[1];
  }
  if (v11)
  {
    if (&v45 > (std::string *)v10 || (char *)&v45.__r_.__value_.__l.__data_ + 1 <= (char *)v10)
    {
      if (v11 < 0x17)
      {
        v13 = &v45;
      }
      else
      {
        std::string::__grow_by(&v45, 0x16uLL, v11 - 22, 0, 0, 0, 0);
        v45.__r_.__value_.__l.__size_ = 0;
        if ((v45.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v13 = &v45;
        }
        else {
          v13 = (std::string *)v45.__r_.__value_.__r.__words[0];
        }
      }
      for (uint64_t i = 0; i != v11; ++i)
        v13->__r_.__value_.__s.__data_[i] = *((unsigned char *)v10 + i);
      v13->__r_.__value_.__s.__data_[i] = 0;
      if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
        v45.__r_.__value_.__l.__size_ = v11;
      }
      else {
        *((unsigned char *)&v45.__r_.__value_.__s + 23) = v11 & 0x7F;
      }
    }
    else
    {
      if (v11 >= 0x7FFFFFFFFFFFFFF8) {
        sub_2129D8518();
      }
      if (v11 > 0x16)
      {
        uint64_t v15 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v11 | 7) != 0x17) {
          uint64_t v15 = v11 | 7;
        }
        uint64_t v16 = v15 + 1;
        p_p = operator new(v15 + 1);
        std::string::size_type v38 = v11;
        int64_t v39 = v16 | 0x8000000000000000;
        __p = p_p;
      }
      else
      {
        HIBYTE(v39) = v11;
        p_p = &__p;
      }
      do
      {
        char v17 = *(unsigned char *)v10;
        CFTypeRef v10 = (void **)((char *)v10 + 1);
        *p_p++ = v17;
        --v11;
      }
      while (v11);
      unsigned char *p_p = 0;
      if (v39 >= 0) {
        v18 = (const std::string::value_type *)&__p;
      }
      else {
        v18 = (const std::string::value_type *)__p;
      }
      if (v39 >= 0) {
        std::string::size_type v19 = HIBYTE(v39);
      }
      else {
        std::string::size_type v19 = v38;
      }
      std::string::append(&v45, v18, v19);
      if (SHIBYTE(v39) < 0) {
        operator delete(__p);
      }
    }
  }
  std::__fs::filesystem::__status((const std::__fs::filesystem::path *)&v45, 0);
  unsigned __int8 v20 = __p;
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v45.__r_.__value_.__l.__data_);
  }
  CFStringRef v21 = 0;
  if (v20 && v20 != 255)
  {
    CFURLRef v22 = CFURLCreateWithFileSystemPath(0, Mutable, kCFURLPOSIXPathStyle, 1u);
    v45.__r_.__value_.__r.__words[0] = (std::string::size_type)v22;
    char v23 = CFBundleCreate(0, v22);
    v44 = v23;
    CFLocaleRef v24 = CFLocaleCreate(0, a1);
    CFLocaleRef v43 = v24;
    if (!v24)
    {
      CFStringRef v21 = 0;
      if (!v23) {
        goto LABEL_65;
      }
      goto LABEL_64;
    }
    if (v23)
    {
      CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(v23);
      if (InfoDictionary)
      {
        CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(InfoDictionary, @"MobileAssetProperties");
        CFDictionaryRef v27 = Value;
        if (Value)
        {
          CFTypeID v28 = CFGetTypeID(Value);
          if (v28 == CFDictionaryGetTypeID())
          {
            CFStringRef v21 = (const __CFString *)CFDictionaryGetValue(v27, @"AssetLocale");
            CFTypeRef cf = CFDictionaryGetValue(v27, @"Contents");
            if (!v21) {
              goto LABEL_61;
            }
            CFTypeID v29 = CFGetTypeID(v21);
            CFStringRef v35 = v21;
            CFStringRef v21 = 0;
            if (v29 != CFStringGetTypeID() || !cf) {
              goto LABEL_61;
            }
            CFTypeID v30 = CFGetTypeID(cf);
            if (v30 == CFArrayGetTypeID())
            {
              char v42 = 0;
              CFLocaleRef v31 = CFLocaleCreate(0, v35);
              CFLocaleRef v41 = v31;
              if (v31 && CFEqual(v31, v24))
              {
                CFURLRef v32 = CFBundleCopyResourceURL(v23, @"AssetData", 0, 0);
                *(void *)v40 = v32;
                if (v32
                  || (CFURLRef v33 = CFURLCreateCopyAppendingPathComponent(0, v22, @"AssetData", 1u),
                      sub_2129D835C((const void **)v40, v33),
                      (CFURLRef v32 = *(CFURLRef *)v40) != 0))
                {
                  sub_2129D825C((uint64_t)&__p, v32, v35, a2, v27, cf);
                  (*(void (**)(uint64_t, void **, char *))(a3 + 16))(a3, &__p, &v42);
                  sub_2129D81D0((const void **)&__p);
                }
                sub_2129D835C((const void **)v40, 0);
              }
              CFStringRef v21 = (const __CFString *)(v42 != 0);
              sub_2129D8224((const void **)&v41, 0);
LABEL_61:
              CFRelease(v24);
              if (!v23)
              {
LABEL_65:
                if (v22) {
                  CFRelease(v22);
                }
                goto LABEL_67;
              }
LABEL_64:
              CFRelease(v23);
              goto LABEL_65;
            }
          }
        }
      }
    }
    CFStringRef v21 = 0;
    goto LABEL_61;
  }
LABEL_67:
  if ((char)v47 < 0)
  {
    operator delete(v46[0]);
    if (!Mutable) {
      goto LABEL_72;
    }
    goto LABEL_71;
  }
  if (Mutable) {
LABEL_71:
  }
    CFRelease(Mutable);
LABEL_72:
  if (v7) {
    CFRelease(v7);
  }
  CFRelease(@"/System/Library/LinguisticData/");
  return v21;
}

void sub_2129D79B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,const void *a23,const void *a24,uint64_t a25,const void *a26,const void *a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  sub_2129D835C(&a23, 0);
  sub_2129D8224(&a24, 0);
  sub_2129D8224(&a26, 0);
  sub_2129D94A8(&a27);
  sub_2129D835C((const void **)&a28, 0);
  if (*(char *)(v33 - 113) < 0) {
    operator delete(*(void **)(v33 - 136));
  }
  sub_2129D85C0((const void **)(v33 - 112), 0);
  sub_2129D85C0((const void **)(v33 - 104), 0);
  sub_2129D85C0((const void **)(v33 - 96), 0);
  _Unwind_Resume(a1);
}

void sub_2129D7AE0()
{
}

uint64_t sub_2129D7AF4()
{
  if (!qword_26AA50958) {
    qword_26AA50958 = _sl_dlopen();
  }
  return qword_26AA50958;
}

void *LDCopyLocaleIdentifierOverrideForLocaleIdentifier(const __CFString *a1)
{
  sub_2129D80B0(a1, v6);
  sub_2129D7CB8();
  v1 = sub_2129D7FB4((unsigned __int8 *)v6);
  sub_2129D7CB8();
  if (v1)
  {
    sub_2129D7CB8();
    v2 = sub_2129D7FB4((unsigned __int8 *)v6);
    if (!v2) {
      sub_2129D9340();
    }
    if ((char)v2[63] < 0)
    {
      sub_2129D85F8(__p, *((void **)v2 + 5), *((void *)v2 + 6));
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)(v2 + 40);
      uint64_t v5 = *((void *)v2 + 7);
    }
    v1 = (void *)sub_2129D8404((uint64_t)__p);
    if (SHIBYTE(v5) < 0) {
      operator delete(__p[0]);
    }
  }
  if (v7 < 0) {
    operator delete(v6[0]);
  }
  return v1;
}

void sub_2129D7C7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

void sub_2129D7CB8()
{
  v4[6] = *MEMORY[0x263EF8340];
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AA509A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AA509A8))
  {
    sub_2129D8B8C(v1);
    sub_2129D8BE8(v2);
    sub_2129D8C44(v3, "fr_CH");
    sub_2129D8C44(v4, "fr_BE");
    sub_2129D8C98((uint64_t)v1, 4);
    for (uint64_t i = 18; i != -6; i -= 6)
      sub_2129D91A8((uint64_t)&v1[i]);
    __cxa_guard_release(&qword_26AA509A8);
  }
}

void sub_2129D7DAC(_Unwind_Exception *a1)
{
  for (uint64_t i = 144; i != -48; i -= 48)
    sub_2129D91A8(v1 + i);
  __cxa_guard_abort(&qword_26AA509A8);
  _Unwind_Resume(a1);
}

BOOL sub_2129D7E04(uint64_t *a1, CFArrayRef *a2, unsigned char *a3)
{
  BOOL result = sub_2129D9670(a2, *(const __CFLocale **)(*(void *)(a1[5] + 8) + 40), a1[4]);
  *a3 = result;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

void sub_2129D7E50(uint64_t a1, const void *a2, CFDictionaryRef theDict, unsigned char *a4)
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, @"AssetLocale");
  CFStringRef v9 = CFDictionaryGetValue(theDict, @"Contents");
  if (Value)
  {
    CFTypeRef v10 = v9;
    CFTypeID v11 = CFGetTypeID(Value);
    if (v11 == CFStringGetTypeID() && v10 != 0)
    {
      CFTypeID v13 = CFGetTypeID(v10);
      if (v13 == CFArrayGetTypeID())
      {
        uint64_t v14 = *(void *)(a1 + 32);
        sub_2129D825C((uint64_t)v15, a2, Value, *(_DWORD *)(a1 + 48), theDict, v10);
        (*(void (**)(uint64_t, unsigned char *, uint64_t))(v14 + 16))(v14, v15, *(void *)(*(void *)(a1 + 40) + 8) + 24);
        if (cf) {
          CFRelease(cf);
        }
        CFTypeRef cf = 0;
        if (v18) {
          CFRelease(v18);
        }
        CFTypeRef v18 = 0;
        if (v17) {
          CFRelease(v17);
        }
        CFTypeRef v17 = 0;
        if (v16) {
          CFRelease(v16);
        }
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
          *a4 = 1;
        }
      }
    }
  }
}

void sub_2129D7FA0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2129D81D0((const void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_2129D7FB4(unsigned __int8 *a1)
{
  unint64_t v2 = sub_2129D8698((uint64_t)a1);
  unint64_t v3 = *((void *)&xmmword_26AA50970 + 1);
  if (!*((void *)&xmmword_26AA50970 + 1)) {
    return 0;
  }
  unint64_t v4 = v2;
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&xmmword_26AA50970 + 8));
  v5.i16[0] = vaddlv_u8(v5);
  unint64_t v6 = v5.u32[0];
  if (v5.u32[0] > 1uLL)
  {
    unint64_t v7 = v2;
    if (v2 >= *((void *)&xmmword_26AA50970 + 1)) {
      unint64_t v7 = v2 % *((void *)&xmmword_26AA50970 + 1);
    }
  }
  else
  {
    unint64_t v7 = (*((void *)&xmmword_26AA50970 + 1) - 1) & v2;
  }
  CFLocaleRef v8 = *(unsigned __int8 ***)(xmmword_26AA50970 + 8 * v7);
  if (!v8) {
    return 0;
  }
  for (uint64_t i = *v8; i; uint64_t i = *(unsigned __int8 **)i)
  {
    unint64_t v10 = *((void *)i + 1);
    if (v4 == v10)
    {
      if (sub_2129D8AE8(i + 16, a1)) {
        return i;
      }
    }
    else
    {
      if (v6 > 1)
      {
        if (v10 >= v3) {
          v10 %= v3;
        }
      }
      else
      {
        v10 &= v3 - 1;
      }
      if (v10 != v7) {
        return 0;
      }
    }
  }
  return i;
}

const __CFString *sub_2129D80B0@<X0>(const __CFString *result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    CFStringRef v3 = result;
    CStringPtr = (char *)CFStringGetCStringPtr(result, 0x8000100u);
    if (!CStringPtr)
    {
      CFIndex Length = CFStringGetLength(v3);
      CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      operator new[]();
    }
    return (const __CFString *)sub_2129D8464(a2, CStringPtr);
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }
  return result;
}

void sub_2129D81AC(_Unwind_Exception *a1)
{
  MEMORY[0x216689B50](v1, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

const void **sub_2129D81D0(const void **a1)
{
  return a1;
}

void sub_2129D8224(const void **a1, const void *a2)
{
  unint64_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

uint64_t sub_2129D825C(uint64_t a1, const void *a2, CFLocaleIdentifier localeIdentifier, int a4, const void *a5, const void *a6)
{
  *(_DWORD *)a1 = a4;
  *(void *)(a1 + 8) = 0;
  unint64_t v10 = (const void **)(a1 + 8);
  CFLocaleRef v11 = CFLocaleCreate(0, localeIdentifier);
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 16) = v11;
  *(void *)(a1 + 32) = 0;
  if (*(const void **)(a1 + 8) == a2)
  {
    CFArrayRef v12 = 0;
  }
  else
  {
    CFRetain(a2);
    sub_2129D835C(v10, a2);
    CFArrayRef v12 = *(const void **)(a1 + 24);
  }
  if (v12 != a5)
  {
    CFRetain(a5);
    sub_2129D83CC((const void **)(a1 + 24), a5);
  }
  if (*(const void **)(a1 + 32) != a6)
  {
    CFRetain(a6);
    sub_2129D8394((const void **)(a1 + 32), a6);
  }
  return a1;
}

void sub_2129D8344(_Unwind_Exception *a1)
{
  sub_2129D835C(v1, 0);
  _Unwind_Resume(a1);
}

void sub_2129D835C(const void **a1, const void *a2)
{
  unint64_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void sub_2129D8394(const void **a1, const void *a2)
{
  unint64_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void sub_2129D83CC(const void **a1, const void *a2)
{
  unint64_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

CFStringRef sub_2129D8404(uint64_t a1)
{
  uint64_t v1 = (const UInt8 *)a1;
  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    CFIndex v2 = *(unsigned __int8 *)(a1 + 23);
    if (!*(unsigned char *)(a1 + 23)) {
      return &stru_26C3C9B48;
    }
    return CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], v1, v2, 0x8000100u, 0);
  }
  CFIndex v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v1 = *(const UInt8 **)a1;
    return CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], v1, v2, 0x8000100u, 0);
  }
  return &stru_26C3C9B48;
}

void sub_2129D8450(void *a1)
{
}

void *sub_2129D8464(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2129D8518();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    unint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_2129D8518()
{
}

void sub_2129D8530(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_2129D858C(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2641974B0, MEMORY[0x263F8C060]);
}

void sub_2129D8578(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_2129D858C(std::logic_error *a1, const char *a2)
{
  BOOL result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_2129D85C0(const void **a1, const void *a2)
{
  size_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void *sub_2129D85F8(unsigned char *__dst, void *__src, unint64_t a3)
{
  size_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_2129D8518();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *size_t v5 = v8;
    size_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

unint64_t sub_2129D8698(uint64_t a1)
{
  int v1 = *(char *)(a1 + 23);
  unint64_t v2 = *(void *)(a1 + 8);
  BOOL v3 = v1 < 0;
  if (v1 >= 0) {
    size_t v4 = (uint64_t *)a1;
  }
  else {
    size_t v4 = *(uint64_t **)a1;
  }
  if (!v3) {
    unint64_t v2 = *(unsigned __int8 *)(a1 + 23);
  }
  if (v2 > 0x20)
  {
    if (v2 > 0x40)
    {
      unint64_t v34 = 0x9DDFEA08EB382D69;
      uint64_t v44 = *(uint64_t *)((char *)v4 + v2 - 48);
      uint64_t v43 = *(uint64_t *)((char *)v4 + v2 - 40);
      uint64_t v45 = *(uint64_t *)((char *)v4 + v2 - 24);
      uint64_t v47 = *(uint64_t *)((char *)v4 + v2 - 64);
      uint64_t v46 = *(uint64_t *)((char *)v4 + v2 - 56);
      uint64_t v48 = *(uint64_t *)((char *)v4 + v2 - 16);
      uint64_t v49 = *(uint64_t *)((char *)v4 + v2 - 8);
      unint64_t v50 = v46 + v48;
      unint64_t v51 = 0x9DDFEA08EB382D69
          * (v45 ^ ((0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))));
      unint64_t v52 = 0x9DDFEA08EB382D69 * (v51 ^ (v51 >> 47));
      unint64_t v53 = v47 + v2 + v46 + v44;
      uint64_t v54 = v53 + v43;
      unint64_t v55 = __ROR8__(v53, 44) + v47 + v2 + __ROR8__(v43 + v47 + v2 - 0x622015F714C7D297 * (v51 ^ (v51 >> 47)), 21);
      uint64_t v56 = v46 + v48 + *(uint64_t *)((char *)v4 + v2 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v57 = v56 + v45 + v48;
      uint64_t v58 = __ROR8__(v57, 44);
      uint64_t v59 = v57 + v49;
      uint64_t v60 = v58 + v56 + __ROR8__(v56 + v43 + v49, 21);
      uint64_t v62 = *v4;
      v61 = v4 + 4;
      unint64_t v63 = v62 - 0x4B6D499041670D8DLL * v43;
      uint64_t v64 = -(uint64_t)((v2 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v65 = *(v61 - 3);
        uint64_t v66 = v63 + v54 + v50 + v65;
        uint64_t v67 = v61[2];
        uint64_t v68 = v61[3];
        uint64_t v69 = v61[1];
        unint64_t v50 = v69 + v54 - 0x4B6D499041670D8DLL * __ROR8__(v50 + v55 + v67, 42);
        uint64_t v70 = v52 + v59;
        uint64_t v71 = *(v61 - 2);
        uint64_t v72 = *(v61 - 1);
        uint64_t v73 = *(v61 - 4) - 0x4B6D499041670D8DLL * v55;
        uint64_t v74 = v73 + v59 + v72;
        uint64_t v75 = v73 + v65 + v71;
        uint64_t v54 = v75 + v72;
        uint64_t v76 = __ROR8__(v75, 44) + v73;
        unint64_t v77 = (0xB492B66FBE98F273 * __ROR8__(v66, 37)) ^ v60;
        unint64_t v63 = 0xB492B66FBE98F273 * __ROR8__(v70, 33);
        unint64_t v55 = v76 + __ROR8__(v74 + v77, 21);
        unint64_t v78 = v63 + v60 + *v61;
        uint64_t v59 = v78 + v69 + v67 + v68;
        uint64_t v60 = __ROR8__(v78 + v69 + v67, 44) + v78 + __ROR8__(v50 + v71 + v78 + v68, 21);
        v61 += 8;
        unint64_t v52 = v77;
        v64 += 64;
      }
      while (v64);
      unint64_t v79 = 0x9DDFEA08EB382D69
          * (v59 ^ ((0x9DDFEA08EB382D69 * (v59 ^ v54)) >> 47) ^ (0x9DDFEA08EB382D69 * (v59 ^ v54)));
      unint64_t v80 = v63
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) ^ ((0x9DDFEA08EB382D69 * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) >> 47));
      unint64_t v81 = 0x9DDFEA08EB382D69
          * (v80 ^ (v77 - 0x4B6D499041670D8DLL * (v50 ^ (v50 >> 47)) - 0x622015F714C7D297 * (v79 ^ (v79 >> 47))));
      unint64_t v35 = 0x9DDFEA08EB382D69 * (v80 ^ (v81 >> 47) ^ v81);
    }
    else
    {
      CFStringRef v9 = (char *)v4 + v2;
      uint64_t v10 = *(uint64_t *)((char *)v4 + v2 - 16);
      uint64_t v11 = *(uint64_t *)((char *)v4 + v2 - 8);
      uint64_t v12 = v4[1];
      uint64_t v13 = *v4 - 0x3C5A37A36834CED9 * (v10 + v2);
      CFTypeRef v16 = v4 + 2;
      uint64_t v14 = v4[2];
      uint64_t v15 = v16[1];
      uint64_t v17 = __ROR8__(v13 + v15, 52);
      uint64_t v18 = __ROR8__(v13, 37);
      uint64_t v19 = v13 + v12;
      uint64_t v20 = __ROR8__(v19, 7);
      uint64_t v21 = v19 + v14;
      uint64_t v22 = v20 + v18;
      uint64_t v23 = *((void *)v9 - 4) + v14;
      uint64_t v24 = v11 + v15;
      uint64_t v25 = __ROR8__(v24 + v23, 52);
      uint64_t v26 = v22 + v17;
      uint64_t v27 = __ROR8__(v23, 37);
      uint64_t v28 = *((void *)v9 - 3) + v23;
      uint64_t v29 = __ROR8__(v28, 7);
      uint64_t v30 = v26 + __ROR8__(v21, 31);
      uint64_t v31 = v28 + v10;
      uint64_t v32 = v31 + v24;
      uint64_t v33 = v21 + v15 + v27 + v29 + v25 + __ROR8__(v31, 31);
      unint64_t v34 = 0x9AE16A3B2F90404FLL;
      unint64_t v35 = v30
          - 0x3C5A37A36834CED9
          * ((0xC3A5C85C97CB3127 * (v32 + v30) - 0x651E95C4D06FBFB1 * v33) ^ ((0xC3A5C85C97CB3127 * (v32 + v30)
                                                                                 - 0x651E95C4D06FBFB1 * v33) >> 47));
    }
    return (v35 ^ (v35 >> 47)) * v34;
  }
  else
  {
    if (v2 > 0x10)
    {
      uint64_t v36 = v4[1];
      unint64_t v37 = 0xB492B66FBE98F273 * *v4;
      unint64_t v38 = 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)v4 + v2 - 8);
      uint64_t v39 = __ROR8__(v38, 30) + __ROR8__(v37 - v36, 43);
      unint64_t v40 = v37 + v2 + __ROR8__(v36 ^ 0xC949D7C7509E6557, 20) - v38;
      unint64_t v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v39 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)v4 + v2 - 16)));
      unint64_t v42 = v40 ^ (v41 >> 47) ^ v41;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    if (v2 >= 9)
    {
      uint64_t v5 = *v4;
      uint64_t v6 = *(uint64_t *)((char *)v4 + v2 - 8);
      uint64_t v7 = __ROR8__(v6 + v2, v2);
      return (0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69
              * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) >> 47))) ^ v6;
    }
    if (v2 >= 4)
    {
      int v82 = *(_DWORD *)v4;
      uint64_t v83 = *(unsigned int *)((char *)v4 + v2 - 4);
      unint64_t v84 = 0x9DDFEA08EB382D69 * ((v2 + (8 * v82)) ^ v83);
      unint64_t v42 = v83 ^ (v84 >> 47) ^ v84;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    unint64_t result = 0x9AE16A3B2F90404FLL;
    if (v2)
    {
      unint64_t v85 = (0xC949D7C7509E6557 * (v2 + 4 * *((unsigned __int8 *)v4 + v2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                     * (*(unsigned __int8 *)v4 | ((unint64_t)*((unsigned __int8 *)v4 + (v2 >> 1)) << 8)));
      return 0x9AE16A3B2F90404FLL * (v85 ^ (v85 >> 47));
    }
  }
  return result;
}

BOOL sub_2129D8AE8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = a1[23];
  if ((v2 & 0x80u) == 0) {
    uint64_t v3 = a1[23];
  }
  else {
    uint64_t v3 = *((void *)a1 + 1);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 0;
  }
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0) {
    return memcmp(*(const void **)a1, a2, *((void *)a1 + 1)) == 0;
  }
  if (!a1[23]) {
    return 1;
  }
  uint64_t v6 = v2 - 1;
  do
  {
    int v8 = *a1++;
    int v7 = v8;
    int v10 = *a2++;
    int v9 = v10;
    BOOL v12 = v6-- != 0;
    BOOL v13 = v7 == v9;
    BOOL v14 = v7 == v9;
  }
  while (v13 && v12);
  return v14;
}

void *sub_2129D8B8C(void *a1)
{
  uint64_t v2 = sub_2129D8464(a1, "ars");
  sub_2129D8464(v2 + 3, "ar");
  return a1;
}

void sub_2129D8BCC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_2129D8BE8(void *a1)
{
  uint64_t v2 = sub_2129D8464(a1, "ars_SA");
  sub_2129D8464(v2 + 3, "ar");
  return a1;
}

void sub_2129D8C28(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_2129D8C44(void *a1, char *a2)
{
  uint64_t v3 = sub_2129D8464(a1, a2);
  sub_2129D8464(v3 + 3, "fr_FR");
  return a1;
}

void sub_2129D8C7C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2129D8C98(uint64_t a1, uint64_t a2)
{
  xmmword_26AA50970 = 0u;
  *(_OWORD *)&qword_26AA50980 = 0u;
  dword_26AA50990 = 1065353216;
  if (a2)
  {
    uint64_t v3 = a1;
    uint64_t v4 = a1 + 48 * a2;
    while (1)
    {
      unint64_t v5 = sub_2129D8698(v3);
      unint64_t v6 = v5;
      unint64_t v7 = *((void *)&xmmword_26AA50970 + 1);
      if (*((void *)&xmmword_26AA50970 + 1))
      {
        uint8x8_t v8 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&xmmword_26AA50970 + 8));
        v8.i16[0] = vaddlv_u8(v8);
        unint64_t v9 = v8.u32[0];
        if (v8.u32[0] > 1uLL)
        {
          unint64_t v2 = v5;
          if (v5 >= *((void *)&xmmword_26AA50970 + 1)) {
            unint64_t v2 = v5 % *((void *)&xmmword_26AA50970 + 1);
          }
        }
        else
        {
          unint64_t v2 = (*((void *)&xmmword_26AA50970 + 1) - 1) & v5;
        }
        int v10 = *(unsigned __int8 ***)(xmmword_26AA50970 + 8 * v2);
        if (v10)
        {
          for (uint64_t i = *v10; i; uint64_t i = *(unsigned __int8 **)i)
          {
            unint64_t v12 = *((void *)i + 1);
            if (v12 == v6)
            {
              if (sub_2129D8AE8(i + 16, (unsigned __int8 *)v3)) {
                goto LABEL_81;
              }
            }
            else
            {
              if (v9 > 1)
              {
                if (v12 >= v7) {
                  v12 %= v7;
                }
              }
              else
              {
                v12 &= v7 - 1;
              }
              if (v12 != v2) {
                break;
              }
            }
          }
        }
      }
      BOOL v13 = operator new(0x40uLL);
      BOOL v14 = v13;
      v38[0] = v13;
      v38[1] = &qword_26AA50980;
      char v39 = 0;
      void *v13 = 0;
      v13[1] = v6;
      if (*(char *)(v3 + 23) < 0)
      {
        sub_2129D85F8((unsigned char *)v13 + 16, *(void **)v3, *(void *)(v3 + 8));
      }
      else
      {
        long long v15 = *(_OWORD *)v3;
        v13[4] = *(void *)(v3 + 16);
        *((_OWORD *)v13 + 1) = v15;
      }
      CFTypeRef v16 = v14 + 5;
      if (*(char *)(v3 + 47) < 0)
      {
        sub_2129D85F8(v16, *(void **)(v3 + 24), *(void *)(v3 + 32));
      }
      else
      {
        long long v17 = *(_OWORD *)(v3 + 24);
        v14[7] = *(void *)(v3 + 40);
        *(_OWORD *)CFTypeRef v16 = v17;
      }
      char v39 = 1;
      float v18 = (float)(unint64_t)(qword_26AA50988 + 1);
      if (!v7 || (float)(*(float *)&dword_26AA50990 * (float)v7) < v18) {
        break;
      }
LABEL_71:
      unint64_t v34 = *(uint64_t **)(xmmword_26AA50970 + 8 * v2);
      uint64_t v35 = v38[0];
      if (v34)
      {
        *(void *)v38[0] = *v34;
      }
      else
      {
        *(void *)v38[0] = qword_26AA50980;
        qword_26AA50980 = v35;
        *(void *)(xmmword_26AA50970 + 8 * v2) = &qword_26AA50980;
        if (!*(void *)v35) {
          goto LABEL_80;
        }
        unint64_t v36 = *(void *)(*(void *)v35 + 8);
        if ((v7 & (v7 - 1)) != 0)
        {
          if (v36 >= v7) {
            v36 %= v7;
          }
        }
        else
        {
          v36 &= v7 - 1;
        }
        unint64_t v34 = (uint64_t *)(xmmword_26AA50970 + 8 * v36);
      }
      *unint64_t v34 = v35;
LABEL_80:
      v38[0] = 0;
      ++qword_26AA50988;
      sub_2129D92B4((uint64_t)v38);
LABEL_81:
      v3 += 48;
      if (v3 == v4) {
        return;
      }
    }
    BOOL v19 = (v7 & (v7 - 1)) != 0;
    if (v7 < 3) {
      BOOL v19 = 1;
    }
    unint64_t v20 = v19 | (2 * v7);
    unint64_t v21 = vcvtps_u32_f32(v18 / *(float *)&dword_26AA50990);
    if (v20 <= v21) {
      int8x8_t prime = (int8x8_t)v21;
    }
    else {
      int8x8_t prime = (int8x8_t)v20;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v7 = *((void *)&xmmword_26AA50970 + 1);
    if (*(void *)&prime > *((void *)&xmmword_26AA50970 + 1)) {
      goto LABEL_37;
    }
    if (*(void *)&prime < *((void *)&xmmword_26AA50970 + 1))
    {
      unint64_t v29 = vcvtps_u32_f32((float)(unint64_t)qword_26AA50988 / *(float *)&dword_26AA50990);
      if (*((void *)&xmmword_26AA50970 + 1) < 3uLL
        || (uint8x8_t v30 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&xmmword_26AA50970 + 8)),
            v30.i16[0] = vaddlv_u8(v30),
            v30.u32[0] > 1uLL))
      {
        unint64_t v29 = std::__next_prime(v29);
      }
      else
      {
        uint64_t v31 = 1 << -(char)__clz(v29 - 1);
        if (v29 >= 2) {
          unint64_t v29 = v31;
        }
      }
      if (*(void *)&prime <= v29) {
        int8x8_t prime = (int8x8_t)v29;
      }
      if (*(void *)&prime >= v7)
      {
        unint64_t v7 = *((void *)&xmmword_26AA50970 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_37:
          if (*(void *)&prime >> 61) {
            sub_2129D930C();
          }
          uint64_t v23 = operator new(8 * *(void *)&prime);
          uint64_t v24 = (void *)xmmword_26AA50970;
          *(void *)&xmmword_26AA50970 = v23;
          if (v24) {
            operator delete(v24);
          }
          uint64_t v25 = 0;
          *((int8x8_t *)&xmmword_26AA50970 + 1) = prime;
          do
            *(void *)(xmmword_26AA50970 + 8 * v25++) = 0;
          while (*(void *)&prime != v25);
          uint64_t v26 = (void **)qword_26AA50980;
          if (qword_26AA50980)
          {
            unint64_t v27 = *(void *)(qword_26AA50980 + 8);
            uint8x8_t v28 = (uint8x8_t)vcnt_s8(prime);
            v28.i16[0] = vaddlv_u8(v28);
            if (v28.u32[0] > 1uLL)
            {
              if (v27 >= *(void *)&prime) {
                v27 %= *(void *)&prime;
              }
            }
            else
            {
              v27 &= *(void *)&prime - 1;
            }
            *(void *)(xmmword_26AA50970 + 8 * v27) = &qword_26AA50980;
            for (j = *v26; j; unint64_t v27 = v33)
            {
              unint64_t v33 = j[1];
              if (v28.u32[0] > 1uLL)
              {
                if (v33 >= *(void *)&prime) {
                  v33 %= *(void *)&prime;
                }
              }
              else
              {
                v33 &= *(void *)&prime - 1;
              }
              if (v33 != v27)
              {
                if (!*(void *)(xmmword_26AA50970 + 8 * v33))
                {
                  *(void *)(xmmword_26AA50970 + 8 * v33) = v26;
                  goto LABEL_62;
                }
                *uint64_t v26 = (void *)*j;
                void *j = **(void **)(xmmword_26AA50970 + 8 * v33);
                **(void **)(xmmword_26AA50970 + 8 * v33) = j;
                j = v26;
              }
              unint64_t v33 = v27;
LABEL_62:
              uint64_t v26 = (void **)j;
              j = (void *)*j;
            }
          }
          unint64_t v7 = (unint64_t)prime;
          goto LABEL_66;
        }
        unint64_t v37 = (void *)xmmword_26AA50970;
        *(void *)&xmmword_26AA50970 = 0;
        if (v37) {
          operator delete(v37);
        }
        unint64_t v7 = 0;
        *((void *)&xmmword_26AA50970 + 1) = 0;
      }
    }
LABEL_66:
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v2 = v6 % v7;
      }
      else {
        unint64_t v2 = v6;
      }
    }
    else
    {
      unint64_t v2 = (v7 - 1) & v6;
    }
    goto LABEL_71;
  }
}

void sub_2129D9168(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2129D92B4((uint64_t)va);
  sub_2129D91EC();
  _Unwind_Resume(a1);
}

uint64_t sub_2129D91A8(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_2129D91EC()
{
  v0 = (void *)qword_26AA50980;
  if (qword_26AA50980)
  {
    do
    {
      uint64_t v1 = (void *)*v0;
      sub_2129D925C((uint64_t)(v0 + 2));
      operator delete(v0);
      v0 = v1;
    }
    while (v1);
  }
  unint64_t v2 = (void *)xmmword_26AA50970;
  *(void *)&xmmword_26AA50970 = 0;
  if (v2)
  {
    operator delete(v2);
  }
}

void sub_2129D925C(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0)
  {
    unint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

void sub_2129D92B4(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      sub_2129D925C((uint64_t)v1 + 16);
    }
    operator delete(v1);
  }
}

void sub_2129D930C()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void sub_2129D9340()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_2129D9394(exception);
  __cxa_throw(exception, (struct type_info *)off_2641974B8, MEMORY[0x263F8C068]);
}

void sub_2129D9380(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_2129D9394(std::logic_error *a1)
{
  unint64_t result = std::logic_error::logic_error(a1, "unordered_map::at: key not found");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

os_log_t sub_2129D93D0()
{
  os_log_t result = os_log_create("com.apple.LinguisticData", "Default");
  qword_26AA50930 = (uint64_t)result;
  return result;
}

CFLocaleRef sub_2129D9400(const __CFLocale *result, char a2)
{
  if (result) {
    sub_2129D70B0(result, 2, a2);
  }
  return result;
}

void sub_2129D94A8(const void **a1)
{
  unint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  *a1 = 0;
}

__n128 sub_2129D94DC(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2129D94F8(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
}

double sub_2129D950C(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 24), @"LMLexiconCompatibilityVersion");
  if (Value)
  {
    CFStringRef v7 = Value;
    CFTypeID v8 = CFGetTypeID(Value);
    if (v8 == CFStringGetTypeID())
    {
      sub_2129D80B0(v7, &v11);
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v10 = v9 + 40;
      if (*(char *)(v9 + 63) < 0) {
        operator delete(*(void **)v10);
      }
      double result = *(double *)&v11;
      *(_OWORD *)uint64_t v10 = v11;
      *(void *)(v10 + 16) = v12;
      *a3 = 1;
    }
  }
  return result;
}

uint64_t sub_2129D95AC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  *(void *)(result + 40) = v2;
  return result;
}

void sub_2129D95BC(uint64_t a1)
{
}

void sub_2129D95C8(const void **a1, CFTypeRef cf)
{
  if (*a1 != cf)
  {
    CFRetain(cf);
    sub_2129D8224(a1, cf);
  }
}

BOOL sub_2129D9628(uint64_t a1, CFArrayRef *a2, unsigned char *a3)
{
  BOOL result = sub_2129D9670(a2, *(const __CFLocale **)(a1 + 48), *(void *)(a1 + 32));
  *a3 = result;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

BOOL sub_2129D9670(CFArrayRef *a1, const __CFLocale *a2, uint64_t a3)
{
  CFIndex v5 = 0;
  uint64_t v40 = *MEMORY[0x263EF8340];
  char v36 = 0;
  CFStringRef key = (const __CFString *)*MEMORY[0x263EFFCF0];
  CFStringRef v33 = (const __CFString *)*MEMORY[0x263EFFCB0];
  CFStringRef v32 = (const __CFString *)*MEMORY[0x263EFFCF8];
  while (v5 < CFArrayGetCount(a1[4]))
  {
    CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(a1[4], v5);
    CFTypeID v7 = CFGetTypeID(ValueAtIndex);
    if (v7 == CFDictionaryGetTypeID())
    {
      CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"ContentType");
      CFStringRef v9 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Locale");
      CFStringRef v10 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"ContentPath");
      if (Value)
      {
        CFStringRef v11 = v10;
        CFTypeID v12 = CFGetTypeID(Value);
        if (v12 == CFStringGetTypeID())
        {
          if (v9)
          {
            CFTypeID v13 = CFGetTypeID(v9);
            if (v13 == CFStringGetTypeID())
            {
              if (v11)
              {
                CFTypeID v14 = CFGetTypeID(v11);
                if (v14 == CFStringGetTypeID())
                {
                  CFLocaleRef v15 = CFLocaleCreate(0, v9);
                  CFLocaleRef v16 = v15;
                  if (v15)
                  {
                    CFStringRef v17 = (const __CFString *)CFLocaleGetValue(v15, key);
                    CFStringRef v18 = (const __CFString *)CFLocaleGetValue(a2, key);
                    if (v17)
                    {
                      if (v18)
                      {
                        if (CFEqual(v17, v18))
                        {
                          CFStringRef v19 = (const __CFString *)CFLocaleGetValue(v16, v33);
                          if (!v19
                            || (CFStringRef v20 = (const __CFString *)CFLocaleGetValue(a2, v33)) != 0
                            && CFEqual(v20, v19))
                          {
                            CFStringRef v21 = (const __CFString *)CFLocaleGetValue(v16, v32);
                            CFStringRef v22 = (const __CFString *)CFLocaleGetValue(a2, v32);
                            if (!((unint64_t)v21 | (unint64_t)v22)) {
                              goto LABEL_30;
                            }
                            BOOL v23 = v21 != 0;
                            if (v22) {
                              BOOL v23 = 0;
                            }
                            BOOL v24 = v21 || v22 == 0;
                            if (v24 && !v23 && CFEqual(v22, v21))
                            {
LABEL_30:
                              CFURLRef v25 = CFURLCreateCopyAppendingPathComponent(0, a1[1], v11, 0);
                              CFURLRef v38 = v25;
                              if (!CFURLGetFileSystemRepresentation(v25, 1u, buffer, 1024)
                                || stat((const char *)buffer, &v37))
                              {
                                if (v25) {
                                  CFRelease(v25);
                                }
                                goto LABEL_14;
                              }
                              uint64_t v26 = 0;
                              int v27 = 0;
                              Boolean v28 = (v37.st_mode & 0xF000) == 0x4000;
                              while (1)
                              {
                                int v29 = buffer[v26];
                                if (v29 != 47) {
                                  break;
                                }
                                if (buffer[++v26] != 47) {
                                  goto LABEL_39;
                                }
LABEL_40:
                                if (v26 == 1024)
                                {
LABEL_41:
                                  CFURLRef v30 = CFURLCreateFromFileSystemRepresentation(0, buffer, v27, v28);
                                  if (v25) {
                                    CFRelease(v25);
                                  }
                                  if (v30)
                                  {
                                    (*(void (**)(uint64_t, CFURLRef, void, const __CFLocale *, const void *, char *))(a3 + 16))(a3, v30, *(unsigned int *)a1, v16, Value, &v36);
                                    CFRelease(v30);
                                  }
                                  goto LABEL_14;
                                }
                              }
                              if (!buffer[v26]) {
                                goto LABEL_41;
                              }
                              ++v26;
LABEL_39:
                              buffer[v27++] = v29;
                              goto LABEL_40;
                            }
                          }
                        }
                      }
                    }
LABEL_14:
                    CFRelease(v16);
                  }
                }
              }
            }
          }
        }
      }
    }
    ++v5;
    if (v36) {
      return 1;
    }
  }
  return v36 != 0;
}

void sub_2129D99FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  if (a2) {
    sub_2129D8450(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_2129D9A60(uint64_t a1, void *a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  if (!sub_2129D7AF4())
  {
    if (qword_2677977D8 != -1)
    {
      dispatch_once(&qword_2677977D8, &unk_26C3C9A38);
    }
    return;
  }
  if (!a3) {
    return;
  }
  CFStringRef v9 = (const __CFString *)MEMORY[0x216689940](a2);
  if (!v9)
  {
    CFTypeRef cf = 0;
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x216689AE0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFStringRef v10 = v9;
  CFRetain(v9);
  CFTypeRef cf = v10;
  CFTypeID v11 = CFGetTypeID(v10);
  if (v11 != CFStringGetTypeID())
  {
    uint64_t v46 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x216689AE0](v46, "Could not construct");
    __cxa_throw(v46, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  sub_2129D8464(__p, "");
  if (SHIBYTE(v56) < 0)
  {
    sub_2129D85F8(buf, __p[0], (unint64_t)__p[1]);
  }
  else
  {
    *(_OWORD *)buf = *(_OWORD *)__p;
    uint64_t v66 = v56;
  }
  CFTypeID TypeID = CFStringGetTypeID();
  if (TypeID == CFGetTypeID(v10))
  {
    CStringPtr = (char *)CFStringGetCStringPtr(v10, 0x8000100u);
    if (CStringPtr)
    {
      sub_2129D8464(&v58, CStringPtr);
      goto LABEL_26;
    }
    CFIndex Length = CFStringGetLength(v10);
    CFIndex maxBufLen = 0;
    v72.location = 0;
    v72.length = Length;
    CFStringGetBytes(v10, v72, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
    CFIndex v15 = maxBufLen;
    if ((unint64_t)maxBufLen >= 0x7FFFFFFFFFFFFFF8) {
      sub_2129D8518();
    }
    if ((unint64_t)maxBufLen >= 0x17)
    {
      CFIndex v17 = (maxBufLen & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((maxBufLen | 7) != 0x17) {
        CFIndex v17 = maxBufLen | 7;
      }
      CFIndex v18 = v17 + 1;
      CFLocaleRef v16 = (long long *)operator new(v17 + 1);
      *((void *)&v58 + 1) = v15;
      int64_t v59 = v18 | 0x8000000000000000;
      *(void *)&long long v58 = v16;
    }
    else
    {
      HIBYTE(v59) = maxBufLen;
      CFLocaleRef v16 = &v58;
      if (!maxBufLen) {
        goto LABEL_22;
      }
    }
    bzero(v16, v15);
LABEL_22:
    *((unsigned char *)v16 + v15) = 0;
    if (v59 >= 0) {
      CFStringRef v19 = (UInt8 *)&v58;
    }
    else {
      CFStringRef v19 = (UInt8 *)v58;
    }
    v73.location = 0;
    v73.length = Length;
    CFStringGetBytes(v10, v73, 0x8000100u, 0, 0, v19, maxBufLen, &maxBufLen);
LABEL_26:
    if (SHIBYTE(v66) < 0) {
      operator delete(*(void **)buf);
    }
    goto LABEL_28;
  }
  long long v58 = *(_OWORD *)buf;
  int64_t v59 = v66;
LABEL_28:
  if (SHIBYTE(v56) < 0) {
    operator delete(__p[0]);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (SHIBYTE(v59) < 0)
  {
    if (*((void *)&v58 + 1) == 4)
    {
      int v20 = *(_DWORD *)v58;
      operator delete((void *)v58);
      if (v20 == 1953460082) {
        return;
      }
    }
    else
    {
      operator delete((void *)v58);
    }
  }
  else if (SHIBYTE(v59) == 4 && v58 == 1953460082)
  {
    return;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  uint64_t v66 = 0x3052000000;
  uint64_t v67 = sub_2129DA57C;
  uint64_t v68 = sub_2129DA58C;
  CFStringRef v21 = (void *)qword_26AA50950;
  uint64_t v69 = qword_26AA50950;
  if (!qword_26AA50950)
  {
    *(void *)&long long v58 = MEMORY[0x263EF8330];
    *((void *)&v58 + 1) = 3221225472;
    int64_t v59 = (int64_t)sub_2129DA598;
    uint64_t v60 = &unk_264197610;
    v61 = buf;
    sub_2129DA598((uint64_t)&v58);
    CFStringRef v21 = *(void **)(*(void *)&buf[8] + 40);
  }
  _Block_object_dispose(buf, 8);
  CFStringRef v22 = (void *)[v21 sharedInstance];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  uint64_t v66 = 0x3052000000;
  uint64_t v67 = sub_2129DA57C;
  uint64_t v68 = sub_2129DA58C;
  BOOL v23 = (void *)qword_26AA50968;
  uint64_t v69 = qword_26AA50968;
  if (!qword_26AA50968)
  {
    *(void *)&long long v58 = MEMORY[0x263EF8330];
    *((void *)&v58 + 1) = 3221225472;
    int64_t v59 = (int64_t)sub_2129DA608;
    uint64_t v60 = &unk_264197610;
    v61 = buf;
    sub_2129DA608((uint64_t)&v58);
    BOOL v23 = *(void **)(*(void *)&buf[8] + 40);
  }
  _Block_object_dispose(buf, 8);
  BOOL v24 = (void *)[v23 attributeFilter];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  CFURLRef v25 = (__CFString *)[a2 languageCode];
  uint64_t v26 = (void *)[a2 countryCode];
  int v27 = (void *)[a2 scriptCode];
  if ([(__CFString *)v25 isEqualToString:@"mul"])
  {
    if (v26)
    {
      if ([v26 length] && v27 && objc_msgSend(v27, "length"))
      {
        *(void *)buf = [NSString stringWithFormat:@"%@_%@-%@", v25, v26, v27];
        uint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:buf count:1];
LABEL_55:
        int v29 = (void *)v28;
        goto LABEL_68;
      }
      if ([v26 length])
      {
        *(void *)buf = [NSString stringWithFormat:@"%@_%@", v25, v26];
        uint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:buf count:1];
        goto LABEL_55;
      }
    }
    if (v27 && [v27 length])
    {
      *(void *)buf = [NSString stringWithFormat:@"%@_%@", v25, v27];
      uint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:buf count:1];
      goto LABEL_55;
    }
  }
  if ([(__CFString *)v25 isEqualToString:@"fil"]) {
    CFURLRef v25 = @"tl";
  }
  int v29 = (void *)[MEMORY[0x263EFF980] arrayWithObject:v25];
  if (!v26) {
    goto LABEL_107;
  }
  if ([v26 length] && v27 && objc_msgSend(v27, "length"))
  {
    [v29 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@_%@-%@", v25, v26, v27)];
    goto LABEL_68;
  }
  if ([v26 length])
  {
    [v29 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@_%@", v25, v26)];
  }
  else
  {
LABEL_107:
    if (v27 && [v27 length]) {
      [v29 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@_%@", v25, v27)];
    }
  }
LABEL_68:
  uint64_t v30 = [v29 countByEnumeratingWithState:&v51 objects:v64 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v52 != v31) {
          objc_enumerationMutation(v29);
        }
        [v24 addAssetLocale:*(void *)(*((void *)&v51 + 1) + 8 * i)];
      }
      uint64_t v30 = [v29 countByEnumeratingWithState:&v51 objects:v64 count:16];
    }
    while (v30);
  }
  if (a3 > 3) {
    CFStringRef v33 = @"Required";
  }
  else {
    CFStringRef v33 = off_264197630[a3 - 1];
  }
  [v24 addAllowedValue:v33 forKey:@"LinguisticAssetType"];
  if (qword_26AA50998 != -1) {
    dispatch_once(&qword_26AA50998, &unk_26C3C9B28);
  }
  uint64_t v34 = qword_26AA509A0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  uint64_t v66 = 0x3052000000;
  uint64_t v67 = sub_2129DA57C;
  uint64_t v68 = sub_2129DA58C;
  uint64_t v35 = (objc_class *)qword_26AA50960;
  uint64_t v69 = qword_26AA50960;
  if (!qword_26AA50960)
  {
    *(void *)&long long v58 = MEMORY[0x263EF8330];
    *((void *)&v58 + 1) = 3221225472;
    int64_t v59 = (int64_t)sub_2129DA678;
    uint64_t v60 = &unk_264197610;
    v61 = buf;
    sub_2129DA678((uint64_t)&v58);
    uint64_t v35 = *(objc_class **)(*(void *)&buf[8] + 40);
  }
  _Block_object_dispose(buf, 8);
  id v36 = (id)[[v35 alloc] initWithAssetType:v34 filter:v24];
  [v36 setCachedOnly:a4];
  *(void *)&long long v58 = 0;
  stat v37 = (void *)[v22 assetsForQuery:v36 error:&v58];
  if ((void)v58)
  {
    if (qword_26AA50938 != -1) {
      dispatch_once(&qword_26AA50938, &unk_26C3C9B08);
    }
    CFURLRef v38 = qword_26AA50930;
    if (os_log_type_enabled((os_log_t)qword_26AA50930, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = [(id)v58 localizedDescription];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v44;
      _os_log_error_impl(&dword_2129D2000, v38, OS_LOG_TYPE_ERROR, "DDS asset query failed: %@", buf, 0xCu);
    }
  }
  else
  {
    char v39 = v37;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v40 = [v37 countByEnumeratingWithState:&v47 objects:v63 count:16];
    if (v40)
    {
      uint64_t v41 = *(void *)v48;
LABEL_90:
      uint64_t v42 = 0;
      while (1)
      {
        if (*(void *)v48 != v41) {
          objc_enumerationMutation(v39);
        }
        uint64_t v43 = *(void **)(*((void *)&v47 + 1) + 8 * v42);
        if ([v43 localURL])
        {
          if (!objc_msgSend((id)objc_msgSend(v43, "attributes"), "objectForKey:", @"AssetRegion"))
          {
            buf[0] = 0;
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint8_t *))(a5 + 16))(a5, [v43 localURL], objc_msgSend(v43, "attributes"), buf);
            if (buf[0]) {
              break;
            }
          }
        }
        if (v40 == ++v42)
        {
          uint64_t v40 = [v39 countByEnumeratingWithState:&v47 objects:v63 count:16];
          if (v40) {
            goto LABEL_90;
          }
          return;
        }
      }
    }
  }
}

void sub_2129DA4B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

const void **sub_2129DA548(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_2129DA57C(uint64_t a1, uint64_t a2)
{
}

void sub_2129DA58C(uint64_t a1)
{
}

Class sub_2129DA598(uint64_t a1)
{
  sub_2129DA6E8();
  Class result = objc_getClass("DDSAssetCenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    qword_26AA50950 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)sub_2129DA608(v3);
  }
  return result;
}

Class sub_2129DA608(uint64_t a1)
{
  sub_2129DA6E8();
  Class result = objc_getClass("DDSLinguisticAttributeFilter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    qword_26AA50968 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)sub_2129DA678(v3);
  }
  return result;
}

void sub_2129DA678(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_getClass("DDSAssetQuery");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    qword_26AA50960 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  else
  {
    abort_report_np();
    sub_2129DA6E8();
  }
}

void sub_2129DA6E8()
{
  if (!sub_2129D7AF4())
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void sub_2129DA738()
{
  if (qword_26AA50938 != -1) {
    dispatch_once(&qword_26AA50938, &unk_26C3C9B08);
  }
  v0 = qword_26AA50930;
  if (os_log_type_enabled((os_log_t)qword_26AA50930, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_error_impl(&dword_2129D2000, v0, OS_LOG_TYPE_ERROR, "Skipping mobile asset discovery: could not soft-link DataDeliveryServices", v1, 2u);
  }
}

uint64_t sub_2129DA7C8()
{
  uint64_t result = _sl_dlopen();
  qword_26AA50958 = result;
  return result;
}

CFStringRef LDCreateMobileAssetType()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (qword_26AA50998 != -1) {
    dispatch_once(&qword_26AA50998, &unk_26C3C9B28);
  }
  CFStringRef v1 = (const __CFString *)qword_26AA509A0;
  return CFStringCreateCopy(v0, v1);
}

void sub_2129DA8B0()
{
}

uint64_t sub_2129DA8C8()
{
  CFAllocatorRef v0 = @"/System/Library/LinguisticData/";
  uint64_t v1 = [NSString stringWithFormat:@"%@/Info.plist", v0];
  uint64_t v2 = (void *)[NSDictionary dictionaryWithContentsOfFile:v1];
  return [v2 objectForKey:@"MobileAssetProperties"];
}

uint64_t sub_2129DA934()
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)sub_2129DA8C8(), "objectForKey:", @"MobileAssetType"), "copy");
  qword_26AA509A0 = result;
  return result;
}

uint64_t sub_2129DA964()
{
  uint64_t result = [(id)sub_2129DA8C8() objectForKey:@"AssetLocaleMap"];
  if (result)
  {
    uint64_t result = [objc_alloc(NSDictionary) initWithDictionary:result copyItems:1];
    qword_26AA50940 = result;
  }
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x270EE4590](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x270EE45B8](allocator, bundleURL);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x270EE45F0](bundle);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x270EE4A80](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x270EE4AB0](locale);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x270EE4AD0](locale, key);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE5390](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53C0](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE5430](url, resolveAgainstBase, buffer, maxBufLen);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x270F98B60](a1, __ec);
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
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

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}