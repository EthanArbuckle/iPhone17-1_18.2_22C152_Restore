void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1DB8AE604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1DB8AF0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8AF86C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8AFCF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8AFE54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8AFF0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8B062C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t LoadDeviceNamed(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_unfair_lock_lock_with_options();
  v6 = (void *)dylib_handle;
  if (!dylib_handle)
  {
    v7 = dlopen("/System/Library/PrivateFrameworks/ANEServices.framework/ANEServices", 4);
    dylib_handle = (uint64_t)v7;
    v8 = dlerror();
    if (!v7) {
      printf("dlopen error: %s\n", v8);
    }
    v6 = (void *)dylib_handle;
    if (!dylib_handle)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&_sync_lock);
      return 4;
    }
  }
  if (!factory_function_deviceOpen)
  {
    factory_function_deviceOpen = dlsym(v6, "H11ANEDeviceOpen");
    v9 = dlerror();
    if (v9) {
      printf("dlsym err: %s\n", v9);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_sync_lock);
  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void))factory_function_deviceOpen;
  if (!factory_function_deviceOpen) {
    return 4;
  }
  return v10(a1, a2, a3, fDeviceCallback);
}

void sub_1DB8B0844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8B08EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

uint64_t OUTLINED_FUNCTION_6(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return v0;
}

void sub_1DB8B0BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8B0EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8B1268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1DB8B1BA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8B1CF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_1DB8B2ACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8B2B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1DB8B2EEC(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1DB8B2F9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ANEGetValidateNetworkSupportedVersion()
{
  uint64_t v0 = +[_ANEVirtualClient sharedConnection];

  if (v0)
  {
    v1 = +[_ANEVirtualClient sharedConnection];
    uint64_t v2 = [v1 getValidateNetworkVersion];
  }
  else if (+[_ANEDeviceInfo isVirtualMachine])
  {
    v3 = +[_ANELog framework];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ANEGetValidateNetworkSupportedVersion_cold_2(v3);
    }

    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = ANECGetValidateNetworkSupportedVersion();
  }
  v4 = +[_ANELog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    ANEGetValidateNetworkSupportedVersion_cold_1();
  }

  return v2;
}

void sub_1DB8B309C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *ANEValidateNetworkCreate(uint64_t a1, void *a2)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  v4 = +[_ANELog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    [a2 debugDescription];
    objc_claimAutoreleasedReturnValue();
    ANEValidateNetworkCreate_cold_5();
  }

  v5 = +[_ANEStrings vm_forceValidationOnGuestBootArg];
  BOOL v6 = +[_ANEDeviceInfo isBoolBootArgSetTrue:v5];

  if (v6)
  {
    v7 = +[_ANELog framework];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      +[_ANEStrings vm_forceValidationOnGuestBootArg];
      objc_claimAutoreleasedReturnValue();
      ANEValidateNetworkCreate_cold_4();
    }
  }
  v8 = +[_ANEVirtualClient sharedConnection];
  if (v8) {
    char v9 = v6;
  }
  else {
    char v9 = 1;
  }

  if (v9)
  {
    if (ANECGetValidateNetworkSupportedVersion() != a1)
    {
      uint64_t v10 = +[_ANELog framework];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        ANEValidateNetworkCreate_cold_2();
      }
    }
    v11 = NSString;
    uint64_t v12 = +[_ANEDeviceInfo aneSubType];
    v13 = +[_ANEDeviceInfo aneSubTypeVariant];
    v14 = +[_ANEDeviceInfo aneSubTypeProductVariant];
    v15 = [v11 stringWithFormat:@"%@%@%@", v12, v13, v14];

    CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a2, @"architecture");
    CFStringRef v17 = Value;
    if (Value && CFStringCompare(Value, v15, 0))
    {
      MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, (CFDictionaryRef)a2);
      CFDictionaryReplaceValue(MutableCopy, @"architecture", v15);
      v19 = MutableCopy;
      v20 = +[_ANELog framework];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v58 = [(__CFDictionary *)v19 debugDescription];
        *(_DWORD *)buffer = 136315906;
        *(void *)&buffer[4] = "ANEValidateNetworkCreate";
        __int16 v71 = 2112;
        CFStringRef v72 = v17;
        __int16 v73 = 2112;
        v74 = v15;
        __int16 v75 = 2112;
        v76 = v58;
        _os_log_debug_impl(&dword_1DB8AB000, v20, OS_LOG_TYPE_DEBUG, "%s: updating architecture from %@ to %@, inValidationParams: %@", buffer, 0x2Au);
      }
    }
    else
    {
      v19 = 0;
    }
    CFRelease(@"architecture");
    Mutable = (void *)ANECValidateNetworkCreate();
    if (v19) {
      CFRelease(v19);
    }

    goto LABEL_42;
  }
  *(void *)buffer = 0;
  CFDataRef v21 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a2, @"MIL");
  v78.length = CFDataGetLength(v21);
  v78.location = 0;
  CFDataGetBytes(v21, v78, buffer);
  v22 = [MEMORY[0x1E4F29128] UUID];
  v23 = [v22 UUIDString];

  v24 = NSString;
  v25 = +[_ANEStrings vm_tmpBaseDirectory];
  v26 = [v24 stringWithFormat:@"%@%@", v25, v23];

  v27 = NSString;
  v28 = +[_ANEStrings defaultMILFileName];
  id v60 = [v27 stringWithFormat:@"%@/%@", v26, v28];

  v29 = NSString;
  v30 = +[_ANEStrings defaultWeightFileName];
  id v59 = [v29 stringWithFormat:@"%@/%@", v26, v30];

  char v69 = 0;
  v31 = [MEMORY[0x1E4F28CB8] defaultManager];
  v32 = (MIL::Text::SerializerOptions *)[v31 fileExistsAtPath:v26 isDirectory:&v69];
  if (v32) {
    goto LABEL_23;
  }
  id v68 = 0;
  char v33 = [v31 createDirectoryAtPath:v26 withIntermediateDirectories:1 attributes:0 error:&v68];
  id v34 = v68;
  v35 = v34;
  if (v33)
  {

LABEL_23:
    MIL::Text::SerializerOptions::Make(&v67, v32);
    uint64_t v36 = v67;
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v60 cStringUsingEncoding:4]);
    (*(void (**)(uint64_t, void **))(*(void *)v36 + 24))(v36, __p);
    if (v66 < 0) {
      operator delete(__p[0]);
    }
    uint64_t v37 = v67;
    std::string::basic_string[abi:ne180100]<0>(v63, (char *)[v59 cStringUsingEncoding:4]);
    (*(void (**)(uint64_t, void **))(*(void *)v37 + 128))(v37, v63);
    if (v64 < 0) {
      operator delete(v63[0]);
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)v67 + 112))(v67, 4);
    uint64_t v38 = v67;
    id v39 = v26;
    std::string::basic_string[abi:ne180100]<0>(v61, (char *)[v39 cStringUsingEncoding:4]);
    (*(void (**)(uint64_t, void **))(*(void *)v38 + 56))(v38, v61);
    if (v62 < 0) {
      operator delete(v61[0]);
    }
    MIL::Text::SerializeToFile();
    v40 = (id)CFDictionaryGetValue((CFDictionaryRef)a2, @"function");
    CFDictionaryRef v41 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a2, @"parameters");
    v42 = (id)CFDictionaryGetValue(v41, @"scratchPadPath");
    v43 = +[_ANEVirtualClient sharedConnection];
    Mutable = (void *)[v43 validateNetworkCreate:a1 uuid:v23 function:v40 directoryPath:v39 scratchPadPath:v42];

    v45 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v46 = [v45 fileExistsAtPath:v39];

    if (v46)
    {
      v47 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v47 removeItemAtPath:v39 error:0];
    }
    uint64_t v48 = v67;
    uint64_t v67 = 0;
    if (v48) {
      (*(void (**)(uint64_t))(*(void *)v48 + 8))(v48);
    }
    char v49 = 1;
    goto LABEL_41;
  }
  v50 = +[_ANELog framework];
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
    ANEValidateNetworkCreate_cold_3((uint64_t)v35, v50);
  }

  char v49 = 0;
  Mutable = 0;
