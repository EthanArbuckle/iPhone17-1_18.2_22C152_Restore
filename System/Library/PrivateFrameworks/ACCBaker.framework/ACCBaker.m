void sub_246CC06A4(const __CFURL *a1)
{
  sub_246CC0E04(a1);
}

void sub_246CC0C88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, uint64_t a17, std::__shared_weak_count *a18, uint64_t a19, std::__shared_weak_count *a20,uint64_t a21,std::__shared_weak_count *a22)
{
  if (a16 && !atomic_fetch_add(&a16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a16->__on_zero_shared)(a16);
    std::__shared_weak_count::__release_weak(a16);
  }
  if (a18 && !atomic_fetch_add(&a18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a18->__on_zero_shared)(a18);
    std::__shared_weak_count::__release_weak(a18);
  }
  if (a20 && !atomic_fetch_add(&a20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a20->__on_zero_shared)(a20);
    std::__shared_weak_count::__release_weak(a20);
  }
  if (a22 && !atomic_fetch_add(&a22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a22->__on_zero_shared)(a22);
    std::__shared_weak_count::__release_weak(a22);
  }
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CC0E04(const __CFURL *a1)
{
  CFStringRef v1 = CFURLGetString(a1);
  sub_246CC244C(&v2, v1);
}

void sub_246CC0FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_246CC2068((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_246CC0FF4(const __CFURL *a1)
{
}

void sub_246CC1864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,char a31)
{
  if (a31)
  {
    if (__p)
    {
      a26 = (uint64_t)__p;
      operator delete(__p);
      sub_246CC2068((uint64_t)&a9);
      _Unwind_Resume(a1);
    }
  }
  sub_246CC2068((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_246CC19E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if ((a16 & 0x80000000) == 0) {
    JUMPOUT(0x246CC19F0);
  }
  JUMPOUT(0x246CC196CLL);
}

void sub_246CC1A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25)
{
  sub_246CC2068(v26 - 96);
  if (a24 < 0)
  {
    operator delete(__p);
    if (a16 < 0)
    {
LABEL_5:
      operator delete(a11);
      if (!v25) {
        goto LABEL_10;
      }
LABEL_8:
      if (a25) {
        operator delete(a25);
      }
LABEL_10:
      _Unwind_Resume(a1);
    }
  }
  else if (a16 < 0)
  {
    goto LABEL_5;
  }
  if (!v25) {
    goto LABEL_10;
  }
  goto LABEL_8;
}

void sub_246CC1A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  if (a19) {
    operator delete(a19);
  }
  _Unwind_Resume(a1);
}

void sub_246CC1A74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if ((a16 & 0x80000000) == 0) {
    JUMPOUT(0x246CC1A80);
  }
  JUMPOUT(0x246CC1A48);
}

void sub_246CC1A98(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  if (a3 >= 4)
  {
    HIBYTE(v20[2]) = 15;
    strcpy((char *)v20, "Invalid version");
    __p = operator new(0x60uLL);
    long long v19 = xmmword_246CFEA70;
    strcpy((char *)__p, "/Library/Caches/com.apple.xbs/Sources/ACCBaker/product/AppCode/ACCBaker/src/ACCBakerUtil.mm");
    if (a4)
    {
      uint64_t v21 = 22;
      v22 = std::generic_category();
      sub_246CF9244();
    }
    operator delete(__p);
    if (SHIBYTE(v20[2]) < 0) {
      operator delete(v20[0]);
    }
    *(unsigned char *)a1 = 0;
    *(unsigned char *)(a1 + 24) = 0;
  }
  else
  {
    v7 = [MEMORY[0x263F83ED0] encoderWithVersion:a3];
    id v17 = 0;
    v8 = [v7 encodeURL:a2 error:&v17];
    id v9 = v17;
    if (v8 && (unint64_t)[v8 length] > 1)
    {
      id v11 = v8;
      v12 = (const void *)[v11 bytes];
      size_t v13 = [v11 length];
      size_t v14 = v13;
      memset(v20, 0, sizeof(v20));
      if (v13)
      {
        if ((v13 & 0x8000000000000000) != 0) {
          sub_246CC23A4();
        }
        v15 = (char *)operator new(v13);
        v16 = &v15[v14];
        memcpy(v15, v12, v14);
      }
      else
      {
        v16 = 0;
        v15 = 0;
      }
      *(void *)a1 = v15;
      *(void *)(a1 + 8) = v16;
      *(void *)(a1 + 16) = v16;
      *(unsigned char *)(a1 + 24) = 1;
    }
    else
    {
      strcpy((char *)v20, "URL compression failed");
      HIBYTE(v20[2]) = 22;
      __p = operator new(0x60uLL);
      long long v19 = xmmword_246CFEA70;
      strcpy((char *)__p, "/Library/Caches/com.apple.xbs/Sources/ACCBaker/product/AppCode/ACCBaker/src/ACCBakerUtil.mm");
      if (a4)
      {
        v10 = std::generic_category();
        uint64_t v21 = 22;
        v22 = v10;
        sub_246CF9244();
      }
      operator delete(__p);
      if (SHIBYTE(v20[2]) < 0) {
        operator delete(v20[0]);
      }
      *(unsigned char *)a1 = 0;
      *(unsigned char *)(a1 + 24) = 0;
    }
  }
}

void sub_246CC1DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char a23)
{
  _Unwind_Resume(a1);
}

void *sub_246CC1EA0(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v4 = *(const void **)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  size_t v5 = v3 - *(void *)a2;
  if (v3 != *(void *)a2)
  {
    if ((v5 & 0x8000000000000000) != 0) {
      sub_246CC23A4();
    }
    v6 = (char *)operator new(v3 - *(void *)a2);
    *a1 = v6;
    a1[1] = v6;
    v7 = &v6[v5];
    a1[2] = &v6[v5];
    memcpy(v6, v4, v5);
    a1[1] = v7;
  }
  return a1;
}

void sub_246CC1F14(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CC1F30(int a1, CFTypeRef cf, int a3)
{
  if (a3) {
    sub_246CC244C(&v3, cf);
  }
  CFTypeRef v3 = cf;
  operator new();
}

void sub_246CC203C(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    j__CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_246CC2054(_Unwind_Exception *a1)
{
}

uint64_t sub_246CC2068(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

void sub_246CC20E4(void *a1)
{
}

void sub_246CC20F8(int a1, CFTypeRef cf, int a3)
{
  if (a3) {
    sub_246CC2230(&v3, cf);
  }
  CFTypeRef v3 = cf;
  operator new();
}

void sub_246CC2204(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    j__CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_246CC221C(_Unwind_Exception *a1)
{
}

void sub_246CC2230(void *a1, CFTypeRef cf)
{
  if (cf) {
    j__CFRetain(cf);
  }
  *a1 = cf;
  operator new();
}

void sub_246CC22A4(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    j__CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_246CC22BC(_Unwind_Exception *a1)
{
}

void sub_246CC22D4(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24C5471E0);
}

void sub_246CC230C(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 24);
  if (v1) {
    j__CFRelease(v1);
  }
}

uint64_t sub_246CC2330(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN4cv3d3kit2cf3PtrIPK9__CFArrayEC1ES5_EUlS5_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN4cv3d3kit2cf3PtrIPK9__CFArrayEC1ES5_EUlS5_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN4cv3d3kit2cf3PtrIPK9__CFArrayEC1ES5_EUlS5_E_")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN4cv3d3kit2cf3PtrIPK9__CFArrayEC1ES5_EUlS5_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void sub_246CC23A4()
{
}

void sub_246CC23BC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_246CC2418(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_265201930, MEMORY[0x263F8C060]);
}

void sub_246CC2404(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_246CC2418(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_246CC244C(void *a1, CFTypeRef cf)
{
  if (cf) {
    j__CFRetain(cf);
  }
  *a1 = cf;
  operator new();
}

void sub_246CC24C0(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    j__CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_246CC24D8(_Unwind_Exception *a1)
{
}

void sub_246CC24F0(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24C5471E0);
}

void sub_246CC2528(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 24);
  if (v1) {
    j__CFRelease(v1);
  }
}

uint64_t sub_246CC254C(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN4cv3d3kit2cf3PtrIPK10__CFStringEC1ES5_EUlS5_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN4cv3d3kit2cf3PtrIPK10__CFStringEC1ES5_EUlS5_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN4cv3d3kit2cf3PtrIPK10__CFStringEC1ES5_EUlS5_E_")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN4cv3d3kit2cf3PtrIPK10__CFStringEC1ES5_EUlS5_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

uint64_t sub_246CC25C4(uint64_t a1, int a2, int a3, int a4)
{
  *(_OWORD *)(a1 + 8) = 0u;
  v7 = (int **)(a1 + 8);
  *(_DWORD *)a1 = a3;
  *(_DWORD *)(a1 + 4) = a4;
  *(_OWORD *)(a1 + 24) = 0u;
  v8 = (uint64_t *)(a1 + 32);
  unint64_t v9 = a3;
  *(_OWORD *)(a1 + 40) = 0u;
  int v23 = 0;
  if (a3)
  {
    sub_246CC272C(a1 + 8, a3, (const float *)&v23);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    int v22 = 0;
    unint64_t v12 = (v11 - v10) >> 2;
    BOOL v13 = v9 >= v12;
    if (v9 > v12)
    {
      sub_246CC272C((uint64_t)v8, v9 - v12, (const float *)&v22);
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v10 = 0;
    int v22 = 0;
    BOOL v13 = 1;
  }
  if (!v13) {
    *(void *)(a1 + 40) = v10 + 4 * v9;
  }
LABEL_7:
  uint64_t v14 = (a3 - 1);
  if (a3 >= 1)
  {
    v15 = *v7;
    uint64_t v16 = a3;
    int v17 = 1;
    do
    {
      *v15++ = v17;
      v17 *= 2;
      if (v17 >= a3) {
        int v17 = (v17 ^ a2) & v14;
      }
      --v16;
    }
    while (v16);
    if (a3 >= 2)
    {
      uint64_t v18 = 0;
      long long v19 = *v7;
      uint64_t v20 = *v8;
      do
      {
        *(_DWORD *)(v20 + 4 * v19[v18]) = v18;
        ++v18;
      }
      while (v14 != v18);
    }
  }
  return a1;
}

void sub_246CC26EC(_Unwind_Exception *exception_object)
{
  size_t v5 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 40) = v5;
    operator delete(v5);
    v6 = *v2;
    if (!*v2) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else
  {
    v6 = *v2;
    if (!*v2) {
      goto LABEL_3;
    }
  }
  *(void *)(v1 + 16) = v6;
  operator delete(v6);
  _Unwind_Resume(exception_object);
}

void sub_246CC272C(uint64_t a1, unint64_t a2, const float *a3)
{
  unint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  v8 = (_DWORD *)v7;
  if (a2 <= (uint64_t)(v6 - v7) >> 2)
  {
    if (a2)
    {
      unint64_t v16 = (a2 - 1) & 0x3FFFFFFFFFFFFFFFLL;
      if (v16 < 0xF || v7 < (unint64_t)(a3 + 1) && v7 + 4 * a2 > (unint64_t)a3) {
        goto LABEL_45;
      }
      unint64_t v17 = v16 + 1;
      v8 = (_DWORD *)(v7 + 4 * (v17 & 0x7FFFFFFFFFFFFFF8));
      float32x4_t v18 = vld1q_dup_f32(a3);
      long long v19 = (float32x4_t *)(v7 + 16);
      uint64_t v20 = v17 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v19[-1] = v18;
        *long long v19 = v18;
        v19 += 2;
        v20 -= 8;
      }
      while (v20);
      if (v17 != (v17 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_45:
        do
          *v8++ = *(_DWORD *)a3;
        while (v8 != (_DWORD *)(v7 + 4 * a2));
      }
      v8 = (_DWORD *)(v7 + 4 * a2);
    }
    *(void *)(a1 + 8) = v8;
  }
  else
  {
    unint64_t v9 = *(_DWORD **)a1;
    uint64_t v10 = v7 - *(void *)a1;
    uint64_t v11 = v10 >> 2;
    unint64_t v12 = (v10 >> 2) + a2;
    if (v12 >> 62) {
      sub_246CC23A4();
    }
    uint64_t v13 = v6 - (void)v9;
    if (v13 >> 1 > v12) {
      unint64_t v12 = v13 >> 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v12;
    }
    if (v14)
    {
      if (v14 >> 62) {
        sub_246CC29A0();
      }
      v15 = (char *)operator new(4 * v14);
    }
    else
    {
      v15 = 0;
    }
    unint64_t v21 = (unint64_t)&v15[4 * v11];
    int v22 = (char *)(v21 + 4 * a2);
    unint64_t v23 = (a2 - 1) & 0x3FFFFFFFFFFFFFFFLL;
    v24 = (char *)v21;
    if (v23 < 0x13) {
      goto LABEL_46;
    }
    if (v21 < (unint64_t)(a3 + 1))
    {
      v24 = &v15[4 * v11];
      if (&v15[4 * a2 + v10] > (char *)a3) {
        goto LABEL_46;
      }
    }
    unint64_t v25 = v23 + 1;
    v24 = (char *)(v21 + 4 * (v25 & 0x7FFFFFFFFFFFFFF8));
    float32x4_t v26 = vld1q_dup_f32(a3);
    v27 = (float32x4_t *)&v15[4 * v11 + 16];
    uint64_t v28 = v25 & 0x7FFFFFFFFFFFFFF8;
    do
    {
      v27[-1] = v26;
      float32x4_t *v27 = v26;
      v27 += 2;
      v28 -= 8;
    }
    while (v28);
    if (v25 != (v25 & 0x7FFFFFFFFFFFFFF8))
    {
LABEL_46:
      do
      {
        *(float *)v24 = *a3;
        v24 += 4;
      }
      while (v24 != v22);
    }
    if ((_DWORD *)v7 != v9)
    {
      unint64_t v29 = v7 - (void)v9 - 4;
      if (v29 < 0x2C) {
        goto LABEL_47;
      }
      if (v7 - (unint64_t)&v15[v10] < 0x20) {
        goto LABEL_47;
      }
      uint64_t v30 = (v29 >> 2) + 1;
      uint64_t v31 = 4 * (v30 & 0x7FFFFFFFFFFFFFF8);
      v8 = (_DWORD *)(v7 - v31);
      v21 -= v31;
      v32 = &v15[4 * v11 - 16];
      v33 = (long long *)(v7 - 16);
      uint64_t v34 = v30 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v35 = *v33;
        *((_OWORD *)v32 - 1) = *(v33 - 1);
        *(_OWORD *)v32 = v35;
        v32 -= 32;
        v33 -= 2;
        v34 -= 8;
      }
      while (v34);
      if (v30 != (v30 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_47:
        do
        {
          int v36 = *--v8;
          *(_DWORD *)(v21 - 4) = v36;
          v21 -= 4;
        }
        while (v8 != v9);
      }
    }
    *(void *)a1 = v21;
    *(void *)(a1 + 8) = v22;
    *(void *)(a1 + 16) = &v15[4 * v14];
    if (v9)
    {
      operator delete(v9);
    }
  }
}

void sub_246CC29A0()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void sub_246CC29D4(char **a1)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = a1[2];
  uint64_t v1 = (void **)(a1 + 1);
  if (v2 != v3)
  {
    size_t v5 = a1[2];
    uint64_t v6 = a1[1];
    while (!*(_DWORD *)v6)
    {
      v6 += 4;
      if (v6 == v3)
      {
        uint64_t v6 = a1[2];
        break;
      }
    }
    if (v6 != v2)
    {
      if (v6 != v3)
      {
        memmove(a1[1], v6, v3 - v6);
        unint64_t v7 = (a1[2] - v6) >> 2;
        sub_246CC2EDC(v1, v7);
        return;
      }
      int v20 = 0;
      if (a1[3] != v2)
      {
        v8 = v3;
        unint64_t v9 = v2;
LABEL_22:
        unint64_t v19 = v8 - v9;
        if (v19)
        {
          if (v19 >= 5) {
            a1[2] = v9 + 4;
          }
        }
        else
        {
          sub_246CC272C((uint64_t)v1, 1uLL, (const float *)&v20);
        }
        return;
      }
      uint64_t v10 = v3 - v2;
      uint64_t v11 = (char *)operator new(0x80uLL);
      v8 = &v11[(v3 - v2) & 0xFFFFFFFFFFFFFFFCLL];
      if ((unint64_t)(v3 - v2 - 4) >= 0x2C)
      {
        unint64_t v9 = &v11[v10 & 0xFFFFFFFFFFFFFFFCLL];
        if ((unint64_t)(v3 - v9) >= 0x20)
        {
          unint64_t v12 = ((unint64_t)(v10 - 4) >> 2) + 1;
          uint64_t v13 = 4 * (v12 & 0x7FFFFFFFFFFFFFF8);
          size_t v5 = &v3[-v13];
          unint64_t v9 = &v8[-v13];
          unint64_t v14 = &v11[4 * (v10 >> 2) - 16];
          v15 = v3 - 16;
          uint64_t v16 = v12 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            long long v17 = *(_OWORD *)v15;
            *((_OWORD *)v14 - 1) = *((_OWORD *)v15 - 1);
            *(_OWORD *)unint64_t v14 = v17;
            v14 -= 32;
            v15 -= 32;
            v16 -= 8;
          }
          while (v16);
          if (v12 == (v12 & 0x7FFFFFFFFFFFFFF8))
          {
LABEL_20:
            a1[1] = v9;
            a1[2] = v8;
            a1[3] = v11 + 128;
            if (v2)
            {
              operator delete(v2);
              unint64_t v9 = a1[1];
              v8 = a1[2];
            }
            goto LABEL_22;
          }
        }
      }
      else
      {
        unint64_t v9 = &v11[v10 & 0xFFFFFFFFFFFFFFFCLL];
      }
      do
      {
        int v18 = *((_DWORD *)v5 - 1);
        v5 -= 4;
        *((_DWORD *)v9 - 1) = v18;
        v9 -= 4;
      }
      while (v5 != v2);
      goto LABEL_20;
    }
  }
}

char **sub_246CC2BA8(char **a1, uint64_t a2)
{
  unint64_t v3 = a1[1];
  if (*(_DWORD *)v3 && (size_t v5 = *(_DWORD **)(a2 + 8), *v5))
  {
    sub_246CC2EDC((void **)a1 + 4, ((a1[2] - v3) >> 2) + ((uint64_t)(*(void *)(a2 + 16) - (void)v5) >> 2) - 1);
    uint64_t v6 = a1[4];
    unint64_t v7 = a1[5];
    if (v7 - v6 >= 1) {
      bzero(a1[4], 4 * (((unint64_t)(v7 - v6) >> 2) - ((unint64_t)(v7 - v6) > 3)) + 4);
    }
    unint64_t v9 = a1[1];
    v8 = a1[2];
    if (v8 != v9)
    {
      uint64_t v10 = *(char **)(a2 + 8);
      uint64_t v11 = *(char **)(a2 + 16);
      uint64_t v12 = v11 - v10;
      if (v11 != v10)
      {
        uint64_t v13 = 0;
        uint64_t v14 = v12 >> 2;
        if ((unint64_t)(v12 >> 2) <= 1) {
          uint64_t v14 = 1;
        }
        if ((unint64_t)((v8 - v9) >> 2) <= 1) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = (v8 - v9) >> 2;
        }
        uint64_t v16 = v6;
        do
        {
          long long v17 = v16;
          int v18 = (int *)v10;
          uint64_t v19 = v14;
          do
          {
            while (1)
            {
              uint64_t v20 = *(int *)&v9[4 * v13];
              int v22 = *v18++;
              int v21 = v22;
              if (!v20 || v21 == 0) {
                break;
              }
              *(_DWORD *)v17 ^= *(_DWORD *)(*((void *)*a1 + 1)
                                          + 4
                                          * ((*(_DWORD *)(*((void *)*a1 + 4) + 4 * v21)
                                            + *(_DWORD *)(*((void *)*a1 + 4) + 4 * v20))
                                           % (*(_DWORD *)*a1 - 1)));
              v17 += 4;
              if (!--v19) {
                goto LABEL_13;
              }
            }
            *(_DWORD *)long long v17 = *(_DWORD *)v17;
            v17 += 4;
            --v19;
          }
          while (v19);
LABEL_13:
          ++v13;
          v16 += 4;
        }
        while (v13 != v15);
      }
    }
    a1[1] = v6;
    a1[2] = v7;
    float32x4_t v26 = a1[3];
    a1[3] = a1[6];
    a1[4] = v9;
    a1[5] = v8;
    a1[6] = v26;
    sub_246CC29D4(a1);
    return a1;
  }
  else
  {
    v24 = *a1;
    return (char **)sub_246CC2D58((uint64_t)v24, a1);
  }
}

void *sub_246CC2D58(uint64_t a1, void *a2)
{
  *a2 = a1;
  unint64_t v3 = (char **)(a2 + 1);
  v4 = (char *)a2[1];
  size_t v5 = (char *)a2[3];
  if (v5 != v4) {
    goto LABEL_12;
  }
  uint64_t v6 = (unsigned char *)a2[2];
  unint64_t v7 = (char *)operator new(0x80uLL);
  uint64_t v8 = v6 - v5;
  unint64_t v9 = &v7[(v6 - v5) & 0xFFFFFFFFFFFFFFFCLL];
  v4 = v9;
  if (v6 != v5)
  {
    if ((unint64_t)(v8 - 4) < 0x2C)
    {
      v4 = &v7[(v6 - v5) & 0xFFFFFFFFFFFFFFFCLL];
      do
      {
LABEL_9:
        int v18 = *((_DWORD *)v6 - 1);
        v6 -= 4;
        *((_DWORD *)v4 - 1) = v18;
        v4 -= 4;
      }
      while (v6 != v5);
      goto LABEL_10;
    }
    v4 = &v7[(v6 - v5) & 0xFFFFFFFFFFFFFFFCLL];
    if (v6 - v7 - (v8 & 0xFFFFFFFFFFFFFFFCLL) < 0x20) {
      goto LABEL_9;
    }
    uint64_t v10 = v8 >> 2;
    unint64_t v11 = ((unint64_t)(v8 - 4) >> 2) + 1;
    uint64_t v12 = 4 * (v11 & 0x7FFFFFFFFFFFFFF8);
    uint64_t v13 = &v6[-v12];
    v4 = &v9[-v12];
    uint64_t v14 = &v7[4 * v10 - 16];
    uint64_t v15 = (long long *)(v6 - 16);
    uint64_t v16 = v11 & 0x7FFFFFFFFFFFFFF8;
    do
    {
      long long v17 = *v15;
      *((_OWORD *)v14 - 1) = *(v15 - 1);
      *(_OWORD *)uint64_t v14 = v17;
      v14 -= 32;
      v15 -= 2;
      v16 -= 8;
    }
    while (v16);
    uint64_t v6 = v13;
    if (v11 != (v11 & 0x7FFFFFFFFFFFFFF8)) {
      goto LABEL_9;
    }
  }
LABEL_10:
  a2[1] = v4;
  a2[2] = v9;
  a2[3] = v7 + 128;
  if (v5)
  {
    operator delete(v5);
    v4 = *v3;
  }
LABEL_12:
  uint64_t v19 = (char *)a2[2];
  uint64_t v20 = v19 - v4;
  if (v19 == v4)
  {
    sub_246CC3A00((uint64_t)v3, 1 - (v20 >> 2));
    v4 = (char *)a2[1];
    uint64_t v21 = a2[2] - (void)v4;
    if (v21 < 1) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if ((unint64_t)v20 >= 5)
  {
    uint64_t v19 = v4 + 4;
    a2[2] = v4 + 4;
  }
  uint64_t v21 = v19 - v4;
  if (v21 >= 1) {
LABEL_16:
  }
    bzero(v4, 4 * (((unint64_t)v21 >> 2) - ((unint64_t)v21 > 3)) + 4);
LABEL_17:
  *(_DWORD *)v4 = 0;
  return a2;
}

void sub_246CC2EDC(void **a1, unint64_t a2)
{
  v4 = *a1;
  if (a2 <= ((unsigned char *)a1[2] - (unsigned char *)*a1) >> 2)
  {
    unint64_t v11 = (char *)*a1;
    goto LABEL_16;
  }
  unint64_t v5 = 32;
  if (a2 > 0x20) {
    unint64_t v5 = a2;
  }
  if (v5 >> 62) {
    sub_246CC23A4();
  }
  uint64_t v6 = a1[1];
  uint64_t v7 = 4 * v5;
  uint64_t v8 = (char *)operator new(4 * v5);
  uint64_t v9 = v6 - v4;
  uint64_t v10 = &v8[(v6 - v4) & 0xFFFFFFFFFFFFFFFCLL];
  unint64_t v11 = v10;
  if (v6 != v4)
  {
    if ((unint64_t)(v9 - 4) < 0x2C)
    {
      unint64_t v11 = &v8[(v6 - v4) & 0xFFFFFFFFFFFFFFFCLL];
      do
      {
LABEL_13:
        int v20 = *((_DWORD *)v6 - 1);
        v6 -= 4;
        *((_DWORD *)v11 - 1) = v20;
        v11 -= 4;
      }
      while (v6 != v4);
      goto LABEL_14;
    }
    unint64_t v11 = &v8[(v6 - v4) & 0xFFFFFFFFFFFFFFFCLL];
    if ((unint64_t)(v6 - &v8[v9 & 0xFFFFFFFFFFFFFFFCLL]) < 0x20) {
      goto LABEL_13;
    }
    uint64_t v12 = v9 >> 2;
    unint64_t v13 = ((unint64_t)(v9 - 4) >> 2) + 1;
    uint64_t v14 = 4 * (v13 & 0x7FFFFFFFFFFFFFF8);
    uint64_t v15 = &v6[-v14];
    unint64_t v11 = &v10[-v14];
    uint64_t v16 = &v8[4 * v12 - 16];
    long long v17 = (long long *)(v6 - 16);
    uint64_t v18 = v13 & 0x7FFFFFFFFFFFFFF8;
    do
    {
      long long v19 = *v17;
      *((_OWORD *)v16 - 1) = *(v17 - 1);
      *(_OWORD *)uint64_t v16 = v19;
      v16 -= 32;
      v17 -= 2;
      v18 -= 8;
    }
    while (v18);
    uint64_t v6 = v15;
    if (v13 != (v13 & 0x7FFFFFFFFFFFFFF8)) {
      goto LABEL_13;
    }
  }
LABEL_14:
  *a1 = v11;
  a1[1] = v10;
  a1[2] = &v8[v7];
  if (v4)
  {
    operator delete(v4);
    unint64_t v11 = (char *)*a1;
  }
LABEL_16:
  unint64_t v21 = ((unsigned char *)a1[1] - v11) >> 2;
  if (a2 <= v21)
  {
    if (a2 < v21) {
      a1[1] = &v11[4 * a2];
    }
  }
  else
  {
    sub_246CC3A00((uint64_t)a1, a2 - v21);
  }
}

char **sub_246CC305C(char **a1, int a2, int a3)
{
  if (a3)
  {
    unint64_t v5 = a1[1];
    uint64_t v6 = a1[2];
    v4 = (void **)(a1 + 1);
    uint64_t v8 = v6 - v5;
    BOOL v7 = v8 == 0;
    unint64_t v9 = v8 >> 2;
    if (!v7)
    {
      if (v9 <= 1) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = v9;
      }
      do
      {
        uint64_t v11 = *(int *)v5;
        if (v11) {
          LODWORD(v11) = *(_DWORD *)(*((void *)*a1 + 1)
        }
                                   + 4
                                   * ((*(_DWORD *)(*((void *)*a1 + 4) + 4 * a3)
                                     + *(_DWORD *)(*((void *)*a1 + 4) + 4 * v11))
                                    % (*(_DWORD *)*a1 - 1)));
        *(_DWORD *)unint64_t v5 = v11;
        v5 += 4;
        --v10;
      }
      while (v10);
    }
    sub_246CC3124(v4, v9 + a2, 0);
    sub_246CC29D4(a1);
    return a1;
  }
  else
  {
    unint64_t v13 = *a1;
    return (char **)sub_246CC2D58((uint64_t)v13, a1);
  }
}

void sub_246CC3124(void **a1, unint64_t a2, int a3)
{
  int v23 = a3;
  unint64_t v5 = *a1;
  if (a2 <= ((unsigned char *)a1[2] - (unsigned char *)*a1) >> 2)
  {
    uint64_t v12 = (char *)*a1;
    goto LABEL_16;
  }
  unint64_t v6 = 32;
  if (a2 > 0x20) {
    unint64_t v6 = a2;
  }
  if (v6 >> 62) {
    sub_246CC23A4();
  }
  BOOL v7 = a1[1];
  uint64_t v8 = 4 * v6;
  unint64_t v9 = (char *)operator new(4 * v6);
  uint64_t v10 = v7 - v5;
  uint64_t v11 = &v9[(v7 - v5) & 0xFFFFFFFFFFFFFFFCLL];
  uint64_t v12 = v11;
  if (v7 != v5)
  {
    if ((unint64_t)(v10 - 4) < 0x2C)
    {
      uint64_t v12 = &v9[(v7 - v5) & 0xFFFFFFFFFFFFFFFCLL];
      do
      {
LABEL_13:
        int v21 = *((_DWORD *)v7 - 1);
        v7 -= 4;
        *((_DWORD *)v12 - 1) = v21;
        v12 -= 4;
      }
      while (v7 != v5);
      goto LABEL_14;
    }
    uint64_t v12 = &v9[(v7 - v5) & 0xFFFFFFFFFFFFFFFCLL];
    if ((unint64_t)(v7 - &v9[v10 & 0xFFFFFFFFFFFFFFFCLL]) < 0x20) {
      goto LABEL_13;
    }
    uint64_t v13 = v10 >> 2;
    unint64_t v14 = ((unint64_t)(v10 - 4) >> 2) + 1;
    uint64_t v15 = 4 * (v14 & 0x7FFFFFFFFFFFFFF8);
    uint64_t v16 = &v7[-v15];
    uint64_t v12 = &v11[-v15];
    long long v17 = &v9[4 * v13 - 16];
    uint64_t v18 = (long long *)(v7 - 16);
    uint64_t v19 = v14 & 0x7FFFFFFFFFFFFFF8;
    do
    {
      long long v20 = *v18;
      *((_OWORD *)v17 - 1) = *(v18 - 1);
      *(_OWORD *)long long v17 = v20;
      v17 -= 32;
      v18 -= 2;
      v19 -= 8;
    }
    while (v19);
    BOOL v7 = v16;
    if (v14 != (v14 & 0x7FFFFFFFFFFFFFF8)) {
      goto LABEL_13;
    }
  }
LABEL_14:
  *a1 = v12;
  a1[1] = v11;
  a1[2] = &v9[v8];
  if (v5)
  {
    operator delete(v5);
    uint64_t v12 = (char *)*a1;
  }
LABEL_16:
  unint64_t v22 = ((unsigned char *)a1[1] - v12) >> 2;
  if (a2 <= v22)
  {
    if (a2 < v22) {
      a1[1] = &v12[4 * a2];
    }
  }
  else
  {
    sub_246CC272C((uint64_t)a1, a2 - v22, (const float *)&v23);
  }
}

uint64_t *sub_246CC32AC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (!**(_DWORD **)(a2 + 8))
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    sub_246CC382C(exception, "Divide by 0");
    goto LABEL_67;
  }
  sub_246CC2D58(*a1, (void *)a3);
  uint64_t v6 = *(void *)(a2 + 8);
  unint64_t v7 = *(void *)(a2 + 16) - v6;
  uint64_t v8 = *(int *)(v6 + 4 * (((uint64_t)(-1073741824 * v7) >> 32) + (v7 >> 2)));
  if (!v8)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    sub_246CC382C(exception, "a == 0");
LABEL_67:
    __cxa_throw(exception, (struct type_info *)off_265201940, MEMORY[0x263F8C080]);
  }
  unint64_t v9 = (int8x16_t *)a1[1];
  uint64_t v10 = *(int *)(*(void *)(*a1 + 8) + 4 * (*(_DWORD *)*a1 + ~*(_DWORD *)(*(void *)(*a1 + 32) + 4 * v8)));
  uint64_t v72 = 0;
  long long v70 = 0u;
  *(_OWORD *)__p = 0u;
  *(_OWORD *)v69 = 0u;
  unint64_t v11 = a1[2] - (void)v9;
  unint64_t v12 = v11 >> 2;
  unint64_t v13 = v7 >> 2;
  if ((int)(v11 >> 2) < (int)v13) {
    goto LABEL_62;
  }
  while (v9->i32[0])
  {
    __int32 v19 = 0;
    if (v10)
    {
      __int32 v20 = v9->i32[((uint64_t)(-1073741824 * v11) >> 32) + (v11 >> 2)];
      if (v20) {
        __int32 v19 = *(_DWORD *)(*(void *)(*a1 + 8)
      }
                        + 4
                        * ((*(_DWORD *)(*(void *)(*a1 + 32) + 4 * v10) + *(_DWORD *)(*(void *)(*a1 + 32) + 4 * v20))
                         % (*(_DWORD *)*a1 - 1)));
    }
    int v21 = v12 - v13;
    v69[0] = (void *)*a1;
    if (v19) {
      int v22 = v21 + 1;
    }
    else {
      int v22 = 1;
    }
    sub_246CC2EDC(&v69[1], v22);
    int v23 = (int8x16_t *)v69[1];
    uint64_t v24 = v70;
    uint64_t v25 = v70 - (unint64_t)v69[1];
    if ((uint64_t)(v70 - (unint64_t)v69[1]) >= 1) {
      bzero(v69[1], 4 * (((unint64_t)v25 >> 2) - ((unint64_t)v25 > 3)) + 4);
    }
    v23->i32[0] = v19;
    float32x4_t v26 = *(int8x16_t **)(a3 + 8);
    if (!v26->i32[0])
    {
      uint64_t v34 = *(void **)a3;
      uint64_t v35 = *((void *)&v70 + 1);
      *(void **)a3 = v69[0];
      *(void *)(a3 + 8) = v23;
      v69[0] = v34;
      v69[1] = v26;
      long long v36 = *(_OWORD *)(a3 + 16);
      *(void *)(a3 + 16) = v24;
      *(void *)(a3 + 24) = v35;
      long long v70 = v36;
      goto LABEL_33;
    }
    if (!v19) {
      goto LABEL_33;
    }
    uint64_t v27 = *(void *)(a3 + 16);
    if (v25 <= (unint64_t)(v27 - (void)v26))
    {
      uint64_t v29 = v25;
      uint64_t v25 = v27 - (void)v26;
      uint64_t v30 = v23;
      int v23 = *(int8x16_t **)(a3 + 8);
      uint64_t v31 = v25 >> 2;
      uint64_t v32 = v29 >> 2;
      unint64_t v33 = (v25 >> 2) - (v29 >> 2);
      if (v33 < v25 >> 2)
      {
LABEL_23:
        if ((unint64_t)v29 < 0x20 || &v23->i8[v25 - v29] < &v30->i8[v29] && v30 < (int8x16_t *)&v23->i8[v25]) {
          goto LABEL_29;
        }
        v33 += v32 & 0xFFFFFFFFFFFFFFF8;
        v37 = v30 + 1;
        v38 = (int8x16_t *)((char *)v23 + 4 * v31 + -4 * v32 + 16);
        unint64_t v39 = v32 & 0xFFFFFFFFFFFFFFF8;
        do
        {
          int8x16_t v40 = veorq_s8(*v38, *v37);
          v38[-1] = veorq_s8(v38[-1], v37[-1]);
          int8x16_t *v38 = v40;
          v37 += 2;
          v38 += 2;
          v39 -= 8;
        }
        while (v39);
        if (v32 != (v32 & 0xFFFFFFFFFFFFFFF8))
        {
LABEL_29:
          unint64_t v41 = v33 - v31;
          v42 = &v23->i32[v33];
          v43 = &v30->i8[4 * v32];
          do
          {
            *v42++ ^= *(_DWORD *)&v43[4 * v41];
            BOOL v44 = __CFADD__(v41++, 1);
          }
          while (!v44);
        }
      }
    }
    else
    {
      uint64_t v28 = *((void *)&v70 + 1);
      v69[1] = *(void **)(a3 + 8);
      *(void *)&long long v70 = v27;
      *((void *)&v70 + 1) = *(void *)(a3 + 24);
      *(void *)(a3 + 8) = v23;
      *(void *)(a3 + 16) = v24;
      *(void *)(a3 + 24) = v28;
      uint64_t v29 = v27 - (void)v26;
      uint64_t v30 = v26;
      uint64_t v31 = v25 >> 2;
      uint64_t v32 = v29 >> 2;
      unint64_t v33 = (v25 >> 2) - (v29 >> 2);
      if (v33 < v25 >> 2) {
        goto LABEL_23;
      }
    }
    sub_246CC29D4((char **)a3);
LABEL_33:
    sub_246CC3860(v69, a2);
    if (v19)
    {
      v45 = (int *)v69[1];
      unint64_t v46 = (uint64_t)(v70 - (unint64_t)v69[1]) >> 2;
      if ((void *)v70 != v69[1])
      {
        if (v46 <= 1) {
          uint64_t v47 = 1;
        }
        else {
          uint64_t v47 = (uint64_t)(v70 - (unint64_t)v69[1]) >> 2;
        }
        v48 = v69[0];
        do
        {
          uint64_t v49 = *v45;
          if (v49) {
            LODWORD(v49) = *(_DWORD *)(v48[1]
          }
                                     + 4
                                     * ((*(_DWORD *)(v48[4] + 4 * v19) + *(_DWORD *)(v48[4] + 4 * v49))
                                      % (*(_DWORD *)v48 - 1)));
          *v45++ = v49;
          --v47;
        }
        while (v47);
      }
      sub_246CC3124(&v69[1], v46 + v21, 0);
      sub_246CC29D4((char **)v69);
    }
    else
    {
      sub_246CC2D58((uint64_t)v69[0], v69);
    }
    unint64_t v9 = (int8x16_t *)a1[1];
    if (v9->i32[0])
    {
      v50 = (char *)v69[1];
      uint64_t v18 = a1[2];
      if (*(_DWORD *)v69[1])
      {
        uint64_t v51 = v70;
        uint64_t v52 = v70 - (unint64_t)v69[1];
        uint64_t v53 = v18 - (void)v9;
        if ((unint64_t)v70 - (unint64_t)v69[1] <= v18 - (uint64_t)v9)
        {
          uint64_t v55 = v70 - (unint64_t)v69[1];
          uint64_t v52 = v18 - (void)v9;
          v56 = (int8x16_t *)v69[1];
          v50 = (char *)a1[1];
          unint64_t v57 = v53 >> 2;
          uint64_t v58 = (uint64_t)(v70 - (unint64_t)v69[1]) >> 2;
          unint64_t v59 = v57 - v58;
          if (v57 - v58 >= v57)
          {
LABEL_59:
            sub_246CC29D4((char **)a1);
            unint64_t v9 = (int8x16_t *)a1[1];
            uint64_t v18 = a1[2];
            goto LABEL_6;
          }
        }
        else
        {
          uint64_t v54 = *((void *)&v70 + 1);
          v69[1] = (void *)a1[1];
          *(void *)&long long v70 = v18;
          *((void *)&v70 + 1) = a1[3];
          a1[1] = (uint64_t)v50;
          a1[2] = v51;
          a1[3] = v54;
          uint64_t v55 = v18 - (void)v9;
          v56 = v9;
          unint64_t v57 = v52 >> 2;
          uint64_t v58 = v55 >> 2;
          unint64_t v59 = (v52 >> 2) - (v55 >> 2);
          if (v59 >= v52 >> 2) {
            goto LABEL_59;
          }
        }
        if ((unint64_t)v55 < 0x20 || &v50[v52 - v55] < &v56->i8[v55] && v56 < (int8x16_t *)&v50[v52]) {
          goto LABEL_56;
        }
        v59 += v58 & 0xFFFFFFFFFFFFFFF8;
        v60 = v56 + 1;
        v61 = (int8x16_t *)&v50[4 * v57 + 16 + -4 * v58];
        unint64_t v62 = v58 & 0xFFFFFFFFFFFFFFF8;
        do
        {
          int8x16_t v63 = veorq_s8(*v61, *v60);
          v61[-1] = veorq_s8(v61[-1], v60[-1]);
          int8x16_t *v61 = v63;
          v60 += 2;
          v61 += 2;
          v62 -= 8;
        }
        while (v62);
        if (v58 != (v58 & 0xFFFFFFFFFFFFFFF8))
        {
LABEL_56:
          unint64_t v64 = v59 - v57;
          v65 = &v50[4 * v59];
          v66 = &v56->i8[4 * v58];
          do
          {
            *(_DWORD *)v65 ^= *(_DWORD *)&v66[4 * v64];
            v65 += 4;
            BOOL v44 = __CFADD__(v64++, 1);
          }
          while (!v44);
        }
        goto LABEL_59;
      }
    }
    else
    {
      unint64_t v14 = (void *)*a1;
      uint64_t v15 = (int8x16_t *)v69[1];
      *a1 = (uint64_t)v69[0];
      a1[1] = (uint64_t)v15;
      uint64_t v16 = v70;
      v69[0] = v14;
      v69[1] = v9;
      long long v17 = *((_OWORD *)a1 + 1);
      *((_OWORD *)a1 + 1) = v70;
      uint64_t v18 = v16;
      unint64_t v9 = v15;
      long long v70 = v17;
    }
LABEL_6:
    unint64_t v11 = v18 - (void)v9;
    unint64_t v12 = (unint64_t)(v18 - (void)v9) >> 2;
    unint64_t v13 = (*(void *)(a2 + 16) - *(void *)(a2 + 8)) >> 2;
    if ((int)v12 < (int)v13) {
      break;
    }
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
LABEL_62:
  if (v69[1])
  {
    *(void **)&long long v70 = v69[1];
    operator delete(v69[1]);
  }
  return a1;
}

void sub_246CC37F0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_246CC3804(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_246CC3818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

std::logic_error *sub_246CC382C(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C3A0] + 16);
  return result;
}

void *sub_246CC3860(void *a1, uint64_t a2)
{
  v4 = a1 + 1;
  unint64_t v5 = (unsigned char *)a1[1];
  unint64_t v6 = (uint64_t)(*(void *)(a2 + 16) - *(void *)(a2 + 8)) >> 2;
  if (v6 <= (uint64_t)(a1[3] - (void)v5) >> 2) {
    goto LABEL_15;
  }
  if (v6 <= 0x20) {
    unint64_t v6 = 32;
  }
  if (v6 >> 62) {
    sub_246CC23A4();
  }
  unint64_t v7 = (unsigned char *)a1[2];
  uint64_t v8 = 4 * v6;
  unint64_t v9 = (char *)operator new(4 * v6);
  uint64_t v10 = v7 - v5;
  unint64_t v11 = &v9[(v7 - v5) & 0xFFFFFFFFFFFFFFFCLL];
  unint64_t v12 = v11;
  if (v7 != v5)
  {
    if ((unint64_t)(v10 - 4) < 0x2C)
    {
      unint64_t v12 = &v9[(v7 - v5) & 0xFFFFFFFFFFFFFFFCLL];
      do
      {
LABEL_12:
        int v21 = *((_DWORD *)v7 - 1);
        v7 -= 4;
        *((_DWORD *)v12 - 1) = v21;
        v12 -= 4;
      }
      while (v7 != v5);
      goto LABEL_13;
    }
    unint64_t v12 = &v9[(v7 - v5) & 0xFFFFFFFFFFFFFFFCLL];
    if ((unint64_t)(&v7[-(v10 & 0xFFFFFFFFFFFFFFFCLL)] - v9) < 0x20) {
      goto LABEL_12;
    }
    uint64_t v13 = v10 >> 2;
    unint64_t v14 = ((unint64_t)(v10 - 4) >> 2) + 1;
    uint64_t v15 = 4 * (v14 & 0x7FFFFFFFFFFFFFF8);
    uint64_t v16 = &v7[-v15];
    unint64_t v12 = &v11[-v15];
    long long v17 = &v9[4 * v13 - 16];
    uint64_t v18 = (long long *)(v7 - 16);
    uint64_t v19 = v14 & 0x7FFFFFFFFFFFFFF8;
    do
    {
      long long v20 = *v18;
      *((_OWORD *)v17 - 1) = *(v18 - 1);
      *(_OWORD *)long long v17 = v20;
      v17 -= 32;
      v18 -= 2;
      v19 -= 8;
    }
    while (v19);
    unint64_t v7 = v16;
    if (v14 != (v14 & 0x7FFFFFFFFFFFFFF8)) {
      goto LABEL_12;
    }
  }
LABEL_13:
  a1[1] = v12;
  a1[2] = v11;
  a1[3] = &v9[v8];
  if (v5) {
    operator delete(v5);
  }
LABEL_15:
  if (a1 != (void *)a2) {
    sub_246CC3BB0(v4, *(char **)(a2 + 8), *(char **)(a2 + 16), (uint64_t)(*(void *)(a2 + 16) - *(void *)(a2 + 8)) >> 2);
  }
  return a1;
}

void *sub_246CC39BC(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2)
  {
    a1[5] = v2;
    operator delete(v2);
  }
  unint64_t v3 = (void *)a1[1];
  if (v3)
  {
    a1[2] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_246CC3A00(uint64_t a1, unint64_t a2)
{
  unint64_t v5 = *(char **)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  unint64_t v6 = v5;
  if (a2 <= (v4 - (uint64_t)v5) >> 2)
  {
    if (a2)
    {
      bzero(v5, 4 * a2);
      unint64_t v6 = &v5[4 * a2];
    }
    *(void *)(a1 + 8) = v6;
  }
  else
  {
    unint64_t v7 = *(char **)a1;
    uint64_t v8 = (uint64_t)&v5[-*(void *)a1];
    uint64_t v9 = v8 >> 2;
    unint64_t v10 = (v8 >> 2) + a2;
    if (v10 >> 62) {
      sub_246CC23A4();
    }
    uint64_t v11 = v4 - (void)v7;
    if (v11 >> 1 > v10) {
      unint64_t v10 = v11 >> 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      if (v12 >> 62) {
        sub_246CC29A0();
      }
      uint64_t v13 = operator new(4 * v12);
    }
    else
    {
      uint64_t v13 = 0;
    }
    unint64_t v14 = &v13[4 * v9];
    size_t v15 = 4 * a2;
    uint64_t v16 = &v13[4 * v12];
    bzero(v14, v15);
    long long v17 = &v14[v15];
    if (v5 != v7)
    {
      unint64_t v18 = v5 - v7 - 4;
      if (v18 < 0x2C) {
        goto LABEL_31;
      }
      if ((unint64_t)(v5 - v13 - v8) < 0x20) {
        goto LABEL_31;
      }
      uint64_t v19 = (v18 >> 2) + 1;
      uint64_t v20 = 4 * (v19 & 0x7FFFFFFFFFFFFFF8);
      unint64_t v6 = &v5[-v20];
      v14 -= v20;
      int v21 = &v13[4 * v9 - 16];
      int v22 = v5 - 16;
      uint64_t v23 = v19 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v24 = *(_OWORD *)v22;
        *(v21 - 1) = *((_OWORD *)v22 - 1);
        *int v21 = v24;
        v21 -= 2;
        v22 -= 32;
        v23 -= 8;
      }
      while (v23);
      if (v19 != (v19 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_31:
        do
        {
          int v25 = *((_DWORD *)v6 - 1);
          v6 -= 4;
          *((_DWORD *)v14 - 1) = v25;
          v14 -= 4;
        }
        while (v6 != v7);
      }
    }
    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v17;
    *(void *)(a1 + 16) = v16;
    if (v7)
    {
      operator delete(v7);
    }
  }
}

void *sub_246CC3BB0(void *result, char *__src, char *a3, size_t __sz)
{
  unint64_t v6 = __src;
  unint64_t v7 = result;
  uint64_t v8 = result[2];
  uint64_t v9 = (char *)*result;
  if (__sz > (v8 - *result) >> 2)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (__sz >> 62) {
      goto LABEL_22;
    }
    uint64_t v10 = v8 >> 1;
    if (v8 >> 1 <= __sz) {
      uint64_t v10 = __sz;
    }
    BOOL v11 = (unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL;
    unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
    if (!v11) {
      unint64_t v12 = v10;
    }
    if (v12 >> 62) {
LABEL_22:
    }
      sub_246CC23A4();
    uint64_t v13 = 4 * v12;
    result = operator new(4 * v12);
    uint64_t v9 = (char *)result;
    void *v7 = result;
    v7[1] = result;
    v7[2] = (char *)result + v13;
    size_t v14 = a3 - v6;
    if (v14) {
      result = memcpy(result, v6, v14);
    }
    size_t v15 = (void **)(v7 + 1);
    goto LABEL_21;
  }
  size_t v15 = (void **)(result + 1);
  uint64_t v16 = (unsigned char *)result[1];
  unint64_t v17 = (v16 - v9) >> 2;
  if (v17 >= __sz)
  {
    size_t v14 = a3 - __src;
    if (a3 == __src) {
      goto LABEL_21;
    }
    uint64_t v19 = (void *)*result;
LABEL_20:
    result = memmove(v19, __src, v14);
    goto LABEL_21;
  }
  unint64_t v18 = &__src[4 * v17];
  if (v16 != v9)
  {
    result = memmove((void *)*result, __src, v16 - v9);
    uint64_t v9 = (char *)*v15;
  }
  size_t v14 = a3 - v18;
  if (v14)
  {
    uint64_t v19 = v9;
    __src = v18;
    goto LABEL_20;
  }
LABEL_21:
  int8x16_t *v15 = &v9[v14];
  return result;
}

void sub_246CC3CF8()
{
}

void sub_246CC3D10(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_246CC3D6C(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_265201938, MEMORY[0x263F8C068]);
}

void sub_246CC3D58(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_246CC3D6C(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void *sub_246CC3DA0(void *a1, uint64_t a2)
{
  uint64_t v4 = a1 + 1;
  *a1 = a2;
  a1[1] = a1 + 1;
  a1[2] = a1 + 1;
  a1[3] = 0;
  unint64_t v5 = operator new(4uLL);
  *unint64_t v5 = 1;
  uint64_t v13 = 0;
  *((void *)&v11 + 1) = v5 + 1;
  long long v12 = 0uLL;
  *(void *)&long long v10 = a2;
  *((void *)&v10 + 1) = v5;
  *(void *)&long long v11 = v5 + 1;
  sub_246CC29D4((char **)&v10);
  unint64_t v6 = operator new(0x48uLL);
  long long v7 = v11;
  v6[1] = v10;
  v6[2] = v7;
  v6[3] = v12;
  *((void *)v6 + 8) = v13;
  uint64_t v8 = a1[1];
  *(void *)unint64_t v6 = v8;
  *((void *)v6 + 1) = v4;
  *(void *)(v8 + 8) = v6;
  a1[1] = v6;
  ++a1[3];
  return a1;
}

void sub_246CC3E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_246CC39BC(&a9);
  sub_246CC3EC8(v9);
  _Unwind_Resume(a1);
}

void sub_246CC3E68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p)
  {
    operator delete(__p);
    uint64_t v16 = a10;
    if (!a10)
    {
LABEL_3:
      sub_246CC3EC8(v14);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    uint64_t v16 = a10;
    if (!a10) {
      goto LABEL_3;
    }
  }
  operator delete(v16);
  sub_246CC3EC8(v14);
  _Unwind_Resume(a1);
}

void sub_246CC3EB4(_Unwind_Exception *a1)
{
  sub_246CC3EC8(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_246CC3EC8(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v2 = *a1;
    unint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        unint64_t v6 = (uint64_t *)v3[1];
        long long v7 = (void *)v3[6];
        if (v7)
        {
          v3[7] = (uint64_t)v7;
          operator delete(v7);
        }
        uint64_t v8 = (void *)v3[3];
        if (v8)
        {
          v3[4] = (uint64_t)v8;
          operator delete(v8);
        }
        operator delete(v3);
        unint64_t v3 = v6;
      }
      while (v6 != a1);
    }
  }
  return a1;
}

void *sub_246CC3F60(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)(a1 + 24);
  if (v4 <= a2)
  {
    uint64_t v5 = *(void *)(a1 + 8);
    *(_OWORD *)int v25 = 0u;
    *(_OWORD *)float32x4_t v26 = 0u;
    long long v27 = 0u;
    long long v24 = *(char **)(v5 + 16);
    sub_246CC3860(&v24, v5 + 16);
    int v6 = v4 - 1;
    do
    {
      long long v7 = *(char **)a1;
      unint64_t v8 = v6 + *(_DWORD *)(*(void *)a1 + 4);
      uint64_t v9 = *(void *)(*(void *)a1 + 8);
      if (v8 >= (*(void *)(*(void *)a1 + 16) - v9) >> 2) {
        sub_246CC3CF8();
      }
      uint64_t v10 = *(unsigned int *)(v9 + 4 * v8);
      long long v11 = operator new(8uLL);
      *long long v11 = (v10 << 32) | 1;
      int v22 = 0;
      uint64_t v23 = 0;
      __p = 0;
      unint64_t v17 = v7;
      unint64_t v18 = v11;
      uint64_t v19 = v11 + 1;
      uint64_t v20 = v11 + 1;
      sub_246CC29D4(&v17);
      sub_246CC2BA8(&v24, (uint64_t)&v17);
      if (__p)
      {
        int v22 = __p;
        operator delete(__p);
      }
      if (v18)
      {
        uint64_t v19 = v18;
        operator delete(v18);
      }
      sub_246CC41BC((uint64_t *)(a1 + 8), &v24);
      ++v6;
    }
    while (a2 != v6);
    if (v26[1])
    {
      *(void **)&long long v27 = v26[1];
      operator delete(v26[1]);
    }
    if (v25[0])
    {
      v25[1] = v25[0];
      operator delete(v25[0]);
    }
  }
  long long v12 = *(void **)(a1 + 16);
  uint64_t v13 = a2;
  if (a2 < 0)
  {
    do
      long long v12 = (void *)*v12;
    while (!__CFADD__(v13++, 1));
  }
  else if (a2)
  {
    unint64_t v14 = a2 + 1;
    do
    {
      long long v12 = (void *)v12[1];
      --v14;
    }
    while (v14 > 1);
  }
  return v12 + 2;
}

void sub_246CC40DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  if (__p)
  {
    operator delete(__p);
    int v22 = a17;
    if (!a17) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else
  {
    int v22 = a17;
    if (!a17) {
      goto LABEL_3;
    }
  }
  operator delete(v22);
  _Unwind_Resume(exception_object);
}

void sub_246CC4118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  sub_246CC39BC((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_246CC412C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  sub_246CC39BC((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_246CC4140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (__p)
  {
    operator delete(__p);
    unint64_t v17 = a10;
    if (!a10)
    {
LABEL_3:
      sub_246CC39BC(&a16);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    unint64_t v17 = a10;
    if (!a10) {
      goto LABEL_3;
    }
  }
  operator delete(v17);
  sub_246CC39BC(&a16);
  _Unwind_Resume(a1);
}

void sub_246CC418C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
}

void sub_246CC41A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  sub_246CC39BC((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *sub_246CC41BC(uint64_t *a1, void *a2)
{
  int v4 = (char *)operator new(0x48uLL);
  *(_OWORD *)(v4 + 24) = 0u;
  *(_OWORD *)(v4 + 40) = 0u;
  *(_OWORD *)(v4 + 56) = 0u;
  *(void *)int v4 = 0;
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = *a2;
  result = sub_246CC3860((void *)v4 + 2, (uint64_t)a2);
  uint64_t v6 = *a1;
  *(void *)int v4 = *a1;
  *((void *)v4 + 1) = a1;
  *(void *)(v6 + 8) = v4;
  *a1 = (uint64_t)v4;
  ++a1[2];
  return result;
}

void sub_246CC4238(_Unwind_Exception *a1)
{
  int v4 = (void *)v1[6];
  if (v4)
  {
    v1[7] = v4;
    operator delete(v4);
    uint64_t v5 = *v2;
    if (!*v2)
    {
LABEL_3:
      operator delete(v1);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    uint64_t v5 = *v2;
    if (!*v2) {
      goto LABEL_3;
    }
  }
  v1[4] = v5;
  operator delete(v5);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_246CC4284(char **a1, uint64_t a2, int a3)
{
  if (!a3)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    sub_246CC382C(exception, "No error correction bytes");
    goto LABEL_18;
  }
  uint64_t v5 = *(const void **)a2;
  uint64_t v6 = (*(void *)(a2 + 8) - *(void *)a2) >> 2;
  uint64_t v7 = (v6 - a3);
  if ((int)v6 <= a3)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    sub_246CC382C(exception, "No data bytes provided");
LABEL_18:
    __cxa_throw(exception, (struct type_info *)off_265201940, MEMORY[0x263F8C080]);
  }
  uint64_t v9 = *a1;
  uint64_t v10 = (char *)operator new(4 * (v6 - a3));
  memmove(v10, v5, 4 * v7);
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  float32x4_t v26 = &v10[4 * v7];
  long long v27 = 0;
  uint64_t v23 = v9;
  long long v24 = v10;
  int v25 = v26;
  sub_246CC29D4(&v23);
  sub_246CC305C(&v23, a3, 1);
  uint64_t v22 = 0;
  long long v20 = 0u;
  *(_OWORD *)__p = 0u;
  *(_OWORD *)uint64_t v19 = 0u;
  long long v11 = sub_246CC3F60((uint64_t)a1, a3);
  sub_246CC32AC((uint64_t *)&v23, (uint64_t)v11, (uint64_t)v19);
  long long v12 = v24;
  uint64_t v13 = v25;
  size_t v14 = v25 - (unsigned char *)v24;
  unint64_t v15 = (unint64_t)(v25 - (unsigned char *)v24) >> 2;
  int v16 = a3 - v15;
  unint64_t v17 = (char *)(*(void *)a2 + 4 * v7);
  if (a3 - (int)v15 >= 1) {
    bzero(v17, 4 * (~v15 + a3) + 4);
  }
  if (v13 != v12) {
    memmove(&v17[4 * v16], v12, v14);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v19[1])
  {
    *(void **)&long long v20 = v19[1];
    operator delete(v19[1]);
  }
  if (v27)
  {
    uint64_t v28 = v27;
    operator delete(v27);
  }
  if (v24)
  {
    int v25 = v24;
    operator delete(v24);
  }
}

void sub_246CC4448(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_246CC445C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_246CC4470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
}

void ACCBakerCreate(const __CFURL *a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    sub_246CC0FF4(a1);
  }
  sub_246CC06A4(a1);
}

void sub_246CC4D60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,char a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,int a39,__int16 a40,char a41,char a42)
{
  operator delete(v42);
  if (a18 < 0) {
    operator delete(__p);
  }
  if (a26 && a25 < 0) {
    operator delete(a20);
  }
  sub_246CC2068((uint64_t)&a28);
  sub_246CC4E8C((void *)(v43 - 136));
  sub_246CC4E8C((void *)(v43 - 104));
  if (a38)
  {
    if (a34)
    {
      a35 = (uint64_t)a34;
      operator delete(a34);
      _Unwind_Resume(a1);
    }
  }
  _Unwind_Resume(a1);
}

void *sub_246CC4E8C(void *a1)
{
  uint64_t v2 = a1[3];
  if (!v2) {
    sub_246CC4F54();
  }
  (*(void (**)(uint64_t))(*(void *)v2 + 48))(v2);
  unint64_t v3 = (void *)a1[3];
  if (v3 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
    return a1;
  }
  else
  {
    if (v3) {
      (*(void (**)(void *))(*v3 + 40))(v3);
    }
    return a1;
  }
}

void sub_246CC4F54()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &unk_26FB3DBB0;
  __cxa_throw(exception, (struct type_info *)&unk_26FB3DB88, (void (*)(void *))std::exception::~exception);
}

void sub_246CC4FA4(std::exception *a1)
{
  std::exception::~exception(a1);
  JUMPOUT(0x24C5471E0);
}

void sub_246CC4FE0()
{
}

__n128 sub_246CC4FF4(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26FB3DBD8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_246CC5040(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26FB3DBD8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_246CC5070(uint64_t a1)
{
  return sub_246CC5C5C(**(void **)(a1 + 8));
}

uint64_t sub_246CC507C(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "N4cv3d3esn5Defer11BindWrapperINSt3__16__bindIRZ14ACCBakerCreateE3$_0JEEEEE") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"N4cv3d3esn5Defer11BindWrapperINSt3__16__bindIRZ14ACCBakerCreateE3$_0JEEEEE" & 0x8000000000000000) != 0) == __OFSUB__(v3, "N4cv3d3esn5Defer11BindWrapperINSt3__16__bindIRZ14ACCBakerCreateE3$_0JEEEEE")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"N4cv3d3esn5Defer11BindWrapperINSt3__16__bindIRZ14ACCBakerCreateE3$_0JEEEEE" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *sub_246CC50EC()
{
  return &unk_26FB3DC48;
}

void sub_246CC50FC()
{
}

__n128 sub_246CC5110(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26FB3DC68;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_246CC515C(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26FB3DC68;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_246CC518C(uint64_t result)
{
  uint64_t v1 = **(void **)(result + 8);
  if (v1)
  {
    uint64_t v2 = *(void **)(v1 + 32);
    if (v2)
    {
      *(void *)(v1 + 40) = v2;
      operator delete(v2);
    }
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    JUMPOUT(0x24C5471E0);
  }
  return result;
}

uint64_t sub_246CC5204(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "N4cv3d3esn5Defer11BindWrapperINSt3__16__bindIRZ14ACCBakerCreateE3$_1JEEEEE") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"N4cv3d3esn5Defer11BindWrapperINSt3__16__bindIRZ14ACCBakerCreateE3$_1JEEEEE" & 0x8000000000000000) != 0) == __OFSUB__(v3, "N4cv3d3esn5Defer11BindWrapperINSt3__16__bindIRZ14ACCBakerCreateE3$_1JEEEEE")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"N4cv3d3esn5Defer11BindWrapperINSt3__16__bindIRZ14ACCBakerCreateE3$_1JEEEEE" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *sub_246CC5274()
{
  return &unk_26FB3DCC8;
}

BOOL sub_246CC5280(const void *a1, size_t __sz, int a3)
{
  BOOL v3 = 0;
  if (a1 && __sz)
  {
    __p = 0;
    size_t v14 = 0;
    unint64_t v15 = 0;
    if ((__sz & 0x8000000000000000) != 0) {
      sub_246CC23A4();
    }
    uint64_t v7 = operator new(__sz);
    unint64_t v8 = &v7[__sz];
    __p = v7;
    unint64_t v15 = &v7[__sz];
    memcpy(v7, a1, __sz);
    size_t v14 = &v7[__sz];
    switch(a3)
    {
      case 0:
        BOOL v3 = (unsigned __int16)sub_246CD7AAC(&__p, byte_246CFEE4A, (unsigned __int8 *)3) > 0xFFu;
        uint64_t v7 = __p;
        if (__p) {
          break;
        }
        return v3;
      case 1:
        if (__sz > 0x12) {
          goto LABEL_20;
        }
        BOOL v11 = (v7[1] & 0x3F) == 0;
        goto LABEL_22;
      case 2:
        size_t v9 = 9;
        if (!*v7) {
          size_t v9 = 4;
        }
        if (v9 < __sz) {
          goto LABEL_20;
        }
        BOOL v3 = v7[1] < 0x10u;
        break;
      case 3:
        if (__sz == 21 && !*v7 && !v7[1])
        {
          if (v8 != v7 + 2)
          {
            long long v10 = *(_OWORD *)(v7 + 2);
            *((_WORD *)v7 + 8) = *((_WORD *)v7 + 9);
            v7[18] = v7[20];
            *(_OWORD *)uint64_t v7 = v10;
          }
          unint64_t v8 = v7 + 19;
        }
        if (v8 - v7 != 19) {
          goto LABEL_20;
        }
        BOOL v11 = (*(v8 - 1) & 7) == 0;
LABEL_22:
        BOOL v3 = v11;
        break;
      default:
LABEL_20:
        BOOL v3 = 0;
        break;
    }
    size_t v14 = v7;
    operator delete(v7);
  }
  return v3;
}

void sub_246CC5414(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_246CC5444(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

uint64_t sub_246CC54F8(uint64_t a1, const void *a2, size_t __sz, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2) {
    return 2;
  }
  uint64_t v9 = 1;
  if (a1 && a8)
  {
    unint64_t v15 = 0;
    int v16 = 0;
    unint64_t v17 = 0;
    if (__sz)
    {
      if ((__sz & 0x8000000000000000) != 0) {
        sub_246CC23A4();
      }
      long long v12 = (char *)operator new(__sz);
      uint64_t v13 = &v12[__sz];
      unint64_t v15 = v12;
      unint64_t v17 = &v12[__sz];
      memcpy(v12, a2, __sz);
      int v16 = v13;
    }
    switch(*(_DWORD *)(a1 + 16))
    {
      case 0:
        if ((unsigned __int16)sub_246CD7AAC(&v15, byte_246CFEE4A, (unsigned __int8 *)3) < 0x100u) {
          goto LABEL_9;
        }
        goto LABEL_11;
      case 1:
      case 2:
      case 3:
LABEL_11:
        operator new();
      default:
LABEL_9:
        uint64_t v9 = 4;
        if (v15)
        {
          int v16 = v15;
          operator delete(v15);
        }
        break;
    }
  }
  return v9;
}

void sub_246CC5A14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,char a25)
{
  if (a16 && a15 < 0) {
    operator delete(__p);
  }
  if (a22 < 0) {
    operator delete(a17);
  }
  sub_246CC5BBC((uint64_t)&a25);
  sub_246CCB9FC((void **)(v25 - 112));
  long long v27 = *(void **)(v25 - 104);
  if (v27)
  {
    *(void *)(v25 - 96) = v27;
    operator delete(v27);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_246CC5AF0(uint64_t result)
{
  uint64_t v1 = (long long *)result;
  if (!*(unsigned char *)(result + 120))
  {
    exception = __cxa_allocate_exception(0x80uLL);
    long long v3 = *v1;
    sub_246CC60FC(v4, v1 + 1);
    sub_246CC5F3C((uint64_t)exception, &v3);
    __cxa_throw(exception, (struct type_info *)&unk_26FB3DD30, (void (*)(void *))sub_246CC5FA0);
  }
  return result;
}

void sub_246CC5B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_246CC5B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_246CC606C((uint64_t)&a9);
  __cxa_free_exception(v9);
  _Unwind_Resume(a1);
}

void sub_246CC5BA8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_246CC5BBC(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 120))
  {
    if (!*(unsigned char *)(a1 + 112)) {
      return a1;
    }
    if (!*(unsigned char *)(a1 + 104)) {
      goto LABEL_8;
    }
    if (*(char *)(a1 + 103) < 0)
    {
      operator delete(*(void **)(a1 + 80));
      if ((*(char *)(a1 + 71) & 0x80000000) == 0)
      {
LABEL_8:
        if (!*(unsigned char *)(a1 + 40)) {
          return a1;
        }
        goto LABEL_9;
      }
    }
    else if ((*(char *)(a1 + 71) & 0x80000000) == 0)
    {
      goto LABEL_8;
    }
    operator delete(*(void **)(a1 + 48));
    if (!*(unsigned char *)(a1 + 40)) {
      return a1;
    }
LABEL_9:
    if ((*(char *)(a1 + 39) & 0x80000000) == 0) {
      return a1;
    }
    uint64_t v2 = *(void **)(a1 + 16);
    goto LABEL_11;
  }
  uint64_t v2 = *(void **)a1;
  if (!*(void *)a1) {
    return a1;
  }
LABEL_11:
  operator delete(v2);
  return a1;
}

uint64_t sub_246CC5C5C(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 8);
    *(void *)(v1 + 8) = 0;
    if (v2)
    {
      uint64_t v3 = sub_246CF5B6C(v2);
      MEMORY[0x24C5471E0](v3, 0x1092C40FB2C32F1);
    }
    size_t v4 = *(sqlite3 ***)v1;
    *(void *)uint64_t v1 = 0;
    if (v4)
    {
      size_t v5 = *v4;
      void *v4 = 0;
      if (v5) {
        sqlite3_close_v2(v5);
      }
      MEMORY[0x24C5471E0](v4, 0x20C4093837F09);
    }
    JUMPOUT(0x24C5471E0);
  }
  return result;
}

void sub_246CC5D0C()
{
}

void sub_246CC5D24(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
  {
    sub_246CC5E50(__p, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    uint64_t v3 = *(void *)(a2 + 16);
  }
  operator new();
}

void sub_246CC5DD8(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;
  MEMORY[0x24C5471E0](v3, 0x1092C40FB2C32F1);
  sub_246CF7614(v1);
  _Unwind_Resume(a1);
}

void sub_246CC5E10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v15 = v14;
  MEMORY[0x24C5471E0](v15, 0x20C4093837F09);
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void *sub_246CC5E50(unsigned char *__dst, void *__src, unint64_t a3)
{
  size_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_246CC5D0C();
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

void sub_246CC5EF0()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3B0] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C200], MEMORY[0x263F8C088]);
}

uint64_t sub_246CC5F3C(uint64_t a1, _OWORD *a2)
{
  *(void *)a1 = &unk_26FB3DD58;
  *(_OWORD *)(a1 + 8) = *a2;
  sub_246CC60FC((unsigned char *)(a1 + 24), a2 + 1);
  return a1;
}

void sub_246CC5F8C(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void sub_246CC5FA0(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_26FB3DD58;
  if (!LOBYTE(this[15].__vftable)) {
    goto LABEL_7;
  }
  if (!LOBYTE(this[14].__vftable)) {
    goto LABEL_5;
  }
  if ((SHIBYTE(this[13].__vftable) & 0x80000000) == 0)
  {
    if ((SHIBYTE(this[9].__vftable) & 0x80000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
  operator delete(this[11].__vftable);
  if (SHIBYTE(this[9].__vftable) < 0)
  {
LABEL_11:
    operator delete(this[7].__vftable);
    if (LOBYTE(this[6].__vftable)) {
      goto LABEL_6;
    }
LABEL_7:
    uint64_t v2 = this;
    goto LABEL_9;
  }
LABEL_5:
  if (!LOBYTE(this[6].__vftable)) {
    goto LABEL_7;
  }
LABEL_6:
  if ((SHIBYTE(this[5].__vftable) & 0x80000000) == 0) {
    goto LABEL_7;
  }
  operator delete(this[3].__vftable);
  uint64_t v2 = this;
LABEL_9:
  std::exception::~exception(v2);
}

uint64_t sub_246CC606C(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 112)) {
    return a1;
  }
  if (*(unsigned char *)(a1 + 104))
  {
    if ((*(char *)(a1 + 103) & 0x80000000) == 0)
    {
      if ((*(char *)(a1 + 71) & 0x80000000) == 0) {
        goto LABEL_5;
      }
LABEL_9:
      operator delete(*(void **)(a1 + 48));
      if (!*(unsigned char *)(a1 + 40)) {
        return a1;
      }
      goto LABEL_6;
    }
    operator delete(*(void **)(a1 + 80));
    if (*(char *)(a1 + 71) < 0) {
      goto LABEL_9;
    }
  }
LABEL_5:
  if (!*(unsigned char *)(a1 + 40)) {
    return a1;
  }
LABEL_6:
  if ((*(char *)(a1 + 39) & 0x80000000) == 0) {
    return a1;
  }
  operator delete(*(void **)(a1 + 16));
  return a1;
}

unsigned char *sub_246CC60FC(unsigned char *__dst, long long *a2)
{
  *__dst = 0;
  __dst[96] = 0;
  if (*((unsigned char *)a2 + 96))
  {
    *__dst = 0;
    __dst[24] = 0;
    if (*((unsigned char *)a2 + 24))
    {
      if (*((char *)a2 + 23) < 0)
      {
        sub_246CC5E50(__dst, *(void **)a2, *((void *)a2 + 1));
      }
      else
      {
        long long v4 = *a2;
        *((void *)__dst + 2) = *((void *)a2 + 2);
        *(_OWORD *)__dst = v4;
      }
      __dst[24] = 1;
    }
    sub_246CC6248(__dst + 32, a2 + 2);
    __dst[96] = 1;
  }
  return __dst;
}

void sub_246CC6188(_Unwind_Exception *a1)
{
  if (*(unsigned char *)(v1 + 24))
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
  }
  sub_246CC61B8(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_246CC61B8(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 96)) {
    return a1;
  }
  if (*(unsigned char *)(a1 + 88))
  {
    if ((*(char *)(a1 + 87) & 0x80000000) == 0)
    {
      if ((*(char *)(a1 + 55) & 0x80000000) == 0) {
        goto LABEL_5;
      }
LABEL_9:
      operator delete(*(void **)(a1 + 32));
      if (!*(unsigned char *)(a1 + 24)) {
        return a1;
      }
      goto LABEL_6;
    }
    operator delete(*(void **)(a1 + 64));
    if (*(char *)(a1 + 55) < 0) {
      goto LABEL_9;
    }
  }
LABEL_5:
  if (!*(unsigned char *)(a1 + 24)) {
    return a1;
  }
LABEL_6:
  if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
    return a1;
  }
  operator delete(*(void **)a1);
  return a1;
}

char *sub_246CC6248(char *__dst, long long *a2)
{
  *__dst = 0;
  __dst[56] = 0;
  if (*((unsigned char *)a2 + 56))
  {
    if (*((char *)a2 + 23) < 0)
    {
      sub_246CC5E50(__dst, *(void **)a2, *((void *)a2 + 1));
    }
    else
    {
      long long v4 = *a2;
      *((void *)__dst + 2) = *((void *)a2 + 2);
      *(_OWORD *)__dst = v4;
    }
    *((void *)__dst + 3) = *((void *)a2 + 3);
    size_t v5 = __dst + 32;
    if (*((char *)a2 + 55) < 0)
    {
      sub_246CC5E50(v5, *((void **)a2 + 4), *((void *)a2 + 5));
    }
    else
    {
      long long v6 = a2[2];
      *((void *)__dst + 6) = *((void *)a2 + 6);
      *(_OWORD *)size_t v5 = v6;
    }
    __dst[56] = 1;
  }
  return __dst;
}

void sub_246CC62E4(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 23) < 0)
  {
    operator delete(*(void **)v1);
    sub_246CC631C(v1);
    _Unwind_Resume(a1);
  }
  sub_246CC631C(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_246CC631C(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56)) {
    return a1;
  }
  if (*(char *)(a1 + 55) < 0)
  {
    operator delete(*(void **)(a1 + 32));
    if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
      return a1;
    }
  }
  else if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    return a1;
  }
  operator delete(*(void **)a1);
  return a1;
}

void sub_246CC6380(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_26FB3DD58;
  if (!LOBYTE(this[15].__vftable)) {
    goto LABEL_10;
  }
  if (LOBYTE(this[14].__vftable))
  {
    if ((SHIBYTE(this[13].__vftable) & 0x80000000) == 0)
    {
      if ((SHIBYTE(this[9].__vftable) & 0x80000000) == 0) {
        goto LABEL_5;
      }
LABEL_9:
      operator delete(this[7].__vftable);
      if (!LOBYTE(this[6].__vftable)) {
        goto LABEL_10;
      }
      goto LABEL_6;
    }
    operator delete(this[11].__vftable);
    if (SHIBYTE(this[9].__vftable) < 0) {
      goto LABEL_9;
    }
  }
LABEL_5:
  if (!LOBYTE(this[6].__vftable)) {
    goto LABEL_10;
  }
LABEL_6:
  if (SHIBYTE(this[5].__vftable) < 0) {
    operator delete(this[3].__vftable);
  }
LABEL_10:
  std::exception::~exception(this);
  JUMPOUT(0x24C5471E0);
}

void sub_246CC6448(std::exception *a1)
{
  std::exception::~exception(a1);
  JUMPOUT(0x24C5471E0);
}

void *sub_246CC6484(void *__dst, void *__src, size_t __len)
{
  if (__len > 0x16)
  {
    if (__len - 0x7FFFFFFFFFFFFFF7 <= 0x800000000000001ELL) {
      sub_246CC5D0C();
    }
    size_t v7 = 44;
    if (__len > 0x2C) {
      size_t v7 = __len;
    }
    size_t v8 = (v7 | 7) + 1;
    long long v6 = operator new(v8);
    memcpy(v6, __src, __len);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    long long v6 = __dst;
    if (__len)
    {
      memmove(__dst, __src, __len);
      long long v6 = __dst;
    }
  }
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void **sub_246CC654C(void **a1, void *__src, size_t __len)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v7 = v6 & 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 0x7FFFFFFFFFFFFFFFLL) > __len)
  {
    size_t v8 = *a1;
    a1[1] = (void *)__len;
    if (__len) {
      memmove(v8, __src, __len);
    }
    goto LABEL_12;
  }
  size_t v9 = 0x7FFFFFFFFFFFFFF7;
  if (0x7FFFFFFFFFFFFFF7 - v7 < __len - v7 + 1) {
    sub_246CC5D0C();
  }
  unint64_t v10 = v7 - 1;
  BOOL v11 = a1;
  if ((v6 & 0x8000000000000000) == 0)
  {
    if (v10 > 0x3FFFFFFFFFFFFFF2) {
      goto LABEL_7;
    }
LABEL_14:
    unint64_t v13 = 2 * v10;
    if (__len > 2 * v10) {
      unint64_t v13 = __len;
    }
    uint64_t v14 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17) {
      uint64_t v14 = v13 | 7;
    }
    if (v13 >= 0x17) {
      size_t v9 = v14 + 1;
    }
    else {
      size_t v9 = 23;
    }
    size_t v8 = operator new(v9);
    if (!__len) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  BOOL v11 = *a1;
  if (v10 <= 0x3FFFFFFFFFFFFFF2) {
    goto LABEL_14;
  }
LABEL_7:
  size_t v8 = operator new(0x7FFFFFFFFFFFFFF7uLL);
  if (__len) {
LABEL_8:
  }
    memcpy(v8, __src, __len);
LABEL_9:
  if (v10 != 22) {
    operator delete(v11);
  }
  a1[1] = (void *)__len;
  a1[2] = (void *)(v9 | 0x8000000000000000);
  *a1 = v8;
LABEL_12:
  *((unsigned char *)v8 + __len) = 0;
  return a1;
}

uint64_t sub_246CC6694(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 24);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))off_26FB3DD70[v2])(&v4, a1);
  }
  *(_DWORD *)(a1 + 24) = -1;
  return a1;
}

void sub_246CC66F0()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3A8] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C1F8], (void (*)(void *))std::exception::~exception);
}

_DWORD *sub_246CC6740(_DWORD *a1, const char **a2)
{
  uint64_t v4 = a1[6];
  if (v4 != -1) {
    ((void (*)(char *, _DWORD *))off_26FB3DD70[v4])(&v12, a1);
  }
  a1[6] = -1;
  size_t v5 = *a2;
  size_t v6 = strlen(*a2);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  size_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    size_t v8 = operator new(v9 + 1);
    *((void *)a1 + 1) = v7;
    *((void *)a1 + 2) = v10 | 0x8000000000000000;
    *(void *)a1 = v8;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v6;
    size_t v8 = a1;
    if (!v6) {
      goto LABEL_11;
    }
  }
  memmove(v8, v5, v7);
LABEL_11:
  *((unsigned char *)v8 + v7) = 0;
  a1[6] = 1;
  return a1;
}

void sub_246CC683C(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0) {
    operator delete(*(void **)a2);
  }
}

void sub_246CC6850(uint64_t a1, void **a2)
{
  uint64_t v2 = (void **)*a2;
  if (*a2)
  {
    uint64_t v4 = (void **)a2[1];
    size_t v5 = *a2;
    if (v4 == v2)
    {
      a2[1] = v2;
    }
    else
    {
      do
      {
        if (*((char *)v4 - 1) < 0) {
          operator delete(*(v4 - 3));
        }
        v4 -= 3;
      }
      while (v4 != v2);
      size_t v5 = *a2;
      a2[1] = v2;
    }
    operator delete(v5);
  }
}

void *sub_246CC68FC(void *a1, uint64_t a2, unint64_t a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a3)
  {
    if (a3 >= 0xAAAAAAAAAAAAAABLL) {
      sub_246CC23A4();
    }
    uint64_t v5 = 24 * a3;
    size_t v6 = (char *)operator new(24 * a3);
    uint64_t v7 = 0;
    *a1 = v6;
    a1[1] = v6;
    a1[2] = &v6[v5];
    do
    {
      uint64_t v9 = &v6[v7];
      uint64_t v10 = (long long *)(a2 + v7);
      if (*(char *)(a2 + v7 + 23) < 0)
      {
        sub_246CC5E50(v9, *(void **)v10, *((void *)v10 + 1));
      }
      else
      {
        long long v8 = *v10;
        *((void *)v9 + 2) = *((void *)v10 + 2);
        *(_OWORD *)uint64_t v9 = v8;
      }
      v7 += 24;
    }
    while (v5 != v7);
    a1[1] = &v6[v7];
  }
  return a1;
}

void sub_246CC69D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void sub_246CC69EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  for (; v11; v11 -= 24)
  {
    if (*(char *)(v10 + v11 - 1) < 0) {
      operator delete(*(void **)(v10 + v11 - 24));
    }
  }
  *(void *)(v9 + 8) = v10;
  sub_246CC6A28(&a9);
  _Unwind_Resume(a1);
}

void ***sub_246CC6A28(void ***result)
{
  uint64_t v1 = result;
  if (!*((unsigned char *)result + 8))
  {
    uint64_t v2 = *result;
    uint64_t v3 = (void **)**result;
    if (v3)
    {
      uint64_t v4 = (void **)v2[1];
      uint64_t v5 = **result;
      if (v4 != v3)
      {
        do
        {
          if (*((char *)v4 - 1) < 0) {
            operator delete(*(v4 - 3));
          }
          v4 -= 3;
        }
        while (v4 != v3);
        uint64_t v5 = **v1;
      }
      v2[1] = v3;
      operator delete(v5);
      return v1;
    }
  }
  return result;
}

uint64_t sub_246CC6AC0(uint64_t a1)
{
  uint64_t v3 = *(void ***)(a1 + 8);
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      uint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != v3);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

__n128 sub_246CC6B28(__n128 ***a1)
{
  uint64_t v1 = **a1;
  uint64_t v2 = (*a1)[1];
  uint64_t v3 = v1[1].n128_u32[2];
  if (v3 != -1) {
    ((void (*)(char *, __n128 *))off_26FB3DD70[v3])(&v5, v1);
  }
  v1[1].n128_u32[2] = -1;
  __n128 result = *v2;
  v1[1].n128_u64[0] = v2[1].n128_u64[0];
  *uint64_t v1 = result;
  v2->n128_u64[1] = 0;
  v2[1].n128_u64[0] = 0;
  v2->n128_u64[0] = 0;
  v1[1].n128_u32[2] = 1;
  return result;
}

void sub_246CC6BA4(uint64_t a1, uint64_t a2)
{
}

char *sub_246CC6BB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 32);
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 >= *(void *)(a2 + 16))
  {
    __n128 result = sub_246CC6D84((void **)a2, v3);
    *(void *)(a2 + 8) = result;
  }
  else
  {
    long long v5 = *(_OWORD *)v3;
    *(void *)(v4 + 16) = *(void *)(v3 + 16);
    *(_OWORD *)unint64_t v4 = v5;
    *(void *)(v3 + 8) = 0;
    *(void *)(v3 + 16) = 0;
    *(void *)uint64_t v3 = 0;
    __n128 result = (char *)(v4 + 24);
    *(void *)(a2 + 8) = v4 + 24;
  }
  return result;
}

void sub_246CC6C1C(uint64_t *a1, uint64_t a2)
{
  v14[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  *(void *)((char *)v14 + 7) = *(void *)(a2 + 15);
  uint64_t v3 = *(void **)a2;
  v14[0] = *(void *)(a2 + 8);
  char v4 = *(unsigned char *)(a2 + 23);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  uint64_t v9 = v3;
  *(void *)uint64_t v10 = v14[0];
  *(void *)&v10[7] = *(void *)((char *)v14 + 7);
  char v11 = v4;
  memset(v14, 0, 15);
  uint64_t v5 = a1[1];
  uint64_t v6 = *(void *)(v5 + 16);
  *(_OWORD *)__p = *(_OWORD *)v5;
  uint64_t v13 = v6;
  *(void *)uint64_t v5 = 0;
  *(void *)(v5 + 8) = 0;
  *(void *)(v5 + 16) = 0;
  uint64_t v7 = *(unsigned int *)(v2 + 24);
  if (v7 != -1) {
    ((void (*)(char *, uint64_t))off_26FB3DD70[v7])(&v8, v2);
  }
  *(_DWORD *)(v2 + 24) = -1;
  sub_246CC68FC((void *)v2, (uint64_t)&v9, 2uLL);
  *(_DWORD *)(v2 + 24) = 2;
  if ((SHIBYTE(v13) & 0x80000000) == 0)
  {
    if ((v11 & 0x80000000) == 0) {
      return;
    }
LABEL_7:
    operator delete(v9);
    return;
  }
  operator delete(__p[0]);
  if (v11 < 0) {
    goto LABEL_7;
  }
}

void sub_246CC6D48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a2) {
    sub_246CC20E4(exception_object);
  }
  _Unwind_Resume(exception_object);
}

char *sub_246CC6D84(void **a1, uint64_t a2)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 3);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_246CC23A4();
  }
  if (0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) > v4) {
    unint64_t v4 = 0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3);
  }
  if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) >= 0x555555555555555) {
    unint64_t v6 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v6 = v4;
  }
  if (v6)
  {
    if (v6 > 0xAAAAAAAAAAAAAAALL) {
      sub_246CC29A0();
    }
    uint64_t v7 = (char *)operator new(24 * v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  char v8 = &v7[24 * v3];
  uint64_t v9 = &v7[24 * v6];
  *(_OWORD *)char v8 = *(_OWORD *)a2;
  *((void *)v8 + 2) = *(void *)(a2 + 16);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  uint64_t v10 = v8 + 24;
  char v11 = (void **)*a1;
  char v12 = (void **)a1[1];
  if (v12 == *a1)
  {
    *a1 = v8;
    a1[1] = v10;
    a1[2] = v9;
  }
  else
  {
    do
    {
      long long v13 = *(_OWORD *)(v12 - 3);
      *((void *)v8 - 1) = *(v12 - 1);
      *(_OWORD *)(v8 - 24) = v13;
      v8 -= 24;
      *(v12 - 2) = 0;
      *(v12 - 1) = 0;
      *(v12 - 3) = 0;
      v12 -= 3;
    }
    while (v12 != v11);
    char v12 = (void **)*a1;
    uint64_t v14 = (void **)a1[1];
    *a1 = v8;
    a1[1] = v10;
    a1[2] = v9;
    while (v14 != v12)
    {
      if (*((char *)v14 - 1) < 0) {
        operator delete(*(v14 - 3));
      }
      v14 -= 3;
    }
  }
  if (v12) {
    operator delete(v12);
  }
  return v10;
}

void sub_246CC6EDC(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

__n128 sub_246CC6EE8@<Q0>(__n128 *a1@<X1>, __n128 *a2@<X8>)
{
  __n128 result = *a1;
  *a2 = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  a1->n128_u64[1] = 0;
  a1[1].n128_u64[0] = 0;
  a1->n128_u64[0] = 0;
  return result;
}

void sub_246CC6F04(uint64_t *a1@<X1>, std::string *a2@<X8>, int64x2_t a3@<Q3>, int8x16_t a4@<Q5>)
{
}

void sub_246CC6F14(uint64_t a1@<X0>, uint64_t a2@<X1>, const std::string::value_type *a3@<X2>, std::string::size_type a4@<X3>, std::string *a5@<X8>, int64x2_t a6@<Q3>, int8x16_t a7@<Q5>)
{
  int64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3);
  if (v12 <= 1) {
    unint64_t v13 = 1;
  }
  else {
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3);
  }
  uint64_t v14 = (v13 - 1) * a4;
  uint64_t v15 = a2 - a1;
  if (a2 == a1)
  {
    uint64_t v16 = 0;
  }
  else
  {
    if ((unint64_t)(v15 - 24) >= 0x60)
    {
      unint64_t v18 = (v15 - 24) / 0x18uLL + 1;
      uint64_t v19 = v18 & 3;
      if ((v18 & 3) == 0) {
        uint64_t v19 = 4;
      }
      unint64_t v20 = v18 - v19;
      uint64_t v17 = a1 + 24 * v20;
      int v21 = (unsigned __int8 *)(a1 + 47);
      int64x2_t v22 = 0uLL;
      v23.i64[0] = 255;
      v23.i64[1] = 255;
      int64x2_t v24 = 0uLL;
      do
      {
        a6.i8[0] = *(v21 - 24);
        a6.i8[4] = *v21;
        a7.i8[0] = v21[24];
        a7.i8[4] = v21[48];
        uint64_t v25 = (const double *)(v21 - 39);
        float32x4_t v26 = (const double *)(v21 + 9);
        unsigned long long v27 = (unsigned __int128)vld3q_f64(v25);
        unsigned long long v28 = (unsigned __int128)vld3q_f64(v26);
        int32x2_t v29 = vcltz_s32(vshr_n_s32(vshl_n_s32(*(int32x2_t *)a6.i8, 0x18uLL), 0x18uLL));
        v30.i64[0] = v29.i32[0];
        v30.i64[1] = v29.i32[1];
        int8x16_t v31 = v30;
        int32x2_t v32 = vcltz_s32(vshr_n_s32(vshl_n_s32(*(int32x2_t *)a7.i8, 0x18uLL), 0x18uLL));
        v30.i64[0] = v32.i32[0];
        v30.i64[1] = v32.i32[1];
        int8x16_t v33 = v30;
        v30.i64[0] = a6.u32[0];
        v30.i64[1] = a6.u32[1];
        int8x16_t v34 = vbicq_s8(v30, v31);
        v30.i64[0] = a7.u32[0];
        v30.i64[1] = a7.u32[1];
        a6 = (int64x2_t)vorrq_s8(vandq_s8((int8x16_t)v27, v31), vandq_s8(v34, v23));
        a7 = vandq_s8((int8x16_t)v28, v33);
        int64x2_t v22 = vaddq_s64(a6, v22);
        int64x2_t v24 = vaddq_s64((int64x2_t)vorrq_s8(a7, vandq_s8(vbicq_s8(v30, v33), v23)), v24);
        v21 += 96;
        v20 -= 4;
      }
      while (v20);
      uint64_t v16 = vaddvq_s64(vaddq_s64(v24, v22));
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v17 = a1;
    }
    do
    {
      uint64_t v35 = *(unsigned __int8 *)(v17 + 23);
      if ((v35 & 0x80u) != 0) {
        uint64_t v35 = *(void *)(v17 + 8);
      }
      v16 += v35;
      v17 += 24;
    }
    while (v17 != a2);
  }
  a5->__r_.__value_.__r.__words[0] = 0;
  a5->__r_.__value_.__l.__size_ = 0;
  a5->__r_.__value_.__r.__words[2] = 0;
  std::string::reserve(a5, v16 + v14);
  if (v15 >= 1)
  {
    int v36 = *(char *)(a1 + 23);
    v37 = v36 >= 0 ? (const std::string::value_type *)a1 : *(const std::string::value_type **)a1;
    std::string::size_type v38 = v36 >= 0 ? *(unsigned __int8 *)(a1 + 23) : *(void *)(a1 + 8);
    std::string::append(a5, v37, v38);
    if ((unint64_t)v12 >= 2)
    {
      for (uint64_t i = a1 + 24; i != a2; i += 24)
      {
        std::string::append(a5, a3, a4);
        int v40 = *(char *)(i + 23);
        if (v40 >= 0) {
          unint64_t v41 = (const std::string::value_type *)i;
        }
        else {
          unint64_t v41 = *(const std::string::value_type **)i;
        }
        if (v40 >= 0) {
          std::string::size_type v42 = *(unsigned __int8 *)(i + 23);
        }
        else {
          std::string::size_type v42 = *(void *)(i + 8);
        }
        std::string::append(a5, v41, v42);
      }
    }
  }
}

void sub_246CC7124(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_246CC7148(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 128) = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  uint64_t v5 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  char v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
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
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_246CC73F8(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x24C547150](v1);
  _Unwind_Resume(a1);
}

uint64_t sub_246CC742C(uint64_t a1)
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
  MEMORY[0x24C547150](a1 + 128);
  return a1;
}

uint64_t sub_246CC7564(uint64_t a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    p_dst = (long long *)operator new(v7 + 1);
    *((void *)&__dst + 1) = v5;
    unint64_t v12 = v8 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
LABEL_9:
    memcpy(p_dst, __s, v5);
    *((unsigned char *)p_dst + v5) = 0;
    if ((SHIBYTE(v12) & 0x80000000) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v9 = (void *)__dst;
    sub_246CC5E50((unsigned char *)a1, (void *)__dst, *((unint64_t *)&__dst + 1));
    *(unsigned char *)(a1 + 24) = 1;
    *(unsigned char *)(a1 + 32) = 0;
    *(unsigned char *)(a1 + 88) = 0;
    operator delete(v9);
    return a1;
  }
  HIBYTE(v12) = v4;
  p_dst = &__dst;
  if (v4) {
    goto LABEL_9;
  }
  LOBYTE(__dst) = 0;
  if (SHIBYTE(v12) < 0) {
    goto LABEL_10;
  }
LABEL_5:
  *(_OWORD *)a1 = __dst;
  *(void *)(a1 + 16) = v12;
  *(unsigned char *)(a1 + 24) = 1;
  *(unsigned char *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 88) = 0;
  return a1;
}

void sub_246CC767C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_246CC7690(unsigned int a1@<W0>, long long *a2@<X1>, uint64_t a3@<X8>)
{
  v42[2] = *MEMORY[0x263EF8340];
  sub_246CC60FC(__dst, a2);
  uint64_t v8 = std::generic_category();
  sub_246CC60FC(&__p, (long long *)__dst);
  uint64_t v10 = a1;
  if (!v39)
  {
    *(void *)a3 = a1;
    *(void *)(a3 + 8) = v8;
    *(unsigned char *)(a3 + 16) = 0;
    *(unsigned char *)(a3 + 112) = 0;
    goto LABEL_18;
  }
  int v11 = v32;
  if (v32)
  {
    unint64_t v12 = __p;
    v42[0] = v31;
    *(void *)((char *)v42 + 7) = *(void *)((char *)&v31 + 7);
    LOBYTE(a1) = HIBYTE(v31);
    long long v31 = 0uLL;
    __p = 0;
    int v13 = v38;
    if (v38) {
      goto LABEL_4;
    }
  }
  else
  {
    unint64_t v12 = 0;
    int v13 = v38;
    if (v38)
    {
LABEL_4:
      uint64_t v14 = v33;
      v41[0] = v34;
      *(void *)((char *)v41 + 7) = *(void *)((char *)&v34 + 7);
      char v5 = HIBYTE(v34);
      uint64_t v33 = 0;
      long long v34 = 0uLL;
      uint64_t v4 = v35;
      uint64_t v3 = v36;
      v40[0] = v37;
      *(void *)((char *)v40 + 7) = *(void *)((char *)&v37 + 7);
      char v9 = HIBYTE(v37);
      uint64_t v36 = 0;
      long long v37 = 0uLL;
      if (!v32) {
        goto LABEL_11;
      }
      goto LABEL_9;
    }
  }
  uint64_t v14 = 0;
  if (!v32) {
    goto LABEL_11;
  }
LABEL_9:
  if (SHIBYTE(v31) < 0)
  {
    uint64_t v19 = v10;
    unint64_t v20 = v8;
    char v15 = v9;
    operator delete(__p);
    char v9 = v15;
    *(void *)a3 = v19;
    *(void *)(a3 + 8) = v20;
    *(unsigned char *)(a3 + 16) = 0;
    *(unsigned char *)(a3 + 112) = 0;
    uint64_t v16 = (unsigned char *)(a3 + 112);
    *(unsigned char *)(a3 + 40) = 0;
LABEL_12:
    uint64_t v17 = v42[0];
    *(void *)(a3 + 16) = v12;
    *(void *)(a3 + 24) = v17;
    *(void *)(a3 + 31) = *(void *)((char *)v42 + 7);
    *(unsigned char *)(a3 + 39) = a1;
    v42[0] = 0;
    *(void *)((char *)v42 + 7) = 0;
    *(unsigned char *)(a3 + 40) = 1;
    LOBYTE(a1) = 0;
    unint64_t v12 = 0;
    goto LABEL_13;
  }
LABEL_11:
  *(void *)a3 = v10;
  *(void *)(a3 + 8) = v8;
  *(unsigned char *)(a3 + 16) = 0;
  *(unsigned char *)(a3 + 112) = 0;
  uint64_t v16 = (unsigned char *)(a3 + 112);
  *(unsigned char *)(a3 + 40) = 0;
  if (v11) {
    goto LABEL_12;
  }
LABEL_13:
  *(unsigned char *)(a3 + 48) = 0;
  *(unsigned char *)(a3 + 104) = 0;
  if (v13)
  {
    uint64_t v18 = v41[0];
    *(void *)(a3 + 48) = v14;
    *(void *)(a3 + 56) = v18;
    *(void *)(a3 + 63) = *(void *)((char *)v41 + 7);
    *(unsigned char *)(a3 + 71) = v5;
    v41[0] = 0;
    *(void *)((char *)v41 + 7) = 0;
    *(void *)(a3 + 72) = v4;
    *(void *)(a3 + 80) = v3;
    *(void *)(a3 + 88) = v40[0];
    *(void *)(a3 + 95) = *(void *)((char *)v40 + 7);
    *(unsigned char *)(a3 + 103) = v9;
    v40[0] = 0;
    *(void *)((char *)v40 + 7) = 0;
    *(unsigned char *)(a3 + 104) = 1;
  }
  unsigned char *v16 = 1;
  if (v11 && (a1 & 0x80) != 0) {
    operator delete(v12);
  }
LABEL_18:
  if (!v29) {
    return;
  }
  if (!v28) {
    goto LABEL_22;
  }
  if (v27 < 0)
  {
    operator delete(v26);
    if (v25 < 0) {
      goto LABEL_27;
    }
LABEL_22:
    if (!v23) {
      return;
    }
    goto LABEL_23;
  }
  if ((v25 & 0x80000000) == 0) {
    goto LABEL_22;
  }
LABEL_27:
  operator delete(v24);
  if (!v23) {
    return;
  }
LABEL_23:
  if (v22 < 0) {
    operator delete(__dst[0]);
  }
}

void sub_246CC790C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_246CC61B8((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_246CC7924(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24C546FD0](v13, a1);
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
    if (!sub_246CC7AC8(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x24C546FE0](v13);
  return a1;
}

void sub_246CC7A60(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x24C546FE0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x246CC7A40);
}

void sub_246CC7AB4(_Unwind_Exception *a1)
{
}

uint64_t sub_246CC7AC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      size_t v12 = 0;
    }
    else {
      size_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if ((uint64_t)v12 >= 1)
    {
      if (v12 >= 0x7FFFFFFFFFFFFFF8) {
        sub_246CC5D0C();
      }
      if (v12 >= 0x17)
      {
        uint64_t v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v14 = v12 | 7;
        }
        uint64_t v15 = v14 + 1;
        int v13 = (void **)operator new(v14 + 1);
        __b[1] = (void *)v12;
        int64_t v22 = v15 | 0x8000000000000000;
        __b[0] = v13;
      }
      else
      {
        HIBYTE(v22) = v12;
        int v13 = __b;
      }
      memset(v13, __c, v12);
      *((unsigned char *)v13 + v12) = 0;
      if (v22 >= 0) {
        uint64_t v16 = __b;
      }
      else {
        uint64_t v16 = (void **)__b[0];
      }
      uint64_t v17 = (*(uint64_t (**)(uint64_t, void **, size_t))(*(void *)v6 + 96))(v6, v16, v12);
      uint64_t v18 = v17;
      if (SHIBYTE(v22) < 0)
      {
        operator delete(__b[0]);
        if (v18 != v12) {
          return 0;
        }
      }
      else if (v17 != v12)
      {
        return 0;
      }
    }
    uint64_t v19 = a4 - a3;
    if (v19 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v19) == v19)
    {
      *(void *)(a5 + 24) = 0;
      return v6;
    }
    return 0;
  }
  return v6;
}

void sub_246CC7C9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

_DWORD *sub_246CC7CB8(_DWORD ***a1)
{
  return sub_246CC7CD4(**a1, (char *)(*a1)[1]);
}

void sub_246CC7CC4(uint64_t a1, uint64_t a2)
{
}

_DWORD *sub_246CC7CD4(_DWORD *a1, char *__s)
{
  uint64_t v4 = a1[6];
  if (v4 != -1) {
    ((void (*)(char *, _DWORD *))off_26FB3DD88[v4])(&v11, a1);
  }
  a1[6] = -1;
  size_t v5 = strlen(__s);
  if (v5 >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  size_t v6 = v5;
  if (v5 >= 0x17)
  {
    uint64_t v8 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17) {
      uint64_t v8 = v5 | 7;
    }
    uint64_t v9 = v8 + 1;
    uint64_t v7 = operator new(v8 + 1);
    *((void *)a1 + 1) = v6;
    *((void *)a1 + 2) = v9 | 0x8000000000000000;
    *(void *)a1 = v7;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v5;
    uint64_t v7 = a1;
    if (!v5) {
      goto LABEL_11;
    }
  }
  memmove(v7, __s, v6);
LABEL_11:
  *((unsigned char *)v7 + v6) = 0;
  a1[6] = 1;
  return a1;
}

void sub_246CC7DC8(uint64_t *a1, uint64_t a2)
{
  v18[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  *(void *)((char *)v18 + 7) = *(void *)(a2 + 15);
  uint64_t v3 = *(void **)a2;
  v18[0] = *(void *)(a2 + 8);
  char v4 = *(unsigned char *)(a2 + 23);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  int v13 = v3;
  *(void *)uint64_t v14 = v18[0];
  *(void *)&v14[7] = *(void *)((char *)v18 + 7);
  char v15 = v4;
  memset(v18, 0, 15);
  size_t v5 = __p;
  size_t v6 = (const char *)a1[1];
  size_t v7 = strlen(v6);
  if (v7 >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  uint64_t v8 = (void *)v7;
  if (v7 >= 0x17)
  {
    uint64_t v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v10 = v7 | 7;
    }
    uint64_t v11 = v10 + 1;
    size_t v5 = operator new(v10 + 1);
    __p[1] = v8;
    unint64_t v17 = v11 | 0x8000000000000000;
    __p[0] = v5;
LABEL_9:
    memmove(v5, v6, (size_t)v8);
    *((unsigned char *)v8 + (void)v5) = 0;
    uint64_t v9 = *(unsigned int *)(v2 + 24);
    if (v9 == -1) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  HIBYTE(v17) = v7;
  if (v7) {
    goto LABEL_9;
  }
  LOBYTE(__p[0]) = 0;
  uint64_t v9 = *(unsigned int *)(v2 + 24);
  if (v9 != -1) {
LABEL_10:
  }
    ((void (*)(char *, uint64_t))off_26FB3DD88[v9])(&v12, v2);
LABEL_11:
  *(_DWORD *)(v2 + 24) = -1;
  sub_246CC68FC((void *)v2, (uint64_t)&v13, 2uLL);
  *(_DWORD *)(v2 + 24) = 2;
  if ((SHIBYTE(v17) & 0x80000000) == 0)
  {
    if ((v15 & 0x80000000) == 0) {
      return;
    }
LABEL_15:
    operator delete(v13);
    return;
  }
  operator delete(__p[0]);
  if (v15 < 0) {
    goto LABEL_15;
  }
}

void sub_246CC7F80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a2) {
    sub_246CC20E4(exception_object);
  }
  _Unwind_Resume(exception_object);
}

char *sub_246CC7FC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(const char **)(*(void *)a1 + 32);
  char v4 = *(char **)(a2 + 8);
  if ((unint64_t)v4 >= *(void *)(a2 + 16))
  {
    __n128 result = sub_246CC80C0((void **)a2, v3);
    *(void *)(a2 + 8) = result;
    return result;
  }
  size_t v5 = strlen(*(const char **)(*(void *)a1 + 32));
  if (v5 >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  size_t v6 = v5;
  if (v5 >= 0x17)
  {
    uint64_t v9 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17) {
      uint64_t v9 = v5 | 7;
    }
    uint64_t v10 = v9 + 1;
    size_t v7 = operator new(v9 + 1);
    *((void *)v4 + 1) = v6;
    *((void *)v4 + 2) = v10 | 0x8000000000000000;
    *(void *)char v4 = v7;
  }
  else
  {
    v4[23] = v5;
    size_t v7 = v4;
    if (!v5) {
      goto LABEL_11;
    }
  }
  memmove(v7, v3, v6);
LABEL_11:
  *((unsigned char *)v7 + v6) = 0;
  __n128 result = v4 + 24;
  *(void *)(a2 + 8) = v4 + 24;
  *(void *)(a2 + 8) = v4 + 24;
  return result;
}

void sub_246CC80B8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

char *sub_246CC80C0(void **a1, const char *a2)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 3);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_246CC23A4();
  }
  if (0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) > v4) {
    unint64_t v4 = 0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3);
  }
  if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) >= 0x555555555555555) {
    unint64_t v6 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v6 = v4;
  }
  if (v6)
  {
    if (v6 > 0xAAAAAAAAAAAAAAALL) {
      sub_246CC29A0();
    }
    size_t v7 = (char *)operator new(24 * v6);
  }
  else
  {
    size_t v7 = 0;
  }
  uint64_t v8 = &v7[24 * v3];
  int v21 = v8;
  int64_t v22 = v8;
  char v23 = &v7[24 * v6];
  size_t v9 = strlen(a2);
  if (v9 >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  size_t v10 = v9;
  if (v9 >= 0x17)
  {
    uint64_t v15 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17) {
      uint64_t v15 = v9 | 7;
    }
    uint64_t v16 = v15 + 1;
    unint64_t v17 = (char *)operator new(v15 + 1);
    *((void *)v8 + 1) = v10;
    *((void *)v8 + 2) = v16 | 0x8000000000000000;
    *(void *)uint64_t v8 = v17;
    uint64_t v8 = v17;
  }
  else
  {
    v8[23] = v9;
    if (!v9)
    {
      char *v8 = 0;
      uint64_t v11 = v8;
      char v12 = v8 + 24;
      int v13 = (void **)*a1;
      uint64_t v14 = (void **)a1[1];
      if (v14 == *a1) {
        goto LABEL_26;
      }
      goto LABEL_20;
    }
  }
  memmove(v8, a2, v10);
  v8[v10] = 0;
  uint64_t v11 = v21;
  char v12 = v22 + 24;
  int v13 = (void **)*a1;
  uint64_t v14 = (void **)a1[1];
  if (v14 == *a1)
  {
LABEL_26:
    *a1 = v11;
    a1[1] = v12;
    a1[2] = v23;
    goto LABEL_27;
  }
  do
  {
LABEL_20:
    long long v18 = *(_OWORD *)(v14 - 3);
    *((void *)v11 - 1) = *(v14 - 1);
    *(_OWORD *)(v11 - 24) = v18;
    v11 -= 24;
    *(v14 - 2) = 0;
    *(v14 - 1) = 0;
    *(v14 - 3) = 0;
    v14 -= 3;
  }
  while (v14 != v13);
  uint64_t v14 = (void **)*a1;
  uint64_t v19 = (void **)a1[1];
  *a1 = v11;
  a1[1] = v12;
  a1[2] = v23;
  while (v19 != v14)
  {
    if (*((char *)v19 - 1) < 0) {
      operator delete(*(v19 - 3));
    }
    v19 -= 3;
  }
LABEL_27:
  if (v14) {
    operator delete(v14);
  }
  return v12;
}

void sub_246CC82C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_246CC6AC0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_246CC82D4()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v2 = v1;
  unint64_t v4 = v3;
  uint64_t v5 = v0;
  uint64_t v118 = *MEMORY[0x263EF8340];
  sub_246CD49D0(v3, v1, &v101);
  sub_246CD4E08((uint64_t)&v101, v2, (uint64_t)&v90);
  if (v100)
  {
    uint64_t v6 = sub_246CC5AF0((uint64_t)&v90);
    v87 = v2;
    sub_246CCCB6C(&v88, v6);
    int v7 = *v2;
    char v8 = v7 - 8;
    switch(v7)
    {
      case 8:
        goto LABEL_5;
      case 64:
        uint64_t v10 = 0;
        uint64_t v17 = 0;
        unsigned int v18 = 8;
        unsigned int v19 = 5;
        uint64_t v20 = 88;
        goto LABEL_47;
      case 16:
LABEL_5:
        uint64_t v9 = 19;
        uint64_t v10 = 0;
        if (*v2 <= 0xFu) {
          goto LABEL_6;
        }
        break;
      default:
        uint64_t v9 = 9;
        uint64_t v10 = 0;
        if (*v2 <= 0xFu)
        {
LABEL_6:
          if (*v2)
          {
            uint64_t v11 = (uint64_t *)operator new(8uLL);
            *uint64_t v11 = 13;
            goto LABEL_8;
          }
          goto LABEL_33;
        }
        break;
    }
    if (v7 != 16)
    {
      if (v89 != 8 || *(unsigned char *)v88)
      {
        uint64_t v10 = 0;
        unsigned int v18 = 0;
        uint64_t v20 = 8 * v9;
        goto LABEL_43;
      }
      uint64_t v11 = (uint64_t *)operator new(8uLL);
      int v42 = 0;
      uint64_t v43 = 0;
      *uint64_t v11 = 0;
      BOOL v44 = v11;
      do
      {
        uint64_t v46 = 1 << v42;
        if (byte_246CFFABD[v43]) {
          uint64_t v45 = *v44 | v46;
        }
        else {
          uint64_t v45 = *v44 & ~v46;
        }
        *BOOL v44 = v45;
        ++v43;
        v44 += v42 == 63;
        if (v42 == 63) {
          int v42 = 0;
        }
        else {
          ++v42;
        }
      }
      while (v43 != 45);
LABEL_8:
      unsigned int v12 = *v2;
      uint64_t v10 = 1;
      if (v12 <= 0xF)
      {
        if (!*v2) {
          goto LABEL_32;
        }
        int v21 = (uint64_t *)operator new(8uLL);
        *int v21 = 13;
        uint64_t v10 = -5;
      }
      else
      {
        if (v12 == 16 || v12 == 64) {
          goto LABEL_32;
        }
        if (v89 != 8 || *(unsigned char *)v88)
        {
          uint64_t v10 = 1;
LABEL_32:
          operator delete(v11);
          int v7 = *v87;
          goto LABEL_33;
        }
        int v21 = (uint64_t *)operator new(8uLL);
        int v50 = 0;
        uint64_t v51 = 0;
        *int v21 = 0;
        uint64_t v52 = v21;
        do
        {
          uint64_t v54 = 1 << v50;
          if (byte_246CFFABD[v51]) {
            uint64_t v53 = *v52 | v54;
          }
          else {
            uint64_t v53 = *v52 & ~v54;
          }
          *uint64_t v52 = v53;
          ++v51;
          v52 += v50 == 63;
          if (v50 == 63) {
            int v50 = 0;
          }
          else {
            ++v50;
          }
        }
        while (v51 != 45);
        uint64_t v10 = -44;
      }
      operator delete(v21);
      goto LABEL_32;
    }
LABEL_33:
    unsigned int v18 = 8;
    unsigned int v22 = 5;
    if ((v8 & 0xF7) != 0) {
      unsigned int v22 = 8;
    }
    uint64_t v20 = v9 * (unint64_t)v22;
    if (v7 == 8) {
      goto LABEL_38;
    }
    if (v7 != 110)
    {
      if (v7 != 16)
      {
LABEL_39:
        if (v7 == 8)
        {
          uint64_t v17 = -6;
        }
        else
        {
          if (v7 != 16)
          {
            uint64_t v17 = 0;
            unsigned int v19 = 5;
            goto LABEL_47;
          }
          uint64_t v17 = 0;
        }
        unsigned int v19 = 9;
LABEL_47:
        unint64_t v23 = v20 + v10 + v17 + v18 * (unint64_t)v19;
        unint64_t v24 = (v23 + 7) >> 3;
        unint64_t v25 = v4[1] - *v4;
        if (v25 > v24)
        {
          int v105 = -1;
          v103 = operator new(0x20uLL);
          long long v104 = xmmword_246CFEF60;
          strcpy((char *)v103, "Invalid message length: ");
          int v105 = 1;
          std::to_string(&__dst, v25);
          *(void *)&long long __src = &v103;
          *((void *)&__src + 1) = &__dst;
          *(void *)&long long __p = &v103;
          *((void *)&__p + 1) = &__dst;
          p_dst = &__dst;
          if (v105 == -1) {
            sub_246CC66F0();
          }
          *(void *)&long long v65 = &__src;
          ((void (*)(long long *, void **))off_26FB3DDA0[v105])(&v65, &v103);
          if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__dst.__r_.__value_.__l.__data_);
          }
          *(void *)&long long __src = &v103;
          *((void *)&__src + 1) = " (max supported: ";
          *(void *)&long long __p = &v103;
          *((void *)&__p + 1) = " (max supported: ";
          p_dst = (std::string *)" (max supported: ";
          if (v105 == -1) {
            sub_246CC66F0();
          }
          __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)&__src;
          ((void (*)(std::string *, void **))off_26FB3DDE8[v105])(&__dst, &v103);
          std::to_string(&__dst, v24);
          *(void *)&long long __src = &v103;
          *((void *)&__src + 1) = &__dst;
          *(void *)&long long __p = &v103;
          *((void *)&__p + 1) = &__dst;
          p_dst = &__dst;
          if (v105 == -1) {
            sub_246CC66F0();
          }
          *(void *)&long long v65 = &__src;
          ((void (*)(long long *, void **))off_26FB3DDA0[v105])(&v65, &v103);
          if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__dst.__r_.__value_.__l.__data_);
          }
          *(void *)&long long __src = &v103;
          *((void *)&__src + 1) = ")";
          *(void *)&long long __p = &v103;
          *((void *)&__p + 1) = ")";
          p_dst = (std::string *)")";
          if (v105 == -1) {
            sub_246CC66F0();
          }
          __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)&__src;
          ((void (*)(std::string *, void **))off_26FB3DE00[v105])(&__dst, &v103);
          if (v105 == -1) {
            sub_246CC66F0();
          }
          *(void *)&long long __src = &__dst;
          ((void (*)(long long *__return_ptr, long long *, void **))off_26FB3DDD0[v105])(&v85, &__src, &v103);
          if (v105 != -1) {
            ((void (*)(long long *, void **))off_26FB3DDB8[v105])(&__src, &v103);
          }
          if (SHIBYTE(v86) < 0)
          {
            sub_246CC5E50(&v76, (void *)v85, *((unint64_t *)&v85 + 1));
          }
          else
          {
            long long v76 = v85;
            uint64_t v77 = v86;
          }
          char v78 = 1;
          LOBYTE(v79) = 0;
          char v83 = 0;
          char v84 = 1;
          sub_246CC7690(0x16u, &v76, (uint64_t)&__src);
          *(_OWORD *)uint64_t v5 = __src;
          *(unsigned char *)(v5 + 16) = 0;
          *(unsigned char *)(v5 + 112) = 0;
          if (v117)
          {
            *(unsigned char *)(v5 + 40) = 0;
            int v33 = v110;
            if (v110)
            {
              *(_OWORD *)(v5 + 16) = __p;
              *(void *)(v5 + 32) = p_dst;
              p_dst = 0;
              long long __p = 0uLL;
              *(unsigned char *)(v5 + 40) = 1;
            }
            *(unsigned char *)(v5 + 48) = 0;
            *(unsigned char *)(v5 + 104) = 0;
            if (v116)
            {
              uint64_t v34 = v113;
              *(void *)(v5 + 64) = v112;
              *(_OWORD *)(v5 + 48) = v111;
              long long v111 = 0uLL;
              *(void *)(v5 + 72) = v34;
              *(_OWORD *)(v5 + 80) = v114;
              *(void *)(v5 + 96) = v115;
              uint64_t v112 = 0;
              long long v114 = 0uLL;
              uint64_t v115 = 0;
              *(unsigned char *)(v5 + 104) = 1;
            }
            *(unsigned char *)(v5 + 112) = 1;
            *(unsigned char *)(v5 + 120) = 0;
            if (v33 && SHIBYTE(p_dst) < 0) {
              operator delete((void *)__p);
            }
            if (!v84) {
              goto LABEL_99;
            }
          }
          else
          {
            *(unsigned char *)(v5 + 120) = 0;
            if (!v84)
            {
LABEL_99:
              if ((SHIBYTE(v86) & 0x80000000) == 0) {
                goto LABEL_163;
              }
              uint64_t v35 = (void *)v85;
              goto LABEL_162;
            }
          }
          if (v83)
          {
            if (v82 < 0) {
              operator delete(v81);
            }
            if (v80 < 0) {
              operator delete(v79);
            }
          }
          if (v78 && SHIBYTE(v77) < 0) {
            operator delete((void *)v76);
          }
          goto LABEL_99;
        }
        if (v25 < v24 && ((int v26 = *v2, v26 == 110) || v26 == 8))
        {
          sub_246CC7564((uint64_t)&v67, "Please pad data with extra 0!");
          char v75 = 1;
          sub_246CC7690(0x16u, &v67, (uint64_t)&__src);
          *(_OWORD *)uint64_t v5 = __src;
          *(unsigned char *)(v5 + 16) = 0;
          *(unsigned char *)(v5 + 112) = 0;
          if (v117)
          {
            *(unsigned char *)(v5 + 40) = 0;
            int v27 = v110;
            if (v110)
            {
              *(_OWORD *)(v5 + 16) = __p;
              *(void *)(v5 + 32) = p_dst;
              p_dst = 0;
              long long __p = 0uLL;
              *(unsigned char *)(v5 + 40) = 1;
            }
            *(unsigned char *)(v5 + 48) = 0;
            *(unsigned char *)(v5 + 104) = 0;
            if (v116)
            {
              uint64_t v28 = v113;
              *(void *)(v5 + 64) = v112;
              *(_OWORD *)(v5 + 48) = v111;
              long long v111 = 0uLL;
              *(void *)(v5 + 72) = v28;
              *(_OWORD *)(v5 + 80) = v114;
              *(void *)(v5 + 96) = v115;
              uint64_t v112 = 0;
              long long v114 = 0uLL;
              uint64_t v115 = 0;
              *(unsigned char *)(v5 + 104) = 1;
            }
            *(unsigned char *)(v5 + 112) = 1;
            *(unsigned char *)(v5 + 120) = 0;
            if (v27 && SHIBYTE(p_dst) < 0) {
              operator delete((void *)__p);
            }
          }
          else
          {
            *(unsigned char *)(v5 + 120) = 0;
          }
          if (v75)
          {
            if (v74)
            {
              if (v73 < 0) {
                operator delete(v72);
              }
              if (v71 < 0) {
                operator delete(v70);
              }
            }
            if (v69 && v68 < 0)
            {
              uint64_t v35 = (void *)v67;
LABEL_162:
              operator delete(v35);
            }
          }
        }
        else
        {
          if (v23 >= v102) {
            unint64_t v23 = v102;
          }
          unint64_t v29 = v23 - *((void *)&v90 + 1);
          if ((uint64_t)v102 >= (uint64_t)(v23 - *((void *)&v90 + 1))) {
            unint64_t v30 = v23 - *((void *)&v90 + 1);
          }
          else {
            unint64_t v30 = v102;
          }
          uint64_t v31 = v102 - v30;
          if (v31 < 0)
          {
            uint64_t v36 = v31 - 63;
            if (v31 - 63 < 0) {
              uint64_t v36 = v31;
            }
            uint64_t v32 = v36 >> 6;
          }
          else
          {
            uint64_t v32 = (unint64_t)v31 >> 6;
          }
          uint64_t v86 = 0;
          long long v85 = 0uLL;
          uint64_t v37 = v31 & 0x3F;
          *(void *)&long long __src = (char *)v101 + 8 * v32;
          DWORD2(__src) = v37;
          v103 = (char *)v101 + 8 * (v102 >> 6);
          LODWORD(v104) = v102 & 0x3F;
          sub_246CCC7E8(&v85, (uint64_t)&__src, (uint64_t)&v103, (v102 & 0x3F) - v37 + 8 * (8 * (v102 >> 6) - 8 * v32));
          unint64_t v38 = *((void *)&v90 + 1);
          unint64_t v39 = v102 - v29;
          if (*((void *)&v90 + 1) == v102 - v29)
          {
LABEL_108:
            uint64_t v41 = sub_246CC5AF0((uint64_t)&v90);
            sub_246CD3BA8((uint64_t)&v85, v41, &v87, &v65);
            operator new();
          }
          unint64_t v40 = *((void *)&v90 + 1);
          while (((*(void *)((char *)v101 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v40) & 1) == 0)
          {
            if (v39 == ++v40) {
              goto LABEL_108;
            }
          }
          int v105 = -1;
          v103 = operator new(0x30uLL);
          long long v104 = xmmword_246CFEF10;
          strcpy((char *)v103, "Dangerous message found! The bits from index ");
          int v105 = 1;
          std::to_string(&__dst, v38);
          *(void *)&long long __src = &v103;
          *((void *)&__src + 1) = &__dst;
          *(void *)&long long __p = &v103;
          *((void *)&__p + 1) = &__dst;
          p_dst = &__dst;
          if (v105 == -1) {
            sub_246CC66F0();
          }
          p_src = &__src;
          ((void (*)(void **, void **))off_26FB3DDA0[v105])(&p_src, &v103);
          if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__dst.__r_.__value_.__l.__data_);
          }
          *(void *)&long long __src = &v103;
          *((void *)&__src + 1) = " to ";
          *(void *)&long long __p = &v103;
          *((void *)&__p + 1) = " to ";
          p_dst = (std::string *)" to ";
          if (v105 == -1) {
            sub_246CC66F0();
          }
          __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)&__src;
          ((void (*)(std::string *, void **))off_26FB3DE18[v105])(&__dst, &v103);
          std::to_string(&__dst, v39);
          *(void *)&long long __src = &v103;
          *((void *)&__src + 1) = &__dst;
          *(void *)&long long __p = &v103;
          *((void *)&__p + 1) = &__dst;
          p_dst = &__dst;
          if (v105 == -1) {
            sub_246CC66F0();
          }
          p_src = &__src;
          ((void (*)(void **, void **))off_26FB3DDA0[v105])(&p_src, &v103);
          if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__dst.__r_.__value_.__l.__data_);
          }
          *(void *)&long long __src = &v103;
          *((void *)&__src + 1) = " are not all zero which means they'll be erased";
          *(void *)&long long __p = &v103;
          *((void *)&__p + 1) = " are not all zero which means they'll be erased";
          p_dst = (std::string *)" are not all zero which means they'll be erased";
          if (v105 == -1) {
            sub_246CC66F0();
          }
          __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)&__src;
          ((void (*)(std::string *, void **))off_26FB3DE30[v105])(&__dst, &v103);
          if (v105 == -1) {
            sub_246CC66F0();
          }
          *(void *)&long long __src = &__dst;
          ((void (*)(long long *__return_ptr, long long *, void **))off_26FB3DDD0[v105])(&v65, &__src, &v103);
          if (v105 != -1) {
            ((void (*)(long long *, void **))off_26FB3DDB8[v105])(&__src, &v103);
          }
          if (SHIBYTE(v66) < 0)
          {
            sub_246CC5E50(&v56, (void *)v65, *((unint64_t *)&v65 + 1));
          }
          else
          {
            long long v56 = v65;
            uint64_t v57 = v66;
          }
          char v58 = 1;
          LOBYTE(v59) = 0;
          char v63 = 0;
          char v64 = 1;
          sub_246CC7690(1u, &v56, (uint64_t)&__src);
          *(_OWORD *)uint64_t v5 = __src;
          *(unsigned char *)(v5 + 16) = 0;
          *(unsigned char *)(v5 + 112) = 0;
          if (v117)
          {
            *(unsigned char *)(v5 + 40) = 0;
            int v47 = v110;
            if (v110)
            {
              *(_OWORD *)(v5 + 16) = __p;
              *(void *)(v5 + 32) = p_dst;
              p_dst = 0;
              long long __p = 0uLL;
              *(unsigned char *)(v5 + 40) = 1;
            }
            *(unsigned char *)(v5 + 48) = 0;
            *(unsigned char *)(v5 + 104) = 0;
            if (v116)
            {
              uint64_t v48 = v113;
              *(void *)(v5 + 64) = v112;
              *(_OWORD *)(v5 + 48) = v111;
              long long v111 = 0uLL;
              *(void *)(v5 + 72) = v48;
              *(_OWORD *)(v5 + 80) = v114;
              *(void *)(v5 + 96) = v115;
              uint64_t v112 = 0;
              long long v114 = 0uLL;
              uint64_t v115 = 0;
              *(unsigned char *)(v5 + 104) = 1;
            }
            *(unsigned char *)(v5 + 112) = 1;
            *(unsigned char *)(v5 + 120) = 0;
            if (v47 && SHIBYTE(p_dst) < 0) {
              operator delete((void *)__p);
            }
          }
          else
          {
            *(unsigned char *)(v5 + 120) = 0;
          }
          if (v64)
          {
            if (v63)
            {
              if (v62 < 0) {
                operator delete(v61);
              }
              if (v60 < 0) {
                operator delete(v59);
              }
            }
            if (v58 && SHIBYTE(v57) < 0) {
              operator delete((void *)v56);
            }
          }
          if (SHIBYTE(v66) < 0) {
            operator delete((void *)v65);
          }
          uint64_t v35 = (void *)v85;
          if ((void)v85) {
            goto LABEL_162;
          }
        }
LABEL_163:
        uint64_t v16 = v88;
        if (!v88) {
          goto LABEL_165;
        }
        goto LABEL_164;
      }
LABEL_38:
      unsigned int v18 = 6;
      goto LABEL_39;
    }
    unsigned int v18 = 0;
LABEL_43:
    uint64_t v17 = 0;
    unsigned int v19 = 0;
    goto LABEL_47;
  }
  long long __src = v90;
  int v13 = sub_246CC60FC(&__p, &v91);
  *(_OWORD *)uint64_t v5 = __src;
  *(unsigned char *)(v5 + 16) = 0;
  *(unsigned char *)(v5 + 112) = 0;
  if (!v117)
  {
    *(unsigned char *)(v5 + 120) = 0;
    goto LABEL_165;
  }
  *(unsigned char *)(v5 + 40) = 0;
  int v14 = v110;
  if (v110)
  {
    *(_OWORD *)(v5 + 16) = *(_OWORD *)v13;
    *(void *)(v5 + 32) = *((void *)v13 + 2);
    *((void *)v13 + 1) = 0;
    *((void *)v13 + 2) = 0;
    *(void *)int v13 = 0;
    *(unsigned char *)(v5 + 40) = 1;
  }
  *(unsigned char *)(v5 + 48) = 0;
  *(unsigned char *)(v5 + 104) = 0;
  if (v116)
  {
    uint64_t v15 = v113;
    *(void *)(v5 + 64) = v112;
    *(_OWORD *)(v5 + 48) = v111;
    long long v111 = 0uLL;
    *(void *)(v5 + 72) = v15;
    *(_OWORD *)(v5 + 80) = v114;
    *(void *)(v5 + 96) = v115;
    uint64_t v112 = 0;
    long long v114 = 0uLL;
    uint64_t v115 = 0;
    *(unsigned char *)(v5 + 104) = 1;
  }
  *(unsigned char *)(v5 + 112) = 1;
  *(unsigned char *)(v5 + 120) = 0;
  if (v14 && SHIBYTE(p_dst) < 0)
  {
    uint64_t v16 = (void *)__p;
LABEL_164:
    operator delete(v16);
  }
LABEL_165:
  if (v100)
  {
    uint64_t v49 = (void *)v90;
    if (!(void)v90) {
      goto LABEL_178;
    }
LABEL_177:
    operator delete(v49);
    goto LABEL_178;
  }
  if (v99)
  {
    if (v98)
    {
      if (v97 < 0) {
        operator delete(v96);
      }
      if (v95 < 0) {
        operator delete(v94);
      }
    }
    if (v93 && v92 < 0)
    {
      uint64_t v49 = (void *)v91;
      goto LABEL_177;
    }
  }
LABEL_178:
  if (v101) {
    operator delete(v101);
  }
}

void sub_246CCAA70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,void *a55,void *a56,uint64_t a57,void *a58)
{
  sub_246CC61B8((uint64_t)&a24);
  unint64_t v59 = (void *)STACK[0x890];
  if (STACK[0x890])
  {
    STACK[0x898] = (unint64_t)v59;
    operator delete(v59);
  }
  if (a39) {
    operator delete(a39);
  }
  if (a55)
  {
    a56 = a55;
    operator delete(a55);
  }
  if (a58) {
    operator delete(a58);
  }
  char v60 = (void *)STACK[0x208];
  if (STACK[0x208])
  {
    STACK[0x210] = (unint64_t)v60;
    operator delete(v60);
  }
  if (STACK[0x220]) {
    operator delete((void *)STACK[0x220]);
  }
  if (STACK[0x238]) {
    operator delete((void *)STACK[0x238]);
  }
  sub_246CFABD8(&STACK[0x250]);
  sub_246CFABD8(&STACK[0x258]);
  if (STACK[0x2D0]) {
    operator delete((void *)STACK[0x2D0]);
  }
  if (STACK[0x3C0]) {
    operator delete((void *)STACK[0x3C0]);
  }
  if (STACK[0x3E0]) {
    operator delete((void *)STACK[0x3E0]);
  }
  sub_246CC5BBC((uint64_t)&STACK[0x3F8]);
  if (!STACK[0x478]) {
    _Unwind_Resume(a1);
  }
  operator delete((void *)STACK[0x478]);
  _Unwind_Resume(a1);
}

uint64_t sub_246CCAE98(uint64_t result, uint64_t a2)
{
  *(_OWORD *)__n128 result = *(_OWORD *)a2;
  *(unsigned char *)(result + 16) = 0;
  *(unsigned char *)(result + 112) = 0;
  if (*(unsigned char *)(a2 + 112))
  {
    *(unsigned char *)(result + 40) = 0;
    if (*(unsigned char *)(a2 + 40))
    {
      long long v2 = *(_OWORD *)(a2 + 16);
      *(void *)(result + 32) = *(void *)(a2 + 32);
      *(_OWORD *)(result + 16) = v2;
      *(void *)(a2 + 24) = 0;
      *(void *)(a2 + 32) = 0;
      *(void *)(a2 + 16) = 0;
      *(unsigned char *)(result + 40) = 1;
    }
    *(unsigned char *)(result + 48) = 0;
    *(unsigned char *)(result + 104) = 0;
    if (*(unsigned char *)(a2 + 104))
    {
      long long v3 = *(_OWORD *)(a2 + 48);
      *(void *)(result + 64) = *(void *)(a2 + 64);
      *(_OWORD *)(result + 48) = v3;
      *(void *)(a2 + 56) = 0;
      *(void *)(a2 + 64) = 0;
      *(void *)(a2 + 48) = 0;
      *(void *)(result + 72) = *(void *)(a2 + 72);
      long long v4 = *(_OWORD *)(a2 + 80);
      *(void *)(result + 96) = *(void *)(a2 + 96);
      *(_OWORD *)(result + 80) = v4;
      *(void *)(a2 + 88) = 0;
      *(void *)(a2 + 96) = 0;
      *(void *)(a2 + 80) = 0;
      *(unsigned char *)(result + 104) = 1;
    }
    *(unsigned char *)(result + 112) = 1;
  }
  *(unsigned char *)(result + 120) = 0;
  return result;
}

void sub_246CCAF48(uint64_t a1, unsigned int a2, long long *a3)
{
  v42[2] = *MEMORY[0x263EF8340];
  sub_246CC60FC(__dst, a3);
  char v8 = sub_246CCE33C();
  sub_246CC60FC(&__p, (long long *)__dst);
  uint64_t v10 = a2;
  if (!v39)
  {
    *(void *)a1 = a2;
    *(void *)(a1 + 8) = v8;
    *(unsigned char *)(a1 + 16) = 0;
    *(unsigned char *)(a1 + 112) = 0;
    goto LABEL_18;
  }
  int v11 = v32;
  if (v32)
  {
    unsigned int v12 = __p;
    v42[0] = v31;
    *(void *)((char *)v42 + 7) = *(void *)((char *)&v31 + 7);
    LOBYTE(a2) = HIBYTE(v31);
    long long v31 = 0uLL;
    long long __p = 0;
    int v13 = v38;
    if (v38) {
      goto LABEL_4;
    }
  }
  else
  {
    unsigned int v12 = 0;
    int v13 = v38;
    if (v38)
    {
LABEL_4:
      uint64_t v14 = v33;
      v41[0] = v34;
      *(void *)((char *)v41 + 7) = *(void *)((char *)&v34 + 7);
      char v5 = HIBYTE(v34);
      uint64_t v33 = 0;
      long long v34 = 0uLL;
      uint64_t v4 = v35;
      uint64_t v3 = v36;
      v40[0] = v37;
      *(void *)((char *)v40 + 7) = *(void *)((char *)&v37 + 7);
      char v9 = HIBYTE(v37);
      uint64_t v36 = 0;
      long long v37 = 0uLL;
      if (!v32) {
        goto LABEL_11;
      }
      goto LABEL_9;
    }
  }
  uint64_t v14 = 0;
  if (!v32) {
    goto LABEL_11;
  }
LABEL_9:
  if (SHIBYTE(v31) < 0)
  {
    uint64_t v19 = v10;
    uint64_t v20 = v8;
    char v15 = v9;
    operator delete(__p);
    char v9 = v15;
    *(void *)a1 = v19;
    *(void *)(a1 + 8) = v20;
    *(unsigned char *)(a1 + 16) = 0;
    *(unsigned char *)(a1 + 112) = 0;
    uint64_t v16 = (unsigned char *)(a1 + 112);
    *(unsigned char *)(a1 + 40) = 0;
LABEL_12:
    uint64_t v17 = v42[0];
    *(void *)(a1 + 16) = v12;
    *(void *)(a1 + 24) = v17;
    *(void *)(a1 + 31) = *(void *)((char *)v42 + 7);
    *(unsigned char *)(a1 + 39) = a2;
    v42[0] = 0;
    *(void *)((char *)v42 + 7) = 0;
    *(unsigned char *)(a1 + 40) = 1;
    LOBYTE(a2) = 0;
    unsigned int v12 = 0;
    goto LABEL_13;
  }
LABEL_11:
  *(void *)a1 = v10;
  *(void *)(a1 + 8) = v8;
  *(unsigned char *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 112) = 0;
  uint64_t v16 = (unsigned char *)(a1 + 112);
  *(unsigned char *)(a1 + 40) = 0;
  if (v11) {
    goto LABEL_12;
  }
LABEL_13:
  *(unsigned char *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 104) = 0;
  if (v13)
  {
    uint64_t v18 = v41[0];
    *(void *)(a1 + 48) = v14;
    *(void *)(a1 + 56) = v18;
    *(void *)(a1 + 63) = *(void *)((char *)v41 + 7);
    *(unsigned char *)(a1 + 71) = v5;
    v41[0] = 0;
    *(void *)((char *)v41 + 7) = 0;
    *(void *)(a1 + 72) = v4;
    *(void *)(a1 + 80) = v3;
    *(void *)(a1 + 88) = v40[0];
    *(void *)(a1 + 95) = *(void *)((char *)v40 + 7);
    *(unsigned char *)(a1 + 103) = v9;
    v40[0] = 0;
    *(void *)((char *)v40 + 7) = 0;
    *(unsigned char *)(a1 + 104) = 1;
  }
  unsigned char *v16 = 1;
  if (v11 && (a2 & 0x80) != 0) {
    operator delete(v12);
  }
LABEL_18:
  if (!v29) {
    return;
  }
  if (!v28) {
    goto LABEL_22;
  }
  if (v27 < 0)
  {
    operator delete(v26);
    if (v25 < 0) {
      goto LABEL_27;
    }
LABEL_22:
    if (!v23) {
      return;
    }
    goto LABEL_23;
  }
  if ((v25 & 0x80000000) == 0) {
    goto LABEL_22;
  }
LABEL_27:
  operator delete(v24);
  if (!v23) {
    return;
  }
LABEL_23:
  if (v22 < 0) {
    operator delete(__dst[0]);
  }
}

void sub_246CCB1CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_246CC61B8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_246CCB1E0(uint64_t *a1, unsigned char *a2)
{
  unint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  if (v4 == v5 << 6)
  {
    if ((uint64_t)(v4 + 1) < 0) {
      sub_246CC23A4();
    }
    unint64_t v6 = v5 << 7;
    if (v6 <= (v4 & 0xFFFFFFFFFFFFFFC0) + 64) {
      unint64_t v6 = (v4 & 0xFFFFFFFFFFFFFFC0) + 64;
    }
    if (v4 <= 0x3FFFFFFFFFFFFFFELL) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    sub_246CCB294((uint64_t)a1, v7);
    unint64_t v4 = a1[1];
  }
  a1[1] = v4 + 1;
  uint64_t v8 = *a1;
  unint64_t v9 = v4 >> 6;
  uint64_t v10 = 1 << v4;
  if (*a2) {
    uint64_t v11 = *(void *)(v8 + 8 * v9) | v10;
  }
  else {
    uint64_t v11 = *(void *)(v8 + 8 * v9) & ~v10;
  }
  *(void *)(v8 + 8 * v9) = v11;
}

void sub_246CCB294(uint64_t a1, unint64_t a2)
{
  if (a2 > *(void *)(a1 + 16) << 6)
  {
    if ((a2 & 0x8000000000000000) != 0) {
      sub_246CC23A4();
    }
    unint64_t v3 = ((a2 - 1) >> 6) + 1;
    unint64_t v4 = (uint64_t *)operator new(8 * v3);
    uint64_t v5 = *(void **)a1;
    unint64_t v6 = *(void *)(a1 + 8);
    int v7 = v6 & 0x3F;
    unint64_t v8 = (v6 - 1) >> 6;
    if (v6 < 0x41) {
      unint64_t v8 = 0;
    }
    v4[v8] = 0;
    if (v6 > 0x3F || (v6 & 0x3F) != 0)
    {
      int v9 = 0;
      int v10 = 0;
      uint64_t v11 = &v5[v6 >> 6];
      unsigned int v12 = v4;
      int v13 = v5;
      do
      {
        uint64_t v14 = 1 << v9;
        if ((*v13 >> v10)) {
          uint64_t v15 = *v12 | v14;
        }
        else {
          uint64_t v15 = *v12 & ~v14;
        }
        uint64_t *v12 = v15;
        v13 += v10 == 63;
        if (v10 == 63) {
          int v10 = 0;
        }
        else {
          ++v10;
        }
        v12 += v9 == 63;
        if (v9 == 63) {
          int v9 = 0;
        }
        else {
          ++v9;
        }
      }
      while (v10 != v7 || v13 != v11);
    }
    *(void *)a1 = v4;
    *(void *)(a1 + 16) = v3;
    if (v5)
    {
      operator delete(v5);
    }
  }
}

void sub_246CCB3A8(uint64_t *a1, unint64_t a2, uint64_t *a3)
{
  sub_246CCE074(a1, 0, &a1[a2 >> 6], a2 & 0x3F, a3, &v3);
}

void sub_246CCB3EC(uint64_t a1, uint64_t *a2)
{
  long long v2 = *(uint64_t **)a1;
  int v3 = *(_DWORD *)(a1 + 8);
  unint64_t v4 = *(uint64_t **)(a1 + 16);
  int v5 = *(_DWORD *)(a1 + 24);
  if (*(uint64_t **)a1 != v4 || v3 != v5)
  {
    do
    {
      uint64_t v8 = *v2;
      unint64_t v9 = a2[1];
      uint64_t v10 = a2[2];
      if (v9 == v10 << 6)
      {
        if ((uint64_t)(v9 + 1) < 0) {
          sub_246CC23A4();
        }
        unint64_t v11 = v10 << 7;
        if (v11 <= (v9 & 0xFFFFFFFFFFFFFFC0) + 64) {
          unint64_t v11 = (v9 & 0xFFFFFFFFFFFFFFC0) + 64;
        }
        if (v9 <= 0x3FFFFFFFFFFFFFFELL) {
          unint64_t v12 = v11;
        }
        else {
          unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
        }
        sub_246CCB294((uint64_t)a2, v12);
        unint64_t v9 = a2[1];
      }
      a2[1] = v9 + 1;
      uint64_t v13 = *a2;
      unint64_t v14 = v9 >> 6;
      uint64_t v15 = 1 << v9;
      if (((1 << v3) & v8) != 0) {
        uint64_t v16 = *(void *)(v13 + 8 * v14) | v15;
      }
      else {
        uint64_t v16 = *(void *)(v13 + 8 * v14) & ~v15;
      }
      *(void *)(v13 + 8 * v14) = v16;
      v2 += v3 == 63;
      if (v3 == 63) {
        int v3 = 0;
      }
      else {
        ++v3;
      }
    }
    while (v2 != v4 || v3 != v5);
  }
}

void sub_246CCB4F4(uint64_t a1, unint64_t a2, size_t __len)
{
  unint64_t v4 = *(void *)(a1 + 8);
  unint64_t v5 = a2 - v4;
  if (a2 <= v4)
  {
    *(void *)(a1 + 8) = a2;
    return;
  }
  int v6 = __len;
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v8 = v7 << 6;
  if (v7 << 6 < v5 || v4 > (v7 << 6) - v5)
  {
    std::string __dst = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    if ((a2 & 0x8000000000000000) != 0) {
      sub_246CC23A4();
    }
    unint64_t v10 = v7 << 7;
    if (v10 <= ((a2 + 63) & 0xFFFFFFFFFFFFFFC0)) {
      unint64_t v10 = (a2 + 63) & 0xFFFFFFFFFFFFFFC0;
    }
    if (v8 <= 0x3FFFFFFFFFFFFFFELL) {
      unint64_t v11 = v10;
    }
    else {
      unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    sub_246CCB294((uint64_t)&__dst, v11);
    unint64_t v12 = *(void **)a1;
    uint64_t v13 = *(void *)(a1 + 8);
    unint64_t v14 = v13 + v5;
    uint64_t v24 = v13 + v5;
    uint64_t v15 = (char *)__dst;
    if (v13 < 1)
    {
      LODWORD(v17) = 0;
      uint64_t v16 = (char *)__dst;
    }
    else
    {
      unint64_t v17 = (unint64_t)v13 >> 6;
      if ((unint64_t)v13 >= 0x40) {
        memmove(__dst, v12, 8 * v17);
      }
      uint64_t v16 = &v15[8 * v17];
      if ((v13 & 0x3F) != 0)
      {
        *(void *)uint64_t v16 = *(void *)v16 & ~(0xFFFFFFFFFFFFFFFFLL >> -(v13 & 0x3F)) | *((void *)v12 + v17) & (0xFFFFFFFFFFFFFFFFLL >> -(v13 & 0x3F));
        LODWORD(v17) = v13 & 0x3F;
      }
      else
      {
        LODWORD(v17) = 0;
      }
      unint64_t v12 = *(void **)a1;
      uint64_t v13 = *(void *)(a1 + 8);
      uint64_t v15 = (char *)__dst;
      unint64_t v14 = v24;
    }
    *(void *)a1 = v15;
    *(void *)(a1 + 8) = v14;
    std::string __dst = v12;
    uint64_t v24 = v13;
    uint64_t v18 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25;
    uint64_t v25 = v18;
    if (v12) {
      operator delete(v12);
    }
  }
  else
  {
    uint64_t v16 = (char *)(*(void *)a1 + 8 * (v4 >> 6));
    unint64_t v17 = *(void *)(a1 + 8) & 0x3FLL;
    *(void *)(a1 + 8) = a2;
  }
  if (v5)
  {
    if (v6)
    {
      if (v17)
      {
        if ((64 - v17) >= v5) {
          unint64_t v19 = v5;
        }
        else {
          unint64_t v19 = (64 - v17);
        }
        *(void *)v16 |= (0xFFFFFFFFFFFFFFFFLL >> (64 - v17 - v19)) & (-1 << v17);
        v16 += 8;
        v5 -= v19;
      }
      uint64_t v20 = 8 * (v5 >> 6);
      if (v5 >= 0x40) {
        memset(v16, 255, 8 * (v5 >> 6));
      }
      if ((v5 & 0x3F) != 0)
      {
        unint64_t v21 = *(void *)&v16[v20] | (0xFFFFFFFFFFFFFFFFLL >> -(v5 & 0x3F));
LABEL_44:
        *(void *)&v16[v20] = v21;
      }
    }
    else
    {
      if (v17)
      {
        if ((64 - v17) >= v5) {
          unint64_t v22 = v5;
        }
        else {
          unint64_t v22 = (64 - v17);
        }
        *(void *)v16 &= ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v17 - v22)) & (-1 << v17));
        v16 += 8;
        v5 -= v22;
      }
      uint64_t v20 = 8 * (v5 >> 6);
      if (v5 >= 0x40) {
        bzero(v16, 8 * (v5 >> 6));
      }
      if ((v5 & 0x3F) != 0)
      {
        unint64_t v21 = *(void *)&v16[v20] & ~(0xFFFFFFFFFFFFFFFFLL >> -(v5 & 0x3F));
        goto LABEL_44;
      }
    }
  }
}

void sub_246CCB758(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double sub_246CCB770(uint64_t a1, uint64_t *a2, uint64_t **a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = HIDWORD(*a2);
  unsigned int v8 = *a2;
  unint64_t v9 = *a3;
  unint64_t v10 = a3[1];
  uint64_t v11 = v10 - *a3;
  uint64_t v23 = 0;
  unint64_t v12 = v11 + v7 * (unint64_t)v8;
  long long v22 = 0uLL;
  if (v12)
  {
    if (v12 >> 61) {
      sub_246CC23A4();
    }
    *(void *)&long long v22 = operator new(8 * v12);
    *((void *)&v22 + 1) = v22;
    uint64_t v23 = v22 + 8 * v12;
  }
  unint64_t v13 = a2[1];
  unint64_t v14 = (uint64_t *)a2[5];
  uint64_t i = &v22;
  if (HIDWORD(v13) * v7)
  {
    int v15 = 0;
    uint64_t v16 = &v14[(HIDWORD(v13) * v7)];
    unint64_t v17 = v13;
    unint64_t v18 = HIDWORD(v13) + v13 - (v13 * v6);
    do
    {
      sub_246CCCC78((uint64_t *)&i, *v14);
      int v19 = v15 + 1;
      if (v15 + 1 == v6) {
        int v15 = 0;
      }
      else {
        ++v15;
      }
      if (v19 == v6) {
        unint64_t v20 = v18;
      }
      else {
        unint64_t v20 = v17;
      }
      v14 += v20;
    }
    while (v14 != v16);
    unint64_t v9 = *a3;
    unint64_t v10 = a3[1];
  }
  for (uint64_t i = &v22; v9 != v10; ++v9)
    sub_246CCCC78((uint64_t *)&i, *v9);
  double result = *(double *)&v22;
  *(_OWORD *)a1 = v22;
  *(void *)(a1 + 16) = v23;
  return result;
}

void sub_246CCB8A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_246CCB8C8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 96))
  {
    long long v2 = *(void **)(a1 + 72);
    if (v2)
    {
      *(void *)(a1 + 80) = v2;
      operator delete(v2);
    }
    int v3 = *(void **)(a1 + 40);
    if (v3) {
      free(v3);
    }
    *(void *)(a1 + 40) = 0;
  }
  return a1;
}

uint64_t sub_246CCB914(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    unint64_t v4 = *(void **)(a1 + 24);
    if (v3 != v2)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      do
      {
        unint64_t v7 = *(void **)(v5 - 24);
        v5 -= 24;
        uint64_t v6 = v7;
        if (v7)
        {
          *(void *)(v3 - 16) = v6;
          operator delete(v6);
        }
        uint64_t v3 = v5;
      }
      while (v5 != v2);
      unint64_t v4 = *(void **)(a1 + 24);
    }
    *(void *)(a1 + 32) = v2;
    operator delete(v4);
  }
  unsigned int v8 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v8;
    operator delete(v8);
  }
  return a1;
}

__n128 sub_246CCB99C@<Q0>(char *__s@<X1>, std::string *a2@<X0>, std::string *a3@<X8>)
{
  size_t v6 = strlen(__s);
  unint64_t v7 = (__n128 *)std::string::append(a2, __s, v6);
  __n128 result = *v7;
  *a3 = *(std::string *)v7->n128_u8;
  v7->n128_u64[0] = 0;
  v7->n128_u64[1] = 0;
  v7[1].n128_u64[0] = 0;
  return result;
}

void **sub_246CCB9FC(void **a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    uint64_t v3 = (void *)*v2;
    *uint64_t v2 = 0;
    if (v3)
    {
      unint64_t v4 = (void *)v3[6];
      if (v4)
      {
        v3[7] = v4;
        operator delete(v4);
      }
      uint64_t v5 = (void *)v3[3];
      if (v5)
      {
        v3[4] = v5;
        operator delete(v5);
      }
      MEMORY[0x24C5471E0](v3, 0x1010C40DA3B4497);
    }
    MEMORY[0x24C5471E0](v2, 0x20C4093837F09);
  }
  return a1;
}

void sub_246CCBA90(unsigned int __val@<W2>, char **a2@<X1>, uint64_t a3@<X8>)
{
  if ((__val > 0x10 || ((1 << __val) & 0x10101) == 0) && __val != 110 && __val != 64)
  {
    __int16 v102 = 0;
LABEL_6:
    int v104 = 0;
    std::to_string(&v105, __val);
    v106 = (std::string *)v103;
    v107 = &v105;
    v108 = v103;
    v109 = &v105;
    unsigned __int8 v110 = &v105;
    v69.__r_.__value_.__r.__words[0] = (std::string::size_type)&v106;
    ((void (*)(std::string *, unsigned char *))off_26FB3DDA0[0])(&v69, v103);
    if (SHIBYTE(v105.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v105.__r_.__value_.__l.__data_);
    }
    if (v104 == -1) {
      sub_246CC66F0();
    }
    v106 = &v105;
    ((void (*)(std::string *__return_ptr, std::string **, unsigned char *))off_26FB3DDD0[v104])(&v81, &v106, v103);
    if (v104 != -1) {
      ((void (*)(std::string **, unsigned char *))off_26FB3DDB8[v104])(&v106, v103);
    }
    uint64_t v5 = std::string::insert(&v81, 0, "Got unsupported version id ", 0x1BuLL);
    unint64_t v7 = (void *)v5->__r_.__value_.__r.__words[0];
    unint64_t size = v5->__r_.__value_.__l.__size_;
    LODWORD(v68.__r_.__value_.__l.__data_) = v5->__r_.__value_.__r.__words[2];
    *(_DWORD *)((char *)v68.__r_.__value_.__r.__words + 3) = *(_DWORD *)((char *)&v5->__r_.__value_.__r.__words[2] + 3);
    int v8 = SHIBYTE(v5->__r_.__value_.__r.__words[2]);
    v5->__r_.__value_.__l.__size_ = 0;
    v5->__r_.__value_.__r.__words[2] = 0;
    v5->__r_.__value_.__r.__words[0] = 0;
    if (v8 < 0)
    {
      sub_246CC5E50(&__dst, v7, size);
    }
    else
    {
      *(void *)&long long __dst = v7;
      *((void *)&__dst + 1) = size;
      *(_DWORD *)char v83 = v68.__r_.__value_.__l.__data_;
      *(_DWORD *)&v83[3] = *(_DWORD *)((char *)v68.__r_.__value_.__r.__words + 3);
      char v84 = v8;
    }
    char v85 = 1;
    LOBYTE(v86) = 0;
    char v90 = 0;
    char v91 = 1;
    sub_246CC7690(0x2Du, &__dst, (uint64_t)v92);
    *(_OWORD *)a3 = *(_OWORD *)v92;
    *(unsigned char *)(a3 + 16) = 0;
    *(unsigned char *)(a3 + 112) = 0;
    if (v101)
    {
      *(unsigned char *)(a3 + 40) = 0;
      int v9 = v94;
      if (v94)
      {
        *(_OWORD *)(a3 + 16) = *(_OWORD *)&v92[16];
        *(void *)(a3 + 32) = v93;
        *(void *)&v92[24] = 0;
        uint64_t v93 = 0;
        *(void *)&v92[16] = 0;
        *(unsigned char *)(a3 + 40) = 1;
      }
      *(unsigned char *)(a3 + 48) = 0;
      *(unsigned char *)(a3 + 104) = 0;
      if (v100)
      {
        uint64_t v10 = v97;
        *(void *)(a3 + 64) = v96;
        *(_OWORD *)(a3 + 48) = v95;
        long long v95 = 0uLL;
        *(void *)(a3 + 72) = v10;
        *(_OWORD *)(a3 + 80) = v98;
        *(void *)(a3 + 96) = v99;
        uint64_t v96 = 0;
        long long v98 = 0uLL;
        uint64_t v99 = 0;
        *(unsigned char *)(a3 + 104) = 1;
      }
      *(unsigned char *)(a3 + 112) = 1;
      *(unsigned char *)(a3 + 120) = 0;
      if (v9 && SHIBYTE(v93) < 0) {
        operator delete(*(void **)&v92[16]);
      }
      if (!v91) {
        goto LABEL_31;
      }
    }
    else
    {
      *(unsigned char *)(a3 + 120) = 0;
      if (!v91) {
        goto LABEL_31;
      }
    }
    if (!v90) {
      goto LABEL_28;
    }
    if (v89 < 0)
    {
      operator delete(v88);
      if ((v87 & 0x80000000) == 0)
      {
LABEL_28:
        if (v85) {
          goto LABEL_29;
        }
        goto LABEL_31;
      }
    }
    else if ((v87 & 0x80000000) == 0)
    {
      goto LABEL_28;
    }
    operator delete(v86);
    if (v85)
    {
LABEL_29:
      if (v84 < 0) {
        operator delete((void *)__dst);
      }
    }
LABEL_31:
    if (v8 < 0)
    {
      operator delete(v7);
      if ((SHIBYTE(v81.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        return;
      }
    }
    else if ((SHIBYTE(v81.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      return;
    }
    uint64_t v11 = (void *)v81.__r_.__value_.__r.__words[0];
    goto LABEL_107;
  }
  __int16 v102 = __val | 0x100;
  if ((__val | 0x100) <= 0xFF) {
    goto LABEL_6;
  }
  if (__val != 16)
  {
    sub_246CC82D4();
    return;
  }
  unint64_t v12 = *a2;
  unint64_t v13 = a2[1];
  unint64_t v14 = (char *)(v13 - *a2);
  unint64_t v15 = 8 * (void)v14;
  memset(&v81, 0, sizeof(v81));
  if (!(8 * (void)v14))
  {
    unint64_t v18 = 0;
    if (v13 == v12) {
      goto LABEL_70;
    }
    goto LABEL_51;
  }
  if ((v15 & 0x8000000000000000) != 0) {
    sub_246CC23A4();
  }
  unint64_t v16 = (v15 - 1) >> 6;
  unint64_t v17 = operator new(8 * (v16 + 1));
  unint64_t v18 = v17;
  v81.__r_.__value_.__l.__size_ = 8 * (void)v14;
  v81.__r_.__value_.__r.__words[2] = v16 + 1;
  v81.__r_.__value_.__r.__words[0] = (std::string::size_type)v17;
  if (v15 >= 0x41) {
    unint64_t v19 = (v15 - 1) >> 6;
  }
  else {
    unint64_t v19 = 0;
  }
  v17[v19] = 0;
  if (v15 >= 0x40) {
    bzero(v17, 8 * (v15 >> 6));
  }
  if ((v15 & 0x38) != 0) {
    v18[v15 >> 6] &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v15 & 0x38));
  }
  if (v13 != v12)
  {
LABEL_51:
    unint64_t v20 = 0;
    unint64_t v21 = v14;
    while (1)
    {
      char v25 = *v12++;
      char v24 = v25;
      unint64_t v26 = (v20 + 7) >> 6;
      uint64_t v27 = 1 << (v20 + 7);
      if (v25)
      {
        v18[v26] |= v27;
        unint64_t v28 = (v20 + 6) >> 6;
        uint64_t v29 = 1 << ((v20 + 6) & 0x3E);
        if ((v24 & 2) == 0) {
          goto LABEL_63;
        }
LABEL_56:
        v18[v28] |= v29;
        unint64_t v30 = (v20 + 5) >> 6;
        uint64_t v31 = 1 << ((v20 + 5) & 0x3D);
        if ((v24 & 4) != 0) {
          goto LABEL_57;
        }
LABEL_64:
        v18[v30] &= ~v31;
        unint64_t v32 = (v20 + 4) >> 6;
        uint64_t v33 = 1 << ((v20 + 4) & 0x3C);
        if ((v24 & 8) == 0) {
          goto LABEL_65;
        }
LABEL_58:
        v18[v32] |= v33;
        unint64_t v34 = (v20 + 3) >> 6;
        uint64_t v35 = 1 << ((v20 + 3) & 0x3B);
        if ((v24 & 0x10) != 0) {
          goto LABEL_59;
        }
LABEL_66:
        v18[v34] &= ~v35;
        unint64_t v36 = (v20 + 2) >> 6;
        uint64_t v37 = 1 << ((v20 + 2) & 0x3A);
        if ((v24 & 0x20) == 0) {
          goto LABEL_67;
        }
LABEL_60:
        v18[v36] |= v37;
        unint64_t v38 = (v20 + 1) >> 6;
        uint64_t v39 = 1 << ((v20 + 1) & 0x39);
        if ((v24 & 0x40) == 0) {
          goto LABEL_52;
        }
LABEL_68:
        v18[v38] |= v39;
        unint64_t v22 = v20 >> 6;
        uint64_t v23 = 1 << (v20 & 0x38);
        if (v24 < 0) {
          goto LABEL_69;
        }
LABEL_53:
        v18[v22] &= ~v23;
        v20 += 8;
        if (!--v21) {
          break;
        }
      }
      else
      {
        v18[v26] &= ~v27;
        unint64_t v28 = (v20 + 6) >> 6;
        uint64_t v29 = 1 << ((v20 + 6) & 0x3E);
        if ((v24 & 2) != 0) {
          goto LABEL_56;
        }
LABEL_63:
        v18[v28] &= ~v29;
        unint64_t v30 = (v20 + 5) >> 6;
        uint64_t v31 = 1 << ((v20 + 5) & 0x3D);
        if ((v24 & 4) == 0) {
          goto LABEL_64;
        }
LABEL_57:
        v18[v30] |= v31;
        unint64_t v32 = (v20 + 4) >> 6;
        uint64_t v33 = 1 << ((v20 + 4) & 0x3C);
        if ((v24 & 8) != 0) {
          goto LABEL_58;
        }
LABEL_65:
        v18[v32] &= ~v33;
        unint64_t v34 = (v20 + 3) >> 6;
        uint64_t v35 = 1 << ((v20 + 3) & 0x3B);
        if ((v24 & 0x10) == 0) {
          goto LABEL_66;
        }
LABEL_59:
        v18[v34] |= v35;
        unint64_t v36 = (v20 + 2) >> 6;
        uint64_t v37 = 1 << ((v20 + 2) & 0x3A);
        if ((v24 & 0x20) != 0) {
          goto LABEL_60;
        }
LABEL_67:
        v18[v36] &= ~v37;
        unint64_t v38 = (v20 + 1) >> 6;
        uint64_t v39 = 1 << ((v20 + 1) & 0x39);
        if ((v24 & 0x40) != 0) {
          goto LABEL_68;
        }
LABEL_52:
        v18[v38] &= ~v39;
        unint64_t v22 = v20 >> 6;
        uint64_t v23 = 1 << (v20 & 0x38);
        if ((v24 & 0x80) == 0) {
          goto LABEL_53;
        }
LABEL_69:
        v18[v22] |= v23;
        v20 += 8;
        if (!--v21) {
          break;
        }
      }
    }
  }
LABEL_70:
  unint64_t v40 = v15 - 3;
  if (((*(void *)((char *)v18 + (((v15 - 3) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> ((v15 - 3) & 0x3D)) & 1) != 0
    || (unint64_t v40 = v15 - 2,
        ((*(void *)((char *)v18 + (((v15 - 2) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> ((v15 - 2) & 0x3E)) & 1) != 0)
    || (unint64_t v40 = v15 - 1,
        ((*(void *)((char *)v18 + (((v15 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v15 - 1)) & 1) != 0))
  {
    int v104 = 0;
    std::to_string(&v105, v40);
    v106 = (std::string *)v103;
    v107 = &v105;
    v108 = v103;
    v109 = &v105;
    unsigned __int8 v110 = &v105;
    long long v111 = (void **)&v106;
    ((void (*)(void ***, unsigned char *))off_26FB3DDA0[0])(&v111, v103);
    if (SHIBYTE(v105.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v105.__r_.__value_.__l.__data_);
    }
    if (v104 == -1) {
      sub_246CC66F0();
    }
    v106 = &v105;
    ((void (*)(std::string *__return_ptr, std::string **, unsigned char *))off_26FB3DDD0[v104])(&v68, &v106, v103);
    if (v104 != -1) {
      ((void (*)(std::string **, unsigned char *))off_26FB3DDB8[v104])(&v106, v103);
    }
    uint64_t v41 = std::string::insert(&v68, 0, "The LSB padding bit at index ", 0x1DuLL);
    long long v42 = *(_OWORD *)&v41->__r_.__value_.__l.__data_;
    v69.__r_.__value_.__r.__words[2] = v41->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v69.__r_.__value_.__l.__data_ = v42;
    v41->__r_.__value_.__l.__size_ = 0;
    v41->__r_.__value_.__r.__words[2] = 0;
    v41->__r_.__value_.__r.__words[0] = 0;
    uint64_t v43 = std::string::append(&v69, " is not zero!", 0xDuLL);
    uint64_t v45 = (void *)v43->__r_.__value_.__r.__words[0];
    unint64_t v44 = v43->__r_.__value_.__l.__size_;
    v70[0] = v43->__r_.__value_.__r.__words[2];
    *(_DWORD *)((char *)v70 + 3) = *(_DWORD *)((char *)&v43->__r_.__value_.__r.__words[2] + 3);
    int v46 = SHIBYTE(v43->__r_.__value_.__r.__words[2]);
    v43->__r_.__value_.__l.__size_ = 0;
    v43->__r_.__value_.__r.__words[2] = 0;
    v43->__r_.__value_.__r.__words[0] = 0;
    if (v46 < 0)
    {
      sub_246CC5E50(&v71, v45, v44);
    }
    else
    {
      *(void *)&long long v71 = v45;
      *((void *)&v71 + 1) = v44;
      *(_DWORD *)uint64_t v72 = v70[0];
      *(_DWORD *)&v72[3] = *(_DWORD *)((char *)v70 + 3);
      char v73 = v46;
    }
    char v74 = 1;
    LOBYTE(v75) = 0;
    char v79 = 0;
    char v80 = 1;
    sub_246CC7690(0x2Du, &v71, (uint64_t)v92);
    *(_OWORD *)a3 = *(_OWORD *)v92;
    *(unsigned char *)(a3 + 16) = 0;
    *(unsigned char *)(a3 + 112) = 0;
    if (v101)
    {
      *(unsigned char *)(a3 + 40) = 0;
      int v47 = v94;
      if (v94)
      {
        *(_OWORD *)(a3 + 16) = *(_OWORD *)&v92[16];
        *(void *)(a3 + 32) = v93;
        *(void *)&v92[24] = 0;
        uint64_t v93 = 0;
        *(void *)&v92[16] = 0;
        *(unsigned char *)(a3 + 40) = 1;
      }
      *(unsigned char *)(a3 + 48) = 0;
      *(unsigned char *)(a3 + 104) = 0;
      if (v100)
      {
        uint64_t v48 = v97;
        *(void *)(a3 + 64) = v96;
        *(_OWORD *)(a3 + 48) = v95;
        long long v95 = 0uLL;
        *(void *)(a3 + 72) = v48;
        *(_OWORD *)(a3 + 80) = v98;
        *(void *)(a3 + 96) = v99;
        uint64_t v96 = 0;
        long long v98 = 0uLL;
        uint64_t v99 = 0;
        *(unsigned char *)(a3 + 104) = 1;
      }
      *(unsigned char *)(a3 + 112) = 1;
      *(unsigned char *)(a3 + 120) = 0;
      if (v47 && SHIBYTE(v93) < 0) {
        operator delete(*(void **)&v92[16]);
      }
    }
    else
    {
      *(unsigned char *)(a3 + 120) = 0;
    }
    if (v80)
    {
      if (v79)
      {
        if (v78 < 0) {
          operator delete(v77);
        }
        if (v76 < 0) {
          operator delete(v75);
        }
      }
      if (v74 && v73 < 0) {
        operator delete((void *)v71);
      }
    }
    if (v46 < 0)
    {
      operator delete(v45);
      if ((SHIBYTE(v69.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_101:
        if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0) {
          goto LABEL_105;
        }
        goto LABEL_106;
      }
    }
    else if ((SHIBYTE(v69.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_101;
    }
    operator delete(v69.__r_.__value_.__l.__data_);
    if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0) {
LABEL_105:
    }
      operator delete(v68.__r_.__value_.__l.__data_);
LABEL_106:
    uint64_t v11 = v18;
LABEL_107:
    operator delete(v11);
    return;
  }
  *(void *)char v92 = operator new(8uLL);
  *(_OWORD *)&v92[8] = xmmword_246CFEF70;
  sub_246CCCDFC(v92, 3uLL, 0);
  int v49 = 0;
  if ((v14 & 7) != 0) {
    uint64_t v50 = 0;
  }
  else {
    uint64_t v50 = -1;
  }
  uint64_t v51 = (uint64_t)&v18[(v15 >> 6) + v50];
  int v67 = (v15 + 61) & 0x3D;
  uint64_t v52 = v18;
  do
  {
    uint64_t v53 = *v52;
    unint64_t v54 = *(void *)&v92[8];
    if (*(void *)&v92[8] == *(void *)&v92[16] << 6)
    {
      if (*(void *)&v92[8] + 1 < 0) {
        sub_246CC23A4();
      }
      unint64_t v55 = *(void *)&v92[16] << 7;
      if (*(void *)&v92[16] << 7 <= (*(void *)&v92[8] & 0xFFFFFFFFFFFFFFC0) + 64) {
        unint64_t v55 = (*(void *)&v92[8] & 0xFFFFFFFFFFFFFFC0) + 64;
      }
      if (*(void *)&v92[8] <= 0x3FFFFFFFFFFFFFFEuLL) {
        unint64_t v56 = v55;
      }
      else {
        unint64_t v56 = 0x7FFFFFFFFFFFFFFFLL;
      }
      sub_246CCB294((uint64_t)v92, v56);
      unint64_t v54 = *(void *)&v92[8];
    }
    *(void *)&v92[8] = v54 + 1;
    uint64_t v57 = *(void *)v92;
    unint64_t v58 = v54 >> 6;
    uint64_t v59 = 1 << v54;
    if (((1 << v49) & v53) != 0) {
      uint64_t v60 = *(void *)(*(void *)v92 + 8 * v58) | v59;
    }
    else {
      uint64_t v60 = *(void *)(*(void *)v92 + 8 * v58) & ~v59;
    }
    *(void *)(*(void *)v92 + 8 * v58) = v60;
    v52 += v49 == 63;
    if (v49 == 63) {
      int v49 = 0;
    }
    else {
      ++v49;
    }
  }
  while (v52 != (uint64_t *)v51 || v49 != v67);
  char v62 = *a2;
  v61 = a2[1];
  v107 = 0;
  v108 = 0;
  v106 = 0;
  size_t v63 = v61 - v62;
  if (v61 != v62)
  {
    if ((v63 & 0x8000000000000000) != 0) {
      sub_246CC23A4();
    }
    char v64 = (std::string *)operator new(v61 - v62);
    v106 = v64;
    v108 = (char *)v64 + v63;
    bzero(v64, v63);
    unint64_t v65 = 0;
    v107 = (std::string *)((char *)v64 + v63);
    do
    {
      unint64_t v66 = *(void *)(v57 + ((v65 >> 3) & 0x1FFFFFFFFFFFFFF8));
      v64->__r_.__value_.__s.__data_[0] |= ((v66 >> (v65 & 0x38)) << 7) | (((v66 >> (v65 & 0x38 | 1)) & 1) << 6) | (32 * ((v66 >> (v65 & 0x38 | 2)) & 1)) | (16 * ((v66 >> (v65 & 0x38 | 3)) & 1)) | (8 * ((v66 >> (v65 & 0x38 | 4)) & 1)) | (4 * ((v66 >> (v65 & 0x38 | 5)) & 1)) | (2 * ((v66 >> (v65 & 0x38 | 6)) & 1)) | (v66 >> (v65 & 0x38 | 7)) & 1;
      char v64 = (std::string *)((char *)v64 + 1);
      v65 += 8;
      --v63;
    }
    while (v63);
  }
  if (!HIBYTE(v102)) {
    sub_246CC5EF0();
  }
  sub_246CC82D4();
  if (v106)
  {
    v107 = v106;
    operator delete(v106);
  }
  if (*(void *)v92) {
    operator delete(*(void **)v92);
  }
  if (v18) {
    goto LABEL_106;
  }
}

void sub_246CCC644(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,void *__p)
{
  unint64_t v58 = *(void **)(v56 - 144);
  if (v58)
  {
    *(void *)(v56 - 136) = v58;
    operator delete(v58);
    uint64_t v59 = __p;
    if (!__p)
    {
LABEL_3:
      if (!v55) {
LABEL_8:
      }
        _Unwind_Resume(exception_object);
LABEL_7:
      operator delete(v55);
      _Unwind_Resume(exception_object);
    }
  }
  else
  {
    uint64_t v59 = __p;
    if (!__p) {
      goto LABEL_3;
    }
  }
  operator delete(v59);
  if (!v55) {
    goto LABEL_8;
  }
  goto LABEL_7;
}

void *sub_246CCC7E8(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v5 = result;
    if ((a4 & 0x8000000000000000) != 0) {
      sub_246CC23A4();
    }
    unint64_t v8 = (a4 - 1) >> 6;
    __n128 result = operator new(8 * (v8 + 1));
    v5[2] = v8 + 1;
    int v9 = *(void **)a2;
    int v10 = *(_DWORD *)(a2 + 8);
    uint64_t v11 = *(void **)a3;
    int v12 = *(_DWORD *)(a3 + 8);
    *uint64_t v5 = result;
    v5[1] = a4;
    if (a4 >= 0x41) {
      unint64_t v13 = (a4 - 1) >> 6;
    }
    else {
      unint64_t v13 = 0;
    }
    result[v13] = 0;
    if (v9 != v11 || v10 != v12)
    {
      int v15 = 0;
      do
      {
        uint64_t v16 = 1 << v15;
        if ((*v9 >> v10)) {
          uint64_t v17 = *result | v16;
        }
        else {
          uint64_t v17 = *result & ~v16;
        }
        char *result = v17;
        v9 += v10 == 63;
        if (v10 == 63) {
          int v10 = 0;
        }
        else {
          ++v10;
        }
        result += v15 == 63;
        if (v15 == 63) {
          int v15 = 0;
        }
        else {
          ++v15;
        }
      }
      while (v9 != v11 || v10 != v12);
    }
  }
  return result;
}

void sub_246CCC8DC(_Unwind_Exception *exception_object)
{
  if (*v1) {
    operator delete(*v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_246CCC8F4(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v3 = *(int8x16_t **)a1;
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  uint64_t v5 = *(unsigned int *)(a2 + 8) - v4;
  unint64_t v6 = v5 + 8 * (*(void *)a2 - *(void *)a1);
  if (*a3)
  {
    if (v4)
    {
      if ((64 - v4) >= v6) {
        uint64_t v7 = v5 + 8 * (*(void *)a2 - *(void *)a1);
      }
      else {
        uint64_t v7 = (64 - v4);
      }
      uint64_t v8 = v3->i64[0];
      uint64_t v3 = (int8x16_t *)((char *)v3 + 8);
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)((0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v7)) & (-1 << v4) & v8));
      v9.i16[0] = vaddlv_u8(v9);
      uint64_t result = v9.u32[0];
      v6 -= v7;
      unint64_t v11 = v6 - 64;
      if (v6 >= 0x40) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t result = 0;
      unint64_t v11 = v6 - 64;
      if (v6 >= 0x40)
      {
LABEL_7:
        if (v11 >= 0xC0)
        {
          uint64_t v18 = (v11 >> 6) + 1;
          int v12 = (int8x8_t *)v3 + (v18 & 0x7FFFFFFFFFFFFFCLL);
          v6 -= (v18 & 0x7FFFFFFFFFFFFFCLL) << 6;
          int64x2_t v19 = 0uLL;
          int64x2_t v20 = (int64x2_t)(unint64_t)result;
          unint64_t v21 = v3 + 1;
          uint64_t v22 = v18 & 0x7FFFFFFFFFFFFFCLL;
          do
          {
            int64x2_t v20 = (int64x2_t)vpadalq_u32((uint64x2_t)v20, vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(v21[-1]))));
            int64x2_t v19 = (int64x2_t)vpadalq_u32((uint64x2_t)v19, vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*v21))));
            v21 += 2;
            v22 -= 4;
          }
          while (v22);
          uint64_t result = vaddvq_s64(vaddq_s64(v19, v20));
          if (v18 == (v18 & 0x7FFFFFFFFFFFFFCLL)) {
            goto LABEL_22;
          }
        }
        else
        {
          int v12 = (int8x8_t *)v3;
        }
        do
        {
          int8x8_t v23 = *v12++;
          uint8x8_t v24 = (uint8x8_t)vcnt_s8(v23);
          v24.i16[0] = vaddlv_u8(v24);
          result += v24.u32[0];
          v6 -= 64;
        }
        while (v6 > 0x3F);
LABEL_22:
        if (!v6) {
          return result;
        }
        unint64_t v25 = *(void *)v12 & (0xFFFFFFFFFFFFFFFFLL >> -(char)v6);
        goto LABEL_32;
      }
    }
    int v12 = (int8x8_t *)v3;
    goto LABEL_22;
  }
  if (v4)
  {
    if ((64 - v4) >= v6) {
      uint64_t v13 = v5 + 8 * (*(void *)a2 - *(void *)a1);
    }
    else {
      uint64_t v13 = (64 - v4);
    }
    uint64_t v14 = v3->i64[0];
    uint64_t v3 = (int8x16_t *)((char *)v3 + 8);
    uint8x8_t v15 = (uint8x8_t)vcnt_s8((int8x8_t)((0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v13)) & (-1 << v4) & ~v14));
    v15.i16[0] = vaddlv_u8(v15);
    uint64_t result = v15.u32[0];
    v6 -= v13;
    unint64_t v16 = v6 - 64;
    if (v6 >= 0x40) {
      goto LABEL_14;
    }
LABEL_25:
    uint64_t v17 = (uint64_t *)v3;
    goto LABEL_30;
  }
  uint64_t result = 0;
  unint64_t v16 = v6 - 64;
  if (v6 < 0x40) {
    goto LABEL_25;
  }
LABEL_14:
  if (v16 >= 0xC0)
  {
    uint64_t v26 = (v16 >> 6) + 1;
    uint64_t v17 = &v3->i64[v26 & 0x7FFFFFFFFFFFFFCLL];
    v6 -= (v26 & 0x7FFFFFFFFFFFFFCLL) << 6;
    int64x2_t v27 = 0uLL;
    int64x2_t v28 = (int64x2_t)(unint64_t)result;
    uint64_t v29 = v3 + 1;
    uint64_t v30 = v26 & 0x7FFFFFFFFFFFFFCLL;
    do
    {
      int64x2_t v28 = (int64x2_t)vpadalq_u32((uint64x2_t)v28, vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(vmvnq_s8(v29[-1])))));
      int64x2_t v27 = (int64x2_t)vpadalq_u32((uint64x2_t)v27, vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(vmvnq_s8(*v29)))));
      v29 += 2;
      v30 -= 4;
    }
    while (v30);
    uint64_t result = vaddvq_s64(vaddq_s64(v27, v28));
    if (v26 == (v26 & 0x7FFFFFFFFFFFFFCLL)) {
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v17 = (uint64_t *)v3;
  }
  do
  {
    uint64_t v31 = *v17++;
    uint8x8_t v32 = (uint8x8_t)vcnt_s8((int8x8_t)~v31);
    v32.i16[0] = vaddlv_u8(v32);
    result += v32.u32[0];
    v6 -= 64;
  }
  while (v6 > 0x3F);
LABEL_30:
  if (!v6) {
    return result;
  }
  unint64_t v25 = (0xFFFFFFFFFFFFFFFFLL >> -(char)v6) & ~*v17;
LABEL_32:
  uint8x8_t v33 = (uint8x8_t)vcnt_s8((int8x8_t)v25);
  v33.i16[0] = vaddlv_u8(v33);
  result += v33.u32[0];
  return result;
}

void *sub_246CCCB6C(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3)
  {
    if (v3 < 0) {
      sub_246CC23A4();
    }
    unint64_t v5 = ((unint64_t)(v3 - 1) >> 6) + 1;
    unint64_t v6 = operator new(8 * v5);
    *a1 = v6;
    a1[1] = 0;
    a1[2] = v5;
    uint64_t v7 = *(void **)a2;
    unint64_t v8 = *(void *)(a2 + 8);
    a1[1] = v8;
    unint64_t v9 = (v8 - 1) >> 6;
    if (v8 < 0x41) {
      unint64_t v9 = 0;
    }
    v6[v9] = 0;
    int v10 = v8 & 0x3F;
    if (v8 > 0x3F || (v8 & 0x3F) != 0)
    {
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      uint64_t v14 = &v7[v8 >> 6];
      do
      {
        uint64_t v15 = 1 << v11;
        if ((*v7 >> v13)) {
          uint64_t v16 = *v6 | v15;
        }
        else {
          uint64_t v16 = *v6 & ~v15;
        }
        void *v6 = v16;
        ++v13;
        v7 += v12 == 63;
        if (v12 == 63) {
          int v13 = 0;
        }
        v6 += v11 == 63;
        if (v11 == 63) {
          int v11 = 0;
        }
        else {
          ++v11;
        }
        int v12 = v13;
      }
      while (v7 != v14 || v10 != v13);
    }
  }
  return a1;
}

uint64_t *sub_246CCCC78(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  unint64_t v6 = *(char **)(*a1 + 8);
  unint64_t v5 = *(void *)(*a1 + 16);
  uint64_t v7 = v6;
  if ((unint64_t)v6 < v5)
  {
    *(void *)unint64_t v6 = a2;
    uint64_t v8 = (uint64_t)(v6 + 8);
    goto LABEL_22;
  }
  unint64_t v9 = *(char **)v4;
  uint64_t v10 = (uint64_t)&v6[-*(void *)v4];
  uint64_t v11 = v10 >> 3;
  unint64_t v12 = (v10 >> 3) + 1;
  if (v12 >> 61) {
    sub_246CC23A4();
  }
  uint64_t v13 = v5 - (void)v9;
  if (v13 >> 2 > v12) {
    unint64_t v12 = v13 >> 2;
  }
  if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v14 = v12;
  }
  if (v14)
  {
    if (v14 >> 61) {
      sub_246CC29A0();
    }
    uint64_t v15 = operator new(8 * v14);
    uint64_t v16 = &v15[8 * v11];
    uint64_t v17 = &v15[8 * v14];
    void *v16 = a2;
    uint64_t v8 = (uint64_t)(v16 + 1);
    int64_t v18 = v6 - v9;
    if (v6 == v9) {
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  uint64_t v15 = 0;
  uint64_t v16 = (void *)(8 * v11);
  uint64_t v17 = 0;
  *(void *)(8 * v11) = a2;
  uint64_t v8 = 8 * v11 + 8;
  int64_t v18 = v6 - v9;
  if (v6 != v9)
  {
LABEL_14:
    unint64_t v19 = v18 - 8;
    if (v19 < 0x58) {
      goto LABEL_27;
    }
    if ((unint64_t)(v6 - v15 - v10) < 0x20) {
      goto LABEL_27;
    }
    uint64_t v20 = (v19 >> 3) + 1;
    uint64_t v21 = 8 * (v20 & 0x3FFFFFFFFFFFFFFCLL);
    uint64_t v7 = &v6[-v21];
    uint64_t v16 = (void *)((char *)v16 - v21);
    uint64_t v22 = &v15[8 * v11 - 16];
    int8x8_t v23 = v6 - 16;
    uint64_t v24 = v20 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v25 = *(_OWORD *)v23;
      *(v22 - 1) = *((_OWORD *)v23 - 1);
      _OWORD *v22 = v25;
      v22 -= 2;
      v23 -= 32;
      v24 -= 4;
    }
    while (v24);
    if (v20 != (v20 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_27:
      do
      {
        uint64_t v26 = *((void *)v7 - 1);
        v7 -= 8;
        *--uint64_t v16 = v26;
      }
      while (v7 != v9);
    }
  }
LABEL_20:
  *(void *)uint64_t v4 = v16;
  *(void *)(v4 + 8) = v8;
  *(void *)(v4 + 16) = v17;
  if (v9) {
    operator delete(v9);
  }
LABEL_22:
  *(void *)(v4 + 8) = v8;
  return a1;
}

void sub_246CCCDFC(void *a1, unint64_t a2, int a3)
{
  unint64_t v3 = a2;
  unint64_t v4 = a1[1];
  unint64_t v5 = v4 + a2;
  a1[1] = v4 + a2;
  if (!v4)
  {
    unint64_t v6 = v5 - 1;
LABEL_6:
    unint64_t v7 = v6 >> 6;
    if (v5 >= 0x41) {
      unint64_t v8 = v7;
    }
    else {
      unint64_t v8 = 0;
    }
    *(void *)(*a1 + 8 * v8) = 0;
    if (!a2) {
      return;
    }
    goto LABEL_10;
  }
  unint64_t v6 = v5 - 1;
  if (((v5 - 1) ^ (v4 - 1)) >= 0x40) {
    goto LABEL_6;
  }
  if (!a2) {
    return;
  }
LABEL_10:
  unint64_t v9 = (void *)(*a1 + 8 * (v4 >> 6));
  int v10 = v4 & 0x3F;
  if (a3)
  {
    if ((v4 & 0x3F) != 0)
    {
      unint64_t v11 = (64 - v10);
      if (v11 >= a2) {
        unint64_t v12 = a2;
      }
      else {
        unint64_t v12 = v11;
      }
      *v9++ |= (0xFFFFFFFFFFFFFFFFLL >> (v11 - v12)) & (-1 << v4);
      unint64_t v3 = a2 - v12;
    }
    if (v3 >= 0x40) {
      memset(v9, 255, 8 * (v3 >> 6));
    }
    if ((v3 & 0x3F) != 0) {
      v9[v3 >> 6] |= 0xFFFFFFFFFFFFFFFFLL >> -(v3 & 0x3F);
    }
  }
  else
  {
    if ((v4 & 0x3F) != 0)
    {
      unint64_t v13 = (64 - v10);
      if (v13 >= a2) {
        unint64_t v14 = a2;
      }
      else {
        unint64_t v14 = v13;
      }
      *v9++ &= ~((0xFFFFFFFFFFFFFFFFLL >> (v13 - v14)) & (-1 << v4));
      unint64_t v3 = a2 - v14;
    }
    if (v3 >= 0x40) {
      bzero(v9, 8 * (v3 >> 6));
    }
    if ((v3 & 0x3F) != 0) {
      v9[v3 >> 6] &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v3 & 0x3F));
    }
  }
}

size_t sub_246CCCF88(void **a1)
{
  uint64_t v1 = (_DWORD *)**a1;
  uint64_t v2 = (const char *)(*a1)[1];
  uint64_t v3 = v1[6];
  if (v3 != -1) {
    ((void (*)(char *, _DWORD *))off_26FB3DDB8[v3])(&v9, v1);
  }
  v1[6] = -1;
  size_t result = strlen(v2);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  size_t v5 = result;
  if (result >= 0x17)
  {
    uint64_t v7 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v7 = result | 7;
    }
    uint64_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    *((void *)v1 + 1) = v5;
    *((void *)v1 + 2) = v8 | 0x8000000000000000;
    *(void *)uint64_t v1 = v6;
  }
  else
  {
    *((unsigned char *)v1 + 23) = result;
    unint64_t v6 = v1;
    if (!result) {
      goto LABEL_11;
    }
  }
  size_t result = (size_t)memmove(v6, v2, v5);
LABEL_11:
  *((unsigned char *)v6 + v5) = 0;
  v1[6] = 1;
  return result;
}

void sub_246CCD078(uint64_t *a1, uint64_t a2)
{
  v19[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 16);
  *(void *)((char *)v19 + 7) = *(void *)(a2 + 15);
  unint64_t v4 = *(void **)a2;
  v19[0] = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 23);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  unint64_t v14 = v4;
  *(void *)uint64_t v15 = v19[0];
  *(void *)&v15[7] = *(void *)((char *)v19 + 7);
  char v16 = v5;
  memset(v19, 0, 15);
  unint64_t v6 = __p;
  uint64_t v7 = *(const char **)(v2 + 24);
  size_t v8 = strlen(v7);
  if (v8 >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  char v9 = (void *)v8;
  if (v8 >= 0x17)
  {
    uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v11 = v8 | 7;
    }
    uint64_t v12 = v11 + 1;
    unint64_t v6 = operator new(v11 + 1);
    __p[1] = v9;
    unint64_t v18 = v12 | 0x8000000000000000;
    __p[0] = v6;
LABEL_9:
    memmove(v6, v7, (size_t)v9);
    *((unsigned char *)v9 + (void)v6) = 0;
    uint64_t v10 = *(unsigned int *)(v3 + 24);
    if (v10 == -1) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  HIBYTE(v18) = v8;
  if (v8) {
    goto LABEL_9;
  }
  LOBYTE(__p[0]) = 0;
  uint64_t v10 = *(unsigned int *)(v3 + 24);
  if (v10 != -1) {
LABEL_10:
  }
    ((void (*)(char *, uint64_t))off_26FB3DDB8[v10])(&v13, v3);
LABEL_11:
  *(_DWORD *)(v3 + 24) = -1;
  sub_246CC68FC((void *)v3, (uint64_t)&v14, 2uLL);
  *(_DWORD *)(v3 + 24) = 2;
  if ((SHIBYTE(v18) & 0x80000000) == 0)
  {
    if ((v16 & 0x80000000) == 0) {
      return;
    }
LABEL_15:
    operator delete(v14);
    return;
  }
  operator delete(__p[0]);
  if (v16 < 0) {
    goto LABEL_15;
  }
}

void sub_246CCD234(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a2) {
    sub_246CC20E4(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CCD278(uint64_t a1, void **a2)
{
  uint64_t v3 = *(const void **)(*(void *)a1 + 32);
  char v5 = a2[1];
  unint64_t v4 = a2[2];
  if (v5 < (void *)v4)
  {
    size_t v6 = strlen(*(const char **)(*(void *)a1 + 32));
    if (v6 > 0x7FFFFFFFFFFFFFF7) {
      sub_246CC5D0C();
    }
    size_t v7 = v6;
    if (v6 >= 0x17)
    {
      uint64_t v14 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v6 | 7) != 0x17) {
        uint64_t v14 = v6 | 7;
      }
      uint64_t v15 = v14 + 1;
      size_t v8 = operator new(v14 + 1);
      v5[1] = v7;
      v5[2] = v15 | 0x8000000000000000;
      *char v5 = v8;
    }
    else
    {
      *((unsigned char *)v5 + 23) = v6;
      size_t v8 = v5;
      if (!v6) {
        goto LABEL_19;
      }
    }
    memmove(v8, v3, v7);
LABEL_19:
    *((unsigned char *)v8 + v7) = 0;
    char v16 = (char *)(v5 + 3);
    a2[1] = v5 + 3;
    goto LABEL_39;
  }
  unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (unsigned char *)*a2) >> 3);
  if (v9 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_246CC23A4();
  }
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a2) >> 3);
  uint64_t v11 = 2 * v10;
  if (2 * v10 <= v9 + 1) {
    uint64_t v11 = v9 + 1;
  }
  if (v10 >= 0x555555555555555) {
    unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v12 = v11;
  }
  if (v12)
  {
    if (v12 > 0xAAAAAAAAAAAAAAALL) {
      sub_246CC29A0();
    }
    char v13 = (char *)operator new(24 * v12);
  }
  else
  {
    char v13 = 0;
  }
  uint64_t v17 = &v13[24 * v9];
  size_t v18 = strlen((const char *)v3);
  if (v18 > 0x7FFFFFFFFFFFFFF7) {
    sub_246CC5D0C();
  }
  size_t v19 = v18;
  if (v18 >= 0x17)
  {
    uint64_t v24 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v18 | 7) != 0x17) {
      uint64_t v24 = v18 | 7;
    }
    uint64_t v25 = v24 + 1;
    uint64_t v20 = operator new(v24 + 1);
    *((void *)v17 + 1) = v19;
    *((void *)v17 + 2) = v25 | 0x8000000000000000;
    *(void *)uint64_t v17 = v20;
  }
  else
  {
    v17[23] = v18;
    uint64_t v20 = v17;
    if (!v18)
    {
      uint64_t v21 = &v13[24 * v12];
      *uint64_t v17 = 0;
      char v16 = v17 + 24;
      uint64_t v22 = (void **)*a2;
      int8x8_t v23 = (void **)a2[1];
      if (v23 == *a2) {
        goto LABEL_36;
      }
      do
      {
LABEL_30:
        long long v26 = *(_OWORD *)(v23 - 3);
        *((void *)v17 - 1) = *(v23 - 1);
        *(_OWORD *)(v17 - 24) = v26;
        v17 -= 24;
        *(v23 - 2) = 0;
        *(v23 - 1) = 0;
        *(v23 - 3) = 0;
        v23 -= 3;
      }
      while (v23 != v22);
      int8x8_t v23 = (void **)*a2;
      int64x2_t v27 = (void **)a2[1];
      *a2 = v17;
      a2[1] = v16;
      a2[2] = v21;
      while (v27 != v23)
      {
        if (*((char *)v27 - 1) < 0) {
          operator delete(*(v27 - 3));
        }
        v27 -= 3;
      }
      goto LABEL_37;
    }
  }
  memmove(v20, v3, v19);
  uint64_t v21 = &v13[24 * v12];
  *((unsigned char *)v20 + v19) = 0;
  char v16 = v17 + 24;
  uint64_t v22 = (void **)*a2;
  int8x8_t v23 = (void **)a2[1];
  if (v23 != *a2) {
    goto LABEL_30;
  }
LABEL_36:
  *a2 = v17;
  a2[1] = v16;
  a2[2] = v21;
LABEL_37:
  if (v23) {
    operator delete(v23);
  }
LABEL_39:
  a2[1] = v16;
}

void sub_246CCD50C(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CCD524(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

size_t sub_246CCD52C(void **a1)
{
  uint64_t v1 = (_DWORD *)**a1;
  uint64_t v2 = (const char *)(*a1)[1];
  uint64_t v3 = v1[6];
  if (v3 != -1) {
    ((void (*)(char *, _DWORD *))off_26FB3DDB8[v3])(&v9, v1);
  }
  v1[6] = -1;
  size_t result = strlen(v2);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  size_t v5 = result;
  if (result >= 0x17)
  {
    uint64_t v7 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v7 = result | 7;
    }
    uint64_t v8 = v7 + 1;
    size_t v6 = operator new(v7 + 1);
    *((void *)v1 + 1) = v5;
    *((void *)v1 + 2) = v8 | 0x8000000000000000;
    *(void *)uint64_t v1 = v6;
  }
  else
  {
    *((unsigned char *)v1 + 23) = result;
    size_t v6 = v1;
    if (!result) {
      goto LABEL_11;
    }
  }
  size_t result = (size_t)memmove(v6, v2, v5);
LABEL_11:
  *((unsigned char *)v6 + v5) = 0;
  v1[6] = 1;
  return result;
}

void sub_246CCD61C(uint64_t *a1, uint64_t a2)
{
  v19[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 16);
  *(void *)((char *)v19 + 7) = *(void *)(a2 + 15);
  unint64_t v4 = *(void **)a2;
  v19[0] = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 23);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  uint64_t v14 = v4;
  *(void *)uint64_t v15 = v19[0];
  *(void *)&v15[7] = *(void *)((char *)v19 + 7);
  char v16 = v5;
  memset(v19, 0, 15);
  size_t v6 = __p;
  uint64_t v7 = *(const char **)(v2 + 24);
  size_t v8 = strlen(v7);
  if (v8 >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  char v9 = (void *)v8;
  if (v8 >= 0x17)
  {
    uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v11 = v8 | 7;
    }
    uint64_t v12 = v11 + 1;
    size_t v6 = operator new(v11 + 1);
    __p[1] = v9;
    unint64_t v18 = v12 | 0x8000000000000000;
    __p[0] = v6;
LABEL_9:
    memmove(v6, v7, (size_t)v9);
    *((unsigned char *)v9 + (void)v6) = 0;
    uint64_t v10 = *(unsigned int *)(v3 + 24);
    if (v10 == -1) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  HIBYTE(v18) = v8;
  if (v8) {
    goto LABEL_9;
  }
  LOBYTE(__p[0]) = 0;
  uint64_t v10 = *(unsigned int *)(v3 + 24);
  if (v10 != -1) {
LABEL_10:
  }
    ((void (*)(char *, uint64_t))off_26FB3DDB8[v10])(&v13, v3);
LABEL_11:
  *(_DWORD *)(v3 + 24) = -1;
  sub_246CC68FC((void *)v3, (uint64_t)&v14, 2uLL);
  *(_DWORD *)(v3 + 24) = 2;
  if ((SHIBYTE(v18) & 0x80000000) == 0)
  {
    if ((v16 & 0x80000000) == 0) {
      return;
    }
LABEL_15:
    operator delete(v14);
    return;
  }
  operator delete(__p[0]);
  if (v16 < 0) {
    goto LABEL_15;
  }
}

void sub_246CCD7D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a2) {
    sub_246CC20E4(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CCD81C(uint64_t a1, void **a2)
{
  uint64_t v3 = *(const void **)(*(void *)a1 + 32);
  char v5 = a2[1];
  unint64_t v4 = a2[2];
  if (v5 < (void *)v4)
  {
    size_t v6 = strlen(*(const char **)(*(void *)a1 + 32));
    if (v6 > 0x7FFFFFFFFFFFFFF7) {
      sub_246CC5D0C();
    }
    size_t v7 = v6;
    if (v6 >= 0x17)
    {
      uint64_t v14 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v6 | 7) != 0x17) {
        uint64_t v14 = v6 | 7;
      }
      uint64_t v15 = v14 + 1;
      size_t v8 = operator new(v14 + 1);
      v5[1] = v7;
      v5[2] = v15 | 0x8000000000000000;
      *char v5 = v8;
    }
    else
    {
      *((unsigned char *)v5 + 23) = v6;
      size_t v8 = v5;
      if (!v6) {
        goto LABEL_19;
      }
    }
    memmove(v8, v3, v7);
LABEL_19:
    *((unsigned char *)v8 + v7) = 0;
    char v16 = (char *)(v5 + 3);
    a2[1] = v5 + 3;
    goto LABEL_39;
  }
  unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (unsigned char *)*a2) >> 3);
  if (v9 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_246CC23A4();
  }
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a2) >> 3);
  uint64_t v11 = 2 * v10;
  if (2 * v10 <= v9 + 1) {
    uint64_t v11 = v9 + 1;
  }
  if (v10 >= 0x555555555555555) {
    unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v12 = v11;
  }
  if (v12)
  {
    if (v12 > 0xAAAAAAAAAAAAAAALL) {
      sub_246CC29A0();
    }
    char v13 = (char *)operator new(24 * v12);
  }
  else
  {
    char v13 = 0;
  }
  uint64_t v17 = &v13[24 * v9];
  size_t v18 = strlen((const char *)v3);
  if (v18 > 0x7FFFFFFFFFFFFFF7) {
    sub_246CC5D0C();
  }
  size_t v19 = v18;
  if (v18 >= 0x17)
  {
    uint64_t v24 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v18 | 7) != 0x17) {
      uint64_t v24 = v18 | 7;
    }
    uint64_t v25 = v24 + 1;
    uint64_t v20 = operator new(v24 + 1);
    *((void *)v17 + 1) = v19;
    *((void *)v17 + 2) = v25 | 0x8000000000000000;
    *(void *)uint64_t v17 = v20;
  }
  else
  {
    v17[23] = v18;
    uint64_t v20 = v17;
    if (!v18)
    {
      uint64_t v21 = &v13[24 * v12];
      *uint64_t v17 = 0;
      char v16 = v17 + 24;
      uint64_t v22 = (void **)*a2;
      int8x8_t v23 = (void **)a2[1];
      if (v23 == *a2) {
        goto LABEL_36;
      }
      do
      {
LABEL_30:
        long long v26 = *(_OWORD *)(v23 - 3);
        *((void *)v17 - 1) = *(v23 - 1);
        *(_OWORD *)(v17 - 24) = v26;
        v17 -= 24;
        *(v23 - 2) = 0;
        *(v23 - 1) = 0;
        *(v23 - 3) = 0;
        v23 -= 3;
      }
      while (v23 != v22);
      int8x8_t v23 = (void **)*a2;
      int64x2_t v27 = (void **)a2[1];
      *a2 = v17;
      a2[1] = v16;
      a2[2] = v21;
      while (v27 != v23)
      {
        if (*((char *)v27 - 1) < 0) {
          operator delete(*(v27 - 3));
        }
        v27 -= 3;
      }
      goto LABEL_37;
    }
  }
  memmove(v20, v3, v19);
  uint64_t v21 = &v13[24 * v12];
  *((unsigned char *)v20 + v19) = 0;
  char v16 = v17 + 24;
  uint64_t v22 = (void **)*a2;
  int8x8_t v23 = (void **)a2[1];
  if (v23 != *a2) {
    goto LABEL_30;
  }
LABEL_36:
  *a2 = v17;
  a2[1] = v16;
  a2[2] = v21;
LABEL_37:
  if (v23) {
    operator delete(v23);
  }
LABEL_39:
  a2[1] = v16;
}

void sub_246CCDAB0(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CCDAC8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

size_t sub_246CCDAD0(void **a1)
{
  uint64_t v1 = (_DWORD *)**a1;
  uint64_t v2 = (const char *)(*a1)[1];
  uint64_t v3 = v1[6];
  if (v3 != -1) {
    ((void (*)(char *, _DWORD *))off_26FB3DDB8[v3])(&v9, v1);
  }
  v1[6] = -1;
  size_t result = strlen(v2);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  size_t v5 = result;
  if (result >= 0x17)
  {
    uint64_t v7 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v7 = result | 7;
    }
    uint64_t v8 = v7 + 1;
    size_t v6 = operator new(v7 + 1);
    *((void *)v1 + 1) = v5;
    *((void *)v1 + 2) = v8 | 0x8000000000000000;
    *(void *)uint64_t v1 = v6;
  }
  else
  {
    *((unsigned char *)v1 + 23) = result;
    size_t v6 = v1;
    if (!result) {
      goto LABEL_11;
    }
  }
  size_t result = (size_t)memmove(v6, v2, v5);
LABEL_11:
  *((unsigned char *)v6 + v5) = 0;
  v1[6] = 1;
  return result;
}

void sub_246CCDBC0(uint64_t *a1, uint64_t a2)
{
  v19[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 16);
  *(void *)((char *)v19 + 7) = *(void *)(a2 + 15);
  unint64_t v4 = *(void **)a2;
  v19[0] = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 23);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  uint64_t v14 = v4;
  *(void *)uint64_t v15 = v19[0];
  *(void *)&v15[7] = *(void *)((char *)v19 + 7);
  char v16 = v5;
  memset(v19, 0, 15);
  size_t v6 = __p;
  uint64_t v7 = *(const char **)(v2 + 24);
  size_t v8 = strlen(v7);
  if (v8 >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  char v9 = (void *)v8;
  if (v8 >= 0x17)
  {
    uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v11 = v8 | 7;
    }
    uint64_t v12 = v11 + 1;
    size_t v6 = operator new(v11 + 1);
    __p[1] = v9;
    unint64_t v18 = v12 | 0x8000000000000000;
    __p[0] = v6;
LABEL_9:
    memmove(v6, v7, (size_t)v9);
    *((unsigned char *)v9 + (void)v6) = 0;
    uint64_t v10 = *(unsigned int *)(v3 + 24);
    if (v10 == -1) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  HIBYTE(v18) = v8;
  if (v8) {
    goto LABEL_9;
  }
  LOBYTE(__p[0]) = 0;
  uint64_t v10 = *(unsigned int *)(v3 + 24);
  if (v10 != -1) {
LABEL_10:
  }
    ((void (*)(char *, uint64_t))off_26FB3DDB8[v10])(&v13, v3);
LABEL_11:
  *(_DWORD *)(v3 + 24) = -1;
  sub_246CC68FC((void *)v3, (uint64_t)&v14, 2uLL);
  *(_DWORD *)(v3 + 24) = 2;
  if ((SHIBYTE(v18) & 0x80000000) == 0)
  {
    if ((v16 & 0x80000000) == 0) {
      return;
    }
LABEL_15:
    operator delete(v14);
    return;
  }
  operator delete(__p[0]);
  if (v16 < 0) {
    goto LABEL_15;
  }
}

void sub_246CCDD7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a2) {
    sub_246CC20E4(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CCDDC0(uint64_t a1, void **a2)
{
  uint64_t v3 = *(const void **)(*(void *)a1 + 32);
  char v5 = a2[1];
  unint64_t v4 = a2[2];
  if (v5 < (void *)v4)
  {
    size_t v6 = strlen(*(const char **)(*(void *)a1 + 32));
    if (v6 > 0x7FFFFFFFFFFFFFF7) {
      sub_246CC5D0C();
    }
    size_t v7 = v6;
    if (v6 >= 0x17)
    {
      uint64_t v14 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v6 | 7) != 0x17) {
        uint64_t v14 = v6 | 7;
      }
      uint64_t v15 = v14 + 1;
      size_t v8 = operator new(v14 + 1);
      v5[1] = v7;
      v5[2] = v15 | 0x8000000000000000;
      *char v5 = v8;
    }
    else
    {
      *((unsigned char *)v5 + 23) = v6;
      size_t v8 = v5;
      if (!v6) {
        goto LABEL_19;
      }
    }
    memmove(v8, v3, v7);
LABEL_19:
    *((unsigned char *)v8 + v7) = 0;
    char v16 = (char *)(v5 + 3);
    a2[1] = v5 + 3;
    goto LABEL_39;
  }
  unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (unsigned char *)*a2) >> 3);
  if (v9 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_246CC23A4();
  }
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a2) >> 3);
  uint64_t v11 = 2 * v10;
  if (2 * v10 <= v9 + 1) {
    uint64_t v11 = v9 + 1;
  }
  if (v10 >= 0x555555555555555) {
    unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v12 = v11;
  }
  if (v12)
  {
    if (v12 > 0xAAAAAAAAAAAAAAALL) {
      sub_246CC29A0();
    }
    char v13 = (char *)operator new(24 * v12);
  }
  else
  {
    char v13 = 0;
  }
  uint64_t v17 = &v13[24 * v9];
  size_t v18 = strlen((const char *)v3);
  if (v18 > 0x7FFFFFFFFFFFFFF7) {
    sub_246CC5D0C();
  }
  size_t v19 = v18;
  if (v18 >= 0x17)
  {
    uint64_t v24 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v18 | 7) != 0x17) {
      uint64_t v24 = v18 | 7;
    }
    uint64_t v25 = v24 + 1;
    uint64_t v20 = operator new(v24 + 1);
    *((void *)v17 + 1) = v19;
    *((void *)v17 + 2) = v25 | 0x8000000000000000;
    *(void *)uint64_t v17 = v20;
  }
  else
  {
    v17[23] = v18;
    uint64_t v20 = v17;
    if (!v18)
    {
      uint64_t v21 = &v13[24 * v12];
      *uint64_t v17 = 0;
      char v16 = v17 + 24;
      uint64_t v22 = (void **)*a2;
      int8x8_t v23 = (void **)a2[1];
      if (v23 == *a2) {
        goto LABEL_36;
      }
      do
      {
LABEL_30:
        long long v26 = *(_OWORD *)(v23 - 3);
        *((void *)v17 - 1) = *(v23 - 1);
        *(_OWORD *)(v17 - 24) = v26;
        v17 -= 24;
        *(v23 - 2) = 0;
        *(v23 - 1) = 0;
        *(v23 - 3) = 0;
        v23 -= 3;
      }
      while (v23 != v22);
      int8x8_t v23 = (void **)*a2;
      int64x2_t v27 = (void **)a2[1];
      *a2 = v17;
      a2[1] = v16;
      a2[2] = v21;
      while (v27 != v23)
      {
        if (*((char *)v27 - 1) < 0) {
          operator delete(*(v27 - 3));
        }
        v27 -= 3;
      }
      goto LABEL_37;
    }
  }
  memmove(v20, v3, v19);
  uint64_t v21 = &v13[24 * v12];
  *((unsigned char *)v20 + v19) = 0;
  char v16 = v17 + 24;
  uint64_t v22 = (void **)*a2;
  int8x8_t v23 = (void **)a2[1];
  if (v23 != *a2) {
    goto LABEL_30;
  }
LABEL_36:
  *a2 = v17;
  a2[1] = v16;
  a2[2] = v21;
LABEL_37:
  if (v23) {
    operator delete(v23);
  }
LABEL_39:
  a2[1] = v16;
}

void sub_246CCE054(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CCE06C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_246CCE074(uint64_t *a1@<X1>, unint64_t a2@<X2>, uint64_t *a3@<X3>, int a4@<W4>, uint64_t *a5@<X5>, uint64_t **a6@<X8>)
{
  unint64_t v9 = a2;
  unint64_t v10 = a1;
  LODWORD(v11) = a2;
  if (a1 != a3 || a2 != a4)
  {
    uint64_t v21 = a6;
    do
    {
      uint64_t v12 = *v10;
      unint64_t v13 = a5[1];
      uint64_t v14 = a5[2];
      if (v13 == v14 << 6)
      {
        if ((uint64_t)(v13 + 1) < 0) {
          sub_246CC23A4();
        }
        unint64_t v15 = v14 << 7;
        if (v15 <= (v13 & 0xFFFFFFFFFFFFFFC0) + 64) {
          unint64_t v15 = (v13 & 0xFFFFFFFFFFFFFFC0) + 64;
        }
        if (v13 <= 0x3FFFFFFFFFFFFFFELL) {
          unint64_t v16 = v15;
        }
        else {
          unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
        }
        sub_246CCB294((uint64_t)a5, v16);
        unint64_t v13 = a5[1];
      }
      a5[1] = v13 + 1;
      uint64_t v17 = *a5;
      unint64_t v18 = v13 >> 6;
      uint64_t v19 = 1 << v13;
      if ((v12 & (1 << v9)) != 0) {
        uint64_t v20 = *(void *)(v17 + 8 * v18) | v19;
      }
      else {
        uint64_t v20 = *(void *)(v17 + 8 * v18) & ~v19;
      }
      *(void *)(v17 + 8 * v18) = v20;
      v10 += v11 == 63;
      if (v11 == 63) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = (v9 + 1);
      }
      unint64_t v9 = v11 | v9 & 0xFFFFFFFF00000000;
    }
    while (v10 != a3 || v11 != a4);
    unint64_t v10 = a3;
    a6 = v21;
  }
  *a6 = v10;
  a6[1] = (uint64_t *)v9;
  a6[2] = a5;
}

uint64_t sub_246CCE1AC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v4 = *(unint64_t **)result;
  uint64_t v5 = *(unsigned int *)(result + 8);
  unint64_t v6 = *(unsigned int *)(a2 + 8) + 8 * (*(void *)a2 - *(void *)result);
  unint64_t v7 = v6 - v5;
  if (*a3)
  {
    if (!v5) {
      goto LABEL_9;
    }
    unint64_t v8 = (64 - v5);
    if (v8 >= v7) {
      uint64_t v9 = v6 - v5;
    }
    else {
      uint64_t v9 = (64 - v5);
    }
    unint64_t v10 = (0xFFFFFFFFFFFFFFFFLL >> (64 - v5 - v9)) & (-1 << v5) & *v4;
    if (!v10)
    {
      if (v7 > v8)
      {
        v7 -= v9;
        ++v4;
LABEL_9:
        if (v7 >= 0x40)
        {
          do
          {
            unint64_t v11 = *v4;
            if (*v4) {
              goto LABEL_28;
            }
            ++v4;
            v7 -= 64;
          }
          while (v7 > 0x3F);
        }
        if (!v7 || (unint64_t v11 = *v4 & (0xFFFFFFFFFFFFFFFFLL >> -(char)v7)) == 0)
        {
LABEL_14:
          *(void *)a4 = v4;
          *(_DWORD *)(a4 + 8) = v7;
          return result;
        }
LABEL_28:
        *(void *)a4 = v4;
        *(_DWORD *)(a4 + 8) = __clz(__rbit64(v11));
        return result;
      }
      goto LABEL_29;
    }
LABEL_20:
    *(void *)a4 = v4;
    *(_DWORD *)(a4 + 8) = __clz(__rbit64(v10));
    return result;
  }
  if (v5)
  {
    unint64_t v12 = (64 - v5);
    if (v12 >= v7) {
      uint64_t v13 = v6 - v5;
    }
    else {
      uint64_t v13 = (64 - v5);
    }
    unint64_t v10 = (0xFFFFFFFFFFFFFFFFLL >> (64 - v5 - v13)) & (-1 << v5) & ~*v4;
    if (v10) {
      goto LABEL_20;
    }
    if (v7 <= v12)
    {
LABEL_29:
      *(void *)a4 = &v4[v6 >> 6];
      *(_DWORD *)(a4 + 8) = v6 & 0x3F;
      return result;
    }
    v7 -= v13;
    ++v4;
  }
  if (v7 < 0x40)
  {
LABEL_26:
    if (!v7) {
      goto LABEL_14;
    }
    unint64_t v11 = (0xFFFFFFFFFFFFFFFFLL >> -(char)v7) & ~*v4;
    if (!v11) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
  while (*v4 == -1)
  {
    ++v4;
    v7 -= 64;
    if (v7 <= 0x3F) {
      goto LABEL_26;
    }
  }
  int v14 = __clz(__rbit64(~*v4));
  *(void *)a4 = v4;
  *(_DWORD *)(a4 + 8) = v14;
  return result;
}

void (***sub_246CCE33C())(std::error_category *__hidden this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2691E2750, memory_order_acquire) & 1) != 0
    || !__cxa_guard_acquire(&qword_2691E2750))
  {
    return &off_26BA5C880;
  }
  __cxa_atexit((void (*)(void *))std::error_category::~error_category, &off_26BA5C880, &dword_246CBB000);
  __cxa_guard_release(&qword_2691E2750);
  return &off_26BA5C880;
}

void sub_246CCE3BC(int a1@<W1>, uint64_t a2@<X8>)
{
  switch(a1)
  {
    case 0:
      *(unsigned char *)(a2 + 23) = 8;
      strcpy((char *)a2, "No error");
      return;
    case 1:
      uint64_t v3 = operator new(0x20uLL);
      *(void *)a2 = v3;
      long long v4 = xmmword_246CFEF60;
      uint64_t v5 = "Error in metadata parity";
      goto LABEL_9;
    case 2:
      unint64_t v6 = (char *)operator new(0x19uLL);
      *(void *)a2 = v6;
      long long v7 = xmmword_246CFF000;
      unint64_t v8 = "Metadata low confidence";
      goto LABEL_11;
    case 3:
      uint64_t v3 = operator new(0x20uLL);
      *(void *)a2 = v3;
      long long v4 = xmmword_246CFEF60;
      uint64_t v5 = "Error in gap bits parity";
      goto LABEL_9;
    case 4:
      unint64_t v6 = (char *)operator new(0x19uLL);
      *(void *)a2 = v6;
      long long v7 = xmmword_246CFF000;
      unint64_t v8 = "Gap bits low confidence";
      goto LABEL_11;
    case 5:
      uint64_t v3 = operator new(0x20uLL);
      *(void *)a2 = v3;
      long long v4 = xmmword_246CFEF60;
      uint64_t v5 = "Error in arc bits parity";
LABEL_9:
      *(_OWORD *)(a2 + 8) = v4;
      *(_OWORD *)uint64_t v3 = *(_OWORD *)v5;
      v3[2] = *((void *)v5 + 2);
      *((unsigned char *)v3 + 24) = 0;
      break;
    case 6:
      unint64_t v6 = (char *)operator new(0x19uLL);
      *(void *)a2 = v6;
      long long v7 = xmmword_246CFF000;
      unint64_t v8 = "Arc bits low confidence";
LABEL_11:
      *(_OWORD *)(a2 + 8) = v7;
      *(_OWORD *)unint64_t v6 = *(_OWORD *)v8;
      *(void *)(v6 + 15) = *(void *)(v8 + 15);
      v6[23] = 0;
      break;
    case 7:
      *(unsigned char *)(a2 + 23) = 15;
      strcpy((char *)a2, "Not enough arcs");
      break;
    case 8:
      strcpy((char *)a2, "Bad redundant arc bits");
      *(unsigned char *)(a2 + 23) = 22;
      break;
    case 9:
      *(unsigned char *)(a2 + 23) = 14;
      strcpy((char *)a2, "Bad magic bits");
      break;
    default:
      *(unsigned char *)(a2 + 23) = 13;
      strcpy((char *)a2, "Unknown error");
      break;
  }
}

void sub_246CCE60C(std::error_category *a1)
{
  std::error_category::~error_category(a1);
  JUMPOUT(0x24C5471E0);
}

const char *sub_246CCE644()
{
  return "App Clip Code Codec Error Category";
}

double sub_246CCE650@<D0>(unsigned __int8 **a1@<X0>, void *a2@<X8>)
{
  if (**a1 <= 0xFu)
  {
    if (**a1)
    {
      *a2 = 0;
      a2[1] = 0;
      a2[2] = 0;
      uint64_t v9 = operator new(8uLL);
      *a2 = v9;
      *(void *)&double result = 6;
      *(_OWORD *)(a2 + 1) = xmmword_246CFEF30;
      *uint64_t v9 = 13;
      return result;
    }
    goto LABEL_14;
  }
  if (**a1 != 110 || a1[2] != (unsigned __int8 *)8 || *a1[1])
  {
LABEL_14:
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    return result;
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v3 = operator new(8uLL);
  int v4 = 0;
  uint64_t v5 = 0;
  *a2 = v3;
  *(void *)&double result = 45;
  *(_OWORD *)(a2 + 1) = xmmword_246CFEF20;
  *uint64_t v3 = 0;
  do
  {
    uint64_t v8 = 1 << v4;
    if (byte_246CFFABD[v5]) {
      uint64_t v7 = *v3 | v8;
    }
    else {
      uint64_t v7 = *v3 & ~v8;
    }
    *uint64_t v3 = v7;
    ++v5;
    v3 += v4 == 63;
    if (v4 == 63) {
      int v4 = 0;
    }
    else {
      ++v4;
    }
  }
  while (v5 != 45);
  return result;
}

void sub_246CCE764(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  int v4 = 0;
  uint64_t v5 = 0;
  v152 = 0;
  unint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &qword_246CFFAF0;
  do
  {
    uint64_t v9 = *v8;
    unint64_t v10 = v8[1];
    size_t v11 = v10 - *v8;
    v139 = v8;
    uint64_t v142 = *v8;
    v143 = v5;
    unint64_t v12 = *v8;
    if (v10 == *v8)
    {
LABEL_4:
      size_t v11 = v12 - v9;
      unint64_t v13 = v10 - 1;
      unint64_t v10 = v12;
      if (v12 == v13)
      {
        int v14 = v3;
        unint64_t v149 = v6;
        if (v3 < v152) {
          goto LABEL_48;
        }
        goto LABEL_6;
      }
    }
    else
    {
      do
      {
        if (((*(void *)(a1 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
          goto LABEL_4;
        }
        ++v12;
      }
      while (v10 != v12);
      unint64_t v13 = v10 - 1;
    }
    size_t __sz = v11;
    int v14 = v3;
    unint64_t v138 = v10;
    uint64_t v19 = v3;
    unint64_t v145 = v13;
    do
    {
      if (v14 < v152)
      {
        *v14++ = v6;
        goto LABEL_20;
      }
      uint64_t v20 = v14 - v19;
      unint64_t v21 = v20 + 1;
      if ((unint64_t)(v20 + 1) >> 61) {
        sub_246CC23A4();
      }
      if (((char *)v152 - (char *)v19) >> 2 > v21) {
        unint64_t v21 = ((char *)v152 - (char *)v19) >> 2;
      }
      if ((unint64_t)((char *)v152 - (char *)v19) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v22 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v22 = v21;
      }
      unint64_t v150 = v6;
      if (v22)
      {
        if (v22 >> 61) {
          sub_246CC29A0();
        }
        unint64_t v23 = v22;
        uint64_t v24 = operator new(8 * v22);
        unint64_t v22 = v23;
        uint64_t v25 = (unint64_t *)&v24[8 * v20];
        *uint64_t v25 = v150;
        uint64_t v26 = (uint64_t)(v25 + 1);
        int64_t v27 = (char *)v14 - (char *)v19;
        if (v14 == v19)
        {
LABEL_38:
          v152 = (unint64_t *)&v24[8 * v22];
          if (!v19) {
            goto LABEL_36;
          }
LABEL_35:
          operator delete(v19);
          goto LABEL_36;
        }
      }
      else
      {
        uint64_t v24 = 0;
        uint64_t v25 = (unint64_t *)(8 * v20);
        *(void *)(8 * v20) = v150;
        uint64_t v26 = 8 * v20 + 8;
        int64_t v27 = (char *)v14 - (char *)v19;
        if (v14 == v19) {
          goto LABEL_38;
        }
      }
      unint64_t v28 = v27 - 8;
      if (v28 < 0x168
        || (unint64_t v31 = ((char *)(v14 - 1) - (char *)v19) & 0xFFFFFFFFFFFFFFF8,
            &v24[(char *)v14 - (char *)v19 - 8 - v31] > &v24[(char *)v14 - (char *)v19 - 8])
        || (unint64_t *)((char *)v14 - v31 - 8) > v14 - 1
        || (unint64_t)((char *)v19 - v24) < 0x20)
      {
        uint64_t v29 = v14;
        do
        {
LABEL_33:
          unint64_t v30 = *--v29;
          *--uint64_t v25 = v30;
        }
        while (v29 != v19);
        goto LABEL_34;
      }
      uint64_t v32 = (v28 >> 3) + 1;
      uint64_t v33 = 8 * (v32 & 0x3FFFFFFFFFFFFFFCLL);
      uint64_t v29 = &v14[v33 / 0xFFFFFFFFFFFFFFF8];
      uint64_t v25 = (unint64_t *)((char *)v25 - v33);
      unint64_t v34 = &v24[8 * v20 - 16];
      uint64_t v35 = v14 - 2;
      uint64_t v36 = v32 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v37 = *(_OWORD *)v35;
        *(v34 - 1) = *((_OWORD *)v35 - 1);
        *unint64_t v34 = v37;
        v34 -= 2;
        v35 -= 4;
        v36 -= 4;
      }
      while (v36);
      if (v32 != (v32 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_33;
      }
LABEL_34:
      v152 = (unint64_t *)&v24[8 * v22];
      if (v19) {
        goto LABEL_35;
      }
LABEL_36:
      uint64_t v19 = v25;
      int v14 = (unint64_t *)v26;
      unint64_t v6 = v150;
      unint64_t v13 = v145;
LABEL_20:
      ++v10;
      v6 += (~*(void *)(a1 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v10) & 1;
    }
    while (v10 != v13);
    unint64_t v13 = v138;
    uint64_t v3 = v19;
    size_t v11 = __sz;
    uint64_t v9 = v142;
    unint64_t v149 = v6;
    if (v14 < v152)
    {
LABEL_48:
      *int v14 = v6;
      size_t __sza = (size_t)(v14 + 1);
      uint64_t v5 = v143;
      if (v13 == v9) {
        goto LABEL_58;
      }
LABEL_88:
      uint64_t v60 = 0;
      while (2)
      {
        while (v4 < v5)
        {
          *v4++ = v6;
          uint64_t v2 = (uint64_t)v4;
          if (++v60 == v11) {
            goto LABEL_58;
          }
        }
        uint64_t v61 = v4 - v7;
        unint64_t v62 = v61 + 1;
        if ((unint64_t)(v61 + 1) >> 61) {
          sub_246CC23A4();
        }
        if (((char *)v5 - (char *)v7) >> 2 > v62) {
          unint64_t v62 = ((char *)v5 - (char *)v7) >> 2;
        }
        if ((unint64_t)((char *)v5 - (char *)v7) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v63 = v62;
        }
        if (v63)
        {
          if (v63 >> 61) {
            sub_246CC29A0();
          }
          char v64 = operator new(8 * v63);
          unint64_t v65 = (unint64_t *)&v64[8 * v61];
          unint64_t *v65 = v6;
          uint64_t v66 = (uint64_t)(v65 + 1);
          int64_t v67 = (char *)v4 - (char *)v7;
          if (v4 != v7)
          {
LABEL_100:
            unint64_t v68 = v67 - 8;
            if (v68 < 0x168
              || (unint64_t v71 = ((char *)(v4 - 1) - (char *)v7) & 0xFFFFFFFFFFFFFFF8,
                  &v64[(char *)v4 - (char *)v7 - 8 - v71] > &v64[(char *)v4 - (char *)v7 - 8])
              || (unint64_t *)((char *)v4 - v71 - 8) > v4 - 1
              || (unint64_t)((char *)v7 - v64) < 0x20)
            {
              std::string v69 = v4;
              uint64_t v2 = v66;
            }
            else
            {
              uint64_t v72 = (v68 >> 3) + 1;
              uint64_t v73 = 8 * (v72 & 0x3FFFFFFFFFFFFFFCLL);
              std::string v69 = &v4[v73 / 0xFFFFFFFFFFFFFFF8];
              unint64_t v65 = (unint64_t *)((char *)v65 - v73);
              char v74 = &v64[8 * v61 - 16];
              char v75 = v4 - 2;
              uint64_t v76 = v72 & 0x3FFFFFFFFFFFFFFCLL;
              uint64_t v2 = v66;
              do
              {
                long long v77 = *(_OWORD *)v75;
                *(v74 - 1) = *((_OWORD *)v75 - 1);
                *char v74 = v77;
                v74 -= 2;
                v75 -= 4;
                v76 -= 4;
              }
              while (v76);
              if (v72 == (v72 & 0x3FFFFFFFFFFFFFFCLL))
              {
LABEL_103:
                uint64_t v5 = (unint64_t *)&v64[8 * v63];
                if (v7) {
                  goto LABEL_104;
                }
                goto LABEL_105;
              }
            }
            do
            {
              unint64_t v70 = *--v69;
              *--unint64_t v65 = v70;
            }
            while (v69 != v7);
            goto LABEL_103;
          }
        }
        else
        {
          char v64 = 0;
          unint64_t v65 = (unint64_t *)(8 * v61);
          *(void *)(8 * v61) = v6;
          uint64_t v66 = 8 * v61 + 8;
          int64_t v67 = (char *)v4 - (char *)v7;
          if (v4 != v7) {
            goto LABEL_100;
          }
        }
        uint64_t v2 = v66;
        uint64_t v5 = (unint64_t *)&v64[8 * v63];
        if (v7) {
LABEL_104:
        }
          operator delete(v7);
LABEL_105:
        uint64_t v7 = v65;
        ++v60;
        int v4 = (unint64_t *)v2;
        if (v60 == v11) {
          goto LABEL_58;
        }
        continue;
      }
    }
LABEL_6:
    uint64_t v15 = v14 - v3;
    unint64_t v16 = v15 + 1;
    if ((unint64_t)(v15 + 1) >> 61) {
      sub_246CC23A4();
    }
    if (((char *)v152 - (char *)v3) >> 2 > v16) {
      unint64_t v16 = ((char *)v152 - (char *)v3) >> 2;
    }
    if ((unint64_t)((char *)v152 - (char *)v3) >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v17 = v16;
    }
    unint64_t v144 = v13;
    if (v17)
    {
      if (v17 >> 61) {
        sub_246CC29A0();
      }
      unint64_t v18 = operator new(8 * v17);
    }
    else
    {
      unint64_t v18 = 0;
    }
    unint64_t v38 = (unint64_t *)&v18[8 * v15];
    unint64_t *v38 = v149;
    size_t __sza = (size_t)(v38 + 1);
    if (v14 != v3)
    {
      unint64_t v39 = (char *)v14 - (char *)v3 - 8;
      if (v39 < 0x168
        || (unint64_t v78 = ((char *)(v14 - 1) - (char *)v3) & 0xFFFFFFFFFFFFFFF8,
            &v18[(char *)v14 - (char *)v3 - 8 - v78] > &v18[(char *)v14 - (char *)v3 - 8])
        || (unint64_t *)((char *)v14 - v78 - 8) > v14 - 1
        || (unint64_t)((char *)v3 - v18) < 0x20)
      {
        unint64_t v40 = v14;
        unint64_t v6 = v149;
        uint64_t v5 = v143;
      }
      else
      {
        uint64_t v79 = (v39 >> 3) + 1;
        uint64_t v80 = 8 * (v79 & 0x3FFFFFFFFFFFFFFCLL);
        unint64_t v40 = &v14[v80 / 0xFFFFFFFFFFFFFFF8];
        unint64_t v38 = (unint64_t *)((char *)v38 - v80);
        std::string v81 = &v18[8 * v15 - 16];
        char v82 = v14 - 2;
        uint64_t v83 = v79 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v84 = *(_OWORD *)v82;
          *(v81 - 1) = *((_OWORD *)v82 - 1);
          _OWORD *v81 = v84;
          v81 -= 2;
          v82 -= 4;
          v83 -= 4;
        }
        while (v83);
        unint64_t v6 = v149;
        uint64_t v5 = v143;
        if (v79 == (v79 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_55:
          v152 = (unint64_t *)&v18[8 * v17];
          if (v3) {
            goto LABEL_56;
          }
          goto LABEL_57;
        }
      }
      do
      {
        unint64_t v41 = *--v40;
        *--unint64_t v38 = v41;
      }
      while (v40 != v3);
      goto LABEL_55;
    }
    unint64_t v6 = v149;
    uint64_t v5 = v143;
    v152 = (unint64_t *)&v18[8 * v17];
    if (v3) {
LABEL_56:
    }
      operator delete(v3);
LABEL_57:
    uint64_t v3 = v38;
    if (v144 != v142) {
      goto LABEL_88;
    }
LABEL_58:
    if (v3 != (unint64_t *)__sza)
    {
      long long v42 = v3;
      while (1)
      {
        while (v4 < v5)
        {
          unint64_t v43 = *v42++;
          *v4++ = v43;
          uint64_t v2 = (uint64_t)v4;
          if (v42 == (unint64_t *)__sza) {
            goto LABEL_2;
          }
        }
        uint64_t v44 = v4 - v7;
        unint64_t v45 = v44 + 1;
        if ((unint64_t)(v44 + 1) >> 61) {
          sub_246CC23A4();
        }
        if (((char *)v5 - (char *)v7) >> 2 > v45) {
          unint64_t v45 = ((char *)v5 - (char *)v7) >> 2;
        }
        unint64_t v46 = (unint64_t)((char *)v5 - (char *)v7) >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v45;
        if (v46)
        {
          if (v46 >> 61) {
            sub_246CC29A0();
          }
          int v47 = operator new(8 * v46);
          uint64_t v48 = (unint64_t *)&v47[8 * v44];
          unint64_t *v48 = *v42;
          uint64_t v2 = (uint64_t)(v48 + 1);
          int64_t v49 = (char *)v4 - (char *)v7;
          if (v4 == v7)
          {
LABEL_79:
            unint64_t v6 = v149;
            uint64_t v5 = (unint64_t *)&v47[8 * v46];
            if (!v7) {
              goto LABEL_76;
            }
LABEL_75:
            operator delete(v7);
            goto LABEL_76;
          }
        }
        else
        {
          int v47 = 0;
          uint64_t v48 = (unint64_t *)(8 * v44);
          *(void *)(8 * v44) = *v42;
          uint64_t v2 = 8 * v44 + 8;
          int64_t v49 = (char *)v4 - (char *)v7;
          if (v4 == v7) {
            goto LABEL_79;
          }
        }
        unint64_t v50 = v49 - 8;
        if (v50 < 0x168) {
          break;
        }
        unint64_t v53 = ((char *)(v4 - 1) - (char *)v7) & 0xFFFFFFFFFFFFFFF8;
        if (&v47[(char *)v4 - (char *)v7 - 8 - v53] > &v47[(char *)v4 - (char *)v7 - 8]
          || (unint64_t *)((char *)v4 - v53 - 8) > v4 - 1
          || (unint64_t)((char *)v7 - v47) < 0x20)
        {
          break;
        }
        uint64_t v54 = (v50 >> 3) + 1;
        uint64_t v55 = 8 * (v54 & 0x3FFFFFFFFFFFFFFCLL);
        uint64_t v51 = &v4[v55 / 0xFFFFFFFFFFFFFFF8];
        uint64_t v48 = (unint64_t *)((char *)v48 - v55);
        uint64_t v56 = &v47[8 * v44 - 16];
        uint64_t v57 = v4 - 2;
        uint64_t v58 = v54 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v59 = *(_OWORD *)v57;
          *(v56 - 1) = *((_OWORD *)v57 - 1);
          _OWORD *v56 = v59;
          v56 -= 2;
          v57 -= 4;
          v58 -= 4;
        }
        while (v58);
        unint64_t v6 = v149;
        if (v54 != (v54 & 0x3FFFFFFFFFFFFFFCLL)) {
          goto LABEL_73;
        }
LABEL_74:
        uint64_t v5 = (unint64_t *)&v47[8 * v46];
        if (v7) {
          goto LABEL_75;
        }
LABEL_76:
        uint64_t v7 = v48;
        ++v42;
        int v4 = (unint64_t *)v2;
        if (v42 == (unint64_t *)__sza) {
          goto LABEL_2;
        }
      }
      uint64_t v51 = v4;
      unint64_t v6 = v149;
      do
      {
LABEL_73:
        unint64_t v52 = *--v51;
        *--uint64_t v48 = v52;
      }
      while (v51 != v7);
      goto LABEL_74;
    }
LABEL_2:
    ++v6;
    uint64_t v8 = v139 + 2;
  }
  while (v139 + 2 != (uint64_t *)&unk_246CFFB40);
  v154 = v3;
  long long __p = v7;
  if (!v6)
  {
    char v87 = 0;
    uint64_t v86 = 0;
    char v85 = a2;
    if (v7 != (unint64_t *)v2) {
      goto LABEL_129;
    }
LABEL_155:
    v119 = v86;
    v85[1] = 0;
    *char v85 = 0;
    v85[2] = 0;
    goto LABEL_156;
  }
  if (v6 > 0xAAAAAAAAAAAAAAALL) {
    sub_246CC23A4();
  }
  char v85 = a2;
  uint64_t v86 = (char *)operator new(24 * v6);
  bzero(v86, 24 * ((24 * v6 - 24) / 0x18) + 24);
  char v87 = &v86[24 * ((24 * v6 - 24) / 0x18) + 24];
  if (v7 == (unint64_t *)v2) {
    goto LABEL_155;
  }
LABEL_129:
  v146 = v87;
  v148 = v86;
  v136 = v3;
  uint64_t v88 = 0;
  char v89 = v7;
  v151 = (unint64_t *)v2;
  do
  {
    while (1)
    {
      char v90 = &v86[24 * *v89];
      char v92 = (uint64_t *)(v90 + 8);
      char v91 = (char *)*((void *)v90 + 1);
      unsigned __int8 v94 = v90 + 16;
      unint64_t v93 = *((void *)v90 + 2);
      if ((unint64_t)v91 >= v93) {
        break;
      }
      *(void *)char v91 = v88;
      char v85 = a2;
      *char v92 = (uint64_t)(v91 + 8);
      ++v89;
      ++v88;
      if (v89 == (unint64_t *)v2) {
        goto LABEL_152;
      }
    }
    long long v95 = *(char **)v90;
    uint64_t v96 = (uint64_t)&v91[-*(void *)v90];
    uint64_t v97 = v96 >> 3;
    unint64_t v98 = (v96 >> 3) + 1;
    if (v98 >> 61) {
      sub_246CC23A4();
    }
    uint64_t v99 = v93 - (void)v95;
    if (v99 >> 2 > v98) {
      unint64_t v98 = v99 >> 2;
    }
    if ((unint64_t)v99 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v100 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v100 = v98;
    }
    if (!v100)
    {
      std::string v105 = 0;
      v106 = (void *)(8 * v97);
      *(void *)(8 * v97) = v88;
      uint64_t v107 = 8 * v97 + 8;
      int64_t v108 = v91 - v95;
      if (v91 == v95) {
        goto LABEL_149;
      }
LABEL_143:
      unint64_t v109 = v108 - 8;
      if (v109 < 0x58) {
        goto LABEL_191;
      }
      if ((unint64_t)(v91 - v105 - v96) < 0x20) {
        goto LABEL_191;
      }
      uint64_t v110 = (v109 >> 3) + 1;
      uint64_t v111 = 8 * (v110 & 0x3FFFFFFFFFFFFFFCLL);
      uint64_t v112 = &v91[-v111];
      v106 = (void *)((char *)v106 - v111);
      uint64_t v113 = &v105[8 * v97 - 16];
      long long v114 = v91 - 16;
      uint64_t v115 = v110 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v116 = *(_OWORD *)v114;
        *(v113 - 1) = *((_OWORD *)v114 - 1);
        *uint64_t v113 = v116;
        v113 -= 2;
        v114 -= 32;
        v115 -= 4;
      }
      while (v115);
      char v91 = v112;
      if (v110 != (v110 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_191:
        do
        {
          uint64_t v117 = *((void *)v91 - 1);
          v91 -= 8;
          *--v106 = v117;
        }
        while (v91 != v95);
      }
      goto LABEL_149;
    }
    v153 = &v91[-*(void *)v90];
    if (v100 >> 61) {
      sub_246CC29A0();
    }
    char v101 = (uint64_t *)(v90 + 8);
    __int16 v102 = v90;
    v103 = v90 + 16;
    unint64_t v104 = v100;
    std::string v105 = operator new(8 * v100);
    unsigned __int8 v94 = v103;
    unint64_t v100 = v104;
    char v90 = v102;
    char v92 = v101;
    uint64_t v96 = (uint64_t)v153;
    v106 = &v105[8 * v97];
    void *v106 = v88;
    uint64_t v107 = (uint64_t)(v106 + 1);
    int64_t v108 = v91 - v95;
    if (v91 != v95) {
      goto LABEL_143;
    }
LABEL_149:
    *(void *)char v90 = v106;
    *char v92 = v107;
    void *v94 = &v105[8 * v100];
    if (v95) {
      operator delete(v95);
    }
    char v85 = a2;
    uint64_t v86 = v148;
    uint64_t v2 = (uint64_t)v151;
    *char v92 = v107;
    ++v89;
    ++v88;
  }
  while (v89 != v151);
LABEL_152:
  v85[1] = 0;
  *char v85 = 0;
  v85[2] = 0;
  if (v2 - (uint64_t)v7 < 0) {
    sub_246CC23A4();
  }
  uint64_t v118 = (char *)operator new(v2 - (void)v7);
  uint64_t v3 = v136;
  v119 = v86;
  *char v85 = v118;
  v85[1] = v118;
  v120 = &v118[8 * ((v2 - (uint64_t)v7) >> 3)];
  v85[2] = v120;
  memcpy(v118, v7, v2 - (void)v7);
  v85[1] = v120;
  char v87 = v146;
LABEL_156:
  v85[3] = 0;
  v85[5] = 0;
  v85[4] = 0;
  int64_t v121 = v87 - v119;
  if (v87 == v119)
  {
    if (v87) {
      goto LABEL_169;
    }
  }
  else
  {
    unint64_t v122 = 0xAAAAAAAAAAAAAAABLL * (v121 >> 3);
    if (v122 > 0xAAAAAAAAAAAAAAALL) {
      sub_246CC23A4();
    }
    v123 = (char *)operator new(v121);
    uint64_t v124 = 0;
    v85[3] = v123;
    v85[4] = v123;
    v85[5] = &v123[24 * v122];
    do
    {
      v126 = v87;
      v127 = &v123[v124];
      v128 = &v119[v124];
      *(void *)v127 = 0;
      *((void *)v127 + 1) = 0;
      *((void *)v127 + 2) = 0;
      v130 = *(unsigned char **)&v119[v124];
      v129 = *(unsigned char **)&v119[v124 + 8];
      int64_t v131 = v129 - v130;
      if (v129 != v130)
      {
        if (v131 < 0) {
          sub_246CC23A4();
        }
        v132 = (char *)operator new(v129 - v130);
        *(void *)v127 = v132;
        *((void *)v127 + 1) = v132;
        v125 = &v132[8 * (v131 >> 3)];
        *((void *)v127 + 2) = v125;
        memcpy(v132, v130, v131);
        *((void *)v127 + 1) = v125;
        char v85 = a2;
      }
      v124 += 24;
      char v87 = v126;
    }
    while (v128 + 24 != v126);
    v85[4] = &v123[v124];
    if (v119)
    {
      v133 = v126;
      do
      {
        v135 = (void *)*((void *)v133 - 3);
        v133 -= 24;
        v134 = v135;
        if (v135)
        {
          *((void *)v87 - 2) = v134;
          operator delete(v134);
        }
        char v87 = v133;
      }
      while (v133 != v119);
LABEL_169:
      operator delete(v119);
      uint64_t v3 = v154;
    }
  }
  if (v3) {
    operator delete(v3);
  }
  if (__p) {
    operator delete(__p);
  }
}

void sub_246CCF444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29)
{
  uint64_t v32 = *v29;
  if (*v29)
  {
    *unint64_t v30 = v32;
    operator delete(v32);
  }
  sub_246CCF5DC(&a21);
  if (__p)
  {
    a25 = (uint64_t)__p;
    operator delete(__p);
    uint64_t v33 = a27;
    if (!a27) {
LABEL_5:
    }
      _Unwind_Resume(a1);
  }
  else
  {
    uint64_t v33 = a27;
    if (!a27) {
      goto LABEL_5;
    }
  }
  a28 = (uint64_t)v33;
  operator delete(v33);
  _Unwind_Resume(a1);
}

void **sub_246CCF5DC(void **a1)
{
  uint64_t v2 = (char *)*a1;
  if (*a1)
  {
    uint64_t v3 = (char *)a1[1];
    int v4 = *a1;
    if (v3 != v2)
    {
      uint64_t v5 = (char *)a1[1];
      do
      {
        uint64_t v7 = (void *)*((void *)v5 - 3);
        v5 -= 24;
        unint64_t v6 = v7;
        if (v7)
        {
          *((void *)v3 - 2) = v6;
          operator delete(v6);
        }
        uint64_t v3 = v5;
      }
      while (v5 != v2);
      int v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void sub_246CCF654(void *a1@<X0>, void *a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v374 = *MEMORY[0x263EF8340];
  int v5 = *a3;
  if (v5 == 8) {
    goto LABEL_4;
  }
  if (v5 == 110)
  {
    uint64_t v265 = 0;
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  if (v5 == 16)
  {
LABEL_4:
    uint64_t v265 = 6;
    if (v5 == 8) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v265 = 8;
  }
  if (v5 == 16)
  {
LABEL_9:
    uint64_t v6 = 9;
    goto LABEL_11;
  }
  uint64_t v6 = 5;
LABEL_11:
  uint64_t v7 = v6 | (2 * (v5 != 110));
  if (v7) {
    BOOL v8 = v265 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  uint64_t v259 = v6 | (2 * (v5 != 110));
  if (v8) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = v265 | (v7 << 32);
  }
  if (HIDWORD(v9)) {
    unint64_t v10 = v9 << 32;
  }
  else {
    unint64_t v10 = 0;
  }
  unint64_t v263 = v9 & 0xF;
  BOOL v11 = (v9 & 0xF) == 0 || HIDWORD(v9) == 0;
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = v9;
  }
  unint64_t v13 = HIDWORD(v12) * (unint64_t)(v10 >> 29);
  unint64_t v14 = 7;
  if (((v10 >> 29) & ((v10 >> 29) - 1)) == 0) {
    unint64_t v14 = (v10 >> 29) - 1;
  }
  unint64_t v15 = v14 | (v14 >> 1) | ((v14 | (v14 >> 1)) >> 2);
  unint64_t v16 = v15 | (v15 >> 4) | ((v15 | (v15 >> 4)) >> 8);
  unint64_t v17 = v16 | (v16 >> 16) | ((v16 | (v16 >> 16)) >> 32);
  if (v17 + 1 > 8) {
    size_t v18 = v17 + 1;
  }
  else {
    size_t v18 = 8;
  }
  unint64_t v254 = v18;
  unint64_t v255 = v13 & 0x7FFFFFFF8;
  if ((v13 & 0x7FFFFFFF8) != 0)
  {
    memptr[0] = 0;
    int v19 = malloc_type_posix_memalign(memptr, v18, v13 & 0x7FFFFFFF8, 0x1F88E90uLL);
    if (v19) {
      sub_246CF95CC(v19, v254, v255);
    }
    uint64_t v20 = (uint64_t *)memptr[0];
    int v5 = *a3;
  }
  else
  {
    uint64_t v20 = 0;
  }
  v256 = (void *)v9;
  BOOL v257 = (v9 & 0xF) != 0;
  BOOL v252 = v11;
  unint64_t v253 = v10;
  v271 = 0;
  v272 = 0;
  v273 = 0;
  long long __src = (char *)v20;
  if (v5 <= 15)
  {
    if (!v5) {
      goto LABEL_459;
    }
    if (v5 != 8) {
      goto LABEL_574;
    }
  }
  else if (v5 != 16)
  {
    if (v5 == 110)
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 96) = 0;
      goto LABEL_660;
    }
    if (v5 != 64) {
      goto LABEL_574;
    }
LABEL_459:
    if (HIDWORD(v10) * HIDWORD(v9))
    {
      int v153 = 0;
      uint64_t v154 = 1;
      v155 = v20;
      do
      {
        uint64_t *v155 = v154;
        int v156 = v153 + 1;
        if (v153 + 1 == v9) {
          int v153 = 0;
        }
        else {
          ++v153;
        }
        if (v156 == v9) {
          unint64_t v157 = HIDWORD(v10) + v257 - v263;
        }
        else {
          unint64_t v157 = (v9 & 0xF) != 0;
        }
        v155 += v157;
        ++v154;
      }
      while (v155 != &v20[HIDWORD(v10) * HIDWORD(v9)]);
    }
    v158 = (char *)operator new(8uLL);
    *(void *)v158 = 0;
    v159 = v158 + 8;
    v272 = v158 + 8;
    v273 = v158 + 8;
    v271 = v158;
    unint64_t v160 = v259 * (unint64_t)v265 + 1;
    unint64_t v161 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2[1] - *a2) >> 3);
    if (v160 != v161)
    {
      while (v159 < v273)
      {
        *(void *)v159 = v160;
        uint64_t v162 = (uint64_t)(v159 + 8);
LABEL_471:
        v272 = (char *)v162;
        ++v160;
        v159 = (char *)v162;
        if (v160 == v161) {
          goto LABEL_574;
        }
      }
      v163 = (char *)v271;
      int64_t v164 = v159 - (unsigned char *)v271;
      uint64_t v165 = (v159 - (unsigned char *)v271) >> 3;
      unint64_t v166 = v165 + 1;
      if ((unint64_t)(v165 + 1) >> 61) {
        sub_246CC23A4();
      }
      uint64_t v167 = v273 - (unsigned char *)v271;
      if ((v273 - (unsigned char *)v271) >> 2 > v166) {
        unint64_t v166 = v167 >> 2;
      }
      if ((unint64_t)v167 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v168 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v168 = v166;
      }
      if (v168)
      {
        if (v168 >> 61) {
          sub_246CC29A0();
        }
        v169 = operator new(8 * v168);
        v170 = (unint64_t *)&v169[8 * v165];
        unint64_t *v170 = v160;
        uint64_t v162 = (uint64_t)(v170 + 1);
        int64_t v171 = v159 - v163;
        if (v159 == v163) {
          goto LABEL_487;
        }
      }
      else
      {
        v169 = 0;
        v170 = (unint64_t *)(8 * v165);
        *(void *)(8 * v165) = v160;
        uint64_t v162 = 8 * v165 + 8;
        int64_t v171 = v159 - v163;
        if (v159 == v163) {
          goto LABEL_487;
        }
      }
      unint64_t v172 = v171 - 8;
      if (v172 >= 0x168)
      {
        unint64_t v175 = (v159 - 8 - v163) & 0xFFFFFFFFFFFFFFF8;
        if (&v169[v164 - 8 - v175] > &v169[v164 - 8])
        {
          v173 = v159;
        }
        else if (&v159[-v175 - 8] > v159 - 8)
        {
          v173 = v159;
        }
        else if ((unint64_t)(v159 - v169 - v164) >= 0x20)
        {
          uint64_t v176 = (v172 >> 3) + 1;
          uint64_t v177 = 8 * (v176 & 0x3FFFFFFFFFFFFFFCLL);
          v173 = &v159[-v177];
          v170 = (unint64_t *)((char *)v170 - v177);
          v178 = &v169[8 * v165 - 16];
          v179 = v159 - 16;
          uint64_t v180 = v176 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v181 = *(_OWORD *)v179;
            *(v178 - 1) = *((_OWORD *)v179 - 1);
            _OWORD *v178 = v181;
            v178 -= 2;
            v179 -= 32;
            v180 -= 4;
          }
          while (v180);
          if (v176 == (v176 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_487:
            v271 = v170;
            v272 = (char *)v162;
            v273 = &v169[8 * v168];
            if (v163) {
              operator delete(v163);
            }
            goto LABEL_471;
          }
        }
        else
        {
          v173 = v159;
        }
      }
      else
      {
        v173 = v159;
      }
      do
      {
        unint64_t v174 = *((void *)v173 - 1);
        v173 -= 8;
        *--v170 = v174;
      }
      while (v173 != v163);
      goto LABEL_487;
    }
LABEL_574:
    unint64_t v202 = v253 | v257;
    memptr[0] = v256;
    memptr[1] = (void *)(v253 | v257);
    LOBYTE(memptr[2]) = 0;
    *(_DWORD *)((char *)&memptr[2] + 1) = *(_DWORD *)v276;
    HIDWORD(memptr[2]) = *(_DWORD *)&v276[3];
    LOBYTE(memptr[3]) = 0;
    *(_WORD *)((char *)&memptr[3] + 1) = v274;
    BYTE3(memptr[3]) = v275;
    long long v288 = v255;
    *(void *)&v289[0] = v254;
    if (v255)
    {
      __dst[0] = 0;
      int v203 = malloc_type_posix_memalign(__dst, v254, v255, 0x1F88E90uLL);
      if (v203) {
        sub_246CF95CC(v203, v254, v255);
      }
      v204 = __dst[0];
      *((void **)&v288 + 1) = __dst[0];
    }
    else
    {
      v204 = 0;
    }
    *((void *)&v289[0] + 1) = v12;
    *(void *)&v289[1] = 8 * v202;
    int v205 = v252;
    if (!v12) {
      int v205 = 1;
    }
    if (v205) {
      unint64_t v206 = 0;
    }
    else {
      unint64_t v206 = v12;
    }
    unint64_t v207 = HIDWORD(v206);
    unint64_t v208 = (8 * v202) >> 35;
    uint64_t v209 = HIDWORD(v206) * ((v202 >> 29) >> 3);
    if (v209 == -1
      && sub_246CFADD0("/Library/Caches/com.apple.xbs/Sources/ACCBaker/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 984, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_246CFB2A4))
    {
      goto LABEL_642;
    }
    if (!v206 || !HIDWORD(v206)) {
      goto LABEL_655;
    }
    BOOL v210 = !HIDWORD(v12) || v12 == 0;
    int v211 = v210 ? 0 : HIDWORD(v12);
    if (v211 * v208 == -1
      && sub_246CFADD0("/Library/Caches/com.apple.xbs/Sources/ACCBaker/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 984, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_246CFB2A4))
    {
      goto LABEL_642;
    }
    if (v263)
    {
      if (v208 == v206)
      {
        if (v209 && !__src)
        {
          if (sub_246CFADD0("/Library/Caches/com.apple.xbs/Sources/ACCBaker/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)"", 0, (void (*)(void **))sub_246CFB2A4))
          {
            goto LABEL_642;
          }
LABEL_649:
          memmove(v204, __src, 8 * v209);
          long long v290 = 0uLL;
          *((void *)&v289[1] + 1) = 0;
          v201 = v271;
          int64_t v246 = v272 - (unsigned char *)v271;
          if (v272 == v271)
          {
LABEL_650:
            v247 = 0;
            v248 = 0;
            uint64_t v20 = (uint64_t *)__src;
            goto LABEL_658;
          }
LABEL_656:
          if (v246 < 0) {
            sub_246CC23A4();
          }
          uint64_t v20 = (uint64_t *)__src;
          v248 = (char *)operator new(v246);
          v247 = &v248[8 * (v246 >> 3)];
          memcpy(v248, v201, v246);
LABEL_658:
          long long v249 = v288;
          *(_OWORD *)a4 = *(_OWORD *)memptr;
          *(_OWORD *)(a4 + 12) = *(_OWORD *)((char *)&memptr[1] + 4);
          *(_OWORD *)(a4 + 32) = v249;
          *(void *)(a4 + 48) = *(void *)&v289[0];
          *(_OWORD *)(a4 + 56) = *(_OWORD *)((char *)v289 + 8);
          *(void *)(a4 + 72) = v248;
          *(void *)(a4 + 80) = v247;
          *(void *)(a4 + 88) = v247;
          *(unsigned char *)(a4 + 96) = 1;
          if (!v201) {
            goto LABEL_660;
          }
          goto LABEL_659;
        }
        if (v209) {
          goto LABEL_649;
        }
LABEL_655:
        long long v290 = 0uLL;
        *((void *)&v289[1] + 1) = 0;
        v201 = v271;
        int64_t v246 = v272 - (unsigned char *)v271;
        if (v272 == v271) {
          goto LABEL_650;
        }
        goto LABEL_656;
      }
      size_t v241 = 8 * v206;
      v242 = v204;
      v243 = __src;
      int v244 = v207 - 1;
      if (v207 != 1)
      {
        uint64_t v245 = 0;
        do
        {
          if (!&__src[v245 * 8]
            && sub_246CFADD0("/Library/Caches/com.apple.xbs/Sources/ACCBaker/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)"", 0, (void (*)(void **))sub_246CFB2A4))
          {
            goto LABEL_642;
          }
          memmove(&v204[v245], &__src[v245 * 8], v241);
          v245 += v208;
          --v244;
        }
        while (v244);
        v243 = &__src[v245 * 8];
        v242 = &v204[v245];
      }
      if (v243
        || !sub_246CFADD0("/Library/Caches/com.apple.xbs/Sources/ACCBaker/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)"", 0, (void (*)(void **))sub_246CFB2A4))
      {
        memmove(v242, v243, v241);
        goto LABEL_655;
      }
LABEL_642:
      abort();
    }
    int v212 = v206 - 1;
    int v213 = HIDWORD(v206) - 1;
    if (HIDWORD(v206) == 1)
    {
      v216 = __src;
    }
    else
    {
      uint64_t v214 = 8 * v208;
      if (v206 == 1)
      {
        uint64_t v251 = 0;
        do
        {
          *(void *)((char *)v204 + v251) = *(void *)&__src[v251];
          v251 += v214;
          --v213;
        }
        while (v213);
        v216 = &__src[v251];
        v204 = (void *)((char *)v204 + v251);
        goto LABEL_671;
      }
      int v215 = 0;
      v216 = __src;
      do
      {
        uint64_t v217 = 0;
        int v218 = v206 - 1;
        do
        {
          v204[v217] = *(void *)&v216[v217 * 8];
          v217 += v257;
          --v218;
        }
        while (v218);
        v204[v217] = *(void *)&v216[v217 * 8];
        v216 += v214;
        v204 = (void *)((char *)v204 + v214);
        ++v215;
      }
      while (v215 != v213);
    }
    if (v206 != 1)
    {
      unint64_t v250 = 0;
      do
      {
        v204[v250 / 8] = *(void *)&v216[v250];
        v250 += 8 * v257;
        --v212;
      }
      while (v212);
      v216 += v250;
      v204 = (void *)((char *)v204 + v250);
    }
LABEL_671:
    void *v204 = *(void *)v216;
    long long v290 = 0uLL;
    *((void *)&v289[1] + 1) = 0;
    v201 = v271;
    int64_t v246 = v272 - (unsigned char *)v271;
    if (v272 == v271) {
      goto LABEL_650;
    }
    goto LABEL_656;
  }
  long long v291 = 0u;
  long long v292 = 0u;
  long long v290 = 0u;
  long long v288 = 0u;
  memset(v289, 0, sizeof(v289));
  memset(memptr, 0, sizeof(memptr));
  *(_OWORD *)v268 = 0u;
  long long v269 = 0u;
  unint64_t v21 = (char *)operator new(0x400uLL);
  unint64_t v22 = v21 + 1024;
  v266 = v21;
  memcpy(v21, &unk_246CFFB40, 0x400uLL);
  v267 = v22;
  sub_246CCB4F4((uint64_t)&v268[1], 0x80uLL, 0);
  unint64_t v270 = 0;
  if (v259)
  {
    uint64_t v260 = 0;
    while (1)
    {
      if ((v270 & 0x8000000000000000) != 0)
      {
        uint64_t v24 = v270 - 63;
        if ((uint64_t)(v270 - 63) < 0) {
          uint64_t v24 = v270;
        }
        uint64_t v23 = v24 >> 6;
      }
      else
      {
        uint64_t v23 = v270 >> 6;
      }
      LOBYTE(v364) = 0;
      v357 = (char *)v268[1] + 8 * v23;
      LODWORD(v358[0]) = v270 & 0x3F;
      __p[0] = (char *)v268[1] + 8 * ((unint64_t)v269 >> 6);
      LODWORD(__p[1]) = v269 & 0x3F;
      sub_246CCE1AC((uint64_t)&v357, (uint64_t)__p, &v364, (uint64_t)__dst);
      int64_t v25 = LODWORD(__dst[1]) + 8 * ((char *)__dst[0] - (char *)v268[1]);
      unint64_t v270 = v25;
      if (v25 < 0)
      {
        int64_t v27 = v25 - 63;
        if (v25 - 63 < 0) {
          int64_t v27 = LODWORD(__dst[1]) + 8 * ((char *)__dst[0] - (char *)v268[1]);
        }
        uint64_t v26 = v27 >> 6;
      }
      else
      {
        uint64_t v26 = (unint64_t)v25 >> 6;
      }
      uint64_t v28 = v266[v25];
      LOBYTE(v364) = 0;
      v357 = (char *)v268[1] + 8 * v26;
      LODWORD(v358[0]) = v25 & 0x3F;
      __p[0] = (char *)v268[1] + 8 * ((unint64_t)v269 >> 6);
      LODWORD(__p[1]) = v269 & 0x3F;
      sub_246CCE1AC((uint64_t)&v357, (uint64_t)__p, &v364, (uint64_t)__dst);
      unint64_t v270 = LODWORD(__dst[1]) + 8 * ((char *)__dst[0] - (char *)v268[1]);
      *(void *)((char *)v268[1] + ((v270 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v270;
      uint64_t v29 = (void **)(&off_2652019F0 + 2 * v28);
      unint64_t v30 = (char *)*v29;
      unint64_t v31 = v29[1];
      uint64_t v32 = (uint64_t)&v30[8 * (void)v31];
      uint64_t v33 = (void **)&v370;
      v369 = v30;
      v370 = (void (**)(void))&unk_26FB3DEB8;
      v371 = memptr;
      v372 = (void **)&v370;
      uint64_t v373 = v32;
      if (v31)
      {
        while (!(*((unsigned int (**)(void **))*v33 + 6))(v33))
        {
          unint64_t v30 = v369 + 8;
          v369 = v30;
          if (v30 == (char *)v373) {
            goto LABEL_61;
          }
          uint64_t v33 = v372;
          if (!v372) {
            sub_246CC4F54();
          }
        }
        unint64_t v30 = v369;
LABEL_61:
        unint64_t v34 = v372;
      }
      else
      {
        unint64_t v34 = (void **)&v370;
      }
      uint64_t v35 = (void (**)(void **))&unk_26FB3DEB8;
      uint64_t v364 = v32;
      v365 = (void (**)(void **))&unk_26FB3DEB8;
      v366 = memptr;
      v367 = (void **)&v365;
      uint64_t v368 = v32;
      __dst[0] = v30;
      uint64_t v36 = (void ***)v285;
      if (!v34) {
        goto LABEL_65;
      }
      if (v34 != (void **)&v370) {
        break;
      }
      *(void *)&v285[0] = &__dst[1];
      v370[3]();
      *((void *)&v285[0] + 1) = v373;
      *(void *)&v285[1] = v364;
      unint64_t v41 = (void ***)v286;
      if (v367)
      {
        if (v367 == (void **)&v365)
        {
          uint64_t v35 = v365;
          goto LABEL_66;
        }
        *(void *)&v286[0] = v367;
        unint64_t v41 = &v367;
      }
      *unint64_t v41 = 0;
      long long v37 = v367;
      *((void *)&v286[0] + 1) = v368;
      if (v367 == (void **)&v365)
      {
LABEL_78:
        v365[4]((void **)&v365);
        unint64_t v38 = v372;
        if (v372 == (void **)&v370) {
          goto LABEL_79;
        }
        goto LABEL_70;
      }
LABEL_67:
      if (v37) {
        (*((void (**)(void **))*v37 + 5))(v37);
      }
      unint64_t v38 = v372;
      if (v372 == (void **)&v370)
      {
LABEL_79:
        ((void (*)(void (***)(void)))v370[4])(&v370);
        unint64_t v39 = *(void ***)&v285[0];
        v357 = (char *)__dst[0];
        unint64_t v40 = &v359;
        if (!*(void *)&v285[0]) {
          goto LABEL_82;
        }
        goto LABEL_80;
      }
LABEL_70:
      if (v38) {
        (*((void (**)(void **))*v38 + 5))(v38);
      }
      unint64_t v39 = *(void ***)&v285[0];
      v357 = (char *)__dst[0];
      unint64_t v40 = &v359;
      if (!*(void *)&v285[0]) {
        goto LABEL_82;
      }
LABEL_80:
      if (v39 != &__dst[1])
      {
        v359 = v39;
        unint64_t v40 = (void ***)v285;
LABEL_82:
        *unint64_t v40 = 0;
        goto LABEL_84;
      }
      v359 = (void **)v358;
      (*((void (**)(void))__dst[1] + 3))();
LABEL_84:
      long long v360 = *(_OWORD *)((char *)v285 + 8);
      long long v42 = &v362;
      if (!*(void *)&v286[0]) {
        goto LABEL_87;
      }
      if (*(_OWORD **)&v286[0] != (_OWORD *)((char *)&v285[1] + 8))
      {
        v362 = *(void ***)&v286[0];
        long long v42 = (void ***)v286;
LABEL_87:
        unint64_t *v42 = 0;
        goto LABEL_89;
      }
      v362 = (void **)v361;
      (*(void (**)(void))(*((void *)&v285[1] + 1) + 24))();
LABEL_89:
      uint64_t v363 = *((void *)&v286[0] + 1);
      if (*(_OWORD **)&v286[0] == (_OWORD *)((char *)&v285[1] + 8))
      {
        (*(void (**)(char *))(*((void *)&v285[1] + 1) + 32))((char *)&v285[1] + 8);
        uint64_t v43 = *(void *)&v285[0];
        if (*(void ***)&v285[0] == &__dst[1]) {
          goto LABEL_96;
        }
      }
      else
      {
        if (*(void *)&v286[0]) {
          (*(void (**)(void))(**(void **)&v286[0] + 40))();
        }
        uint64_t v43 = *(void *)&v285[0];
        if (*(void ***)&v285[0] == &__dst[1])
        {
LABEL_96:
          (*((void (**)(void **))__dst[1] + 4))(&__dst[1]);
          goto LABEL_97;
        }
      }
      if (v43) {
        (*(void (**)(uint64_t))(*(void *)v43 + 40))(v43);
      }
LABEL_97:
      *(_OWORD *)long long __p = 0u;
      *(_OWORD *)v278 = 0u;
      *(_OWORD *)v279 = 0u;
      uint64_t v44 = (uint64_t)v359;
      uint64_t v297 = (uint64_t)v357;
      if (!v359) {
        goto LABEL_100;
      }
      if (v359 != v358)
      {
        uint64_t v44 = (*((uint64_t (**)(void))*v359 + 2))();
LABEL_100:
        v299 = (void *)v44;
        goto LABEL_102;
      }
      v299 = v298;
      (*(void (**)(void *, void *))(v358[0] + 24))(v358, v298);
LABEL_102:
      uint64_t v293 = *((void *)&v360 + 1);
      uint64_t v300 = v360;
      uint64_t v45 = (uint64_t)v362;
      if (!v362) {
        goto LABEL_105;
      }
      if (v362 != v361)
      {
        uint64_t v45 = (*((uint64_t (**)(void))*v362 + 2))();
LABEL_105:
        v295 = (void *)v45;
        goto LABEL_107;
      }
      v295 = v294;
      (*(void (**)(void *, void *))(v361[0] + 24))(v361, v294);
LABEL_107:
      uint64_t v296 = v363;
      uint64_t v46 = (uint64_t)v299;
      uint64_t v313 = v297;
      if (!v299) {
        goto LABEL_110;
      }
      if (v299 != v298)
      {
        uint64_t v46 = (*(uint64_t (**)(void))(*v299 + 16))();
LABEL_110:
        v315 = (void *)v46;
        goto LABEL_112;
      }
      v315 = v314;
      (*(void (**)(void *, void *))(v298[0] + 24))(v298, v314);
LABEL_112:
      uint64_t v316 = v300;
      uint64_t v47 = (uint64_t)v295;
      uint64_t v309 = v293;
      if (!v295) {
        goto LABEL_115;
      }
      if (v295 != v294)
      {
        uint64_t v47 = (*(uint64_t (**)(void))(*v295 + 16))();
LABEL_115:
        v311 = (void *)v47;
        goto LABEL_117;
      }
      v311 = v310;
      (*(void (**)(void *))(v294[0] + 24))(v294);
LABEL_117:
      uint64_t v312 = v296;
      uint64_t v48 = (uint64_t)v299;
      uint64_t v305 = v297;
      if (!v299) {
        goto LABEL_120;
      }
      if (v299 != v298)
      {
        uint64_t v48 = (*(uint64_t (**)(void))(*v299 + 16))();
LABEL_120:
        v307 = (void *)v48;
        goto LABEL_122;
      }
      v307 = v306;
      (*(void (**)(void *))(v298[0] + 24))(v298);
LABEL_122:
      uint64_t v308 = v300;
      uint64_t v49 = (uint64_t)v295;
      uint64_t v301 = v293;
      if (!v295) {
        goto LABEL_125;
      }
      if (v295 != v294)
      {
        uint64_t v49 = (*(uint64_t (**)(void))(*v295 + 16))();
LABEL_125:
        v303 = (void *)v49;
        goto LABEL_127;
      }
      v303 = v302;
      (*(void (**)(void *))(v294[0] + 24))(v294);
LABEL_127:
      uint64_t v304 = v296;
      unint64_t v50 = sub_246CD54E4(&v305, &v301);
      uint64_t v51 = (uint64_t)v278[0];
      if (v50 > ((char *)v278[0] - (char *)__p[0]) >> 3)
      {
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
          uint64_t v51 = 0;
          __p[0] = 0;
          __p[1] = 0;
          v278[0] = 0;
        }
        if (v50 >> 61) {
          goto LABEL_677;
        }
        uint64_t v52 = v51 >> 2;
        if (v51 >> 2 <= v50) {
          uint64_t v52 = v50;
        }
        unint64_t v53 = (unint64_t)v51 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v52;
        if (v53 >> 61) {
LABEL_677:
        }
          sub_246CC23A4();
        __p[0] = operator new(8 * v53);
        __p[1] = __p[0];
        v278[0] = (char *)__p[0] + 8 * v53;
        uint64_t v54 = (uint64_t)v315;
        uint64_t v321 = v313;
        if (v315)
        {
          if (v315 != v314)
          {
            uint64_t v54 = (*(uint64_t (**)(void))(*v315 + 16))();
            goto LABEL_140;
          }
          v323 = v322;
          (*(void (**)(void *))(v314[0] + 24))(v314);
        }
        else
        {
LABEL_140:
          v323 = (void *)v54;
        }
        uint64_t v324 = v316;
        uint64_t v57 = (uint64_t)v311;
        uint64_t v317 = v309;
        if (v311)
        {
          if (v311 != v310)
          {
            uint64_t v57 = (*(uint64_t (**)(void))(*v311 + 16))();
            goto LABEL_154;
          }
          v319 = v318;
          (*(void (**)(void *))(v310[0] + 24))(v310);
        }
        else
        {
LABEL_154:
          v319 = (void *)v57;
        }
        uint64_t v320 = v312;
        sub_246CD57EC((uint64_t)__p, &v321, &v317);
        if (v319 == v318)
        {
          (*(void (**)(void *))(v318[0] + 32))(v318);
          uint64_t v58 = v323;
          if (v323 == v322) {
            goto LABEL_162;
          }
        }
        else
        {
          if (v319) {
            (*(void (**)(void))(*v319 + 40))();
          }
          uint64_t v58 = v323;
          if (v323 == v322)
          {
LABEL_162:
            (*(void (**)(void *))(v322[0] + 32))(v322);
            long long v59 = v303;
            if (v303 == v302) {
              goto LABEL_197;
            }
            goto LABEL_275;
          }
        }
        goto LABEL_272;
      }
      if (v50 > ((char *)__p[1] - (char *)__p[0]) >> 3)
      {
        uint64_t v55 = (uint64_t)v315;
        uint64_t v349 = v313;
        if (!v315) {
          goto LABEL_145;
        }
        if (v315 == v314)
        {
          v351 = v350;
          (*(void (**)(void *))(v314[0] + 24))(v314);
        }
        else
        {
          uint64_t v55 = (*(uint64_t (**)(void))(*v315 + 16))();
LABEL_145:
          v351 = (void *)v55;
        }
        uint64_t v352 = v316;
        int64_t v60 = ((char *)__p[1] - (char *)__p[0]) >> 3;
        if ((char *)__p[1] - (char *)__p[0] <= -8)
        {
          while (1)
          {
            v349 -= 8;
            if (!v351) {
LABEL_674:
            }
              sub_246CC4F54();
            if ((*(unsigned int (**)(void *))(*v351 + 48))(v351))
            {
              if (__CFADD__(v60++, 1)) {
                break;
              }
            }
          }
        }
        else if (__p[1] != __p[0])
        {
          do
          {
            do
            {
              v349 += 8;
              if (v349 == v352) {
                break;
              }
              if (!v351) {
                goto LABEL_674;
              }
            }
            while (((*(uint64_t (**)(void *))(*v351 + 48))(v351) & 1) == 0);
          }
          while (v60-- > 1);
        }
        uint64_t v353 = v349;
        unint64_t v62 = &v355;
        if (v351)
        {
          if (v351 != v350)
          {
            v355 = v351;
            unint64_t v62 = &v351;
            goto LABEL_175;
          }
          v355 = v354;
          (*(void (**)(void))(v350[0] + 24))();
        }
        else
        {
LABEL_175:
          *unint64_t v62 = 0;
        }
        uint64_t v356 = v352;
        if (v351 == v350)
        {
          (*(void (**)(void *))(v350[0] + 32))(v350);
          char v74 = v315;
          uint64_t v345 = v313;
          if (!v315) {
            goto LABEL_217;
          }
        }
        else
        {
          if (v351) {
            (*(void (**)(void))(*v351 + 40))();
          }
          char v74 = v315;
          uint64_t v345 = v313;
          if (!v315)
          {
LABEL_217:
            v347 = v74;
            goto LABEL_219;
          }
        }
        if (v74 != v314)
        {
          char v74 = (void *)(*(uint64_t (**)(void *))(*v74 + 16))(v74);
          goto LABEL_217;
        }
        v347 = v346;
        (*(void (**)(void *))(v314[0] + 24))(v314);
LABEL_219:
        uint64_t v348 = v316;
        uint64_t v75 = (uint64_t)v355;
        uint64_t v341 = v353;
        if (v355)
        {
          if (v355 != v354)
          {
            uint64_t v75 = (*(uint64_t (**)(void))(*v355 + 16))();
            goto LABEL_222;
          }
          v343 = v342;
          (*(void (**)(void *))(v354[0] + 24))(v354);
        }
        else
        {
LABEL_222:
          v343 = (void *)v75;
        }
        uint64_t v344 = v356;
        uint64_t v76 = __p[0];
        uint64_t v77 = (uint64_t)v347;
        v369 = (char *)v345;
        if (v347)
        {
          if (v347 != v346)
          {
            uint64_t v77 = (*(uint64_t (**)(void))(*v347 + 16))();
            goto LABEL_227;
          }
          v372 = (void **)&v370;
          (*(void (**)(void *))(v346[0] + 24))(v346);
        }
        else
        {
LABEL_227:
          v372 = (void **)v77;
        }
        uint64_t v373 = v348;
        uint64_t v78 = (uint64_t)v343;
        uint64_t v364 = v341;
        if (v343)
        {
          if (v343 != v342)
          {
            uint64_t v78 = (*(uint64_t (**)(void))(*v343 + 16))();
            goto LABEL_232;
          }
          v367 = (void **)&v365;
          (*(void (**)(void *))(v342[0] + 24))(v342);
        }
        else
        {
LABEL_232:
          v367 = (void **)v78;
        }
        uint64_t v368 = v344;
        sub_246CD6028(__dst, (uint64_t *)&v369, &v364, v76);
        if (*(void ***)&v285[0] == &__dst[1])
        {
          (*((void (**)(void **))__dst[1] + 4))(&__dst[1]);
          uint64_t v79 = v367;
          if (v367 != (void **)&v365) {
            goto LABEL_238;
          }
        }
        else
        {
          if (*(void *)&v285[0]) {
            (*(void (**)(void))(**(void **)&v285[0] + 40))();
          }
          uint64_t v79 = v367;
          if (v367 != (void **)&v365)
          {
LABEL_238:
            if (v79) {
              (*((void (**)(void **))*v79 + 5))(v79);
            }
            uint64_t v80 = v372;
            if (v372 != (void **)&v370)
            {
LABEL_241:
              if (v80) {
                (*((void (**)(void **))*v80 + 5))(v80);
              }
              std::string v81 = v343;
              if (v343 != v342)
              {
LABEL_244:
                if (v81) {
                  (*(void (**)(void *))(*v81 + 40))(v81);
                }
                char v82 = v347;
                if (v347 != v346)
                {
LABEL_247:
                  if (v82) {
                    (*(void (**)(void *))(*v82 + 40))(v82);
                  }
                  uint64_t v83 = v355;
                  uint64_t v337 = v353;
                  if (!v355)
                  {
LABEL_258:
                    v339 = v83;
                    goto LABEL_260;
                  }
LABEL_256:
                  if (v83 != v354)
                  {
                    uint64_t v83 = (void *)(*(uint64_t (**)(void *))(*v83 + 16))(v83);
                    goto LABEL_258;
                  }
                  v339 = v338;
                  (*(void (**)(void *))(v354[0] + 24))(v354);
LABEL_260:
                  uint64_t v340 = v356;
                  uint64_t v84 = (uint64_t)v311;
                  uint64_t v333 = v309;
                  if (v311)
                  {
                    if (v311 != v310)
                    {
                      uint64_t v84 = (*(uint64_t (**)(void))(*v311 + 16))();
                      goto LABEL_263;
                    }
                    v335 = v334;
                    (*(void (**)(void *))(v310[0] + 24))(v310);
                  }
                  else
                  {
LABEL_263:
                    v335 = (void *)v84;
                  }
                  uint64_t v336 = v312;
                  sub_246CD57EC((uint64_t)__p, &v337, &v333);
                  if (v335 == v334)
                  {
                    (*(void (**)(void *))(v334[0] + 32))(v334);
                    char v85 = v339;
                    if (v339 == v338) {
                      goto LABEL_455;
                    }
LABEL_269:
                    if (v85) {
                      (*(void (**)(void *))(*v85 + 40))(v85);
                    }
                    uint64_t v58 = v355;
                    if (v355 == v354)
                    {
LABEL_456:
                      (*(void (**)(void *))(v354[0] + 32))(v354);
                      long long v59 = v303;
                      if (v303 == v302) {
                        goto LABEL_197;
                      }
                      goto LABEL_275;
                    }
                  }
                  else
                  {
                    if (v335) {
                      (*(void (**)(void))(*v335 + 40))();
                    }
                    char v85 = v339;
                    if (v339 != v338) {
                      goto LABEL_269;
                    }
LABEL_455:
                    (*(void (**)(void *))(v338[0] + 32))(v338);
                    uint64_t v58 = v355;
                    if (v355 == v354) {
                      goto LABEL_456;
                    }
                  }
LABEL_272:
                  if (v58) {
                    (*(void (**)(void *))(*v58 + 40))(v58);
                  }
                  long long v59 = v303;
                  if (v303 == v302) {
                    goto LABEL_197;
                  }
                  goto LABEL_275;
                }
LABEL_255:
                (*(void (**)(void *))(v346[0] + 32))(v346);
                uint64_t v83 = v355;
                uint64_t v337 = v353;
                if (!v355) {
                  goto LABEL_258;
                }
                goto LABEL_256;
              }
LABEL_254:
              (*(void (**)(void *))(v342[0] + 32))(v342);
              char v82 = v347;
              if (v347 != v346) {
                goto LABEL_247;
              }
              goto LABEL_255;
            }
LABEL_253:
            ((void (*)(void (***)(void)))v370[4])(&v370);
            std::string v81 = v343;
            if (v343 != v342) {
              goto LABEL_244;
            }
            goto LABEL_254;
          }
        }
        v365[4]((void **)&v365);
        uint64_t v80 = v372;
        if (v372 != (void **)&v370) {
          goto LABEL_241;
        }
        goto LABEL_253;
      }
      uint64_t v56 = (uint64_t)v315;
      uint64_t v329 = v313;
      if (!v315) {
        goto LABEL_149;
      }
      if (v315 != v314)
      {
        uint64_t v56 = (*(uint64_t (**)(void))(*v315 + 16))();
LABEL_149:
        v331 = (void *)v56;
        goto LABEL_182;
      }
      v331 = v330;
      (*(void (**)(void *))(v314[0] + 24))(v314);
LABEL_182:
      uint64_t v332 = v316;
      uint64_t v64 = (uint64_t)v311;
      uint64_t v325 = v309;
      if (!v311) {
        goto LABEL_185;
      }
      if (v311 != v310)
      {
        uint64_t v64 = (*(uint64_t (**)(void))(*v311 + 16))();
LABEL_185:
        v327 = (void *)v64;
        goto LABEL_187;
      }
      v327 = v326;
      (*(void (**)(void *))(v310[0] + 24))(v310);
LABEL_187:
      uint64_t v328 = v312;
      sub_246CD6028(__dst, &v329, &v325, (void *)__p[0]);
      unint64_t v65 = *(void **)&v285[1];
      if (*(void ***)&v285[0] == &__dst[1])
      {
        (*((void (**)(void **))__dst[1] + 4))(&__dst[1]);
        uint64_t v66 = v327;
        if (v327 != v326) {
          goto LABEL_191;
        }
      }
      else
      {
        if (*(void *)&v285[0]) {
          (*(void (**)(void))(**(void **)&v285[0] + 40))();
        }
        uint64_t v66 = v327;
        if (v327 != v326)
        {
LABEL_191:
          if (v66) {
            (*(void (**)(void *))(*v66 + 40))(v66);
          }
          int64_t v67 = v331;
          if (v331 == v330)
          {
LABEL_206:
            (*(void (**)(void *))(v330[0] + 32))(v330);
            __p[1] = v65;
            long long v59 = v303;
            if (v303 == v302) {
              goto LABEL_197;
            }
            goto LABEL_275;
          }
          goto LABEL_194;
        }
      }
      (*(void (**)(void *))(v326[0] + 32))(v326);
      int64_t v67 = v331;
      if (v331 == v330) {
        goto LABEL_206;
      }
LABEL_194:
      if (v67) {
        (*(void (**)(void *))(*v67 + 40))(v67);
      }
      __p[1] = v65;
      long long v59 = v303;
      if (v303 == v302)
      {
LABEL_197:
        (*(void (**)(void *))(v302[0] + 32))(v302);
        unint64_t v68 = v307;
        if (v307 == v306) {
          goto LABEL_198;
        }
        goto LABEL_278;
      }
LABEL_275:
      if (v59) {
        (*(void (**)(void *))(*v59 + 40))(v59);
      }
      unint64_t v68 = v307;
      if (v307 == v306)
      {
LABEL_198:
        (*(void (**)(void *))(v306[0] + 32))(v306);
        std::string v69 = v311;
        if (v311 == v310) {
          goto LABEL_199;
        }
        goto LABEL_281;
      }
LABEL_278:
      if (v68) {
        (*(void (**)(void *))(*v68 + 40))(v68);
      }
      std::string v69 = v311;
      if (v311 == v310)
      {
LABEL_199:
        (*(void (**)(void *))(v310[0] + 32))(v310);
        unint64_t v70 = v315;
        if (v315 == v314) {
          goto LABEL_200;
        }
        goto LABEL_284;
      }
LABEL_281:
      if (v69) {
        (*(void (**)(void *))(*v69 + 40))(v69);
      }
      unint64_t v70 = v315;
      if (v315 == v314)
      {
LABEL_200:
        (*(void (**)(void *))(v314[0] + 32))(v314);
        unint64_t v71 = v295;
        if (v295 == v294) {
          goto LABEL_201;
        }
        goto LABEL_287;
      }
LABEL_284:
      if (v70) {
        (*(void (**)(void *))(*v70 + 40))(v70);
      }
      unint64_t v71 = v295;
      if (v295 == v294)
      {
LABEL_201:
        (*(void (**)(void *))(v294[0] + 32))(v294);
        uint64_t v72 = v299;
        if (v299 == v298) {
          goto LABEL_202;
        }
        goto LABEL_290;
      }
LABEL_287:
      if (v71) {
        (*(void (**)(void *))(*v71 + 40))(v71);
      }
      uint64_t v72 = v299;
      if (v299 == v298)
      {
LABEL_202:
        (*(void (**)(void *))(v298[0] + 32))(v298);
        uint64_t v73 = v359;
        uint64_t v364 = (uint64_t)v357;
        if (!v359) {
          goto LABEL_295;
        }
        goto LABEL_293;
      }
LABEL_290:
      if (v72) {
        (*(void (**)(void *))(*v72 + 40))(v72);
      }
      uint64_t v73 = v359;
      uint64_t v364 = (uint64_t)v357;
      if (!v359) {
        goto LABEL_295;
      }
LABEL_293:
      if (v73 != v358)
      {
        uint64_t v73 = (void **)(*((uint64_t (**)(void **))*v73 + 2))(v73);
LABEL_295:
        v367 = v73;
        goto LABEL_297;
      }
      v367 = (void **)&v365;
      (*(void (**)(void *, void (***)(void **)))(v358[0] + 24))(v358, &v365);
LABEL_297:
      uint64_t v353 = *((void *)&v360 + 1);
      uint64_t v368 = v360;
      uint64_t v86 = (uint64_t)v362;
      if (!v362) {
        goto LABEL_300;
      }
      if (v362 != v361)
      {
        uint64_t v86 = (*((uint64_t (**)(void))*v362 + 2))();
LABEL_300:
        v355 = (void *)v86;
        goto LABEL_302;
      }
      v355 = v354;
      (*(void (**)(void *, void *))(v361[0] + 24))(v361, v354);
LABEL_302:
      uint64_t v356 = v363;
      uint64_t v87 = (uint64_t)v367;
      __dst[0] = (void *)v364;
      if (!v367) {
        goto LABEL_305;
      }
      if (v367 != (void **)&v365)
      {
        uint64_t v87 = (*((uint64_t (**)(void))*v367 + 2))();
LABEL_305:
        *(void *)&v285[0] = v87;
        goto LABEL_307;
      }
      *(void *)&v285[0] = &__dst[1];
      v365[3]((void **)&v365);
LABEL_307:
      *((void *)&v285[0] + 1) = v368;
      uint64_t v88 = (uint64_t)v355;
      v369 = (char *)v353;
      if (!v355) {
        goto LABEL_310;
      }
      if (v355 != v354)
      {
        uint64_t v88 = (*(uint64_t (**)(void))(*v355 + 16))();
LABEL_310:
        v372 = (void **)v88;
        goto LABEL_312;
      }
      v372 = (void **)&v370;
      (*(void (**)(void *, void (***)(void)))(v354[0] + 24))(v354, &v370);
LABEL_312:
      uint64_t v373 = v356;
      unint64_t v89 = sub_246CD54E4((uint64_t *)__dst, (uint64_t *)&v369);
      if (v372 == (void **)&v370)
      {
        ((void (*)(void (***)(void)))v370[4])(&v370);
        uint64_t v90 = *(void *)&v285[0];
        if (*(void ***)&v285[0] == &__dst[1]) {
          goto LABEL_325;
        }
      }
      else
      {
        if (v372) {
          (*((void (**)(void))*v372 + 5))();
        }
        uint64_t v90 = *(void *)&v285[0];
        if (*(void ***)&v285[0] == &__dst[1])
        {
LABEL_325:
          (*((void (**)(void **))__dst[1] + 4))(&__dst[1]);
          char v91 = v355;
          if (v355 == v354) {
            goto LABEL_326;
          }
          goto LABEL_319;
        }
      }
      if (v90) {
        (*(void (**)(uint64_t))(*(void *)v90 + 40))(v90);
      }
      char v91 = v355;
      if (v355 == v354)
      {
LABEL_326:
        (*(void (**)(void *))(v354[0] + 32))(v354);
        char v92 = v367;
        if (v367 == (void **)&v365) {
          goto LABEL_327;
        }
        goto LABEL_322;
      }
LABEL_319:
      if (v91) {
        (*(void (**)(void *))(*v91 + 40))(v91);
      }
      char v92 = v367;
      if (v367 == (void **)&v365)
      {
LABEL_327:
        v365[4]((void **)&v365);
        goto LABEL_328;
      }
LABEL_322:
      if (v92) {
        (*((void (**)(void **))*v92 + 5))(v92);
      }
LABEL_328:
      sub_246CCB4F4((uint64_t)&v278[1], v89, 0);
      *(void *)&v279[16] = 0;
      if (v362 == v361)
      {
        (*(void (**)(void *))(v361[0] + 32))(v361);
        unint64_t v93 = v359;
        if (v359 == v358) {
          goto LABEL_442;
        }
      }
      else
      {
        if (v362) {
          (*((void (**)(void))*v362 + 5))();
        }
        unint64_t v93 = v359;
        if (v359 == v358)
        {
LABEL_442:
          (*(void (**)(void *))(v358[0] + 32))(v358);
          if (!v265) {
            goto LABEL_443;
          }
          goto LABEL_335;
        }
      }
      if (v93) {
        (*((void (**)(void **))*v93 + 5))(v93);
      }
      if (!v265)
      {
LABEL_443:
        int v150 = 0;
        char v151 = 1;
        v152 = v278[1];
        if (!v278[1]) {
          goto LABEL_445;
        }
        goto LABEL_444;
      }
LABEL_335:
      for (uint64_t i = 0; i != v265; ++i)
      {
        if (*(void *)&v279[16] == *(void *)v279)
        {
          char v151 = 0;
          *(unsigned char *)a4 = 0;
          *(unsigned char *)(a4 + 96) = 0;
          int v150 = 1;
          v152 = v278[1];
          if (!v278[1]) {
            goto LABEL_445;
          }
LABEL_444:
          operator delete(v152);
          goto LABEL_445;
        }
        uint64_t v95 = *(void *)&v279[16] - 63;
        if (*(void *)&v279[16] - 63 < 0) {
          uint64_t v95 = *(void *)&v279[16];
        }
        uint64_t v96 = v95 >> 6;
        if (*(uint64_t *)&v279[16] >= 0) {
          uint64_t v96 = *(void *)&v279[16] >> 6;
        }
        LOBYTE(v353) = 0;
        v357 = (char *)v278[1] + 8 * v96;
        LODWORD(v358[0]) = v279[16] & 0x3F;
        v369 = (char *)v278[1] + 8 * (*(void *)v279 >> 6);
        LODWORD(v370) = v279[0] & 0x3F;
        sub_246CCE1AC((uint64_t)&v357, (uint64_t)&v369, &v353, (uint64_t)__dst);
        uint64_t v97 = v278[1];
        unint64_t v98 = (char *)__p[0];
        *(void *)&v279[16] = LODWORD(__dst[1]) + 8 * ((char *)__dst[0] - (char *)v278[1]);
        uint64_t v99 = *(void *)(*a1 + 8 * *((void *)__p[0] + *(void *)&v279[16]));
        if (v263) {
          int v100 = i;
        }
        else {
          int v100 = 0;
        }
        v20[(v100 + v260 * HIDWORD(v10))] = v99;
        uint64_t v101 = *a2 + 24 * v99;
        *(void *)&long long v284 = 0;
        __dst[0] = 0;
        __dst[1] = 0;
        v103 = *(unsigned char **)v101;
        __int16 v102 = *(unsigned char **)(v101 + 8);
        int64_t v104 = v102 - v103;
        if (v102 != v103)
        {
          if (v104 < 0) {
            sub_246CC23A4();
          }
          std::string v105 = (char *)operator new(v102 - v103);
          __dst[0] = v105;
          memcpy(v105, v103, v104);
          v106 = (char *)__p[1];
          uint64_t v107 = v268[1];
          int64_t v108 = (uint64_t *)v105;
          while (1)
          {
            uint64_t v109 = *v108;
            *((unsigned char *)memptr + *v108) = 1;
            if ((*(void *)&v279[16] & 0x8000000000000000) != 0)
            {
              uint64_t v111 = *(void *)&v279[16] - 63;
              if (*(void *)&v279[16] - 63 < 0) {
                uint64_t v111 = *(void *)&v279[16];
              }
              uint64_t v110 = v111 >> 6;
            }
            else
            {
              uint64_t v110 = *(void *)&v279[16] >> 6;
            }
            uint64_t v112 = &v97[8 * (*(void *)v279 >> 6)];
            uint64_t v113 = &v97[8 * v110];
            unint64_t v114 = (v279[0] & 0x3F) + 8 * (v112 - v113);
            unint64_t v115 = v114 - (v279[16] & 0x3F);
            int v116 = v279[16] & 0x3F;
            if ((v279[16] & 0x3F) != 0)
            {
              unint64_t v117 = (64 - v116);
              if (v117 >= v115) {
                unint64_t v118 = v114 - (v279[16] & 0x3F);
              }
              else {
                unint64_t v118 = (64 - v116);
              }
              unint64_t v119 = (0xFFFFFFFFFFFFFFFFLL >> (v117 - v118)) & (-1 << (v279[16] & 0x3F)) & ~*(void *)v113;
              if (v119)
              {
                uint64_t v120 = __clz(__rbit64(v119)) + 8 * (v113 - v97);
                *(void *)&v279[16] = v120;
                if (v120 < 0) {
                  goto LABEL_362;
                }
                goto LABEL_377;
              }
              if (v115 <= v117)
              {
                uint64_t v120 = (((_BYTE)v115 + v279[16]) & 0x3F) + 8 * (&v113[8 * (v114 >> 6)] - v97);
                *(void *)&v279[16] = v120;
                if (v120 < 0) {
                  goto LABEL_362;
                }
                goto LABEL_377;
              }
              v115 -= v118;
              v113 += 8;
            }
            if (v115 >= 0x40)
            {
              while (*(void *)v113 == -1)
              {
                v113 += 8;
                v115 -= 64;
                if (v115 <= 0x3F) {
                  goto LABEL_370;
                }
              }
              unint64_t v115 = __clz(__rbit64(~*(void *)v113));
LABEL_376:
              uint64_t v120 = v115 + 8 * (v113 - v97);
              *(void *)&v279[16] = v120;
              if (v120 < 0) {
                goto LABEL_362;
              }
              goto LABEL_377;
            }
LABEL_370:
            if (!v115) {
              goto LABEL_376;
            }
            unint64_t v123 = __clz(__rbit64((0xFFFFFFFFFFFFFFFFLL >> -(char)v115) & ~*(void *)v113));
            if (((0xFFFFFFFFFFFFFFFFLL >> -(char)v115) & ~*(void *)v113) != 0) {
              unint64_t v115 = v123;
            }
            uint64_t v120 = v115 + 8 * (v113 - v97);
            *(void *)&v279[16] = v120;
            if (v120 < 0)
            {
LABEL_362:
              uint64_t v121 = v120 - 63;
              if (v120 - 63 < 0) {
                uint64_t v121 = v120;
              }
              uint64_t v122 = v121 >> 6;
              goto LABEL_378;
            }
LABEL_377:
            uint64_t v122 = (unint64_t)v120 >> 6;
LABEL_378:
            int v124 = v279[0] & 0x3F;
            v125 = &v98[8 * v120];
            v126 = &v97[8 * v122];
            int v127 = v120 & 0x3F;
            for (j = v125; ; j += 8)
            {
              if (v125 == v106 && v126 == v112 && v127 == v124)
              {
                j = v106;
                int v127 = v279[0] & 0x3F;
                goto LABEL_392;
              }
              if (*(void *)v125 == v109 && ((*(void *)v126 >> v127) & 1) == 0) {
                break;
              }
              v125 += 8;
              v126 += 8 * (v127 == 63);
              if (v127 == 63) {
                int v127 = 0;
              }
              else {
                ++v127;
              }
            }
            if (v125 != v106 || v126 != v112)
            {
LABEL_395:
              *(void *)&v97[((unint64_t)-((v98 - j) >> 3) >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << -((v98 - j) >> 3);
              unint64_t v129 = v269;
              unint64_t v130 = v270;
              if ((v270 & 0x8000000000000000) != 0) {
                goto LABEL_396;
              }
LABEL_394:
              unint64_t v131 = v130 >> 6;
              goto LABEL_399;
            }
LABEL_392:
            if (v127 != v124) {
              goto LABEL_395;
            }
            unint64_t v129 = v269;
            unint64_t v130 = v270;
            if ((v270 & 0x8000000000000000) == 0) {
              goto LABEL_394;
            }
LABEL_396:
            uint64_t v132 = v130 - 63;
            if ((uint64_t)(v130 - 63) < 0) {
              uint64_t v132 = v130;
            }
            unint64_t v131 = v132 >> 6;
LABEL_399:
            v133 = &v107[8 * (v129 >> 6)];
            v134 = &v107[8 * v131];
            unint64_t v135 = (v129 & 0x3F) + 8 * (v133 - v134);
            unint64_t v136 = v135 - (v130 & 0x3F);
            int v137 = v130 & 0x3F;
            if ((v130 & 0x3F) != 0)
            {
              unint64_t v138 = (64 - v137);
              if (v138 >= v136) {
                unint64_t v139 = v135 - (v130 & 0x3F);
              }
              else {
                unint64_t v139 = (64 - v137);
              }
              unint64_t v140 = (0xFFFFFFFFFFFFFFFFLL >> (v138 - v139)) & (-1 << (v130 & 0x3F)) & ~*(void *)v134;
              if (v140)
              {
                uint64_t v141 = __clz(__rbit64(v140)) + 8 * (v134 - v107);
                unint64_t v270 = v141;
                if (v141 >= 0) {
                  goto LABEL_420;
                }
                goto LABEL_405;
              }
              if (v136 <= v138)
              {
                uint64_t v141 = (((_BYTE)v136 + (_BYTE)v130) & 0x3F) + 8 * (&v134[8 * (v135 >> 6)] - v107);
                unint64_t v270 = v141;
                if (v141 >= 0) {
                  goto LABEL_420;
                }
                goto LABEL_405;
              }
              v136 -= v139;
              v134 += 8;
            }
            if (v136 >= 0x40)
            {
              while (*(void *)v134 == -1)
              {
                v134 += 8;
                v136 -= 64;
                if (v136 <= 0x3F) {
                  goto LABEL_413;
                }
              }
              unint64_t v136 = __clz(__rbit64(~*(void *)v134));
LABEL_419:
              uint64_t v141 = v136 + 8 * (v134 - v107);
              unint64_t v270 = v141;
              if (v141 >= 0) {
                goto LABEL_420;
              }
              goto LABEL_405;
            }
LABEL_413:
            if (!v136) {
              goto LABEL_419;
            }
            unint64_t v144 = __clz(__rbit64((0xFFFFFFFFFFFFFFFFLL >> -(char)v136) & ~*(void *)v134));
            if (((0xFFFFFFFFFFFFFFFFLL >> -(char)v136) & ~*(void *)v134) != 0) {
              unint64_t v136 = v144;
            }
            uint64_t v141 = v136 + 8 * (v134 - v107);
            unint64_t v270 = v141;
            if (v141 >= 0)
            {
LABEL_420:
              unint64_t v143 = (unint64_t)v141 >> 6;
              goto LABEL_421;
            }
LABEL_405:
            uint64_t v142 = v141 - 63;
            if (v141 - 63 < 0) {
              uint64_t v142 = v141;
            }
            unint64_t v143 = v142 >> 6;
LABEL_421:
            int v145 = v129 & 0x3F;
            v146 = &v266[v141];
            v147 = &v107[8 * v143];
            int v148 = v141 & 0x3F;
            for (k = v146; ; ++k)
            {
              if (v146 == v267 && v147 == v133 && v148 == v145)
              {
                k = v267;
                int v148 = v145;
                goto LABEL_435;
              }
              if (*v146 == v109 && ((*(void *)v147 >> v148) & 1) == 0) {
                break;
              }
              ++v146;
              v147 += 8 * (v148 == 63);
              if (v148 == 63) {
                int v148 = 0;
              }
              else {
                ++v148;
              }
            }
            if (v146 != v267 || v147 != v133) {
              goto LABEL_349;
            }
LABEL_435:
            if (v148 != v145) {
LABEL_349:
            }
              *(void *)&v107[((unint64_t)-(v266 - k) >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << -(v266 - k);
            if (++v108 == (uint64_t *)&v105[8 * (v104 >> 3)])
            {
              operator delete(v105);
              uint64_t v20 = (uint64_t *)__src;
              break;
            }
          }
        }
      }
      int v150 = 0;
      char v151 = 1;
      v152 = v278[1];
      if (v278[1]) {
        goto LABEL_444;
      }
LABEL_445:
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if ((v151 & 1) == 0) {
        goto LABEL_567;
      }
      if (++v260 == v259) {
        goto LABEL_499;
      }
    }
    *(void *)&v285[0] = v34;
    uint64_t v36 = &v372;
LABEL_65:
    *uint64_t v36 = 0;
    *((void *)&v285[0] + 1) = v373;
    *(void *)&v285[1] = v32;
LABEL_66:
    *(void *)&v286[0] = (char *)&v285[1] + 8;
    v35[3]((void **)&v365);
    long long v37 = v367;
    *((void *)&v286[0] + 1) = v368;
    if (v367 == (void **)&v365) {
      goto LABEL_78;
    }
    goto LABEL_67;
  }
LABEL_499:
  memset(v286, 0, sizeof(v286));
  memset(v285, 0, sizeof(v285));
  *(_OWORD *)long long __dst = 0u;
  long long v284 = 0u;
  v182 = &v372;
  v369 = 0;
  v370 = (void (**)(void))&unk_26FB3DEB8;
  v371 = memptr;
  v372 = (void **)&v370;
  uint64_t v373 = 128;
  v183 = (void **)&v370;
  v357 = 0;
  while (1)
  {
    char v184 = (*((uint64_t (**)(void **, char **))*v183 + 6))(v183, &v357);
    uint64_t v185 = (uint64_t)v369;
    if (v184) {
      break;
    }
    uint64_t v185 = (uint64_t)(v369 + 1);
    v369 = (char *)v185;
    if (v185 == v373) {
      break;
    }
    v183 = v372;
    v357 = (char *)v185;
    if (!v372) {
      sub_246CC4F54();
    }
  }
  v186 = (void (**)(void **))&unk_26FB3DEB8;
  uint64_t v364 = 128;
  v365 = (void (**)(void **))&unk_26FB3DEB8;
  v366 = memptr;
  v367 = (void **)&v365;
  uint64_t v368 = 128;
  v357 = (char *)v185;
  if (!v372)
  {
    v182 = &v359;
    goto LABEL_509;
  }
  if (v372 != (void **)&v370)
  {
    v359 = v372;
LABEL_509:
    *v182 = 0;
    *(void *)&long long v360 = v373;
    *((void *)&v360 + 1) = 128;
    goto LABEL_510;
  }
  v359 = (void **)v358;
  ((void (*)(void (***)(void), void *))v370[3])(&v370, v358);
  *(void *)&long long v360 = v373;
  *((void *)&v360 + 1) = v364;
  if (v367)
  {
    if (v367 == (void **)&v365)
    {
      v186 = v365;
LABEL_510:
      v362 = (void **)v361;
      v186[3]((void **)&v365);
      v187 = v367;
      uint64_t v363 = v368;
      if (v367 != (void **)&v365) {
        goto LABEL_511;
      }
LABEL_523:
      v365[4]((void **)&v365);
      v188 = v372;
      if (v372 != (void **)&v370) {
        goto LABEL_514;
      }
      goto LABEL_524;
    }
    v191 = &v367;
    v362 = v367;
  }
  else
  {
    v191 = &v362;
  }
  *v191 = 0;
  v187 = v367;
  uint64_t v363 = v368;
  if (v367 == (void **)&v365) {
    goto LABEL_523;
  }
LABEL_511:
  if (v187) {
    (*((void (**)(void **))*v187 + 5))(v187);
  }
  v188 = v372;
  if (v372 != (void **)&v370)
  {
LABEL_514:
    if (v188) {
      (*((void (**)(void **))*v188 + 5))(v188);
    }
    v189 = v359;
    __p[0] = v357;
    v190 = __p;
    if (!v359) {
      goto LABEL_527;
    }
    goto LABEL_525;
  }
LABEL_524:
  ((void (*)(void (***)(void)))v370[4])(&v370);
  v189 = v359;
  __p[0] = v357;
  v190 = __p;
  if (!v359)
  {
LABEL_527:
    v190[4] = 0;
    goto LABEL_529;
  }
LABEL_525:
  if (v189 != v358)
  {
    v190 = (void **)&v357;
    *(void *)v279 = v189;
    goto LABEL_527;
  }
  *(void *)v279 = &__p[1];
  (*(void (**)(void *, void **))(v358[0] + 24))(v358, &__p[1]);
LABEL_529:
  *(_OWORD *)&v279[8] = v360;
  v192 = __p;
  if (!v362)
  {
LABEL_532:
    v192[10] = 0;
    goto LABEL_534;
  }
  v192 = (void **)&v357;
  if (v362 != v361)
  {
    v281 = v362;
    goto LABEL_532;
  }
  v281 = (void **)v280;
  (*(void (**)(void))(v361[0] + 24))();
LABEL_534:
  uint64_t v282 = v363;
  if (v362 == v361)
  {
    (*(void (**)(void *))(v361[0] + 32))(v361);
    v193 = v359;
    if (v359 != v358) {
      goto LABEL_538;
    }
  }
  else
  {
    if (v362) {
      (*((void (**)(void))*v362 + 5))();
    }
    v193 = v359;
    if (v359 != v358)
    {
LABEL_538:
      if (v193) {
        (*((void (**)(void **))*v193 + 5))(v193);
      }
      v194 = *(void ***)v279;
      v357 = (char *)__p[0];
      if (!*(void *)v279) {
        goto LABEL_546;
      }
      goto LABEL_544;
    }
  }
  (*(void (**)(void *))(v358[0] + 32))(v358);
  v194 = *(void ***)v279;
  v357 = (char *)__p[0];
  if (!*(void *)v279)
  {
LABEL_546:
    v359 = v194;
    goto LABEL_548;
  }
LABEL_544:
  if (v194 != &__p[1])
  {
    v194 = (void **)(*((uint64_t (**)(void **))*v194 + 2))(v194);
    goto LABEL_546;
  }
  v359 = (void **)v358;
  (*((void (**)(void **, void *))__p[1] + 3))(&__p[1], v358);
LABEL_548:
  *(void *)&long long v360 = *(void *)&v279[8];
  v369 = *(char **)&v279[16];
  uint64_t v195 = (uint64_t)v281;
  if (!v281)
  {
LABEL_551:
    v372 = (void **)v195;
    goto LABEL_553;
  }
  if (v281 != v280)
  {
    uint64_t v195 = (*((uint64_t (**)(void))*v281 + 2))();
    goto LABEL_551;
  }
  v372 = (void **)&v370;
  (*(void (**)(void *, void (***)(void)))(v280[0] + 24))(v280, &v370);
LABEL_553:
  uint64_t v373 = v282;
  uint64_t v196 = (uint64_t)v357;
  if (v357 != v369)
  {
    while (1)
    {
      uint64_t v219 = *(void *)(*a1 + 8 * v196);
      if (*((unsigned char *)__dst + v219)) {
        goto LABEL_633;
      }
      *((unsigned char *)__dst + v219) = 1;
      v220 = v272;
      if (v272 >= v273) {
        break;
      }
      *(void *)v272 = v219;
      uint64_t v221 = (uint64_t)(v220 + 8);
LABEL_632:
      v272 = (char *)v221;
      uint64_t v196 = (uint64_t)v357;
      uint64_t v20 = (uint64_t *)__src;
      do
      {
LABEL_633:
        v357 = (char *)++v196;
        if (v196 == (void)v360) {
          break;
        }
        uint64_t v364 = v196;
        if (!v359) {
          sub_246CC4F54();
        }
        char v240 = (*((uint64_t (**)(void **, uint64_t *))*v359 + 6))(v359, &v364);
        uint64_t v196 = (uint64_t)v357;
      }
      while ((v240 & 1) == 0);
      if ((char *)v196 == v369) {
        goto LABEL_554;
      }
    }
    v222 = (char *)v271;
    int64_t v223 = v272 - (unsigned char *)v271;
    uint64_t v224 = (v272 - (unsigned char *)v271) >> 3;
    unint64_t v225 = v224 + 1;
    if ((unint64_t)(v224 + 1) >> 61) {
      sub_246CC23A4();
    }
    uint64_t v226 = v273 - (unsigned char *)v271;
    if ((v273 - (unsigned char *)v271) >> 2 > v225) {
      unint64_t v225 = v226 >> 2;
    }
    if ((unint64_t)v226 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v227 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v227 = v225;
    }
    if (v227)
    {
      if (v227 >> 61) {
        sub_246CC29A0();
      }
      v228 = (char *)operator new(8 * v227);
      v229 = &v228[8 * v224];
      *(void *)v229 = v219;
      uint64_t v221 = (uint64_t)(v229 + 8);
      int64_t v230 = v220 - v222;
      if (v220 == v222) {
        goto LABEL_630;
      }
    }
    else
    {
      v228 = 0;
      v229 = (char *)(8 * v224);
      *(void *)(8 * v224) = v219;
      uint64_t v221 = 8 * v224 + 8;
      int64_t v230 = v220 - v222;
      if (v220 == v222)
      {
LABEL_630:
        v271 = v229;
        v272 = (char *)v221;
        v273 = &v228[8 * v227];
        if (v222) {
          operator delete(v222);
        }
        goto LABEL_632;
      }
    }
    unint64_t v231 = v230 - 8;
    if (v231 < 0x58) {
      goto LABEL_687;
    }
    if ((unint64_t)(v220 - v228 - v223) < 0x20) {
      goto LABEL_687;
    }
    uint64_t v232 = (v231 >> 3) + 1;
    uint64_t v233 = 8 * (v232 & 0x3FFFFFFFFFFFFFFCLL);
    v234 = &v220[-v233];
    v229 -= v233;
    v235 = &v228[8 * v224 - 16];
    v236 = v220 - 16;
    uint64_t v237 = v232 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v238 = *(_OWORD *)v236;
      *((_OWORD *)v235 - 1) = *((_OWORD *)v236 - 1);
      *(_OWORD *)v235 = v238;
      v235 -= 32;
      v236 -= 32;
      v237 -= 4;
    }
    while (v237);
    v220 = v234;
    if (v232 != (v232 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_687:
      do
      {
        uint64_t v239 = *((void *)v220 - 1);
        v220 -= 8;
        *((void *)v229 - 1) = v239;
        v229 -= 8;
      }
      while (v220 != v222);
    }
    goto LABEL_630;
  }
LABEL_554:
  if (v372 == (void **)&v370)
  {
    ((void (*)(void (***)(void)))v370[4])(&v370);
    v197 = v359;
    if (v359 != v358) {
      goto LABEL_558;
    }
LABEL_644:
    (*(void (**)(void *))(v358[0] + 32))(v358);
    v198 = v281;
    if (v281 != v280) {
      goto LABEL_561;
    }
    goto LABEL_645;
  }
  if (v372) {
    (*((void (**)(void))*v372 + 5))();
  }
  v197 = v359;
  if (v359 == v358) {
    goto LABEL_644;
  }
LABEL_558:
  if (v197) {
    (*((void (**)(void **))*v197 + 5))(v197);
  }
  v198 = v281;
  if (v281 != v280)
  {
LABEL_561:
    if (v198) {
      (*((void (**)(void **))*v198 + 5))(v198);
    }
    uint64_t v199 = *(void *)v279;
    if (*(void ***)v279 != &__p[1]) {
      goto LABEL_564;
    }
    goto LABEL_646;
  }
LABEL_645:
  (*(void (**)(void *))(v280[0] + 32))(v280);
  uint64_t v199 = *(void *)v279;
  if (*(void ***)v279 != &__p[1])
  {
LABEL_564:
    if (v199) {
      (*(void (**)(uint64_t))(*(void *)v199 + 40))(v199);
    }
    int v150 = 0;
LABEL_567:
    v200 = v268[1];
    if (v268[1]) {
      goto LABEL_568;
    }
    goto LABEL_569;
  }
LABEL_646:
  (*((void (**)(void **))__p[1] + 4))(&__p[1]);
  int v150 = 0;
  v200 = v268[1];
  if (v268[1]) {
LABEL_568:
  }
    operator delete(v200);
LABEL_569:
  if (v266) {
    operator delete(v266);
  }
  if (!v150) {
    goto LABEL_574;
  }
  v201 = v271;
  if (v271)
  {
LABEL_659:
    v272 = (char *)v201;
    operator delete(v201);
  }
LABEL_660:
  if (v20) {
    free(v20);
  }
}

void sub_246CD2D3C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_246CC20E4(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_246CD3840(uint64_t a1)
{
  uint64_t v2 = a1 + 56;
  uint64_t v3 = *(void *)(a1 + 80);
  if (v3 != v2)
  {
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
    }
    uint64_t v4 = a1 + 8;
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5 != a1 + 8) {
      goto LABEL_5;
    }
LABEL_9:
    (*(void (**)(uint64_t))(*(void *)v4 + 32))(v4);
    return a1;
  }
  (*(void (**)(uint64_t))(*(void *)v2 + 32))(v2);
  uint64_t v4 = a1 + 8;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5 == a1 + 8) {
    goto LABEL_9;
  }
LABEL_5:
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 40))(v5);
  }
  return a1;
}

uint64_t sub_246CD3944(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2) {
    operator delete(v2);
  }
  uint64_t v3 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v3;
    operator delete(v3);
  }
  return a1;
}

uint64_t sub_246CD3984(uint64_t a1)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3 == v2)
  {
    (*(void (**)(uint64_t))(*(void *)v2 + 32))(v2);
    return a1;
  }
  else
  {
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
    }
    return a1;
  }
}

double sub_246CD3A18@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v6 = *(void *)(a2 + 8) + *(void *)(a1 + 8);
  long long v21 = 0uLL;
  uint64_t v20 = 0;
  sub_246CCB294((uint64_t)&v20, v6);
  sub_246CCE074(*(uint64_t **)a1, 0, (uint64_t *)(*(void *)a1 + 8 * (*(void *)(a1 + 8) >> 6)), *(void *)(a1 + 8) & 0x3F, &v20, &v22);
  BOOL v8 = *(uint64_t **)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  int v9 = v7 & 0x3F;
  if (v7 > 0x3F || (v7 & 0x3F) != 0)
  {
    int v10 = 0;
    BOOL v11 = &v8[v7 >> 6];
    do
    {
      uint64_t v12 = *v8;
      unint64_t v13 = v21;
      if ((void)v21 == *((void *)&v21 + 1) << 6)
      {
        if ((uint64_t)v21 + 1 < 0) {
          sub_246CC23A4();
        }
        unint64_t v14 = *((void *)&v21 + 1) << 7;
        if (*((void *)&v21 + 1) << 7 <= ((unint64_t)v21 & 0xFFFFFFFFFFFFFFC0) + 64) {
          unint64_t v14 = (v21 & 0xFFFFFFFFFFFFFFC0) + 64;
        }
        if ((unint64_t)v21 <= 0x3FFFFFFFFFFFFFFELL) {
          unint64_t v15 = v14;
        }
        else {
          unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
        }
        sub_246CCB294((uint64_t)&v20, v15);
        unint64_t v13 = v21;
      }
      *(void *)&long long v21 = v13 + 1;
      unint64_t v16 = v13 >> 6;
      uint64_t v17 = 1 << v13;
      if (((1 << v10) & v12) != 0) {
        uint64_t v18 = *(void *)(v20 + 8 * v16) | v17;
      }
      else {
        uint64_t v18 = *(void *)(v20 + 8 * v16) & ~v17;
      }
      *(void *)(v20 + 8 * v16) = v18;
      v8 += v10 == 63;
      if (v10 == 63) {
        int v10 = 0;
      }
      else {
        ++v10;
      }
    }
    while (v8 != v11 || v10 != v9);
  }
  *(void *)a3 = v20;
  double result = *(double *)&v21;
  *(_OWORD *)(a3 + 8) = v21;
  return result;
}

void sub_246CD3B88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CD3BA8(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned __int8 **a3@<X2>, void *a4@<X8>)
{
  unint64_t v8 = *(void *)(a2 + 8) + *(void *)(a1 + 8);
  unint64_t v127 = 0;
  uint64_t v128 = 0;
  v126 = 0;
  sub_246CCB294((uint64_t)&v126, v8);
  sub_246CCE074(*(uint64_t **)a1, 0, (uint64_t *)(*(void *)a1 + 8 * (*(void *)(a1 + 8) >> 6)), *(void *)(a1 + 8) & 0x3F, (uint64_t *)&v126, (uint64_t **)&__p);
  sub_246CCE074(*(uint64_t **)a2, 0, (uint64_t *)(*(void *)a2 + 8 * (*(void *)(a2 + 8) >> 6)), *(void *)(a2 + 8) & 0x3F, (uint64_t *)&v126, (uint64_t **)&__p);
  unint64_t v9 = v127;
  unint64_t v10 = v127 & 7;
  unint64_t v124 = 0;
  uint64_t v125 = 0;
  uint64_t v122 = v126;
  unint64_t v123 = 0;
  long long __p = v126;
  LODWORD(v130) = 0;
  LODWORD(v127) = v127 & 7;
  sub_246CCC7E8(&v123, (uint64_t)&__p, (uint64_t)&v126, v10);
  if (v10)
  {
    unint64_t v11 = v124;
    if (v124 == v125 << 6)
    {
      if ((uint64_t)(v124 + 1) < 0) {
        goto LABEL_214;
      }
      if (v124 > 0x3FFFFFFFFFFFFFFELL)
      {
        unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else if (v125 << 7 <= (v124 & 0xFFFFFFFFFFFFFFC0) + 64)
      {
        unint64_t v12 = (v124 & 0xFFFFFFFFFFFFFFC0) + 64;
      }
      else
      {
        unint64_t v12 = v125 << 7;
      }
      sub_246CCB294((uint64_t)&v123, v12);
      unint64_t v11 = v124;
    }
    unint64_t v124 = v11 + 1;
    *(void *)((char *)v123 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(1 << v11);
    if (v10 != 7)
    {
      unint64_t v13 = v124;
      if (v124 == v125 << 6)
      {
        if ((uint64_t)(v124 + 1) < 0) {
          goto LABEL_214;
        }
        if (v124 > 0x3FFFFFFFFFFFFFFELL)
        {
          unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else if (v125 << 7 <= (v124 & 0xFFFFFFFFFFFFFFC0) + 64)
        {
          unint64_t v14 = (v124 & 0xFFFFFFFFFFFFFFC0) + 64;
        }
        else
        {
          unint64_t v14 = v125 << 7;
        }
        sub_246CCB294((uint64_t)&v123, v14);
        unint64_t v13 = v124;
      }
      unint64_t v124 = v13 + 1;
      *(void *)((char *)v123 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(1 << v13);
      if (v10 != 6)
      {
        unint64_t v15 = v124;
        if (v124 == v125 << 6)
        {
          if ((uint64_t)(v124 + 1) < 0) {
            goto LABEL_214;
          }
          if (v124 > 0x3FFFFFFFFFFFFFFELL)
          {
            unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else if (v125 << 7 <= (v124 & 0xFFFFFFFFFFFFFFC0) + 64)
          {
            unint64_t v16 = (v124 & 0xFFFFFFFFFFFFFFC0) + 64;
          }
          else
          {
            unint64_t v16 = v125 << 7;
          }
          sub_246CCB294((uint64_t)&v123, v16);
          unint64_t v15 = v124;
        }
        unint64_t v124 = v15 + 1;
        *(void *)((char *)v123 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(1 << v15);
        if (v10 != 5)
        {
          unint64_t v17 = v124;
          if (v124 == v125 << 6)
          {
            if ((uint64_t)(v124 + 1) < 0) {
              goto LABEL_214;
            }
            if (v124 > 0x3FFFFFFFFFFFFFFELL)
            {
              unint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else if (v125 << 7 <= (v124 & 0xFFFFFFFFFFFFFFC0) + 64)
            {
              unint64_t v18 = (v124 & 0xFFFFFFFFFFFFFFC0) + 64;
            }
            else
            {
              unint64_t v18 = v125 << 7;
            }
            sub_246CCB294((uint64_t)&v123, v18);
            unint64_t v17 = v124;
          }
          unint64_t v124 = v17 + 1;
          *(void *)((char *)v123 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(1 << v17);
          if (v10 != 4)
          {
            unint64_t v19 = v124;
            if (v124 == v125 << 6)
            {
              if ((uint64_t)(v124 + 1) < 0) {
                goto LABEL_214;
              }
              if (v124 > 0x3FFFFFFFFFFFFFFELL)
              {
                unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else if (v125 << 7 <= (v124 & 0xFFFFFFFFFFFFFFC0) + 64)
              {
                unint64_t v20 = (v124 & 0xFFFFFFFFFFFFFFC0) + 64;
              }
              else
              {
                unint64_t v20 = v125 << 7;
              }
              sub_246CCB294((uint64_t)&v123, v20);
              unint64_t v19 = v124;
            }
            unint64_t v124 = v19 + 1;
            *(void *)((char *)v123 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(1 << v19);
            if (v10 != 3)
            {
              unint64_t v21 = v124;
              if (v124 == v125 << 6)
              {
                if ((uint64_t)(v124 + 1) < 0) {
                  goto LABEL_214;
                }
                if (v124 > 0x3FFFFFFFFFFFFFFELL)
                {
                  unint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
                }
                else if (v125 << 7 <= (v124 & 0xFFFFFFFFFFFFFFC0) + 64)
                {
                  unint64_t v22 = (v124 & 0xFFFFFFFFFFFFFFC0) + 64;
                }
                else
                {
                  unint64_t v22 = v125 << 7;
                }
                sub_246CCB294((uint64_t)&v123, v22);
                unint64_t v21 = v124;
              }
              unint64_t v124 = v21 + 1;
              *(void *)((char *)v123 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(1 << v21);
              if (v10 != 2)
              {
                unint64_t v23 = v124;
                if (v124 != v125 << 6)
                {
LABEL_64:
                  unint64_t v124 = v23 + 1;
                  *(void *)((char *)v123 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(1 << v23);
                  goto LABEL_65;
                }
                if ((uint64_t)(v124 + 1) >= 0)
                {
                  if (v124 > 0x3FFFFFFFFFFFFFFELL)
                  {
                    unint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
                  }
                  else if (v125 << 7 <= (v124 & 0xFFFFFFFFFFFFFFC0) + 64)
                  {
                    unint64_t v24 = (v124 & 0xFFFFFFFFFFFFFFC0) + 64;
                  }
                  else
                  {
                    unint64_t v24 = v125 << 7;
                  }
                  sub_246CCB294((uint64_t)&v123, v24);
                  unint64_t v23 = v124;
                  goto LABEL_64;
                }
LABEL_214:
                sub_246CC23A4();
              }
            }
          }
        }
      }
    }
  }
LABEL_65:
  int v25 = v9 & 0x3F;
  if (v9 > 0x3F || v25 != v10)
  {
    uint64_t v26 = v122;
    int64_t v27 = &v122[v9 >> 6];
    do
    {
      uint64_t v28 = *v26;
      unint64_t v29 = v124;
      if (v124 == v125 << 6)
      {
        if ((uint64_t)(v124 + 1) < 0) {
          sub_246CC23A4();
        }
        unint64_t v30 = v125 << 7;
        if (v125 << 7 <= (v124 & 0xFFFFFFFFFFFFFFC0) + 64) {
          unint64_t v30 = (v124 & 0xFFFFFFFFFFFFFFC0) + 64;
        }
        if (v124 <= 0x3FFFFFFFFFFFFFFELL) {
          unint64_t v31 = v30;
        }
        else {
          unint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
        }
        sub_246CCB294((uint64_t)&v123, v31);
        unint64_t v29 = v124;
      }
      unint64_t v124 = v29 + 1;
      unint64_t v32 = v29 >> 6;
      uint64_t v33 = 1 << v29;
      if (((1 << v10) & v28) != 0) {
        uint64_t v34 = *((void *)v123 + v32) | v33;
      }
      else {
        uint64_t v34 = *((void *)v123 + v32) & ~v33;
      }
      *((void *)v123 + v32) = v34;
      v26 += v10 == 63;
      if (v10 == 63) {
        LODWORD(v10) = 0;
      }
      else {
        LODWORD(v10) = v10 + 1;
      }
    }
    while (v26 != v27 || v10 != v25);
  }
  if (v124 >= 8)
  {
    size_t v39 = v124 >> 3;
    uint64_t v35 = (unsigned __int8 *)operator new(v124 >> 3);
    bzero(v35, v39);
    unint64_t v40 = 0;
    uint64_t v41 = 0;
    long long v42 = (char *)v123;
    do
    {
      uint64_t v43 = (v40 >> 3) & 0x1FFFFFFFFFFFFFF8;
      unsigned int v44 = v35[v41] | ((*(void *)&v42[v43] >> (v40 & 0x38)) << 7);
      v35[v41] = v44;
      int v45 = v44 | (((*(void *)&v42[v43] >> (v40 & 0x38 | 1)) & 1) << 6);
      v35[v41] = v45;
      int v46 = v45 | (32 * ((*(void *)&v42[v43] >> (v40 & 0x38 | 2)) & 1));
      v35[v41] = v46;
      int v47 = v46 | (16 * ((*(void *)&v42[v43] >> (v40 & 0x38 | 3)) & 1));
      v35[v41] = v47;
      int v48 = v47 | (8 * ((*(void *)&v42[v43] >> (v40 & 0x38 | 4)) & 1));
      v35[v41] = v48;
      int v49 = v48 | (4 * ((*(void *)&v42[v43] >> (v40 & 0x38 | 5)) & 1));
      v35[v41] = v49;
      int v50 = v49 | (2 * ((*(void *)&v42[v43] >> (v40 & 0x38 | 6)) & 1));
      v35[v41] = v50;
      v35[v41++] = v50 | (*(void *)&v42[v43] >> (v40 & 0x38 | 7)) & 1;
      v40 += 8;
    }
    while (v39 != v41);
    uint64_t v36 = (int8x16_t *)&v35[v39];
    int v37 = **a3;
    char v38 = v37 - 8;
    if (v37 == 8) {
      goto LABEL_93;
    }
  }
  else
  {
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    int v37 = **a3;
    char v38 = v37 - 8;
    if (v37 == 8) {
      goto LABEL_93;
    }
  }
  if (v37 == 16)
  {
LABEL_93:
    unsigned int v51 = 19;
    goto LABEL_95;
  }
  if (v37 == 64) {
    unsigned int v51 = 11;
  }
  else {
    unsigned int v51 = 9;
  }
LABEL_95:
  sub_246CCE650(a3, &__p);
  if (v130)
  {
    sub_246CCE650(a3, &v126);
    unint64_t v52 = v127 - 1;
    if (v126) {
      operator delete(v126);
    }
    unint64_t v53 = __p;
    if (!__p) {
      goto LABEL_100;
    }
  }
  else
  {
    unint64_t v52 = 0;
    unint64_t v53 = __p;
    if (!__p) {
      goto LABEL_100;
    }
  }
  operator delete(v53);
LABEL_100:
  unsigned int v54 = 8;
  unsigned int v55 = 5;
  if ((v38 & 0xF7) != 0) {
    unsigned int v55 = 8;
  }
  unint64_t v56 = v51 * (unint64_t)v55 - v52;
  int v57 = **a3;
  switch(v57)
  {
    case 8:
      goto LABEL_105;
    case 110:
      unint64_t v58 = v56;
      *a4 = 0;
      a4[1] = 0;
      a4[2] = 0;
      if (!v56) {
        goto LABEL_126;
      }
      goto LABEL_113;
    case 16:
LABEL_105:
      unsigned int v54 = 6;
      break;
  }
  if (v57 == 8)
  {
    uint64_t v68 = -6;
LABEL_125:
    unint64_t v58 = v68 + v56 + 9 * v54;
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    if (!v58) {
      goto LABEL_126;
    }
LABEL_113:
    if ((v58 & 0x8000000000000000) != 0) {
      sub_246CC23A4();
    }
    unint64_t v59 = (v58 - 1) >> 6;
    int64_t v60 = operator new(8 * (v59 + 1));
    uint64_t v61 = v60;
    a4[1] = v58;
    a4[2] = v59 + 1;
    *a4 = v60;
    if (v58 >= 0x41) {
      unint64_t v62 = (v58 - 1) >> 6;
    }
    else {
      unint64_t v62 = 0;
    }
    v60[v62] = 0;
    if (v58 >= 0x40) {
      bzero(v60, 8 * (v58 >> 6));
    }
    if ((v58 & 0x3F) != 0) {
      v61[v58 >> 6] &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v58 & 0x3F));
    }
    unint64_t v63 = v58 + 7;
    size_t v64 = (v58 + 7) >> 3;
    unint64_t v65 = (int8x16_t *)operator new(v64);
    uint64_t v66 = (int8x16_t *)((char *)v65 + v64);
    bzero(v65, v64);
    unint64_t v67 = (char *)v36 - (char *)v35;
    if (v36 == (int8x16_t *)v35) {
      goto LABEL_132;
    }
    goto LABEL_127;
  }
  if (v57 == 16)
  {
    uint64_t v68 = 0;
    goto LABEL_125;
  }
  unint64_t v58 = v56 + 5 * v54;
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  if (v58) {
    goto LABEL_113;
  }
LABEL_126:
  size_t v64 = 0;
  uint64_t v61 = 0;
  uint64_t v66 = 0;
  unint64_t v65 = 0;
  unint64_t v63 = 7;
  unint64_t v67 = (char *)v36 - (char *)v35;
  if (v36 == (int8x16_t *)v35) {
    goto LABEL_132;
  }
LABEL_127:
  if (v67 < 8 || v65 < v36 && v35 < &v65->u8[v67])
  {
    std::string v69 = v65;
    unint64_t v70 = (char *)v36;
    goto LABEL_131;
  }
  if (v67 >= 0x20)
  {
    unint64_t v75 = v67 & 0xFFFFFFFFFFFFFFE0;
    char v82 = v36 - 1;
    uint64_t v83 = v65 + 1;
    unint64_t v84 = v67 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      int8x16_t v85 = vrev64q_s8(*v82);
      int8x16_t v86 = vrev64q_s8(v82[-1]);
      v83[-1] = vextq_s8(v85, v85, 8uLL);
      *uint64_t v83 = vextq_s8(v86, v86, 8uLL);
      v82 -= 2;
      v83 += 2;
      v84 -= 32;
    }
    while (v84);
    if (v67 == v75) {
      goto LABEL_132;
    }
    if ((v67 & 0x18) == 0)
    {
      unint64_t v70 = &v36->i8[-v75];
      std::string v69 = (int8x16_t *)((char *)v65 + v75);
      do
      {
LABEL_131:
        __int8 v71 = *--v70;
        v69->i8[0] = v71;
        std::string v69 = (int8x16_t *)((char *)v69 + 1);
      }
      while (v70 != (char *)v35);
      goto LABEL_132;
    }
  }
  else
  {
    unint64_t v75 = 0;
  }
  std::string v69 = (int8x16_t *)((char *)v65 + (v67 & 0xFFFFFFFFFFFFFFF8));
  unint64_t v70 = &v36->i8[-(v67 & 0xFFFFFFFFFFFFFFF8)];
  uint64_t v87 = (int8x8_t *)((char *)v36 - v75 - 8);
  uint64_t v88 = (int8x8_t *)&v65->i8[v75];
  unint64_t v89 = v75 - (v67 & 0xFFFFFFFFFFFFFFF8);
  do
  {
    int8x8_t v90 = *v87--;
    *v88++ = vrev64_s8(v90);
    v89 += 8;
  }
  while (v89);
  if (v67 != (v67 & 0xFFFFFFFFFFFFFFF8)) {
    goto LABEL_131;
  }
LABEL_132:
  if (v65 == v66) {
    goto LABEL_156;
  }
  unint64_t v72 = (char *)v66 - (char *)v65;
  uint64_t v73 = v65;
  if ((unint64_t)((char *)v66 - (char *)v65) < 8) {
    goto LABEL_155;
  }
  if (v72 < 0x20)
  {
    unint64_t v74 = 0;
    goto LABEL_142;
  }
  unint64_t v74 = v72 & 0xFFFFFFFFFFFFFFE0;
  uint64_t v76 = v65 + 1;
  v77.i64[0] = 0xA5A5A5A5A5A5A5A5;
  v77.i64[1] = 0xA5A5A5A5A5A5A5A5;
  unint64_t v78 = v72 & 0xFFFFFFFFFFFFFFE0;
  do
  {
    int8x16_t v79 = veorq_s8(*v76, v77);
    v76[-1] = veorq_s8(v76[-1], v77);
    *uint64_t v76 = v79;
    v76 += 2;
    v78 -= 32;
  }
  while (v78);
  if (v72 != v74)
  {
    if ((v72 & 0x18) == 0)
    {
      uint64_t v73 = (int8x16_t *)((char *)v65 + v74);
      goto LABEL_155;
    }
LABEL_142:
    uint64_t v73 = (int8x16_t *)((char *)v65 + (v72 & 0xFFFFFFFFFFFFFFF8));
    uint64_t v80 = (int8x8_t *)&v65->i8[v74];
    unint64_t v81 = v74 - (v72 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      *uint64_t v80 = veor_s8(*v80, (int8x8_t)0xA5A5A5A5A5A5A5A5);
      ++v80;
      v81 += 8;
    }
    while (v81);
    if (v72 == (v72 & 0xFFFFFFFFFFFFFFF8)) {
      goto LABEL_156;
    }
    do
    {
LABEL_155:
      v73->i8[0] ^= 0xA5u;
      uint64_t v73 = (int8x16_t *)((char *)v73 + 1);
    }
    while (v73 != v66);
  }
LABEL_156:
  long long __p = 0;
  uint64_t v130 = 0;
  uint64_t v131 = 0;
  unint64_t v91 = v63 & 0xFFFFFFFFFFFFFFF8;
  if ((v63 & 0xFFFFFFFFFFFFFFF8) == 0)
  {
    unint64_t v93 = 0;
    if (!v58) {
      goto LABEL_187;
    }
    goto LABEL_168;
  }
  if ((v63 & 0x8000000000000000) != 0) {
    sub_246CC23A4();
  }
  char v92 = operator new(8 * ((v91 - 1) >> 6) + 8);
  unint64_t v93 = v92;
  if (v91 >= 0x41) {
    unint64_t v94 = (v91 - 1) >> 6;
  }
  else {
    unint64_t v94 = 0;
  }
  v92[v94] = 0;
  if (v91 >= 0x40) {
    bzero(v92, 8 * (v63 >> 6));
  }
  if ((v63 & 0x38) != 0) {
    v93[v63 >> 6] &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v63 & 0x38));
  }
  if (v58)
  {
LABEL_168:
    unint64_t v95 = 0;
    uint64_t v96 = v65;
    while (1)
    {
      __int8 v98 = v96->i8[0];
      uint64_t v96 = (int8x16_t *)((char *)v96 + 1);
      char v97 = v98;
      unint64_t v99 = (v95 + 7) >> 6;
      uint64_t v100 = 1 << (v95 + 7);
      if (v98)
      {
        v93[v99] |= v100;
        unint64_t v101 = (v95 + 6) >> 6;
        uint64_t v102 = 1 << ((v95 + 6) & 0x3E);
        if ((v97 & 2) == 0) {
          goto LABEL_180;
        }
LABEL_172:
        v93[v101] |= v102;
        unint64_t v103 = (v95 + 5) >> 6;
        uint64_t v104 = 1 << ((v95 + 5) & 0x3D);
        if ((v97 & 4) != 0) {
          goto LABEL_173;
        }
LABEL_181:
        v93[v103] &= ~v104;
        unint64_t v105 = (v95 + 4) >> 6;
        uint64_t v106 = 1 << ((v95 + 4) & 0x3C);
        if ((v97 & 8) == 0) {
          goto LABEL_182;
        }
LABEL_174:
        v93[v105] |= v106;
        unint64_t v107 = (v95 + 3) >> 6;
        uint64_t v108 = 1 << ((v95 + 3) & 0x3B);
        if ((v97 & 0x10) != 0) {
          goto LABEL_175;
        }
LABEL_183:
        v93[v107] &= ~v108;
        unint64_t v109 = (v95 + 2) >> 6;
        uint64_t v110 = 1 << ((v95 + 2) & 0x3A);
        if ((v97 & 0x20) == 0) {
          goto LABEL_184;
        }
LABEL_176:
        v93[v109] |= v110;
        unint64_t v111 = (v95 + 1) >> 6;
        uint64_t v112 = 1 << ((v95 + 1) & 0x39);
        if ((v97 & 0x40) != 0) {
          goto LABEL_177;
        }
LABEL_185:
        v93[v111] &= ~v112;
        unint64_t v113 = v95 >> 6;
        uint64_t v114 = 1 << (v95 & 0x38);
        if ((v97 & 0x80) == 0) {
          goto LABEL_169;
        }
LABEL_186:
        v93[v113] |= v114;
        v95 += 8;
        if (!--v64) {
          break;
        }
      }
      else
      {
        v93[v99] &= ~v100;
        unint64_t v101 = (v95 + 6) >> 6;
        uint64_t v102 = 1 << ((v95 + 6) & 0x3E);
        if ((v97 & 2) != 0) {
          goto LABEL_172;
        }
LABEL_180:
        v93[v101] &= ~v102;
        unint64_t v103 = (v95 + 5) >> 6;
        uint64_t v104 = 1 << ((v95 + 5) & 0x3D);
        if ((v97 & 4) == 0) {
          goto LABEL_181;
        }
LABEL_173:
        v93[v103] |= v104;
        unint64_t v105 = (v95 + 4) >> 6;
        uint64_t v106 = 1 << ((v95 + 4) & 0x3C);
        if ((v97 & 8) != 0) {
          goto LABEL_174;
        }
LABEL_182:
        v93[v105] &= ~v106;
        unint64_t v107 = (v95 + 3) >> 6;
        uint64_t v108 = 1 << ((v95 + 3) & 0x3B);
        if ((v97 & 0x10) == 0) {
          goto LABEL_183;
        }
LABEL_175:
        v93[v107] |= v108;
        unint64_t v109 = (v95 + 2) >> 6;
        uint64_t v110 = 1 << ((v95 + 2) & 0x3A);
        if ((v97 & 0x20) != 0) {
          goto LABEL_176;
        }
LABEL_184:
        v93[v109] &= ~v110;
        unint64_t v111 = (v95 + 1) >> 6;
        uint64_t v112 = 1 << ((v95 + 1) & 0x39);
        if ((v97 & 0x40) == 0) {
          goto LABEL_185;
        }
LABEL_177:
        v93[v111] |= v112;
        unint64_t v113 = v95 >> 6;
        uint64_t v114 = 1 << (v95 & 0x38);
        if (v97 < 0) {
          goto LABEL_186;
        }
LABEL_169:
        v93[v113] &= ~v114;
        v95 += 8;
        if (!--v64) {
          break;
        }
      }
    }
  }
LABEL_187:
  if ((uint64_t)v91 >= (uint64_t)v58) {
    int64_t v115 = v58;
  }
  else {
    int64_t v115 = v63 & 0xFFFFFFFFFFFFFFF8;
  }
  uint64_t v116 = v115 - 63;
  if (v115 - 63 < 0) {
    uint64_t v116 = v115;
  }
  uint64_t v117 = v116 >> 6;
  unint64_t v118 = (unint64_t)v115 >> 6;
  if (v115 < 0) {
    unint64_t v118 = v117;
  }
  uint64_t v119 = v115 & 0x3F | (v118 << 6);
  if (v119 < 1) {
    goto LABEL_199;
  }
  int64_t v120 = v115 & 0x3F;
  uint64_t v121 = v118 & 0x3FFFFFFFFFFFFFFLL;
  if ((unint64_t)v119 >= 0x40) {
    memcpy(v61, v93, 8 * (v118 & 0x3FFFFFFFFFFFFFFLL));
  }
  if (v120)
  {
    v61[v121] = v61[v121] & ~(0xFFFFFFFFFFFFFFFFLL >> -(char)v120) | v93[v121] & (0xFFFFFFFFFFFFFFFFLL >> -(char)v120);
  }
  else
  {
LABEL_199:
    if (!v93) {
      goto LABEL_201;
    }
  }
  operator delete(v93);
LABEL_201:
  if (v65) {
    operator delete(v65);
  }
  if (v35) {
    operator delete(v35);
  }
  if (v123) {
    operator delete(v123);
  }
  if (v122) {
    operator delete(v122);
  }
}

void sub_246CD48D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  if (__p)
  {
    operator delete(__p);
    if (!a9) {
      goto LABEL_6;
    }
  }
  else if (!a9)
  {
LABEL_6:
    _Unwind_Resume(exception_object);
  }
  operator delete(a9);
  goto LABEL_6;
}

void sub_246CD49D0(char **a1@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  unint64_t v6 = (char *)(v5 - *a1);
  unint64_t v7 = 8 * (void)v6;
  a3[1] = 0;
  a3[2] = 0;
  *a3 = 0;
  if (!(8 * (void)v6))
  {
    unint64_t v11 = 0;
    if (v5 == v4) {
      goto LABEL_32;
    }
    goto LABEL_13;
  }
  if ((v7 & 0x8000000000000000) != 0) {
    sub_246CC23A4();
  }
  unint64_t v9 = (v7 - 1) >> 6;
  unint64_t v10 = operator new(8 * (v9 + 1));
  unint64_t v11 = v10;
  a3[1] = v7;
  a3[2] = v9 + 1;
  *a3 = v10;
  if (v7 >= 0x41) {
    unint64_t v12 = (v7 - 1) >> 6;
  }
  else {
    unint64_t v12 = 0;
  }
  v10[v12] = 0;
  if (v7 >= 0x40) {
    bzero(v10, 8 * (v7 >> 6));
  }
  if ((v7 & 0x38) != 0) {
    v11[v7 >> 6] &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v7 & 0x38));
  }
  if (v5 != v4)
  {
LABEL_13:
    unint64_t v13 = 0;
    while (1)
    {
      char v15 = *v4++;
      char v14 = v15;
      unint64_t v16 = (v13 + 7) >> 6;
      uint64_t v17 = 1 << (v13 + 7);
      if (v15)
      {
        v11[v16] |= v17;
        unint64_t v18 = (v13 + 6) >> 6;
        uint64_t v19 = 1 << ((v13 + 6) & 0x3E);
        if ((v14 & 2) == 0) {
          goto LABEL_25;
        }
LABEL_17:
        v11[v18] |= v19;
        unint64_t v20 = (v13 + 5) >> 6;
        uint64_t v21 = 1 << ((v13 + 5) & 0x3D);
        if ((v14 & 4) != 0) {
          goto LABEL_18;
        }
LABEL_26:
        v11[v20] &= ~v21;
        unint64_t v22 = (v13 + 4) >> 6;
        uint64_t v23 = 1 << ((v13 + 4) & 0x3C);
        if ((v14 & 8) == 0) {
          goto LABEL_27;
        }
LABEL_19:
        v11[v22] |= v23;
        unint64_t v24 = (v13 + 3) >> 6;
        uint64_t v25 = 1 << ((v13 + 3) & 0x3B);
        if ((v14 & 0x10) != 0) {
          goto LABEL_20;
        }
LABEL_28:
        v11[v24] &= ~v25;
        unint64_t v26 = (v13 + 2) >> 6;
        uint64_t v27 = 1 << ((v13 + 2) & 0x3A);
        if ((v14 & 0x20) == 0) {
          goto LABEL_29;
        }
LABEL_21:
        v11[v26] |= v27;
        unint64_t v28 = (v13 + 1) >> 6;
        uint64_t v29 = 1 << ((v13 + 1) & 0x39);
        if ((v14 & 0x40) != 0) {
          goto LABEL_22;
        }
LABEL_30:
        v11[v28] &= ~v29;
        unint64_t v30 = v13 >> 6;
        uint64_t v31 = 1 << (v13 & 0x38);
        if ((v14 & 0x80) == 0) {
          goto LABEL_14;
        }
LABEL_31:
        v11[v30] |= v31;
        v13 += 8;
        if (!--v6) {
          break;
        }
      }
      else
      {
        v11[v16] &= ~v17;
        unint64_t v18 = (v13 + 6) >> 6;
        uint64_t v19 = 1 << ((v13 + 6) & 0x3E);
        if ((v14 & 2) != 0) {
          goto LABEL_17;
        }
LABEL_25:
        v11[v18] &= ~v19;
        unint64_t v20 = (v13 + 5) >> 6;
        uint64_t v21 = 1 << ((v13 + 5) & 0x3D);
        if ((v14 & 4) == 0) {
          goto LABEL_26;
        }
LABEL_18:
        v11[v20] |= v21;
        unint64_t v22 = (v13 + 4) >> 6;
        uint64_t v23 = 1 << ((v13 + 4) & 0x3C);
        if ((v14 & 8) != 0) {
          goto LABEL_19;
        }
LABEL_27:
        v11[v22] &= ~v23;
        unint64_t v24 = (v13 + 3) >> 6;
        uint64_t v25 = 1 << ((v13 + 3) & 0x3B);
        if ((v14 & 0x10) == 0) {
          goto LABEL_28;
        }
LABEL_20:
        v11[v24] |= v25;
        unint64_t v26 = (v13 + 2) >> 6;
        uint64_t v27 = 1 << ((v13 + 2) & 0x3A);
        if ((v14 & 0x20) != 0) {
          goto LABEL_21;
        }
LABEL_29:
        v11[v26] &= ~v27;
        unint64_t v28 = (v13 + 1) >> 6;
        uint64_t v29 = 1 << ((v13 + 1) & 0x39);
        if ((v14 & 0x40) == 0) {
          goto LABEL_30;
        }
LABEL_22:
        v11[v28] |= v29;
        unint64_t v30 = v13 >> 6;
        uint64_t v31 = 1 << (v13 & 0x38);
        if (v14 < 0) {
          goto LABEL_31;
        }
LABEL_14:
        v11[v30] &= ~v31;
        v13 += 8;
        if (!--v6) {
          break;
        }
      }
    }
  }
LABEL_32:
  if (*a2 == 8)
  {
    unint64_t v32 = operator new(8uLL);
    uint64_t v33 = v32;
    int v34 = 0;
    int v35 = 0;
    void *v32 = 0;
    uint64_t v36 = v32;
    int v37 = v11;
    do
    {
      uint64_t v38 = 1 << v34;
      if ((*v37 >> v35)) {
        uint64_t v39 = *v36 | v38;
      }
      else {
        uint64_t v39 = *v36 & ~v38;
      }
      *uint64_t v36 = v39;
      v37 += v35 == 63;
      if (v35 == 63) {
        int v35 = 0;
      }
      else {
        ++v35;
      }
      v36 += v34 == 63;
      if (v34 == 63) {
        int v34 = 0;
      }
      else {
        ++v34;
      }
    }
    while (v35 != 16 || v37 != v11);
    uint64_t v43 = v32;
    int v44 = 0;
    uint64_t v41 = v11;
    int v42 = 6;
    sub_246CD518C((uint64_t)v40, (unsigned int *)&v43, (uint64_t)v32, 0xAu, (uint64_t)&v41);
    uint64_t v43 = v33;
    int v44 = 10;
    uint64_t v41 = v11;
    int v42 = 0;
    sub_246CD518C((uint64_t)v40, (unsigned int *)&v43, (uint64_t)v33, 0x10u, (uint64_t)&v41);
    operator delete(v33);
  }
}

void sub_246CD4DF0(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CD4E08(uint64_t a1@<X0>, unsigned char *a2@<X1>, uint64_t a3@<X8>)
{
  if (*a2 != 110)
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
LABEL_13:
    *(unsigned char *)(a3 + 120) = 1;
    return;
  }
  if (*(void *)(a1 + 8) > 7uLL)
  {
    unint64_t v6 = *(void **)a1;
    memset(v16, 0, 24);
    sub_246CD53D0(v16, v6, 0, v6, 8, 8uLL);
    *(void *)a3 = *(void *)v16;
    *(_OWORD *)(a3 + 8) = *(_OWORD *)&v16[8];
    goto LABEL_13;
  }
  sub_246CC7564((uint64_t)v7, "Unable to extract expected number of header bits from given message");
  char v15 = 1;
  sub_246CC7690(0x16u, (long long *)v7, (uint64_t)v16);
  *(_OWORD *)a3 = *(_OWORD *)v16;
  *(unsigned char *)(a3 + 16) = 0;
  *(unsigned char *)(a3 + 112) = 0;
  if (v25)
  {
    *(unsigned char *)(a3 + 40) = 0;
    int v4 = v18;
    if (v18)
    {
      *(_OWORD *)(a3 + 16) = *(_OWORD *)&v16[16];
      *(void *)(a3 + 32) = v17;
      *(void *)&v16[24] = 0;
      uint64_t v17 = 0;
      *(void *)&v16[16] = 0;
      *(unsigned char *)(a3 + 40) = 1;
    }
    *(unsigned char *)(a3 + 48) = 0;
    *(unsigned char *)(a3 + 104) = 0;
    if (v24)
    {
      uint64_t v5 = v21;
      *(void *)(a3 + 64) = v20;
      *(_OWORD *)(a3 + 48) = v19;
      long long v19 = 0uLL;
      *(void *)(a3 + 72) = v5;
      *(_OWORD *)(a3 + 80) = v22;
      *(void *)(a3 + 96) = v23;
      uint64_t v20 = 0;
      long long v22 = 0uLL;
      uint64_t v23 = 0;
      *(unsigned char *)(a3 + 104) = 1;
    }
    *(unsigned char *)(a3 + 112) = 1;
    *(unsigned char *)(a3 + 120) = 0;
    if (v4 && SHIBYTE(v17) < 0) {
      operator delete(*(void **)&v16[16]);
    }
  }
  else
  {
    *(unsigned char *)(a3 + 120) = 0;
  }
  if (v15)
  {
    if (v14)
    {
      if (v13 < 0) {
        operator delete(v12);
      }
      if (v11 < 0) {
        operator delete(v10);
      }
    }
    if (v9)
    {
      if (v8 < 0) {
        operator delete(v7[0]);
      }
    }
  }
}

void sub_246CD4FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_246CD4FFC(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v3 = **(void **)(a1 + 16);
    uint64_t v4 = **(void **)(a1 + 8);
    if (v3 != v4)
    {
      uint64_t v5 = **(void **)(a1 + 16);
      do
      {
        unint64_t v7 = *(void **)(v5 - 24);
        v5 -= 24;
        unint64_t v6 = v7;
        if (v7)
        {
          *(void *)(v3 - 16) = v6;
          operator delete(v6);
        }
        uint64_t v3 = v5;
      }
      while (v5 != v4);
    }
  }
  return a1;
}

void sub_246CD5070()
{
}

void *sub_246CD5084(uint64_t a1)
{
  double result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26FB3DEB8;
  result[1] = v3;
  return result;
}

uint64_t sub_246CD50CC(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26FB3DEB8;
  a2[1] = v2;
  return result;
}

BOOL sub_246CD50F8(uint64_t a1, void *a2)
{
  return *(unsigned char *)(*(void *)(a1 + 8) + *a2) == 0;
}

uint64_t sub_246CD5110(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN4cv3d7appcode5codec17FindClusteredArcsERKNSt3__16vectorImNS2_9allocatorImEEEERKNS3_IS6_NS4_IS6_EE"
                     "EERKNS1_6FormatEE3$_0")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZN4cv3d7appcode5codec17FindClusteredArcsERKNSt3__16vectorImNS2_9allocatorImEEEERKNS3_IS6"
                                "_NS4_IS6_EEEERKNS1_6FormatEE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN4cv3d7appcode5codec17FindClusteredArcsERKNSt3__16vectorImNS2_9allocatorImEEEERKNS3_IS6_NS4_IS6_EEEERKNS1_6FormatEE3$_0"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN4cv3d7appcode5codec17FindClusteredArcsERKNSt3__16vectorImNS2_9allocatorImEEEERKNS3_IS6_NS4_IS6_EEEERKNS1_6FormatEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *sub_246CD5180()
{
  return &unk_26FB3DF28;
}

uint64_t sub_246CD518C(uint64_t result, unsigned int *a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  uint64_t v5 = *(unint64_t **)a2;
  uint64_t v6 = a2[2];
  uint64_t v7 = a4 - v6 + 8 * (a3 - *(void *)a2);
  if (v7 <= 0)
  {
    uint64_t v21 = *(uint64_t **)a5;
    unsigned int v19 = *(_DWORD *)(a5 + 8);
    goto LABEL_15;
  }
  if (v6)
  {
    if (v7 >= (unint64_t)(64 - v6)) {
      unint64_t v8 = (64 - v6);
    }
    else {
      unint64_t v8 = a4 - v6 + 8 * (a3 - *(void *)a2);
    }
    v7 -= v8;
    unint64_t v9 = (0xFFFFFFFFFFFFFFFFLL >> (64 - v6 - v8)) & (-1 << v6) & *v5;
    uint64_t v10 = *(unsigned int *)(a5 + 8);
    if (v8 >= (64 - v10)) {
      unint64_t v11 = (64 - v10);
    }
    else {
      unint64_t v11 = v8;
    }
    unint64_t v12 = *(uint64_t **)a5;
    unint64_t v13 = v9 >> (v6 - v10);
    BOOL v14 = v10 >= v6;
    int v16 = v10 - v6;
    BOOL v15 = v16 != 0 && v14;
    unint64_t v17 = v9 << v16;
    if (!v15) {
      unint64_t v17 = v13;
    }
    uint64_t *v12 = **(void **)a5 & ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v10 - v11)) & (-1 << v10)) | v17;
    unsigned __int8 v18 = (unint64_t *)((char *)v12 + (((v11 + v10) >> 3) & 0x3FFFFFF8));
    *(void *)a5 = v18;
    unsigned int v19 = ((_BYTE)v10 + (_BYTE)v11) & 0x3F;
    *(_DWORD *)(a5 + 8) = v19;
    uint64_t v20 = v8 - v11;
    if (v20 >= 1)
    {
      *unsigned __int8 v18 = (v9 >> (v11 + a2[2])) | *v18 & ~(0xFFFFFFFFFFFFFFFFLL >> -(char)v20);
      *(_DWORD *)(a5 + 8) = v20;
      unsigned int v19 = v20;
    }
    uint64_t v5 = (unint64_t *)(*(void *)a2 + 8);
    *(void *)a2 = v5;
  }
  else
  {
    unsigned int v19 = *(_DWORD *)(a5 + 8);
  }
  uint64_t v22 = -1 << v19;
  if (v7 < 64)
  {
    uint64_t v26 = v7;
    uint64_t v21 = *(uint64_t **)a5;
    if (v26 >= 1) {
      goto LABEL_22;
    }
LABEL_15:
    *(void *)double result = v21;
    *(_DWORD *)(result + 8) = v19;
    return result;
  }
  do
  {
    unint64_t v23 = *v5;
    char v24 = *(uint64_t **)a5;
    uint64_t *v24 = **(void **)a5 & ~v22 | (v23 << v19);
    uint64_t v25 = v24[1];
    *(void *)a5 = ++v24;
    uint64_t *v24 = v25 & v22 | (v23 >> (64 - v19));
    uint64_t v26 = v7 - 64;
    uint64_t v5 = (unint64_t *)(*(void *)a2 + 8);
    *(void *)a2 = v5;
    BOOL v15 = (unint64_t)v7 > 0x7F;
    v7 -= 64;
  }
  while (v15);
  uint64_t v21 = *(uint64_t **)a5;
  if (v26 < 1) {
    goto LABEL_15;
  }
LABEL_22:
  unint64_t v27 = *v5 & (0xFFFFFFFFFFFFFFFFLL >> -(char)v26);
  if (v26 >= (unint64_t)(64 - v19)) {
    uint64_t v28 = 64 - v19;
  }
  else {
    uint64_t v28 = v26;
  }
  *uint64_t v21 = *v21 & ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v19 - v28)) & v22) | (v27 << v19);
  uint64_t v21 = (uint64_t *)((char *)v21 + (((v28 + (unint64_t)v19) >> 3) & 0x3FFFFFF8));
  *(void *)a5 = v21;
  unsigned int v19 = ((_BYTE)v19 + (_BYTE)v28) & 0x3F;
  *(_DWORD *)(a5 + 8) = v19;
  int v29 = v26 - v28;
  if (v26 - v28 < 1) {
    goto LABEL_15;
  }
  *uint64_t v21 = *v21 & ~(0xFFFFFFFFFFFFFFFFLL >> (v28 - v26)) | (v27 >> v28);
  *(_DWORD *)(a5 + 8) = v29;
  *(void *)double result = v21;
  *(_DWORD *)(result + 8) = v29;
  return result;
}

void *sub_246CD53D0(void *result, void *a2, int a3, void *a4, int a5, unint64_t a6)
{
  if (a6)
  {
    uint64_t v7 = result;
    if ((a6 & 0x8000000000000000) != 0) {
      sub_246CC23A4();
    }
    unint64_t v12 = (a6 - 1) >> 6;
    double result = operator new(8 * (v12 + 1));
    v7[1] = a6;
    v7[2] = v12 + 1;
    void *v7 = result;
    if (a6 >= 0x41) {
      unint64_t v13 = (a6 - 1) >> 6;
    }
    else {
      unint64_t v13 = 0;
    }
    result[v13] = 0;
    if (a2 != a4 || a3 != a5)
    {
      int v14 = 0;
      do
      {
        uint64_t v15 = 1 << v14;
        if ((*a2 >> a3)) {
          uint64_t v16 = *result | v15;
        }
        else {
          uint64_t v16 = *result & ~v15;
        }
        void *result = v16;
        a2 += a3 == 63;
        if (a3 == 63) {
          a3 = 0;
        }
        else {
          ++a3;
        }
        result += v14 == 63;
        if (v14 == 63) {
          int v14 = 0;
        }
        else {
          ++v14;
        }
      }
      while (a2 != a4 || a3 != a5);
    }
  }
  return result;
}

void sub_246CD54CC(_Unwind_Exception *exception_object)
{
  if (*v1) {
    operator delete(*v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_246CD54E4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = *a1;
  uint64_t v4 = (uint64_t *)a1[4];
  if (v4)
  {
    if (v4 == a1 + 1)
    {
      unsigned __int8 v18 = v17;
      (*(void (**)(uint64_t *, void *))(*v4 + 24))(v4, v17);
    }
    else
    {
      unsigned __int8 v18 = (void *)(*(uint64_t (**)(uint64_t *))(*v4 + 16))(v4);
    }
  }
  else
  {
    unsigned __int8 v18 = 0;
  }
  uint64_t v19 = a1[5];
  uint64_t v12 = *a2;
  uint64_t v5 = a2[4];
  if (!v5) {
    goto LABEL_9;
  }
  if ((uint64_t *)v5 != a2 + 1)
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 16))(v5);
LABEL_9:
    int v14 = (void *)v5;
    goto LABEL_11;
  }
  int v14 = v13;
  (*(void (**)(uint64_t, void *))(*(void *)v5 + 24))(v5, v13);
LABEL_11:
  uint64_t v15 = a2[5];
  uint64_t v6 = v16;
  uint64_t v7 = v12;
  if (v16 == v12)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    do
    {
      v6 += 8;
      uint64_t v16 = v6;
      if (v6 != v19)
      {
        do
        {
          if (!v18) {
            sub_246CC4F54();
          }
          char v9 = (*(uint64_t (**)(void *))(*v18 + 48))(v18);
          uint64_t v6 = v16;
          if (v9) {
            break;
          }
          uint64_t v6 = v16 + 8;
          uint64_t v16 = v6;
        }
        while (v6 != v19);
        uint64_t v7 = v12;
      }
      ++v8;
    }
    while (v6 != v7);
  }
  if (v14 != v13)
  {
    if (v14) {
      (*(void (**)(void))(*v14 + 40))();
    }
    uint64_t v10 = v18;
    if (v18 != v17) {
      goto LABEL_25;
    }
LABEL_28:
    (*(void (**)(void *))(v17[0] + 32))(v17);
    return v8;
  }
  (*(void (**)(void *))(v13[0] + 32))(v13);
  uint64_t v10 = v18;
  if (v18 == v17) {
    goto LABEL_28;
  }
LABEL_25:
  if (v10) {
    (*(void (**)(void *))(*v10 + 40))(v10);
  }
  return v8;
}

void sub_246CD57B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  sub_246CD3984((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_246CD57CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  sub_246CD3984((uint64_t)va);
  sub_246CD3984((uint64_t)va1);
  _Unwind_Resume(a1);
}

uint64_t sub_246CD57EC(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void **)(a1 + 8);
  uint64_t v28 = *a2;
  uint64_t v7 = a2[4];
  if (!v7) {
    goto LABEL_4;
  }
  if ((uint64_t *)v7 != a2 + 1)
  {
    uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 16))(v7);
LABEL_4:
    unint64_t v30 = (void *)v7;
    goto LABEL_6;
  }
  unint64_t v30 = v29;
  (*(void (**)(uint64_t, void *))(*(void *)v7 + 24))(v7, v29);
LABEL_6:
  uint64_t v31 = a2[5];
  uint64_t v24 = *a3;
  uint64_t v8 = a3[4];
  if (!v8)
  {
LABEL_9:
    uint64_t v26 = (void *)v8;
    goto LABEL_11;
  }
  if ((uint64_t *)v8 != a3 + 1)
  {
    uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 16))(v8);
    goto LABEL_9;
  }
  uint64_t v26 = v25;
  (*(void (**)(uint64_t, void *))(*(void *)v8 + 24))(v8, v25);
LABEL_11:
  uint64_t v27 = a3[5];
  uint64_t v9 = (uint64_t)v30;
  uint64_t v44 = v28;
  if (!v30)
  {
LABEL_14:
    int v46 = (void *)v9;
    goto LABEL_16;
  }
  if (v30 != v29)
  {
    uint64_t v9 = (*(uint64_t (**)(void *))(*v30 + 16))(v30);
    goto LABEL_14;
  }
  int v46 = v45;
  (*(void (**)(void *, void *))(v29[0] + 24))(v29, v45);
LABEL_16:
  uint64_t v47 = v31;
  uint64_t v10 = (uint64_t)v26;
  uint64_t v40 = v24;
  if (!v26)
  {
LABEL_19:
    int v42 = (void *)v10;
    goto LABEL_21;
  }
  if (v26 != v25)
  {
    uint64_t v10 = (*(uint64_t (**)(void))(*v26 + 16))();
    goto LABEL_19;
  }
  int v42 = v41;
  (*(void (**)(void *, void *))(v25[0] + 24))(v25, v41);
LABEL_21:
  uint64_t v43 = v27;
  sub_246CD72E4(&v48, &v44, &v40);
  if (v42 == v41)
  {
    (*(void (**)(void *))(v41[0] + 32))(v41);
    unint64_t v11 = v46;
    if (v46 != v45) {
      goto LABEL_25;
    }
  }
  else
  {
    if (v42) {
      (*(void (**)(void))(*v42 + 40))();
    }
    unint64_t v11 = v46;
    if (v46 != v45)
    {
LABEL_25:
      if (v11) {
        (*(void (**)(void *))(*v11 + 40))(v11);
      }
      uint64_t v12 = v50;
      uint64_t v36 = v48;
      if (!v50) {
        goto LABEL_33;
      }
      goto LABEL_31;
    }
  }
  (*(void (**)(void *))(v45[0] + 32))(v45);
  uint64_t v12 = v50;
  uint64_t v36 = v48;
  if (!v50)
  {
LABEL_33:
    uint64_t v38 = v12;
    goto LABEL_35;
  }
LABEL_31:
  if (v12 != v49)
  {
    uint64_t v12 = (void *)(*(uint64_t (**)(void *))(*v12 + 16))(v12);
    goto LABEL_33;
  }
  uint64_t v38 = v37;
  (*(void (**)(void *, void *))(*v12 + 24))(v12, v37);
LABEL_35:
  uint64_t v39 = v51;
  unint64_t v32 = v52;
  uint64_t v13 = (uint64_t)v54;
  if (!v54)
  {
LABEL_38:
    int v34 = (void *)v13;
    goto LABEL_40;
  }
  if (v54 != v53)
  {
    uint64_t v13 = (*(uint64_t (**)(void *))(*v54 + 16))(v54);
    goto LABEL_38;
  }
  int v34 = v33;
  (*(void (**)(void *, void *))(*v54 + 24))(v54, v33);
LABEL_40:
  uint64_t v35 = v55;
  int v14 = v36;
  uint64_t v15 = v32;
  if (v36 == v32)
  {
    uint64_t v16 = v6;
  }
  else
  {
    uint64_t v16 = v6;
    do
    {
      uint64_t v17 = *v14++;
      void *v16 = v17;
      uint64_t v36 = v14;
      if (v14 != v39)
      {
        do
        {
          if (!v38) {
            sub_246CC4F54();
          }
          char v18 = (*(uint64_t (**)(void *))(*v38 + 48))(v38);
          int v14 = v36;
          if (v18) {
            break;
          }
          int v14 = v36 + 1;
          uint64_t v36 = v14;
        }
        while (v14 != v39);
        uint64_t v15 = v32;
      }
      ++v16;
    }
    while (v14 != v15);
  }
  if (v34 == v33)
  {
    (*(void (**)(void *))(v33[0] + 32))(v33);
    uint64_t v19 = v38;
    if (v38 != v37) {
      goto LABEL_54;
    }
LABEL_69:
    (*(void (**)(void *))(v37[0] + 32))(v37);
    uint64_t v20 = v54;
    if (v54 != v53) {
      goto LABEL_57;
    }
LABEL_70:
    (*(void (**)(void *))(v53[0] + 32))(v53);
    uint64_t v21 = v50;
    if (v50 != v49) {
      goto LABEL_60;
    }
LABEL_71:
    (*(void (**)(void *))(v49[0] + 32))(v49);
    uint64_t v22 = v26;
    if (v26 != v25) {
      goto LABEL_63;
    }
    goto LABEL_72;
  }
  if (v34) {
    (*(void (**)(void))(*v34 + 40))();
  }
  uint64_t v19 = v38;
  if (v38 == v37) {
    goto LABEL_69;
  }
LABEL_54:
  if (v19) {
    (*(void (**)(void *))(*v19 + 40))(v19);
  }
  uint64_t v20 = v54;
  if (v54 == v53) {
    goto LABEL_70;
  }
LABEL_57:
  if (v20) {
    (*(void (**)(void *))(*v20 + 40))(v20);
  }
  uint64_t v21 = v50;
  if (v50 == v49) {
    goto LABEL_71;
  }
LABEL_60:
  if (v21) {
    (*(void (**)(void *))(*v21 + 40))(v21);
  }
  uint64_t v22 = v26;
  if (v26 != v25)
  {
LABEL_63:
    if (v22) {
      (*(void (**)(void *))(*v22 + 40))(v22);
    }
    uint64_t result = (uint64_t)v30;
    if (v30 != v29) {
      goto LABEL_66;
    }
LABEL_73:
    uint64_t result = (*(uint64_t (**)(void *))(v29[0] + 32))(v29);
    goto LABEL_74;
  }
LABEL_72:
  (*(void (**)(void *))(v25[0] + 32))(v25);
  uint64_t result = (uint64_t)v30;
  if (v30 == v29) {
    goto LABEL_73;
  }
LABEL_66:
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 40))(result);
  }
LABEL_74:
  *(void *)(a1 + 8) = v16;
  return result;
}

void sub_246CD5F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  sub_246CD3984((uint64_t)&a28);
  sub_246CD3840(v30 - 168);
  sub_246CD3984((uint64_t)&a10);
  sub_246CD3984((uint64_t)&a16);
  *(void *)(v28 + 8) = v29;
  _Unwind_Resume(a1);
}

uint64_t sub_246CD6028(void *a1, uint64_t *a2, uint64_t *a3, void *a4)
{
  v131[2] = *MEMORY[0x263EF8340];
  uint64_t v56 = *a2;
  uint64_t v8 = (uint64_t *)a2[4];
  if (v8)
  {
    if (v8 == a2 + 1)
    {
      unint64_t v58 = v57;
      (*(void (**)(uint64_t *, void *))(*v8 + 24))(v8, v57);
    }
    else
    {
      unint64_t v58 = (void *)a2[4];
      a2[4] = 0;
    }
  }
  else
  {
    unint64_t v58 = 0;
  }
  uint64_t v59 = a2[5];
  uint64_t v52 = *a3;
  uint64_t v9 = (uint64_t *)a3[4];
  if (v9)
  {
    if (v9 == a3 + 1)
    {
      unsigned int v54 = v53;
      (*(void (**)(uint64_t *, void *))(*v9 + 24))(v9, v53);
    }
    else
    {
      unsigned int v54 = (void *)a3[4];
      a3[4] = 0;
    }
  }
  else
  {
    unsigned int v54 = 0;
  }
  uint64_t v55 = a3[5];
  uint64_t v64 = v56;
  uint64_t v10 = &v64;
  if (!v58) {
    goto LABEL_14;
  }
  if (v58 != v57)
  {
    uint64_t v10 = &v56;
    uint64_t v66 = v58;
LABEL_14:
    v10[4] = 0;
    goto LABEL_16;
  }
  uint64_t v66 = v65;
  (*(void (**)(void *, void *))(v57[0] + 24))(v57, v65);
LABEL_16:
  uint64_t v67 = v59;
  uint64_t v60 = v52;
  unint64_t v11 = &v60;
  if (!v54)
  {
LABEL_19:
    v11[4] = 0;
    goto LABEL_21;
  }
  if (v54 != v53)
  {
    unint64_t v11 = &v52;
    unint64_t v62 = v54;
    goto LABEL_19;
  }
  unint64_t v62 = v61;
  (*(void (**)(void *, void *))(v53[0] + 24))(v53, v61);
LABEL_21:
  uint64_t v63 = v55;
  uint64_t v12 = (uint64_t)v66;
  uint64_t v97 = v64;
  if (!v66)
  {
LABEL_24:
    unint64_t v99 = (void *)v12;
    goto LABEL_26;
  }
  if (v66 != v65)
  {
    uint64_t v12 = (*(uint64_t (**)(void))(*v66 + 16))();
    goto LABEL_24;
  }
  unint64_t v99 = v98;
  (*(void (**)(void *, void *))(v65[0] + 24))(v65, v98);
LABEL_26:
  uint64_t v100 = v67;
  uint64_t v93 = v60;
  uint64_t v13 = &v93;
  if (!v62)
  {
LABEL_29:
    v13[4] = 0;
    goto LABEL_31;
  }
  if (v62 != v61)
  {
    uint64_t v13 = &v60;
    unint64_t v95 = v62;
    goto LABEL_29;
  }
  unint64_t v95 = v94;
  (*(void (**)(void *, void *))(v61[0] + 24))(v61, v94);
LABEL_31:
  uint64_t v96 = v63;
  sub_246CD72E4(&v101, &v97, &v93);
  if (v95 == v94)
  {
    (*(void (**)(void *))(v94[0] + 32))(v94);
    int v14 = v99;
    if (v99 != v98) {
      goto LABEL_35;
    }
  }
  else
  {
    if (v95) {
      (*(void (**)(void))(*v95 + 40))();
    }
    int v14 = v99;
    if (v99 != v98)
    {
LABEL_35:
      if (v14) {
        (*(void (**)(void *))(*v14 + 40))(v14);
      }
      uint64_t v15 = v103;
      unint64_t v84 = v101;
      if (v103) {
        goto LABEL_38;
      }
LABEL_42:
      int8x16_t v86 = 0;
      goto LABEL_44;
    }
  }
  (*(void (**)(void *))(v98[0] + 32))(v98);
  uint64_t v15 = v103;
  unint64_t v84 = v101;
  if (!v103) {
    goto LABEL_42;
  }
LABEL_38:
  if (v15 == v102)
  {
    int8x16_t v86 = v85;
    (*(void (**)(void *, void *))(*v15 + 24))(v15, v85);
  }
  else
  {
    int8x16_t v86 = v15;
    unint64_t v103 = 0;
  }
LABEL_44:
  uint64_t v16 = v105;
  uint64_t v87 = v104;
  uint64_t v80 = v105;
  if (v107)
  {
    if (v107 == v106)
    {
      char v82 = v81;
      (*(void (**)(void))(*v107 + 24))();
      uint64_t v16 = v80;
    }
    else
    {
      char v82 = v107;
      unint64_t v107 = 0;
    }
  }
  else
  {
    char v82 = 0;
  }
  uint64_t v83 = v108;
  uint64_t v17 = v84;
  while (v17 != v16)
  {
    uint64_t v18 = *v17++;
    *a4 = v18;
    unint64_t v84 = v17;
    if (v17 != v87)
    {
      do
      {
        if (!v86) {
          sub_246CC4F54();
        }
        char v19 = (*(uint64_t (**)(void *))(*v86 + 48))(v86);
        uint64_t v17 = v84;
        if (v19) {
          break;
        }
        uint64_t v17 = v84 + 1;
        unint64_t v84 = v17;
      }
      while (v17 != v87);
      uint64_t v16 = v80;
    }
    ++a4;
  }
  uint64_t v88 = v16;
  uint64_t v20 = &v88;
  if (!v86) {
    goto LABEL_61;
  }
  if (v86 != v85)
  {
    uint64_t v20 = &v84;
    int8x8_t v90 = v86;
LABEL_61:
    v20[4] = 0;
    goto LABEL_63;
  }
  int8x8_t v90 = v89;
  (*(void (**)(void *, void *))(v85[0] + 24))(v85, v89);
LABEL_63:
  unint64_t v91 = v87;
  char v92 = a4;
  if (v82 == v81)
  {
    (*(void (**)(void *))(v81[0] + 32))(v81);
    uint64_t v21 = v86;
    if (v86 != v85) {
      goto LABEL_67;
    }
  }
  else
  {
    if (v82) {
      (*(void (**)(void))(*v82 + 40))();
    }
    uint64_t v21 = v86;
    if (v86 != v85)
    {
LABEL_67:
      if (v21) {
        (*(void (**)(void *))(*v21 + 40))(v21);
      }
      uint64_t v22 = v66;
      uint64_t v72 = v64;
      if (v66) {
        goto LABEL_70;
      }
LABEL_74:
      unint64_t v74 = 0;
      goto LABEL_76;
    }
  }
  (*(void (**)(void *))(v85[0] + 32))(v85);
  uint64_t v22 = v66;
  uint64_t v72 = v64;
  if (!v66) {
    goto LABEL_74;
  }
LABEL_70:
  if (v22 == v65)
  {
    unint64_t v74 = v73;
    (*(void (**)(void *, void *))(v65[0] + 24))(v65, v73);
  }
  else
  {
    unint64_t v74 = v22;
    uint64_t v66 = 0;
  }
LABEL_76:
  uint64_t v75 = v67;
  uint64_t v68 = v88;
  unint64_t v23 = &v68;
  if (!v90)
  {
LABEL_79:
    v23[4] = 0;
    goto LABEL_81;
  }
  if (v90 != v89)
  {
    unint64_t v23 = &v88;
    unint64_t v70 = v90;
    goto LABEL_79;
  }
  unint64_t v70 = v69;
  (*(void (**)(void *, void *))(v89[0] + 24))(v89, v69);
LABEL_81:
  __int8 v71 = v91;
  uint64_t v113 = v72;
  uint64_t v24 = &v113;
  if (!v74)
  {
LABEL_84:
    v24[4] = 0;
    goto LABEL_86;
  }
  if (v74 != v73)
  {
    uint64_t v24 = &v72;
    int64_t v115 = v74;
    goto LABEL_84;
  }
  int64_t v115 = v114;
  (*(void (**)(void *, void *))(v73[0] + 24))(v73, v114);
LABEL_86:
  uint64_t v116 = v75;
  unint64_t v109 = v68;
  uint64_t v25 = (uint64_t *)&v109;
  if (!v70)
  {
LABEL_89:
    v25[4] = 0;
    goto LABEL_91;
  }
  if (v70 != v69)
  {
    uint64_t v25 = (uint64_t *)&v68;
    unint64_t v111 = v70;
    goto LABEL_89;
  }
  unint64_t v111 = v110;
  (*(void (**)(void *, void *))(v69[0] + 24))(v69, v110);
LABEL_91:
  uint64_t v112 = v71;
  uint64_t v121 = v113;
  uint64_t v26 = &v121;
  if (!v115)
  {
LABEL_94:
    v26[4] = 0;
    goto LABEL_96;
  }
  if (v115 != v114)
  {
    uint64_t v26 = &v113;
    unint64_t v123 = v115;
    goto LABEL_94;
  }
  unint64_t v123 = v122;
  (*(void (**)(void *, void *))(v114[0] + 24))(v114, v122);
LABEL_96:
  uint64_t v124 = v116;
  uint64_t v117 = v109;
  if (!v111)
  {
    uint64_t v27 = &v119;
    goto LABEL_100;
  }
  if (v111 != v110)
  {
    uint64_t v27 = &v111;
    uint64_t v119 = v111;
LABEL_100:
    void *v27 = 0;
    goto LABEL_102;
  }
  uint64_t v119 = v118;
  (*(void (**)(void *, void *))(v110[0] + 24))(v110, v118);
LABEL_102:
  int64_t v120 = v112;
  uint64_t v129 = v121;
  if (!v123)
  {
    uint64_t v28 = v131;
    goto LABEL_106;
  }
  if (v123 != v122)
  {
    uint64_t v28 = &v123;
    v131[0] = v123;
LABEL_106:
    *uint64_t v28 = 0;
    goto LABEL_108;
  }
  v131[0] = v130;
  (*(void (**)(void *, void *))(v122[0] + 24))(v122, v130);
LABEL_108:
  v131[1] = v124;
  uint64_t v29 = v117;
  uint64_t v125 = v117;
  uint64_t v30 = (uint64_t *)&v125;
  if (!v119)
  {
LABEL_111:
    v30[4] = 0;
    goto LABEL_113;
  }
  if (v119 != v118)
  {
    uint64_t v30 = (uint64_t *)&v117;
    unint64_t v127 = v119;
    goto LABEL_111;
  }
  unint64_t v127 = v126;
  (*(void (**)(void *, void *))(v118[0] + 24))(v118, v126);
  uint64_t v29 = v125;
LABEL_113:
  uint64_t v31 = v120;
  uint64_t v128 = v120;
  uint64_t v76 = v29;
  unint64_t v32 = (uint64_t *)&v76;
  if (!v127) {
    goto LABEL_116;
  }
  if (v127 != v126)
  {
    unint64_t v32 = (uint64_t *)&v125;
    unint64_t v78 = v127;
LABEL_116:
    v32[4] = 0;
    int8x16_t v79 = v31;
    uint64_t v33 = v127;
    if (v127 != v126) {
      goto LABEL_117;
    }
LABEL_138:
    (*(void (**)(void *))(v126[0] + 32))(v126);
    uint64_t v34 = v131[0];
    if ((void *)v131[0] != v130) {
      goto LABEL_120;
    }
LABEL_139:
    (*(void (**)(void *))(v130[0] + 32))(v130);
    uint64_t v35 = v119;
    if (v119 != v118) {
      goto LABEL_123;
    }
LABEL_140:
    (*(void (**)(void *))(v118[0] + 32))(v118);
    uint64_t v36 = v123;
    if (v123 != v122) {
      goto LABEL_126;
    }
LABEL_141:
    (*(void (**)(void *))(v122[0] + 32))(v122);
    int v37 = v111;
    if (v111 != v110) {
      goto LABEL_129;
    }
LABEL_142:
    (*(void (**)(void *))(v110[0] + 32))(v110);
    uint64_t v38 = v115;
    if (v115 != v114) {
      goto LABEL_132;
    }
    goto LABEL_143;
  }
  unint64_t v78 = v77;
  (*(void (**)(void *, void *))(v126[0] + 24))(v126, v77);
  uint64_t v33 = v127;
  int8x16_t v79 = v128;
  if (v127 == v126) {
    goto LABEL_138;
  }
LABEL_117:
  if (v33) {
    (*(void (**)(void *))(*v33 + 40))(v33);
  }
  uint64_t v34 = v131[0];
  if ((void *)v131[0] == v130) {
    goto LABEL_139;
  }
LABEL_120:
  if (v34) {
    (*(void (**)(uint64_t))(*(void *)v34 + 40))(v34);
  }
  uint64_t v35 = v119;
  if (v119 == v118) {
    goto LABEL_140;
  }
LABEL_123:
  if (v35) {
    (*(void (**)(void *))(*v35 + 40))(v35);
  }
  uint64_t v36 = v123;
  if (v123 == v122) {
    goto LABEL_141;
  }
LABEL_126:
  if (v36) {
    (*(void (**)(void *))(*v36 + 40))(v36);
  }
  int v37 = v111;
  if (v111 == v110) {
    goto LABEL_142;
  }
LABEL_129:
  if (v37) {
    (*(void (**)(void *))(*v37 + 40))(v37);
  }
  uint64_t v38 = v115;
  if (v115 != v114)
  {
LABEL_132:
    if (v38) {
      (*(void (**)(void *))(*v38 + 40))(v38);
    }
    uint64_t v39 = v92;
    uint64_t v40 = v78;
    *a1 = v76;
    uint64_t v41 = a1 + 1;
    if (v40) {
      goto LABEL_135;
    }
LABEL_144:
    a1[4] = 0;
    goto LABEL_146;
  }
LABEL_143:
  (*(void (**)(void *))(v114[0] + 32))(v114);
  uint64_t v39 = v92;
  uint64_t v40 = v78;
  *a1 = v76;
  uint64_t v41 = a1 + 1;
  if (!v40) {
    goto LABEL_144;
  }
LABEL_135:
  if (v40 == v77)
  {
    a1[4] = v41;
    (*(void (**)(void *))(v77[0] + 24))(v77);
  }
  else
  {
    a1[4] = v40;
    unint64_t v78 = 0;
  }
LABEL_146:
  int v42 = v78;
  a1[5] = v79;
  a1[6] = v39;
  if (v42 == v77)
  {
    (*(void (**)(void *, void *))(v77[0] + 32))(v77, v41);
    uint64_t v43 = v70;
    if (v70 != v69) {
      goto LABEL_150;
    }
LABEL_177:
    (*(void (**)(void *, void *))(v69[0] + 32))(v69, v41);
    uint64_t v44 = v74;
    if (v74 != v73) {
      goto LABEL_153;
    }
LABEL_178:
    (*(void (**)(void *, void *))(v73[0] + 32))(v73, v41);
    int v45 = v90;
    if (v90 != v89) {
      goto LABEL_156;
    }
LABEL_179:
    (*(void (**)(void *, void *))(v89[0] + 32))(v89, v41);
    int v46 = v107;
    if (v107 != v106) {
      goto LABEL_159;
    }
LABEL_180:
    (*(void (**)(void *, void *))(v106[0] + 32))(v106, v41);
    uint64_t v47 = v103;
    if (v103 != v102) {
      goto LABEL_162;
    }
LABEL_181:
    (*(void (**)(void *, void *))(v102[0] + 32))(v102, v41);
    int v48 = v62;
    if (v62 != v61) {
      goto LABEL_165;
    }
LABEL_182:
    (*(void (**)(void *, void *))(v61[0] + 32))(v61, v41);
    int v49 = v66;
    if (v66 != v65) {
      goto LABEL_168;
    }
LABEL_183:
    (*(void (**)(void *, void *))(v65[0] + 32))(v65, v41);
    int v50 = v54;
    if (v54 != v53) {
      goto LABEL_171;
    }
    goto LABEL_184;
  }
  if (v42) {
    (*(void (**)(void *, void *))(*v42 + 40))(v42, v41);
  }
  uint64_t v43 = v70;
  if (v70 == v69) {
    goto LABEL_177;
  }
LABEL_150:
  if (v43) {
    (*(void (**)(void *, void *))(*v43 + 40))(v43, v41);
  }
  uint64_t v44 = v74;
  if (v74 == v73) {
    goto LABEL_178;
  }
LABEL_153:
  if (v44) {
    (*(void (**)(void *, void *))(*v44 + 40))(v44, v41);
  }
  int v45 = v90;
  if (v90 == v89) {
    goto LABEL_179;
  }
LABEL_156:
  if (v45) {
    (*(void (**)(void *, void *))(*v45 + 40))(v45, v41);
  }
  int v46 = v107;
  if (v107 == v106) {
    goto LABEL_180;
  }
LABEL_159:
  if (v46) {
    (*(void (**)(void *, void *))(*v46 + 40))(v46, v41);
  }
  uint64_t v47 = v103;
  if (v103 == v102) {
    goto LABEL_181;
  }
LABEL_162:
  if (v47) {
    (*(void (**)(void *, void *))(*v47 + 40))(v47, v41);
  }
  int v48 = v62;
  if (v62 == v61) {
    goto LABEL_182;
  }
LABEL_165:
  if (v48) {
    (*(void (**)(void *, void *))(*v48 + 40))(v48, v41);
  }
  int v49 = v66;
  if (v66 == v65) {
    goto LABEL_183;
  }
LABEL_168:
  if (v49) {
    (*(void (**)(void *, void *))(*v49 + 40))(v49, v41);
  }
  int v50 = v54;
  if (v54 != v53)
  {
LABEL_171:
    if (v50) {
      (*(void (**)(void *, void *))(*v50 + 40))(v50, v41);
    }
    uint64_t result = (uint64_t)v58;
    if (v58 != v57) {
      goto LABEL_174;
    }
    return (*(uint64_t (**)(void *, void *))(v57[0] + 32))(v57, v41);
  }
LABEL_184:
  (*(void (**)(void *, void *))(v53[0] + 32))(v53, v41);
  uint64_t result = (uint64_t)v58;
  if (v58 == v57) {
    return (*(uint64_t (**)(void *, void *))(v57[0] + 32))(v57, v41);
  }
LABEL_174:
  if (result) {
    return (*(uint64_t (**)(uint64_t, void *))(*(void *)result + 40))(result, v41);
  }
  return result;
}

void sub_246CD7228(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_246CC20E4(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_246CD72E4(void *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v24 = *a2;
  uint64_t v6 = (uint64_t *)a2[4];
  if (v6)
  {
    if (v6 == a2 + 1)
    {
      uint64_t v26 = v25;
      (*(void (**)(uint64_t *, void *))(*v6 + 24))(v6, v25);
    }
    else
    {
      uint64_t v26 = (void *)a2[4];
      a2[4] = 0;
    }
  }
  else
  {
    uint64_t v26 = 0;
  }
  uint64_t v27 = a2[5];
  uint64_t v20 = *a3;
  uint64_t v7 = (uint64_t *)a3[4];
  if (v7)
  {
    if (v7 == a3 + 1)
    {
      uint64_t v22 = v21;
      (*(void (**)(uint64_t *, void *))(*v7 + 24))(v7, v21);
    }
    else
    {
      uint64_t v22 = (void *)a3[4];
      a3[4] = 0;
    }
  }
  else
  {
    uint64_t v22 = 0;
  }
  uint64_t v23 = a3[5];
  uint64_t v36 = v24;
  uint64_t v8 = &v36;
  if (!v26) {
    goto LABEL_14;
  }
  if (v26 != v25)
  {
    uint64_t v8 = &v24;
    uint64_t v38 = v26;
LABEL_14:
    v8[4] = 0;
    goto LABEL_16;
  }
  uint64_t v38 = v37;
  (*(void (**)(void *, void *))(v25[0] + 24))(v25, v37);
LABEL_16:
  uint64_t v39 = v27;
  sub_246CD78A0(&v40, &v36);
  uint64_t v28 = v20;
  uint64_t v9 = &v28;
  if (!v22)
  {
LABEL_19:
    v9[4] = 0;
    goto LABEL_21;
  }
  if (v22 != v21)
  {
    uint64_t v9 = &v20;
    uint64_t v30 = v22;
    goto LABEL_19;
  }
  uint64_t v30 = v29;
  (*(void (**)(void *, void *))(v21[0] + 24))(v21, v29);
LABEL_21:
  uint64_t v31 = v23;
  sub_246CD78A0(&v32, &v28);
  uint64_t v10 = v42;
  *a1 = v40;
  unint64_t v11 = a1 + 1;
  if (v10)
  {
    if (v10 == v41)
    {
      a1[4] = v11;
      (*(void (**)(void *))(*v10 + 24))(v10);
    }
    else
    {
      a1[4] = v10;
      int v42 = 0;
    }
  }
  else
  {
    a1[4] = 0;
  }
  uint64_t v12 = v32;
  uint64_t v13 = v34;
  a1[5] = v43;
  a1[6] = v12;
  if (v13)
  {
    if (v13 == v33)
    {
      a1[10] = a1 + 7;
      (*(void (**)(void *))(*v13 + 24))(v13);
    }
    else
    {
      a1[10] = v13;
      uint64_t v34 = 0;
    }
  }
  else
  {
    a1[10] = 0;
  }
  int v14 = v34;
  a1[11] = v35;
  if (v14 == v33)
  {
    (*(void (**)(void *, void *))(v33[0] + 32))(v33, v11);
    uint64_t v15 = v30;
    if (v30 != v29) {
      goto LABEL_35;
    }
LABEL_50:
    (*(void (**)(void *, void *))(v29[0] + 32))(v29, v11);
    uint64_t v16 = v42;
    if (v42 != v41) {
      goto LABEL_38;
    }
LABEL_51:
    (*(void (**)(void *, void *))(v41[0] + 32))(v41, v11);
    uint64_t v17 = v38;
    if (v38 != v37) {
      goto LABEL_41;
    }
LABEL_52:
    (*(void (**)(void *, void *))(v37[0] + 32))(v37, v11);
    uint64_t v18 = v22;
    if (v22 != v21) {
      goto LABEL_44;
    }
    goto LABEL_53;
  }
  if (v14) {
    (*(void (**)(void *, void *))(*v14 + 40))(v14, v11);
  }
  uint64_t v15 = v30;
  if (v30 == v29) {
    goto LABEL_50;
  }
LABEL_35:
  if (v15) {
    (*(void (**)(void *, void *))(*v15 + 40))(v15, v11);
  }
  uint64_t v16 = v42;
  if (v42 == v41) {
    goto LABEL_51;
  }
LABEL_38:
  if (v16) {
    (*(void (**)(void *, void *))(*v16 + 40))(v16, v11);
  }
  uint64_t v17 = v38;
  if (v38 == v37) {
    goto LABEL_52;
  }
LABEL_41:
  if (v17) {
    (*(void (**)(void *, void *))(*v17 + 40))(v17, v11);
  }
  uint64_t v18 = v22;
  if (v22 != v21)
  {
LABEL_44:
    if (v18) {
      (*(void (**)(void *, void *))(*v18 + 40))(v18, v11);
    }
    uint64_t result = (uint64_t)v26;
    if (v26 != v25) {
      goto LABEL_47;
    }
    return (*(uint64_t (**)(void *, void *))(v25[0] + 32))(v25, v11);
  }
LABEL_53:
  (*(void (**)(void *, void *))(v21[0] + 32))(v21, v11);
  uint64_t result = (uint64_t)v26;
  if (v26 == v25) {
    return (*(uint64_t (**)(void *, void *))(v25[0] + 32))(v25, v11);
  }
LABEL_47:
  if (result) {
    return (*(uint64_t (**)(uint64_t, void *))(*(void *)result + 40))(result, v11);
  }
  return result;
}

void sub_246CD7870(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_246CC20E4(a1);
  }
  _Unwind_Resume(a1);
}

void *sub_246CD78A0(void *a1, void *a2)
{
  uint64_t v2 = a2;
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = *a2;
  uint64_t v10 = *a2;
  uint64_t v5 = (void *)a2[4];
  if (!v5)
  {
    uint64_t v9 = a2[5];
    uint64_t v12 = 0;
    uint64_t v13 = v9;
    *a1 = v4;
    a1[4] = 0;
    a1[5] = v9;
    uint64_t result = v12;
    if (v12 == v11) {
      return (void *)(*(uint64_t (**)(void *, void *))(v11[0] + 32))(v11, a2);
    }
    goto LABEL_11;
  }
  if (v5 != a2 + 1)
  {
    uint64_t v6 = (void *)(*(uint64_t (**)(void *))(*v5 + 16))(v5);
    uint64_t v7 = v2[5];
    uint64_t v12 = v6;
    uint64_t v13 = v7;
    *a1 = v10;
    a2 = a1 + 1;
    if (v6) {
      goto LABEL_4;
    }
LABEL_10:
    a1[4] = 0;
    a1[5] = v7;
    uint64_t result = v12;
    if (v12 != v11) {
      goto LABEL_11;
    }
    return (void *)(*(uint64_t (**)(void *, void *))(v11[0] + 32))(v11, a2);
  }
  uint64_t v12 = v11;
  (*(void (**)(void *, void *))(*v5 + 24))(v5, v11);
  uint64_t v6 = v12;
  uint64_t v7 = v2[5];
  uint64_t v13 = v7;
  *a1 = v10;
  a2 = a1 + 1;
  if (!v6) {
    goto LABEL_10;
  }
LABEL_4:
  if (v6 == v11)
  {
    a1[4] = a2;
    (*(void (**)(void *))(v11[0] + 24))(v11);
    uint64_t result = v12;
    a1[5] = v13;
    if (result != v11) {
      goto LABEL_11;
    }
    return (void *)(*(uint64_t (**)(void *, void *))(v11[0] + 32))(v11, a2);
  }
  a1[4] = v6;
  a1[5] = v7;
  uint64_t v12 = 0;
  uint64_t result = 0;
  if (!v11) {
    return (void *)(*(uint64_t (**)(void *, void *))(v11[0] + 32))(v11, a2);
  }
LABEL_11:
  if (result) {
    return (void *)(*(uint64_t (**)(void *, void *))(*result + 40))(result, a2);
  }
  return result;
}

void sub_246CD7A9C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_246CC20E4(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_246CD7AAC(void *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v7 = (unsigned char *)*a1;
  uint64_t v6 = (unsigned char *)a1[1];
  if ((unsigned char *)*a1 != v6)
  {
    uint64_t v8 = (unsigned char *)*a1;
    while (!*v8)
    {
      if (++v8 == v6)
      {
        uint64_t v8 = (unsigned char *)a1[1];
        break;
      }
    }
    uint64_t v104 = &a3[(void)a2];
    if (!a3) {
      goto LABEL_22;
    }
LABEL_9:
    uint64_t v9 = 0;
    while (v9[(void)a2] != 8)
    {
      if (a3 == ++v9)
      {
        if ((unsigned __int8 *)(v104 - a2) == a3) {
          goto LABEL_22;
        }
        goto LABEL_15;
      }
    }
    if (v9 == a3) {
      goto LABEL_22;
    }
LABEL_15:
    uint64_t v10 = 0;
    while (v10[(void)a2] != 110)
    {
      if (a3 == ++v10)
      {
        if ((unsigned __int8 *)(v104 - a2) == a3) {
          goto LABEL_22;
        }
        goto LABEL_19;
      }
    }
    if (v10 == a3) {
      goto LABEL_22;
    }
LABEL_19:
    unint64_t v11 = v8;
    uint64_t v125 = 0;
    v126 = 0;
    unint64_t v127 = 0;
    size_t v12 = v6 - v8;
    if (v6 != v8) {
      goto LABEL_24;
    }
    goto LABEL_26;
  }
  uint64_t v8 = (unsigned char *)*a1;
  uint64_t v104 = &a3[(void)a2];
  if (a3) {
    goto LABEL_9;
  }
LABEL_22:
  if (sub_246CFADD0("/Library/Caches/com.apple.xbs/Sources/ACCBaker/library/AppCode/Codec/src/Version.cpp", 43, (uint64_t)"Contains(excluded, Version::kVersion2) && Contains(excluded, Version::kVersion4)", 80, (uint64_t)"", 0, (void (*)(void **))sub_246CFB2A4))
  {
    abort();
  }
  uint64_t v13 = (unsigned char *)a1[1];
  unint64_t v11 = (unsigned char *)(*a1 + v8 - v7);
  uint64_t v125 = 0;
  v126 = 0;
  unint64_t v127 = 0;
  size_t v12 = v13 - v11;
  if (v13 != v11)
  {
LABEL_24:
    if ((v12 & 0x8000000000000000) != 0) {
      sub_246CC23A4();
    }
    uint64_t v14 = (char *)operator new(v12);
    uint64_t v15 = &v14[v12];
    uint64_t v125 = v14;
    unint64_t v127 = &v14[v12];
    memmove(v14, v11, v12);
    v126 = v15;
  }
LABEL_26:
  uint64_t v108 = 0;
  unint64_t v107 = a1;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  char v19 = 0;
  uint64_t v20 = &byte_246D10280;
  do
  {
    int v21 = *v20;
    uint64_t v22 = a2;
    uint64_t v23 = a3;
    if (a3)
    {
      uint64_t v22 = a2;
      while (*v22 != v21)
      {
        ++v22;
        if (!--v23)
        {
          uint64_t v22 = v104;
          break;
        }
      }
      uint64_t v23 = a3;
    }
    if ((unsigned __int8 *)(v22 - a2) == v23)
    {
      if (*v20 <= 0xFu)
      {
        if (!*v20)
        {
          uint64_t v25 = *v20;
          goto LABEL_47;
        }
        uint64_t v24 = byte_246CFFABD;
        if (v21 == 8)
        {
          uint64_t v25 = 2u;
          goto LABEL_47;
        }
      }
      else
      {
        if (v21 == 16)
        {
          uint64_t v25 = 3u;
          goto LABEL_47;
        }
        if (v21 == 110)
        {
          uint64_t v25 = 4u;
          goto LABEL_47;
        }
        uint64_t v24 = byte_246CFFABD;
        if (v21 == 64)
        {
          uint64_t v25 = 1u;
LABEL_47:
          uint64_t v24 = (char *)&unk_246CFFAB8 + v25;
        }
      }
      if (v24 - (char *)&unk_246CFFAB8 == 5) {
        __int16 v26 = 0;
      }
      else {
        __int16 v26 = v21 | 0x100;
      }
      __int16 v124 = v26;
      sub_246CD49D0((char **)v107, &v124, &__p);
      sub_246CD4E08((uint64_t)&__p, &v124, (uint64_t)v114);
      if (__p) {
        operator delete(__p);
      }
      if (!v123) {
        goto LABEL_112;
      }
      if (!HIBYTE(v124)) {
        sub_246CC5EF0();
      }
      uint64_t v27 = sub_246CC5AF0((uint64_t)v114);
      long long __p = &v124;
      sub_246CCCB6C(&v112, v27);
      uint64_t v28 = (unsigned __int8 *)__p;
      int v29 = *(unsigned __int8 *)__p;
      char v30 = v29 - 8;
      switch(v29)
      {
        case 8:
          goto LABEL_58;
        case 64:
          uint64_t v31 = 0;
          uint64_t v35 = 0;
          uint64_t v36 = 88;
          unsigned int v37 = 5;
          unsigned int v38 = 8;
          goto LABEL_91;
        case 16:
LABEL_58:
          uint64_t v105 = 19;
          uint64_t v31 = 0;
          if (*(unsigned __int8 *)__p <= 0xFu) {
            goto LABEL_59;
          }
          break;
        default:
          uint64_t v105 = 9;
          uint64_t v31 = 0;
          if (*(unsigned __int8 *)__p <= 0xFu)
          {
LABEL_59:
            if (*(unsigned char *)__p)
            {
              uint64_t v32 = (uint64_t *)operator new(8uLL);
              uint64_t *v32 = 13;
              goto LABEL_61;
            }
            goto LABEL_77;
          }
          break;
      }
      if (v29 != 16)
      {
        if (v113 != 8 || *(unsigned char *)v112)
        {
          uint64_t v31 = 0;
          unsigned int v38 = 0;
          uint64_t v36 = 8 * v105;
          goto LABEL_87;
        }
        uint64_t v32 = (uint64_t *)operator new(8uLL);
        int v49 = 0;
        uint64_t v50 = 0;
        uint64_t *v32 = 0;
        unsigned int v51 = v32;
        do
        {
          uint64_t v53 = 1 << v49;
          if (byte_246CFFABD[v50]) {
            uint64_t v52 = *v51 | v53;
          }
          else {
            uint64_t v52 = *v51 & ~v53;
          }
          *unsigned int v51 = v52;
          ++v50;
          v51 += v49 == 63;
          if (v49 == 63) {
            int v49 = 0;
          }
          else {
            ++v49;
          }
        }
        while (v50 != 45);
LABEL_61:
        int v33 = *v28;
        uint64_t v34 = v32;
        uint64_t v31 = 1;
        if (v33 <= 15)
        {
          if (!v33) {
            goto LABEL_76;
          }
          uint64_t v39 = (uint64_t *)operator new(8uLL);
          *uint64_t v39 = 13;
          uint64_t v31 = -5;
        }
        else
        {
          if (v33 == 16 || v33 == 64) {
            goto LABEL_76;
          }
          if (v113 != 8 || *(unsigned char *)v112)
          {
            uint64_t v31 = 1;
LABEL_76:
            operator delete(v34);
            int v29 = *(unsigned __int8 *)__p;
            goto LABEL_77;
          }
          uint64_t v39 = (uint64_t *)operator new(8uLL);
          int v54 = 0;
          uint64_t v55 = 0;
          *uint64_t v39 = 0;
          uint64_t v56 = v39;
          do
          {
            uint64_t v58 = 1 << v54;
            if (byte_246CFFABD[v55]) {
              uint64_t v57 = *v56 | v58;
            }
            else {
              uint64_t v57 = *v56 & ~v58;
            }
            uint64_t *v56 = v57;
            ++v55;
            v56 += v54 == 63;
            if (v54 == 63) {
              int v54 = 0;
            }
            else {
              ++v54;
            }
          }
          while (v55 != 45);
          uint64_t v31 = -44;
        }
        operator delete(v39);
        goto LABEL_76;
      }
LABEL_77:
      unsigned int v40 = 8;
      if ((v30 & 0xF7) == 0) {
        unsigned int v40 = 5;
      }
      uint64_t v36 = v105 * (unint64_t)v40;
      if (v29 == 8) {
        goto LABEL_82;
      }
      if (v29 != 110)
      {
        unsigned int v38 = 8;
        if (v29 != 16)
        {
LABEL_83:
          if (v29 == 8)
          {
            uint64_t v35 = -6;
          }
          else
          {
            if (v29 != 16)
            {
              uint64_t v35 = 0;
              unsigned int v37 = 5;
              goto LABEL_91;
            }
            uint64_t v35 = 0;
          }
          unsigned int v37 = 9;
LABEL_91:
          unint64_t v41 = (v31 + v36 + v35 + v38 * (unint64_t)v37 + 7) >> 3;
          if (v19 < v108)
          {
            *char v19 = v21;
            *((void *)v19 + 1) = v41;
            uint64_t v17 = v19 + 16;
            int v42 = v112;
            if (!v112)
            {
LABEL_94:
              if (v123)
              {
                if (v114[0]) {
                  operator delete(v114[0]);
                }
                char v19 = v17;
                goto LABEL_28;
              }
              char v19 = v17;
LABEL_112:
              if (!v122) {
                goto LABEL_28;
              }
              if (v121)
              {
                if ((v120 & 0x80000000) == 0)
                {
                  if ((v118 & 0x80000000) == 0) {
                    goto LABEL_116;
                  }
LABEL_122:
                  operator delete(v117);
                  if (!v116) {
                    goto LABEL_28;
                  }
                  goto LABEL_117;
                }
                operator delete(v119);
                if (v118 < 0) {
                  goto LABEL_122;
                }
              }
LABEL_116:
              if (!v116) {
                goto LABEL_28;
              }
LABEL_117:
              if (v115 < 0) {
                operator delete(v114[2]);
              }
              goto LABEL_28;
            }
LABEL_93:
            operator delete(v42);
            goto LABEL_94;
          }
          uint64_t v43 = (v19 - v18) >> 4;
          unint64_t v44 = v43 + 1;
          if ((unint64_t)(v43 + 1) >> 60) {
            sub_246CC23A4();
          }
          if ((v108 - v18) >> 3 > v44) {
            unint64_t v44 = (v108 - v18) >> 3;
          }
          if ((unint64_t)(v108 - v18) >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v45 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v45 = v44;
          }
          if (v45 >> 60) {
            sub_246CC29A0();
          }
          int v46 = (char *)operator new(16 * v45);
          uint64_t v47 = &v46[16 * v43];
          *uint64_t v47 = v21;
          *((void *)v47 + 1) = v41;
          if (v19 == v18)
          {
            uint64_t v16 = &v46[16 * v43];
            uint64_t v108 = &v46[16 * v45];
            uint64_t v17 = v47 + 16;
            if (v18) {
LABEL_108:
            }
              operator delete(v18);
          }
          else
          {
            int v48 = &v46[16 * v43];
            do
            {
              uint64_t v16 = v48 - 16;
              *((_OWORD *)v48 - 1) = *((_OWORD *)v19 - 1);
              v19 -= 16;
              v48 -= 16;
            }
            while (v19 != v18);
            uint64_t v108 = &v46[16 * v45];
            uint64_t v17 = v47 + 16;
            if (v18) {
              goto LABEL_108;
            }
          }
          uint64_t v18 = v16;
          int v42 = v112;
          if (!v112) {
            goto LABEL_94;
          }
          goto LABEL_93;
        }
LABEL_82:
        unsigned int v38 = 6;
        goto LABEL_83;
      }
      unsigned int v38 = 0;
LABEL_87:
      uint64_t v35 = 0;
      unsigned int v37 = 0;
      goto LABEL_91;
    }
LABEL_28:
    ++v20;
  }
  while (v20 != (char *)&unk_246D10285);
  unint64_t v59 = 126 - 2 * __clz((v19 - v16) >> 4);
  if (v19 == v16) {
    uint64_t v60 = 0;
  }
  else {
    uint64_t v60 = v59;
  }
  sub_246CD8578(v16, v19, v60, 1);
  unint64_t v62 = v125;
  uint64_t v61 = v126;
  unint64_t v63 = v126 - v125;
  uint64_t v64 = v16;
  if (v17 != v16)
  {
    unint64_t v65 = (v17 - v16) >> 4;
    uint64_t v64 = v16;
    do
    {
      unint64_t v66 = v65 >> 1;
      uint64_t v67 = (unsigned __int8 *)&v64[16 * (v65 >> 1)];
      unint64_t v68 = *((void *)v67 + 1);
      std::string v69 = (char *)(v67 + 16);
      v65 += ~(v65 >> 1);
      if (v68 < v63) {
        uint64_t v64 = v69;
      }
      else {
        unint64_t v65 = v66;
      }
    }
    while (v65);
  }
  if (v64 == v17)
  {
    int v90 = 0;
    int v91 = 0;
    if (v16) {
      goto LABEL_192;
    }
    goto LABEL_193;
  }
  unint64_t v70 = *((void *)v64 + 1);
  uint64_t v72 = (char *)*v107;
  __int8 v71 = (char *)v107[1];
  uint64_t v73 = &v71[-*v107];
  size_t v74 = v70 - (void)v73;
  if (v70 > (unint64_t)v73)
  {
    uint64_t v75 = v107[2];
    if (v75 - (uint64_t)v71 >= v74)
    {
      char v82 = &v71[v74];
      bzero((void *)v107[1], v74);
      v107[1] = &v71[v74];
      goto LABEL_175;
    }
    if ((v70 & 0x8000000000000000) != 0) {
      sub_246CC23A4();
    }
    uint64_t v76 = &v71[-*v107];
    unint64_t v77 = v75 - (void)v72;
    uint64_t v78 = 2 * v77;
    if (2 * v77 <= v70) {
      uint64_t v78 = *((void *)v64 + 1);
    }
    if (v77 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v79 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v79 = v78;
    }
    size_t v110 = v79;
    uint64_t v80 = (char *)operator new(v79);
    unint64_t v106 = (unint64_t)v76;
    unint64_t v81 = &v76[(void)v80];
    unint64_t v109 = v80;
    bzero(v81, v74);
    char v82 = &v109[v70];
    uint64_t v83 = &v109[v110];
    if (v71 == v72)
    {
      unint64_t v84 = v107;
      void *v107 = v81;
      v107[1] = v82;
      v107[2] = v83;
      if (!v71) {
        goto LABEL_175;
      }
    }
    else
    {
      unint64_t v84 = v107;
      if (v106 < 0x20) {
        goto LABEL_204;
      }
      if ((unint64_t)(v72 - v109) < 0x20) {
        goto LABEL_204;
      }
      v81 -= v106 & 0xFFFFFFFFFFFFFFE0;
      int8x16_t v85 = v71 - 16;
      int8x16_t v86 = &v109[v71 - 16 - v72];
      unint64_t v87 = v106 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        long long v88 = *(_OWORD *)v85;
        *((_OWORD *)v86 - 1) = *((_OWORD *)v85 - 1);
        *(_OWORD *)int8x16_t v86 = v88;
        v86 -= 32;
        v85 -= 32;
        v87 -= 32;
      }
      while (v87);
      v71 -= v106 & 0xFFFFFFFFFFFFFFE0;
      if (v106 != (v106 & 0xFFFFFFFFFFFFFFE0))
      {
LABEL_204:
        do
        {
          char v89 = *--v71;
          *--unint64_t v81 = v89;
        }
        while (v71 != v72);
      }
      __int8 v71 = (char *)*v107;
      void *v107 = v81;
      v107[1] = v82;
      v107[2] = v83;
      if (!v71)
      {
LABEL_175:
        __int8 v71 = v82;
        goto LABEL_176;
      }
    }
    operator delete(v71);
    char v82 = (char *)v84[1];
    goto LABEL_175;
  }
  if (v70 < (unint64_t)v73)
  {
    __int8 v71 = &v72[v70];
    v107[1] = &v72[v70];
  }
LABEL_176:
  if (v62 == v61) {
    goto LABEL_191;
  }
  char v92 = &v71[v62 - v61];
  if (v63 < 8 || (unint64_t)(v71 - v61) < 0x20)
  {
    do
    {
LABEL_190:
      char v102 = *v62++;
      *v92++ = v102;
    }
    while (v62 != v61);
    goto LABEL_191;
  }
  if (v63 >= 0x20)
  {
    unint64_t v93 = v63 & 0xFFFFFFFFFFFFFFE0;
    unint64_t v94 = (long long *)(v62 + 16);
    unint64_t v95 = (_OWORD *)(&v62[(void)v71] - v61 + 16);
    unint64_t v96 = v63 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v97 = *v94;
      *(v95 - 1) = *(v94 - 1);
      *unint64_t v95 = v97;
      v94 += 2;
      v95 += 2;
      v96 -= 32;
    }
    while (v96);
    if (v63 == v93) {
      goto LABEL_191;
    }
    if ((v63 & 0x18) != 0) {
      goto LABEL_185;
    }
    v62 += v93;
    v92 += v93;
    goto LABEL_190;
  }
  unint64_t v93 = 0;
LABEL_185:
  v92 += v63 & 0xFFFFFFFFFFFFFFF8;
  __int8 v98 = (uint64_t *)&v62[v93];
  unint64_t v99 = (char *)(&v71[v93 + (void)v62] - v61);
  unint64_t v100 = v93 - (v63 & 0xFFFFFFFFFFFFFFF8);
  do
  {
    uint64_t v101 = *v98++;
    *(void *)unint64_t v99 = v101;
    v99 += 8;
    v100 += 8;
  }
  while (v100);
  v62 += v63 & 0xFFFFFFFFFFFFFFF8;
  if (v63 != (v63 & 0xFFFFFFFFFFFFFFF8)) {
    goto LABEL_190;
  }
LABEL_191:
  int v90 = *v64;
  int v91 = 1;
  if (v16) {
LABEL_192:
  }
    operator delete(v16);
LABEL_193:
  if (v125) {
    operator delete(v125);
  }
  return v90 | (v91 << 8);
}

void sub_246CD84D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *__p, uint64_t a18, uint64_t a19, char a20)
{
  if (v20)
  {
    operator delete(v20);
    uint64_t v22 = *(void **)(v21 - 112);
    if (!v22) {
LABEL_4:
    }
      _Unwind_Resume(exception_object);
  }
  else
  {
    uint64_t v22 = *(void **)(v21 - 112);
    if (!v22) {
      goto LABEL_4;
    }
  }
  operator delete(v22);
  goto LABEL_4;
}

char *sub_246CD8578(char *result, char *a2, uint64_t a3, char a4)
{
  unint64_t v9 = (unint64_t)result;
  while (2)
  {
    unint64_t v10 = v9;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          unint64_t v9 = v10;
          uint64_t v11 = (uint64_t)&a2[-v10];
          uint64_t v12 = (uint64_t)&a2[-v10] >> 4;
          if (v5 || !v4)
          {
            switch(v12)
            {
              case 0:
              case 1:
                return result;
              case 2:
                unint64_t v90 = *((void *)a2 - 1);
                unint64_t v91 = *(void *)(v10 + 8);
                if (v90 < v91)
                {
                  char v92 = *(unsigned char *)v10;
                  *(unsigned char *)unint64_t v10 = *(a2 - 16);
                  *(a2 - 16) = v92;
                  *(void *)(v10 + 8) = v90;
                  *((void *)a2 - 1) = v91;
                }
                return result;
              case 3:
                unint64_t v93 = *(void *)(v10 + 24);
                unint64_t v94 = *(void *)(v10 + 8);
                unint64_t v95 = *((void *)a2 - 1);
                if (v93 >= v94)
                {
                  if (v95 < v93)
                  {
                    char v150 = *(unsigned char *)(v10 + 16);
                    *(unsigned char *)(v10 + 16) = *(a2 - 16);
                    *(a2 - 16) = v150;
                    *(void *)(v10 + 24) = v95;
                    *((void *)a2 - 1) = v93;
                    unint64_t v151 = *(void *)(v10 + 24);
                    unint64_t v152 = *(void *)(v10 + 8);
                    if (v151 < v152)
                    {
                      char v153 = *(unsigned char *)v10;
                      *(unsigned char *)unint64_t v10 = *(unsigned char *)(v10 + 16);
                      *(unsigned char *)(v10 + 16) = v153;
                      *(void *)(v10 + 8) = v151;
                      *(void *)(v10 + 24) = v152;
                    }
                  }
                }
                else
                {
                  char v96 = *(unsigned char *)v10;
                  if (v95 >= v93)
                  {
                    *(unsigned char *)unint64_t v10 = *(unsigned char *)(v10 + 16);
                    *(unsigned char *)(v10 + 16) = v96;
                    *(void *)(v10 + 8) = v93;
                    *(void *)(v10 + 24) = v94;
                    unint64_t v161 = *((void *)a2 - 1);
                    if (v161 >= v94) {
                      return result;
                    }
                    *(unsigned char *)(v10 + 16) = *(a2 - 16);
                    *(a2 - 16) = v96;
                    *(void *)(v10 + 24) = v161;
                  }
                  else
                  {
                    *(unsigned char *)unint64_t v10 = *(a2 - 16);
                    *(a2 - 16) = v96;
                    *(void *)(v10 + 8) = v95;
                  }
                  *((void *)a2 - 1) = v94;
                }
                break;
              case 4:
                return sub_246CD9544((char *)v10, (char *)(v10 + 16), (char *)(v10 + 32), a2 - 16);
              case 5:
                uint64_t result = sub_246CD9544((char *)v10, (char *)(v10 + 16), (char *)(v10 + 32), (char *)(v10 + 48));
                unint64_t v97 = *((void *)a2 - 1);
                unint64_t v98 = *(void *)(v10 + 56);
                if (v97 < v98)
                {
                  char v99 = *(unsigned char *)(v10 + 48);
                  *(unsigned char *)(v10 + 48) = *(a2 - 16);
                  *(a2 - 16) = v99;
                  *(void *)(v10 + 56) = v97;
                  *((void *)a2 - 1) = v98;
                  unint64_t v100 = *(void *)(v10 + 56);
                  unint64_t v101 = *(void *)(v10 + 40);
                  if (v100 < v101)
                  {
                    char v102 = *(unsigned char *)(v10 + 32);
                    char v103 = *(unsigned char *)(v10 + 48);
                    *(unsigned char *)(v10 + 32) = v103;
                    *(unsigned char *)(v10 + 48) = v102;
                    *(void *)(v10 + 40) = v100;
                    *(void *)(v10 + 56) = v101;
                    unint64_t v104 = *(void *)(v10 + 24);
                    if (v100 < v104)
                    {
                      char v105 = *(unsigned char *)(v10 + 16);
                      *(unsigned char *)(v10 + 16) = v103;
                      *(unsigned char *)(v10 + 32) = v105;
                      *(void *)(v10 + 24) = v100;
                      *(void *)(v10 + 40) = v104;
                      unint64_t v106 = *(void *)(v10 + 8);
                      if (v100 < v106)
                      {
                        char v107 = *(unsigned char *)v10;
                        *(unsigned char *)unint64_t v10 = v103;
                        *(unsigned char *)(v10 + 16) = v107;
                        *(void *)(v10 + 8) = v100;
                        *(void *)(v10 + 24) = v106;
                      }
                    }
                  }
                }
                return result;
              default:
                JUMPOUT(0);
            }
            return result;
          }
          if (v11 <= 383)
          {
            uint64_t v108 = (char *)(v10 + 16);
            BOOL v110 = (char *)v10 == a2 || v108 == a2;
            if (a4)
            {
              if (!v110)
              {
                uint64_t v111 = 0;
                uint64_t v112 = (char *)v10;
                do
                {
                  unint64_t v114 = *((void *)v112 + 3);
                  unint64_t v115 = *((void *)v112 + 1);
                  uint64_t v112 = v108;
                  if (v114 < v115)
                  {
                    char v116 = *v108;
                    uint64_t v117 = v111;
                    do
                    {
                      uint64_t v118 = v10 + v117;
                      *(unsigned char *)(v118 + 16) = *(unsigned char *)(v10 + v117);
                      *(void *)(v118 + 24) = *(void *)(v10 + v117 + 8);
                      if (!v117)
                      {
                        uint64_t v113 = v10;
                        goto LABEL_124;
                      }
                      v117 -= 16;
                    }
                    while (v114 < *(void *)(v118 - 8));
                    uint64_t v113 = v10 + v117 + 16;
LABEL_124:
                    *(unsigned char *)uint64_t v113 = v116;
                    *(void *)(v113 + 8) = v114;
                  }
                  uint64_t v108 = v112 + 16;
                  v111 += 16;
                }
                while (v112 + 16 != a2);
              }
            }
            else if (!v110)
            {
              uint64_t v154 = (unint64_t *)(v10 + 24);
              do
              {
                unint64_t v155 = *(void *)(v9 + 24);
                unint64_t v156 = *(void *)(v9 + 8);
                unint64_t v9 = (unint64_t)v108;
                if (v155 < v156)
                {
                  char v157 = *v108;
                  v158 = v154;
                  do
                  {
                    v159 = v158;
                    *((unsigned char *)v158 - 8) = *((unsigned char *)v158 - 24);
                    unint64_t v160 = *(v158 - 2);
                    v158 -= 2;
                    unint64_t *v159 = v160;
                  }
                  while (v155 < *(v159 - 4));
                  *((unsigned char *)v158 - 8) = v157;
                  unint64_t *v158 = v155;
                }
                uint64_t v108 = (char *)(v9 + 16);
                v154 += 2;
              }
              while ((char *)(v9 + 16) != a2);
            }
            return result;
          }
          if (!a3)
          {
            if ((char *)v10 != a2)
            {
              int64_t v119 = (unint64_t)(v12 - 2) >> 1;
              int64_t v120 = v119;
              do
              {
                if (v119 >= v120)
                {
                  uint64_t v122 = (2 * v120) | 1;
                  unint64_t v123 = v10 + 16 * v122;
                  if (2 * v120 + 2 < v12)
                  {
                    unint64_t v124 = *(void *)(v123 + 8);
                    unint64_t v125 = *(void *)(v123 + 24);
                    v123 += 16 * (v124 < v125);
                    if (v124 < v125) {
                      uint64_t v122 = 2 * v120 + 2;
                    }
                  }
                  unint64_t v126 = v10 + 16 * v120;
                  unint64_t v127 = *(void *)(v126 + 8);
                  if (*(void *)(v123 + 8) >= v127)
                  {
                    char v128 = *(unsigned char *)v126;
                    do
                    {
                      unint64_t v129 = v126;
                      unint64_t v126 = v123;
                      *(unsigned char *)unint64_t v129 = *(unsigned char *)v123;
                      *(void *)(v129 + 8) = *(void *)(v123 + 8);
                      if (v119 < v122) {
                        break;
                      }
                      uint64_t v130 = (2 * v122) | 1;
                      unint64_t v123 = v10 + 16 * v130;
                      uint64_t v131 = 2 * v122 + 2;
                      if (v131 < v12)
                      {
                        unint64_t v132 = *(void *)(v123 + 8);
                        unint64_t v133 = *(void *)(v123 + 24);
                        v123 += 16 * (v132 < v133);
                        if (v132 < v133) {
                          uint64_t v130 = v131;
                        }
                      }
                      uint64_t result = *(char **)(v123 + 8);
                      uint64_t v122 = v130;
                    }
                    while ((unint64_t)result >= v127);
                    *(unsigned char *)unint64_t v126 = v128;
                    *(void *)(v126 + 8) = v127;
                  }
                }
                BOOL v121 = v120-- <= 0;
              }
              while (!v121);
              uint64_t v134 = (unint64_t)v11 >> 4;
              do
              {
                uint64_t v135 = 0;
                char v136 = *(unsigned char *)v10;
                uint64_t v137 = *(void *)(v10 + 8);
                unint64_t v138 = v10;
                do
                {
                  uint64_t v139 = v138 + 16 * v135 + 16;
                  uint64_t v140 = (2 * v135) | 1;
                  uint64_t v141 = 2 * v135 + 2;
                  if (v141 < v134)
                  {
                    unint64_t v142 = *(void *)(v139 + 8);
                    unint64_t v143 = *(void *)(v139 + 24);
                    v139 += 16 * (v142 < v143);
                    if (v142 < v143) {
                      uint64_t v140 = v141;
                    }
                  }
                  *(unsigned char *)unint64_t v138 = *(unsigned char *)v139;
                  *(void *)(v138 + 8) = *(void *)(v139 + 8);
                  unint64_t v138 = v139;
                  uint64_t v135 = v140;
                }
                while (v140 <= (uint64_t)((unint64_t)(v134 - 2) >> 1));
                if ((char *)v139 == a2 - 16)
                {
                  *(unsigned char *)uint64_t v139 = v136;
                  *(void *)(v139 + 8) = v137;
                }
                else
                {
                  *(unsigned char *)uint64_t v139 = *(a2 - 16);
                  *(void *)(v139 + 8) = *((void *)a2 - 1);
                  *(a2 - 16) = v136;
                  *((void *)a2 - 1) = v137;
                  uint64_t v144 = v139 - v10 + 16;
                  if (v144 >= 17)
                  {
                    unint64_t v145 = (((unint64_t)v144 >> 4) - 2) >> 1;
                    uint64_t v146 = v10 + 16 * v145;
                    unint64_t v147 = *(void *)(v139 + 8);
                    if (*(void *)(v146 + 8) < v147)
                    {
                      char v148 = *(unsigned char *)v139;
                      do
                      {
                        uint64_t v149 = v139;
                        uint64_t v139 = v146;
                        *(unsigned char *)uint64_t v149 = *(unsigned char *)v146;
                        *(void *)(v149 + 8) = *(void *)(v146 + 8);
                        if (!v145) {
                          break;
                        }
                        unint64_t v145 = (v145 - 1) >> 1;
                        uint64_t v146 = v10 + 16 * v145;
                      }
                      while (*(void *)(v146 + 8) < v147);
                      *(unsigned char *)uint64_t v139 = v148;
                      *(void *)(v139 + 8) = v147;
                    }
                  }
                }
                a2 -= 16;
                BOOL v121 = v134-- <= 2;
              }
              while (!v121);
            }
            return result;
          }
          unint64_t v13 = (unint64_t)v12 >> 1;
          unint64_t v14 = v10 + 16 * ((unint64_t)v12 >> 1);
          unint64_t v15 = *((void *)a2 - 1);
          if ((unint64_t)v11 < 0x801) {
            break;
          }
          unint64_t v16 = *(void *)(v14 + 8);
          unint64_t v17 = *(void *)(v10 + 8);
          if (v16 >= v17)
          {
            if (v15 < v16)
            {
              char v22 = *(unsigned char *)v14;
              *(unsigned char *)unint64_t v14 = *(a2 - 16);
              *(a2 - 16) = v22;
              *(void *)(v14 + 8) = v15;
              *((void *)a2 - 1) = v16;
              unint64_t v23 = *(void *)(v14 + 8);
              unint64_t v24 = *(void *)(v10 + 8);
              if (v23 < v24)
              {
                char v25 = *(unsigned char *)v10;
                *(unsigned char *)unint64_t v10 = *(unsigned char *)v14;
                *(unsigned char *)unint64_t v14 = v25;
                *(void *)(v10 + 8) = v23;
                *(void *)(v14 + 8) = v24;
              }
            }
          }
          else
          {
            char v18 = *(unsigned char *)v10;
            if (v15 >= v16)
            {
              *(unsigned char *)unint64_t v10 = *(unsigned char *)v14;
              *(unsigned char *)unint64_t v14 = v18;
              *(void *)(v10 + 8) = v16;
              *(void *)(v14 + 8) = v17;
              unint64_t v30 = *((void *)a2 - 1);
              if (v30 >= v17) {
                goto LABEL_24;
              }
              *(unsigned char *)unint64_t v14 = *(a2 - 16);
              *(a2 - 16) = v18;
              *(void *)(v14 + 8) = v30;
            }
            else
            {
              *(unsigned char *)unint64_t v10 = *(a2 - 16);
              *(a2 - 16) = v18;
              *(void *)(v10 + 8) = v15;
            }
            *((void *)a2 - 1) = v17;
          }
LABEL_24:
          unint64_t v31 = v10 + 16 * v13;
          unint64_t v32 = v31 - 16;
          unint64_t v33 = *(void *)(v31 - 8);
          unint64_t v34 = *(void *)(v10 + 24);
          unint64_t v35 = *((void *)a2 - 3);
          if (v33 >= v34)
          {
            if (v35 < v33)
            {
              char v37 = *(unsigned char *)v32;
              *(unsigned char *)unint64_t v32 = *(a2 - 32);
              *(a2 - 32) = v37;
              *(void *)(v32 + 8) = v35;
              *((void *)a2 - 3) = v33;
              unint64_t v38 = *(void *)(v32 + 8);
              unint64_t v39 = *(void *)(v10 + 24);
              if (v38 < v39)
              {
                char v40 = *(unsigned char *)(v10 + 16);
                *(unsigned char *)(v10 + 16) = *(unsigned char *)v32;
                *(unsigned char *)unint64_t v32 = v40;
                *(void *)(v10 + 24) = v38;
                *(void *)(v32 + 8) = v39;
              }
            }
          }
          else
          {
            char v36 = *(unsigned char *)(v10 + 16);
            if (v35 >= v33)
            {
              *(unsigned char *)(v10 + 16) = *(unsigned char *)v32;
              *(unsigned char *)unint64_t v32 = v36;
              *(void *)(v10 + 24) = v33;
              *(void *)(v32 + 8) = v34;
              unint64_t v44 = *((void *)a2 - 3);
              if (v44 >= v34) {
                goto LABEL_38;
              }
              *(unsigned char *)unint64_t v32 = *(a2 - 32);
              *(a2 - 32) = v36;
              *(void *)(v32 + 8) = v44;
            }
            else
            {
              *(unsigned char *)(v10 + 16) = *(a2 - 32);
              *(a2 - 32) = v36;
              *(void *)(v10 + 24) = v35;
            }
            *((void *)a2 - 3) = v34;
          }
LABEL_38:
          unint64_t v45 = v10 + 16 * v13;
          unint64_t v46 = v45 + 16;
          unint64_t v47 = *(void *)(v45 + 24);
          unint64_t v48 = *(void *)(v10 + 40);
          unint64_t v49 = *((void *)a2 - 5);
          if (v47 >= v48)
          {
            if (v49 < v47)
            {
              char v51 = *(unsigned char *)v46;
              *(unsigned char *)unint64_t v46 = *(a2 - 48);
              *(a2 - 48) = v51;
              *(void *)(v46 + 8) = v49;
              *((void *)a2 - 5) = v47;
              unint64_t v52 = *(void *)(v46 + 8);
              unint64_t v53 = *(void *)(v10 + 40);
              if (v52 < v53)
              {
                char v54 = *(unsigned char *)(v10 + 32);
                *(unsigned char *)(v10 + 32) = *(unsigned char *)v46;
                *(unsigned char *)unint64_t v46 = v54;
                *(void *)(v10 + 40) = v52;
                *(void *)(v46 + 8) = v53;
              }
            }
          }
          else
          {
            char v50 = *(unsigned char *)(v10 + 32);
            if (v49 >= v47)
            {
              *(unsigned char *)(v10 + 32) = *(unsigned char *)v46;
              *(unsigned char *)unint64_t v46 = v50;
              *(void *)(v10 + 40) = v47;
              *(void *)(v46 + 8) = v48;
              unint64_t v55 = *((void *)a2 - 5);
              if (v55 >= v48) {
                goto LABEL_47;
              }
              *(unsigned char *)unint64_t v46 = *(a2 - 48);
              *(a2 - 48) = v50;
              *(void *)(v46 + 8) = v55;
            }
            else
            {
              *(unsigned char *)(v10 + 32) = *(a2 - 48);
              *(a2 - 48) = v50;
              *(void *)(v10 + 40) = v49;
            }
            *((void *)a2 - 5) = v48;
          }
LABEL_47:
          unint64_t v56 = *(void *)(v14 + 8);
          unint64_t v57 = *(void *)(v32 + 8);
          unint64_t v58 = *(void *)(v46 + 8);
          if (v56 >= v57)
          {
            char v59 = *(unsigned char *)v14;
            if (v58 < v56)
            {
              char v60 = *(unsigned char *)v46;
              *(unsigned char *)unint64_t v14 = *(unsigned char *)v46;
              *(unsigned char *)unint64_t v46 = v59;
              *(void *)(v14 + 8) = v58;
              *(void *)(v46 + 8) = v56;
              if (v58 >= v57)
              {
                unint64_t v57 = v58;
                char v59 = v60;
              }
              else
              {
                char v59 = *(unsigned char *)v32;
                *(unsigned char *)unint64_t v32 = v60;
                *(unsigned char *)unint64_t v14 = v59;
                *(void *)(v32 + 8) = v58;
                *(void *)(v14 + 8) = v57;
              }
            }
            else
            {
              unint64_t v57 = *(void *)(v14 + 8);
            }
          }
          else
          {
            char v59 = *(unsigned char *)v32;
            if (v58 >= v56)
            {
              *(unsigned char *)unint64_t v32 = *(unsigned char *)v14;
              *(unsigned char *)unint64_t v14 = v59;
              *(void *)(v32 + 8) = v56;
              *(void *)(v14 + 8) = v57;
              if (v58 < v57)
              {
                char v61 = *(unsigned char *)v46;
                *(unsigned char *)unint64_t v14 = *(unsigned char *)v46;
                *(unsigned char *)unint64_t v46 = v59;
                *(void *)(v14 + 8) = v58;
                *(void *)(v46 + 8) = v57;
                unint64_t v57 = v58;
                char v59 = v61;
              }
            }
            else
            {
              *(unsigned char *)unint64_t v32 = *(unsigned char *)v46;
              *(unsigned char *)unint64_t v46 = v59;
              *(void *)(v32 + 8) = v58;
              *(void *)(v46 + 8) = v57;
              char v59 = *(unsigned char *)v14;
              unint64_t v57 = v56;
            }
          }
          char v62 = *(unsigned char *)v10;
          *(unsigned char *)unint64_t v10 = v59;
          *(unsigned char *)unint64_t v14 = v62;
          unint64_t v63 = v10 + 16 * v13;
          uint64_t v64 = *(void *)(v10 + 8);
          *(void *)(v10 + 8) = v57;
          *(void *)(v63 + 8) = v64;
          --a3;
          if (a4) {
            goto LABEL_34;
          }
LABEL_58:
          unint64_t v43 = *(void *)(v10 + 8);
          char v42 = *(unsigned char *)v10;
          if (*(void *)(v10 - 8) < v43) {
            goto LABEL_59;
          }
          if (v43 < *((void *)a2 - 1))
          {
            unint64_t v79 = v10;
            do
            {
              unint64_t v10 = v79 + 16;
              unint64_t v80 = *(void *)(v79 + 24);
              v79 += 16;
            }
            while (v43 >= v80);
          }
          else
          {
            unint64_t v81 = v10 + 16;
            do
            {
              unint64_t v10 = v81;
              if (v81 >= (unint64_t)a2) {
                break;
              }
              unint64_t v82 = *(void *)(v81 + 8);
              v81 += 16;
            }
            while (v43 >= v82);
          }
          uint64_t v83 = a2;
          if (v10 < (unint64_t)a2)
          {
            unint64_t v84 = a2;
            do
            {
              uint64_t v83 = v84 - 16;
              unint64_t v85 = *((void *)v84 - 1);
              v84 -= 16;
            }
            while (v43 < v85);
          }
          while (v10 < (unint64_t)v83)
          {
            char v86 = *(unsigned char *)v10;
            *(unsigned char *)unint64_t v10 = *v83;
            *uint64_t v83 = v86;
            uint64_t v87 = *(void *)(v10 + 8);
            *(void *)(v10 + 8) = *((void *)v83 + 1);
            *((void *)v83 + 1) = v87;
            do
            {
              unint64_t v88 = *(void *)(v10 + 24);
              v10 += 16;
            }
            while (v43 >= v88);
            do
            {
              unint64_t v89 = *((void *)v83 - 1);
              v83 -= 16;
            }
            while (v43 < v89);
          }
          BOOL v4 = v10 - 16 >= v9;
          BOOL v5 = v10 - 16 == v9;
          if (v10 - 16 != v9)
          {
            *(unsigned char *)unint64_t v9 = *(unsigned char *)(v10 - 16);
            *(void *)(v9 + 8) = *(void *)(v10 - 8);
          }
          a4 = 0;
          *(unsigned char *)(v10 - 16) = v42;
          *(void *)(v10 - 8) = v43;
        }
        unint64_t v19 = *(void *)(v10 + 8);
        unint64_t v20 = *(void *)(v14 + 8);
        if (v19 < v20)
        {
          char v21 = *(unsigned char *)v14;
          if (v15 >= v19)
          {
            *(unsigned char *)unint64_t v14 = *(unsigned char *)v10;
            *(unsigned char *)unint64_t v10 = v21;
            *(void *)(v14 + 8) = v19;
            *(void *)(v10 + 8) = v20;
            unint64_t v41 = *((void *)a2 - 1);
            if (v41 >= v20) {
              goto LABEL_33;
            }
            *(unsigned char *)unint64_t v10 = *(a2 - 16);
            *(a2 - 16) = v21;
            *(void *)(v10 + 8) = v41;
          }
          else
          {
            *(unsigned char *)unint64_t v14 = *(a2 - 16);
            *(a2 - 16) = v21;
            *(void *)(v14 + 8) = v15;
          }
          *((void *)a2 - 1) = v20;
LABEL_33:
          --a3;
          if ((a4 & 1) == 0) {
            goto LABEL_58;
          }
          goto LABEL_34;
        }
        if (v15 >= v19) {
          goto LABEL_33;
        }
        char v26 = *(unsigned char *)v10;
        *(unsigned char *)unint64_t v10 = *(a2 - 16);
        *(a2 - 16) = v26;
        *(void *)(v10 + 8) = v15;
        *((void *)a2 - 1) = v19;
        unint64_t v27 = *(void *)(v10 + 8);
        unint64_t v28 = *(void *)(v14 + 8);
        if (v27 >= v28) {
          goto LABEL_33;
        }
        char v29 = *(unsigned char *)v14;
        *(unsigned char *)unint64_t v14 = *(unsigned char *)v10;
        *(unsigned char *)unint64_t v10 = v29;
        *(void *)(v14 + 8) = v27;
        *(void *)(v10 + 8) = v28;
        --a3;
        if ((a4 & 1) == 0) {
          goto LABEL_58;
        }
LABEL_34:
        char v42 = *(unsigned char *)v10;
        unint64_t v43 = *(void *)(v10 + 8);
LABEL_59:
        uint64_t v65 = 0;
        do
        {
          unint64_t v66 = *(void *)(v10 + v65 + 24);
          v65 += 16;
        }
        while (v66 < v43);
        unint64_t v67 = v10 + v65;
        unint64_t v68 = a2;
        if (v65 == 16)
        {
          __int8 v71 = a2;
          while (v67 < (unint64_t)v71)
          {
            std::string v69 = v71 - 16;
            unint64_t v72 = *((void *)v71 - 1);
            v71 -= 16;
            if (v72 < v43) {
              goto LABEL_67;
            }
          }
          std::string v69 = v71;
          unint64_t v10 = v67;
        }
        else
        {
          do
          {
            std::string v69 = v68 - 16;
            unint64_t v70 = *((void *)v68 - 1);
            v68 -= 16;
          }
          while (v70 >= v43);
LABEL_67:
          unint64_t v10 = v67;
          if (v67 < (unint64_t)v69)
          {
            unint64_t v73 = (unint64_t)v69;
            do
            {
              char v74 = *(unsigned char *)v10;
              *(unsigned char *)unint64_t v10 = *(unsigned char *)v73;
              *(unsigned char *)unint64_t v73 = v74;
              uint64_t v75 = *(void *)(v10 + 8);
              *(void *)(v10 + 8) = *(void *)(v73 + 8);
              *(void *)(v73 + 8) = v75;
              do
              {
                unint64_t v76 = *(void *)(v10 + 24);
                v10 += 16;
              }
              while (v76 < v43);
              do
              {
                unint64_t v77 = *(void *)(v73 - 8);
                v73 -= 16;
              }
              while (v77 >= v43);
            }
            while (v10 < v73);
          }
        }
        if (v10 - 16 != v9)
        {
          *(unsigned char *)unint64_t v9 = *(unsigned char *)(v10 - 16);
          *(void *)(v9 + 8) = *(void *)(v10 - 8);
        }
        *(unsigned char *)(v10 - 16) = v42;
        *(void *)(v10 - 8) = v43;
        if (v67 >= (unint64_t)v69) {
          break;
        }
LABEL_78:
        uint64_t result = (char *)sub_246CD8578(v9, v10 - 16, a3, a4 & 1);
        a4 = 0;
      }
      BOOL v78 = sub_246CD9178(v9, (char *)(v10 - 16));
      uint64_t result = (char *)sub_246CD9178(v10, a2);
      if (result) {
        break;
      }
      if (!v78) {
        goto LABEL_78;
      }
    }
    a2 = (char *)(v10 - 16);
    if (!v78) {
      continue;
    }
    return result;
  }
}

BOOL sub_246CD9178(uint64_t a1, char *a2)
{
  uint64_t v4 = (uint64_t)&a2[-a1] >> 4;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      unint64_t v6 = *((void *)a2 - 1);
      unint64_t v7 = *(void *)(a1 + 8);
      if (v6 < v7)
      {
        char v8 = *(unsigned char *)a1;
        *(unsigned char *)a1 = *(a2 - 16);
        *(a2 - 16) = v8;
        *(void *)(a1 + 8) = v6;
        *((void *)a2 - 1) = v7;
      }
      return result;
    case 3:
      unint64_t v9 = *(void *)(a1 + 24);
      unint64_t v10 = *(void *)(a1 + 8);
      unint64_t v11 = *((void *)a2 - 1);
      if (v9 >= v10)
      {
        if (v11 < v9)
        {
          char v30 = *(unsigned char *)(a1 + 16);
          *(unsigned char *)(a1 + 16) = *(a2 - 16);
          *(a2 - 16) = v30;
          *(void *)(a1 + 24) = v11;
          *((void *)a2 - 1) = v9;
          unint64_t v31 = *(void *)(a1 + 24);
          unint64_t v32 = *(void *)(a1 + 8);
          if (v31 < v32)
          {
            char v33 = *(unsigned char *)a1;
            *(unsigned char *)a1 = *(unsigned char *)(a1 + 16);
            *(unsigned char *)(a1 + 16) = v33;
            *(void *)(a1 + 8) = v31;
            *(void *)(a1 + 24) = v32;
          }
        }
      }
      else
      {
        char v12 = *(unsigned char *)a1;
        if (v11 >= v9)
        {
          *(unsigned char *)a1 = *(unsigned char *)(a1 + 16);
          *(unsigned char *)(a1 + 16) = v12;
          *(void *)(a1 + 8) = v9;
          *(void *)(a1 + 24) = v10;
          unint64_t v37 = *((void *)a2 - 1);
          if (v37 < v10)
          {
            *(unsigned char *)(a1 + 16) = *(a2 - 16);
            *(a2 - 16) = v12;
            *(void *)(a1 + 24) = v37;
            *((void *)a2 - 1) = v10;
          }
        }
        else
        {
          *(unsigned char *)a1 = *(a2 - 16);
          *(a2 - 16) = v12;
          *(void *)(a1 + 8) = v11;
          *((void *)a2 - 1) = v10;
        }
      }
      return result;
    case 4:
      sub_246CD9544((char *)a1, (char *)(a1 + 16), (char *)(a1 + 32), a2 - 16);
      return 1;
    case 5:
      sub_246CD9544((char *)a1, (char *)(a1 + 16), (char *)(a1 + 32), (char *)(a1 + 48));
      unint64_t v19 = *((void *)a2 - 1);
      unint64_t v20 = *(void *)(a1 + 56);
      if (v19 >= v20) {
        return 1;
      }
      char v21 = *(unsigned char *)(a1 + 48);
      *(unsigned char *)(a1 + 48) = *(a2 - 16);
      *(a2 - 16) = v21;
      *(void *)(a1 + 56) = v19;
      *((void *)a2 - 1) = v20;
      unint64_t v22 = *(void *)(a1 + 56);
      unint64_t v23 = *(void *)(a1 + 40);
      if (v22 >= v23) {
        return 1;
      }
      char v24 = *(unsigned char *)(a1 + 32);
      char v25 = *(unsigned char *)(a1 + 48);
      *(unsigned char *)(a1 + 32) = v25;
      *(unsigned char *)(a1 + 48) = v24;
      *(void *)(a1 + 40) = v22;
      *(void *)(a1 + 56) = v23;
      unint64_t v26 = *(void *)(a1 + 24);
      if (v22 >= v26) {
        return 1;
      }
      char v27 = *(unsigned char *)(a1 + 16);
      *(unsigned char *)(a1 + 16) = v25;
      *(unsigned char *)(a1 + 32) = v27;
      *(void *)(a1 + 24) = v22;
      *(void *)(a1 + 40) = v26;
      unint64_t v28 = *(void *)(a1 + 8);
      if (v22 >= v28) {
        return 1;
      }
      char v29 = *(unsigned char *)a1;
      *(unsigned char *)a1 = v25;
      *(unsigned char *)(a1 + 16) = v29;
      *(void *)(a1 + 8) = v22;
      *(void *)(a1 + 24) = v28;
      return 1;
    default:
      unint64_t v13 = *(void *)(a1 + 8);
      unint64_t v14 = (unint64_t *)(a1 + 24);
      unint64_t v15 = *(void *)(a1 + 24);
      unint64_t v16 = *(void *)(a1 + 40);
      if (v15 < v13)
      {
        char v17 = *(unsigned char *)a1;
        if (v16 >= v15)
        {
          *(unsigned char *)a1 = *(unsigned char *)(a1 + 16);
          *(unsigned char *)(a1 + 16) = v17;
          *(void *)(a1 + 8) = v15;
          *(void *)(a1 + 24) = v13;
          if (v16 >= v13) {
            goto LABEL_30;
          }
          *(unsigned char *)(a1 + 16) = *(unsigned char *)(a1 + 32);
          *(unsigned char *)(a1 + 32) = v17;
          char v18 = (unint64_t *)(a1 + 24);
        }
        else
        {
          *(unsigned char *)a1 = *(unsigned char *)(a1 + 32);
          *(unsigned char *)(a1 + 32) = v17;
          char v18 = (unint64_t *)(a1 + 8);
        }
        unint64_t v14 = (unint64_t *)(a1 + 40);
        goto LABEL_29;
      }
      if (v16 < v15)
      {
        char v34 = *(unsigned char *)(a1 + 16);
        char v35 = *(unsigned char *)(a1 + 32);
        *(unsigned char *)(a1 + 16) = v35;
        *(unsigned char *)(a1 + 32) = v34;
        *(void *)(a1 + 24) = v16;
        *(void *)(a1 + 40) = v15;
        if (v16 < v13)
        {
          char v36 = *(unsigned char *)a1;
          *(unsigned char *)a1 = v35;
          *(unsigned char *)(a1 + 16) = v36;
          char v18 = (unint64_t *)(a1 + 8);
LABEL_29:
          *char v18 = v16;
          *unint64_t v14 = v13;
        }
      }
LABEL_30:
      unint64_t v38 = (char *)(a1 + 48);
      if ((char *)(a1 + 48) == a2) {
        return 1;
      }
      uint64_t v39 = 0;
      int v40 = 0;
      unint64_t v41 = (char *)(a1 + 32);
      while (1)
      {
        unint64_t v42 = *((void *)v38 + 1);
        if (v42 < *((void *)v41 + 1)) {
          break;
        }
LABEL_39:
        unint64_t v41 = v38;
        v39 += 16;
        v38 += 16;
        if (v38 == a2) {
          return 1;
        }
      }
      char v43 = *v38;
      uint64_t v44 = v39;
      do
      {
        uint64_t v45 = a1 + v44;
        *(unsigned char *)(v45 + 48) = *(unsigned char *)(a1 + v44 + 32);
        *(void *)(v45 + 56) = *(void *)(a1 + v44 + 40);
        if (v44 == -32)
        {
          *(unsigned char *)a1 = v43;
          *(void *)(a1 + 8) = v42;
          if (++v40 != 8) {
            goto LABEL_39;
          }
          return v38 + 16 == a2;
        }
        v44 -= 16;
      }
      while (v42 < *(void *)(v45 + 24));
      uint64_t v46 = a1 + v44;
      *(unsigned char *)(v46 + 48) = v43;
      *(void *)(v46 + 56) = v42;
      if (++v40 != 8) {
        goto LABEL_39;
      }
      return v38 + 16 == a2;
  }
}

char *sub_246CD9544(char *result, char *a2, char *a3, char *a4)
{
  unint64_t v4 = *((void *)a2 + 1);
  unint64_t v5 = *((void *)result + 1);
  unint64_t v6 = *((void *)a3 + 1);
  if (v4 < v5)
  {
    char v7 = *result;
    if (v6 >= v4)
    {
      void *result = *a2;
      *a2 = v7;
      *((void *)result + 1) = v4;
      *((void *)a2 + 1) = v5;
      unint64_t v4 = *((void *)a3 + 1);
      if (v4 >= v5) {
        goto LABEL_11;
      }
      *a2 = *a3;
      *a3 = v7;
      *((void *)a2 + 1) = v4;
    }
    else
    {
      void *result = *a3;
      *a3 = v7;
      *((void *)result + 1) = v6;
    }
    *((void *)a3 + 1) = v5;
    unint64_t v4 = v5;
LABEL_11:
    unint64_t v12 = *((void *)a4 + 1);
    if (v12 >= v4) {
      return result;
    }
    goto LABEL_14;
  }
  if (v6 >= v4)
  {
    unint64_t v4 = *((void *)a3 + 1);
    unint64_t v12 = *((void *)a4 + 1);
    if (v12 >= v6) {
      return result;
    }
    goto LABEL_14;
  }
  char v8 = *a2;
  *a2 = *a3;
  *a3 = v8;
  *((void *)a2 + 1) = v6;
  *((void *)a3 + 1) = v4;
  unint64_t v9 = *((void *)a2 + 1);
  unint64_t v10 = *((void *)result + 1);
  if (v9 >= v10) {
    goto LABEL_11;
  }
  char v11 = *result;
  void *result = *a2;
  *a2 = v11;
  *((void *)result + 1) = v9;
  *((void *)a2 + 1) = v10;
  unint64_t v4 = *((void *)a3 + 1);
  unint64_t v12 = *((void *)a4 + 1);
  if (v12 >= v4) {
    return result;
  }
LABEL_14:
  char v13 = *a3;
  *a3 = *a4;
  *a4 = v13;
  *((void *)a3 + 1) = v12;
  *((void *)a4 + 1) = v4;
  unint64_t v14 = *((void *)a3 + 1);
  unint64_t v15 = *((void *)a2 + 1);
  if (v14 < v15)
  {
    char v16 = *a2;
    *a2 = *a3;
    *a3 = v16;
    *((void *)a2 + 1) = v14;
    *((void *)a3 + 1) = v15;
    unint64_t v17 = *((void *)a2 + 1);
    unint64_t v18 = *((void *)result + 1);
    if (v17 < v18)
    {
      char v19 = *result;
      void *result = *a2;
      *a2 = v19;
      *((void *)result + 1) = v17;
      *((void *)a2 + 1) = v18;
    }
  }
  return result;
}

void sub_246CD9698(void *a1)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  operator new();
}

void sub_246CD99B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, uint64_t a11, uint64_t a12)
{
  sub_246CD9A30(a12);
  unint64_t v14 = *a10;
  if (*a10)
  {
    *(void *)(v12 + 40) = v14;
    operator delete(v14);
  }
  sub_246CD9AA4(v12);
  _Unwind_Resume(a1);
}

uint64_t sub_246CD9A30(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 96);
  if (v2)
  {
    *(void *)(a1 + 104) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(void **)(a1 + 72);
  if (v3)
  {
    *(void *)(a1 + 80) = v3;
    operator delete(v3);
  }
  unint64_t v4 = *(void **)(a1 + 48);
  if (v4)
  {
    *(void *)(a1 + 56) = v4;
    operator delete(v4);
  }
  unint64_t v5 = *(void **)(a1 + 24);
  if (v5)
  {
    *(void *)(a1 + 32) = v5;
    operator delete(v5);
  }
  unint64_t v6 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v6;
    operator delete(v6);
  }
  return a1;
}

uint64_t sub_246CD9AA4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v3 = *(void **)(v2 + 8);
  uint64_t v4 = v3[11];
  if (v4) {
    unint64_t v5 = (void *)(v4 - 80);
  }
  else {
    unint64_t v5 = 0;
  }
  if (v5 != v3)
  {
    do
    {
      uint64_t v6 = v5[11];
      if (v6) {
        uint64_t v3 = (void *)(v6 - 80);
      }
      else {
        uint64_t v3 = 0;
      }
      sub_246CE5B48((uint64_t)v5);
      operator delete(v5);
      unint64_t v5 = v3;
    }
    while (v3 != *(void **)(v2 + 8));
  }
  operator delete(v3);
  MEMORY[0x24C5471E0](v2, 0x1020C402FC1992ELL);
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_246CD9B64(unsigned char *a1)
{
  sub_246CC7148((uint64_t)v24);
  uint64_t v2 = sub_246CC7924(v25, (uint64_t)"#", 1);
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(_DWORD *)((char *)v2 + *(void *)(*v2 - 24) + 8) &= ~0x4000u;
  *(uint64_t *)((char *)v2 + *(void *)(v4 - 24) + 24) = 2;
  unint64_t v5 = (const std::ios_base *)((char *)v2 + *(void *)(v4 - 24));
  if (v5[1].__fmtflags_ == -1)
  {
    std::ios_base::getloc(v5);
    uint64_t v6 = std::locale::use_facet(&v35, MEMORY[0x263F8C108]);
    std::ios_base::fmtflags v7 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v6->__vftable[2].~facet_0)(v6, 32);
    std::locale::~locale(&v35);
    v5[1].__fmtflags_ = v7;
    uint64_t v3 = *v2;
  }
  v5[1].__fmtflags_ = 48;
  *(_DWORD *)((char *)v2 + *(void *)(v3 - 24) + 8) = *(_DWORD *)((unsigned char *)v2 + *(void *)(v3 - 24) + 8) & 0xFFFFFFB5 | 8;
  std::ostream::operator<<();
  uint64_t v8 = v25[0];
  uint64_t v9 = v25[0];
  *(_DWORD *)((char *)&v25[1] + *(void *)(v25[0] - 24)) &= ~0x4000u;
  *(void *)((char *)&v25[3] + *(void *)(v9 - 24)) = 2;
  unint64_t v10 = (const std::ios_base *)((char *)v25 + *(void *)(v9 - 24));
  if (v10[1].__fmtflags_ == -1)
  {
    std::ios_base::getloc(v10);
    char v11 = std::locale::use_facet(&v35, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 32);
    std::locale::~locale(&v35);
    uint64_t v8 = v25[0];
  }
  v10[1].__fmtflags_ = 48;
  *(_DWORD *)((char *)&v25[1] + *(void *)(v8 - 24)) = *(_DWORD *)((unsigned char *)&v25[1] + *(void *)(v8 - 24)) & 0xFFFFFFB5 | 8;
  std::ostream::operator<<();
  uint64_t v12 = v25[0];
  uint64_t v13 = v25[0];
  *(_DWORD *)((char *)&v25[1] + *(void *)(v25[0] - 24)) &= ~0x4000u;
  *(void *)((char *)&v25[3] + *(void *)(v13 - 24)) = 2;
  unint64_t v14 = (const std::ios_base *)((char *)v25 + *(void *)(v13 - 24));
  if (v14[1].__fmtflags_ == -1)
  {
    std::ios_base::getloc(v14);
    unint64_t v15 = std::locale::use_facet(&v35, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v15->__vftable[2].~facet_0)(v15, 32);
    std::locale::~locale(&v35);
    uint64_t v12 = v25[0];
  }
  v14[1].__fmtflags_ = 48;
  *(_DWORD *)((char *)&v25[1] + *(void *)(v12 - 24)) = *(_DWORD *)((unsigned char *)&v25[1] + *(void *)(v12 - 24)) & 0xFFFFFFB5 | 8;
  std::ostream::operator<<();
  if ((v33 & 0x10) != 0)
  {
    unint64_t v17 = v32;
    if (v32 < v29)
    {
      unint64_t v32 = v29;
      unint64_t v17 = v29;
    }
    unint64_t v18 = __src;
    size_t v16 = v17 - (void)__src;
    if (v17 - (unint64_t)__src >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_24;
    }
  }
  else
  {
    if ((v33 & 8) == 0)
    {
      size_t v16 = 0;
      a1[23] = 0;
      goto LABEL_20;
    }
    unint64_t v18 = v26;
    size_t v16 = v27 - (void)v26;
    if ((unint64_t)(v27 - (void)v26) >= 0x7FFFFFFFFFFFFFF8) {
LABEL_24:
    }
      sub_246CC5D0C();
  }
  if (v16 >= 0x17)
  {
    uint64_t v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v19 = v16 | 7;
    }
    uint64_t v20 = v19 + 1;
    char v21 = operator new(v19 + 1);
    *((void *)a1 + 1) = v16;
    *((void *)a1 + 2) = v20 | 0x8000000000000000;
    *(void *)a1 = v21;
    a1 = v21;
    goto LABEL_19;
  }
  a1[23] = v16;
  if (v16) {
LABEL_19:
  }
    memmove(a1, v18, v16);
LABEL_20:
  a1[v16] = 0;
  v24[0] = *MEMORY[0x263F8C2B8];
  uint64_t v22 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v24 + *(void *)(v24[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v25[0] = v22;
  v25[1] = MEMORY[0x263F8C318] + 16;
  if (v31 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x24C547150](&v34);
}

void sub_246CDA0BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::locale::~locale((std::locale *)(v9 - 72));
  sub_246CC742C((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_246CDA0E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_246CDA0F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_246CDA108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_246CDA11C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_246CDA130(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
  {
    sub_246CC5E50(&__dst, *(void **)a2, *(void *)(a2 + 8));
    BOOL v4 = *(char *)(a2 + 23) < 0;
  }
  else
  {
    BOOL v4 = 0;
    long long __dst = *(_OWORD *)a2;
    uint64_t v12 = *(void *)(a2 + 16);
  }
  char v13 = *(unsigned char *)(a2 + 24);
  p_dst = &__dst;
  if (v12 < 0) {
    p_dst = (long long *)__dst;
  }
  if (v4) {
    uint64_t v6 = *(void *)a2;
  }
  else {
    uint64_t v6 = a2;
  }
  unint64_t v14 = (char *)p_dst + *(void *)(a2 + 32) - v6;
  uint64_t result = sub_246CE63CC(a1, (uint64_t)&__dst);
  uint64_t v8 = result;
  if (!result)
  {
    sub_246CC5444(v9, "No such node");
    sub_246CE75C4(&v10, v9, a2);
  }
  if (SHIBYTE(v12) < 0)
  {
    operator delete((void *)__dst);
    return v8;
  }
  return result;
}

void sub_246CDA25C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, std::runtime_error a19)
{
  sub_246CE67A4(&a19);
  if (a18 < 0)
  {
    operator delete(__p);
    if ((*(char *)(v19 - 41) & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(a1);
  }
  else if ((*(char *)(v19 - 41) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(*(void **)(v19 - 64));
  _Unwind_Resume(a1);
}

void sub_246CDA2BC(void *__dst, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_246CC5E50(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v2 = *a2;
    __dst[2] = *((void *)a2 + 2);
    *(_OWORD *)long long __dst = v2;
  }
  operator new();
}

void sub_246CDA354(_Unwind_Exception *a1)
{
  operator delete(*(void **)(v2 + 8));
  MEMORY[0x24C5471E0](v2, 0x1020C402FC1992ELL);
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(a1);
}

void sub_246CDA3A0(void *a1)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  operator new();
}

void sub_246CDD060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,std::locale a27,uint64_t a28,uint64_t a29,uint64_t a30,std::locale a31,uint64_t a32,uint64_t a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale::~locale(&a72);
  std::locale::~locale(&a31);
  std::locale::~locale(&a27);
  if (a40 < 0)
  {
    operator delete(__p);
    sub_246CD9AA4(a12);
    _Unwind_Resume(a1);
  }
  sub_246CD9AA4(a12);
  _Unwind_Resume(a1);
}

void sub_246CDD94C(uint64_t a1, uint64_t a2, long long *a3)
{
  int v6 = *(char *)(a2 + 23);
  if (v6 < 0)
  {
    sub_246CC5E50(__dst, *(void **)a2, *(void *)(a2 + 8));
    LOBYTE(v6) = *(unsigned char *)(a2 + 23);
  }
  else
  {
    *(_OWORD *)long long __dst = *(_OWORD *)a2;
    uint64_t v15 = *(void *)(a2 + 16);
  }
  char v16 = *(unsigned char *)(a2 + 24);
  std::ios_base::fmtflags v7 = __dst;
  if (v15 < 0) {
    std::ios_base::fmtflags v7 = (void **)__dst[0];
  }
  if ((v6 & 0x80u) == 0) {
    uint64_t v8 = (void *)a2;
  }
  else {
    uint64_t v8 = *(void **)a2;
  }
  unint64_t v17 = (char *)v7 + *(void *)(a2 + 32) - (void)v8;
  sub_246CE8898(a1, (uint64_t)__dst);
  sub_246CE64A4((uint64_t)v12, (uint64_t *)__dst);
  if (SHIBYTE(v13) < 0)
  {
    sub_246CC5E50(v9, v12[0], (unint64_t)v12[1]);
  }
  else
  {
    *(_OWORD *)uint64_t v9 = *(_OWORD *)v12;
    uint64_t v10 = v13;
  }
  sub_246CDA2BC(&__p, a3);
}

void sub_246CDDB9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a24 < 0)
  {
    operator delete(__p);
    if ((a30 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a30 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a25);
  _Unwind_Resume(exception_object);
}

void sub_246CDDC38(uint64_t a1, uint64_t a2)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  sub_246CD9B64(v52);
  __int16 v50 = 11790;
  strcpy((char *)v49, "<xmlattr>.fill");
  char v51 = v49;
  sub_246CEB858((uint64_t *)&v48, a2, (uint64_t)v49);
  std::string::size_type v3 = v48.__r_.__value_.__r.__words[0];
  if (!v48.__r_.__value_.__r.__words[0]) {
    goto LABEL_6;
  }
  char v55 = 0;
  if (*(char *)(v48.__r_.__value_.__r.__words[0] + 23) < 0)
  {
    sub_246CC5E50(&__p, *(void **)v48.__r_.__value_.__l.__data_, *(void *)(v48.__r_.__value_.__r.__words[0] + 8));
  }
  else
  {
    long long v4 = *(_OWORD *)v48.__r_.__value_.__l.__data_;
    __p.__r_.__value_.__r.__words[2] = *(void *)(v48.__r_.__value_.__r.__words[0] + 16);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v4;
  }
  char v55 = 1;
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_6:
    char v55 = 0;
    if (((char)v50 & 0x80000000) == 0) {
      goto LABEL_7;
    }
LABEL_11:
    operator delete(v49[0]);
    if (v3) {
      goto LABEL_8;
    }
    goto LABEL_12;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  char v55 = 0;
  if ((char)v50 < 0) {
    goto LABEL_11;
  }
LABEL_7:
  if (v3)
  {
LABEL_8:
    __int16 v50 = 11790;
    strcpy((char *)v49, "<xmlattr>.fill");
    char v51 = v49;
    sub_246CE5CFC(a2, (uint64_t)v49, (long long *)v52);
    if (((char)v50 & 0x80000000) == 0) {
      goto LABEL_130;
    }
    unint64_t v5 = v49[0];
    goto LABEL_129;
  }
LABEL_12:
  int v6 = (char)v53;
  if ((v53 & 0x80u) == 0) {
    size_t v7 = v53;
  }
  else {
    size_t v7 = (size_t)v52[1];
  }
  unint64_t v8 = v7 + 5;
  if (v7 + 5 >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  if (v8 >= 0x17)
  {
    uint64_t v10 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v10 = v8 | 7;
    }
    uint64_t v11 = v10 + 1;
    uint64_t v12 = (char *)operator new(v10 + 1);
    v48.__r_.__value_.__l.__size_ = v7 + 5;
    v48.__r_.__value_.__r.__words[2] = v11 | 0x8000000000000000;
    v48.__r_.__value_.__r.__words[0] = (std::string::size_type)v12;
    *(_DWORD *)uint64_t v12 = 1819044198;
    uint64_t v9 = v12 + 5;
    v12[4] = 58;
  }
  else
  {
    HIDWORD(v48.__r_.__value_.__r.__words[1]) = 0;
    v48.__r_.__value_.__r.__words[2] = 0;
    *((unsigned char *)&v48.__r_.__value_.__s + 23) = v7 + 5;
    *(std::string::size_type *)((char *)v48.__r_.__value_.__r.__words + 4) = 58;
    uint64_t v9 = &v48.__r_.__value_.__s.__data_[5];
    LODWORD(v48.__r_.__value_.__l.__data_) = 1819044198;
    if (!v7) {
      goto LABEL_26;
    }
  }
  if (v6 >= 0) {
    uint64_t v13 = v52;
  }
  else {
    uint64_t v13 = (void **)v52[0];
  }
  memmove(v9, v13, v7);
LABEL_26:
  v9[v7] = 0;
  __int16 v50 = 11791;
  strcpy((char *)v49, "<xmlattr>.style");
  char v51 = v49;
  sub_246CEB858((uint64_t *)&v54, a2, (uint64_t)v49);
  int v14 = (int)v54;
  if (v54)
  {
    char v55 = 0;
    if (*((char *)v54 + 23) < 0)
    {
      sub_246CC5E50(&__p, *(void **)v54, *((void *)v54 + 1));
    }
    else
    {
      long long v15 = *v54;
      __p.__r_.__value_.__r.__words[2] = *((void *)v54 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v15;
    }
    int v14 = 1;
  }
  char v55 = v14;
  if ((char)v50 < 0)
  {
    operator delete(v49[0]);
    if (!v55) {
      goto LABEL_122;
    }
  }
  else if (!v14)
  {
    goto LABEL_122;
  }
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
  {
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      size_t size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      size_t size = __p.__r_.__value_.__l.__size_;
    }
    sub_246CC654C((void **)&v48.__r_.__value_.__l.__data_, p_p, size);
  }
  else if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) != 0)
  {
    sub_246CC6484(&v48, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else
  {
    std::string v48 = __p;
  }
  if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int64_t v18 = HIBYTE(v48.__r_.__value_.__r.__words[2]);
  }
  else {
    int64_t v18 = v48.__r_.__value_.__l.__size_;
  }
  if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v19 = &v48;
  }
  else {
    uint64_t v19 = (std::string *)v48.__r_.__value_.__r.__words[0];
  }
  if (v18 >= 5)
  {
    uint64_t v20 = v19;
    char v21 = (char *)v19 + v18;
    int64_t v22 = v18;
    unint64_t v23 = v19;
    while (1)
    {
      char v24 = (char *)memchr(v23, 102, v22 - 4);
      if (!v24) {
        goto LABEL_74;
      }
      if (*(_DWORD *)v24 == 1819044198 && v24[4] == 58) {
        break;
      }
      unint64_t v23 = (std::string *)(v24 + 1);
      int64_t v22 = v21 - (char *)v23;
      if (v21 - (char *)v23 < 5) {
        goto LABEL_74;
      }
    }
    if (v24 == v21 || v24 - (char *)v19 == -1) {
      goto LABEL_74;
    }
    if (v18 < 9) {
      goto LABEL_83;
    }
    int64_t v26 = v18;
    uint64_t v27 = v19;
    while (1)
    {
      unint64_t v28 = (char *)memchr(v27, 102, v26 - 8);
      if (!v28) {
        goto LABEL_83;
      }
      if (*(void *)v28 == 0x6E6F6E3A6C6C6966 && v28[8] == 101) {
        break;
      }
      uint64_t v27 = (std::string *)(v28 + 1);
      int64_t v26 = v21 - (char *)v27;
      if (v21 - (char *)v27 < 9) {
        goto LABEL_83;
      }
    }
    if (v28 != v21 && v28 - (char *)v19 != -1)
    {
LABEL_74:
      if (v18 >= 7)
      {
        int64_t v30 = v18;
        char v31 = v19;
        while (1)
        {
          unint64_t v32 = (char *)memchr(v31, 115, v30 - 6);
          if (!v32) {
            break;
          }
          if (*(_DWORD *)v32 == 1869771891 && *(_DWORD *)(v32 + 3) == 979725167)
          {
            if (v32 == v21 || v32 - (char *)v19 == -1) {
              goto LABEL_122;
            }
            if (v18 < 11) {
              goto LABEL_104;
            }
            int64_t v39 = v18;
            int v40 = v19;
            while (1)
            {
              unint64_t v41 = (char *)memchr(v40, 115, v39 - 10);
              if (!v41) {
                goto LABEL_104;
              }
              if (*(void *)v41 == 0x6E3A656B6F727473 && *(void *)(v41 + 3) == 0x656E6F6E3A656B6FLL) {
                break;
              }
              int v40 = (std::string *)(v41 + 1);
              int64_t v39 = v21 - (char *)v40;
              if (v21 - (char *)v40 < 11) {
                goto LABEL_104;
              }
            }
            if (v41 != v21 && v41 - (char *)v19 != -1) {
              goto LABEL_122;
            }
            do
            {
LABEL_104:
              char v43 = (char *)memchr(v20, 115, v18 - 6);
              if (!v43) {
                break;
              }
              if (*(_DWORD *)v43 == 1869771891 && *(_DWORD *)(v43 + 3) == 979725167) {
                goto LABEL_111;
              }
              uint64_t v20 = (std::string *)(v43 + 1);
              int64_t v18 = v21 - (v43 + 1);
            }
            while (v18 > 6);
            char v43 = v21;
LABEL_111:
            uint64_t v36 = v43 - (char *)v19 + 7;
            BOOL v37 = v43 == v21;
            uint64_t v38 = 6;
            goto LABEL_112;
          }
          char v31 = (std::string *)(v32 + 1);
          int64_t v30 = v21 - (char *)v31;
          if (v21 - (char *)v31 < 7) {
            goto LABEL_122;
          }
        }
      }
      goto LABEL_122;
    }
    do
    {
LABEL_83:
      uint64_t v34 = (char *)memchr(v20, 102, v18 - 4);
      if (!v34) {
        break;
      }
      if (*(_DWORD *)v34 == 1819044198 && v34[4] == 58) {
        goto LABEL_90;
      }
      uint64_t v20 = (std::string *)(v34 + 1);
      int64_t v18 = v21 - (v34 + 1);
    }
    while (v18 > 4);
    uint64_t v34 = v21;
LABEL_90:
    uint64_t v36 = v34 - (char *)v19 + 5;
    BOOL v37 = v34 == v21;
    uint64_t v38 = 4;
LABEL_112:
    if (v37) {
      std::string::size_type v45 = v38;
    }
    else {
      std::string::size_type v45 = v36;
    }
    if ((v53 & 0x80u) == 0) {
      std::string::size_type v46 = v53;
    }
    else {
      std::string::size_type v46 = (std::string::size_type)v52[1];
    }
    if ((v53 & 0x80u) == 0) {
      unint64_t v47 = v52;
    }
    else {
      unint64_t v47 = (void **)v52[0];
    }
    std::string::replace(&v48, v45, v46, (const std::string::value_type *)v47, v46);
  }
LABEL_122:
  __int16 v50 = 11791;
  strcpy((char *)v49, "<xmlattr>.style");
  char v51 = v49;
  sub_246CE5CFC(a2, (uint64_t)v49, (long long *)&v48);
  if ((char)v50 < 0) {
    operator delete(v49[0]);
  }
  if (v55 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
  {
    unint64_t v5 = (void *)v48.__r_.__value_.__r.__words[0];
LABEL_129:
    operator delete(v5);
  }
LABEL_130:
  if ((char)v53 < 0) {
    operator delete(v52[0]);
  }
}

void sub_246CDE298(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_objecta, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,char a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  if (a31 && a37 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(exception_objecta);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_246CDE32C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 96);
  if (v2) {
    operator delete(v2);
  }
  std::string::size_type v3 = *(void **)(a1 + 72);
  if (v3) {
    operator delete(v3);
  }
  long long v4 = *(void **)(a1 + 48);
  if (v4) {
    operator delete(v4);
  }
  unint64_t v5 = *(void **)(a1 + 24);
  if (v5) {
    operator delete(v5);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_246CDE38C()
{
}

void sub_246CE2024(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,uint64_t a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38,uint64_t a39,void *a40,uint64_t a41,int a42,__int16 a43,char a44,char a45,uint64_t a46,void *a47,uint64_t a48,int a49,__int16 a50,char a51,char a52,uint64_t a53)
{
  __cxa_end_catch();
  if (SLOBYTE(STACK[0x28F]) < 0)
  {
    operator delete((void *)STACK[0x278]);
    if ((SLOBYTE(STACK[0x3C7]) & 0x80000000) == 0)
    {
LABEL_34:
      if (!a21)
      {
LABEL_39:
        sub_246CD9AA4((uint64_t)&STACK[0x3D0]);
        sub_246CC742C((uint64_t)&STACK[0x3F0]);
        if (a2 == 1)
        {
          __cxa_begin_catch(a1);
          a19[1] = 0;
          a19[2] = 0;
          *a19 = 0;
          operator new();
        }
        char v55 = *(void **)(a39 + 8);
        uint64_t v56 = v55[11];
        if (v56) {
          uint64_t v57 = (void *)(v56 - 80);
        }
        else {
          uint64_t v57 = 0;
        }
        if (v57 != v55)
        {
          do
          {
            uint64_t v58 = v57[11];
            if (v58) {
              char v55 = (void *)(v58 - 80);
            }
            else {
              char v55 = 0;
            }
            sub_246CE5B48((uint64_t)v57);
            operator delete(v57);
            uint64_t v57 = v55;
          }
          while (v55 != *(void **)(a39 + 8));
        }
        operator delete(v55);
        MEMORY[0x24C5471E0](a39, 0x1020C402FC1992ELL);
        if (a38 < 0) {
          operator delete(__p);
        }
        char v59 = *(void **)(a46 + 8);
        uint64_t v60 = v59[11];
        if (v60) {
          char v61 = (void *)(v60 - 80);
        }
        else {
          char v61 = 0;
        }
        if (v61 != v59)
        {
          do
          {
            uint64_t v62 = v61[11];
            if (v62) {
              char v59 = (void *)(v62 - 80);
            }
            else {
              char v59 = 0;
            }
            sub_246CE5B48((uint64_t)v61);
            operator delete(v61);
            char v61 = v59;
          }
          while (v59 != *(void **)(a46 + 8));
        }
        operator delete(v59);
        MEMORY[0x24C5471E0](a46, 0x1020C402FC1992ELL);
        if (a45 < 0) {
          operator delete(a40);
        }
        unint64_t v63 = *(void **)(a53 + 8);
        uint64_t v64 = v63[11];
        if (v64) {
          uint64_t v65 = (void *)(v64 - 80);
        }
        else {
          uint64_t v65 = 0;
        }
        if (v65 != v63)
        {
          do
          {
            uint64_t v66 = v65[11];
            if (v66) {
              unint64_t v63 = (void *)(v66 - 80);
            }
            else {
              unint64_t v63 = 0;
            }
            sub_246CE5B48((uint64_t)v65);
            operator delete(v65);
            uint64_t v65 = v63;
          }
          while (v63 != *(void **)(a53 + 8));
        }
        operator delete(v63);
        MEMORY[0x24C5471E0](a53, 0x1020C402FC1992ELL);
        if (a52 < 0)
        {
          operator delete(a47);
          _Unwind_Resume(a1);
        }
        _Unwind_Resume(a1);
      }
LABEL_38:
      operator delete(a21);
      goto LABEL_39;
    }
  }
  else if ((SLOBYTE(STACK[0x3C7]) & 0x80000000) == 0)
  {
    goto LABEL_34;
  }
  operator delete((void *)STACK[0x3B0]);
  if (!a21) {
    goto LABEL_39;
  }
  goto LABEL_38;
}

void sub_246CE2B58()
{
}

void sub_246CE2B60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  MEMORY[0x24C5471E0](v19, 0x1020C402FC1992ELL);
  if (*(char *)(a19 + 23) < 0) {
    operator delete(*(void **)a19);
  }
  __cxa_end_catch();
  JUMPOUT(0x246CE24C4);
}

void sub_246CE2BBC(uint64_t a1, long long *a2)
{
  sub_246CDA2BC(__p, a2);
}

uint64_t *sub_246CE2CAC@<X0>(uint64_t *result@<X0>, uint64_t a2@<X1>, int a3@<W4>, uint64_t a4@<X8>)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (*(void *)(a2 + 8) > 0xB8uLL)
  {
    uint64_t v4 = *result;
    *(_WORD *)((char *)&__p[2] + 7) = 11795;
    strcpy((char *)__p, "circle.<xmlattr>.cx");
    char v24 = __p;
    std::to_string(&v18, 400.0);
    sub_246CE5CFC(v4, (uint64_t)__p, (long long *)&v18);
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v18.__r_.__value_.__l.__data_);
      if ((SHIBYTE(__p[2]) & 0x80000000) == 0) {
        goto LABEL_5;
      }
    }
    else if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
    {
      goto LABEL_5;
    }
    operator delete(__p[0]);
LABEL_5:
    *(_WORD *)((char *)&__p[2] + 7) = 11795;
    strcpy((char *)__p, "circle.<xmlattr>.cy");
    char v24 = __p;
    std::to_string(&v18, 400.0);
    sub_246CE5CFC(v4, (uint64_t)__p, (long long *)&v18);
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v18.__r_.__value_.__l.__data_);
      if ((SHIBYTE(__p[2]) & 0x80000000) == 0) {
        goto LABEL_7;
      }
    }
    else if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
    {
      goto LABEL_7;
    }
    operator delete(__p[0]);
LABEL_7:
    *(_WORD *)((char *)&__p[2] + 7) = 11795;
    strcpy((char *)__p, "circle.<xmlattr>.id");
    char v24 = __p;
    MEMORY[0x24C5470D0](v21);
    std::locale::locale(v22, v21);
    sub_246CE5E70((uint64_t *)&__dst, v4, (uint64_t)__p);
    uint64_t v5 = __dst.__r_.__value_.__r.__words[0];
    if (!__dst.__r_.__value_.__r.__words[0])
    {
      memset(&v18, 0, sizeof(v18));
      operator new();
    }
    std::locale::locale((std::locale *)&v18, v22);
    sub_246CE9210(v5, (const std::locale *)&v18);
    std::locale::~locale((std::locale *)&v18);
    std::locale::~locale(v22);
    std::locale::~locale(v21);
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
    *(_WORD *)((char *)&__p[2] + 7) = 11794;
    strcpy((char *)__p, "circle.<xmlattr>.r");
    char v24 = __p;
    std::to_string(&v18, 400.0);
    sub_246CE5CFC(v4, (uint64_t)__p, (long long *)&v18);
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v18.__r_.__value_.__l.__data_);
      if ((SHIBYTE(__p[2]) & 0x80000000) == 0) {
        goto LABEL_18;
      }
    }
    else if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
    {
      goto LABEL_18;
    }
    operator delete(__p[0]);
LABEL_18:
    strcpy((char *)__p, "circle.<xmlattr>.style");
    HIBYTE(__p[2]) = 22;
    LOBYTE(__p[3]) = 46;
    char v24 = __p;
    sub_246CD9B64(&__dst);
    int v6 = std::string::insert(&__dst, 0, "fill:", 5uLL);
    std::string v18 = *v6;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    sub_246CE5CFC(v4, (uint64_t)__p, (long long *)&v18);
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v18.__r_.__value_.__l.__data_);
      if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_20:
        if ((SHIBYTE(__p[2]) & 0x80000000) == 0) {
          goto LABEL_21;
        }
        goto LABEL_27;
      }
    }
    else if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_20;
    }
    operator delete(__dst.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
    {
LABEL_21:
      if (!a3) {
        goto LABEL_46;
      }
LABEL_28:
      sub_246CC7148((uint64_t)__p);
      sub_246CC7924(&__p[2], (uint64_t)"translate(", 10);
      size_t v7 = (void *)std::ostream::operator<<();
      sub_246CC7924(v7, (uint64_t)" ", 1);
      unint64_t v8 = (void *)std::ostream::operator<<();
      sub_246CC7924(v8, (uint64_t)")", 1);
      uint64_t v9 = (char *)operator new(0x20uLL);
      v18.__r_.__value_.__r.__words[0] = (std::string::size_type)v9;
      *(_OWORD *)&v18.__r_.__value_.__r.__words[1] = xmmword_246D102C0;
      strcpy(v9, "circle.<xmlattr>.transform");
      LOBYTE(v19) = 46;
      *(void *)&long long v20 = v9;
      if ((v32 & 0x10) != 0)
      {
        uint64_t v12 = v31;
        if (v31 < v28)
        {
          char v31 = (char *)v28;
          uint64_t v12 = (char *)v28;
        }
        uint64_t v13 = v27;
        std::string::size_type v10 = v12 - (unsigned char *)v27;
        if ((unint64_t)(v12 - (unsigned char *)v27) > 0x7FFFFFFFFFFFFFF7) {
          goto LABEL_50;
        }
      }
      else
      {
        if ((v32 & 8) == 0)
        {
          std::string::size_type v10 = 0;
          *((unsigned char *)&__dst.__r_.__value_.__s + 23) = 0;
          p_dst = &__dst;
          goto LABEL_41;
        }
        uint64_t v13 = v25;
        std::string::size_type v10 = (char *)v26[1] - (char *)v25;
        if ((void *)((char *)v26[1] - (char *)v25) > (void *)0x7FFFFFFFFFFFFFF7) {
LABEL_50:
        }
          sub_246CC5D0C();
      }
      if (v10 >= 0x17)
      {
        uint64_t v14 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v10 | 7) != 0x17) {
          uint64_t v14 = v10 | 7;
        }
        uint64_t v15 = v14 + 1;
        p_dst = operator new(v14 + 1);
        __dst.__r_.__value_.__r.__words[2] = v15 | 0x8000000000000000;
        __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
        __dst.__r_.__value_.__l.__size_ = v10;
      }
      else
      {
        *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v10;
        p_dst = &__dst;
        if (!v10)
        {
LABEL_41:
          p_dst[v10] = 0;
          sub_246CE5CFC(v4, (uint64_t)&v18, (long long *)&__dst);
          if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(__dst.__r_.__value_.__l.__data_);
            if ((SHIBYTE(v18.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
              goto LABEL_43;
            }
          }
          else if ((SHIBYTE(v18.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          {
LABEL_43:
            __p[0] = *(void **)MEMORY[0x263F8C2B8];
            char v16 = *(void **)(MEMORY[0x263F8C2B8] + 72);
            *(void **)((char *)__p + *((void *)__p[0] - 3)) = *(void **)(MEMORY[0x263F8C2B8] + 64);
            __p[2] = v16;
            __p[3] = (void *)(MEMORY[0x263F8C318] + 16);
            if (SHIBYTE(v30[1]) < 0) {
              operator delete(v29);
            }
            std::streambuf::~streambuf();
            std::iostream::~basic_iostream();
            MEMORY[0x24C547150](&v33);
LABEL_46:
            operator new();
          }
          operator delete(v18.__r_.__value_.__l.__data_);
          goto LABEL_43;
        }
      }
      memmove(p_dst, v13, v10);
      goto LABEL_41;
    }
LABEL_27:
    operator delete(__p[0]);
    if (!a3) {
      goto LABEL_46;
    }
    goto LABEL_28;
  }
  *(_DWORD *)a4 = 0;
  *(unsigned char *)(a4 + 24) = 0;
  return result;
}

void sub_246CE5284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46)
{
  if (*(char *)(v46 - 129) < 0) {
    operator delete(*(void **)(v46 - 152));
  }
  sub_246CE5A44((uint64_t)&STACK[0x2C0]);
  sub_246CD9AA4((uint64_t)&STACK[0x3E0]);
  sub_246CD9AA4((uint64_t)&STACK[0x2A0]);
  sub_246CD9AA4((uint64_t)&a46);
  _Unwind_Resume(a1);
}

void sub_246CE57CC(_Unwind_Exception *a1)
{
}

void sub_246CE57E8()
{
}

void sub_246CE5854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

void sub_246CE5880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
}

uint64_t sub_246CE58A0(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C340] + 64;
  *(void *)(a1 + 112) = MEMORY[0x263F8C340] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  uint64_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 8));
  uint64_t v6 = MEMORY[0x263F8C340] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)a1 = v6;
  *(void *)(a1 + 112) = v2;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_246CE5A10(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x24C547150](v1);
  _Unwind_Resume(a1);
}

uint64_t sub_246CE5A44(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2C8];
  uint64_t v3 = *MEMORY[0x263F8C2C8];
  *(void *)a1 = *MEMORY[0x263F8C2C8];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x24C547150](a1 + 112);
  return a1;
}

void sub_246CE5B48(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void **)(v2 + 8);
  uint64_t v4 = v3[11];
  if (v4) {
    uint64_t v5 = (void *)(v4 - 80);
  }
  else {
    uint64_t v5 = 0;
  }
  if (v5 != v3)
  {
    do
    {
      uint64_t v6 = v5[11];
      if (v6) {
        uint64_t v3 = (void *)(v6 - 80);
      }
      else {
        uint64_t v3 = 0;
      }
      sub_246CE5B48(v5);
      operator delete(v5);
      uint64_t v5 = v3;
    }
    while (v3 != *(void **)(v2 + 8));
  }
  operator delete(v3);
  MEMORY[0x24C5471E0](v2, 0x1020C402FC1992ELL);
  if (*(char *)(a1 + 47) < 0)
  {
    operator delete(*(void **)(a1 + 24));
    if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
      return;
    }
  }
  else if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    return;
  }
  size_t v7 = *(void **)a1;
  operator delete(v7);
}

uint64_t sub_246CE5C24(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void **)(v2 + 8);
  uint64_t v4 = v3[11];
  if (v4) {
    uint64_t v5 = (void *)(v4 - 80);
  }
  else {
    uint64_t v5 = 0;
  }
  if (v5 != v3)
  {
    do
    {
      uint64_t v6 = v5[11];
      if (v6) {
        uint64_t v3 = (void *)(v6 - 80);
      }
      else {
        uint64_t v3 = 0;
      }
      sub_246CE5B48((uint64_t)v5);
      operator delete(v5);
      uint64_t v5 = v3;
    }
    while (v3 != *(void **)(v2 + 8));
  }
  operator delete(v3);
  MEMORY[0x24C5471E0](v2, 0x1020C402FC1992ELL);
  if (*(char *)(a1 + 47) < 0)
  {
    operator delete(*(void **)(a1 + 24));
    if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
      return a1;
    }
  }
  else if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    return a1;
  }
  operator delete(*(void **)a1);
  return a1;
}

void sub_246CE5CFC(uint64_t a1, uint64_t a2, long long *a3)
{
  sub_246CE5E70((uint64_t *)v5, a1, a2);
  uint64_t v4 = *(void *)v5;
  if (!*(void *)v5) {
    operator new();
  }
  sub_246CE5F6C(v4, a3);
}

void sub_246CE5E38(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_246CD9AA4((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_246CE5E4C(_Unwind_Exception *a1)
{
  MEMORY[0x24C5471E0](v1, 0x1020C402FC1992ELL);
  _Unwind_Resume(a1);
}

void sub_246CE5E70(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (*(char *)(a3 + 23) < 0)
  {
    sub_246CC5E50(__p, *(void **)a3, *(void *)(a3 + 8));
    BOOL v6 = *(char *)(a3 + 23) < 0;
  }
  else
  {
    BOOL v6 = 0;
    *(_OWORD *)std::string __p = *(_OWORD *)a3;
    uint64_t v10 = *(void *)(a3 + 16);
  }
  char v11 = *(unsigned char *)(a3 + 24);
  size_t v7 = __p;
  if (v10 < 0) {
    size_t v7 = (void **)__p[0];
  }
  if (v6) {
    unint64_t v8 = *(void **)a3;
  }
  else {
    unint64_t v8 = (void *)a3;
  }
  uint64_t v12 = (char *)v7 + *(void *)(a3 + 32) - (void)v8;
  *a1 = sub_246CE63CC(a2, (uint64_t)__p);
  if (SHIBYTE(v10) < 0) {
    operator delete(__p[0]);
  }
}

void sub_246CE5F50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CE5F6C(uint64_t a1, long long *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (*((char *)a2 + 23) < 0)
  {
    sub_246CC5E50(&__p, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long __p = *a2;
    uint64_t v6 = *((void *)a2 + 2);
  }
  if (&__p != (long long *)a1)
  {
    if (*(char *)(a1 + 23) < 0)
    {
      if (v6 >= 0) {
        p_p = &__p;
      }
      else {
        p_p = (long long *)__p;
      }
      if (v6 >= 0) {
        size_t v4 = HIBYTE(v6);
      }
      else {
        size_t v4 = *((void *)&__p + 1);
      }
      sub_246CC654C((void **)a1, p_p, v4);
    }
    else if (v6 < 0)
    {
      sub_246CC6484((void *)a1, (void *)__p, *((size_t *)&__p + 1));
    }
    else
    {
      *(_OWORD *)a1 = __p;
      *(void *)(a1 + 16) = v6;
    }
  }
  if (SHIBYTE(v6) < 0) {
    operator delete((void *)__p);
  }
}

void sub_246CE6074(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a10)
  {
    if (a16 < 0) {
      operator delete(__p);
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_246CE6098(uint64_t a1, uint64_t a2, long long *a3)
{
  int v6 = *(char *)(a2 + 23);
  if (v6 < 0)
  {
    sub_246CC5E50(__dst, *(void **)a2, *(void *)(a2 + 8));
    LOBYTE(v6) = *(unsigned char *)(a2 + 23);
  }
  else
  {
    *(_OWORD *)std::string __dst = *(_OWORD *)a2;
    uint64_t v18 = *(void *)(a2 + 16);
  }
  char v19 = *(unsigned char *)(a2 + 24);
  uint64_t v7 = __dst;
  if (v18 < 0) {
    uint64_t v7 = (void **)__dst[0];
  }
  if ((v6 & 0x80u) == 0) {
    unint64_t v8 = (void *)a2;
  }
  else {
    unint64_t v8 = *(void **)a2;
  }
  long long v20 = (char *)v7 + *(void *)(a2 + 32) - (void)v8;
  uint64_t v9 = sub_246CE8898(a1, (uint64_t)__dst);
  sub_246CE64A4((uint64_t)v15, (uint64_t *)__dst);
  uint64_t v10 = *(void *)(*(void *)(v9 + 24) + 8);
  char v11 = sub_246CE7AE0(v10, (const void **)v15);
  if ((const void **)v10 != v11) {
    sub_246CE2BBC((uint64_t)(v11 + 3), a3);
  }
  if (SHIBYTE(v16) < 0)
  {
    sub_246CC5E50(v12, v15[0], (unint64_t)v15[1]);
  }
  else
  {
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v15;
    uint64_t v13 = v16;
  }
  sub_246CDA2BC(&__p, a3);
}

void sub_246CE632C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a24 < 0)
  {
    operator delete(__p);
    if (a30 < 0)
    {
LABEL_6:
      operator delete(a25);
      _Unwind_Resume(exception_object);
    }
  }
  else if (a30 < 0)
  {
    goto LABEL_6;
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_246CE63CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  if ((v3 & 0x80u) == 0) {
    uint64_t v4 = a2;
  }
  else {
    uint64_t v4 = *(void *)a2;
  }
  if ((v3 & 0x80u) != 0) {
    uint64_t v3 = *(void *)(a2 + 8);
  }
  if (*(void *)(a2 + 32) == v4 + v3) {
    return a1;
  }
  sub_246CE64A4((uint64_t)__p, (uint64_t *)a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 24) + 8);
  uint64_t v7 = sub_246CE7AE0(v6, (const void **)__p);
  if ((const void **)v6 == v7)
  {
    a1 = 0;
    if ((v10 & 0x80000000) == 0) {
      return a1;
    }
  }
  else
  {
    a1 = sub_246CE63CC(v7 + 3, a2);
    if ((v10 & 0x80000000) == 0) {
      return a1;
    }
  }
  operator delete(__p[0]);
  return a1;
}

void sub_246CE6488(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CE64A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = (char *)a2[4];
  if (*((char *)a2 + 23) < 0)
  {
    uint64_t v6 = (uint64_t *)*a2;
    uint64_t v5 = a2[1];
  }
  else
  {
    uint64_t v5 = *((unsigned __int8 *)a2 + 23);
    uint64_t v6 = a2;
  }
  uint64_t v7 = (char *)v6 + v5;
  unint64_t v8 = (char *)memchr(v4, *((char *)a2 + 24), (char *)v6 + v5 - v4);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v7;
  }
  unint64_t v10 = v9 - v4;
  if ((unint64_t)(v9 - v4) >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  if (v10 <= 0x16)
  {
    HIBYTE(v23) = (_BYTE)v9 - (_BYTE)v4;
    char v11 = (char *)v22;
    if (v9 != v4) {
      goto LABEL_10;
    }
LABEL_19:
    uint64_t v12 = v11;
    goto LABEL_22;
  }
  uint64_t v18 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v10 | 7) != 0x17) {
    uint64_t v18 = v10 | 7;
  }
  uint64_t v19 = v18 + 1;
  char v11 = (char *)operator new(v18 + 1);
  v22[1] = (void *)(v9 - v4);
  unint64_t v23 = v19 | 0x8000000000000000;
  v22[0] = v11;
  if (v9 == v4) {
    goto LABEL_19;
  }
LABEL_10:
  if (v10 < 0x20 || (unint64_t)(v11 - v4) < 0x20)
  {
    uint64_t v12 = v11;
    uint64_t v13 = v4;
    do
    {
LABEL_21:
      char v20 = *v13++;
      *v12++ = v20;
    }
    while (v13 != v9);
    goto LABEL_22;
  }
  uint64_t v12 = &v11[v10 & 0xFFFFFFFFFFFFFFE0];
  uint64_t v13 = &v4[v10 & 0xFFFFFFFFFFFFFFE0];
  uint64_t v14 = (long long *)(v4 + 16);
  uint64_t v15 = v11 + 16;
  unint64_t v16 = v10 & 0xFFFFFFFFFFFFFFE0;
  do
  {
    long long v17 = *v14;
    *(v15 - 1) = *(v14 - 1);
    _OWORD *v15 = v17;
    v14 += 2;
    v15 += 2;
    v16 -= 32;
  }
  while (v16);
  if (v10 != (v10 & 0xFFFFFFFFFFFFFFE0)) {
    goto LABEL_21;
  }
LABEL_22:
  char *v12 = 0;
  a2[4] = (uint64_t)v9;
  if ((*((char *)a2 + 23) & 0x80000000) == 0)
  {
    if (v9 == (char *)a2 + *((unsigned __int8 *)a2 + 23)) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v9 != (char *)(*a2 + a2[1])) {
LABEL_24:
  }
    a2[4] = (uint64_t)(v9 + 1);
LABEL_25:
  char v24 = 0;
  int v21 = SHIBYTE(v23);
  if (SHIBYTE(v23) < 0)
  {
    sub_246CC5E50(&__p, v22[0], (unint64_t)v22[1]);
  }
  else
  {
    long long __p = *(_OWORD *)v22;
    unint64_t v26 = v23;
  }
  char v24 = 1;
  if (SHIBYTE(v26) < 0)
  {
    sub_246CC5E50((unsigned char *)a1, (void *)__p, *((unint64_t *)&__p + 1));
    if (v24 && SHIBYTE(v26) < 0) {
      operator delete((void *)__p);
    }
  }
  else
  {
    *(_OWORD *)a1 = __p;
    *(void *)(a1 + 16) = v26;
  }
  if (v21 < 0) {
    operator delete(v22[0]);
  }
}

void sub_246CE66E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, char a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a12 && a18 < 0) {
    operator delete(__p);
  }
  if (v18 < 0)
  {
    operator delete(a9);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CE673C(const std::runtime_error *a1, int8x16_t *a2)
{
  exception = __cxa_allocate_exception(0x48uLL);
  sub_246CE6820((uint64_t)exception, a1, a2);
  __cxa_throw(exception, (struct type_info *)&unk_26FB3DF88, (void (*)(void *))sub_246CE694C);
}

void sub_246CE6790(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_246CE67A4(std::runtime_error *this)
{
  this->__vftable = (std::runtime_error_vtbl *)&unk_26FB3E088;
  uint64_t v2 = this[1].__vftable;
  if (v2) {
    (*((void (**)(std::runtime_error_vtbl *))v2->~runtime_error + 1))(v2);
  }
  std::runtime_error::~runtime_error(this);
}

uint64_t sub_246CE6820(uint64_t a1, const std::runtime_error *a2, int8x16_t *a3)
{
  *(void *)a1 = &unk_26FB3E058;
  std::runtime_error::runtime_error((std::runtime_error *)(a1 + 8), a2);
  *(void *)(a1 + 8) = &unk_26FB3E088;
  uint64_t v6 = (uint64_t)a2[1].__vftable;
  if (v6) {
    uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 24))(v6);
  }
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)a1 = &unk_26FB3DFE0;
  *(void *)(a1 + 8) = &unk_26FB3E010;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = &unk_26FB3E038;
  *(_DWORD *)(a1 + 64) = a3[1].i32[0];
  *(int8x16_t *)(a1 + 48) = vextq_s8(*a3, *a3, 8uLL);
  return a1;
}

void sub_246CE6938(_Unwind_Exception *a1)
{
  std::runtime_error::~runtime_error(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_246CE694C(uint64_t a1)
{
  *(void *)(a1 + 32) = &unk_26FB3E0D8;
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 && (*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
    *(void *)(a1 + 40) = 0;
  }
  *(void *)(a1 + 8) = &unk_26FB3E088;
  uint64_t v3 = *(void *)(a1 + 24);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  std::runtime_error::~runtime_error((std::runtime_error *)(a1 + 8));
  return a1;
}

void sub_246CE6A1C()
{
}

void sub_246CE6BA4(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v3;
  uint64_t v5 = *(void *)(v1 + 24);
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  std::runtime_error::~runtime_error(v2);
  MEMORY[0x24C5471E0](v1, 0x10F1C403FF34BC6);
  _Unwind_Resume(a1);
}

void sub_246CE6C08(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 24))(v1);
  _Unwind_Resume(a1);
}

void sub_246CE6C3C(uint64_t a1)
{
  exception = __cxa_allocate_exception(0x48uLL);
  sub_246CE7240((uint64_t)exception, a1);
  __cxa_throw(exception, (struct type_info *)&unk_26FB3DF88, (void (*)(void *))sub_246CE694C);
}

void sub_246CE6C84(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_246CE6C98(uint64_t a1)
{
  *(void *)(a1 + 32) = &unk_26FB3E0D8;
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 && (*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
    *(void *)(a1 + 40) = 0;
  }
  *(void *)(a1 + 8) = &unk_26FB3E088;
  uint64_t v3 = *(void *)(a1 + 24);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  std::runtime_error::~runtime_error((std::runtime_error *)(a1 + 8));
  JUMPOUT(0x24C5471E0);
}

void sub_246CE6D88(std::runtime_error *this)
{
  this[1].__imp_.__imp_ = (const char *)&unk_26FB3E0D8;
  uint64_t v2 = this[2].__vftable;
  if (v2 && (*((unsigned int (**)(std::runtime_error_vtbl *))v2->~runtime_error + 4))(v2)) {
    this[2].__vftable = 0;
  }
  this->__vftable = (std::runtime_error_vtbl *)&unk_26FB3E088;
  uint64_t v3 = this[1].__vftable;
  if (v3) {
    (*((void (**)(std::runtime_error_vtbl *))v3->~runtime_error + 1))(v3);
  }
  std::runtime_error::~runtime_error(this);
}

void sub_246CE6E5C(std::runtime_error *this)
{
  this[1].__imp_.__imp_ = (const char *)&unk_26FB3E0D8;
  uint64_t v2 = this[2].__vftable;
  if (v2 && (*((unsigned int (**)(std::runtime_error_vtbl *))v2->~runtime_error + 4))(v2)) {
    this[2].__vftable = 0;
  }
  this->__vftable = (std::runtime_error_vtbl *)&unk_26FB3E088;
  uint64_t v3 = this[1].__vftable;
  if (v3) {
    (*((void (**)(std::runtime_error_vtbl *))v3->~runtime_error + 1))(v3);
  }
  std::runtime_error::~runtime_error(this);
  JUMPOUT(0x24C5471E0);
}

void sub_246CE6F4C(void *a1)
{
  *a1 = &unk_26FB3E0D8;
  uint64_t v2 = a1[1];
  if (v2 && (*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
    a1[1] = 0;
  }
  *(a1 - 3) = &unk_26FB3E088;
  uint64_t v3 = *(a1 - 1);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  std::runtime_error::~runtime_error((std::runtime_error *)(a1 - 3));
}

void sub_246CE7020(void *a1)
{
  *a1 = &unk_26FB3E0D8;
  uint64_t v2 = a1[1];
  if (v2 && (*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
    a1[1] = 0;
  }
  *(a1 - 3) = &unk_26FB3E088;
  uint64_t v3 = *(a1 - 1);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  std::runtime_error::~runtime_error((std::runtime_error *)(a1 - 3));
  JUMPOUT(0x24C5471E0);
}

void sub_246CE7118(std::runtime_error *this)
{
  this->__vftable = (std::runtime_error_vtbl *)&unk_26FB3E088;
  uint64_t v2 = this[1].__vftable;
  if (v2) {
    (*((void (**)(std::runtime_error_vtbl *))v2->~runtime_error + 1))(v2);
  }
  std::runtime_error::~runtime_error(this);
  JUMPOUT(0x24C5471E0);
}

void sub_246CE71AC(std::runtime_error *a1)
{
  std::runtime_error::~runtime_error(a1);
  JUMPOUT(0x24C5471E0);
}

uint64_t *sub_246CE71E4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (v2 && (*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
    *a1 = 0;
  }
  return a1;
}

uint64_t sub_246CE7240(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26FB3E058;
  std::runtime_error::runtime_error((std::runtime_error *)(a1 + 8), (const std::runtime_error *)(a2 + 8));
  *(void *)(a1 + 8) = &unk_26FB3E088;
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4) {
    uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 24))(v4);
  }
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = &unk_26FB3E0D8;
  *(void *)(a1 + 40) = v5;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
  }
  long long v6 = *(_OWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = v6;
  *(void *)a1 = &unk_26FB3DFE0;
  *(void *)(a1 + 8) = &unk_26FB3E010;
  *(void *)(a1 + 32) = &unk_26FB3E038;
  return a1;
}

void sub_246CE73A4(_Unwind_Exception *a1)
{
  *(void *)(v2 + 8) = v3;
  uint64_t v5 = *(void *)(v2 + 24);
  if (v5)
  {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
    std::runtime_error::~runtime_error(v1);
    _Unwind_Resume(a1);
  }
  std::runtime_error::~runtime_error(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_246CE73FC(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  uint64_t v4 = *(void *)(a2 + 8);
  if (!v4)
  {
    uint64_t v5 = 0;
    *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    uint64_t result = *(void *)(a1 + 8);
    if (!result) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v4 + 40))(&v7);
  uint64_t v5 = v7;
  uint64_t v8 = v7;
  if (v7)
  {
    (*(void (**)(uint64_t))(*(void *)v7 + 24))(v7);
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v7 + 32))(v7);
    }
  }
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t result = *(void *)(a1 + 8);
  if (result) {
LABEL_8:
  }
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 32))(result);
LABEL_9:
  *(void *)(a1 + 8) = v5;
  if (v5)
  {
    (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
    return (*(uint64_t (**)(uint64_t))(*(void *)v5 + 32))(v5);
  }
  return result;
}

void sub_246CE757C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void sub_246CE759C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_246CE71E4((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_246CE75B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_246CE71E4((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_246CE75C4(std::runtime_error *a1, const void **a2, uint64_t a3)
{
  int v3 = *((char *)a2 + 23);
  if (v3 >= 0) {
    size_t v4 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v4 = (size_t)a2[1];
  }
  unint64_t v5 = v4 + 2;
  if (v4 + 2 >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  if (v5 >= 0x17)
  {
    uint64_t v10 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17) {
      uint64_t v10 = v5 | 7;
    }
    uint64_t v11 = v10 + 1;
    p_dst = (std::string *)operator new(v10 + 1);
    __dst.__r_.__value_.__l.__size_ = v4 + 2;
    __dst.__r_.__value_.__r.__words[2] = v11 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    memset(&__dst, 0, sizeof(__dst));
    p_dst = &__dst;
    *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v4 + 2;
    if (!v4)
    {
      strcpy((char *)&__dst, " (");
      if ((*(char *)(a3 + 23) & 0x80000000) == 0)
      {
LABEL_8:
        *(_OWORD *)char v20 = *(_OWORD *)a3;
        uint64_t v21 = *(void *)(a3 + 16);
        goto LABEL_17;
      }
LABEL_16:
      sub_246CC5E50(v20, *(void **)a3, *(void *)(a3 + 8));
LABEL_17:
      if (v21 >= 0) {
        uint64_t v13 = v20;
      }
      else {
        uint64_t v13 = (void **)v20[0];
      }
      if (v21 >= 0) {
        std::string::size_type v14 = HIBYTE(v21);
      }
      else {
        std::string::size_type v14 = (std::string::size_type)v20[1];
      }
      uint64_t v15 = std::string::append(&__dst, (const std::string::value_type *)v13, v14);
      long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v23.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v23.__r_.__value_.__l.__data_ = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      long long v17 = std::string::append(&v23, ")", 1uLL);
      long long v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__r.__words[2] = v17->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v18;
      v17->__r_.__value_.__l.__size_ = 0;
      v17->__r_.__value_.__r.__words[2] = 0;
      v17->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v23.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v21) & 0x80000000) == 0)
        {
LABEL_25:
          if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_26;
          }
LABEL_31:
          operator delete(__dst.__r_.__value_.__l.__data_);
LABEL_26:
          std::runtime_error::runtime_error(a1, &__p);
          a1->__vftable = (std::runtime_error_vtbl *)&unk_26FB3E0B0;
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
          a1->__vftable = (std::runtime_error_vtbl *)&unk_26FB3E088;
          operator new();
        }
      }
      else if ((SHIBYTE(v21) & 0x80000000) == 0)
      {
        goto LABEL_25;
      }
      operator delete(v20[0]);
      if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_26;
      }
      goto LABEL_31;
    }
  }
  if (v3 >= 0) {
    uint64_t v12 = a2;
  }
  else {
    uint64_t v12 = *a2;
  }
  memmove(p_dst, v12, v4);
  strcpy((char *)p_dst + v4, " (");
  if ((*(char *)(a3 + 23) & 0x80000000) == 0) {
    goto LABEL_8;
  }
  goto LABEL_16;
}

void sub_246CE788C(_Unwind_Exception *a1)
{
  MEMORY[0x24C5471E0](v2, 0x1093C40E70F46F0);
  std::runtime_error::~runtime_error(v1);
  _Unwind_Resume(a1);
}

void sub_246CE78B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (a27 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_246CE7950(uint64_t result)
{
  uint64_t v1 = result;
  if (*(char *)(result + 31) < 0)
  {
    operator delete(*(void **)(result + 8));
    return v1;
  }
  return result;
}

void sub_246CE7994(uint64_t a1)
{
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  JUMPOUT(0x24C5471E0);
}

void *sub_246CE79E8()
{
  return &unk_26FB3E140;
}

void sub_246CE79F4()
{
}

void sub_246CE7ABC(_Unwind_Exception *a1)
{
  MEMORY[0x24C5471E0](v1, 0x1093C40E70F46F0);
  _Unwind_Resume(a1);
}

const void **sub_246CE7AE0(uint64_t a1, const void **a2)
{
  uint64_t v2 = (const void **)a1;
  unint64_t v3 = *(void *)(a1 + 56) & 0xFFFFFFFFFFFFFFFELL;
  if (!v3) {
    return v2;
  }
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    unint64_t v5 = a2;
  }
  else {
    unint64_t v5 = *a2;
  }
  if (v4 >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  uint64_t v7 = (const void **)a1;
  do
  {
    while (1)
    {
      uint64_t v8 = (const void **)(v3 - 56);
      int v9 = *(char *)(v3 - 33);
      uint64_t v10 = v9 >= 0 ? (const void *)(v3 - 56) : *(const void **)(v3 - 56);
      size_t v11 = v9 >= 0 ? *(unsigned __int8 *)(v3 - 33) : *(void *)(v3 - 48);
      size_t v12 = v6 >= v11 ? v11 : v6;
      int v13 = memcmp(v10, v5, v12);
      if (v13) {
        break;
      }
      if (v11 < v6) {
        goto LABEL_10;
      }
LABEL_22:
      unint64_t v3 = *(void *)(v3 + 8);
      uint64_t v7 = v8;
      if (!v3) {
        goto LABEL_25;
      }
    }
    if ((v13 & 0x80000000) == 0) {
      goto LABEL_22;
    }
LABEL_10:
    unint64_t v3 = *(void *)(v3 + 16);
  }
  while (v3);
  uint64_t v8 = v7;
LABEL_25:
  if (v8 != v2)
  {
    int v14 = *((char *)v8 + 23);
    if (v14 >= 0) {
      uint64_t v15 = v8;
    }
    else {
      uint64_t v15 = *v8;
    }
    if (v14 >= 0) {
      size_t v16 = *((unsigned __int8 *)v8 + 23);
    }
    else {
      size_t v16 = (size_t)v8[1];
    }
    if (v16 >= v6) {
      size_t v17 = v6;
    }
    else {
      size_t v17 = v16;
    }
    int v18 = memcmp(v5, v15, v17);
    if (v18)
    {
      if ((v18 & 0x80000000) == 0) {
        return v8;
      }
    }
    else if (v6 >= v16)
    {
      return v8;
    }
  }
  return v2;
}

void sub_246CE7BEC(const std::runtime_error *a1, int8x16_t *a2)
{
  exception = __cxa_allocate_exception(0x48uLL);
  sub_246CE7D5C((uint64_t)exception, a1, a2);
  __cxa_throw(exception, (struct type_info *)&unk_26FB3E168, (void (*)(void *))sub_246CE7E88);
}

void sub_246CE7C40(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::runtime_error *sub_246CE7C54(std::runtime_error *a1, const std::string *a2, uint64_t *a3)
{
  std::runtime_error::runtime_error(a1, a2)->__vftable = (std::runtime_error_vtbl *)&unk_26FB3E238;
  uint64_t v5 = *a3;
  if (*a3) {
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 24))(v5);
  }
  a1[1].__vftable = (std::runtime_error_vtbl *)v5;
  return a1;
}

void sub_246CE7CCC(_Unwind_Exception *a1)
{
  std::runtime_error::~runtime_error(v1);
  _Unwind_Resume(a1);
}

void sub_246CE7CE0(std::runtime_error *this)
{
  this->__vftable = (std::runtime_error_vtbl *)&unk_26FB3E238;
  uint64_t v2 = this[1].__vftable;
  if (v2) {
    (*((void (**)(std::runtime_error_vtbl *))v2->~runtime_error + 1))(v2);
  }
  std::runtime_error::~runtime_error(this);
}

uint64_t sub_246CE7D5C(uint64_t a1, const std::runtime_error *a2, int8x16_t *a3)
{
  *(void *)a1 = &unk_26FB3E058;
  std::runtime_error::runtime_error((std::runtime_error *)(a1 + 8), a2);
  *(void *)(a1 + 8) = &unk_26FB3E238;
  uint64_t v6 = (uint64_t)a2[1].__vftable;
  if (v6) {
    uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 24))(v6);
  }
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)a1 = &unk_26FB3E1C0;
  *(void *)(a1 + 8) = &unk_26FB3E1F0;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = &unk_26FB3E218;
  *(_DWORD *)(a1 + 64) = a3[1].i32[0];
  *(int8x16_t *)(a1 + 48) = vextq_s8(*a3, *a3, 8uLL);
  return a1;
}

void sub_246CE7E74(_Unwind_Exception *a1)
{
  std::runtime_error::~runtime_error(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_246CE7E88(uint64_t a1)
{
  *(void *)(a1 + 32) = &unk_26FB3E0D8;
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 && (*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
    *(void *)(a1 + 40) = 0;
  }
  *(void *)(a1 + 8) = &unk_26FB3E238;
  uint64_t v3 = *(void *)(a1 + 24);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  std::runtime_error::~runtime_error((std::runtime_error *)(a1 + 8));
  return a1;
}

void sub_246CE7F58()
{
}

void sub_246CE80E0(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v3;
  uint64_t v5 = *(void *)(v1 + 24);
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  std::runtime_error::~runtime_error(v2);
  MEMORY[0x24C5471E0](v1, 0x10F1C403FF34BC6);
  _Unwind_Resume(a1);
}

void sub_246CE8144(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 24))(v1);
  _Unwind_Resume(a1);
}

void sub_246CE8178(uint64_t a1)
{
  exception = __cxa_allocate_exception(0x48uLL);
  sub_246CE86DC((uint64_t)exception, a1);
  __cxa_throw(exception, (struct type_info *)&unk_26FB3E168, (void (*)(void *))sub_246CE7E88);
}

void sub_246CE81C0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_246CE81D4(uint64_t a1)
{
  *(void *)(a1 + 32) = &unk_26FB3E0D8;
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 && (*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
    *(void *)(a1 + 40) = 0;
  }
  *(void *)(a1 + 8) = &unk_26FB3E238;
  uint64_t v3 = *(void *)(a1 + 24);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  std::runtime_error::~runtime_error((std::runtime_error *)(a1 + 8));
  JUMPOUT(0x24C5471E0);
}

void sub_246CE82C4(std::runtime_error *this)
{
  this[1].__imp_.__imp_ = (const char *)&unk_26FB3E0D8;
  uint64_t v2 = this[2].__vftable;
  if (v2 && (*((unsigned int (**)(std::runtime_error_vtbl *))v2->~runtime_error + 4))(v2)) {
    this[2].__vftable = 0;
  }
  this->__vftable = (std::runtime_error_vtbl *)&unk_26FB3E238;
  uint64_t v3 = this[1].__vftable;
  if (v3) {
    (*((void (**)(std::runtime_error_vtbl *))v3->~runtime_error + 1))(v3);
  }
  std::runtime_error::~runtime_error(this);
}

void sub_246CE8398(std::runtime_error *this)
{
  this[1].__imp_.__imp_ = (const char *)&unk_26FB3E0D8;
  uint64_t v2 = this[2].__vftable;
  if (v2 && (*((unsigned int (**)(std::runtime_error_vtbl *))v2->~runtime_error + 4))(v2)) {
    this[2].__vftable = 0;
  }
  this->__vftable = (std::runtime_error_vtbl *)&unk_26FB3E238;
  uint64_t v3 = this[1].__vftable;
  if (v3) {
    (*((void (**)(std::runtime_error_vtbl *))v3->~runtime_error + 1))(v3);
  }
  std::runtime_error::~runtime_error(this);
  JUMPOUT(0x24C5471E0);
}

void sub_246CE8488(void *a1)
{
  *a1 = &unk_26FB3E0D8;
  uint64_t v2 = a1[1];
  if (v2 && (*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
    a1[1] = 0;
  }
  *(a1 - 3) = &unk_26FB3E238;
  uint64_t v3 = *(a1 - 1);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  std::runtime_error::~runtime_error((std::runtime_error *)(a1 - 3));
}

void sub_246CE855C(void *a1)
{
  *a1 = &unk_26FB3E0D8;
  uint64_t v2 = a1[1];
  if (v2 && (*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
    a1[1] = 0;
  }
  *(a1 - 3) = &unk_26FB3E238;
  uint64_t v3 = *(a1 - 1);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  std::runtime_error::~runtime_error((std::runtime_error *)(a1 - 3));
  JUMPOUT(0x24C5471E0);
}

void sub_246CE864C(std::runtime_error *this)
{
  this->__vftable = (std::runtime_error_vtbl *)&unk_26FB3E238;
  uint64_t v2 = this[1].__vftable;
  if (v2) {
    (*((void (**)(std::runtime_error_vtbl *))v2->~runtime_error + 1))(v2);
  }
  std::runtime_error::~runtime_error(this);
  JUMPOUT(0x24C5471E0);
}

uint64_t sub_246CE86DC(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26FB3E058;
  std::runtime_error::runtime_error((std::runtime_error *)(a1 + 8), (const std::runtime_error *)(a2 + 8));
  *(void *)(a1 + 8) = &unk_26FB3E238;
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4) {
    uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 24))(v4);
  }
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = &unk_26FB3E0D8;
  *(void *)(a1 + 40) = v5;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
  }
  long long v6 = *(_OWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = v6;
  *(void *)a1 = &unk_26FB3E1C0;
  *(void *)(a1 + 8) = &unk_26FB3E1F0;
  *(void *)(a1 + 32) = &unk_26FB3E218;
  return a1;
}

void sub_246CE8840(_Unwind_Exception *a1)
{
  *(void *)(v2 + 8) = v3;
  uint64_t v5 = *(void *)(v2 + 24);
  if (v5)
  {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
    std::runtime_error::~runtime_error(v1);
    _Unwind_Resume(a1);
  }
  std::runtime_error::~runtime_error(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_246CE8898(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned char **)(a2 + 32);
  if (*(char *)(a2 + 23) < 0)
  {
    uint64_t v8 = *(void *)a2;
    uint64_t v5 = *(void *)(a2 + 8);
    long long v6 = (unsigned char *)(*(void *)a2 + v5);
    size_t v7 = v6 - v4;
  }
  else
  {
    uint64_t v5 = *(unsigned __int8 *)(a2 + 23);
    long long v6 = (unsigned char *)(a2 + v5);
    size_t v7 = a2 + v5 - (void)v4;
    uint64_t v8 = a2;
  }
  int v9 = memchr(v4, *(char *)(a2 + 24), v7);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = v6;
  }
  if (v10 != (void *)(v8 + v5))
  {
    sub_246CE64A4((uint64_t)&v14, (uint64_t *)a2);
    uint64_t v11 = *(void *)(*(void *)(a1 + 24) + 8);
    size_t v12 = sub_246CE7AE0(v11, (const void **)&v14);
    if ((const void **)v11 == v12) {
      operator new();
    }
    a1 = sub_246CE8898(v12 + 3, a2);
    if (v15 < 0) {
      operator delete((void *)v14);
    }
  }
  return a1;
}

void sub_246CE8BC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  sub_246CD9AA4((uint64_t)&a9);
  if (*(char *)(v24 - 57) < 0) {
    operator delete(*(void **)(v24 - 80));
  }
  _Unwind_Resume(a1);
}

void sub_246CE8C7C(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v5 = *(void *)(*(void *)(a1 - 8) + 56) & 0xFFFFFFFFFFFFFFFELL;
  if (!v5)
  {
    size_t v16 = operator new(0x60uLL);
    *a3 = v16;
    if (*(char *)(a2 + 23) < 0) {
      goto LABEL_26;
    }
LABEL_24:
    *(_OWORD *)size_t v16 = *(_OWORD *)a2;
    v16[2] = *(void *)(a2 + 16);
LABEL_27:
    sub_246CDA2BC(v16 + 3, (long long *)(a2 + 24));
  }
  int v6 = *(char *)(a2 + 23);
  if (v6 >= 0) {
    size_t v7 = (const void *)a2;
  }
  else {
    size_t v7 = *(const void **)a2;
  }
  if (v6 >= 0) {
    size_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v8 = *(void *)(a2 + 8);
  }
  while (1)
  {
    unint64_t v10 = v5 - 56;
    int v9 = *(const void **)(v5 - 56);
    int v11 = *(char *)(v10 + 23);
    if (v11 >= 0) {
      size_t v12 = (const void *)v10;
    }
    else {
      size_t v12 = v9;
    }
    if (v11 >= 0) {
      size_t v13 = *(unsigned __int8 *)(v10 + 23);
    }
    else {
      size_t v13 = *(void *)(v10 + 8);
    }
    if (v13 >= v8) {
      size_t v14 = v8;
    }
    else {
      size_t v14 = v13;
    }
    int v15 = memcmp(v7, v12, v14);
    if (v15)
    {
      if (v15 < 0) {
        goto LABEL_22;
      }
LABEL_8:
      unint64_t v5 = *(void *)(v10 + 72);
      if (!v5) {
        goto LABEL_23;
      }
    }
    else
    {
      if (v8 >= v13) {
        goto LABEL_8;
      }
LABEL_22:
      unint64_t v5 = *(void *)(v10 + 64);
      if (!v5)
      {
LABEL_23:
        size_t v16 = operator new(0x60uLL);
        *a3 = v16;
        if ((*(char *)(a2 + 23) & 0x80000000) == 0) {
          goto LABEL_24;
        }
LABEL_26:
        sub_246CC5E50(v16, *(void **)a2, *(void *)(a2 + 8));
        goto LABEL_27;
      }
    }
  }
}

void sub_246CE91C8(void *a1)
{
  __cxa_begin_catch(a1);
  operator delete(*v1);
  __cxa_rethrow();
}

void sub_246CE91FC(_Unwind_Exception *a1)
{
}

void sub_246CE9210(uint64_t a1, const std::locale *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  sub_246CE58A0((uint64_t)&v22);
  uint64_t v4 = (std::ios_base *)((char *)&v22 + (unint64_t)v22.__vftable[-1].~runtime_error);
  std::ios_base::getloc(v4);
  std::ios_base::imbue(v4, a2);
  std::locale::~locale((std::locale *)&__dst);
  rdbuf = (std::locale *)v4->__rdbuf_;
  if (rdbuf)
  {
    (*((void (**)(std::locale *, const std::locale *))rdbuf->__locale_ + 2))(rdbuf, a2);
    int v6 = rdbuf + 1;
    std::locale::locale((std::locale *)&v20, v6);
    std::locale::operator=(v6, a2);
    std::locale::~locale((std::locale *)&v20);
  }
  std::locale::~locale((std::locale *)&v19);
  sub_246CC7924(&v22, (uint64_t)"Background", 10);
  int v7 = *(_DWORD *)&v24[(unint64_t)v22.__vftable[-1].~runtime_error] & 5;
  if (v7)
  {
    char v33 = 0;
    goto LABEL_19;
  }
  if ((v31 & 0x10) != 0)
  {
    unint64_t v10 = v30;
    if (v30 < v27)
    {
      unint64_t v30 = v27;
      unint64_t v10 = v27;
    }
    int v11 = v26;
    std::string::size_type v8 = v10 - (void)v26;
    if (v10 - (unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_39;
    }
  }
  else
  {
    if ((v31 & 8) == 0)
    {
      std::string::size_type v8 = 0;
      *((unsigned char *)&__dst.__r_.__value_.__s + 23) = 0;
      p_dst = &__dst;
      goto LABEL_18;
    }
    int v11 = v23;
    std::string::size_type v8 = v25 - (void)v23;
    if ((unint64_t)(v25 - (void)v23) >= 0x7FFFFFFFFFFFFFF8) {
LABEL_39:
    }
      sub_246CC5D0C();
  }
  if (v8 >= 0x17)
  {
    uint64_t v12 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v12 = v8 | 7;
    }
    uint64_t v13 = v12 + 1;
    p_dst = (std::string *)operator new(v12 + 1);
    __dst.__r_.__value_.__l.__size_ = v8;
    __dst.__r_.__value_.__r.__words[2] = v13 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v8;
    p_dst = &__dst;
    if (!v8) {
      goto LABEL_18;
    }
  }
  memmove(p_dst, v11, v8);
LABEL_18:
  p_dst->__r_.__value_.__s.__data_[v8] = 0;
  std::string v34 = __dst;
  char v33 = 1;
LABEL_19:
  v22.__vftable = (std::runtime_error_vtbl *)*MEMORY[0x263F8C2C8];
  *(std::runtime_error_vtbl **)((char *)&v22.__vftable + (unint64_t)v22.__vftable[-1].~runtime_error) = *(std::runtime_error_vtbl **)(MEMORY[0x263F8C2C8] + 24);
  v22.__imp_.__imp_ = (const char *)(MEMORY[0x263F8C318] + 16);
  if (v29 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x24C547150](&v32);
  if (v7)
  {
    sub_246CC5444(&v19, "conversion of type \"");
    sub_246CCB99C((char *)(0x8000000246D20665 & 0x7FFFFFFFFFFFFFFFLL), &v19, &v20);
    sub_246CCB99C("\" to data failed", &v20, &__dst);
    uint64_t v18 = 0;
    sub_246CE7C54(&v22, &__dst, &v18);
    v16.i64[0] = (uint64_t)"/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/"
                          "Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/lo"
                          "cal/include/boost/property_tree/detail/ptree_implementation.hpp";
    v16.i64[1] = (uint64_t)"void boost::property_tree::basic_ptree<std::string, std::string>::put_value(const Type &, Tran"
                          "slator) [Key = std::string, Data = std::string, KeyCompare = std::less<std::string>, Type = ch"
                          "ar[11], Translator = boost::property_tree::stream_translator<char, std::char_traits<char>, std"
                          "::allocator<char>, char[11]>]";
    uint64_t v17 = 828;
    sub_246CE7BEC(&v22, &v16);
  }
  if (&v34 == (std::string *)a1) {
    goto LABEL_35;
  }
  if (*(char *)(a1 + 23) < 0)
  {
    size_t v14 = (v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &v34
        : (std::string *)v34.__r_.__value_.__r.__words[0];
    size_t v15 = (v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? HIBYTE(v34.__r_.__value_.__r.__words[2])
        : v34.__r_.__value_.__l.__size_;
    sub_246CC654C((void **)a1, v14, v15);
  }
  else if ((*((unsigned char *)&v34.__r_.__value_.__s + 23) & 0x80) != 0)
  {
    sub_246CC6484((void *)a1, v34.__r_.__value_.__l.__data_, v34.__r_.__value_.__l.__size_);
  }
  else
  {
    *(std::string *)a1 = v34;
  }
  if (v33)
  {
LABEL_35:
    if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v34.__r_.__value_.__l.__data_);
    }
  }
}

void sub_246CE963C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,std::runtime_error a32)
{
  if (a31 < 0)
  {
    operator delete(__p);
    if ((a25 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a19 & 0x80000000) == 0) {
LABEL_8:
      }
        _Unwind_Resume(a1);
LABEL_7:
      operator delete(a14);
      _Unwind_Resume(a1);
    }
  }
  else if ((a25 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a20);
  if ((a19 & 0x80000000) == 0) {
    goto LABEL_8;
  }
  goto LABEL_7;
}

void sub_246CE9704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::locale a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
}

void sub_246CE9720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  sub_246CE5A44((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_246CE9734(uint64_t a1, const char *a2, const std::locale *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  sub_246CE58A0((uint64_t)&v25);
  int v6 = (std::ios_base *)((char *)&v25 + (unint64_t)v25.__vftable[-1].~runtime_error);
  std::ios_base::getloc(v6);
  std::ios_base::imbue(v6, a3);
  std::locale::~locale((std::locale *)&__dst);
  rdbuf = (std::locale *)v6->__rdbuf_;
  if (rdbuf)
  {
    (*((void (**)(std::locale *, const std::locale *))rdbuf->__locale_ + 2))(rdbuf, a3);
    std::string::size_type v8 = rdbuf + 1;
    std::locale::locale((std::locale *)&v23, v8);
    std::locale::operator=(v8, a3);
    std::locale::~locale((std::locale *)&v23);
  }
  std::locale::~locale((std::locale *)&v22);
  size_t v9 = strlen(a2);
  sub_246CC7924(&v25, (uint64_t)a2, v9);
  int v10 = *(_DWORD *)&v27[(unint64_t)v25.__vftable[-1].~runtime_error] & 5;
  if (v10)
  {
    char v36 = 0;
    goto LABEL_19;
  }
  if ((v34 & 0x10) != 0)
  {
    unint64_t v13 = v33;
    if (v33 < v30)
    {
      unint64_t v33 = v30;
      unint64_t v13 = v30;
    }
    size_t v14 = v29;
    std::string::size_type v11 = v13 - (void)v29;
    if (v13 - (unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_39;
    }
  }
  else
  {
    if ((v34 & 8) == 0)
    {
      std::string::size_type v11 = 0;
      *((unsigned char *)&__dst.__r_.__value_.__s + 23) = 0;
      p_dst = &__dst;
      goto LABEL_18;
    }
    size_t v14 = v26;
    std::string::size_type v11 = v28 - (void)v26;
    if ((unint64_t)(v28 - (void)v26) >= 0x7FFFFFFFFFFFFFF8) {
LABEL_39:
    }
      sub_246CC5D0C();
  }
  if (v11 >= 0x17)
  {
    uint64_t v15 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17) {
      uint64_t v15 = v11 | 7;
    }
    uint64_t v16 = v15 + 1;
    p_dst = (std::string *)operator new(v15 + 1);
    __dst.__r_.__value_.__l.__size_ = v11;
    __dst.__r_.__value_.__r.__words[2] = v16 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v11;
    p_dst = &__dst;
    if (!v11) {
      goto LABEL_18;
    }
  }
  memmove(p_dst, v14, v11);
LABEL_18:
  p_dst->__r_.__value_.__s.__data_[v11] = 0;
  std::string v37 = __dst;
  char v36 = 1;
LABEL_19:
  v25.__vftable = (std::runtime_error_vtbl *)*MEMORY[0x263F8C2C8];
  *(std::runtime_error_vtbl **)((char *)&v25.__vftable + (unint64_t)v25.__vftable[-1].~runtime_error) = *(std::runtime_error_vtbl **)(MEMORY[0x263F8C2C8] + 24);
  v25.__imp_.__imp_ = (const char *)(MEMORY[0x263F8C318] + 16);
  if (v32 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x24C547150](&v35);
  if (v10)
  {
    sub_246CC5444(&v22, "conversion of type \"");
    sub_246CCB99C((char *)(0x8000000246D2066BLL & 0x7FFFFFFFFFFFFFFFLL), &v22, &v23);
    sub_246CCB99C("\" to data failed", &v23, &__dst);
    uint64_t v21 = 0;
    sub_246CE7C54(&v25, &__dst, &v21);
    v19.i64[0] = (uint64_t)"/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/"
                          "Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/lo"
                          "cal/include/boost/property_tree/detail/ptree_implementation.hpp";
    v19.i64[1] = (uint64_t)"void boost::property_tree::basic_ptree<std::string, std::string>::put_value(const Type &, Tran"
                          "slator) [Key = std::string, Data = std::string, KeyCompare = std::less<std::string>, Type = ch"
                          "ar[2], Translator = boost::property_tree::stream_translator<char, std::char_traits<char>, std:"
                          ":allocator<char>, char[2]>]";
    uint64_t v20 = 828;
    sub_246CE7BEC(&v25, &v19);
  }
  if (&v37 == (std::string *)a1) {
    goto LABEL_35;
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v17 = (v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &v37
        : (std::string *)v37.__r_.__value_.__r.__words[0];
    size_t v18 = (v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? HIBYTE(v37.__r_.__value_.__r.__words[2])
        : v37.__r_.__value_.__l.__size_;
    sub_246CC654C((void **)a1, v17, v18);
  }
  else if ((*((unsigned char *)&v37.__r_.__value_.__s + 23) & 0x80) != 0)
  {
    sub_246CC6484((void *)a1, v37.__r_.__value_.__l.__data_, v37.__r_.__value_.__l.__size_);
  }
  else
  {
    *(std::string *)a1 = v37;
  }
  if (v36)
  {
LABEL_35:
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v37.__r_.__value_.__l.__data_);
    }
  }
}

void sub_246CE9B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,std::runtime_error a32)
{
  if (a31 < 0)
  {
    operator delete(__p);
    if ((a25 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a19 & 0x80000000) == 0) {
LABEL_8:
      }
        _Unwind_Resume(a1);
LABEL_7:
      operator delete(a14);
      _Unwind_Resume(a1);
    }
  }
  else if ((a25 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a20);
  if ((a19 & 0x80000000) == 0) {
    goto LABEL_8;
  }
  goto LABEL_7;
}

void sub_246CE9C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::locale a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
}

void sub_246CE9C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  sub_246CE5A44((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_246CE9C60(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = a1;
  unint64_t v4 = *(void *)(a2 + 24);
  unint64_t v5 = *(void **)(a2 + 8);
  unint64_t v6 = *(void *)(a1 + 8);
  if (v4)
  {
    if (v4 >> 60) {
      sub_246CC29A0();
    }
    int v7 = (__n128 *)operator new(16 * v4);
  }
  else
  {
    int v7 = 0;
  }
  unint64_t v83 = v6;
  char v84 = 0;
  uint64_t v8 = v5[11];
  if (v8) {
    unint64_t v9 = v8 - 80;
  }
  else {
    unint64_t v9 = 0;
  }
  if ((void *)v9 == v5)
  {
    uint64_t v20 = v3 + 16;
    int8x16_t v19 = v5;
    do
    {
LABEL_36:
      uint64_t v31 = v19[11];
      if (v31) {
        int8x16_t v19 = (void *)(v31 - 80);
      }
      else {
        int8x16_t v19 = 0;
      }
      if (v5 == v19) {
        char v32 = &v83;
      }
      else {
        char v32 = &v7->n128_u64[1];
      }
      unint64_t v33 = *v32;
      *(void *)(v6 + 88) = v33 + 80;
      *(void *)(v33 + 80) = v6 + 80;
      unint64_t v6 = v33;
    }
    while (v19 != *(void **)(v2 + 8));
    uint64_t v21 = 0;
    goto LABEL_44;
  }
  uint64_t v80 = v2;
  uint64_t v81 = v3;
  uint64_t v10 = 0;
  unint64_t v11 = 126 - 2 * __clz(v4);
  if (v4) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = 1;
  do
  {
    v7[v10].n128_u64[0] = v9;
    uint64_t v15 = operator new(0x60uLL);
    uint64_t v16 = v15;
    v7[v10].n128_u64[1] = (unint64_t)v15;
    if (*(char *)(v9 + 23) < 0)
    {
      sub_246CC5E50(v15, *(void **)v9, *(void *)(v9 + 8));
    }
    else
    {
      long long v17 = *(_OWORD *)v9;
      v15[2] = *(void *)(v9 + 16);
      *(_OWORD *)uint64_t v15 = v17;
    }
    sub_246CDA2BC(v16 + 3);
    uint64_t v82 = v13;
    if (v4 == v13) {
      sub_246CEA24C(v7, &v7[v4], v12, 1, v18);
    }
    uint64_t v14 = *(void *)(v9 + 88);
    if (v14) {
      unint64_t v9 = v14 - 80;
    }
    else {
      unint64_t v9 = 0;
    }
    ++v13;
    ++v10;
  }
  while ((void *)v9 != v5);
  uint64_t v2 = v80;
  uint64_t v3 = v81;
  int8x16_t v19 = *(void **)(v80 + 8);
  unint64_t v6 = *(void *)(v81 + 8);
  uint64_t v20 = v81 + 16;
  uint64_t v21 = v82;
  if (!v82) {
    goto LABEL_36;
  }
  do
  {
    uint64_t v23 = v19[11];
    if (v23) {
      int8x16_t v19 = (void *)(v23 - 80);
    }
    else {
      int8x16_t v19 = 0;
    }
    uint64_t v24 = &v83;
    if (v5 != v19)
    {
      std::runtime_error v25 = v7;
      unint64_t v26 = v82;
      do
      {
        unint64_t v27 = v26 >> 1;
        uint64_t v28 = &v25[v26 >> 1];
        unint64_t v30 = v28->n128_u64[0];
        char v29 = v28 + 1;
        v26 += ~(v26 >> 1);
        if (v30 < (unint64_t)v19) {
          std::runtime_error v25 = v29;
        }
        else {
          unint64_t v26 = v27;
        }
      }
      while (v26);
      uint64_t v24 = &v25->n128_u64[1];
    }
    unint64_t v22 = *v24;
    *(void *)(v6 + 88) = v22 + 80;
    *(void *)(v22 + 80) = v6 + 80;
    unint64_t v6 = v22;
  }
  while (v19 != *(void **)(v80 + 8));
LABEL_44:
  unint64_t v34 = v19[7];
  uint64_t v35 = *(void *)(v20 - 8);
  char v36 = (unint64_t *)(v35 + 56);
  if (v34 <= 1)
  {
    *(void *)(v35 + 56) = 0;
    *(void *)(v35 + 64) = v36;
    *(void *)(*(void *)(v20 - 8) + 72) = *(void *)(v20 - 8) + 56;
    goto LABEL_108;
  }
  *char v36 = *v36 & 0xFFFFFFFFFFFFFFFELL | v19[7] & 1;
  uint64_t v37 = v19[7];
  unint64_t v38 = v34 & 1;
  if ((v37 & 0xFFFFFFFFFFFFFFFELL) != 0) {
    unint64_t v39 = (v37 & 0xFFFFFFFFFFFFFFFELL) - 56;
  }
  else {
    unint64_t v39 = 0;
  }
  int v40 = &v83;
  if (v5 != (void *)v39)
  {
    if (v21)
    {
      unint64_t v41 = v7;
      unint64_t v42 = v21;
      do
      {
        unint64_t v43 = v42 >> 1;
        uint64_t v44 = &v41[v42 >> 1];
        unint64_t v46 = v44->n128_u64[0];
        std::string::size_type v45 = v44 + 1;
        v42 += ~(v42 >> 1);
        if (v46 < v39) {
          unint64_t v41 = v45;
        }
        else {
          unint64_t v42 = v43;
        }
      }
      while (v42);
    }
    else
    {
      unint64_t v41 = v7;
    }
    int v40 = &v41->n128_u64[1];
  }
  *char v36 = v38 | (*v40 + 56);
  uint64_t v47 = v19[8];
  if (v47) {
    std::string v48 = (void *)(v47 - 56);
  }
  else {
    std::string v48 = 0;
  }
  unint64_t v49 = &v83;
  if (v5 != v48)
  {
    if (v21)
    {
      __int16 v50 = v7;
      unint64_t v51 = v21;
      do
      {
        unint64_t v52 = v51 >> 1;
        unsigned __int8 v53 = &v50[v51 >> 1];
        unint64_t v55 = v53->n128_u64[0];
        char v54 = v53 + 1;
        v51 += ~(v51 >> 1);
        if (v55 < (unint64_t)v48) {
          __int16 v50 = v54;
        }
        else {
          unint64_t v51 = v52;
        }
      }
      while (v51);
    }
    else
    {
      __int16 v50 = v7;
    }
    unint64_t v49 = &v50->n128_u64[1];
  }
  *(void *)(v35 + 64) = *v49 + 56;
  uint64_t v56 = *(void *)(*(void *)(v2 + 8) + 72);
  if (v56) {
    uint64_t v57 = (void *)(v56 - 56);
  }
  else {
    uint64_t v57 = 0;
  }
  uint64_t v58 = &v83;
  if (v5 != v57)
  {
    if (v21)
    {
      char v59 = v7;
      unint64_t v60 = v21;
      do
      {
        unint64_t v61 = v60 >> 1;
        uint64_t v62 = &v59[v60 >> 1];
        unint64_t v64 = v62->n128_u64[0];
        unint64_t v63 = v62 + 1;
        v60 += ~(v60 >> 1);
        if (v64 < (unint64_t)v57) {
          char v59 = v63;
        }
        else {
          unint64_t v60 = v61;
        }
      }
      while (v60);
    }
    else
    {
      char v59 = v7;
    }
    uint64_t v58 = &v59->n128_u64[1];
  }
  *(void *)(*(void *)(v20 - 8) + 72) = *v58 + 56;
  if (v21)
  {
    for (uint64_t i = v7; i != &v7[v21]; ++i)
    {
      unint64_t v67 = i->n128_u64[0];
      uint64_t v66 = (void *)i->n128_u64[1];
      unint64_t v68 = (void *)(i->n128_u64[0] + 56);
      std::string v69 = v66 + 7;
      uint64_t v70 = *v68 & 1;
      v66[7] = v66[7] & 0xFFFFFFFFFFFFFFFELL | v70;
      unint64_t v71 = *v68 & 0xFFFFFFFFFFFFFFFELL;
      if (v71)
      {
        unint64_t v72 = &v83;
        if (v5 != (void *)(v71 - 56))
        {
          unint64_t v73 = v7;
          unint64_t v74 = v21;
          do
          {
            unint64_t v75 = v74 >> 1;
            n128_u64 = v73[v74 >> 1].n128_u64;
            unint64_t v78 = *n128_u64;
            unint64_t v77 = (__n128 *)(n128_u64 + 2);
            v74 += ~(v74 >> 1);
            if (v78 < v71 - 56) {
              unint64_t v73 = v77;
            }
            else {
              unint64_t v74 = v75;
            }
          }
          while (v74);
          unint64_t v72 = &v73->n128_u64[1];
        }
        unint64_t v79 = *v72;
        *std::string v69 = v70 | (*v72 + 56);
        if (*(void **)(v71 + 8) == v68)
        {
          *(void *)(v79 + 64) = v69;
          if (*(void *)(v67 + 64)) {
            goto LABEL_99;
          }
        }
        else if (*(void **)(v71 + 16) == v68)
        {
          *(void *)(v79 + 72) = v69;
          if (*(void *)(v67 + 64))
          {
LABEL_99:
            if (!*(void *)(v67 + 72)) {
              goto LABEL_107;
            }
            continue;
          }
        }
        else if (*(void *)(v67 + 64))
        {
          goto LABEL_99;
        }
      }
      else
      {
        *std::string v69 = v70;
        if (*(void *)(v67 + 64)) {
          goto LABEL_99;
        }
      }
      v66[8] = 0;
      if (!*(void *)(v67 + 72)) {
LABEL_107:
      }
        v66[9] = 0;
    }
  }
LABEL_108:
  *(void *)(v3 + 24) = *(void *)(v2 + 24);
  if (v4)
  {
    operator delete(v7);
  }
}

void sub_246CEA164(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  __cxa_begin_catch(a1);
  operator delete(*(void **)(v12 + v13 + 8));
  __cxa_rethrow();
}

void sub_246CEA1B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  __cxa_end_catch();
  sub_246CEA1CC((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_246CEA1CC(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 64) && *(void *)(a1 + 40))
  {
    unint64_t v2 = 0;
    uint64_t v3 = 8;
    do
    {
      sub_246CE5B48(*(void *)(*(void *)(a1 + 32) + v3));
      operator delete(*(void **)(*(void *)(a1 + 32) + v3));
      ++v2;
      v3 += 16;
    }
    while (v2 < *(void *)(a1 + 40));
  }
  if (*(void *)(a1 + 24)) {
    operator delete(*(void **)(a1 + 32));
  }
  return a1;
}

__n128 sub_246CEA24C(__n128 *a1, __n128 *a2, uint64_t a3, char a4, __n128 result)
{
LABEL_1:
  unint64_t v11 = a2 - 1;
  uint64_t v12 = a2 - 2;
  uint64_t v13 = a2 - 3;
  uint64_t v14 = a1;
  while (1)
  {
    a1 = v14;
    uint64_t v15 = (char *)a2 - (char *)v14;
    uint64_t v16 = a2 - v14;
    if (v6 || !v5)
    {
      switch(v16)
      {
        case 0:
        case 1:
          return result;
        case 2:
          unint64_t v65 = a2[-1].n128_u64[0];
          unint64_t v64 = a2 - 1;
          if (v65 >= v14->n128_u64[0]) {
            return result;
          }
          goto LABEL_102;
        case 3:
          uint64_t v66 = v14 + 1;
          unint64_t v67 = v14[1].n128_u64[0];
          unint64_t v69 = a2[-1].n128_u64[0];
          unint64_t v64 = a2 - 1;
          unint64_t v68 = v69;
          if (v67 < v14->n128_u64[0])
          {
            if (v68 >= v67)
            {
              __n128 v137 = *v14;
              *uint64_t v14 = *v66;
              uint64_t result = v137;
              __n128 *v66 = v137;
              if (v64->n128_u64[0] < v14[1].n128_u64[0])
              {
                uint64_t result = *v66;
                __n128 *v66 = *v64;
                *unint64_t v64 = result;
              }
            }
            else
            {
LABEL_102:
              __n128 v133 = *v14;
              *uint64_t v14 = *v64;
              uint64_t result = v133;
              *unint64_t v64 = v133;
            }
            return result;
          }
          if (v68 >= v67) {
            return result;
          }
          uint64_t result = *v66;
          __n128 *v66 = *v64;
          *unint64_t v64 = result;
          goto LABEL_185;
        case 4:
          uint64_t v66 = v14 + 1;
          unint64_t v70 = v14[1].n128_u64[0];
          unint64_t v71 = v14 + 2;
          unint64_t v72 = v14[2].n128_u64[0];
          if (v70 >= v14->n128_u64[0])
          {
            if (v72 < v70)
            {
              uint64_t result = *v66;
              __n128 *v66 = *v71;
              *unint64_t v71 = result;
              if (v14[1].n128_u64[0] < v14->n128_u64[0])
              {
                __n128 v136 = *v14;
                *uint64_t v14 = *v66;
                uint64_t result = v136;
                __n128 *v66 = v136;
              }
            }
          }
          else
          {
            if (v72 >= v70)
            {
              __n128 v138 = *v14;
              *uint64_t v14 = *v66;
              uint64_t result = v138;
              __n128 *v66 = v138;
              if (v72 >= v14[1].n128_u64[0]) {
                goto LABEL_182;
              }
              uint64_t result = *v66;
              __n128 *v66 = *v71;
            }
            else
            {
              __n128 v134 = *v14;
              *uint64_t v14 = *v71;
              uint64_t result = v134;
            }
            *unint64_t v71 = result;
          }
LABEL_182:
          if (v11->n128_u64[0] < v71->n128_u64[0])
          {
            uint64_t result = *v71;
            *unint64_t v71 = *v11;
            *unint64_t v11 = result;
            if (v71->n128_u64[0] < v66->n128_u64[0])
            {
              uint64_t result = *v66;
              __n128 *v66 = *v71;
              *unint64_t v71 = result;
LABEL_185:
              if (v14[1].n128_u64[0] < v14->n128_u64[0])
              {
                __n128 v139 = *v14;
                *uint64_t v14 = *v66;
                uint64_t result = v139;
                __n128 *v66 = v139;
              }
            }
          }
          break;
        case 5:
          result.n128_u64[0] = sub_246CEB1B0(v14, v14 + 1, v14[2].n128_u64, (__n128 *)v14[3].n128_u64, (__n128 *)a2[-1].n128_u64, result).n128_u64[0];
          return result;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v15 <= 383) {
      break;
    }
    if (!a3)
    {
      if (v14 == a2) {
        return result;
      }
      int64_t v84 = (unint64_t)(v16 - 2) >> 1;
      int64_t v85 = v84;
      while (1)
      {
        if (v84 >= v85)
        {
          uint64_t v87 = (2 * v85) | 1;
          unint64_t v88 = &v14[v87];
          if (2 * v85 + 2 >= v16)
          {
            unint64_t v91 = &v14[v85];
            unint64_t v92 = v91->n128_u64[0];
            if (v88->n128_u64[0] >= v91->n128_u64[0]) {
              goto LABEL_141;
            }
          }
          else
          {
            unint64_t v89 = v88[1].n128_u64[0];
            BOOL v90 = v88->n128_u64[0] >= v89;
            if (v88->n128_u64[0] < v89) {
              ++v88;
            }
            else {
              unint64_t v89 = v88->n128_u64[0];
            }
            if (!v90) {
              uint64_t v87 = 2 * v85 + 2;
            }
            unint64_t v91 = &v14[v85];
            unint64_t v92 = v91->n128_u64[0];
            if (v89 >= v91->n128_u64[0])
            {
LABEL_141:
              uint64_t v93 = v91->n128_i64[1];
              while (1)
              {
                unint64_t v95 = v91;
                unint64_t v91 = v88;
                *unint64_t v95 = *v88;
                if (v84 < v87) {
                  break;
                }
                uint64_t v96 = (2 * v87) | 1;
                unint64_t v88 = &v14[v96];
                uint64_t v87 = 2 * v87 + 2;
                if (v87 < v16)
                {
                  unint64_t v94 = v88->n128_u64[0];
                  if (v88->n128_u64[0] >= v88[1].n128_u64[0])
                  {
                    uint64_t v87 = v96;
                  }
                  else
                  {
                    unint64_t v94 = v88[1].n128_u64[0];
                    ++v88;
                  }
                  if (v94 < v92) {
                    break;
                  }
                }
                else
                {
                  uint64_t v87 = v96;
                  if (v88->n128_u64[0] < v92) {
                    break;
                  }
                }
              }
              v91->n128_u64[0] = v92;
              v91->n128_u64[1] = v93;
            }
          }
        }
        BOOL v86 = v85-- <= 0;
        if (v86)
        {
          uint64_t v97 = (unint64_t)v15 >> 4;
          do
          {
            uint64_t v98 = 0;
            __n128 v135 = *v14;
            char v99 = v14;
            do
            {
              unint64_t v100 = &v99[v98 + 1];
              uint64_t v101 = (2 * v98) | 1;
              uint64_t v102 = 2 * v98 + 2;
              if (v102 < v97 && v100->n128_u64[0] < v100[1].n128_u64[0])
              {
                ++v100;
                uint64_t v101 = v102;
              }
              *char v99 = *v100;
              char v99 = v100;
              uint64_t v98 = v101;
            }
            while (v101 <= (uint64_t)((unint64_t)(v97 - 2) >> 1));
            if (v100 == --a2)
            {
              uint64_t result = v135;
              *unint64_t v100 = v135;
            }
            else
            {
              *unint64_t v100 = *a2;
              uint64_t result = v135;
              *a2 = v135;
              uint64_t v103 = (char *)v100 - (char *)v14 + 16;
              if (v103 >= 17)
              {
                unint64_t v104 = (((unint64_t)v103 >> 4) - 2) >> 1;
                char v105 = &v14[v104];
                unint64_t v106 = v100->n128_u64[0];
                if (v105->n128_u64[0] < v100->n128_u64[0])
                {
                  unint64_t v107 = v100->n128_u64[1];
                  do
                  {
                    uint64_t v108 = v100;
                    unint64_t v100 = v105;
                    uint64_t result = *v105;
                    __n128 *v108 = *v105;
                    if (!v104) {
                      break;
                    }
                    unint64_t v104 = (v104 - 1) >> 1;
                    char v105 = &v14[v104];
                  }
                  while (v105->n128_u64[0] < v106);
                  v100->n128_u64[0] = v106;
                  v100->n128_u64[1] = v107;
                }
              }
            }
            BOOL v86 = v97-- <= 2;
          }
          while (!v86);
          return result;
        }
      }
    }
    unint64_t v17 = (unint64_t)v16 >> 1;
    __n128 v18 = &v14[(unint64_t)v16 >> 1];
    unint64_t v19 = v11->n128_u64[0];
    if ((unint64_t)v15 < 0x801)
    {
      unint64_t v21 = v14->n128_u64[0];
      if (v14->n128_u64[0] < v18->n128_u64[0])
      {
        if (v19 >= v21)
        {
          __n128 v122 = *v18;
          *__n128 v18 = *v14;
          uint64_t result = v122;
          *uint64_t v14 = v122;
          if (v11->n128_u64[0] >= v14->n128_u64[0]) {
            goto LABEL_32;
          }
          __n128 v115 = *v14;
          *uint64_t v14 = *v11;
        }
        else
        {
          __n128 v115 = *v18;
          *__n128 v18 = *v11;
        }
        uint64_t result = v115;
        *unint64_t v11 = v115;
LABEL_32:
        --a3;
        unint64_t v22 = v14->n128_u64[0];
        if (a4) {
          goto LABEL_57;
        }
        goto LABEL_56;
      }
      if (v19 >= v21) {
        goto LABEL_32;
      }
      __n128 v118 = *v14;
      *uint64_t v14 = *v11;
      uint64_t result = v118;
      *unint64_t v11 = v118;
      if (v14->n128_u64[0] >= v18->n128_u64[0]) {
        goto LABEL_32;
      }
      __n128 v119 = *v18;
      *__n128 v18 = *v14;
      uint64_t result = v119;
      *uint64_t v14 = v119;
      --a3;
      unint64_t v22 = v14->n128_u64[0];
      if (a4) {
        goto LABEL_57;
      }
LABEL_56:
      if (v14[-1].n128_u64[0] < v22) {
        goto LABEL_57;
      }
      if (v22 < v11->n128_u64[0])
      {
        do
        {
          unint64_t v56 = v14[1].n128_u64[0];
          ++v14;
        }
        while (v22 >= v56);
      }
      else
      {
        unint64_t n128_u64 = (unint64_t)v14[1].n128_u64;
        do
        {
          uint64_t v14 = (__n128 *)n128_u64;
          if (n128_u64 >= (unint64_t)a2) {
            break;
          }
          n128_u64 += 16;
        }
        while (v22 >= v14->n128_u64[0]);
      }
      uint64_t v58 = a2;
      if (v14 < a2)
      {
        uint64_t v58 = a2;
        do
        {
          unint64_t v59 = v58[-1].n128_u64[0];
          --v58;
        }
        while (v22 < v59);
      }
      unint64_t v60 = a1->n128_u64[1];
      while (v14 < v58)
      {
        __n128 v132 = *v14;
        *uint64_t v14 = *v58;
        uint64_t result = v132;
        *uint64_t v58 = v132;
        do
        {
          unint64_t v61 = v14[1].n128_u64[0];
          ++v14;
        }
        while (v22 >= v61);
        do
        {
          unint64_t v62 = v58[-1].n128_u64[0];
          --v58;
        }
        while (v22 < v62);
      }
      unint64_t v63 = v14 - 1;
      BOOL v5 = &v14[-1] >= a1;
      BOOL v6 = &v14[-1] == a1;
      if (&v14[-1] != a1)
      {
        uint64_t result = *v63;
        *a1 = *v63;
      }
      a4 = 0;
      v14[-1].n128_u64[0] = v22;
      v14[-1].n128_u64[1] = v60;
    }
    else
    {
      unint64_t v20 = v18->n128_u64[0];
      if (v18->n128_u64[0] >= v14->n128_u64[0])
      {
        if (v19 < v20)
        {
          __n128 v116 = *v18;
          *__n128 v18 = *v11;
          *unint64_t v11 = v116;
          if (v18->n128_u64[0] < v14->n128_u64[0])
          {
            __n128 v117 = *v14;
            *uint64_t v14 = *v18;
            *__n128 v18 = v117;
          }
        }
      }
      else
      {
        if (v19 >= v20)
        {
          __n128 v120 = *v14;
          *uint64_t v14 = *v18;
          *__n128 v18 = v120;
          if (v11->n128_u64[0] >= v18->n128_u64[0]) {
            goto LABEL_23;
          }
          __n128 v114 = *v18;
          *__n128 v18 = *v11;
        }
        else
        {
          __n128 v114 = *v14;
          *uint64_t v14 = *v11;
        }
        *unint64_t v11 = v114;
      }
LABEL_23:
      uint64_t v23 = v14 + 1;
      uint64_t v24 = &v14[v17];
      unint64_t v27 = v24[-1].n128_u64[0];
      std::runtime_error v25 = v24 - 1;
      unint64_t v26 = v27;
      unint64_t v28 = v12->n128_u64[0];
      if (v27 >= v14[1].n128_u64[0])
      {
        if (v28 < v26)
        {
          __n128 v121 = *v25;
          *std::runtime_error v25 = *v12;
          __n128 *v12 = v121;
          if (v25->n128_u64[0] < v23->n128_u64[0])
          {
            __n128 v30 = *v23;
            __n128 *v23 = *v25;
            *std::runtime_error v25 = v30;
          }
        }
      }
      else
      {
        if (v28 >= v26)
        {
          __n128 v31 = *v23;
          __n128 *v23 = *v25;
          *std::runtime_error v25 = v31;
          if (v12->n128_u64[0] >= v25->n128_u64[0]) {
            goto LABEL_37;
          }
          __n128 v123 = *v25;
          *std::runtime_error v25 = *v12;
          __n128 v29 = v123;
        }
        else
        {
          __n128 v29 = *v23;
          __n128 *v23 = *v12;
        }
        __n128 *v12 = v29;
      }
LABEL_37:
      char v32 = v14 + 2;
      unint64_t v33 = &v14[v17];
      unint64_t v36 = v33[1].n128_u64[0];
      unint64_t v34 = v33 + 1;
      unint64_t v35 = v36;
      unint64_t v37 = v13->n128_u64[0];
      if (v36 >= v14[2].n128_u64[0])
      {
        if (v37 < v35)
        {
          __n128 v124 = *v34;
          *unint64_t v34 = *v13;
          *uint64_t v13 = v124;
          if (v34->n128_u64[0] < v32->n128_u64[0])
          {
            __n128 v39 = *v32;
            __n128 *v32 = *v34;
            *unint64_t v34 = v39;
          }
        }
      }
      else
      {
        if (v37 >= v35)
        {
          __n128 v40 = *v32;
          __n128 *v32 = *v34;
          *unint64_t v34 = v40;
          if (v13->n128_u64[0] >= v34->n128_u64[0]) {
            goto LABEL_46;
          }
          __n128 v125 = *v34;
          *unint64_t v34 = *v13;
          __n128 v38 = v125;
        }
        else
        {
          __n128 v38 = *v32;
          __n128 *v32 = *v13;
        }
        *uint64_t v13 = v38;
      }
LABEL_46:
      unint64_t v41 = v18->n128_u64[0];
      unint64_t v42 = v34->n128_u64[0];
      if (v18->n128_u64[0] >= v25->n128_u64[0])
      {
        if (v42 < v41)
        {
          __n128 v127 = *v18;
          *__n128 v18 = *v34;
          *unint64_t v34 = v127;
          if (v18->n128_u64[0] < v25->n128_u64[0])
          {
            __n128 v128 = *v25;
            *std::runtime_error v25 = *v18;
            *__n128 v18 = v128;
          }
        }
      }
      else
      {
        if (v42 >= v41)
        {
          __n128 v129 = *v25;
          *std::runtime_error v25 = *v18;
          *__n128 v18 = v129;
          if (v34->n128_u64[0] >= v18->n128_u64[0]) {
            goto LABEL_55;
          }
          __n128 v126 = *v18;
          *__n128 v18 = *v34;
        }
        else
        {
          __n128 v126 = *v25;
          *std::runtime_error v25 = *v34;
        }
        *unint64_t v34 = v126;
      }
LABEL_55:
      __n128 v130 = *v14;
      *uint64_t v14 = *v18;
      uint64_t result = v130;
      *__n128 v18 = v130;
      --a3;
      unint64_t v22 = v14->n128_u64[0];
      if ((a4 & 1) == 0) {
        goto LABEL_56;
      }
LABEL_57:
      uint64_t v43 = 0;
      unint64_t v44 = v14->n128_u64[1];
      do
        unint64_t v45 = v14[++v43].n128_u64[0];
      while (v45 < v22);
      unint64_t v46 = &v14[v43];
      uint64_t v47 = a2;
      if (v43 == 1)
      {
        uint64_t v47 = a2;
        do
        {
          if (v46 >= v47) {
            break;
          }
          unint64_t v49 = v47[-1].n128_u64[0];
          --v47;
        }
        while (v49 >= v22);
      }
      else
      {
        do
        {
          unint64_t v48 = v47[-1].n128_u64[0];
          --v47;
        }
        while (v48 >= v22);
      }
      uint64_t v14 = (__n128 *)((char *)v14 + v43 * 16);
      if (v46 < v47)
      {
        __int16 v50 = v47;
        do
        {
          __n128 v131 = *v14;
          *uint64_t v14 = *v50;
          uint64_t result = v131;
          __n128 *v50 = v131;
          do
          {
            unint64_t v51 = v14[1].n128_u64[0];
            ++v14;
          }
          while (v51 < v22);
          do
          {
            unint64_t v52 = v50[-1].n128_u64[0];
            --v50;
          }
          while (v52 >= v22);
        }
        while (v14 < v50);
      }
      unsigned __int8 v53 = v14 - 1;
      if (&v14[-1] != a1)
      {
        uint64_t result = *v53;
        *a1 = *v53;
      }
      v14[-1].n128_u64[0] = v22;
      v14[-1].n128_u64[1] = v44;
      if (v46 < v47)
      {
LABEL_76:
        sub_246CEA24C(a1, &v14[-1], a3, a4 & 1);
        a4 = 0;
      }
      else
      {
        BOOL v54 = sub_246CEADDC(a1, v14 - 1, result);
        if (sub_246CEADDC(v14, a2, v55))
        {
          a2 = v14 - 1;
          if (v54) {
            return result;
          }
          goto LABEL_1;
        }
        if (!v54) {
          goto LABEL_76;
        }
      }
    }
  }
  unint64_t v73 = v14 + 1;
  BOOL v75 = v14 == a2 || v73 == a2;
  if (a4)
  {
    if (v75) {
      return result;
    }
    uint64_t v76 = 0;
    unint64_t v77 = v14;
    while (1)
    {
      unint64_t v79 = v73;
      unint64_t v80 = v77[1].n128_u64[0];
      if (v80 < v77->n128_u64[0])
      {
        uint64_t v81 = v77[1].n128_i64[1];
        uint64_t v82 = v76;
        do
        {
          uint64_t result = *(__n128 *)((char *)v14 + v82);
          *(__n128 *)((char *)v14 + v82 + 16) = result;
          if (!v82)
          {
            unint64_t v78 = v14;
            goto LABEL_119;
          }
          unint64_t v83 = *(unint64_t *)((char *)v14[-1].n128_u64 + v82);
          v82 -= 16;
        }
        while (v80 < v83);
        unint64_t v78 = (__n128 *)((char *)v14 + v82 + 16);
LABEL_119:
        v78->n128_u64[0] = v80;
        v78->n128_u64[1] = v81;
      }
      unint64_t v73 = v79 + 1;
      v76 += 16;
      unint64_t v77 = v79;
      if (&v79[1] == a2) {
        return result;
      }
    }
  }
  if (!v75)
  {
    do
    {
      unint64_t v109 = v73;
      unint64_t v110 = a1[1].n128_u64[0];
      if (v110 < a1->n128_u64[0])
      {
        unint64_t v111 = a1[1].n128_u64[1];
        uint64_t v112 = v109;
        do
        {
          uint64_t result = v112[-1];
          *uint64_t v112 = result;
          unint64_t v113 = v112[-2].n128_u64[0];
          --v112;
        }
        while (v110 < v113);
        v112->n128_u64[0] = v110;
        v112->n128_u64[1] = v111;
      }
      unint64_t v73 = v109 + 1;
      a1 = v109;
    }
    while (&v109[1] != a2);
  }
  return result;
}

BOOL sub_246CEADDC(__n128 *a1, __n128 *a2, __n128 a3)
{
  switch(a2 - a1)
  {
    case 0:
    case 1:
      return 1;
    case 2:
      unint64_t v11 = a2[-1].n128_u64[0];
      uint64_t v10 = a2 - 1;
      if (v11 < a1->n128_u64[0]) {
        goto LABEL_10;
      }
      return 1;
    case 3:
      uint64_t v12 = (long long *)&a1[1];
      unint64_t v13 = a1[1].n128_u64[0];
      unint64_t v15 = a2[-1].n128_u64[0];
      uint64_t v10 = a2 - 1;
      unint64_t v14 = v15;
      if (v13 >= a1->n128_u64[0])
      {
        if (v14 < v13)
        {
          long long v25 = *v12;
          long long *v12 = (__int128)*v10;
          __n128 *v10 = (__n128)v25;
          if (a1[1].n128_u64[0] < a1->n128_u64[0])
          {
LABEL_46:
            long long v41 = (__int128)*a1;
            *a1 = (__n128)*v12;
            long long *v12 = v41;
            return 1;
          }
        }
      }
      else
      {
        if (v14 < v13)
        {
LABEL_10:
          __n128 v16 = *a1;
          *a1 = *v10;
LABEL_11:
          __n128 *v10 = v16;
          return 1;
        }
        long long v37 = (__int128)*a1;
        *a1 = (__n128)*v12;
        long long *v12 = v37;
        if (v10->n128_u64[0] < a1[1].n128_u64[0])
        {
          __n128 v16 = (__n128)*v12;
          long long *v12 = (__int128)*v10;
          goto LABEL_11;
        }
      }
      return 1;
    case 4:
      uint64_t v12 = (long long *)&a1[1];
      unint64_t v17 = a1[1].n128_u64[0];
      __n128 v18 = (long long *)&a1[2];
      unint64_t v19 = a1[2].n128_u64[0];
      unint64_t v20 = a2 - 1;
      unint64_t v21 = a1->n128_u64[0];
      if (v17 >= a1->n128_u64[0])
      {
        if (v19 < v17)
        {
          long long v26 = *v12;
          long long *v12 = *v18;
          *__n128 v18 = v26;
          if (*(void *)v12 < v21)
          {
            long long v27 = (__int128)*a1;
            *a1 = (__n128)*v12;
            long long *v12 = v27;
          }
        }
      }
      else
      {
        if (v19 >= v17)
        {
          long long v38 = (__int128)*a1;
          *a1 = (__n128)*v12;
          long long *v12 = v38;
          if (v19 >= a1[1].n128_u64[0]) {
            goto LABEL_43;
          }
          long long v22 = *v12;
          long long *v12 = *v18;
        }
        else
        {
          long long v22 = (__int128)*a1;
          *a1 = (__n128)*v18;
        }
        *__n128 v18 = v22;
      }
LABEL_43:
      if (v20->n128_u64[0] < *(void *)v18)
      {
        __n128 v39 = (__n128)*v18;
        *__n128 v18 = (__int128)*v20;
        *unint64_t v20 = v39;
        if (*(void *)v18 < *(void *)v12)
        {
          long long v40 = *v12;
          long long *v12 = *v18;
          *__n128 v18 = v40;
          if (a1[1].n128_u64[0] < a1->n128_u64[0]) {
            goto LABEL_46;
          }
        }
      }
      return 1;
    case 5:
      sub_246CEB1B0(a1, a1 + 1, a1[2].n128_u64, (__n128 *)a1[3].n128_u64, (__n128 *)a2[-1].n128_u64, a3);
      return 1;
    default:
      unint64_t v4 = a1 + 2;
      unint64_t v5 = a1[2].n128_u64[0];
      BOOL v6 = a1 + 1;
      unint64_t v7 = a1[1].n128_u64[0];
      unint64_t v8 = a1->n128_u64[0];
      if (v7 >= a1->n128_u64[0])
      {
        if (v5 < v7)
        {
          __n128 v23 = *v6;
          __n128 *v6 = *v4;
          __n128 *v4 = v23;
          if (v6->n128_u64[0] < v8)
          {
            __n128 v24 = *a1;
            *a1 = *v6;
            __n128 *v6 = v24;
          }
        }
      }
      else
      {
        if (v5 >= v7)
        {
          __n128 v28 = *a1;
          *a1 = *v6;
          __n128 *v6 = v28;
          if (v5 >= a1[1].n128_u64[0]) {
            goto LABEL_28;
          }
          __n128 v9 = *v6;
          __n128 *v6 = *v4;
        }
        else
        {
          __n128 v9 = *a1;
          *a1 = *v4;
        }
        __n128 *v4 = v9;
      }
LABEL_28:
      __n128 v29 = a1 + 3;
      if (&a1[3] == a2) {
        return 1;
      }
      uint64_t v30 = 0;
      int v31 = 0;
      while (1)
      {
        unint64_t v32 = v29->n128_u64[0];
        if (v29->n128_u64[0] < v4->n128_u64[0]) {
          break;
        }
LABEL_31:
        unint64_t v4 = v29;
        v30 += 16;
        if (++v29 == a2) {
          return 1;
        }
      }
      uint64_t v33 = v29->n128_i64[1];
      uint64_t v34 = v30;
      do
      {
        *(__n128 *)((char *)a1 + v34 + 48) = *(__n128 *)((char *)a1 + v34 + 32);
        if (v34 == -32)
        {
          a1->n128_u64[0] = v32;
          a1->n128_u64[1] = v33;
          if (++v31 != 8) {
            goto LABEL_31;
          }
          return &v29[1] == a2;
        }
        unint64_t v35 = *(unint64_t *)((char *)a1[1].n128_u64 + v34);
        v34 -= 16;
      }
      while (v32 < v35);
      uint64_t v36 = (uint64_t)a1 + v34;
      *(void *)(v36 + 48) = v32;
      *(void *)(v36 + 56) = v33;
      if (++v31 != 8) {
        goto LABEL_31;
      }
      return &v29[1] == a2;
  }
}

__n128 sub_246CEB1B0(__n128 *a1, __n128 *a2, unint64_t *a3, _OWORD *a4, _OWORD *a5, __n128 result)
{
  unint64_t v6 = a2->n128_u64[0];
  unint64_t v7 = *a3;
  if (a2->n128_u64[0] >= a1->n128_u64[0])
  {
    if (v7 < v6)
    {
      uint64_t result = *a2;
      *a2 = *(__n128 *)a3;
      *(__n128 *)a3 = result;
      if (a2->n128_u64[0] < a1->n128_u64[0])
      {
        uint64_t result = *a1;
        *a1 = *a2;
        *a2 = result;
      }
    }
  }
  else
  {
    if (v7 < v6)
    {
      uint64_t result = *a1;
      *a1 = *(__n128 *)a3;
LABEL_9:
      *(__n128 *)a3 = result;
      goto LABEL_10;
    }
    uint64_t result = *a1;
    *a1 = *a2;
    *a2 = result;
    if (*a3 < a2->n128_u64[0])
    {
      uint64_t result = *a2;
      *a2 = *(__n128 *)a3;
      goto LABEL_9;
    }
  }
LABEL_10:
  if (*(void *)a4 < *a3)
  {
    uint64_t result = *(__n128 *)a3;
    *(_OWORD *)a3 = *a4;
    *a4 = result;
    if (*a3 < a2->n128_u64[0])
    {
      uint64_t result = *a2;
      *a2 = *(__n128 *)a3;
      *(__n128 *)a3 = result;
      if (a2->n128_u64[0] < a1->n128_u64[0])
      {
        uint64_t result = *a1;
        *a1 = *a2;
        *a2 = result;
      }
    }
  }
  if (*(void *)a5 < *(void *)a4)
  {
    uint64_t result = *(__n128 *)a4;
    *a4 = *a5;
    *a5 = result;
    if (*(void *)a4 < *a3)
    {
      uint64_t result = *(__n128 *)a3;
      *(_OWORD *)a3 = *a4;
      *a4 = result;
      if (*a3 < a2->n128_u64[0])
      {
        uint64_t result = *a2;
        *a2 = *(__n128 *)a3;
        *(__n128 *)a3 = result;
        if (a2->n128_u64[0] < a1->n128_u64[0])
        {
          uint64_t result = *a1;
          *a1 = *a2;
          *a2 = result;
        }
      }
    }
  }
  return result;
}

void sub_246CEB334(uint64_t a1, const std::locale *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  sub_246CE58A0((uint64_t)&v22);
  unint64_t v4 = (std::ios_base *)((char *)&v22 + (unint64_t)v22.__vftable[-1].~runtime_error);
  std::ios_base::getloc(v4);
  std::ios_base::imbue(v4, a2);
  std::locale::~locale((std::locale *)&__dst);
  rdbuf = (std::locale *)v4->__rdbuf_;
  if (rdbuf)
  {
    (*((void (**)(std::locale *, const std::locale *))rdbuf->__locale_ + 2))(rdbuf, a2);
    unint64_t v6 = rdbuf + 1;
    std::locale::locale((std::locale *)&v20, v6);
    std::locale::operator=(v6, a2);
    std::locale::~locale((std::locale *)&v20);
  }
  std::locale::~locale((std::locale *)&v19);
  sub_246CC7924(&v22, (uint64_t)"Markers", 7);
  int v7 = *(_DWORD *)&v24[(unint64_t)v22.__vftable[-1].~runtime_error] & 5;
  if (v7)
  {
    char v33 = 0;
    goto LABEL_19;
  }
  if ((v31 & 0x10) != 0)
  {
    unint64_t v10 = v30;
    if (v30 < v27)
    {
      unint64_t v30 = v27;
      unint64_t v10 = v27;
    }
    unint64_t v11 = v26;
    std::string::size_type v8 = v10 - (void)v26;
    if (v10 - (unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_39;
    }
  }
  else
  {
    if ((v31 & 8) == 0)
    {
      std::string::size_type v8 = 0;
      *((unsigned char *)&__dst.__r_.__value_.__s + 23) = 0;
      p_dst = &__dst;
      goto LABEL_18;
    }
    unint64_t v11 = v23;
    std::string::size_type v8 = v25 - (void)v23;
    if ((unint64_t)(v25 - (void)v23) >= 0x7FFFFFFFFFFFFFF8) {
LABEL_39:
    }
      sub_246CC5D0C();
  }
  if (v8 >= 0x17)
  {
    uint64_t v12 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v12 = v8 | 7;
    }
    uint64_t v13 = v12 + 1;
    p_dst = (std::string *)operator new(v12 + 1);
    __dst.__r_.__value_.__l.__size_ = v8;
    __dst.__r_.__value_.__r.__words[2] = v13 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v8;
    p_dst = &__dst;
    if (!v8) {
      goto LABEL_18;
    }
  }
  memmove(p_dst, v11, v8);
LABEL_18:
  p_dst->__r_.__value_.__s.__data_[v8] = 0;
  std::string v34 = __dst;
  char v33 = 1;
LABEL_19:
  v22.__vftable = (std::runtime_error_vtbl *)*MEMORY[0x263F8C2C8];
  *(std::runtime_error_vtbl **)((char *)&v22.__vftable + (unint64_t)v22.__vftable[-1].~runtime_error) = *(std::runtime_error_vtbl **)(MEMORY[0x263F8C2C8] + 24);
  v22.__imp_.__imp_ = (const char *)(MEMORY[0x263F8C318] + 16);
  if (v29 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x24C547150](&v32);
  if (v7)
  {
    sub_246CC5444(&v19, "conversion of type \"");
    sub_246CCB99C((char *)(0x8000000246D20670 & 0x7FFFFFFFFFFFFFFFLL), &v19, &v20);
    sub_246CCB99C("\" to data failed", &v20, &__dst);
    uint64_t v18 = 0;
    sub_246CE7C54(&v22, &__dst, &v18);
    v16.i64[0] = (uint64_t)"/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/"
                          "Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/lo"
                          "cal/include/boost/property_tree/detail/ptree_implementation.hpp";
    v16.i64[1] = (uint64_t)"void boost::property_tree::basic_ptree<std::string, std::string>::put_value(const Type &, Tran"
                          "slator) [Key = std::string, Data = std::string, KeyCompare = std::less<std::string>, Type = ch"
                          "ar[8], Translator = boost::property_tree::stream_translator<char, std::char_traits<char>, std:"
                          ":allocator<char>, char[8]>]";
    uint64_t v17 = 828;
    sub_246CE7BEC(&v22, &v16);
  }
  if (&v34 == (std::string *)a1) {
    goto LABEL_35;
  }
  if (*(char *)(a1 + 23) < 0)
  {
    unint64_t v14 = (v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &v34
        : (std::string *)v34.__r_.__value_.__r.__words[0];
    size_t v15 = (v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? HIBYTE(v34.__r_.__value_.__r.__words[2])
        : v34.__r_.__value_.__l.__size_;
    sub_246CC654C((void **)a1, v14, v15);
  }
  else if ((*((unsigned char *)&v34.__r_.__value_.__s + 23) & 0x80) != 0)
  {
    sub_246CC6484((void *)a1, v34.__r_.__value_.__l.__data_, v34.__r_.__value_.__l.__size_);
  }
  else
  {
    *(std::string *)a1 = v34;
  }
  if (v33)
  {
LABEL_35:
    if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v34.__r_.__value_.__l.__data_);
    }
  }
}

void sub_246CEB760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,std::runtime_error a32)
{
  if (a31 < 0)
  {
    operator delete(__p);
    if ((a25 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a19 & 0x80000000) == 0) {
LABEL_8:
      }
        _Unwind_Resume(a1);
LABEL_7:
      operator delete(a14);
      _Unwind_Resume(a1);
    }
  }
  else if ((a25 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a20);
  if ((a19 & 0x80000000) == 0) {
    goto LABEL_8;
  }
  goto LABEL_7;
}

void sub_246CEB828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::locale a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
}

void sub_246CEB844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  sub_246CE5A44((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_246CEB858(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (*(char *)(a3 + 23) < 0)
  {
    sub_246CC5E50(__p, *(void **)a3, *(void *)(a3 + 8));
    BOOL v6 = *(char *)(a3 + 23) < 0;
  }
  else
  {
    BOOL v6 = 0;
    *(_OWORD *)std::string __p = *(_OWORD *)a3;
    uint64_t v10 = *(void *)(a3 + 16);
  }
  char v11 = *(unsigned char *)(a3 + 24);
  int v7 = __p;
  if (v10 < 0) {
    int v7 = (void **)__p[0];
  }
  if (v6) {
    std::string::size_type v8 = *(void **)a3;
  }
  else {
    std::string::size_type v8 = (void *)a3;
  }
  uint64_t v12 = (char *)v7 + *(void *)(a3 + 32) - (void)v8;
  *a1 = sub_246CE63CC(a2, (uint64_t)__p);
  if (SHIBYTE(v10) < 0) {
    operator delete(__p[0]);
  }
}

void sub_246CEB938(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CEB954()
{
  uint64_t v0 = (uint64_t *)MEMORY[0x270FA5388]();
  uint64_t v76 = v2;
  char v3 = v1;
  unint64_t v4 = v0;
  uint64_t v97 = *MEMORY[0x263EF8340];
  uint64_t v5 = *v0;
  uint64_t v6 = *v0;
  *(_DWORD *)((char *)v0 + *(void *)(*v0 - 24) + 8) &= ~0x1000u;
  int v7 = *(void **)((char *)v0 + *(void *)(v6 - 24) + 40);
  unint64_t v83 = 0;
  int64_t v84 = 0;
  uint64_t v82 = 0;
  if (v7)
  {
    char v77 = v1;
    while (1)
    {
      std::string::size_type v8 = (char *)v7[3];
      if (v8 != (char *)v7[4]) {
        goto LABEL_5;
      }
      if ((*(unsigned int (**)(void *))(*v7 + 72))(v7) == -1)
      {
        uint64_t v5 = *v4;
        char v3 = v77;
        break;
      }
      std::string::size_type v8 = (char *)v7[3];
      if (v8 == (char *)v7[4])
      {
        char v9 = (*(uint64_t (**)(void *))(*v7 + 72))(v7);
        char v11 = v83;
        uint64_t v10 = v84;
        if (v83 < v84)
        {
LABEL_6:
          *char v11 = v9;
          uint64_t v12 = (uint64_t)(v11 + 1);
          goto LABEL_25;
        }
      }
      else
      {
LABEL_5:
        char v9 = *v8;
        char v11 = v83;
        uint64_t v10 = v84;
        if (v83 < v84) {
          goto LABEL_6;
        }
      }
      uint64_t v13 = v82;
      unint64_t v14 = v11 - (unsigned char *)v82;
      uint64_t v15 = v11 - (unsigned char *)v82 + 1;
      if (v15 < 0) {
        sub_246CC23A4();
      }
      unint64_t v16 = v10 - (unsigned char *)v82;
      if (2 * v16 > v15) {
        uint64_t v15 = 2 * v16;
      }
      if (v16 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v17 = v15;
      }
      if (v17)
      {
        uint64_t v18 = operator new(v17);
        std::string v19 = &v18[v14];
        v18[v14] = v9;
        uint64_t v12 = (uint64_t)&v18[v14 + 1];
        if (v11 != v13) {
          goto LABEL_18;
        }
      }
      else
      {
        uint64_t v18 = 0;
        std::string v19 = (char *)(v11 - (unsigned char *)v82);
        *(unsigned char *)unint64_t v14 = v9;
        uint64_t v12 = v14 + 1;
        if (v11 != v13)
        {
LABEL_18:
          if (v14 >= 8 && (unint64_t)(v13 - v18) >= 0x20)
          {
            if (v14 >= 0x20)
            {
              unint64_t v20 = v14 & 0xFFFFFFFFFFFFFFE0;
              std::runtime_error v22 = &v18[v14 - 16];
              __n128 v23 = (long long *)(v11 - 16);
              unint64_t v24 = v14 & 0xFFFFFFFFFFFFFFE0;
              do
              {
                long long v25 = *v23;
                *(v22 - 1) = *(v23 - 1);
                _OWORD *v22 = v25;
                v22 -= 2;
                v23 -= 2;
                v24 -= 32;
              }
              while (v24);
              if (v14 == v20) {
                goto LABEL_38;
              }
              if ((v14 & 0x18) != 0) {
                goto LABEL_31;
              }
              v19 -= v20;
              v11 -= v20;
            }
            else
            {
              unint64_t v20 = 0;
LABEL_31:
              v19 -= v14 & 0xFFFFFFFFFFFFFFF8;
              long long v26 = &v18[&v11[-v20] - v13 - 8];
              unint64_t v27 = (uint64_t *)&v11[-v20 - 8];
              unint64_t v28 = v20 - (v14 & 0xFFFFFFFFFFFFFFF8);
              do
              {
                uint64_t v29 = *v27--;
                *v26-- = v29;
                v28 += 8;
              }
              while (v28);
              v11 -= v14 & 0xFFFFFFFFFFFFFFF8;
              if (v14 == (v14 & 0xFFFFFFFFFFFFFFF8))
              {
LABEL_38:
                char v11 = v82;
                uint64_t v82 = v18;
                int64_t v84 = &v18[v17];
                if (!v11) {
                  goto LABEL_25;
                }
LABEL_24:
                operator delete(v11);
                goto LABEL_25;
              }
            }
          }
          unint64_t v30 = v19 - 1;
          do
          {
            char v31 = *--v11;
            *v30-- = v31;
          }
          while (v11 != v13);
          goto LABEL_38;
        }
      }
      uint64_t v82 = v19;
      int64_t v84 = &v18[v17];
      if (v11) {
        goto LABEL_24;
      }
LABEL_25:
      unint64_t v83 = (unsigned __int8 *)v12;
      uint64_t v21 = v7[3];
      if (v21 == v7[4]) {
        (*(void (**)(void *))(*v7 + 80))(v7);
      }
      else {
        v7[3] = v21 + 1;
      }
    }
  }
  if (*(_DWORD *)((char *)v4 + *(void *)(v5 - 24) + 32))
  {
    sub_246CC5444(__p, "read error");
    sub_246CEF020(v86, __p, v76, 0);
    v86[0].__vftable = (std::runtime_error_vtbl *)&unk_26FB3E368;
    v80.i64[0] = (uint64_t)"/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/"
                          "Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/lo"
                          "cal/include/boost/property_tree/detail/xml_parser_read_rapidxml.hpp";
    v80.i64[1] = (uint64_t)"void boost::property_tree::xml_parser::read_xml_internal(std::basic_istream<typename Ptree::ke"
                          "y_type::value_type> &, Ptree &, int, const std::string &) [Ptree = boost::property_tree::basic"
                          "_ptree<std::string, std::string>]";
    uint64_t v81 = 101;
    sub_246CEC83C((uint64_t)v86, &v80);
  }
  uint64_t v32 = (char *)v83;
  if (v83 < v84)
  {
    *unint64_t v83 = 0;
    char v33 = (unsigned __int8 *)v82;
    uint64_t v34 = (uint64_t)(v32 + 1);
    goto LABEL_72;
  }
  uint64_t v35 = (char *)v82;
  unint64_t v36 = v83 - (unsigned char *)v82;
  uint64_t v37 = v83 - (unsigned char *)v82 + 1;
  if (v37 < 0) {
    sub_246CC23A4();
  }
  unint64_t v38 = v84 - (unsigned char *)v82;
  if (2 * (v84 - (unsigned char *)v82) > (unint64_t)v37) {
    uint64_t v37 = 2 * v38;
  }
  if (v38 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v39 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v39 = v37;
  }
  if (v39)
  {
    char v33 = (unsigned __int8 *)operator new(v39);
    long long v40 = &v33[v36];
    long long v41 = &v33[v39];
    v33[v36] = 0;
    uint64_t v34 = (uint64_t)&v33[v36 + 1];
    if (v32 != v35)
    {
LABEL_52:
      if (v36 < 8 || (unint64_t)(v35 - (char *)v33) < 0x20) {
        goto LABEL_68;
      }
      if (v36 >= 0x20)
      {
        unint64_t v42 = v36 & 0xFFFFFFFFFFFFFFE0;
        uint64_t v43 = v32 - 16;
        unint64_t v44 = &v33[v32 - 16 - v35];
        unint64_t v45 = v36 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v46 = *(_OWORD *)v43;
          *((_OWORD *)v44 - 1) = *((_OWORD *)v43 - 1);
          *(_OWORD *)unint64_t v44 = v46;
          v44 -= 32;
          v43 -= 32;
          v45 -= 32;
        }
        while (v45);
        if (v36 == v42)
        {
LABEL_70:
          uint64_t v32 = (char *)v82;
          uint64_t v82 = v33;
          int64_t v84 = v41;
          if (!v32) {
            goto LABEL_72;
          }
          goto LABEL_71;
        }
        if ((v36 & 0x18) == 0)
        {
          v40 -= v42;
          v32 -= v42;
          goto LABEL_68;
        }
      }
      else
      {
        unint64_t v42 = 0;
      }
      v40 -= v36 & 0xFFFFFFFFFFFFFFF8;
      uint64_t v47 = &v32[-v42 - 8];
      unint64_t v48 = &v33[v47 - v35];
      unint64_t v49 = v42 - (v36 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        uint64_t v50 = *(void *)v47;
        v47 -= 8;
        *(void *)unint64_t v48 = v50;
        v48 -= 8;
        v49 += 8;
      }
      while (v49);
      v32 -= v36 & 0xFFFFFFFFFFFFFFF8;
      if (v36 == (v36 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_70;
      }
LABEL_68:
      unint64_t v51 = v40 - 1;
      do
      {
        unsigned __int8 v52 = *--v32;
        *v51-- = v52;
      }
      while (v32 != v35);
      goto LABEL_70;
    }
  }
  else
  {
    char v33 = 0;
    long long v40 = (unsigned __int8 *)(v83 - (unsigned char *)v82);
    long long v41 = 0;
    *(unsigned char *)unint64_t v36 = 0;
    uint64_t v34 = v36 + 1;
    if (v32 != v35) {
      goto LABEL_52;
    }
  }
  char v33 = v40;
  uint64_t v82 = v40;
  int64_t v84 = v41;
  if (!v32)
  {
LABEL_72:
    unint64_t v83 = (unsigned __int8 *)v34;
    uint64_t v87 = 0;
    v86[0] = 0u;
    int v88 = 0;
    long long v96 = 0u;
    unint64_t v92 = v95;
    uint64_t v93 = v95;
    unint64_t v94 = &v96;
    if ((v3 & 2) != 0)
    {
      if ((v3 & 4) != 0)
      {
        int64_t v85 = v33;
        uint64_t v89 = 0;
        uint64_t v91 = 0;
        if (*v33 == 239 && v33[1] == 187 && v33[2] == 191)
        {
          v33 += 3;
          int64_t v85 = v33;
        }
        while (1)
        {
          do
          {
            unsigned __int8 v53 = v33;
            int v71 = (char)*v33++;
            unsigned __int8 v70 = v71;
            if (v71 < 0) {
              unsigned __int8 v70 = 122;
            }
          }
          while (byte_246D20753[v70]);
          int64_t v85 = v53;
          int v56 = *v53;
          if (v56 != 60) {
            break;
          }
          int64_t v85 = v33;
          unint64_t v72 = (void *)sub_246CEF44C(v86, (uint64_t *)&v85);
          if (v72)
          {
            unint64_t v73 = v90;
            if (v89) {
              unint64_t v74 = v90 + 11;
            }
            else {
              unint64_t v74 = &v89;
            }
            if (!v89) {
              unint64_t v73 = 0;
            }
            *unint64_t v74 = (uint64_t)v72;
            BOOL v90 = v72;
            v72[4] = v86;
            v72[10] = v73;
            v72[11] = 0;
          }
          char v33 = v85;
        }
      }
      else
      {
        int64_t v85 = v33;
        uint64_t v89 = 0;
        uint64_t v91 = 0;
        if (*v33 == 239 && v33[1] == 187 && v33[2] == 191)
        {
          v33 += 3;
          int64_t v85 = v33;
        }
        while (1)
        {
          do
          {
            unsigned __int8 v53 = v33;
            int v61 = (char)*v33++;
            unsigned __int8 v60 = v61;
            if (v61 < 0) {
              unsigned __int8 v60 = 122;
            }
          }
          while (byte_246D20753[v60]);
          int64_t v85 = v53;
          int v56 = *v53;
          if (v56 != 60) {
            break;
          }
          int64_t v85 = v33;
          unint64_t v62 = (void *)sub_246CF0B38(v86, (uint64_t *)&v85);
          if (v62)
          {
            unint64_t v63 = v90;
            if (v89) {
              unint64_t v64 = v90 + 11;
            }
            else {
              unint64_t v64 = &v89;
            }
            if (!v89) {
              unint64_t v63 = 0;
            }
            *unint64_t v64 = (uint64_t)v62;
            BOOL v90 = v62;
            v62[4] = v86;
            v62[10] = v63;
            v62[11] = 0;
          }
          char v33 = v85;
        }
      }
    }
    else if ((v3 & 4) != 0)
    {
      int64_t v85 = v33;
      uint64_t v89 = 0;
      uint64_t v91 = 0;
      if (*v33 == 239 && v33[1] == 187 && v33[2] == 191)
      {
        v33 += 3;
        int64_t v85 = v33;
      }
      while (1)
      {
        do
        {
          unsigned __int8 v53 = v33;
          int v66 = (char)*v33++;
          unsigned __int8 v65 = v66;
          if (v66 < 0) {
            unsigned __int8 v65 = 122;
          }
        }
        while (byte_246D20753[v65]);
        int64_t v85 = v53;
        int v56 = *v53;
        if (v56 != 60) {
          break;
        }
        int64_t v85 = v33;
        unint64_t v67 = (void *)sub_246CF1F38(v86, (uint64_t *)&v85);
        if (v67)
        {
          unint64_t v68 = v90;
          if (v89) {
            unint64_t v69 = v90 + 11;
          }
          else {
            unint64_t v69 = &v89;
          }
          if (!v89) {
            unint64_t v68 = 0;
          }
          *unint64_t v69 = (uint64_t)v67;
          BOOL v90 = v67;
          v67[4] = v86;
          v67[10] = v68;
          v67[11] = 0;
        }
        char v33 = v85;
      }
    }
    else
    {
      int64_t v85 = v33;
      uint64_t v89 = 0;
      uint64_t v91 = 0;
      if (*v33 == 239 && v33[1] == 187 && v33[2] == 191)
      {
        v33 += 3;
        int64_t v85 = v33;
      }
      while (1)
      {
        do
        {
          unsigned __int8 v53 = v33;
          int v55 = (char)*v33++;
          unsigned __int8 v54 = v55;
          if (v55 < 0) {
            unsigned __int8 v54 = 122;
          }
        }
        while (byte_246D20753[v54]);
        int64_t v85 = v53;
        int v56 = *v53;
        if (v56 != 60) {
          break;
        }
        int64_t v85 = v33;
        uint64_t v57 = (void *)sub_246CF3434(v86, (uint64_t *)&v85);
        if (v57)
        {
          uint64_t v58 = v90;
          if (v89) {
            unint64_t v59 = v90 + 11;
          }
          else {
            unint64_t v59 = &v89;
          }
          if (!v89) {
            uint64_t v58 = 0;
          }
          *unint64_t v59 = (uint64_t)v57;
          BOOL v90 = v57;
          v57[4] = v86;
          v57[10] = v58;
          v57[11] = 0;
        }
        char v33 = v85;
      }
    }
    if (!v56)
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v79 = 0;
      operator new();
    }
    exception = __cxa_allocate_exception(0x18uLL);
    void *exception = &unk_26FB3E3B8;
    exception[1] = "expected <";
    exception[2] = v53;
    __cxa_throw(exception, (struct type_info *)&unk_26FB3E250, (void (*)(void *))std::exception::~exception);
  }
LABEL_71:
  operator delete(v32);
  goto LABEL_72;
}

void sub_246CEC3D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,std::runtime_error a31)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  if (!a23) {
    _Unwind_Resume(a1);
  }
  operator delete(a23);
  _Unwind_Resume(a1);
}

void sub_246CEC404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, long long *a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, int8x16_t a20,uint64_t a21,int8x16_t *a22,int8x16_t *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,std::runtime_error a30)
{
  MEMORY[0x24C5471E0](v30, 0x1020C402FC1992ELL);
  if (a18 < 0) {
    operator delete(__p);
  }
  sub_246CEE308(&a30);
  if (a2 != 1)
  {
    if (!a22) {
      _Unwind_Resume(a1);
    }
    a23 = a22;
    operator delete(a22);
    _Unwind_Resume(a1);
  }
  char v33 = __cxa_begin_catch(a1);
  uint64_t v34 = (unsigned __int8 *)v33[2];
  if (a22 == (int8x16_t *)v34)
  {
    uint64_t v35 = 1;
    goto LABEL_23;
  }
  unint64_t v36 = v34 - (unsigned __int8 *)a22;
  if ((unint64_t)(v34 - (unsigned __int8 *)a22) < 8)
  {
    uint64_t v37 = 0;
    unint64_t v38 = (unsigned __int8 *)a22;
    goto LABEL_19;
  }
  if (v36 >= 0x20)
  {
    int64x2_t v55 = 0uLL;
    v56.i64[0] = 0xA0A0A0A0A0A0A0ALL;
    v56.i64[1] = 0xA0A0A0A0A0A0A0ALL;
    int8x16_t v57 = (int8x16_t)vdupq_n_s64(1uLL);
    unint64_t v39 = v36 & 0xFFFFFFFFFFFFFFE0;
    int64x2_t v58 = 0uLL;
    unint64_t v59 = a22 + 1;
    int64x2_t v60 = 0uLL;
    unint64_t v61 = v36 & 0xFFFFFFFFFFFFFFE0;
    int64x2_t v62 = 0uLL;
    int64x2_t v63 = 0uLL;
    int64x2_t v64 = 0uLL;
    int64x2_t v65 = 0uLL;
    int64x2_t v66 = 0uLL;
    int64x2_t v67 = 0uLL;
    int64x2_t v68 = 0uLL;
    int64x2_t v69 = 0uLL;
    int64x2_t v70 = 0uLL;
    int64x2_t v71 = 0uLL;
    int64x2_t v72 = 0uLL;
    int64x2_t v73 = 0uLL;
    int64x2_t v74 = 0uLL;
    do
    {
      uint8x16_t v75 = (uint8x16_t)vceqq_s8(v59[-1], v56);
      uint16x8_t v76 = vmovl_u8(*(uint8x8_t *)v75.i8);
      uint16x8_t v77 = vmovl_high_u8(v75);
      uint32x4_t v78 = vmovl_high_u16(v77);
      v79.i64[0] = v78.u32[2];
      v79.i64[1] = v78.u32[3];
      int64x2_t v66 = vaddq_s64(v66, (int64x2_t)vandq_s8(v79, v57));
      uint32x4_t v80 = vmovl_high_u16(v76);
      uint32x4_t v81 = vmovl_u16(*(uint16x4_t *)v77.i8);
      v79.i64[0] = v78.u32[0];
      v79.i64[1] = v78.u32[1];
      int64x2_t v65 = vaddq_s64(v65, (int64x2_t)vandq_s8(v79, v57));
      v79.i64[0] = v81.u32[2];
      v79.i64[1] = v81.u32[3];
      int64x2_t v64 = vaddq_s64(v64, (int64x2_t)vandq_s8(v79, v57));
      v79.i64[0] = v80.u32[2];
      v79.i64[1] = v80.u32[3];
      int64x2_t v62 = vaddq_s64(v62, (int64x2_t)vandq_s8(v79, v57));
      int8x16_t v82 = *v59;
      v59 += 2;
      uint32x4_t v83 = vmovl_u16(*(uint16x4_t *)v76.i8);
      v79.i64[0] = v81.u32[0];
      v79.i64[1] = v81.u32[1];
      int64x2_t v63 = vaddq_s64(v63, (int64x2_t)vandq_s8(v79, v57));
      v79.i64[0] = v83.u32[0];
      v79.i64[1] = v83.u32[1];
      int64x2_t v84 = (int64x2_t)vandq_s8(v79, v57);
      v79.i64[0] = v83.u32[2];
      v79.i64[1] = v83.u32[3];
      int64x2_t v85 = (int64x2_t)vandq_s8(v79, v57);
      v79.i64[0] = v80.u32[0];
      v79.i64[1] = v80.u32[1];
      uint8x16_t v86 = (uint8x16_t)vceqq_s8(v82, v56);
      int64x2_t v60 = vaddq_s64(v60, (int64x2_t)vandq_s8(v79, v57));
      uint16x8_t v87 = vmovl_u8(*(uint8x8_t *)v86.i8);
      uint16x8_t v88 = vmovl_high_u8(v86);
      int64x2_t v58 = vaddq_s64(v58, v85);
      uint32x4_t v89 = vmovl_high_u16(v88);
      int64x2_t v55 = vaddq_s64(v55, v84);
      v79.i64[0] = v89.u32[2];
      v79.i64[1] = v89.u32[3];
      int64x2_t v74 = vaddq_s64(v74, (int64x2_t)vandq_s8(v79, v57));
      uint32x4_t v90 = vmovl_high_u16(v87);
      uint32x4_t v91 = vmovl_u16(*(uint16x4_t *)v88.i8);
      v79.i64[0] = v89.u32[0];
      v79.i64[1] = v89.u32[1];
      int64x2_t v73 = vaddq_s64(v73, (int64x2_t)vandq_s8(v79, v57));
      v79.i64[0] = v91.u32[2];
      v79.i64[1] = v91.u32[3];
      int64x2_t v72 = vaddq_s64(v72, (int64x2_t)vandq_s8(v79, v57));
      v79.i64[0] = v90.u32[2];
      v79.i64[1] = v90.u32[3];
      int64x2_t v70 = vaddq_s64(v70, (int64x2_t)vandq_s8(v79, v57));
      v79.i64[0] = v91.u32[0];
      v79.i64[1] = v91.u32[1];
      int64x2_t v71 = vaddq_s64(v71, (int64x2_t)vandq_s8(v79, v57));
      uint32x4_t v92 = vmovl_u16(*(uint16x4_t *)v87.i8);
      v79.i64[0] = v90.u32[0];
      v79.i64[1] = v90.u32[1];
      int64x2_t v69 = vaddq_s64(v69, (int64x2_t)vandq_s8(v79, v57));
      v79.i64[0] = v92.u32[2];
      v79.i64[1] = v92.u32[3];
      int64x2_t v68 = vaddq_s64(v68, (int64x2_t)vandq_s8(v79, v57));
      v79.i64[0] = v92.u32[0];
      v79.i64[1] = v92.u32[1];
      int64x2_t v67 = vaddq_s64(v67, (int64x2_t)vandq_s8(v79, v57));
      v61 -= 32;
    }
    while (v61);
    uint64_t v37 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v67, v55), vaddq_s64(v71, v63)), vaddq_s64(vaddq_s64(v69, v60), vaddq_s64(v73, v65))), vaddq_s64(vaddq_s64(vaddq_s64(v68, v58), vaddq_s64(v72, v64)), vaddq_s64(vaddq_s64(v70, v62), vaddq_s64(v74, v66)))));
    if (v36 == v39) {
      goto LABEL_22;
    }
    if ((v36 & 0x18) == 0)
    {
      unint64_t v38 = &a22->u8[v39];
      do
      {
LABEL_19:
        int v93 = *v38++;
        if (v93 == 10) {
          ++v37;
        }
      }
      while (v38 != v34);
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v37 = 0;
    unint64_t v39 = 0;
  }
  unint64_t v38 = &a22->u8[v36 & 0xFFFFFFFFFFFFFFF8];
  int64x2_t v40 = 0uLL;
  int64x2_t v41 = (int64x2_t)(unint64_t)v37;
  unint64_t v42 = (int8x8_t *)&a22->i8[v39];
  unint64_t v43 = v39 - (v36 & 0xFFFFFFFFFFFFFFF8);
  int8x16_t v44 = (int8x16_t)vdupq_n_s64(1uLL);
  int64x2_t v45 = 0uLL;
  int64x2_t v46 = 0uLL;
  do
  {
    int8x8_t v47 = *v42++;
    uint16x8_t v48 = vmovl_u8((uint8x8_t)vceq_s8(v47, (int8x8_t)0xA0A0A0A0A0A0A0ALL));
    uint32x4_t v49 = vmovl_u16(*(uint16x4_t *)v48.i8);
    v50.i64[0] = v49.u32[0];
    v50.i64[1] = v49.u32[1];
    int64x2_t v51 = (int64x2_t)vandq_s8(v50, v44);
    v50.i64[0] = v49.u32[2];
    v50.i64[1] = v49.u32[3];
    int64x2_t v52 = (int64x2_t)vandq_s8(v50, v44);
    uint32x4_t v53 = vmovl_high_u16(v48);
    v50.i64[0] = v53.u32[0];
    v50.i64[1] = v53.u32[1];
    int64x2_t v54 = (int64x2_t)vandq_s8(v50, v44);
    v50.i64[0] = v53.u32[2];
    v50.i64[1] = v53.u32[3];
    int64x2_t v46 = vaddq_s64(v46, (int64x2_t)vandq_s8(v50, v44));
    int64x2_t v45 = vaddq_s64(v45, v54);
    int64x2_t v40 = vaddq_s64(v40, v52);
    int64x2_t v41 = vaddq_s64(v41, v51);
    v43 += 8;
  }
  while (v43);
  uint64_t v37 = vaddvq_s64(vaddq_s64(vaddq_s64(v41, v45), vaddq_s64(v40, v46)));
  if (v36 != (v36 & 0xFFFFFFFFFFFFFFF8)) {
    goto LABEL_19;
  }
LABEL_22:
  uint64_t v35 = v37 + 1;
LABEL_23:
  unint64_t v94 = (char *)(*(uint64_t (**)(void *))(*v33 + 16))(v33);
  sub_246CC5444(&__p, v94);
  sub_246CEF020(&a30, &__p, a10, (std::runtime_error_vtbl *)v35);
  a30.__vftable = (std::runtime_error_vtbl *)&unk_26FB3E368;
  a20.i64[0] = (uint64_t)"/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Co"
                        "ntents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/local/"
                        "include/boost/property_tree/detail/xml_parser_read_rapidxml.hpp";
  a20.i64[1] = (uint64_t)"void boost::property_tree::xml_parser::read_xml_internal(std::basic_istream<typename Ptree::key_"
                        "type::value_type> &, Ptree &, int, const std::string &) [Ptree = boost::property_tree::basic_ptr"
                        "ee<std::string, std::string>]";
  a21 = 138;
  sub_246CEC83C((uint64_t)&a30, &a20);
}

void sub_246CEC7D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,std::runtime_error a31)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  __cxa_end_catch();
  if (!a23) {
    _Unwind_Resume(a1);
  }
  operator delete(a23);
  _Unwind_Resume(a1);
}

void sub_246CEC83C(uint64_t a1, int8x16_t *a2)
{
  exception = __cxa_allocate_exception(0x78uLL);
  sub_246CEE3B0((uint64_t)exception, a1, a2);
  __cxa_throw(exception, (struct type_info *)&unk_26FB3E298, (void (*)(void *))sub_246CEE53C);
}

void sub_246CEC890(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_246CEC8A4(std::runtime_error *this)
{
  this->__vftable = (std::runtime_error_vtbl *)&unk_26FB3E390;
  if (SHIBYTE(this[3].__imp_.__imp_) < 0)
  {
    operator delete((void *)this[2].__imp_.__imp_);
    if ((SHIBYTE(this[2].__vftable) & 0x80000000) == 0)
    {
LABEL_3:
      unint64_t v2 = this;
      goto LABEL_5;
    }
  }
  else if ((SHIBYTE(this[2].__vftable) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(this[1].__vftable);
  unint64_t v2 = this;
LABEL_5:
  std::runtime_error::~runtime_error(v2);
}

void sub_246CEC93C(uint64_t a1, std::string *a2, char a3)
{
  int v5 = *(_DWORD *)(a1 + 40);
  if ((v5 - 2) >= 2)
  {
    if (v5 != 4)
    {
      if (v5 == 1)
      {
        v26[0] = 0;
        v26[1] = 0;
        unint64_t v27 = 0;
        operator new();
      }
      return;
    }
    if ((a3 & 2) != 0) {
      return;
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2691E2770, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_2691E2770))
    {
      sub_246CF4A98((std::string *)&xmmword_2691E27A8, "<xmlcomment>");
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_2691E27A8, &dword_246CBB000);
      __cxa_guard_release(&qword_2691E2770);
    }
    char v9 = *(const void **)(a1 + 8);
    if (!v9)
    {
      HIBYTE(v25) = 0;
      goto LABEL_47;
    }
    size_t v10 = *(void *)(a1 + 24);
    if (v10 <= 0x7FFFFFFFFFFFFFF7)
    {
      if (v10 >= 0x17)
      {
        uint64_t v22 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v10 | 7) != 0x17) {
          uint64_t v22 = v10 | 7;
        }
        uint64_t v23 = v22 + 1;
        p_dst = (long long *)operator new(v22 + 1);
        *((void *)&__dst + 1) = v10;
        unint64_t v25 = v23 | 0x8000000000000000;
        *(void *)&long long __dst = p_dst;
      }
      else
      {
        HIBYTE(v25) = *(void *)(a1 + 24);
        p_dst = &__dst;
        if (!v10)
        {
LABEL_47:
          LOBYTE(__dst) = 0;
          if ((SHIBYTE(v25) & 0x80000000) == 0)
          {
LABEL_48:
            *(_OWORD *)long long v26 = __dst;
            unint64_t v27 = v25;
            goto LABEL_54;
          }
LABEL_53:
          sub_246CC5E50(v26, (void *)__dst, *((unint64_t *)&__dst + 1));
LABEL_54:
          operator new();
        }
      }
      memmove(p_dst, v9, v10);
      *((unsigned char *)p_dst + v10) = 0;
      if ((SHIBYTE(v25) & 0x80000000) == 0) {
        goto LABEL_48;
      }
      goto LABEL_53;
    }
LABEL_57:
    sub_246CC5D0C();
  }
  if (a3)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2691E2768, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_2691E2768))
    {
      sub_246CF4A98((std::string *)&xmmword_2691E2790, "<xmltext>");
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_2691E2790, &dword_246CBB000);
      __cxa_guard_release(&qword_2691E2768);
    }
    if (*(void *)(a1 + 8)) {
      uint64_t v12 = *(const char **)(a1 + 8);
    }
    else {
      uint64_t v12 = &byte_2691E2758;
    }
    size_t v13 = strlen(v12);
    if (v13 > 0x7FFFFFFFFFFFFFF7) {
      goto LABEL_57;
    }
    size_t v14 = v13;
    if (v13 >= 0x17)
    {
      uint64_t v16 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v13 | 7) != 0x17) {
        uint64_t v16 = v13 | 7;
      }
      uint64_t v17 = v16 + 1;
      uint64_t v15 = (long long *)operator new(v16 + 1);
      *((void *)&__dst + 1) = v14;
      unint64_t v25 = v17 | 0x8000000000000000;
      *(void *)&long long __dst = v15;
    }
    else
    {
      HIBYTE(v25) = v13;
      uint64_t v15 = &__dst;
      if (!v13)
      {
        LOBYTE(__dst) = 0;
        if ((SHIBYTE(v25) & 0x80000000) == 0)
        {
LABEL_26:
          *(_OWORD *)long long v26 = __dst;
          unint64_t v27 = v25;
          goto LABEL_32;
        }
LABEL_31:
        sub_246CC5E50(v26, (void *)__dst, *((unint64_t *)&__dst + 1));
LABEL_32:
        operator new();
      }
    }
    memmove(v15, v12, v14);
    *((unsigned char *)v15 + v14) = 0;
    if ((SHIBYTE(v25) & 0x80000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_31;
  }
  uint64_t v6 = *(const void **)(a1 + 8);
  if (!v6)
  {
    size_t v7 = 0;
    HIBYTE(v29) = 0;
    std::string::size_type v8 = v28;
    goto LABEL_38;
  }
  size_t v7 = *(void *)(a1 + 24);
  if (v7 > 0x7FFFFFFFFFFFFFF7) {
    sub_246CC5D0C();
  }
  if (v7 >= 0x17)
  {
    uint64_t v18 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v18 = v7 | 7;
    }
    uint64_t v19 = v18 + 1;
    std::string::size_type v8 = operator new(v18 + 1);
    v28[1] = (void *)v7;
    int64_t v29 = v19 | 0x8000000000000000;
    v28[0] = v8;
    goto LABEL_37;
  }
  HIBYTE(v29) = *(void *)(a1 + 24);
  std::string::size_type v8 = v28;
  if (v7) {
LABEL_37:
  }
    memmove(v8, v6, v7);
LABEL_38:
  *((unsigned char *)v8 + v7) = 0;
  if (v29 >= 0) {
    unint64_t v20 = v28;
  }
  else {
    unint64_t v20 = (void **)v28[0];
  }
  if (v29 >= 0) {
    std::string::size_type v21 = HIBYTE(v29);
  }
  else {
    std::string::size_type v21 = (std::string::size_type)v28[1];
  }
  std::string::append(a2, (const std::string::value_type *)v20, v21);
  if (SHIBYTE(v29) < 0) {
    operator delete(v28[0]);
  }
}

void sub_246CEDEB0(_Unwind_Exception *a1)
{
}

void sub_246CEDEC8(_Unwind_Exception *a1)
{
}

void sub_246CEDEE0(_Unwind_Exception *a1)
{
}

void sub_246CEDEF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, void *a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,void *__p,uint64_t a37,int a38,__int16 a39,char a40,char a41,void *a42,uint64_t a43,int a44,__int16 a45,char a46,char a47)
{
  if (a41 < 0) {
    operator delete(__p);
  }
  sub_246CE5C24((uint64_t)&a15);
  sub_246CD9AA4((uint64_t)&a29);
  if (v47 < 0)
  {
    operator delete(a12);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

void *sub_246CEE308(void *a1)
{
  unint64_t v2 = a1 + 15;
  char v3 = (void *)a1[12];
  if (v3 != v2)
  {
    unint64_t v4 = (void (**)(void))(a1 + 8208);
    do
    {
      int v5 = *(void **)((char *)v3 + (-(int)v3 & 7));
      if (*v4) {
        (*v4)();
      }
      else {
        MEMORY[0x24C5471C0]();
      }
      a1[12] = v5;
      char v3 = v5;
    }
    while (v5 != v2);
  }
  a1[12] = v2;
  a1[13] = (char *)v2 + (-(int)v2 & 7);
  a1[14] = a1 + 8207;
  return a1;
}

uint64_t sub_246CEE3B0(uint64_t a1, uint64_t a2, int8x16_t *a3)
{
  *(void *)a1 = &unk_26FB3E058;
  std::runtime_error::runtime_error((std::runtime_error *)(a1 + 8), (const std::runtime_error *)a2);
  *(void *)(a1 + 8) = &unk_26FB3E390;
  if (*(char *)(a2 + 39) < 0)
  {
    sub_246CC5E50((unsigned char *)(a1 + 24), *(void **)(a2 + 16), *(void *)(a2 + 24));
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 16);
    *(void *)(a1 + 40) = *(void *)(a2 + 32);
    *(_OWORD *)(a1 + 24) = v6;
  }
  size_t v7 = (unsigned char *)(a1 + 48);
  if (*(char *)(a2 + 63) < 0)
  {
    sub_246CC5E50(v7, *(void **)(a2 + 40), *(void *)(a2 + 48));
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 40);
    *(void *)(a1 + 64) = *(void *)(a2 + 56);
    *(_OWORD *)size_t v7 = v8;
  }
  uint64_t v9 = *(void *)(a2 + 64);
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)a1 = &unk_26FB3E2F0;
  *(void *)(a1 + 8) = &unk_26FB3E320;
  *(void *)(a1 + 72) = v9;
  *(void *)(a1 + 80) = &unk_26FB3E348;
  *(_DWORD *)(a1 + 112) = a3[1].i32[0];
  *(int8x16_t *)(a1 + 96) = vextq_s8(*a3, *a3, 8uLL);
  return a1;
}

void sub_246CEE504(_Unwind_Exception *a1)
{
  if (*(char *)(v2 + 47) < 0)
  {
    operator delete(*v3);
    std::runtime_error::~runtime_error(v1);
    _Unwind_Resume(a1);
  }
  std::runtime_error::~runtime_error(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_246CEE53C(uint64_t a1)
{
  *(void *)(a1 + 80) = &unk_26FB3E0D8;
  uint64_t v2 = *(void *)(a1 + 88);
  if (v2)
  {
    if ((*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
      *(void *)(a1 + 88) = 0;
    }
  }
  *(void *)(a1 + 8) = &unk_26FB3E390;
  if (*(char *)(a1 + 71) < 0)
  {
    operator delete(*(void **)(a1 + 48));
    if ((*(char *)(a1 + 47) & 0x80000000) == 0) {
      goto LABEL_6;
    }
  }
  else if ((*(char *)(a1 + 47) & 0x80000000) == 0)
  {
LABEL_6:
    std::runtime_error::~runtime_error((std::runtime_error *)(a1 + 8));
    return a1;
  }
  operator delete(*(void **)(a1 + 24));
  std::runtime_error::~runtime_error((std::runtime_error *)(a1 + 8));
  return a1;
}

void sub_246CEE620(std::runtime_error *this)
{
  this->__vftable = (std::runtime_error_vtbl *)&unk_26FB3E390;
  if (SHIBYTE(this[3].__imp_.__imp_) < 0)
  {
    operator delete((void *)this[2].__imp_.__imp_);
    if ((SHIBYTE(this[2].__vftable) & 0x80000000) == 0)
    {
LABEL_3:
      uint64_t v2 = this;
      goto LABEL_5;
    }
  }
  else if ((SHIBYTE(this[2].__vftable) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(this[1].__vftable);
  uint64_t v2 = this;
LABEL_5:
  std::runtime_error::~runtime_error(v2);
}

void sub_246CEE6B8()
{
}

void sub_246CEE70C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 24))(v1);
  _Unwind_Resume(a1);
}

void sub_246CEE740(_Unwind_Exception *a1)
{
  MEMORY[0x24C5471E0](v1, 0x10F3C40678E5ABFLL);
  _Unwind_Resume(a1);
}

void sub_246CEE764(uint64_t a1)
{
  exception = __cxa_allocate_exception(0x78uLL);
  sub_246CEEE28(exception, a1);
  __cxa_throw(exception, (struct type_info *)&unk_26FB3E298, (void (*)(void *))sub_246CEE53C);
}

void sub_246CEE7AC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_246CEE7C0(uint64_t a1)
{
  *(void *)(a1 + 80) = &unk_26FB3E0D8;
  uint64_t v2 = *(void *)(a1 + 88);
  if (v2 && (*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
    *(void *)(a1 + 88) = 0;
  }
  *(void *)(a1 + 8) = &unk_26FB3E390;
  if (*(char *)(a1 + 71) < 0)
  {
    operator delete(*(void **)(a1 + 48));
    if ((*(char *)(a1 + 47) & 0x80000000) == 0) {
      goto LABEL_6;
    }
  }
  else if ((*(char *)(a1 + 47) & 0x80000000) == 0)
  {
    goto LABEL_6;
  }
  operator delete(*(void **)(a1 + 24));
LABEL_6:
  std::runtime_error::~runtime_error((std::runtime_error *)(a1 + 8));
  JUMPOUT(0x24C5471E0);
}

void sub_246CEE8B0(std::runtime_error *this)
{
  this[4].__imp_.__imp_ = (const char *)&unk_26FB3E0D8;
  uint64_t v2 = this[5].__vftable;
  if (v2 && (*((unsigned int (**)(std::runtime_error_vtbl *))v2->~runtime_error + 4))(v2)) {
    this[5].__vftable = 0;
  }
  this->__vftable = (std::runtime_error_vtbl *)&unk_26FB3E390;
  if (SHIBYTE(this[3].__imp_.__imp_) < 0)
  {
    operator delete((void *)this[2].__imp_.__imp_);
    if ((SHIBYTE(this[2].__vftable) & 0x80000000) == 0)
    {
LABEL_6:
      char v3 = this;
      goto LABEL_8;
    }
  }
  else if ((SHIBYTE(this[2].__vftable) & 0x80000000) == 0)
  {
    goto LABEL_6;
  }
  operator delete(this[1].__vftable);
  char v3 = this;
LABEL_8:
  std::runtime_error::~runtime_error(v3);
}

void sub_246CEE9A0(std::runtime_error *this)
{
  this[4].__imp_.__imp_ = (const char *)&unk_26FB3E0D8;
  uint64_t v2 = this[5].__vftable;
  if (v2 && (*((unsigned int (**)(std::runtime_error_vtbl *))v2->~runtime_error + 4))(v2)) {
    this[5].__vftable = 0;
  }
  this->__vftable = (std::runtime_error_vtbl *)&unk_26FB3E390;
  if (SHIBYTE(this[3].__imp_.__imp_) < 0)
  {
    operator delete((void *)this[2].__imp_.__imp_);
    if ((SHIBYTE(this[2].__vftable) & 0x80000000) == 0) {
      goto LABEL_6;
    }
  }
  else if ((SHIBYTE(this[2].__vftable) & 0x80000000) == 0)
  {
    goto LABEL_6;
  }
  operator delete(this[1].__vftable);
LABEL_6:
  std::runtime_error::~runtime_error(this);
  JUMPOUT(0x24C5471E0);
}

void sub_246CEEA90(void *a1)
{
  *a1 = &unk_26FB3E0D8;
  uint64_t v2 = a1[1];
  if (v2 && (*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
    a1[1] = 0;
  }
  *(a1 - 9) = &unk_26FB3E390;
  if (*((char *)a1 - 9) < 0)
  {
    operator delete((void *)*(a1 - 4));
    if ((*((char *)a1 - 33) & 0x80000000) == 0)
    {
LABEL_6:
      char v3 = (std::runtime_error *)(a1 - 9);
      goto LABEL_8;
    }
  }
  else if ((*((char *)a1 - 33) & 0x80000000) == 0)
  {
    goto LABEL_6;
  }
  operator delete((void *)*(a1 - 7));
  char v3 = (std::runtime_error *)(a1 - 9);
LABEL_8:
  std::runtime_error::~runtime_error(v3);
}

void sub_246CEEB80(void *a1)
{
  *a1 = &unk_26FB3E0D8;
  uint64_t v2 = a1[1];
  if (v2 && (*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
    a1[1] = 0;
  }
  *(a1 - 9) = &unk_26FB3E390;
  if (*((char *)a1 - 9) < 0)
  {
    operator delete((void *)*(a1 - 4));
    if ((*((char *)a1 - 33) & 0x80000000) == 0) {
      goto LABEL_6;
    }
  }
  else if ((*((char *)a1 - 33) & 0x80000000) == 0)
  {
    goto LABEL_6;
  }
  operator delete((void *)*(a1 - 7));
LABEL_6:
  std::runtime_error::~runtime_error((std::runtime_error *)(a1 - 9));
  JUMPOUT(0x24C5471E0);
}

void sub_246CEEC70(std::runtime_error *this)
{
  this->__vftable = (std::runtime_error_vtbl *)&unk_26FB3E390;
  if (SHIBYTE(this[3].__imp_.__imp_) < 0)
  {
    operator delete((void *)this[2].__imp_.__imp_);
    if ((SHIBYTE(this[2].__vftable) & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  else if ((SHIBYTE(this[2].__vftable) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(this[1].__vftable);
LABEL_3:
  std::runtime_error::~runtime_error(this);
  JUMPOUT(0x24C5471E0);
}

void sub_246CEED00(std::runtime_error *this)
{
  this->__vftable = (std::runtime_error_vtbl *)&unk_26FB3E390;
  if (SHIBYTE(this[3].__imp_.__imp_) < 0)
  {
    operator delete((void *)this[2].__imp_.__imp_);
    if ((SHIBYTE(this[2].__vftable) & 0x80000000) == 0)
    {
LABEL_3:
      uint64_t v2 = this;
      goto LABEL_5;
    }
  }
  else if ((SHIBYTE(this[2].__vftable) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(this[1].__vftable);
  uint64_t v2 = this;
LABEL_5:
  std::runtime_error::~runtime_error(v2);
}

void sub_246CEED98(std::runtime_error *this)
{
  this->__vftable = (std::runtime_error_vtbl *)&unk_26FB3E390;
  if (SHIBYTE(this[3].__imp_.__imp_) < 0)
  {
    operator delete((void *)this[2].__imp_.__imp_);
    if ((SHIBYTE(this[2].__vftable) & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  else if ((SHIBYTE(this[2].__vftable) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(this[1].__vftable);
LABEL_3:
  std::runtime_error::~runtime_error(this);
  JUMPOUT(0x24C5471E0);
}

uint64_t sub_246CEEE2C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26FB3E058;
  std::runtime_error::runtime_error((std::runtime_error *)(a1 + 8), (const std::runtime_error *)(a2 + 8));
  *(void *)(a1 + 8) = &unk_26FB3E390;
  if (*(char *)(a2 + 47) < 0)
  {
    sub_246CC5E50((unsigned char *)(a1 + 24), *(void **)(a2 + 24), *(void *)(a2 + 32));
  }
  else
  {
    long long v4 = *(_OWORD *)(a2 + 24);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = v4;
  }
  int v5 = (unsigned char *)(a1 + 48);
  if (*(char *)(a2 + 71) < 0)
  {
    sub_246CC5E50(v5, *(void **)(a2 + 48), *(void *)(a2 + 56));
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 48);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(_OWORD *)int v5 = v6;
  }
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 8) = &unk_26FB3E368;
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = &unk_26FB3E0D8;
  *(void *)(a1 + 88) = v7;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 24))(v7);
  }
  long long v8 = *(_OWORD *)(a2 + 96);
  *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = v8;
  *(void *)a1 = &unk_26FB3E2F0;
  *(void *)(a1 + 8) = &unk_26FB3E320;
  *(void *)(a1 + 80) = &unk_26FB3E348;
  return a1;
}

void sub_246CEEFD4(_Unwind_Exception *a1)
{
  if (*(char *)(v2 + 47) < 0)
  {
    operator delete(*v3);
    std::runtime_error::~runtime_error(v1);
    _Unwind_Resume(a1);
  }
  std::runtime_error::~runtime_error(v1);
  _Unwind_Resume(a1);
}

void sub_246CEF00C(_Unwind_Exception *a1)
{
  sub_246CEE620(v1);
  _Unwind_Resume(a1);
}

std::runtime_error *sub_246CEF020(std::runtime_error *a1, void **a2, long long *a3, std::runtime_error_vtbl *a4)
{
  sub_246CC7148((uint64_t)v28);
  if (*((char *)a3 + 23) < 0)
  {
    if (*((void *)a3 + 1)) {
      long long v8 = *(const char **)a3;
    }
    else {
      long long v8 = "<unspecified file>";
    }
  }
  else if (*((unsigned char *)a3 + 23))
  {
    long long v8 = (const char *)a3;
  }
  else
  {
    long long v8 = "<unspecified file>";
  }
  size_t v9 = strlen(v8);
  sub_246CC7924(v29, (uint64_t)v8, v9);
  if (a4)
  {
    char v39 = 40;
    sub_246CC7924(v29, (uint64_t)&v39, 1);
    size_t v10 = (void *)std::ostream::operator<<();
    char v39 = 41;
    sub_246CC7924(v10, (uint64_t)&v39, 1);
  }
  char v11 = sub_246CC7924(v29, (uint64_t)": ", 2);
  int v12 = *((char *)a2 + 23);
  if (v12 >= 0) {
    size_t v13 = a2;
  }
  else {
    size_t v13 = *a2;
  }
  if (v12 >= 0) {
    uint64_t v14 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    uint64_t v14 = (uint64_t)a2[1];
  }
  sub_246CC7924(v11, (uint64_t)v13, v14);
  if ((v37 & 0x10) != 0)
  {
    unint64_t v17 = v36;
    if (v36 < v33)
    {
      unint64_t v36 = v33;
      unint64_t v17 = v33;
    }
    uint64_t v18 = v32;
    std::string::size_type v15 = v17 - (void)v32;
    if (v17 - (unint64_t)v32 >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_41;
    }
  }
  else
  {
    if ((v37 & 8) == 0)
    {
      std::string::size_type v15 = 0;
      *((unsigned char *)&__dst.__r_.__value_.__s + 23) = 0;
      p_dst = &__dst;
      goto LABEL_29;
    }
    uint64_t v18 = v30;
    std::string::size_type v15 = v31 - (void)v30;
    if ((unint64_t)(v31 - (void)v30) >= 0x7FFFFFFFFFFFFFF8) {
LABEL_41:
    }
      sub_246CC5D0C();
  }
  if (v15 >= 0x17)
  {
    uint64_t v19 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17) {
      uint64_t v19 = v15 | 7;
    }
    uint64_t v20 = v19 + 1;
    p_dst = (std::string *)operator new(v19 + 1);
    __dst.__r_.__value_.__l.__size_ = v15;
    __dst.__r_.__value_.__r.__words[2] = v20 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_28;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v15;
  p_dst = &__dst;
  if (v15) {
LABEL_28:
  }
    memmove(p_dst, v18, v15);
LABEL_29:
  p_dst->__r_.__value_.__s.__data_[v15] = 0;
  v28[0] = *MEMORY[0x263F8C2B8];
  uint64_t v21 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v28 + *(void *)(v28[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v29[0] = v21;
  v29[1] = MEMORY[0x263F8C318] + 16;
  if (v35 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x24C547150](&v38);
  std::runtime_error::runtime_error(a1, &__dst);
  a1->__vftable = (std::runtime_error_vtbl *)&unk_26FB3E0B0;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__dst.__r_.__value_.__l.__data_);
    a1->__vftable = (std::runtime_error_vtbl *)&unk_26FB3E390;
    uint64_t v22 = a1 + 1;
    if ((*((char *)a2 + 23) & 0x80000000) == 0) {
      goto LABEL_33;
    }
  }
  else
  {
    a1->__vftable = (std::runtime_error_vtbl *)&unk_26FB3E390;
    uint64_t v22 = a1 + 1;
    if ((*((char *)a2 + 23) & 0x80000000) == 0)
    {
LABEL_33:
      std::runtime_error v23 = *(std::runtime_error *)a2;
      v22[1].__vftable = (std::runtime_error_vtbl *)a2[2];
      std::runtime_error *v22 = v23;
      goto LABEL_36;
    }
  }
  sub_246CC5E50(v22, *a2, (unint64_t)a2[1]);
LABEL_36:
  p_imp = &a1[2].__imp_;
  if (*((char *)a3 + 23) < 0)
  {
    sub_246CC5E50(p_imp, *(void **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v25 = *a3;
    a1[3].__imp_.__imp_ = (const char *)*((void *)a3 + 2);
    *(_OWORD *)&p_imp->__imp_ = v25;
  }
  a1[4].__vftable = a4;
  return a1;
}

void sub_246CEF3E4(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 39) < 0)
  {
    operator delete(*v2);
    std::runtime_error::~runtime_error((std::runtime_error *)v1);
    _Unwind_Resume(a1);
  }
  std::runtime_error::~runtime_error((std::runtime_error *)v1);
  _Unwind_Resume(a1);
}

void sub_246CEF41C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_246CEF44C(void *a1, uint64_t *a2)
{
  char v3 = (unsigned __int8 *)*a2;
  int v4 = *(char *)*a2;
  if (v4 != 33)
  {
    if (v4 == 63)
    {
      *a2 = (uint64_t)(v3 + 1);
      int v5 = v3[1];
      if ((v5 | 0x20) == 0x78 && (v3[2] | 0x20) == 0x6D && (v3[3] | 0x20) == 0x6C)
      {
        int v6 = (char)v3[4];
        if (v6 < 0) {
          LOBYTE(v6) = 122;
        }
        if (byte_246D20753[v6])
        {
          for (uint64_t i = v3 + 5; ; ++i)
          {
            *a2 = (uint64_t)i;
            if (*i == 63)
            {
              if (i[1] == 62)
              {
                uint64_t v8 = 0;
                size_t v9 = i + 2;
                goto LABEL_60;
              }
            }
            else if (!*i)
            {
              goto LABEL_57;
            }
          }
        }
      }
      for (j = v3 + 2; ; ++j)
      {
        if (v5 == 63)
        {
          if (*j == 62)
          {
            uint64_t v8 = 0;
            size_t v9 = j + 1;
            goto LABEL_60;
          }
        }
        else if (!(_BYTE)v5)
        {
          goto LABEL_57;
        }
        *a2 = (uint64_t)j;
        char v15 = *j;
        LOBYTE(v5) = v15;
      }
    }
    uint64_t v8 = a1[13] + (-*((unsigned char *)a1 + 104) & 7);
    uint64_t v144 = a2;
    if ((unint64_t)(v8 + 96) > a1[14])
    {
      int v12 = (uint64_t (*)(uint64_t))a1[8207];
      if (!v12) {
        operator new[]();
      }
      uint64_t v13 = v12(65558);
      unint64_t v24 = (void *)(v13 + (-(int)v13 & 7));
      void *v24 = a1[12];
      a1[12] = v13;
      a1[14] = v13 + 65558;
      uint64_t v8 = (uint64_t)v24 + (-(v24 + 8) & 7) + 8;
      a2 = v144;
    }
    uint64_t v25 = 0;
    a1[13] = v8 + 96;
    *(void *)(v8 + 32) = 0;
    *(void *)uint64_t v8 = 0;
    *(void *)(v8 + 8) = 0;
    *(_DWORD *)(v8 + 40) = 1;
    *(void *)(v8 + 48) = 0;
    long long v26 = (uint64_t *)(v8 + 48);
    *(void *)(v8 + 64) = 0;
    unint64_t v27 = (char ***)(v8 + 64);
    uint64_t v28 = *a2;
    do
    {
      int v29 = *(char *)(v28 + v25);
      if (v29 < 0) {
        LOBYTE(v29) = 122;
      }
      ++v25;
    }
    while (byte_246D20853[v29]);
    *a2 = v28 + v25 - 1;
    uint64_t v30 = v25 - 1;
    if (!v30)
    {
      uint64_t v140 = a2;
      exception = __cxa_allocate_exception(0x18uLL);
      uint64_t v22 = *v140;
      std::runtime_error v23 = "expected element name";
      goto LABEL_58;
    }
    *(void *)uint64_t v8 = v28;
    *(void *)(v8 + 16) = v30;
    uint64_t v31 = (char *)(*a2 - 1);
    do
    {
      int v33 = *++v31;
      unsigned __int8 v32 = v33;
      if (v33 < 0) {
        unsigned __int8 v32 = 122;
      }
    }
    while (byte_246D20753[v32]);
    *a2 = (uint64_t)v31;
    int v34 = *v31;
    if (v34 >= 0) {
      unsigned __int8 v35 = *v31;
    }
    else {
      unsigned __int8 v35 = 122;
    }
    unint64_t v142 = (uint64_t *)(v8 + 48);
    uint64_t v143 = v8;
    if (byte_246D20953[v35])
    {
      unint64_t v36 = (uint64_t (**)(uint64_t))(a1 + 8207);
      int v37 = &unk_246D20B53;
      while (1)
      {
        uint64_t v38 = 0;
        *a2 = (uint64_t)(v31 + 1);
        do
        {
          int v39 = v31[v38 + 1];
          if (v39 < 0) {
            LOBYTE(v39) = 122;
          }
          ++v38;
        }
        while (byte_246D20953[v39]);
        *a2 = (uint64_t)&v31[v38];
        if (!v38)
        {
          __n128 v134 = __cxa_allocate_exception(0x18uLL);
          __n128 v135 = "expected attribute name";
          goto LABEL_329;
        }
        int64x2_t v40 = (char **)(a1[13] + (-*((unsigned char *)a1 + 104) & 7));
        if ((unint64_t)(v40 + 7) > a1[14])
        {
          int64x2_t v41 = v37;
          if (!*v36) {
            operator new[]();
          }
          uint64_t v42 = (*v36)(65558);
          unint64_t v43 = (void *)(v42 + (-(int)v42 & 7));
          void *v43 = a1[12];
          a1[12] = v42;
          a1[14] = v42 + 65558;
          int64x2_t v40 = (char **)((char *)v43 + (-(v43 + 8) & 7) + 8);
          uint64_t v8 = v143;
          a2 = v144;
          long long v26 = v142;
          int v37 = v41;
        }
        a1[13] = v40 + 7;
        v40[4] = 0;
        *int64x2_t v40 = 0;
        v40[1] = 0;
        uint64_t v44 = *a2 - (void)v31;
        *int64x2_t v40 = v31;
        void v40[2] = (char *)v44;
        int64x2_t v45 = *v27;
        if (*v27)
        {
          int64x2_t v45 = *(char ***)(v8 + 72);
          int64x2_t v46 = (char ***)(v45 + 6);
        }
        else
        {
          int64x2_t v46 = v27;
        }
        *int64x2_t v46 = v40;
        v40[5] = (char *)v45;
        *(void *)(v8 + 72) = v40;
        v40[4] = (char *)v8;
        v40[6] = 0;
        int v47 = (char *)*a2;
        do
        {
          int v49 = *v47++;
          unsigned __int8 v48 = v49;
          if (v49 < 0) {
            unsigned __int8 v48 = 122;
          }
        }
        while (byte_246D20753[v48]);
        *a2 = (uint64_t)(v47 - 1);
        if (*(v47 - 1) != 61) {
          break;
        }
        *a2 = (uint64_t)v47;
        int8x16_t v50 = *v40;
        if (!*v40)
        {
          int8x16_t v50 = &byte_2691E2758;
          uint64_t v44 = 0;
        }
        v50[v44] = 0;
        uint64_t v51 = *a2;
        int64x2_t v52 = (char *)*a2;
        do
        {
          uint32x4_t v53 = v52;
          int v55 = *v52++;
          unsigned __int8 v54 = v55;
          if (v55 < 0) {
            unsigned __int8 v54 = 122;
          }
          ++v51;
        }
        while (byte_246D20753[v54]);
        *a2 = (uint64_t)(v52 - 1);
        int v56 = *(v52 - 1);
        if (v56 != 34 && v56 != 39) {
          goto LABEL_325;
        }
        *a2 = (uint64_t)v52;
        if (v56 != 39)
        {
          do
          {
            int v61 = *++v53;
            unsigned __int8 v60 = v61;
            if (v61 < 0) {
              unsigned __int8 v60 = 122;
            }
          }
          while (byte_246D20C53[v60]);
          *a2 = (uint64_t)v53;
          unint64_t v59 = v53;
          while (1)
          {
            while (1)
            {
LABEL_159:
              int v75 = *v59;
              if ((v75 & 0x80u) == 0) {
                int v76 = *v59;
              }
              else {
                int v76 = 122;
              }
              if (!v76 || v76 == 34) {
                goto LABEL_206;
              }
              if (v75 == 38) {
                break;
              }
LABEL_158:
              ++v59;
              *v53++ = v75;
            }
            switch(v59[1])
            {
              case 'a':
                int v77 = v59[2];
                if (v77 != 112)
                {
                  if (v77 == 109 && v59[3] == 112 && v59[4] == 59)
                  {
                    *v53++ = 38;
                    v59 += 5;
                    goto LABEL_159;
                  }
                  goto LABEL_158;
                }
                if (v59[3] != 111 || v59[4] != 115 || v59[5] != 59) {
                  goto LABEL_158;
                }
                char v83 = 39;
LABEL_199:
                *v53++ = v83;
                v59 += 6;
                goto LABEL_159;
              case 'b':
              case 'c':
              case 'd':
              case 'e':
              case 'f':
              case 'h':
              case 'i':
              case 'j':
              case 'k':
              case 'm':
              case 'n':
              case 'o':
              case 'p':
                goto LABEL_158;
              case 'g':
                if (v59[2] != 116 || v59[3] != 59) {
                  goto LABEL_158;
                }
                char v82 = 62;
                goto LABEL_183;
              case 'l':
                if (v59[2] != 116 || v59[3] != 59) {
                  goto LABEL_158;
                }
                char v82 = 60;
LABEL_183:
                *v53++ = v82;
                v59 += 4;
                goto LABEL_159;
              case 'q':
                if (v59[2] != 117 || v59[3] != 111 || v59[4] != 116 || v59[5] != 59) {
                  goto LABEL_158;
                }
                char v83 = 34;
                goto LABEL_199;
              default:
                if (v59[1] != 35) {
                  goto LABEL_158;
                }
                uint64_t v31 = v59 + 2;
                if (v59[2] == 120)
                {
                  unint64_t v78 = 0;
                  do
                  {
                    unint64_t v79 = v78;
                    unsigned int v80 = *++v31;
                    uint64_t v81 = byte_246D20A53[v80];
                    unint64_t v78 = v81 + 16 * v78;
                  }
                  while (v81 != 255);
                  if (v79 <= 0x7F) {
                    goto LABEL_192;
                  }
                }
                else
                {
                  unint64_t v84 = 0;
                  uint64_t v31 = v59 + 1;
                  do
                  {
                    unint64_t v79 = v84;
                    unsigned int v85 = *++v31;
                    uint64_t v86 = byte_246D20A53[v85];
                    unint64_t v84 = v86 + 10 * v84;
                  }
                  while (v86 != 255);
                  if (v79 <= 0x7F)
                  {
LABEL_192:
                    uint64_t v87 = 1;
                    goto LABEL_204;
                  }
                }
                if (v79 > 0x7FF)
                {
                  if (v79 >> 16)
                  {
                    if (v79 >> 16 > 0x10)
                    {
LABEL_331:
                      __n128 v139 = __cxa_allocate_exception(0x18uLL);
                      void *v139 = &unk_26FB3E3B8;
                      v139[1] = "invalid numeric character entity";
                      v139[2] = v53;
                      __cxa_throw(v139, (struct type_info *)&unk_26FB3E250, (void (*)(void *))std::exception::~exception);
                    }
                    void v53[3] = v79 & 0x3F | 0x80;
                    v53[2] = (v79 >> 6) & 0x3F | 0x80;
                    v53[1] = (v79 >> 12) & 0x3F | 0x80;
                    LODWORD(v79) = (v79 >> 18) | 0xFFFFFFF0;
                    uint64_t v87 = 4;
                  }
                  else
                  {
                    v53[2] = v79 & 0x3F | 0x80;
                    v53[1] = (v79 >> 6) & 0x3F | 0x80;
                    LODWORD(v79) = (v79 >> 12) | 0xFFFFFFE0;
                    uint64_t v87 = 3;
                  }
                }
                else
                {
                  v53[1] = v79 & 0x3F | 0x80;
                  LODWORD(v79) = (v79 >> 6) | 0xFFFFFFC0;
                  uint64_t v87 = 2;
                }
LABEL_204:
                *uint32x4_t v53 = v79;
                if (*v31 != 59)
                {
LABEL_328:
                  __n128 v134 = __cxa_allocate_exception(0x18uLL);
                  __n128 v135 = "expected ;";
LABEL_329:
                  void *v134 = &unk_26FB3E3B8;
                  v134[1] = v135;
                  v134[2] = v31;
                  __cxa_throw(v134, (struct type_info *)&unk_26FB3E250, (void (*)(void *))std::exception::~exception);
                }
                v53 += v87;
                unint64_t v59 = v31 + 1;
                break;
            }
          }
        }
        do
        {
          int v58 = *++v53;
          unsigned __int8 v57 = v58;
          if (v58 < 0) {
            unsigned __int8 v57 = 122;
          }
        }
        while (v37[v57]);
        *a2 = (uint64_t)v53;
        unint64_t v59 = v53;
        while (1)
        {
          int v62 = *v59;
          int v63 = (v62 & 0x80u) == 0 ? *v59 : 122;
          if (!v63 || v63 == 39) {
            break;
          }
          if (v62 == 38)
          {
            switch(v59[1])
            {
              case 'a':
                int v64 = v59[2];
                if (v64 != 112)
                {
                  if (v64 == 109 && v59[3] == 112 && v59[4] == 59)
                  {
                    *v53++ = 38;
                    v59 += 5;
                    continue;
                  }
                  goto LABEL_110;
                }
                if (v59[3] != 111 || v59[4] != 115 || v59[5] != 59) {
                  goto LABEL_110;
                }
                char v70 = 39;
LABEL_151:
                *v53++ = v70;
                v59 += 6;
                continue;
              case 'b':
              case 'c':
              case 'd':
              case 'e':
              case 'f':
              case 'h':
              case 'i':
              case 'j':
              case 'k':
              case 'm':
              case 'n':
              case 'o':
              case 'p':
                goto LABEL_110;
              case 'g':
                if (v59[2] != 116 || v59[3] != 59) {
                  goto LABEL_110;
                }
                char v69 = 62;
                goto LABEL_135;
              case 'l':
                if (v59[2] != 116 || v59[3] != 59) {
                  goto LABEL_110;
                }
                char v69 = 60;
LABEL_135:
                *v53++ = v69;
                v59 += 4;
                continue;
              case 'q':
                if (v59[2] != 117 || v59[3] != 111 || v59[4] != 116 || v59[5] != 59) {
                  goto LABEL_110;
                }
                char v70 = 34;
                goto LABEL_151;
              default:
                if (v59[1] != 35) {
                  goto LABEL_110;
                }
                uint64_t v31 = v59 + 2;
                if (v59[2] == 120)
                {
                  unint64_t v65 = 0;
                  do
                  {
                    unint64_t v66 = v65;
                    unsigned int v67 = *++v31;
                    uint64_t v68 = byte_246D20A53[v67];
                    unint64_t v65 = v68 + 16 * v65;
                  }
                  while (v68 != 255);
                  if (v66 <= 0x7F) {
                    goto LABEL_144;
                  }
                }
                else
                {
                  unint64_t v71 = 0;
                  uint64_t v31 = v59 + 1;
                  do
                  {
                    unint64_t v66 = v71;
                    unsigned int v72 = *++v31;
                    uint64_t v73 = byte_246D20A53[v72];
                    unint64_t v71 = v73 + 10 * v71;
                  }
                  while (v73 != 255);
                  if (v66 <= 0x7F)
                  {
LABEL_144:
                    uint64_t v74 = 1;
                    goto LABEL_156;
                  }
                }
                if (v66 > 0x7FF)
                {
                  if (v66 >> 16)
                  {
                    if (v66 >> 16 > 0x10) {
                      goto LABEL_331;
                    }
                    void v53[3] = v66 & 0x3F | 0x80;
                    v53[2] = (v66 >> 6) & 0x3F | 0x80;
                    v53[1] = (v66 >> 12) & 0x3F | 0x80;
                    LODWORD(v66) = (v66 >> 18) | 0xFFFFFFF0;
                    uint64_t v74 = 4;
                  }
                  else
                  {
                    v53[2] = v66 & 0x3F | 0x80;
                    v53[1] = (v66 >> 6) & 0x3F | 0x80;
                    LODWORD(v66) = (v66 >> 12) | 0xFFFFFFE0;
                    uint64_t v74 = 3;
                  }
                }
                else
                {
                  v53[1] = v66 & 0x3F | 0x80;
                  LODWORD(v66) = (v66 >> 6) | 0xFFFFFFC0;
                  uint64_t v74 = 2;
                }
LABEL_156:
                *uint32x4_t v53 = v66;
                if (*v31 != 59) {
                  goto LABEL_328;
                }
                v53 += v74;
                unint64_t v59 = v31 + 1;
                break;
            }
          }
          else
          {
LABEL_110:
            ++v59;
            *v53++ = v62;
          }
        }
LABEL_206:
        *a2 = (uint64_t)v59;
        uint16x8_t v88 = &v53[-v51];
        v40[1] = v52;
        v40[3] = v88;
        if (*(unsigned __int8 *)*a2 != v56)
        {
LABEL_325:
          __n128 v136 = a2;
          exception = __cxa_allocate_exception(0x18uLL);
          uint64_t v22 = *v136;
          std::runtime_error v23 = "expected ' or \"";
          goto LABEL_58;
        }
        ++*a2;
        uint32x4_t v89 = v40[1];
        if (!v89)
        {
          uint32x4_t v89 = &byte_2691E2758;
          uint16x8_t v88 = 0;
        }
        v88[(void)v89] = 0;
        uint64_t v31 = (char *)(*a2 - 1);
        do
        {
          int v91 = *++v31;
          unsigned __int8 v90 = v91;
          if (v91 < 0) {
            unsigned __int8 v90 = 122;
          }
        }
        while (byte_246D20753[v90]);
        *a2 = (uint64_t)v31;
        int v34 = *v31;
        if (v34 >= 0) {
          unsigned __int8 v92 = *v31;
        }
        else {
          unsigned __int8 v92 = 122;
        }
        if (!byte_246D20953[v92]) {
          goto LABEL_217;
        }
      }
      __n128 v137 = a2;
      exception = __cxa_allocate_exception(0x18uLL);
      uint64_t v22 = *v137;
      std::runtime_error v23 = "expected =";
LABEL_58:
      void *exception = &unk_26FB3E3B8;
      exception[1] = v23;
      exception[2] = v22;
      __cxa_throw(exception, (struct type_info *)&unk_26FB3E250, (void (*)(void *))std::exception::~exception);
    }
LABEL_217:
    if (v34 != 47)
    {
      if (v34 == 62)
      {
        *a2 = (uint64_t)(v31 + 1);
        uint64_t v141 = (uint64_t (**)(uint64_t))(a1 + 8207);
        while (1)
        {
          unint64_t v95 = (char *)(*a2 - 1);
          do
          {
            int v97 = *++v95;
            unsigned __int8 v96 = v97;
            if (v97 < 0) {
              unsigned __int8 v96 = 122;
            }
          }
          while (byte_246D20753[v96]);
          *a2 = (uint64_t)v95;
          char v98 = *v95;
          while (v98 != 60)
          {
            if (!v98) {
              goto LABEL_57;
            }
            uint64_t v99 = *a2;
            uint64_t v31 = (char *)(*a2 - 1);
            do
            {
              int v101 = *++v31;
              unsigned __int8 v100 = v101;
              if (v101 < 0) {
                unsigned __int8 v100 = 122;
              }
            }
            while (byte_246D20D53[v100]);
            *a2 = (uint64_t)v31;
            uint64_t v102 = v31;
            while (1)
            {
              int v103 = *v102;
              uint64_t v104 = (v103 & 0x80u) == 0 ? *v102 : 122;
              if (!v104 || v104 == 60) {
                break;
              }
              if (v103 == 38)
              {
                switch(v102[1])
                {
                  case 'a':
                    int v105 = v102[2];
                    if (v105 != 112)
                    {
                      if (v105 == 109 && v102[3] == 112 && v102[4] == 59)
                      {
                        *v31++ = 38;
                        v102 += 5;
                        continue;
                      }
                      goto LABEL_278;
                    }
                    if (v102[3] != 111 || v102[4] != 115 || v102[5] != 59) {
                      goto LABEL_278;
                    }
                    char v112 = 39;
LABEL_277:
                    *v31++ = v112;
                    v102 += 6;
                    continue;
                  case 'b':
                  case 'c':
                  case 'd':
                  case 'e':
                  case 'f':
                  case 'h':
                  case 'i':
                  case 'j':
                  case 'k':
                  case 'm':
                  case 'n':
                  case 'o':
                  case 'p':
                    goto LABEL_278;
                  case 'g':
                    if (v102[2] != 116 || v102[3] != 59) {
                      goto LABEL_278;
                    }
                    char v111 = 62;
                    goto LABEL_266;
                  case 'l':
                    if (v102[2] != 116 || v102[3] != 59) {
                      goto LABEL_278;
                    }
                    char v111 = 60;
LABEL_266:
                    *v31++ = v111;
                    v102 += 4;
                    continue;
                  case 'q':
                    if (v102[2] != 117 || v102[3] != 111 || v102[4] != 116 || v102[5] != 59) {
                      goto LABEL_278;
                    }
                    char v112 = 34;
                    goto LABEL_277;
                  default:
                    if (v102[1] != 35) {
                      goto LABEL_278;
                    }
                    unint64_t v106 = v102 + 2;
                    if (v102[2] == 120)
                    {
                      unint64_t v107 = 0;
                      do
                      {
                        unint64_t v108 = v107;
                        unsigned int v109 = *++v106;
                        uint64_t v110 = byte_246D20A53[v109];
                        unint64_t v107 = v110 + 16 * v107;
                      }
                      while (v110 != 255);
                      if (v108 <= 0x7F) {
                        goto LABEL_270;
                      }
                    }
                    else
                    {
                      unint64_t v113 = 0;
                      unint64_t v106 = v102 + 1;
                      do
                      {
                        unint64_t v108 = v113;
                        unsigned int v114 = *++v106;
                        uint64_t v115 = byte_246D20A53[v114];
                        unint64_t v113 = v115 + 10 * v113;
                      }
                      while (v115 != 255);
                      if (v108 <= 0x7F)
                      {
LABEL_270:
                        uint64_t v116 = 1;
                        goto LABEL_288;
                      }
                    }
                    if (v108 > 0x7FF)
                    {
                      if (v108 >> 16)
                      {
                        if (v108 >> 16 > 0x10)
                        {
                          __n128 v134 = __cxa_allocate_exception(0x18uLL);
                          __n128 v135 = "invalid numeric character entity";
                          goto LABEL_329;
                        }
                        v31[3] = v108 & 0x3F | 0x80;
                        v31[2] = (v108 >> 6) & 0x3F | 0x80;
                        v31[1] = (v108 >> 12) & 0x3F | 0x80;
                        LODWORD(v108) = (v108 >> 18) | 0xFFFFFFF0;
                        uint64_t v116 = 4;
                      }
                      else
                      {
                        v31[2] = v108 & 0x3F | 0x80;
                        v31[1] = (v108 >> 6) & 0x3F | 0x80;
                        LODWORD(v108) = (v108 >> 12) | 0xFFFFFFE0;
                        uint64_t v116 = 3;
                      }
                    }
                    else
                    {
                      v31[1] = v108 & 0x3F | 0x80;
                      LODWORD(v108) = (v108 >> 6) | 0xFFFFFFC0;
                      uint64_t v116 = 2;
                    }
LABEL_288:
                    *uint64_t v31 = v108;
                    if (*v106 != 59)
                    {
                      __n128 v133 = __cxa_allocate_exception(0x18uLL);
                      void *v133 = &unk_26FB3E3B8;
                      v133[1] = "expected ;";
                      v133[2] = v106;
                      __cxa_throw(v133, (struct type_info *)&unk_26FB3E250, (void (*)(void *))std::exception::~exception);
                    }
                    v31 += v116;
                    uint64_t v102 = v106 + 1;
                    break;
                }
              }
              else
              {
LABEL_278:
                if (byte_246D20753[v104])
                {
                  *uint64_t v31 = 32;
                  do
                  {
                    int v118 = *++v102;
                    unsigned __int8 v117 = v118;
                    if (v118 < 0) {
                      unsigned __int8 v117 = 122;
                    }
                  }
                  while (byte_246D20753[v117]);
                  ++v31;
                }
                else
                {
                  ++v102;
                  *v31++ = v103;
                }
              }
            }
            *a2 = (uint64_t)v102;
            if (*(v31 - 1) == 32) {
              --v31;
            }
            uint64_t v119 = a1[13] + (-*((unsigned char *)a1 + 104) & 7);
            if ((unint64_t)(v119 + 96) > a1[14])
            {
              if (!*v141) {
                operator new[]();
              }
              uint64_t v120 = (*v141)(65558);
              __n128 v121 = (void *)(v120 + (-(int)v120 & 7));
              *__n128 v121 = a1[12];
              a1[12] = v120;
              a1[14] = v120 + 65558;
              uint64_t v119 = (uint64_t)v121 + (-(v121 + 8) & 7) + 8;
              uint64_t v8 = v143;
              a2 = v144;
              long long v26 = v142;
            }
            a1[13] = v119 + 96;
            *(_DWORD *)(v119 + 40) = 2;
            *(void *)(v119 + 48) = 0;
            *(void *)(v119 + 64) = 0;
            *(void *)uint64_t v119 = 0;
            *(void *)(v119 + 8) = v99;
            *(void *)(v119 + 24) = &v31[-v99];
            uint64_t v122 = *v26;
            if (*v26)
            {
              uint64_t v122 = *(void *)(v8 + 56);
              __n128 v123 = (uint64_t *)(v122 + 88);
            }
            else
            {
              __n128 v123 = v26;
            }
            uint64_t *v123 = v119;
            *(void *)(v119 + 80) = v122;
            *(void *)(v8 + 56) = v119;
            *(void *)(v119 + 32) = v8;
            *(void *)(v119 + 88) = 0;
            __n128 v124 = *(char **)(v8 + 8);
            if (!v124) {
              __n128 v124 = &byte_2691E2758;
            }
            if (!*v124)
            {
              *(void *)(v8 + 8) = v99;
              *(void *)(v8 + 24) = &v31[-v99];
            }
            char v98 = *(unsigned char *)*a2;
            *uint64_t v31 = 0;
          }
          __n128 v125 = (unsigned char *)*a2;
          int v126 = *(unsigned __int8 *)(*a2 + 1);
          if (v126 == 47)
          {
            *a2 = (uint64_t)(v125 + 2);
            __n128 v127 = v125 + 1;
            do
            {
              int v129 = *++v127;
              unsigned __int8 v128 = v129;
              if (v129 < 0) {
                unsigned __int8 v128 = 122;
              }
            }
            while (byte_246D20853[v128]);
            *a2 = (uint64_t)v127;
            do
            {
              int v131 = *v127++;
              unsigned __int8 v130 = v131;
              if (v131 < 0) {
                unsigned __int8 v130 = 122;
              }
            }
            while (byte_246D20753[v130]);
            *a2 = (uint64_t)(v127 - 1);
            if (*(v127 - 1) != 62) {
              goto LABEL_330;
            }
            *a2 = (uint64_t)v127;
          }
          else
          {
            ++*a2;
            __n128 v132 = (void *)sub_246CEF44C(a1, v144, v26, &byte_2691E2758);
            long long v26 = v142;
            uint64_t v8 = v143;
            a2 = v144;
            if (v132)
            {
              uint64_t v93 = *v142;
              if (*v142)
              {
                uint64_t v93 = *(void *)(v143 + 56);
                unint64_t v94 = (uint64_t *)(v93 + 88);
              }
              else
              {
                unint64_t v94 = v142;
              }
              uint64_t *v94 = (uint64_t)v132;
              v132[10] = v93;
              *(void *)(v143 + 56) = v132;
              v132[4] = v143;
              v132[11] = 0;
            }
          }
          if (v126 == 47) {
            goto LABEL_319;
          }
        }
      }
      goto LABEL_330;
    }
    *a2 = (uint64_t)(v31 + 1);
    if (v31[1] != 62)
    {
LABEL_330:
      __n128 v138 = a2;
      exception = __cxa_allocate_exception(0x18uLL);
      uint64_t v22 = *v138;
      std::runtime_error v23 = "expected >";
      goto LABEL_58;
    }
    *a2 = (uint64_t)(v31 + 2);
LABEL_319:
    if (*(void *)v8) {
      *(unsigned char *)(*(void *)v8 + *(void *)(v8 + 16)) = 0;
    }
    else {
      byte_2691E2758 = 0;
    }
    return v8;
  }
  int v10 = (char)v3[1];
  if (v10 == 45)
  {
    if (v3[2] == 45)
    {
      for (k = v3 + 3; ; ++k)
      {
        *a2 = (uint64_t)k;
        if (*k == 45)
        {
          if (k[1] == 45 && k[2] == 62)
          {
            uint64_t v8 = 0;
            size_t v9 = k + 3;
            goto LABEL_60;
          }
        }
        else if (!*k)
        {
LABEL_57:
          uint64_t v20 = a2;
          exception = __cxa_allocate_exception(0x18uLL);
          uint64_t v22 = *v20;
          std::runtime_error v23 = "unexpected end of data";
          goto LABEL_58;
        }
      }
    }
    goto LABEL_54;
  }
  if (v10 == 68)
  {
    if (v3[2] == 79 && v3[3] == 67 && v3[4] == 84 && v3[5] == 89 && v3[6] == 80 && v3[7] == 69)
    {
      int v17 = (char)v3[8];
      if (v17 < 0) {
        LOBYTE(v17) = 122;
      }
      if (byte_246D20753[v17])
      {
        *a2 = (uint64_t)(v3 + 9);
        sub_246CF0A08(a2);
        return 0;
      }
    }
LABEL_54:
    size_t v9 = v3 + 1;
    while (1)
    {
      *a2 = (uint64_t)v9;
      int v19 = *v9++;
      int v18 = v19;
      if (v19 == 62) {
        break;
      }
      if (!v18) {
        goto LABEL_57;
      }
    }
    uint64_t v8 = 0;
LABEL_60:
    *a2 = (uint64_t)v9;
    return v8;
  }
  if (v10 != 91 || v3[2] != 67 || v3[3] != 68 || v3[4] != 65 || v3[5] != 84 || v3[6] != 65 || v3[7] != 91) {
    goto LABEL_54;
  }
  *a2 = (uint64_t)(v3 + 8);
  return sub_246CF0884(a1, a2);
}

uint64_t sub_246CF0884(void *a1, void *a2)
{
  int v4 = (unsigned char *)*a2;
  for (uint64_t i = (unsigned char *)(*a2 + 1); *(i - 1) != 93; ++i)
  {
    if (!*(i - 1))
    {
      exception = __cxa_allocate_exception(0x18uLL);
      uint64_t v13 = *a2;
      void *exception = &unk_26FB3E3B8;
      exception[1] = "unexpected end of data";
      exception[2] = v13;
      __cxa_throw(exception, (struct type_info *)&unk_26FB3E250, (void (*)(void *))std::exception::~exception);
    }
LABEL_3:
    *a2 = i;
  }
  if (*i != 93 || i[1] != 62) {
    goto LABEL_3;
  }
  unint64_t v6 = a1[14];
  uint64_t result = a1[13] + (-*((unsigned char *)a1 + 104) & 7);
  if (result + 96 > v6)
  {
    uint64_t v8 = (uint64_t (*)(uint64_t))a1[8207];
    if (!v8) {
      operator new[]();
    }
    uint64_t v9 = v8(65558);
    int v10 = (void *)(v9 + (-(int)v9 & 7));
    void *v10 = a1[12];
    a1[12] = v9;
    a1[14] = v9 + 65558;
    uint64_t result = (uint64_t)v10 + (-(v10 + 8) & 7) + 8;
  }
  a1[13] = result + 96;
  *(void *)(result + 32) = 0;
  *(void *)uint64_t result = 0;
  *(void *)(result + 8) = 0;
  *(_DWORD *)(result + 40) = 3;
  *(void *)(result + 48) = 0;
  *(void *)(result + 64) = 0;
  uint64_t v11 = *a2 - (void)v4;
  *(void *)(result + 8) = v4;
  *(void *)(result + 24) = v11;
  *(unsigned char *)*a2 = 0;
  *a2 += 3;
  return result;
}

uint64_t *sub_246CF0A08(uint64_t *result)
{
  uint64_t v1 = (unsigned char *)*result;
LABEL_2:
  while (1)
  {
    int v2 = *v1;
    if (v2 == 62) {
      break;
    }
    if (*v1 == 91)
    {
      void *result = (uint64_t)++v1;
      int v3 = 1;
      while (1)
      {
        int v4 = (char)*v1;
        if (v4 == 91)
        {
          ++v3;
        }
        else if (v4 == 93)
        {
          --v3;
        }
        else if (!*v1)
        {
          goto LABEL_15;
        }
        void *result = (uint64_t)++v1;
        if (v3 <= 0) {
          goto LABEL_2;
        }
      }
    }
    if (!(_BYTE)v2)
    {
LABEL_15:
      int v5 = result;
      exception = __cxa_allocate_exception(0x18uLL);
      uint64_t v7 = *v5;
      void *exception = &unk_26FB3E3B8;
      exception[1] = "unexpected end of data";
      exception[2] = v7;
      __cxa_throw(exception, (struct type_info *)&unk_26FB3E250, (void (*)(void *))std::exception::~exception);
    }
    void *result = (uint64_t)++v1;
  }
  void *result = (uint64_t)(v1 + 1);
  return result;
}

void sub_246CF0AF8(std::exception *a1)
{
  std::exception::~exception(a1);
  JUMPOUT(0x24C5471E0);
}

uint64_t sub_246CF0B30(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t sub_246CF0B38(void *a1, uint64_t *a2)
{
  int v4 = (unsigned __int8 *)*a2;
  int v5 = *(char *)*a2;
  if (v5 != 33)
  {
    if (v5 == 63)
    {
      *a2 = (uint64_t)(v4 + 1);
      int v6 = v4[1];
      if ((v6 | 0x20) == 0x78 && (v4[2] | 0x20) == 0x6D && (v4[3] | 0x20) == 0x6C)
      {
        int v7 = (char)v4[4];
        if (v7 < 0) {
          LOBYTE(v7) = 122;
        }
        if (byte_246D20753[v7])
        {
          for (uint64_t i = v4 + 5; ; ++i)
          {
            *a2 = (uint64_t)i;
            if (*i == 63)
            {
              if (i[1] == 62)
              {
                uint64_t v9 = 0;
                int v10 = i + 2;
                goto LABEL_60;
              }
            }
            else if (!*i)
            {
              goto LABEL_57;
            }
          }
        }
      }
      for (j = v4 + 2; ; ++j)
      {
        if (v6 == 63)
        {
          if (*j == 62)
          {
            uint64_t v9 = 0;
            int v10 = j + 1;
            goto LABEL_60;
          }
        }
        else if (!(_BYTE)v6)
        {
          goto LABEL_57;
        }
        *a2 = (uint64_t)j;
        char v16 = *j;
        LOBYTE(v6) = v16;
      }
    }
    uint64_t v9 = a1[13] + (-*((unsigned char *)a1 + 104) & 7);
    if ((unint64_t)(v9 + 96) > a1[14])
    {
      uint64_t v13 = (uint64_t (*)(uint64_t))a1[8207];
      if (!v13) {
        operator new[]();
      }
      uint64_t v14 = v13(65558);
      unint64_t v24 = (void *)(v14 + (-(int)v14 & 7));
      void *v24 = a1[12];
      a1[12] = v14;
      a1[14] = v14 + 65558;
      uint64_t v9 = (uint64_t)v24 + (-(v24 + 8) & 7) + 8;
    }
    uint64_t v25 = 0;
    a1[13] = v9 + 96;
    *(void *)(v9 + 32) = 0;
    *(void *)uint64_t v9 = 0;
    *(void *)(v9 + 8) = 0;
    *(_DWORD *)(v9 + 40) = 1;
    *(void *)(v9 + 48) = 0;
    long long v26 = (uint64_t *)(v9 + 48);
    *(void *)(v9 + 64) = 0;
    unint64_t v27 = (uint64_t *)(v9 + 64);
    uint64_t v28 = *a2;
    do
    {
      int v29 = *(char *)(v28 + v25);
      if (v29 < 0) {
        LOBYTE(v29) = 122;
      }
      ++v25;
    }
    while (byte_246D20853[v29]);
    *a2 = v28 + v25 - 1;
    uint64_t v30 = v25 - 1;
    if (!v30)
    {
      exception = __cxa_allocate_exception(0x18uLL);
      uint64_t v22 = (unsigned char *)*a2;
      std::runtime_error v23 = "expected element name";
      goto LABEL_58;
    }
    *(void *)uint64_t v9 = v28;
    *(void *)(v9 + 16) = v30;
    uint64_t v31 = (unsigned __int8 *)(*a2 - 1);
    do
    {
      int v33 = (char)*++v31;
      unsigned __int8 v32 = v33;
      if (v33 < 0) {
        unsigned __int8 v32 = 122;
      }
    }
    while (byte_246D20753[v32]);
    *a2 = (uint64_t)v31;
    int v34 = (char)*v31;
    if (v34 >= 0) {
      unsigned __int8 v35 = *v31;
    }
    else {
      unsigned __int8 v35 = 122;
    }
    __n128 v137 = (uint64_t *)(v9 + 48);
    if (byte_246D20953[v35])
    {
      __n128 v135 = a1 + 8207;
      unint64_t v36 = &unk_246D20B53;
      while (1)
      {
        uint64_t v37 = 0;
        *a2 = (uint64_t)(v31 + 1);
        do
        {
          int v38 = (char)v31[v37 + 1];
          if (v38 < 0) {
            LOBYTE(v38) = 122;
          }
          ++v37;
        }
        while (byte_246D20953[v38]);
        *a2 = (uint64_t)&v31[v37];
        if (!v37)
        {
          __n128 v132 = __cxa_allocate_exception(0x18uLL);
          __n128 v133 = "expected attribute name";
          goto LABEL_317;
        }
        int v39 = (char **)(a1[13] + (-*((unsigned char *)a1 + 104) & 7));
        if ((unint64_t)(v39 + 7) > a1[14])
        {
          int64x2_t v40 = v36;
          if (!*v135) {
            operator new[]();
          }
          uint64_t v41 = ((uint64_t (*)(uint64_t, unsigned char *, char *, uint64_t))*v135)(65558, byte_246D20753, &byte_2691E2758, 10);
          uint64_t v42 = (void *)(v41 + (-(int)v41 & 7));
          void *v42 = a1[12];
          a1[12] = v41;
          a1[14] = v41 + 65558;
          int v39 = (char **)((char *)v42 + (-(v42 + 8) & 7) + 8);
          long long v26 = (uint64_t *)(v9 + 48);
          unint64_t v36 = v40;
        }
        a1[13] = v39 + 7;
        v39[4] = 0;
        *int v39 = 0;
        v39[1] = 0;
        uint64_t v43 = *a2 - (void)v31;
        *int v39 = (char *)v31;
        v39[2] = (char *)v43;
        uint64_t v44 = *v27;
        if (*v27)
        {
          uint64_t v44 = *(void *)(v9 + 72);
          int64x2_t v45 = (char ***)(v44 + 48);
        }
        else
        {
          int64x2_t v45 = (char ***)(v9 + 64);
        }
        __n128 *v45 = v39;
        v39[5] = (char *)v44;
        *(void *)(v9 + 72) = v39;
        v39[4] = (char *)v9;
        v39[6] = 0;
        int64x2_t v46 = (char *)*a2;
        do
        {
          int v48 = *v46++;
          unsigned __int8 v47 = v48;
          if (v48 < 0) {
            unsigned __int8 v47 = 122;
          }
        }
        while (byte_246D20753[v47]);
        *a2 = (uint64_t)(v46 - 1);
        if (*(v46 - 1) != 61) {
          break;
        }
        *a2 = (uint64_t)v46;
        int v49 = *v39;
        if (!*v39)
        {
          int v49 = &byte_2691E2758;
          uint64_t v43 = 0;
        }
        v49[v43] = 0;
        uint64_t v50 = *a2;
        uint64_t v51 = (char *)*a2;
        do
        {
          int64x2_t v52 = v51;
          int v54 = *v51++;
          unsigned __int8 v53 = v54;
          if (v54 < 0) {
            unsigned __int8 v53 = 122;
          }
          ++v50;
        }
        while (byte_246D20753[v53]);
        *a2 = (uint64_t)(v51 - 1);
        int v55 = *(v51 - 1);
        if (v55 != 34 && v55 != 39) {
          goto LABEL_313;
        }
        *a2 = (uint64_t)v51;
        if (v55 != 39)
        {
          do
          {
            int v60 = *++v52;
            unsigned __int8 v59 = v60;
            if (v60 < 0) {
              unsigned __int8 v59 = 122;
            }
          }
          while (byte_246D20C53[v59]);
          *a2 = (uint64_t)v52;
          int v58 = v52;
          while (1)
          {
            while (1)
            {
LABEL_159:
              int v74 = *v58;
              if ((v74 & 0x80u) == 0) {
                int v75 = *v58;
              }
              else {
                int v75 = 122;
              }
              if (!v75 || v75 == 34) {
                goto LABEL_206;
              }
              if (v74 == 38) {
                break;
              }
LABEL_158:
              ++v58;
              *v52++ = v74;
            }
            switch(v58[1])
            {
              case 'a':
                int v76 = v58[2];
                if (v76 != 112)
                {
                  if (v76 == 109 && v58[3] == 112 && v58[4] == 59)
                  {
                    *v52++ = 38;
                    v58 += 5;
                    goto LABEL_159;
                  }
                  goto LABEL_158;
                }
                if (v58[3] != 111 || v58[4] != 115 || v58[5] != 59) {
                  goto LABEL_158;
                }
                char v82 = 39;
LABEL_199:
                *v52++ = v82;
                v58 += 6;
                goto LABEL_159;
              case 'b':
              case 'c':
              case 'd':
              case 'e':
              case 'f':
              case 'h':
              case 'i':
              case 'j':
              case 'k':
              case 'm':
              case 'n':
              case 'o':
              case 'p':
                goto LABEL_158;
              case 'g':
                if (v58[2] != 116 || v58[3] != 59) {
                  goto LABEL_158;
                }
                char v81 = 62;
                goto LABEL_183;
              case 'l':
                if (v58[2] != 116 || v58[3] != 59) {
                  goto LABEL_158;
                }
                char v81 = 60;
LABEL_183:
                *v52++ = v81;
                v58 += 4;
                goto LABEL_159;
              case 'q':
                if (v58[2] != 117 || v58[3] != 111 || v58[4] != 116 || v58[5] != 59) {
                  goto LABEL_158;
                }
                char v82 = 34;
                goto LABEL_199;
              default:
                if (v58[1] != 35) {
                  goto LABEL_158;
                }
                uint64_t v31 = (unsigned __int8 *)(v58 + 2);
                if (v58[2] == 120)
                {
                  unint64_t v77 = 0;
                  do
                  {
                    unint64_t v78 = v77;
                    int v79 = *++v31;
                    uint64_t v80 = byte_246D20A53[v79];
                    unint64_t v77 = v80 + 16 * v77;
                  }
                  while (v80 != 255);
                  if (v78 <= 0x7F) {
                    goto LABEL_192;
                  }
                }
                else
                {
                  unint64_t v83 = 0;
                  uint64_t v31 = (unsigned __int8 *)(v58 + 1);
                  do
                  {
                    unint64_t v78 = v83;
                    int v84 = *++v31;
                    uint64_t v85 = byte_246D20A53[v84];
                    unint64_t v83 = v85 + 10 * v83;
                  }
                  while (v85 != 255);
                  if (v78 <= 0x7F)
                  {
LABEL_192:
                    uint64_t v86 = 1;
                    goto LABEL_204;
                  }
                }
                if (v78 > 0x7FF)
                {
                  if (v78 >> 16)
                  {
                    if (v78 >> 16 > 0x10)
                    {
LABEL_319:
                      __n128 v134 = __cxa_allocate_exception(0x18uLL);
                      void *v134 = &unk_26FB3E3B8;
                      v134[1] = "invalid numeric character entity";
                      v134[2] = v52;
                      __cxa_throw(v134, (struct type_info *)&unk_26FB3E250, (void (*)(void *))std::exception::~exception);
                    }
                    v52[3] = v78 & 0x3F | 0x80;
                    v52[2] = (v78 >> 6) & 0x3F | 0x80;
                    v52[1] = (v78 >> 12) & 0x3F | 0x80;
                    LODWORD(v78) = (v78 >> 18) | 0xFFFFFFF0;
                    uint64_t v86 = 4;
                  }
                  else
                  {
                    v52[2] = v78 & 0x3F | 0x80;
                    v52[1] = (v78 >> 6) & 0x3F | 0x80;
                    LODWORD(v78) = (v78 >> 12) | 0xFFFFFFE0;
                    uint64_t v86 = 3;
                  }
                }
                else
                {
                  v52[1] = v78 & 0x3F | 0x80;
                  LODWORD(v78) = (v78 >> 6) | 0xFFFFFFC0;
                  uint64_t v86 = 2;
                }
LABEL_204:
                *int64x2_t v52 = v78;
                if (*v31 != 59)
                {
LABEL_316:
                  __n128 v132 = __cxa_allocate_exception(0x18uLL);
                  __n128 v133 = "expected ;";
LABEL_317:
                  void *v132 = &unk_26FB3E3B8;
                  v132[1] = v133;
                  v132[2] = v31;
                  __cxa_throw(v132, (struct type_info *)&unk_26FB3E250, (void (*)(void *))std::exception::~exception);
                }
                v52 += v86;
                int v58 = (char *)(v31 + 1);
                break;
            }
          }
        }
        do
        {
          int v57 = *++v52;
          unsigned __int8 v56 = v57;
          if (v57 < 0) {
            unsigned __int8 v56 = 122;
          }
        }
        while (v36[v56]);
        *a2 = (uint64_t)v52;
        int v58 = v52;
        while (1)
        {
          int v61 = *v58;
          int v62 = (v61 & 0x80u) == 0 ? *v58 : 122;
          if (!v62 || v62 == 39) {
            break;
          }
          if (v61 == 38)
          {
            switch(v58[1])
            {
              case 'a':
                int v63 = v58[2];
                if (v63 != 112)
                {
                  if (v63 == 109 && v58[3] == 112 && v58[4] == 59)
                  {
                    *v52++ = 38;
                    v58 += 5;
                    continue;
                  }
                  goto LABEL_110;
                }
                if (v58[3] != 111 || v58[4] != 115 || v58[5] != 59) {
                  goto LABEL_110;
                }
                char v69 = 39;
LABEL_151:
                *v52++ = v69;
                v58 += 6;
                continue;
              case 'b':
              case 'c':
              case 'd':
              case 'e':
              case 'f':
              case 'h':
              case 'i':
              case 'j':
              case 'k':
              case 'm':
              case 'n':
              case 'o':
              case 'p':
                goto LABEL_110;
              case 'g':
                if (v58[2] != 116 || v58[3] != 59) {
                  goto LABEL_110;
                }
                char v68 = 62;
                goto LABEL_135;
              case 'l':
                if (v58[2] != 116 || v58[3] != 59) {
                  goto LABEL_110;
                }
                char v68 = 60;
LABEL_135:
                *v52++ = v68;
                v58 += 4;
                continue;
              case 'q':
                if (v58[2] != 117 || v58[3] != 111 || v58[4] != 116 || v58[5] != 59) {
                  goto LABEL_110;
                }
                char v69 = 34;
                goto LABEL_151;
              default:
                if (v58[1] != 35) {
                  goto LABEL_110;
                }
                uint64_t v31 = (unsigned __int8 *)(v58 + 2);
                if (v58[2] == 120)
                {
                  unint64_t v64 = 0;
                  do
                  {
                    unint64_t v65 = v64;
                    int v66 = *++v31;
                    uint64_t v67 = byte_246D20A53[v66];
                    unint64_t v64 = v67 + 16 * v64;
                  }
                  while (v67 != 255);
                  if (v65 <= 0x7F) {
                    goto LABEL_144;
                  }
                }
                else
                {
                  unint64_t v70 = 0;
                  uint64_t v31 = (unsigned __int8 *)(v58 + 1);
                  do
                  {
                    unint64_t v65 = v70;
                    int v71 = *++v31;
                    uint64_t v72 = byte_246D20A53[v71];
                    unint64_t v70 = v72 + 10 * v70;
                  }
                  while (v72 != 255);
                  if (v65 <= 0x7F)
                  {
LABEL_144:
                    uint64_t v73 = 1;
                    goto LABEL_156;
                  }
                }
                if (v65 > 0x7FF)
                {
                  if (v65 >> 16)
                  {
                    if (v65 >> 16 > 0x10) {
                      goto LABEL_319;
                    }
                    v52[3] = v65 & 0x3F | 0x80;
                    v52[2] = (v65 >> 6) & 0x3F | 0x80;
                    v52[1] = (v65 >> 12) & 0x3F | 0x80;
                    LODWORD(v65) = (v65 >> 18) | 0xFFFFFFF0;
                    uint64_t v73 = 4;
                  }
                  else
                  {
                    v52[2] = v65 & 0x3F | 0x80;
                    v52[1] = (v65 >> 6) & 0x3F | 0x80;
                    LODWORD(v65) = (v65 >> 12) | 0xFFFFFFE0;
                    uint64_t v73 = 3;
                  }
                }
                else
                {
                  v52[1] = v65 & 0x3F | 0x80;
                  LODWORD(v65) = (v65 >> 6) | 0xFFFFFFC0;
                  uint64_t v73 = 2;
                }
LABEL_156:
                *int64x2_t v52 = v65;
                if (*v31 != 59) {
                  goto LABEL_316;
                }
                v52 += v73;
                int v58 = (char *)(v31 + 1);
                break;
            }
          }
          else
          {
LABEL_110:
            ++v58;
            *v52++ = v61;
          }
        }
LABEL_206:
        *a2 = (uint64_t)v58;
        uint64_t v87 = &v52[-v50];
        v39[1] = v51;
        v39[3] = v87;
        if (*(unsigned __int8 *)*a2 != v55)
        {
LABEL_313:
          exception = __cxa_allocate_exception(0x18uLL);
          uint64_t v22 = (unsigned char *)*a2;
          std::runtime_error v23 = "expected ' or \"";
          goto LABEL_58;
        }
        ++*a2;
        uint16x8_t v88 = v39[1];
        if (!v88)
        {
          uint16x8_t v88 = &byte_2691E2758;
          uint64_t v87 = 0;
        }
        v87[(void)v88] = 0;
        uint64_t v31 = (unsigned __int8 *)(*a2 - 1);
        do
        {
          int v90 = (char)*++v31;
          unsigned __int8 v89 = v90;
          if (v90 < 0) {
            unsigned __int8 v89 = 122;
          }
        }
        while (byte_246D20753[v89]);
        *a2 = (uint64_t)v31;
        int v34 = (char)*v31;
        if (v34 >= 0) {
          unsigned __int8 v91 = *v31;
        }
        else {
          unsigned __int8 v91 = 122;
        }
        if (!byte_246D20953[v91]) {
          goto LABEL_217;
        }
      }
      exception = __cxa_allocate_exception(0x18uLL);
      uint64_t v22 = (unsigned char *)*a2;
      std::runtime_error v23 = "expected =";
LABEL_58:
      void *exception = &unk_26FB3E3B8;
      exception[1] = v23;
      exception[2] = v22;
      __cxa_throw(exception, (struct type_info *)&unk_26FB3E250, (void (*)(void *))std::exception::~exception);
    }
LABEL_217:
    if (v34 != 47)
    {
      if (v34 == 62)
      {
        *a2 = (uint64_t)(v31 + 1);
        __n128 v136 = a1 + 8207;
        while (1)
        {
          uint64_t v94 = *a2;
          uint64_t v96 = *a2 - 1;
          char v95 = *(unsigned char *)*a2;
          while (v95 != 60)
          {
            if (!v95) {
              goto LABEL_57;
            }
            *a2 = v94;
            int v97 = (char *)v96;
            do
            {
              int v99 = *++v97;
              unsigned __int8 v98 = v99;
              if (v99 < 0) {
                unsigned __int8 v98 = 122;
              }
            }
            while (byte_246D20E53[v98]);
            *a2 = (uint64_t)v97;
            unsigned __int8 v100 = v97;
            while (1)
            {
              int v101 = *v100;
              int v102 = (v101 & 0x80u) == 0 ? *v100 : 122;
              if (!v102 || v102 == 60) {
                break;
              }
              if (v101 == 38)
              {
                switch(v100[1])
                {
                  case 'a':
                    int v103 = v100[2];
                    if (v103 != 112)
                    {
                      if (v103 == 109 && v100[3] == 112 && v100[4] == 59)
                      {
                        *v97++ = 38;
                        v100 += 5;
                        continue;
                      }
                      goto LABEL_232;
                    }
                    if (v100[3] != 111 || v100[4] != 115 || v100[5] != 59) {
                      goto LABEL_232;
                    }
                    char v110 = 39;
LABEL_273:
                    *v97++ = v110;
                    v100 += 6;
                    continue;
                  case 'b':
                  case 'c':
                  case 'd':
                  case 'e':
                  case 'f':
                  case 'h':
                  case 'i':
                  case 'j':
                  case 'k':
                  case 'm':
                  case 'n':
                  case 'o':
                  case 'p':
                    goto LABEL_232;
                  case 'g':
                    if (v100[2] != 116 || v100[3] != 59) {
                      goto LABEL_232;
                    }
                    char v109 = 62;
                    goto LABEL_262;
                  case 'l':
                    if (v100[2] != 116 || v100[3] != 59) {
                      goto LABEL_232;
                    }
                    char v109 = 60;
LABEL_262:
                    *v97++ = v109;
                    v100 += 4;
                    continue;
                  case 'q':
                    if (v100[2] != 117 || v100[3] != 111 || v100[4] != 116 || v100[5] != 59) {
                      goto LABEL_232;
                    }
                    char v110 = 34;
                    goto LABEL_273;
                  default:
                    if (v100[1] != 35) {
                      goto LABEL_232;
                    }
                    uint64_t v104 = v100 + 2;
                    if (v100[2] == 120)
                    {
                      unint64_t v105 = 0;
                      do
                      {
                        unint64_t v106 = v105;
                        int v107 = *++v104;
                        uint64_t v108 = byte_246D20A53[v107];
                        unint64_t v105 = v108 + 16 * v105;
                      }
                      while (v108 != 255);
                      if (v106 <= 0x7F) {
                        goto LABEL_266;
                      }
                    }
                    else
                    {
                      unint64_t v111 = 0;
                      uint64_t v104 = v100 + 1;
                      do
                      {
                        unint64_t v106 = v111;
                        int v112 = *++v104;
                        uint64_t v113 = byte_246D20A53[v112];
                        unint64_t v111 = v113 + 10 * v111;
                      }
                      while (v113 != 255);
                      if (v106 <= 0x7F)
                      {
LABEL_266:
                        uint64_t v114 = 1;
                        goto LABEL_278;
                      }
                    }
                    if (v106 > 0x7FF)
                    {
                      if (v106 >> 16)
                      {
                        if (v106 >> 16 > 0x10)
                        {
                          int v131 = __cxa_allocate_exception(0x18uLL);
                          *int v131 = &unk_26FB3E3B8;
                          v131[1] = "invalid numeric character entity";
                          v131[2] = v97;
                          __cxa_throw(v131, (struct type_info *)&unk_26FB3E250, (void (*)(void *))std::exception::~exception);
                        }
                        v97[3] = v106 & 0x3F | 0x80;
                        v97[2] = (v106 >> 6) & 0x3F | 0x80;
                        v97[1] = (v106 >> 12) & 0x3F | 0x80;
                        LODWORD(v106) = (v106 >> 18) | 0xFFFFFFF0;
                        uint64_t v114 = 4;
                      }
                      else
                      {
                        v97[2] = v106 & 0x3F | 0x80;
                        v97[1] = (v106 >> 6) & 0x3F | 0x80;
                        LODWORD(v106) = (v106 >> 12) | 0xFFFFFFE0;
                        uint64_t v114 = 3;
                      }
                    }
                    else
                    {
                      v97[1] = v106 & 0x3F | 0x80;
                      LODWORD(v106) = (v106 >> 6) | 0xFFFFFFC0;
                      uint64_t v114 = 2;
                    }
LABEL_278:
                    *int v97 = v106;
                    if (*v104 != 59)
                    {
                      unsigned __int8 v130 = __cxa_allocate_exception(0x18uLL);
                      void *v130 = &unk_26FB3E3B8;
                      v130[1] = "expected ;";
                      v130[2] = v104;
                      __cxa_throw(v130, (struct type_info *)&unk_26FB3E250, (void (*)(void *))std::exception::~exception);
                    }
                    v97 += v114;
                    unsigned __int8 v100 = v104 + 1;
                    break;
                }
              }
              else
              {
LABEL_232:
                ++v100;
                *v97++ = v101;
              }
            }
            *a2 = (uint64_t)v100;
            uint64_t v115 = a1[13] + (-*((unsigned char *)a1 + 104) & 7);
            if ((unint64_t)(v115 + 96) > a1[14])
            {
              uint64_t v116 = v96;
              if (!*v136) {
                operator new[]();
              }
              uint64_t v117 = ((uint64_t (*)(uint64_t, unsigned char *, char *))*v136)(65558, byte_246D20753, &byte_2691E2758);
              int v118 = (void *)(v117 + (-(int)v117 & 7));
              *int v118 = a1[12];
              a1[12] = v117;
              a1[14] = v117 + 65558;
              uint64_t v115 = (uint64_t)v118 + (-(v118 + 8) & 7) + 8;
              long long v26 = (uint64_t *)(v9 + 48);
              uint64_t v96 = v116;
            }
            a1[13] = v115 + 96;
            *(_DWORD *)(v115 + 40) = 2;
            *(void *)(v115 + 48) = 0;
            *(void *)(v115 + 64) = 0;
            *(void *)uint64_t v115 = 0;
            *(void *)(v115 + 8) = v94;
            *(void *)(v115 + 24) = &v97[-v94];
            uint64_t v119 = *v26;
            if (*v26)
            {
              uint64_t v119 = *(void *)(v9 + 56);
              uint64_t v120 = (uint64_t *)(v119 + 88);
            }
            else
            {
              uint64_t v120 = v26;
            }
            uint64_t *v120 = v115;
            *(void *)(v115 + 80) = v119;
            *(void *)(v9 + 56) = v115;
            *(void *)(v115 + 32) = v9;
            *(void *)(v115 + 88) = 0;
            __n128 v121 = *(char **)(v9 + 8);
            if (!v121) {
              __n128 v121 = &byte_2691E2758;
            }
            if (!*v121)
            {
              *(void *)(v9 + 8) = v94;
              *(void *)(v9 + 24) = &v97[-v94];
            }
            char v95 = *(unsigned char *)*a2;
            *int v97 = 0;
          }
          uint64_t v122 = (unsigned char *)*a2;
          int v123 = *(unsigned __int8 *)(*a2 + 1);
          if (v123 == 47)
          {
            *a2 = (uint64_t)(v122 + 2);
            __n128 v124 = v122 + 1;
            do
            {
              int v126 = *++v124;
              unsigned __int8 v125 = v126;
              if (v126 < 0) {
                unsigned __int8 v125 = 122;
              }
            }
            while (byte_246D20853[v125]);
            *a2 = (uint64_t)v124;
            do
            {
              int v128 = *v124++;
              unsigned __int8 v127 = v128;
              if (v128 < 0) {
                unsigned __int8 v127 = 122;
              }
            }
            while (byte_246D20753[v127]);
            *a2 = (uint64_t)(v124 - 1);
            if (*(v124 - 1) != 62) {
              goto LABEL_318;
            }
            *a2 = (uint64_t)v124;
          }
          else
          {
            ++*a2;
            int v129 = (void *)sub_246CF0B38(a1, a2, &byte_2691E2758);
            long long v26 = (uint64_t *)(v9 + 48);
            if (v129)
            {
              uint64_t v92 = *v137;
              if (*v137)
              {
                uint64_t v92 = *(void *)(v9 + 56);
                uint64_t v93 = (void *)(v92 + 88);
              }
              else
              {
                uint64_t v93 = (void *)(v9 + 48);
              }
              *uint64_t v93 = v129;
              v129[10] = v92;
              *(void *)(v9 + 56) = v129;
              v129[4] = v9;
              v129[11] = 0;
            }
          }
          if (v123 == 47) {
            goto LABEL_307;
          }
        }
      }
      goto LABEL_318;
    }
    *a2 = (uint64_t)(v31 + 1);
    if (v31[1] != 62)
    {
LABEL_318:
      exception = __cxa_allocate_exception(0x18uLL);
      uint64_t v22 = (unsigned char *)*a2;
      std::runtime_error v23 = "expected >";
      goto LABEL_58;
    }
    *a2 = (uint64_t)(v31 + 2);
LABEL_307:
    if (*(void *)v9) {
      *(unsigned char *)(*(void *)v9 + *(void *)(v9 + 16)) = 0;
    }
    else {
      byte_2691E2758 = 0;
    }
    return v9;
  }
  int v11 = (char)v4[1];
  if (v11 == 45)
  {
    if (v4[2] == 45)
    {
      for (k = v4 + 3; ; ++k)
      {
        *a2 = (uint64_t)k;
        if (*k == 45)
        {
          if (k[1] == 45 && k[2] == 62)
          {
            uint64_t v9 = 0;
            int v10 = k + 3;
            goto LABEL_60;
          }
        }
        else if (!*k)
        {
LABEL_57:
          exception = __cxa_allocate_exception(0x18uLL);
          uint64_t v22 = (unsigned char *)*a2;
          std::runtime_error v23 = "unexpected end of data";
          goto LABEL_58;
        }
      }
    }
    goto LABEL_54;
  }
  if (v11 == 68)
  {
    if (v4[2] == 79 && v4[3] == 67 && v4[4] == 84 && v4[5] == 89 && v4[6] == 80 && v4[7] == 69)
    {
      int v18 = (char)v4[8];
      if (v18 < 0) {
        LOBYTE(v18) = 122;
      }
      if (byte_246D20753[v18])
      {
        *a2 = (uint64_t)(v4 + 9);
        sub_246CF0A08(a2);
        return 0;
      }
    }
LABEL_54:
    int v10 = v4 + 1;
    while (1)
    {
      *a2 = (uint64_t)v10;
      int v20 = *v10++;
      int v19 = v20;
      if (v20 == 62) {
        break;
      }
      if (!v19) {
        goto LABEL_57;
      }
    }
    uint64_t v9 = 0;
LABEL_60:
    *a2 = (uint64_t)v10;
    return v9;
  }
  if (v11 != 91 || v4[2] != 67 || v4[3] != 68 || v4[4] != 65 || v4[5] != 84 || v4[6] != 65 || v4[7] != 91) {
    goto LABEL_54;
  }
  *a2 = (uint64_t)(v4 + 8);
  return sub_246CF0884(a1, a2);
}

uint64_t sub_246CF1F38(void *a1, uint64_t *a2)
{
  int v2 = a1;
  int v3 = (unsigned __int8 *)*a2;
  int v4 = *(char *)*a2;
  uint64_t v149 = a2;
  if (v4 != 33)
  {
    if (v4 == 63)
    {
      *a2 = (uint64_t)(v3 + 1);
      int v5 = v3[1];
      if ((v5 | 0x20) == 0x78 && (v3[2] | 0x20) == 0x6D && (v3[3] | 0x20) == 0x6C)
      {
        int v6 = (char)v3[4];
        if (v6 < 0) {
          LOBYTE(v6) = 122;
        }
        if (byte_246D20753[v6])
        {
          for (uint64_t i = v3 + 5; ; ++i)
          {
            *a2 = (uint64_t)i;
            if (*i == 63)
            {
              if (i[1] == 62)
              {
                uint64_t v8 = 0;
                uint64_t v9 = i + 2;
                goto LABEL_62;
              }
            }
            else if (!*i)
            {
              goto LABEL_59;
            }
          }
        }
      }
      for (j = v3 + 2; ; ++j)
      {
        if (v5 == 63)
        {
          if (*j == 62)
          {
            uint64_t v8 = 0;
            uint64_t v9 = j + 1;
            goto LABEL_62;
          }
        }
        else if (!(_BYTE)v5)
        {
          goto LABEL_59;
        }
        *a2 = (uint64_t)j;
        char v15 = *j;
        LOBYTE(v5) = v15;
      }
    }
    uint64_t v8 = a1[13] + (-*((unsigned char *)a1 + 104) & 7);
    if ((unint64_t)(v8 + 96) > a1[14])
    {
      int v12 = (uint64_t (*)(uint64_t))a1[8207];
      if (!v12) {
        operator new[]();
      }
      uint64_t v13 = v12(65558);
      unint64_t v27 = (void *)(v13 + (-(int)v13 & 7));
      int v2 = a1;
      a2 = v149;
      void *v27 = a1[12];
      a1[12] = v13;
      a1[14] = v13 + 65558;
      uint64_t v8 = (uint64_t)v27 + (-(v27 + 8) & 7) + 8;
    }
    uint64_t v28 = 0;
    v2[13] = v8 + 96;
    *(void *)(v8 + 32) = 0;
    *(void *)uint64_t v8 = 0;
    *(void *)(v8 + 8) = 0;
    *(_DWORD *)(v8 + 40) = 1;
    *(void *)(v8 + 48) = 0;
    int v29 = (uint64_t *)(v8 + 48);
    *(void *)(v8 + 64) = 0;
    uint64_t v30 = (uint64_t *)(v8 + 64);
    uint64_t v31 = *a2;
    do
    {
      int v32 = *(char *)(v31 + v28);
      if (v32 < 0) {
        LOBYTE(v32) = 122;
      }
      ++v28;
    }
    while (byte_246D20853[v32]);
    *a2 = v31 + v28 - 1;
    uint64_t v33 = v28 - 1;
    if (!v33)
    {
      unint64_t v145 = a2;
      exception = __cxa_allocate_exception(0x18uLL);
      uint64_t v25 = *v145;
      long long v26 = "expected element name";
      goto LABEL_60;
    }
    *(void *)uint64_t v8 = v31;
    *(void *)(v8 + 16) = v33;
    int v34 = (char *)(*a2 - 1);
    do
    {
      int v36 = *++v34;
      unsigned __int8 v35 = v36;
      if (v36 < 0) {
        unsigned __int8 v35 = 122;
      }
    }
    while (byte_246D20753[v35]);
    *a2 = (uint64_t)v34;
    int v37 = *v34;
    if (v37 >= 0) {
      unsigned __int8 v38 = *v34;
    }
    else {
      unsigned __int8 v38 = 122;
    }
    unint64_t v147 = (uint64_t *)(v8 + 48);
    if (byte_246D20953[v38])
    {
      int v39 = (uint64_t (**)(uint64_t))(v2 + 8207);
      int64x2_t v40 = &unk_246D20B53;
      while (1)
      {
        uint64_t v41 = 0;
        *a2 = (uint64_t)(v34 + 1);
        do
        {
          int v42 = v34[v41 + 1];
          if (v42 < 0) {
            LOBYTE(v42) = 122;
          }
          ++v41;
        }
        while (byte_246D20953[v42]);
        *a2 = (uint64_t)&v34[v41];
        if (!v41)
        {
          __n128 v139 = __cxa_allocate_exception(0x18uLL);
          uint64_t v140 = "expected attribute name";
          goto LABEL_333;
        }
        uint64_t v43 = (char **)(v2[13] + (-*((unsigned char *)v2 + 104) & 7));
        if ((unint64_t)(v43 + 7) > v2[14])
        {
          uint64_t v44 = v40;
          if (!*v39) {
            operator new[]();
          }
          uint64_t v45 = (*v39)(65558);
          int64x2_t v46 = (void *)(v45 + (-(int)v45 & 7));
          int v2 = a1;
          a2 = v149;
          *int64x2_t v46 = a1[12];
          a1[12] = v45;
          a1[14] = v45 + 65558;
          uint64_t v43 = (char **)((char *)v46 + (-(v46 + 8) & 7) + 8);
          int v29 = (uint64_t *)(v8 + 48);
          int64x2_t v40 = v44;
        }
        v2[13] = v43 + 7;
        v43[4] = 0;
        void *v43 = 0;
        v43[1] = 0;
        uint64_t v47 = *a2 - (void)v34;
        void *v43 = v34;
        v43[2] = (char *)v47;
        uint64_t v48 = *v30;
        if (*v30)
        {
          uint64_t v48 = *(void *)(v8 + 72);
          int v49 = (char ***)(v48 + 48);
        }
        else
        {
          int v49 = (char ***)(v8 + 64);
        }
        *int v49 = v43;
        v43[5] = (char *)v48;
        *(void *)(v8 + 72) = v43;
        v43[4] = (char *)v8;
        v43[6] = 0;
        uint64_t v50 = (char *)*a2;
        do
        {
          int v52 = *v50++;
          unsigned __int8 v51 = v52;
          if (v52 < 0) {
            unsigned __int8 v51 = 122;
          }
        }
        while (byte_246D20753[v51]);
        *a2 = (uint64_t)(v50 - 1);
        if (*(v50 - 1) != 61) {
          break;
        }
        *a2 = (uint64_t)v50;
        unsigned __int8 v53 = *v43;
        if (!*v43)
        {
          unsigned __int8 v53 = &byte_2691E2758;
          uint64_t v47 = 0;
        }
        v53[v47] = 0;
        uint64_t v54 = *a2;
        int v55 = (char *)*a2;
        do
        {
          unsigned __int8 v56 = v55;
          int v58 = *v55++;
          unsigned __int8 v57 = v58;
          if (v58 < 0) {
            unsigned __int8 v57 = 122;
          }
          ++v54;
        }
        while (byte_246D20753[v57]);
        *a2 = (uint64_t)(v55 - 1);
        int v59 = *(v55 - 1);
        if (v59 != 34 && v59 != 39) {
          goto LABEL_329;
        }
        *a2 = (uint64_t)v55;
        if (v59 != 39)
        {
          do
          {
            int v64 = *++v56;
            unsigned __int8 v63 = v64;
            if (v64 < 0) {
              unsigned __int8 v63 = 122;
            }
          }
          while (byte_246D20C53[v63]);
          *a2 = (uint64_t)v56;
          int v62 = v56;
          while (1)
          {
            while (1)
            {
LABEL_161:
              int v78 = *v62;
              if ((v78 & 0x80u) == 0) {
                int v79 = *v62;
              }
              else {
                int v79 = 122;
              }
              if (!v79 || v79 == 34) {
                goto LABEL_208;
              }
              if (v78 == 38) {
                break;
              }
LABEL_160:
              ++v62;
              *v56++ = v78;
            }
            switch(v62[1])
            {
              case 'a':
                int v80 = v62[2];
                if (v80 != 112)
                {
                  if (v80 == 109 && v62[3] == 112 && v62[4] == 59)
                  {
                    *v56++ = 38;
                    v62 += 5;
                    goto LABEL_161;
                  }
                  goto LABEL_160;
                }
                if (v62[3] != 111 || v62[4] != 115 || v62[5] != 59) {
                  goto LABEL_160;
                }
                char v86 = 39;
LABEL_201:
                *v56++ = v86;
                v62 += 6;
                goto LABEL_161;
              case 'b':
              case 'c':
              case 'd':
              case 'e':
              case 'f':
              case 'h':
              case 'i':
              case 'j':
              case 'k':
              case 'm':
              case 'n':
              case 'o':
              case 'p':
                goto LABEL_160;
              case 'g':
                if (v62[2] != 116 || v62[3] != 59) {
                  goto LABEL_160;
                }
                char v85 = 62;
                goto LABEL_185;
              case 'l':
                if (v62[2] != 116 || v62[3] != 59) {
                  goto LABEL_160;
                }
                char v85 = 60;
LABEL_185:
                *v56++ = v85;
                v62 += 4;
                goto LABEL_161;
              case 'q':
                if (v62[2] != 117 || v62[3] != 111 || v62[4] != 116 || v62[5] != 59) {
                  goto LABEL_160;
                }
                char v86 = 34;
                goto LABEL_201;
              default:
                if (v62[1] != 35) {
                  goto LABEL_160;
                }
                int v34 = v62 + 2;
                if (v62[2] == 120)
                {
                  unint64_t v81 = 0;
                  do
                  {
                    unint64_t v82 = v81;
                    int v83 = *++v34;
                    uint64_t v84 = byte_246D20A53[v83];
                    unint64_t v81 = v84 + 16 * v81;
                  }
                  while (v84 != 255);
                  if (v82 <= 0x7F) {
                    goto LABEL_194;
                  }
                }
                else
                {
                  unint64_t v87 = 0;
                  int v34 = v62 + 1;
                  do
                  {
                    unint64_t v82 = v87;
                    int v88 = *++v34;
                    uint64_t v89 = byte_246D20A53[v88];
                    unint64_t v87 = v89 + 10 * v87;
                  }
                  while (v89 != 255);
                  if (v82 <= 0x7F)
                  {
LABEL_194:
                    uint64_t v90 = 1;
                    goto LABEL_206;
                  }
                }
                if (v82 > 0x7FF)
                {
                  if (v82 >> 16)
                  {
                    if (v82 >> 16 > 0x10)
                    {
LABEL_335:
                      uint64_t v144 = __cxa_allocate_exception(0x18uLL);
                      *uint64_t v144 = &unk_26FB3E3B8;
                      v144[1] = "invalid numeric character entity";
                      v144[2] = v56;
                      __cxa_throw(v144, (struct type_info *)&unk_26FB3E250, (void (*)(void *))std::exception::~exception);
                    }
                    v56[3] = v82 & 0x3F | 0x80;
                    v56[2] = (v82 >> 6) & 0x3F | 0x80;
                    v56[1] = (v82 >> 12) & 0x3F | 0x80;
                    LODWORD(v82) = (v82 >> 18) | 0xFFFFFFF0;
                    uint64_t v90 = 4;
                  }
                  else
                  {
                    v56[2] = v82 & 0x3F | 0x80;
                    v56[1] = (v82 >> 6) & 0x3F | 0x80;
                    LODWORD(v82) = (v82 >> 12) | 0xFFFFFFE0;
                    uint64_t v90 = 3;
                  }
                }
                else
                {
                  v56[1] = v82 & 0x3F | 0x80;
                  LODWORD(v82) = (v82 >> 6) | 0xFFFFFFC0;
                  uint64_t v90 = 2;
                }
LABEL_206:
                char *v56 = v82;
                if (*v34 != 59)
                {
LABEL_332:
                  __n128 v139 = __cxa_allocate_exception(0x18uLL);
                  uint64_t v140 = "expected ;";
LABEL_333:
                  void *v139 = &unk_26FB3E3B8;
                  v139[1] = v140;
                  v139[2] = v34;
                  __cxa_throw(v139, (struct type_info *)&unk_26FB3E250, (void (*)(void *))std::exception::~exception);
                }
                v56 += v90;
                int v62 = v34 + 1;
                break;
            }
          }
        }
        do
        {
          int v61 = *++v56;
          unsigned __int8 v60 = v61;
          if (v61 < 0) {
            unsigned __int8 v60 = 122;
          }
        }
        while (v40[v60]);
        *a2 = (uint64_t)v56;
        int v62 = v56;
        while (1)
        {
          int v65 = *v62;
          int v66 = (v65 & 0x80u) == 0 ? *v62 : 122;
          if (!v66 || v66 == 39) {
            break;
          }
          if (v65 == 38)
          {
            switch(v62[1])
            {
              case 'a':
                int v67 = v62[2];
                if (v67 != 112)
                {
                  if (v67 == 109 && v62[3] == 112 && v62[4] == 59)
                  {
                    *v56++ = 38;
                    v62 += 5;
                    continue;
                  }
                  goto LABEL_112;
                }
                if (v62[3] != 111 || v62[4] != 115 || v62[5] != 59) {
                  goto LABEL_112;
                }
                char v73 = 39;
LABEL_153:
                *v56++ = v73;
                v62 += 6;
                continue;
              case 'b':
              case 'c':
              case 'd':
              case 'e':
              case 'f':
              case 'h':
              case 'i':
              case 'j':
              case 'k':
              case 'm':
              case 'n':
              case 'o':
              case 'p':
                goto LABEL_112;
              case 'g':
                if (v62[2] != 116 || v62[3] != 59) {
                  goto LABEL_112;
                }
                char v72 = 62;
                goto LABEL_137;
              case 'l':
                if (v62[2] != 116 || v62[3] != 59) {
                  goto LABEL_112;
                }
                char v72 = 60;
LABEL_137:
                *v56++ = v72;
                v62 += 4;
                continue;
              case 'q':
                if (v62[2] != 117 || v62[3] != 111 || v62[4] != 116 || v62[5] != 59) {
                  goto LABEL_112;
                }
                char v73 = 34;
                goto LABEL_153;
              default:
                if (v62[1] != 35) {
                  goto LABEL_112;
                }
                int v34 = v62 + 2;
                if (v62[2] == 120)
                {
                  unint64_t v68 = 0;
                  do
                  {
                    unint64_t v69 = v68;
                    int v70 = *++v34;
                    uint64_t v71 = byte_246D20A53[v70];
                    unint64_t v68 = v71 + 16 * v68;
                  }
                  while (v71 != 255);
                  if (v69 <= 0x7F) {
                    goto LABEL_146;
                  }
                }
                else
                {
                  unint64_t v74 = 0;
                  int v34 = v62 + 1;
                  do
                  {
                    unint64_t v69 = v74;
                    int v75 = *++v34;
                    uint64_t v76 = byte_246D20A53[v75];
                    unint64_t v74 = v76 + 10 * v74;
                  }
                  while (v76 != 255);
                  if (v69 <= 0x7F)
                  {
LABEL_146:
                    uint64_t v77 = 1;
                    goto LABEL_158;
                  }
                }
                if (v69 > 0x7FF)
                {
                  if (v69 >> 16)
                  {
                    if (v69 >> 16 > 0x10) {
                      goto LABEL_335;
                    }
                    v56[3] = v69 & 0x3F | 0x80;
                    v56[2] = (v69 >> 6) & 0x3F | 0x80;
                    v56[1] = (v69 >> 12) & 0x3F | 0x80;
                    LODWORD(v69) = (v69 >> 18) | 0xFFFFFFF0;
                    uint64_t v77 = 4;
                  }
                  else
                  {
                    v56[2] = v69 & 0x3F | 0x80;
                    v56[1] = (v69 >> 6) & 0x3F | 0x80;
                    LODWORD(v69) = (v69 >> 12) | 0xFFFFFFE0;
                    uint64_t v77 = 3;
                  }
                }
                else
                {
                  v56[1] = v69 & 0x3F | 0x80;
                  LODWORD(v69) = (v69 >> 6) | 0xFFFFFFC0;
                  uint64_t v77 = 2;
                }
LABEL_158:
                char *v56 = v69;
                if (*v34 != 59) {
                  goto LABEL_332;
                }
                v56 += v77;
                int v62 = v34 + 1;
                break;
            }
          }
          else
          {
LABEL_112:
            ++v62;
            *v56++ = v65;
          }
        }
LABEL_208:
        *a2 = (uint64_t)v62;
        unsigned __int8 v91 = &v56[-v54];
        v43[1] = v55;
        v43[3] = v91;
        if (*(unsigned __int8 *)*a2 != v59)
        {
LABEL_329:
          uint64_t v141 = a2;
          exception = __cxa_allocate_exception(0x18uLL);
          uint64_t v25 = *v141;
          long long v26 = "expected ' or \"";
          goto LABEL_60;
        }
        ++*a2;
        uint64_t v92 = v43[1];
        if (!v92)
        {
          uint64_t v92 = &byte_2691E2758;
          unsigned __int8 v91 = 0;
        }
        v91[(void)v92] = 0;
        int v34 = (char *)(*a2 - 1);
        do
        {
          int v94 = *++v34;
          unsigned __int8 v93 = v94;
          if (v94 < 0) {
            unsigned __int8 v93 = 122;
          }
        }
        while (byte_246D20753[v93]);
        *a2 = (uint64_t)v34;
        int v37 = *v34;
        if (v37 >= 0) {
          unsigned __int8 v95 = *v34;
        }
        else {
          unsigned __int8 v95 = 122;
        }
        if (!byte_246D20953[v95]) {
          goto LABEL_219;
        }
      }
      unint64_t v142 = a2;
      exception = __cxa_allocate_exception(0x18uLL);
      uint64_t v25 = *v142;
      long long v26 = "expected =";
LABEL_60:
      void *exception = &unk_26FB3E3B8;
      exception[1] = v26;
      exception[2] = v25;
      __cxa_throw(exception, (struct type_info *)&unk_26FB3E250, (void (*)(void *))std::exception::~exception);
    }
LABEL_219:
    if (v37 != 47)
    {
      if (v37 == 62)
      {
        *a2 = (uint64_t)(v34 + 1);
        uint64_t v146 = (uint64_t (**)(uint64_t))(v2 + 8207);
        while (1)
        {
          unsigned __int8 v98 = (char *)(*a2 - 1);
          do
          {
            int v100 = *++v98;
            unsigned __int8 v99 = v100;
            if (v100 < 0) {
              unsigned __int8 v99 = 122;
            }
          }
          while (byte_246D20753[v99]);
          *a2 = (uint64_t)v98;
          char v101 = *v98;
          while (v101 != 60)
          {
            if (!v101) {
              goto LABEL_59;
            }
            uint64_t v102 = *a2;
            int v34 = (char *)(*a2 - 1);
            do
            {
              int v104 = *++v34;
              unsigned __int8 v103 = v104;
              if (v104 < 0) {
                unsigned __int8 v103 = 122;
              }
            }
            while (byte_246D20D53[v103]);
            *a2 = (uint64_t)v34;
            unint64_t v105 = v34;
            while (1)
            {
              int v106 = *v105;
              uint64_t v107 = (v106 & 0x80u) == 0 ? *v105 : 122;
              if (!v107 || v107 == 60) {
                break;
              }
              if (v106 == 38)
              {
                switch(v105[1])
                {
                  case 'a':
                    int v108 = v105[2];
                    if (v108 != 112)
                    {
                      if (v108 == 109 && v105[3] == 112 && v105[4] == 59)
                      {
                        *v34++ = 38;
                        v105 += 5;
                        continue;
                      }
                      goto LABEL_280;
                    }
                    if (v105[3] != 111 || v105[4] != 115 || v105[5] != 59) {
                      goto LABEL_280;
                    }
                    char v115 = 39;
LABEL_279:
                    *v34++ = v115;
                    v105 += 6;
                    continue;
                  case 'b':
                  case 'c':
                  case 'd':
                  case 'e':
                  case 'f':
                  case 'h':
                  case 'i':
                  case 'j':
                  case 'k':
                  case 'm':
                  case 'n':
                  case 'o':
                  case 'p':
                    goto LABEL_280;
                  case 'g':
                    if (v105[2] != 116 || v105[3] != 59) {
                      goto LABEL_280;
                    }
                    char v114 = 62;
                    goto LABEL_268;
                  case 'l':
                    if (v105[2] != 116 || v105[3] != 59) {
                      goto LABEL_280;
                    }
                    char v114 = 60;
LABEL_268:
                    *v34++ = v114;
                    v105 += 4;
                    continue;
                  case 'q':
                    if (v105[2] != 117 || v105[3] != 111 || v105[4] != 116 || v105[5] != 59) {
                      goto LABEL_280;
                    }
                    char v115 = 34;
                    goto LABEL_279;
                  default:
                    if (v105[1] != 35) {
                      goto LABEL_280;
                    }
                    char v109 = v105 + 2;
                    if (v105[2] == 120)
                    {
                      unint64_t v110 = 0;
                      do
                      {
                        unint64_t v111 = v110;
                        int v112 = *++v109;
                        uint64_t v113 = byte_246D20A53[v112];
                        unint64_t v110 = v113 + 16 * v110;
                      }
                      while (v113 != 255);
                      if (v111 <= 0x7F) {
                        goto LABEL_272;
                      }
                    }
                    else
                    {
                      unint64_t v116 = 0;
                      char v109 = v105 + 1;
                      do
                      {
                        unint64_t v111 = v116;
                        int v117 = *++v109;
                        uint64_t v118 = byte_246D20A53[v117];
                        unint64_t v116 = v118 + 10 * v116;
                      }
                      while (v118 != 255);
                      if (v111 <= 0x7F)
                      {
LABEL_272:
                        uint64_t v119 = 1;
                        goto LABEL_290;
                      }
                    }
                    if (v111 > 0x7FF)
                    {
                      if (v111 >> 16)
                      {
                        if (v111 >> 16 > 0x10)
                        {
                          __n128 v139 = __cxa_allocate_exception(0x18uLL);
                          uint64_t v140 = "invalid numeric character entity";
                          goto LABEL_333;
                        }
                        v34[3] = v111 & 0x3F | 0x80;
                        v34[2] = (v111 >> 6) & 0x3F | 0x80;
                        v34[1] = (v111 >> 12) & 0x3F | 0x80;
                        LODWORD(v111) = (v111 >> 18) | 0xFFFFFFF0;
                        uint64_t v119 = 4;
                      }
                      else
                      {
                        v34[2] = v111 & 0x3F | 0x80;
                        v34[1] = (v111 >> 6) & 0x3F | 0x80;
                        LODWORD(v111) = (v111 >> 12) | 0xFFFFFFE0;
                        uint64_t v119 = 3;
                      }
                    }
                    else
                    {
                      v34[1] = v111 & 0x3F | 0x80;
                      LODWORD(v111) = (v111 >> 6) | 0xFFFFFFC0;
                      uint64_t v119 = 2;
                    }
LABEL_290:
                    *int v34 = v111;
                    if (*v109 != 59)
                    {
                      __n128 v138 = __cxa_allocate_exception(0x18uLL);
                      *__n128 v138 = &unk_26FB3E3B8;
                      v138[1] = "expected ;";
                      v138[2] = v109;
                      __cxa_throw(v138, (struct type_info *)&unk_26FB3E250, (void (*)(void *))std::exception::~exception);
                    }
                    v34 += v119;
                    unint64_t v105 = v109 + 1;
                    break;
                }
              }
              else
              {
LABEL_280:
                if (byte_246D20753[v107])
                {
                  *int v34 = 32;
                  do
                  {
                    int v121 = *++v105;
                    unsigned __int8 v120 = v121;
                    if (v121 < 0) {
                      unsigned __int8 v120 = 122;
                    }
                  }
                  while (byte_246D20753[v120]);
                  ++v34;
                }
                else
                {
                  ++v105;
                  *v34++ = v106;
                }
              }
            }
            *a2 = (uint64_t)v105;
            if (*(v34 - 1) == 32) {
              --v34;
            }
            uint64_t v122 = v2[13] + (-*((unsigned char *)v2 + 104) & 7);
            if ((unint64_t)(v122 + 96) > v2[14])
            {
              if (!*v146) {
                operator new[]();
              }
              uint64_t v123 = (*v146)(65558);
              __n128 v124 = (void *)(v123 + (-(int)v123 & 7));
              int v2 = a1;
              a2 = v149;
              *__n128 v124 = a1[12];
              a1[12] = v123;
              a1[14] = v123 + 65558;
              uint64_t v122 = (uint64_t)v124 + (-(v124 + 8) & 7) + 8;
              int v29 = (uint64_t *)(v8 + 48);
            }
            v2[13] = v122 + 96;
            *(_DWORD *)(v122 + 40) = 2;
            *(void *)(v122 + 48) = 0;
            *(void *)(v122 + 64) = 0;
            *(void *)uint64_t v122 = 0;
            *(void *)(v122 + 8) = v102;
            *(void *)(v122 + 24) = &v34[-v102];
            uint64_t v125 = *v29;
            if (*v29)
            {
              uint64_t v125 = *(void *)(v8 + 56);
              int v126 = (uint64_t *)(v125 + 88);
            }
            else
            {
              int v126 = v29;
            }
            uint64_t *v126 = v122;
            *(void *)(v122 + 80) = v125;
            *(void *)(v8 + 56) = v122;
            *(void *)(v122 + 32) = v8;
            *(void *)(v122 + 88) = 0;
            unsigned __int8 v127 = *(char **)(v8 + 8);
            if (!v127) {
              unsigned __int8 v127 = &byte_2691E2758;
            }
            if (!*v127)
            {
              *(void *)(v8 + 8) = v102;
              *(void *)(v8 + 24) = &v34[-v102];
            }
            char v101 = *(unsigned char *)*a2;
            *int v34 = 0;
          }
          int v128 = (unsigned char *)*a2;
          int v129 = *(unsigned __int8 *)(*a2 + 1);
          if (v129 == 47)
          {
            *a2 = (uint64_t)(v128 + 2);
            unsigned __int8 v130 = v128 + 1;
            do
            {
              int v132 = *++v130;
              unsigned __int8 v131 = v132;
              if (v132 < 0) {
                unsigned __int8 v131 = 122;
              }
            }
            while (byte_246D20853[v131]);
            *a2 = (uint64_t)v130;
            do
            {
              int v134 = *v130++;
              unsigned __int8 v133 = v134;
              if (v134 < 0) {
                unsigned __int8 v133 = 122;
              }
            }
            while (byte_246D20753[v133]);
            *a2 = (uint64_t)(v130 - 1);
            if (*(v130 - 1) != 62) {
              goto LABEL_334;
            }
            *a2 = (uint64_t)v130;
          }
          else
          {
            ++*a2;
            __n128 v135 = (void *)sub_246CF1F38(v2, v149, v29, &byte_2691E2758);
            int v29 = (uint64_t *)(v8 + 48);
            int v2 = a1;
            a2 = v149;
            if (v135)
            {
              uint64_t v96 = *v147;
              if (*v147)
              {
                uint64_t v96 = *(void *)(v8 + 56);
                int v97 = (void *)(v96 + 88);
              }
              else
              {
                int v97 = (void *)(v8 + 48);
              }
              *int v97 = v135;
              v135[10] = v96;
              *(void *)(v8 + 56) = v135;
              v135[4] = v8;
              v135[11] = 0;
            }
          }
          if (v129 == 47) {
            goto LABEL_321;
          }
        }
      }
      goto LABEL_334;
    }
    *a2 = (uint64_t)(v34 + 1);
    if (v34[1] != 62)
    {
LABEL_334:
      uint64_t v143 = a2;
      exception = __cxa_allocate_exception(0x18uLL);
      uint64_t v25 = *v143;
      long long v26 = "expected >";
      goto LABEL_60;
    }
    *a2 = (uint64_t)(v34 + 2);
LABEL_321:
    if (*(void *)v8) {
      *(unsigned char *)(*(void *)v8 + *(void *)(v8 + 16)) = 0;
    }
    else {
      byte_2691E2758 = 0;
    }
    return v8;
  }
  int v10 = (char)v3[1];
  if (v10 == 45)
  {
    if (v3[2] == 45)
    {
      char v16 = v3 + 3;
      for (k = v3 + 3; ; ++k)
      {
        *a2 = (uint64_t)k;
        if (*k == 45)
        {
          if (k[1] == 45 && k[2] == 62)
          {
            uint64_t v8 = a1[13] + (-*((unsigned char *)a1 + 104) & 7);
            if ((unint64_t)(v8 + 96) > a1[14])
            {
              int v18 = (uint64_t (*)(uint64_t))a1[8207];
              if (!v18) {
                operator new[]();
              }
              uint64_t v19 = v18(65558);
              __n128 v136 = (void *)(v19 + (-(int)v19 & 7));
              int v2 = a1;
              a2 = v149;
              void *v136 = a1[12];
              a1[12] = v19;
              a1[14] = v19 + 65558;
              uint64_t v8 = (uint64_t)v136 + (-(v136 + 8) & 7) + 8;
            }
            v2[13] = v8 + 96;
            *(void *)(v8 + 32) = 0;
            *(void *)uint64_t v8 = 0;
            *(void *)(v8 + 8) = 0;
            *(_DWORD *)(v8 + 40) = 4;
            *(void *)(v8 + 48) = 0;
            *(void *)(v8 + 64) = 0;
            uint64_t v137 = *a2 - (void)v16;
            *(void *)(v8 + 8) = v16;
            *(void *)(v8 + 24) = v137;
            *(unsigned char *)*a2 = 0;
            uint64_t v9 = (unsigned __int8 *)(*a2 + 3);
            goto LABEL_62;
          }
        }
        else if (!*k)
        {
LABEL_59:
          std::runtime_error v23 = a2;
          exception = __cxa_allocate_exception(0x18uLL);
          uint64_t v25 = *v23;
          long long v26 = "unexpected end of data";
          goto LABEL_60;
        }
      }
    }
    goto LABEL_56;
  }
  if (v10 == 68)
  {
    if (v3[2] == 79 && v3[3] == 67 && v3[4] == 84 && v3[5] == 89 && v3[6] == 80 && v3[7] == 69)
    {
      int v20 = (char)v3[8];
      if (v20 < 0) {
        LOBYTE(v20) = 122;
      }
      if (byte_246D20753[v20])
      {
        *a2 = (uint64_t)(v3 + 9);
        sub_246CF0A08(a2);
        return 0;
      }
    }
LABEL_56:
    uint64_t v9 = v3 + 1;
    while (1)
    {
      *a2 = (uint64_t)v9;
      int v22 = *v9++;
      int v21 = v22;
      if (v22 == 62) {
        break;
      }
      if (!v21) {
        goto LABEL_59;
      }
    }
    uint64_t v8 = 0;
LABEL_62:
    *a2 = (uint64_t)v9;
    return v8;
  }
  if (v10 != 91 || v3[2] != 67 || v3[3] != 68 || v3[4] != 65 || v3[5] != 84 || v3[6] != 65 || v3[7] != 91) {
    goto LABEL_56;
  }
  *a2 = (uint64_t)(v3 + 8);
  return sub_246CF0884(a1, a2);
}

uint64_t sub_246CF3434(void *a1, uint64_t *a2)
{
  int v4 = (unsigned __int8 *)*a2;
  int v5 = *(char *)*a2;
  if (v5 != 33)
  {
    if (v5 == 63)
    {
      *a2 = (uint64_t)(v4 + 1);
      int v6 = v4[1];
      if ((v6 | 0x20) == 0x78 && (v4[2] | 0x20) == 0x6D && (v4[3] | 0x20) == 0x6C)
      {
        int v7 = (char)v4[4];
        if (v7 < 0) {
          LOBYTE(v7) = 122;
        }
        if (byte_246D20753[v7])
        {
          for (uint64_t i = v4 + 5; ; ++i)
          {
            *a2 = (uint64_t)i;
            if (*i == 63)
            {
              if (i[1] == 62)
              {
                uint64_t v9 = 0;
                int v10 = i + 2;
                goto LABEL_62;
              }
            }
            else if (!*i)
            {
              goto LABEL_59;
            }
          }
        }
      }
      for (j = v4 + 2; ; ++j)
      {
        if (v6 == 63)
        {
          if (*j == 62)
          {
            uint64_t v9 = 0;
            int v10 = j + 1;
            goto LABEL_62;
          }
        }
        else if (!(_BYTE)v6)
        {
          goto LABEL_59;
        }
        *a2 = (uint64_t)j;
        char v16 = *j;
        LOBYTE(v6) = v16;
      }
    }
    uint64_t v9 = a1[13] + (-*((unsigned char *)a1 + 104) & 7);
    if ((unint64_t)(v9 + 96) > a1[14])
    {
      uint64_t v13 = (uint64_t (*)(uint64_t))a1[8207];
      if (!v13) {
        operator new[]();
      }
      uint64_t v14 = v13(65558);
      unint64_t v27 = (void *)(v14 + (-(int)v14 & 7));
      void *v27 = a1[12];
      a1[12] = v14;
      a1[14] = v14 + 65558;
      uint64_t v9 = (uint64_t)v27 + (-(v27 + 8) & 7) + 8;
    }
    uint64_t v28 = 0;
    a1[13] = v9 + 96;
    *(void *)(v9 + 32) = 0;
    *(void *)uint64_t v9 = 0;
    *(void *)(v9 + 8) = 0;
    *(_DWORD *)(v9 + 40) = 1;
    *(void *)(v9 + 48) = 0;
    int v29 = (uint64_t *)(v9 + 48);
    *(void *)(v9 + 64) = 0;
    uint64_t v30 = (uint64_t *)(v9 + 64);
    uint64_t v31 = *a2;
    do
    {
      int v32 = *(char *)(v31 + v28);
      if (v32 < 0) {
        LOBYTE(v32) = 122;
      }
      ++v28;
    }
    while (byte_246D20853[v32]);
    *a2 = v31 + v28 - 1;
    uint64_t v33 = v28 - 1;
    if (!v33)
    {
      exception = __cxa_allocate_exception(0x18uLL);
      uint64_t v25 = (unsigned char *)*a2;
      long long v26 = "expected element name";
      goto LABEL_60;
    }
    *(void *)uint64_t v9 = v31;
    *(void *)(v9 + 16) = v33;
    int v34 = (unsigned __int8 *)(*a2 - 1);
    do
    {
      int v36 = (char)*++v34;
      unsigned __int8 v35 = v36;
      if (v36 < 0) {
        unsigned __int8 v35 = 122;
      }
    }
    while (byte_246D20753[v35]);
    *a2 = (uint64_t)v34;
    int v37 = (char)*v34;
    if (v37 >= 0) {
      unsigned __int8 v38 = *v34;
    }
    else {
      unsigned __int8 v38 = 122;
    }
    unint64_t v142 = (uint64_t *)(v9 + 48);
    if (byte_246D20953[v38])
    {
      uint64_t v140 = a1 + 8207;
      int v39 = &unk_246D20B53;
      while (1)
      {
        uint64_t v40 = 0;
        *a2 = (uint64_t)(v34 + 1);
        do
        {
          int v41 = (char)v34[v40 + 1];
          if (v41 < 0) {
            LOBYTE(v41) = 122;
          }
          ++v40;
        }
        while (byte_246D20953[v41]);
        *a2 = (uint64_t)&v34[v40];
        if (!v40)
        {
          uint64_t v137 = __cxa_allocate_exception(0x18uLL);
          __n128 v138 = "expected attribute name";
          goto LABEL_321;
        }
        int v42 = (char **)(a1[13] + (-*((unsigned char *)a1 + 104) & 7));
        if ((unint64_t)(v42 + 7) > a1[14])
        {
          uint64_t v43 = v39;
          if (!*v140) {
            operator new[]();
          }
          uint64_t v44 = ((uint64_t (*)(uint64_t, unsigned char *, char *, uint64_t))*v140)(65558, byte_246D20753, &byte_2691E2758, 10);
          uint64_t v45 = (void *)(v44 + (-(int)v44 & 7));
          void *v45 = a1[12];
          a1[12] = v44;
          a1[14] = v44 + 65558;
          int v42 = (char **)((char *)v45 + (-(v45 + 8) & 7) + 8);
          int v29 = (uint64_t *)(v9 + 48);
          int v39 = v43;
        }
        a1[13] = v42 + 7;
        void v42[4] = 0;
        void *v42 = 0;
        v42[1] = 0;
        uint64_t v46 = *a2 - (void)v34;
        void *v42 = (char *)v34;
        v42[2] = (char *)v46;
        uint64_t v47 = *v30;
        if (*v30)
        {
          uint64_t v47 = *(void *)(v9 + 72);
          uint64_t v48 = (char ***)(v47 + 48);
        }
        else
        {
          uint64_t v48 = (char ***)(v9 + 64);
        }
        unsigned __int8 *v48 = v42;
        v42[5] = (char *)v47;
        *(void *)(v9 + 72) = v42;
        void v42[4] = (char *)v9;
        v42[6] = 0;
        int v49 = (char *)*a2;
        do
        {
          int v51 = *v49++;
          unsigned __int8 v50 = v51;
          if (v51 < 0) {
            unsigned __int8 v50 = 122;
          }
        }
        while (byte_246D20753[v50]);
        *a2 = (uint64_t)(v49 - 1);
        if (*(v49 - 1) != 61) {
          break;
        }
        *a2 = (uint64_t)v49;
        int v52 = *v42;
        if (!*v42)
        {
          int v52 = &byte_2691E2758;
          uint64_t v46 = 0;
        }
        v52[v46] = 0;
        uint64_t v53 = *a2;
        uint64_t v54 = (char *)*a2;
        do
        {
          int v55 = v54;
          int v57 = *v54++;
          unsigned __int8 v56 = v57;
          if (v57 < 0) {
            unsigned __int8 v56 = 122;
          }
          ++v53;
        }
        while (byte_246D20753[v56]);
        *a2 = (uint64_t)(v54 - 1);
        int v58 = *(v54 - 1);
        if (v58 != 34 && v58 != 39) {
          goto LABEL_317;
        }
        *a2 = (uint64_t)v54;
        if (v58 != 39)
        {
          do
          {
            int v63 = *++v55;
            unsigned __int8 v62 = v63;
            if (v63 < 0) {
              unsigned __int8 v62 = 122;
            }
          }
          while (byte_246D20C53[v62]);
          *a2 = (uint64_t)v55;
          int v61 = v55;
          while (1)
          {
            while (1)
            {
LABEL_161:
              int v77 = *v61;
              if ((v77 & 0x80u) == 0) {
                int v78 = *v61;
              }
              else {
                int v78 = 122;
              }
              if (!v78 || v78 == 34) {
                goto LABEL_208;
              }
              if (v77 == 38) {
                break;
              }
LABEL_160:
              ++v61;
              *v55++ = v77;
            }
            switch(v61[1])
            {
              case 'a':
                int v79 = v61[2];
                if (v79 != 112)
                {
                  if (v79 == 109 && v61[3] == 112 && v61[4] == 59)
                  {
                    *v55++ = 38;
                    v61 += 5;
                    goto LABEL_161;
                  }
                  goto LABEL_160;
                }
                if (v61[3] != 111 || v61[4] != 115 || v61[5] != 59) {
                  goto LABEL_160;
                }
                char v85 = 39;
LABEL_201:
                *v55++ = v85;
                v61 += 6;
                goto LABEL_161;
              case 'b':
              case 'c':
              case 'd':
              case 'e':
              case 'f':
              case 'h':
              case 'i':
              case 'j':
              case 'k':
              case 'm':
              case 'n':
              case 'o':
              case 'p':
                goto LABEL_160;
              case 'g':
                if (v61[2] != 116 || v61[3] != 59) {
                  goto LABEL_160;
                }
                char v84 = 62;
                goto LABEL_185;
              case 'l':
                if (v61[2] != 116 || v61[3] != 59) {
                  goto LABEL_160;
                }
                char v84 = 60;
LABEL_185:
                *v55++ = v84;
                v61 += 4;
                goto LABEL_161;
              case 'q':
                if (v61[2] != 117 || v61[3] != 111 || v61[4] != 116 || v61[5] != 59) {
                  goto LABEL_160;
                }
                char v85 = 34;
                goto LABEL_201;
              default:
                if (v61[1] != 35) {
                  goto LABEL_160;
                }
                int v34 = (unsigned __int8 *)(v61 + 2);
                if (v61[2] == 120)
                {
                  unint64_t v80 = 0;
                  do
                  {
                    unint64_t v81 = v80;
                    int v82 = *++v34;
                    uint64_t v83 = byte_246D20A53[v82];
                    unint64_t v80 = v83 + 16 * v80;
                  }
                  while (v83 != 255);
                  if (v81 <= 0x7F) {
                    goto LABEL_194;
                  }
                }
                else
                {
                  unint64_t v86 = 0;
                  int v34 = (unsigned __int8 *)(v61 + 1);
                  do
                  {
                    unint64_t v81 = v86;
                    int v87 = *++v34;
                    uint64_t v88 = byte_246D20A53[v87];
                    unint64_t v86 = v88 + 10 * v86;
                  }
                  while (v88 != 255);
                  if (v81 <= 0x7F)
                  {
LABEL_194:
                    uint64_t v89 = 1;
                    goto LABEL_206;
                  }
                }
                if (v81 > 0x7FF)
                {
                  if (v81 >> 16)
                  {
                    if (v81 >> 16 > 0x10)
                    {
LABEL_323:
                      __n128 v139 = __cxa_allocate_exception(0x18uLL);
                      void *v139 = &unk_26FB3E3B8;
                      v139[1] = "invalid numeric character entity";
                      v139[2] = v55;
                      __cxa_throw(v139, (struct type_info *)&unk_26FB3E250, (void (*)(void *))std::exception::~exception);
                    }
                    v55[3] = v81 & 0x3F | 0x80;
                    v55[2] = (v81 >> 6) & 0x3F | 0x80;
                    v55[1] = (v81 >> 12) & 0x3F | 0x80;
                    LODWORD(v81) = (v81 >> 18) | 0xFFFFFFF0;
                    uint64_t v89 = 4;
                  }
                  else
                  {
                    v55[2] = v81 & 0x3F | 0x80;
                    v55[1] = (v81 >> 6) & 0x3F | 0x80;
                    LODWORD(v81) = (v81 >> 12) | 0xFFFFFFE0;
                    uint64_t v89 = 3;
                  }
                }
                else
                {
                  v55[1] = v81 & 0x3F | 0x80;
                  LODWORD(v81) = (v81 >> 6) | 0xFFFFFFC0;
                  uint64_t v89 = 2;
                }
LABEL_206:
                *int v55 = v81;
                if (*v34 != 59)
                {
LABEL_320:
                  uint64_t v137 = __cxa_allocate_exception(0x18uLL);
                  __n128 v138 = "expected ;";
LABEL_321:
                  *uint64_t v137 = &unk_26FB3E3B8;
                  v137[1] = v138;
                  v137[2] = v34;
                  __cxa_throw(v137, (struct type_info *)&unk_26FB3E250, (void (*)(void *))std::exception::~exception);
                }
                v55 += v89;
                int v61 = (char *)(v34 + 1);
                break;
            }
          }
        }
        do
        {
          int v60 = *++v55;
          unsigned __int8 v59 = v60;
          if (v60 < 0) {
            unsigned __int8 v59 = 122;
          }
        }
        while (v39[v59]);
        *a2 = (uint64_t)v55;
        int v61 = v55;
        while (1)
        {
          int v64 = *v61;
          int v65 = (v64 & 0x80u) == 0 ? *v61 : 122;
          if (!v65 || v65 == 39) {
            break;
          }
          if (v64 == 38)
          {
            switch(v61[1])
            {
              case 'a':
                int v66 = v61[2];
                if (v66 != 112)
                {
                  if (v66 == 109 && v61[3] == 112 && v61[4] == 59)
                  {
                    *v55++ = 38;
                    v61 += 5;
                    continue;
                  }
                  goto LABEL_112;
                }
                if (v61[3] != 111 || v61[4] != 115 || v61[5] != 59) {
                  goto LABEL_112;
                }
                char v72 = 39;
LABEL_153:
                *v55++ = v72;
                v61 += 6;
                continue;
              case 'b':
              case 'c':
              case 'd':
              case 'e':
              case 'f':
              case 'h':
              case 'i':
              case 'j':
              case 'k':
              case 'm':
              case 'n':
              case 'o':
              case 'p':
                goto LABEL_112;
              case 'g':
                if (v61[2] != 116 || v61[3] != 59) {
                  goto LABEL_112;
                }
                char v71 = 62;
                goto LABEL_137;
              case 'l':
                if (v61[2] != 116 || v61[3] != 59) {
                  goto LABEL_112;
                }
                char v71 = 60;
LABEL_137:
                *v55++ = v71;
                v61 += 4;
                continue;
              case 'q':
                if (v61[2] != 117 || v61[3] != 111 || v61[4] != 116 || v61[5] != 59) {
                  goto LABEL_112;
                }
                char v72 = 34;
                goto LABEL_153;
              default:
                if (v61[1] != 35) {
                  goto LABEL_112;
                }
                int v34 = (unsigned __int8 *)(v61 + 2);
                if (v61[2] == 120)
                {
                  unint64_t v67 = 0;
                  do
                  {
                    unint64_t v68 = v67;
                    int v69 = *++v34;
                    uint64_t v70 = byte_246D20A53[v69];
                    unint64_t v67 = v70 + 16 * v67;
                  }
                  while (v70 != 255);
                  if (v68 <= 0x7F) {
                    goto LABEL_146;
                  }
                }
                else
                {
                  unint64_t v73 = 0;
                  int v34 = (unsigned __int8 *)(v61 + 1);
                  do
                  {
                    unint64_t v68 = v73;
                    int v74 = *++v34;
                    uint64_t v75 = byte_246D20A53[v74];
                    unint64_t v73 = v75 + 10 * v73;
                  }
                  while (v75 != 255);
                  if (v68 <= 0x7F)
                  {
LABEL_146:
                    uint64_t v76 = 1;
                    goto LABEL_158;
                  }
                }
                if (v68 > 0x7FF)
                {
                  if (v68 >> 16)
                  {
                    if (v68 >> 16 > 0x10) {
                      goto LABEL_323;
                    }
                    v55[3] = v68 & 0x3F | 0x80;
                    v55[2] = (v68 >> 6) & 0x3F | 0x80;
                    v55[1] = (v68 >> 12) & 0x3F | 0x80;
                    LODWORD(v68) = (v68 >> 18) | 0xFFFFFFF0;
                    uint64_t v76 = 4;
                  }
                  else
                  {
                    v55[2] = v68 & 0x3F | 0x80;
                    v55[1] = (v68 >> 6) & 0x3F | 0x80;
                    LODWORD(v68) = (v68 >> 12) | 0xFFFFFFE0;
                    uint64_t v76 = 3;
                  }
                }
                else
                {
                  v55[1] = v68 & 0x3F | 0x80;
                  LODWORD(v68) = (v68 >> 6) | 0xFFFFFFC0;
                  uint64_t v76 = 2;
                }
LABEL_158:
                *int v55 = v68;
                if (*v34 != 59) {
                  goto LABEL_320;
                }
                v55 += v76;
                int v61 = (char *)(v34 + 1);
                break;
            }
          }
          else
          {
LABEL_112:
            ++v61;
            *v55++ = v64;
          }
        }
LABEL_208:
        *a2 = (uint64_t)v61;
        uint64_t v90 = &v55[-v53];
        v42[1] = v54;
        v42[3] = v90;
        if (*(unsigned __int8 *)*a2 != v58)
        {
LABEL_317:
          exception = __cxa_allocate_exception(0x18uLL);
          uint64_t v25 = (unsigned char *)*a2;
          long long v26 = "expected ' or \"";
          goto LABEL_60;
        }
        ++*a2;
        unsigned __int8 v91 = v42[1];
        if (!v91)
        {
          unsigned __int8 v91 = &byte_2691E2758;
          uint64_t v90 = 0;
        }
        v90[(void)v91] = 0;
        int v34 = (unsigned __int8 *)(*a2 - 1);
        do
        {
          int v93 = (char)*++v34;
          unsigned __int8 v92 = v93;
          if (v93 < 0) {
            unsigned __int8 v92 = 122;
          }
        }
        while (byte_246D20753[v92]);
        *a2 = (uint64_t)v34;
        int v37 = (char)*v34;
        if (v37 >= 0) {
          unsigned __int8 v94 = *v34;
        }
        else {
          unsigned __int8 v94 = 122;
        }
        if (!byte_246D20953[v94]) {
          goto LABEL_219;
        }
      }
      exception = __cxa_allocate_exception(0x18uLL);
      uint64_t v25 = (unsigned char *)*a2;
      long long v26 = "expected =";
LABEL_60:
      void *exception = &unk_26FB3E3B8;
      exception[1] = v26;
      exception[2] = v25;
      __cxa_throw(exception, (struct type_info *)&unk_26FB3E250, (void (*)(void *))std::exception::~exception);
    }
LABEL_219:
    if (v37 != 47)
    {
      if (v37 == 62)
      {
        *a2 = (uint64_t)(v34 + 1);
        uint64_t v141 = a1 + 8207;
        while (1)
        {
          uint64_t v97 = *a2;
          uint64_t v99 = *a2 - 1;
          char v98 = *(unsigned char *)*a2;
          while (v98 != 60)
          {
            if (!v98) {
              goto LABEL_59;
            }
            *a2 = v97;
            int v100 = (char *)v99;
            do
            {
              int v102 = *++v100;
              unsigned __int8 v101 = v102;
              if (v102 < 0) {
                unsigned __int8 v101 = 122;
              }
            }
            while (byte_246D20E53[v101]);
            *a2 = (uint64_t)v100;
            unsigned __int8 v103 = v100;
            while (1)
            {
              int v104 = *v103;
              int v105 = (v104 & 0x80u) == 0 ? *v103 : 122;
              if (!v105 || v105 == 60) {
                break;
              }
              if (v104 == 38)
              {
                switch(v103[1])
                {
                  case 'a':
                    int v106 = v103[2];
                    if (v106 != 112)
                    {
                      if (v106 == 109 && v103[3] == 112 && v103[4] == 59)
                      {
                        *v100++ = 38;
                        v103 += 5;
                        continue;
                      }
                      goto LABEL_234;
                    }
                    if (v103[3] != 111 || v103[4] != 115 || v103[5] != 59) {
                      goto LABEL_234;
                    }
                    char v113 = 39;
LABEL_275:
                    *v100++ = v113;
                    v103 += 6;
                    continue;
                  case 'b':
                  case 'c':
                  case 'd':
                  case 'e':
                  case 'f':
                  case 'h':
                  case 'i':
                  case 'j':
                  case 'k':
                  case 'm':
                  case 'n':
                  case 'o':
                  case 'p':
                    goto LABEL_234;
                  case 'g':
                    if (v103[2] != 116 || v103[3] != 59) {
                      goto LABEL_234;
                    }
                    char v112 = 62;
                    goto LABEL_264;
                  case 'l':
                    if (v103[2] != 116 || v103[3] != 59) {
                      goto LABEL_234;
                    }
                    char v112 = 60;
LABEL_264:
                    *v100++ = v112;
                    v103 += 4;
                    continue;
                  case 'q':
                    if (v103[2] != 117 || v103[3] != 111 || v103[4] != 116 || v103[5] != 59) {
                      goto LABEL_234;
                    }
                    char v113 = 34;
                    goto LABEL_275;
                  default:
                    if (v103[1] != 35) {
                      goto LABEL_234;
                    }
                    uint64_t v107 = v103 + 2;
                    if (v103[2] == 120)
                    {
                      unint64_t v108 = 0;
                      do
                      {
                        unint64_t v109 = v108;
                        int v110 = *++v107;
                        uint64_t v111 = byte_246D20A53[v110];
                        unint64_t v108 = v111 + 16 * v108;
                      }
                      while (v111 != 255);
                      if (v109 <= 0x7F) {
                        goto LABEL_268;
                      }
                    }
                    else
                    {
                      unint64_t v114 = 0;
                      uint64_t v107 = v103 + 1;
                      do
                      {
                        unint64_t v109 = v114;
                        int v115 = *++v107;
                        uint64_t v116 = byte_246D20A53[v115];
                        unint64_t v114 = v116 + 10 * v114;
                      }
                      while (v116 != 255);
                      if (v109 <= 0x7F)
                      {
LABEL_268:
                        uint64_t v117 = 1;
                        goto LABEL_280;
                      }
                    }
                    if (v109 > 0x7FF)
                    {
                      if (v109 >> 16)
                      {
                        if (v109 >> 16 > 0x10)
                        {
                          __n128 v136 = __cxa_allocate_exception(0x18uLL);
                          void *v136 = &unk_26FB3E3B8;
                          v136[1] = "invalid numeric character entity";
                          v136[2] = v100;
                          __cxa_throw(v136, (struct type_info *)&unk_26FB3E250, (void (*)(void *))std::exception::~exception);
                        }
                        v100[3] = v109 & 0x3F | 0x80;
                        v100[2] = (v109 >> 6) & 0x3F | 0x80;
                        v100[1] = (v109 >> 12) & 0x3F | 0x80;
                        LODWORD(v109) = (v109 >> 18) | 0xFFFFFFF0;
                        uint64_t v117 = 4;
                      }
                      else
                      {
                        v100[2] = v109 & 0x3F | 0x80;
                        v100[1] = (v109 >> 6) & 0x3F | 0x80;
                        LODWORD(v109) = (v109 >> 12) | 0xFFFFFFE0;
                        uint64_t v117 = 3;
                      }
                    }
                    else
                    {
                      v100[1] = v109 & 0x3F | 0x80;
                      LODWORD(v109) = (v109 >> 6) | 0xFFFFFFC0;
                      uint64_t v117 = 2;
                    }
LABEL_280:
                    *int v100 = v109;
                    if (*v107 != 59)
                    {
                      __n128 v135 = __cxa_allocate_exception(0x18uLL);
                      void *v135 = &unk_26FB3E3B8;
                      v135[1] = "expected ;";
                      v135[2] = v107;
                      __cxa_throw(v135, (struct type_info *)&unk_26FB3E250, (void (*)(void *))std::exception::~exception);
                    }
                    v100 += v117;
                    unsigned __int8 v103 = v107 + 1;
                    break;
                }
              }
              else
              {
LABEL_234:
                ++v103;
                *v100++ = v104;
              }
            }
            *a2 = (uint64_t)v103;
            uint64_t v118 = a1[13] + (-*((unsigned char *)a1 + 104) & 7);
            if ((unint64_t)(v118 + 96) > a1[14])
            {
              uint64_t v119 = v99;
              if (!*v141) {
                operator new[]();
              }
              uint64_t v120 = ((uint64_t (*)(uint64_t, unsigned char *, char *))*v141)(65558, byte_246D20753, &byte_2691E2758);
              int v121 = (void *)(v120 + (-(int)v120 & 7));
              *int v121 = a1[12];
              a1[12] = v120;
              a1[14] = v120 + 65558;
              uint64_t v118 = (uint64_t)v121 + (-(v121 + 8) & 7) + 8;
              int v29 = (uint64_t *)(v9 + 48);
              uint64_t v99 = v119;
            }
            a1[13] = v118 + 96;
            *(_DWORD *)(v118 + 40) = 2;
            *(void *)(v118 + 48) = 0;
            *(void *)(v118 + 64) = 0;
            *(void *)uint64_t v118 = 0;
            *(void *)(v118 + 8) = v97;
            *(void *)(v118 + 24) = &v100[-v97];
            uint64_t v122 = *v29;
            if (*v29)
            {
              uint64_t v122 = *(void *)(v9 + 56);
              uint64_t v123 = (uint64_t *)(v122 + 88);
            }
            else
            {
              uint64_t v123 = v29;
            }
            uint64_t *v123 = v118;
            *(void *)(v118 + 80) = v122;
            *(void *)(v9 + 56) = v118;
            *(void *)(v118 + 32) = v9;
            *(void *)(v118 + 88) = 0;
            __n128 v124 = *(char **)(v9 + 8);
            if (!v124) {
              __n128 v124 = &byte_2691E2758;
            }
            if (!*v124)
            {
              *(void *)(v9 + 8) = v97;
              *(void *)(v9 + 24) = &v100[-v97];
            }
            char v98 = *(unsigned char *)*a2;
            *int v100 = 0;
          }
          uint64_t v125 = (unsigned char *)*a2;
          int v126 = *(unsigned __int8 *)(*a2 + 1);
          if (v126 == 47)
          {
            *a2 = (uint64_t)(v125 + 2);
            unsigned __int8 v127 = v125 + 1;
            do
            {
              int v129 = *++v127;
              unsigned __int8 v128 = v129;
              if (v129 < 0) {
                unsigned __int8 v128 = 122;
              }
            }
            while (byte_246D20853[v128]);
            *a2 = (uint64_t)v127;
            do
            {
              int v131 = *v127++;
              unsigned __int8 v130 = v131;
              if (v131 < 0) {
                unsigned __int8 v130 = 122;
              }
            }
            while (byte_246D20753[v130]);
            *a2 = (uint64_t)(v127 - 1);
            if (*(v127 - 1) != 62) {
              goto LABEL_322;
            }
            *a2 = (uint64_t)v127;
          }
          else
          {
            ++*a2;
            int v132 = (void *)sub_246CF3434(a1, a2, &byte_2691E2758);
            int v29 = (uint64_t *)(v9 + 48);
            if (v132)
            {
              uint64_t v95 = *v142;
              if (*v142)
              {
                uint64_t v95 = *(void *)(v9 + 56);
                uint64_t v96 = (void *)(v95 + 88);
              }
              else
              {
                uint64_t v96 = (void *)(v9 + 48);
              }
              void *v96 = v132;
              v132[10] = v95;
              *(void *)(v9 + 56) = v132;
              v132[4] = v9;
              v132[11] = 0;
            }
          }
          if (v126 == 47) {
            goto LABEL_309;
          }
        }
      }
      goto LABEL_322;
    }
    *a2 = (uint64_t)(v34 + 1);
    if (v34[1] != 62)
    {
LABEL_322:
      exception = __cxa_allocate_exception(0x18uLL);
      uint64_t v25 = (unsigned char *)*a2;
      long long v26 = "expected >";
      goto LABEL_60;
    }
    *a2 = (uint64_t)(v34 + 2);
LABEL_309:
    if (*(void *)v9) {
      *(unsigned char *)(*(void *)v9 + *(void *)(v9 + 16)) = 0;
    }
    else {
      byte_2691E2758 = 0;
    }
    return v9;
  }
  int v11 = (char)v4[1];
  if (v11 == 45)
  {
    if (v4[2] == 45)
    {
      int v17 = v4 + 3;
      for (k = v4 + 3; ; ++k)
      {
        *a2 = (uint64_t)k;
        if (*k == 45)
        {
          if (k[1] == 45 && k[2] == 62)
          {
            uint64_t v9 = a1[13] + (-*((unsigned char *)a1 + 104) & 7);
            if ((unint64_t)(v9 + 96) > a1[14])
            {
              uint64_t v19 = (uint64_t (*)(uint64_t))a1[8207];
              if (!v19) {
                operator new[]();
              }
              uint64_t v20 = v19(65558);
              unsigned __int8 v133 = (void *)(v20 + (-(int)v20 & 7));
              void *v133 = a1[12];
              a1[12] = v20;
              a1[14] = v20 + 65558;
              uint64_t v9 = (uint64_t)v133 + (-(v133 + 8) & 7) + 8;
            }
            a1[13] = v9 + 96;
            *(void *)(v9 + 32) = 0;
            *(void *)uint64_t v9 = 0;
            *(void *)(v9 + 8) = 0;
            *(_DWORD *)(v9 + 40) = 4;
            *(void *)(v9 + 48) = 0;
            *(void *)(v9 + 64) = 0;
            uint64_t v134 = *a2 - (void)v17;
            *(void *)(v9 + 8) = v17;
            *(void *)(v9 + 24) = v134;
            *(unsigned char *)*a2 = 0;
            int v10 = (unsigned __int8 *)(*a2 + 3);
            goto LABEL_62;
          }
        }
        else if (!*k)
        {
LABEL_59:
          exception = __cxa_allocate_exception(0x18uLL);
          uint64_t v25 = (unsigned char *)*a2;
          long long v26 = "unexpected end of data";
          goto LABEL_60;
        }
      }
    }
    goto LABEL_56;
  }
  if (v11 == 68)
  {
    if (v4[2] == 79 && v4[3] == 67 && v4[4] == 84 && v4[5] == 89 && v4[6] == 80 && v4[7] == 69)
    {
      int v21 = (char)v4[8];
      if (v21 < 0) {
        LOBYTE(v21) = 122;
      }
      if (byte_246D20753[v21])
      {
        *a2 = (uint64_t)(v4 + 9);
        sub_246CF0A08(a2);
        return 0;
      }
    }
LABEL_56:
    int v10 = v4 + 1;
    while (1)
    {
      *a2 = (uint64_t)v10;
      int v23 = *v10++;
      int v22 = v23;
      if (v23 == 62) {
        break;
      }
      if (!v22) {
        goto LABEL_59;
      }
    }
    uint64_t v9 = 0;
LABEL_62:
    *a2 = (uint64_t)v10;
    return v9;
  }
  if (v11 != 91 || v4[2] != 67 || v4[3] != 68 || v4[4] != 65 || v4[5] != 84 || v4[6] != 65 || v4[7] != 91) {
    goto LABEL_56;
  }
  *a2 = (uint64_t)(v4 + 8);
  return sub_246CF0884(a1, a2);
}

uint64_t sub_246CF48F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(v2 + 8);
  uint64_t v4 = v3[11];
  if (v4) {
    int v5 = (void *)(v4 - 80);
  }
  else {
    int v5 = 0;
  }
  if (v5 != v3)
  {
    do
    {
      uint64_t v6 = v5[11];
      if (v6) {
        int v3 = (void *)(v6 - 80);
      }
      else {
        int v3 = 0;
      }
      sub_246CE5B48((uint64_t)v5);
      operator delete(v5);
      int v5 = v3;
    }
    while (v3 != *(void **)(v2 + 8));
  }
  operator delete(v3);
  MEMORY[0x24C5471E0](v2, 0x1020C402FC1992ELL);
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

void sub_246CF49B8(void *a1, uint64_t a2)
{
  uint64_t v4 = *(const char **)a2;
  size_t v5 = strlen(*(const char **)a2);
  if (v5 >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  size_t v6 = v5;
  if (v5 >= 0x17)
  {
    uint64_t v8 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17) {
      uint64_t v8 = v5 | 7;
    }
    uint64_t v9 = v8 + 1;
    int v7 = operator new(v8 + 1);
    a1[1] = v6;
    a1[2] = v9 | 0x8000000000000000;
    *a1 = v7;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v5;
    int v7 = a1;
    if (!v5)
    {
LABEL_9:
      v7[v6] = 0;
      sub_246CDA2BC(a1 + 3, (long long *)(a2 + 8));
    }
  }
  memmove(v7, v4, v6);
  goto LABEL_9;
}

void sub_246CF4A7C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CF4A98(std::string *this, std::string::value_type *a2)
{
  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  std::string::value_type v2 = *a2;
  if (*a2)
  {
    uint64_t v4 = (unsigned __int8 *)(a2 + 1);
    do
    {
      std::string::push_back(this, v2);
      int v5 = *v4++;
      std::string::value_type v2 = v5;
    }
    while (v5);
  }
}

void sub_246CF4AE0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CF4AFC(void *__dst, long long *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (*((char *)a2 + 23) < 0)
  {
    sub_246CC5E50(&__p, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long __p = *a2;
    uint64_t v4 = *((void *)a2 + 2);
  }
  if (SHIBYTE(v4) < 0)
  {
    sub_246CC5E50(__dst, (void *)__p, *((unint64_t *)&__p + 1));
    if (SHIBYTE(v4) < 0) {
      operator delete((void *)__p);
    }
  }
  else
  {
    *(_OWORD *)std::string __dst = __p;
    __dst[2] = v4;
  }
}

void sub_246CF4BD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a10)
  {
    if (a16 < 0)
    {
      operator delete(__p);
      _Unwind_Resume(exception_object);
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_246CF4C00(uint64_t a1, const std::locale *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  sub_246CE58A0((uint64_t)&v22);
  uint64_t v4 = (std::ios_base *)((char *)&v22 + (unint64_t)v22.__vftable[-1].~runtime_error);
  std::ios_base::getloc(v4);
  std::ios_base::imbue(v4, a2);
  std::locale::~locale((std::locale *)&__dst);
  rdbuf = (std::locale *)v4->__rdbuf_;
  if (rdbuf)
  {
    (*((void (**)(std::locale *, const std::locale *))rdbuf->__locale_ + 2))(rdbuf, a2);
    size_t v6 = rdbuf + 1;
    std::locale::locale((std::locale *)&v20, v6);
    std::locale::operator=(v6, a2);
    std::locale::~locale((std::locale *)&v20);
  }
  std::locale::~locale((std::locale *)&v19);
  sub_246CC7924(&v22, (uint64_t)"Lockup", 6);
  int v7 = *(_DWORD *)&v24[(unint64_t)v22.__vftable[-1].~runtime_error] & 5;
  if (v7)
  {
    char v33 = 0;
    goto LABEL_19;
  }
  if ((v31 & 0x10) != 0)
  {
    unint64_t v10 = v30;
    if (v30 < v27)
    {
      unint64_t v30 = v27;
      unint64_t v10 = v27;
    }
    int v11 = v26;
    std::string::size_type v8 = v10 - (void)v26;
    if (v10 - (unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_39;
    }
  }
  else
  {
    if ((v31 & 8) == 0)
    {
      std::string::size_type v8 = 0;
      *((unsigned char *)&__dst.__r_.__value_.__s + 23) = 0;
      p_dst = &__dst;
      goto LABEL_18;
    }
    int v11 = v23;
    std::string::size_type v8 = v25 - (void)v23;
    if ((unint64_t)(v25 - (void)v23) >= 0x7FFFFFFFFFFFFFF8) {
LABEL_39:
    }
      sub_246CC5D0C();
  }
  if (v8 >= 0x17)
  {
    uint64_t v12 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v12 = v8 | 7;
    }
    uint64_t v13 = v12 + 1;
    p_dst = (std::string *)operator new(v12 + 1);
    __dst.__r_.__value_.__l.__size_ = v8;
    __dst.__r_.__value_.__r.__words[2] = v13 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v8;
    p_dst = &__dst;
    if (!v8) {
      goto LABEL_18;
    }
  }
  memmove(p_dst, v11, v8);
LABEL_18:
  p_dst->__r_.__value_.__s.__data_[v8] = 0;
  std::string v34 = __dst;
  char v33 = 1;
LABEL_19:
  v22.__vftable = (std::runtime_error_vtbl *)*MEMORY[0x263F8C2C8];
  *(std::runtime_error_vtbl **)((char *)&v22.__vftable + (unint64_t)v22.__vftable[-1].~runtime_error) = *(std::runtime_error_vtbl **)(MEMORY[0x263F8C2C8] + 24);
  v22.__imp_.__imp_ = (const char *)(MEMORY[0x263F8C318] + 16);
  if (v29 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x24C547150](&v32);
  if (v7)
  {
    sub_246CC5444(&v19, "conversion of type \"");
    sub_246CCB99C((char *)(0x8000000246D20F53 & 0x7FFFFFFFFFFFFFFFLL), &v19, &v20);
    sub_246CCB99C("\" to data failed", &v20, &__dst);
    uint64_t v18 = 0;
    sub_246CE7C54(&v22, &__dst, &v18);
    v16.i64[0] = (uint64_t)"/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/"
                          "Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/lo"
                          "cal/include/boost/property_tree/detail/ptree_implementation.hpp";
    v16.i64[1] = (uint64_t)"void boost::property_tree::basic_ptree<std::string, std::string>::put_value(const Type &, Tran"
                          "slator) [Key = std::string, Data = std::string, KeyCompare = std::less<std::string>, Type = ch"
                          "ar[7], Translator = boost::property_tree::stream_translator<char, std::char_traits<char>, std:"
                          ":allocator<char>, char[7]>]";
    uint64_t v17 = 828;
    sub_246CE7BEC(&v22, &v16);
  }
  if (&v34 == (std::string *)a1) {
    goto LABEL_35;
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v14 = (v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &v34
        : (std::string *)v34.__r_.__value_.__r.__words[0];
    size_t v15 = (v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? HIBYTE(v34.__r_.__value_.__r.__words[2])
        : v34.__r_.__value_.__l.__size_;
    sub_246CC654C((void **)a1, v14, v15);
  }
  else if ((*((unsigned char *)&v34.__r_.__value_.__s + 23) & 0x80) != 0)
  {
    sub_246CC6484((void *)a1, v34.__r_.__value_.__l.__data_, v34.__r_.__value_.__l.__size_);
  }
  else
  {
    *(std::string *)a1 = v34;
  }
  if (v33)
  {
LABEL_35:
    if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v34.__r_.__value_.__l.__data_);
    }
  }
}

void sub_246CF502C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,std::runtime_error a32)
{
  if (a31 < 0)
  {
    operator delete(__p);
    if ((a25 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a19 & 0x80000000) == 0) {
LABEL_8:
      }
        _Unwind_Resume(a1);
LABEL_7:
      operator delete(a14);
      _Unwind_Resume(a1);
    }
  }
  else if ((a25 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a20);
  if ((a19 & 0x80000000) == 0) {
    goto LABEL_8;
  }
  goto LABEL_7;
}

void sub_246CF50F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::locale a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
}

void sub_246CF5110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  sub_246CE5A44((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_246CF5124(uint64_t a1, const std::locale *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  sub_246CE58A0((uint64_t)&v22);
  uint64_t v4 = (std::ios_base *)((char *)&v22 + (unint64_t)v22.__vftable[-1].~runtime_error);
  std::ios_base::getloc(v4);
  std::ios_base::imbue(v4, a2);
  std::locale::~locale((std::locale *)&__dst);
  rdbuf = (std::locale *)v4->__rdbuf_;
  if (rdbuf)
  {
    (*((void (**)(std::locale *, const std::locale *))rdbuf->__locale_ + 2))(rdbuf, a2);
    size_t v6 = rdbuf + 1;
    std::locale::locale((std::locale *)&v20, v6);
    std::locale::operator=(v6, a2);
    std::locale::~locale((std::locale *)&v20);
  }
  std::locale::~locale((std::locale *)&v19);
  sub_246CC7924(&v22, (uint64_t)"Fingerprint", 11);
  int v7 = *(_DWORD *)&v24[(unint64_t)v22.__vftable[-1].~runtime_error] & 5;
  if (v7)
  {
    char v33 = 0;
    goto LABEL_19;
  }
  if ((v31 & 0x10) != 0)
  {
    unint64_t v10 = v30;
    if (v30 < v27)
    {
      unint64_t v30 = v27;
      unint64_t v10 = v27;
    }
    int v11 = v26;
    std::string::size_type v8 = v10 - (void)v26;
    if (v10 - (unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_39;
    }
  }
  else
  {
    if ((v31 & 8) == 0)
    {
      std::string::size_type v8 = 0;
      *((unsigned char *)&__dst.__r_.__value_.__s + 23) = 0;
      p_dst = &__dst;
      goto LABEL_18;
    }
    int v11 = v23;
    std::string::size_type v8 = v25 - (void)v23;
    if ((unint64_t)(v25 - (void)v23) >= 0x7FFFFFFFFFFFFFF8) {
LABEL_39:
    }
      sub_246CC5D0C();
  }
  if (v8 >= 0x17)
  {
    uint64_t v12 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v12 = v8 | 7;
    }
    uint64_t v13 = v12 + 1;
    p_dst = (std::string *)operator new(v12 + 1);
    __dst.__r_.__value_.__l.__size_ = v8;
    __dst.__r_.__value_.__r.__words[2] = v13 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v8;
    p_dst = &__dst;
    if (!v8) {
      goto LABEL_18;
    }
  }
  memmove(p_dst, v11, v8);
LABEL_18:
  p_dst->__r_.__value_.__s.__data_[v8] = 0;
  std::string v34 = __dst;
  char v33 = 1;
LABEL_19:
  v22.__vftable = (std::runtime_error_vtbl *)*MEMORY[0x263F8C2C8];
  *(std::runtime_error_vtbl **)((char *)&v22.__vftable + (unint64_t)v22.__vftable[-1].~runtime_error) = *(std::runtime_error_vtbl **)(MEMORY[0x263F8C2C8] + 24);
  v22.__imp_.__imp_ = (const char *)(MEMORY[0x263F8C318] + 16);
  if (v29 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x24C547150](&v32);
  if (v7)
  {
    sub_246CC5444(&v19, "conversion of type \"");
    sub_246CCB99C((char *)(0x8000000246D20F58 & 0x7FFFFFFFFFFFFFFFLL), &v19, &v20);
    sub_246CCB99C("\" to data failed", &v20, &__dst);
    uint64_t v18 = 0;
    sub_246CE7C54(&v22, &__dst, &v18);
    v16.i64[0] = (uint64_t)"/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/"
                          "Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/lo"
                          "cal/include/boost/property_tree/detail/ptree_implementation.hpp";
    v16.i64[1] = (uint64_t)"void boost::property_tree::basic_ptree<std::string, std::string>::put_value(const Type &, Tran"
                          "slator) [Key = std::string, Data = std::string, KeyCompare = std::less<std::string>, Type = ch"
                          "ar[12], Translator = boost::property_tree::stream_translator<char, std::char_traits<char>, std"
                          "::allocator<char>, char[12]>]";
    uint64_t v17 = 828;
    sub_246CE7BEC(&v22, &v16);
  }
  if (&v34 == (std::string *)a1) {
    goto LABEL_35;
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v14 = (v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &v34
        : (std::string *)v34.__r_.__value_.__r.__words[0];
    size_t v15 = (v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? HIBYTE(v34.__r_.__value_.__r.__words[2])
        : v34.__r_.__value_.__l.__size_;
    sub_246CC654C((void **)a1, v14, v15);
  }
  else if ((*((unsigned char *)&v34.__r_.__value_.__s + 23) & 0x80) != 0)
  {
    sub_246CC6484((void *)a1, v34.__r_.__value_.__l.__data_, v34.__r_.__value_.__l.__size_);
  }
  else
  {
    *(std::string *)a1 = v34;
  }
  if (v33)
  {
LABEL_35:
    if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v34.__r_.__value_.__l.__data_);
    }
  }
}

void sub_246CF5550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,std::runtime_error a32)
{
  if (a31 < 0)
  {
    operator delete(__p);
    if ((a25 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a19 & 0x80000000) == 0) {
LABEL_8:
      }
        _Unwind_Resume(a1);
LABEL_7:
      operator delete(a14);
      _Unwind_Resume(a1);
    }
  }
  else if ((a25 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a20);
  if ((a19 & 0x80000000) == 0) {
    goto LABEL_8;
  }
  goto LABEL_7;
}

void sub_246CF5618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::locale a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
}

void sub_246CF5634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  sub_246CE5A44((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_246CF5648(uint64_t a1, const std::locale *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  sub_246CE58A0((uint64_t)&v22);
  uint64_t v4 = (std::ios_base *)((char *)&v22 + (unint64_t)v22.__vftable[-1].~runtime_error);
  std::ios_base::getloc(v4);
  std::ios_base::imbue(v4, a2);
  std::locale::~locale((std::locale *)&__dst);
  rdbuf = (std::locale *)v4->__rdbuf_;
  if (rdbuf)
  {
    (*((void (**)(std::locale *, const std::locale *))rdbuf->__locale_ + 2))(rdbuf, a2);
    size_t v6 = rdbuf + 1;
    std::locale::locale((std::locale *)&v20, v6);
    std::locale::operator=(v6, a2);
    std::locale::~locale((std::locale *)&v20);
  }
  std::locale::~locale((std::locale *)&v19);
  sub_246CC7924(&v22, (uint64_t)"http://www.w3.org/2000/svg", 26);
  int v7 = *(_DWORD *)&v24[(unint64_t)v22.__vftable[-1].~runtime_error] & 5;
  if (v7)
  {
    char v33 = 0;
    goto LABEL_19;
  }
  if ((v31 & 0x10) != 0)
  {
    unint64_t v10 = v30;
    if (v30 < v27)
    {
      unint64_t v30 = v27;
      unint64_t v10 = v27;
    }
    int v11 = v26;
    std::string::size_type v8 = v10 - (void)v26;
    if (v10 - (unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_39;
    }
  }
  else
  {
    if ((v31 & 8) == 0)
    {
      std::string::size_type v8 = 0;
      *((unsigned char *)&__dst.__r_.__value_.__s + 23) = 0;
      p_dst = &__dst;
      goto LABEL_18;
    }
    int v11 = v23;
    std::string::size_type v8 = v25 - (void)v23;
    if ((unint64_t)(v25 - (void)v23) >= 0x7FFFFFFFFFFFFFF8) {
LABEL_39:
    }
      sub_246CC5D0C();
  }
  if (v8 >= 0x17)
  {
    uint64_t v12 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v12 = v8 | 7;
    }
    uint64_t v13 = v12 + 1;
    p_dst = (std::string *)operator new(v12 + 1);
    __dst.__r_.__value_.__l.__size_ = v8;
    __dst.__r_.__value_.__r.__words[2] = v13 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v8;
    p_dst = &__dst;
    if (!v8) {
      goto LABEL_18;
    }
  }
  memmove(p_dst, v11, v8);
LABEL_18:
  p_dst->__r_.__value_.__s.__data_[v8] = 0;
  std::string v34 = __dst;
  char v33 = 1;
LABEL_19:
  v22.__vftable = (std::runtime_error_vtbl *)*MEMORY[0x263F8C2C8];
  *(std::runtime_error_vtbl **)((char *)&v22.__vftable + (unint64_t)v22.__vftable[-1].~runtime_error) = *(std::runtime_error_vtbl **)(MEMORY[0x263F8C2C8] + 24);
  v22.__imp_.__imp_ = (const char *)(MEMORY[0x263F8C318] + 16);
  if (v29 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x24C547150](&v32);
  if (v7)
  {
    sub_246CC5444(&v19, "conversion of type \"");
    sub_246CCB99C((char *)(0x8000000246D20F5ELL & 0x7FFFFFFFFFFFFFFFLL), &v19, &v20);
    sub_246CCB99C("\" to data failed", &v20, &__dst);
    uint64_t v18 = 0;
    sub_246CE7C54(&v22, &__dst, &v18);
    v16.i64[0] = (uint64_t)"/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/"
                          "Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/lo"
                          "cal/include/boost/property_tree/detail/ptree_implementation.hpp";
    v16.i64[1] = (uint64_t)"void boost::property_tree::basic_ptree<std::string, std::string>::put_value(const Type &, Tran"
                          "slator) [Key = std::string, Data = std::string, KeyCompare = std::less<std::string>, Type = ch"
                          "ar[27], Translator = boost::property_tree::stream_translator<char, std::char_traits<char>, std"
                          "::allocator<char>, char[27]>]";
    uint64_t v17 = 828;
    sub_246CE7BEC(&v22, &v16);
  }
  if (&v34 == (std::string *)a1) {
    goto LABEL_35;
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v14 = (v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &v34
        : (std::string *)v34.__r_.__value_.__r.__words[0];
    size_t v15 = (v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? HIBYTE(v34.__r_.__value_.__r.__words[2])
        : v34.__r_.__value_.__l.__size_;
    sub_246CC654C((void **)a1, v14, v15);
  }
  else if ((*((unsigned char *)&v34.__r_.__value_.__s + 23) & 0x80) != 0)
  {
    sub_246CC6484((void *)a1, v34.__r_.__value_.__l.__data_, v34.__r_.__value_.__l.__size_);
  }
  else
  {
    *(std::string *)a1 = v34;
  }
  if (v33)
  {
LABEL_35:
    if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v34.__r_.__value_.__l.__data_);
    }
  }
}

void sub_246CF5A74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,std::runtime_error a32)
{
  if (a31 < 0)
  {
    operator delete(__p);
    if ((a25 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a19 & 0x80000000) == 0) {
LABEL_8:
      }
        _Unwind_Resume(a1);
LABEL_7:
      operator delete(a14);
      _Unwind_Resume(a1);
    }
  }
  else if ((a25 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a20);
  if ((a19 & 0x80000000) == 0) {
    goto LABEL_8;
  }
  goto LABEL_7;
}

void sub_246CF5B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::locale a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
}

void sub_246CF5B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  sub_246CE5A44((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_246CF5B6C(uint64_t a1)
{
  std::string::value_type v2 = *(void **)(a1 + 152);
  if (v2)
  {
    *(void *)(a1 + 160) = v2;
    operator delete(v2);
  }
  int v3 = *(void **)(a1 + 128);
  if (v3)
  {
    *(void *)(a1 + 136) = v3;
    operator delete(v3);
  }
  uint64_t v4 = *(void **)(a1 + 104);
  if (v4)
  {
    *(void *)(a1 + 112) = v4;
    operator delete(v4);
  }
  uint64_t v5 = *(void **)(a1 + 80);
  if (v5)
  {
    *(void *)(a1 + 88) = v5;
    operator delete(v5);
  }
  size_t v6 = *(void **)(a1 + 56);
  if (v6)
  {
    *(void *)(a1 + 64) = v6;
    operator delete(v6);
  }
  int v7 = *(void **)(a1 + 32);
  if (v7)
  {
    *(void *)(a1 + 40) = v7;
    operator delete(v7);
  }
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void **)(v8 + 8);
  uint64_t v10 = v9[11];
  if (v10) {
    int v11 = (void *)(v10 - 80);
  }
  else {
    int v11 = 0;
  }
  if (v11 != v9)
  {
    do
    {
      uint64_t v12 = v11[11];
      if (v12) {
        uint64_t v9 = (void *)(v12 - 80);
      }
      else {
        uint64_t v9 = 0;
      }
      sub_246CE5B48((uint64_t)v11);
      operator delete(v11);
      int v11 = v9;
    }
    while (v9 != *(void **)(v8 + 8));
  }
  operator delete(v9);
  MEMORY[0x24C5471E0](v8, 0x1020C402FC1992ELL);
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_246CF5C8C(void *a1, uint64_t a2, long long *a3, uint64_t a4)
{
  memset(&v19, 0, sizeof(v19));
  std::string::push_back(&v19, 60);
  std::string::push_back(&v19, 63);
  std::string::push_back(&v19, 120);
  std::string::push_back(&v19, 109);
  std::string::push_back(&v19, 108);
  std::string::push_back(&v19, 32);
  std::string::push_back(&v19, 118);
  std::string::push_back(&v19, 101);
  std::string::push_back(&v19, 114);
  std::string::push_back(&v19, 115);
  std::string::push_back(&v19, 105);
  std::string::push_back(&v19, 111);
  std::string::push_back(&v19, 110);
  std::string::push_back(&v19, 61);
  std::string::push_back(&v19, 34);
  std::string::push_back(&v19, 49);
  std::string::push_back(&v19, 46);
  std::string::push_back(&v19, 48);
  std::string::push_back(&v19, 34);
  std::string::push_back(&v19, 32);
  std::string::push_back(&v19, 101);
  std::string::push_back(&v19, 110);
  std::string::push_back(&v19, 99);
  std::string::push_back(&v19, 111);
  std::string::push_back(&v19, 100);
  std::string::push_back(&v19, 105);
  std::string::push_back(&v19, 110);
  std::string::push_back(&v19, 103);
  std::string::push_back(&v19, 61);
  std::string::push_back(&v19, 34);
  if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v8 = &v19;
  }
  else {
    uint64_t v8 = (std::string *)v19.__r_.__value_.__r.__words[0];
  }
  if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v19.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v19.__r_.__value_.__l.__size_;
  }
  uint64_t v10 = sub_246CC7924(a1, (uint64_t)v8, size);
  int v11 = *(char *)(a4 + 39);
  if (v11 >= 0) {
    uint64_t v12 = a4 + 16;
  }
  else {
    uint64_t v12 = *(void *)(a4 + 16);
  }
  if (v11 >= 0) {
    uint64_t v13 = *(unsigned __int8 *)(a4 + 39);
  }
  else {
    uint64_t v13 = *(void *)(a4 + 24);
  }
  uint64_t v14 = sub_246CC7924(v10, v12, v13);
  memset(&v20, 0, sizeof(v20));
  std::string::push_back(&v20, 34);
  std::string::push_back(&v20, 63);
  std::string::push_back(&v20, 62);
  std::string::push_back(&v20, 10);
  if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t v15 = &v20;
  }
  else {
    size_t v15 = (std::string *)v20.__r_.__value_.__r.__words[0];
  }
  if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v16 = HIBYTE(v20.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v16 = v20.__r_.__value_.__l.__size_;
  }
  sub_246CC7924(v14, (uint64_t)v15, v16);
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v20.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v19.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_21;
    }
  }
  else if ((SHIBYTE(v19.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_21;
  }
  operator delete(v19.__r_.__value_.__l.__data_);
LABEL_21:
  memset(&v19, 0, sizeof(v19));
  sub_246CF6044(a1, (uint64_t)&v19, a2, -1, (unsigned __int8 *)a4);
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v19.__r_.__value_.__l.__data_);
  }
  if ((*((unsigned char *)a1 + *(void *)(*a1 - 24) + 32) & 5) != 0)
  {
    sub_246CC5444(&v20, "write error");
    sub_246CEF020((std::runtime_error *)&v19, (void **)&v20.__r_.__value_.__l.__data_, a3, 0);
    v19.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26FB3E368;
    v17.i64[0] = (uint64_t)"/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/"
                          "Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/lo"
                          "cal/include/boost/property_tree/detail/xml_parser_write.hpp";
    v17.i64[1] = (uint64_t)"void boost::property_tree::xml_parser::write_xml_internal(std::basic_ostream<typename Ptree::k"
                          "ey_type::value_type> &, const Ptree &, const std::string &, const xml_writer_settings<typename"
                          " Ptree::key_type> &) [Ptree = boost::property_tree::basic_ptree<std::string, std::string>]";
    uint64_t v18 = 190;
    sub_246CEC83C((uint64_t)&v19, &v17);
  }
}

void sub_246CF5FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::runtime_error a13, int a14, __int16 a15, char a16, char a17)
{
  sub_246CEC8A4(&a13);
  if (*(char *)(v17 - 49) < 0) {
    operator delete(*(void **)(v17 - 72));
  }
  _Unwind_Resume(a1);
}

void sub_246CF6044(void *a1, uint64_t a2, uint64_t a3, int a4, unsigned __int8 *a5)
{
  int v5 = a4;
  uint64_t v8 = *(unsigned __int8 *)(a3 + 23);
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a3 + 8);
  }
  BOOL v99 = v8 == 0;
  uint64_t v9 = *(void *)(*(void *)(a3 + 24) + 8);
  uint64_t v10 = *(void *)(v9 + 88);
  uint64_t v11 = *((void *)a5 + 1);
  if (v10) {
    uint64_t v12 = (unsigned __int8 *)(v10 - 80);
  }
  else {
    uint64_t v12 = 0;
  }
  if (v12 == (unsigned __int8 *)v9)
  {
LABEL_57:
    int v96 = 0;
    uint64_t v25 = *(unsigned __int8 *)(a3 + 23);
    if ((v25 & 0x80u) != 0) {
      uint64_t v25 = *(void *)(a3 + 8);
    }
    if (!v25) {
      goto LABEL_60;
    }
    goto LABEL_61;
  }
  while (1)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2691E2760, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_2691E2760))
    {
      sub_246CF4A98((std::string *)byte_2691E2778, "<xmlattr>");
      __cxa_atexit(MEMORY[0x263F8C0B8], byte_2691E2778, &dword_246CBB000);
      __cxa_guard_release(&qword_2691E2760);
      int v5 = a4;
    }
    uint64_t v14 = v12[23];
    if ((v14 & 0x80u) == 0) {
      uint64_t v15 = v12[23];
    }
    else {
      uint64_t v15 = *((void *)v12 + 1);
    }
    uint64_t v16 = byte_2691E2778[23];
    if (byte_2691E2778[23] < 0) {
      uint64_t v16 = *(void *)&byte_2691E2778[8];
    }
    if (v15 == v16)
    {
      if (byte_2691E2778[23] >= 0) {
        uint64_t v17 = byte_2691E2778;
      }
      else {
        uint64_t v17 = *(char **)byte_2691E2778;
      }
      if ((v14 & 0x80) != 0)
      {
        if (!memcmp(*(const void **)v12, v17, *((void *)v12 + 1))) {
          goto LABEL_9;
        }
      }
      else
      {
        if (!v12[23]) {
          goto LABEL_9;
        }
        uint64_t v18 = v12;
        while (*v18 == *v17)
        {
          ++v18;
          ++v17;
          if (!--v14) {
            goto LABEL_9;
          }
        }
      }
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2691E2768, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_2691E2768))
    {
      sub_246CF4A98((std::string *)&xmmword_2691E2790, "<xmltext>");
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_2691E2790, &dword_246CBB000);
      __cxa_guard_release(&qword_2691E2768);
      int v5 = a4;
    }
    uint64_t v19 = v12[23];
    if ((v19 & 0x80u) == 0) {
      uint64_t v20 = v12[23];
    }
    else {
      uint64_t v20 = *((void *)v12 + 1);
    }
    uint64_t v21 = byte_2691E27A7;
    if (byte_2691E27A7 < 0) {
      uint64_t v21 = *((void *)&xmmword_2691E2790 + 1);
    }
    if (v20 != v21) {
      goto LABEL_52;
    }
    if (byte_2691E27A7 >= 0) {
      std::runtime_error v22 = &xmmword_2691E2790;
    }
    else {
      std::runtime_error v22 = (long long *)xmmword_2691E2790;
    }
    if ((v19 & 0x80) != 0)
    {
      BOOL v99 = 0;
      if (memcmp(*(const void **)v12, v22, *((void *)v12 + 1))) {
        goto LABEL_53;
      }
      goto LABEL_9;
    }
    if (v12[23]) {
      break;
    }
LABEL_8:
    BOOL v99 = 0;
LABEL_9:
    uint64_t v13 = *((void *)v12 + 11);
    if (v13) {
      uint64_t v12 = (unsigned __int8 *)(v13 - 80);
    }
    else {
      uint64_t v12 = 0;
    }
    if (v12 == (unsigned __int8 *)v9) {
      goto LABEL_57;
    }
  }
  int v23 = v12;
  while (*v23 == *(unsigned __int8 *)v22)
  {
    ++v23;
    std::runtime_error v22 = (long long *)((char *)v22 + 1);
    if (!--v19) {
      goto LABEL_8;
    }
  }
LABEL_52:
  BOOL v99 = 0;
LABEL_53:
  int v96 = 1;
  uint64_t v24 = *(unsigned __int8 *)(a3 + 23);
  if ((v24 & 0x80u) != 0) {
    uint64_t v24 = *(void *)(a3 + 8);
  }
  if (!v24)
  {
LABEL_60:
    if (*(void *)(*(void *)(a3 + 24) + 24)) {
      goto LABEL_61;
    }
    if ((v5 & 0x80000000) == 0)
    {
      sub_246CF6DA8(a1, v5, *a5, *((void *)a5 + 1));
      __p.__r_.__value_.__s.__data_[0] = 60;
      unsigned __int8 v91 = sub_246CC7924(a1, (uint64_t)&__p, 1);
      int v92 = *(char *)(a2 + 23);
      if (v92 >= 0) {
        uint64_t v93 = a2;
      }
      else {
        uint64_t v93 = *(void *)a2;
      }
      if (v92 >= 0) {
        uint64_t v94 = *(unsigned __int8 *)(a2 + 23);
      }
      else {
        uint64_t v94 = *(void *)(a2 + 8);
      }
      char v85 = sub_246CC7924(v91, v93, v94);
      __p.__r_.__value_.__s.__data_[0] = 47;
      p_p = &__p;
      uint64_t v88 = 1;
      goto LABEL_210;
    }
    return;
  }
LABEL_61:
  if ((v5 & 0x80000000) == 0)
  {
    sub_246CF6DA8(a1, v5, *a5, *((void *)a5 + 1));
    __p.__r_.__value_.__s.__data_[0] = 60;
    long long v26 = sub_246CC7924(a1, (uint64_t)&__p, 1);
    int v27 = *(char *)(a2 + 23);
    if (v27 >= 0) {
      uint64_t v28 = a2;
    }
    else {
      uint64_t v28 = *(void *)a2;
    }
    if (v27 >= 0) {
      uint64_t v29 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      uint64_t v29 = *(void *)(a2 + 8);
    }
    sub_246CC7924(v26, v28, v29);
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2691E2760, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_2691E2760))
    {
      sub_246CF4A98((std::string *)byte_2691E2778, "<xmlattr>");
      __cxa_atexit(MEMORY[0x263F8C0B8], byte_2691E2778, &dword_246CBB000);
      __cxa_guard_release(&qword_2691E2760);
    }
    if (byte_2691E2778[23] < 0) {
      sub_246CC5E50(&__p, *(void **)byte_2691E2778, *(unint64_t *)&byte_2691E2778[8]);
    }
    else {
      std::string __p = *(std::string *)byte_2691E2778;
    }
    char v104 = 46;
    unint64_t v30 = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      unint64_t v30 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    int v105 = v30;
    sub_246CEB858(&v106, a3, (uint64_t)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      uint64_t v31 = v106;
      if (!v106) {
        goto LABEL_104;
      }
    }
    else
    {
      uint64_t v31 = v106;
      if (!v106) {
        goto LABEL_104;
      }
    }
    uint64_t v32 = *(void *)(*(void *)(v31 + 24) + 8);
    uint64_t v33 = *(void *)(v32 + 88);
    if (v33) {
      uint64_t v34 = v33 - 80;
    }
    else {
      uint64_t v34 = 0;
    }
    if (v34 != v32)
    {
      while (2)
      {
        __p.__r_.__value_.__s.__data_[0] = 32;
        int v36 = sub_246CC7924(a1, (uint64_t)&__p, 1);
        int v37 = *(char *)(v34 + 23);
        if (v37 >= 0) {
          uint64_t v38 = v34;
        }
        else {
          uint64_t v38 = *(void *)v34;
        }
        if (v37 >= 0) {
          uint64_t v39 = *(unsigned __int8 *)(v34 + 23);
        }
        else {
          uint64_t v39 = *(void *)(v34 + 8);
        }
        uint64_t v40 = sub_246CC7924(v36, v38, v39);
        __p.__r_.__value_.__s.__data_[0] = 61;
        int v41 = sub_246CC7924(v40, (uint64_t)&__p, 1);
        __p.__r_.__value_.__s.__data_[0] = 34;
        int v42 = sub_246CC7924(v41, (uint64_t)&__p, 1);
        sub_246CF4AFC(__dst, (long long *)(v34 + 24));
        sub_246CF6EC4(&__p, (uint64_t *)__dst);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v43 = &__p;
        }
        else {
          uint64_t v43 = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = __p.__r_.__value_.__l.__size_;
        }
        uint64_t v45 = sub_246CC7924(v42, (uint64_t)v43, size);
        char v107 = 34;
        sub_246CC7924(v45, (uint64_t)&v107, 1);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(__p.__r_.__value_.__l.__data_);
          if (v102 < 0) {
            goto LABEL_103;
          }
        }
        else if (v102 < 0)
        {
LABEL_103:
          operator delete(__dst[0]);
        }
        uint64_t v35 = *(void *)(v34 + 88);
        if (v35) {
          uint64_t v34 = v35 - 80;
        }
        else {
          uint64_t v34 = 0;
        }
        if (v34 == *(void *)(*(void *)(v31 + 24) + 8)) {
          break;
        }
        continue;
      }
    }
LABEL_104:
    if (v99)
    {
      __p.__r_.__value_.__s.__data_[0] = 47;
      uint64_t v46 = sub_246CC7924(a1, (uint64_t)&__p, 1);
      __p.__r_.__value_.__s.__data_[0] = 62;
      sub_246CC7924(v46, (uint64_t)&__p, 1);
      int v5 = a4;
      if (v11) {
        goto LABEL_106;
      }
    }
    else
    {
      __p.__r_.__value_.__s.__data_[0] = 62;
      sub_246CC7924(a1, (uint64_t)&__p, 1);
      int v90 = v96;
      int v5 = a4;
      if (!v11) {
        int v90 = 0;
      }
      if (v90 == 1)
      {
LABEL_106:
        __p.__r_.__value_.__s.__data_[0] = 10;
        sub_246CC7924(a1, (uint64_t)&__p, 1);
      }
    }
  }
  uint64_t v47 = *(unsigned __int8 *)(a3 + 23);
  if ((v47 & 0x80u) != 0) {
    uint64_t v47 = *(void *)(a3 + 8);
  }
  if (v47)
  {
    sub_246CF4AFC(&__p, (long long *)a3);
    int v48 = v11 ? v96 : 0;
    sub_246CF7450(a1, (uint64_t *)&__p, v5 + 1, v48, *a5, *((void *)a5 + 1));
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  uint64_t v49 = *(void *)(*(void *)(a3 + 24) + 8);
  uint64_t v50 = *(void *)(v49 + 88);
  if (v50) {
    int v51 = (unsigned __int8 *)(v50 - 80);
  }
  else {
    int v51 = 0;
  }
  if (v51 != (unsigned __int8 *)v49)
  {
    uint64_t v52 = (a4 + 1);
    int v53 = v96;
    if (!v11) {
      int v53 = 0;
    }
    int v98 = v53;
    do
    {
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2691E2760, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_2691E2760))
      {
        sub_246CF4A98((std::string *)byte_2691E2778, "<xmlattr>");
        __cxa_atexit(MEMORY[0x263F8C0B8], byte_2691E2778, &dword_246CBB000);
        __cxa_guard_release(&qword_2691E2760);
      }
      uint64_t v55 = v51[23];
      if ((v55 & 0x80u) == 0) {
        uint64_t v56 = v51[23];
      }
      else {
        uint64_t v56 = *((void *)v51 + 1);
      }
      uint64_t v57 = byte_2691E2778[23];
      if (byte_2691E2778[23] < 0) {
        uint64_t v57 = *(void *)&byte_2691E2778[8];
      }
      if (v56 == v57)
      {
        if (byte_2691E2778[23] >= 0) {
          int v58 = byte_2691E2778;
        }
        else {
          int v58 = *(char **)byte_2691E2778;
        }
        if ((v55 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v51, v58, *((void *)v51 + 1))) {
            goto LABEL_124;
          }
        }
        else
        {
          if (!v51[23]) {
            goto LABEL_124;
          }
          unsigned __int8 v59 = v51;
          while (*v59 == *v58)
          {
            ++v59;
            ++v58;
            if (!--v55) {
              goto LABEL_124;
            }
          }
        }
      }
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2691E2770, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_2691E2770))
      {
        sub_246CF4A98((std::string *)&xmmword_2691E27A8, "<xmlcomment>");
        __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_2691E27A8, &dword_246CBB000);
        __cxa_guard_release(&qword_2691E2770);
      }
      uint64_t v60 = v51[23];
      if ((v60 & 0x80u) == 0) {
        uint64_t v61 = v51[23];
      }
      else {
        uint64_t v61 = *((void *)v51 + 1);
      }
      uint64_t v62 = byte_2691E27BF;
      if (byte_2691E27BF < 0) {
        uint64_t v62 = *((void *)&xmmword_2691E27A8 + 1);
      }
      if (v61 == v62)
      {
        if (byte_2691E27BF >= 0) {
          int v63 = &xmmword_2691E27A8;
        }
        else {
          int v63 = (long long *)xmmword_2691E27A8;
        }
        if ((v60 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v51, v63, *((void *)v51 + 1)))
          {
LABEL_178:
            sub_246CF4AFC(&__p, (long long *)(v51 + 24));
            if (v11)
            {
              sub_246CF6DA8(a1, v52, *a5, *((void *)a5 + 1));
              LOBYTE(__dst[0]) = 60;
              uint64_t v70 = sub_246CC7924(a1, (uint64_t)__dst, 1);
              LOBYTE(__dst[0]) = 33;
              char v71 = sub_246CC7924(v70, (uint64_t)__dst, 1);
              LOBYTE(__dst[0]) = 45;
              char v72 = sub_246CC7924(v71, (uint64_t)__dst, 1);
              LOBYTE(__dst[0]) = 45;
              sub_246CC7924(v72, (uint64_t)__dst, 1);
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                unint64_t v73 = &__p;
              }
              else {
                unint64_t v73 = (std::string *)__p.__r_.__value_.__r.__words[0];
              }
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                std::string::size_type v74 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
              }
              else {
                std::string::size_type v74 = __p.__r_.__value_.__l.__size_;
              }
              sub_246CC7924(a1, (uint64_t)v73, v74);
              LOBYTE(__dst[0]) = 45;
              uint64_t v75 = sub_246CC7924(a1, (uint64_t)__dst, 1);
              LOBYTE(__dst[0]) = 45;
              uint64_t v76 = sub_246CC7924(v75, (uint64_t)__dst, 1);
              LOBYTE(__dst[0]) = 62;
              sub_246CC7924(v76, (uint64_t)__dst, 1);
              LOBYTE(__dst[0]) = 10;
              sub_246CC7924(a1, (uint64_t)__dst, 1);
            }
            else
            {
              LOBYTE(__dst[0]) = 60;
              int v77 = sub_246CC7924(a1, (uint64_t)__dst, 1);
              LOBYTE(__dst[0]) = 33;
              int v78 = sub_246CC7924(v77, (uint64_t)__dst, 1);
              LOBYTE(__dst[0]) = 45;
              int v79 = sub_246CC7924(v78, (uint64_t)__dst, 1);
              LOBYTE(__dst[0]) = 45;
              sub_246CC7924(v79, (uint64_t)__dst, 1);
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                unint64_t v80 = &__p;
              }
              else {
                unint64_t v80 = (std::string *)__p.__r_.__value_.__r.__words[0];
              }
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                std::string::size_type v81 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
              }
              else {
                std::string::size_type v81 = __p.__r_.__value_.__l.__size_;
              }
              sub_246CC7924(a1, (uint64_t)v80, v81);
              LOBYTE(__dst[0]) = 45;
              int v82 = sub_246CC7924(a1, (uint64_t)__dst, 1);
              LOBYTE(__dst[0]) = 45;
              uint64_t v83 = sub_246CC7924(v82, (uint64_t)__dst, 1);
              LOBYTE(__dst[0]) = 62;
              sub_246CC7924(v83, (uint64_t)__dst, 1);
            }
LABEL_193:
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
            goto LABEL_124;
          }
        }
        else
        {
          if (!v51[23]) {
            goto LABEL_178;
          }
          int v64 = v51;
          while (*v64 == *(unsigned __int8 *)v63)
          {
            ++v64;
            int v63 = (long long *)((char *)v63 + 1);
            if (!--v60) {
              goto LABEL_178;
            }
          }
        }
      }
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2691E2768, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_2691E2768))
      {
        sub_246CF4A98((std::string *)&xmmword_2691E2790, "<xmltext>");
        __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_2691E2790, &dword_246CBB000);
        __cxa_guard_release(&qword_2691E2768);
      }
      uint64_t v65 = v51[23];
      if ((v65 & 0x80u) == 0) {
        uint64_t v66 = v51[23];
      }
      else {
        uint64_t v66 = *((void *)v51 + 1);
      }
      uint64_t v67 = byte_2691E27A7;
      if (byte_2691E27A7 < 0) {
        uint64_t v67 = *((void *)&xmmword_2691E2790 + 1);
      }
      if (v66 == v67)
      {
        if (byte_2691E27A7 >= 0) {
          unint64_t v68 = &xmmword_2691E2790;
        }
        else {
          unint64_t v68 = (long long *)xmmword_2691E2790;
        }
        if ((v65 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v51, v68, *((void *)v51 + 1))) {
            goto LABEL_177;
          }
        }
        else
        {
          if (!v51[23])
          {
LABEL_177:
            sub_246CF4AFC(&__p, (long long *)(v51 + 24));
            sub_246CF7450(a1, (uint64_t *)&__p, v52, v98, *a5, *((void *)a5 + 1));
            goto LABEL_193;
          }
          int v69 = v51;
          while (*v69 == *(unsigned __int8 *)v68)
          {
            ++v69;
            unint64_t v68 = (long long *)((char *)v68 + 1);
            if (!--v65) {
              goto LABEL_177;
            }
          }
        }
      }
      sub_246CF6044(a1, v51, v51 + 24, v52, a5);
LABEL_124:
      uint64_t v54 = *((void *)v51 + 11);
      if (v54) {
        int v51 = (unsigned __int8 *)(v54 - 80);
      }
      else {
        int v51 = 0;
      }
    }
    while (v51 != *(unsigned __int8 **)(*(void *)(a3 + 24) + 8));
  }
  if (a4 >= 0 && !v99)
  {
    if (v96) {
      sub_246CF6DA8(a1, a4, *a5, *((void *)a5 + 1));
    }
    __p.__r_.__value_.__s.__data_[0] = 60;
    char v84 = sub_246CC7924(a1, (uint64_t)&__p, 1);
    __p.__r_.__value_.__s.__data_[0] = 47;
    char v85 = sub_246CC7924(v84, (uint64_t)&__p, 1);
    int v86 = *(char *)(a2 + 23);
    if (v86 >= 0) {
      p_p = (std::string *)a2;
    }
    else {
      p_p = *(std::string **)a2;
    }
    if (v86 >= 0) {
      uint64_t v88 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      uint64_t v88 = *(void *)(a2 + 8);
    }
LABEL_210:
    uint64_t v89 = sub_246CC7924(v85, (uint64_t)p_p, v88);
    __p.__r_.__value_.__s.__data_[0] = 62;
    sub_246CC7924(v89, (uint64_t)&__p, 1);
    if (v11)
    {
      __p.__r_.__value_.__s.__data_[0] = 10;
      sub_246CC7924(a1, (uint64_t)&__p, 1);
    }
  }
}

void sub_246CF6CC4(_Unwind_Exception *a1)
{
}

void sub_246CF6CDC(_Unwind_Exception *a1)
{
}

void sub_246CF6CF4(_Unwind_Exception *a1)
{
}

void sub_246CF6D0C(_Unwind_Exception *a1)
{
}

void sub_246CF6D24(_Unwind_Exception *a1)
{
}

void sub_246CF6D3C(_Unwind_Exception *a1)
{
}

void sub_246CF6D54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CF6DA8(void *a1, int a2, int __c, uint64_t a4)
{
  size_t v4 = a2 * a4;
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  if (v4 >= 0x17)
  {
    uint64_t v8 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v8 = v4 | 7;
    }
    uint64_t v9 = v8 + 1;
    p_b = (void **)operator new(v8 + 1);
    size_t v13 = v4;
    int64_t v14 = v9 | 0x8000000000000000;
    __b = p_b;
    goto LABEL_8;
  }
  HIBYTE(v14) = a2 * a4;
  p_b = (void **)&__b;
  if (v4) {
LABEL_8:
  }
    memset(p_b, __c, v4);
  *((unsigned char *)p_b + v4) = 0;
  if (v14 >= 0) {
    uint64_t v10 = (void **)&__b;
  }
  else {
    uint64_t v10 = __b;
  }
  if (v14 >= 0) {
    uint64_t v11 = HIBYTE(v14);
  }
  else {
    uint64_t v11 = v13;
  }
  sub_246CC7924(a1, (uint64_t)v10, v11);
  if (SHIBYTE(v14) < 0) {
    operator delete(__b);
  }
}

void sub_246CF6EA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CF6EC4(std::string *__dst, uint64_t *a2)
{
  std::string::value_type v2 = a2;
  uint64_t v4 = *((unsigned __int8 *)a2 + 23);
  if ((*((char *)a2 + 23) & 0x80000000) == 0)
  {
    if (!*((unsigned char *)a2 + 23))
    {
      *(_OWORD *)&__dst->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
      __dst->__r_.__value_.__r.__words[2] = a2[2];
      return;
    }
    __dst->__r_.__value_.__r.__words[0] = 0;
    __dst->__r_.__value_.__l.__size_ = 0;
    int v5 = a2;
    uint64_t v6 = v4;
    __dst->__r_.__value_.__r.__words[2] = 0;
LABEL_6:
    uint64_t v7 = 0;
    while (*((unsigned char *)v5 + v7) == 32)
    {
      if (v6 == ++v7) {
        goto LABEL_53;
      }
    }
    if (v7 != -1)
    {
      int v8 = (char)v4;
      uint64_t v9 = (uint64_t *)((char *)a2 + v4);
      if (v8 >= 0) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = (uint64_t *)(*a2 + a2[1]);
      }
      if (v8 < 0) {
        std::string::value_type v2 = (uint64_t *)*a2;
      }
      for (; v2 != v10; std::string::value_type v2 = (uint64_t *)((char *)v2 + 1))
      {
        switch(*(unsigned char *)v2)
        {
          case '""':
            memset(&__b, 0, sizeof(__b));
            std::string::push_back(&__b, 38);
            std::string::push_back(&__b, 113);
            std::string::push_back(&__b, 117);
            std::string::push_back(&__b, 111);
            std::string::push_back(&__b, 116);
            std::string::push_back(&__b, 59);
            if ((__b.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              p_b = &__b;
            }
            else {
              p_b = (std::string *)__b.__r_.__value_.__r.__words[0];
            }
            if ((__b.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type size = HIBYTE(__b.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type size = __b.__r_.__value_.__l.__size_;
            }
            goto LABEL_51;
          case '&':
            memset(&__b, 0, sizeof(__b));
            std::string::push_back(&__b, 38);
            std::string::push_back(&__b, 97);
            std::string::push_back(&__b, 109);
            std::string::push_back(&__b, 112);
            std::string::push_back(&__b, 59);
            if ((__b.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              p_b = &__b;
            }
            else {
              p_b = (std::string *)__b.__r_.__value_.__r.__words[0];
            }
            if ((__b.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type size = HIBYTE(__b.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type size = __b.__r_.__value_.__l.__size_;
            }
            goto LABEL_51;
          case '\'':
            memset(&__b, 0, sizeof(__b));
            std::string::push_back(&__b, 38);
            std::string::push_back(&__b, 97);
            std::string::push_back(&__b, 112);
            std::string::push_back(&__b, 111);
            std::string::push_back(&__b, 115);
            std::string::push_back(&__b, 59);
            if ((__b.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              p_b = &__b;
            }
            else {
              p_b = (std::string *)__b.__r_.__value_.__r.__words[0];
            }
            if ((__b.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type size = HIBYTE(__b.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type size = __b.__r_.__value_.__l.__size_;
            }
            goto LABEL_51;
          case '<':
            memset(&__b, 0, sizeof(__b));
            std::string::push_back(&__b, 38);
            std::string::push_back(&__b, 108);
            std::string::push_back(&__b, 116);
            std::string::push_back(&__b, 59);
            if ((__b.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              p_b = &__b;
            }
            else {
              p_b = (std::string *)__b.__r_.__value_.__r.__words[0];
            }
            if ((__b.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type size = HIBYTE(__b.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type size = __b.__r_.__value_.__l.__size_;
            }
            goto LABEL_51;
          case '>':
            memset(&__b, 0, sizeof(__b));
            std::string::push_back(&__b, 38);
            std::string::push_back(&__b, 103);
            std::string::push_back(&__b, 116);
            std::string::push_back(&__b, 59);
            if ((__b.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              p_b = &__b;
            }
            else {
              p_b = (std::string *)__b.__r_.__value_.__r.__words[0];
            }
            if ((__b.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type size = HIBYTE(__b.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type size = __b.__r_.__value_.__l.__size_;
            }
LABEL_51:
            std::string::append(__dst, (const std::string::value_type *)p_b, size);
            if (SHIBYTE(__b.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__b.__r_.__value_.__l.__data_);
            }
            break;
          default:
            std::string::push_back(__dst, *(unsigned char *)v2);
            break;
        }
      }
      return;
    }
LABEL_53:
    memset(&__b, 0, sizeof(__b));
    std::string::push_back(&__b, 38);
    std::string::push_back(&__b, 35);
    std::string::push_back(&__b, 51);
    std::string::push_back(&__b, 50);
    std::string::push_back(&__b, 59);
    if (SHIBYTE(__dst->__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__dst->__r_.__value_.__l.__data_);
    }
    *std::string __dst = __b;
    uint64_t v13 = *((unsigned __int8 *)v2 + 23);
    if ((v13 & 0x80u) != 0) {
      uint64_t v13 = v2[1];
    }
    std::string::size_type v14 = v13 - 1;
    if ((unint64_t)(v13 - 1) >= 0x7FFFFFFFFFFFFFF8) {
      sub_246CC5D0C();
    }
    if (v14 >= 0x17)
    {
      uint64_t v16 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v14 | 7) != 0x17) {
        uint64_t v16 = v14 | 7;
      }
      uint64_t v17 = v16 + 1;
      uint64_t v15 = operator new(v16 + 1);
      __b.__r_.__value_.__l.__size_ = v14;
      __b.__r_.__value_.__r.__words[2] = v17 | 0x8000000000000000;
      __b.__r_.__value_.__r.__words[0] = (std::string::size_type)v15;
    }
    else
    {
      *((unsigned char *)&__b.__r_.__value_.__s + 23) = v13 - 1;
      uint64_t v15 = &__b;
      if (v13 == 1) {
        goto LABEL_67;
      }
    }
    memset(v15, 32, v14);
LABEL_67:
    *((unsigned char *)v15 + v14) = 0;
    if ((__b.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v18 = &__b;
    }
    else {
      uint64_t v18 = (std::string *)__b.__r_.__value_.__r.__words[0];
    }
    if ((__b.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v19 = HIBYTE(__b.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v19 = __b.__r_.__value_.__l.__size_;
    }
    std::string::append(__dst, (const std::string::value_type *)v18, v19);
    if (SHIBYTE(__b.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__b.__r_.__value_.__l.__data_);
    }
    return;
  }
  uint64_t v6 = a2[1];
  if (v6)
  {
    __dst->__r_.__value_.__r.__words[0] = 0;
    __dst->__r_.__value_.__l.__size_ = 0;
    __dst->__r_.__value_.__r.__words[2] = 0;
    int v5 = (uint64_t *)*a2;
    goto LABEL_6;
  }
  uint64_t v20 = (void *)*a2;
  sub_246CC5E50(__dst, v20, 0);
}

void sub_246CF7360(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    if ((*(char *)(v15 + 23) & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((*(char *)(v15 + 23) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(*(void **)v15);
  _Unwind_Resume(exception_object);
}

void sub_246CF7450(void *a1, uint64_t *a2, int a3, int a4, int __c, uint64_t a6)
{
  if (a4) {
    sub_246CF6DA8(a1, a3, __c, a6);
  }
  sub_246CF6EC4(&__p, a2);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  sub_246CC7924(a1, (uint64_t)p_p, size);
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (!a4) {
      return;
    }
LABEL_13:
    __p.__r_.__value_.__s.__data_[0] = 10;
    sub_246CC7924(a1, (uint64_t)&__p, 1);
    return;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (a4) {
    goto LABEL_13;
  }
}

void sub_246CF7514(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

sqlite3 **sub_246CF7530(sqlite3 **a1, char *filename)
{
  std::string::value_type v2 = filename;
  *a1 = 0;
  ppDb = 0;
  if (filename[23] < 0)
  {
    if (!*((void *)filename + 1)) {
      return a1;
    }
    std::string::value_type v2 = *(const char **)filename;
  }
  else if (!filename[23])
  {
    return a1;
  }
  if (sqlite3_open_v2(v2, &ppDb, 65, 0))
  {
    if (ppDb) {
      sqlite3_close_v2(ppDb);
    }
  }
  else
  {
    uint64_t v4 = *a1;
    *a1 = ppDb;
    if (v4) {
      sqlite3_close_v2(v4);
    }
  }
  return a1;
}

void sub_246CF75C8(_Unwind_Exception *a1)
{
  sub_246CF75DC(v1);
  _Unwind_Resume(a1);
}

sqlite3 **sub_246CF75DC(sqlite3 **a1)
{
  std::string::value_type v2 = *a1;
  *a1 = 0;
  if (v2) {
    sqlite3_close_v2(v2);
  }
  return a1;
}

sqlite3 ***sub_246CF7614(sqlite3 ***a1)
{
  std::string::value_type v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    int v3 = *v2;
    *std::string::value_type v2 = 0;
    if (v3) {
      sqlite3_close_v2(v3);
    }
    MEMORY[0x24C5471E0](v2, 0x20C4093837F09);
  }
  return a1;
}

void sub_246CF7670(int *a1)
{
  uint64_t valuePtr = *a1;
  CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberNSIntegerType, &valuePtr);
  operator new();
}

void sub_246CF7764(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_246CF777C(_Unwind_Exception *a1)
{
}

void sub_246CF7790(uint64_t a1)
{
  int v1 = *(char *)(a1 + 23);
  if (v1 >= 0) {
    std::string::value_type v2 = (const UInt8 *)a1;
  }
  else {
    std::string::value_type v2 = *(const UInt8 **)a1;
  }
  if (v1 >= 0) {
    CFIndex v3 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    CFIndex v3 = *(void *)(a1 + 8);
  }
  CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], v2, v3, 0x8000100u, 0);
  operator new();
}

void sub_246CF789C(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_246CF78B4(_Unwind_Exception *a1)
{
}

CFIndex sub_246CF78C8@<X0>(CFIndex result@<X0>, std::string *a2@<X8>)
{
  if (!result) {
    goto LABEL_9;
  }
  CFStringRef v3 = (const __CFString *)result;
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t result = CFGetTypeID(v3);
  if (result != TypeID) {
    goto LABEL_9;
  }
  uint64_t result = CFStringGetLength(v3);
  if (result)
  {
    CFIndex v5 = result;
    CFIndex usedBufLen = 0;
    v10.location = 0;
    v10.length = result;
    uint64_t result = CFStringGetBytes(v3, v10, 0x8000100u, 0, 0, 0, 0, &usedBufLen);
    if (result > 0)
    {
      memset(&v8, 0, sizeof(v8));
      if (usedBufLen)
      {
        std::string::append(&v8, usedBufLen, 0);
        CFIndex v6 = usedBufLen;
        if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v7 = &v8;
        }
        else {
          uint64_t v7 = (std::string *)v8.__r_.__value_.__r.__words[0];
        }
      }
      else
      {
        CFIndex v6 = 0;
        uint64_t v7 = &v8;
      }
      v11.location = 0;
      v11.length = v5;
      uint64_t result = CFStringGetBytes(v3, v11, 0x8000100u, 0, 0, (UInt8 *)v7, v6, 0);
      *a2 = v8;
      goto LABEL_13;
    }
LABEL_9:
    a2->__r_.__value_.__s.__data_[0] = 0;
    a2[1].__r_.__value_.__s.__data_[0] = 0;
    return result;
  }
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
LABEL_13:
  a2[1].__r_.__value_.__s.__data_[0] = 1;
  return result;
}

void sub_246CF7A0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CF7A2C(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24C5471E0);
}

void sub_246CF7A64(uint64_t a1)
{
  int v1 = *(const void **)(a1 + 24);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_246CF7A88(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN4cv3d3kit2cf3PtrIPK10__CFNumberEC1ES5_EUlS5_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN4cv3d3kit2cf3PtrIPK10__CFNumberEC1ES5_EUlS5_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN4cv3d3kit2cf3PtrIPK10__CFNumberEC1ES5_EUlS5_E_")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN4cv3d3kit2cf3PtrIPK10__CFNumberEC1ES5_EUlS5_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void sub_246CF7AFC(int a1, CFTypeRef cf, int a3)
{
  if (a3) {
    sub_246CF7C34(&v3, cf);
  }
  CFTypeRef v3 = cf;
  operator new();
}

void sub_246CF7C08(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_246CF7C20(_Unwind_Exception *a1)
{
}

void sub_246CF7C34(void *a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  *a1 = cf;
  operator new();
}

void sub_246CF7CA8(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_246CF7CC0(_Unwind_Exception *a1)
{
}

void sub_246CF7CD8(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24C5471E0);
}

void sub_246CF7D10(uint64_t a1)
{
  int v1 = *(const void **)(a1 + 24);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_246CF7D34(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN4cv3d3kit2cf3PtrIP14__CFDictionaryEC1ES4_EUlS4_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN4cv3d3kit2cf3PtrIP14__CFDictionaryEC1ES4_EUlS4_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN4cv3d3kit2cf3PtrIP14__CFDictionaryEC1ES4_EUlS4_E_")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN4cv3d3kit2cf3PtrIP14__CFDictionaryEC1ES4_EUlS4_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void sub_246CF7DA8()
{
  CFAllocatorRef Default = CFAllocatorGetDefault();
  CFDataCreateMutable(Default, 0);
  operator new();
}

void sub_246CF7FA8(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_246CF7FBC()
{
}

void sub_246CF7FE8(_Unwind_Exception *a1)
{
}

void sub_246CF8014(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24C5471E0);
}

void sub_246CF804C(uint64_t a1)
{
  int v1 = *(const void **)(a1 + 24);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_246CF8070(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN4cv3d3kit2cf3PtrIP8__CFDataEC1ES4_EUlS4_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN4cv3d3kit2cf3PtrIP8__CFDataEC1ES4_EUlS4_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN4cv3d3kit2cf3PtrIP8__CFDataEC1ES4_EUlS4_E_")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN4cv3d3kit2cf3PtrIP8__CFDataEC1ES4_EUlS4_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void sub_246CF80E4(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_246CF80E4(a1, *(void *)a2);
    sub_246CF80E4(a1, *((void *)a2 + 1));
    if (a2[55] < 0)
    {
      operator delete(*((void **)a2 + 4));
      uint64_t v4 = a2;
    }
    else
    {
      uint64_t v4 = a2;
    }
    operator delete(v4);
  }
}

void sub_246CF816C(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24C5471E0);
}

void sub_246CF81A4(uint64_t a1)
{
  int v1 = *(const void **)(a1 + 24);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_246CF81C8(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN4cv3d3kit2cf3PtrIPK14__CFDictionaryEC1ES5_EUlS5_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN4cv3d3kit2cf3PtrIPK14__CFDictionaryEC1ES5_EUlS5_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN4cv3d3kit2cf3PtrIPK14__CFDictionaryEC1ES5_EUlS5_E_")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN4cv3d3kit2cf3PtrIPK14__CFDictionaryEC1ES5_EUlS5_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void sub_246CF823C()
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  sub_246CF7AFC((int)theDict, Mutable, 0);
}

void sub_246CF8804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __cxa_free_exception(v9);
  sub_246CC2068((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_246CF8820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_246CF8834(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, std::__shared_weak_count *a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a12 && !atomic_fetch_add(&a12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a12->__on_zero_shared)(a12);
    std::__shared_weak_count::__release_weak(a12);
  }
  if (a14 && !atomic_fetch_add(&a14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a14->__on_zero_shared)(a14);
    std::__shared_weak_count::__release_weak(a14);
  }
  if (a16)
  {
    if (!atomic_fetch_add(&a16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))a16->__on_zero_shared)(a16);
      std::__shared_weak_count::__release_weak(a16);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_246CF8928(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  uint64_t v4 = (std::__shared_weak_count *)a1[1];
  if (v4
    && (atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed),
        !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
    if (v5) {
LABEL_4:
    }
      sub_246CF7790(a3);
  }
  else if (v5)
  {
    goto LABEL_4;
  }
  return 0;
}

void sub_246CF8A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_246CF8AB0()
{
  v1[0] = 0;
  v1[1] = 0;
  std::string __p = v1;
  sub_246CF823C();
}

void sub_246CF9050()
{
}

void sub_246CF90BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (a10 && !atomic_fetch_add(&a10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a10->__on_zero_shared)(a10);
    std::__shared_weak_count::__release_weak(a10);
  }
  if (a16) {
    JUMPOUT(0x246CF9120);
  }
  JUMPOUT(0x246CF91A4);
}

void sub_246CF9168(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  JUMPOUT(0x246CF91A4);
}

void sub_246CF9188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char *a10)
{
}

void sub_246CF91A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a14)
  {
    if (!atomic_fetch_add(&a14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))a14->__on_zero_shared)(a14);
      std::__shared_weak_count::__release_weak(a14);
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_246CF91F4(const void **a1, CFTypeRef *a2)
{
  if (a2)
  {
    if (*a2) {
      CFRelease(*a2);
    }
    *a2 = 0;
    uint64_t v4 = *a1;
    if (v4) {
      CFRetain(v4);
    }
    *a2 = v4;
  }
}

void sub_246CF9244()
{
  v1[0] = 0;
  v1[1] = 0;
  uint64_t v0 = v1;
  sub_246CF823C();
}

void sub_246CF9338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, char *a13)
{
}

void sub_246CF9350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_246CF9364(int a1, CFTypeRef cf, uint64_t a3)
{
  if (a3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(a3 + 8), 1uLL, memory_order_relaxed);
  }
  if (cf) {
    CFRetain(cf);
  }
  operator new();
}

void sub_246CF94A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_246CF94BC(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_246CF94D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_246CF94F4(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24C5471E0);
}

void sub_246CF952C(uint64_t a1)
{
  int v1 = *(const void **)(a1 + 24);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_246CF9550(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN4cv3d3kit2cf3PtrIP9__CFErrorEC1ES4_EUlS4_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN4cv3d3kit2cf3PtrIP9__CFErrorEC1ES4_EUlS4_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN4cv3d3kit2cf3PtrIP9__CFErrorEC1ES4_EUlS4_E_")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN4cv3d3kit2cf3PtrIP9__CFErrorEC1ES4_EUlS4_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void sub_246CF95CC(int a1, unint64_t a2, unint64_t a3)
{
  CFIndex v6 = "";
  if (a1 == 12) {
    CFIndex v6 = " (ENOMEM)";
  }
  uint64_t v9 = v6;
  CFRange v11 = (char *)operator new(0x28uLL);
  long long v12 = xmmword_246D21280;
  strcpy(v11, "posix_memalign failed to allocate ");
  int v13 = 1;
  std::to_string(&v14, a2);
  uint64_t v16 = (std::string *)&v11;
  uint64_t v17 = &v14;
  uint64_t v18 = &v11;
  std::string::size_type v19 = &v14;
  uint64_t v20 = &v14;
  uint64_t v15 = &v16;
  ((void (*)(std::string ***, char **))off_26FB3E580[0])(&v15, &v11);
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  uint64_t v16 = (std::string *)&v11;
  uint64_t v17 = (std::string *)" bytes with alignment ";
  uint64_t v18 = &v11;
  std::string::size_type v19 = (std::string *)" bytes with alignment ";
  uint64_t v20 = (std::string *)" bytes with alignment ";
  if (v13 == -1) {
    sub_246CC66F0();
  }
  v14.__r_.__value_.__r.__words[0] = (std::string::size_type)&v16;
  ((void (*)(std::string *, char **))off_26FB3E590[v13])(&v14, &v11);
  std::to_string(&v14, a3);
  uint64_t v16 = (std::string *)&v11;
  uint64_t v17 = &v14;
  uint64_t v18 = &v11;
  std::string::size_type v19 = &v14;
  uint64_t v20 = &v14;
  if (v13 == -1) {
    sub_246CC66F0();
  }
  uint64_t v15 = &v16;
  ((void (*)(std::string ***, char **))off_26FB3E578[v13])(&v15, &v11);
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  uint64_t v16 = (std::string *)&v11;
  uint64_t v17 = (std::string *)": error code ";
  uint64_t v18 = &v11;
  std::string::size_type v19 = (std::string *)": error code ";
  uint64_t v20 = (std::string *)": error code ";
  if (v13 == -1) {
    sub_246CC66F0();
  }
  v14.__r_.__value_.__r.__words[0] = (std::string::size_type)&v16;
  ((void (*)(std::string *, char **))off_26FB3E5A8[v13])(&v14, &v11);
  std::to_string(&v14, a1);
  uint64_t v16 = (std::string *)&v11;
  uint64_t v17 = &v14;
  uint64_t v18 = &v11;
  std::string::size_type v19 = &v14;
  uint64_t v20 = &v14;
  if (v13 == -1) {
    sub_246CC66F0();
  }
  uint64_t v15 = &v16;
  ((void (*)(std::string ***, char **))off_26FB3E578[v13])(&v15, &v11);
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  uint64_t v16 = (std::string *)&v11;
  uint64_t v17 = (std::string *)&v9;
  uint64_t v18 = &v11;
  std::string::size_type v19 = (std::string *)&v9;
  uint64_t v20 = (std::string *)&v9;
  if (v13 == -1) {
    sub_246CC66F0();
  }
  v14.__r_.__value_.__r.__words[0] = (std::string::size_type)&v16;
  ((void (*)(std::string *, char **))off_26FB3E5C0[v13])(&v14, &v11);
  if (v13 == -1) {
    sub_246CC66F0();
  }
  uint64_t v16 = &v14;
  ((void (*)(std::string *__return_ptr, std::string **, char **))off_26FB3E5D8[v13])(&v10, &v16, &v11);
  if (v13 != -1) {
    ((void (*)(std::string **, char **))off_26FB3E560[v13])(&v16, &v11);
  }
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v7 = &v10;
  }
  else {
    uint64_t v7 = (std::string *)v10.__r_.__value_.__r.__words[0];
  }
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v10.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v10.__r_.__value_.__l.__size_;
  }
  sub_246CFADD0("/Library/Caches/com.apple.xbs/Sources/ACCBaker/library/Essentials/Array/src/ArrayBuffer.cpp", 37, (uint64_t)"", 0, (uint64_t)v7, size, (void (*)(void **))sub_246CFB2A4);
  std::string::~string(&v10);
  abort();
}

void sub_246CF98F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, int a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a15 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

size_t sub_246CF9990(void **a1)
{
  int v1 = (_DWORD *)**a1;
  std::string::value_type v2 = (const char *)(*a1)[1];
  uint64_t v3 = v1[6];
  if (v3 != -1) {
    ((void (*)(char *, _DWORD *))off_26FB3E560[v3])(&v9, v1);
  }
  v1[6] = -1;
  size_t result = strlen(v2);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  size_t v5 = result;
  if (result >= 0x17)
  {
    uint64_t v7 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v7 = result | 7;
    }
    uint64_t v8 = v7 + 1;
    CFIndex v6 = operator new(v7 + 1);
    *((void *)v1 + 1) = v5;
    *((void *)v1 + 2) = v8 | 0x8000000000000000;
    *(void *)int v1 = v6;
  }
  else
  {
    *((unsigned char *)v1 + 23) = result;
    CFIndex v6 = v1;
    if (!result) {
      goto LABEL_11;
    }
  }
  size_t result = (size_t)memmove(v6, v2, v5);
LABEL_11:
  *((unsigned char *)v6 + v5) = 0;
  v1[6] = 1;
  return result;
}

void sub_246CF9A80(uint64_t *a1, uint64_t a2)
{
  v19[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 16);
  *(void *)((char *)v19 + 7) = *(void *)(a2 + 15);
  uint64_t v4 = *(void **)a2;
  v19[0] = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 23);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  std::string v14 = v4;
  *(void *)uint64_t v15 = v19[0];
  *(void *)&v15[7] = *(void *)((char *)v19 + 7);
  char v16 = v5;
  memset(v19, 0, 15);
  CFIndex v6 = __p;
  uint64_t v7 = *(const char **)(v2 + 24);
  size_t v8 = strlen(v7);
  if (v8 >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  char v9 = (void *)v8;
  if (v8 >= 0x17)
  {
    uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v11 = v8 | 7;
    }
    uint64_t v12 = v11 + 1;
    CFIndex v6 = operator new(v11 + 1);
    __p[1] = v9;
    unint64_t v18 = v12 | 0x8000000000000000;
    __p[0] = v6;
LABEL_9:
    memmove(v6, v7, (size_t)v9);
    *((unsigned char *)v9 + (void)v6) = 0;
    uint64_t v10 = *(unsigned int *)(v3 + 24);
    if (v10 == -1) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  HIBYTE(v18) = v8;
  if (v8) {
    goto LABEL_9;
  }
  LOBYTE(__p[0]) = 0;
  uint64_t v10 = *(unsigned int *)(v3 + 24);
  if (v10 != -1) {
LABEL_10:
  }
    ((void (*)(char *, uint64_t))off_26FB3E560[v10])(&v13, v3);
LABEL_11:
  *(_DWORD *)(v3 + 24) = -1;
  sub_246CC68FC((void *)v3, (uint64_t)&v14, 2uLL);
  *(_DWORD *)(v3 + 24) = 2;
  if ((SHIBYTE(v18) & 0x80000000) == 0)
  {
    if ((v16 & 0x80000000) == 0) {
      return;
    }
LABEL_15:
    operator delete(v14);
    return;
  }
  operator delete(__p[0]);
  if (v16 < 0) {
    goto LABEL_15;
  }
}

void sub_246CF9C3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a2) {
    sub_246CC20E4(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CF9C80(uint64_t a1, void **a2)
{
  uint64_t v3 = *(const void **)(*(void *)a1 + 32);
  char v5 = a2[1];
  uint64_t v4 = a2[2];
  if (v5 < (void *)v4)
  {
    size_t v6 = strlen(*(const char **)(*(void *)a1 + 32));
    if (v6 > 0x7FFFFFFFFFFFFFF7) {
      sub_246CC5D0C();
    }
    size_t v7 = v6;
    if (v6 >= 0x17)
    {
      uint64_t v14 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v6 | 7) != 0x17) {
        uint64_t v14 = v6 | 7;
      }
      uint64_t v15 = v14 + 1;
      size_t v8 = operator new(v14 + 1);
      v5[1] = v7;
      int v5[2] = v15 | 0x8000000000000000;
      *char v5 = v8;
    }
    else
    {
      *((unsigned char *)v5 + 23) = v6;
      size_t v8 = v5;
      if (!v6) {
        goto LABEL_19;
      }
    }
    memmove(v8, v3, v7);
LABEL_19:
    *((unsigned char *)v8 + v7) = 0;
    char v16 = (char *)(v5 + 3);
    a2[1] = v5 + 3;
    goto LABEL_39;
  }
  unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (unsigned char *)*a2) >> 3);
  if (v9 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_246CC23A4();
  }
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a2) >> 3);
  uint64_t v11 = 2 * v10;
  if (2 * v10 <= v9 + 1) {
    uint64_t v11 = v9 + 1;
  }
  if (v10 >= 0x555555555555555) {
    unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v12 = v11;
  }
  if (v12)
  {
    if (v12 > 0xAAAAAAAAAAAAAAALL) {
      sub_246CC29A0();
    }
    char v13 = (char *)operator new(24 * v12);
  }
  else
  {
    char v13 = 0;
  }
  uint64_t v17 = &v13[24 * v9];
  size_t v18 = strlen((const char *)v3);
  if (v18 > 0x7FFFFFFFFFFFFFF7) {
    sub_246CC5D0C();
  }
  size_t v19 = v18;
  if (v18 >= 0x17)
  {
    uint64_t v24 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v18 | 7) != 0x17) {
      uint64_t v24 = v18 | 7;
    }
    uint64_t v25 = v24 + 1;
    uint64_t v20 = operator new(v24 + 1);
    *((void *)v17 + 1) = v19;
    *((void *)v17 + 2) = v25 | 0x8000000000000000;
    *(void *)uint64_t v17 = v20;
  }
  else
  {
    v17[23] = v18;
    uint64_t v20 = v17;
    if (!v18)
    {
      uint64_t v21 = &v13[24 * v12];
      *uint64_t v17 = 0;
      char v16 = v17 + 24;
      std::runtime_error v22 = (void **)*a2;
      int v23 = (void **)a2[1];
      if (v23 == *a2) {
        goto LABEL_36;
      }
      do
      {
LABEL_30:
        long long v26 = *(_OWORD *)(v23 - 3);
        *((void *)v17 - 1) = *(v23 - 1);
        *(_OWORD *)(v17 - 24) = v26;
        v17 -= 24;
        *(v23 - 2) = 0;
        *(v23 - 1) = 0;
        *(v23 - 3) = 0;
        v23 -= 3;
      }
      while (v23 != v22);
      int v23 = (void **)*a2;
      int v27 = (void **)a2[1];
      *a2 = v17;
      a2[1] = v16;
      a2[2] = v21;
      while (v27 != v23)
      {
        if (*((char *)v27 - 1) < 0) {
          operator delete(*(v27 - 3));
        }
        v27 -= 3;
      }
      goto LABEL_37;
    }
  }
  memmove(v20, v3, v19);
  uint64_t v21 = &v13[24 * v12];
  *((unsigned char *)v20 + v19) = 0;
  char v16 = v17 + 24;
  std::runtime_error v22 = (void **)*a2;
  int v23 = (void **)a2[1];
  if (v23 != *a2) {
    goto LABEL_30;
  }
LABEL_36:
  *a2 = v17;
  a2[1] = v16;
  a2[2] = v21;
LABEL_37:
  if (v23) {
    operator delete(v23);
  }
LABEL_39:
  a2[1] = v16;
}

void sub_246CF9F14(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CF9F2C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

size_t sub_246CF9F34(void **a1)
{
  uint64_t v1 = (_DWORD *)**a1;
  uint64_t v2 = (const char *)(*a1)[1];
  uint64_t v3 = v1[6];
  if (v3 != -1) {
    ((void (*)(char *, _DWORD *))off_26FB3E560[v3])(&v9, v1);
  }
  v1[6] = -1;
  size_t result = strlen(v2);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  size_t v5 = result;
  if (result >= 0x17)
  {
    uint64_t v7 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v7 = result | 7;
    }
    uint64_t v8 = v7 + 1;
    size_t v6 = operator new(v7 + 1);
    *((void *)v1 + 1) = v5;
    *((void *)v1 + 2) = v8 | 0x8000000000000000;
    *(void *)uint64_t v1 = v6;
  }
  else
  {
    *((unsigned char *)v1 + 23) = result;
    size_t v6 = v1;
    if (!result) {
      goto LABEL_11;
    }
  }
  size_t result = (size_t)memmove(v6, v2, v5);
LABEL_11:
  *((unsigned char *)v6 + v5) = 0;
  v1[6] = 1;
  return result;
}

void sub_246CFA024(uint64_t *a1, uint64_t a2)
{
  v19[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 16);
  *(void *)((char *)v19 + 7) = *(void *)(a2 + 15);
  uint64_t v4 = *(void **)a2;
  v19[0] = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 23);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  uint64_t v14 = v4;
  *(void *)uint64_t v15 = v19[0];
  *(void *)&v15[7] = *(void *)((char *)v19 + 7);
  char v16 = v5;
  memset(v19, 0, 15);
  size_t v6 = __p;
  uint64_t v7 = *(const char **)(v2 + 24);
  size_t v8 = strlen(v7);
  if (v8 >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  char v9 = (void *)v8;
  if (v8 >= 0x17)
  {
    uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v11 = v8 | 7;
    }
    uint64_t v12 = v11 + 1;
    size_t v6 = operator new(v11 + 1);
    __p[1] = v9;
    unint64_t v18 = v12 | 0x8000000000000000;
    __p[0] = v6;
LABEL_9:
    memmove(v6, v7, (size_t)v9);
    *((unsigned char *)v9 + (void)v6) = 0;
    uint64_t v10 = *(unsigned int *)(v3 + 24);
    if (v10 == -1) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  HIBYTE(v18) = v8;
  if (v8) {
    goto LABEL_9;
  }
  LOBYTE(__p[0]) = 0;
  uint64_t v10 = *(unsigned int *)(v3 + 24);
  if (v10 != -1) {
LABEL_10:
  }
    ((void (*)(char *, uint64_t))off_26FB3E560[v10])(&v13, v3);
LABEL_11:
  *(_DWORD *)(v3 + 24) = -1;
  sub_246CC68FC((void *)v3, (uint64_t)&v14, 2uLL);
  *(_DWORD *)(v3 + 24) = 2;
  if ((SHIBYTE(v18) & 0x80000000) == 0)
  {
    if ((v16 & 0x80000000) == 0) {
      return;
    }
LABEL_15:
    operator delete(v14);
    return;
  }
  operator delete(__p[0]);
  if (v16 < 0) {
    goto LABEL_15;
  }
}

void sub_246CFA1E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a2) {
    sub_246CC20E4(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CFA224(uint64_t a1, void **a2)
{
  uint64_t v3 = *(const void **)(*(void *)a1 + 32);
  char v5 = a2[1];
  uint64_t v4 = a2[2];
  if (v5 < (void *)v4)
  {
    size_t v6 = strlen(*(const char **)(*(void *)a1 + 32));
    if (v6 > 0x7FFFFFFFFFFFFFF7) {
      sub_246CC5D0C();
    }
    size_t v7 = v6;
    if (v6 >= 0x17)
    {
      uint64_t v14 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v6 | 7) != 0x17) {
        uint64_t v14 = v6 | 7;
      }
      uint64_t v15 = v14 + 1;
      size_t v8 = operator new(v14 + 1);
      v5[1] = v7;
      int v5[2] = v15 | 0x8000000000000000;
      *char v5 = v8;
    }
    else
    {
      *((unsigned char *)v5 + 23) = v6;
      size_t v8 = v5;
      if (!v6) {
        goto LABEL_19;
      }
    }
    memmove(v8, v3, v7);
LABEL_19:
    *((unsigned char *)v8 + v7) = 0;
    char v16 = (char *)(v5 + 3);
    a2[1] = v5 + 3;
    goto LABEL_39;
  }
  unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (unsigned char *)*a2) >> 3);
  if (v9 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_246CC23A4();
  }
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a2) >> 3);
  uint64_t v11 = 2 * v10;
  if (2 * v10 <= v9 + 1) {
    uint64_t v11 = v9 + 1;
  }
  if (v10 >= 0x555555555555555) {
    unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v12 = v11;
  }
  if (v12)
  {
    if (v12 > 0xAAAAAAAAAAAAAAALL) {
      sub_246CC29A0();
    }
    char v13 = (char *)operator new(24 * v12);
  }
  else
  {
    char v13 = 0;
  }
  uint64_t v17 = &v13[24 * v9];
  size_t v18 = strlen((const char *)v3);
  if (v18 > 0x7FFFFFFFFFFFFFF7) {
    sub_246CC5D0C();
  }
  size_t v19 = v18;
  if (v18 >= 0x17)
  {
    uint64_t v24 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v18 | 7) != 0x17) {
      uint64_t v24 = v18 | 7;
    }
    uint64_t v25 = v24 + 1;
    uint64_t v20 = operator new(v24 + 1);
    *((void *)v17 + 1) = v19;
    *((void *)v17 + 2) = v25 | 0x8000000000000000;
    *(void *)uint64_t v17 = v20;
  }
  else
  {
    v17[23] = v18;
    uint64_t v20 = v17;
    if (!v18)
    {
      uint64_t v21 = &v13[24 * v12];
      *uint64_t v17 = 0;
      char v16 = v17 + 24;
      std::runtime_error v22 = (void **)*a2;
      int v23 = (void **)a2[1];
      if (v23 == *a2) {
        goto LABEL_36;
      }
      do
      {
LABEL_30:
        long long v26 = *(_OWORD *)(v23 - 3);
        *((void *)v17 - 1) = *(v23 - 1);
        *(_OWORD *)(v17 - 24) = v26;
        v17 -= 24;
        *(v23 - 2) = 0;
        *(v23 - 1) = 0;
        *(v23 - 3) = 0;
        v23 -= 3;
      }
      while (v23 != v22);
      int v23 = (void **)*a2;
      int v27 = (void **)a2[1];
      *a2 = v17;
      a2[1] = v16;
      a2[2] = v21;
      while (v27 != v23)
      {
        if (*((char *)v27 - 1) < 0) {
          operator delete(*(v27 - 3));
        }
        v27 -= 3;
      }
      goto LABEL_37;
    }
  }
  memmove(v20, v3, v19);
  uint64_t v21 = &v13[24 * v12];
  *((unsigned char *)v20 + v19) = 0;
  char v16 = v17 + 24;
  std::runtime_error v22 = (void **)*a2;
  int v23 = (void **)a2[1];
  if (v23 != *a2) {
    goto LABEL_30;
  }
LABEL_36:
  *a2 = v17;
  a2[1] = v16;
  a2[2] = v21;
LABEL_37:
  if (v23) {
    operator delete(v23);
  }
LABEL_39:
  a2[1] = v16;
}

void sub_246CFA4B8(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CFA4D0(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

_DWORD *sub_246CFA4D8(_DWORD ***a1)
{
  return sub_246CC6740(**a1, (const char **)(*a1)[1]);
}

void sub_246CFA4E4(uint64_t *a1, uint64_t a2)
{
  v19[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 16);
  *(void *)((char *)v19 + 7) = *(void *)(a2 + 15);
  uint64_t v4 = *(void **)a2;
  v19[0] = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 23);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  uint64_t v14 = v4;
  *(void *)uint64_t v15 = v19[0];
  *(void *)&v15[7] = *(void *)((char *)v19 + 7);
  char v16 = v5;
  memset(v19, 0, 15);
  size_t v6 = __p;
  size_t v7 = **(const char ***)(v2 + 24);
  size_t v8 = strlen(v7);
  if (v8 >= 0x7FFFFFFFFFFFFFF8) {
    sub_246CC5D0C();
  }
  unint64_t v9 = (void *)v8;
  if (v8 >= 0x17)
  {
    uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v11 = v8 | 7;
    }
    uint64_t v12 = v11 + 1;
    size_t v6 = operator new(v11 + 1);
    __p[1] = v9;
    unint64_t v18 = v12 | 0x8000000000000000;
    __p[0] = v6;
LABEL_9:
    memmove(v6, v7, (size_t)v9);
    *((unsigned char *)v9 + (void)v6) = 0;
    uint64_t v10 = *(unsigned int *)(v3 + 24);
    if (v10 == -1) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  HIBYTE(v18) = v8;
  if (v8) {
    goto LABEL_9;
  }
  LOBYTE(__p[0]) = 0;
  uint64_t v10 = *(unsigned int *)(v3 + 24);
  if (v10 != -1) {
LABEL_10:
  }
    ((void (*)(char *, uint64_t))off_26FB3E560[v10])(&v13, v3);
LABEL_11:
  *(_DWORD *)(v3 + 24) = -1;
  sub_246CC68FC((void *)v3, (uint64_t)&v14, 2uLL);
  *(_DWORD *)(v3 + 24) = 2;
  if ((SHIBYTE(v18) & 0x80000000) == 0)
  {
    if ((v16 & 0x80000000) == 0) {
      return;
    }
LABEL_15:
    operator delete(v14);
    return;
  }
  operator delete(__p[0]);
  if (v16 < 0) {
    goto LABEL_15;
  }
}

void sub_246CFA6A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a2) {
    sub_246CC20E4(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CFA6E8(uint64_t a1, void **a2)
{
  uint64_t v3 = *(const char ***)(*(void *)a1 + 32);
  char v5 = a2[1];
  uint64_t v4 = a2[2];
  size_t v6 = *v3;
  if (v5 < (void *)v4)
  {
    size_t v7 = strlen(*v3);
    if (v7 > 0x7FFFFFFFFFFFFFF7) {
      sub_246CC5D0C();
    }
    size_t v8 = v7;
    if (v7 >= 0x17)
    {
      uint64_t v15 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v7 | 7) != 0x17) {
        uint64_t v15 = v7 | 7;
      }
      uint64_t v16 = v15 + 1;
      unint64_t v9 = operator new(v15 + 1);
      v5[1] = v8;
      int v5[2] = v16 | 0x8000000000000000;
      *char v5 = v9;
    }
    else
    {
      *((unsigned char *)v5 + 23) = v7;
      unint64_t v9 = v5;
      if (!v7) {
        goto LABEL_19;
      }
    }
    memmove(v9, v6, v8);
LABEL_19:
    *((unsigned char *)v9 + v8) = 0;
    uint64_t v17 = (char *)(v5 + 3);
    a2[1] = v5 + 3;
    goto LABEL_39;
  }
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (unsigned char *)*a2) >> 3);
  if (v10 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_246CC23A4();
  }
  unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a2) >> 3);
  uint64_t v12 = 2 * v11;
  if (2 * v11 <= v10 + 1) {
    uint64_t v12 = v10 + 1;
  }
  if (v11 >= 0x555555555555555) {
    unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v13 = v12;
  }
  if (v13)
  {
    if (v13 > 0xAAAAAAAAAAAAAAALL) {
      sub_246CC29A0();
    }
    uint64_t v14 = (char *)operator new(24 * v13);
  }
  else
  {
    uint64_t v14 = 0;
  }
  unint64_t v18 = &v14[24 * v10];
  size_t v19 = strlen(v6);
  if (v19 > 0x7FFFFFFFFFFFFFF7) {
    sub_246CC5D0C();
  }
  size_t v20 = v19;
  if (v19 >= 0x17)
  {
    uint64_t v25 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17) {
      uint64_t v25 = v19 | 7;
    }
    uint64_t v26 = v25 + 1;
    uint64_t v21 = operator new(v25 + 1);
    *((void *)v18 + 1) = v20;
    *((void *)v18 + 2) = v26 | 0x8000000000000000;
    *(void *)unint64_t v18 = v21;
  }
  else
  {
    v18[23] = v19;
    uint64_t v21 = v18;
    if (!v19)
    {
      std::runtime_error v22 = &v14[24 * v13];
      *unint64_t v18 = 0;
      uint64_t v17 = v18 + 24;
      int v23 = (void **)*a2;
      uint64_t v24 = (void **)a2[1];
      if (v24 == *a2) {
        goto LABEL_36;
      }
      do
      {
LABEL_30:
        long long v27 = *(_OWORD *)(v24 - 3);
        *((void *)v18 - 1) = *(v24 - 1);
        *(_OWORD *)(v18 - 24) = v27;
        v18 -= 24;
        *(v24 - 2) = 0;
        *(v24 - 1) = 0;
        *(v24 - 3) = 0;
        v24 -= 3;
      }
      while (v24 != v23);
      uint64_t v24 = (void **)*a2;
      uint64_t v28 = (void **)a2[1];
      *a2 = v18;
      a2[1] = v17;
      a2[2] = v22;
      while (v28 != v24)
      {
        if (*((char *)v28 - 1) < 0) {
          operator delete(*(v28 - 3));
        }
        v28 -= 3;
      }
      goto LABEL_37;
    }
  }
  memmove(v21, v6, v20);
  std::runtime_error v22 = &v14[24 * v13];
  *((unsigned char *)v21 + v20) = 0;
  uint64_t v17 = v18 + 24;
  int v23 = (void **)*a2;
  uint64_t v24 = (void **)a2[1];
  if (v24 != *a2) {
    goto LABEL_30;
  }
LABEL_36:
  *a2 = v18;
  a2[1] = v17;
  a2[2] = v22;
LABEL_37:
  if (v24) {
    operator delete(v24);
  }
LABEL_39:
  a2[1] = v17;
}

void sub_246CFA980(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CFA998(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_246CFA9A0(uint64_t a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = a2[1];
  std::string __p = 0;
  unint64_t v33 = 0;
  unint64_t v34 = 0;
  unint64_t v7 = v6 - 1;
  if (v6 != 1)
  {
    if ((v7 & 0x8000000000000000) != 0) {
      sub_246CC23A4();
    }
    unint64_t v8 = (unint64_t)(v6 - 2) >> 6;
    unint64_t v9 = operator new(8 * (v8 + 1));
    unint64_t v10 = v9;
    unint64_t v33 = v7;
    unint64_t v34 = v8 + 1;
    std::string __p = v9;
    if (v7 >= 0x41) {
      unint64_t v11 = v8;
    }
    else {
      unint64_t v11 = 0;
    }
    v9[v11] = 0;
    if (v7 >= 0x40) {
      bzero(v9, 8 * (v7 >> 6));
    }
    if ((v7 & 0x3F) != 0) {
      v10[v7 >> 6] &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v7 & 0x3F));
    }
  }
  sub_246CD3A18(a1, (uint64_t)&__p, (uint64_t)&v35);
  if (__p) {
    operator delete(__p);
  }
  uint64_t v12 = *(void *)(a1 + 8);
  unint64_t v13 = (char *)v35;
  if (v12)
  {
    unint64_t v14 = 0;
    uint64_t v15 = *a2;
    do
    {
      if ((*(void *)&v13[(v14 >> 3) & 0x1FFFFFFFFFFFFFF8] >> v14))
      {
        uint64_t v16 = a2[1];
        if (v16)
        {
          for (unint64_t i = 0; i != v16; ++i)
          {
            uint64_t v18 = ((v14 + i) >> 3) & 0x1FFFFFFFFFFFFFF8;
            uint64_t v19 = 1 << (v14 + i);
            uint64_t v20 = *(void *)&v13[v18];
            BOOL v21 = (v19 & v20) != 0;
            uint64_t v22 = v20 & ~v19;
            uint64_t v23 = v19 | v20;
            if ((((*(void *)(v15 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) >> i) ^ v21) & 1) == 0) {
              uint64_t v23 = v22;
            }
            *(void *)&v13[v18] = v23;
          }
        }
      }
      ++v14;
    }
    while (v14 != v12);
  }
  char v24 = v36;
  if (v36 >= (uint64_t)v7) {
    unint64_t v25 = v7;
  }
  else {
    unint64_t v25 = v36;
  }
  uint64_t v26 = v36 - v25;
  if (v26 < 0)
  {
    uint64_t v28 = v26 - 63;
    if (v26 - 63 < 0) {
      uint64_t v28 = v26;
    }
    uint64_t v27 = v28 >> 6;
  }
  else
  {
    uint64_t v27 = (unint64_t)v26 >> 6;
  }
  uint64_t v29 = &v13[8 * v27];
  unint64_t v30 = &v13[8 * ((unint64_t)v36 >> 6)];
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  uint64_t v31 = v26 & 0x3F;
  std::string __p = v29;
  LODWORD(v33) = v31;
  int v37 = v30;
  int v38 = v24 & 0x3F;
  sub_246CCC7E8(a3, (uint64_t)&__p, (uint64_t)&v37, (v24 & 0x3F) - v31 + 8 * (v30 - v29));
  if (v35) {
    operator delete(v35);
  }
}

void sub_246CFABB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_246CFABC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (!a9) {
    JUMPOUT(0x246CFABC0);
  }
  JUMPOUT(0x246CFABBCLL);
}

void *sub_246CFABD8(void *a1)
{
  uint64_t v2 = (void *)*a1;
  *a1 = 0;
  if (v2)
  {
    uint64_t v3 = (void *)v2[6];
    if (v3)
    {
      v2[7] = v3;
      operator delete(v3);
    }
    uint64_t v4 = (void *)v2[3];
    if (v4)
    {
      v2[4] = v4;
      operator delete(v4);
    }
    MEMORY[0x24C5471E0](v2, 0x1010C40DA3B4497);
  }
  return a1;
}

uint64_t sub_246CFAC40(void *a1, uint64_t a2, int a3)
{
  sub_246CC3F5C(&v12, *a1 + 16);
  sub_246CC4284(&v12, a2, a3);
  if (v15)
  {
    uint64_t v5 = v13;
    uint64_t v6 = v14;
    uint64_t v7 = *v14;
    *(void *)(v7 + 8) = *(void *)(v13 + 8);
    **(void **)(v5 + 8) = v7;
    uint64_t v15 = 0;
    if (v6 != &v13)
    {
      do
      {
        unint64_t v9 = (uint64_t *)v6[1];
        unint64_t v10 = (void *)v6[6];
        if (v10)
        {
          v6[7] = (uint64_t)v10;
          operator delete(v10);
        }
        unint64_t v11 = (void *)v6[3];
        if (v11)
        {
          v6[4] = (uint64_t)v11;
          operator delete(v11);
        }
        operator delete(v6);
        uint64_t v6 = v9;
      }
      while (v9 != &v13);
    }
  }
  return 1;
}

void sub_246CFAD0C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (!a12) {
    JUMPOUT(0x246CFACB8);
  }
  JUMPOUT(0x246CFAC90);
}

void sub_246CFAD24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *sub_246CFAD38(void *a1)
{
  if (a1[3])
  {
    uint64_t v2 = a1 + 1;
    uint64_t v3 = a1[1];
    uint64_t v4 = (uint64_t *)a1[2];
    uint64_t v5 = *v4;
    *(void *)(v5 + 8) = *(void *)(v3 + 8);
    **(void **)(v3 + 8) = v5;
    a1[3] = 0;
    if (v4 != a1 + 1)
    {
      do
      {
        uint64_t v7 = (uint64_t *)v4[1];
        unint64_t v8 = (void *)v4[6];
        if (v8)
        {
          v4[7] = (uint64_t)v8;
          operator delete(v8);
        }
        unint64_t v9 = (void *)v4[3];
        if (v9)
        {
          v4[4] = (uint64_t)v9;
          operator delete(v9);
        }
        operator delete(v4);
        uint64_t v4 = v7;
      }
      while (v7 != v2);
    }
  }
  return a1;
}

BOOL sub_246CFADD0(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(void **))
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2691E27C0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2691E27C0))
  {
    __cxa_atexit((void (*)(void *))sub_246CFB3E8, &qword_2691E27D8, &dword_246CBB000);
    __cxa_guard_release(&qword_2691E27C0);
  }
  if (!byte_2691E2800)
  {
    unint64_t v34 = a7;
    sub_246CC7148((uint64_t)v37);
    if (a4) {
      uint64_t v13 = "Assert: ";
    }
    else {
      uint64_t v13 = "Abort: ";
    }
    if (a4) {
      uint64_t v14 = 8;
    }
    else {
      uint64_t v14 = 7;
    }
    sub_246CC7924(v38, (uint64_t)v13, v14);
    size_t v15 = strlen(a1);
    uint64_t v16 = sub_246CC7924(v38, (uint64_t)a1, v15);
    sub_246CC7924(v16, (uint64_t)":", 1);
    std::ostream::operator<<();
    if (a4)
    {
      uint64_t v17 = sub_246CC7924(v38, (uint64_t)" : ", 3);
      sub_246CC7924(v17, a3, a4);
    }
    if (a6)
    {
      uint64_t v18 = sub_246CC7924(v38, (uint64_t)" : ", 3);
      sub_246CC7924(v18, a5, a6);
    }
    sub_246CC7924(v38, (uint64_t)"\n", 1);
    if ((v46 & 0x10) != 0)
    {
      unint64_t v21 = v45;
      if (v45 < v42)
      {
        unint64_t v45 = v42;
        unint64_t v21 = v42;
      }
      uint64_t v22 = v41;
      size_t v19 = v21 - (void)v41;
      if (v21 - (unint64_t)v41 >= 0x7FFFFFFFFFFFFFF8) {
        goto LABEL_45;
      }
    }
    else
    {
      if ((v46 & 8) == 0)
      {
        size_t v19 = 0;
        HIBYTE(v36) = 0;
        uint64_t v20 = __dst;
        goto LABEL_26;
      }
      uint64_t v22 = v39;
      size_t v19 = v40 - (void)v39;
      if ((unint64_t)(v40 - (void)v39) >= 0x7FFFFFFFFFFFFFF8) {
LABEL_45:
      }
        sub_246CC5D0C();
    }
    if (v19 >= 0x17)
    {
      uint64_t v23 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v19 | 7) != 0x17) {
        uint64_t v23 = v19 | 7;
      }
      uint64_t v24 = v23 + 1;
      uint64_t v20 = (void **)operator new(v23 + 1);
      __dst[1] = (void *)v19;
      int64_t v36 = v24 | 0x8000000000000000;
      __dst[0] = v20;
    }
    else
    {
      HIBYTE(v36) = v19;
      uint64_t v20 = __dst;
      if (!v19) {
        goto LABEL_26;
      }
    }
    memmove(v20, v22, v19);
LABEL_26:
    *((unsigned char *)v20 + v19) = 0;
    v37[0] = *MEMORY[0x263F8C2B8];
    uint64_t v25 = *(void *)(MEMORY[0x263F8C2B8] + 72);
    *(void *)((char *)v37 + *(void *)(v37[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
    v38[0] = v25;
    v38[1] = MEMORY[0x263F8C318] + 16;
    if (v44 < 0) {
      operator delete(__p);
    }
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x24C547150](&v47);
    if (v36 >= 0) {
      uint64_t v26 = __dst;
    }
    else {
      uint64_t v26 = (void **)__dst[0];
    }
    v34(v26);
    if (SHIBYTE(v36) < 0) {
      operator delete(__dst[0]);
    }
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2691E27C0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2691E27C0))
  {
    __cxa_atexit((void (*)(void *))sub_246CFB3E8, &qword_2691E27D8, &dword_246CBB000);
    __cxa_guard_release(&qword_2691E27C0);
  }
  if (byte_2691E2800) {
    BOOL v27 = byte_2691E2808 == 0;
  }
  else {
    BOOL v27 = 0;
  }
  if (!v27)
  {
    uint64_t v28 = qword_2691E27D8;
    uint64_t v29 = unk_2691E27E0;
    while (v28 != v29)
    {
      uint64_t v31 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v28;
      uint64_t v30 = *(void *)(v28 + 8);
      v28 += 16;
      v31(v30, a3, a4, a5, a6);
    }
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2691E27C0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2691E27C0))
  {
    __cxa_atexit((void (*)(void *))sub_246CFB3E8, &qword_2691E27D8, &dword_246CBB000);
    __cxa_guard_release(&qword_2691E27C0);
  }
  int v32 = byte_2691E2800;
  if (byte_2691E2800) {
    qword_2691E27F0(*(void *)algn_2691E27F8, a3, a4, a5, a6);
  }
  return v32 == 0;
}

void sub_246CFB274(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_246CFB2A4(char *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_246CFB4FC();
  size_t v3 = strlen(a1);
  sub_246CFB578((void **)v2 + 1, a1, v3);
  if (*((char *)v2 + 31) >= 0) {
    uint64_t v4 = (uint64_t)(v2 + 1);
  }
  else {
    uint64_t v4 = (uint64_t)v2[1];
  }
  qword_2691E2718 = v4;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2691E27D0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2691E27D0))
  {
    qword_2691E27C8 = (uint64_t)os_log_create("cv3d", "");
    __cxa_guard_release(&qword_2691E27D0);
  }
  uint64_t v5 = qword_2691E27C8;
  if (os_log_type_enabled((os_log_t)qword_2691E27C8, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315138;
    unint64_t v8 = a1;
    _os_log_impl(&dword_246CBB000, v5, OS_LOG_TYPE_FAULT, "%s", (uint8_t *)&v7, 0xCu);
  }
  return fputs(a1, (FILE *)*MEMORY[0x263EF8348]);
}

uint64_t sub_246CFB3E8(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t sub_246CFB41C(uint64_t result)
{
  uint64_t v1 = result;
  *(void *)size_t result = off_26FB3E600;
  qword_2691E2718 = 0;
  if (*(char *)(result + 31) < 0)
  {
    operator delete(*(void **)(result + 8));
    return v1;
  }
  return result;
}

void sub_246CFB484(uint64_t a1)
{
  *(void *)a1 = off_26FB3E600;
  qword_2691E2718 = 0;
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  JUMPOUT(0x24C5471E0);
}

uint64_t (***sub_246CFB4FC())()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2691E2810, memory_order_acquire) & 1) != 0
    || !__cxa_guard_acquire(&qword_2691E2810))
  {
    return &off_26BA5C888;
  }
  __cxa_atexit((void (*)(void *))sub_246CFB41C, &off_26BA5C888, &dword_246CBB000);
  __cxa_guard_release(&qword_2691E2810);
  return &off_26BA5C888;
}

void **sub_246CFB578(void **__dst, void *__src, size_t __len)
{
  LODWORD(v6) = *((char *)__dst + 23);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = (unint64_t)__dst[2];
    unint64_t v8 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (__len > v8)
    {
      size_t v11 = 0x7FFFFFFFFFFFFFF7;
      if (0x7FFFFFFFFFFFFFF7 - (v10 & 0x7FFFFFFFFFFFFFFFLL) >= __len - v8)
      {
        uint64_t v9 = *__dst;
        if (v8 > 0x3FFFFFFFFFFFFFF2)
        {
LABEL_15:
          int v7 = operator new(v11);
          memcpy(v7, __src, __len);
          if (v8 != 22) {
            operator delete(v9);
          }
          __dst[2] = (void *)(v11 | 0x8000000000000000);
          *std::string __dst = v7;
LABEL_23:
          __dst[1] = (void *)__len;
          goto LABEL_24;
        }
LABEL_8:
        unint64_t v12 = 2 * v8;
        if (__len > 2 * v8) {
          unint64_t v12 = __len;
        }
        uint64_t v13 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v13 = v12 | 7;
        }
        if (v12 >= 0x17) {
          size_t v11 = v13 + 1;
        }
        else {
          size_t v11 = 23;
        }
        goto LABEL_15;
      }
LABEL_25:
      sub_246CC5D0C();
    }
    unint64_t v6 = HIBYTE(v10);
    int v7 = *__dst;
  }
  else
  {
    int v7 = __dst;
    if (__len > 0x16)
    {
      if (__len - 0x7FFFFFFFFFFFFFF7 >= 0x800000000000001FLL)
      {
        unint64_t v8 = 22;
        uint64_t v9 = __dst;
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }
  if (__len)
  {
    memmove(v7, __src, __len);
    LOBYTE(v6) = *((unsigned char *)__dst + 23);
  }
  if ((v6 & 0x80) != 0) {
    goto LABEL_23;
  }
  *((unsigned char *)__dst + 23) = __len & 0x7F;
LABEL_24:
  *((unsigned char *)v7 + __len) = 0;
  return __dst;
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x270EE42A8]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x270EE5088](alloc, theString, separatorString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFStringRef CFURLCopyQueryString(CFURLRef anURL, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x270EE5358](anURL, charactersToLeaveEscaped);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x270EE53D8](allocator, originalString, charactersToLeaveEscaped);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5440](anURL);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string *__cdecl std::error_condition::message(std::string *__return_ptr retstr, const std::error_condition *this)
{
  return (std::string *)MEMORY[0x270F98270](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

const char *__cdecl std::exception::what(const std::exception *this)
{
  return (const char *)MEMORY[0x270F98310](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983D0](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983D8](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F984B0](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return (std::string *)MEMORY[0x270F98508](this, __pos, __n1, __s, __n2);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

void std::string::~string(std::string *this)
{
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98790]();
}

{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987C0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

void std::error_category::~error_category(std::error_category *this)
{
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

uint64_t std::stringbuf::operator=()
{
  return MEMORY[0x270F988D8]();
}

const std::error_category *std::generic_category(void)
{
  return (const std::error_category *)MEMORY[0x270F98918]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

double std::stod(const std::string *__str, size_t *__idx)
{
  MEMORY[0x270F98B68](__str, __idx);
  return result;
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x270F98C70](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x270F98C78](this);
}

void std::locale::~locale(std::locale *this)
{
}

const std::locale *__cdecl std::locale::operator=(std::locale *this, const std::locale *a2)
{
  return (const std::locale *)MEMORY[0x270F98C88](this, a2);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::swap(std::ios_base *this, std::ios_base *a2)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

std::locale std::ios_base::imbue(std::ios_base *this, const std::locale *__loc)
{
  return (std::locale)MEMORY[0x270F98D58](this, __loc);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x270F98DF8](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return (std::string *)MEMORY[0x270F98E00](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E20](retstr, __val);
}

void std::exception::~exception(std::exception *this)
{
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

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
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

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

void free(void *a1)
{
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x270F9B560](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}