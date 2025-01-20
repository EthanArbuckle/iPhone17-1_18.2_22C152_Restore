void sub_246D55A1C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_246D55A38(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

id _ANSTLoggingGetOSLogForCategoryANSTKit()
{
  if (qword_26B123178 != -1) {
    dispatch_once(&qword_26B123178, &unk_26FB41128);
  }
  v0 = (void *)qword_26B123180;
  return v0;
}

uint64_t sub_246D55BA0()
{
  qword_26B123180 = (uint64_t)os_log_create("com.apple.ANSTKit", "ANSTKit");
  return MEMORY[0x270F9A758]();
}

__CFString *ANSTISPInferenceVersionToNSString(uint64_t a1, const char *a2)
{
  if (a1 == 0x10000)
  {
    v3 = @"Version1";
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"UnknownVersion(0x%zx)", a1);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

__CFString *ANSTISPInferenceResolutionToNSString(uint64_t a1, const char *a2)
{
  if (a1)
  {
    if (a1 == 1)
    {
      v3 = @"1024x576";
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, a2, @"UnknownResolution(%zd)", a1);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = @"512x384";
  }
  return v3;
}

__CFString *ANSTISPInferenceFrameRateToNSString(uint64_t a1, const char *a2)
{
  if (a1)
  {
    if (a1 == 1)
    {
      v3 = @"Low";
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, a2, @"UnknownFrameRate(%zd)", a1);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = @"Standard";
  }
  return v3;
}

uint64_t ANSTSupportANE(void)
{
  if (qword_2691E43B0 != -1) {
    dispatch_once(&qword_2691E43B0, &unk_26FB41148);
  }
  return byte_2691E43B8;
}

uint64_t sub_246D567F8()
{
  uint64_t result = MGGetBoolAnswer();
  byte_2691E43B8 = result;
  return result;
}

uint64_t espressoPlanPriorityForQualityOfService(qos_class_t a1)
{
  HIDWORD(v2) = a1 - 9;
  LODWORD(v2) = a1 - 9;
  unsigned int v1 = v2 >> 3;
  if (v1 > 3) {
    return 0;
  }
  else {
    return dword_246D9ED40[v1];
  }
}

void sub_246D56A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_246D56DDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_246D56FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_246D570E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_246D572C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_246D5739C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 - 33) < 0) {
    operator delete(*(void **)(v1 - 56));
  }
  _Unwind_Resume(exception_object);
}

void sub_246D57594(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a16) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_246D57674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_246D577C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_246D578D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_246D57A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  _Unwind_Resume(a1);
}

void sub_246D57AD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_246D57B5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_246D57D5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_246D57E14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_246D57EC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_246D57F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_246D580BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  _Unwind_Resume(a1);
}

void sub_246D58188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_246D5822C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_246D582E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_246D58394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_246D58404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_246D58508(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_246D58654(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_246D588F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_246D58A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_246D58B30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ANSTBaseNetworkEspresso;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_246D58B5C(void *a1)
{
}

void sub_246D58BBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_246D58CF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_246D58D7C()
{
  v0 = (void *)qword_2691E43C8;
  qword_2691E43C8 = (uint64_t)&unk_26FB49928;
}

void *sub_246D58EA4(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_246D58F58();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_246D58F58()
{
}

void sub_246D58F70(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_246D58FCC(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_265202CD8, MEMORY[0x263F8C060]);
}

void sub_246D58FB8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_246D58FCC(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_246D59000()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void *sub_246D59034(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    v6 = result;
    uint64_t result = sub_246D590B0(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_246D59094(_Unwind_Exception *exception_object)
{
  v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_246D590B0(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_246D590F4();
  }
  uint64_t result = (char *)sub_246D5910C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void sub_246D590F4()
{
}

void *sub_246D5910C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_246D59000();
  }
  return operator new(8 * a2);
}

void sub_246D59144(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    sub_246D5919C(a1, *(void ***)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

void sub_246D5919C(int a1, void **__p)
{
  if (__p)
  {
    uint64_t v2 = __p;
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

char *sub_246D591E8(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  v9 = (void *)(a1 + 24);
  unint64_t v10 = sub_246D594B8(a1 + 24, (uint64_t)a2);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
    v15 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v15)
    {
      v16 = (char *)*v15;
      if (*v15)
      {
        do
        {
          unint64_t v17 = *((void *)v16 + 1);
          if (v17 == v11)
          {
            if (sub_246D59964(a1 + 32, (unsigned __int8 *)v16 + 16, a2)) {
              return v16;
            }
          }
          else
          {
            if (v14 > 1)
            {
              if (v17 >= v12) {
                v17 %= v12;
              }
            }
            else
            {
              v17 &= v12 - 1;
            }
            if (v17 != v4) {
              break;
            }
          }
          v16 = *(char **)v16;
        }
        while (v16);
      }
    }
  }
  v18 = (void *)(a1 + 16);
  v16 = (char *)operator new(0xD0uLL);
  *((_OWORD *)v16 + 1) = *(_OWORD *)a3;
  uint64_t v19 = *(void *)(a3 + 16);
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  long long v20 = *(_OWORD *)(a4 + 96);
  *(_OWORD *)(v16 + 152) = *(_OWORD *)(a4 + 112);
  long long v21 = *(_OWORD *)(a4 + 144);
  *(_OWORD *)(v16 + 168) = *(_OWORD *)(a4 + 128);
  *(_OWORD *)(v16 + 184) = v21;
  long long v22 = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(v16 + 88) = *(_OWORD *)(a4 + 48);
  long long v23 = *(_OWORD *)(a4 + 80);
  *(_OWORD *)(v16 + 104) = *(_OWORD *)(a4 + 64);
  *(_OWORD *)(v16 + 120) = v23;
  *(_OWORD *)(v16 + 136) = v20;
  long long v24 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v16 + 40) = *(_OWORD *)a4;
  *(void *)v16 = 0;
  *((void *)v16 + 1) = v11;
  *((void *)v16 + 4) = v19;
  *((void *)v16 + 25) = *(void *)(a4 + 160);
  *(_OWORD *)(v16 + 56) = v24;
  *(_OWORD *)(v16 + 72) = v22;
  float v25 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v26 = *(float *)(a1 + 32);
  if (!v12 || (float)(v26 * (float)v12) < v25)
  {
    BOOL v27 = 1;
    if (v12 >= 3) {
      BOOL v27 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v28 = v27 | (2 * v12);
    unint64_t v29 = vcvtps_u32_f32(v25 / v26);
    if (v28 <= v29) {
      size_t v30 = v29;
    }
    else {
      size_t v30 = v28;
    }
    sub_246D59A0C(a1, v30);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v4 = v11 % v12;
      }
      else {
        unint64_t v4 = v11;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v11;
    }
  }
  uint64_t v31 = *(void *)a1;
  v32 = *(void **)(*(void *)a1 + 8 * v4);
  if (v32)
  {
    *(void *)v16 = *v32;
LABEL_38:
    void *v32 = v16;
    goto LABEL_39;
  }
  *(void *)v16 = *v18;
  void *v18 = v16;
  *(void *)(v31 + 8 * v4) = v18;
  if (*(void *)v16)
  {
    unint64_t v33 = *(void *)(*(void *)v16 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v33 >= v12) {
        v33 %= v12;
      }
    }
    else
    {
      v33 &= v12 - 1;
    }
    v32 = (void *)(*(void *)a1 + 8 * v33);
    goto LABEL_38;
  }
LABEL_39:
  ++*v9;
  return v16;
}

void sub_246D5949C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_246D59C58(v13, v12);
  _Unwind_Resume(a1);
}

unint64_t sub_246D594B8(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }
  return sub_246D594F8((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t sub_246D594F8(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      long long v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64;
      }
      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return sub_246D598A4(a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return sub_246D597F8(a2, a3);
  }
  else
  {
    return sub_246D59700(a2, a3);
  }
}

unint64_t sub_246D59700(_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t sub_246D597F8(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273 * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t sub_246D598A4(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127 * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(void *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t sub_246D59964(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0;
  }
  if (v7 < 0) {
    uint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void sub_246D59A0C(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_246D59AFC(a1, prime);
    }
  }
}

void sub_246D59AFC(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_246D59000();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      int v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *uint64_t v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            int v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          int v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    int v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void sub_246D59C58(uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

unsigned __int8 *sub_246D59CB8(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  unint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = sub_246D594B8(a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    BOOL v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (sub_246D59964(a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  uint64_t v17 = operator new(0x40uLL);
  v29[0] = v17;
  v29[1] = a1 + 16;
  void *v17 = 0;
  v17[1] = v10;
  uint64_t v18 = *a4;
  long long v19 = **a4;
  v17[4] = *((void *)*a4 + 2);
  *((_OWORD *)v17 + 1) = v19;
  *((void *)v18 + 1) = 0;
  *((void *)v18 + 2) = 0;
  *(void *)uint64_t v18 = 0;
  v17[6] = 0;
  v17[7] = 0;
  v17[5] = 0;
  char v30 = 1;
  float v20 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v21 = *(float *)(a1 + 32);
  if (!v11 || (float)(v21 * (float)v11) < v20)
  {
    BOOL v22 = 1;
    if (v11 >= 3) {
      BOOL v22 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v11);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      size_t v25 = v24;
    }
    else {
      size_t v25 = v23;
    }
    sub_246D59A0C(a1, v25);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  uint64_t v26 = *(void **)(*(void *)a1 + 8 * v4);
  if (v26)
  {
    *(void *)v29[0] = *v26;
    *uint64_t v26 = v29[0];
  }
  else
  {
    *(void *)v29[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v29[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v29[0])
    {
      unint64_t v27 = *(void *)(*(void *)v29[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v27 >= v11) {
          v27 %= v11;
        }
      }
      else
      {
        v27 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v27) = v29[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v29[0];
  v29[0] = 0;
  ++*v8;
  sub_246D59F60((uint64_t)v29, 0);
  return i;
}

void sub_246D59F48(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_246D59F60((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void sub_246D59F60(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      sub_246D59FB8((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

void sub_246D59FB8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v3 = *(void **)a1;
    operator delete(v3);
  }
}

void sub_246D5A010(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_246D5A06C(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_265202CE0, MEMORY[0x263F8C068]);
}

void sub_246D5A058(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_246D5A06C(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

char *sub_246D5A0A0(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  unint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = sub_246D594B8(a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    BOOL v14 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      uint64_t v15 = (char *)*v14;
      if (*v14)
      {
        do
        {
          unint64_t v16 = *((void *)v15 + 1);
          if (v16 == v10)
          {
            if (sub_246D59964(a1 + 32, (unsigned __int8 *)v15 + 16, a2)) {
              return v15;
            }
          }
          else
          {
            if (v13 > 1)
            {
              if (v16 >= v11) {
                v16 %= v11;
              }
            }
            else
            {
              v16 &= v11 - 1;
            }
            if (v16 != v4) {
              break;
            }
          }
          uint64_t v15 = *(char **)v15;
        }
        while (v15);
      }
    }
  }
  uint64_t v17 = (void *)(a1 + 16);
  uint64_t v15 = (char *)operator new(0xD0uLL);
  *(void *)uint64_t v15 = 0;
  *((void *)v15 + 1) = v10;
  uint64_t v18 = *a4;
  long long v19 = **a4;
  *((void *)v15 + 4) = *((void *)*a4 + 2);
  *((_OWORD *)v15 + 1) = v19;
  *((void *)v18 + 1) = 0;
  *((void *)v18 + 2) = 0;
  *(void *)uint64_t v18 = 0;
  *(_OWORD *)(v15 + 40) = 0u;
  *(_OWORD *)(v15 + 56) = 0u;
  *(_OWORD *)(v15 + 72) = 0u;
  *(_OWORD *)(v15 + 88) = 0u;
  *(_OWORD *)(v15 + 104) = 0u;
  *(_OWORD *)(v15 + 120) = 0u;
  *(_OWORD *)(v15 + 136) = 0u;
  *(_OWORD *)(v15 + 152) = 0u;
  *(_OWORD *)(v15 + 168) = 0u;
  *(_OWORD *)(v15 + 184) = 0u;
  *((void *)v15 + 25) = 0;
  float v20 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v21 = *(float *)(a1 + 32);
  if (!v11 || (float)(v21 * (float)v11) < v20)
  {
    BOOL v22 = 1;
    if (v11 >= 3) {
      BOOL v22 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v11);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      size_t v25 = v24;
    }
    else {
      size_t v25 = v23;
    }
    sub_246D59A0C(a1, v25);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  uint64_t v26 = *(void *)a1;
  unint64_t v27 = *(void **)(*(void *)a1 + 8 * v4);
  if (v27)
  {
    *(void *)uint64_t v15 = *v27;
LABEL_38:
    *unint64_t v27 = v15;
    goto LABEL_39;
  }
  *(void *)uint64_t v15 = *v17;
  void *v17 = v15;
  *(void *)(v26 + 8 * v4) = v17;
  if (*(void *)v15)
  {
    unint64_t v28 = *(void *)(*(void *)v15 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v28 >= v11) {
        v28 %= v11;
      }
    }
    else
    {
      v28 &= v11 - 1;
    }
    unint64_t v27 = (void *)(*(void *)a1 + 8 * v28);
    goto LABEL_38;
  }
LABEL_39:
  ++*v8;
  return v15;
}

void sub_246D5A33C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  sub_246D59C58(v11, v10);
  _Unwind_Resume(a1);
}

void *sub_246D5A358(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  unint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = sub_246D594B8(a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    BOOL v14 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(void **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (sub_246D59964(a1 + 32, (unsigned __int8 *)i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  uint64_t v17 = (void *)(a1 + 16);
  uint64_t i = operator new(0x30uLL);
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v10;
  uint64_t v18 = *a4;
  long long v19 = **a4;
  *((void *)i + 4) = *((void *)*a4 + 2);
  *((_OWORD *)i + 1) = v19;
  *((void *)v18 + 1) = 0;
  *((void *)v18 + 2) = 0;
  *(void *)uint64_t v18 = 0;
  *((void *)i + 5) = 0;
  float v20 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v21 = *(float *)(a1 + 32);
  if (!v11 || (float)(v21 * (float)v11) < v20)
  {
    BOOL v22 = 1;
    if (v11 >= 3) {
      BOOL v22 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v11);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      size_t v25 = v24;
    }
    else {
      size_t v25 = v23;
    }
    sub_246D59A0C(a1, v25);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  uint64_t v26 = *(void *)a1;
  unint64_t v27 = *(void **)(*(void *)a1 + 8 * v4);
  if (v27)
  {
    *(void *)uint64_t i = *v27;
LABEL_38:
    *unint64_t v27 = i;
    goto LABEL_39;
  }
  *(void *)uint64_t i = *v17;
  void *v17 = i;
  *(void *)(v26 + 8 * v4) = v17;
  if (*(void *)i)
  {
    unint64_t v28 = *(void *)(*(void *)i + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v28 >= v11) {
        v28 %= v11;
      }
    }
    else
    {
      v28 &= v11 - 1;
    }
    unint64_t v27 = (void *)(*(void *)a1 + 8 * v28);
    goto LABEL_38;
  }
LABEL_39:
  ++*v8;
  return i;
}

void sub_246D5A5C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  sub_246D59C58(v11, v10);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_246D5A5E4(void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = sub_246D594B8((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  unint64_t v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  uint64_t v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v13 == v6)
      {
        if (sub_246D59964(v12, v11 + 16, a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      uint64_t v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

unsigned __int8 *sub_246D5A6E8(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  unint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = sub_246D594B8(a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    BOOL v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (sub_246D59964(a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  sub_246D5A980(a1, v10, a4, (uint64_t)v26);
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    BOOL v19 = 1;
    if (v11 >= 3) {
      BOOL v19 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v11);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    sub_246D59A0C(a1, v22);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  unint64_t v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    *unint64_t v23 = v26[0];
  }
  else
  {
    *(void *)v26[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v26[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v26[0])
    {
      unint64_t v24 = *(void *)(*(void *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11) {
          v24 %= v11;
        }
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v24) = v26[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v26[0];
  ++*v8;
  return i;
}

void sub_246D5A95C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p) {
    sub_246D59C58((uint64_t)&a13, __p);
  }
  _Unwind_Resume(exception_object);
}

double sub_246D5A980@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (char *)operator new(0xD0uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  unint64_t v9 = v8 + 16;
  unint64_t v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    sub_246D5AA58(v9, *(void **)v10, *((void *)v10 + 1));
  }
  else
  {
    long long v11 = *v10;
    *((void *)v8 + 4) = *((void *)v10 + 2);
    *(_OWORD *)unint64_t v9 = v11;
  }
  *((void *)v8 + 25) = 0;
  double result = 0.0;
  *(_OWORD *)(v8 + 184) = 0u;
  *(_OWORD *)(v8 + 168) = 0u;
  *(_OWORD *)(v8 + 152) = 0u;
  *(_OWORD *)(v8 + 136) = 0u;
  *(_OWORD *)(v8 + 120) = 0u;
  *(_OWORD *)(v8 + 104) = 0u;
  *(_OWORD *)(v8 + 88) = 0u;
  *(_OWORD *)(v8 + 72) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_246D5AA3C(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  sub_246D59C58(v3, v2);
  _Unwind_Resume(a1);
}

void *sub_246D5AA58(unsigned char *__dst, void *__src, unint64_t a3)
{
  int8x8_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_246D58F58();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    unint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *int8x8_t v5 = v8;
    int8x8_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

uint64_t sub_246D5AAF8(uint64_t a1)
{
  sub_246D5919C(a1, *(void ***)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

uint64_t sub_246D5AB34(uint64_t a1)
{
  sub_246D5AB70(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_246D5AB70(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      uint64_t v3 = (void *)*v2;
      sub_246D59FB8((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t sub_246D5ABB4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2082;
  *(void *)(a2 + 14) = result;
  return result;
}

void sub_246D5ABC8(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t sub_246D5ABE4(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 4) = v3;
  *(_WORD *)(a3 + 12) = 2082;
  *(void *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2082;
  *(void *)(a3 + 24) = a2;
  return result;
}

void sub_246D5AC00(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x20u);
}

void sub_246D5AC1C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Cu);
}

uint64_t ANSTTensorDataTypeIsFloatingPoint(uint64_t a1)
{
  return ((unint64_t)(a1 - 68) < 0x25) & (0x1500000001uLL >> (a1 - 68));
}

uint64_t ANSTTensorDataTypeGetSize(uint64_t a1)
{
  uint64_t result = 1;
  if (a1 <= 82)
  {
    if (a1 > 72)
    {
      if (a1 == 73) {
        return 4;
      }
      else {
        return 8;
      }
    }
    else if (a1 != 67)
    {
      return 16;
    }
  }
  else
  {
    switch(a1)
    {
      case 'c':
        return result;
      case 'd':
      case 'q':
        return 8;
      case 'e':
      case 'g':
      case 'j':
      case 'k':
      case 'l':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        __break(1u);
        JUMPOUT(0x246D5ADE0);
      case 'f':
      case 'i':
        return 4;
      case 'h':
      case 's':
        goto LABEL_12;
      case 't':
        return 16;
      default:
        if (a1 == 84) {
          return 16;
        }
LABEL_12:
        uint64_t result = 2;
        break;
    }
  }
  return result;
}

uint64_t ANSTTensorDataTypeGetPreferredAlignment(uint64_t a1)
{
  uint64_t result = 1;
  if (a1 <= 82)
  {
    uint64_t v3 = 4;
    if (a1 != 73) {
      uint64_t v3 = 8;
    }
    uint64_t v4 = 8;
    if (a1 == 67) {
      uint64_t v4 = 1;
    }
    if (a1 <= 72) {
      return v4;
    }
    else {
      return v3;
    }
  }
  else
  {
    switch(a1)
    {
      case 'c':
        return result;
      case 'd':
      case 'q':
      case 't':
        uint64_t result = 8;
        break;
      case 'e':
      case 'g':
      case 'j':
      case 'k':
      case 'l':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        __break(1u);
        JUMPOUT(0x246D5AEBCLL);
      case 'f':
      case 'i':
        uint64_t result = 4;
        break;
      case 'h':
      case 's':
        uint64_t result = 2;
        break;
      default:
        if (a1 == 83) {
          uint64_t result = 2;
        }
        else {
          uint64_t result = 8;
        }
        break;
    }
  }
  return result;
}

__CFString *ANSTTensorDataTypeToNSString(uint64_t a1)
{
  if (a1 <= 82)
  {
    uint64_t v3 = @"UInt32";
    if (a1 != 73) {
      uint64_t v3 = @"UInt64";
    }
    uint64_t v4 = @"UInt8";
    if (a1 != 67) {
      uint64_t v4 = @"Float128";
    }
    if (a1 <= 72) {
      return v4;
    }
    else {
      return v3;
    }
  }
  else
  {
    uint64_t v1 = a1 - 99;
    uint64_t result = @"Int8";
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = @"Float64";
        break;
      case 2:
      case 4:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 15:
        __break(1u);
        JUMPOUT(0x246D5AFF0);
      case 3:
        uint64_t result = @"Float32";
        break;
      case 5:
        uint64_t result = @"Float16";
        break;
      case 6:
        uint64_t result = @"Int32";
        break;
      case 14:
        uint64_t result = @"Int64";
        break;
      case 16:
        uint64_t result = @"Int16";
        break;
      case 17:
        uint64_t result = @"Int128";
        break;
      default:
        if (@"Int8" == (__CFString *)83) {
          uint64_t result = @"UInt16";
        }
        else {
          uint64_t result = @"UInt128";
        }
        break;
    }
  }
  return result;
}

__CFString *ANSTObjectCategoryFromAcDetCategory(unsigned int a1)
{
  if (a1 > 0xB) {
    return 0;
  }
  else {
    return off_265202E08[a1];
  }
}

uint64_t AcImageOrientationFromANSTImageOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 4) {
    return dword_246D9ED50[a1 - 1];
  }
  uint64_t v2 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_246D98E08(v2);
  }

  return 0;
}

void *sub_246D5E540(uint64_t a1, const void *a2)
{
  return memcpy(*(void **)(a1 + 32), a2, *(void *)(a1 + 48) * *(void *)(a1 + 40));
}

void sub_246D5F878(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x26u);
}

__CFString *ANSTVideoMaskRefineAlgorithmVersionToNSString(uint64_t a1)
{
  if (a1 == 0x10000) {
    return @"Version1";
  }
  uint64_t v3 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    sub_246D99C20(a1, v3);
  }

  return @"UNEXPECTED_ENUM_VALUE";
}

__CFString *ANSTAssetTypeToNSString(unint64_t a1, const char *a2)
{
  if (a1 >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"UnknownType(0x%zx)", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v2 = off_265202EA8[a1];
  }
  return v2;
}

uint64_t sub_246D630D0(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_246D63168;
  v7[3] = &unk_265202EC8;
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  v7[6] = a2;
  v7[7] = v5;
  v7[4] = *(void *)(a1 + 40);
  v7[5] = v4;
  uint64_t result = objc_msgSend_performMutableDataAccessWithOptions_usingBlock_error_(v3, a2, 0, v7, *(void *)(a1 + 72));
  **(unsigned char **)(a1 + 48) = result;
  return result;
}

void *sub_246D63168(void *result, uint64_t a2)
{
  if (result[5])
  {
    uint64_t v3 = result;
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = v3[7] * v4;
      uint64_t v6 = v3[4];
      size_t v7 = *(void *)(v6 + 88);
      unint64_t v8 = (char *)(v3[6] + v5);
      unint64_t v9 = (void *)(a2 + v5);
      unint64_t v10 = (void *)(a2 + v5 + v7);
      memcpy(*(void **)(v6 + 80), &v8[v7], v7);
      memcpy(v10, v8, *(void *)(v3[4] + 88));
      uint64_t result = memcpy(v9, *(const void **)(v3[4] + 80), *(void *)(v3[4] + 88));
      ++v4;
    }
    while (v4 < v3[5]);
  }
  return result;
}

uint64_t sub_246D63388(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_246D63434;
  v6[3] = &unk_265202F18;
  long long v7 = *(_OWORD *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 72);
  unint64_t v9 = a2;
  long long v10 = *(_OWORD *)(a1 + 80);
  uint64_t v4 = *(void *)(a1 + 104);
  uint64_t v11 = *(void *)(a1 + 96);
  v6[4] = *(void *)(a1 + 40);
  uint64_t result = objc_msgSend_performMutableDataAccessWithOptions_usingBlock_error_(v3, a2, 0, v6, v4);
  **(unsigned char **)(a1 + 48) = result;
  return result;
}

void *sub_246D63434(void *result, uint64_t a2)
{
  unint64_t v2 = result[5];
  if (v2)
  {
    uint64_t v4 = result;
    unint64_t v5 = 0;
    unint64_t v6 = result[6];
    unint64_t v7 = v6;
    do
    {
      if (v7)
      {
        unint64_t v8 = 0;
        unint64_t v9 = v4[7];
        do
        {
          if (v9)
          {
            for (unint64_t i = 0; i < v9; ++i)
            {
              uint64_t v11 = v4[9] * v5;
              uint64_t v12 = v4[10] * v8 + v4[11] * i;
              unint64_t v13 = (char *)(v4[8] + v11 + v12);
              uint64_t v14 = v4[4];
              size_t v15 = *(void *)(v14 + 104);
              unint64_t v16 = (char *)(a2 + v11 + v12);
              float v17 = &v16[v15];
              memcpy(*(void **)(v14 + 96), &v13[v15], v15);
              memcpy(v17, v13, *(void *)(v4[4] + 104));
              uint64_t result = memcpy(v16, *(const void **)(v4[4] + 96), *(void *)(v4[4] + 104));
              unint64_t v9 = v4[7];
            }
            unint64_t v6 = v4[6];
          }
          ++v8;
        }
        while (v8 < v6);
        unint64_t v2 = v4[5];
        unint64_t v7 = v6;
      }
      ++v5;
    }
    while (v5 < v2);
  }
  return result;
}

__CFString *ANSTViSegHQInferenceVersionToNSString(uint64_t a1, const char *a2)
{
  if (a1 == 0x10000)
  {
    uint64_t v3 = @"Version1";
  }
  else if (a1 == 0x20000)
  {
    uint64_t v3 = @"Version2";
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"UnknownVersion(0x%zx)", a1);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

__CFString *ANSTViSegHQInferenceResolutionToNSString(unint64_t a1, const char *a2)
{
  if (a1 >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"UnknownResolution(%zd)", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v2 = off_265202F80[a1];
  }
  return v2;
}

uint64_t sub_246D65348(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = a2;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t sub_246D6541C(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = a2;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t sub_246D654F0(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = a2;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t sub_246D655C4(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = a2;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t sub_246D65698(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = a2;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t sub_246D6576C(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = a2;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t sub_246D6843C(size_t a1, const char *a2, CVPixelBufferRef *a3)
{
  v16[4] = *MEMORY[0x263EF8340];
  v15[0] = *MEMORY[0x263F04240];
  unint64_t v6 = objc_msgSend_numberWithUnsignedLong_(NSNumber, a2, a1);
  v16[0] = v6;
  v15[1] = *MEMORY[0x263F04118];
  unint64_t v8 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v7, (uint64_t)a2);
  v16[1] = v8;
  v15[2] = *MEMORY[0x263F04180];
  long long v10 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v9, 1278226534);
  v15[3] = *MEMORY[0x263F04130];
  v16[2] = v10;
  v16[3] = MEMORY[0x263EFFA78];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, (uint64_t)v16, v15, 4);
  CFDictionaryRef v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = CVPixelBufferCreate(0, a1, (size_t)a2, 0x4C303066u, v12, a3);
  return v13;
}

void sub_246D691A8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

BOOL sub_246D69480(void *a1, uint64_t *a2, const char *a3)
{
  id v5 = a1;
  uint64_t v6 = objc_opt_class();
  unint64_t v7 = NSStringFromSelector(a3);
  unint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v5, v8, v6, v7);

  if (v9) {
    *a2 = objc_msgSend_unsignedIntegerValue(v9, v10, v11);
  }

  return v9 != 0;
}

uint64_t sub_246D69520(void *a1, uint64_t a2, const char *a3)
{
  uint64_t v16 = a2;
  id v4 = a1;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(a3);
  unint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);

  if (v8
    && (id v9 = v8,
        CFDictionaryRef v12 = (const char *)objc_msgSend_objCType(v9, v10, v11),
        !strcmp(v12, "{CGRect={CGPoint=dd}{CGSize=dd}}")))
  {
    objc_msgSend_getValue_size_(v9, v13, (uint64_t)&v16, 32);
    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

void sub_246D696D0(void *a1, uint64_t a2, const char *a3)
{
  uint64_t v5 = NSNumber;
  id v6 = a1;
  objc_msgSend_numberWithUnsignedInteger_(v5, v7, a2);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v8 = NSStringFromSelector(a3);
  objc_msgSend_encodeObject_forKey_(v6, v9, (uint64_t)v10, v8);
}

void sub_246D69764(void *a1, const char *a2, double a3, double a4, double a5, double a6)
{
  double v13 = a3;
  double v14 = a4;
  double v15 = a5;
  double v16 = a6;
  unint64_t v7 = (void *)MEMORY[0x263F08D40];
  id v8 = a1;
  id v10 = objc_msgSend_valueWithBytes_objCType_(v7, v9, (uint64_t)&v13, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  uint64_t v11 = NSStringFromSelector(a2);
  objc_msgSend_encodeObject_forKey_(v8, v12, (uint64_t)v10, v11, *(void *)&v13, *(void *)&v14, *(void *)&v15, *(void *)&v16);
}

id sub_246D6990C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  id v8 = objc_alloc_init(MEMORY[0x263F089D8]);
  objc_msgSend_appendString_(v8, v9, @"CGRect(");
  v24.origin.x = a1;
  v24.origin.y = a2;
  v24.size.width = a3;
  v24.size.height = a4;
  CGFloat MinX = CGRectGetMinX(v24);
  objc_msgSend_appendFormat_(v8, v11, @"x=%.*g, ", 17, *(void *)&MinX);
  v25.origin.x = a1;
  v25.origin.y = a2;
  v25.size.width = a3;
  v25.size.height = a4;
  CGFloat MinY = CGRectGetMinY(v25);
  objc_msgSend_appendFormat_(v8, v13, @"y=%.*g, ", 17, *(void *)&MinY);
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  CGFloat Width = CGRectGetWidth(v26);
  objc_msgSend_appendFormat_(v8, v15, @"w=%.*g, ", 17, *(void *)&Width);
  v27.origin.x = a1;
  v27.origin.y = a2;
  v27.size.width = a3;
  v27.size.height = a4;
  CGFloat Height = CGRectGetHeight(v27);
  objc_msgSend_appendFormat_(v8, v17, @"h=%.*g", 17, *(void *)&Height);
  objc_msgSend_appendString_(v8, v18, @""));
  unint64_t v21 = objc_msgSend_copy(v8, v19, v20);

  return v21;
}

id sub_246D69BE8(double a1, double a2, double a3, double a4, uint64_t a5, const char *a6, uint64_t a7)
{
  v24[4] = *MEMORY[0x263EF8340];
  v23[0] = @"x";
  id v10 = objc_msgSend_numberWithDouble_(NSNumber, a6, a7);
  v24[0] = v10;
  v23[1] = @"y";
  double v13 = objc_msgSend_numberWithDouble_(NSNumber, v11, v12, a2);
  v24[1] = v13;
  v23[2] = @"width";
  double v16 = objc_msgSend_numberWithDouble_(NSNumber, v14, v15, a3);
  v24[2] = v16;
  v23[3] = @"height";
  BOOL v19 = objc_msgSend_numberWithDouble_(NSNumber, v17, v18, a4);
  v24[3] = v19;
  unint64_t v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v20, (uint64_t)v24, v23, 4);

  return v21;
}

BOOL sub_246D69F54(void *a1, uint64_t *a2, const char *a3)
{
  id v5 = a1;
  uint64_t v6 = objc_opt_class();
  unint64_t v7 = NSStringFromSelector(a3);
  id v9 = objc_msgSend_decodeObjectOfClass_forKey_(v5, v8, v6, v7);

  if (v9) {
    *a2 = objc_msgSend_integerValue(v9, v10, v11);
  }

  return v9 != 0;
}

void sub_246D6A070(void *a1, uint64_t a2, const char *a3)
{
  id v5 = NSNumber;
  id v6 = a1;
  objc_msgSend_numberWithInteger_(v5, v7, a2);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = NSStringFromSelector(a3);
  objc_msgSend_encodeObject_forKey_(v6, v9, (uint64_t)v10, v8);
}

BOOL sub_246D6B880(void *a1, unsigned char *a2, const char *a3)
{
  id v5 = a1;
  uint64_t v6 = objc_opt_class();
  unint64_t v7 = NSStringFromSelector(a3);
  id v9 = objc_msgSend_decodeObjectOfClass_forKey_(v5, v8, v6, v7);

  if (v9) {
    *a2 = objc_msgSend_BOOLValue(v9, v10, v11);
  }

  return v9 != 0;
}

void sub_246D6BB74(void *a1, uint64_t a2, const char *a3)
{
  id v5 = NSNumber;
  id v6 = a1;
  objc_msgSend_numberWithBool_(v5, v7, a2);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = NSStringFromSelector(a3);
  objc_msgSend_encodeObject_forKey_(v6, v9, (uint64_t)v10, v8);
}

void sub_246D6E7F4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

__CFString *ANSTISPAlgorithmVersionToNSString(uint64_t a1)
{
  if (a1 == 0x10000) {
    return @"Version1";
  }
  id v2 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_246D9ABB4();
  }

  return @"UNEXPECTED_ENUM_VALUE";
}

__CFString *ANSTISPAlgorithmResolutionToNSString(uint64_t a1)
{
  if (!a1) {
    return @"512x384";
  }
  if (a1 == 1) {
    return @"1024x576";
  }
  id v2 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_246D9AC28();
  }

  return @"UNEXPECTED_ENUM_VALUE";
}

__CFString *ANSTISPAlgorithmRunningFrameRateToNSString(uint64_t a1)
{
  if (!a1) {
    return @"Standard";
  }
  if (a1 == 1) {
    return @"Low";
  }
  id v2 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_246D9AC9C();
  }

  return @"UNEXPECTED_ENUM_VALUE";
}

void sub_246D6FF18(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

unsigned char *sub_246D72838(uint64_t a1, const char *a2)
{
  id v2 = (float *)a2;
  uint64_t v4 = objc_msgSend_strideOfDimensionAt_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40) - 2);
  uint64_t v6 = objc_msgSend_strideOfDimensionAt_(*(void **)(a1 + 32), v5, *(void *)(a1 + 40) - 1);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 48));
  int v8 = *(_DWORD *)(a1 + 72);
  uint64_t result = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 48));
  unint64_t v10 = *(void *)(a1 + 56);
  if (v8 == 1278226488)
  {
    if (v10)
    {
      unint64_t v11 = 0;
      unint64_t v12 = *(void *)(a1 + 64);
      do
      {
        if (v12)
        {
          unint64_t v13 = 0;
          double v14 = v2;
          do
          {
            result[v13++] = (int)*v14;
            unint64_t v12 = *(void *)(a1 + 64);
            double v14 = (float *)((char *)v14 + v6);
          }
          while (v13 < v12);
          unint64_t v10 = *(void *)(a1 + 56);
        }
        id v2 = (float *)((char *)v2 + v4);
        result += BytesPerRow;
        ++v11;
      }
      while (v11 < v10);
    }
  }
  else if (v10)
  {
    uint64_t v15 = 0;
    int v16 = 0;
    uint64_t v17 = *(void *)(a1 + 64);
    do
    {
      if (v17)
      {
        uint64_t v18 = (short float *)v2 + v16;
        BOOL v19 = (short float *)&result[2 * v16];
        v16 += v17;
        uint64_t v20 = v17;
        do
        {
          short float v21 = *v18++;
          *v19++ = v21 / COERCE_SHORT_FLOAT(23544);
          --v20;
        }
        while (v20);
      }
      ++v15;
    }
    while (v15 != v10);
  }
  return result;
}

void sub_246D73268(_Unwind_Exception *a1)
{
}

void sub_246D732C8(uint32x2_t *a1, void *a2)
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uint64_t v15 = *MEMORY[0x263EF8340];
  do
  {
    *(void *)(*(void *)&a1[7] + v4) = objc_msgSend_pointerAtIndex_(a2, (const char *)a2, v5++);
    v4 += 24;
  }
  while (v5 != 25);
  v14[0] = (uint64_t *)a1[7];
  v14[1] = v14[0] + 51;
  v14[2] = v14[0] + 72;
  LODWORD(v13) = 1;
  uint64_t v12 = 0x700000011;
  uint32x2_t v7 = a1[4];
  int v8 = *(void **)(*(void *)&v7 + 104);
  uint64_t v9 = *(void *)&v7 + 112;
  uint64_t v10 = objc_msgSend_useE5(*(void **)(*(void *)&v7 + 64), (const char *)a2, v6, 0x700000011, v13, v14[0], v14[0] + 51, v14[0] + 72, v15);
  AcANSTPostProcessMultiNetOutputs(v8, a1 + 8, v9, v14, (unsigned int *)&v12, v10, (_DWORD *)(*(void *)&a1[4] + 2512), *(void *)(*(void *)&a1[6] + 8) + 32);
  *(_DWORD *)(*(void *)(*(void *)&a1[5] + 8) + 24) = v11;
}

uint64_t sub_246D739B4(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a3;
  id v11 = a4;
  double v14 = objc_msgSend_nextObject(v9, v12, v13);
  if (v14)
  {
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 1;
    uint64_t v25 = 0;
    CGRect v26 = &v25;
    uint64_t v27 = 0x3032000000;
    unint64_t v28 = sub_246D73BC4;
    uint64_t v29 = sub_246D73BD4;
    id v30 = 0;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = sub_246D73BDC;
    v18[3] = &unk_2652030B8;
    id v19 = v10;
    size_t v22 = &v31;
    id v20 = v9;
    uint64_t v24 = a2;
    id v21 = v11;
    unint64_t v23 = &v25;
    if (objc_msgSend_performDataAccessWithOptions_usingBlock_error_(v14, v15, a2, v18, a5))
    {
      if (*((unsigned char *)v32 + 24))
      {
        uint64_t v16 = 1;
LABEL_9:

        _Block_object_dispose(&v25, 8);
        _Block_object_dispose(&v31, 8);
        goto LABEL_10;
      }
      if (a5)
      {
        uint64_t v16 = 0;
        *a5 = (id) v26[5];
        goto LABEL_9;
      }
    }
    uint64_t v16 = 0;
    goto LABEL_9;
  }
  (*((void (**)(id, id))v11 + 2))(v11, v10);
  uint64_t v16 = 1;
LABEL_10:

  return v16;
}

void sub_246D73BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_246D73BC4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_246D73BD4(uint64_t a1)
{
}

void sub_246D73BDC(uint64_t a1, const char *a2)
{
  objc_msgSend_addPointer_(*(void **)(a1 + 32), a2, (uint64_t)a2);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v7 + 40);
  char v8 = sub_246D739B4(v3, v6, v4, v5, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8;
}

void softmax(float *a1, float *a2, unsigned int a3)
{
  unsigned int v3 = a3;
  uint64_t v4 = a2;
  float v5 = *a1;
  if (a3 >= 2)
  {
    uint64_t v6 = a1 + 1;
    do
    {
      float v7 = *v6++;
      float v8 = v7;
      if (v5 < v7) {
        float v5 = v8;
      }
    }
    while (v6 < &a1[a3]);
  }
  if (a3)
  {
    uint64_t v9 = a3;
    id v10 = a2;
    do
    {
      float v11 = *a1++;
      *v10++ = v11 - v5;
      --v9;
    }
    while (v9);
    float v12 = 0.0;
    unsigned int v13 = a3;
    double v14 = a2;
    do
    {
      float v15 = *v14++;
      float v12 = v12 + expf(v15);
      --v13;
    }
    while (v13);
    for (; v3; --v3)
    {
      *uint64_t v4 = expf(*v4) / v12;
      ++v4;
    }
  }
}

__CFString *ANSTActionToNSString(unint64_t a1)
{
  if (a1 < 0x36) {
    return off_265203128[a1];
  }
  id v2 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_246D9B590();
  }

  return @"UNEXPECTED_ENUM_VALUE";
}

__CFString *ANSTActionClassifierVersionToNSString(uint64_t a1)
{
  if (a1 == 0x10000) {
    return @"Version1";
  }
  id v2 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_246D9B610();
  }

  return @"UNEXPECTED_ENUM_VALUE";
}

void sub_246D74588(void *a1, uint64_t a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_246D74624;
  v6[3] = &unk_2652030E0;
  unsigned int v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v4 = (void *)a1[6];
  uint64_t v8 = a2;
  v6[4] = v2;
  id v7 = v4;
  objc_msgSend_performDataAccessWithOptions_usingBlock_error_(v3, v5, 0, v6, 0);
}

void sub_246D74624(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 48))
  {
    float v11 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_246D9B794(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_10;
  }
  if (!a2)
  {
    float v11 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_246D9B80C(v11, v19, v20, v21, v22, v23, v24, v25);
    }
LABEL_10:

    return;
  }
  LODWORD(v27) = 1;
  uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 56);
  cblas_sgemv_NEWLAPACK();
  cblas_sscal_NEWLAPACK();
  softmax(*(float **)(*(void *)(a1 + 32) + 56), *(float **)(*(void *)(a1 + 32) + 64), 0x35u);
  for (uint64_t i = 0; i != 53; ++i)
  {
    uint64_t v4 = [ANSTActionPrediction alloc];
    uint64_t v6 = objc_msgSend_initWithAction_(v4, v5, i + 1, v26, v27);
    LODWORD(v7) = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 64) + 4 * i);
    objc_msgSend_setConfidence_(v6, v8, v9, v7);
    objc_msgSend_addObject_(*(void **)(a1 + 40), v10, (uint64_t)v6);
  }
}

__CFString *ANSTForegroundSegmentationVersionToNSString(uint64_t a1)
{
  if (a1 == 0x10000) {
    return @"Version1";
  }
  if (a1 == 0x20000) {
    return @"Version2";
  }
  uint64_t v2 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_246D9B984();
  }

  return @"UNEXPECTED_ENUM_VALUE";
}

__CFString *ANSTForegroundSegmentationResolutionToNSString(unint64_t a1)
{
  if (a1 < 4) {
    return off_2652032D8[a1];
  }
  uint64_t v2 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_246D9BA04();
  }

  return @"UNEXPECTED_ENUM_VALUE";
}

__CFString *ANSTVideoFeatureExtractorVersionToNSString(uint64_t a1)
{
  if (a1 == 0x10000) {
    return @"Version1";
  }
  unsigned int v3 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    sub_246D9BA84(a1, v3);
  }

  return @"UNEXPECTED_ENUM_VALUE";
}

__CFString *ANSTInputModalityToNSString(uint64_t a1, const char *a2)
{
  if (a1)
  {
    if (a1 == 1)
    {
      unsigned int v3 = @"Audio";
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, a2, @"UnknownModality(0x%zx)", a1);
      unsigned int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    unsigned int v3 = @"Video";
  }
  return v3;
}

uint64_t sub_246D764C8(uint64_t a1, const char *a2, size_t a3, CVPixelBufferRef *a4)
{
  void v18[4] = *MEMORY[0x263EF8340];
  v17[0] = *MEMORY[0x263F04240];
  uint64_t v8 = objc_msgSend_numberWithUnsignedLong_(NSNumber, a2, (uint64_t)a2);
  v18[0] = v8;
  v17[1] = *MEMORY[0x263F04118];
  id v10 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v9, a3);
  v18[1] = v10;
  v17[2] = *MEMORY[0x263F04180];
  uint64_t v12 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v11, a1);
  v17[3] = *MEMORY[0x263F04130];
  v18[2] = v12;
  v18[3] = MEMORY[0x263EFFA78];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v13, (uint64_t)v18, v17, 4);
  CFDictionaryRef v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  uint64_t v15 = CVPixelBufferCreate(0, (size_t)a2, a3, a1, v14, a4);
  return v15;
}

__CFString *ANSTVideoFoundationModelVersionToNSString(uint64_t a1)
{
  if (a1 == 0x10000) {
    return @"Version1";
  }
  unsigned int v3 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    sub_246D9BCA4(a1, v3);
  }

  return @"UNEXPECTED_ENUM_VALUE";
}

uint64_t simResizeVisPipeBinning(uint64_t *a1, uint64_t *a2, float a3, float a4)
{
  LODWORD(v4) = vcvtas_u32_f32(1.0 / a3);
  unsigned int v6 = *((_DWORD *)a1 + 2);
  unsigned int v7 = (*((_DWORD *)a1 + 3) / v4) & 0xFFFFFFFE;
  unsigned int v9 = *((_DWORD *)a2 + 2);
  unsigned int v8 = *((_DWORD *)a2 + 3);
  if (v8 >= v7) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = v8;
  }
  LODWORD(v5) = vcvtas_u32_f32(1.0 / a4);
  if (v9 >= v6 / v5) {
    uint64_t v11 = v6 / v5;
  }
  else {
    uint64_t v11 = v9;
  }
  if (v11)
  {
    if (v10 && v5 != 0)
    {
      uint64_t v14 = *a2;
      int v15 = *((_DWORD *)a2 + 4);
      if (v4)
      {
        unsigned int v16 = v4 >> 1;
        unsigned int v17 = v5 >> 1;
        if (v4 >= 0x10)
        {
          int v38 = 0;
          uint64_t v39 = 0;
          uint64_t v62 = *a2;
          int v61 = *((_DWORD *)a2 + 4);
          do
          {
            unsigned int v40 = 0;
            uint64_t v41 = 0;
            v42 = (_WORD *)(v14 + (v15 * v39));
            uint64_t v43 = *a1;
            int v44 = *((_DWORD *)a1 + 4);
            uint64_t v45 = *a1 + 16;
            do
            {
              uint64_t v47 = 0;
              int v48 = 0;
              unsigned int v49 = v44 * v38;
              do
              {
                v50 = (uint16x8_t *)(v45 + 2 * v40 + v49);
                int32x4_t v51 = 0uLL;
                uint64_t v52 = v4 & 0xFFFFFFF0;
                int32x4_t v53 = 0uLL;
                int32x4_t v54 = 0uLL;
                int32x4_t v55 = 0uLL;
                do
                {
                  uint16x8_t v56 = v50[-1];
                  int32x4_t v53 = (int32x4_t)vaddw_high_u16((uint32x4_t)v53, v56);
                  int32x4_t v51 = (int32x4_t)vaddw_u16((uint32x4_t)v51, *(uint16x4_t *)v56.i8);
                  int32x4_t v55 = (int32x4_t)vaddw_high_u16((uint32x4_t)v55, *v50);
                  int32x4_t v54 = (int32x4_t)vaddw_u16((uint32x4_t)v54, *(uint16x4_t *)v50->i8);
                  v50 += 2;
                  v52 -= 16;
                }
                while (v52);
                int v57 = vaddvq_s32(vaddq_s32(vaddq_s32(v54, v51), vaddq_s32(v55, v53)));
                if ((v4 & 0xFFFFFFF0) != v4)
                {
                  v58 = (unsigned __int16 *)(v43
                                           + 2 * (v41 * v4)
                                           + (v44 * (v39 * v5 + v47))
                                           + 2 * (v4 & 0xFFFFFFF0));
                  int v59 = v4 - (v4 & 0xFFFFFFF0);
                  do
                  {
                    int v60 = *v58++;
                    v57 += v60;
                    --v59;
                  }
                  while (v59);
                }
                v48 += (v57 + v16) / v4;
                ++v47;
                v49 += v44;
              }
              while (v47 != v5);
              signed int v46 = (v48 + v17) / v5;
              if (v46 >= 0xFFFF) {
                signed int v46 = 0xFFFF;
              }
              *v42++ = v46 & ~(unsigned __int16)(v46 >> 31);
              ++v41;
              v40 += v4;
            }
            while (v41 != v10);
            ++v39;
            v38 += v5;
            uint64_t v14 = v62;
            int v15 = v61;
          }
          while (v39 != v11);
        }
        else
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            uint64_t v19 = 0;
            uint64_t v20 = (_WORD *)(v14 + (v15 * i));
            uint64_t v21 = *a1;
            int v22 = *((_DWORD *)a1 + 4);
            do
            {
              uint64_t v23 = 0;
              int v24 = 0;
              do
              {
                int v25 = 0;
                uint64_t v26 = (unsigned __int16 *)(v21 + 2 * (v19 * v4) + (v22 * (i * v5 + v23)));
                int v27 = v4;
                do
                {
                  int v28 = *v26++;
                  v25 += v28;
                  --v27;
                }
                while (v27);
                v24 += (v25 + v16) / v4;
                ++v23;
              }
              while (v23 != v5);
              signed int v29 = (v24 + v17) / v5;
              if (v29 >= 0xFFFF) {
                signed int v29 = 0xFFFF;
              }
              *v20++ = v29 & ~(unsigned __int16)(v29 >> 31);
              ++v19;
            }
            while (v19 != v10);
          }
        }
      }
      else
      {
        uint64_t v30 = 0;
        if (v11 <= 1) {
          goto LABEL_39;
        }
        unsigned int v31 = v15 >= 0 ? *((_DWORD *)a2 + 4) : -v15;
        unint64_t v32 = v31 * (unint64_t)(v11 - 1);
        if (v32 && v15 < 0) {
          goto LABEL_39;
        }
        if ((v32 & 0xFFFFFFFF00000000) != 0) {
          goto LABEL_39;
        }
        unsigned int v34 = 0;
        uint64_t v30 = v11 & 0xFFFFFFFE;
        uint64_t v35 = v30;
        do
        {
          *(_WORD *)(v14 + v34) = 0;
          *(_WORD *)(v14 + v15 + v34) = 0;
          v34 += 2 * v15;
          v35 -= 2;
        }
        while (v35);
        if (v30 != v11)
        {
LABEL_39:
          uint64_t v36 = v11 - v30;
          unsigned int v37 = v15 * v30;
          do
          {
            *(_WORD *)(v14 + v37) = 0;
            v37 += v15;
            --v36;
          }
          while (v36);
        }
      }
    }
  }
  return 1;
}

uint64_t simResizeVisPipeArea(uint64_t *a1, uint64_t *a2, uint64_t *a3, float a4, float a5, float a6, float a7)
{
  uint64_t v9 = *((unsigned int *)a2 + 3);
  uint64_t v119 = *((unsigned int *)a2 + 2);
  uint64_t v122 = *((unsigned int *)a1 + 2);
  if (v122 && v9)
  {
    uint64_t v10 = 0;
    unsigned int v11 = vcvtas_u32_f32(65536.0 / a4);
    LODWORD(v7) = vcvtas_u32_f32(a4 * 65536.0);
    uint64_t v8 = vcvtas_u32_f32(a6 * 8.0) << 13;
    uint64_t v120 = *a1;
    int v12 = *((_DWORD *)a1 + 4);
    uint64_t v13 = *a3;
    unsigned int v14 = *((_DWORD *)a1 + 3) - 1;
    int v15 = *((_DWORD *)a3 + 4);
    do
    {
      int v16 = 0;
      uint64_t v17 = v120 + (v12 * v10);
      uint64_t v18 = (_WORD *)(v13 + (v15 * v10));
      unsigned int v19 = v8 + v11;
      unsigned int v20 = v8;
      do
      {
        unsigned int v26 = HIWORD(v20);
        unsigned int v27 = HIWORD(v20) + 1;
        int v28 = 0x10000 - (unsigned __int16)v20;
        v20 += v11;
        unsigned int v29 = HIWORD(v20);
        if (v14 >= v26) {
          unsigned int v30 = v26;
        }
        else {
          unsigned int v30 = v14;
        }
        int v31 = v28 * *(unsigned __int16 *)(v17 + 2 * v30);
        if (v27 >= v29) {
          goto LABEL_6;
        }
        int v32 = ~v26;
        unsigned int v33 = ~v26 + ((v8 + v11 + v16 * v11) >> 16);
        if (v33 <= 1) {
          goto LABEL_30;
        }
        int v34 = 0;
        unsigned int v35 = (v32 + HIWORD(v19)) & 0xFFFFFFFE;
        unsigned int v36 = v33 & 0xFFFFFFFE;
        unsigned int v37 = v27;
        do
        {
          if (v14 >= v37) {
            unsigned int v38 = v37;
          }
          else {
            unsigned int v38 = v14;
          }
          if (v14 >= v37 + 1) {
            unsigned int v39 = v37 + 1;
          }
          else {
            unsigned int v39 = v14;
          }
          v31 += *(unsigned __int16 *)(v17 + 2 * v38) << 16;
          v34 += *(unsigned __int16 *)(v17 + 2 * v39) << 16;
          v37 += 2;
          v35 -= 2;
        }
        while (v35);
        v31 += v34;
        if (v33 != v36)
        {
          v27 += v36;
          do
          {
LABEL_30:
            if (v14 >= v27) {
              unsigned int v40 = v27;
            }
            else {
              unsigned int v40 = v14;
            }
            v31 += *(unsigned __int16 *)(v17 + 2 * v40) << 16;
            ++v27;
          }
          while (v27 < v29);
        }
LABEL_6:
        if (v14 >= v29) {
          unsigned int v21 = HIWORD(v20);
        }
        else {
          unsigned int v21 = v14;
        }
        uint64_t v22 = (v31 + (unsigned __int16)v20 * *(unsigned __int16 *)(v17 + 2 * v21)) * v7;
        uint64_t v23 = v22 + (v22 >> 63);
        unint64_t v24 = (unint64_t)(v23 + 0x80000000) >> 32;
        if (v23 >= 0xFFFE80000000) {
          LOWORD(v24) = -1;
        }
        if (v23 <= 0x7FFFFFFF) {
          __int16 v25 = 0;
        }
        else {
          __int16 v25 = v24;
        }
        *v18++ = v25;
        ++v16;
        v19 += v11;
      }
      while (v16 != v9);
      ++v10;
    }
    while (v10 != v122);
  }
  if (v119 && v9)
  {
    unsigned int v41 = 0;
    uint64_t v42 = 0;
    unsigned int v43 = vcvtas_u32_f32(65536.0 / a5);
    LODWORD(v_Block_object_dispose(&STACK[0x488], 8) = vcvtas_u32_f32(a5 * 65536.0);
    uint64_t v118 = *a2;
    int v44 = *((_DWORD *)a2 + 4);
    unsigned int v45 = v122 - 1;
    uint64_t v46 = *a3;
    int v47 = *((_DWORD *)a3 + 4);
    unsigned int v48 = vcvtas_u32_f32(a7 * 8.0) << 13;
    uint64x2_t v49 = (uint64x2_t)vdupq_n_s64(0xFFFE80000000uLL);
    unsigned int v113 = v48 + v43;
    int v115 = v44;
    unsigned int v50 = v48 + v43;
    unsigned int v117 = v43;
    while (1)
    {
      unsigned int v51 = HIWORD(v48);
      unsigned int v52 = HIWORD(v48) + 1;
      if (HIWORD(v50) >= v45) {
        unsigned int v53 = v45;
      }
      else {
        unsigned int v53 = HIWORD(v50);
      }
      if (v51 >= v45) {
        unsigned int v54 = v45;
      }
      else {
        unsigned int v54 = HIWORD(v48);
      }
      uint64_t v55 = v47 * v54;
      uint16x8_t v56 = (uint16x8_t *)(v46 + v55);
      int v57 = (char *)(v118 + (v44 * v42));
      unsigned int v58 = (v113 + v42 * v43) >> 16;
      if (v58 >= v45) {
        unsigned int v59 = v45;
      }
      else {
        unsigned int v59 = (v113 + v42 * v43) >> 16;
      }
      unsigned int v60 = 0x10000 - (unsigned __int16)v48;
      v48 += v43;
      unsigned int v61 = HIWORD(v48);
      if (v45 >= HIWORD(v48)) {
        unsigned int v62 = HIWORD(v48);
      }
      else {
        unsigned int v62 = v45;
      }
      unsigned int v123 = v41;
      unsigned int v121 = v50;
      if (v52 < v61)
      {
        uint64_t v63 = 0;
        int v64 = ~v51;
        unsigned int v65 = (~v51 + HIWORD(v50)) & 0xFFFFFFFE;
        uint64_t v66 = v46 + v47 * v62;
        unsigned int v67 = v58 + v64;
        unsigned int v68 = (v58 + v64) & 0xFFFFFFFE;
        while (1)
        {
          int v73 = v60 * v56->u16[v63];
          uint64_t v74 = v46 + 2 * v63;
          if (v67 < 2) {
            break;
          }
          int v76 = 0;
          unsigned int v77 = v52;
          unsigned int v78 = v65;
          do
          {
            if (v45 >= v77) {
              unsigned int v79 = v77;
            }
            else {
              unsigned int v79 = v45;
            }
            if (v45 >= v77 + 1) {
              unsigned int v80 = v77 + 1;
            }
            else {
              unsigned int v80 = v45;
            }
            v73 += *(unsigned __int16 *)(v74 + v79 * v47) << 16;
            v76 += *(unsigned __int16 *)(v74 + v80 * v47) << 16;
            v77 += 2;
            v78 -= 2;
          }
          while (v78);
          v73 += v76;
          unsigned int v75 = v52 + v68;
          if (v67 != v68) {
            goto LABEL_70;
          }
LABEL_53:
          uint64_t v69 = (v73 + (unsigned __int16)v48 * *(unsigned __int16 *)(v66 + 2 * v63)) * v8;
          uint64_t v70 = v69 + (v69 >> 63);
          unint64_t v71 = (unint64_t)(v70 + 0x80000000) >> 32;
          if (v70 >= 0xFFFE80000000) {
            LOWORD(v71) = -1;
          }
          if (v70 <= 0x7FFFFFFF) {
            __int16 v72 = 0;
          }
          else {
            __int16 v72 = v71;
          }
          *(_WORD *)int v57 = v72;
          v57 += 2;
          if (++v63 == v9) {
            goto LABEL_38;
          }
        }
        unsigned int v75 = v52;
        do
        {
LABEL_70:
          if (v45 >= v75) {
            unsigned int v81 = v75;
          }
          else {
            unsigned int v81 = v45;
          }
          v73 += *(unsigned __int16 *)(v74 + v81 * v47) << 16;
          ++v75;
        }
        while (v75 < v61);
        goto LABEL_53;
      }
      uint64_t v82 = v47 * v53;
      if (v9 <= 7) {
        break;
      }
      if ((unint64_t)&v57[-v46 - v47 * v59] < 0x10 || (unint64_t)(v57 - (char *)v56) < 0x10) {
        break;
      }
      v94 = (uint16x8_t *)(v46 + v82);
      v95 = (int8x16_t *)(v118 + v41);
      int32x4_t v96 = vdupq_n_s32(v60);
      uint64_t v97 = v9 & 0xFFFFFFF8;
      do
      {
        uint16x8_t v98 = *v56++;
        int32x4_t v99 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v98.i8);
        int32x4_t v100 = (int32x4_t)vmovl_high_u16(v98);
        uint16x8_t v101 = *v94++;
        uint16x8_t v102 = (uint16x8_t)vdupq_n_s16((unsigned __int16)v48);
        uint32x4_t v103 = vmlal_u16((uint32x4_t)vmulq_s32(v96, v99), *(uint16x4_t *)v102.i8, *(uint16x4_t *)v101.i8);
        uint32x4_t v104 = vmlal_high_u16((uint32x4_t)vmulq_s32(v96, v100), v102, v101);
        uint32x4_t v105 = (uint32x4_t)vdupq_n_s32(v8);
        int64x2_t v106 = (int64x2_t)vmull_u32(*(uint32x2_t *)v105.i8, *(uint32x2_t *)v103.i8);
        int64x2_t v107 = (int64x2_t)vmull_high_u32(v105, v103);
        int64x2_t v108 = (int64x2_t)vmull_u32(*(uint32x2_t *)v105.i8, *(uint32x2_t *)v104.i8);
        int64x2_t v109 = (int64x2_t)vmull_high_u32(v105, v104);
        uint64x2_t v110 = (uint64x2_t)vdupq_n_s64(0x7FFFFFFFuLL);
        int8x16_t v111 = (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v49, (uint64x2_t)v106), (int32x4_t)vcgtq_u64(v49, (uint64x2_t)v107)), (int16x8_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v49, (uint64x2_t)v108), (int32x4_t)vcgtq_u64(v49, (uint64x2_t)v109)));
        *v95++ = vandq_s8(vornq_s8(vandq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vraddhn_high_s64(vraddhn_s64(v106, (int64x2_t)0), v107, (int64x2_t)0), (int16x8_t)vraddhn_high_s64(vraddhn_s64(v108, (int64x2_t)0), v109, (int64x2_t)0)), v111), v111), (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)v106, v110), (int32x4_t)vcgtq_u64((uint64x2_t)v107, v110)), (int16x8_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)v108, v110), (int32x4_t)vcgtq_u64((uint64x2_t)v109, v110))));
        v97 -= 8;
      }
      while (v97);
      if ((v9 & 0xFFFFFFF8) != v9)
      {
        uint64_t v84 = v9 & 0xFFFFFFF8;
        v57 += 2 * v84;
LABEL_81:
        uint64_t v85 = v9 - v84;
        uint64_t v86 = v46 + 2 * v84;
        v87 = (unsigned __int16 *)(v86 + v82);
        v88 = (unsigned __int16 *)(v86 + v55);
        do
        {
          int v89 = *v88++;
          int v90 = v60 * v89;
          int v91 = *v87++;
          unint64_t v92 = v8 * (unint64_t)(v90 + (unsigned __int16)v48 * v91);
          unint64_t v93 = (v92 + 0x80000000) >> 32;
          if (v92 >= 0xFFFE80000000) {
            LOWORD(v93) = -1;
          }
          if (!(v92 >> 31)) {
            LOWORD(v93) = 0;
          }
          *(_WORD *)int v57 = v93;
          v57 += 2;
          --v85;
        }
        while (v85);
      }
LABEL_38:
      ++v42;
      unsigned int v43 = v117;
      unsigned int v50 = v121 + v117;
      int v44 = v115;
      unsigned int v41 = v123 + v115;
      if (v42 == v119) {
        return 1;
      }
    }
    uint64_t v84 = 0;
    goto LABEL_81;
  }
  return 1;
}

uint64_t simResizeVisPipeBilinear(uint64_t *a1, uint64_t *a2, float a3, float a4, float a5, float a6)
{
  uint64_t v6 = *((unsigned int *)a2 + 2);
  if (v6)
  {
    int v7 = *((_DWORD *)a2 + 3);
    if (v7)
    {
      uint64_t v8 = 0;
      unsigned int v9 = vcvtas_u32_f32(65536.0 / a3);
      unsigned int v10 = vcvtas_u32_f32(65536.0 / a4);
      int v11 = *((_DWORD *)a1 + 3);
      unsigned int v12 = vcvtas_u32_f32(a5 * 8.0) << 13;
      unsigned int v13 = *((_DWORD *)a1 + 2) - 1;
      uint64_t v14 = *a1;
      int v15 = *((_DWORD *)a1 + 4);
      uint64_t v16 = *a2;
      int v17 = *((_DWORD *)a2 + 4);
      unsigned int v18 = v11 - 1;
      unsigned int v19 = vcvtas_u32_f32(a6 * 8.0) << 13;
      do
      {
        unsigned int v20 = HIWORD(v19);
        if (v13 >= HIWORD(v19)) {
          unsigned int v21 = HIWORD(v19);
        }
        else {
          unsigned int v21 = v13;
        }
        uint64_t v22 = v14 + v15 * v21;
        if (v13 >= v20 + 1) {
          unsigned int v23 = v20 + 1;
        }
        else {
          unsigned int v23 = v13;
        }
        uint64_t v24 = v14 + v15 * v23;
        __int16 v25 = (_WORD *)(v16 + (v17 * v8));
        int v26 = v7;
        unsigned int v27 = v12;
        do
        {
          if (v18 >= HIWORD(v27)) {
            unsigned int v28 = HIWORD(v27);
          }
          else {
            unsigned int v28 = v18;
          }
          if (v18 >= HIWORD(v27) + 1) {
            unsigned int v29 = HIWORD(v27) + 1;
          }
          else {
            unsigned int v29 = v18;
          }
          uint64_t v30 = 2 * v29;
          uint64_t v31 = 2 * v28;
          int v32 = (*(unsigned __int16 *)(v22 + v30) - *(unsigned __int16 *)(v22 + v31)) * (unsigned __int16)v27
              + (*(unsigned __int16 *)(v22 + v31) << 16);
          LODWORD(v30) = (*(unsigned __int16 *)(v24 + v30) - *(unsigned __int16 *)(v24 + v31)) * (unsigned __int16)v27
                       + (*(unsigned __int16 *)(v24 + v31) << 16);
          LODWORD(v30) = ((v32 + (v32 >> 31) + 0x8000) & 0xFFFF0000)
                       + ((((int)v30 + ((int)v30 >> 31) + 0x8000) >> 16) - ((v32 + (v32 >> 31) + 0x8000) >> 16))
                       * (unsigned __int16)v19;
          int v33 = v30 + ((int)v30 >> 31) + 0x8000;
          if (v33 < 0x10000) {
            __int16 v34 = 0;
          }
          else {
            __int16 v34 = HIWORD(v33);
          }
          *v25++ = v34;
          v27 += v9;
          --v26;
        }
        while (v26);
        ++v8;
        v19 += v10;
      }
      while (v8 != v6);
    }
  }
  return 1;
}

uint64_t simResizeVisPipe(uint64_t *a1, uint64_t a2, uint64_t *a3, int a4, unsigned int a5, float a6, float a7, float a8, float a9)
{
  uint64_t v9 = *((unsigned int *)a1 + 3);
  if (!v9) {
    return 0;
  }
  unsigned int v10 = a1;
  int v11 = *((_DWORD *)a1 + 2);
  if (!v11) {
    return 0;
  }
  if (*(_DWORD *)(a2 + 12)) {
    BOOL v13 = *(_DWORD *)(a2 + 8) == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    if (!a5)
    {
      uint64_t v22 = 0;
      goto LABEL_23;
    }
    int v21 = *((_DWORD *)a1 + 4);
    if (v21 * v11)
    {
      uint64_t v22 = (char *)operator new((v21 * v11));
      bzero(v22, (v21 * v11));
    }
    else
    {
      uint64_t v22 = 0;
    }
    long long v47 = *(_OWORD *)v10;
    uint64_t v48 = v10[2];
    *(void *)&long long v47 = v22;
    uint64_t v24 = (unsigned __int16 *)*v10;
    uint64_t v25 = ((v11 - 1) * v21);
    int v26 = (unsigned __int16 *)(*v10 + 2 * v9 + v25);
    if ((unsigned __int16 *)*v10 != v26)
    {
      unint64_t v27 = 2 * v9 + v25 - 2;
      if (v27 < 0x1E)
      {
        unsigned int v28 = v22;
      }
      else
      {
        unsigned int v28 = v22;
        if ((unint64_t)(v22 - (char *)v24) >= 0x20)
        {
          uint64_t v29 = 0;
          uint64_t v30 = (v27 >> 1) + 1;
          uint64_t v31 = 2 * (v30 & 0x7FFFFFFFFFFFFFF0);
          unsigned int v28 = &v22[v31];
          uint32x4_t v32 = (uint32x4_t)vnegq_s32(vdupq_n_s32(a5));
          uint64_t v33 = v30 & 0x7FFFFFFFFFFFFFF0;
          do
          {
            __int16 v34 = (unsigned long long *)&v22[v29 * 2];
            unsigned long long v35 = *(_OWORD *)&vuzp1q_s16((int16x8_t)vshlq_u32(vmovl_u16(*(uint16x4_t *)&v24[v29 + 8]), v32), (int16x8_t)vshlq_u32(vmovl_high_u16(*(uint16x8_t *)&v24[v29 + 8]), v32)) & __PAIR128__(0xFFF0FFF0FFF0FFFLL, 0xFFF0FFF0FFF0FFFLL);
            *__int16 v34 = *(_OWORD *)&vuzp1q_s16((int16x8_t)vshlq_u32(vmovl_u16(*(uint16x4_t *)&v24[v29]), v32), (int16x8_t)vshlq_u32(vmovl_high_u16(*(uint16x8_t *)&v24[v29]), v32)) & __PAIR128__(0xFFF0FFF0FFF0FFFLL, 0xFFF0FFF0FFF0FFFLL);
            v34[1] = v35;
            v29 += 16;
            v33 -= 16;
          }
          while (v33);
          if (v30 == (v30 & 0x7FFFFFFFFFFFFFF0)) {
            goto LABEL_22;
          }
          uint64_t v24 = (unsigned __int16 *)((char *)v24 + v31);
        }
      }
      do
      {
        unsigned int v36 = *v24++;
        *(_WORD *)unsigned int v28 = (v36 >> a5) & 0xFFF;
        v28 += 2;
      }
      while (v24 != v26);
    }
LABEL_22:
    unsigned int v10 = (uint64_t *)&v47;
LABEL_23:
    if (a4 == 2)
    {
      simResizeVisPipeBinning(v10, (uint64_t *)a2, a6, a7);
      if (!a5) {
        goto LABEL_37;
      }
    }
    else if (a4 == 1)
    {
      simResizeVisPipeBilinear(v10, (uint64_t *)a2, a6, a7, a8, a9);
      if (!a5) {
        goto LABEL_37;
      }
    }
    else
    {
      simResizeVisPipeArea(v10, (uint64_t *)a2, a3, a6, a7, a8, a9);
      if (!a5) {
        goto LABEL_37;
      }
    }
    unsigned int v37 = *(int16x8_t **)a2;
    uint64_t v38 = ((*(_DWORD *)(a2 + 8) - 1) * *(_DWORD *)(a2 + 16));
    uint64_t v39 = 2 * *(unsigned int *)(a2 + 12);
    unsigned int v40 = (int16x8_t *)(*(void *)a2 + v39 + v38);
    if (*(int16x8_t **)a2 != v40)
    {
      unint64_t v41 = v39 + v38 - 2;
      if (v41 >= 0x1E)
      {
        uint64_t v42 = (v41 >> 1) + 1;
        uint32x4_t v43 = (uint32x4_t)vdupq_n_s32(a5);
        int v44 = v37 + 1;
        unint64_t v45 = v42 & 0xFFFFFFFFFFFFFFF0;
        do
        {
          v46.i32[0] = *(_OWORD *)v44 & 0xFFF0FFF;
          v46.i16[2] = HIDWORD(v44->i64[0]) & 0xFFF;
          v46.i16[3] = v46.i16[2];
          v46.i32[2] = v44->i64[1] & 0xFFF0FFF;
          v46.i16[6] = v46.i16[2];
          v46.i16[7] = v46.i16[2];
          v44[-1] = vuzp1q_s16((int16x8_t)vshlq_u32(vmovl_u16((uint16x4_t)(v44[-1].i64[0] & 0xFFF0FFF0FFF0FFFLL)), v43), (int16x8_t)vshlq_u32(vmovl_high_u16((uint16x8_t)(*(_OWORD *)&v44[-1] & __PAIR128__(0xFFF0FFF0FFF0FFFLL, 0xFFF0FFF0FFF0FFFLL))), v43));
          *int v44 = vuzp1q_s16((int16x8_t)vshlq_u32(vmovl_u16(*(uint16x4_t *)v46.i8), v43), (int16x8_t)vshlq_u32(vmovl_high_u16(v46), v43));
          v44 += 2;
          v45 -= 16;
        }
        while (v45);
        if (v42 == (v42 & 0xFFFFFFFFFFFFFFF0)) {
          goto LABEL_37;
        }
        unsigned int v37 = (int16x8_t *)((char *)v37 + 2 * (v42 & 0xFFFFFFFFFFFFFFF0));
      }
      do
      {
        v37->i16[0] = (v37->i16[0] & 0xFFF) << a5;
        unsigned int v37 = (int16x8_t *)((char *)v37 + 2);
      }
      while (v37 != v40);
    }
LABEL_37:
    if (v22) {
      operator delete(v22);
    }
  }
  return 1;
}

uint64_t rtcv::simResize(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5, int a6, uint64_t a7, int a8, float a9, float a10, float a11, float a12, int a13, int a14)
{
  if (a5 != 1) {
    return 0;
  }
  *(void *)&long long v32 = a1;
  *((void *)&v32 + 1) = __PAIR64__(a2, a3);
  uint64_t v33 = a4 | 0x500000000;
  long long v30 = v32;
  uint64_t v31 = v33;
  size_t v21 = a4 * a3;
  if (v21)
  {
    uint64_t v22 = operator new(a4 * a3);
    bzero(v22, v21);
  }
  else
  {
    uint64_t v22 = 0;
  }
  *(void *)&long long v30 = v22;
  uint64_t v25 = a7;
  int v26 = a13;
  int v27 = a8;
  int v28 = a14;
  int v29 = 5;
  if ((a6 - 1) <= 2)
  {
    uint64_t v23 = simResizeVisPipe((uint64_t *)&v32, (uint64_t)&v25, (uint64_t *)&v30, dword_246D9F1C0[a6 - 1], 2u, a9, a10, a11, a12);
    if (!v22) {
      return v23;
    }
    goto LABEL_10;
  }
  uint64_t v23 = 0;
  if (v22) {
LABEL_10:
  }
    operator delete(v22);
  return v23;
}

BOOL rtcv::simResize(void *a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5, int a6, int a7, void *a8, unsigned int a9, unsigned int a10, unsigned int a11)
{
  if (a6 | a5 | a7) {
    return 0;
  }
  uint64_t v21 = v11;
  uint64_t v22 = v12;
  bzero(a8, a11 * a10);
  src.data = a1;
  src.height = a3;
  src.width = a2;
  src.rowBytes = a4;
  v19.data = a8;
  v19.height = a10;
  v19.width = a9;
  v19.rowBytes = a11;
  return vImageScale_ARGB8888(&src, &v19, 0, 8u) == 0;
}

BOOL rtcv::simCropResize(void *a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5, int a6, int a7, void *a8, float a9, float a10, float a11, unsigned int a12, unsigned int a13, unsigned int a14)
{
  if (a9 < 0.0 || (a6 | a5 | a7) != 0) {
    return 0;
  }
  uint64_t v18 = 0;
  if ((float)(a2 - 1) >= a9 && a10 >= 0.0)
  {
    if ((float)(a3 - 1) < a10) {
      return 0;
    }
    uint64_t v22 = v14;
    uint64_t v23 = v15;
    v21.data = a1;
    v21.height = a3;
    v21.width = a2;
    v21.rowBytes = a4;
    dest.data = a8;
    dest.height = a13;
    dest.width = a12;
    dest.rowBytes = a14;
    transform.a = a11;
    transform.b = 0.0;
    transform.c = 0.0;
    transform.d = a11;
    transform.tx = -(float)(a11 * a9);
    transform.ty = (float)a13 - (float)(a11 * (float)((float)a3 - a10));
    return vImageAffineWarp_ARGB8888(&v21, &dest, 0, &transform, 0, 8u) == 0;
  }
  return v18;
}

uint64_t bmBufferResizeCHW(uint64_t result, int a2, unsigned int a3, uint64_t a4)
{
  if (!a2 && a3)
  {
    unsigned int v4 = *(_DWORD *)(result + 12);
    unsigned int v5 = *(_DWORD *)(result + 8) / a3;
    int v6 = *(_DWORD *)(result + 16);
    int v7 = *(_DWORD *)(a4 + 16);
    int v8 = 2 * v4;
    uint64_t v9 = 2 * v4 - 2;
    uint64_t v10 = 2 * v4 - 1;
    uint64_t v11 = v6 * (v5 - 1);
    unsigned int v12 = *(_DWORD *)(a4 + 8) / a3;
    uint64_t v13 = v12 - 1;
    uint64_t v14 = (v7 * v13);
    if (v12 < 2)
    {
      if (v8)
      {
        for (int i = 0; i != a3; ++i)
        {
          uint64_t v43 = 0;
          uint64_t v44 = *(void *)result + v11 + i * v5 * *(_DWORD *)(result + 16);
          uint64_t v45 = *(void *)a4 + v14 + i * v12 * *(_DWORD *)(a4 + 16);
          do
          {
            uint64_t v46 = v43 + 1;
            uint64_t v47 = v43 >> 1;
            if ((int)v47 + 1 >= v4) {
              unsigned int v48 = v43 >> 1;
            }
            else {
              unsigned int v48 = v47 + 1;
            }
            int v49 = ((2 * *(char *)(v44 + v47)) << ((v43 + 1) & 1))
                + (((int)(v43 << 31) >> 31) & (2 * *(char *)(v44 + v48)));
            int v50 = v49 + 2;
            unsigned int v51 = v49 + 5;
            if (v50 >= 0) {
              unsigned int v51 = v50;
            }
            *(unsigned char *)(v45 + v43++) = v51 >> 2;
          }
          while (v10 != v46);
          *(unsigned char *)(v45 + v10) = *(unsigned char *)(v45 + v9);
        }
      }
      else
      {
        int v56 = 0;
        do
        {
          uint64_t v57 = *(void *)a4 + v14 + v56 * v12 * *(_DWORD *)(a4 + 16);
          *(unsigned char *)(v57 + 0xFFFFFFFFLL) = *(unsigned char *)(v57 + v9);
          ++v56;
          --a3;
        }
        while (a3);
      }
    }
    else if (v8)
    {
      int v15 = 0;
      uint64_t v60 = a4;
      int v59 = *(_DWORD *)(a4 + 8) / a3;
      uint64_t v58 = result;
      do
      {
        uint64_t v16 = 0;
        uint64_t v17 = *(void *)result + v15 * v5 * *(_DWORD *)(result + 16);
        int v61 = v15;
        uint64_t v18 = *(void *)a4 + v15 * v12 * *(_DWORD *)(a4 + 16);
        char v19 = 1;
        do
        {
          uint64_t v20 = 0;
          uint64_t v21 = v18 + (v7 * v16);
          unsigned int v22 = v16 >> 1;
          if ((v16 >> 1) + 1 >= v5) {
            unsigned int v23 = v16 >> 1;
          }
          else {
            unsigned int v23 = v22 + 1;
          }
          uint64_t v24 = v17 + v22 * v6;
          uint64_t v25 = v17 + v23 * v6;
          if (v16) {
            int v26 = 1;
          }
          else {
            int v26 = 2;
          }
          do
          {
            uint64_t v27 = v20 + 1;
            uint64_t v28 = v20 >> 1;
            if ((int)v28 + 1 >= v4) {
              uint64_t v29 = v28;
            }
            else {
              uint64_t v29 = (v28 + 1);
            }
            int v30 = (*(char *)(v24 + v28) << (((v20 + 1) & 1) + (v19 & 1)))
                + (((int)(v20 << 31) >> 31) & v26) * *(char *)(v24 + v29)
                + ((2 - v26) << ((v20 + 1) & 1)) * *(char *)(v25 + v28)
                + (((int)(v20 << 31) >> 31) & (2 - v26)) * *(char *)(v25 + v29);
            int v31 = v30 + 2;
            unsigned int v32 = v30 + 5;
            if (v31 >= 0) {
              unsigned int v32 = v31;
            }
            *(unsigned char *)(v21 + v20++) = v32 >> 2;
          }
          while (v10 != v27);
          ++v16;
          *(unsigned char *)(v21 + v10) = *(unsigned char *)(v21 + v9);
          ++v19;
        }
        while (v16 != v13);
        uint64_t v33 = 0;
        uint64_t v34 = v17 + v6 * (v5 - 1);
        uint64_t v35 = v18 + (v7 * v13);
        do
        {
          uint64_t v36 = v33 + 1;
          uint64_t v37 = v33 >> 1;
          if ((int)v37 + 1 >= v4) {
            unsigned int v38 = v33 >> 1;
          }
          else {
            unsigned int v38 = v37 + 1;
          }
          int v39 = ((2 * *(char *)(v34 + v37)) << ((v33 + 1) & 1))
              + (((int)(v33 << 31) >> 31) & (2 * *(char *)(v34 + v38)));
          int v40 = v39 + 2;
          unsigned int v41 = v39 + 5;
          if (v40 >= 0) {
            unsigned int v41 = v40;
          }
          *(unsigned char *)(v35 + v33++) = v41 >> 2;
        }
        while (v10 != v36);
        *(unsigned char *)(v35 + v10) = *(unsigned char *)(v35 + v9);
        int v15 = v61 + 1;
        unsigned int v12 = v59;
        a4 = v60;
        uint64_t result = v58;
      }
      while (v61 + 1 != a3);
    }
    else
    {
      for (int j = 0; j != a3; ++j)
      {
        unsigned int v53 = 0;
        uint64_t v54 = *(void *)a4 + j * v12 * *(_DWORD *)(a4 + 16);
        uint64_t v55 = v12 - 1;
        do
        {
          uint64_t result = v54 + v53;
          *(unsigned char *)(result + 0xFFFFFFFFLL) = *(unsigned char *)(result + v9);
          v53 += v7;
          --v55;
        }
        while (v55);
        *(unsigned char *)(v54 + v14 + 0xFFFFFFFFLL) = *(unsigned char *)(v54 + v14 + v9);
      }
    }
  }
  return result;
}

void bmBufferPartialResizeCHW(uint64_t a1, int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, _DWORD *a8)
{
  if (a2 == 1)
  {
    unsigned int v8 = a3;
    if (a3)
    {
      uint64_t v9 = a8;
      int v10 = a8[2] / a3;
      int v11 = a8[4];
      size_t v12 = (v11 * v10);
      size_t v83 = v12;
      if (a4 >= a5)
      {
        int v70 = 0;
        do
        {
          bzero((void *)(*(void *)v9 + (v70 * v10 * v9[4])), v83);
          ++v70;
          --v8;
        }
        while (v8);
      }
      else if (a6 >= a7)
      {
        int v71 = 0;
        do
        {
          bzero((void *)(*(void *)v9 + (v71 * v10 * v9[4])), v83);
          ++v71;
          --v8;
        }
        while (v8);
      }
      else
      {
        int v14 = 0;
        int v78 = *(_DWORD *)(a1 + 8) / a3;
        signed int v15 = v78 - 1;
        signed int v16 = *(_DWORD *)(a1 + 12) - 1;
        unsigned int v17 = *(_DWORD *)(a1 + 16);
        uint64_t v18 = a6;
        uint64_t v72 = a4;
        uint64_t v19 = a5;
        int v79 = a8[2] / a3;
        float v77 = (float)(v10 - 1);
        float v76 = (float)(a8[3] - 1);
        int32x2_t v75 = vdup_n_s32(v78 - 1);
        int32x2_t v73 = vdup_n_s32(v16);
        int32x2_t v74 = vdup_n_s32(v17);
        do
        {
          int v20 = v10;
          uint64_t v21 = *(void *)a1 + (v14 * v78 * *(_DWORD *)(a1 + 16));
          int v82 = v14;
          unsigned int v22 = (char *)(*(void *)v9 + (v14 * v20 * v9[4]));
          bzero(v22, v12);
          float v23 = 2.0;
          float v24 = -1.0;
          uint64_t v25 = v72;
          do
          {
            float v26 = (float)((float)v25 / v77) * (float)(v78 - 1);
            signed int v27 = vcvtms_s32_f32(v26);
            float v28 = v26 - (float)(int)floorf(v26);
            if (v28 <= 1.0) {
              float v29 = v28;
            }
            else {
              float v29 = 1.0;
            }
            if (v28 >= 0.0) {
              float v30 = v29;
            }
            else {
              float v30 = 0.0;
            }
            int v31 = v27 - 1;
            if (v15 < v27 - 1) {
              int v31 = v78 - 1;
            }
            if (v15 >= v27) {
              signed int v32 = v27;
            }
            else {
              signed int v32 = v78 - 1;
            }
            if (v27 <= 0) {
              int v31 = 0;
            }
            uint64_t v33 = v21 + v31 * v17;
            if (v27 < 0) {
              signed int v32 = 0;
            }
            uint64_t v34 = v21 + v32 * v17;
            int32x2_t v35 = vdup_n_s32(v27);
            int32x2_t v36 = vmul_s32((int32x2_t)vbic_s8((int8x8_t)vmin_s32(v75, vadd_s32(v35, (int32x2_t)0x200000001)), (int8x8_t)vcgt_s32((int32x2_t)0xFFFFFFFEFFFFFFFFLL, v35)), v74);
            uint64_t v37 = v21 + v36.u32[0];
            uint64_t v38 = v21 + v36.u32[1];
            *(float *)v36.i32 = vabds_f32(v24, v30);
            float v39 = (float)((float)((float)(*(float *)v36.i32 * (float)(*(float *)v36.i32 * 3.75))
                                + (float)((float)(*(float *)v36.i32 * (float)(*(float *)v36.i32 * -0.75))
                                        * *(float *)v36.i32))
                        + (float)(*(float *)v36.i32 * -6.0))
                + 3.0;
            float v40 = fabsf(v30);
            float v41 = (float)((float)(v40 * (float)(v40 * -2.25)) + (float)((float)(v40 * (float)(v40 * 1.25)) * v40)) + 1.0;
            float v42 = vabds_f32(1.0, v30);
            float v43 = (float)((float)(v42 * (float)(v42 * -2.25)) + (float)((float)(v42 * (float)(v42 * 1.25)) * v42)) + 1.0;
            float v44 = vabds_f32(v23, v30);
            float v45 = (float)((float)((float)(v44 * (float)(v44 * 3.75)) + (float)((float)(v44 * (float)(v44 * -0.75)) * v44))
                        + (float)(v44 * -6.0))
                + 3.0;
            uint64_t v46 = v18;
            do
            {
              float v47 = (float)((float)v46 / v76) * (float)v16;
              signed int v48 = vcvtms_s32_f32(v47);
              float v49 = v47 - (float)(int)floorf(v47);
              if (v49 <= 1.0) {
                float v50 = v49;
              }
              else {
                float v50 = 1.0;
              }
              if (v49 >= 0.0) {
                float v51 = v50;
              }
              else {
                float v51 = 0.0;
              }
              unsigned int v52 = v48 - 1;
              if (v16 < v48 - 1) {
                unsigned int v52 = v16;
              }
              if (v16 >= v48) {
                unsigned int v53 = v48;
              }
              else {
                unsigned int v53 = v16;
              }
              if (v48 <= 0) {
                unsigned int v52 = 0;
              }
              if (v48 < 0) {
                unsigned int v53 = 0;
              }
              uint64_t v54 = 4 * v52;
              uint64_t v55 = 4 * v53;
              int32x2_t v56 = vdup_n_s32(v48);
              int8x8_t v57 = vbic_s8((int8x8_t)vmin_s32(v73, vadd_s32(v56, (int32x2_t)0x200000001)), (int8x8_t)vcgt_s32((int32x2_t)0xFFFFFFFEFFFFFFFFLL, v56));
              uint64_t v58 = 4 * v57.u32[0];
              float v59 = vabds_f32(-1.0, v51);
              float v60 = (float)((float)((float)(v59 * (float)(v59 * 3.75))
                                  + (float)((float)(v59 * (float)(v59 * -0.75)) * v59))
                          + (float)(v59 * -6.0))
                  + 3.0;
              float v61 = fabsf(v51);
              float v62 = (float)((float)(v61 * (float)(v61 * -2.25)) + (float)((float)(v61 * (float)(v61 * 1.25)) * v61))
                  + 1.0;
              float v63 = vabds_f32(1.0, v51);
              float v64 = (float)((float)(v63 * (float)(v63 * -2.25)) + (float)((float)(v63 * (float)(v63 * 1.25)) * v63))
                  + 1.0;
              float v65 = vabds_f32(v23, v51);
              float v66 = (float)((float)((float)(v65 * (float)(v65 * 3.75))
                                  + (float)((float)(v65 * (float)(v65 * -0.75)) * v65))
                          + (float)(v65 * -6.0))
                  + 3.0;
              float v67 = (float)((float)((float)(v62 * *(float *)(v33 + v55)) + (float)(v60 * *(float *)(v33 + v54)))
                          + (float)(v64 * *(float *)(v33 + v58)))
                  + (float)(v66 * *(float *)(v33 + 4 * v57.u32[1]));
              float v68 = (float)((float)((float)(v62 * *(float *)(v34 + v55)) + (float)(v60 * *(float *)(v34 + v54)))
                          + (float)(v64 * *(float *)(v34 + v58)))
                  + (float)(v66 * *(float *)(v34 + 4 * v57.u32[1]));
              *(float *)v57.i32 = (float)((float)((float)(v62 * *(float *)(v37 + v55))
                                                + (float)(v60 * *(float *)(v37 + v54)))
                                        + (float)(v64 * *(float *)(v37 + v58)))
                                + (float)(v66 * *(float *)(v37 + 4 * v57.u32[1]));
              float v69 = (float)(v62 * *(float *)(v38 + v55)) + (float)(v60 * *(float *)(v38 + v54));
              float v24 = -1.0;
              float v23 = 2.0;
              *(float *)&v22[4 * v46++ + (v11 * v25)] = (float)((float)((float)(v41 * v68)
                                                                                    + (float)(v39 * v67))
                                                                            + (float)(v43 * *(float *)v57.i32))
                                                                    + (float)(v45
                                                                            * (float)((float)(v69
                                                                                            + (float)(v64 * *(float *)(v38 + v58)))
                                                                                    + (float)(v66
                                                                                            * *(float *)(v38 + 4 * v57.u32[1]))));
            }
            while (a7 != v46);
            ++v25;
          }
          while (v25 != v19);
          int v14 = v82 + 1;
          uint64_t v9 = a8;
          int v10 = v79;
          size_t v12 = v83;
        }
        while (v82 + 1 != v8);
      }
    }
  }
}

uint64_t bmBufferResizeCoordConvert(uint64_t result, unsigned int a2, unsigned int a3, unsigned int a4, int a5, float *a6, float *a7, float a8, float a9)
{
  if (!a5)
  {
    *a6 = (float)(a8 / (float)result) * (float)a3;
    float v10 = (float)(a9 / (float)a2) * (float)a4;
    goto LABEL_7;
  }
  float v9 = (float)a3 / (float)result;
  if (v9 >= (float)((float)a4 / (float)a2)) {
    float v9 = (float)a4 / (float)a2;
  }
  *a6 = v9 * a8;
  *a7 = v9 * a9;
  if (a5 == 2)
  {
    *a6 = (float)((float)((float)a3 - (float)(v9 * (float)result)) * 0.5) + *a6;
    float v10 = (float)((float)((float)a4 - (float)(v9 * (float)a2)) * 0.5) + *a7;
LABEL_7:
    *a7 = v10;
  }
  return result;
}

float bmBufferResizeCoordConvertReversed(unsigned int a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5, float *a6, float *a7, float a8, float a9)
{
  float v9 = (float)a3;
  if (a5)
  {
    float v10 = v9 / (float)a1;
    if (v10 >= (float)((float)a4 / (float)a2)) {
      float v10 = (float)a4 / (float)a2;
    }
    float v11 = (float)(v9 - (float)(v10 * (float)a1)) * 0.5;
    float v12 = (float)((float)a4 - (float)(v10 * (float)a2)) * 0.5;
    if (a5 != 2)
    {
      float v11 = 0.0;
      float v12 = 0.0;
    }
    float v13 = 1.0 / v10;
    *a6 = v13 * (float)(a8 - v11);
    float result = v13 * (float)(a9 - v12);
    *a7 = result;
  }
  else
  {
    *a6 = (float)(a8 / v9) * (float)a1;
    float result = (float)(a9 / (float)a4) * (float)a2;
    *a7 = result;
  }
  return result;
}

void BmMixedBufSize::BmMixedBufSize(BmMixedBufSize *this)
{
  *(void *)this = 0;
}

{
  *(void *)this = 0;
}

float bmMinimum(float result, float a2)
{
  if (result >= a2) {
    return a2;
  }
  return result;
}

uint64_t bmMinimum(uint64_t result, unsigned int a2)
{
  if (result >= a2) {
    return a2;
  }
  else {
    return result;
  }
}

uint64_t bmMinimum(uint64_t result, int a2)
{
  if ((int)result >= a2) {
    return a2;
  }
  else {
    return result;
  }
}

float bmMaximum(float result, float a2)
{
  if (result < a2) {
    return a2;
  }
  return result;
}

uint64_t bmMaximum(uint64_t result, unsigned int a2)
{
  if (result <= a2) {
    return a2;
  }
  else {
    return result;
  }
}

uint64_t bmMaximum(uint64_t result, int a2)
{
  if ((int)result <= a2) {
    return a2;
  }
  else {
    return result;
  }
}

uint64_t bmClamp(signed int a1, unsigned int a2, signed int a3)
{
  if (a3 >= a1) {
    unsigned int v3 = a1;
  }
  else {
    unsigned int v3 = a3;
  }
  if (a1 >= (int)a2) {
    return v3;
  }
  else {
    return a2;
  }
}

float bmClamp(float a1, float a2, float a3)
{
  if (a3 >= a1) {
    a3 = a1;
  }
  if (a1 >= a2) {
    return a3;
  }
  else {
    return a2;
  }
}

float bmSoftmax2(float a1, float a2)
{
  if (a1 >= a2) {
    float v3 = a1;
  }
  else {
    float v3 = a2;
  }
  float v4 = expf(a1 - v3);
  float v5 = expf(a2 - v3);
  return v5 / (float)(v4 + v5);
}

void bmSoftmax(float32x4_t *a1, float *a2, unsigned int a3, __n128 a4)
{
  float v5 = a2;
  a4.n128_u32[0] = a1->i32[0];
  if (a3 >= 2)
  {
    int v6 = &a1->f32[1];
    do
    {
      float v7 = *v6++;
      float v8 = v7;
      if (a4.n128_f32[0] < v7) {
        a4.n128_f32[0] = v8;
      }
    }
    while (v6 < &a1->f32[a3]);
  }
  if (!a3) {
    return;
  }
  uint64_t v9 = 0;
  if (a3 < 8) {
    goto LABEL_12;
  }
  if ((unint64_t)((char *)a2 - (char *)a1) <= 0x1F) {
    goto LABEL_12;
  }
  uint64_t v9 = a3 & 0xFFFFFFF8;
  float32x4_t v11 = (float32x4_t)vdupq_lane_s32((int32x2_t)a4.n128_u64[0], 0);
  float v12 = a2 + 4;
  float v13 = a1 + 1;
  uint64_t v14 = v9;
  do
  {
    float32x4_t v15 = vsubq_f32(*v13, v11);
    *((float32x4_t *)v12 - 1) = vsubq_f32(v13[-1], v11);
    *(float32x4_t *)float v12 = v15;
    v12 += 8;
    v13 += 2;
    v14 -= 8;
  }
  while (v14);
  if (v9 != a3)
  {
LABEL_12:
    uint64_t v16 = a3 - v9;
    uint64_t v17 = v9;
    uint64_t v18 = &a2[v9];
    uint64_t v19 = &a1->f32[v17];
    do
    {
      float v20 = *v19++;
      *v18++ = v20 - a4.n128_f32[0];
      --v16;
    }
    while (v16);
  }
  if (a3 == 1)
  {
    LODWORD(v21) = 0;
    a4.n128_u64[0] = 0;
    unsigned int v22 = a2;
  }
  else
  {
    uint64_t v21 = a3 & 0xFFFFFFFE;
    float v23 = a2 + 1;
    a4.n128_u32[0] = 0;
    uint64_t v24 = v21;
    do
    {
      float v39 = a4.n128_f32[0];
      float v25 = *v23;
      float v26 = expf(*(v23 - 1));
      a4.n128_f32[0] = (float)(v39 + v26) + expf(v25);
      v23 += 2;
      v24 -= 2;
    }
    while (v24);
    if (v21 == a3) {
      goto LABEL_22;
    }
    unsigned int v22 = &v5[a3 & 0xFFFFFFFE];
  }
  int v27 = a3 - v21;
  do
  {
    __n128 v40 = a4;
    float v28 = *v22++;
    float v29 = expf(v28);
    __n128 v30 = v40;
    v30.n128_f32[0] = v40.n128_f32[0] + v29;
    a4 = v30;
    --v27;
  }
  while (v27);
LABEL_22:
  float v41 = a4.n128_f32[0];
  if (a3 == 1)
  {
    LODWORD(v31) = 0;
    goto LABEL_28;
  }
  uint64_t v31 = a3 & 0xFFFFFFFE;
  float32x2_t v32 = (float32x2_t)vdup_lane_s32((int32x2_t)a4.n128_u64[0], 0);
  uint64_t v33 = v5;
  uint64_t v34 = v31;
  do
  {
    LODWORD(v37) = *(void *)v33;
    float v38 = expf(COERCE_FLOAT(HIDWORD(*(void *)v33)));
    v35.f32[0] = expf(v37);
    v35.f32[1] = v38;
    *(float32x2_t *)uint64_t v33 = vdiv_f32(v35, v32);
    v33 += 2;
    v34 -= 2;
  }
  while (v34);
  if (v31 != a3)
  {
    v5 += a3 & 0xFFFFFFFE;
LABEL_28:
    int v36 = a3 - v31;
    do
    {
      *float v5 = expf(*v5) / v41;
      ++v5;
      --v36;
    }
    while (v36);
  }
}

void bmSoftmax(float32x4_t *a1, float *a2, unsigned int a3, unsigned int a4, double a5)
{
  unsigned int v5 = a3;
  int v6 = a2;
  LODWORD(a5) = a1->i32[0];
  unint64_t v7 = 4 * a4;
  if (a4 * a3 > a4)
  {
    float v8 = &a1->f32[v7 / 4];
    do
    {
      if (*(float *)&a5 < *v8) {
        *(float *)&a5 = *v8;
      }
      float v8 = (const float *)((char *)v8 + v7);
    }
    while (v8 < &a1->f32[a4 * a3]);
  }
  if (a3)
  {
    uint64_t v9 = 0;
    if (a3 < 8) {
      goto LABEL_13;
    }
    if (a4 != 1) {
      goto LABEL_13;
    }
    if ((unint64_t)((char *)a2 - (char *)a1) < 0x20) {
      goto LABEL_13;
    }
    uint64_t v9 = a3 & 0xFFFFFFF8;
    float32x4_t v10 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a5, 0);
    float32x4_t v11 = a1 + 1;
    float v12 = a2 + 4;
    uint64_t v13 = v9;
    do
    {
      float32x4_t v14 = vsubq_f32(*v11, v10);
      *((float32x4_t *)v12 - 1) = vsubq_f32(v11[-1], v10);
      *(float32x4_t *)float v12 = v14;
      v11 += 2;
      v12 += 8;
      v13 -= 8;
    }
    while (v13);
    if (v9 != a3)
    {
LABEL_13:
      uint64_t v15 = a3 - v9;
      int v16 = a4 * v9;
      do
      {
        a2[v16] = a1->f32[v16] - *(float *)&a5;
        v16 += a4;
        --v15;
      }
      while (v15);
    }
    float v17 = 0.0;
    uint64_t v18 = a2;
    unsigned int v19 = a3;
    do
    {
      float v17 = v17 + expf(*v18);
      uint64_t v18 = (float *)((char *)v18 + v7);
      --v19;
    }
    while (v19);
    do
    {
      float *v6 = expf(*v6) / v17;
      int v6 = (float *)((char *)v6 + v7);
      --v5;
    }
    while (v5);
  }
}

char *bmArgMax(char *result, unsigned int a2, int a3)
{
  if (a2 < 2) {
    return 0;
  }
  float v3 = result;
  LODWORD(result) = 0;
  char v4 = *v3;
  unsigned int v5 = 1;
  int v6 = a3;
  do
  {
    if (v3[v6] <= v4)
    {
      float result = (char *)result;
    }
    else
    {
      char v4 = v3[v6];
      float result = (char *)v5;
    }
    ++v5;
    v6 += a3;
  }
  while (a2 != v5);
  return result;
}

unsigned int bmCeil(float a1)
{
  return vcvtps_s32_f32(a1);
}

uint64_t bmQsort(uint64_t result, unint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a2 >= 2 && a3)
  {
    v8[4] = v4;
    v8[5] = v5;
    if ((a3 & 3) != 0) {
      unint64_t v6 = a3;
    }
    else {
      unint64_t v6 = a3 >> 2;
    }
    unint64_t v7 = sub_246D793A0;
    v8[0] = a3;
    v8[1] = v6;
    if ((a3 & 3) == 0) {
      unint64_t v7 = sub_246D794A8;
    }
    v8[2] = a4;
    v8[3] = v7;
    return sub_246D79260(result, a2, (uint64_t)v8);
  }
  return result;
}

uint64_t sub_246D79260(uint64_t result, unint64_t a2, uint64_t a3)
{
  unint64_t v4 = a2;
  uint64_t v5 = result;
  if (a2 >= 7)
  {
    do
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      unint64_t v9 = v4 - 1;
      do
      {
        if ((*(int (**)(unint64_t, uint64_t))(a3 + 16))(v5 + *(void *)a3 * v9, v5 + *(void *)a3 * v8) >= 1)(*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 24))(v5, v7++, v8, a3); {
        ++v8;
        }
      }
      while (v9 != v8);
      (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(a3 + 24))(v5, v4 - 1, v7, a3);
      float result = sub_246D79260(v5, v7, a3);
      v5 += *(void *)a3 + *(void *)a3 * v7;
      v4 += ~v7;
    }
    while (v4 > 6);
  }
  if (v4 >= 2)
  {
    for (uint64_t i = 1; i != v4; ++i)
    {
      uint64_t v10 = i;
      do
      {
        uint64_t v11 = v10 - 1;
        float result = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(v5 + *(void *)a3 * (v10 - 1), v5 + *(void *)a3 * v10);
        if ((int)result < 1) {
          break;
        }
        float result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 24))(v5, v10 - 1, v10, a3);
        --v10;
      }
      while (v11);
    }
  }
  return result;
}

uint64_t sub_246D793A0(uint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a4[1];
  if (v4)
  {
    unint64_t v5 = result + *a4 * a3;
    unint64_t v6 = (unsigned char *)(result + *a4 * a2);
    unint64_t v7 = a4[1];
    if (v7 < 8)
    {
      uint64_t v8 = (unsigned char *)(result + *a4 * a3);
      goto LABEL_20;
    }
    uint64_t v9 = (v4 - 1) + 1;
    if (v5 + v9 > (unint64_t)v6 && (unint64_t)&v6[v9] > v5)
    {
      uint64_t v8 = (unsigned char *)(result + *a4 * a3);
      goto LABEL_20;
    }
    if (v7 >= 0x20)
    {
      unint64_t v11 = v7 - (a4[1] & 0x1FLL);
      float v12 = (long long *)(v6 + 16);
      uint64_t v13 = (long long *)(v5 + 16);
      unint64_t v14 = v11;
      do
      {
        long long v15 = *(v12 - 1);
        long long v16 = *v12;
        long long v17 = *v13;
        *(v12 - 1) = *(v13 - 1);
        long long *v12 = v17;
        *(v13 - 1) = v15;
        *uint64_t v13 = v16;
        v12 += 2;
        v13 += 2;
        v14 -= 32;
      }
      while (v14);
      if ((v4 & 0x1F) == 0) {
        return result;
      }
      if ((v4 & 0x1Fu) < 8uLL)
      {
        v6 += v11;
        uint64_t v8 = (unsigned char *)(v5 + v11);
        LODWORD(v4) = v4 - v11;
        goto LABEL_20;
      }
    }
    else
    {
      unint64_t v11 = 0;
    }
    unint64_t v18 = v7 - (v4 & 7);
    uint64_t v8 = (unsigned char *)(v5 + v18);
    unint64_t v19 = v11 + (v4 & 7) - v7;
    float v20 = (uint64_t *)&v6[v11];
    uint64_t v21 = (uint64_t *)(v5 + v11);
    do
    {
      uint64_t v22 = *v20;
      *v20++ = *v21;
      *v21++ = v22;
      v19 += 8;
    }
    while (v19);
    if ((v4 & 7) != 0)
    {
      LODWORD(v4) = v4 - v18;
      v6 += v18;
      do
      {
LABEL_20:
        char v23 = *v6;
        *v6++ = *v8;
        *v8++ = v23;
        LODWORD(v4) = v4 - 1;
      }
      while (v4);
    }
  }
  return result;
}

uint64_t sub_246D794A8(uint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a4[1];
  if (v4)
  {
    unint64_t v5 = result + *a4 * a3;
    unint64_t v6 = (_DWORD *)(result + *a4 * a2);
    if (a4[1] < 8uLL)
    {
      unint64_t v7 = (_DWORD *)(result + *a4 * a3);
      goto LABEL_13;
    }
    uint64_t v8 = ((4 * v4 + 0x3FFFFFFFCLL) & 0x3FFFFFFFCLL) + 4;
    if (v5 + v8 > (unint64_t)v6 && (unint64_t)v6 + v8 > v5)
    {
      unint64_t v7 = (_DWORD *)(result + *a4 * a3);
      do
      {
LABEL_13:
        int v17 = *v6;
        *v6++ = *v7;
        *v7++ = v17;
        LODWORD(v4) = v4 - 1;
      }
      while (v4);
      return result;
    }
    uint64_t v10 = a4[1] - (a4[1] & 7);
    unint64_t v7 = (_DWORD *)(v5 + 4 * v10);
    unint64_t v11 = (long long *)(v6 + 4);
    float v12 = (long long *)(v5 + 16);
    uint64_t v13 = v10;
    do
    {
      long long v14 = *(v11 - 1);
      long long v15 = *v11;
      long long v16 = *v12;
      *(v11 - 1) = *(v12 - 1);
      long long *v11 = v16;
      *(v12 - 1) = v14;
      long long *v12 = v15;
      v11 += 2;
      v12 += 2;
      v13 -= 8;
    }
    while (v13);
    if ((v4 & 7) != 0)
    {
      LODWORD(v4) = v4 & 7;
      v6 += v10;
      goto LABEL_13;
    }
  }
  return result;
}

uint64_t bmHeapsort(uint64_t a1, unint64_t a2, unint64_t a3, int (*a4)(uint64_t, uint64_t))
{
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if ((a3 & 3) != 0) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = a3 >> 2;
  }
  v26[0] = a3;
  v26[1] = v6;
  if ((a3 & 3) != 0) {
    unint64_t v7 = (void (*)(uint64_t, uint64_t, uint64_t, void *))sub_246D793A0;
  }
  else {
    unint64_t v7 = (void (*)(uint64_t, uint64_t, uint64_t, void *))sub_246D794A8;
  }
  int v27 = a4;
  float v28 = v7;
  if (a2 < 7)
  {
    if (a2 >= 2)
    {
      if (a4(a1, a1 + a3) >= 1) {
        v7(a1, 0, 1, v26);
      }
      if (a2 != 2)
      {
        unint64_t v17 = 2 - a2;
        uint64_t v18 = -3;
        do
        {
          if (v27(a1 + v26[0] * (v18 + 4), a1 + v26[0] * (v18 + 5)) >= 1)
          {
            v28(a1, v18 + 4, v18 + 5, v26);
            if (v27(a1 + v26[0] * (v18 + 3), a1 + v26[0] * (v18 + 4)) >= 1)
            {
              v28(a1, v18 + 3, v18 + 4, v26);
              if (v18 != -3 && v27(a1 + v26[0] * (v18 + 2), a1 + v26[0] * (v18 + 3)) >= 1)
              {
                v28(a1, v18 + 2, v18 + 3, v26);
                if (v18 != -2 && v27(a1 + v26[0] * (v18 + 1), a1 + v26[0] * (v18 + 2)) >= 1)
                {
                  v28(a1, v18 + 1, v18 + 2, v26);
                  if (v18 != -1 && v27(a1 + v26[0] * v18, a1 + v26[0] * (v18 + 1)) >= 1) {
                    v28(a1, v18, v18 + 1, v26);
                  }
                }
              }
            }
          }
          ++v18;
        }
        while (v17 + v18 != -3);
      }
    }
  }
  else
  {
    int v8 = a2 - 1;
    if ((int)a2 >= 1)
    {
      if ((int)a2 >= 2) {
        int v8 = a2 - 2;
      }
      unint64_t v9 = (v8 >> 1);
      unint64_t v10 = a2 - 1;
      do
      {
        unint64_t v12 = (2 * v9) | 1;
        if (v12 <= v10)
        {
          uint64_t v13 = 2 * v9;
          unint64_t v14 = v9;
          do
          {
            if (v27(a1 + v26[0] * v12, a1 + v26[0] * v14) <= 0) {
              unint64_t v15 = v14;
            }
            else {
              unint64_t v15 = v12;
            }
            if (v13 + 2 <= v10 && v27(a1 + v26[0] * (v13 + 2), a1 + v26[0] * v15) > 0) {
              unint64_t v15 = v13 + 2;
            }
            if (v15 == v14) {
              break;
            }
            v28(a1, v14, v15, v26);
            uint64_t v13 = 2 * v15;
            unint64_t v12 = (2 * v15) | 1;
            unint64_t v14 = v15;
          }
          while (v12 <= v10);
        }
        BOOL v11 = (int)v9-- <= 0;
      }
      while (!v11);
      if ((int)a2 >= 2)
      {
        uint64_t v19 = a2;
        do
        {
          v28(a1, 0, (v19 - 1), v26);
          unint64_t v20 = (v19 - 2);
          if (v19 != 2)
          {
            uint64_t v21 = 0;
            unint64_t v22 = 0;
            unint64_t v23 = 1;
            do
            {
              if (v27(a1 + v26[0] * v23, a1 + v26[0] * v22) <= 0) {
                unint64_t v24 = v22;
              }
              else {
                unint64_t v24 = v23;
              }
              unint64_t v25 = v21 + 2;
              if (v25 <= v20 && v27(a1 + v26[0] * v25, a1 + v26[0] * v24) > 0) {
                unint64_t v24 = v25;
              }
              if (v24 == v22) {
                break;
              }
              v28(a1, v22, v24, v26);
              uint64_t v21 = 2 * v24;
              unint64_t v23 = (2 * v24) | 1;
              unint64_t v22 = v24;
            }
            while (v23 <= v20);
          }
          BOOL v11 = v19-- <= 2;
        }
        while (!v11);
      }
    }
  }
  return 0;
}

uint64_t isort_internal(uint64_t result, unint64_t a2, uint64_t a3)
{
  if (a2 >= 2)
  {
    uint64_t v5 = result;
    for (uint64_t i = 1; i != a2; ++i)
    {
      uint64_t v7 = i;
      do
      {
        uint64_t v8 = v7 - 1;
        float result = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(v5 + *(void *)a3 * (v7 - 1), v5 + *(void *)a3 * v7);
        if ((int)result < 1) {
          break;
        }
        float result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 24))(v5, v7 - 1, v7, a3);
        --v7;
      }
      while (v8);
    }
  }
  return result;
}

uint64_t bmMunkresTempBytes(int a1)
{
  return a1 * a1 + 12 * a1 + 4 * a1 * a1 + ((4 * a1) | 3) + 2 * (((4 * a1) | 3u) + a1) + 9;
}

void bmMunkres(float *a1, unsigned int a2, unsigned __int8 *a3, unsigned int a4, unsigned int *a5, unsigned int a6, unsigned int *a7, double a8)
{
  if (a2 == 1) {
    goto LABEL_15;
  }
  unint64_t v10 = a3;
  if (!a3) {
    goto LABEL_15;
  }
  size_t v12 = a2;
  int v13 = a2 * a2;
  uint64_t v14 = a2 * a2 + 12 * a2 + 6;
  unint64_t v15 = &a3[v14];
  unsigned int v16 = a2 - a3;
  uint64_t v17 = a2 + v14;
  uint64_t v18 = &a3[v17];
  unint64_t v19 = (unint64_t)&a3[a2 + 3 + v17];
  unsigned int v20 = v19 & 0xFFFFFFFC;
  if ((v19 & 0xFFFFFFFFFFFFFFFCLL) == 0)
  {
LABEL_15:
    *a5 = 0;
    return;
  }
  int v21 = 4 * a2;
  if (a2)
  {
    for (uint64_t i = 0; i != a2; ++i)
    {
      unsigned int v23 = 0;
      unint64_t v24 = &a1[i];
      float v25 = 3.4028e38;
      uint64_t v26 = a2;
      do
      {
        if (*(float *)((char *)v24 + v23) < v25) {
          float v25 = *(float *)((char *)v24 + v23);
        }
        v23 += v21;
        --v26;
      }
      while (v26);
      if (v25 > 0.0)
      {
        unsigned int v27 = 0;
        uint64_t v28 = a2;
        do
        {
          *(float *)((char *)v24 + v27) = *(float *)((char *)v24 + v27) - v25;
          v27 += v21;
          --v28;
        }
        while (v28);
      }
    }
    unsigned int v29 = 0;
    uint64_t v30 = 0;
    uint64_t v272 = a2 & 0xFFFFFFF8;
    while (1)
    {
      uint64_t v31 = (float32x4_t *)((char *)a1 + v29 + 16);
      float32x2_t v32 = (float *)((char *)a1 + v29);
      LODWORD(a_Block_object_dispose(&STACK[0x488], 8) = 2139095039;
      uint64_t v33 = a2;
      do
      {
        float v34 = *v32++;
        float v35 = v34;
        if (v34 < *(float *)&a8) {
          *(float *)&a8 = v35;
        }
        --v33;
      }
      while (v33);
      if (*(float *)&a8 <= 0.0) {
        goto LABEL_18;
      }
      if (a2 > 7)
      {
        float32x4_t v37 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a8, 0);
        uint64_t v38 = a2 & 0xFFFFFFF8;
        do
        {
          float32x4_t v39 = vsubq_f32(*v31, v37);
          v31[-1] = vsubq_f32(v31[-1], v37);
          *uint64_t v31 = v39;
          v31 += 2;
          v38 -= 8;
        }
        while (v38);
        uint64_t v36 = a2 & 0xFFFFFFF8;
        if (v272 == a2) {
          goto LABEL_18;
        }
      }
      else
      {
        uint64_t v36 = 0;
      }
      uint64_t v40 = a2 - v36;
      float v41 = (float *)((char *)&a1[v36] + v29);
      do
      {
        *float v41 = *v41 - *(float *)&a8;
        ++v41;
        --v40;
      }
      while (v40);
LABEL_18:
      ++v30;
      v29 += v21;
      if (v30 == a2) {
        goto LABEL_33;
      }
    }
  }
  uint64_t v272 = a2 & 0xFFFFFFF8;
LABEL_33:
  size_t v42 = v13 + 8 * a2 + v21 + 6;
  if (v12 <= 1) {
    uint64_t v43 = 1;
  }
  else {
    uint64_t v43 = v12;
  }
  if (!a2)
  {
    bzero(v10, v42);
    return;
  }
  size_t v269 = v42;
  unint64_t v247 = v19;
  v249 = (_DWORD *)(v19 & 0xFFFFFFFFFFFFFFFCLL);
  v250 = a7;
  __dst = (uint32x2_t *)((unint64_t)&v10[v20 + 3 + v21 - v10] & 0xFFFFFFFFFFFFFFFCLL);
  unint64_t v251 = (unint64_t)&v10[((v20 + v21 + 3) & 0xFFFFFFFC) + 3 + v21 - v10] & 0xFFFFFFFFFFFFFFFCLL;
  v253 = (unsigned int *)((unint64_t)&v10[4 * v13
                                               + 3
                                               + ((((v20 + v21 + 3) & 0xFFFFFFFC) + v21 + 3) & 0xFFFFFFFC)
                                               - v10] & 0xFFFFFFFFFFFFFFFCLL);
  int32x4_t v44 = vdupq_n_s32(a2);
  uint64_t v258 = v12 & 0xFFFFFFE0;
  size_t v248 = 4 * v12;
  unint64_t v45 = (unint64_t)(v10 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  unint64_t v46 = (unint64_t)&v10[(v45 + v21 - v10) + 3] & 0xFFFFFFFFFFFFFFFCLL;
  float v47 = &v10[((v45 + v21 + 3) & 0xFFFFFFFC) + v21 - v10];
  signed int v48 = (int8x16_t *)&v10[v13 + ((v45 + v21 + 3) & 0xFFFFFFFC) + v21 - v10];
  float v49 = &v10[v16 + v13 + ((v45 + v21 + 3) & 0xFFFFFFFC) + v21];
  uint64_t v50 = v16 + v49;
  float v51 = (int8x16_t *)&v10[v50];
  unsigned int v52 = &v10[v16 + v10 + v50];
  BOOL v53 = v50 - (unint64_t)(v16 + v48) < 8 || a2 < 8;
  BOOL v267 = v53;
  BOOL v54 = (unint64_t)(v18 - (unsigned __int8 *)v51) < 0x20 || a2 < 8;
  BOOL v266 = v54;
  BOOL v55 = (unint64_t)(v15 - (unsigned __int8 *)v48) < 0x20 || a2 < 8;
  BOOL v265 = v55;
  v274 = v52;
  BOOL v57 = &v52[v12] > (unsigned __int8 *)a5 && v52 < (unsigned __int8 *)&a5[v12] || a2 < 8;
  BOOL v260 = v57;
  v259 = &v10[v50 + 3];
  v262 = &v10[v17];
  uint64_t v257 = (uint64_t)&v10[v17 + 16];
  v275 = &v10[v50];
  v261 = &v10[v14];
  uint64_t v255 = (uint64_t)&v10[v14 + 16];
  v256 = v51 + 1;
  v254 = v48 + 1;
  v273 = v18;
  uint64_t v271 = v43;
  v264 = v10;
  int32x4_t v268 = v44;
  v263 = (unsigned __int8 *)v48;
LABEL_53:
  bzero(v10, v269);
  uint64_t v58 = a5 + 4;
  uint64_t v59 = v272;
  if (a2 < 8)
  {
    uint64_t v60 = 0;
    float v61 = v273;
    float v62 = a1;
    uint64_t v63 = v271;
    size_t v64 = 4 * a2;
    unint64_t v10 = v264;
    float v65 = v263;
    v66.i64[0] = 0x100000001;
    v66.i64[1] = 0x100000001;
    v67.i64[0] = 0x101010101010101;
    v67.i64[1] = 0x101010101010101;
LABEL_57:
    size_t v68 = v12 - v60;
    float v69 = &a5[v60];
    do
    {
      *v69++ = a2;
      --v68;
    }
    while (v68);
    goto LABEL_59;
  }
  do
  {
    *((int32x4_t *)v58 - 1) = v268;
    *(int32x4_t *)uint64_t v58 = v268;
    v58 += 8;
    v59 -= 8;
  }
  while (v59);
  uint64_t v60 = v272;
  float v61 = v273;
  float v62 = a1;
  uint64_t v63 = v271;
  size_t v64 = 4 * a2;
  unint64_t v10 = v264;
  float v65 = v263;
  v66.i64[0] = 0x100000001;
  v66.i64[1] = 0x100000001;
  v67.i64[0] = 0x101010101010101;
  v67.i64[1] = 0x101010101010101;
  if (v272 != v12) {
    goto LABEL_57;
  }
LABEL_59:
  unsigned int v70 = 0;
  int v71 = 0;
  uint64_t v72 = 0;
  do
  {
    int32x2_t v73 = &v47[v71];
    int32x2_t v74 = (_DWORD *)v46;
    size_t v75 = v12;
    float v76 = (float *)((char *)v62 + v70);
    do
    {
      if (*v76 > 0.000001)
      {
        *int32x2_t v73 = 1;
      }
      else
      {
        ++*v74;
        ++*(_DWORD *)(v45 + 4 * v72);
      }
      ++v73;
      ++v74;
      ++v76;
      --v75;
    }
    while (v75);
    ++v72;
    v71 += a2;
    v70 += v64;
  }
  while (v72 != v12);
  uint64_t v77 = 0;
  char v78 = 0;
  while (1)
  {
    if (*(_DWORD *)(v45 + 4 * v77) == 1)
    {
      uint64_t v79 = 0;
      unsigned int v80 = &v47[v77 * a2];
      do
      {
        int v81 = v80[v79];
        if (!v80[v79])
        {
          v49[v77] = 1;
          v80[v79] = 2;
          uint64_t v82 = v79;
          a5[v82] = v77;
          --*(_DWORD *)(v45 + 4 * v77);
          *(_DWORD *)(v46 + v82 * 4) = *(_DWORD *)(v46 + 4 * v79) - 1;
          size_t v83 = &v47[v79];
          uint64_t v84 = v77;
          size_t v85 = v12;
          uint64_t v86 = (_DWORD *)v45;
          do
          {
            if (v84 && !v83[v81])
            {
              v83[v81] = 3;
              --*(_DWORD *)(v46 + 4 * v79);
              --*v86;
            }
            v81 += a2;
            ++v86;
            --v84;
            --v85;
          }
          while (v85);
          char v78 = 1;
        }
        ++v79;
      }
      while (v79 != v12);
    }
    if (++v77 == v12)
    {
      uint64_t v87 = 0;
      char v88 = v78;
      do
      {
        if (*(_DWORD *)(v46 + 4 * v87) == 1)
        {
          int v89 = 0;
          uint64_t v90 = 0;
          do
          {
            int v91 = &v47[v90 * a2];
            if (!v91[v87])
            {
              uint64_t v92 = 0;
              v49[v90] = 1;
              v91[v87] = 2;
              uint64_t v93 = v87;
              a5[v93] = v90;
              --*(_DWORD *)(v45 + 4 * v90);
              v94 = &v47[v89];
              *(_DWORD *)(v46 + v93 * 4) = *(_DWORD *)(v46 + 4 * v87) - 1;
              do
              {
                if (v87 != v92 && !v94[v92])
                {
                  v94[v92] = 3;
                  --*(_DWORD *)(v45 + 4 * v90);
                  --*(_DWORD *)(v46 + 4 * v92);
                }
                ++v92;
              }
              while (v12 != v92);
              char v88 = 1;
            }
            ++v90;
            v89 += a2;
          }
          while (v90 != v12);
        }
        ++v87;
      }
      while (v87 != v12);
      uint64_t v77 = 0;
      char v78 = 0;
      if ((v88 & 1) == 0) {
        break;
      }
    }
  }
  uint64_t v95 = 0;
  char v96 = 0;
  do
  {
    if (*(_DWORD *)(v45 + 4 * v95))
    {
      uint64_t v97 = 0;
      uint16x8_t v98 = &v47[v95 * a2];
      char v99 = 1;
      do
      {
        if (!v98[v97])
        {
          if (v99)
          {
            int v100 = 0;
            uint64_t v101 = 0;
            v49[v95] = 1;
            v98[v97] = 2;
            a5[v97] = v95;
            v274[v97] = 1;
            --*(_DWORD *)(v45 + 4 * v95);
            --*(_DWORD *)(v46 + 4 * v97);
            uint16x8_t v102 = &v47[v97];
            do
            {
              if (v95 != v101 && !v102[v100])
              {
                v102[v100] = 3;
                --*(_DWORD *)(v46 + 4 * v97);
                --*(_DWORD *)(v45 + 4 * v101);
              }
              ++v101;
              v100 += a2;
            }
            while (v12 != v101);
            char v99 = 0;
            char v96 = 1;
          }
          else
          {
            char v99 = 0;
            v98[v97] = 3;
            --*(_DWORD *)(v45 + 4 * v95);
            --*(_DWORD *)(v46 + 4 * v97);
          }
        }
        ++v97;
      }
      while (v97 != v12);
    }
    ++v95;
  }
  while (v95 != v12);
  if (!v267)
  {
    uint64_t v104 = 0;
    while (1)
    {
      int8x8_t v105 = vceqz_s8(*(int8x8_t *)&v49[v104]);
      if (v105.i8[0])
      {
        v259[v104 - 3] = 1;
        if ((v105.i8[1] & 1) == 0) {
          goto LABEL_111;
        }
      }
      else if ((v105.i8[1] & 1) == 0)
      {
LABEL_111:
        if (v105.i8[2]) {
          goto LABEL_112;
        }
        goto LABEL_120;
      }
      v259[v104 - 2] = 1;
      if (v105.i8[2])
      {
LABEL_112:
        v259[v104 - 1] = 1;
        if ((v105.i8[3] & 1) == 0) {
          goto LABEL_113;
        }
        goto LABEL_121;
      }
LABEL_120:
      if ((v105.i8[3] & 1) == 0)
      {
LABEL_113:
        if (v105.i8[4]) {
          goto LABEL_114;
        }
        goto LABEL_122;
      }
LABEL_121:
      v259[v104] = 1;
      if (v105.i8[4])
      {
LABEL_114:
        v259[v104 + 1] = 1;
        if ((v105.i8[5] & 1) == 0) {
          goto LABEL_115;
        }
        goto LABEL_123;
      }
LABEL_122:
      if ((v105.i8[5] & 1) == 0)
      {
LABEL_115:
        if (v105.i8[6]) {
          goto LABEL_116;
        }
        goto LABEL_124;
      }
LABEL_123:
      v259[v104 + 2] = 1;
      if (v105.i8[6])
      {
LABEL_116:
        v259[v104 + 3] = 1;
        if (v105.i8[7]) {
          goto LABEL_125;
        }
        goto LABEL_108;
      }
LABEL_124:
      if (v105.i8[7]) {
LABEL_125:
      }
        v259[v104 + 4] = 1;
LABEL_108:
      v104 += 8;
      if (v272 == v104)
      {
        uint64_t v103 = v272;
        if (v272 == v12) {
          goto LABEL_127;
        }
        goto LABEL_149;
      }
    }
  }
  uint64_t v103 = 0;
LABEL_149:
  size_t v121 = v12 - v103;
  uint64_t v122 = &v275[v103];
  unsigned int v123 = &v49[v103];
  do
  {
    if (!*v123++) {
      *uint64_t v122 = 1;
    }
    ++v122;
    --v121;
  }
  while (v121);
LABEL_127:
  uint64_t v106 = 0;
  int v107 = 0;
  do
  {
    if (v275[v106])
    {
      int64x2_t v108 = &v47[v106 * a2];
      int64x2_t v109 = v65;
      uint64x2_t v110 = a5;
      size_t v111 = v12;
      int v112 = v107;
      do
      {
        int v114 = *v108++;
        int v113 = v114;
        if ((v114 == 3 || v113 == 0) && !*v109)
        {
          int v112 = 1;
          *int64x2_t v109 = 1;
          uint64_t v116 = *v110;
          if (v116 < a2)
          {
            int v112 = 1;
            if (!v275[v116]) {
              v275[v116] = 1;
            }
          }
        }
        ++v110;
        ++v109;
        --v111;
      }
      while (v111);
    }
    else
    {
      int v112 = v107;
    }
    BOOL v117 = v106 + 1 == v12;
    BOOL v118 = v106 + 1 != v12;
    if (v106 + 1 == v12) {
      uint64_t v106 = 0;
    }
    else {
      ++v106;
    }
    int v107 = v118 & v112;
  }
  while (!v117 || (v112 & 1) != 0);
  if (v266)
  {
    uint64_t v119 = 0;
    unsigned int v120 = 0;
    goto LABEL_162;
  }
  if (a2 < 0x20)
  {
    unsigned int v120 = 0;
    uint64_t v125 = 0;
LABEL_159:
    int32x4_t v143 = 0uLL;
    int32x4_t v144 = (int32x4_t)v120;
    do
    {
      int8x8_t v145 = vceqz_s8(*(int8x8_t *)&v275[v125]);
      *(int8x8_t *)&v61[v125] = vand_s8(v145, (int8x8_t)0x101010101010101);
      uint16x8_t v146 = vmovl_u8((uint8x8_t)v145);
      int32x4_t v143 = vaddq_s32(v143, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v146), v66));
      int32x4_t v144 = vaddq_s32(v144, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v146.i8), v66));
      v125 += 8;
    }
    while (v272 != v125);
    unsigned int v120 = vaddvq_s32(vaddq_s32(v144, v143));
    uint64_t v119 = v272;
    if (v272 == v12) {
      goto LABEL_166;
    }
    goto LABEL_162;
  }
  int32x4_t v126 = 0uLL;
  v127 = v256;
  v128 = (int8x16_t *)v257;
  int32x4_t v129 = 0uLL;
  uint64_t v130 = v12 & 0xFFFFFFE0;
  int32x4_t v131 = 0uLL;
  int32x4_t v132 = 0uLL;
  int32x4_t v133 = 0uLL;
  int32x4_t v134 = 0uLL;
  int32x4_t v135 = 0uLL;
  int32x4_t v136 = 0uLL;
  do
  {
    int8x16_t v137 = vceqzq_s8(v127[-1]);
    int8x16_t v138 = vceqzq_s8(*v127);
    v128[-1] = vandq_s8(v137, v67);
    int8x16_t *v128 = vandq_s8(v138, v67);
    uint16x8_t v139 = vmovl_u8(*(uint8x8_t *)v137.i8);
    uint16x8_t v140 = vmovl_high_u8((uint8x16_t)v137);
    uint16x8_t v141 = vmovl_u8(*(uint8x8_t *)v138.i8);
    uint16x8_t v142 = vmovl_high_u8((uint8x16_t)v138);
    int32x4_t v132 = vaddq_s32(v132, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v140), v66));
    int32x4_t v131 = vaddq_s32(v131, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v140.i8), v66));
    int32x4_t v129 = vaddq_s32(v129, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v139), v66));
    int32x4_t v126 = vaddq_s32(v126, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v139.i8), v66));
    int32x4_t v136 = vaddq_s32(v136, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v142), v66));
    int32x4_t v135 = vaddq_s32(v135, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v142.i8), v66));
    int32x4_t v134 = vaddq_s32(v134, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v141), v66));
    int32x4_t v133 = vaddq_s32(v133, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v141.i8), v66));
    v128 += 2;
    v127 += 2;
    v130 -= 32;
  }
  while (v130);
  unsigned int v120 = vaddvq_s32(vaddq_s32(vaddq_s32(vaddq_s32(v133, v126), vaddq_s32(v135, v131)), vaddq_s32(vaddq_s32(v134, v129), vaddq_s32(v136, v132))));
  if (v258 == v12) {
    goto LABEL_166;
  }
  uint64_t v119 = v12 & 0xFFFFFFE0;
  uint64_t v125 = v119;
  if ((v12 & 0x18) != 0) {
    goto LABEL_159;
  }
LABEL_162:
  size_t v147 = v12 - v119;
  v148 = (BOOL *)&v262[v119];
  v149 = &v275[v119];
  do
  {
    int v150 = *v149++;
    *v148++ = v150 == 0;
    if (!v150) {
      ++v120;
    }
    --v147;
  }
  while (v147);
LABEL_166:
  if (v265)
  {
    uint64_t v151 = 0;
    goto LABEL_177;
  }
  if (a2 < 0x20)
  {
    uint64_t v152 = 0;
LABEL_174:
    int32x4_t v172 = 0uLL;
    int32x4_t v173 = (int32x4_t)v120;
    do
    {
      int8x8_t v174 = *(int8x8_t *)&v65[v152];
      *(int8x8_t *)&v15[v152] = v174;
      uint16x8_t v175 = vmovl_u8((uint8x8_t)vtst_s8(v174, v174));
      int32x4_t v172 = vaddq_s32(v172, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v175), v66));
      int32x4_t v173 = vaddq_s32(v173, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v175.i8), v66));
      v152 += 8;
    }
    while (v272 != v152);
    unsigned int v120 = vaddvq_s32(vaddq_s32(v173, v172));
    uint64_t v151 = v272;
    if (v272 == v12) {
      goto LABEL_181;
    }
    goto LABEL_177;
  }
  int32x4_t v153 = 0uLL;
  int32x4_t v154 = (int32x4_t)v120;
  v155 = v254;
  v156 = (_OWORD *)v255;
  uint64_t v157 = v12 & 0xFFFFFFE0;
  int32x4_t v158 = 0uLL;
  int32x4_t v159 = 0uLL;
  int32x4_t v160 = 0uLL;
  int32x4_t v161 = 0uLL;
  int32x4_t v162 = 0uLL;
  int32x4_t v163 = 0uLL;
  do
  {
    int8x16_t v164 = v155[-1];
    int8x16_t v165 = *v155;
    *(v156 - 1) = v164;
    _OWORD *v156 = v165;
    uint8x16_t v166 = (uint8x16_t)vtstq_s8(v164, v164);
    uint16x8_t v167 = vmovl_u8(*(uint8x8_t *)v166.i8);
    uint16x8_t v168 = vmovl_high_u8(v166);
    uint8x16_t v169 = (uint8x16_t)vtstq_s8(v165, v165);
    uint16x8_t v170 = vmovl_u8(*(uint8x8_t *)v169.i8);
    uint16x8_t v171 = vmovl_high_u8(v169);
    int32x4_t v159 = vaddq_s32(v159, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v168), v66));
    int32x4_t v158 = vaddq_s32(v158, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v168.i8), v66));
    int32x4_t v153 = vaddq_s32(v153, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v167), v66));
    int32x4_t v154 = vaddq_s32(v154, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v167.i8), v66));
    int32x4_t v163 = vaddq_s32(v163, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v171), v66));
    int32x4_t v162 = vaddq_s32(v162, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v171.i8), v66));
    int32x4_t v161 = vaddq_s32(v161, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v170), v66));
    int32x4_t v160 = vaddq_s32(v160, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v170.i8), v66));
    v156 += 2;
    v155 += 2;
    v157 -= 32;
  }
  while (v157);
  unsigned int v120 = vaddvq_s32(vaddq_s32(vaddq_s32(vaddq_s32(v160, v154), vaddq_s32(v162, v158)), vaddq_s32(vaddq_s32(v161, v153), vaddq_s32(v163, v159))));
  if (v258 == v12) {
    goto LABEL_181;
  }
  uint64_t v151 = v12 & 0xFFFFFFE0;
  uint64_t v152 = v151;
  if ((v12 & 0x18) != 0) {
    goto LABEL_174;
  }
LABEL_177:
  size_t v176 = v12 - v151;
  v177 = &v261[v151];
  v178 = &v65[v151];
  do
  {
    int v179 = *v178++;
    *v177++ = v179;
    if (v179) {
      ++v120;
    }
    --v176;
  }
  while (v176);
LABEL_181:
  if (((v120 == a2) & v96) != 1) {
    goto LABEL_204;
  }
  if (!v260)
  {
    uint64_t v181 = 0;
    v182 = a5 + 4;
    while (1)
    {
      int8x8_t v183 = vtst_s8(*(int8x8_t *)&v274[v181], *(int8x8_t *)&v274[v181]);
      if (v183.i8[0])
      {
        *(v182 - 4) = a2;
        if ((v183.i8[1] & 1) == 0) {
          goto LABEL_188;
        }
      }
      else if ((v183.i8[1] & 1) == 0)
      {
LABEL_188:
        if (v183.i8[2]) {
          goto LABEL_189;
        }
        goto LABEL_197;
      }
      *(v182 - 3) = a2;
      if (v183.i8[2])
      {
LABEL_189:
        *(v182 - 2) = a2;
        if ((v183.i8[3] & 1) == 0) {
          goto LABEL_190;
        }
        goto LABEL_198;
      }
LABEL_197:
      if ((v183.i8[3] & 1) == 0)
      {
LABEL_190:
        if (v183.i8[4]) {
          goto LABEL_191;
        }
        goto LABEL_199;
      }
LABEL_198:
      *(v182 - 1) = a2;
      if (v183.i8[4])
      {
LABEL_191:
        unsigned int *v182 = a2;
        if ((v183.i8[5] & 1) == 0) {
          goto LABEL_192;
        }
        goto LABEL_200;
      }
LABEL_199:
      if ((v183.i8[5] & 1) == 0)
      {
LABEL_192:
        if (v183.i8[6]) {
          goto LABEL_193;
        }
        goto LABEL_201;
      }
LABEL_200:
      v182[1] = a2;
      if (v183.i8[6])
      {
LABEL_193:
        v182[2] = a2;
        if (v183.i8[7]) {
          goto LABEL_202;
        }
        goto LABEL_185;
      }
LABEL_201:
      if (v183.i8[7]) {
LABEL_202:
      }
        v182[3] = a2;
LABEL_185:
      v181 += 8;
      v182 += 8;
      if (v272 == v181)
      {
        uint64_t v180 = v272;
        if (v272 == v12) {
          goto LABEL_204;
        }
        goto LABEL_228;
      }
    }
  }
  uint64_t v180 = 0;
LABEL_228:
  size_t v199 = v12 - v180;
  v200 = &a5[v180];
  v201 = &v274[v180];
  do
  {
    if (*v201++) {
      unsigned int *v200 = a2;
    }
    ++v200;
    --v199;
  }
  while (v199);
LABEL_204:
  if (v120 != a2)
  {
    unsigned int v184 = 0;
    uint64_t v185 = 0;
    float v186 = 3.4028e38;
    do
    {
      v187 = (float *)((char *)v62 + v184);
      v188 = v15;
      size_t v189 = v12;
      do
      {
        int v190 = *v188++;
        if (!v190 && !v61[v185] && *v187 < v186 && *v187 > 0.000001) {
          float v186 = *v187;
        }
        ++v187;
        --v189;
      }
      while (v189);
      ++v185;
      v184 += v64;
    }
    while (v185 != v12);
    unsigned int v192 = 0;
    uint64_t v193 = 0;
LABEL_219:
    v194 = (float *)((char *)v62 + v192);
    v195 = v15;
    uint64_t v196 = v63;
    while (1)
    {
      if (*v195++)
      {
        if (!v61[v193]) {
          goto LABEL_222;
        }
        float v197 = v186 + *v194;
      }
      else
      {
        if (v61[v193]) {
          goto LABEL_222;
        }
        float v197 = fmaxf(*v194 - v186, 0.0);
      }
      float *v194 = v197;
LABEL_222:
      ++v194;
      if (!--v196)
      {
        ++v193;
        v192 += v64;
        if (v193 != v63) {
          goto LABEL_219;
        }
        goto LABEL_53;
      }
    }
  }
  unint64_t v203 = 0;
  while (a5[v203 / 4] != a2)
  {
    v203 += 4;
    if (v248 == v203) {
      return;
    }
  }
  memcpy(__dst, a5, v64);
  bzero(v249, v248);
  unsigned int v204 = 0;
  uint64_t v205 = 0;
  do
  {
    int v206 = 0;
    uint64_t v207 = 0;
    do
    {
      if (a1[v204 + v207] <= 0.000001) {
        *(_DWORD *)(v251 + 4 * (v206 + v249[v207]++)) = v205;
      }
      ++v207;
      v206 += a2;
    }
    while (v12 != v207);
    ++v205;
    v204 += a2;
  }
  while (v205 != v12);
  uint64_t v208 = 0;
  if (a2 < 4)
  {
    v209 = __dst;
  }
  else
  {
    v209 = __dst;
    if (v247 - (unint64_t)__dst > 0xF)
    {
      uint64_t v208 = v12 & 0xFFFFFFFC;
      uint32x2_t v210 = (uint32x2_t)vdup_n_s32(a2);
      v211 = __dst + 1;
      v212 = v249 + 2;
      uint64_t v213 = v208;
      do
      {
        uint32x2_t v214 = *v211;
        uint32x2_t v215 = vcgt_u32(v210, v211[-1]);
        if (v215.i8[0]) {
          *(v212 - 2) = 1;
        }
        if (v215.i8[4]) {
          *(v212 - 1) = 1;
        }
        uint32x2_t v216 = vcgt_u32(v210, v214);
        if (v216.i8[0]) {
          _DWORD *v212 = 1;
        }
        if (v216.i8[4]) {
          v212[1] = 1;
        }
        v211 += 2;
        v212 += 4;
        v213 -= 4;
      }
      while (v213);
      if (v208 == v12) {
        goto LABEL_258;
      }
    }
  }
  size_t v242 = v12 - v208;
  uint64_t v243 = 4 * v208;
  v244 = &v249[v208];
  v245 = (unsigned int *)((char *)v209 + v243);
  do
  {
    unsigned int v246 = *v245++;
    if (v246 < a2) {
      _DWORD *v244 = 1;
    }
    ++v244;
    --v242;
  }
  while (v242);
LABEL_258:
  bzero(v253, v248);
  unsigned int v217 = 0;
  v218 = v273;
  while (1)
  {
    do
    {
      while (1)
      {
        bzero(v218, v12);
        v219 = (unsigned int *)__dst;
        size_t v220 = v12;
        do
        {
          unsigned int v222 = *v219++;
          uint64_t v221 = v222;
          if (v222 < a2) {
            v273[v221] = 1;
          }
          --v220;
        }
        while (v220);
        int v223 = 0;
        uint64_t v224 = 0;
        v218 = v273;
        v225 = v253;
        while (1)
        {
          LODWORD(v226) = __dst->i32[v224];
          if (v226 >= a2) {
            break;
          }
LABEL_265:
          a5[v224++] = v226;
          v223 += v12;
          if (v224 == v271) {
            goto LABEL_295;
          }
        }
        unsigned int v227 = v253[v224];
        uint64_t v228 = v249[v224];
        if (v227 < v228)
        {
          unsigned int v229 = v217 + 1;
          uint64_t v230 = v253[v224];
          do
          {
            uint64_t v226 = *(unsigned int *)(v251 + 4 * (v223 + v230));
            if (!v273[v226])
            {
              v273[v226] = 1;
              v253[v224] = v230;
              unsigned int v217 = v229;
              goto LABEL_265;
            }
            ++v230;
            ++v229;
          }
          while (v228 != v230);
          unsigned int v217 = v217 + v228 - v227;
        }
        if (v224 < a2)
        {
          bzero(&v253[v224], 4 * (~v224 + a2) + 4);
          v225 = v253;
          v218 = v273;
        }
        if (v217 > 0x1F3) {
          break;
        }
        uint64_t v234 = v224;
        v232 = &v253[v224 - 1];
        while (1)
        {
          uint64_t v235 = v234 - 1;
          if ((int)v234 < 1) {
            break;
          }
          unsigned int v233 = *v232 + 1;
          if (v233 < v249[v234 - 1]) {
            goto LABEL_277;
          }
          *v232-- = 0;
          --v234;
          if (!v235) {
            goto LABEL_282;
          }
        }
      }
    }
    while ((int)v224 < 1);
    uint64_t v231 = (v224 - 1);
    v232 = &v225[v231];
    unsigned int v233 = v225[v231] + 1;
    if (v233 >= v249[v231]) {
      break;
    }
LABEL_277:
    unsigned int *v232 = v233;
  }
  unsigned int *v232 = 0;
LABEL_282:
  bzero(v218, v12);
  v236 = a5;
  uint64_t v237 = a2;
  do
  {
    unsigned int v239 = *v236++;
    uint64_t v238 = v239;
    if (v239 < a2) {
      v273[v238] = 1;
    }
    --v237;
  }
  while (v237);
  uint64_t v240 = 0;
  LODWORD(v241) = 0;
  do
  {
    if (a5[v240] >= a2)
    {
      if (v241 < a2)
      {
        uint64_t v241 = v241;
        while (v273[v241])
        {
          if (v12 == ++v241)
          {
            LODWORD(v241) = v12;
            break;
          }
        }
      }
      a5[v240] = v241;
      LODWORD(v241) = v241 + 1;
    }
    ++v240;
  }
  while (v240 != a2);
LABEL_295:
  if (v250) {
    unsigned int *v250 = v217;
  }
}

void *AcVisegNode::AcVisegNode(void *a1, uint64_t a2)
{
  *(_DWORD *)(a2 + _Block_object_dispose(&STACK[0x488], 8) = 0;
  *(void *)a2 = 0xDE7C00000001;
  return a1;
}

{
  bzero(a1, 0x298uLL);
  *(_DWORD *)(a2 + _Block_object_dispose(&STACK[0x488], 8) = 0;
  *(void *)a2 = 0xDE7C00000001;
  return a1;
}

uint64_t AcVisegNode::init(void *a1, uint64_t a2)
{
  *(void *)(a2 + 4) = 0xDE70000DE71;
  return 0;
}

uint64_t AcVisegNode::setRunViSeg(uint64_t this, char a2)
{
  *(unsigned char *)(this + 664) = a2;
  return this;
}

uint64_t AcVisegNode::getParams(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v5 = *(_OWORD *)(a1 + 20);
  *(void *)(a3 + 472) = *(void *)(a1 + 36);
  *(_OWORD *)(a3 + 456) = v5;
  strncpy((char *)(a3 + 1864), (const char *)(a1 + 216), 0x40uLL);
  *(_DWORD *)(a3 + 472) = *(_DWORD *)(a1 + 188);
  long long v6 = *(_OWORD *)(a1 + 44);
  *(void *)(a3 + 496) = *(void *)(a1 + 60);
  *(_OWORD *)(a3 + 480) = v6;
  strncpy((char *)(a3 + 1928), (const char *)(a1 + 280), 0x40uLL);
  *(_DWORD *)(a3 + 496) = *(_DWORD *)(a1 + 192);
  long long v7 = *(_OWORD *)(a1 + 68);
  *(void *)(a3 + 520) = *(void *)(a1 + 84);
  *(_OWORD *)(a3 + 504) = v7;
  strncpy((char *)(a3 + 1992), (const char *)(a1 + 344), 0x40uLL);
  *(_DWORD *)(a3 + 520) = *(_DWORD *)(a1 + 196);
  long long v8 = *(_OWORD *)(a1 + 92);
  *(void *)(a3 + 544) = *(void *)(a1 + 108);
  *(_OWORD *)(a3 + 52_Block_object_dispose(&STACK[0x488], 8) = v8;
  strncpy((char *)(a3 + 2056), (const char *)(a1 + 408), 0x40uLL);
  *(_DWORD *)(a3 + 544) = *(_DWORD *)(a1 + 200);
  long long v9 = *(_OWORD *)(a1 + 116);
  *(void *)(a3 + 56_Block_object_dispose(&STACK[0x488], 8) = *(void *)(a1 + 132);
  *(_OWORD *)(a3 + 552) = v9;
  strncpy((char *)(a3 + 2120), (const char *)(a1 + 472), 0x40uLL);
  *(_DWORD *)(a3 + 56_Block_object_dispose(&STACK[0x488], 8) = *(_DWORD *)(a1 + 204);
  long long v10 = *(_OWORD *)(a1 + 140);
  *(void *)(a3 + 592) = *(void *)(a1 + 156);
  *(_OWORD *)(a3 + 576) = v10;
  strncpy((char *)(a3 + 2184), (const char *)(a1 + 536), 0x40uLL);
  *(_DWORD *)(a3 + 592) = *(_DWORD *)(a1 + 208);
  long long v11 = *(_OWORD *)(a1 + 164);
  *(void *)(a3 + 616) = *(void *)(a1 + 180);
  *(_OWORD *)(a3 + 600) = v11;
  strncpy((char *)(a3 + 2248), (const char *)(a1 + 600), 0x40uLL);
  *(_DWORD *)(a3 + 616) = *(_DWORD *)(a1 + 212);
  return 0;
}

unint64_t acNonMaxSuppression(uint64_t a1, unsigned int a2, _DWORD *a3, int a4, float a5, float a6)
{
  if (!a2) {
    return 0;
  }
  LODWORD(v6) = a4;
  uint64_t v10 = a1;
  bmHeapsort(a1, a2, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  if (a2 >= v6) {
    unint64_t v6 = v6;
  }
  else {
    unint64_t v6 = a2;
  }
  if (v6)
  {
    unint64_t v11 = 0;
    uint64_t v12 = v10 + 32;
    uint64_t v62 = v10;
    int v13 = -2;
    do
    {
      unint64_t v14 = v10 + 32 * v11++;
      *a3 = (int)*(float *)(v14 + 28);
      if (v11 >= v6)
      {
        unint64_t v6 = v11;
        goto LABEL_8;
      }
      int v15 = *(_DWORD *)(v14 + 16);
      unsigned int v16 = (float *)(v14 + 8);
      uint64_t v17 = (float *)(v14 + 12);
      uint64_t v18 = (float *)(v14 + 4);
      int v19 = v6 + v13;
      unsigned int v20 = 1;
      uint64_t v21 = v12;
      int v22 = v15;
      unint64_t v6 = v11;
      while (1)
      {
        if (v22 != *(_DWORD *)(v21 + 16))
        {
LABEL_55:
          uint64_t v47 = v6;
          unint64_t v6 = (v6 + 1);
          long long v48 = *(_OWORD *)(v21 + 16);
          float v49 = (_OWORD *)(v10 + 32 * v47);
          *float v49 = *(_OWORD *)v21;
          v49[1] = v48;
          goto LABEL_56;
        }
        if (v22)
        {
          float v23 = *(float *)(v21 + 4);
          if (*(float *)v14 >= *(float *)v21) {
            float v24 = *(float *)v14;
          }
          else {
            float v24 = *(float *)v21;
          }
          if (*v18 >= v23) {
            float v25 = *v18;
          }
          else {
            float v25 = *(float *)(v21 + 4);
          }
          float v26 = *(float *)(v21 + 8);
          float v27 = *(float *)(v21 + 12);
          if (*v16 >= v26) {
            float v28 = *(float *)(v21 + 8);
          }
          else {
            float v28 = *v16;
          }
          if (*v17 >= v27) {
            float v29 = *(float *)(v21 + 12);
          }
          else {
            float v29 = *v17;
          }
          float v30 = v28 - v24;
          float v31 = 0.0;
          float v32 = fmaxf(v30, 0.0) * fmaxf(v29 - v25, 0.0);
          if (v32 >= 0.00000011921)
          {
            float v33 = (float)((float)(fmaxf(*v16 - *(float *)v14, 0.0) * fmaxf(*v17 - *v18, 0.0))
                        + (float)(fmaxf(v26 - *(float *)v21, 0.0) * fmaxf(v27 - v23, 0.0)))
                - v32;
            if (v33 >= 0.00000011921) {
              float v31 = v32 / v33;
            }
            else {
              float v31 = 0.0;
            }
          }
          if (v31 <= a5) {
            goto LABEL_55;
          }
        }
        else
        {
          float v34 = *v16;
          float v35 = *v17;
          float v36 = fmaxf(*v16 - *(float *)v14, 0.0) * fmaxf(*v17 - *v18, 0.0);
          float v37 = *(float *)(v21 + 4);
          if (*(float *)v14 >= *(float *)v21) {
            float v38 = *(float *)v14;
          }
          else {
            float v38 = *(float *)v21;
          }
          if (*v18 >= v37) {
            float v39 = *v18;
          }
          else {
            float v39 = *(float *)(v21 + 4);
          }
          float v40 = *(float *)(v21 + 8);
          float v41 = *(float *)(v21 + 12);
          if (v34 >= v40) {
            float v34 = *(float *)(v21 + 8);
          }
          if (v35 >= v41) {
            float v35 = *(float *)(v21 + 12);
          }
          float v42 = fmaxf(v34 - v38, 0.0) * fmaxf(v35 - v39, 0.0);
          BOOL v43 = v42 < 0.00000011921 || v36 < 0.00000011921;
          float v44 = v42 / v36;
          if (v43) {
            float v44 = 0.0;
          }
          if (v44 <= a6)
          {
            float v45 = 0.0;
            if (v42 >= 0.00000011921)
            {
              float v46 = (float)(v36 + (float)(fmaxf(v40 - *(float *)v21, 0.0) * fmaxf(v41 - v37, 0.0))) - v42;
              if (v46 >= 0.00000011921) {
                float v45 = v42 / v46;
              }
              else {
                float v45 = 0.0;
              }
            }
            if (v45 <= a5) {
              goto LABEL_55;
            }
          }
        }
        if (!v15 && *(float *)(v21 + 24) > 0.57) {
          a3[v20++] = (int)*(float *)(v21 + 28);
        }
LABEL_56:
        if (!v19) {
          break;
        }
        int v22 = *(_DWORD *)(v14 + 16);
        --v19;
        v21 += 32;
      }
      if (!v15 && v20 >= 2)
      {
        uint64_t v63 = (float *)(v14 + 28);
        int v64 = v13;
        unint64_t v65 = v11;
        uint64_t v66 = v12;
        uint64_t v50 = 0;
        uint64_t v51 = v20 - 1;
        unint64_t v68 = v20;
        float v52 = -3.4028e38;
        BOOL v53 = a3 + 1;
        unsigned int v54 = v20 - 1;
        do
        {
          uint64_t v55 = v50 + 1;
          if (v50 + 1 < v68)
          {
            int v56 = a3[v50];
            BOOL v57 = v53;
            unsigned int v58 = v54;
            do
            {
              int v59 = *v57++;
              float v60 = sinf((float)((float)(int)fabs((double)(v56 - v59)) * 3.1416) / 360.0);
              if (v52 <= v60) {
                float v52 = v60;
              }
              --v58;
            }
            while (v58);
          }
          --v54;
          ++v53;
          uint64_t v50 = v55;
        }
        while (v55 != v51);
        uint64_t v10 = v62;
        unint64_t v11 = v65;
        uint64_t v12 = v66;
        int v13 = v64;
        if (v52 > 0.22) {
          *uint64_t v63 = *v63 + 1080.0;
        }
      }
LABEL_8:
      --v13;
      v12 += 32;
    }
    while (v11 < v6);
  }
  return v6;
}

unint64_t acNonMaxSuppressionAnimalHead(uint64_t a1, unint64_t a2, float a3)
{
  unint64_t v3 = a2;
  if (a2)
  {
    bmHeapsort(a1, a2, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
    unint64_t v6 = 0;
    long long v7 = (float32x2_t *)(a1 + 32);
    int v8 = -1;
    do
    {
      unint64_t v9 = v6 + 1;
      if (v6 + 1 >= v3)
      {
        unint64_t v3 = v6 + 1;
      }
      else
      {
        uint64_t v10 = (float32x2_t *)(a1 + 32 * v6);
        unint64_t v11 = v10 + 1;
        int v12 = v3 + v8;
        int v13 = v7;
        unint64_t v3 = v9;
        do
        {
          __int32 v17 = v10[2].i32[0];
          if (v17 != v13[2].i32[0]) {
            goto LABEL_7;
          }
          if ((v17 & 0xFFFFFFFE) == 8)
          {
            float32x2_t v18 = vmaxnm_f32(vsub_f32(*v11, *v10), 0);
            float32x2_t v19 = vmul_lane_f32(v18, v18, 1);
            float32x2_t v20 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v13[1], *v11), (int8x8_t)*v11, (int8x8_t)v13[1]), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v13, *v10), (int8x8_t)*v13, (int8x8_t)*v10)), 0);
            float32x2_t v21 = vmul_lane_f32(v20, v20, 1);
            BOOL v22 = v21.f32[0] < 0.00000011921 || v19.f32[0] < 0.00000011921;
            LODWORD(v23) = vdiv_f32(v21, v19).u32[0];
            if (v22) {
              float v23 = 0.0;
            }
            if (v23 <= a3)
            {
LABEL_7:
              uint64_t v14 = v3;
              unint64_t v3 = (v3 + 1);
              long long v15 = *(_OWORD *)v13[2].f32;
              unsigned int v16 = (_OWORD *)(a1 + 32 * v14);
              _OWORD *v16 = *(_OWORD *)v13->f32;
              v16[1] = v15;
            }
          }
          v13 += 4;
          --v12;
        }
        while (v12);
      }
      v7 += 4;
      --v8;
      unint64_t v6 = v9;
    }
    while (v9 < v3);
  }
  return v3;
}

unint64_t acNonMaxSuppressionHead(uint64_t a1, unint64_t a2, float a3)
{
  unint64_t v3 = a2;
  if (a2)
  {
    bmHeapsort(a1, a2, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
    unint64_t v6 = 0;
    long long v7 = (float32x2_t *)(a1 + 32);
    int v8 = -1;
    do
    {
      unint64_t v9 = v6 + 1;
      if (v6 + 1 >= v3)
      {
        unint64_t v3 = v6 + 1;
      }
      else
      {
        uint64_t v10 = (float32x2_t *)(a1 + 32 * v6);
        unint64_t v11 = v10 + 1;
        int v12 = v3 + v8;
        int v13 = v7;
        unint64_t v3 = v9;
        do
        {
          unsigned int v17 = v10[2].u32[0];
          if (v17 == v13[2].i32[0])
          {
            BOOL v18 = v17 > 9;
            int v19 = (1 << v17) & 0x302;
            if (v18 || v19 == 0) {
              goto LABEL_7;
            }
          }
          float32x2_t v21 = vmaxnm_f32(vsub_f32(*v11, *v10), 0);
          float32x2_t v22 = vmul_lane_f32(v21, v21, 1);
          float32x2_t v23 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v13[1], *v11), (int8x8_t)*v11, (int8x8_t)v13[1]), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v13, *v10), (int8x8_t)*v13, (int8x8_t)*v10)), 0);
          float32x2_t v24 = vmul_lane_f32(v23, v23, 1);
          BOOL v25 = v24.f32[0] < 0.00000011921 || v22.f32[0] < 0.00000011921;
          LODWORD(v26) = vdiv_f32(v24, v22).u32[0];
          if (v25) {
            float v26 = 0.0;
          }
          if (v26 <= a3)
          {
LABEL_7:
            uint64_t v14 = v3;
            unint64_t v3 = (v3 + 1);
            long long v15 = *(_OWORD *)v13[2].f32;
            unsigned int v16 = (_OWORD *)(a1 + 32 * v14);
            _OWORD *v16 = *(_OWORD *)v13->f32;
            v16[1] = v15;
          }
          v13 += 4;
          --v12;
        }
        while (v12);
      }
      v7 += 4;
      --v8;
      unint64_t v6 = v9;
    }
    while (v9 < v3);
  }
  return v3;
}

unint64_t acNonMaxSuppressionSmallBox(uint64_t a1, unint64_t a2, float a3)
{
  unint64_t v3 = a2;
  if (a2)
  {
    bmHeapsort(a1, a2, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
    unint64_t v6 = 0;
    long long v7 = (float *)(a1 + 48);
    int v8 = -1;
    do
    {
      unint64_t v9 = v6 + 1;
      if (v6 + 1 >= v3)
      {
        unint64_t v3 = v6 + 1;
      }
      else
      {
        uint64_t v10 = a1 + 32 * v6;
        unint64_t v11 = (float *)(v10 + 8);
        int v12 = (float *)(v10 + 12);
        int v13 = (float *)(v10 + 4);
        int v14 = v3 + v8;
        long long v15 = v7;
        unint64_t v3 = v9;
        do
        {
          if (*(_DWORD *)(v10 + 16) != *(_DWORD *)v15) {
            goto LABEL_7;
          }
          float v19 = *(v15 - 4);
          float v20 = *(v15 - 3);
          if (*(float *)v10 >= v19) {
            float v21 = *(float *)v10;
          }
          else {
            float v21 = *(v15 - 4);
          }
          if (*v13 >= v20) {
            float v22 = *v13;
          }
          else {
            float v22 = *(v15 - 3);
          }
          float v23 = *(v15 - 2);
          float v24 = *(v15 - 1);
          if (*v11 >= v23) {
            float v25 = *(v15 - 2);
          }
          else {
            float v25 = *v11;
          }
          if (*v12 >= v24) {
            float v26 = *(v15 - 1);
          }
          else {
            float v26 = *v12;
          }
          float v27 = v25 - v21;
          float v28 = 0.0;
          float v29 = fmaxf(v27, 0.0) * fmaxf(v26 - v22, 0.0);
          if (v29 >= 0.00000011921)
          {
            float v30 = fmaxf(v23 - v19, 0.0) * fmaxf(v24 - v20, 0.0);
            float v31 = fmaxf(*v11 - *(float *)v10, 0.0) * fmaxf(*v12 - *v13, 0.0);
            if (v31 >= v30) {
              float v31 = v30;
            }
            if (v31 >= 0.00000011921) {
              float v28 = v29 / v31;
            }
            else {
              float v28 = 0.0;
            }
          }
          if (v28 <= a3)
          {
LABEL_7:
            uint64_t v16 = v3;
            unint64_t v3 = (v3 + 1);
            long long v17 = *(_OWORD *)v15;
            BOOL v18 = (_OWORD *)(a1 + 32 * v16);
            _OWORD *v18 = *((_OWORD *)v15 - 1);
            v18[1] = v17;
          }
          v15 += 8;
          --v14;
        }
        while (v14);
      }
      v7 += 8;
      --v8;
      unint64_t v6 = v9;
    }
    while (v9 < v3);
  }
  return v3;
}

unint64_t acNonMaxSuppressionFirstBox(uint64_t a1, unint64_t a2, float a3)
{
  unint64_t v3 = a2;
  if (a2)
  {
    bmHeapsort(a1, a2, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
    unint64_t v6 = 0;
    long long v7 = (float32x2_t *)(a1 + 32);
    int v8 = -1;
    do
    {
      unint64_t v9 = v6 + 1;
      if (v6 + 1 >= v3)
      {
        unint64_t v3 = v6 + 1;
      }
      else
      {
        uint64_t v10 = (float32x2_t *)(a1 + 32 * v6);
        unint64_t v11 = v10 + 1;
        int v12 = v3 + v8;
        int v13 = v7;
        unint64_t v3 = v9;
        do
        {
          if (v10[2].i32[0] != v13[2].i32[0]) {
            goto LABEL_7;
          }
          float32x2_t v17 = vmaxnm_f32(vsub_f32(*v11, *v10), 0);
          float32x2_t v18 = vmul_lane_f32(v17, v17, 1);
          float32x2_t v19 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v13[1], *v11), (int8x8_t)*v11, (int8x8_t)v13[1]), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v13, *v10), (int8x8_t)*v13, (int8x8_t)*v10)), 0);
          float32x2_t v20 = vmul_lane_f32(v19, v19, 1);
          BOOL v21 = v20.f32[0] < 0.00000011921 || v18.f32[0] < 0.00000011921;
          LODWORD(v22) = vdiv_f32(v20, v18).u32[0];
          if (v21) {
            float v22 = 0.0;
          }
          if (v22 <= a3)
          {
LABEL_7:
            uint64_t v14 = v3;
            unint64_t v3 = (v3 + 1);
            long long v15 = *(_OWORD *)v13[2].f32;
            uint64_t v16 = (_OWORD *)(a1 + 32 * v14);
            _OWORD *v16 = *(_OWORD *)v13->f32;
            v16[1] = v15;
          }
          v13 += 4;
          --v12;
        }
        while (v12);
      }
      v7 += 4;
      --v8;
      unint64_t v6 = v9;
    }
    while (v9 < v3);
  }
  return v3;
}

uint64_t acRemoveOverlapBoxes(_OWORD *a1, unsigned int a2, unsigned __int8 *a3, float a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v4 = a3;
  unint64_t v7 = a2;
  bzero(a3, a2);
  uint64_t v8 = 0;
  unint64_t v9 = (float *)(a1 + 2);
  uint64_t v10 = 1;
  do
  {
    uint64_t v11 = v8 + 1;
    if (v8 + 1 < v7)
    {
      int v12 = (float *)&a1[2 * v8];
      int v13 = v12 + 2;
      uint64_t v14 = v12 + 3;
      long long v15 = v12 + 1;
      uint64_t v16 = v9;
      uint64_t v17 = v10;
      do
      {
        float v18 = v16[1];
        if (*v12 >= *v16) {
          float v19 = *v12;
        }
        else {
          float v19 = *v16;
        }
        if (*v15 >= v18) {
          float v20 = *v15;
        }
        else {
          float v20 = v16[1];
        }
        float v21 = v16[2];
        float v22 = v16[3];
        if (*v13 >= v21) {
          float v23 = v16[2];
        }
        else {
          float v23 = *v13;
        }
        if (*v14 >= v22) {
          float v24 = v16[3];
        }
        else {
          float v24 = *v14;
        }
        float v25 = v23 - v19;
        float v26 = 0.0;
        float v27 = fmaxf(v25, 0.0) * fmaxf(v24 - v20, 0.0);
        if (v27 >= 0.00000011921)
        {
          float v28 = (float)((float)(fmaxf(*v13 - *v12, 0.0) * fmaxf(*v14 - *v15, 0.0))
                      + (float)(fmaxf(v21 - *v16, 0.0) * fmaxf(v22 - v18, 0.0)))
              - v27;
          if (v28 >= 0.00000011921) {
            float v26 = v27 / v28;
          }
          else {
            float v26 = 0.0;
          }
        }
        if (v26 > a4)
        {
          if (v12[6] <= v16[6]) {
            uint64_t v29 = v8;
          }
          else {
            uint64_t v29 = v17;
          }
          v4[v29] = 1;
        }
        ++v17;
        v16 += 8;
      }
      while (v7 != v17);
    }
    ++v10;
    v9 += 8;
    ++v8;
  }
  while (v11 != v7);
  uint64_t result = 0;
  float v31 = a1;
  do
  {
    if (!*v4++)
    {
      long long v33 = v31[1];
      float v34 = &a1[2 * result];
      *float v34 = *v31;
      v34[1] = v33;
      uint64_t result = (result + 1);
    }
    v31 += 2;
    --v7;
  }
  while (v7);
  return result;
}

uint64_t acRemoveHeadOverlapBoxes(_OWORD *a1, unsigned int a2, unsigned __int8 *a3, float a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v4 = a3;
  unint64_t v7 = a2;
  bzero(a3, a2);
  uint64_t v8 = 0;
  unint64_t v9 = (float *)a1 + 14;
  uint64_t v10 = 1;
  do
  {
    uint64_t v11 = v8 + 1;
    if (v8 + 1 < v7)
    {
      int v12 = (float32x2_t *)&a1[2 * v8];
      int v13 = v12 + 1;
      uint64_t v14 = v9;
      uint64_t v15 = v10;
      do
      {
        unsigned int v16 = v12[2].u32[0];
        BOOL v17 = v16 != *((_DWORD *)v14 - 2) || v16 > 9;
        int v18 = (1 << v16) & 0x302;
        if (!v17 && v18 != 0)
        {
          float32x2_t v20 = vmaxnm_f32(vsub_f32(*v13, *v12), 0);
          float32x2_t v21 = vmul_lane_f32(v20, v20, 1);
          float32x2_t v22 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)(v14 - 4), *v13), (int8x8_t)*v13, *(int8x8_t *)(v14 - 4)), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)(v14 - 6), *v12), *(int8x8_t *)(v14 - 6), (int8x8_t)*v12)), 0);
          float32x2_t v23 = vmul_lane_f32(v22, v22, 1);
          BOOL v24 = v23.f32[0] < 0.00000011921 || v21.f32[0] < 0.00000011921;
          LODWORD(v25) = vdiv_f32(v23, v21).u32[0];
          if (v24) {
            float v25 = 0.0;
          }
          if (v25 > a4)
          {
            if (v12[3].f32[0] <= *v14) {
              uint64_t v26 = v8;
            }
            else {
              uint64_t v26 = v15;
            }
            v4[v26] = 1;
          }
        }
        ++v15;
        v14 += 8;
      }
      while (v7 != v15);
    }
    ++v10;
    v9 += 8;
    ++v8;
  }
  while (v11 != v7);
  uint64_t result = 0;
  float v28 = a1;
  do
  {
    if (!*v4++)
    {
      long long v30 = v28[1];
      float v31 = &a1[2 * result];
      *float v31 = *v28;
      v31[1] = v30;
      uint64_t result = (result + 1);
    }
    v28 += 2;
    --v7;
  }
  while (v7);
  return result;
}

BOOL acCheckOverlapBox(uint64_t a1, unsigned int a2, uint64_t a3, float a4, float a5)
{
  if (a2)
  {
    uint64_t v5 = 0;
    uint64_t v6 = a1 + 8;
    BOOL v7 = 1;
    while (1)
    {
      if (*(_DWORD *)(v6 + 8))
      {
        float v8 = *(float *)(v6 - 8);
        float v9 = *(float *)a3;
        float v10 = *(float *)(a3 + 4);
        float v11 = *(float *)(a3 + 8);
        float v12 = *(float *)(a3 + 12);
      }
      else
      {
        float v8 = *(float *)(v6 - 8);
        float v9 = *(float *)a3;
        float v10 = *(float *)(a3 + 4);
        float v11 = *(float *)(a3 + 8);
        float v12 = *(float *)(a3 + 12);
        if (!*(_DWORD *)(a3 + 16))
        {
          if (v8 >= v9) {
            float v13 = *(float *)(v6 - 8);
          }
          else {
            float v13 = *(float *)a3;
          }
          float v14 = *(float *)(v6 - 4);
          float v15 = *(float *)v6;
          if (v14 >= v10) {
            float v16 = *(float *)(v6 - 4);
          }
          else {
            float v16 = *(float *)(a3 + 4);
          }
          float v17 = *(float *)(v6 + 4);
          if (v15 >= v11) {
            float v18 = *(float *)(a3 + 8);
          }
          else {
            float v18 = *(float *)v6;
          }
          if (v17 >= v12) {
            float v19 = *(float *)(a3 + 12);
          }
          else {
            float v19 = *(float *)(v6 + 4);
          }
          float v20 = v18 - v13;
          float v21 = 0.0;
          float v22 = fmaxf(v20, 0.0) * fmaxf(v19 - v16, 0.0);
          if (v22 >= 0.00000011921)
          {
            float v23 = fmaxf(v12 - v10, 0.0);
            float v24 = fmaxf(v11 - v9, 0.0);
            float v25 = fmaxf(v15 - v8, 0.0) * fmaxf(v17 - v14, 0.0);
            if (v25 >= (float)(v24 * v23)) {
              float v25 = v24 * v23;
            }
            if (v25 >= 0.00000011921) {
              float v21 = v22 / v25;
            }
            else {
              float v21 = 0.0;
            }
          }
          if (v21 > a4) {
            return v7;
          }
        }
      }
      if (v8 >= v9) {
        float v26 = v8;
      }
      else {
        float v26 = v9;
      }
      float v27 = *(float *)(v6 - 4);
      float v28 = *(float *)v6;
      if (v27 >= v10) {
        float v29 = *(float *)(v6 - 4);
      }
      else {
        float v29 = v10;
      }
      float v30 = *(float *)(v6 + 4);
      if (v28 >= v11) {
        float v31 = v11;
      }
      else {
        float v31 = *(float *)v6;
      }
      if (v30 >= v12) {
        float v32 = v12;
      }
      else {
        float v32 = *(float *)(v6 + 4);
      }
      float v33 = v31 - v26;
      float v34 = 0.0;
      float v35 = fmaxf(v33, 0.0) * fmaxf(v32 - v29, 0.0);
      if (v35 >= 0.00000011921)
      {
        float v36 = (float)((float)(fmaxf(v28 - v8, 0.0) * fmaxf(v30 - v27, 0.0))
                    + (float)(fmaxf(v11 - v9, 0.0) * fmaxf(v12 - v10, 0.0)))
            - v35;
        if (v36 >= 0.00000011921) {
          float v34 = v35 / v36;
        }
        else {
          float v34 = 0.0;
        }
      }
      if (v34 <= a5)
      {
        BOOL v7 = ++v5 < (unint64_t)a2;
        v6 += 32;
        if (a2 != v5) {
          continue;
        }
      }
      return v7;
    }
  }
  return 0;
}

BOOL acCheckHeadOverlapFace(float32x2_t *a1, unsigned int a2, float32x2_t *a3, float a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v4 = 0;
  uint64_t v5 = a1 + 1;
  BOOL v6 = 1;
  do
  {
    float32x2_t v7 = v5[-1];
    float32x2_t v8 = vmaxnm_f32(vsub_f32(*v5, v7), 0);
    float32x2_t v9 = vmul_lane_f32(v8, v8, 1);
    float32x2_t v10 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(a3[1], *v5), (int8x8_t)*v5, (int8x8_t)a3[1]), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*a3, v7), (int8x8_t)*a3, (int8x8_t)v7)), 0);
    float32x2_t v11 = vmul_lane_f32(v10, v10, 1);
    BOOL v12 = v11.f32[0] < 0.00000011921 || v9.f32[0] < 0.00000011921;
    LODWORD(v13) = vdiv_f32(v11, v9).u32[0];
    if (v12) {
      float v13 = 0.0;
    }
    if (v13 > a4) {
      break;
    }
    BOOL v6 = ++v4 < (unint64_t)a2;
    v5 += 4;
  }
  while (a2 != v4);
  return v6;
}

BOOL acCheckOverlapBoxNormal(uint64_t a1, unsigned int a2, float *a3, float a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v4 = 0;
  float v5 = a3[1];
  float v6 = a3[2];
  float v7 = a3[3];
  float v8 = fmaxf(v6 - *a3, 0.0) * fmaxf(v7 - v5, 0.0);
  float32x2_t v9 = (float *)(a1 + 8);
  BOOL v10 = 1;
  do
  {
    float v11 = *(v9 - 2);
    float v12 = *(v9 - 1);
    if (v11 >= *a3) {
      float v13 = *(v9 - 2);
    }
    else {
      float v13 = *a3;
    }
    if (v12 >= v5) {
      float v14 = *(v9 - 1);
    }
    else {
      float v14 = a3[1];
    }
    float v15 = v9[1];
    if (*v9 >= v6) {
      float v16 = a3[2];
    }
    else {
      float v16 = *v9;
    }
    if (v15 >= v7) {
      float v17 = a3[3];
    }
    else {
      float v17 = v9[1];
    }
    float v18 = fmaxf(v16 - v13, 0.0) * fmaxf(v17 - v14, 0.0);
    float v19 = 0.0;
    if (v18 >= 0.00000011921)
    {
      float v20 = (float)((float)(fmaxf(*v9 - v11, 0.0) * fmaxf(v15 - v12, 0.0)) + v8) - v18;
      if (v20 >= 0.00000011921) {
        float v19 = v18 / v20;
      }
      else {
        float v19 = 0.0;
      }
    }
    if (v19 > a4) {
      break;
    }
    BOOL v10 = ++v4 < (unint64_t)a2;
    v9 += 8;
  }
  while (a2 != v4);
  return v10;
}

uint64_t acNMSFaceHead(float32x2_t *a1, unsigned int a2, long long *a3, unsigned int *a4, float a5)
{
  uint64_t v5 = *a4;
  *a4 = 0;
  if (v5)
  {
    if (a2)
    {
      unsigned int v6 = 0;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v8 = 0;
        float32x2_t v9 = (float32x2_t *)&a3[2 * i];
        BOOL v10 = 1;
        float v11 = a1 + 1;
        do
        {
          float32x2_t v12 = v11[-1];
          float32x2_t v13 = vmaxnm_f32(vsub_f32(*v11, v12), 0);
          float32x2_t v14 = vmul_lane_f32(v13, v13, 1);
          float32x2_t v15 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v9[1], *v11), (int8x8_t)*v11, (int8x8_t)v9[1]), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v9, v12), (int8x8_t)*v9, (int8x8_t)v12)), 0);
          float32x2_t v16 = vmul_lane_f32(v15, v15, 1);
          BOOL v17 = v16.f32[0] < 0.00000011921 || v14.f32[0] < 0.00000011921;
          LODWORD(v1_Block_object_dispose(&STACK[0x488], 8) = vdiv_f32(v16, v14).u32[0];
          if (v17) {
            float v18 = 0.0;
          }
          if (v18 > a5) {
            break;
          }
          BOOL v10 = ++v8 < (unint64_t)a2;
          v11 += 4;
        }
        while (a2 != v8);
        if (!v10)
        {
          float v19 = &a3[2 * v6];
          long long v20 = *(_OWORD *)v9[2].f32;
          *float v19 = *(_OWORD *)v9->f32;
          v19[1] = v20;
          unsigned int v6 = *a4 + 1;
          *a4 = v6;
        }
      }
    }
    else
    {
      unsigned int v21 = 0;
      float v22 = a3;
      do
      {
        float v23 = &a3[2 * v21];
        long long v24 = *v22;
        long long v25 = v22[1];
        v22 += 2;
        *float v23 = v24;
        v23[1] = v25;
        unsigned int v21 = *a4 + 1;
        *a4 = v21;
        --v5;
      }
      while (v5);
    }
  }
  return 1;
}

uint64_t acClassASuppressB(float32x2_t *a1, unsigned int a2, long long *a3, unsigned int *a4, float a5)
{
  uint64_t v5 = *a4;
  *a4 = 0;
  if (v5)
  {
    if (a2)
    {
      unsigned int v6 = 0;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v8 = 0;
        float32x2_t v9 = (float32x2_t *)&a3[2 * i];
        BOOL v10 = 1;
        float v11 = a1 + 1;
        do
        {
          float32x2_t v12 = v11[-1];
          float32x2_t v13 = vmaxnm_f32(vsub_f32(*v11, v12), 0);
          float32x2_t v14 = vmul_lane_f32(v13, v13, 1);
          float32x2_t v15 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v9[1], *v11), (int8x8_t)*v11, (int8x8_t)v9[1]), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v9, v12), (int8x8_t)*v9, (int8x8_t)v12)), 0);
          float32x2_t v16 = vmul_lane_f32(v15, v15, 1);
          BOOL v17 = v16.f32[0] < 0.00000011921 || v14.f32[0] < 0.00000011921;
          LODWORD(v1_Block_object_dispose(&STACK[0x488], 8) = vdiv_f32(v16, v14).u32[0];
          if (v17) {
            float v18 = 0.0;
          }
          if (v18 > a5) {
            break;
          }
          BOOL v10 = ++v8 < (unint64_t)a2;
          v11 += 4;
        }
        while (a2 != v8);
        if (!v10)
        {
          float v19 = &a3[2 * v6];
          long long v20 = *(_OWORD *)v9[2].f32;
          *float v19 = *(_OWORD *)v9->f32;
          v19[1] = v20;
          unsigned int v6 = *a4 + 1;
          *a4 = v6;
        }
      }
    }
    else
    {
      unsigned int v21 = 0;
      float v22 = a3;
      do
      {
        float v23 = &a3[2 * v21];
        long long v24 = *v22;
        long long v25 = v22[1];
        v22 += 2;
        *float v23 = v24;
        v23[1] = v25;
        unsigned int v21 = *a4 + 1;
        *a4 = v21;
        --v5;
      }
      while (v5);
    }
  }
  return 1;
}

unint64_t acNonMaxSuppressionHand(uint64_t a1, unint64_t a2, float a3, float a4)
{
  unint64_t v4 = a2;
  if (a2)
  {
    bmHeapsort(a1, a2, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
    unint64_t v8 = 0;
    float32x2_t v9 = (float *)(a1 + 48);
    for (int i = -1; ; --i)
    {
      unint64_t v11 = v8 + 1;
      if (v8 + 1 < v4) {
        break;
      }
      unint64_t v4 = v8 + 1;
LABEL_4:
      v9 += 8;
      unint64_t v8 = v11;
      if (v11 >= v4) {
        return v4;
      }
    }
    uint64_t v12 = a1 + 32 * v8;
    float32x2_t v13 = (float *)(v12 + 8);
    float32x2_t v14 = (float *)(v12 + 12);
    float32x2_t v15 = (float *)(v12 + 4);
    int v16 = v4 + i;
    BOOL v17 = v9;
    unint64_t v4 = v11;
    while (1)
    {
      if (*(_DWORD *)(v12 + 16) == *(_DWORD *)v17)
      {
        float v21 = *(v17 - 4);
        float v22 = *(v17 - 3);
        if (*(float *)v12 >= v21) {
          float v23 = *(float *)v12;
        }
        else {
          float v23 = *(v17 - 4);
        }
        if (*v15 >= v22) {
          float v24 = *v15;
        }
        else {
          float v24 = *(v17 - 3);
        }
        float v25 = *(v17 - 2);
        float v26 = *(v17 - 1);
        if (*v13 >= v25) {
          float v27 = *(v17 - 2);
        }
        else {
          float v27 = *v13;
        }
        if (*v14 >= v26) {
          float v28 = *(v17 - 1);
        }
        else {
          float v28 = *v14;
        }
        float v29 = fmaxf(v27 - v23, 0.0) * fmaxf(v28 - v24, 0.0);
        if (v29 >= 0.00000011921)
        {
          float v30 = fmaxf(v25 - v21, 0.0) * fmaxf(v26 - v22, 0.0);
          float v31 = fmaxf(*v13 - *(float *)v12, 0.0) * fmaxf(*v14 - *v15, 0.0);
          float v32 = (float)(v31 + v30) - v29;
          if (v32 >= 0.00000011921) {
            float v33 = v29 / v32;
          }
          else {
            float v33 = 0.0;
          }
          if (v33 > a3) {
            goto LABEL_8;
          }
          if (v31 < v30) {
            float v30 = v31;
          }
          float v34 = v30 >= 0.00000011921 ? v29 / v30 : 0.0;
          if (v34 > a4) {
            goto LABEL_8;
          }
        }
        else if (a3 < 0.0 || a4 < 0.0)
        {
          goto LABEL_8;
        }
      }
      uint64_t v18 = v4;
      unint64_t v4 = (v4 + 1);
      long long v19 = *(_OWORD *)v17;
      long long v20 = (_OWORD *)(a1 + 32 * v18);
      *long long v20 = *((_OWORD *)v17 - 1);
      v20[1] = v19;
LABEL_8:
      v17 += 8;
      if (!--v16) {
        goto LABEL_4;
      }
    }
  }
  return v4;
}

unint64_t acNonMaxSuppressionHandIntra(uint64_t a1, unint64_t a2, char a3, _OWORD *a4, int a5, int a6, float a7, float a8, float a9)
{
  unint64_t v9 = a2;
  if (a2)
  {
    bmHeapsort(a1, a2, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
    uint64_t v18 = 0;
    if (a3)
    {
      unint64_t v19 = 0;
      for (int i = -1; ; --i)
      {
        unint64_t v21 = v19 + 1;
        if (v19 + 1 >= v9)
        {
          unint64_t v9 = v19 + 1;
          goto LABEL_5;
        }
        unsigned int v22 = 0;
        uint64_t v23 = a1 + 32 * v19;
        float v24 = (float *)(v23 + 8);
        float v25 = (float *)(v23 + 12);
        float v26 = (float *)(v23 + 4);
        int v27 = v9 + i;
        uint64_t v28 = v18;
        unint64_t v9 = v21;
        do
        {
          float v34 = (float *)(a1 + v28);
          float v35 = (float *)(a1 + v28 + 32);
          if (*(_DWORD *)(v23 + 16) != *(_DWORD *)(a1 + v28 + 48))
          {
LABEL_8:
            unsigned int v29 = v9;
            unint64_t v9 = (v9 + 1);
            float v30 = (_OWORD *)a1;
            goto LABEL_9;
          }
          if (*(float *)v23 >= *v35) {
            float v36 = *(float *)v23;
          }
          else {
            float v36 = *v35;
          }
          float v37 = v34[9];
          float v38 = v34[10];
          if (*v26 >= v37) {
            float v39 = *v26;
          }
          else {
            float v39 = v34[9];
          }
          if (*v24 >= v38) {
            float v40 = v34[10];
          }
          else {
            float v40 = *v24;
          }
          float v41 = v34[11];
          if (*v25 >= v41) {
            float v42 = v34[11];
          }
          else {
            float v42 = *v25;
          }
          float v43 = fmaxf(v40 - v36, 0.0) * fmaxf(v42 - v39, 0.0);
          if (v43 >= 0.00000011921)
          {
            float v44 = fmaxf(v38 - *v35, 0.0) * fmaxf(v41 - v37, 0.0);
            float v45 = fmaxf(*v24 - *(float *)v23, 0.0) * fmaxf(*v25 - *v26, 0.0);
            float v46 = (float)(v45 + v44) - v43;
            if (v46 >= 0.00000011921) {
              float v47 = v43 / v46;
            }
            else {
              float v47 = 0.0;
            }
            if (v47 <= a7)
            {
              if (v45 < v44) {
                float v44 = v45;
              }
              float v48 = v43 / v44;
              float v49 = v44 >= 0.00000011921 ? v48 : 0.0;
              if (v49 <= a8) {
                goto LABEL_8;
              }
            }
          }
          else if (a7 >= 0.0 && a8 >= 0.0)
          {
            goto LABEL_8;
          }
          unsigned int v29 = v22++;
          float v30 = a4;
LABEL_9:
          long long v31 = *(_OWORD *)v35;
          long long v32 = *(_OWORD *)(a1 + v28 + 48);
          float v33 = &v30[2 * v29];
          *float v33 = v31;
          v33[1] = v32;
          v28 += 32;
          --v27;
        }
        while (v27);
        if (v22 >= 2
          && (float)((float)((float)(*v24 - *(float *)v23) * (float)(*v25 - *v26)) / (float)(a6 * a5)) < a9)
        {
          float32x4_t v50 = *(float32x4_t *)a4;
          uint64_t v51 = v22 - 1;
          float v52 = (float32x4_t *)(a4 + 2);
          do
          {
            float32x4_t v53 = *v52;
            v52 += 2;
            v54.i64[0] = v53.i64[0];
            v55.i64[0] = v50.i64[0];
            v55.i64[1] = v53.i64[1];
            v54.i64[1] = v50.i64[1];
            float32x4_t v50 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v53, v50), v55, v54);
            --v51;
          }
          while (v51);
          *(float32x4_t *)uint64_t v23 = v50;
        }
LABEL_5:
        v18 += 32;
        unint64_t v19 = v21;
        if (v21 >= v9) {
          return v9;
        }
      }
    }
    unint64_t v56 = 0;
    for (int j = -1; ; --j)
    {
      unint64_t v58 = v56 + 1;
      if (v56 + 1 < v9) {
        break;
      }
      unint64_t v9 = v56 + 1;
LABEL_45:
      v18 += 32;
      unint64_t v56 = v58;
      if (v58 >= v9) {
        return v9;
      }
    }
    unsigned int v59 = 0;
    uint64_t v60 = a1 + 32 * v56;
    float v61 = (float *)(v60 + 8);
    uint64_t v62 = (float *)(v60 + 12);
    uint64_t v63 = (float *)(v60 + 4);
    int v64 = v9 + j;
    uint64_t v65 = v18;
    unint64_t v9 = v58;
    while (1)
    {
      int v71 = (float *)(a1 + v65);
      uint64_t v72 = (float *)(a1 + v65 + 32);
      if (*(_DWORD *)(v60 + 16) == *(_DWORD *)(a1 + v65 + 48))
      {
        if (*(float *)v60 >= *v72) {
          float v73 = *(float *)v60;
        }
        else {
          float v73 = *v72;
        }
        float v74 = v71[9];
        float v75 = v71[10];
        if (*v63 >= v74) {
          float v76 = *v63;
        }
        else {
          float v76 = v71[9];
        }
        if (*v61 >= v75) {
          float v77 = v71[10];
        }
        else {
          float v77 = *v61;
        }
        float v78 = v71[11];
        if (*v62 >= v78) {
          float v79 = v71[11];
        }
        else {
          float v79 = *v62;
        }
        float v80 = fmaxf(v77 - v73, 0.0) * fmaxf(v79 - v76, 0.0);
        if (v80 >= 0.00000011921)
        {
          float v81 = fmaxf(v75 - *v72, 0.0) * fmaxf(v78 - v74, 0.0);
          float v82 = fmaxf(*v61 - *(float *)v60, 0.0) * fmaxf(*v62 - *v63, 0.0);
          float v83 = (float)(v82 + v81) - v80;
          if (v83 >= 0.00000011921) {
            float v84 = v80 / v83;
          }
          else {
            float v84 = 0.0;
          }
          if (v84 > a7) {
            goto LABEL_77;
          }
          if (v82 < v81) {
            float v81 = v82;
          }
          float v85 = v80 / v81;
          float v86 = v81 >= 0.00000011921 ? v85 : 0.0;
          if (v86 > a8)
          {
LABEL_77:
            unsigned int v66 = v59++;
            int8x16_t v67 = a4;
            goto LABEL_49;
          }
        }
        else if (a7 < 0.0 || a8 < 0.0)
        {
          goto LABEL_77;
        }
      }
      unsigned int v66 = v9;
      unint64_t v9 = (v9 + 1);
      int8x16_t v67 = (_OWORD *)a1;
LABEL_49:
      long long v68 = *(_OWORD *)v72;
      long long v69 = *(_OWORD *)(a1 + v65 + 48);
      unsigned int v70 = &v67[2 * v66];
      *unsigned int v70 = v68;
      v70[1] = v69;
      v65 += 32;
      if (!--v64) {
        goto LABEL_45;
      }
    }
  }
  return v9;
}

unint64_t acNonMaxSuppressionLowLogitFbody(uint64_t a1, unint64_t a2, float a3, float a4)
{
  unint64_t v4 = a2;
  if (a2)
  {
    bmHeapsort(a1, a2, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectSizeCompare);
    unint64_t v8 = 0;
    unint64_t v9 = (float *)(a1 + 48);
    int v10 = -1;
    do
    {
      unint64_t v11 = v8 + 1;
      if (v8 + 1 >= v4)
      {
        unint64_t v4 = v8 + 1;
      }
      else
      {
        uint64_t v12 = a1 + 32 * v8;
        float32x2_t v13 = (float *)(v12 + 8);
        float32x2_t v14 = (float *)(v12 + 12);
        float32x2_t v15 = (float *)(v12 + 4);
        int v16 = v4 + v10;
        BOOL v17 = v9;
        unint64_t v4 = v11;
        do
        {
          int v21 = *(_DWORD *)(v12 + 16);
          if (v21 != *(_DWORD *)v17) {
            goto LABEL_7;
          }
          if (v21 == 11)
          {
            float v22 = *v13;
            float v23 = *v14;
            float v24 = fmaxf(*v13 - *(float *)v12, 0.0) * fmaxf(*v14 - *v15, 0.0);
            float v25 = *(v17 - 4);
            float v26 = *(v17 - 3);
            if (*(float *)v12 >= v25) {
              float v27 = *(float *)v12;
            }
            else {
              float v27 = *(v17 - 4);
            }
            if (*v15 >= v26) {
              float v28 = *v15;
            }
            else {
              float v28 = *(v17 - 3);
            }
            float v29 = *(v17 - 2);
            float v30 = *(v17 - 1);
            if (v22 >= v29) {
              float v22 = *(v17 - 2);
            }
            if (v23 >= v30) {
              float v23 = *(v17 - 1);
            }
            float v31 = fmaxf(v22 - v27, 0.0) * fmaxf(v23 - v28, 0.0);
            BOOL v32 = v31 < 0.00000011921 || v24 < 0.00000011921;
            float v33 = v31 / v24;
            if (v32) {
              float v33 = 0.0;
            }
            if (v33 <= a4)
            {
              float v34 = 0.0;
              if (v31 >= 0.00000011921)
              {
                float v35 = (float)(v24 + (float)(fmaxf(v29 - v25, 0.0) * fmaxf(v30 - v26, 0.0))) - v31;
                if (v35 >= 0.00000011921) {
                  float v34 = v31 / v35;
                }
                else {
                  float v34 = 0.0;
                }
              }
              if (v34 <= a3)
              {
LABEL_7:
                uint64_t v18 = v4;
                unint64_t v4 = (v4 + 1);
                long long v19 = *(_OWORD *)v17;
                long long v20 = (_OWORD *)(a1 + 32 * v18);
                *long long v20 = *((_OWORD *)v17 - 1);
                v20[1] = v19;
              }
            }
          }
          v17 += 8;
          --v16;
        }
        while (v16);
      }
      v9 += 8;
      --v10;
      unint64_t v8 = v11;
    }
    while (v11 < v4);
  }
  return v4;
}

BOOL acCheckOverlapSecondFullBody(float32x2_t *a1, unsigned int a2, float32x2_t *a3, float a4, float32_t a5)
{
  if (!a2) {
    return 0;
  }
  uint64_t v5 = 0;
  BOOL v6 = 1;
  do
  {
    if (a1[3].f32[0] >= a5)
    {
      float32x2_t v7 = a3[1];
      float32x2_t v8 = vmaxnm_f32(vsub_f32(v7, *a3), 0);
      float32x2_t v9 = vmul_lane_f32(v8, v8, 1);
      float32x2_t v10 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v7, a1[1]), (int8x8_t)a1[1], (int8x8_t)v7), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*a3, *a1), (int8x8_t)*a3, (int8x8_t)*a1)), 0);
      float32x2_t v11 = vmul_lane_f32(v10, v10, 1);
      BOOL v12 = v11.f32[0] < 0.00000011921 || v9.f32[0] < 0.00000011921;
      LODWORD(v13) = vdiv_f32(v11, v9).u32[0];
      if (v12) {
        float v13 = 0.0;
      }
      if (v13 > a4) {
        break;
      }
    }
    BOOL v6 = ++v5 < (unint64_t)a2;
    a1 += 4;
  }
  while (a2 != v5);
  return v6;
}

float32x2_t *acFbodyHlogitSuppressLlogit(float32x2_t *result, unsigned int a2, uint64_t a3, unsigned int *a4, float a5, float32_t a6)
{
  unint64_t v6 = *a4;
  if (v6)
  {
    if (a2)
    {
      unint64_t v7 = 0;
      unsigned int v8 = *a4;
      LODWORD(v6) = 0;
      do
      {
        uint64_t v9 = 0;
        uint64_t v10 = a3 + 32 * v7;
        float32x2_t v11 = *(float32x2_t *)(v10 + 8);
        float32x2_t v12 = vmaxnm_f32(vsub_f32(v11, *(float32x2_t *)v10), 0);
        float32x2_t v13 = vmul_lane_f32(v12, v12, 1);
        BOOL v14 = 1;
        float32x2_t v15 = result;
        do
        {
          if (v15[3].f32[0] >= a6)
          {
            float32x2_t v16 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v11, v15[1]), (int8x8_t)v15[1], (int8x8_t)v11), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)v10, *v15), *(int8x8_t *)v10, (int8x8_t)*v15)), 0);
            float32x2_t v17 = vmul_lane_f32(v16, v16, 1);
            BOOL v18 = v17.f32[0] < 0.00000011921 || v13.f32[0] < 0.00000011921;
            LODWORD(v19) = vdiv_f32(v17, v13).u32[0];
            if (v18) {
              float v19 = 0.0;
            }
            if (v19 > a5) {
              break;
            }
          }
          BOOL v14 = ++v9 < (unint64_t)a2;
          v15 += 4;
        }
        while (a2 != v9);
        if (!v14)
        {
          long long v20 = (_OWORD *)(a3 + 32 * v6);
          long long v21 = *(_OWORD *)(v10 + 16);
          *long long v20 = *(_OWORD *)v10;
          v20[1] = v21;
          LODWORD(v6) = v6 + 1;
          unsigned int v8 = *a4;
        }
        ++v7;
      }
      while (v7 < v8);
    }
    else
    {
      if (v6 >= 2)
      {
        uint64_t v22 = v6 & 0xFFFFFFFE;
        if (v22 == v6) {
          goto LABEL_21;
        }
      }
      else
      {
        uint64_t v22 = 0;
      }
      unint64_t v23 = v22 | 1;
      if (v23 > v6) {
        LODWORD(v6) = v23;
      }
    }
  }
LABEL_21:
  *a4 = v6;
  return result;
}

const char *AcV1CommitHash()
{
  return "0000000";
}

const char *AcCommitHash()
{
  return "0000000";
}

uint64_t acMemBlockCoalesce(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a2 >= 2)
  {
    uint64_t v4 = a2;
    bmHeapsort(a1, a2, 0xCuLL, (int (*)(uint64_t, uint64_t))sub_246D7CA08);
    uint64_t v5 = 0;
    char v6 = 0;
    unint64_t v7 = (_DWORD *)(a1 + 20);
    uint64_t v8 = 1;
    do
    {
      uint64_t v9 = (void *)(a1 + 12 * v5);
      uint64_t v12 = *v9;
      uint64_t v10 = v9 + 1;
      uint64_t v11 = v12;
      float32x2_t v13 = v7;
      unint64_t v14 = v8;
      do
      {
        uint64_t v15 = *v10;
        if (v11 + v15 == *((void *)v13 - 1))
        {
          *uint64_t v10 = *v13 + v15;
          *float32x2_t v13 = 0;
          char v6 = 1;
        }
        ++v14;
        v13 += 3;
      }
      while (v14 < v2);
      ++v8;
      ++v5;
      v7 += 3;
    }
    while (v5 != v2 - 1);
    if (v6)
    {
      uint64_t v2 = 0;
      float32x2_t v16 = (_DWORD *)(a1 + 8);
      do
      {
        if (*v16)
        {
          uint64_t v17 = a1 + 12 * v2;
          uint64_t v18 = *((void *)v16 - 1);
          uint64_t v2 = (v2 + 1);
          *(_DWORD *)(v17 + _Block_object_dispose(&STACK[0x488], 8) = *v16;
          *(void *)uint64_t v17 = v18;
        }
        v16 += 3;
        --v4;
      }
      while (v4);
    }
  }
  return v2;
}

BOOL sub_246D7CA08(void *a1, void *a2)
{
  return *a1 > *a2;
}

uint64_t acMemBlockCoalesceNoSort(uint64_t a1, uint64_t a2)
{
  if (a2 >= 2)
  {
    uint64_t v2 = 0;
    char v3 = 0;
    uint64_t v4 = (_DWORD *)(a1 + 20);
    uint64_t v5 = 1;
    uint64_t v6 = a2;
    do
    {
      unint64_t v7 = (void *)(a1 + 12 * v2);
      uint64_t v10 = *v7;
      uint64_t v8 = v7 + 1;
      uint64_t v9 = v10;
      uint64_t v11 = v4;
      unint64_t v12 = v5;
      do
      {
        uint64_t v13 = *v8;
        if (v9 + v13 == *((void *)v11 - 1))
        {
          *uint64_t v8 = *v11 + v13;
          _DWORD *v11 = 0;
          char v3 = 1;
        }
        ++v12;
        v11 += 3;
      }
      while (v12 < a2);
      ++v5;
      ++v2;
      v4 += 3;
    }
    while (v2 != a2 - 1);
    if (v3)
    {
      a2 = 0;
      unint64_t v14 = (_DWORD *)(a1 + 8);
      do
      {
        if (*v14)
        {
          uint64_t v15 = a1 + 12 * a2;
          uint64_t v16 = *((void *)v14 - 1);
          a2 = (a2 + 1);
          *(_DWORD *)(v15 + _Block_object_dispose(&STACK[0x488], 8) = *v14;
          *(void *)uint64_t v15 = v16;
        }
        v14 += 3;
        --v6;
      }
      while (v6);
    }
  }
  return a2;
}

uint64_t acTrkGroupAssignGetTempBuffers(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4 = 4 * a1 * a1;
  int v5 = a1 * a1 + 12 * a1 + v4 + ((4 * a1) | 3) + 2 * (((4 * a1) | 3) + a1) + 9;
  if (a2)
  {
    unint64_t v6 = (a2 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    int v7 = 4 * a1 - a2;
    unint64_t v8 = (a2 + 3 + (v6 + v7)) & 0xFFFFFFFFFFFFFFFCLL;
    *(void *)a4 = v6;
    *(void *)(a4 + _Block_object_dispose(&STACK[0x488], 8) = v8;
    unint64_t v9 = (a2 + 3 + (v8 + v7)) & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v10 = (a2 + 3 + (v9 + v7)) & 0xFFFFFFFFFFFFFFFCLL;
    *(void *)(a4 + 16) = v9;
    *(void *)(a4 + 24) = v10;
    unint64_t v11 = (a2 + 3 + (v10 + v7)) & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v12 = (a2 + 3 + (v11 + v7)) & 0xFFFFFFFFFFFFFFFCLL;
    int v13 = v4 - a2;
    *(void *)(a4 + 32) = v11;
    *(void *)(a4 + 40) = v12;
    unint64_t v14 = (a2 + 3 + (v12 + v13)) & 0xFFFFFFFFFFFFFFFCLL;
    uint64_t v15 = a2 + (v14 + v13);
    *(_DWORD *)(a4 + 64) = v5;
    *(void *)(a4 + 4_Block_object_dispose(&STACK[0x488], 8) = v14;
    *(void *)(a4 + 56) = v15;
    unint64_t v16 = (a2 + 3 + (v5 - a2 + v15)) & 0xFFFFFFFFFFFFFFFCLL;
    *(void *)(a4 + 72) = v16;
    *(_DWORD *)(a4 + 80) = a1 & 0x3FFFFFFF;
    unint64_t v17 = (a2 + 3 + (v16 + v7)) & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v18 = (a2 + 3 + (v17 + v7)) & 0xFFFFFFFFFFFFFFFCLL;
    *(void *)(a4 + 8_Block_object_dispose(&STACK[0x488], 8) = v17;
    *(void *)(a4 + 96) = v18;
    unint64_t v19 = (a2 + 3 + (v18 + v7)) & 0xFFFFFFFFFFFFFFFCLL;
    *(void *)(a4 + 104) = v19;
    *(void *)(a4 + 112) = (a2 + 3 + (v19 + v7)) & 0xFFFFFFFFFFFFFFFCLL;
  }
  return (v5 + 8 * a1 * a1 + 40 * a1 + 36);
}

uint64_t acTrkGroupAssignTempBytes(int a1)
{
  return a1 * a1 + (8 * a1 + 52) * a1 + 4 * a1 * a1 + 2 * (((4 * a1) | 3) + a1) + ((4 * a1) | 3u) + 45;
}

uint64_t acTrkGroupAssign(uint64_t a1, int a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, _DWORD *a8, int *a9, unsigned int *a10, void *a11)
{
  uint64_t v215 = 0;
  long long v213 = 0u;
  long long v214 = 0u;
  long long v211 = 0u;
  long long v212 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  long long v208 = 0u;
  unsigned int TempBuffers = acTrkGroupAssignGetTempBuffers(a4 + a2, (uint64_t)a11, a3, (uint64_t)&v208);
  bzero(a11, TempBuffers);
  long long v20 = (_DWORD *)*((void *)&v208 + 1);
  unint64_t v19 = (_DWORD *)v208;
  __dst = (unsigned int *)*((void *)&v209 + 1);
  uint64_t result = v209;
  long long v22 = v210;
  unint64_t v23 = (unsigned __int8 *)*((void *)&v211 + 1);
  int v206 = (void *)v211;
  float v24 = (unsigned int *)*((void *)&v212 + 1);
  float v25 = (_DWORD *)*((void *)&v213 + 1);
  float v26 = (int *)v214;
  unint64_t v203 = (unsigned int *)v209;
  if (a2)
  {
    uint64_t v27 = 0;
    unsigned int v28 = 0;
    float v29 = (_DWORD *)(a1 + 8);
    do
    {
      if (*v29 == a5) {
        v19[v28++] = v27;
      }
      v29 += 431;
      ++v27;
    }
    while (a2 != v27);
    if (!a4)
    {
      float v31 = a8;
      if (!v28) {
        return result;
      }
      goto LABEL_220;
    }
    v200 = v23;
    uint64_t v30 = a7;
    float v31 = a8;
  }
  else
  {
    float v31 = a8;
    if (!a4) {
      return result;
    }
    v200 = (unsigned __int8 *)*((void *)&v211 + 1);
    uint64_t v30 = a7;
    unsigned int v28 = 0;
  }
  uint64_t v32 = 0;
  unsigned int v33 = 0;
  unsigned int v34 = 0;
  do
  {
    float v36 = (int *)(a3 + 1724 * v32);
    if (v36[2] == a6)
    {
      v20[v34] = v32;
      int v37 = v36[1];
      if (v37) {
        *(_DWORD *)(v22 + 4 * v33++) = v37;
      }
      ++v34;
      int v38 = *v36;
      uint64_t v39 = *a10;
      uint64_t v40 = v39;
      float v41 = a9;
      if (v39)
      {
        while (1)
        {
          int v42 = *v41;
          v41 += 3;
          if (v42 == v38) {
            break;
          }
          if (!--v40)
          {
            int v35 = *a10;
            goto LABEL_12;
          }
        }
      }
      else
      {
        int v35 = 0;
LABEL_12:
        *a10 = v39 + 1;
        a9[3 * v35] = v38;
      }
    }
    ++v32;
  }
  while (v32 != a4);
  uint64_t v205 = v25;
  if (!v28 || !v34)
  {
    if (!v28)
    {
      if (v34)
      {
        uint16x8_t v98 = v20;
        uint64_t v99 = v34;
        int v100 = __dst;
        uint64_t result = (uint64_t)memcpy(__dst, v98, 4 * v34);
        uint64_t v101 = a9;
        uint16x8_t v102 = v205;
        uint64_t v103 = v203;
        unsigned int v104 = 0;
        unsigned int v105 = 0;
        goto LABEL_199;
      }
      return result;
    }
LABEL_220:
    uint64_t v183 = v28;
    uint64_t result = (uint64_t)memcpy((void *)result, v19, 4 * v28);
    uint64_t v103 = v203;
    goto LABEL_223;
  }
  unsigned int v199 = v33;
  unsigned int v204 = v24;
  v198 = (float *)v30;
  unsigned int v43 = 0;
  unint64_t v44 = 0;
  unsigned int v45 = 0;
  if (v28 <= v34) {
    uint64_t v46 = v34;
  }
  else {
    uint64_t v46 = v28;
  }
  float v47 = *(float *)(v30 + 4);
  float v48 = *(float *)(v30 + 8);
  unsigned int v197 = *(_DWORD *)(v30 + 12);
  unint64_t v49 = v28;
  int v50 = v46 & 0xFFFFFFF8;
  unsigned int v207 = v46 - v28;
  int v51 = (v46 - v28) & 0xFFFFFFF8;
  int32x4_t v52 = vdupq_n_s32(0x42C80000u);
  do
  {
    if (v44 < v34)
    {
      unsigned int v53 = 0;
      int8x16_t v54 = v20;
      uint64_t v55 = a3 + 1724 * v20[v44];
      float32x2_t v56 = *(float32x2_t *)(v55 + 12);
      float32x2_t v57 = vadd_f32(v56, *(float32x2_t *)(v55 + 20));
      int v58 = *(_DWORD *)(v55 + 8);
      unsigned int v59 = (_DWORD *)(v55 + 512);
      float v60 = (float)(fmaxf(vsub_f32(v57, v56).f32[0], 0.0) * fmaxf(v57.f32[1] - v56.f32[1], 0.0)) + 0.00000011921;
      unsigned int v61 = v45 + 1;
      uint64_t v62 = v19;
      uint64_t v63 = v28;
      do
      {
        unsigned int v67 = v45;
        unsigned int v68 = *v62++;
        unsigned int v69 = v61;
        uint64_t v70 = a1 + 1724 * v68;
        float32x2_t v71 = *(float32x2_t *)(v70 + 12);
        float32x2_t v72 = vadd_f32(v71, *(float32x2_t *)(v70 + 20));
        float v73 = v72.f32[1];
        float v74 = v71.f32[1];
        if (vcgt_f32(v56, v71).u8[0]) {
          float v75 = v56.f32[0];
        }
        else {
          float v75 = v71.f32[0];
        }
        if (v71.f32[1] < v56.f32[1]) {
          float v74 = v56.f32[1];
        }
        if (vcgt_f32(v57, v72).u8[0]) {
          float v76 = v72.f32[0];
        }
        else {
          float v76 = v57.f32[0];
        }
        float32x2_t v77 = (float32x2_t)vdup_lane_s32((int32x2_t)v72, 0);
        v77.f32[0] = v76;
        float32x2_t v78 = (float32x2_t)vdup_lane_s32((int32x2_t)v71, 0);
        if (v72.f32[1] >= v57.f32[1]) {
          float v73 = v57.f32[1];
        }
        v78.f32[0] = v75;
        v72.f32[0] = v73;
        v71.f32[0] = v74;
        float32x2_t v79 = vmul_f32(vmaxnm_f32(vsub_f32(v77, v78), 0), vmaxnm_f32(vsub_f32(v72, v71), 0));
        BOOL v80 = v79.f32[0] < 0.00000011921 || v79.f32[1] < 0.00000011921;
        float v81 = v79.f32[0] / v79.f32[1];
        if (v80) {
          float v81 = 0.0;
        }
        if (v58 == 9 && *v59) {
          float v81 = 0.0;
        }
        if ((*(_DWORD *)(v70 + 8) & 0xFFFFFFFE) == 0xA) {
          float v64 = 0.0;
        }
        else {
          float v64 = v48;
        }
        if ((float)(v79.f32[1] / v60) >= v47) {
          float v65 = 0.0;
        }
        else {
          float v65 = v64;
        }
        float v66 = v81 - v65;
        if (v66 >= 0.95) {
          ++v53;
        }
        *(float *)(*((void *)&v22 + 1) + 4 * v67) = 10.0 - v66;
        unsigned int v45 = v67 + 1;
        ++v61;
        --v63;
      }
      while (v63);
      if (v28 >= v34)
      {
        long long v20 = v54;
        goto LABEL_79;
      }
      if (v207 < 8)
      {
        unsigned int v89 = v28;
        long long v20 = v54;
      }
      else
      {
        unsigned int v88 = -2 - v67;
        unsigned int v89 = v28;
        uint64_t v90 = (v46 - v28) & 0xFFFFFFF8;
        long long v20 = v54;
        if (v88 >= v46 - 1 - v28)
        {
          do
          {
            int v91 = (int32x4_t *)(*((void *)&v22 + 1) + 4 * v69);
            *int v91 = v52;
            v91[1] = v52;
            v69 += 8;
            v90 -= 8;
          }
          while (v90);
          v45 += v51;
          unsigned int v89 = v28 + v51;
          if (v207 == v51)
          {
LABEL_79:
            if (v28 >= 2 && v53 >= 2)
            {
              unsigned int v93 = v43;
              v94 = v19;
              uint64_t v95 = v28;
              do
              {
                float v96 = *(float *)(*((void *)&v22 + 1) + 4 * v93);
                if ((float)(10.0 - v96) >= 0.95)
                {
                  float32x2_t v97 = vmaxnm_f32(vsub_f32(vadd_f32(*(float32x2_t *)(a1 + 1724 * *v94 + 12), *(float32x2_t *)(a1 + 1724 * *v94 + 20)), *(float32x2_t *)(a1 + 1724 * *v94 + 12)), 0);
                  *(float *)(*((void *)&v22 + 1) + 4 * v93) = v96 - (float)(vmul_lane_f32(v97, v97, 1).f32[0] / v60);
                }
                ++v94;
                ++v93;
                --v95;
              }
              while (v95);
            }
            goto LABEL_27;
          }
        }
      }
      int v92 = v46 - v89;
      do
      {
        *(_DWORD *)(*((void *)&v22 + 1) + 4 * v45++) = 1120403456;
        --v92;
      }
      while (v92);
      goto LABEL_79;
    }
    int v82 = 0;
    BOOL v83 = __CFADD__(v45, v46 - 1);
    if (v46 < 8) {
      goto LABEL_66;
    }
    if (v83) {
      goto LABEL_66;
    }
    uint64_t v84 = v46 & 0xFFFFFFF8;
    unsigned int v85 = v45;
    do
    {
      float v86 = (int32x4_t *)(*((void *)&v22 + 1) + 4 * v85);
      *float v86 = v52;
      v86[1] = v52;
      v85 += 8;
      v84 -= 8;
    }
    while (v84);
    v45 += v50;
    int v82 = v46 & 0xFFFFFFF8;
    if (v46 != v50)
    {
LABEL_66:
      int v87 = v46 - v82;
      do
      {
        *(_DWORD *)(*((void *)&v22 + 1) + 4 * v45++) = 1120403456;
        --v87;
      }
      while (v87);
    }
LABEL_27:
    ++v44;
    v43 += v46;
  }
  while (v44 != v46);
  if (v197)
  {
    unsigned int v106 = 0;
    unint64_t v107 = 0;
    while (2)
    {
      if (v107 >= v34) {
        goto LABEL_94;
      }
      uint64x2_t v110 = (int *)(a3 + 1724 * v20[v107]);
      uint64_t v111 = *a10;
      if (v111)
      {
        uint64_t v112 = 0;
        int v113 = a9;
        while (1)
        {
          int v114 = *v113;
          v113 += 3;
          if (v114 == *v110) {
            break;
          }
          if (v111 == ++v112) {
            goto LABEL_100;
          }
        }
        int v115 = a9[3 * v112 + 1];
      }
      else
      {
LABEL_100:
        int v115 = -1;
      }
      unint64_t v116 = v49;
      BOOL v117 = v19;
      while (1)
      {
        unsigned int v118 = *v117++;
        if (*(_DWORD *)(a1 + 1724 * v118) == v115) {
          break;
        }
        if (!--v116) {
          goto LABEL_94;
        }
      }
      if (v115 == -1) {
        goto LABEL_94;
      }
      uint64_t v119 = 0;
      while (v115 != *(_DWORD *)(a1 + 1724 * v19[v119]))
      {
        if (v49 == ++v119)
        {
          LODWORD(v119) = -1;
          break;
        }
      }
      float v120 = 3.4028e38;
      unsigned int v121 = v106;
      uint64_t v122 = v46;
      do
      {
        if (*(float *)(*((void *)&v22 + 1) + 4 * v121) < v120) {
          float v120 = *(float *)(*((void *)&v22 + 1) + 4 * v121);
        }
        ++v121;
        --v122;
      }
      while (v122);
      LODWORD(v123) = 0;
      uint64_t v124 = v46;
      do
      {
        if (vabds_f32(v120, *(float *)(*((void *)&v22 + 1) + 4 * (v106 + v122))) < 0.00000011921)
        {
          v26[v123] = v122;
          LODWORD(v123) = v123 + 1;
        }
        LODWORD(v122) = v122 + 1;
        --v124;
      }
      while (v124);
      if (v123)
      {
        uint64_t v123 = v123;
        uint64_t v125 = v26;
        while (1)
        {
          int v126 = *v125++;
          if (v126 == v119) {
            break;
          }
          if (!--v123) {
            goto LABEL_123;
          }
        }
        int v127 = v119;
      }
      else
      {
LABEL_123:
        int v127 = *v26;
      }
      float v128 = 3.4028e38;
      unsigned int v129 = v119;
      uint64_t v130 = v46;
      do
      {
        if (*(float *)(*((void *)&v22 + 1) + 4 * v129) < v128) {
          float v128 = *(float *)(*((void *)&v22 + 1) + 4 * v129);
        }
        v129 += v46;
        --v130;
      }
      while (v130);
      LODWORD(v131) = 0;
      unsigned int v132 = v119;
      do
      {
        if (vabds_f32(v128, *(float *)(*((void *)&v22 + 1) + 4 * v132)) < 0.00000011921)
        {
          v26[v131] = v130;
          LODWORD(v131) = v131 + 1;
        }
        ++v130;
        v132 += v46;
      }
      while (v46 != v130);
      if (v131)
      {
        uint64_t v131 = v131;
        int32x4_t v133 = v26;
        while (1)
        {
          int v134 = *v133++;
          if (v134 == v107) {
            break;
          }
          if (!--v131) {
            goto LABEL_137;
          }
        }
        int v135 = v107;
      }
      else
      {
LABEL_137:
        int v135 = *v26;
      }
      uint64_t v136 = *a10;
      if (v127 == v119 && v107 == v135)
      {
        if (!v136) {
          goto LABEL_90;
        }
        uint64_t v137 = 0;
        int v138 = *v110;
        uint16x8_t v139 = a9;
        while (1)
        {
          int v140 = *v139;
          v139 += 3;
          if (v140 == v138) {
            break;
          }
          if (v136 == ++v137) {
            goto LABEL_150;
          }
        }
        a9[3 * v137 + 2] = 0;
        uint64_t v144 = *a10;
        if (!v144) {
          goto LABEL_90;
        }
LABEL_151:
        uint64_t v145 = 0;
        uint16x8_t v146 = a9;
        while (1)
        {
          int v147 = *v146;
          v146 += 3;
          if (v147 == v138) {
            break;
          }
          if (v144 == ++v145) {
            goto LABEL_90;
          }
        }
        unsigned int v108 = a9[3 * v145 + 2];
      }
      else
      {
        if (v136)
        {
          uint64_t v141 = 0;
          int v138 = *v110;
          uint16x8_t v142 = a9;
          while (1)
          {
            int v143 = *v142;
            v142 += 3;
            if (v143 == v138) {
              break;
            }
            if (v136 == ++v141)
            {
LABEL_150:
              uint64_t v144 = *a10;
              if (!v144) {
                goto LABEL_90;
              }
              goto LABEL_151;
            }
          }
          ++a9[3 * v141 + 2];
          uint64_t v144 = *a10;
          if (v144) {
            goto LABEL_151;
          }
        }
LABEL_90:
        unsigned int v108 = 0;
      }
      float v109 = 0.5 - (float)((float)((float)v108 * 0.5) / (float)v197);
      if (v109 < 0.0) {
        float v109 = 0.0;
      }
      *(float *)(*((void *)&v22 + 1) + 4 * (v119 + v46 * v107)) = *(float *)(*((void *)&v22 + 1)
                                                                                             + 4
                                                                                             * (v119 + v46 * v107))
                                                                                  - v109;
LABEL_94:
      ++v107;
      v106 += v46;
      if (v107 == v46) {
        break;
      }
      continue;
    }
  }
  memcpy(v206, *((const void **)&v22 + 1), 4 * (v46 * v46));
  bmMunkres(*((float **)&v22 + 1), v46, v200, v148, v204, v149, 0, v150);
  uint64_t v151 = v204;
  uint64_t v101 = a9;
  unsigned int v105 = 0;
  unsigned int v104 = 0;
  unsigned int v152 = 0;
  unint64_t v153 = 0;
  float v154 = *v198;
  uint64_t v103 = v203;
  uint16x8_t v102 = v205;
  int v100 = __dst;
  while (2)
  {
    uint64_t v155 = v151[v153];
    if (v153 >= v49)
    {
      uint64_t result = v20[v155];
      __dst[v152++] = result;
    }
    else if (v155 >= v34)
    {
      uint64_t result = v19[v153];
      v103[v104++] = result;
    }
    else if ((float)(10.0 - *((float *)v206 + (v153 + v155 * v46))) <= v154)
    {
      uint64_t v161 = *a10;
      int v162 = *(_DWORD *)(a3 + 1724 * v20[v155]);
      uint64_t v163 = v161;
      if (v161)
      {
        while (1)
        {
          int v164 = *v101;
          v101 += 3;
          if (v164 == v162) {
            break;
          }
          if (!--v163)
          {
            int v165 = *a10;
            goto LABEL_188;
          }
        }
        uint64_t v170 = 0;
        uint16x8_t v171 = a9;
        while (1)
        {
          int v172 = *v171;
          v171 += 3;
          if (v172 == v162) {
            break;
          }
          if (v161 == ++v170) {
            goto LABEL_189;
          }
        }
        *(void *)&a9[3 * v170 + 1] = 0xFFFFFFFFLL;
      }
      else
      {
        int v165 = 0;
LABEL_188:
        *a10 = v161 + 1;
        a9[3 * v165] = v162;
      }
LABEL_189:
      __dst[v152] = v20[v155];
      uint64_t result = v19[v153];
      ++v152;
      v103[v104++] = result;
      uint16x8_t v102 = v205;
LABEL_190:
      uint64_t v101 = a9;
      uint64_t v151 = v204;
    }
    else
    {
      v156 = (_DWORD *)(a1 + 1724 * v19[v153]);
      uint64_t result = a3 + 1724 * v20[v155];
      uint64_t v157 = *a10;
      if (v157)
      {
        uint64_t v158 = 0;
        int32x4_t v159 = a9 + 1;
        while (*(v159 - 1) != *(_DWORD *)result || *v159 == *v156)
        {
          ++v158;
          v159 += 3;
          if (v157 == v158) {
            goto LABEL_172;
          }
        }
        *int32x4_t v159 = *v156;
        a9[3 * v158 + 2] = 0;
      }
LABEL_172:
      int v160 = *(_DWORD *)(result + 4);
      if (v160)
      {
        v156[1] = v160;
        uint64_t result = *(unsigned int *)(result + 4);
        uint16x8_t v102 = v205;
        v205[v105++] = result;
        uint64_t v103 = v203;
        goto LABEL_190;
      }
      int v166 = v156[1];
      uint64_t v103 = v203;
      uint64_t v151 = v204;
      if (!v166) {
        goto LABEL_186;
      }
      if (!v199) {
        goto LABEL_196;
      }
      if (*(_DWORD *)v22 == v166)
      {
LABEL_186:
        int v169 = (*a8)++;
        *(_DWORD *)(result + 4) = v169;
        v156[1] = v169;
        uint16x8_t v102 = v205;
        uint64_t v101 = a9;
      }
      else
      {
        unint64_t v167 = 0;
        while (v199 - 1 != v167)
        {
          int v168 = *(_DWORD *)(v22 + 4 + 4 * v167++);
          if (v168 == v166)
          {
            if (v167 >= v199) {
              break;
            }
            goto LABEL_186;
          }
        }
LABEL_196:
        *(_DWORD *)(result + 4) = v166;
        uint64_t result = v156[1];
        uint16x8_t v102 = v205;
        v205[v105++] = result;
        uint64_t v101 = a9;
      }
    }
    if (++v153 != v46) {
      continue;
    }
    break;
  }
  if (v152)
  {
    uint64_t v99 = v152;
    float v31 = a8;
LABEL_199:
    uint64_t v173 = 0;
    while (2)
    {
      uint16x8_t v175 = (_DWORD *)(a3 + 1724 * v100[v173]);
      uint64_t v176 = *a10;
      if (v176)
      {
        uint64_t v177 = 0;
        uint64_t result = (uint64_t)v101;
        while (1)
        {
          int v178 = *(_DWORD *)result;
          result += 12;
          if (v178 == *v175) {
            break;
          }
          if (v176 == ++v177) {
            goto LABEL_206;
          }
        }
        *(void *)&v101[3 * v177 + 1] = 0xFFFFFFFFLL;
        int v179 = v175[1];
        if (!v105)
        {
LABEL_213:
          BOOL v182 = 0;
          if (!v179) {
            goto LABEL_200;
          }
LABEL_217:
          if (v182) {
            goto LABEL_200;
          }
          v102[v105++] = v179;
          goto LABEL_201;
        }
      }
      else
      {
LABEL_206:
        int v179 = v175[1];
        if (!v105) {
          goto LABEL_213;
        }
      }
      if (*v102 != v179)
      {
        unint64_t v180 = 0;
        uint64_t result = v105 - 1;
        while (result != v180)
        {
          int v181 = v102[++v180];
          if (v181 == v179) {
            goto LABEL_216;
          }
        }
        unint64_t v180 = v105;
LABEL_216:
        BOOL v182 = v180 < v105;
        if (v179) {
          goto LABEL_217;
        }
      }
LABEL_200:
      int v174 = (*v31)++;
      v175[1] = v174;
LABEL_201:
      if (++v173 == v99) {
        goto LABEL_226;
      }
      continue;
    }
  }
  float v31 = a8;
LABEL_226:
  if (v104)
  {
    uint64_t v183 = v104;
    if (v105)
    {
      for (uint64_t i = 0; i != v183; ++i)
      {
        uint64_t v191 = a1 + 1724 * v103[i];
        int v194 = *(_DWORD *)(v191 + 4);
        unsigned int v192 = (_DWORD *)(v191 + 4);
        int v193 = v194;
        if (*v102 == v194) {
          goto LABEL_229;
        }
        unint64_t v195 = 0;
        while (v105 - 1 != v195)
        {
          int v196 = v102[++v195];
          if (v196 == v193)
          {
            if (!v193) {
              goto LABEL_229;
            }
            goto LABEL_238;
          }
        }
        unint64_t v195 = v105;
        if (!v193) {
          goto LABEL_229;
        }
LABEL_238:
        if (v195 < v105)
        {
LABEL_229:
          int v190 = (*v31)++;
          *unsigned int v192 = v190;
        }
      }
      return result;
    }
    do
    {
LABEL_223:
      unsigned int v184 = *v103++;
      uint64_t v185 = a1 + 1724 * v184;
      int v187 = *(_DWORD *)(v185 + 4);
      float v186 = (_DWORD *)(v185 + 4);
      if (!v187)
      {
        int v188 = (*v31)++;
        *float v186 = v188;
      }
      --v183;
    }
    while (v183);
  }
  return result;
}

double acTrkGroupTemporalInfoReset(uint64_t a1)
{
  double result = NAN;
  *(void *)a1 = -1;
  *(_DWORD *)(a1 + _Block_object_dispose(&STACK[0x488], 8) = 0;
  return result;
}

uint64_t pythonModuloForAsso(int a1, int a2)
{
  return ((a1 % a2 + a2) % a2);
}

_DWORD *acTrkHandChiralityTemporalSmoothing(_DWORD *result, uint64_t a2, int a3, int a4, int a5, char a6, unsigned int a7, char a8)
{
  int v8 = *(_DWORD *)(a2 + 8);
  if ((v8 & 0xFFFFFFFE) != 0xA) {
    return result;
  }
  if (a6)
  {
    unsigned int v9 = result[195];
    if (a7 < v9) {
      unsigned int v9 = a7;
    }
    if (v9 >= 6) {
      int v10 = 6;
    }
    else {
      int v10 = v9;
    }
    if (!v10)
    {
      if (v8 == a3)
      {
LABEL_59:
        if (*(_DWORD *)(a2 + 28) < 2u) {
          char v21 = a8;
        }
        else {
          char v21 = 0;
        }
        if (a3 != 10 || (v21 & 1) != 0)
        {
          if (a3 != 11) {
            char v21 = 1;
          }
          if ((v21 & 1) == 0) {
            ++result[415];
          }
        }
        else
        {
          ++result[414];
        }
        goto LABEL_69;
      }
LABEL_58:
      result[2] = v8;
      a3 = *(_DWORD *)(a2 + 8);
      goto LABEL_59;
    }
    int v11 = result[142];
    if (v11 == 11)
    {
      unsigned int v13 = 0;
      unsigned int v12 = 1;
      if (v10 == 1) {
        goto LABEL_53;
      }
    }
    else if (v11 == 10)
    {
      unsigned int v12 = 0;
      unsigned int v13 = 1;
      if (v10 == 1) {
        goto LABEL_53;
      }
    }
    else
    {
      unsigned int v13 = 0;
      unsigned int v12 = 0;
      if (v10 == 1)
      {
LABEL_53:
        if (v8 == a3) {
          goto LABEL_59;
        }
        if (v13 <= v12)
        {
          if (v13 < v12) {
            int v8 = 11;
          }
        }
        else
        {
          int v8 = 10;
        }
        goto LABEL_58;
      }
    }
    int v16 = result[152];
    if (v16 == 10)
    {
      ++v13;
    }
    else if (v16 == 11)
    {
      ++v12;
    }
    if (v10 != 2)
    {
      int v17 = result[162];
      if (v17 == 10)
      {
        ++v13;
      }
      else if (v17 == 11)
      {
        ++v12;
      }
      if (v10 != 3)
      {
        int v18 = result[172];
        if (v18 == 10)
        {
          ++v13;
        }
        else if (v18 == 11)
        {
          ++v12;
        }
        if (v10 != 4)
        {
          int v19 = result[182];
          if (v19 == 10)
          {
            ++v13;
          }
          else if (v19 == 11)
          {
            ++v12;
          }
          if (v10 != 5)
          {
            int v20 = result[192];
            if (v20 == 10)
            {
              ++v13;
            }
            else if (v20 == 11)
            {
              ++v12;
            }
          }
        }
      }
    }
    goto LABEL_53;
  }
  if (v8 != a3)
  {
    unsigned int v14 = result[414];
    unsigned int v15 = result[415];
    if (v14 <= v15)
    {
      if (v14 >= v15)
      {
LABEL_24:
        result[2] = v8;
        goto LABEL_69;
      }
      if (v8 == 10 && v14 + a4 >= v15) {
        goto LABEL_25;
      }
    }
    else if (v8 != 11 || v15 + a5 < v14)
    {
LABEL_25:
      result[2] = 10;
      goto LABEL_69;
    }
    int v8 = 11;
    goto LABEL_24;
  }
LABEL_69:
  int v22 = *(_DWORD *)(a2 + 8);
  if (v22 == 11)
  {
    unint64_t v23 = result + 415;
  }
  else
  {
    if (v22 != 10) {
      return result;
    }
    unint64_t v23 = result + 414;
  }
  ++*v23;
  return result;
}

float acTrkLabelCenterSizeSmoothing(int *__src, char *__dst, uint64_t a3, int a4, uint64_t a5, int a6, int a7, unsigned int a8, float *a9, float *a10, float *a11, float *a12)
{
  unint64_t v18 = 0;
  int v19 = a11;
  int v20 = a12;
  *a9 = *((float *)__dst + 5);
  *a10 = *((float *)__dst + 6);
  unint64_t v21 = __src[2];
  uint64_t v22 = 5;
  if ((v21 & 0xFFFFFFFE) == 0xA) {
    uint64_t v22 = 6;
  }
  unint64_t v23 = __src[195];
  BOOL v24 = ((0x13Fu >> v21) & 1) == 0 || v21 > 8;
  char v25 = v24;
  int v26 = v23 - 1;
  uint64_t v27 = v22;
  if ((v25 & 1) == 0) {
LABEL_10:
  }
    uint64_t v27 = qword_246D9F2C0[v21];
  while (v18 < *(unsigned int *)(a5 + 4 * v27 + 8) && v18 < v23)
  {
    float v29 = (float *)&__src[10 * v26];
    *a9 = v29[135] + *a9;
    *a10 = v29[136] + *a10;
    ++v18;
    --v26;
    uint64_t v27 = v22;
    if ((v25 & 1) == 0) {
      goto LABEL_10;
    }
  }
  uint64_t v30 = (float *)(__dst + 12);
  float v31 = (float)(v18 + 1);
  *a9 = *a9 / v31;
  float result = *a10 / v31;
  *a10 = result;
  int v33 = *((_DWORD *)__dst + 2);
  switch(v33)
  {
    case 0:
      if (!*((unsigned char *)__src + 100) || __dst[100]) {
        goto LABEL_79;
      }
      int v35 = *(_DWORD *)(a5 + 180);
      int v36 = __src[10];
      BOOL v38 = v36 >= 0 && v36 < v35;
      BOOL v40 = v36 <= 360 - v35 || v36 > 360;
      float v41 = *((float *)__dst + 3);
      BOOL v42 = 1;
      if (v41 >= 0.0)
      {
        float v43 = *((float *)__dst + 4);
        if (v43 >= 0.0 && (float)((float)(v41 + *((float *)__dst + 5)) - (float)a8) <= 0.0) {
          BOOL v42 = (float)((float)(v43 + *((float *)__dst + 6)) - (float)a8) > 0.0;
        }
      }
      float v44 = *((float *)__src + 208);
      if (v38)
      {
        char v45 = v44 >= 0.03 || v42;
        if (v45) {
          goto LABEL_79;
        }
      }
      else
      {
        if (v44 >= 0.03) {
          BOOL v40 = 1;
        }
        if (v40 || v42)
        {
LABEL_79:
          __src[204] = 0;
          if (!a4) {
            goto LABEL_104;
          }
LABEL_80:
          uint64_t v79 = 0;
          BOOL v80 = (_DWORD *)(a3 + 8);
          while (*(v80 - 1) != a6 || *v80 != 1)
          {
            ++v79;
            v80 += 431;
            if (a4 == v79) {
              goto LABEL_104;
            }
          }
          uint64_t v81 = a3 + 1724 * v79;
          float32x2_t v82 = *(float32x2_t *)(v81 + 12);
          float32x2_t v83 = vadd_f32(v82, *(float32x2_t *)(v81 + 20));
          float32x2_t v84 = *(float32x2_t *)(__dst + 12);
          float32x2_t v85 = *(float32x2_t *)(__dst + 20);
          float32x2_t v86 = vadd_f32(v84, v85);
          float32x2_t v87 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v83, v86), (int8x8_t)v86, (int8x8_t)v83), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v82, v84), (int8x8_t)v82, (int8x8_t)v84)), 0);
          float v88 = vmul_lane_f32(v87, v87, 1).f32[0];
          if (v88 >= 0.00000011921)
          {
            float32x2_t v89 = vmul_f32(vmaxnm_f32(vsub_f32((float32x2_t)vzip1_s32((int32x2_t)v86, (int32x2_t)v83), (float32x2_t)vzip1_s32((int32x2_t)v84, (int32x2_t)v82)), 0), vmaxnm_f32(vsub_f32((float32x2_t)vzip2_s32((int32x2_t)v86, (int32x2_t)v83), (float32x2_t)vzip2_s32((int32x2_t)v84, (int32x2_t)v82)), 0));
            float v90 = v89.f32[0] >= v89.f32[1] ? v89.f32[1] : v89.f32[0];
            if (v90 >= 0.00000011921 && (float)(v88 / v90) > 0.75)
            {
              float v91 = vmul_lane_f32(v85, v85, 1).f32[0] / (float)((float)(a8 * a7) + 0.0001);
              float v92 = (float)(v89.f32[0] + v89.f32[1]) - v88;
              float v93 = v88 / v92;
              if (v92 < 0.00000011921) {
                float v93 = 0.0;
              }
              if (v93 > 0.6 && v91 < 0.15)
              {
                *(_DWORD *)a9 = __src[5];
                *(_DWORD *)a10 = __src[6];
              }
            }
          }
LABEL_104:
          float v96 = *((float *)__dst + 5);
          float result = *((float *)__dst + 6);
          int v97 = __dst[100];
          int v98 = *((unsigned __int8 *)__src + 100);
          if (v98 == v97)
          {
            if (__dst[100])
            {
              __src[199] = 0;
              *((void *)__src + 100) = 0;
            }
            else
            {
              unsigned int v100 = __src[197];
              if (v100 && v100 < __src[201] + *(_DWORD *)(a5 + 160))
              {
                __src[199] = v100;
                __src[200] = __src[130];
              }
            }
            *(void *)(__src + 197) = 0;
            if (__src[196] % *(_DWORD *)(a5 + 172))
            {
              unsigned int v99 = 0;
              *(_DWORD *)a9 = __src[5];
              float result = *((float *)__src + 6);
            }
            else
            {
              __src[196] = 0;
              if (!v97)
              {
                float v101 = *((float *)__src + 207);
                float v102 = v96 * result;
                float v103 = *a9 * *a10;
                if (v101 <= v103) {
                  float v104 = v101 / v103;
                }
                else {
                  float v104 = v103 / v101;
                }
                BOOL v24 = v101 <= v102;
                float v105 = v101 / v102;
                float v106 = v102 / v101;
                if (v24) {
                  float v106 = v105;
                }
                if (v106 <= v104) {
                  float v96 = *a9;
                }
                *a9 = v96;
                if (v106 <= v104) {
                  float result = *a10;
                }
                *a10 = result;
              }
              float result = *a9;
              float v107 = *a9 / (float)(*((float *)__src + 5) + 0.0001);
              unsigned int v99 = 0;
              if (v107 <= 1.5) {
                goto LABEL_134;
              }
              float v108 = (float)(1.0 / (float)(v107 + 0.0001)) + 0.05;
              if (v108 <= 0.2) {
                float v108 = 0.6;
              }
              *a9 = result * v108;
              float result = v108 * *a10;
            }
          }
          else
          {
            __src[196] = 0;
            __src[206] = 0;
            if (v97 && !v98)
            {
              unsigned int v99 = __src[197] + 1;
              __src[197] = v99;
              __src[198] = 1;
              if (*(unsigned char *)(a5 + 164))
              {
                float result = (float)((float)((float)__src[200]
                                       / (float)((float)__src[130] + 0.0001))
                               * (float)(1.0
                                       - (float)((float)__src[199]
                                               / (float)((float)*(unsigned int *)(a5 + 160)
                                                       + (float)__src[201]))))
                       * (float)*(unsigned int *)(a5 + 168);
                __src[201] = vcvtps_s32_f32(result);
              }
              else
              {
                __src[201] = 0;
              }
              goto LABEL_134;
            }
            unsigned int v99 = 0;
            *(void *)(__src + 197) = 0;
            *a9 = v96;
          }
          *a10 = result;
LABEL_134:
          unsigned int v109 = __src[201] + *(_DWORD *)(a5 + 160);
          int v110 = __src[198];
          if (v99 < v109 && v110)
          {
            *(_DWORD *)a9 = __src[5];
            float result = *((float *)__src + 6);
            *a10 = result;
            int v110 = __src[198];
          }
          if (v99 < v109 && v110)
          {
            float v111 = 0.0;
            if ((float)((float)(*a9 * *a10) / (float)((float)(a8 * a7) + 0.0001)) > 0.1) {
              float v111 = 0.5;
            }
            *int v19 = (float)((float)(v111 * (float)(*((float *)__src + 3) + (float)(*((float *)__src + 5) * 0.5)))
                         + (float)((float)(1.0 - v111)
                                 * (float)(*((float *)__dst + 3) + (float)(*((float *)__dst + 5) * 0.5))))
                 - (float)(*a9 * 0.5);
            float result = (float)((float)(v111 * (float)(*((float *)__src + 4) + (float)(*((float *)__src + 6) * 0.5)))
                           + (float)((float)(1.0 - v111)
                                   * (float)(*((float *)__dst + 4) + (float)(*((float *)__dst + 6) * 0.5))))
                   - (float)(*a10 * 0.5);
            *int v20 = result;
          }
          return result;
        }
      }
      unsigned int v78 = __src[204];
      if (v78)
      {
        if (v78 >= __src[205]) {
          goto LABEL_79;
        }
      }
      else
      {
        __src[205] = 5;
      }
      int v112 = *((_DWORD *)__dst + 7);
      int v113 = a7;
      long long v114 = *(_OWORD *)v30;
      unsigned int v95 = a8;
      memcpy(__dst, __src, 0x200uLL);
      a7 = v113;
      a8 = v95;
      int v20 = a12;
      int v19 = a11;
      *(_OWORD *)uint64_t v30 = v114;
      *((_DWORD *)__dst + 7) = v112;
      ++__src[204];
      if (!a4) {
        goto LABEL_104;
      }
      goto LABEL_80;
    case 1:
      float v34 = 0.03;
      break;
    case 9:
      *a9 = *((float *)__dst + 5);
      float result = *((float *)__dst + 6);
      *a10 = result;
      float v34 = 0.1;
      break;
    default:
      return result;
  }
  float v46 = v34;
  float v48 = *((float *)__dst + 3);
  float v47 = *((float *)__dst + 4);
  float v49 = *((float *)__dst + 5);
  float v50 = *((float *)__dst + 6);
  float v51 = v48 + v49;
  float v52 = v47 + v50;
  float v54 = *((float *)__src + 3);
  float v53 = *((float *)__src + 4);
  float v55 = *((float *)__src + 5);
  float v56 = v53 + *((float *)__src + 6);
  BOOL v57 = (float)(vabds_f32(v48, v54) / v49) <= v34;
  BOOL v58 = (float)(vabds_f32(v48 + v49, v54 + v55) / v49) <= v46;
  BOOL v59 = (float)(vabds_f32(v47, v53) / v50) > v46;
  float v60 = vabds_f32(v47 + v50, v56) / v50;
  BOOL v61 = !v59 && v57;
  int v62 = !v59 && v58;
  if (v60 > v46)
  {
    BOOL v57 = 0;
    BOOL v58 = 0;
  }
  if ((v62 + v61 + v57 + v58) >= 2)
  {
    float v63 = v48 - v54;
    float v64 = v51 - (float)(v54 + v55);
    float v65 = v47 - v53;
    float v66 = v52 - v56;
    float v67 = v65 * v65;
    float v68 = sqrtf(v67 + (float)(v63 * v63));
    float v69 = sqrtf(v67 + (float)(v64 * v64));
    float v70 = v66 * v66;
    float v71 = (float)(v66 * v66) + (float)(v63 * v63);
    float v72 = 3.4028e38;
    if (v68 < 3.4028e38)
    {
      int v62 = 0;
      BOOL v57 = 0;
      BOOL v58 = 0;
      LOBYTE(v61) = 1;
      float v72 = v68;
    }
    float v73 = v70 + (float)(v64 * v64);
    float v74 = sqrtf(v71);
    if (v69 < v72)
    {
      LOBYTE(v61) = 0;
      BOOL v57 = 0;
      BOOL v58 = 0;
      int v62 = 1;
      float v72 = v69;
    }
    float v75 = sqrtf(v73);
    if (v74 < v72)
    {
      LOBYTE(v61) = 0;
      int v62 = 0;
      BOOL v58 = 0;
      BOOL v57 = 1;
      float v72 = v74;
    }
    if (v75 < v72)
    {
      LOBYTE(v61) = 0;
      int v62 = 0;
      BOOL v57 = 0;
      BOOL v58 = 1;
    }
  }
  if (v33 == 9) {
    unsigned int v76 = 5;
  }
  else {
    unsigned int v76 = *(_DWORD *)(a5 + 184);
  }
  if (__src[130] % v76) {
    float result = *((float *)__src + 6);
  }
  else {
    float v55 = *a9;
  }
  if (!v61)
  {
    if (v62)
    {
      *uint64_t v30 = v51 - v55;
    }
    else
    {
      if (v58)
      {
        float v77 = v52 - result;
        *((float *)__dst + 3) = v51 - v55;
      }
      else
      {
        if (!v57) {
          return result;
        }
        float v77 = v52 - result;
      }
      *((float *)__dst + 4) = v77;
    }
  }
  *((float *)__dst + 5) = v55;
  *((float *)__dst + 6) = result;
  *a9 = v55;
  *a10 = result;
  return result;
}

uint64_t acTrkTermClassIndex(unsigned int a1)
{
  if (a1 < 9 && ((0x13Fu >> a1) & 1) != 0) {
    return dword_246D9F220[a1];
  }
  if ((a1 & 0xFFFFFFFE) == 0xA) {
    return 6;
  }
  return 5;
}

BOOL acTrkCheckBoxCornerNearImageBoundary(unsigned int a1, unsigned int a2, float a3, float a4, float a5, float a6)
{
  uint64_t v6 = 1;
  if (a3 >= 0.0 && a4 >= 0.0 && (float)((float)(a3 + a5) - (float)a2) <= 0.0) {
    return (float)((float)(a4 + a6) - (float)a1) > 0.0;
  }
  return v6;
}

uint64_t acTrkFacialAttrTemporalSmoothing(uint64_t result, uint64_t a2, int a3, uint64_t a4, unsigned int a5, unsigned int a6, float a7)
{
  int v7 = *(_DWORD *)(a2 + 8);
  if (!v7)
  {
    long long v63 = *(_OWORD *)(a2 + 12);
    int v13 = *(_DWORD *)(a2 + 40);
    int v14 = *(unsigned __int8 *)(a2 + 100);
    uint64_t v15 = *(unsigned int *)(result + 780);
    if (v15) {
      unsigned int v16 = v15 - 1;
    }
    else {
      unsigned int v16 = 0;
    }
    if (!*(unsigned char *)(a2 + 100))
    {
      uint64_t v33 = result + 40 * v16;
      int v34 = *(_DWORD *)(v33 + 556);
      int v18 = *(_DWORD *)(v33 + 564);
      goto LABEL_86;
    }
    int v17 = *(_DWORD *)(a2 + 44);
    int v18 = *(_DWORD *)(a2 + 420);
    if (*(_DWORD *)(result + 788) < (*(_DWORD *)(result + 804) + *(_DWORD *)(a4 + 160))
      && *(_DWORD *)(result + 792) != 0)
    {
      int v14 = 0;
      *(_OWORD *)(result + 132) = 0u;
      *(_DWORD *)(result + 4_Block_object_dispose(&STACK[0x488], 8) = -361;
      *(_DWORD *)(result + 12_Block_object_dispose(&STACK[0x488], 8) = -1;
      *(_DWORD *)(result + 392) = -1;
      *(_DWORD *)(result + 420) = -1;
      *(void *)(result + 424) = 0;
      *(void *)(result + 440) = 0;
      *(void *)(result + 432) = 0;
      *(int32x4_t *)(result + 32) = vdupq_n_s32(0xFFFFFE97);
      *(_OWORD *)(result + 52) = 0u;
      *(_OWORD *)(result + 6_Block_object_dispose(&STACK[0x488], 8) = 0u;
      *(_OWORD *)(result + 84) = 0u;
      *(_OWORD *)(result + 100) = 0u;
      *(_OWORD *)(result + 112) = 0u;
      *(_OWORD *)(result + 14_Block_object_dispose(&STACK[0x488], 8) = 0u;
      *(_OWORD *)(result + 164) = 0u;
      *(_OWORD *)(result + 180) = 0u;
      *(_OWORD *)(result + 196) = 0u;
      *(_OWORD *)(result + 212) = 0u;
      *(_OWORD *)(result + 22_Block_object_dispose(&STACK[0x488], 8) = 0u;
      *(_OWORD *)(result + 244) = 0u;
      *(_OWORD *)(result + 260) = 0u;
      *(_OWORD *)(result + 276) = 0u;
      *(_OWORD *)(result + 292) = 0u;
      *(_OWORD *)(result + 30_Block_object_dispose(&STACK[0x488], 8) = 0u;
      *(_OWORD *)(result + 324) = 0u;
      *(_OWORD *)(result + 340) = 0u;
      *(_OWORD *)(result + 356) = 0u;
      *(_OWORD *)(result + 372) = 0u;
      *(_DWORD *)(result + 38_Block_object_dispose(&STACK[0x488], 8) = 0;
      *(void *)(result + 404) = 0;
      *(void *)(result + 412) = 0;
      *(void *)(result + 396) = 0;
      *(_OWORD *)(result + 452) = 0u;
      *(_OWORD *)(result + 46_Block_object_dispose(&STACK[0x488], 8) = 0u;
      *(_OWORD *)(result + 484) = 0u;
      *(_OWORD *)(result + 496) = 0u;
    }
    if (*(float *)(a4 + 44) >= a7 && *(unsigned char *)(result + 40 * v16 + 548))
    {
      char v20 = *(unsigned char *)(a2 + 100) != 0;
      int v21 = *(_DWORD *)(a2 + 40);
      char v22 = v21 < 0x5B;
      char v23 = (v21 - 270) < 0x5B;
      float v24 = (float)v21;
      uint64_t v25 = *(unsigned int *)(a4 + 40);
      if (v25)
      {
        if (v15 >= (int)v25 - 1) {
          int v26 = v25 - 1;
        }
        else {
          int v26 = v15;
        }
        unsigned int v27 = v26 + 1;
        unsigned int v28 = v26 + 2;
        uint64_t v29 = v15;
        while (v29)
        {
          uint64_t v30 = result + 40 * --v29;
          v20 &= *(unsigned char *)(v30 + 548);
          LODWORD(v30) = *(_DWORD *)(v30 + 552);
          v22 &= v30 < 0x5B;
          v23 &= (v30 - 270) < 0x5B;
          float v24 = v24 + (float)(int)v30;
          if (!--v25)
          {
            unsigned int v27 = v28;
            break;
          }
        }
      }
      else
      {
        unsigned int v27 = 1;
      }
      if ((v20 & 1) != 0 && (v23 & 1) + (v22 & 1) == 1)
      {
        int v35 = (int)(float)(v24 / (float)v27);
        *(_DWORD *)(result + 40) = v35;
        if (v35 >= 0x5B) {
          v35 -= 360;
        }
        if (v35 >= 90) {
          int v35 = 90;
        }
        if (v35 <= -90) {
          int v35 = -90;
        }
        unsigned int v36 = (int)(float)((float)((float)(v35 + 90) / 45.0) + 0.5) % 5;
        if (v36 > 0xFFFFFFFA) {
          v36 += 5;
        }
        *(_DWORD *)(result + 32) = AcDetNode::m_kFacePoseYawCenters[v36];
      }
    }
    uint64_t v37 = result + 40 * v16;
    int v38 = *(_DWORD *)(v37 + 556);
    if (!v14)
    {
      *(_DWORD *)(result + 420) = -1;
      int v18 = *(_DWORD *)(result + 40 * v16 + 564);
      int v34 = v38;
      goto LABEL_86;
    }
    if (v38 != -361)
    {
      if (v17 > 500)
      {
        int v34 = *(_DWORD *)(v37 + 556);
        if (v38 < 500)
        {
LABEL_61:
          if ((-858993459 * *(_DWORD *)(result + 784)) < 0x33333334 || a3 == -361) {
            int v45 = v34;
          }
          else {
            int v45 = a3;
          }
          *(_DWORD *)(result + 44) = v45;
          if (*(_DWORD *)(result + 28) >= 2u)
          {
            uint64_t v46 = result + 40 * v16;
            float v47 = (float)(*(float *)(v46 + 540) / (float)a6) * (float)(*(float *)(v46 + 544) / (float)a5);
            int v48 = *(_DWORD *)(v46 + 552);
            if (v48 >= 91) {
              int v48 = 360 - v48;
            }
            int v49 = *(_DWORD *)(v46 + 560);
            int v50 = 360 - v49;
            if (v49 < 61) {
              int v50 = *(_DWORD *)(v46 + 560);
            }
            int v51 = *(_DWORD *)(v46 + 564);
            if (v47 > 0.0013021 && v48 <= 29 && v50 < 25)
            {
              if (fabsf((float)v51 + 1.0) > 0.0001)
              {
                float v54 = (float)*(int *)(a2 + 420) * 0.1;
                float v55 = v54 + (float)((float)v51 * 0.9);
                float v56 = *(float *)(result + 1696);
                if (fabsf(v56) >= 0.0001 || fabsf(*(float *)(result + 1700)) >= 0.0001)
                {
                  if (v55 >= (float)(v56 + 0.16))
                  {
                    float v60 = v54 + (float)((float)(v56 + 0.16) * 0.9);
                    float v59 = *(float *)(result + 1700);
                  }
                  else
                  {
                    float v59 = *(float *)(result + 1700);
                    float v60 = -1.0;
                    if (v55 <= (float)(v59 + -0.16)) {
                      float v60 = v54 + (float)((float)(v59 + -0.16) * 0.9);
                    }
                  }
                  if (v60 <= 1.0001 && v60 >= -0.0001) {
                    float v55 = v60;
                  }
                  if (v56 >= v55) {
                    float v56 = v55;
                  }
                  *(float *)(result + 1696) = v56;
                  if (v59 >= v55) {
                    float v62 = v59;
                  }
                  else {
                    float v62 = v55;
                  }
                  *(float *)(result + 1700) = v62;
                }
                else
                {
                  *(float *)(result + 1696) = v55;
                  *(float *)(result + 1700) = v55;
                }
                int v18 = (int)v55;
                *(_DWORD *)(result + 420) = (int)v55;
              }
              goto LABEL_86;
            }
            goto LABEL_85;
          }
          int v51 = *(_DWORD *)(result + 40 * v16 + 564);
          if (fabsf((float)v51 + 1.0) > 0.0001)
          {
LABEL_85:
            *(_DWORD *)(result + 420) = v51;
            int v18 = v51;
          }
LABEL_86:
          if (*(_DWORD *)(result + 8) == 9)
          {
            *(_OWORD *)(result + 532) = v63;
            *(unsigned char *)(result + 54_Block_object_dispose(&STACK[0x488], 8) = v14;
            *(_DWORD *)(result + 564) = v18;
            *(_DWORD *)(result + 556) = v34;
            *(_DWORD *)(result + 552) = v13;
            *(_DWORD *)(result + 56_Block_object_dispose(&STACK[0x488], 8) = 0;
            goto LABEL_88;
          }
          if (v15 >= 6)
          {
            *(_OWORD *)(result + 732) = v63;
            *(unsigned char *)(result + 74_Block_object_dispose(&STACK[0x488], 8) = v14;
            *(_DWORD *)(result + 764) = v18;
            *(_DWORD *)(result + 756) = v34;
            *(_DWORD *)(result + 752) = v13;
            *(_DWORD *)(result + 76_Block_object_dispose(&STACK[0x488], 8) = 0;
            return result;
          }
          uint64_t v58 = result + 40 * v15;
          *(_OWORD *)(v58 + 532) = v63;
          *(unsigned char *)(v58 + 54_Block_object_dispose(&STACK[0x488], 8) = v14;
          *(_DWORD *)(v58 + 564) = v18;
          *(_DWORD *)(v58 + 556) = v34;
          *(_DWORD *)(v58 + 552) = v13;
          *(_DWORD *)(v58 + 56_Block_object_dispose(&STACK[0x488], 8) = 0;
LABEL_92:
          int v57 = *(_DWORD *)(result + 780) + 1;
          goto LABEL_93;
        }
      }
      if (v17 >= 500 || v38 <= 500)
      {
        int v39 = v38 - 1080;
        if (v38 <= 500) {
          int v39 = v38;
        }
        int v40 = v39 + 360;
        if ((float)((float)v39 + 0.0001) >= 0.0) {
          int v40 = v39;
        }
        int v34 = v17;
        if ((v40 - 121) <= 0x76)
        {
          int v41 = v17 - 1080;
          if (v38 <= 500) {
            int v41 = v17;
          }
          if ((float)((float)v41 + 0.0001) < 0.0) {
            v41 += 360;
          }
          int v42 = v41 - v40;
          if (v42 < 11)
          {
            int v43 = v38 - 10;
            if (v42 >= -10) {
              int v34 = v17;
            }
            else {
              int v34 = v43;
            }
          }
          else
          {
            int v34 = v38 + 10;
          }
        }
        goto LABEL_61;
      }
    }
    int v34 = v17;
    goto LABEL_61;
  }
  int v8 = (_OWORD *)(a2 + 12);
  int v9 = *(_DWORD *)(a2 + 40);
  int v10 = *(_DWORD *)(a2 + 44);
  char v11 = *(unsigned char *)(a2 + 100);
  int v12 = *(_DWORD *)(a2 + 420);
  if (*(_DWORD *)(result + 8) != 9)
  {
    unsigned int v31 = *(_DWORD *)(result + 780);
    if (v31 >= 6)
    {
      *(_OWORD *)(result + 732) = *v8;
      *(unsigned char *)(result + 74_Block_object_dispose(&STACK[0x488], 8) = v11;
      *(_DWORD *)(result + 764) = v12;
      *(_DWORD *)(result + 756) = v10;
      *(_DWORD *)(result + 752) = v9;
      *(_DWORD *)(result + 76_Block_object_dispose(&STACK[0x488], 8) = v7;
      return result;
    }
    uint64_t v32 = result + 40 * v31;
    *(_OWORD *)(v32 + 532) = *v8;
    *(unsigned char *)(v32 + 54_Block_object_dispose(&STACK[0x488], 8) = v11;
    *(_DWORD *)(v32 + 564) = v12;
    *(_DWORD *)(v32 + 556) = v10;
    *(_DWORD *)(v32 + 552) = v9;
    *(_DWORD *)(v32 + 56_Block_object_dispose(&STACK[0x488], 8) = v7;
    goto LABEL_92;
  }
  *(_OWORD *)(result + 532) = *v8;
  *(unsigned char *)(result + 54_Block_object_dispose(&STACK[0x488], 8) = v11;
  *(_DWORD *)(result + 564) = v12;
  *(_DWORD *)(result + 556) = v10;
  *(_DWORD *)(result + 552) = v9;
  *(_DWORD *)(result + 56_Block_object_dispose(&STACK[0x488], 8) = v7;
LABEL_88:
  int v57 = 1;
LABEL_93:
  *(_DWORD *)(result + 780) = v57;
  return result;
}

uint64_t acTrkObjectAssocTrkDetGetTempBuffers(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4 = 12 * a1;
  int v5 = 4 * a1;
  int v6 = (4 * a1) | 3;
  int v7 = a1 * a1 + 12 * a1 + 4 * a1 * a1 + v6 + 2 * (v6 + a1) + 9;
  int v8 = 4 * a1 * a1;
  int v9 = 8 * a1;
  int v10 = a1 << 9;
  if (a2)
  {
    uint64_t v11 = a2 + 3;
    unint64_t v12 = (a2 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    int v13 = v5 - a2;
    *(void *)a4 = v12;
    *(void *)(a4 + _Block_object_dispose(&STACK[0x488], 8) = (a2 + 3 + (v12 + v5 - a2)) & 0xFFFFFFFFFFFFFFFCLL;
    *(_DWORD *)(a4 + 32) = v7;
    *(void *)(a4 + 16) = (a2 + 3 + ((v12 + v5 + 3) & 0xFFFFFFFC) + v8 - a2) & 0xFFFFFFFFFFFFFFFCLL;
    *(void *)(a4 + 24) = a2 + ((((v12 + v5 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v8 - a2;
    *(void *)(a4 + 40) = (a2
                          + 3
                          + v7
                          + ((((v12 + v5 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC)
                          + v8
                          - a2) & 0xFFFFFFFFFFFFFFFCLL;
    *(_DWORD *)(a4 + 4_Block_object_dispose(&STACK[0x488], 8) = a1 & 0x3FFFFFFF;
    *(void *)(a4 + 56) = (a2
                          + 3
                          + ((v7 + ((((v12 + v5 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC)
                          + v5
                          - a2) & 0xFFFFFFFFFFFFFFFCLL;
    *(void *)(a4 + 64) = (a2
                          + 3
                          + ((((v7 + ((((v12 + v5 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC)
                            + v5
                            + 3) & 0xFFFFFFFC)
                          + v9
                          - a2) & 0xFFFFFFFFFFFFFFFCLL;
    int v14 = a1 - a2;
    *(void *)(a4 + 72) = (a2
                          + 3
                          + ((((((v7 + ((((v12 + v5 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC)
                              + v5
                              + 3) & 0xFFFFFFFC)
                            + v9
                            + 3) & 0xFFFFFFFC)
                          + v4
                          - a2) & 0xFFFFFFFFFFFFFFFCLL;
    *(void *)(a4 + 80) = a2
                         + ((((((((v7 + ((((v12 + v5 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC)
                               + v5
                               + 3) & 0xFFFFFFFC)
                             + v9
                             + 3) & 0xFFFFFFFC)
                           + v4
                           + 3) & 0xFFFFFFFC)
                         + v5
                         - a2;
    int v15 = 32 * a1 - a2;
    *(void *)(a4 + 8_Block_object_dispose(&STACK[0x488], 8) = a2
                         + a1
                         - a2
                         + ((((((((v7 + ((((v12 + v5 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC)
                               + v5
                               + 3) & 0xFFFFFFFC)
                             + v9
                             + 3) & 0xFFFFFFFC)
                           + v4
                           + 3) & 0xFFFFFFFC)
                         + v5;
    *(void *)(a4 + 96) = (a2
                          + 3
                          + a1
                          - a2
                          + a1
                          + ((((((((v7 + ((((v12 + v5 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC)
                                + v5
                                + 3) & 0xFFFFFFFC)
                              + v9
                              + 3) & 0xFFFFFFFC)
                            + v4
                            + 3) & 0xFFFFFFFC)
                          + v5) & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v16 = (a2
         + 3
         + ((a1
           + a1
           + ((((((((v7 + ((((v12 + v5 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC)
                 + v5
                 + 3) & 0xFFFFFFFC)
               + v9
               + 3) & 0xFFFFFFFC)
             + v4
             + 3) & 0xFFFFFFFC)
           + v5
           + 3) & 0xFFFFFFFC)
         + v15) & 0xFFFFFFFFFFFFFFFCLL;
    uint64_t v17 = a2 + (v16 + v15);
    *(_DWORD *)(a4 + 120) = a1;
    *(void *)(a4 + 104) = v16;
    *(void *)(a4 + 112) = v17;
    unint64_t v18 = (a2 + 3 + (a1 - a2 + v17)) & 0xFFFFFFFFFFFFFFFCLL;
    *(void *)(a4 + 12_Block_object_dispose(&STACK[0x488], 8) = v18;
    *(void *)(a4 + 136) = (a2 + 3 + (v18 + v5 - a2)) & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v19 = (a2 + 3 + ((v18 + v5 + 3) & 0xFFFFFFFC) + v8 - a2) & 0xFFFFFFFFFFFFFFFCLL;
    *(_DWORD *)(a4 + 160) = v7;
    *(void *)(a4 + 144) = v19;
    *(void *)(a4 + 152) = a2 + (v19 + v8 - a2);
    unint64_t v20 = (a2 + 3 + (v7 - a2 + v19 + v8)) & 0xFFFFFFFFFFFFFFFCLL;
    *(void *)(a4 + 16_Block_object_dispose(&STACK[0x488], 8) = v20;
    *(_DWORD *)(a4 + 176) = a1 & 0x3FFFFFFF;
    unint64_t v21 = (a2 + 3 + (v20 + v5 - a2)) & 0xFFFFFFFFFFFFFFFCLL;
    *(void *)(a4 + 184) = v21;
    *(void *)(a4 + 192) = (a2 + 3 + (v21 + v5 - a2)) & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v22 = (a2 + 3 + ((v21 + v5 + 3) & 0xFFFFFFFC) + v5 - a2) & 0xFFFFFFFFFFFFFFFCLL;
    *(void *)(a4 + 200) = v22;
    *(void *)(a4 + 20_Block_object_dispose(&STACK[0x488], 8) = (a2 + 3 + (v22 + v10 - a2)) & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v23 = (a2 + 3 + ((v22 + v10 + 3) & 0xFFFFFFFC) + v5 - a2) & 0xFFFFFFFFFFFFFFFCLL;
    *(_DWORD *)(a4 + 24_Block_object_dispose(&STACK[0x488], 8) = v7;
    *(void *)(a4 + 232) = (a2 + 3 + (v23 + v8 - a2)) & 0xFFFFFFFFFFFFFFFCLL;
    *(void *)(a4 + 240) = a2 + ((v23 + v8 + 3) & 0xFFFFFFFC) + v8 - a2;
    *(void *)(a4 + 256) = (a2 + 3 + v7 - a2 + ((v23 + v8 + 3) & 0xFFFFFFFC) + v8) & 0xFFFFFFFFFFFFFFFCLL;
    *(_DWORD *)(a4 + 264) = a1 & 0x3FFFFFFF;
    *(void *)(a4 + 272) = (a2
                           + 3
                           + ((v7 + ((v23 + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC)
                           + v5
                           - a2) & 0xFFFFFFFFFFFFFFFCLL;
    *(void *)(a4 + 280) = (a2
                           + 3
                           + ((((v7 + ((v23 + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v5 + 3) & 0xFFFFFFFC)
                           + v5
                           - a2) & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v24 = (a2
         + 3
         + ((((((v7 + ((v23 + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v5 + 3) & 0xFFFFFFFC) + v5 + 3) & 0xFFFFFFFC)
         + v5
         - a2) & 0xFFFFFFFFFFFFFFFCLL;
    uint64_t v25 = a2
        + ((((((((v7 + ((v23 + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v5 + 3) & 0xFFFFFFFC) + v5 + 3) & 0xFFFFFFFC)
          + v5
          + 3) & 0xFFFFFFFC)
        + v5
        - a2;
    *(void *)(a4 + 28_Block_object_dispose(&STACK[0x488], 8) = v24;
    *(void *)(a4 + 296) = v25;
    unint64_t v26 = (v11 + (v14 + v25)) & 0xFFFFFFFFFFFFFFFCLL;
    *(void *)(a4 + 216) = v26;
    *(void *)(a4 + 224) = v23;
    *(void *)(a4 + 304) = (v11 + (v26 + v13)) & 0xFFFFFFFFFFFFFFFCLL;
  }
  return (v10 | 0x112) + (a1 << 6) + v4 + v9 - v6 + 8 * v6 + v5 + 6 * ((v8 | 3u) + v6) + 3 * v7;
}

uint64_t acTrkObjectAssocTrkDetTempBytes(int a1)
{
  int v1 = (4 * a1) | 3;
  return (3 * (a1 * a1 + 12 * a1 + 4 * a1 * a1 + v1 + 2 * (v1 + a1))
                      + 600 * a1
                      - v1
                      + 8 * v1
                      + 6 * (v1 + 4 * a1 * a1)
                      + 319);
}

float acTrkObjectPriority(unsigned int a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned int *)(a3 + 8);
  float v4 = 2.0;
  if (v3) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = *(unsigned char *)(a3 + 100) == 0;
  }
  if (!v5) {
    float v4 = flt_246D9F1D4[v3];
  }
  return (float)(1.0 - (float)((float)(*(float *)(a3 + 20) * *(float *)(a3 + 24)) / (float)((float)a1 * (float)a2)))
       + v4;
}

const unsigned int *acTrkObectSurplusExchange(const unsigned int *a1, unsigned int *a2)
{
  unsigned int v4 = a1[1];
  float result = a1 + 1;
  unsigned int v3 = v4;
  unsigned int v7 = a2[1];
  BOOL v5 = a2 + 1;
  unsigned int v6 = v7;
  unsigned int v8 = result[1];
  unsigned int v9 = v5[1];
  if (v3 < v7 && v8 > v9)
  {
    unint64_t v12 = v5 + 1;
    goto LABEL_11;
  }
  if (v3 > v6 && v8 < v9)
  {
    unsigned int v3 = result[1];
    unint64_t v12 = v5;
    ++result;
    ++v5;
LABEL_11:
    unsigned int *v12 = v6 - v3 + v9;
    *BOOL v5 = *result;
  }
  return result;
}

uint64_t acTrkObjectPickDet(unsigned int a1, unsigned int a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6, int a7, uint64_t a8, unsigned int *a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, char a14, unsigned int a15)
{
  v96[4] = *MEMORY[0x263EF8340];
  LODWORD(v19) = *a9;
  if (*a9)
  {
    unint64_t v19 = 0;
    unint64_t v20 = (float *)(a10 + 8);
    do
    {
      uint64_t v22 = *(unsigned int *)(a8 + 4 * v19);
      uint64_t v23 = a6 + (v22 << 9);
      if (*(_DWORD *)(v23 + 28) < 2u)
      {
        float v21 = 100.0;
      }
      else
      {
        uint64_t v24 = *(unsigned int *)(v23 + 8);
        float v25 = 2.0;
        if (v24) {
          BOOL v26 = 0;
        }
        else {
          BOOL v26 = *(unsigned char *)(v23 + 100) == 0;
        }
        if (!v26) {
          float v25 = flt_246D9F1D4[v24];
        }
        float v21 = (float)(1.0
                    - (float)((float)(*(float *)(v23 + 20) * *(float *)(v23 + 24)) / (float)((float)a1 * (float)a2)))
            + v25;
      }
      *((_DWORD *)v20 - 2) = v22;
      *(v20 - 1) = *(float *)(a12 + 4 * v22);
      *unint64_t v20 = v21;
      v20 += 3;
      ++v19;
    }
    while (v19 < *a9);
  }
  if (a7)
  {
    uint64_t v27 = 0;
    unsigned int v28 = (float *)(a6 + 100);
    do
    {
      if (*(_DWORD *)(a12 + 4 * v27) != -1)
      {
        uint64_t v31 = *((unsigned int *)v28 - 23);
        float v32 = 2.0;
        if (v31) {
          BOOL v33 = 0;
        }
        else {
          BOOL v33 = *(unsigned char *)v28 == 0;
        }
        if (!v33) {
          float v32 = flt_246D9F1D4[v31];
        }
        float v29 = 1.0 - (float)((float)(*(v28 - 20) * *(v28 - 19)) / (float)((float)a1 * (float)a2));
        uint64_t v30 = a10 + 12 * v19;
        *(_DWORD *)uint64_t v30 = v27;
        *(_DWORD *)(v30 + 4) = *(_DWORD *)(a12 + 4 * v27);
        *(float *)(v30 + _Block_object_dispose(&STACK[0x488], 8) = v29 + v32;
        LODWORD(v19) = v19 + 1;
      }
      ++v27;
      v28 += 128;
    }
    while (a7 != v27);
  }
  uint64_t v34 = v19;
  uint64_t result = bmHeapsort(a10, v19, 0xCuLL, (int (*)(uint64_t, uint64_t))sub_246D7F620);
  if (a14)
  {
    if (v34)
    {
      unsigned int v36 = 0;
      unsigned int v37 = 0;
      int v38 = (_DWORD *)(a10 + 4);
      uint64_t v39 = v34;
      do
      {
        uint64_t v40 = *(v38 - 1);
        if (!*(_DWORD *)(a6 + (v40 << 9) + 8))
        {
          ++v37;
          if (*v38 == -1)
          {
            uint64_t v41 = a6 + (v40 << 9);
            if (*(unsigned char *)(v41 + 100) && v36 <= 0x1C) {
              dword_2691E43D0[v36++] = *(float *)(v41 + 24) * *(float *)(v41 + 20);
            }
          }
        }
        v38 += 3;
        --v39;
      }
      while (v39);
    }
    else
    {
      unsigned int v37 = 0;
      unsigned int v36 = 0;
    }
    if (!a4) {
      goto LABEL_53;
    }
    unsigned int v43 = 0;
    int v44 = 0;
    int v45 = (float *)(a3 + 24);
    unint64_t v46 = 1;
    do
    {
      if (!*((_DWORD *)v45 - 4))
      {
        ++v44;
        float v47 = &flt_2691E4448[2 * v43];
        *float v47 = *v45 * *(v45 - 1);
        ++v43;
        *((_DWORD *)v47 + 1) = v46 - 1;
      }
      if (v46 >= a4) {
        break;
      }
      ++v46;
      v45 += 431;
    }
    while (v43 < 0x1D);
    if (v44 == 10 && v37 > 0xA && v37 <= 0xF)
    {
      if (v36)
      {
        uint64_t result = bmHeapsort((uint64_t)flt_2691E4448, v43, 8uLL, (int (*)(uint64_t, uint64_t))sub_246D7F60C);
        if (v43)
        {
          unsigned int v48 = v43 - 1;
          if (v43 - 1 >= v36 - 1) {
            unsigned int v48 = v36 - 1;
          }
          uint64_t v49 = v48 + 1;
          unsigned int v50 = v43 - 1;
          int v51 = dword_2691E43D0;
          do
          {
            if (*v51 <= (float)(flt_2691E4448[2 * v50] * (float)a15)) {
              break;
            }
            *(_DWORD *)(a3 + 1724 * LODWORD(flt_2691E4448[2 * v50-- + 1]) + 52_Block_object_dispose(&STACK[0x488], 8) = 2;
            ++v51;
            --v49;
          }
          while (v49);
        }
      }
    }
  }
  if (!a4)
  {
LABEL_53:
    memset((char *)v96 + 4, 0, 24);
    *(_OWORD *)unsigned int v95 = xmmword_246D9F204;
    *(_OWORD *)&v95[12] = *(long long *)((char *)&xmmword_246D9F204 + 12);
    int v53 = a5;
    int v55 = 0;
    int v56 = 0;
    uint64_t v91 = 0;
    uint64_t v92 = 0;
    int v94 = 0;
    uint64_t v93 = 0;
    goto LABEL_54;
  }
  uint64_t v52 = a4;
  int v53 = a5;
  if (a4 == 1)
  {
    uint64_t v54 = 0;
    int v55 = 0;
  }
  else
  {
    int v75 = 0;
    int v76 = 0;
    uint64_t v54 = a4 & 0xFFFFFFFE;
    uint64_t v77 = a3;
    uint64_t v78 = v54;
    do
    {
      if (*(_DWORD *)(v77 + 528) != 2) {
        ++v75;
      }
      if (*(_DWORD *)(v77 + 2252) != 2) {
        ++v76;
      }
      v77 += 3448;
      v78 -= 2;
    }
    while (v78);
    int v55 = v76 + v75;
    if (v54 == a4) {
      goto LABEL_107;
    }
  }
  uint64_t v79 = a4 - v54;
  BOOL v80 = (_DWORD *)(a3 + 1724 * v54 + 528);
  do
  {
    if (*v80 != 2) {
      ++v55;
    }
    v80 += 431;
    --v79;
  }
  while (v79);
LABEL_107:
  int v81 = a5 - v55 - *a9;
  if (v81 < 0)
  {
    unint64_t v82 = 0;
    do
    {
      uint64_t v83 = a3 + 1724 * v82;
      if (*(_DWORD *)(v83 + 528) != 2)
      {
        uint64_t v84 = v34;
        float32x2_t v85 = (int *)(a10 + 4);
        if (v34)
        {
          while (1)
          {
            int v86 = *v85;
            v85 += 3;
            if (v82 == v86) {
              break;
            }
            if (!--v84) {
              goto LABEL_113;
            }
          }
        }
        else
        {
LABEL_113:
          *(_DWORD *)(v83 + 52_Block_object_dispose(&STACK[0x488], 8) = 2;
          ++v81;
          --v55;
        }
      }
      ++v82;
    }
    while (v82 < a4 && v81 < 0);
  }
  int v56 = 0;
  memset(v96, 0, 28);
  *(_OWORD *)unsigned int v95 = xmmword_246D9F204;
  *(_OWORD *)&v95[12] = *(long long *)((char *)&xmmword_246D9F204 + 12);
  uint64_t v91 = 0;
  uint64_t v92 = 0;
  int v94 = 0;
  uint64_t result = 20;
  uint64_t v93 = 0;
  do
  {
    if (*(_DWORD *)(a3 + 528) != 2)
    {
      unsigned int v88 = *(_DWORD *)(a3 + 8);
      uint64_t v89 = 2;
      switch(v88)
      {
        case 0u:
          uint64_t v87 = 0;
          ++v56;
          goto LABEL_118;
        case 1u:
          ++HIDWORD(v96[0]);
          uint64_t v87 = 1;
          goto LABEL_118;
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 8u:
          goto LABEL_122;
        case 9u:
          ++HIDWORD(v96[1]);
          uint64_t v87 = 3;
          goto LABEL_118;
        default:
          if ((v88 & 0xFFFFFFFE) == 0xA) {
            uint64_t v89 = 4;
          }
          else {
            uint64_t v89 = 5;
          }
LABEL_122:
          ++*((_DWORD *)v96 + v89);
          if (v88 > 9) {
            goto LABEL_133;
          }
          if (((1 << v88) & 0x128) != 0 || ((1 << v88) & 0x14) != 0)
          {
            uint64_t v87 = 2;
          }
          else if (v88 == 9)
          {
            uint64_t v87 = 3;
          }
          else
          {
LABEL_133:
            if ((v88 & 0xFFFFFFFE) == 0xA) {
              uint64_t v87 = 4;
            }
            else {
              uint64_t v87 = 5;
            }
          }
LABEL_118:
          ++*((_DWORD *)&v91 + v87);
          break;
      }
    }
    a3 += 1724;
    --v52;
  }
  while (v52);
LABEL_54:
  LODWORD(v96[0]) = v56;
  if (v34)
  {
    int v57 = (_DWORD *)(a10 + 4);
    uint64_t v58 = v34;
    do
    {
      if (*v57 == -1)
      {
        uint64_t v60 = *(unsigned int *)(a6 + ((unint64_t)*(v57 - 1) << 9) + 8);
        if v60 < 0xA && ((0x33Fu >> v60))
        {
          uint64_t v59 = qword_246D9F248[v60];
        }
        else if ((v60 & 0xFFFFFFFE) == 0xA)
        {
          uint64_t v59 = 4;
        }
        else
        {
          uint64_t v59 = 5;
        }
        ++*((_DWORD *)&v91 + v59);
      }
      v57 += 3;
      --v58;
    }
    while (v58);
  }
  int v61 = HIDWORD(v91);
  float v62 = &v95[8];
  if (HIDWORD(v91) <= 7 && v92 > 8)
  {
    float v65 = &v95[8];
    float v62 = &v95[4];
    goto LABEL_77;
  }
  BOOL v64 = HIDWORD(v91) < 9 || v92 > 7;
  int v61 = v92;
  float v65 = &v95[4];
  if (!v64)
  {
LABEL_77:
    *(_DWORD *)float v65 = 16 - v61;
    *(_DWORD *)float v62 = v61;
    unsigned int v66 = 0;
    if (!v34) {
      goto LABEL_95;
    }
    goto LABEL_78;
  }
  unsigned int v66 = 0;
  if (!v34) {
    goto LABEL_95;
  }
LABEL_78:
  unsigned int v67 = v53 - v55;
  uint64_t v68 = v34 - 1;
  float v69 = (unsigned int *)(a6 + 8);
  float v70 = (_DWORD *)(a10 + 4);
  do
  {
    if (*v70 == -1)
    {
      uint64_t v72 = *v69;
      if v72 < 0xA && ((0x33Fu >> v72))
      {
        uint64_t v73 = qword_246D9F248[v72];
      }
      else if ((v72 & 0xFFFFFFFE) == 0xA)
      {
        uint64_t v73 = 4;
      }
      else
      {
        uint64_t v73 = 5;
      }
      unsigned int v74 = *((_DWORD *)v96 + v73);
      if (v74 < *(_DWORD *)&v95[4 * v73])
      {
        *(_DWORD *)(a8 + 4 * v66++) = *(v70 - 1);
        *((_DWORD *)v96 + v73) = v74 + 1;
      }
    }
    LODWORD(result) = *a9;
    if (v67 >= *a9) {
      uint64_t result = result;
    }
    else {
      uint64_t result = v67;
    }
    BOOL v71 = v66 == result || v68-- == 0;
    v69 += 128;
    v70 += 3;
  }
  while (!v71);
LABEL_95:
  *a9 = v66;
  return result;
}

BOOL sub_246D7F60C(float *a1, float *a2)
{
  return *a1 > *a2;
}

BOOL sub_246D7F620(uint64_t a1, uint64_t a2)
{
  return *(float *)(a1 + 8) > *(float *)(a2 + 8);
}

uint64_t acTrkCategoryLimitationIndex(unsigned int a1)
{
  if (a1 < 0xA && ((0x33Fu >> a1) & 1) != 0) {
    return dword_246D9F298[a1];
  }
  if ((a1 & 0xFFFFFFFE) == 0xA) {
    return 4;
  }
  return 5;
}

uint64_t acFilterMultiFaceinSameUbody(uint64_t a1, unsigned int a2, float32x2_t *a3, uint64_t a4, uint64_t a5, unsigned int *a6, float *a7, char *__b, int a9, int a10)
{
  uint64_t result = (uint64_t)memset(__b, 255, 4 * a2);
  if (a2)
  {
    unsigned int v19 = 0;
    unint64_t v20 = (float32x2_t *)(a1 + 20);
    uint64_t v21 = a2;
    do
    {
      if (v20[-2].i32[1] == 1)
      {
        float32x2_t v22 = v20[-1];
        float32x2_t v23 = vadd_f32(v22, *v20);
        float32_t v24 = (float)v20[1].u32[0] / 1000.0;
        float v25 = &a3[4 * v19];
        *float v25 = v22;
        v25[1] = v23;
        ++v19;
        v25[2].i32[0] = 2;
        v25[3].f32[0] = v24;
      }
      unint64_t v20 = (float32x2_t *)((char *)v20 + 1724);
      --v21;
    }
    while (v21);
    if (v19)
    {
      uint64_t v26 = 0;
      while (1)
      {
        uint64_t v27 = 0;
        uint64_t result = 0;
        unsigned int v28 = &a3[4 * v26];
        float v29 = v28 + 1;
        unsigned int v30 = -1;
        do
        {
          uint64_t v31 = a1 + 1724 * v27;
          if (!*(_DWORD *)(v31 + 8))
          {
            uint64_t v32 = 0;
            float32x2_t v33 = *(float32x2_t *)(v31 + 12);
            float32x2_t v34 = vadd_f32(v33, *(float32x2_t *)(v31 + 20));
            float32x2_t v35 = vsub_f32(v34, v33);
            int32x2_t v36 = vcgtz_f32(v35);
            float v37 = v35.f32[1];
            if ((v36.i8[4] & 1) == 0) {
              float v37 = 0.0;
            }
            if ((v36.i8[0] & 1) == 0) {
              v35.f32[0] = 0.0;
            }
            float v38 = v35.f32[0] * v37;
            float v39 = -1.0;
            int v40 = -1;
            uint64_t v41 = a3 + 1;
            do
            {
              float32x2_t v42 = v41[-1];
              float32x2_t v43 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v41, v34), (int8x8_t)v34, (int8x8_t)*v41), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v42, v33), (int8x8_t)v42, (int8x8_t)v33)), 0);
              float v44 = vmul_lane_f32(v43, v43, 1).f32[0];
              float v45 = 0.0;
              if (v44 >= 0.00000011921)
              {
                float32x2_t v46 = vsub_f32(*v41, v42);
                v46.f32[0] = (float)(v38 + (float)(fmaxf(v46.f32[0], 0.0) * fmaxf(v46.f32[1], 0.0))) - v44;
                float v47 = v44 / v46.f32[0];
                if (v46.f32[0] >= 0.00000011921) {
                  float v45 = v47;
                }
                else {
                  float v45 = 0.0;
                }
              }
              if (v45 > v39)
              {
                int v40 = v32;
                float v39 = v45;
              }
              ++v32;
              v41 += 4;
            }
            while (v19 != v32);
            if (v26 == v40)
            {
              float32x2_t v48 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v29, v34), (int8x8_t)v34, (int8x8_t)*v29), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v28, v33), (int8x8_t)*v28, (int8x8_t)v33)), 0);
              float v49 = vmul_lane_f32(v48, v48, 1).f32[0];
              BOOL v50 = v49 < 0.00000011921 || v38 < 0.00000011921;
              float v51 = v49 / v38;
              if (v50) {
                float v51 = 0.0;
              }
              if (v51 > *a7) {
                unsigned int v30 = v27;
              }
              uint64_t result = (v51 > *a7) | result;
            }
          }
          ++v27;
        }
        while (v27 != a2);
        if ((result & 1) == 0) {
          goto LABEL_9;
        }
        unint64_t v52 = *a6;
        uint64_t result = v30;
        if (!v52) {
          break;
        }
        unint64_t v53 = 0;
        unsigned int v54 = 0;
        char v55 = 0;
        int v56 = (_DWORD *)(a1 + 1724 * result + 840);
        do
        {
          uint64_t v57 = *(unsigned int *)(a5 + 4 * v53);
          uint64_t v58 = a4 + (v57 << 9);
          float v60 = *(float *)(v58 + 20);
          uint64_t v59 = (float32x2_t *)(v58 + 20);
          float v61 = v60;
          if (!v59[-2].i32[1]
            && (float)((float)(v61 * v59->f32[1]) / (float)((float)(a10 * a9) + 0.0001)) < 0.08)
          {
            uint64_t v62 = 0;
            float32x2_t v63 = *(float32x2_t *)(a4 + (v57 << 9) + 12);
            float32x2_t v64 = vadd_f32(v63, *v59);
            float32x2_t v65 = vsub_f32(v64, v63);
            int32x2_t v66 = vcgtz_f32(v65);
            float v67 = v65.f32[1];
            if ((v66.i8[4] & 1) == 0) {
              float v67 = 0.0;
            }
            if ((v66.i8[0] & 1) == 0) {
              v65.f32[0] = 0.0;
            }
            float v68 = v65.f32[0] * v67;
            float v69 = -1.0;
            int v70 = -1;
            BOOL v71 = a3 + 1;
            do
            {
              float32x2_t v72 = v71[-1];
              float32x2_t v73 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v71, v64), (int8x8_t)v64, (int8x8_t)*v71), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v72, v63), (int8x8_t)v72, (int8x8_t)v63)), 0);
              float v74 = vmul_lane_f32(v73, v73, 1).f32[0];
              float v75 = 0.0;
              if (v74 >= 0.00000011921)
              {
                float32x2_t v76 = vsub_f32(*v71, v72);
                v76.f32[0] = (float)(v68 + (float)(fmaxf(v76.f32[0], 0.0) * fmaxf(v76.f32[1], 0.0))) - v74;
                float v77 = v74 / v76.f32[0];
                if (v76.f32[0] >= 0.00000011921) {
                  float v75 = v77;
                }
                else {
                  float v75 = 0.0;
                }
              }
              if (v75 > v69)
              {
                int v70 = v62;
                float v69 = v75;
              }
              ++v62;
              v71 += 4;
            }
            while (v19 != v62);
            if (v26 == v70)
            {
              float32x2_t v78 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v29, v64), (int8x8_t)v64, (int8x8_t)*v29), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v28, v63), (int8x8_t)*v28, (int8x8_t)v63)), 0);
              float v79 = vmul_lane_f32(v78, v78, 1).f32[0];
              BOOL v80 = v79 < 0.00000011921 || v68 < 0.00000011921;
              float v81 = v79 / v68;
              if (v80) {
                float v81 = 0.0;
              }
              if (v81 > a7[1] && *v56 <= 1u)
              {
                *(_DWORD *)&__b[4 * v54++] = v53;
                unint64_t v52 = *a6;
                char v55 = 1;
              }
            }
          }
          ++v53;
        }
        while (v53 < v52);
        if ((v55 & 1) == 0) {
          goto LABEL_65;
        }
        ++*v56;
        unsigned int v82 = *a6;
        if (!*a6) {
          goto LABEL_8;
        }
LABEL_66:
        if (v54)
        {
          unint64_t v83 = 0;
          unsigned int v84 = 0;
          uint64_t result = v54;
          while (v54 > 7)
          {
            int64x2_t v87 = vdupq_n_s64(v83);
            int32x4_t v88 = 0uLL;
            uint64_t v89 = __b + 16;
            uint64_t v90 = v54 & 0xFFFFFFF8;
            int32x4_t v91 = 0uLL;
            do
            {
              long long v92 = *((_OWORD *)v89 - 1);
              v93.i64[0] = v92;
              v93.i64[1] = DWORD1(v92);
              int64x2_t v94 = v93;
              v93.i64[0] = DWORD2(v92);
              v93.i64[1] = HIDWORD(v92);
              int64x2_t v95 = v93;
              v93.i64[0] = *(_OWORD *)v89;
              v93.i64[1] = HIDWORD(*(void *)v89);
              int64x2_t v96 = v93;
              v93.i64[0] = *((void *)v89 + 1);
              v93.i64[1] = HIDWORD(*(_OWORD *)v89);
              int32x4_t v88 = vsubq_s32(v88, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v87, v94), (int32x4_t)vceqq_s64(v87, v95))));
              int32x4_t v91 = vsubq_s32(v91, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v87, v96), (int32x4_t)vceqq_s64(v87, v93))));
              v89 += 32;
              v90 -= 8;
            }
            while (v90);
            int v86 = vaddvq_s32(vaddq_s32(v91, v88));
            uint64_t v85 = v54 & 0xFFFFFFF8;
            if (v85 != v54) {
              goto LABEL_74;
            }
LABEL_78:
            if (v86) {
              BOOL v100 = v86 == v54;
            }
            else {
              BOOL v100 = 0;
            }
            if (v100)
            {
              *(_DWORD *)(a5 + 4 * v84++) = *(_DWORD *)(a5 + 4 * v83);
              unsigned int v82 = *a6;
            }
            if (++v83 >= v82) {
              goto LABEL_8;
            }
          }
          uint64_t v85 = 0;
          int v86 = 0;
LABEL_74:
          uint64_t v97 = v54 - v85;
          int v98 = &__b[4 * v85];
          do
          {
            int v99 = *(_DWORD *)v98;
            v98 += 4;
            if (v83 != v99) {
              ++v86;
            }
            --v97;
          }
          while (v97);
          goto LABEL_78;
        }
LABEL_8:
        *a6 = v82 - v54;
LABEL_9:
        if (++v26 == v19) {
          return result;
        }
      }
      unsigned int v54 = 0;
LABEL_65:
      *(_DWORD *)(a1 + 1724 * result + 840) = 0;
      unsigned int v82 = *a6;
      if (!*a6) {
        goto LABEL_8;
      }
      goto LABEL_66;
    }
  }
  return result;
}

unint64_t acTrkObjectAssocTrkDet(int a1, unsigned int a2, uint64_t a3, int a4, unsigned int a5, uint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9, _DWORD *a10, _DWORD *a11, _DWORD *a12, char *a13, unsigned int *a14, float *a15, uint64_t a16, void *a17)
{
  unint64_t v17 = a7;
  LODWORD(v19) = a4;
  float32x2_t v22 = a13;
  if (a5 <= a7) {
    int v23 = a7;
  }
  else {
    int v23 = a5;
  }
  uint64_t v702 = 0;
  long long v700 = 0u;
  long long v701 = 0u;
  long long v698 = 0u;
  long long v699 = 0u;
  long long v696 = 0u;
  long long v697 = 0u;
  *(_OWORD *)v694 = 0u;
  long long v695 = 0u;
  long long v692 = 0u;
  long long v693 = 0u;
  *(_OWORD *)v690 = 0u;
  *(_OWORD *)__b = 0u;
  long long v688 = 0u;
  *(_OWORD *)v689 = 0u;
  long long v686 = 0u;
  long long v687 = 0u;
  long long v684 = 0u;
  long long v685 = 0u;
  long long v683 = 0u;
  unsigned int TempBuffers = acTrkObjectAssocTrkDetGetTempBuffers(v23, (uint64_t)a17, a3, (uint64_t)&v683);
  bzero(a17, TempBuffers);
  uint64_t v25 = v683;
  uint64_t v26 = *((void *)&v686 + 1);
  unsigned int v28 = (int32x4_t *)*((void *)&v687 + 1);
  uint64_t v27 = v687;
  float v29 = __b[0];
  v667 = (char *)v683;
  v661 = (int32x4_t *)*((void *)&v687 + 1);
  *(void *)v664 = v17;
  unsigned int v669 = v19;
  v649 = (void *)v688;
  int v655 = a1;
  if (!v17)
  {
    unsigned int v682 = 0;
    unsigned int v37 = *a14;
    unsigned int v35 = a5;
    if (!(v19 | *a14)) {
      goto LABEL_360;
    }
    BOOL v643 = v19 == 0;
    if (!v19)
    {
      uint64_t v41 = a8;
      float32x2_t v42 = a14;
LABEL_570:
      uint64_t v646 = v27;
      int v681 = v19;
      if (v37)
      {
        unint64_t v475 = 0;
        int32x4_t v476 = vdupq_n_s32(0xFFFFFE97);
        do
        {
          *((_OWORD *)v22 + 30) = 0uLL;
          *((_OWORD *)v22 + 31) = 0uLL;
          *((_OWORD *)v22 + 2_Block_object_dispose(&STACK[0x488], 8) = 0uLL;
          *((_OWORD *)v22 + 29) = 0uLL;
          *((_OWORD *)v22 + 26) = 0uLL;
          *((_OWORD *)v22 + 27) = 0uLL;
          *((_OWORD *)v22 + 24) = 0uLL;
          *((_OWORD *)v22 + 25) = 0uLL;
          *((_OWORD *)v22 + 22) = 0uLL;
          *((_OWORD *)v22 + 23) = 0uLL;
          *((_OWORD *)v22 + 20) = 0uLL;
          *((_OWORD *)v22 + 21) = 0uLL;
          *((_OWORD *)v22 + 1_Block_object_dispose(&STACK[0x488], 8) = 0uLL;
          *((_OWORD *)v22 + 19) = 0uLL;
          *((_OWORD *)v22 + 16) = 0uLL;
          *((_OWORD *)v22 + 17) = 0uLL;
          *((_OWORD *)v22 + 14) = 0uLL;
          *((_OWORD *)v22 + 15) = 0uLL;
          *((_OWORD *)v22 + 12) = 0uLL;
          *((_OWORD *)v22 + 13) = 0uLL;
          *((_OWORD *)v22 + 10) = 0uLL;
          *((_OWORD *)v22 + 11) = 0uLL;
          *((_OWORD *)v22 + _Block_object_dispose(&STACK[0x488], 8) = 0uLL;
          *((_OWORD *)v22 + 9) = 0uLL;
          *((_OWORD *)v22 + 6) = 0uLL;
          *((_OWORD *)v22 + 7) = 0uLL;
          *((_OWORD *)v22 + 4) = 0uLL;
          *((_OWORD *)v22 + 5) = 0uLL;
          *((_OWORD *)v22 + 2) = 0uLL;
          *((_OWORD *)v22 + 3) = 0uLL;
          *(_OWORD *)float32x2_t v22 = 0uLL;
          *((_OWORD *)v22 + 1) = 0uLL;
          *((int32x4_t *)v22 + 2) = v476;
          *((_DWORD *)v22 + 12) = -361;
          *((_DWORD *)v22 + 32) = -1;
          *((_DWORD *)v22 + 9_Block_object_dispose(&STACK[0x488], 8) = -1;
          *((_DWORD *)v22 + 105) = -1;
          *((_DWORD *)v22 + 12_Block_object_dispose(&STACK[0x488], 8) = 0;
          v22[516] = 0;
          ++v475;
          v22 += 520;
        }
        while (v475 < *v42);
      }
      unsigned int v463 = 0;
      unsigned int *v42 = 0;
      goto LABEL_574;
    }
    unsigned int v38 = v19;
    uint64_t v39 = 0;
    LODWORD(v19) = 0;
    uint64_t v40 = 1724 * v38;
    uint64_t v41 = a8;
    float32x2_t v42 = a14;
    while (2)
    {
      uint64_t v48 = a3 + v39;
      *(_DWORD *)(a3 + v39 + 44_Block_object_dispose(&STACK[0x488], 8) = 1;
      unsigned int v49 = *(_DWORD *)(a3 + v39 + 780);
      unsigned int v50 = v49 - 1;
      if (!v49) {
        unsigned int v50 = 0;
      }
      uint64_t v51 = v48 + 40 * v50 + 532;
      uint64_t v43 = *(unsigned int *)(v48 + 8);
      if (v43 == 9)
      {
        long long v52 = *(_OWORD *)v51;
        long long v53 = *(_OWORD *)(v51 + 16);
        *(void *)(v48 + 564) = *(void *)(v51 + 32);
        *(_OWORD *)(v48 + 532) = v52;
        *(_OWORD *)(v48 + 54_Block_object_dispose(&STACK[0x488], 8) = v53;
        *(_DWORD *)(v48 + 780) = 1;
        if (!a6) {
          goto LABEL_24;
        }
        break;
      }
      if (v49 < 6)
      {
        uint64_t v57 = a3 + 40 * v49 + v39 + 532;
        long long v58 = *(_OWORD *)v51;
        long long v59 = *(_OWORD *)(v51 + 16);
        *(void *)(v57 + 32) = *(void *)(v51 + 32);
        *(_OWORD *)uint64_t v57 = v58;
        *(_OWORD *)(v57 + 16) = v59;
        ++*(_DWORD *)(v48 + 780);
        if (!a6)
        {
LABEL_24:
          switch((int)v43)
          {
            case 0:
              if (*(unsigned char *)(a3 + v39 + 100))
              {
                unsigned int v44 = *(_DWORD *)(a8 + 60);
                if (v669 > 2) {
                  unsigned int v44 = 2;
                }
              }
              else
              {
                unsigned int v44 = 2;
              }
              goto LABEL_13;
            case 1:
              goto LABEL_12;
            case 2:
            case 4:
              uint64_t v43 = 2;
              goto LABEL_12;
            case 3:
            case 5:
              uint64_t v43 = 3;
              goto LABEL_12;
            case 8:
              uint64_t v43 = 4;
              goto LABEL_12;
            default:
              if ((v43 & 0xFFFFFFFE) == 0xA) {
                uint64_t v43 = 6;
              }
              else {
                uint64_t v43 = 5;
              }
LABEL_12:
              unsigned int v44 = *(_DWORD *)(a8 + 4 * v43 + 60);
LABEL_13:
              unsigned int v45 = *(_DWORD *)(a3 + v39 + 512);
              BOOL v46 = v45 >= v44;
              if (v45 < v44) {
                int v47 = 1;
              }
              else {
                int v47 = 2;
              }
              if (v46) {
                LODWORD(v19) = v19 + 1;
              }
              *(_DWORD *)(a3 + v39 + 52_Block_object_dispose(&STACK[0x488], 8) = v47;
              v39 += 1724;
              if (v40 != v39) {
                continue;
              }
              unsigned int v37 = *a14;
              break;
          }
          goto LABEL_570;
        }
      }
      else
      {
        uint64_t v54 = a3 + v39 + 732;
        long long v55 = *(_OWORD *)v51;
        long long v56 = *(_OWORD *)(v51 + 16);
        *(void *)(v54 + 32) = *(void *)(v51 + 32);
        *(_OWORD *)uint64_t v54 = v55;
        *(_OWORD *)(v54 + 16) = v56;
        if (!a6) {
          goto LABEL_24;
        }
      }
      break;
    }
    ++*(_DWORD *)(a3 + v39 + 512);
    goto LABEL_24;
  }
  uint64_t v644 = *((void *)&v686 + 1);
  unsigned int v30 = (_DWORD *)*((void *)&v683 + 1);
  uint64_t v31 = (void *)v684;
  uint64_t v32 = __b[1];
  v636 = (unsigned __int8 *)*((void *)&v684 + 1);
  v633 = (unsigned int *)*((void *)&v693 + 1);
  v634 = (void *)v692;
  long long v33 = v695;
  uint64_t v653 = v696;
  uint64_t v646 = v687;
  uint64_t v647 = *((void *)&v696 + 1);
  long long v639 = v697;
  v638 = (unsigned __int8 *)v698;
  uint64_t v34 = v17;
  v640 = (unsigned int *)v699;
  v641 = (unsigned int *)*((void *)&v685 + 1);
  uint64_t v642 = *((void *)&v700 + 1);
  v648 = __b[0];
  memset(__b[0], 255, 4 * v17);
  if (!(v19 | *a14))
  {
    unsigned int v35 = a5;
    if (v17 > 7)
    {
      uint64_t v36 = v17 & 0xFFFFFFF8;
      int32x4_t v244 = (int32x4_t)xmmword_246D9F130;
      uint64_t v25 = (uint64_t)v667;
      v245 = (int32x4_t *)(v667 + 16);
      v246.i64[0] = 0x400000004;
      v246.i64[1] = 0x400000004;
      v247.i64[0] = 0x800000008;
      v247.i64[1] = 0x800000008;
      uint64_t v248 = v36;
      uint64_t v27 = v646;
      float v29 = v648;
      do
      {
        v245[-1] = v244;
        int32x4_t *v245 = vaddq_s32(v244, v246);
        int32x4_t v244 = vaddq_s32(v244, v247);
        v245 += 2;
        v248 -= 8;
      }
      while (v248);
      if (v36 == v17) {
        goto LABEL_360;
      }
    }
    else
    {
      uint64_t v36 = 0;
      uint64_t v25 = (uint64_t)v667;
      uint64_t v27 = v646;
      float v29 = v648;
    }
    do
    {
      *(_DWORD *)(v25 + 4 * v36) = v36;
      ++v36;
    }
    while (v17 != v36);
LABEL_360:
    unsigned int v682 = v17;
    acTrkObjectPickDet(v655, a2, a3, 0, v35, a6, v17, v25, &v682, v27, (uint64_t)v631, (uint64_t)v29, v632, *(unsigned char *)(a8 + 194), *(_DWORD *)(a8 + 196));
    uint64_t v249 = v682;
    if (v682)
    {
      unsigned int v672 = 0;
      unint64_t v250 = 0;
      int32x4_t v676 = vdupq_n_s32(0xFFFFFE97);
      unint64_t v251 = v667;
      do
      {
        unsigned int v293 = *(_DWORD *)(a6 + ((unint64_t)*(unsigned int *)v251 << 9) + 28);
        if (v293 > 1)
        {
          v296 = (_DWORD *)(a3 + 1724 * v250);
          v297 = v251;
          bzero(v296, 0x6BCuLL);
          *((int32x4_t *)v296 + 2) = v676;
          v296[12] = -361;
          v296[32] = -1;
          v296[98] = -1;
          v296[105] = -1;
          *(void *)(v296 + 193) = 0xFF7FFFFFFFFFFFFFLL;
          v296[198] = 0;
          *(void *)(v296 + 207) = 0;
          v296[209] = 0;
          memcpy(v296, (const void *)(a6 + ((unint64_t)*(unsigned int *)v297 << 9)), 0x200uLL);
          unint64_t v251 = v297;
          int v298 = (*a12)++;
          _DWORD *v296 = v298;
          ++v296[130];
          uint64_t v299 = *(unsigned int *)v297;
          v296[131] = LODWORD(a15[v299]);
          float v300 = *((float *)v296 + 5) * *((float *)v296 + 6);
          *((float *)v296 + 207) = v300;
          *((float *)v296 + 20_Block_object_dispose(&STACK[0x488], 8) = v300 / (float)((float)(a2 * v655) + 0.0001);
          uint64_t v301 = a6 + (v299 << 9);
          int v302 = *(_DWORD *)(v301 + 8);
          v303 = (_OWORD *)(v301 + 12);
          int v304 = *(_DWORD *)(v301 + 40);
          int v305 = *(_DWORD *)(v301 + 44);
          char v306 = *(unsigned char *)(v301 + 100);
          int v307 = *(_DWORD *)(v301 + 420);
          if (v296[2] == 9)
          {
            uint64_t v252 = a3 + 1724 * v250;
            *(_OWORD *)(v252 + 532) = *v303;
            *(unsigned char *)(v252 + 54_Block_object_dispose(&STACK[0x488], 8) = v306;
            *(_DWORD *)(v252 + 564) = v307;
            *(_DWORD *)(v252 + 556) = v305;
            *(_DWORD *)(v252 + 552) = v304;
            *(_DWORD *)(v252 + 56_Block_object_dispose(&STACK[0x488], 8) = v302;
            *(_DWORD *)(v252 + 780) = 1;
            unint64_t v253 = a6 + ((unint64_t)*(unsigned int *)v297 << 9);
            long long v254 = *(_OWORD *)(v253 + 212);
            long long v255 = *(_OWORD *)(v253 + 244);
            long long v256 = *(_OWORD *)(v253 + 196);
            *(_OWORD *)(v252 + 976) = *(_OWORD *)(v253 + 228);
            *(_OWORD *)(v252 + 992) = v255;
            *(_OWORD *)(v252 + 944) = v256;
            *(_OWORD *)(v252 + 960) = v254;
            long long v257 = *(_OWORD *)(v253 + 132);
            long long v258 = *(_OWORD *)(v253 + 148);
            long long v259 = *(_OWORD *)(v253 + 180);
            *(_OWORD *)(v252 + 912) = *(_OWORD *)(v253 + 164);
            *(_OWORD *)(v252 + 92_Block_object_dispose(&STACK[0x488], 8) = v259;
            *(_OWORD *)(v252 + 880) = v257;
            *(_OWORD *)(v252 + 896) = v258;
            long long v260 = *(_OWORD *)(v253 + 324);
            long long v261 = *(_OWORD *)(v253 + 340);
            long long v262 = *(_OWORD *)(v253 + 356);
            *(_OWORD *)(v252 + 1120) = *(_OWORD *)(v253 + 372);
            *(_OWORD *)(v252 + 1104) = v262;
            *(_OWORD *)(v252 + 108_Block_object_dispose(&STACK[0x488], 8) = v261;
            *(_OWORD *)(v252 + 1072) = v260;
            long long v263 = *(_OWORD *)(v253 + 260);
            long long v264 = *(_OWORD *)(v253 + 276);
            long long v265 = *(_OWORD *)(v253 + 292);
            *(_OWORD *)(v252 + 1056) = *(_OWORD *)(v253 + 308);
            *(_OWORD *)(v252 + 1040) = v265;
            *(_OWORD *)(v252 + 100_Block_object_dispose(&STACK[0x488], 8) = v263;
            *(_OWORD *)(v252 + 1024) = v264;
            unint64_t v266 = a6 + ((unint64_t)*(unsigned int *)v297 << 9);
            long long v267 = *(_OWORD *)(v266 + 132);
            long long v268 = *(_OWORD *)(v266 + 148);
            long long v269 = *(_OWORD *)(v266 + 164);
            *(_OWORD *)(v252 + 1184) = *(_OWORD *)(v266 + 180);
            *(_OWORD *)(v252 + 116_Block_object_dispose(&STACK[0x488], 8) = v269;
            *(_OWORD *)(v252 + 1152) = v268;
            *(_OWORD *)(v252 + 1136) = v267;
            long long v270 = *(_OWORD *)(v266 + 196);
            long long v271 = *(_OWORD *)(v266 + 212);
            long long v272 = *(_OWORD *)(v266 + 228);
            *(_OWORD *)(v252 + 124_Block_object_dispose(&STACK[0x488], 8) = *(_OWORD *)(v266 + 244);
            *(_OWORD *)(v252 + 1232) = v272;
            *(_OWORD *)(v252 + 1216) = v271;
            *(_OWORD *)(v252 + 1200) = v270;
            long long v273 = *(_OWORD *)(v266 + 260);
            long long v274 = *(_OWORD *)(v266 + 276);
            long long v275 = *(_OWORD *)(v266 + 292);
            *(_OWORD *)(v252 + 1312) = *(_OWORD *)(v266 + 308);
            *(_OWORD *)(v252 + 1296) = v275;
            *(_OWORD *)(v252 + 1280) = v274;
            *(_OWORD *)(v252 + 1264) = v273;
            long long v276 = *(_OWORD *)(v266 + 324);
            long long v277 = *(_OWORD *)(v266 + 340);
            long long v278 = *(_OWORD *)(v266 + 356);
            *(_OWORD *)(v252 + 1376) = *(_OWORD *)(v266 + 372);
            *(_OWORD *)(v252 + 1360) = v278;
            *(_OWORD *)(v252 + 1344) = v277;
            *(_OWORD *)(v252 + 132_Block_object_dispose(&STACK[0x488], 8) = v276;
            unint64_t v279 = a6 + ((unint64_t)*(unsigned int *)v297 << 9);
            long long v280 = *(_OWORD *)(v279 + 132);
            long long v281 = *(_OWORD *)(v279 + 148);
            long long v282 = *(_OWORD *)(v279 + 164);
            *(_OWORD *)(v252 + 1440) = *(_OWORD *)(v279 + 180);
            *(_OWORD *)(v252 + 1424) = v282;
            *(_OWORD *)(v252 + 140_Block_object_dispose(&STACK[0x488], 8) = v281;
            *(_OWORD *)(v252 + 1392) = v280;
            long long v283 = *(_OWORD *)(v279 + 196);
            long long v284 = *(_OWORD *)(v279 + 212);
            long long v285 = *(_OWORD *)(v279 + 228);
            *(_OWORD *)(v252 + 1504) = *(_OWORD *)(v279 + 244);
            *(_OWORD *)(v252 + 148_Block_object_dispose(&STACK[0x488], 8) = v285;
            *(_OWORD *)(v252 + 1472) = v284;
            *(_OWORD *)(v252 + 1456) = v283;
            long long v286 = *(_OWORD *)(v279 + 260);
            long long v287 = *(_OWORD *)(v279 + 276);
            long long v288 = *(_OWORD *)(v279 + 292);
            *(_OWORD *)(v252 + 156_Block_object_dispose(&STACK[0x488], 8) = *(_OWORD *)(v279 + 308);
            *(_OWORD *)(v252 + 1552) = v288;
            *(_OWORD *)(v252 + 1536) = v287;
            *(_OWORD *)(v252 + 1520) = v286;
            long long v289 = *(_OWORD *)(v279 + 324);
            long long v290 = *(_OWORD *)(v279 + 340);
            long long v291 = *(_OWORD *)(v279 + 356);
            *(_OWORD *)(v252 + 1632) = *(_OWORD *)(v279 + 372);
            *(_OWORD *)(v252 + 1616) = v291;
            *(_OWORD *)(v252 + 1600) = v290;
            *(_OWORD *)(v252 + 1584) = v289;
          }
          else
          {
            uint64_t v308 = a3 + 1724 * v250;
            unsigned int v309 = *(_DWORD *)(v308 + 780);
            if (v309 < 6)
            {
              uint64_t v311 = a3 + 1724 * v250 + 40 * v309;
              *(_OWORD *)(v311 + 532) = *v303;
              *(unsigned char *)(v311 + 54_Block_object_dispose(&STACK[0x488], 8) = v306;
              *(_DWORD *)(v311 + 564) = v307;
              *(_DWORD *)(v311 + 556) = v305;
              *(_DWORD *)(v311 + 552) = v304;
              *(_DWORD *)(v311 + 56_Block_object_dispose(&STACK[0x488], 8) = v302;
              ++*(_DWORD *)(v308 + 780);
            }
            else
            {
              uint64_t v310 = a3 + 1724 * v250;
              *(_OWORD *)(v310 + 732) = *v303;
              *(unsigned char *)(v310 + 74_Block_object_dispose(&STACK[0x488], 8) = v306;
              *(_DWORD *)(v310 + 764) = v307;
              *(_DWORD *)(v310 + 756) = v305;
              *(_DWORD *)(v310 + 752) = v304;
              *(_DWORD *)(v310 + 76_Block_object_dispose(&STACK[0x488], 8) = v302;
            }
          }
          uint64_t v292 = a3 + 1724 * v250;
          *(_OWORD *)(v292 + 1664) = *(_OWORD *)(a6 + ((unint64_t)*(unsigned int *)v297 << 9) + 12);
          *(_OWORD *)(v292 + 1680) = *(_OWORD *)(a6 + ((unint64_t)*(unsigned int *)v297 << 9) + 12);
          *(float *)(v292 + 164_Block_object_dispose(&STACK[0x488], 8) = (float)*(unsigned int *)(a6 + ((unint64_t)*(unsigned int *)v297 << 9) + 28);
          unint64_t v250 = (v250 + 1);
        }
        else if (v293)
        {
          v294 = &a13[520 * v672];
          *((_OWORD *)v294 + 30) = 0u;
          *((_OWORD *)v294 + 31) = 0u;
          *((_OWORD *)v294 + 2_Block_object_dispose(&STACK[0x488], 8) = 0u;
          *((_OWORD *)v294 + 29) = 0u;
          *((_OWORD *)v294 + 26) = 0u;
          *((_OWORD *)v294 + 27) = 0u;
          *((_OWORD *)v294 + 24) = 0u;
          *((_OWORD *)v294 + 25) = 0u;
          *((_OWORD *)v294 + 22) = 0u;
          *((_OWORD *)v294 + 23) = 0u;
          *((_OWORD *)v294 + 20) = 0u;
          *((_OWORD *)v294 + 21) = 0u;
          *((_OWORD *)v294 + 1_Block_object_dispose(&STACK[0x488], 8) = 0u;
          *((_OWORD *)v294 + 19) = 0u;
          *((_OWORD *)v294 + 16) = 0u;
          *((_OWORD *)v294 + 17) = 0u;
          *((_OWORD *)v294 + 14) = 0u;
          *((_OWORD *)v294 + 15) = 0u;
          *((_OWORD *)v294 + 12) = 0u;
          *((_OWORD *)v294 + 13) = 0u;
          *((_OWORD *)v294 + 10) = 0u;
          *((_OWORD *)v294 + 11) = 0u;
          *((_OWORD *)v294 + _Block_object_dispose(&STACK[0x488], 8) = 0u;
          *((_OWORD *)v294 + 9) = 0u;
          *((_OWORD *)v294 + 6) = 0u;
          *((_OWORD *)v294 + 7) = 0u;
          *((_OWORD *)v294 + 4) = 0u;
          *((_OWORD *)v294 + 5) = 0u;
          *((_OWORD *)v294 + 2) = 0u;
          *((_OWORD *)v294 + 3) = 0u;
          *(_OWORD *)v294 = 0u;
          *((_OWORD *)v294 + 1) = 0u;
          *((int32x4_t *)v294 + 2) = v676;
          *((_DWORD *)v294 + 12) = -361;
          *((_DWORD *)v294 + 32) = -1;
          *((_DWORD *)v294 + 9_Block_object_dispose(&STACK[0x488], 8) = -1;
          *((_DWORD *)v294 + 105) = -1;
          *((_DWORD *)v294 + 12_Block_object_dispose(&STACK[0x488], 8) = 0;
          v294[516] = 0;
          v295 = v251;
          memcpy(v294, (const void *)(a6 + ((unint64_t)*(unsigned int *)v251 << 9)), 0x200uLL);
          unint64_t v251 = v295;
          ++v672;
        }
        v251 += 4;
        --v249;
      }
      while (v249);
    }
    else
    {
      unint64_t v250 = 0;
      unsigned int v672 = 0;
    }
    *a10 = v250;
    *a11 = 0;
    *a14 = v672;
    return v250;
  }
  __dst = v31;
  BOOL v643 = v19 == 0;
  unint64_t v60 = 0;
  int v61 = 0;
  int v681 = 0;
  if (v19 <= v17) {
    uint64_t v62 = v17;
  }
  else {
    uint64_t v62 = v19;
  }
  uint64_t v63 = a8;
  float v64 = *(float *)(a8 + 56);
  int v635 = *(_DWORD *)(a8 + 180);
  if (v19 <= 1) {
    uint64_t v65 = 1;
  }
  else {
    uint64_t v65 = v19;
  }
  uint64_t v671 = v65;
  float v66 = (float)(a2 * v655) + 0.0001;
  uint64_t v19 = v19;
  int v659 = v62 - 1;
  unsigned int v652 = v62 - 1 - v17;
  uint64_t v658 = v62 & 0xFFFFFFF8;
  unsigned int v657 = v62 - v17;
  uint64_t v656 = (v62 - v17) & 0xFFFFFFF8;
  int v650 = v656 + v17;
  *(void *)&long long v67 = 0x4000000040000000;
  *((void *)&v67 + 1) = 0x4000000040000000;
  uint64_t v662 = v62;
  while (2)
  {
    if (v60 >= v19)
    {
      int v130 = 0;
      BOOL v131 = __CFADD__(v61, v659);
      if (v62 < 8) {
        goto LABEL_154;
      }
      if (v131) {
        goto LABEL_154;
      }
      uint64_t v132 = v658;
      int v133 = v61;
      do
      {
        int v134 = &v30[v133];
        *int v134 = v67;
        v134[1] = v67;
        v133 += 8;
        v132 -= 8;
      }
      while (v132);
      v61 += v658;
      int v130 = v658;
      int v80 = v61;
      if (v62 != v658)
      {
LABEL_154:
        int v135 = v62 - v130;
        int v80 = v61;
        do
        {
          v30[v80++] = 0x40000000;
          --v135;
        }
        while (v135);
      }
      goto LABEL_48;
    }
    uint64_t v68 = 0;
    int v69 = 0;
    unsigned int v70 = 0;
    unint64_t v71 = a3 + 1724 * v60;
    unsigned int v72 = *(_DWORD *)(v71 + 8);
    float32x2_t v73 = *(float32x2_t *)(v71 + 12);
    float32x2_t v74 = vadd_f32(v73, *(float32x2_t *)(v71 + 20));
    int32x4_t v75 = vdupq_n_s32(v72);
    float32x2_t v76 = (float *)(v71 + 828);
    float32x2_t v77 = vmaxnm_f32(vsub_f32(v74, v73), 0);
    float32x2_t v78 = vmul_lane_f32(v77, v77, 1);
    int v79 = v61 + 1;
    int v80 = v61;
    do
    {
      int v81 = v80;
      int v82 = v79;
      uint64_t v83 = a6 + (v68 << 9);
      float32x2_t v84 = *(float32x2_t *)(v83 + 12);
      float32x2_t v85 = *(float32x2_t *)(v83 + 20);
      float32x2_t v86 = vadd_f32(v84, v85);
      float32x2_t v87 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v74, v86), (int8x8_t)v86, (int8x8_t)v74), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v73, v84), (int8x8_t)v73, (int8x8_t)v84)), 0);
      float32x2_t v88 = vmul_lane_f32(v87, v87, 1);
      float v89 = 0.0;
      if (v88.f32[0] >= 0.00000011921)
      {
        float32x2_t v90 = vmaxnm_f32(vsub_f32(v86, v84), 0);
        float32x2_t v91 = vsub_f32(vadd_f32(vmul_lane_f32(v90, v90, 1), v78), v88);
        unsigned __int32 v92 = vdiv_f32(v88, v91).u32[0];
        if (v91.f32[0] >= 0.00000011921) {
          float v89 = *(float *)&v92;
        }
        else {
          float v89 = 0.0;
        }
      }
      unsigned int v93 = *(_DWORD *)(v83 + 8);
      if (v72 == v93)
      {
        if (v72 == 1)
        {
          if (v89 > 0.2)
          {
            float v122 = v85.f32[0] * v85.f32[1];
            if (*v76 <= v122) {
              float v123 = *v76;
            }
            else {
              float v123 = v122;
            }
            if (*v76 > v122) {
              float v122 = *v76;
            }
            float v110 = fminf(fmaxf((float)((float)(v123 / (float)(v122 + 0.0001)) * 0.1) + (float)(v89 * 0.9), 0.2), 0.99);
            float v89 = v110;
            goto LABEL_139;
          }
        }
        else if (!v72)
        {
          float v94 = 0.0;
          float v95 = 0.0;
          if (v88.f32[0] >= 0.00000011921)
          {
            float32x2_t v96 = vmaxnm_f32(vsub_f32(v86, v84), 0);
            float32x2_t v97 = vmul_lane_f32(v96, v96, 1);
            if (vcgt_f32(v78, v97).u8[0]) {
              float v98 = v97.f32[0];
            }
            else {
              float v98 = v78.f32[0];
            }
            if (v98 >= 0.00000011921) {
              float v94 = v88.f32[0] / v98;
            }
            else {
              float v94 = 0.0;
            }
            float32x2_t v99 = vsub_f32(vadd_f32(v97, v78), v88);
            unsigned __int32 v100 = vdiv_f32(v88, v99).u32[0];
            if (v99.f32[0] >= 0.00000011921) {
              float v95 = *(float *)&v100;
            }
            else {
              float v95 = 0.0;
            }
          }
          if (a15[v68] < *(float *)(v63 + 188) && !*(unsigned char *)(a6 + (v68 << 9) + 100))
          {
            BOOL v101 = v95 >= 0.5 && *(unsigned char *)(v71 + 100) == 0;
            if (!v101) {
              float v94 = 0.0;
            }
          }
          float v102 = v95 + 0.2;
          if (v94 >= 0.2) {
            float v94 = v102;
          }
          float32x2_t v103 = vmaxnm_f32(vsub_f32(v86, v84), 0);
          float32x2_t v104 = vmul_lane_f32(v103, v103, 1);
          BOOL v105 = v88.f32[0] < 0.00000011921 || v104.f32[0] < 0.00000011921;
          LODWORD(v106) = vdiv_f32(v88, v104).u32[0];
          if (v105) {
            float v106 = 0.0;
          }
          float32x2_t v107 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v86, v74), (int8x8_t)v74, (int8x8_t)v86), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v84, v73), (int8x8_t)v84, (int8x8_t)v73)), 0);
          float32x2_t v108 = vmul_lane_f32(v107, v107, 1);
          BOOL v109 = v108.f32[0] < 0.00000011921 || v78.f32[0] < 0.00000011921;
          float v110 = fminf(v94, 0.99);
          LODWORD(v111) = vdiv_f32(v108, v78).u32[0];
          if (v109) {
            float v111 = 0.0;
          }
          float v112 = v85.f32[0] * v85.f32[1];
          if (v111 > 0.95 && v106 < 0.25)
          {
            int v114 = *(_DWORD *)(v71 + 4);
            if (v114)
            {
              uint64_t v115 = 0;
              unint64_t v116 = (_DWORD *)(a3 + 8);
              while (*(v116 - 1) != v114 || *v116 != 1)
              {
                ++v115;
                v116 += 431;
                if (v19 == v115)
                {
                  float v110 = 0.0;
                  uint64_t v63 = a8;
                  goto LABEL_126;
                }
              }
              uint64_t v63 = a8;
              if ((float)(v112 / (float)(*(float *)(a3 + 1724 * v115 + 828) + 0.0001)) <= 0.4) {
                goto LABEL_126;
              }
            }
            float v110 = 0.0;
          }
LABEL_126:
          float v124 = *v76;
          if (*(unsigned char *)(v71 + 100))
          {
            if (v112 < (float)(v124 * 0.8) && *(unsigned char *)(a6 + (v68 << 9) + 100) == 0) {
              float v110 = 0.0;
            }
          }
          else if (*(unsigned char *)(a6 + (v68 << 9) + 100))
          {
            float v126 = v112 / v66;
            float v127 = v112 * 0.8;
            if (v126 > 0.008 && v124 < v127) {
              float v110 = 0.0;
            }
          }
          goto LABEL_139;
        }
        float v110 = v89;
      }
      else
      {
        BOOL v118 = v72 == 10 && v93 == 11;
        uint16x4_t v119 = (uint16x4_t)vmovn_s32((int32x4_t)vandq_s8((int8x16_t)vceqq_s32(v75, (int32x4_t)xmmword_246D9F110), (int8x16_t)vceqq_s32(vdupq_n_s32(v93), (int32x4_t)xmmword_246D9F120)));
        BOOL v121 = v72 == 11 && v93 == 10;
        float v110 = v89;
        if ((vmaxv_u16(v119) & 1) == 0 && !v118 && !v121)
        {
          v30[v81] = 1065353216;
          goto LABEL_52;
        }
      }
LABEL_139:
      *(float *)&v30[v81] = 1.0 - v110;
      if ((float)(1.0 - v110) < 1.0 && v89 > 0.075)
      {
        ++v70;
        if (*(_DWORD *)(a6 + (v68 << 9) + 28) > 1u) {
          ++v69;
        }
      }
LABEL_52:
      ++v68;
      int v80 = v81 + 1;
      int v79 = v82 + 1;
    }
    while (v68 != v34);
    if (v72) {
      goto LABEL_158;
    }
    int v144 = 0;
    int v145 = 0;
    float v146 = *(float *)(v63 + 188);
    int v147 = v61;
    unsigned int v148 = a15;
    uint64_t v149 = v34;
    do
    {
      if (*(float *)&v30[v147] < 1.0)
      {
        if (*v148 <= v146) {
          ++v144;
        }
        else {
          ++v145;
        }
      }
      ++v148;
      ++v147;
      --v149;
    }
    while (v149);
    int v150 = *(_DWORD *)(v71 + 4);
    float v151 = 0.0;
    if (v150)
    {
      uint64_t v152 = 0;
      unint64_t v153 = (_DWORD *)(a3 + 8);
      while (*(v153 - 1) != v150 || *v153 != 1)
      {
        ++v152;
        v153 += 431;
        if (v65 == v152) {
          goto LABEL_193;
        }
      }
      int v154 = 0;
      float v151 = *(float *)(a3 + 1724 * v152 + 832);
      uint64_t v63 = a8;
      if (!v145)
      {
LABEL_185:
        if (v151 < 0.45 || *(_DWORD *)(a3 + 1724 * v60 + 836) > 2u) {
          int v156 = 1;
        }
        else {
          int v156 = v154;
        }
        if (!v156) {
          goto LABEL_158;
        }
      }
    }
    else
    {
LABEL_193:
      int v154 = 1;
      uint64_t v63 = a8;
      if (!v145) {
        goto LABEL_185;
      }
    }
    if (v144)
    {
      int v157 = v61;
      uint64_t v158 = a15;
      uint64_t v159 = v34;
      do
      {
        if (*(float *)&v30[v157] < 1.0 && *v158 < *(float *)(v63 + 188)) {
          v30[v157] = 1065353216;
        }
        ++v158;
        ++v157;
        --v159;
      }
      while (v159);
    }
LABEL_158:
    if (v70 < 2 || !v69)
    {
LABEL_204:
      unint64_t v17 = *(void *)v664;
      if (v72 || v70 < 2) {
        goto LABEL_278;
      }
      int v164 = 0;
      int v165 = 0;
      int v166 = 0;
      float v167 = 0.0;
      int v168 = v61;
      int v169 = (unsigned char *)(a6 + 100);
      uint64_t v170 = v34;
      float v171 = 0.0;
      do
      {
        float v172 = *(float *)&v30[v168];
        BOOL v105 = v172 < 1.0;
        float v173 = 1.0 - v172;
        if (v105 && v173 >= 0.2)
        {
          if (*v169)
          {
            if (v173 > v171) {
              float v171 = v173;
            }
            int v164 = *((_DWORD *)v169 - 15);
            int v166 = 1;
          }
          else
          {
            if (v173 > v167) {
              float v167 = v173;
            }
            int v165 = 1;
          }
        }
        v169 += 512;
        ++v168;
        --v170;
      }
      while (v170);
      uint64_t v63 = a8;
      if ((v166 & v165 & 1) == 0) {
        goto LABEL_278;
      }
      if (!*(unsigned char *)(v71 + 100))
      {
        if ((float)(v171 / v167) > 0.93 && (float)(v171 / v167) < 1.07)
        {
          unsigned int v192 = (unsigned char *)(a6 + 100);
          uint64_t v193 = v34;
          do
          {
            if (*(float *)&v30[v61] < 1.0 && *v192) {
              v30[v61] = 1065353216;
            }
            v192 += 512;
            ++v61;
            --v193;
          }
          while (v193);
        }
        else if (v167 > v171)
        {
          uint64_t v183 = (unsigned char *)(a6 + 100);
          uint64_t v184 = v34;
          do
          {
            if (*(float *)&v30[v61] < 1.0 && *v183) {
              v30[v61] = 1065353216;
            }
            v183 += 512;
            ++v61;
            --v184;
          }
          while (v184);
        }
        goto LABEL_278;
      }
      int v175 = *(_DWORD *)(v71 + 40);
      if ((v175 < v635 || v175 >= 91) && (v175 < 270 || v175 > 360 - v635))
      {
        int v194 = (unsigned char *)(a6 + 100);
        uint64_t v195 = v34;
        do
        {
          if (*(float *)&v30[v61] < 1.0 && *v194 != 1) {
            v30[v61] = 1065353216;
          }
          v194 += 512;
          ++v61;
          --v195;
        }
        while (v195);
        goto LABEL_278;
      }
      float v176 = v171 / (float)(v167 + 1.1755e-38);
      if (v176 > 0.93 && v176 < 1.07)
      {
        int v178 = (int *)(a3 + 1724 * v60 + 848);
        int v179 = *v178;
        if (*v178 <= 2)
        {
          unint64_t v180 = (unsigned char *)(a6 + 100);
          uint64_t v181 = v34;
          do
          {
            if (*(float *)&v30[v61] < 1.0 && *v180 != 1) {
              v30[v61] = 1065353216;
            }
            v180 += 512;
            ++v61;
            --v181;
          }
          while (v181);
          int *v178 = v179 + 1;
          goto LABEL_278;
        }
      }
      uint64_t v185 = (int *)(a3 + 1724 * v60 + 808);
      int v186 = *v185;
      if (*v185 && *(_DWORD *)(a3 + 1724 * v60 + 812) + 1 == *(_DWORD *)(a3 + 1724 * v60 + 520))
      {
        if ((v164 - 1) < 0x45)
        {
          size_t v189 = (unsigned char *)(a6 + 100);
          uint64_t v190 = v34;
          goto LABEL_274;
        }
        unsigned int v187 = v164 - 291;
        int v188 = (unsigned char *)(a6 + 100);
        size_t v189 = (unsigned char *)(a6 + 100);
        uint64_t v190 = v34;
        uint64_t v191 = v34;
        if (v187 <= 0x44)
        {
          do
          {
LABEL_274:
            if (*(float *)&v30[v61] < 1.0 && *v189 == 1) {
              v30[v61] = 1065353216;
            }
            v189 += 512;
            ++v61;
            --v190;
          }
          while (v190);
          *(void *)uint64_t v185 = 0;
          goto LABEL_278;
        }
      }
      else
      {
        int v188 = (unsigned char *)(a6 + 100);
        uint64_t v191 = v34;
      }
      do
      {
        if (*(float *)&v30[v61] < 1.0 && *v188 != 1) {
          v30[v61] = 1065353216;
        }
        v188 += 512;
        ++v61;
        --v191;
      }
      while (v191);
      *uint64_t v185 = v186 + 1;
      *(_DWORD *)(a3 + 1724 * v60 + 812) = *(_DWORD *)(a3 + 1724 * v60 + 520);
      goto LABEL_278;
    }
    unint64_t v17 = *(void *)v664;
    if (v72 < 9 && ((0x13Fu >> v72) & 1) != 0)
    {
      int v136 = 0;
      float v137 = 0.0;
      int v138 = v61;
      uint16x8_t v139 = (_DWORD *)(a6 + 28);
      uint64_t v140 = v34;
      float v141 = 0.0;
      do
      {
        float v142 = *(float *)&v30[v138];
        if (v142 < 1.0)
        {
          float v143 = 1.0 - v142;
          if (*v139 < 2u)
          {
            if (v143 > v141) {
              float v141 = v143;
            }
          }
          else
          {
            if (v143 > v64) {
              int v136 = 1;
            }
            if (v143 > v137) {
              float v137 = v143;
            }
          }
        }
        v139 += 128;
        ++v138;
        --v140;
      }
      while (v140);
      if (v137 <= v141) {
        int v160 = v136;
      }
      else {
        int v160 = v136 + 1;
      }
      int v161 = v61;
      int v162 = (_DWORD *)(a6 + 28);
      uint64_t v163 = v34;
      if (v160 == 2)
      {
        do
        {
          if (*(float *)&v30[v161] < 1.0 && *v162 <= 1u) {
            v30[v161] = 1065353216;
          }
          v162 += 128;
          ++v161;
          --v163;
        }
        while (v163);
      }
      goto LABEL_204;
    }
LABEL_278:
    unint64_t v196 = a3 + 1724 * v60;
    if (*(_DWORD *)(v196 + 808) && *(_DWORD *)(a3 + 1724 * v60 + 812) != *(_DWORD *)(a3 + 1724 * v60 + 520)) {
      *(void *)(v196 + 80_Block_object_dispose(&STACK[0x488], 8) = 0;
    }
    if (v17 >= v19)
    {
      uint64_t v62 = v662;
    }
    else
    {
      if (v657 < 8)
      {
        int v197 = v17;
        uint64_t v62 = v662;
        goto LABEL_289;
      }
      int v197 = v17;
      uint64_t v62 = v662;
      if (-2 - v81 < v652) {
        goto LABEL_289;
      }
      uint64_t v198 = v656;
      do
      {
        unsigned int v199 = &v30[v82];
        *unsigned int v199 = v67;
        v199[1] = v67;
        v82 += 8;
        v198 -= 8;
      }
      while (v198);
      v80 += v656;
      int v197 = v650;
      if (v657 != v656)
      {
LABEL_289:
        int v200 = v62 - v197;
        do
        {
          v30[v80++] = 0x40000000;
          --v200;
        }
        while (v200);
      }
    }
LABEL_48:
    ++v60;
    int v61 = v80;
    if (v60 != v62) {
      continue;
    }
    break;
  }
  if (!v19)
  {
    unsigned int v682 = v17;
    int v315 = a2;
    sub_246D82AB8(a3, 0, a6, v17, (uint64_t)v641, (uint64_t)__dst, v63, &v681, (uint64_t)v667, &v682, (uint64_t)v648, (uint64_t)a15, v655, a2);
    unsigned int v318 = v682;
    unsigned int v28 = v661;
    if (v682) {
      goto LABEL_602;
    }
    goto LABEL_378;
  }
  uint64_t __n = 4 * (v62 * v62);
  memcpy(__dst, v30, __n);
  bmMunkres((float *)v30, v62, v636, v201, v641, v202, 0, v203);
  unsigned int v204 = (unsigned __int8 *)*((void *)&v692 + 1);
  unsigned int v682 = v17;
  sub_246D82AB8(a3, v19, a6, v17, (uint64_t)v641, (uint64_t)__dst, v63, &v681, (uint64_t)v667, &v682, (uint64_t)v648, (uint64_t)a15, v655, a2);
  if (!v682)
  {
    unsigned int v319 = 0;
    unsigned int v320 = 0;
    int v315 = a2;
    unsigned int v28 = v661;
    goto LABEL_380;
  }
  unint64_t v205 = 0;
  int v206 = 0;
  uint64_t v207 = v34 << 9;
  int32x4_t v208 = vdupq_n_s32(0x47C35000u);
  uint64_t v209 = v662;
  while (2)
  {
    if (v205 >= v19)
    {
      int v234 = 0;
      BOOL v235 = __CFADD__(v206, v659);
      if (v209 < 8) {
        goto LABEL_343;
      }
      if (v235) {
        goto LABEL_343;
      }
      uint64_t v236 = v658;
      int v237 = v206;
      do
      {
        uint64_t v238 = (int32x4_t *)&v32[v237];
        *uint64_t v238 = v208;
        v238[1] = v208;
        v237 += 8;
        v236 -= 8;
      }
      while (v236);
      v206 += v658;
      int v234 = v658;
      if (v209 != v658)
      {
LABEL_343:
        int v239 = v209 - v234;
        do
        {
          v32[v206++] = 1203982336;
          --v239;
        }
        while (v239);
      }
    }
    else
    {
      uint64_t v210 = 0;
      unint64_t v211 = a3 + 1724 * v205;
      unint64_t v212 = *(unsigned int *)(v211 + 8);
      float32x2_t v213 = vadd_f32(*(float32x2_t *)(v211 + 12), vadd_f32(*(float32x2_t *)(v211 + 12), *(float32x2_t *)(v211 + 20)));
      float v214 = 0.5 * v213.f32[0];
      float v215 = vmuls_lane_f32(0.5, v213, 1);
      int32x4_t v216 = vdupq_n_s32(v212);
      if ((v212 & 0xFFFFFFFE) == 0xA) {
        uint64_t v217 = 6;
      }
      else {
        uint64_t v217 = 5;
      }
      BOOL v219 = ((0x13Fu >> v212) & 1) == 0 || v212 > 8;
      int v220 = v206 + 1;
      uint64_t v221 = a15;
      do
      {
        int v222 = v206;
        int v223 = v220;
        uint64_t v224 = v217;
        if (!v219) {
          uint64_t v224 = qword_246D9F2C0[v212];
        }
        float32x2_t v225 = vadd_f32(*(float32x2_t *)(a6 + v210 + 12), vadd_f32(*(float32x2_t *)(a6 + v210 + 12), *(float32x2_t *)(a6 + v210 + 20)));
        float v226 = 0.5 * v225.f32[0];
        v225.f32[0] = vmuls_lane_f32(0.5, v225, 1);
        float v227 = sqrtf((float)((float)(v215 - v225.f32[0]) * (float)(v215 - v225.f32[0]))+ (float)((float)(v214 - v226) * (float)(v214 - v226)));
        if (v227 > (float)((float)((float)(*(float *)(v63 + 4 * v224 + 116) + 0.01)
                                  * (float)(*(float *)(v211 + 20) + *(float *)(v211 + 24)))
                          * 0.5))
          float v227 = 100000.0;
        if (*v221 < *(float *)(v63 + 188) && !*(unsigned char *)(a6 + v210 + 100)) {
          float v227 = 100000.0;
        }
        unsigned int v228 = *(_DWORD *)(a6 + v210 + 8);
        if (v212 == v228)
        {
          *(float *)&v32[v206] = v227;
        }
        else
        {
          BOOL v230 = v212 == 10 && v228 == 11;
          uint16x4_t v231 = (uint16x4_t)vmovn_s32((int32x4_t)vandq_s8((int8x16_t)vceqq_s32(v216, (int32x4_t)xmmword_246D9F110), (int8x16_t)vceqq_s32(vdupq_n_s32(v228), (int32x4_t)xmmword_246D9F120)));
          BOOL v233 = v212 == 11 && v228 == 10;
          if ((vmaxv_u16(v231) & 1) != 0 || v230 || v233)
          {
            *(float *)&v32[v222] = v227;
            uint64_t v63 = a8;
          }
          else
          {
            v32[v222] = 1203982336;
            uint64_t v63 = a8;
          }
        }
        int v206 = v222 + 1;
        v210 += 512;
        ++v221;
        int v220 = v223 + 1;
      }
      while (v207 != v210);
      LODWORD(v17) = v664[0];
      if (v664[0] >= v19)
      {
        uint64_t v209 = v662;
      }
      else
      {
        if (v657 < 8)
        {
          int v240 = v664[0];
          uint64_t v209 = v662;
          goto LABEL_353;
        }
        int v240 = v664[0];
        uint64_t v241 = v656;
        uint64_t v209 = v662;
        if (-2 - v222 < v652) {
          goto LABEL_353;
        }
        do
        {
          size_t v242 = (int32x4_t *)&v32[v223];
          *size_t v242 = v208;
          v242[1] = v208;
          v223 += 8;
          v241 -= 8;
        }
        while (v241);
        v206 += v656;
        int v240 = v650;
        if (v657 != v656)
        {
LABEL_353:
          int v243 = v209 - v240;
          do
          {
            v32[v206++] = 1203982336;
            --v243;
          }
          while (v243);
        }
      }
    }
    if (++v205 != v209) {
      continue;
    }
    break;
  }
  memcpy(v634, v32, __n);
  bmMunkres((float *)v32, v209, v204, v312, v633, v313, 0, v314);
  int v315 = a2;
  sub_246D83848(a3, v19, a6, v17, (uint64_t)v633, (uint64_t)v634, v63, v667, &v682, (uint64_t)v648, (void *)v33, (uint64_t)a15, v655, a2);
  if (v671 < 2)
  {
    uint64_t v316 = 0;
    int v317 = 0;
    unsigned int v28 = v661;
    goto LABEL_597;
  }
  int v492 = 0;
  int v493 = 0;
  uint64_t v316 = v671 & 0xFFFFFFFE;
  uint64_t v494 = a3;
  uint64_t v495 = v316;
  unsigned int v28 = v661;
  do
  {
    if (*(_DWORD *)(v494 + 528) == 2) {
      ++v492;
    }
    if (*(_DWORD *)(v494 + 2252) == 2) {
      ++v493;
    }
    v494 += 3448;
    v495 -= 2;
  }
  while (v495);
  int v317 = v493 + v492;
  if (v316 != v671)
  {
LABEL_597:
    uint64_t v496 = v671 - v316;
    v497 = (_DWORD *)(a3 + 1724 * v316 + 528);
    do
    {
      if (*v497 == 2) {
        ++v317;
      }
      v497 += 431;
      --v496;
    }
    while (v496);
  }
  int v681 = v317;
  unsigned int v318 = v682;
  if (!v682)
  {
LABEL_378:
    unsigned int v319 = 0;
    unsigned int v320 = 0;
    goto LABEL_380;
  }
LABEL_602:
  uint64_t v498 = 0;
  unsigned int v320 = 0;
  unsigned int v319 = 0;
  uint64_t v499 = v318;
  v500 = v667;
  do
  {
    uint64_t v501 = *(unsigned int *)&v500[4 * v498];
    v502 = (_DWORD *)(a6 + (v501 << 9));
    if (v502[7] < 2u)
    {
      if (v502[2]) {
        goto LABEL_609;
      }
      uint64_t v503 = a6 + (v501 << 9);
      if (*(unsigned char *)(v503 + 100) || a15[v501] >= *(float *)(a8 + 188))
      {
        uint64_t v504 = 0;
        v505 = (float *)(v503 + 12);
        float v507 = *(float *)(v503 + 20);
        float v506 = *(float *)(v503 + 24);
        float v508 = v506 * v507;
        v509 = (float *)(v503 + 16);
        float v510 = 0.0;
        do
        {
          if (v498 != v504)
          {
            unint64_t v511 = a6 + ((unint64_t)*(unsigned int *)&v500[4 * v504] << 9);
            if (*(_DWORD *)(v511 + 8) == 1)
            {
              float v512 = *v505;
              float v513 = *v505 + v507;
              float v514 = *v509;
              float v515 = *v509 + v506;
              float v516 = *(float *)(v511 + 12);
              float v517 = *(float *)(v511 + 16);
              float v518 = 0.0;
              if (v513 > v516 && v515 > v517)
              {
                float v520 = *(float *)(v511 + 20);
                float v521 = *(float *)(v511 + 24);
                float v522 = v517 + v521;
                if ((float)(v516 + v520) > v512 && v522 > v514)
                {
                  float v524 = fmaxf(fminf(v513, v516 + v520) - fmaxf(v512, v516), 0.0)
                       * fmaxf(fminf(v515, v522) - fmaxf(v514, v517), 0.0);
                  float v518 = v524 / fmaxf((float)(v508 + (float)(v520 * v521)) - v524, 0.00001);
                }
              }
              if (v518 > v510) {
                float v510 = v518;
              }
            }
          }
          ++v504;
        }
        while (v499 != v504);
        if (v510 <= 0.85 || (float)(v508 / v66) >= 0.11)
        {
LABEL_609:
          memcpy((void *)(*((void *)&v33 + 1) + ((unint64_t)v320 << 9)), v502, 0x200uLL);
          v500 = v667;
          *(_DWORD *)(v653 + 4 * v320++) = v501;
        }
      }
    }
    else
    {
      if (v498 != v319) {
        *(_DWORD *)&v500[4 * v319] = v501;
      }
      ++v319;
    }
    unsigned int v28 = v661;
    ++v498;
  }
  while (v498 != v499);
LABEL_380:
  unsigned int v673 = v319;
  unsigned int v682 = v319;
  if (*a14 <= v320) {
    unsigned int v321 = v320;
  }
  else {
    unsigned int v321 = *a14;
  }
  uint64_t v322 = a8;
  unsigned int v323 = v19;
  if (v321)
  {
    sub_246D83EC0((uint64_t)a13, *a14, *((uint64_t *)&v33 + 1), v320, v639, a8, a15);
    memcpy(*((void **)&v639 + 1), (const void *)v639, 4 * v321 * v321);
    bmMunkres((float *)v639, v321, v638, v324, v640, v325, 0, v326);
    __src[0] = 0;
    unsigned int v680 = 0;
    sub_246D84490(a13, *a14, *((_DWORD **)&v33 + 1), v320, (uint64_t)v640, *((uint64_t *)&v639 + 1), (float *)a9, v647, v642, &v680, __src);
    uint64_t v660 = *((void *)&v701 + 1);
    size_t __na = __src[0];
    if (__src[0])
    {
      v327 = (int *)v642;
      v328 = (unsigned char *)*((void *)&v701 + 1);
      uint64_t v329 = __src[0];
      do
      {
        int v330 = *v327++;
        *v328++ = a13[520 * v640[v330] + 516];
        --v329;
      }
      while (v329);
    }
    uint64_t v331 = *a14;
    if (v331)
    {
      uint64_t v332 = 0;
      unsigned int v333 = 0;
      v334 = (unsigned int *)(a9 + 88);
      v335 = a13;
      uint64_t v336 = *((void *)&v33 + 1);
      v337 = (unsigned int *)v647;
      do
      {
        unsigned int v338 = *((_DWORD *)v335 + 128);
        if (v338)
        {
          uint64_t v339 = *((unsigned int *)v335 + 2);
          switch((int)v339)
          {
            case 0:
              if (v335[100])
              {
                if (v338 < *v334) {
                  goto LABEL_403;
                }
              }
              else if (v338 < *(_DWORD *)(a9 + 84))
              {
                goto LABEL_403;
              }
              break;
            case 1:
              goto LABEL_402;
            case 2:
            case 4:
              uint64_t v339 = 2;
              goto LABEL_402;
            case 3:
            case 5:
              uint64_t v339 = 3;
              goto LABEL_402;
            case 8:
              uint64_t v339 = 4;
              goto LABEL_402;
            default:
              BOOL v101 = (v339 & 0xFFFFFFFE) == 10;
              uint64_t v339 = 5;
              if (v101) {
                uint64_t v339 = 6;
              }
LABEL_402:
              if (v338 < v334[v339])
              {
LABEL_403:
                if (v332 != v333)
                {
                  memcpy(&a13[520 * v333], v335, 0x208uLL);
                  v337 = (unsigned int *)v647;
                  uint64_t v336 = *((void *)&v33 + 1);
                }
                ++v333;
              }
              break;
          }
        }
        v335 += 520;
        ++v332;
      }
      while (v331 != v332);
    }
    else
    {
      unsigned int v333 = 0;
      uint64_t v336 = *((void *)&v33 + 1);
      v337 = (unsigned int *)v647;
    }
    *a14 = v333;
    uint64_t v340 = v680;
    if (v680)
    {
      int32x4_t v663 = vdupq_n_s32(0xFFFFFE97);
      do
      {
        if (*(_DWORD *)(v336 + ((unint64_t)*v337 << 9) + 28))
        {
          v341 = &a13[520 * v333];
          *((_OWORD *)v341 + 30) = 0u;
          *((_OWORD *)v341 + 31) = 0u;
          *((_OWORD *)v341 + 2_Block_object_dispose(&STACK[0x488], 8) = 0u;
          *((_OWORD *)v341 + 29) = 0u;
          *((_OWORD *)v341 + 26) = 0u;
          *((_OWORD *)v341 + 27) = 0u;
          *((_OWORD *)v341 + 24) = 0u;
          *((_OWORD *)v341 + 25) = 0u;
          *((_OWORD *)v341 + 22) = 0u;
          *((_OWORD *)v341 + 23) = 0u;
          *((_OWORD *)v341 + 20) = 0u;
          *((_OWORD *)v341 + 21) = 0u;
          *((_OWORD *)v341 + 1_Block_object_dispose(&STACK[0x488], 8) = 0u;
          *((_OWORD *)v341 + 19) = 0u;
          *((_OWORD *)v341 + 16) = 0u;
          *((_OWORD *)v341 + 17) = 0u;
          *((_OWORD *)v341 + 14) = 0u;
          *((_OWORD *)v341 + 15) = 0u;
          *((_OWORD *)v341 + 12) = 0u;
          *((_OWORD *)v341 + 13) = 0u;
          *((_OWORD *)v341 + 10) = 0u;
          *((_OWORD *)v341 + 11) = 0u;
          *((_OWORD *)v341 + _Block_object_dispose(&STACK[0x488], 8) = 0u;
          *((_OWORD *)v341 + 9) = 0u;
          *((_OWORD *)v341 + 6) = 0u;
          *((_OWORD *)v341 + 7) = 0u;
          *((_OWORD *)v341 + 4) = 0u;
          *((_OWORD *)v341 + 5) = 0u;
          *((_OWORD *)v341 + 2) = 0u;
          *((_OWORD *)v341 + 3) = 0u;
          *(_OWORD *)v341 = 0u;
          *((_OWORD *)v341 + 1) = 0u;
          *((int32x4_t *)v341 + 2) = v663;
          *((_DWORD *)v341 + 12) = -361;
          *((_DWORD *)v341 + 32) = -1;
          *((_DWORD *)v341 + 9_Block_object_dispose(&STACK[0x488], 8) = -1;
          *((_DWORD *)v341 + 105) = -1;
          *((_DWORD *)v341 + 12_Block_object_dispose(&STACK[0x488], 8) = 0;
          v341[516] = 0;
          v342 = v337;
          memcpy(&a13[520 * *a14], (const void *)(*((void *)&v33 + 1) + ((unint64_t)*v337 << 9)), 0x200uLL);
          v337 = v342;
          uint64_t v336 = *((void *)&v33 + 1);
          uint64_t v343 = *v342;
          uint64_t v344 = *((void *)&v33 + 1) + (v343 << 9);
          if (!*(_DWORD *)(v344 + 8)
            && *(unsigned char *)(v344 + 100)
            && a15[*(unsigned int *)(v653 + 4 * v343)] < *(float *)(a9 + 32))
          {
            a13[520 * *a14 + 516] = 1;
          }
          unsigned int v333 = *a14 + 1;
          *a14 = v333;
        }
        ++v337;
        --v340;
      }
      while (v340);
    }
    if (!v333) {
      goto LABEL_451;
    }
    unint64_t v345 = 0;
    unsigned int v346 = 0;
    v347 = (int *)v701;
    do
    {
      v348 = &a13[520 * v345];
      if (!*((_DWORD *)v348 + 2))
      {
        if (!v333) {
          goto LABEL_451;
        }
        unint64_t v349 = 0;
        float v351 = *((float *)v348 + 5);
        float v350 = *((float *)v348 + 6);
        v352 = (float *)(a13 + 12);
        do
        {
          if (v345 != v349 && !*((_DWORD *)v352 - 1))
          {
            float v354 = v352[2];
            float v353 = v352[3];
            float v355 = *((float *)v348 + 3);
            float v356 = *((float *)v348 + 4);
            float v357 = v356 + v350;
            float v358 = v352[1];
            float v359 = *v352 + v354;
            float v360 = v358 + v353;
            BOOL v361 = (float)(v355 + v351) > *v352 && v357 > v358;
            BOOL v362 = v361 && v359 > v355;
            if (v362 && v360 > v356)
            {
              float v364 = v354 * v353;
              if ((float)((float)(fmaxf(fminf(v355 + v351, v359) - fmaxf(v355, *v352), 0.0)
                                 * fmaxf(fminf(v357, v360) - fmaxf(v356, v358), 0.0))
                         / fmaxf(fminf(v350 * v351, v364), 0.00001)) > 0.9
                && v364 > (float)((float)(v350 * v351) * 1.5))
              {
                v347[v346++] = v349;
                unsigned int v333 = *a14;
              }
            }
          }
          ++v349;
          v352 += 130;
        }
        while (v349 < v333);
      }
      ++v345;
    }
    while (v345 < v333);
    if (v333)
    {
      unint64_t v366 = 0;
      unsigned int v367 = 0;
      do
      {
        uint64_t v368 = v346;
        v369 = v347;
        if (v346)
        {
          while (1)
          {
            int v370 = *v369++;
            if (v366 == v370) {
              break;
            }
            if (!--v368) {
              goto LABEL_449;
            }
          }
        }
        else
        {
LABEL_449:
          if (v366 != v367)
          {
            memcpy(&a13[520 * v367], &a13[520 * v366], 0x208uLL);
            unsigned int v333 = *a14;
          }
          ++v367;
        }
        ++v366;
      }
      while (v366 < v333);
    }
    else
    {
LABEL_451:
      unsigned int v367 = 0;
    }
    *a14 = v367;
    if (__na)
    {
      uint64_t v371 = 0;
      unsigned int v372 = a2;
      uint64_t v322 = a8;
      unsigned int v28 = v661;
      unsigned int v323 = v19;
      uint64_t v373 = v642;
      while (1)
      {
        uint64_t v374 = *(unsigned int *)(v653 + 4 * *(unsigned int *)(v373 + 4 * v371));
        uint64_t v375 = a6 + (v374 << 9);
        int v376 = *(_DWORD *)(v375 + 8);
        if (v376 != 1 || v323 == 0)
        {
          if (!v376)
          {
            if (!v323) {
              goto LABEL_496;
            }
            uint64_t v398 = 0;
            unsigned int v399 = 0;
            v400 = (float *)(a6 + (v374 << 9));
            v401 = v400 + 3;
            v402 = v400 + 5;
            v403 = v400 + 4;
            v404 = v400 + 6;
            float v405 = -1.0;
            v406 = (float *)(a3 + 24);
            do
            {
              if (*((_DWORD *)v406 - 4) == 1)
              {
                float v407 = *v401;
                float v408 = *v401 + *v402;
                float v409 = *v403;
                float v410 = *v403 + *v404;
                float v411 = *(v406 - 3);
                float v412 = *(v406 - 2);
                float v413 = 0.0;
                if (v408 > v411 && v410 > v412)
                {
                  float v415 = *(v406 - 1);
                  float v416 = v412 + *v406;
                  if ((float)(v411 + v415) > v407 && v416 > v409)
                  {
                    float v418 = fmaxf(fminf(v408, v411 + v415) - fmaxf(v407, v411), 0.0)
                         * fmaxf(fminf(v410, v416) - fmaxf(v409, v412), 0.0);
                    float v413 = v418 / fmaxf((float)((float)(*v402 * *v404) + (float)(v415 * *v406)) - v418, 0.00001);
                  }
                }
                if (v413 > v405)
                {
                  unsigned int v399 = v398;
                  float v405 = v413;
                }
              }
              v406 += 431;
              ++v398;
            }
            while (v19 != v398);
            if (v405 <= 0.0)
            {
LABEL_496:
              unsigned int v28 = v661;
              if (*(unsigned char *)(v660 + v371)) {
                goto LABEL_456;
              }
              goto LABEL_455;
            }
            int v419 = *(_DWORD *)(a3 + 1724 * v399 + 4);
            if (v323 < 2)
            {
              uint64_t v420 = 0;
              unsigned int v421 = 0;
              goto LABEL_507;
            }
            int v422 = 0;
            int v423 = 0;
            uint64_t v424 = a3;
            uint64_t v425 = v19 & 0xFFFFFFFE;
            do
            {
              if (*(_DWORD *)(v424 + 4) == v419) {
                ++v422;
              }
              if (*(_DWORD *)(v424 + 1728) == v419) {
                ++v423;
              }
              v424 += 3448;
              v425 -= 2;
            }
            while (v425);
            unsigned int v421 = v423 + v422;
            uint64_t v420 = v19 & 0xFFFFFFFE;
            uint64_t v322 = a8;
            unsigned int v323 = v19;
            uint64_t v373 = v642;
            if (v420 != v19)
            {
LABEL_507:
              uint64_t v426 = v19 - v420;
              v427 = (_DWORD *)(a3 + 4 + 1724 * v420);
              do
              {
                if (*v427 == v419) {
                  ++v421;
                }
                v427 += 431;
                --v426;
              }
              while (v426);
            }
            unsigned int v428 = v399;
            if (*(unsigned char *)(v660 + v371))
            {
              unsigned int v28 = v661;
              if (v421 > 1 || *(float *)(a3 + 1724 * v428 + 524) < 0.7) {
                goto LABEL_456;
              }
            }
            else
            {
              BOOL v429 = v421 != 1 || v405 <= 0.6;
              unsigned int v28 = v661;
              if (!v429)
              {
                float v430 = *v404 * *v402;
                if (v430 > (float)(*(float *)(a3 + 1724 * v428 + 828) * 0.8) && (float)(v430 / v66) < 0.15) {
                  goto LABEL_456;
                }
              }
            }
          }
        }
        else
        {
          uint64_t v378 = 0;
          v379 = (float *)(v375 + 12);
          v380 = (float *)(v375 + 20);
          v381 = (float *)(v375 + 16);
          v382 = (float *)(v375 + 24);
          BOOL v383 = 1;
          v384 = (float *)(a3 + 24);
          do
          {
            if (*((_DWORD *)v384 - 4) == 1)
            {
              float v385 = *v379;
              float v386 = *v379 + *v380;
              float v387 = *v381;
              float v388 = *v381 + *v382;
              float v390 = *(v384 - 2);
              float v389 = *(v384 - 1);
              float v391 = *(v384 - 3);
              float v392 = v391 + v389;
              float v393 = v390 + *v384;
              BOOL v394 = v386 > v391 && v388 > v390;
              BOOL v395 = v394 && v392 > v385;
              if (v395 && v393 > v387)
              {
                float v397 = fmaxf(fminf(v386, v392) - fmaxf(v385, v391), 0.0)
                     * fmaxf(fminf(v388, v393) - fmaxf(v387, v390), 0.0);
                if ((float)(v397 / fmaxf((float)((float)(*v380 * *v382) + (float)(v389 * *v384)) - v397, 0.00001)) > 0.4) {
                  break;
                }
              }
            }
            v384 += 431;
            BOOL v383 = ++v378 < (unint64_t)v19;
          }
          while (v19 != v378);
          if (v383) {
            goto LABEL_456;
          }
        }
LABEL_455:
        *(_DWORD *)&v667[4 * v673++] = v374;
LABEL_456:
        if (++v371 == __na) {
          goto LABEL_526;
        }
      }
    }
    unsigned int v372 = a2;
    uint64_t v322 = a8;
    unsigned int v28 = v661;
    unsigned int v323 = v19;
LABEL_526:
    unsigned int v682 = v673;
    int v315 = v372;
  }
  uint64_t v432 = *(void *)v689;
  acFilterMultiFaceinSameUbody(a3, v323, *(float32x2_t **)v689, a6, (uint64_t)v667, &v682, (float *)(v322 + 144), (char *)v694[1], v655, v315);
  if (v323)
  {
    uint64_t v433 = v432 + 16;
    v434 = (float32x2_t *)(a3 + 20);
    do
    {
      unsigned int v439 = v434[-2].i32[1] - 1;
      if (v439 <= 0xB) {
        int v435 = dword_246D9F5DC[v439];
      }
      else {
        int v435 = 0;
      }
      float32x2_t v436 = v434[-1];
      float32x2_t v437 = vadd_f32(v436, *v434);
      float v438 = (float)v434[1].u32[0];
      *(float32x2_t *)(v433 - 16) = v436;
      *(float32x2_t *)(v433 - _Block_object_dispose(&STACK[0x488], 8) = v437;
      *(_DWORD *)uint64_t v433 = v435;
      *(float *)(v433 + _Block_object_dispose(&STACK[0x488], 8) = v438 / 1000.0;
      v433 += 32;
      v434 = (float32x2_t *)((char *)v434 + 1724);
      --v19;
    }
    while (v19);
  }
  uint64_t v440 = v682;
  if (!v682)
  {
    unsigned int v442 = 0;
    v452 = *(_OWORD **)&v689[2];
LABEL_552:
    uint64_t v41 = a8;
    unsigned int v35 = a5;
    goto LABEL_553;
  }
  uint64_t v441 = 0;
  unsigned int v442 = 0;
  float v443 = *(float *)(a8 + 36);
  float v444 = *(float *)(a8 + 48);
  v445 = v667;
  do
  {
    uint64_t v446 = *(unsigned int *)&v445[4 * v441];
    uint64_t v447 = a6 + (v446 << 9);
    unsigned int v448 = *(_DWORD *)(v447 + 8) - 1;
    if (v448 > 0xB) {
      int v449 = 0;
    }
    else {
      int v449 = dword_246D9F5DC[v448];
    }
    float32x2_t v450 = vadd_f32(*(float32x2_t *)(v447 + 12), *(float32x2_t *)(v447 + 20));
    float v451 = (float)*(unsigned int *)(v447 + 28);
    v677[0] = *(void *)(v447 + 12);
    v677[1] = v450;
    int v678 = v449;
    float v679 = v451 / 1000.0;
    if (acCheckOverlapBox(v432, v669, (uint64_t)v677, v443, v444))
    {
      v445 = v667;
    }
    else
    {
      v445 = v667;
      if (v441 != v442) {
        *(_DWORD *)&v667[4 * v442] = v446;
      }
      ++v442;
    }
    ++v441;
  }
  while (v440 != v441);
  v452 = *(_OWORD **)&v689[2];
  if (!v442) {
    goto LABEL_552;
  }
  uint64_t v453 = 0;
  unsigned int v35 = a5;
  do
  {
    unsigned __int32 v460 = *(_DWORD *)v445;
    v445 += 4;
    __int32 v459 = v460;
    unint64_t v461 = a6 + ((unint64_t)v460 << 9);
    unsigned int v462 = *(_DWORD *)(v461 + 8) - 1;
    if (v462 <= 0xB) {
      __int32 v454 = dword_246D9F5DC[v462];
    }
    else {
      __int32 v454 = 0;
    }
    float32x2_t v455 = *(float32x2_t *)(v461 + 12);
    float32x2_t v456 = vadd_f32(v455, *(float32x2_t *)(v461 + 20));
    float32_t v457 = (float)*(unsigned int *)(v461 + 28) / 1000.0;
    v458 = (float32x2_t *)&v452[v453];
    float32x2_t *v458 = v455;
    v458[1] = v456;
    v458[3].f32[0] = v457;
    v458[2].i32[0] = v454;
    v458[2].i32[1] = v459;
    v453 += 2;
  }
  while (2 * v442 != v453);
  uint64_t v41 = a8;
LABEL_553:
  unsigned int v463 = acRemoveOverlapBoxes(v452, v442, (unsigned __int8 *)v690[0], *(float *)(v41 + 48));
  float v29 = v648;
  uint64_t v26 = v644;
  if (v463)
  {
    if (v463 > 0xA
      && (v667 < (char *)&v452[2 * v463 - 1] + 8 ? (BOOL v464 = (char *)v452 + 20 >= &v667[4 * v463]) : (BOOL v464 = 1), v464))
    {
      uint64_t v465 = v463 & 3;
      if ((v463 & 3) == 0) {
        uint64_t v465 = 4;
      }
      uint64_t v466 = v463 - v465;
      v467 = (int32x2_t *)(v667 + 8);
      v468 = (int32x2_t *)((char *)v452 + 84);
      uint64_t v469 = v466;
      do
      {
        int32x2_t v470 = vzip1_s32(*v468, v468[4]);
        v467[-1] = vzip1_s32(v468[-8], v468[-4]);
        int32x2_t *v467 = v470;
        v467 += 2;
        v468 += 16;
        v469 -= 4;
      }
      while (v469);
    }
    else
    {
      uint64_t v466 = 0;
    }
    uint64_t v471 = v463 - v466;
    v472 = &v667[4 * v466];
    v473 = (int *)&v452[2 * v466 + 1] + 1;
    do
    {
      int v474 = *v473;
      v473 += 8;
      *(_DWORD *)v472 = v474;
      v472 += 4;
      --v471;
    }
    while (v471);
  }
  unsigned int v682 = v463;
  LODWORD(v19) = v681;
  LODWORD(v17) = v664[0];
LABEL_574:
  unsigned int v477 = v669;
  if (v669 - v19 + v463 <= v35) {
    goto LABEL_639;
  }
  if (v643)
  {
    unsigned int v478 = 0;
  }
  else
  {
    uint64_t v489 = 0;
    unsigned int v478 = 0;
    v490 = (_DWORD *)(a3 + 528);
    do
    {
      if (*v490 == 1)
      {
        v491 = (_DWORD *)(v26 + 8 * v478);
        _DWORD *v491 = v489;
        v491[1] = *(v490 - 2);
        ++v478;
      }
      ++v489;
      v490 += 431;
    }
    while (v669 != v489);
  }
  v479 = v29;
  unint64_t v480 = v478;
  uint64_t v645 = v26;
  bmHeapsort(v26, v478, 8uLL, (int (*)(uint64_t, uint64_t))sub_246D84728);
  if (!v478)
  {
    unsigned int v35 = a5;
    goto LABEL_633;
  }
  unsigned int v35 = a5;
  unsigned int v481 = v669 + v463 - a5;
  if (v19 >= v481)
  {
LABEL_633:
    float v29 = v479;
    goto LABEL_638;
  }
  uint64_t v482 = v480 - 1;
  if (v480 - 1 >= v463 + v669 + ~v19 - a5) {
    uint64_t v482 = v463 + v669 + ~v19 - a5;
  }
  float v29 = v479;
  if (v482)
  {
    uint64_t v483 = v482 + 1;
    uint64_t v482 = (v482 + 1) & 0x1FFFFFFFELL;
    uint64_t v484 = v645;
    v485 = (unsigned int *)(v645 + 8);
    uint64_t v486 = v482;
    do
    {
      unsigned int v487 = *(v485 - 2);
      unsigned int v488 = *v485;
      v485 += 4;
      *(_DWORD *)(a3 + 1724 * v487 + 52_Block_object_dispose(&STACK[0x488], 8) = 2;
      *(_DWORD *)(a3 + 1724 * v488 + 52_Block_object_dispose(&STACK[0x488], 8) = 2;
      v486 -= 2;
    }
    while (v486);
    LODWORD(v19) = v19 + v482;
    if (v483 == v482) {
      goto LABEL_638;
    }
  }
  else
  {
    uint64_t v484 = v645;
  }
  unint64_t v525 = v482 + 1;
  v526 = (unsigned int *)(v484 + 8 * v482);
  do
  {
    unsigned int v527 = *v526;
    v526 += 2;
    *(_DWORD *)(a3 + 1724 * v527 + 52_Block_object_dispose(&STACK[0x488], 8) = 2;
    LODWORD(v19) = v19 + 1;
    if (v525 >= v480) {
      break;
    }
    ++v525;
  }
  while (v19 < v481);
LABEL_638:
  int v681 = v19;
  LODWORD(v17) = v664[0];
  unsigned int v477 = v669;
LABEL_639:
  acTrkObjectPickDet(v655, a2, a3, v477, v35, a6, v17, (uint64_t)v667, &v682, v646, (uint64_t)v631, (uint64_t)v29, v632, *(unsigned char *)(v41 + 194), *(_DWORD *)(v41 + 196));
  if (v643)
  {
    unsigned int v528 = 0;
    v529 = v667;
    v530 = v649;
  }
  else
  {
    uint64_t v602 = 0;
    unsigned int v528 = 0;
    v603 = (int *)a3;
    v529 = v667;
    v530 = v649;
    do
    {
      if (v603[132] <= 1)
      {
        if (v602 != v528)
        {
          memcpy((void *)(a3 + 1724 * v528), v603, 0x6BCuLL);
          v529 = v667;
        }
        ++v528;
      }
      v603 += 431;
      ++v602;
    }
    while (v477 != v602);
  }
  if (v528 >= a5) {
    unint64_t v531 = a5;
  }
  else {
    unint64_t v531 = v528;
  }
  unsigned int v532 = v682;
  if (v682 >= a5) {
    unsigned int v532 = a5;
  }
  if (v532 + v531 <= a5) {
    uint64_t v533 = v532;
  }
  else {
    uint64_t v533 = a5 - v531;
  }
  if (v533)
  {
    unsigned int v668 = v532 + v531;
    int32x4_t v674 = vdupq_n_s32(0xFFFFFE97);
    *(void *)v670 = v531;
    LODWORD(v250) = v531;
    do
    {
      uint64_t v574 = *(unsigned int *)v529;
      v575 = (unsigned int *)(v529 + 4);
      unsigned int v576 = v250;
      v577 = (_DWORD *)(a3 + 1724 * v250);
      bzero(v577, 0x6BCuLL);
      *((int32x4_t *)v577 + 2) = v674;
      v577[12] = -361;
      v577[32] = -1;
      v577[98] = -1;
      v577[105] = -1;
      *(void *)(v577 + 193) = 0xFF7FFFFFFFFFFFFFLL;
      v577[198] = 0;
      *(void *)(v577 + 207) = 0;
      uint64_t v578 = a6 + (v574 << 9);
      v577[209] = 0;
      memcpy(v577, (const void *)v578, 0x200uLL);
      int v579 = (*a12)++;
      _DWORD *v577 = v579;
      v577[131] = LODWORD(a15[v574]);
      int v580 = *(_DWORD *)(v578 + 8);
      v581 = (long long *)(v578 + 12);
      int v582 = *(_DWORD *)(v578 + 40);
      int v583 = *(_DWORD *)(v578 + 44);
      char v584 = *(unsigned char *)(v578 + 100);
      int v585 = *(_DWORD *)(v578 + 420);
      if (v577[2] == 9)
      {
        long long v534 = *v581;
        uint64_t v535 = a3 + 1724 * v576;
        *(_OWORD *)(v535 + 532) = v534;
        *(unsigned char *)(v535 + 54_Block_object_dispose(&STACK[0x488], 8) = v584;
        *(_DWORD *)(v535 + 564) = v585;
        *(_DWORD *)(v535 + 556) = v583;
        *(_DWORD *)(v535 + 552) = v582;
        *(_DWORD *)(v535 + 56_Block_object_dispose(&STACK[0x488], 8) = v580;
        *(_DWORD *)(v535 + 780) = 1;
      }
      else
      {
        uint64_t v586 = a3 + 1724 * v576;
        unsigned int v587 = *(_DWORD *)(v586 + 780);
        if (v587 < 6)
        {
          uint64_t v590 = a3 + 1724 * v576 + 40 * v587;
          *(_OWORD *)(v590 + 532) = *v581;
          *(unsigned char *)(v590 + 54_Block_object_dispose(&STACK[0x488], 8) = v584;
          *(_DWORD *)(v590 + 564) = v585;
          *(_DWORD *)(v590 + 556) = v583;
          *(_DWORD *)(v590 + 552) = v582;
          *(_DWORD *)(v590 + 56_Block_object_dispose(&STACK[0x488], 8) = v580;
          ++*(_DWORD *)(v586 + 780);
        }
        else
        {
          long long v588 = *v581;
          uint64_t v589 = a3 + 1724 * v576;
          *(_OWORD *)(v589 + 732) = v588;
          *(unsigned char *)(v589 + 74_Block_object_dispose(&STACK[0x488], 8) = v584;
          *(_DWORD *)(v589 + 764) = v585;
          *(_DWORD *)(v589 + 756) = v583;
          *(_DWORD *)(v589 + 752) = v582;
          *(_DWORD *)(v589 + 76_Block_object_dispose(&STACK[0x488], 8) = v580;
        }
      }
      v529 = (char *)v575;
      uint64_t v536 = a6 + (v574 << 9);
      uint64_t v537 = a3 + 1724 * v576;
      *(_OWORD *)(v537 + 1664) = *(_OWORD *)(v536 + 12);
      *(_OWORD *)(v537 + 1680) = *(_OWORD *)(v536 + 12);
      long long v538 = *(_OWORD *)(v536 + 212);
      long long v539 = *(_OWORD *)(v536 + 244);
      long long v540 = *(_OWORD *)(v536 + 196);
      *(_OWORD *)(v537 + 976) = *(_OWORD *)(v536 + 228);
      *(_OWORD *)(v537 + 992) = v539;
      *(_OWORD *)(v537 + 944) = v540;
      *(_OWORD *)(v537 + 960) = v538;
      long long v541 = *(_OWORD *)(v536 + 292);
      long long v543 = *(_OWORD *)(v536 + 260);
      long long v542 = *(_OWORD *)(v536 + 276);
      *(_OWORD *)(v537 + 1056) = *(_OWORD *)(v536 + 308);
      *(_OWORD *)(v537 + 1040) = v541;
      *(_OWORD *)(v537 + 100_Block_object_dispose(&STACK[0x488], 8) = v543;
      *(_OWORD *)(v537 + 1024) = v542;
      long long v544 = *(_OWORD *)(v536 + 356);
      long long v545 = *(_OWORD *)(v536 + 372);
      long long v546 = *(_OWORD *)(v536 + 340);
      *(_OWORD *)(v537 + 1072) = *(_OWORD *)(v536 + 324);
      *(_OWORD *)(v537 + 1120) = v545;
      *(_OWORD *)(v537 + 1104) = v544;
      *(_OWORD *)(v537 + 108_Block_object_dispose(&STACK[0x488], 8) = v546;
      long long v547 = *(_OWORD *)(v536 + 132);
      long long v548 = *(_OWORD *)(v536 + 148);
      long long v549 = *(_OWORD *)(v536 + 180);
      *(_OWORD *)(v537 + 912) = *(_OWORD *)(v536 + 164);
      *(_OWORD *)(v537 + 92_Block_object_dispose(&STACK[0x488], 8) = v549;
      *(_OWORD *)(v537 + 880) = v547;
      *(_OWORD *)(v537 + 896) = v548;
      long long v550 = *(_OWORD *)(v536 + 132);
      long long v551 = *(_OWORD *)(v536 + 148);
      long long v552 = *(_OWORD *)(v536 + 164);
      *(_OWORD *)(v537 + 1184) = *(_OWORD *)(v536 + 180);
      *(_OWORD *)(v537 + 116_Block_object_dispose(&STACK[0x488], 8) = v552;
      *(_OWORD *)(v537 + 1152) = v551;
      *(_OWORD *)(v537 + 1136) = v550;
      long long v553 = *(_OWORD *)(v536 + 196);
      long long v554 = *(_OWORD *)(v536 + 212);
      long long v555 = *(_OWORD *)(v536 + 228);
      *(_OWORD *)(v537 + 124_Block_object_dispose(&STACK[0x488], 8) = *(_OWORD *)(v536 + 244);
      *(_OWORD *)(v537 + 1232) = v555;
      *(_OWORD *)(v537 + 1216) = v554;
      *(_OWORD *)(v537 + 1200) = v553;
      long long v556 = *(_OWORD *)(v536 + 260);
      long long v557 = *(_OWORD *)(v536 + 276);
      long long v558 = *(_OWORD *)(v536 + 292);
      *(_OWORD *)(v537 + 1312) = *(_OWORD *)(v536 + 308);
      *(_OWORD *)(v537 + 1296) = v558;
      *(_OWORD *)(v537 + 1280) = v557;
      *(_OWORD *)(v537 + 1264) = v556;
      long long v559 = *(_OWORD *)(v536 + 324);
      long long v560 = *(_OWORD *)(v536 + 340);
      long long v561 = *(_OWORD *)(v536 + 356);
      *(_OWORD *)(v537 + 1376) = *(_OWORD *)(v536 + 372);
      *(_OWORD *)(v537 + 1360) = v561;
      *(_OWORD *)(v537 + 1344) = v560;
      *(_OWORD *)(v537 + 132_Block_object_dispose(&STACK[0x488], 8) = v559;
      long long v562 = *(_OWORD *)(v536 + 132);
      long long v563 = *(_OWORD *)(v536 + 148);
      long long v564 = *(_OWORD *)(v536 + 164);
      *(_OWORD *)(v537 + 1440) = *(_OWORD *)(v536 + 180);
      *(_OWORD *)(v537 + 1424) = v564;
      *(_OWORD *)(v537 + 140_Block_object_dispose(&STACK[0x488], 8) = v563;
      *(_OWORD *)(v537 + 1392) = v562;
      long long v565 = *(_OWORD *)(v536 + 196);
      long long v566 = *(_OWORD *)(v536 + 212);
      long long v567 = *(_OWORD *)(v536 + 228);
      *(_OWORD *)(v537 + 1504) = *(_OWORD *)(v536 + 244);
      *(_OWORD *)(v537 + 148_Block_object_dispose(&STACK[0x488], 8) = v567;
      *(_OWORD *)(v537 + 1472) = v566;
      *(_OWORD *)(v537 + 1456) = v565;
      long long v568 = *(_OWORD *)(v536 + 260);
      long long v569 = *(_OWORD *)(v536 + 276);
      long long v570 = *(_OWORD *)(v536 + 292);
      *(_OWORD *)(v537 + 156_Block_object_dispose(&STACK[0x488], 8) = *(_OWORD *)(v536 + 308);
      *(_OWORD *)(v537 + 1552) = v570;
      *(_OWORD *)(v537 + 1536) = v569;
      *(_OWORD *)(v537 + 1520) = v568;
      long long v571 = *(_OWORD *)(v536 + 324);
      long long v572 = *(_OWORD *)(v536 + 340);
      long long v573 = *(_OWORD *)(v536 + 356);
      *(_OWORD *)(v537 + 1632) = *(_OWORD *)(v536 + 372);
      *(_OWORD *)(v537 + 1616) = v573;
      *(_OWORD *)(v537 + 1600) = v572;
      *(_OWORD *)(v537 + 1584) = v571;
      *(float *)(v537 + 164_Block_object_dispose(&STACK[0x488], 8) = (float)*(unsigned int *)(v536 + 28);
      unint64_t v250 = v576 + 1;
      --v533;
    }
    while (v533);
    unint64_t v531 = *(void *)v670;
    unsigned int v591 = v250 - v670[0];
    *a10 = v250 - v670[0];
    if (v250 <= v670[0])
    {
      v595 = a11;
      *a11 = 0;
      unsigned int v28 = v661;
      v530 = v649;
      if (!v670[0]) {
        goto LABEL_695;
      }
      goto LABEL_685;
    }
    if (a5 >= v668) {
      uint64_t v592 = v668;
    }
    else {
      uint64_t v592 = a5;
    }
    unint64_t v593 = v592 - *(void *)v670;
    unint64_t v594 = *(void *)v670;
    v595 = a11;
    unsigned int v28 = v661;
    v530 = v649;
    if (v593 <= 7)
    {
      do
      {
LABEL_666:
        v661->i32[v594 - *(void *)v670] = v594;
        ++v594;
      }
      while (v250 != v594);
    }
    else
    {
      unint64_t v596 = v593 & 0xFFFFFFFFFFFFFFF8;
      int32x4_t v597 = vaddq_s32(vdupq_n_s32(v670[0]), (int32x4_t)xmmword_246D9F130);
      v598 = v661 + 1;
      v599.i64[0] = 0x400000004;
      v599.i64[1] = 0x400000004;
      v600.i64[0] = 0x800000008;
      v600.i64[1] = 0x800000008;
      unint64_t v601 = v593 & 0xFFFFFFFFFFFFFFF8;
      do
      {
        v598[-1] = v597;
        int32x4_t *v598 = vaddq_s32(v597, v599);
        int32x4_t v597 = vaddq_s32(v597, v600);
        v598 += 2;
        v601 -= 8;
      }
      while (v601);
      if (v593 != v596)
      {
        unint64_t v594 = v596 + *(void *)v670;
        goto LABEL_666;
      }
    }
    *a11 = 0;
    if (a6)
    {
LABEL_668:
      if (!v531) {
        goto LABEL_695;
      }
LABEL_685:
      uint64_t v604 = 0;
      v605 = (_DWORD *)(a3 + 512);
      do
      {
        if (!*v605)
        {
          v28->i32[v591++] = v604;
          ++*v595;
        }
        v605 += 431;
        ++v604;
      }
      while (v531 != v604);
      uint64_t v606 = 0;
      v607 = (_DWORD *)(a3 + 512);
      do
      {
        if (*v607) {
          v28->i32[v591++] = v606;
        }
        v607 += 431;
        ++v606;
      }
      while (v531 != v606);
      goto LABEL_695;
    }
  }
  else
  {
    unsigned int v591 = 0;
    v595 = a11;
    *a10 = 0;
    unint64_t v250 = v531;
    *a11 = 0;
    if (a6) {
      goto LABEL_668;
    }
  }
  if (!v531) {
    goto LABEL_695;
  }
  if (v531 <= 0xB || __CFADD__(v591, v531 - 1))
  {
    for (uint64_t i = 0; i != v531; ++i)
LABEL_682:
      v28->i32[v591 + i] = i;
    goto LABEL_695;
  }
  int32x4_t v608 = (int32x4_t)xmmword_246D9F130;
  uint64_t i = v531 & 0xFFFFFFF8;
  v610.i64[0] = 0x400000004;
  v610.i64[1] = 0x400000004;
  v611.i64[0] = 0x800000008;
  v611.i64[1] = 0x800000008;
  unsigned int v612 = v591;
  uint64_t v613 = i;
  do
  {
    v614 = (int32x4_t *)((char *)v28 + 4 * v612);
    int32x4_t *v614 = v608;
    v614[1] = vaddq_s32(v608, v610);
    int32x4_t v608 = vaddq_s32(v608, v611);
    v612 += 8;
    v613 -= 8;
  }
  while (v613);
  if (i != v531) {
    goto LABEL_682;
  }
LABEL_695:
  bzero(v530, v250);
  if (v250)
  {
    uint64_t v615 = 0;
    do
    {
      if (!*((unsigned char *)v530 + v615))
      {
        memcpy(__src, (const void *)(a3 + 1724 * v615), 0x6BCuLL);
        *((unsigned char *)v530 + v615) = 1;
        uint64_t v616 = v28->u32[v615];
        v617 = v530;
        uint64_t v618 = v615;
        if (v615 != v616)
        {
          uint64_t v618 = v615;
          do
          {
            memcpy((void *)(a3 + 1724 * v618), (const void *)(a3 + 1724 * v616), 0x6BCuLL);
            uint64_t v618 = v28->u32[v618];
            v617[v618] = 1;
            uint64_t v616 = v28->u32[v618];
          }
          while (v615 != v616);
        }
        memcpy((void *)(a3 + 1724 * v618), __src, 0x6BCuLL);
        v530 = v617;
      }
      ++v615;
    }
    while (v615 != v250);
    uint64_t v619 = 0;
    float v620 = *(float *)(a8 + 188);
    do
    {
      uint64_t v624 = a3 + v619;
      int v625 = *(_DWORD *)(a3 + v619 + 520);
      if (v625 == -1) {
        int v626 = -1;
      }
      else {
        int v626 = v625 + 1;
      }
      *(_DWORD *)(v624 + 520) = v626;
      float v627 = *(float *)(v624 + 20) * *(float *)(v624 + 24);
      *(float *)(v624 + 82_Block_object_dispose(&STACK[0x488], 8) = v627;
      *(float *)(v624 + 832) = v627 / (float)((float)(a2 * v655) + 0.0001);
      if (!*(_DWORD *)(v624 + 8))
      {
        ++*(_DWORD *)(v624 + 784);
        if (*(unsigned char *)(v624 + 100))
        {
          uint64_t v628 = a3 + v619;
          ++*(_DWORD *)(a3 + v619 + 824);
          int v623 = *(_DWORD *)(a3 + v619 + 44);
          if (v623 >= 501)
          {
            v623 -= 1080;
            *(_DWORD *)(v628 + 44) = v623;
          }
          int v621 = (v623 + 540) % 360;
          if (v621 > 0xFFFFFE97) {
            v621 += 360;
          }
          unsigned int v622 = (int)(float)((float)((float)v621 / 30.0) + 0.5) % 12;
          if (v622 > 0xFFFFFFF3) {
            v622 += 12;
          }
          *(_DWORD *)(v628 + 36) = *(_DWORD *)(a16 + 4 * v622);
          if ((float)((float)v623 + 0.00000011921) < 0.0) {
            v623 += 360;
          }
          *(_DWORD *)(v628 + 44) = v623;
        }
        else
        {
          uint64_t v629 = a3 + v619;
          if (*(float *)(a3 + v619 + 524) >= v620) {
            *(_DWORD *)(v629 + 836) = 0;
          }
          else {
            ++*(_DWORD *)(v629 + 836);
          }
        }
      }
      v619 += 1724;
    }
    while (1724 * v250 != v619);
  }
  return v250;
}

uint64_t sub_246D82AB8(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _DWORD *a8, uint64_t a9, _DWORD *a10, uint64_t a11, uint64_t a12, int a13, unsigned int a14)
{
  uint64_t v15 = a3;
  unsigned int v16 = a2;
  uint64_t v17 = result;
  unint64_t v18 = a10;
  *a8 = 0;
  *a10 = 0;
  if (!a2) {
    goto LABEL_9;
  }
  if (a2 == 1)
  {
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v19 = a2 & 0xFFFFFFFE;
    unint64_t v20 = (_DWORD *)result;
    uint64_t v21 = v19;
    do
    {
      v20[132] = 0;
      v20[563] = 0;
      v20[112] = 1;
      v20[543] = 1;
      v20 += 862;
      v21 -= 2;
    }
    while (v21);
    if (v19 == a2) {
      goto LABEL_9;
    }
  }
  uint64_t v22 = a2 - v19;
  int v23 = (_DWORD *)(result + 1724 * v19 + 448);
  do
  {
    v23[20] = 0;
    *int v23 = 1;
    v23 += 431;
    --v22;
  }
  while (v22);
LABEL_9:
  if (a2 <= a4) {
    uint64_t v24 = a4;
  }
  else {
    uint64_t v24 = a2;
  }
  if (v24)
  {
    unint64_t v25 = 0;
    uint64_t v105 = result + 880;
    uint64_t v26 = a3 + 132;
    uint64_t v103 = result + 1136;
    unsigned int v27 = a14;
    uint64_t result = 1;
    uint64_t v28 = a9;
    uint64_t v104 = v15 + 132;
    a4 = a4;
    uint64_t v111 = a6;
    float v112 = a8;
    uint64_t v109 = v15;
    uint64_t v110 = a5;
    uint64_t v107 = v24;
    unint64_t v106 = a4;
    while (1)
    {
      unsigned int v29 = *(_DWORD *)(a5 + 4 * v25);
      if (v25 >= a4)
      {
        uint64_t v36 = v17 + 1724 * v29;
        unsigned int v33 = *(_DWORD *)(v36 + 512) + 1;
        *(_DWORD *)(v36 + 512) = v33;
        uint64_t v34 = *(unsigned int *)(v36 + 8);
        switch((int)v34)
        {
          case 0:
            if (*(unsigned char *)(v36 + 100))
            {
LABEL_43:
              unsigned int v35 = *(_DWORD *)(a7 + 60);
              if (v16 > 2) {
                unsigned int v35 = 2;
              }
            }
            else
            {
LABEL_21:
              unsigned int v35 = 2;
            }
            goto LABEL_40;
          case 1:
            goto LABEL_39;
          case 2:
          case 4:
LABEL_23:
            uint64_t v34 = 2;
            goto LABEL_39;
          case 3:
          case 5:
LABEL_25:
            uint64_t v34 = 3;
            goto LABEL_39;
          case 8:
LABEL_38:
            uint64_t v34 = 4;
            goto LABEL_39;
          default:
LABEL_35:
            BOOL v40 = (v34 & 0xFFFFFFFE) == 10;
            uint64_t v34 = 5;
            if (v40) {
              uint64_t v34 = 6;
            }
LABEL_39:
            unsigned int v35 = *(_DWORD *)(a7 + 4 * v34 + 60);
LABEL_40:
            float32x2_t v42 = (_DWORD *)(v17 + 1724 * v29 + 528);
            if (v33 < v35)
            {
              _DWORD *v42 = 1;
            }
            else
            {
              _DWORD *v42 = 2;
              ++*a8;
            }
            break;
        }
        goto LABEL_15;
      }
      if (v29 < v16) {
        break;
      }
      uint64_t v37 = *v18;
      _DWORD *v18 = v37 + 1;
      *(_DWORD *)(v28 + 4 * v37) = v25;
LABEL_15:
      ++v25;
      v26 += 512;
      if (v25 == v24) {
        return result;
      }
    }
    uint64_t v30 = v17 + 1724 * v29;
    if ((float)(1.0 - *(float *)(a6 + 4 * (v25 + v29 * v24))) < *(float *)a7)
    {
      uint64_t v31 = *v18;
      _DWORD *v18 = v31 + 1;
      *(_DWORD *)(v28 + 4 * v31) = v25;
      uint64_t v32 = v17 + 1724 * v29;
      unsigned int v33 = *(_DWORD *)(v32 + 512) + 1;
      *(_DWORD *)(v32 + 512) = v33;
      uint64_t v34 = *(unsigned int *)(v30 + 8);
      switch((int)v34)
      {
        case 0:
          if (!*(unsigned char *)(v30 + 100)) {
            goto LABEL_21;
          }
          goto LABEL_43;
        case 1:
          goto LABEL_39;
        case 2:
        case 4:
          goto LABEL_23;
        case 3:
        case 5:
          goto LABEL_25;
        case 8:
          goto LABEL_38;
        default:
          goto LABEL_35;
      }
    }
    *(_DWORD *)(v17 + 1724 * v29 + 512) = 0;
    if (!*(unsigned char *)(a7 + 176)) {
      goto LABEL_73;
    }
    int v114 = *(_DWORD *)v30;
    int v38 = *(_DWORD *)(v30 + 8);
    int v39 = *(_DWORD *)(v15 + (v25 << 9) + 8);
    if (v38 == v39 || (v38 == 4 ? (BOOL v40 = v39 == 2) : (BOOL v40 = 0), v40))
    {
LABEL_51:
      int v41 = *(_DWORD *)(v30 + 4);
    }
    else
    {
      int v41 = 0;
      switch(v38)
      {
        case 2:
          if (v39 == 4) {
            goto LABEL_51;
          }
          goto LABEL_34;
        case 3:
          if (v39 == 5) {
            goto LABEL_51;
          }
          goto LABEL_34;
        case 5:
          if (v39 == 3) {
            goto LABEL_51;
          }
          goto LABEL_34;
        case 10:
          if (v39 == 11) {
            goto LABEL_51;
          }
          goto LABEL_34;
        case 11:
          if (v39 == 10) {
            goto LABEL_51;
          }
LABEL_34:
          int v41 = 0;
          break;
        default:
          break;
      }
    }
    int v113 = *(_DWORD *)(v30 + 8);
    uint64_t v116 = 0;
    *(void *)BOOL v117 = 0;
    uint64_t v43 = (char *)(v15 + (v25 << 9));
    acTrkLabelCenterSizeSmoothing((int *)v30, v43, v17, v16, a7, v41, a13, v27, (float *)&v117[1], (float *)v117, (float *)&v116 + 1, (float *)&v116);
    uint64_t v44 = a7;
    uint64_t v45 = v15;
    int v46 = *(_DWORD *)(v30 + 44);
    memcpy((void *)v30, v43, 0x200uLL);
    *(_DWORD *)(v30 + 44_Block_object_dispose(&STACK[0x488], 8) = 0;
    uint64_t v47 = v45 + (v25 << 9);
    a7 = v44;
    uint64_t v48 = *(void *)v117;
    *(float32x2_t *)(v30 + 12) = vadd_f32(*(float32x2_t *)(v30 + 12), vmul_f32(vsub_f32(*(float32x2_t *)(v47 + 20), (float32x2_t)__PAIR64__(v117[0], v117[1])), (float32x2_t)0x3F0000003F000000));
    *(_DWORD *)(v30 + 20) = HIDWORD(v48);
    *(_DWORD *)(v30 + 24) = v48;
    *(_DWORD *)uint64_t v30 = v114;
    *(_DWORD *)(v30 + 4) = v41;
    if (*(_DWORD *)(v17 + 1724 * v29 + 788) < (*(_DWORD *)(v17 + 1724 * v29 + 804)
                                                              + *(_DWORD *)(v44 + 160))
      && *(_DWORD *)(v17 + 1724 * v29 + 792))
    {
      int v49 = v116;
      *(_DWORD *)(v30 + 12) = HIDWORD(v116);
      *(_DWORD *)(v30 + 16) = v49;
    }
    memcpy(__dst, v43, sizeof(__dst));
    uint64_t v50 = v44;
    unsigned int v27 = a14;
    acTrkFacialAttrTemporalSmoothing(v30, (uint64_t)__dst, v46, v50, a14, a13, *(float *)(a12 + 4 * v25));
    if (*(unsigned char *)(a7 + 193)) {
      acTrkHandChiralityTemporalSmoothing((_DWORD *)v30, (uint64_t)v43, v113, *(_DWORD *)(a7 + 216), *(_DWORD *)(a7 + 220), *(unsigned char *)(a7 + 205), *(_DWORD *)(a7 + 208), *(unsigned char *)(a7 + 212));
    }
    *(_DWORD *)(v17 + 1724 * v29 + 524) = *(_DWORD *)(a12 + 4 * v25);
    a6 = v111;
    a8 = v112;
    uint64_t v15 = v109;
    a5 = v110;
    unsigned int v16 = a2;
    uint64_t v24 = v107;
    unint64_t v18 = a10;
    uint64_t result = 1;
    a4 = v106;
    uint64_t v28 = a9;
    if (*(_DWORD *)(v30 + 8) != 9)
    {
LABEL_73:
      *(_DWORD *)(a11 + 4 * v25) = v29;
      goto LABEL_15;
    }
    uint64_t v52 = v109 + (v25 << 9);
    float v54 = *(float *)(v52 + 132);
    long long v53 = (float32x4_t *)(v52 + 132);
    long long v55 = (float *)(v17 + 1724 * v29);
    float v56 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v55[220] + 0.0) + v55[221]) + v55[222]) + v55[223]) + v55[224]) + v55[225]) + v55[226]) + v55[227]) + v55[228]) + v55[229]) + v55[230]) + v55[231]) + v55[232]) + v55[233]) + v55[234]) + v55[235]) + v55[236]) + v55[237]) + v55[238]) + v55[239]) + v55[240]) + v55[241]) + v55[242]) + v55[243]) + v55[244]) + v55[245]) + v55[246]) + v55[247]) + v55[248]) + v55[249])
                                                                                                + v55[250])
                                                                                        + v55[251])
                                                                                + v55[252])
                                                                        + v55[253])
                                                                + v55[254])
                                                        + v55[255])
                                                + v55[256])
                                        + v55[257])
                                + v55[258])
                        + v55[259])
                + v55[260])
        + v55[261];
    float v57 = v53[3].f32[0];
    float v58 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v54 * v54) + 0.0) + (float)(v53->f32[1] * v53->f32[1])) + (float)(v53->f32[2] * v53->f32[2])) + (float)(v53->f32[3] * v53->f32[3])) + (float)(v53[1].f32[0] * v53[1].f32[0])) + (float)(v53[1].f32[1] * v53[1].f32[1])) + (float)(v53[1].f32[2] * v53[1].f32[2])) + (float)(v53[1].f32[3] * v53[1].f32[3])) + (float)(v53[2].f32[0] * v53[2].f32[0]))
                                                                                                + (float)(v53[2].f32[1] * v53[2].f32[1]))
                                                                                        + (float)(v53[2].f32[2]
                                                                                                * v53[2].f32[2]))
                                                                                + (float)(v53[2].f32[3] * v53[2].f32[3]))
                                                                        + (float)(v57 * v57))
                                                                + (float)(v53[3].f32[1] * v53[3].f32[1]))
                                                        + (float)(v53[3].f32[2] * v53[3].f32[2]))
                                                + (float)(v53[3].f32[3] * v53[3].f32[3]))
                                        + (float)(v53[4].f32[0] * v53[4].f32[0]))
                                + (float)(v53[4].f32[1] * v53[4].f32[1]))
                        + (float)(v53[4].f32[2] * v53[4].f32[2]))
                + (float)(v53[4].f32[3] * v53[4].f32[3]))
        + (float)(v53[5].f32[0] * v53[5].f32[0]);
    float v59 = v53[8].f32[0];
    float v60 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v58 + (float)(v53[5].f32[1] * v53[5].f32[1])) + (float)(v53[5].f32[2] * v53[5].f32[2])) + (float)(v53[5].f32[3] * v53[5].f32[3])) + (float)(v53[6].f32[0] * v53[6].f32[0])) + (float)(v53[6].f32[1] * v53[6].f32[1])) + (float)(v53[6].f32[2] * v53[6].f32[2])) + (float)(v53[6].f32[3] * v53[6].f32[3])) + (float)(v53[7].f32[0] * v53[7].f32[0])) + (float)(v53[7].f32[1] * v53[7].f32[1])) + (float)(v53[7].f32[2] * v53[7].f32[2]))
                                                                                                + (float)(v53[7].f32[3] * v53[7].f32[3]))
                                                                                        + (float)(v59 * v59))
                                                                                + (float)(v53[8].f32[1] * v53[8].f32[1]))
                                                                        + (float)(v53[8].f32[2] * v53[8].f32[2]))
                                                                + (float)(v53[8].f32[3] * v53[8].f32[3]))
                                                        + (float)(v53[9].f32[0] * v53[9].f32[0]))
                                                + (float)(v53[9].f32[1] * v53[9].f32[1]))
                                        + (float)(v53[9].f32[2] * v53[9].f32[2]))
                                + (float)(v53[9].f32[3] * v53[9].f32[3]))
                        + (float)(v53[10].f32[0] * v53[10].f32[0]))
                + (float)(v53[10].f32[1] * v53[10].f32[1]))
        + (float)(v53[10].f32[2] * v53[10].f32[2]);
    float v61 = v53[13].f32[2];
    BOOL v62 = fabsf((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v56 + v55[262]) + v55[263]) + v55[264]) + v55[265]) + v55[266]) + v55[267]) + v55[268]) + v55[269]) + v55[270]) + v55[271])+ v55[272])+ v55[273])+ v55[274])+ v55[275])+ v55[276])+ v55[277])+ v55[278])+ v55[279])+ v55[280])+ v55[281])+ v55[282])+ v55[283]) < 0.0001;
    v51.f32[0] = sqrtf((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v60 + (float)(v53[10].f32[3] * v53[10].f32[3])) + (float)(v53[11].f32[0] * v53[11].f32[0])) + (float)(v53[11].f32[1] * v53[11].f32[1])) + (float)(v53[11].f32[2] * v53[11].f32[2])) + (float)(v53[11].f32[3] * v53[11].f32[3])) + (float)(v53[12].f32[0] * v53[12].f32[0])) + (float)(v53[12].f32[1] * v53[12].f32[1])) + (float)(v53[12].f32[2] * v53[12].f32[2])) + (float)(v53[12].f32[3] * v53[12].f32[3])) + (float)(v53[13].f32[0] * v53[13].f32[0]))+ (float)(v53[13].f32[1] * v53[13].f32[1]))+ (float)(v61 * v61))+ (float)(v53[13].f32[3]* v53[13].f32[3]))+ (float)(v53[14].f32[0] * v53[14].f32[0]))+ (float)(v53[14].f32[1] * v53[14].f32[1]))+ (float)(v53[14].f32[2] * v53[14].f32[2]))+ (float)(v53[14].f32[3] * v53[14].f32[3]))+ (float)(v53[15].f32[0] * v53[15].f32[0]))+ (float)(v53[15].f32[1] * v53[15].f32[1]))+ (float)(v53[15].f32[2] * v53[15].f32[2]))+ (float)(v53[15].f32[3] * v53[15].f32[3]))+ 0.0000001;
    uint64_t v63 = v25 << 9;
    float v64 = (float32x4_t *)(v55 + 220);
    uint64_t v65 = 1724 * v29;
    if (v62)
    {
      if ((unint64_t)(v105 + v65 - (v104 + v63)) <= 0x1F)
      {
        for (uint64_t i = 0; i != 64; ++i)
          v64->f32[i] = *(float *)(v26 + i * 4) / v51.f32[0];
        goto LABEL_72;
      }
      float32x4_t v69 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v51.f32, 0);
      float32x4_t v70 = vdivq_f32(v53[1], v69);
      *float v64 = vdivq_f32(*v53, v69);
      v64[1] = v70;
      float32x4_t v71 = vdivq_f32(v53[3], v69);
      v64[2] = vdivq_f32(v53[2], v69);
      v64[3] = v71;
      float32x4_t v72 = vdivq_f32(v53[5], v69);
      v64[4] = vdivq_f32(v53[4], v69);
      v64[5] = v72;
      float32x4_t v73 = vdivq_f32(v53[7], v69);
      v64[6] = vdivq_f32(v53[6], v69);
      v64[7] = v73;
      float32x4_t v74 = vdivq_f32(v53[9], v69);
      v64[8] = vdivq_f32(v53[8], v69);
      v64[9] = v74;
      float32x4_t v75 = vdivq_f32(v53[11], v69);
      v64[10] = vdivq_f32(v53[10], v69);
      v64[11] = v75;
      float32x4_t v76 = vdivq_f32(v53[13], v69);
      v64[12] = vdivq_f32(v53[12], v69);
      v64[13] = v76;
      float32x4_t v77 = vdivq_f32(v53[14], v69);
      float32x4_t v51 = vdivq_f32(v53[15], v69);
    }
    else
    {
      uint64_t v67 = v109 + v63;
      if ((unint64_t)v64 < v67 + 388 && v67 + 132 < (unint64_t)(v103 + v65))
      {
        for (uint64_t j = 0; j != 64; ++j)
          v64->f32[j] = (float)((float)(*(float *)(v26 + j * 4) * 0.2) / v51.f32[0]) + (float)(v64->f32[j] * 0.8);
        goto LABEL_72;
      }
      float32x4_t v78 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v51.f32, 0);
      float32x4_t v79 = (float32x4_t)vdupq_n_s32(0x3E4CCCCCu);
      float32x4_t v80 = (float32x4_t)vdupq_n_s32(0x3F4CCCCDu);
      float32x4_t v81 = vmlaq_f32(vdivq_f32(vmulq_f32(v53[1], v79), v78), v80, v64[1]);
      *float v64 = vmlaq_f32(vdivq_f32(vmulq_f32(*v53, v79), v78), v80, *v64);
      v64[1] = v81;
      float32x4_t v82 = vmlaq_f32(vdivq_f32(vmulq_f32(v53[3], v79), v78), v80, v64[3]);
      v64[2] = vmlaq_f32(vdivq_f32(vmulq_f32(v53[2], v79), v78), v80, v64[2]);
      v64[3] = v82;
      float32x4_t v83 = vmlaq_f32(vdivq_f32(vmulq_f32(v53[5], v79), v78), v80, v64[5]);
      v64[4] = vmlaq_f32(vdivq_f32(vmulq_f32(v53[4], v79), v78), v80, v64[4]);
      v64[5] = v83;
      float32x4_t v84 = vmlaq_f32(vdivq_f32(vmulq_f32(v53[7], v79), v78), v80, v64[7]);
      v64[6] = vmlaq_f32(vdivq_f32(vmulq_f32(v53[6], v79), v78), v80, v64[6]);
      v64[7] = v84;
      float32x4_t v85 = vmlaq_f32(vdivq_f32(vmulq_f32(v53[9], v79), v78), v80, v64[9]);
      v64[8] = vmlaq_f32(vdivq_f32(vmulq_f32(v53[8], v79), v78), v80, v64[8]);
      v64[9] = v85;
      float32x4_t v86 = vmlaq_f32(vdivq_f32(vmulq_f32(v53[11], v79), v78), v80, v64[11]);
      v64[10] = vmlaq_f32(vdivq_f32(vmulq_f32(v53[10], v79), v78), v80, v64[10]);
      v64[11] = v86;
      float32x4_t v87 = vmlaq_f32(vdivq_f32(vmulq_f32(v53[13], v79), v78), v80, v64[13]);
      v64[12] = vmlaq_f32(vdivq_f32(vmulq_f32(v53[12], v79), v78), v80, v64[12]);
      v64[13] = v87;
      float32x4_t v88 = vmulq_f32(v53[15], v79);
      float32x4_t v77 = vmlaq_f32(vdivq_f32(vmulq_f32(v53[14], v79), v78), v80, v64[14]);
      float32x4_t v51 = vmlaq_f32(vdivq_f32(v88, v78), v80, v64[15]);
    }
    v64[14] = v77;
    v64[15] = v51;
LABEL_72:
    float v89 = v64[3].f32[0];
    v51.f32[0] = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v64->f32[0] * v64->f32[0]) + 0.0) + (float)(v64->f32[1] * v64->f32[1])) + (float)(v64->f32[2] * v64->f32[2])) + (float)(v64->f32[3] * v64->f32[3])) + (float)(v64[1].f32[0] * v64[1].f32[0])) + (float)(v64[1].f32[1] * v64[1].f32[1])) + (float)(v64[1].f32[2] * v64[1].f32[2])) + (float)(v64[1].f32[3] * v64[1].f32[3])) + (float)(v64[2].f32[0] * v64[2].f32[0])) + (float)(v64[2].f32[1] * v64[2].f32[1]))
                                                                                               + (float)(v64[2].f32[2] * v64[2].f32[2]))
                                                                                       + (float)(v64[2].f32[3]
                                                                                               * v64[2].f32[3]))
                                                                               + (float)(v89 * v89))
                                                                       + (float)(v64[3].f32[1] * v64[3].f32[1]))
                                                               + (float)(v64[3].f32[2] * v64[3].f32[2]))
                                                       + (float)(v64[3].f32[3] * v64[3].f32[3]))
                                               + (float)(v64[4].f32[0] * v64[4].f32[0]))
                                       + (float)(v64[4].f32[1] * v64[4].f32[1]))
                               + (float)(v64[4].f32[2] * v64[4].f32[2]))
                       + (float)(v64[4].f32[3] * v64[4].f32[3]))
               + (float)(v64[5].f32[0] * v64[5].f32[0]);
    float v90 = v64[8].f32[0];
    v51.f32[0] = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v51.f32[0] + (float)(v64[5].f32[1] * v64[5].f32[1])) + (float)(v64[5].f32[2] * v64[5].f32[2])) + (float)(v64[5].f32[3] * v64[5].f32[3])) + (float)(v64[6].f32[0] * v64[6].f32[0])) + (float)(v64[6].f32[1] * v64[6].f32[1])) + (float)(v64[6].f32[2] * v64[6].f32[2])) + (float)(v64[6].f32[3] * v64[6].f32[3])) + (float)(v64[7].f32[0] * v64[7].f32[0])) + (float)(v64[7].f32[1] * v64[7].f32[1])) + (float)(v64[7].f32[2] * v64[7].f32[2])) + (float)(v64[7].f32[3] * v64[7].f32[3]))
                                                                                               + (float)(v90 * v90))
                                                                                       + (float)(v64[8].f32[1]
                                                                                               * v64[8].f32[1]))
                                                                               + (float)(v64[8].f32[2] * v64[8].f32[2]))
                                                                       + (float)(v64[8].f32[3] * v64[8].f32[3]))
                                                               + (float)(v64[9].f32[0] * v64[9].f32[0]))
                                                       + (float)(v64[9].f32[1] * v64[9].f32[1]))
                                               + (float)(v64[9].f32[2] * v64[9].f32[2]))
                                       + (float)(v64[9].f32[3] * v64[9].f32[3]))
                               + (float)(v64[10].f32[0] * v64[10].f32[0]))
                       + (float)(v64[10].f32[1] * v64[10].f32[1]))
               + (float)(v64[10].f32[2] * v64[10].f32[2]);
    float v91 = v64[13].f32[2];
    float v92 = v64[15].f32[3];
    v51.f32[0] = sqrtf((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v51.f32[0] + (float)(v64[10].f32[3] * v64[10].f32[3])) + (float)(v64[11].f32[0] * v64[11].f32[0])) + (float)(v64[11].f32[1] * v64[11].f32[1])) + (float)(v64[11].f32[2] * v64[11].f32[2])) + (float)(v64[11].f32[3] * v64[11].f32[3])) + (float)(v64[12].f32[0] * v64[12].f32[0])) + (float)(v64[12].f32[1] * v64[12].f32[1])) + (float)(v64[12].f32[2] * v64[12].f32[2])) + (float)(v64[12].f32[3] * v64[12].f32[3])) + (float)(v64[13].f32[0] * v64[13].f32[0]))+ (float)(v64[13].f32[1] * v64[13].f32[1]))+ (float)(v91 * v91))+ (float)(v64[13].f32[3]* v64[13].f32[3]))+ (float)(v64[14].f32[0] * v64[14].f32[0]))+ (float)(v64[14].f32[1] * v64[14].f32[1]))+ (float)(v64[14].f32[2] * v64[14].f32[2]))+ (float)(v64[14].f32[3] * v64[14].f32[3]))+ (float)(v64[15].f32[0] * v64[15].f32[0]))+ (float)(v64[15].f32[1] * v64[15].f32[1]))+ (float)(v64[15].f32[2] * v64[15].f32[2]))+ (float)(v92 * v92))+ 0.00001;
    float32x4_t v93 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v51.f32, 0);
    float32x4_t v94 = vdivq_f32(v64[1], v93);
    *float v64 = vdivq_f32(*v64, v93);
    v64[1] = v94;
    float32x4_t v95 = vdivq_f32(v64[3], v93);
    v64[2] = vdivq_f32(v64[2], v93);
    v64[3] = v95;
    float32x4_t v96 = vdivq_f32(v64[5], v93);
    v64[4] = vdivq_f32(v64[4], v93);
    v64[5] = v96;
    float32x4_t v97 = vdivq_f32(v64[7], v93);
    v64[6] = vdivq_f32(v64[6], v93);
    v64[7] = v97;
    float32x4_t v98 = vdivq_f32(v64[9], v93);
    v64[8] = vdivq_f32(v64[8], v93);
    v64[9] = v98;
    float32x4_t v99 = vdivq_f32(v64[11], v93);
    v64[10] = vdivq_f32(v64[10], v93);
    v64[11] = v99;
    float32x4_t v100 = vdivq_f32(v64[13], v93);
    v64[12] = vdivq_f32(v64[12], v93);
    v64[13] = v100;
    float32x4_t v101 = vdivq_f32(v64[14], v93);
    float32x4_t v102 = vdivq_f32(v64[15], v93);
    v64[14] = v101;
    v64[15] = v102;
    goto LABEL_73;
  }
  return result;
}

void *sub_246D83848(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, char *__src, _DWORD *a9, uint64_t a10, void *__dst, uint64_t a12, int a13, unsigned int a14)
{
  int v14 = __src;
  uint64_t v17 = *a9;
  size_t v18 = 4 * v17;
  memcpy(__dst, __src, 4 * v17);
  if (a2 <= a4) {
    uint64_t v19 = a4;
  }
  else {
    uint64_t v19 = a2;
  }
  if (!v19)
  {
    int v23 = (int *)__dst;
    goto LABEL_109;
  }
  unint64_t v20 = 0;
  unint64_t v21 = a4;
  uint64_t v22 = v14 + 16;
  int v23 = (int *)__dst;
  uint64_t v24 = a7;
  unsigned int v25 = v17;
  uint64_t v26 = a3;
  uint64_t v27 = a5;
  uint64_t v28 = a1;
  do
  {
    uint64_t v29 = *a9;
    if (!v29)
    {
      int v31 = 0;
      goto LABEL_19;
    }
    if (v29 > 7)
    {
      uint64_t v30 = v29 & 0xFFFFFFF8;
      int64x2_t v32 = vdupq_n_s64(v20);
      int32x4_t v33 = 0uLL;
      uint64_t v34 = v22;
      uint64_t v35 = v30;
      int32x4_t v36 = 0uLL;
      do
      {
        long long v37 = *((_OWORD *)v34 - 1);
        v38.i64[0] = v37;
        v38.i64[1] = DWORD1(v37);
        int64x2_t v39 = v38;
        v38.i64[0] = DWORD2(v37);
        v38.i64[1] = HIDWORD(v37);
        int64x2_t v40 = v38;
        v38.i64[0] = *(_OWORD *)v34;
        v38.i64[1] = HIDWORD(*(void *)v34);
        int64x2_t v41 = v38;
        v38.i64[0] = *((void *)v34 + 1);
        v38.i64[1] = HIDWORD(*(_OWORD *)v34);
        int32x4_t v33 = vsubq_s32(v33, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v32, v39), (int32x4_t)vceqq_s64(v32, v40))));
        int32x4_t v36 = vsubq_s32(v36, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v32, v41), (int32x4_t)vceqq_s64(v32, v38))));
        v34 += 32;
        v35 -= 8;
      }
      while (v35);
      int v31 = vaddvq_s32(vaddq_s32(v36, v33));
      if (v30 == v29) {
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v30 = 0;
      int v31 = 0;
    }
    uint64_t v42 = v29 - v30;
    uint64_t v43 = &v14[4 * v30];
    do
    {
      int v44 = *(_DWORD *)v43;
      v43 += 4;
      if (v20 != v44) {
        ++v31;
      }
      --v42;
    }
    while (v42);
LABEL_19:
    if (v31 != v29)
    {
      unsigned int v45 = *(_DWORD *)(v27 + 4 * v20);
      if (v45 < a2 && v20 < v21)
      {
        int v46 = (int *)(v28 + 1724 * v45);
        if (v46[128])
        {
          uint64_t v47 = v26 + (v20 << 9);
          float v48 = *(float *)(v47 + 20) * *(float *)(v47 + 24);
          uint64_t v49 = v28 + 1724 * v45;
          float v50 = *(float *)(v49 + 828);
          if (v48 <= v50) {
            float v51 = *(float *)(v49 + 828);
          }
          else {
            float v51 = *(float *)(v47 + 20) * *(float *)(v47 + 24);
          }
          if (v48 <= v50) {
            float v50 = *(float *)(v47 + 20) * *(float *)(v47 + 24);
          }
          float v52 = *(float *)(v49 + 832);
          uint64_t v53 = v46[2];
          uint64_t v54 = v53;
          switch((int)v53)
          {
            case 0:
              goto LABEL_38;
            case 1:
              float v55 = (float)((float)((float)(0.009 - v52) / 0.009) * 0.15) + 0.07;
              if (v52 >= 0.009) {
                float v55 = 0.0;
              }
              float v56 = *(float *)(v24 + 92) - v55;
              goto LABEL_39;
            case 2:
            case 4:
              uint64_t v54 = 2;
              goto LABEL_38;
            case 3:
            case 5:
              uint64_t v54 = 3;
              goto LABEL_38;
            case 8:
              uint64_t v54 = 4;
              goto LABEL_38;
            default:
              if ((v53 & 0xFFFFFFFE) == 0xA) {
                uint64_t v54 = 6;
              }
              else {
                uint64_t v54 = 5;
              }
LABEL_38:
              float v56 = *(float *)(v24 + 4 * v54 + 88);
LABEL_39:
              if ((float)(v50 / (float)(v51 + 0.00001)) >= v56)
              {
                int v57 = *(_DWORD *)(v26 + (v20 << 9) + 8);
                if (v53 == v57
                  || (v53 == 2 ? (BOOL v58 = v57 == 4) : (BOOL v58 = 0),
                      v58
                   || (v53 == 4 ? (BOOL v59 = v57 == 2) : (BOOL v59 = 0),
                       v59
                    || (v53 == 3 ? (BOOL v60 = v57 == 5) : (BOOL v60 = 0),
                        v60
                     || (v53 == 5 ? (BOOL v61 = v57 == 3) : (BOOL v61 = 0),
                         v61
                      || (v53 == 10 ? (BOOL v62 = v57 == 11) : (BOOL v62 = 0),
                          v62 || (v53 == 11 ? (BOOL v63 = v57 == 10) : (BOOL v63 = 0), v63)))))))
                {
                  float v64 = *(float *)(a6 + 4 * (v20 + v45 * v19));
                }
                else
                {
                  float v64 = 10000000.0;
                }
                if v53 < 9 && ((0x13Fu >> v53)) {
                  uint64_t v65 = qword_246D9F2C0[v53];
                }
                else {
                  uint64_t v65 = (v53 & 0xFFFFFFFE) == 0xA ? 6 : 5;
                }
                if (v64 < (float)((float)(*(float *)(v24 + 4 * v65 + 116)
                                         * (float)(*((float *)v46 + 5) + *((float *)v46 + 6)))
                                 * 0.5)
                  && v52 < 0.1)
                {
                  v46[128] = 0;
                  if (*(unsigned char *)(v24 + 176))
                  {
                    float32x4_t v78 = v14;
                    int v79 = *v46;
                    if (v53 == v57 || (v53 == 4 ? (BOOL v67 = v57 == 2) : (BOOL v67 = 0), v67))
                    {
LABEL_94:
                      int v68 = v46[1];
                    }
                    else
                    {
                      int v68 = 0;
                      switch((int)v53)
                      {
                        case 2:
                          if (v57 == 4) {
                            goto LABEL_94;
                          }
                          goto LABEL_86;
                        case 3:
                          if (v57 == 5) {
                            goto LABEL_94;
                          }
                          goto LABEL_86;
                        case 5:
                          if (v57 == 3) {
                            goto LABEL_94;
                          }
                          goto LABEL_86;
                        case 10:
                          if (v57 == 11) {
                            goto LABEL_94;
                          }
                          goto LABEL_86;
                        case 11:
                          if (v57 == 10) {
                            goto LABEL_94;
                          }
LABEL_86:
                          int v68 = 0;
                          break;
                        default:
                          break;
                      }
                    }
                    float32x4_t v80 = v22;
                    unint64_t v81 = v21;
                    unsigned int v82 = v25;
                    uint64_t v89 = 0;
                    *(void *)float v90 = 0;
                    acTrkLabelCenterSizeSmoothing((int *)(v28 + 1724 * v45), (char *)v47, a1, a2, v24, v68, a13, a14, (float *)&v90[1], (float *)v90, (float *)&v89 + 1, (float *)&v89);
                    int v77 = v46[11];
                    memcpy(v46, (const void *)v47, 0x200uLL);
                    v46[112] = 0;
                    uint64_t v69 = *(void *)v90;
                    *(float32x2_t *)(v46 + 3) = vadd_f32(*(float32x2_t *)(v46 + 3), vmul_f32(vsub_f32(*(float32x2_t *)(v47 + 20), (float32x2_t)__PAIR64__(v90[0], v90[1])), (float32x2_t)0x3F0000003F000000));
                    v46[5] = HIDWORD(v69);
                    v46[6] = v69;
                    *int v46 = v79;
                    v46[1] = v68;
                    if (*(_DWORD *)(a1 + 1724 * v45 + 788) < (*(_DWORD *)(a1 + 1724 * v45 + 804)
                                                                             + *(_DWORD *)(a7 + 160))
                      && *(_DWORD *)(a1 + 1724 * v45 + 792))
                    {
                      int v70 = v89;
                      v46[3] = HIDWORD(v89);
                      v46[4] = v70;
                    }
                    *(_DWORD *)(a1 + 1724 * v45 + 52_Block_object_dispose(&STACK[0x488], 8) = 0;
                    memcpy(v88, (const void *)v47, sizeof(v88));
                    acTrkFacialAttrTemporalSmoothing((uint64_t)v46, (uint64_t)v88, v77, a7, a14, a13, *(float *)(a12 + 4 * v20));
                    uint64_t v24 = a7;
                    int v14 = v78;
                    if (*(unsigned char *)(a7 + 193))
                    {
                      acTrkHandChiralityTemporalSmoothing(v46, v47, v53, *(_DWORD *)(a7 + 216), *(_DWORD *)(a7 + 220), *(unsigned char *)(a7 + 205), *(_DWORD *)(a7 + 208), *(unsigned char *)(a7 + 212));
                      int v23 = (int *)__dst;
                      uint64_t v24 = a7;
                      unsigned int v25 = v82;
                      uint64_t v26 = a3;
                      uint64_t v27 = a5;
                      uint64_t v28 = a1;
                    }
                    else
                    {
                      uint64_t v28 = a1;
                      *(void *)(a1 + 1724 * v45 + 1656) = 0;
                      int v23 = (int *)__dst;
                      unsigned int v25 = v82;
                      uint64_t v26 = a3;
                      uint64_t v27 = a5;
                    }
                    uint64_t v22 = v80;
                    unint64_t v21 = v81;
                    *(_DWORD *)(v28 + 1724 * v45 + 524) = *(_DWORD *)(a12 + 4 * v20);
                  }
                  *(_DWORD *)(a10 + 4 * v20) = v45;
                  if (v25)
                  {
                    int v71 = 0;
                    uint64_t v72 = v25;
                    float32x4_t v73 = v23;
                    do
                    {
                      int v75 = *v73++;
                      int v74 = v75;
                      if (v20 != v75) {
                        v23[v71++] = v74;
                      }
                      --v72;
                    }
                    while (v72);
                  }
                  --v25;
                }
              }
              break;
          }
        }
      }
    }
    ++v20;
  }
  while (v20 != v19);
  size_t v18 = 4 * v25;
  LODWORD(v17) = v25;
LABEL_109:
  uint64_t result = memcpy(v14, v23, v18);
  *a9 = v17;
  return result;
}

uint64_t sub_246D83EC0(uint64_t result, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, float *a7)
{
  uint64_t v96 = result;
  if (a2 <= a4) {
    uint64_t v7 = a4;
  }
  else {
    uint64_t v7 = a2;
  }
  if (v7)
  {
    unint64_t v8 = 0;
    unsigned int v9 = 0;
    float v10 = *(float *)(a6 + 56);
    int v11 = v7 - 1;
    int v12 = v7 & 0xFFFFFFF8;
    *(void *)&long long v13 = 0x4000000040000000;
    *((void *)&v13 + 1) = 0x4000000040000000;
    do
    {
      if (v8 >= a2)
      {
        int v58 = 0;
        BOOL v59 = __CFADD__(v9, v11);
        if (v7 < 8) {
          goto LABEL_83;
        }
        if (v59) {
          goto LABEL_83;
        }
        uint64_t v60 = v7 & 0xFFFFFFF8;
        unsigned int v61 = v9;
        do
        {
          BOOL v62 = (_OWORD *)(a5 + 4 * v61);
          *BOOL v62 = v13;
          v62[1] = v13;
          v61 += 8;
          v60 -= 8;
        }
        while (v60);
        v9 += v12;
        int v58 = v7 & 0xFFFFFFF8;
        if (v7 != v12)
        {
LABEL_83:
          int v63 = v7 - v58;
          do
          {
            *(_DWORD *)(a5 + 4 * v9++) = 0x40000000;
            --v63;
          }
          while (v63);
        }
        goto LABEL_7;
      }
      if (!a4)
      {
        unsigned int v72 = 0;
        unsigned int v73 = v7;
        goto LABEL_130;
      }
      uint64_t v14 = 0;
      int v15 = 0;
      unsigned int v16 = 0;
      uint64_t v17 = a7;
      uint64_t v18 = v96 + 520 * v8;
      unsigned int v19 = *(_DWORD *)(v18 + 8);
      float32x2_t v20 = *(float32x2_t *)(v18 + 12);
      int32x4_t v21 = vdupq_n_s32(v19);
      float32x2_t v22 = vadd_f32(v20, *(float32x2_t *)(v18 + 20));
      float32x2_t v23 = vmaxnm_f32(vsub_f32(v22, v20), 0);
      float32x2_t v24 = vmul_lane_f32(v23, v23, 1);
      unsigned int v25 = v9;
      do
      {
        float32x2_t v26 = *(float32x2_t *)(a3 + v14 + 12);
        float32x2_t v27 = vadd_f32(v26, *(float32x2_t *)(a3 + v14 + 20));
        float32x2_t v28 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v22, v27), (int8x8_t)v27, (int8x8_t)v22), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v20, v26), (int8x8_t)v20, (int8x8_t)v26)), 0);
        float32x2_t v29 = vmul_lane_f32(v28, v28, 1);
        float v30 = 0.0;
        if (v29.f32[0] >= 0.00000011921)
        {
          float32x2_t v31 = vmaxnm_f32(vsub_f32(v27, v26), 0);
          float32x2_t v32 = vsub_f32(vadd_f32(vmul_lane_f32(v31, v31, 1), v24), v29);
          unsigned __int32 v33 = vdiv_f32(v29, v32).u32[0];
          if (v32.f32[0] >= 0.00000011921) {
            float v30 = *(float *)&v33;
          }
          else {
            float v30 = 0.0;
          }
        }
        uint64_t result = *(unsigned int *)(a3 + v14 + 8);
        if (v19 == result)
        {
          if (!v19)
          {
            float v34 = 0.0;
            float v35 = 0.0;
            if (v29.f32[0] >= 0.00000011921)
            {
              float32x2_t v36 = vmaxnm_f32(vsub_f32(v27, v26), 0);
              float32x2_t v37 = vmul_lane_f32(v36, v36, 1);
              if (vcgt_f32(v24, v37).u8[0]) {
                float v38 = v37.f32[0];
              }
              else {
                float v38 = v24.f32[0];
              }
              if (v38 >= 0.00000011921) {
                float v34 = v29.f32[0] / v38;
              }
              else {
                float v34 = 0.0;
              }
              float32x2_t v39 = vsub_f32(vadd_f32(v37, v24), v29);
              unsigned __int32 v40 = vdiv_f32(v29, v39).u32[0];
              if (v39.f32[0] >= 0.00000011921) {
                float v35 = *(float *)&v40;
              }
              else {
                float v35 = 0.0;
              }
            }
            if (*v17 < *(float *)(a6 + 188) && !*(unsigned char *)(a3 + v14 + 100))
            {
              float v34 = 0.0;
              float v35 = 0.0;
            }
            float v41 = v35 + 0.2;
            if (v34 > 0.2) {
              float v34 = v41;
            }
            float32x2_t v42 = vmaxnm_f32(vsub_f32(v27, v26), 0);
            float32x2_t v43 = vmul_lane_f32(v42, v42, 1);
            BOOL v44 = v29.f32[0] < 0.00000011921 || v43.f32[0] < 0.00000011921;
            LODWORD(v45) = vdiv_f32(v29, v43).u32[0];
            if (v44) {
              float v45 = 0.0;
            }
            float32x2_t v46 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v27, v22), (int8x8_t)v22, (int8x8_t)v27), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v26, v20), (int8x8_t)v26, (int8x8_t)v20)), 0);
            float32x2_t v47 = vmul_lane_f32(v46, v46, 1);
            BOOL v48 = v47.f32[0] < 0.00000011921 || v24.f32[0] < 0.00000011921;
            float v49 = 1.0 - v34;
            LODWORD(v50) = vdiv_f32(v47, v24).u32[0];
            if (v48) {
              float v50 = 0.0;
            }
            if (v34 >= 0.99) {
              float v49 = 0.01;
            }
            if (v45 >= 0.25 || v50 <= 0.95) {
              float v52 = v49;
            }
            else {
              float v52 = 1.0;
            }
            goto LABEL_68;
          }
        }
        else
        {
          BOOL v54 = v19 == 10 && result == 11;
          uint16x4_t v55 = (uint16x4_t)vmovn_s32((int32x4_t)vandq_s8((int8x16_t)vceqq_s32(v21, (int32x4_t)xmmword_246D9F110), (int8x16_t)vceqq_s32(vdupq_n_s32(result), (int32x4_t)xmmword_246D9F120)));
          uint64_t result = v19 == 11 && result == 10;
          if ((vmaxv_u16(v55) & 1) == 0 && !v54 && !result)
          {
            *(_DWORD *)(a5 + 4 * v25) = 1065353216;
            goto LABEL_12;
          }
        }
        float v52 = 1.0 - v30;
LABEL_68:
        *(float *)(a5 + 4 * v25) = v52;
        if (v52 < 1.0 && v30 > 0.1)
        {
          ++v16;
          if (*(_DWORD *)(a3 + v14 + 28) > 1u) {
            ++v15;
          }
        }
LABEL_12:
        ++v25;
        v14 += 512;
        ++v17;
      }
      while ((unint64_t)a4 << 9 != v14);
      if (v16 < 2 || !v15) {
        goto LABEL_106;
      }
      if (v19 < 9 && ((0x13Fu >> v19) & 1) != 0)
      {
        int v64 = 0;
        float v65 = 0.0;
        unsigned int v66 = v9;
        BOOL v67 = (_DWORD *)(a3 + 28);
        uint64_t v68 = a4;
        float v69 = 0.0;
        do
        {
          float v70 = *(float *)(a5 + 4 * v66);
          if (v70 < 1.0)
          {
            float v71 = 1.0 - v70;
            if (*v67 < 2u)
            {
              if (v71 > v69) {
                float v69 = v71;
              }
            }
            else
            {
              if (v71 > v10) {
                int v64 = 1;
              }
              if (v71 > v65) {
                float v65 = v71;
              }
            }
          }
          v67 += 128;
          ++v66;
          --v68;
        }
        while (v68);
        if (v65 <= v69) {
          int v74 = v64;
        }
        else {
          int v74 = v64 + 1;
        }
        unsigned int v75 = v9;
        float32x4_t v76 = (_DWORD *)(a3 + 28);
        uint64_t v77 = a4;
        if (v74 == 2)
        {
          do
          {
            if (*(float *)(a5 + 4 * v75) < 1.0 && *v76 <= 1u) {
              *(_DWORD *)(a5 + 4 * v75) = 1065353216;
            }
            v76 += 128;
            ++v75;
            --v77;
          }
          while (v77);
        }
LABEL_106:
        if (!v19)
        {
          uint64_t v78 = 0;
          int v79 = 0;
          int v80 = 0;
          float v81 = 0.0;
          unsigned int v82 = (unsigned char *)(a3 + 100);
          float v83 = 0.0;
          do
          {
            float v84 = *(float *)(a5 + 4 * (v9 + v78));
            BOOL v44 = v84 < 1.0;
            float v85 = 1.0 - v84;
            if (v44 && v85 >= 0.2)
            {
              if (*v82)
              {
                if (v85 > v83) {
                  float v83 = v85;
                }
                int v80 = 1;
              }
              else
              {
                if (v85 > v81) {
                  float v81 = v85;
                }
                int v79 = 1;
              }
            }
            ++v78;
            v82 += 512;
          }
          while (a4 != v78);
          if (v80 & v79)
          {
            float v87 = v83 / (float)(v81 + 1.1755e-38);
            if (v87 > 0.95 && v87 < 1.05)
            {
              int v93 = *(unsigned __int8 *)(v18 + 100) != 0;
              float32x4_t v94 = (unsigned __int8 *)(a3 + 100);
              uint64_t v95 = a4;
              do
              {
                if (*(float *)(a5 + 4 * v9) < 1.0)
                {
                  uint64_t result = *v94;
                  if (result != v93) {
                    *(_DWORD *)(a5 + 4 * v9) = 1065353216;
                  }
                }
                v94 += 512;
                ++v9;
                --v95;
              }
              while (v95);
            }
          }
        }
      }
      unsigned int v9 = v25;
      unsigned int v72 = a4;
      int v11 = v7 - 1;
      unsigned int v73 = v7 - a4;
      if (v7 > a4)
      {
LABEL_130:
        if (v73 < 8 || __CFADD__(v9, v11 - v72))
        {
          unsigned int v91 = v9;
LABEL_134:
          int v89 = v7 - v72;
          unsigned int v9 = v91;
          do
          {
            *(_DWORD *)(a5 + 4 * v9++) = 0x40000000;
            --v89;
          }
          while (v89);
        }
        else
        {
          unsigned int v90 = v73 & 0xFFFFFFF8;
          unsigned int v91 = v9 + (v73 & 0xFFFFFFF8);
          uint64_t result = v73 & 0xFFFFFFF8;
          do
          {
            float v92 = (_OWORD *)(a5 + 4 * v9);
            *float v92 = v13;
            v92[1] = v13;
            v9 += 8;
            result -= 8;
          }
          while (result);
          if (v73 != v90)
          {
            v72 += v90;
            goto LABEL_134;
          }
          unsigned int v9 = v91;
        }
      }
LABEL_7:
      ++v8;
    }
    while (v8 != v7);
  }
  return result;
}

char *sub_246D84490(char *result, unsigned int a2, _DWORD *__src, unsigned int a4, uint64_t a5, uint64_t a6, float *a7, uint64_t a8, uint64_t a9, _DWORD *a10, _DWORD *a11)
{
  if (a2 <= a4) {
    uint64_t v11 = a4;
  }
  else {
    uint64_t v11 = a2;
  }
  *a10 = 0;
  *a11 = 0;
  if (v11)
  {
    uint64_t v17 = result;
    unint64_t v18 = 0;
    float32x2_t v31 = a7 + 21;
    unint64_t v19 = a4;
    unsigned int v33 = a2;
    unint64_t v32 = a4;
    do
    {
      unsigned int v21 = *(_DWORD *)(a5 + 4 * v18);
      if (v18 >= v19)
      {
LABEL_7:
        v17[130 * v21 + 128] = 0;
      }
      else if (v21 >= a2)
      {
        uint64_t v24 = *a10;
        *a10 = v24 + 1;
        *(_DWORD *)(a8 + 4 * v24) = v18;
      }
      else
      {
        uint64_t result = (char *)&v17[130 * v21];
        int v22 = *((_DWORD *)result + 2);
        uint64_t v23 = 2;
        switch(v22)
        {
          case 0:
            if (result[100])
            {
              uint64_t v25 = 0;
              float v26 = *a7;
              goto LABEL_26;
            }
            float v26 = a7[20];
            float32x2_t v27 = v31;
            goto LABEL_27;
          case 1:
            float v26 = a7[1];
            uint64_t v25 = 1;
            goto LABEL_26;
          case 2:
          case 4:
            goto LABEL_19;
          case 3:
          case 5:
            uint64_t v23 = 3;
            goto LABEL_19;
          case 8:
            float v26 = a7[4];
            uint64_t v25 = 4;
            goto LABEL_26;
          default:
            uint64_t v23 = 5;
            if ((v22 & 0xFFFFFFFE) == 0xA) {
              uint64_t v23 = 6;
            }
LABEL_19:
            float v26 = a7[v23];
            uint64_t v25 = 4;
            switch(v22)
            {
              case 2:
              case 4:
                uint64_t v25 = 2;
                break;
              case 3:
              case 5:
                uint64_t v25 = 3;
                break;
              case 8:
                break;
              default:
                if ((v22 & 0xFFFFFFFE) == 0xA) {
                  uint64_t v25 = 6;
                }
                else {
                  uint64_t v25 = 5;
                }
                break;
            }
LABEL_26:
            float32x2_t v27 = &a7[v25 + 22];
LABEL_27:
            if ((float)(1.0 - *(float *)(a6 + 4 * (v18 + v21 * v11))) < v26
              || __src[7] < LOBYTE(v17[130 * v21 + 129]))
            {
              uint64_t v20 = *a10;
              *a10 = v20 + 1;
              *(_DWORD *)(a8 + 4 * v20) = v18;
              goto LABEL_7;
            }
            int v34 = *(_DWORD *)v27;
            uint64_t result = (char *)memcpy(result, __src, 0x200uLL);
            unint64_t v19 = v32;
            float32x2_t v28 = (char *)&v17[130 * v21];
            int v29 = *((_DWORD *)v28 + 128) + 1;
            *((_DWORD *)v28 + 12_Block_object_dispose(&STACK[0x488], 8) = v29;
            a2 = v33;
            if (v29 == v34)
            {
              uint64_t v30 = *a11;
              *a11 = v30 + 1;
              *(_DWORD *)(a9 + 4 * v30) = v18;
            }
            break;
        }
      }
      ++v18;
      __src += 128;
    }
    while (v11 != v18);
  }
  return result;
}

BOOL sub_246D84728(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 4) < *(_DWORD *)(a2 + 4);
}

float acTrkObjectRectIntersectOverUnion(float *a1, float *a2, float a3)
{
  float v3 = *a1;
  float v4 = a1[1];
  float v5 = a1[2];
  float v6 = a1[3];
  float v7 = *a1 + v5;
  float v8 = v4 + v6;
  float v9 = *a2;
  float v10 = a2[1];
  float v11 = 0.0;
  if (v7 > *a2 && v8 > v10)
  {
    float v13 = a2[2];
    float v14 = a2[3];
    float v15 = v10 + v14;
    if ((float)(v9 + v13) > v3 && v15 > v4)
    {
      float v17 = fmaxf(fminf(v7, v9 + v13) - fmaxf(v3, v9), 0.0) * fmaxf(fminf(v8, v15) - fmaxf(v4, v10), 0.0);
      return v17 / fmaxf(a3, (float)((float)(v5 * v6) + (float)(v13 * v14)) - v17);
    }
  }
  return v11;
}

float acTrkObjectRectIntersectOverSmaller(float *a1, float *a2, float a3)
{
  float v3 = *a1;
  float v4 = a1[1];
  float v5 = a1[2];
  float v6 = a1[3];
  float v7 = *a1 + v5;
  float v8 = v4 + v6;
  float v9 = *a2;
  float v10 = a2[1];
  float v11 = 0.0;
  if (v7 > *a2 && v8 > v10)
  {
    float v13 = a2[2];
    float v14 = a2[3];
    float v15 = v10 + v14;
    if ((float)(v9 + v13) > v3 && v15 > v4) {
      return (float)(fmaxf(fminf(v7, v9 + v13) - fmaxf(v3, v9), 0.0) * fmaxf(fminf(v8, v15) - fmaxf(v4, v10), 0.0))
    }
           / fmaxf(a3, fminf(v5 * v6, v13 * v14));
  }
  return v11;
}

uint64_t acTrkObjectRemoveKilled(char *__src, unsigned int a2, int a3)
{
  if (!a2) {
    return 0;
  }
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  float v7 = __src;
  uint64_t v8 = a2;
  do
  {
    if (v7[132] < a3)
    {
      if (v5 != v6) {
        memcpy(&__src[1724 * v6], v7, 0x6BCuLL);
      }
      uint64_t v6 = (v6 + 1);
    }
    v7 += 431;
    ++v5;
  }
  while (v8 != v5);
  return v6;
}

void acTrkObjectRearrange(uint64_t a1, uint64_t a2, void *a3, unsigned int a4)
{
  uint64_t v8 = a4;
  bzero(a3, a4);
  if (a4)
  {
    uint64_t v9 = 0;
    do
    {
      if (!*((unsigned char *)a3 + v9))
      {
        memcpy(__src, (const void *)(a1 + 1724 * v9), sizeof(__src));
        *((unsigned char *)a3 + v9) = 1;
        uint64_t v10 = *(unsigned int *)(a2 + 4 * v9);
        uint64_t v11 = v9;
        if (v9 != v10)
        {
          uint64_t v11 = v9;
          do
          {
            memcpy((void *)(a1 + 1724 * v11), (const void *)(a1 + 1724 * v10), 0x6BCuLL);
            uint64_t v11 = *(unsigned int *)(a2 + 4 * v11);
            *((unsigned char *)a3 + v11) = 1;
            uint64_t v10 = *(unsigned int *)(a2 + 4 * v11);
          }
          while (v9 != v10);
        }
        memcpy((void *)(a1 + 1724 * v11), __src, 0x6BCuLL);
      }
      ++v9;
    }
    while (v9 != v8);
  }
}

unint64_t acTrkFullBodyAssocTrkDet(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, uint64_t a7, unsigned int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14, char *a15, unsigned int *a16, float *a17, uint64_t a18, uint64_t a19, unsigned int a20,void *a21)
{
  unsigned int v23 = a6;
  float32x2_t v27 = a15;
  if (a6 <= a8) {
    int v28 = a8;
  }
  else {
    int v28 = a6;
  }
  float v444 = 0;
  long long v442 = 0u;
  long long v443 = 0u;
  long long v440 = 0u;
  long long v441 = 0u;
  long long v438 = 0u;
  long long v439 = 0u;
  long long v436 = 0u;
  long long v437 = 0u;
  long long v434 = 0u;
  long long v435 = 0u;
  long long v432 = 0u;
  long long __b = 0u;
  long long v430 = 0u;
  long long v431 = 0u;
  long long v428 = 0u;
  long long v429 = 0u;
  long long v426 = 0u;
  long long v427 = 0u;
  long long v425 = 0u;
  size_t TempBuffers = acTrkObjectAssocTrkDetGetTempBuffers(v28, (uint64_t)a21, a3, (uint64_t)&v425);
  unsigned int v30 = a8;
  bzero(a21, TempBuffers);
  float32x2_t v31 = (int32x4_t *)v425;
  uint64_t v32 = *((void *)&v428 + 1);
  int v34 = (int32x4_t *)*((void *)&v429 + 1);
  uint64_t v33 = v429;
  uint64_t v35 = __b;
  uint64_t v421 = a7;
  if (v30)
  {
    float32x2_t v36 = (void *)v430;
    uint64_t v400 = *((void *)&v428 + 1);
    uint64_t v409 = v429;
    unsigned int v405 = v23;
    unsigned int v411 = a1;
    float32x2_t v37 = (void *)*((void *)&v425 + 1);
    long long v38 = v426;
    float v412 = (unsigned int *)*((void *)&v427 + 1);
    BOOL v395 = (unsigned int *)*((void *)&v435 + 1);
    v396 = (void *)v434;
    BOOL v394 = (void *)*((void *)&__b + 1);
    long long v39 = v437;
    long long v40 = v438;
    float v41 = v444;
    long long v398 = v439;
    float v397 = (unsigned __int8 *)v440;
    unsigned int v399 = (unsigned int *)v441;
    uint64_t v402 = *((void *)&v442 + 1);
    uint64_t v410 = __b;
    memset((void *)__b, 255, 4 * v30);
    if (!(a5 | *a16))
    {
      if (v30 > 7)
      {
        uint64_t v43 = v30 & 0xFFFFFFF8;
        int32x4_t v79 = (int32x4_t)xmmword_246D9F130;
        int v80 = v31 + 1;
        v81.i64[0] = 0x400000004;
        v81.i64[1] = 0x400000004;
        v82.i64[0] = 0x800000008;
        v82.i64[1] = 0x800000008;
        uint64_t v83 = v43;
        a7 = v421;
        unsigned int v44 = a2;
        unsigned int v23 = v405;
        do
        {
          v80[-1] = v79;
          *int v80 = vaddq_s32(v79, v81);
          int32x4_t v79 = vaddq_s32(v79, v82);
          v80 += 2;
          v83 -= 8;
        }
        while (v83);
        a1 = v411;
        uint64_t v33 = v409;
        uint64_t v35 = v410;
        if (v43 == v30) {
          goto LABEL_47;
        }
      }
      else
      {
        uint64_t v43 = 0;
        a7 = v421;
        unsigned int v44 = a2;
        a1 = v411;
        unsigned int v23 = v405;
        uint64_t v33 = v409;
        uint64_t v35 = v410;
      }
      do
      {
        v31->i32[v43] = v43;
        ++v43;
      }
      while (v30 != v43);
LABEL_47:
      unsigned int v424 = v30;
      acTrkObjectPickDet(a1, v44, a4, 0, v23, a7, v30, (uint64_t)v31, &v424, v33, v390, v35, v393, *(unsigned char *)(a9 + 194), *(_DWORD *)(a9 + 196));
      uint64_t v84 = v424;
      if (v424)
      {
        unsigned int v416 = 0;
        unsigned int v85 = a1;
        unint64_t v86 = 0;
        float v87 = (float)(v44 * v85) + 0.0001;
        int32x4_t v419 = vdupq_n_s32(0xFFFFFE97);
        do
        {
          unsigned int v130 = *(_DWORD *)(a7 + ((unint64_t)v31->u32[0] << 9) + 28);
          if (v130 > 1)
          {
            uint64_t v132 = (_DWORD *)(a4 + 1724 * v86);
            bzero(v132, 0x6BCuLL);
            *((int32x4_t *)v132 + 2) = v419;
            v132[12] = -361;
            v132[32] = -1;
            v132[98] = -1;
            v132[105] = -1;
            *(void *)(v132 + 193) = 0xFF7FFFFFFFFFFFFFLL;
            v132[198] = 0;
            *(void *)(v132 + 207) = 0;
            v132[209] = 0;
            memcpy(v132, (const void *)(a7 + ((unint64_t)v31->u32[0] << 9)), 0x200uLL);
            int v133 = (*a14)++;
            *uint64_t v132 = v133;
            ++v132[130];
            uint64_t v134 = v31->u32[0];
            v132[131] = LODWORD(a17[v134]);
            float v135 = *((float *)v132 + 5) * *((float *)v132 + 6);
            *((float *)v132 + 207) = v135;
            *((float *)v132 + 20_Block_object_dispose(&STACK[0x488], 8) = v135 / v87;
            uint64_t v136 = a7 + (v134 << 9);
            int v137 = *(_DWORD *)(v136 + 8);
            int v138 = (long long *)(v136 + 12);
            int v139 = *(_DWORD *)(v136 + 40);
            int v140 = *(_DWORD *)(v136 + 44);
            char v141 = *(unsigned char *)(v136 + 100);
            int v142 = *(_DWORD *)(v136 + 420);
            if (v132[2] == 9)
            {
              long long v88 = *v138;
              uint64_t v89 = a4 + 1724 * v86;
              *(_OWORD *)(v89 + 532) = v88;
              *(unsigned char *)(v89 + 54_Block_object_dispose(&STACK[0x488], 8) = v141;
              *(_DWORD *)(v89 + 564) = v142;
              *(_DWORD *)(v89 + 556) = v140;
              *(_DWORD *)(v89 + 552) = v139;
              *(_DWORD *)(v89 + 56_Block_object_dispose(&STACK[0x488], 8) = v137;
              *(_DWORD *)(v89 + 780) = 1;
            }
            else
            {
              uint64_t v143 = a4 + 1724 * v86;
              unsigned int v144 = *(_DWORD *)(v143 + 780);
              if (v144 < 6)
              {
                uint64_t v147 = a4 + 1724 * v86 + 40 * v144;
                *(_OWORD *)(v147 + 532) = *v138;
                *(unsigned char *)(v147 + 54_Block_object_dispose(&STACK[0x488], 8) = v141;
                *(_DWORD *)(v147 + 564) = v142;
                *(_DWORD *)(v147 + 556) = v140;
                *(_DWORD *)(v147 + 552) = v139;
                *(_DWORD *)(v147 + 56_Block_object_dispose(&STACK[0x488], 8) = v137;
                ++*(_DWORD *)(v143 + 780);
              }
              else
              {
                long long v145 = *v138;
                uint64_t v146 = a4 + 1724 * v86;
                *(_OWORD *)(v146 + 732) = v145;
                *(unsigned char *)(v146 + 74_Block_object_dispose(&STACK[0x488], 8) = v141;
                *(_DWORD *)(v146 + 764) = v142;
                *(_DWORD *)(v146 + 756) = v140;
                *(_DWORD *)(v146 + 752) = v139;
                *(_DWORD *)(v146 + 76_Block_object_dispose(&STACK[0x488], 8) = v137;
              }
            }
            uint64_t v90 = a4 + 1724 * v86;
            a7 = v421;
            unint64_t v91 = v421 + ((unint64_t)v31->u32[0] << 9);
            long long v92 = *(_OWORD *)(v91 + 132);
            long long v93 = *(_OWORD *)(v91 + 148);
            long long v94 = *(_OWORD *)(v91 + 180);
            *(_OWORD *)(v90 + 912) = *(_OWORD *)(v91 + 164);
            *(_OWORD *)(v90 + 92_Block_object_dispose(&STACK[0x488], 8) = v94;
            *(_OWORD *)(v90 + 880) = v92;
            *(_OWORD *)(v90 + 896) = v93;
            long long v95 = *(_OWORD *)(v91 + 196);
            long long v96 = *(_OWORD *)(v91 + 212);
            long long v97 = *(_OWORD *)(v91 + 244);
            *(_OWORD *)(v90 + 976) = *(_OWORD *)(v91 + 228);
            *(_OWORD *)(v90 + 992) = v97;
            *(_OWORD *)(v90 + 944) = v95;
            *(_OWORD *)(v90 + 960) = v96;
            long long v98 = *(_OWORD *)(v91 + 260);
            long long v99 = *(_OWORD *)(v91 + 276);
            long long v100 = *(_OWORD *)(v91 + 292);
            *(_OWORD *)(v90 + 1056) = *(_OWORD *)(v91 + 308);
            *(_OWORD *)(v90 + 1040) = v100;
            *(_OWORD *)(v90 + 100_Block_object_dispose(&STACK[0x488], 8) = v98;
            *(_OWORD *)(v90 + 1024) = v99;
            long long v101 = *(_OWORD *)(v91 + 324);
            long long v102 = *(_OWORD *)(v91 + 340);
            long long v103 = *(_OWORD *)(v91 + 356);
            *(_OWORD *)(v90 + 1120) = *(_OWORD *)(v91 + 372);
            *(_OWORD *)(v90 + 1104) = v103;
            *(_OWORD *)(v90 + 108_Block_object_dispose(&STACK[0x488], 8) = v102;
            *(_OWORD *)(v90 + 1072) = v101;
            unint64_t v104 = v421 + ((unint64_t)v31->u32[0] << 9);
            long long v105 = *(_OWORD *)(v104 + 132);
            long long v106 = *(_OWORD *)(v104 + 148);
            long long v107 = *(_OWORD *)(v104 + 164);
            *(_OWORD *)(v90 + 1184) = *(_OWORD *)(v104 + 180);
            *(_OWORD *)(v90 + 116_Block_object_dispose(&STACK[0x488], 8) = v107;
            *(_OWORD *)(v90 + 1152) = v106;
            *(_OWORD *)(v90 + 1136) = v105;
            long long v108 = *(_OWORD *)(v104 + 196);
            long long v109 = *(_OWORD *)(v104 + 212);
            long long v110 = *(_OWORD *)(v104 + 228);
            *(_OWORD *)(v90 + 124_Block_object_dispose(&STACK[0x488], 8) = *(_OWORD *)(v104 + 244);
            *(_OWORD *)(v90 + 1232) = v110;
            *(_OWORD *)(v90 + 1216) = v109;
            *(_OWORD *)(v90 + 1200) = v108;
            long long v111 = *(_OWORD *)(v104 + 260);
            long long v112 = *(_OWORD *)(v104 + 276);
            long long v113 = *(_OWORD *)(v104 + 292);
            *(_OWORD *)(v90 + 1312) = *(_OWORD *)(v104 + 308);
            *(_OWORD *)(v90 + 1296) = v113;
            *(_OWORD *)(v90 + 1280) = v112;
            *(_OWORD *)(v90 + 1264) = v111;
            long long v114 = *(_OWORD *)(v104 + 324);
            long long v115 = *(_OWORD *)(v104 + 340);
            long long v116 = *(_OWORD *)(v104 + 356);
            *(_OWORD *)(v90 + 1376) = *(_OWORD *)(v104 + 372);
            *(_OWORD *)(v90 + 1360) = v116;
            *(_OWORD *)(v90 + 1344) = v115;
            *(_OWORD *)(v90 + 132_Block_object_dispose(&STACK[0x488], 8) = v114;
            unint64_t v117 = v421 + ((unint64_t)v31->u32[0] << 9);
            long long v118 = *(_OWORD *)(v117 + 132);
            long long v119 = *(_OWORD *)(v117 + 148);
            long long v120 = *(_OWORD *)(v117 + 164);
            *(_OWORD *)(v90 + 1440) = *(_OWORD *)(v117 + 180);
            *(_OWORD *)(v90 + 1424) = v120;
            *(_OWORD *)(v90 + 140_Block_object_dispose(&STACK[0x488], 8) = v119;
            *(_OWORD *)(v90 + 1392) = v118;
            long long v121 = *(_OWORD *)(v117 + 196);
            long long v122 = *(_OWORD *)(v117 + 212);
            long long v123 = *(_OWORD *)(v117 + 228);
            *(_OWORD *)(v90 + 1504) = *(_OWORD *)(v117 + 244);
            *(_OWORD *)(v90 + 148_Block_object_dispose(&STACK[0x488], 8) = v123;
            *(_OWORD *)(v90 + 1472) = v122;
            *(_OWORD *)(v90 + 1456) = v121;
            long long v124 = *(_OWORD *)(v117 + 260);
            long long v125 = *(_OWORD *)(v117 + 276);
            long long v126 = *(_OWORD *)(v117 + 292);
            *(_OWORD *)(v90 + 156_Block_object_dispose(&STACK[0x488], 8) = *(_OWORD *)(v117 + 308);
            *(_OWORD *)(v90 + 1552) = v126;
            *(_OWORD *)(v90 + 1536) = v125;
            *(_OWORD *)(v90 + 1520) = v124;
            long long v127 = *(_OWORD *)(v117 + 324);
            long long v128 = *(_OWORD *)(v117 + 340);
            long long v129 = *(_OWORD *)(v117 + 356);
            *(_OWORD *)(v90 + 1632) = *(_OWORD *)(v117 + 372);
            *(_OWORD *)(v90 + 1616) = v129;
            *(_OWORD *)(v90 + 1600) = v128;
            *(_OWORD *)(v90 + 1584) = v127;
            *(_OWORD *)(v90 + 1664) = *(_OWORD *)(v421 + ((unint64_t)v31->u32[0] << 9) + 12);
            *(_OWORD *)(v90 + 1680) = *(_OWORD *)(v421 + ((unint64_t)v31->u32[0] << 9) + 12);
            *(float *)(v90 + 164_Block_object_dispose(&STACK[0x488], 8) = (float)*(unsigned int *)(v421 + ((unint64_t)v31->u32[0] << 9) + 28);
            unint64_t v86 = (v86 + 1);
          }
          else if (v130)
          {
            BOOL v131 = &a15[520 * v416];
            *((_OWORD *)v131 + 30) = 0u;
            *((_OWORD *)v131 + 31) = 0u;
            *((_OWORD *)v131 + 2_Block_object_dispose(&STACK[0x488], 8) = 0u;
            *((_OWORD *)v131 + 29) = 0u;
            *((_OWORD *)v131 + 26) = 0u;
            *((_OWORD *)v131 + 27) = 0u;
            *((_OWORD *)v131 + 24) = 0u;
            *((_OWORD *)v131 + 25) = 0u;
            *((_OWORD *)v131 + 22) = 0u;
            *((_OWORD *)v131 + 23) = 0u;
            *((_OWORD *)v131 + 20) = 0u;
            *((_OWORD *)v131 + 21) = 0u;
            *((_OWORD *)v131 + 1_Block_object_dispose(&STACK[0x488], 8) = 0u;
            *((_OWORD *)v131 + 19) = 0u;
            *((_OWORD *)v131 + 16) = 0u;
            *((_OWORD *)v131 + 17) = 0u;
            *((_OWORD *)v131 + 14) = 0u;
            *((_OWORD *)v131 + 15) = 0u;
            *((_OWORD *)v131 + 12) = 0u;
            *((_OWORD *)v131 + 13) = 0u;
            *((_OWORD *)v131 + 10) = 0u;
            *((_OWORD *)v131 + 11) = 0u;
            *((_OWORD *)v131 + _Block_object_dispose(&STACK[0x488], 8) = 0u;
            *((_OWORD *)v131 + 9) = 0u;
            *((_OWORD *)v131 + 6) = 0u;
            *((_OWORD *)v131 + 7) = 0u;
            *((_OWORD *)v131 + 4) = 0u;
            *((_OWORD *)v131 + 5) = 0u;
            *((_OWORD *)v131 + 2) = 0u;
            *((_OWORD *)v131 + 3) = 0u;
            *(_OWORD *)BOOL v131 = 0u;
            *((_OWORD *)v131 + 1) = 0u;
            *((int32x4_t *)v131 + 2) = v419;
            *((_DWORD *)v131 + 12) = -361;
            *((_DWORD *)v131 + 32) = -1;
            *((_DWORD *)v131 + 9_Block_object_dispose(&STACK[0x488], 8) = -1;
            *((_DWORD *)v131 + 105) = -1;
            *((_DWORD *)v131 + 12_Block_object_dispose(&STACK[0x488], 8) = 0;
            v131[516] = 0;
            memcpy(v131, (const void *)(a7 + ((unint64_t)v31->u32[0] << 9)), 0x200uLL);
            ++v416;
          }
          float32x2_t v31 = (int32x4_t *)((char *)v31 + 4);
          --v84;
        }
        while (v84);
      }
      else
      {
        unint64_t v86 = 0;
        unsigned int v416 = 0;
      }
      *a12 = v86;
      *a13 = 0;
      *a16 = v416;
      return v86;
    }
    BOOL v404 = a5 == 0;
    v401 = v36;
    v406 = v34;
    if (a5 <= v30) {
      unsigned int v66 = v30;
    }
    else {
      unsigned int v66 = a5;
    }
    unsigned int v67 = v66 * v66;
    float v389 = v41;
    unsigned int v68 = v66;
    unsigned int v408 = v30;
    acTrkObjectSetUpFeatureMunkresCost(a4, a5, v421, v30, (uint64_t)v37, v42, a9, a11, v389);
    unsigned int v418 = a5;
    if (a5 && v68 <= 0x1D)
    {
      memcpy((void *)v38, v37, 4 * v67);
      bmMunkres((float *)v37, v68, *((unsigned __int8 **)&v38 + 1), v69, v412, v70, 0, v71);
    }
    unsigned int v72 = (unsigned __int8 *)*((void *)&v434 + 1);
    unsigned int v424 = v408;
    acTrkObjectFeatureAssocCore((_DWORD *)a4, a5, v421, v408, (uint64_t)v412, v38, a11, a9, (uint64_t)v31, &v424, v410, v391, (uint64_t)a17, v411, a2, a19, a20);
    unsigned int v73 = 0;
    unsigned int v74 = v424;
    if (!a5 || !v424)
    {
LABEL_74:
      unsigned int __dst = v73;
      if (v74)
      {
        uint64_t v155 = 0;
        unsigned int v156 = 0;
        uint64_t v157 = 0;
        uint64_t v158 = v74;
        do
        {
          uint64_t v159 = v31->u32[v155];
          int v160 = (_DWORD *)(v421 + (v159 << 9));
          if (v160[7] < 2u)
          {
            memcpy((void *)(*((void *)&v39 + 1) + ((unint64_t)v156 << 9)), v160, 0x200uLL);
            *(_DWORD *)(v40 + 4 * v156++) = v159;
          }
          else
          {
            if (v155 != v157) {
              v31->i32[v157] = v159;
            }
            uint64_t v157 = (v157 + 1);
          }
          ++v155;
        }
        while (v158 != v155);
      }
      else
      {
        uint64_t v157 = 0;
        unsigned int v156 = 0;
      }
      unsigned int v424 = v157;
      if (*a16 <= v156) {
        unsigned int v161 = v156;
      }
      else {
        unsigned int v161 = *a16;
      }
      if (!v161)
      {
LABEL_132:
        a5 = __dst;
        if (v418)
        {
          uint64_t v192 = v418;
          uint64_t v193 = v431 + 16;
          int v194 = (float32x2_t *)(a4 + 20);
          do
          {
            unsigned int v199 = v194[-2].i32[1] - 1;
            if (v199 <= 0xB) {
              int v195 = dword_246D9F5DC[v199];
            }
            else {
              int v195 = 0;
            }
            float32x2_t v196 = v194[-1];
            float32x2_t v197 = vadd_f32(v196, *v194);
            float v198 = (float)v194[1].u32[0];
            *(float32x2_t *)(v193 - 16) = v196;
            *(float32x2_t *)(v193 - _Block_object_dispose(&STACK[0x488], 8) = v197;
            *(_DWORD *)uint64_t v193 = v195;
            *(float *)(v193 + _Block_object_dispose(&STACK[0x488], 8) = v198 / 1000.0;
            v193 += 32;
            int v194 = (float32x2_t *)((char *)v194 + 1724);
            --v192;
          }
          while (v192);
        }
        if (v157)
        {
          uint64_t v200 = 0;
          unsigned int v201 = 0;
          float v202 = *(float *)(a11 + 44);
          float v203 = *(float *)(a11 + 48);
          int v415 = *(unsigned __int8 *)(a11 + 108);
          do
          {
            uint64_t v204 = v31->u32[v200];
            memcpy(v422, (const void *)(v421 + (v204 << 9)), sizeof(v422));
            if (!v418) {
              goto LABEL_178;
            }
            float32x2_t v205 = vadd_f32(*(float32x2_t *)&v422[3], *(float32x2_t *)&v422[5]);
            float32x2_t v206 = vsub_f32(v205, *(float32x2_t *)&v422[3]);
            int32x2_t v207 = vcgtz_f32(v206);
            float v208 = v206.f32[1];
            if ((v207.i8[4] & 1) == 0) {
              float v208 = 0.0;
            }
            if ((v207.i8[0] & 1) == 0) {
              v206.f32[0] = 0.0;
            }
            float v209 = v206.f32[0] * v208;
            if (v415)
            {
              unint64_t v210 = 0;
              BOOL v211 = 1;
              uint64_t v212 = a4 + 884;
              while (1)
              {
                uint64_t v213 = 0;
                float v214 = 0.0;
                float v215 = 0.0;
                float v216 = 0.0;
                do
                {
                  float v217 = *(float *)&v422[v213 + 33];
                  float v218 = *(float *)&v422[v213 + 34];
                  float v219 = *(float *)(v212 + v213 * 4 - 4);
                  float v220 = *(float *)(v212 + v213 * 4);
                  float v214 = (float)(v214 + (float)(v219 * v219)) + (float)(v220 * v220);
                  float v215 = (float)(v215 + (float)(v217 * v217)) + (float)(v218 * v218);
                  float v216 = (float)(v216 + (float)(v217 * v219)) + (float)(v218 * v220);
                  v213 += 2;
                }
                while (v213 != 64);
                unint64_t v221 = a4 + 1724 * v210;
                float v222 = 1.0 - (float)(v216 / (float)((float)(sqrtf(v215) * sqrtf(v214)) + 0.00001));
                if (v222 <= 0.0) {
                  float v223 = 1.0;
                }
                else {
                  float v223 = 1.0 - v222;
                }
                float32x2_t v224 = *(float32x2_t *)(v221 + 12);
                float32x2_t v225 = vadd_f32(v224, *(float32x2_t *)(v221 + 20));
                float32x2_t v226 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v205, v225), (int8x8_t)v225, (int8x8_t)v205), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)&v422[3], v224), *(int8x8_t *)&v422[3], (int8x8_t)v224)), 0);
                float v227 = vmul_lane_f32(v226, v226, 1).f32[0];
                float v228 = 0.0;
                if (v227 >= 0.00000011921)
                {
                  float32x2_t v229 = vsub_f32(v225, v224);
                  float v230 = fmaxf(v229.f32[0], 0.0) * fmaxf(v229.f32[1], 0.0);
                  if (v230 >= v209) {
                    float v230 = v209;
                  }
                  float v231 = v227 / v230;
                  if (v230 >= 0.00000011921) {
                    float v228 = v231;
                  }
                  else {
                    float v228 = 0.0;
                  }
                }
                if (v228 > v203 && v223 > v202) {
                  break;
                }
                ++v210;
                v212 += 1724;
                BOOL v211 = v210 < v418;
                if (v210 == v418) {
                  goto LABEL_178;
                }
              }
            }
            else
            {
              unint64_t v232 = 0;
              BOOL v211 = 1;
              uint64_t v233 = a4 + 884;
              while (1)
              {
                uint64_t v234 = 0;
                float v235 = 0.0;
                float v236 = 0.0;
                float v237 = 0.0;
                do
                {
                  float v238 = *(float *)&v422[v234 + 33];
                  float v239 = *(float *)&v422[v234 + 34];
                  float v240 = *(float *)(v233 + v234 * 4 - 4);
                  float v241 = *(float *)(v233 + v234 * 4);
                  float v235 = (float)(v235 + (float)(v240 * v240)) + (float)(v241 * v241);
                  float v236 = (float)(v236 + (float)(v238 * v238)) + (float)(v239 * v239);
                  float v237 = (float)(v237 + (float)(v238 * v240)) + (float)(v239 * v241);
                  v234 += 2;
                }
                while (v234 != 64);
                unint64_t v242 = a4 + 1724 * v232;
                float v243 = 1.0 - (float)(v237 / (float)((float)(sqrtf(v236) * sqrtf(v235)) + 0.00001));
                if (v243 <= 0.0) {
                  float v244 = 1.0;
                }
                else {
                  float v244 = 1.0 - v243;
                }
                float32x2_t v245 = *(float32x2_t *)(v242 + 12);
                float32x2_t v246 = vadd_f32(v245, *(float32x2_t *)(v242 + 20));
                float32x2_t v247 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v205, v246), (int8x8_t)v246, (int8x8_t)v205), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)&v422[3], v245), *(int8x8_t *)&v422[3], (int8x8_t)v245)), 0);
                float v248 = vmul_lane_f32(v247, v247, 1).f32[0];
                float v249 = 0.0;
                if (v248 >= 0.00000011921)
                {
                  float32x2_t v250 = vsub_f32(v246, v245);
                  v250.f32[0] = (float)((float)(fmaxf(v250.f32[0], 0.0) * fmaxf(v250.f32[1], 0.0)) + v209) - v248;
                  float v251 = v248 / v250.f32[0];
                  if (v250.f32[0] >= 0.00000011921) {
                    float v249 = v251;
                  }
                  else {
                    float v249 = 0.0;
                  }
                }
                if (v249 > v203 && v244 > v202) {
                  break;
                }
                ++v232;
                v233 += 1724;
                BOOL v211 = v232 < v418;
                if (v232 == v418) {
                  goto LABEL_178;
                }
              }
            }
            if (!v211)
            {
LABEL_178:
              if (v200 != v201) {
                v31->i32[v201] = v204;
              }
              ++v201;
            }
            ++v200;
          }
          while (v200 != v157);
          uint64_t v252 = (_OWORD *)*((void *)&v431 + 1);
          a5 = __dst;
          if (v201)
          {
            uint64_t v253 = 0;
            long long v254 = v31;
            unsigned int v44 = a2;
            unsigned int v23 = v405;
            do
            {
              unsigned __int32 v261 = v254->i32[0];
              long long v254 = (int32x4_t *)((char *)v254 + 4);
              __int32 v260 = v261;
              unint64_t v262 = v421 + ((unint64_t)v261 << 9);
              unsigned int v263 = *(_DWORD *)(v262 + 8) - 1;
              if (v263 <= 0xB) {
                __int32 v255 = dword_246D9F5DC[v263];
              }
              else {
                __int32 v255 = 0;
              }
              float32x2_t v256 = *(float32x2_t *)(v262 + 12);
              float32x2_t v257 = vadd_f32(v256, *(float32x2_t *)(v262 + 20));
              float32_t v258 = (float)*(unsigned int *)(v262 + 28) / 1000.0;
              long long v259 = (float32x2_t *)&v252[v253];
              float32x2_t *v259 = v256;
              v259[1] = v257;
              v259[3].f32[0] = v258;
              v259[2].i32[0] = v255;
              v259[2].i32[1] = v260;
              v253 += 2;
            }
            while (2 * v201 != v253);
            goto LABEL_188;
          }
        }
        else
        {
          unsigned int v201 = 0;
          uint64_t v252 = (_OWORD *)*((void *)&v431 + 1);
        }
        unsigned int v44 = a2;
        unsigned int v23 = v405;
LABEL_188:
        unsigned int v264 = acRemoveOverlapBoxes(v252, v201, (unsigned __int8 *)v432, *(float *)(a9 + 48));
        unsigned int v188 = v264;
        uint64_t v32 = v400;
        if (v264)
        {
          if (v264 > 0xA
            && (v31 < (int32x4_t *)((char *)&v252[2 * v264 - 1] + 8)
              ? (BOOL v265 = (char *)v252 + 20 >= &v31->i8[4 * v264])
              : (BOOL v265 = 1),
                v265))
          {
            uint64_t v266 = v264 & 3;
            if ((v264 & 3) == 0) {
              uint64_t v266 = 4;
            }
            uint64_t v267 = v264 - v266;
            long long v268 = (int32x2_t *)&v31->u64[1];
            long long v269 = (int32x2_t *)((char *)v252 + 84);
            uint64_t v270 = v267;
            do
            {
              int32x2_t v271 = vzip1_s32(*v269, v269[4]);
              v268[-1] = vzip1_s32(v269[-8], v269[-4]);
              *long long v268 = v271;
              v268 += 2;
              v269 += 16;
              v270 -= 4;
            }
            while (v270);
          }
          else
          {
            uint64_t v267 = 0;
          }
          uint64_t v272 = v264 - v267;
          long long v273 = (unsigned int *)v31 + v267;
          long long v274 = (unsigned int *)&v252[2 * v267 + 1] + 1;
          do
          {
            unsigned int v275 = *v274;
            v274 += 8;
            *v273++ = v275;
            --v272;
          }
          while (v272);
        }
        unsigned int v424 = v264;
        int v34 = v406;
        goto LABEL_204;
      }
      sub_246D83EC0((uint64_t)a15, *a16, *((uint64_t *)&v39 + 1), v156, v398, a9, a17);
      memcpy(*((void **)&v398 + 1), (const void *)v398, 4 * v161 * v161);
      bmMunkres((float *)v398, v161, v397, v162, v399, v163, 0, v164);
      __src[0] = 0;
      unsigned int v423 = 0;
      sub_246D84490(a15, *a16, *((_DWORD **)&v39 + 1), v156, (uint64_t)v399, *((uint64_t *)&v398 + 1), (float *)a10, *((uint64_t *)&v40 + 1), v402, &v423, __src);
      uint64_t v165 = __src[0];
      if (__src[0])
      {
        int v166 = (unsigned char *)*((void *)&v443 + 1);
        float v167 = (int *)v402;
        uint64_t v168 = __src[0];
        do
        {
          int v169 = *v167++;
          *v166++ = a15[520 * v399[v169] + 516];
          --v168;
        }
        while (v168);
      }
      uint64_t v170 = *a16;
      if (v170)
      {
        uint64_t v171 = 0;
        unsigned int v172 = 0;
        float v173 = (unsigned int *)(a10 + 88);
        int v174 = a15;
        do
        {
          unsigned int v175 = *((_DWORD *)v174 + 128);
          if (v175)
          {
            uint64_t v176 = *((unsigned int *)v174 + 2);
            switch((int)v176)
            {
              case 0:
                if (v174[100])
                {
                  if (v175 < *v173) {
                    goto LABEL_106;
                  }
                }
                else if (v175 < *(_DWORD *)(a10 + 84))
                {
                  goto LABEL_106;
                }
                break;
              case 1:
                goto LABEL_105;
              case 2:
              case 4:
                uint64_t v176 = 2;
                goto LABEL_105;
              case 3:
              case 5:
                uint64_t v176 = 3;
                goto LABEL_105;
              case 8:
                uint64_t v176 = 4;
                goto LABEL_105;
              default:
                BOOL v177 = (v176 & 0xFFFFFFFE) == 10;
                uint64_t v176 = 5;
                if (v177) {
                  uint64_t v176 = 6;
                }
LABEL_105:
                if (v175 < v173[v176])
                {
LABEL_106:
                  if (v171 != v172)
                  {
                    uint64_t v178 = v157;
                    int v179 = v173;
                    memcpy(&a15[520 * v172], v174, 0x208uLL);
                    float v173 = v179;
                    uint64_t v157 = v178;
                  }
                  ++v172;
                }
                break;
            }
          }
          v174 += 520;
          ++v171;
        }
        while (v170 != v171);
      }
      else
      {
        unsigned int v172 = 0;
      }
      uint64_t v180 = *((void *)&v39 + 1);
      *a16 = v172;
      uint64_t v181 = v423;
      if (v423)
      {
        *(int32x4_t *)float v413 = vdupq_n_s32(0xFFFFFE97);
        BOOL v182 = (unsigned int *)*((void *)&v40 + 1);
        do
        {
          if (*(_DWORD *)(v180 + ((unint64_t)*v182 << 9) + 28))
          {
            uint64_t v183 = &a15[520 * v172];
            *((_OWORD *)v183 + 30) = 0u;
            *((_OWORD *)v183 + 31) = 0u;
            *((_OWORD *)v183 + 2_Block_object_dispose(&STACK[0x488], 8) = 0u;
            *((_OWORD *)v183 + 29) = 0u;
            *((_OWORD *)v183 + 26) = 0u;
            *((_OWORD *)v183 + 27) = 0u;
            *((_OWORD *)v183 + 24) = 0u;
            *((_OWORD *)v183 + 25) = 0u;
            *((_OWORD *)v183 + 22) = 0u;
            *((_OWORD *)v183 + 23) = 0u;
            *((_OWORD *)v183 + 20) = 0u;
            *((_OWORD *)v183 + 21) = 0u;
            *((_OWORD *)v183 + 1_Block_object_dispose(&STACK[0x488], 8) = 0u;
            *((_OWORD *)v183 + 19) = 0u;
            *((_OWORD *)v183 + 16) = 0u;
            *((_OWORD *)v183 + 17) = 0u;
            *((_OWORD *)v183 + 14) = 0u;
            *((_OWORD *)v183 + 15) = 0u;
            *((_OWORD *)v183 + 12) = 0u;
            *((_OWORD *)v183 + 13) = 0u;
            *((_OWORD *)v183 + 10) = 0u;
            *((_OWORD *)v183 + 11) = 0u;
            *((_OWORD *)v183 + _Block_object_dispose(&STACK[0x488], 8) = 0u;
            *((_OWORD *)v183 + 9) = 0u;
            *((_OWORD *)v183 + 6) = 0u;
            *((_OWORD *)v183 + 7) = 0u;
            *((_OWORD *)v183 + 4) = 0u;
            *((_OWORD *)v183 + 5) = 0u;
            *((_OWORD *)v183 + 2) = 0u;
            *((_OWORD *)v183 + 3) = 0u;
            *(_OWORD *)uint64_t v183 = 0u;
            *((_OWORD *)v183 + 1) = 0u;
            *((_OWORD *)v183 + 2) = *(_OWORD *)v413;
            *((_DWORD *)v183 + 12) = -361;
            *((_DWORD *)v183 + 32) = -1;
            *((_DWORD *)v183 + 9_Block_object_dispose(&STACK[0x488], 8) = -1;
            *((_DWORD *)v183 + 105) = -1;
            *((_DWORD *)v183 + 12_Block_object_dispose(&STACK[0x488], 8) = 0;
            v183[516] = 0;
            memcpy(&a15[520 * *a16], (const void *)(v180 + ((unint64_t)*v182 << 9)), 0x200uLL);
            unsigned int v172 = *a16 + 1;
            *a16 = v172;
            uint64_t v180 = *((void *)&v39 + 1);
          }
          ++v182;
          --v181;
        }
        while (v181);
      }
      if (v172)
      {
        unsigned int v184 = v172;
        if (v172 == 1)
        {
          uint64_t v185 = 0;
          goto LABEL_126;
        }
        uint64_t v185 = v172 & 0xFFFFFFFE;
        if (v185 != v172)
        {
LABEL_126:
          unint64_t v189 = v185 | 1;
          if (v189 > v172) {
            unsigned int v184 = v189;
          }
        }
      }
      else
      {
        unsigned int v184 = 0;
      }
      *a16 = v184;
      if (v165)
      {
        uint64_t v190 = (unsigned int *)v402;
        do
        {
          unsigned int v191 = *v190++;
          v31->i32[v157] = *(_DWORD *)(v40 + 4 * v191);
          LODWORD(v157) = v157 + 1;
          --v165;
        }
        while (v165);
        unsigned int v424 = v157;
      }
      goto LABEL_132;
    }
    acTrkObjectSetUpIoUMunkresCost((_OWORD *)a4, a5, v421, v408, (uint64_t)v394);
    memcpy(v396, v394, 4 * v67);
    bmMunkres((float *)v394, v68, v72, v75, v395, v76, 0, v77);
    acTrkObjectIoUAssocCore((_DWORD *)a4, a5, v421, v408, (uint64_t)v395, (uint64_t)v396, a9, a11, v31, &v424, v410, v392, (void *)v39, (uint64_t)a17, a19, a20);
    if (a5 >= 2)
    {
      int v149 = 0;
      int v150 = 0;
      uint64_t v78 = a5 & 0xFFFFFFFE;
      uint64_t v151 = a4;
      uint64_t v152 = v78;
      do
      {
        if (*(_DWORD *)(v151 + 528) == 2) {
          ++v149;
        }
        if (*(_DWORD *)(v151 + 2252) == 2) {
          ++v150;
        }
        v151 += 3448;
        v152 -= 2;
      }
      while (v152);
      unsigned int v73 = v150 + v149;
      if (v78 == a5) {
        goto LABEL_73;
      }
    }
    else
    {
      uint64_t v78 = 0;
      unsigned int v73 = 0;
    }
    uint64_t v153 = a5 - v78;
    int v154 = (_DWORD *)(a4 + 1724 * v78 + 528);
    do
    {
      if (*v154 == 2) {
        ++v73;
      }
      v154 += 431;
      --v153;
    }
    while (v153);
LABEL_73:
    unsigned int v74 = v424;
    goto LABEL_74;
  }
  unsigned int v424 = 0;
  unsigned int v45 = *a16;
  unsigned int v44 = a2;
  if (!(a5 | *a16)) {
    goto LABEL_47;
  }
  v401 = (void *)v430;
  BOOL v404 = a5 == 0;
  uint64_t v410 = __b;
  uint64_t v409 = v429;
  unsigned int v418 = a5;
  if (a5)
  {
    uint64_t v46 = 0;
    uint64_t v47 = 1724 * a5;
    a5 = 0;
    while (1)
    {
      uint64_t v53 = a4 + v46;
      *(_DWORD *)(a4 + v46 + 44_Block_object_dispose(&STACK[0x488], 8) = 1;
      unsigned int v54 = *(_DWORD *)(a4 + v46 + 780);
      unsigned int v55 = v54 - 1;
      if (!v54) {
        unsigned int v55 = 0;
      }
      uint64_t v56 = v53 + 40 * v55 + 532;
      uint64_t v57 = *(unsigned int *)(v53 + 8);
      if (v57 == 9) {
        break;
      }
      if (v54 < 6)
      {
        uint64_t v63 = a4 + 40 * v54 + v46 + 532;
        long long v64 = *(_OWORD *)v56;
        long long v65 = *(_OWORD *)(v56 + 16);
        *(void *)(v63 + 32) = *(void *)(v56 + 32);
        *(_OWORD *)uint64_t v63 = v64;
        *(_OWORD *)(v63 + 16) = v65;
        ++*(_DWORD *)(v53 + 780);
        if (a7) {
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v60 = a4 + v46 + 732;
        long long v61 = *(_OWORD *)v56;
        long long v62 = *(_OWORD *)(v56 + 16);
        *(void *)(v60 + 32) = *(void *)(v56 + 32);
        *(_OWORD *)uint64_t v60 = v61;
        *(_OWORD *)(v60 + 16) = v62;
        if (a7) {
          goto LABEL_24;
        }
      }
LABEL_25:
      if v57 < 9 && ((0x13Fu >> v57))
      {
        uint64_t v48 = qword_246D9F2C0[v57];
      }
      else if ((v57 & 0xFFFFFFFE) == 0xA)
      {
        uint64_t v48 = 6;
      }
      else
      {
        uint64_t v48 = 5;
      }
      unsigned int v49 = *(_DWORD *)(a9 + 4 * v48 + 60);
      unsigned int v50 = *(_DWORD *)(a4 + v46 + 512);
      BOOL v51 = v50 >= v49;
      if (v50 < v49) {
        int v52 = 1;
      }
      else {
        int v52 = 2;
      }
      if (v51) {
        ++a5;
      }
      *(_DWORD *)(a4 + v46 + 52_Block_object_dispose(&STACK[0x488], 8) = v52;
      v46 += 1724;
      if (v47 == v46)
      {
        unsigned int v148 = a16;
        unsigned int v45 = *a16;
        goto LABEL_121;
      }
    }
    long long v58 = *(_OWORD *)v56;
    long long v59 = *(_OWORD *)(v56 + 16);
    *(void *)(v53 + 564) = *(void *)(v56 + 32);
    *(_OWORD *)(v53 + 532) = v58;
    *(_OWORD *)(v53 + 54_Block_object_dispose(&STACK[0x488], 8) = v59;
    *(_DWORD *)(v53 + 780) = 1;
    if (!a7) {
      goto LABEL_25;
    }
LABEL_24:
    ++*(_DWORD *)(a4 + v46 + 512);
    goto LABEL_25;
  }
  unsigned int v148 = a16;
LABEL_121:
  unsigned int v411 = a1;
  unsigned int v408 = v30;
  if (v45)
  {
    unint64_t v186 = 0;
    int32x4_t v187 = vdupq_n_s32(0xFFFFFE97);
    do
    {
      *((_OWORD *)v27 + 30) = 0uLL;
      *((_OWORD *)v27 + 31) = 0uLL;
      *((_OWORD *)v27 + 2_Block_object_dispose(&STACK[0x488], 8) = 0uLL;
      *((_OWORD *)v27 + 29) = 0uLL;
      *((_OWORD *)v27 + 26) = 0uLL;
      *((_OWORD *)v27 + 27) = 0uLL;
      *((_OWORD *)v27 + 24) = 0uLL;
      *((_OWORD *)v27 + 25) = 0uLL;
      *((_OWORD *)v27 + 22) = 0uLL;
      *((_OWORD *)v27 + 23) = 0uLL;
      *((_OWORD *)v27 + 20) = 0uLL;
      *((_OWORD *)v27 + 21) = 0uLL;
      *((_OWORD *)v27 + 1_Block_object_dispose(&STACK[0x488], 8) = 0uLL;
      *((_OWORD *)v27 + 19) = 0uLL;
      *((_OWORD *)v27 + 16) = 0uLL;
      *((_OWORD *)v27 + 17) = 0uLL;
      *((_OWORD *)v27 + 14) = 0uLL;
      *((_OWORD *)v27 + 15) = 0uLL;
      *((_OWORD *)v27 + 12) = 0uLL;
      *((_OWORD *)v27 + 13) = 0uLL;
      *((_OWORD *)v27 + 10) = 0uLL;
      *((_OWORD *)v27 + 11) = 0uLL;
      *((_OWORD *)v27 + _Block_object_dispose(&STACK[0x488], 8) = 0uLL;
      *((_OWORD *)v27 + 9) = 0uLL;
      *((_OWORD *)v27 + 6) = 0uLL;
      *((_OWORD *)v27 + 7) = 0uLL;
      *((_OWORD *)v27 + 4) = 0uLL;
      *((_OWORD *)v27 + 5) = 0uLL;
      *((_OWORD *)v27 + 2) = 0uLL;
      *((_OWORD *)v27 + 3) = 0uLL;
      *(_OWORD *)float32x2_t v27 = 0uLL;
      *((_OWORD *)v27 + 1) = 0uLL;
      *((int32x4_t *)v27 + 2) = v187;
      *((_DWORD *)v27 + 12) = -361;
      *((_DWORD *)v27 + 32) = -1;
      *((_DWORD *)v27 + 9_Block_object_dispose(&STACK[0x488], 8) = -1;
      *((_DWORD *)v27 + 105) = -1;
      *((_DWORD *)v27 + 12_Block_object_dispose(&STACK[0x488], 8) = 0;
      v27[516] = 0;
      ++v186;
      v27 += 520;
    }
    while (v186 < *v148);
  }
  unsigned int v188 = 0;
  unsigned int *v148 = 0;
LABEL_204:
  unsigned int v276 = v418 - a5 + v188;
  if (v276 > v23)
  {
    if (v404)
    {
      unsigned int v277 = a5;
      unsigned int v278 = 0;
    }
    else
    {
      unsigned int v277 = a5;
      uint64_t v371 = 0;
      unsigned int v278 = 0;
      unsigned int v372 = (_DWORD *)(a4 + 528);
      do
      {
        if (*v372 == 1)
        {
          uint64_t v373 = (_DWORD *)(v32 + 8 * v278);
          *uint64_t v373 = v371;
          v373[1] = *(v372 - 2);
          ++v278;
        }
        ++v371;
        v372 += 431;
      }
      while (v418 != v371);
    }
    uint64_t v279 = v32;
    bmHeapsort(v32, v278, 8uLL, (int (*)(uint64_t, uint64_t))sub_246D84728);
    unsigned int v280 = v277;
    unsigned int v44 = a2;
    if (v278)
    {
      unsigned int v281 = v280 - v23 + v276;
      if (v280 < v281)
      {
        unint64_t v282 = v278 - 1;
        if (v282 >= v188 + v418 + ~v280 - v23) {
          unint64_t v282 = v188 + v418 + ~v280 - v23;
        }
        if (v282)
        {
          unint64_t v283 = v282 + 1;
          unint64_t v282 = (v282 + 1) & 0x1FFFFFFFELL;
          long long v284 = (unsigned int *)(v279 + 8);
          unint64_t v285 = v282;
          do
          {
            unsigned int v286 = *(v284 - 2);
            unsigned int v287 = *v284;
            v284 += 4;
            *(_DWORD *)(a4 + 1724 * v286 + 52_Block_object_dispose(&STACK[0x488], 8) = 2;
            *(_DWORD *)(a4 + 1724 * v287 + 52_Block_object_dispose(&STACK[0x488], 8) = 2;
            v285 -= 2;
          }
          while (v285);
          if (v283 == v282) {
            goto LABEL_220;
          }
          v280 += v282;
        }
        unint64_t v288 = v282 + 1;
        unsigned int v289 = v280 + 1;
        long long v290 = (unsigned int *)(v279 + 8 * v282);
        do
        {
          unsigned int v291 = *v290;
          v290 += 2;
          *(_DWORD *)(a4 + 1724 * v291 + 52_Block_object_dispose(&STACK[0x488], 8) = 2;
          if (v288 >= v278) {
            break;
          }
          ++v288;
          BOOL v51 = v289++ >= v281;
        }
        while (!v51);
      }
    }
  }
LABEL_220:
  acTrkObjectPickDet(v411, v44, a4, v418, v23, v421, v408, (uint64_t)v31, &v424, v409, v390, v410, v393, *(unsigned char *)(a9 + 194), *(_DWORD *)(a9 + 196));
  if (v404)
  {
    unsigned int v292 = 0;
  }
  else
  {
    uint64_t v365 = 0;
    unsigned int v292 = 0;
    unint64_t v366 = (int *)a4;
    do
    {
      if (v366[132] <= 1)
      {
        if (v365 != v292) {
          memcpy((void *)(a4 + 1724 * v292), v366, 0x6BCuLL);
        }
        ++v292;
      }
      v366 += 431;
      ++v365;
    }
    while (v418 != v365);
  }
  if (v292 >= v23) {
    unint64_t v293 = v23;
  }
  else {
    unint64_t v293 = v292;
  }
  unsigned int v294 = v424;
  if (v424 >= v23) {
    unsigned int v294 = v23;
  }
  if (v294 + v293 <= v23) {
    uint64_t v295 = v294;
  }
  else {
    uint64_t v295 = v23 - v293;
  }
  if (v295)
  {
    float v407 = v34;
    int32x4_t v420 = vdupq_n_s32(0xFFFFFE97);
    *(void *)v417 = v293;
    LODWORD(v86) = v293;
    uint64_t v296 = v421;
    do
    {
      unsigned __int32 v338 = v31->i32[0];
      float32x2_t v31 = (int32x4_t *)((char *)v31 + 4);
      uint64_t v337 = v338;
      unsigned int v339 = v86;
      uint64_t v340 = (_DWORD *)(a4 + 1724 * v86);
      bzero(v340, 0x6BCuLL);
      *((int32x4_t *)v340 + 2) = v420;
      v340[12] = -361;
      v340[32] = -1;
      v340[98] = -1;
      v340[105] = -1;
      *(void *)(v340 + 193) = 0xFF7FFFFFFFFFFFFFLL;
      v340[198] = 0;
      *(void *)(v340 + 207) = 0;
      unint64_t v341 = v296 + ((unint64_t)v338 << 9);
      v340[209] = 0;
      memcpy(v340, (const void *)v341, 0x200uLL);
      int v342 = (*a14)++;
      *uint64_t v340 = v342;
      v340[131] = LODWORD(a17[v338]);
      int v343 = *(_DWORD *)(v341 + 8);
      uint64_t v344 = (long long *)(v341 + 12);
      int v345 = *(_DWORD *)(v341 + 40);
      int v346 = *(_DWORD *)(v341 + 44);
      char v347 = *(unsigned char *)(v341 + 100);
      int v348 = *(_DWORD *)(v341 + 420);
      if (v340[2] == 9)
      {
        long long v297 = *v344;
        uint64_t v298 = a4 + 1724 * v339;
        *(_OWORD *)(v298 + 532) = v297;
        *(unsigned char *)(v298 + 54_Block_object_dispose(&STACK[0x488], 8) = v347;
        *(_DWORD *)(v298 + 564) = v348;
        *(_DWORD *)(v298 + 556) = v346;
        *(_DWORD *)(v298 + 552) = v345;
        *(_DWORD *)(v298 + 56_Block_object_dispose(&STACK[0x488], 8) = v343;
        *(_DWORD *)(v298 + 780) = 1;
      }
      else
      {
        uint64_t v349 = a4 + 1724 * v339;
        unsigned int v350 = *(_DWORD *)(v349 + 780);
        if (v350 < 6)
        {
          uint64_t v353 = a4 + 1724 * v339 + 40 * v350;
          *(_OWORD *)(v353 + 532) = *v344;
          *(unsigned char *)(v353 + 54_Block_object_dispose(&STACK[0x488], 8) = v347;
          *(_DWORD *)(v353 + 564) = v348;
          *(_DWORD *)(v353 + 556) = v346;
          *(_DWORD *)(v353 + 552) = v345;
          *(_DWORD *)(v353 + 56_Block_object_dispose(&STACK[0x488], 8) = v343;
          ++*(_DWORD *)(v349 + 780);
        }
        else
        {
          long long v351 = *v344;
          uint64_t v352 = a4 + 1724 * v339;
          *(_OWORD *)(v352 + 732) = v351;
          *(unsigned char *)(v352 + 74_Block_object_dispose(&STACK[0x488], 8) = v347;
          *(_DWORD *)(v352 + 764) = v348;
          *(_DWORD *)(v352 + 756) = v346;
          *(_DWORD *)(v352 + 752) = v345;
          *(_DWORD *)(v352 + 76_Block_object_dispose(&STACK[0x488], 8) = v343;
        }
      }
      uint64_t v299 = a4 + 1724 * v339;
      uint64_t v296 = v421;
      uint64_t v300 = v421 + (v337 << 9);
      long long v301 = *(_OWORD *)(v300 + 132);
      long long v302 = *(_OWORD *)(v300 + 148);
      long long v303 = *(_OWORD *)(v300 + 180);
      *(_OWORD *)(v299 + 912) = *(_OWORD *)(v300 + 164);
      *(_OWORD *)(v299 + 92_Block_object_dispose(&STACK[0x488], 8) = v303;
      *(_OWORD *)(v299 + 880) = v301;
      *(_OWORD *)(v299 + 896) = v302;
      long long v304 = *(_OWORD *)(v300 + 196);
      long long v305 = *(_OWORD *)(v300 + 212);
      long long v306 = *(_OWORD *)(v300 + 244);
      *(_OWORD *)(v299 + 976) = *(_OWORD *)(v300 + 228);
      *(_OWORD *)(v299 + 992) = v306;
      *(_OWORD *)(v299 + 944) = v304;
      *(_OWORD *)(v299 + 960) = v305;
      long long v307 = *(_OWORD *)(v300 + 260);
      long long v308 = *(_OWORD *)(v300 + 276);
      long long v309 = *(_OWORD *)(v300 + 292);
      *(_OWORD *)(v299 + 1056) = *(_OWORD *)(v300 + 308);
      *(_OWORD *)(v299 + 1040) = v309;
      *(_OWORD *)(v299 + 100_Block_object_dispose(&STACK[0x488], 8) = v307;
      *(_OWORD *)(v299 + 1024) = v308;
      long long v310 = *(_OWORD *)(v300 + 324);
      long long v311 = *(_OWORD *)(v300 + 340);
      long long v312 = *(_OWORD *)(v300 + 356);
      *(_OWORD *)(v299 + 1120) = *(_OWORD *)(v300 + 372);
      *(_OWORD *)(v299 + 1104) = v312;
      *(_OWORD *)(v299 + 108_Block_object_dispose(&STACK[0x488], 8) = v311;
      *(_OWORD *)(v299 + 1072) = v310;
      long long v313 = *(_OWORD *)(v300 + 132);
      long long v314 = *(_OWORD *)(v300 + 148);
      long long v315 = *(_OWORD *)(v300 + 164);
      *(_OWORD *)(v299 + 1184) = *(_OWORD *)(v300 + 180);
      *(_OWORD *)(v299 + 116_Block_object_dispose(&STACK[0x488], 8) = v315;
      *(_OWORD *)(v299 + 1152) = v314;
      *(_OWORD *)(v299 + 1136) = v313;
      long long v316 = *(_OWORD *)(v300 + 196);
      long long v317 = *(_OWORD *)(v300 + 212);
      long long v318 = *(_OWORD *)(v300 + 228);
      *(_OWORD *)(v299 + 124_Block_object_dispose(&STACK[0x488], 8) = *(_OWORD *)(v300 + 244);
      *(_OWORD *)(v299 + 1232) = v318;
      *(_OWORD *)(v299 + 1216) = v317;
      *(_OWORD *)(v299 + 1200) = v316;
      long long v319 = *(_OWORD *)(v300 + 260);
      long long v320 = *(_OWORD *)(v300 + 276);
      long long v321 = *(_OWORD *)(v300 + 292);
      *(_OWORD *)(v299 + 1312) = *(_OWORD *)(v300 + 308);
      *(_OWORD *)(v299 + 1296) = v321;
      *(_OWORD *)(v299 + 1280) = v320;
      *(_OWORD *)(v299 + 1264) = v319;
      long long v322 = *(_OWORD *)(v300 + 324);
      long long v323 = *(_OWORD *)(v300 + 340);
      long long v324 = *(_OWORD *)(v300 + 356);
      *(_OWORD *)(v299 + 1376) = *(_OWORD *)(v300 + 372);
      *(_OWORD *)(v299 + 1360) = v324;
      *(_OWORD *)(v299 + 1344) = v323;
      *(_OWORD *)(v299 + 132_Block_object_dispose(&STACK[0x488], 8) = v322;
      long long v325 = *(_OWORD *)(v300 + 132);
      long long v326 = *(_OWORD *)(v300 + 148);
      long long v327 = *(_OWORD *)(v300 + 164);
      *(_OWORD *)(v299 + 1440) = *(_OWORD *)(v300 + 180);
      *(_OWORD *)(v299 + 1424) = v327;
      *(_OWORD *)(v299 + 140_Block_object_dispose(&STACK[0x488], 8) = v326;
      *(_OWORD *)(v299 + 1392) = v325;
      long long v328 = *(_OWORD *)(v300 + 196);
      long long v329 = *(_OWORD *)(v300 + 212);
      long long v330 = *(_OWORD *)(v300 + 228);
      *(_OWORD *)(v299 + 1504) = *(_OWORD *)(v300 + 244);
      *(_OWORD *)(v299 + 148_Block_object_dispose(&STACK[0x488], 8) = v330;
      *(_OWORD *)(v299 + 1472) = v329;
      *(_OWORD *)(v299 + 1456) = v328;
      long long v331 = *(_OWORD *)(v300 + 260);
      long long v332 = *(_OWORD *)(v300 + 276);
      long long v333 = *(_OWORD *)(v300 + 292);
      *(_OWORD *)(v299 + 156_Block_object_dispose(&STACK[0x488], 8) = *(_OWORD *)(v300 + 308);
      *(_OWORD *)(v299 + 1552) = v333;
      *(_OWORD *)(v299 + 1536) = v332;
      *(_OWORD *)(v299 + 1520) = v331;
      long long v334 = *(_OWORD *)(v300 + 324);
      long long v335 = *(_OWORD *)(v300 + 340);
      long long v336 = *(_OWORD *)(v300 + 356);
      *(_OWORD *)(v299 + 1632) = *(_OWORD *)(v300 + 372);
      *(_OWORD *)(v299 + 1616) = v336;
      *(_OWORD *)(v299 + 1600) = v335;
      *(_OWORD *)(v299 + 1584) = v334;
      *(_OWORD *)(v299 + 1664) = *(_OWORD *)(v300 + 12);
      *(_OWORD *)(v299 + 1680) = *(_OWORD *)(v300 + 12);
      *(float *)(v299 + 164_Block_object_dispose(&STACK[0x488], 8) = (float)*(unsigned int *)(v300 + 28);
      unint64_t v86 = v339 + 1;
      --v295;
    }
    while (v295);
    unint64_t v293 = *(void *)v417;
    unsigned int v354 = v86 - v417[0];
    *a12 = v86 - v417[0];
    if (v86 <= v417[0])
    {
      float v357 = a13;
      *a13 = 0;
      unsigned int v44 = a2;
      int v34 = v407;
      float v358 = v401;
      if (!v417[0]) {
        goto LABEL_277;
      }
      goto LABEL_263;
    }
    unint64_t v355 = v86 - *(void *)v417;
    unint64_t v356 = *(void *)v417;
    float v357 = a13;
    unsigned int v44 = a2;
    int v34 = v407;
    float v358 = v401;
    if (v86 - *(void *)v417 > 7)
    {
      unint64_t v359 = v355 & 0xFFFFFFFFFFFFFFF8;
      int32x4_t v360 = vaddq_s32(vdupq_n_s32(v417[0]), (int32x4_t)xmmword_246D9F130);
      unint64_t v361 = (v86 - *(void *)v417) & 0xFFFFFFFFFFFFFFF8;
      BOOL v362 = v407 + 1;
      v363.i64[0] = 0x400000004;
      v363.i64[1] = 0x400000004;
      v364.i64[0] = 0x800000008;
      v364.i64[1] = 0x800000008;
      do
      {
        v362[-1] = v360;
        *BOOL v362 = vaddq_s32(v360, v363);
        int32x4_t v360 = vaddq_s32(v360, v364);
        v362 += 2;
        v361 -= 8;
      }
      while (v361);
      if (v355 == v359)
      {
LABEL_245:
        *a13 = 0;
        if (v421) {
          goto LABEL_246;
        }
        goto LABEL_255;
      }
      unint64_t v356 = v359 + *(void *)v417;
    }
    do
    {
      v407->i32[v356 - *(void *)v417] = v356;
      ++v356;
    }
    while (v86 != v356);
    goto LABEL_245;
  }
  unsigned int v354 = 0;
  float v357 = a13;
  *a12 = 0;
  unint64_t v86 = v293;
  float v358 = v401;
  *a13 = 0;
  if (v421)
  {
LABEL_246:
    if (!v293) {
      goto LABEL_277;
    }
LABEL_263:
    uint64_t v367 = 0;
    uint64_t v368 = (_DWORD *)(a4 + 512);
    do
    {
      if (!*v368)
      {
        v34->i32[v354++] = v367;
        ++*v357;
      }
      v368 += 431;
      ++v367;
    }
    while (v293 != v367);
    uint64_t v369 = 0;
    int v370 = (_DWORD *)(a4 + 512);
    do
    {
      if (*v370) {
        v34->i32[v354++] = v369;
      }
      v370 += 431;
      ++v369;
    }
    while (v293 != v369);
    goto LABEL_277;
  }
LABEL_255:
  if (!v293) {
    goto LABEL_277;
  }
  if (v293 <= 0xB || __CFADD__(v354, v293 - 1))
  {
    for (uint64_t i = 0; i != v293; ++i)
LABEL_260:
      v34->i32[v354 + i] = i;
    goto LABEL_277;
  }
  int32x4_t v374 = (int32x4_t)xmmword_246D9F130;
  uint64_t i = v293 & 0xFFFFFFF8;
  v376.i64[0] = 0x400000004;
  v376.i64[1] = 0x400000004;
  v377.i64[0] = 0x800000008;
  v377.i64[1] = 0x800000008;
  unsigned int v378 = v354;
  uint64_t v379 = i;
  do
  {
    v380 = (int32x4_t *)((char *)v34 + 4 * v378);
    int32x4_t *v380 = v374;
    v380[1] = vaddq_s32(v374, v376);
    int32x4_t v374 = vaddq_s32(v374, v377);
    v378 += 8;
    v379 -= 8;
  }
  while (v379);
  if (i != v293) {
    goto LABEL_260;
  }
LABEL_277:
  uint64_t v381 = v86;
  bzero(v358, v86);
  if (v86)
  {
    uint64_t v382 = 0;
    do
    {
      if (!*((unsigned char *)v358 + v382))
      {
        memcpy(__src, (const void *)(a4 + 1724 * v382), 0x6BCuLL);
        *((unsigned char *)v358 + v382) = 1;
        uint64_t v383 = v34->u32[v382];
        uint64_t v384 = v382;
        if (v382 != v383)
        {
          uint64_t v384 = v382;
          do
          {
            memcpy((void *)(a4 + 1724 * v384), (const void *)(a4 + 1724 * v383), 0x6BCuLL);
            uint64_t v384 = v34->u32[v384];
            *((unsigned char *)v358 + v384) = 1;
            uint64_t v383 = v34->u32[v384];
          }
          while (v382 != v383);
        }
        memcpy((void *)(a4 + 1724 * v384), __src, 0x6BCuLL);
      }
      ++v382;
    }
    while (v382 != v86);
    do
    {
      int v385 = *(_DWORD *)(a4 + 520);
      if (v385 == -1) {
        int v386 = -1;
      }
      else {
        int v386 = v385 + 1;
      }
      *(_DWORD *)(a4 + 520) = v386;
      float v387 = *(float *)(a4 + 20) * *(float *)(a4 + 24);
      *(float *)(a4 + 82_Block_object_dispose(&STACK[0x488], 8) = v387;
      *(float *)(a4 + 832) = v387 / (float)((float)(v44 * v411) + 0.0001);
      a4 += 1724;
      --v381;
    }
    while (v381);
  }
  return v86;
}

BOOL acTrkObjectAgeComp(_DWORD *a1, _DWORD *a2)
{
  return a1[130] > a2[130];
}

BOOL acTrkObjectAgeCompReverse(_DWORD *a1, _DWORD *a2)
{
  return a1[130] < a2[130];
}

uint64_t AcTrkObjectGroupIdCount(uint64_t result, unsigned int a2, char *__b)
{
  if (a2)
  {
    uint64_t v5 = result;
    unint64_t v6 = a2;
    uint64_t result = (uint64_t)memset(__b, 255, 4 * a2);
    uint64_t v7 = 0;
    unsigned int v8 = a2 - 1;
    uint64_t v9 = (int *)(__b + 4);
    uint64_t v10 = (_DWORD *)(v5 + 1728);
    do
    {
      uint64_t v11 = v7 + 1;
      if (v7 + 1 < v6)
      {
        int v12 = *(_DWORD *)(v5 + 1724 * v7 + 4);
        float v13 = v10;
        float v14 = v9;
        LODWORD(result) = v8;
        do
        {
          if (v12 == *v13)
          {
            int v15 = *(_DWORD *)&__b[4 * v7];
            BOOL v16 = __CFADD__(v15, 1);
            int v17 = v15 + 1;
            if (v16) {
              int v17 = 2;
            }
            *(_DWORD *)&__b[4 * v7] = v17;
            int *v14 = v17;
          }
          v13 += 431;
          ++v14;
          uint64_t result = (result - 1);
        }
        while (result);
      }
      --v8;
      ++v9;
      v10 += 431;
      ++v7;
    }
    while (v11 != v6);
  }
  return result;
}

unint64_t acTrkObjectRemoveOldOverlapObjects(uint64_t a1, unint64_t a2, int *a3, float a4)
{
  unint64_t v4 = a2;
  if (a2)
  {
    bmHeapsort(a1, a2, 0x6BCuLL, (int (*)(uint64_t, uint64_t))acTrkObjectAgeComp);
    memset(a3, 255, 4 * v4);
    uint64_t v8 = 0;
    int v9 = v4 - 1;
    uint64_t v10 = a3 + 1;
    uint64_t v11 = (_DWORD *)(a1 + 1728);
    do
    {
      uint64_t v12 = v8 + 1;
      if (v8 + 1 < (unint64_t)v4)
      {
        int v13 = *(_DWORD *)(a1 + 1724 * v8 + 4);
        float v14 = v11;
        int v15 = v10;
        int v16 = v9;
        do
        {
          if (v13 == *v14)
          {
            int v17 = a3[v8];
            BOOL v18 = __CFADD__(v17, 1);
            int v19 = v17 + 1;
            if (v18) {
              int v19 = 2;
            }
            a3[v8] = v19;
            int *v15 = v19;
          }
          v14 += 431;
          ++v15;
          --v16;
        }
        while (v16);
      }
      --v9;
      ++v10;
      v11 += 431;
      ++v8;
    }
    while (v12 != v4);
    unint64_t v20 = 0;
    unsigned int v21 = a3 + 1;
    uint64_t v22 = a1 + 1724;
    int v23 = -1;
    do
    {
      unint64_t v43 = v20 + 1;
      unsigned int v44 = v21;
      if (v20 + 1 >= v4)
      {
        unint64_t v4 = v20 + 1;
      }
      else
      {
        uint64_t v24 = a1 + 1724 * v20;
        int v25 = v4 + v23;
        unint64_t v4 = v20 + 1;
        uint64_t v26 = v22;
        do
        {
          int v27 = *(_DWORD *)(v24 + 8);
          if (v27 != *(_DWORD *)(v26 + 8)) {
            goto LABEL_34;
          }
          float v28 = *(float *)(v24 + 12);
          float v29 = *(float *)(v24 + 16);
          float v30 = *(float *)(v24 + 20);
          float v31 = *(float *)(v24 + 24);
          float v32 = v29 + v31;
          float v33 = *(float *)(v26 + 12);
          float v34 = *(float *)(v26 + 16);
          float v35 = 0.0;
          if ((float)(v28 + v30) > v33 && v32 > v34)
          {
            float v37 = *(float *)(v26 + 20);
            float v38 = *(float *)(v26 + 24);
            float v39 = v34 + v38;
            if ((float)(v33 + v37) > v28 && v39 > v29) {
              float v35 = (float)(fmaxf(fminf(v28 + v30, v33 + v37) - fmaxf(v28, v33), 0.0)
            }
                          * fmaxf(fminf(v32, v39) - fmaxf(v29, v34), 0.0))
                  / fmaxf(fminf(v30 * v31, v37 * v38), 0.00001);
          }
          if (v35 <= a4 || ((v27 - 1) >= 2 ? (BOOL v41 = v27 == 4) : (BOOL v41 = 1), v41 || !v27 && *v21 == 2))
          {
LABEL_34:
            memcpy((void *)(a1 + 1724 * v4), (const void *)v26, 0x6BCuLL);
            unint64_t v4 = (v4 + 1);
          }
          ++v21;
          v26 += 1724;
          --v25;
        }
        while (v25);
      }
      --v23;
      unsigned int v21 = v44 + 1;
      v22 += 1724;
      unint64_t v20 = v43;
    }
    while (v43 < v4);
  }
  return v4;
}

unint64_t acTrkFullBodyRemoveYoungOverlapObjects(uint64_t a1, unint64_t a2, float a3)
{
  unint64_t v3 = a2;
  if (a2)
  {
    bmHeapsort(a1, a2, 0x6BCuLL, (int (*)(uint64_t, uint64_t))acTrkObjectAgeComp);
    unint64_t v6 = 0;
    uint64_t v7 = a1 + 1724;
    int v8 = -1;
    do
    {
      unint64_t v26 = v6 + 1;
      if (v6 + 1 >= v3)
      {
        unint64_t v3 = v6 + 1;
      }
      else
      {
        uint64_t v9 = a1 + 1724 * v6;
        int v10 = v3 + v8;
        uint64_t v11 = v7;
        unint64_t v3 = v6 + 1;
        do
        {
          if (*(_DWORD *)(v9 + 8) != *(_DWORD *)(v11 + 8)) {
            goto LABEL_7;
          }
          float v12 = *(float *)(v9 + 12);
          float v13 = *(float *)(v9 + 16);
          float v14 = *(float *)(v9 + 20);
          float v15 = *(float *)(v9 + 24);
          float v16 = v13 + v15;
          float v17 = *(float *)(v11 + 12);
          float v18 = *(float *)(v11 + 16);
          float v19 = 0.0;
          if ((float)(v12 + v14) > v17 && v16 > v18)
          {
            float v21 = *(float *)(v11 + 20);
            float v22 = *(float *)(v11 + 24);
            float v23 = v18 + v22;
            if ((float)(v17 + v21) > v12 && v23 > v13) {
              float v19 = (float)(fmaxf(fminf(v12 + v14, v17 + v21) - fmaxf(v12, v17), 0.0)
            }
                          * fmaxf(fminf(v16, v23) - fmaxf(v13, v18), 0.0))
                  / fmaxf(fminf(v14 * v15, v21 * v22), 0.00001);
          }
          if (v19 <= a3 || *(_DWORD *)(v9 + 512))
          {
LABEL_7:
            memcpy((void *)(a1 + 1724 * v3), (const void *)v11, 0x6BCuLL);
            unint64_t v3 = (v3 + 1);
          }
          v11 += 1724;
          --v10;
        }
        while (v10);
      }
      --v8;
      v7 += 1724;
      unint64_t v6 = v26;
    }
    while (v26 < v3);
  }
  return v3;
}

unint64_t acTrkHandRemoveYoungOverlapObjects(uint64_t a1, unint64_t a2, unsigned int a3, unsigned int a4, float a5, float a6)
{
  unint64_t v6 = a2;
  if (a2)
  {
    bmHeapsort(a1, a2, 0x6BCuLL, (int (*)(uint64_t, uint64_t))acTrkObjectAgeCompReverse);
    unint64_t v10 = 0;
    int v11 = -1;
    uint64_t v12 = a1;
    do
    {
      unint64_t v33 = v10 + 1;
      if (v10 + 1 >= v6)
      {
        unint64_t v6 = v10 + 1;
      }
      else
      {
        uint64_t v13 = a1 + 1724 * v10;
        float v14 = (int *)(v13 + 1720);
        int v15 = v6 + v11;
        uint64_t v16 = v12;
        unint64_t v6 = v10 + 1;
        do
        {
          if (*(_DWORD *)(v13 + 8) == *(_DWORD *)(v16 + 1732)) {
            goto LABEL_24;
          }
          float v17 = *(float *)(v13 + 12);
          float v18 = *(float *)(v13 + 16);
          float v19 = *(float *)(v13 + 20);
          float v20 = *(float *)(v13 + 24);
          float v21 = v18 + v20;
          float v22 = *(float *)(v16 + 1736);
          float v23 = *(float *)(v16 + 1740);
          float v24 = 0.0;
          if ((float)(v17 + v19) > v22 && v21 > v23)
          {
            float v26 = *(float *)(v16 + 1744);
            float v27 = *(float *)(v16 + 1748);
            float v28 = v23 + v27;
            if ((float)(v22 + v26) > v17 && v28 > v18)
            {
              float v30 = fmaxf(fminf(v17 + v19, v22 + v26) - fmaxf(v17, v22), 0.0)
                  * fmaxf(fminf(v21, v28) - fmaxf(v18, v23), 0.0);
              float v24 = v30 / fmaxf((float)((float)(v19 * v20) + (float)(v26 * v27)) - v30, 0.00001);
            }
          }
          if (v24 <= a5 || *(_DWORD *)(v16 + 2244) > a3 || *v14 >= a4 || *(float *)(v16 + 2556) <= a6)
          {
LABEL_24:
            memcpy((void *)(a1 + 1724 * v6), (const void *)(v16 + 1724), 0x6BCuLL);
            int v31 = 0;
            unint64_t v6 = (v6 + 1);
          }
          else
          {
            int v31 = *v14 + 1;
          }
          int *v14 = v31;
          v16 += 1724;
          --v15;
        }
        while (v15);
      }
      --v11;
      v12 += 1724;
      unint64_t v10 = v33;
    }
    while (v33 < v6);
  }
  return v6;
}

uint64_t acTrkObjectRemoveYoungOverlapObjects(uint64_t a1, uint64_t a2, char *a3, float a4)
{
  uint64_t v4 = a2;
  if (a2)
  {
    bmHeapsort(a1, a2, 0x6BCuLL, (int (*)(uint64_t, uint64_t))acTrkObjectAgeCompReverse);
    memset(a3, 255, 4 * v4);
    uint64_t v8 = 0;
    int v9 = v4 - 1;
    unint64_t v10 = (int *)(a3 + 4);
    int v11 = (_DWORD *)(a1 + 1728);
    do
    {
      uint64_t v12 = v8 + 1;
      if (v8 + 1 < (unint64_t)v4)
      {
        int v13 = *(_DWORD *)(a1 + 1724 * v8 + 4);
        float v14 = v11;
        int v15 = v10;
        int v16 = v9;
        do
        {
          if (v13 == *v14)
          {
            int v17 = *(_DWORD *)&a3[4 * v8];
            BOOL v18 = __CFADD__(v17, 1);
            int v19 = v17 + 1;
            if (v18) {
              int v19 = 2;
            }
            *(_DWORD *)&a3[4 * v8] = v19;
            int *v15 = v19;
          }
          v14 += 431;
          ++v15;
          --v16;
        }
        while (v16);
      }
      --v9;
      ++v10;
      v11 += 431;
      ++v8;
    }
    while (v12 != v4);
    uint64_t v20 = 0;
    uint64_t v21 = a1 + 1724;
    int v22 = -1;
    do
    {
      unint64_t v42 = v20 + 1;
      uint64_t v43 = v21;
      if (v20 + 1 >= (unint64_t)v4)
      {
        uint64_t v4 = v20 + 1;
      }
      else
      {
        uint64_t v23 = a1 + 1724 * v20;
        int v24 = v4 + v22;
        uint64_t v4 = v20 + 1;
        do
        {
          if (*(_DWORD *)(v21 + 8) | *(_DWORD *)(v23 + 8)) {
            goto LABEL_33;
          }
          float v25 = *(float *)(v23 + 12);
          float v26 = *(float *)(v23 + 16);
          float v27 = *(float *)(v23 + 20);
          float v28 = *(float *)(v23 + 24);
          float v29 = v26 + v28;
          float v30 = *(float *)(v21 + 12);
          float v31 = *(float *)(v21 + 16);
          float v32 = *(float *)(v21 + 20);
          float v33 = *(float *)(v21 + 24);
          float v34 = 0.0;
          if ((float)(v25 + v27) > v30 && v29 > v31)
          {
            float v36 = v31 + v33;
            if ((float)(v30 + v32) > v25 && v36 > v26) {
              float v34 = (float)(fmaxf(fminf(v25 + v27, v30 + v32) - fmaxf(v25, v30), 0.0)
            }
                          * fmaxf(fminf(v29, v36) - fmaxf(v26, v31), 0.0))
                  / fmaxf(fminf(v27 * v28, v32 * v33), 0.00001);
          }
          if (v34 <= a4
            || ((float v38 = v33 * v32, v39 = v28 * v27, *(_DWORD *)&a3[4 * v20] == 2) ? (v40 = v38 < v39) : (v40 = 0), !v40))
          {
LABEL_33:
            memcpy((void *)(a1 + 1724 * v4), (const void *)v21, 0x6BCuLL);
            uint64_t v4 = (v4 + 1);
          }
          v21 += 1724;
          --v24;
        }
        while (v24);
      }
      --v22;
      uint64_t v21 = v43 + 1724;
      ++v20;
    }
    while (v42 < v4);
  }
  return v4;
}

unint64_t acTrkObjectRemoveOldCrossClassOverlapObjects(uint64_t a1, unint64_t a2, float a3)
{
  unint64_t v3 = a2;
  if (a2)
  {
    bmHeapsort(a1, a2, 0x6BCuLL, (int (*)(uint64_t, uint64_t))acTrkObjectAgeComp);
    unint64_t v6 = 0;
    uint64_t v7 = a1 + 1724;
    int v8 = -1;
    do
    {
      unint64_t v9 = v6 + 1;
      if (v6 + 1 >= v3)
      {
        unint64_t v3 = v6 + 1;
      }
      else
      {
        uint64_t v10 = a1 + 1724 * v6;
        int v11 = v3 + v8;
        uint64_t v12 = v7;
        unint64_t v3 = v6 + 1;
        do
        {
          float v13 = *(float *)(v10 + 12);
          float v14 = *(float *)(v10 + 16);
          float v15 = *(float *)(v10 + 20);
          float v16 = *(float *)(v10 + 24);
          float v17 = v14 + v16;
          float v18 = *(float *)(v12 + 12);
          float v19 = *(float *)(v12 + 16);
          float v20 = 0.0;
          if ((float)(v13 + v15) > v18 && v17 > v19)
          {
            float v22 = *(float *)(v12 + 20);
            float v23 = *(float *)(v12 + 24);
            float v24 = v19 + v23;
            if ((float)(v18 + v22) > v13 && v24 > v14)
            {
              float v26 = fmaxf(fminf(v13 + v15, v18 + v22) - fmaxf(v13, v18), 0.0)
                  * fmaxf(fminf(v17, v24) - fmaxf(v14, v19), 0.0);
              float v20 = v26 / fmaxf((float)((float)(v15 * v16) + (float)(v22 * v23)) - v26, 0.00001);
            }
          }
          if (v20 <= a3
            || (int v27 = *(_DWORD *)(v10 + 8), v27 == 1)
            || ((int v28 = *(_DWORD *)(v12 + 8), v28 != 4) ? (v29 = v27 == 4) : (v29 = 1),
                !v29 ? (BOOL v30 = v27 == 2) : (BOOL v30 = 1),
                !v30 ? (BOOL v31 = (v28 - 1) > 1) : (BOOL v31 = 0),
                !v31))
          {
            memcpy((void *)(a1 + 1724 * v3), (const void *)v12, 0x6BCuLL);
            unint64_t v3 = (v3 + 1);
          }
          v12 += 1724;
          --v11;
        }
        while (v11);
      }
      --v8;
      v7 += 1724;
      unint64_t v6 = v9;
    }
    while (v9 < v3);
  }
  return v3;
}

float *mapBoxCenterToFeatMap(float *result, uint64_t *a2, int a3, unsigned int a4, unsigned int a5, int *a6)
{
  int v6 = *((_DWORD *)a2 + 3);
  unsigned int v7 = *((_DWORD *)a2 + 2) / 0xCu;
  unsigned int v8 = (float)((float)((float)((float)((float)(8 * v6) / (float)a5)
                                           * (float)(*result + (float)(result[2] * 0.5)))
                                   + -4.0)
                           * 0.125);
  if (v8 >= v6 - 1) {
    unsigned int v8 = v6 - 1;
  }
  float v9 = (float)v8;
  unsigned int v10 = (float)((float)((float)((float)((float)(8 * v7) / (float)a4)
                                            * (float)(result[1] + (float)(result[3] * 0.5)))
                                    + -4.0)
                            * 0.125);
  if (v10 >= v7 - 1) {
    unsigned int v10 = v7 - 1;
  }
  float v11 = (float)v10;
  uint64_t v12 = *a2;
  uint64_t v13 = v9 + (v11 + v7 * a3) * v6;
  if (*((_DWORD *)a2 + 5) != 7)
  {
    *a6 = *(_DWORD *)(v12 + 4 * v13);
    return result;
  }
  unsigned int v14 = *(__int16 *)(v12 + 2 * v13);
  unsigned int v15 = v14 & 0x80000000;
  int v16 = (v14 >> 10) & 0x1F;
  int v17 = (unsigned __int16)v14 << 13;
  unsigned int v18 = v17 & 0x7FE000;
  if (v16 == 31)
  {
    if (v18) {
      int v21 = 2143289344;
    }
    else {
      int v21 = 2139095040;
    }
    int v20 = v15 | v17 | v21;
    goto LABEL_16;
  }
  if (v16)
  {
LABEL_10:
    int v20 = ((v18 | (v16 << 23)) + 939524096) | v15;
LABEL_16:
    *a6 = v20;
    return result;
  }
  if (v18)
  {
    unsigned int v19 = __clz(v18);
    int v16 = 9 - v19;
    unsigned int v18 = (v17 << (v19 - 8)) & 0x7FE000;
    goto LABEL_10;
  }
  float v22 = -0.0;
  if (!v15) {
    float v22 = 0.0;
  }
  *(float *)a6 = v22;
  return result;
}

uint64_t largeFaceSuppressSameSizeUBody(uint64_t result, int a2, int a3, int a4, uint64_t a5, int *a6)
{
  if (a2)
  {
    uint64_t v6 = 0;
    unsigned int v7 = 0;
    uint64_t v8 = result;
    do
    {
      if (!*(_DWORD *)(v8 + 8)
        && *(unsigned char *)(v8 + 100)
        && (float)((float)(*(float *)(v8 + 20) * *(float *)(v8 + 24)) / (float)((float)(a4 * a3) + 0.0001)) > 0.1
        && *(float *)(v8 + 524) > 0.7)
      {
        *(_DWORD *)(a5 + 4 * v7++) = v6;
      }
      ++v6;
      v8 += 1724;
    }
    while (a2 != v6);
    if (v7)
    {
      uint64_t v9 = 0;
      unsigned int v10 = 0;
      do
      {
        uint64_t v11 = 0;
        uint64_t v12 = (float32x2_t *)(result + 12);
        do
        {
          if (v12[-1].i32[1] == 1)
          {
            float32x2_t v13 = vadd_f32(*v12, v12[1]);
            uint64_t v14 = result + 1724 * *(unsigned int *)(a5 + 4 * v9);
            float32x2_t v15 = *(float32x2_t *)(v14 + 12);
            float32x2_t v16 = vadd_f32(v15, *(float32x2_t *)(v14 + 20));
            float32x2_t v17 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v16, v13), (int8x8_t)v13, (int8x8_t)v16), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v15, *v12), (int8x8_t)v15, (int8x8_t)*v12)), 0);
            float32x2_t v18 = vmul_lane_f32(v17, v17, 1);
            float32x2_t v19 = vmul_f32(vmaxnm_f32(vsub_f32((float32x2_t)vzip1_s32((int32x2_t)v13, (int32x2_t)v16), (float32x2_t)vzip1_s32((int32x2_t)*v12, (int32x2_t)v15)), 0), vmaxnm_f32(vsub_f32((float32x2_t)vzip2_s32((int32x2_t)v13, (int32x2_t)v16), (float32x2_t)vzip2_s32((int32x2_t)*v12, (int32x2_t)v15)), 0));
            float32x2_t v20 = vsub_f32(vadd_f32(v19, (float32x2_t)vdup_lane_s32((int32x2_t)v19, 1)), v18);
            LODWORD(v21) = vdiv_f32(v18, v20).u32[0];
            if (v18.f32[0] >= 0.00000011921 && v20.f32[0] >= 0.00000011921 && v21 > 0.7) {
              a6[v10++] = v11;
            }
          }
          ++v11;
          uint64_t v12 = (float32x2_t *)((char *)v12 + 1724);
        }
        while (a2 != v11);
        ++v9;
      }
      while (v9 != v7);
      if (v10)
      {
        for (uint64_t i = 0; i != a2; ++i)
        {
          uint64_t v25 = v10;
          float v26 = a6;
          while (1)
          {
            int v27 = *v26++;
            if (i == v27) {
              break;
            }
            if (!--v25) {
              goto LABEL_26;
            }
          }
          *(_DWORD *)(result + 1724 * i + 52_Block_object_dispose(&STACK[0x488], 8) = 2;
LABEL_26:
          ;
        }
      }
    }
  }
  return result;
}

float *acTrkFilterMultiUbodyinSameFbody(float *result, unsigned int *a2, uint64_t a3, unsigned int a4, float *a5, _DWORD *a6, _DWORD *a7, uint64_t a8)
{
  *a7 = 0;
  if (a4)
  {
    uint64_t v8 = result;
    uint64_t v9 = 0;
    uint64_t v10 = a4;
    unsigned int v11 = *a2;
    uint64_t v12 = (float32x2_t *)(a3 + 20);
    long long v99 = a7;
    uint64_t v100 = a8 + 16;
    unsigned int v13 = *a2;
    long long v97 = a5;
    long long v98 = a6;
    uint64_t v96 = a3;
    do
    {
      if (v13)
      {
        unint64_t v14 = 0;
        char v15 = 0;
        uint64_t v16 = a3 + 1724 * v9;
        int v17 = -1;
        do
        {
          float32x2_t v19 = &v8[431 * v14];
          if (*((_DWORD *)v19 + 2) == 1)
          {
            uint64_t v20 = 0;
            float32x2_t v21 = *(float32x2_t *)(v19 + 3);
            float32x2_t v22 = vadd_f32(v21, *(float32x2_t *)(v19 + 5));
            float32x2_t v23 = vsub_f32(v22, v21);
            int32x2_t v24 = vcgtz_f32(v23);
            float v25 = v23.f32[1];
            if ((v24.i8[4] & 1) == 0) {
              float v25 = 0.0;
            }
            if ((v24.i8[0] & 1) == 0) {
              v23.f32[0] = 0.0;
            }
            float v26 = v23.f32[0] * v25;
            int v27 = -1;
            float v28 = -1.0;
            BOOL v29 = v12;
            do
            {
              float32x2_t v30 = v29[-1];
              float32x2_t v31 = vadd_f32(v30, *v29);
              float32x2_t v32 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v31, v22), (int8x8_t)v22, (int8x8_t)v31), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v30, v21), (int8x8_t)v30, (int8x8_t)v21)), 0);
              float v33 = vmul_lane_f32(v32, v32, 1).f32[0];
              float v34 = 0.0;
              if (v33 >= 0.00000011921)
              {
                float32x2_t v35 = vsub_f32(v31, v30);
                v35.f32[0] = (float)(v26 + (float)(fmaxf(v35.f32[0], 0.0) * fmaxf(v35.f32[1], 0.0))) - v33;
                float v36 = v33 / v35.f32[0];
                if (v35.f32[0] >= 0.00000011921) {
                  float v34 = v36;
                }
                else {
                  float v34 = 0.0;
                }
              }
              if (v34 > v28)
              {
                int v27 = v20;
                float v28 = v34;
              }
              ++v20;
              BOOL v29 = (float32x2_t *)((char *)v29 + 1724);
            }
            while (v10 != v20);
            if (v9 == v27)
            {
              float32x2_t v37 = *(float32x2_t *)(v16 + 12);
              float32x2_t v38 = vadd_f32(v37, *(float32x2_t *)(v16 + 20));
              float32x2_t v39 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v38, v22), (int8x8_t)v22, (int8x8_t)v38), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v37, v21), (int8x8_t)v37, (int8x8_t)v21)), 0);
              float v40 = vmul_lane_f32(v39, v39, 1).f32[0];
              BOOL v41 = v40 < 0.00000011921 || v26 < 0.00000011921;
              float v42 = v40 / v26;
              if (v41) {
                float v42 = 0.0;
              }
              if (v42 > *a5 && LODWORD(v8[431 * v14 + 130]) >= 2)
              {
                float v43 = v8[431 * v14 + 208];
                if (v43 < 0.5) {
                  int v17 = v14;
                }
                v15 |= v43 < 0.5;
                if (*((_DWORD *)v19 + 7) >= 2u)
                {
                  uint64_t v44 = *a7;
                  uint64_t v45 = v44;
                  uint64_t v46 = a6;
                  if (v44)
                  {
                    while (1)
                    {
                      int v47 = *v46++;
                      if (v9 == v47) {
                        break;
                      }
                      if (!--v45)
                      {
                        uint64_t v18 = *a7;
                        goto LABEL_8;
                      }
                    }
                  }
                  else
                  {
                    uint64_t v18 = 0;
LABEL_8:
                    *a7 = v44 + 1;
                    a6[v18] = v9;
                    unsigned int v11 = *a2;
                  }
                }
              }
            }
          }
          ++v14;
        }
        while (v14 < v11);
        if (v15)
        {
          unsigned int v48 = v17;
          if (v11)
          {
            unint64_t v49 = 0;
            unsigned int v50 = 0;
            char v51 = 0;
            int v52 = &v8[431 * v48 + 211];
            do
            {
              uint64_t v53 = &v8[431 * v49];
              if (*((_DWORD *)v53 + 2) == 1)
              {
                float32x2_t v54 = *(float32x2_t *)(v53 + 3);
                float32x2_t v55 = vadd_f32(v54, *(float32x2_t *)(v53 + 5));
                float32x2_t v56 = *(float32x2_t *)(v16 + 12);
                float32x2_t v57 = vadd_f32(v56, *(float32x2_t *)(v16 + 20));
                if (vcgt_f32(v56, v54).u8[0]) {
                  __int32 v58 = *(void *)(v16 + 12);
                }
                else {
                  __int32 v58 = *(void *)(v53 + 3);
                }
                v56.i32[0] = HIDWORD(*(void *)(v16 + 12));
                if (COERCE_FLOAT(HIDWORD(*(void *)(v53 + 3))) >= v56.f32[1]) {
                  v56.i32[0] = HIDWORD(*(void *)(v53 + 3));
                }
                if (vcgt_f32(v57, v55).u8[0]) {
                  float v59 = v55.f32[0];
                }
                else {
                  float v59 = v57.f32[0];
                }
                v57.i32[0] = v57.i32[1];
                if (v55.f32[1] < v57.f32[1]) {
                  v57.f32[0] = v55.f32[1];
                }
                float32x2_t v60 = (float32x2_t)vdup_lane_s32((int32x2_t)v55, 0);
                v60.f32[0] = v59;
                float32x2_t v61 = (float32x2_t)vdup_lane_s32((int32x2_t)v54, 0);
                v61.i32[0] = v58;
                float32x2_t v62 = vmul_f32(vmaxnm_f32(vsub_f32(v60, v61), 0), vmaxnm_f32(vsub_f32((float32x2_t)__PAIR64__(v55.u32[1], v57.u32[0]), (float32x2_t)__PAIR64__(v54.u32[1], v56.u32[0])), 0));
                BOOL v63 = v62.f32[0] < 0.00000011921 || v62.f32[1] < 0.00000011921;
                float v64 = v62.f32[0] / v62.f32[1];
                if (v63) {
                  float v64 = 0.0;
                }
                if (v64 > a5[1] && LODWORD(v8[431 * v49 + 130]) == 1 && *(_DWORD *)v52 <= 4u)
                {
                  uint64_t v65 = 0;
                  float v66 = -1.0;
                  int v67 = -1;
                  unsigned int v68 = v12;
                  do
                  {
                    float32x2_t v69 = v68[-1];
                    float32x2_t v70 = vadd_f32(v69, *v68);
                    float32x2_t v71 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v70, v55), (int8x8_t)v55, (int8x8_t)v70), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v69, v54), (int8x8_t)v69, (int8x8_t)v54)), 0);
                    float v72 = vmul_lane_f32(v71, v71, 1).f32[0];
                    float v73 = 0.0;
                    if (v72 >= 0.00000011921)
                    {
                      float32x2_t v74 = vsub_f32(v70, v69);
                      v74.f32[0] = (float)(v62.f32[1] + (float)(fmaxf(v74.f32[0], 0.0) * fmaxf(v74.f32[1], 0.0))) - v72;
                      float v75 = v72 / v74.f32[0];
                      if (v74.f32[0] >= 0.00000011921) {
                        float v73 = v75;
                      }
                      else {
                        float v73 = 0.0;
                      }
                    }
                    if (v73 > v66)
                    {
                      int v67 = v65;
                      float v66 = v73;
                    }
                    ++v65;
                    unsigned int v68 = (float32x2_t *)((char *)v68 + 1724);
                  }
                  while (v10 != v65);
                  if (v9 == v67)
                  {
                    *(_DWORD *)(a8 + 4 * v50++) = v49;
                    unsigned int v11 = *a2;
                    char v51 = 1;
                  }
                }
              }
              ++v49;
            }
            while (v49 < v11);
            if (v51)
            {
              ++*(_DWORD *)v52;
              goto LABEL_75;
            }
          }
          else
          {
            unsigned int v50 = 0;
          }
          v8[431 * v48 + 211] = 0.0;
LABEL_75:
          unint64_t v76 = *a2;
          if (v76)
          {
            if (v50)
            {
              unint64_t v77 = 0;
              unsigned int v11 = 0;
              while (v50 > 7)
              {
                int64x2_t v80 = vdupq_n_s64(v77);
                int32x4_t v81 = 0uLL;
                uint64_t v82 = v100;
                uint64_t v83 = v50 & 0xFFFFFFF8;
                int32x4_t v84 = 0uLL;
                do
                {
                  long long v85 = *(_OWORD *)(v82 - 16);
                  v86.i64[0] = v85;
                  v86.i64[1] = DWORD1(v85);
                  int64x2_t v87 = v86;
                  v86.i64[0] = DWORD2(v85);
                  v86.i64[1] = HIDWORD(v85);
                  int64x2_t v88 = v86;
                  v86.i64[0] = *(_OWORD *)v82;
                  v86.i64[1] = HIDWORD(*(void *)v82);
                  int64x2_t v89 = v86;
                  v86.i64[0] = *(void *)(v82 + 8);
                  v86.i64[1] = HIDWORD(*(_OWORD *)v82);
                  int32x4_t v81 = vsubq_s32(v81, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v80, v87), (int32x4_t)vceqq_s64(v80, v88))));
                  int32x4_t v84 = vsubq_s32(v84, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v80, v89), (int32x4_t)vceqq_s64(v80, v86))));
                  v82 += 32;
                  v83 -= 8;
                }
                while (v83);
                int v79 = vaddvq_s32(vaddq_s32(v84, v81));
                uint64_t v78 = v50 & 0xFFFFFFF8;
                if (v78 != v50) {
                  goto LABEL_84;
                }
LABEL_88:
                if (v79 == v50)
                {
                  unsigned int v93 = v11 + 1;
                  uint64_t result = (float *)memcpy(&v8[431 * v11], &v8[431 * v77], 0x6BCuLL);
                  unint64_t v76 = *a2;
                  unsigned int v11 = v93;
                }
                if (++v77 >= v76) {
                  goto LABEL_97;
                }
              }
              uint64_t v78 = 0;
              int v79 = 0;
LABEL_84:
              uint64_t v90 = v50 - v78;
              unint64_t v91 = (int *)(a8 + 4 * v78);
              do
              {
                int v92 = *v91++;
                if (v77 != v92) {
                  ++v79;
                }
                --v90;
              }
              while (v90);
              goto LABEL_88;
            }
            if (v76 >= 2)
            {
              uint64_t v94 = v76 & 0xFFFFFFFE;
              if (v94 != v76) {
                goto LABEL_94;
              }
            }
            else
            {
              uint64_t v94 = 0;
LABEL_94:
              unint64_t v95 = v94 | 1;
              if (v95 > v76) {
                LODWORD(v76) = v95;
              }
            }
            unsigned int v11 = v76;
          }
          else
          {
            unsigned int v11 = 0;
          }
LABEL_97:
          *a2 = v11;
          unsigned int v13 = v11;
          a6 = v98;
          a7 = v99;
          a3 = v96;
          a5 = v97;
          goto LABEL_4;
        }
        unsigned int v13 = v11;
      }
LABEL_4:
      ++v9;
    }
    while (v9 != v10);
  }
  return result;
}

uint64_t acTrkFilterFPHandinSameFbody(uint64_t a1, unsigned int a2, int a3, unsigned int a4, char *__src, float a6, unsigned int a7)
{
  uint64_t v8 = a7;
  if (a2)
  {
    unsigned int v9 = 0;
    unsigned int v10 = 0;
    unsigned int v11 = (int *)(a1 + 8);
    uint64_t v12 = a2;
    do
    {
      int v13 = *v11;
      v11 += 431;
      if (v13 == 1) {
        unsigned int v14 = v10 + 1;
      }
      else {
        unsigned int v14 = v10;
      }
      if (v13) {
        unsigned int v10 = v14;
      }
      else {
        ++v9;
      }
      --v12;
    }
    while (v12);
    if (a4 > 1) {
      return a7;
    }
  }
  else
  {
    unsigned int v10 = 0;
    unsigned int v9 = 0;
    if (a4 > 1) {
      return a7;
    }
  }
  if (v10 > 1 || v9 >= 2 || !a7 || v9 + v10 == -a4) {
    return a7;
  }
  uint64_t v15 = 0;
  float v16 = -1.0;
  LODWORD(v17) = -1;
  uint64_t v18 = __src;
  LODWORD(v19) = -1;
  float v20 = -1.0;
  do
  {
    int v21 = *((_DWORD *)v18 + 2);
    if (v21 == 11)
    {
      if (*((float *)v18 + 131) > v16)
      {
        float v16 = *((float *)v18 + 131);
        LODWORD(v17) = v15;
      }
    }
    else if (v21 == 10 && *((float *)v18 + 131) > v20)
    {
      float v20 = *((float *)v18 + 131);
      LODWORD(v19) = v15;
    }
    ++v15;
    v18 += 1724;
  }
  while (a7 != v15);
  if ((int)(v19 & v17) < 0 != __OFSUB__(a7, v15)) {
    return a7;
  }
  float v22 = v16 - a6;
  if ((v19 & 0x80000000) == 0)
  {
    float v23 = v20 - a6;
    uint64_t v24 = a7;
    float v25 = __src;
    uint64_t v19 = v19;
    uint64_t v26 = v17;
    while (1)
    {
      if (!v19 || !v26) {
        goto LABEL_29;
      }
      int v27 = *((_DWORD *)v25 + 2);
      if (v27 == 10)
      {
        if (*((float *)v25 + 131) > v23) {
          goto LABEL_29;
        }
      }
      else if ((v17 & 0x80000000) == 0 && v27 == 11 && *((float *)v25 + 131) > v22)
      {
        goto LABEL_29;
      }
      *((_DWORD *)v25 + 132) = 2;
LABEL_29:
      v25 += 1724;
      --v26;
      --v19;
      if (!--v24) {
        goto LABEL_63;
      }
    }
  }
  if ((v17 & 0x80000000) != 0)
  {
    if (a7 > 3)
    {
      uint64_t v32 = a7 & 0xFFFFFFFC;
      int64x2_t v33 = vdupq_n_s64(v19);
      int64x2_t v34 = (int64x2_t)xmmword_246D9F140;
      int64x2_t v35 = vdupq_n_s64(v17);
      int64x2_t v36 = vdupq_n_s64(2uLL);
      int64x2_t v37 = vdupq_n_s64(4uLL);
      float32x2_t v38 = __src;
      uint64_t v39 = v32;
      do
      {
        int32x2_t v40 = vmovn_s64((int64x2_t)vbicq_s8(vmvnq_s8((int8x16_t)vceqq_s64(v34, v33)), (int8x16_t)vceqq_s64(v34, v35)));
        if (v40.i8[0]) {
          v38[132] = 2;
        }
        if (v40.i8[4]) {
          v38[563] = 2;
        }
        int64x2_t v41 = vaddq_s64(v34, v36);
        int32x2_t v42 = vmovn_s64((int64x2_t)vbicq_s8(vmvnq_s8((int8x16_t)vceqq_s64(v41, v33)), (int8x16_t)vceqq_s64(v41, v35)));
        if (v42.i8[0]) {
          v38[994] = 2;
        }
        if (v42.i8[4]) {
          v38[1425] = 2;
        }
        int64x2_t v34 = vaddq_s64(v34, v37);
        v38 += 1724;
        v39 -= 4;
      }
      while (v39);
      if (v32 == a7) {
        goto LABEL_63;
      }
    }
    else
    {
      uint64_t v32 = 0;
    }
    uint64_t v45 = &__src[1724 * v32 + 528];
    uint64_t v46 = a7 - v32;
    uint64_t v47 = v17 - v32;
    uint64_t v48 = v19 - v32;
    do
    {
      if (v48 && v47) {
        *(_DWORD *)uint64_t v45 = 2;
      }
      v45 += 1724;
      --v47;
      --v48;
      --v46;
    }
    while (v46);
  }
  else
  {
    uint64_t v30 = a7;
    float32x2_t v31 = __src;
    uint64_t v19 = v19;
    uint64_t v17 = v17;
    do
    {
      if (v19 && v17 && (*((_DWORD *)v31 + 2) != 11 || *((float *)v31 + 131) <= v22)) {
        *((_DWORD *)v31 + 132) = 2;
      }
      v31 += 1724;
      --v17;
      --v19;
      --v30;
    }
    while (v30);
  }
LABEL_63:
  uint64_t v43 = 0;
  uint64_t v28 = 0;
  uint64_t v44 = (int *)__src;
  do
  {
    if (v44[132] <= 1)
    {
      if (v43 != v28) {
        memcpy(&__src[1724 * v28], v44, 0x6BCuLL);
      }
      uint64_t v28 = (v28 + 1);
    }
    v44 += 431;
    ++v43;
  }
  while (v8 != v43);
  return v28;
}

float l2Norm(const float *a1, unsigned int a2)
{
  if (!a2) {
    return sqrtf(0.0);
  }
  if (a2 == 1)
  {
    uint64_t v2 = 0;
    float v3 = 0.0;
  }
  else
  {
    uint64_t v2 = a2 & 0xFFFFFFFE;
    uint64_t v5 = (float *)(a1 + 1);
    float v3 = 0.0;
    uint64_t v6 = v2;
    do
    {
      float v3 = (float)(v3 + (float)(*(v5 - 1) * *(v5 - 1))) + (float)(*v5 * *v5);
      v5 += 2;
      v6 -= 2;
    }
    while (v6);
    if (v2 == a2) {
      return sqrtf(v3);
    }
  }
  uint64_t v7 = a2 - v2;
  uint64_t v8 = (float *)&a1[v2];
  do
  {
    float v9 = *v8++;
    float v3 = v3 + (float)(v9 * v9);
    --v7;
  }
  while (v7);
  return sqrtf(v3);
}

float32x4_t *updateEmbeddedFeat(float32x4_t *result, float32x4_t *a2, unsigned int a3)
{
  if (!a3) {
    return result;
  }
  if (a3 == 1)
  {
    uint64_t v3 = 0;
    int32x2_t v4 = 0;
LABEL_7:
    uint64_t v7 = a3 - v3;
    uint64_t v8 = &result->f32[v3];
    do
    {
      float v9 = *v8++;
      *(float *)v4.i32 = *(float *)v4.i32 + (float)(v9 * v9);
      --v7;
    }
    while (v7);
    goto LABEL_9;
  }
  uint64_t v3 = a3 & 0xFFFFFFFE;
  uint64_t v5 = &result->f32[1];
  int32x2_t v4 = 0;
  uint64_t v6 = v3;
  do
  {
    *(float *)v4.i32 = (float)(*(float *)v4.i32 + (float)(*(v5 - 1) * *(v5 - 1))) + (float)(*v5 * *v5);
    v5 += 2;
    v6 -= 2;
  }
  while (v6);
  if (v3 != a3) {
    goto LABEL_7;
  }
LABEL_9:
  float v10 = sqrtf(*(float *)v4.i32);
  if (a3 <= 1)
  {
    uint64_t v11 = 0;
    float v12 = 0.0;
LABEL_14:
    uint64_t v15 = a3 - v11;
    float v16 = &a2->f32[v11];
    do
    {
      float v17 = *v16++;
      float v12 = v12 + v17;
      --v15;
    }
    while (v15);
    goto LABEL_16;
  }
  uint64_t v11 = a3 & 0xFFFFFFFE;
  int v13 = &a2->f32[1];
  float v12 = 0.0;
  uint64_t v14 = v11;
  do
  {
    float v12 = (float)(v12 + *(v13 - 1)) + *v13;
    v13 += 2;
    v14 -= 2;
  }
  while (v14);
  if (v11 != a3) {
    goto LABEL_14;
  }
LABEL_16:
  *(float *)v4.i32 = v10 + 0.0000001;
  if (fabsf(v12) >= 0.0001)
  {
    if (a3 > 7 && ((float32x4_t *)&result->f32[a3] <= a2 || (float32x4_t *)&a2->f32[a3] <= result))
    {
      uint64_t v29 = a3 & 0xFFFFFFF8;
      float32x4_t v49 = (float32x4_t)vdupq_lane_s32(v4, 0);
      unsigned int v50 = result + 1;
      char v51 = a2 + 1;
      float32x4_t v52 = (float32x4_t)vdupq_n_s32(0x3E4CCCCCu);
      float32x4_t v53 = (float32x4_t)vdupq_n_s32(0x3F4CCCCDu);
      uint64_t v54 = v29;
      do
      {
        float32x4_t v55 = vmlaq_f32(vdivq_f32(vmulq_f32(*v50, v52), v49), v53, *v51);
        v51[-1] = vmlaq_f32(vdivq_f32(vmulq_f32(v50[-1], v52), v49), v53, v51[-1]);
        *char v51 = v55;
        v50 += 2;
        v51 += 2;
        v54 -= 8;
      }
      while (v54);
      if (v29 == a3) {
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v29 = 0;
    }
    uint64_t v30 = a3 - v29;
    uint64_t v31 = v29;
    uint64_t v32 = &result->f32[v29];
    int64x2_t v33 = &a2->f32[v31];
    do
    {
      float v34 = *v32++;
      *int64x2_t v33 = (float)((float)(v34 * 0.2) / *(float *)v4.i32) + (float)(*v33 * 0.8);
      ++v33;
      --v30;
    }
    while (v30);
    goto LABEL_31;
  }
  uint64_t v18 = 0;
  if (a3 < 8) {
    goto LABEL_22;
  }
  if ((unint64_t)((char *)a2 - (char *)result) < 0x20) {
    goto LABEL_22;
  }
  uint64_t v18 = a3 & 0xFFFFFFF8;
  float32x4_t v19 = (float32x4_t)vdupq_lane_s32(v4, 0);
  f32 = a2[1].f32;
  int v21 = result + 1;
  uint64_t v22 = v18;
  do
  {
    float32x4_t v23 = vdivq_f32(*v21, v19);
    *((float32x4_t *)f32 - 1) = vdivq_f32(v21[-1], v19);
    *(float32x4_t *)f32 = v23;
    f32 += 8;
    v21 += 2;
    v22 -= 8;
  }
  while (v22);
  if (v18 != a3)
  {
LABEL_22:
    uint64_t v24 = a3 - v18;
    uint64_t v25 = v18;
    uint64_t v26 = &a2->f32[v18];
    int v27 = &result->f32[v25];
    do
    {
      float v28 = *v27++;
      *v26++ = v28 / *(float *)v4.i32;
      --v24;
    }
    while (v24);
  }
LABEL_31:
  if (a3 >= 2)
  {
    uint64_t v35 = a3 & 0xFFFFFFFE;
    int64x2_t v37 = &a2->f32[1];
    int32x2_t v36 = 0;
    uint64_t v38 = v35;
    do
    {
      *(float *)v36.i32 = (float)(*(float *)v36.i32 + (float)(*(v37 - 1) * *(v37 - 1))) + (float)(*v37 * *v37);
      v37 += 2;
      v38 -= 2;
    }
    while (v38);
    if (v35 == a3) {
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v35 = 0;
    int32x2_t v36 = 0;
  }
  uint64_t v39 = a3 - v35;
  int32x2_t v40 = &a2->f32[v35];
  do
  {
    float v41 = *v40++;
    *(float *)v36.i32 = *(float *)v36.i32 + (float)(v41 * v41);
    --v39;
  }
  while (v39);
LABEL_38:
  *(float *)v36.i32 = sqrtf(*(float *)v36.i32) + 0.00001;
  if (a3 <= 7)
  {
    uint64_t v42 = 0;
LABEL_43:
    uint64_t v47 = a3 - v42;
    uint64_t v48 = &a2->f32[v42];
    do
    {
      *uint64_t v48 = *v48 / *(float *)v36.i32;
      ++v48;
      --v47;
    }
    while (v47);
    return result;
  }
  uint64_t v42 = a3 & 0xFFFFFFF8;
  float32x4_t v43 = (float32x4_t)vdupq_lane_s32(v36, 0);
  uint64_t v44 = a2 + 1;
  uint64_t v45 = v42;
  do
  {
    float32x4_t v46 = vdivq_f32(*v44, v43);
    v44[-1] = vdivq_f32(v44[-1], v43);
    *uint64_t v44 = v46;
    v44 += 2;
    v45 -= 8;
  }
  while (v45);
  if (v42 != a3) {
    goto LABEL_43;
  }
  return result;
}

void acLGroupIDDominanPersonPatch(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6)
{
  if (a6 == 2)
  {
    int v6 = *(_DWORD *)(a5 + 8);
    int v7 = *(_DWORD *)(a5 + 1732);
    BOOL v8 = v6 == 10 && v7 == 11;
    int v9 = v8;
    BOOL v10 = v6 == 11 && v7 == 10;
    int v11 = v10 ? 1 : v9;
    float v12 = *(float *)(a5 + 832) / (float)(*(float *)(a5 + 2556) + 0.00001);
    BOOL v13 = v12 >= 1.7 || v12 <= 0.58;
    if (a4)
    {
      uint64_t v14 = 0;
      unsigned int v15 = 0;
      float32x2_t v16 = *(float32x2_t *)(a5 + 12);
      int32x2_t v17 = (int32x2_t)vadd_f32(v16, *(float32x2_t *)(a5 + 20));
      float32x2_t v18 = *(float32x2_t *)(a5 + 1736);
      int32x2_t v19 = (int32x2_t)vadd_f32(v18, *(float32x2_t *)(a5 + 1744));
      float32x2_t v20 = (float32x2_t)vzip1_s32(v17, v19);
      float32x2_t v21 = (float32x2_t)vzip1_s32((int32x2_t)v16, (int32x2_t)v18);
      float32x2_t v22 = (float32x2_t)vzip2_s32(v17, v19);
      float32x2_t v23 = (float32x2_t)vzip2_s32((int32x2_t)v16, (int32x2_t)v18);
      float32x2_t v24 = vmul_f32(vmaxnm_f32(vsub_f32(v20, v21), 0), vmaxnm_f32(vsub_f32(v22, v23), 0));
      uint64_t v25 = (float32x2_t *)(a3 + 20);
      float v26 = -1.0;
      int8x8_t v27 = (int8x8_t)vcgt_f32((float32x2_t)0x3400000034000000, v24);
      do
      {
        float32x2_t v28 = v25[-1];
        int32x2_t v29 = (int32x2_t)vadd_f32(v28, *v25);
        float32x2_t v30 = (float32x2_t)vdup_lane_s32((int32x2_t)v28, 0);
        float32x2_t v31 = (float32x2_t)vdup_lane_s32((int32x2_t)v28, 1);
        float32x2_t v32 = (float32x2_t)vdup_lane_s32(v29, 0);
        float32x2_t v33 = (float32x2_t)vdup_lane_s32(v29, 1);
        float32x2_t v34 = vmul_f32(vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v32, v20), (int8x8_t)v20, (int8x8_t)v32), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v30, v21), (int8x8_t)v30, (int8x8_t)v21)), 0), vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v33, v22), (int8x8_t)v22, (int8x8_t)v33), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v31, v23), (int8x8_t)v31, (int8x8_t)v23)), 0));
        float v35 = vaddv_f32((float32x2_t)vbic_s8((int8x8_t)vdiv_f32(v34, v24), vorr_s8(v27, (int8x8_t)vcgt_f32((float32x2_t)0x3400000034000000, v34))));
        if (v35 > v26)
        {
          unsigned int v15 = v14;
          float v26 = v35;
        }
        ++v14;
        uint64_t v25 = (float32x2_t *)((char *)v25 + 1724);
      }
      while (a4 != v14);
      if (((v11 ^ 1 | v13) & 1) == 0)
      {
        uint64_t v36 = a3 + 1724 * v15;
        *(_DWORD *)(a5 + 4) = *(_DWORD *)(v36 + 4);
        *(_DWORD *)(a5 + 172_Block_object_dispose(&STACK[0x488], 8) = *(_DWORD *)(v36 + 4);
      }
    }
  }
}

uint64_t acTrkHandAssocTrkDet(unsigned int a1, unsigned int a2, uint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9, _DWORD *a10, _DWORD *a11, _DWORD *a12, char *a13, unsigned int *a14, float *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  unint64_t v20 = a7;
  unsigned int v22 = a5;
  uint64_t v24 = a3;
  float v26 = a13;
  if (a5 <= a7) {
    int v27 = a7;
  }
  else {
    int v27 = a5;
  }
  uint64_t v453 = 0;
  long long v451 = 0u;
  long long v452 = 0u;
  long long v449 = 0u;
  long long v450 = 0u;
  long long v447 = 0u;
  long long v448 = 0u;
  *(_OWORD *)v445 = 0u;
  long long v446 = 0u;
  long long v443 = 0u;
  long long v444 = 0u;
  *(_OWORD *)long long v441 = 0u;
  *(_OWORD *)long long __b = 0u;
  long long v439 = 0u;
  *(_OWORD *)long long v440 = 0u;
  long long v437 = 0u;
  long long v438 = 0u;
  long long v435 = 0u;
  long long v436 = 0u;
  long long v434 = 0u;
  unsigned int TempBuffers = acTrkObjectAssocTrkDetGetTempBuffers(v27, (uint64_t)a19, a3, (uint64_t)&v434);
  bzero(a19, TempBuffers);
  uint64_t v29 = v434;
  uint64_t v30 = *((void *)&v437 + 1);
  long long v31 = v438;
  float32x2_t v32 = __b[0];
  long long v426 = (char *)v434;
  *(void *)v417 = v20;
  unsigned int v423 = a4;
  unsigned int v408 = a2;
  unsigned int v405 = v22;
  if (!v20)
  {
    unsigned int v433 = 0;
    unsigned int v38 = *a14;
    if (!(a4 | *a14)) {
      goto LABEL_183;
    }
    unsigned int v39 = a4;
    BOOL v403 = a4 == 0;
    float v407 = __b[0];
    BOOL v404 = (unsigned char *)v439;
    int v432 = 0;
    if (!a4)
    {
      unsigned int v41 = 0;
      uint64_t v42 = a14;
      uint64_t v402 = v438;
      if (v38)
      {
LABEL_327:
        unint64_t v293 = 0;
        int32x4_t v294 = vdupq_n_s32(0xFFFFFE97);
        do
        {
          *((_OWORD *)v26 + 30) = 0uLL;
          *((_OWORD *)v26 + 31) = 0uLL;
          *((_OWORD *)v26 + 2_Block_object_dispose(&STACK[0x488], 8) = 0uLL;
          *((_OWORD *)v26 + 29) = 0uLL;
          *((_OWORD *)v26 + 26) = 0uLL;
          *((_OWORD *)v26 + 27) = 0uLL;
          *((_OWORD *)v26 + 24) = 0uLL;
          *((_OWORD *)v26 + 25) = 0uLL;
          *((_OWORD *)v26 + 22) = 0uLL;
          *((_OWORD *)v26 + 23) = 0uLL;
          *((_OWORD *)v26 + 20) = 0uLL;
          *((_OWORD *)v26 + 21) = 0uLL;
          *((_OWORD *)v26 + 1_Block_object_dispose(&STACK[0x488], 8) = 0uLL;
          *((_OWORD *)v26 + 19) = 0uLL;
          *((_OWORD *)v26 + 16) = 0uLL;
          *((_OWORD *)v26 + 17) = 0uLL;
          *((_OWORD *)v26 + 14) = 0uLL;
          *((_OWORD *)v26 + 15) = 0uLL;
          *((_OWORD *)v26 + 12) = 0uLL;
          *((_OWORD *)v26 + 13) = 0uLL;
          *((_OWORD *)v26 + 10) = 0uLL;
          *((_OWORD *)v26 + 11) = 0uLL;
          *((_OWORD *)v26 + _Block_object_dispose(&STACK[0x488], 8) = 0uLL;
          *((_OWORD *)v26 + 9) = 0uLL;
          *((_OWORD *)v26 + 6) = 0uLL;
          *((_OWORD *)v26 + 7) = 0uLL;
          *((_OWORD *)v26 + 4) = 0uLL;
          *((_OWORD *)v26 + 5) = 0uLL;
          *((_OWORD *)v26 + 2) = 0uLL;
          *((_OWORD *)v26 + 3) = 0uLL;
          *(_OWORD *)float v26 = 0uLL;
          *((_OWORD *)v26 + 1) = 0uLL;
          *((int32x4_t *)v26 + 2) = v294;
          *((_DWORD *)v26 + 12) = -361;
          *((_DWORD *)v26 + 32) = -1;
          *((_DWORD *)v26 + 9_Block_object_dispose(&STACK[0x488], 8) = -1;
          *((_DWORD *)v26 + 105) = -1;
          *((_DWORD *)v26 + 12_Block_object_dispose(&STACK[0x488], 8) = 0;
          v26[516] = 0;
          ++v293;
          v26 += 520;
        }
        while (v293 < *v42);
      }
LABEL_329:
      unsigned int v281 = 0;
      unsigned int *v42 = 0;
      goto LABEL_330;
    }
    uint64_t v40 = 0;
    unsigned int v41 = 0;
    uint64_t v42 = a14;
    while (2)
    {
      uint64_t v48 = v24 + v40;
      *(_DWORD *)(v24 + v40 + 44_Block_object_dispose(&STACK[0x488], 8) = 1;
      unsigned int v49 = *(_DWORD *)(v24 + v40 + 780);
      unsigned int v50 = v49 - 1;
      if (!v49) {
        unsigned int v50 = 0;
      }
      uint64_t v51 = v48 + 40 * v50 + 532;
      uint64_t v43 = *(unsigned int *)(v48 + 8);
      if (v43 == 9)
      {
        long long v52 = *(_OWORD *)v51;
        long long v53 = *(_OWORD *)(v51 + 16);
        *(void *)(v48 + 564) = *(void *)(v51 + 32);
        *(_OWORD *)(v48 + 532) = v52;
        *(_OWORD *)(v48 + 54_Block_object_dispose(&STACK[0x488], 8) = v53;
        *(_DWORD *)(v48 + 780) = 1;
        if (!a6)
        {
LABEL_24:
          switch((int)v43)
          {
            case 0:
              if (*(unsigned char *)(v24 + v40 + 100))
              {
                unsigned int v44 = *(_DWORD *)(a8 + 60);
                if (a4 > 2) {
                  unsigned int v44 = 2;
                }
              }
              else
              {
                unsigned int v44 = 2;
              }
              goto LABEL_13;
            case 1:
              goto LABEL_12;
            case 2:
            case 4:
              uint64_t v43 = 2;
              goto LABEL_12;
            case 3:
            case 5:
              uint64_t v43 = 3;
              goto LABEL_12;
            case 8:
              uint64_t v43 = 4;
              goto LABEL_12;
            default:
              if ((v43 & 0xFFFFFFFE) == 0xA) {
                uint64_t v43 = 6;
              }
              else {
                uint64_t v43 = 5;
              }
LABEL_12:
              unsigned int v44 = *(_DWORD *)(a8 + 4 * v43 + 60);
LABEL_13:
              unsigned int v45 = *(_DWORD *)(v24 + v40 + 512);
              BOOL v46 = v45 >= v44;
              if (v45 < v44) {
                int v47 = 1;
              }
              else {
                int v47 = 2;
              }
              if (v46) {
                ++v41;
              }
              *(_DWORD *)(v24 + v40 + 52_Block_object_dispose(&STACK[0x488], 8) = v47;
              v40 += 1724;
              if (1724 * a4 != v40) {
                continue;
              }
              uint64_t v402 = v31;
              if (!*a14) {
                goto LABEL_329;
              }
              goto LABEL_327;
          }
        }
      }
      else if (v49 < 6)
      {
        uint64_t v57 = v24 + 40 * v49 + v40 + 532;
        long long v58 = *(_OWORD *)v51;
        long long v59 = *(_OWORD *)(v51 + 16);
        *(void *)(v57 + 32) = *(void *)(v51 + 32);
        *(_OWORD *)uint64_t v57 = v58;
        *(_OWORD *)(v57 + 16) = v59;
        ++*(_DWORD *)(v48 + 780);
        if (!a6) {
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v54 = v24 + v40 + 732;
        long long v55 = *(_OWORD *)v51;
        long long v56 = *(_OWORD *)(v51 + 16);
        *(void *)(v54 + 32) = *(void *)(v51 + 32);
        *(_OWORD *)uint64_t v54 = v55;
        *(_OWORD *)(v54 + 16) = v56;
        if (!a6) {
          goto LABEL_24;
        }
      }
      break;
    }
    ++*(_DWORD *)(v24 + v40 + 512);
    goto LABEL_24;
  }
  BOOL v404 = (unsigned char *)v439;
  float32x2_t v33 = (_DWORD *)*((void *)&v434 + 1);
  unsigned int __dst = (void *)v435;
  uint64_t v400 = *((void *)&v437 + 1);
  float32x2_t v34 = __b[1];
  uint64_t v392 = (void *)v443;
  int v393 = (unsigned __int8 *)*((void *)&v435 + 1);
  long long v398 = (unsigned int *)*((void *)&v436 + 1);
  uint64_t v390 = (void *)v446;
  uint64_t v391 = (unsigned int *)*((void *)&v444 + 1);
  int32x4_t v420 = (_DWORD *)*((void *)&v446 + 1);
  long long v35 = v447;
  long long v396 = v448;
  BOOL v395 = (unsigned __int8 *)v449;
  uint64_t v418 = v20;
  float v397 = (unsigned int *)v450;
  uint64_t v401 = *((void *)&v451 + 1);
  float v407 = __b[0];
  memset(__b[0], 255, 4 * v20);
  if (!(a4 | *a14))
  {
    if (v20 > 7)
    {
      uint64_t v37 = v20;
      uint64_t v36 = v20 & 0xFFFFFFF8;
      int32x4_t v150 = (int32x4_t)xmmword_246D9F130;
      uint64_t v29 = (uint64_t)v426;
      uint64_t v151 = (int32x4_t *)(v426 + 16);
      v152.i64[0] = 0x400000004;
      v152.i64[1] = 0x400000004;
      v153.i64[0] = 0x800000008;
      v153.i64[1] = 0x800000008;
      uint64_t v154 = v36;
      a2 = v408;
      unsigned int v22 = v405;
      float32x2_t v32 = v407;
      do
      {
        v151[-1] = v150;
        *uint64_t v151 = vaddq_s32(v150, v152);
        int32x4_t v150 = vaddq_s32(v150, v153);
        v151 += 2;
        v154 -= 8;
      }
      while (v154);
      if (v36 == v20) {
        goto LABEL_183;
      }
    }
    else
    {
      uint64_t v36 = 0;
      a2 = v408;
      uint64_t v29 = (uint64_t)v426;
      unsigned int v22 = v405;
      float32x2_t v32 = v407;
      uint64_t v37 = v20;
    }
    do
    {
      *(_DWORD *)(v29 + 4 * v36) = v36;
      ++v36;
    }
    while (v37 != v36);
LABEL_183:
    unsigned int v433 = v20;
    acTrkObjectPickDet(a1, a2, v24, 0, v22, a6, v20, v29, &v433, v31, (uint64_t)v386, (uint64_t)v32, v387, *(unsigned char *)(a8 + 194), *(_DWORD *)(a8 + 196));
    uint64_t v155 = v433;
    if (v433)
    {
      unsigned int v421 = 0;
      uint64_t v156 = 0;
      int32x4_t v424 = vdupq_n_s32(0xFFFFFE97);
      uint64_t v157 = v426;
      uint64_t v158 = a14;
      do
      {
        unsigned int v162 = *(_DWORD *)(a6 + ((unint64_t)*(unsigned int *)v157 << 9) + 28);
        if (v162 > 1)
        {
          uint64_t v165 = (_DWORD *)(v24 + 1724 * v156);
          int v166 = v157;
          bzero(v165, 0x6BCuLL);
          *((int32x4_t *)v165 + 2) = v424;
          v165[12] = -361;
          v165[32] = -1;
          v165[98] = -1;
          v165[105] = -1;
          *(void *)(v165 + 193) = 0xFF7FFFFFFFFFFFFFLL;
          v165[198] = 0;
          *(void *)(v165 + 207) = 0;
          v165[209] = 0;
          memcpy(v165, (const void *)(a6 + ((unint64_t)*(unsigned int *)v166 << 9)), 0x200uLL);
          uint64_t v157 = v166;
          int v167 = (*a12)++;
          *uint64_t v165 = v167;
          ++v165[130];
          uint64_t v168 = *(unsigned int *)v166;
          v165[131] = LODWORD(a15[v168]);
          float v169 = *((float *)v165 + 5) * *((float *)v165 + 6);
          *((float *)v165 + 207) = v169;
          *((float *)v165 + 20_Block_object_dispose(&STACK[0x488], 8) = v169 / (float)((float)(a2 * a1) + 0.0001);
          uint64_t v170 = a6 + (v168 << 9);
          int v171 = *(_DWORD *)(v170 + 8);
          unsigned int v172 = (long long *)(v170 + 12);
          int v173 = *(_DWORD *)(v170 + 40);
          int v174 = *(_DWORD *)(v170 + 44);
          char v175 = *(unsigned char *)(v170 + 100);
          int v176 = *(_DWORD *)(v170 + 420);
          if (v165[2] == 9)
          {
            long long v159 = *v172;
            uint64_t v160 = v24 + 1724 * v156;
            *(_OWORD *)(v160 + 532) = v159;
            *(unsigned char *)(v160 + 54_Block_object_dispose(&STACK[0x488], 8) = v175;
            *(_DWORD *)(v160 + 564) = v176;
            *(_DWORD *)(v160 + 556) = v174;
            *(_DWORD *)(v160 + 552) = v173;
            *(_DWORD *)(v160 + 56_Block_object_dispose(&STACK[0x488], 8) = v171;
            *(_DWORD *)(v160 + 780) = 1;
            uint64_t v158 = a14;
          }
          else
          {
            uint64_t v177 = v24 + 1724 * v156;
            unsigned int v178 = *(_DWORD *)(v177 + 780);
            if (v178 < 6)
            {
              uint64_t v181 = v24 + 1724 * v156 + 40 * v178;
              *(_OWORD *)(v181 + 532) = *v172;
              *(unsigned char *)(v181 + 54_Block_object_dispose(&STACK[0x488], 8) = v175;
              *(_DWORD *)(v181 + 564) = v176;
              *(_DWORD *)(v181 + 556) = v174;
              *(_DWORD *)(v181 + 552) = v173;
              *(_DWORD *)(v181 + 56_Block_object_dispose(&STACK[0x488], 8) = v171;
              ++*(_DWORD *)(v177 + 780);
            }
            else
            {
              long long v179 = *v172;
              uint64_t v180 = v24 + 1724 * v156;
              *(_OWORD *)(v180 + 732) = v179;
              *(unsigned char *)(v180 + 74_Block_object_dispose(&STACK[0x488], 8) = v175;
              *(_DWORD *)(v180 + 764) = v176;
              *(_DWORD *)(v180 + 756) = v174;
              *(_DWORD *)(v180 + 752) = v173;
              *(_DWORD *)(v180 + 76_Block_object_dispose(&STACK[0x488], 8) = v171;
            }
            uint64_t v158 = a14;
          }
          uint64_t v161 = v24 + 1724 * v156;
          *(_OWORD *)(v161 + 1664) = *(_OWORD *)(a6 + ((unint64_t)*(unsigned int *)v157 << 9) + 12);
          *(_OWORD *)(v161 + 1680) = *(_OWORD *)(a6 + ((unint64_t)*(unsigned int *)v157 << 9) + 12);
          *(float *)(v161 + 164_Block_object_dispose(&STACK[0x488], 8) = (float)*(unsigned int *)(a6 + ((unint64_t)*(unsigned int *)v157 << 9) + 28);
          uint64_t v156 = (v156 + 1);
        }
        else if (v162)
        {
          unsigned int v163 = &a13[520 * v421];
          *((_OWORD *)v163 + 30) = 0u;
          *((_OWORD *)v163 + 31) = 0u;
          *((_OWORD *)v163 + 2_Block_object_dispose(&STACK[0x488], 8) = 0u;
          *((_OWORD *)v163 + 29) = 0u;
          *((_OWORD *)v163 + 26) = 0u;
          *((_OWORD *)v163 + 27) = 0u;
          *((_OWORD *)v163 + 24) = 0u;
          *((_OWORD *)v163 + 25) = 0u;
          *((_OWORD *)v163 + 22) = 0u;
          *((_OWORD *)v163 + 23) = 0u;
          *((_OWORD *)v163 + 20) = 0u;
          *((_OWORD *)v163 + 21) = 0u;
          *((_OWORD *)v163 + 1_Block_object_dispose(&STACK[0x488], 8) = 0u;
          *((_OWORD *)v163 + 19) = 0u;
          *((_OWORD *)v163 + 16) = 0u;
          *((_OWORD *)v163 + 17) = 0u;
          *((_OWORD *)v163 + 14) = 0u;
          *((_OWORD *)v163 + 15) = 0u;
          *((_OWORD *)v163 + 12) = 0u;
          *((_OWORD *)v163 + 13) = 0u;
          *((_OWORD *)v163 + 10) = 0u;
          *((_OWORD *)v163 + 11) = 0u;
          *((_OWORD *)v163 + _Block_object_dispose(&STACK[0x488], 8) = 0u;
          *((_OWORD *)v163 + 9) = 0u;
          *((_OWORD *)v163 + 6) = 0u;
          *((_OWORD *)v163 + 7) = 0u;
          *((_OWORD *)v163 + 4) = 0u;
          *((_OWORD *)v163 + 5) = 0u;
          *((_OWORD *)v163 + 2) = 0u;
          *((_OWORD *)v163 + 3) = 0u;
          *(_OWORD *)unsigned int v163 = 0u;
          *((_OWORD *)v163 + 1) = 0u;
          *((int32x4_t *)v163 + 2) = v424;
          *((_DWORD *)v163 + 12) = -361;
          *((_DWORD *)v163 + 32) = -1;
          *((_DWORD *)v163 + 9_Block_object_dispose(&STACK[0x488], 8) = -1;
          *((_DWORD *)v163 + 105) = -1;
          *((_DWORD *)v163 + 12_Block_object_dispose(&STACK[0x488], 8) = 0;
          v163[516] = 0;
          double v164 = v157;
          memcpy(v163, (const void *)(a6 + ((unint64_t)*(unsigned int *)v157 << 9)), 0x200uLL);
          uint64_t v157 = v164;
          ++v421;
        }
        v157 += 4;
        --v155;
      }
      while (v155);
    }
    else
    {
      uint64_t v156 = 0;
      unsigned int v421 = 0;
      uint64_t v158 = a14;
    }
    *a10 = v156;
    *a11 = 0;
    *uint64_t v158 = v421;
    return v156;
  }
  BOOL v403 = a4 == 0;
  uint64_t v402 = v31;
  unint64_t v60 = 0;
  int v61 = 0;
  int v432 = 0;
  if (a4 <= v20) {
    uint64_t v62 = v20;
  }
  else {
    uint64_t v62 = a4;
  }
  int v414 = v62 - 1;
  unsigned int v409 = v62 - 1 - v20;
  int v413 = v62 & 0xFFFFFFF8;
  unsigned int v412 = v62 - v20;
  uint64_t v411 = (v62 - v20) & 0xFFFFFFF8;
  int v406 = v411 + v20;
  *(void *)&long long v63 = 0x4000000040000000;
  *((void *)&v63 + 1) = 0x4000000040000000;
  unint64_t v64 = a4;
  unint64_t v416 = a4;
  do
  {
    if (v60 >= v64)
    {
      int v97 = 0;
      BOOL v98 = __CFADD__(v61, v414);
      if (v62 < 8) {
        goto LABEL_94;
      }
      if (v98) {
        goto LABEL_94;
      }
      uint64_t v99 = v62 & 0xFFFFFFF8;
      int v100 = v61;
      do
      {
        long long v101 = &v33[v100];
        *long long v101 = v63;
        v101[1] = v63;
        v100 += 8;
        v99 -= 8;
      }
      while (v99);
      v61 += v413;
      int v97 = v62 & 0xFFFFFFF8;
      int v80 = v61;
      if (v62 != v413)
      {
LABEL_94:
        int v102 = v62 - v97;
        int v80 = v61;
        do
        {
          v33[v80++] = 0x40000000;
          --v102;
        }
        while (v102);
      }
    }
    else
    {
      int v65 = 0;
      int v66 = 0;
      unsigned int v67 = 0;
      uint64_t v68 = v24 + 1724 * v60;
      unsigned int v69 = *(_DWORD *)(v68 + 8);
      float32x2_t v70 = *(float32x2_t *)(v68 + 12);
      float32x2_t v71 = vadd_f32(v70, *(float32x2_t *)(v68 + 20));
      int32x4_t v72 = vdupq_n_s32(v69);
      float32x2_t v73 = vsub_f32(v71, v70);
      int32x2_t v74 = vcgtz_f32(v73);
      float v75 = v73.f32[1];
      if ((v74.i8[4] & 1) == 0) {
        float v75 = 0.0;
      }
      if ((v74.i8[0] & 1) == 0) {
        v73.f32[0] = 0.0;
      }
      float v76 = v73.f32[0] * v75;
      int v77 = v61 + 1;
      uint64_t v78 = v418;
      int v79 = (float32x2_t *)(a6 + 12);
      int v80 = v61;
      do
      {
        int v81 = v80;
        int v82 = v77;
        float32x2_t v83 = vadd_f32(*v79, v79[1]);
        float32x2_t v84 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v71, v83), (int8x8_t)v83, (int8x8_t)v71), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v70, *v79), (int8x8_t)v70, (int8x8_t)*v79)), 0);
        float v85 = vmul_lane_f32(v84, v84, 1).f32[0];
        float v86 = 0.0;
        if (v85 >= 0.00000011921)
        {
          float32x2_t v87 = vsub_f32(v83, *v79);
          float v88 = (float)((float)(fmaxf(v87.f32[0], 0.0) * fmaxf(v87.f32[1], 0.0)) + v76) - v85;
          if (v88 >= 0.00000011921) {
            float v86 = v85 / v88;
          }
          else {
            float v86 = 0.0;
          }
        }
        unsigned int v89 = v79[-1].u32[1];
        if (v69 == v89
          || (v69 == 10 ? (BOOL v92 = v89 == 11) : (BOOL v92 = 0),
              !v92 ? (char v93 = 0) : (char v93 = 1),
              (v94 = (uint16x4_t)vmovn_s32((int32x4_t)vandq_s8((int8x16_t)vceqq_s32(v72, (int32x4_t)xmmword_246D9F110), (int8x16_t)vceqq_s32(vdupq_n_s32(v89), (int32x4_t)xmmword_246D9F120))), v69 == 11)? (v95 = v89 == 10): (v95 = 0), !v95 ? (char v96 = 0) : (char v96 = 1), (vmaxv_u16(v94) & 1) != 0 || (v93 & 1) != 0 || (v96 & 1) != 0))
        {
          *(float *)&v33[v81] = 1.0 - v86;
          if (v86 > 0.2 && (float)(1.0 - v86) < 1.0)
          {
            ++v67;
            if (v89 == 11) {
              int v91 = 1;
            }
            else {
              int v91 = v65;
            }
            if (v89 == 10) {
              int v66 = 1;
            }
            else {
              int v65 = v91;
            }
          }
        }
        else
        {
          v33[v81] = 1065353216;
        }
        int v80 = v81 + 1;
        v79 += 64;
        int v77 = v82 + 1;
        --v78;
      }
      while (v78);
      unint64_t v20 = *(void *)v417;
      if (((v67 > 1) & v66 & v65) == 1 && (v69 & 0xFFFFFFFE) == 0xA)
      {
        long long v103 = (_DWORD *)(a6 + 8);
        uint64_t v104 = v418;
        do
        {
          if (*(float *)&v33[v61] < 1.0 && *v103 != v69) {
            v33[v61] = 1065353216;
          }
          v103 += 128;
          ++v61;
          --v104;
        }
        while (v104);
      }
      a4 = v423;
      if (v417[0] >= v423)
      {
        unint64_t v64 = v416;
        goto LABEL_45;
      }
      if (v412 < 8)
      {
        int v105 = v417[0];
        unint64_t v64 = v416;
LABEL_112:
        int v108 = v62 - v105;
        do
        {
          v33[v80++] = 0x40000000;
          --v108;
        }
        while (v108);
        goto LABEL_45;
      }
      int v105 = v417[0];
      unint64_t v64 = v416;
      if (-2 - v81 < v409) {
        goto LABEL_112;
      }
      uint64_t v106 = v411;
      do
      {
        long long v107 = &v33[v82];
        *long long v107 = v63;
        v107[1] = v63;
        v82 += 8;
        v106 -= 8;
      }
      while (v106);
      v80 += v411;
      int v105 = v406;
      if (v412 != v411) {
        goto LABEL_112;
      }
    }
LABEL_45:
    ++v60;
    int v61 = v80;
  }
  while (v60 != v62);
  if (!a4)
  {
    unsigned int v433 = v20;
    sub_246D82AB8(v24, 0, a6, v20, (uint64_t)v398, (uint64_t)__dst, a8, &v432, (uint64_t)v426, &v433, (uint64_t)v407, (uint64_t)a15, a1, v408);
    unsigned int v188 = v433;
    if (v433) {
      goto LABEL_431;
    }
    goto LABEL_206;
  }
  memcpy(__dst, v33, 4 * (v62 * v62));
  bmMunkres((float *)v33, v62, v393, v109, v398, v110, 0, v111);
  BOOL v394 = (unsigned __int8 *)*((void *)&v443 + 1);
  unsigned int v433 = v20;
  sub_246D82AB8(v24, a4, a6, v20, (uint64_t)v398, (uint64_t)__dst, a8, &v432, (uint64_t)v426, &v433, (uint64_t)v407, (uint64_t)a15, a1, v408);
  if (!v433)
  {
LABEL_206:
    uint64_t v189 = 0;
    unsigned int v190 = 0;
    uint64_t v191 = (uint64_t)v426;
    goto LABEL_207;
  }
  unint64_t v112 = 0;
  int v113 = 0;
  int32x4_t v114 = vdupq_n_s32(0x47C35000u);
  unint64_t v115 = v416;
  while (2)
  {
    if (v112 >= v115)
    {
      int v140 = 0;
      BOOL v141 = __CFADD__(v113, v414);
      if (v62 < 8) {
        goto LABEL_166;
      }
      if (v141) {
        goto LABEL_166;
      }
      uint64_t v142 = v62 & 0xFFFFFFF8;
      int v143 = v113;
      do
      {
        unsigned int v144 = (int32x4_t *)&v34[v143];
        *unsigned int v144 = v114;
        v144[1] = v114;
        v143 += 8;
        v142 -= 8;
      }
      while (v142);
      v113 += v413;
      int v140 = v62 & 0xFFFFFFF8;
      if (v62 != v413)
      {
LABEL_166:
        int v145 = v62 - v140;
        do
        {
          v34[v113++] = 1203982336;
          --v145;
        }
        while (v145);
      }
    }
    else
    {
      uint64_t v116 = 0;
      uint64_t v117 = v24 + 1724 * v112;
      unint64_t v118 = *(unsigned int *)(v117 + 8);
      float32x2_t v119 = vadd_f32(*(float32x2_t *)(v117 + 12), vadd_f32(*(float32x2_t *)(v117 + 12), *(float32x2_t *)(v117 + 20)));
      float v120 = 0.5 * v119.f32[0];
      float v121 = vmuls_lane_f32(0.5, v119, 1);
      int32x4_t v122 = vdupq_n_s32(v118);
      if ((v118 & 0xFFFFFFFE) == 0xA) {
        uint64_t v123 = 6;
      }
      else {
        uint64_t v123 = 5;
      }
      BOOL v125 = ((0x13Fu >> v118) & 1) == 0 || v118 > 8;
      int v126 = v113 + 1;
      long long v127 = a15;
      do
      {
        int v128 = v113;
        int v129 = v126;
        uint64_t v130 = v123;
        if (!v125) {
          uint64_t v130 = qword_246D9F2C0[v118];
        }
        float32x2_t v131 = vadd_f32(*(float32x2_t *)(a6 + v116 + 12), vadd_f32(*(float32x2_t *)(a6 + v116 + 12), *(float32x2_t *)(a6 + v116 + 20)));
        float v132 = 0.5 * v131.f32[0];
        v131.f32[0] = vmuls_lane_f32(0.5, v131, 1);
        float v133 = sqrtf((float)((float)(v121 - v131.f32[0]) * (float)(v121 - v131.f32[0]))+ (float)((float)(v120 - v132) * (float)(v120 - v132)));
        if (v133 > (float)((float)((float)(*(float *)(a8 + 4 * v130 + 116) + 0.01)
                                  * (float)(*(float *)(v117 + 20) + *(float *)(v117 + 24)))
                          * 0.5))
          float v133 = 100000.0;
        if (*v127 < *(float *)(a8 + 188) && !*(unsigned char *)(a6 + v116 + 100)) {
          float v133 = 100000.0;
        }
        unsigned int v134 = *(_DWORD *)(a6 + v116 + 8);
        if (v118 == v134)
        {
          *(float *)&v34[v113] = v133;
        }
        else
        {
          BOOL v136 = v118 == 10 && v134 == 11;
          uint16x4_t v137 = (uint16x4_t)vmovn_s32((int32x4_t)vandq_s8((int8x16_t)vceqq_s32(v122, (int32x4_t)xmmword_246D9F110), (int8x16_t)vceqq_s32(vdupq_n_s32(v134), (int32x4_t)xmmword_246D9F120)));
          BOOL v139 = v118 == 11 && v134 == 10;
          if ((vmaxv_u16(v137) & 1) != 0 || v136 || v139) {
            *(float *)&v34[v128] = v133;
          }
          else {
            v34[v128] = 1203982336;
          }
        }
        int v113 = v128 + 1;
        v116 += 512;
        ++v127;
        int v126 = v129 + 1;
      }
      while (v418 << 9 != v116);
      LODWORD(v20) = v417[0];
      if (v417[0] >= v423)
      {
        unint64_t v115 = v416;
      }
      else
      {
        if (v412 < 8)
        {
          int v146 = v417[0];
          unint64_t v115 = v416;
          goto LABEL_176;
        }
        int v146 = v417[0];
        uint64_t v147 = v411;
        unint64_t v115 = v416;
        if (-2 - v128 < v409) {
          goto LABEL_176;
        }
        do
        {
          unsigned int v148 = (int32x4_t *)&v34[v129];
          int32x4_t *v148 = v114;
          v148[1] = v114;
          v129 += 8;
          v147 -= 8;
        }
        while (v147);
        v113 += v411;
        int v146 = v406;
        if (v412 != v411)
        {
LABEL_176:
          int v149 = v62 - v146;
          do
          {
            v34[v113++] = 1203982336;
            --v149;
          }
          while (v149);
        }
      }
    }
    if (++v112 != v62) {
      continue;
    }
    break;
  }
  memcpy(v392, v34, 4 * (v62 * v62));
  bmMunkres((float *)v34, v62, v394, v182, v391, v183, 0, v184);
  sub_246D83848(v24, v423, a6, v20, (uint64_t)v391, (uint64_t)v392, a8, v426, &v433, (uint64_t)v407, v390, (uint64_t)a15, a1, v408);
  if (v423 <= 1) {
    uint64_t v185 = 1;
  }
  else {
    uint64_t v185 = v423;
  }
  if (v185 < 2)
  {
    uint64_t v186 = 0;
    int v187 = 0;
    goto LABEL_426;
  }
  int v369 = 0;
  int v370 = 0;
  uint64_t v186 = v185 & 0xFFFFFFFE;
  uint64_t v371 = v24;
  uint64_t v372 = v186;
  do
  {
    if (*(_DWORD *)(v371 + 528) == 2) {
      ++v369;
    }
    if (*(_DWORD *)(v371 + 2252) == 2) {
      ++v370;
    }
    v371 += 3448;
    v372 -= 2;
  }
  while (v372);
  int v187 = v370 + v369;
  if (v186 != v185)
  {
LABEL_426:
    uint64_t v373 = v185 - v186;
    int32x4_t v374 = (_DWORD *)(v24 + 1724 * v186 + 528);
    do
    {
      if (*v374 == 2) {
        ++v187;
      }
      v374 += 431;
      --v373;
    }
    while (v373);
  }
  int v432 = v187;
  unsigned int v188 = v433;
  if (!v433) {
    goto LABEL_206;
  }
LABEL_431:
  uint64_t v375 = 0;
  unsigned int v190 = 0;
  uint64_t v189 = 0;
  uint64_t v376 = v188;
  uint64_t v191 = (uint64_t)v426;
  do
  {
    uint64_t v377 = *(unsigned int *)(v191 + 4 * v375);
    unsigned int v378 = (_DWORD *)(a6 + (v377 << 9));
    if (v378[7] < 2u)
    {
      memcpy(&v420[128 * (unint64_t)v190], v378, 0x200uLL);
      uint64_t v191 = (uint64_t)v426;
      *(_DWORD *)(v35 + 4 * v190++) = v377;
    }
    else
    {
      if (v375 != v189) {
        *(_DWORD *)(v191 + 4 * v189) = v377;
      }
      uint64_t v189 = (v189 + 1);
    }
    ++v375;
  }
  while (v376 != v375);
LABEL_207:
  unsigned int v433 = v189;
  if (*a14 <= v190) {
    unsigned int v192 = v190;
  }
  else {
    unsigned int v192 = *a14;
  }
  if (v192)
  {
    sub_246D83EC0((uint64_t)a13, *a14, (uint64_t)v420, v190, v396, a8, a15);
    memcpy(*((void **)&v396 + 1), (const void *)v396, 4 * v192 * v192);
    bmMunkres((float *)v396, v192, v395, v193, v397, v194, 0, v195);
    __src[0] = 0;
    unsigned int v431 = 0;
    sub_246D84490(a13, *a14, v420, v190, (uint64_t)v397, *((uint64_t *)&v396 + 1), (float *)a9, *((uint64_t *)&v35 + 1), v401, &v431, __src);
    uint64_t v196 = __src[0];
    if (__src[0])
    {
      float32x2_t v197 = (unsigned char *)*((void *)&v452 + 1);
      float v198 = (int *)v401;
      uint64_t v199 = __src[0];
      do
      {
        int v200 = *v198++;
        *v197++ = a13[520 * v397[v200] + 516];
        --v199;
      }
      while (v199);
    }
    uint64_t v201 = *a14;
    uint64_t v415 = v196;
    if (v201)
    {
      uint64_t v202 = 0;
      unsigned int v203 = 0;
      uint64_t v204 = (unsigned int *)(a9 + 88);
      float32x2_t v205 = a13;
      uint64_t v191 = (uint64_t)v426;
      float32x2_t v206 = v420;
      do
      {
        unsigned int v207 = *((_DWORD *)v205 + 128);
        if (v207)
        {
          uint64_t v208 = *((unsigned int *)v205 + 2);
          switch((int)v208)
          {
            case 0:
              if (v205[100])
              {
                if (v207 < *v204) {
                  goto LABEL_230;
                }
              }
              else if (v207 < *(_DWORD *)(a9 + 84))
              {
                goto LABEL_230;
              }
              break;
            case 1:
              goto LABEL_229;
            case 2:
            case 4:
              uint64_t v208 = 2;
              goto LABEL_229;
            case 3:
            case 5:
              uint64_t v208 = 3;
              goto LABEL_229;
            case 8:
              uint64_t v208 = 4;
              goto LABEL_229;
            default:
              BOOL v92 = (v208 & 0xFFFFFFFE) == 10;
              uint64_t v208 = 5;
              if (v92) {
                uint64_t v208 = 6;
              }
LABEL_229:
              if (v207 < v204[v208])
              {
LABEL_230:
                if (v202 != v203)
                {
                  uint64_t v209 = v189;
                  unint64_t v210 = v204;
                  memcpy(&a13[520 * v203], v205, 0x208uLL);
                  uint64_t v204 = v210;
                  uint64_t v189 = v209;
                  float32x2_t v206 = v420;
                  uint64_t v191 = (uint64_t)v426;
                }
                ++v203;
              }
              break;
          }
        }
        v205 += 520;
        ++v202;
      }
      while (v201 != v202);
    }
    else
    {
      unsigned int v203 = 0;
      uint64_t v191 = (uint64_t)v426;
      float32x2_t v206 = v420;
    }
    *a14 = v203;
    uint64_t v211 = v431;
    uint64_t v212 = (unsigned int *)*((void *)&v35 + 1);
    if (v431)
    {
      int32x4_t v419 = vdupq_n_s32(0xFFFFFE97);
      do
      {
        if (v206[128 * (unint64_t)*v212 + 7])
        {
          uint64_t v213 = &a13[520 * v203];
          *((_OWORD *)v213 + 30) = 0u;
          *((_OWORD *)v213 + 31) = 0u;
          *((_OWORD *)v213 + 2_Block_object_dispose(&STACK[0x488], 8) = 0u;
          *((_OWORD *)v213 + 29) = 0u;
          *((_OWORD *)v213 + 26) = 0u;
          *((_OWORD *)v213 + 27) = 0u;
          *((_OWORD *)v213 + 24) = 0u;
          *((_OWORD *)v213 + 25) = 0u;
          *((_OWORD *)v213 + 22) = 0u;
          *((_OWORD *)v213 + 23) = 0u;
          *((_OWORD *)v213 + 20) = 0u;
          *((_OWORD *)v213 + 21) = 0u;
          *((_OWORD *)v213 + 1_Block_object_dispose(&STACK[0x488], 8) = 0u;
          *((_OWORD *)v213 + 19) = 0u;
          *((_OWORD *)v213 + 16) = 0u;
          *((_OWORD *)v213 + 17) = 0u;
          *((_OWORD *)v213 + 14) = 0u;
          *((_OWORD *)v213 + 15) = 0u;
          *((_OWORD *)v213 + 12) = 0u;
          *((_OWORD *)v213 + 13) = 0u;
          *((_OWORD *)v213 + 10) = 0u;
          *((_OWORD *)v213 + 11) = 0u;
          *((_OWORD *)v213 + _Block_object_dispose(&STACK[0x488], 8) = 0u;
          *((_OWORD *)v213 + 9) = 0u;
          *((_OWORD *)v213 + 6) = 0u;
          *((_OWORD *)v213 + 7) = 0u;
          *((_OWORD *)v213 + 4) = 0u;
          *((_OWORD *)v213 + 5) = 0u;
          *((_OWORD *)v213 + 2) = 0u;
          *((_OWORD *)v213 + 3) = 0u;
          *(_OWORD *)uint64_t v213 = 0u;
          *((_OWORD *)v213 + 1) = 0u;
          *((int32x4_t *)v213 + 2) = v419;
          *((_DWORD *)v213 + 12) = -361;
          *((_DWORD *)v213 + 32) = -1;
          *((_DWORD *)v213 + 9_Block_object_dispose(&STACK[0x488], 8) = -1;
          *((_DWORD *)v213 + 105) = -1;
          *((_DWORD *)v213 + 12_Block_object_dispose(&STACK[0x488], 8) = 0;
          v213[516] = 0;
          memcpy(&a13[520 * *a14], &v420[128 * (unint64_t)*v212], 0x200uLL);
          float32x2_t v206 = v420;
          uint64_t v214 = *v212;
          float v215 = &v420[128 * v214];
          if (!v215[2] && *((unsigned char *)v215 + 100) && a15[*(unsigned int *)(v35 + 4 * v214)] < *(float *)(a9 + 32)) {
            a13[520 * *a14 + 516] = 1;
          }
          unsigned int v203 = *a14 + 1;
          *a14 = v203;
          uint64_t v191 = (uint64_t)v426;
        }
        ++v212;
        --v211;
      }
      while (v211);
    }
    if (!v203) {
      goto LABEL_278;
    }
    unint64_t v216 = 0;
    unsigned int v217 = 0;
    float v218 = (int *)v452;
    do
    {
      float v219 = &a13[520 * v216];
      if (!*((_DWORD *)v219 + 2))
      {
        if (!v203) {
          goto LABEL_278;
        }
        unint64_t v220 = 0;
        float v222 = *((float *)v219 + 5);
        float v221 = *((float *)v219 + 6);
        float v223 = (float *)(a13 + 12);
        do
        {
          if (v216 != v220 && !*((_DWORD *)v223 - 1))
          {
            float v225 = v223[2];
            float v224 = v223[3];
            float v226 = *((float *)v219 + 3);
            float v227 = *((float *)v219 + 4);
            float v228 = v227 + v221;
            float v229 = v223[1];
            float v230 = *v223 + v225;
            float v231 = v229 + v224;
            BOOL v232 = (float)(v226 + v222) > *v223 && v228 > v229;
            BOOL v233 = v232 && v230 > v226;
            if (v233 && v231 > v227)
            {
              float v235 = v225 * v224;
              if ((float)((float)(fmaxf(fminf(v226 + v222, v230) - fmaxf(v226, *v223), 0.0)
                                 * fmaxf(fminf(v228, v231) - fmaxf(v227, v229), 0.0))
                         / fmaxf(fminf(v221 * v222, v235), 0.00001)) > 0.9
                && v235 > (float)((float)(v221 * v222) * 1.5))
              {
                v218[v217++] = v220;
                unsigned int v203 = *a14;
              }
            }
          }
          ++v220;
          v223 += 130;
        }
        while (v220 < v203);
      }
      ++v216;
    }
    while (v216 < v203);
    if (v203)
    {
      unint64_t v237 = 0;
      unsigned int v238 = 0;
      do
      {
        uint64_t v239 = v217;
        float v240 = v218;
        if (v217)
        {
          while (1)
          {
            int v241 = *v240++;
            if (v237 == v241) {
              break;
            }
            if (!--v239) {
              goto LABEL_276;
            }
          }
        }
        else
        {
LABEL_276:
          if (v237 != v238)
          {
            unint64_t v242 = v218;
            memcpy(&a13[520 * v238], &a13[520 * v237], 0x208uLL);
            float v218 = v242;
            uint64_t v191 = (uint64_t)v426;
            unsigned int v203 = *a14;
          }
          ++v238;
        }
        ++v237;
      }
      while (v237 < v203);
    }
    else
    {
LABEL_278:
      unsigned int v238 = 0;
    }
    *a14 = v238;
    uint64_t v243 = v415;
    if (v415)
    {
      float v244 = (unsigned int *)v401;
      do
      {
        unsigned int v245 = *v244++;
        unsigned int v246 = v189 + 1;
        *(_DWORD *)(v191 + 4 * v189) = *(_DWORD *)(v35 + 4 * v245);
        LODWORD(v189) = v189 + 1;
        --v243;
      }
      while (v243);
    }
    else
    {
      unsigned int v246 = v189;
    }
    unsigned int v433 = v246;
  }
  uint64_t v247 = *(void *)v440;
  a2 = v408;
  acFilterMultiFaceinSameUbody(v24, v423, *(float32x2_t **)v440, a6, v191, &v433, (float *)(a8 + 144), (char *)v445[1], a1, v408);
  unsigned int v248 = v423;
  unint64_t v249 = v416;
  if (v423)
  {
    uint64_t v250 = v247 + 16;
    float v251 = (float32x2_t *)(v24 + 20);
    do
    {
      unsigned int v256 = v251[-2].i32[1] - 1;
      if (v256 <= 0xB) {
        int v252 = dword_246D9F5DC[v256];
      }
      else {
        int v252 = 0;
      }
      float32x2_t v253 = v251[-1];
      float32x2_t v254 = vadd_f32(v253, *v251);
      float v255 = (float)v251[1].u32[0];
      *(float32x2_t *)(v250 - 16) = v253;
      *(float32x2_t *)(v250 - _Block_object_dispose(&STACK[0x488], 8) = v254;
      *(_DWORD *)uint64_t v250 = v252;
      *(float *)(v250 + _Block_object_dispose(&STACK[0x488], 8) = v255 / 1000.0;
      v250 += 32;
      float v251 = (float32x2_t *)((char *)v251 + 1724);
      --v249;
    }
    while (v249);
  }
  uint64_t v257 = v433;
  if (v433)
  {
    uint64_t v258 = 0;
    unsigned int v259 = 0;
    float v260 = *(float *)(a8 + 36);
    float v261 = *(float *)(a8 + 48);
    unint64_t v262 = v426;
    do
    {
      uint64_t v263 = *(unsigned int *)&v262[4 * v258];
      uint64_t v264 = a6 + (v263 << 9);
      unsigned int v265 = *(_DWORD *)(v264 + 8) - 1;
      if (v265 > 0xB) {
        int v266 = 0;
      }
      else {
        int v266 = dword_246D9F5DC[v265];
      }
      float32x2_t v267 = vadd_f32(*(float32x2_t *)(v264 + 12), *(float32x2_t *)(v264 + 20));
      float v268 = (float)*(unsigned int *)(v264 + 28);
      v428[0] = *(void *)(v264 + 12);
      v428[1] = v267;
      int v429 = v266;
      float v430 = v268 / 1000.0;
      if (acCheckOverlapBox(v247, v248, (uint64_t)v428, v260, v261))
      {
        unint64_t v262 = v426;
      }
      else
      {
        unint64_t v262 = v426;
        if (v258 != v259) {
          *(_DWORD *)&v426[4 * v259] = v263;
        }
        ++v259;
      }
      unsigned int v248 = v423;
      ++v258;
    }
    while (v257 != v258);
    long long v269 = *(_OWORD **)&v440[2];
    if (v259)
    {
      uint64_t v270 = 0;
      a2 = v408;
      do
      {
        unsigned __int32 v277 = *(_DWORD *)v262;
        v262 += 4;
        __int32 v276 = v277;
        unint64_t v278 = a6 + ((unint64_t)v277 << 9);
        unsigned int v279 = *(_DWORD *)(v278 + 8) - 1;
        if (v279 <= 0xB) {
          __int32 v271 = dword_246D9F5DC[v279];
        }
        else {
          __int32 v271 = 0;
        }
        float32x2_t v272 = *(float32x2_t *)(v278 + 12);
        float32x2_t v273 = vadd_f32(v272, *(float32x2_t *)(v278 + 20));
        float32_t v274 = (float)*(unsigned int *)(v278 + 28) / 1000.0;
        unsigned int v275 = (float32x2_t *)&v269[v270];
        float32x2_t *v275 = v272;
        v275[1] = v273;
        v275[3].f32[0] = v274;
        v275[2].i32[0] = v271;
        v275[2].i32[1] = v276;
        v270 += 2;
      }
      while (2 * v259 != v270);
    }
    else
    {
      a2 = v408;
    }
  }
  else
  {
    unsigned int v259 = 0;
    long long v269 = *(_OWORD **)&v440[2];
  }
  unsigned int v22 = v405;
  unsigned int v280 = acRemoveOverlapBoxes(v269, v259, (unsigned __int8 *)v441[0], *(float *)(a8 + 48));
  unsigned int v281 = v280;
  uint64_t v29 = (uint64_t)v426;
  unsigned int v39 = v423;
  uint64_t v30 = v400;
  if (v280)
  {
    if (v280 > 0xA
      && (v426 < (char *)&v269[2 * v280 - 1] + 8 ? (BOOL v282 = (char *)v269 + 20 >= &v426[4 * v280]) : (BOOL v282 = 1), v282))
    {
      uint64_t v283 = v280 & 3;
      if ((v280 & 3) == 0) {
        uint64_t v283 = 4;
      }
      uint64_t v284 = v280 - v283;
      unint64_t v285 = (int32x2_t *)(v426 + 8);
      unsigned int v286 = (int32x2_t *)((char *)v269 + 84);
      uint64_t v287 = v284;
      do
      {
        int32x2_t v288 = vzip1_s32(*v286, v286[4]);
        v285[-1] = vzip1_s32(v286[-8], v286[-4]);
        *unint64_t v285 = v288;
        v285 += 2;
        v286 += 16;
        v287 -= 4;
      }
      while (v287);
    }
    else
    {
      uint64_t v284 = 0;
    }
    uint64_t v289 = v280 - v284;
    long long v290 = &v426[4 * v284];
    unsigned int v291 = (int *)&v269[2 * v284 + 1] + 1;
    do
    {
      int v292 = *v291;
      v291 += 8;
      *(_DWORD *)long long v290 = v292;
      v290 += 4;
      --v289;
    }
    while (v289);
  }
  unsigned int v433 = v280;
  unsigned int v41 = v432;
LABEL_330:
  unsigned int v295 = v39 - v41 + v281;
  if (v295 > v22)
  {
    if (v403)
    {
      unsigned int v296 = 0;
    }
    else
    {
      uint64_t v366 = 0;
      unsigned int v296 = 0;
      uint64_t v367 = (_DWORD *)(v24 + 528);
      do
      {
        if (*v367 == 1)
        {
          uint64_t v368 = (_DWORD *)(v30 + 8 * v296);
          *uint64_t v368 = v366;
          v368[1] = *(v367 - 2);
          ++v296;
        }
        ++v366;
        v367 += 431;
      }
      while (v39 != v366);
    }
    uint64_t v297 = v30;
    bmHeapsort(v30, v296, 8uLL, (int (*)(uint64_t, uint64_t))sub_246D84728);
    uint64_t v298 = v297;
    unsigned int v39 = v423;
    uint64_t v29 = (uint64_t)v426;
    a2 = v408;
    if (v296)
    {
      unsigned int v299 = v41 - v22 + v295;
      if (v41 < v299)
      {
        unint64_t v300 = v296 - 1;
        if (v300 >= v281 + v423 + ~v41 - v22) {
          unint64_t v300 = v281 + v423 + ~v41 - v22;
        }
        if (v300)
        {
          unint64_t v301 = v300 + 1;
          unint64_t v300 = (v300 + 1) & 0x1FFFFFFFELL;
          long long v302 = (unsigned int *)(v298 + 8);
          unint64_t v303 = v300;
          do
          {
            unsigned int v304 = *(v302 - 2);
            unsigned int v305 = *v302;
            v302 += 4;
            *(_DWORD *)(v24 + 1724 * v304 + 52_Block_object_dispose(&STACK[0x488], 8) = 2;
            *(_DWORD *)(v24 + 1724 * v305 + 52_Block_object_dispose(&STACK[0x488], 8) = 2;
            v303 -= 2;
          }
          while (v303);
          if (v301 != v300)
          {
            v41 += v300;
            goto LABEL_342;
          }
        }
        else
        {
LABEL_342:
          unint64_t v306 = v300 + 1;
          unsigned int v307 = v41 + 1;
          long long v308 = (unsigned int *)(v298 + 8 * v300);
          do
          {
            unsigned int v309 = *v308;
            v308 += 2;
            *(_DWORD *)(v24 + 1724 * v309 + 52_Block_object_dispose(&STACK[0x488], 8) = 2;
            if (v306 >= v296) {
              break;
            }
            ++v306;
            BOOL v46 = v307++ >= v299;
          }
          while (!v46);
        }
      }
    }
  }
  unsigned int v389 = *(_DWORD *)(a8 + 196);
  char v388 = *(unsigned char *)(a8 + 194);
  unsigned int v310 = a1;
  unsigned int v311 = v39;
  acTrkObjectPickDet(a1, a2, v24, v39, v22, a6, v417[0], v29, &v433, v402, (uint64_t)v386, (uint64_t)v407, v387, v388, v389);
  if (v403)
  {
    unsigned int v312 = 0;
    long long v313 = v426;
  }
  else
  {
    uint64_t v350 = 0;
    unsigned int v312 = 0;
    long long v351 = (int *)v24;
    long long v313 = v426;
    do
    {
      if (v351[132] <= 1)
      {
        if (v350 != v312)
        {
          memcpy((void *)(v24 + 1724 * v312), v351, 0x6BCuLL);
          long long v313 = v426;
        }
        ++v312;
      }
      v351 += 431;
      ++v350;
    }
    while (v311 != v350);
  }
  if (v312 >= v22) {
    uint64_t v314 = v22;
  }
  else {
    uint64_t v314 = v312;
  }
  unsigned int v315 = v433;
  if (v433 >= v22) {
    unsigned int v315 = v22;
  }
  if (v315 + v314 <= v22) {
    uint64_t v316 = v315;
  }
  else {
    uint64_t v316 = v22 - v314;
  }
  if (!v316)
  {
    unsigned int v338 = 0;
    unsigned int v339 = a11;
    *a10 = 0;
    uint64_t v156 = v314;
    uint64_t v343 = *((void *)&v31 + 1);
    *a11 = 0;
    if (a6) {
      goto LABEL_375;
    }
LABEL_384:
    if (!v314) {
      goto LABEL_400;
    }
    if (v314 <= 0xB || __CFADD__(v338, v314 - 1))
    {
      uint64_t v380 = 0;
      uint64_t v352 = v404;
    }
    else
    {
      int32x4_t v379 = (int32x4_t)xmmword_246D9F130;
      uint64_t v380 = v314 & 0xFFFFFFF8;
      v381.i64[0] = 0x400000004;
      v381.i64[1] = 0x400000004;
      v382.i64[0] = 0x800000008;
      v382.i64[1] = 0x800000008;
      unsigned int v383 = v338;
      uint64_t v384 = v380;
      do
      {
        int v385 = (int32x4_t *)(v343 + 4 * v383);
        *int v385 = v379;
        v385[1] = vaddq_s32(v379, v381);
        int32x4_t v379 = vaddq_s32(v379, v382);
        v383 += 8;
        v384 -= 8;
      }
      while (v384);
      uint64_t v352 = v404;
      if (v380 == v314) {
        goto LABEL_401;
      }
    }
    do
    {
      *(_DWORD *)(v343 + 4 * (v338 + v380)) = v380;
      ++v380;
    }
    while (v314 != v380);
    goto LABEL_401;
  }
  unsigned int v422 = v315 + v314;
  *(int32x4_t *)long long v427 = vdupq_n_s32(0xFFFFFE97);
  uint64_t v425 = v314;
  LODWORD(v156) = v314;
  do
  {
    uint64_t v321 = *(unsigned int *)v313;
    long long v322 = (unsigned int *)(v313 + 4);
    unsigned int v323 = v156;
    long long v324 = (_DWORD *)(v24 + 1724 * v156);
    bzero(v324, 0x6BCuLL);
    *((_OWORD *)v324 + 2) = *(_OWORD *)v427;
    v324[12] = -361;
    v324[32] = -1;
    v324[98] = -1;
    v324[105] = -1;
    *(void *)(v324 + 193) = 0xFF7FFFFFFFFFFFFFLL;
    v324[198] = 0;
    *(void *)(v324 + 207) = 0;
    uint64_t v325 = a6 + (v321 << 9);
    v324[209] = 0;
    memcpy(v324, (const void *)v325, 0x200uLL);
    int v326 = (*a12)++;
    *long long v324 = v326;
    v324[131] = LODWORD(a15[v321]);
    int v327 = *(_DWORD *)(v325 + 8);
    long long v328 = (long long *)(v325 + 12);
    int v329 = *(_DWORD *)(v325 + 40);
    int v330 = *(_DWORD *)(v325 + 44);
    char v331 = *(unsigned char *)(v325 + 100);
    int v332 = *(_DWORD *)(v325 + 420);
    if (v324[2] == 9)
    {
      long long v317 = *v328;
      uint64_t v318 = v24 + 1724 * v323;
      *(_OWORD *)(v318 + 532) = v317;
      *(unsigned char *)(v318 + 54_Block_object_dispose(&STACK[0x488], 8) = v331;
      *(_DWORD *)(v318 + 564) = v332;
      *(_DWORD *)(v318 + 556) = v330;
      *(_DWORD *)(v318 + 552) = v329;
      *(_DWORD *)(v318 + 56_Block_object_dispose(&STACK[0x488], 8) = v327;
      *(_DWORD *)(v318 + 780) = 1;
    }
    else
    {
      uint64_t v333 = v24 + 1724 * v323;
      unsigned int v334 = *(_DWORD *)(v333 + 780);
      if (v334 < 6)
      {
        uint64_t v337 = v24 + 1724 * v323 + 40 * v334;
        *(_OWORD *)(v337 + 532) = *v328;
        *(unsigned char *)(v337 + 54_Block_object_dispose(&STACK[0x488], 8) = v331;
        *(_DWORD *)(v337 + 564) = v332;
        *(_DWORD *)(v337 + 556) = v330;
        *(_DWORD *)(v337 + 552) = v329;
        *(_DWORD *)(v337 + 56_Block_object_dispose(&STACK[0x488], 8) = v327;
        ++*(_DWORD *)(v333 + 780);
      }
      else
      {
        long long v335 = *v328;
        uint64_t v336 = v24 + 1724 * v323;
        *(_OWORD *)(v336 + 732) = v335;
        *(unsigned char *)(v336 + 74_Block_object_dispose(&STACK[0x488], 8) = v331;
        *(_DWORD *)(v336 + 764) = v332;
        *(_DWORD *)(v336 + 756) = v330;
        *(_DWORD *)(v336 + 752) = v329;
        *(_DWORD *)(v336 + 76_Block_object_dispose(&STACK[0x488], 8) = v327;
      }
    }
    long long v313 = (char *)v322;
    uint64_t v319 = a6 + (v321 << 9);
    uint64_t v320 = v24 + 1724 * v323;
    *(_OWORD *)(v320 + 1664) = *(_OWORD *)(v319 + 12);
    *(_OWORD *)(v320 + 1680) = *(_OWORD *)(v319 + 12);
    *(float *)(v320 + 164_Block_object_dispose(&STACK[0x488], 8) = (float)*(unsigned int *)(v319 + 28);
    uint64_t v156 = v323 + 1;
    --v316;
  }
  while (v316);
  uint64_t v314 = v425;
  unsigned int v338 = v156 - v425;
  unsigned int v339 = a11;
  *a10 = v156 - v425;
  if (v156 <= v425)
  {
    *a11 = 0;
    unsigned int v310 = a1;
    uint64_t v343 = *((void *)&v31 + 1);
    if (!v425) {
      goto LABEL_400;
    }
    goto LABEL_392;
  }
  if (v405 >= v422) {
    uint64_t v340 = v422;
  }
  else {
    uint64_t v340 = v405;
  }
  unint64_t v341 = v340 - v425;
  uint64_t v342 = v425;
  unsigned int v310 = a1;
  uint64_t v343 = *((void *)&v31 + 1);
  if (v341 <= 7)
  {
    do
    {
LABEL_373:
      *(_DWORD *)(*((void *)&v31 + 1) - 4 * v425 + 4 * v342) = v342;
      ++v342;
    }
    while ((void)v31 != v342);
  }
  else
  {
    unint64_t v344 = v341 & 0xFFFFFFFFFFFFFFF8;
    int32x4_t v345 = vaddq_s32(vdupq_n_s32(v425), (int32x4_t)xmmword_246D9F130);
    int v346 = (int32x4_t *)(*((void *)&v31 + 1) + 16);
    v347.i64[0] = 0x400000004;
    v347.i64[1] = 0x400000004;
    v348.i64[0] = 0x800000008;
    v348.i64[1] = 0x800000008;
    unint64_t v349 = v341 & 0xFFFFFFFFFFFFFFF8;
    do
    {
      v346[-1] = v345;
      *int v346 = vaddq_s32(v345, v347);
      int32x4_t v345 = vaddq_s32(v345, v348);
      v346 += 2;
      v349 -= 8;
    }
    while (v349);
    if (v341 != v344)
    {
      uint64_t v342 = v344 + v425;
      goto LABEL_373;
    }
  }
  *a11 = 0;
  if (!a6) {
    goto LABEL_384;
  }
LABEL_375:
  if (!v314)
  {
LABEL_400:
    uint64_t v352 = v404;
    goto LABEL_401;
  }
LABEL_392:
  uint64_t v353 = 0;
  unsigned int v354 = (_DWORD *)(v24 + 512);
  do
  {
    if (!*v354)
    {
      *(_DWORD *)(v343 + 4 * v338++) = v353;
      ++*v339;
    }
    v354 += 431;
    ++v353;
  }
  while (v314 != v353);
  uint64_t v355 = 0;
  unint64_t v356 = (_DWORD *)(v24 + 512);
  uint64_t v352 = v404;
  do
  {
    if (*v356) {
      *(_DWORD *)(v343 + 4 * v338++) = v355;
    }
    v356 += 431;
    ++v355;
  }
  while (v314 != v355);
LABEL_401:
  uint64_t v357 = v156;
  float v358 = v352;
  bzero(v352, v156);
  if (v156)
  {
    uint64_t v359 = 0;
    do
    {
      if (!v358[v359])
      {
        memcpy(__src, (const void *)(v24 + 1724 * v359), 0x6BCuLL);
        v358[v359] = 1;
        uint64_t v360 = *(unsigned int *)(v343 + 4 * v359);
        uint64_t v361 = v359;
        if (v359 != v360)
        {
          uint64_t v361 = v359;
          do
          {
            memcpy((void *)(v24 + 1724 * v361), (const void *)(v24 + 1724 * v360), 0x6BCuLL);
            uint64_t v361 = *(unsigned int *)(v343 + 4 * v361);
            v358[v361] = 1;
            uint64_t v360 = *(unsigned int *)(v343 + 4 * v361);
          }
          while (v359 != v360);
        }
        memcpy((void *)(v24 + 1724 * v361), __src, 0x6BCuLL);
      }
      ++v359;
    }
    while (v359 != v156);
    do
    {
      int v362 = *(_DWORD *)(v24 + 520);
      if (v362 == -1) {
        int v363 = -1;
      }
      else {
        int v363 = v362 + 1;
      }
      *(_DWORD *)(v24 + 520) = v363;
      float v364 = *(float *)(v24 + 20) * *(float *)(v24 + 24);
      *(float *)(v24 + 82_Block_object_dispose(&STACK[0x488], 8) = v364;
      *(float *)(v24 + 832) = v364 / (float)((float)(v408 * v310) + 0.0001);
      v24 += 1724;
      --v357;
    }
    while (v357);
  }
  return v156;
}

uint64_t getLargestConnectedRegion(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7, _OWORD *a8)
{
  unsigned int v8 = *((_DWORD *)a1 + 2);
  if (!v8) {
    return 0;
  }
  unint64_t v9 = *((unsigned int *)a1 + 3);
  if (!v9) {
    return 0;
  }
  LODWORD(v10) = 0;
  unsigned int v11 = 0;
  uint64_t v12 = *a1;
  uint64_t v13 = *a1 + 1;
  int v14 = -1;
  __asm { FMOV            V0.2S, #1.0 }
  uint64_t v19 = 1;
  do
  {
    if (!v19) {
      goto LABEL_5;
    }
    float v20 = (float)v11;
    uint64_t v21 = *a2;
    if (*(unsigned __int8 *)(v12 + *((_DWORD *)a1 + 4) * v11) > a7)
    {
      if (v11) {
        unsigned __int16 v22 = *(_WORD *)(v21 + *((_DWORD *)a2 + 4) * (v11 - 1));
      }
      else {
        unsigned __int16 v22 = a6;
      }
      if (v22 >= (unsigned __int16)a6) {
        uint64_t v23 = (unsigned __int16)a6;
      }
      else {
        uint64_t v23 = v22;
      }
      if (v22 > (unsigned __int16)a6 && v22 < a6 && *(_DWORD *)(a5 + 4 * v22) > (int)v23) {
        *(_DWORD *)(a5 + 4 * v22) = v23;
      }
      if (v22 < (unsigned __int16)a6
        && a6 >= 0x10000
        && *(_DWORD *)(a5 + 4 * (unsigned __int16)a6) > (int)v23)
      {
        *(_DWORD *)(a5 + 4 * (unsigned __int16)a6) = v23;
      }
      if (v23 == a6)
      {
        uint64_t v24 = a4 + 16 * (int)v10;
        int v25 = v10 + 1;
        LOWORD(v23) = v10;
        uint64_t v10 = 4 * (int)v10;
        *(_DWORD *)(a5 + v10) = a6;
        *(_DWORD *)uint64_t v24 = 0;
        *(float *)(v24 + 4) = v20;
        *(void *)(v24 + _Block_object_dispose(&STACK[0x488], 8) = _D0;
        *(_DWORD *)(a3 + v10) = 1;
        LODWORD(v10) = v25;
LABEL_33:
        *(_WORD *)(v21 + *((_DWORD *)a2 + 4) * v11) = v23;
        unint64_t v9 = *((unsigned int *)a1 + 3);
        goto LABEL_34;
      }
      float v26 = (float *)(a4 + 16 * v23);
      float v27 = *v26;
      if (*v26 <= 0.0)
      {
        uint64_t v32 = a4 + 16 * v23;
        float v33 = *(float *)(v32 + 8);
        uint64_t v29 = (float *)(v32 + 8);
        float v31 = v33;
        if ((float)(v27 + v33) > 0.0) {
          goto LABEL_28;
        }
      }
      else
      {
        *float v26 = v27 + -1.0;
        uint64_t v28 = a4 + 16 * v23;
        float v30 = *(float *)(v28 + 8);
        uint64_t v29 = (float *)(v28 + 8);
        float v31 = v30;
      }
      *uint64_t v29 = v31 + 1.0;
LABEL_28:
      uint64_t v34 = a4 + 16 * v23;
      float v35 = *(float *)(v34 + 4);
      if (v35 <= v20)
      {
        float v39 = *(float *)(v34 + 12);
        uint64_t v36 = (float *)(v34 + 12);
        float v38 = v39;
        if ((float)(v35 + v39) > v20)
        {
LABEL_32:
          ++*(_DWORD *)(a3 + 4 * v23);
          goto LABEL_33;
        }
      }
      else
      {
        *(float *)(v34 + 4) = v35 + -1.0;
        float v37 = *(float *)(v34 + 12);
        uint64_t v36 = (float *)(v34 + 12);
        float v38 = v37;
      }
      *uint64_t v36 = v38 + 1.0;
      goto LABEL_32;
    }
LABEL_34:
    if (v9 >= 2)
    {
      uint64_t v40 = 0;
      while (2)
      {
        if (*(unsigned __int8 *)(v13 + v11 * *((_DWORD *)a1 + 4) + v40) <= a7) {
          goto LABEL_38;
        }
        int v44 = *((_DWORD *)a2 + 4);
        if (v11) {
          unsigned __int16 v45 = *(_WORD *)(v21 + (v14 * v44) + 2 * v40 + 2);
        }
        else {
          unsigned __int16 v45 = a6;
        }
        unsigned int v46 = (unsigned __int16)a6;
        uint64_t v47 = *(unsigned __int16 *)(v21 + v11 * v44 + 2 * v40);
        if (v45 < (unsigned __int16)a6) {
          unsigned int v46 = v45;
        }
        if (v47 >= v46) {
          uint64_t v42 = v46;
        }
        else {
          uint64_t v42 = *(unsigned __int16 *)(v21 + v11 * v44 + 2 * v40);
        }
        _CF = v45 <= v42 || v45 >= a6;
        if (!_CF && *(_DWORD *)(a5 + 4 * v45) > (int)v42) {
          *(_DWORD *)(a5 + 4 * v45) = v42;
        }
        BOOL v49 = v47 <= v46 || v47 >= a6;
        if (!v49 && *(_DWORD *)(a5 + 4 * v47) > (int)v42) {
          *(_DWORD *)(a5 + 4 * v47) = v42;
        }
        if (v42 == a6)
        {
          uint64_t v42 = 4 * (int)v10;
          *(_DWORD *)(a5 + v42) = a6;
          uint64_t v41 = a4 + 16 * (int)v10;
          *(float *)uint64_t v41 = (float)(v40 + 1);
          *(float *)(v41 + 4) = v20;
          *(void *)(v41 + _Block_object_dispose(&STACK[0x488], 8) = _D0;
          *(_DWORD *)(a3 + v42) = 1;
          LOWORD(v42) = v10;
          LODWORD(v10) = v10 + 1;
        }
        else
        {
          float v50 = (float)(v40 + 1);
          uint64_t v51 = (float *)(a4 + 16 * v42);
          float v52 = *v51;
          if (*v51 > v50)
          {
            *uint64_t v51 = v52 + -1.0;
            uint64_t v53 = a4 + 16 * v42;
            float v55 = *(float *)(v53 + 8);
            uint64_t v54 = (float *)(v53 + 8);
            float v56 = v55;
            goto LABEL_64;
          }
          uint64_t v57 = a4 + 16 * v42;
          float v58 = *(float *)(v57 + 8);
          uint64_t v54 = (float *)(v57 + 8);
          float v56 = v58;
          if ((float)(v52 + v58) <= v50) {
LABEL_64:
          }
            *uint64_t v54 = v56 + 1.0;
          uint64_t v59 = a4 + 16 * v42;
          float v60 = *(float *)(v59 + 4);
          if (v60 > v20)
          {
            *(float *)(v59 + 4) = v60 + -1.0;
            float v62 = *(float *)(v59 + 12);
            int v61 = (float *)(v59 + 12);
            float v63 = v62;
            goto LABEL_68;
          }
          float v64 = *(float *)(v59 + 12);
          int v61 = (float *)(v59 + 12);
          float v63 = v64;
          if ((float)(v60 + v64) <= v20) {
LABEL_68:
          }
            *int v61 = v63 + 1.0;
          ++*(_DWORD *)(a3 + 4 * v42);
        }
        *(_WORD *)(v21 + v11 * *((_DWORD *)a2 + 4) + 2 * v40 + 2) = v42;
        unint64_t v9 = *((unsigned int *)a1 + 3);
LABEL_38:
        unint64_t v43 = v40 + 2;
        ++v40;
        if (v43 >= v9) {
          break;
        }
        continue;
      }
    }
    unsigned int v8 = *((_DWORD *)a1 + 2);
    uint64_t v19 = v9;
LABEL_5:
    ++v11;
    ++v14;
  }
  while (v11 < v8);
  if ((int)v10 >= 1)
  {
    int v65 = 0;
    uint64_t v10 = v10;
    do
    {
      uint64_t v66 = 4 * --v10;
      uint64_t v67 = *(int *)(a5 + v66);
      int v68 = *(_DWORD *)(a3 + v66);
      if ((int)v67 >= (int)v10)
      {
        if (v68 > v65)
        {
          a6 = v10;
          int v65 = v68;
        }
      }
      else
      {
        *(_DWORD *)(a3 + 4 * v67) += v68;
        float v69 = *(float *)(a4 + 16 * v10);
        float32x2_t v70 = (float *)(a4 + 16 * v67);
        float v71 = *v70;
        if (v69 >= *v70)
        {
          float v72 = v69 + *(float *)(a4 + 16 * v10 + 8);
          float v74 = v70[2];
          float32x2_t v73 = v70 + 2;
          if (v72 >= (float)(v71 + v74)) {
            *float32x2_t v73 = v72 - v71;
          }
        }
        else
        {
          v70[2] = (float)(v71 - v69) + v70[2];
          *float32x2_t v70 = v69;
        }
        uint64_t v75 = a4 + 16 * v10;
        float v76 = *(float *)(v75 + 4);
        uint64_t v77 = a4 + 16 * v67;
        float v78 = *(float *)(v77 + 4);
        if (v76 >= v78)
        {
          float v79 = v76 + *(float *)(v75 + 12);
          float v81 = *(float *)(v77 + 12);
          int v80 = (float *)(v77 + 12);
          if (v79 >= (float)(v78 + v81)) {
            *int v80 = v79 - v78;
          }
        }
        else
        {
          *(float *)(v77 + 12) = (float)(v78 - v76) + *(float *)(v77 + 12);
          *(float *)(v77 + 4) = v76;
        }
      }
    }
    while ((unint64_t)(v10 + 1) > 1);
    if (v65 >= 1) {
      *a8 = *(_OWORD *)(a4 + 16 * (int)a6);
    }
  }
  return 0;
}

__n128 getInitialPos(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5, uint64_t a6, BOOL *a7, __n128 result)
{
  uint64_t v9 = *(unsigned int *)(a1 + 8);
  if (!v9 || (uint64_t v11 = *(unsigned int *)(a1 + 12), !v11))
  {
    *a7 = 1;
    return result;
  }
  unsigned int v15 = 0;
  uint64_t v16 = 0;
  unsigned int v17 = 0;
  unsigned __int8 v18 = 0;
  uint64_t v19 = *(void *)a1;
  float v20 = (__n128 *)(a2 + 12);
  result.n128_u32[0] = *(_DWORD *)(a2 + 12);
  float v21 = *(float *)(a2 + 16);
  uint64_t v22 = v11 & 0xFFFFFFE0;
  uint64_t v23 = v11 & 0xFFFFFFF8;
  do
  {
    uint64_t v24 = (uint8x16_t *)(*(void *)a1 + 16 + v15);
    if (v21 > (float)v16)
    {
      if (v11 > 7)
      {
        if (v11 >= 0x20)
        {
          uint8x16_t v33 = (uint8x16_t)vdupq_n_s8(v17);
          uint64_t v34 = v11 & 0xFFFFFFE0;
          uint8x16_t v35 = v33;
          do
          {
            uint8x16_t v33 = vmaxq_u8(v24[-1], v33);
            uint8x16_t v35 = vmaxq_u8(*v24, v35);
            v24 += 2;
            v34 -= 32;
          }
          while (v34);
          uint8x16_t v36 = vmaxq_u8(v33, v35);
          v36.i8[0] = vmaxvq_u8(v36);
          unsigned int v17 = v36.i32[0];
          if (v22 == v11) {
            goto LABEL_4;
          }
          uint64_t v25 = v11 & 0xFFFFFFE0;
          uint64_t v31 = v25;
          if ((v11 & 0x18) == 0) {
            goto LABEL_32;
          }
        }
        else
        {
          uint64_t v31 = 0;
        }
        uint8x8_t v37 = (uint8x8_t)vdup_n_s8(v17);
        uint64_t v38 = v31 - (v11 & 0xFFFFFFF8);
        float v39 = (uint8x8_t *)(v19 + v31 + v15);
        do
        {
          uint8x8_t v40 = *v39++;
          uint8x8_t v37 = vmax_u8(v40, v37);
          v38 += 8;
        }
        while (v38);
        v37.i8[0] = vmaxv_u8(v37);
        unsigned int v17 = v37.i32[0];
        uint64_t v25 = v11 & 0xFFFFFFF8;
        if (v23 == v11) {
          goto LABEL_4;
        }
      }
      else
      {
        uint64_t v25 = 0;
      }
LABEL_32:
      uint64_t v41 = v11 - v25;
      uint64_t v42 = (unsigned __int8 *)(v19 + v25 + v15);
      do
      {
        unsigned int v44 = *v42++;
        unsigned int v43 = v44;
        unsigned int v17 = v17;
        if (v44 > v17) {
          unsigned int v17 = v43;
        }
        --v41;
      }
      while (v41);
      goto LABEL_4;
    }
    if ((float)(v21 + *(float *)(a2 + 24)) > (float)v16)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        uint64_t v27 = v19 + v15;
        unsigned int v28 = *(unsigned __int8 *)(v27 + i);
        unsigned int v17 = v17;
        if (v28 > v17) {
          unsigned int v17 = *(unsigned __int8 *)(v27 + i);
        }
        float v29 = (float)i;
        if (v28 <= v18) {
          LOBYTE(v2_Block_object_dispose(&STACK[0x488], 8) = v18;
        }
        if ((float)(result.n128_f32[0] + *(float *)(a2 + 20)) > v29 && result.n128_f32[0] <= v29) {
          unsigned __int8 v18 = v28;
        }
      }
      goto LABEL_4;
    }
    if (v11 > 7)
    {
      if (v11 >= 0x20)
      {
        uint8x16_t v46 = (uint8x16_t)vdupq_n_s8(v17);
        uint64_t v47 = v11 & 0xFFFFFFE0;
        uint8x16_t v48 = v46;
        do
        {
          uint8x16_t v46 = vmaxq_u8(v24[-1], v46);
          uint8x16_t v48 = vmaxq_u8(*v24, v48);
          v24 += 2;
          v47 -= 32;
        }
        while (v47);
        uint8x16_t v49 = vmaxq_u8(v46, v48);
        v49.i8[0] = vmaxvq_u8(v49);
        unsigned int v17 = v49.i32[0];
        if (v22 == v11) {
          goto LABEL_4;
        }
        uint64_t v32 = v11 & 0xFFFFFFE0;
        uint64_t v45 = v32;
        if ((v11 & 0x18) == 0) {
          goto LABEL_46;
        }
      }
      else
      {
        uint64_t v45 = 0;
      }
      uint8x8_t v50 = (uint8x8_t)vdup_n_s8(v17);
      uint64_t v51 = v45 - (v11 & 0xFFFFFFF8);
      float v52 = (uint8x8_t *)(v19 + v45 + v15);
      do
      {
        uint8x8_t v53 = *v52++;
        uint8x8_t v50 = vmax_u8(v53, v50);
        v51 += 8;
      }
      while (v51);
      v50.i8[0] = vmaxv_u8(v50);
      unsigned int v17 = v50.i32[0];
      uint64_t v32 = v11 & 0xFFFFFFF8;
      if (v23 == v11) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v32 = 0;
    }
LABEL_46:
    uint64_t v54 = v11 - v32;
    float v55 = (unsigned __int8 *)(v19 + v32 + v15);
    do
    {
      unsigned int v57 = *v55++;
      unsigned int v56 = v57;
      unsigned int v17 = v17;
      if (v57 > v17) {
        unsigned int v17 = v56;
      }
      --v54;
    }
    while (v54);
LABEL_4:
    ++v16;
    v15 += *(_DWORD *)(a1 + 16);
  }
  while (v16 != v9);
  *a7 = v17 == 0;
  if ((_BYTE)v17)
  {
    if (*(_DWORD *)(a2 + 28)
      && v17 >> 1 < v18
      && (result.n128_f32[0] = *(float *)(a2 + 12) + *(float *)(a2 + 20), result.n128_f32[0] <= (float)v11)
      && (result.n128_f32[0] = *(float *)(a2 + 16) + *(float *)(a2 + 24), result.n128_f32[0] <= (float)v9))
    {
      uint64_t result = *v20;
      *(__n128 *)a6 = *v20;
    }
    else
    {
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2691E4540, memory_order_acquire) & 1) == 0)
      {
        unint64_t v63 = a4;
        int v64 = __cxa_guard_acquire(&qword_2691E4540);
        a4 = v63;
        if (v64)
        {
          dword_2691E4538 = (*(_DWORD *)(a1 + 12) * *(_DWORD *)(a1 + 8)) >> 2;
          __cxa_guard_release(&qword_2691E4540);
          a4 = v63;
        }
      }
      uint64_t v58 = dword_2691E4538;
      size_t v59 = 2 * *(unsigned int *)(a1 + 8) * (unint64_t)*(unsigned int *)(a1 + 12);
      if (v59 + 24 * dword_2691E4538 <= a4)
      {
        uint64_t v60 = a3 + 4 * dword_2691E4538;
        uint64_t v61 = v60 + 16 * dword_2691E4538;
        memset((void *)(v61 + 4 * dword_2691E4538), 255, v59);
        uint64_t v65 = v61 + 4 * v58;
        int v62 = *(_DWORD *)(a1 + 12);
        int v66 = *(_DWORD *)(a1 + 8);
        int v67 = v62;
        int v68 = 2 * v62;
        int v69 = 5;
        *(void *)a6 = 0;
        *(void *)(a6 + _Block_object_dispose(&STACK[0x488], 8) = 0;
        getLargestConnectedRegion((uint64_t *)a1, &v65, a3, a3 + 4 * v58, v60 + 16 * v58, v58, a5, (_OWORD *)a6);
        result.n128_u32[0] = *(_DWORD *)(a6 + 8);
        if (result.n128_f32[0] < 0.00000011921
          || (result.n128_u32[0] = *(_DWORD *)(a6 + 12), result.n128_f32[0] < 0.00000011921))
        {
          *a7 = 1;
        }
      }
    }
  }
  return result;
}

uint64_t computeIntegralImage(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *((unsigned int *)a1 + 2);
  if (*(_DWORD *)(a2 + 8) != v2 + 1) {
    return 4294967292;
  }
  uint64_t v3 = *((unsigned int *)a1 + 3);
  if (*(_DWORD *)(a2 + 12) != v3 + 1) {
    return 4294967292;
  }
  if (v2 && v3)
  {
    unsigned int v4 = 0;
    unsigned int v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = *a1;
    int v8 = *((_DWORD *)a1 + 4);
    unsigned int v9 = *(_DWORD *)(a2 + 16);
    uint64_t v10 = *(void *)a2 + 4;
    unsigned int v11 = v9;
    do
    {
      uint64_t v12 = (float *)(v10 + v11);
      uint64_t v13 = (float *)(v10 + v5);
      ++v6;
      float v14 = 0.0;
      uint64_t v15 = v3;
      uint64_t v16 = (unsigned __int8 *)(v7 + v4);
      do
      {
        unsigned int v17 = *v16++;
        float v14 = (float)((float)v17 / 255.0) * (float)((float)v17 / 255.0) + v14;
        float v18 = *v13++;
        *v12++ = v18 + v14;
        --v15;
      }
      while (v15);
      v11 += v9;
      v5 += v9;
      v4 += v8;
    }
    while (v6 != v2);
  }
  return 0;
}

void convertSaliencyMapToBoundingBoxes(uint64_t a1, uint64_t a2, char *a3, unsigned int a4, unsigned int a5, uint64_t a6, int a7, float a8, float a9)
{
  if (a3)
  {
    uint64_t v10 = a2 + 17912;
    uint64_t v11 = 4 * *(unsigned __int16 *)(a2 + 21026) + 4;
    if (v11 + v11 * (unint64_t)*(unsigned __int16 *)(a2 + 21024) <= a4)
    {
      if (*(unsigned char *)(a2 + 21030))
      {
        bzero(a3, a4);
        uint64_t v19 = *(unsigned __int16 *)(v10 + 3114);
        uint64_t v20 = *(unsigned __int16 *)(v10 + 3112);
        int v21 = 4 * v20 + 4;
        BOOL v72 = 0;
        getInitialPos(a1, a6, (uint64_t)&a3[(v21 + v21 * v19)], (int)(a4 - (v21 + v21 * v19)), a5, (uint64_t)&v73, &v72, v22);
        BOOL v24 = !v23 && !v72;
        if (v24 && *(_DWORD *)(a1 + 8) == v19 && *(_DWORD *)(a1 + 12) == v20)
        {
          if (v19 && v20)
          {
            unsigned int v25 = 0;
            int v26 = 0;
            uint64_t v27 = 0;
            uint64_t v28 = *(void *)a1;
            int v29 = *(_DWORD *)(a1 + 16);
            float v30 = a3 + 4;
            int v31 = 4 * v20 + 4;
            do
            {
              uint64_t v32 = (float *)&v30[v31];
              uint8x16_t v33 = (float *)&v30[v26];
              ++v27;
              float v34 = 0.0;
              uint64_t v35 = v20;
              uint8x16_t v36 = (unsigned __int8 *)(v28 + v25);
              do
              {
                unsigned int v37 = *v36++;
                float v34 = (float)((float)v37 / 255.0) * (float)((float)v37 / 255.0) + v34;
                float v38 = *v33++;
                *v32++ = v38 + v34;
                --v35;
              }
              while (v35);
              v31 += v21;
              v26 += v21;
              v25 += v29;
            }
            while (v27 != v19);
          }
          float v39 = *(float *)&v73;
          if (a7)
          {
            int v40 = 0;
            float v41 = -a8;
            float v43 = *((float *)&v73 + 2);
            float v42 = *((float *)&v73 + 1);
            float v44 = *((float *)&v73 + 3);
            do
            {
              uint64_t v45 = &a3[v21 * v42];
              uint64_t v46 = 4 * v39;
              float v47 = *(float *)&v45[v46];
              float v48 = v39 + v43;
              float v49 = v42 + v44;
              uint8x8_t v50 = &a3[v21 * (float)(v42 + v44)];
              uint64_t v51 = 4 * (float)(v39 + v43);
              float v52 = *(float *)&v50[v51];
              float v53 = *(float *)&v50[v46];
              float v54 = *(float *)&v45[v51];
              float v55 = (float)((float)((float)(v47 + v52) - v53) - v54) / (float)(v43 * v44);
              unsigned int v56 = &a3[v21 * (float)(v42 + 1.0)];
              float v57 = (float)((float)((float)((float)(v47 + *(float *)&v50[4 * (float)(v39 + 1.0)]) - v53)
                                  - *(float *)&v45[4 * (float)(v39 + 1.0)])
                          / v44)
                  + (float)(v41 * v55);
              float v58 = (float)((float)((float)((float)(v47 + *(float *)&v56[v51]) - *(float *)&v56[v46]) - v54) / v43)
                  + (float)(v41 * v55);
              uint64_t v59 = 4 * (float)((float)(v39 + v43) + -1.0);
              float v60 = (float)((float)((float)((float)(v52 + *(float *)&v45[v59]) - *(float *)&v50[v59]) - v54) / v44)
                  + (float)(v41 * v55);
              uint64_t v61 = &a3[v21 * (float)(v49 + -1.0)];
              float v62 = (float)((float)((float)((float)(v52 + *(float *)&v61[v46]) - v53) - *(float *)&v61[v51]) / v43)
                  + (float)(v41 * v55);
              BOOL v63 = v62 > 0.0;
              BOOL v64 = v62 < 0.0;
              if (fabsf(v57) > (float)(v55 * a9)) {
                ++v40;
              }
              v40 += 2 * (fabsf(v58) > (float)(v55 * a9))
                   + 4 * (fabsf(v60) > (float)(v55 * a9))
                   + 8 * (fabsf(v62) > (float)(v55 * a9));
              float v65 = (float)(int)((__PAIR64__(v57 < 0.0, 0.0) - LODWORD(v57)) >> 32);
              BOOL v66 = v63 - v64;
              if ((v40 & 1) == 0) {
                float v65 = 0.0;
              }
              float v39 = v39 + v65;
              if (v39 < 0.0) {
                float v39 = 0.0;
              }
              float v67 = (float)(int)((__PAIR64__(v58 < 0.0, 0.0) - LODWORD(v58)) >> 32);
              if ((v40 & 2) == 0) {
                float v67 = 0.0;
              }
              float v42 = v42 + v67;
              if (v42 < 0.0) {
                float v42 = 0.0;
              }
              if ((v40 & 4) != 0) {
                unint64_t v68 = (v60 > 0.0) - (unint64_t)(v60 < 0.0);
              }
              else {
                unint64_t v68 = 0;
              }
              uint64_t v69 = v68 + (uint64_t)v48;
              if (v69 >= v20) {
                uint64_t v69 = v20;
              }
              if ((v40 & 8) == 0) {
                BOOL v66 = 0;
              }
              uint64_t v70 = v66 + (uint64_t)v49;
              if (v70 >= v19) {
                uint64_t v70 = v19;
              }
              float v43 = (float)v69 - v39;
              float v44 = (float)v70 - v42;
              --a7;
            }
            while (a7);
            *((float *)&v73 + 1) = v42;
            *((float *)&v73 + 2) = (float)v69 - v39;
            *((float *)&v73 + 3) = (float)v70 - v42;
          }
          *(float *)&long long v73 = v39;
          *(_OWORD *)(a2 + 1792_Block_object_dispose(&STACK[0x488], 8) = v73;
          *(_DWORD *)(v10 + 32) = 1;
          *(_DWORD *)(v10 + 12) = 6;
          *(_DWORD *)uint64_t v10 = 1;
        }
      }
    }
  }
}

double acDetRectNull@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

int32x4_t acFaceNull@<Q0>(int32x4_t *a1@<X8>)
{
  bzero(a1, 0x658uLL);
  int32x4_t result = vdupq_n_s32(0xFFFFFE97);
  a1[2] = result;
  a1[3].i32[0] = -361;
  a1[8].i32[0] = -1;
  a1[24].i32[2] = -1;
  a1[26].i32[1] = -1;
  return result;
}

int32x4_t acFaceInternalNull@<Q0>(uint64_t a1@<X8>)
{
  *(_OWORD *)(a1 + 480) = 0u;
  *(_OWORD *)(a1 + 496) = 0u;
  *(_OWORD *)(a1 + 44_Block_object_dispose(&STACK[0x488], 8) = 0u;
  *(_OWORD *)(a1 + 464) = 0u;
  *(_OWORD *)(a1 + 416) = 0u;
  *(_OWORD *)(a1 + 432) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 400) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 36_Block_object_dispose(&STACK[0x488], 8) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 28_Block_object_dispose(&STACK[0x488], 8) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 20_Block_object_dispose(&STACK[0x488], 8) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 12_Block_object_dispose(&STACK[0x488], 8) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x488], 8) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  int32x4_t result = vdupq_n_s32(0xFFFFFE97);
  *(int32x4_t *)(a1 + 32) = result;
  *(_DWORD *)(a1 + 4_Block_object_dispose(&STACK[0x488], 8) = -361;
  *(_DWORD *)(a1 + 12_Block_object_dispose(&STACK[0x488], 8) = -1;
  *(_DWORD *)(a1 + 392) = -1;
  *(_DWORD *)(a1 + 420) = -1;
  return result;
}

int32x4_t acFaceReset(int32x4_t *a1)
{
  bzero(a1, 0x658uLL);
  int32x4_t result = vdupq_n_s32(0xFFFFFE97);
  a1[2] = result;
  a1[3].i32[0] = -361;
  a1[8].i32[0] = -1;
  a1[24].i32[2] = -1;
  a1[26].i32[1] = -1;
  return result;
}

int32x4_t acFaceInternalReset(uint64_t a1)
{
  *(_OWORD *)(a1 + 480) = 0u;
  *(_OWORD *)(a1 + 496) = 0u;
  *(_OWORD *)(a1 + 44_Block_object_dispose(&STACK[0x488], 8) = 0u;
  *(_OWORD *)(a1 + 464) = 0u;
  *(_OWORD *)(a1 + 416) = 0u;
  *(_OWORD *)(a1 + 432) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 400) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 36_Block_object_dispose(&STACK[0x488], 8) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 28_Block_object_dispose(&STACK[0x488], 8) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 20_Block_object_dispose(&STACK[0x488], 8) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 12_Block_object_dispose(&STACK[0x488], 8) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x488], 8) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  int32x4_t result = vdupq_n_s32(0xFFFFFE97);
  *(int32x4_t *)(a1 + 32) = result;
  *(_DWORD *)(a1 + 4_Block_object_dispose(&STACK[0x488], 8) = -361;
  *(_DWORD *)(a1 + 12_Block_object_dispose(&STACK[0x488], 8) = -1;
  *(_DWORD *)(a1 + 392) = -1;
  *(_DWORD *)(a1 + 420) = -1;
  return result;
}

float acDetRectWidth(float *a1)
{
  return fmaxf(a1[2] - *a1, 0.0);
}

float acDetRectHeight(uint64_t a1)
{
  return fmaxf(*(float *)(a1 + 12) - *(float *)(a1 + 4), 0.0);
}

float acDetRectCenterX(float *a1)
{
  return (float)(*a1 + a1[2]) * 0.5;
}

float acDetRectCenterY(uint64_t a1)
{
  return (float)(*(float *)(a1 + 4) + *(float *)(a1 + 12)) * 0.5;
}

float32x2_t acDetRectArea(float32x2_t *a1)
{
  float32x2_t v1 = vmaxnm_f32(vsub_f32(a1[1], *a1), 0);
  return vmul_lane_f32(v1, v1, 1);
}

float32x4_t *acDetRectIntersect@<X0>(float32x4_t *result@<X0>, float32x4_t *a2@<X1>, uint64_t a3@<X8>)
{
  int8x16_t v3 = *(int8x16_t *)result;
  v4.i64[0] = a2->i64[0];
  v4.i64[1] = result->i64[1];
  v3.i64[1] = a2->i64[1];
  *(int8x16_t *)a3 = vbslq_s8((int8x16_t)vcgtq_f32(*a2, *result), v4, v3);
  float v5 = result[1].f32[2];
  if (v5 < a2[1].f32[2]) {
    float v5 = a2[1].f32[2];
  }
  *(float *)(a3 + 24) = v5;
  return result;
}

float32x4_t *acSmallestEnclosingBox@<X0>(float32x4_t *result@<X0>, float32x4_t *a2@<X1>, uint64_t a3@<X8>)
{
  int8x16_t v3 = *(int8x16_t *)a2;
  v4.i64[0] = result->i64[0];
  v4.i64[1] = a2->i64[1];
  v3.i64[1] = result->i64[1];
  *(int8x16_t *)a3 = vbslq_s8((int8x16_t)vcgtq_f32(*a2, *result), v4, v3);
  float v5 = result[1].f32[2];
  if (v5 < a2[1].f32[2]) {
    float v5 = a2[1].f32[2];
  }
  *(float *)(a3 + 24) = v5;
  return result;
}

float acGenealizedOverlap(float *a1, float *a2)
{
  float v2 = a1[1];
  float v3 = a2[1];
  if (*a1 >= *a2) {
    float v4 = *a2;
  }
  else {
    float v4 = *a1;
  }
  if (v2 >= v3) {
    float v5 = a2[1];
  }
  else {
    float v5 = a1[1];
  }
  float v6 = a1[2];
  float v7 = a1[3];
  float v8 = a2[2];
  float v9 = a2[3];
  if (v6 >= v8) {
    float v10 = a1[2];
  }
  else {
    float v10 = a2[2];
  }
  if (v7 >= v9) {
    float v11 = a1[3];
  }
  else {
    float v11 = a2[3];
  }
  float v12 = v10 - v4;
  float result = 0.0;
  float v14 = fmaxf(v12, 0.0) * fmaxf(v11 - v5, 0.0);
  if (v14 >= 0.00000011921) {
    return (float)((float)(fmaxf(v6 - *a1, 0.0) * fmaxf(v7 - v2, 0.0))
  }
                 + (float)(fmaxf(v8 - *a2, 0.0) * fmaxf(v9 - v3, 0.0)))
         / v14;
  return result;
}

float acDetRectOverlap(float *a1, float *a2)
{
  float v2 = a1[1];
  float v3 = a2[1];
  if (*a1 >= *a2) {
    float v4 = *a1;
  }
  else {
    float v4 = *a2;
  }
  if (v2 >= v3) {
    float v5 = a1[1];
  }
  else {
    float v5 = a2[1];
  }
  float v6 = a1[2];
  float v7 = a1[3];
  float v8 = a2[2];
  float v9 = a2[3];
  if (v6 >= v8) {
    float v10 = a2[2];
  }
  else {
    float v10 = a1[2];
  }
  if (v7 >= v9) {
    float v11 = a2[3];
  }
  else {
    float v11 = a1[3];
  }
  float v12 = v10 - v4;
  float result = 0.0;
  float v14 = fmaxf(v12, 0.0) * fmaxf(v11 - v5, 0.0);
  if (v14 >= 0.00000011921)
  {
    float v15 = (float)((float)(fmaxf(v6 - *a1, 0.0) * fmaxf(v7 - v2, 0.0))
                + (float)(fmaxf(v8 - *a2, 0.0) * fmaxf(v9 - v3, 0.0)))
        - v14;
    if (v15 >= 0.00000011921) {
      return v14 / v15;
    }
    else {
      return 0.0;
    }
  }
  return result;
}

float acDetRectOverlapSmallbox(float *a1, float *a2)
{
  float v2 = a1[1];
  float v3 = a2[1];
  if (*a1 >= *a2) {
    float v4 = *a1;
  }
  else {
    float v4 = *a2;
  }
  if (v2 >= v3) {
    float v5 = a1[1];
  }
  else {
    float v5 = a2[1];
  }
  float v6 = a1[2];
  float v7 = a1[3];
  float v8 = a2[2];
  float v9 = a2[3];
  if (v6 >= v8) {
    float v10 = a2[2];
  }
  else {
    float v10 = a1[2];
  }
  if (v7 >= v9) {
    float v11 = a2[3];
  }
  else {
    float v11 = a1[3];
  }
  float v12 = v10 - v4;
  float result = 0.0;
  float v14 = fmaxf(v12, 0.0) * fmaxf(v11 - v5, 0.0);
  if (v14 >= 0.00000011921)
  {
    float v15 = fmaxf(v8 - *a2, 0.0) * fmaxf(v9 - v3, 0.0);
    float v16 = fmaxf(v6 - *a1, 0.0) * fmaxf(v7 - v2, 0.0);
    if (v16 < v15) {
      float v15 = v16;
    }
    if (v15 >= 0.00000011921) {
      return v14 / v15;
    }
    else {
      return 0.0;
    }
  }
  return result;
}

float acRectIntersectOverUnion(float *a1, float *a2)
{
  float v2 = *a1;
  float v3 = a1[1];
  float v4 = a1[2];
  float v5 = a1[3];
  float v6 = *a1 + v4;
  float v7 = v3 + v5;
  float v9 = *a2;
  float v8 = a2[1];
  float result = 0.0;
  if (v6 > *a2 && v7 > v8)
  {
    float v12 = a2[2];
    float v13 = a2[3];
    float v14 = v8 + v13;
    if ((float)(v9 + v12) > v2 && v14 > v3)
    {
      if (v2 < v9) {
        float v2 = *a2;
      }
      if (v3 < v8) {
        float v3 = a2[1];
      }
      if (v6 >= (float)(v9 + v12)) {
        float v6 = v9 + v12;
      }
      if (v7 >= v14) {
        float v7 = v8 + v13;
      }
      float v16 = fmaxf(v6 - v2, 0.0) * fmaxf(v7 - v3, 0.0);
      return v16 / fmaxf((float)((float)(v4 * v5) + (float)(v12 * v13)) - v16, 0.00000011921);
    }
  }
  return result;
}

float acDetRectOverlapFirstBox(float32x2_t *a1, float32x2_t *a2)
{
  float32x2_t v2 = a1[1];
  float32x2_t v3 = vmaxnm_f32(vsub_f32(v2, *a1), 0);
  float32x2_t v4 = vmul_lane_f32(v3, v3, 1);
  float32x2_t v5 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(a2[1], v2), (int8x8_t)v2, (int8x8_t)a2[1]), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*a2, *a1), (int8x8_t)*a2, (int8x8_t)*a1)), 0);
  float32x2_t v6 = vmul_lane_f32(v5, v5, 1);
  BOOL v7 = v6.f32[0] < 0.00000011921 || v4.f32[0] < 0.00000011921;
  LODWORD(result) = vdiv_f32(v6, v4).u32[0];
  if (v7) {
    return 0.0;
  }
  return result;
}

float acDetRectOverlapSecondBox(float32x2_t *a1, float32x2_t *a2)
{
  float32x2_t v2 = a2[1];
  float32x2_t v3 = vmaxnm_f32(vsub_f32(v2, *a2), 0);
  float32x2_t v4 = vmul_lane_f32(v3, v3, 1);
  float32x2_t v5 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v2, a1[1]), (int8x8_t)a1[1], (int8x8_t)v2), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*a2, *a1), (int8x8_t)*a2, (int8x8_t)*a1)), 0);
  float32x2_t v6 = vmul_lane_f32(v5, v5, 1);
  BOOL v7 = v6.f32[0] < 0.00000011921 || v4.f32[0] < 0.00000011921;
  LODWORD(result) = vdiv_f32(v6, v4).u32[0];
  if (v7) {
    return 0.0;
  }
  return result;
}

BOOL acDetRectScoreCompare(float *a1, float *a2)
{
  return a1[6] < a2[6];
}

BOOL acDetRectSizeCompare(float *a1, float *a2)
{
  return (float)((float)(a1[3] - a1[1]) * (float)(a1[2] - *a1)) < (float)((float)(a2[3] - a2[1]) * (float)(a2[2] - *a2));
}

BOOL acDetRectClassCompare(_DWORD *a1, _DWORD *a2)
{
  return a1[4] < a2[4];
}

BOOL acDetRectClassCompareReverse(_DWORD *a1, _DWORD *a2)
{
  return a1[4] > a2[4];
}

uint64_t acDetRectFilterByScore(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = 0;
  if (a2)
  {
    uint64_t v4 = a2;
    float32x2_t v5 = (float *)(a1 + 24);
    do
    {
      if (*v5 > *(float *)(a3 + 4 * *((unsigned int *)v5 - 2)))
      {
        uint64_t v6 = v3;
        uint64_t v3 = (v3 + 1);
        long long v7 = *(_OWORD *)(v5 - 2);
        float v8 = (_OWORD *)(a1 + 32 * v6);
        *float v8 = *(_OWORD *)(v5 - 6);
        v8[1] = v7;
      }
      v5 += 8;
      --v4;
    }
    while (v4);
  }
  return v3;
}

float32_t acDetRectFromFace@<S0>(uint64_t a1@<X0>, float32x2_t *a2@<X8>)
{
  float32x2_t v2 = *(float32x2_t *)(a1 + 12);
  float32x2_t v3 = vadd_f32(v2, *(float32x2_t *)(a1 + 20));
  *a2 = v2;
  a2[1] = v3;
  unsigned int v4 = *(_DWORD *)(a1 + 8) - 1;
  if (v4 > 0xB) {
    __int32 v5 = 0;
  }
  else {
    __int32 v5 = dword_246D9F5DC[v4];
  }
  a2[2].i32[0] = v5;
  float32_t result = (float)*(unsigned int *)(a1 + 28) / 1000.0;
  a2[3].f32[0] = result;
  return result;
}

float32_t acDetRectFromFaceInternal@<S0>(uint64_t a1@<X0>, float32x2_t *a2@<X8>)
{
  float32x2_t v2 = *(float32x2_t *)(a1 + 12);
  float32x2_t v3 = vadd_f32(v2, *(float32x2_t *)(a1 + 20));
  *a2 = v2;
  a2[1] = v3;
  unsigned int v4 = *(_DWORD *)(a1 + 8) - 1;
  if (v4 > 0xB) {
    __int32 v5 = 0;
  }
  else {
    __int32 v5 = dword_246D9F5DC[v4];
  }
  a2[2].i32[0] = v5;
  float32_t result = (float)*(unsigned int *)(a1 + 28) / 1000.0;
  a2[3].f32[0] = result;
  return result;
}

float acDetRectFromAcSalientFace@<S0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_DWORD *)(a2 + 16) = *(_DWORD *)(a1 + 16);
  float result = *(float *)(a1 + 24);
  *(float *)(a2 + 24) = result;
  return result;
}

void acFaceSkinToneMapping(uint64_t a1, double a2, int32x2_t a3)
{
  if (*(unsigned char *)(a1 + 440))
  {
    uint64_t v4 = a1 + 404;
    *(float *)a3.i32 = (float)*(int *)(a1 + 420) / 1000.0;
    int32x2_t v36 = a3;
    float v5 = (float)(*(float *)a3.i32 + -0.1) * (float)(*(float *)a3.i32 + -0.1);
    float v6 = 1.0 / expf(v5 * 40.0);
    float32x4_t v29 = (float32x4_t)vdupq_lane_s32(v36, 0);
    float32x4_t v7 = vaddq_f32(v29, (float32x4_t)xmmword_246D9F150);
    float32x4_t v33 = vmulq_f32(vmulq_f32(v7, v7), (float32x4_t)xmmword_246D9F160);
    float v30 = expf(v33.f32[1]);
    v8.f32[0] = expf(v33.f32[0]);
    v8.f32[1] = v30;
    float32x4_t v31 = v8;
    float v9 = expf(v33.f32[2]);
    float32x4_t v10 = v31;
    v10.f32[2] = v9;
    float32x4_t v32 = v10;
    float v11 = expf(v33.f32[3]);
    float32x4_t v12 = v32;
    v12.f32[3] = v11;
    __asm { FMOV            V0.4S, #1.0 }
    float32x4_t v34 = vdivq_f32(_Q0, v12);
    float v18 = 1.0 / expf(v5 * 8.0);
    float v19 = 1.0 / expf((float)((float)(*(float *)v36.i32 + -0.88) * (float)(*(float *)v36.i32 + -0.88)) * 8.0);
    float32x2_t v20 = vadd_f32(*(float32x2_t *)v29.f32, (float32x2_t)0xBF266666BE75C28FLL);
    *(float32x2_t *)v32.f32 = vmul_f32(v20, v20);
    float v21 = 1.0 / expf(80.0 * v32.f32[0]);
    *(float *)v22.i32 = v34.f32[3] + (float)(v34.f32[2] + (float)(v34.f32[1] + (float)(v34.f32[0] + (float)(v6 + v21))));
    *(_DWORD *)(a1 + 396) = (int)(float)((float)(v6 / *(float *)v22.i32) * 1000.0);
    *(_DWORD *)(a1 + 400) = (int)(float)((float)(v21 / *(float *)v22.i32) * 1000.0);
    float32x4_t v23 = vdivq_f32(v34, (float32x4_t)vdupq_lane_s32(v22, 0));
    float32x4_t v35 = (float32x4_t)vdupq_n_s32(0x447A0000u);
    int32x4_t v24 = vcvtq_s32_f32(vmulq_f32(v23, v35));
    *(int32x4_t *)uint64_t v4 = v24;
    v24.i32[0] = 1047904911;
    v24.i32[0] = vdup_lane_s32(*(int32x2_t *)v24.i8, 0).u32[0];
    v24.i32[1] = v36.i32[0];
    __asm { FMOV            V1.2S, #16.0 }
    *(float32x2_t *)v24.i8 = vmul_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)v24.i8, (float32x2_t)(v29.u32[0] | 0x3F26666600000000)), (int8x8_t)0x4100000041000000, _D1), *(float32x2_t *)v32.f32);
    v32.i32[0] = v24.i32[0];
    v36.i32[0] = expf(*(float *)&v24.i32[1]);
    v26.f32[0] = expf(v32.f32[0]);
    v26.i32[1] = v36.i32[0];
    __asm { FMOV            V1.2S, #1.0 }
    float32x2_t v28 = vdiv_f32(_D1, v26);
    _D1.f32[0] = v19 + (float)(v28.f32[1] + (float)(v18 + v28.f32[0]));
    *(_DWORD *)(a1 + 424) = (int)(float)((float)(v18 / _D1.f32[0]) * 1000.0);
    *(int32x2_t *)(v4 + 24) = vcvt_s32_f32(vmul_f32(vdiv_f32(v28, (float32x2_t)vdup_lane_s32((int32x2_t)_D1, 0)), *(float32x2_t *)v35.f32));
    *(_DWORD *)(a1 + 436) = (int)(float)((float)(v19 / _D1.f32[0]) * 1000.0);
  }
}

uint64_t acTrkGroupCheckNewArgmin(const float *a1, int a2, int a3, unsigned int a4, uint64_t a5, unsigned int *a6)
{
  if (!a4) {
    return *a6;
  }
  float v6 = 3.4028e38;
  if (a3)
  {
    int v7 = a2;
    uint64_t v8 = a4;
    do
    {
      if (a1[v7] < v6) {
        float v6 = a1[v7];
      }
      v7 += a3;
      --v8;
    }
    while (v8);
  }
  else
  {
    int v9 = a4 * a2;
    uint64_t v10 = a4;
    do
    {
      if (a1[v9] < v6) {
        float v6 = a1[v9];
      }
      ++v9;
      --v10;
    }
    while (v10);
  }
  if (a3)
  {
    uint64_t v11 = 0;
    unsigned int v12 = 0;
    do
    {
      if (vabds_f32(v6, a1[a2]) < 0.00000011921) {
        a6[v12++] = v11;
      }
      ++v11;
      a2 += a3;
    }
    while (a4 != v11);
  }
  else
  {
    uint64_t v13 = 0;
    unsigned int v12 = 0;
    do
    {
      if (vabds_f32(v6, a1[a4 * a2 + v13]) < 0.00000011921) {
        a6[v12++] = v13;
      }
      ++v13;
    }
    while (a4 != v13);
  }
  if (!v12) {
    return *a6;
  }
  uint64_t v14 = v12;
  float v15 = a6;
  while (1)
  {
    int v16 = *v15++;
    if (v16 == a5) {
      break;
    }
    if (!--v14) {
      return *a6;
    }
  }
  return a5;
}

uint64_t acTrkObjectSetUpFeatureMunkresCost(uint64_t result, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float32x4_t *a9)
{
  if (a2 <= a4) {
    uint64_t v9 = a4;
  }
  else {
    uint64_t v9 = a2;
  }
  if (v9)
  {
    unint64_t v10 = 0;
    unsigned int v11 = 0;
    uint64_t v188 = v9 & 0xFFFFFFF8;
    int v189 = v9 - 1;
    int v181 = v9 - 1 - a4;
    unsigned int v187 = v9 - a4;
    uint64_t v180 = (v9 - a4) & 0xFFFFFFF8;
    unsigned int v179 = v180 + a4;
    uint64_t v12 = result + 1136;
    uint64_t v13 = result + 1392;
    uint64_t v14 = &a9->i8[4];
    uint64_t v185 = a3 + 132;
    uint64_t v195 = a3 + 136;
    uint64_t v196 = result + 884;
    unsigned int v178 = (float32x2_t *)(a3 + 20);
    *(void *)&long long v15 = 0x4000000040000000;
    *((void *)&v15 + 1) = 0x4000000040000000;
    uint64_t v16 = a4;
    uint64_t v198 = a5;
    uint64_t v199 = a8;
    unsigned int v184 = a4;
    uint64_t v197 = a3;
    uint64_t v182 = v9;
    uint64_t v183 = result;
    do
    {
      if (v10 >= a2)
      {
        int v155 = 0;
        BOOL v156 = __CFADD__(v11, v189);
        if (v9 < 8) {
          goto LABEL_104;
        }
        if (v156) {
          goto LABEL_104;
        }
        uint64_t v157 = v188;
        unsigned int v158 = v11;
        do
        {
          long long v159 = (_OWORD *)(a5 + 4 * v158);
          *long long v159 = v15;
          v159[1] = v15;
          v158 += 8;
          v157 -= 8;
        }
        while (v157);
        v11 += v188;
        int v155 = v188;
        if (v9 != v188)
        {
LABEL_104:
          int v160 = v9 - v155;
          do
          {
            *(_DWORD *)(a5 + 4 * v11++) = 0x40000000;
            --v160;
          }
          while (v160);
        }
        goto LABEL_6;
      }
      uint64_t v17 = result + 1724 * v10;
      int v18 = *(_DWORD *)(v17 + 8);
      float32x4_t v19 = *(float32x4_t *)(v17 + 880);
      float32x4_t v20 = *(float32x4_t *)(v17 + 896);
      float32x4_t v21 = *(float32x4_t *)(v17 + 928);
      a9[2] = *(float32x4_t *)(v17 + 912);
      a9[3] = v21;
      *a9 = v19;
      a9[1] = v20;
      float32x4_t v22 = *(float32x4_t *)(v17 + 944);
      float32x4_t v23 = *(float32x4_t *)(v17 + 960);
      float32x4_t v24 = *(float32x4_t *)(v17 + 992);
      a9[6] = *(float32x4_t *)(v17 + 976);
      a9[7] = v24;
      a9[4] = v22;
      a9[5] = v23;
      float32x4_t v25 = *(float32x4_t *)(v17 + 1008);
      float32x4_t v26 = *(float32x4_t *)(v17 + 1024);
      float32x4_t v27 = *(float32x4_t *)(v17 + 1056);
      a9[10] = *(float32x4_t *)(v17 + 1040);
      a9[11] = v27;
      a9[8] = v25;
      a9[9] = v26;
      float32x4_t v28 = *(float32x4_t *)(v17 + 1072);
      float32x4_t v29 = *(float32x4_t *)(v17 + 1088);
      float32x4_t v30 = *(float32x4_t *)(v17 + 1120);
      a9[14] = *(float32x4_t *)(v17 + 1104);
      a9[15] = v30;
      a9[12] = v28;
      a9[13] = v29;
      if (a4)
      {
        uint64_t v31 = 0;
        unsigned int v32 = 0;
        float v33 = *(float *)a8;
        float32x2_t v34 = *(float32x2_t *)(v17 + 12);
        float32x2_t v35 = vadd_f32(v34, *(float32x2_t *)(v17 + 20));
        unint64_t v191 = v10;
        unint64_t v210 = (unsigned int *)(result + 1724 * v10 + 512);
        int v208 = *(unsigned __int8 *)(a8 + 64);
        int v209 = *(unsigned __int8 *)(a8 + 65);
        int v36 = *(unsigned __int8 *)(a8 + 58);
        int v207 = *(unsigned __int8 *)(a8 + 57);
        int v206 = *(unsigned __int8 *)(a8 + 19);
        float32x2_t v37 = vsub_f32(v35, v34);
        int32x2_t v38 = vcgtz_f32(v37);
        float v39 = v37.f32[1];
        float v40 = 0.0;
        if ((v38.i8[4] & 1) == 0) {
          float v39 = 0.0;
        }
        if ((v38.i8[0] & 1) == 0) {
          v37.f32[0] = 0.0;
        }
        float v41 = v37.f32[0] * v39;
        uint64_t v42 = v185;
        unsigned int v193 = *(_DWORD *)(a8 + 124);
        int v194 = *(unsigned __int8 *)(a8 + 120);
        float v192 = (float)*(unsigned int *)(a7 + 80);
        unsigned int v43 = v11;
        uint64_t v205 = v12;
        float v204 = *(float *)a8;
        float32x2_t v203 = v35;
        float v202 = v37.f32[0] * v39;
        int v200 = *(unsigned __int8 *)(a8 + 58);
        int v201 = v18;
        do
        {
          if (v18 == 9 && *(_DWORD *)(a3 + (v31 << 9) + 8) == 9)
          {
            if (v209)
            {
              uint64_t v44 = 0;
              do
              {
                a9->f32[v44] = (float)(a9->f32[v44] * 0.5) + (float)(*(float *)(v12 + v44 * 4) * 0.5);
                ++v44;
              }
              while ((v44 * 4) != 256);
              uint64_t v45 = 0;
              int32x2_t v46 = 0;
              do
              {
                *(float *)v46.i32 = (float)(*(float *)v46.i32 + (float)(a9->f32[v45] * a9->f32[v45]))
                                  + (float)(a9->f32[v45 + 1] * a9->f32[v45 + 1]);
                v45 += 2;
              }
              while (v45 != 64);
              *(float *)v46.i32 = (float)(1.0 / sqrtf(*(float *)v46.i32)) + 0.0000001;
              float32x4_t v47 = (float32x4_t)vdupq_lane_s32(v46, 0);
              float32x4_t v48 = vdivq_f32(a9[1], v47);
              *a9 = vdivq_f32(*a9, v47);
              a9[1] = v48;
              float32x4_t v49 = vdivq_f32(a9[3], v47);
              a9[2] = vdivq_f32(a9[2], v47);
              a9[3] = v49;
              float32x4_t v50 = vdivq_f32(a9[5], v47);
              a9[4] = vdivq_f32(a9[4], v47);
              a9[5] = v50;
              float32x4_t v51 = vdivq_f32(a9[7], v47);
              a9[6] = vdivq_f32(a9[6], v47);
              a9[7] = v51;
              float32x4_t v52 = vdivq_f32(a9[9], v47);
              a9[8] = vdivq_f32(a9[8], v47);
              a9[9] = v52;
              float32x4_t v53 = vdivq_f32(a9[11], v47);
              a9[10] = vdivq_f32(a9[10], v47);
              a9[11] = v53;
              float32x4_t v54 = vdivq_f32(a9[13], v47);
              a9[12] = vdivq_f32(a9[12], v47);
              a9[13] = v54;
              float32x4_t v55 = vdivq_f32(a9[14], v47);
              float32x4_t v56 = vdivq_f32(a9[15], v47);
              a9[14] = v55;
              a9[15] = v56;
            }
            if (v208)
            {
              uint64_t v57 = 0;
              float v58 = *(float *)(a8 + 112);
              float v59 = *(float *)(a8 + 116);
              do
              {
                a9->f32[v57] = (float)(a9->f32[v57] * v59) + (float)(*(float *)(v13 + v57 * 4) * v58);
                ++v57;
              }
              while ((v57 * 4) != 256);
              uint64_t v60 = 0;
              int32x2_t v61 = 0;
              do
              {
                *(float *)v61.i32 = (float)(*(float *)v61.i32 + (float)(a9->f32[v60] * a9->f32[v60]))
                                  + (float)(a9->f32[v60 + 1] * a9->f32[v60 + 1]);
                v60 += 2;
              }
              while (v60 != 64);
              *(float *)v61.i32 = sqrtf(*(float *)v61.i32) + 0.0000001;
              float32x4_t v62 = (float32x4_t)vdupq_lane_s32(v61, 0);
              float32x4_t v63 = vdivq_f32(a9[1], v62);
              *a9 = vdivq_f32(*a9, v62);
              a9[1] = v63;
              float32x4_t v64 = vdivq_f32(a9[3], v62);
              a9[2] = vdivq_f32(a9[2], v62);
              a9[3] = v64;
              float32x4_t v65 = vdivq_f32(a9[5], v62);
              a9[4] = vdivq_f32(a9[4], v62);
              a9[5] = v65;
              float32x4_t v66 = vdivq_f32(a9[7], v62);
              a9[6] = vdivq_f32(a9[6], v62);
              a9[7] = v66;
              float32x4_t v67 = vdivq_f32(a9[9], v62);
              a9[8] = vdivq_f32(a9[8], v62);
              a9[9] = v67;
              float32x4_t v68 = vdivq_f32(a9[11], v62);
              a9[10] = vdivq_f32(a9[10], v62);
              a9[11] = v68;
              float32x4_t v69 = vdivq_f32(a9[13], v62);
              a9[12] = vdivq_f32(a9[12], v62);
              a9[13] = v69;
              float32x4_t v70 = vdivq_f32(a9[14], v62);
              float32x4_t v71 = vdivq_f32(a9[15], v62);
              a9[14] = v70;
              a9[15] = v71;
            }
            uint64_t v72 = 0;
            float v73 = 0.0;
            float v74 = 0.0;
            float v75 = 0.0;
            do
            {
              float v76 = *(float *)(v42 + v72 * 4);
              float v77 = *(float *)(v42 + v72 * 4 + 4);
              float v78 = a9->f32[v72];
              float v79 = *(float *)&v14[v72 * 4];
              float v73 = (float)(v73 + (float)(v78 * v78)) + (float)(v79 * v79);
              float v74 = (float)(v74 + (float)(v76 * v76)) + (float)(v77 * v77);
              float v75 = (float)(v75 + (float)(v76 * v78)) + (float)(v77 * v79);
              v72 += 2;
            }
            while (v72 != 64);
            float v80 = fmaxf(1.0 - (float)(v75 / (float)((float)(sqrtf(v74) * sqrtf(v73)) + 0.00001)), 0.0);
            if (v80 <= 1.0 || v36 == 0) {
              float v82 = v80;
            }
            else {
              float v82 = 1.0;
            }
            if (v207)
            {
              float v211 = v40;
              unsigned int v212 = v32;
              unsigned int v213 = v43;
              uint64_t v83 = 0;
              float v84 = 0.0;
              float v85 = 0.0;
              float v86 = 0.0;
              do
              {
                float v87 = *(float *)(v42 + v83 * 4);
                float v88 = *(float *)(v42 + v83 * 4 + 4);
                float v89 = a9->f32[v83];
                float v90 = *(float *)&v14[v83 * 4];
                float v84 = (float)(v84 + (float)(v89 * v89)) + (float)(v90 * v90);
                float v85 = (float)(v85 + (float)(v87 * v87)) + (float)(v88 * v88);
                float v86 = (float)(v86 + (float)(v87 * v89)) + (float)(v88 * v90);
                v83 += 2;
              }
              while (v83 != 64);
              uint64_t v91 = 0;
              float v92 = (float)(sqrtf(v85) * sqrtf(v84)) + 0.00001;
              float v93 = 0.0;
              uint64_t v94 = v196;
              do
              {
                uint64_t v95 = 0;
                float v96 = 0.0;
                float v97 = 0.0;
                float v98 = 0.0;
                do
                {
                  float v99 = *(float *)(v42 + v95);
                  float v100 = *(float *)(v42 + v95 + 4);
                  float v101 = *(float *)(v94 + v95 - 4);
                  float v102 = *(float *)(v94 + v95);
                  float v96 = (float)(v96 + (float)(v101 * v101)) + (float)(v102 * v102);
                  float v97 = (float)(v97 + (float)(v99 * v99)) + (float)(v100 * v100);
                  float v98 = (float)(v98 + (float)(v99 * v101)) + (float)(v100 * v102);
                  v95 += 8;
                }
                while (v95 != 256);
                float v93 = v93
                    + expf((float)((float)(v98 / (float)((float)(sqrtf(v97) * sqrtf(v96)) + 0.00001)) + -1.0) + 1.0);
                ++v91;
                v94 += 1724;
              }
              while (v91 != a2);
              uint64_t v103 = 0;
              float v104 = 0.0;
              uint64_t v105 = v195;
              do
              {
                uint64_t v106 = 0;
                float v107 = 0.0;
                float v108 = 0.0;
                float v109 = 0.0;
                do
                {
                  float v110 = a9->f32[v106];
                  float v111 = a9->f32[v106 + 1];
                  float v112 = *(float *)(v105 + v106 * 4 - 4);
                  float v113 = *(float *)(v105 + v106 * 4);
                  float v107 = (float)(v107 + (float)(v112 * v112)) + (float)(v113 * v113);
                  float v108 = (float)(v108 + (float)(v110 * v110)) + (float)(v111 * v111);
                  float v109 = (float)(v109 + (float)(v110 * v112)) + (float)(v111 * v113);
                  v106 += 2;
                }
                while (v106 != 64);
                float v104 = v104
                     + expf((float)((float)(v109 / (float)((float)(sqrtf(v108) * sqrtf(v107)) + 0.00001)) + -1.0) + 1.0);
                ++v103;
                v105 += 512;
              }
              while (v103 != v16);
              float v114 = expf((float)((float)(v86 / v92) + -1.0) + 1.0);
              float v82 = 1.0
                  - (float)((float)((float)(v114 / (float)(v93 + 0.000001)) * 0.5)
                          + (float)((float)(v114 / (float)(v104 + 0.000001)) * 0.5));
              a5 = v198;
              a8 = v199;
              a3 = v197;
              uint64_t v12 = v205;
              float v33 = v204;
              float32x2_t v35 = v203;
              float v41 = v202;
              int v36 = v200;
              int v18 = v201;
              unsigned int v32 = v212;
              unsigned int v43 = v213;
              float v40 = v211;
            }
            *(float *)(a5 + 4 * v43) = v82;
            float v115 = 1.0 - v82;
            if (v206 && !*v210)
            {
              uint64_t v116 = a3 + (v31 << 9);
              float32x2_t v117 = *(float32x2_t *)(v116 + 12);
              float32x2_t v118 = vadd_f32(v117, *(float32x2_t *)(v116 + 20));
              int8x8_t v119 = (int8x8_t)vcgt_f32(v34, v117);
              int8x8_t v120 = (int8x8_t)vcgt_f32(v35, v118);
              float32x2_t v121 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8(v120, (int8x8_t)v118, (int8x8_t)v35), (float32x2_t)vbsl_s8(v119, (int8x8_t)v34, (int8x8_t)v117)), 0);
              float v122 = vmul_lane_f32(v121, v121, 1).f32[0];
              float32x2_t v123 = vsub_f32(v118, v117);
              float32x2_t v124 = vmaxnm_f32(v123, 0);
              float v125 = (float)(vmul_lane_f32(v124, v124, 1).f32[0] + v41) - v122;
              if (v125 >= 0.00000011921) {
                float v126 = v122 / v125;
              }
              else {
                float v126 = 0.0;
              }
              if (v122 >= 0.00000011921) {
                float v127 = v126;
              }
              else {
                float v127 = 0.0;
              }
              float32x2_t v128 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8(v120, (int8x8_t)v35, (int8x8_t)v118), (float32x2_t)vbsl_s8(v119, (int8x8_t)v117, (int8x8_t)v34)), 0);
              v128.f32[0] = vmul_lane_f32(v128, v128, 1).f32[0];
              BOOL v171 = v128.f32[0] < 0.00000011921;
              float v129 = (float)((float)(fmaxf(v123.f32[0], 0.0) * fmaxf(v123.f32[1], 0.0)) + v41) / v128.f32[0];
              if (v171) {
                float v129 = 0.0;
              }
              if (v127 > 0.0) {
                float v130 = v127;
              }
              else {
                float v130 = v129;
              }
              BOOL v131 = v129 >= *(float *)(a8 + 12) || v127 > 0.0;
              float v82 = 1.0 - (float)((float)(v130 * 0.02) + (float)(v115 * 0.98));
              if (!v131) {
                float v82 = 1.0;
              }
              *(float *)(a5 + 4 * v43) = v82;
            }
            if (v115 > v33 && *(unsigned char *)(a8 + 20) != 0)
            {
              uint64_t v133 = a3 + (v31 << 9);
              float32x2_t v134 = *(float32x2_t *)(v133 + 12);
              float32x2_t v135 = vadd_f32(v134, *(float32x2_t *)(v133 + 20));
              float32x2_t v136 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v35, v135), (int8x8_t)v135, (int8x8_t)v35), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v34, v134), (int8x8_t)v34, (int8x8_t)v134)), 0);
              float v137 = vmul_lane_f32(v136, v136, 1).f32[0];
              float32x2_t v138 = vsub_f32(v135, v134);
              float v139 = (float)((float)(fmaxf(v138.f32[0], 0.0) * fmaxf(v138.f32[1], 0.0)) + v41) - v137;
              if (v139 >= 0.00000011921) {
                float v140 = v137 / v139;
              }
              else {
                float v140 = 0.0;
              }
              if (v137 < 0.00000011921) {
                float v140 = 0.0;
              }
              float v141 = *(float *)(a8 + 52);
              unsigned int v142 = *v210;
              if (v194)
              {
                BOOL v143 = v193 >= v142;
                unsigned int v144 = v193 - v142;
                float v145 = v141 * (float)((float)v144 / (float)v193);
                if (v144 == 0 || !v143) {
                  float v145 = 0.0;
                }
              }
              else
              {
                float v145 = v141 * (float)((float)(v192 - (float)v142) / v192);
              }
              float v146 = (float)(v140 * v145) + (float)((float)(1.0 - v145) * v115);
              float v82 = 1.0 - v146;
              if (v146 > 1.0) {
                float v82 = 0.0;
              }
              *(float *)(a5 + 4 * v43) = v82;
            }
            if (v36 && (float)(1.0 - v82) < v33)
            {
              *(_DWORD *)(a5 + 4 * v43) = 1065353216;
              float v82 = 1.0;
            }
          }
          else
          {
            *(_DWORD *)(a5 + 4 * v43) = 0x40000000;
            float v82 = 2.0;
          }
          if ((float)(1.0 - v82) > v33)
          {
            uint64_t v147 = a3 + (v31 << 9);
            float32x2_t v148 = *(float32x2_t *)(v147 + 12);
            float32x2_t v149 = vadd_f32(v148, *(float32x2_t *)(v147 + 20));
            float32x2_t v150 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v35, v149), (int8x8_t)v149, (int8x8_t)v35), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v34, v148), (int8x8_t)v34, (int8x8_t)v148)), 0);
            float v151 = vmul_lane_f32(v150, v150, 1).f32[0];
            float v152 = 0.0;
            if (v151 >= 0.00000011921)
            {
              float32x2_t v153 = vsub_f32(v149, v148);
              v153.f32[0] = (float)((float)(fmaxf(v153.f32[0], 0.0) * fmaxf(v153.f32[1], 0.0)) + v41) - v151;
              float v154 = v151 / v153.f32[0];
              if (v153.f32[0] >= 0.00000011921) {
                float v152 = v154;
              }
              else {
                float v152 = 0.0;
              }
            }
            ++v32;
            if (v152 > v40) {
              float v40 = v152;
            }
          }
          ++v31;
          ++v43;
          v42 += 512;
        }
        while (v31 != v16);
        if (*(unsigned char *)(a8 + 16) && v32 >= 2)
        {
          a4 = v184;
          uint64_t v9 = v182;
          float result = v183;
          unint64_t v10 = v191;
          if (!*v210 && v18 == 9)
          {
            uint64_t v161 = v16;
            unsigned int v162 = v178;
            do
            {
              float32x2_t v163 = v162[-1];
              float32x2_t v164 = vadd_f32(v163, *v162);
              float32x2_t v165 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v35, v164), (int8x8_t)v164, (int8x8_t)v35), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v34, v163), (int8x8_t)v34, (int8x8_t)v163)), 0);
              float v166 = vmul_lane_f32(v165, v165, 1).f32[0];
              float v167 = 0.0;
              if (v166 >= 0.00000011921)
              {
                float32x2_t v168 = vsub_f32(v164, v163);
                v168.f32[0] = (float)((float)(fmaxf(v168.f32[0], 0.0) * fmaxf(v168.f32[1], 0.0)) + v41) - v166;
                float v169 = v166 / v168.f32[0];
                if (v168.f32[0] >= 0.00000011921) {
                  float v167 = v169;
                }
                else {
                  float v167 = 0.0;
                }
              }
              BOOL v171 = (float)(1.0 - *(float *)(a5 + 4 * v11)) > v33 && v167 <= 0.7 && v167 < (float)(v40 + -0.005);
              if (v171) {
                *(_DWORD *)(a5 + 4 * v11) = 1065353216;
              }
              v162 += 64;
              ++v11;
              --v161;
            }
            while (v161);
          }
          unsigned int v11 = v43;
        }
        else
        {
          unsigned int v11 = v43;
          a4 = v184;
          uint64_t v9 = v182;
          float result = v183;
          unint64_t v10 = v191;
        }
        *(void *)&long long v15 = 0x4000000040000000;
        *((void *)&v15 + 1) = 0x4000000040000000;
      }
      if (a4 < a2)
      {
        BOOL v172 = __CFADD__(v11, v181);
        if (v187 < 8 || v172)
        {
          unsigned int v176 = a4;
        }
        else
        {
          uint64_t v173 = v180;
          unsigned int v174 = v11;
          do
          {
            char v175 = (_OWORD *)(a5 + 4 * v174);
            *char v175 = v15;
            v175[1] = v15;
            v174 += 8;
            v173 -= 8;
          }
          while (v173);
          v11 += v180;
          unsigned int v176 = v179;
          if (v187 == v180) {
            goto LABEL_6;
          }
        }
        int v177 = v9 - v176;
        do
        {
          *(_DWORD *)(a5 + 4 * v11++) = 0x40000000;
          --v177;
        }
        while (v177);
      }
LABEL_6:
      ++v10;
      v12 += 1724;
      v13 += 1724;
    }
    while (v10 != v9);
  }
  return result;
}

_OWORD *acTrkObjectSetUpIoUMunkresCost(_OWORD *result, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  if (a2 <= a4) {
    uint64_t v5 = a4;
  }
  else {
    uint64_t v5 = a2;
  }
  if (!v5) {
    return result;
  }
  if (a4)
  {
    unint64_t v6 = 0;
    unsigned int v7 = 0;
    unsigned int v8 = v5 - a4;
    int v9 = v5 & 0xFFFFFFF8;
    int v10 = (v5 - a4) & 0xFFFFFFF8;
    *(void *)&long long v11 = 0x4000000040000000;
    *((void *)&v11 + 1) = 0x4000000040000000;
    while (1)
    {
      if (v6 >= a2)
      {
        int v33 = 0;
        BOOL v34 = __CFADD__(v7, v5 - 1);
        if (v5 < 8) {
          goto LABEL_32;
        }
        if (v34) {
          goto LABEL_32;
        }
        uint64_t v35 = v5 & 0xFFFFFFF8;
        unsigned int v36 = v7;
        do
        {
          float32x2_t v37 = (_OWORD *)(a5 + 4 * v36);
          *float32x2_t v37 = v11;
          v37[1] = v11;
          v36 += 8;
          v35 -= 8;
        }
        while (v35);
        v7 += v9;
        int v33 = v5 & 0xFFFFFFF8;
        if (v5 != v9)
        {
LABEL_32:
          int v38 = v5 - v33;
          do
          {
            *(_DWORD *)(a5 + 4 * v7++) = 0x40000000;
            --v38;
          }
          while (v38);
        }
        goto LABEL_7;
      }
      uint64_t v12 = (char *)result + 1724 * v6;
      int v13 = *((_DWORD *)v12 + 2);
      float32x2_t v14 = *(float32x2_t *)(v12 + 12);
      float32x2_t v15 = vadd_f32(v14, *(float32x2_t *)(v12 + 20));
      float32x2_t v16 = vsub_f32(v15, v14);
      int32x2_t v17 = vcgtz_f32(v16);
      float v18 = v16.f32[1];
      if ((v17.i8[4] & 1) == 0) {
        float v18 = 0.0;
      }
      if ((v17.i8[0] & 1) == 0) {
        v16.f32[0] = 0.0;
      }
      float v19 = v16.f32[0] * v18;
      unsigned int v20 = v7 + 1;
      uint64_t v21 = a4;
      float32x4_t v22 = (float32x2_t *)(a3 + 12);
      do
      {
        unsigned int v25 = v7;
        unsigned int v26 = v20;
        float32x2_t v27 = vadd_f32(*v22, v22[1]);
        float32x2_t v28 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v15, v27), (int8x8_t)v27, (int8x8_t)v15), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v14, *v22), (int8x8_t)v14, (int8x8_t)*v22)), 0);
        float v29 = vmul_lane_f32(v28, v28, 1).f32[0];
        float v30 = 0.0;
        if (v29 >= 0.00000011921)
        {
          float32x2_t v31 = vsub_f32(v27, *v22);
          v31.f32[0] = (float)((float)(fmaxf(v31.f32[0], 0.0) * fmaxf(v31.f32[1], 0.0)) + v19) - v29;
          float v32 = v29 / v31.f32[0];
          if (v31.f32[0] >= 0.00000011921) {
            float v30 = v32;
          }
          else {
            float v30 = 0.0;
          }
        }
        BOOL v23 = v22[-1].i32[1] == 9 && v13 == 9;
        float v24 = 1.0 - v30;
        if (!v23) {
          float v24 = 2.0;
        }
        *(float *)(a5 + 4 * v7++) = v24;
        v22 += 64;
        ++v20;
        --v21;
      }
      while (v21);
      if (a4 < a2)
      {
        if (v8 < 8)
        {
          unsigned int v40 = a4;
        }
        else
        {
          unsigned int v39 = -2 - v25;
          unsigned int v40 = a4;
          uint64_t v41 = v8 & 0xFFFFFFF8;
          if (v39 >= v5 - 1 - a4)
          {
            do
            {
              uint64_t v42 = (_OWORD *)(a5 + 4 * v26);
              _OWORD *v42 = v11;
              v42[1] = v11;
              v26 += 8;
              v41 -= 8;
            }
            while (v41);
            v7 += v10;
            unsigned int v40 = v10 + a4;
            if (v8 == v10) {
              goto LABEL_7;
            }
          }
        }
        do
        {
          *(_DWORD *)(a5 + 4 * v7) = 0x40000000;
          ++v40;
          ++v7;
        }
        while (v40 < v5);
      }
LABEL_7:
      if (++v6 == v5) {
        return result;
      }
    }
  }
  if (v5 >= 8)
  {
    unsigned int v46 = 0;
    unint64_t v47 = 0;
    unsigned int v48 = v5 - 1;
    int v49 = v5 & 0xFFFFFFF8;
    *(void *)&long long v50 = 0x4000000040000000;
    *((void *)&v50 + 1) = 0x4000000040000000;
    int v51 = v5;
    while (1)
    {
      unsigned int v52 = ~v46;
      unsigned int v53 = v46;
      if (v47 >= a2)
      {
        if (v48 <= v52)
        {
          uint64_t v56 = v5 & 0xFFFFFFF8;
          unsigned int v57 = v46;
          do
          {
            float result = (_OWORD *)(a5 + 4 * v57);
            *float result = v50;
            result[1] = v50;
            v57 += 8;
            v56 -= 8;
          }
          while (v56);
          if (v5 == v49) {
            goto LABEL_59;
          }
          unsigned int v53 = v46 + v49;
        }
        do
          *(_DWORD *)(a5 + 4 * v53++) = 0x40000000;
        while (v51 != v53);
      }
      else
      {
        if (v48 <= v52)
        {
          uint64_t v54 = v5 & 0xFFFFFFF8;
          unsigned int v55 = v46;
          do
          {
            float result = (_OWORD *)(a5 + 4 * v55);
            *float result = v50;
            result[1] = v50;
            v55 += 8;
            v54 -= 8;
          }
          while (v54);
          if (v5 == v49) {
            goto LABEL_59;
          }
          unsigned int v53 = v46 + v49;
        }
        do
          *(_DWORD *)(a5 + 4 * v53++) = 0x40000000;
        while (v51 != v53);
      }
LABEL_59:
      ++v47;
      v46 += v5;
      v51 += v5;
      if (v47 == v5) {
        return result;
      }
    }
  }
  unsigned int v43 = 0;
  for (unint64_t i = 0; i != v5; ++i)
  {
    if (i >= a2)
    {
      *(_DWORD *)(a5 + 4 * v43) = 0x40000000;
      if (v5 != 1)
      {
        *(_DWORD *)(a5 + 4 * (v43 + 1)) = 0x40000000;
        if (v5 != 2)
        {
          *(_DWORD *)(a5 + 4 * (v43 + 2)) = 0x40000000;
          if (v5 != 3)
          {
            *(_DWORD *)(a5 + 4 * (v43 + 3)) = 0x40000000;
            if (v5 != 4)
            {
              *(_DWORD *)(a5 + 4 * (v43 + 4)) = 0x40000000;
              if (v5 != 5)
              {
                *(_DWORD *)(a5 + 4 * (v43 + 5)) = 0x40000000;
                if (v5 != 6) {
                  *(_DWORD *)(a5 + 4 * (v43 + 6)) = 0x40000000;
                }
              }
            }
          }
        }
      }
    }
    else
    {
      int v45 = 0;
      do
        *(_DWORD *)(a5 + 4 * (v43 + v45++)) = 0x40000000;
      while (v5 != v45);
    }
    v43 += v5;
  }
  return result;
}

uint64_t acTrkObjectFeatureAssocCore(_DWORD *a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _DWORD *a10, uint64_t a11, uint64_t a12, uint64_t a13, unsigned int a14, unsigned int a15, uint64_t a16, unsigned int a17)
{
  unsigned int v19 = a2;
  uint64_t v21 = a10;
  *a10 = 0;
  if (!a2) {
    goto LABEL_9;
  }
  if (a2 == 1)
  {
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v22 = a2 & 0xFFFFFFFE;
    BOOL v23 = a1;
    uint64_t v24 = v22;
    do
    {
      v23[132] = 0;
      v23[563] = 0;
      v23[112] = 1;
      v23[543] = 1;
      v23 += 862;
      v24 -= 2;
    }
    while (v24);
    if (v22 == a2) {
      goto LABEL_9;
    }
  }
  uint64_t v25 = a2 - v22;
  unsigned int v26 = &a1[431 * v22 + 112];
  do
  {
    v26[20] = 0;
    *unsigned int v26 = 1;
    v26 += 431;
    --v25;
  }
  while (v25);
LABEL_9:
  if (a2 <= a4) {
    uint64_t result = a4;
  }
  else {
    uint64_t result = a2;
  }
  if (result)
  {
    unint64_t v28 = 0;
    uint64_t v29 = a9;
    if (a4 <= 1) {
      uint64_t v30 = 1;
    }
    else {
      uint64_t v30 = a4;
    }
    uint64_t v139 = v30;
    unint64_t v31 = a4;
    uint64_t v32 = a17;
    uint64_t v33 = a3 + 136;
    float32x2_t v138 = (float32x2_t *)(a3 + 20);
    float v34 = 10.0;
    uint64_t v140 = a8;
    unint64_t v141 = v31;
    uint64_t v145 = a6;
    uint64_t v146 = a3;
    uint64_t v143 = a5;
    uint64_t v144 = result;
    while (1)
    {
      unsigned int v36 = *(_DWORD *)(a5 + 4 * v28);
      if (v28 >= v31)
      {
        int v45 = &a1[431 * v36];
        unsigned int v46 = v45[128] + 1;
        v45[128] = v46;
        uint64_t v47 = v45[2];
        if v47 < 9 && ((0x13Fu >> v47))
        {
          unsigned int v48 = dword_246D9F220[v47];
        }
        else if ((v47 & 0xFFFFFFFE) == 0xA)
        {
          unsigned int v48 = 6;
        }
        else
        {
          unsigned int v48 = 5;
        }
        goto LABEL_128;
      }
      if (v36 >= v19)
      {
        uint64_t v49 = *v21;
        *uint64_t v21 = v49 + 1;
        *(_DWORD *)(v29 + 4 * v49) = v28;
        goto LABEL_19;
      }
      float v37 = *(float *)a7;
      if (*(unsigned char *)(a7 + 56)) {
        float v37 = fminf(v37 + (float)(fmaxf(roundf((float)(a1[431 * v36 + 128] - 30) / v34), 0.0) * 0.1), 0.6);
      }
      if (!*(unsigned char *)(a7 + 88)) {
        goto LABEL_45;
      }
      uint64_t v38 = a3 + (v28 << 9);
      float v41 = *(float *)(v38 + 12);
      float v40 = *(float *)(v38 + 16);
      uint64_t v39 = v38 + 12;
      float v42 = *(float *)(v39 + 12);
      if (v41 < 20.0 || v40 < 20.0) {
        break;
      }
      float v44 = *(float *)(v39 + 8);
      float v50 = (float)(v40 + v42) - (float)a15;
      if ((float)((float)(v41 + v44) - (float)a14) > -20.0 || v50 > -20.0) {
        goto LABEL_42;
      }
LABEL_45:
      uint64_t v147 = (unsigned int *)(a3 + (v28 << 9) + 28);
      if (*v147 <= 1)
      {
        if (a1[431 * v36 + 128] <= *(_DWORD *)(a7 + 40)) {
          unsigned int v53 = (float *)(a7 + 32);
        }
        else {
          unsigned int v53 = (float *)(a7 + 36);
        }
        float v37 = *v53;
      }
      uint64_t v54 = 0;
      unsigned int v55 = &a1[431 * v36];
      uint64_t v56 = a3 + (v28 << 9) + 132;
      uint64_t v57 = (uint64_t)&a1[431 * v36 + 285];
      float v58 = 0.0;
      float v59 = 0.0;
      float v60 = 0.0;
      do
      {
        float v61 = *(float *)(v33 + v54 - 4);
        float v62 = *(float *)(v33 + v54);
        float v63 = *(float *)(v57 + v54 - 4);
        float v64 = *(float *)(v57 + v54);
        float v58 = (float)(v58 + (float)(v63 * v63)) + (float)(v64 * v64);
        float v59 = (float)(v59 + (float)(v61 * v61)) + (float)(v62 * v62);
        float v60 = (float)(v60 + (float)(v61 * v63)) + (float)(v62 * v64);
        v54 += 8;
      }
      while (v54 != 256);
      BOOL v65 = (float)(1.0 - *(float *)(a6 + 4 * (v28 + v36 * result))) >= v37;
      float v66 = 1.0 - (float)(v60 / (float)((float)(sqrtf(v59) * sqrtf(v58)) + 0.00001));
      if (v66 <= 0.0) {
        float v67 = 1.0;
      }
      else {
        float v67 = 1.0 - v66;
      }
      if (v67 <= *(float *)(a7 + 28)) {
        BOOL v65 = 0;
      }
      if (v32)
      {
        unsigned int v68 = 0;
        unsigned int v69 = 0;
        uint64_t v70 = a3 + (v28 << 9);
        float32x4_t v71 = (float32x2_t *)(v70 + 12);
        uint64_t v72 = (float32x2_t *)(v70 + 20);
        uint64_t v73 = v32;
        float v74 = (float32x2_t *)(a16 + 12);
        do
        {
          if (v74[-1].i32[1] == 1)
          {
            float32x2_t v75 = *v74;
            float32x2_t v76 = vadd_f32(*v74, v74[1]);
            float32x2_t v77 = *(float32x2_t *)(v55 + 3);
            float32x2_t v78 = vadd_f32(v77, *(float32x2_t *)(v55 + 5));
            float32x2_t v79 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v76, v78), (int8x8_t)v78, (int8x8_t)v76), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v74, v77), (int8x8_t)*v74, (int8x8_t)v77)), 0);
            float v80 = vmul_lane_f32(v79, v79, 1).f32[0];
            float v81 = 0.0;
            float v82 = 0.0;
            if (v80 >= 0.00000011921)
            {
              float32x2_t v83 = vmaxnm_f32(vsub_f32(v76, v75), 0);
              float32x2_t v84 = vsub_f32(v78, v77);
              float32x2_t v85 = (float32x2_t)vdup_lane_s32((int32x2_t)v83, 0);
              v85.i32[0] = fmaxf(v84.f32[0], 0.0);
              v83.i32[0] = fmaxf(v84.f32[1], 0.0);
              float32x2_t v86 = vmul_f32(v85, v83);
              if (v86.f32[0] >= v86.f32[1]) {
                v86.f32[0] = v86.f32[1];
              }
              float v87 = v80 / v86.f32[0];
              if (v86.f32[0] >= 0.00000011921) {
                float v82 = v87;
              }
              else {
                float v82 = 0.0;
              }
            }
            float32x2_t v88 = *v71;
            float32x2_t v89 = vadd_f32(*v71, *v72);
            if (v82 > 0.5) {
              ++v68;
            }
            float32x2_t v90 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v76, v89), (int8x8_t)v89, (int8x8_t)v76), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v75, v88), (int8x8_t)v75, (int8x8_t)v88)), 0);
            float v91 = vmul_lane_f32(v90, v90, 1).f32[0];
            if (v91 >= 0.00000011921)
            {
              float32x2_t v92 = vmul_f32(vmaxnm_f32(vsub_f32((float32x2_t)vzip1_s32((int32x2_t)v89, (int32x2_t)v76), (float32x2_t)vzip1_s32((int32x2_t)v88, (int32x2_t)v75)), 0), vmaxnm_f32(vsub_f32((float32x2_t)vzip2_s32((int32x2_t)v89, (int32x2_t)v76), (float32x2_t)vzip2_s32((int32x2_t)v88, (int32x2_t)v75)), 0));
              if (v92.f32[0] >= v92.f32[1]) {
                v92.f32[0] = v92.f32[1];
              }
              if (v92.f32[0] >= 0.00000011921) {
                float v81 = v91 / v92.f32[0];
              }
              else {
                float v81 = 0.0;
              }
            }
            if (v81 > 0.5) {
              ++v69;
            }
          }
          v74 += 64;
          --v73;
        }
        while (v73);
      }
      else
      {
        unsigned int v69 = 0;
        unsigned int v68 = 0;
      }
      BOOL v94 = v69 < 2 && v68 < 2;
      if (!v65)
      {
        uint64_t v116 = *v21;
        *uint64_t v21 = v116 + 1;
        *(_DWORD *)(v29 + 4 * v116) = v28;
        float32x2_t v117 = &a1[431 * v36];
        unsigned int v46 = v117[128] + 1;
        v117[128] = v46;
        uint64_t v118 = v55[2];
        if v118 < 9 && ((0x13Fu >> v118))
        {
          unsigned int v48 = dword_246D9F220[v118];
        }
        else if ((v118 & 0xFFFFFFFE) == 0xA)
        {
          unsigned int v48 = 6;
        }
        else
        {
          unsigned int v48 = 5;
        }
LABEL_128:
        if (v46 < *(_DWORD *)(a8 + 4 * v48 + 60)) {
          int v35 = 1;
        }
        else {
          int v35 = 2;
        }
        a1[431 * v36 + 132] = v35;
        goto LABEL_19;
      }
      a1[431 * v36 + 128] = 0;
      if (!*(unsigned char *)(a8 + 176)) {
        goto LABEL_126;
      }
      uint64_t v95 = *(void *)v55;
      memcpy(&a1[431 * v36], (const void *)(a3 + (v28 << 9)), 0x200uLL);
      unsigned int v96 = 0;
      v55[112] = 0;
      a1[431 * v36 + 131] = *(_DWORD *)(a13 + 4 * v28);
      float32x2_t v97 = *(float32x2_t *)(v55 + 3);
      float32x2_t v98 = vadd_f32(v97, *(float32x2_t *)(v55 + 5));
      float32x2_t v99 = vsub_f32(v98, v97);
      int32x2_t v100 = vcgtz_f32(v99);
      *(void *)unsigned int v55 = v95;
      float v101 = v99.f32[1];
      if ((v100.i8[4] & 1) == 0) {
        float v101 = 0.0;
      }
      if ((v100.i8[0] & 1) == 0) {
        v99.f32[0] = 0.0;
      }
      float v102 = v99.f32[0] * v101;
      float v103 = *(float *)(a7 + 68);
      uint64_t v105 = v138;
      uint64_t v104 = v139;
      do
      {
        float32x2_t v107 = v105[-1];
        float32x2_t v108 = vadd_f32(v107, *v105);
        float32x2_t v109 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v108, v98), (int8x8_t)v98, (int8x8_t)v108), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v107, v97), (int8x8_t)v107, (int8x8_t)v97)), 0);
        float v110 = vmul_lane_f32(v109, v109, 1).f32[0];
        if (v110 >= 0.00000011921)
        {
          float32x2_t v112 = vsub_f32(v108, v107);
          float v113 = (float)(v102 + (float)(fmaxf(v112.f32[0], 0.0) * fmaxf(v112.f32[1], 0.0))) - v110;
          if (v113 >= 0.00000011921) {
            float v114 = v110 / v113;
          }
          else {
            float v114 = 0.0;
          }
          if (v114 < v103)
          {
LABEL_91:
            int v106 = 0;
            goto LABEL_92;
          }
          float v115 = fmaxf(v112.f32[0], 0.0) * fmaxf(v112.f32[1], 0.0);
          if (v102 < v115) {
            float v115 = v102;
          }
          float v111 = v110 / v115;
          if (v115 < 0.00000011921) {
            float v111 = 0.0;
          }
        }
        else
        {
          float v111 = 0.0;
          if (v103 > 0.0) {
            goto LABEL_91;
          }
        }
        int v106 = v111 >= *(float *)(a7 + 72);
LABEL_92:
        v96 += v106;
        v105 += 64;
        --v104;
      }
      while (v104);
      if (*(unsigned char *)(a7 + 66)) {
        int v119 = v94;
      }
      else {
        int v119 = 1;
      }
      if (*(unsigned char *)(a7 + 67)) {
        BOOL v120 = v96 >= 2;
      }
      else {
        BOOL v120 = 0;
      }
      char v121 = !v120;
      uint64_t result = v144;
      a6 = v145;
      if (v119 == 1 && (v121 & 1) != 0)
      {
        float v122 = (float32x4_t *)&a1[431 * v36];
        updateEmbeddedFeat((float32x4_t *)v56, v122 + 55, 0x40u);
        uint64_t result = v144;
        a6 = v145;
        v122[104] = *(float32x4_t *)(v146 + (v28 << 9) + 12);
      }
      float32x2_t v123 = (float *)&a1[431 * v36];
      a8 = v140;
      a3 = v146;
      float v34 = 10.0;
      if (v123[412] < (float)*v147)
      {
        float32x4_t v124 = *(float32x4_t *)v56;
        long long v125 = *(_OWORD *)(v56 + 16);
        long long v126 = *(_OWORD *)(v56 + 48);
        *(_OWORD *)&a1[431 * v36 + 292] = *(_OWORD *)(v56 + 32);
        *(_OWORD *)&a1[431 * v36 + 296] = v126;
        *(float32x4_t *)&a1[431 * v36 + 284] = v124;
        *(_OWORD *)&a1[431 * v36 + 288] = v125;
        long long v127 = *(_OWORD *)(v56 + 64);
        long long v128 = *(_OWORD *)(v56 + 80);
        long long v129 = *(_OWORD *)(v56 + 112);
        *(_OWORD *)&a1[431 * v36 + 308] = *(_OWORD *)(v56 + 96);
        *(_OWORD *)&a1[431 * v36 + 312] = v129;
        *(_OWORD *)&a1[431 * v36 + 300] = v127;
        *(_OWORD *)&a1[431 * v36 + 304] = v128;
        long long v130 = *(_OWORD *)(v56 + 128);
        long long v131 = *(_OWORD *)(v56 + 144);
        long long v132 = *(_OWORD *)(v56 + 176);
        *(_OWORD *)&a1[431 * v36 + 324] = *(_OWORD *)(v56 + 160);
        *(_OWORD *)&a1[431 * v36 + 328] = v132;
        *(_OWORD *)&a1[431 * v36 + 316] = v130;
        *(_OWORD *)&a1[431 * v36 + 320] = v131;
        long long v133 = *(_OWORD *)(v56 + 192);
        long long v134 = *(_OWORD *)(v56 + 208);
        long long v135 = *(_OWORD *)(v56 + 240);
        *(_OWORD *)&a1[431 * v36 + 340] = *(_OWORD *)(v56 + 224);
        *(_OWORD *)&a1[431 * v36 + 344] = v135;
        *(_OWORD *)&a1[431 * v36 + 332] = v133;
        *(_OWORD *)&a1[431 * v36 + 336] = v134;
        v123[412] = (float)*v147;
      }
      float32x2_t v136 = &a1[431 * v36];
      v136[413] = 0;
      a5 = v143;
      unsigned int v19 = a2;
      uint64_t v32 = a17;
      uint64_t v21 = a10;
      unint64_t v31 = v141;
      uint64_t v29 = a9;
      if (!(v136[130] % *(_DWORD *)(a7 + 60)))
      {
        float v137 = (float32x4_t *)&a1[431 * v36];
        updateEmbeddedFeat((float32x4_t *)v56, v137 + 87, 0x40u);
        unint64_t v31 = v141;
        uint64_t v29 = a9;
        uint64_t v32 = a17;
        uint64_t v21 = a10;
        uint64_t result = v144;
        a6 = v145;
        unsigned int v19 = a2;
        a3 = v146;
        a5 = v143;
        v137[105] = *(float32x4_t *)(v146 + (v28 << 9) + 12);
      }
LABEL_126:
      *(_DWORD *)(a11 + 4 * v2_Block_object_dispose(&STACK[0x488], 8) = v36;
LABEL_19:
      ++v28;
      v33 += 512;
      if (v28 == result) {
        return result;
      }
    }
    float v44 = *(float *)(a3 + (v28 << 9) + 20);
LABEL_42:
    int v52 = a1[431 * v36 + 128];
    if (v52 && (float)((float)(v44 * v42) / (float)((float)(a15 * a14) + 0.0001)) < *(float *)(a7 + 92)) {
      float v37 = fminf((float)(fmaxf((float)(v52 - 30) / 30.0, 0.0) * 0.25) + 0.4, 0.9);
    }
    goto LABEL_45;
  }
  return result;
}

uint64_t acTrkObjectIoUAssocCore(_DWORD *a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, unsigned int *a10, uint64_t a11, uint64_t a12, void *__dst, uint64_t a14, uint64_t a15, unsigned int a16)
{
  uint64_t v22 = *a10;
  uint64_t result = (uint64_t)memcpy(__dst, a9, 4 * v22);
  if (!a2) {
    goto LABEL_9;
  }
  if (a2 == 1)
  {
    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v24 = a2 & 0xFFFFFFFE;
    uint64_t v25 = a1;
    uint64_t v26 = v24;
    do
    {
      v25[132] = 0;
      v25[563] = 0;
      v25[112] = 1;
      v25[543] = 1;
      v25 += 862;
      v26 -= 2;
    }
    while (v26);
    if (v24 == a2) {
      goto LABEL_9;
    }
  }
  uint64_t v27 = a2 - v24;
  unint64_t v28 = &a1[431 * v24 + 112];
  do
  {
    v28[20] = 0;
    *unint64_t v28 = 1;
    v28 += 431;
    --v27;
  }
  while (v27);
LABEL_9:
  if (a2 <= a4) {
    uint64_t v29 = a4;
  }
  else {
    uint64_t v29 = a2;
  }
  if (v29)
  {
    unsigned int v30 = v22;
    if (*a10)
    {
      uint64_t v142 = a6;
      uint64_t v140 = a7;
      unint64_t v31 = 0;
      uint64_t result = a16;
      if (a4 <= 1) {
        uint64_t v34 = 1;
      }
      else {
        uint64_t v34 = a4;
      }
      unint64_t v35 = a4;
      uint64_t v37 = a3;
      uint64_t v36 = a8;
      uint64_t v38 = a3 + 136;
      uint64_t v39 = a1 + 285;
      float v40 = (float32x2_t *)(a15 + 12);
      float v41 = (int *)__dst;
      while (1)
      {
        uint64_t v42 = *a10;
        if (!v42) {
          goto LABEL_20;
        }
        unsigned int v43 = *(_DWORD *)(a5 + 4 * v31);
        float v44 = (int *)a9;
        while (1)
        {
          int v45 = *v44++;
          if (v31 == v45) {
            break;
          }
          if (!--v42) {
            goto LABEL_20;
          }
        }
        if (v43 < a2)
        {
          unsigned int v46 = &a1[431 * v43];
          unsigned int v47 = v46[128] - 1;
          if (v47 < *(_DWORD *)(v36 + 24) && v31 < v35)
          {
            uint64_t v48 = 0;
            float v49 = *(float *)(v36 + 8) + (float)((float)v47 * 0.2);
            unint64_t v141 = (float *)(v37 + (v31 << 9) + 132);
            float v50 = &v39[431 * v43];
            float v51 = 0.0;
            float v52 = 0.0;
            float v53 = 0.0;
            do
            {
              float v54 = *(float *)(v38 + v48 * 4 - 4);
              float v55 = *(float *)(v38 + v48 * 4);
              float v56 = *(float *)&v50[v48 - 1];
              float v57 = *(float *)&v50[v48];
              float v51 = (float)(v51 + (float)(v56 * v56)) + (float)(v57 * v57);
              float v52 = (float)(v52 + (float)(v54 * v54)) + (float)(v55 * v55);
              float v53 = (float)(v53 + (float)(v54 * v56)) + (float)(v55 * v57);
              v48 += 2;
            }
            while (v48 != 64);
            uint64_t v58 = v37 + (v31 << 9);
            float v59 = 1.0 - (float)(v53 / (float)((float)(sqrtf(v52) * sqrtf(v51)) + 0.00001));
            float v60 = v59 <= 0.0 ? 1.0 : 1.0 - v59;
            if (result)
            {
              float v61 = (float32x2_t *)(v58 + 12);
              float v62 = 0.0;
              uint64_t v63 = result;
              float v64 = v40;
              float v65 = 0.0;
              do
              {
                if (v64[-1].i32[1] == 1)
                {
                  float32x2_t v66 = *v64;
                  float32x2_t v67 = vadd_f32(*v64, v64[1]);
                  float32x2_t v68 = *(float32x2_t *)(v46 + 3);
                  float32x2_t v69 = vadd_f32(v68, *(float32x2_t *)(v46 + 5));
                  float32x2_t v70 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v67, v69), (int8x8_t)v69, (int8x8_t)v67), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v64, v68), (int8x8_t)*v64, (int8x8_t)v68)), 0);
                  float v71 = vmul_lane_f32(v70, v70, 1).f32[0];
                  float v72 = 0.0;
                  float v73 = 0.0;
                  if (v71 >= 0.00000011921)
                  {
                    float32x2_t v74 = vmaxnm_f32(vsub_f32(v67, v66), 0);
                    float32x2_t v75 = vsub_f32(v69, v68);
                    float32x2_t v76 = (float32x2_t)vdup_lane_s32((int32x2_t)v74, 0);
                    v76.i32[0] = fmaxf(v75.f32[0], 0.0);
                    v74.i32[0] = fmaxf(v75.f32[1], 0.0);
                    float32x2_t v77 = vmul_f32(v76, v74);
                    if (v77.f32[0] >= v77.f32[1]) {
                      v77.f32[0] = v77.f32[1];
                    }
                    float v78 = v71 / v77.f32[0];
                    if (v77.f32[0] >= 0.00000011921) {
                      float v73 = v78;
                    }
                    else {
                      float v73 = 0.0;
                    }
                  }
                  float32x2_t v79 = vadd_f32(*v61, *(float32x2_t *)(v58 + 20));
                  float32x2_t v80 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v67, v79), (int8x8_t)v79, (int8x8_t)v67), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v66, *v61), (int8x8_t)v66, (int8x8_t)*v61)), 0);
                  float v81 = vmul_lane_f32(v80, v80, 1).f32[0];
                  if (v81 >= 0.00000011921)
                  {
                    float32x2_t v82 = vmul_f32(vmaxnm_f32(vsub_f32((float32x2_t)vzip1_s32((int32x2_t)v79, (int32x2_t)v67), (float32x2_t)vzip1_s32((int32x2_t)*v61, (int32x2_t)v66)), 0), vmaxnm_f32(vsub_f32((float32x2_t)vzip2_s32((int32x2_t)v79, (int32x2_t)v67), (float32x2_t)vzip2_s32((int32x2_t)*v61, (int32x2_t)v66)), 0));
                    if (v82.f32[0] >= v82.f32[1]) {
                      v82.f32[0] = v82.f32[1];
                    }
                    if (v82.f32[0] >= 0.00000011921) {
                      float v72 = v81 / v82.f32[0];
                    }
                    else {
                      float v72 = 0.0;
                    }
                  }
                  if (v73 > 0.5) {
                    float v65 = v65 + 1.0;
                  }
                  if (v72 > 0.5) {
                    float v62 = v62 + 1.0;
                  }
                }
                v64 += 64;
                --v63;
              }
              while (v63);
            }
            else
            {
              float v65 = 0.0;
              float v62 = 0.0;
            }
            float v83 = fminf(v49, 1.0);
            BOOL v84 = v65 < 2.0 && v62 < 2.0;
            if ((float)(1.0 - *(float *)(v142 + 4 * (v31 + v43 * v29))) >= v83)
            {
              int v85 = v60 >= *(float *)(v36 + 28) || v84;
              if (v85 == 1) {
                break;
              }
            }
          }
        }
LABEL_20:
        ++v31;
        v38 += 512;
        if (v31 == v29) {
          goto LABEL_19;
        }
      }
      v46[128] = 0;
      if (!*(unsigned char *)(v140 + 176)) {
        goto LABEL_94;
      }
      BOOL v131 = v84;
      long long v132 = v40;
      long long v133 = v39;
      unint64_t v134 = v35;
      uint64_t v135 = a11;
      uint64_t v136 = result;
      unsigned int v137 = v30;
      uint64_t v86 = *(void *)v46;
      uint64_t v138 = v34;
      uint64_t v139 = a14;
      memcpy(&a1[431 * v43], (const void *)v58, 0x200uLL);
      uint64_t v34 = v138;
      a14 = v139;
      uint64_t v36 = a8;
      unsigned int v87 = 0;
      v46[112] = 0;
      *(void *)unsigned int v46 = v86;
      float32x2_t v88 = &a1[431 * v43];
      v88[132] = 0;
      float32x2_t v89 = *(float32x2_t *)(v46 + 3);
      float32x2_t v90 = vadd_f32(v89, *(float32x2_t *)(v46 + 5));
      float32x2_t v91 = vsub_f32(v90, v89);
      int32x2_t v92 = vcgtz_f32(v91);
      v88[131] = *(_DWORD *)(v139 + 4 * v31);
      float v93 = v91.f32[1];
      if ((v92.i8[4] & 1) == 0) {
        float v93 = 0.0;
      }
      if ((v92.i8[0] & 1) == 0) {
        v91.f32[0] = 0.0;
      }
      float v94 = v91.f32[0] * v93;
      float v95 = *(float *)(a8 + 80);
      uint64_t v96 = v138;
      float32x2_t v97 = (float32x2_t *)(a3 + 20);
      while (1)
      {
        float32x2_t v99 = v97[-1];
        float32x2_t v100 = vadd_f32(v99, *v97);
        float32x2_t v101 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v100, v90), (int8x8_t)v90, (int8x8_t)v100), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v99, v89), (int8x8_t)v99, (int8x8_t)v89)), 0);
        float v102 = vmul_lane_f32(v101, v101, 1).f32[0];
        if (v102 >= 0.00000011921)
        {
          float32x2_t v104 = vsub_f32(v100, v99);
          float v105 = (float)(v94 + (float)(fmaxf(v104.f32[0], 0.0) * fmaxf(v104.f32[1], 0.0))) - v102;
          if (v105 >= 0.00000011921) {
            float v106 = v102 / v105;
          }
          else {
            float v106 = 0.0;
          }
          if (v106 >= v95)
          {
            float v107 = fmaxf(v104.f32[0], 0.0) * fmaxf(v104.f32[1], 0.0);
            if (v94 < v107) {
              float v107 = v94;
            }
            float v103 = v102 / v107;
            if (v107 < 0.00000011921) {
              float v103 = 0.0;
            }
LABEL_82:
            int v98 = v103 >= *(float *)(a8 + 84);
            goto LABEL_70;
          }
        }
        else
        {
          float v103 = 0.0;
          if (v95 <= 0.0) {
            goto LABEL_82;
          }
        }
        int v98 = 0;
LABEL_70:
        v87 += v98;
        v97 += 64;
        if (!--v96)
        {
          char v108 = v131;
          if (!*(unsigned char *)(a8 + 78)) {
            char v108 = 1;
          }
          BOOL v109 = v87 < 2 || *(unsigned char *)(a8 + 77) == 0;
          uint64_t v37 = a3;
          if (v109 && (v108 & 1) != 0)
          {
            updateEmbeddedFeat((float32x4_t *)v141, (float32x4_t *)&a1[431 * v43 + 220], 0x40u);
            uint64_t v34 = v138;
            a14 = v139;
            uint64_t v37 = a3;
            uint64_t v36 = a8;
            *(_OWORD *)&a1[431 * v43 + 416] = *(_OWORD *)(a3 + (v31 << 9) + 12);
          }
          uint64_t v110 = v37 + (v31 << 9);
          unsigned int v112 = *(_DWORD *)(v110 + 28);
          float v111 = (unsigned int *)(v110 + 28);
          float v113 = (float *)&a1[431 * v43];
          uint64_t result = v136;
          unsigned int v30 = v137;
          float v41 = (int *)__dst;
          unint64_t v35 = v134;
          a11 = v135;
          float v40 = v132;
          uint64_t v39 = v133;
          if (v113[412] < (float)v112)
          {
            float32x4_t v114 = *(float32x4_t *)v141;
            long long v115 = *((_OWORD *)v141 + 1);
            long long v116 = *((_OWORD *)v141 + 3);
            *(_OWORD *)&a1[431 * v43 + 292] = *((_OWORD *)v141 + 2);
            *(_OWORD *)&a1[431 * v43 + 296] = v116;
            *(float32x4_t *)&a1[431 * v43 + 284] = v114;
            *(_OWORD *)&a1[431 * v43 + 288] = v115;
            long long v117 = *((_OWORD *)v141 + 4);
            long long v118 = *((_OWORD *)v141 + 5);
            long long v119 = *((_OWORD *)v141 + 7);
            *(_OWORD *)&a1[431 * v43 + 308] = *((_OWORD *)v141 + 6);
            *(_OWORD *)&a1[431 * v43 + 312] = v119;
            *(_OWORD *)&a1[431 * v43 + 300] = v117;
            *(_OWORD *)&a1[431 * v43 + 304] = v118;
            long long v120 = *((_OWORD *)v141 + 8);
            long long v121 = *((_OWORD *)v141 + 9);
            long long v122 = *((_OWORD *)v141 + 11);
            *(_OWORD *)&a1[431 * v43 + 324] = *((_OWORD *)v141 + 10);
            *(_OWORD *)&a1[431 * v43 + 328] = v122;
            *(_OWORD *)&a1[431 * v43 + 316] = v120;
            *(_OWORD *)&a1[431 * v43 + 320] = v121;
            long long v123 = *((_OWORD *)v141 + 12);
            long long v124 = *((_OWORD *)v141 + 13);
            long long v125 = *((_OWORD *)v141 + 15);
            *(_OWORD *)&a1[431 * v43 + 340] = *((_OWORD *)v141 + 14);
            *(_OWORD *)&a1[431 * v43 + 344] = v125;
            *(_OWORD *)&a1[431 * v43 + 332] = v123;
            *(_OWORD *)&a1[431 * v43 + 336] = v124;
            v113[412] = (float)*v111;
          }
LABEL_94:
          *(_DWORD *)(a11 + 4 * v31) = v43;
          if (v30)
          {
            int v126 = 0;
            uint64_t v127 = v30;
            long long v128 = v41;
            do
            {
              int v130 = *v128++;
              int v129 = v130;
              if (v31 != v130) {
                v41[v126++] = v129;
              }
              --v127;
            }
            while (v127);
          }
          --v30;
          goto LABEL_20;
        }
      }
    }
  }
  else
  {
    unsigned int v30 = v22;
  }
LABEL_19:
  *a10 = v30;
  return result;
}

double AcSaliencyNode::AcSaliencyNode(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 12_Block_object_dispose(&STACK[0x488], 8) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x488], 8) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 184) = 0;
  *(_DWORD *)(a2 + _Block_object_dispose(&STACK[0x488], 8) = 0;
  *(void *)&double result = 0xDE7C00000001;
  *(void *)a2 = 0xDE7C00000001;
  return result;
}

{
  double result;

  *(_DWORD *)(a1 + 12_Block_object_dispose(&STACK[0x488], 8) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x488], 8) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 184) = 0;
  *(_DWORD *)(a2 + _Block_object_dispose(&STACK[0x488], 8) = 0;
  *(void *)&double result = 0xDE7C00000001;
  *(void *)a2 = 0xDE7C00000001;
  return result;
}

void AcSaliencyNode::~AcSaliencyNode(AcSaliencyNode *this)
{
  uint64_t v2 = *((void *)this + 17);
  if (v2)
  {
    MEMORY[0x24C548B00](v2, 0x1000C8077774924);
    *((void *)this + 17) = 0;
  }
}

{
  uint64_t v2;

  uint64_t v2 = *((void *)this + 17);
  if (v2)
  {
    MEMORY[0x24C548B00](v2, 0x1000C8077774924);
    *((void *)this + 17) = 0;
  }
}

uint64_t AcSaliencyNode::init(uint64_t a1, _DWORD *a2)
{
  if (*a2 != 1) {
    return 4294967289;
  }
  int v2 = a2[1];
  if (v2 == 56956 || v2 == 56945)
  {
    *(_DWORD *)(a1 + 12_Block_object_dispose(&STACK[0x488], 8) = 1045220557;
    *(_OWORD *)(a1 + 64) = xmmword_246D9F680;
    *(_OWORD *)(a1 + 80) = unk_246D9F690;
    *(_OWORD *)(a1 + 96) = xmmword_246D9F6A0;
    *(_OWORD *)(a1 + 112) = unk_246D9F6B0;
    *(_OWORD *)a1 = kAcSaliencyNodeConfigDefaultRawData;
    *(_OWORD *)(a1 + 16) = unk_246D9F650;
    *(_OWORD *)(a1 + 32) = xmmword_246D9F660;
    strcpy((char *)(a1 + 48), "saliency@output");
    *(_DWORD *)(a1 + 144) = 51604;
    operator new[]();
  }
  return 4294967292;
}

void AcSaliencyNode::postProcess(uint64_t a1, uint64_t *a2, int a3, _DWORD *a4, uint64_t a5)
{
  if (*a4 == 1 && a3 == 1 && a4[1] == 56945)
  {
    *(_DWORD *)(a5 + 21024) = 3145792;
    *(_WORD *)(a5 + 2102_Block_object_dispose(&STACK[0x488], 8) = 64;
    std::chrono::steady_clock::now();
    AcSaliencyNode::postProcessSaliency(a1, a2, 1, v8, a5, v9, v10, v11, v12);
  }
}

__n128 AcSaliencyNode::postProcessSaliency(uint64_t a1, uint64_t *a2, int a3, int a4, uint64_t a5, double a6, float a7, double a8, float a9)
{
  uint64_t v9 = a5 + 17912;
  *(_DWORD *)(a5 + 17912) = 0;
  if (a3)
  {
    uint64_t v13 = a5 + 17952;
    unsigned int v14 = *(unsigned __int16 *)(a5 + 21026);
    if (*(_WORD *)(a5 + 21026))
    {
      unsigned int v15 = 0;
      uint64_t v16 = *a2;
      unsigned __int16 v17 = *(_WORD *)(a5 + 21024);
      LOWORD(v1_Block_object_dispose(&STACK[0x488], 8) = v17;
      uint64_t v19 = a5 + 17952;
      do
      {
        if ((_WORD)v18)
        {
          unint64_t v21 = 0;
          do
          {
            LOWORD(a7) = *(_WORD *)(a5 + 21026);
            float v22 = *(float *)(v16
                           + 4
                           * ((float)((float)(*((_DWORD *)a2 + 3) * v21)
                                                  / (float)(unsigned __int16)v18)
                            + *((_DWORD *)a2 + 3)
                            * (float)((float)(*((_DWORD *)a2 + 2) * v15) / (float)LODWORD(a7))))
                * *(float *)(a1 + 44);
            a7 = v22 * 255.0;
            int v23 = (int)(float)(v22 * 255.0);
            if (v22 <= 0.0) {
              LOBYTE(v23) = 0;
            }
            *(unsigned char *)(v19 + v21++) = v23;
            unint64_t v18 = *(unsigned __int16 *)(a5 + 21024);
          }
          while (v21 < v18);
          unsigned int v14 = *(unsigned __int16 *)(a5 + 21026);
          unsigned __int16 v17 = *(_WORD *)(a5 + 21024);
        }
        else
        {
          LOWORD(v1_Block_object_dispose(&STACK[0x488], 8) = 0;
        }
        uint64_t v20 = *(unsigned __int16 *)(a5 + 21028);
        v19 += v20;
        ++v15;
      }
      while (v15 < v14);
    }
    else
    {
      unsigned __int16 v17 = *(_WORD *)(a5 + 21024);
      LODWORD(v20) = *(unsigned __int16 *)(a5 + 21028);
    }
    *(unsigned char *)(a5 + 21030) = 1;
    uint64_t v38 = a5 + 17952;
    unsigned int v39 = v14;
    int v40 = v17;
    int v41 = v20;
    int v42 = 1;
    if (*(unsigned char *)(a1 + 184))
    {
      convertSaliencyMapToBoundingBoxes((uint64_t)&v38, a5, *(char **)(a1 + 136), *(_DWORD *)(a1 + 144), *(unsigned __int8 *)(a1 + 124), a1 + 148, 50, *(float *)(a1 + 112), *(float *)(a1 + 116));
      unsigned int v14 = *(unsigned __int16 *)(v9 + 3114);
    }
    if (v14)
    {
      unsigned int v24 = 0;
      int v25 = 0;
      uint64_t v26 = *a2;
      LOWORD(v27) = *(_WORD *)(v9 + 3112);
      do
      {
        if ((_WORD)v27)
        {
          unint64_t v28 = 0;
          float v29 = (float)v24;
          do
          {
            LOWORD(a9) = *(_WORD *)(v9 + 3114);
            float v30 = *(float *)(v26
                           + 4
                           * ((float)((float)(*((_DWORD *)a2 + 3) * v28)
                                                  / (float)(unsigned __int16)v27)
                            + *((_DWORD *)a2 + 3)
                            * (float)((float)(*((_DWORD *)a2 + 2) * v24) / (float)LODWORD(a9))))
                * *(float *)(a1 + 44);
            float v31 = (float)(v30 - *(float *)(a1 + 120)) / (float)(1.0 - *(float *)(a1 + 120));
            float v32 = 0.0;
            if (v31 >= 0.0)
            {
              float v32 = (float)(v30 - *(float *)(a1 + 120)) / (float)(1.0 - *(float *)(a1 + 120));
              if (v31 > 1.0) {
                float v32 = 1.0;
              }
            }
            *(unsigned char *)(v13 + v2_Block_object_dispose(&STACK[0x488], 8) = (int)(float)(v32 * 255.0);
            a9 = *(float *)(v9 + 20);
            if (a9 <= v29)
            {
              float v33 = *(float *)(v9 + 16);
              if (v33 <= (float)v28 && (float)(v33 + *(float *)(v9 + 24)) > (float)v28)
              {
                a9 = a9 + *(float *)(v9 + 28);
                if (a9 > v29)
                {
                  unsigned int v34 = 1132396544;
                  LOBYTE(v34) = *(unsigned char *)(a1 + 125);
                  a9 = (float)v34;
                  if ((float)(v30 * 255.0) > a9) {
                    ++v25;
                  }
                }
              }
            }
            ++v28;
            unint64_t v27 = *(unsigned __int16 *)(v9 + 3112);
          }
          while (v28 < v27);
          unsigned int v14 = *(unsigned __int16 *)(v9 + 3114);
        }
        else
        {
          LOWORD(v27) = 0;
        }
        v13 += *(unsigned __int16 *)(v9 + 3116);
        ++v24;
      }
      while (v24 < v14);
    }
    else
    {
      int v25 = 0;
    }
    *(_DWORD *)(v9 + 32) = v25;
    if (*(_DWORD *)v9) {
      BOOL v35 = v25 == 0;
    }
    else {
      BOOL v35 = 1;
    }
    if (v35)
    {
      *(void *)(v9 + 32) = 0;
      *(_OWORD *)uint64_t v9 = 0u;
      *(_OWORD *)(v9 + 16) = 0u;
    }
    __n128 result = *(__n128 *)(a5 + 17916);
    long long v37 = *(_OWORD *)(a5 + 17932);
    *(_DWORD *)(a1 + 180) = *(_DWORD *)(a5 + 17948);
    *(_OWORD *)(a1 + 164) = v37;
    *(__n128 *)(a1 + 14_Block_object_dispose(&STACK[0x488], 8) = result;
  }
  else
  {
    *(unsigned char *)(a5 + 21030) = 0;
  }
  return result;
}

uint64_t AcSaliencyNode::getParams(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  if (*a2 != 1) {
    return 4294967289;
  }
  if (a2[1] != 56945) {
    return 4294967292;
  }
  long long v5 = *(_OWORD *)(a1 + 20);
  *(void *)(a3 + 640) = *(void *)(a1 + 36);
  *(_OWORD *)(a3 + 624) = v5;
  strncpy((char *)(a3 + 2312), (const char *)(a1 + 48), 0x40uLL);
  uint64_t result = 0;
  *(_DWORD *)(a3 + 640) = *(_DWORD *)(a1 + 44);
  return result;
}

uint64_t AcSaliencyNode::computeConfidence(AcSaliencyNode *this, float a2)
{
  return (float)(powf(a2, *((float *)this + 32)) * 1000.0);
}

uint64_t acAssoPostProcess(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a1)
  {
    if (!*(void *)a1) {
      return 4294967292;
    }
    uint64_t v8 = *(void *)(a1 + 8);
    if (!v8 || !*(void *)(a1 + 16) || !*(void *)(a1 + 24)) {
      return 4294967292;
    }
    uint64_t v10 = 4294967292;
    if (a2 && a4 && a5)
    {
      uint64_t v13 = (int *)(a5 + 51740);
      if (*(unsigned char *)(a2 + 20) != 1)
      {
LABEL_13:
        uint64_t v14 = a5 + 12;
        uint64_t v10 = AcAssoNode::associationPreProc(v8, *(_DWORD *)a2, *(_DWORD *)(a2 + 4), *(_DWORD *)(a2 + 16), a2, (_DWORD *)(a1 + 32), a7, (_DWORD *)(a5 + 12));
        if (!v10)
        {
          uint64_t v15 = *(void *)(a1 + 8);
          int v16 = *(_DWORD *)a2;
          int v17 = *(_DWORD *)(a2 + 4);
          float v18 = *(float *)(a2 + 24);
          float v19 = *(float *)(a2 + 28);
          float v20 = *(float *)(a2 + 32);
          float v21 = *(float *)(a2 + 36);
          int v22 = *v13;
          long long v24 = *(_OWORD *)a3;
          uint64_t v25 = *(void *)(a3 + 16);
          uint64_t v10 = AcAssoNode::associationPostProc(v15, v16, v17, v22, &v24, v14, a1 + 32, (uint64_t)a4, v18, v19, v20, v21);
          if (!v10)
          {
            if (*a4 <= 3u) {
              return 0;
            }
            else {
              return 4294967292;
            }
          }
        }
        return v10;
      }
      if (*(_DWORD *)(a5 + 12) == 1 && (*(_DWORD *)(a5 + 16) | 8) == 0x721C9)
      {
        *uint64_t v13 = 0;
        *(_DWORD *)(a5 + 202376) = 0;
        *(void *)(a5 + 202384) = 0xBF80000000000000;
        *(_DWORD *)(a5 + 103464) = 0;
        *(_DWORD *)(a5 + 11906_Block_object_dispose(&STACK[0x488], 8) = 0;
        *(_DWORD *)(a5 + 134672) = 0;
        *(_DWORD *)(a5 + 186396) = 0;
        *(_DWORD *)(a5 + 202000) = 0;
        *(unsigned char *)(v8 + 74_Block_object_dispose(&STACK[0x488], 8) = 0;
        goto LABEL_13;
      }
      return 4294967289;
    }
    return v10;
  }
  return 4294967292;
}

uint64_t AcANSTCreate(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    operator new();
  }
  return 4294967292;
}

uint64_t AcANSTDestroy(uint64_t a1)
{
  if (!a1) {
    return 4294967292;
  }
  int v2 = *(AcDetNode **)a1;
  if (!v2 || !*(void *)(a1 + 8) || !*(void *)(a1 + 16) || !*(void *)(a1 + 24)) {
    return 4294967292;
  }
  AcDetNode::~AcDetNode(v2);
  MEMORY[0x24C548B20]();
  float32x2_t v3 = *(void **)(a1 + 8);
  if (v3)
  {
    if (*v3)
    {
      MEMORY[0x24C548B00](*v3, 0x1000C8077774924);
      void *v3 = 0;
    }
    MEMORY[0x24C548B20](v3, 0x1010C4009CF0F80);
  }
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    uint64_t v5 = *(void *)(v4 + 136);
    if (v5)
    {
      MEMORY[0x24C548B00](v5, 0x1000C8077774924);
      *(void *)(v4 + 136) = 0;
    }
    MEMORY[0x24C548B20](v4, 0x1010C404CE027BELL);
  }
  uint64_t v6 = *(void *)(a1 + 24);
  if (v6) {
    MEMORY[0x24C548B20](v6, 0x1000C40CA00EA9ELL);
  }
  MEMORY[0x24C548B20](a1, 0x1020C40383DF02ELL);
  return 0;
}

uint64_t AcANSTStart(void *a1, uint64_t a2)
{
  if (!a1) {
    return 4294967292;
  }
  if (!*a1) {
    return 4294967292;
  }
  uint64_t v2 = a1[1];
  if (!v2 || !a1[2] || !a1[3]) {
    return 4294967292;
  }
  *(_WORD *)(*a1 + 1421) = 0;
  if (*(_DWORD *)(a2 + 12) != 1 || (*(_DWORD *)(a2 + 16) | 8) != 0x721C9) {
    return 4294967289;
  }
  uint64_t result = 0;
  *(_DWORD *)(a2 + 51740) = 0;
  *(_DWORD *)(a2 + 202376) = 0;
  *(void *)(a2 + 202384) = 0xBF80000000000000;
  *(_DWORD *)(a2 + 103464) = 0;
  *(_DWORD *)(a2 + 11906_Block_object_dispose(&STACK[0x488], 8) = 0;
  *(_DWORD *)(a2 + 134672) = 0;
  *(_DWORD *)(a2 + 186396) = 0;
  *(_DWORD *)(a2 + 202000) = 0;
  *(unsigned char *)(v2 + 74_Block_object_dispose(&STACK[0x488], 8) = 0;
  return result;
}

uint64_t AcANSTStop(void *a1)
{
  if (!a1 || !*a1 || !a1[1]) {
    return 4294967292;
  }
  uint64_t v2 = a1[2];
  uint64_t result = 4294967292;
  if (v2)
  {
    if (a1[3]) {
      return 0;
    }
    else {
      return 4294967292;
    }
  }
  return result;
}

uint64_t AcANSTGetParams(uint64_t *a1, _DWORD *a2, uint64_t a3)
{
  if (!a1) {
    return 4294967292;
  }
  uint64_t v4 = *a1;
  if (!*a1 || !a1[1] || !a1[2] || !a1[3]) {
    return 4294967292;
  }
  uint64_t result = 4294967292;
  if (a2)
  {
    if (a3)
    {
      uint64_t result = AcDetNode::getParams(v4, a2, a3);
      if (!result)
      {
        uint64_t v9 = a2 + 50598;
        AcVisegNode::getParams(a1[3], v8, a3);
        if (*v9 != 1) {
          return 4294967289;
        }
        if (v9[1] == 56945)
        {
          uint64_t v10 = a1[2];
          long long v11 = *(_OWORD *)(v10 + 20);
          *(void *)(a3 + 640) = *(void *)(v10 + 36);
          *(_OWORD *)(a3 + 624) = v11;
          strncpy((char *)(a3 + 2312), (const char *)(v10 + 48), 0x40uLL);
          uint64_t result = 0;
          *(_DWORD *)(a3 + 640) = *(_DWORD *)(v10 + 44);
          return result;
        }
        return 4294967292;
      }
    }
  }
  return result;
}

uint64_t AcANSTSetRunViSeg(void *a1, char a2)
{
  if (!a1) {
    return 4294967292;
  }
  if (!*a1) {
    return 4294967292;
  }
  if (!a1[1]) {
    return 4294967292;
  }
  if (!a1[2]) {
    return 4294967292;
  }
  uint64_t v2 = a1[3];
  if (!v2) {
    return 4294967292;
  }
  uint64_t result = 0;
  *(unsigned char *)(v2 + 664) = a2;
  return result;
}

uint64_t AcANSTSetRunSaliency(void *a1, char a2)
{
  if (!a1) {
    return 4294967292;
  }
  if (!*a1) {
    return 4294967292;
  }
  if (!a1[1]) {
    return 4294967292;
  }
  uint64_t v2 = a1[2];
  if (!v2 || !a1[3]) {
    return 4294967292;
  }
  uint64_t result = 0;
  *(unsigned char *)(v2 + 185) = a2;
  return result;
}

uint64_t AcANSTSetRunSaliencyObjectDetection(void *a1, char a2)
{
  if (!a1) {
    return 4294967292;
  }
  if (!*a1) {
    return 4294967292;
  }
  if (!a1[1]) {
    return 4294967292;
  }
  uint64_t v2 = a1[2];
  if (!v2 || !a1[3]) {
    return 4294967292;
  }
  uint64_t result = 0;
  *(unsigned char *)(v2 + 184) = a2;
  return result;
}

uint64_t AcANSTGetProcedureId(AcANSTContext *a1, unsigned int *a2)
{
  if (!a1) {
    return 4294967292;
  }
  if (!*(void *)a1) {
    return 4294967292;
  }
  if (!*((void *)a1 + 1)) {
    return 4294967292;
  }
  uint64_t v2 = *((void *)a1 + 2);
  if (!v2) {
    return 4294967292;
  }
  uint64_t v3 = *((void *)a1 + 3);
  if (!v3) {
    return 4294967292;
  }
  int v4 = 2 * *(unsigned __int8 *)(v3 + 664);
  *a2 = v4;
  uint64_t result = 0;
  if (*(unsigned char *)(v2 + 185)) {
    *a2 = v4 | 1;
  }
  return result;
}

uint64_t AcANSTPreProcessRef(uint64_t *a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  if (!a1) {
    return 4294967292;
  }
  uint64_t v5 = *a1;
  if (!*a1) {
    return 4294967292;
  }
  if (!a1[1]) {
    return 4294967292;
  }
  uint64_t v6 = a1[2];
  if (!v6) {
    return 4294967292;
  }
  uint64_t v7 = a1[3];
  if (!v7) {
    return 4294967292;
  }
  uint64_t result = 4294967292;
  if (!a2) {
    return result;
  }
  if (!a4) {
    return result;
  }
  if (!a5) {
    return result;
  }
  float v12 = *(void **)a3;
  if (!*(void *)a3) {
    return result;
  }
  uint64_t v13 = *(void **)a5;
  if (!*(void *)a5) {
    return result;
  }
  uint64_t result = AcDetNode::getParams(v5, a4, (uint64_t)v23);
  if (result) {
    return result;
  }
  AcVisegNode::getParams(v7, v14, (uint64_t)v23);
  uint64_t result = AcSaliencyNode::getParams(v6, a4 + 50598, (uint64_t)v23);
  if (result) {
    return result;
  }
  unint64_t v15 = *(unsigned int *)(a3 + 12);
  if ((v15 & 3) != 0) {
    return 4294967292;
  }
  unint64_t v16 = *(unsigned int *)(a5 + 12);
  if (v16 != 4 * v23[1]) {
    return 4294967292;
  }
  vImagePixelCount v17 = *(unsigned int *)(a5 + 8);
  if (v17 != v23[0]) {
    return 4294967292;
  }
  size_t v18 = *(unsigned int *)(a5 + 16);
  uint64_t result = 4294967292;
  if (v18 >= v16 && (v18 & 0x3F) == 0)
  {
    vImagePixelCount v19 = v15 >> 2;
    vImagePixelCount v20 = *(unsigned int *)(a3 + 8);
    size_t v21 = *(unsigned int *)(a3 + 16);
    vImagePixelCount v22 = v16 >> 2;
    bzero(v13, (v18 * v17));
    src.data = v12;
    src.height = v20;
    src.width = v19;
    src.rowBytes = v21;
    dest.data = v13;
    dest.height = v17;
    dest.width = v22;
    dest.rowBytes = v18;
    if (vImageScale_ARGB8888(&src, &dest, 0, 8u)) {
      return 4294967288;
    }
    else {
      return 0;
    }
  }
  return result;
}

void AcANSTPostProcess(uint64_t *a1, uint32x2_t *a2, uint64_t *a3, _DWORD *a4, void *a5)
{
  v48[3] = *MEMORY[0x263EF8340];
  uint64_t v5 = *a3;
  if (*a3)
  {
    unint64_t v7 = *((unsigned int *)a3 + 2);
    if (v7)
    {
      uint64_t v8 = *((unsigned int *)a3 + 28);
      if (v8)
      {
        if (a1)
        {
          if (*a1)
          {
            if (a1[1])
            {
              uint64_t v10 = a1[2];
              if (v10)
              {
                if (a4)
                {
                  uint64_t v12 = a1[3];
                  if (v12)
                  {
                    if (!AcDetNode::getParams(*a1, a4, (uint64_t)v40))
                    {
                      AcVisegNode::getParams(v12, v15, (uint64_t)v40);
                      if (!AcSaliencyNode::getParams(v10, a4 + 50598, (uint64_t)v40))
                      {
                        int v16 = *(unsigned __int8 *)(v10 + 185) | (2 * *(unsigned __int8 *)(v12 + 664));
                        unsigned int v43 = 0;
                        int v42 = 0;
                        float v44 = 0;
                        vImagePixelCount v17 = (unsigned int *)a3 + 3;
                        if (v16 == 1)
                        {
                          unint64_t v18 = 0;
                          unsigned int v19 = 0;
                          while (1)
                          {
                            unsigned int v20 = *v17++;
                            uint64_t v21 = v19;
                            uint64_t v22 = 24 * v19;
                            int v23 = &v45[v22];
                            *(void *)int v23 = v5 + v20;
                            long long v24 = &v40[v22];
                            int v26 = *(_DWORD *)&v40[v22 + 48];
                            int v25 = *(_DWORD *)&v40[v22 + 52];
                            int v27 = *((_DWORD *)v24 + 14) * v26;
                            *((_DWORD *)v23 + 2) = v27;
                            *((_DWORD *)v23 + 3) = v25;
                            if (v19 > 0x16 || ((1 << v19) & 0x7EC040) == 0) {
                              v25 *= 2;
                            }
                            unsigned int v28 = (v25 + 63) & 0xFFFFFFC0;
                            float v29 = &v45[24 * v21];
                            int v30 = *(_DWORD *)&v40[24 * v21 + 60];
                            *((_DWORD *)v29 + 4) = v28;
                            *((_DWORD *)v29 + 5) = v30;
                            v18 += v28 * v27;
                            if (v18 > v7) {
                              break;
                            }
                            if (v21 == 22) {
                              unsigned int v19 = 24;
                            }
                            else {
                              unsigned int v19 = v21 + 1;
                            }
                            if (!--v8) {
                              goto LABEL_31;
                            }
                          }
                        }
                        else
                        {
                          uint64_t v31 = 0;
                          unint64_t v32 = 0;
                          float v33 = &v46;
                          unsigned int v34 = &v41;
                          while (1)
                          {
                            *(void *)(v33 - 3) = v5 + v17[v31];
                            int v35 = *(v34 - 2);
                            int v36 = *(v34 - 1) * *(v34 - 3);
                            *(v33 - 1) = v36;
                            *float v33 = v35;
                            if (v31 > 0x17 || ((1 << v31) & 0xFEC040) == 0) {
                              v35 *= 2;
                            }
                            unsigned int v37 = (v35 + 63) & 0xFFFFFFC0;
                            int v38 = *v34;
                            v33[1] = v37;
                            v33[2] = v38;
                            v32 += v37 * v36;
                            if (v32 > v7) {
                              break;
                            }
                            ++v31;
                            v33 += 6;
                            v34 += 6;
                            if (v8 == v31)
                            {
LABEL_31:
                              int v42 = (uint64_t *)v45;
                              unsigned int v43 = &v47;
                              float v44 = v48;
                              bzero(a5, 0x5228uLL);
                              AcANSTPostProcessMultiNetOutputs(a1, a2, v39, &v42, dword_246D9F6C4, 0, a4, (uint64_t)a5);
                              return;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void AcANSTPostProcessMultiNetOutputs(void *a1, uint32x2_t *a2, uint64_t a3, uint64_t **a4, unsigned int *a5, uint64_t a6, _DWORD *a7, uint64_t a8)
{
  if (a1 && *a1 && a1[1] && a1[2] && a1[3] && a7 && a2 && a8 && a2->i32[0] && a2->i32[1])
  {
    *(void *)(a8 + 205) = 0;
    *(_OWORD *)(a8 + 176) = 0u;
    *(_OWORD *)(a8 + 192) = 0u;
    *(_OWORD *)(a8 + 144) = 0u;
    *(_OWORD *)(a8 + 160) = 0u;
    *(_OWORD *)(a8 + 112) = 0u;
    *(_OWORD *)(a8 + 12_Block_object_dispose(&STACK[0x488], 8) = 0u;
    *(_OWORD *)(a8 + 80) = 0u;
    *(_OWORD *)(a8 + 96) = 0u;
    *(_OWORD *)(a8 + 4_Block_object_dispose(&STACK[0x488], 8) = 0u;
    *(_OWORD *)(a8 + 64) = 0u;
    *(_OWORD *)(a8 + 16) = 0u;
    *(_OWORD *)(a8 + 32) = 0u;
    *(_OWORD *)a8 = 0u;
    uint64_t v12 = *a5;
    if (!v12) {
      goto LABEL_36;
    }
    AcDetNode::postProcess((void *)*a1, *a4, v12, a6, a7, (uint64_t)a2, (uint64_t)(a1 + 4), 0.0);
    if (!v16)
    {
      uint64_t v17 = *((unsigned int *)a1 + 1928);
      uint64_t v18 = *((unsigned int *)a1 + 10179);
      uint64_t v19 = *((unsigned int *)a1 + 12740);
      if (!*(unsigned char *)(*a1 + 1422) && v18 + v17 != -(int)v19)
      {
        *(_WORD *)(*a1 + 1421) = 257;
        *(unsigned char *)(a1[1] + 1472) = 1;
      }
      if (v17)
      {
        float32x2_t v20 = vcvt_f32_u32(a2[1]);
        float32x2_t v21 = vcvt_f32_u32(*a2);
        uint64_t v22 = (float32x2_t *)((char *)a1 + 44);
        do
        {
          float32x2_t v23 = vmul_f32(vdiv_f32(*v22, v20), v21);
          float32x2_t v24 = vmul_f32(vdiv_f32(vadd_f32(*v22, v22[1]), v20), v21);
          int32x2_t v25 = (int32x2_t)vsub_f32(vadd_f32(vsub_f32(v24, v23), (float32x2_t)vdup_lane_s32((int32x2_t)v24, 1)), (float32x2_t)vdup_lane_s32((int32x2_t)v23, 1));
          *(float *)v25.i32 = 0.5 * *(float *)v25.i32;
          *uint64_t v22 = vmul_f32(vsub_f32(vadd_f32(v24, v23), (float32x2_t)vdup_lane_s32(v25, 0)), (float32x2_t)0x3F0000003F000000);
          v22[1].i32[0] = v25.i32[0];
          v22[1].i32[1] = v25.i32[0];
          v22 += 64;
          --v17;
        }
        while (v17);
      }
      if (v18)
      {
        unint64_t v26 = 0;
        float32x2_t v27 = vcvt_f32_u32(a2[1]);
        float32x2_t v28 = vcvt_f32_u32(*a2);
        uint64_t v29 = v18 << 9;
        int v30 = a1 + 3226;
        do
        {
          uint64_t v31 = (float32x2_t *)&v30[v26 / 8 - 55];
          unint64_t v32 = (float32x2_t *)&a1[v26 / 8];
          float32x2_t v33 = vmul_f32(vdiv_f32(*v31, v27), v28);
          float32x2_t v34 = vmul_f32(vdiv_f32(vadd_f32(*v31, (float32x2_t)a1[v26 / 8 + 3172]), v27), v28);
          *uint64_t v31 = v33;
          a1[v26 / 8 + 3172] = vsub_f32(v34, v33);
          if (*((_DWORD *)&v30[v26 / 8 - 55] - 1) == 9)
          {
            float32x2_t v35 = (float32x2_t)v30[v26 / 8];
            float32x2_t v36 = vmul_f32(vdiv_f32(vadd_f32(v35, v32[3227]), v27), v28);
            float32x2_t v37 = vmul_f32(vdiv_f32(v35, v27), v28);
            v30[v26 / 8] = v37;
            v32[3227] = vsub_f32(v36, v37);
          }
          v26 += 512;
        }
        while (v29 != v26);
      }
      if (v19)
      {
        float32x2_t v38 = vcvt_f32_u32(a2[1]);
        float32x2_t v39 = vcvt_f32_u32(*a2);
        int v40 = (float32x2_t *)((char *)a1 + 40732);
        do
        {
          float32x2_t v41 = vmul_f32(vdiv_f32(*v40, v38), v39);
          float32x2_t v42 = vsub_f32(vmul_f32(vdiv_f32(vadd_f32(*v40, v40[1]), v38), v39), v41);
          *int v40 = v41;
          v40[1] = v42;
          float32x2_t v43 = v40[55];
          float32x2_t v44 = vadd_f32(v43, v40[56]);
          float32x2_t v45 = vmul_f32(vdiv_f32(v43, v38), v39);
          v40[55] = v45;
          v40[56] = vsub_f32(vmul_f32(vdiv_f32(v44, v38), v39), v45);
          v40 += 64;
          --v19;
        }
        while (v19);
      }
      int v46 = *a4;
      long long v99 = *(_OWORD *)*a4;
      uint64_t v100 = v46[2];
      if (!acAssoPostProcess((uint64_t)a1, (uint64_t)a2, (uint64_t)&v99, (unsigned __int8 *)a8, (uint64_t)a7, v14, v15))
      {
        unint64_t v47 = *(unsigned int *)(a8 + 220);
        if (v47)
        {
          unint64_t v48 = 0;
          __asm { FMOV            V0.4S, #1.0 }
          float32x4_t v87 = _Q0;
          v54.i32[1] = 1117782016;
          float32x4_t v89 = (float32x4_t)vdupq_n_s32(0x447A0000u);
          __asm
          {
            FMOV            V12.2S, #1.0
            FMOV            V0.2S, #16.0
          }
          int8x8_t v86 = *(int8x8_t *)_Q0.f32;
          uint64_t v56 = a8;
          do
          {
            if (*(unsigned char *)(v56 + 664))
            {
              *(float *)v54.i32 = (float)*(int *)(v56 + 644) / 1000.0;
              float v93 = *(float *)v54.i32;
              float32_t v90 = (float)(*(float *)v54.i32 + -0.1) * (float)(*(float *)v54.i32 + -0.1);
              float32x4_t v92 = (float32x4_t)vdupq_lane_s32(v54, 0);
              float32x4_t v57 = vaddq_f32(v92, (float32x4_t)xmmword_246D9F150);
              float32x4_t v98 = vmulq_f32(vmulq_f32(v57, v57), (float32x4_t)xmmword_246D9F160);
              float v94 = expf(v98.f32[1]);
              v58.f32[0] = expf(v98.f32[0]);
              v58.f32[1] = v94;
              float32x4_t v95 = v58;
              float v59 = expf(v98.f32[2]);
              float32x4_t v60 = v95;
              v60.f32[2] = v59;
              float32x4_t v96 = v60;
              float v61 = expf(v98.f32[3]);
              float32x4_t v62 = v96;
              v62.f32[3] = v61;
              float32x4_t v97 = vdivq_f32(v87, v62);
              float v63 = 1.0 / expf(v90 * 8.0);
              float v64 = 1.0 / expf((float)((float)(v93 + -0.88) * (float)(v93 + -0.88)) * 8.0);
              float32x2_t v65 = vadd_f32(*(float32x2_t *)v92.f32, (float32x2_t)0xBF266666BE75C28FLL);
              *(float32x2_t *)v98.f32 = vmul_f32(v65, v65);
              float32x2_t v66 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v98.f32, 0);
              v66.f32[0] = v90;
              float32x2_t v67 = vmul_f32(v66, (float32x2_t)0x42A0000042200000);
              float v88 = v67.f32[0];
              *(float *)&uint64_t v68 = expf(v67.f32[1]);
              uint64_t v91 = v68;
              v69.f32[0] = expf(v88);
              v70.i32[1] = HIDWORD(v91);
              v69.i32[1] = v91;
              float32x2_t v71 = vdiv_f32(_D12, v69);
              *(float *)v70.i32 = v97.f32[3]
                                + (float)(v97.f32[2] + (float)(v97.f32[1] + (float)(v97.f32[0] + vaddv_f32(v71))));
              float32x4_t v72 = (float32x4_t)vdupq_lane_s32(v70, 0);
              *(int32x2_t *)(v56 + 620) = vcvt_s32_f32(vmul_f32(vdiv_f32(v71, *(float32x2_t *)v72.f32), *(float32x2_t *)v89.f32));
              int32x4_t v73 = vcvtq_s32_f32(vmulq_f32(vdivq_f32(v97, v72), v89));
              *(int32x4_t *)(v56 + 62_Block_object_dispose(&STACK[0x488], 8) = v73;
              v73.i32[0] = 1047904911;
              v73.i32[0] = vdup_lane_s32(*(int32x2_t *)v73.i8, 0).u32[0];
              *(float *)&v73.i32[1] = v93;
              *(float32x2_t *)v73.i8 = vmul_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)v73.i8, (float32x2_t)(v92.u32[0] | 0x3F26666600000000)), (int8x8_t)0x4100000041000000, v86), *(float32x2_t *)v98.f32);
              v97.i32[0] = v73.i32[0];
              *(float *)&uint64_t v74 = expf(*(float *)&v73.i32[1]);
              v98.i64[0] = v74;
              v75.f32[0] = expf(v97.f32[0]);
              v54.i32[1] = v98.i32[1];
              v75.i32[1] = v98.i32[0];
              float32x2_t v76 = vdiv_f32(_D12, v75);
              *(float *)v54.i32 = v64 + (float)(v76.f32[1] + (float)(v63 + v76.f32[0]));
              *(_DWORD *)(v56 + 64_Block_object_dispose(&STACK[0x488], 8) = (int)(float)((float)(v63 / *(float *)v54.i32) * 1000.0);
              *(int32x2_t *)(v56 + 652) = vcvt_s32_f32(vmul_f32(vdiv_f32(v76, (float32x2_t)vdup_lane_s32(v54, 0)), *(float32x2_t *)v89.f32));
              *(_DWORD *)(v56 + 660) = (int)(float)((float)(v64 / *(float *)v54.i32) * 1000.0);
            }
            ++v48;
            v56 += 1624;
          }
          while (v48 < v47);
        }
        if (!*(unsigned char *)a8)
        {
LABEL_36:
          float32x2_t v77 = a7 + 50595;
          int v78 = a7[50595];
          *(_OWORD *)(a8 + 1) = *(_OWORD *)"0000000";
          *(_DWORD *)(a8 + 17) = 0;
          float32x2_t v79 = (_OWORD *)(a8 + 21);
          uint64_t v80 = a8 + 101;
          *(_DWORD *)(a8 + 37) = 0;
          if (v78)
          {
            *float32x2_t v79 = xmmword_246D9F6E5;
            char v81 = 1;
          }
          else
          {
            *float32x2_t v79 = xmmword_246D9F6D0;
            int v82 = *(_DWORD *)(*a1 + 16);
            *(_OWORD *)uint64_t v80 = *(_OWORD *)*a1;
            *(_DWORD *)(a8 + 117) = v82;
            *(unsigned char *)a8 = 1;
            *(_DWORD *)(a8 + 57) = 0;
            *(_OWORD *)(a8 + 41) = xmmword_246D9F6E5;
            uint64_t v80 = a8 + 121;
            char v81 = 2;
          }
          uint64_t v83 = a1[1];
          long long v84 = *(_OWORD *)(v83 + 12);
          *(_DWORD *)(v80 + 16) = *(_DWORD *)(v83 + 28);
          *(_OWORD *)uint64_t v80 = v84;
          *(unsigned char *)a8 = v81;
          if (*v77 == 4) {
            int v85 = 0;
          }
          else {
            int v85 = *v77 + 1;
          }
          *float32x2_t v77 = v85;
        }
      }
    }
  }
}

uint64_t AcANSTUseLowThresholds(uint64_t *a1)
{
  if (!a1) {
    return 4294967292;
  }
  uint64_t v1 = *a1;
  if (!*a1 || !a1[1] || !a1[2] || !a1[3]) {
    return 4294967292;
  }
  uint64_t result = 0;
  *(unsigned char *)(v1 + 1420) = 1;
  return result;
}

uint64_t AcANSTGetExtState(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (!a1 || !*a1 || !a1[1] || !a1[2] || !a1[3]) {
    return 4294967292;
  }
  uint64_t result = 4294967292;
  if (a2 && a3 && a4)
  {
    *(void *)(a4 + 4) = a2;
    *(_DWORD *)(a4 + 12) = 202416;
    *(void *)(a4 + 16) = a3;
    *(_DWORD *)(a4 + 24) = a5;
    if (a2 + 202416 == a3)
    {
      *(_DWORD *)(a4 + 12) = a5 + 202416;
      *(_DWORD *)(a4 + 24) = 0;
      int v6 = a5 != -202416;
    }
    else
    {
      int v6 = 2;
    }
    uint64_t result = 0;
    *(_DWORD *)a4 = v6;
  }
  return result;
}

uint64_t AcANSTCallExtState(void *a1, void *__dst, int a3, char *__src, uint64_t a5, _DWORD *a6, int a7)
{
  if (!a1) {
    return 4294967292;
  }
  if (!*a1 || !a1[1] || !a1[2] || !a1[3]) {
    return 4294967292;
  }
  uint64_t result = 4294967292;
  if (__dst)
  {
    if (__src)
    {
      memcpy(__dst, __src, 0x316B0uLL);
      uint64_t result = 0;
      *(_WORD *)(*a1 + 1421) = 257;
      *(unsigned char *)(a1[1] + 1472) = 1;
      *(void *)a5 = __src + 202416;
      *(_DWORD *)(a5 + _Block_object_dispose(&STACK[0x488], 8) = a7;
      *(_DWORD *)(a5 + 12) = *a6;
      *(_DWORD *)(a5 + 16) = a6[1];
      *(_DWORD *)(a5 + 20) = a6[2];
      *(_DWORD *)(a5 + 24) = a6[3];
      *(_DWORD *)(a5 + 2_Block_object_dispose(&STACK[0x488], 8) = a6[4];
      *(_DWORD *)(a5 + 32) = a6[5];
      *(_DWORD *)(a5 + 36) = a6[6];
      *(_DWORD *)(a5 + 40) = a6[7];
      *(_DWORD *)(a5 + 44) = a6[8];
      *(_DWORD *)(a5 + 4_Block_object_dispose(&STACK[0x488], 8) = a6[9];
      *(_DWORD *)(a5 + 52) = a6[10];
      *(_DWORD *)(a5 + 56) = a6[11];
      *(_DWORD *)(a5 + 60) = a6[12];
      *(_DWORD *)(a5 + 64) = a6[13];
      *(_DWORD *)(a5 + 6_Block_object_dispose(&STACK[0x488], 8) = a6[14];
      *(_DWORD *)(a5 + 72) = a6[15];
      *(_DWORD *)(a5 + 76) = a6[16];
      *(_DWORD *)(a5 + 80) = a6[17];
      *(_DWORD *)(a5 + 84) = a6[18];
      *(_DWORD *)(a5 + 8_Block_object_dispose(&STACK[0x488], 8) = a6[19];
      *(_DWORD *)(a5 + 92) = a6[20];
      *(_DWORD *)(a5 + 96) = a6[21];
      *(_DWORD *)(a5 + 100) = a6[22];
      *(_DWORD *)(a5 + 104) = a6[23];
      *(_DWORD *)(a5 + 10_Block_object_dispose(&STACK[0x488], 8) = a6[24];
      *(_DWORD *)(a5 + 112) = 25;
    }
  }
  return result;
}

uint64_t acTrkLGroupIoUCost(uint64_t result, unsigned int a2, int *a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int *a10, uint64_t a11)
{
  if (a4 <= a2) {
    uint64_t v12 = a2;
  }
  else {
    uint64_t v12 = a4;
  }
  if (v12)
  {
    if (a4)
    {
      unint64_t v13 = 0;
      unsigned int v14 = 0;
      unsigned int v15 = v12 - a4;
      int v16 = v12 & 0xFFFFFFF8;
      int v17 = (v12 - a4) & 0xFFFFFFF8;
      unint64_t v18 = a4 - 1;
      unint64_t v19 = (unint64_t)&a3[15 * a4 - 11];
      uint64_t v166 = a4 & 0xFFFFFFFC;
      uint64_t v165 = result;
      *(void *)&long long v20 = 0x4000000040000000;
      *((void *)&v20 + 1) = 0x4000000040000000;
      v21.i64[0] = 0x3400000034000000;
      v21.i64[1] = 0x3400000034000000;
      __asm { FMOV            V6.4S, #1.0 }
      while (v13 >= a2)
      {
        unsigned int v27 = v12 + v14;
        BOOL v28 = __CFADD__(v14, v12 - 1);
        if (v12 >= 8 && !v28)
        {
          uint64_t v29 = v12 & 0xFFFFFFF8;
          unsigned int v30 = v14;
          do
          {
            uint64_t v31 = (_OWORD *)(a5 + 4 * v30);
            *uint64_t v31 = v20;
            v31[1] = v20;
            v30 += 8;
            v29 -= 8;
          }
          while (v29);
          if (v12 == v16) {
            goto LABEL_7;
          }
          v14 += v16;
        }
        do
          *(_DWORD *)(a5 + 4 * v14++) = 0x40000000;
        while (v27 != v14);
LABEL_7:
        ++v13;
        unsigned int v14 = v27;
        if (v13 == v12) {
          goto LABEL_94;
        }
      }
      uint64_t v25 = result + 60 * v13;
      if (a4 >= 4)
      {
        uint64_t v26 = 0;
        if (!__CFADD__(v14, v18) && !HIDWORD(v18))
        {
          uint64_t v26 = 0;
          unint64_t v32 = result + 60 * v13;
          uint64_t v33 = 4 * v14;
          unint64_t v34 = a5 + v33;
          unint64_t v35 = a5 + 4 * a4 + v33;
          _CF = v32 >= v35 || v34 >= v32 + 16;
          BOOL v37 = !_CF;
          BOOL v38 = v34 < v19 && v35 > (unint64_t)a3;
          if (!v38 && !v37)
          {
            float32x2_t v39 = (const float *)(result + 60 * v13);
            float32x4_t v40 = vld1q_dup_f32(v39++);
            float32x2_t v41 = (const float *)(v25 + 8);
            float32x4_t v42 = vld1q_dup_f32(v41);
            uint64_t v43 = a4 & 0xFFFFFFFC;
            unsigned int v27 = v14 + v166;
            float32x4_t v44 = vld1q_dup_f32(v39);
            v11.i32[0] = *(_DWORD *)(v25 + 12);
            float32x4_t v45 = vaddq_f32(v40, v42);
            float32x4_t v46 = vaddq_f32(v44, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.i8, 0));
            float32x4_t v47 = vmulq_n_f32(v42, *(float *)v11.i32);
            unint64_t v48 = a3 + 30;
            unsigned int v49 = v14;
            do
            {
              v50.i32[0] = *(v48 - 30);
              v51.i32[0] = *(v48 - 29);
              v50.i32[1] = *(v48 - 15);
              v50.i32[2] = *v48;
              v50.i32[3] = v48[15];
              v52.i32[0] = *(v48 - 28);
              v53.i32[0] = *(v48 - 27);
              v52.i32[1] = *(v48 - 13);
              v52.i32[2] = v48[2];
              v52.i32[3] = v48[17];
              v51.i32[1] = *(v48 - 14);
              v51.i32[2] = v48[1];
              v51.i32[3] = v48[16];
              v53.i32[1] = *(v48 - 12);
              float32x4_t v54 = vaddq_f32(v50, v52);
              v53.i32[2] = v48[3];
              v53.i32[3] = v48[18];
              float32x4_t v55 = vaddq_f32(v51, v53);
              float32x4_t v56 = vmulq_f32(v52, v53);
              int8x16_t v57 = vorrq_s8((int8x16_t)vcgeq_f32(v50, v45), (int8x16_t)vcgeq_f32(v51, v46));
              float32x4_t v58 = vmulq_f32(vmaxnmq_f32(vsubq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v45, v54), (int8x16_t)v54, (int8x16_t)v45), (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v40, v50), (int8x16_t)v40, (int8x16_t)v50)), (float32x4_t)0), vmaxnmq_f32(vsubq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v46, v55), (int8x16_t)v55, (int8x16_t)v46), (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v44, v51), (int8x16_t)v44, (int8x16_t)v51)), (float32x4_t)0));
              float32x4_t v59 = (float32x4_t)vandq_s8(vbicq_s8((int8x16_t)vdivq_f32(v58, vmaxnmq_f32(vsubq_f32(vaddq_f32(v56, v47), v58), v21)), v57), vbicq_s8(vmvnq_s8((int8x16_t)vcgeq_f32(v40, v54)), (int8x16_t)vcgeq_f32(v44, v55)));
              int8x16_t v11 = vbslq_s8((int8x16_t)vcltzq_f32(v59), (int8x16_t)_Q6, (int8x16_t)vsubq_f32(_Q6, v59));
              *(int8x16_t *)(a5 + 4 * v49) = v11;
              v49 += 4;
              v48 += 60;
              v43 -= 4;
            }
            while (v43);
            uint64_t v26 = a4 & 0xFFFFFFFC;
            if (v166 == a4)
            {
              unsigned int v60 = v14 + v166 - 1;
              unint64_t v19 = (unint64_t)&a3[15 * a4 - 11];
              uint64_t result = v165;
              if (a4 >= a2) {
                goto LABEL_7;
              }
              goto LABEL_65;
            }
            v14 += v166;
            unint64_t v19 = (unint64_t)&a3[15 * a4 - 11];
            uint64_t result = v165;
          }
        }
      }
      else
      {
        uint64_t v26 = 0;
      }
      uint64_t v61 = a4 - v26;
      float32x4_t v62 = (float *)&a3[15 * v26 + 2];
      unsigned int v27 = v14;
      do
      {
        float v64 = *(v62 - 2);
        float v65 = *(v62 - 1);
        float v66 = v62[1];
        float v67 = v64 + *v62;
        float v68 = v65 + v66;
        float v70 = *(float *)v25;
        float v69 = *(float *)(v25 + 4);
        float v71 = 0.0;
        if (v67 > *(float *)v25 && v68 > v69)
        {
          float v73 = *(float *)(v25 + 8);
          float v74 = *(float *)(v25 + 12);
          float v75 = v69 + v74;
          if ((float)(v70 + v73) > v64 && v75 > v65)
          {
            if (v64 < v70) {
              float v64 = *(float *)v25;
            }
            if (v65 < v69) {
              float v65 = *(float *)(v25 + 4);
            }
            if (v67 >= (float)(v70 + v73)) {
              float v67 = v70 + v73;
            }
            if (v68 >= v75) {
              float v68 = v69 + v74;
            }
            float v77 = fmaxf(v67 - v64, 0.0) * fmaxf(v68 - v65, 0.0);
            float v71 = v77 / fmaxf((float)((float)(*v62 * v66) + (float)(v73 * v74)) - v77, 0.00000011921);
          }
        }
        float v63 = 1.0 - v71;
        if (v71 < 0.0) {
          float v63 = 1.0;
        }
        *(float *)(a5 + 4 * v27++) = v63;
        v62 += 15;
        --v61;
      }
      while (v61);
      unsigned int v60 = v27 - 1;
      if (a4 >= a2) {
        goto LABEL_7;
      }
LABEL_65:
      if (v15 < 8 || (unsigned int v78 = -2 - v60, v79 = v15 & 0xFFFFFFF8, v80 = v27, v78 < v12 - 1 - a4))
      {
        unsigned int v82 = a4;
      }
      else
      {
        do
        {
          char v81 = (_OWORD *)(a5 + 4 * v80);
          *char v81 = v20;
          v81[1] = v20;
          v80 += 8;
          v79 -= 8;
        }
        while (v79);
        v27 += v17;
        unsigned int v82 = v17 + a4;
        if (v15 == v17) {
          goto LABEL_7;
        }
      }
      do
      {
        *(_DWORD *)(a5 + 4 * v27) = 0x40000000;
        ++v82;
        ++v27;
      }
      while (v82 < v12);
      goto LABEL_7;
    }
    unsigned int v83 = 0;
    unsigned int v84 = 0;
    int v85 = v12 & 0xFFFFFFF8;
    *(void *)&long long v86 = 0x4000000040000000;
    *((void *)&v86 + 1) = 0x4000000040000000;
    int v87 = v12;
    do
    {
      BOOL v89 = __CFADD__(v83, v12 - 1) || v12 < 8;
      unsigned int v90 = v83;
      uint64_t v91 = v12 & 0xFFFFFFF8;
      unsigned int v92 = v83;
      if (v84 >= a2)
      {
        if (!v89)
        {
          do
          {
            float v94 = (_OWORD *)(a5 + 4 * v92);
            _OWORD *v94 = v86;
            v94[1] = v86;
            v92 += 8;
            v91 -= 8;
          }
          while (v91);
          if (v12 == v85) {
            goto LABEL_74;
          }
          unsigned int v90 = v83 + v85;
        }
        do
          *(_DWORD *)(a5 + 4 * v90++) = 0x40000000;
        while (v87 != v90);
      }
      else
      {
        if (!v89)
        {
          do
          {
            float v93 = (_OWORD *)(a5 + 4 * v92);
            *float v93 = v86;
            v93[1] = v86;
            v92 += 8;
            v91 -= 8;
          }
          while (v91);
          if (v12 == v85) {
            goto LABEL_74;
          }
          unsigned int v90 = v83 + v85;
        }
        do
          *(_DWORD *)(a5 + 4 * v90++) = 0x40000000;
        while (v87 != v90);
      }
LABEL_74:
      v83 += v12;
      ++v84;
      v87 += v12;
    }
    while (v84 != v12);
  }
LABEL_94:
  if (*(unsigned char *)(a11 + 5))
  {
    if (a9 == 10)
    {
      if (v12 && a4)
      {
        unsigned int v97 = 0;
        unint64_t v98 = 0;
        long long v99 = a3 + 8;
        unint64_t v100 = a2;
        uint64_t v101 = a4;
        do
        {
          if (v98 < v100)
          {
            int v111 = *(_DWORD *)(result + 60 * v98 + 40);
            uint64_t v112 = v101;
            float v113 = v99;
            if (v111 != -1)
            {
              while (1)
              {
                int v114 = *v113;
                v113 += 15;
                if (v114 == v111) {
                  break;
                }
                if (!--v112) {
                  goto LABEL_114;
                }
              }
              unsigned int v115 = 0;
              uint64_t v116 = 0;
              long long v117 = v99;
              while (1)
              {
                int v118 = *v117;
                v117 += 15;
                if (v111 == v118) {
                  break;
                }
                ++v116;
                ++v115;
                if (v101 == v116) {
                  goto LABEL_114;
                }
              }
              if ((v116 & 0x80000000) == 0)
              {
                float v119 = 3.4028e38;
                unsigned int v120 = v97;
                uint64_t v121 = v12;
                do
                {
                  if (*(float *)(a5 + 4 * v120) < v119) {
                    float v119 = *(float *)(a5 + 4 * v120);
                  }
                  ++v120;
                  --v121;
                }
                while (v121);
                LODWORD(v122) = 0;
                uint64_t v123 = v12;
                do
                {
                  if (vabds_f32(v119, *(float *)(a5 + 4 * (v97 + v121))) < 0.00000011921)
                  {
                    a10[v122] = v121;
                    LODWORD(v122) = v122 + 1;
                  }
                  LODWORD(v121) = v121 + 1;
                  --v123;
                }
                while (v123);
                if (v122)
                {
                  uint64_t v122 = v122;
                  long long v124 = a10;
                  while (1)
                  {
                    int v125 = *v124++;
                    if (v125 == v116) {
                      break;
                    }
                    if (!--v122) {
                      goto LABEL_137;
                    }
                  }
                  int v126 = v116;
                }
                else
                {
LABEL_137:
                  int v126 = *a10;
                }
                float v127 = 3.4028e38;
                unsigned int v128 = v115;
                uint64_t v129 = v12;
                do
                {
                  if (*(float *)(a5 + 4 * v128) < v127) {
                    float v127 = *(float *)(a5 + 4 * v128);
                  }
                  v128 += v12;
                  --v129;
                }
                while (v129);
                unsigned int v130 = 0;
                do
                {
                  if (vabds_f32(v127, *(float *)(a5 + 4 * v115)) < 0.00000011921) {
                    a10[v130++] = v129;
                  }
                  ++v129;
                  v115 += v12;
                }
                while (v12 != v129);
                if (v130)
                {
                  uint64_t v131 = v130;
                  long long v132 = a10;
                  while (1)
                  {
                    int v133 = *v132++;
                    if (v133 == v98) {
                      break;
                    }
                    if (!--v131) {
                      goto LABEL_151;
                    }
                  }
                  int v134 = v98;
                }
                else
                {
LABEL_151:
                  int v134 = *a10;
                }
                uint64_t v135 = (int *)(result + 60 * v98 + 48);
                if (v126 == v116 && v98 == v134)
                {
                  int v107 = 0;
                  float v108 = 0.0;
                }
                else
                {
                  int v107 = *v135 + 1;
                  if (*v135 >= 6) {
                    float v108 = 0.0;
                  }
                  else {
                    float v108 = 2.0;
                  }
                }
                *uint64_t v135 = v107;
                uint64_t v109 = 4 * (v12 * v98 + v116);
                float v110 = *(float *)(a5 + v109) - v108;
                if (v110 < 0.0) {
                  float v110 = 0.0;
                }
                *(float *)(a5 + v109) = v110;
              }
            }
          }
LABEL_114:
          ++v98;
          v97 += v12;
        }
        while (v98 != v12);
      }
    }
    else if (a9 == 11 && v12 != 0 && a4 != 0)
    {
      unsigned int v102 = 0;
      unint64_t v103 = 0;
      float32x2_t v104 = a3 + 9;
      unint64_t v105 = a2;
      uint64_t v106 = a4;
      do
      {
        if (v103 < v105)
        {
          int v140 = *(_DWORD *)(result + 60 * v103 + 44);
          uint64_t v141 = v106;
          uint64_t v142 = v104;
          if (v140 != -1)
          {
            while (1)
            {
              int v143 = *v142;
              v142 += 15;
              if (v143 == v140) {
                break;
              }
              if (!--v141) {
                goto LABEL_162;
              }
            }
            unsigned int v144 = 0;
            uint64_t v145 = 0;
            uint64_t v146 = v104;
            while (1)
            {
              int v147 = *v146;
              v146 += 15;
              if (v140 == v147) {
                break;
              }
              ++v145;
              ++v144;
              if (v106 == v145) {
                goto LABEL_162;
              }
            }
            if ((v145 & 0x80000000) == 0)
            {
              float v148 = 3.4028e38;
              unsigned int v149 = v102;
              uint64_t v150 = v12;
              do
              {
                if (*(float *)(a5 + 4 * v149) < v148) {
                  float v148 = *(float *)(a5 + 4 * v149);
                }
                ++v149;
                --v150;
              }
              while (v150);
              LODWORD(v151) = 0;
              uint64_t v152 = v12;
              do
              {
                if (vabds_f32(v148, *(float *)(a5 + 4 * (v102 + v150))) < 0.00000011921)
                {
                  a10[v151] = v150;
                  LODWORD(v151) = v151 + 1;
                }
                LODWORD(v150) = v150 + 1;
                --v152;
              }
              while (v152);
              if (v151)
              {
                uint64_t v151 = v151;
                float32x2_t v153 = a10;
                while (1)
                {
                  int v154 = *v153++;
                  if (v154 == v145) {
                    break;
                  }
                  if (!--v151) {
                    goto LABEL_185;
                  }
                }
                int v155 = v145;
              }
              else
              {
LABEL_185:
                int v155 = *a10;
              }
              float v156 = 3.4028e38;
              unsigned int v157 = v144;
              uint64_t v158 = v12;
              do
              {
                if (*(float *)(a5 + 4 * v157) < v156) {
                  float v156 = *(float *)(a5 + 4 * v157);
                }
                v157 += v12;
                --v158;
              }
              while (v158);
              unsigned int v159 = 0;
              do
              {
                if (vabds_f32(v156, *(float *)(a5 + 4 * v144)) < 0.00000011921) {
                  a10[v159++] = v158;
                }
                ++v158;
                v144 += v12;
              }
              while (v12 != v158);
              if (v159)
              {
                uint64_t v160 = v159;
                uint64_t v161 = a10;
                while (1)
                {
                  int v162 = *v161++;
                  if (v162 == v103) {
                    break;
                  }
                  if (!--v160) {
                    goto LABEL_199;
                  }
                }
                int v163 = v103;
              }
              else
              {
LABEL_199:
                int v163 = *a10;
              }
              float32x2_t v164 = (int *)(result + 60 * v103 + 52);
              if (v155 == v145 && v103 == v163)
              {
                int v136 = 0;
                float v137 = 0.0;
              }
              else
              {
                int v136 = *v164 + 1;
                if (*v164 >= 6) {
                  float v137 = 0.0;
                }
                else {
                  float v137 = 2.0;
                }
              }
              *float32x2_t v164 = v136;
              uint64_t v138 = 4 * (v12 * v103 + v145);
              float v139 = *(float *)(a5 + v138) - v137;
              if (v139 < 0.0) {
                float v139 = 0.0;
              }
              *(float *)(a5 + v13_Block_object_dispose(&STACK[0x488], 8) = v139;
            }
          }
        }
LABEL_162:
        ++v103;
        v102 += v12;
      }
      while (v103 != v12);
    }
  }
  return result;
}

uint64_t acTrkLGroupHandAsso(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, int *a6, int *a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12)
{
  uint64_t v126 = 0;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v121 = 0u;
  memset(v120, 0, sizeof(v120));
  size_t TempBuffers = acTrkGroupAssignGetTempBuffers(20, (uint64_t)a10, a3, (uint64_t)v120);
  bzero(a10, TempBuffers);
  uint64_t v116 = (float *)*((void *)&v121 + 1);
  unsigned int __dst = (void *)v122;
  if (a2)
  {
    uint64_t v20 = 0;
    unsigned int v21 = 0;
    int v22 = 1;
    uint64_t v23 = a1;
    float32x2_t v24 = a6;
    uint64_t v25 = a5;
    do
    {
      if (!*(_DWORD *)(v23 + 512))
      {
        uint64_t v26 = a5 + 60 * v21;
        *(_DWORD *)(v26 + 16) = 9;
        *(_OWORD *)uint64_t v26 = *(_OWORD *)(v23 + 452);
        *(_DWORD *)(v26 + 20) = v20;
        *(_DWORD *)(v26 + 24) = v22;
        *(_DWORD *)(v26 + 2_Block_object_dispose(&STACK[0x488], 8) = *(_DWORD *)v23;
        *(_OWORD *)(v26 + 40) = *(_OWORD *)(v23 + 1704);
        ++v21;
        ++v22;
      }
      ++v20;
      v23 += 1724;
    }
    while (a2 != v20);
  }
  else
  {
    unsigned int v21 = 0;
    int v22 = 1;
    float32x2_t v24 = a6;
    uint64_t v25 = a5;
  }
  float v108 = (unsigned __int8 *)*((void *)&v122 + 1);
  unsigned int v27 = (unsigned int *)*((void *)&v123 + 1);
  BOOL v28 = (int *)v125;
  if (a4)
  {
    uint64_t v29 = 0;
    unsigned int v30 = 0;
    unsigned int v31 = 0;
    uint64_t v32 = a3;
    do
    {
      if (!*(_DWORD *)(v32 + 512))
      {
        int v34 = *(_DWORD *)(v32 + 8);
        if (v34 == 11)
        {
          *(_OWORD *)&v119[28] = 0uLL;
          *(_OWORD *)float v119 = 0uLL;
          memset(&v119[12], 255, 20);
          uint64_t v33 = &a7[15 * v30];
          *(_OWORD *)uint64_t v33 = 0uLL;
          *((_OWORD *)v33 + 1) = *(_OWORD *)v119;
          *((_OWORD *)v33 + 2) = *(_OWORD *)&v119[16];
          *(_OWORD *)(v33 + 11) = *(_OWORD *)&v119[28];
          *(_OWORD *)uint64_t v33 = *(_OWORD *)(v32 + 452);
          v33[4] = 11;
          v33[5] = v29;
          v33[6] = 0;
          v33[9] = *(_DWORD *)v32;
          ++v30;
        }
        else if (v34 == 10)
        {
          *(_OWORD *)&v119[28] = 0uLL;
          *(_OWORD *)float v119 = 0uLL;
          memset(&v119[12], 255, 20);
          unint64_t v35 = &v24[15 * v31];
          *(_OWORD *)unint64_t v35 = 0uLL;
          *((_OWORD *)v35 + 1) = *(_OWORD *)v119;
          *((_OWORD *)v35 + 2) = *(_OWORD *)&v119[16];
          *(_OWORD *)(v35 + 11) = *(_OWORD *)&v119[28];
          *(_OWORD *)unint64_t v35 = *(_OWORD *)(v32 + 452);
          v35[4] = 10;
          v35[5] = v29;
          v35[6] = 0;
          v35[8] = *(_DWORD *)v32;
          ++v31;
        }
      }
      v32 += 1724;
      ++v29;
    }
    while (a4 != v29);
  }
  else
  {
    unsigned int v31 = 0;
    unsigned int v30 = 0;
  }
  unsigned int v113 = v31;
  int v114 = a7;
  unsigned int v110 = a2;
  unsigned int v111 = a4;
  if (v21 <= v31) {
    uint64_t v36 = v31;
  }
  else {
    uint64_t v36 = v21;
  }
  if (v36 >= 0x14) {
    unsigned int v37 = 20;
  }
  else {
    unsigned int v37 = v36;
  }
  uint64_t v112 = v28;
  acTrkLGroupIoUCost(v25, v21, v24, v31, (uint64_t)v116, v17, v18, v19, 10, v28, a12);
  memcpy(__dst, v116, 4 * v37 * v37);
  if (v21 && v113)
  {
    unsigned int v41 = v30;
    bmMunkres(v116, v37, v108, v38, v27, v39, 0, v40);
    unint64_t v42 = 0;
    uint64_t v43 = a6 + 6;
    uint64_t v44 = a5;
    size_t v46 = TempBuffers;
    float32x4_t v45 = a10;
    uint64_t v47 = a12;
    do
    {
      if (v42 < v113)
      {
        unsigned int v48 = v27[v42];
        if (v48 >= v21 || (float)(1.0 - *((float *)__dst + v42 + v48 * v36)) < 0.2) {
          *uint64_t v43 = v22++;
        }
        else {
          *uint64_t v43 = *(_DWORD *)(a5 + 60 * v48 + 24);
        }
      }
      ++v42;
      v43 += 15;
    }
    while (v36 != v42);
    goto LABEL_42;
  }
  unsigned int v41 = v30;
  if (v21)
  {
    uint64_t v44 = a5;
    size_t v46 = TempBuffers;
    float32x4_t v45 = a10;
    goto LABEL_36;
  }
  uint64_t v44 = a5;
  size_t v46 = TempBuffers;
  float32x4_t v45 = a10;
  if (!v113)
  {
LABEL_36:
    uint64_t v47 = a12;
    goto LABEL_42;
  }
  if (v113 >= 2)
  {
    uint64_t v49 = v113 & 0xFFFFFFFE;
    float32x4_t v50 = a6 + 21;
    int v51 = v22;
    uint64_t v52 = v49;
    uint64_t v47 = a12;
    do
    {
      *(v50 - 15) = v51;
      _DWORD *v50 = v51 + 1;
      v50 += 30;
      v51 += 2;
      v52 -= 2;
    }
    while (v52);
    v22 += v49;
    if (v49 == v113) {
      goto LABEL_42;
    }
  }
  else
  {
    uint64_t v49 = 0;
    uint64_t v47 = a12;
  }
  uint64_t v53 = v113 - v49;
  float32x4_t v54 = &a6[15 * v49 + 6];
  do
  {
    *float32x4_t v54 = v22;
    v54 += 15;
    ++v22;
    --v53;
  }
  while (v53);
LABEL_42:
  bzero(v45, v46);
  if (v21 <= v41) {
    uint64_t v58 = v41;
  }
  else {
    uint64_t v58 = v21;
  }
  if (v58 >= 0x14) {
    unsigned int v59 = 20;
  }
  else {
    unsigned int v59 = v58;
  }
  acTrkLGroupIoUCost(v44, v21, v114, v41, (uint64_t)v116, v55, v56, v57, 11, v112, v47);
  memcpy(__dst, v116, 4 * v59 * v59);
  if (v21 && v41)
  {
    bmMunkres(v116, v59, v108, v60, v27, v61, 0, v62);
    unint64_t v63 = 0;
    float v64 = v114;
    float v65 = a6;
    float v66 = v114 + 6;
    uint64_t result = v110;
    unsigned int v68 = v111;
    uint64_t v69 = a5;
    unsigned int v70 = v113;
    do
    {
      if (v63 < v41)
      {
        unsigned int v71 = v27[v63];
        if (v71 >= v21 || (float)(1.0 - *((float *)__dst + v63 + v71 * v58)) < 0.2) {
          *float v66 = v22++;
        }
        else {
          *float v66 = *(_DWORD *)(a5 + 60 * v71 + 24);
        }
      }
      ++v63;
      v66 += 15;
    }
    while (v58 != v63);
  }
  else
  {
    uint64_t result = v110;
    unsigned int v68 = v111;
    float v64 = v114;
    float v65 = a6;
    uint64_t v69 = a5;
    unsigned int v70 = v113;
    if (!v21 && v41)
    {
      if (v41 >= 2)
      {
        uint64_t v72 = v41 & 0xFFFFFFFE;
        float v73 = v114 + 21;
        int v74 = v22;
        uint64_t v75 = v72;
        do
        {
          *(v73 - 15) = v74;
          *float v73 = v74 + 1;
          v73 += 30;
          v74 += 2;
          v75 -= 2;
        }
        while (v75);
        if (v72 == v41) {
          goto LABEL_67;
        }
        v22 += v72;
      }
      else
      {
        uint64_t v72 = 0;
      }
      uint64_t v76 = v41 - v72;
      float v77 = &v114[15 * v72 + 6];
      do
      {
        *float v77 = v22;
        v77 += 15;
        ++v22;
        --v76;
      }
      while (v76);
    }
  }
LABEL_67:
  if (v21)
  {
    uint64_t v78 = v21;
    uint64_t v79 = v69 + 24;
    do
    {
      uint64_t v80 = a1 + 1724 * *(unsigned int *)(v79 - 4);
      *(_DWORD *)(v80 + 4) = *(_DWORD *)v79;
      *(void *)(v80 + 1712) = *(void *)(v79 + 24);
      v79 += 60;
      --v78;
    }
    while (v78);
  }
  if (v70)
  {
    if (v70 == 1)
    {
      uint64_t v81 = 0;
LABEL_76:
      uint64_t v86 = v70 - v81;
      int v87 = &v65[15 * v81 + 6];
      do
      {
        *(_DWORD *)(a3 + 1724 * *(v87 - 1) + 4) = *v87;
        v87 += 15;
        --v86;
      }
      while (v86);
      goto LABEL_78;
    }
    uint64_t v81 = v70 & 0xFFFFFFFE;
    unsigned int v82 = v65 + 21;
    uint64_t v83 = v81;
    do
    {
      int v84 = *v82;
      uint64_t v85 = a3 + 1724 * *(v82 - 1);
      *(_DWORD *)(a3 + 1724 * *(v82 - 16) + 4) = *(v82 - 15);
      *(_DWORD *)(v85 + 4) = v84;
      v82 += 30;
      v83 -= 2;
    }
    while (v83);
    if (v81 != v70) {
      goto LABEL_76;
    }
  }
LABEL_78:
  if (!v41) {
    goto LABEL_86;
  }
  if (v41 == 1)
  {
    uint64_t v88 = 0;
LABEL_84:
    uint64_t v93 = v41 - v88;
    float v94 = &v64[15 * v88 + 6];
    do
    {
      *(_DWORD *)(a3 + 1724 * *(v94 - 1) + 4) = *v94;
      v94 += 15;
      --v93;
    }
    while (v93);
    goto LABEL_86;
  }
  uint64_t v88 = v41 & 0xFFFFFFFE;
  BOOL v89 = v64 + 21;
  uint64_t v90 = v88;
  do
  {
    int v91 = *v89;
    uint64_t v92 = a3 + 1724 * *(v89 - 1);
    *(_DWORD *)(a3 + 1724 * *(v89 - 16) + 4) = *(v89 - 15);
    *(_DWORD *)(v92 + 4) = v91;
    v89 += 30;
    v90 -= 2;
  }
  while (v90);
  if (v88 != v41) {
    goto LABEL_84;
  }
LABEL_86:
  if (result)
  {
    uint64_t v95 = 0;
    do
    {
      if (!*(_DWORD *)(a1 + 1724 * v95 + 512))
      {
        if (v68)
        {
          LOBYTE(v96) = 0;
          unsigned int v97 = (int *)a3;
          uint64_t v98 = v68;
          do
          {
            if (!v97[128])
            {
              int v99 = v97[1];
              int v100 = v97[2];
              BOOL v96 = *(_DWORD *)(a1 + 1724 * v95 + 4) == v99 && v99 != 0;
              if (v100 == 10 && v96)
              {
                uint64_t v106 = a1 + 1724 * v95;
                int v107 = *v97;
                if (*(_DWORD *)(v106 + 1704) != v107) {
                  *(_DWORD *)(a1 + 1724 * v95 + 1712) = 0;
                }
                *(_DWORD *)(v106 + 1704) = v107;
                goto LABEL_89;
              }
              if (v100 == 11 && v96)
              {
                uint64_t v104 = a1 + 1724 * v95;
                int v105 = *v97;
                if (*(_DWORD *)(v104 + 1708) != v105) {
                  *(_DWORD *)(a1 + 1724 * v95 + 1716) = 0;
                }
                *(_DWORD *)(v104 + 170_Block_object_dispose(&STACK[0x488], 8) = v105;
                goto LABEL_89;
              }
            }
            v97 += 431;
            --v98;
          }
          while (v98);
          if (v96) {
            goto LABEL_89;
          }
        }
        *(_OWORD *)(a1 + 1724 * v95 + 1704) = xmmword_246D9F170;
      }
LABEL_89:
      ++v95;
    }
    while (v95 != result);
  }
  return result;
}

int *AcTrkProcLearnedGroupID(int *result, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int *a11, uint64_t a12, uint64_t a13, uint64_t a14, _DWORD *a15, _DWORD *a16)
{
  unsigned int v16 = 0;
  if (a2)
  {
    uint64_t v17 = a2;
    uint64_t v18 = result + 2;
    do
    {
      if (*v18 <= 5) {
        a11[v16++] = *(v18 - 1);
      }
      v18 += 431;
      --v17;
    }
    while (v17);
  }
  if (!a6) {
    goto LABEL_27;
  }
  for (uint64_t i = 0; i != a6; ++i)
  {
    if (a2)
    {
      uint64_t v20 = 0;
      unsigned int v21 = result + 2;
      while (*v21 != 1 || *(_DWORD *)(a9 + 4 * v20) != *(_DWORD *)(a7 + 4 * i))
      {
        v21 += 431;
        if (a2 == ++v20) {
          goto LABEL_16;
        }
      }
      int v22 = result[431 * v20 + 1];
    }
    else
    {
LABEL_16:
      int v22 = *(_DWORD *)(a5 + 1724 * i + 4);
      uint64_t v23 = v16;
      float32x2_t v24 = a11;
      if (v16)
      {
        while (1)
        {
          int v25 = *v24++;
          if (v25 == v22) {
            break;
          }
          if (!--v23) {
            goto LABEL_19;
          }
        }
LABEL_8:
        *(_DWORD *)(a12 + 4 * i) = (*a16)++;
        continue;
      }
LABEL_19:
      if (!v22) {
        goto LABEL_8;
      }
    }
    *(_DWORD *)(a12 + 4 * i) = v22;
  }
  if (a6 <= 0xF || __CFADD__(v16, a6 - 1) || (unint64_t)&a11[v16] - a12 < 0x20)
  {
    uint64_t v26 = 0;
    goto LABEL_25;
  }
  uint64_t v26 = a6 & 0xFFFFFFF8;
  uint64_t v43 = (long long *)(a12 + 16);
  unsigned int v44 = v16;
  uint64_t v45 = v26;
  do
  {
    long long v46 = *v43;
    uint64_t result = &a11[v44];
    *(_OWORD *)uint64_t result = *(v43 - 1);
    *((_OWORD *)result + 1) = v46;
    v43 += 2;
    v44 += 8;
    v45 -= 8;
  }
  while (v45);
  if (v26 != a6)
  {
LABEL_25:
    uint64_t v27 = a6 - v26;
    int v28 = v16 + v26;
    uint64_t v29 = (int *)(a12 + 4 * v26);
    do
    {
      int v30 = *v29++;
      a11[v28++] = v30;
      --v27;
    }
    while (v27);
  }
LABEL_27:
  *a15 = 0;
  if (a4)
  {
    uint64_t v31 = 0;
    unsigned int v32 = v16 + a6;
    uint64_t v33 = a4;
    uint64_t result = (int *)a6;
    do
    {
      uint64_t v36 = a3 + 1724 * v31;
      int v37 = *(_DWORD *)(v36 + 8);
      if (v37 == 11)
      {
        if (a6)
        {
          uint64_t v38 = 0;
          while (*(_DWORD *)(a8 + 4 * v38) != *(_DWORD *)(a10 + 4 * v31))
          {
            if (a6 == ++v38) {
              goto LABEL_42;
            }
          }
          goto LABEL_49;
        }
      }
      else if (v37 == 10 && a6)
      {
        uint64_t v38 = 0;
        while (*(_DWORD *)(a8 + 4 * v38) != *(_DWORD *)(a10 + 4 * v31))
        {
          if (a6 == ++v38) {
            goto LABEL_42;
          }
        }
        uint64_t v38 = v38;
LABEL_49:
        *(_DWORD *)(a13 + 4 * v31) = *(_DWORD *)(a12 + 4 * v38);
        a11[v32] = *(_DWORD *)(v36 + 4);
        int v34 = 1;
        goto LABEL_30;
      }
LABEL_42:
      int v39 = *(_DWORD *)(v36 + 4);
      if (v32)
      {
        uint64_t v40 = v32;
        unsigned int v41 = a11;
        while (1)
        {
          int v42 = *v41++;
          if (v42 == v39) {
            break;
          }
          if (!--v40) {
            goto LABEL_46;
          }
        }
      }
      else
      {
LABEL_46:
        if (v39)
        {
          int v34 = 0;
          *(_DWORD *)(a13 + 4 * v31) = v39;
          a11[v32] = *(_DWORD *)(v36 + 4);
          goto LABEL_30;
        }
      }
      int v34 = 0;
      *(_DWORD *)(a13 + 4 * v31) = *a16;
      a11[v32] = (*a16)++;
LABEL_30:
      ++v31;
      ++v32;
      uint64_t v35 = *a15;
      *a15 = v35 + 1;
      *(_DWORD *)(a14 + 4 * v35) = v34;
    }
    while (v31 != v33);
  }
  return result;
}

uint64_t acTrkProcGroupID(uint64_t result, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int *a13, uint64_t a14, uint64_t a15, _DWORD *a16)
{
  unsigned int v16 = 0;
  if (a2)
  {
    uint64_t v17 = a2;
    uint64_t v18 = (_DWORD *)(result + 8);
    do
    {
      if (*v18 <= 1u) {
        a13[v16++] = *(v18 - 1);
      }
      v18 += 431;
      --v17;
    }
    while (v17);
  }
  if (!a6) {
    goto LABEL_27;
  }
  for (uint64_t i = 0; i != a6; ++i)
  {
    if (a2)
    {
      uint64_t v20 = 0;
      unsigned int v21 = (_DWORD *)(result + 8);
      while (*v21 != 1 || *(_DWORD *)(a10 + 4 * v20) != *(_DWORD *)(a7 + 4 * i))
      {
        v21 += 431;
        if (a2 == ++v20) {
          goto LABEL_16;
        }
      }
      int v22 = *(_DWORD *)(result + 1724 * v20 + 4);
    }
    else
    {
LABEL_16:
      int v22 = *(_DWORD *)(a5 + 1724 * i + 4);
      uint64_t v23 = v16;
      float32x2_t v24 = a13;
      if (v16)
      {
        while (1)
        {
          int v25 = *v24++;
          if (v25 == v22) {
            break;
          }
          if (!--v23) {
            goto LABEL_19;
          }
        }
LABEL_8:
        *(_DWORD *)(a14 + 4 * i) = (*a16)++;
        continue;
      }
LABEL_19:
      if (!v22) {
        goto LABEL_8;
      }
    }
    *(_DWORD *)(a14 + 4 * i) = v22;
  }
  if (a6 <= 0xF || __CFADD__(v16, a6 - 1) || (unint64_t)&a13[v16] - a14 < 0x20)
  {
    uint64_t v26 = 0;
    goto LABEL_25;
  }
  uint64_t v26 = a6 & 0xFFFFFFF8;
  unsigned int v41 = (long long *)(a14 + 16);
  unsigned int v42 = v16;
  uint64_t v43 = v26;
  do
  {
    long long v44 = *v41;
    uint64_t v45 = &a13[v42];
    *(_OWORD *)uint64_t v45 = *(v41 - 1);
    *((_OWORD *)v45 + 1) = v44;
    v41 += 2;
    v42 += 8;
    v43 -= 8;
  }
  while (v43);
  if (v26 != a6)
  {
LABEL_25:
    uint64_t v27 = a6 - v26;
    int v28 = v16 + v26;
    uint64_t v29 = (int *)(a14 + 4 * v26);
    do
    {
      int v30 = *v29++;
      a13[v28++] = v30;
      --v27;
    }
    while (v27);
  }
LABEL_27:
  if (a4)
  {
    uint64_t v31 = 0;
    uint64_t v32 = v16 + a6;
    uint64_t v33 = a4;
    uint64_t result = a9;
    do
    {
      uint64_t v34 = a3 + 1724 * v31;
      int v35 = *(_DWORD *)(v34 + 8);
      if (v35 == 11)
      {
        if (a6)
        {
          uint64_t v36 = 0;
          while (*(_DWORD *)(a9 + 4 * v36) != *(_DWORD *)(a12 + 4 * v31))
          {
            if (a6 == ++v36) {
              goto LABEL_42;
            }
          }
          goto LABEL_48;
        }
      }
      else if (v35 == 10 && a6)
      {
        uint64_t v36 = 0;
        while (*(_DWORD *)(a8 + 4 * v36) != *(_DWORD *)(a11 + 4 * v31))
        {
          if (a6 == ++v36) {
            goto LABEL_42;
          }
        }
        uint64_t v36 = v36;
LABEL_48:
        *(_DWORD *)(a15 + 4 * v31) = *(_DWORD *)(a14 + 4 * v36);
        goto LABEL_30;
      }
LABEL_42:
      int v37 = *(_DWORD *)(v34 + 4);
      uint64_t v38 = v32;
      int v39 = a13;
      if (v32)
      {
        while (1)
        {
          int v40 = *v39++;
          if (v40 == v37) {
            break;
          }
          if (!--v38) {
            goto LABEL_45;
          }
        }
      }
      else
      {
LABEL_45:
        if (v37)
        {
          *(_DWORD *)(a15 + 4 * v31) = v37;
          goto LABEL_30;
        }
      }
      *(_DWORD *)(a15 + 4 * v31) = (*a16)++;
LABEL_30:
      ++v31;
    }
    while (v31 != v33);
  }
  return result;
}

BOOL acTrkGetTrackGroup(_DWORD *a1, unsigned int a2, int a3, _DWORD *a4)
{
  if (a2)
  {
    if (*a1 == a3)
    {
      BOOL result = 1;
      *a4 = 0;
      return result;
    }
    unint64_t v5 = 0;
    int v6 = a1 + 7;
    while (a2 - 1 != v5)
    {
      int v7 = *v6;
      v6 += 7;
      ++v5;
      if (v7 == a3)
      {
        BOOL result = v5 < a2;
        *a4 = v5;
        return result;
      }
    }
  }
  return 0;
}

unint64_t acTrkHandbyLGroup(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, int *a8, int *a9, uint64_t a10, int *a11, _DWORD *a12, unsigned int a13, int *a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v161 = 0;
  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  long long v156 = 0u;
  memset(v155, 0, sizeof(v155));
  size_t TempBuffers = acTrkGroupAssignGetTempBuffers(20, (uint64_t)a16, a3, (uint64_t)v155);
  bzero(a16, TempBuffers);
  uint64_t v26 = (void *)v157;
  int v154 = (float *)*((void *)&v156 + 1);
  uint64_t v151 = (_DWORD *)a1;
  if (a2)
  {
    uint64_t v27 = 0;
    int v28 = (_DWORD *)(a7 + 24);
    uint64_t v29 = (_OWORD *)(a1 + 452);
    uint64_t v30 = a7;
    do
    {
      *(v28 - 2) = 9;
      *(_OWORD *)(v28 - 6) = *v29;
      *(v28 - 1) = v27;
      *int v28 = ++v27;
      v28 += 15;
      uint64_t v29 = (_OWORD *)((char *)v29 + 1724);
    }
    while (a2 != v27);
    int v31 = v27 + 1;
    unsigned int v32 = a4;
  }
  else
  {
    int v31 = 1;
    unsigned int v32 = a4;
    uint64_t v30 = a7;
  }
  uint64_t v145 = (unsigned __int8 *)*((void *)&v157 + 1);
  uint64_t v33 = (unsigned int *)*((void *)&v158 + 1);
  uint64_t v34 = (int *)v160;
  if (v32)
  {
    uint64_t v35 = 0;
    unsigned int v36 = 0;
    unsigned int v37 = 0;
    uint64_t v38 = a3;
    while (1)
    {
      int v40 = *(_DWORD *)(v38 + 8);
      if (v40 == 11)
      {
        int v39 = &a9[15 * v36];
        *(_OWORD *)int v39 = *(_OWORD *)(v38 + 452);
        v39[4] = 11;
        v39[5] = v35;
        v39[6] = v31;
        v39[14] = *(_DWORD *)(a10 + 4 * v35);
        ++v36;
      }
      else
      {
        if (v40 != 10) {
          goto LABEL_10;
        }
        unsigned int v41 = &a8[15 * v37];
        *(_OWORD *)unsigned int v41 = *(_OWORD *)(v38 + 452);
        v41[4] = 10;
        v41[5] = v35;
        v41[6] = v31;
        v41[14] = *(_DWORD *)(a10 + 4 * v35);
        ++v37;
      }
      ++v31;
LABEL_10:
      ++v35;
      v38 += 512;
      if (v32 == v35) {
        goto LABEL_15;
      }
    }
  }
  unsigned int v37 = 0;
  unsigned int v36 = 0;
LABEL_15:
  uint64_t v148 = v30;
  if (a2 <= v37) {
    uint64_t v42 = v37;
  }
  else {
    uint64_t v42 = a2;
  }
  int v147 = v34;
  acTrkLGroupIoUCost(v30, a2, a8, v37, (uint64_t)v154, v23, v24, v25, 10, v34, a18);
  memcpy(v26, v154, 4 * (v42 * v42));
  if (a2 && v37)
  {
    bmMunkres(v154, v42, v145, v43, v33, v44, 0, v45);
    unint64_t v46 = 0;
    uint64_t v47 = a8 + 6;
    uint64_t v48 = v148;
    size_t v50 = TempBuffers;
    uint64_t v49 = a16;
    do
    {
      if (v46 < v37)
      {
        unsigned int v51 = v33[v46];
        if (v51 >= a2 || (float)(1.0 - *((float *)v26 + v46 + v51 * v42)) < 0.2) {
          *uint64_t v47 = v31++;
        }
        else {
          *uint64_t v47 = *(_DWORD *)(v148 + 60 * v51 + 24);
        }
      }
      ++v46;
      v47 += 15;
    }
    while (v42 != v46);
  }
  else if (a2)
  {
    uint64_t v48 = v148;
    size_t v50 = TempBuffers;
    uint64_t v49 = a16;
  }
  else
  {
    uint64_t v48 = v148;
    size_t v50 = TempBuffers;
    uint64_t v49 = a16;
    if (v37)
    {
      if (v37 >= 2)
      {
        uint64_t v52 = v37 & 0xFFFFFFFE;
        uint64_t v53 = a8 + 21;
        int v54 = v31;
        uint64_t v55 = v52;
        do
        {
          *(v53 - 15) = v54;
          *uint64_t v53 = v54 + 1;
          v53 += 30;
          v54 += 2;
          v55 -= 2;
        }
        while (v55);
        v31 += v52;
        if (v52 == v37) {
          goto LABEL_37;
        }
      }
      else
      {
        uint64_t v52 = 0;
      }
      uint64_t v56 = v37 - v52;
      uint64_t v57 = &a8[15 * v52 + 6];
      do
      {
        *uint64_t v57 = v31;
        v57 += 15;
        ++v31;
        --v56;
      }
      while (v56);
    }
  }
LABEL_37:
  bzero(v49, v50);
  if (a2 <= v36) {
    uint64_t v61 = v36;
  }
  else {
    uint64_t v61 = a2;
  }
  acTrkLGroupIoUCost(v48, a2, a9, v36, (uint64_t)v154, v58, v59, v60, 11, v147, a18);
  memcpy(v26, v154, 4 * (v61 * v61));
  if (a2 && v36)
  {
    bmMunkres(v154, v61, v145, v62, v33, v63, 0, v64);
    unint64_t v65 = 0;
    uint64_t v66 = v148;
    float v67 = a9;
    unsigned int v68 = a9 + 6;
    unint64_t result = a4;
    do
    {
      if (v65 < v36)
      {
        unsigned int v70 = v33[v65];
        if (v70 >= a2 || (float)(1.0 - *((float *)v26 + v65 + v70 * v61)) < 0.2) {
          *unsigned int v68 = v31++;
        }
        else {
          *unsigned int v68 = *(_DWORD *)(v148 + 60 * v70 + 24);
        }
      }
      ++v65;
      v68 += 15;
    }
    while (v61 != v65);
  }
  else
  {
    unint64_t result = a4;
    uint64_t v66 = v148;
    float v67 = a9;
    if (!a2 && v36)
    {
      if (v36 >= 2)
      {
        uint64_t v71 = v36 & 0xFFFFFFFE;
        uint64_t v72 = a9 + 21;
        int v73 = v31;
        uint64_t v74 = v71;
        do
        {
          *(v72 - 15) = v73;
          *uint64_t v72 = v73 + 1;
          v72 += 30;
          v73 += 2;
          v74 -= 2;
        }
        while (v74);
        if (v71 == v36) {
          goto LABEL_59;
        }
        v31 += v71;
      }
      else
      {
        uint64_t v71 = 0;
      }
      uint64_t v75 = v36 - v71;
      uint64_t v76 = &a9[15 * v71 + 6];
      do
      {
        *uint64_t v76 = v31;
        v76 += 15;
        ++v31;
        --v75;
      }
      while (v75);
    }
  }
LABEL_59:
  float v77 = (_DWORD *)a1;
  uint64_t v78 = a3;
  if (!a2) {
    goto LABEL_67;
  }
  if (a2 == 1)
  {
    uint64_t v79 = 0;
LABEL_65:
    uint64_t v84 = a2 - v79;
    uint64_t v85 = (_DWORD *)(v66 + 60 * v79 + 24);
    do
    {
      *(_DWORD *)(a1 + 1724 * *(v85 - 1) + 4) = *v85;
      v85 += 15;
      --v84;
    }
    while (v84);
    goto LABEL_67;
  }
  uint64_t v79 = a2 & 0xFFFFFFFE;
  uint64_t v80 = (int *)(v66 + 84);
  uint64_t v81 = v79;
  do
  {
    int v82 = *v80;
    uint64_t v83 = a1 + 1724 * *(v80 - 1);
    *(_DWORD *)(a1 + 1724 * *(v80 - 16) + 4) = *(v80 - 15);
    *(_DWORD *)(v83 + 4) = v82;
    v80 += 30;
    v81 -= 2;
  }
  while (v81);
  if (v79 != a2) {
    goto LABEL_65;
  }
LABEL_67:
  if (!v37) {
    goto LABEL_75;
  }
  if (v37 == 1)
  {
    uint64_t v86 = 0;
LABEL_73:
    uint64_t v91 = v37 - v86;
    uint64_t v92 = &a8[15 * v86 + 6];
    do
    {
      *(_DWORD *)(a3 + ((unint64_t)*(v92 - 1) << 9) + 4) = *v92;
      v92 += 15;
      --v91;
    }
    while (v91);
    goto LABEL_75;
  }
  uint64_t v86 = v37 & 0xFFFFFFFE;
  int v87 = a8 + 21;
  uint64_t v88 = v86;
  do
  {
    int v89 = *v87;
    unint64_t v90 = a3 + ((unint64_t)*(v87 - 1) << 9);
    *(_DWORD *)(a3 + ((unint64_t)*(v87 - 16) << 9) + 4) = *(v87 - 15);
    *(_DWORD *)(v90 + 4) = v89;
    v87 += 30;
    v88 -= 2;
  }
  while (v88);
  if (v86 != v37) {
    goto LABEL_73;
  }
LABEL_75:
  if (v36)
  {
    if (v36 == 1)
    {
      uint64_t v93 = 0;
    }
    else
    {
      uint64_t v93 = v36 & 0xFFFFFFFE;
      float v94 = v67 + 21;
      uint64_t v95 = v93;
      do
      {
        int v96 = *v94;
        unint64_t v97 = a3 + ((unint64_t)*(v94 - 1) << 9);
        *(_DWORD *)(a3 + ((unint64_t)*(v94 - 16) << 9) + 4) = *(v94 - 15);
        *(_DWORD *)(v97 + 4) = v96;
        v94 += 30;
        v95 -= 2;
      }
      while (v95);
      if (v93 == v36) {
        goto LABEL_83;
      }
    }
    uint64_t v98 = v36 - v93;
    int v99 = &v67[15 * v93 + 6];
    do
    {
      *(_DWORD *)(a3 + ((unint64_t)*(v99 - 1) << 9) + 4) = *v99;
      v99 += 15;
      --v98;
    }
    while (v98);
  }
LABEL_83:
  if (!a2)
  {
    *a14 = 0;
    return result;
  }
  uint64_t v100 = 0;
  unsigned int v101 = 0;
  unint64_t v103 = result;
  uint64_t v104 = a2;
  int v105 = (_DWORD *)(a3 + 8);
  uint64_t v149 = a2;
  do
  {
    int v110 = v77[431 * v100];
    int v109 = v77[431 * v100 + 1];
    if (a13)
    {
      if (*a12 == v110)
      {
        char v111 = 0;
        LODWORD(v112) = 0;
        if (!result) {
          goto LABEL_85;
        }
        goto LABEL_94;
      }
      unint64_t v112 = 0;
      unsigned int v113 = a13;
      long long v122 = a12 + 7;
      while (a13 - 1 != v112)
      {
        int v123 = *v122;
        v122 += 7;
        ++v112;
        if (v123 == v110)
        {
          if (v112 >= a13) {
            break;
          }
          char v111 = 0;
          if (result) {
            goto LABEL_94;
          }
          goto LABEL_85;
        }
      }
    }
    else
    {
      unsigned int v113 = 0;
    }
    a12[7 * v113] = v110;
    LODWORD(v112) = a13++;
    char v111 = 1;
    if (!result)
    {
LABEL_85:
      int v106 = v112;
      int v107 = &a12[7 * v112 + 3];
      goto LABEL_86;
    }
LABEL_94:
    uint64_t v114 = 0;
    unsigned int v115 = *(_DWORD *)(a19 + 84);
    BOOL v116 = 1;
    long long v117 = v105;
    while (*(v117 - 1) != v109 || *v117 != 10)
    {
      BOOL v116 = ++v114 < v103;
      v117 += 128;
      if (v103 == v114)
      {
        BOOL v116 = 0;
        LODWORD(v114) = 0;
        goto LABEL_113;
      }
    }
    int v118 = &a12[7 * v112];
    float v119 = v118 + 1;
    if (v118[3] > v115) {
      char v120 = 1;
    }
    else {
      char v120 = v111;
    }
    if ((v120 & 1) != 0 || !a12[7 * v112 + 5])
    {
      *float v119 = *a11;
      int v121 = (*a11)++;
    }
    else
    {
      int v121 = *v119;
    }
    *(_DWORD *)(v78 + (v114 << 9)) = v121;
LABEL_113:
    uint64_t v124 = 0;
    BOOL v125 = 1;
    uint64_t v126 = v105;
    do
    {
      if (*(v126 - 1) == v109 && *v126 == 11)
      {
        int v106 = v112;
        float v127 = &a12[7 * v112];
        unsigned int v129 = v127[4];
        unsigned int v128 = v127 + 4;
        if (v129 > v115) {
          char v130 = 1;
        }
        else {
          char v130 = v111;
        }
        if ((v130 & 1) != 0 || (uint64_t v131 = &a12[7 * v112], !v131[6]))
        {
          a12[7 * v112 + 1] = *a11;
          int v132 = (*a11)++;
        }
        else
        {
          int v132 = v131[2];
        }
        *(_DWORD *)(v78 + (v124 << 9)) = v132;
        if (v116)
        {
          uint64_t v133 = v101 + 1;
          memcpy((void *)(a5 + ((unint64_t)v101 << 9)), (const void *)(v78 + ((unint64_t)v114 << 9)), 0x200uLL);
          if (!v125)
          {
            LODWORD(result) = a4;
            int v105 = (_DWORD *)(a3 + 8);
            uint64_t v104 = v149;
            goto LABEL_133;
          }
          memcpy((void *)(a5 + (v133 << 9)), (const void *)(a3 + ((unint64_t)v124 << 9)), 0x200uLL);
          int v134 = &a12[7 * v112];
          v134[3] = 0;
          uint64_t v135 = v134 + 5;
          LODWORD(result) = a4;
          int v105 = (_DWORD *)(a3 + 8);
          uint64_t v104 = v149;
        }
        else
        {
          if (!v125) {
            goto LABEL_85;
          }
          unsigned int v136 = v101;
          memcpy((void *)(a5 + ((unint64_t)v101 << 9)), (const void *)(v78 + ((unint64_t)v124 << 9)), 0x200uLL);
          int v105 = (_DWORD *)(a3 + 8);
          uint64_t v104 = v149;
          LODWORD(result) = a4;
          uint64_t v135 = &a12[7 * v106 + 3];
          LODWORD(v133) = v136;
        }
        unsigned int v101 = v133 + 1;
        ++*v135;
        _DWORD *v128 = 0;
        float v108 = &a12[7 * v106 + 6];
        float v77 = v151;
        uint64_t v78 = a3;
        goto LABEL_87;
      }
      BOOL v125 = ++v124 < v103;
      v126 += 128;
    }
    while (v103 != v124);
    if (!v116) {
      goto LABEL_85;
    }
    LODWORD(v133) = v101 + 1;
    memcpy((void *)(a5 + ((unint64_t)v101 << 9)), (const void *)(v78 + ((unint64_t)v114 << 9)), 0x200uLL);
    int v105 = (_DWORD *)(a3 + 8);
    uint64_t v104 = v149;
    LODWORD(result) = a4;
    int v106 = v112;
LABEL_133:
    float v137 = &a12[7 * v106];
    v137[3] = 0;
    int v107 = v137 + 5;
    unsigned int v101 = v133;
    float v77 = v151;
    uint64_t v78 = a3;
LABEL_86:
    ++*v107;
    float v108 = &a12[7 * v106 + 4];
LABEL_87:
    ++*v108;
    ++v100;
  }
  while (v100 != v104);
  unint64_t result = (unint64_t)a14;
  *a14 = 0;
  if (a13)
  {
    int v138 = 0;
    uint64_t v139 = 0;
    do
    {
      int v140 = &a12[7 * v139];
      uint64_t v141 = v104;
      uint64_t v142 = v77;
      while (*v142 != *v140)
      {
        v142 += 431;
        if (!--v141) {
          goto LABEL_137;
        }
      }
      if (v139 != v138)
      {
        int v143 = &a12[7 * v138];
        long long v144 = *(_OWORD *)v140;
        *(_OWORD *)((char *)v143 + 12) = *(_OWORD *)(v140 + 3);
        *int v143 = v144;
        int v138 = *a14;
      }
      *a14 = ++v138;
LABEL_137:
      ++v139;
    }
    while (v139 != a13);
  }
  return result;
}

void acLGroupHandFbody(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5, int *a6, uint64_t a7, int a8, uint64_t a9, _DWORD *a10, uint64_t a11, _DWORD *a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16)
{
  uint64_t v57 = 0;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v52 = 0u;
  memset(v51, 0, sizeof(v51));
  unsigned int TempBuffers = acTrkGroupAssignGetTempBuffers(20, (uint64_t)a14, a3, (uint64_t)v51);
  bzero(a14, TempBuffers);
  uint64_t v28 = *((void *)&v52 + 1);
  uint64_t v27 = (void *)v53;
  if (a2)
  {
    uint64_t v29 = 0;
    unsigned int v30 = 0;
    uint64_t v31 = a1 + 452;
    int v32 = 1;
    do
    {
      if (!*(_DWORD *)(v31 + 60))
      {
        uint64_t v33 = a5 + 60 * v30;
        *(_DWORD *)(v33 + 16) = 9;
        *(_OWORD *)uint64_t v33 = *(_OWORD *)v31;
        *(_DWORD *)(v33 + 20) = v29;
        *(_DWORD *)(v33 + 24) = v32;
        ++v30;
        ++v32;
      }
      ++v29;
      v31 += 1724;
    }
    while (a2 != v29);
  }
  else
  {
    unsigned int v30 = 0;
    int v32 = 1;
  }
  uint64_t v34 = (int *)v56;
  unsigned int __dst = v27;
  if (a4)
  {
    uint64_t v35 = 0;
    unsigned int v36 = 0;
    uint64_t v37 = a3 + 452;
    do
    {
      if (!*(_DWORD *)(v37 + 60) && *(_DWORD *)(v37 - 444) == a8)
      {
        uint64_t v38 = &a6[15 * v36];
        *(_OWORD *)uint64_t v38 = *(_OWORD *)v37;
        v38[4] = 10;
        v38[5] = v35;
        v38[6] = v32;
        ++v36;
        ++v32;
      }
      v37 += 1724;
      ++v35;
    }
    while (a4 != v35);
  }
  else
  {
    unsigned int v36 = 0;
  }
  int v39 = (unsigned __int8 *)*((void *)&v53 + 1);
  int v40 = (unsigned int *)*((void *)&v54 + 1);
  if (v30 <= v36) {
    uint64_t v41 = v36;
  }
  else {
    uint64_t v41 = v30;
  }
  *a10 = 0;
  *a12 = 0;
  int v49 = a8;
  uint64_t v42 = (void *)v28;
  acTrkLGroupIoUCost(a5, v30, a6, v36, v28, v24, v25, v26, v49, v34, a16);
  memcpy(__dst, v42, 4 * (v41 * v41));
  if (v30 && v36)
  {
    bmMunkres((float *)v42, v41, v39, v43, v40, v44, 0, v45);
    unint64_t v46 = 0;
    uint64_t v47 = a6 + 6;
    do
    {
      if (v46 < v36)
      {
        unsigned int v48 = v40[v46];
        if (v48 >= v30 || (float)(1.0 - *((float *)__dst + v46 + v48 * v41)) < 0.2) {
          *uint64_t v47 = v32++;
        }
        else {
          *uint64_t v47 = *(_DWORD *)(a5 + 60 * v48 + 24);
        }
      }
      ++v46;
      v47 += 15;
    }
    while (v41 != v46);
  }
}

uint64_t AcDetNode::AcDetNode(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 250240) = 0;
  bzero((void *)a1, 0x58FuLL);
  *(_OWORD *)(a1 + 1440) = 0u;
  *(_OWORD *)(a1 + 1424) = 0u;
  *(_DWORD *)(a2 + _Block_object_dispose(&STACK[0x488], 8) = 0;
  *(void *)a2 = 0xDE7C00000002;
  return a1;
}

{
  *(void *)(a1 + 250240) = 0;
  bzero((void *)a1, 0x58FuLL);
  *(_OWORD *)(a1 + 1440) = 0u;
  *(_OWORD *)(a1 + 1424) = 0u;
  *(_DWORD *)(a2 + _Block_object_dispose(&STACK[0x488], 8) = 0;
  *(void *)a2 = 0xDE7C00000002;
  return a1;
}

void AcDetNode::~AcDetNode(AcDetNode *this)
{
  uint64_t v2 = (void *)((char *)this + 250240);
  uint64_t v3 = *((void *)this + 31280);
  if (v3)
  {
    MEMORY[0x24C548B00](v3, 0x1000C8077774924);
    *uint64_t v2 = 0;
  }
  uint64_t v4 = *((void *)this + 178);
  if (v4)
  {
    MEMORY[0x24C548B00](v4, 0x1000C8052888210);
    *((void *)this + 17_Block_object_dispose(&STACK[0x488], 8) = 0;
  }
  uint64_t v5 = *((void *)this + 179);
  if (v5)
  {
    MEMORY[0x24C548B00](v5, 0x1000C8052888210);
    *((void *)this + 179) = 0;
  }
  uint64_t v6 = *((void *)this + 180);
  if (v6)
  {
    MEMORY[0x24C548B00](v6, 0x1000C8052888210);
    *((void *)this + 180) = 0;
  }
  uint64_t v7 = *((void *)this + 181);
  if (v7)
  {
    MEMORY[0x24C548B00](v7, 0x1000C8052888210);
    *((void *)this + 181) = 0;
  }
}

uint64_t AcDetNode::init(uint64_t a1, void *a2, _DWORD *a3)
{
  if (*a3 != 2) {
    return 4294967289;
  }
  int v3 = a3[1];
  if (v3 == 56956 || v3 == 56945)
  {
    if (!a2) {
      a2 = &kAcDetNodeConfigFPS30RawData;
    }
    if (*((_DWORD *)a2 + 6)
      && *((_DWORD *)a2 + 5)
      && *((float *)a2 + 17) >= 0.0
      && *((_DWORD *)a2 + 61) <= 0x40u
      && *((_DWORD *)a2 + 62) <= 0x30u
      && *((_DWORD *)a2 + 63)
      && !*((unsigned char *)a2 + 387)
      && !*((unsigned char *)a2 + 451)
      && !*((unsigned char *)a2 + 515)
      && !*((unsigned char *)a2 + 579)
      && !*((unsigned char *)a2 + 643)
      && !*((unsigned char *)a2 + 707)
      && !*((unsigned char *)a2 + 771)
      && !*((unsigned char *)a2 + 835)
      && !*((unsigned char *)a2 + 899)
      && !*((unsigned char *)a2 + 963)
      && !*((unsigned char *)a2 + 1027)
      && !*((unsigned char *)a2 + 1091)
      && !*((unsigned char *)a2 + 1155)
      && !*((unsigned char *)a2 + 1219)
      && !*((unsigned char *)a2 + 1283)
      && !*((unsigned char *)a2 + 1347)
      && !*((unsigned char *)a2 + 1411))
    {
      uint64_t v6 = a1 + 250240;
      *(unsigned char *)(a1 + 1422) = 0;
      *(_WORD *)(a1 + 1420) = 0;
      memcpy((void *)a1, a2, 0x58CuLL);
      *(unsigned char *)(v6 + 20) = 0;
      *(void *)(a3 + 1) = 0xDE70000DE71;
      *(_DWORD *)(v6 + _Block_object_dispose(&STACK[0x488], 8) = 2538;
      operator new[]();
    }
  }
  return 4294967292;
}

void AcDetNode::generateFCOSLocations(AcDetNode *this, unsigned int a2, unsigned int a3, unsigned int a4, float *a5, float *a6, double a7, double a8, double a9, double a10, double a11, __n128 a12)
{
  if (a2 && a3)
  {
    unsigned int v12 = a4 >> 1;
    uint64_t v13 = a2;
    if (a3 > 7)
    {
      int32x4_t v28 = vdupq_n_s32(a4);
      int32x4_t v29 = vdupq_n_s32(v12);
      if ((a3 & 0xFFFFFFF8) == (unint64_t)a3)
      {
        unsigned int v30 = 0;
        uint64_t v31 = 0;
        v32.i64[0] = 0x400000004;
        v32.i64[1] = 0x400000004;
        v33.i64[0] = 0x800000008;
        v33.i64[1] = 0x800000008;
        do
        {
          uint64_t v34 = v30;
          a12.n128_f32[0] = (float)(v12 + v31 * a4);
          if ((unint64_t)((char *)a6 - (char *)a5) > 0x1F)
          {
            int v39 = (__n128 *)&a6[v34 + 4];
            int v40 = (float32x4_t *)&a5[v34 + 4];
            a12 = (__n128)vdupq_lane_s32((int32x2_t)a12.n128_u64[0], 0);
            uint64_t v41 = a3;
            int32x4_t v42 = (int32x4_t)xmmword_246D9F130;
            do
            {
              v40[-1] = vcvtq_f32_u32((uint32x4_t)vmlaq_s32(v29, v42, v28));
              *int v40 = vcvtq_f32_u32((uint32x4_t)vmlaq_s32(v29, vaddq_s32(v42, v32), v28));
              v39[-1] = a12;
              *int v39 = a12;
              int32x4_t v42 = vaddq_s32(v42, v33);
              v39 += 2;
              v40 += 2;
              v41 -= 8;
            }
            while (v41);
          }
          else
          {
            uint64_t v35 = &a6[v34];
            unsigned int v36 = &a5[v34];
            unsigned int v37 = a4 >> 1;
            uint64_t v38 = a3;
            do
            {
              *v36++ = (float)v37;
              *v35++ = a12.n128_f32[0];
              v37 += a4;
              --v38;
            }
            while (v38);
          }
          ++v31;
          v30 += a3;
        }
        while (v31 != a2);
      }
      else
      {
        unsigned int v43 = 0;
        uint64_t v44 = 0;
        v45.i64[0] = 0x400000004;
        v45.i64[1] = 0x400000004;
        v46.i64[0] = 0x800000008;
        v46.i64[1] = 0x800000008;
        do
        {
          uint64_t v47 = v43;
          a12.n128_f32[0] = (float)(v12 + v44 * a4);
          if ((unint64_t)((char *)a6 - (char *)a5) >= 0x20)
          {
            int v49 = &a6[v47 + 4];
            size_t v50 = (float32x4_t *)&a5[v47 + 4];
            int32x4_t v51 = vdupq_lane_s32((int32x2_t)a12.n128_u64[0], 0);
            uint64_t v52 = a3 & 0xFFFFFFF8;
            int32x4_t v53 = (int32x4_t)xmmword_246D9F130;
            do
            {
              v50[-1] = vcvtq_f32_u32((uint32x4_t)vmlaq_s32(v29, v53, v28));
              float32x4_t *v50 = vcvtq_f32_u32((uint32x4_t)vmlaq_s32(v29, vaddq_s32(v53, v45), v28));
              *((int32x4_t *)v49 - 1) = v51;
              *(int32x4_t *)int v49 = v51;
              int32x4_t v53 = vaddq_s32(v53, v46);
              v49 += 8;
              v50 += 2;
              v52 -= 8;
            }
            while (v52);
            uint64_t v48 = a3 & 0xFFFFFFF8;
          }
          else
          {
            uint64_t v48 = 0;
          }
          uint64_t v54 = a3 - v48;
          uint64_t v55 = v47 * 4 + 4 * v48;
          long long v56 = (_DWORD *)((char *)a6 + v55);
          uint64_t v57 = (float *)((char *)a5 + v55);
          unsigned int v58 = v12 + a4 * v48;
          do
          {
            *v57++ = (float)v58;
            *v56++ = a12.n128_u32[0];
            v58 += a4;
            --v54;
          }
          while (v54);
          ++v44;
          v43 += a3;
        }
        while (v44 != v13);
      }
    }
    else
    {
      unsigned int v14 = 0;
      float v15 = (float)(v12 + a4);
      unsigned int v16 = v12 + 2 * a4;
      float v17 = (float)v16;
      float v18 = (float)(v16 + a4);
      unsigned int v19 = v12 + 4 * a4;
      float v20 = (float)v19;
      float v21 = (float)(v19 + a4);
      float v22 = (float)(v12 + 6 * a4);
      float v23 = (float)v12;
      do
      {
        float v24 = (float)v12;
        uint64_t v25 = v14;
        uint64_t v26 = &a5[v25];
        uint64_t v27 = &a6[v25];
        *uint64_t v26 = v23;
        *uint64_t v27 = (float)v12;
        if (a3 != 1)
        {
          v26[1] = v15;
          v27[1] = v24;
          if (a3 != 2)
          {
            void v26[2] = v17;
            v27[2] = v24;
            if (a3 != 3)
            {
              void v26[3] = v18;
              v27[3] = v24;
              if (a3 != 4)
              {
                v26[4] = v20;
                v27[4] = v24;
                if (a3 != 5)
                {
                  v26[5] = v21;
                  v27[5] = v24;
                  if (a3 != 6)
                  {
                    v26[6] = v22;
                    v27[6] = v24;
                  }
                }
              }
            }
          }
        }
        v14 += a3;
        v12 += a4;
        --v13;
      }
      while (v13);
    }
  }
}

void AcDetNode::postProcess(void *__dst, uint64_t *a2, uint64_t a3, uint64_t a4, _DWORD *a5, uint64_t a6, uint64_t a7, float a8)
{
  if (*a5 == 2 && a3 == 17 && a5[1] == 56945)
  {
    int v10 = a4;
    if (!__dst[178]) {
      operator new[]();
    }
    int v12 = *(unsigned __int8 *)(a6 + 21);
    if (v12 != *((unsigned __int8 *)__dst + 250260))
    {
      *((unsigned char *)__dst + 250260) = v12;
      if (v12) {
        uint64_t v13 = &kAcDetNodeConfigFPS5RawData;
      }
      else {
        uint64_t v13 = &kAcDetNodeConfigFPS30RawData;
      }
      memcpy(__dst, v13, 0x58CuLL);
    }
    if (v10)
    {
      AcDetNode::postProcessDetHalf((uint64_t)__dst, a2, a3, a4, a7);
      AcDetNode::postProcessHandHalf((uint64_t)__dst, a2, v14, v15, a7);
    }
    else
    {
      AcDetNode::postProcessDetFloat((uint64_t)__dst, a2, a8, a3, a4, a7);
      if (!v18) {
        AcDetNode::postProcessHandFloat((uint64_t)__dst, a2, v16, v17, a7);
      }
    }
  }
}

uint64_t AcDetNode::postProcessDetHalf(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *a2;
  uint64_t v8 = a2[3];
  uint64_t v304 = a5 + 40684;
  uint64_t v9 = a2[6];
  int v10 = (unsigned int *)(a1 + 239696);
  uint64_t v308 = a2[9];
  int8x16_t v11 = (unsigned int *)(a1 + 99760);
  uint64_t v303 = a2[12];
  uint64_t v300 = a2[45];
  uint64_t v301 = a2[15];
  uint64_t v298 = (unsigned __int16 *)a2[48];
  uint64_t v299 = a2[18];
  *(_DWORD *)(a1 + 99760) = 0;
  *(_DWORD *)(a1 + 102964) = 0;
  *(_DWORD *)(a1 + 10392_Block_object_dispose(&STACK[0x488], 8) = 0;
  std::chrono::steady_clock::now();
  uint64_t v12 = 0;
  *(_OWORD *)int v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  long long v302 = v10;
  *((_OWORD *)v10 + 2) = 0u;
  float v13 = *(float *)(a1 + 68);
  uint64_t v306 = a2[6];
  uint64_t v307 = a2[3];
  while (2)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    float v16 = 0.05;
    if (v12 == 1)
    {
      unsigned int v17 = 10;
    }
    else
    {
      float v16 = v13;
      unsigned int v17 = 12;
    }
    while (2)
    {
      uint64_t v18 = 0;
      uint64_t v19 = v14;
      do
      {
        if (*(__int16 *)(v7 + v18) < 0) {
          goto LABEL_13;
        }
        unsigned int v26 = *(unsigned __int16 *)(v7 + v18);
        unsigned int v27 = (v26 >> 10) & 0x1F;
        if (v27 < v17) {
          goto LABEL_13;
        }
        if (v12 != 1 && (v26 & 0x3F8) <= 0x257 && v27 == v17) {
          goto LABEL_13;
        }
        unsigned int v29 = *(__int16 *)(v8 + v18);
        unsigned int v30 = v29 & 0x80000000;
        int v31 = (v29 >> 10) & 0x1F;
        int v32 = *(unsigned __int16 *)(v8 + v18) << 13;
        unsigned int v33 = v32 & 0x7FE000;
        if (v31 == 31)
        {
          if (v33) {
            int v37 = 2143289344;
          }
          else {
            int v37 = 2139095040;
          }
          int v36 = v30 | v32 | v37;
        }
        else
        {
          if (!v31)
          {
            if (!v33)
            {
              if (v30) {
                float v38 = -0.0;
              }
              else {
                float v38 = 0.0;
              }
              goto LABEL_31;
            }
            unsigned int v34 = __clz(v33);
            char v35 = v34 - 8;
            int v31 = 9 - v34;
            unsigned int v33 = (v32 << v35) & 0x7FE000;
          }
          int v36 = ((v33 | (v31 << 23)) + 939524096) | v30;
        }
        float v38 = *(float *)&v36;
LABEL_31:
        int v39 = v26 << 13;
        int v40 = (v39 & 0x7FE000 | (v27 << 23)) + 939524096;
        if ((v39 & 0x7FE000) != 0) {
          int v41 = 2143289344;
        }
        else {
          int v41 = 2139095040;
        }
        int v42 = v41 | v39;
        if (v27 != 31) {
          int v42 = v40;
        }
        if (!*(unsigned char *)(a1 + v12 + 224)) {
          goto LABEL_13;
        }
        float v43 = *(float *)&v42;
        if (v16 >= *(float *)&v42) {
          goto LABEL_13;
        }
        uint64_t v44 = *v11;
        if (v44 > 0xBFE) {
          goto LABEL_13;
        }
        float v45 = sqrtf(v38 * *(float *)&v42);
        if (v12 == 1 && v13 > *(float *)&v42)
        {
          float v46 = *(float *)(a1 + 100);
          if (v45 > v46) {
            float v45 = v46 + -0.01;
          }
        }
        uint64_t v47 = a1 + 32 * v44;
        *(float *)(v47 + 1480) = v45;
        *(_DWORD *)(v47 + 1472) = v12;
        unsigned int v48 = *(__int16 *)(v9 + v18);
        unsigned int v49 = v48 & 0x80000000;
        int v50 = (v48 >> 10) & 0x1F;
        int v51 = *(unsigned __int16 *)(v9 + v18) << 13;
        unsigned int v52 = v51 & 0x7FE000;
        if (v50 == 31)
        {
          if (v52) {
            int v56 = 2143289344;
          }
          else {
            int v56 = 2139095040;
          }
          int v55 = v49 | v51 | v56;
          goto LABEL_55;
        }
        if (v50) {
          goto LABEL_47;
        }
        if (v52)
        {
          unsigned int v53 = __clz(v52);
          char v54 = v53 - 8;
          int v50 = 9 - v53;
          unsigned int v52 = (v51 << v54) & 0x7FE000;
LABEL_47:
          int v55 = ((v52 | (v50 << 23)) + 939524096) | v49;
LABEL_55:
          float v57 = *(float *)&v55;
          goto LABEL_56;
        }
        if (v49) {
          float v57 = -0.0;
        }
        else {
          float v57 = 0.0;
        }
LABEL_56:
        unsigned int v58 = *(__int16 *)(v9 + v18 + 6144);
        unsigned int v59 = v58 & 0x80000000;
        int v60 = (v58 >> 10) & 0x1F;
        int v61 = *(unsigned __int16 *)(v9 + v18 + 6144) << 13;
        unsigned int v62 = v61 & 0x7FE000;
        if (v60 == 31)
        {
          if (v62) {
            int v66 = 2143289344;
          }
          else {
            int v66 = 2139095040;
          }
          int v65 = v59 | v61 | v66;
          goto LABEL_65;
        }
        if (v60) {
          goto LABEL_60;
        }
        if (v62)
        {
          unsigned int v63 = __clz(v62);
          char v64 = v63 - 8;
          int v60 = 9 - v63;
          unsigned int v62 = (v61 << v64) & 0x7FE000;
LABEL_60:
          int v65 = ((v62 | (v60 << 23)) + 939524096) | v59;
LABEL_65:
          float v67 = *(float *)&v65;
          goto LABEL_66;
        }
        if (v59) {
          float v67 = -0.0;
        }
        else {
          float v67 = 0.0;
        }
LABEL_66:
        unsigned int v68 = *(__int16 *)(v9 + v18 + 12288);
        unsigned int v69 = v68 & 0x80000000;
        int v70 = (v68 >> 10) & 0x1F;
        int v71 = *(unsigned __int16 *)(v9 + v18 + 12288) << 13;
        unsigned int v72 = v71 & 0x7FE000;
        if (v70 == 31)
        {
          if (v72) {
            int v76 = 2143289344;
          }
          else {
            int v76 = 2139095040;
          }
          int v75 = v69 | v71 | v76;
          goto LABEL_75;
        }
        if (v70) {
          goto LABEL_70;
        }
        if (v72)
        {
          unsigned int v73 = __clz(v72);
          char v74 = v73 - 8;
          int v70 = 9 - v73;
          unsigned int v72 = (v71 << v74) & 0x7FE000;
LABEL_70:
          int v75 = ((v72 | (v70 << 23)) + 939524096) | v69;
LABEL_75:
          float v77 = *(float *)&v75;
          goto LABEL_76;
        }
        if (v69) {
          float v77 = -0.0;
        }
        else {
          float v77 = 0.0;
        }
LABEL_76:
        unsigned int v78 = *(__int16 *)(v9 + v18 + 18432);
        unsigned int v79 = v78 & 0x80000000;
        int v80 = (v78 >> 10) & 0x1F;
        int v81 = *(unsigned __int16 *)(v9 + v18 + 18432) << 13;
        unsigned int v82 = v81 & 0x7FE000;
        if (v80 == 31)
        {
          if (v82) {
            int v86 = 2143289344;
          }
          else {
            int v86 = 2139095040;
          }
          int v85 = v79 | v81 | v86;
        }
        else
        {
          if (!v80)
          {
            if (!v82)
            {
              if (v79) {
                float v87 = -0.0;
              }
              else {
                float v87 = 0.0;
              }
              goto LABEL_86;
            }
            unsigned int v83 = __clz(v82);
            char v84 = v83 - 8;
            int v80 = 9 - v83;
            unsigned int v82 = (v81 << v84) & 0x7FE000;
          }
          int v85 = ((v82 | (v80 << 23)) + 939524096) | v79;
        }
        float v87 = *(float *)&v85;
LABEL_86:
        float v88 = (float)*(unsigned int *)(a1 + 252);
        uint64_t v89 = *(void *)(a1 + 1424);
        float v90 = *(float *)(v89 + 4 * v19) - (float)(v57 * v88);
        uint64_t v91 = a1 + 32 * v44;
        *(float *)(v91 + 1456) = v90;
        uint64_t v92 = *(void *)(a1 + 1432);
        float v93 = v87 * v88;
        float v94 = *(float *)(v92 + 4 * v19) - (float)(v67 * v88);
        *(float *)(v91 + 1460) = v94;
        float v95 = (float)(v77 * v88) + *(float *)(v89 + 4 * v19);
        *(float *)(v91 + 1464) = v95;
        float v96 = v93 + *(float *)(v92 + 4 * v19);
        *(float *)(v91 + 146_Block_object_dispose(&STACK[0x488], 8) = v96;
        *(_DWORD *)(v91 + 1476) = v19;
        if (!v12)
        {
          unsigned int v99 = *(__int16 *)(v308 + 6144);
          unsigned int v100 = v99 & 0x80000000;
          int v22 = (v99 >> 10) & 0x1F;
          int v101 = *(unsigned __int16 *)(v308 + 6144) << 13;
          unsigned int v23 = v101 & 0x7FE000;
          if (v22 == 31)
          {
            if (v23) {
              int v102 = 2143289344;
            }
            else {
              int v102 = 2139095040;
            }
            int v24 = v100 | v101 | v102;
          }
          else
          {
            if (!v22)
            {
              if (!v23)
              {
                if (v100) {
                  float v25 = -0.0;
                }
                else {
                  float v25 = 0.0;
                }
                goto LABEL_11;
              }
              unsigned int v20 = __clz(v23);
              char v21 = v20 - 8;
              int v22 = 9 - v20;
              unsigned int v23 = (v101 << v21) & 0x7FE000;
            }
            int v24 = ((v23 | (v22 << 23)) + 939524096) | v100;
          }
          float v25 = *(float *)&v24;
LABEL_11:
          *(float *)(a1 + 32 * v44 + 1484) = (float)(v25 * -360.0) + 180.0;
LABEL_12:
          ++*(_DWORD *)(a1 + 4 * v12 + 239696);
          unsigned int *v11 = v44 + 1;
          goto LABEL_13;
        }
        if (v12 != 3 || v43 >= 0.32) {
          goto LABEL_12;
        }
        float v97 = (float)((float)(v95 - v90) * (float)(v96 - v94))
            / (float)(*(_DWORD *)(a1 + 20) * *(_DWORD *)(a1 + 24));
        if (v97 <= 0.9 || v97 >= 1.1) {
          goto LABEL_12;
        }
LABEL_13:
        v18 += 2;
        ++v19;
      }
      while (v18 != 128);
      v9 += 128;
      v8 += 128;
      v7 += 128;
      ++v15;
      v14 += 64;
      if (v15 != 48) {
        continue;
      }
      break;
    }
    ++v12;
    uint64_t v9 = v306;
    uint64_t v8 = v307;
    if (v12 != 12) {
      continue;
    }
    break;
  }
  std::chrono::steady_clock::now();
  unsigned int *v11 = acNonMaxSuppression(a1 + 1456, *v11, (_DWORD *)(a1 + 227408), 500, *(float *)(a1 + 72), *(float *)(a1 + 76));
  std::chrono::steady_clock::now();
  if (*(unsigned char *)(a1 + 1420) && *(unsigned char *)(a1 + 1421)) {
    uint64_t v103 = a1 + 160;
  }
  else {
    uint64_t v103 = a1 + 112;
  }
  LODWORD(v104) = *v11;
  if (*v11 >= 0xBFF) {
    uint64_t v104 = 3071;
  }
  else {
    uint64_t v104 = v104;
  }
  unsigned int *v11 = v104;
  unsigned int v105 = 0;
  if (v104)
  {
    int v106 = (float *)(a1 + 1480);
    do
    {
      if (*v106 > *(float *)(v103 + 4 * *((unsigned int *)v106 - 2)))
      {
        uint64_t v107 = v105++;
        long long v108 = *(_OWORD *)(v106 - 2);
        int v109 = (_OWORD *)(a1 + 1456 + 32 * v107);
        *int v109 = *(_OWORD *)(v106 - 6);
        v109[1] = v108;
      }
      v106 += 8;
      --v104;
    }
    while (v104);
  }
  unsigned int *v11 = v105;
  unsigned int v110 = acRemoveHeadOverlapBoxes((_OWORD *)(a1 + 1456), v105, (unsigned __int8 *)(a1 + 224336), *(float *)(a1 + 76));
  unsigned int *v11 = v110;
  bmHeapsort(a1 + 1456, v110, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectClassCompareReverse);
  *(_OWORD *)long long v302 = 0u;
  *((_OWORD *)v302 + 1) = 0u;
  *((_OWORD *)v302 + 2) = 0u;
  uint64_t v111 = *v11;
  if (v111)
  {
    unint64_t v112 = (unsigned int *)(a1 + 1472);
    do
    {
      unsigned int v114 = *v112;
      v112 += 8;
      uint64_t v113 = v114;
      if (v114 == 1)
      {
        ++*v302;
      }
      else if (v113 <= 0xB)
      {
        ++*(_DWORD *)(a1 + 4 * v113 + 239696);
      }
      --v111;
    }
    while (v111);
    unint64_t v115 = *v302;
  }
  else
  {
    unint64_t v115 = 0;
  }
  bmHeapsort(a1 + 1456, v115, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  uint64_t v116 = *v302;
  bmHeapsort(a1 + 1456 + 32 * v116, v302[1], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  uint64_t v117 = v302[1] + v116;
  bmHeapsort(a1 + 1456 + 32 * v117, v302[2], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  uint64_t v118 = v302[2] + v117;
  bmHeapsort(a1 + 1456 + 32 * v118, v302[3], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  uint64_t v119 = v302[3] + v118;
  bmHeapsort(a1 + 1456 + 32 * v119, v302[4], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  uint64_t v120 = v302[4] + v119;
  bmHeapsort(a1 + 1456 + 32 * v120, v302[5], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  uint64_t v121 = v302[5] + v120;
  bmHeapsort(a1 + 1456 + 32 * v121, v302[6], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  uint64_t v122 = v302[6] + v121;
  bmHeapsort(a1 + 1456 + 32 * v122, v302[7], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  uint64_t v123 = v302[7] + v122;
  bmHeapsort(a1 + 1456 + 32 * v123, v302[8], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  uint64_t v124 = v302[8] + v123;
  bmHeapsort(a1 + 1456 + 32 * v124, v302[9], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  uint64_t v125 = v302[9] + v124;
  bmHeapsort(a1 + 1456 + 32 * v125, v302[10], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  bmHeapsort(a1 + 1456 + 32 * (v302[10] + v125), v302[11], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  unsigned int v129 = v302[2];
  char v130 = (float32x2_t *)*v11;
  BOOL v135 = v129 >= 0xF;
  unsigned int v131 = v129 - 15;
  if (v131 != 0 && v135)
  {
    unsigned int v132 = 0;
    if (v130)
    {
      uint64_t v133 = (_DWORD *)(a1 + 1472);
      unsigned int v134 = v131;
      uint64_t v138 = a5;
      do
      {
        BOOL v135 = *v133 == 2 && ++v132 >= 0x10;
        if (v135)
        {
          uint64_t v136 = a1 + 32 * v134;
          long long v137 = *(_OWORD *)(v136 + 1472);
          *((_OWORD *)v133 - 1) = *(_OWORD *)(v136 + 1456);
          *(_OWORD *)uint64_t v133 = v137;
        }
        ++v134;
        v133 += 8;
        char v130 = (float32x2_t *)((char *)v130 - 1);
      }
      while (v130);
      unsigned int v132 = *v11;
    }
    else
    {
      uint64_t v138 = a5;
    }
    LODWORD(v130) = v132 - v131;
    unsigned int *v11 = v132 - v131;
  }
  else
  {
    uint64_t v138 = a5;
  }
  unsigned int v139 = v302[11];
  if (v139 >= 0x10)
  {
    unsigned int v140 = v139 - 8;
    if (v130)
    {
      int v141 = 0;
      uint64_t v142 = (_OWORD *)(a1 + 1472);
      unsigned int v143 = v140;
      uint64_t v144 = v130;
      do
      {
        if (*(_DWORD *)v142 == 11 && ++v141 >= 0x10)
        {
          uint64_t v146 = a1 + 32 * v143;
          long long v147 = *(_OWORD *)(v146 + 1472);
          *(v142 - 1) = *(_OWORD *)(v146 + 1456);
          *uint64_t v142 = v147;
        }
        ++v143;
        v142 += 2;
        --v144;
      }
      while (v144);
      unsigned int v148 = *v11;
      unsigned int v139 = v302[11];
    }
    else
    {
      unsigned int v148 = 0;
    }
    LODWORD(v130) = v148 - v140;
    unsigned int *v11 = v148 - v140;
  }
  if (v139 > 5)
  {
LABEL_174:
    *(_DWORD *)(v138 + 7680) = 0;
    *(_DWORD *)uint64_t v304 = 0;
    *(_DWORD *)(v304 + 10244) = 0;
    if (!v130) {
      goto LABEL_337;
    }
    unsigned int v153 = 0;
    unint64_t v154 = 0;
    int v155 = (float *)(a1 + 1480);
    float32x2_t v156 = (float32x2_t)vdup_n_s32(0x43B40000u);
    int32x4_t v157 = vdupq_n_s32(0xFFFFFE97);
    while (v153 < 0xF)
    {
      if (*((_DWORD *)v155 - 2) > 1u) {
        goto LABEL_178;
      }
      uint64_t v160 = v138 + ((unint64_t)v153 << 9);
      *(_DWORD *)(v160 + 4) = 0;
      *(_DWORD *)(v160 + _Block_object_dispose(&STACK[0x488], 8) = 0;
      *(_DWORD *)uint64_t v160 = v154 + 1;
      int v161 = (int)(float)((float)(*v155 * 1000.0) + 0.5);
      if (v161 >= 1000) {
        int v161 = 1000;
      }
      if (v161 <= 1) {
        int v161 = 1;
      }
      *(_DWORD *)(v160 + 2_Block_object_dispose(&STACK[0x488], 8) = v161;
      int v162 = *((_DWORD *)v155 - 2);
      float32x2_t v163 = *(float32x2_t *)(v155 - 6);
      *(float32x2_t *)(v160 + 12) = v163;
      float32x2_t v127 = *(float32x2_t *)(v155 - 4);
      *(float32x2_t *)&long long v126 = vsub_f32(v127, v163);
      *(void *)(v160 + 20) = v126;
      float32x2_t v164 = (unsigned char *)(v160 + 96);
      if (!v162)
      {
        *float32x2_t v164 = 1;
        uint64_t v165 = *((unsigned int *)v155 - 1);
        unsigned int v166 = *(__int16 *)(v308 + 2 * v165 + 12288);
        unsigned int v167 = v166 & 0x80000000;
        int v168 = (v166 >> 10) & 0x1F;
        int v169 = *(unsigned __int16 *)(v308 + 2 * v165 + 12288) << 13;
        unsigned int v170 = v169 & 0x7FE000;
        if (v168 == 31)
        {
          if (v170) {
            int v173 = 2143289344;
          }
          else {
            int v173 = 2139095040;
          }
          int v172 = v167 | v169 | v173;
          goto LABEL_195;
        }
        if (v168) {
          goto LABEL_190;
        }
        if (v170)
        {
          unsigned int v171 = __clz(v170);
          int v168 = 9 - v171;
          unsigned int v170 = (v169 << (v171 - 8)) & 0x7FE000;
LABEL_190:
          int v172 = ((v170 | (v168 << 23)) + 939524096) | v167;
LABEL_195:
          float v174 = *(float *)&v172;
        }
        else if (v167)
        {
          float v174 = -0.0;
        }
        else
        {
          float v174 = 0.0;
        }
        if (v174 < 1.05 && v174 > 1.0) {
          float v174 = 1.0;
        }
        v176.f32[0] = (float)(v174 * 180.0) + -90.0;
        int v177 = (int)v176.f32[0];
        if ((int)v176.f32[0] >= 90) {
          int v177 = 90;
        }
        if (v177 <= -90) {
          int v177 = -90;
        }
        uint64_t v178 = v165 + 3072;
        unsigned int v179 = *(__int16 *)(v308 + 2 * (v165 + 3072));
        unsigned int v180 = v179 & 0x80000000;
        int v181 = (v179 >> 10) & 0x1F;
        int v182 = *(unsigned __int16 *)(v308 + 2 * (v165 + 3072)) << 13;
        unsigned int v183 = v182 & 0x7FE000;
        if (v181 == 31)
        {
          if (v183) {
            int v186 = 2143289344;
          }
          else {
            int v186 = 2139095040;
          }
          int v185 = v180 | v182 | v186;
          goto LABEL_214;
        }
        if (v181) {
          goto LABEL_209;
        }
        if (v183)
        {
          unsigned int v184 = __clz(v183);
          int v181 = 9 - v184;
          unsigned int v183 = (v182 << (v184 - 8)) & 0x7FE000;
LABEL_209:
          int v185 = ((v183 | (v181 << 23)) + 939524096) | v180;
LABEL_214:
          float v187 = *(float *)&v185;
        }
        else if (v180)
        {
          float v187 = -0.0;
        }
        else
        {
          float v187 = 0.0;
        }
        float v188 = 180.0 - (float)(v187 * 360.0);
        unsigned int v189 = (int)(float)((float)(v188 + 180.0) + 360.0) % 360;
        int v190 = v189 + 360;
        if (v189 <= 0xFFFFFE97) {
          int v190 = (int)(float)((float)(v188 + 180.0) + 360.0) % 360;
        }
        unsigned int v191 = *(__int16 *)(v308 + 2 * v165);
        unsigned int v192 = v191 & 0x80000000;
        int v193 = (v191 >> 10) & 0x1F;
        int v194 = *(unsigned __int16 *)(v308 + 2 * v165) << 13;
        unsigned int v195 = v194 & 0x7FE000;
        if (v193 == 31)
        {
          if (v195) {
            int v199 = 2143289344;
          }
          else {
            int v199 = 2139095040;
          }
          int v198 = v192 | v194 | v199;
          goto LABEL_226;
        }
        if (v193) {
          goto LABEL_221;
        }
        if (v195)
        {
          unsigned int v196 = __clz(v195);
          char v197 = v196 - 8;
          int v193 = 9 - v196;
          unsigned int v195 = (v194 << v197) & 0x7FE000;
LABEL_221:
          int v198 = ((v195 | (v193 << 23)) + 939524096) | v192;
LABEL_226:
          float v200 = *(float *)&v198;
        }
        else if (v192)
        {
          float v200 = -0.0;
        }
        else
        {
          float v200 = 0.0;
        }
        uint64_t v138 = a5;
        int v201 = (int)(float)((float)((float)v190 / 30.0) + 0.5);
        float v128 = (float)(v200 * 180.0) + -90.0;
        unsigned int v202 = (int)(float)((float)((float)(v177 + 90) / 45.0) + 0.5) % 5;
        if (v202 > 0xFFFFFFFA) {
          v202 += 5;
        }
        float32x2_t v203 = (int32x2_t *)(a5 + ((unint64_t)v153 << 9));
        v203[4].i32[0] = AcDetNode::m_kFacePoseYawCenters[v202];
        unsigned int v204 = v201 % 12;
        int v205 = v201 % 12 + 12;
        if (v204 > 0xFFFFFFF3) {
          unsigned int v204 = v205;
        }
        v203[4].i32[1] = AcDetNode::m_kFacePoseRollCenters[v204];
        v176.f32[1] = v188;
        v203[5] = vcvt_s32_f32((float32x2_t)vbsl_s8((int8x8_t)vcgez_f32(vadd_f32(v176, (float32x2_t)0x3400000034000000)), (int8x8_t)v176, (int8x8_t)vadd_f32(v176, v156)));
        if ((float)(v128 + 0.00000011921) < 0.0) {
          float v206 = v128 + 360.0;
        }
        else {
          float v206 = v128;
        }
        v203[6].i32[0] = (int)v206;
        unsigned int v207 = *(__int16 *)(v303 + 2 * v165);
        unsigned int v208 = v207 & 0x80000000;
        int v209 = (v207 >> 10) & 0x1F;
        int v210 = *(unsigned __int16 *)(v303 + 2 * v165) << 13;
        unsigned int v211 = v210 & 0x7FE000;
        if (v209 == 31)
        {
          if (v211) {
            int v214 = 2143289344;
          }
          else {
            int v214 = 2139095040;
          }
          int v213 = v208 | v210 | v214;
          goto LABEL_243;
        }
        if (v209) {
          goto LABEL_238;
        }
        if (v211)
        {
          unsigned int v212 = __clz(v211);
          int v209 = 9 - v212;
          uint64_t v138 = a5;
          unsigned int v211 = (v210 << (v212 - 8)) & 0x7FE000;
LABEL_238:
          int v213 = ((v211 | (v209 << 23)) + 939524096) | v208;
LABEL_243:
          float v215 = *(float *)&v213;
        }
        else if (v208)
        {
          float v215 = -0.0;
        }
        else
        {
          float v215 = 0.0;
        }
        float v216 = (float)(v215 - *(float *)(a1 + 236)) / (float)(1.0 - *(float *)(a1 + 236));
        if (v216 >= 0.0)
        {
          int v217 = (int)(float)((float)(v216 * 1000.0) + 0.5);
          if (v217 >= 1000) {
            int v217 = 1000;
          }
          if (v217 <= 1) {
            int v217 = 1;
          }
          uint64_t v165 = *((unsigned int *)v155 - 1);
          uint64_t v178 = v165 + 3072;
        }
        else
        {
          int v217 = 0;
        }
        *(_DWORD *)(v138 + ((unint64_t)v153 << 9) + 12_Block_object_dispose(&STACK[0x488], 8) = v217;
        unsigned int v218 = *(__int16 *)(v303 + 2 * v178);
        unsigned int v219 = v218 & 0x80000000;
        int v220 = (v218 >> 10) & 0x1F;
        int v221 = *(unsigned __int16 *)(v303 + 2 * v178) << 13;
        unsigned int v222 = v221 & 0x7FE000;
        if (v220 == 31)
        {
          if (v222) {
            int v225 = 2143289344;
          }
          else {
            int v225 = 2139095040;
          }
          int v224 = v219 | v221 | v225;
          goto LABEL_260;
        }
        if (v220) {
          goto LABEL_255;
        }
        if (v222)
        {
          unsigned int v223 = __clz(v222);
          int v220 = 9 - v223;
          uint64_t v138 = a5;
          unsigned int v222 = (v221 << (v223 - 8)) & 0x7FE000;
LABEL_255:
          int v224 = ((v222 | (v220 << 23)) + 939524096) | v219;
LABEL_260:
          float v226 = *(float *)&v224;
        }
        else if (v219)
        {
          float v226 = -0.0;
        }
        else
        {
          float v226 = 0.0;
        }
        float v227 = (float)(v226 - *(float *)(a1 + 240)) / (float)(1.0 - *(float *)(a1 + 240));
        if (v227 >= 0.0)
        {
          int v228 = (int)(float)((float)(v227 * 1000.0) + 0.5);
          if (v228 >= 1000) {
            int v228 = 1000;
          }
          if (v228 <= 1) {
            int v228 = 1;
          }
          uint64_t v165 = *((unsigned int *)v155 - 1);
        }
        else
        {
          int v228 = 0;
        }
        uint64_t v229 = v138 + ((unint64_t)v153 << 9);
        *(_DWORD *)(v229 + 392) = v228;
        *(unsigned char *)(v229 + 100) = 1;
        *(unsigned char *)(v229 + 440) = 1;
        LODWORD(v229) = *(__int16 *)(v301 + 2 * v165);
        int v230 = v229 & 0x80000000;
        unsigned int v231 = (v229 >> 10) & 0x1F;
        int v232 = *(unsigned __int16 *)(v301 + 2 * v165) << 13;
        unsigned int v233 = v232 & 0x7FE000;
        if (v231 != 31)
        {
          if (v231) {
            goto LABEL_272;
          }
          if (v233)
          {
            unsigned int v234 = __clz(v233);
            unsigned int v231 = 9 - v234;
            unsigned int v233 = (v232 << (v234 - 8)) & 0x7FE000;
LABEL_272:
            int v235 = ((v233 | (v231 << 23)) + 939524096) | v230;
LABEL_277:
            float v237 = *(float *)&v235;
          }
          else if (v230)
          {
            float v237 = -0.0;
          }
          else
          {
            float v237 = 0.0;
          }
          v127.i16[1] = 17530;
          *(float *)&long long v126 = (float)(v237 * 1000.0) + 0.5;
          int v238 = (int)*(float *)&v126;
          if ((int)*(float *)&v126 >= 1000) {
            int v238 = 1000;
          }
          if (v238 <= 1) {
            int v158 = 1;
          }
          else {
            int v158 = v238;
          }
          goto LABEL_177;
        }
        if (v233) {
          int v236 = 2143289344;
        }
        else {
          int v236 = 2139095040;
        }
        int v235 = v230 | v232 | v236;
        goto LABEL_277;
      }
      *float32x2_t v164 = 0;
      *(int32x4_t *)(v160 + 32) = v157;
      *(_DWORD *)(v160 + 4_Block_object_dispose(&STACK[0x488], 8) = -361;
      int v158 = -1;
      *(_DWORD *)(v160 + 12_Block_object_dispose(&STACK[0x488], 8) = -1;
      *(_DWORD *)(v160 + 392) = -1;
      *(unsigned char *)(v160 + 100) = 0;
      *(unsigned char *)(v160 + 440) = 0;
LABEL_177:
      uint64_t v159 = v138 + ((unint64_t)v153 << 9);
      *(_DWORD *)(v159 + 420) = v158;
      *(unsigned char *)(v159 + 38_Block_object_dispose(&STACK[0x488], 8) = 0;
      *(_DWORD *)(v159 + 44_Block_object_dispose(&STACK[0x488], 8) = 0;
      *(_DWORD *)(v159 + 444) = 0;
      *(_DWORD *)(v138 + 7680) = ++v153;
      LODWORD(v130) = *v11;
LABEL_178:
      ++v154;
      v155 += 8;
      if (v154 >= v130) {
        break;
      }
    }
    v302[462] = 0;
    if (!v130) {
      goto LABEL_338;
    }
    unsigned int v239 = 0;
    unsigned int v240 = 0;
    unint64_t v241 = 0;
    uint64_t v242 = a1 + 239744;
    while (2)
    {
      if (v240 >= 0x1E) {
        goto LABEL_338;
      }
      unint64_t v249 = (float32x2_t *)(a1 + 32 * v241);
      unsigned int v250 = v249[184].u32[0];
      unint64_t v251 = v241 + 1;
      unsigned int v252 = v250 - 2;
      if (v250 >= 2)
      {
        int v253 = 0;
        uint64_t v254 = v240;
        uint64_t v255 = a5 + ((unint64_t)v240 << 9);
        *(void *)(v255 + 25324) = v251;
        if (v252 <= 0xA) {
          int v253 = dword_246DA028C[v252];
        }
        uint64_t v256 = v255 + 25324;
        *(_DWORD *)(v255 + 25332) = v253;
        uint64_t v257 = (float32x2_t *)(a1 + 32 * v241);
        float32x2_t v258 = v249[182];
        *(float32x2_t *)(v255 + 25336) = v258;
        *(float32x2_t *)(v255 + 25344) = vsub_f32(v257[183], v258);
        int v259 = (int)(float)((float)(v257[185].f32[0] * 1000.0) + 0.5);
        if (v259 >= 1000) {
          int v259 = 1000;
        }
        if (v259 <= 1) {
          int v259 = 1;
        }
        *(_DWORD *)(v256 + 2_Block_object_dispose(&STACK[0x488], 8) = v259;
        *(_DWORD *)(v256 + 44_Block_object_dispose(&STACK[0x488], 8) = 0;
        if (v250 == 11 && v239 <= 0x1D)
        {
          uint64_t v260 = 0;
          char v130 = v249 + 184;
          uint64_t v261 = a1 + 32 * v241;
          *(float *)&unsigned int v262 = (float)(*(float *)(v261 + 1460) + *(float *)(v261 + 1468)) * 0.5;
          float v263 = (float)*(unsigned int *)(a1 + 252);
          unsigned int v264 = (float)((float)((float)(v249[182].f32[0] + v257[183].f32[0]) * 0.5) / v263);
          float v265 = *(float *)&v262 / v263;
          uint64_t v266 = *(unsigned int *)(v261 + 1476);
          float32x2_t v267 = (_WORD *)(v300 + 2 * v266);
          LOWORD(v262) = *v267;
          LOWORD(v126) = v267[3072];
          v127.i16[0] = v267[6144];
          LOWORD(v12_Block_object_dispose(&STACK[0x488], 8) = v267[9216];
          v266 *= 4;
          float v268 = *(float *)(*(void *)(a1 + 1424) + v266);
          float v269 = v268 + (float)((float)((float)v262 * -0.5) * v263);
          v127.f32[0] = v268 + (float)((float)((float)v127.u32[0] * 0.5) * v263);
          float v270 = *(float *)(*(void *)(a1 + 1432) + v266);
          float v271 = v270 + (float)((float)((float)v126 * -0.5) * v263);
          float v272 = v270 + (float)((float)((float)LODWORD(v128) * 0.5) * v263);
          *(_OWORD *)&v309[28] = 0uLL;
          *(_OWORD *)unsigned int v309 = 0uLL;
          memset(&v309[12], 255, 20);
          uint64_t v273 = a5 + 25324 + (v254 << 9);
          float32_t v274 = (long long *)(v273 + 452);
          *(_OWORD *)(v273 + 452) = 0uLL;
          *(_OWORD *)(v273 + 46_Block_object_dispose(&STACK[0x488], 8) = *(_OWORD *)v309;
          *(_OWORD *)(v273 + 484) = *(_OWORD *)&v309[16];
          HIWORD(v12_Block_object_dispose(&STACK[0x488], 8) = -1;
          *(_OWORD *)(v273 + 496) = *(_OWORD *)&v309[28];
          *(float *)(v273 + 452) = v269;
          *(float *)(v273 + 456) = v271;
          *(float *)(v273 + 460) = v127.f32[0] - v269;
          *(float *)(v273 + 464) = v272 - v271;
          unsigned int v275 = v265;
          if (v264 >= 0x3F) {
            int v276 = 63;
          }
          else {
            int v276 = v264;
          }
          if (v275 >= 0x2F) {
            unsigned int v275 = 47;
          }
          uint64_t v277 = a5 + 25456 + (v254 << 9);
          unint64_t v278 = (unsigned __int16 *)(v299 + 2 * (v276 | (v275 << 6)));
          while (1)
          {
            unsigned int v284 = (__int16)*v278;
            unsigned int v285 = v284 & 0x80000000;
            int v280 = (v284 >> 10) & 0x1F;
            int v286 = *v278 << 13;
            unsigned int v281 = v286 & 0x7FE000;
            if (v280 == 31)
            {
              if (v281) {
                int v287 = 2143289344;
              }
              else {
                int v287 = 2139095040;
              }
              int v282 = v285 | v286 | v287;
            }
            else
            {
              if (!v280)
              {
                if (!v281)
                {
                  if (v285) {
                    float v283 = -0.0;
                  }
                  else {
                    float v283 = 0.0;
                  }
                  goto LABEL_325;
                }
                unsigned int v279 = __clz(v281);
                int v280 = 9 - v279;
                unsigned int v281 = (v286 << (v279 - 8)) & 0x7FE000;
              }
              int v282 = ((v281 | (v280 << 23)) + 939524096) | v285;
            }
            float v283 = *(float *)&v282;
LABEL_325:
            v278 += 3072;
            *(float *)(v277 + v260) = v283;
            v260 += 4;
            if (v260 == 256)
            {
              uint64_t v243 = (_OWORD *)(v242 + 60 * v302[462]);
              long long v244 = *v274;
              long long v245 = v274[1];
              long long v246 = v274[2];
              long long v126 = *(long long *)((char *)v274 + 44);
              *(_OWORD *)((char *)v243 + 44) = v126;
              v243[1] = v245;
              v243[2] = v246;
              *uint64_t v243 = v244;
              unsigned int v247 = v302[462];
              uint64_t v248 = v242 + 60 * v247;
              *(_DWORD *)(v248 + 16) = v130->i32[0];
              unsigned int v240 = *(_DWORD *)v304;
              unsigned int v239 = v247 + 1;
              v302[462] = v247 + 1;
              *(_DWORD *)(v248 + 20) = v240;
              LODWORD(v130) = *v11;
              break;
            }
          }
        }
        *(_DWORD *)uint64_t v304 = ++v240;
      }
      unint64_t v241 = v251;
      if (v251 >= v130) {
        goto LABEL_338;
      }
      continue;
    }
  }
  if (v130)
  {
    uint64_t v149 = (float *)(a1 + 1480);
    uint64_t v150 = v130;
    do
    {
      if (*((_DWORD *)v149 - 2) == 11 && *v149 >= 0.55)
      {
        float v151 = *(float *)(a1 + 156);
        if (*v149 < v151)
        {
          float32x2_t v152 = vsub_f32(*(float32x2_t *)(v149 - 4), *(float32x2_t *)(v149 - 6));
          if ((float)(vmul_lane_f32(v152, v152, 1).f32[0]
                     / (float)(*(_DWORD *)(a1 + 20) * *(_DWORD *)(a1 + 24))) > 0.15)
            float *v149 = v151 + 0.01;
        }
      }
      v149 += 8;
      --v150;
    }
    while (v150);
    goto LABEL_174;
  }
  *(_DWORD *)(v138 + 7680) = 0;
  *(_DWORD *)uint64_t v304 = 0;
  *(_DWORD *)(v304 + 10244) = 0;
LABEL_337:
  v302[462] = 0;
LABEL_338:
  unsigned int v288 = (__int16)*v298;
  unsigned int v289 = v288 & 0x80000000;
  int v290 = (v288 >> 10) & 0x1F;
  int v291 = *v298 << 13;
  unsigned int v292 = v291 & 0x7FE000;
  if (v290 == 31)
  {
    if (v292) {
      int v295 = 2143289344;
    }
    else {
      int v295 = 2139095040;
    }
    int v294 = v289 | v291 | v295;
    goto LABEL_347;
  }
  if (v290) {
    goto LABEL_342;
  }
  if (v292)
  {
    unsigned int v293 = __clz(v292);
    int v290 = 9 - v293;
    unsigned int v292 = (v291 << (v293 - 8)) & 0x7FE000;
LABEL_342:
    int v294 = ((v292 | (v290 << 23)) + 939524096) | v289;
LABEL_347:
    float v296 = *(float *)&v294;
  }
  else
  {
    float v296 = -0.0;
    if (!v289) {
      float v296 = 0.0;
    }
  }
  *(float *)(v304 + 1024_Block_object_dispose(&STACK[0x488], 8) = v296;
  return 0;
}

uint64_t AcDetNode::postProcessHandHalf(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = (int *)(a5 + 40684);
  uint64_t v8 = (_DWORD *)(a1 + 243348);
  uint64_t v9 = a1 + 99788;
  uint64_t v10 = a2[21];
  uint64_t v11 = a2[24];
  uint64_t v12 = a2[27];
  uint64_t v13 = a2[30];
  uint64_t v14 = a2[45];
  *(_DWORD *)(a1 + 102964) = 0;
  std::chrono::steady_clock::now();
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  unint64_t v17 = *(unsigned int *)(v9 + 3176);
  while (2)
  {
    uint64_t v18 = 0;
    uint64_t v19 = v15;
    do
    {
      if (v17 > 0x63) {
        goto LABEL_8;
      }
      if (*(__int16 *)(v10 + v18) < 0) {
        goto LABEL_8;
      }
      unsigned int v25 = *(unsigned __int16 *)(v10 + v18);
      unsigned int v26 = (v25 >> 10) & 0x1F;
      if (v26 < 0xC) {
        goto LABEL_8;
      }
      if ((v25 & 0x3F8) <= 0x257 && v26 == 12) {
        goto LABEL_8;
      }
      int v28 = v25 << 13;
      int v29 = (v28 & 0x7FE000 | (v26 << 23)) + 939524096;
      if ((v28 & 0x7FE000) != 0) {
        int v30 = 2143289344;
      }
      else {
        int v30 = 2139095040;
      }
      int v31 = v30 | v28;
      if (v26 == 31) {
        float v32 = *(float *)&v31;
      }
      else {
        float v32 = *(float *)&v29;
      }
      unsigned int v33 = *(__int16 *)(v11 + v18);
      unsigned int v34 = v33 & 0x80000000;
      int v35 = (v33 >> 10) & 0x1F;
      int v36 = *(unsigned __int16 *)(v11 + v18) << 13;
      unsigned int v37 = v36 & 0x7FE000;
      if (v35 == 31)
      {
        if (v37) {
          int v40 = 2143289344;
        }
        else {
          int v40 = 2139095040;
        }
        int v39 = v34 | v36 | v40;
        goto LABEL_31;
      }
      if (v35) {
        goto LABEL_26;
      }
      if (v37)
      {
        unsigned int v38 = __clz(v37);
        int v35 = 9 - v38;
        unsigned int v37 = (v36 << (v38 - 8)) & 0x7FE000;
LABEL_26:
        int v39 = ((v37 | (v35 << 23)) + 939524096) | v34;
LABEL_31:
        float v41 = *(float *)&v39;
        goto LABEL_32;
      }
      if (v34) {
        float v41 = -0.0;
      }
      else {
        float v41 = 0.0;
      }
LABEL_32:
      float v42 = v32;
      if (v32 > 0.2)
      {
        unsigned int v43 = *(__int16 *)(v12 + v18);
        unsigned int v44 = v43 & 0x80000000;
        int v45 = (v43 >> 10) & 0x1F;
        int v46 = *(unsigned __int16 *)(v12 + v18) << 13;
        unsigned int v47 = v46 & 0x7FE000;
        if (v45 == 31)
        {
          if (v47) {
            int v50 = 2143289344;
          }
          else {
            int v50 = 2139095040;
          }
          int v49 = v44 | v46 | v50;
          goto LABEL_42;
        }
        if (v45) {
          goto LABEL_37;
        }
        if (v47)
        {
          unsigned int v48 = __clz(v47);
          int v45 = 9 - v48;
          unsigned int v47 = (v46 << (v48 - 8)) & 0x7FE000;
LABEL_37:
          int v49 = ((v47 | (v45 << 23)) + 939524096) | v44;
LABEL_42:
          float v51 = *(float *)&v49;
        }
        else if (v44)
        {
          float v51 = -0.0;
        }
        else
        {
          float v51 = 0.0;
        }
        unsigned int v52 = *(__int16 *)(v12 + v18 + 6144);
        unsigned int v53 = v52 & 0x80000000;
        int v54 = (v52 >> 10) & 0x1F;
        int v55 = *(unsigned __int16 *)(v12 + v18 + 6144) << 13;
        unsigned int v56 = v55 & 0x7FE000;
        if (v54 == 31)
        {
          if (v56) {
            int v59 = 2143289344;
          }
          else {
            int v59 = 2139095040;
          }
          int v58 = v53 | v55 | v59;
          goto LABEL_52;
        }
        if (v54) {
          goto LABEL_47;
        }
        if (v56)
        {
          unsigned int v57 = __clz(v56);
          int v54 = 9 - v57;
          unsigned int v56 = (v55 << (v57 - 8)) & 0x7FE000;
LABEL_47:
          int v58 = ((v56 | (v54 << 23)) + 939524096) | v53;
LABEL_52:
          float v60 = *(float *)&v58;
        }
        else if (v53)
        {
          float v60 = -0.0;
        }
        else
        {
          float v60 = 0.0;
        }
        unsigned int v61 = *(__int16 *)(v12 + v18 + 12288);
        unsigned int v62 = v61 & 0x80000000;
        int v63 = (v61 >> 10) & 0x1F;
        int v64 = *(unsigned __int16 *)(v12 + v18 + 12288) << 13;
        unsigned int v65 = v64 & 0x7FE000;
        if (v63 == 31)
        {
          if (v65) {
            int v68 = 2143289344;
          }
          else {
            int v68 = 2139095040;
          }
          int v67 = v62 | v64 | v68;
          goto LABEL_62;
        }
        if (v63) {
          goto LABEL_57;
        }
        if (v65)
        {
          unsigned int v66 = __clz(v65);
          int v63 = 9 - v66;
          unsigned int v65 = (v64 << (v66 - 8)) & 0x7FE000;
LABEL_57:
          int v67 = ((v65 | (v63 << 23)) + 939524096) | v62;
LABEL_62:
          float v69 = *(float *)&v67;
        }
        else if (v62)
        {
          float v69 = -0.0;
        }
        else
        {
          float v69 = 0.0;
        }
        unsigned int v70 = *(__int16 *)(v12 + v18 + 18432);
        unsigned int v71 = v70 & 0x80000000;
        int v72 = (v70 >> 10) & 0x1F;
        int v73 = *(unsigned __int16 *)(v12 + v18 + 18432) << 13;
        unsigned int v74 = v73 & 0x7FE000;
        if (v72 == 31)
        {
          if (v74) {
            int v77 = 2143289344;
          }
          else {
            int v77 = 2139095040;
          }
          int v76 = v71 | v73 | v77;
          goto LABEL_72;
        }
        if (v72) {
          goto LABEL_67;
        }
        if (v74)
        {
          unsigned int v75 = __clz(v74);
          int v72 = 9 - v75;
          unsigned int v74 = (v73 << (v75 - 8)) & 0x7FE000;
LABEL_67:
          int v76 = ((v74 | (v72 << 23)) + 939524096) | v71;
LABEL_72:
          float v78 = *(float *)&v76;
        }
        else if (v71)
        {
          float v78 = -0.0;
        }
        else
        {
          float v78 = 0.0;
        }
        float v79 = (float)*(unsigned int *)(a1 + 252);
        uint64_t v80 = *(void *)(a1 + 1424);
        int v81 = (float *)(a1 + 32 * v17 + 99764);
        *int v81 = *(float *)(v80 + 4 * v19) - (float)(v51 * v79);
        uint64_t v82 = *(void *)(a1 + 1432);
        v81[1] = *(float *)(v82 + 4 * v19) - (float)(v60 * v79);
        v81[2] = (float)(v69 * v79) + *(float *)(v80 + 4 * v19);
        v81[3] = (float)(v78 * v79) + *(float *)(v82 + 4 * v19);
        unsigned int v83 = *(__int16 *)(v13 + v18);
        unsigned int v84 = v83 & 0x80000000;
        int v21 = (v83 >> 10) & 0x1F;
        int v85 = *(unsigned __int16 *)(v13 + v18) << 13;
        unsigned int v22 = v85 & 0x7FE000;
        if (v21 == 31)
        {
          if (v22) {
            int v86 = 2143289344;
          }
          else {
            int v86 = 2139095040;
          }
          int v23 = v84 | v85 | v86;
        }
        else
        {
          if (!v21)
          {
            if (!v22)
            {
              if (v84) {
                float v24 = -0.0;
              }
              else {
                float v24 = 0.0;
              }
              goto LABEL_7;
            }
            unsigned int v20 = __clz(v22);
            int v21 = 9 - v20;
            unsigned int v22 = (v85 << (v20 - 8)) & 0x7FE000;
          }
          int v23 = ((v22 | (v21 << 23)) + 939524096) | v84;
        }
        float v24 = *(float *)&v23;
LABEL_7:
        *(float *)(a1 + 32 * v17 + 9978_Block_object_dispose(&STACK[0x488], 8) = sqrtf(v41 * v42);
        *(_DWORD *)(a1 + 32 * v17 + 99780) = v24 > 0.5;
        *(_DWORD *)(a1 + 32 * v17++ + 99784) = v19;
        *(_DWORD *)(v9 + 3176) = v17;
      }
LABEL_8:
      v18 += 2;
      ++v19;
    }
    while (v18 != 128);
    v13 += 128;
    v12 += 128;
    v11 += 128;
    v10 += 128;
    ++v16;
    v15 += 64;
    if (v16 != 48) {
      continue;
    }
    break;
  }
  std::chrono::steady_clock::now();
  *(_DWORD *)(v9 + 3176) = acNonMaxSuppressionHandIntra(a1 + 99764, *(unsigned int *)(v9 + 3176), *(unsigned char *)(a1 + 1416), (_OWORD *)(a1 + 1456), *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 20), *(float *)(a1 + 72), 0.3, *(float *)(a1 + 1412));
  std::chrono::steady_clock::now();
  if (*(unsigned char *)(a1 + 1420) && *(unsigned char *)(a1 + 1421))
  {
    uint64_t v89 = a1 + 208;
    uint64_t v90 = *(unsigned int *)(v9 + 3176);
    if (!v90) {
      goto LABEL_101;
    }
LABEL_103:
    unsigned int v91 = 0;
    uint64_t v92 = (float *)v9;
    do
    {
      if (*v92 > *(float *)(v89 + 4 * *((unsigned int *)v92 - 2)))
      {
        uint64_t v93 = v91++;
        long long v94 = *(_OWORD *)(v92 - 2);
        float v95 = (_OWORD *)(a1 + 99764 + 32 * v93);
        _OWORD *v95 = *(_OWORD *)(v92 - 6);
        v95[1] = v94;
      }
      v92 += 8;
      --v90;
    }
    while (v90);
    *(_DWORD *)(v9 + 3176) = v91;
    v7[2561] = 0;
    *uint64_t v8 = 0;
    if (v91)
    {
      unsigned int v96 = 0;
      unint64_t v97 = 0;
      uint64_t v98 = a1 + 241548;
      unsigned int v99 = (float *)v9;
      do
      {
        if (v96 >= 0x14) {
          break;
        }
        ++v97;
        uint64_t v100 = a5 + ((unint64_t)v96 << 9);
        *(void *)(v100 + 4068_Block_object_dispose(&STACK[0x488], 8) = v97;
        if (*((_DWORD *)v99 - 2)) {
          int v101 = 11;
        }
        else {
          int v101 = 10;
        }
        *(_DWORD *)(v100 + 40696) = v101;
        float32x2_t v102 = *(float32x2_t *)(v99 - 6);
        *(float32x2_t *)(v100 + 40700) = v102;
        *(float32x2_t *)(v100 + 4070_Block_object_dispose(&STACK[0x488], 8) = vsub_f32(*(float32x2_t *)(v99 - 4), v102);
        int v103 = (int)(float)((float)(*v99 * 1000.0) + 0.5);
        if (v103 >= 1000) {
          int v103 = 1000;
        }
        if (v103 <= 1) {
          int v103 = 1;
        }
        *(_DWORD *)(v100 + 40716) = v103;
        *(_DWORD *)(v100 + 41136) = 0;
        *(_OWORD *)&v116[28] = 0uLL;
        *(_OWORD *)uint64_t v116 = 0uLL;
        memset(&v116[12], 255, 20);
        *(_OWORD *)(v100 + 41140) = 0uLL;
        *(_OWORD *)(v100 + 41156) = *(_OWORD *)v116;
        *(_OWORD *)(v100 + 41172) = *(_OWORD *)&v116[16];
        int8x8_t v104 = *(int8x8_t *)&v116[28];
        *(_OWORD *)(v100 + 41184) = *(_OWORD *)&v116[28];
        uint64_t v105 = *((unsigned int *)v99 - 1);
        v104.i8[0] = *(unsigned char *)(v14 + v105);
        int8x8_t v106 = (int8x8_t)*(unsigned __int8 *)(v14 + v105 + 3072);
        LOBYTE(v87) = *(unsigned char *)(v14 + v105 + 6144);
        LOBYTE(v8_Block_object_dispose(&STACK[0x488], 8) = *(unsigned char *)(v14 + v105 + 9216);
        v105 *= 4;
        float v107 = *(float *)(*(void *)(a1 + 1424) + v105);
        float v108 = (float)*(unsigned int *)(a1 + 252);
        *(float *)v104.i32 = v107
                           + (float)((float)((float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v104)).i32[0] * -0.5)
                                   * v108);
        float v109 = *(float *)(*(void *)(a1 + 1432) + v105);
        *(float *)v106.i32 = v109
                           + (float)((float)((float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v106)).i32[0] * -0.5)
                                   * v108);
        *(_OWORD *)&v116[28] = 0uLL;
        *(_OWORD *)uint64_t v116 = 0uLL;
        memset(&v116[12], 255, 20);
        *(_OWORD *)(v100 + 41140) = 0uLL;
        *(_OWORD *)(v100 + 41156) = *(_OWORD *)v116;
        *(_OWORD *)(v100 + 41172) = *(_OWORD *)&v116[16];
        *(_OWORD *)(v100 + 41184) = *(_OWORD *)&v116[28];
        *(_DWORD *)(v100 + 41140) = v104.i32[0];
        *(_DWORD *)(v100 + 41144) = v106.i32[0];
        *(float *)(v100 + 4114_Block_object_dispose(&STACK[0x488], 8) = (float)(v107
                                         + (float)((float)((float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)&v87)).i32[0]
                                                         * 0.5)
                                                 * v108))
                                 - *(float *)v104.i32;
        *(float *)(v100 + 41152) = (float)(v109
                                         + (float)((float)((float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)&v88)).i32[0]
                                                         * 0.5)
                                                 * v108))
                                 - *(float *)v106.i32;
        unsigned int v110 = (_OWORD *)(v98 + 60 * *v8);
        long long v111 = *(_OWORD *)(v100 + 41140);
        long long v112 = *(_OWORD *)(v100 + 41156);
        long long v87 = *(_OWORD *)(v100 + 41172);
        long long v88 = *(_OWORD *)(v100 + 41184);
        *(_OWORD *)((char *)v110 + 44) = v88;
        v110[1] = v112;
        v110[2] = v87;
        *unsigned int v110 = v111;
        LODWORD(v110) = *v8;
        uint64_t v113 = v98 + 60 * *v8;
        *(float *)(v113 + 16) = *(v99 - 2);
        int v114 = *v7;
        *uint64_t v8 = v110 + 1;
        *(_DWORD *)(v113 + 20) = v114;
        unsigned int v96 = v7[2561] + 1;
        v7[2561] = v96;
        v99 += 8;
      }
      while (v97 < *(unsigned int *)(v9 + 3176));
    }
  }
  else
  {
    uint64_t v89 = a1 + 216;
    uint64_t v90 = *(unsigned int *)(v9 + 3176);
    if (v90) {
      goto LABEL_103;
    }
LABEL_101:
    *(_DWORD *)(v9 + 3176) = 0;
    v7[2561] = 0;
    *uint64_t v8 = 0;
  }
  return 0;
}

float AcDetNode::postProcessDetFloat(uint64_t a1, uint64_t *a2, float result, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = *a2;
  if (*a2)
  {
    uint64_t v8 = a2[3];
    if (v8)
    {
      uint64_t v9 = a2[6];
      if (v9)
      {
        uint64_t v10 = a2[9];
        if (v10)
        {
          uint64_t v189 = a2[12];
          if (v189)
          {
            uint64_t v186 = a2[15];
            if (v186)
            {
              uint64_t v185 = a2[18];
              if (v185)
              {
                uint64_t v184 = a2[45];
                if (v184)
                {
                  if (a2[48])
                  {
                    int v182 = (float *)a2[48];
                    unsigned int v11 = 0;
                    unsigned int v12 = 0;
                    uint64_t v13 = 0;
                    unsigned int v14 = 0;
                    int v190 = (unsigned int *)(a6 + 40684);
                    uint64_t v15 = *((unsigned int *)a2 + 9);
                    *(_DWORD *)(a1 + 250252) = v15;
                    uint64_t v16 = *((unsigned int *)a2 + 8);
                    float v188 = (unsigned int *)(a1 + 239696);
                    *(_DWORD *)(a1 + 250256) = v16;
                    unint64_t v17 = v16 * (unint64_t)v15;
                    *(_DWORD *)(a1 + 99760) = 0;
                    *(_DWORD *)(a1 + 102964) = 0;
                    uint64_t v18 = (unsigned int *)(a1 + 103928);
                    uint64_t v196 = v16;
                    char v197 = (unsigned int *)(a1 + 99760);
                    *(_DWORD *)(a1 + 10392_Block_object_dispose(&STACK[0x488], 8) = 0;
                    uint64_t v187 = 2 * v17;
                    uint64_t v183 = 3 * v17;
                    uint64_t v194 = 12 * v17;
                    uint64_t v195 = v15;
                    float v19 = *(float *)(a1 + 68);
                    uint64_t v193 = 8 * v17;
                    unint64_t v198 = v17;
                    uint64_t v192 = 4 * v17;
                    uint64_t v20 = 4 * v15;
                    do
                    {
                      if (v13 == 1)
                      {
                        float v21 = 0.05;
                      }
                      else
                      {
                        float v21 = v19;
                        if (v13 == 11)
                        {
                          float v21 = v19;
                          if (*(unsigned char *)(a1 + 104)) {
                            float v21 = *(float *)(a1 + 108);
                          }
                        }
                      }
                      if (v196 && v195)
                      {
                        uint64_t v22 = 0;
                        int v23 = 0;
                        for (uint64_t i = 0; i != v196; ++i)
                        {
                          uint64_t v25 = 0;
                          int v26 = v23;
                          do
                          {
                            float v27 = *(float *)(v7 + v25);
                            if (*(unsigned char *)(a1 + v13 + 224)) {
                              BOOL v28 = v27 <= v21;
                            }
                            else {
                              BOOL v28 = 1;
                            }
                            if (!v28)
                            {
                              float v29 = sqrtf(v27 * *(float *)(v8 + v25));
                              if (v13 == 1)
                              {
                                if (v27 < v19)
                                {
                                  float v30 = *(float *)(a1 + 100);
                                  if (v29 > v30) {
                                    float v29 = v30 + -0.01;
                                  }
                                }
                                BOOL v31 = 1;
                              }
                              else
                              {
                                if (v27 <= v19) {
                                  unsigned int v32 = v14;
                                }
                                else {
                                  unsigned int v32 = v14 + 1;
                                }
                                BOOL v31 = v13 != 11;
                                if (v13 == 11) {
                                  unsigned int v14 = v32;
                                }
                              }
                              uint64_t v33 = a1 + 32 * v12;
                              *(float *)(v33 + 1480) = v29;
                              *(_DWORD *)(v33 + 1472) = v13;
                              float v34 = (float)*(unsigned int *)(a1 + 252);
                              float v35 = *(float *)(v9 + v192 + v25) * v34;
                              float v36 = *(float *)(v9 + v193 + v25) * v34;
                              float v37 = *(float *)(v9 + v194 + v25);
                              uint64_t v38 = *(void *)(a1 + 1424) + v22;
                              float v39 = *(float *)(v38 + v25) - (float)(*(float *)(v9 + v25) * v34);
                              *(float *)(v33 + 1456) = v39;
                              uint64_t v40 = *(void *)(a1 + 1432) + v22;
                              float v41 = v37 * v34;
                              float v42 = *(float *)(v40 + v25) - v35;
                              *(float *)(v33 + 1460) = v42;
                              float v43 = v36 + *(float *)(v38 + v25);
                              *(float *)(v33 + 1464) = v43;
                              float v44 = v41 + *(float *)(v40 + v25);
                              *(float *)(v33 + 146_Block_object_dispose(&STACK[0x488], 8) = v44;
                              *(_DWORD *)(v33 + 1476) = v26;
                              if (!v13) {
                                *(float *)(v33 + 1484) = (float)(*(float *)(v10 + 4 * v198) * -360.0) + 180.0;
                              }
                              if (v27 > v19) {
                                BOOL v31 = 1;
                              }
                              if (v31)
                              {
                                if (v12 <= 0xBFE) {
                                  *char v197 = ++v12;
                                }
                              }
                              else if (v27 < 0.2 {
                                     && v11 <= 0x1D
                              }
                                     && (float)((float)((float)(v43 - v39) * (float)(v44 - v42))
                                              / (float)(*(_DWORD *)(a1 + 20) * *(_DWORD *)(a1 + 24))) > 0.04)
                              {
                                int v45 = (_OWORD *)(a1 + 32 * v11 + 102968);
                                long long v46 = *(_OWORD *)(v33 + 1472);
                                *int v45 = *(_OWORD *)(v33 + 1456);
                                v45[1] = v46;
                                unsigned int v11 = *v18 + 1;
                                unsigned int *v18 = v11;
                              }
                            }
                            v25 += 4;
                            ++v26;
                          }
                          while (v20 != v25);
                          v9 += v25;
                          v8 += v25;
                          v7 += v25;
                          v23 += v195;
                          v22 += v20;
                        }
                        uint64_t v8 = a2[3];
                        uint64_t v9 = a2[6];
                      }
                      ++v13;
                    }
                    while (v13 != 12);
                    unsigned int v47 = acNonMaxSuppression(a1 + 1456, v12, (_DWORD *)(a1 + 227408), 500, *(float *)(a1 + 72), *(float *)(a1 + 76));
                    unsigned int v48 = (_DWORD *)(a1 + 99760);
                    *char v197 = v47;
                    if (v14 <= 0x1E || !*(unsigned char *)(a1 + 104)) {
                      goto LABEL_71;
                    }
                    unsigned int v49 = acNonMaxSuppressionLowLogitFbody(a1 + 102968, *v18, 0.2, 0.8);
                    unsigned int *v18 = v49;
                    if (v49)
                    {
                      if (!*(unsigned char *)(a1 + 105))
                      {
                        float v54 = *(float *)(a1 + 204) + 0.01;
                        if (v49 >= 2)
                        {
                          uint64_t v55 = v49 & 0xFFFFFFFE;
                          unsigned int v56 = (float *)(a1 + 103024);
                          uint64_t v57 = v55;
                          do
                          {
                            *(v56 - _Block_object_dispose(&STACK[0x488], 8) = v54;
                            *unsigned int v56 = v54;
                            v56 += 16;
                            v57 -= 2;
                          }
                          while (v57);
                          if (v55 == v49) {
                            goto LABEL_64;
                          }
                        }
                        else
                        {
                          uint64_t v55 = 0;
                        }
                        uint64_t v58 = v49 - v55;
                        int v59 = (float *)(a1 + 32 * v55 + 102992);
                        do
                        {
                          *int v59 = v54;
                          v59 += 8;
                          --v58;
                        }
                        while (v58);
                        goto LABEL_64;
                      }
                      float v50 = (float)(*(_DWORD *)(a1 + 20) * *(_DWORD *)(a1 + 24));
                      uint64_t v51 = v49;
                      unsigned int v52 = (float *)(a1 + 102992);
                      do
                      {
                        float32x2_t v53 = vsub_f32(*(float32x2_t *)(v52 - 4), *(float32x2_t *)(v52 - 6));
                        if ((float)(vmul_lane_f32(v53, v53, 1).f32[0] / v50) > 0.1) {
                          *unsigned int v52 = *(float *)(a1 + 156) + 0.01;
                        }
                        v52 += 8;
                        --v51;
                      }
                      while (v51);
                    }
LABEL_64:
                    acFbodyHlogitSuppressLlogit((float32x2_t *)(a1 + 1456), *v197, a1 + 102968, (unsigned int *)(a1 + 103928), 0.5, *(float32_t *)(a1 + 204));
                    unsigned int v48 = (_DWORD *)(a1 + 99760);
                    if (*(_DWORD *)(a1 + 103928))
                    {
                      unint64_t v60 = *v197;
                      if (v60 <= 0xBFE)
                      {
                        unsigned int v61 = (long long *)(a1 + 102968);
                        unint64_t v62 = 1;
LABEL_67:
                        *char v197 = v60 + 1;
                        uint64_t v63 = a1 + 32 * v60;
                        long long v64 = *v61;
                        *(_OWORD *)(v63 + 1472) = v61[1];
                        *(_OWORD *)(v63 + 1456) = v64;
                        while (v62 < *(unsigned int *)(a1 + 103928))
                        {
                          unint64_t v60 = *v197;
                          ++v62;
                          v61 += 2;
                          if (v60 <= 0xBFE) {
                            goto LABEL_67;
                          }
                        }
                      }
                    }
LABEL_71:
                    if (*(unsigned char *)(a1 + 1420) && *(unsigned char *)(a1 + 1421)) {
                      uint64_t v65 = a1 + 160;
                    }
                    else {
                      uint64_t v65 = a1 + 112;
                    }
                    LODWORD(v66) = *v48;
                    if (*v48 >= 0xBFFu) {
                      uint64_t v66 = 3071;
                    }
                    else {
                      uint64_t v66 = v66;
                    }
                    *unsigned int v48 = v66;
                    unsigned int v67 = 0;
                    if (v66)
                    {
                      int v68 = (float *)(a1 + 1480);
                      do
                      {
                        if (*v68 > *(float *)(v65 + 4 * *((unsigned int *)v68 - 2)))
                        {
                          uint64_t v69 = v67++;
                          long long v70 = *(_OWORD *)(v68 - 2);
                          unsigned int v71 = (_OWORD *)(a1 + 1456 + 32 * v69);
                          *unsigned int v71 = *(_OWORD *)(v68 - 6);
                          v71[1] = v70;
                        }
                        v68 += 8;
                        --v66;
                      }
                      while (v66);
                    }
                    *char v197 = v67;
                    unsigned int v72 = acRemoveHeadOverlapBoxes((_OWORD *)(a1 + 1456), v67, (unsigned __int8 *)(a1 + 224336), *(float *)(a1 + 76));
                    *char v197 = v72;
                    bmHeapsort(a1 + 1456, v72, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectClassCompareReverse);
                    *(_OWORD *)float v188 = 0u;
                    *(_OWORD *)(a1 + 239712) = 0u;
                    *(_OWORD *)(a1 + 23972_Block_object_dispose(&STACK[0x488], 8) = 0u;
                    uint64_t v73 = *v197;
                    if (v73)
                    {
                      unsigned int v74 = (unsigned int *)(a1 + 1472);
                      do
                      {
                        unsigned int v76 = *v74;
                        v74 += 8;
                        uint64_t v75 = v76;
                        if (v76 == 1)
                        {
                          ++*v188;
                        }
                        else if (v75 <= 0xB)
                        {
                          ++*(_DWORD *)(a1 + 4 * v75 + 239696);
                        }
                        --v73;
                      }
                      while (v73);
                      unint64_t v77 = *v188;
                    }
                    else
                    {
                      unint64_t v77 = 0;
                    }
                    bmHeapsort(a1 + 1456, v77, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    uint64_t v78 = *v188;
                    bmHeapsort(a1 + 1456 + 32 * v78, *(unsigned int *)(a1 + 239700), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    uint64_t v79 = (*(_DWORD *)(a1 + 239700) + v78);
                    bmHeapsort(a1 + 1456 + 32 * v79, *(unsigned int *)(a1 + 239704), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    uint64_t v80 = (*(_DWORD *)(a1 + 239704) + v79);
                    bmHeapsort(a1 + 1456 + 32 * v80, *(unsigned int *)(a1 + 239708), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    uint64_t v81 = (*(_DWORD *)(a1 + 239708) + v80);
                    bmHeapsort(a1 + 1456 + 32 * v81, *(unsigned int *)(a1 + 239712), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    uint64_t v82 = (*(_DWORD *)(a1 + 239712) + v81);
                    bmHeapsort(a1 + 1456 + 32 * v82, *(unsigned int *)(a1 + 239716), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    uint64_t v83 = (*(_DWORD *)(a1 + 239716) + v82);
                    bmHeapsort(a1 + 1456 + 32 * v83, *(unsigned int *)(a1 + 239720), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    uint64_t v84 = (*(_DWORD *)(a1 + 239720) + v83);
                    bmHeapsort(a1 + 1456 + 32 * v84, *(unsigned int *)(a1 + 239724), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    uint64_t v85 = (*(_DWORD *)(a1 + 239724) + v84);
                    bmHeapsort(a1 + 1456 + 32 * v85, *(unsigned int *)(a1 + 239728), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    uint64_t v86 = (*(_DWORD *)(a1 + 239728) + v85);
                    bmHeapsort(a1 + 1456 + 32 * v86, *(unsigned int *)(a1 + 239732), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    uint64_t v87 = (*(_DWORD *)(a1 + 239732) + v86);
                    bmHeapsort(a1 + 1456 + 32 * v87, *(unsigned int *)(a1 + 239736), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    bmHeapsort(a1 + 1456 + 32 * (*(_DWORD *)(a1 + 239736) + v87), *(unsigned int *)(a1 + 239740), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    unsigned int v88 = *(_DWORD *)(a1 + 239704);
                    uint64_t v89 = (_DWORD *)(a1 + 99760);
                    uint64_t v90 = *v197;
                    BOOL v95 = v88 >= 0xF;
                    unsigned int v91 = v88 - 15;
                    if (v91 != 0 && v95)
                    {
                      if (v90)
                      {
                        int v92 = 0;
                        uint64_t v93 = (_DWORD *)(a1 + 1472);
                        unsigned int v94 = v91;
                        do
                        {
                          BOOL v95 = *v93 == 2 && ++v92 >= 0x10;
                          if (v95)
                          {
                            uint64_t v96 = a1 + 32 * v94;
                            long long v97 = *(_OWORD *)(v96 + 1472);
                            *((_OWORD *)v93 - 1) = *(_OWORD *)(v96 + 1456);
                            *(_OWORD *)uint64_t v93 = v97;
                          }
                          ++v94;
                          v93 += 8;
                          --v90;
                        }
                        while (v90);
                        LODWORD(v90) = *v197;
                      }
                      LODWORD(v90) = v90 - v91;
                      *char v197 = v90;
                    }
                    unsigned int v98 = *(_DWORD *)(a1 + 239740);
                    if (v98 >= 0x10)
                    {
                      unsigned int v99 = v98 - 8;
                      if (v90)
                      {
                        int v100 = 0;
                        int v101 = (_OWORD *)(a1 + 1472);
                        unsigned int v102 = v99;
                        uint64_t v90 = v90;
                        do
                        {
                          if (*(_DWORD *)v101 == 11 && ++v100 >= 0x10)
                          {
                            uint64_t v104 = a1 + 32 * v102;
                            long long v105 = *(_OWORD *)(v104 + 1472);
                            *(v101 - 1) = *(_OWORD *)(v104 + 1456);
                            *int v101 = v105;
                          }
                          ++v102;
                          v101 += 2;
                          --v90;
                        }
                        while (v90);
                        LODWORD(v90) = *v197;
                        unsigned int v98 = *(_DWORD *)(a1 + 239740);
                      }
                      LODWORD(v90) = v90 - v99;
                      *char v197 = v90;
                    }
                    if (v98 <= 5)
                    {
                      if (!v90)
                      {
                        *(_DWORD *)(a6 + 7680) = 0;
                        *int v190 = 0;
                        v190[2561] = 0;
                        goto LABEL_200;
                      }
                      int8x8_t v106 = (float *)(a1 + 1480);
                      uint64_t v107 = v90;
                      do
                      {
                        if (*((_DWORD *)v106 - 2) == 11 && *v106 >= 0.55)
                        {
                          float v108 = *(float *)(a1 + 156);
                          if (*v106 < v108)
                          {
                            float32x2_t v109 = vsub_f32(*(float32x2_t *)(v106 - 4), *(float32x2_t *)(v106 - 6));
                            if ((float)(vmul_lane_f32(v109, v109, 1).f32[0]
                                       / (float)(*(_DWORD *)(a1 + 20) * *(_DWORD *)(a1 + 24))) > 0.15)
                              *int8x8_t v106 = v108 + 0.01;
                          }
                        }
                        v106 += 8;
                        --v107;
                      }
                      while (v107);
                    }
                    *(_DWORD *)(a6 + 7680) = 0;
                    *int v190 = 0;
                    v190[2561] = 0;
                    if (v90)
                    {
                      unsigned int v110 = 0;
                      unint64_t v111 = 0;
                      long long v112 = (float *)(a1 + 1480);
                      float32x2_t v113 = (float32x2_t)vdup_n_s32(0x43B40000u);
                      int32x4_t v114 = vdupq_n_s32(0xFFFFFE97);
                      do
                      {
                        if (v110 >= 0xF) {
                          break;
                        }
                        if (*((_DWORD *)v112 - 2) <= 1u)
                        {
                          uint64_t v116 = a6 + ((unint64_t)v110 << 9);
                          *(_DWORD *)(v116 + 4) = 0;
                          *(_DWORD *)(v116 + _Block_object_dispose(&STACK[0x488], 8) = 0;
                          *(_DWORD *)uint64_t v116 = v111 + 1;
                          int v117 = (int)(float)((float)(*v112 * 1000.0) + 0.5);
                          if (v117 >= 1000) {
                            int v117 = 1000;
                          }
                          if (v117 <= 1) {
                            int v117 = 1;
                          }
                          *(_DWORD *)(v116 + 2_Block_object_dispose(&STACK[0x488], 8) = v117;
                          int v118 = *((_DWORD *)v112 - 2);
                          float32x2_t v119 = *(float32x2_t *)(v112 - 6);
                          *(float32x2_t *)(v116 + 12) = v119;
                          *(float32x2_t *)(v116 + 20) = vsub_f32(*(float32x2_t *)(v112 - 4), v119);
                          uint64_t v120 = (unsigned char *)(v116 + 96);
                          if (v118)
                          {
                            *uint64_t v120 = 0;
                            *(int32x4_t *)(v116 + 32) = v114;
                            *(_DWORD *)(v116 + 4_Block_object_dispose(&STACK[0x488], 8) = -361;
                            int v115 = -1;
                            *(_DWORD *)(v116 + 12_Block_object_dispose(&STACK[0x488], 8) = -1;
                            *(_DWORD *)(v116 + 392) = -1;
                            *(unsigned char *)(v116 + 100) = 0;
                            *(unsigned char *)(v116 + 440) = 0;
                          }
                          else
                          {
                            *uint64_t v120 = 1;
                            uint64_t v121 = *((unsigned int *)v112 - 1);
                            float v122 = *(float *)(v10 + 4 * (v187 + v121));
                            if (v122 < 1.05 && v122 > 1.0) {
                              float v122 = 1.0;
                            }
                            v124.f32[0] = (float)(v122 * 180.0) + -90.0;
                            int v125 = (int)v124.f32[0];
                            if ((int)v124.f32[0] >= 90) {
                              int v125 = 90;
                            }
                            if (v125 <= -90) {
                              int v125 = -90;
                            }
                            int v126 = (int)(float)((float)((float)(v125 + 90) / 45.0) + 0.5);
                            uint64_t v127 = v198 + v121;
                            float v128 = 180.0 - (float)(*(float *)(v10 + 4 * (v198 + v121)) * 360.0);
                            int v129 = (int)(float)((float)(v128 + 180.0) + 360.0) % 360;
                            if (v129 > 0xFFFFFE97) {
                              v129 += 360;
                            }
                            int v130 = (int)(float)((float)((float)v129 / 30.0) + 0.5);
                            unsigned int v131 = v126 % 5;
                            int v132 = v126 % 5 + 5;
                            if (v131 > 0xFFFFFFFA) {
                              unsigned int v131 = v132;
                            }
                            float v133 = (float)(*(float *)(v10 + 4 * v121) * 180.0) + -90.0;
                            *(_DWORD *)(v116 + 32) = AcDetNode::m_kFacePoseYawCenters[v131];
                            unsigned int v134 = v130 % 12;
                            if (v134 > 0xFFFFFFF3) {
                              v134 += 12;
                            }
                            *(_DWORD *)(v116 + 36) = AcDetNode::m_kFacePoseRollCenters[v134];
                            v124.f32[1] = v128;
                            *(int32x2_t *)(v116 + 40) = vcvt_s32_f32((float32x2_t)vbsl_s8((int8x8_t)vcgez_f32(vadd_f32(v124, (float32x2_t)0x3400000034000000)), (int8x8_t)v124, (int8x8_t)vadd_f32(v124, v113)));
                            if ((float)(v133 + 0.00000011921) < 0.0) {
                              float v135 = v133 + 360.0;
                            }
                            else {
                              float v135 = v133;
                            }
                            *(_DWORD *)(v116 + 4_Block_object_dispose(&STACK[0x488], 8) = (int)v135;
                            float v136 = (float)(*(float *)(v189 + 4 * v121) - *(float *)(a1 + 236))
                                 / (float)(1.0 - *(float *)(a1 + 236));
                            if (v136 >= 0.0)
                            {
                              int v138 = (int)(float)((float)(v136 * 1000.0) + 0.5);
                              if (v138 >= 1000) {
                                int v138 = 1000;
                              }
                              if (v138 <= 1) {
                                int v137 = 1;
                              }
                              else {
                                int v137 = v138;
                              }
                              uint64_t v121 = *((unsigned int *)v112 - 1);
                              uint64_t v127 = v198 + v121;
                            }
                            else
                            {
                              int v137 = 0;
                            }
                            uint64_t v139 = a6 + ((unint64_t)v110 << 9);
                            *(_DWORD *)(v139 + 12_Block_object_dispose(&STACK[0x488], 8) = v137;
                            float v140 = (float)(*(float *)(v189 + 4 * v127) - *(float *)(a1 + 240))
                                 / (float)(1.0 - *(float *)(a1 + 240));
                            uint64_t v89 = (_DWORD *)(a1 + 99760);
                            if (v140 >= 0.0)
                            {
                              int v142 = (int)(float)((float)(v140 * 1000.0) + 0.5);
                              if (v142 >= 1000) {
                                int v142 = 1000;
                              }
                              if (v142 <= 1) {
                                int v141 = 1;
                              }
                              else {
                                int v141 = v142;
                              }
                              uint64_t v121 = *((unsigned int *)v112 - 1);
                            }
                            else
                            {
                              int v141 = 0;
                            }
                            *(_DWORD *)(v139 + 392) = v141;
                            *(unsigned char *)(v139 + 100) = 1;
                            *(unsigned char *)(v139 + 440) = 1;
                            int v143 = (int)(float)((float)(*(float *)(v186 + 4 * v121) * 1000.0) + 0.5);
                            if (v143 >= 1000) {
                              int v143 = 1000;
                            }
                            if (v143 <= 1) {
                              int v115 = 1;
                            }
                            else {
                              int v115 = v143;
                            }
                          }
                          uint64_t v90 = a6 + ((unint64_t)v110 << 9);
                          *(_DWORD *)(v90 + 420) = v115;
                          *(unsigned char *)(v90 + 38_Block_object_dispose(&STACK[0x488], 8) = 0;
                          *(_DWORD *)(v90 + 44_Block_object_dispose(&STACK[0x488], 8) = 0;
                          *(_DWORD *)(v90 + 444) = 0;
                          *(_DWORD *)(a6 + 7680) = ++v110;
                          LODWORD(v90) = *v89;
                        }
                        ++v111;
                        v112 += 8;
                      }
                      while (v111 < v90);
                      *(_DWORD *)(a1 + 241544) = 0;
                      if (v90)
                      {
                        unsigned int v144 = 0;
                        unsigned int v145 = 0;
                        unint64_t v146 = 0;
                        uint64_t v147 = a1 + 239744;
                        do
                        {
                          if (v145 >= 0x1E) {
                            break;
                          }
                          unsigned int v148 = (float32x2_t *)(a1 + 32 * v146);
                          unsigned int v149 = v148[184].u32[0];
                          unint64_t v150 = v146 + 1;
                          unsigned int v151 = v149 - 2;
                          if (v149 >= 2)
                          {
                            int v152 = 0;
                            uint64_t v153 = v145;
                            uint64_t v154 = a6 + ((unint64_t)v145 << 9);
                            *(void *)(v154 + 25324) = v150;
                            if (v151 <= 0xA) {
                              int v152 = dword_246DA028C[v151];
                            }
                            uint64_t v155 = v154 + 25324;
                            *(_DWORD *)(v154 + 25332) = v152;
                            float32x2_t v156 = (float32x2_t *)(a1 + 32 * v146);
                            float32x2_t v157 = v148[182];
                            *(float32x2_t *)(v154 + 25336) = v157;
                            *(float32x2_t *)(v154 + 25344) = vsub_f32(v156[183], v157);
                            int v158 = (int)(float)((float)(v156[185].f32[0] * 1000.0) + 0.5);
                            if (v158 >= 1000) {
                              int v158 = 1000;
                            }
                            if (v158 <= 1) {
                              int v158 = 1;
                            }
                            *(_DWORD *)(v155 + 2_Block_object_dispose(&STACK[0x488], 8) = v158;
                            *(_DWORD *)(v155 + 44_Block_object_dispose(&STACK[0x488], 8) = 0;
                            if (v149 == 11 && v144 <= 0x1D)
                            {
                              uint64_t v159 = 0;
                              uint64_t v160 = a1 + 32 * v146;
                              float v161 = (float)*(unsigned int *)(a1 + 252);
                              unint64_t v162 = (float)((float)((float)(v148[182].f32[0] + v156[183].f32[0]) * 0.5)
                                                         / v161);
                              float32x2_t v163 = v148 + 184;
                              if (v195 - 1 <= v162) {
                                LODWORD(v162) = v195 - 1;
                              }
                              if (v196 - 1 <= (unint64_t)(float)((float)((float)(*(float *)(v160 + 1460) + *(float *)(v160 + 1468))
                                                                                             * 0.5)
                                                                                     / v161))
                                unsigned int v164 = v196 - 1;
                              else {
                                unsigned int v164 = (float)((float)((float)(*(float *)(v160 + 1460)
                              }
                                                                           + *(float *)(v160 + 1468))
                                                                   * 0.5)
                                                           / v161);
                              uint64_t v165 = *(unsigned int *)(v160 + 1476);
                              float v166 = *(float *)(*(void *)(a1 + 1424) + 4 * v165);
                              float v167 = v166 + (float)((float)(*(float *)(v184 + 4 * v165) * -0.5) * v161);
                              float v168 = *(float *)(*(void *)(a1 + 1432) + 4 * v165);
                              float v169 = v168 + (float)((float)(*(float *)(v184 + 4 * (v198 + v165)) * -0.5) * v161);
                              float v170 = v166 + (float)((float)(*(float *)(v184 + 4 * (v187 + v165)) * 0.5) * v161);
                              *(_OWORD *)&v199[28] = 0uLL;
                              *(_OWORD *)int v199 = 0uLL;
                              memset(&v199[12], 255, 20);
                              float v171 = v168 + (float)((float)(*(float *)(v184 + 4 * (v183 + v165)) * 0.5) * v161);
                              uint64_t v172 = v153 << 9;
                              uint64_t v173 = a6 + 25324 + v172;
                              *(_OWORD *)(v173 + 452) = 0uLL;
                              *(_OWORD *)(v173 + 46_Block_object_dispose(&STACK[0x488], 8) = *(_OWORD *)v199;
                              *(_OWORD *)(v173 + 484) = *(_OWORD *)&v199[16];
                              *(_OWORD *)(v173 + 496) = *(_OWORD *)&v199[28];
                              *(float *)(v173 + 452) = v167;
                              *(float *)(v173 + 456) = v169;
                              *(float *)(v173 + 460) = v170 - v167;
                              *(float *)(v173 + 464) = v171 - v169;
                              unsigned int v174 = v162 + v164 * v195;
                              uint64_t v175 = a6 + 25456 + v172;
                              float32x2_t v176 = (_DWORD *)(v185 + 4 * v174);
                              do
                              {
                                *(_DWORD *)(v175 + v159) = *v176;
                                v159 += 4;
                                v176 += (v196 * v195);
                              }
                              while (v159 != 256);
                              uint64_t v90 = v147 + 60 * *(unsigned int *)(a1 + 241544);
                              long long v177 = *(_OWORD *)(v173 + 452);
                              long long v178 = *(_OWORD *)(v173 + 468);
                              long long v179 = *(_OWORD *)(v173 + 484);
                              *(_OWORD *)(v90 + 44) = *(_OWORD *)(v173 + 496);
                              *(_OWORD *)(v90 + 16) = v178;
                              *(_OWORD *)(v90 + 32) = v179;
                              *(_OWORD *)uint64_t v90 = v177;
                              unsigned int v180 = *(_DWORD *)(a1 + 241544);
                              uint64_t v181 = v147 + 60 * v180;
                              *(_DWORD *)(v181 + 16) = v163->i32[0];
                              unsigned int v145 = *v190;
                              unsigned int v144 = v180 + 1;
                              *(_DWORD *)(a1 + 241544) = v144;
                              *(_DWORD *)(v181 + 20) = v145;
                              LODWORD(v90) = *v197;
                            }
                            *int v190 = ++v145;
                          }
                          unint64_t v146 = v150;
                        }
                        while (v150 < v90);
                      }
                      goto LABEL_201;
                    }
LABEL_200:
                    *(_DWORD *)(a1 + 241544) = 0;
LABEL_201:
                    unint64_t result = *v182;
                    v190[2562] = *(_DWORD *)v182;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t AcDetNode::postProcessHandFloat(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = (_DWORD *)(a1 + 243348);
  uint64_t v8 = a1 + 99788;
  uint64_t v9 = a2[21];
  uint64_t v10 = a2[24];
  uint64_t v11 = a2[27];
  uint64_t v12 = a2[30];
  uint64_t v13 = a2[45];
  uint64_t v14 = *(unsigned int *)(a1 + 250252);
  uint64_t v15 = *(unsigned int *)(a1 + 250256);
  *(_DWORD *)(a1 + 102964) = 0;
  if (v15 && v14)
  {
    uint64_t v16 = 0;
    int v17 = 0;
    unint64_t v18 = 0;
    uint64_t v19 = 0;
    unint64_t v20 = v15 * (unint64_t)v14;
    uint64_t v21 = 8 * v20;
    uint64_t v22 = 4 * v20;
    uint64_t v23 = 4 * v14;
    do
    {
      uint64_t v24 = 0;
      int v25 = v17;
      do
      {
        float v26 = *(float *)(v9 + v24);
        if (v26 > 0.2 && v18 <= 0x63)
        {
          float v27 = sqrtf(v26 * *(float *)(v10 + v24));
          float v28 = (float)*(unsigned int *)(a1 + 252);
          float v29 = *(float *)(v11 + v22 + v24) * v28;
          float v30 = *(float *)(v11 + v21 + v24) * v28;
          uint64_t v31 = *(void *)(a1 + 1424) + v16;
          float v32 = *(float *)(v11 + 12 * v15 * (unint64_t)v14 + v24);
          uint64_t v33 = (float *)(a1 + 32 * v18 + 99764);
          *uint64_t v33 = *(float *)(v31 + v24) - (float)(*(float *)(v11 + v24) * v28);
          uint64_t v34 = *(void *)(a1 + 1432) + v16;
          v33[1] = *(float *)(v34 + v24) - v29;
          v33[2] = v30 + *(float *)(v31 + v24);
          v33[3] = (float)(v32 * v28) + *(float *)(v34 + v24);
          float v35 = *(float *)(v12 + v24);
          v33[6] = v27;
          *(_DWORD *)(a1 + 32 * v18 + 99780) = v35 > 0.5;
          *(_DWORD *)(a1 + 32 * v18 + 99784) = v25;
          unint64_t v18 = (v18 + 1);
          *(_DWORD *)(v8 + 3176) = v18;
        }
        v24 += 4;
        ++v25;
      }
      while (v23 != v24);
      v12 += v24;
      v11 += v24;
      v10 += v24;
      v9 += v24;
      ++v19;
      v17 += v14;
      v16 += v23;
    }
    while (v19 != v15);
  }
  else
  {
    unint64_t v18 = 0;
  }
  unsigned int v36 = acNonMaxSuppressionHandIntra(a1 + 99764, v18, *(unsigned char *)(a1 + 1416), (_OWORD *)(a1 + 1456), *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 20), *(float *)(a1 + 72), 0.3, *(float *)(a1 + 1412));
  *(_DWORD *)(v8 + 3176) = v36;
  if (*(unsigned char *)(a1 + 1420) && *(unsigned char *)(a1 + 1421))
  {
    uint64_t v37 = a1 + 208;
    if (!v36)
    {
LABEL_14:
      *(_DWORD *)(v8 + 3176) = 0;
      *(_DWORD *)(a5 + 5092_Block_object_dispose(&STACK[0x488], 8) = 0;
      *uint64_t v7 = 0;
      return 0;
    }
  }
  else
  {
    uint64_t v37 = a1 + 216;
    if (!v36) {
      goto LABEL_14;
    }
  }
  unsigned int v38 = 0;
  unint64_t v39 = v15 * (unint64_t)v14;
  uint64_t v40 = v36;
  float v41 = (float *)v8;
  do
  {
    if (*v41 > *(float *)(v37 + 4 * *((unsigned int *)v41 - 2)))
    {
      uint64_t v42 = v38++;
      long long v43 = *(_OWORD *)(v41 - 2);
      float v44 = (_OWORD *)(a1 + 99764 + 32 * v42);
      *float v44 = *(_OWORD *)(v41 - 6);
      v44[1] = v43;
    }
    v41 += 8;
    --v40;
  }
  while (v40);
  *(_DWORD *)(v8 + 3176) = v38;
  *(_DWORD *)(a5 + 5092_Block_object_dispose(&STACK[0x488], 8) = 0;
  *uint64_t v7 = 0;
  if (v38)
  {
    unsigned int v45 = 0;
    unint64_t v46 = 0;
    uint64_t v47 = a1 + 241548;
    unsigned int v48 = (float *)v8;
    do
    {
      if (v45 >= 0x14) {
        break;
      }
      ++v46;
      uint64_t v49 = a5 + ((unint64_t)v45 << 9);
      *(void *)(v49 + 4068_Block_object_dispose(&STACK[0x488], 8) = v46;
      if (*((_DWORD *)v48 - 2)) {
        int v50 = 11;
      }
      else {
        int v50 = 10;
      }
      *(_DWORD *)(v49 + 40696) = v50;
      float32x2_t v51 = *(float32x2_t *)(v48 - 6);
      *(float32x2_t *)(v49 + 40700) = v51;
      *(float32x2_t *)(v49 + 4070_Block_object_dispose(&STACK[0x488], 8) = vsub_f32(*(float32x2_t *)(v48 - 4), v51);
      int v52 = (int)(float)((float)(*v48 * 1000.0) + 0.5);
      if (v52 >= 1000) {
        int v52 = 1000;
      }
      if (v52 <= 1) {
        int v52 = 1;
      }
      *(_DWORD *)(v49 + 40716) = v52;
      *(_DWORD *)(v49 + 41136) = 0;
      *(_OWORD *)&v68[28] = 0uLL;
      *(_OWORD *)int v68 = 0uLL;
      memset(&v68[12], 255, 20);
      *(_OWORD *)(v49 + 41140) = 0uLL;
      *(_OWORD *)(v49 + 41156) = *(_OWORD *)v68;
      *(_OWORD *)(v49 + 41172) = *(_OWORD *)&v68[16];
      *(_OWORD *)(v49 + 41184) = *(_OWORD *)&v68[28];
      uint64_t v53 = *((unsigned int *)v48 - 1);
      float v54 = *(float *)(*(void *)(a1 + 1424) + 4 * v53);
      float v55 = (float)*(unsigned int *)(a1 + 252);
      float v56 = v54 + (float)((float)(*(float *)(v13 + 4 * v53) * -0.5) * v55);
      float v57 = *(float *)(*(void *)(a1 + 1432) + 4 * v53);
      float v58 = v57 + (float)((float)(*(float *)(v13 + 4 * (v39 + v53)) * -0.5) * v55);
      float v59 = v54 + (float)((float)(*(float *)(v13 + 4 * (2 * v39 + v53)) * 0.5) * v55);
      float v60 = v57
          + (float)((float)(*(float *)(v13 + 4 * (3 * v15 * (unint64_t)v14 + v53))
                          * 0.5)
                  * v55);
      *(_OWORD *)&v68[28] = 0uLL;
      *(_OWORD *)int v68 = 0uLL;
      memset(&v68[12], 255, 20);
      *(_OWORD *)(v49 + 41140) = 0uLL;
      *(_OWORD *)(v49 + 41156) = *(_OWORD *)v68;
      *(_OWORD *)(v49 + 41172) = *(_OWORD *)&v68[16];
      *(_OWORD *)(v49 + 41184) = *(_OWORD *)&v68[28];
      *(float *)(v49 + 41140) = v56;
      *(float *)(v49 + 41144) = v58;
      *(float *)(v49 + 4114_Block_object_dispose(&STACK[0x488], 8) = v59 - v56;
      *(float *)(v49 + 41152) = v60 - v58;
      unsigned int v61 = (_OWORD *)(v47 + 60 * *v7);
      long long v62 = *(_OWORD *)(v49 + 41140);
      long long v63 = *(_OWORD *)(v49 + 41156);
      long long v64 = *(_OWORD *)(v49 + 41172);
      *(_OWORD *)((char *)v61 + 44) = *(_OWORD *)(v49 + 41184);
      v61[1] = v63;
      v61[2] = v64;
      *unsigned int v61 = v62;
      LODWORD(v61) = *v7;
      uint64_t v65 = v47 + 60 * *v7;
      *(float *)(v65 + 16) = *(v48 - 2);
      int v66 = *(_DWORD *)(a5 + 40684);
      *uint64_t v7 = v61 + 1;
      *(_DWORD *)(v65 + 20) = v66;
      unsigned int v45 = *(_DWORD *)(a5 + 50928) + 1;
      *(_DWORD *)(a5 + 5092_Block_object_dispose(&STACK[0x488], 8) = v45;
      v48 += 8;
    }
    while (v46 < *(unsigned int *)(v8 + 3176));
  }
  return 0;
}

uint64_t AcDetNode::postProcessFacialLandmarkHalf()
{
  return 0;
}

uint64_t AcDetNode::postProcessFacialLandmarkFloat()
{
  return 0;
}

uint64_t AcDetNode::getParams(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  if (*a2 != 2) {
    return 4294967289;
  }
  if (a2[1] != 56945) {
    return 4294967292;
  }
  long long v5 = *(_OWORD *)(a1 + 20);
  *(void *)(a3 + 16) = *(void *)(a1 + 36);
  *(_OWORD *)a3 = v5;
  long long v6 = *(_OWORD *)(a1 + 44);
  *(void *)(a3 + 40) = *(void *)(a1 + 60);
  *(_OWORD *)(a3 + 24) = v6;
  unsigned int v7 = *(_DWORD *)(a1 + 244);
  unsigned int v8 = *(_DWORD *)(a1 + 248);
  *(_DWORD *)(a3 + 4_Block_object_dispose(&STACK[0x488], 8) = v8;
  *(_DWORD *)(a3 + 52) = v7;
  *(void *)(a3 + 56) = 0x70000000CLL;
  *(void *)(a3 + 64) = 1065353216;
  *(_DWORD *)(a3 + 72) = v8;
  *(_DWORD *)(a3 + 76) = v7;
  *(void *)(a3 + 80) = 0x700000001;
  *(void *)(a3 + 8_Block_object_dispose(&STACK[0x488], 8) = 1065353216;
  *(_DWORD *)(a3 + 96) = v8;
  *(_DWORD *)(a3 + 100) = v7;
  *(void *)(a3 + 104) = 0x700000004;
  *(void *)(a3 + 112) = 1065353216;
  *(_DWORD *)(a3 + 120) = v8;
  *(_DWORD *)(a3 + 124) = v7;
  *(void *)(a3 + 12_Block_object_dispose(&STACK[0x488], 8) = 0x700000003;
  *(void *)(a3 + 136) = 1065353216;
  *(_DWORD *)(a3 + 144) = v8;
  *(_DWORD *)(a3 + 14_Block_object_dispose(&STACK[0x488], 8) = v7;
  *(void *)(a3 + 152) = 0x700000002;
  *(void *)(a3 + 160) = 1065353216;
  *(_DWORD *)(a3 + 16_Block_object_dispose(&STACK[0x488], 8) = v8;
  *(_DWORD *)(a3 + 172) = v7;
  *(void *)(a3 + 176) = 0x700000003;
  *(void *)(a3 + 184) = 1065353216;
  *(_DWORD *)(a3 + 192) = v8;
  *(_DWORD *)(a3 + 196) = v7;
  *(void *)(a3 + 200) = 64;
  *(void *)(a3 + 20_Block_object_dispose(&STACK[0x488], 8) = 1065353216;
  *(_DWORD *)(a3 + 216) = v8;
  *(_DWORD *)(a3 + 220) = v7;
  *(void *)(a3 + 224) = 0x700000001;
  *(void *)(a3 + 232) = 1065353216;
  *(_DWORD *)(a3 + 240) = v8;
  *(_DWORD *)(a3 + 244) = v7;
  *(void *)(a3 + 24_Block_object_dispose(&STACK[0x488], 8) = 0x700000001;
  *(void *)(a3 + 256) = 1065353216;
  *(_DWORD *)(a3 + 26_Block_object_dispose(&STACK[0x488], 8) = v7;
  *(_DWORD *)(a3 + 264) = v8;
  *(void *)(a3 + 272) = 0x700000004;
  *(void *)(a3 + 280) = 1065353216;
  *(_DWORD *)(a3 + 292) = v7;
  *(_DWORD *)(a3 + 28_Block_object_dispose(&STACK[0x488], 8) = v8;
  *(void *)(a3 + 296) = 0x700000001;
  *(void *)(a3 + 304) = 1065353216;
  *(_DWORD *)(a3 + 316) = v7 >> 1;
  *(_DWORD *)(a3 + 312) = v8 >> 2;
  *(void *)(a3 + 320) = 0x700000001;
  *(void *)(a3 + 32_Block_object_dispose(&STACK[0x488], 8) = 1065353216;
  *(_DWORD *)(a3 + 340) = v7 >> 1;
  *(_DWORD *)(a3 + 336) = v8 >> 2;
  *(void *)(a3 + 344) = 0x700000001;
  *(void *)(a3 + 352) = 1065353216;
  *(_DWORD *)(a3 + 364) = v7 >> 1;
  *(_DWORD *)(a3 + 360) = v8 >> 2;
  *(void *)(a3 + 36_Block_object_dispose(&STACK[0x488], 8) = 0x700000004;
  *(void *)(a3 + 376) = 1065353216;
  *(_DWORD *)(a3 + 38_Block_object_dispose(&STACK[0x488], 8) = v7;
  *(_DWORD *)(a3 + 384) = v8 >> 2;
  *(void *)(a3 + 392) = 98;
  *(void *)(a3 + 400) = 1065353216;
  *(_DWORD *)(a3 + 412) = v7;
  *(_DWORD *)(a3 + 40_Block_object_dispose(&STACK[0x488], 8) = v8;
  *(void *)(a3 + 416) = 4;
  *(void *)(a3 + 424) = 1065353216;
  *(_OWORD *)(a3 + 432) = xmmword_246D9F180;
  *(void *)(a3 + 44_Block_object_dispose(&STACK[0x488], 8) = 1065353216;
  strncpy((char *)(a3 + 776), (const char *)(a1 + 324), 0x40uLL);
  strncpy((char *)(a3 + 840), (const char *)(a1 + 388), 0x40uLL);
  strncpy((char *)(a3 + 904), (const char *)(a1 + 452), 0x40uLL);
  strncpy((char *)(a3 + 968), (const char *)(a1 + 516), 0x40uLL);
  strncpy((char *)(a3 + 1032), (const char *)(a1 + 580), 0x40uLL);
  strncpy((char *)(a3 + 1096), (const char *)(a1 + 644), 0x40uLL);
  strncpy((char *)(a3 + 1160), (const char *)(a1 + 708), 0x40uLL);
  strncpy((char *)(a3 + 1224), (const char *)(a1 + 772), 0x40uLL);
  strncpy((char *)(a3 + 1288), (const char *)(a1 + 836), 0x40uLL);
  strncpy((char *)(a3 + 1352), (const char *)(a1 + 900), 0x40uLL);
  strncpy((char *)(a3 + 1416), (const char *)(a1 + 964), 0x40uLL);
  strncpy((char *)(a3 + 1480), (const char *)(a1 + 1028), 0x40uLL);
  strncpy((char *)(a3 + 1544), (const char *)(a1 + 1092), 0x40uLL);
  strncpy((char *)(a3 + 1608), (const char *)(a1 + 1156), 0x40uLL);
  strncpy((char *)(a3 + 1672), (const char *)(a1 + 1220), 0x40uLL);
  strncpy((char *)(a3 + 1736), (const char *)(a1 + 1284), 0x40uLL);
  strncpy((char *)(a3 + 1800), (const char *)(a1 + 1348), 0x40uLL);
  return 0;
}

uint64_t AcDetNode::useLowThresholds(uint64_t this, char a2)
{
  *(unsigned char *)(this + 1420) = a2;
  return this;
}

uint64_t AcDetNode::internalUseLowThresholds(uint64_t this, char a2)
{
  *(unsigned char *)(this + 1421) = a2;
  *(unsigned char *)(this + 1422) = a2;
  return this;
}

float cosineDistance(const float *a1, const float *a2, unsigned int a3)
{
  if (!a3)
  {
    float v6 = 0.0;
    float v5 = 0.0;
    float v4 = 0.0;
    return 1.0 - (float)(v6 / (float)((float)(sqrtf(v5) * sqrtf(v4)) + 0.00001));
  }
  if (a3 == 1)
  {
    uint64_t v3 = 0;
    float v4 = 0.0;
    float v5 = 0.0;
    float v6 = 0.0;
LABEL_8:
    uint64_t v12 = a3 - v3;
    uint64_t v13 = v3;
    uint64_t v14 = (float *)&a2[v3];
    uint64_t v15 = &a1[v13];
    do
    {
      float v16 = *v15++;
      float v17 = v16;
      float v18 = *v14++;
      float v6 = v6 + (float)(v17 * v18);
      float v5 = v5 + (float)(v17 * v17);
      float v4 = v4 + (float)(v18 * v18);
      --v12;
    }
    while (v12);
    return 1.0 - (float)(v6 / (float)((float)(sqrtf(v5) * sqrtf(v4)) + 0.00001));
  }
  uint64_t v3 = a3 & 0xFFFFFFFE;
  unsigned int v7 = (float *)(a2 + 1);
  unsigned int v8 = (float *)(a1 + 1);
  float v4 = 0.0;
  uint64_t v9 = v3;
  float v5 = 0.0;
  float v6 = 0.0;
  do
  {
    float v10 = *(v8 - 1);
    float v11 = *(v7 - 1);
    float v4 = (float)(v4 + (float)(v11 * v11)) + (float)(*v7 * *v7);
    float v5 = (float)(v5 + (float)(v10 * v10)) + (float)(*v8 * *v8);
    float v6 = (float)(v6 + (float)(v10 * v11)) + (float)(*v8 * *v7);
    v7 += 2;
    v8 += 2;
    v9 -= 2;
  }
  while (v9);
  if (v3 != a3) {
    goto LABEL_8;
  }
  return 1.0 - (float)(v6 / (float)((float)(sqrtf(v5) * sqrtf(v4)) + 0.00001));
}

float32x4_t *vectorAdd(float32x4_t *result, double a2, float32x4_t *a3, float a4, float *a5, unsigned int a6)
{
  if (a6)
  {
    if (a6 <= 7)
    {
      LODWORD(v6) = 0;
      goto LABEL_10;
    }
    LODWORD(v6) = 0;
    if ((unint64_t)((char *)a5 - (char *)result) < 0x20 || (unint64_t)((char *)a5 - (char *)a3) < 0x20) {
      goto LABEL_10;
    }
    uint64_t v6 = a6 & 0xFFFFFFF8;
    uint64_t v7 = 4 * v6;
    float32x4_t v8 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a2, 0);
    uint64_t v9 = result + 1;
    float v10 = a3 + 1;
    float v11 = a5 + 4;
    uint64_t v12 = v6;
    do
    {
      float32x4_t v13 = vmlaq_f32(vmulq_n_f32(*v10, a4), v8, *v9);
      *((float32x4_t *)v11 - 1) = vmlaq_f32(vmulq_n_f32(v10[-1], a4), v8, v9[-1]);
      *(float32x4_t *)float v11 = v13;
      v9 += 2;
      v10 += 2;
      v11 += 8;
      v12 -= 8;
    }
    while (v12);
    if (v6 != a6)
    {
      a5 = (float *)((char *)a5 + v7);
      unint64_t result = (float32x4_t *)((char *)result + v7);
      a3 = (float32x4_t *)((char *)a3 + 4 * v6);
LABEL_10:
      int v14 = a6 - v6;
      do
      {
        float v15 = result->f32[0];
        unint64_t result = (float32x4_t *)((char *)result + 4);
        float v16 = v15;
        float v17 = a3->f32[0];
        a3 = (float32x4_t *)((char *)a3 + 4);
        *a5++ = (float)(v17 * a4) + (float)(v16 * *(float *)&a2);
        --v14;
      }
      while (v14);
    }
  }
  return result;
}

float vectorNorm(float *a1, int a2)
{
  if (!a2) {
    return sqrtf(0.0);
  }
  if (a2 == 1)
  {
    LODWORD(v2) = 0;
    float v3 = 0.0;
  }
  else
  {
    uint64_t v2 = a2 & 0xFFFFFFFE;
    float v5 = a1 + 1;
    float v3 = 0.0;
    uint64_t v6 = v2;
    do
    {
      float v3 = (float)(v3 + (float)(*(v5 - 1) * *(v5 - 1))) + (float)(*v5 * *v5);
      v5 += 2;
      v6 -= 2;
    }
    while (v6);
    if (v2 == a2) {
      return sqrtf(v3);
    }
    a1 += v2;
  }
  int v7 = a2 - v2;
  do
  {
    float v8 = *a1++;
    float v3 = v3 + (float)(v8 * v8);
    --v7;
  }
  while (v7);
  return sqrtf(v3);
}

float *vectorScaleInPlace(float *result, double a2, unsigned int a3)
{
  if (a3)
  {
    *(float *)&a2 = *(float *)&a2 + 0.0000001;
    if (a3 <= 7)
    {
      LODWORD(v3) = 0;
      goto LABEL_8;
    }
    uint64_t v3 = a3 & 0xFFFFFFF8;
    float32x4_t v4 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a2, 0);
    float v5 = (float32x4_t *)(result + 4);
    uint64_t v6 = v3;
    do
    {
      float32x4_t v7 = vdivq_f32(*v5, v4);
      v5[-1] = vdivq_f32(v5[-1], v4);
      *float v5 = v7;
      v5 += 2;
      v6 -= 8;
    }
    while (v6);
    if (v3 != a3)
    {
      result += v3;
LABEL_8:
      int v8 = a3 - v3;
      do
      {
        *unint64_t result = *result / *(float *)&a2;
        ++result;
        --v8;
      }
      while (v8);
    }
  }
  return result;
}

double acAssoPointNull@<D0>(uint64_t a1@<X8>)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 44) = 0u;
  *(_OWORD *)a1 = 0u;
  *(void *)(a1 + 2_Block_object_dispose(&STACK[0x488], 8) = -1;
  *(void *)(a1 + 36) = -1;
  *(_DWORD *)(a1 + 44) = -1;
  return result;
}

__n128 acObjectFromFace@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v3;
  *(_DWORD *)(a2 + 32) = *(_DWORD *)(a1 + 1620);
  return result;
}

__n128 acObjectToFace@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  bzero((void *)(a2 + 32), 0x634uLL);
  __n128 result = *(__n128 *)a1;
  long long v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v5;
  *(_DWORD *)(a2 + 1620) = *(_DWORD *)(a1 + 32);
  return result;
}

__n128 acObjectToFaceInternal@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  a2[30] = 0u;
  a2[31] = 0u;
  a2[28] = 0u;
  a2[29] = 0u;
  a2[26] = 0u;
  a2[27] = 0u;
  a2[24] = 0u;
  a2[25] = 0u;
  a2[22] = 0u;
  a2[23] = 0u;
  a2[20] = 0u;
  a2[21] = 0u;
  a2[18] = 0u;
  a2[19] = 0u;
  a2[16] = 0u;
  a2[17] = 0u;
  a2[14] = 0u;
  a2[15] = 0u;
  a2[12] = 0u;
  a2[13] = 0u;
  a2[10] = 0u;
  a2[11] = 0u;
  a2[8] = 0u;
  a2[9] = 0u;
  a2[6] = 0u;
  a2[7] = 0u;
  a2[4] = 0u;
  a2[5] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  *((_DWORD *)a2 + 112) = *(_DWORD *)(a1 + 32);
  return result;
}

void *acFaceInternalToFace@<X0>(_DWORD *a1@<X0>, const void *a2@<X1>, int a3@<W2>, _DWORD *a4@<X8>)
{
  int v8 = a4 + 111;
  bzero(a4 + 111, 0x498uLL);
  __n128 result = memcpy(a4, a1, 0x1BCuLL);
  if (a3) {
    __n128 result = memcpy(v8, a2, 0x498uLL);
  }
  a4[405] = a1[112];
  return result;
}

__n128 acObjectFromFaceInternal@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v3;
  *(_DWORD *)(a2 + 32) = *(_DWORD *)(a1 + 448);
  return result;
}

unsigned char *AcAssoNode::AcAssoNode(unsigned char *a1, void *a2)
{
  *a2 = 0x721CC00000001;
  a1[1472] = 0;
  return a1;
}

{
  bzero(a1, 0x2ECuLL);
  *a2 = 0x721CC00000001;
  a1[1472] = 0;
  return a1;
}

void AcAssoNode::~AcAssoNode(AcAssoNode *this)
{
  uint64_t v2 = *(void *)this;
  if (v2)
  {
    MEMORY[0x24C548B00](v2, 0x1000C8077774924);
    *(void *)this = 0;
  }
}

{
  uint64_t v2;

  uint64_t v2 = *(void *)this;
  if (v2)
  {
    MEMORY[0x24C548B00](v2, 0x1000C8077774924);
    *(void *)this = 0;
  }
}

uint64_t AcAssoNode::sec_init(uint64_t a1, _DWORD *a2)
{
  if (*a2 != 1) {
    return 4294967289;
  }
  if ((a2[1] - 467393) <= 0xB && ((1 << (*((unsigned char *)a2 + 4) + 63)) & 0x901) != 0)
  {
    a2[1] = 467404;
    memcpy((void *)(a1 + 12), &kAcAssoNodeConfigFPS30RawData, 0x2E0uLL);
    *(unsigned char *)(a1 + 74_Block_object_dispose(&STACK[0x488], 8) = 0;
    *(_DWORD *)(a1 + _Block_object_dispose(&STACK[0x488], 8) = 212610;
    operator new[]();
  }
  return 4294967292;
}

uint64_t AcAssoNode::restart(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a2 != 1 || (*(_DWORD *)(a2 + 4) | 8) != 0x721C9) {
    return 4294967289;
  }
  uint64_t result = 0;
  *(_DWORD *)(a2 + 5172_Block_object_dispose(&STACK[0x488], 8) = 0;
  *(_DWORD *)(a2 + 202364) = 0;
  *(void *)(a2 + 202372) = 0xBF80000000000000;
  *(_DWORD *)(a2 + 103452) = 0;
  *(_DWORD *)(a2 + 119056) = 0;
  *(_DWORD *)(a2 + 134660) = 0;
  *(_DWORD *)(a2 + 186384) = 0;
  *(_DWORD *)(a2 + 20198_Block_object_dispose(&STACK[0x488], 8) = 0;
  *(unsigned char *)(a1 + 74_Block_object_dispose(&STACK[0x488], 8) = 0;
  return result;
}

uint64_t AcAssoNode::associationPreProc(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, uint64_t a5, _DWORD *__src, uint64_t a7, _DWORD *a8)
{
  if (*a8 != 1 || a8[1] != 467393) {
    return 4294967289;
  }
  int v14 = (char *)(__src + 6338);
  int v15 = *(unsigned __int8 *)(a5 + 21);
  if (v15 != *(unsigned __int8 *)(a1 + 748))
  {
    *(unsigned char *)(a1 + 74_Block_object_dispose(&STACK[0x488], 8) = v15;
    float v16 = (void *)(a1 + 12);
    if (v15) {
      float v17 = &kAcAssoNodeConfigFPS5RawData;
    }
    else {
      float v17 = &kAcAssoNodeConfigFPS30RawData;
    }
    memcpy(v16, v17, 0x2E0uLL);
  }
  uint64_t v19 = (char *)(__src + 10179);
  long long v112 = a8;
  unsigned int v115 = a2;
  unsigned int v116 = a3;
  unsigned int v113 = a4;
  if (!__src[1920])
  {
    LODWORD(v20) = 0;
    if (!*((_DWORD *)v14 + 3833)) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  unint64_t v20 = 0;
  uint64_t v21 = (char *)(a1 + 1476);
  uint64_t v22 = __src;
  do
  {
    memcpy(v21, v22, 0x200uLL);
    *(float *)(a1 + 34756 + 4 * v20++) = (float)v22[7] / 1000.0;
    v22 += 128;
    v21 += 512;
  }
  while (v20 < __src[1920]);
  if (*((_DWORD *)v14 + 3833))
  {
LABEL_15:
    unint64_t v23 = 0;
    uint64_t v24 = (unsigned int *)v14;
    do
    {
      uint64_t v25 = (v20 + v23);
      memcpy((void *)(a1 + (v25 << 9) + 1476), v24 - 7, 0x200uLL);
      *(float *)(a1 + 4 * v25 + 34756) = (float)*v24 / 1000.0;
      ++v23;
      v24 += 128;
    }
    while (v23 < *((unsigned int *)v14 + 3833));
    LODWORD(v20) = v20 + v23;
  }
LABEL_18:
  float v26 = v112;
  float v27 = (float *)(v112 + 25863);
  int32x4_t v114 = v112 + 12932;
  if (__src[12732])
  {
    unint64_t v28 = 0;
    float v29 = __src + 10179;
    do
    {
      uint64_t v30 = (v20 + v28);
      memcpy((void *)(a1 + (v30 << 9) + 1476), v29 - 7, 0x200uLL);
      *(float *)(a1 + 4 * v30 + 34756) = (float)*v29 / 1000.0;
      ++v28;
      v29 += 128;
    }
    while (v28 < *((unsigned int *)v19 + 2553));
    LODWORD(v20) = v20 + v28;
    float v26 = v112;
    float v27 = (float *)(v112 + 25863);
  }
  if (*(unsigned char *)(a1 + 1472) && v20)
  {
    uint64_t v31 = v20;
    int v32 = *v114;
    int v33 = *((_DWORD *)v27 + 3901);
    int v34 = v33 + *v114;
    float v35 = *((float *)v26 + 5);
    float v36 = *((float *)v26 + 6);
    float v37 = *((float *)v26 + 7);
    float v38 = *((float *)v26 + 8);
    float v39 = v35 + v37;
    float v40 = v36 + v38;
    float v41 = v37 * v38;
    float v42 = v27[4];
    float v43 = v27[5];
    float v44 = v27[6];
    float v45 = v27[7];
    float v46 = v42 + v44;
    float v47 = v43 + v45;
    unsigned int v48 = (float *)(a1 + 1484);
    float v49 = v44 * v45;
    do
    {
      uint64_t v51 = *(unsigned int *)v48;
      uint64_t v52 = a1 + 4 * v51;
      float v53 = *(float *)(v52 + 312);
      float v54 = *(float *)(v52 + 476);
      float v56 = v48[3];
      float v55 = v48[4];
      float v57 = v56 * v55;
      float v58 = (float)(v56 * v55) / (float)((float)(a3 * v115) + 0.0001);
      switch((int)v51)
      {
        case 0:
          if (*((unsigned char *)v48 + 92))
          {
            BOOL v60 = v32 == 1 && v26[4] == 1;
            BOOL v62 = v33 == 1 && *((_DWORD *)v27 + 3) == 1;
            float v63 = 0.0;
            if (v60)
            {
              float v64 = v48[1];
              if (v39 > v64)
              {
                float v65 = v48[2];
                if (v40 > v65)
                {
                  float v66 = v65 + v55;
                  if ((float)(v64 + v56) > v35 && v66 > v36) {
                    float v63 = (float)(fmaxf(fminf(v39, v64 + v56) - fmaxf(v35, v64), 0.0)
                  }
                                * fmaxf(fminf(v40, v66) - fmaxf(v36, v65), 0.0))
                        / fmaxf(fminf(v41, v57), 0.00001);
                }
              }
            }
            if (v62)
            {
              float v68 = v48[1];
              float v63 = 0.0;
              if (v46 > v68)
              {
                float v69 = v48[2];
                if (v47 > v69)
                {
                  float v70 = v68 + v56;
                  float v71 = v69 + v55;
                  if (v70 > v42 && v71 > v43) {
                    float v63 = (float)(fmaxf(fminf(v46, v70) - fmaxf(v42, v68), 0.0)
                  }
                                * fmaxf(fminf(v47, v71) - fmaxf(v43, v69), 0.0))
                        / fmaxf(fminf(v49, v57), 0.00001);
                }
              }
            }
            if (!(v32 | *((_DWORD *)v27 + 3901)) || v62 + v60 == 1 && v34 == 1 && v63 > 0.9)
            {
              float v54 = *(float *)(a1 + 568);
            }
            else if (v58 < 0.005)
            {
              float v54 = 0.5;
            }
          }
          else
          {
            float v53 = *(float *)(a1 + 304);
            float v54 = *(float *)(a1 + 472);
          }
          break;
        case 1:
          BOOL v74 = v32 == 1 && v26[4] == 0;
          BOOL v76 = v33 == 1 && *((_DWORD *)v27 + 3) == 0;
          float v77 = 0.0;
          if (v74)
          {
            float v78 = v48[1];
            if (v39 > v78)
            {
              float v79 = v48[2];
              if (v40 > v79)
              {
                float v80 = v79 + v55;
                if ((float)(v78 + v56) > v35 && v80 > v36) {
                  float v77 = (float)(fmaxf(fminf(v39, v78 + v56) - fmaxf(v35, v78), 0.0)
                }
                              * fmaxf(fminf(v40, v80) - fmaxf(v36, v79), 0.0))
                      / fmaxf(fminf(v41, v57), 0.00001);
              }
            }
          }
          if (v76)
          {
            float v82 = v48[1];
            float v77 = 0.0;
            if (v46 > v82)
            {
              float v83 = v48[2];
              if (v47 > v83)
              {
                float v84 = v82 + v56;
                float v85 = v83 + v55;
                if (v84 > v42 && v85 > v43) {
                  float v77 = (float)(fmaxf(fminf(v46, v84) - fmaxf(v42, v82), 0.0)
                }
                              * fmaxf(fminf(v47, v85) - fmaxf(v43, v83), 0.0))
                      / fmaxf(fminf(v49, v57), 0.00001);
              }
            }
          }
          if (v32 | *((_DWORD *)v27 + 3901))
          {
            if (v76 + v74 == 1 && v34 == 1 && v77 > 0.9)
            {
              float v54 = 0.516;
            }
            else if (v58 < 0.01)
            {
              float v54 = *(float *)(a1 + 564);
              float v53 = *(float *)(a1 + 744);
            }
          }
          else
          {
            float v54 = 0.54;
          }
          break;
        case 3:
        case 5:
          if (v58 > 0.01) {
            float v53 = *(float *)(v52 + 476);
          }
          break;
        case 8:
          float v87 = v56 / v55;
          BOOL v89 = v58 >= 0.002 && v87 > 0.9 && v87 < 1.1;
          float v53 = *(float *)(v52 + 476);
          if (!v89)
          {
            float v54 = *(float *)(a1 + 560);
            float v53 = *(float *)(a1 + 412);
          }
          break;
        default:
          break;
      }
      float v90 = (float)*((unsigned int *)v48 + 5) / 1000.0;
      if (v90 <= v53)
      {
        int v50 = v90 > v54;
      }
      else
      {
        int v50 = (int)(float)((float)((float)((float)(v90 - v53) / (float)(1.0 - v53)) * 1000.0) + 0.5);
        if (v50 >= 1000) {
          int v50 = 1000;
        }
        if (v50 <= 2) {
          int v50 = 2;
        }
      }
      *((_DWORD *)v48 + 5) = v50;
      v48 += 128;
      --v31;
    }
    while (v31);
  }
  if (v20)
  {
    unsigned int v91 = 0;
    uint64_t v92 = v20;
    uint64_t v93 = (_DWORD *)(a1 + 34756);
    unsigned int v94 = (_DWORD *)(a1 + 1476);
    uint64_t v95 = v20;
    do
    {
      if (v94[2] == 9)
      {
        memcpy((void *)(a1 + ((unint64_t)v91 << 9) + 35016), v94, 0x200uLL);
        *(_DWORD *)(a1 + 4 * v91++ + 68296) = *v93;
      }
      ++v93;
      v94 += 128;
      --v95;
    }
    while (v95);
    unint64_t v96 = 0;
    long long v97 = (_DWORD *)(a1 + 34756);
    unsigned int v98 = (_DWORD *)(a1 + 1476);
    unint64_t v20 = v20;
    do
    {
      if ((v98[2] & 0xFFFFFFFE) == 0xA)
      {
        memcpy((void *)(a1 + ((unint64_t)v96 << 9) + 68556), v98, 0x200uLL);
        *(_DWORD *)(a1 + 4 * v96 + 101836) = *v97;
        unint64_t v96 = (v96 + 1);
      }
      ++v97;
      v98 += 128;
      --v20;
    }
    while (v20);
    unint64_t v99 = 0;
    int v100 = (_DWORD *)(a1 + 34756);
    int v101 = (int *)(a1 + 1476);
    do
    {
      if (v101[2] <= 8)
      {
        memcpy((void *)(a1 + ((unint64_t)v99 << 9) + 1476), v101, 0x200uLL);
        *(_DWORD *)(a1 + 4 * v99 + 34756) = *v100;
        unint64_t v99 = (v99 + 1);
      }
      ++v100;
      v101 += 128;
      --v92;
    }
    while (v92);
  }
  else
  {
    unint64_t v96 = 0;
    unsigned int v91 = 0;
    unint64_t v99 = 0;
  }
  int v117 = 0;
  v112[25863] = acTrkFullBodyAssocTrkDet(v115, v116, v113, (uint64_t)(v26 + 12933), v112[25863], *(_DWORD *)(a1 + 276), a1 + 35016, v91, a1 + 32, a1 + 444, a1 + 572, v118, &v117, v26 + 50589, (char *)v26 + 119060, v26 + 33665, (float *)(a1 + 68296), v110, a1 + 1476,
                  v99,
                  *(void **)a1);
  int v117 = 0;
  v26[46596] = acTrkHandAssocTrkDet(v115, v116, (uint64_t)(v26 + 33666), v26[46596], *(_DWORD *)(a1 + 276), a1 + 68556, v96, a1 + 32, a1 + 444, v118, &v117, v26 + 50589, (char *)v26 + 186388, v26 + 50497, (float *)(a1 + 101836), v108, v109, v111, *(void **)a1);
  int v117 = 0;
  unsigned int v102 = acTrkObjectAssocTrkDet(v115, v116, (uint64_t)(v26 + 2), *v114, *(_DWORD *)(a1 + 276), a1 + 1476, v99, a1 + 32, a1 + 444, v118, &v117, v26 + 50589, (char *)v26 + 103456, v26 + 29764, (float *)(a1 + 34756), (uint64_t)&AcAssoNode::m_kFacePoseRollCenters, *(void **)a1);
  *int32x4_t v114 = v102;
  if (!v102) {
    goto LABEL_142;
  }
  if (v102 == 1)
  {
    uint64_t v103 = 0;
  }
  else
  {
    uint64_t v103 = v102 & 0xFFFFFFFE;
    uint64_t v104 = v26;
    uint64_t v105 = v103;
    do
    {
      v104[134] = 0;
      v104[565] = 0;
      v104 += 862;
      v105 -= 2;
    }
    while (v105);
    if (v103 == v102) {
      goto LABEL_142;
    }
  }
  uint64_t v106 = v102 - v103;
  uint64_t v107 = &v26[431 * v103 + 134];
  do
  {
    *uint64_t v107 = 0;
    v107 += 431;
    --v106;
  }
  while (v106);
LABEL_142:
  uint64_t result = 0;
  v26[1] = 467401;
  return result;
}

uint64_t AcAssoNode::associationPostProc(uint64_t a1, int a2, int a3, int a4, long long *a5, uint64_t a6, uint64_t a7, uint64_t a8, float a9, float a10, float a11, float a12)
{
  if (*(_DWORD *)a6 != 1) {
    return 4294967289;
  }
  if (*(_DWORD *)(a6 + 4) != 467401) {
    return 4294967292;
  }
  float32x4_t v13 = (int *)(a6 + 51728);
  if (*(_DWORD *)(a6 + 51728) != a4) {
    return 4294967292;
  }
  uint64_t v22 = (_DWORD *)(a6 + 186384);
  unint64_t v23 = (unsigned int *)(a6 + 103452);
  if (*(unsigned char *)(a1 + 672)) {
    *unint64_t v23 = acTrkFullBodyRemoveYoungOverlapObjects(a6 + 51732, *v23, *(float *)(a1 + 676));
  }
  uint64_t v168 = a7;
  if (*(unsigned char *)(a1 + 724)) {
    *uint64_t v22 = acTrkHandRemoveYoungOverlapObjects(a6 + 134664, *v22, *(_DWORD *)(a1 + 736), *(_DWORD *)(a1 + 732), *(float *)(a1 + 728), *(float *)(a1 + 740));
  }
  float v171 = (unsigned int *)(a6 + 186384);
  uint64_t v24 = a6 + 8;
  uint32x2_t v169 = (uint32x2_t)__PAIR64__(a3, a2);
  largeFaceSuppressSameSizeUBody(a6 + 8, *v13, a3, a2, a1 + 102336, (int *)(a1 + 102456));
  uint64_t v175 = (unsigned int *)(a6 + 51728);
  uint64_t v25 = *v13;
  if (v25)
  {
    uint64_t v26 = 0;
    unsigned int v27 = 0;
    uint64_t v28 = a6;
    do
    {
      if (*(int *)(v28 + 536) <= 1)
      {
        if (v26 != v27) {
          memcpy((void *)(v24 + 1724 * v27), (const void *)(v28 + 8), 0x6BCuLL);
        }
        ++v27;
      }
      v28 += 1724;
      ++v26;
    }
    while (v25 != v26);
  }
  else
  {
    unsigned int v27 = 0;
  }
  *uint64_t v175 = v27;
  v181[0] = 0;
  acTrkFilterMultiUbodyinSameFbody((float *)(a6 + 8), v175, a6 + 51732, *v23, (float *)(a1 + 184), (_DWORD *)(a1 + 102216), v181, a1 + 1232);
  unint64_t v30 = *v175;
  if (v30)
  {
    uint64_t v31 = 0;
    unsigned int v32 = 0;
    uint64_t v33 = a6;
    do
    {
      if (*(int *)(v33 + 536) <= 1)
      {
        if (v31 != v32) {
          memcpy((void *)(v24 + 1724 * v32), (const void *)(v33 + 8), 0x6BCuLL);
        }
        ++v32;
      }
      v33 += 1724;
      ++v31;
    }
    while (v30 != v31);
  }
  else
  {
    unsigned int v32 = 0;
  }
  if (v32 != v30) {
    return 4294967289;
  }
  unint64_t v34 = acTrkObjectRemoveOldOverlapObjects(a6 + 8, v30, (int *)(a1 + 102096), *(float *)(a1 + 292));
  unint64_t v35 = acTrkObjectRemoveYoungOverlapObjects(a6 + 8, v34, (char *)(a1 + 102096), *(float *)(a1 + 292));
  unsigned int v36 = acTrkObjectRemoveOldCrossClassOverlapObjects(a6 + 8, v35, *(float *)(a1 + 296));
  *uint64_t v175 = v36;
  uint64_t v165 = v23;
  *float v171 = acTrkFilterFPHandinSameFbody(a6 + 8, v36, v37, *v23, (char *)(a6 + 134664), 0.1, *v171);
  unint64_t v38 = *v175;
  if (v38)
  {
    unint64_t v39 = 0;
    unsigned int v40 = 0;
    float v41 = (_DWORD *)(a6 + 16);
    uint64_t v42 = a8;
    do
    {
      if (*v41 <= 4u && ((1 << *v41) & 0x16) != 0)
      {
        uint64_t v44 = a1 + 4 * v40++;
        *(_DWORD *)(v44 + 1112) = *(v41 - 2);
        unint64_t v38 = *v175;
      }
      ++v39;
      v41 += 431;
    }
    while (v39 < v38);
  }
  else
  {
    unsigned int v40 = 0;
    uint64_t v42 = a8;
  }
  unsigned int v45 = 0;
  *(void *)(a1 + 752) = -1;
  float v46 = (unsigned int *)(v42 + 16464);
  *(_DWORD *)(a1 + 760) = 0;
  *(void *)(a1 + 764) = -1;
  *(_DWORD *)(a1 + 772) = 0;
  *(void *)(a1 + 776) = -1;
  *(_DWORD *)(a1 + 784) = 0;
  *(void *)(a1 + 78_Block_object_dispose(&STACK[0x488], 8) = -1;
  *(_DWORD *)(a1 + 796) = 0;
  *(void *)(a1 + 800) = -1;
  *(_DWORD *)(a1 + 80_Block_object_dispose(&STACK[0x488], 8) = 0;
  *(void *)(a1 + 812) = -1;
  *(_DWORD *)(a1 + 820) = 0;
  *(void *)(a1 + 824) = -1;
  *(_DWORD *)(a1 + 832) = 0;
  *(void *)(a1 + 836) = -1;
  *(_DWORD *)(a1 + 844) = 0;
  *(void *)(a1 + 84_Block_object_dispose(&STACK[0x488], 8) = -1;
  *(_DWORD *)(a1 + 856) = 0;
  *(void *)(a1 + 860) = -1;
  *(_DWORD *)(a1 + 86_Block_object_dispose(&STACK[0x488], 8) = 0;
  *(void *)(a1 + 872) = -1;
  *(_DWORD *)(a1 + 880) = 0;
  *(void *)(a1 + 884) = -1;
  *(_DWORD *)(a1 + 892) = 0;
  *(void *)(a1 + 896) = -1;
  *(_DWORD *)(a1 + 904) = 0;
  *(void *)(a1 + 90_Block_object_dispose(&STACK[0x488], 8) = -1;
  *(_DWORD *)(a1 + 916) = 0;
  *(void *)(a1 + 920) = -1;
  *(_DWORD *)(a1 + 92_Block_object_dispose(&STACK[0x488], 8) = 0;
  *(void *)(a1 + 932) = -1;
  *(_DWORD *)(a1 + 940) = 0;
  *(void *)(a1 + 944) = -1;
  *(_DWORD *)(a1 + 952) = 0;
  *(void *)(a1 + 956) = -1;
  *(_DWORD *)(a1 + 964) = 0;
  *(void *)(a1 + 96_Block_object_dispose(&STACK[0x488], 8) = -1;
  *(_DWORD *)(a1 + 976) = 0;
  *(void *)(a1 + 980) = -1;
  *(_DWORD *)(a1 + 98_Block_object_dispose(&STACK[0x488], 8) = 0;
  *(void *)(a1 + 992) = -1;
  *(_DWORD *)(a1 + 1000) = 0;
  *(void *)(a1 + 1004) = -1;
  *(_DWORD *)(a1 + 1012) = 0;
  *(void *)(a1 + 1016) = -1;
  *(_DWORD *)(a1 + 1024) = 0;
  *(void *)(a1 + 102_Block_object_dispose(&STACK[0x488], 8) = -1;
  *(_DWORD *)(a1 + 1036) = 0;
  *(void *)(a1 + 1040) = -1;
  *(_DWORD *)(a1 + 104_Block_object_dispose(&STACK[0x488], 8) = 0;
  *(void *)(a1 + 1052) = -1;
  *(_DWORD *)(a1 + 1060) = 0;
  *(void *)(a1 + 1064) = -1;
  *(_DWORD *)(a1 + 1072) = 0;
  *(void *)(a1 + 1076) = -1;
  *(_DWORD *)(a1 + 1084) = 0;
  *(void *)(a1 + 108_Block_object_dispose(&STACK[0x488], 8) = -1;
  *(_DWORD *)(a1 + 1096) = 0;
  *(void *)(a1 + 1100) = -1;
  *(_DWORD *)(a1 + 110_Block_object_dispose(&STACK[0x488], 8) = 0;
  unsigned int v47 = *(_DWORD *)(a1 + 276);
  unsigned int v48 = (unsigned int *)(a6 + 202352);
  unsigned int v49 = *(_DWORD *)(a6 + 202352);
  if (v47 < v49) {
    unsigned int v49 = *(_DWORD *)(a1 + 276);
  }
  *(_DWORD *)(a6 + 202352) = v49;
  if (v49)
  {
    uint64_t v50 = a6 + 51732;
    if (v40)
    {
      unint64_t v51 = 0;
      unsigned int v45 = 0;
      do
      {
        if (v45 < v47)
        {
          float v54 = (_DWORD *)(a6 + 12 * v51 + 201992);
          uint64_t v55 = v40;
          float v56 = (int *)(a1 + 1112);
          while (1)
          {
            int v57 = *v56++;
            if (*v54 == v57) {
              break;
            }
            if (!--v55) {
              goto LABEL_42;
            }
          }
          uint64_t v52 = a1 + 12 * v45++;
          uint64_t v53 = *(void *)v54;
          *(_DWORD *)(v52 + 760) = *(_DWORD *)(a6 + 12 * v51 + 202000);
          *(void *)(v52 + 752) = v53;
          unsigned int v49 = *v48;
        }
LABEL_42:
        ++v51;
      }
      while (v51 < v49);
    }
  }
  else
  {
    uint64_t v50 = a6 + 51732;
  }
  uint64_t v173 = v46;
  memcpy((void *)(a6 + 201992), (const void *)(a1 + 752), 0x168uLL);
  *(_DWORD *)(a6 + 202352) = v45;
  float v58 = (int *)(a6 + 51728);
  acTrkGroupAssign(a6 + 8, *v175, a6 + 8, *v175, 0, 1, a1 + 256, (_DWORD *)(a6 + 202360), (int *)(a6 + 201992), v48, *(void **)a1);
  acTrkGroupAssign(a6 + 8, *v58, a6 + 8, *v58, 3, 2, a1 + 256, (_DWORD *)(a6 + 202360), (int *)(a6 + 201992), v48, *(void **)a1);
  acTrkGroupAssign(a6 + 8, *v58, a6 + 8, *v58, 5, 4, a1 + 256, (_DWORD *)(a6 + 202360), (int *)(a6 + 201992), v48, *(void **)a1);
  float v59 = AcAssoNode::procLearnedGroupID(a1, (_DWORD *)a6);
  acLGroupIDDominanPersonPatch((uint64_t)v59, v60, v50, *v23, a6 + 134664, *v171);
  BOOL v170 = *(_DWORD *)(a6 + 202364) != 0;
  if (v36)
  {
    uint64_t v61 = 0;
    unsigned int v174 = 0;
    float32x2_t v62 = vcvt_f32_u32(v169);
    uint64_t v63 = 1724 * v36;
    uint64_t v65 = a8;
    float v64 = v173;
    uint64_t v166 = v63;
    while (1)
    {
      unsigned int v122 = *(_DWORD *)(v65 + 220);
      if (v122 > 9) {
        goto LABEL_52;
      }
      unsigned int v123 = *v64;
      if (*v64 >= 0x14) {
        goto LABEL_52;
      }
      uint64_t v124 = a6 + v61;
      uint64_t v125 = *(unsigned int *)(a6 + v61 + 16);
      float v126 = *(float *)(a1 + 4 * v125 + 476);
      if (!v125 && !*(unsigned char *)(v124 + 108)) {
        float v126 = *(float *)(a1 + 472);
      }
      uint64_t v127 = (_OWORD *)(v124 + 8);
      int v128 = (int)(float)((float)((float)((float)(*(float *)(v124 + 532) - v126) / (float)(1.0 - v126)) * 1000.0) + 0.5) >= 1000
           ? 1000
           : (int)(float)((float)((float)((float)(*(float *)(v124 + 532) - v126) / (float)(1.0 - v126)) * 1000.0) + 0.5);
      int v129 = v128 <= 1 ? 1 : v128;
      if (!*(unsigned char *)(a1 + 409)) {
        break;
      }
      if v125 < 9 && ((0x13Fu >> v125))
      {
        unsigned int v130 = dword_246D9F220[v125];
      }
      else if ((v125 & 0xFFFFFFFE) == 0xA)
      {
        unsigned int v130 = 6;
      }
      else
      {
        unsigned int v130 = 5;
      }
      uint64_t v134 = a6 + v61;
      unsigned int v135 = *(_DWORD *)(a6 + v61 + 520);
      if (v135 <= *(_DWORD *)(a1 + 4 * v130 + 416))
      {
        if (v125)
        {
          float v58 = (int *)(a6 + 51728);
          if (v125 == 1)
          {
            __dst[0] = 0;
            long long v179 = *a5;
            uint64_t v180 = *((void *)a5 + 2);
            mapBoxCenterToFeatMap((float *)(a6 + v61 + 20), (uint64_t *)&v179, 2, v169.u32[1], v169.u32[0], __dst);
            uint64_t v63 = v166;
            uint64_t v65 = a8;
            float v64 = v173;
            float v136 = 0.05;
            if (v135 < 4) {
              float v136 = 0.009;
            }
            if (v135 >= 3 && *(float *)__dst <= v136) {
              goto LABEL_114;
            }
          }
          uint64_t v137 = v65 + 36 * v123;
          long long v138 = v127[1];
          *(_OWORD *)(v137 + 1646_Block_object_dispose(&STACK[0x488], 8) = *v127;
          *(_OWORD *)(v137 + 16484) = v138;
          *(_DWORD *)(v137 + 16496) = v129;
          *(_DWORD *)(v137 + 16500) = v170;
          *float v64 = v123 + 1;
          float32x2_t v139 = *(float32x2_t *)(a6 + v61 + 20);
          int8x8_t v140 = (int8x8_t)vcltz_f32(v139);
          *(float32x2_t *)&long long v138 = vsub_f32(vsub_f32(*(float32x2_t *)(a6 + v61 + 28), (float32x2_t)vand_s8((int8x8_t)vabs_f32(v139), v140)), vmaxnm_f32(vsub_f32(vadd_f32(v139, *(float32x2_t *)(a6 + v61 + 28)), v62), 0));
          *(int8x8_t *)(v137 + 16480) = vbic_s8((int8x8_t)v139, v140);
          *(void *)(v137 + 1648_Block_object_dispose(&STACK[0x488], 8) = v138;
          goto LABEL_147;
        }
        unsigned int v144 = (float *)(a6 + v61);
        BOOL v145 = *(unsigned char *)(a6 + v61 + 108) == 0;
        __dst[0] = 0;
        long long v177 = *a5;
        uint64_t v178 = *((void *)a5 + 2);
        mapBoxCenterToFeatMap((float *)(a6 + v61 + 20), (uint64_t *)&v177, v145, v169.u32[1], v169.u32[0], __dst);
        if (*(float *)__dst < 0.009 && v135) {
          goto LABEL_169;
        }
        float v146 = v144[5];
        BOOL v147 = 1;
        if (v146 >= 0.0)
        {
          float v148 = v144[6];
          if (v148 >= 0.0)
          {
            BOOL v147 = (float)((float)(v148 + v144[8]) - (float)v169.u32[1]) > 0.0;
            if ((float)((float)(v146 + *(float *)(a6 + v61 + 28)) - (float)v169.u32[0]) > 0.0) {
              BOOL v147 = 1;
            }
          }
        }
        BOOL v164 = v147;
        unsigned int v149 = *(_DWORD *)(a6 + v61 + 452);
        int v150 = *(unsigned __int8 *)(a6 + v61 + 396);
        bzero(&__dst[111], 0x498uLL);
        memcpy(__dst, v127, 0x1BCuLL);
        if (v150)
        {
          if (v149 >= 0xE) {
            unsigned int v151 = 14;
          }
          else {
            unsigned int v151 = v149;
          }
          memcpy(&__dst[111], (const void *)(v168 + 1176 * v151 + 7684), 0x498uLL);
        }
        uint64_t v152 = a8 + 1624 * v122;
        uint64_t v153 = memcpy((void *)(v152 + 224), __dst, 0x654uLL);
        *(_DWORD *)(v152 + 252) = v129;
        *(unsigned char *)(v152 + 34_Block_object_dispose(&STACK[0x488], 8) = 0;
        if (v164 && (uint64_t v154 = a6 + v61, *(unsigned char *)(a6 + v61 + 108)))
        {
          uint64_t v155 = (unsigned char *)(v152 + 348);
          float32x2_t v156 = (void *)(v154 + 860);
          unsigned int v157 = *(_DWORD *)(v154 + 860);
          if (v128 > 1)
          {
            uint64_t v158 = a8;
            if (v157 < 3 || (unsigned int v163 = *(_DWORD *)(a6 + v61 + 864), v163 > 2))
            {
              void *v156 = 0;
            }
            else
            {
              unsigned char *v155 = 1;
              *(_DWORD *)(a6 + v61 + 864) = v163 + 1;
            }
          }
          else
          {
            uint64_t v158 = a8;
            if (v157 >= 2) {
              unsigned char *v155 = 1;
            }
            *(_DWORD *)float32x2_t v156 = v157 + 1;
            *(_DWORD *)(a6 + v61 + 864) = 0;
          }
        }
        else
        {
          *(void *)(a6 + v61 + 860) = 0;
          uint64_t v158 = a8;
        }
        uint64_t v159 = v158 + 1624 * v122;
        *(_DWORD *)(v159 + 1844) = v170;
        *(_DWORD *)(v159 + 32_Block_object_dispose(&STACK[0x488], 8) = *(_DWORD *)(v134 + 520);
        uint64_t v160 = a6 + v61;
        int v161 = *(_DWORD *)(a6 + v61 + 788);
        BOOL v94 = v161 != 0;
        unsigned int v162 = v161 - 1;
        if (!v94) {
          unsigned int v162 = 0;
        }
        *(_OWORD *)(v159 + 332) = *(_OWORD *)(v160 + 40 * v162 + 540);
        AcAssoNode::filterANSTBboxforBESCrop(a9, a10, a11, a12, (uint64_t)v153, (uint64_t)v127, v169.u32[1], v169.u32[0]);
        if (*(unsigned char *)(v160 + 868))
        {
LABEL_169:
          float v58 = (int *)(a6 + 51728);
          uint64_t v65 = a8;
          float v64 = v173;
          uint64_t v63 = v166;
          goto LABEL_114;
        }
        float v64 = v173;
        uint64_t v63 = v166;
        if (*(unsigned char *)(v160 + 869))
        {
          float v58 = (int *)(a6 + 51728);
          uint64_t v65 = a8;
          goto LABEL_114;
        }
        uint64_t v65 = a8;
        if (!*(unsigned char *)(a6 + v61 + 871)
          && !*(unsigned char *)(a6 + v61 + 870)
          && (!v164 || !*(_DWORD *)(v134 + 520) || *(float *)(a6 + v61 + 840) >= 0.2))
        {
          ++*(_DWORD *)(a8 + 220);
          float v58 = (int *)(a6 + 51728);
LABEL_147:
          ++v174;
          goto LABEL_114;
        }
      }
      float v58 = (int *)(a6 + 51728);
LABEL_114:
      v61 += 1724;
      if (v63 == v61) {
        goto LABEL_52;
      }
    }
    if (v125)
    {
      long long v131 = *(_OWORD *)(v124 + 24);
      uint64_t v132 = v65 + 36 * v123;
      *(_OWORD *)(v132 + 1646_Block_object_dispose(&STACK[0x488], 8) = *v127;
      *(_OWORD *)(v132 + 16484) = v131;
      *(_DWORD *)(v132 + 16500) = v170;
      *float v64 = v123 + 1;
      float v133 = (int *)(v132 + 16496);
    }
    else
    {
      unsigned int v141 = *(_DWORD *)(a6 + v61 + 452);
      int v142 = *(unsigned __int8 *)(a6 + v61 + 396);
      bzero(&__dst[111], 0x498uLL);
      memcpy(__dst, v127, 0x1BCuLL);
      if (v142) {
        memcpy(&__dst[111], (const void *)(v168 + 1176 * v141 + 7684), 0x498uLL);
      }
      int v143 = (_DWORD *)(a8 + 1624 * v122);
      memcpy(v143 + 56, __dst, 0x654uLL);
      uint64_t v65 = a8;
      v143[461] = v170;
      *(_DWORD *)(a8 + 220) = v122 + 1;
      float v133 = v143 + 63;
      float v64 = v173;
      uint64_t v63 = v166;
    }
    *float v133 = v129;
    goto LABEL_147;
  }
  unsigned int v174 = 0;
  uint64_t v65 = a8;
  float v64 = v173;
LABEL_52:
  unsigned int v66 = v174;
  if (v174 > 0x1D)
  {
    float v68 = (float *)(a6 + 186384);
    uint64_t v69 = v168;
    BOOL v70 = v170;
  }
  else
  {
    unint64_t v67 = *v165;
    float v68 = (float *)(a6 + 186384);
    uint64_t v69 = v168;
    BOOL v70 = v170;
    if (*v165)
    {
      uint64_t v71 = 0;
      float32x2_t v72 = vcvt_f32_u32(v169);
      uint64_t v73 = v181[0];
      unsigned int v74 = *v64;
      while (1)
      {
        if (v74 > 0x13) {
          goto LABEL_73;
        }
        int v75 = (int)(float)((float)((float)((float)(*(float *)(a6 + 1724 * v71 + 52256) - *(float *)(a1 + 512))
                                         / (float)(1.0 - *(float *)(a1 + 512)))
                                 * 1000.0)
                         + 0.5);
        if (v75 >= 1000) {
          int v75 = 1000;
        }
        if (v75 <= 1) {
          int v75 = 1;
        }
        if (*(_DWORD *)(a6 + 1724 * v71 + 52244)) {
          goto LABEL_67;
        }
        if (!*(unsigned char *)(a1 + 410)) {
          goto LABEL_66;
        }
        uint64_t v76 = v73;
        float v77 = (int *)(a1 + 102216);
        if (v73) {
          break;
        }
LABEL_65:
        if (*(float *)(a6 + 1724 * v71 + 52564) > 0.015) {
          goto LABEL_66;
        }
        float v64 = v173;
        if (v66 > 0x1D) {
          goto LABEL_73;
        }
LABEL_68:
        if (++v71 >= v67) {
          goto LABEL_73;
        }
      }
      while (1)
      {
        int v78 = *v77++;
        if (v71 == v78) {
          break;
        }
        if (!--v76) {
          goto LABEL_65;
        }
      }
LABEL_66:
      uint64_t v79 = v65 + 36 * v74;
      long long v80 = *(_OWORD *)(a6 + 1724 * v71 + 51748);
      *(_OWORD *)(v79 + 1646_Block_object_dispose(&STACK[0x488], 8) = *(_OWORD *)(a6 + 1724 * v71 + 51732);
      *(_OWORD *)(v79 + 16484) = v80;
      *(_DWORD *)(v79 + 16496) = v75;
      *(_DWORD *)(v79 + 16500) = v170;
      ++v74;
      float v64 = v173;
      *uint64_t v173 = v74;
      float32x2_t v81 = *(float32x2_t *)(a6 + 1724 * v71 + 51744);
      int8x8_t v82 = (int8x8_t)vcltz_f32(v81);
      *(float32x2_t *)&long long v80 = vsub_f32(vsub_f32(*(float32x2_t *)(a6 + 1724 * v71 + 51752), (float32x2_t)vand_s8((int8x8_t)vabs_f32(v81), v82)), vmaxnm_f32(vsub_f32(vadd_f32(v81, *(float32x2_t *)(a6 + 1724 * v71 + 51752)), v72), 0));
      *(int8x8_t *)(v79 + 16480) = vbic_s8((int8x8_t)v81, v82);
      *(void *)(v79 + 1648_Block_object_dispose(&STACK[0x488], 8) = v80;
      ++v66;
      unint64_t v67 = *v165;
LABEL_67:
      if (v66 > 0x1D) {
        goto LABEL_73;
      }
      goto LABEL_68;
    }
  }
LABEL_73:
  if (v66 <= 0x31)
  {
    unint64_t v83 = *(unsigned int *)v68;
    if (*(_DWORD *)v68)
    {
      float32x2_t v84 = vcvt_f32_u32(v169);
      unint64_t v85 = *v64;
      uint64_t v86 = a6 + 134664;
      unint64_t v87 = 1;
      do
      {
        if (v85 > 0x27) {
          break;
        }
        if (!*(_DWORD *)(v86 + 512))
        {
          float v88 = *(float *)(a1 + 4 * *(unsigned int *)(v86 + 8) + 476);
          int v89 = (int)(float)((float)((float)((float)(*(float *)(v86 + 524) - v88) / (float)(1.0 - v88)) * 1000.0) + 0.5);
          if (v89 >= 1000) {
            int v89 = 1000;
          }
          if (v89 <= 1) {
            int v89 = 1;
          }
          uint64_t v90 = v65 + 36 * v85;
          long long v91 = *(_OWORD *)(v86 + 16);
          *(_OWORD *)(v90 + 1646_Block_object_dispose(&STACK[0x488], 8) = *(_OWORD *)v86;
          *(_OWORD *)(v90 + 16484) = v91;
          *(_DWORD *)(v90 + 16496) = v89;
          *(_DWORD *)(v90 + 16500) = v70;
          *float v64 = ++v85;
          float32x2_t v92 = *(float32x2_t *)(v86 + 12);
          int8x8_t v93 = (int8x8_t)vcltz_f32(v92);
          *(float32x2_t *)&long long v91 = vsub_f32(vsub_f32(*(float32x2_t *)(v86 + 20), (float32x2_t)vand_s8((int8x8_t)vabs_f32(v92), v93)), vmaxnm_f32(vsub_f32(vadd_f32(v92, *(float32x2_t *)(v86 + 20)), v84), 0));
          *(int8x8_t *)(v90 + 16480) = vbic_s8((int8x8_t)v92, v93);
          *(void *)(v90 + 1648_Block_object_dispose(&STACK[0x488], 8) = v91;
          ++v66;
          unint64_t v83 = *(unsigned int *)v68;
        }
        if (v66 > 0x31) {
          break;
        }
        v86 += 1724;
        BOOL v94 = v87++ >= v83;
      }
      while (!v94);
    }
  }
  float v95 = v68[3998];
  float v96 = *(float *)(v69 + 50932);
  if (v95 > -1.0) {
    float v96 = (float)(v95 * 0.9) + (float)(v96 * 0.1);
  }
  v68[3998] = v96;
  if (v96 >= 0.5)
  {
    int v97 = (int)(float)((float)((float)((float)(v96 + -0.5) + (float)(v96 + -0.5)) * 1000.0) + 0.5);
    if (v97 >= 1000) {
      int v97 = 1000;
    }
    if (v97 <= 1) {
      int v97 = 1;
    }
  }
  else
  {
    int v97 = 1;
  }
  v64[361] = v97;
  unint64_t v98 = *v58;
  if (v98)
  {
    unint64_t v99 = 0;
    unint64_t v100 = *v58;
    uint64_t v101 = a6 + 540;
    do
    {
      if (*(_DWORD *)(v101 + 248) >= 6u)
      {
        long long v102 = *(_OWORD *)(v101 + 56);
        *(_OWORD *)uint64_t v101 = *(_OWORD *)(v101 + 40);
        *(_OWORD *)(v101 + 16) = v102;
        *(void *)(v101 + 32) = *(void *)(v101 + 72);
        long long v103 = *(_OWORD *)(v101 + 96);
        *(_OWORD *)(v101 + 40) = *(_OWORD *)(v101 + 80);
        *(_OWORD *)(v101 + 56) = v103;
        *(void *)(v101 + 72) = *(void *)(v101 + 112);
        long long v104 = *(_OWORD *)(v101 + 136);
        *(_OWORD *)(v101 + 80) = *(_OWORD *)(v101 + 120);
        *(_OWORD *)(v101 + 96) = v104;
        *(void *)(v101 + 112) = *(void *)(v101 + 152);
        long long v105 = *(_OWORD *)(v101 + 176);
        *(_OWORD *)(v101 + 120) = *(_OWORD *)(v101 + 160);
        *(_OWORD *)(v101 + 136) = v105;
        *(void *)(v101 + 152) = *(void *)(v101 + 192);
        long long v106 = *(_OWORD *)(v101 + 216);
        *(_OWORD *)(v101 + 160) = *(_OWORD *)(v101 + 200);
        *(_OWORD *)(v101 + 176) = v106;
        *(void *)(v101 + 192) = *(void *)(v101 + 232);
        *(_DWORD *)(v101 + 24_Block_object_dispose(&STACK[0x488], 8) = 5;
        unint64_t v98 = v100;
      }
      ++v99;
      v101 += 1724;
    }
    while (v99 < v98);
  }
  unint64_t v107 = *(unsigned int *)v68;
  if (v107)
  {
    unint64_t v108 = 0;
    uint64_t v109 = (_DWORD *)(a6 + 135444);
    unint64_t v110 = *(unsigned int *)v68;
    do
    {
      if (*v109 >= 6u)
      {
        long long v111 = *((_OWORD *)v109 - 12);
        *(_OWORD *)(v109 - 62) = *((_OWORD *)v109 - 13);
        *(_OWORD *)(v109 - 5_Block_object_dispose(&STACK[0x488], 8) = v111;
        *((void *)v109 - 27) = *((void *)v109 - 22);
        long long v112 = v109 - 52;
        long long v113 = *(_OWORD *)(v109 - 38);
        *(_OWORD *)long long v112 = *(_OWORD *)(v109 - 42);
        *((_OWORD *)v112 + 1) = v113;
        *((void *)v112 + 4) = *((void *)v109 - 17);
        int32x4_t v114 = v109 - 42;
        long long v115 = *((_OWORD *)v109 - 7);
        *(_OWORD *)int32x4_t v114 = *((_OWORD *)v109 - 8);
        *((_OWORD *)v114 + 1) = v115;
        *((void *)v114 + 4) = *((void *)v109 - 12);
        unsigned int v116 = v109 - 32;
        long long v117 = *(_OWORD *)(v109 - 18);
        *(_OWORD *)unsigned int v116 = *(_OWORD *)(v109 - 22);
        *((_OWORD *)v116 + 1) = v117;
        *((void *)v116 + 4) = *((void *)v109 - 7);
        int v118 = v109 - 22;
        long long v119 = *((_OWORD *)v109 - 2);
        *(_OWORD *)int v118 = *((_OWORD *)v109 - 3);
        *((_OWORD *)v118 + 1) = v119;
        *((void *)v118 + 4) = *((void *)v109 - 2);
        *uint64_t v109 = 5;
        unint64_t v107 = v110;
      }
      ++v108;
      v109 += 431;
    }
    while (v108 < v107);
  }
  unsigned int v120 = *((_DWORD *)v68 + 3995);
  if (v66)
  {
    if (v120 + 1 == *(_DWORD *)(a1 + 284)) {
      unsigned int v121 = 0;
    }
    else {
      unsigned int v121 = v120 + 1;
    }
    goto LABEL_110;
  }
  if (v120)
  {
    unsigned int v121 = 0;
LABEL_110:
    *((_DWORD *)v68 + 3995) = v121;
  }
  uint64_t result = 0;
  *(_DWORD *)(a6 + 4) = 467393;
  return result;
}

int *AcAssoNode::procLearnedGroupID(uint64_t a1, _DWORD *a2)
{
  float32x4_t v4 = a2 + 25863;
  long long v5 = a2 + 12932;
  if (a2[12932])
  {
    unint64_t v6 = 0;
    float32x4_t v7 = a2 + 3;
    do
    {
      *(_DWORD *)(a1 + 102576 + 4 * v6) = *v7;
      *float32x4_t v7 = 0;
      ++v6;
      unint64_t v8 = *v5;
      v7 += 431;
    }
    while (v6 < v8);
    if (*v4) {
      goto LABEL_5;
    }
LABEL_9:
    LODWORD(v11) = 0;
    goto LABEL_10;
  }
  LODWORD(v_Block_object_dispose(&STACK[0x488], 8) = 0;
  if (!*v4) {
    goto LABEL_9;
  }
LABEL_5:
  unint64_t v9 = 0;
  float v10 = v5 + 2;
  do
  {
    *(_DWORD *)(a1 + 102936 + 4 * v9) = *v10;
    *float v10 = 0;
    ++v9;
    unint64_t v11 = *v4;
    v10 += 431;
  }
  while (v9 < v11);
  LODWORD(v_Block_object_dispose(&STACK[0x488], 8) = *v5;
LABEL_10:
  uint64_t v12 = a2 + 46596;
  int v51 = 1;
  acTrkGroupAssign((uint64_t)(a2 + 2), v8, (uint64_t)(a2 + 12933), v11, 1, 9, a1 + 256, &v51, a2 + 50498, a2 + 50588, *(void **)a1);
  if (*v5)
  {
    unint64_t v14 = 0;
    int v15 = a2 + 3;
    uint64_t v16 = a1 + 102576;
    do
    {
      int v17 = *(_DWORD *)(v16 + 4 * v14);
      *(_DWORD *)(v16 + 4 * v14) = *v15;
      _DWORD *v15 = v17;
      ++v14;
      v15 += 431;
    }
    while (v14 < *v5);
  }
  float v18 = a2 + 33667;
  LODWORD(v19) = *v4;
  if (*v4)
  {
    unint64_t v20 = 0;
    uint64_t v21 = v5 + 2;
    uint64_t v22 = a1 + 102936;
    do
    {
      int v23 = *(_DWORD *)(v22 + 4 * v20);
      *(_DWORD *)(v22 + 4 * v20) = *v21;
      *uint64_t v21 = v23;
      ++v20;
      unint64_t v19 = *v4;
      v21 += 431;
    }
    while (v20 < v19);
  }
  if (*v12)
  {
    unint64_t v24 = 0;
    uint64_t v25 = a2 + 33667;
    do
    {
      *(_DWORD *)(a1 + 102696 + 4 * v24) = *v25;
      *uint64_t v25 = 0;
      ++v24;
      unint64_t v26 = *v12;
      v25 += 431;
    }
    while (v24 < v26);
    if (*v4) {
      goto LABEL_20;
    }
LABEL_24:
    LODWORD(v29) = 0;
    goto LABEL_25;
  }
  LODWORD(v26) = 0;
  if (!v19) {
    goto LABEL_24;
  }
LABEL_20:
  unint64_t v27 = 0;
  uint64_t v28 = v5 + 2;
  do
  {
    *(_DWORD *)(a1 + 103056 + 4 * v27) = *v28;
    *uint64_t v28 = 0;
    ++v27;
    unint64_t v29 = *v4;
    v28 += 431;
  }
  while (v27 < v29);
  LODWORD(v26) = *v12;
LABEL_25:
  acTrkLGroupHandAsso((uint64_t)(a2 + 12933), v29, (uint64_t)(a2 + 33666), v26, a1 + 104016, (int *)(a1 + 105816), (int *)(a1 + 107616), v13, v48, *(void **)a1, v49, a1 + 700);
  if (*v12)
  {
    unint64_t v30 = 0;
    uint64_t v31 = a1 + 102696;
    unsigned int v32 = a2 + 33667;
    do
    {
      int v33 = *(_DWORD *)(v31 + 4 * v30);
      *(_DWORD *)(v31 + 4 * v30) = *v32;
      _DWORD *v32 = v33;
      ++v30;
      unint64_t v34 = *v12;
      v32 += 431;
    }
    while (v30 < v34);
    if (*v4) {
      goto LABEL_29;
    }
LABEL_33:
    LODWORD(v39) = 0;
    goto LABEL_34;
  }
  LODWORD(v34) = 0;
  if (!*v4) {
    goto LABEL_33;
  }
LABEL_29:
  unint64_t v35 = 0;
  unsigned int v36 = v5 + 2;
  uint64_t v37 = a1 + 103056;
  do
  {
    int v38 = *(_DWORD *)(v37 + 4 * v35);
    *(_DWORD *)(v37 + 4 * v35) = *v36;
    *unsigned int v36 = v38;
    ++v35;
    unint64_t v39 = *v4;
    v36 += 431;
  }
  while (v35 < v39);
  LODWORD(v34) = *v12;
LABEL_34:
  unsigned int v40 = (int *)(a1 + 103776);
  int v50 = 0;
  uint64_t result = AcTrkProcLearnedGroupID(a2 + 2, *v5, (uint64_t)(a2 + 33666), v34, (uint64_t)(a2 + 12933), v39, a1 + 102936, a1 + 103056, a1 + 102576, a1 + 102696, (int *)(a1 + 103416), a1 + 103776, a1 + 103896, a1 + 103296, &v50, a2 + 50590);
  uint64_t v42 = *v12;
  if (v42)
  {
    float v43 = (int *)(a1 + 103896);
    do
    {
      int v44 = *v43++;
      _DWORD *v18 = v44;
      v18 += 431;
      --v42;
    }
    while (v42);
  }
  uint64_t v45 = *v4;
  if (v45)
  {
    float v46 = v5 + 2;
    do
    {
      int v47 = *v40++;
      *float v46 = v47;
      v46 += 431;
      --v45;
    }
    while (v45);
  }
  return result;
}

void AcAssoNode::filterANSTBboxforBESCrop(float a1, float a2, float a3, float a4, uint64_t a5, uint64_t a6, unsigned int a7, unsigned int a8)
{
  if (a1 < 0.0) {
    return;
  }
  float v8 = a1 + a3;
  float v9 = a2 + a4;
  BOOL v10 = a2 >= 0.0 && v8 <= (float)(a8 + 1);
  if (!v10 || v9 > (float)(a7 + 1)) {
    return;
  }
  float v12 = *(float *)(a6 + 12);
  if (*(unsigned char *)(a6 + 860))
  {
    if (v12 >= 0.0) {
      goto LABEL_26;
    }
    float v13 = 0.7;
    if (!*(unsigned char *)(a6 + 100)) {
      float v13 = 0.5;
    }
    if (v12 >= 0.0 || (float)((float)(a1 + fabsf(v12)) / *(float *)(a6 + 20)) < v13)
    {
LABEL_26:
      int v16 = *(_DWORD *)(a6 + 864) + 1;
      *(_DWORD *)(a6 + 864) = v16;
      if (v16 != 2) {
        goto LABEL_29;
      }
      *(unsigned char *)(a6 + 860) = 0;
    }
    *(_DWORD *)(a6 + 864) = 0;
  }
  else if (v12 < 0.0 && *(float *)(a6 + 832) < 0.1)
  {
    float v15 = 0.7;
    if (!*(unsigned char *)(a6 + 100)) {
      float v15 = 0.5;
    }
    if ((float)((float)(a1 + fabsf(v12)) / *(float *)(a6 + 20)) > v15) {
      *(unsigned char *)(a6 + 860) = 1;
    }
  }
LABEL_29:
  float v17 = *(float *)(a6 + 16);
  if (*(unsigned char *)(a6 + 861))
  {
    if (v17 >= 0.0) {
      goto LABEL_45;
    }
    float v18 = 0.7;
    if (!*(unsigned char *)(a6 + 100)) {
      float v18 = 0.5;
    }
    if (v17 >= 0.0 || (float)((float)(a2 + fabsf(v17)) / *(float *)(a6 + 24)) < v18)
    {
LABEL_45:
      int v21 = *(_DWORD *)(a6 + 868) + 1;
      *(_DWORD *)(a6 + 86_Block_object_dispose(&STACK[0x488], 8) = v21;
      if (v21 != 2) {
        goto LABEL_48;
      }
      *(unsigned char *)(a6 + 861) = 0;
    }
    *(_DWORD *)(a6 + 86_Block_object_dispose(&STACK[0x488], 8) = 0;
  }
  else if (v17 < 0.0 && *(float *)(a6 + 832) < 0.1)
  {
    float v20 = 0.7;
    if (!*(unsigned char *)(a6 + 100)) {
      float v20 = 0.5;
    }
    if ((float)((float)(a2 + fabsf(v17)) / *(float *)(a6 + 24)) >= v20) {
      *(unsigned char *)(a6 + 861) = 1;
    }
  }
LABEL_48:
  if (!*(unsigned char *)(a6 + 863))
  {
    if (*(float *)(a6 + 832) < 0.1
      && a3 < (float)a8
      && (float)((float)(v12 + *(float *)(a6 + 20)) - (float)a8) > 0.0
      && v8 <= (float)(v12 + 5.0))
    {
      *(unsigned char *)(a6 + 863) = 1;
    }
    goto LABEL_60;
  }
  if (v8 <= (float)(v12 + 5.0)) {
    goto LABEL_52;
  }
  int v22 = *(_DWORD *)(a6 + 876) + 1;
  *(_DWORD *)(a6 + 876) = v22;
  if (v22 == 2)
  {
    *(unsigned char *)(a6 + 863) = 0;
LABEL_52:
    *(_DWORD *)(a6 + 876) = 0;
  }
LABEL_60:
  if (*(unsigned char *)(a6 + 862))
  {
    if (v9 > (float)(v17 + 5.0))
    {
      int v24 = *(_DWORD *)(a6 + 872) + 1;
      *(_DWORD *)(a6 + 872) = v24;
      if (v24 != 2) {
        return;
      }
      *(unsigned char *)(a6 + 862) = 0;
    }
    *(_DWORD *)(a6 + 872) = 0;
    return;
  }
  if (*(float *)(a6 + 832) < 0.1)
  {
    float v25 = (float)(v17 + *(float *)(a6 + 24)) - (float)a7;
    float v26 = v17 + 5.0;
    if (v25 > 0.0 && a4 < (float)a7 && v9 <= v26) {
      *(unsigned char *)(a6 + 862) = 1;
    }
  }
}

float AcAssoNode::clipANSTBbox(uint64_t a1, uint64_t a2)
{
  float v2 = *(float *)(a2 + 12);
  if (v2 >= 0.0) {
    return *(float *)(a2 + 12);
  }
  else {
    return 0.0;
  }
}

uint64_t AcAssoNode::config(AcAssoNode *this)
{
  return (uint64_t)this + 12;
}

uint64_t AcAssoNode::getParams(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  if (*a2 != 1 || (a2[1] | 8) != 0x721C9) {
    return 4294967289;
  }
  uint64_t result = 0;
  *(_DWORD *)(a3 + 2376) = *(_DWORD *)(a1 + 276);
  *(_DWORD *)(a3 + 2384) = *(_DWORD *)(a1 + 280);
  *(void *)(a3 + 238_Block_object_dispose(&STACK[0x488], 8) = *(void *)(a1 + 288);
  *(_DWORD *)(a3 + 2396) = *(_DWORD *)(a1 + 296);
  return result;
}

uint64_t AcAssoNode::detUseLowThresholds(uint64_t this, char a2)
{
  *(unsigned char *)(this + 1472) = a2;
  return this;
}

void sub_246D97C88(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D97D00(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D97D78(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D97DF0(void **a1, char *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_version(*a1, a2, a3);
  int v5 = 136446466;
  unint64_t v6 = "-[ANSTForegroundSegmentation_Internal prepareWithError:]";
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_246D53000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "%{public}s: Unsupported algorithm version %ld", (uint8_t *)&v5, 0x16u);
}

void sub_246D97E94(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D97F0C(void **a1, const char *a2, uint64_t a3)
{
  objc_msgSend_networkResolution(*a1, a2, a3);
  sub_246D55A6C();
  sub_246D55A38(&dword_246D53000, v3, v4, "%{public}s: Unexpected network resolution value %{public}lu", v5, v6, v7, v8, 2u);
}

void sub_246D97F94(void **a1, const char *a2, uint64_t a3)
{
  objc_msgSend_networkResolution(*a1, a2, a3);
  sub_246D55A6C();
  sub_246D55A38(&dword_246D53000, v3, v4, "%{public}s: Unexpected network resolution value %{public}lu", v5, v6, v7, v8, 2u);
}

void sub_246D9801C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D98094(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9810C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D98184(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D981FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D98274()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136446466;
  sub_246D55A58();
  _os_log_error_impl(&dword_246D53000, v0, OS_LOG_TYPE_ERROR, "%{public}s: Failed to create CVPixelBuffer (CVReturn %d). Returning nil.", (uint8_t *)v1, 0x12u);
}

void sub_246D982F4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136446466;
  sub_246D55A58();
  _os_log_error_impl(&dword_246D53000, v0, OS_LOG_TYPE_ERROR, "%{public}s: Source Espresso Buffer has unexpected storage type (%d). Returning nil.", (uint8_t *)v1, 0x12u);
}

void sub_246D98374(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D983EC(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136446466;
  uint64_t v3 = "-[ANSTBaseNetworkEspresso createEsressoTensorDimension:dtype:]";
  __int16 v4 = 1026;
  int v5 = a1;
  _os_log_error_impl(&dword_246D53000, a2, OS_LOG_TYPE_ERROR, "%{public}s: espresso_buffer_pack_tensor_shape failed with code %{public}d", (uint8_t *)&v2, 0x12u);
}

void sub_246D98478(uint64_t a1, _DWORD *a2)
{
  *a2 = 136446466;
  sub_246D5ABB4(a1, (uint64_t)a2, (uint64_t)"-[ANSTBaseNetworkEspresso buildPlan]");
  sub_246D5ABC8(&dword_246D53000, v2, v3, "%{public}s: espresso_plan_build failed (%{public}s)", v4);
}

void sub_246D984BC(uint64_t a1, _DWORD *a2)
{
  *a2 = 136446466;
  sub_246D5ABB4(a1, (uint64_t)a2, (uint64_t)"-[ANSTBaseNetworkEspresso initContext]");
  sub_246D5ABC8(&dword_246D53000, v2, v3, "%{public}s: espresso_create_context failed (%{public}s)", v4);
}

void sub_246D98500(uint64_t a1, _DWORD *a2)
{
  *a2 = 136446466;
  sub_246D5ABB4(a1, (uint64_t)a2, (uint64_t)"-[ANSTBaseNetworkEspresso initContext]");
  sub_246D5ABC8(&dword_246D53000, v2, v3, "%{public}s: espresso_context_set_low_precision_accumulation failed (%{public}s)", v4);
}

void sub_246D98544(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  os_log_t v3 = "-[ANSTBaseNetworkEspresso initContext]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_246D53000, a2, OS_LOG_TYPE_FAULT, "%s: Unexpected engine type %ld. Falling back to CPU.", (uint8_t *)&v2, 0x16u);
}

void sub_246D985D0(uint64_t a1, _DWORD *a2)
{
  *a2 = 136446466;
  sub_246D5ABB4(a1, (uint64_t)a2, (uint64_t)"-[ANSTBaseNetworkEspresso initPlan]");
  sub_246D5ABC8(&dword_246D53000, v2, v3, "%{public}s: espresso_create_plan failed (%{public}s)", v4);
}

void sub_246D98614(uint64_t a1, _DWORD *a2)
{
  *a2 = 136446466;
  sub_246D5ABB4(a1, (uint64_t)a2, (uint64_t)"-[ANSTBaseNetworkEspresso initPlan]");
  sub_246D5ABC8(&dword_246D53000, v2, v3, "%{public}s: espresso_plan_set_priority failed (%{public}s)", v4);
}

void sub_246D98658(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D986D0(uint64_t a1, _DWORD *a2)
{
  *a2 = 136446466;
  sub_246D5ABB4(a1, (uint64_t)a2, (uint64_t)"-[ANSTBaseNetworkEspresso initNetwork]");
  sub_246D5ABC8(&dword_246D53000, v2, v3, "%{public}s: espresso_network_select_configuration failed (%{public}s)", v4);
}

void sub_246D98714(char *a1, void *a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136446466;
  __int16 v4 = "-[ANSTBaseNetworkEspresso validateNetworkOutputDimension]";
  __int16 v5 = 2082;
  uint64_t v6 = a2;
  sub_246D5ABC8(&dword_246D53000, (int)a2, a3, "%{public}s: Shape mismatch in blob \"%{public}s\"", (uint8_t *)&v3);
}

void sub_246D987A4(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 136446722;
  sub_246D5ABE4(a1, a2, (uint64_t)a3);
  sub_246D5AC00(&dword_246D53000, "%{public}s: espresso_network_query_blob_dimensions failed for blob \"%{public}s\" (%{public}s)", v3, v4);
}

void sub_246D987EC(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 136446722;
  sub_246D5ABE4(a1, a2, (uint64_t)a3);
  sub_246D5AC00(&dword_246D53000, "%{public}s: Failure to bind input image to network for \"%{public}s\" (espresso error %{public}s)", v3, v4);
}

void sub_246D98834(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 136446722;
  sub_246D5ABE4(a1, a2, (uint64_t)a3);
  sub_246D5AC00(&dword_246D53000, "%{public}s: espresso_network_bind_buffer for \"%{public}s\" (espresso error %{public}s)", v3, v4);
}

void sub_246D9887C(uint64_t a1, _DWORD *a2)
{
  *a2 = 136446466;
  sub_246D5ABB4(a1, (uint64_t)a2, (uint64_t)"-[ANSTBaseNetworkEspresso bindNetworkOutput:]");
  sub_246D5ABC8(&dword_246D53000, v2, v3, "%{public}s: espresso_network_bind_buffer failed (%{public}s)", v4);
}

void sub_246D988C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D98938(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D989B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D98A28(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = 136446466;
  __int16 v4 = "-[ANSTBaseNetworkEspresso switchConfiguration:]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_246D53000, a2, OS_LOG_TYPE_ERROR, "%{public}s: Could not switch the configuration for the model: %@", (uint8_t *)&v3, 0x16u);
}

void sub_246D98AB8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 136446722;
  *(void *)&v3[4] = "-[ANSTBaseNetworkEspresso getInputLength:]";
  *(_WORD *)&v3[12] = 1026;
  *(_DWORD *)&v3[14] = a2;
  *(_WORD *)&v3[18] = 2114;
  *(void *)&v3[20] = a1;
  sub_246D5AC1C(&dword_246D53000, a2, a3, "%{public}s: getInputLength failed with status: %{public}d for name %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *(_DWORD *)&v3[24]);
}

void sub_246D98B44(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 136446722;
  *(void *)&v3[4] = "-[ANSTBaseNetworkEspresso getOutputLength:]";
  *(_WORD *)&v3[12] = 1024;
  *(_DWORD *)&v3[14] = a2;
  *(_WORD *)&v3[18] = 2112;
  *(void *)&v3[20] = a1;
  sub_246D5AC1C(&dword_246D53000, a2, a3, "%{public}s: getOutputLength failed with status: %d for name %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *(_DWORD *)&v3[24]);
}

void sub_246D98BD0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D98C48(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D98CC0(uint64_t a1, _DWORD *a2)
{
  *a2 = 136446466;
  sub_246D5ABB4(a1, (uint64_t)a2, (uint64_t)"-[ANSTBaseNetworkEspresso setInput:fromCVPixelBuffer:]");
  sub_246D5ABC8(&dword_246D53000, v2, v3, "%{public}s: espresso_buffer_pack_tensor_shape failed (%{public}s)", v4);
}

void sub_246D98D04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D98D7C(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136446466;
  os_log_t v3 = "-[ANSTBaseNetworkEspresso setInput:fromRawPointer:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_246D53000, a2, OS_LOG_TYPE_ERROR, "%{public}s: Input %{public}@ does not exist", (uint8_t *)&v2, 0x16u);
}

void sub_246D98E08(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_246D53000, log, OS_LOG_TYPE_FAULT, "AcImageOrientationFromANSTImageOrientation: Unable to convert unspecified orientation. Proceeding with kAcImageOrientation_CC0.", v1, 2u);
}

void sub_246D98E4C(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_resolution(a1, a2, a3);
  sub_246D5DFB0();
  sub_246D55A38(&dword_246D53000, v3, v4, "%s: Unexpected resolution %ld. Returning nil.", v5, v6, v7, v8, 2u);
}

void sub_246D98ED0(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_resolution(a1, a2, a3);
  sub_246D5DFB0();
  sub_246D55A38(&dword_246D53000, v3, v4, "%s: Unexpected resolution %ld. Returning nil.", v5, v6, v7, v8, 2u);
}

void sub_246D98F54(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_resolution(a1, a2, a3);
  sub_246D5DFB0();
  sub_246D55A38(&dword_246D53000, v3, v4, "%s: Unexpected resolution %ld. Returning nil.", v5, v6, v7, v8, 2u);
}

void sub_246D98FD8(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_resolution(a1, a2, a3);
  sub_246D5DFB0();
  sub_246D55A38(&dword_246D53000, v3, v4, "%s: Unexpected resolution %ld. Returning nil.", v5, v6, v7, v8, 2u);
}

void sub_246D9905C(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_resolution(a1, a2, a3);
  sub_246D5DFB0();
  sub_246D55A38(&dword_246D53000, v3, v4, "%s: Unexpected resolution %ld. Returning nil.", v5, v6, v7, v8, 2u);
}

void sub_246D990E0(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_resolution(a1, a2, a3);
  sub_246D5DFB0();
  sub_246D55A38(&dword_246D53000, v3, v4, "%s: Unexpected resolution %ld. Returning nil.", v5, v6, v7, v8, 2u);
}

void sub_246D99164(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_resolution(a1, a2, a3);
  sub_246D5DFB0();
  sub_246D55A38(&dword_246D53000, v3, v4, "%s: Unexpected resolution %ld. Returning nil.", v5, v6, v7, v8, 2u);
}

void sub_246D991E8()
{
  sub_246D5F864();
  sub_246D5F848();
  sub_246D5F878(&dword_246D53000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
}

void sub_246D99264()
{
  sub_246D5F864();
  sub_246D5F848();
  sub_246D5F878(&dword_246D53000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
}

void sub_246D992E0()
{
  sub_246D5F864();
  sub_246D5F848();
  sub_246D5F878(&dword_246D53000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
}

void sub_246D9935C()
{
  sub_246D5F864();
  sub_246D5F848();
  sub_246D5F878(&dword_246D53000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
}

void sub_246D993D8()
{
  sub_246D5F864();
  sub_246D5F848();
  sub_246D5F878(&dword_246D53000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
}

void sub_246D99454(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136446466;
  uint64_t v3 = "-[ANSTVideoFoundationModel prepareWithError:]";
  __int16 v4 = 2082;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_246D53000, a2, OS_LOG_TYPE_ERROR, "%{public}s: MIL compilation failed due to E5 error (%{public}s)", (uint8_t *)&v2, 0x16u);
}

void sub_246D994E0()
{
  sub_246D5F864();
  sub_246D5F848();
  sub_246D5F878(&dword_246D53000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
}

void sub_246D9955C()
{
  sub_246D5F864();
  sub_246D5F848();
  sub_246D5F878(&dword_246D53000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
}

void sub_246D995D8()
{
  sub_246D5F864();
  sub_246D5F848();
  sub_246D5F878(&dword_246D53000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
}

void sub_246D99654()
{
  sub_246D5F864();
  sub_246D5F848();
  sub_246D5F878(&dword_246D53000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
}

void sub_246D996D0()
{
  sub_246D5F864();
  sub_246D5F848();
  sub_246D5F878(&dword_246D53000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
}

void sub_246D9974C()
{
  sub_246D5F864();
  sub_246D5F848();
  sub_246D5F878(&dword_246D53000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
}

void sub_246D997C8(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_246D53000, a2, OS_LOG_TYPE_DEBUG, "Deallocating ANSTVideoFoundationModel[%p]", (uint8_t *)&v2, 0xCu);
}

void sub_246D99840()
{
  sub_246D5F864();
  sub_246D5F848();
  sub_246D5F878(&dword_246D53000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
}

void sub_246D998BC()
{
  sub_246D5F864();
  sub_246D5F848();
  sub_246D5F878(&dword_246D53000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
}

void sub_246D99938()
{
  sub_246D5F864();
  sub_246D5F848();
  sub_246D5F878(&dword_246D53000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
}

void sub_246D999B4()
{
  sub_246D5F864();
  sub_246D5F848();
  sub_246D5F878(&dword_246D53000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
}

void sub_246D99A30()
{
  sub_246D5F864();
  sub_246D5F848();
  sub_246D5F878(&dword_246D53000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
}

void sub_246D99AAC()
{
  sub_246D5F864();
  sub_246D5F848();
  sub_246D5F878(&dword_246D53000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
}

void sub_246D99B28()
{
  sub_246D5F864();
  sub_246D5F848();
  sub_246D5F878(&dword_246D53000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
}

void sub_246D99BA4()
{
  sub_246D5F864();
  sub_246D5F848();
  sub_246D5F878(&dword_246D53000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
}

void sub_246D99C20(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136446466;
  uint64_t v3 = "NSString * _Nonnull ANSTVideoMaskRefineAlgorithmVersionToNSString(ANSTVideoMaskRefineAlgorithmVersion)";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_246D53000, a2, OS_LOG_TYPE_FAULT, "%{public}s: Unexpected value %lu", (uint8_t *)&v2, 0x16u);
}

void sub_246D99CAC(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136446466;
  uint64_t v3 = "NSString * _Nonnull qualityOfServiceString(qos_class_t)";
  __int16 v4 = 1026;
  int v5 = a1;
  _os_log_fault_impl(&dword_246D53000, a2, OS_LOG_TYPE_FAULT, "%{public}s: Unexpected enum value %{public}d", (uint8_t *)&v2, 0x12u);
}

void sub_246D99D38(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "+[ANSTViSegHQInferenceConfiguration availableInferenceResolutionForVersion:]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_246D53000, a2, OS_LOG_TYPE_FAULT, "%s: Unexpected veresion %ld. Returning empty array.", (uint8_t *)&v2, 0x16u);
}

void sub_246D99DC4(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  int v2 = "-[ANSTViSegHQInferenceConfiguration initWithVersion:resolution:]";
  _os_log_error_impl(&dword_246D53000, log, OS_LOG_TYPE_ERROR, "%{public}s: The given model version does not support the given resolution. Please check against +[ANSTViSegHQInferenceConfiguration availableInferenceResolutionForVersion:].", (uint8_t *)&v1, 0xCu);
}

void sub_246D99E48(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_246D53000, a2, OS_LOG_TYPE_ERROR, "Failed to create pixel buffer (CVReturn %d)", (uint8_t *)v2, 8u);
}

void sub_246D99EC0(void **a1, const char *a2, uint64_t a3)
{
  objc_msgSend_version(*a1, a2, a3);
  objc_msgSend_networkResolution(*a1, v4, v5);
  sub_246D6918C();
  sub_246D691A8(&dword_246D53000, v6, v7, "%{public}s: Unexpected version %{public}ld resolution %{public}ld. Returning nil.", v8, v9, v10, v11, 2u);
}

void sub_246D99F60(void **a1, const char *a2, uint64_t a3)
{
  objc_msgSend_version(*a1, a2, a3);
  objc_msgSend_networkResolution(*a1, v4, v5);
  sub_246D6918C();
  sub_246D691A8(&dword_246D53000, v6, v7, "%{public}s: Unexpected version %{public}ld resolution %{public}ld. Returning nil.", v8, v9, v10, v11, 2u);
}

void sub_246D9A000(void **a1, const char *a2, uint64_t a3)
{
  objc_msgSend_version(*a1, a2, a3);
  objc_msgSend_networkResolution(*a1, v4, v5);
  sub_246D6918C();
  sub_246D691A8(&dword_246D53000, v6, v7, "%{public}s: Unexpected version %{public}ld resolution %{public}ld. Returning nil.", v8, v9, v10, v11, 2u);
}

void sub_246D9A0A0()
{
  sub_246D6E7E0();
  sub_246D6E7F4(&dword_246D53000, v0, v1, "%{public}s: AcANSTDestroy failed (code %{public}d)", v2, v3, v4, v5, 2u);
}

void sub_246D9A114()
{
  sub_246D6E7E0();
  sub_246D6E7F4(&dword_246D53000, v0, v1, "%{public}s: AcANSTStop failed (code %{public}d)", v2, v3, v4, v5, 2u);
}

void sub_246D9A188(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9A200(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9A278(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9A2F0()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136446722;
  sub_246D6E7E0();
  __int16 v4 = v0;
  int v5 = v1;
  _os_log_error_impl(&dword_246D53000, v2, OS_LOG_TYPE_ERROR, "%{public}s: Unexpected network input width %{public}u height %{public}u from Espresso.", (uint8_t *)v3, 0x18u);
}

void sub_246D9A37C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9A3F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9A46C()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446466;
  os_log_t v2 = "-[ANSTISPAlgorithmV1 prepareWithError:]";
  sub_246D6E810();
  _os_log_error_impl(&dword_246D53000, v0, OS_LOG_TYPE_ERROR, "%{public}s: %{public}@", (uint8_t *)&v1, 0x16u);
}

void sub_246D9A4F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9A56C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9A5E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9A65C()
{
  sub_246D6E7E0();
  sub_246D6E7F4(&dword_246D53000, v0, v1, "%{public}s: Failed to create AcResult (AcReturn %{public}d). Returning nil.", v2, v3, v4, v5, 2u);
}

void sub_246D9A6D0()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  uint64_t v2 = "uint8_t expectedPipelineRunningOn(ANSTISPAlgorithmRunningFrameRate)";
  sub_246D6E810();
  _os_log_fault_impl(&dword_246D53000, v0, OS_LOG_TYPE_FAULT, "%s: Unexpected runningFrameRate %ld. Falling back to standard FPS.", (uint8_t *)&v1, 0x16u);
}

void sub_246D9A758(void **a1, const char *a2, uint64_t a3)
{
  objc_msgSend_networkResolution(*a1, a2, a3);
  sub_246D6E810();
  sub_246D55A38(&dword_246D53000, v3, v4, "%{public}s: Unexpected network resolution value %{public}lu", v5, v6, v7, v8, 2u);
}

void sub_246D9A7E8(void **a1, const char *a2, uint64_t a3)
{
  objc_msgSend_networkResolution(*a1, a2, a3);
  sub_246D6E810();
  sub_246D55A38(&dword_246D53000, v3, v4, "%{public}s: Unexpected network resolution value %{public}lu", v5, v6, v7, v8, 2u);
}

void sub_246D9A878(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9A8F0()
{
  sub_246D6E7E0();
  sub_246D6E7F4(&dword_246D53000, v0, v1, "%{public}s: Failed to create CVPixelBuffer (CVReturn %{public}d). Returning nil.", v2, v3, v4, v5, 2u);
}

void sub_246D9A964()
{
  sub_246D6E7E0();
  sub_246D6E7F4(&dword_246D53000, v0, v1, "%{public}s: Source Espresso Buffer has unexpected storage type (%{public}d). Returning nil.", v2, v3, v4, v5, 2u);
}

void sub_246D9A9D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9AA50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9AAC8()
{
  sub_246D6E7E0();
  sub_246D6E7F4(&dword_246D53000, v0, v1, "%{public}s: Failed to create CVPixelBuffer (CVReturn %{public}d). Returning nil.", v2, v3, v4, v5, 2u);
}

void sub_246D9AB3C(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_246D53000, a2, OS_LOG_TYPE_ERROR, "Failed to create pixel buffer pool (CVReturn %d)", (uint8_t *)v2, 8u);
}

void sub_246D9ABB4()
{
  sub_246D5DFB0();
  sub_246D6FF18(&dword_246D53000, v0, v1, "%{public}s: Unexpected value %lu", v2, v3, v4, v5, 2u);
}

void sub_246D9AC28()
{
  sub_246D5DFB0();
  sub_246D6FF18(&dword_246D53000, v0, v1, "%{public}s: Unexpected value %lu", v2, v3, v4, v5, 2u);
}

void sub_246D9AC9C()
{
  sub_246D5DFB0();
  sub_246D6FF18(&dword_246D53000, v0, v1, "%{public}s: Unexpected value %lu", v2, v3, v4, v5, 2u);
}

void sub_246D9AD10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9AD88(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9AE00(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9AE78(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9AEF0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9AF68(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9AFE0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9B058(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9B0D0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9B148(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9B1C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9B238(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9B2B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9B328(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9B3A0()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136446466;
  sub_246D55A58();
  _os_log_error_impl(&dword_246D53000, v0, OS_LOG_TYPE_ERROR, "%{public}s: Failed to create CVPixelBuffer (CVReturn %d). Returning nil.", (uint8_t *)v1, 0x12u);
}

void sub_246D9B420()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136446466;
  sub_246D55A58();
  _os_log_error_impl(&dword_246D53000, v0, OS_LOG_TYPE_ERROR, "%{public}s: Source Espresso Buffer has unexpected storage type (%d). Returning nil.", (uint8_t *)v1, 0x12u);
}

void sub_246D9B4A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9B518(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9B590()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136446466;
  sub_246D5DFB0();
  _os_log_fault_impl(&dword_246D53000, v0, OS_LOG_TYPE_FAULT, "%{public}s: Unexpected value %lu", (uint8_t *)v1, 0x16u);
}

void sub_246D9B610()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136446466;
  sub_246D5DFB0();
  _os_log_fault_impl(&dword_246D53000, v0, OS_LOG_TYPE_FAULT, "%{public}s: Unexpected value %lu", (uint8_t *)v1, 0x16u);
}

void sub_246D9B690(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9B708(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136446466;
  uint64_t v3 = "-[ANSTActionClassifier initWithConfig:error:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_246D53000, a2, OS_LOG_TYPE_ERROR, "%{public}s: %@. Returning nil.", (uint8_t *)&v2, 0x16u);
}

void sub_246D9B794(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9B80C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246D9B884()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136446466;
  sub_246D75134();
  _os_log_error_impl(&dword_246D53000, v0, OS_LOG_TYPE_ERROR, "%{public}s: Unexpected object category %{public}@. Returning nil.", (uint8_t *)v1, 0x16u);
}

void sub_246D9B904()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136446466;
  sub_246D75134();
  _os_log_error_impl(&dword_246D53000, v0, OS_LOG_TYPE_ERROR, "%{public}s: Unexpected semantic category %{public}@. Returning nil.", (uint8_t *)v1, 0x16u);
}

void sub_246D9B984()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136446466;
  sub_246D5DFB0();
  _os_log_fault_impl(&dword_246D53000, v0, OS_LOG_TYPE_FAULT, "%{public}s: Unexpected value %lu", (uint8_t *)v1, 0x16u);
}

void sub_246D9BA04()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136446466;
  sub_246D5DFB0();
  _os_log_fault_impl(&dword_246D53000, v0, OS_LOG_TYPE_FAULT, "%{public}s: Unexpected value %lu", (uint8_t *)v1, 0x16u);
}

void sub_246D9BA84(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136446466;
  uint64_t v3 = "NSString * _Nonnull ANSTVideoFeatureExtractorVersionToNSString(ANSTVideoFeatureExtractorVersion)";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_246D53000, a2, OS_LOG_TYPE_FAULT, "%{public}s: Unexpected value %lu", (uint8_t *)&v2, 0x16u);
}

void sub_246D9BB10(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  int v2 = "-[ANSTVideoFeatureExtractor initWithConfiguration:]";
  _os_log_error_impl(&dword_246D53000, log, OS_LOG_TYPE_ERROR, "%{public}s: This init is deprecated as it is unsafe. Please use the failable initializer [initWithConfig:error:] instead ASAP.", (uint8_t *)&v1, 0xCu);
}

void sub_246D9BB94(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136446466;
  uint64_t v3 = "-[ANSTVideoFeatureExtractor initWithConfig:error:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_246D53000, a2, OS_LOG_TYPE_ERROR, "%{public}s: %@. Returning nil.", (uint8_t *)&v2, 0x16u);
}

void sub_246D9BC20(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  int v2 = "-[ANSTVideoFeatureExtractor executeInferenceWithError:]";
  _os_log_error_impl(&dword_246D53000, log, OS_LOG_TYPE_ERROR, "%{public}s: Preprocessing failed. Returning nil.", (uint8_t *)&v1, 0xCu);
}

void sub_246D9BCA4(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136446466;
  uint64_t v3 = "NSString * _Nonnull ANSTVideoFoundationModelVersionToNSString(ANSTVideoFoundationModelVersion)";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_246D53000, a2, OS_LOG_TYPE_FAULT, "%{public}s: Unexpected value %lu", (uint8_t *)&v2, 0x16u);
}

void CFRelease(CFTypeRef cf)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CVBufferRef CVBufferRetain(CVBufferRef buffer)
{
  return (CVBufferRef)MEMORY[0x270EEA008](buffer);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x270EEA278](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA288](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x270EF4C58](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E18](buffer, *(void *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E88](buffer, *(void *)&options, seed);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x270F067E0](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067F0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x270F06820](session, propertyKey, propertyValue);
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

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x270F98C18]();
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cblas_saxpy_NEWLAPACK()
{
  return MEMORY[0x270EDE408]();
}

uint64_t cblas_sgemv_NEWLAPACK()
{
  return MEMORY[0x270EDE458]();
}

uint64_t cblas_snrm2_NEWLAPACK()
{
  return MEMORY[0x270EDE480]();
}

uint64_t cblas_sscal_NEWLAPACK()
{
  return MEMORY[0x270EDE490]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t e5rt_buffer_object_get_iosurface()
{
  return MEMORY[0x270F27B08]();
}

uint64_t e5rt_buffer_object_release()
{
  return MEMORY[0x270F27B20]();
}

uint64_t e5rt_e5_compiler_compile()
{
  return MEMORY[0x270F27B30]();
}

uint64_t e5rt_e5_compiler_create()
{
  return MEMORY[0x270F27B48]();
}

uint64_t e5rt_e5_compiler_options_create()
{
  return MEMORY[0x270F27B60]();
}

uint64_t e5rt_e5_compiler_options_release()
{
  return MEMORY[0x270F27B68]();
}

uint64_t e5rt_e5_compiler_release()
{
  return MEMORY[0x270F27B80]();
}

uint64_t e5rt_execution_stream_create()
{
  return MEMORY[0x270F27B90]();
}

uint64_t e5rt_execution_stream_encode_operation()
{
  return MEMORY[0x270F27BA0]();
}

uint64_t e5rt_execution_stream_execute_sync()
{
  return MEMORY[0x270F27BB0]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation_with_options()
{
  return MEMORY[0x270F27BD0]();
}

uint64_t e5rt_execution_stream_operation_release()
{
  return MEMORY[0x270F27C28]();
}

uint64_t e5rt_execution_stream_operation_retain_input_port()
{
  return MEMORY[0x270F27C30]();
}

uint64_t e5rt_execution_stream_operation_retain_output_port()
{
  return MEMORY[0x270F27C40]();
}

uint64_t e5rt_execution_stream_release()
{
  return MEMORY[0x270F27C68]();
}

uint64_t e5rt_execution_stream_reset()
{
  return MEMORY[0x270F27C70]();
}

uint64_t e5rt_get_last_error_message()
{
  return MEMORY[0x270F27C88]();
}

uint64_t e5rt_io_port_bind_buffer_object()
{
  return MEMORY[0x270F27C98]();
}

uint64_t e5rt_io_port_bind_surface_object()
{
  return MEMORY[0x270F27CB0]();
}

uint64_t e5rt_io_port_release()
{
  return MEMORY[0x270F27CD8]();
}

uint64_t e5rt_io_port_retain_tensor_desc()
{
  return MEMORY[0x270F27CF0]();
}

uint64_t e5rt_precompiled_compute_op_create_options_create_with_program_function()
{
  return MEMORY[0x270F27D00]();
}

uint64_t e5rt_precompiled_compute_op_create_options_release()
{
  return MEMORY[0x270F27D08]();
}

uint64_t e5rt_program_function_release()
{
  return MEMORY[0x270F27D18]();
}

uint64_t e5rt_program_library_release()
{
  return MEMORY[0x270F27D60]();
}

uint64_t e5rt_program_library_retain_program_function()
{
  return MEMORY[0x270F27D70]();
}

uint64_t e5rt_surface_object_create_from_iosurface()
{
  return MEMORY[0x270F27DD8]();
}

uint64_t e5rt_surface_object_release()
{
  return MEMORY[0x270F27DE8]();
}

uint64_t e5rt_tensor_desc_alloc_buffer_object()
{
  return MEMORY[0x270F27DF8]();
}

uint64_t e5rt_tensor_desc_release()
{
  return MEMORY[0x270F27E78]();
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x270F27EC8]();
}

uint64_t espresso_buffer_unpack_tensor_shape()
{
  return MEMORY[0x270F27ED8]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x270F27EE0]();
}

uint64_t espresso_context_set_low_precision_accumulation()
{
  return MEMORY[0x270F27EF8]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x270F27F08]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x270F27F20]();
}

uint64_t espresso_get_last_error()
{
  return MEMORY[0x270F27F58]();
}

uint64_t espresso_get_output_blob_name()
{
  return MEMORY[0x270F27F60]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x270F27F78]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x270F27F98]();
}

uint64_t espresso_network_get_version()
{
  return MEMORY[0x270F28020]();
}

uint64_t espresso_network_query_blob_dimensions()
{
  return MEMORY[0x270F28030]();
}

uint64_t espresso_network_select_configuration()
{
  return MEMORY[0x270F28048]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x270F28068]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x270F28070]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x270F28080]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x270F28090]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x270F280A0]();
}

uint64_t espresso_plan_set_priority()
{
  return MEMORY[0x270F280B8]();
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

vImage_Error vImageAffineWarp_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, const vImage_AffineTransform *transform, const Pixel_8888 backColor, vImage_Flags flags)
{
  return MEMORY[0x270EDEEE8](src, dest, tempBuffer, transform, backColor, *(void *)&flags);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF328](src, dest, tempBuffer, *(void *)&flags);
}