LABEL_41:

  if ((v49 & 1) == 0) {
    return 0;
  }
LABEL_42:
  if (!Mutable)
  {
    uint64_t v51 = ANEGetValidateNetworkSupportedVersion();
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v52 = [NSNumber numberWithLongLong:v51];
    [Mutable setValue:v52 forKey:@"resultsVersion"];

    v53 = objc_opt_new();
    [v53 setValue:MEMORY[0x1E4F1CC28] forKey:@"support"];
    v54 = +[_ANEVirtualClient sharedConnection];
    if (!v54) {
      BOOL v6 = 1;
    }

    if (v6) {
      v55 = @"Unable to get validationResult";
    }
    else {
      v55 = @"Unable to get validationResult (host might be too old)";
    }
    [v53 setValue:v55 forKey:@"errorMsg"];
    [Mutable setValue:v53 forKey:@"-1"];
  }
  v56 = +[_ANELog framework];
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
  {
    [Mutable debugDescription];
    objc_claimAutoreleasedReturnValue();
    ANEValidateNetworkCreate_cold_1();
  }

  return Mutable;
}

void sub_1DB8B38F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33)
{
  _Unwind_Resume(a1);
}

void *ANEValidateNetworkCreateVMHost(uint64_t a1, const void *a2, void *a3, const void *a4)
{
  v7 = a3;
  MIL::Text::SerializerOptions::Make(&v32, v7);
  v8 = (MIL::Opsets::Common *)(*(uint64_t (**)(uint64_t))(*(void *)v32 + 104))(v32);
  char v9 = (MIL::ParserOptions *)MIL::Opsets::Common::CreateMILContext(&v31, v8);
  MIL::ParserOptions::Make(&v30, v9);
  uint64_t v10 = v30;
  v11 = v7;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[(MIL::Text::SerializerOptions *)v11 cStringUsingEncoding:4]);
  (*(void (**)(uint64_t, void **, uint64_t))(*(void *)v10 + 32))(v10, __p, 1);
  if (v29 < 0) {
    operator delete(__p[0]);
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)v30 + 64))(v30, 1);
  (*(void (**)(uint64_t, MIL::Opsets::Common *))(*(void *)v30 + 96))(v30, v8);
  v26[1] = v31;
  if (v31) {
    operator new();
  }
  v26[2] = 0;
  uint64_t v31 = 0;
  MIL::Text::ParseProgramFromFile();
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  v13 = NSString;
  v14 = +[_ANEDeviceInfo aneSubType];
  v15 = +[_ANEDeviceInfo aneSubTypeVariant];
  v16 = +[_ANEDeviceInfo aneSubTypeProductVariant];
  CFStringRef v17 = [v13 stringWithFormat:@"%@%@%@", v14, v15, v16];

  CFDictionarySetValue(Mutable, @"architecture", v17);
  CFDictionarySetValue(Mutable, @"function", a2);
  v26[0] = v27;
  v18 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v26 length:8];
  CFDictionarySetValue(Mutable, @"MIL", v18);
  v19 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(v19, @"scratchPadPath", a4);
  CFDictionarySetValue(Mutable, @"parameters", v19);
  v20 = ANEValidateNetworkCreate(a1, Mutable);
  CFRelease(Mutable);
  CFRelease(v19);

  uint64_t v21 = v27;
  uint64_t v27 = 0;
  if (v21) {
    (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
  }
  uint64_t v22 = v30;
  uint64_t v30 = 0;
  if (v22) {
    (*(void (**)(uint64_t))(*(void *)v22 + 8))(v22);
  }
  uint64_t v23 = v31;
  uint64_t v31 = 0;
  if (v23) {
    (*(void (**)(uint64_t))(*(void *)v23 + 8))(v23);
  }
  uint64_t v24 = v32;
  uint64_t v32 = 0;
  if (v24) {
    (*(void (**)(uint64_t))(*(void *)v24 + 8))(v24);
  }

  return v20;
}

