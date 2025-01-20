void sub_2543A0164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2543A020C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100]()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_2653A80A8, MEMORY[0x263F8C060]);
}

void sub_2543A02F8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return 1;
  }
  if ((a2 & a1) < 0 != __OFSUB__(a1, a2)) {
    return strcmp((const char *)(a1 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(a2 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
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

void IOThreadServerMappedMemory::~IOThreadServerMappedMemory(IOThreadServerMappedMemory *this)
{
  IOThreadServerMappedMemory::~IOThreadServerMappedMemory(this);
  JUMPOUT(0x25A276FE0);
}

{
  void *v2;
  void *v3;
  size_t v4;

  *(void *)this = &unk_2703C2F58;
  v3 = (void *)((char *)this + 8);
  v2 = (void *)*((void *)this + 1);
  size_t v4 = *((void *)this + 2);
  if (!v2 || !v4) {
    munmap(v2, v4);
  }
  *v3 = 0;
  v3[1] = 0;
}

uint64_t ClientSideServerConnection::kill(ClientSideServerConnection *this)
{
  uint64_t result = *((void *)this + 5);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 16))();
  }
  return result;
}

void ClientSideServerConnection::~ClientSideServerConnection(ClientSideServerConnection *this)
{
  *(void *)this = &unk_2703C2EF0;
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)this + 1);
  JUMPOUT(0x25A276FE0);
}

{
  *(void *)this = &unk_2703C2EF0;
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)this + 1);
}

void *std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](void *a1)
{
  v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void *std::__function::__func<ClientSideServerConnection::ClientSideServerConnection(void)::$_0,std::allocator<ClientSideServerConnection::ClientSideServerConnection(void)::$_0>,void ()(void)>::target_type()
{
}

uint64_t std::__function::__func<ClientSideServerConnection::ClientSideServerConnection(void)::$_0,std::allocator<ClientSideServerConnection::ClientSideServerConnection(void)::$_0>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN26ClientSideServerConnectionC1EvE3$_0")) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void std::__function::__func<ClientSideServerConnection::ClientSideServerConnection(void)::$_0,std::allocator<ClientSideServerConnection::ClientSideServerConnection(void)::$_0>,void ()(void)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_2703C3368;
}

void *std::__function::__func<ClientSideServerConnection::ClientSideServerConnection(void)::$_0,std::allocator<ClientSideServerConnection::ClientSideServerConnection(void)::$_0>,void ()(void)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_2703C3368;
  return result;
}

void std::__function::__func<ClientSideServerConnection::ClientSideServerConnection(void)::$_0,std::allocator<ClientSideServerConnection::ClientSideServerConnection(void)::$_0>,void ()(void)>::~__func()
{
}

id ServerSideHardware::GetWorkgroupForUseCase(uint64_t a1, unsigned int **a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  UseCaseSet<HALUseCase>::GetUseCase((uint64_t)&v10, a1 + 8, **a2);
  if (!v12) {
    return 0;
  }
  AudioObjectID v2 = *(_DWORD *)(v10 + 40);
  id outData = 0;
  *(void *)&inAddress.mSelector = *(void *)"gwsobolg";
  inAddress.mElement = 0;
  UInt32 ioDataSize = 8;
  uint64_t PropertyData = AudioObjectGetPropertyData(v2, &inAddress, 0, 0, &ioDataSize, &outData);
  if (PropertyData)
  {
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudio");
    }
    size_t v4 = (id)sIsolatedCoreAudioLog(void)::sLog;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      size_t v5 = (void *)[objc_alloc(NSNumber) initWithInt:PropertyData];
      *(_DWORD *)buf = 136315906;
      v17 = "IsolatedCoreAudioClientWorkgroup.mm";
      __int16 v18 = 1024;
      int v19 = 19;
      __int16 v20 = 1024;
      AudioObjectID v21 = v2;
      __int16 v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_25439F000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d Could not create get workgroup for deviceID: %d because of Error:%@", buf, 0x22u);
    }
    BOOL v6 = v12 == 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  id v8 = outData;

  id v7 = v8;
  if (!v6 && v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  return v7;
}

void sub_2543A0924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, char a12, uint64_t a13, void *a14)
{
  if (a12)
  {
    if (a11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](a11);
    }
  }
  _Unwind_Resume(a1);
}

void UseCaseSet<HALUseCase>::GetUseCase(uint64_t a1, uint64_t a2, unsigned int a3)
{
  BOOL v6 = (std::mutex *)(a2 + 40);
  std::mutex::lock((std::mutex *)(a2 + 40));
  id v7 = std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>>>::find<unsigned int>((void *)a2, a3);
  if (v7)
  {
    uint64_t v8 = v7[4];
    *(void *)a1 = v7[3];
    *(void *)(a1 + 8) = v8;
    if (v8)
    {
      v9 = (atomic_ullong *)(v8 + 8);
      char v10 = 1;
      atomic_fetch_add_explicit(v9, 1uLL, memory_order_relaxed);
    }
    else
    {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
    *(unsigned char *)a1 = 0;
  }
  *(unsigned char *)(a1 + 16) = v10;
  std::mutex::unlock(v6);
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>>>::find<unsigned int>(void *a1, unsigned int a2)
{
  unint64_t v2 = a1[1];
  if (!v2) {
    return 0;
  }
  uint8x8_t v3 = (uint8x8_t)vcnt_s8((int8x8_t)v2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    unint64_t v4 = a2;
    if (v2 <= a2) {
      unint64_t v4 = a2 % v2;
    }
  }
  else
  {
    unint64_t v4 = (v2 - 1) & a2;
  }
  size_t v5 = *(uint64_t ***)(*a1 + 8 * v4);
  if (!v5) {
    return 0;
  }
  for (uint64_t result = *v5; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v7 = result[1];
    if (v7 == a2)
    {
      if (*((_DWORD *)result + 4) == a2) {
        return result;
      }
    }
    else
    {
      if (v3.u32[0] > 1uLL)
      {
        if (v7 >= v2) {
          v7 %= v2;
        }
      }
      else
      {
        v7 &= v2 - 1;
      }
      if (v7 != v4) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t ServerSideHardware::StopIOProc(uint64_t a1, unsigned int **a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  UseCaseSet<HALUseCase>::GetUseCase((uint64_t)&v12, a1 + 8, **a2);
  if (!v14) {
    return 5;
  }
  uint64_t v2 = AudioDeviceStop(*(_DWORD *)(v12 + 40), *(AudioDeviceIOProcID *)(v12 + 48));
  uint64_t v4 = v2;
  if (v2)
  {
    v3.i32[0] = bswap32(v2);
    *(int8x8_t *)v3.i8 = vzip1_s8(*(int8x8_t *)v3.i8, *(int8x8_t *)v3.i8);
    v5.i64[0] = 0x1F0000001FLL;
    v5.i64[1] = 0x1F0000001FLL;
    v6.i64[0] = 0x5F0000005FLL;
    v6.i64[1] = 0x5F0000005FLL;
    *(int8x8_t *)v3.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)vcgtq_u32(v6, (uint32x4_t)vsraq_n_s32(v5, vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v3.i8), 0x18uLL), 0x18uLL))), *(int8x8_t *)v3.i8, (int8x8_t)0x2E002E002E002ELL);
    char v11 = 4;
    LODWORD(__p) = vmovn_s16(v3).u32[0];
    BYTE4(__p) = 0;
    unint64_t v7 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "ServerSideHardware.cpp";
      __int16 v17 = 1024;
      int v18 = 193;
      __int16 v19 = 2080;
      p_p = &__p;
      _os_log_impl(&dword_25439F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ServerSideHardware::StopIOProc - Failed to stop audio device - error: %s", buf, 0x1Cu);
      if (v11 < 0) {
        operator delete(__p);
      }
    }
  }
  else
  {
    uint64_t v8 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "ServerSideHardware.cpp";
      __int16 v17 = 1024;
      int v18 = 197;
      _os_log_impl(&dword_25439F000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ServerSideHardware::StopIOProc - Stopped audio device", buf, 0x12u);
    }
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  return v4;
}

void sub_2543A0C7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13)
{
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a13);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sIsolatedCoreAudioLog()
{
  unint64_t v0 = 0x269DEE000uLL;
  {
    unint64_t v0 = 0x269DEE000;
    if (v2)
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudio");
      unint64_t v0 = 0x269DEE000;
    }
  }
  return *(void *)(v0 + 1872);
}

{
  unint64_t v0;
  int v2;

  unint64_t v0 = 0x269DEE000uLL;
  {
    unint64_t v0 = 0x269DEE000;
    if (v2)
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudio");
      unint64_t v0 = 0x269DEE000;
    }
  }
  return *(void *)(v0 + 1888);
}

{
  unint64_t v0;
  int v2;

  unint64_t v0 = 0x269DEE000uLL;
  {
    unint64_t v0 = 0x269DEE000;
    if (v2)
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudio");
      unint64_t v0 = 0x269DEE000;
    }
  }
  return *(void *)(v0 + 2064);
}

{
  unint64_t v0;
  int v2;

  unint64_t v0 = 0x269DEE000uLL;
  {
    unint64_t v0 = 0x269DEE000;
    if (v2)
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudio");
      unint64_t v0 = 0x269DEE000;
    }
  }
  return *(void *)(v0 + 2144);
}

{
  unint64_t v0;
  int v2;

  unint64_t v0 = 0x269DEE000uLL;
  {
    unint64_t v0 = 0x269DEE000;
    if (v2)
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudio");
      unint64_t v0 = 0x269DEE000;
    }
  }
  return *(void *)(v0 + 2240);
}

{
  unint64_t v0;
  int v2;

  unint64_t v0 = 0x269DEE000uLL;
  {
    unint64_t v0 = 0x269DEE000;
    if (v2)
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudio");
      unint64_t v0 = 0x269DEE000;
    }
  }
  return *(void *)(v0 + 2272);
}

uint64_t ServerSideHardware::StartIOProcAtTime(uint64_t a1, unsigned int **a2, UInt64 a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  UseCaseSet<HALUseCase>::GetUseCase((uint64_t)&v16, a1 + 8, **a2);
  if (!v18) {
    return 5;
  }
  AudioObjectID v4 = *(_DWORD *)(v16 + 40);
  int32x4_t v5 = *(OSStatus (__cdecl **)(AudioObjectID, const AudioTimeStamp *, const AudioBufferList *, const AudioTimeStamp *, AudioBufferList *, const AudioTimeStamp *, void *))(v16 + 48);
  ioRequestedStartTime.mSampleTime = 0.0;
  memset(&ioRequestedStartTime.mRateScalar, 0, 48);
  ioRequestedStartTime.mHostTime = a3;
  ioRequestedStartTime.mFlags = 2;
  uint64_t v6 = AudioDeviceStartAtTime(v4, v5, &ioRequestedStartTime, 9u);
  uint64_t v8 = v6;
  if (v6)
  {
    v7.i32[0] = bswap32(v6);
    *(int8x8_t *)v7.i8 = vzip1_s8(*(int8x8_t *)v7.i8, *(int8x8_t *)v7.i8);
    v9.i64[0] = 0x1F0000001FLL;
    v9.i64[1] = 0x1F0000001FLL;
    v10.i64[0] = 0x5F0000005FLL;
    v10.i64[1] = 0x5F0000005FLL;
    *(int8x8_t *)v7.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)vcgtq_u32(v10, (uint32x4_t)vsraq_n_s32(v9, vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v7.i8), 0x18uLL), 0x18uLL))), *(int8x8_t *)v7.i8, (int8x8_t)0x2E002E002E002ELL);
    char v15 = 4;
    LODWORD(__p) = vmovn_s16(v7).u32[0];
    BYTE4(__p) = 0;
    char v11 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(ioRequestedStartTime.mSampleTime) = 136315650;
      *(void *)((char *)&ioRequestedStartTime.mSampleTime + 4) = "ServerSideHardware.cpp";
      WORD2(ioRequestedStartTime.mHostTime) = 1024;
      *(_DWORD *)((char *)&ioRequestedStartTime.mHostTime + 6) = 171;
      WORD1(ioRequestedStartTime.mRateScalar) = 2080;
      *(void *)((char *)&ioRequestedStartTime.mRateScalar + 4) = &__p;
      _os_log_impl(&dword_25439F000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ServerSideHardware::StartIOProcAtTime - Failed to start audio device - error: %s", (uint8_t *)&ioRequestedStartTime, 0x1Cu);
      if (v15 < 0) {
        operator delete(__p);
      }
    }
  }
  else
  {
    uint64_t v12 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(ioRequestedStartTime.mSampleTime) = 136315394;
      *(void *)((char *)&ioRequestedStartTime.mSampleTime + 4) = "ServerSideHardware.cpp";
      WORD2(ioRequestedStartTime.mHostTime) = 1024;
      *(_DWORD *)((char *)&ioRequestedStartTime.mHostTime + 6) = 175;
      _os_log_impl(&dword_25439F000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ServerSideHardware::StartIOProcAtTime - Started audio device", (uint8_t *)&ioRequestedStartTime, 0x12u);
    }
  }
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  return v8;
}

void sub_2543A0EF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13)
{
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a13);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ServerSideHardware::StartIOProc(uint64_t a1, unsigned int **a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  UseCaseSet<HALUseCase>::GetUseCase((uint64_t)&v12, a1 + 8, **a2);
  if (!v14) {
    return 5;
  }
  uint64_t v2 = AudioDeviceStart(*(_DWORD *)(v12 + 40), *(AudioDeviceIOProcID *)(v12 + 48));
  uint64_t v4 = v2;
  if (v2)
  {
    v3.i32[0] = bswap32(v2);
    *(int8x8_t *)v3.i8 = vzip1_s8(*(int8x8_t *)v3.i8, *(int8x8_t *)v3.i8);
    v5.i64[0] = 0x1F0000001FLL;
    v5.i64[1] = 0x1F0000001FLL;
    v6.i64[0] = 0x5F0000005FLL;
    v6.i64[1] = 0x5F0000005FLL;
    *(int8x8_t *)v3.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)vcgtq_u32(v6, (uint32x4_t)vsraq_n_s32(v5, vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v3.i8), 0x18uLL), 0x18uLL))), *(int8x8_t *)v3.i8, (int8x8_t)0x2E002E002E002ELL);
    char v11 = 4;
    LODWORD(__p) = vmovn_s16(v3).u32[0];
    BYTE4(__p) = 0;
    int16x8_t v7 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = "ServerSideHardware.cpp";
      __int16 v17 = 1024;
      int v18 = 149;
      __int16 v19 = 2080;
      p_p = &__p;
      _os_log_impl(&dword_25439F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ServerSideHardware::StartIOProc - Failed to start audio device - error: %s", buf, 0x1Cu);
      if (v11 < 0) {
        operator delete(__p);
      }
    }
  }
  else
  {
    uint64_t v8 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "ServerSideHardware.cpp";
      __int16 v17 = 1024;
      int v18 = 153;
      _os_log_impl(&dword_25439F000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ServerSideHardware::StartIOProc - Started audio device", buf, 0x12u);
    }
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  return v4;
}

void sub_2543A10E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13)
{
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a13);
  }
  _Unwind_Resume(exception_object);
}

void ServerSideHardware::DeRegisterCallback(uint64_t a1, unsigned int **a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  UseCaseSet<HALUseCase>::GetUseCase((uint64_t)&v11, a1 + 8, **a2);
  if (v13)
  {
    uint64_t v2 = v11;
    OSStatus v3 = AudioDeviceDestroyIOProcID(*(_DWORD *)(v11 + 40), *(AudioDeviceIOProcID *)(v11 + 48));
    if (v3)
    {
      v4.i32[0] = bswap32(v3);
      *(int8x8_t *)v4.i8 = vzip1_s8(*(int8x8_t *)v4.i8, *(int8x8_t *)v4.i8);
      v5.i64[0] = 0x1F0000001FLL;
      v5.i64[1] = 0x1F0000001FLL;
      v6.i64[0] = 0x5F0000005FLL;
      v6.i64[1] = 0x5F0000005FLL;
      *(int8x8_t *)v4.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)vcgtq_u32(v6, (uint32x4_t)vsraq_n_s32(v5, vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v4.i8), 0x18uLL), 0x18uLL))), *(int8x8_t *)v4.i8, (int8x8_t)0x2E002E002E002ELL);
      char v10 = 4;
      LODWORD(__p) = vmovn_s16(v4).u32[0];
      BYTE4(__p) = 0;
      int16x8_t v7 = sIsolatedCoreAudioLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        char v15 = "ServerSideHardware.cpp";
        __int16 v16 = 1024;
        int v17 = 130;
        __int16 v18 = 2080;
        p_p = &__p;
        _os_log_impl(&dword_25439F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ServerSideHardware::DeRegisterCallback - Failed to destroy audio device IO proc - error: %s", buf, 0x1Cu);
        if (v10 < 0) {
          operator delete(__p);
        }
      }
    }
    else
    {
      uint64_t v8 = sIsolatedCoreAudioLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        char v15 = "ServerSideHardware.cpp";
        __int16 v16 = 1024;
        int v17 = 134;
        _os_log_impl(&dword_25439F000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ServerSideHardware::DeRegisterCallback - IOProcID destruction succeeded", buf, 0x12u);
      }
      *(void *)(v2 + 48) = 0;
    }
    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
  }
}

void sub_2543A12BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13)
{
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a13);
  }
  _Unwind_Resume(exception_object);
}

void ServerSideHardware::RegisterCallback(uint64_t a1, uint64_t a2, unsigned int **a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  UseCaseSet<HALUseCase>::GetUseCase((uint64_t)&v25, a1 + 8, **a3);
  if (!v27) {
    return;
  }
  uint64_t v5 = v25;
  uint64_t v6 = v25 + 24;
  std::function<void ()(CoreAudioTimestamp)>::operator=((void *)(*(void *)(v25 + 24) + 8), a2);
  int v7 = **a3;
  if (!v7)
  {
    char v14 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "ServerSideHardware.cpp";
      __int16 v30 = 1024;
      int v31 = 102;
      _os_log_impl(&dword_25439F000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ServerSideHardware::RegisterCallback - legacyHalUseCase is unknown!", buf, 0x12u);
    }
    goto LABEL_29;
  }
  uint64_t v8 = 0;
  AudioDeviceIOProcID outIOProcID = 0;
  AudioObjectID v9 = *(_DWORD *)(v5 + 40);
  if (v7 <= 1936290408)
  {
    if (v7 == 1819309171)
    {
      char v10 = IsolatedIOProcTemplate<&(SetLegacyIOProcForIsolatedUseCase(IsolatedAudio_UseCaseID,std::shared_ptr<Isolated_Legacy_IO_Procedure> *)::smart_ptr_to_meterClient_ptr)>;
      {
        AudioObjectID v11 = v9;
        uint64_t v21 = IsolatedIOProcTemplate<&(SetLegacyIOProcForIsolatedUseCase(IsolatedAudio_UseCaseID,std::shared_ptr<Isolated_Legacy_IO_Procedure> *)::smart_ptr_to_meterClient_ptr)>;
        {
          char v13 = &SetLegacyIOProcForIsolatedUseCase(IsolatedAudio_UseCaseID,std::shared_ptr<Isolated_Legacy_IO_Procedure> *)::smart_ptr_to_meterClient_ptr;
          goto LABEL_34;
        }
        goto LABEL_35;
      }
    }
    else
    {
      if (v7 != 1935962992) {
        goto LABEL_21;
      }
      char v10 = IsolatedIOProcTemplate<&(SetLegacyIOProcForIsolatedUseCase(IsolatedAudio_UseCaseID,std::shared_ptr<Isolated_Legacy_IO_Procedure> *)::smart_ptr_to_sharedDSP_ptr)>;
      {
        AudioObjectID v11 = v9;
        uint64_t v21 = IsolatedIOProcTemplate<&(SetLegacyIOProcForIsolatedUseCase(IsolatedAudio_UseCaseID,std::shared_ptr<Isolated_Legacy_IO_Procedure> *)::smart_ptr_to_sharedDSP_ptr)>;
        {
          char v13 = &SetLegacyIOProcForIsolatedUseCase(IsolatedAudio_UseCaseID,std::shared_ptr<Isolated_Legacy_IO_Procedure> *)::smart_ptr_to_sharedDSP_ptr;
LABEL_34:
          uint64_t *v13 = v6;
          __cxa_guard_release(v12);
          goto LABEL_35;
        }
        goto LABEL_35;
      }
    }
LABEL_20:
    uint64_t v8 = (OSStatus (__cdecl *)(AudioObjectID, const AudioTimeStamp *, const AudioBufferList *, const AudioTimeStamp *, AudioBufferList *, const AudioTimeStamp *, void *))v10;
    goto LABEL_21;
  }
  if (v7 == 1936614497)
  {
    char v10 = IsolatedIOProcTemplate<&(SetLegacyIOProcForIsolatedUseCase(IsolatedAudio_UseCaseID,std::shared_ptr<Isolated_Legacy_IO_Procedure> *)::smart_ptr_to_sound_analysis_ptr)>;
    {
      AudioObjectID v11 = v9;
      uint64_t v21 = IsolatedIOProcTemplate<&(SetLegacyIOProcForIsolatedUseCase(IsolatedAudio_UseCaseID,std::shared_ptr<Isolated_Legacy_IO_Procedure> *)::smart_ptr_to_sound_analysis_ptr)>;
      {
        char v13 = &SetLegacyIOProcForIsolatedUseCase(IsolatedAudio_UseCaseID,std::shared_ptr<Isolated_Legacy_IO_Procedure> *)::smart_ptr_to_sound_analysis_ptr;
        goto LABEL_34;
      }
      goto LABEL_35;
    }
    goto LABEL_20;
  }
  if (v7 != 1936290409) {
    goto LABEL_21;
  }
  char v10 = IsolatedIOProcTemplate<&(SetLegacyIOProcForIsolatedUseCase(IsolatedAudio_UseCaseID,std::shared_ptr<Isolated_Legacy_IO_Procedure> *)::smart_ptr_to_siri_ptr)>;
  AudioObjectID v11 = v9;
  uint64_t v21 = IsolatedIOProcTemplate<&(SetLegacyIOProcForIsolatedUseCase(IsolatedAudio_UseCaseID,std::shared_ptr<Isolated_Legacy_IO_Procedure> *)::smart_ptr_to_siri_ptr)>;
  {
    char v13 = &SetLegacyIOProcForIsolatedUseCase(IsolatedAudio_UseCaseID,std::shared_ptr<Isolated_Legacy_IO_Procedure> *)::smart_ptr_to_siri_ptr;
    goto LABEL_34;
  }
LABEL_35:
  AudioObjectID v9 = v11;
  uint64_t v8 = (OSStatus (__cdecl *)(AudioObjectID, const AudioTimeStamp *, const AudioBufferList *, const AudioTimeStamp *, AudioBufferList *, const AudioTimeStamp *, void *))v21;
LABEL_21:
  OSStatus v15 = AudioDeviceCreateIOProcID(v9, v8, 0, &outIOProcID);
  if (v15)
  {
    v16.i32[0] = bswap32(v15);
    *(int8x8_t *)v16.i8 = vzip1_s8(*(int8x8_t *)v16.i8, *(int8x8_t *)v16.i8);
    v17.i64[0] = 0x1F0000001FLL;
    v17.i64[1] = 0x1F0000001FLL;
    v18.i64[0] = 0x5F0000005FLL;
    v18.i64[1] = 0x5F0000005FLL;
    *(int8x8_t *)v16.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)vcgtq_u32(v18, (uint32x4_t)vsraq_n_s32(v17, vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v16.i8), 0x18uLL), 0x18uLL))), *(int8x8_t *)v16.i8, (int8x8_t)0x2E002E002E002ELL);
    char v23 = 4;
    LODWORD(__p) = vmovn_s16(v16).u32[0];
    BYTE4(__p) = 0;
    __int16 v19 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v29 = "ServerSideHardware.cpp";
      __int16 v30 = 1024;
      int v31 = 111;
      __int16 v32 = 2080;
      p_p = &__p;
      _os_log_impl(&dword_25439F000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ServerSideHardware::RegisterCallback - Failed to create audio device IO proc - error: %s", buf, 0x1Cu);
      if (v23 < 0) {
        operator delete(__p);
      }
    }
  }
  else
  {
    uint64_t v20 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "ServerSideHardware.cpp";
      __int16 v30 = 1024;
      int v31 = 115;
      _os_log_impl(&dword_25439F000, v20, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ServerSideHardware::RegisterCallback - IOProcID succeeded", buf, 0x12u);
    }
    *(void *)(v25 + 48) = outIOProcID;
  }
  if (v27)
  {
LABEL_29:
    if (v26) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v26);
    }
  }
}

void sub_2543A16E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, char a16)
{
  if (a16)
  {
    if (a15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](a15);
    }
  }
  _Unwind_Resume(exception_object);
}

