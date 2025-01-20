unsigned char *__os_log_helper_16_0_0(unsigned char *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

uint64_t __os_log_helper_16_2_1_8_64(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_0_1_4_0(uint64_t result, int a2)
{
  *(unsigned char *)result = 0;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_2_6_8_64_4_0_4_0_8_64_8_64_4_0(uint64_t result, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, int a7)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 6;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 0;
  *(unsigned char *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  *(unsigned char *)(result + 24) = 64;
  *(unsigned char *)(result + 25) = 8;
  *(void *)(result + 26) = a5;
  *(unsigned char *)(result + 34) = 64;
  *(unsigned char *)(result + 35) = 8;
  *(void *)(result + 36) = a6;
  *(unsigned char *)(result + 44) = 0;
  *(unsigned char *)(result + 45) = 4;
  *(_DWORD *)(result + 46) = a7;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_64_4_0_4_0(uint64_t result, uint64_t a2, int a3, int a4)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 0;
  *(unsigned char *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_5_8_64_8_64_8_0_8_0_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 5;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 0;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 64;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

void sub_20ABF7B5C()
{
  _Unwind_Resume(v0);
}

id getGDViewServiceClass()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getGDViewServiceClass_softClass;
  uint64_t v13 = getGDViewServiceClass_softClass;
  if (!getGDViewServiceClass_softClass)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getGDViewServiceClass_block_invoke;
    v6 = &unk_263FE1B28;
    v7 = &v9;
    __getGDViewServiceClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);

  return v1;
}

id getGDRemoteViewAccessRequesterClass()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getGDRemoteViewAccessRequesterClass_softClass;
  uint64_t v13 = getGDRemoteViewAccessRequesterClass_softClass;
  if (!getGDRemoteViewAccessRequesterClass_softClass)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getGDRemoteViewAccessRequesterClass_block_invoke;
    v6 = &unk_263FE1B28;
    v7 = &v9;
    __getGDRemoteViewAccessRequesterClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);

  return v1;
}

uint64_t __getGDViewServiceClass_block_invoke(uint64_t a1)
{
  IntelligencePlatformLibrary();
  Class Class = objc_getClass("GDViewService");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getGDViewServiceClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t IntelligencePlatformLibrary()
{
  uint64_t v1 = IntelligencePlatformLibraryCore();
  if (!v1) {
    abort_report_np();
  }
  return v1;
}

uint64_t IntelligencePlatformLibraryCore()
{
  if (!IntelligencePlatformLibraryCore_frameworkLibrary) {
    __IntelligencePlatformLibraryCore_block_invoke();
  }
  return IntelligencePlatformLibraryCore_frameworkLibrary;
}

uint64_t __IntelligencePlatformLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IntelligencePlatformLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __getGDRemoteViewAccessRequesterClass_block_invoke(uint64_t a1)
{
  IntelligencePlatformLibrary();
  Class Class = objc_getClass("GDRemoteViewAccessRequester");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getGDRemoteViewAccessRequesterClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  int v3 = (id *)(a1 + 40);
  *int v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_20AC0386C()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_1_8_32(uint64_t result, uint64_t a2)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_0_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_0_1_8_0(uint64_t result, uint64_t a2)
{
  *(unsigned char *)uint64_t result = 0;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_20AC0DED0()
{
  _Unwind_Resume(v0);
}

void sub_20AC0E218()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_0_2_4_0_4_0(uint64_t result, int a2, int a3)
{
  *(unsigned char *)uint64_t result = 0;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(unsigned char *)(result + 8) = 0;
  *(unsigned char *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  return result;
}

void sub_20AC0FDBC()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_2_8_64_8_32(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 32;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_20AC12A80()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_2_4_0_8_64(uint64_t result, int a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(unsigned char *)(result + 8) = 64;
  *(unsigned char *)(result + 9) = 8;
  *(void *)(result + 10) = a3;
  return result;
}

uint64_t __os_log_helper_16_0_2_8_0_8_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 0;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_20AC141C0()
{
  _Unwind_Resume(v0);
}

void sub_20AC14B74()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_4_8_64_4_0_4_0_4_0(uint64_t result, uint64_t a2, int a3, int a4, int a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 0;
  *(unsigned char *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  *(unsigned char *)(result + 24) = 0;
  *(unsigned char *)(result + 25) = 4;
  *(_DWORD *)(result + 26) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_64_4_0_4_0_8_64(uint64_t result, uint64_t a2, int a3, int a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 0;
  *(unsigned char *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  *(unsigned char *)(result + 24) = 64;
  *(unsigned char *)(result + 25) = 8;
  *(void *)(result + 26) = a5;
  return result;
}

uint64_t __os_log_helper_16_0_3_4_0_4_0_4_0(uint64_t result, int a2, int a3, int a4)
{
  *(unsigned char *)uint64_t result = 0;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(unsigned char *)(result + 8) = 0;
  *(unsigned char *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  *(unsigned char *)(result + 14) = 0;
  *(unsigned char *)(result + 15) = 4;
  *(_DWORD *)(result + 16) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_3_4_0_4_0_8_64(uint64_t result, int a2, int a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(unsigned char *)(result + 8) = 0;
  *(unsigned char *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  *(unsigned char *)(result + 14) = 64;
  *(unsigned char *)(result + 15) = 8;
  *(void *)(result + 16) = a4;
  return result;
}

void sub_20AC15C10()
{
  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  int v3 = (id *)(a1 + 40);
  *int v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_20AC17284()
{
  _Unwind_Resume(v0);
}

void sub_20AC18080()
{
  _Unwind_Resume(v0);
}

void sub_20AC1A64C()
{
  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  int v3 = (id *)(a1 + 40);
  *int v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_20AC1E864()
{
  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  int v3 = (id *)(a1 + 40);
  *int v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_20AC20774()
{
  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
  location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  int v3 = (id *)(a1 + 40);
  *int v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_20AC210FC()
{
  _Unwind_Resume(v0);
}

void sub_20AC22E24()
{
  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  int v3 = (id *)(a1 + 40);
  *int v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

uint64_t __os_log_helper_16_0_2_4_0_8_0(uint64_t result, int a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 0;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(unsigned char *)(result + 8) = 0;
  *(unsigned char *)(result + 9) = 8;
  *(void *)(result + 10) = a3;
  return result;
}

uint64_t __os_log_helper_16_0_3_4_0_4_0_8_0(uint64_t result, int a2, int a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 0;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(unsigned char *)(result + 8) = 0;
  *(unsigned char *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  *(unsigned char *)(result + 14) = 0;
  *(unsigned char *)(result + 15) = 8;
  *(void *)(result + 16) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_64_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 64;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_64_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

void sub_20AC32DCC()
{
  _Unwind_Resume(v0);
}

void sub_20AC335C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,int a23,_Unwind_Exception *exception_object)
{
  _Block_object_dispose((const void *)(v24 - 128), 8);
  _Block_object_dispose((const void *)(v24 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_20AC33BE8()
{
  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  int v3 = (id *)(a1 + 40);
  *int v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_20AC487A0()
{
  _Unwind_Resume(v0);
}

void sub_20AC4B364()
{
  _Unwind_Resume(v0);
}

uint64_t GetDeviceSpace(void *a1, void *a2, _DWORD *a3)
{
  uint64_t v8 = a1;
  v7 = a2;
  v6 = a3;
  memset(v4, 0, 20);
  v5[2] = 0;
  v5[0] = 5;
  v5[1] = 2147483668;
  uint64_t result = getattrlist("/", v5, v4, 0x14uLL, 0);
  _DWORD *v6 = result;
  if (!*v6)
  {
    *uint64_t v8 = *(void *)((char *)v4 + 4);
    void *v7 = *(void *)((char *)&v4[1] + 4);
  }
  return result;
}

void __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
  location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  int v3 = (id *)(a1 + 40);
  *int v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_20AC51340()
{
  _Unwind_Resume(v0);
}

void sub_20AC53600()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_2_8_64_8_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_20AC584DC(uint64_t a1, int a2)
{
  *(void *)(v2 - 168) = a1;
  *(_DWORD *)(v2 - 172) = a2;
  objc_end_catch();
  JUMPOUT(0x20AC58564);
}

void sub_20AC5857C()
{
  _Unwind_Resume(v0);
}

void sub_20AC6600C()
{
  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__7(uint64_t a1, uint64_t a2)
{
  location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  int v3 = (id *)(a1 + 40);
  *int v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_20AC786FC()
{
  _Unwind_Resume(v0);
}

id getGDViewServiceClass_0()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getGDViewServiceClass_softClass_0;
  uint64_t v13 = getGDViewServiceClass_softClass_0;
  if (!getGDViewServiceClass_softClass_0)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getGDViewServiceClass_block_invoke_0;
    v6 = &unk_263FE1B28;
    v7 = &v9;
    __getGDViewServiceClass_block_invoke_0((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);

  return v1;
}

uint64_t __getGDViewServiceClass_block_invoke_0(uint64_t a1)
{
  IntelligencePlatformLibrary_0();
  Class Class = objc_getClass("GDViewService");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getGDViewServiceClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t IntelligencePlatformLibrary_0()
{
  uint64_t v1 = IntelligencePlatformLibraryCore_0();
  if (!v1) {
    abort_report_np();
  }
  return v1;
}

uint64_t IntelligencePlatformLibraryCore_0()
{
  if (!IntelligencePlatformLibraryCore_frameworkLibrary_0) {
    __IntelligencePlatformLibraryCore_block_invoke_0();
  }
  return IntelligencePlatformLibraryCore_frameworkLibrary_0;
}

uint64_t __IntelligencePlatformLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  IntelligencePlatformLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_20AC79364()
{
  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__8(uint64_t a1, uint64_t a2)
{
  location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  int v3 = (id *)(a1 + 40);
  *int v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_20AC7BC94()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_3_8_64_8_0_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_0_2_8_0_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(unsigned char *)uint64_t result = 0;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

void __Block_byref_object_copy__9(uint64_t a1, uint64_t a2)
{
  location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  int v3 = (id *)(a1 + 40);
  *int v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_copy__10(uint64_t a1, uint64_t a2)
{
  location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  int v3 = (id *)(a1 + 40);
  *int v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void sub_20AC83E50()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_4_8_64_8_64_4_0_8_64(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(unsigned char *)(result + 28) = 64;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  return result;
}

void sub_20AC89E44()
{
  _Unwind_Resume(v0);
}

void sub_20AC8CCFC()
{
  _Unwind_Resume(v0);
}

void SparseConvertFromCoordinate(uint64_t a1@<X4>, int *a2@<X5>, int *a3@<X6>, float *a4@<X7>, int a5@<W0>, int a6@<W1>, uint64_t a7@<X2>, uint8_t a8@<W3>, uint64_t a9@<X8>)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v38 = a1;
  int v39 = a1;
  int m = a5;
  int n = a6;
  uint64_t nBlock = a7;
  uint8_t blockSize = a8;
  row = a2;
  col = a3;
  val = a4;
  memcpy(__dst, &unk_26BEAB8D0, sizeof(__dst));
  if (m >= 0)
  {
    if (n >= 0)
    {
      if (nBlock >= 0)
      {
        if ((((unsigned __int16)v39 >> 2) & 3) == 0 || m == n)
        {
          storage = (char *)malloc_type_malloc(8 * (n + 1) + 28 + 4 * nBlock + 4 * nBlock * blockSize * blockSize, 0xA2E37A59uLL);
          if (storage)
          {
            workspace = malloc_type_malloc(4 * m, 0x100004052888210uLL);
            if (workspace)
            {
              memset((void *)a9, 0, 0x28uLL);
              SparseAttributes_t v9 = (SparseAttributes_t)v39;
              _SparseConvertFromCoordinate_Float((SparseMatrix_Float *)a9, m, n, nBlock, blockSize, v9, row, col, val, storage, (int *)workspace);
              *(void *)(a9 + 8) = storage;
              free(workspace);
              *(_WORD *)(a9 + 24) = *(_WORD *)(a9 + 24) & 0x7FFF | 0x8000;
            }
            else
            {
              free(storage);
              if (__dst[5])
              {
                memset(v41, 0, sizeof(v41));
                __snprintf_chk(v41, 0x100uLL, 0, 0x100uLL, "Failed to allocate workspace of size %ld.\n", 4 * m);
                ((void (*)(char *))__dst[5])(v41);
              }
              else
              {
                os_log_t v15 = (os_log_t)&_os_log_internal;
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                {
                  __os_log_helper_16_0_1_8_0((uint64_t)v40, 4 * m);
                  _os_log_error_impl(&dword_20ABD4000, v15, OS_LOG_TYPE_ERROR, "Failed to allocate workspace of size %ld.\n", v40, 0xCu);
                }
                objc_storeStrong((id *)&v15, 0);
                _SparseTrap();
              }
              memcpy((void *)a9, &_SparseNullMatrix_Float, 0x28uLL);
            }
          }
          else
          {
            if (__dst[5])
            {
              memset(v42, 0, sizeof(v42));
              __snprintf_chk(v42, 0x100uLL, 0, 0x100uLL, "Failed to allocate storage for result.\n");
              ((void (*)(char *))__dst[5])(v42);
            }
            else
            {
              os_log_t v19 = (os_log_t)&_os_log_internal;
              os_log_type_t v18 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                v10 = v19;
                os_log_type_t v11 = v18;
                __os_log_helper_16_0_0(v17);
                _os_log_error_impl(&dword_20ABD4000, v10, v11, "Failed to allocate storage for result.\n", v17, 2u);
              }
              objc_storeStrong((id *)&v19, 0);
              _SparseTrap();
            }
            memcpy((void *)a9, &_SparseNullMatrix_Float, 0x28uLL);
          }
        }
        else
        {
          if (__dst[5])
          {
            memset(v43, 0, sizeof(v43));
            __snprintf_chk(v43, 0x100uLL, 0, 0x100uLL, "attributes.kind must be SparseOrdinary if matrix is not square.\n");
            ((void (*)(char *))__dst[5])(v43);
          }
          else
          {
            os_log_t v23 = (os_log_t)&_os_log_internal;
            os_log_type_t v22 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              int v12 = v23;
              os_log_type_t v13 = v22;
              __os_log_helper_16_0_0(v21);
              _os_log_error_impl(&dword_20ABD4000, v12, v13, "attributes.kind must be SparseOrdinary if matrix is not square.\n", v21, 2u);
            }
            objc_storeStrong((id *)&v23, 0);
            _SparseTrap();
          }
          memcpy((void *)a9, &_SparseNullMatrix_Float, 0x28uLL);
        }
      }
      else
      {
        if (__dst[5])
        {
          memset(v45, 0, sizeof(v45));
          __snprintf_chk(v45, 0x100uLL, 0, 0x100uLL, "blockCount (%ld) must be non-negative.\n", nBlock);
          ((void (*)(char *))__dst[5])(v45);
        }
        else
        {
          os_log_t v25 = (os_log_t)&_os_log_internal;
          os_log_type_t v24 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_0_1_8_0((uint64_t)v44, nBlock);
            _os_log_error_impl(&dword_20ABD4000, v25, v24, "blockCount (%ld) must be non-negative.\n", v44, 0xCu);
          }
          objc_storeStrong((id *)&v25, 0);
          _SparseTrap();
        }
        memcpy((void *)a9, &_SparseNullMatrix_Float, 0x28uLL);
      }
    }
    else
    {
      if (__dst[5])
      {
        memset(v47, 0, sizeof(v47));
        __snprintf_chk(v47, 0x100uLL, 0, 0x100uLL, "columnCount (%d) must be non-negative.\n", n);
        ((void (*)(char *))__dst[5])(v47);
      }
      else
      {
        os_log_t v27 = (os_log_t)&_os_log_internal;
        os_log_type_t v26 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_1_4_0((uint64_t)v46, n);
          _os_log_error_impl(&dword_20ABD4000, v27, v26, "columnCount (%d) must be non-negative.\n", v46, 8u);
        }
        objc_storeStrong((id *)&v27, 0);
        _SparseTrap();
      }
      memcpy((void *)a9, &_SparseNullMatrix_Float, 0x28uLL);
    }
  }
  else
  {
    if (__dst[5])
    {
      memset(__b, 0, sizeof(__b));
      __snprintf_chk(__b, 0x100uLL, 0, 0x100uLL, "rowCount (%d) must be non-negative.\n", m);
      ((void (*)(char *))__dst[5])(__b);
    }
    else
    {
      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v48, m);
        _os_log_error_impl(&dword_20ABD4000, oslog, type, "rowCount (%d) must be non-negative.\n", v48, 8u);
      }
      objc_storeStrong((id *)&oslog, 0);
      _SparseTrap();
    }
    memcpy((void *)a9, &_SparseNullMatrix_Float, 0x28uLL);
  }
}

void SparseMultiply(SparseMatrix_Float *a1, DenseVector_Float a2, DenseVector_Float a3)
{
  DenseVector_Float v6 = a2;
  DenseVector_Float v5 = a3;
  int v4 = a1;
  memcpy(&__dst, a1, sizeof(__dst));
  SparseMultiply(1.0, &__dst, v6, v5);
}

void SparseMultiply(float a1, SparseMatrix_Float *a2, DenseVector_Float a3, DenseVector_Float a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  DenseVector_Float v21 = a3;
  DenseVector_Float v20 = a4;
  float v19 = a1;
  void __dst[6] = a2;
  memcpy(__dst, &unk_26BEAB900, 0x30uLL);
  int v17 = 0;
  if (*(_WORD *)&a2->structure.attributes) {
    int columnCount = a2->structure.columnCount;
  }
  else {
    int columnCount = a2->structure.rowCount;
  }
  int v17 = *(&a2->structure.blockSize + 2) * columnCount;
  int v16 = 0;
  int v6 = *(&a2->structure.blockSize + 2);
  if (*(_WORD *)&a2->structure.attributes) {
    int rowCount = a2->structure.rowCount;
  }
  else {
    int rowCount = a2->structure.columnCount;
  }
  int v16 = v6 * rowCount;
  if (v6 * rowCount == v21.count)
  {
    if (v17 == v20.count)
    {
      float alpha = v19;
      _DenseMatrixFromVector_Float(*(uint64_t *)&v21.count, (uint64_t)v21.data, (uint64_t)&v11);
      _DenseMatrixFromVector_Float(*(uint64_t *)&v20.count, (uint64_t)v20.data, (uint64_t)&v10);
      memcpy(&v9, a2, sizeof(v9));
      _SparseSpMV_Float(alpha, &v9, &v11, 0, &v10);
    }
    else if (__dst[5])
    {
      memset(v23, 0, sizeof(v23));
      __snprintf_chk(v23, 0x100uLL, 0, 0x100uLL, "Matrix dimensions (%dx%d) do not match y vector dimensions %dx%d\n", v17, v16, v20.count, 1);
      ((void (*)(char *))__dst[5])(v23);
    }
    else
    {
      os_log_t v13 = (os_log_t)&_os_log_internal;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_4_4_0_4_0_4_0_4_0((uint64_t)v22, v17, v16, v20.count, 1);
        _os_log_error_impl(&dword_20ABD4000, v13, v12, "Matrix dimensions (%dx%d) do not match y vector dimensions %dx%d\n", v22, 0x1Au);
      }
      objc_storeStrong((id *)&v13, 0);
      _SparseTrap();
    }
  }
  else if (__dst[5])
  {
    memset(__b, 0, sizeof(__b));
    __snprintf_chk(__b, 0x100uLL, 0, 0x100uLL, "Matrix dimensions (%dx%d) do not match x vector dimensions %dx%d\n", v17, v16, v21.count, 1);
    ((void (*)(char *))__dst[5])(__b);
  }
  else
  {
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_4_4_0_4_0_4_0_4_0((uint64_t)v24, v17, v16, v21.count, 1);
      _os_log_error_impl(&dword_20ABD4000, oslog, type, "Matrix dimensions (%dx%d) do not match x vector dimensions %dx%d\n", v24, 0x1Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    _SparseTrap();
  }
}

uint64_t __os_log_helper_16_0_4_4_0_4_0_4_0_4_0(uint64_t result, int a2, int a3, int a4, int a5)
{
  *(unsigned char *)uint64_t result = 0;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(unsigned char *)(result + 8) = 0;
  *(unsigned char *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  *(unsigned char *)(result + 14) = 0;
  *(unsigned char *)(result + 15) = 4;
  *(_DWORD *)(result + 16) = a4;
  *(unsigned char *)(result + 20) = 0;
  *(unsigned char *)(result + 21) = 4;
  *(_DWORD *)(result + 22) = a5;
  return result;
}

uint64_t _DenseMatrixFromVector_Float@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_DWORD *)a3 = result;
  *(_DWORD *)(a3 + 4) = 1;
  *(void *)(a3 + 8) = result;
  *(void *)(a3 + 16) = a2;
  return result;
}

void __Block_byref_object_copy__11(uint64_t a1, uint64_t a2)
{
  locatioint n = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  int v3 = (id *)(a1 + 40);
  *int v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void sub_20AC9211C()
{
  _Unwind_Resume(v0);
}

void sub_20AC9FF98()
{
  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__12(uint64_t a1, uint64_t a2)
{
  locatioint n = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  int v3 = (id *)(a1 + 40);
  *int v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void __Block_byref_object_copy__13(uint64_t a1, uint64_t a2)
{
  locatioint n = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  int v3 = (id *)(a1 + 40);
  *int v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void sub_20ACA7268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, id a12, os_log_t log, int a14, os_log_type_t a15, uint8_t *buf, id a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void **a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38,__int16 a39,char a40,os_log_type_t type,os_log_t oslog,id location,id a44)
{
  if (a2)
  {
    *(void *)(v44 - 232) = a1;
    *(_DWORD *)(v44 - 236) = a2;
    if (*(_DWORD *)(v44 - 236) == 1)
    {
      a44 = objc_begin_catch(*(void **)(v44 - 232));
      locatioint n = (id)[NSString stringWithFormat:@"Invalid Predicate: %@"];
      os_log_t oslog = (os_log_t)&_os_log_internal;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        loga = oslog;
        __os_log_helper_16_2_1_8_64(v44 - 176, (uint64_t)location);
        _os_log_error_impl(&dword_20ABD4000, loga, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)(v44 - 176), 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      **a34 = +[AMDError allocError:21 withMessage:location];
      objc_storeStrong(&location, 0);
      objc_storeStrong(&a44, 0);
      objc_end_catch();
      JUMPOUT(0x20ACA7214);
    }
    exception_objecta = *(_Unwind_Exception **)(v44 - 232);
  }
  else
  {
    exception_objecta = a1;
  }
  _Unwind_Resume(exception_objecta);
}

uint64_t __os_log_helper_16_2_4_8_64_8_64_8_0_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 0;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

uint64_t sub_20ACAC1F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[41] = a5;
  v6[40] = a4;
  v6[39] = a3;
  v6[38] = a2;
  v6[37] = a1;
  v6[27] = v6;
  v6[28] = 0;
  v6[15] = 0;
  v6[16] = 0;
  v6[17] = 0;
  v6[18] = 0;
  v6[29] = 0;
  v6[30] = 0;
  v6[31] = 0;
  v6[32] = 0;
  v6[34] = 0;
  v6[36] = 0;
  v6[28] = a1;
  v6[15] = a2;
  v6[16] = a3;
  v6[17] = a4;
  v6[18] = a5;
  v6[29] = v5;
  return MEMORY[0x270FA2498](sub_20ACAC294, 0);
}

uint64_t sub_20ACAC294()
{
  uint64_t v12 = *(void *)(v0 + 328);
  uint64_t v11 = *(void *)(v0 + 320);
  uint64_t v10 = *(void *)(v0 + 312);
  uint64_t v9 = *(void *)(v0 + 304);
  uint64_t v15 = *(void *)(v0 + 296);
  *(void *)(v0 + 216) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267680ED0);
  sub_20ACD53F0();
  v14 = v1;
  *(void *)(v0 + 152) = sub_20ACD5010();
  *(void *)(v0 + 160) = v2;
  uint64_t v13 = MEMORY[0x263F8D310];
  sub_20ACD5390();
  uint64_t v3 = sub_20ACD5010();
  v14[8] = v13;
  v14[5] = v3;
  v14[6] = v4;
  *(void *)(v0 + 168) = sub_20ACD5010();
  *(void *)(v0 + 176) = v5;
  sub_20ACD5390();
  swift_bridgeObjectRetain();
  v14[17] = v13;
  v14[14] = v9;
  v14[15] = v10;
  *(void *)(v0 + 184) = sub_20ACD5010();
  *(void *)(v0 + 192) = v6;
  sub_20ACD5390();
  swift_bridgeObjectRetain();
  v14[26] = v13;
  v14[23] = v11;
  v14[24] = v12;
  *(void *)(v0 + 200) = sub_20ACD5010();
  *(void *)(v0 + 208) = v7;
  sub_20ACD5390();
  swift_bridgeObjectRetain();
  v14[35] = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B38);
  v14[32] = v15;
  sub_20ACAD01C();
  sub_20ACAD060();
  sub_20ACAD060();
  sub_20ACAD060();
  sub_20ACAD060();
  uint64_t v16 = sub_20ACD4FA0();
  *(void *)(v0 + 336) = v16;
  *(void *)(v0 + 240) = v16;
  sub_20ACAD08C();
  id v17 = sub_20ACAD0F4();
  *(void *)(v0 + 344) = v17;
  *(void *)(v0 + 248) = v17;
  swift_bridgeObjectRetain();
  os_log_type_t v18 = (void *)sub_20ACD4F70();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v17, sel_enqueueData_, v18);
  *(void *)(v0 + 352) = v19;

  *(void *)(v0 + 256) = v19;
  *(void *)(v0 + 16) = *(void *)(v0 + 216);
  *(void *)(v0 + 56) = v0 + 264;
  *(void *)(v0 + 24) = sub_20ACAC6E4;
  *(void *)(v0 + 112) = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(_DWORD *)(v0 + 88) = 0x40000000;
  *(_DWORD *)(v0 + 92) = 0;
  *(void *)(v0 + 96) = sub_20ACAD124;
  *(void *)(v0 + 104) = &block_descriptor;
  objc_msgSend(v19, sel_resultWithCompletion_);
  return __swift_continuation_await_point();
}

uint64_t sub_20ACAC6E4()
{
  uint64_t v4 = (void *)*v0;
  v4[27] = *v0;
  uint64_t v1 = v4[6];
  v4[45] = v1;
  if (v1)
  {
    uint64_t v2 = sub_20ACACEB8;
  }
  else
  {
    uint64_t v2 = sub_20ACAC834;
  }
  return MEMORY[0x270FA2498](v2, 0);
}

uint64_t sub_20ACAC834()
{
  v0[27] = v0;
  DenseVector_Float v21 = (void *)v0[33];
  v0[34] = v21;
  id v22 = objc_msgSend(v21, sel_data);
  if (v22)
  {
    uint64_t v18 = sub_20ACD4F80();

    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v19 = 0;
  }
  v20[35] = v19;
  if (v20[35])
  {
    sub_20ACAD23C();
    id v17 = objc_msgSend(v21, sel_data);
    if (v17)
    {
      uint64_t v10 = sub_20ACD4F80();

      uint64_t v11 = v10;
    }
    else
    {
      uint64_t v11 = 0;
    }
    if (!v11) {
      return sub_20ACD5340();
    }
    id v7 = (id)v20[44];
    id v8 = (id)v20[43];
    uint64_t v9 = sub_20ACD5380();
    v20[36] = v9;
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    uint64_t v16 = v9;
  }
  else
  {
    sub_20ACAD23C();
    id v13 = (id)v20[44];
    id v14 = (id)v20[43];
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
    sub_20ACD53F0();
    uint64_t v12 = v1;
    *uint64_t v1 = sub_20ACD5010();
    v12[1] = v2;
    uint64_t v3 = sub_20ACD5010();
    v12[5] = MEMORY[0x263F8D310];
    v12[2] = v3;
    v12[3] = v4;
    sub_20ACAD01C();
    uint64_t v15 = sub_20ACD4FA0();

    swift_bridgeObjectRelease();
    uint64_t v16 = v15;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v20[27] + 8);
  return v6(v16);
}

uint64_t sub_20ACACEB8()
{
  id v3 = (id)v0[44];
  id v4 = (id)v0[43];
  v0[27] = v0;
  swift_willThrow();

  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)())(v0[27] + 8);
  return v1();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2();
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }
  return v4;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACAD01C()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACAD060()
{
}

unint64_t sub_20ACAD08C()
{
  uint64_t v2 = qword_267680ED8;
  if (!qword_267680ED8)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267680ED8);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_20ACAD0F4()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_20ACADFB8();
}

void sub_20ACAD124(uint64_t a1, id a2, void *a3)
{
  id v3 = a2;
  id v4 = a3;
  uint64_t v13 = *(void *)(a1 + 32);
  if (a3)
  {
    id v7 = a3;
    unint64_t v8 = sub_20ACAF1C4();
    sub_20ACAD268(v13, (uint64_t)a3, v8);
  }
  else
  {
    id v5 = a2;
    if (a2)
    {
      id v9 = a2;
    }
    else
    {
      sub_20ACD5410();
      __break(1u);
    }
    id v14 = v9;
    unint64_t v6 = sub_20ACAF1C4();
    sub_20ACAD2C4(v13, (uint64_t)&v14, v6);
  }
}

uint64_t __swift_continuation_await_point()
{
  return MEMORY[0x270FA23F0]();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACAD23C()
{
}

uint64_t sub_20ACAD268(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[1] = a3;
  v7[0] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267680F30);
  return sub_20ACAE068((uint64_t)v7, a1, a3, v3);
}

uint64_t sub_20ACAD2C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20ACADFE8(a2, a1, a3);
}

uint64_t sub_20ACAD3E0(void *a1, void *a2, void *a3, const void *a4, void *a5)
{
  v5[6] = a5;
  v5[5] = a3;
  v5[4] = a2;
  void v5[3] = a1;
  v5[2] = v5;
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  v5[7] = _Block_copy(a4);
  id v10 = a5;
  uint64_t v23 = sub_20ACD4F80();
  v5[8] = v23;
  uint64_t v19 = sub_20ACD4FF0();
  uint64_t v20 = v11;
  v5[9] = v11;
  uint64_t v21 = sub_20ACD4FF0();
  uint64_t v22 = v12;
  v5[10] = v12;
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v18 + 88) = v13;
  *uint64_t v13 = *(void *)(v18 + 16);
  v13[1] = sub_20ACAD548;
  return sub_20ACAC1F8(v23, v19, v20, v21, v22);
}

uint64_t sub_20ACAD548()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 16) = *v1;
  id v14 = (void *)(v2 + 16);
  uint64_t v15 = v2 + 16;
  swift_task_dealloc();
  if (v0)
  {
    aBlock = (void (**)(void *, void))v14[5];
    id v9 = (id)sub_20ACD4960();
    aBlock[2](aBlock, 0);

    _Block_release(aBlock);
  }
  else
  {
    uint64_t v12 = (void (**)(void))v14[5];
    id v11 = (id)sub_20ACD4F70();
    v12[2]();

    _Block_release(v12);
    swift_bridgeObjectRelease();
  }
  id v8 = (void *)v14[4];
  id v5 = (void *)v14[3];
  unint64_t v6 = (void *)v14[2];
  id v7 = (void *)v14[1];
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)v15 + 8);
  return v3();
}

uint64_t sub_20ACAD7AC()
{
  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject();
}

uint64_t sub_20ACAD80C()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  id v10 = (void *)v0[2];
  unint64_t v6 = (void *)v0[3];
  id v7 = (void *)v0[4];
  id v8 = (const void *)v0[5];
  id v9 = (void *)v0[6];
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = sub_20ACAD910;
  uint64_t v3 = dword_267680EE0;
  return ((uint64_t (*)(void *, void *, void *, const void *, void *))((char *)&dword_267680EE0 + v3))(v10, v6, v7, v8, v9);
}

uint64_t sub_20ACAD910()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_20ACADA3C(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = a1;
  uint64_t v17 = a2;
  uint64_t v15 = 0;
  uint64_t v23 = &unk_267680F00;
  os_log_t v25 = &unk_267680F10;
  unint64_t v16 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0CA0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v26 = (char *)&v15 - v16;
  uint64_t v2 = sub_20ACD51A0();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 56))(v26, 1);
  uint64_t v19 = 48;
  uint64_t v20 = 7;
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = v17;
  uint64_t v5 = (void *)v3;
  uint64_t v6 = v18;
  uint64_t v24 = v5;
  v5[2] = 0;
  void v5[3] = 0;
  v5[4] = v6;
  v5[5] = v4;
  uint64_t v21 = v5[2];
  uint64_t v22 = v5[3];
  swift_unknownObjectRetain();
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = v22;
  id v9 = v23;
  id v10 = v24;
  uint64_t v11 = (uint64_t)v25;
  uint64_t v12 = (void *)v7;
  uint64_t v13 = (uint64_t)v26;
  v12[2] = v21;
  v12[3] = v8;
  v12[4] = v9;
  v12[5] = v10;
  sub_20ACAEA20(v13, v11, (uint64_t)v12);
  return swift_release();
}

id AMDSwiftClient.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id AMDSwiftClient.init()()
{
  id v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for AMDSwiftClient();
  id v2 = objc_msgSendSuper2(&v3, sel_init);
  id v0 = v2;
  id v4 = v2;

  return v2;
}

uint64_t type metadata accessor for AMDSwiftClient()
{
  return self;
}

id AMDSwiftClient.__deallocating_deinit()
{
  objc_super v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AMDSwiftClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for AMDSwiftClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AMDSwiftClient.queryLLM(requestPayload:usecase:capability:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = v6;
  *(void *)(v6 + 16) = v6;
  id v9 = *(int **)((*v5 & *MEMORY[0x263F8EED0]) + 0x50);
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v9 + *v9);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v10 + 24) = v7;
  void *v7 = *(void *)(v10 + 16);
  v7[1] = sub_20ACADE84;
  return v15(a1, a2, a3, a4, a5);
}

uint64_t sub_20ACADE84(uint64_t a1)
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  swift_task_dealloc();
  objc_super v2 = *(uint64_t (**)(uint64_t))(*(void *)(v4 + 16) + 8);
  return v2(a1);
}

id sub_20ACADFB8()
{
  return objc_msgSend(v0, sel_init);
}

void sub_20ACADFDC()
{
  void *v0 = *v0;
}

uint64_t sub_20ACADFE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_continuation_throwingResume();
}

uint64_t sub_20ACAE068(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_allocError();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(v4, a1);
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_20ACAE0F8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  uint64_t v7 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  *uint64_t v4 = *(void *)(v6 + 16);
  v4[1] = sub_20ACAE1F0;
  return v7();
}

uint64_t sub_20ACAE1F0()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_20ACAE31C()
{
  return swift_deallocObject();
}

uint64_t sub_20ACAE364()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v8 = v0[2];
  uint64_t v6 = v0[3];
  uint64_t v7 = (int *)v0[4];
  objc_super v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v2;
  *objc_super v2 = *(void *)(v5 + 16);
  v2[1] = sub_20ACAE45C;
  uint64_t v3 = dword_267680EF8;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_267680EF8 + v3))(v8, v6, v7);
}

uint64_t sub_20ACAE45C()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_20ACAE588(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = v4;
  *(void *)(v4 + 16) = v4;
  uint64_t v8 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v7 + 24) = v5;
  *uint64_t v5 = *(void *)(v7 + 16);
  v5[1] = sub_20ACAE680;
  return v8();
}

uint64_t sub_20ACAE680()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_20ACAE7AC()
{
  return swift_deallocObject();
}

uint64_t sub_20ACAE7F4(uint64_t a1)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = (int *)v1[4];
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  *uint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_20ACAE8F4;
  uint64_t v4 = dword_267680F08;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_267680F08 + v4))(a1, v7, v8, v9);
}

uint64_t sub_20ACAE8F4()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_20ACAEA20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = sub_20ACD51A0();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v10 + 48))(a1, 1) == 1)
  {
    sub_20ACAEC90(a1);
  }
  else
  {
    sub_20ACD5190();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  }
  uint64_t v5 = *(void *)(a3 + 16);
  swift_unknownObjectRetain();
  if (v5)
  {
    swift_getObjectType();
    sub_20ACD5180();
    swift_unknownObjectRelease();
  }
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  *(void *)(v4 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_20ACAEC90(uint64_t a1)
{
  uint64_t v3 = sub_20ACD51A0();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_20ACAED40(uint64_t a1, int *a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_20ACAEE40;
  return v6(a1);
}

uint64_t sub_20ACAEE40()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_20ACAEF70()
{
  return swift_deallocObject();
}

uint64_t sub_20ACAEFB0(uint64_t a1)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v7 = *(int **)(v1 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  *uint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_20ACAF098;
  uint64_t v4 = dword_267680F18;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_267680F18 + v4))(a1, v7);
}

uint64_t sub_20ACAF098()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

unint64_t sub_20ACAF1C4()
{
  uint64_t v2 = qword_267680F28;
  if (!qword_267680F28)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267680F28);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_20ACAF22C()
{
  uint64_t result = sub_20ACD5010();
  qword_267681300 = result;
  qword_267681308 = v1;
  return result;
}

uint64_t *sub_20ACAF270()
{
  if (qword_267681158 != -1) {
    swift_once();
  }
  return &qword_267681300;
}

uint64_t sub_20ACAF2D4()
{
  uint64_t result = sub_20ACD5010();
  qword_267681310 = result;
  qword_267681318 = v1;
  return result;
}

uint64_t *sub_20ACAF318()
{
  if (qword_267681160 != -1) {
    swift_once();
  }
  return &qword_267681310;
}

uint64_t sub_20ACAF37C()
{
  uint64_t result = sub_20ACD5010();
  qword_267681320 = result;
  qword_267681328 = v1;
  return result;
}

uint64_t *sub_20ACAF3C0()
{
  if (qword_267681168 != -1) {
    swift_once();
  }
  return &qword_267681320;
}

uint64_t sub_20ACAF424()
{
  uint64_t result = sub_20ACD5010();
  qword_267681330 = result;
  qword_267681338 = v1;
  return result;
}

uint64_t *sub_20ACAF468()
{
  if (qword_267681170 != -1) {
    swift_once();
  }
  return &qword_267681330;
}

uint64_t sub_20ACAF55C()
{
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC19AppleMediaDiscovery18FitCoreDQueryClass_tableUpdateSummary);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_20ACAF63C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC19AppleMediaDiscovery18FitCoreDQueryClass_tableUpdateSummary);
  swift_beginAccess();
  *uint64_t v3 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_20ACAF6C0())()
{
  return sub_20ACAF72C;
}

uint64_t sub_20ACAF72C()
{
  return swift_endAccess();
}

uint64_t sub_20ACAF7E8()
{
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC19AppleMediaDiscovery18FitCoreDQueryClass_allFitnessTables);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_20ACAF8B4(uint64_t a1)
{
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC19AppleMediaDiscovery18FitCoreDQueryClass_allFitnessTables);
  swift_beginAccess();
  *uint64_t v3 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_20ACAF938())()
{
  return sub_20ACAF9A4;
}

uint64_t sub_20ACAF9A4()
{
  return swift_endAccess();
}

uint64_t sub_20ACAF9E4(uint64_t a1)
{
  *(void *)(v2 + 2352) = a1;
  *(void *)(v2 + 2200) = v2;
  *(void *)(v2 + 2208) = 0;
  *(void *)(v2 + 2216) = 0;
  *(void *)(v2 + 2224) = 0;
  *(unsigned char *)(v2 + 2568) = 0;
  *(unsigned char *)(v2 + 2576) = 0;
  *(void *)(v2 + 2240) = 0;
  *(void *)(v2 + 2248) = 0;
  *(void *)(v2 + 1624) = 0;
  *(void *)(v2 + 1632) = 0;
  *(void *)(v2 + 2280) = 0;
  *(void *)(v2 + 2296) = 0;
  *(void *)(v2 + 1848) = 0;
  *(void *)(v2 + 1856) = 0;
  *(void *)(v2 + 2312) = 0;
  *(void *)(v2 + 2328) = 0;
  *(void *)(v2 + 2344) = 0;
  uint64_t v3 = sub_20ACD4CE0();
  *(void *)(v2 + 2360) = v3;
  *(void *)(v2 + 2368) = *(void *)(v3 - 8);
  *(void *)(v2 + 2376) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267680F50);
  *(void *)(v2 + 2384) = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267680F58);
  *(void *)(v2 + 2392) = v4;
  *(void *)(v2 + 2400) = *(void *)(v4 - 8);
  *(void *)(v2 + 2408) = swift_task_alloc();
  uint64_t v5 = sub_20ACD4AC0();
  *(void *)(v2 + 2416) = v5;
  *(void *)(v2 + 2424) = *(void *)(v5 - 8);
  *(void *)(v2 + 2432) = swift_task_alloc();
  uint64_t v6 = sub_20ACD4A50();
  *(void *)(v2 + 2440) = v6;
  *(void *)(v2 + 2448) = *(void *)(v6 - 8);
  *(void *)(v2 + 2456) = swift_task_alloc();
  *(void *)(v2 + 2464) = sub_20ACD4AF0();
  *(void *)(v2 + 2472) = swift_task_alloc();
  *(void *)(v2 + 2480) = swift_task_alloc();
  *(void *)(v2 + 2488) = swift_task_alloc();
  *(void *)(v2 + 2496) = swift_task_alloc();
  *(void *)(v2 + 2504) = swift_task_alloc();
  *(void *)(v2 + 2512) = swift_task_alloc();
  *(void *)(v2 + 2520) = swift_task_alloc();
  *(void *)(v2 + 2528) = swift_task_alloc();
  *(void *)(v2 + 2536) = swift_task_alloc();
  *(void *)(v2 + 2544) = swift_task_alloc();
  *(void *)(v2 + 2208) = a1;
  *(void *)(v2 + 2216) = v1;
  return MEMORY[0x270FA2498](sub_20ACAFD98, 0);
}

uint64_t sub_20ACAFD98()
{
  v0[275] = v0;
  v0[278] = sub_20ACD53F0();
  uint64_t v1 = sub_20ACAF270();
  uint64_t v71 = *v1;
  uint64_t v72 = v1[1];
  swift_bridgeObjectRetain();
  v0[193] = v71;
  v0[194] = v72;
  MEMORY[0x21052B560]();
  sub_20ACAD060();
  if (v0[5])
  {
    sub_20ACB31A4(v70 + 16, v70 + 272);
    if (!*(void *)(v70 + 296)) {
      return sub_20ACD5340();
    }
    sub_20ACB323C(v70 + 272, v70 + 240);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B38);
    swift_dynamicCast();
    *(void *)(v70 + 2280) = *(void *)(v70 + 2272);
    *(void *)(v70 + 1640) = sub_20ACD5010();
    *(void *)(v70 + 1648) = v2;
    MEMORY[0x21052B560]();
    sub_20ACAD060();
    if (*(void *)(v70 + 328))
    {
      sub_20ACB3678(v70 + 304);
      *(void *)(v70 + 2168) = sub_20ACD5010();
      *(void *)(v70 + 2176) = v3;
      MEMORY[0x21052B560]();
      sub_20ACAD060();
      if (!*(void *)(v70 + 1512)) {
        return sub_20ACD5340();
      }
      v69 = *(void **)(v70 + 2544);
      sub_20ACB323C(v70 + 1488, v70 + 1456);
      swift_dynamicCast();
      uint64_t v4 = *(void *)(v70 + 2192);
      void *v69 = *(void *)(v70 + 2184);
      v69[1] = v4;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267680F60);
      sub_20ACD5130();
    }
    else
    {
      sub_20ACB3678(v70 + 304);
    }
    *(void *)(v70 + 1656) = sub_20ACD5010();
    *(void *)(v70 + 1664) = v5;
    MEMORY[0x21052B560]();
    sub_20ACAD060();
    if (*(void *)(v70 + 360))
    {
      sub_20ACB3678(v70 + 336);
      *(void *)(v70 + 2136) = sub_20ACD5010();
      *(void *)(v70 + 2144) = v6;
      MEMORY[0x21052B560]();
      sub_20ACAD060();
      if (!*(void *)(v70 + 1448)) {
        return sub_20ACD5340();
      }
      v68 = *(void **)(v70 + 2536);
      sub_20ACB323C(v70 + 1424, v70 + 1392);
      swift_dynamicCast();
      uint64_t v7 = *(void *)(v70 + 2160);
      void *v68 = *(void *)(v70 + 2152);
      v68[1] = v7;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267680F60);
      sub_20ACD5130();
    }
    else
    {
      sub_20ACB3678(v70 + 336);
    }
    *(void *)(v70 + 1672) = sub_20ACD5010();
    *(void *)(v70 + 1680) = v8;
    MEMORY[0x21052B560]();
    sub_20ACAD060();
    if (*(void *)(v70 + 392))
    {
      sub_20ACB3678(v70 + 368);
      *(void *)(v70 + 2104) = sub_20ACD5010();
      *(void *)(v70 + 2112) = v9;
      MEMORY[0x21052B560]();
      sub_20ACAD060();
      if (!*(void *)(v70 + 1384)) {
        return sub_20ACD5340();
      }
      v67 = *(void **)(v70 + 2528);
      sub_20ACB323C(v70 + 1360, v70 + 1328);
      swift_dynamicCast();
      uint64_t v10 = *(void *)(v70 + 2128);
      void *v67 = *(void *)(v70 + 2120);
      v67[1] = v10;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267680F60);
      sub_20ACD5130();
    }
    else
    {
      sub_20ACB3678(v70 + 368);
    }
    *(void *)(v70 + 1688) = sub_20ACD5010();
    *(void *)(v70 + 1696) = v11;
    MEMORY[0x21052B560]();
    sub_20ACAD060();
    if (*(void *)(v70 + 424))
    {
      sub_20ACB3678(v70 + 400);
      *(void *)(v70 + 2072) = sub_20ACD5010();
      *(void *)(v70 + 2080) = v12;
      MEMORY[0x21052B560]();
      sub_20ACAD060();
      if (!*(void *)(v70 + 1320)) {
        return sub_20ACD5340();
      }
      v66 = *(void **)(v70 + 2520);
      sub_20ACB323C(v70 + 1296, v70 + 1264);
      swift_dynamicCast();
      uint64_t v13 = *(void *)(v70 + 2096);
      void *v66 = *(void *)(v70 + 2088);
      v66[1] = v13;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267680F60);
      sub_20ACD5130();
    }
    else
    {
      sub_20ACB3678(v70 + 400);
    }
    *(void *)(v70 + 1704) = sub_20ACD5010();
    *(void *)(v70 + 1712) = v14;
    MEMORY[0x21052B560]();
    sub_20ACAD060();
    if (*(void *)(v70 + 456))
    {
      sub_20ACB3678(v70 + 432);
      *(void *)(v70 + 2040) = sub_20ACD5010();
      *(void *)(v70 + 2048) = v15;
      MEMORY[0x21052B560]();
      sub_20ACAD060();
      if (!*(void *)(v70 + 1256)) {
        return sub_20ACD5340();
      }
      v65 = *(void **)(v70 + 2512);
      sub_20ACB323C(v70 + 1232, v70 + 1200);
      swift_dynamicCast();
      uint64_t v16 = *(void *)(v70 + 2064);
      void *v65 = *(void *)(v70 + 2056);
      v65[1] = v16;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267680F60);
      sub_20ACD5130();
    }
    else
    {
      sub_20ACB3678(v70 + 432);
    }
    *(void *)(v70 + 1720) = sub_20ACD5010();
    *(void *)(v70 + 1728) = v17;
    MEMORY[0x21052B560]();
    sub_20ACAD060();
    if (*(void *)(v70 + 488))
    {
      sub_20ACB3678(v70 + 464);
      *(void *)(v70 + 2008) = sub_20ACD5010();
      *(void *)(v70 + 2016) = v18;
      MEMORY[0x21052B560]();
      sub_20ACAD060();
      if (!*(void *)(v70 + 1192)) {
        return sub_20ACD5340();
      }
      v64 = *(void **)(v70 + 2504);
      sub_20ACB323C(v70 + 1168, v70 + 1136);
      swift_dynamicCast();
      uint64_t v19 = *(void *)(v70 + 2032);
      void *v64 = *(void *)(v70 + 2024);
      v64[1] = v19;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267680F60);
      sub_20ACD5130();
    }
    else
    {
      sub_20ACB3678(v70 + 464);
    }
    *(void *)(v70 + 1736) = sub_20ACD5010();
    *(void *)(v70 + 1744) = v20;
    MEMORY[0x21052B560]();
    sub_20ACAD060();
    if (*(void *)(v70 + 520))
    {
      sub_20ACB3678(v70 + 496);
      *(void *)(v70 + 1976) = sub_20ACD5010();
      *(void *)(v70 + 1984) = v21;
      MEMORY[0x21052B560]();
      sub_20ACAD060();
      if (!*(void *)(v70 + 1128)) {
        return sub_20ACD5340();
      }
      v63 = *(void **)(v70 + 2496);
      sub_20ACB323C(v70 + 1104, v70 + 1072);
      swift_dynamicCast();
      uint64_t v22 = *(void *)(v70 + 2000);
      void *v63 = *(void *)(v70 + 1992);
      v63[1] = v22;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267680F60);
      sub_20ACD5130();
    }
    else
    {
      sub_20ACB3678(v70 + 496);
    }
    *(void *)(v70 + 1752) = sub_20ACD5010();
    *(void *)(v70 + 1760) = v23;
    MEMORY[0x21052B560]();
    sub_20ACAD060();
    if (*(void *)(v70 + 552))
    {
      sub_20ACB3678(v70 + 528);
      *(void *)(v70 + 1944) = sub_20ACD5010();
      *(void *)(v70 + 1952) = v24;
      MEMORY[0x21052B560]();
      sub_20ACAD060();
      if (!*(void *)(v70 + 1064)) {
        return sub_20ACD5340();
      }
      v62 = *(void **)(v70 + 2488);
      sub_20ACB323C(v70 + 1040, v70 + 1008);
      swift_dynamicCast();
      uint64_t v25 = *(void *)(v70 + 1968);
      void *v62 = *(void *)(v70 + 1960);
      v62[1] = v25;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267680F60);
      sub_20ACD5130();
    }
    else
    {
      sub_20ACB3678(v70 + 528);
    }
    *(void *)(v70 + 1768) = sub_20ACD5010();
    *(void *)(v70 + 1776) = v26;
    MEMORY[0x21052B560]();
    sub_20ACAD060();
    if (*(void *)(v70 + 584))
    {
      sub_20ACB3678(v70 + 560);
      *(void *)(v70 + 1912) = sub_20ACD5010();
      *(void *)(v70 + 1920) = v27;
      MEMORY[0x21052B560]();
      sub_20ACAD060();
      if (!*(void *)(v70 + 1000)) {
        return sub_20ACD5340();
      }
      v61 = *(void **)(v70 + 2480);
      sub_20ACB323C(v70 + 976, v70 + 944);
      swift_dynamicCast();
      uint64_t v28 = *(void *)(v70 + 1936);
      void *v61 = *(void *)(v70 + 1928);
      v61[1] = v28;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267680F60);
      sub_20ACD5130();
    }
    else
    {
      sub_20ACB3678(v70 + 560);
    }
    *(void *)(v70 + 1784) = sub_20ACD5010();
    *(void *)(v70 + 1792) = v29;
    MEMORY[0x21052B560]();
    sub_20ACAD060();
    if (*(void *)(v70 + 616))
    {
      sub_20ACB3678(v70 + 592);
      *(void *)(v70 + 1800) = sub_20ACD5010();
      *(void *)(v70 + 1808) = v30;
      MEMORY[0x21052B560]();
      sub_20ACAD060();
      if (!*(void *)(v70 + 680)) {
        return sub_20ACD5340();
      }
      sub_20ACB323C(v70 + 656, v70 + 624);
      swift_dynamicCast();
      *(void *)(v70 + 2296) = *(void *)(v70 + 2288);
      *(void *)(v70 + 1816) = sub_20ACD5010();
      *(void *)(v70 + 1824) = v31;
      MEMORY[0x21052B560]();
      sub_20ACAD060();
      if (!*(void *)(v70 + 744)) {
        return sub_20ACD5340();
      }
      sub_20ACB323C(v70 + 720, v70 + 688);
      swift_dynamicCast();
      uint64_t v32 = *(void *)(v70 + 1840);
      *(void *)(v70 + 1848) = *(void *)(v70 + 1832);
      *(void *)(v70 + 1856) = v32;
      *(void *)(v70 + 1864) = sub_20ACD5010();
      *(void *)(v70 + 1872) = v33;
      MEMORY[0x21052B560]();
      sub_20ACAD060();
      if (!*(void *)(v70 + 808)) {
        return sub_20ACD5340();
      }
      sub_20ACB323C(v70 + 784, v70 + 752);
      swift_dynamicCast();
      *(void *)(v70 + 2312) = *(void *)(v70 + 2304);
      *(void *)(v70 + 1880) = sub_20ACD5010();
      *(void *)(v70 + 1888) = v34;
      MEMORY[0x21052B560]();
      sub_20ACAD060();
      if (!*(void *)(v70 + 872)) {
        return sub_20ACD5340();
      }
      sub_20ACB323C(v70 + 848, v70 + 816);
      swift_dynamicCast();
      *(void *)(v70 + 2328) = *(void *)(v70 + 2320);
      *(void *)(v70 + 1896) = sub_20ACD5010();
      *(void *)(v70 + 1904) = v35;
      MEMORY[0x21052B560]();
      sub_20ACAD060();
      if (!*(void *)(v70 + 936)) {
        return sub_20ACD5340();
      }
      sub_20ACB323C(v70 + 912, v70 + 880);
      swift_dynamicCast();
      *(void *)(v70 + 2344) = *(void *)(v70 + 2336);
      sub_20ACD51B0();
      sub_20ACD51B0();
      sub_20ACD51B0();
      sub_20ACD4A60();
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267680F60);
      sub_20ACD5130();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_20ACB3678(v70 + 592);
    }
    swift_bridgeObjectRelease();
  }
  v37 = sub_20ACAF318();
  uint64_t v59 = *v37;
  uint64_t v60 = v37[1];
  swift_bridgeObjectRetain();
  *(void *)(v70 + 1560) = v59;
  *(void *)(v70 + 1568) = v60;
  MEMORY[0x21052B560]();
  sub_20ACAD060();
  if (*(void *)(v70 + 72))
  {
    sub_20ACB31A4(v70 + 48, v70 + 112);
    if (!*(void *)(v70 + 136)) {
      return sub_20ACD5340();
    }
    sub_20ACB323C(v70 + 112, v70 + 80);
    swift_dynamicCast();
    char v74 = sub_20ACD4B00();
    if (v74 == 2) {
      char v73 = 1;
    }
    else {
      char v73 = v74 & 1;
    }
    *(unsigned char *)(v70 + 2568) = v73 & 1;
    v42 = sub_20ACAF3C0();
    uint64_t v54 = *v42;
    uint64_t v55 = v42[1];
    swift_bridgeObjectRetain();
    *(void *)(v70 + 1592) = v54;
    *(void *)(v70 + 1600) = v55;
    MEMORY[0x21052B560]();
    sub_20ACAD060();
    if (*(void *)(v70 + 168))
    {
      sub_20ACB31A4(v70 + 144, v70 + 208);
      if (*(void *)(v70 + 232))
      {
        sub_20ACB323C(v70 + 208, v70 + 176);
        swift_dynamicCast();
        char v76 = MEMORY[0x21052B020](*(void *)(v70 + 1608), *(void *)(v70 + 1616));
        if (v76 == 8) {
          char v75 = 5;
        }
        else {
          char v75 = v76;
        }
        *(unsigned char *)(v70 + 2576) = v75;
        uint64_t v51 = *(void *)(v70 + 2224);
        swift_bridgeObjectRetain();
        *(void *)(v70 + 2232) = v51;
        __swift_instantiateConcreteTypeFromMangledName(&qword_267680F60);
        sub_20ACB3258();
        sub_20ACB32DC();
        sub_20ACD5200();
        sub_20ACB33D8();
        sub_20ACD4A40();
        *(void *)(v70 + 2240) = sub_20ACD53F0();
        sub_20ACD4EC0();
        sub_20ACB344C();
        sub_20ACB3594();
        sub_20ACD4EB0();
        sub_20ACD4E70();
        swift_release();
        v47 = (void *)swift_task_alloc();
        *(void *)(v70 + 2552) = v47;
        void *v47 = *(void *)(v70 + 2200);
        v47[1] = sub_20ACB2874;
        uint64_t v48 = *(void *)(v70 + 2432);
        uint64_t v49 = *(void *)(v70 + 2392);
        return MEMORY[0x270F5D330](v48, "/Library/Caches/com.apple.xbs/Sources/AppleMediaDiscoveryFramework/Frameworks/AppleMediaDiscovery/DataIntegration/AMDFitcoreDIntegration.swift", 142, 2, 89, v49);
      }
      return sub_20ACD5340();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
    sub_20ACD53F0();
    v52 = v43;
    uint64_t *v43 = sub_20ACD5010();
    v52[1] = v44;
    uint64_t v45 = sub_20ACD5010();
    v52[5] = MEMORY[0x263F8D310];
    v52[2] = v45;
    v52[3] = v46;
    sub_20ACAD01C();
    uint64_t v53 = sub_20ACD4FA0();
    sub_20ACB3678(v70 + 144);
    sub_20ACB3678(v70 + 48);
    sub_20ACB3678(v70 + 16);
    sub_20ACB3768();
    uint64_t v58 = v53;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
    sub_20ACD53F0();
    v56 = v38;
    *uint64_t v38 = sub_20ACD5010();
    v56[1] = v39;
    uint64_t v40 = sub_20ACD5010();
    v56[5] = MEMORY[0x263F8D310];
    v56[2] = v40;
    v56[3] = v41;
    sub_20ACAD01C();
    uint64_t v57 = sub_20ACD4FA0();
    sub_20ACB3678(v70 + 48);
    sub_20ACB3678(v70 + 16);
    sub_20ACB3768();
    uint64_t v58 = v57;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v50 = *(uint64_t (**)(uint64_t))(*(void *)(v70 + 2200) + 8);
  return v50(v58);
}

uint64_t sub_20ACB2874()
{
  uint64_t v5 = *v1;
  uint64_t v4 = (void *)(*v1 + 16);
  *(void *)(v5 + 2200) = *v1;
  *(void *)(v5 + 2560) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_20ACB2E78;
  }
  else
  {
    (*(void (**)(void, void))(v4[298] + 8))(v4[299], v4[297]);
    uint64_t v2 = sub_20ACB2A08;
  }
  return MEMORY[0x270FA2498](v2, 0);
}

uint64_t sub_20ACB2A08()
{
  *(void *)(v0 + 2200) = v0;
  *(void *)(v0 + 2264) = sub_20ACD4AB0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267680F78);
  sub_20ACB3794();
  sub_20ACD5210();
  while (1)
  {
    uint64_t v18 = v20[298];
    uint64_t v19 = v20[295];
    uint64_t v17 = v20[296];
    __swift_instantiateConcreteTypeFromMangledName(&qword_267680F88);
    sub_20ACD5300();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v18, 1, v19) == 1) {
      break;
    }
    uint64_t v15 = v20[297];
    uint64_t v16 = v20[295];
    uint64_t v14 = v20[296];
    (*(void (**)(uint64_t, void))(v14 + 32))(v15, v20[298]);
    sub_20ACD4CD0();
    sub_20ACD5140();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v16);
  }
  uint64_t v12 = v20[307];
  uint64_t v11 = v20[305];
  uint64_t v7 = v20[304];
  uint64_t v6 = v20[302];
  uint64_t v10 = v20[306];
  uint64_t v5 = v20[303];
  sub_20ACB3818();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
  sub_20ACD53F0();
  uint64_t v8 = v1;
  *uint64_t v1 = sub_20ACD5010();
  v8[1] = v2;
  uint64_t v9 = v20[280];
  swift_bridgeObjectRetain();
  v8[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C88);
  v8[2] = v9;
  sub_20ACAD01C();
  uint64_t v13 = sub_20ACD4FA0();
  sub_20ACB364C();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v12, v11);
  sub_20ACB3678((uint64_t)(v20 + 18));
  sub_20ACB3678((uint64_t)(v20 + 6));
  sub_20ACB3678((uint64_t)(v20 + 2));
  sub_20ACB3768();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v20[275] + 8);
  return v3(v13);
}

uint64_t sub_20ACB2E78()
{
  id v13 = (id)v0[320];
  uint64_t v16 = v0[307];
  uint64_t v14 = v0[306];
  uint64_t v15 = v0[305];
  uint64_t v1 = v0[301];
  uint64_t v2 = v0[300];
  uint64_t v3 = v0[299];
  v0[275] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  id v4 = v13;
  v0[281] = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
  sub_20ACD53F0();
  uint64_t v10 = v5;
  *uint64_t v5 = sub_20ACD5010();
  v10[1] = v6;
  swift_getErrorValue();
  uint64_t v11 = v0[190];
  uint64_t v12 = v0[191];
  v10[5] = v12;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v10 + 2);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16))(boxed_opaque_existential_0, v11);
  sub_20ACAD01C();
  uint64_t v17 = sub_20ACD4FA0();

  sub_20ACB364C();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v16, v15);
  sub_20ACB3678((uint64_t)(v0 + 18));
  sub_20ACB3678((uint64_t)(v0 + 6));
  sub_20ACB3678((uint64_t)(v0 + 2));
  sub_20ACB3768();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v0[275] + 8);
  return v8(v17);
}

uint64_t sub_20ACB31A4(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    uint64_t v2 = *(void *)(a1 + 24);
    *(void *)(a2 + 24) = v2;
    (**(void (***)(void))(v2 - 8))();
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  }
  return a2;
}

__n128 sub_20ACB323C(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  __n128 result = *(__n128 *)(a1 + 16);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

unint64_t sub_20ACB3258()
{
  uint64_t v2 = qword_267680F68;
  if (!qword_267680F68)
  {
    sub_20ACD4AF0();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267680F68);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_20ACB32DC()
{
  uint64_t v2 = qword_267680F70;
  if (!qword_267680F70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267680F60);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267680F70);
    return WitnessTable;
  }
  return v2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }
  return v4;
}

uint64_t sub_20ACB33D8()
{
  uint64_t v3 = sub_20ACC08BC(0);
  if (sub_20ACC099C(v3)) {
    return sub_20ACC09A4(v3);
  }
  swift_bridgeObjectRelease();
  uint64_t v1 = MEMORY[0x263F8EE88];
  swift_retain();
  return v1;
}

uint64_t sub_20ACB344C()
{
  uint64_t v7 = 0;
  uint64_t v6 = sub_20ACD4EF0();
  uint64_t v4 = *(void *)(v6 - 8);
  uint64_t v5 = v6 - 8;
  unint64_t v3 = (*(void *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v8 = (char *)&v2 - v3;
  sub_20ACC18A8();
  uint64_t v10 = sub_20ACD5240();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v8, *MEMORY[0x263F68950], v6);
  uint64_t v0 = sub_20ACD4EE0();
  uint64_t v9 = v11;
  v11[3] = v0;
  v11[4] = MEMORY[0x263F68940];
  __swift_allocate_boxed_opaque_existential_1(v11);
  sub_20ACD4ED0();
  sub_20ACD4F10();
  swift_allocObject();
  return sub_20ACD4F00();
}

uint64_t sub_20ACB3594()
{
  return sub_20ACD5240();
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *result)
{
  unint64_t v3 = result;
  if ((*(_DWORD *)(*(void *)(result[3] - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v1 = swift_allocBox();
    __n128 result = v2;
    *unint64_t v3 = v1;
  }
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACB364C()
{
}

uint64_t sub_20ACB3678(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_0(a1);
  }
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80) & 0x20000) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACB3768()
{
}

unint64_t sub_20ACB3794()
{
  uint64_t v2 = qword_267680F80;
  if (!qword_267680F80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267680F78);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267680F80);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACB3818()
{
}

uint64_t sub_20ACB38E4(void *a1, const void *a2, void *a3)
{
  v3[4] = a3;
  v3[3] = a1;
  v3[2] = v3;
  id v5 = a1;
  v3[5] = _Block_copy(a2);
  id v6 = a3;
  uint64_t v11 = sub_20ACD4F80();
  v3[6] = v11;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v10 + 56) = v7;
  void *v7 = *(void *)(v10 + 16);
  v7[1] = sub_20ACB39EC;
  return sub_20ACAF9E4(v11);
}

uint64_t sub_20ACB39EC()
{
  uint64_t v7 = *v0;
  id v6 = *(void (***)(void))(*v0 + 40);
  uint64_t v4 = *(void **)(*v0 + 32);
  unint64_t v3 = *(void **)(*v0 + 24);
  *(void *)(v7 + 16) = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  id v5 = (id)sub_20ACD4F70();
  v6[2]();

  _Block_release(v6);
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v7 + 16) + 8);
  return v1();
}

uint64_t sub_20ACB3BE8()
{
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_20ACB3C38()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v8 = (void *)v0[2];
  id v6 = (const void *)v0[3];
  uint64_t v7 = (void *)v0[4];
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = sub_20ACB3D24;
  uint64_t v3 = dword_267680F90;
  return ((uint64_t (*)(void *, const void *, void *))((char *)&dword_267680F90 + v3))(v8, v6, v7);
}

uint64_t sub_20ACB3D24()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_20ACB3E50(uint64_t a1)
{
  v2[43] = a1;
  v2[31] = v2;
  v2[32] = 0;
  v2[33] = 0;
  v2[35] = 0;
  v2[37] = 0;
  v2[38] = 0;
  v2[40] = 0;
  v2[42] = 0;
  memset(v2 + 7, 0, 0x28uLL);
  v2[25] = 0;
  v2[26] = 0;
  uint64_t v3 = sub_20ACD4CC0();
  v2[44] = v3;
  v2[45] = *(void *)(v3 - 8);
  v2[46] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C18);
  v2[47] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267680FA8);
  v2[48] = v4;
  v2[49] = *(void *)(v4 - 8);
  v2[50] = swift_task_alloc();
  v2[32] = a1;
  v2[33] = v1;
  return MEMORY[0x270FA2498](sub_20ACB4030, 0);
}

uint64_t sub_20ACB4030()
{
  v0[31] = v0;
  uint64_t v1 = sub_20ACAF468();
  uint64_t v8 = *v1;
  uint64_t v9 = v1[1];
  swift_bridgeObjectRetain();
  v0[23] = v8;
  v0[24] = v9;
  MEMORY[0x21052B560]();
  sub_20ACAD060();
  if (!v0[19]) {
    return sub_20ACD5340();
  }
  sub_20ACB323C((uint64_t)(v7 + 16), (uint64_t)(v7 + 12));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C88);
  swift_dynamicCast();
  uint64_t v5 = v7[34];
  v7[51] = v5;
  v7[35] = v5;
  swift_bridgeObjectRetain();
  v7[36] = v5;
  sub_20ACB4BD4();
  uint64_t v6 = sub_20ACD5200();
  v7[52] = v6;
  v7[37] = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C60);
  sub_20ACD53F0();
  v7[38] = sub_20ACD4FA0();
  sub_20ACD4EC0();
  sub_20ACB344C();
  sub_20ACB3594();
  sub_20ACD4EB0();
  sub_20ACD4E60();
  swift_release();
  uint64_t v3 = (void *)swift_task_alloc();
  v7[53] = v3;
  *uint64_t v3 = v7[31];
  v3[1] = sub_20ACB437C;
  uint64_t v4 = v7[48];
  return MEMORY[0x270F5D330](v7 + 39, "/Library/Caches/com.apple.xbs/Sources/AppleMediaDiscoveryFramework/Frameworks/AppleMediaDiscovery/DataIntegration/AMDFitcoreDIntegration.swift", 142, 2, 108, v4);
}

uint64_t sub_20ACB437C()
{
  uint64_t v4 = (void *)*v1;
  v4[31] = *v1;
  v4[54] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_20ACB4990;
  }
  else
  {
    (*(void (**)(void, void))(v4[49] + 8))(v4[50], v4[48]);
    uint64_t v2 = sub_20ACB450C;
  }
  return MEMORY[0x270FA2498](v2, 0);
}

uint64_t sub_20ACB450C()
{
  v0[31] = v0;
  v0[42] = v0[39];
  swift_bridgeObjectRetain();
  sub_20ACB4C84();
  sub_20ACD51E0();
  memcpy(v0 + 7, v0 + 2, 0x28uLL);
  for (i = (void *)v0[54]; ; i = 0)
  {
    uint64_t v15 = v17[47];
    uint64_t v16 = v17[44];
    uint64_t v14 = v17[45];
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0CC0);
    sub_20ACD51F0();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v15, 1, v16) == 1) {
      break;
    }
    (*(void (**)(void, void))(v17[45] + 32))(v17[46], v17[47]);
    sub_20ACB4D8C();
    uint64_t v13 = sub_20ACD4CF0();
    if (i)
    {

      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v11 = v13;
      uint64_t v12 = v1;
    }
    uint64_t v9 = v17[46];
    uint64_t v10 = v17[44];
    uint64_t v8 = v17[45];
    v17[25] = v11;
    v17[26] = v12;
    uint64_t v6 = sub_20ACD4BC0();
    uint64_t v7 = v2;
    swift_bridgeObjectRetain();
    v17[27] = v11;
    v17[28] = v12;
    v17[29] = v6;
    v17[30] = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267680FB8);
    sub_20ACD4FD0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  }
  sub_20ACB4D08();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_20ACD5360();
  swift_bridgeObjectRelease();
  sub_20ACB4C58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v17[31] + 8);
  return v3(v5);
}

uint64_t sub_20ACB4990()
{
  id v13 = (id)v0[54];
  uint64_t v1 = v0[50];
  uint64_t v2 = v0[49];
  uint64_t v3 = v0[48];
  v0[31] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  id v4 = v13;
  v0[40] = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
  sub_20ACD53F0();
  uint64_t v10 = v5;
  *uint64_t v5 = sub_20ACD5010();
  v10[1] = v6;
  swift_getErrorValue();
  uint64_t v11 = v0[20];
  uint64_t v12 = v0[21];
  v10[5] = v12;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v10 + 2);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16))(boxed_opaque_existential_0, v11);
  sub_20ACAD01C();
  uint64_t v14 = sub_20ACD4FA0();

  sub_20ACB4C58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v0[31] + 8);
  return v8(v14);
}

unint64_t sub_20ACB4BD4()
{
  uint64_t v2 = qword_26ACA0C90;
  if (!qword_26ACA0C90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACA0C88);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26ACA0C90);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACB4C58()
{
}

unint64_t sub_20ACB4C84()
{
  uint64_t v2 = qword_26ACA0C10;
  if (!qword_26ACA0C10)
  {
    sub_20ACD4CC0();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26ACA0C10);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACB4D08()
{
}

uint64_t sub_20ACB4D48()
{
  return swift_release();
}

unint64_t sub_20ACB4D8C()
{
  uint64_t v2 = qword_267680FB0;
  if (!qword_267680FB0)
  {
    sub_20ACD4CC0();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267680FB0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_20ACB4EB0(void *a1, const void *a2, void *a3)
{
  v3[4] = a3;
  v3[3] = a1;
  v3[2] = v3;
  id v5 = a1;
  v3[5] = _Block_copy(a2);
  id v6 = a3;
  uint64_t v11 = sub_20ACD4F80();
  v3[6] = v11;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v10 + 56) = v7;
  void *v7 = *(void *)(v10 + 16);
  v7[1] = sub_20ACB4FB8;
  return sub_20ACB3E50(v11);
}

uint64_t sub_20ACB4FB8()
{
  uint64_t v7 = *v0;
  id v6 = *(void (***)(void))(*v0 + 40);
  id v4 = *(void **)(*v0 + 32);
  uint64_t v3 = *(void **)(*v0 + 24);
  *(void *)(v7 + 16) = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  id v5 = (id)sub_20ACD4F70();
  v6[2]();

  _Block_release(v6);
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v7 + 16) + 8);
  return v1();
}

uint64_t sub_20ACB51B4()
{
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_20ACB5204()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v8 = (void *)v0[2];
  id v6 = (const void *)v0[3];
  uint64_t v7 = (void *)v0[4];
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = sub_20ACB52F0;
  uint64_t v3 = dword_267680FC0;
  return ((uint64_t (*)(void *, const void *, void *))((char *)&dword_267680FC0 + v3))(v8, v6, v7);
}

uint64_t sub_20ACB52F0()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_20ACB541C(uint64_t a1)
{
  v2[7] = v2;
  v2[8] = 0;
  v2[9] = 0;
  v2[10] = 0;
  v2[11] = 0;
  v2[5] = 0;
  v2[6] = 0;
  uint64_t v3 = sub_20ACD4CE0();
  v2[14] = v3;
  v2[15] = *(void *)(v3 - 8);
  v2[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267680F50);
  v2[17] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267680F58);
  v2[18] = v4;
  v2[19] = *(void *)(v4 - 8);
  v2[20] = swift_task_alloc();
  uint64_t v5 = sub_20ACD4AC0();
  v2[21] = v5;
  v2[22] = *(void *)(v5 - 8);
  v2[23] = swift_task_alloc();
  uint64_t v6 = sub_20ACD4A50();
  v2[24] = v6;
  v2[25] = *(void *)(v6 - 8);
  v2[26] = swift_task_alloc();
  v2[8] = a1;
  v2[9] = v1;
  return MEMORY[0x270FA2498](sub_20ACB56B0, 0);
}

uint64_t sub_20ACB56B0()
{
  *(void *)(v0 + 56) = v0;
  sub_20ACB33D8();
  sub_20ACB5F98();
  sub_20ACD4A40();
  *(void *)(v0 + 80) = sub_20ACD53F0();
  sub_20ACD4EC0();
  sub_20ACB344C();
  sub_20ACB3594();
  sub_20ACD4EB0();
  sub_20ACD4E70();
  swift_release();
  uint64_t v1 = (void *)swift_task_alloc();
  v5[27] = v1;
  *uint64_t v1 = v5[7];
  v1[1] = sub_20ACB582C;
  uint64_t v2 = v5[23];
  uint64_t v3 = v5[18];
  return MEMORY[0x270F5D330](v2, "/Library/Caches/com.apple.xbs/Sources/AppleMediaDiscoveryFramework/Frameworks/AppleMediaDiscovery/DataIntegration/AMDFitcoreDIntegration.swift", 142, 2, 130, v3);
}

uint64_t sub_20ACB582C()
{
  uint64_t v4 = (void *)*v1;
  v4[7] = *v1;
  v4[28] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_20ACB5D34;
  }
  else
  {
    (*(void (**)(void, void))(v4[19] + 8))(v4[20], v4[18]);
    uint64_t v2 = sub_20ACB59BC;
  }
  return MEMORY[0x270FA2498](v2, 0);
}

uint64_t sub_20ACB59BC()
{
  *(void *)(v0 + 56) = v0;
  *(void *)(v0 + 104) = sub_20ACD4AB0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267680F78);
  sub_20ACB3794();
  sub_20ACD5210();
  while (1)
  {
    uint64_t v18 = v20[17];
    uint64_t v19 = v20[14];
    uint64_t v17 = v20[15];
    __swift_instantiateConcreteTypeFromMangledName(&qword_267680F88);
    sub_20ACD5300();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v18, 1, v19) == 1) {
      break;
    }
    uint64_t v15 = v20[16];
    uint64_t v16 = v20[14];
    uint64_t v14 = v20[15];
    (*(void (**)(uint64_t, void))(v14 + 32))(v15, v20[17]);
    sub_20ACD4CD0();
    sub_20ACD5140();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v16);
  }
  uint64_t v12 = v20[26];
  uint64_t v11 = v20[24];
  uint64_t v7 = v20[23];
  uint64_t v6 = v20[21];
  uint64_t v10 = v20[25];
  uint64_t v5 = v20[22];
  sub_20ACB3818();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
  sub_20ACD53F0();
  uint64_t v8 = v1;
  *uint64_t v1 = sub_20ACD5010();
  v8[1] = v2;
  uint64_t v9 = v20[10];
  swift_bridgeObjectRetain();
  v8[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C88);
  v8[2] = v9;
  sub_20ACAD01C();
  uint64_t v13 = sub_20ACD4FA0();
  sub_20ACB364C();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v12, v11);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v20[7] + 8);
  return v3(v13);
}

uint64_t sub_20ACB5D34()
{
  id v13 = (id)v0[28];
  uint64_t v16 = v0[26];
  uint64_t v14 = v0[25];
  uint64_t v15 = v0[24];
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[18];
  v0[7] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  id v4 = v13;
  v0[11] = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
  sub_20ACD53F0();
  uint64_t v10 = v5;
  *uint64_t v5 = sub_20ACD5010();
  v10[1] = v6;
  swift_getErrorValue();
  uint64_t v11 = v0[2];
  uint64_t v12 = v0[3];
  v10[5] = v12;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v10 + 2);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16))(boxed_opaque_existential_0, v11);
  sub_20ACAD01C();
  uint64_t v17 = sub_20ACD4FA0();

  sub_20ACB364C();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v16, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v0[7] + 8);
  return v8(v17);
}

uint64_t sub_20ACB5F98()
{
  uint64_t v3 = sub_20ACC08BC(0);
  if (sub_20ACC099C(v3)) {
    return sub_20ACC09A4(v3);
  }
  swift_bridgeObjectRelease();
  uint64_t v1 = MEMORY[0x263F8EE88];
  swift_retain();
  return v1;
}

uint64_t sub_20ACB60AC(void *a1, const void *a2, void *a3)
{
  v3[4] = a3;
  v3[3] = a1;
  v3[2] = v3;
  id v5 = a1;
  v3[5] = _Block_copy(a2);
  id v6 = a3;
  uint64_t v11 = sub_20ACD4F80();
  v3[6] = v11;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v10 + 56) = v7;
  void *v7 = *(void *)(v10 + 16);
  v7[1] = sub_20ACB61B4;
  return sub_20ACB541C(v11);
}

uint64_t sub_20ACB61B4()
{
  uint64_t v7 = *v0;
  id v6 = *(void (***)(void))(*v0 + 40);
  id v4 = *(void **)(*v0 + 32);
  uint64_t v3 = *(void **)(*v0 + 24);
  *(void *)(v7 + 16) = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  id v5 = (id)sub_20ACD4F70();
  v6[2]();

  _Block_release(v6);
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v7 + 16) + 8);
  return v1();
}

uint64_t sub_20ACB63B0()
{
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_20ACB6400()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v8 = (void *)v0[2];
  id v6 = (const void *)v0[3];
  uint64_t v7 = (void *)v0[4];
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = sub_20ACB64EC;
  uint64_t v3 = dword_267680FD8;
  return ((uint64_t (*)(void *, const void *, void *))((char *)&dword_267680FD8 + v3))(v8, v6, v7);
}

uint64_t sub_20ACB64EC()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_20ACB6618()
{
  v1[8] = v0;
  v1[2] = v1;
  v1[3] = 0;
  v1[5] = 0;
  v1[7] = 0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C20);
  v1[9] = v2;
  v1[10] = *(void *)(v2 - 8);
  v1[11] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C28);
  v1[12] = v3;
  v1[13] = *(void *)(v3 - 8);
  v1[14] = swift_task_alloc();
  v1[3] = v0;
  return MEMORY[0x270FA2498](sub_20ACB6780, 0);
}

uint64_t sub_20ACB6780()
{
  uint64_t v1 = (void *)v0[8];
  v0[2] = v0;
  id v5 = self;
  (*(void (**)(void))((*v1 & *MEMORY[0x263F8EED0]) + 0x78))();
  sub_20ACD52F0();
  id v6 = (id)sub_20ACD50D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v5, sel_deleteEventsWithPredicate_forStreams_, 0, v6);

  sub_20ACD4F80();
  swift_bridgeObjectRelease();

  v0[15] = sub_20ACD4EC0();
  sub_20ACB344C();
  sub_20ACB3594();
  v0[16] = sub_20ACD4EB0();
  uint64_t v2 = v1;
  uint64_t v9 = swift_task_alloc();
  v0[17] = v9;
  *(void *)(v9 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v8 + 144) = v3;
  *uint64_t v3 = *(void *)(v8 + 16);
  v3[1] = sub_20ACB69A4;
  return MEMORY[0x270F5DA80](&unk_267680FF8, v9);
}

uint64_t sub_20ACB69A4()
{
  id v5 = (void *)*v1;
  v5[2] = *v1;
  v5[19] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_20ACB740C;
  }
  else
  {
    uint64_t v4 = (void *)v5[8];
    swift_task_dealloc();

    swift_release();
    uint64_t v2 = sub_20ACB6B40;
  }
  return MEMORY[0x270FA2498](v2, 0);
}

uint64_t sub_20ACB6B40()
{
  *(void *)(v0 + 16) = v0;
  sub_20ACB344C();
  sub_20ACB3594();
  sub_20ACD4EB0();
  sub_20ACD4E80();
  swift_release();
  uint64_t v1 = (void *)swift_task_alloc();
  v4[20] = v1;
  *uint64_t v1 = v4[2];
  v1[1] = sub_20ACB6C64;
  uint64_t v2 = v4[12];
  return MEMORY[0x270F5D330](v4 + 4, "/Library/Caches/com.apple.xbs/Sources/AppleMediaDiscoveryFramework/Frameworks/AppleMediaDiscovery/DataIntegration/AMDFitcoreDIntegration.swift", 142, 2, 152, v2);
}

uint64_t sub_20ACB6C64()
{
  uint64_t v4 = (void *)*v1;
  v4[2] = *v1;
  v4[21] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_20ACB74E4;
  }
  else
  {
    (*(void (**)(void, void))(v4[13] + 8))(v4[14], v4[12]);
    uint64_t v2 = sub_20ACB6DF4;
  }
  return MEMORY[0x270FA2498](v2, 0);
}

uint64_t sub_20ACB6DF4()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = (void *)v0[8];
  v0[2] = v0;
  uint64_t v8 = v0[4];
  v0[22] = v8;
  v0[5] = v8;
  (*(void (**)(void))((*v2 & *MEMORY[0x263F8EED0]) + 0xC0))();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)())(v7[2] + 8);
    return v5();
  }
  else
  {
    sub_20ACB344C();
    sub_20ACB3594();
    sub_20ACD4EB0();
    sub_20ACD4EA0();
    swift_release();
    uint64_t v3 = (void *)swift_task_alloc();
    v7[23] = v3;
    *uint64_t v3 = v7[2];
    v3[1] = sub_20ACB7034;
    uint64_t v4 = v7[9];
    return MEMORY[0x270F5D330](v7 + 6, "/Library/Caches/com.apple.xbs/Sources/AppleMediaDiscoveryFramework/Frameworks/AppleMediaDiscovery/DataIntegration/AMDFitcoreDIntegration.swift", 142, 2, 156, v4);
  }
}

uint64_t sub_20ACB7034()
{
  uint64_t v4 = (void *)*v1;
  v4[2] = *v1;
  v4[24] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_20ACB75B4;
  }
  else
  {
    (*(void (**)(void, void))(v4[10] + 8))(v4[11], v4[9]);
    uint64_t v2 = sub_20ACB71C4;
  }
  return MEMORY[0x270FA2498](v2, 0);
}

uint64_t sub_20ACB71C4()
{
  uint64_t v1 = v0[24];
  uint64_t v2 = (void *)v0[8];
  v0[2] = v0;
  v0[7] = v0[6];
  uint64_t v3 = (*(uint64_t (**)(void))((*v2 & *MEMORY[0x263F8EED0]) + 0xB8))();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = v7;
    uint64_t v5 = *(uint64_t (**)(uint64_t))(*(void *)(v9 + 16) + 8);
  }
  else
  {
    uint64_t v8 = (*(uint64_t (**)(uint64_t))((**(void **)(v9 + 64) & *MEMORY[0x263F8EED0]) + 0x60))(v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = v8;
    uint64_t v5 = *(uint64_t (**)(uint64_t))(*(void *)(v9 + 16) + 8);
  }
  return v5(v4);
}

uint64_t sub_20ACB740C()
{
  id v3 = *(id *)(v0 + 64);
  *(void *)(v0 + 16) = v0;
  swift_task_dealloc();

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)())(*(void *)(v0 + 16) + 8);
  return v1();
}

uint64_t sub_20ACB74E4()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[12];
  v0[2] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)())(v0[2] + 8);
  return v4();
}

uint64_t sub_20ACB75B4()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[9];
  v0[2] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)())(v0[2] + 8);
  return v4();
}

uint64_t sub_20ACB7698(uint64_t a1, uint64_t a2)
{
  v2[6] = a2;
  v2[5] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  v2[3] = a1;
  v2[4] = a2;
  return MEMORY[0x270FA2498](sub_20ACB76E8, 0);
}

uint64_t sub_20ACB76E8()
{
  uint64_t v1 = (void *)v0[6];
  uint64_t v2 = v0[5];
  v0[2] = v0;
  (*(void (**)(uint64_t))((*v1 & *MEMORY[0x263F8EED0]) + 0xC8))(v2);
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(v5 + 16) + 8);
  return v3();
}

uint64_t sub_20ACB7850(uint64_t a1)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_20ACB7910;
  return sub_20ACB7698(a1, v6);
}

uint64_t sub_20ACB7910()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_20ACB7AC4(const void *a1, void *a2)
{
  v2[3] = a2;
  v2[2] = v2;
  v2[4] = _Block_copy(a1);
  id v4 = a2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v7 + 40) = v5;
  *uint64_t v5 = *(void *)(v7 + 16);
  v5[1] = sub_20ACB7B88;
  return sub_20ACB6618();
}

uint64_t sub_20ACB7B88()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 16) = *v1;
  uint64_t v10 = v2 + 16;
  uint64_t v11 = v2 + 16;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v6 = *(void (***)(void *, void))(v10 + 16);
    id v5 = (id)sub_20ACD4960();
    v6[2](v6, 0);

    _Block_release(v6);
  }
  else
  {
    aBlock = *(void (***)(void))(v10 + 16);
    id v7 = (id)sub_20ACD4F70();
    aBlock[2]();

    _Block_release(aBlock);
    swift_bridgeObjectRelease();
  }

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)v11 + 8);
  return v3();
}

uint64_t sub_20ACB7D8C()
{
  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_20ACB7DD4()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  id v7 = *(const void **)(v0 + 16);
  uint64_t v6 = *(void **)(v0 + 24);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = sub_20ACB7EB4;
  uint64_t v3 = dword_267681000;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_267681000 + v3))(v7, v6);
}

uint64_t sub_20ACB7EB4()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_20ACB7FE0(uint64_t a1)
{
  v2[31] = v1;
  v2[30] = a1;
  v2[21] = v2;
  v2[22] = 0;
  v2[23] = 0;
  v2[24] = 0;
  v2[26] = 0;
  v2[28] = 0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267680FA8);
  v2[32] = v3;
  v2[33] = *(void *)(v3 - 8);
  v2[34] = swift_task_alloc();
  v2[22] = a1;
  v2[23] = v1;
  return MEMORY[0x270FA2498](sub_20ACB8104, 0);
}

uint64_t sub_20ACB8104()
{
  v0[21] = v0;
  v0[17] = sub_20ACD5010();
  v0[18] = v1;
  MEMORY[0x21052B560]();
  sub_20ACAD060();
  if (v0[5])
  {
    sub_20ACB3678((uint64_t)(v7 + 2));
    v7[19] = sub_20ACD5010();
    v7[20] = v2;
    MEMORY[0x21052B560]();
    sub_20ACAD060();
    if (!v7[13]) {
      return sub_20ACD5340();
    }
    sub_20ACB323C((uint64_t)(v7 + 10), (uint64_t)(v7 + 6));
    swift_dynamicCast();
    uint64_t v6 = v7[29];
  }
  else
  {
    sub_20ACB3678((uint64_t)(v7 + 2));
    uint64_t v6 = 1000;
  }
  v7[24] = v6;
  sub_20ACD4EC0();
  sub_20ACB344C();
  sub_20ACB3594();
  sub_20ACD4EB0();
  sub_20ACD4E50();
  swift_release();
  uint64_t v4 = (void *)swift_task_alloc();
  v7[35] = v4;
  *uint64_t v4 = v7[21];
  v4[1] = sub_20ACB84BC;
  uint64_t v5 = v7[32];
  return MEMORY[0x270F5D330](v7 + 25, "/Library/Caches/com.apple.xbs/Sources/AppleMediaDiscoveryFramework/Frameworks/AppleMediaDiscovery/DataIntegration/AMDFitcoreDIntegration.swift", 142, 2, 170, v5);
}

uint64_t sub_20ACB84BC()
{
  uint64_t v4 = (void *)*v1;
  v4[21] = *v1;
  v4[36] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_20ACB8948;
  }
  else
  {
    (*(void (**)(void, void))(v4[33] + 8))(v4[34], v4[32]);
    uint64_t v2 = sub_20ACB864C;
  }
  return MEMORY[0x270FA2498](v2, 0);
}

uint64_t sub_20ACB864C()
{
  uint64_t v1 = (void *)v0[36];
  uint64_t v2 = (void *)v0[31];
  v0[21] = v0;
  v0[28] = v0[25];
  (*(void (**)(void))((*v2 & *MEMORY[0x263F8EED0]) + 0xC8))();
  if (v1)
  {
    swift_bridgeObjectRelease();
    id v7 = v1;
    v17[26] = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
    sub_20ACD53F0();
    uint64_t v11 = v8;
    uint64_t v12 = v8 + 2;
    *uint64_t v8 = sub_20ACD5010();
    v11[1] = v9;
    swift_getErrorValue();
    uint64_t v13 = v17[14];
    uint64_t v14 = v17[15];
    uint64_t v11[5] = v14;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v12);
    (*(void (**)(uint64_t *, uint64_t))(*(void *)(v14 - 8) + 16))(boxed_opaque_existential_0, v13);
    sub_20ACAD01C();
    uint64_t v15 = sub_20ACD4FA0();

    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v3 = (void *)v17[31];
    uint64_t v4 = swift_bridgeObjectRelease();
    uint64_t v16 = (*(uint64_t (**)(uint64_t))((*v3 & *MEMORY[0x263F8EED0]) + 0x60))(v4);
  }
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v17[21] + 8);
  return v5(v16);
}

uint64_t sub_20ACB8948()
{
  uint64_t v1 = v0[34];
  uint64_t v2 = v0[33];
  uint64_t v3 = v0[32];
  v0[21] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  id v13 = (id)v0[36];
  id v4 = v13;
  v0[26] = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
  sub_20ACD53F0();
  uint64_t v10 = v5;
  *uint64_t v5 = sub_20ACD5010();
  v10[1] = v6;
  swift_getErrorValue();
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[15];
  v10[5] = v12;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v10 + 2);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16))(boxed_opaque_existential_0, v11);
  sub_20ACAD01C();
  uint64_t v14 = sub_20ACD4FA0();

  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v0[21] + 8);
  return v8(v14);
}

uint64_t sub_20ACB8BE4(void *a1, const void *a2, void *a3)
{
  v3[4] = a3;
  v3[3] = a1;
  v3[2] = v3;
  id v5 = a1;
  v3[5] = _Block_copy(a2);
  id v6 = a3;
  uint64_t v11 = sub_20ACD4F80();
  v3[6] = v11;
  id v7 = (void *)swift_task_alloc();
  *(void *)(v10 + 56) = v7;
  void *v7 = *(void *)(v10 + 16);
  v7[1] = sub_20ACB8CEC;
  return sub_20ACB7FE0(v11);
}

uint64_t sub_20ACB8CEC()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 16) = *v1;
  uint64_t v12 = (void *)(v2 + 16);
  uint64_t v13 = v2 + 16;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v8 = (void (**)(void *, void))v12[3];
    id v7 = (id)sub_20ACD4960();
    v8[2](v8, 0);

    _Block_release(v8);
  }
  else
  {
    aBlock = (void (**)(void))v12[3];
    id v9 = (id)sub_20ACD4F70();
    aBlock[2]();

    _Block_release(aBlock);
    swift_bridgeObjectRelease();
  }
  id v6 = (void *)v12[2];
  id v5 = (void *)v12[1];
  swift_bridgeObjectRelease();

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)v13 + 8);
  return v3();
}

uint64_t sub_20ACB8F10()
{
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_20ACB8F60()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v8 = (void *)v0[2];
  id v6 = (const void *)v0[3];
  id v7 = (void *)v0[4];
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = sub_20ACB904C;
  uint64_t v3 = dword_267681018;
  return ((uint64_t (*)(void *, const void *, void *))((char *)&dword_267681018 + v3))(v8, v6, v7);
}

uint64_t sub_20ACB904C()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t *sub_20ACB9178(uint64_t a1)
{
  uint64_t v51 = a1;
  v63 = 0;
  uint64_t v62 = 0;
  uint64_t v61 = 0;
  uint64_t v60 = 0;
  v52 = __b;
  size_t v54 = 40;
  memset(__b, 0, sizeof(__b));
  uint64_t v58 = 0;
  uint64_t v49 = 0;
  uint64_t v50 = sub_20ACD4AA0();
  uint64_t v43 = *(void *)(v50 - 8);
  uint64_t v44 = v50 - 8;
  unint64_t v45 = (*(void *)(v43 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v50);
  uint64_t v46 = (char *)&v23 - v45;
  v63 = (char *)&v23 - v45;
  unint64_t v47 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0BF0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v51);
  uint64_t v48 = (char *)&v23 - v47;
  uint64_t v62 = v2;
  uint64_t v61 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B38);
  uint64_t v60 = sub_20ACD53F0();
  swift_bridgeObjectRetain();
  sub_20ACB970C();
  uint64_t v53 = &v64;
  sub_20ACD51E0();
  uint64_t v3 = v55;
  memcpy(v52, v53, v54);
  for (uint64_t i = v3; ; uint64_t i = v41)
  {
    uint64_t v41 = i;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0CB0);
    sub_20ACD51F0();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v48, 1, v50) == 1) {
      break;
    }
    (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v46, v48, v50);
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
    uint64_t v37 = sub_20ACD53F0();
    v36 = v4;
    uint64_t v5 = sub_20ACD5010();
    id v6 = v36;
    uint64_t *v36 = v5;
    v6[1] = v7;
    uint64_t v8 = sub_20ACD4A90();
    uint64_t v9 = v36;
    uint64_t v39 = MEMORY[0x263F8D310];
    v36[5] = MEMORY[0x263F8D310];
    v9[2] = v8;
    v9[3] = v10;
    sub_20ACAD01C();
    uint64_t v11 = sub_20ACD4FA0();
    uint64_t v40 = &v57;
    uint64_t v57 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C78);
    sub_20ACD5130();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v46, v50);
  }
  uint64_t v12 = v42;
  sub_20ACB9790();
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C68);
  uint64_t v27 = sub_20ACD53F0();
  uint64_t v24 = v13;
  uint64_t v25 = v13 + 2;
  uint64_t v14 = sub_20ACD5010();
  uint64_t v15 = v24;
  uint64_t v17 = v16;
  uint64_t v18 = v25;
  *uint64_t v24 = v14;
  v15[1] = v17;
  sub_20ACB97D0(&v60, v18);
  uint64_t v19 = v27;
  sub_20ACAD01C();
  uint64_t v28 = v19;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C78);
  uint64_t v31 = MEMORY[0x263F8D310];
  uint64_t v32 = MEMORY[0x263F8D320];
  uint64_t v29 = sub_20ACD4FA0();
  uint64_t v58 = v29;
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_20ACD5360();
  uint64_t v21 = v41;
  uint64_t v33 = v20;
  (*(void (**)(void))((*v12 & *MEMORY[0x263F8EED0]) + 0xD8))();
  uint64_t v34 = v21;
  uint64_t v35 = v21;
  if (v21) {
    uint64_t v23 = v35;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __n128 result = &v60;
  sub_20ACB9808();
  return result;
}

unint64_t sub_20ACB970C()
{
  uint64_t v2 = qword_26ACA0BE8;
  if (!qword_26ACA0BE8)
  {
    sub_20ACD4AA0();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26ACA0BE8);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACB9790()
{
}

void *sub_20ACB97D0(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  swift_bridgeObjectRetain();
  __n128 result = a2;
  *a2 = v4;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACB9808()
{
}

uint64_t *sub_20ACB9834(uint64_t a1)
{
  uint64_t v318 = a1;
  v399 = 0;
  v398 = 0;
  v397 = 0;
  uint64_t v396 = 0;
  uint64_t v395 = 0;
  uint64_t v394 = 0;
  uint64_t v393 = 0;
  uint64_t v392 = 0;
  uint64_t v391 = 0;
  uint64_t v390 = 0;
  uint64_t v389 = 0;
  uint64_t v388 = 0;
  uint64_t v387 = 0;
  v319 = __b;
  size_t v321 = 40;
  memset(__b, 0, sizeof(__b));
  uint64_t v385 = 0;
  uint64_t v378 = 0;
  uint64_t v379 = 0;
  uint64_t v373 = 0;
  uint64_t v374 = 0;
  uint64_t v368 = 0;
  uint64_t v369 = 0;
  uint64_t v363 = 0;
  uint64_t v364 = 0;
  uint64_t v358 = 0;
  uint64_t v359 = 0;
  uint64_t v353 = 0;
  uint64_t v354 = 0;
  uint64_t v348 = 0;
  uint64_t v349 = 0;
  uint64_t v343 = 0;
  uint64_t v344 = 0;
  uint64_t v340 = 0;
  uint64_t v341 = 0;
  uint64_t v337 = 0;
  uint64_t v338 = 0;
  uint64_t v334 = 0;
  uint64_t v335 = 0;
  uint64_t v331 = 0;
  uint64_t v332 = 0;
  uint64_t v328 = 0;
  uint64_t v329 = 0;
  uint64_t v325 = 0;
  uint64_t v326 = 0;
  uint64_t v316 = 0;
  uint64_t v295 = sub_20ACD4950();
  uint64_t v296 = *(void *)(v295 - 8);
  uint64_t v297 = v295 - 8;
  unint64_t v298 = (*(void *)(v296 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v295);
  v299 = (char *)&v166 - v298;
  unint64_t v300 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0BC0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v316);
  v301 = (char *)&v166 - v300;
  unint64_t v302 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  v303 = (char *)&v166 - v302;
  v399 = (char *)&v166 - v302;
  uint64_t v304 = sub_20ACD4A20();
  uint64_t v305 = *(void *)(v304 - 8);
  uint64_t v306 = v304 - 8;
  unint64_t v307 = (*(void *)(v305 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v316);
  v308 = (char *)&v166 - v307;
  v398 = (char *)&v166 - v307;
  uint64_t v317 = sub_20ACD4BB0();
  uint64_t v309 = *(void *)(v317 - 8);
  uint64_t v310 = v317 - 8;
  unint64_t v311 = (*(void *)(v309 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v317);
  v312 = (char *)&v166 - v311;
  v397 = (char *)&v166 - v311;
  unint64_t v313 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C08) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v318);
  v314 = (char *)&v166 - v313;
  uint64_t v396 = v4;
  uint64_t v395 = v1;
  uint64_t v315 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B38);
  uint64_t v394 = sub_20ACD53F0();
  uint64_t v393 = sub_20ACD53F0();
  uint64_t v392 = sub_20ACD53F0();
  uint64_t v391 = sub_20ACD53F0();
  uint64_t v390 = sub_20ACD53F0();
  uint64_t v389 = sub_20ACD53F0();
  uint64_t v388 = sub_20ACD53F0();
  uint64_t v387 = sub_20ACD53F0();
  swift_bridgeObjectRetain();
  sub_20ACBB040();
  v320 = &v400;
  sub_20ACD51E0();
  uint64_t v5 = v322;
  memcpy(v319, v320, v321);
  for (uint64_t i = v5; ; uint64_t i = v197)
  {
    uint64_t v293 = i;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0CB8);
    sub_20ACD51F0();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v309 + 48))(v314, 1, v317) == 1) {
      break;
    }
    (*(void (**)(char *, char *, uint64_t))(v309 + 32))(v312, v314, v317);
    sub_20ACD4A10();
    sub_20ACD4B20();
    sub_20ACD4A00();
    (*(void (**)(char *, uint64_t))(v296 + 8))(v299, v295);
    uint64_t v279 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
    uint64_t v280 = sub_20ACD53F0();
    v288 = v6;
    unsigned int v289 = 1;
    uint64_t v7 = sub_20ACD5010();
    uint64_t v8 = v288;
    uint64_t *v288 = v7;
    v8[1] = v9;
    uint64_t v10 = sub_20ACD4B10();
    uint64_t v12 = v11;
    uint64_t v13 = v288;
    uint64_t v281 = MEMORY[0x263F8D310];
    v288[5] = MEMORY[0x263F8D310];
    v13[2] = v10;
    v13[3] = v12;
    v282 = v13 + 8;
    uint64_t v14 = sub_20ACD5010();
    uint64_t v15 = v288;
    v288[6] = v14;
    v15[7] = v16;
    uint64_t v286 = sub_20ACD4B30();
    uint64_t v284 = v17;
    int v285 = v18;
    sub_20ACBB104(v286, v17, v18 & 1);
    v283 = v383;
    v383[0] = v286;
    v383[1] = v284;
    char v384 = v285 & 1 & v289;
    v288[11] = v281;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0BC8);
    sub_20ACD4A30();
    sub_20ACBB138((uint64_t)v283);
    sub_20ACBB174(v286, v284, v285 & 1);
    v287 = v288 + 14;
    uint64_t v19 = sub_20ACD5010();
    uint64_t v20 = v288;
    uint64_t v21 = v19;
    uint64_t v22 = v303;
    uint64_t v24 = v23;
    uint64_t v25 = v301;
    v288[12] = v21;
    v20[13] = v24;
    sub_20ACBB1A8(v22, v25);
    uint64_t v290 = sub_20ACD49F0();
    uint64_t v291 = *(void *)(v290 - 8);
    uint64_t v292 = v290 - 8;
    if ((*(unsigned int (**)(char *, void))(v291 + 48))(v301, v289) == 1)
    {
      sub_20ACBB2D0((uint64_t)v301);
      memset(v381, 0, sizeof(v381));
      uint64_t v382 = 0;
    }
    else
    {
      sub_20ACD49E0();
      uint64_t v382 = MEMORY[0x263F8D538];
      v381[0] = v26;
      (*(void (**)(char *, uint64_t))(v291 + 8))(v301, v290);
    }
    if (v382)
    {
      sub_20ACB323C((uint64_t)v381, (uint64_t)v287);
    }
    else
    {
      uint64_t v27 = v288;
      v288[17] = MEMORY[0x263F8D6C8];
      v27[14] = 0;
      sub_20ACB3678((uint64_t)v381);
    }
    sub_20ACAD01C();
    uint64_t v28 = sub_20ACD4FA0();
    v274 = &v380;
    uint64_t v380 = v28;
    uint64_t v275 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C78);
    sub_20ACD5130();
    uint64_t v377 = sub_20ACD4BA0();
    uint64_t v276 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C88);
    unint64_t v277 = sub_20ACBB380();
    sub_20ACD5210();
    for (uint64_t j = v293; ; uint64_t j = v270)
    {
      uint64_t v270 = j;
      uint64_t v271 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0CD8);
      sub_20ACD5300();
      uint64_t v272 = v375;
      uint64_t v273 = v376;
      if (!v376) {
        break;
      }
      uint64_t v268 = v272;
      uint64_t v269 = v273;
      uint64_t v267 = v273;
      uint64_t v264 = v272;
      uint64_t v325 = v272;
      uint64_t v326 = v273;
      uint64_t v263 = sub_20ACD53F0();
      v265 = v29;
      int v262 = 1;
      uint64_t v30 = sub_20ACD5010();
      uint64_t v31 = v265;
      uint64_t *v265 = v30;
      v31[1] = v32;
      uint64_t v33 = sub_20ACD4B10();
      uint64_t v34 = v265;
      uint64_t v266 = MEMORY[0x263F8D310];
      v265[5] = MEMORY[0x263F8D310];
      v34[2] = v33;
      v34[3] = v35;
      uint64_t v36 = sub_20ACD5010();
      uint64_t v37 = v265;
      v265[6] = v36;
      v37[7] = v38;
      swift_bridgeObjectRetain();
      uint64_t v39 = v264;
      uint64_t v40 = v265;
      uint64_t v41 = v267;
      v265[11] = v266;
      v40[8] = v39;
      v40[9] = v41;
      sub_20ACAD01C();
      uint64_t v324 = sub_20ACD4FA0();
      sub_20ACD5130();
      swift_bridgeObjectRelease();
    }
    sub_20ACBB404();
    uint64_t v372 = sub_20ACD4B80();
    sub_20ACD5210();
    for (uint64_t k = v270; ; uint64_t k = v258)
    {
      uint64_t v258 = k;
      sub_20ACD5300();
      uint64_t v259 = v370;
      uint64_t v260 = v371;
      if (!v371) {
        break;
      }
      uint64_t v256 = v259;
      uint64_t v257 = v260;
      uint64_t v255 = v260;
      uint64_t v252 = v259;
      uint64_t v328 = v259;
      uint64_t v329 = v260;
      uint64_t v251 = sub_20ACD53F0();
      v253 = v42;
      int v250 = 1;
      uint64_t v43 = sub_20ACD5010();
      uint64_t v44 = v253;
      uint64_t *v253 = v43;
      v44[1] = v45;
      uint64_t v46 = sub_20ACD4B10();
      unint64_t v47 = v253;
      uint64_t v254 = MEMORY[0x263F8D310];
      v253[5] = MEMORY[0x263F8D310];
      v47[2] = v46;
      v47[3] = v48;
      uint64_t v49 = sub_20ACD5010();
      uint64_t v50 = v253;
      v253[6] = v49;
      v50[7] = v51;
      swift_bridgeObjectRetain();
      uint64_t v52 = v252;
      uint64_t v53 = v253;
      uint64_t v54 = v255;
      v253[11] = v254;
      v53[8] = v52;
      v53[9] = v54;
      sub_20ACAD01C();
      uint64_t v327 = sub_20ACD4FA0();
      sub_20ACD5130();
      swift_bridgeObjectRelease();
    }
    sub_20ACBB404();
    uint64_t v367 = sub_20ACD4B70();
    sub_20ACD5210();
    for (uint64_t m = v258; ; uint64_t m = v246)
    {
      uint64_t v246 = m;
      sub_20ACD5300();
      uint64_t v247 = v365;
      uint64_t v248 = v366;
      if (!v366) {
        break;
      }
      uint64_t v244 = v247;
      uint64_t v245 = v248;
      uint64_t v243 = v248;
      uint64_t v240 = v247;
      uint64_t v331 = v247;
      uint64_t v332 = v248;
      uint64_t v239 = sub_20ACD53F0();
      v241 = v55;
      int v238 = 1;
      uint64_t v56 = sub_20ACD5010();
      uint64_t v57 = v241;
      uint64_t *v241 = v56;
      v57[1] = v58;
      uint64_t v59 = sub_20ACD4B10();
      uint64_t v60 = v241;
      uint64_t v242 = MEMORY[0x263F8D310];
      v241[5] = MEMORY[0x263F8D310];
      v60[2] = v59;
      v60[3] = v61;
      uint64_t v62 = sub_20ACD5010();
      v63 = v241;
      v241[6] = v62;
      v63[7] = v64;
      swift_bridgeObjectRetain();
      uint64_t v65 = v240;
      v66 = v241;
      uint64_t v67 = v243;
      v241[11] = v242;
      v66[8] = v65;
      v66[9] = v67;
      sub_20ACAD01C();
      uint64_t v330 = sub_20ACD4FA0();
      sub_20ACD5130();
      swift_bridgeObjectRelease();
    }
    sub_20ACBB404();
    uint64_t v362 = sub_20ACD4B90();
    sub_20ACD5210();
    for (uint64_t n = v246; ; uint64_t n = v234)
    {
      uint64_t v234 = n;
      sub_20ACD5300();
      uint64_t v235 = v360;
      uint64_t v236 = v361;
      if (!v361) {
        break;
      }
      uint64_t v232 = v235;
      uint64_t v233 = v236;
      uint64_t v231 = v236;
      uint64_t v228 = v235;
      uint64_t v334 = v235;
      uint64_t v335 = v236;
      uint64_t v227 = sub_20ACD53F0();
      v229 = v68;
      int v226 = 1;
      uint64_t v69 = sub_20ACD5010();
      uint64_t v70 = v229;
      uint64_t *v229 = v69;
      v70[1] = v71;
      uint64_t v72 = sub_20ACD4B10();
      char v73 = v229;
      uint64_t v230 = MEMORY[0x263F8D310];
      v229[5] = MEMORY[0x263F8D310];
      v73[2] = v72;
      v73[3] = v74;
      uint64_t v75 = sub_20ACD5010();
      char v76 = v229;
      v229[6] = v75;
      v76[7] = v77;
      swift_bridgeObjectRetain();
      uint64_t v78 = v228;
      v79 = v229;
      uint64_t v80 = v231;
      v229[11] = v230;
      v79[8] = v78;
      v79[9] = v80;
      sub_20ACAD01C();
      uint64_t v333 = sub_20ACD4FA0();
      sub_20ACD5130();
      swift_bridgeObjectRelease();
    }
    sub_20ACBB404();
    uint64_t v357 = sub_20ACD4B40();
    sub_20ACD5210();
    for (iuint64_t i = v234; ; iuint64_t i = v222)
    {
      uint64_t v222 = ii;
      sub_20ACD5300();
      uint64_t v223 = v355;
      uint64_t v224 = v356;
      if (!v356) {
        break;
      }
      uint64_t v220 = v223;
      uint64_t v221 = v224;
      uint64_t v219 = v224;
      uint64_t v216 = v223;
      uint64_t v337 = v223;
      uint64_t v338 = v224;
      uint64_t v215 = sub_20ACD53F0();
      v217 = v81;
      int v214 = 1;
      uint64_t v82 = sub_20ACD5010();
      v83 = v217;
      uint64_t *v217 = v82;
      v83[1] = v84;
      uint64_t v85 = sub_20ACD4B10();
      v86 = v217;
      uint64_t v218 = MEMORY[0x263F8D310];
      v217[5] = MEMORY[0x263F8D310];
      v86[2] = v85;
      v86[3] = v87;
      uint64_t v88 = sub_20ACD5010();
      v89 = v217;
      v217[6] = v88;
      v89[7] = v90;
      swift_bridgeObjectRetain();
      uint64_t v91 = v216;
      v92 = v217;
      uint64_t v93 = v219;
      v217[11] = v218;
      v92[8] = v91;
      v92[9] = v93;
      sub_20ACAD01C();
      uint64_t v336 = sub_20ACD4FA0();
      sub_20ACD5130();
      swift_bridgeObjectRelease();
    }
    sub_20ACBB404();
    uint64_t v352 = sub_20ACD4B50();
    sub_20ACD5210();
    for (uint64_t jj = v222; ; uint64_t jj = v210)
    {
      uint64_t v210 = jj;
      sub_20ACD5300();
      uint64_t v211 = v350;
      uint64_t v212 = v351;
      if (!v351) {
        break;
      }
      uint64_t v208 = v211;
      uint64_t v209 = v212;
      uint64_t v207 = v212;
      uint64_t v204 = v211;
      uint64_t v340 = v211;
      uint64_t v341 = v212;
      uint64_t v203 = sub_20ACD53F0();
      v205 = v94;
      uint64_t v202 = 17;
      int v201 = 1;
      uint64_t v95 = sub_20ACD5010();
      v96 = v205;
      uint64_t *v205 = v95;
      v96[1] = v97;
      uint64_t v98 = sub_20ACD4B10();
      v99 = v205;
      uint64_t v206 = MEMORY[0x263F8D310];
      v205[5] = MEMORY[0x263F8D310];
      v99[2] = v98;
      v99[3] = v100;
      uint64_t v101 = sub_20ACD5010();
      v102 = v205;
      v205[6] = v101;
      v102[7] = v103;
      swift_bridgeObjectRetain();
      uint64_t v104 = v204;
      v105 = v205;
      uint64_t v106 = v207;
      v205[11] = v206;
      v105[8] = v104;
      v105[9] = v106;
      sub_20ACAD01C();
      uint64_t v339 = sub_20ACD4FA0();
      sub_20ACD5130();
      swift_bridgeObjectRelease();
    }
    sub_20ACBB404();
    uint64_t v347 = sub_20ACD4B60();
    sub_20ACD5210();
    for (uint64_t kk = v210; ; uint64_t kk = v197)
    {
      uint64_t v197 = kk;
      sub_20ACD5300();
      uint64_t v198 = v345;
      uint64_t v199 = v346;
      if (!v346) {
        break;
      }
      uint64_t v195 = v198;
      uint64_t v196 = v199;
      uint64_t v194 = v199;
      uint64_t v191 = v198;
      uint64_t v343 = v198;
      uint64_t v344 = v199;
      uint64_t v190 = sub_20ACD53F0();
      v192 = v107;
      uint64_t v189 = 17;
      int v188 = 1;
      uint64_t v108 = sub_20ACD5010();
      v109 = v192;
      uint64_t *v192 = v108;
      v109[1] = v110;
      uint64_t v111 = sub_20ACD4B10();
      v112 = v192;
      uint64_t v193 = MEMORY[0x263F8D310];
      v192[5] = MEMORY[0x263F8D310];
      v112[2] = v111;
      v112[3] = v113;
      uint64_t v114 = sub_20ACD5010();
      v115 = v192;
      v192[6] = v114;
      v115[7] = v116;
      swift_bridgeObjectRetain();
      uint64_t v117 = v191;
      v118 = v192;
      uint64_t v119 = v194;
      v192[11] = v193;
      v118[8] = v117;
      v118[9] = v119;
      sub_20ACAD01C();
      uint64_t v342 = sub_20ACD4FA0();
      sub_20ACD5130();
      swift_bridgeObjectRelease();
    }
    sub_20ACBB404();
    sub_20ACBB2D0((uint64_t)v303);
    (*(void (**)(char *, uint64_t))(v305 + 8))(v308, v304);
    (*(void (**)(char *, uint64_t))(v309 + 8))(v312, v317);
  }
  v120 = v294;
  sub_20ACBB0C4();
  uint64_t v178 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C68);
  uint64_t v179 = sub_20ACD53F0();
  v176 = v121;
  v167 = v121 + 2;
  int v175 = 1;
  uint64_t v122 = sub_20ACD5010();
  v123 = v176;
  uint64_t v125 = v124;
  v126 = v167;
  uint64_t *v176 = v122;
  v123[1] = v125;
  sub_20ACB97D0(&v394, v126);
  v168 = v176 + 5;
  uint64_t v127 = sub_20ACD5010();
  v128 = v176;
  uint64_t v130 = v129;
  v131 = v168;
  v176[3] = v127;
  v128[4] = v130;
  sub_20ACB97D0(&v393, v131);
  v169 = v176 + 8;
  uint64_t v132 = sub_20ACD5010();
  v133 = v176;
  uint64_t v135 = v134;
  v136 = v169;
  v176[6] = v132;
  v133[7] = v135;
  sub_20ACB97D0(&v392, v136);
  v170 = v176 + 11;
  uint64_t v137 = sub_20ACD5010();
  v138 = v176;
  uint64_t v140 = v139;
  v141 = v170;
  v176[9] = v137;
  v138[10] = v140;
  sub_20ACB97D0(&v391, v141);
  v171 = v176 + 14;
  uint64_t v142 = sub_20ACD5010();
  v143 = v176;
  uint64_t v145 = v144;
  v146 = v171;
  v176[12] = v142;
  v143[13] = v145;
  sub_20ACB97D0(&v390, v146);
  v172 = v176 + 17;
  uint64_t v147 = sub_20ACD5010();
  v148 = v176;
  uint64_t v150 = v149;
  v151 = v172;
  v176[15] = v147;
  v148[16] = v150;
  sub_20ACB97D0(&v389, v151);
  v173 = v176 + 20;
  uint64_t v174 = 21;
  uint64_t v152 = sub_20ACD5010();
  v153 = v176;
  uint64_t v155 = v154;
  v156 = v173;
  v176[18] = v152;
  v153[19] = v155;
  sub_20ACB97D0(&v388, v156);
  v177 = v176 + 23;
  uint64_t v157 = sub_20ACD5010();
  v158 = v176;
  uint64_t v160 = v159;
  v161 = v177;
  v176[21] = v157;
  v158[22] = v160;
  sub_20ACB97D0(&v387, v161);
  uint64_t v162 = v179;
  sub_20ACAD01C();
  uint64_t v180 = v162;
  uint64_t v182 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C78);
  uint64_t v183 = MEMORY[0x263F8D310];
  uint64_t v184 = MEMORY[0x263F8D320];
  uint64_t v181 = sub_20ACD4FA0();
  uint64_t v385 = v181;
  swift_bridgeObjectRetain();
  uint64_t v163 = sub_20ACD5360();
  uint64_t v164 = v293;
  uint64_t v185 = v163;
  (*(void (**)(void))((*v120 & *MEMORY[0x263F8EED0]) + 0xD8))();
  uint64_t v186 = v164;
  uint64_t v187 = v164;
  if (v164) {
    uint64_t v166 = v187;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20ACB9808();
  sub_20ACB9808();
  sub_20ACB9808();
  sub_20ACB9808();
  sub_20ACB9808();
  sub_20ACB9808();
  sub_20ACB9808();
  __n128 result = &v394;
  sub_20ACB9808();
  return result;
}

unint64_t sub_20ACBB040()
{
  uint64_t v2 = qword_26ACA0C00;
  if (!qword_26ACA0C00)
  {
    sub_20ACD4BB0();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26ACA0C00);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACBB0C4()
{
}

uint64_t sub_20ACBB104(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_20ACBB138(uint64_t a1)
{
  return a1;
}

uint64_t sub_20ACBB174(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_20ACBB1A8(const void *a1, void *a2)
{
  uint64_t v6 = sub_20ACD49F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0BC0);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t sub_20ACBB2D0(uint64_t a1)
{
  uint64_t v3 = sub_20ACD49F0();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

unint64_t sub_20ACBB380()
{
  uint64_t v2 = qword_26ACA0C98;
  if (!qword_26ACA0C98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACA0C88);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26ACA0C98);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACBB404()
{
}

uint64_t *sub_20ACBB430(uint64_t a1)
{
  uint64_t v415 = a1;
  v516 = 0;
  v515 = 0;
  v514 = 0;
  uint64_t v513 = 0;
  uint64_t v512 = 0;
  uint64_t v511 = 0;
  uint64_t v510 = 0;
  uint64_t v509 = 0;
  uint64_t v508 = 0;
  uint64_t v507 = 0;
  uint64_t v506 = 0;
  uint64_t v505 = 0;
  uint64_t v504 = 0;
  uint64_t v503 = 0;
  v416 = v502;
  __leuint64_t n = 40;
  int __c = 0;
  memset(v502, 0, sizeof(v502));
  uint64_t v501 = 0;
  uint64_t v500 = 0;
  uint64_t v492 = 0;
  uint64_t v491 = 0;
  uint64_t v488 = 0;
  uint64_t v489 = 0;
  uint64_t v483 = 0;
  uint64_t v484 = 0;
  uint64_t v478 = 0;
  uint64_t v479 = 0;
  uint64_t v473 = 0;
  uint64_t v474 = 0;
  uint64_t v468 = 0;
  uint64_t v469 = 0;
  uint64_t v463 = 0;
  uint64_t v464 = 0;
  uint64_t v458 = 0;
  uint64_t v459 = 0;
  memset(v454, 0, sizeof(v454));
  uint64_t v448 = 0;
  uint64_t v449 = 0;
  char v450 = 0;
  uint64_t v443 = 0;
  uint64_t v444 = 0;
  uint64_t v440 = 0;
  uint64_t v441 = 0;
  uint64_t v437 = 0;
  uint64_t v438 = 0;
  uint64_t v434 = 0;
  uint64_t v435 = 0;
  uint64_t v431 = 0;
  uint64_t v432 = 0;
  uint64_t v428 = 0;
  uint64_t v429 = 0;
  uint64_t v425 = 0;
  uint64_t v426 = 0;
  uint64_t v413 = 0;
  uint64_t v385 = sub_20ACD53B0();
  uint64_t v386 = *(void *)(v385 - 8);
  uint64_t v387 = v385 - 8;
  unint64_t v388 = (*(void *)(v386 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](0);
  uint64_t v389 = (char *)&v213 - v388;
  unint64_t v390 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  uint64_t v391 = (char *)&v213 - v390;
  uint64_t v392 = sub_20ACD4950();
  uint64_t v393 = *(void *)(v392 - 8);
  uint64_t v394 = v392 - 8;
  unint64_t v395 = (*(void *)(v393 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v392);
  uint64_t v396 = (char *)&v213 - v395;
  unint64_t v397 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0BC0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v413);
  v398 = (char *)&v213 - v397;
  unint64_t v399 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  char v400 = (char *)&v213 - v399;
  v516 = (char *)&v213 - v399;
  uint64_t v401 = sub_20ACD4A20();
  uint64_t v402 = *(void *)(v401 - 8);
  uint64_t v403 = v401 - 8;
  unint64_t v404 = (*(void *)(v402 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v413);
  v405 = (char *)&v213 - v404;
  v515 = (char *)&v213 - v404;
  uint64_t v414 = sub_20ACD4CC0();
  uint64_t v406 = *(void *)(v414 - 8);
  uint64_t v407 = v414 - 8;
  unint64_t v408 = (*(void *)(v406 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v414);
  v409 = (char *)&v213 - v408;
  v514 = (char *)&v213 - v408;
  unint64_t v410 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C18) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = MEMORY[0x270FA5388](v415);
  v411 = (char *)&v213 - v410;
  uint64_t v513 = v6;
  uint64_t v512 = v1;
  uint64_t v412 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B38);
  uint64_t v511 = sub_20ACD53F0();
  uint64_t v510 = sub_20ACD53F0();
  uint64_t v509 = sub_20ACD53F0();
  uint64_t v508 = sub_20ACD53F0();
  uint64_t v507 = sub_20ACD53F0();
  uint64_t v506 = sub_20ACD53F0();
  uint64_t v505 = sub_20ACD53F0();
  uint64_t v504 = sub_20ACD53F0();
  uint64_t v503 = sub_20ACD53F0();
  swift_bridgeObjectRetain();
  sub_20ACB4C84();
  v417 = &v517;
  sub_20ACD51E0();
  uint64_t v7 = v419;
  memcpy(v416, v417, __len);
  for (uint64_t i = v7; ; uint64_t i = v250)
  {
    uint64_t v382 = i;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0CC0);
    sub_20ACD51F0();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v406 + 48))(v411, 1, v414) == 1) {
      break;
    }
    (*(void (**)(char *, char *, uint64_t))(v406 + 32))(v409, v411, v414);
    uint64_t v367 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
    uint64_t v377 = 0;
    sub_20ACD53F0();
    uint64_t v369 = MEMORY[0x263F8D310];
    uint64_t v500 = sub_20ACD4FA0();
    sub_20ACD4A10();
    sub_20ACD4BD0();
    sub_20ACD4A00();
    (*(void (**)(char *, uint64_t))(v393 + 8))(v396, v392);
    uint64_t v368 = sub_20ACD53F0();
    uint64_t v376 = v8;
    unsigned int v378 = 1;
    uint64_t v9 = sub_20ACD5010();
    uint64_t v10 = v376;
    *uint64_t v376 = v9;
    v10[1] = v11;
    uint64_t v12 = sub_20ACD4BC0();
    uint64_t v14 = v13;
    uint64_t v15 = v376;
    v376[5] = v369;
    v15[2] = v12;
    v15[3] = v14;
    uint64_t v370 = v15 + 8;
    uint64_t v16 = sub_20ACD5010();
    uint64_t v17 = v376;
    v376[6] = v16;
    v17[7] = v18;
    uint64_t v374 = sub_20ACD4BE0();
    uint64_t v372 = v19;
    int v373 = v20;
    sub_20ACBB104(v374, v19, v20 & 1);
    uint64_t v371 = v498;
    v498[0] = v374;
    v498[1] = v372;
    char v499 = v373 & 1 & v378;
    v376[11] = v369;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0BC8);
    sub_20ACD4A30();
    sub_20ACBB138((uint64_t)v371);
    sub_20ACBB174(v374, v372, v373 & 1);
    uint64_t v375 = v376 + 14;
    uint64_t v21 = sub_20ACD5010();
    uint64_t v22 = v376;
    uint64_t v23 = v21;
    uint64_t v24 = v400;
    uint64_t v26 = v25;
    uint64_t v27 = v398;
    v376[12] = v23;
    v22[13] = v26;
    sub_20ACBB1A8(v24, v27);
    uint64_t v379 = sub_20ACD49F0();
    uint64_t v380 = *(void *)(v379 - 8);
    uint64_t v381 = v379 - 8;
    if ((*(unsigned int (**)(char *, void))(v380 + 48))(v398, v378) == 1)
    {
      sub_20ACBB2D0((uint64_t)v398);
      memset(v496, 0, sizeof(v496));
      uint64_t v497 = 0;
    }
    else
    {
      sub_20ACD49E0();
      uint64_t v497 = MEMORY[0x263F8D538];
      v496[0] = v28;
      (*(void (**)(char *, uint64_t))(v380 + 8))(v398, v379);
    }
    if (v497)
    {
      sub_20ACB323C((uint64_t)v496, (uint64_t)v375);
    }
    else
    {
      uint64_t v29 = v376;
      v376[17] = MEMORY[0x263F8D6C8];
      v29[14] = 0;
      sub_20ACB3678((uint64_t)v496);
    }
    uint64_t v30 = sub_20ACD5010();
    uint64_t v31 = v376;
    v376[18] = v30;
    v31[19] = v32;
    sub_20ACD4CA0();
    uint64_t v33 = v391;
    uint64_t v34 = v386;
    uint64_t v35 = v385;
    double v364 = v36;
    v376[23] = MEMORY[0x263F8D538];
    uint64_t v365 = (_DWORD *)MEMORY[0x263F8E210];
    (*(void (**)(char *, void, uint64_t))(v34 + 104))(v33, *MEMORY[0x263F8E210], v35);
    double v495 = v364;
    (*(void (**)(char *, char *, uint64_t))(v386 + 16))(v389, v391, v385);
    int v366 = (*(uint64_t (**)(char *, uint64_t))(v386 + 88))(v389, v385);
    if (v366 == *v365)
    {
      double v495 = round(v364);
      goto LABEL_22;
    }
    if (v366 == *MEMORY[0x263F8E208])
    {
      double v495 = rint(v364);
      goto LABEL_22;
    }
    if (v366 == *MEMORY[0x263F8E218]) {
      goto LABEL_19;
    }
    if (v366 == *MEMORY[0x263F8E220]) {
      goto LABEL_21;
    }
    if (v366 == *MEMORY[0x263F8E1F8])
    {
      double v495 = trunc(v364);
      goto LABEL_22;
    }
    if (v366 != *MEMORY[0x263F8E200])
    {
      sub_20ACD51C0();
      (*(void (**)(char *, uint64_t))(v386 + 8))(v389, v385);
      goto LABEL_22;
    }
    if (sub_20ACD51D0()) {
LABEL_21:
    }
      double v495 = floor(v364);
    else {
LABEL_19:
    }
      double v495 = ceil(v364);
LABEL_22:
    uint64_t v37 = v385;
    uint64_t v38 = v391;
    uint64_t v39 = v386;
    *((double *)v376 + 20) = v495;
    (*(void (**)(char *, uint64_t))(v39 + 8))(v38, v37);
    uint64_t v356 = v376 + 26;
    int v361 = 1;
    uint64_t v40 = sub_20ACD5010();
    uint64_t v41 = v376;
    v376[24] = v40;
    v41[25] = v42;
    uint64_t v360 = sub_20ACD4CB0();
    uint64_t v358 = v43;
    int v359 = v44;
    sub_20ACBD534(v360, v43, v44 & 1);
    uint64_t v357 = v493;
    v493[0] = v360;
    v493[1] = v358;
    char v494 = v359 & 1;
    uint64_t v362 = MEMORY[0x263F8D310];
    v376[29] = MEMORY[0x263F8D310];
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0BD0);
    sub_20ACD4A30();
    sub_20ACBD568((uint64_t)v357);
    sub_20ACBD5A4(v360, v358, v359 & 1);
    uint64_t v45 = sub_20ACD5010();
    uint64_t v46 = v376;
    v376[30] = v45;
    v46[31] = v47;
    uint64_t v48 = sub_20ACD4C00();
    uint64_t v49 = v376;
    v376[35] = v362;
    v49[32] = v48;
    v49[33] = v50;
    sub_20ACAD01C();
    uint64_t v500 = sub_20ACD4FA0();
    swift_bridgeObjectRelease();
    uint64_t v363 = sub_20ACD4C40();
    uint64_t v492 = v363;
    if (sub_20ACD5120() > 0)
    {
      uint64_t v353 = sub_20ACD5010();
      uint64_t v354 = v51;
      uint64_t v355 = v423;
      v423[3] = MEMORY[0x263F8D310];
      v423[0] = MEMORY[0x21052B710](0, v363);
      v423[1] = v52;
      uint64_t v421 = v353;
      uint64_t v422 = v354;
      sub_20ACD4FD0();
    }
    uint64_t v352 = sub_20ACD4C10();
    uint64_t v491 = v352;
    if (sub_20ACD5120() > 0)
    {
      uint64_t v349 = sub_20ACD5010();
      uint64_t v350 = v53;
      uint64_t v351 = v424;
      v424[3] = MEMORY[0x263F8D310];
      v424[0] = MEMORY[0x21052B710](0, v352);
      v424[1] = v54;
      v423[4] = v349;
      v423[5] = v350;
      sub_20ACD4FD0();
    }
    uint64_t v343 = v500;
    swift_bridgeObjectRetain();
    uint64_t v344 = &v490;
    uint64_t v490 = v343;
    uint64_t v345 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C78);
    sub_20ACD5130();
    uint64_t v487 = sub_20ACD4C20();
    uint64_t v346 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C88);
    unint64_t v347 = sub_20ACBB380();
    sub_20ACD5210();
    for (uint64_t j = v382; ; uint64_t j = v339)
    {
      uint64_t v339 = j;
      uint64_t v340 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0CD8);
      sub_20ACD5300();
      uint64_t v341 = v485;
      uint64_t v342 = v486;
      if (!v486) {
        break;
      }
      uint64_t v337 = v341;
      uint64_t v338 = v342;
      uint64_t v336 = v342;
      uint64_t v333 = v341;
      uint64_t v425 = v341;
      uint64_t v426 = v342;
      uint64_t v332 = sub_20ACD53F0();
      uint64_t v334 = v55;
      int v331 = 1;
      uint64_t v56 = sub_20ACD5010();
      uint64_t v57 = v334;
      *uint64_t v334 = v56;
      v57[1] = v58;
      uint64_t v59 = sub_20ACD4BC0();
      uint64_t v60 = v334;
      uint64_t v335 = MEMORY[0x263F8D310];
      v334[5] = MEMORY[0x263F8D310];
      v60[2] = v59;
      v60[3] = v61;
      uint64_t v62 = sub_20ACD5010();
      v63 = v334;
      v334[6] = v62;
      v63[7] = v64;
      swift_bridgeObjectRetain();
      uint64_t v65 = v333;
      v66 = v334;
      uint64_t v67 = v336;
      v334[11] = v335;
      v66[8] = v65;
      v66[9] = v67;
      sub_20ACAD01C();
      v424[4] = sub_20ACD4FA0();
      sub_20ACD5130();
      swift_bridgeObjectRelease();
    }
    sub_20ACBB404();
    uint64_t v482 = sub_20ACD4C60();
    sub_20ACD5210();
    for (uint64_t k = v339; ; uint64_t k = v327)
    {
      uint64_t v327 = k;
      sub_20ACD5300();
      uint64_t v328 = v480;
      uint64_t v329 = v481;
      if (!v481) {
        break;
      }
      uint64_t v325 = v328;
      uint64_t v326 = v329;
      uint64_t v324 = v329;
      uint64_t v321 = v328;
      uint64_t v428 = v328;
      uint64_t v429 = v329;
      uint64_t v320 = sub_20ACD53F0();
      uint64_t v322 = v68;
      int v319 = 1;
      uint64_t v69 = sub_20ACD5010();
      uint64_t v70 = v322;
      *uint64_t v322 = v69;
      v70[1] = v71;
      uint64_t v72 = sub_20ACD4BC0();
      char v73 = v322;
      uint64_t v323 = MEMORY[0x263F8D310];
      v322[5] = MEMORY[0x263F8D310];
      v73[2] = v72;
      v73[3] = v74;
      uint64_t v75 = sub_20ACD5010();
      char v76 = v322;
      v322[6] = v75;
      v76[7] = v77;
      swift_bridgeObjectRetain();
      uint64_t v78 = v321;
      v79 = v322;
      uint64_t v80 = v324;
      v322[11] = v323;
      v79[8] = v78;
      v79[9] = v80;
      sub_20ACAD01C();
      uint64_t v427 = sub_20ACD4FA0();
      sub_20ACD5130();
      swift_bridgeObjectRelease();
    }
    sub_20ACBB404();
    uint64_t v477 = sub_20ACD4C30();
    sub_20ACD5210();
    for (uint64_t m = v327; ; uint64_t m = v315)
    {
      uint64_t v315 = m;
      sub_20ACD5300();
      uint64_t v316 = v475;
      uint64_t v317 = v476;
      if (!v476) {
        break;
      }
      uint64_t v313 = v316;
      uint64_t v314 = v317;
      uint64_t v312 = v317;
      uint64_t v309 = v316;
      uint64_t v431 = v316;
      uint64_t v432 = v317;
      uint64_t v308 = sub_20ACD53F0();
      uint64_t v310 = v81;
      int v307 = 1;
      uint64_t v82 = sub_20ACD5010();
      v83 = v310;
      *uint64_t v310 = v82;
      v83[1] = v84;
      uint64_t v85 = sub_20ACD4BC0();
      v86 = v310;
      uint64_t v311 = MEMORY[0x263F8D310];
      v310[5] = MEMORY[0x263F8D310];
      v86[2] = v85;
      v86[3] = v87;
      uint64_t v88 = sub_20ACD5010();
      v89 = v310;
      v310[6] = v88;
      v89[7] = v90;
      swift_bridgeObjectRetain();
      uint64_t v91 = v309;
      v92 = v310;
      uint64_t v93 = v312;
      v310[11] = v311;
      v92[8] = v91;
      v92[9] = v93;
      sub_20ACAD01C();
      uint64_t v430 = sub_20ACD4FA0();
      sub_20ACD5130();
      swift_bridgeObjectRelease();
    }
    sub_20ACBB404();
    uint64_t v472 = sub_20ACD4C40();
    sub_20ACD5210();
    for (uint64_t n = v315; ; uint64_t n = v303)
    {
      uint64_t v303 = n;
      sub_20ACD5300();
      uint64_t v304 = v470;
      uint64_t v305 = v471;
      if (!v471) {
        break;
      }
      uint64_t v301 = v304;
      uint64_t v302 = v305;
      uint64_t v300 = v305;
      uint64_t v297 = v304;
      uint64_t v434 = v304;
      uint64_t v435 = v305;
      uint64_t v296 = sub_20ACD53F0();
      unint64_t v298 = v94;
      int v295 = 1;
      uint64_t v95 = sub_20ACD5010();
      v96 = v298;
      *unint64_t v298 = v95;
      v96[1] = v97;
      uint64_t v98 = sub_20ACD4BC0();
      v99 = v298;
      uint64_t v299 = MEMORY[0x263F8D310];
      v298[5] = MEMORY[0x263F8D310];
      v99[2] = v98;
      v99[3] = v100;
      uint64_t v101 = sub_20ACD5010();
      v102 = v298;
      v298[6] = v101;
      v102[7] = v103;
      swift_bridgeObjectRetain();
      uint64_t v104 = v297;
      v105 = v298;
      uint64_t v106 = v300;
      v298[11] = v299;
      v105[8] = v104;
      v105[9] = v106;
      sub_20ACAD01C();
      uint64_t v433 = sub_20ACD4FA0();
      sub_20ACD5130();
      swift_bridgeObjectRelease();
    }
    sub_20ACBB404();
    uint64_t v467 = sub_20ACD4C50();
    sub_20ACD5210();
    for (iuint64_t i = v303; ; iuint64_t i = v291)
    {
      uint64_t v291 = ii;
      sub_20ACD5300();
      uint64_t v292 = v465;
      uint64_t v293 = v466;
      if (!v466) {
        break;
      }
      uint64_t v289 = v292;
      uint64_t v290 = v293;
      uint64_t v288 = v293;
      uint64_t v285 = v292;
      uint64_t v437 = v292;
      uint64_t v438 = v293;
      uint64_t v284 = sub_20ACD53F0();
      uint64_t v286 = v107;
      int v283 = 1;
      uint64_t v108 = sub_20ACD5010();
      v109 = v286;
      *uint64_t v286 = v108;
      v109[1] = v110;
      uint64_t v111 = sub_20ACD4BC0();
      v112 = v286;
      uint64_t v287 = MEMORY[0x263F8D310];
      v286[5] = MEMORY[0x263F8D310];
      v112[2] = v111;
      v112[3] = v113;
      uint64_t v114 = sub_20ACD5010();
      v115 = v286;
      v286[6] = v114;
      v115[7] = v116;
      swift_bridgeObjectRetain();
      uint64_t v117 = v285;
      v118 = v286;
      uint64_t v119 = v288;
      v286[11] = v287;
      v118[8] = v117;
      v118[9] = v119;
      sub_20ACAD01C();
      uint64_t v436 = sub_20ACD4FA0();
      sub_20ACD5130();
      swift_bridgeObjectRelease();
    }
    sub_20ACBB404();
    uint64_t v462 = sub_20ACD4BF0();
    sub_20ACD5210();
    for (uint64_t jj = v291; ; uint64_t jj = v279)
    {
      uint64_t v279 = jj;
      sub_20ACD5300();
      uint64_t v280 = v460;
      uint64_t v281 = v461;
      if (!v461) {
        break;
      }
      uint64_t v277 = v280;
      uint64_t v278 = v281;
      uint64_t v276 = v281;
      uint64_t v273 = v280;
      uint64_t v440 = v280;
      uint64_t v441 = v281;
      uint64_t v272 = sub_20ACD53F0();
      v274 = v120;
      int v271 = 1;
      uint64_t v121 = sub_20ACD5010();
      uint64_t v122 = v274;
      uint64_t *v274 = v121;
      v122[1] = v123;
      uint64_t v124 = sub_20ACD4BC0();
      uint64_t v125 = v274;
      uint64_t v275 = MEMORY[0x263F8D310];
      v274[5] = MEMORY[0x263F8D310];
      v125[2] = v124;
      v125[3] = v126;
      uint64_t v127 = sub_20ACD5010();
      v128 = v274;
      v274[6] = v127;
      v128[7] = v129;
      swift_bridgeObjectRetain();
      uint64_t v130 = v273;
      v131 = v274;
      uint64_t v132 = v276;
      v274[11] = v275;
      v131[8] = v130;
      v131[9] = v132;
      sub_20ACAD01C();
      uint64_t v439 = sub_20ACD4FA0();
      sub_20ACD5130();
      swift_bridgeObjectRelease();
    }
    sub_20ACBB404();
    uint64_t v457 = sub_20ACD4C10();
    sub_20ACD5210();
    for (uint64_t kk = v279; ; uint64_t kk = v267)
    {
      uint64_t v267 = kk;
      sub_20ACD5300();
      uint64_t v268 = v455;
      uint64_t v269 = v456;
      if (!v456) {
        break;
      }
      uint64_t v265 = v268;
      uint64_t v266 = v269;
      uint64_t v264 = v269;
      uint64_t v261 = v268;
      uint64_t v443 = v268;
      uint64_t v444 = v269;
      uint64_t v260 = sub_20ACD53F0();
      int v262 = v133;
      uint64_t v259 = 17;
      int v258 = 1;
      uint64_t v134 = sub_20ACD5010();
      uint64_t v135 = v262;
      *int v262 = v134;
      v135[1] = v136;
      uint64_t v137 = sub_20ACD4BC0();
      v138 = v262;
      uint64_t v263 = MEMORY[0x263F8D310];
      v262[5] = MEMORY[0x263F8D310];
      v138[2] = v137;
      v138[3] = v139;
      uint64_t v140 = sub_20ACD5010();
      v141 = v262;
      v262[6] = v140;
      v141[7] = v142;
      swift_bridgeObjectRetain();
      uint64_t v143 = v261;
      uint64_t v144 = v262;
      uint64_t v145 = v264;
      v262[11] = v263;
      v144[8] = v143;
      v144[9] = v145;
      sub_20ACAD01C();
      uint64_t v442 = sub_20ACD4FA0();
      sub_20ACD5130();
      swift_bridgeObjectRelease();
    }
    sub_20ACBB404();
    uint64_t v255 = sub_20ACD4C80();
    uint64_t v254 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0BE0);
    sub_20ACBD5D8();
    uint64_t v256 = &v518;
    sub_20ACD51E0();
    memcpy(v454, v256, sizeof(v454));
    for (muint64_t m = v267; ; muint64_t m = v250)
    {
      uint64_t v250 = mm;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0CA8);
      sub_20ACD51F0();
      uint64_t v251 = v451;
      uint64_t v252 = v452;
      int v253 = v453;
      if (v453 == 255) {
        break;
      }
      uint64_t v247 = v251;
      uint64_t v248 = v252;
      int v249 = v253;
      int v246 = v253;
      uint64_t v245 = v252;
      uint64_t v244 = v251;
      uint64_t v448 = v251;
      uint64_t v449 = v252;
      int v238 = 1;
      char v450 = v253 & 1;
      uint64_t v242 = sub_20ACD53F0();
      uint64_t v239 = v146;
      uint64_t v147 = sub_20ACD5010();
      v148 = v239;
      *uint64_t v239 = v147;
      v148[1] = v149;
      uint64_t v150 = sub_20ACD4BC0();
      uint64_t v152 = v151;
      v153 = v239;
      uint64_t v243 = MEMORY[0x263F8D310];
      v239[5] = MEMORY[0x263F8D310];
      v153[2] = v150;
      v153[3] = v152;
      uint64_t v240 = v153 + 8;
      uint64_t v154 = sub_20ACD5010();
      uint64_t v155 = v239;
      char v156 = v246;
      uint64_t v157 = v154;
      uint64_t v158 = v244;
      uint64_t v160 = v159;
      uint64_t v161 = v245;
      v239[6] = v157;
      v155[7] = v160;
      sub_20ACBD760(v158, v161, v156 & 1);
      v241 = v446;
      v446[0] = v244;
      v446[1] = v245;
      char v447 = v246 & 1 & v238;
      v239[11] = v243;
      sub_20ACD4A30();
      sub_20ACBD794((uint64_t)v241);
      sub_20ACAD01C();
      uint64_t v445 = sub_20ACD4FA0();
      sub_20ACD5130();
      sub_20ACBD7D0(v244, v245, v246 & 1);
    }
    sub_20ACBD6F4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_20ACBB2D0((uint64_t)v400);
    (*(void (**)(char *, uint64_t))(v402 + 8))(v405, v401);
    sub_20ACBD734();
    (*(void (**)(char *, uint64_t))(v406 + 8))(v409, v414);
  }
  uint64_t v162 = v383;
  sub_20ACB4D08();
  uint64_t v228 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C68);
  uint64_t v229 = sub_20ACD53F0();
  int v226 = v163;
  int v214 = v163 + 2;
  int v225 = 1;
  uint64_t v164 = sub_20ACD5010();
  v165 = v226;
  uint64_t v167 = v166;
  v168 = v214;
  *int v226 = v164;
  v165[1] = v167;
  sub_20ACB97D0(&v511, v168);
  uint64_t v215 = v226 + 5;
  uint64_t v217 = 23;
  uint64_t v169 = sub_20ACD5010();
  v170 = v226;
  uint64_t v172 = v171;
  v173 = v215;
  v226[3] = v169;
  v170[4] = v172;
  sub_20ACB97D0(&v510, v173);
  uint64_t v216 = v226 + 8;
  uint64_t v174 = sub_20ACD5010();
  int v175 = v226;
  uint64_t v177 = v176;
  uint64_t v178 = v216;
  v226[6] = v174;
  v175[7] = v177;
  sub_20ACB97D0(&v509, v178);
  uint64_t v218 = v226 + 11;
  uint64_t v179 = sub_20ACD5010();
  uint64_t v180 = v226;
  uint64_t v182 = v181;
  uint64_t v183 = v218;
  v226[9] = v179;
  v180[10] = v182;
  sub_20ACB97D0(&v508, v183);
  uint64_t v219 = v226 + 14;
  uint64_t v220 = 24;
  uint64_t v184 = sub_20ACD5010();
  uint64_t v185 = v226;
  uint64_t v187 = v186;
  int v188 = v219;
  v226[12] = v184;
  v185[13] = v187;
  sub_20ACB97D0(&v507, v188);
  uint64_t v221 = v226 + 17;
  uint64_t v189 = sub_20ACD5010();
  uint64_t v190 = v226;
  uint64_t v192 = v191;
  uint64_t v193 = v221;
  v226[15] = v189;
  v190[16] = v192;
  sub_20ACB97D0(&v506, v193);
  uint64_t v222 = v226 + 20;
  uint64_t v224 = 19;
  uint64_t v194 = sub_20ACD5010();
  uint64_t v195 = v226;
  uint64_t v197 = v196;
  uint64_t v198 = v222;
  v226[18] = v194;
  v195[19] = v197;
  sub_20ACB97D0(&v505, v198);
  uint64_t v223 = v226 + 23;
  uint64_t v199 = sub_20ACD5010();
  v200 = v226;
  uint64_t v202 = v201;
  uint64_t v203 = v223;
  v226[21] = v199;
  v200[22] = v202;
  sub_20ACB97D0(&v504, v203);
  uint64_t v227 = v226 + 26;
  uint64_t v204 = sub_20ACD5010();
  v205 = v226;
  uint64_t v207 = v206;
  uint64_t v208 = v227;
  v226[24] = v204;
  v205[25] = v207;
  sub_20ACB97D0(&v503, v208);
  uint64_t v209 = v229;
  sub_20ACAD01C();
  uint64_t v230 = v209;
  uint64_t v232 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C78);
  uint64_t v233 = MEMORY[0x263F8D310];
  uint64_t v234 = MEMORY[0x263F8D320];
  uint64_t v231 = sub_20ACD4FA0();
  uint64_t v501 = v231;
  swift_bridgeObjectRetain();
  uint64_t v210 = sub_20ACD5360();
  uint64_t v211 = v382;
  uint64_t v235 = v210;
  (*(void (**)(void))((*v162 & *MEMORY[0x263F8EED0]) + 0xD8))();
  uint64_t v236 = v211;
  uint64_t v237 = v211;
  if (v211) {
    uint64_t v213 = v237;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20ACB9808();
  sub_20ACB9808();
  sub_20ACB9808();
  sub_20ACB9808();
  sub_20ACB9808();
  sub_20ACB9808();
  sub_20ACB9808();
  sub_20ACB9808();
  uint64_t result = &v511;
  sub_20ACB9808();
  return result;
}

uint64_t sub_20ACBD534(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_20ACBD568(uint64_t a1)
{
  return a1;
}

uint64_t sub_20ACBD5A4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_20ACBD5D8()
{
  uint64_t v2 = qword_26ACA0BD8;
  if (!qword_26ACA0BD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACA0BE0);
    sub_20ACBD678();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26ACA0BD8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_20ACBD678()
{
  uint64_t v2 = qword_26ACA0BF8;
  if (!qword_26ACA0BF8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26ACA0BF8);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACBD6F4()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACBD734()
{
}

uint64_t sub_20ACBD760(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_20ACBD794(uint64_t a1)
{
  return a1;
}

uint64_t sub_20ACBD7D0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_20ACBD804(uint64_t a1)
{
  uint64_t v111 = a1;
  uint64_t v2 = v1;
  uint64_t v3 = v111;
  uint64_t v85 = v2;
  uint64_t v179 = 0;
  uint64_t v178 = 0;
  uint64_t v106 = &v177;
  uint64_t v177 = 0;
  uint64_t v87 = 0;
  uint64_t v78 = sub_20ACD53B0();
  uint64_t v79 = *(void *)(v78 - 8);
  uint64_t v80 = v78 - 8;
  unint64_t v81 = (*(void *)(v79 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](0);
  uint64_t v82 = (char *)v40 - v81;
  unint64_t v83 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  uint64_t v84 = (char *)v40 - v83;
  uint64_t v119 = sub_20ACD4950();
  uint64_t v115 = *(void *)(v119 - 8);
  uint64_t v116 = v119 - 8;
  unint64_t v86 = (*(void *)(v115 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v119);
  uint64_t v117 = (char *)v40 - v86;
  uint64_t v179 = v3;
  uint64_t v178 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
  sub_20ACD53F0();
  uint64_t v93 = MEMORY[0x263F8D310];
  uint64_t v177 = sub_20ACD4FA0();
  uint64_t v105 = 20;
  int v112 = 1;
  uint64_t v90 = sub_20ACD5010();
  uint64_t v89 = v7;
  uint64_t v88 = sub_20ACD4C20();
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C88);
  v92 = v176;
  v176[3] = v107;
  v176[0] = v88;
  uint64_t v91 = v175;
  v175[0] = v90;
  v175[1] = v89;
  uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B38);
  sub_20ACD4FD0();
  uint64_t v98 = sub_20ACD5010();
  uint64_t v99 = v8;
  uint64_t v97 = sub_20ACD4BE0();
  uint64_t v95 = v9;
  int v96 = v10;
  sub_20ACBB104(v97, v9, v10 & 1);
  v94 = v171;
  v171[0] = v97;
  v171[1] = v95;
  char v172 = v96 & 1;
  uint64_t v100 = &v173;
  uint64_t v174 = v93;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0BC8);
  sub_20ACD4A30();
  sub_20ACBB138((uint64_t)v94);
  sub_20ACBB174(v97, v95, v96 & 1);
  uint64_t v169 = v98;
  uint64_t v170 = v99;
  sub_20ACD4FD0();
  uint64_t v101 = sub_20ACD5010();
  uint64_t v102 = v11;
  uint64_t v12 = sub_20ACD4C60();
  uint64_t v168 = v107;
  uint64_t v167 = v12;
  uint64_t v165 = v101;
  uint64_t v166 = v102;
  sub_20ACD4FD0();
  uint64_t v103 = sub_20ACD5010();
  uint64_t v104 = v13;
  uint64_t v14 = sub_20ACD4C90();
  uint64_t v164 = MEMORY[0x263F8D9D0];
  uint64_t v163 = v14;
  uint64_t v161 = v103;
  uint64_t v162 = v104;
  sub_20ACD4FD0();
  uint64_t v108 = sub_20ACD5010();
  uint64_t v109 = v15;
  uint64_t v16 = sub_20ACD4C30();
  uint64_t v160 = v107;
  uint64_t v159 = v16;
  uint64_t v157 = v108;
  uint64_t v158 = v109;
  sub_20ACD4FD0();
  uint64_t v113 = sub_20ACD5010();
  uint64_t v114 = v17;
  sub_20ACD4BD0();
  uint64_t v118 = sub_20ACD4940();
  int v120 = v18;
  (*(void (**)(char *, uint64_t))(v115 + 8))(v117, v119);
  if (v120)
  {
    uint64_t v153 = 0;
    uint64_t v154 = 0;
    uint64_t v155 = 0;
    uint64_t v156 = 0;
  }
  else
  {
    uint64_t v77 = v118;
    uint64_t v156 = MEMORY[0x263F8D6C8];
    uint64_t v153 = v118;
  }
  v152[4] = v113;
  v152[5] = v114;
  sub_20ACD4FD0();
  uint64_t v72 = sub_20ACD5010();
  uint64_t v73 = v19;
  sub_20ACD4CA0();
  double v74 = v20;
  v152[3] = MEMORY[0x263F8D538];
  uint64_t v75 = (_DWORD *)MEMORY[0x263F8E210];
  (*(void (**)(char *, void, uint64_t))(v79 + 104))(v84, *MEMORY[0x263F8E210], v78);
  double v151 = v74;
  (*(void (**)(char *, char *, uint64_t))(v79 + 16))(v82, v84, v78);
  int v76 = (*(uint64_t (**)(char *, uint64_t))(v79 + 88))(v82, v78);
  if (v76 == *v75)
  {
    double v151 = round(v74);
    goto LABEL_17;
  }
  if (v76 == *MEMORY[0x263F8E208])
  {
    double v151 = rint(v74);
    goto LABEL_17;
  }
  if (v76 == *MEMORY[0x263F8E218])
  {
LABEL_14:
    double v151 = ceil(v74);
    goto LABEL_17;
  }
  if (v76 == *MEMORY[0x263F8E220])
  {
LABEL_16:
    double v151 = floor(v74);
    goto LABEL_17;
  }
  if (v76 == *MEMORY[0x263F8E1F8])
  {
    double v151 = trunc(v74);
    goto LABEL_17;
  }
  if (v76 == *MEMORY[0x263F8E200])
  {
    if ((sub_20ACD51D0() & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  sub_20ACD51C0();
  (*(void (**)(char *, uint64_t))(v79 + 8))(v82, v78);
LABEL_17:
  uint64_t v50 = v152;
  *(double *)uint64_t v152 = v151;
  (*(void (**)(char *, uint64_t))(v79 + 8))(v84, v78);
  v150[10] = v72;
  v150[11] = v73;
  uint64_t v69 = &v177;
  sub_20ACD4FD0();
  int v68 = 1;
  uint64_t v51 = sub_20ACD5010();
  uint64_t v52 = v21;
  uint64_t v22 = sub_20ACD4BC0();
  uint64_t v60 = MEMORY[0x263F8D310];
  v150[9] = MEMORY[0x263F8D310];
  v150[6] = v22;
  v150[7] = v23;
  v150[4] = v51;
  v150[5] = v52;
  sub_20ACD4FD0();
  uint64_t v57 = sub_20ACD5010();
  uint64_t v58 = v24;
  uint64_t v56 = sub_20ACD4CB0();
  uint64_t v54 = v25;
  int v55 = v26;
  sub_20ACBD534(v56, v25, v26 & 1);
  uint64_t v53 = v148;
  v148[0] = v56;
  v148[1] = v54;
  char v149 = v55 & 1;
  uint64_t v59 = v150;
  v150[3] = v60;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0BD0);
  sub_20ACD4A30();
  sub_20ACBD568((uint64_t)v53);
  sub_20ACBD5A4(v56, v54, v55 & 1);
  uint64_t v146 = v57;
  uint64_t v147 = v58;
  sub_20ACD4FD0();
  uint64_t v61 = sub_20ACD5010();
  uint64_t v62 = v27;
  uint64_t v28 = sub_20ACD4C00();
  uint64_t v145 = v60;
  uint64_t v143 = v28;
  uint64_t v144 = v29;
  uint64_t v141 = v61;
  uint64_t v142 = v62;
  sub_20ACD4FD0();
  uint64_t v65 = 21;
  uint64_t v63 = sub_20ACD5010();
  uint64_t v64 = v30;
  uint64_t v31 = sub_20ACD4C40();
  uint64_t v140 = v107;
  uint64_t v139 = v31;
  uint64_t v137 = v63;
  uint64_t v138 = v64;
  sub_20ACD4FD0();
  uint64_t v66 = sub_20ACD5010();
  uint64_t v67 = v32;
  uint64_t v33 = sub_20ACD4C50();
  uint64_t v136 = v107;
  uint64_t v135 = v33;
  uint64_t v133 = v66;
  uint64_t v134 = v67;
  sub_20ACD4FD0();
  uint64_t v70 = sub_20ACD5010();
  uint64_t v71 = v34;
  uint64_t v35 = sub_20ACD4BF0();
  uint64_t v132 = v107;
  uint64_t v131 = v35;
  uint64_t v129 = v70;
  uint64_t v130 = v71;
  sub_20ACD4FD0();
  uint64_t v127 = sub_20ACD4C70();
  uint64_t v128 = v36;
  BOOL v49 = v36 != 0;
  BOOL v48 = v49;
  sub_20ACBFA14();
  if (v48)
  {
    uint64_t v44 = sub_20ACD5010();
    uint64_t v45 = v37;
    uint64_t v46 = sub_20ACD4C70();
    uint64_t v47 = v38;
    if (v38)
    {
      uint64_t v42 = v46;
      uint64_t v43 = v47;
      uint64_t v126 = MEMORY[0x263F8D310];
      uint64_t v123 = v46;
      uint64_t v124 = v47;
    }
    else
    {
      uint64_t v123 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
    }
    uint64_t v121 = v44;
    uint64_t v122 = v45;
    sub_20ACD4FD0();
  }
  v40[1] = &v177;
  uint64_t v41 = v177;
  swift_bridgeObjectRetain();
  sub_20ACBD734();
  return v41;
}

unsigned char *sub_20ACBE3D0(uint64_t a1)
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  memset(__b, 0, sizeof(__b));
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  uint64_t v48 = 0;
  uint64_t v46 = 0;
  uint64_t v45 = 0;
  uint64_t v52 = a1;
  uint64_t v51 = v1;
  swift_bridgeObjectRetain();
  sub_20ACD4F90();
  memcpy(__b, v82, sizeof(__b));
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C38);
    sub_20ACD4FB0();
    sub_20ACBFA40(v77, &v78);
    if (!v79)
    {
      uint64_t result = __b;
      sub_20ACBFAAC();
      return result;
    }
    uint64_t v34 = v78;
    uint64_t v35 = v79;
    uint64_t v49 = v78;
    uint64_t v50 = v79;
    sub_20ACB323C((uint64_t)&v80, (uint64_t)v76);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
    sub_20ACD53F0();
    uint64_t v36 = v2;
    *uint64_t v2 = sub_20ACD5010();
    v36[1] = v3;
    swift_bridgeObjectRetain();
    v36[5] = MEMORY[0x263F8D310];
    v36[2] = v34;
    v36[3] = v35;
    v36[6] = sub_20ACD5010();
    v36[7] = v4;
    sub_20ACBFB30((uint64_t)v76, (uint64_t)(v36 + 8));
    sub_20ACAD01C();
    uint64_t v48 = sub_20ACD4FA0();
    uint64_t v75 = 0;
    id v37 = self;
    swift_bridgeObjectRetain();
    sub_20ACD5360();
    id v39 = (id)sub_20ACD4F70();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v47 = v75;
    id v40 = objc_msgSend(v37, sel_saveEvents_error_, v39, &v47);
    id v38 = v47;
    id v5 = v47;
    uint64_t v6 = v75;
    uint64_t v75 = v38;

    if (!v40)
    {
      id v23 = v75;
      sub_20ACD4970();

      swift_willThrow();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v76);
      swift_bridgeObjectRelease();
      uint64_t result = __b;
      sub_20ACBFAAC();
      return result;
    }
    uint64_t v33 = sub_20ACD4F80();

    uint64_t v7 = swift_bridgeObjectRetain();
    (*(void (**)(uint64_t))((*v41 & *MEMORY[0x263F8EED0]) + 0x60))(v7);
    MEMORY[0x21052B560](v74);
    sub_20ACAD060();
    BOOL v32 = v74[3] == 0;
    sub_20ACB3678((uint64_t)v74);
    swift_bridgeObjectRelease();
    if (v32)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C50);
      uint64_t v54 = v33;
      uint64_t v31 = (void (*)(unsigned char *, void, uint64_t))(*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))((*v41 & *MEMORY[0x263F8EED0]) + 0x70))(v53, v8, v9);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B38);
      sub_20ACD4FD0();
      v31(v53, 0, v10);
      goto LABEL_29;
    }
    uint64_t v11 = swift_bridgeObjectRetain();
    (*(void (**)(uint64_t))((*v41 & *MEMORY[0x263F8EED0]) + 0x60))(v11);
    MEMORY[0x21052B560](v72);
    sub_20ACAD060();
    if (!v72[3])
    {
      sub_20ACD5340();
      __break(1u);
    }
    sub_20ACB323C((uint64_t)v72, (uint64_t)v73);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B38);
    swift_dynamicCast();
    swift_bridgeObjectRelease();
    sub_20ACD5010();
    MEMORY[0x21052B560](v70);
    sub_20ACAD060();
    if (!v70[3])
    {
      sub_20ACD5340();
      __break(1u);
    }
    sub_20ACB323C((uint64_t)v70, (uint64_t)v71);
    uint64_t v30 = MEMORY[0x263F8EE58] + 8;
    swift_dynamicCast();
    sub_20ACD5010();
    sub_20ACD5390();
    MEMORY[0x21052B560](v67, v68, v33, MEMORY[0x263F8DB68], v30, MEMORY[0x263F8DB70]);
    if (!v67[3])
    {
      sub_20ACD5340();
      __break(1u);
    }
    sub_20ACB323C((uint64_t)v67, (uint64_t)v69);
    swift_dynamicCast();
    sub_20ACBFB94((uint64_t)v68);
    sub_20ACAD060();
    sub_20ACD5010();
    MEMORY[0x21052B560](v65);
    sub_20ACAD060();
    if (!v65[3])
    {
      sub_20ACD5340();
      __break(1u);
    }
    sub_20ACB323C((uint64_t)v65, (uint64_t)v66);
    swift_dynamicCast();
    sub_20ACD5010();
    MEMORY[0x21052B560](v63);
    sub_20ACAD060();
    if (!v63[3])
    {
      sub_20ACD5340();
      __break(1u);
    }
    sub_20ACB323C((uint64_t)v63, (uint64_t)v64);
    swift_dynamicCast();
    sub_20ACD5010();
    MEMORY[0x21052B560](v61);
    sub_20ACAD060();
    if (!v61[3])
    {
      sub_20ACD5340();
      __break(1u);
    }
    sub_20ACB323C((uint64_t)v61, (uint64_t)v62);
    uint64_t result = (unsigned char *)swift_dynamicCast();
    if (__OFADD__(v46, v44)) {
      break;
    }
    uint64_t v29 = v46 + v44;
    v46 += v44;
    sub_20ACD5010();
    MEMORY[0x21052B560](v59);
    sub_20ACAD060();
    if (!v59[3])
    {
      sub_20ACD5340();
      __break(1u);
    }
    sub_20ACB323C((uint64_t)v59, (uint64_t)v60);
    uint64_t result = (unsigned char *)swift_dynamicCast();
    uint64_t v28 = v45 + v43;
    if (__OFADD__(v45, v43)) {
      goto LABEL_33;
    }
    v45 += v43;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C58);
    sub_20ACD53F0();
    uint64_t v25 = v15;
    *uint64_t v15 = sub_20ACD5010();
    v25[1] = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C70);
    sub_20ACD53F0();
    uint64_t v24 = v17;
    *uint64_t v17 = sub_20ACD5010();
    v24[1] = v18;
    v24[2] = v29;
    v24[3] = sub_20ACD5010();
    v24[4] = v19;
    v24[5] = v28;
    sub_20ACAD01C();
    v25[2] = sub_20ACD4FA0();
    sub_20ACAD01C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C48);
    uint64_t v26 = sub_20ACD4FA0();
    uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C40);
    uint64_t v57 = v26;
    uint64_t v27 = (void (*)(unsigned char *, void, uint64_t))(*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))((*v41 & *MEMORY[0x263F8EED0]) + 0x70))(v56, v20, v21);
    sub_20ACD4FD0();
    v27(v56, 0, v22);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_29:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v76);
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

id FitCoreDQueryClass.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id FitCoreDQueryClass.init()()
{
  id v1 = v0;
  id v2 = v0;
  uint64_t v31 = v0;
  uint64_t v24 = OBJC_IVAR____TtC19AppleMediaDiscovery18FitCoreDQueryClass_tableUpdateSummary;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
  sub_20ACD53F0();
  *(void *)&v28[v24] = sub_20ACD4FA0();

  uint64_t v27 = OBJC_IVAR____TtC19AppleMediaDiscovery18FitCoreDQueryClass_allFitnessTables;
  uint64_t v26 = sub_20ACD53F0();
  uint64_t v25 = v3;
  *uint64_t v3 = sub_20ACD5010();
  v25[1] = v4;
  v25[2] = sub_20ACD5010();
  v25[3] = v5;
  v25[4] = sub_20ACD5010();
  v25[5] = v6;
  v25[6] = sub_20ACD5010();
  v25[7] = v7;
  v25[8] = sub_20ACD5010();
  v25[9] = v8;
  v25[10] = sub_20ACD5010();
  v25[11] = v9;
  v25[12] = sub_20ACD5010();
  v25[13] = v10;
  v25[14] = sub_20ACD5010();
  v25[15] = v11;
  v25[16] = sub_20ACD5010();
  v25[17] = v12;
  v25[18] = sub_20ACD5010();
  v25[19] = v13;
  v25[20] = sub_20ACD5010();
  v25[21] = v14;
  v25[22] = sub_20ACD5010();
  v25[23] = v15;
  v25[24] = sub_20ACD5010();
  v25[25] = v16;
  v25[26] = sub_20ACD5010();
  v25[27] = v17;
  v25[28] = sub_20ACD5010();
  v25[29] = v18;
  v25[30] = sub_20ACD5010();
  v25[31] = v19;
  v25[32] = sub_20ACD5010();
  v25[33] = v20;
  v25[34] = sub_20ACD5010();
  v25[35] = v21;
  sub_20ACAD01C();
  *(void *)&v28[v27] = v26;

  v30.receiver = v31;
  v30.super_class = (Class)type metadata accessor for FitCoreDQueryClass();
  id v29 = objc_msgSendSuper2(&v30, sel_init);
  id v22 = v29;
  uint64_t v31 = v29;

  return v29;
}

id FitCoreDQueryClass.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FitCoreDQueryClass();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACBFA14()
{
}

void *sub_20ACBFA40(const void *a1, void *a2)
{
  return a2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACBFAAC()
{
}

uint64_t sub_20ACBFAEC()
{
  return swift_release();
}

uint64_t sub_20ACBFB30(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACBFB94(uint64_t a1)
{
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80) & 0x20000) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
}

uint64_t type metadata accessor for FitCoreDQueryClass()
{
  return self;
}

uint64_t method lookup function for FitCoreDQueryClass()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FitCoreDQueryClass.filterFitcoreDCatalog(catalogFilterConfig:)(uint64_t a1)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = *(int **)((*v1 & *MEMORY[0x263F8EED0]) + 0x90);
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v5 + *v5);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  *uint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_20ACBFDF0;
  return v7(a1);
}

uint64_t sub_20ACBFDF0(uint64_t a1)
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(v4 + 16) + 8);
  return v2(a1);
}

uint64_t dispatch thunk of FitCoreDQueryClass.queryWorkoutReferences(workoutQueryConfig:)(uint64_t a1)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = *(int **)((*v1 & *MEMORY[0x263F8EED0]) + 0x98);
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v5 + *v5);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  *uint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_20ACC0058;
  return v7(a1);
}

uint64_t sub_20ACC0058(uint64_t a1)
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(v4 + 16) + 8);
  return v2(a1);
}

uint64_t dispatch thunk of FitCoreDQueryClass.filterFitcoreDCatalogDebug(catalogFilterConfig:)(uint64_t a1)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = *(int **)((*v1 & *MEMORY[0x263F8EED0]) + 0xA0);
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v5 + *v5);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  *uint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_20ACC02C0;
  return v7(a1);
}

uint64_t sub_20ACC02C0(uint64_t a1)
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(v4 + 16) + 8);
  return v2(a1);
}

uint64_t dispatch thunk of FitCoreDQueryClass.fetchCatalogMetadata()()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v4 = *(int **)((*v0 & *MEMORY[0x263F8EED0]) + 0xA8);
  uint64_t v6 = (uint64_t (*)(void))((char *)v4 + *v4);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = sub_20ACC0520;
  return v6();
}

uint64_t sub_20ACC0520(uint64_t a1)
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(v4 + 16) + 8);
  return v2(a1);
}

uint64_t dispatch thunk of FitCoreDQueryClass.runBootstrapCatalogSync(bootstrapCatalogSyncConfig:)(uint64_t a1)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = *(int **)((*v1 & *MEMORY[0x263F8EED0]) + 0xB0);
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v5 + *v5);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  *uint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_20ACC0788;
  return v7(a1);
}

uint64_t sub_20ACC0788(uint64_t a1)
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(v4 + 16) + 8);
  return v2(a1);
}

uint64_t sub_20ACC08BC(uint64_t result)
{
  uint64_t v4 = result;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    if (result > 0)
    {
      sub_20ACD4AF0();
      uint64_t v1 = sub_20ACD5100();
      *(void *)(v1 + 16) = v4;
      uint64_t v3 = v1;
    }
    else
    {
      uint64_t v2 = MEMORY[0x263F8EE78];
      swift_retain();
      uint64_t v3 = v2;
    }
    sub_20ACD4AF0();
    return v3;
  }
  return result;
}

uint64_t sub_20ACC099C(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t sub_20ACC09A4(uint64_t a1)
{
  uint64_t v36 = a1;
  uint64_t v1 = sub_20ACD4AF0();
  uint64_t v37 = *(void *)(v1 - 8);
  uint64_t v38 = v1 - 8;
  unint64_t v39 = (*(void *)(v37 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v36);
  uint64_t v40 = (uint64_t)&v16 - v39;
  unint64_t v41 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v42 = (char *)&v16 - v41;
  unint64_t v43 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v44 = (char *)&v16 - v43;
  if (sub_20ACC0EBC(v6))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267681050);
    uint64_t v35 = sub_20ACD52B0();
  }
  else
  {
    uint64_t v34 = MEMORY[0x263F8EE88];
    swift_retain();
    uint64_t v35 = v34;
  }
  uint64_t v32 = v35;
  uint64_t v33 = sub_20ACC099C(v36);
  if (v33)
  {
    uint64_t v30 = v32 + 56;
    for (uint64_t i = 0; ; uint64_t i = v29)
    {
      uint64_t v28 = i;
      int v27 = sub_20ACC0ED4();
      sub_20ACC0EE0(v28, v27 & 1, v36);
      uint64_t result = sub_20ACC0F3C(v28, v27 & 1, v36, (uint64_t)v44);
      uint64_t v29 = v28 + 1;
      if (__OFADD__(v28, 1)) {
        break;
      }
      sub_20ACC104C(v44, v42);
      id v23 = &v47;
      sub_20ACD5420();
      uint64_t v24 = __dst;
      memcpy(__dst, v23, sizeof(__dst));
      sub_20ACD4AE0();
      uint64_t v9 = sub_20ACD5430();
      uint64_t v25 = (1 << (*(unsigned char *)(v32 + 32) & 0x3F)) - 1;
      unint64_t v26 = v9 & v25;
      if ((*(void *)(v30 + 8 * (v26 / 0x40)) & (1 << ((v26 % 0x40) & 0x3F))) != 0)
      {
        for (unint64_t j = v26; ; unint64_t j = v19)
        {
          unint64_t v20 = j;
          sub_20ACC1118((uint64_t *)(*(void *)(v32 + 48) + j * *(void *)(v37 + 72)), v40);
          int v21 = MEMORY[0x21052B070](v40, v42);
          sub_20ACC1454(v40);
          if (v21) {
            break;
          }
          unint64_t v19 = (v20 + 1) & v25;
          if ((*(void *)(v30 + 8 * (v19 / 0x40)) & (1 << ((v19 % 0x40) & 0x3F))) == 0)
          {
            unint64_t v18 = v19;
            goto LABEL_18;
          }
        }
        sub_20ACC1454((uint64_t)v42);
      }
      else
      {
        unint64_t v18 = v26;
LABEL_18:
        uint64_t v10 = v32;
        uint64_t v11 = v42;
        uint64_t v12 = v37;
        unint64_t v13 = v18;
        *(void *)(v30 + 8 * (v18 / 0x40)) |= 1 << ((v18 % 0x40) & 0x3F);
        uint64_t result = (uint64_t)sub_20ACC104C(v11, (void *)(*(void *)(v10 + 48) + v13 * *(void *)(v12 + 72)));
        uint64_t v14 = *(void *)(v32 + 16);
        uint64_t v17 = v14 + 1;
        if (__OFADD__(v14, 1)) {
          goto LABEL_27;
        }
        *(void *)(v32 + 16) = v17;
      }
      if (v29 == v33) {
        goto LABEL_25;
      }
    }
    __break(1u);
LABEL_27:
    __break(1u);
  }
  else
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return v32;
  }
  return result;
}

uint64_t sub_20ACC0EBC(uint64_t a1)
{
  return sub_20ACC099C(a1);
}

uint64_t sub_20ACC0ED4()
{
  return 1;
}

uint64_t sub_20ACC0EE0(uint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if (result < 0)
    {
      __break(1u);
    }
    else if (result < *(void *)(a3 + 16))
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_20ACC0F3C@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (a2)
  {
    uint64_t v5 = sub_20ACD4AF0();
    return sub_20ACC1118((uint64_t *)(a3+ ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80))+ a1 * *(void *)(*(void *)(v5 - 8) + 72)), a4);
  }
  else
  {
    uint64_t v6 = sub_20ACC15DC(a1, a3);
    uint64_t result = sub_20ACD4AF0();
    if (*(void *)(*(void *)(result - 8) + 64) == 8)
    {
      uint64_t v10 = v6;
      sub_20ACC1118(&v10, a4);
      return swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void *sub_20ACC104C(const void *a1, void *a2)
{
  uint64_t v6 = sub_20ACD4AF0();
  if (swift_getEnumCaseMultiPayload() == 5)
  {
    uint64_t v2 = sub_20ACD4A70();
    (*(void (**)(void *, const void *))(*(void *)(v2 - 8) + 32))(a2, a1);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a2, a1, *(void *)(*(void *)(v6 - 8) + 64));
  }
  return a2;
}

uint64_t sub_20ACC1118(uint64_t *a1, uint64_t a2)
{
  sub_20ACD4AF0();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      *(void *)a2 = *a1;
      uint64_t v14 = a1[1];
      swift_bridgeObjectRetain();
      *(void *)(a2 + 8) = v14;
      swift_storeEnumTagMultiPayload();
      break;
    case 2u:
      *(void *)a2 = *a1;
      uint64_t v13 = a1[1];
      swift_bridgeObjectRetain();
      *(void *)(a2 + 8) = v13;
      swift_storeEnumTagMultiPayload();
      break;
    case 3u:
      *(void *)a2 = *a1;
      uint64_t v12 = a1[1];
      swift_bridgeObjectRetain();
      *(void *)(a2 + 8) = v12;
      swift_storeEnumTagMultiPayload();
      break;
    case 4u:
      *(void *)a2 = *a1;
      uint64_t v11 = a1[1];
      swift_bridgeObjectRetain();
      *(void *)(a2 + 8) = v11;
      swift_storeEnumTagMultiPayload();
      break;
    case 5u:
      uint64_t v2 = sub_20ACD4A70();
      (*(void (**)(uint64_t, uint64_t *))(*(void *)(v2 - 8) + 16))(a2, a1);
      swift_storeEnumTagMultiPayload();
      break;
    case 6u:
      *(void *)a2 = *a1;
      uint64_t v10 = a1[1];
      swift_bridgeObjectRetain();
      *(void *)(a2 + 8) = v10;
      swift_storeEnumTagMultiPayload();
      break;
    case 7u:
      *(void *)a2 = *a1;
      uint64_t v9 = a1[1];
      swift_bridgeObjectRetain();
      *(void *)(a2 + 8) = v9;
      swift_storeEnumTagMultiPayload();
      break;
    case 8u:
      *(void *)a2 = *a1;
      uint64_t v8 = a1[1];
      swift_bridgeObjectRetain();
      *(void *)(a2 + 8) = v8;
      swift_storeEnumTagMultiPayload();
      break;
    case 9u:
      *(void *)a2 = *a1;
      uint64_t v7 = a1[1];
      swift_bridgeObjectRetain();
      *(void *)(a2 + 8) = v7;
      swift_storeEnumTagMultiPayload();
      break;
    case 0xAu:
      uint64_t v4 = *a1;
      uint64_t v5 = a1[1];
      char v6 = *((unsigned char *)a1 + 16);
      sub_20ACBD760(*a1, v5, v6 & 1);
      *(void *)a2 = v4;
      *(void *)(a2 + 8) = v5;
      *(unsigned char *)(a2 + 16) = v6 & 1;
      swift_storeEnumTagMultiPayload();
      break;
    default:
      *(void *)a2 = *a1;
      uint64_t v15 = a1[1];
      swift_bridgeObjectRetain();
      *(void *)(a2 + 8) = v15;
      swift_storeEnumTagMultiPayload();
      break;
  }
  return a2;
}

uint64_t sub_20ACC1454(uint64_t a1)
{
  sub_20ACD4AF0();
  unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    uint64_t v3 = EnumCaseMultiPayload;
    char v2 = 1;
  }
  else
  {
    uint64_t v3 = 0;
    char v2 = 0;
  }
  if ((v2 & 1) == 0)
  {
    switch(v3)
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 6:
      case 7:
      case 8:
      case 9:
        swift_bridgeObjectRelease();
        break;
      case 5:
        uint64_t v4 = sub_20ACD4A70();
        (*(void (**)(uint64_t))(*(void *)(v4 - 8) + 8))(a1);
        break;
      case 10:
        sub_20ACBD7D0(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16) & 1);
        break;
      default:
        JUMPOUT(0);
    }
  }
  return a1;
}

uint64_t sub_20ACC15DC(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = a1;
  uint64_t v19 = a2;
  unint64_t v20 = "Fatal error";
  uint64_t v22 = sub_20ACD4AF0();
  unint64_t v23 = (*(void *)(*(void *)(v22 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t result = MEMORY[0x270FA5388](v21);
  uint64_t v24 = (uint64_t)v9 - v23;
  if (result < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v21 >= *(void *)(v19 + 16))
  {
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v17 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x20 + 8 * v21);
  unint64_t v18 = &v26;
  uint64_t v26 = v17;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v3 = sub_20ACC182C(82);
    uint64_t v11 = v25;
    v25[0] = v3;
    v25[1] = v4;
    int v10 = 1;
    sub_20ACD5010();
    v9[0] = v5;
    sub_20ACD5030();
    swift_bridgeObjectRelease();
    sub_20ACD5010();
    v9[1] = v6;
    sub_20ACD5030();
    swift_bridgeObjectRelease();
    uint64_t v16 = 11;
    sub_20ACD5010();
    uint64_t v12 = v7;
    sub_20ACD5030();
    swift_bridgeObjectRelease();
    uint64_t ObjectType = swift_getObjectType();
    swift_unknownObjectRelease();
    int v15 = 0;
    sub_20ACD5440();
    uint64_t v14 = v8;
    sub_20ACD5030();
    swift_bridgeObjectRelease();
    sub_20ACD5000();
    sub_20ACD5350();
    __break(1u);
  }
  sub_20ACC1454(v24);
  return v17;
}

uint64_t sub_20ACC182C(uint64_t a1)
{
  if (a1 > 15) {
    sub_20ACD52C0();
  }
  return 0;
}

unint64_t sub_20ACC18A8()
{
  uint64_t v2 = qword_26ACA0CC8;
  if (!qword_26ACA0CC8)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_26ACA0CC8);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *result)
{
  uint64_t v3 = result;
  if ((*(_DWORD *)(*(void *)(result[3] - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v1 = swift_allocBox();
    uint64_t result = v2;
    *uint64_t v3 = v1;
  }
  return result;
}

uint64_t static AMDSwiftTests.strToInt(strValue:)(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  sub_20ACC1CBC();
  sub_20ACC1D38();
  sub_20ACD5320();
  if (v13) {
    uint64_t v9 = sub_20ACD5010();
  }
  else {
    uint64_t v9 = sub_20ACD5050();
  }
  uint64_t v10 = v2;
  sub_20ACD5230();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267681060);
  sub_20ACD53F0();
  uint64_t v7 = v3;
  swift_bridgeObjectRetain();
  uint64_t v5 = MEMORY[0x263F8D310];
  v7[3] = MEMORY[0x263F8D310];
  unint64_t v6 = sub_20ACC1DB4();
  v7[4] = v6;
  void *v7 = a1;
  v7[1] = a2;
  swift_bridgeObjectRetain();
  v7[8] = v5;
  v7[9] = v6;
  v7[5] = v9;
  v7[6] = v10;
  sub_20ACAD01C();
  id v8 = (id)sub_20ACC1E30();
  sub_20ACD4F20();

  swift_bridgeObjectRelease();
  return v9;
}

unint64_t sub_20ACC1CBC()
{
  uint64_t v2 = qword_267681058;
  if (!qword_267681058)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267681058);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_20ACC1D38()
{
  uint64_t v2 = qword_26ACA0C30;
  if (!qword_26ACA0C30)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26ACA0C30);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_20ACC1DB4()
{
  uint64_t v2 = qword_267681068;
  if (!qword_267681068)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267681068);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_20ACC1E30()
{
  return sub_20ACD5250();
}

id AMDSwiftTests.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id AMDSwiftTests.init()()
{
  id v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for AMDSwiftTests();
  id v2 = objc_msgSendSuper2(&v3, sel_init);
  id v0 = v2;
  id v4 = v2;

  return v2;
}

uint64_t type metadata accessor for AMDSwiftTests()
{
  return self;
}

id AMDSwiftTests.__deallocating_deinit()
{
  objc_super v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AMDSwiftTests();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_20ACC203C()
{
  uint64_t v2 = qword_267681070;
  if (!qword_267681070)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267681070);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_20ACC20A4()
{
  uint64_t v1 = sub_20ACD4F50();
  __swift_allocate_value_buffer(v1, qword_26ACA0DB0);
  __swift_project_value_buffer(v1, (uint64_t)qword_26ACA0DB0);
  return sub_20ACD4F40();
}

uint64_t sub_20ACC20F0()
{
  if (qword_26ACA0D90 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_20ACD4F50();
  return __swift_project_value_buffer(v0, (uint64_t)qword_26ACA0DB0);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

uint64_t sub_20ACC21C4(uint64_t a1)
{
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  v2[3] = a1;
  v2[4] = v1;
  return MEMORY[0x270FA2498](sub_20ACC2204, 0);
}

uint64_t sub_20ACC2204()
{
  *(void *)(v0 + 16) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
  sub_20ACD53F0();
  id v8 = v1;
  *uint64_t v1 = sub_20ACD5010();
  v8[1] = v2;
  uint64_t v3 = sub_20ACD5010();
  v8[5] = MEMORY[0x263F8D310];
  v8[2] = v3;
  v8[3] = v4;
  sub_20ACAD01C();
  uint64_t v5 = sub_20ACD4FA0();
  unint64_t v6 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 16) + 8);
  return v6(v5);
}

uint64_t sub_20ACC23EC(void *a1, const void *a2, void *a3)
{
  v3[4] = a3;
  v3[3] = a1;
  v3[2] = v3;
  id v5 = a1;
  v3[5] = _Block_copy(a2);
  id v6 = a3;
  uint64_t v11 = sub_20ACD4F80();
  v3[6] = v11;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v10 + 56) = v7;
  void *v7 = *(void *)(v10 + 16);
  v7[1] = sub_20ACC24F4;
  return sub_20ACC21C4(v11);
}

uint64_t sub_20ACC24F4()
{
  uint64_t v7 = *v0;
  id v6 = *(void (***)(void))(*v0 + 40);
  uint64_t v4 = *(void **)(*v0 + 32);
  uint64_t v3 = *(void **)(*v0 + 24);
  *(void *)(v7 + 16) = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  id v5 = (id)sub_20ACD4F70();
  v6[2]();

  _Block_release(v6);
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v7 + 16) + 8);
  return v1();
}

uint64_t sub_20ACC26F0()
{
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_20ACC2740()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v8 = (void *)v0[2];
  id v6 = (const void *)v0[3];
  uint64_t v7 = (void *)v0[4];
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = sub_20ACC282C;
  uint64_t v3 = dword_267681080;
  return ((uint64_t (*)(void *, const void *, void *))((char *)&dword_267681080 + v3))(v8, v6, v7);
}

uint64_t sub_20ACC282C()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

id SearchToolQueryHandler.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SearchToolQueryHandler.init()()
{
  id v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for SearchToolQueryHandler();
  id v2 = objc_msgSendSuper2(&v3, sel_init);
  id v0 = v2;
  id v4 = v2;

  return v2;
}

uint64_t type metadata accessor for SearchToolQueryHandler()
{
  return self;
}

id SearchToolQueryHandler.__deallocating_deinit()
{
  objc_super v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchToolQueryHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for SearchToolQueryHandler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SearchToolQueryHandler.querySearchTool(searchtoolQueryConfig:)(uint64_t a1)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = *(int **)((*v1 & *MEMORY[0x263F8EED0]) + 0x50);
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v5 + *v5);
  objc_super v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  *objc_super v3 = *(void *)(v6 + 16);
  v3[1] = sub_20ACC2BE8;
  return v7(a1);
}

uint64_t sub_20ACC2BE8(uint64_t a1)
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(v4 + 16) + 8);
  return v2(a1);
}

uint64_t __swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v2 = swift_slowAlloc();
    *a2 = v2;
    return v2;
  }
  return (uint64_t)v5;
}

uint64_t sub_20ACC2DC4()
{
  uint64_t v7 = sub_20ACD53F0();
  uint64_t v6 = v0;
  uint64_t *v0 = sub_20ACD5010();
  v6[1] = v1;
  v6[2] = sub_20ACD5010();
  v6[3] = v2;
  uint64_t v3 = sub_20ACD5010();
  uint64_t result = v7;
  v6[4] = v3;
  v6[5] = v5;
  sub_20ACAD01C();
  qword_26ACA0DC8 = v7;
  return result;
}

uint64_t *sub_20ACC2E9C()
{
  if (qword_26ACA0DA0 != -1) {
    swift_once();
  }
  return &qword_26ACA0DC8;
}

uint64_t sub_20ACC2F00()
{
  uint64_t v5 = sub_20ACD53F0();
  uint64_t v4 = v0;
  uint64_t v1 = sub_20ACD5010();
  uint64_t result = v5;
  *uint64_t v4 = v1;
  v4[1] = v3;
  sub_20ACAD01C();
  qword_267681340 = v5;
  return result;
}

uint64_t *sub_20ACC2F80()
{
  if (qword_267681178 != -1) {
    swift_once();
  }
  return &qword_267681340;
}

uint64_t sub_20ACC2FE4(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      return 0;
    case 2:
      return 1;
    case 3:
      return 2;
    case 4:
      return 3;
  }
  return 4;
}

uint64_t sub_20ACC30A0(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = 2;
      break;
    case 2:
      uint64_t v2 = 3;
      break;
    case 3:
      uint64_t v2 = 4;
      break;
    default:
      uint64_t v2 = 1;
      break;
  }
  return v2;
}

uint64_t sub_20ACC312C()
{
  return sub_20ACD5400() & 1;
}

unint64_t sub_20ACC3178()
{
  uint64_t v2 = qword_267681098;
  if (!qword_267681098)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267681098);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_20ACC31F8()
{
  return sub_20ACD5090();
}

uint64_t sub_20ACC3238()
{
  return sub_20ACD50B0();
}

uint64_t sub_20ACC3280()
{
  return sub_20ACD50A0();
}

uint64_t sub_20ACC32C8@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_20ACC2FE4(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_20ACC32F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_20ACC30A0(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_20ACC3328()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC19AppleMediaDiscovery18AMDVectorDBManager_client);
  swift_retain();
  return v2;
}

id AMDVectorDBManager.__allocating_init(vectorDBConfig:)(uint64_t a1)
{
  id v2 = objc_allocWithZone(v1);
  id v7 = AMDVectorDBManager.init(vectorDBConfig:)(a1);
  if (v5) {
    return (id)v4;
  }
  else {
    return v7;
  }
}

id AMDVectorDBManager.init(vectorDBConfig:)(uint64_t a1)
{
  uint64_t v296 = a1;
  uint64_t v281 = 0;
  uint64_t v247 = sub_20ACC53A4;
  uint64_t v248 = sub_20ACD25FC;
  int v249 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD2580;
  uint64_t v250 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD25B4;
  uint64_t v251 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD2648;
  uint64_t v252 = sub_20ACD26BC;
  int v253 = sub_20ACD2770;
  uint64_t v254 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD26F4;
  uint64_t v255 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD2728;
  uint64_t v256 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD27BC;
  uint64_t v257 = "Fatal error";
  int v258 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v259 = "AppleMediaDiscovery/AMDVectorDB.swift";
  v377[4] = *MEMORY[0x263EF8340];
  uint64_t v352 = 0;
  uint64_t v351 = 0;
  uint64_t v350 = 0;
  uint64_t v349 = 0;
  id v348 = 0;
  uint64_t v347 = 0;
  uint64_t v341 = 0;
  uint64_t v342 = 0;
  uint64_t v340 = 0;
  uint64_t v335 = 0;
  uint64_t v325 = 0;
  uint64_t v326 = 0;
  uint64_t v319 = 0;
  uint64_t v320 = 0;
  uint64_t v315 = 0;
  uint64_t v309 = 0;
  uint64_t v310 = 0;
  uint64_t v260 = sub_20ACD4DB0();
  uint64_t v261 = *(void *)(v260 - 8);
  uint64_t v262 = v260 - 8;
  unint64_t v263 = (*(void *)(v261 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](0);
  uint64_t v264 = (char *)v95 - v263;
  unint64_t v265 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  uint64_t v266 = (char *)v95 - v265;
  uint64_t v352 = (char *)v95 - v265;
  uint64_t v267 = sub_20ACD4E10();
  uint64_t v268 = *(void *)(v267 - 8);
  uint64_t v269 = v267 - 8;
  unint64_t v270 = (*(void *)(v268 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v281);
  int v271 = (char *)v95 - v270;
  unint64_t v272 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  uint64_t v273 = (uint64_t)v95 - v272;
  uint64_t v351 = (char *)v95 - v272;
  uint64_t v274 = sub_20ACD4DD0();
  uint64_t v275 = *(void *)(v274 - 8);
  uint64_t v276 = v274 - 8;
  unint64_t v277 = (*(void *)(v275 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = MEMORY[0x270FA5388](v281);
  uint64_t v278 = (char *)v95 - v277;
  unint64_t v279 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v6);
  uint64_t v280 = (uint64_t)v95 - v279;
  uint64_t v350 = (char *)v95 - v279;
  uint64_t v282 = sub_20ACD49D0();
  uint64_t v283 = *(void *)(v282 - 8);
  uint64_t v284 = v282 - 8;
  unint64_t v285 = (*(void *)(v283 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = MEMORY[0x270FA5388](v281);
  uint64_t v286 = (char *)v95 - v285;
  unint64_t v287 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v8);
  uint64_t v288 = (char *)v95 - v287;
  uint64_t v349 = (char *)v95 - v287;
  uint64_t v289 = sub_20ACD4F50();
  uint64_t v290 = *(void **)(v289 - 8);
  uint64_t v291 = v289 - 8;
  unint64_t v292 = (v290[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = MEMORY[0x270FA5388](v296);
  uint64_t v293 = (char *)v95 - v292;
  unint64_t v294 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  int v295 = (char *)v95 - v294;
  uint64_t v347 = v12;
  id v13 = v1;
  id v348 = v1;
  uint64_t v14 = sub_20ACD5010();
  uint64_t v297 = v346;
  v346[0] = v14;
  v346[1] = v15;
  MEMORY[0x21052B560](v377);
  sub_20ACAD060();
  BOOL v244 = v377[3] == 0;
  BOOL v243 = v244;
  sub_20ACB3678((uint64_t)v377);
  if (v243)
  {

    sub_20ACD27C8();
    int v230 = 1;
    uint64_t v239 = sub_20ACD5010();
    uint64_t v237 = v16;
    uint64_t v238 = sub_20ACC30A0(0);
    uint64_t v233 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
    uint64_t v232 = sub_20ACD53F0();
    uint64_t v231 = v17;
    id v234 = (id)*MEMORY[0x263F08320];
    id v18 = v234;
    uint64_t v19 = sub_20ACD4FF0();
    unint64_t v20 = v231;
    *uint64_t v231 = v19;
    v20[1] = v21;
    uint64_t v22 = sub_20ACD5010();
    unint64_t v23 = v231;
    uint64_t v24 = v22;
    uint64_t v25 = v232;
    uint64_t v236 = MEMORY[0x263F8D310];
    v231[5] = MEMORY[0x263F8D310];
    v23[2] = v24;
    v23[3] = v26;
    sub_20ACAD01C();
    uint64_t v235 = v25;

    uint64_t v27 = sub_20ACD4FA0();
    id v241 = sub_20ACC52D8(v239, v237, v238, v27);
    swift_willThrow();
    uint64_t v242 = (uint64_t)v241;
LABEL_38:
    v95[0] = v242;
    swift_bridgeObjectRelease();
    v95[1] = v348;
    type metadata accessor for AMDVectorDBManager();
    swift_deallocPartialClassInstance();
    return (id)v240;
  }
  uint64_t v28 = sub_20ACD5010();
  uint64_t v229 = v345;
  v345[0] = v28;
  v345[1] = v29;
  MEMORY[0x21052B560](v375);
  sub_20ACAD060();
  if (!v375[3])
  {
    sub_20ACD5340();
    __break(1u);
  }
  uint64_t v223 = v376;
  sub_20ACB323C((uint64_t)v375, (uint64_t)v376);
  uint64_t v227 = MEMORY[0x263F8EE58] + 8;
  uint64_t v226 = MEMORY[0x263F8D310];
  swift_dynamicCast();
  uint64_t v224 = v343;
  int v225 = v344;
  uint64_t v341 = v343;
  uint64_t v342 = v344;
  uint64_t v340 = 50;
  uint64_t v30 = sub_20ACD5010();
  uint64_t v228 = v339;
  v339[0] = v30;
  v339[1] = v31;
  MEMORY[0x21052B560](v374);
  sub_20ACAD060();
  BOOL v222 = v374[3] != 0;
  BOOL v221 = v222;
  sub_20ACB3678((uint64_t)v374);
  if (v221)
  {
    uint64_t v32 = sub_20ACD5010();
    uint64_t v220 = v299;
    v299[0] = v32;
    v299[1] = v33;
    MEMORY[0x21052B560](v353);
    sub_20ACAD060();
    if (!v353[3])
    {
      sub_20ACD5340();
      __break(1u);
    }
    uint64_t v219 = v354;
    sub_20ACB323C((uint64_t)v353, (uint64_t)v354);
    swift_dynamicCast();
    uint64_t v340 = v298;
  }
  uint64_t v34 = v295;
  uint64_t v35 = sub_20ACC20F0();
  uint64_t v199 = (void (*)(char *, uint64_t, uint64_t))v290[2];
  v200 = v290 + 2;
  v199(v34, v35, v289);
  swift_bridgeObjectRetain();
  uint64_t v207 = 32;
  uint64_t v208 = 7;
  uint64_t v36 = swift_allocObject();
  uint64_t v37 = v225;
  uint64_t v209 = v36;
  *(void *)(v36 + 16) = v224;
  *(void *)(v36 + 24) = v37;
  uint64_t v217 = sub_20ACD4F30();
  int v218 = sub_20ACD5220();
  uint64_t v203 = &v337;
  uint64_t v337 = 12;
  unint64_t v201 = sub_20ACD01EC();
  unint64_t v202 = sub_20ACD0268();
  unint64_t v204 = sub_20ACD02E4();
  sub_20ACD5080();
  uint32_t v205 = v338;
  uint64_t v206 = 17;
  uint64_t v211 = swift_allocObject();
  *(unsigned char *)(v211 + 16) = 32;
  uint64_t v212 = swift_allocObject();
  *(unsigned char *)(v212 + 16) = 8;
  uint64_t v38 = swift_allocObject();
  uint64_t v39 = v209;
  uint64_t v210 = v38;
  *(void *)(v38 + 16) = v247;
  *(void *)(v38 + 24) = v39;
  uint64_t v40 = swift_allocObject();
  uint64_t v41 = v210;
  uint64_t v214 = v40;
  *(void *)(v40 + 16) = v248;
  *(void *)(v40 + 24) = v41;
  uint64_t v216 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B60);
  uint64_t v213 = sub_20ACD53F0();
  uint64_t v215 = v42;
  swift_retain();
  uint64_t v43 = v211;
  uint64_t v44 = v215;
  *uint64_t v215 = v249;
  v44[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v43;
  swift_retain();
  uint64_t v45 = v212;
  uint64_t v46 = v215;
  v215[2] = v250;
  v46[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v45;
  swift_retain();
  char v47 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v214;
  uint64_t v48 = v215;
  v215[4] = v251;
  v48[5] = v47;
  sub_20ACAD01C();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v217, (os_log_type_t)v218))
  {
    uint64_t v192 = (uint8_t *)sub_20ACD5280();
    uint64_t v191 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B48);
    uint64_t v193 = sub_20ACD0360(0);
    uint64_t v194 = sub_20ACD0360(1);
    uint64_t v195 = v302;
    v302[0] = v192;
    uint64_t v196 = &v356;
    uint64_t v356 = v193;
    uint64_t v197 = &v355;
    uint64_t v355 = v194;
    sub_20ACD03BC(2, v302);
    sub_20ACD03BC(1, v195);
    uint64_t v49 = v246;
    uint64_t v300 = v249;
    uint64_t v301 = v211;
    sub_20ACD03D0(&v300, (uint64_t)v195, (uint64_t)v196, (uint64_t)v197);
    uint64_t v198 = v49;
    if (v49)
    {
      __break(1u);
    }
    else
    {
      uint64_t v300 = v250;
      uint64_t v301 = v212;
      sub_20ACD03D0(&v300, (uint64_t)v302, (uint64_t)&v356, (uint64_t)&v355);
      uint64_t v189 = 0;
      uint64_t v50 = v189;
      uint64_t v300 = v251;
      uint64_t v301 = v214;
      sub_20ACD03D0(&v300, (uint64_t)v302, (uint64_t)&v356, (uint64_t)&v355);
      uint64_t v188 = v50;
      _os_log_impl(&dword_20ABD4000, v217, (os_log_type_t)v218, "Fetching vectorDB config for dbName: %s", v192, v205);
      sub_20ACD041C(v193);
      sub_20ACD041C(v194);
      sub_20ACD5260();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v190 = v188;
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    uint64_t v190 = v246;
  }
  uint64_t v181 = v190;

  uint64_t v182 = (void (*)(char *, uint64_t))v290[1];
  uint64_t v183 = v290 + 1;
  v182(v295, v289);
  int v373 = 0;
  id v184 = self;
  swift_bridgeObjectRetain();
  id v186 = (id)sub_20ACD4FE0();
  swift_bridgeObjectRelease();
  id v336 = v373;
  id v187 = objc_msgSend(v184, sel_fetchVectorDBConfigForDBName_error_, v186, &v336);
  id v185 = v336;
  id v51 = v336;
  uint64_t v52 = v373;
  int v373 = v185;

  if (!v187)
  {

    id v96 = v373;
    uint64_t v97 = sub_20ACD4970();

    swift_willThrow();
    swift_bridgeObjectRelease();
    uint64_t v242 = v97;
    goto LABEL_38;
  }
  id v180 = v187;
  id v174 = v187;
  uint64_t v177 = MEMORY[0x263F8DB68];
  uint64_t v178 = MEMORY[0x263F8EE58] + 8;
  uint64_t v179 = MEMORY[0x263F8DB70];
  uint64_t v176 = sub_20ACD4F80();
  uint64_t v335 = v176;

  uint64_t v333 = sub_20ACD5010();
  uint64_t v334 = v53;
  int v175 = v372;
  sub_20ACD5390();
  MEMORY[0x21052B560](v371, v175, v176, v177, v178, v179);
  BOOL v173 = v371[3] == 0;
  BOOL v172 = v173;
  sub_20ACB3678((uint64_t)v371);
  sub_20ACBFB94((uint64_t)v372);
  sub_20ACAD060();
  if (v172)
  {

    uint64_t v155 = 0;
    unint64_t v157 = sub_20ACD27C8();
    int v156 = 1;
    uint64_t v170 = sub_20ACD5010();
    uint64_t v168 = v54;
    uint64_t v169 = sub_20ACC30A0(v156);
    uint64_t v164 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
    uint64_t v152 = 1;
    uint64_t v163 = sub_20ACD53F0();
    uint64_t v162 = v55;
    id v165 = (id)*MEMORY[0x263F08320];
    id v56 = v165;
    uint64_t v57 = sub_20ACD4FF0();
    uint64_t v58 = v162;
    *uint64_t v162 = v57;
    v58[1] = v59;
    uint64_t v153 = 30;
    uint64_t v60 = sub_20ACD53E0();
    uint64_t v159 = &v303;
    uint64_t v303 = v60;
    uint64_t v304 = v61;
    sub_20ACD5010();
    uint64_t v154 = v62;
    sub_20ACD53D0();
    swift_bridgeObjectRelease();
    v302[1] = v224;
    v302[2] = v225;
    uint64_t v167 = MEMORY[0x263F8D310];
    sub_20ACD53C0();
    sub_20ACD5010();
    uint64_t v158 = v63;
    sub_20ACD53D0();
    swift_bridgeObjectRelease();
    uint64_t v161 = v303;
    uint64_t v160 = v304;
    swift_bridgeObjectRetain();
    sub_20ACD2830();
    uint64_t v64 = sub_20ACD5000();
    uint64_t v65 = v162;
    uint64_t v66 = v64;
    uint64_t v67 = v163;
    v162[5] = v167;
    v65[2] = v66;
    v65[3] = v68;
    sub_20ACAD01C();
    uint64_t v166 = v67;

    uint64_t v69 = sub_20ACD4FA0();
    id v171 = sub_20ACC52D8(v170, v168, v169, v69);
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v242 = (uint64_t)v171;
    goto LABEL_38;
  }
  uint64_t v70 = v293;
  uint64_t v71 = sub_20ACC20F0();
  v199(v70, v71, v289);
  swift_bridgeObjectRetain();
  uint64_t v141 = 32;
  uint64_t v142 = 7;
  uint64_t v72 = swift_allocObject();
  uint64_t v73 = v225;
  uint64_t v143 = v72;
  *(void *)(v72 + 16) = v224;
  *(void *)(v72 + 24) = v73;
  uint64_t v150 = sub_20ACD4F30();
  int v151 = sub_20ACD5220();
  uint64_t v331 = 12;
  sub_20ACD5080();
  uint32_t v139 = v332;
  uint64_t v140 = 17;
  uint64_t v145 = swift_allocObject();
  *(unsigned char *)(v145 + 16) = 32;
  uint64_t v146 = swift_allocObject();
  *(unsigned char *)(v146 + 16) = 8;
  uint64_t v74 = swift_allocObject();
  uint64_t v75 = v143;
  uint64_t v144 = v74;
  *(void *)(v74 + 16) = v252;
  *(void *)(v74 + 24) = v75;
  uint64_t v76 = swift_allocObject();
  uint64_t v77 = v144;
  uint64_t v148 = v76;
  *(void *)(v76 + 16) = v253;
  *(void *)(v76 + 24) = v77;
  uint64_t v147 = sub_20ACD53F0();
  char v149 = v78;
  swift_retain();
  uint64_t v79 = v145;
  uint64_t v80 = v149;
  *char v149 = v254;
  v80[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v79;
  swift_retain();
  uint64_t v81 = v146;
  uint64_t v82 = v149;
  v149[2] = v255;
  v82[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v81;
  swift_retain();
  uint64_t v83 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v148;
  uint64_t v84 = v149;
  v149[4] = v256;
  v84[5] = v83;
  sub_20ACAD01C();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v150, (os_log_type_t)v151))
  {
    uint64_t v132 = (uint8_t *)sub_20ACD5280();
    uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B48);
    uint64_t v133 = sub_20ACD0360(0);
    uint64_t v134 = sub_20ACD0360(1);
    uint64_t v135 = &v307;
    int v307 = v132;
    uint64_t v136 = &v358;
    uint64_t v358 = v133;
    uint64_t v137 = &v357;
    uint64_t v357 = v134;
    sub_20ACD03BC(2, &v307);
    sub_20ACD03BC(1, v135);
    uint64_t v85 = v181;
    uint64_t v305 = v254;
    uint64_t v306 = v145;
    sub_20ACD03D0(&v305, (uint64_t)v135, (uint64_t)v136, (uint64_t)v137);
    uint64_t v138 = v85;
    if (v85)
    {
      __break(1u);
    }
    else
    {
      uint64_t v305 = v255;
      uint64_t v306 = v146;
      sub_20ACD03D0(&v305, (uint64_t)&v307, (uint64_t)&v358, (uint64_t)&v357);
      uint64_t v129 = 0;
      uint64_t v86 = v129;
      uint64_t v305 = v256;
      uint64_t v306 = v148;
      sub_20ACD03D0(&v305, (uint64_t)&v307, (uint64_t)&v358, (uint64_t)&v357);
      uint64_t v128 = v86;
      _os_log_impl(&dword_20ABD4000, v150, (os_log_type_t)v151, "Successfully fetched config for dbName: %s", v132, v139);
      sub_20ACD041C(v133);
      sub_20ACD041C(v134);
      sub_20ACD5260();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v130 = v128;
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    uint64_t v130 = v181;
  }
  uint64_t v126 = v130;

  v182(v293, v289);
  uint64_t v329 = sub_20ACD5010();
  uint64_t v330 = v87;
  uint64_t v127 = v369;
  sub_20ACD5390();
  MEMORY[0x21052B560](v368, v127, v176, MEMORY[0x263F8DB68], MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8DB70]);
  if (!v368[3])
  {
    sub_20ACD5340();
    __break(1u);
  }
  int v120 = v370;
  sub_20ACB323C((uint64_t)v368, (uint64_t)v370);
  uint64_t v125 = MEMORY[0x263F8EE58] + 8;
  uint64_t v123 = MEMORY[0x263F8D310];
  swift_dynamicCast();
  uint64_t v122 = v327;
  uint64_t v121 = v328;
  uint64_t v325 = v327;
  uint64_t v326 = v328;
  sub_20ACBFB94((uint64_t)v369);
  sub_20ACAD060();
  sub_20ACD4990();
  uint64_t v323 = sub_20ACD5010();
  uint64_t v324 = v88;
  uint64_t v124 = v366;
  sub_20ACD5390();
  MEMORY[0x21052B560](v365, v124, v176, MEMORY[0x263F8DB68], v125, MEMORY[0x263F8DB70]);
  if (!v365[3])
  {
    sub_20ACD5340();
    __break(1u);
  }
  uint64_t v113 = v367;
  sub_20ACB323C((uint64_t)v365, (uint64_t)v367);
  uint64_t v119 = MEMORY[0x263F8EE58] + 8;
  uint64_t v117 = MEMORY[0x263F8D310];
  swift_dynamicCast();
  uint64_t v115 = v321;
  uint64_t v114 = v322;
  uint64_t v319 = v321;
  uint64_t v320 = v322;
  sub_20ACBFB94((uint64_t)v366);
  sub_20ACAD060();
  uint64_t v116 = (objc_class *)type metadata accessor for AMDVectorDBManager();
  sub_20ACC9170(v280);
  uint64_t v317 = sub_20ACD5010();
  uint64_t v318 = v89;
  uint64_t v118 = v363;
  sub_20ACD5390();
  MEMORY[0x21052B560](v362, v118, v176, MEMORY[0x263F8DB68], v119, MEMORY[0x263F8DB70]);
  if (!v362[3])
  {
    sub_20ACD5340();
    __break(1u);
  }
  uint64_t v108 = v364;
  sub_20ACB323C((uint64_t)v362, (uint64_t)v364);
  uint64_t v110 = 8;
  uint64_t v112 = MEMORY[0x263F8EE58] + 8;
  swift_dynamicCast();
  uint64_t v109 = v316;
  uint64_t v315 = v316;
  sub_20ACBFB94((uint64_t)v363);
  sub_20ACAD060();
  uint64_t v313 = sub_20ACD5010();
  uint64_t v314 = v90;
  uint64_t v111 = v360;
  sub_20ACD5390();
  MEMORY[0x21052B560](v359, v111, v176, MEMORY[0x263F8DB68], v112, MEMORY[0x263F8DB70]);
  if (!v359[3])
  {
    sub_20ACD5340();
    __break(1u);
  }
  uint64_t v98 = v361;
  sub_20ACB323C((uint64_t)v359, (uint64_t)v361);
  swift_dynamicCast();
  uint64_t v99 = v311;
  uint64_t v106 = v312;
  uint64_t v309 = v311;
  uint64_t v310 = v312;
  sub_20ACBFB94((uint64_t)v360);
  sub_20ACAD060();
  sub_20ACC9340(v273);
  (*(void (**)(char *, char *, uint64_t))(v283 + 16))(v286, v288, v282);
  (*(void (**)(char *, uint64_t, uint64_t))(v275 + 16))(v278, v280, v274);
  uint64_t v105 = 0;
  sub_20ACD4E20();
  uint64_t v101 = sub_20ACD53F0();
  uint64_t v102 = v340;
  (*(void (**)(char *, uint64_t, uint64_t))(v268 + 16))(v271, v273, v267);
  uint64_t v103 = sub_20ACC53E4();
  uint64_t v104 = sub_20ACC53F0();
  uint64_t v100 = sub_20ACC53FC();
  sub_20ACC5408();
  sub_20ACD4DA0();
  sub_20ACD4D90();
  (*(void (**)(char *, char *, uint64_t))(v261 + 16))(v264, v266, v260);
  uint64_t v91 = sub_20ACD4D20();
  id v92 = v245;
  *(void *)&v245[OBJC_IVAR____TtC19AppleMediaDiscovery18AMDVectorDBManager_client] = v91;

  (*(void (**)(char *, uint64_t))(v261 + 8))(v266, v260);
  (*(void (**)(uint64_t, uint64_t))(v268 + 8))(v273, v267);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v275 + 8))(v280, v274);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v283 + 8))(v288, v282);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v308.receiver = v348;
  v308.super_class = v116;
  id v107 = objc_msgSendSuper2(&v308, sel_init);
  id v93 = v107;
  id v348 = v107;
  swift_bridgeObjectRelease();

  return v107;
}

id sub_20ACC52D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_20ACD0104(a1, a2, a3, a4);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACC5330()
{
}

uint64_t sub_20ACC5364()
{
  return swift_deallocObject();
}

uint64_t sub_20ACC53A4()
{
  uint64_t result = *(void *)(v0 + 16);
  sub_20ACC5330();
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACC53B0()
{
}

uint64_t sub_20ACC53E4()
{
  return 100;
}

uint64_t sub_20ACC53F0()
{
  return 64;
}

uint64_t sub_20ACC53FC()
{
  return 3;
}

float sub_20ACC5408()
{
  return 10.0;
}

id AMDVectorDBManager.__deallocating_deinit()
{
  uint64_t v4 = v0;
  swift_retain();
  sub_20ACD4D70();
  swift_release();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for AMDVectorDBManager();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_20ACC561C(uint64_t a1)
{
  uint64_t v140 = a1;
  uint64_t v131 = 0;
  uint64_t v121 = sub_20ACD2938;
  uint64_t v122 = sub_20ACD2CE4;
  uint64_t v123 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD296C;
  uint64_t v124 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD29A0;
  uint64_t v125 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD2D30;
  id v171 = 0;
  uint64_t v170 = 0;
  uint64_t v169 = 0;
  uint64_t v168 = 0;
  uint64_t v141 = __b;
  size_t v143 = 40;
  memset(__b, 0, sizeof(__b));
  uint64_t v163 = 0;
  uint64_t v162 = 0;
  uint64_t v153 = 0;
  uint64_t v154 = 0;
  uint64_t v152 = 0;
  uint64_t v146 = 0;
  uint64_t v126 = sub_20ACD4F50();
  uint64_t v127 = *(void *)(v126 - 8);
  uint64_t v128 = v126 - 8;
  unint64_t v129 = (*(void *)(v127 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v130 = (char *)&v43 - v129;
  uint64_t v132 = sub_20ACD4E40();
  uint64_t v133 = *(void *)(v132 - 8);
  uint64_t v134 = v132 - 8;
  uint64_t v136 = *(void *)(v133 + 64);
  unint64_t v135 = (v136 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v131);
  uint64_t v137 = (char *)&v43 - v135;
  unint64_t v138 = (v136 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  uint32_t v139 = (char *)&v43 - v138;
  id v171 = (char *)&v43 - v138;
  uint64_t v170 = v3;
  uint64_t v169 = v1;
  uint64_t v168 = sub_20ACD53F0();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676810A8);
  uint64_t v142 = &v172;
  sub_20ACD4F90();
  uint64_t v4 = v144;
  memcpy(v141, v142, v143);
  for (uint64_t i = v4; ; uint64_t i = v116)
  {
    uint64_t v116 = i;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2676810B0);
    sub_20ACD4FB0();
    uint64_t v117 = v164;
    uint64_t v118 = v165;
    uint64_t v119 = v166;
    if (!v165) {
      break;
    }
    uint64_t v113 = v117;
    uint64_t v114 = v118;
    uint64_t v115 = v119;
    uint64_t v110 = v119;
    uint64_t v111 = v118;
    uint64_t v112 = v117;
    uint64_t v153 = v117;
    uint64_t v154 = v118;
    uint64_t v152 = v119;
    swift_bridgeObjectRetain();
    sub_20ACC1CBC();
    sub_20ACD5330();
    uint64_t v147 = v149;
    char v148 = v150 & 1;
    if (v150) {
      uint64_t v151 = -1;
    }
    else {
      uint64_t v151 = v147;
    }
    uint64_t v109 = v151;
    uint64_t v146 = v151;
    if (v151 == -1)
    {
      sub_20ACD27C8();
      int v96 = 1;
      uint64_t v105 = sub_20ACD5010();
      uint64_t v103 = v5;
      uint64_t v104 = sub_20ACC30A0(3);
      uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
      uint64_t v98 = sub_20ACD53F0();
      uint64_t v97 = v6;
      id v100 = (id)*MEMORY[0x263F08320];
      id v7 = v100;
      uint64_t v8 = sub_20ACD4FF0();
      uint64_t v9 = v97;
      *uint64_t v97 = v8;
      v9[1] = v10;
      uint64_t v11 = sub_20ACD5010();
      uint64_t v12 = v97;
      uint64_t v13 = v11;
      uint64_t v14 = v98;
      uint64_t v102 = MEMORY[0x263F8D310];
      v97[5] = MEMORY[0x263F8D310];
      v12[2] = v13;
      v12[3] = v15;
      sub_20ACAD01C();
      uint64_t v101 = v14;

      uint64_t v16 = sub_20ACD4FA0();
      id v107 = sub_20ACC52D8(v105, v103, v104, v16);
      swift_willThrow();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_20ACD285C();
      sub_20ACD28E0();
      id v108 = v107;
      return v106;
    }
    sub_20ACD4E30();
    (*(void (**)(char *, char *, uint64_t))(v133 + 16))(v137, v139, v132);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2676810B8);
    sub_20ACD5130();
    (*(void (**)(char *, uint64_t))(v133 + 8))(v139, v132);
    swift_bridgeObjectRelease();
  }
  sub_20ACD285C();
  uint64_t v17 = v116;
  uint64_t v91 = *(void *)(v120 + OBJC_IVAR____TtC19AppleMediaDiscovery18AMDVectorDBManager_client);
  swift_retain();
  uint64_t v92 = v168;
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_20ACD4D40();
  id v93 = v17;
  uint64_t v94 = v18;
  uint64_t v95 = v17;
  if (v17)
  {
    uint64_t v46 = v95;
    swift_bridgeObjectRelease();
    swift_release();
    sub_20ACD28E0();
    id v108 = v46;
    return v106;
  }
  uint64_t v87 = v94;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v19 = v93;
  uint64_t v163 = v87;
  uint64_t v88 = *(void *)(v120 + OBJC_IVAR____TtC19AppleMediaDiscovery18AMDVectorDBManager_client);
  swift_retain();
  sub_20ACD4D60();
  uint64_t v89 = v19;
  uint64_t v90 = v19;
  if (v19)
  {
    uint64_t v45 = v90;
    swift_release();
    sub_20ACD28E0();
    id v108 = v45;
    return v106;
  }
  swift_release();
  unint64_t v20 = v89;
  uint64_t v83 = *(void *)(v120 + OBJC_IVAR____TtC19AppleMediaDiscovery18AMDVectorDBManager_client);
  swift_retain();
  uint64_t v21 = sub_20ACD4D10();
  uint64_t v84 = v20;
  uint64_t v85 = v21;
  uint64_t v86 = v20;
  if (v20)
  {
    uint64_t v44 = v86;
    swift_release();
    sub_20ACD28E0();
    id v108 = v44;
    return v106;
  }
  uint64_t v22 = v130;
  uint64_t v65 = v85;
  swift_release();
  uint64_t v162 = v65;
  uint64_t v23 = sub_20ACC20F0();
  (*(void (**)(char *, uint64_t, uint64_t))(v127 + 16))(v22, v23, v126);
  uint64_t v72 = 7;
  uint64_t v73 = swift_allocObject();
  *(void *)(v73 + 16) = v65;
  uint64_t v81 = sub_20ACD4F30();
  int v82 = sub_20ACD5220();
  uint64_t v68 = &v160;
  uint64_t v160 = 12;
  unint64_t v66 = sub_20ACD01EC();
  unint64_t v67 = sub_20ACD0268();
  sub_20ACD02E4();
  sub_20ACD5080();
  uint32_t v69 = v161;
  uint64_t v70 = 17;
  uint64_t v75 = swift_allocObject();
  *(unsigned char *)(v75 + 16) = 0;
  uint64_t v76 = swift_allocObject();
  *(unsigned char *)(v76 + 16) = 8;
  uint64_t v71 = 32;
  uint64_t v24 = swift_allocObject();
  uint64_t v25 = v73;
  uint64_t v74 = v24;
  *(void *)(v24 + 16) = v121;
  *(void *)(v24 + 24) = v25;
  uint64_t v26 = swift_allocObject();
  uint64_t v27 = v74;
  uint64_t v78 = v26;
  *(void *)(v26 + 16) = v122;
  *(void *)(v26 + 24) = v27;
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B60);
  uint64_t v77 = sub_20ACD53F0();
  uint64_t v79 = v28;
  swift_retain();
  uint64_t v29 = v75;
  uint64_t v30 = v79;
  uint64_t *v79 = v123;
  v30[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v29;
  swift_retain();
  uint64_t v31 = v76;
  uint64_t v32 = v79;
  v79[2] = v124;
  v32[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v31;
  swift_retain();
  uint64_t v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v78;
  uint64_t v34 = v79;
  v79[4] = v125;
  v34[5] = v33;
  sub_20ACAD01C();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v81, (os_log_type_t)v82))
  {
    uint64_t v58 = (uint8_t *)sub_20ACD5280();
    uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B48);
    uint64_t v57 = 0;
    uint64_t v59 = sub_20ACD0360(0);
    uint64_t v60 = sub_20ACD0360(v57);
    uint64_t v61 = &v159;
    uint64_t v159 = v58;
    uint64_t v62 = &v158;
    uint64_t v158 = v59;
    uint64_t v63 = &v157;
    uint64_t v157 = v60;
    sub_20ACD03BC(0, &v159);
    sub_20ACD03BC(1, v61);
    uint64_t v35 = v84;
    uint64_t v155 = v123;
    uint64_t v156 = v75;
    sub_20ACD03D0(&v155, (uint64_t)v61, (uint64_t)v62, (uint64_t)v63);
    uint64_t v64 = v35;
    if (v35)
    {
      __break(1u);
    }
    else
    {
      uint64_t v155 = v124;
      uint64_t v156 = v76;
      sub_20ACD03D0(&v155, (uint64_t)&v159, (uint64_t)&v158, (uint64_t)&v157);
      uint64_t v54 = 0;
      uint64_t v36 = v54;
      uint64_t v155 = v125;
      uint64_t v156 = v78;
      sub_20ACD03D0(&v155, (uint64_t)&v159, (uint64_t)&v158, (uint64_t)&v157);
      uint64_t v53 = v36;
      _os_log_impl(&dword_20ABD4000, v81, (os_log_type_t)v82, "Post data insertion database has: %lld entries", v58, v69);
      uint64_t v52 = 0;
      sub_20ACD041C(v59);
      sub_20ACD041C(v60);
      sub_20ACD5260();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v55 = v53;
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    uint64_t v55 = v84;
  }
  uint64_t v50 = v55;

  (*(void (**)(char *, uint64_t))(v127 + 8))(v130, v126);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
  uint64_t v48 = sub_20ACD53F0();
  char v47 = v37;
  uint64_t v38 = sub_20ACD5010();
  uint64_t v39 = v47;
  uint64_t v40 = v87;
  uint64_t *v47 = v38;
  v39[1] = v41;
  v39[5] = MEMORY[0x263F8D6C8];
  v39[2] = v40;
  sub_20ACAD01C();
  uint64_t v51 = sub_20ACD4FA0();
  sub_20ACD28E0();
  return v51;
}

uint64_t sub_20ACC6408(uint64_t a1)
{
  uint64_t v200 = a1;
  uint64_t v197 = 0;
  id v171 = sub_20ACD330C;
  char v172 = sub_20ACD3258;
  BOOL v173 = sub_20ACD2FFC;
  id v174 = sub_20ACD30E8;
  int v175 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD3030;
  uint64_t v176 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD3064;
  uint64_t v177 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD3134;
  uint64_t v178 = "Fatal error";
  uint64_t v179 = "Unexpectedly found nil while unwrapping an Optional value";
  id v180 = "AppleMediaDiscovery/AMDVectorDB.swift";
  BOOL v244 = 0;
  uint64_t v243 = 0;
  uint64_t v242 = 0;
  uint64_t v241 = 0;
  uint64_t v236 = 0;
  uint64_t v232 = 0;
  unsigned __int8 v231 = 0;
  uint64_t v227 = 0;
  uint64_t v224 = 0;
  uint64_t v220 = 0;
  uint64_t v221 = 0;
  uint64_t v181 = sub_20ACD4E00();
  uint64_t v182 = *(void *)(v181 - 8);
  uint64_t v183 = v181 - 8;
  unint64_t v184 = (*(void *)(v182 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v181);
  id v185 = (char *)&v50 - v184;
  BOOL v244 = (char *)&v50 - v184;
  unint64_t v186 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2676810C0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v197);
  id v187 = (char *)&v50 - v186;
  uint64_t v188 = sub_20ACD4F50();
  uint64_t v189 = *(void **)(v188 - 8);
  uint64_t v190 = v188 - 8;
  unint64_t v191 = (v189[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v200);
  uint64_t v192 = (char *)&v50 - v191;
  unint64_t v193 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v194 = (char *)&v50 - v193;
  unint64_t v195 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v196 = (char *)&v50 - v195;
  uint64_t v243 = v6;
  uint64_t v242 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676810C8);
  sub_20ACD53F0();
  uint64_t v198 = MEMORY[0x263F8D310];
  uint64_t v199 = MEMORY[0x263F8D320];
  uint64_t v241 = sub_20ACD4FA0();
  uint64_t v7 = sub_20ACD5010();
  unint64_t v201 = v238;
  v238[0] = v7;
  v238[1] = v8;
  MEMORY[0x21052B560](v239);
  sub_20ACAD060();
  if (!v239[3])
  {
    LOBYTE(v47) = 2;
    uint64_t v48 = 91;
    LODWORD(v49) = 0;
    sub_20ACD5340();
    __break(1u);
  }
  uint32_t v161 = v240;
  sub_20ACB323C((uint64_t)v239, (uint64_t)v240);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676810D0);
  uint64_t v163 = MEMORY[0x263F8EE58] + 8;
  swift_dynamicCast();
  uint64_t v162 = v237;
  uint64_t v236 = v237;
  uint64_t v9 = sub_20ACD5010();
  uint64_t v164 = v233;
  v233[0] = v9;
  v233[1] = v10;
  MEMORY[0x21052B560](v234);
  sub_20ACAD060();
  uint64_t v11 = v170;
  uint64_t v165 = *(void *)(v169 + OBJC_IVAR____TtC19AppleMediaDiscovery18AMDVectorDBManager_client);
  swift_retain();
  uint64_t v12 = sub_20ACD4D10();
  uint64_t v166 = v11;
  uint64_t v167 = v12;
  uint64_t v168 = v11;
  if (v11)
  {
    uint64_t v51 = v168;
    swift_release();
    sub_20ACB3678((uint64_t)v234);
    swift_bridgeObjectRelease();
    sub_20ACD2DA4();
    uint64_t v52 = v51;
    return v67;
  }
  uint64_t v160 = v167;
  swift_release();
  uint64_t v232 = v160;
  unsigned __int8 v231 = 1;
  BOOL v159 = v235 != 0;
  if (v235)
  {
    sub_20ACB31A4((uint64_t)v234, (uint64_t)v203);
    if (!v203[3])
    {
      LOBYTE(v47) = 2;
      uint64_t v48 = 96;
      LODWORD(v49) = 0;
      sub_20ACD5340();
      __break(1u);
    }
    uint64_t v158 = v204;
    sub_20ACB323C((uint64_t)v203, (uint64_t)v204);
    swift_dynamicCast();
    uint64_t v232 = v202;
    unsigned __int8 v231 = 0;
  }
  uint64_t v13 = v196;
  uint64_t v14 = sub_20ACC20F0();
  uint64_t v147 = (void (*)(char *, uint64_t, uint64_t))v189[2];
  char v148 = v189 + 2;
  v147(v13, v14, v188);
  uint64_t v156 = sub_20ACD4F30();
  int v155 = sub_20ACD5220();
  uint64_t v151 = &v229;
  uint64_t v229 = 2;
  unint64_t v149 = sub_20ACD01EC();
  unint64_t v150 = sub_20ACD0268();
  unint64_t v152 = sub_20ACD02E4();
  sub_20ACD5080();
  uint32_t v153 = v230;
  uint64_t v154 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B60);
  uint64_t v157 = sub_20ACD53F0();
  if (os_log_type_enabled(v156, (os_log_type_t)v155))
  {
    uint64_t v136 = (uint8_t *)sub_20ACD5280();
    uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B48);
    uint64_t v135 = 0;
    uint64_t v137 = sub_20ACD0360(0);
    uint64_t v138 = sub_20ACD0360(v135);
    uint64_t v142 = v207;
    v207[0] = v136;
    size_t v143 = &v206;
    uint64_t v206 = v137;
    uint64_t v140 = &v205;
    uint64_t v205 = v138;
    unsigned int v139 = 0;
    sub_20ACD03BC(0, v207);
    sub_20ACD03BC(v139, v142);
    v204[4] = v157;
    uint64_t v141 = &v50;
    MEMORY[0x270FA5388](&v50);
    uint64_t v15 = v143;
    uint64_t v16 = &v50 - 6;
    uint64_t v144 = &v50 - 6;
    v16[2] = (uint64_t)v142;
    v16[3] = (uint64_t)v15;
    v16[4] = v17;
    uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_267681110);
    sub_20ACD3288();
    uint64_t v18 = v166;
    sub_20ACD5060();
    uint64_t v146 = v18;
    if (v18)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl(&dword_20ABD4000, v156, (os_log_type_t)v155, "Starting DB Search", v136, v153);
      uint64_t v132 = 0;
      sub_20ACD041C(v137);
      sub_20ACD041C(v138);
      sub_20ACD5260();
      swift_bridgeObjectRelease();
      uint64_t v133 = v146;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v133 = v166;
  }
  uint64_t v127 = v133;

  uint64_t v112 = (void (*)(char *, uint64_t))v189[1];
  uint64_t v113 = v189 + 1;
  v112(v196, v188);
  uint64_t v119 = *(void *)(v169 + OBJC_IVAR____TtC19AppleMediaDiscovery18AMDVectorDBManager_client);
  swift_retain();
  uint64_t v128 = sub_20ACD50F0();
  unint64_t v120 = v19;
  uint64_t v114 = 0;
  uint64_t v115 = MEMORY[0x263F8E5C0];
  uint64_t v121 = sub_20ACD53F0();
  sub_20ACD4DC0();
  uint64_t v122 = sub_20ACD53F0();
  uint64_t v118 = v228;
  v228[0] = v232;
  unint64_t v116 = sub_20ACD2DD0();
  unint64_t v117 = sub_20ACD2E4C();
  sub_20ACD2EC8();
  sub_20ACD50C0();
  uint64_t v123 = v228[1];
  int v124 = v231;
  int v125 = sub_20ACC7788();
  uint64_t v126 = sub_20ACC7794();
  uint64_t v20 = sub_20ACC77A0();
  uint64_t v21 = v127;
  uint64_t v47 = 0;
  LOBYTE(v48) = 1;
  uint64_t v49 = v20;
  uint64_t v22 = sub_20ACD4D50();
  uint64_t v129 = v21;
  uint64_t v130 = v22;
  uint64_t v131 = v21;
  if (v21)
  {
    uint64_t v50 = v131;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_20ACD2F44(v128, v120);
    swift_release();
    sub_20ACB3678((uint64_t)v234);
    swift_bridgeObjectRelease();
    sub_20ACD2DA4();
    uint64_t v52 = v50;
    return v67;
  }
  uint64_t v23 = v194;
  uint64_t v107 = v130;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20ACD2F44(v128, v120);
  swift_release();
  uint64_t v227 = v107;
  uint64_t v24 = sub_20ACC20F0();
  v147(v23, v24, v188);
  uint64_t v110 = sub_20ACD4F30();
  int v109 = sub_20ACD5220();
  uint64_t v225 = 2;
  sub_20ACD5080();
  uint32_t v108 = v226;
  uint64_t v111 = (unsigned char *)sub_20ACD53F0();
  if (os_log_type_enabled(v110, (os_log_type_t)v109))
  {
    int v96 = (uint8_t *)sub_20ACD5280();
    uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B48);
    uint64_t v95 = 0;
    uint64_t v97 = sub_20ACD0360(0);
    uint64_t v98 = sub_20ACD0360(v95);
    uint64_t v102 = &v210;
    uint64_t v210 = v96;
    uint64_t v103 = &v209;
    uint64_t v209 = v97;
    id v100 = &v208;
    uint64_t v208 = v98;
    unsigned int v99 = 0;
    sub_20ACD03BC(0, &v210);
    sub_20ACD03BC(v99, v102);
    v207[1] = v111;
    uint64_t v101 = &v50;
    MEMORY[0x270FA5388](&v50);
    uint64_t v25 = v103;
    uint64_t v26 = &v50 - 6;
    uint64_t v104 = &v50 - 6;
    v26[2] = (uint64_t)v102;
    v26[3] = (uint64_t)v25;
    v26[4] = v27;
    uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_267681110);
    sub_20ACD3288();
    uint64_t v28 = v129;
    sub_20ACD5060();
    uint64_t v106 = v28;
    if (v28)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl(&dword_20ABD4000, v110, (os_log_type_t)v109, "Completed DB Search", v96, v108);
      uint64_t v92 = 0;
      sub_20ACD041C(v97);
      sub_20ACD041C(v98);
      sub_20ACD5260();
      swift_bridgeObjectRelease();
      uint64_t v93 = v106;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v93 = v129;
  }
  uint64_t v29 = v192;
  uint64_t v77 = v93;

  v112(v194, v188);
  uint64_t v78 = MEMORY[0x21052B6B0](v107, v181);
  uint64_t v224 = v78;
  uint64_t v30 = sub_20ACC20F0();
  v147(v29, v30, v188);
  uint64_t v82 = 7;
  uint64_t v83 = swift_allocObject();
  *(void *)(v83 + 16) = v78;
  uint64_t v90 = sub_20ACD4F30();
  int v91 = sub_20ACD5220();
  uint64_t v222 = 12;
  sub_20ACD5080();
  uint32_t v79 = v223;
  uint64_t v80 = 17;
  uint64_t v85 = swift_allocObject();
  *(unsigned char *)(v85 + 16) = 0;
  uint64_t v86 = swift_allocObject();
  *(unsigned char *)(v86 + 16) = 8;
  uint64_t v81 = 32;
  uint64_t v31 = swift_allocObject();
  uint64_t v32 = v83;
  uint64_t v84 = v31;
  *(void *)(v31 + 16) = v173;
  *(void *)(v31 + 24) = v32;
  uint64_t v33 = swift_allocObject();
  uint64_t v34 = v84;
  uint64_t v88 = v33;
  *(void *)(v33 + 16) = v174;
  *(void *)(v33 + 24) = v34;
  uint64_t v87 = sub_20ACD53F0();
  uint64_t v89 = v35;
  swift_retain();
  uint64_t v36 = v85;
  uint64_t v37 = v89;
  void *v89 = v175;
  v37[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v36;
  swift_retain();
  uint64_t v38 = v86;
  uint64_t v39 = v89;
  v89[2] = v176;
  v39[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v38;
  swift_retain();
  uint64_t v40 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v88;
  uint64_t v41 = v89;
  v89[4] = v177;
  v41[5] = v40;
  sub_20ACAD01C();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v90, (os_log_type_t)v91))
  {
    uint64_t v70 = (uint8_t *)sub_20ACD5280();
    uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B48);
    uint64_t v69 = 0;
    uint64_t v71 = sub_20ACD0360(0);
    uint64_t v72 = sub_20ACD0360(v69);
    uint64_t v73 = &v215;
    uint64_t v215 = v70;
    uint64_t v74 = &v214;
    uint64_t v214 = v71;
    uint64_t v75 = &v213;
    uint64_t v213 = v72;
    sub_20ACD03BC(0, &v215);
    sub_20ACD03BC(1, v73);
    uint64_t v42 = v77;
    uint64_t v211 = v175;
    uint64_t v212 = v85;
    sub_20ACD03D0(&v211, (uint64_t)v73, (uint64_t)v74, (uint64_t)v75);
    uint64_t v76 = v42;
    if (v42)
    {
      __break(1u);
    }
    else
    {
      uint64_t v211 = v176;
      uint64_t v212 = v86;
      sub_20ACD03D0(&v211, (uint64_t)&v215, (uint64_t)&v214, (uint64_t)&v213);
      uint64_t v65 = 0;
      uint64_t v43 = v65;
      uint64_t v211 = v177;
      uint64_t v212 = v88;
      sub_20ACD03D0(&v211, (uint64_t)&v215, (uint64_t)&v214, (uint64_t)&v213);
      uint64_t v64 = v43;
      _os_log_impl(&dword_20ABD4000, v90, (os_log_type_t)v91, "Search returned: %ld results", v70, v79);
      uint64_t v63 = 0;
      sub_20ACD041C(v71);
      sub_20ACD041C(v72);
      sub_20ACD5260();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v66 = v64;
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    uint64_t v66 = v77;
  }
  uint64_t v61 = v66;

  v112(v192, v188);
  swift_bridgeObjectRetain();
  uint64_t v219 = v107;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676810F0);
  sub_20ACD31A8();
  sub_20ACD5210();
  for (uint64_t i = v61; ; uint64_t i = v59)
  {
    uint64_t v59 = i;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267681100);
    sub_20ACD5300();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v182 + 48))(v187, 1, v181) == 1) {
      break;
    }
    (*(void (**)(char *, char *, uint64_t))(v182 + 32))(v185, v187, v181);
    uint64_t v55 = sub_20ACD4DE0();
    uint64_t v56 = v44;
    sub_20ACD4DF0();
    uint64_t v58 = &v217;
    uint64_t v217 = v45;
    char v218 = 0;
    uint64_t v57 = v216;
    v216[0] = v55;
    v216[1] = v56;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267681108);
    sub_20ACD4FD0();
    (*(void (**)(char *, uint64_t))(v182 + 8))(v185, v181);
  }
  sub_20ACD322C();
  uint64_t v53 = &v241;
  uint64_t v54 = v241;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_20ACB3678((uint64_t)v234);
  swift_bridgeObjectRelease();
  sub_20ACD2DA4();
  return v54;
}

uint64_t sub_20ACC7788()
{
  return 0;
}

uint64_t sub_20ACC7794()
{
  return 10;
}

uint64_t sub_20ACC77A0()
{
  return 2;
}

uint64_t sub_20ACC793C(uint64_t a1)
{
  if (a1)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_20ACD4D30();
    if (!v12)
    {
      swift_bridgeObjectRelease();
      swift_release();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
      sub_20ACD53F0();
      uint64_t v7 = v3;
      *uint64_t v3 = sub_20ACD5010();
      v7[1] = v4;
      v7[5] = MEMORY[0x263F8D6C8];
      void v7[2] = v8;
      sub_20ACAD01C();
      return sub_20ACD4FA0();
    }
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_retain();
    uint64_t v11 = sub_20ACD4D10();
    if (!v12)
    {
      swift_release();
      swift_retain();
      sub_20ACD4D80();
      swift_release();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
      sub_20ACD53F0();
      uint64_t v9 = v1;
      *uint64_t v1 = sub_20ACD5010();
      v9[1] = v2;
      v9[5] = MEMORY[0x263F8E5C0];
      void v9[2] = v11;
      sub_20ACAD01C();
      return sub_20ACD4FA0();
    }
    swift_release();
  }
  return v6;
}

uint64_t sub_20ACC7EF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v76 = a3;
  uint64_t v104 = a1;
  uint64_t v105 = a2;
  uint64_t v100 = 0;
  uint64_t v78 = sub_20ACD3408;
  uint32_t v79 = sub_20ACD34C0;
  uint64_t v80 = sub_20ACD3648;
  uint64_t v81 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD35CC;
  uint64_t v82 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD3600;
  uint64_t v83 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD3694;
  uint64_t v145 = *MEMORY[0x263EF8340];
  uint64_t v141 = 0;
  uint64_t v140 = 0;
  uint64_t v138 = 0;
  uint64_t v139 = 0;
  uint64_t v137 = 0;
  uint64_t v84 = sub_20ACD4F50();
  uint64_t v85 = *(void *)(v84 - 8);
  uint64_t v86 = v84 - 8;
  unint64_t v87 = (*(void *)(v85 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v88 = (char *)v38 - v87;
  uint64_t v118 = sub_20ACD4980();
  uint64_t v115 = *(void *)(v118 - 8);
  uint64_t v116 = v118 - 8;
  unint64_t v89 = (*(void *)(v115 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v100);
  uint64_t v117 = (uint64_t)v38 - v89;
  uint64_t v99 = sub_20ACD49D0();
  uint64_t v91 = *(void *)(v99 - 8);
  uint64_t v90 = v99 - 8;
  uint64_t v92 = v91;
  uint64_t v93 = *(void *)(v91 + 64);
  unint64_t v94 = (v93 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v104);
  uint64_t v95 = (char *)v38 - v94;
  unint64_t v96 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v114 = (char *)v38 - v96;
  uint64_t v141 = (char *)v38 - v96;
  unint64_t v97 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v107 = (char *)v38 - v97;
  uint64_t v140 = (char *)v38 - v97;
  uint64_t v138 = v8;
  uint64_t v139 = v9;
  uint64_t v137 = v3;
  unint64_t v120 = 0x263F08000uLL;
  uint64_t v10 = self;
  unint64_t v121 = 0x1F721D000uLL;
  id v98 = [v10 (SEL)0x1F721D33BLL];
  uint64_t v106 = 1;
  id v102 = objc_msgSend(v98, sel_URLsForDirectory_inDomains_, 14);

  uint64_t v101 = sub_20ACD50E0();
  sub_20ACD5160();
  swift_bridgeObjectRelease();

  uint64_t v11 = sub_20ACD53E0();
  int v109 = &v135;
  uint64_t v135 = v11;
  uint64_t v136 = v12;
  int v123 = 1;
  sub_20ACD5010();
  uint64_t v103 = v13;
  sub_20ACD53D0();
  swift_bridgeObjectRelease();
  v134[2] = v104;
  v134[3] = v105;
  uint64_t v112 = MEMORY[0x263F8D310];
  sub_20ACD53C0();
  sub_20ACD5010();
  uint64_t v108 = v14;
  sub_20ACD53D0();
  swift_bridgeObjectRelease();
  uint64_t v111 = v135;
  uint64_t v110 = v136;
  swift_bridgeObjectRetain();
  sub_20ACD2830();
  uint64_t v15 = sub_20ACD5000();
  uint64_t v119 = v134;
  v134[0] = v15;
  v134[1] = v16;
  unint64_t v113 = sub_20ACC1D38();
  sub_20ACC8EB4(v117);
  sub_20ACD49C0();
  (*(void (**)(uint64_t, uint64_t))(v115 + 8))(v117, v118);
  sub_20ACAD060();
  uint64_t v144 = 0;
  id v126 = [self (SEL)(v121 + 827)];
  sub_20ACD49B0();
  uint64_t v122 = v17;
  id v125 = (id)sub_20ACD4FE0();
  swift_bridgeObjectRelease();
  id v133 = v144;
  unsigned int v127 = objc_msgSend(v126, sel_createDirectoryAtPath_withIntermediateDirectories_attributes_error_, v125, v123 & 1, 0, &v133);
  id v124 = v133;
  id v18 = v133;
  unint64_t v19 = v144;
  uint64_t v144 = v124;

  if (v127)
  {
    uint64_t v20 = v88;
    uint64_t v21 = sub_20ACC20F0();
    (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v20, v21, v84);
    uint64_t v56 = v92;
    uint64_t v54 = *(void (**)(char *, char *, uint64_t))(v91 + 16);
    uint64_t v55 = v91 + 16;
    v54(v95, v114, v99);
    unint64_t v57 = (*(unsigned __int8 *)(v56 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
    uint64_t v65 = 7;
    uint64_t v58 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v91 + 32))(v58 + v57, v95, v99);
    swift_retain();
    uint64_t v64 = 32;
    uint64_t v22 = swift_allocObject();
    uint64_t v23 = v58;
    uint64_t v66 = v22;
    *(void *)(v22 + 16) = v78;
    *(void *)(v22 + 24) = v23;
    swift_release();
    uint64_t v74 = sub_20ACD4F30();
    int v75 = sub_20ACD5220();
    uint64_t v61 = &v131;
    uint64_t v131 = 12;
    unint64_t v59 = sub_20ACD01EC();
    unint64_t v60 = sub_20ACD0268();
    sub_20ACD02E4();
    sub_20ACD5080();
    uint32_t v62 = v132;
    uint64_t v63 = 17;
    uint64_t v68 = swift_allocObject();
    *(unsigned char *)(v68 + 16) = 32;
    uint64_t v69 = swift_allocObject();
    *(unsigned char *)(v69 + 16) = 8;
    uint64_t v24 = swift_allocObject();
    uint64_t v25 = v66;
    uint64_t v67 = v24;
    *(void *)(v24 + 16) = v79;
    *(void *)(v24 + 24) = v25;
    uint64_t v26 = swift_allocObject();
    uint64_t v27 = v67;
    uint64_t v71 = v26;
    *(void *)(v26 + 16) = v80;
    *(void *)(v26 + 24) = v27;
    uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B60);
    uint64_t v70 = sub_20ACD53F0();
    uint64_t v72 = v28;
    swift_retain();
    uint64_t v29 = v68;
    uint64_t v30 = v72;
    *uint64_t v72 = v81;
    v30[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v29;
    swift_retain();
    uint64_t v31 = v69;
    uint64_t v32 = v72;
    v72[2] = v82;
    v32[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v31;
    swift_retain();
    uint64_t v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v71;
    uint64_t v34 = v72;
    void v72[4] = v83;
    v34[5] = v33;
    sub_20ACAD01C();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v74, (os_log_type_t)v75))
    {
      uint64_t v47 = (uint8_t *)sub_20ACD5280();
      uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B48);
      uint64_t v48 = sub_20ACD0360(0);
      uint64_t v49 = sub_20ACD0360(1);
      uint64_t v50 = &v130;
      uint64_t v130 = v47;
      uint64_t v51 = &v143;
      uint64_t v143 = v48;
      uint64_t v52 = &v142;
      uint64_t v142 = v49;
      sub_20ACD03BC(2, &v130);
      sub_20ACD03BC(1, v50);
      uint64_t v35 = v77;
      uint64_t v128 = v81;
      uint64_t v129 = v68;
      sub_20ACD03D0(&v128, (uint64_t)v50, (uint64_t)v51, (uint64_t)v52);
      uint64_t v53 = v35;
      if (v35)
      {
        __break(1u);
      }
      else
      {
        uint64_t v128 = v82;
        uint64_t v129 = v69;
        sub_20ACD03D0(&v128, (uint64_t)&v130, (uint64_t)&v143, (uint64_t)&v142);
        uint64_t v44 = 0;
        uint64_t v36 = v44;
        uint64_t v128 = v83;
        uint64_t v129 = v71;
        sub_20ACD03D0(&v128, (uint64_t)&v130, (uint64_t)&v143, (uint64_t)&v142);
        uint64_t v43 = v36;
        _os_log_impl(&dword_20ABD4000, v74, (os_log_type_t)v75, "Created Vector DB Directory: %s", v47, v62);
        sub_20ACD041C(v48);
        sub_20ACD041C(v49);
        sub_20ACD5260();
        swift_release();
        swift_release();
        swift_release();
        uint64_t v45 = v43;
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      uint64_t v45 = v77;
    }
    uint64_t v40 = v45;

    (*(void (**)(char *, uint64_t))(v85 + 8))(v88, v84);
    v54(v76, v114, v99);
    uint64_t v42 = *(void (**)(char *, uint64_t))(v91 + 8);
    uint64_t v41 = v91 + 8;
    v42(v114, v99);
    return ((uint64_t (*)(char *, uint64_t))v42)(v107, v99);
  }
  else
  {
    v38[0] = v144;
    v38[1] = (id)sub_20ACD4970();

    swift_willThrow();
    uint64_t v39 = *(void (**)(char *, uint64_t))(v91 + 8);
    v38[2] = (id)(v91 + 8);
    v39(v114, v99);
    return ((uint64_t (*)(char *, uint64_t))v39)(v107, v99);
  }
}

uint64_t sub_20ACC8EB4@<X0>(uint64_t a1@<X8>)
{
  unsigned int v3 = *MEMORY[0x263F06E50];
  uint64_t v1 = sub_20ACD4980();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 8) + 104))(a1, v3);
}

uint64_t sub_20ACC8F24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = sub_20ACD49D0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
}

uint64_t sub_20ACC9170@<X0>(uint64_t a1@<X8>)
{
  sub_20ACD5010();
  uint64_t v10 = sub_20ACD5020();
  swift_bridgeObjectRelease();
  if (v10)
  {
    unsigned int v8 = *MEMORY[0x263F846B0];
    uint64_t v1 = sub_20ACD4DD0();
    return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 8) + 104))(a1, v8);
  }
  else
  {
    sub_20ACD5010();
    char v7 = sub_20ACD5020();
    swift_bridgeObjectRelease();
    if (v7)
    {
      unsigned int v6 = *MEMORY[0x263F846B8];
      uint64_t v3 = sub_20ACD4DD0();
      return (*(uint64_t (**)(uint64_t, void))(*(void *)(v3 - 8) + 104))(a1, v6);
    }
    else
    {
      unsigned int v5 = *MEMORY[0x263F846A8];
      uint64_t v4 = sub_20ACD4DD0();
      return (*(uint64_t (**)(uint64_t, void))(*(void *)(v4 - 8) + 104))(a1, v5);
    }
  }
}

uint64_t sub_20ACC9340@<X0>(uint64_t a1@<X8>)
{
  unsigned int v3 = *MEMORY[0x263F846E0];
  uint64_t v1 = sub_20ACD4E10();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 8) + 104))(a1, v3);
}

uint64_t sub_20ACC93C4@<X0>(uint64_t a1@<X8>)
{
  unsigned int v3 = *MEMORY[0x263F846E0];
  uint64_t v1 = sub_20ACD4E10();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 8) + 104))(a1, v3);
}

uint64_t sub_20ACC9448(uint64_t a1)
{
  uint64_t v201 = a1;
  uint64_t v194 = 0;
  uint64_t v202 = sub_20ACD36E0;
  uint64_t v210 = sub_20ACD3728;
  uint64_t v214 = sub_20ACD38B4;
  uint64_t v216 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD3838;
  char v218 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD386C;
  uint64_t v221 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD3900;
  int v175 = sub_20ACD394C;
  uint64_t v176 = sub_20ACD3994;
  uint64_t v177 = sub_20ACD3B20;
  uint64_t v178 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD3AA4;
  uint64_t v179 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD3AD8;
  id v180 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD3B6C;
  uint64_t v181 = "Fatal error";
  uint64_t v182 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v183 = "AppleMediaDiscovery/AMDVectorDB.swift";
  uint64_t v279 = *MEMORY[0x263EF8340];
  uint64_t v259 = 0;
  uint64_t v258 = 0;
  uint64_t v257 = 0;
  uint64_t v250 = 0;
  uint64_t v251 = 0;
  uint64_t v248 = 0;
  uint64_t v238 = 0;
  uint64_t v239 = 0;
  uint64_t v236 = 0;
  uint64_t v184 = sub_20ACD49D0();
  uint64_t v185 = *(void *)(v184 - 8);
  uint64_t v186 = v184 - 8;
  unint64_t v187 = (*(void *)(v185 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v188 = (char *)&v67 - v187;
  uint64_t v198 = sub_20ACD4F50();
  uint64_t v196 = *(void **)(v198 - 8);
  uint64_t v197 = v198 - 8;
  uint64_t v190 = v196[8];
  unint64_t v189 = (v190 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = MEMORY[0x270FA5388](v201);
  unint64_t v191 = (char *)&v67 - v189;
  unint64_t v192 = (v190 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  unsigned int v3 = (char *)&v67 - v192;
  unint64_t v193 = (char *)&v67 - v192;
  uint64_t v259 = v2;
  uint64_t v258 = v4;
  uint64_t v195 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
  sub_20ACD53F0();
  uint64_t v257 = sub_20ACD4FA0();
  uint64_t v5 = sub_20ACC20F0();
  uint64_t v199 = (void (*)(char *, uint64_t, uint64_t))v196[2];
  uint64_t v200 = v196 + 2;
  v199(v3, v5, v198);
  swift_bridgeObjectRetain();
  uint64_t v212 = 7;
  uint64_t v203 = swift_allocObject();
  *(void *)(v203 + 16) = v201;
  swift_retain();
  uint64_t v211 = 32;
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = v203;
  uint64_t v213 = v6;
  *(void *)(v6 + 16) = v202;
  *(void *)(v6 + 24) = v7;
  swift_release();
  uint64_t v225 = sub_20ACD4F30();
  int v226 = sub_20ACD5220();
  uint64_t v206 = &v255;
  uint64_t v255 = 12;
  unint64_t v204 = sub_20ACD01EC();
  unint64_t v205 = sub_20ACD0268();
  unint64_t v207 = sub_20ACD02E4();
  sub_20ACD5080();
  uint32_t v208 = v256;
  uint64_t v209 = 17;
  uint64_t v217 = swift_allocObject();
  *(unsigned char *)(v217 + 16) = 32;
  uint64_t v219 = swift_allocObject();
  *(unsigned char *)(v219 + 16) = 8;
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = v213;
  uint64_t v215 = v8;
  *(void *)(v8 + 16) = v210;
  *(void *)(v8 + 24) = v9;
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = v215;
  uint64_t v222 = v10;
  *(void *)(v10 + 16) = v214;
  *(void *)(v10 + 24) = v11;
  uint64_t v224 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B60);
  uint64_t v220 = sub_20ACD53F0();
  uint32_t v223 = v12;
  swift_retain();
  uint64_t v13 = v217;
  uint64_t v14 = v223;
  *uint32_t v223 = v216;
  v14[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v13;
  swift_retain();
  uint64_t v15 = v219;
  uint64_t v16 = v223;
  v223[2] = v218;
  v16[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v15;
  swift_retain();
  uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v222;
  id v18 = v223;
  v223[4] = v221;
  v18[5] = v17;
  sub_20ACAD01C();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v225, (os_log_type_t)v226))
  {
    uint64_t v167 = (uint8_t *)sub_20ACD5280();
    uint64_t v166 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B48);
    uint64_t v168 = sub_20ACD0360(0);
    uint64_t v169 = sub_20ACD0360(1);
    uint64_t v170 = &v229;
    uint64_t v229 = v167;
    id v171 = &v261;
    uint64_t v261 = v168;
    char v172 = &v260;
    uint64_t v260 = v169;
    sub_20ACD03BC(2, &v229);
    sub_20ACD03BC(1, v170);
    uint64_t v19 = v174;
    uint64_t v227 = v216;
    uint64_t v228 = v217;
    sub_20ACD03D0(&v227, (uint64_t)v170, (uint64_t)v171, (uint64_t)v172);
    uint64_t v173 = v19;
    if (v19)
    {
      __break(1u);
    }
    else
    {
      uint64_t v227 = v218;
      uint64_t v228 = v219;
      sub_20ACD03D0(&v227, (uint64_t)&v229, (uint64_t)&v261, (uint64_t)&v260);
      uint64_t v163 = 0;
      uint64_t v20 = v163;
      uint64_t v227 = v221;
      uint64_t v228 = v222;
      sub_20ACD03D0(&v227, (uint64_t)&v229, (uint64_t)&v261, (uint64_t)&v260);
      uint64_t v162 = v20;
      _os_log_impl(&dword_20ABD4000, v225, (os_log_type_t)v226, "Deletion Payload: %s", v167, v208);
      sub_20ACD041C(v168);
      sub_20ACD041C(v169);
      sub_20ACD5260();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v164 = v162;
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    uint64_t v164 = v174;
  }
  uint64_t v158 = v164;

  BOOL v159 = (void (*)(char *, uint64_t))v196[1];
  uint64_t v160 = v196 + 1;
  v159(v193, v198);
  uint64_t v21 = sub_20ACD5010();
  uint32_t v161 = v254;
  v254[0] = v21;
  v254[1] = v22;
  MEMORY[0x21052B560](v277);
  sub_20ACAD060();
  BOOL v157 = v278 == 0;
  if (v278)
  {
    sub_20ACB31A4((uint64_t)v277, (uint64_t)v274);
    if (!v275)
    {
      sub_20ACD5340();
      __break(1u);
    }
    uint64_t v139 = v276;
    sub_20ACB323C((uint64_t)v274, (uint64_t)v276);
    swift_dynamicCast();
    uint64_t v140 = v252;
    uint64_t v141 = v253;
    uint64_t v250 = v252;
    uint64_t v251 = v253;
    uint64_t v273 = 0;
    id v142 = self;
    swift_bridgeObjectRetain();
    id v144 = (id)sub_20ACD4FE0();
    swift_bridgeObjectRelease();
    id v249 = v273;
    id v145 = objc_msgSend(v142, sel_fetchVectorDBConfigForDBName_error_, v144, &v249);
    id v143 = v249;
    id v35 = v249;
    uint64_t v36 = v273;
    uint64_t v273 = v143;

    if (v145)
    {
      id v138 = v145;
      uint64_t v37 = v191;
      id v122 = v145;
      uint64_t v123 = sub_20ACD4F80();
      uint64_t v248 = v123;

      uint64_t v38 = sub_20ACC20F0();
      v199(v37, v38, v198);
      swift_bridgeObjectRetain();
      uint64_t v128 = 7;
      uint64_t v124 = swift_allocObject();
      *(void *)(v124 + 16) = v123;
      swift_retain();
      uint64_t v127 = 32;
      uint64_t v39 = swift_allocObject();
      uint64_t v40 = v124;
      uint64_t v129 = v39;
      *(void *)(v39 + 16) = v175;
      *(void *)(v39 + 24) = v40;
      swift_release();
      uint64_t v136 = sub_20ACD4F30();
      int v137 = sub_20ACD5220();
      uint64_t v246 = 12;
      sub_20ACD5080();
      uint32_t v125 = v247;
      uint64_t v126 = 17;
      uint64_t v131 = swift_allocObject();
      *(unsigned char *)(v131 + 16) = 32;
      uint64_t v132 = swift_allocObject();
      *(unsigned char *)(v132 + 16) = 8;
      uint64_t v41 = swift_allocObject();
      uint64_t v42 = v129;
      uint64_t v130 = v41;
      *(void *)(v41 + 16) = v176;
      *(void *)(v41 + 24) = v42;
      uint64_t v43 = swift_allocObject();
      uint64_t v44 = v130;
      uint64_t v134 = v43;
      *(void *)(v43 + 16) = v177;
      *(void *)(v43 + 24) = v44;
      uint64_t v133 = sub_20ACD53F0();
      uint64_t v135 = v45;
      swift_retain();
      uint64_t v46 = v131;
      uint64_t v47 = v135;
      *uint64_t v135 = v178;
      v47[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v46;
      swift_retain();
      uint64_t v48 = v132;
      uint64_t v49 = v135;
      v135[2] = v179;
      v49[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v48;
      swift_retain();
      uint64_t v50 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v134;
      uint64_t v51 = v135;
      v135[4] = v180;
      v51[5] = v50;
      sub_20ACAD01C();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v136, (os_log_type_t)v137))
      {
        uint64_t v115 = (uint8_t *)sub_20ACD5280();
        uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B48);
        uint64_t v116 = sub_20ACD0360(0);
        uint64_t v117 = sub_20ACD0360(1);
        uint64_t v118 = &v232;
        uint64_t v232 = v115;
        uint64_t v119 = &v263;
        uint64_t v263 = v116;
        unint64_t v120 = &v262;
        uint64_t v262 = v117;
        sub_20ACD03BC(2, &v232);
        sub_20ACD03BC(1, v118);
        uint64_t v52 = v158;
        uint32_t v230 = v178;
        uint64_t v231 = v131;
        sub_20ACD03D0(&v230, (uint64_t)v118, (uint64_t)v119, (uint64_t)v120);
        uint64_t v121 = v52;
        if (v52)
        {
          __break(1u);
        }
        else
        {
          uint32_t v230 = v179;
          uint64_t v231 = v132;
          sub_20ACD03D0(&v230, (uint64_t)&v232, (uint64_t)&v263, (uint64_t)&v262);
          uint64_t v112 = 0;
          uint64_t v53 = v112;
          uint32_t v230 = v180;
          uint64_t v231 = v134;
          sub_20ACD03D0(&v230, (uint64_t)&v232, (uint64_t)&v263, (uint64_t)&v262);
          uint64_t v111 = v53;
          _os_log_impl(&dword_20ABD4000, v136, (os_log_type_t)v137, "Fetched the config: %s", v115, v125);
          sub_20ACD041C(v116);
          sub_20ACD041C(v117);
          sub_20ACD5260();
          swift_release();
          swift_release();
          swift_release();
          uint64_t v113 = v111;
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        uint64_t v113 = v158;
      }
      uint64_t v109 = v113;

      v159(v191, v198);
      uint64_t v244 = sub_20ACD5010();
      uint64_t v245 = v54;
      uint64_t v110 = v272;
      sub_20ACD5390();
      MEMORY[0x21052B560](v271, v110, v123, MEMORY[0x263F8DB68], MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8DB70]);
      BOOL v108 = v271[3] == 0;
      BOOL v107 = v108;
      sub_20ACB3678((uint64_t)v271);
      sub_20ACBFB94((uint64_t)v272);
      sub_20ACAD060();
      if (v107)
      {
        int v99 = 1;
        uint64_t v100 = sub_20ACD5010();
        uint64_t v101 = v55;
        uint64_t v56 = sub_20ACD5010();
        uint64_t v103 = v264;
        v264[3] = MEMORY[0x263F8D310];
        v264[0] = v56;
        v264[1] = v57;
        id v102 = v233;
        v233[0] = v100;
        v233[1] = v101;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B38);
        uint64_t v104 = &v257;
        sub_20ACD4FD0();
        uint64_t v105 = v257;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_20ACB3678((uint64_t)v277);
        sub_20ACBD734();
        uint64_t v106 = v105;
      }
      else
      {
        uint64_t v242 = sub_20ACD5010();
        uint64_t v243 = v58;
        id v98 = v269;
        sub_20ACD5390();
        MEMORY[0x21052B560](v268, v98, v123, MEMORY[0x263F8DB68], MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8DB70]);
        if (!v268[3])
        {
          sub_20ACD5340();
          __break(1u);
        }
        uint64_t v91 = v270;
        sub_20ACB323C((uint64_t)v268, (uint64_t)v270);
        swift_dynamicCast();
        uint64_t v92 = v240;
        uint64_t v93 = v241;
        uint64_t v238 = v240;
        uint64_t v239 = v241;
        sub_20ACBFB94((uint64_t)v269);
        sub_20ACAD060();
        uint64_t v267 = 0;
        id v94 = self;
        swift_bridgeObjectRetain();
        id v96 = (id)sub_20ACD4FE0();
        swift_bridgeObjectRelease();
        id v237 = v267;
        id v97 = objc_msgSend(v94, sel_deleteVectorDBEntryForDBName_error_, v96, &v237);
        id v95 = v237;
        id v59 = v237;
        unint64_t v60 = v267;
        uint64_t v267 = v95;

        if (!v97)
        {
          id v70 = v267;
          uint64_t v71 = sub_20ACD4970();

          swift_willThrow();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_20ACB3678((uint64_t)v277);
          sub_20ACBD734();
          uint64_t v156 = v71;
          return v165;
        }
        id v90 = v97;
        id v79 = v97;
        uint64_t v80 = sub_20ACD4F80();
        uint64_t v236 = v80;

        uint64_t v82 = sub_20ACD5010();
        uint64_t v81 = v61;
        swift_bridgeObjectRetain();
        uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C50);
        uint64_t v84 = v266;
        v266[3] = v62;
        v266[0] = v80;
        uint64_t v83 = v235;
        v235[0] = v82;
        v235[1] = v81;
        uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B38);
        sub_20ACD4FD0();
        unint64_t v265 = 0;
        id v88 = objc_msgSend(self, sel_defaultManager);
        sub_20ACD4990();
        id v87 = (id)sub_20ACD49A0();
        (*(void (**)(char *, uint64_t))(v185 + 8))(v188, v184);
        id v234 = v265;
        unsigned int v89 = objc_msgSend(v88, sel_removeItemAtURL_error_, v87, &v234);
        id v86 = v234;
        id v63 = v234;
        uint64_t v64 = v265;
        unint64_t v265 = v86;

        if ((v89 & 1) == 0)
        {
          id v68 = v265;
          uint64_t v69 = sub_20ACD4970();

          swift_willThrow();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_20ACB3678((uint64_t)v277);
          sub_20ACBD734();
          uint64_t v156 = v69;
          return v165;
        }
        uint64_t v75 = sub_20ACD5010();
        uint64_t v76 = v65;
        swift_bridgeObjectRetain();
        v264[7] = MEMORY[0x263F8D310];
        v264[4] = v92;
        v264[5] = v93;
        void v233[2] = v75;
        v233[3] = v76;
        uint64_t v77 = &v257;
        sub_20ACD4FD0();
        uint64_t v78 = v257;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_20ACB3678((uint64_t)v277);
        sub_20ACBD734();
        uint64_t v106 = v78;
      }
      uint64_t v74 = v106;
      return v106;
    }
    id v72 = v273;
    uint64_t v73 = sub_20ACD4970();

    swift_willThrow();
    swift_bridgeObjectRelease();
    sub_20ACB3678((uint64_t)v277);
    sub_20ACBD734();
    uint64_t v156 = v73;
  }
  else
  {
    sub_20ACD27C8();
    int v146 = 1;
    uint64_t v154 = sub_20ACD5010();
    uint64_t v152 = v23;
    uint64_t v153 = sub_20ACC30A0(0);
    uint64_t v148 = sub_20ACD53F0();
    uint64_t v147 = v24;
    id v149 = (id)*MEMORY[0x263F08320];
    id v25 = v149;
    uint64_t v26 = sub_20ACD4FF0();
    uint64_t v27 = v147;
    *uint64_t v147 = v26;
    v27[1] = v28;
    uint64_t v29 = sub_20ACD5010();
    uint64_t v30 = v147;
    uint64_t v31 = v29;
    uint64_t v32 = v148;
    uint64_t v151 = MEMORY[0x263F8D310];
    v147[5] = MEMORY[0x263F8D310];
    v30[2] = v31;
    v30[3] = v33;
    sub_20ACAD01C();
    uint64_t v150 = v32;

    uint64_t v34 = sub_20ACD4FA0();
    id v155 = sub_20ACC52D8(v154, v152, v153, v34);
    swift_willThrow();
    sub_20ACB3678((uint64_t)v277);
    sub_20ACBD734();
    uint64_t v156 = (uint64_t)v155;
  }
  return v165;
}

uint64_t sub_20ACCAB78@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  *a2 = a1;
  return result;
}

uint64_t sub_20ACCABAC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  *a2 = a1;
  return result;
}

uint64_t sub_20ACCAD74(uint64_t a1)
{
  v75[4] = *MEMORY[0x263EF8340];
  uint64_t v59 = 0;
  uint64_t v54 = 0;
  uint64_t v53 = 0;
  uint64_t v49 = 0;
  uint64_t v60 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
  sub_20ACD53F0();
  uint64_t v58 = sub_20ACD4FA0();
  uint64_t v56 = sub_20ACD5010();
  uint64_t v57 = v1;
  MEMORY[0x21052B560](v75);
  sub_20ACAD060();
  if (v75[3])
  {
    sub_20ACB31A4((uint64_t)v75, (uint64_t)v72);
    if (!v73)
    {
      sub_20ACD5340();
      __break(1u);
    }
    sub_20ACB323C((uint64_t)v72, (uint64_t)v74);
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B38);
    swift_dynamicCast();
    uint64_t v54 = v55;
    type metadata accessor for AMDVectorDBManager();
    swift_bridgeObjectRetain();
    uint64_t v39 = AMDVectorDBManager.__allocating_init(vectorDBConfig:)(v55);
    if (v46)
    {
      swift_bridgeObjectRelease();
      sub_20ACB3678((uint64_t)v75);
      sub_20ACBD734();
    }
    else
    {
      uint64_t v53 = v39;
      uint64_t v51 = sub_20ACD5010();
      uint64_t v52 = v9;
      MEMORY[0x21052B560](v71);
      sub_20ACAD060();
      if (v71[3])
      {
        sub_20ACB31A4((uint64_t)v71, (uint64_t)v68);
        if (!v69)
        {
          sub_20ACD5340();
          __break(1u);
        }
        sub_20ACB323C((uint64_t)v68, (uint64_t)v70);
        __swift_instantiateConcreteTypeFromMangledName(&qword_267681130);
        swift_dynamicCast();
        uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))((*v39 & *MEMORY[0x263F8EED0]) + 0x60))(v50, v17, v18);
        swift_bridgeObjectRelease();
        uint64_t v49 = v32;
        uint64_t v29 = (void *)sub_20ACD5010();
        uint64_t v30 = v19;
        swift_bridgeObjectRetain();
        uint64_t v67 = v38;
        uint64_t v66 = v32;
        v48[5] = v29;
        v48[6] = v30;
        sub_20ACD4FD0();
        uint64_t v65 = 0;
        id v31 = self;
        v48[3] = (id)sub_20ACD5010();
        v48[4] = v20;
        MEMORY[0x21052B560](v63);
        sub_20ACAD060();
        if (!v63[3])
        {
          sub_20ACD5340();
          __break(1u);
        }
        sub_20ACB323C((uint64_t)v63, (uint64_t)v64);
        swift_dynamicCast();
        id v27 = (id)sub_20ACD4FE0();
        swift_bridgeObjectRelease();
        v48[0] = v65;
        id v28 = objc_msgSend(v31, sel_updateLastVectorDBRefreshTimestamp_error_, v27, v48);
        id v26 = v48[0];
        id v21 = v48[0];
        uint64_t v22 = v65;
        uint64_t v65 = v26;

        if (v28)
        {
          uint64_t v47 = sub_20ACD4F80();

          sub_20ACD5010();
          swift_bridgeObjectRetain();
          uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C50);
          uint64_t v61 = v47;
          sub_20ACD4FD0();
          uint64_t v25 = v58;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_20ACB3678((uint64_t)v71);

          swift_bridgeObjectRelease();
          sub_20ACB3678((uint64_t)v75);
          sub_20ACBD734();
          return v25;
        }
        id v24 = v65;
        sub_20ACD4970();

        swift_willThrow();
        swift_bridgeObjectRelease();
        sub_20ACB3678((uint64_t)v71);

        swift_bridgeObjectRelease();
        sub_20ACB3678((uint64_t)v75);
        sub_20ACBD734();
      }
      else
      {
        sub_20ACD27C8();
        uint64_t v37 = sub_20ACD5010();
        uint64_t v35 = v10;
        uint64_t v36 = sub_20ACC30A0(3);
        sub_20ACD53F0();
        uint64_t v33 = v11;
        id v34 = (id)*MEMORY[0x263F08320];
        id v12 = (id)*MEMORY[0x263F08320];
        *uint64_t v33 = sub_20ACD4FF0();
        v33[1] = v13;
        uint64_t v14 = sub_20ACD5010();
        v33[5] = MEMORY[0x263F8D310];
        v33[2] = v14;
        v33[3] = v15;
        sub_20ACAD01C();

        uint64_t v16 = sub_20ACD4FA0();
        sub_20ACC52D8(v37, v35, v36, v16);
        swift_willThrow();
        sub_20ACB3678((uint64_t)v71);

        swift_bridgeObjectRelease();
        sub_20ACB3678((uint64_t)v75);
        sub_20ACBD734();
      }
    }
  }
  else
  {
    sub_20ACD27C8();
    uint64_t v44 = sub_20ACD5010();
    uint64_t v42 = v2;
    uint64_t v43 = sub_20ACC30A0(2);
    sub_20ACD53F0();
    uint64_t v40 = v3;
    id v41 = (id)*MEMORY[0x263F08320];
    id v4 = (id)*MEMORY[0x263F08320];
    *uint64_t v40 = sub_20ACD4FF0();
    v40[1] = v5;
    uint64_t v6 = sub_20ACD5010();
    v40[5] = MEMORY[0x263F8D310];
    void v40[2] = v6;
    v40[3] = v7;
    sub_20ACAD01C();

    uint64_t v8 = sub_20ACD4FA0();
    sub_20ACC52D8(v44, v42, v43, v8);
    swift_willThrow();
    sub_20ACB3678((uint64_t)v75);
    sub_20ACBD734();
  }
  return v45;
}

uint64_t sub_20ACCB9F8(uint64_t a1)
{
  v39[4] = 0;
  uint64_t v32 = 0;
  v39[5] = a1;
  uint64_t v37 = sub_20ACD5010();
  uint64_t v38 = v1;
  MEMORY[0x21052B560](v39);
  sub_20ACAD060();
  if (!v39[3])
  {
    sub_20ACD27C8();
    uint64_t v23 = sub_20ACD5010();
    uint64_t v21 = v2;
    uint64_t v22 = sub_20ACC30A0(2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
    sub_20ACD53F0();
    uint64_t v19 = v3;
    id v20 = (id)*MEMORY[0x263F08320];
    id v4 = (id)*MEMORY[0x263F08320];
    *uint64_t v19 = sub_20ACD4FF0();
    v19[1] = v5;
    uint64_t v6 = sub_20ACD5010();
    v19[5] = MEMORY[0x263F8D310];
    v19[2] = v6;
    v19[3] = v7;
    sub_20ACAD01C();

    uint64_t v8 = sub_20ACD4FA0();
    sub_20ACC52D8(v23, v21, v22, v8);
    swift_willThrow();
    sub_20ACB3678((uint64_t)v39);
    return v24;
  }
  type metadata accessor for AMDVectorDBManager();
  sub_20ACB31A4((uint64_t)v39, (uint64_t)v34);
  if (!v35)
  {
    sub_20ACD5340();
    __break(1u);
  }
  sub_20ACB323C((uint64_t)v34, (uint64_t)v36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B38);
  swift_dynamicCast();
  uint64_t v18 = AMDVectorDBManager.__allocating_init(vectorDBConfig:)(v33);
  if (v25)
  {
    sub_20ACB3678((uint64_t)v39);
    return v24;
  }
  uint64_t v32 = v18;
  uint64_t v29 = sub_20ACD5010();
  uint64_t v30 = v9;
  MEMORY[0x21052B560](v31);
  sub_20ACAD060();
  if (v31[3])
  {
    sub_20ACB31A4((uint64_t)v31, (uint64_t)v27);
    if (v28)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267681138);
      if (swift_dynamicCast()) {
        uint64_t v15 = v26;
      }
      else {
        uint64_t v15 = 0;
      }
      uint64_t v14 = v15;
    }
    else
    {
      sub_20ACB3678((uint64_t)v27);
      uint64_t v14 = 0;
    }
    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))((*v18 & *MEMORY[0x263F8EED0]) + 0x70))(v14, v10, v11);
    swift_bridgeObjectRelease();
    sub_20ACB3678((uint64_t)v31);

    sub_20ACB3678((uint64_t)v39);
    return v13;
  }
  else
  {
    uint64_t v17 = (*(uint64_t (**)(void))((*v18 & *MEMORY[0x263F8EED0]) + 0x70))(0);
    sub_20ACB3678((uint64_t)v31);

    sub_20ACB3678((uint64_t)v39);
    return v17;
  }
}

uint64_t sub_20ACCC1C4(uint64_t a1)
{
  v48[4] = 0;
  id v41 = 0;
  v48[5] = a1;
  uint64_t v46 = sub_20ACD5010();
  uint64_t v47 = v1;
  MEMORY[0x21052B560](v48);
  sub_20ACAD060();
  if (!v48[3])
  {
    sub_20ACD27C8();
    uint64_t v31 = sub_20ACD5010();
    uint64_t v29 = v2;
    uint64_t v30 = sub_20ACC30A0(2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
    sub_20ACD53F0();
    id v27 = v3;
    id v28 = (id)*MEMORY[0x263F08320];
    id v4 = (id)*MEMORY[0x263F08320];
    *id v27 = sub_20ACD4FF0();
    v27[1] = v5;
    uint64_t v6 = sub_20ACD5010();
    v27[5] = MEMORY[0x263F8D310];
    v27[2] = v6;
    v27[3] = v7;
    sub_20ACAD01C();

    uint64_t v8 = sub_20ACD4FA0();
    sub_20ACC52D8(v31, v29, v30, v8);
    swift_willThrow();
    sub_20ACB3678((uint64_t)v48);
    return v32;
  }
  type metadata accessor for AMDVectorDBManager();
  sub_20ACB31A4((uint64_t)v48, (uint64_t)v43);
  if (!v44)
  {
    sub_20ACD5340();
    __break(1u);
  }
  sub_20ACB323C((uint64_t)v43, (uint64_t)v45);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B38);
  swift_dynamicCast();
  uint64_t v26 = AMDVectorDBManager.__allocating_init(vectorDBConfig:)(v42);
  if (v33)
  {
    sub_20ACB3678((uint64_t)v48);
    return v32;
  }
  id v41 = v26;
  uint64_t v38 = sub_20ACD5010();
  uint64_t v39 = v9;
  MEMORY[0x21052B560](v40);
  sub_20ACAD060();
  if (!v40[3])
  {
    sub_20ACD27C8();
    uint64_t v25 = sub_20ACD5010();
    uint64_t v23 = v10;
    uint64_t v24 = sub_20ACC30A0(3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
    sub_20ACD53F0();
    uint64_t v21 = v11;
    id v22 = (id)*MEMORY[0x263F08320];
    id v12 = (id)*MEMORY[0x263F08320];
    *uint64_t v21 = sub_20ACD4FF0();
    v21[1] = v13;
    uint64_t v14 = sub_20ACD5010();
    v21[5] = MEMORY[0x263F8D310];
    v21[2] = v14;
    v21[3] = v15;
    sub_20ACAD01C();

    uint64_t v16 = sub_20ACD4FA0();
    sub_20ACC52D8(v25, v23, v24, v16);
    swift_willThrow();
    sub_20ACB3678((uint64_t)v40);

    sub_20ACB3678((uint64_t)v48);
    return v32;
  }
  sub_20ACB31A4((uint64_t)v40, (uint64_t)v35);
  if (!v36)
  {
    sub_20ACD5340();
    __break(1u);
  }
  sub_20ACB323C((uint64_t)v35, (uint64_t)v37);
  swift_dynamicCast();
  uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))((*v26 & *MEMORY[0x263F8EED0]) + 0x68))(v34, v17, v18);
  swift_bridgeObjectRelease();
  sub_20ACB3678((uint64_t)v40);

  sub_20ACB3678((uint64_t)v48);
  return v20;
}

uint64_t sub_20ACCCA24(uint64_t a1)
{
  uint64_t v549 = MEMORY[0x270FA5388](a1);
  uint64_t v508 = v2;
  uint64_t v544 = 0;
  uint64_t v509 = sub_20ACD3C68;
  uint64_t v510 = sub_20ACD3D1C;
  uint64_t v511 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD3CA0;
  uint64_t v512 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD3CD4;
  uint64_t v513 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD3D68;
  v514 = sub_20ACD3EAC;
  v515 = sub_20ACD3F60;
  v516 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD3EE4;
  char v517 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD3F18;
  char v518 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD3FAC;
  v519 = sub_20ACD3FB8;
  v520 = sub_20ACD4028;
  v521 = sub_20ACD40DC;
  v522 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD4060;
  v523 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD4094;
  v524 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20ACD4128;
  v525 = "Fatal error";
  v526 = "Unexpectedly found nil while unwrapping an Optional value";
  v527 = "AppleMediaDiscovery/AMDVectorDB.swift";
  v650[4] = *MEMORY[0x263EF8340];
  v619 = 0;
  uint64_t v618 = 0;
  uint64_t v617 = 0;
  uint64_t v616 = 0;
  uint64_t v612 = 0;
  uint64_t v610 = 0;
  uint64_t v611 = 0;
  uint64_t v608 = 0;
  v602 = 0;
  v603 = 0;
  uint64_t v596 = 0;
  uint64_t v597 = 0;
  uint64_t v588 = 0;
  uint64_t v589 = 0;
  uint64_t v583 = 0;
  uint64_t v581 = 0;
  uint64_t v573 = 0;
  uint64_t v572 = 0;
  id v571 = 0;
  uint64_t v566 = 0;
  id v560 = 0;
  uint64_t v528 = sub_20ACD49D0();
  uint64_t v529 = *(void *)(v528 - 8);
  uint64_t v530 = v528 - 8;
  unint64_t v531 = (*(void *)(v529 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  v532 = (char *)&v210 - v531;
  v619 = (char *)&v210 - v531;
  uint64_t v533 = sub_20ACD4F50();
  uint64_t v534 = *(void *)(v533 - 8);
  uint64_t v535 = v533 - 8;
  unint64_t v536 = (*(void *)(v534 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v549);
  v537 = (char *)&v210 - v536;
  unint64_t v538 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v539 = (char *)&v210 - v538;
  unint64_t v540 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v541 = (char *)&v210 - v540;
  unint64_t v542 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v543 = (char *)&v210 - v542;
  uint64_t v618 = v9;
  uint64_t v617 = v1;
  uint64_t v545 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B40);
  sub_20ACD53F0();
  uint64_t v546 = MEMORY[0x263F8D310];
  uint64_t v547 = MEMORY[0x263F8EE58] + 8;
  uint64_t v548 = MEMORY[0x263F8D320];
  uint64_t v616 = sub_20ACD4FA0();
  uint64_t v10 = sub_20ACD5010();
  v550 = v615;
  v615[0] = v10;
  v615[1] = v11;
  MEMORY[0x21052B560](v650);
  sub_20ACAD060();
  BOOL v507 = v650[3] == 0;
  BOOL v506 = v507;
  sub_20ACB3678((uint64_t)v650);
  if (v506)
  {
    sub_20ACD27C8();
    int v494 = 1;
    uint64_t v502 = sub_20ACD5010();
    uint64_t v500 = v12;
    uint64_t v501 = sub_20ACC30A0(3);
    uint64_t v496 = sub_20ACD53F0();
    double v495 = v13;
    id v497 = (id)*MEMORY[0x263F08320];
    id v14 = v497;
    uint64_t v15 = sub_20ACD4FF0();
    uint64_t v16 = v495;
    *double v495 = v15;
    v16[1] = v17;
    uint64_t v18 = sub_20ACD5010();
    uint64_t v19 = v495;
    uint64_t v20 = v18;
    uint64_t v21 = v496;
    uint64_t v499 = MEMORY[0x263F8D310];
    v495[5] = MEMORY[0x263F8D310];
    v19[2] = v20;
    v19[3] = v22;
    sub_20ACAD01C();
    uint64_t v498 = v21;

    uint64_t v23 = sub_20ACD4FA0();
    id v504 = sub_20ACC52D8(v502, v500, v501, v23);
    swift_willThrow();
    sub_20ACBD734();
    uint64_t v505 = (uint64_t)v504;
  }
  else
  {
    uint64_t v24 = sub_20ACD5010();
    v493 = v614;
    v614[0] = v24;
    v614[1] = v25;
    MEMORY[0x21052B560](v648);
    sub_20ACAD060();
    if (!v648[3])
    {
      char v207 = 2;
      uint64_t v208 = 239;
      int v209 = 0;
      sub_20ACD5340();
      __break(1u);
    }
    uint64_t v489 = v649;
    sub_20ACB323C((uint64_t)v648, (uint64_t)v649);
    uint64_t v491 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C78);
    swift_dynamicCast();
    uint64_t v490 = v613;
    uint64_t v612 = v613;
    swift_bridgeObjectRetain();
    uint64_t v609 = v490;
    sub_20ACD3B78();
    sub_20ACD5210();
    for (uint64_t i = v508; ; uint64_t i = v218)
    {
      while (1)
      {
        while (1)
        {
          uint64_t v487 = (void *)i;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ACA0CD0);
          sub_20ACD5300();
          uint64_t v488 = v647;
          if (!v647)
          {
            sub_20ACD3BFC();
            uint64_t v275 = &v616;
            uint64_t v274 = v616;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            sub_20ACBD734();
            return v274;
          }
          uint64_t v486 = v488;
          uint64_t v484 = v488;
          uint64_t v608 = v488;
          uint64_t v26 = sub_20ACD5010();
          uint64_t v485 = v607;
          v607[0] = v26;
          v607[1] = v27;
          MEMORY[0x21052B560](v646);
          sub_20ACAD060();
          BOOL v483 = v646[3] == 0;
          BOOL v482 = v483;
          sub_20ACB3678((uint64_t)v646);
          if (v482)
          {
            sub_20ACD27C8();
            int v472 = 1;
            uint64_t v480 = sub_20ACD5010();
            uint64_t v478 = v28;
            uint64_t v479 = sub_20ACC30A0(3);
            uint64_t v474 = sub_20ACD53F0();
            uint64_t v473 = v29;
            id v475 = (id)*MEMORY[0x263F08320];
            id v30 = v475;
            uint64_t v31 = sub_20ACD4FF0();
            uint64_t v32 = v473;
            *uint64_t v473 = v31;
            v32[1] = v33;
            uint64_t v34 = sub_20ACD5010();
            uint64_t v35 = v473;
            uint64_t v36 = v34;
            uint64_t v37 = v474;
            uint64_t v477 = MEMORY[0x263F8D310];
            v473[5] = MEMORY[0x263F8D310];
            v35[2] = v36;
            v35[3] = v38;
            sub_20ACAD01C();
            uint64_t v476 = v37;

            uint64_t v39 = sub_20ACD4FA0();
            id v481 = sub_20ACC52D8(v480, v478, v479, v39);
            swift_willThrow();
            swift_bridgeObjectRelease();
            sub_20ACD3BFC();
            swift_bridgeObjectRelease();
            sub_20ACBD734();
            uint64_t v505 = (uint64_t)v481;
            return v503;
          }
          uint64_t v40 = sub_20ACD5010();
          uint64_t v471 = v606;
          v606[0] = v40;
          v606[1] = v41;
          MEMORY[0x21052B560](v644);
          sub_20ACAD060();
          if (!v644[3])
          {
            char v207 = 2;
            uint64_t v208 = 244;
            int v209 = 0;
            sub_20ACD5340();
            __break(1u);
          }
          uint64_t v465 = v645;
          sub_20ACB323C((uint64_t)v644, (uint64_t)v645);
          uint64_t v469 = MEMORY[0x263F8EE58] + 8;
          uint64_t v468 = MEMORY[0x263F8D310];
          swift_dynamicCast();
          uint64_t v466 = v604;
          uint64_t v467 = v605;
          v602 = v604;
          v603 = v605;
          uint64_t v42 = sub_20ACD5010();
          uint64_t v470 = v601;
          v601[0] = v42;
          v601[1] = v43;
          MEMORY[0x21052B560](v643);
          sub_20ACAD060();
          BOOL v464 = v643[3] == 0;
          BOOL v463 = v464;
          sub_20ACB3678((uint64_t)v643);
          if (v463)
          {
            sub_20ACD27C8();
            int v453 = 1;
            uint64_t v461 = sub_20ACD5010();
            uint64_t v459 = v44;
            uint64_t v460 = sub_20ACC30A0(3);
            uint64_t v455 = sub_20ACD53F0();
            v454 = v45;
            id v456 = (id)*MEMORY[0x263F08320];
            id v46 = v456;
            uint64_t v47 = sub_20ACD4FF0();
            uint64_t v48 = v454;
            uint64_t *v454 = v47;
            v48[1] = v49;
            uint64_t v50 = sub_20ACD5010();
            uint64_t v51 = v454;
            uint64_t v52 = v50;
            uint64_t v53 = v455;
            uint64_t v458 = MEMORY[0x263F8D310];
            v454[5] = MEMORY[0x263F8D310];
            v51[2] = v52;
            v51[3] = v54;
            sub_20ACAD01C();
            uint64_t v457 = v53;

            uint64_t v55 = sub_20ACD4FA0();
            id v462 = sub_20ACC52D8(v461, v459, v460, v55);
            swift_willThrow();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_20ACD3BFC();
            swift_bridgeObjectRelease();
            sub_20ACBD734();
            uint64_t v505 = (uint64_t)v462;
            return v503;
          }
          uint64_t v56 = sub_20ACD5010();
          uint64_t v452 = v600;
          v600[0] = v56;
          v600[1] = v57;
          MEMORY[0x21052B560](v641);
          sub_20ACAD060();
          if (!v641[3])
          {
            char v207 = 2;
            uint64_t v208 = 248;
            int v209 = 0;
            sub_20ACD5340();
            __break(1u);
          }
          uint64_t v443 = v642;
          sub_20ACB323C((uint64_t)v641, (uint64_t)v642);
          swift_dynamicCast();
          uint64_t v445 = v598;
          uint64_t v446 = v599;
          uint64_t v596 = v598;
          uint64_t v597 = v599;
          uint64_t v444 = *sub_20ACC2E9C();
          swift_bridgeObjectRetain();
          char v450 = &v595;
          uint64_t v595 = v444;
          uint64_t v448 = v594;
          v594[0] = v445;
          v594[1] = v446;
          uint64_t v447 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C88);
          unint64_t v449 = sub_20ACB4BD4();
          int v451 = sub_20ACD5070();
          sub_20ACB364C();
          if ((v451 & 1) == 0)
          {
            sub_20ACD27C8();
            int v433 = 1;
            uint64_t v441 = sub_20ACD5010();
            uint64_t v439 = v58;
            uint64_t v440 = sub_20ACC30A0(3);
            uint64_t v435 = sub_20ACD53F0();
            uint64_t v434 = v59;
            id v436 = (id)*MEMORY[0x263F08320];
            id v60 = v436;
            uint64_t v61 = sub_20ACD4FF0();
            uint64_t v62 = v434;
            *uint64_t v434 = v61;
            v62[1] = v63;
            uint64_t v64 = sub_20ACD5010();
            uint64_t v65 = v434;
            uint64_t v66 = v64;
            uint64_t v67 = v435;
            uint64_t v438 = MEMORY[0x263F8D310];
            v434[5] = MEMORY[0x263F8D310];
            v65[2] = v66;
            v65[3] = v68;
            sub_20ACAD01C();
            uint64_t v437 = v67;

            uint64_t v69 = sub_20ACD4FA0();
            id v442 = sub_20ACC52D8(v441, v439, v440, v69);
            swift_willThrow();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_20ACD3BFC();
            swift_bridgeObjectRelease();
            sub_20ACBD734();
            uint64_t v505 = (uint64_t)v442;
            return v503;
          }
          uint64_t v70 = sub_20ACD5010();
          uint64_t v432 = v593;
          v593[0] = v70;
          v593[1] = v71;
          MEMORY[0x21052B560](v640);
          sub_20ACAD060();
          BOOL v431 = v640[3] == 0;
          BOOL v430 = v431;
          sub_20ACB3678((uint64_t)v640);
          if (v430)
          {
            sub_20ACD27C8();
            int v420 = 1;
            uint64_t v428 = sub_20ACD5010();
            uint64_t v426 = v72;
            uint64_t v427 = sub_20ACC30A0(3);
            uint64_t v422 = sub_20ACD53F0();
            uint64_t v421 = v73;
            id v423 = (id)*MEMORY[0x263F08320];
            id v74 = v423;
            uint64_t v75 = sub_20ACD4FF0();
            uint64_t v76 = v421;
            *uint64_t v421 = v75;
            v76[1] = v77;
            uint64_t v78 = sub_20ACD5010();
            id v79 = v421;
            uint64_t v80 = v78;
            uint64_t v81 = v422;
            uint64_t v425 = MEMORY[0x263F8D310];
            v421[5] = MEMORY[0x263F8D310];
            v79[2] = v80;
            v79[3] = v82;
            sub_20ACAD01C();
            uint64_t v424 = v81;

            uint64_t v83 = sub_20ACD4FA0();
            id v429 = sub_20ACC52D8(v428, v426, v427, v83);
            swift_willThrow();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_20ACD3BFC();
            swift_bridgeObjectRelease();
            sub_20ACBD734();
            uint64_t v505 = (uint64_t)v429;
            return v503;
          }
          uint64_t v84 = sub_20ACD5010();
          uint64_t v419 = v592;
          v592[0] = v84;
          v592[1] = v85;
          MEMORY[0x21052B560](v638);
          sub_20ACAD060();
          if (!v638[3])
          {
            char v207 = 2;
            uint64_t v208 = 256;
            int v209 = 0;
            sub_20ACD5340();
            __break(1u);
          }
          uint64_t v413 = v639;
          sub_20ACB323C((uint64_t)v638, (uint64_t)v639);
          swift_dynamicCast();
          uint64_t v414 = v590;
          uint64_t v415 = v591;
          uint64_t v588 = v590;
          uint64_t v589 = v591;
          uint64_t v416 = *sub_20ACC2E9C();
          swift_bridgeObjectRetain();
          v417 = &v587;
          uint64_t v587 = v416;
          v586[2] = v445;
          v586[3] = v446;
          int v418 = sub_20ACD5070();
          sub_20ACB364C();
          if ((v418 & 1) == 0)
          {
            sub_20ACD27C8();
            int v403 = 1;
            uint64_t v411 = sub_20ACD5010();
            uint64_t v409 = v86;
            uint64_t v410 = sub_20ACC30A0(3);
            uint64_t v405 = sub_20ACD53F0();
            unint64_t v404 = v87;
            id v406 = (id)*MEMORY[0x263F08320];
            id v88 = v406;
            uint64_t v89 = sub_20ACD4FF0();
            id v90 = v404;
            *unint64_t v404 = v89;
            v90[1] = v91;
            uint64_t v92 = sub_20ACD5010();
            uint64_t v93 = v404;
            uint64_t v94 = v92;
            uint64_t v95 = v405;
            uint64_t v408 = MEMORY[0x263F8D310];
            v404[5] = MEMORY[0x263F8D310];
            v93[2] = v94;
            v93[3] = v96;
            sub_20ACAD01C();
            uint64_t v407 = v95;

            uint64_t v97 = sub_20ACD4FA0();
            id v412 = sub_20ACC52D8(v411, v409, v410, v97);
            swift_willThrow();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_20ACD3BFC();
            swift_bridgeObjectRelease();
            sub_20ACBD734();
            uint64_t v505 = (uint64_t)v412;
            return v503;
          }
          uint64_t v98 = sub_20ACD5010();
          uint64_t v402 = v586;
          v586[0] = v98;
          v586[1] = v99;
          MEMORY[0x21052B560](v637);
          sub_20ACAD060();
          BOOL v401 = v637[3] == 0;
          BOOL v400 = v401;
          sub_20ACB3678((uint64_t)v637);
          if (v400)
          {
            sub_20ACD27C8();
            int v390 = 1;
            uint64_t v398 = sub_20ACD5010();
            uint64_t v396 = v100;
            uint64_t v397 = sub_20ACC30A0(3);
            uint64_t v392 = sub_20ACD53F0();
            uint64_t v391 = v101;
            id v393 = (id)*MEMORY[0x263F08320];
            id v102 = v393;
            uint64_t v103 = sub_20ACD4FF0();
            uint64_t v104 = v391;
            *uint64_t v391 = v103;
            v104[1] = v105;
            uint64_t v106 = sub_20ACD5010();
            BOOL v107 = v391;
            uint64_t v108 = v106;
            uint64_t v109 = v392;
            uint64_t v395 = MEMORY[0x263F8D310];
            v391[5] = MEMORY[0x263F8D310];
            v107[2] = v108;
            v107[3] = v110;
            sub_20ACAD01C();
            uint64_t v394 = v109;

            uint64_t v111 = sub_20ACD4FA0();
            id v399 = sub_20ACC52D8(v398, v396, v397, v111);
            swift_willThrow();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_20ACD3BFC();
            swift_bridgeObjectRelease();
            sub_20ACBD734();
            uint64_t v505 = (uint64_t)v399;
            return v503;
          }
          uint64_t v112 = sub_20ACD5010();
          uint64_t v389 = v585;
          v585[0] = v112;
          v585[1] = v113;
          MEMORY[0x21052B560](v635);
          sub_20ACAD060();
          if (!v635[3])
          {
            char v207 = 2;
            uint64_t v208 = 264;
            int v209 = 0;
            sub_20ACD5340();
            __break(1u);
          }
          v383 = v636;
          sub_20ACB323C((uint64_t)v635, (uint64_t)v636);
          swift_dynamicCast();
          uint64_t v384 = v584;
          uint64_t v583 = v584;
          v634 = 0;
          id v385 = self;
          swift_bridgeObjectRetain();
          id v387 = (id)sub_20ACD4FE0();
          swift_bridgeObjectRelease();
          id v582 = v634;
          id v388 = objc_msgSend(v385, sel_fetchVectorDBConfigForDBName_error_, v387, &v582);
          id v386 = v582;
          id v114 = v582;
          uint64_t v115 = v634;
          v634 = v386;

          if (!v388)
          {
            id v272 = v634;
            uint64_t v273 = sub_20ACD4970();

            swift_willThrow();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_20ACD3BFC();
            swift_bridgeObjectRelease();
            sub_20ACBD734();
            uint64_t v505 = v273;
            return v503;
          }
          id v382 = v388;
          id v376 = v388;
          uint64_t v379 = MEMORY[0x263F8DB68];
          uint64_t v380 = MEMORY[0x263F8EE58] + 8;
          uint64_t v381 = MEMORY[0x263F8DB70];
          uint64_t v378 = sub_20ACD4F80();
          uint64_t v581 = v378;

          uint64_t v579 = sub_20ACD5010();
          uint64_t v580 = v116;
          uint64_t v377 = v633;
          sub_20ACD5390();
          MEMORY[0x21052B560](v632, v377, v378, v379, v380, v381);
          BOOL v375 = v632[3] != 0;
          BOOL v374 = v375;
          sub_20ACB3678((uint64_t)v632);
          sub_20ACBFB94((uint64_t)v633);
          sub_20ACAD060();
          if (!v374) {
            break;
          }
          uint64_t v117 = v543;
          uint64_t v118 = sub_20ACC20F0();
          (*(void (**)(char *, uint64_t, uint64_t))(v534 + 16))(v117, v118, v533);
          swift_bridgeObjectRetain();
          uint64_t v362 = 32;
          uint64_t v363 = 7;
          uint64_t v119 = swift_allocObject();
          unint64_t v120 = v467;
          uint64_t v364 = v119;
          *(void *)(v119 + 16) = v466;
          *(void *)(v119 + 24) = v120;
          uint64_t v372 = sub_20ACD4F30();
          int v373 = sub_20ACD5220();
          int v359 = &v555;
          uint64_t v555 = 12;
          unint64_t v357 = sub_20ACD01EC();
          unint64_t v358 = sub_20ACD0268();
          sub_20ACD02E4();
          sub_20ACD5080();
          uint32_t v360 = v556;
          uint64_t v361 = 17;
          uint64_t v366 = swift_allocObject();
          *(unsigned char *)(v366 + 16) = 32;
          uint64_t v367 = swift_allocObject();
          *(unsigned char *)(v367 + 16) = 8;
          uint64_t v121 = swift_allocObject();
          uint64_t v122 = v364;
          uint64_t v365 = v121;
          *(void *)(v121 + 16) = v520;
          *(void *)(v121 + 24) = v122;
          uint64_t v123 = swift_allocObject();
          uint64_t v124 = v365;
          uint64_t v369 = v123;
          *(void *)(v123 + 16) = v521;
          *(void *)(v123 + 24) = v124;
          uint64_t v371 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B60);
          uint64_t v368 = sub_20ACD53F0();
          uint64_t v370 = v125;
          swift_retain();
          uint64_t v126 = v366;
          uint64_t v127 = v370;
          *uint64_t v370 = v522;
          v127[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v126;
          swift_retain();
          uint64_t v128 = v367;
          uint64_t v129 = v370;
          v370[2] = v523;
          v129[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v128;
          swift_retain();
          uint64_t v130 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v369;
          uint64_t v131 = v370;
          v370[4] = v524;
          v131[5] = v130;
          sub_20ACAD01C();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v372, (os_log_type_t)v373))
          {
            uint64_t v350 = (uint8_t *)sub_20ACD5280();
            uint64_t v349 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B48);
            uint64_t v351 = sub_20ACD0360(0);
            uint64_t v352 = sub_20ACD0360(1);
            uint64_t v353 = &v553;
            v553 = v350;
            uint64_t v354 = &v621;
            uint64_t v621 = v351;
            uint64_t v355 = &v620;
            uint64_t v620 = v352;
            sub_20ACD03BC(2, &v553);
            sub_20ACD03BC(1, v353);
            uint64_t v132 = v487;
            v551 = v522;
            uint64_t v552 = v366;
            sub_20ACD03D0(&v551, (uint64_t)v353, (uint64_t)v354, (uint64_t)v355);
            uint64_t v356 = v132;
            if (v132)
            {
              __break(1u);
            }
            else
            {
              v551 = v523;
              uint64_t v552 = v367;
              sub_20ACD03D0(&v551, (uint64_t)&v553, (uint64_t)&v621, (uint64_t)&v620);
              uint64_t v347 = 0;
              uint64_t v133 = (uint64_t)v347;
              v551 = v524;
              uint64_t v552 = v369;
              sub_20ACD03D0(&v551, (uint64_t)&v553, (uint64_t)&v621, (uint64_t)&v620);
              uint64_t v346 = v133;
              _os_log_impl(&dword_20ABD4000, v372, (os_log_type_t)v373, "DB exists with name:%s", v350, v360);
              sub_20ACD041C(v351);
              sub_20ACD041C(v352);
              sub_20ACD5260();
              swift_release();
              swift_release();
              swift_release();
              uint64_t v348 = v346;
            }
          }
          else
          {
            swift_release();
            swift_release();
            swift_release();
            uint64_t v348 = (uint64_t)v487;
          }
          uint64_t v345 = v348;

          (*(void (**)(char *, uint64_t))(v534 + 8))(v543, v533);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C50);
          uint64_t v344 = v622;
          v622[3] = v134;
          v622[0] = v378;
          uint64_t v343 = v554;
          v554[0] = v466;
          v554[1] = v467;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B38);
          sub_20ACD4FD0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t i = v345;
        }
        uint64_t v135 = v541;
        uint64_t v136 = sub_20ACC20F0();
        uint64_t v323 = *(void (**)(void, void, void))(v534 + 16);
        uint64_t v324 = v534 + 16;
        v323(v135, v136, v533);
        swift_bridgeObjectRetain();
        uint64_t v331 = 32;
        uint64_t v332 = 7;
        uint64_t v137 = swift_allocObject();
        id v138 = v467;
        uint64_t v333 = v137;
        *(void *)(v137 + 16) = v466;
        *(void *)(v137 + 24) = v138;
        uint64_t v341 = sub_20ACD4F30();
        int v342 = sub_20ACD5220();
        uint64_t v327 = &v577;
        uint64_t v577 = 12;
        unint64_t v325 = sub_20ACD01EC();
        unint64_t v326 = sub_20ACD0268();
        unint64_t v328 = sub_20ACD02E4();
        sub_20ACD5080();
        uint32_t v329 = v578;
        uint64_t v330 = 17;
        uint64_t v335 = swift_allocObject();
        *(unsigned char *)(v335 + 16) = 32;
        uint64_t v336 = swift_allocObject();
        *(unsigned char *)(v336 + 16) = 8;
        uint64_t v139 = swift_allocObject();
        uint64_t v140 = v333;
        uint64_t v334 = v139;
        *(void *)(v139 + 16) = v509;
        *(void *)(v139 + 24) = v140;
        uint64_t v141 = swift_allocObject();
        uint64_t v142 = v334;
        uint64_t v338 = v141;
        *(void *)(v141 + 16) = v510;
        *(void *)(v141 + 24) = v142;
        uint64_t v340 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B60);
        uint64_t v337 = sub_20ACD53F0();
        uint64_t v339 = v143;
        swift_retain();
        uint64_t v144 = v335;
        id v145 = v339;
        *uint64_t v339 = v511;
        v145[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v144;
        swift_retain();
        uint64_t v146 = v336;
        uint64_t v147 = v339;
        void v339[2] = v512;
        v147[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v146;
        swift_retain();
        uint64_t v148 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v338;
        id v149 = v339;
        v339[4] = v513;
        v149[5] = v148;
        sub_20ACAD01C();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v341, (os_log_type_t)v342))
        {
          uint64_t v316 = (uint8_t *)sub_20ACD5280();
          uint64_t v315 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B48);
          uint64_t v317 = sub_20ACD0360(0);
          uint64_t v318 = sub_20ACD0360(1);
          uint64_t v319 = v559;
          v559[0] = v316;
          uint64_t v320 = v624;
          v624[0] = v317;
          uint64_t v321 = &v623;
          uint64_t v623 = v318;
          sub_20ACD03BC(2, v559);
          sub_20ACD03BC(1, v319);
          uint64_t v150 = v487;
          v557 = v511;
          uint64_t v558 = v335;
          sub_20ACD03D0(&v557, (uint64_t)v319, (uint64_t)v320, (uint64_t)v321);
          uint64_t v322 = v150;
          if (v150)
          {
            __break(1u);
          }
          else
          {
            v557 = v512;
            uint64_t v558 = v336;
            sub_20ACD03D0(&v557, (uint64_t)v559, (uint64_t)v624, (uint64_t)&v623);
            uint64_t v313 = 0;
            uint64_t v151 = v313;
            v557 = v513;
            uint64_t v558 = v338;
            sub_20ACD03D0(&v557, (uint64_t)v559, (uint64_t)v624, (uint64_t)&v623);
            uint64_t v312 = v151;
            _os_log_impl(&dword_20ABD4000, v341, (os_log_type_t)v342, "New vector DB name: %s. Instantiating new vectorDB", v316, v329);
            sub_20ACD041C(v317);
            sub_20ACD041C(v318);
            sub_20ACD5260();
            swift_release();
            swift_release();
            swift_release();
            uint64_t v314 = v312;
          }
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
          uint64_t v314 = v487;
        }
        objc_super v308 = v314;

        uint64_t v306 = *(void (**)(void, void))(v534 + 8);
        uint64_t v307 = v534 + 8;
        v306(v541, v533);
        uint64_t v152 = type metadata accessor for AMDVectorDBManager();
        uint64_t v153 = v308;
        uint64_t v309 = v152;
        sub_20ACC7EF8((uint64_t)v466, (uint64_t)v467, v532);
        uint64_t v310 = v153;
        uint64_t v311 = (uint64_t)v153;
        if (v153)
        {
          uint64_t v271 = v311;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_20ACD3BFC();
          swift_bridgeObjectRelease();
          sub_20ACBD734();
          uint64_t v505 = v271;
          return v503;
        }
        v631 = 0;
        id v298 = self;
        sub_20ACD49B0();
        uint64_t v295 = v154;
        id v304 = (id)sub_20ACD4FE0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        id v303 = (id)sub_20ACD4FE0();
        swift_bridgeObjectRelease();
        uint64_t v297 = &v575;
        uint64_t v575 = v384;
        unint64_t v296 = sub_20ACD3D74();
        sub_20ACD3DF0();
        sub_20ACD50C0();
        unsigned int v299 = v576;
        swift_bridgeObjectRetain();
        id v302 = (id)sub_20ACD4FE0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        id v301 = (id)sub_20ACD4FE0();
        swift_bridgeObjectRelease();
        id v574 = v631;
        id v305 = objc_msgSend(v298, sel_persistVectorDBPath_forDBName_withVectorDimension_andDataType_withDistanceMetric_error_, v304, v303, v299, v302, v301, &v574);
        id v300 = v574;
        id v155 = v574;
        uint64_t v156 = v631;
        v631 = v300;

        if (!v305)
        {
          id v269 = v631;
          uint64_t v270 = sub_20ACD4970();

          swift_willThrow();
          (*(void (**)(char *, uint64_t))(v529 + 8))(v532, v528);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_20ACD3BFC();
          swift_bridgeObjectRelease();
          sub_20ACBD734();
          uint64_t v505 = v270;
          return v503;
        }
        id v294 = v305;
        id v282 = v305;
        uint64_t v289 = MEMORY[0x263F8EE58] + 8;
        uint64_t v283 = sub_20ACD4F80();
        uint64_t v573 = v283;

        uint64_t v286 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C60);
        uint64_t v284 = sub_20ACD53F0();
        unint64_t v285 = v157;
        uint64_t v158 = sub_20ACD5010();
        BOOL v159 = v285;
        *unint64_t v285 = v158;
        v159[1] = v160;
        swift_bridgeObjectRetain();
        uint32_t v161 = v285;
        uint64_t v162 = v467;
        v285[2] = (uint64_t)v466;
        v161[3] = (uint64_t)v162;
        sub_20ACAD01C();
        uint64_t v288 = MEMORY[0x263F8D310];
        uint64_t v290 = MEMORY[0x263F8D320];
        uint64_t v287 = sub_20ACD4FA0();
        uint64_t v572 = v287;
        swift_bridgeObjectRetain();
        uint64_t v163 = sub_20ACD5360();
        uint64_t v164 = v310;
        id v165 = AMDVectorDBManager.__allocating_init(vectorDBConfig:)(v163);
        uint64_t v291 = (uint64_t)v164;
        unint64_t v292 = v165;
        uint64_t v293 = v164;
        if (v164) {
          break;
        }
        id v276 = v292;
        swift_bridgeObjectRelease();
        id v560 = v276;

        swift_bridgeObjectRetain();
        uint64_t v279 = sub_20ACD53F0();
        uint64_t v278 = v166;
        int v277 = 1;
        uint64_t v167 = sub_20ACD5010();
        uint64_t v168 = v278;
        *uint64_t v278 = v167;
        v168[1] = v169;
        uint64_t v170 = sub_20ACD49B0();
        id v171 = v278;
        uint64_t v280 = MEMORY[0x263F8D310];
        v278[5] = MEMORY[0x263F8D310];
        void v171[2] = v170;
        v171[3] = v172;
        uint64_t v173 = sub_20ACD5010();
        uint64_t v174 = v278;
        v278[6] = v173;
        v174[7] = v175;
        swift_bridgeObjectRetain();
        uint64_t v176 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C50);
        uint64_t v177 = v278;
        uint64_t v178 = v283;
        v278[11] = v176;
        v177[8] = v178;
        sub_20ACAD01C();
        uint64_t v281 = sub_20ACD4FA0();
        v624[4] = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B38);
        v624[1] = v281;
        v559[1] = v466;
        v559[2] = v467;
        sub_20ACD4FD0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v529 + 8))(v532, v528);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t i = v291;
      }
      id v180 = v539;
      id v255 = v293;
      uint64_t v254 = 0;
      swift_bridgeObjectRelease();
      id v181 = v255;
      id v571 = v255;
      uint64_t v182 = sub_20ACC20F0();
      v323(v180, v182, v533);
      swift_bridgeObjectRetain();
      uint64_t v258 = 32;
      uint64_t v259 = 7;
      uint64_t v183 = swift_allocObject();
      uint64_t v184 = v467;
      uint64_t v260 = v183;
      *(void *)(v183 + 16) = v466;
      *(void *)(v183 + 24) = v184;
      uint64_t v267 = sub_20ACD4F30();
      int v268 = sub_20ACD5220();
      uint64_t v569 = 12;
      sub_20ACD5080();
      uint32_t v256 = v570;
      uint64_t v257 = 17;
      uint64_t v262 = swift_allocObject();
      *(unsigned char *)(v262 + 16) = 32;
      uint64_t v263 = swift_allocObject();
      *(unsigned char *)(v263 + 16) = 8;
      uint64_t v185 = swift_allocObject();
      uint64_t v186 = v260;
      uint64_t v261 = v185;
      *(void *)(v185 + 16) = v514;
      *(void *)(v185 + 24) = v186;
      uint64_t v187 = swift_allocObject();
      uint64_t v188 = v261;
      uint64_t v265 = v187;
      *(void *)(v187 + 16) = v515;
      *(void *)(v187 + 24) = v188;
      uint64_t v264 = sub_20ACD53F0();
      uint64_t v266 = v189;
      swift_retain();
      uint64_t v190 = v262;
      unint64_t v191 = v266;
      *uint64_t v266 = v516;
      v191[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v190;
      swift_retain();
      uint64_t v192 = v263;
      unint64_t v193 = v266;
      v266[2] = v517;
      v193[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v192;
      swift_retain();
      uint64_t v194 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v265;
      uint64_t v195 = v266;
      void v266[4] = v518;
      v195[5] = v194;
      sub_20ACAD01C();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v267, (os_log_type_t)v268))
      {
        uint32_t v247 = (uint8_t *)sub_20ACD5280();
        uint64_t v246 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B48);
        uint64_t v248 = sub_20ACD0360(0);
        uint64_t v249 = sub_20ACD0360(1);
        uint64_t v250 = v563;
        v563[0] = v247;
        uint64_t v251 = &v626;
        uint64_t v626 = v248;
        uint64_t v252 = &v625;
        uint64_t v625 = v249;
        sub_20ACD03BC(2, v563);
        sub_20ACD03BC(1, v250);
        uint64_t v196 = v254;
        v561 = v516;
        uint64_t v562 = v262;
        sub_20ACD03D0(&v561, (uint64_t)v250, (uint64_t)v251, (uint64_t)v252);
        uint64_t v253 = v196;
        if (v196)
        {
          __break(1u);
        }
        else
        {
          v561 = v517;
          uint64_t v562 = v263;
          sub_20ACD03D0(&v561, (uint64_t)v563, (uint64_t)&v626, (uint64_t)&v625);
          uint64_t v244 = 0;
          uint64_t v197 = v244;
          v561 = v518;
          uint64_t v562 = v265;
          sub_20ACD03D0(&v561, (uint64_t)v563, (uint64_t)&v626, (uint64_t)&v625);
          uint64_t v243 = v197;
          _os_log_impl(&dword_20ABD4000, v267, (os_log_type_t)v268, "VectorDB instantiation failed for dbName: %s", v247, v256);
          sub_20ACD041C(v248);
          sub_20ACD041C(v249);
          sub_20ACD5260();
          swift_release();
          swift_release();
          swift_release();
          uint64_t v245 = v243;
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        uint64_t v245 = v254;
      }
      uint64_t v198 = v537;
      uint64_t v238 = v245;

      v306(v539, v533);
      uint64_t v199 = sub_20ACC20F0();
      v323(v198, v199, v533);
      uint64_t v241 = sub_20ACD4F30();
      int v240 = sub_20ACD5220();
      v567[1] = (id)2;
      sub_20ACD5080();
      uint32_t v239 = v568;
      uint64_t v242 = (unsigned char *)sub_20ACD53F0();
      if (os_log_type_enabled(v241, (os_log_type_t)v240))
      {
        uint64_t v227 = (uint8_t *)sub_20ACD5280();
        uint64_t v225 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B48);
        uint64_t v226 = 0;
        uint64_t v228 = sub_20ACD0360(0);
        uint64_t v229 = sub_20ACD0360(v226);
        uint64_t v233 = &v564;
        v564 = v227;
        id v234 = &v628;
        uint64_t v628 = v228;
        uint64_t v231 = &v627;
        uint64_t v627 = v229;
        unsigned int v230 = 0;
        sub_20ACD03BC(0, &v564);
        sub_20ACD03BC(v230, v233);
        v563[1] = v242;
        uint64_t v232 = &v210;
        MEMORY[0x270FA5388](&v210);
        uint64_t v200 = v234;
        uint64_t v201 = &v210 - 6;
        uint64_t v235 = &v210 - 6;
        v201[2] = (uint64_t)v233;
        v201[3] = (uint64_t)v200;
        v201[4] = v202;
        uint64_t v236 = __swift_instantiateConcreteTypeFromMangledName(&qword_267681110);
        sub_20ACD3288();
        uint64_t v203 = (uint64_t)v238;
        sub_20ACD5060();
        uint64_t v237 = v203;
        if (v203)
        {
          __break(1u);
        }
        else
        {
          _os_log_impl(&dword_20ABD4000, v241, (os_log_type_t)v240, "Performing cleanup of SQL table", v227, v239);
          uint64_t v223 = 0;
          sub_20ACD041C(v228);
          sub_20ACD041C(v229);
          sub_20ACD5260();
          swift_bridgeObjectRelease();
          uint64_t v224 = v237;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v224 = (uint64_t)v238;
      }
      uint64_t v218 = v224;

      v306(v537, v533);
      v630 = 0;
      id v219 = self;
      swift_bridgeObjectRetain();
      id v221 = (id)sub_20ACD4FE0();
      swift_bridgeObjectRelease();
      v567[0] = v630;
      id v222 = objc_msgSend(v219, sel_deleteVectorDBEntryForDBName_error_, v221, v567);
      id v220 = v567[0];
      id v204 = v567[0];
      unint64_t v205 = v630;
      v630 = v220;

      if (!v222) {
        break;
      }
      id v217 = v222;
      id v213 = v222;
      uint64_t v216 = sub_20ACD4F80();
      uint64_t v566 = v216;

      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v206 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C50);
      uint64_t v215 = v629;
      v629[3] = v206;
      v629[0] = v216;
      uint64_t v214 = v565;
      v565[0] = v466;
      v565[1] = v467;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B38);
      sub_20ACD4FD0();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v529 + 8))(v532, v528);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    id v211 = v630;
    uint64_t v212 = sub_20ACD4970();

    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v529 + 8))(v532, v528);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_20ACD3BFC();
    swift_bridgeObjectRelease();
    sub_20ACBD734();
    uint64_t v505 = v212;
  }
  return v503;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACCFD74()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACCFDA8()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACCFDDC()
{
}

id AMDVectorDBManager.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t AMDVectorDBManager.init()()
{
  if (!"AppleMediaDiscovery.AMDVectorDBManager")
  {
    sub_20ACD5340();
    __break(1u);
  }
  uint64_t result = sub_20ACD08F4((uint64_t)"AppleMediaDiscovery.AMDVectorDBManager", 38, (unint64_t)"init()", 6, 2, (unint64_t)"AppleMediaDiscovery/AMDVectorDB.swift", 37, 2, v1, 0x17uLL, 0x1BuLL);
  __break(1u);
  return result;
}

id sub_20ACD0104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (void *)sub_20ACD4FE0();
  if (a4)
  {
    uint64_t v6 = sub_20ACD4F70();
    swift_bridgeObjectRelease();
    uint64_t v7 = (void *)v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v5 = objc_msgSend(v9, sel_initWithDomain_code_userInfo_, v11, a3);

  swift_bridgeObjectRelease();
  return v5;
}

unint64_t sub_20ACD01EC()
{
  uint64_t v2 = qword_26ACA0B58;
  if (!qword_26ACA0B58)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26ACA0B58);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_20ACD0268()
{
  uint64_t v2 = qword_26ACA0B50;
  if (!qword_26ACA0B50)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26ACA0B50);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_20ACD02E4()
{
  uint64_t v2 = qword_26ACA0B30;
  if (!qword_26ACA0B30)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26ACA0B30);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_20ACD0360(uint64_t a1)
{
  if (a1) {
    return sub_20ACD5280();
  }
  else {
    return 0;
  }
}

uint64_t sub_20ACD03BC(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_20ACD03D0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_20ACD041C(uint64_t result)
{
  if (result)
  {
    sub_20ACD5270();
    return sub_20ACD5260();
  }
  return result;
}

uint64_t sub_20ACD048C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = a3;
  v7[1] = a4;
  uint64_t v8 = *(void *)(a3 - 8);
  uint64_t v9 = a3 - 8;
  v7[0] = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (void (*)(void))MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)v7 - v7[0];
  v4();
  uint64_t v12 = sub_20ACD53A0();
  uint64_t v13 = v5;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v11);
  return v12;
}

uint64_t sub_20ACD0570(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_20ACD05A8(uint64_t (*a1)(uint64_t *, uint64_t), uint64_t a2, unsigned int a3)
{
  if (a3 < 0x80uLL)
  {
    if (a3 > 0xFF) {
      goto LABEL_12;
    }
    unsigned int v5 = (a3 + 1);
  }
  else
  {
    int v7 = (a3 & 0x3F) << 8;
    if (a3 >> 6 < 0x20uLL)
    {
      unsigned int v5 = (v7 | (a3 >> 6)) + 33217;
    }
    else
    {
      int v6 = (v7 | (a3 >> 6) & 0x3F) << 8;
      if (a3 >> 12 < 0x10uLL) {
        unsigned int v5 = (v6 | (a3 >> 12)) + 8487393;
      }
      else {
        unsigned int v5 = ((a3 >> 18) | ((v6 | (a3 >> 12) & 0x3F) << 8)) - 2122219023;
      }
    }
  }
  uint64_t v4 = 4 - ((uint64_t)__clz(v5) >> 3);
  uint64_t v8 = (v5 - 0x101010101010101) & ((1 << ((8 * v4) & 0x3F)) - 1);
  if (v4 >= 0) {
    return a1(&v8, v4);
  }
  sub_20ACD5370();
  __break(1u);
LABEL_12:
  uint64_t result = sub_20ACD5340();
  __break(1u);
  return result;
}

uint64_t sub_20ACD08F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, unint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, unint64_t a10, unint64_t a11)
{
  uint64_t v21 = a9;
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  unint64_t v24 = a3;
  uint64_t v25 = a4;
  unint64_t v26 = a6;
  uint64_t v27 = a7;
  int v28 = a8;
  unint64_t v29 = a10;
  unint64_t v30 = a11;
  uint64_t v31 = sub_20ACD47F8;
  uint64_t v32 = sub_20ACD483C;
  uint64_t v33 = "Fatal error";
  uint64_t v34 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v35 = "Swift/StaticString.swift";
  uint64_t v36 = "Not enough bits to represent the passed value";
  uint64_t v37 = "Swift/Integers.swift";
  uint64_t v38 = "UnsafeBufferPointer with negative count";
  uint64_t v39 = "Swift/UnsafeBufferPointer.swift";
  uint64_t v40 = 0;
  unint64_t v42 = a6;
  uint64_t v43 = a7;
  char v44 = a8;
  uint64_t v45 = a1;
  uint64_t v46 = a2;
  unint64_t v47 = a10;
  unint64_t v48 = a11;
  if (a5)
  {
    if (v24 <= 0xFFFFFFFF)
    {
      unsigned int v20 = v24;
      if ((v24 < 0xD800 || v20 > 0xDFFF) && v20 <= 0x10FFFF)
      {
        uint64_t v19 = &v18;
        uint64_t v11 = (uint64_t (*)(uint64_t *, uint64_t))MEMORY[0x270FA5388](v32);
        uint64_t v16 = v31;
        uint64_t v17 = &v41;
        sub_20ACD05A8(v11, (uint64_t)v14, v12);
        return (uint64_t)v19;
      }
      v14[0] = 2;
      uint64_t v15 = 148;
      LODWORD(v16) = 0;
      sub_20ACD5340();
      __break(1u);
    }
    v14[0] = 2;
    uint64_t v15 = 3455;
    LODWORD(v16) = 0;
    sub_20ACD5340();
    __break(1u);
  }
  if (v24) {
    uint64_t v49 = v24;
  }
  else {
    uint64_t v49 = 0;
  }
  uint64_t v18 = v49;
  if (!v49)
  {
    v14[0] = 2;
    uint64_t v15 = 136;
    LODWORD(v16) = 0;
    sub_20ACD5340();
    __break(1u);
  }
  if (v25 >= 0) {
    return sub_20ACD0CF4(v18, v25, v26, v27, v28, v22, v23, v29, v21, v30);
  }
  uint64_t result = sub_20ACD5370();
  __break(1u);
  return result;
}

uint64_t sub_20ACD0CF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, unint64_t a10)
{
  uint64_t v21 = a9;
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  unint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v26 = a6;
  uint64_t v27 = a7;
  unint64_t v28 = a8;
  unint64_t v29 = a10;
  unint64_t v30 = sub_20ACD4868;
  uint64_t v31 = sub_20ACD4884;
  uint64_t v32 = "Fatal error";
  uint64_t v33 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v34 = "Swift/StaticString.swift";
  uint64_t v35 = "Not enough bits to represent the passed value";
  uint64_t v36 = "Swift/Integers.swift";
  uint64_t v37 = "UnsafeBufferPointer with negative count";
  uint64_t v38 = "Swift/UnsafeBufferPointer.swift";
  uint64_t v39 = 0;
  uint64_t v41 = a6;
  uint64_t v42 = a7;
  uint64_t v43 = a1;
  uint64_t v44 = a2;
  unint64_t v45 = a8;
  unint64_t v46 = a10;
  if (a5)
  {
    if (v24 <= 0xFFFFFFFF)
    {
      unsigned int v20 = v24;
      if ((v24 < 0xD800 || v20 > 0xDFFF) && v20 <= 0x10FFFF)
      {
        uint64_t v19 = &v17;
        uint64_t v10 = (uint64_t (*)(uint64_t *, uint64_t))MEMORY[0x270FA5388](v31);
        uint64_t v15 = v30;
        uint64_t v16 = &v40;
        sub_20ACD05A8(v10, (uint64_t)v13, v11);
        return (uint64_t)v19;
      }
      v13[0] = 2;
      uint64_t v14 = 148;
      LODWORD(v15) = 0;
      sub_20ACD5340();
      __break(1u);
    }
    v13[0] = 2;
    uint64_t v14 = 3455;
    LODWORD(v15) = 0;
    sub_20ACD5340();
    __break(1u);
  }
  if (v24) {
    uint64_t v47 = v24;
  }
  else {
    uint64_t v47 = 0;
  }
  uint64_t v18 = v47;
  if (!v47)
  {
    v13[0] = 2;
    uint64_t v14 = 136;
    LODWORD(v15) = 0;
    sub_20ACD5340();
    __break(1u);
  }
  if (v25 >= 0) {
    return sub_20ACD10CC(v18, v25, v26, v27, v22, v23, v28, v29);
  }
  uint64_t result = sub_20ACD5370();
  __break(1u);
  return result;
}

uint64_t sub_20ACD10CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  if (!a3)
  {
    sub_20ACD5340();
    __break(1u);
  }
  if (a4 >= (uint64_t)0xFFFFFFFF80000000)
  {
    if (a4 <= 0x7FFFFFFF)
    {
      if (!a5)
      {
        sub_20ACD5340();
        __break(1u);
      }
      if (a6 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (a6 <= 0x7FFFFFFF)
        {
          if (!a1)
          {
            sub_20ACD5340();
            __break(1u);
          }
          if (a2 >= (uint64_t)0xFFFFFFFF80000000)
          {
            if (a2 <= 0x7FFFFFFF)
            {
              if (a7 <= 0xFFFFFFFF)
              {
                if (a8 <= 0xFFFFFFFF) {
                  return _swift_stdlib_reportUnimplementedInitializerInFile();
                }
                sub_20ACD5340();
                __break(1u);
              }
              sub_20ACD5340();
              __break(1u);
            }
            sub_20ACD5340();
            __break(1u);
          }
          sub_20ACD5340();
          __break(1u);
        }
        sub_20ACD5340();
        __break(1u);
      }
      sub_20ACD5340();
      __break(1u);
    }
    sub_20ACD5340();
    __break(1u);
  }
  uint64_t result = sub_20ACD5340();
  __break(1u);
  return result;
}

uint64_t sub_20ACD1618(uint64_t (*a1)(void))
{
  return a1();
}

void *sub_20ACD1640(void *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4();
  sub_20ACD16C4(v4, v5, a3);
  uint64_t v8 = *a1;
  sub_20ACD5290();
  swift_bridgeObjectRelease();
  uint64_t result = a1;
  *a1 = v8 + 8;
  return result;
}

uint64_t sub_20ACD16C4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v14 = sub_20ACD1838((uint64_t)&v17, 0, 0, 1, a1, a2);
  uint64_t v15 = v3;
  __int16 v16 = v4;
  uint64_t v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType();
    v12[0] = v14;
    uint64_t v6 = *a3;
    if (*a3)
    {
      sub_20ACBFB30((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  }
  else
  {
    v13[3] = MEMORY[0x263F8DBE0];
    v13[0] = a1;
    v13[1] = a2;
    uint64_t v7 = *a3;
    if (*a3)
    {
      sub_20ACBFB30((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  }
  return v11;
}

uint64_t sub_20ACD1838(uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = (void *)result;
  uint64_t v24 = a6;
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3) {
          __break(1u);
        }
        int64_t v16 = a3 - (void)a2;
      }
      else
      {
        int64_t v16 = 0;
      }
      int64_t v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v21[0] = a5;
          v21[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          sub_20ACD1BB0(v21, v15, a2);
          sub_20ACD52A0();
          *uint64_t v17 = a2;
          uint64_t v11 = 0;
          uint64_t v12 = v15;
          char v13 = 1;
          char v14 = 0;
LABEL_26:
          v21[2] = v11;
          v21[3] = v12;
          char v22 = v13 & 1;
          char v23 = v14 & 1;
          return (uint64_t)v11;
        }
        goto LABEL_28;
      }
    }
LABEL_13:
    uint64_t v6 = sub_20ACD1BF0(a5, a6);
    *uint64_t v17 = v7;
    uint64_t v11 = v6;
    uint64_t v12 = v8;
    char v13 = 0;
    char v14 = 1;
    goto LABEL_26;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0)
    {
      uint64_t v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }
    __break(1u);
  }
  uint64_t result = sub_20ACD52E0();
  if (!result) {
    goto LABEL_29;
  }
  uint64_t v10 = result;
LABEL_21:
  *uint64_t v17 = v10;
  if (a6 < 0)
  {
    uint64_t v9 = 0;
LABEL_25:
    uint64_t v11 = (void *)v9;
    uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL;
    char v13 = 0;
    char v14 = 0;
    goto LABEL_26;
  }
  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain();
    uint64_t v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *sub_20ACD1BB0(const void *a1, size_t a2, void *__dst)
{
  return __dst;
}

void *sub_20ACD1BF0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = sub_20ACD1CA4(a1, a2);
  sub_20ACD1E20();
  uint64_t v4 = v6[2];
  sub_20ACD1E98(v4);
  sub_20ACD1F1C(v4, 0);
  sub_20ACD1F8C();
  swift_retain();
  uint64_t v5 = sub_20ACD1F98((uint64_t)v6);
  swift_bridgeObjectRelease();
  uint64_t result = (void *)v5;
  if (!__OFSUB__(v5, 1)) {
    return v6;
  }
  __break(1u);
  return result;
}

void *sub_20ACD1CA4(uint64_t a1, uint64_t a2)
{
  v8[2] = a2;
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = sub_20ACD5040();
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    uint64_t v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }
  else
  {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v7) {
    return (void *)sub_20ACD211C();
  }
  uint64_t v5 = sub_20ACD1FB0(v7, 0);
  swift_retain();
  swift_release();
  uint64_t result = (void *)sub_20ACD52D0();
  uint64_t v6 = result;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t result = v8;
    v8[0] = 0;
    v8[1] = 0xE000000000000000;
    sub_20ACD4914();
    if (v6 == (void *)v7) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_20ACD1E20()
{
  uint64_t v4 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v0 = v4;
  if ((result & 1) == 0)
  {
    uint64_t v2 = sub_20ACD1F98(*v3);
    uint64_t result = sub_20ACD214C(0, v2 + 1, 1, *v3);
    *char v3 = result;
  }
  return result;
}

uint64_t sub_20ACD1E98(uint64_t result)
{
  if (*(void *)(*(void *)v1 + 24) >> 1 < result + 1)
  {
    uint64_t result = sub_20ACD214C(*(void *)(*(void *)v1 + 24) >> 1 != 0, result + 1, 1, *v2);
    *uint64_t v2 = result;
  }
  return result;
}

uint64_t sub_20ACD1F1C(uint64_t a1, char a2)
{
  uint64_t v5 = a1 + 1;
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  *(void *)(v4 + 16) = v5;
  swift_release();
  uint64_t v6 = *v2;
  swift_retain();
  *(unsigned char *)(v6 + 32 + a1) = a2;
  return swift_release();
}

void sub_20ACD1F8C()
{
  void *v0 = *v0;
}

uint64_t sub_20ACD1F98(uint64_t a1)
{
  return sub_20ACD244C(a1);
}

void *sub_20ACD1FB0(uint64_t a1, uint64_t a2)
{
  if (a2 < a1) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = a2;
  }
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267681148);
    uint64_t v6 = (void *)swift_allocObject();
    if (_swift_stdlib_has_malloc_size())
    {
      size_t v4 = (size_t)v6 + _swift_stdlib_malloc_size(v6);
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * (v4 - (void)(v6 + 4));
    }
    else
    {
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * v7;
    }
    swift_release();
    return v6;
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    swift_retain();
    return (void *)v3;
  }
}

uint64_t sub_20ACD211C()
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  swift_retain();
  return v1;
}

uint64_t sub_20ACD214C(char a1, uint64_t a2, char a3, uint64_t a4)
{
  swift_retain();
  uint64_t result = swift_retain();
  uint64_t v16 = *(void *)(a4 + 24) >> 1;
  if (a3)
  {
    if (v16 < a2)
    {
      if ((unsigned __int128)(v16 * (__int128)2) >> 64 != (2 * v16) >> 63)
      {
        __break(1u);
        return result;
      }
      if (2 * v16 < a2) {
        uint64_t v11 = a2;
      }
      else {
        uint64_t v11 = 2 * v16;
      }
    }
    else
    {
      uint64_t v11 = *(void *)(a4 + 24) >> 1;
    }
  }
  else
  {
    uint64_t v11 = a2;
  }
  int64_t v10 = *(void *)(a4 + 16);
  if (v11 < v10) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v11;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267681148);
    uint64_t v8 = (void *)swift_allocObject();
    if (_swift_stdlib_has_malloc_size())
    {
      size_t v6 = (size_t)v8 + _swift_stdlib_malloc_size(v8);
      swift_retain();
      v8[2] = v10;
      void v8[3] = 2 * (v6 - (void)(v8 + 4));
    }
    else
    {
      swift_retain();
      v8[2] = v10;
      void v8[3] = 2 * v9;
    }
    swift_release();
    uint64_t v7 = (char *)v8;
  }
  else
  {
    uint64_t v5 = (char *)MEMORY[0x263F8EE78];
    swift_retain();
    uint64_t v7 = v5;
  }
  if (a1)
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_20ACD248C((char *)(a4 + 32), v10, v7 + 32);
    *(void *)(a4 + 16) = 0;
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_retain();
    swift_release();
    sub_20ACD2454((const void *)(a4 + 32), v10, v7 + 32);
    swift_unknownObjectRelease();
  }
  return (uint64_t)v7;
}

uint64_t sub_20ACD244C(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void *sub_20ACD2454(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *sub_20ACD248C(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result) {
    return (char *)memmove(a3, result, a2);
  }
  return result;
}

unsigned char **sub_20ACD2540(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  size_t v4 = *result;
  *size_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_20ACD2554()
{
  return swift_deallocObject();
}

unsigned char **sub_20ACD2580(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_20ACD2540(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_20ACD2588()
{
  return swift_deallocObject();
}

unsigned char **sub_20ACD25B4(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_20ACD2540(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_20ACD25BC()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD25FC()
{
  return sub_20ACD1618(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_20ACD2608()
{
  return swift_deallocObject();
}

void *sub_20ACD2648(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_20ACD1640(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t type metadata accessor for AMDVectorDBManager()
{
  return self;
}

uint64_t sub_20ACD267C()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD26BC()
{
  uint64_t result = *(void *)(v0 + 16);
  sub_20ACC53B0();
  return result;
}

uint64_t sub_20ACD26C8()
{
  return swift_deallocObject();
}

unsigned char **sub_20ACD26F4(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_20ACD2540(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_20ACD26FC()
{
  return swift_deallocObject();
}

unsigned char **sub_20ACD2728(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_20ACD2540(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_20ACD2730()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD2770()
{
  return sub_20ACD1618(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_20ACD277C()
{
  return swift_deallocObject();
}

void *sub_20ACD27BC(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_20ACD1640(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

unint64_t sub_20ACD27C8()
{
  uint64_t v2 = qword_26ACA0B20;
  if (!qword_26ACA0B20)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_26ACA0B20);
    return ObjCClassMetadata;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACD2830()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACD285C()
{
}

uint64_t sub_20ACD289C()
{
  return swift_release();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACD28E0()
{
}

uint64_t sub_20ACD290C()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD2938()
{
  return nullsub_1(*(void *)(v0 + 16));
}

uint64_t sub_20ACD2940()
{
  return swift_deallocObject();
}

unsigned char **sub_20ACD296C(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_20ACD2540(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_20ACD2974()
{
  return swift_deallocObject();
}

unsigned char **sub_20ACD29A0(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_20ACD2540(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_20ACD29A8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v17 = a1;
  uint64_t v21 = a6;
  v13[1] = a7;
  char v14 = sub_20ACD48B0;
  uint64_t v25 = a6;
  uint64_t v18 = *(void *)(a6 - 8);
  uint64_t v19 = a6 - 8;
  v13[0] = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  uint64_t v20 = (uint64_t)v13 - v13[0];
  v8(v7);
  uint64_t v16 = sub_20ACD5310() >> 3;
  uint64_t v23 = *v17;
  uint64_t v24 = v23 + v16;
  sub_20ACD2B38(v20, v14, (uint64_t)v22, v21, MEMORY[0x263F8E628], MEMORY[0x263F8EE60] + 8, MEMORY[0x263F8E658], v15);
  uint64_t v9 = v18;
  uint64_t v10 = v20;
  uint64_t v11 = v21;
  *v17 += v16;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
}

uint64_t sub_20ACD2B10()
{
  return sub_20ACD5290();
}

uint64_t sub_20ACD2B38(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v17 = a2;
  uint64_t v12 = a5;
  uint64_t v13 = a8;
  uint64_t v23 = a4;
  uint64_t v22 = a5;
  uint64_t v21 = a6;
  uint64_t v14 = *(void *)(a5 - 8);
  uint64_t v15 = a5 - 8;
  unint64_t v16 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x270FA5388]();
  uint64_t v18 = (char *)&v12 - v16;
  uint64_t v20 = v9 + *(void *)(*(void *)(v10 - 8) + 64);
  uint64_t result = v17();
  uint64_t v19 = v8;
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(v13, v18, v12);
  }
  return result;
}

uint64_t sub_20ACD2C68@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_20ACD2CA4()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD2CE4@<X0>(uint64_t *a1@<X8>)
{
  return sub_20ACD2C68(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_20ACD2CF0()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD2D30(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = sub_20ACC1CBC();
  uint64_t v5 = MEMORY[0x263F8E5C0];

  return sub_20ACD29A8(a1, a2, a3, v9, v10, v5, v4);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACD2DA4()
{
}

unint64_t sub_20ACD2DD0()
{
  uint64_t v2 = qword_2676810D8;
  if (!qword_2676810D8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2676810D8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_20ACD2E4C()
{
  uint64_t v2 = qword_2676810E0;
  if (!qword_2676810E0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2676810E0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_20ACD2EC8()
{
  uint64_t v2 = qword_2676810E8;
  if (!qword_2676810E8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2676810E8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_20ACD2F44(uint64_t a1, unint64_t a2)
{
  if (((a2 >> 62) & 3) == 1) {
    return swift_release();
  }
  if (((a2 >> 62) & 3) == 2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_20ACD2FD0()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD2FFC()
{
  return nullsub_2(*(void *)(v0 + 16));
}

uint64_t sub_20ACD3004()
{
  return swift_deallocObject();
}

unsigned char **sub_20ACD3030(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_20ACD2540(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_20ACD3038()
{
  return swift_deallocObject();
}

unsigned char **sub_20ACD3064(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_20ACD2540(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_20ACD306C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_20ACD30A8()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD30E8@<X0>(uint64_t *a1@<X8>)
{
  return sub_20ACD306C(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_20ACD30F4()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD3134(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = sub_20ACD2DD0();
  uint64_t v5 = MEMORY[0x263F8D6C8];

  return sub_20ACD29A8(a1, a2, a3, v9, v10, v5, v4);
}

unint64_t sub_20ACD31A8()
{
  uint64_t v2 = qword_2676810F8;
  if (!qword_2676810F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2676810F0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2676810F8);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACD322C()
{
}

uint64_t sub_20ACD3258(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_20ACD03D0(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_20ACD3288()
{
  uint64_t v2 = qword_267681118;
  if (!qword_267681118)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267681110);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267681118);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_20ACD330C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_20ACD03D0(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_20ACD333C()
{
  uint64_t v2 = *(void *)(sub_20ACD49D0() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t sub_20ACD3408@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_20ACD49D0();
  uint64_t v3 = v1
     + ((*(unsigned __int8 *)(*(void *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2 - 8) + 80));

  return sub_20ACC8F24(v3, a1);
}

uint64_t sub_20ACD3480()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD34C0()
{
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = sub_20ACD49D0();
  unint64_t v1 = sub_20ACD351C();

  return sub_20ACD048C(v5, v3, v4, v1);
}

unint64_t sub_20ACD351C()
{
  uint64_t v2 = qword_26ACA0BB8;
  if (!qword_26ACA0BB8)
  {
    sub_20ACD49D0();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26ACA0BB8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_20ACD35A0()
{
  return swift_deallocObject();
}

unsigned char **sub_20ACD35CC(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_20ACD2540(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_20ACD35D4()
{
  return swift_deallocObject();
}

unsigned char **sub_20ACD3600(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_20ACD2540(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_20ACD3608()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD3648()
{
  return sub_20ACD1618(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_20ACD3654()
{
  return swift_deallocObject();
}

void *sub_20ACD3694(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_20ACD1640(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_20ACD36A0()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD36E0@<X0>(void *a1@<X8>)
{
  return sub_20ACCAB78(*(void *)(v1 + 16), a1);
}

uint64_t sub_20ACD36E8()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD3728()
{
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0B38);
  unint64_t v1 = sub_20ACD3788();

  return sub_20ACD048C(v5, v3, v4, v1);
}

unint64_t sub_20ACD3788()
{
  uint64_t v2 = qword_267681120;
  if (!qword_267681120)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACA0B38);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267681120);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_20ACD380C()
{
  return swift_deallocObject();
}

unsigned char **sub_20ACD3838(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_20ACD2540(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_20ACD3840()
{
  return swift_deallocObject();
}

unsigned char **sub_20ACD386C(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_20ACD2540(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_20ACD3874()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD38B4()
{
  return sub_20ACD1618(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_20ACD38C0()
{
  return swift_deallocObject();
}

void *sub_20ACD3900(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_20ACD1640(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_20ACD390C()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD394C@<X0>(void *a1@<X8>)
{
  return sub_20ACCABAC(*(void *)(v1 + 16), a1);
}

uint64_t sub_20ACD3954()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD3994()
{
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACA0C50);
  unint64_t v1 = sub_20ACD39F4();

  return sub_20ACD048C(v5, v3, v4, v1);
}

unint64_t sub_20ACD39F4()
{
  uint64_t v2 = qword_267681128;
  if (!qword_267681128)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACA0C50);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267681128);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_20ACD3A78()
{
  return swift_deallocObject();
}

unsigned char **sub_20ACD3AA4(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_20ACD2540(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_20ACD3AAC()
{
  return swift_deallocObject();
}

unsigned char **sub_20ACD3AD8(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_20ACD2540(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_20ACD3AE0()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD3B20()
{
  return sub_20ACD1618(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_20ACD3B2C()
{
  return swift_deallocObject();
}

void *sub_20ACD3B6C(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_20ACD1640(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

unint64_t sub_20ACD3B78()
{
  uint64_t v2 = qword_26ACA0C80;
  if (!qword_26ACA0C80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACA0C78);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26ACA0C80);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACD3BFC()
{
}

uint64_t sub_20ACD3C28()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD3C68()
{
  uint64_t result = *(void *)(v0 + 16);
  sub_20ACCFDA8();
  return result;
}

uint64_t sub_20ACD3C74()
{
  return swift_deallocObject();
}

unsigned char **sub_20ACD3CA0(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_20ACD2540(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_20ACD3CA8()
{
  return swift_deallocObject();
}

unsigned char **sub_20ACD3CD4(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_20ACD2540(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_20ACD3CDC()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD3D1C()
{
  return sub_20ACD1618(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_20ACD3D28()
{
  return swift_deallocObject();
}

void *sub_20ACD3D68(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_20ACD1640(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

unint64_t sub_20ACD3D74()
{
  uint64_t v2 = qword_26ACA0CE8;
  if (!qword_26ACA0CE8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26ACA0CE8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_20ACD3DF0()
{
  uint64_t v2 = qword_26ACA0CE0;
  if (!qword_26ACA0CE0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26ACA0CE0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_20ACD3E6C()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD3EAC()
{
  uint64_t result = *(void *)(v0 + 16);
  sub_20ACCFDDC();
  return result;
}

uint64_t sub_20ACD3EB8()
{
  return swift_deallocObject();
}

unsigned char **sub_20ACD3EE4(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_20ACD2540(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_20ACD3EEC()
{
  return swift_deallocObject();
}

unsigned char **sub_20ACD3F18(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_20ACD2540(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_20ACD3F20()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD3F60()
{
  return sub_20ACD1618(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_20ACD3F6C()
{
  return swift_deallocObject();
}

void *sub_20ACD3FAC(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_20ACD1640(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_20ACD3FB8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_20ACD03D0(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_20ACD3FE8()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD4028()
{
  uint64_t result = *(void *)(v0 + 16);
  sub_20ACCFD74();
  return result;
}

uint64_t sub_20ACD4034()
{
  return swift_deallocObject();
}

unsigned char **sub_20ACD4060(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_20ACD2540(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_20ACD4068()
{
  return swift_deallocObject();
}

unsigned char **sub_20ACD4094(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_20ACD2540(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_20ACD409C()
{
  return swift_deallocObject();
}

uint64_t sub_20ACD40DC()
{
  return sub_20ACD1618(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_20ACD40E8()
{
  return swift_deallocObject();
}

void *sub_20ACD4128(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_20ACD1640(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

unint64_t sub_20ACD4134()
{
  return sub_20ACD414C();
}

unint64_t sub_20ACD414C()
{
  uint64_t v2 = qword_267681140;
  if (!qword_267681140)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267681140);
    return WitnessTable;
  }
  return v2;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_20ACD41DC(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFC) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 3) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 252;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 4;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_20ACD438C(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFC)
  {
    unsigned int v5 = ((a3 + 3) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFC)
  {
    unsigned int v4 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 3;
    }
  }
  return result;
}

uint64_t sub_20ACD45D0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_20ACD45DC(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

void *type metadata accessor for VectorDBError()
{
  return &unk_26BEAC388;
}

uint64_t method lookup function for AMDVectorDBManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AMDVectorDBManager.__allocating_init(vectorDBConfig:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of AMDVectorDBManager.insertVectors(vectorDict:)()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x60))();
}

uint64_t dispatch thunk of AMDVectorDBManager.searchVectorDB(queryDict:)()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x68))();
}

uint64_t dispatch thunk of AMDVectorDBManager.deleteVectors(identifiers:)()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x70))();
}

uint64_t dispatch thunk of static AMDVectorDBManager.deleteVectorDatabase(deletionPayload:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of static AMDVectorDBManager.insertVectorsHandler(insertVectorsPayload:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of static AMDVectorDBManager.clearVectorsHandler(clearVectorDBPayload:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of static AMDVectorDBManager.runVectorDBSearch(searchPayload:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of static AMDVectorDBManager.createVectorDB(createDBPayload:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t sub_20ACD47F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_20ACD0CF4(a1, a2, *(void *)(v3 + 16), *(void *)(v3 + 24), *(unsigned char *)(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 48), *(void *)(v3 + 56), a3, *(void *)(v3 + 64));
}

uint64_t sub_20ACD483C(uint64_t a1, uint64_t a2)
{
  return sub_20ACD0570(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_20ACD4868(uint64_t a1, uint64_t a2)
{
  return sub_20ACD10CC(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56));
}

uint64_t sub_20ACD4884(uint64_t a1, uint64_t a2)
{
  return sub_20ACD0570(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_20ACD48B0()
{
  return sub_20ACD2B10();
}

uint64_t _swift_stdlib_has_malloc_size()
{
  return 1;
}

size_t _swift_stdlib_malloc_size(const void *a1)
{
  return malloc_size(a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20ACD4914()
{
}

uint64_t sub_20ACD4940()
{
  return MEMORY[0x270EEE848]();
}

uint64_t sub_20ACD4950()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_20ACD4960()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_20ACD4970()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_20ACD4980()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_20ACD4990()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_20ACD49A0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_20ACD49B0()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_20ACD49C0()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_20ACD49D0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_20ACD49E0()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_20ACD49F0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_20ACD4A00()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_20ACD4A10()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_20ACD4A20()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_20ACD4A30()
{
  return MEMORY[0x270F5F240]();
}

uint64_t sub_20ACD4A40()
{
  return MEMORY[0x270F5F360]();
}

uint64_t sub_20ACD4A50()
{
  return MEMORY[0x270F5F380]();
}

uint64_t sub_20ACD4A60()
{
  return MEMORY[0x270F5F560]();
}

uint64_t sub_20ACD4A70()
{
  return MEMORY[0x270F5F590]();
}

uint64_t sub_20ACD4A80()
{
  return MEMORY[0x270F5FA38]();
}

uint64_t sub_20ACD4A90()
{
  return MEMORY[0x270F5FED0]();
}

uint64_t sub_20ACD4AA0()
{
  return MEMORY[0x270F5FEF8]();
}

uint64_t sub_20ACD4AB0()
{
  return MEMORY[0x270F602E8]();
}

uint64_t sub_20ACD4AC0()
{
  return MEMORY[0x270F60348]();
}

uint64_t sub_20ACD4AD0()
{
  return MEMORY[0x270F607B0]();
}

uint64_t sub_20ACD4AE0()
{
  return MEMORY[0x270F607B8]();
}

uint64_t sub_20ACD4AF0()
{
  return MEMORY[0x270F607C0]();
}

uint64_t sub_20ACD4B00()
{
  return MEMORY[0x270F607C8]();
}

uint64_t sub_20ACD4B10()
{
  return MEMORY[0x270F60B78]();
}

uint64_t sub_20ACD4B20()
{
  return MEMORY[0x270F60B80]();
}

uint64_t sub_20ACD4B30()
{
  return MEMORY[0x270F60B88]();
}

uint64_t sub_20ACD4B40()
{
  return MEMORY[0x270F60B90]();
}

uint64_t sub_20ACD4B50()
{
  return MEMORY[0x270F60B98]();
}

uint64_t sub_20ACD4B60()
{
  return MEMORY[0x270F60BA0]();
}

uint64_t sub_20ACD4B70()
{
  return MEMORY[0x270F60BA8]();
}

uint64_t sub_20ACD4B80()
{
  return MEMORY[0x270F60BB0]();
}

uint64_t sub_20ACD4B90()
{
  return MEMORY[0x270F60BB8]();
}

uint64_t sub_20ACD4BA0()
{
  return MEMORY[0x270F60BC0]();
}

uint64_t sub_20ACD4BB0()
{
  return MEMORY[0x270F60BC8]();
}

uint64_t sub_20ACD4BC0()
{
  return MEMORY[0x270F60BD0]();
}

uint64_t sub_20ACD4BD0()
{
  return MEMORY[0x270F60BD8]();
}

uint64_t sub_20ACD4BE0()
{
  return MEMORY[0x270F60BE0]();
}

uint64_t sub_20ACD4BF0()
{
  return MEMORY[0x270F60BE8]();
}

uint64_t sub_20ACD4C00()
{
  return MEMORY[0x270F60BF0]();
}

uint64_t sub_20ACD4C10()
{
  return MEMORY[0x270F60BF8]();
}

uint64_t sub_20ACD4C20()
{
  return MEMORY[0x270F60C00]();
}

uint64_t sub_20ACD4C30()
{
  return MEMORY[0x270F60C08]();
}

uint64_t sub_20ACD4C40()
{
  return MEMORY[0x270F60C10]();
}

uint64_t sub_20ACD4C50()
{
  return MEMORY[0x270F60C18]();
}

uint64_t sub_20ACD4C60()
{
  return MEMORY[0x270F60C20]();
}

uint64_t sub_20ACD4C70()
{
  return MEMORY[0x270F60C28]();
}

uint64_t sub_20ACD4C80()
{
  return MEMORY[0x270F60C30]();
}

uint64_t sub_20ACD4C90()
{
  return MEMORY[0x270F60C38]();
}

uint64_t sub_20ACD4CA0()
{
  return MEMORY[0x270F60C40]();
}

uint64_t sub_20ACD4CB0()
{
  return MEMORY[0x270F60C48]();
}

uint64_t sub_20ACD4CC0()
{
  return MEMORY[0x270F60C50]();
}

uint64_t sub_20ACD4CD0()
{
  return MEMORY[0x270F60E30]();
}

uint64_t sub_20ACD4CE0()
{
  return MEMORY[0x270F60E50]();
}

uint64_t sub_20ACD4CF0()
{
  return MEMORY[0x270F61850]();
}

uint64_t sub_20ACD4D10()
{
  return MEMORY[0x270F83A48]();
}

uint64_t sub_20ACD4D20()
{
  return MEMORY[0x270F83A50]();
}

uint64_t sub_20ACD4D30()
{
  return MEMORY[0x270F83A68]();
}

uint64_t sub_20ACD4D40()
{
  return MEMORY[0x270F83A70]();
}

uint64_t sub_20ACD4D50()
{
  return MEMORY[0x270F83A78]();
}

uint64_t sub_20ACD4D60()
{
  return MEMORY[0x270F83AB0]();
}

uint64_t sub_20ACD4D70()
{
  return MEMORY[0x270F83AB8]();
}

uint64_t sub_20ACD4D80()
{
  return MEMORY[0x270F83AC0]();
}

uint64_t sub_20ACD4D90()
{
  return MEMORY[0x270F83AD0]();
}

uint64_t sub_20ACD4DA0()
{
  return MEMORY[0x270F83AD8]();
}

uint64_t sub_20ACD4DB0()
{
  return MEMORY[0x270F83B20]();
}

uint64_t sub_20ACD4DC0()
{
  return MEMORY[0x270F83B30]();
}

uint64_t sub_20ACD4DD0()
{
  return MEMORY[0x270F83B38]();
}

uint64_t sub_20ACD4DE0()
{
  return MEMORY[0x270F83B58]();
}

uint64_t sub_20ACD4DF0()
{
  return MEMORY[0x270F83B60]();
}

uint64_t sub_20ACD4E00()
{
  return MEMORY[0x270F83B70]();
}

uint64_t sub_20ACD4E10()
{
  return MEMORY[0x270F83B78]();
}

uint64_t sub_20ACD4E20()
{
  return MEMORY[0x270F83B98]();
}

uint64_t sub_20ACD4E30()
{
  return MEMORY[0x270F83BC8]();
}

uint64_t sub_20ACD4E40()
{
  return MEMORY[0x270F83C08]();
}

uint64_t sub_20ACD4E50()
{
  return MEMORY[0x270F5DA58]();
}

uint64_t sub_20ACD4E60()
{
  return MEMORY[0x270F5DA68]();
}

uint64_t sub_20ACD4E70()
{
  return MEMORY[0x270F5DA70]();
}

uint64_t sub_20ACD4E80()
{
  return MEMORY[0x270F5DA78]();
}

uint64_t sub_20ACD4EA0()
{
  return MEMORY[0x270F5DA90]();
}

uint64_t sub_20ACD4EB0()
{
  return MEMORY[0x270F5DA98]();
}

uint64_t sub_20ACD4EC0()
{
  return MEMORY[0x270F5DAA0]();
}

uint64_t sub_20ACD4ED0()
{
  return MEMORY[0x270F5E3A0]();
}

uint64_t sub_20ACD4EE0()
{
  return MEMORY[0x270F5E3A8]();
}

uint64_t sub_20ACD4EF0()
{
  return MEMORY[0x270F5E3D0]();
}

uint64_t sub_20ACD4F00()
{
  return MEMORY[0x270F5E9D8]();
}

uint64_t sub_20ACD4F10()
{
  return MEMORY[0x270F5E9E0]();
}

uint64_t sub_20ACD4F20()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_20ACD4F30()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_20ACD4F40()
{
  return MEMORY[0x270FA2E18]();
}

uint64_t sub_20ACD4F50()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_20ACD4F60()
{
  return MEMORY[0x270F9CFD0]();
}

uint64_t sub_20ACD4F70()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_20ACD4F80()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_20ACD4F90()
{
  return MEMORY[0x270F9D080]();
}

uint64_t sub_20ACD4FA0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_20ACD4FB0()
{
  return MEMORY[0x270F9D178]();
}

uint64_t sub_20ACD4FC0()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_20ACD4FD0()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_20ACD4FE0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_20ACD4FF0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_20ACD5000()
{
  return MEMORY[0x270F9D6C0]();
}

uint64_t sub_20ACD5010()
{
  return MEMORY[0x270F9D6D8]();
}

uint64_t sub_20ACD5020()
{
  return MEMORY[0x270F9D6E8]();
}

uint64_t sub_20ACD5030()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_20ACD5040()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_20ACD5050()
{
  return MEMORY[0x270F9D8E8]();
}

uint64_t sub_20ACD5060()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_20ACD5070()
{
  return MEMORY[0x270F9DA18]();
}

uint64_t sub_20ACD5080()
{
  return MEMORY[0x270F9DA30]();
}

uint64_t sub_20ACD5090()
{
  return MEMORY[0x270F9DAE8]();
}

uint64_t sub_20ACD50A0()
{
  return MEMORY[0x270F9DAF0]();
}

uint64_t sub_20ACD50B0()
{
  return MEMORY[0x270F9DAF8]();
}

uint64_t sub_20ACD50C0()
{
  return MEMORY[0x270F9DB98]();
}

uint64_t sub_20ACD50D0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_20ACD50E0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_20ACD50F0()
{
  return MEMORY[0x270F83C10]();
}

uint64_t sub_20ACD5100()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_20ACD5110()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_20ACD5120()
{
  return MEMORY[0x270FA1428]();
}

uint64_t sub_20ACD5130()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_20ACD5140()
{
  return MEMORY[0x270FA1450]();
}

uint64_t sub_20ACD5150()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_20ACD5160()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_20ACD5170()
{
  return MEMORY[0x270FA14A8]();
}

uint64_t sub_20ACD5180()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_20ACD5190()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_20ACD51A0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_20ACD51B0()
{
  return MEMORY[0x270F62118]();
}

uint64_t sub_20ACD51C0()
{
  return MEMORY[0x270F9DD68]();
}

uint64_t sub_20ACD51D0()
{
  return MEMORY[0x270F9DD98]();
}

uint64_t sub_20ACD51E0()
{
  return MEMORY[0x270F9DEE8]();
}

uint64_t sub_20ACD51F0()
{
  return MEMORY[0x270F9DF78]();
}

uint64_t sub_20ACD5200()
{
  return MEMORY[0x270F9DFE8]();
}

uint64_t sub_20ACD5210()
{
  return MEMORY[0x270F9E1C8]();
}

uint64_t sub_20ACD5220()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_20ACD5230()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_20ACD5240()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_20ACD5250()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_20ACD5260()
{
  return MEMORY[0x270F9E358]();
}

uint64_t sub_20ACD5270()
{
  return MEMORY[0x270F9E378]();
}

uint64_t sub_20ACD5280()
{
  return MEMORY[0x270F9E398]();
}

uint64_t sub_20ACD5290()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_20ACD52A0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_20ACD52B0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_20ACD52C0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_20ACD52D0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_20ACD52E0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_20ACD52F0()
{
  return MEMORY[0x270F9ED68]();
}

uint64_t sub_20ACD5300()
{
  return MEMORY[0x270F9ED88]();
}

uint64_t sub_20ACD5310()
{
  return MEMORY[0x270F9EE10]();
}

uint64_t sub_20ACD5320()
{
  return MEMORY[0x270F9EEC0]();
}

uint64_t sub_20ACD5330()
{
  return MEMORY[0x270F9EEC8]();
}

uint64_t sub_20ACD5340()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_20ACD5350()
{
  return MEMORY[0x270F9EFF8]();
}

uint64_t sub_20ACD5360()
{
  return MEMORY[0x270F9F008]();
}

uint64_t sub_20ACD5370()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_20ACD5380()
{
  return MEMORY[0x270F9F0E8]();
}

uint64_t sub_20ACD5390()
{
  return MEMORY[0x270F9F228]();
}

uint64_t sub_20ACD53A0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_20ACD53B0()
{
  return MEMORY[0x270F9F750]();
}

uint64_t sub_20ACD53C0()
{
  return MEMORY[0x270F9F780]();
}

uint64_t sub_20ACD53D0()
{
  return MEMORY[0x270F9F788]();
}

uint64_t sub_20ACD53E0()
{
  return MEMORY[0x270F9F790]();
}

uint64_t sub_20ACD53F0()
{
  return MEMORY[0x270F9F7B8]();
}

uint64_t sub_20ACD5400()
{
  return MEMORY[0x270F9F940]();
}

uint64_t sub_20ACD5410()
{
  return MEMORY[0x270F9FA30]();
}

uint64_t sub_20ACD5420()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_20ACD5430()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_20ACD5440()
{
  return MEMORY[0x270FA0128]();
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x270F126B0]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x270F126C0]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x270F126C8]();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

SparseMatrix_Float *__cdecl _SparseConvertFromCoordinate_Float(SparseMatrix_Float *__return_ptr retstr, int m, int n, uint64_t nBlock, uint8_t blockSize, SparseAttributes_t attributes, const int *row, const int *col, const float *val, char *storage, int *workspace)
{
  return (SparseMatrix_Float *)MEMORY[0x270EDE1F8](retstr, *(void *)&m, *(void *)&n, nBlock, blockSize, *(void *)&attributes, row, col, val);
}

void _SparseSpMV_Float(float alpha, SparseMatrix_Float *A, DenseMatrix_Float *x, BOOL accumulate, DenseMatrix_Float *y)
{
}

void _SparseTrap(void)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __memset_chk()
{
  return MEMORY[0x270ED7E48]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x270ED7EA8](a1, a2, *(void *)&a3, a4, a5);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x270FA0168]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

void bzero(void *a1, size_t a2)
{
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x270F98F68](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F78](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x270F98F80](stream, *(void *)&flags);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x270F9C690](crc, buf, *(void *)&len);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270ED9BA0](a1, a2, a3, a4, *(void *)&a5);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B490](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x270F9B4A0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x270F9B4A8](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x270F9B4B0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x270F9B540](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B550](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x270F9B558](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x270F9B560](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x270F9B568](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B570](a1, *(void *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x270F9B590](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B598](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5A0](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5D0](a1, *(void *)&iCol);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x270F9B668](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B730](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x270FA2410]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x270FA04D0]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB868](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}