void sub_1DB8B3EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24)
{
  if (a23) {
    (*(void (**)(uint64_t))(*(void *)a23 + 8))(a23);
  }
  if (a24) {
    (*(void (**)(uint64_t))(*(void *)a24 + 8))(a24);
  }
  uint64_t v27 = *(void *)(v25 - 88);
  *(void *)(v25 - 88) = 0;
  if (v27) {
    (*(void (**)(uint64_t))(*(void *)v27 + 8))(v27);
  }

  _Unwind_Resume(a1);
}

void getANEDeviceProperties(__CFString const*)::{lambda(__CFDictionary const*,__CFDictionary const*)#1}::operator() const(__CFDictionary const*,__CFDictionary const*)::{lambda(void const*,void const*,void *)#1}::__invoke(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    BOOL v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    BOOL v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E6C1BFF0, MEMORY[0x1E4FBA1C8]);
}

void sub_1DB8B4158(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void std::__shared_ptr_pointer<MIL::MILContext  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1E01935F0);
}

uint64_t std::__shared_ptr_pointer<MIL::MILContext  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<MIL::MILContext  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t OUTLINED_FUNCTION_1_0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = result;
  return result;
}

void OUTLINED_FUNCTION_2_0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_1DB8B4808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8B4870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)_ANEProgramForEvaluation;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_1DB8B495C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8B4B48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8B5A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  _Block_object_dispose(&STACK[0x1130], 8);
  _Block_object_dispose(&STACK[0x1150], 8);
  _Block_object_dispose(&STACK[0x1170], 8);

  _Unwind_Resume(a1);
}

void sub_1DB8B6220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ANEProgramRequestSharedEventsStruct::~ANEProgramRequestSharedEventsStruct(ANEProgramRequestSharedEventsStruct *this)
{
  for (uint64_t i = 4072; i != 2024; i -= 32)

  do
  {

    i -= 32;
  }
  while (i != -24);
}

void sub_1DB8B657C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8B6A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_1(uint64_t result, char a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = a2 & 1;
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1DB8B8C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_6_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_1DB8BD534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8BD59C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)_ANEProgramIOSurfacesMapper;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1DB8BD908(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8BDBF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DB8BDFA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);

  _Unwind_Resume(a1);
}

void sub_1DB8BE1D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8BE524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);

  _Unwind_Resume(a1);
}

void sub_1DB8BE714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_6_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_7_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void sub_1DB8C2CB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8C2D90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8C3088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8C320C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8C3340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8C34F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8C3B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1DB8C446C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8C5204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,uint64_t a23,uint64_t a24,void *a25)
{
  _Unwind_Resume(a1);
}

void aneserializers::anemodelnewinstanceparams_v1::_ANEProcedureDataSerializerDeserializer::addWeight(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
}

void sub_1DB8C55E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
  _Unwind_Resume(a1);
}

__IOSurface *aneserializers::anemodelnewinstanceparams_v1::_ANEModelInstanceParametersSerializerDeserializer::addProcedure(uint64_t a1, uint64_t *a2)
{
  *(void *)(a1 + 8 * *(unsigned int *)(a1 + 32) + 40) = a2;
  uint64_t result = *(__IOSurface **)(*(void *)(a1 + 16) + 8);
  if (result) {
    uint64_t result = (__IOSurface *)IOSurfaceGetBaseAddress(result);
  }
  if (*(_DWORD *)a1) {
    uint64_t v5 = (char *)result + *(unsigned int *)(a1 + 4);
  }
  else {
    uint64_t v5 = 0;
  }
  int v6 = *(_DWORD *)(a1 + 32);
  *(_DWORD *)(a1 + 32) = v6 + 1;
  uint64_t v7 = &v5[12 * v6];
  uint64_t v8 = *a2;
  *((_DWORD *)v7 + 2) = *((_DWORD *)a2 + 2);
  *(void *)uint64_t v7 = v8;
  return result;
}