void *std::function<void ()(CoreAudioTimestamp)>::operator=(void *a1, uint64_t a2)
{
  v8[3] = *MEMORY[0x263EF8340];
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)v6, a2);
  if (v6 != a1)
  {
    OSStatus v3 = v7;
    int16x8_t v4 = (void *)a1[3];
    if (v7 == v6)
    {
      if (v4 == a1)
      {
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, v8);
        (*(void (**)(void *))(*v7 + 32))(v7);
        int v7 = 0;
        (*(void (**)(void, void *))(*(void *)a1[3] + 24))(a1[3], v6);
        (*(void (**)(void))(*(void *)a1[3] + 32))(a1[3]);
        a1[3] = 0;
        int v7 = v6;
        (*(void (**)(void *, void *))(v8[0] + 24))(v8, a1);
        (*(void (**)(void *))(v8[0] + 32))(v8);
      }
      else
      {
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a1);
        (*(void (**)(void *))(*v7 + 32))(v7);
        int v7 = (void *)a1[3];
      }
      a1[3] = a1;
    }
    else if (v4 == a1)
    {
      (*(void (**)(void *, void *))(*a1 + 24))(a1, v6);
      (*(void (**)(void))(*(void *)a1[3] + 32))(a1[3]);
      a1[3] = v7;
      int v7 = v6;
    }
    else
    {
      int v7 = (void *)a1[3];
      a1[3] = v3;
    }
  }
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100](v6);
  return a1;
}

void sub_2543A19A0(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

{
  void *v3;
  uint64_t v4;

  uint64_t v3 = (void *)(a2 + 24);
  int16x8_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(void *)(a1 + 24) = v4;
  }
  else
  {
    uint64_t v3 = (void *)(a1 + 24);
  }
  *uint64_t v3 = 0;
  return a1;
}

void *std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void ServerSideHardware::AcquireDeviceForUseCase(uint64_t a1, unsigned int **a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  UseCaseSet<HALUseCase>::GetUseCase((uint64_t)&v12, a1 + 8, **a2);
  uint64_t v2 = mach_absolute_time();
  int v3 = 0;
  uint64_t v4 = v12;
  while (1)
  {
    int v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 16))(v4);
    if (v5) {
      break;
    }
    usleep(0x3D090u);
    if (++v3 == 10) {
      goto LABEL_6;
    }
  }
  if (!v3) {
    goto LABEL_14;
  }
LABEL_6:
  uint64_t v6 = mach_absolute_time();
  unsigned int v7 = dword_269DEE74C;
  if (!dword_269DEE74C)
  {
    mach_timebase_info((mach_timebase_info_t)&LogRetrySetDeviceIDState(BOOL,unsigned int,unsigned long long)::sTimebaseInfo);
    unsigned int v7 = dword_269DEE74C;
  }
  float v8 = (float)((v6 - v2)
             * LogRetrySetDeviceIDState(BOOL,unsigned int,unsigned long long)::sTimebaseInfo
             / v7);
  AudioObjectID v9 = sIsolatedCoreAudioLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v10) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136315906;
    int16x8_t v16 = "ServerSideHardware.cpp";
    __int16 v17 = 1024;
    int v18 = 39;
    __int16 v19 = 1024;
    int v20 = v3;
    __int16 v21 = 2048;
    double v22 = v8 / 1000000000.0;
    AudioObjectID v11 = "%25s:%-5d LogRetrySetDeviceIDState - Successfully set device ID after %u tries in %f seconds";
  }
  else
  {
    if (!v10) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136315906;
    int16x8_t v16 = "ServerSideHardware.cpp";
    __int16 v17 = 1024;
    int v18 = 45;
    __int16 v19 = 1024;
    int v20 = v3;
    __int16 v21 = 2048;
    double v22 = v8 / 1000000000.0;
    AudioObjectID v11 = "%25s:%-5d LogRetrySetDeviceIDState - Failed to set device ID for use case ID for %u tries in %f seconds";
  }
  _os_log_impl(&dword_25439F000, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 0x22u);
LABEL_14:
  if (v14)
  {
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
  }
}

void sub_2543A1CE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
}

void ServerSideHardware::RegisterUseCaseID(ServerSideHardware *this@<X0>, int a2@<W1>, void *a3@<X8>)
{
  int v43 = a2;
  uint64_t v5 = *((void *)this + 17);
  if (!v5) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v5 + 48))(&v41);
  uint64_t v8 = v41;
  unsigned int v7 = v42;
  if (v42) {
    atomic_fetch_add_explicit(&v42->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  std::mutex::lock((std::mutex *)((char *)this + 48));
  AudioObjectID v9 = (void **)((char *)this + 8);
  unint64_t v10 = *(unsigned int *)(v8 + 8);
  if (std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>>>::find<unsigned int>((void *)this + 1, *(_DWORD *)(v8 + 8)))
  {
    goto LABEL_82;
  }
  unint64_t v11 = *((void *)this + 2);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v3 = v10;
      if (v11 <= v10) {
        unint64_t v3 = v10 % v11;
      }
    }
    else
    {
      unint64_t v3 = (v11 - 1) & v10;
    }
    char v13 = (void **)*((void *)*v9 + v3);
    if (v13)
    {
      for (i = *v13; i; i = *(void **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v10)
        {
          if (*((_DWORD *)i + 4) == v10) {
            goto LABEL_78;
          }
        }
        else
        {
          if (v12.u32[0] > 1uLL)
          {
            if (v15 >= v11) {
              v15 %= v11;
            }
          }
          else
          {
            v15 &= v11 - 1;
          }
          if (v15 != v3) {
            break;
          }
        }
      }
    }
  }
  i = operator new(0x28uLL);
  v40 = (void *)((char *)this + 24);
  *(void *)i = 0;
  *((void *)i + 1) = v10;
  *((_DWORD *)i + 4) = v10;
  *((void *)i + 3) = 0;
  *((void *)i + 4) = 0;
  float v16 = (float)(unint64_t)(*((void *)this + 4) + 1);
  float v17 = *((float *)this + 10);
  if (v11 && (float)(v17 * (float)v11) >= v16)
  {
    unint64_t v10 = v3;
    goto LABEL_68;
  }
  BOOL v18 = 1;
  if (v11 >= 3) {
    BOOL v18 = (v11 & (v11 - 1)) != 0;
  }
  unint64_t v19 = v18 | (2 * v11);
  unint64_t v20 = vcvtps_u32_f32(v16 / v17);
  if (v19 <= v20) {
    int8x8_t prime = (int8x8_t)v20;
  }
  else {
    int8x8_t prime = (int8x8_t)v19;
  }
  if (*(void *)&prime == 1)
  {
    int8x8_t prime = (int8x8_t)2;
  }
  else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    unint64_t v11 = *((void *)this + 2);
  }
  if (*(void *)&prime <= v11)
  {
    if (*(void *)&prime >= v11) {
      goto LABEL_64;
    }
    unint64_t v28 = vcvtps_u32_f32((float)*((unint64_t *)this + 4) / *((float *)this + 10));
    if (v11 < 3 || (uint8x8_t v29 = (uint8x8_t)vcnt_s8((int8x8_t)v11), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
    {
      unint64_t v28 = std::__next_prime(v28);
    }
    else
    {
      uint64_t v30 = 1 << -(char)__clz(v28 - 1);
      if (v28 >= 2) {
        unint64_t v28 = v30;
      }
    }
    if (*(void *)&prime <= v28) {
      int8x8_t prime = (int8x8_t)v28;
    }
    if (*(void *)&prime >= v11)
    {
      unint64_t v11 = *((void *)this + 2);
      goto LABEL_64;
    }
    if (!*(void *)&prime)
    {
      v39 = *v9;
      NSObject *v9 = 0;
      if (v39) {
        operator delete(v39);
      }
      unint64_t v11 = 0;
      *((void *)this + 2) = 0;
      goto LABEL_64;
    }
  }
  if (*(void *)&prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  double v22 = operator new(8 * *(void *)&prime);
  uint64_t v23 = *v9;
  NSObject *v9 = v22;
  if (v23) {
    operator delete(v23);
  }
  uint64_t v24 = 0;
  *((int8x8_t *)this + 2) = prime;
  do
    *((void *)*v9 + v24++) = 0;
  while (*(void *)&prime != v24);
  uint64_t v25 = (void *)*v40;
  if (*v40)
  {
    unint64_t v26 = v25[1];
    uint8x8_t v27 = (uint8x8_t)vcnt_s8(prime);
    v27.i16[0] = vaddlv_u8(v27);
    if (v27.u32[0] > 1uLL)
    {
      if (v26 >= *(void *)&prime) {
        v26 %= *(void *)&prime;
      }
    }
    else
    {
      v26 &= *(void *)&prime - 1;
    }
    *((void *)*v9 + v26) = v40;
    int v31 = (void *)*v25;
    if (*v25)
    {
      do
      {
        unint64_t v32 = v31[1];
        if (v27.u32[0] > 1uLL)
        {
          if (v32 >= *(void *)&prime) {
            v32 %= *(void *)&prime;
          }
        }
        else
        {
          v32 &= *(void *)&prime - 1;
        }
        if (v32 != v26)
        {
          if (!*((void *)*v9 + v32))
          {
            *((void *)*v9 + v32) = v25;
            goto LABEL_60;
          }
          *uint64_t v25 = *v31;
          *int v31 = **((void **)*v9 + v32);
          **((void **)*v9 + v32) = v31;
          int v31 = v25;
        }
        unint64_t v32 = v26;
LABEL_60:
        uint64_t v25 = v31;
        int v31 = (void *)*v31;
        unint64_t v26 = v32;
      }
      while (v31);
    }
  }
  unint64_t v11 = (unint64_t)prime;
LABEL_64:
  if ((v11 & (v11 - 1)) != 0)
  {
    if (v11 <= v10) {
      v10 %= v11;
    }
  }
  else
  {
    unint64_t v10 = (v11 - 1) & v10;
  }
LABEL_68:
  v33 = *v9;
  uint64_t v34 = (void *)*((void *)*v9 + v10);
  if (v34)
  {
    *(void *)i = *v34;
  }
  else
  {
    *(void *)i = *v40;
    void *v40 = i;
    v33[v10] = v40;
    if (!*(void *)i) {
      goto LABEL_77;
    }
    unint64_t v35 = *(void *)(*(void *)i + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v35 >= v11) {
        v35 %= v11;
      }
    }
    else
    {
      v35 &= v11 - 1;
    }
    uint64_t v34 = (char *)*v9 + 8 * v35;
  }
  *uint64_t v34 = i;
LABEL_77:
  ++*((void *)this + 4);
LABEL_78:
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v36 = (std::__shared_weak_count *)*((void *)i + 4);
  *((void *)i + 3) = v8;
  *((void *)i + 4) = v7;
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }
LABEL_82:
  std::mutex::unlock((std::mutex *)((char *)this + 48));
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  v37 = v42;
  if (v41) {
    uint64_t v38 = v41 + 8;
  }
  else {
    uint64_t v38 = 0;
  }
  *a3 = v38;
  a3[1] = v37;
}

void sub_2543A21C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,void *>>>::operator()[abi:ne180100](1, v13);
  std::mutex::unlock(v12);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a11);
  }
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,void *>>>::operator()[abi:ne180100](char a1, void *__p)
{
  if (a1)
  {
    unint64_t v3 = (std::__shared_weak_count *)__p[4];
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x25A276FE0);
}

void ServerSideHardware::~ServerSideHardware(ServerSideHardware *this)
{
  *(void *)this = &unk_2703C2D68;
  uint64_t v2 = (std::mutex *)((char *)this + 48);
  std::__function::__value_func<std::shared_ptr<HALUseCase> ()>::~__value_func[abi:ne180100]((void *)this + 14);
  std::mutex::~mutex(v2);
  std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>>>::~__hash_table((uint64_t)this + 8);
  JUMPOUT(0x25A276FE0);
}

{
  std::mutex *v2;

  *(void *)this = &unk_2703C2D68;
  uint64_t v2 = (std::mutex *)((char *)this + 48);
  std::__function::__value_func<std::shared_ptr<HALUseCase> ()>::~__value_func[abi:ne180100]((void *)this + 14);
  std::mutex::~mutex(v2);
  std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>>>::~__hash_table((uint64_t)this + 8);
}

void *std::__function::__value_func<std::shared_ptr<HALUseCase> ()(unsigned int)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      uint64_t v4 = (std::__shared_weak_count *)v2[4];
      if (v4) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = 0;
  if (v5) {
    operator delete(v5);
  }
  return a1;
}

void *std::__function::__func<ServerSideHardware::ServerSideHardware(void)::$_0,std::allocator<ServerSideHardware::ServerSideHardware(void)::$_0>,std::shared_ptr<HALUseCase> ()(unsigned int)>::target_type()
{
}

uint64_t std::__function::__func<ServerSideHardware::ServerSideHardware(void)::$_0,std::allocator<ServerSideHardware::ServerSideHardware(void)::$_0>,std::shared_ptr<HALUseCase> ()(unsigned int)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN18ServerSideHardwareC1EvE3$_0")) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void std::__function::__func<ServerSideHardware::ServerSideHardware(void)::$_0,std::allocator<ServerSideHardware::ServerSideHardware(void)::$_0>,std::shared_ptr<HALUseCase> ()(unsigned int)>::operator()(uint64_t a1, int *a2)
{
  int v2 = *a2;
  unint64_t v3 = operator new(0x50uLL);
  v3[1] = 0;
  v3[2] = 0;
  *unint64_t v3 = &unk_2703C3440;
  *((_DWORD *)v3 + 8) = v2;
  v3[3] = &unk_2703C2688;
  operator new();
}

void sub_2543A2658(_Unwind_Exception *a1)
{
  std::unique_ptr<CoreAudioCallback>::reset[abi:ne180100](v2);
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v4);
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_emplace<HALUseCase>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<HALUseCase>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C3440;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x25A276FE0);
}

void std::__shared_ptr_emplace<HALUseCase>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C3440;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__function::__func<ServerSideHardware::ServerSideHardware(void)::$_0,std::allocator<ServerSideHardware::ServerSideHardware(void)::$_0>,std::shared_ptr<HALUseCase> ()(unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_2703C26B0;
}

void *std::__function::__func<ServerSideHardware::ServerSideHardware(void)::$_0,std::allocator<ServerSideHardware::ServerSideHardware(void)::$_0>,std::shared_ptr<HALUseCase> ()(unsigned int)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_2703C26B0;
  return result;
}

void std::__function::__func<ServerSideHardware::ServerSideHardware(void)::$_0,std::allocator<ServerSideHardware::ServerSideHardware(void)::$_0>,std::shared_ptr<HALUseCase> ()(unsigned int)>::~__func()
{
}

void sub_2543A282C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2543A2924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2543A2A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2543A2BE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2543A2C7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2543A2D48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t IsolatedCoreAudioClientExclaveKitProxy::anchor(IsolatedCoreAudioClientExclaveKitProxy *this)
{
  uint64_t result = tb_client_connection_message_construct();
  if (!result)
  {
    tb_message_encode_u64();
    tb_message_encode_u64();
    tb_message_complete();
    tb_connection_send_query();
    return tb_client_connection_message_destruct();
  }
  return result;
}

uint64_t IsolatedCoreAudioClientExclaveKitProxy::ferryIsolatedAudioDataToScopedSinkFromSampleTime(IsolatedCoreAudioClientExclaveKitProxy *this)
{
  uint64_t result = tb_client_connection_message_construct();
  if (!result)
  {
    tb_message_encode_u64();
    tb_message_complete();
    tb_connection_send_query();
    return tb_client_connection_message_destruct();
  }
  return result;
}

uint64_t IsolatedCoreAudioClientExclaveKitProxy::ferryIsolatedAudioDataToSinkFromSampleTime()
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000;
  int v10 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  uint64_t v4 = ___ZN38IsolatedCoreAudioClientExclaveKitProxy42ferryIsolatedAudioDataToSinkFromSampleTimeE18CoreAudioTimestamp_block_invoke;
  uint64_t v5 = &unk_2653A8110;
  uint64_t v6 = &v7;
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  memset(buf, 0, sizeof(buf));
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_encode_u64();
    tb_message_complete();
    uint64_t v11 = 0;
    if ((tb_connection_send_query() & 0xFFFFFFF7) == 0 && v11)
    {
      unsigned int v18 = 0;
      tb_message_decode_s32();
      if (v18 >= 6)
      {
        printf("TB_FATAL: invalid value: unexpected case value, %llx (%s:%d)\n", (int)v18, "/Library/Caches/com.apple.xbs/Binaries/IsolatedCoreAudioClient/install/TempContent/Objects/IsolatedCoreAudioClient.build/IsolatedCoreAudioClient.build/DerivedSources/IsolatedCoreAudioClient_C.c", 79);
        uint64_t result = _os_crash();
        __break(1u);
        return result;
      }
      ((void (*)(void *))v4)(v3);
    }
    tb_client_connection_message_destruct();
  }
  uint64_t v0 = *((unsigned int *)v8 + 6);
  if (v0)
  {
    v1 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "IsolatedCoreAudioClientExclaveKitProxy.cpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 61;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v0;
      _os_log_impl(&dword_25439F000, v1, OS_LOG_TYPE_DEFAULT, "%25s:%-5d translateFerryToSinkStatus encountered an error! Result: %d", buf, 0x18u);
    }
  }
  _Block_object_dispose(&v7, 8);
  return v0;
}

uint64_t ___ZN38IsolatedCoreAudioClientExclaveKitProxy42ferryIsolatedAudioDataToSinkFromSampleTimeE18CoreAudioTimestamp_block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t IsolatedCoreAudioClientExclaveKitProxy::ferryIsolatedAudioDataFromSourceAtSampleTime(IsolatedCoreAudioClientExclaveKitProxy *this)
{
  uint64_t result = tb_client_connection_message_construct();
  if (!result)
  {
    tb_message_encode_u64();
    tb_message_complete();
    tb_connection_send_query();
    return tb_client_connection_message_destruct();
  }
  return result;
}

void IsolatedCoreAudioClientExclaveKitProxy::~IsolatedCoreAudioClientExclaveKitProxy(IsolatedCoreAudioClientExclaveKitProxy *this)
{
  IsolatedCoreAudioClientExclaveKitProxy::~IsolatedCoreAudioClientExclaveKitProxy(this);
  JUMPOUT(0x25A276FE0);
}

{
  *(void *)this = &unk_2703C2FE0;
  tb_endpoint_destruct();
  *((void *)this + 2) = 0;
}

uint64_t std::__function::__value_func<long long ()(void)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void *std::__function::__value_func<long long ()(void)>::~__value_func[abi:ne180100](void *a1)
{
  int v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t IOThread::IOThread(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = 0;
  *(unsigned char *)(a1 + 4) = 0;
  *(void *)(a1 + 8) = 0;
  std::__function::__value_func<long long ()(void)>::__value_func[abi:ne180100](a1 + 16, a2);
  std::__function::__value_func<long long ()(void)>::__value_func[abi:ne180100](a1 + 48, a2 + 32);
  std::__function::__value_func<long long ()(void)>::__value_func[abi:ne180100](a1 + 80, a2 + 64);
  uint64_t v4 = *(void *)(a2 + 120);
  if (v4)
  {
    if (v4 == a2 + 96)
    {
      *(void *)(a1 + 136) = a1 + 112;
      (*(void (**)(void))(**(void **)(a2 + 120) + 24))(*(void *)(a2 + 120));
      return a1;
    }
    uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 16))(v4);
  }
  *(void *)(a1 + 136) = v4;
  return a1;
}

void sub_2543A355C(_Unwind_Exception *a1)
{
  std::__function::__value_func<long long ()(void)>::~__value_func[abi:ne180100](v3);
  std::__function::__value_func<long long ()(void)>::~__value_func[abi:ne180100](v2);
  std::__function::__value_func<long long ()(void)>::~__value_func[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void *std::__function::__value_func<long long ()(long long)>::~__value_func[abi:ne180100](void *a1)
{
  int v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t IOThread::workloop(IOThread *this, void *a2)
{
  uint64_t v3 = *((void *)this + 9);
  if (!v3) {
LABEL_10:
  }
    std::__throw_bad_function_call[abi:ne180100]();
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void *))(*(void *)v3 + 48))(v3, a2);
  if (v4)
  {
LABEL_7:
    IOThread::exitWorkloopPrematurely(this, v4);
  }
  else
  {
    atomic_exchange((atomic_uint *volatile)this, 2u);
    while (1)
    {
      unsigned __int8 v5 = atomic_load((unsigned __int8 *)this + 4);
      if (v5) {
        break;
      }
      uint64_t v6 = *((void *)this + 13);
      if (!v6) {
        goto LABEL_10;
      }
      uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 48))(v6);
      if (v4) {
        goto LABEL_7;
      }
    }
    std::function<long long ()(long long)>::operator()(*((void *)this + 17), 0);
  }
  return 0;
}

pthread_t IOThread::exitWorkloopPrematurely(IOThread *this, uint64_t a2)
{
  pthread_t result = pthread_self();
  if (result == *((pthread_t *)this + 1))
  {
    atomic_store(1u, (unsigned __int8 *)this + 4);
    std::function<long long ()(long long)>::operator()(*((void *)this + 17), a2);
    *((void *)this + 1) = 0;
    atomic_exchange((atomic_uint *volatile)this, 0);
    pthread_exit(0);
  }
  return result;
}

uint64_t std::function<long long ()(long long)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if (!a1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)a1 + 48))(a1, &v3);
}

void *_ZNKSt3__110__function6__funcIN17CoreAudioCallback19mCallbackConnectionMUldyE_ENS_9allocatorIS3_EEFvdyEE11target_typeEv()
{
  return &_ZTIN17CoreAudioCallback19mCallbackConnectionMUldyE_E;
}

uint64_t _ZNKSt3__110__function6__funcIN17CoreAudioCallback19mCallbackConnectionMUldyE_ENS_9allocatorIS3_EEFvdyEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"N17CoreAudioCallback19mCallbackConnectionMUldyE_E"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void _ZNKSt3__110__function6__funcIN17CoreAudioCallback19mCallbackConnectionMUldyE_ENS_9allocatorIS3_EEFvdyEE7__cloneEPNS0_6__baseIS6_EE(uint64_t a1, void *a2)
{
  *a2 = &unk_2703C3C70;
}

void *_ZNKSt3__110__function6__funcIN17CoreAudioCallback19mCallbackConnectionMUldyE_ENS_9allocatorIS3_EEFvdyEE7__cloneEv()
{
  pthread_t result = operator new(0x10uLL);
  void *result = &unk_2703C3C70;
  return result;
}

void _ZNSt3__110__function6__funcIN17CoreAudioCallback19mCallbackConnectionMUldyE_ENS_9allocatorIS3_EEFvdyEED0Ev()
{
}

void IsolatedCoreAudioXPCServerProtocolConnection::setRemoteObjectInterface(IsolatedCoreAudioXPCServerProtocolConnection *this, NSXPCConnection *a2)
{
  uint64_t v3 = a2;
  int v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2703C6DD0];
  [(NSXPCConnection *)v3 setRemoteObjectInterface:v2];
}

void sub_2543A38A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void IsolatedCoreAudioXPCServerProtocolConnection::setProxy(id *this, objc_object *a2)
{
}

void IsolatedCoreAudioXPCServerProtocolConnection::~IsolatedCoreAudioXPCServerProtocolConnection(id *this)
{
  IsolatedCoreAudioClientBaseNSXPCConnection::~IsolatedCoreAudioClientBaseNSXPCConnection(this);
  JUMPOUT(0x25A276FE0);
}

{
  uint64_t vars8;

  IsolatedCoreAudioClientBaseNSXPCConnection::~IsolatedCoreAudioClientBaseNSXPCConnection(this);
}

void IOThreadServerSynchronizer::~IOThreadServerSynchronizer(IOThreadServerSynchronizer *this)
{
  IOThreadSynchronizer::~IOThreadSynchronizer(this);
  JUMPOUT(0x25A276FE0);
}

uint64_t std::shared_ptr<caulk::mach::semaphore>::operator=[abi:ne180100]<caulk::mach::semaphore,std::default_delete<caulk::mach::semaphore>,void>(uint64_t a1, void *a2)
{
  if (*a2) {
    operator new();
  }
  *a2 = 0;
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = 0u;
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return a1;
}

uint64_t std::unique_ptr<caulk::mach::semaphore>::reset[abi:ne180100](uint64_t *a1)
{
  uint64_t result = *a1;
  *a1 = 0;
  if (result)
  {
    MEMORY[0x25A276E00]();
    JUMPOUT(0x25A276FE0);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<caulk::mach::semaphore  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"NSt3__114default_deleteIN5caulk4mach9semaphoreEEE"))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<caulk::mach::semaphore  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    MEMORY[0x25A276E00]();
    JUMPOUT(0x25A276FE0);
  }
  return result;
}

void std::__shared_ptr_pointer<caulk::mach::semaphore  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x25A276FE0);
}

uint64_t std::function<void ()(CoreAudioTimestamp)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[0] = a2;
  v4[1] = a3;
  if (!a1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, void *))(*(void *)a1 + 48))(a1, v4);
}

void IsolatedCoreAudioXPCPortal::~IsolatedCoreAudioXPCPortal(id *this)
{
  IsolatedCoreAudioXPCPortal::~IsolatedCoreAudioXPCPortal(this);
  JUMPOUT(0x25A276FE0);
}

{
  *this = &unk_2703C36D8;
  [this[2] invalidate];
}