void sub_1DB8C5FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1DB8C6630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Block_object_dispose((const void *)(v17 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1DB8C68A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8C6B08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8C954C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_1DB8C9EA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8CA200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8CA62C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8CA9A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8CAAA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8CAB6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8CAE44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8CAFFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8CB698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1DB8CB918(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8CBC08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8CC018(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v3 - 96), 8);

  _Unwind_Resume(a1);
}

void sub_1DB8CC0D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8CCD4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1DB8CDE18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25,uint64_t a26,void *a27,uint64_t a28,void *a29,void *a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40,uint64_t a41,void *a42,uint64_t a43,void *a44)
{
  _Unwind_Resume(a1);
}

void sub_1DB8CE8B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, void *a19, void *a20,uint64_t a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_1DB8CF5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,void *a36,void *a37,void *a38,uint64_t a39,void *a40)
{
  _Unwind_Resume(a1);
}

void sub_1DB8CFE78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1DB8D00F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8D02FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8D0608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8D06FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DB8D0848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DB8D0A60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8D0D48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8D0F3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8D111C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8D13F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8D16AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8D1888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8D1A84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8D1DD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8D2148(_Unwind_Exception *exception_object)
{
  if (v1) {
    MEMORY[0x1E01935F0](v1, 0x1000C4077774924);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DB8D2320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8D2434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8D26DC(_Unwind_Exception *a1)
{
  MEMORY[0x1E01935F0](v1, 0x1000C4077774924);
  _Unwind_Resume(a1);
}

void sub_1DB8D2860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8D2B78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8D2D54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

aneserializers::anemodelparams_v1::_ANEModelParamsSerializerDeserializer *aneserializers::anemodelparams_v1::_ANEModelParamsSerializerDeserializer::_ANEModelParamsSerializerDeserializer(aneserializers::anemodelparams_v1::_ANEModelParamsSerializerDeserializer *this, _IOSurfaceWrapper *a2)
{
  *(_DWORD *)this = a2;
  uint64_t v3 = _IOSurfaceWrapper::alloc(a2);
  uint64_t v4 = operator new(0x28uLL);
  v4[1] = 0;
  v4[2] = 0;
  void *v4 = &unk_1F35E5428;
  v4[4] = v3;
  *((void *)this + 2) = v4;
  *((unsigned char *)v4 + 24) = 0;
  *((void *)this + 1) = v4 + 3;
  *((_DWORD *)this + 1) = IOSurfaceGetID(v3);
  return this;
}

void sub_1DB8D2F20(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 16);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

IOSurfaceRef _IOSurfaceWrapper::alloc(_IOSurfaceWrapper *this)
{
  unsigned int v1 = this;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  _IOSurfaceWrapper::setIntValue(Mutable, (__CFDictionary *)*MEMORY[0x1E4F2EFE8], 0);
  _IOSurfaceWrapper::setInt64Value(Mutable, (__CFDictionary *)*MEMORY[0x1E4F2EFB8], (const __CFString *)v1);
  IOSurfaceRef v3 = IOSurfaceCreate(Mutable);
  CFRelease(Mutable);
  return v3;
}

void std::__shared_ptr_emplace<_IOSurfaceWrapper>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F35E5428;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<_IOSurfaceWrapper>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F35E5428;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1E01935F0);
}

void std::__shared_ptr_emplace<_IOSurfaceWrapper>::__on_zero_shared(uint64_t a1)
{
}

void _IOSurfaceWrapper::~_IOSurfaceWrapper(_IOSurfaceWrapper *this)
{
  uint64_t v2 = (__IOSurface *)*((void *)this + 1);
  if (v2)
  {
    if (*(unsigned char *)this)
    {
      IOSurfaceUnlock(v2, 0, 0);
      *(unsigned char *)this = 0;
      uint64_t v2 = (__IOSurface *)*((void *)this + 1);
    }
    CFRelease(v2);
    *((void *)this + 1) = 0;
  }
}

void _IOSurfaceWrapper::setIntValue(_IOSurfaceWrapper *this, __CFDictionary *a2, const __CFString *a3)
{
  int valuePtr = (int)a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(this, a2, v5);
  CFRelease(v5);
}

void _IOSurfaceWrapper::setInt64Value(_IOSurfaceWrapper *this, __CFDictionary *a2, const __CFString *a3)
{
  CFStringRef valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFDictionarySetValue(this, a2, v5);
  CFRelease(v5);
}

aneserializers::anemodelnewinstanceparams_v1::_ANEModelInstanceParametersSerializerDeserializer *aneserializers::anemodelnewinstanceparams_v1::_ANEModelInstanceParametersSerializerDeserializer::_ANEModelInstanceParametersSerializerDeserializer(aneserializers::anemodelnewinstanceparams_v1::_ANEModelInstanceParametersSerializerDeserializer *this, const char *a2, int a3, int a4)
{
  *(_DWORD *)this = a4;
  *((_DWORD *)this + 1) = a3 + 1;
  int v6 = _IOSurfaceWrapper::alloc((_IOSurfaceWrapper *)(a3 + 1 + 12 * a4));
  uint64_t v7 = operator new(0x28uLL);
  v7[1] = 0;
  v7[2] = 0;
  void *v7 = &unk_1F35E5428;
  v7[4] = v6;
  *((void *)this + 3) = v7;
  *((unsigned char *)v7 + 24) = 0;
  *((void *)this + 2) = v7 + 3;
  *((_DWORD *)this + 8) = 0;
  *((_DWORD *)this + 2) = IOSurfaceGetID(v6);
  BaseAddress = *(__IOSurface **)(*((void *)this + 2) + 8);
  if (BaseAddress) {
    BaseAddress = (__IOSurface *)IOSurfaceGetBaseAddress(BaseAddress);
  }
  if (!*((_DWORD *)this + 1)) {
    BaseAddress = 0;
  }
  memcpy(BaseAddress, a2, *((unsigned int *)this + 1));
  return this;
}

void sub_1DB8D3214(_Unwind_Exception *exception_object)
{
  IOSurfaceRef v3 = *(std::__shared_weak_count **)(v1 + 24);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t aneserializers::anemodelnewinstanceparams_v1::_ANEProcedureDataSerializerDeserializer::_ANEProcedureDataSerializerDeserializer(uint64_t a1, const void *a2, int a3, int a4)
{
  *(_DWORD *)a1 = a4;
  *(_DWORD *)(a1 + 4) = a3 + 1;
  int v6 = _IOSurfaceWrapper::alloc((_IOSurfaceWrapper *)(a3 + 113));
  uint64_t v7 = operator new(0x28uLL);
  v7[1] = 0;
  v7[2] = 0;
  void *v7 = &unk_1F35E5428;
  v7[4] = v6;
  *(void *)(a1 + 24) = v7;
  *((unsigned char *)v7 + 24) = 0;
  *(void *)(a1 + 16) = v7 + 3;
  *(_DWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 8) = IOSurfaceGetID(v6);
  BaseAddress = *(__IOSurface **)(*(void *)(a1 + 16) + 8);
  if (BaseAddress) {
    BaseAddress = (__IOSurface *)IOSurfaceGetBaseAddress(BaseAddress);
  }
  if (!*(_DWORD *)(a1 + 4)) {
    BaseAddress = 0;
  }
  memcpy(BaseAddress, a2, *(unsigned int *)(a1 + 4));
  return a1;
}

void sub_1DB8D32DC(_Unwind_Exception *exception_object)
{
  IOSurfaceRef v3 = *(std::__shared_weak_count **)(v1 + 24);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

unsigned int *aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer::_ANEWeightSerializerDeserializer(unsigned int *a1, const void *a2, int a3, const void *a4, int a5, const void *a6, _IOSurfaceWrapper *a7, const void *a8, unsigned int a9, const void *a10, int a11, void *a12)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v39 = a12;
  *a1 = a3 + 1;
  a1[1] = a5 + 1;
  a1[2] = a9;
  a1[3] = a11 + 1;
  a1[5] = a7;
  IOSurfaceRef v20 = _IOSurfaceWrapper::alloc((_IOSurfaceWrapper *)(a5 + 1 + a3 + 1 + a9 + a11 + 1));
  uint64_t v21 = operator new(0x28uLL);
  v21[1] = 0;
  v21[2] = 0;
  *uint64_t v21 = &unk_1F35E5428;
  *((unsigned char *)v21 + 24) = 0;
  v21[4] = v20;
  *((void *)a1 + 4) = v21 + 3;
  *((void *)a1 + 5) = v21;
  IOSurfaceRef v22 = _IOSurfaceWrapper::alloc(a7);
  uint64_t v23 = operator new(0x28uLL);
  v23[1] = 0;
  v23[2] = 0;
  *((unsigned char *)v23 + 24) = 0;
  void *v23 = &unk_1F35E5428;
  v23[4] = v22;
  *((void *)a1 + 6) = v23 + 3;
  *((void *)a1 + 7) = v23;
  BaseAddress = *(__IOSurface **)(*((void *)a1 + 4) + 8);
  if (BaseAddress) {
    BaseAddress = (__IOSurface *)IOSurfaceGetBaseAddress(BaseAddress);
  }
  if (!*a1) {
    BaseAddress = 0;
  }
  memcpy(BaseAddress, a2, *a1);
  uint64_t v25 = *(__IOSurface **)(*((void *)a1 + 4) + 8);
  if (v25) {
    uint64_t v25 = (__IOSurface *)IOSurfaceGetBaseAddress(v25);
  }
  size_t v26 = a1[1];
  if (v26) {
    uint64_t v27 = (char *)v25 + *a1;
  }
  else {
    uint64_t v27 = 0;
  }
  memcpy(v27, a4, v26);
  if (a8)
  {
    SHACode = (void *)aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer::getSHACode((aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer *)a1);
    memcpy(SHACode, a8, a1[2]);
  }
  if (a10)
  {
    char v29 = (void *)aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer::getsandboxExtension((aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer *)a1);
    memcpy(v29, a10, a1[3]);
  }
  a1[4] = IOSurfaceGetID(*(IOSurfaceRef *)(*((void *)a1 + 4) + 8));
  uint64_t v30 = v39;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    int v33 = *a1;
    id v34 = *(__IOSurface **)(*((void *)a1 + 4) + 8);
    if (v34)
    {
      v35 = IOSurfaceGetBaseAddress(v34);
      int v36 = *a1;
      id v34 = *(__IOSurface **)(*((void *)a1 + 4) + 8);
      if (v34) {
        id v34 = (__IOSurface *)IOSurfaceGetBaseAddress(v34);
      }
    }
    else
    {
      v35 = 0;
      int v36 = *a1;
    }
    if (a1[1]) {
      uint64_t v37 = (char *)v34 + *a1;
    }
    else {
      uint64_t v37 = 0;
    }
    if (v36) {
      uint64_t v38 = v35;
    }
    else {
      uint64_t v38 = 0;
    }
    *(_DWORD *)buf = 67109634;
    int v41 = v33;
    __int16 v42 = 2080;
    v43 = v38;
    __int16 v44 = 2080;
    v45 = v37;
    _os_log_debug_impl(&dword_1DB8AB000, v30, OS_LOG_TYPE_DEBUG, "_ANEWeightSerializerDeserializer weightSymbolSize:%u weightsymbol:%s weightsymbolURL:%s\n", buf, 0x1Cu);
  }

  uint64_t v31 = *(__IOSurface **)(*((void *)a1 + 6) + 8);
  if (v31) {
    uint64_t v31 = (__IOSurface *)IOSurfaceGetBaseAddress(v31);
  }
  memcpy(v31, a6, a1[5]);
  a1[6] = IOSurfaceGetID(*(IOSurfaceRef *)(*((void *)a1 + 6) + 8));

  return a1;
}