void IsolatedCoreAudioXPCPortal::IsolatedCoreAudioXPCPortal(IsolatedCoreAudioXPCPortal *this, NSXPCListener *a2, IsolatedCoreAudioClientNSXPCListenerDelegate *a3)
{
  uint64_t v6 = a2;
  uint64_t v7 = a3;
  *(void *)this = &unk_2703C36D8;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  objc_storeStrong((id *)this + 2, a2);
  objc_storeStrong((id *)this + 1, a3);
  [*((id *)this + 2) setDelegate:*((void *)this + 1)];
  [*((id *)this + 2) resume];
}

void sub_2543A3D68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void IsolatedCoreAudioClientBaseNSXPCConnection::~IsolatedCoreAudioClientBaseNSXPCConnection(id *this)
{
}

void IsolatedCoreAudioClientBaseNSXPCConnection::makeConnection(uint64_t a1, uint64_t a2)
{
  v18[4] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 16);
  id v5 = objc_alloc(MEMORY[0x263F08D68]);
  if (v4) {
    uint64_t v6 = [v5 initWithListenerEndpoint:*(void *)(a1 + 16)];
  }
  else {
    uint64_t v6 = [v5 initWithMachServiceName:*(void *)(a1 + 24) options:4096];
  }
  uint64_t v7 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v6;

  (*(void (**)(uint64_t, void))(*(void *)a1 + 24))(a1, *(void *)(a1 + 8));
  id v8 = *(id *)(a1 + 8);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3321888768;
  long long v16 = ___ZZN42IsolatedCoreAudioClientBaseNSXPCConnection14makeConnectionENSt3__18functionIFvvEEEENK3__0cvU13block_pointerS2_Ev_block_invoke;
  uint64_t v17 = &__block_descriptor_40_ea8_32c96_ZTSKZN42IsolatedCoreAudioClientBaseNSXPCConnection14makeConnectionENSt3__18functionIFvvEEEE3__0_e5_v8__0l;
  v18[0] = v8;
  id v9 = v8;
  int v10 = (void *)MEMORY[0x25A2772C0](&v14);

  [*(id *)(a1 + 8) setInterruptionHandler:v10];
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v13, a2);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3321888768;
  long long v16 = ___ZZN42IsolatedCoreAudioClientBaseNSXPCConnection14makeConnectionENSt3__18functionIFvvEEEENK3__1cvU13block_pointerS2_Ev_block_invoke;
  uint64_t v17 = &__block_descriptor_64_ea8_32c96_ZTSKZN42IsolatedCoreAudioClientBaseNSXPCConnection14makeConnectionENSt3__18functionIFvvEEEE3__1_e5_v8__0l;
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v18, (uint64_t)v13);
  uint64_t v11 = (void *)MEMORY[0x25A2772C0](&v14);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v18);
  [*(id *)(a1 + 8) setInvalidationHandler:v11];

  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v13);
  [*(id *)(a1 + 8) resume];
  long long v12 = [*(id *)(a1 + 8) synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global];
  (*(void (**)(uint64_t, void *))(*(void *)a1 + 16))(a1, v12);
}

void sub_2543A3FFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZZN42IsolatedCoreAudioClientBaseNSXPCConnection14makeConnectionENSt3__18functionIFvvEEEENK3__0cvU13block_pointerS2_Ev_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t ___ZZN42IsolatedCoreAudioClientBaseNSXPCConnection14makeConnectionENSt3__18functionIFvvEEEENK3__1cvU13block_pointerS2_Ev_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (!v1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  int v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);
  return v2();
}

void ___ZN42IsolatedCoreAudioClientBaseNSXPCConnection14makeConnectionENSt3__18functionIFvvEEE_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315394;
    long long v13 = "IsolatedCoreAudioClientBaseNSXPCConnection.mm";
    __int16 v14 = 1024;
    int v15 = 48;
    _os_log_impl(&dword_25439F000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Attempt to connect to IsolatedAudio sever via XPC failed.", (uint8_t *)&v12, 0x12u);
  }

  uint64_t v4 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = [v2 code];
    int v12 = 136315650;
    long long v13 = "IsolatedCoreAudioClientBaseNSXPCConnection.mm";
    __int16 v14 = 1024;
    int v15 = 49;
    __int16 v16 = 2048;
    uint64_t v17 = v5;
    _os_log_impl(&dword_25439F000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d  Code:\t\t\t%ld", (uint8_t *)&v12, 0x1Cu);
  }

  uint64_t v6 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [v2 localizedDescription];
    int v12 = 136315650;
    long long v13 = "IsolatedCoreAudioClientBaseNSXPCConnection.mm";
    __int16 v14 = 1024;
    int v15 = 50;
    __int16 v16 = 2112;
    uint64_t v17 = (uint64_t)v7;
    _os_log_impl(&dword_25439F000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d  Description:\t%@", (uint8_t *)&v12, 0x1Cu);
  }
  id v8 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = [v2 localizedFailureReason];
    int v12 = 136315650;
    long long v13 = "IsolatedCoreAudioClientBaseNSXPCConnection.mm";
    __int16 v14 = 1024;
    int v15 = 51;
    __int16 v16 = 2112;
    uint64_t v17 = (uint64_t)v9;
    _os_log_impl(&dword_25439F000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d  Reason:\t\t%@", (uint8_t *)&v12, 0x1Cu);
  }
  int v10 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = [v2 localizedRecoverySuggestion];
    int v12 = 136315650;
    long long v13 = "IsolatedCoreAudioClientBaseNSXPCConnection.mm";
    __int16 v14 = 1024;
    int v15 = 52;
    __int16 v16 = 2112;
    uint64_t v17 = (uint64_t)v11;
    _os_log_impl(&dword_25439F000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d  Suggestion:\t%@", (uint8_t *)&v12, 0x1Cu);
  }
}

void sub_2543A4410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sIsolatedCoreAudioLog()
{
  unint64_t v0 = 0x269DEE000uLL;
  {
    unint64_t v0 = 0x269DEE000;
    if (v3)
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudio");
      unint64_t v0 = 0x269DEE000;
    }
  }
  uint64_t v1 = *(void **)(v0 + 1904);
  return v1;
}

{
  unint64_t v0;
  void *v1;
  int v3;
  uint64_t vars8;

  unint64_t v0 = 0x269DEE000uLL;
  {
    unint64_t v0 = 0x269DEE000;
    if (v3)
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudio");
      unint64_t v0 = 0x269DEE000;
    }
  }
  uint64_t v1 = *(void **)(v0 + 1920);
  return v1;
}

{
  unint64_t v0;
  void *v1;
  int v3;
  uint64_t vars8;

  unint64_t v0 = 0x269DEE000uLL;
  {
    unint64_t v0 = 0x269DEE000;
    if (v3)
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudio");
      unint64_t v0 = 0x269DEE000;
    }
  }
  uint64_t v1 = *(void **)(v0 + 1968);
  return v1;
}

{
  unint64_t v0;
  void *v1;
  int v3;
  uint64_t vars8;

  unint64_t v0 = 0x269DEE000uLL;
  {
    unint64_t v0 = 0x269DEE000;
    if (v3)
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudio");
      unint64_t v0 = 0x269DEE000;
    }
  }
  uint64_t v1 = *(void **)(v0 + 1984);
  return v1;
}

{
  unint64_t v0;
  void *v1;
  int v3;
  uint64_t vars8;

  unint64_t v0 = 0x269DEE000uLL;
  {
    unint64_t v0 = 0x269DEE000;
    if (v3)
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudio");
      unint64_t v0 = 0x269DEE000;
    }
  }
  uint64_t v1 = *(void **)(v0 + 2032);
  return v1;
}

{
  unint64_t v0;
  void *v1;
  int v3;
  uint64_t vars8;

  unint64_t v0 = 0x269DEE000uLL;
  {
    unint64_t v0 = 0x269DEE000;
    if (v3)
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudio");
      unint64_t v0 = 0x269DEE000;
    }
  }
  uint64_t v1 = *(void **)(v0 + 2048);
  return v1;
}

void *__destroy_helper_block_ea8_32c96_ZTSKZN42IsolatedCoreAudioClientBaseNSXPCConnection14makeConnectionENSt3__18functionIFvvEEEE3__1(uint64_t a1)
{
  return std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)(a1 + 32));
}

uint64_t __copy_helper_block_ea8_32c96_ZTSKZN42IsolatedCoreAudioClientBaseNSXPCConnection14makeConnectionENSt3__18functionIFvvEEEE3__1(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](a1 + 32, a2 + 32);
}

void __destroy_helper_block_ea8_32c96_ZTSKZN42IsolatedCoreAudioClientBaseNSXPCConnection14makeConnectionENSt3__18functionIFvvEEEE3__0(uint64_t a1)
{
}

id __copy_helper_block_ea8_32c96_ZTSKZN42IsolatedCoreAudioClientBaseNSXPCConnection14makeConnectionENSt3__18functionIFvvEEEE3__0(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a2 + 32);
  *(void *)(a1 + 32) = result;
  return result;
}

void *std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](void *a1)
{
  id v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void sub_2543A486C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void sub_2543A497C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2543A4A04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2543A4AA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2543A4B30(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_2543A4DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  uint64_t v30 = v28;

  objc_sync_exit(v29);
  _Block_object_dispose(&a21, 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_2543A5120(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t std::function<void ()(int)>::operator()(uint64_t a1, int a2)
{
  int v3 = a2;
  if (!a1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, int *))(*(void *)a1 + 48))(a1, &v3);
}

void sub_2543A52B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100]((uint64_t *)va);

  _Unwind_Resume(a1);
}

void CreateIsolatedAudioServicePortal()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  unint64_t v0 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "IsolatedCoreAudioServiceLauncher.mm";
    __int16 v4 = 1024;
    int v5 = 20;
    _os_log_impl(&dword_25439F000, v0, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Received CreateIsolatedAudioServicePortal request", buf, 0x12u);
  }

  if (atomic_load_explicit((atomic_ullong *volatile)&serviceFlag, memory_order_acquire) != -1)
  {
    *(void *)buf = &v1;
    id v2 = buf;
    std::__call_once(&serviceFlag, &v2, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<CreateIsolatedAudioServicePortal::$_0 &&>>);
  }
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<CreateIsolatedAudioServicePortal::$_0 &&>>()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v0 = MGGetBoolAnswer();
  char v1 = sIsolatedCoreAudioLog();
  BOOL v2 = os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    if (v2)
    {
      int v3 = 136315394;
      __int16 v4 = "IsolatedCoreAudioServiceLauncher.mm";
      __int16 v5 = 1024;
      int v6 = 25;
      _os_log_impl(&dword_25439F000, v1, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CreateIsolatedAudioServicePortal allocating portal", (uint8_t *)&v3, 0x12u);
    }

    operator new();
  }
  if (v2)
  {
    int v3 = 136315394;
    __int16 v4 = "IsolatedCoreAudioServiceLauncher.mm";
    __int16 v5 = 1024;
    int v6 = 30;
    _os_log_impl(&dword_25439F000, v1, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CreateIsolatedAudioServicePortal unsupported", (uint8_t *)&v3, 0x12u);
  }
}

void sub_2543A570C(_Unwind_Exception *a1)
{
  __int16 v4 = v3;

  MEMORY[0x25A276FE0](v1, 0x81C40D6874129);
  _Unwind_Resume(a1);
}

void CreateIsolatedAudioSiphonPortal()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v0 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "IsolatedCoreAudioServiceLauncher.mm";
    __int16 v4 = 1024;
    int v5 = 37;
    _os_log_impl(&dword_25439F000, v0, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Received CreateIsolatedAudioSiphonPortal request", buf, 0x12u);
  }

  if (atomic_load_explicit((atomic_ullong *volatile)&siphonFlag, memory_order_acquire) != -1)
  {
    *(void *)buf = &v1;
    BOOL v2 = buf;
    std::__call_once(&siphonFlag, &v2, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<CreateIsolatedAudioSiphonPortal::$_0 &&>>);
  }
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<CreateIsolatedAudioSiphonPortal::$_0 &&>>()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v0 = MGGetBoolAnswer();
  char v1 = sIsolatedCoreAudioLog();
  BOOL v2 = os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    if (v2)
    {
      int v3 = 136315394;
      __int16 v4 = "IsolatedCoreAudioServiceLauncher.mm";
      __int16 v5 = 1024;
      int v6 = 42;
      _os_log_impl(&dword_25439F000, v1, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CreateIsolatedAudioSiphonPortal allocating portal", (uint8_t *)&v3, 0x12u);
    }

    operator new();
  }
  if (v2)
  {
    int v3 = 136315394;
    __int16 v4 = "IsolatedCoreAudioServiceLauncher.mm";
    __int16 v5 = 1024;
    int v6 = 47;
    _os_log_impl(&dword_25439F000, v1, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CreateIsolatedAudioSiphonPortal unsupported", (uint8_t *)&v3, 0x12u);
  }
}

void sub_2543A5A3C(_Unwind_Exception *a1)
{
  __int16 v4 = v3;

  MEMORY[0x25A276FE0](v1, 0x81C40D6874129);
  _Unwind_Resume(a1);
}

void CreateMicrophoneActivityPortal()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v0 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "IsolatedCoreAudioServiceLauncher.mm";
    __int16 v4 = 1024;
    int v5 = 54;
    _os_log_impl(&dword_25439F000, v0, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Received CreateMicrophoneActivityPortal request", buf, 0x12u);
  }

  if (atomic_load_explicit((atomic_ullong *volatile)&micActivityFlag, memory_order_acquire) != -1)
  {
    *(void *)buf = &v1;
    BOOL v2 = buf;
    std::__call_once(&micActivityFlag, &v2, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<CreateMicrophoneActivityPortal::$_0 &&>>);
  }
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<CreateMicrophoneActivityPortal::$_0 &&>>()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v0 = MGGetBoolAnswer();
  char v1 = sIsolatedCoreAudioLog();
  BOOL v2 = os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    if (v2)
    {
      int v3 = 136315394;
      __int16 v4 = "IsolatedCoreAudioServiceLauncher.mm";
      __int16 v5 = 1024;
      int v6 = 59;
      _os_log_impl(&dword_25439F000, v1, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CreateMicrophoneActivityPortal allocating portal", (uint8_t *)&v3, 0x12u);
    }

    operator new();
  }
  if (v2)
  {
    int v3 = 136315394;
    __int16 v4 = "IsolatedCoreAudioServiceLauncher.mm";
    __int16 v5 = 1024;
    int v6 = 64;
    _os_log_impl(&dword_25439F000, v1, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CreateMicrophoneActivityPortal unsupported", (uint8_t *)&v3, 0x12u);
  }
}

void sub_2543A5D6C(_Unwind_Exception *a1)
{
  __int16 v4 = v3;

  MEMORY[0x25A276FE0](v1, 0x81C40D6874129);
  _Unwind_Resume(a1);
}

void AudioClient::stop(AudioClient *this)
{
  (*(void (**)(void))(**((void **)this + 5) + 56))(*((void *)this + 5));
  BOOL v2 = *((void *)this + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN11AudioClient4stopEvE3__0EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
  block[3] = &__block_descriptor_tmp_188;
  block[4] = &v3;
  dispatch_sync(v2, block);
}

uint64_t AudioClient::startAtTime(AudioClient *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 5) + 48))();
}

uint64_t AudioClient::start(AudioClient *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 5) + 40))();
}

uint64_t AudioClient::writeToClientBufferFromRingBuffer(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 48) + 32))();
}

void *AudioClient::setLapseCallback(AudioClient *this, void (*a2)(int, void *), void *a3)
{
  v5[4] = *MEMORY[0x263EF8340];
  *((void *)this + 3) = a2;
  *((void *)this + 4) = a3;
  uint64_t v3 = *((void *)this + 5);
  v5[0] = &unk_2703C3840;
  v5[1] = this;
  v5[3] = v5;
  (*(void (**)(uint64_t, void *))(*(void *)v3 + 32))(v3, v5);
  return std::__function::__value_func<void ()(LapseChain)>::~__value_func[abi:ne180100](v5);
}

void sub_2543A5FB0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(LapseChain)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *std::__function::__value_func<void ()(LapseChain)>::~__value_func[abi:ne180100](void *a1)
{
  BOOL v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void *std::__function::__func<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0,std::allocator<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0>,void ()(LapseChain)>::target_type()
{
}

uint64_t std::__function::__func<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0,std::allocator<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0>,void ()(LapseChain)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN11AudioClient16setLapseCallbackEPFviPvES0_E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0,std::allocator<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0>,void ()(LapseChain)>::operator()(uint64_t a1, unsigned int *a2)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 8) + 24))(*a2, *(void *)(*(void *)(a1 + 8) + 16));
}

uint64_t std::__function::__func<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0,std::allocator<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0>,void ()(LapseChain)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_2703C3840;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0,std::allocator<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0>,void ()(LapseChain)>::__clone(uint64_t a1)
{
  id result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_2703C3840;
  result[1] = v3;
  return result;
}

void std::__function::__func<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0,std::allocator<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0>,void ()(LapseChain)>::~__func()
{
}

void *AudioClient::setAsyncIOCallback(void *a1, uint64_t a2, uint64_t a3)
{
  v6[4] = *MEMORY[0x263EF8340];
  a1[1] = a2;
  a1[2] = a3;
  v6[0] = &unk_2703C31B0;
  v6[1] = a1;
  void v6[3] = v6;
  uint64_t v3 = a1[5];
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)v5, (uint64_t)v6);
  (*(void (**)(uint64_t, void *))(*(void *)v3 + 16))(v3, v5);
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100](v5);
  return std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100](v6);
}

void sub_2543A61F4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100]((uint64_t *)va);
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100]((uint64_t *)va1);
  _Unwind_Resume(a1);
}

void *std::__function::__func<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0,std::allocator<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0>,void ()(CoreAudioTimestamp)>::target_type()
{
}

uint64_t std::__function::__func<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0,std::allocator<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0>,void ()(CoreAudioTimestamp)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN11AudioClient18setAsyncIOCallbackEPFv18CoreAudioTimestampPvES1_E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0,std::allocator<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0>,void ()(CoreAudioTimestamp)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)(v2 + 72));
  if (v3)
  {
    (*(void (**)(void, void))(**(void **)(v2 + 48) + 48))(*(void *)(v2 + 48), *(void *)(a2 + 8));
    atomic_store(0, (unsigned __int8 *)(v2 + 72));
  }
  (*(void (**)(void))(**(void **)(v2 + 48) + 24))(*(void *)(v2 + 48));
  operator new();
}

void applesauce::dispatch::v1::async<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0::operator() const(CoreAudioTimestamp)::{lambda(void)#1}>(dispatch_queue_s *,AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0::operator() const(CoreAudioTimestamp)::{lambda(void)#1} &&)::{lambda(void *)#1}::__invoke(void *a1)
{
  (*(void (**)(void, void, void))(*a1 + 8))(a1[1], a1[2], *(void *)(*a1 + 16));
  JUMPOUT(0x25A276FE0);
}

void sub_2543A6394(_Unwind_Exception *a1)
{
  MEMORY[0x25A276FE0](v1, 0x1020C4024DAA5DELL);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0,std::allocator<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0>,void ()(CoreAudioTimestamp)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_2703C31B0;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0,std::allocator<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0>,void ()(CoreAudioTimestamp)>::__clone(uint64_t a1)
{
  id result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_2703C31B0;
  result[1] = v3;
  return result;
}

void std::__function::__func<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0,std::allocator<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0>,void ()(CoreAudioTimestamp)>::~__func()
{
}

void AudioClient::~AudioClient(AudioClient *this)
{
  AudioClient::~AudioClient(this);
  JUMPOUT(0x25A276FE0);
}

{
  std::__shared_weak_count *v2;
  uint64_t v3;

  *(void *)this = &unk_2703C37D8;
  (*(void (**)(void))(**((void **)this + 5) + 24))(*((void *)this + 5));
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 7);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = *((void *)this + 5);
  *((void *)this + 5) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
}

uint64_t AudioClient::AudioClient(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  *(void *)a1 = &unk_2703C37D8;
  uint64_t v4 = *a2;
  *a2 = 0;
  uint64_t v6 = *a3;
  uint64_t v5 = a3[1];
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  *(unsigned char *)(a1 + atomic_store(1u, (unsigned __int8 *)this + 72) = 0;
  uint64_t v7 = dispatch_queue_create("com.apple.audio.isolatedcoreaudio.asyncio", 0);
  *(void *)(a1 + 64) = v7;
  global_queue = dispatch_get_global_queue(2, 0);
  dispatch_set_target_queue(v7, global_queue);
  return a1;
}

void IOThreadClientSynchronizer::~IOThreadClientSynchronizer(IOThreadClientSynchronizer *this)
{
  IOThreadSynchronizer::~IOThreadSynchronizer(this);
  JUMPOUT(0x25A276FE0);
}

uint64_t std::allocate_shared[abi:ne180100]<caulk::mach::semaphore,std::allocator<caulk::mach::semaphore>,unsigned int const&,void>(uint64_t *a1)
{
  uint64_t v2 = operator new(0x20uLL);
  v2[1] = 0;
  v2[2] = 0;
  void *v2 = &unk_2703C3600;
  uint64_t result = caulk::mach::semaphore::semaphore((caulk::mach::semaphore *)(v2 + 3));
  *a1 = result;
  a1[1] = (uint64_t)v2;
  return result;
}

void sub_2543A6660(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<caulk::mach::semaphore>::__on_zero_shared()
{
}

void std::__shared_ptr_emplace<caulk::mach::semaphore>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C3600;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x25A276FE0);
}

void std::__shared_ptr_emplace<caulk::mach::semaphore>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C3600;
  std::__shared_weak_count::~__shared_weak_count(this);
}

uint64_t StubbedIsolatedCoreAudioClientProxy::ferryIsolatedAudioDataToSinkFromSampleTime()
{
  return 0;
}

void StubbedIsolatedCoreAudioClientProxy::~StubbedIsolatedCoreAudioClientProxy(StubbedIsolatedCoreAudioClientProxy *this)
{
}

uint64_t XPCConnectionToServer::tellServerToStopIO(XPCConnectionToServer *this)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 1;
  uint64_t v1 = *(void **)(*((void *)this + 2) + 32);
  uint64_t v2 = *((unsigned int *)this + 2);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = ___ZN21XPCConnectionToServer18tellServerToStopIOEv_block_invoke;
  v5[3] = &unk_2653A82B8;
  void v5[4] = &v6;
  [v1 stopIsolatedAudioForUseCase:v2 with:v5];
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_2543A67DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN21XPCConnectionToServer18tellServerToStopIOEv_block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t XPCConnectionToServer::tellServerToStartIOAtTime(XPCConnectionToServer *this, uint64_t a2)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 1;
  uint64_t v2 = *(void **)(*((void *)this + 2) + 32);
  uint64_t v3 = *((unsigned int *)this + 2);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = ___ZN21XPCConnectionToServer25tellServerToStartIOAtTimeEy_block_invoke;
  void v6[3] = &unk_2653A82B8;
  v6[4] = &v7;
  [v2 startIsolatedAudioForUseCase:v3 atTime:a2 with:v6];
  uint64_t v4 = *((unsigned int *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void sub_2543A68C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN21XPCConnectionToServer25tellServerToStartIOAtTimeEy_block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t XPCConnectionToServer::tellServerToStartIO(XPCConnectionToServer *this)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 1;
  uint64_t v1 = *(void **)(*((void *)this + 2) + 32);
  uint64_t v2 = *((unsigned int *)this + 2);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = ___ZN21XPCConnectionToServer19tellServerToStartIOEv_block_invoke;
  v5[3] = &unk_2653A82B8;
  void v5[4] = &v6;
  [v1 startIsolatedAudioForUseCase:v2 with:v5];
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_2543A69A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN21XPCConnectionToServer19tellServerToStartIOEv_block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void XPCConnectionToServer::getWorkgroupFromServer(XPCConnectionToServer *this@<X0>, void *a2@<X8>)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x4012000000;
  int v10 = __Block_byref_object_copy__2;
  uint64_t v11 = __Block_byref_object_dispose__3;
  int v12 = &unk_2543BEA0B;
  uint64_t v13 = 0;
  __int16 v14 = 0;
  uint64_t v3 = *(void **)(*((void *)this + 2) + 32);
  uint64_t v4 = *((unsigned int *)this + 2);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = ___ZN21XPCConnectionToServer22getWorkgroupFromServerEv_block_invoke;
  void v6[3] = &unk_2653A81D0;
  v6[4] = &v7;
  [v3 getWorkgroupForIsolatedAudio:v4 with:v6];
  uint64_t v5 = v8[7];
  *a2 = v8[6];
  a2[1] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  _Block_object_dispose(&v7, 8);
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
}

void sub_2543A6ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,std::__shared_weak_count *a22)
{
  if (a22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a22);
  }
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__2(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 56);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void ___ZN21XPCConnectionToServer22getWorkgroupFromServerEv_block_invoke(uint64_t a1, void *a2)
{
  [a2 getWorkgroup];
  uint64_t v2 = *(OS_os_workgroup **)(v4 + 8);
  caulk::mach::os_object<OS_os_workgroup * {__strong}>::get(v2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = (IOThreadWorkgroup *)operator new(0x20uLL);
  v3[1].var0.var0.var0 = 0;
  v3[2].var0.var0.var0 = 0;
  v3->var0.var0.var0 = (os_workgroup_managed *)&unk_2703C34B0;
  IOThreadWorkgroup::IOThreadWorkgroup(v3 + 3, v2);
}

void sub_2543A6BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  std::__shared_weak_count::~__shared_weak_count(v12);
  operator delete(v14);

  if (a10) {
    (*(void (**)(uint64_t))(*(void *)a10 + 8))(a10);
  }

  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_emplace<IOThreadWorkgroup>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = 0;
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_emplace<IOThreadWorkgroup>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C34B0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x25A276FE0);
}