void sub_1DB8D35CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  v13 = *(std::__shared_weak_count **)(v10 + 56);
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  v14 = *(std::__shared_weak_count **)(v10 + 40);
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }

  _Unwind_Resume(a1);
}

uint64_t aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer::getSHACode(aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer *this)
{
  BaseAddress = *(__IOSurface **)(*((void *)this + 4) + 8);
  if (BaseAddress) {
    BaseAddress = (__IOSurface *)IOSurfaceGetBaseAddress(BaseAddress);
  }
  if (*((_DWORD *)this + 2)) {
    return (uint64_t)BaseAddress + (*((_DWORD *)this + 1) + *(_DWORD *)this);
  }
  else {
    return 0;
  }
}

uint64_t aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer::getsandboxExtension(aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer *this)
{
  BaseAddress = *(__IOSurface **)(*((void *)this + 4) + 8);
  if (BaseAddress) {
    BaseAddress = (__IOSurface *)IOSurfaceGetBaseAddress(BaseAddress);
  }
  if (*((_DWORD *)this + 3)) {
    return (uint64_t)BaseAddress + (*((_DWORD *)this + 1) + *(_DWORD *)this + *((_DWORD *)this + 2));
  }
  else {
    return 0;
  }
}

void aneserializers::anemodelnewinstanceparams_v1::_ANEModelInstanceParametersSerializerDeserializer::~_ANEModelInstanceParametersSerializerDeserializer(aneserializers::anemodelnewinstanceparams_v1::_ANEModelInstanceParametersSerializerDeserializer *this)
{
  unint64_t v2 = *((unsigned int *)this + 8);
  if (v2)
  {
    unint64_t v3 = 0;
    uint64_t v4 = (char *)this + 40;
    do
    {
      CFNumberRef v5 = *(aneserializers::anemodelnewinstanceparams_v1::_ANEProcedureDataSerializerDeserializer **)&v4[8 * v3];
      if (v5)
      {
        aneserializers::anemodelnewinstanceparams_v1::_ANEProcedureDataSerializerDeserializer::~_ANEProcedureDataSerializerDeserializer(v5);
        MEMORY[0x1E01935F0]();
        *(void *)&v4[8 * v3] = 0;
        unint64_t v2 = *((unsigned int *)this + 8);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  int v6 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void aneserializers::anemodelnewinstanceparams_v1::_ANEProcedureDataSerializerDeserializer::~_ANEProcedureDataSerializerDeserializer(aneserializers::anemodelnewinstanceparams_v1::_ANEProcedureDataSerializerDeserializer *this)
{
  unint64_t v2 = *((unsigned int *)this + 8);
  if (v2)
  {
    unint64_t v3 = 0;
    uint64_t v4 = (char *)this + 40;
    do
    {
      uint64_t v5 = *(void *)&v4[8 * v3];
      if (v5)
      {
        int v6 = *(std::__shared_weak_count **)(v5 + 56);
        if (v6) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v6);
        }
        uint64_t v7 = *(std::__shared_weak_count **)(v5 + 40);
        if (v7) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v7);
        }
        MEMORY[0x1E01935F0](v5, 0x1020C4076FB8CD1);
        *(void *)&v4[8 * v3] = 0;
        unint64_t v2 = *((unsigned int *)this + 8);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  uint64_t v8 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

uint64_t OUTLINED_FUNCTION_0_8(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_1_6(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_5_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_11(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 2048;
  *(void *)(a4 + 14) = v4;
  return result;
}

void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_14(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 1024;
  *(_DWORD *)(a4 + 14) = v4;
  return result;
}

uint64_t OUTLINED_FUNCTION_18(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 2048;
  *(void *)(a2 + 14) = a3;
  return result;
}

void OUTLINED_FUNCTION_19(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0x12u);
}

void OUTLINED_FUNCTION_21(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x12u);
}

uint64_t OUTLINED_FUNCTION_22@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, float a3@<S0>)
{
  *(float *)uint64_t v3 = a3;
  *(void *)(v3 + 4) = result;
  *(_WORD *)(v3 + 12) = 2048;
  *(void *)(v3 + 14) = a2;
  return result;
}

id OUTLINED_FUNCTION_23(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_24(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0x16u);
}

void OUTLINED_FUNCTION_25(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_26(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  return result;
}

uint64_t OUTLINED_FUNCTION_27(uint64_t result, float a2)
{
  *(float *)uint64_t v2 = a2;
  *(void *)(v2 + 4) = result;
  *(_WORD *)(v2 + 12) = 1024;
  *(_DWORD *)(v2 + 14) = 1;
  return result;
}

void OUTLINED_FUNCTION_28(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x18u);
}

void OUTLINED_FUNCTION_29(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x12u);
}

uint64_t OUTLINED_FUNCTION_30@<X0>(uint64_t result@<X0>, int a2@<W8>, float a3@<S0>)
{
  *(float *)uint64_t v3 = a3;
  *(void *)(v3 + 4) = result;
  *(_WORD *)(v3 + 12) = 1024;
  *(_DWORD *)(v3 + 14) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_31(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  return result;
}

void OUTLINED_FUNCTION_32(uint64_t a1, uint64_t a2, int a3)
{
  *(_DWORD *)(a2 + 14) = v4;
  *(_WORD *)(a2 + 18) = v3;
  *(_DWORD *)(a2 + 20) = a3;
}

uint64_t OUTLINED_FUNCTION_36(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 2112;
  return result;
}

id _ANEDaemonInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F35F0780];
  commonInitialization(v0);
  return v0;
}

void commonInitialization(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)MEMORY[0x1E4F1CAD0];
  id v2 = a1;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  __int16 v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v5 count:11];
  int v4 = objc_msgSend(v1, "setWithArray:", v3, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14);

  [v2 setClasses:v4 forSelector:sel_compileModel_sandboxExtension_options_qos_withReply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v4 forSelector:sel_compileModel_sandboxExtension_options_qos_withReply_ argumentIndex:1 ofReply:1];
  [v2 setClasses:v4 forSelector:sel_loadModel_sandboxExtension_options_qos_withReply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v4 forSelector:sel_loadModel_sandboxExtension_options_qos_withReply_ argumentIndex:1 ofReply:1];
  [v2 setClasses:v4 forSelector:sel_loadModelNewInstance_options_modelInstParams_qos_withReply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v4 forSelector:sel_loadModelNewInstance_options_modelInstParams_qos_withReply_ argumentIndex:1 ofReply:1];
  [v2 setClasses:v4 forSelector:sel_unloadModel_options_qos_withReply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v4 forSelector:sel_reportTelemetryToPPS_playload_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v4 forSelector:sel_reportTelemetryToPPS_playload_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v4 forSelector:sel_compiledModelExistsFor_withReply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v4 forSelector:sel_purgeCompiledModel_withReply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v4 forSelector:sel_compiledModelExistsMatchingHash_withReply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v4 forSelector:sel_purgeCompiledModelMatchingHash_withReply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v4 forSelector:sel_prepareChainingWithModel_options_chainingReq_qos_withReply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v4 forSelector:sel_prepareChainingWithModel_options_chainingReq_qos_withReply_ argumentIndex:2 ofReply:0];
}