void std::__shared_ptr_emplace<IOThreadWorkgroup>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C34B0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void XPCConnectionToServer::releaseSharedIOThreadResourcesFromServer(XPCConnectionToServer *this)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "XPCConnectionToServer.mm";
    __int16 v6 = 1024;
    int v7 = 49;
    _os_log_impl(&dword_25439F000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d XPCConnectionToServer::releaseSharedIOThreadResourcesFromServer - before call", (uint8_t *)&v4, 0x12u);
  }

  [*(id *)(*((void *)this + 2) + 32) checkOutForIsolatedAudioSharedResources:*((unsigned int *)this + 2)];
  uint64_t v3 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "XPCConnectionToServer.mm";
    __int16 v6 = 1024;
    int v7 = 51;
    _os_log_impl(&dword_25439F000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d XPCConnectionToServer::releaseSharedIOThreadResourcesFromServer - after call", (uint8_t *)&v4, 0x12u);
  }
}

void XPCConnectionToServer::acquireSharedIOThreadResourcesFromServer(XPCConnectionToServer *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int v4 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "XPCConnectionToServer.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 35;
    _os_log_impl(&dword_25439F000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d XPCConnectionToServer::acquireSharedIOThreadResourcesFromServer - before call", buf, 0x12u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x4812000000;
  int v15 = __Block_byref_object_copy__214;
  __int16 v16 = __Block_byref_object_dispose__215;
  uint64_t v17 = &unk_2543BEA0B;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v18 = 0;
  uint64_t v5 = *(void **)(*((void *)this + 2) + 32);
  uint64_t v6 = *((unsigned int *)this + 2);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___ZN21XPCConnectionToServer40acquireSharedIOThreadResourcesFromServerEv_block_invoke;
  v9[3] = &unk_2653A81A8;
  v9[4] = buf;
  [v5 checkInForIsolatedAudioSharedResources:v6 with:v9];
  int v7 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int v10 = 136315394;
    uint64_t v11 = "XPCConnectionToServer.mm";
    __int16 v12 = 1024;
    int v13 = 42;
    _os_log_impl(&dword_25439F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d XPCConnectionToServer::acquireSharedIOThreadResourcesFromServer - after call", v10, 0x12u);
  }

  uint64_t v8 = *(void *)&buf[8];
  *(_OWORD *)a2 = *(_OWORD *)(*(void *)&buf[8] + 48);
  *(void *)(a2 + 16) = *(void *)(v8 + 64);
  _Block_object_dispose(buf, 8);
}

void sub_2543A70A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__214(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a1[3] = result;
  return result;
}

void ___ZN21XPCConnectionToServer40acquireSharedIOThreadResourcesFromServerEv_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    __int16 v12 = "XPCConnectionToServer.mm";
    __int16 v13 = 1024;
    int v14 = 38;
    _os_log_impl(&dword_25439F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d XPCConnectionToServer::acquireSharedIOThreadResourcesFromServer - in reply call", (uint8_t *)&v11, 0x12u);
  }

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = [v5 getSemaphores];
  uint64_t v8 = [v6 getMappedMemory];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v9 + 56) = v8;
  *(void *)(v9 + 64) = v10;
}

void sub_2543A71E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *XPCConnectionToServer::makeConnectionToServer(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "XPCConnectionToServer.mm";
    __int16 v10 = 1024;
    int v11 = 27;
    _os_log_impl(&dword_25439F000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d XPCConnectionToServer::makeXPCConnectionToServer Received CreateIsolatedAudioServicePortal request", buf, 0x12u);
  }

  uint64_t v5 = *(void *)(a1 + 16);
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v7, a2);
  IsolatedCoreAudioClientBaseNSXPCConnection::makeConnection(v5, (uint64_t)v7);
  return std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v7);
}

void sub_2543A72F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void XPCConnectionToServer::~XPCConnectionToServer(XPCConnectionToServer *this)
{
  *(void *)this = &unk_2703C2DE8;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  JUMPOUT(0x25A276FE0);
}

{
  std::__shared_weak_count *v1;

  *(void *)this = &unk_2703C2DE8;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

uint64_t std::__shared_ptr_emplace<IsolatedCoreAudioXPCServerProtocolConnection>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<IsolatedCoreAudioXPCServerProtocolConnection>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C38B0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x25A276FE0);
}

void std::__shared_ptr_emplace<IsolatedCoreAudioXPCServerProtocolConnection>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C38B0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void XPCConnectionToServer::XPCConnectionToServer(XPCConnectionToServer *this, int a2)
{
  *(void *)this = &unk_2703C2DE8;
  *((_DWORD *)this + 2) = a2;
  uint64_t v3 = operator new(0x40uLL);
  *(_OWORD *)((char *)v3 + 8) = 0u;
  *(void *)uint64_t v3 = &unk_2703C38B0;
  int v4 = @"com.apple.audio.isolated.client.service";
  void v3[2] = 0u;
  *((void *)v3 + 6) = @"com.apple.audio.isolated.client.service";
  *((void *)v3 + 7) = 0;
  *((void *)v3 + 3) = &unk_2703C3690;
  *((void *)this + 2) = (char *)v3 + 24;
  *((void *)this + 3) = v3;
}

void *std::__function::__func<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_1,std::allocator<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_1>,void ()(LapseChain)>::target_type()
{
}

uint64_t std::__function::__func<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_1,std::allocator<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_1>,void ()(LapseChain)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN34IsolatedCoreAudioClientMultiplexer19createSharedIOProcsENSt3__18functionIFv18CoreAudioTimestampEEEE3$_1"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_1,std::allocator<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_1>,void ()(LapseChain)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a2;
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = sIsolatedCoreAudioSiphonLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v15 = "IsolatedCoreAudioClientMultiplexer.cpp";
    __int16 v16 = 1024;
    int v17 = 33;
    __int16 v18 = 1024;
    int v19 = v2;
    _os_log_impl(&dword_25439F000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d IsolatedCoreAudioClientMultiplexer:: IO has lapsed with status %d", buf, 0x18u);
  }
  if ((v2 & 0x100000000) != 0)
  {
    uint64_t v5 = sIsolatedCoreAudioSiphonLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "IsolatedCoreAudioClientMultiplexer.cpp";
      __int16 v16 = 1024;
      int v17 = 40;
      _os_log_impl(&dword_25439F000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d IsolatedCoreAudioClientMultiplexer:: IO lapsed during rendezvous.", buf, 0x12u);
    }
    uint64_t v12 = v3 + 96;
    char v13 = 1;
    std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)(v3 + 96));
    *(unsigned char *)(v3 + 24) = 0;
    uint64_t v6 = *(void *)(v3 + 8);
    int v7 = *(uint64_t **)(v6 + 16);
    if (v7)
    {
      do
      {
        SiphonClientMap::disableAvailabilityCallbacksForClient(*(SiphonClientMap **)(v3 + 8), *((_DWORD *)v7 + 4));
        int v7 = (uint64_t *)*v7;
      }
      while (v7);
      uint64_t v6 = *(void *)(v3 + 8);
      uint64_t v8 = *(uint64_t ***)(v6 + 16);
      if (v8)
      {
        do
        {
          uint64_t v9 = *v8[3];
          unsigned __int8 v10 = atomic_load((unsigned __int8 *)(v9 + 65));
          if (v10) {
            std::function<void ()(int)>::operator()(*(void *)(v9 + 56), v2);
          }
          uint64_t v8 = (uint64_t **)*v8;
        }
        while (v8);
        uint64_t v6 = *(void *)(v3 + 8);
      }
    }
    for (i = (uint64_t *)(v6 + 16);
          ;
          SiphonClientMap::disableLapseHandlingForClient(*(SiphonClientMap **)(v3 + 8), *((_DWORD *)i + 4)))
    {
      i = (uint64_t *)*i;
      if (!i) {
        break;
      }
    }
    std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v12);
  }
}

void sub_2543A77C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sIsolatedCoreAudioSiphonLog(void)
{
  unint64_t v0 = 0x269DEE000uLL;
  {
    unint64_t v0 = 0x269DEE000;
    if (v2)
    {
      sIsolatedCoreAudioSiphonLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudioSiphon");
      unint64_t v0 = 0x269DEE000;
    }
  }
  return *(void *)(v0 + 2000);
}

uint64_t std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    std::__shared_mutex_base::unlock_shared(*(std::__shared_mutex_base **)a1);
  }
  return a1;
}

uint64_t std::__function::__func<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_1,std::allocator<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_1>,void ()(LapseChain)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_2703C3980;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_1,std::allocator<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_1>,void ()(LapseChain)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_2703C3980;
  result[1] = v3;
  return result;
}

void std::__function::__func<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_1,std::allocator<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_1>,void ()(LapseChain)>::~__func()
{
}

void *std::__function::__func<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_0,std::allocator<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_0>,void ()(CoreAudioTimestamp)>::target_type()
{
}

uint64_t std::__function::__func<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_0,std::allocator<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_0>,void ()(CoreAudioTimestamp)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN34IsolatedCoreAudioClientMultiplexer19createSharedIOProcsENSt3__18functionIFv18CoreAudioTimestampEEEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_0,std::allocator<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_0>,void ()(CoreAudioTimestamp)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t result = std::function<void ()(CoreAudioTimestamp)>::operator()(*(void *)(a1 + 40), *a2, a2[1]);
  for (i = *(uint64_t ***)(*(void *)(v2 + 8) + 16); i; i = (uint64_t **)*i)
  {
    unsigned __int8 v5 = atomic_load((unsigned __int8 *)(*i[3] + 64));
    if (v5) {
      operator new();
    }
  }
  return result;
}

void std::__function::__func<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_0,std::allocator<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_0>,void ()(CoreAudioTimestamp)>::destroy_deallocate(void *a1)
{
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100](a1 + 2);
  operator delete(a1);
}

void *std::__function::__func<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_0,std::allocator<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_0>,void ()(CoreAudioTimestamp)>::destroy(uint64_t a1)
{
  return std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100]((void *)(a1 + 16));
}

uint64_t std::__function::__func<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_0,std::allocator<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_0>,void ()(CoreAudioTimestamp)>::__clone(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  *a2 = &unk_2703C3900;
  a2[1] = v2;
  return std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)(a2 + 2), a1 + 16);
}

void *std::__function::__func<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_0,std::allocator<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_0>,void ()(CoreAudioTimestamp)>::__clone(uint64_t a1)
{
  uint64_t v2 = operator new(0x30uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *v2 = &unk_2703C3900;
  v2[1] = v3;
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)(v2 + 2), a1 + 16);
  return v2;
}

void sub_2543A7ADC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__function::__func<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_0,std::allocator<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_0>,void ()(CoreAudioTimestamp)>::~__func(void *a1)
{
  *a1 = &unk_2703C3900;
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100](a1 + 2);
  JUMPOUT(0x25A276FE0);
}

void *std::__function::__func<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_0,std::allocator<IsolatedCoreAudioClientMultiplexer::createSharedIOProcs(std::function<void ()(CoreAudioTimestamp)>)::$_0>,void ()(CoreAudioTimestamp)>::~__func(void *a1)
{
  *a1 = &unk_2703C3900;
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100](a1 + 2);
  return a1;
}

uint64_t *IsolatedCoreAudioClientMultiplexer::IsolatedCoreAudioClientMultiplexer(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  v18[4] = *MEMORY[0x263EF8340];
  uint64_t v6 = *a2;
  *a2 = 0;
  *a1 = v6;
  a1[1] = *a3;
  uint64_t v7 = a3[1];
  a1[2] = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  a1[4] = 850045863;
  *((unsigned char *)a1 + 24) = 0;
  *(_OWORD *)(a1 + 5) = 0u;
  *(_OWORD *)(a1 + 7) = 0u;
  *(_OWORD *)(a1 + 9) = 0u;
  a1[11] = 0;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(a1 + 12));
  a1[36] = 0;
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)v13, a4);
  __int16 v16 = a1;
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)v17, (uint64_t)v13);
  uint64_t v8 = operator new(0x30uLL);
  uint64_t v9 = v16;
  *uint64_t v8 = &unk_2703C3900;
  v8[1] = v9;
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)(v8 + 2), (uint64_t)v17);
  v18[3] = v8;
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100](v17);
  uint64_t v10 = *a1;
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)v15, (uint64_t)v18);
  (*(void (**)(uint64_t, void *))(*(void *)v10 + 16))(v10, v15);
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100](v15);
  uint64_t v11 = *a1;
  v14[0] = &unk_2703C3980;
  v14[1] = a1;
  v14[3] = v14;
  (*(void (**)(uint64_t, void *))(*(void *)v11 + 32))(v11, v14);
  std::__function::__value_func<void ()(LapseChain)>::~__value_func[abi:ne180100](v14);
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100](v18);
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100](v13);
  return a1;
}

void sub_2543A7D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  std::__function::__value_func<void ()(LapseChain)>::~__value_func[abi:ne180100](&a13);
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100]((void *)(v16 - 88));
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100](&a9);
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100](v13 + 33);
  std::condition_variable::~condition_variable((std::condition_variable *)(v13 + 26));
  std::condition_variable::~condition_variable((std::condition_variable *)(v13 + 20));
  std::mutex::~mutex(v15);
  std::mutex::~mutex(v14);
  __int16 v18 = (std::__shared_weak_count *)v13[2];
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  uint64_t v19 = *v13;
  uint64_t *v13 = 0;
  if (v19) {
    (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
  }
  _Unwind_Resume(a1);
}

void sub_2543A7E2C()
{
}

void sub_2543A7E34()
{
}

uint64_t std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    std::__shared_mutex_base::unlock(*(std::__shared_mutex_base **)a1);
  }
  return a1;
}

void std::__shared_ptr_emplace<ReverseSiphonProxyObjcWrapper>::__on_zero_shared(uint64_t a1)
{
}

void std::__shared_ptr_emplace<ReverseSiphonProxyObjcWrapper>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C3A00;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x25A276FE0);
}

void std::__shared_ptr_emplace<ReverseSiphonProxyObjcWrapper>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C3A00;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_2543A7FC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2543A8138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2543A82E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2543A84D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2543A858C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2543A8620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t RegisterForIsolatedAudio(int a1)
{
  uint64_t result = MGGetBoolAnswer();
  if (result)
  {
    getClient(a1);
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)getClient::sClient + 16);
    return v3();
  }
  return result;
}

uint64_t SetAudioLapseHandler()
{
  getClient(0);
  unint64_t v0 = *(uint64_t (**)(void))(*(void *)getClient::sClient + 24);
  return v0();
}

uint64_t StartIsolatedAudio()
{
  uint64_t result = MGGetBoolAnswer();
  if (result)
  {
    getClient(0);
    uint64_t v1 = *(uint64_t (**)(void))(*(void *)getClient::sClient + 40);
    return v1();
  }
  return result;
}

uint64_t StartIsolatedAudioAtTime()
{
  uint64_t result = MGGetBoolAnswer();
  if (result)
  {
    getClient(0);
    uint64_t v1 = *(uint64_t (**)(void))(*(void *)getClient::sClient + 48);
    return v1();
  }
  return result;
}

uint64_t StopIsolatedAudio()
{
  uint64_t result = MGGetBoolAnswer();
  if (result)
  {
    getClient(0);
    uint64_t v1 = *(uint64_t (**)(void))(*(void *)getClient::sClient + 56);
    return v1();
  }
  return result;
}

uint64_t RequestIsolatedAudio()
{
  uint64_t result = MGGetBoolAnswer();
  if (result)
  {
    getClient(0);
    uint64_t v1 = *(uint64_t (**)(void))(*(void *)getClient::sClient + 32);
    return v1();
  }
  return result;
}

uint64_t *std::unique_ptr<IOThread>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  void *result = a2;
  if (v2)
  {
    if (atomic_load((unsigned int *)v2))
    {
      atomic_store(1u, (unsigned __int8 *)(v2 + 4));
      if (!pthread_join(*(pthread_t *)(v2 + 8), 0))
      {
        *(void *)(v2 + 8) = 0;
        atomic_exchange((atomic_uint *volatile)v2, 0);
      }
    }
    std::__function::__value_func<long long ()(long long)>::~__value_func[abi:ne180100]((void *)(v2 + 112));
    std::__function::__value_func<long long ()(void)>::~__value_func[abi:ne180100]((void *)(v2 + 80));
    std::__function::__value_func<long long ()(void)>::~__value_func[abi:ne180100]((void *)(v2 + 48));
    std::__function::__value_func<long long ()(void)>::~__value_func[abi:ne180100]((void *)(v2 + 16));
    JUMPOUT(0x25A276FE0);
  }
  return result;
}

void std::default_delete<IOThreadWork>::operator()[abi:ne180100](void *a1)
{
  std::__function::__value_func<long long ()(long long)>::~__value_func[abi:ne180100](a1 + 12);
  std::__function::__value_func<long long ()(void)>::~__value_func[abi:ne180100](a1 + 8);
  std::__function::__value_func<long long ()(void)>::~__value_func[abi:ne180100](a1 + 4);
  std::__function::__value_func<long long ()(void)>::~__value_func[abi:ne180100](a1);
  JUMPOUT(0x25A276FE0);
}

IOThreadSynchronizer *std::unique_ptr<ClientIOThreadResources>::reset[abi:ne180100](IOThreadSynchronizer **a1, IOThreadSynchronizer *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    IOThreadSynchronizer::~IOThreadSynchronizer(result);
    JUMPOUT(0x25A276FE0);
  }
  return result;
}

uint64_t ___ZN12IOThreadWorkC2Ev_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 24);
  if (!v1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);
  return v2();
}

void *std::__function::__func<long long({block_pointer} {__strong})(long long),std::allocator<long long({block_pointer} {__strong})(long long)>,long long ()(long long)>::target_type()
{
}

uint64_t std::__function::__func<long long({block_pointer} {__strong})(long long),std::allocator<long long({block_pointer} {__strong})(long long)>,long long ()(long long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), 0x80000002543B998DLL)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

uint64_t std::__function::__func<long long({block_pointer} {__strong})(long long),std::allocator<long long({block_pointer} {__strong})(long long)>,long long ()(long long)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

void std::__function::__func<long long({block_pointer} {__strong})(long long),std::allocator<long long({block_pointer} {__strong})(long long)>,long long ()(long long)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = 0;
}

uint64_t std::__function::__func<long long({block_pointer} {__strong})(long long),std::allocator<long long({block_pointer} {__strong})(long long)>,long long ()(long long)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_2703C3158;
  uint64_t result = MEMORY[0x25A2772C0](*(void *)(a1 + 8));
  a2[1] = result;
  return result;
}

uint64_t std::__function::__func<long long({block_pointer} {__strong})(long long),std::allocator<long long({block_pointer} {__strong})(long long)>,long long ()(long long)>::__clone()
{
  return 0;
}

void std::__function::__func<long long({block_pointer} {__strong})(long long),std::allocator<long long({block_pointer} {__strong})(long long)>,long long ()(long long)>::~__func(uint64_t a1)
{
  JUMPOUT(0x25A276FE0);
}

uint64_t std::__function::__func<long long({block_pointer} {__strong})(long long),std::allocator<long long({block_pointer} {__strong})(long long)>,long long ()(long long)>::~__func(uint64_t a1)
{
  return a1;
}

void *std::__function::__func<long long({block_pointer} {__strong})(void),std::allocator<long long({block_pointer} {__strong})(void)>,long long ()(void)>::target_type()
{
}

uint64_t std::__function::__func<long long({block_pointer} {__strong})(void),std::allocator<long long({block_pointer} {__strong})(void)>,long long ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), 0x80000002543B9904)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

uint64_t std::__function::__func<long long({block_pointer} {__strong})(void),std::allocator<long long({block_pointer} {__strong})(void)>,long long ()(void)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

void std::__function::__func<long long({block_pointer} {__strong})(void),std::allocator<long long({block_pointer} {__strong})(void)>,long long ()(void)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = 0;
}

uint64_t std::__function::__func<long long({block_pointer} {__strong})(void),std::allocator<long long({block_pointer} {__strong})(void)>,long long ()(void)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_2703C3100;
  uint64_t result = MEMORY[0x25A2772C0](*(void *)(a1 + 8));
  a2[1] = result;
  return result;
}

uint64_t std::__function::__func<long long({block_pointer} {__strong})(void),std::allocator<long long({block_pointer} {__strong})(void)>,long long ()(void)>::__clone()
{
  return 0;
}

void std::__function::__func<long long({block_pointer} {__strong})(void),std::allocator<long long({block_pointer} {__strong})(void)>,long long ()(void)>::~__func(uint64_t a1)
{
  JUMPOUT(0x25A276FE0);
}

uint64_t std::__function::__func<long long({block_pointer} {__strong})(void),std::allocator<long long({block_pointer} {__strong})(void)>,long long ()(void)>::~__func(uint64_t a1)
{
  return a1;
}

uint64_t ___ZN12IOThreadWorkC2Ev_block_invoke()
{
  return 0;
}

void ClientSideAudioSwitchboardIOThread::ClientSideAudioSwitchboardIOThread(uint64_t a1, uint64_t a2)
{
  *(void *)(std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](a1, a2) + 32) = 0;
  operator new();
}

void sub_2543A8EEC(_Unwind_Exception *a1)
{
  MEMORY[0x25A276FE0](v3, 0x1000C4090D0E795);
  unsigned __int8 v5 = (std::__shared_weak_count *)v1[8];
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  std::unique_ptr<IOThread>::reset[abi:ne180100](v1 + 6, 0);
  uint64_t v6 = (void *)v1[5];
  v1[5] = 0;
  if (v6) {
    std::default_delete<IOThreadWork>::operator()[abi:ne180100](v6);
  }
  std::unique_ptr<ClientIOThreadResources>::reset[abi:ne180100](v2, 0);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

IOThreadSynchronizer *ClientSideAudioSwitchboardIOThread::stop(ClientSideAudioSwitchboardIOThread *this)
{
  uint64_t v2 = *((void *)this + 6);
  atomic_store(1u, (unsigned __int8 *)(v2 + 4));
  if (!pthread_join(*(pthread_t *)(v2 + 8), 0))
  {
    *(void *)(v2 + 8) = 0;
    atomic_exchange((atomic_uint *volatile)v2, 0);
  }
  return std::unique_ptr<ClientIOThreadResources>::reset[abi:ne180100]((IOThreadSynchronizer **)this + 4, 0);
}

void *std::__function::__value_func<long long ()(void)>::swap[abi:ne180100](void *result, void *a2)
{
  void v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    uint64_t v3 = result;
    int v4 = (void *)result[3];
    unsigned __int8 v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_2543A9304(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

uint64_t std::__function::__value_func<void ()(LapseChain)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

{
  void *v3;
  uint64_t v4;

  uint64_t v3 = (void *)(a2 + 24);
  int v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(void *)(a1 + 24) = v4;
  }
  else
  {
    uint64_t v3 = (void *)(a1 + 24);
  }
  *uint64_t v3 = 0;
  return a1;
}

void *std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_2,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_2>,long long ()(long long)>::target_type()
{
}

uint64_t std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_2,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_2>,long long ()(long long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN34ClientSideAudioSwitchboardIOThread13spawnIOThreadEjNSt3__18functionIFv18CoreAudioTimestampEEENS1_IFv10LapseChainEEEE3$_2"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_2,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_2>,long long ()(long long)>::operator()(uint64_t a1, void *a2)
{
  kern_return_t v10;
  NSObject *v11;
  uint64_t v12;
  unsigned char v14[12];
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 8);
  if (*a2)
  {
    unsigned __int8 v3 = atomic_load((unsigned __int8 *)(v2 + 80));
    *(void *)int v14 = ((unint64_t)(v3 & 1) << 32) | 0x68616C74;
    uint64_t v4 = *(void *)(a1 + 40);
    if (!v4) {
      goto LABEL_17;
    }
    (*(void (**)(uint64_t, unsigned char *))(*(void *)v4 + 48))(v4, v14);
  }
  unsigned __int8 v5 = **(caulk::mach::os_workgroup_managed ***)(v2 + 56);
  if (*((void *)v5 + 1))
  {
    int v6 = caulk::mach::os_workgroup_managed::leave(v5);
    if (!v6) {
      goto LABEL_11;
    }
  }
  else
  {
    int v6 = 29;
  }
  uint64_t v7 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int v14 = 136315650;
    *(void *)&void v14[4] = "ClientSideAudioSwitchboardIOThread.mm";
    uint64_t v15 = 1024;
    uint64_t v16 = 141;
    int v17 = 1024;
    __int16 v18 = v6;
    _os_log_impl(&dword_25439F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ClientSideAudioSwitchboardIOThread::IOTearDownFunction - Failed to leave the workgroup!!!! - %d", v14, 0x18u);
  }

LABEL_11:
  uint64_t v8 = pthread_self();
  *(_DWORD *)int v14 = 1;
  thread_act_t v9 = pthread_mach_thread_np(v8);
  uint64_t v10 = thread_policy_set(v9, 1u, (thread_policy_t)v14, 1u);
  if (v10)
  {
    uint64_t v11 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v14 = 136315650;
      *(void *)&void v14[4] = "ClientSideAudioSwitchboardIOThread.mm";
      uint64_t v15 = 1024;
      uint64_t v16 = 147;
      int v17 = 1024;
      __int16 v18 = v10;
      _os_log_impl(&dword_25439F000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ClientSideAudioSwitchboardIOThread::IOTearDownFunction - Failed to set the RT thread priority!!!! - %d", v14, 0x18u);
    }
  }
  uint64_t v12 = *(void *)(v2 + 24);
  if (!v12) {
LABEL_17:
  }
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t))(*(void *)v12 + 48))(v12);
  return TranslateKernelError(v10);
}