id _ANEDaemonInterfacePrivate()
{
  v4[12] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F35F37E8];
  commonInitialization(v0);
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v4[10] = objc_opt_class();
  v4[11] = objc_opt_class();
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:12];
  id v2 = [MEMORY[0x1E4F1CAD0] setWithArray:v1];
  [v0 setClasses:v2 forSelector:sel_beginRealTimeTaskWithReply_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v2 forSelector:sel_endRealTimeTaskWithReply_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v2 forSelector:sel_echo_withReply_ argumentIndex:0 ofReply:0];

  return v0;
}

void sub_1DB8D4F84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t fDeviceCallback(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)MEMORY[0x1E0193890]();
  unsigned int v9 = *a4;
  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s: statusType=%d : pRefCon=%p : device=%p : programInstance=%p", "fDeviceCallback", *a4, a1, a2, a3);
  if ((v9 & 0xFFFFFFFE) == 0x16)
  {
    uint64_t v11 = +[_ANELog common];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v10;
      _os_log_impl(&dword_1DB8AB000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
  }
  else if (v9 == 21 || v9 == 18)
  {
    uint64_t v11 = +[_ANELog common];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      fDeviceCallback((uint64_t)v10, v11);
    }
  }
  else
  {
    uint64_t v11 = +[_ANELog common];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      fDeviceCallback((uint64_t)v10, v11);
    }
  }

  unsigned int v14 = *a4;
  if (*a4 == 21)
  {
    +[_ANEDataReporter addValue:1 forScalarKey:@"ANEReset"];
    unsigned int v14 = *a4;
  }
  if (v14 <= 0x15 && ((1 << v14) & 0x260000) != 0) {
    +[_ANEDataReporter reportErrorMsg:status:](_ANEDataReporter, "reportErrorMsg:status:");
  }

  return 0;
}

void sub_1DB8D518C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8D546C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB8D5CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8D6158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1DB8D6964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose((const void *)(v13 - 160), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8D6E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DB8D7238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1DB8D7610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1DB8D799C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1DB8D8148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8D83AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8D881C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DB8D927C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1DB8DA568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_9_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_17_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

id OUTLINED_FUNCTION_18_0(uint64_t a1, void *a2)
{
  return a2;
}

id OUTLINED_FUNCTION_19_0(uint64_t a1, void *a2)
{
  return a2;
}

void ANEGetValidateNetworkSupportedVersion_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1DB8AB000, v0, OS_LOG_TYPE_DEBUG, "%s: validateNetworkSupportedVersion=%llu", (uint8_t *)v1, 0x16u);
}

void ANEGetValidateNetworkSupportedVersion_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "uint64_t ANEGetValidateNetworkSupportedVersion()";
  _os_log_error_impl(&dword_1DB8AB000, log, OS_LOG_TYPE_ERROR, "%s: Virtual Machine environment detected but no virtualClient available.", (uint8_t *)&v1, 0xCu);
}

void ANEValidateNetworkCreate_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  _DWORD *v1 = 136315394;
  OUTLINED_FUNCTION_1_0(v2, (uint64_t)v1, (uint64_t)"CFDictionaryRef ANEValidateNetworkCreate(uint64_t, CFDictionaryRef _Nonnull)");
  OUTLINED_FUNCTION_3(&dword_1DB8AB000, v3, v4, "%s: outValidationParams=%@", v5);
}

void ANEValidateNetworkCreate_cold_2()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_5();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_1DB8AB000, v2, OS_LOG_TYPE_ERROR, "%s: device_api_version=%llu mismatch with api_version=%llu", (uint8_t *)v3, 0x20u);
}

void ANEValidateNetworkCreate_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  int v3 = "CFDictionaryRef ANEValidateNetworkCreate(uint64_t, CFDictionaryRef _Nonnull)";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1DB8AB000, a2, OS_LOG_TYPE_ERROR, "%s: ANEDeviceInfo Directory can't be created error %@", (uint8_t *)&v2, 0x16u);
}

void ANEValidateNetworkCreate_cold_4()
{
  OUTLINED_FUNCTION_0_0();
  _DWORD *v1 = 136315394;
  OUTLINED_FUNCTION_1_0(v2, (uint64_t)v1, (uint64_t)"CFDictionaryRef ANEValidateNetworkCreate(uint64_t, CFDictionaryRef _Nonnull)");
  OUTLINED_FUNCTION_3(&dword_1DB8AB000, v3, v4, "%s: boot-arg %@ set, performing validation on guest", v5);
}

void ANEValidateNetworkCreate_cold_5()
{
  OUTLINED_FUNCTION_0_0();
  _DWORD *v1 = 136315394;
  OUTLINED_FUNCTION_1_0(v2, (uint64_t)v1, (uint64_t)"CFDictionaryRef ANEValidateNetworkCreate(uint64_t, CFDictionaryRef _Nonnull)");
  OUTLINED_FUNCTION_3(&dword_1DB8AB000, v3, v4, "%s: inValidationParams: %@", v5);
}

void fDeviceCallback(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DB8AB000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

{
  int v2;
  uint64_t v3;
  uint64_t v4;

  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB8AB000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

uint64_t ANECGetValidateNetworkSupportedVersion()
{
  return MEMORY[0x1F4104FF0]();
}

uint64_t ANECValidateNetworkCreate()
{
  return MEMORY[0x1F4105268]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return (CFDataRef)MEMORY[0x1F40E8688](object, options);
}

CFTypeRef IOCFUnserializeBinary(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x1F40E8690](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86C8](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x1F40E86D0](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED8](*(void *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1F40E9258](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1F40E9280](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9308](properties);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x1F40E9328](aSurface);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9350](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9460](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9560](xobj);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x1F417CE30]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return MEMORY[0x1F4145DB8]();
}

uint64_t PPSSendTelemetry()
{
  return MEMORY[0x1F4145DC8]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1F40F7128](task, error);
}

uint64_t SecTaskCopyTeamIdentifier()
{
  return MEMORY[0x1F40F7130]();
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t MIL::ParserOptions::Make(MIL::ParserOptions *this)
{
  return MEMORY[0x1F412AD40](this);
}

uint64_t MIL::Text::SerializeToFile()
{
  return MEMORY[0x1F412AF68]();
}

uint64_t MIL::Text::SerializerOptions::Make(MIL::Text::SerializerOptions *this)
{
  return MEMORY[0x1F412AF88](this);
}

uint64_t MIL::Text::ParseProgramFromFile()
{
  return MEMORY[0x1F412AF90]();
}

uint64_t MIL::Opsets::Common::CreateMILContext(MIL::Opsets::Common *this)
{
  return MEMORY[0x1F412B050](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::terminate(void)
{
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

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
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
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
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

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CB3A0](a1, a2);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0A0](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1F40CB880](from, to, state, *(void *)&flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return (copyfile_state_t)MEMORY[0x1F40CB888]();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return MEMORY[0x1F40CB890](a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x1F40CC6F0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

uint64_t kdebug_trace_string()
{
  return MEMORY[0x1F40CC708]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1F40CD5E8]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}