uint64_t TranslateKernelError(int a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  if (a1 == 49)
  {
    uint64_t v2 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      uint64_t v8 = "ClientSideAudioSwitchboardIOThread.mm";
      __int16 v9 = 1024;
      int v10 = 67;
      unsigned __int8 v3 = "%25s:%-5d ClientSideAudioSwitchboardIOThread::TranslateKernelError - Semaphores timed out!!! Exiting the workloop";
      uint64_t v4 = v2;
      uint32_t v5 = 18;
LABEL_8:
      _os_log_impl(&dword_25439F000, v4, OS_LOG_TYPE_DEFAULT, v3, (uint8_t *)&v7, v5);
    }
  }
  else
  {
    uint64_t v2 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      uint64_t v8 = "ClientSideAudioSwitchboardIOThread.mm";
      __int16 v9 = 1024;
      int v10 = 71;
      __int16 v11 = 1024;
      int v12 = a1;
      unsigned __int8 v3 = "%25s:%-5d ClientSideAudioSwitchboardIOThread::TranslateKernelError - General Semaphore Error - %d. Exiting the workloop";
      uint64_t v4 = v2;
      uint32_t v5 = 24;
      goto LABEL_8;
    }
  }

  return 1;
}

void std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_2,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_2>,long long ()(long long)>::destroy_deallocate(void *a1)
{
  std::__function::__value_func<void ()(LapseChain)>::~__value_func[abi:ne180100](a1 + 2);
  operator delete(a1);
}

void *std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_2,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_2>,long long ()(long long)>::destroy(uint64_t a1)
{
  return std::__function::__value_func<void ()(LapseChain)>::~__value_func[abi:ne180100]((void *)(a1 + 16));
}

uint64_t std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_2,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_2>,long long ()(long long)>::__clone(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  *a2 = &unk_2703C3B70;
  a2[1] = v2;
  return std::__function::__value_func<void ()(LapseChain)>::__value_func[abi:ne180100]((uint64_t)(a2 + 2), a1 + 16);
}

void *std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_2,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_2>,long long ()(long long)>::__clone(uint64_t a1)
{
  uint64_t v2 = operator new(0x30uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *v2 = &unk_2703C3B70;
  v2[1] = v3;
  std::__function::__value_func<void ()(LapseChain)>::__value_func[abi:ne180100]((uint64_t)(v2 + 2), a1 + 16);
  return v2;
}

void sub_2543A9890(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_2,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_2>,long long ()(long long)>::~__func(void *a1)
{
  *a1 = &unk_2703C3B70;
  std::__function::__value_func<void ()(LapseChain)>::~__value_func[abi:ne180100](a1 + 2);
  JUMPOUT(0x25A276FE0);
}

void *std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_2,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_2>,long long ()(long long)>::~__func(void *a1)
{
  *a1 = &unk_2703C3B70;
  std::__function::__value_func<void ()(LapseChain)>::~__value_func[abi:ne180100](a1 + 2);
  return a1;
}

void *std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_1,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_1>,long long ()(void)>::target_type()
{
}

uint64_t std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_1,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_1>,long long ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN34ClientSideAudioSwitchboardIOThread13spawnIOThreadEjNSt3__18functionIFv18CoreAudioTimestampEEENS1_IFv10LapseChainEEEE3$_1"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_1,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_1>,long long ()(void)>::operator()(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(v2 + 32);
  uint64_t v4 = *(const void **)(v3 + 48);
  if (*(void *)(v3 + 56) >= 0x10uLL) {
    size_t v5 = 16;
  }
  else {
    size_t v5 = *(void *)(v3 + 56);
  }
  if (v5 <= 0xF) {
    size_t v6 = 16 - v5;
  }
  else {
    size_t v6 = 0;
  }
  bzero((char *)v11 + v5, v6);
  memcpy(v11, v4, v5);
  std::function<void ()(CoreAudioTimestamp)>::operator()(*(void *)(a1 + 40), v11[0], v11[1]);
  int v7 = IOThreadSynchronizer::signalAndWait(*(IOThreadSynchronizer **)(*(void *)(v2 + 32) + 8), 0.5, *(caulk::mach::semaphore **)(*(void *)(v2 + 32) + 24));
  if (v7 == 49)
  {
    uint64_t v8 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "ClientSideAudioSwitchboardIOThread.mm";
      __int16 v14 = 1024;
      int v15 = 122;
      _os_log_impl(&dword_25439F000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ClientSideAudioSwitchboardIOThread::IOMainWorkloopFunction - timed out waiting for signal from server.", buf, 0x12u);
    }

    __int16 v9 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "ClientSideAudioSwitchboardIOThread.mm";
      __int16 v14 = 1024;
      int v15 = 67;
      _os_log_impl(&dword_25439F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ClientSideAudioSwitchboardIOThread::TranslateKernelError - Semaphores timed out!!! Exiting the workloop", buf, 0x12u);
    }

    return 1;
  }
  else
  {
    return TranslateKernelError(v7);
  }
}

void std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_1,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_1>,long long ()(void)>::destroy_deallocate(void *a1)
{
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100](a1 + 2);
  operator delete(a1);
}

void *std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_1,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_1>,long long ()(void)>::destroy(uint64_t a1)
{
  return std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100]((void *)(a1 + 16));
}

uint64_t std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_1,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_1>,long long ()(void)>::__clone(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  *a2 = &unk_2703C3AF0;
  a2[1] = v2;
  return std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)(a2 + 2), a1 + 16);
}

void *std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_1,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_1>,long long ()(void)>::__clone(uint64_t a1)
{
  uint64_t v2 = operator new(0x30uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *v2 = &unk_2703C3AF0;
  v2[1] = v3;
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)(v2 + 2), a1 + 16);
  return v2;
}

void sub_2543A9C34(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_1,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_1>,long long ()(void)>::~__func(void *a1)
{
  *a1 = &unk_2703C3AF0;
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100](a1 + 2);
  JUMPOUT(0x25A276FE0);
}

void *std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_1,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_1>,long long ()(void)>::~__func(void *a1)
{
  *a1 = &unk_2703C3AF0;
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100](a1 + 2);
  return a1;
}

void *std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_0,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_0>,long long ()(void)>::target_type()
{
}

uint64_t std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_0,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_0>,long long ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN34ClientSideAudioSwitchboardIOThread13spawnIOThreadEjNSt3__18functionIFv18CoreAudioTimestampEEENS1_IFv10LapseChainEEEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_0,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_0>,long long ()(void)>::operator()(uint64_t a1)
{
  kern_return_t v8;
  kern_return_t v9;
  NSObject *v10;
  caulk::mach::os_workgroup_managed *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  NSObject *v18;
  unsigned char v19[18];
  __int16 v20;
  int v21;
  uint64_t v22;

  long long v22 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 8);
  unsigned int v2 = *(_DWORD *)(a1 + 16);
  uint64_t v3 = pthread_self();
  if (v2 <= 0x4B2) {
    unint64_t v4 = 1202;
  }
  else {
    unint64_t v4 = v2;
  }
  LODWORD(v5) = v4 >> 1;
  if (v4 >> 1 <= 0x4B0) {
    LODWORD(v5) = 1200;
  }
  if (v5 >= 0x124F80) {
    uint64_t v5 = 1200000;
  }
  else {
    uint64_t v5 = v5;
  }
  int8x16_t v6 = (int8x16_t)vdupq_n_s64(0x100000000uLL);
  v6.i64[0] = v5 << 32;
  *(int8x16_t *)uint64_t v19 = vorrq_s8(v6, (int8x16_t)vdupq_n_s64(v4));
  thread_act_t v7 = pthread_mach_thread_np(v3);
  uint64_t v8 = thread_policy_set(v7, 2u, (thread_policy_t)v19, 4u);
  if (v8)
  {
    __int16 v9 = v8;
    int v10 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v19 = 136315650;
      *(void *)&v19[4] = "ClientSideAudioSwitchboardIOThread.mm";
      *(_WORD *)&v19[12] = 1024;
      *(_DWORD *)&v19[14] = 86;
      uint64_t v20 = 1024;
      uint64_t v21 = v9;
      _os_log_impl(&dword_25439F000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ClientSideAudioSwitchboardIOThread::IOSetUpFunction - Failed to set the RT thread priority!!!! - %d", v19, 0x18u);
    }
  }
  __int16 v11 = **(caulk::mach::os_workgroup_managed ***)(v1 + 56);
  if (*((void *)v11 + 1))
  {
    int v12 = caulk::mach::os_workgroup_managed::join(v11);
    if (!v12) {
      goto LABEL_20;
    }
  }
  else
  {
    int v12 = 29;
  }
  uint64_t v13 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v19 = 136315650;
    *(void *)&v19[4] = "ClientSideAudioSwitchboardIOThread.mm";
    *(_WORD *)&v19[12] = 1024;
    *(_DWORD *)&v19[14] = 92;
    uint64_t v20 = 1024;
    uint64_t v21 = v12;
    _os_log_impl(&dword_25439F000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ClientSideAudioSwitchboardIOThread::IOSetUpFunction - Failed to join the workgroup!!!! - %d", v19, 0x18u);
  }

LABEL_20:
  __int16 v14 = caulk::mach::semaphore::timed_wait_or_error(*(caulk::mach::semaphore **)(*(void *)(v1 + 32) + 24), 0.5);
  *(void *)uint64_t v19 = v14;
  if ((v14 & 0xFF00000000) != 0)
  {
    caulk::expected<BOOL,int>::value((uint64_t)v19);
    if (!v19[0]) {
      goto LABEL_25;
    }
LABEL_28:
    caulk::mach::semaphore::signal(*(caulk::mach::semaphore **)(v1 + 72));
    int v15 = 0;
    return TranslateKernelError(v15);
  }
  int v15 = v14;
  if (!v14) {
    goto LABEL_28;
  }
  if (v14 == 49)
  {
LABEL_25:
    uint64_t v16 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v19 = 136315394;
      *(void *)&v19[4] = "ClientSideAudioSwitchboardIOThread.mm";
      *(_WORD *)&v19[12] = 1024;
      *(_DWORD *)&v19[14] = 100;
      _os_log_impl(&dword_25439F000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d ClientSideAudioSwitchboardIOThread::IOSetUpFunction - timed out waiting for signal from server.", v19, 0x12u);
    }

    int v15 = 49;
    return TranslateKernelError(v15);
  }
  __int16 v18 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)uint64_t v19 = 136315394;
    *(void *)&v19[4] = "ClientSideAudioSwitchboardIOThread.mm";
    *(_WORD *)&v19[12] = 1024;
    *(_DWORD *)&v19[14] = 104;
    _os_log_impl(&dword_25439F000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d ClientSideAudioSwitchboardIOThread::IOSetUpFunction - unknown error occurred waiting for signal from server.", v19, 0x12u);
  }

  return TranslateKernelError(v15);
}

__n128 std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_0,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_0>,long long ()(void)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_2703C3A70;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_0,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_0>,long long ()(void)>::__clone(uint64_t a1)
{
  unsigned int v2 = (char *)operator new(0x18uLL);
  *(void *)unsigned int v2 = &unk_2703C3A70;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

void std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_0,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(LapseChain)>)::$_0>,long long ()(void)>::~__func()
{
}

uint64_t caulk::expected<BOOL,int>::value(uint64_t result)
{
  if (!*(unsigned char *)(result + 4))
  {
    uint64_t v1 = (int *)result;
    exception = __cxa_allocate_exception(0x10uLL);
    int v3 = *v1;
    *(void *)exception = &unk_2703C3028;
    exception[2] = v3;
  }
  return result;
}

void caulk::bad_expected_access<int>::~bad_expected_access(std::exception *a1)
{
  std::exception::~exception(a1);
  JUMPOUT(0x25A276FE0);
}

uint64_t non-virtual thunk to'ClientLocalServer::kill(ClientLocalServer *this)
{
  return ClientLocalServer::kill((ClientLocalServer *)((char *)this - 8));
}

uint64_t ClientLocalServer::kill(ClientLocalServer *this)
{
  uint64_t v2 = *((void *)this + 6);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
  }
  atomic_store(0, (unsigned __int8 *)this + 81);
  uint64_t result = *((void *)this + 14);
  if (result)
  {
    unint64_t v4 = *(uint64_t (**)(void))(*(void *)result + 48);
    return v4();
  }
  return result;
}

void non-virtual thunk to'ClientLocalServer::~ClientLocalServer(ClientLocalServer *this)
{
  ClientLocalServer::~ClientLocalServer((ClientLocalServer *)((char *)this - 8));
  JUMPOUT(0x25A276FE0);
}

{
  ClientLocalServer::~ClientLocalServer((ClientLocalServer *)((char *)this - 8));
}

void ClientLocalServer::~ClientLocalServer(ClientLocalServer *this)
{
  *(void *)this = &unk_2703C2CD8;
  *((void *)this + 1) = &unk_2703C2D40;
  ClientLocalServer::tellServerToStopIO(this);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)this + 11);
  std::unique_ptr<std::thread>::reset[abi:ne180100]((std::thread **)this + 9, 0);
  uint64_t v2 = *((void *)this + 8);
  *((void *)this + 8) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  std::unique_ptr<ServerIOThreadResources>::reset[abi:ne180100]((uint64_t *)this + 7, 0);
  *((void *)this + 1) = &unk_2703C2EF0;
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)this + 2);
}

{
  uint64_t vars8;

  ClientLocalServer::~ClientLocalServer(this);
  JUMPOUT(0x25A276FE0);
}

uint64_t ClientLocalServer::tellServerToStopIO(ClientLocalServer *this)
{
  atomic_store(1u, (unsigned __int8 *)this + 80);
  uint64_t v2 = (std::thread **)((char *)this + 72);
  uint64_t v1 = (std::thread *)*((void *)this + 9);
  if (v1) {
    std::thread::join(v1);
  }
  std::unique_ptr<std::thread>::reset[abi:ne180100](v2, 0);
  return 0;
}

std::thread *std::unique_ptr<std::thread>::reset[abi:ne180100](std::thread **a1, std::thread *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    std::thread::~thread(result);
    JUMPOUT(0x25A276FE0);
  }
  return result;
}

uint64_t *std::unique_ptr<ServerIOThreadResources>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  std::thread *result = a2;
  if (v2)
  {
    IOThreadServerMappedMemory::~IOThreadServerMappedMemory((IOThreadServerMappedMemory *)(v2 + 40));
    IOThreadSynchronizer::~IOThreadSynchronizer((IOThreadSynchronizer *)v2);
    JUMPOUT(0x25A276FE0);
  }
  return result;
}

BOOL ClientLocalServer::areServerResourcesCheckedOut(ClientLocalServer *this)
{
  return *((void *)this + 7) != 0;
}

uint64_t ClientLocalServer::tellServerToStartIOAtTime(ClientLocalServer *this)
{
  return 0;
}

uint64_t ClientLocalServer::tellServerToStartIO(ClientLocalServer *this)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)this + 81);
  if (v1)
  {
    atomic_store(0, (unsigned __int8 *)this + 80);
    operator new();
  }
  return 0xFFFFFFFFLL;
}

uint64_t **std::unique_ptr<std::tuple<std::unique_ptr<std::__thread_struct>,ClientLocalServer::tellServerToStartIO(void)::$_0>>::~unique_ptr[abi:ne180100](uint64_t **a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    uint64_t v3 = *v2;
    uint64_t *v2 = 0;
    if (v3)
    {
      uint64_t v4 = MEMORY[0x25A276EA0]();
      MEMORY[0x25A276FE0](v4, 0x20C4093837F09);
    }
    MEMORY[0x25A276FE0](v2, 0x20C40A4A59CD2);
  }
  return a1;
}

uint64_t std::__thread_proxy[abi:ne180100]<std::tuple<std::unique_ptr<std::__thread_struct>,ClientLocalServer::tellServerToStartIO(void)::$_0>>(uint64_t *a1)
{
  int8x16_t v6 = (const void **)a1;
  unsigned __int8 v1 = std::__thread_local_data();
  uint64_t v2 = *v6;
  void *v6 = 0;
  pthread_setspecific(v1->__key_, v2);
  for (uint64_t i = (uint64_t)v6[1];
        ;
        IOThreadSynchronizer::signalAndWait(*(IOThreadSynchronizer **)(*(void *)(i + 56) + 8), 10.0, *(caulk::mach::semaphore **)(*(void *)(i + 56) + 24)))
  {
    unsigned __int8 v4 = atomic_load((unsigned __int8 *)(i + 80));
    if (v4) {
      break;
    }
  }
  std::unique_ptr<std::tuple<std::unique_ptr<std::__thread_struct>,ClientLocalServer::tellServerToStartIO(void)::$_0>>::~unique_ptr[abi:ne180100]((uint64_t **)&v6);
  return 0;
}

void sub_2543AA68C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::tuple<std::unique_ptr<std::__thread_struct>,ClientLocalServer::tellServerToStartIO(void)::$_0>>::~unique_ptr[abi:ne180100]((uint64_t **)va);
  _Unwind_Resume(a1);
}

void ClientLocalServer::getWorkgroupFromServer(ClientLocalServer *this)
{
  __p[16] = *(void **)MEMORY[0x263EF8340];
  std::string::basic_string[abi:ne180100]<0>(__p, "ClientLocalServer Workgroup");
  caulk::mach::os_workgroup_interval_managed::make();
  operator new();
}

void sub_2543AA854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  std::__shared_weak_count::~__shared_weak_count(v17);
  operator delete(v19);

  _Unwind_Resume(a1);
}

uint64_t *ClientLocalServer::releaseSharedIOThreadResourcesFromServer(ClientLocalServer *this)
{
  return std::unique_ptr<ServerIOThreadResources>::reset[abi:ne180100]((uint64_t *)this + 7, 0);
}

void ClientLocalServer::acquireSharedIOThreadResourcesFromServer(ClientLocalServer *this)
{
}

void sub_2543AA94C(_Unwind_Exception *a1)
{
  MEMORY[0x25A276FE0](v1, 0x10A0C40DFABB4B5);
  _Unwind_Resume(a1);
}

void *ClientLocalServer::makeConnectionToServer(uint64_t a1, uint64_t a2)
{
  return std::function<void ()(void)>::operator=((void *)(a1 + 88), a2);
}

void *std::function<void ()(void)>::operator=(void *a1, uint64_t a2)
{
  v8[3] = *MEMORY[0x263EF8340];
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v6, a2);
  if (v6 != a1)
  {
    uint64_t v3 = v7;
    unsigned __int8 v4 = (void *)a1[3];
    if (v7 == v6)
    {
      if (v4 == a1)
      {
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, v8);
        (*(void (**)(void *))(*v7 + 32))(v7);
        thread_act_t v7 = 0;
        (*(void (**)(void, void *))(*(void *)a1[3] + 24))(a1[3], v6);
        (*(void (**)(void))(*(void *)a1[3] + 32))(a1[3]);
        a1[3] = 0;
        thread_act_t v7 = v6;
        (*(void (**)(void *, void *))(v8[0] + 24))(v8, a1);
        (*(void (**)(void *))(v8[0] + 32))(v8);
      }
      else
      {
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a1);
        (*(void (**)(void *))(*v7 + 32))(v7);
        thread_act_t v7 = (void *)a1[3];
      }
      a1[3] = a1;
    }
    else if (v4 == a1)
    {
      (*(void (**)(void *, void *))(*a1 + 24))(a1, v6);
      (*(void (**)(void))(*(void *)a1[3] + 32))(a1[3]);
      a1[3] = v7;
      thread_act_t v7 = v6;
    }
    else
    {
      thread_act_t v7 = (void *)a1[3];
      a1[3] = v3;
    }
  }
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v6);
  return a1;
}

void sub_2543AAC0C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void sub_2543AADF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2)
  {
    if (*((void *)&a9 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&a9 + 1));
    }
    __cxa_begin_catch(exception_object);
    int v10 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(a9) = 136315394;
      *(void *)((char *)&a9 + 4) = "IsolatedCoreAudioXPCService.mm";
      WORD6(a9) = 1024;
      *(_DWORD *)((char *)&a9 + 14) = 148;
      _os_log_impl(&dword_25439F000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - stopIsolatedAudioForUseCase - landed in the catch!", (uint8_t *)&a9, 0x12u);
    }

    __cxa_end_catch();
    JUMPOUT(0x2543AADA8);
  }
  _Unwind_Resume(exception_object);
}

void sub_2543AB0D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, long long buf, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (a2)
  {
    if (a10) {
      std::__shared_weak_count::__release_shared[abi:ne180100](a10);
    }
    if (a15) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)a15);
    }
    if (*((void *)&buf + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
    }
    __cxa_begin_catch(exception_object);
    uint64_t v16 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315394;
      *(void *)((char *)&buf + 4) = "IsolatedCoreAudioXPCService.mm";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 131;
      _os_log_impl(&dword_25439F000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - startIsolatedAudioForUseCaseAtTime - landed in the catch!", (uint8_t *)&buf, 0x12u);
    }

    __cxa_end_catch();
    JUMPOUT(0x2543AB084);
  }
  _Unwind_Resume(exception_object);
}

void sub_2543AB404(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, long long buf)
{
  if (a2)
  {
    if (a12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](a12);
    }
    if (a15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](a15);
    }
    if (a10) {
      std::__shared_weak_count::__release_shared[abi:ne180100](a10);
    }
    __cxa_begin_catch(a1);
    __int16 v18 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315394;
      *(void *)((char *)&buf + 4) = "IsolatedCoreAudioXPCService.mm";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 114;
      _os_log_impl(&dword_25439F000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - startIsolatedAudioForUseCase - landed in the catch!", (uint8_t *)&buf, 0x12u);
    }

    __cxa_end_catch();
    JUMPOUT(0x2543AB3BCLL);
  }
  _Unwind_Resume(a1);
}

void sub_2543AB6C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a2)
  {
    uint64_t v14 = a12;
    a12 = 0;
    if (v14) {
      (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
    }

    __cxa_begin_catch(exception_object);
    int v15 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(a9) = 136315394;
      *(void *)((char *)&a9 + 4) = "IsolatedCoreAudioXPCService.mm";
      WORD6(a9) = 1024;
      *(_DWORD *)((char *)&a9 + 14) = 97;
      _os_log_impl(&dword_25439F000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - getWorkgroupForIsolatedAudio - landed in the catch!", (uint8_t *)&a9, 0x12u);
    }

    __cxa_end_catch();
    JUMPOUT(0x2543AB674);
  }
  _Unwind_Resume(exception_object);
}

void sub_2543AB9A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, uint64_t a12, long long buf, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  if (a2)
  {
    if (a10) {
      std::__shared_weak_count::__release_shared[abi:ne180100](a10);
    }
    if (a17) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)a17);
    }
    if (*((void *)&buf + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
    }
    __cxa_begin_catch(exception_object);
    __int16 v18 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315394;
      *(void *)((char *)&buf + 4) = "IsolatedCoreAudioXPCService.mm";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 80;
      _os_log_impl(&dword_25439F000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - checkOutForIsolatedAudioSharedResources - landed in the catch!", (uint8_t *)&buf, 0x12u);
    }

    __cxa_end_catch();
    JUMPOUT(0x2543AB978);
  }
  _Unwind_Resume(exception_object);
}

void sub_2543AC560(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void sub_2543AC86C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100]((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_2543ACB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  uint64_t v8 = v7;
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100]((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_2543ACC68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__shared_ptr_emplace<ServerSideHardware>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<ServerSideHardware>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C34E8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x25A276FE0);
}

void std::__shared_ptr_emplace<ServerSideHardware>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C34E8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ServerSideAudioSwitchboard>::__on_zero_shared(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[9];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = (void *)a1[5];
  if (v3)
  {
    do
    {
      unsigned __int8 v4 = (void *)*v3;
      uint64_t v5 = (std::__shared_weak_count *)v3[4];
      if (v5) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v5);
      }
      operator delete(v3);
      uint64_t v3 = v4;
    }
    while (v4);
  }
  int8x16_t v6 = (void *)a1[3];
  a1[3] = 0;
  if (v6)
  {
    operator delete(v6);
  }
}

void std::__shared_ptr_emplace<ServerSideAudioSwitchboard>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C35C8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x25A276FE0);
}

void std::__shared_ptr_emplace<ServerSideAudioSwitchboard>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C35C8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

BOOL HALUseCase::SetDeviceIDUsingUseCaseID(HALUseCase *this)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  int v2 = *((_DWORD *)this + 2);
  int inQualifierData = v2;
  uint64_t v3 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v20 = "HALUseCase.cpp";
    __int16 v21 = 1024;
    int v22 = 38;
    __int16 v23 = 1024;
    int v24 = v2;
    _os_log_impl(&dword_25439F000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d HALUseCase::SetDeviceIDUsingUseCaseID looking for: %u", buf, 0x18u);
  }
  UInt32 ioDataSize = 4;
  int outData = 0;
  *(void *)&inAddress.mSelector = *(void *)"diuibolg";
  inAddress.mElement = 0;
  OSStatus PropertyData = AudioObjectGetPropertyData(1u, &inAddress, 4u, &inQualifierData, &ioDataSize, &outData);
  if (PropertyData)
  {
    v5.i32[0] = bswap32(PropertyData);
    *(int8x8_t *)v5.i8 = vzip1_s8(*(int8x8_t *)v5.i8, *(int8x8_t *)v5.i8);
    v6.i64[0] = 0x1F0000001FLL;
    v6.i64[1] = 0x1F0000001FLL;
    v7.i64[0] = 0x5F0000005FLL;
    v7.i64[1] = 0x5F0000005FLL;
    *(int8x8_t *)v5.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)vcgtq_u32(v7, (uint32x4_t)vsraq_n_s32(v6, vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v5.i8), 0x18uLL), 0x18uLL))), *(int8x8_t *)v5.i8, (int8x8_t)0x2E002E002E002ELL);
    char v14 = 4;
    LODWORD(__p) = vmovn_s16(v5).u32[0];
    BYTE4(__p) = 0;
    uint64_t v8 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v20 = "HALUseCase.cpp";
      __int16 v21 = 1024;
      int v22 = 47;
      __int16 v23 = 1024;
      int v24 = inQualifierData;
      __int16 v25 = 2080;
      p_p = &__p;
      _os_log_impl(&dword_25439F000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d HALUseCase::SetDeviceIDUsingUseCaseID could not get device ID - looking for %u and received error: %s ", buf, 0x22u);
      if (v14 < 0) {
        operator delete(__p);
      }
    }
  }
  int v9 = outData;
  if (outData)
  {
    *((_DWORD *)this + 10) = outData;
    int v10 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = *((_DWORD *)this + 10);
      *(_DWORD *)buf = 136315650;
      uint64_t v20 = "HALUseCase.cpp";
      __int16 v21 = 1024;
      int v22 = 56;
      __int16 v23 = 1024;
      int v24 = v11;
      _os_log_impl(&dword_25439F000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d HALUseCase::SetDeviceIDUsingUseCaseID mDeviceID: %d", buf, 0x18u);
    }
  }
  return v9 != 0;
}

void HALUseCase::~HALUseCase(HALUseCase *this)
{
  HALUseCase::~HALUseCase(this);
  JUMPOUT(0x25A276FE0);
}

{
  std::__shared_weak_count *v2;

  *(void *)this = &unk_2703C2688;
  int v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  std::unique_ptr<CoreAudioCallback>::reset[abi:ne180100]((void **)this + 2);
}

void **std::unique_ptr<CoreAudioCallback>::reset[abi:ne180100](void **result)
{
  uint64_t v1 = *result;
  std::thread *result = 0;
  if (v1)
  {
    int v2 = (void *)v1[3];
    if (v2 == v1)
    {
      (*(void (**)(void *))(*v1 + 32))(v1);
    }
    else if (v2)
    {
      (*(void (**)(void *))(*v2 + 40))(v2);
    }
    JUMPOUT(0x25A276FE0);
  }
  return result;
}

void *_ZNKSt3__110__function6__funcIN28Isolated_Legacy_IO_Procedure14clientCallbackMUl18CoreAudioTimestampE_ENS_9allocatorIS4_EEFvS3_EE11target_typeEv()
{
  return &_ZTIN28Isolated_Legacy_IO_Procedure14clientCallbackMUl18CoreAudioTimestampE_E;
}

uint64_t _ZNKSt3__110__function6__funcIN28Isolated_Legacy_IO_Procedure14clientCallbackMUl18CoreAudioTimestampE_ENS_9allocatorIS4_EEFvS3_EE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"N28Isolated_Legacy_IO_Procedure14clientCallbackMUl18CoreAudioTimestampE_E"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void _ZNKSt3__110__function6__funcIN28Isolated_Legacy_IO_Procedure14clientCallbackMUl18CoreAudioTimestampE_ENS_9allocatorIS4_EEFvS3_EE7__cloneEPNS0_6__baseIS7_EE(uint64_t a1, void *a2)
{
  *a2 = &unk_2703C3D40;
}

void *_ZNKSt3__110__function6__funcIN28Isolated_Legacy_IO_Procedure14clientCallbackMUl18CoreAudioTimestampE_ENS_9allocatorIS4_EEFvS3_EE7__cloneEv()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_2703C3D40;
  return result;
}

void _ZNSt3__110__function6__funcIN28Isolated_Legacy_IO_Procedure14clientCallbackMUl18CoreAudioTimestampE_ENS_9allocatorIS4_EEFvS3_EED0Ev()
{
}

uint64_t std::__shared_ptr_emplace<Isolated_Legacy_IO_Procedure>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<Isolated_Legacy_IO_Procedure>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C3CF0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x25A276FE0);
}

void std::__shared_ptr_emplace<Isolated_Legacy_IO_Procedure>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C3CF0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void IOThreadClientMappedMemory::~IOThreadClientMappedMemory(IOThreadClientMappedMemory *this)
{
}

void ServerIOThreadResources::ServerIOThreadResources(ServerIOThreadResources *this)
{
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(void *)this = &unk_2703C2F78;
  operator new();
}

void sub_2543AD650(_Unwind_Exception *a1)
{
  IOThreadSynchronizer::~IOThreadSynchronizer(v1);
  _Unwind_Resume(a1);
}

void IsolatedCoreAudioSiphonPortal::~IsolatedCoreAudioSiphonPortal(id *this)
{
  IsolatedCoreAudioXPCPortal::~IsolatedCoreAudioXPCPortal(this);
  JUMPOUT(0x25A276FE0);
}

void sub_2543AD908(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2)
  {
    if (*((void *)&a9 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&a9 + 1));
    }
    __cxa_begin_catch(exception_object);
    int v10 = sIsolatedCoreAudioSiphonLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 136315394;
      *(void *)((char *)&a9 + 4) = "IsolatedCoreAudioXPCSiphon.mm";
      WORD6(a9) = 1024;
      *(_DWORD *)((char *)&a9 + 14) = 184;
      _os_log_impl(&dword_25439F000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d IsolatedCoreAudioXPCSiphon - requestAudio Landed in the catch!", (uint8_t *)&a9, 0x12u);
    }

    __cxa_end_catch();
    JUMPOUT(0x2543AD8C8);
  }
  _Unwind_Resume(exception_object);
}

id sIsolatedCoreAudioSiphonLog()
{
  unint64_t v0 = 0x269DEE000uLL;
  {
    unint64_t v0 = 0x269DEE000;
    if (v3)
    {
      sIsolatedCoreAudioSiphonLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudioSiphon");
      unint64_t v0 = 0x269DEE000;
    }
  }
  uint64_t v1 = *(void **)(v0 + 2080);
  return v1;
}

void sub_2543ADEA4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13, void *__p, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,long long buf)
{
  if (a2)
  {
    std::mutex::unlock(v23);
    std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&a17);
    if (a13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](a13);
    }
    __cxa_begin_catch(a1);
    __int16 v25 = sIsolatedCoreAudioSiphonLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315394;
      *(void *)((char *)&buf + 4) = "IsolatedCoreAudioXPCSiphon.mm";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 167;
      _os_log_impl(&dword_25439F000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d IsolatedCoreAudioXPCSiphon - stopIO Landed in the catch!", (uint8_t *)&buf, 0x12u);
    }

    __cxa_end_catch();
    JUMPOUT(0x2543ADE48);
  }
  _Unwind_Resume(a1);
}

void sub_2543AE4C0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, void *__p, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,long long buf)
{
  if (a2)
  {
    std::mutex::unlock(v21);
    std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&a16);
    if (a12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](a12);
    }
    __cxa_begin_catch(a1);
    __int16 v23 = sIsolatedCoreAudioSiphonLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315394;
      *(void *)((char *)&buf + 4) = "IsolatedCoreAudioXPCSiphon.mm";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 149;
      _os_log_impl(&dword_25439F000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d IsolatedCoreAudioXPCSiphon - startIO Landed in the catch!", (uint8_t *)&buf, 0x12u);
    }

    __cxa_end_catch();
    JUMPOUT(0x2543AE314);
  }
  _Unwind_Resume(a1);
}

void sub_2543AE684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2543AE9E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, long long buf)
{
  if (a2)
  {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,std::unique_ptr<SiphonClient>>,void *>>>::operator()[abi:ne180100](1, v12);
    if (*((void *)&buf + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
    }

    __cxa_begin_catch(exception_object);
    char v14 = sIsolatedCoreAudioSiphonLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315394;
      *(void *)((char *)&buf + 4) = "IsolatedCoreAudioXPCSiphon.mm";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 126;
      _os_log_impl(&dword_25439F000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d IsolatedCoreAudioXPCSiphon - setAudioAvailabilityCallback Landed in the catch!", (uint8_t *)&buf, 0x12u);
    }

    __cxa_end_catch();
    JUMPOUT(0x2543AE988);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<unsigned int,std::unique_ptr<SiphonClient>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<SiphonClient>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<SiphonClient>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unique_ptr<SiphonClient>>>>::__rehash<true>(uint64_t a1, size_t __n)
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
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }
    else
    {
      uint64_t v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }
    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      uint64_t v16 = *(void **)a1;
      *(void *)a1 = 0;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  int16x8_t v5 = operator new(8 * prime);
  int32x4_t v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  uint64_t v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }
    else
    {
      v9 &= prime - 1;
    }
    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    char v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *uint64_t v8 = *v14;
          void *v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          char v14 = v8;
        }
        size_t v15 = v9;
LABEL_31:
        uint64_t v8 = v14;
        char v14 = (void *)*v14;
        size_t v9 = v15;
      }
      while (v14);
    }
  }
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,std::unique_ptr<SiphonClient>>,void *>>>::operator()[abi:ne180100](char a1, void *__p)
{
  if (a1)
  {
    uint64_t v3 = __p[3];
    __p[3] = 0;
    if (v3) {
      std::default_delete<SiphonClient>::operator()[abi:ne180100](v3);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void std::default_delete<SiphonClient>::operator()[abi:ne180100](uint64_t a1)
{
  int v2 = *(std::__shared_weak_count **)(a1 + 24);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  JUMPOUT(0x25A276FE0);
}

void sub_2543AEF54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__throw_out_of_range[abi:ne180100]()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_2653A80B0, MEMORY[0x263F8C068]);
}

void sub_2543AEFE8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1)
{
  uint64_t result = std::logic_error::logic_error(a1, "unordered_map::at: key not found");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void sub_2543AF150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2543AF394(_Unwind_Exception *a1, uint64_t a2, std::__shared_weak_count *a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100]((uint64_t *)va);
  if (a3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a3);
  }
  _Unwind_Resume(a1);
}

void sub_2543AFB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17)
{
  if (a17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a17);
  }
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }

  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<IsolatedCoreAudioSiphon>::__on_zero_shared(uint64_t a1)
{
  int v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 32);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void std::__shared_ptr_emplace<IsolatedCoreAudioSiphon>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C4058;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x25A276FE0);
}

void std::__shared_ptr_emplace<IsolatedCoreAudioSiphon>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C4058;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_2543B00E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a16);
  }
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }

  _Unwind_Resume(a1);
}

void sub_2543B0738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,std::unique_ptr<SiphonClient>>,void *>>>::operator()[abi:ne180100](1, v22);
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](v20);
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100](&a20);
  std::default_delete<SiphonClient>::operator()[abi:ne180100](v21);
  int v24 = *(std::__shared_weak_count **)(a10 + 8);
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  _Unwind_Resume(a1);
}

void sub_2543B07C8()
{
  MEMORY[0x25A276FE0](v0, 0x1020C401C8C6399);
  JUMPOUT(0x2543B07B0);
}

void sub_2543B07E8()
{
}

void *std::__shared_ptr_emplace<SiphonIOClient>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 24);
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100]((void *)(a1 + 56));
  return std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100](v1);
}

void std::__shared_ptr_emplace<SiphonIOClient>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C4008;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x25A276FE0);
}

void std::__shared_ptr_emplace<SiphonIOClient>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C4008;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SiphonClientMap>::__on_zero_shared(uint64_t a1)
{
  int v2 = *(void **)(a1 + 40);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      uint64_t v4 = v2[3];
      v2[3] = 0;
      if (v4) {
        std::default_delete<SiphonClient>::operator()[abi:ne180100](v4);
      }
      operator delete(v2);
      int v2 = v3;
    }
    while (v3);
  }
  int16x8_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = 0;
  if (v5)
  {
    operator delete(v5);
  }
}

void std::__shared_ptr_emplace<SiphonClientMap>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C3E68;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x25A276FE0);
}

void std::__shared_ptr_emplace<SiphonClientMap>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C3E68;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void applesauce::dispatch::v1::async<SiphonIOClient::executeAvailabilityCallback(CoreAudioTimestamp)::$_0>(dispatch_queue_s *,SiphonIOClient::executeAvailabilityCallback(CoreAudioTimestamp)::$_0 &&)::{lambda(void *)#1}::__invoke(uint64_t *a1)
{
  std::function<void ()(CoreAudioTimestamp)>::operator()(*(void *)(*a1 + 24), a1[1], a1[2]);
  JUMPOUT(0x25A276FE0);
}

void sub_2543B0E54(_Unwind_Exception *a1)
{
  MEMORY[0x25A276FE0](v1, 0x1060C405D1B4BF9);
  _Unwind_Resume(a1);
}

uint64_t sIsolatedCoreAudioSiphonLog()
{
  unint64_t v0 = 0x269DEE000uLL;
  {
    unint64_t v0 = 0x269DEE000;
    if (v2)
    {
      sIsolatedCoreAudioSiphonLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudioSiphon");
      unint64_t v0 = 0x269DEE000;
    }
  }
  return *(void *)(v0 + 2096);
}

{
  unint64_t v0;
  int v2;

  unint64_t v0 = 0x269DEE000uLL;
  {
    unint64_t v0 = 0x269DEE000;
    if (v2)
    {
      sIsolatedCoreAudioSiphonLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudioSiphon");
      unint64_t v0 = 0x269DEE000;
    }
  }
  return *(void *)(v0 + 2256);
}

void ___ZN10applesauce8dispatch2v19sync_implIZN14SiphonIOClient22drainAvailabilityQueueEvE3__0EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  unint64_t v0 = sIsolatedCoreAudioSiphonLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315394;
    int v2 = "SiphonIOClient.cpp";
    __int16 v3 = 1024;
    int v4 = 55;
    _os_log_impl(&dword_25439F000, v0, OS_LOG_TYPE_DEFAULT, "%25s:%-5d SiphonIOClient::setHasStartedIO - Dispatch Queue has been flushed", (uint8_t *)&v1, 0x12u);
  }
}

void _ZNSt3__115allocate_sharedB8ne180100I38IsolatedCoreAudioClientExclaveKitProxyNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = operator new(0x38uLL);
  v2[1] = 0;
  v2[2] = 0;
  void *v2 = &unk_2703C2708;
  v2[3] = &unk_2703C2FE0;
  v2[4] = 0x400000400;
  v2[5] = 0;
  int v3 = tb_conclave_endpoint_for_service();
  if (v3)
  {
    int v4 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      uint64_t v7 = "IsolatedCoreAudioClientExclaveKitProxy.cpp";
      __int16 v8 = 1024;
      int v9 = 19;
      __int16 v10 = 1024;
      int v11 = v3;
      _os_log_impl(&dword_25439F000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Error getting IsolateCoreAudioClient TightBeam endpoint - this should not happen!!! ErrorCode: %u", (uint8_t *)&v6, 0x18u);
    }
  }
  else
  {
    tb_endpoint_set_interface_identifier();
    uint64_t v5 = tb_client_connection_create_with_endpoint();
    if (!tb_client_connection_activate()) {
      v2[6] = v5;
    }
  }
  *a1 = v2 + 3;
  a1[1] = v2;
}

void sub_2543B1118(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_emplace<IsolatedCoreAudioClientExclaveKitProxy>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<IsolatedCoreAudioClientExclaveKitProxy>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C2708;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x25A276FE0);
}

void std::__shared_ptr_emplace<IsolatedCoreAudioClientExclaveKitProxy>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C2708;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void MicrophoneActivityPortal::~MicrophoneActivityPortal(id *this)
{
  IsolatedCoreAudioXPCPortal::~IsolatedCoreAudioXPCPortal(this);
  JUMPOUT(0x25A276FE0);
}

uint64_t std::__shared_ptr_emplace<IsolatedCoreAudioClientMultiplexer>::__on_zero_shared(uint64_t a1)
{
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100]((void *)(a1 + 288));
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 232));
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 184));
  std::mutex::~mutex((std::mutex *)(a1 + 120));
  std::mutex::~mutex((std::mutex *)(a1 + 56));
  int v2 = *(std::__shared_weak_count **)(a1 + 40);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t result = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = 0;
  if (result)
  {
    int v4 = *(uint64_t (**)(void))(*(void *)result + 8);
    return v4();
  }
  return result;
}

void std::__shared_ptr_emplace<IsolatedCoreAudioClientMultiplexer>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C41E0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x25A276FE0);
}

void std::__shared_ptr_emplace<IsolatedCoreAudioClientMultiplexer>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C41E0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void *std::__function::__func<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>)::$_0,std::allocator<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>)::$_0>,void ()(CoreAudioTimestamp)>::target_type()
{
}

uint64_t std::__function::__func<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>)::$_0,std::allocator<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>)::$_0>,void ()(CoreAudioTimestamp)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN23IsolatedCoreAudioSiphonC1ENSt3__110shared_ptrIK15SiphonClientMapEEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>)::$_0,std::allocator<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>)::$_0>,void ()(CoreAudioTimestamp)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(a1 + 8);
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)(v3 + 32));
  if (v4)
  {
    (*(void (**)(void, uint64_t))(**(void **)(v3 + 16) + 48))(*(void *)(v3 + 16), v2);
    atomic_store(0, (unsigned __int8 *)(v3 + 32));
  }
  uint64_t v5 = *(uint64_t (**)(void))(**(void **)(v3 + 16) + 24);
  return v5();
}

uint64_t std::__function::__func<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>)::$_0,std::allocator<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>)::$_0>,void ()(CoreAudioTimestamp)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_2703C4160;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>)::$_0,std::allocator<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>)::$_0>,void ()(CoreAudioTimestamp)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_2703C4160;
  result[1] = v3;
  return result;
}

void std::__function::__func<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>)::$_0,std::allocator<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>)::$_0>,void ()(CoreAudioTimestamp)>::~__func()
{
}

uint64_t std::__shared_ptr_emplace<XPCConnectionToServer>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<XPCConnectionToServer>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C3520;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x25A276FE0);
}

void std::__shared_ptr_emplace<XPCConnectionToServer>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C3520;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::make_unique[abi:ne180100]<ClientSideAudioSwitchboard,std::function<void ()(void)> &,std::unique_ptr<RemoteAudioHardwareServer>>()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  operator new();
}

void sub_2543B1694(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va1);
  MEMORY[0x25A276FE0](v4, 0x1020C40D54691A9);
  uint64_t v6 = *(void *)(v2 + 80);
  *(void *)(v2 + 80) = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  std::__function::__value_func<void ()(LapseChain)>::~__value_func[abi:ne180100](v3);
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100]((void *)(v2 + 16));
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  MEMORY[0x25A276FE0](v2, 0x10A1C40BF658ADFLL);
  _Unwind_Resume(a1);
}

void *std::__function::__func<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_1,std::allocator<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_1>,void ()(CoreAudioTimestamp)>::target_type()
{
}

uint64_t std::__function::__func<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_1,std::allocator<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_1>,void ()(CoreAudioTimestamp)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN23IsolatedCoreAudioSiphonC1ENSt3__110shared_ptrIK15SiphonClientMapEENS1_I17ClientLocalServerEEE3$_1"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_1,std::allocator<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_1>,void ()(CoreAudioTimestamp)>::operator()(uint64_t result)
{
  return result;
}

uint64_t std::__function::__func<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_1,std::allocator<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_1>,void ()(CoreAudioTimestamp)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_2703C42B0;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_1,std::allocator<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_1>,void ()(CoreAudioTimestamp)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_2703C42B0;
  result[1] = v3;
  return result;
}

void std::__function::__func<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_1,std::allocator<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_1>,void ()(CoreAudioTimestamp)>::~__func()
{
}

void *std::__function::__func<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_0,std::allocator<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_0>,void ()(void)>::target_type()
{
}

uint64_t std::__function::__func<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_0,std::allocator<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_0>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN23IsolatedCoreAudioSiphonC1ENSt3__110shared_ptrIK15SiphonClientMapEENS1_I17ClientLocalServerEEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_0,std::allocator<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_0>,void ()(void)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_2703C4230;
}

void *std::__function::__func<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_0,std::allocator<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_0>,void ()(void)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_2703C4230;
  return result;
}

void std::__function::__func<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_0,std::allocator<IsolatedCoreAudioSiphon::IsolatedCoreAudioSiphon(std::shared_ptr<SiphonClientMap const>,std::shared_ptr<ClientLocalServer>)::$_0>,void ()(void)>::~__func()
{
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<AudioClientForUnitTests::GetInstance(void)::$_0 &&>>()
{
}

uint64_t std::__shared_ptr_pointer<StubbedIsolatedCoreAudioClientProxy  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"NSt3__114default_deleteI35StubbedIsolatedCoreAudioClientProxyEE"))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<StubbedIsolatedCoreAudioClientProxy  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<StubbedIsolatedCoreAudioClientProxy  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x25A276FE0);
}

uint64_t std::__shared_ptr_emplace<ClientLocalServer>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<ClientLocalServer>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C3478;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x25A276FE0);
}

void std::__shared_ptr_emplace<ClientLocalServer>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C3478;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void *std::__function::__func<createUnitTestClient(void)::$_0,std::allocator<createUnitTestClient(void)::$_0>,void ()(void)>::target_type()
{
}

uint64_t std::__function::__func<createUnitTestClient(void)::$_0,std::allocator<createUnitTestClient(void)::$_0>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"Z20createUnitTestClientvE3$_0")) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void std::__function::__func<createUnitTestClient(void)::$_0,std::allocator<createUnitTestClient(void)::$_0>,void ()(void)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_2703C4330;
}

void *std::__function::__func<createUnitTestClient(void)::$_0,std::allocator<createUnitTestClient(void)::$_0>,void ()(void)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_2703C4330;
  return result;
}

void std::__function::__func<createUnitTestClient(void)::$_0,std::allocator<createUnitTestClient(void)::$_0>,void ()(void)>::~__func()
{
}

void getClient(int a1)
{
  int v1 = a1;
  if (atomic_load_explicit((atomic_ullong *volatile)&getClient::sIsInitialized, memory_order_acquire) != -1)
  {
    uint64_t v3 = &v1;
    uint64_t v2 = &v3;
    std::__call_once(&getClient::sIsInitialized, &v2, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<getClient::$_0 &&>>);
  }
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<getClient(unsigned int)::$_0 &&>>(int ***a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v1 = **a1;
  uint64_t v2 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "AudioClientInstance.cpp";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 97;
    _os_log_impl(&dword_25439F000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AudioClientBase::getClient...", buf, 0x12u);
  }
  if (atomic_load_explicit((atomic_ullong *volatile)&AudioClientForUnitTests::GetInstance(void)::sOnce, memory_order_acquire) != -1)
  {
    *(void *)buf = &v10;
    uint64_t v9 = buf;
    std::__call_once(&AudioClientForUnitTests::GetInstance(void)::sOnce, &v9, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<AudioClientForUnitTests::GetInstance(void)::$_0 &&>>);
  }
  if (*(unsigned char *)AudioClientForUnitTests::GetInstance(void)::sInstance)
  {
    uint64_t v3 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "AudioClientInstance.cpp";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 54;
      _os_log_impl(&dword_25439F000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AudioClientBase::createUnitTestClient...", buf, 0x12u);
    }
    *(void *)buf = &unk_2703C4330;
    *(void *)&void v13[4] = buf;
    uint64_t v4 = (char *)operator new(0x90uLL);
    *(_OWORD *)(v4 + 8) = 0u;
    *(void *)uint64_t v4 = &unk_2703C3478;
    *((void *)v4 + 5) = &unk_2703C3368;
    *((void *)v4 + 8) = v4 + 40;
    *((void *)v4 + 3) = &unk_2703C2CD8;
    *((void *)v4 + 4) = &unk_2703C2D40;
    v4[105] = 0;
    *((void *)v4 + 17) = 0;
    *((void *)v4 + 10) = 0;
    *(_OWORD *)(v4 + 88) = 0u;
    operator new();
  }
  int v5 = *v1;
  uint64_t v6 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "AudioClientInstance.cpp";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 64;
    _os_log_impl(&dword_25439F000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AudioClientBase::createDedicatedClient...", buf, 0x12u);
  }
  _ZNSt3__115allocate_sharedB8ne180100I38IsolatedCoreAudioClientExclaveKitProxyNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(buf);
  uint64_t v7 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AudioClientInstance.cpp";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 75;
    __int16 v12 = 2080;
    *(void *)uint64_t v13 = "false";
    _os_log_impl(&dword_25439F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AudioClientBase::stubEKs = %s", buf, 0x1Cu);
  }
  __int16 v8 = operator new(0x38uLL);
  v8[1] = 0;
  v8[2] = 0;
  *__int16 v8 = &unk_2703C3520;
  XPCConnectionToServer::XPCConnectionToServer((XPCConnectionToServer *)(v8 + 3), v5);
  operator new();
}

void sub_2543B2264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(a1);
}

void sub_2543B242C()
{
}

void sub_2543B2434()
{
}

void IOThreadWorkgroup::IOThreadWorkgroup(IOThreadWorkgroup *this, OS_os_workgroup *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = caulk::mach::details::retain_os_object((caulk::mach::details *)a2, a2);
  caulk::mach::details::release_os_object(0, v3);
  uint64_t v5 = MEMORY[0x263F88698] + 16;
  uint64_t v6 = v2;
  long long v7 = 0u;
  memset(v8, 0, 25);
  caulk::mach::details::release_os_object(0, v4);
  operator new();
}

void sub_2543B2574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void RemoteAudioHardwareServer::~RemoteAudioHardwareServer(RemoteAudioHardwareServer *this)
{
  RemoteAudioHardwareServer::~RemoteAudioHardwareServer(this);
  JUMPOUT(0x25A276FE0);
}

{
  std::__shared_weak_count *v2;

  *(void *)this = &unk_2703C2E40;
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)this + 4);
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

void *RemoteAudioHardwareServer::connectToServer(RemoteAudioHardwareServer *this)
{
  v3[4] = *MEMORY[0x263EF8340];
  atomic_store(0, (unsigned __int8 *)this + 24);
  uint64_t v1 = *((void *)this + 1);
  v3[0] = &unk_2703C3260;
  v3[1] = this;
  v3[3] = v3;
  (*(void (**)(uint64_t, void *))(*(void *)v1 + 16))(v1, v3);
  return std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v3);
}

void sub_2543B26C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *std::__function::__func<RemoteAudioHardwareServer::connectToServer(void)::$_0,std::allocator<RemoteAudioHardwareServer::connectToServer(void)::$_0>,void ()(void)>::target_type()
{
}

uint64_t std::__function::__func<RemoteAudioHardwareServer::connectToServer(void)::$_0,std::allocator<RemoteAudioHardwareServer::connectToServer(void)::$_0>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN25RemoteAudioHardwareServer15connectToServerEvE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<RemoteAudioHardwareServer::connectToServer(void)::$_0,std::allocator<RemoteAudioHardwareServer::connectToServer(void)::$_0>,void ()(void)>::operator()(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 8);
  {
    sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudio");
  }
  uint64_t v2 = sIsolatedCoreAudioLog(void)::sLog;
  if (os_log_type_enabled((os_log_t)sIsolatedCoreAudioLog(void)::sLog, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315394;
    uint64_t v4 = "RemoteAudioHardwareServer.mm";
    __int16 v5 = 1024;
    int v6 = 23;
    _os_log_impl(&dword_25439F000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d RemoteAudioHardwareServer::RemoteAudioHardwareServer::InvalidationHandler - Connection invalidated!!!", (uint8_t *)&v3, 0x12u);
  }
  atomic_store(1u, (unsigned __int8 *)(v1 + 24));
}

uint64_t std::__function::__func<RemoteAudioHardwareServer::connectToServer(void)::$_0,std::allocator<RemoteAudioHardwareServer::connectToServer(void)::$_0>,void ()(void)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_2703C3260;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<RemoteAudioHardwareServer::connectToServer(void)::$_0,std::allocator<RemoteAudioHardwareServer::connectToServer(void)::$_0>,void ()(void)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_2703C3260;
  result[1] = v3;
  return result;
}

void std::__function::__func<RemoteAudioHardwareServer::connectToServer(void)::$_0,std::allocator<RemoteAudioHardwareServer::connectToServer(void)::$_0>,void ()(void)>::~__func()
{
}

void RemoteAudioHardwareServer::RemoteAudioHardwareServer(RemoteAudioHardwareServer *this, uint64_t a2, uint64_t a3)
{
  *(void *)this = &unk_2703C2E40;
  *((void *)this + 1) = a2;
  *((void *)this + 2) = a3;
  if (a3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(a3 + 8), 1uLL, memory_order_relaxed);
  }
  *((unsigned char *)this + 24) = 1;
  *((void *)this + 7) = 0;
  RemoteAudioHardwareServer::connectToServer(this);
}

void sub_2543B2924(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)(v1 + 32));
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 16);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(a1);
}

void sub_2543B2A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2543B2AF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2543B2BE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2543B2D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2543B2EA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2543B2F40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2543B2FB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t IsolatedIOProcTemplate<&(SetLegacyIOProcForIsolatedUseCase(IsolatedAudio_UseCaseID,std::shared_ptr<Isolated_Legacy_IO_Procedure> *)::smart_ptr_to_meterClient_ptr)>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    std::function<void ()(CoreAudioTimestamp)>::operator()(*(void *)(*(void *)SetLegacyIOProcForIsolatedUseCase(IsolatedAudio_UseCaseID,std::shared_ptr<Isolated_Legacy_IO_Procedure> *)::smart_ptr_to_meterClient_ptr+ 32), *(void *)(a4 + 8), (unint64_t)*(double *)a4);
  }
  return 0;
}

uint64_t IsolatedIOProcTemplate<&(SetLegacyIOProcForIsolatedUseCase(IsolatedAudio_UseCaseID,std::shared_ptr<Isolated_Legacy_IO_Procedure> *)::smart_ptr_to_sharedDSP_ptr)>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    std::function<void ()(CoreAudioTimestamp)>::operator()(*(void *)(*(void *)SetLegacyIOProcForIsolatedUseCase(IsolatedAudio_UseCaseID,std::shared_ptr<Isolated_Legacy_IO_Procedure> *)::smart_ptr_to_sharedDSP_ptr+ 32), *(void *)(a4 + 8), (unint64_t)*(double *)a4);
  }
  return 0;
}

uint64_t IsolatedIOProcTemplate<&(SetLegacyIOProcForIsolatedUseCase(IsolatedAudio_UseCaseID,std::shared_ptr<Isolated_Legacy_IO_Procedure> *)::smart_ptr_to_sound_analysis_ptr)>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    std::function<void ()(CoreAudioTimestamp)>::operator()(*(void *)(*(void *)SetLegacyIOProcForIsolatedUseCase(IsolatedAudio_UseCaseID,std::shared_ptr<Isolated_Legacy_IO_Procedure> *)::smart_ptr_to_sound_analysis_ptr+ 32), *(void *)(a4 + 8), (unint64_t)*(double *)a4);
  }
  return 0;
}

uint64_t IsolatedIOProcTemplate<&(SetLegacyIOProcForIsolatedUseCase(IsolatedAudio_UseCaseID,std::shared_ptr<Isolated_Legacy_IO_Procedure> *)::smart_ptr_to_siri_ptr)>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    std::function<void ()(CoreAudioTimestamp)>::operator()(*(void *)(*(void *)SetLegacyIOProcForIsolatedUseCase(IsolatedAudio_UseCaseID,std::shared_ptr<Isolated_Legacy_IO_Procedure> *)::smart_ptr_to_siri_ptr+ 32), *(void *)(a4 + 8), (unint64_t)*(double *)a4);
  }
  return 0;
}

void IOThreadSynchronizer::~IOThreadSynchronizer(IOThreadSynchronizer *this)
{
  IOThreadSynchronizer::~IOThreadSynchronizer(this);
  JUMPOUT(0x25A276FE0);
}

{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;

  *(void *)this = &unk_2703C2DC8;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

uint64_t IOThreadSynchronizer::signalAndWait(IOThreadSynchronizer *this, double a2, caulk::mach::semaphore *a3)
{
  uint64_t result = caulk::mach::semaphore::timed_wait_signal_or_error(a3, this, a2);
  uint64_t v4 = result;
  if ((result & 0xFF00000000) != 0)
  {
    caulk::expected<BOOL,int>::value((uint64_t)&v4);
    if ((_BYTE)v4) {
      return 0;
    }
    else {
      return 49;
    }
  }
  return result;
}

uint64_t Isolated_Legacy_IO_Procedure::ConsumeInputTimestampFromLegacyIOProc(uint64_t this, const AudioTimeStamp *a2)
{
  if (a2) {
    return std::function<void ()(CoreAudioTimestamp)>::operator()(*(void *)(this + 32), a2->mHostTime, (unint64_t)a2->mSampleTime);
  }
  return this;
}

void Isolated_Legacy_IO_Procedure::~Isolated_Legacy_IO_Procedure(Isolated_Legacy_IO_Procedure *this)
{
  *(void *)this = &unk_2703C43C0;
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100]((void *)this + 1);
  JUMPOUT(0x25A276FE0);
}

{
  *(void *)this = &unk_2703C43C0;
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100]((void *)this + 1);
}

void *non-virtual thunk to'ClientSideAudioSwitchboard::SetServerDiedMessager(uint64_t a1, uint64_t a2)
{
  return std::function<void ()(void)>::operator=((void *)(a1 + 88), a2);
}

uint64_t non-virtual thunk to'ClientSideAudioSwitchboard::HandleServerDeath(ClientSideAudioSwitchboard *this)
{
  return ClientSideAudioSwitchboard::HandleServerDeath((ClientSideAudioSwitchboard *)((char *)this - 8));
}

uint64_t ClientSideAudioSwitchboard::HandleServerDeath(ClientSideAudioSwitchboard *this)
{
  (*(void (**)(ClientSideAudioSwitchboard *))(*(void *)this + 56))(this);
  uint64_t v2 = *((void *)this + 15);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)v2 + 48);
  return v3();
}

void non-virtual thunk to'ClientSideAudioSwitchboard::~ClientSideAudioSwitchboard(ClientSideAudioSwitchboard *this)
{
  ClientSideAudioSwitchboard::~ClientSideAudioSwitchboard((ClientSideAudioSwitchboard *)((char *)this - 8));
  JUMPOUT(0x25A276FE0);
}

{
  ClientSideAudioSwitchboard::~ClientSideAudioSwitchboard((ClientSideAudioSwitchboard *)((char *)this - 8));
}

void ClientSideAudioSwitchboard::~ClientSideAudioSwitchboard(ClientSideAudioSwitchboard *this)
{
  *(void *)this = &unk_2703C2E60;
  *((void *)this + 1) = &unk_2703C2EC0;
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)this + 12);
  uint64_t v2 = *((void *)this + 11);
  *((void *)this + 11) = 0;
  if (v2)
  {
    std::unique_ptr<caulk::mach::semaphore>::reset[abi:ne180100]((uint64_t *)(v2 + 72));
    uint64_t v3 = *(std::__shared_weak_count **)(v2 + 64);
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    std::unique_ptr<IOThread>::reset[abi:ne180100]((uint64_t *)(v2 + 48), 0);
    uint64_t v4 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
    if (v4) {
      std::default_delete<IOThreadWork>::operator()[abi:ne180100](v4);
    }
    std::unique_ptr<ClientIOThreadResources>::reset[abi:ne180100]((IOThreadSynchronizer **)(v2 + 32), 0);
    __int16 v5 = std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)v2);
    MEMORY[0x25A276FE0](v5, 0x1020C40D54691A9);
  }
  uint64_t v6 = *((void *)this + 10);
  *((void *)this + 10) = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  std::__function::__value_func<void ()(LapseChain)>::~__value_func[abi:ne180100]((void *)this + 6);
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100]((void *)this + 2);
}

{
  uint64_t vars8;

  ClientSideAudioSwitchboard::~ClientSideAudioSwitchboard(this);
  JUMPOUT(0x25A276FE0);
}

void *ClientSideAudioSwitchboard::SetServerDiedMessager(uint64_t a1, uint64_t a2)
{
  return std::function<void ()(void)>::operator=((void *)(a1 + 96), a2);
}

uint64_t ClientSideAudioSwitchboard::stopIOProc(ClientSideAudioSwitchboard *this)
{
  (*(void (**)(void))(**(void **)(*((void *)this + 10) + 8) + 64))(*(void *)(*((void *)this + 10)
                                                                                                  + 8));
  ClientSideAudioSwitchboardIOThread::stop(*((ClientSideAudioSwitchboardIOThread **)this + 11));
  uint64_t v2 = *(uint64_t (**)(void))(**(void **)(*((void *)this + 10) + 8) + 32);
  return v2();
}

void ClientSideAudioSwitchboard::startIOProcAtTime(ClientSideAudioSwitchboard *this, uint64_t a2)
{
  v2[4] = *MEMORY[0x263EF8340];
  v2[0] = &unk_2703C3310;
  v2[1] = this;
  v2[2] = a2;
  v2[3] = v2;
  ClientSideAudioSwitchboard::startIO((uint64_t)this);
}

void sub_2543B3568(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void ClientSideAudioSwitchboard::startIO(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 80);
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)(v1 + 24));
  if (v2) {
    RemoteAudioHardwareServer::connectToServer(*(RemoteAudioHardwareServer **)(a1 + 80));
  }
  (*(void (**)(uint64_t *__return_ptr))(**(void **)(v1 + 8) + 24))(&buf);
  *(_OWORD *)&v5.__r_.__value_.__l.__data_ = *(_OWORD *)buf_8;
  operator new();
}

void sub_2543B3FDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void *std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](void *a1)
{
  unsigned __int8 v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void *std::__function::__func<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0>,BOOL ()(void)>::target_type()
{
}

uint64_t std::__function::__func<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0>,BOOL ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN26ClientSideAudioSwitchboard17startIOProcAtTimeEyE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

BOOL std::__function::__func<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0>,BOOL ()(void)>::operator()(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 8) + 80) + 8);
  return (*(unsigned int (**)(uint64_t, uint64_t))(*(void *)v2 + 56))(v2, v1) == 0;
}

__n128 std::__function::__func<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0>,BOOL ()(void)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_2703C3310;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 std::__function::__func<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0>,BOOL ()(void)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_2703C3310;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

void std::__function::__func<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0>,BOOL ()(void)>::~__func()
{
}

void ClientSideAudioSwitchboard::startIOProc(ClientSideAudioSwitchboard *this)
{
  v1[4] = *MEMORY[0x263EF8340];
  v1[0] = &unk_2703C32B8;
  v1[1] = this;
  v1[3] = v1;
  ClientSideAudioSwitchboard::startIO((uint64_t)this);
}

void sub_2543B43DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *std::__function::__func<ClientSideAudioSwitchboard::startIOProc(void)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProc(void)::$_0>,BOOL ()(void)>::target_type()
{
}

uint64_t std::__function::__func<ClientSideAudioSwitchboard::startIOProc(void)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProc(void)::$_0>,BOOL ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN26ClientSideAudioSwitchboard11startIOProcEvE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

BOOL std::__function::__func<ClientSideAudioSwitchboard::startIOProc(void)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProc(void)::$_0>,BOOL ()(void)>::operator()(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(a1 + 8) + 80) + 8);
  return (*(unsigned int (**)(uint64_t))(*(void *)v1 + 48))(v1) == 0;
}

uint64_t std::__function::__func<ClientSideAudioSwitchboard::startIOProc(void)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProc(void)::$_0>,BOOL ()(void)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_2703C32B8;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<ClientSideAudioSwitchboard::startIOProc(void)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProc(void)::$_0>,BOOL ()(void)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_2703C32B8;
  result[1] = v3;
  return result;
}

void std::__function::__func<ClientSideAudioSwitchboard::startIOProc(void)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProc(void)::$_0>,BOOL ()(void)>::~__func()
{
}

void *ClientSideAudioSwitchboard::setLapseCallback(uint64_t a1, uint64_t a2)
{
  v9[3] = *MEMORY[0x263EF8340];
  std::__function::__value_func<void ()(LapseChain)>::__value_func[abi:ne180100]((uint64_t)v7, a2);
  uint64_t v3 = a1 + 48;
  if ((void *)(a1 + 48) != v7)
  {
    uint64_t v4 = v8;
    uint64_t v5 = *(void *)(a1 + 72);
    if (v8 == v7)
    {
      if (v5 == v3)
      {
        (*(void (**)(void *, void *))(v7[0] + 24))(v7, v9);
        (*(void (**)(void *))(*v8 + 32))(v8);
        __int16 v8 = 0;
        (*(void (**)(void, void *))(**(void **)(a1 + 72) + 24))(*(void *)(a1 + 72), v7);
        (*(void (**)(void))(**(void **)(a1 + 72) + 32))(*(void *)(a1 + 72));
        *(void *)(a1 + atomic_store(1u, (unsigned __int8 *)this + 72) = 0;
        __int16 v8 = v7;
        (*(void (**)(void *, uint64_t))(v9[0] + 24))(v9, a1 + 48);
        (*(void (**)(void *))(v9[0] + 32))(v9);
      }
      else
      {
        (*(void (**)(void *, uint64_t))(v7[0] + 24))(v7, a1 + 48);
        (*(void (**)(void *))(*v8 + 32))(v8);
        __int16 v8 = *(void **)(a1 + 72);
      }
      *(void *)(a1 + atomic_store(1u, (unsigned __int8 *)this + 72) = v3;
    }
    else if (v5 == v3)
    {
      (*(void (**)(uint64_t, void *))(*(void *)v3 + 24))(a1 + 48, v7);
      (*(void (**)(void))(**(void **)(a1 + 72) + 32))(*(void *)(a1 + 72));
      *(void *)(a1 + atomic_store(1u, (unsigned __int8 *)this + 72) = v8;
      __int16 v8 = v7;
    }
    else
    {
      __int16 v8 = *(void **)(a1 + 72);
      *(void *)(a1 + atomic_store(1u, (unsigned __int8 *)this + 72) = v4;
    }
  }
  return std::__function::__value_func<void ()(LapseChain)>::~__value_func[abi:ne180100](v7);
}

void sub_2543B47A0(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void *ClientSideAudioSwitchboard::createIOProc(uint64_t a1, uint64_t a2)
{
  return std::function<void ()(CoreAudioTimestamp)>::operator=((void *)(a1 + 16), a2);
}

void ServerDeathMessage(void)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v0 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315394;
    uint64_t v2 = "ClientSideAudioSwitchboard.cpp";
    __int16 v3 = 1024;
    int v4 = 17;
    _os_log_impl(&dword_25439F000, v0, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ClientSideAudioSwitchboard::ServerDeathMessage - server disappeared!", (uint8_t *)&v1, 0x12u);
  }
}

void defaultIOThreadExitHandler(void)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v0 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315394;
    uint64_t v2 = "ClientSideAudioSwitchboard.cpp";
    __int16 v3 = 1024;
    int v4 = 23;
    _os_log_impl(&dword_25439F000, v0, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ClientSideAudioSwitchboard::defaultIOThreadExitHandler - Local IO Thread has exited.", (uint8_t *)&v1, 0x12u);
  }
}

void *std::__function::__func<void (*)(void),std::allocator<void (*)(void)>,void ()(void)>::target_type()
{
}

uint64_t std::__function::__func<void (*)(void),std::allocator<void (*)(void)>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), 0x80000002543BACD7)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

uint64_t std::__function::__func<void (*)(void),std::allocator<void (*)(void)>,void ()(void)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 8))();
}

uint64_t std::__function::__func<void (*)(void),std::allocator<void (*)(void)>,void ()(void)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_2703C30A8;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<void (*)(void),std::allocator<void (*)(void)>,void ()(void)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_2703C30A8;
  result[1] = v3;
  return result;
}

void std::__function::__func<void (*)(void),std::allocator<void (*)(void)>,void ()(void)>::~__func()
{
}

void *std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_0,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_0>,void ()(LapseChain)>::target_type()
{
}

uint64_t std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_0,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_0>,void ()(LapseChain)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN26ClientSideAudioSwitchboardC1ENSt3__18functionIFvvEEENS0_10unique_ptrI25RemoteAudioHardwareServerNS0_14default_deleteIS5_EEEEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_0,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_0>,void ()(LapseChain)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_2703C43F8;
}

void *std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_0,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_0>,void ()(LapseChain)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_2703C43F8;
  return result;
}

void std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_0,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_0>,void ()(LapseChain)>::~__func()
{
}

void *std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::shared_ptr<ConnectionToServer>)::$_0,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::shared_ptr<ConnectionToServer>)::$_0>,void ()(LapseChain)>::target_type()
{
}

uint64_t std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::shared_ptr<ConnectionToServer>)::$_0,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::shared_ptr<ConnectionToServer>)::$_0>,void ()(LapseChain)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN26ClientSideAudioSwitchboardC1ENSt3__110shared_ptrI18ConnectionToServerEEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::shared_ptr<ConnectionToServer>)::$_0,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::shared_ptr<ConnectionToServer>)::$_0>,void ()(LapseChain)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_2703C4478;
}

void *std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::shared_ptr<ConnectionToServer>)::$_0,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::shared_ptr<ConnectionToServer>)::$_0>,void ()(LapseChain)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_2703C4478;
  return result;
}

void std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::shared_ptr<ConnectionToServer>)::$_0,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::shared_ptr<ConnectionToServer>)::$_0>,void ()(LapseChain)>::~__func()
{
}

void ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(void *a1)
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  *a1 = &unk_2703C2E60;
  a1[1] = &unk_2703C2EC0;
  a1[5] = 0;
  a1[6] = &unk_2703C4478;
  a1[9] = a1 + 6;
  operator new();
}

void sub_2543B4D68(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  MEMORY[0x25A276FE0](v4, 0x1020C40D54691A9);
  uint64_t v6 = *(void *)(v2 + 80);
  *(void *)(v2 + 80) = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  std::__function::__value_func<void ()(LapseChain)>::~__value_func[abi:ne180100](v3);
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::~__value_func[abi:ne180100]((void *)(v2 + 16));
  _Unwind_Resume(a1);
}

void SiphonClientMap::disableAvailabilityCallbacksForClient(SiphonClientMap *this, unsigned int a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>>>::find<unsigned int>(this, a2);
  if (v3)
  {
    uint64_t v5 = v3;
    v4.i32[0] = bswap32(a2);
    *(int8x8_t *)v4.i8 = vzip1_s8(*(int8x8_t *)v4.i8, *(int8x8_t *)v4.i8);
    v6.i64[0] = 0x1F0000001FLL;
    v6.i64[1] = 0x1F0000001FLL;
    v7.i64[0] = 0x5F0000005FLL;
    v7.i64[1] = 0x5F0000005FLL;
    *(int8x8_t *)v4.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)vcgtq_u32(v7, (uint32x4_t)vsraq_n_s32(v6, vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v4.i8), 0x18uLL), 0x18uLL))), *(int8x8_t *)v4.i8, (int8x8_t)0x2E002E002E002ELL);
    char v11 = 4;
    LODWORD(__p) = vmovn_s16(v4).u32[0];
    BYTE4(__p) = 0;
    __int16 v8 = sIsolatedCoreAudioSiphonLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 136315650;
      uint64_t v13 = "SiphonClientMap.cpp";
      __int16 v14 = 1024;
      int v15 = 32;
      __int16 v16 = 2080;
      p_p = &__p;
      _os_log_impl(&dword_25439F000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Stopping IO on the %s client", buf, 0x1Cu);
      int v9 = v11;
      atomic_store(0, (unsigned __int8 *)(*(void *)v5[3] + 64));
      if (v9 < 0) {
        operator delete(__p);
      }
    }
    else
    {
      atomic_store(0, (unsigned __int8 *)(*(void *)v5[3] + 64));
    }
  }
}

void SiphonClientMap::disableLapseHandlingForClient(SiphonClientMap *this, unsigned int a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>>>::find<unsigned int>(this, a2);
  if (v3)
  {
    uint64_t v5 = v3;
    v4.i32[0] = bswap32(a2);
    *(int8x8_t *)v4.i8 = vzip1_s8(*(int8x8_t *)v4.i8, *(int8x8_t *)v4.i8);
    v6.i64[0] = 0x1F0000001FLL;
    v6.i64[1] = 0x1F0000001FLL;
    v7.i64[0] = 0x5F0000005FLL;
    v7.i64[1] = 0x5F0000005FLL;
    *(int8x8_t *)v4.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)vcgtq_u32(v7, (uint32x4_t)vsraq_n_s32(v6, vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v4.i8), 0x18uLL), 0x18uLL))), *(int8x8_t *)v4.i8, (int8x8_t)0x2E002E002E002ELL);
    char v11 = 4;
    LODWORD(__p) = vmovn_s16(v4).u32[0];
    BYTE4(__p) = 0;
    __int16 v8 = sIsolatedCoreAudioSiphonLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 136315650;
      uint64_t v13 = "SiphonClientMap.cpp";
      __int16 v14 = 1024;
      int v15 = 55;
      __int16 v16 = 2080;
      p_p = &__p;
      _os_log_impl(&dword_25439F000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Disabling lapse handling on %s client", buf, 0x1Cu);
      int v9 = v11;
      atomic_store(0, (unsigned __int8 *)(*(void *)v5[3] + 65));
      if (v9 < 0) {
        operator delete(__p);
      }
    }
    else
    {
      atomic_store(0, (unsigned __int8 *)(*(void *)v5[3] + 65));
    }
  }
}

void ServerSideAudioSwitchboard::GetClientForIO(ServerSideAudioSwitchboard *this, uint64_t a2, unsigned int a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (!std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>>>::find<unsigned int>((void *)a2, a3))
  {
    int v9 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315650;
      unint64_t v26 = "ServerSideAudioSwitchboard.cpp";
      __int16 v27 = 1024;
      int v28 = 122;
      __int16 v29 = 1024;
      unsigned int v30 = a3;
      _os_log_impl(&dword_25439F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ServerSideAudioSwitchboard::GetClientForIO - No client exists for %u!", (uint8_t *)&v25, 0x18u);
    }
    char v10 = 0;
    *(unsigned char *)this = 0;
    goto LABEL_47;
  }
  unint64_t v7 = *(void *)(a2 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = a3;
      if (v7 <= a3) {
        unint64_t v3 = a3 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & a3;
    }
    char v11 = *(void ***)(*(void *)a2 + 8 * v3);
    if (v11)
    {
      uint64_t v12 = *v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == a3)
          {
            if (*((_DWORD *)v12 + 4) == a3) {
              goto LABEL_44;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v13 >= v7) {
                v13 %= v7;
              }
            }
            else
            {
              v13 &= v7 - 1;
            }
            if (v13 != v3) {
              break;
            }
          }
          uint64_t v12 = (void *)*v12;
        }
        while (v12);
      }
    }
  }
  uint64_t v12 = operator new(0x28uLL);
  *uint64_t v12 = 0;
  v12[1] = a3;
  *((_DWORD *)v12 + 4) = a3;
  v12[3] = 0;
  v12[4] = 0;
  float v14 = (float)(unint64_t)(*(void *)(a2 + 24) + 1);
  float v15 = *(float *)(a2 + 32);
  if (!v7 || (float)(v15 * (float)v7) < v14)
  {
    BOOL v16 = 1;
    if (v7 >= 3) {
      BOOL v16 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v7);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    std::__hash_table<std::__hash_value_type<unsigned int,std::unique_ptr<SiphonClient>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<SiphonClient>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<SiphonClient>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unique_ptr<SiphonClient>>>>::__rehash<true>(a2, v19);
    unint64_t v7 = *(void *)(a2 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= a3) {
        unint64_t v3 = a3 % v7;
      }
      else {
        unint64_t v3 = a3;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & a3;
    }
  }
  uint64_t v20 = *(void *)a2;
  uint64_t v21 = *(void **)(*(void *)a2 + 8 * v3);
  if (v21)
  {
    *uint64_t v12 = *v21;
  }
  else
  {
    *uint64_t v12 = *(void *)(a2 + 16);
    *(void *)(a2 + 16) = v12;
    *(void *)(v20 + 8 * v3) = a2 + 16;
    if (!*v12) {
      goto LABEL_43;
    }
    unint64_t v22 = *(void *)(*v12 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v22 >= v7) {
        v22 %= v7;
      }
    }
    else
    {
      v22 &= v7 - 1;
    }
    uint64_t v21 = (void *)(*(void *)a2 + 8 * v22);
  }
  *uint64_t v21 = v12;
LABEL_43:
  ++*(void *)(a2 + 24);
LABEL_44:
  *(void *)this = v12[3];
  uint64_t v23 = v12[4];
  *((void *)this + 1) = v23;
  if (v23)
  {
    int v24 = (atomic_ullong *)(v23 + 8);
    char v10 = 1;
    atomic_fetch_add_explicit(v24, 1uLL, memory_order_relaxed);
  }
  else
  {
    char v10 = 1;
  }
LABEL_47:
  *((unsigned char *)this + 16) = v10;
}

void sub_2543B5404(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,void *>>>::operator()[abi:ne180100](1, v1);
  _Unwind_Resume(a1);
}

void std::__throw_bad_optional_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3B0] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C200], MEMORY[0x263F8C088]);
}

uint64_t ServerSideAudioSwitchboard::stopServerIOThread(ServerSideAudioSwitchboard *this, unsigned int a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  ServerSideAudioSwitchboard::GetClientForIO((ServerSideAudioSwitchboard *)&v17, (uint64_t)this, a2);
  int v5 = v19;
  if (v19 && *(unsigned char *)(v17[2] + 64))
  {
    uint64_t v6 = *((void *)this + 5);
    unint64_t v7 = (std::__shared_weak_count *)v17[1];
    uint64_t v13 = *v17;
    float v14 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v6 + 64))(v6, &v13);
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
LABEL_11:
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
    return v8;
  }
  v4.i32[0] = bswap32(a2);
  *(int8x8_t *)v4.i8 = vzip1_s8(*(int8x8_t *)v4.i8, *(int8x8_t *)v4.i8);
  v9.i64[0] = 0x1F0000001FLL;
  v9.i64[1] = 0x1F0000001FLL;
  v10.i64[0] = 0x5F0000005FLL;
  v10.i64[1] = 0x5F0000005FLL;
  *(int8x8_t *)v4.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)vcgtq_u32(v10, (uint32x4_t)vsraq_n_s32(v9, vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v4.i8), 0x18uLL), 0x18uLL))), *(int8x8_t *)v4.i8, (int8x8_t)0x2E002E002E002ELL);
  char v16 = 4;
  LODWORD(__p) = vmovn_s16(v4).u32[0];
  BYTE4(__p) = 0;
  char v11 = sIsolatedCoreAudioServerLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 136315650;
    uint64_t v21 = "ServerSideAudioSwitchboard.cpp";
    __int16 v22 = 1024;
    int v23 = 69;
    __int16 v24 = 2080;
    p_p = &__p;
    _os_log_impl(&dword_25439F000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ServerSideAudioSwitchboard::stopServerIOThread IO not stopped for client %s", buf, 0x1Cu);
    if (v16 < 0) {
      operator delete(__p);
    }
  }
  uint64_t v8 = 4;
  if (v5) {
    goto LABEL_11;
  }
  return v8;
}

void sub_2543B5694(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  if (a15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sIsolatedCoreAudioServerLog(void)
{
  unint64_t v0 = 0x269DEE000uLL;
  {
    unint64_t v0 = 0x269DEE000;
    if (v2)
    {
      sIsolatedCoreAudioServerLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudioServer");
      unint64_t v0 = 0x269DEE000;
    }
  }
  return *(void *)(v0 + 2288);
}

uint64_t ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0::~$_0(uint64_t a1)
{
  int v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  unint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return a1;
}

void *std::__function::__func<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0,std::allocator<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0>,void ()(void)>::target_type()
{
}

uint64_t std::__function::__func<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0,std::allocator<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN26ServerSideAudioSwitchboard16addClientUseCaseEjE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0,std::allocator<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0>,void ()(void)>::operator()(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (v1) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v1 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  operator new();
}

uint64_t *std::unique_ptr<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0::operator() const(void)::{lambda(void)#1},std::default_delete<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0::operator() const(void)::{lambda(void)#1}>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    unint64_t v3 = *(std::__shared_weak_count **)(v2 + 32);
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    int16x8_t v4 = *(std::__shared_weak_count **)(v2 + 16);
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    MEMORY[0x25A276FE0](v2, 0x1020C40E2DCC865);
  }
  return a1;
}

uint64_t *applesauce::dispatch::v1::async<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0::operator() const(void)::{lambda(void)#1}>(dispatch_queue_s *,ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0::operator() const(void)::{lambda(void)#1} &&)::{lambda(void *)#1}::__invoke(uint64_t a1, int16x8_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v9 = a1;
  a2.i32[0] = bswap32(*(_DWORD *)a1);
  *(int8x8_t *)a2.i8 = vzip1_s8(*(int8x8_t *)a2.i8, *(int8x8_t *)a2.i8);
  v3.i64[0] = 0x1F0000001FLL;
  v3.i64[1] = 0x1F0000001FLL;
  v4.i64[0] = 0x5F0000005FLL;
  v4.i64[1] = 0x5F0000005FLL;
  *(int8x8_t *)a2.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)vcgtq_u32(v4, (uint32x4_t)vsraq_n_s32(v3, vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)a2.i8), 0x18uLL), 0x18uLL))), *(int8x8_t *)a2.i8, (int8x8_t)0x2E002E002E002ELL);
  char v11 = 4;
  LODWORD(__p) = vmovn_s16(a2).u32[0];
  BYTE4(__p) = 0;
  int v5 = sIsolatedCoreAudioServerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 136315650;
    *(void *)&uint8_t buf[4] = "ServerSideAudioSwitchboard.cpp";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 110;
    __int16 v13 = 2080;
    p_p = &__p;
    _os_log_impl(&dword_25439F000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ServerSideAudioSwitchboard::addClientUseCase stopping IO for unresponsive client %s", buf, 0x1Cu);
  }
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  *(void *)uint64_t buf = *(void *)(a1 + 8);
  *(void *)&buf[8] = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t, unsigned char *))(*(void *)v6 + 64))(v6, buf);
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
  if (v11 < 0) {
    operator delete(__p);
  }
  return std::unique_ptr<ServerSideAudioSwitchboard::addClientUseCase::$_0::operator() const(void)::{lambda(void)#1},std::default_delete<ServerSideAudioSwitchboard::addClientUseCase::$_0::operator() const(void)::{lambda(void)#1}>>::~unique_ptr[abi:ne180100](&v9);
}

void sub_2543B5A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, std::__shared_weak_count *a17)
{
  if (a17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a17);
  }
  if (a15 < 0) {
    operator delete(__p);
  }
  std::unique_ptr<ServerSideAudioSwitchboard::addClientUseCase::$_0::operator() const(void)::{lambda(void)#1},std::default_delete<ServerSideAudioSwitchboard::addClientUseCase::$_0::operator() const(void)::{lambda(void)#1}>>::~unique_ptr[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void std::__function::__func<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0,std::allocator<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0>,void ()(void)>::destroy_deallocate(void *a1)
{
  std::__function::__alloc_func<ServerSideAudioSwitchboard::addClientUseCase::$_0,std::allocator<ServerSideAudioSwitchboard::addClientUseCase::$_0>,void ()(void)>::destroy[abi:ne180100]((uint64_t)a1 + 8);
  operator delete(a1);
}

void std::__function::__alloc_func<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0,std::allocator<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0>,void ()(void)>::destroy[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  int32x4_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void std::__function::__func<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0,std::allocator<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0>,void ()(void)>::destroy(uint64_t a1)
{
}

uint64_t std::__function::__func<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0,std::allocator<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_2703C33C0;
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(result + 8);
  uint64_t v2 = *(void *)(result + 24);
  *(void *)(a2 + 16) = *(void *)(result + 16);
  *(void *)(a2 + 24) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = *(void *)(result + 40);
  *(void *)(a2 + 32) = *(void *)(result + 32);
  *(void *)(a2 + 40) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

_DWORD *std::__function::__func<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0,std::allocator<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0>,void ()(void)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x30uLL);
  *(void *)__n128 result = &unk_2703C33C0;
  result[2] = *(_DWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)result + 2) = *(void *)(a1 + 16);
  *((void *)result + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  *((void *)result + 4) = *(void *)(a1 + 32);
  *((void *)result + 5) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0,std::allocator<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_2703C33C0;
  uint64_t v2 = (std::__shared_weak_count *)a1[5];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)a1[3];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  JUMPOUT(0x25A276FE0);
}

void *std::__function::__func<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0,std::allocator<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_2703C33C0;
  uint64_t v2 = (std::__shared_weak_count *)a1[5];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)a1[3];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return a1;
}

void std::__shared_ptr_emplace<ServerSideUniqueClient>::__on_zero_shared(void *a1)
{
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](a1 + 7);
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)a1[4];
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void std::__shared_ptr_emplace<ServerSideUniqueClient>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C3558;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x25A276FE0);
}

void std::__shared_ptr_emplace<ServerSideUniqueClient>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C3558;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void *_ZNKSt3__110__function6__funcIN22ServerSideUniqueClient24mSemaphoreTimeoutHandlerMUlvE_ENS_9allocatorIS3_EEFvvEE11target_typeEv()
{
  return &_ZTIN22ServerSideUniqueClient24mSemaphoreTimeoutHandlerMUlvE_E;
}

uint64_t _ZNKSt3__110__function6__funcIN22ServerSideUniqueClient24mSemaphoreTimeoutHandlerMUlvE_ENS_9allocatorIS3_EEFvvEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"N22ServerSideUniqueClient24mSemaphoreTimeoutHandlerMUlvE_E"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void _ZNKSt3__110__function6__funcIN22ServerSideUniqueClient24mSemaphoreTimeoutHandlerMUlvE_ENS_9allocatorIS3_EEFvvEE7__cloneEPNS0_6__baseIS6_EE(uint64_t a1, void *a2)
{
  *a2 = &unk_2703C3050;
}

void *_ZNKSt3__110__function6__funcIN22ServerSideUniqueClient24mSemaphoreTimeoutHandlerMUlvE_ENS_9allocatorIS3_EEFvvEE7__cloneEv()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_2703C3050;
  return result;
}

void _ZNSt3__110__function6__funcIN22ServerSideUniqueClient24mSemaphoreTimeoutHandlerMUlvE_ENS_9allocatorIS3_EEFvvEED0Ev()
{
}

void std::__shared_ptr_emplace<ServerIOThreadResources>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = (IOThreadSynchronizer *)(a1 + 24);
  IOThreadServerMappedMemory::~IOThreadServerMappedMemory((IOThreadServerMappedMemory *)(a1 + 64));
  IOThreadSynchronizer::~IOThreadSynchronizer(v1);
}

void std::__shared_ptr_emplace<ServerIOThreadResources>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C3590;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x25A276FE0);
}

void std::__shared_ptr_emplace<ServerIOThreadResources>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C3590;
  std::__shared_weak_count::~__shared_weak_count(this);
}

uint64_t ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0::~$_0(uint64_t a1)
{
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)(a1 + 16));
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void *std::__function::__func<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,std::allocator<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0>,void ()(CoreAudioTimestamp)>::target_type()
{
}

uint64_t std::__function::__func<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,std::allocator<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0>,void ()(CoreAudioTimestamp)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN22ServerSideUniqueClient25GetClientFacingIOCallbackEvE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,std::allocator<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0>,void ()(CoreAudioTimestamp)>::operator()(uint64_t a1, _OWORD *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (*(void *)(v3 + 56) >= 0x10uLL)
  {
    *(_OWORD *)*(void *)(v3 + 48) = *a2;
    uint64_t v3 = *(void *)(a1 + 8);
  }
  uint64_t result = IOThreadSynchronizer::signalAndWait(*(IOThreadSynchronizer **)(v3 + 8), 10.0, *(caulk::mach::semaphore **)(v3 + 24));
  if (result == 49)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (!v5) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    uint64_t v6 = *(uint64_t (**)(void))(*(void *)v5 + 48);
    return v6();
  }
  return result;
}

void std::__function::__func<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,std::allocator<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0>,void ()(CoreAudioTimestamp)>::destroy_deallocate(void *a1)
{
  std::__function::__alloc_func<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,std::allocator<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0>,void ()(CoreAudioTimestamp)>::destroy[abi:ne180100]((uint64_t)a1 + 8);
  operator delete(a1);
}

void std::__function::__alloc_func<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,std::allocator<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0>,void ()(CoreAudioTimestamp)>::destroy[abi:ne180100](uint64_t a1)
{
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)(a1 + 16));
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

void std::__function::__func<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,std::allocator<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0>,void ()(CoreAudioTimestamp)>::destroy(uint64_t a1)
{
}

void *std::__function::__func<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,std::allocator<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0>,void ()(CoreAudioTimestamp)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_2703C3208;
  return std::__compressed_pair_elem<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0 const&,0ul>(a2 + 1, (void *)(a1 + 8));
}

void *std::__compressed_pair_elem<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0 const&,0ul>(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  return a1;
}

void sub_2543B6114(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::__function::__func<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,std::allocator<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0>,void ()(CoreAudioTimestamp)>::__clone(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 8);
  uint64_t v2 = operator new(0x38uLL);
  void *v2 = &unk_2703C3208;
  std::__compressed_pair_elem<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0 const&,0ul>(v2 + 1, v1);
  return v2;
}

void sub_2543B6180(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__function::__func<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,std::allocator<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0>,void ()(CoreAudioTimestamp)>::~__func(void *a1)
{
  *a1 = &unk_2703C3208;
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](a1 + 3);
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  JUMPOUT(0x25A276FE0);
}

void *std::__function::__func<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,std::allocator<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0>,void ()(CoreAudioTimestamp)>::~__func(void *a1)
{
  *a1 = &unk_2703C3208;
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](a1 + 3);
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void sub_2543B62D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void IsolatedCoreAudioServicePortal::~IsolatedCoreAudioServicePortal(id *this)
{
  IsolatedCoreAudioXPCPortal::~IsolatedCoreAudioXPCPortal(this);
  JUMPOUT(0x25A276FE0);
}

void sub_2543B6418(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2)
  {
    __cxa_begin_catch(exception_object);
    uint64_t v9 = sIsolatedCoreAudioClientLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 136315394;
      *(void *)((char *)&a9 + 4) = "ReverseSiphonDelegate.mm";
      WORD6(a9) = 1024;
      *(_DWORD *)((char *)&a9 + 14) = 77;
      _os_log_impl(&dword_25439F000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d ReverseSiphonDelegate LapseCallback failed.", (uint8_t *)&a9, 0x12u);
    }

    __cxa_end_catch();
    JUMPOUT(0x2543B63D0);
  }
  _Unwind_Resume(exception_object);
}

id sIsolatedCoreAudioClientLog(void)
{
  unint64_t v0 = 0x269DEE000uLL;
  {
    unint64_t v0 = 0x269DEE000;
    if (v3)
    {
      sIsolatedCoreAudioClientLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudioClient");
      unint64_t v0 = 0x269DEE000;
    }
  }
  uint64_t v1 = *(void **)(v0 + 2304);
  return v1;
}

void sub_2543B65C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2)
  {
    __cxa_begin_catch(exception_object);
    uint64_t v9 = sIsolatedCoreAudioClientLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 136315394;
      *(void *)((char *)&a9 + 4) = "ReverseSiphonDelegate.mm";
      WORD6(a9) = 1024;
      *(_DWORD *)((char *)&a9 + 14) = 63;
      _os_log_impl(&dword_25439F000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d ReverseSiphonDelegate AudioAvailabilityCallback failed.", (uint8_t *)&a9, 0x12u);
    }

    __cxa_end_catch();
    JUMPOUT(0x2543B6580);
  }
  _Unwind_Resume(exception_object);
}

void sub_2543B66E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2543B67FC(_Unwind_Exception *a1)
{
  int v3 = v2;

  _Unwind_Resume(a1);
}

OSStatus AudioDeviceCreateIOProcID(AudioObjectID inDevice, AudioDeviceIOProc inProc, void *inClientData, AudioDeviceIOProcID *outIOProcID)
{
  return MEMORY[0x270EE40E0](*(void *)&inDevice, inProc, inClientData, outIOProcID);
}

OSStatus AudioDeviceDestroyIOProcID(AudioObjectID inDevice, AudioDeviceIOProcID inIOProcID)
{
  return MEMORY[0x270EE40E8](*(void *)&inDevice, inIOProcID);
}

OSStatus AudioDeviceStart(AudioObjectID inDevice, AudioDeviceIOProcID inProcID)
{
  return MEMORY[0x270EE40F0](*(void *)&inDevice, inProcID);
}

OSStatus AudioDeviceStartAtTime(AudioObjectID inDevice, AudioDeviceIOProcID inProcID, AudioTimeStamp *ioRequestedStartTime, UInt32 inFlags)
{
  return MEMORY[0x270EE40F8](*(void *)&inDevice, inProcID, ioRequestedStartTime, *(void *)&inFlags);
}

OSStatus AudioDeviceStop(AudioObjectID inDevice, AudioDeviceIOProcID inProcID)
{
  return MEMORY[0x270EE4100](*(void *)&inDevice, inProcID);
}

OSStatus AudioObjectGetPropertyData(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 *ioDataSize, void *outData)
{
  return MEMORY[0x270EE4128](*(void *)&inObjectID, inAddress, *(void *)&inQualifierDataSize, inQualifierData, ioDataSize, outData);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t caulk::mach::os_workgroup_managed::join(caulk::mach::os_workgroup_managed *this)
{
  return MEMORY[0x270F87B28](this);
}

uint64_t caulk::mach::os_workgroup_managed::leave(caulk::mach::os_workgroup_managed *this)
{
  return MEMORY[0x270F87B38](this);
}

void caulk::mach::os_workgroup_managed::~os_workgroup_managed(caulk::mach::os_workgroup_managed *this)
{
}

uint64_t caulk::mach::os_workgroup_interval_managed::make()
{
  return MEMORY[0x270F87B48]();
}

void caulk::mach::os_workgroup_interval_managed::~os_workgroup_interval_managed(caulk::mach::os_workgroup_interval_managed *this)
{
}

uint64_t caulk::mach::details::retain_os_object(caulk::mach::details *this, void *a2)
{
  return MEMORY[0x270F87B58](this, a2);
}

uint64_t caulk::mach::details::release_os_object(caulk::mach::details *this, void *a2)
{
  return MEMORY[0x270F87B60](this, a2);
}

uint64_t caulk::mach::semaphore::timed_wait_or_error(caulk::mach::semaphore *this, double a2)
{
  return MEMORY[0x270F87B68](this, a2);
}

uint64_t caulk::mach::semaphore::timed_wait_signal_or_error(caulk::mach::semaphore *this, caulk::mach::semaphore *a2, double a3)
{
  return MEMORY[0x270F87B70](this, a2, a3);
}

uint64_t caulk::mach::semaphore::signal(caulk::mach::semaphore *this)
{
  return MEMORY[0x270F87B78](this);
}

uint64_t caulk::mach::semaphore::semaphore(caulk::mach::semaphore *this)
{
  return MEMORY[0x270F87B80](this);
}

{
  return MEMORY[0x270F87B88](this);
}

void caulk::mach::semaphore::~semaphore(caulk::mach::semaphore *this)
{
}

const char *__cdecl std::exception::what(const std::exception *this)
{
  return (const char *)MEMORY[0x270F98310](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984E0](this, __pos, __s);
}

std::__thread_struct *__cdecl std::__thread_struct::__thread_struct(std::__thread_struct *this)
{
  return (std::__thread_struct *)MEMORY[0x270F98898](this);
}

void std::__thread_struct::~__thread_struct(std::__thread_struct *this)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
}

void std::__shared_mutex_base::lock_shared(std::__shared_mutex_base *this)
{
}

void std::__shared_mutex_base::unlock_shared(std::__shared_mutex_base *this)
{
}

void std::__shared_mutex_base::lock(std::__shared_mutex_base *this)
{
}

void std::__shared_mutex_base::unlock(std::__shared_mutex_base *this)
{
}

std::__shared_mutex_base *__cdecl std::__shared_mutex_base::__shared_mutex_base(std::__shared_mutex_base *this)
{
  return (std::__shared_mutex_base *)MEMORY[0x270F989D8](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::__thread_specific_ptr<std::__thread_struct> *std::__thread_local_data(void)
{
  return (std::__thread_specific_ptr<std::__thread_struct> *)MEMORY[0x270F989F8]();
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

void std::thread::join(std::thread *this)
{
}

void std::thread::~thread(std::thread *this)
{
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

void std::exception::~exception(std::exception *this)
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

void __cxa_end_catch(void)
{
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

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x270F98178](atoken);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int os_workgroup_copy_port(os_workgroup_t wg, mach_port_t *mach_port_out)
{
  return MEMORY[0x270EDAB80](wg, mach_port_out);
}

os_workgroup_t os_workgroup_create_with_port(const char *name, mach_port_t mach_port)
{
  return (os_workgroup_t)MEMORY[0x270EDAB90](name, *(void *)&mach_port);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x270EDAF38](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t tb_client_connection_activate()
{
  return MEMORY[0x270F7E0B0]();
}

uint64_t tb_client_connection_create_with_endpoint()
{
  return MEMORY[0x270F7E0C8]();
}

uint64_t tb_client_connection_message_construct()
{
  return MEMORY[0x270F7E0E8]();
}

uint64_t tb_client_connection_message_destruct()
{
  return MEMORY[0x270F7E0F0]();
}

uint64_t tb_conclave_endpoint_for_service()
{
  return MEMORY[0x270F7E100]();
}

uint64_t tb_connection_send_query()
{
  return MEMORY[0x270F7E110]();
}

uint64_t tb_endpoint_destruct()
{
  return MEMORY[0x270F7E120]();
}

uint64_t tb_endpoint_set_interface_identifier()
{
  return MEMORY[0x270F7E128]();
}

uint64_t tb_message_complete()
{
  return MEMORY[0x270F7E140]();
}

uint64_t tb_message_decode_s32()
{
  return MEMORY[0x270F7E190]();
}

uint64_t tb_message_encode_u64()
{
  return MEMORY[0x270F7E230]();
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x270EDB908](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x270EDC190](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

uint64_t xpc_mach_send_copy_right()
{
  return MEMORY[0x270EDC260]();
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x270EDC268]();
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x270EDC290]();
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDC3B0](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x270EDC3C0](xshmem, region);
}