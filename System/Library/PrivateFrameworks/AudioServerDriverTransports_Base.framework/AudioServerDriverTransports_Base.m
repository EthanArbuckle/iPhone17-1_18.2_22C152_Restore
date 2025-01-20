void sub_2489BD418(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2489BD69C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  _Unwind_Resume(a1);
}

void sub_2489BD76C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489BD964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *__p, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

BOOL ASDT::IORegistry::EntryAtPathExists(ASDT::IORegistry *this, const char *a2)
{
  io_object_t v3 = EntryForPath;
  if (EntryForPath) {
    IOObjectRelease(EntryForPath);
  }
  return v3 != 0;
}

uint64_t anonymous namespace'::GetEntryForPath(_anonymous_namespace_ *this, const char *a2)
{
  mach_port_t mainPort = 0;
  if (!this)
  {
    v5 = ASDTBaseLogType();
    uint64_t result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    return 0;
  }
  if (MEMORY[0x24C5871F0](*MEMORY[0x263EF87F0], &mainPort))
  {
    io_object_t v3 = ASDTBaseLogType();
    uint64_t result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    return 0;
  }
  return IORegistryEntryFromPath(mainPort, (const char *)this);
}

CFTypeRef ASDT::IORegistry::GetObjectForKey(ASDT::IORegistry *this, _anonymous_namespace_ *a2, const char *a3)
{
  if (this && a2)
  {
    if (EntryForPath)
    {
      io_registry_entry_t v6 = EntryForPath;
      CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v8 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], (const char *)this, 0x8000100u);
      if (v8)
      {
        CFStringRef v9 = v8;
        CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v6, v8, v7, 0);
        CFRelease(v9);
        IOObjectRelease(v6);
        return CFProperty;
      }
      v13 = ASDTBaseLogType();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        ASDT::IORegistry::GetObjectForKey((uint64_t)this, v13);
      }
      IOObjectRelease(v6);
    }
  }
  else
  {
    v12 = ASDTBaseLogType();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      ASDT::IORegistry::GetObjectForKey((uint64_t)this, (uint64_t)a2, v12);
    }
  }
  return 0;
}

BOOL ASDT::IORegistry::GetUInt32tForKey(UInt8 *this, ASDT::IORegistry *a2, _anonymous_namespace_ *a3, const char *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (!this)
  {
    v11 = ASDTBaseLogType();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      ASDT::IORegistry::GetUInt32tForKey(v11);
    }
    return 0;
  }
  CFDataRef ObjectForKey = (const __CFData *)ASDT::IORegistry::GetObjectForKey(a2, a3, (const char *)a3);
  if (!ObjectForKey) {
    return 0;
  }
  CFDataRef v8 = ObjectForKey;
  unint64_t Length = CFDataGetLength(ObjectForKey);
  BOOL v10 = Length > 3;
  if (Length > 3)
  {
    v25.location = 0;
    v25.length = 4;
    CFDataGetBytes(v8, v25, this);
  }
  else
  {
    unint64_t v12 = Length;
    v13 = ASDTBaseLogType();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315906;
      v17 = "GetUInt32tForKey";
      __int16 v18 = 2080;
      v19 = a3;
      __int16 v20 = 2080;
      v21 = a2;
      __int16 v22 = 2048;
      unint64_t v23 = v12;
      _os_log_error_impl(&dword_2489BC000, v13, OS_LOG_TYPE_ERROR, "%s: \"%s/%s\" invalid data length: %ld", (uint8_t *)&v16, 0x2Au);
    }
  }
  CFRelease(v8);
  return v10;
}

BOOL CAProcess::ProcessExists(CAProcess *this)
{
  if ((int)this < 1) {
    return 0;
  }
  if (kill((pid_t)this, 0)) {
    return *__error() != 3;
  }
  return 1;
}

uint64_t CAProcess::GetPID(CAProcess *this)
{
  uint64_t result = CAProcess::sPID;
  if (CAProcess::sPID == -1)
  {
    uint64_t result = getpid();
    CAProcess::sPID = result;
  }
  return result;
}

uint64_t ASDTBaseLogType()
{
  if (ASDTBaseLogType_onceToken != -1) {
    dispatch_once(&ASDTBaseLogType_onceToken, &__block_literal_global);
  }
  return gASDTBaseLogType;
}

os_log_t __ASDTBaseLogType_block_invoke()
{
  os_log_t result = os_log_create("com.apple.audio.ASDT", "Base");
  if (result) {
    gASDTBaseLogType = (uint64_t)result;
  }
  return result;
}

uint64_t ASDT::Exclaves::StatusTracker::StatusTracker(uint64_t a1, long long *a2)
{
  *(void *)a1 = &unk_26FCA63D8;
  v4 = (std::string *)(a1 + 24);
  uint64_t v5 = a1 + 8;
  uint64_t v6 = caulk::concurrent::messenger::shared_high_priority((caulk::concurrent::messenger *)a1);
  MEMORY[0x24C587420](v5, 0, v6);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v10 = *a2;
    v4->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v10;
  }
  for (uint64_t i = 0; i != 1152; i += 72)
  {
    uint64_t v12 = a1 + 48 + i;
    *(void *)(v12 + 64) = 0;
    *(_OWORD *)(v12 + 32) = 0u;
    *(_OWORD *)(v12 + 48) = 0u;
    *(_OWORD *)uint64_t v12 = 0u;
    *(_OWORD *)(v12 + 16) = 0u;
    ASDT::Exclaves::StatusTracker::Message::Message((ASDT::Exclaves::StatusTracker::Message *)v12, v7, v8, v9);
  }
  *(void *)(a1 + 1200) = &unk_26FCA6448;
  *(void *)(a1 + 1208) = 0;
  *(void *)(a1 + 1280) = 0;
  *(void *)(a1 + 1272) = 0;
  uint64_t v13 = 1288;
  do
  {
    ASDTTime::ASDTTime((uint64_t)&v23, 0, 1, v9);
    uint64_t v14 = a1 + v13;
    *(void *)uint64_t v14 = -1;
    *(_OWORD *)(v14 + 8) = v23;
    *(void *)(v14 + 24) = v24;
    *(void *)(v14 + 32) = 0;
    v13 += 40;
  }
  while (v14 + 40 != a1 + 11528);
  uint64_t v15 = 0;
  *(void *)(a1 + 11528) = 850045863;
  *(_OWORD *)(a1 + 11536) = 0u;
  *(_OWORD *)(a1 + 11552) = 0u;
  *(_OWORD *)(a1 + 11568) = 0u;
  *(_OWORD *)(a1 + 11584) = 0u;
  *(void *)(a1 + 11600) = 0xFFFFFFFF00000000;
  do
  {
    uint64_t v16 = a1 + 72 * v15;
    unint64_t v17 = v16 + 48;
    *(void *)(v16 + 72) = a1;
    unint64_t v18 = *(void *)(a1 + 1208);
    atomic_store(v18, (unint64_t *)(v16 + 56));
    unint64_t v19 = v18;
    atomic_compare_exchange_strong((atomic_ullong *volatile)(a1 + 1208), &v19, v17);
    if (v19 != v18)
    {
      unint64_t v20 = v19;
      do
      {
        atomic_store(v19, (unint64_t *)(v17 + 8));
        atomic_compare_exchange_strong((atomic_ullong *volatile)(a1 + 1208), &v20, v17);
        BOOL v21 = v20 == v19;
        unint64_t v19 = v20;
      }
      while (!v21);
    }
    ++v15;
  }
  while (v15 != 16);
  return a1;
}

void sub_2489BF4BC(_Unwind_Exception *a1)
{
  MEMORY[0x24C587430](v1);
  _Unwind_Resume(a1);
}

void ASDT::Exclaves::StatusTracker::~StatusTracker(ASDT::Exclaves::StatusTracker *this)
{
  *(void *)this = &unk_26FCA63D8;
  v2 = (const void *)*((void *)this + 1449);
  if (v2)
  {
    _Block_release(v2);
    *((void *)this + 1449) = 0;
  }
  std::mutex::~mutex((std::mutex *)((char *)this + 11528));
  for (uint64_t i = 1128; i != -24; i -= 72)
    caulk::concurrent::message::~message((ASDT::Exclaves::StatusTracker *)((char *)this + i));
  if (*((char *)this + 47) < 0) {
    operator delete(*((void **)this + 3));
  }
  MEMORY[0x24C587430]((char *)this + 8);
}

{
  uint64_t vars8;

  ASDT::Exclaves::StatusTracker::~StatusTracker(this);
  JUMPOUT(0x24C587580);
}

void ASDT::Exclaves::StatusTracker::SetSignalBlock(uint64_t a1, void *aBlock)
{
  v4 = *(const void **)(a1 + 11592);
  if (v4)
  {
    _Block_release(v4);
    *(void *)(a1 + 11592) = 0;
  }
  if (aBlock) {
    *(void *)(a1 + 11592) = _Block_copy(aBlock);
  }
}

void __clang_call_terminate(void *a1)
{
}

void ASDT::Exclaves::StatusTracker::Create()
{
}

void sub_2489BF6A4(_Unwind_Exception *a1)
{
  MEMORY[0x24C587580](v1, 0x10B3C4097BFF725);
  _Unwind_Resume(a1);
}

void ASDT::Exclaves::StatusTracker::Reset(atomic_ullong *this)
{
  v2 = (std::mutex *)(this + 1441);
  std::mutex::lock((std::mutex *)(this + 1441));
  atomic_exchange(this + 160, 0);
  *((_DWORD *)this + 2900) = 0;
  std::mutex::unlock(v2);
}

BOOL ASDT::Exclaves::StatusTracker::Push(uint64_t a1, long long *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (atomic_exchange((atomic_ullong *volatile)(a1 + 1280), *((int *)a2 + 9) | ((unint64_t)*((unsigned int *)a2 + 8) << 32)) == (*((int *)a2 + 9) | ((unint64_t)*((unsigned int *)a2 + 8) << 32)))return 1; {
  unint64_t v4 = *(void *)(a1 + 1272);
  }
  if (v4)
  {
LABEL_7:
    unint64_t v8 = atomic_load((unint64_t *)(v4 + 8));
    *(void *)(a1 + 1272) = v8;
    long long v9 = *a2;
    long long v10 = a2[1];
    *(void *)(v4 + 64) = *((void *)a2 + 4);
    *(_OWORD *)(v4 + 32) = v9;
    *(_OWORD *)(v4 + 48) = v10;
    caulk::concurrent::messenger::enqueue((caulk::concurrent::messenger *)(a1 + 8), (caulk::concurrent::message *)v4);
    return 1;
  }
  unint64_t v5 = atomic_exchange_explicit((atomic_ullong *volatile)(a1 + 1208), 0, memory_order_acquire);
  if (v5)
  {
    unint64_t v4 = 0;
    do
    {
      unint64_t v6 = v4;
      unint64_t v4 = v5;
      uint64_t v7 = (unint64_t *)(v5 + 8);
      unint64_t v5 = atomic_load((unint64_t *)(v5 + 8));
      atomic_store(v6, v7);
    }
    while (v5);
    *(void *)(a1 + 1272) = v4;
    goto LABEL_7;
  }
  uint64_t v12 = ASDTBaseLogType();
  BOOL result = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (result)
  {
    uint64_t v13 = (void *)(a1 + 24);
    if (*(char *)(a1 + 47) < 0) {
      uint64_t v13 = (void *)*v13;
    }
    uint64_t v14 = ASDT::Exclaves::Sensor::StatusString(*((_DWORD *)a2 + 8));
    uint64_t v16 = *((void *)a2 + 1);
    uint64_t v15 = *((void *)a2 + 2);
    uint64_t v17 = *(void *)a2;
    int v18 = 136316162;
    unint64_t v19 = v13;
    __int16 v20 = 2080;
    BOOL v21 = v14;
    __int16 v22 = 2048;
    uint64_t v23 = v16;
    __int16 v24 = 2048;
    uint64_t v25 = v15;
    __int16 v26 = 2048;
    uint64_t v27 = v17;
    _os_log_error_impl(&dword_2489BC000, v12, OS_LOG_TYPE_ERROR, "StatusTracker(%s): No messages available to push update for %s at %lluns, mat: %llu, sample: %llu", (uint8_t *)&v18, 0x34u);
    return 0;
  }
  return result;
}

void ASDT::Exclaves::StatusTracker::Process(ASDT::Exclaves::StatusTracker *this, ASDT::Exclaves::StatusTracker::Message *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v20.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)this + 11528);
  v20.__owns_ = 1;
  std::mutex::lock((std::mutex *)((char *)this + 11528));
  uint64_t v4 = *((void *)a2 + 4);
  uint64_t v5 = *((void *)a2 + 5);
  long long v19 = *((_OWORD *)a2 + 3);
  int v7 = *((_DWORD *)a2 + 16);
  int v6 = *((_DWORD *)a2 + 17);
  unint64_t v8 = *((void *)this + 151);
  atomic_store(v8, (unint64_t *)a2 + 1);
  unint64_t v9 = v8;
  atomic_compare_exchange_strong((atomic_ullong *volatile)this + 151, &v9, (unint64_t)a2);
  if (v9 != v8)
  {
    unint64_t v10 = v9;
    do
    {
      atomic_store(v9, (unint64_t *)a2 + 1);
      atomic_compare_exchange_strong((atomic_ullong *volatile)this + 151, &v10, (unint64_t)a2);
      BOOL v11 = v10 == v9;
      unint64_t v9 = v10;
    }
    while (!v11);
  }
  int v12 = *((_DWORD *)this + 2901);
  int v13 = *((_DWORD *)this + 2900);
  if (!v13
    || (*((int *)this + 10 * (v13 + v12) + 331) | ((unint64_t)*((unsigned int *)this
                                                                                      + 10
                                                                                      * (v13 + v12)
                                                                                      + 330) << 32)) != (v6 | (unint64_t)((uint64_t)v7 << 32)))
  {
    uint64_t v14 = (char *)this + 40 * (v13 + v12 + 1);
    *((void *)v14 + 161) = v4;
    *((void *)v14 + 162) = v5;
    *(_OWORD *)(v14 + 1304) = v19;
    *((_DWORD *)v14 + 330) = v7;
    *((_DWORD *)v14 + 331) = v6;
    if (v13 == 256) {
      *((_DWORD *)this + 2901) = v12 + 1;
    }
    else {
      *((_DWORD *)this + 2900) = v13 + 1;
    }
    std::unique_lock<std::mutex>::unlock(&v20);
    uint64_t v15 = ASDTBaseLogType();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (void *)((char *)this + 24);
      if (*((char *)this + 47) < 0) {
        uint64_t v16 = (void *)*v16;
      }
      uint64_t v17 = ASDT::Exclaves::Sensor::StatusString(v7);
      *(_DWORD *)buf = 136315906;
      __int16 v22 = v16;
      __int16 v23 = 2080;
      __int16 v24 = v17;
      __int16 v25 = 2048;
      uint64_t v26 = v5;
      __int16 v27 = 2048;
      uint64_t v28 = v4;
      _os_log_impl(&dword_2489BC000, v15, OS_LOG_TYPE_DEFAULT, "StatusTracker(%s): %s; time: %lluns, sample: %llu",
        buf,
        0x2Au);
    }
    uint64_t v18 = *((void *)this + 1449);
    if (v18) {
      (*(void (**)(void))(v18 + 16))();
    }
  }
  if (v20.__owns_) {
    std::mutex::unlock(v20.__m_);
  }
}

void sub_2489BFA94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, char a12)
{
  if (a12) {
    std::mutex::unlock(a11);
  }
  _Unwind_Resume(exception_object);
}

void std::unique_lock<std::mutex>::unlock(std::unique_lock<std::mutex> *this)
{
  if (this->__owns_)
  {
    std::mutex::unlock(this->__m_);
    this->__owns_ = 0;
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::unlock: not locked");
    ASDT::Exclaves::StatusTracker::Pop(v2, v3, v4);
  }
}

void ASDT::Exclaves::StatusTracker::Pop(ASDT::Exclaves::StatusTracker *this@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  if (!a2) {
    a2 = *((_DWORD *)this + 2900);
  }
  unint64_t v5 = a2;
  std::vector<ASDT::Exclaves::StatusTracker::Update>::reserve((void **)a3, a2);
  std::mutex::lock((std::mutex *)((char *)this + 11528));
  int v6 = *(_OWORD **)a3;
  int v7 = *(_OWORD **)(a3 + 8);
  unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v7 - *(void *)a3) >> 3);
  if (v8 < v5)
  {
    unint64_t v9 = (void *)(a3 + 16);
    int v10 = *((_DWORD *)this + 2900);
    do
    {
      if (!v10) {
        break;
      }
      int v11 = *((_DWORD *)this + 2901) + 1;
      *((_DWORD *)this + 2901) = v11;
      int v12 = (char *)this + 40 * v11 + 1288;
      if ((unint64_t)v7 >= *v9)
      {
        unint64_t v15 = v8 + 1;
        if (v8 + 1 > 0x666666666666666) {
          std::vector<ASDT::Exclaves::StatusTracker::Update>::__throw_length_error[abi:ne180100]();
        }
        if (0x999999999999999ALL * ((uint64_t)(*v9 - (void)v6) >> 3) > v15) {
          unint64_t v15 = 0x999999999999999ALL * ((uint64_t)(*v9 - (void)v6) >> 3);
        }
        unint64_t v16 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*v9 - (void)v6) >> 3) >= 0x333333333333333
            ? 0x666666666666666
            : v15;
        if (v16)
        {
          uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ASDT::Exclaves::StatusTracker::Update>>(a3 + 16, v16);
          int v6 = *(_OWORD **)a3;
          int v7 = *(_OWORD **)(a3 + 8);
        }
        else
        {
          uint64_t v17 = 0;
        }
        uint64_t v18 = &v17[40 * v8];
        long long v19 = *(_OWORD *)v12;
        long long v20 = *((_OWORD *)v12 + 1);
        *((void *)v18 + 4) = *((void *)v12 + 4);
        *(_OWORD *)uint64_t v18 = v19;
        *((_OWORD *)v18 + 1) = v20;
        if (v7 == v6)
        {
          __int16 v24 = &v17[40 * v8];
        }
        else
        {
          BOOL v21 = &v17[40 * v8];
          do
          {
            long long v22 = *(_OWORD *)((char *)v7 - 40);
            long long v23 = *(_OWORD *)((char *)v7 - 24);
            __int16 v24 = v21 - 40;
            *((void *)v21 - 1) = *((void *)v7 - 1);
            *(_OWORD *)(v21 - 24) = v23;
            *(_OWORD *)(v21 - 40) = v22;
            int v7 = (_OWORD *)((char *)v7 - 40);
            v21 -= 40;
          }
          while (v7 != v6);
        }
        int v7 = v18 + 40;
        *(void *)a3 = v24;
        *(void *)(a3 + 8) = v18 + 40;
        *(void *)(a3 + 16) = &v17[40 * v16];
        if (v6)
        {
          operator delete(v6);
          int v6 = *(_OWORD **)a3;
        }
        else
        {
          int v6 = v24;
        }
      }
      else
      {
        long long v13 = *(_OWORD *)v12;
        long long v14 = *(_OWORD *)((char *)this + 40 * v11 + 1304);
        *((void *)v7 + 4) = *((void *)this + 5 * v11 + 165);
        *int v7 = v13;
        v7[1] = v14;
        int v7 = (_OWORD *)((char *)v7 + 40);
      }
      *(void *)(a3 + 8) = v7;
      int v10 = *((_DWORD *)this + 2900) - 1;
      *((_DWORD *)this + 2900) = v10;
      unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v7 - (char *)v6) >> 3);
    }
    while (v8 < v5);
  }
  std::mutex::unlock((std::mutex *)((char *)this + 11528));
}

void sub_2489BFCFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::mutex *a10)
{
  int v12 = *(void **)v10;
  if (*(void *)v10)
  {
    *(void *)(v10 + 8) = v12;
    operator delete(v12);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<ASDT::Exclaves::StatusTracker::Update>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xCCCCCCCCCCCCCCCDLL * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0x666666666666667) {
      std::vector<ASDT::Exclaves::StatusTracker::Update>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 40;
    int v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ASDT::Exclaves::StatusTracker::Update>>(v3, a2);
    int v7 = &v6[40 * v5];
    unint64_t v9 = &v6[40 * v8];
    int v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    int v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *(_OWORD *)(v10 - 40);
        long long v14 = *(_OWORD *)(v10 - 24);
        *((void *)v12 - 1) = *((void *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v14;
        *(_OWORD *)(v12 - 40) = v13;
        v12 -= 40;
        v10 -= 40;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

uint64_t ASDT::Exclaves::StatusTracker::GetCount(ASDT::Exclaves::StatusTracker *this)
{
  v2 = (std::mutex *)((char *)this + 11528);
  std::mutex::lock((std::mutex *)((char *)this + 11528));
  uint64_t v3 = *((unsigned int *)this + 2900);
  std::mutex::unlock(v2);
  return v3;
}

ASDT::Exclaves::StatusTracker::Message *ASDT::Exclaves::StatusTracker::Message::Message(ASDT::Exclaves::StatusTracker::Message *this, uint64_t a2, uint64_t a3, unsigned __int16 *a4)
{
  *((_DWORD *)this + 4) = 0;
  *(void *)this = &unk_26FCA6408;
  *((void *)this + 1) = 0;
  *((void *)this + 3) = 0;
  ASDTTime::ASDTTime((uint64_t)&v6, 0, 1, a4);
  *((void *)this + 4) = -1;
  *(_OWORD *)((char *)this + 40) = v6;
  *((void *)this + 7) = v7;
  *((void *)this + 8) = 0;
  return this;
}

void sub_2489BFEDC(_Unwind_Exception *a1)
{
  caulk::concurrent::message::~message(v1);
  _Unwind_Resume(a1);
}

void ASDT::Exclaves::StatusTracker::Message::~Message(ASDT::Exclaves::StatusTracker::Message *this)
{
  caulk::concurrent::message::~message(this);
  JUMPOUT(0x24C587580);
}

void ASDT::Exclaves::StatusTracker::Message::perform(ASDT::Exclaves::StatusTracker::Message *this)
{
  v2 = (ASDT::Exclaves::StatusTracker *)*((void *)this + 3);
  if (v2) {
    ASDT::Exclaves::StatusTracker::Process(v2, this);
  }
}

void ASDT::Exclaves::StatusTracker::MessageQueue::~MessageQueue(ASDT::Exclaves::StatusTracker::MessageQueue *this)
{
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    uint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_265243920, MEMORY[0x263F8C060]);
}

void sub_2489C0050(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  BOOL result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::vector<ASDT::Exclaves::StatusTracker::Update>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ASDT::Exclaves::StatusTracker::Update>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(40 * a2);
}

ASDT::IOUserClient *ASDT::IOUserClient::IOUserClient(ASDT::IOUserClient *this, int a2)
{
  *(void *)this = &unk_26FCA6490;
  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = 0;
  *((unsigned char *)this + 16) = 1;
  *(void *)((char *)this + 20) = 0x3D09000000010;
  *((_OWORD *)this + 2) = 0u;
  uint64_t v3 = (void **)((char *)this + 32);
  *((_OWORD *)this + 3) = 0u;
  *((_WORD *)this + 32) = 1;
  *((void *)this + 10) = 0;
  *((void *)this + 9) = (char *)this + 80;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 16) = 0;
  *((_WORD *)this + 68) = 0;
  *((void *)this + 13) = 0;
  *((void *)this + 14) = 0;
  *((_DWORD *)this + 30) = 0;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)((char *)this + 144));
  *((void *)this + 39) = 850045863;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *((_OWORD *)this + 22) = 0u;
  *((void *)this + 46) = 0;
  io_object_t v4 = *((_DWORD *)this + 2);
  if (v4 && !IOObjectRetain(v4))
  {
    CFStringRef v6 = IOObjectCopyClass(*((_DWORD *)this + 2));
    CFStringRef v7 = v6;
    if (v6)
    {
      CFTypeID v8 = CFGetTypeID(v6);
      if (v8 == CFStringGetTypeID())
      {
        CFStringRef v12 = v7;
        std::string::basic_string[abi:ne180100]<0>(&__p, "IOUserClient");
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&v13, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        }
        else {
          std::string v13 = __p;
        }
        CFTypeID TypeID = CFStringGetTypeID();
        if (TypeID == CFGetTypeID(v7))
        {
          applesauce::CF::details::CFString_get_value<false>(v7, (uint64_t)&v11);
          if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v13.__r_.__value_.__l.__data_);
          }
        }
        else
        {
          std::string v11 = v13;
        }
        if (*((char *)this + 55) < 0) {
          operator delete(*v3);
        }
        *(std::string *)uint64_t v3 = v11;
        *((unsigned char *)&v11.__r_.__value_.__s + 23) = 0;
        v11.__r_.__value_.__s.__data_[0] = 0;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        CFRelease(v7);
      }
      else
      {
        CFRelease(v7);
      }
    }
  }
  else
  {
    *((_DWORD *)this + 2) = 0;
  }
  return this;
}

void sub_2489C0418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  std::mutex::~mutex((std::mutex *)(v8 + 312));
  std::shared_mutex::~shared_mutex[abi:ne180100](v10);
  uint64_t v14 = *v12;
  uint64_t *v12 = 0;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  }
  std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::destroy(v9, *(void **)(v8 + 80));
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)(v8 + 56));
  if (*(char *)(v8 + 55) < 0) {
    operator delete(*v11);
  }
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::Retain(ASDT::IOUserClient *this)
{
  uint64_t result = *((unsigned int *)this + 2);
  if (result) {
    return IOObjectRetain(result) == 0;
  }
  return result;
}

void *applesauce::CF::StringRef::operator->(void *result)
{
  if (!*result)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  return result;
}

void sub_2489C0514()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_2489C0534(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

double applesauce::CF::StringRef_proxy::convert_or@<D0>(const __CFString ***a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  CFStringRef v4 = **a1;
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  if (v4 && (CFTypeID TypeID = CFStringGetTypeID(), TypeID == CFGetTypeID(v4)))
  {
    applesauce::CF::details::CFString_get_value<false>(v4, (uint64_t)a3);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    double result = *(double *)&__p.__r_.__value_.__l.__data_;
    *a3 = __p;
  }
  return result;
}

void applesauce::CF::StringRef::~StringRef(const void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void std::shared_mutex::~shared_mutex[abi:ne180100](uint64_t a1)
{
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 112));
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 64));
  std::mutex::~mutex((std::mutex *)a1);
}

void applesauce::CF::DictionaryRef::~DictionaryRef(const void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

ASDT::IOUserClient *ASDT::IOUserClient::IOUserClient(ASDT::IOUserClient *this, CFTypeRef *a2)
{
  *((unsigned char *)this + 16) = 0;
  *(void *)this = &unk_26FCA6490;
  *((void *)this + 1) = 0;
  *(void *)((char *)this + 20) = 0x3D09000000010;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  CFTypeRef v3 = *a2;
  if (*a2) {
    CFRetain(*a2);
  }
  *((void *)this + 10) = 0;
  *((void *)this + 9) = (char *)this + 80;
  *((void *)this + 7) = v3;
  *((_WORD *)this + 32) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 16) = 0;
  *((_WORD *)this + 68) = 0;
  *((void *)this + 13) = 0;
  *((void *)this + 14) = 0;
  *((_DWORD *)this + 30) = 0;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)((char *)this + 144));
  *((void *)this + 39) = 850045863;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *((_OWORD *)this + 22) = 0u;
  *((void *)this + 46) = 0;
  return this;
}

void sub_2489C078C(_Unwind_Exception *a1)
{
  CFStringRef v6 = v4;
  uint64_t v8 = *v6;
  *CFStringRef v6 = 0;
  if (v8) {
    ASDT::IOUserClient::IOUserClient(v8);
  }
  std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::destroy(v3, *(void **)(v1 + 80));
  applesauce::CF::DictionaryRef::~DictionaryRef(v2);
  if (*(char *)(v1 + 55) < 0) {
    operator delete(*v5);
  }
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::IOUserClient(uint64_t a1, ASDT::IOUserClient *a2)
{
  *(void *)a1 = &unk_26FCA6490;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 20) = 0x3D09000000010;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_WORD *)(a1 + 64) = 1;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 72) = a1 + 80;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 128) = 0;
  *(_WORD *)(a1 + 136) = 0;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  *(_DWORD *)(a1 + 120) = 0;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(a1 + 144));
  *(void *)(a1 + 312) = 850045863;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(void *)(a1 + 368) = 0;
  ASDT::IOUserClient::MoveDataMembers((ASDT::IOUserClient *)a1, a2);
  return a1;
}

void sub_2489C08B0(_Unwind_Exception *a1)
{
  uint64_t v7 = *v5;
  uint64_t *v5 = 0;
  if (v7) {
    ASDT::IOUserClient::IOUserClient(v7);
  }
  std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::destroy(v3, *(void **)(v1 + 80));
  applesauce::CF::DictionaryRef::~DictionaryRef(v2);
  if (*(char *)(v1 + 55) < 0) {
    operator delete(*v4);
  }
  _Unwind_Resume(a1);
}

__n128 ASDT::IOUserClient::MoveDataMembers(ASDT::IOUserClient *this, ASDT::IOUserClient *a2)
{
  *((unsigned char *)this + 65) = *((unsigned char *)a2 + 65);
  *((void *)this + 1) = *((void *)a2 + 1);
  *((unsigned char *)this + 16) = *((unsigned char *)a2 + 16);
  CFStringRef v4 = (char *)a2 + 32;
  uint64_t v5 = (char *)this + 32;
  if (*((char *)this + 55) < 0) {
    operator delete(*(void **)v5);
  }
  long long v6 = *(_OWORD *)v4;
  *((void *)v5 + 2) = *((void *)v4 + 2);
  *(_OWORD *)uint64_t v5 = v6;
  *((unsigned char *)a2 + 55) = 0;
  *((unsigned char *)a2 + 32) = 0;
  uint64_t v7 = (const void *)*((void *)this + 7);
  uint64_t v8 = (const void *)*((void *)a2 + 7);
  *((void *)this + 7) = v8;
  if (v8) {
    CFRetain(v8);
  }
  if (v7) {
    CFRelease(v7);
  }
  *((unsigned char *)this + 64) = *((unsigned char *)a2 + 64);
  uint64_t v9 = (char *)a2 + 72;
  std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::__move_assign((uint64_t)this + 72, (void *)a2 + 9);
  *((void *)this + 16) = *((void *)a2 + 16);
  *((_WORD *)this + 68) = *((_WORD *)a2 + 68);
  uint64_t v10 = *((void *)a2 + 12);
  *((void *)a2 + 12) = 0;
  uint64_t v11 = *((void *)this + 12);
  *((void *)this + 12) = v10;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  *((void *)a2 + 1) = 0;
  if (*((char *)a2 + 55) < 0)
  {
    **((unsigned char **)a2 + 4) = 0;
    *((void *)a2 + 5) = 0;
  }
  else
  {
    *((unsigned char *)a2 + 32) = 0;
    *((unsigned char *)a2 + 55) = 0;
  }
  CFStringRef v12 = (const void *)*((void *)a2 + 7);
  *((void *)a2 + 7) = 0;
  if (v12) {
    CFRelease(v12);
  }
  *((unsigned char *)a2 + 64) = 1;
  *((unsigned char *)a2 + 16) = 1;
  uint64_t v13 = *((void *)a2 + 12);
  *((void *)a2 + 12) = 0;
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
  }
  unint64_t v15 = (void *)*((void *)a2 + 10);
  uint64_t v14 = (char *)a2 + 80;
  std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::destroy((uint64_t)v9, v15);
  *((void *)v14 - 1) = v14;
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  *((void *)v14 + 6) = 0;
  *((_WORD *)v14 + 28) = 0;
  __n128 result = *(__n128 *)(v14 + 24);
  *(__n128 *)((char *)this + 104) = result;
  *((_DWORD *)this + 30) = *((_DWORD *)v14 + 10);
  *((_DWORD *)v14 + 10) = 0;
  *((void *)v14 + 3) = 0;
  *((void *)v14 + 4) = 0;
  return result;
}

uint64_t ASDT::IOUserClient::operator=(uint64_t a1, int a2)
{
  uint64_t v16 = a1 + 144;
  char v17 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)(a1 + 144));
  ASDT::IOUserClient::Clear((io_object_t *)a1);
  *(_DWORD *)(a1 + 8) = a2;
  *(unsigned char *)(a1 + 16) = 1;
  CFStringRef v4 = (void **)(a1 + 32);
  *(unsigned char *)(a1 + 64) = 1;
  MEMORY[0x24C587480](a1 + 32, "");
  io_object_t v5 = *(_DWORD *)(a1 + 8);
  if (!v5 || IOObjectRetain(v5))
  {
    *(_DWORD *)(a1 + 8) = 0;
    goto LABEL_4;
  }
  CFStringRef v7 = IOObjectCopyClass(*(_DWORD *)(a1 + 8));
  CFStringRef v8 = v7;
  if (v7)
  {
    CFTypeID v9 = CFGetTypeID(v7);
    if (v9 == CFStringGetTypeID())
    {
      CFStringRef v15 = v8;
      std::string::basic_string[abi:ne180100]<0>(&__p, "IOUserClient");
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v18, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      }
      else {
        std::string v18 = __p;
      }
      CFTypeID TypeID = CFStringGetTypeID();
      if (TypeID == CFGetTypeID(v8))
      {
        applesauce::CF::details::CFString_get_value<false>(v8, (uint64_t)&v14);
        if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v18.__r_.__value_.__l.__data_);
        }
      }
      else
      {
        std::string v14 = v18;
      }
      if (*(char *)(a1 + 55) < 0) {
        operator delete(*v4);
      }
      *(_OWORD *)CFStringRef v4 = *(_OWORD *)&v14.__r_.__value_.__l.__data_;
      *(void *)(a1 + 48) = *((void *)&v14.__r_.__value_.__l + 2);
      *((unsigned char *)&v14.__r_.__value_.__s + 23) = 0;
      v14.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      char v10 = 0;
      goto LABEL_22;
    }
    CFStringRef v15 = 0;
    CFRelease(v8);
    CFStringRef v8 = 0;
  }
  else
  {
    CFStringRef v15 = 0;
  }
  char v10 = 1;
LABEL_22:
  int v12 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 48))(a1);
  ASDT::IOUserClient::SetInterestNotificationEnabled((ASDT::IOUserClient *)a1, v12);
  if ((v10 & 1) == 0) {
    CFRelease(v8);
  }
LABEL_4:
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v16);
  return a1;
}

void sub_2489C0C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  CFTypeID v9 = va_arg(va1, const void *);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void ASDT::IOUserClient::ExclusiveLock(ASDT::IOUserClient *this@<X0>, uint64_t a2@<X8>)
{
  v2 = (std::__shared_mutex_base *)((char *)this + 144);
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = 1;
  std::__shared_mutex_base::lock(v2);
}

void ASDT::IOUserClient::Clear(io_object_t *this)
{
  ASDT::IOUserClient::SetInterestNotificationEnabled((ASDT::IOUserClient *)this, 0);
  (*(void (**)(io_object_t *))(*(void *)this + 40))(this);
  io_object_t v2 = this[2];
  if (v2)
  {
    IOObjectRelease(v2);
    this[2] = 0;
  }
  uint64_t v3 = (const void *)*((void *)this + 7);
  *((void *)this + 7) = 0;
  if (v3) {
    CFRelease(v3);
  }
  CFStringRef v4 = (const void *)*((void *)this + 16);
  if (v4)
  {
    _Block_release(v4);
    *((void *)this + 16) = 0;
  }
}

uint64_t ASDT::IOUserClient::SetInterestNotificationEnabled(ASDT::IOUserClient *this, int a2)
{
  kern_return_t v12;
  kern_return_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  io_object_t v17;
  IONotificationPort *v18;
  NSObject *v19;
  mach_port_t mainPort;
  uint8_t buf[4];
  const char **v23;
  __int16 v24;
  kern_return_t v25;
  uint64_t v26;

  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (*((_DWORD *)this + 30) && *((void *)this + 14)) {
      return 1;
    }
    mach_port_t mainPort = 0;
    if (MEMORY[0x24C5871F0](*MEMORY[0x263EF87F0], &mainPort))
    {
      io_object_t v5 = ASDTBaseLogType();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        ASDT::IOUserClient::SetInterestNotificationEnabled();
      }
      return 0;
    }
    IONotificationPortRef v6 = IONotificationPortCreate(mainPort);
    *((void *)this + 14) = v6;
    if (!v6)
    {
      CFStringRef v15 = ASDTBaseLogType();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        ASDT::IOUserClient::SetInterestNotificationEnabled();
      }
      return 0;
    }
    CFStringRef v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    CFStringRef v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);
    CFTypeID v9 = (const char **)((char *)this + 32);
    char v10 = (char *)this + 32;
    if (*((char *)this + 55) < 0) {
      char v10 = *v9;
    }
    uint64_t v11 = dispatch_queue_create(v10, v8);
    *((void *)this + 13) = v11;
    if (v11)
    {
      IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)this + 14), v11);
      int v12 = IOServiceAddInterestNotification(*((IONotificationPortRef *)this + 14), *((_DWORD *)this + 2), "IOGeneralInterest", (IOServiceInterestCallback)ASDT::IOUserClient::InterestNotificationCallback, this, (io_object_t *)this + 30);
      if (!v12) {
        return 1;
      }
      uint64_t v13 = v12;
      std::string v14 = ASDTBaseLogType();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        if (*((char *)this + 55) < 0) {
          CFTypeID v9 = (const char **)*v9;
        }
        *(_DWORD *)buf = 136315394;
        long long v23 = v9;
        __int16 v24 = 1024;
        __int16 v25 = v13;
        _os_log_error_impl(&dword_2489BC000, v14, OS_LOG_TYPE_ERROR, "%s: IOServiceAddInterestNotification failed: %x", buf, 0x12u);
      }
    }
    else
    {
      uint64_t v16 = ASDTBaseLogType();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        ASDT::IOUserClient::SetInterestNotificationEnabled();
      }
    }
  }
  char v17 = *((_DWORD *)this + 30);
  if (v17)
  {
    IOObjectRelease(v17);
    *((_DWORD *)this + 30) = 0;
  }
  uint64_t v4 = a2 ^ 1u;
  std::string v18 = (IONotificationPort *)*((void *)this + 14);
  if (v18)
  {
    IONotificationPortDestroy(v18);
    *((void *)this + 14) = 0;
  }
  long long v19 = *((void *)this + 13);
  if (v19)
  {
    dispatch_release(v19);
    *((void *)this + 13) = 0;
  }
  return v4;
}

uint64_t ASDT::IOUserClient::operator=(uint64_t a1, ASDT::IOUserClient *a2)
{
  uint64_t v5 = a1 + 144;
  char v6 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)(a1 + 144));
  ASDT::IOUserClient::Clear((io_object_t *)a1);
  ASDT::IOUserClient::MoveDataMembers((ASDT::IOUserClient *)a1, a2);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v5);
  return a1;
}

void sub_2489C1000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void ASDT::IOUserClient::~IOUserClient(ASDT::IOUserClient *this)
{
  *(void *)this = &unk_26FCA6490;
  ASDT::IOUserClient::Clear((io_object_t *)this);
  std::mutex::~mutex((std::mutex *)((char *)this + 312));
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)this + 256));
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)this + 208));
  std::mutex::~mutex((std::mutex *)((char *)this + 144));
  uint64_t v2 = *((void *)this + 12);
  *((void *)this + 12) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::destroy((uint64_t)this + 72, *((void **)this + 10));
  uint64_t v3 = (const void *)*((void *)this + 7);
  if (v3) {
    CFRelease(v3);
  }
  if (*((char *)this + 55) < 0) {
    operator delete(*((void **)this + 4));
  }
}

{
  uint64_t vars8;

  ASDT::IOUserClient::~IOUserClient(this);
  JUMPOUT(0x24C587580);
}

BOOL ASDT::IOUserClient::IsValid(ASDT::IOUserClient *this)
{
  uint64_t v4 = (char *)this + 144;
  char v5 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  BOOL v2 = *((_DWORD *)this + 2) != 0;
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v4);
  return v2;
}

void ASDT::IOUserClient::SharedLock(ASDT::IOUserClient *this@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = (std::__shared_mutex_base *)((char *)this + 144);
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = 1;
  std::__shared_mutex_base::lock_shared(v2);
}

BOOL ASDT::IOUserClient::IsEqualTo(ASDT::IOUserClient *this, io_object_t a2)
{
  char v6 = (char *)this + 144;
  char v7 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  BOOL v4 = IOObjectIsEqualTo(*((_DWORD *)this + 2), a2) != 0;
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v6);
  return v4;
}

void sub_2489C11E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL ASDT::IOUserClient::ConformsTo(ASDT::IOUserClient *this, const char *a2)
{
  char v7 = (char *)this + 144;
  char v8 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  io_object_t v4 = *((_DWORD *)this + 2);
  if (v4) {
    BOOL v5 = IOObjectConformsTo(v4, a2) != 0;
  }
  else {
    BOOL v5 = 0;
  }
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v7);
  return v5;
}

void sub_2489C1260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t ASDT::IOUserClient::IsServiceAlive(ASDT::IOUserClient *this)
{
  io_object_t v4 = (char *)this + 144;
  char v5 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  uint64_t v2 = *((unsigned __int8 *)this + 16);
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v4);
  return v2;
}

uint64_t ASDT::IOUserClient::GetIOObjectRefCount(uint64_t this)
{
  if (this)
  {
    unsigned int v2 = 0;
    if (MEMORY[0x24C5878D0](*MEMORY[0x263EF8960], this, 0, &v2))
    {
      uint64_t v1 = ASDTBaseLogType();
      this = os_log_type_enabled(v1, OS_LOG_TYPE_ERROR);
      if (this)
      {
        ASDT::IOUserClient::GetIOObjectRefCount();
        return 0;
      }
    }
    else
    {
      return v2;
    }
  }
  return this;
}

uint64_t ASDT::IOUserClient::GetUserClientRefCount(ASDT::IOUserClient *this)
{
  io_object_t v4 = (char *)this + 144;
  char v5 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  uint64_t IOObjectRefCount = ASDT::IOUserClient::GetIOObjectRefCount(*((unsigned int *)this + 2));
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v4);
  return IOObjectRefCount;
}

void sub_2489C13A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t ASDT::IOUserClient::ServiceWasTerminated(ASDT::IOUserClient *this)
{
  io_object_t v4 = (char *)this + 144;
  char v5 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)((char *)this + 144));
  *((unsigned char *)this + 16) = 0;
  if (*((void *)this + 16))
  {
    std::unique_lock<std::shared_mutex>::unlock((uint64_t)&v4);
    (*(void (**)(void, uint64_t))(*((void *)this + 16) + 16))(*((void *)this + 16), v2);
  }
  return std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v4);
}

void sub_2489C1420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void std::unique_lock<std::shared_mutex>::unlock(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    std::__shared_mutex_base::unlock(*(std::__shared_mutex_base **)a1);
    *(unsigned char *)(a1 + 8) = 0;
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::unlock: not locked");
    ASDT::IOUserClient::SetAlwaysLoadPropertiesFromRegistry(v2, v3);
  }
}

uint64_t ASDT::IOUserClient::SetAlwaysLoadPropertiesFromRegistry(ASDT::IOUserClient *this, char a2)
{
  char v5 = (char *)this + 144;
  char v6 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)((char *)this + 144));
  *((unsigned char *)this + 65) = a2;
  if ((a2 & 1) == 0) {
    *((unsigned char *)this + 64) = 1;
  }
  return std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v5);
}

void ASDT::IOUserClient::CopyProperties(ASDT::IOUserClient *this@<X0>, CFMutableDictionaryRef *a2@<X8>)
{
  *a2 = 0;
  CFMutableDictionaryRef properties = 0;
  if (!IORegistryEntryCreateCFProperties((io_registry_entry_t)this, &properties, 0, 0))
  {
    CFMutableDictionaryRef v3 = properties;
    if (properties)
    {
      CFTypeID v4 = CFGetTypeID(properties);
      if (v4 != CFDictionaryGetTypeID())
      {
        CFRelease(v3);
        CFMutableDictionaryRef v3 = 0;
      }
    }
    *a2 = v3;
  }
}

void sub_2489C155C(_Unwind_Exception *a1)
{
  applesauce::CF::DictionaryRef::~DictionaryRef(v1);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::TestForLiveness(ASDT::IOUserClient *this)
{
  ASDT::IOUserClient::CopyProperties(this, (CFMutableDictionaryRef *)&cf);
  CFTypeRef v1 = cf;
  if (cf) {
    CFRelease(cf);
  }
  return v1 != 0;
}

uint64_t ASDT::IOUserClient::CopyProperties@<X0>(ASDT::IOUserClient *this@<X0>, void *a2@<X8>)
{
  char v8 = (char *)this + 144;
  char v9 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  *a2 = 0;
  if (*((unsigned char *)this + 65))
  {
    ASDT::IOUserClient::CopyProperties((ASDT::IOUserClient *)*((unsigned int *)this + 2), v7);
    *a2 = v7[0];
  }
  else if (*((_DWORD *)this + 2) && *((unsigned char *)this + 64))
  {
    std::shared_lock<std::shared_mutex>::unlock((uint64_t)&v8);
    ASDT::IOUserClient::CacheProperties(this, (uint64_t)v7);
    char v5 = (const void *)*((void *)this + 7);
    *a2 = v5;
    if (v5) {
      CFRetain(v5);
    }
    std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)v7);
  }
  else
  {
    char v6 = (const void *)*((void *)this + 7);
    *a2 = v6;
    if (v6) {
      CFRetain(v6);
    }
  }
  return std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v8);
}

void sub_2489C167C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  applesauce::CF::DictionaryRef::~DictionaryRef(v11);
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::CacheNeedsUpdate(ASDT::IOUserClient *this)
{
  return !*((unsigned char *)this + 65) && *((_DWORD *)this + 2) && *((unsigned char *)this + 64) != 0;
}

void std::shared_lock<std::shared_mutex>::unlock(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    std::__shared_mutex_base::unlock_shared(*(std::__shared_mutex_base **)a1);
    *(unsigned char *)(a1 + 8) = 0;
  }
  else
  {
    std::__throw_system_error(1, "shared_lock::unlock: not locked");
    ASDT::IOUserClient::CacheProperties(v2);
  }
}

void ASDT::IOUserClient::CacheProperties(ASDT::IOUserClient *this@<X0>, uint64_t a2@<X8>)
{
  CFMutableDictionaryRef v3 = (std::__shared_mutex_base *)((char *)this + 144);
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = 1;
  std::__shared_mutex_base::lock(v3);
  if (!*((unsigned char *)this + 65))
  {
    CFTypeID v4 = (ASDT::IOUserClient *)*((unsigned int *)this + 2);
    if (v4)
    {
      if (*((unsigned char *)this + 64))
      {
        ASDT::IOUserClient::CopyProperties(v4, (CFMutableDictionaryRef *)&cf);
        CFTypeRef v5 = cf;
        if (cf)
        {
          char v6 = (const void *)*((void *)this + 7);
          *((void *)this + 7) = cf;
          CFRetain(v5);
          if (v6) {
            CFRelease(v6);
          }
          *((unsigned char *)this + 64) = 0;
        }
        else
        {
          char v7 = ASDTBaseLogType();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            ASDT::IOUserClient::CacheProperties();
          }
        }
        if (cf) {
          CFRelease(cf);
        }
      }
    }
  }
}

void sub_2489C17D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100](v2);
  _Unwind_Resume(a1);
}

const __CFDictionary *ASDT::IOUserClient::HasProperty(ASDT::IOUserClient *this, const void **a2)
{
  ASDT::IOUserClient::CopyProperties(this, &cf);
  CFDictionaryRef v3 = applesauce::CF::details::has_key<applesauce::CF::StringRef const&>((const __CFDictionary *)cf, a2);
  if (cf) {
    CFRelease(cf);
  }
  return v3;
}

BOOL ASDT::IOUserClient::CopyProperty(io_registry_entry_t a1, CFStringRef *a2, const void **a3)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, *a2, 0, 0);
  CFTypeRef v5 = *a3;
  if (CFProperty)
  {
    *a3 = CFProperty;
    if (v5) {
      goto LABEL_5;
    }
  }
  else
  {
    *a3 = 0;
    if (v5) {
LABEL_5:
    }
      CFRelease(v5);
  }
  return *a3 != 0;
}

void applesauce::CF::TypeRef::~TypeRef(const void **this)
{
  CFTypeRef v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

BOOL ASDT::IOUserClient::GuardedCopyProperty(ASDT::IOUserClient *this, const void **a2, const void **a3)
{
  CFDictionaryRef v3 = (const __CFDictionary *)*((void *)this + 7);
  if (!v3) {
    return 0;
  }
  applesauce::CF::details::find_at_key_or_optional<applesauce::CF::TypeRef,applesauce::CF::StringRef const&>(v3, a2, (uint64_t)&cf);
  BOOL v5 = v10 != 0;
  if (v10)
  {
    char v6 = *a3;
    CFTypeRef v7 = cf;
    *a3 = cf;
    if (v7) {
      CFRetain(v7);
    }
    if (v6) {
      CFRelease(v6);
    }
  }
  std::__optional_destruct_base<applesauce::CF::TypeRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&cf);
  return v5;
}

BOOL ASDT::IOUserClient::CopyProperty(ASDT::IOUserClient *this, CFStringRef *a2, const void **a3)
{
  uint64_t v11 = (char *)this + 144;
  char v12 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  io_registry_entry_t v6 = *((_DWORD *)this + 2);
  if (*((unsigned char *)this + 65))
  {
    BOOL v7 = ASDT::IOUserClient::CopyProperty(v6, a2, a3);
LABEL_7:
    BOOL v8 = v7;
    goto LABEL_8;
  }
  if (!v6 || !*((unsigned char *)this + 64))
  {
    BOOL v7 = ASDT::IOUserClient::GuardedCopyProperty(this, (const void **)a2, a3);
    goto LABEL_7;
  }
  std::shared_lock<std::shared_mutex>::unlock((uint64_t)&v11);
  ASDT::IOUserClient::CacheProperties(this, (uint64_t)v10);
  BOOL v8 = ASDT::IOUserClient::GuardedCopyProperty(this, (const void **)a2, a3);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)v10);
LABEL_8:
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v11);
  return v8;
}

void sub_2489C1A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::ConvertValue(const void **this, const applesauce::CF::TypeRef *a2, BOOL *a3)
{
  uint64_t result = (uint64_t)*this;
  if (result)
  {
    CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
    if (v6 == CFBooleanGetTypeID())
    {
      applesauce::CF::TypeRef::operator applesauce::CF::BooleanRef(this, (applesauce::CF::BooleanRef *)&cf);
      if (!cf)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x24C587460](exception, "Could not construct");
        __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      *(unsigned char *)a2 = applesauce::CF::convert_to<BOOL,0>((const __CFNumber *)cf);
      if (cf) {
        CFRelease(cf);
      }
      return 1;
    }
    uint64_t result = (uint64_t)*this;
    if (*this)
    {
      CFTypeID v7 = CFGetTypeID((CFTypeRef)result);
      if (v7 == CFNumberGetTypeID())
      {
        int v10 = 0;
        applesauce::CF::TypeRef::operator applesauce::CF::NumberRef(this, (applesauce::CF::NumberRef *)&cf);
        BOOL v8 = ASDT::IOUserClient::ConvertNumber<unsigned int>((const __CFNumber **)&cf, &v10);
        if (cf) {
          CFRelease(cf);
        }
        if (v8)
        {
          *(unsigned char *)a2 = v10 != 0;
          return 1;
        }
      }
      return 0;
    }
  }
  return result;
}

void sub_2489C1B84(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::NumberRef::~NumberRef((const void **)va);
  _Unwind_Resume(a1);
}

applesauce::CF::BooleanRef *applesauce::CF::TypeRef::operator applesauce::CF::BooleanRef@<X0>(const void **a1@<X0>, applesauce::CF::BooleanRef *a2@<X8>)
{
  CFTypeID v4 = *a1;
  if (v4)
  {
    CFTypeID v5 = CFGetTypeID(v4);
    if (v5 != CFBooleanGetTypeID())
    {
      exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
      applesauce::CF::construct_error(exception);
    }
    CFTypeID v6 = *a1;
    if (v6) {
      CFRetain(v6);
    }
  }
  else
  {
    CFTypeID v6 = 0;
  }
  return applesauce::CF::BooleanRef::BooleanRef(a2, v6);
}

void sub_2489C1C58()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_2489C1C78(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::BooleanRef::~BooleanRef(const void **this)
{
  CFTypeRef v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

BOOL ASDT::IOUserClient::ConvertNumber<unsigned int>(const __CFNumber **a1, _DWORD *a2)
{
  CFNumberRef v2 = *a1;
  if (!v2)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  uint64_t v4 = applesauce::CF::convert_as<unsigned int,0>(v2);
  if ((v4 & 0xFF00000000) != 0) {
    *a2 = v4;
  }
  return (v4 & 0xFF00000000) != 0;
}

void sub_2489C1D1C()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_2489C1D3C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

applesauce::CF::NumberRef *applesauce::CF::TypeRef::operator applesauce::CF::NumberRef@<X0>(const void **a1@<X0>, applesauce::CF::NumberRef *a2@<X8>)
{
  uint64_t v4 = *a1;
  if (v4)
  {
    CFTypeID v5 = CFGetTypeID(v4);
    if (v5 != CFNumberGetTypeID())
    {
      exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
      applesauce::CF::construct_error(exception);
    }
    CFTypeID v6 = *a1;
    if (v6) {
      CFRetain(v6);
    }
  }
  else
  {
    CFTypeID v6 = 0;
  }
  return applesauce::CF::NumberRef::NumberRef(a2, v6);
}

void sub_2489C1DDC()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_2489C1DFC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::NumberRef::~NumberRef(const void **this)
{
  CFTypeRef v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

BOOL ASDT::IOUserClient::ConvertValue(const void **this, const applesauce::CF::TypeRef *a2, int *a3)
{
  uint64_t v4 = *this;
  if (!v4) {
    return 0;
  }
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 != CFNumberGetTypeID()) {
    return 0;
  }
  applesauce::CF::TypeRef::operator applesauce::CF::NumberRef(this, (applesauce::CF::NumberRef *)&cf);
  BOOL v7 = ASDT::IOUserClient::ConvertNumber<int>((const __CFNumber **)&cf, a2);
  if (cf) {
    CFRelease(cf);
  }
  return v7;
}

void sub_2489C1ED4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::NumberRef::~NumberRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ConvertNumber<int>(const __CFNumber **a1, _DWORD *a2)
{
  CFNumberRef v2 = *a1;
  if (!v2)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  uint64_t v4 = applesauce::CF::convert_as<int,0>(v2);
  if ((v4 & 0xFF00000000) != 0) {
    *a2 = v4;
  }
  return (v4 & 0xFF00000000) != 0;
}

void sub_2489C1F44()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_2489C1F64(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ConvertValue(const void **this, const applesauce::CF::TypeRef *a2, unsigned int *a3)
{
  uint64_t v4 = *this;
  if (!v4) {
    return 0;
  }
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 != CFNumberGetTypeID()) {
    return 0;
  }
  applesauce::CF::TypeRef::operator applesauce::CF::NumberRef(this, (applesauce::CF::NumberRef *)&cf);
  BOOL v7 = ASDT::IOUserClient::ConvertNumber<unsigned int>((const __CFNumber **)&cf, a2);
  if (cf) {
    CFRelease(cf);
  }
  return v7;
}

void sub_2489C2000(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::NumberRef::~NumberRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ConvertValue(const void **this, const __CFBoolean **a2, uint64_t *a3)
{
  uint64_t v4 = *this;
  if (!v4) {
    return 0;
  }
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 != CFNumberGetTypeID()) {
    return 0;
  }
  applesauce::CF::TypeRef::operator applesauce::CF::NumberRef(this, (applesauce::CF::NumberRef *)&cf);
  BOOL v7 = ASDT::IOUserClient::ConvertNumber<long long>((const __CFNumber **)&cf, a2);
  if (cf) {
    CFRelease(cf);
  }
  return v7;
}

void sub_2489C20A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::NumberRef::~NumberRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ConvertNumber<long long>(const __CFNumber **a1, const __CFBoolean **a2)
{
  CFNumberRef v2 = *a1;
  if (!v2)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  CFBooleanRef v4 = applesauce::CF::convert_as<long long,0>(v2);
  if (v5) {
    *a2 = v4;
  }
  return v5 != 0;
}

void sub_2489C2114()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_2489C2134(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ConvertValue(const void **this, const __CFBoolean **a2, unint64_t *a3)
{
  CFBooleanRef v4 = *this;
  if (!v4) {
    return 0;
  }
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 != CFNumberGetTypeID()) {
    return 0;
  }
  applesauce::CF::TypeRef::operator applesauce::CF::NumberRef(this, (applesauce::CF::NumberRef *)&cf);
  BOOL v7 = ASDT::IOUserClient::ConvertNumber<unsigned long long>((const __CFNumber **)&cf, a2);
  if (cf) {
    CFRelease(cf);
  }
  return v7;
}

void sub_2489C21D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::NumberRef::~NumberRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ConvertNumber<unsigned long long>(const __CFNumber **a1, const __CFBoolean **a2)
{
  CFNumberRef v2 = *a1;
  if (!v2)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  CFBooleanRef v4 = applesauce::CF::convert_as<unsigned long long,0>(v2);
  if (v5) {
    *a2 = v4;
  }
  return v5 != 0;
}

void sub_2489C2240()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_2489C2260(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ConvertValue(const void **this, const applesauce::CF::TypeRef *a2, float *a3)
{
  CFBooleanRef v4 = *this;
  if (!v4) {
    return 0;
  }
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 != CFNumberGetTypeID()) {
    return 0;
  }
  applesauce::CF::TypeRef::operator applesauce::CF::NumberRef(this, (applesauce::CF::NumberRef *)&cf);
  BOOL v7 = ASDT::IOUserClient::ConvertNumber<float>((const __CFNumber **)&cf, a2);
  if (cf) {
    CFRelease(cf);
  }
  return v7;
}

void sub_2489C22FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::NumberRef::~NumberRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ConvertNumber<float>(const __CFNumber **a1, _DWORD *a2)
{
  CFNumberRef v2 = *a1;
  if (!v2)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  uint64_t v4 = applesauce::CF::convert_as<float,0>(v2);
  if ((v4 & 0xFF00000000) != 0) {
    *a2 = v4;
  }
  return (v4 & 0xFF00000000) != 0;
}

void sub_2489C236C()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_2489C238C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ConvertValue(const void **this, const __CFBoolean **a2, double *a3)
{
  uint64_t v4 = *this;
  if (!v4) {
    return 0;
  }
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 != CFNumberGetTypeID()) {
    return 0;
  }
  applesauce::CF::TypeRef::operator applesauce::CF::NumberRef(this, (applesauce::CF::NumberRef *)&cf);
  BOOL v7 = ASDT::IOUserClient::ConvertNumber<double>((const __CFNumber **)&cf, a2);
  if (cf) {
    CFRelease(cf);
  }
  return v7;
}

void sub_2489C2428(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::NumberRef::~NumberRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ConvertNumber<double>(const __CFNumber **a1, const __CFBoolean **a2)
{
  CFNumberRef v2 = *a1;
  if (!v2)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  CFBooleanRef v4 = applesauce::CF::convert_as<double,0>(v2);
  if (v5) {
    *a2 = v4;
  }
  return v5 != 0;
}

void sub_2489C2498()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_2489C24B8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::ConvertValue(const void **this, const void **a2, applesauce::CF::StringRef *a3)
{
  uint64_t result = (uint64_t)*this;
  if (result)
  {
    CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
    if (v6 == CFStringGetTypeID())
    {
      applesauce::CF::TypeRef::operator applesauce::CF::StringRef(this, (applesauce::CF::StringRef *)&v8);
      BOOL v7 = *a2;
      *a2 = v8;
      BOOL v8 = v7;
      if (v7) {
        CFRelease(v7);
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

applesauce::CF::StringRef *applesauce::CF::TypeRef::operator applesauce::CF::StringRef@<X0>(const void **a1@<X0>, applesauce::CF::StringRef *a2@<X8>)
{
  CFBooleanRef v4 = *a1;
  if (v4)
  {
    CFTypeID v5 = CFGetTypeID(v4);
    if (v5 != CFStringGetTypeID())
    {
      exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
      applesauce::CF::construct_error(exception);
    }
    CFTypeID v6 = *a1;
    if (v6) {
      CFRetain(v6);
    }
  }
  else
  {
    CFTypeID v6 = 0;
  }
  return applesauce::CF::StringRef::StringRef(a2, v6);
}

void sub_2489C25E4()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_2489C2604(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::ConvertValue(const void **this, const void **a2, applesauce::CF::ArrayRef *a3)
{
  uint64_t result = (uint64_t)*this;
  if (result)
  {
    CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
    if (v6 == CFArrayGetTypeID())
    {
      applesauce::CF::TypeRef::operator applesauce::CF::ArrayRef(this, (applesauce::CF::ArrayRef *)&v8);
      BOOL v7 = *a2;
      *a2 = v8;
      BOOL v8 = v7;
      if (v7) {
        CFRelease(v7);
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

applesauce::CF::ArrayRef *applesauce::CF::TypeRef::operator applesauce::CF::ArrayRef@<X0>(const void **a1@<X0>, applesauce::CF::ArrayRef *a2@<X8>)
{
  CFBooleanRef v4 = *a1;
  if (v4)
  {
    CFTypeID v5 = CFGetTypeID(v4);
    if (v5 != CFArrayGetTypeID())
    {
      exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
      applesauce::CF::construct_error(exception);
    }
    CFTypeID v6 = *a1;
    if (v6) {
      CFRetain(v6);
    }
  }
  else
  {
    CFTypeID v6 = 0;
  }
  return applesauce::CF::ArrayRef::ArrayRef(a2, v6);
}

void sub_2489C2738()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_2489C2758(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::ConvertValue(const void **this, const void **a2, applesauce::CF::DictionaryRef *a3)
{
  uint64_t result = (uint64_t)*this;
  if (result)
  {
    CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
    if (v6 == CFDictionaryGetTypeID())
    {
      applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef(this, (applesauce::CF::DictionaryRef *)&v8);
      BOOL v7 = *a2;
      *a2 = v8;
      BOOL v8 = v7;
      if (v7) {
        CFRelease(v7);
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

applesauce::CF::DictionaryRef *applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef@<X0>(const void **a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  CFBooleanRef v4 = *a1;
  if (v4)
  {
    CFTypeID v5 = CFGetTypeID(v4);
    if (v5 != CFDictionaryGetTypeID())
    {
      exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
      applesauce::CF::construct_error(exception);
    }
    CFTypeID v6 = *a1;
    if (v6) {
      CFRetain(v6);
    }
  }
  else
  {
    CFTypeID v6 = 0;
  }
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v6);
}

void sub_2489C288C()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_2489C28AC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::ConvertValue(const void **this, const void **a2, applesauce::CF::DataRef *a3)
{
  uint64_t result = (uint64_t)*this;
  if (result)
  {
    CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
    if (v6 == CFDataGetTypeID())
    {
      applesauce::CF::TypeRef::operator applesauce::CF::DataRef(this, (applesauce::CF::DataRef *)&v8);
      BOOL v7 = *a2;
      *a2 = v8;
      BOOL v8 = v7;
      if (v7) {
        CFRelease(v7);
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

applesauce::CF::DataRef *applesauce::CF::TypeRef::operator applesauce::CF::DataRef@<X0>(const void **a1@<X0>, applesauce::CF::DataRef *a2@<X8>)
{
  CFBooleanRef v4 = *a1;
  if (v4)
  {
    CFTypeID v5 = CFGetTypeID(v4);
    if (v5 != CFDataGetTypeID())
    {
      exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
      applesauce::CF::construct_error(exception);
    }
    CFTypeID v6 = *a1;
    if (v6) {
      CFRetain(v6);
    }
  }
  else
  {
    CFTypeID v6 = 0;
  }
  return applesauce::CF::DataRef::DataRef(a2, v6);
}

void sub_2489C29E0()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_2489C2A00(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::DictionarySetValueForKey(CFDictionaryRef *a1, const __CFString **a2, const void **a3)
{
  applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::DictionaryRef_iterator((uint64_t)&v16, *a1);
  applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::DictionaryRef_iterator((uint64_t)&v11, *a1);
  *((void *)&v11 + 1) = (v13 - (unsigned char *)v12) >> 3;
  std::map<applesauce::CF::StringRef,applesauce::CF::TypeRef>::map[abi:ne180100]<applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>>(&v21, &v16, &v11);
  if (__p)
  {
    CFStringRef v15 = __p;
    operator delete(__p);
  }
  if (v12)
  {
    uint64_t v13 = v12;
    operator delete(v12);
  }
  if (v19)
  {
    long long v20 = v19;
    operator delete(v19);
  }
  if (v17)
  {
    std::string v18 = v17;
    operator delete(v17);
  }
  CFTypeID v6 = std::map<applesauce::CF::StringRef,applesauce::CF::TypeRef>::insert_or_assign[abi:ne180100]<applesauce::CF::TypeRef&>((uint64_t)&v21, a2, a3);
  if (v22 == (void **)v6)
  {
    BOOL v8 = ASDTBaseLogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      ASDT::IOUserClient::DictionarySetValueForKey();
    }
  }
  else
  {
    applesauce::CF::make_DictionaryRef<applesauce::CF::StringRef,applesauce::CF::TypeRef>(&v21, &v10);
    CFDictionaryRef v7 = *a1;
    *a1 = v10;
    CFDictionaryRef v10 = v7;
    if (v7) {
      CFRelease(v7);
    }
  }
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::destroy((uint64_t)&v21, v22[0]);
  return v22 != (void **)v6;
}

void sub_2489C2B54(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::destroy(v1 - 56, *(void **)(v1 - 48));
  _Unwind_Resume(a1);
}

void *applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::~DictionaryRef_iterator(void *a1)
{
  CFNumberRef v2 = (void *)a1[5];
  if (v2)
  {
    a1[6] = v2;
    operator delete(v2);
  }
  CFDictionaryRef v3 = (void *)a1[2];
  if (v3)
  {
    a1[3] = v3;
    operator delete(v3);
  }
  return a1;
}

uint64_t *std::map<applesauce::CF::StringRef,applesauce::CF::TypeRef>::insert_or_assign[abi:ne180100]<applesauce::CF::TypeRef&>(uint64_t a1, const __CFString **a2, const void **a3)
{
  CFTypeID v6 = (uint64_t *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 8);
  if (!v7) {
    return std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_hint_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef const&,applesauce::CF::TypeRef&>((uint64_t **)a1, v6, a2, (CFTypeRef *)a2, a3);
  }
  uint64_t v8 = a1 + 8;
  do
  {
    CFComparisonResult v9 = applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>((CFTypeRef *)(v7 + 32), a2);
    CFDictionaryRef v10 = (uint64_t *)(v7 + 8);
    if (v9 != kCFCompareLessThan)
    {
      CFDictionaryRef v10 = (uint64_t *)v7;
      uint64_t v8 = v7;
    }
    uint64_t v7 = *v10;
  }
  while (*v10);
  if ((uint64_t *)v8 == v6
    || applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>((CFTypeRef *)a2, (const __CFString **)(v8 + 32)) == kCFCompareLessThan)
  {
    CFTypeID v6 = (uint64_t *)v8;
    return std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_hint_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef const&,applesauce::CF::TypeRef&>((uint64_t **)a1, v6, a2, (CFTypeRef *)a2, a3);
  }
  long long v11 = *(const void **)(v8 + 40);
  char v12 = *a3;
  *(void *)(v8 + 40) = *a3;
  if (v12) {
    CFRetain(v12);
  }
  if (v11) {
    CFRelease(v11);
  }
  return (uint64_t *)v8;
}

void applesauce::CF::make_DictionaryRef<applesauce::CF::StringRef,applesauce::CF::TypeRef>(CFTypeRef **a1@<X0>, CFDictionaryRef *a2@<X8>)
{
  memset(v11, 0, sizeof(v11));
  std::vector<applesauce::CF::TypeRefPair>::reserve((uint64_t *)v11, (unint64_t)a1[2]);
  CFTypeID v6 = *a1;
  CFBooleanRef v4 = a1 + 1;
  CFTypeID v5 = v6;
  if (v6 != (CFTypeRef *)v4)
  {
    do
    {
      std::vector<applesauce::CF::TypeRefPair>::emplace_back<applesauce::CF::StringRef const&,applesauce::CF::TypeRef const&>((uint64_t *)v11, v5 + 4, v5 + 5);
      uint64_t v7 = (CFTypeRef *)v5[1];
      if (v7)
      {
        do
        {
          uint64_t v8 = (CFTypeRef **)v7;
          uint64_t v7 = (CFTypeRef *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          uint64_t v8 = (CFTypeRef **)v5[2];
          BOOL v9 = *v8 == v5;
          CFTypeID v5 = (CFTypeRef *)v8;
        }
        while (!v9);
      }
      CFTypeID v5 = (CFTypeRef *)v8;
    }
    while (v8 != v4);
  }
  CFDictionaryRef CFDictionaryRef = applesauce::CF::details::make_CFDictionaryRef(v11);
  char v12 = v11;
  std::vector<applesauce::CF::TypeRefPair>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
  *a2 = CFDictionaryRef;
}

void sub_2489C2D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<applesauce::CF::TypeRefPair>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::ArraySetValueAtIndex(CFArrayRef *a1, unint64_t a2, CFTypeRef *a3, char a4)
{
  CFArrayRef v8 = *a1;
  if (*a1)
  {
    Count = (void **)CFArrayGetCount(*a1);
    CFArrayRef v10 = *a1;
    if (*a1)
    {
      CFIndex v11 = CFArrayGetCount(*a1);
      goto LABEL_6;
    }
  }
  else
  {
    Count = 0;
    CFArrayRef v10 = 0;
  }
  CFIndex v11 = 0;
LABEL_6:
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v28 = 0;
  v32[0] = (void **)v8;
  v32[1] = 0;
  v32[2] = Count;
  v31[0] = v10;
  v31[1] = v11;
  v31[2] = v11;
  std::vector<applesauce::CF::TypeRef>::__init_with_size[abi:ne180100]<applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>,applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>>(&v28, (uint64_t)v32, (uint64_t)v31, (unint64_t)Count);
  CFTypeRef v12 = *a3;
  if (*a3)
  {
    unint64_t v13 = v29 - v28;
    if (a4)
    {
      if (v13 < a2)
      {
        std::string v14 = ASDTBaseLogType();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_33;
        }
        goto LABEL_34;
      }
      std::vector<applesauce::CF::TypeRef>::insert((uint64_t *)&v28, (uint64_t)&v28[a2], a3);
    }
    else
    {
      if (v13 <= a2)
      {
        __int16 v24 = ASDTBaseLogType();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        goto LABEL_33;
      }
      long long v19 = (const void *)v28[a2];
      v28[a2] = (uint64_t)v12;
      CFRetain(v12);
      if (v19) {
        CFRelease(v19);
      }
    }
  }
  else
  {
    if ((a4 & 1) == 0)
    {
      long long v20 = ASDTBaseLogType();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        ASDT::IOUserClient::ArraySetValueAtIndex();
      }
      goto LABEL_34;
    }
    CFStringRef v15 = (CFTypeRef *)v29;
    if (a2 >= v29 - v28)
    {
      uint64_t v26 = ASDTBaseLogType();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
LABEL_33:
      }
        ASDT::IOUserClient::ArraySetValueAtIndex();
LABEL_34:
      uint64_t v23 = 0;
      goto LABEL_35;
    }
    long long v16 = &v28[a2];
    char v17 = (CFTypeRef *)(v16 + 1);
    if (v16 + 1 != v29)
    {
      uint64_t v18 = *v16;
      do
      {
        *(v17 - 1) = *v17;
        *v17++ = (CFTypeRef)v18;
        ++v16;
      }
      while (v17 != v15);
      CFStringRef v15 = (CFTypeRef *)v29;
    }
    while (v15 != (CFTypeRef *)v16)
      std::allocator<applesauce::CF::TypeRef>::destroy[abi:ne180100]((uint64_t)&v30, --v15);
    uint64_t v29 = v16;
  }
  CFArrayRef v21 = applesauce::CF::details::make_CFArrayRef<applesauce::CF::TypeRef>(&v28);
  CFArrayRef v22 = *a1;
  *a1 = v21;
  if (v22) {
    CFRelease(v22);
  }
  uint64_t v23 = 1;
LABEL_35:
  v32[0] = (void **)&v28;
  std::vector<applesauce::CF::TypeRef>::__destroy_vector::operator()[abi:ne180100](v32);
  return v23;
}

void sub_2489C2FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void **a16)
{
  a16 = (void **)&a10;
  std::vector<applesauce::CF::TypeRef>::__destroy_vector::operator()[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

CFTypeRef *std::vector<applesauce::CF::TypeRef>::insert(uint64_t *a1, uint64_t a2, CFTypeRef *a3)
{
  CFDictionaryRef v3 = a3;
  uint64_t v6 = *a1;
  unint64_t v5 = a1[1];
  uint64_t v7 = a2 - *a1;
  uint64_t v8 = v7 >> 3;
  BOOL v9 = (CFTypeRef *)(*a1 + (v7 & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = (uint64_t)(a1 + 2);
  unint64_t v10 = a1[2];
  if (v5 >= v10)
  {
    unint64_t v16 = ((uint64_t)(v5 - v6) >> 3) + 1;
    if (v16 >> 61) {
      std::vector<ASDT::Exclaves::StatusTracker::Update>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v18 = v10 - v6;
    if (v18 >> 2 > v16) {
      unint64_t v16 = v18 >> 2;
    }
    if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v19 = v16;
    }
    v45 = a1 + 2;
    if (v19)
    {
      long long v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)(a1 + 2), v19);
      uint64_t v22 = v21;
    }
    else
    {
      long long v20 = 0;
      uint64_t v22 = 0;
    }
    uint64_t v23 = &v20[8 * v8];
    v42 = v20;
    *(void *)&long long v43 = v23;
    *((void *)&v43 + 1) = v23;
    v44 = &v20[8 * v22];
    if (v8 == v22)
    {
      if (v7 < 1)
      {
        if (v6 == a2) {
          unint64_t v30 = 1;
        }
        else {
          unint64_t v30 = v7 >> 2;
        }
        uint64_t v49 = v11;
        v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>(v11, v30);
        v33 = (void *)v43;
        uint64_t v34 = *((void *)&v43 + 1) - v43;
        if (*((void *)&v43 + 1) == (void)v43)
        {
          int64x2_t v39 = vdupq_n_s64(v43);
          unint64_t v36 = (unint64_t)&v31[8 * (v30 >> 2)];
        }
        else
        {
          uint64_t v35 = v34 >> 3;
          unint64_t v36 = (unint64_t)&v31[8 * (v30 >> 2) + (v34 & 0xFFFFFFFFFFFFFFF8)];
          uint64_t v37 = 8 * v35;
          v38 = &v31[8 * (v30 >> 2)];
          do
          {
            *(void *)v38 = *v33;
            v38 += 8;
            *v33++ = 0;
            v37 -= 8;
          }
          while (v37);
          int64x2_t v39 = (int64x2_t)v43;
        }
        v40 = v44;
        v46 = v42;
        v42 = v31;
        *(void *)&long long v43 = &v31[8 * (v30 >> 2)];
        int64x2_t v47 = v39;
        *((void *)&v43 + 1) = v36;
        v44 = &v31[8 * v32];
        v48 = v40;
        std::__split_buffer<applesauce::CF::TypeRef>::~__split_buffer(&v46);
        uint64_t v23 = (char *)*((void *)&v43 + 1);
        uint64_t v11 = (uint64_t)v45;
      }
      else
      {
        unint64_t v24 = v8 + 2;
        if (v8 >= -1) {
          unint64_t v24 = v8 + 1;
        }
        v23 -= 8 * (v24 >> 1);
        *(void *)&long long v43 = v23;
        *((void *)&v43 + 1) = v23;
      }
    }
    std::allocator<applesauce::CF::TypeRef>::construct[abi:ne180100]<applesauce::CF::TypeRef,applesauce::CF::TypeRef const&>(v11, v23, v3);
    *((void *)&v43 + 1) += 8;
    BOOL v9 = (CFTypeRef *)std::vector<applesauce::CF::TypeRef>::__swap_out_circular_buffer(a1, &v42, v9);
    std::__split_buffer<applesauce::CF::TypeRef>::~__split_buffer(&v42);
  }
  else if (v9 == (CFTypeRef *)v5)
  {
    std::allocator<applesauce::CF::TypeRef>::construct[abi:ne180100]<applesauce::CF::TypeRef,applesauce::CF::TypeRef const&>((uint64_t)(a1 + 2), v9, a3);
    a1[1] = (uint64_t)(v9 + 1);
  }
  else
  {
    CFTypeRef v12 = v9 + 1;
    unint64_t v13 = (uint64_t *)(v5 - 8);
    if (v5 < 8)
    {
      CFStringRef v15 = (void *)a1[1];
    }
    else
    {
      std::string v14 = (void *)(v5 - 8);
      CFStringRef v15 = (void *)a1[1];
      do
      {
        *v15++ = *v14;
        *v14++ = 0;
      }
      while ((unint64_t)v14 < v5);
    }
    a1[1] = (uint64_t)v15;
    if ((void *)v5 != v12)
    {
      uint64_t v25 = 8 * ((uint64_t)(v5 - (void)v12) >> 3);
      uint64_t v26 = v6 + 8 * v8 - 8;
      do
      {
        uint64_t v27 = *v13;
        *v13-- = *(void *)(v26 + v25);
        *(void *)(v26 + v25) = v27;
        v25 -= 8;
      }
      while (v25);
    }
    if (v9 <= a3) {
      CFDictionaryRef v3 = &a3[a1[1] > (unint64_t)a3];
    }
    CFTypeRef v28 = *v9;
    CFTypeRef v29 = *v3;
    *BOOL v9 = *v3;
    if (v29) {
      CFRetain(v29);
    }
    if (v28) {
      CFRelease(v28);
    }
  }
  return v9;
}

void sub_2489C32A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

uint64_t ASDT::IOUserClient::PropertiesChanged(ASDT::IOUserClient *this)
{
  CFDictionaryRef v3 = (char *)this + 144;
  char v4 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)((char *)this + 144));
  *((unsigned char *)this + 64) = 1;
  return std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v3);
}

uint64_t ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, CFTypeRef *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  unsigned int v6 = 1937010544;
  uint64_t v22 = (char *)this + 144;
  char v23 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  io_connect_t v7 = *((_DWORD *)this + 3);
  if (!v7 || !*((unsigned char *)this + 16) || (unsigned int v6 = IOConnectSetCFProperty(v7, *a2, *a3)) != 0)
  {
    uint64_t v8 = ASDTBaseLogType();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_5:
      uint64_t v9 = 0;
      goto LABEL_6;
    }
    uint64_t v11 = (void *)((char *)this + 32);
    if (*((char *)this + 55) < 0) {
      uint64_t v11 = (void *)*v11;
    }
    if (!*a2)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C587460](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    std::string::basic_string[abi:ne180100]<0>(&v20, "Unknown");
    CFStringRef v12 = *a2;
    if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&v24, v20.__r_.__value_.__l.__data_, v20.__r_.__value_.__l.__size_);
      if (!v12) {
        goto LABEL_20;
      }
    }
    else
    {
      std::string v24 = v20;
      if (!v12) {
        goto LABEL_20;
      }
    }
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v12))
    {
      applesauce::CF::details::CFString_get_value<false>(v12, (uint64_t)&__p);
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v24.__r_.__value_.__l.__data_);
      }
      goto LABEL_21;
    }
LABEL_20:
    std::string __p = v24;
LABEL_21:
    p_p = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    int v15 = HIBYTE(v6);
    if ((v6 - 0x20000000) >> 24 >= 0x5F) {
      int v15 = 32;
    }
    *(_DWORD *)buf = 136316674;
    uint64_t v26 = v11;
    int v16 = BYTE2(v6);
    if (BYTE2(v6) - 32 >= 0x5F) {
      int v16 = 32;
    }
    __int16 v27 = 2080;
    CFTypeRef v28 = p_p;
    int v17 = BYTE1(v6);
    if (BYTE1(v6) - 32 >= 0x5F) {
      int v17 = 32;
    }
    __int16 v29 = 1024;
    unsigned int v30 = v6;
    __int16 v31 = 1024;
    int v32 = v15;
    __int16 v33 = 1024;
    int v34 = v16;
    if (v6 - 32 >= 0x5F) {
      int v18 = 32;
    }
    else {
      int v18 = v6;
    }
    __int16 v35 = 1024;
    int v36 = v17;
    __int16 v37 = 1024;
    int v38 = v18;
    _os_log_error_impl(&dword_2489BC000, v8, OS_LOG_TYPE_ERROR, "%s: Failed to set property '%s': %x '%c%c%c%c'", buf, 0x34u);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v20.__r_.__value_.__l.__data_);
    }
    goto LABEL_5;
  }
  if (!*((unsigned char *)this + 65))
  {
    std::shared_lock<std::shared_mutex>::unlock((uint64_t)&v22);
    (*(void (**)(ASDT::IOUserClient *))(*(void *)this + 24))(this);
  }
  uint64_t v9 = 1;
LABEL_6:
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v22);
  return v9;
}

{
  CFTypeRef v5;
  uint64_t v6;
  CFTypeRef v8;

  unint64_t v5 = *a3;
  if (*a3) {
    CFRetain(*a3);
  }
  uint64_t v8 = v5;
  unsigned int v6 = ASDT::IOUserClient::SetProperty(this, a2, &v8);
  if (v5) {
    CFRelease(v5);
  }
  return v6;
}

{
  CFTypeRef v5;
  uint64_t v6;
  CFTypeRef v8;

  unint64_t v5 = *a3;
  if (*a3) {
    CFRetain(*a3);
  }
  uint64_t v8 = v5;
  unsigned int v6 = ASDT::IOUserClient::SetProperty(this, a2, &v8);
  if (v5) {
    CFRelease(v5);
  }
  return v6;
}

{
  CFTypeRef v5;
  uint64_t v6;
  CFTypeRef v8;

  unint64_t v5 = *a3;
  if (*a3) {
    CFRetain(*a3);
  }
  uint64_t v8 = v5;
  unsigned int v6 = ASDT::IOUserClient::SetProperty(this, a2, &v8);
  if (v5) {
    CFRelease(v5);
  }
  return v6;
}

{
  CFTypeRef v5;
  uint64_t v6;
  CFTypeRef v8;

  unint64_t v5 = *a3;
  if (*a3) {
    CFRetain(*a3);
  }
  uint64_t v8 = v5;
  unsigned int v6 = ASDT::IOUserClient::SetProperty(this, a2, &v8);
  if (v5) {
    CFRelease(v5);
  }
  return v6;
}

void sub_2489C35E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, int a3)
{
  unint64_t v5 = (const void **)MEMORY[0x263EFFB40];
  if (!a3) {
    unint64_t v5 = (const void **)MEMORY[0x263EFFB38];
  }
  unsigned int v6 = *v5;
  v9[1] = v6;
  if (v6) {
    CFRetain(v6);
  }
  v9[0] = v6;
  uint64_t v7 = ASDT::IOUserClient::SetProperty(this, a2, v9);
  if (v6)
  {
    CFRelease(v6);
    CFRelease(v6);
  }
  return v7;
}

{
  CFNumberRef v5;
  CFNumberRef v6;
  uint64_t v7;
  void *exception;
  CFTypeRef v10[2];

  LODWORD(v10[0]) = a3;
  unint64_t v5 = CFNumberCreate(0, kCFNumberIntType, v10);
  v10[1] = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C587460](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  unsigned int v6 = v5;
  CFRetain(v5);
  v10[0] = v6;
  uint64_t v7 = ASDT::IOUserClient::SetProperty(this, a2, v10);
  CFRelease(v6);
  CFRelease(v6);
  return v7;
}

{
  CFNumberRef v5;
  CFNumberRef v6;
  uint64_t v7;
  void *exception;
  CFTypeRef v10[2];

  LODWORD(v10[0]) = a3;
  unint64_t v5 = CFNumberCreate(0, kCFNumberIntType, v10);
  v10[1] = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C587460](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  unsigned int v6 = v5;
  CFRetain(v5);
  v10[0] = v6;
  uint64_t v7 = ASDT::IOUserClient::SetProperty(this, a2, v10);
  CFRelease(v6);
  CFRelease(v6);
  return v7;
}

void sub_2489C36C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
}

void sub_2489C379C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

void sub_2489C3890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, const __CFNumber *a3)
{
  CFNumberRef valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C587460](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFNumberRef v6 = v5;
  CFRetain(v5);
  CFNumberRef valuePtr = v6;
  uint64_t v7 = ASDT::IOUserClient::SetProperty(this, a2, (CFTypeRef *)&valuePtr);
  CFRelease(v6);
  CFRelease(v6);
  return v7;
}

{
  CFNumberRef v5;
  CFNumberRef v6;
  uint64_t v7;
  void *exception;
  CFNumberRef valuePtr;

  CFNumberRef valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C587460](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFNumberRef v6 = v5;
  CFRetain(v5);
  CFNumberRef valuePtr = v6;
  uint64_t v7 = ASDT::IOUserClient::SetProperty(this, a2, (CFTypeRef *)&valuePtr);
  CFRelease(v6);
  CFRelease(v6);
  return v7;
}

void sub_2489C3984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

void sub_2489C3A78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, float a3)
{
  *(float *)unint64_t v10 = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberFloatType, v10);
  v10[1] = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C587460](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFNumberRef v6 = v5;
  CFRetain(v5);
  v10[0] = v6;
  uint64_t v7 = ASDT::IOUserClient::SetProperty(this, a2, v10);
  CFRelease(v6);
  CFRelease(v6);
  return v7;
}

void sub_2489C3B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, double a3)
{
  CFNumberRef valuePtr = *(CFNumberRef *)&a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C587460](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFNumberRef v6 = v5;
  CFRetain(v5);
  CFNumberRef valuePtr = v6;
  uint64_t v7 = ASDT::IOUserClient::SetProperty(this, a2, (CFTypeRef *)&valuePtr);
  CFRelease(v6);
  CFRelease(v6);
  return v7;
}

void sub_2489C3C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

void sub_2489C3D0C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_2489C3D94(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_2489C3E1C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_2489C3EA4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, CFTypeRef *a3, const applesauce::CF::TypeRef *a4)
{
  kern_return_t v5;
  unsigned int v6;
  NSObject *v7;
  BOOL result;
  CFStringRef v9;
  NSObject *v10;
  CFTypeID TypeID;
  std::string *p_p;
  int v13;
  int v14;
  int v15;
  int v16;
  applesauce::CF *exception;
  std::string v18;
  std::string __p;
  std::string v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  __int16 v27 = *MEMORY[0x263EF8340];
  if (this)
  {
    CFNumberRef v5 = IORegistryEntrySetCFProperty((io_registry_entry_t)this, *a2, *a3);
    if (v5)
    {
      CFNumberRef v6 = v5;
      uint64_t v7 = ASDTBaseLogType();
      uint64_t result = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      if (result)
      {
        if (!*a2)
        {
          exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
          applesauce::CF::construct_error(exception);
        }
        std::string::basic_string[abi:ne180100]<0>(&v18, "Unknown");
        uint64_t v9 = *a2;
        if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&v20, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
        }
        else {
          std::string v20 = v18;
        }
        if (v9 && (CFTypeID TypeID = CFStringGetTypeID(), TypeID == CFGetTypeID(v9)))
        {
          applesauce::CF::details::CFString_get_value<false>(v9, (uint64_t)&__p);
          if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v20.__r_.__value_.__l.__data_);
          }
        }
        else
        {
          std::string __p = v20;
        }
        p_p = &__p;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        unint64_t v13 = HIBYTE(v6);
        if ((v6 - 0x20000000) >> 24 >= 0x5F) {
          unint64_t v13 = 32;
        }
        std::string v14 = BYTE2(v6);
        if (BYTE2(v6) - 32 >= 0x5F) {
          std::string v14 = 32;
        }
        LODWORD(v20.__r_.__value_.__l.__data_) = 136316418;
        *(std::string::size_type *)((char *)v20.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_p;
        int v15 = BYTE1(v6);
        if (BYTE1(v6) - 32 >= 0x5F) {
          int v15 = 32;
        }
        WORD2(v20.__r_.__value_.__r.__words[1]) = 1024;
        *(_DWORD *)((char *)&v20.__r_.__value_.__r.__words[1] + 6) = v6;
        WORD1(v20.__r_.__value_.__r.__words[2]) = 1024;
        HIDWORD(v20.__r_.__value_.__r.__words[2]) = v13;
        uint64_t v21 = 1024;
        uint64_t v22 = v14;
        char v23 = 1024;
        if (v6 - 32 >= 0x5F) {
          int v16 = 32;
        }
        else {
          int v16 = v6;
        }
        std::string v24 = v15;
        uint64_t v25 = 1024;
        uint64_t v26 = v16;
        _os_log_error_impl(&dword_2489BC000, v7, OS_LOG_TYPE_ERROR, "IOUserClient: Failed to set property '%s': %x '%c%c%c%c'", (uint8_t *)&v20, 0x2Au);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v18.__r_.__value_.__l.__data_);
        }
        return 0;
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    unint64_t v10 = ASDTBaseLogType();
    uint64_t result = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (result)
    {
      ASDT::IOUserClient::SetProperty();
      return 0;
    }
  }
  return result;
}

void sub_2489C40F0()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_2489C4110(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, const applesauce::CF::StringRef *a3, const applesauce::CF::TypeRef *a4)
{
  CFNumberRef v6 = (const void **)MEMORY[0x263EFFB40];
  if (!a3) {
    CFNumberRef v6 = (const void **)MEMORY[0x263EFFB38];
  }
  uint64_t v7 = *v6;
  v10[1] = v7;
  if (v7) {
    CFRetain(v7);
  }
  v10[0] = v7;
  BOOL v8 = ASDT::IOUserClient::SetProperty(this, a2, v10, a4);
  if (v7)
  {
    CFRelease(v7);
    CFRelease(v7);
  }
  return v8;
}

void sub_2489C41DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
}

BOOL ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, const applesauce::CF::StringRef *a3)
{
  LODWORD(v11[0]) = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, v11);
  v11[1] = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C587460](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFNumberRef v6 = v5;
  CFRetain(v5);
  v11[0] = v6;
  BOOL v8 = ASDT::IOUserClient::SetProperty(this, a2, v11, v7);
  CFRelease(v6);
  CFRelease(v6);
  return v8;
}

{
  CFNumberRef v5;
  CFNumberRef v6;
  const applesauce::CF::TypeRef *v7;
  BOOL v8;
  void *exception;
  CFTypeRef v11[2];

  LODWORD(v11[0]) = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, v11);
  v11[1] = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C587460](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFNumberRef v6 = v5;
  CFRetain(v5);
  v11[0] = v6;
  BOOL v8 = ASDT::IOUserClient::SetProperty(this, a2, v11, v7);
  CFRelease(v6);
  CFRelease(v6);
  return v8;
}

{
  CFNumberRef v5;
  CFNumberRef v6;
  const applesauce::CF::TypeRef *v7;
  BOOL v8;
  void *exception;
  CFNumberRef valuePtr;

  CFNumberRef valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C587460](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFNumberRef v6 = v5;
  CFRetain(v5);
  CFNumberRef valuePtr = v6;
  BOOL v8 = ASDT::IOUserClient::SetProperty(this, a2, (CFTypeRef *)&valuePtr, v7);
  CFRelease(v6);
  CFRelease(v6);
  return v8;
}

{
  CFNumberRef v5;
  CFNumberRef v6;
  const applesauce::CF::TypeRef *v7;
  BOOL v8;
  void *exception;
  CFNumberRef valuePtr;

  CFNumberRef valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C587460](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFNumberRef v6 = v5;
  CFRetain(v5);
  CFNumberRef valuePtr = v6;
  BOOL v8 = ASDT::IOUserClient::SetProperty(this, a2, (CFTypeRef *)&valuePtr, v7);
  CFRelease(v6);
  CFRelease(v6);
  return v8;
}

void sub_2489C42B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

void sub_2489C43A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

void sub_2489C449C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

void sub_2489C4590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, const applesauce::CF::StringRef *a3, float a4)
{
  *(float *)CFStringRef v12 = a4;
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberFloatType, v12);
  v12[1] = v6;
  if (!v6)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C587460](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFNumberRef v7 = v6;
  CFRetain(v6);
  v12[0] = v7;
  BOOL v9 = ASDT::IOUserClient::SetProperty(this, a2, v12, v8);
  CFRelease(v7);
  CFRelease(v7);
  return v9;
}

void sub_2489C4684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, const applesauce::CF::StringRef *a3, double a4)
{
  CFNumberRef valuePtr = *(CFNumberRef *)&a4;
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  if (!v6)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C587460](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFNumberRef v7 = v6;
  CFRetain(v6);
  CFNumberRef valuePtr = v7;
  BOOL v9 = ASDT::IOUserClient::SetProperty(this, a2, (CFTypeRef *)&valuePtr, v8);
  CFRelease(v7);
  CFRelease(v7);
  return v9;
}

void sub_2489C4778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, CFTypeRef *a3, const applesauce::CF::ArrayRef *a4)
{
  CFTypeRef v6 = *a3;
  if (*a3) {
    CFRetain(*a3);
  }
  CFTypeRef v9 = v6;
  BOOL v7 = ASDT::IOUserClient::SetProperty(this, a2, &v9, a4);
  if (v6) {
    CFRelease(v6);
  }
  return v7;
}

void sub_2489C4824(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, CFTypeRef *a3, const applesauce::CF::DataRef *a4)
{
  CFTypeRef v6 = *a3;
  if (*a3) {
    CFRetain(*a3);
  }
  CFTypeRef v9 = v6;
  BOOL v7 = ASDT::IOUserClient::SetProperty(this, a2, &v9, a4);
  if (v6) {
    CFRelease(v6);
  }
  return v7;
}

void sub_2489C48AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, CFTypeRef *a3, const applesauce::CF::DictionaryRef *a4)
{
  CFTypeRef v6 = *a3;
  if (*a3) {
    CFRetain(*a3);
  }
  CFTypeRef v9 = v6;
  BOOL v7 = ASDT::IOUserClient::SetProperty(this, a2, &v9, a4);
  if (v6) {
    CFRelease(v6);
  }
  return v7;
}

void sub_2489C4934(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, CFTypeRef *a3, const applesauce::CF::StringRef *a4)
{
  CFTypeRef v6 = *a3;
  if (*a3) {
    CFRetain(*a3);
  }
  CFTypeRef v9 = v6;
  BOOL v7 = ASDT::IOUserClient::SetProperty(this, a2, &v9, a4);
  if (v6) {
    CFRelease(v6);
  }
  return v7;
}

void sub_2489C49BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ReplaceProperty(CFDictionaryRef *this, const void **a2, const void **a3, char a4)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if (!*a2)
  {
    unint64_t v10 = ASDTBaseLogType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      ASDT::IOUserClient::ReplaceProperty();
    }
    return 0;
  }
  if (*a3 || (a4 & 1) != 0)
  {
    ASDT::IOUserClient::CacheProperties((ASDT::IOUserClient *)this, (uint64_t)v45);
    CFDictionaryRef v12 = this[7];
    if (v12)
    {
      buf.__r_.__value_.__r.__words[0] = 0;
      applesauce::CF::at_or<applesauce::CF::TypeRef,applesauce::CF::StringRef const&>(v12, a2, &buf, &v48);
      if (buf.__r_.__value_.__r.__words[0]) {
        CFRelease(buf.__r_.__value_.__l.__data_);
      }
      unint64_t v13 = (const void *)v48.__r_.__value_.__r.__words[0];
      std::string v14 = *a3;
      if (v48.__r_.__value_.__r.__words[0])
      {
        if (!v14) {
          goto LABEL_29;
        }
        int v15 = CFEqual(v48.__r_.__value_.__l.__data_, v14);
        unint64_t v13 = (const void *)v48.__r_.__value_.__r.__words[0];
        if (v15)
        {
          if (v48.__r_.__value_.__r.__words[0]) {
            CFRelease(v48.__r_.__value_.__l.__data_);
          }
          goto LABEL_27;
        }
        if (v48.__r_.__value_.__r.__words[0]) {
LABEL_29:
        }
          CFRelease(v13);
      }
      else if (!v14)
      {
LABEL_27:
        BOOL v11 = 1;
LABEL_56:
        std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)v45);
        return v11;
      }
      CFDictionaryRef v16 = this[7];
    }
    else
    {
      CFDictionaryRef v16 = 0;
    }
    applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::DictionaryRef_iterator((uint64_t)&v40, v16);
    applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::DictionaryRef_iterator((uint64_t)&v35, this[7]);
    *((void *)&v35 + 1) = (v37 - (unsigned char *)v36) >> 3;
    std::map<applesauce::CF::StringRef,applesauce::CF::TypeRef>::map[abi:ne180100]<applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>>(&v48, &v40, &v35);
    if (__p)
    {
      uint64_t v39 = __p;
      operator delete(__p);
    }
    if (v36)
    {
      __int16 v37 = v36;
      operator delete(v36);
    }
    if (v43)
    {
      v44 = v43;
      operator delete(v43);
    }
    if (v41)
    {
      v42 = v41;
      operator delete(v41);
    }
    int v17 = (std::string *)std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::find<applesauce::CF::StringRef>((uint64_t)&v48, (const __CFString **)a2);
    int v18 = *a3;
    if (*a3)
    {
      if (&v48.__r_.__value_.__r.__words[1] == (std::string::size_type *)v17)
      {
        if (v17 == (std::string *)std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef const&,applesauce::CF::TypeRef const&>((uint64_t **)&v48, a2, a2, a3))
        {
          char v23 = ASDTBaseLogType();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            __int16 v27 = this + 4;
            if (*((char *)this + 55) < 0) {
              __int16 v27 = (void *)*v27;
            }
            CFTypeRef cf = applesauce::CF::StringRef::operator->(a2);
            std::string::basic_string[abi:ne180100]<0>(v32, "Unknown");
            applesauce::CF::StringRef_proxy::convert_or((const __CFString ***)&cf, (uint64_t)v32, &buf);
            if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              p_std::string buf = &buf;
            }
            else {
              p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
            }
            *(_DWORD *)v50 = 136315394;
            *(void *)&v50[4] = v27;
            __int16 v51 = 2080;
            v52 = p_buf;
            _os_log_error_impl(&dword_2489BC000, v23, OS_LOG_TYPE_ERROR, "%s: ReplaceProperty(%s) failed to insert.", v50, 0x16u);
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(buf.__r_.__value_.__l.__data_);
            }
            if (v33 < 0) {
              operator delete(v32[0]);
            }
          }
          BOOL v11 = 0;
          goto LABEL_55;
        }
      }
      else
      {
        unint64_t v19 = (const void *)v17[1].__r_.__value_.__r.__words[2];
        v17[1].__r_.__value_.__r.__words[2] = (std::string::size_type)v18;
        CFRetain(v18);
        if (v19) {
          CFRelease(v19);
        }
      }
    }
    else
    {
      if (&v48.__r_.__value_.__r.__words[1] == (std::string::size_type *)v17)
      {
        BOOL v11 = 1;
LABEL_55:
        std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::destroy((uint64_t)&v48, (void *)v48.__r_.__value_.__l.__size_);
        goto LABEL_56;
      }
      std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__remove_node_pointer((uint64_t **)&v48, (uint64_t *)v17);
      std::__destroy_at[abi:ne180100]<std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>,0>((uint64_t)&v17[1].__r_.__value_.__l.__size_);
      operator delete(v17);
    }
    applesauce::CF::make_DictionaryRef<applesauce::CF::StringRef,applesauce::CF::TypeRef>((CFTypeRef **)&v48, (CFDictionaryRef *)&cf);
    CFTypeRef v20 = cf;
    BOOL v11 = cf != 0;
    if (cf)
    {
      CFDictionaryRef v21 = this[7];
      this[7] = (CFDictionaryRef)cf;
      CFRetain(v20);
      if (v21) {
        CFRelease(v21);
      }
    }
    else
    {
      uint64_t v22 = ASDTBaseLogType();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = this + 4;
        if (*((char *)this + 55) < 0) {
          uint64_t v25 = (void *)*v25;
        }
        __int16 v31 = (const __CFString **)applesauce::CF::StringRef::operator->(a2);
        std::string::basic_string[abi:ne180100]<0>(v29, "Unknown");
        applesauce::CF::StringRef_proxy::convert_or(&v31, (uint64_t)v29, &buf);
        if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v26 = &buf;
        }
        else {
          uint64_t v26 = (std::string *)buf.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)v50 = 136315394;
        *(void *)&v50[4] = v25;
        __int16 v51 = 2080;
        v52 = v26;
        _os_log_error_impl(&dword_2489BC000, v22, OS_LOG_TYPE_ERROR, "%s: ReplaceProperty(%s) failed to create new dictionary", v50, 0x16u);
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(buf.__r_.__value_.__l.__data_);
        }
        if (v30 < 0) {
          operator delete(v29[0]);
        }
      }
    }
    if (cf) {
      CFRelease(cf);
    }
    goto LABEL_55;
  }
  BOOL v7 = ASDTBaseLogType();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    BOOL v8 = this + 4;
    if (*((char *)this + 55) < 0) {
      BOOL v8 = (void *)*v8;
    }
    *(void *)v50 = applesauce::CF::StringRef::operator->(a2);
    std::string::basic_string[abi:ne180100]<0>(v46, "Unknown");
    applesauce::CF::StringRef_proxy::convert_or((const __CFString ***)v50, (uint64_t)v46, &v48);
    if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      CFTypeRef v9 = &v48;
    }
    else {
      CFTypeRef v9 = (std::string *)v48.__r_.__value_.__r.__words[0];
    }
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v8;
    WORD2(buf.__r_.__value_.__r.__words[1]) = 2080;
    *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v9;
    _os_log_error_impl(&dword_2489BC000, v7, OS_LOG_TYPE_ERROR, "%s: ReplaceProperty(%s) invalid value: (null).", (uint8_t *)&buf, 0x16u);
    if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v48.__r_.__value_.__l.__data_);
    }
    if (v47 < 0) {
      operator delete(v46[0]);
    }
  }
  return 0;
}

void sub_2489C4EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::destroy(v33 - 152, *(void **)(v33 - 144));
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&a33);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ReplaceProperty(CFDictionaryRef *this, const void **a2, const void **a3)
{
  return ASDT::IOUserClient::ReplaceProperty(this, a2, a3, 0);
}

BOOL ASDT::IOUserClient::ReplaceProperty(CFDictionaryRef *this, const void **a2, int a3)
{
  CFNumberRef v5 = (const void **)MEMORY[0x263EFFB40];
  if (!a3) {
    CFNumberRef v5 = (const void **)MEMORY[0x263EFFB38];
  }
  CFTypeRef v6 = *v5;
  cf[1] = v6;
  if (v6) {
    CFRetain(v6);
  }
  cf[0] = v6;
  BOOL v7 = ASDT::IOUserClient::ReplaceProperty(this, a2, cf, 0);
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  if (v6) {
    CFRelease(v6);
  }
  return v7;
}

{
  CFNumberRef v5;
  CFNumberRef v6;
  BOOL v7;
  void *exception;
  CFTypeRef cf[2];

  LODWORD(cf[0]) = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, cf);
  cf[1] = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C587460](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFTypeRef v6 = v5;
  CFRetain(v5);
  cf[0] = v6;
  BOOL v7 = ASDT::IOUserClient::ReplaceProperty(this, a2, cf, 0);
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  CFRelease(v6);
  return v7;
}

{
  CFNumberRef v5;
  CFNumberRef v6;
  BOOL v7;
  void *exception;
  CFTypeRef cf[2];

  LODWORD(cf[0]) = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, cf);
  cf[1] = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C587460](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFTypeRef v6 = v5;
  CFRetain(v5);
  cf[0] = v6;
  BOOL v7 = ASDT::IOUserClient::ReplaceProperty(this, a2, cf, 0);
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  CFRelease(v6);
  return v7;
}

void sub_2489C5010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
}

void sub_2489C50F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

void sub_2489C51EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ReplaceProperty(CFDictionaryRef *this, const void **a2, const __CFNumber *a3)
{
  CFNumberRef valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C587460](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFNumberRef v6 = v5;
  CFRetain(v5);
  CFNumberRef valuePtr = v6;
  BOOL v7 = ASDT::IOUserClient::ReplaceProperty(this, a2, (const void **)&valuePtr, 0);
  if (valuePtr) {
    CFRelease(valuePtr);
  }
  CFRelease(v6);
  return v7;
}

{
  CFNumberRef v5;
  CFNumberRef v6;
  BOOL v7;
  void *exception;
  CFNumberRef valuePtr;

  CFNumberRef valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C587460](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFNumberRef v6 = v5;
  CFRetain(v5);
  CFNumberRef valuePtr = v6;
  BOOL v7 = ASDT::IOUserClient::ReplaceProperty(this, a2, (const void **)&valuePtr, 0);
  if (valuePtr) {
    CFRelease(valuePtr);
  }
  CFRelease(v6);
  return v7;
}

void sub_2489C52E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

void sub_2489C53E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ReplaceProperty(CFDictionaryRef *this, const void **a2, float a3)
{
  *(float *)CFTypeRef cf = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberFloatType, cf);
  cf[1] = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C587460](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFNumberRef v6 = v5;
  CFRetain(v5);
  cf[0] = v6;
  BOOL v7 = ASDT::IOUserClient::ReplaceProperty(this, a2, cf, 0);
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  CFRelease(v6);
  return v7;
}

void sub_2489C54E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ReplaceProperty(CFDictionaryRef *this, const void **a2, double a3)
{
  CFNumberRef valuePtr = *(CFNumberRef *)&a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C587460](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFNumberRef v6 = v5;
  CFRetain(v5);
  CFNumberRef valuePtr = v6;
  BOOL v7 = ASDT::IOUserClient::ReplaceProperty(this, a2, (const void **)&valuePtr, 0);
  if (valuePtr) {
    CFRelease(valuePtr);
  }
  CFRelease(v6);
  return v7;
}

void sub_2489C55DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ReplaceProperty(CFDictionaryRef *this, const void **a2, CFTypeRef *a3)
{
  CFTypeRef v5 = *a3;
  if (*a3) {
    CFRetain(*a3);
  }
  CFTypeRef cf = v5;
  BOOL v6 = ASDT::IOUserClient::ReplaceProperty(this, a2, &cf, 0);
  if (cf) {
    CFRelease(cf);
  }
  return v6;
}

{
  CFTypeRef v5;
  BOOL v6;
  CFTypeRef cf;

  CFTypeRef v5 = *a3;
  if (*a3) {
    CFRetain(*a3);
  }
  CFTypeRef cf = v5;
  BOOL v6 = ASDT::IOUserClient::ReplaceProperty(this, a2, &cf, 0);
  if (cf) {
    CFRelease(cf);
  }
  return v6;
}

{
  CFTypeRef v5;
  BOOL v6;
  CFTypeRef cf;

  CFTypeRef v5 = *a3;
  if (*a3) {
    CFRetain(*a3);
  }
  CFTypeRef cf = v5;
  BOOL v6 = ASDT::IOUserClient::ReplaceProperty(this, a2, &cf, 0);
  if (cf) {
    CFRelease(cf);
  }
  return v6;
}

{
  CFTypeRef v5;
  BOOL v6;
  CFTypeRef cf;

  CFTypeRef v5 = *a3;
  if (*a3) {
    CFRetain(*a3);
  }
  CFTypeRef cf = v5;
  BOOL v6 = ASDT::IOUserClient::ReplaceProperty(this, a2, &cf, 0);
  if (cf) {
    CFRelease(cf);
  }
  return v6;
}

void sub_2489C568C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_2489C5718(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_2489C57A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_2489C5830(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::RemoveProperty(CFDictionaryRef *this, const void **a2)
{
  CFTypeRef cf = 0;
  BOOL v2 = ASDT::IOUserClient::ReplaceProperty(this, a2, &cf, 1);
  if (cf) {
    CFRelease(cf);
  }
  return v2;
}

void sub_2489C5890(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::IsConnectionOpen(ASDT::IOUserClient *this)
{
  char v4 = (char *)this + 144;
  char v5 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  BOOL v2 = *((_DWORD *)this + 3) != 0;
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v4);
  return v2;
}

uint64_t ASDT::IOUserClient::GetConnectionRefCount(ASDT::IOUserClient *this)
{
  char v4 = (char *)this + 144;
  char v5 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  uint64_t IOObjectRefCount = ASDT::IOUserClient::GetIOObjectRefCount(*((unsigned int *)this + 3));
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v4);
  return IOObjectRefCount;
}

void sub_2489C594C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t ASDT::IOUserClient::OpenConnection(ASDT::IOUserClient *this, uint32_t a2)
{
  kern_return_t v10;
  BOOL v11;
  NSObject *v12;
  char *v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  char *v19;
  char v20;
  uint8_t buf[4];
  char *v22;
  __int16 v23;
  uint32_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  long long v35 = *MEMORY[0x263EF8340];
  unint64_t v19 = (char *)this + 144;
  CFTypeRef v20 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)((char *)this + 144));
  if (*((_DWORD *)this + 2) && *((unsigned char *)this + 16))
  {
    if (*((_DWORD *)this + 3))
    {
LABEL_4:
      uint64_t v4 = 1;
    }
    else
    {
      unsigned int v6 = -536870201;
      int v7 = *((_DWORD *)this + 5);
      BOOL v8 = (char *)this + 32;
      CFTypeRef v9 = (task_port_t *)MEMORY[0x263EF8960];
      while (v7)
      {
        unint64_t v10 = IOServiceOpen(*((_DWORD *)this + 2), *v9, a2, (io_connect_t *)this + 3);
        if (!--v7 || (v10 ? (BOOL v11 = v10 == -536870201) : (BOOL v11 = 0), !v11))
        {
          unsigned int v6 = v10;
          if (!v10) {
            goto LABEL_4;
          }
          break;
        }
        CFDictionaryRef v12 = ASDTBaseLogType();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v13 = (char *)this + 32;
          if (*((char *)this + 55) < 0) {
            unint64_t v13 = *(char **)v8;
          }
          *(_DWORD *)std::string buf = 136316674;
          uint64_t v22 = v13;
          char v23 = 1024;
          std::string v24 = a2;
          uint64_t v25 = 1024;
          uint64_t v26 = -536870201;
          __int16 v27 = 1024;
          CFTypeRef v28 = 32;
          __int16 v29 = 1024;
          char v30 = 32;
          __int16 v31 = 1024;
          int v32 = 32;
          uint64_t v33 = 1024;
          int v34 = 32;
          _os_log_impl(&dword_2489BC000, v12, OS_LOG_TYPE_DEFAULT, "%s: OpenConnection(%u) failed: %x (%c%c%c%c): Retrying...", buf, 0x30u);
        }
        usleep(*((_DWORD *)this + 6));
      }
      std::string v14 = ASDTBaseLogType();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        if (*((char *)this + 55) < 0) {
          BOOL v8 = *(char **)v8;
        }
        int v15 = HIBYTE(v6);
        if ((v6 - 0x20000000) >> 24 >= 0x5F) {
          int v15 = 32;
        }
        *(_DWORD *)std::string buf = 136316674;
        uint64_t v22 = v8;
        CFDictionaryRef v16 = BYTE2(v6);
        if (BYTE2(v6) - 32 >= 0x5F) {
          CFDictionaryRef v16 = 32;
        }
        char v23 = 1024;
        std::string v24 = a2;
        int v17 = BYTE1(v6);
        if (BYTE1(v6) - 32 >= 0x5F) {
          int v17 = 32;
        }
        uint64_t v25 = 1024;
        uint64_t v26 = v6;
        __int16 v27 = 1024;
        CFTypeRef v28 = v15;
        __int16 v29 = 1024;
        char v30 = v16;
        if (v6 - 32 >= 0x5F) {
          int v18 = 32;
        }
        else {
          int v18 = v6;
        }
        __int16 v31 = 1024;
        int v32 = v17;
        uint64_t v33 = 1024;
        int v34 = v18;
        _os_log_error_impl(&dword_2489BC000, v14, OS_LOG_TYPE_ERROR, "%s: OpenConnection(%u) failed: %x (%c%c%c%c)", buf, 0x30u);
      }
      uint64_t v4 = 0;
      *((_DWORD *)this + 3) = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v19);
  return v4;
}

void sub_2489C5BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void ASDT::IOUserClient::GuardedCloseConnection(ASDT::IOUserClient *this)
{
  v9.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)this + 312);
  v9.__owns_ = 1;
  std::mutex::lock((std::mutex *)((char *)this + 312));
  for (uint64_t i = (void *)*((void *)this + 9); i != (void *)((char *)this + 80); uint64_t i = v5)
  {
    CFDictionaryRef v3 = (void *)i[1];
    uint64_t v4 = i;
    if (v3)
    {
      do
      {
        char v5 = v3;
        CFDictionaryRef v3 = (void *)*v3;
      }
      while (v3);
    }
    else
    {
      do
      {
        char v5 = (void *)v4[2];
        BOOL v6 = *v5 == (void)v4;
        uint64_t v4 = v5;
      }
      while (!v6);
    }
    ASDT::IOUserClient::GuardedReleaseMemory(this, i[4]);
  }
  std::unique_lock<std::mutex>::unlock(&v9);
  uint64_t v7 = *((void *)this + 12);
  if (v7)
  {
    *((void *)this + 12) = 0;
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  io_connect_t v8 = *((_DWORD *)this + 3);
  if (v8)
  {
    IOServiceClose(v8);
    *((_DWORD *)this + 3) = 0;
  }
  if (v9.__owns_) {
    std::mutex::unlock(v9.__m_);
  }
}

void sub_2489C5CFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::mutex *a9, char a10)
{
  if (a10) {
    std::mutex::unlock(a9);
  }
  _Unwind_Resume(exception_object);
}

void ASDT::IOUserClient::GuardedReleaseMemory(ASDT::IOUserClient *this, unint64_t a2)
{
  CFDictionaryRef v3 = (uint64_t *)((char *)this + 80);
  uint64_t v4 = (void *)*((void *)this + 10);
  if (!v4) {
    goto LABEL_12;
  }
  char v5 = (uint64_t **)((char *)this + 72);
  BOOL v6 = v3;
  do
  {
    unint64_t v7 = v4[4];
    BOOL v8 = v7 >= a2;
    if (v7 >= a2) {
      std::unique_lock<std::mutex> v9 = v4;
    }
    else {
      std::unique_lock<std::mutex> v9 = v4 + 1;
    }
    if (v8) {
      BOOL v6 = v4;
    }
    uint64_t v4 = (void *)*v9;
  }
  while (*v9);
  if (v6 != v3 && v6[4] <= a2)
  {
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__remove_node_pointer(v5, v6);
    operator delete(v6);
    if (*((_DWORD *)this + 3))
    {
      if (*((unsigned char *)this + 16))
      {
        if (MEMORY[0x24C5871C0]())
        {
          BOOL v11 = ASDTBaseLogType();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            ASDT::IOUserClient::GuardedReleaseMemory();
          }
        }
      }
    }
  }
  else
  {
LABEL_12:
    unint64_t v10 = ASDTBaseLogType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      ASDT::IOUserClient::GuardedReleaseMemory();
    }
  }
}

uint64_t ASDT::IOUserClient::CloseConnection(ASDT::IOUserClient *this)
{
  CFDictionaryRef v3 = (char *)this + 144;
  char v4 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)((char *)this + 144));
  (*(void (**)(ASDT::IOUserClient *))(*(void *)this + 40))(this);
  return std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v3);
}

void sub_2489C5E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t ASDT::IOUserClient::GetConnectionNotificationPort(ASDT::IOUserClient *this)
{
  char v4 = (char *)this + 144;
  char v5 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  if (*((unsigned char *)this + 16)) {
    uint64_t v2 = *((void *)this + 12);
  }
  else {
    uint64_t v2 = 0;
  }
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v4);
  return v2;
}

uint64_t ASDT::IOUserClient::SetConnectionNotification(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  unsigned int v6 = 560947818;
  uint64_t v19 = a1 + 144;
  char v20 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)(a1 + 144));
  if (*a3
    && *(_DWORD *)(*a3 + 8)
    && (unsigned int v6 = 1852990585, v7 = *(unsigned int *)(a1 + 12), v7)
    && *(unsigned char *)(a1 + 16)
    && (unsigned int v6 = MEMORY[0x24C587180](v7, a2)) == 0)
  {
    uint64_t v11 = *a3;
    *a3 = 0;
    uint64_t v12 = *(void *)(a1 + 96);
    *(void *)(a1 + 96) = v11;
    if (v12) {
      (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
    }
    uint64_t v9 = 1;
  }
  else
  {
    BOOL v8 = ASDTBaseLogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unint64_t v13 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        unint64_t v13 = (void *)*v13;
      }
      if (*a3) {
        int v14 = *(_DWORD *)(*a3 + 8);
      }
      else {
        int v14 = -1;
      }
      *(_DWORD *)std::string buf = 136316930;
      uint64_t v22 = v13;
      if ((v6 - 0x20000000) >> 24 >= 0x5F) {
        int v15 = 32;
      }
      else {
        int v15 = HIBYTE(v6);
      }
      __int16 v23 = 1024;
      int v24 = a2;
      int v16 = BYTE2(v6);
      if (BYTE2(v6) - 32 >= 0x5F) {
        int v16 = 32;
      }
      __int16 v25 = 1024;
      int v26 = v14;
      int v17 = BYTE1(v6);
      if (BYTE1(v6) - 32 >= 0x5F) {
        int v17 = 32;
      }
      __int16 v27 = 1024;
      unsigned int v28 = v6;
      __int16 v29 = 1024;
      if (v6 - 32 >= 0x5F) {
        int v18 = 32;
      }
      else {
        int v18 = v6;
      }
      int v30 = v15;
      __int16 v31 = 1024;
      int v32 = v16;
      __int16 v33 = 1024;
      int v34 = v17;
      __int16 v35 = 1024;
      int v36 = v18;
      _os_log_error_impl(&dword_2489BC000, v8, OS_LOG_TYPE_ERROR, "%s: SetConnectionNotificationPort(%u, %u, ...) failed: %x (%c%c%c%c)", buf, 0x36u);
    }
    uint64_t v9 = 0;
  }
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v19);
  return v9;
}

void sub_2489C6110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t ASDT::IOUserClient::MapMemory(ASDT::IOUserClient *this, int a2, int a3, unsigned int *a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  int v18 = a2;
  uint64_t v17 = 0;
  int v15 = (char *)this + 144;
  char v16 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  if (*((_DWORD *)this + 3))
  {
    if (*((unsigned char *)this + 16))
    {
      unsigned int v7 = MEMORY[0x24C587160]();
      BOOL v8 = ASDTBaseLogType();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        unint64_t v10 = (void *)((char *)this + 32);
        if (*((char *)this + 55) < 0) {
          unint64_t v10 = (void *)*v10;
        }
        *(_DWORD *)std::string buf = 136316930;
        char v20 = v10;
        if ((v7 - 0x20000000) >> 24 >= 0x5F) {
          int v11 = 32;
        }
        else {
          int v11 = HIBYTE(v7);
        }
        __int16 v21 = 1024;
        int v22 = a2;
        int v12 = BYTE2(v7);
        if (BYTE2(v7) - 32 >= 0x5F) {
          int v12 = 32;
        }
        __int16 v23 = 1024;
        int v24 = a3;
        int v13 = BYTE1(v7);
        if (BYTE1(v7) - 32 >= 0x5F) {
          int v13 = 32;
        }
        __int16 v25 = 1024;
        unsigned int v26 = v7;
        __int16 v27 = 1024;
        if (v7 - 32 >= 0x5F) {
          int v14 = 32;
        }
        else {
          int v14 = v7;
        }
        int v28 = v11;
        __int16 v29 = 1024;
        int v30 = v12;
        __int16 v31 = 1024;
        int v32 = v13;
        __int16 v33 = 1024;
        int v34 = v14;
        _os_log_error_impl(&dword_2489BC000, v8, OS_LOG_TYPE_ERROR, "%s: MapMemory(%u, %u, ...) failed: %x (%c%c%c%c)", buf, 0x36u);
      }
    }
  }
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v15);
  return 0;
}

void sub_2489C632C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  std::mutex::unlock(v11);
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::ReleaseMemory(uint64_t this, unint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = this;
    uint64_t v4 = this + 144;
    char v5 = 1;
    std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)(this + 144));
    std::mutex::lock((std::mutex *)(v3 + 312));
    ASDT::IOUserClient::GuardedReleaseMemory((ASDT::IOUserClient *)v3, a2);
    std::mutex::unlock((std::mutex *)(v3 + 312));
    return std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v4);
  }
  return this;
}

void sub_2489C63CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::mutex::unlock(v9);
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CallMethod(ASDT::IOUserClient *this, uint32_t a2, const unint64_t *a3, uint32_t a4, const void *a5, size_t a6, unint64_t *a7, unsigned int *a8, void *outputStruct, unint64_t *a10)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  uint64_t v18 = 1937010544;
  __int16 v31 = (char *)this + 144;
  char v32 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  mach_port_t v19 = *((_DWORD *)this + 3);
  if (!v19
    || !*((unsigned char *)this + 16)
    || (uint64_t v18 = IOConnectCallMethod(v19, a2, a3, a4, a5, a6, a7, a8, outputStruct, a10), v18))
  {
    char v20 = ASDTBaseLogType();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v22 = (void *)((char *)this + 32);
      if (*((char *)this + 55) < 0) {
        int v22 = (void *)*v22;
      }
      int v23 = HIBYTE(a2);
      if ((a2 - 0x20000000) >> 24 >= 0x5F) {
        int v23 = 32;
      }
      *(_DWORD *)std::string buf = 136317698;
      int v34 = v22;
      int v24 = BYTE2(a2);
      if (BYTE2(a2) - 32 >= 0x5F) {
        int v24 = 32;
      }
      __int16 v35 = 1024;
      uint32_t v36 = a2;
      int v25 = BYTE1(a2);
      if (BYTE1(a2) - 32 >= 0x5F) {
        int v25 = 32;
      }
      __int16 v37 = 1024;
      int v38 = v23;
      int v26 = a2;
      if (a2 - 32 >= 0x5F) {
        int v26 = 32;
      }
      __int16 v39 = 1024;
      int v40 = v24;
      if ((v18 - 0x20000000) >> 24 >= 0x5F) {
        unsigned int v27 = 32;
      }
      else {
        unsigned int v27 = BYTE3(v18);
      }
      __int16 v41 = 1024;
      int v42 = v25;
      int v28 = BYTE2(v18);
      if (BYTE2(v18) - 32 >= 0x5F) {
        int v28 = 32;
      }
      __int16 v43 = 1024;
      int v44 = v26;
      int v29 = BYTE1(v18);
      if (BYTE1(v18) - 32 >= 0x5F) {
        int v29 = 32;
      }
      __int16 v45 = 1024;
      int v46 = v18;
      __int16 v47 = 1024;
      unsigned int v48 = v27;
      __int16 v49 = 1024;
      int v50 = v28;
      if (v18 - 32 >= 0x5F) {
        int v30 = 32;
      }
      else {
        int v30 = v18;
      }
      __int16 v51 = 1024;
      int v52 = v29;
      __int16 v53 = 1024;
      int v54 = v30;
      _os_log_error_impl(&dword_2489BC000, v20, OS_LOG_TYPE_ERROR, "%s: CallMethod %x (%c%c%c%c) failed: %x (%c%c%c%c)", buf, 0x48u);
    }
  }
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v31);
  return v18;
}

void sub_2489C6628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CallTrap(ASDT::IOUserClient *this, uint32_t a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v4 = 1937010544;
  uint64_t v17 = (char *)this + 144;
  char v18 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  io_connect_t v5 = *((_DWORD *)this + 3);
  if (!v5 || !*((unsigned char *)this + 16) || (uint64_t v4 = IOConnectTrap0(v5, a2), v4))
  {
    unsigned int v6 = ASDTBaseLogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = (void *)((char *)this + 32);
      if (*((char *)this + 55) < 0) {
        BOOL v8 = (void *)*v8;
      }
      int v9 = HIBYTE(a2);
      if ((a2 - 0x20000000) >> 24 >= 0x5F) {
        int v9 = 32;
      }
      *(_DWORD *)std::string buf = 136317698;
      char v20 = v8;
      int v10 = BYTE2(a2);
      if (BYTE2(a2) - 32 >= 0x5F) {
        int v10 = 32;
      }
      __int16 v21 = 1024;
      uint32_t v22 = a2;
      int v11 = BYTE1(a2);
      if (BYTE1(a2) - 32 >= 0x5F) {
        int v11 = 32;
      }
      __int16 v23 = 1024;
      int v24 = v9;
      int v12 = a2;
      if (a2 - 32 >= 0x5F) {
        int v12 = 32;
      }
      __int16 v25 = 1024;
      int v26 = v10;
      if ((v4 - 0x20000000) >> 24 >= 0x5F) {
        unsigned int v13 = 32;
      }
      else {
        unsigned int v13 = BYTE3(v4);
      }
      __int16 v27 = 1024;
      int v28 = v11;
      int v14 = BYTE2(v4);
      if (BYTE2(v4) - 32 >= 0x5F) {
        int v14 = 32;
      }
      __int16 v29 = 1024;
      int v30 = v12;
      int v15 = BYTE1(v4);
      if (BYTE1(v4) - 32 >= 0x5F) {
        int v15 = 32;
      }
      __int16 v31 = 1024;
      int v32 = v4;
      __int16 v33 = 1024;
      unsigned int v34 = v13;
      __int16 v35 = 1024;
      int v36 = v14;
      if (v4 - 32 >= 0x5F) {
        int v16 = 32;
      }
      else {
        int v16 = v4;
      }
      __int16 v37 = 1024;
      int v38 = v15;
      __int16 v39 = 1024;
      int v40 = v16;
      _os_log_error_impl(&dword_2489BC000, v6, OS_LOG_TYPE_ERROR, "%s: CallTrap %x (%c%c%c%c) failed: %x (%c%c%c%c)", buf, 0x48u);
    }
  }
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v17);
  return v4;
}

void sub_2489C6828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t ASDT::IOUserClient::CallTrap3(ASDT::IOUserClient *this, uint32_t a2, uintptr_t a3, uintptr_t a4, uintptr_t a5)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v10 = 1937010544;
  __int16 v23 = (char *)this + 144;
  char v24 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  io_connect_t v11 = *((_DWORD *)this + 3);
  if (!v11 || !*((unsigned char *)this + 16) || (uint64_t v10 = IOConnectTrap3(v11, a2, a3, a4, a5), v10))
  {
    int v12 = ASDTBaseLogType();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = (void *)((char *)this + 32);
      if (*((char *)this + 55) < 0) {
        int v14 = (void *)*v14;
      }
      int v15 = HIBYTE(a2);
      if ((a2 - 0x20000000) >> 24 >= 0x5F) {
        int v15 = 32;
      }
      *(_DWORD *)std::string buf = 136317698;
      int v26 = v14;
      int v16 = BYTE2(a2);
      if (BYTE2(a2) - 32 >= 0x5F) {
        int v16 = 32;
      }
      __int16 v27 = 1024;
      uint32_t v28 = a2;
      int v17 = BYTE1(a2);
      if (BYTE1(a2) - 32 >= 0x5F) {
        int v17 = 32;
      }
      __int16 v29 = 1024;
      int v30 = v15;
      int v18 = a2;
      if (a2 - 32 >= 0x5F) {
        int v18 = 32;
      }
      __int16 v31 = 1024;
      int v32 = v16;
      if ((v10 - 0x20000000) >> 24 >= 0x5F) {
        unsigned int v19 = 32;
      }
      else {
        unsigned int v19 = BYTE3(v10);
      }
      __int16 v33 = 1024;
      int v34 = v17;
      int v20 = BYTE2(v10);
      if (BYTE2(v10) - 32 >= 0x5F) {
        int v20 = 32;
      }
      __int16 v35 = 1024;
      int v36 = v18;
      int v21 = BYTE1(v10);
      if (BYTE1(v10) - 32 >= 0x5F) {
        int v21 = 32;
      }
      __int16 v37 = 1024;
      int v38 = v10;
      __int16 v39 = 1024;
      unsigned int v40 = v19;
      __int16 v41 = 1024;
      int v42 = v20;
      if (v10 - 32 >= 0x5F) {
        int v22 = 32;
      }
      else {
        int v22 = v10;
      }
      __int16 v43 = 1024;
      int v44 = v21;
      __int16 v45 = 1024;
      int v46 = v22;
      _os_log_error_impl(&dword_2489BC000, v12, OS_LOG_TYPE_ERROR, "%s: CallTrap3 %x (%c%c%c%c) failed: %x (%c%c%c%c)", buf, 0x48u);
    }
  }
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v23);
  return v10;
}

void sub_2489C6A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t ASDT::IOUserClient::CallTrap6(ASDT::IOUserClient *this, uint64_t a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v4 = 1937010544;
  int v17 = (char *)this + 144;
  char v18 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  uint64_t v5 = *((unsigned int *)this + 3);
  if (!v5 || !*((unsigned char *)this + 16) || (uint64_t v4 = MEMORY[0x24C5871B0](v5, a2), v4))
  {
    unsigned int v6 = ASDTBaseLogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = (void *)((char *)this + 32);
      if (*((char *)this + 55) < 0) {
        BOOL v8 = (void *)*v8;
      }
      unsigned int v9 = BYTE3(a2);
      if ((a2 - 0x20000000) >> 24 >= 0x5F) {
        unsigned int v9 = 32;
      }
      *(_DWORD *)std::string buf = 136317698;
      int v20 = v8;
      int v10 = BYTE2(a2);
      if (BYTE2(a2) - 32 >= 0x5F) {
        int v10 = 32;
      }
      __int16 v21 = 1024;
      int v22 = a2;
      int v11 = BYTE1(a2);
      if (BYTE1(a2) - 32 >= 0x5F) {
        int v11 = 32;
      }
      __int16 v23 = 1024;
      unsigned int v24 = v9;
      int v12 = a2;
      if (a2 - 32 >= 0x5F) {
        int v12 = 32;
      }
      __int16 v25 = 1024;
      int v26 = v10;
      if ((v4 - 0x20000000) >> 24 >= 0x5F) {
        unsigned int v13 = 32;
      }
      else {
        unsigned int v13 = BYTE3(v4);
      }
      __int16 v27 = 1024;
      int v28 = v11;
      int v14 = BYTE2(v4);
      if (BYTE2(v4) - 32 >= 0x5F) {
        int v14 = 32;
      }
      __int16 v29 = 1024;
      int v30 = v12;
      int v15 = BYTE1(v4);
      if (BYTE1(v4) - 32 >= 0x5F) {
        int v15 = 32;
      }
      __int16 v31 = 1024;
      int v32 = v4;
      __int16 v33 = 1024;
      unsigned int v34 = v13;
      __int16 v35 = 1024;
      int v36 = v14;
      if (v4 - 32 >= 0x5F) {
        int v16 = 32;
      }
      else {
        int v16 = v4;
      }
      __int16 v37 = 1024;
      int v38 = v15;
      __int16 v39 = 1024;
      int v40 = v16;
      _os_log_error_impl(&dword_2489BC000, v6, OS_LOG_TYPE_ERROR, "%s: CallTrap6 %x (%c%c%c%c) failed: %x (%c%c%c%c)", buf, 0x48u);
    }
  }
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v17);
  return v4;
}

void sub_2489C6C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL ASDT::IOUserClient::ShouldEnableInterestNotification(ASDT::IOUserClient *this)
{
  return *((void *)this + 16) || *((unsigned char *)this + 136) || *((unsigned char *)this + 137) != 0;
}

void ASDT::IOUserClient::InterestNotificationCallback(ASDT::IOUserClient *this, void *a2, int a3, unsigned int a4, void *a5)
{
  if (this)
  {
    if (a3 == -536870896 || *((_DWORD *)this + 2) == a2)
    {
      uint64_t v5 = *(void (**)(void))(*(void *)this + 56);
      v5();
    }
    else
    {
      unsigned int v6 = ASDTBaseLogType();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        ASDT::IOUserClient::InterestNotificationCallback();
      }
    }
  }
}

unsigned char *ASDT::IOUserClient::InterestNotification(unsigned char *this, int a2, void *a3)
{
  if (a2 == -536870608)
  {
    if (this[137]) {
      return (unsigned char *)(*(uint64_t (**)(void))(*(void *)this + 24))();
    }
  }
  else if (a2 == -536870896 && (*((void *)this + 16) || this[136]))
  {
    return (unsigned char *)(*(uint64_t (**)(void))(*(void *)this + 16))();
  }
  return this;
}

uint64_t ASDT::IOUserClient::SetTerminationBlock(ASDT::IOUserClient *a1, void *aBlock)
{
  uint64_t v4 = (const void *)*((void *)a1 + 16);
  if (v4)
  {
    _Block_release(v4);
    *((void *)a1 + 16) = 0;
  }
  if (aBlock) {
    *((void *)a1 + 16) = _Block_copy(aBlock);
  }
  int v5 = (*(uint64_t (**)(ASDT::IOUserClient *))(*(void *)a1 + 48))(a1);
  return ASDT::IOUserClient::SetInterestNotificationEnabled(a1, v5);
}

uint64_t ASDT::IOUserClient::SetTerminationNotificationEnabled(ASDT::IOUserClient *this, char a2)
{
  unsigned int v7 = (char *)this + 144;
  char v8 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)((char *)this + 144));
  *((unsigned char *)this + 136) = a2;
  int v4 = (*(uint64_t (**)(ASDT::IOUserClient *))(*(void *)this + 48))(this);
  uint64_t v5 = ASDT::IOUserClient::SetInterestNotificationEnabled(this, v4);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v7);
  return v5;
}

void sub_2489C6F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t ASDT::IOUserClient::SetPropertyChangeNotificationEnabled(ASDT::IOUserClient *this, char a2)
{
  unsigned int v7 = (char *)this + 144;
  char v8 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)((char *)this + 144));
  *((unsigned char *)this + 137) = a2;
  int v4 = (*(uint64_t (**)(ASDT::IOUserClient *))(*(void *)this + 48))(this);
  uint64_t v5 = ASDT::IOUserClient::SetInterestNotificationEnabled(this, v4);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v7);
  return v5;
}

void sub_2489C6FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t ASDT::IOUserClient::Release(ASDT::IOUserClient *this)
{
  uint64_t result = *((unsigned int *)this + 2);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *((_DWORD *)this + 2) = 0;
  }
  return result;
}

void applesauce::CF::construct_error(applesauce::CF *this)
{
}

void *applesauce::CF::details::CFString_get_value<false>@<X0>(const __CFString *a1@<X0>, uint64_t a2@<X8>)
{
  CStringPtr = (char *)CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr) {
    return std::string::basic_string[abi:ne180100]<0>((void *)a2, CStringPtr);
  }
  CFIndex Length = CFStringGetLength(a1);
  CFIndex maxBufLen = 0;
  v9.location = 0;
  v9.length = Length;
  CFStringGetBytes(a1, v9, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
  std::string::basic_string[abi:ne180100]((void *)a2, maxBufLen, 0);
  if (*(char *)(a2 + 23) >= 0) {
    unsigned int v7 = (UInt8 *)a2;
  }
  else {
    unsigned int v7 = *(UInt8 **)a2;
  }
  v10.location = 0;
  v10.length = Length;
  return (void *)CFStringGetBytes(a1, v10, 0x8000100u, 0, 0, v7, maxBufLen, &maxBufLen);
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
    unsigned int v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    unsigned int v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

uint64_t std::__optional_destruct_base<applesauce::CF::TypeRef,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    uint64_t v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }
  return a1;
}

applesauce::CF::BooleanRef *applesauce::CF::BooleanRef::BooleanRef(applesauce::CF::BooleanRef *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFBooleanGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C587460](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  return this;
}

void sub_2489C724C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

BOOL applesauce::CF::convert_to<BOOL,0>(const __CFNumber *a1)
{
  if (!a1) {
    goto LABEL_8;
  }
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (TypeID != CFGetTypeID(a1))
  {
    CFTypeID v4 = CFNumberGetTypeID();
    if (v4 == CFGetTypeID(a1))
    {
      LOWORD(Value) = applesauce::CF::details::number_convert_as<BOOL>(a1);
      if ((unsigned __int16)Value > 0xFFu)
      {
        int Value = Value;
        return Value != 0;
      }
    }
LABEL_8:
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::convert_error(exception);
  }
  int Value = CFBooleanGetValue(a1);
  return Value != 0;
}

void sub_2489C7310()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_2489C7330(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::convert_error(applesauce::CF *this)
{
}

uint64_t applesauce::CF::details::number_convert_as<BOOL>(const __CFNumber *a1)
{
  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      CFNumberRef v5 = a1;
      CFNumberType v6 = kCFNumberSInt16Type;
      goto LABEL_12;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberSInt32Type;
      goto LABEL_14;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberSInt64Type;
      goto LABEL_25;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberFloat32Type;
      goto LABEL_21;
    case kCFNumberFloat64Type:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberFloat64Type;
      goto LABEL_29;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberCharType;
LABEL_10:
      int Value = CFNumberGetValue(v2, v3, &valuePtr);
      BOOL v16 = Value == 0;
      int v17 = LOBYTE(valuePtr);
      goto LABEL_15;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberRef v5 = a1;
      CFNumberType v6 = kCFNumberShortType;
LABEL_12:
      int Value = CFNumberGetValue(v5, v6, &valuePtr);
      BOOL v16 = Value == 0;
      int v17 = LOWORD(valuePtr);
      goto LABEL_15;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberIntType;
LABEL_14:
      int Value = CFNumberGetValue(v7, v8, &valuePtr);
      BOOL v16 = Value == 0;
      int v17 = LODWORD(valuePtr);
LABEL_15:
      BOOL v18 = v16 || v17 == 0;
      goto LABEL_33;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberLongType;
      goto LABEL_25;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberLongLongType;
      goto LABEL_25;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberFloatType;
LABEL_21:
      int Value = CFNumberGetValue(v11, v12, &valuePtr);
      BOOL v19 = *(float *)&valuePtr == 0.0;
      goto LABEL_30;
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberDoubleType;
      goto LABEL_29;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberCFIndexType;
      goto LABEL_25;
    case kCFNumberNSIntegerType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberNSIntegerType;
LABEL_25:
      int Value = CFNumberGetValue(v9, v10, &valuePtr);
      if (Value) {
        BOOL v18 = *(void *)&valuePtr == 0;
      }
      else {
        BOOL v18 = 1;
      }
      goto LABEL_33;
    case kCFNumberCGFloatType:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberCGFloatType;
LABEL_29:
      int Value = CFNumberGetValue(v13, v14, &valuePtr);
      BOOL v19 = valuePtr == 0.0;
LABEL_30:
      BOOL v18 = v19 || Value == 0;
LABEL_33:
      int v4 = !v18;
      if (!Value) {
        goto LABEL_38;
      }
      int v20 = 256;
      break;
    default:
      int v4 = 0;
LABEL_38:
      int v20 = 0;
      break;
  }
  return v20 | v4;
}

applesauce::CF::NumberRef *applesauce::CF::NumberRef::NumberRef(applesauce::CF::NumberRef *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFNumberGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C587460](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  return this;
}

void sub_2489C7624(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

applesauce::CF::StringRef *applesauce::CF::StringRef::StringRef(applesauce::CF::StringRef *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFStringGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C587460](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  return this;
}

void sub_2489C76DC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

applesauce::CF::ArrayRef *applesauce::CF::ArrayRef::ArrayRef(applesauce::CF::ArrayRef *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFArrayGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C587460](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  return this;
}

void sub_2489C7794(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

applesauce::CF::DictionaryRef *applesauce::CF::DictionaryRef::DictionaryRef(applesauce::CF::DictionaryRef *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFDictionaryGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C587460](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  return this;
}

void sub_2489C784C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

applesauce::CF::DataRef *applesauce::CF::DataRef::DataRef(applesauce::CF::DataRef *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFDataGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C587460](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  return this;
}

void sub_2489C7904(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

uint64_t applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::DictionaryRef_iterator(uint64_t a1, CFDictionaryRef theDict)
{
  *(void *)a1 = theDict;
  *(_OWORD *)(a1 + 40) = 0u;
  uint64_t v3 = a1 + 40;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(void *)(a1 + 56) = 0;
  if (theDict)
  {
    CFIndex Count = CFDictionaryGetCount(theDict);
    std::vector<void const*>::resize(a1 + 16, Count);
    std::vector<void const*>::resize(v3, Count);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)a1, *(const void ***)(a1 + 16), *(const void ***)(a1 + 40));
  }
  return a1;
}

void std::vector<void const*>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    std::vector<void const*>::__append((void **)a1, a2 - v2);
  }
}

void std::vector<void const*>::__append(void **a1, unint64_t a2)
{
  CFNumberType v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  CFNumberRef v5 = v6;
  CFNumberRef v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = v7 - (unsigned char *)*a1;
    unint64_t v9 = a2 + (v8 >> 3);
    if (v9 >> 61) {
      std::vector<ASDT::Exclaves::StatusTracker::Update>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 3;
    uint64_t v11 = v5 - (unsigned char *)*a1;
    if (v11 >> 2 > v9) {
      unint64_t v9 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      CFNumberRef v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>(v4, v12);
    }
    else {
      CFNumberRef v13 = 0;
    }
    CFNumberType v14 = &v13[8 * v10];
    int v15 = &v13[8 * v12];
    bzero(v14, 8 * a2);
    BOOL v16 = &v14[8 * a2];
    BOOL v18 = (char *)*a1;
    int v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *((void *)v14 - 1) = v19;
        v14 -= 8;
      }
      while (v17 != v18);
      int v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
    {
      operator delete(v17);
    }
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
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
    CFNumberType v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    CFNumberType v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    std::__shared_mutex_base::unlock(*(std::__shared_mutex_base **)a1);
  }
  return a1;
}

void std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::__move_assign(uint64_t a1, void *a2)
{
  size_t v4 = (void *)(a1 + 8);
  std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::destroy(a1, *(void **)(a1 + 8));
  *(void *)a1 = *a2;
  size_t v5 = a2 + 1;
  uint64_t v6 = a2[1];
  void *v4 = v6;
  uint64_t v7 = a2[2];
  *(void *)(a1 + 16) = v7;
  if (v7)
  {
    *(void *)(v6 + 16) = v4;
    *a2 = v5;
    void *v5 = 0;
    a2[2] = 0;
  }
  else
  {
    *(void *)a1 = v4;
  }
}

uint64_t std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    std::__shared_mutex_base::unlock_shared(*(std::__shared_mutex_base **)a1);
  }
  return a1;
}

const __CFDictionary *applesauce::CF::details::has_key<applesauce::CF::StringRef const&>(const __CFDictionary *result, const void **a2)
{
  if (result)
  {
    unint64_t v2 = *a2;
    if (v2) {
      return (const __CFDictionary *)(CFDictionaryContainsKey(result, v2) != 0);
    }
    else {
      return 0;
    }
  }
  return result;
}

const void *applesauce::CF::details::find_at_key_or_optional<applesauce::CF::TypeRef,applesauce::CF::StringRef const&>@<X0>(const __CFDictionary *a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = applesauce::CF::details::at_key<applesauce::CF::StringRef const&>(a1, a2);
  if (result)
  {
    size_t v5 = result;
    uint64_t result = CFRetain(result);
    *(void *)a3 = v5;
    char v6 = 1;
  }
  else
  {
    char v6 = 0;
    *(unsigned char *)a3 = 0;
  }
  *(unsigned char *)(a3 + 8) = v6;
  return result;
}

const __CFDictionary *applesauce::CF::details::at_key<applesauce::CF::StringRef const&>(const __CFDictionary *result, const void **a2)
{
  if (result)
  {
    unint64_t v2 = *a2;
    if (v2) {
      return (const __CFDictionary *)CFDictionaryGetValue(result, v2);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t applesauce::CF::convert_as<unsigned int,0>(const __CFNumber *a1)
{
  if (a1)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(a1)) {
      return applesauce::CF::details::number_convert_as<unsigned int>(a1);
    }
  }
  return applesauce::CF::details::treat_as_BOOL_for_convert_as<unsigned int>(a1);
}

uint64_t applesauce::CF::details::treat_as_BOOL_for_convert_as<unsigned int>(const __CFBoolean *a1)
{
  if (a1 && (CFTypeID TypeID = CFBooleanGetTypeID(), TypeID == CFGetTypeID(a1)))
  {
    uint64_t Value = CFBooleanGetValue(a1);
    uint64_t v4 = 0x100000000;
  }
  else
  {
    uint64_t Value = 0;
    uint64_t v4 = 0;
  }
  return v4 | Value;
}

uint64_t applesauce::CF::details::number_convert_as<unsigned int>(const __CFNumber *a1)
{
  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberSInt16Type;
      goto LABEL_17;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberSInt32Type;
      goto LABEL_28;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberSInt64Type;
      goto LABEL_28;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberFloat32Type;
      goto LABEL_24;
    case kCFNumberFloat64Type:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberFloat64Type;
      goto LABEL_30;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberCharType;
LABEL_10:
      int Value = CFNumberGetValue(v2, v3, &valuePtr);
      uint64_t v16 = Value != 0;
      if (Value) {
        unsigned __int8 v17 = LOBYTE(valuePtr);
      }
      else {
        unsigned __int8 v17 = 0;
      }
      int v18 = -256;
      if ((v16 & (SLOBYTE(valuePtr) < 0)) == 0) {
        int v18 = 0;
      }
      uint64_t v5 = v16 << 32;
      LODWORD(v6) = v18 & 0xFFFFFF00 | v17;
      int v4 = v6 & 0xFFFFFF00;
      return v5 | v4 & 0xFFFFFF00 | v6;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberShortType;
LABEL_17:
      if (CFNumberGetValue(v7, v8, &valuePtr)) {
        uint64_t v6 = SLOWORD(valuePtr) & 0xFFFFFFFFLL | 0x100000000;
      }
      else {
        uint64_t v6 = 0;
      }
      goto LABEL_33;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberIntType;
      goto LABEL_28;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberLongType;
      goto LABEL_28;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberLongLongType;
      goto LABEL_28;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberFloatType;
LABEL_24:
      int v19 = CFNumberGetValue(v11, v12, &valuePtr);
      uint64_t v20 = *(float *)&valuePtr;
      goto LABEL_31;
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberDoubleType;
      goto LABEL_30;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberCFIndexType;
      goto LABEL_28;
    case kCFNumberNSIntegerType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberNSIntegerType;
LABEL_28:
      int v19 = CFNumberGetValue(v9, v10, &valuePtr);
      uint64_t v20 = LODWORD(valuePtr);
      goto LABEL_31;
    case kCFNumberCGFloatType:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberCGFloatType;
LABEL_30:
      int v19 = CFNumberGetValue(v13, v14, &valuePtr);
      uint64_t v20 = valuePtr;
LABEL_31:
      uint64_t v6 = v20 | 0x100000000;
      if (!v19) {
        uint64_t v6 = 0;
      }
LABEL_33:
      int v4 = v6 & 0xFFFFFF00;
      uint64_t v5 = v6 & 0x100000000;
      break;
    default:
      int v4 = 0;
      uint64_t v5 = 0;
      LOBYTE(v6) = 0;
      break;
  }
  return v5 | v4 & 0xFFFFFF00 | v6;
}

uint64_t applesauce::CF::convert_as<int,0>(const __CFNumber *a1)
{
  if (a1)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(a1)) {
      return applesauce::CF::details::number_convert_as<int>(a1);
    }
  }
  return applesauce::CF::details::treat_as_BOOL_for_convert_as<unsigned int>(a1);
}

uint64_t applesauce::CF::details::number_convert_as<int>(const __CFNumber *a1)
{
  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberSInt16Type;
      goto LABEL_17;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberSInt32Type;
      goto LABEL_28;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberSInt64Type;
      goto LABEL_28;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberFloat32Type;
      goto LABEL_24;
    case kCFNumberFloat64Type:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberFloat64Type;
      goto LABEL_30;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberCharType;
LABEL_10:
      int Value = CFNumberGetValue(v2, v3, &valuePtr);
      uint64_t v16 = Value != 0;
      if (Value) {
        unsigned __int8 v17 = LOBYTE(valuePtr);
      }
      else {
        unsigned __int8 v17 = 0;
      }
      int v18 = -256;
      if ((v16 & (SLOBYTE(valuePtr) < 0)) == 0) {
        int v18 = 0;
      }
      uint64_t v5 = v16 << 32;
      LODWORD(v6) = v18 & 0xFFFFFF00 | v17;
      int v4 = v6 & 0xFFFFFF00;
      return v5 | v4 & 0xFFFFFF00 | v6;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberShortType;
LABEL_17:
      if (CFNumberGetValue(v7, v8, &valuePtr)) {
        uint64_t v6 = SLOWORD(valuePtr) & 0xFFFFFFFFLL | 0x100000000;
      }
      else {
        uint64_t v6 = 0;
      }
      goto LABEL_33;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberIntType;
      goto LABEL_28;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberLongType;
      goto LABEL_28;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberLongLongType;
      goto LABEL_28;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberFloatType;
LABEL_24:
      int v19 = CFNumberGetValue(v11, v12, &valuePtr);
      uint64_t v20 = (int)*(float *)&valuePtr;
      goto LABEL_31;
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberDoubleType;
      goto LABEL_30;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberCFIndexType;
      goto LABEL_28;
    case kCFNumberNSIntegerType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberNSIntegerType;
LABEL_28:
      int v19 = CFNumberGetValue(v9, v10, &valuePtr);
      uint64_t v20 = LODWORD(valuePtr);
      goto LABEL_31;
    case kCFNumberCGFloatType:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberCGFloatType;
LABEL_30:
      int v19 = CFNumberGetValue(v13, v14, &valuePtr);
      uint64_t v20 = (int)valuePtr;
LABEL_31:
      uint64_t v6 = v20 | 0x100000000;
      if (!v19) {
        uint64_t v6 = 0;
      }
LABEL_33:
      int v4 = v6 & 0xFFFFFF00;
      uint64_t v5 = v6 & 0x100000000;
      break;
    default:
      int v4 = 0;
      uint64_t v5 = 0;
      LOBYTE(v6) = 0;
      break;
  }
  return v5 | v4 & 0xFFFFFF00 | v6;
}

const __CFBoolean *applesauce::CF::convert_as<long long,0>(const __CFNumber *a1)
{
  if (a1)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(a1)) {
      return (const __CFBoolean *)applesauce::CF::details::number_convert_as<long long>(a1);
    }
  }
  return applesauce::CF::details::treat_as_BOOL_for_convert_as<long long>(a1);
}

const __CFBoolean *applesauce::CF::details::treat_as_BOOL_for_convert_as<long long>(const __CFBoolean *result)
{
  if (result)
  {
    CFBooleanRef v1 = result;
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (TypeID == CFGetTypeID(v1)) {
      return (const __CFBoolean *)CFBooleanGetValue(v1);
    }
    else {
      return 0;
    }
  }
  return result;
}

unint64_t applesauce::CF::details::number_convert_as<long long>(const __CFNumber *a1)
{
  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      CFNumberRef v6 = a1;
      CFNumberType v7 = kCFNumberSInt16Type;
      goto LABEL_18;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v8 = a1;
      CFNumberType v9 = kCFNumberSInt32Type;
      goto LABEL_20;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberSInt64Type;
      goto LABEL_31;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v12 = a1;
      CFNumberType v13 = kCFNumberFloat32Type;
      goto LABEL_27;
    case kCFNumberFloat64Type:
      double valuePtr = 0.0;
      CFNumberRef v14 = a1;
      CFNumberType v15 = kCFNumberFloat64Type;
      goto LABEL_33;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberCharType;
LABEL_10:
      int Value = CFNumberGetValue(v2, v3, &valuePtr);
      if (Value) {
        char v17 = LOBYTE(valuePtr);
      }
      else {
        char v17 = 0;
      }
      if (Value != 0 && SLOBYTE(valuePtr) < 0) {
        unint64_t v4 = -256;
      }
      else {
        unint64_t v4 = 0;
      }
      LOBYTE(v5) = v17;
      return v5 | v4;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberRef v6 = a1;
      CFNumberType v7 = kCFNumberShortType;
LABEL_18:
      BOOL v18 = CFNumberGetValue(v6, v7, &valuePtr) == 0;
      unsigned __int8 v19 = LOBYTE(valuePtr);
      uint64_t v20 = SLOWORD(valuePtr);
      goto LABEL_21;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v8 = a1;
      CFNumberType v9 = kCFNumberIntType;
LABEL_20:
      BOOL v18 = CFNumberGetValue(v8, v9, &valuePtr) == 0;
      unsigned __int8 v19 = LOBYTE(valuePtr);
      uint64_t v20 = SLODWORD(valuePtr);
LABEL_21:
      unint64_t v21 = v20 & 0xFFFFFFFFFFFFFF00 | v19;
      if (v18) {
        uint64_t v5 = 0;
      }
      else {
        uint64_t v5 = v21;
      }
      goto LABEL_37;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberLongType;
      goto LABEL_31;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberLongLongType;
      goto LABEL_31;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v12 = a1;
      CFNumberType v13 = kCFNumberFloatType;
LABEL_27:
      BOOL v22 = CFNumberGetValue(v12, v13, &valuePtr) == 0;
      uint64_t v5 = (uint64_t)*(float *)&valuePtr;
      goto LABEL_34;
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFNumberRef v14 = a1;
      CFNumberType v15 = kCFNumberDoubleType;
      goto LABEL_33;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberCFIndexType;
      goto LABEL_31;
    case kCFNumberNSIntegerType:
      double valuePtr = 0.0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberNSIntegerType;
LABEL_31:
      BOOL v22 = CFNumberGetValue(v10, v11, &valuePtr) == 0;
      uint64_t v5 = *(void *)&valuePtr;
      goto LABEL_34;
    case kCFNumberCGFloatType:
      double valuePtr = 0.0;
      CFNumberRef v14 = a1;
      CFNumberType v15 = kCFNumberCGFloatType;
LABEL_33:
      BOOL v22 = CFNumberGetValue(v14, v15, &valuePtr) == 0;
      uint64_t v5 = (uint64_t)valuePtr;
LABEL_34:
      if (v22) {
        uint64_t v5 = 0;
      }
LABEL_37:
      unint64_t v4 = v5 & 0xFFFFFFFFFFFFFF00;
      break;
    default:
      unint64_t v4 = 0;
      LOBYTE(v5) = 0;
      break;
  }
  return v5 | v4;
}

const __CFBoolean *applesauce::CF::convert_as<unsigned long long,0>(const __CFNumber *a1)
{
  if (a1)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(a1)) {
      return (const __CFBoolean *)applesauce::CF::details::number_convert_as<unsigned long long>(a1);
    }
  }
  return applesauce::CF::details::treat_as_BOOL_for_convert_as<long long>(a1);
}

unint64_t applesauce::CF::details::number_convert_as<unsigned long long>(const __CFNumber *a1)
{
  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      CFNumberRef v6 = a1;
      CFNumberType v7 = kCFNumberSInt16Type;
      goto LABEL_18;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v8 = a1;
      CFNumberType v9 = kCFNumberSInt32Type;
      goto LABEL_20;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberSInt64Type;
      goto LABEL_31;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v12 = a1;
      CFNumberType v13 = kCFNumberFloat32Type;
      goto LABEL_27;
    case kCFNumberFloat64Type:
      double valuePtr = 0.0;
      CFNumberRef v14 = a1;
      CFNumberType v15 = kCFNumberFloat64Type;
      goto LABEL_33;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberCharType;
LABEL_10:
      int Value = CFNumberGetValue(v2, v3, &valuePtr);
      if (Value) {
        char v17 = LOBYTE(valuePtr);
      }
      else {
        char v17 = 0;
      }
      if (Value != 0 && SLOBYTE(valuePtr) < 0) {
        unint64_t v4 = -256;
      }
      else {
        unint64_t v4 = 0;
      }
      LOBYTE(v5) = v17;
      return v5 | v4;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberRef v6 = a1;
      CFNumberType v7 = kCFNumberShortType;
LABEL_18:
      BOOL v18 = CFNumberGetValue(v6, v7, &valuePtr) == 0;
      unsigned __int8 v19 = LOBYTE(valuePtr);
      uint64_t v20 = SLOWORD(valuePtr);
      goto LABEL_21;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v8 = a1;
      CFNumberType v9 = kCFNumberIntType;
LABEL_20:
      BOOL v18 = CFNumberGetValue(v8, v9, &valuePtr) == 0;
      unsigned __int8 v19 = LOBYTE(valuePtr);
      uint64_t v20 = SLODWORD(valuePtr);
LABEL_21:
      unint64_t v21 = v20 & 0xFFFFFFFFFFFFFF00 | v19;
      if (v18) {
        unint64_t v5 = 0;
      }
      else {
        unint64_t v5 = v21;
      }
      goto LABEL_37;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberLongType;
      goto LABEL_31;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberLongLongType;
      goto LABEL_31;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v12 = a1;
      CFNumberType v13 = kCFNumberFloatType;
LABEL_27:
      BOOL v22 = CFNumberGetValue(v12, v13, &valuePtr) == 0;
      unint64_t v5 = (unint64_t)*(float *)&valuePtr;
      goto LABEL_34;
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFNumberRef v14 = a1;
      CFNumberType v15 = kCFNumberDoubleType;
      goto LABEL_33;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberCFIndexType;
      goto LABEL_31;
    case kCFNumberNSIntegerType:
      double valuePtr = 0.0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberNSIntegerType;
LABEL_31:
      BOOL v22 = CFNumberGetValue(v10, v11, &valuePtr) == 0;
      unint64_t v5 = *(void *)&valuePtr;
      goto LABEL_34;
    case kCFNumberCGFloatType:
      double valuePtr = 0.0;
      CFNumberRef v14 = a1;
      CFNumberType v15 = kCFNumberCGFloatType;
LABEL_33:
      BOOL v22 = CFNumberGetValue(v14, v15, &valuePtr) == 0;
      unint64_t v5 = (unint64_t)valuePtr;
LABEL_34:
      if (v22) {
        unint64_t v5 = 0;
      }
LABEL_37:
      unint64_t v4 = v5 & 0xFFFFFFFFFFFFFF00;
      break;
    default:
      unint64_t v4 = 0;
      LOBYTE(v5) = 0;
      break;
  }
  return v5 | v4;
}

uint64_t applesauce::CF::convert_as<float,0>(const __CFNumber *a1)
{
  if (a1)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(a1)) {
      return applesauce::CF::details::number_convert_as<float>(a1);
    }
  }
  return applesauce::CF::details::treat_as_BOOL_for_convert_as<float>(a1);
}

uint64_t applesauce::CF::details::treat_as_BOOL_for_convert_as<float>(const __CFBoolean *a1)
{
  if (a1 && (CFTypeID TypeID = CFBooleanGetTypeID(), TypeID == CFGetTypeID(a1)))
  {
    uint64_t v3 = COERCE_UNSIGNED_INT((float)CFBooleanGetValue(a1));
    uint64_t v4 = 0x100000000;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  return v3 | v4;
}

uint64_t applesauce::CF::details::number_convert_as<float>(const __CFNumber *a1)
{
  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberSInt16Type;
      goto LABEL_12;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberSInt32Type;
      goto LABEL_15;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberSInt64Type;
      goto LABEL_23;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberFloat32Type;
      goto LABEL_19;
    case kCFNumberFloat64Type:
      double valuePtr = 0.0;
      CFNumberRef v15 = a1;
      CFNumberType v16 = kCFNumberFloat64Type;
      goto LABEL_25;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberCharType;
LABEL_10:
      int Value = CFNumberGetValue(v2, v3, &valuePtr);
      int v18 = SLOBYTE(valuePtr);
      goto LABEL_13;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberShortType;
LABEL_12:
      int Value = CFNumberGetValue(v7, v8, &valuePtr);
      int v18 = SLOWORD(valuePtr);
LABEL_13:
      float v19 = (float)v18;
      goto LABEL_26;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberIntType;
LABEL_15:
      int Value = CFNumberGetValue(v9, v10, &valuePtr);
      float v19 = (float)SLODWORD(valuePtr);
      goto LABEL_26;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberLongType;
      goto LABEL_23;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberLongLongType;
      goto LABEL_23;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberFloatType;
LABEL_19:
      int Value = CFNumberGetValue(v13, v14, &valuePtr);
      uint64_t v20 = LODWORD(valuePtr);
      goto LABEL_27;
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFNumberRef v15 = a1;
      CFNumberType v16 = kCFNumberDoubleType;
      goto LABEL_25;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberCFIndexType;
      goto LABEL_23;
    case kCFNumberNSIntegerType:
      double valuePtr = 0.0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberNSIntegerType;
LABEL_23:
      int Value = CFNumberGetValue(v11, v12, &valuePtr);
      float v19 = (float)*(uint64_t *)&valuePtr;
      goto LABEL_26;
    case kCFNumberCGFloatType:
      double valuePtr = 0.0;
      CFNumberRef v15 = a1;
      CFNumberType v16 = kCFNumberCGFloatType;
LABEL_25:
      int Value = CFNumberGetValue(v15, v16, &valuePtr);
      float v19 = valuePtr;
LABEL_26:
      uint64_t v20 = LODWORD(v19);
LABEL_27:
      uint64_t v6 = v20 | 0x100000000;
      if (!Value) {
        uint64_t v6 = 0;
      }
      int v4 = v6 & 0xFFFFFF00;
      uint64_t v5 = v6 & 0x100000000;
      break;
    default:
      int v4 = 0;
      uint64_t v5 = 0;
      LOBYTE(v6) = 0;
      break;
  }
  return v5 | v4 & 0xFFFFFF00 | v6;
}

const __CFBoolean *applesauce::CF::convert_as<double,0>(const __CFNumber *a1)
{
  if (a1)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(a1)) {
      return (const __CFBoolean *)applesauce::CF::details::number_convert_as<double>(a1);
    }
  }
  return applesauce::CF::details::treat_as_BOOL_for_convert_as<double>(a1);
}

const __CFBoolean *applesauce::CF::details::treat_as_BOOL_for_convert_as<double>(const __CFBoolean *result)
{
  if (*(double *)&result != 0.0)
  {
    CFBooleanRef v1 = result;
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (TypeID == CFGetTypeID(v1)) {
      *(double *)&uint64_t result = (double)CFBooleanGetValue(v1);
    }
    else {
      *(double *)&uint64_t result = 0.0;
    }
  }
  return result;
}

unint64_t applesauce::CF::details::number_convert_as<double>(const __CFNumber *a1)
{
  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      CFNumberRef v6 = a1;
      CFNumberType v7 = kCFNumberSInt16Type;
      goto LABEL_12;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v8 = a1;
      CFNumberType v9 = kCFNumberSInt32Type;
      goto LABEL_14;
    case kCFNumberSInt64Type:
      uint64_t valuePtr = 0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberSInt64Type;
      goto LABEL_23;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v12 = a1;
      CFNumberType v13 = kCFNumberFloat32Type;
      goto LABEL_19;
    case kCFNumberFloat64Type:
      uint64_t valuePtr = 0;
      CFNumberRef v14 = a1;
      CFNumberType v15 = kCFNumberFloat64Type;
      goto LABEL_31;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberCharType;
LABEL_10:
      BOOL v16 = CFNumberGetValue(v2, v3, &valuePtr) == 0;
      int v17 = (char)valuePtr;
      goto LABEL_15;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberRef v6 = a1;
      CFNumberType v7 = kCFNumberShortType;
LABEL_12:
      BOOL v16 = CFNumberGetValue(v6, v7, &valuePtr) == 0;
      int v17 = (__int16)valuePtr;
      goto LABEL_15;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v8 = a1;
      CFNumberType v9 = kCFNumberIntType;
LABEL_14:
      BOOL v16 = CFNumberGetValue(v8, v9, &valuePtr) == 0;
      int v17 = valuePtr;
LABEL_15:
      double v18 = (double)v17;
      goto LABEL_24;
    case kCFNumberLongType:
      uint64_t valuePtr = 0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberLongType;
      goto LABEL_23;
    case kCFNumberLongLongType:
      uint64_t valuePtr = 0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberLongLongType;
      goto LABEL_23;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v12 = a1;
      CFNumberType v13 = kCFNumberFloatType;
LABEL_19:
      BOOL v16 = CFNumberGetValue(v12, v13, &valuePtr) == 0;
      double v18 = *(float *)&valuePtr;
      goto LABEL_24;
    case kCFNumberDoubleType:
      uint64_t valuePtr = 0;
      CFNumberRef v14 = a1;
      CFNumberType v15 = kCFNumberDoubleType;
      goto LABEL_31;
    case kCFNumberCFIndexType:
      uint64_t valuePtr = 0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberCFIndexType;
      goto LABEL_23;
    case kCFNumberNSIntegerType:
      uint64_t valuePtr = 0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberNSIntegerType;
LABEL_23:
      BOOL v16 = CFNumberGetValue(v10, v11, &valuePtr) == 0;
      double v18 = (double)valuePtr;
LABEL_24:
      double v5 = v18;
      goto LABEL_25;
    case kCFNumberCGFloatType:
      uint64_t valuePtr = 0;
      CFNumberRef v14 = a1;
      CFNumberType v15 = kCFNumberCGFloatType;
LABEL_31:
      BOOL v16 = CFNumberGetValue(v14, v15, &valuePtr) == 0;
      double v5 = *(double *)&valuePtr;
LABEL_25:
      if (v16) {
        double v5 = 0.0;
      }
      unint64_t v4 = *(void *)&v5 & 0xFFFFFFFFFFFFFF00;
      break;
    default:
      unint64_t v4 = 0;
      LOBYTE(v5) = 0;
      break;
  }
  return LOBYTE(v5) | v4;
}

void *std::map<applesauce::CF::StringRef,applesauce::CF::TypeRef>::map[abi:ne180100]<applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>>(void *a1, long long *a2, long long *a3)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = a1 + 1;
  long long v14 = *a2;
  BOOL v16 = 0;
  uint64_t v17 = 0;
  CFNumberType v15 = 0;
  std::vector<void const*>::__init_with_size[abi:ne180100]<void const**,void const**>(&v15, *((const void **)a2 + 2), *((void *)a2 + 3), (uint64_t)(*((void *)a2 + 3) - *((void *)a2 + 2)) >> 3);
  double v18 = 0;
  float v19 = 0;
  uint64_t v20 = 0;
  std::vector<void const*>::__init_with_size[abi:ne180100]<void const**,void const**>(&v18, *((const void **)a2 + 5), *((void *)a2 + 6), (uint64_t)(*((void *)a2 + 6) - *((void *)a2 + 5)) >> 3);
  long long v7 = *a3;
  CFNumberType v9 = 0;
  uint64_t v10 = 0;
  CFNumberRef v8 = 0;
  std::vector<void const*>::__init_with_size[abi:ne180100]<void const**,void const**>(&v8, *((const void **)a3 + 2), *((void *)a3 + 3), (uint64_t)(*((void *)a3 + 3) - *((void *)a3 + 2)) >> 3);
  std::string __p = 0;
  CFNumberRef v12 = 0;
  uint64_t v13 = 0;
  std::vector<void const*>::__init_with_size[abi:ne180100]<void const**,void const**>(&__p, *((const void **)a3 + 5), *((void *)a3 + 6), (uint64_t)(*((void *)a3 + 6) - *((void *)a3 + 5)) >> 3);
  std::map<applesauce::CF::StringRef,applesauce::CF::TypeRef>::insert[abi:ne180100]<applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>>((uint64_t)a1, &v14, (uint64_t *)&v7);
  if (__p)
  {
    CFNumberRef v12 = __p;
    operator delete(__p);
  }
  if (v8)
  {
    CFNumberType v9 = v8;
    operator delete(v8);
  }
  if (v18)
  {
    float v19 = v18;
    operator delete(v18);
  }
  if (v15)
  {
    BOOL v16 = v15;
    operator delete(v15);
  }
  return a1;
}

void sub_2489C91B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20)
{
  applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::~DictionaryRef_iterator(&a9);
  applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::~DictionaryRef_iterator(&a17);
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::destroy(v20, *(void **)(v20 + 8));
  _Unwind_Resume(a1);
}

BOOL std::map<applesauce::CF::StringRef,applesauce::CF::TypeRef>::insert[abi:ne180100]<applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>>(uint64_t a1, void *a2, uint64_t *a3)
{
  for (BOOL result = applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::equal(a2, a3);
        !result;
        BOOL result = applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::equal(a2, a3))
  {
    applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::dereference(a2, &v7);
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_hint_unique_impl<std::pair<applesauce::CF::TypeRef,applesauce::CF::TypeRef>>((uint64_t **)a1, (uint64_t *)(a1 + 8), (uint64_t)&v7);
    if (cf) {
      CFRelease(cf);
    }
    if (v7) {
      CFRelease(v7);
    }
    ++a2[1];
  }
  return result;
}

void sub_2489C92BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::pair<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::~pair(uint64_t a1)
{
  CFNumberRef v2 = *(const void **)(a1 + 8);
  if (v2) {
    CFRelease(v2);
  }
  if (*(void *)a1) {
    CFRelease(*(CFTypeRef *)a1);
  }
  return a1;
}

BOOL applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::equal(void *a1, uint64_t *a2)
{
  if (*a1 && a1[1] != (uint64_t)(a1[3] - a1[2]) >> 3)
  {
    uint64_t v2 = *a2;
  }
  else
  {
    uint64_t v2 = *a2;
    if (!*a2 || a2[1] == (a2[3] - a2[2]) >> 3) {
      return 1;
    }
  }
  return *a1 == v2 && a1[1] == a2[1];
}

uint64_t *std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_hint_unique_impl<std::pair<applesauce::CF::TypeRef,applesauce::CF::TypeRef>>(uint64_t **a1, uint64_t *a2, uint64_t a3)
{
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__construct_node<std::pair<applesauce::CF::TypeRef,applesauce::CF::TypeRef>>((uint64_t)a1, a3, (uint64_t)v10);
  double v5 = (uint64_t **)std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__find_equal<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>(a1, a2, &v9, &v8, (const __CFString **)v10[0] + 4);
  CFNumberRef v6 = *v5;
  if (!*v5)
  {
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__insert_node_at(a1, (uint64_t)v9, v5, v10[0]);
    CFNumberRef v6 = v10[0];
    v10[0] = 0;
  }
  std::unique_ptr<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>>>>::reset[abi:ne180100]((uint64_t)v10, 0);
  return v6;
}

void sub_2489C9400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::unique_ptr<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

applesauce::CF::StringRef *std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__construct_node<std::pair<applesauce::CF::TypeRef,applesauce::CF::TypeRef>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  CFNumberRef v6 = operator new(0x30uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  BOOL result = applesauce::CF::TypeRef::operator applesauce::CF::StringRef((const void **)a2, (applesauce::CF::StringRef *)(v6 + 4));
  v6[5] = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_2489C947C(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

const __CFString **std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__find_equal<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>(void *a1, uint64_t *a2, const __CFString ***a3, uint64_t *a4, const __CFString **a5)
{
  CFNumberType v9 = (const __CFString **)(a1 + 1);
  if (a1 + 1 == a2
    || applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>((CFTypeRef *)a5, (const __CFString **)a2 + 4) == kCFCompareLessThan)
  {
    if ((uint64_t *)*a1 == a2)
    {
      CFNumberRef v12 = (CFTypeRef *)a2;
    }
    else
    {
      CFNumberType v11 = (CFTypeRef *)*a2;
      if (*a2)
      {
        do
        {
          CFNumberRef v12 = v11;
          CFNumberType v11 = (CFTypeRef *)v11[1];
        }
        while (v11);
      }
      else
      {
        BOOL v16 = a2;
        do
        {
          CFNumberRef v12 = (CFTypeRef *)v16[2];
          BOOL v17 = *v12 == v16;
          BOOL v16 = (uint64_t *)v12;
        }
        while (v17);
      }
      if (applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>(v12 + 4, a5) != kCFCompareLessThan) {
        goto LABEL_17;
      }
    }
    if (*a2)
    {
      *a3 = (const __CFString **)v12;
      return (const __CFString **)(v12 + 1);
    }
    else
    {
      *a3 = (const __CFString **)a2;
      return (const __CFString **)a2;
    }
  }
  if (applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>((CFTypeRef *)a2 + 4, a5) != kCFCompareLessThan)
  {
    *a3 = (const __CFString **)a2;
    *a4 = (uint64_t)a2;
    return (const __CFString **)a4;
  }
  a4 = a2 + 1;
  uint64_t v13 = a2[1];
  if (v13)
  {
    long long v14 = (__CFString *)a2[1];
    do
    {
      CFNumberType v15 = (const __CFString **)v14;
      long long v14 = (__CFString *)v14->isa;
    }
    while (v14);
  }
  else
  {
    float v19 = (const __CFString **)a2;
    do
    {
      CFNumberType v15 = (const __CFString **)v19[2];
      BOOL v17 = *v15 == (const __CFString *)v19;
      float v19 = v15;
    }
    while (!v17);
  }
  if (v15 == v9)
  {
LABEL_29:
    if (v13)
    {
      *a3 = v15;
      return v15;
    }
    else
    {
      *a3 = (const __CFString **)a2;
    }
    return (const __CFString **)a4;
  }
  if (applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>((CFTypeRef *)a5, v15 + 4) == kCFCompareLessThan)
  {
    uint64_t v13 = *a4;
    goto LABEL_29;
  }
LABEL_17:
  return (const __CFString **)std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__find_equal<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>((uint64_t)a1, a3, (CFTypeRef *)a5);
}

uint64_t *std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  BOOL result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void *std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__find_equal<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>(uint64_t a1, void *a2, CFTypeRef *a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        CFTypeRef v7 = (void *)v4;
        uint64_t v8 = (CFTypeRef *)(v4 + 32);
        if (applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>(a3, (const __CFString **)(v4 + 32)) != kCFCompareLessThan)break; {
        uint64_t v4 = *v7;
        }
        uint64_t v5 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if (applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>(v8, (const __CFString **)a3) != kCFCompareLessThan) {
        break;
      }
      uint64_t v5 = v7 + 1;
      uint64_t v4 = v7[1];
    }
    while (v4);
  }
  else
  {
    CFTypeRef v7 = (void *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

CFComparisonResult applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>(CFTypeRef *a1, const __CFString **a2)
{
  CFStringRef v3 = (const __CFString *)*a1;
  if (*a1)
  {
    CFRetain(*a1);
    CFStringRef v4 = *a2;
    if (!v4)
    {
      CFComparisonResult v5 = kCFCompareGreaterThan;
LABEL_9:
      CFRelease(v3);
      return v5;
    }
  }
  else
  {
    CFStringRef v4 = *a2;
    if (!*a2) {
      return 0;
    }
  }
  CFRetain(v4);
  if (v3) {
    CFComparisonResult v5 = CFStringCompare(v3, v4, 0);
  }
  else {
    CFComparisonResult v5 = kCFCompareLessThan;
  }
  CFRelease(v4);
  if (v3) {
    goto LABEL_9;
  }
  return v5;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      CFStringRef v3 = (uint64_t *)v2[2];
      CFStringRef v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            CFNumberType v9 = (uint64_t **)a2[2];
          }
          else
          {
            CFNumberType v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              CFTypeRef v10[2] = (uint64_t)v2;
              CFStringRef v3 = (uint64_t *)v2[2];
            }
            CFTypeRef v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *CFNumberType v9 = v2;
            v2[2] = (uint64_t)v9;
            CFStringRef v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *CFStringRef v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            CFStringRef v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          CFStringRef v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>,0>(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 8);
  if (v2) {
    CFRelease(v2);
  }
  if (*(void *)a1) {
    CFRelease(*(CFTypeRef *)a1);
  }
}

void *applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::dereference@<X0>(void *result@<X0>, void *a2@<X8>)
{
  unint64_t v3 = result[1];
  if ((v3 & 0x8000000000000000) != 0 || (v4 = result, uint64_t v5 = result[2], v3 >= (result[3] - v5) >> 3))
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::out_of_range::out_of_range[abi:ne180100](exception, "DictionaryRef_iterator iterator out of range.");
    __cxa_throw(exception, (struct type_info *)off_265243928, MEMORY[0x263F8C068]);
  }
  uint64_t v6 = *(void *)(v5 + 8 * v3);
  if (v6)
  {
    BOOL result = CFRetain(*(CFTypeRef *)(v5 + 8 * v3));
    unint64_t v3 = v4[1];
  }
  uint64_t v7 = v4[5];
  uint64_t v8 = *(void *)(v7 + 8 * v3);
  if (v8) {
    BOOL result = CFRetain(*(CFTypeRef *)(v7 + 8 * v3));
  }
  *a2 = v6;
  a2[1] = v8;
  return result;
}

void sub_2489C9ABC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  BOOL result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void *std::vector<void const*>::__init_with_size[abi:ne180100]<void const**,void const**>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    BOOL result = std::vector<void const*>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      BOOL result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2489C9B64(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<void const*>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<ASDT::Exclaves::StatusTracker::Update>::__throw_length_error[abi:ne180100]();
  }
  BOOL result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

uint64_t *std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_hint_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef const&,applesauce::CF::TypeRef&>(uint64_t **a1, uint64_t *a2, const __CFString **a3, CFTypeRef *a4, const void **a5)
{
  size_t v8 = std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__find_equal<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>(a1, a2, &v15, &v14, a3);
  CFNumberType v9 = (uint64_t *)*v8;
  if (!*v8)
  {
    uint64_t v10 = (uint64_t **)v8;
    CFNumberType v9 = (uint64_t *)operator new(0x30uLL);
    v12[1] = a1 + 1;
    std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>::pair[abi:ne180100]<applesauce::CF::StringRef const&,applesauce::CF::TypeRef&,0>(v9 + 4, a4, a5);
    char v13 = 1;
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__insert_node_at(a1, (uint64_t)v15, v10, v9);
    v12[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>>>>::reset[abi:ne180100]((uint64_t)v12, 0);
  }
  return v9;
}

void *std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>::pair[abi:ne180100]<applesauce::CF::StringRef const&,applesauce::CF::TypeRef&,0>(void *a1, CFTypeRef *a2, const void **a3)
{
  CFTypeRef v5 = *a2;
  if (*a2) {
    CFRetain(*a2);
  }
  *a1 = v5;
  uint64_t v6 = *a3;
  if (v6) {
    CFRetain(v6);
  }
  a1[1] = v6;
  return a1;
}

void **std::vector<applesauce::CF::TypeRefPair>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  BOOL result = (void **)(a1 + 2);
  if (a2 > (v4 - *a1) >> 4)
  {
    if (a2 >> 60) {
      std::vector<ASDT::Exclaves::StatusTracker::Update>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>((uint64_t)result, a2);
    v7[1] = (char *)v7[0] + v5;
    CFMutableDictionaryRef v7[2] = (char *)v7[0] + v5;
    v7[3] = (char *)v7[0] + 16 * v6;
    std::vector<applesauce::CF::TypeRefPair>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer(v7);
  }
  return result;
}

void sub_2489C9DBC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<applesauce::CF::TypeRefPair>::emplace_back<applesauce::CF::StringRef const&,applesauce::CF::TypeRef const&>(uint64_t *a1, CFTypeRef *a2, const void **a3)
{
  unint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  unint64_t v7 = v8;
  unint64_t v9 = *(void *)(v6 - 8);
  if (v9 >= v8)
  {
    uint64_t v11 = (uint64_t)(v9 - *a1) >> 4;
    if ((unint64_t)(v11 + 1) >> 60) {
      std::vector<ASDT::Exclaves::StatusTracker::Update>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v7 - *a1;
    uint64_t v13 = v12 >> 3;
    if (v12 >> 3 <= (unint64_t)(v11 + 1)) {
      uint64_t v13 = v11 + 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    uint64_t v21 = v6;
    if (v14) {
      CFNumberType v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(v6, v14);
    }
    else {
      CFNumberType v15 = 0;
    }
    BOOL v17 = v15;
    double v18 = &v15[16 * v11];
    uint64_t v20 = &v15[16 * v14];
    applesauce::CF::TypeRefPair::TypeRefPair<applesauce::CF::StringRef const&,applesauce::CF::TypeRef const&>(v18, a2, a3);
    float v19 = v18 + 16;
    std::vector<applesauce::CF::TypeRefPair>::__swap_out_circular_buffer(a1, &v17);
    uint64_t v10 = a1[1];
    std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer(&v17);
  }
  else
  {
    applesauce::CF::TypeRefPair::TypeRefPair<applesauce::CF::StringRef const&,applesauce::CF::TypeRef const&>(*(void **)(v6 - 8), a2, a3);
    uint64_t v10 = v9 + 16;
    a1[1] = v9 + 16;
  }
  a1[1] = v10;
  return v10 - 16;
}

void sub_2489C9ED0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

CFDictionaryRef applesauce::CF::details::make_CFDictionaryRef(void ***a1)
{
  uint64_t v2 = ((char *)a1[1] - (char *)*a1) >> 4;
  keys = 0;
  __int16 v35 = 0;
  int v36 = 0;
  std::vector<void const*>::reserve((void **)&keys, v2);
  values = 0;
  int v32 = 0;
  __int16 v33 = 0;
  std::vector<void const*>::reserve((void **)&values, v2);
  unint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1 != v4)
  {
    do
    {
      uint64_t v5 = *v3;
      if (!*v3 || !v3[1])
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x24C587460](exception, "Could not construct");
        __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      uint64_t v6 = v35;
      if (v35 >= v36)
      {
        uint64_t v8 = v35 - keys;
        if ((unint64_t)(v8 + 1) >> 61) {
          std::vector<ASDT::Exclaves::StatusTracker::Update>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v9 = ((char *)v36 - (char *)keys) >> 2;
        if (v9 <= v8 + 1) {
          unint64_t v9 = v8 + 1;
        }
        if ((unint64_t)((char *)v36 - (char *)keys) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v10 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v10 = v9;
        }
        if (v10) {
          uint64_t v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)&v36, v10);
        }
        else {
          uint64_t v11 = 0;
        }
        uint64_t v12 = (void **)&v11[8 * v8];
        CFTypeRef *v12 = v5;
        unint64_t v7 = v12 + 1;
        unint64_t v14 = keys;
        uint64_t v13 = v35;
        if (v35 != keys)
        {
          do
          {
            CFNumberType v15 = *--v13;
            *--uint64_t v12 = v15;
          }
          while (v13 != v14);
          uint64_t v13 = keys;
        }
        keys = v12;
        __int16 v35 = v7;
        int v36 = (void **)&v11[8 * v10];
        if (v13) {
          operator delete(v13);
        }
      }
      else
      {
        *__int16 v35 = v5;
        unint64_t v7 = v6 + 1;
      }
      __int16 v35 = v7;
      BOOL v16 = v3[1];
      BOOL v17 = v32;
      if (v32 >= v33)
      {
        uint64_t v19 = v32 - values;
        if ((unint64_t)(v19 + 1) >> 61) {
          std::vector<ASDT::Exclaves::StatusTracker::Update>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v20 = ((char *)v33 - (char *)values) >> 2;
        if (v20 <= v19 + 1) {
          unint64_t v20 = v19 + 1;
        }
        if ((unint64_t)((char *)v33 - (char *)values) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v21 = v20;
        }
        if (v21) {
          BOOL v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)&v33, v21);
        }
        else {
          BOOL v22 = 0;
        }
        __int16 v23 = (void **)&v22[8 * v19];
        *__int16 v23 = v16;
        double v18 = v23 + 1;
        __int16 v25 = values;
        unsigned int v24 = v32;
        if (v32 != values)
        {
          do
          {
            int v26 = *--v24;
            *--__int16 v23 = v26;
          }
          while (v24 != v25);
          unsigned int v24 = values;
        }
        values = v23;
        int v32 = v18;
        __int16 v33 = (void **)&v22[8 * v21];
        if (v24) {
          operator delete(v24);
        }
      }
      else
      {
        *int v32 = v16;
        double v18 = v17 + 1;
      }
      int v32 = v18;
      v3 += 2;
    }
    while (v3 != v4);
  }
  CFDictionaryRef v27 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, v2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v27)
  {
    int v30 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C587460](v30, "Could not construct");
    __cxa_throw(v30, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (values)
  {
    int v32 = values;
    operator delete(values);
  }
  if (keys)
  {
    __int16 v35 = keys;
    operator delete(keys);
  }
  return v27;
}

void sub_2489CA1C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  __cxa_free_exception(v13);
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(a1);
}

uint64_t std::vector<applesauce::CF::TypeRefPair>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>,std::reverse_iterator<applesauce::CF::TypeRefPair*>,std::reverse_iterator<applesauce::CF::TypeRefPair*>,std::reverse_iterator<applesauce::CF::TypeRefPair*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>,std::reverse_iterator<applesauce::CF::TypeRefPair*>,std::reverse_iterator<applesauce::CF::TypeRefPair*>,std::reverse_iterator<applesauce::CF::TypeRefPair*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  void v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    uint64_t v8 = a7;
    do
    {
      uint64_t v9 = *(a3 - 2);
      a3 -= 2;
      *(void *)(v8 - 16) = v9;
      v8 -= 16;
      *a3 = 0;
      *(void *)(v8 + 8) = a3[1];
      a3[1] = 0;
      v7 -= 16;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v8;
    uint64_t v10 = v15;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRefPair>,std::reverse_iterator<applesauce::CF::TypeRefPair*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRefPair>,std::reverse_iterator<applesauce::CF::TypeRefPair*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRefPair>,std::reverse_iterator<applesauce::CF::TypeRefPair*>>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRefPair>,std::reverse_iterator<applesauce::CF::TypeRefPair*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      std::allocator<applesauce::CF::TypeRefPair>::destroy[abi:ne180100](v3, v1);
      v1 += 16;
    }
    while (v1 != v2);
  }
}

void std::allocator<applesauce::CF::TypeRefPair>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(const void **)(a2 + 8);
  if (v3) {
    CFRelease(v3);
  }
  if (*(void *)a2) {
    CFRelease(*(CFTypeRef *)a2);
  }
}

void **std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<applesauce::CF::TypeRefPair>::clear[abi:ne180100](void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 16;
    std::allocator<applesauce::CF::TypeRefPair>::destroy[abi:ne180100](v4, i - 16);
  }
}

void *applesauce::CF::TypeRefPair::TypeRefPair<applesauce::CF::StringRef const&,applesauce::CF::TypeRef const&>(void *a1, CFTypeRef *a2, const void **a3)
{
  CFTypeRef v5 = *a2;
  if (*a2) {
    CFRetain(*a2);
  }
  *a1 = v5;
  uint64_t v6 = *a3;
  if (v6) {
    CFRetain(v6);
  }
  a1[1] = v6;
  return a1;
}

void std::vector<void const*>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<ASDT::Exclaves::StatusTracker::Update>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v9 = &v6[8 * v8];
    uint64_t v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void std::vector<applesauce::CF::TypeRefPair>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    int64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 16;
        std::allocator<applesauce::CF::TypeRefPair>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      int64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *std::vector<applesauce::CF::TypeRef>::__init_with_size[abi:ne180100]<applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>,applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>>(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v11 = result;
  char v12 = 0;
  if (a4)
  {
    uint64_t v6 = (uint64_t)result;
    std::vector<void const*>::__vallocate[abi:ne180100](result, a4);
    long long v9 = *(_OWORD *)a2;
    uint64_t v10 = *(void *)(a2 + 16);
    long long v7 = *(_OWORD *)a3;
    uint64_t v8 = *(void *)(a3 + 16);
    return std::vector<applesauce::CF::TypeRef>::__construct_at_end<applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>,applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>>(v6, &v9, &v7);
  }
  return result;
}

void sub_2489CA6DC(_Unwind_Exception *a1)
{
  std::vector<applesauce::CF::TypeRef>::__destroy_vector::operator()[abi:ne180100]((void ***)(v1 - 48));
  _Unwind_Resume(a1);
}

void *std::vector<applesauce::CF::TypeRef>::__construct_at_end<applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>,applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>>(uint64_t a1, long long *a2, long long *a3)
{
  uint64_t v4 = *(void **)(a1 + 8);
  long long v8 = *a2;
  uint64_t v9 = *((void *)a2 + 2);
  long long v6 = *a3;
  uint64_t v7 = *((void *)a3 + 2);
  uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<applesauce::CF::TypeRef>,applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>,applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>,applesauce::CF::TypeRef*>(a1 + 16, &v8, (uint64_t *)&v6, v4);
  *(void *)(a1 + 8) = result;
  return result;
}

void sub_2489CA754(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<applesauce::CF::TypeRef>,applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>,applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>,applesauce::CF::TypeRef*>(uint64_t a1, void *a2, uint64_t *a3, void *a4)
{
  long long v15 = a4;
  long long v14 = a4;
  v12[0] = a1;
  v12[1] = &v14;
  void v12[2] = &v15;
  char v13 = 0;
  long long v6 = a2;
  for (uint64_t i = a3; !applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>::equal(v6, i); uint64_t i = a3)
  {
    long long v8 = v15;
    applesauce::CF::details::at_to<applesauce::CF::TypeRef>((const __CFArray *)*a2, a2[1], &v11);
    *long long v8 = v11;
    ++a2[1];
    ++v15;
    long long v6 = a2;
  }
  char v13 = 1;
  uint64_t v9 = v15;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRef>,applesauce::CF::TypeRef*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v9;
}

void sub_2489CA810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRef>,applesauce::CF::TypeRef*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>::equal(void *a1, uint64_t *a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = *a2;
  if (*a1) {
    BOOL v4 = v2 == a1[2];
  }
  else {
    BOOL v4 = 1;
  }
  if (v4 && (!v3 || a2[1] == a2[2])) {
    return 1;
  }
  if (*a1 == v3) {
    return v2 == a2[1];
  }
  return 0;
}

CFTypeRef applesauce::CF::details::at_to<applesauce::CF::TypeRef>@<X0>(const __CFArray *a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  if (!a1 || CFArrayGetCount(a1) <= a2 || (ValueAtIndex = CFArrayGetValueAtIndex(a1, a2), (uint64_t v7 = ValueAtIndex) == 0))
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::not_found(exception);
  }
  CFTypeRef result = CFRetain(ValueAtIndex);
  *a3 = v7;
  return result;
}

void sub_2489CA8E8()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_2489CA914(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::not_found(applesauce::CF *this)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRef>,applesauce::CF::TypeRef*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRef>,applesauce::CF::TypeRef*>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRef>,applesauce::CF::TypeRef*>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = (CFTypeRef **)a1[1];
  uint64_t v1 = (CFTypeRef **)a1[2];
  uint64_t v3 = *v1;
  BOOL v4 = *v2;
  if (*v1 != *v2)
  {
    uint64_t v5 = *a1;
    do
      std::allocator<applesauce::CF::TypeRef>::destroy[abi:ne180100](v5, --v3);
    while (v3 != v4);
  }
}

void std::allocator<applesauce::CF::TypeRef>::destroy[abi:ne180100](uint64_t a1, CFTypeRef *a2)
{
  if (*a2) {
    CFRelease(*a2);
  }
}

void std::vector<applesauce::CF::TypeRef>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (CFTypeRef *)**a1;
  if (v2)
  {
    BOOL v4 = (CFTypeRef *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
        std::allocator<applesauce::CF::TypeRef>::destroy[abi:ne180100]((uint64_t)(v1 + 2), --v4);
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::vector<applesauce::CF::TypeRef>::__swap_out_circular_buffer(uint64_t *a1, void *a2, void *a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = (uint64_t)(a1 + 2);
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<applesauce::CF::TypeRef>,std::reverse_iterator<applesauce::CF::TypeRef*>,std::reverse_iterator<applesauce::CF::TypeRef*>,std::reverse_iterator<applesauce::CF::TypeRef*>>((uint64_t)(a1 + 2), (uint64_t)a3, a3, *a1, (void *)*a1, v6, v6);
  a2[1] = v8;
  a2[2] = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<applesauce::CF::TypeRef>,applesauce::CF::TypeRef*,applesauce::CF::TypeRef*,applesauce::CF::TypeRef*>(v7, a3, (void *)a1[1], (void *)a2[2]);
  uint64_t v9 = *a1;
  *a1 = a2[1];
  a2[1] = v9;
  uint64_t v10 = (void *)a1[1];
  a1[1] = a2[2];
  a2[2] = v10;
  uint64_t v11 = (void *)a1[2];
  a1[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return v6;
}

CFTypeRef std::allocator<applesauce::CF::TypeRef>::construct[abi:ne180100]<applesauce::CF::TypeRef,applesauce::CF::TypeRef const&>(uint64_t a1, void *a2, CFTypeRef *a3)
{
  CFTypeRef v4 = *a3;
  if (*a3) {
    CFTypeRef result = CFRetain(*a3);
  }
  *a2 = v4;
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<applesauce::CF::TypeRef>,std::reverse_iterator<applesauce::CF::TypeRef*>,std::reverse_iterator<applesauce::CF::TypeRef*>,std::reverse_iterator<applesauce::CF::TypeRef*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  void v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    uint64_t v8 = a7;
    do
    {
      uint64_t v9 = *--a3;
      *(void *)(v8 - 8) = v9;
      v8 -= 8;
      *a3 = 0;
      v7 -= 8;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v8;
    uint64_t v10 = v15;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRef>,std::reverse_iterator<applesauce::CF::TypeRef*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

void *std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<applesauce::CF::TypeRef>,applesauce::CF::TypeRef*,applesauce::CF::TypeRef*,applesauce::CF::TypeRef*>(uint64_t a1, void *a2, void *a3, void *a4)
{
  CFTypeRef v4 = a4;
  uint64_t v9 = a4;
  uint64_t v8 = a4;
  v6[0] = a1;
  v6[1] = &v8;
  v6[2] = &v9;
  if (a2 != a3)
  {
    do
    {
      *v4++ = *a2;
      *a2++ = 0;
    }
    while (a2 != a3);
    uint64_t v9 = v4;
  }
  char v7 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRef>,applesauce::CF::TypeRef*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v6);
  return v4;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRef>,std::reverse_iterator<applesauce::CF::TypeRef*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRef>,std::reverse_iterator<applesauce::CF::TypeRef*>>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRef>,std::reverse_iterator<applesauce::CF::TypeRef*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1 = *(CFTypeRef **)(a1[2] + 8);
  uint64_t v2 = *(CFTypeRef **)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
      std::allocator<applesauce::CF::TypeRef>::destroy[abi:ne180100](v3, v1++);
    while (v1 != v2);
  }
}

void **std::__split_buffer<applesauce::CF::TypeRef>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<applesauce::CF::TypeRef>::clear[abi:ne180100](void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 8;
    std::allocator<applesauce::CF::TypeRef>::destroy[abi:ne180100](v4, (CFTypeRef *)(i - 8));
  }
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<applesauce::CF::TypeRef>(uint64_t **a1)
{
  std::vector<void const*>::vector(__p, a1[1] - *a1);
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if (*a1 != v3)
  {
    uint64_t v4 = __p[0];
    do
    {
      uint64_t v5 = *v2++;
      *v4++ = v5;
    }
    while (v2 != v3);
  }
  CFArrayRef CFArray = applesauce::CF::details::make_CFArrayRef<void const*>((uint64_t)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return CFArray;
}

void sub_2489CADF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<void const*>(uint64_t a1)
{
  CFArrayRef result = CFArrayCreate(0, *(const void ***)a1, (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3, MEMORY[0x263EFFF70]);
  if (!result)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  return result;
}

void sub_2489CAE60()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_2489CAE80(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *std::vector<void const*>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<void const*>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_2489CAEF0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t applesauce::CF::at_or<applesauce::CF::TypeRef,applesauce::CF::StringRef const&>@<X0>(const __CFDictionary *a1@<X0>, const void **a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  applesauce::CF::details::find_at_key_or_optional<applesauce::CF::TypeRef,applesauce::CF::StringRef const&>(a1, a2, (uint64_t)&cf);
  if (v9)
  {
    CFTypeRef v6 = cf;
    if (cf) {
      CFRetain(cf);
    }
    *a4 = v6;
  }
  else
  {
    *a4 = *a3;
    *a3 = 0;
  }
  return std::__optional_destruct_base<applesauce::CF::TypeRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&cf);
}

uint64_t std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::find<applesauce::CF::StringRef>(uint64_t a1, const __CFString **a2)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 8;
  do
  {
    CFComparisonResult v6 = applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>((CFTypeRef *)(v3 + 32), a2);
    char v7 = (uint64_t *)(v3 + 8);
    if (v6 != kCFCompareLessThan)
    {
      char v7 = (uint64_t *)v3;
      uint64_t v5 = v3;
    }
    uint64_t v3 = *v7;
  }
  while (*v7);
  if (v5 == v2
    || applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>((CFTypeRef *)a2, (const __CFString **)(v5 + 32)) == kCFCompareLessThan)
  {
    return v2;
  }
  return v5;
}

uint64_t *std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef const&,applesauce::CF::TypeRef const&>(uint64_t **a1, CFTypeRef *a2, CFTypeRef *a3, const void **a4)
{
  char v7 = (uint64_t **)std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__find_equal<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>((uint64_t)a1, &v13, a2);
  uint64_t v8 = *v7;
  if (!*v7)
  {
    char v9 = v7;
    uint64_t v8 = (uint64_t *)operator new(0x30uLL);
    v11[1] = a1 + 1;
    std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>::pair[abi:ne180100]<true,0>(v8 + 4, a3, a4);
    char v12 = 1;
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__insert_node_at(a1, v13, v9, v8);
    v11[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>>>>::reset[abi:ne180100]((uint64_t)v11, 0);
  }
  return v8;
}

void *std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>::pair[abi:ne180100]<true,0>(void *a1, CFTypeRef *a2, const void **a3)
{
  CFTypeRef v5 = *a2;
  if (*a2) {
    CFRetain(*a2);
  }
  *a1 = v5;
  CFComparisonResult v6 = *a3;
  if (v6) {
    CFRetain(v6);
  }
  a1[1] = v6;
  return a1;
}

uint64_t *std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      uint64_t v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = a2;
    do
    {
      uint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  CFComparisonResult v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      uint64_t v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  CFComparisonResult v6 = (uint64_t **)v3[2];
  char v7 = *v6;
  if (*v6 == v3)
  {
    *CFComparisonResult v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      char v7 = 0;
      CFArrayRef result = (uint64_t *)v2;
    }
    else
    {
      char v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    *uint64_t v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      CFArrayRef result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      uint64_t v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      uint64_t *v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        CFArrayRef result = v7;
      }
      char v7 = *(uint64_t **)(*v7 + 8);
    }
    long long v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      BOOL v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        *char v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        CFMutableDictionaryRef v7[2] = (uint64_t)v15;
        BOOL v16 = v7;
      }
      else
      {
        long long v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      unsigned int v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      *unsigned int v24 = v23;
      goto LABEL_72;
    }
    BOOL v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    BOOL v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      BOOL v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    char v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    CFMutableDictionaryRef v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      CFArrayRef result = v7;
    }
    char v7 = *(uint64_t **)v12;
  }
  uint64_t v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  unint64_t v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    BOOL v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    unint64_t v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    *unint64_t v20 = (uint64_t)v7;
    CFMutableDictionaryRef v7[2] = (uint64_t)v20;
    uint64_t v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  unsigned int v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

uint64_t **std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::__emplace_unique_key_args<void *,void *&,unsigned int &>(uint64_t **a1, unint64_t *a2, void *a3, _DWORD *a4)
{
  int v8 = a1 + 1;
  char v7 = a1[1];
  if (v7)
  {
    unint64_t v9 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v10 = (uint64_t **)v7;
        unint64_t v11 = v7[4];
        if (v9 >= v11) {
          break;
        }
        char v7 = *v10;
        int v8 = v10;
        if (!*v10) {
          goto LABEL_10;
        }
      }
      if (v11 >= v9) {
        break;
      }
      char v7 = v10[1];
      if (!v7)
      {
        int v8 = v10 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v10 = a1 + 1;
LABEL_10:
    uint64_t v12 = operator new(0x30uLL);
    v12[4] = *a3;
    *((_DWORD *)v12 + 10) = *a4;
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__insert_node_at(a1, (uint64_t)v10, v8, v12);
    return (uint64_t **)v12;
  }
  return v10;
}

void OUTLINED_FUNCTION_0_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2489CB9C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489CBAA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489CBBF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489CBCD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489CBD68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_2489CDDF8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2489CE534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489CE634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489CE854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  _Unwind_Resume(a1);
}

void sub_2489CEAA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489CEAF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489CECC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489CEDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v17 - 40));

  _Unwind_Resume(a1);
}

void sub_2489CEF34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489CEFC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *CAStringForOSType(unsigned int a1, char *__str, int64_t __size)
{
  if (__size)
  {
    BOOL v5 = 0;
    uint64_t v6 = 0;
    char v7 = &__str[__size];
    unsigned int v13 = bswap32(a1);
    uint64_t v8 = MEMORY[0x263EF8318];
    do
    {
      uint64_t v9 = *((unsigned __int8 *)&v13 + v6);
      if (*((char *)&v13 + v6) < 0)
      {
        if (!__maskrune(v9, 0x40000uLL)) {
          goto LABEL_11;
        }
      }
      else if ((*(_DWORD *)(v8 + 4 * v9 + 60) & 0x40000) == 0)
      {
        goto LABEL_11;
      }
      if (*((unsigned char *)&v13 + v6) == 92)
      {
LABEL_11:
        uint64_t v10 = &__str[snprintf(__str, __size, "0x")];
        goto LABEL_12;
      }
      BOOL v5 = v6++ > 2;
    }
    while (v6 != 4);
    if (__size < 1)
    {
      uint64_t v10 = __str;
    }
    else
    {
      *__str = 39;
      uint64_t v10 = __str + 1;
    }
LABEL_12:
    if (v10 < v7)
    {
      uint64_t v11 = 0;
      do
      {
        if (v5) {
          *v10++ = *((unsigned char *)&v13 + v11);
        }
        else {
          v10 += snprintf(v10, v7 - v10, "%02X", *((unsigned __int8 *)&v13 + v11));
        }
        if (v11 > 2) {
          break;
        }
        ++v11;
      }
      while (v10 < v7);
      if (v5 && v10 < v7) {
        *v10++ = 39;
      }
    }
    v10[-(v10 >= v7)] = 0;
  }
  return __str;
}

void CAStreamBasicDescription::CAStreamBasicDescription(CAStreamBasicDescription *this)
{
  *((void *)this + 4) = 0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
}

{
  *((void *)this + 4) = 0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
}

void CAStreamBasicDescription::CAStreamBasicDescription(CAStreamBasicDescription *this, const AudioStreamBasicDescription *a2)
{
  long long v2 = *(_OWORD *)&a2->mSampleRate;
  long long v3 = *(_OWORD *)&a2->mBytesPerPacket;
  *((void *)this + 4) = *(void *)&a2->mBitsPerChannel;
  *(_OWORD *)this = v2;
  *((_OWORD *)this + 1) = v3;
}

{
  long long v2;
  long long v3;

  long long v2 = *(_OWORD *)&a2->mSampleRate;
  long long v3 = *(_OWORD *)&a2->mBytesPerPacket;
  *((void *)this + 4) = *(void *)&a2->mBitsPerChannel;
  *(_OWORD *)this = v2;
  *((_OWORD *)this + 1) = v3;
}

void CAStreamBasicDescription::CAStreamBasicDescription(CAStreamBasicDescription *this, double a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9)
{
  *(double *)this = a2;
  *((_DWORD *)this + 4) = a4;
  *((_DWORD *)this + 5) = a5;
  *((_DWORD *)this + 6) = a6;
  *((_DWORD *)this + 7) = a7;
  *((_DWORD *)this + 2) = a3;
  *((_DWORD *)this + 3) = a9;
  *((_DWORD *)this + 8) = a8;
  *((_DWORD *)this + 9) = 0;
}

{
  *(double *)this = a2;
  *((_DWORD *)this + 4) = a4;
  *((_DWORD *)this + 5) = a5;
  *((_DWORD *)this + 6) = a6;
  *((_DWORD *)this + 7) = a7;
  *((_DWORD *)this + 2) = a3;
  *((_DWORD *)this + 3) = a9;
  *((_DWORD *)this + 8) = a8;
  *((_DWORD *)this + 9) = 0;
}

char *CAStreamBasicDescription::AsString(CAStreamBasicDescription *this, char *a2, int a3, char a4)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  CAStringForOSType(*((_DWORD *)this + 2), v44, 24);
  if (a4)
  {
    *(_DWORD *)__str = 0;
    v42[0] = 0;
    if (CAStreamBasicDescription::IdentifyCommonPCMFormat(this, __str, (BOOL *)v42)
      && *(_DWORD *)__str
      && *(_DWORD *)__str <= 5u)
    {
      if (v42[0]) {
        uint64_t v8 = ", inter";
      }
      else {
        uint64_t v8 = ", non-inter";
      }
      if (*((_DWORD *)this + 7) <= 1u) {
        uint64_t v8 = "";
      }
      size_t v9 = a3;
      __int16 v35 = *(const char **)this;
      unsigned int v34 = (char *)*((unsigned int *)this + 7);
      int v36 = off_265243E20[*(_DWORD *)__str - 1];
      __int16 v37 = v8;
      uint64_t v10 = "%2d ch, %6.0f Hz, %s%s";
      goto LABEL_29;
    }
    int v23 = *((_DWORD *)this + 2);
    if (v23 == 1718773105)
    {
      size_t v9 = a3;
      __int16 v35 = *(const char **)this;
      unsigned int v34 = (char *)*((unsigned int *)this + 7);
      uint64_t v10 = "%2d ch, %6.0f Hz, 'freq'";
LABEL_29:
      unsigned int v24 = a2;
LABEL_90:
      snprintf(v24, v9, v10, v34, v35, v36, v37, v38, v39, v40, v41);
      return a2;
    }
    int v11 = *((_DWORD *)this + 7);
    if (!v11 && !v23 && *(double *)this == 0.0)
    {
      size_t v9 = a3;
      __int16 v35 = *(const char **)this;
      unsigned int v34 = 0;
      uint64_t v10 = "%2d ch, %6.0f Hz";
      goto LABEL_29;
    }
  }
  else
  {
    int v11 = *((_DWORD *)this + 7);
  }
  int v12 = snprintf(a2, a3, "%2d ch, %6.0f Hz, %s (0x%08X) ", v11, *(double *)this, v44, *((_DWORD *)this + 3));
  size_t v13 = (a3 - v12);
  if ((int)v13 >= 1)
  {
    uint64_t v14 = &a2[v12];
    int v15 = *((_DWORD *)this + 2);
    if (v15 != 1634492771 && v15 != 1718378851)
    {
      if (v15 != 1819304813)
      {
        int v36 = (char *)*((unsigned int *)this + 5);
        __int16 v37 = (const char *)*((unsigned int *)this + 6);
        unsigned int v34 = (char *)*((unsigned int *)this + 8);
        __int16 v35 = (const char *)*((unsigned int *)this + 4);
        uint64_t v10 = "%d bits/channel, %d bytes/packet, %d frames/packet, %d bytes/frame";
LABEL_89:
        unsigned int v24 = v14;
        size_t v9 = v13;
        goto LABEL_90;
      }
      unsigned int v16 = *((_DWORD *)this + 3);
      unsigned int v17 = *((_DWORD *)this + 6);
      uint64_t v18 = "";
      if (!v17) {
        goto LABEL_19;
      }
      if ((v16 & 0x20) != 0)
      {
        unsigned int v19 = 1;
      }
      else
      {
        unsigned int v19 = *((_DWORD *)this + 7);
        if (!v19)
        {
LABEL_19:
          unint64_t v20 = " signed";
          if ((v16 & 4) == 0) {
            unint64_t v20 = " unsigned";
          }
          if (v16) {
            BOOL v21 = "float";
          }
          else {
            BOOL v21 = "integer";
          }
          if (v16) {
            uint64_t v22 = "";
          }
          else {
            uint64_t v22 = v20;
          }
LABEL_66:
          __str[0] = 0;
          if ((v16 & 0x20) != 0) {
            __int16 v31 = ", deinterleaved";
          }
          else {
            __int16 v31 = "";
          }
          int v28 = "";
          int v32 = "";
          goto LABEL_70;
        }
      }
      int v27 = v17 / v19;
      if ((int)(v17 / v19) < 2)
      {
        int v30 = " signed";
        if ((v16 & 4) == 0) {
          int v30 = " unsigned";
        }
        if (v16) {
          BOOL v21 = "float";
        }
        else {
          BOOL v21 = "integer";
        }
        if (v16) {
          uint64_t v22 = "";
        }
        else {
          uint64_t v22 = v30;
        }
        if (v27 != 1) {
          goto LABEL_66;
        }
        int v28 = "";
      }
      else
      {
        if ((v16 & 2) != 0) {
          int v28 = " big-endian";
        }
        else {
          int v28 = " little-endian";
        }
        __int16 v29 = " unsigned";
        if ((v16 & 4) != 0) {
          __int16 v29 = " signed";
        }
        if (v16) {
          BOOL v21 = "float";
        }
        else {
          BOOL v21 = "integer";
        }
        if (v16) {
          uint64_t v22 = "";
        }
        else {
          uint64_t v22 = v29;
        }
      }
      if (CAStreamBasicDescription::PackednessIsSignificant(this))
      {
        if ((*((unsigned char *)this + 12) & 8) != 0) {
          snprintf(__str, 0x20uLL, "packed in %d bytes");
        }
        else {
          snprintf(__str, 0x20uLL, "unpacked in %d bytes");
        }
      }
      else
      {
        __str[0] = 0;
      }
      if (CAStreamBasicDescription::PackednessIsSignificant(this) || (*((unsigned char *)this + 32) & 7) != 0)
      {
        unsigned int v16 = *((_DWORD *)this + 3);
        if ((v16 & 0x10) != 0) {
          int v32 = " high-aligned";
        }
        else {
          int v32 = " low-aligned";
        }
      }
      else
      {
        unsigned int v16 = *((_DWORD *)this + 3);
        int v32 = "";
      }
      if ((v16 & 0x20) != 0) {
        __int16 v31 = ", deinterleaved";
      }
      else {
        __int16 v31 = "";
      }
      if (__str[0])
      {
        uint64_t v18 = ", ";
LABEL_85:
        if (((v16 >> 7) & 0x3F) != 0) {
          snprintf(v42, 0x14uLL, "%d.%d");
        }
        else {
          snprintf(v42, 0x14uLL, "%d");
        }
        int v40 = v32;
        uint64_t v41 = v31;
        int v38 = v18;
        __int16 v39 = __str;
        int v36 = (char *)v22;
        __int16 v37 = v21;
        uint64_t v10 = "%s-bit%s%s %s%s%s%s%s";
        unsigned int v34 = v42;
        __int16 v35 = v28;
        goto LABEL_89;
      }
LABEL_70:
      if (*v32) {
        uint64_t v18 = ", ";
      }
      goto LABEL_85;
    }
    if ((*((_DWORD *)this + 3) - 1) > 3) {
      int v25 = snprintf(&a2[v12], v13, "from UNKNOWN source bit depth, ");
    }
    else {
      int v25 = snprintf(&a2[v12], v13, "from %d-bit source, ");
    }
    size_t v26 = (v13 - v25);
    if ((int)v26 >= 1) {
      snprintf(&v14[v25], v26, "%d frames/packet");
    }
  }
  return a2;
}

uint64_t CAStreamBasicDescription::IdentifyCommonPCMFormat(_DWORD *a1, _DWORD *a2, BOOL *a3)
{
  uint64_t result = 0;
  *a2 = 0;
  if (a1[2] != 1819304813) {
    return result;
  }
  if (a1[5] != 1) {
    return 0;
  }
  unsigned int v5 = a1[6];
  if (v5 != a1[4]) {
    return 0;
  }
  unsigned int v6 = a1[8];
  if (v5 < v6 >> 3) {
    return 0;
  }
  unsigned int v7 = a1[7];
  if (!v7) {
    return 0;
  }
  unsigned int v8 = a1[3];
  if (a3) {
    *a3 = (v8 & 0x20) == 0;
  }
  if ((v8 & 0x20) == 0)
  {
    if (v5 % v7) {
      return 0;
    }
    v5 /= v7;
  }
  uint64_t result = 1;
  if ((v8 & 2) != 0 || 8 * v5 != v6) {
    return result;
  }
  if (v8)
  {
    if ((v8 & 0x1F84) == 0)
    {
      if (v5 != 4)
      {
        if (v5 != 8) {
          return result;
        }
        LODWORD(result) = 4;
      }
      goto LABEL_29;
    }
    return 0;
  }
  if ((v8 & 4) == 0) {
    return result;
  }
  int v9 = (v8 >> 7) & 0x3F;
  if (v9 == 24 && v5 == 4)
  {
    LODWORD(result) = 3;
LABEL_29:
    *a2 = result;
    return 1;
  }
  if (!v9 && v5 == 4)
  {
    LODWORD(result) = 5;
    goto LABEL_29;
  }
  if (!v9 && v5 == 2)
  {
    LODWORD(result) = 2;
    goto LABEL_29;
  }
  return result;
}

BOOL CAStreamBasicDescription::PackednessIsSignificant(CAStreamBasicDescription *this)
{
  if (*((_DWORD *)this + 2) != 1819304813 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    CAStreamBasicDescription::PackednessIsSignificant();
  }
  unsigned int v2 = *((_DWORD *)this + 6);
  if (v2)
  {
    if ((*((unsigned char *)this + 12) & 0x20) != 0)
    {
      unsigned int v3 = 1;
    }
    else
    {
      unsigned int v3 = *((_DWORD *)this + 7);
      if (!v3)
      {
        unsigned int v2 = 0;
        return v2 != *((_DWORD *)this + 8);
      }
    }
    unsigned int v2 = 8 * (v2 / v3);
  }
  return v2 != *((_DWORD *)this + 8);
}

_DWORD *CAStreamBasicDescription::NormalizeLinearPCMFormat(_DWORD *this, AudioStreamBasicDescription *a2)
{
  if (this[2] == 1819304813 && (this[3] & 0x40) == 0)
  {
    int v2 = 2 * this[7];
    this[3] = 12;
    this[4] = v2;
    this[5] = 1;
    this[6] = v2;
    this[8] = 16;
  }
  return this;
}

uint64_t CAStreamBasicDescription::NormalizeLinearPCMFormat(uint64_t this, _DWORD *a2, AudioStreamBasicDescription *a3)
{
  if (a2[2] == 1819304813 && (a2[3] & 0x40) == 0)
  {
    if (this) {
      int v3 = 9;
    }
    else {
      int v3 = 11;
    }
    int v4 = 2 * a2[7];
    a2[3] = v3;
    a2[4] = v4;
    a2[5] = 1;
    a2[6] = v4;
    a2[8] = 16;
  }
  return this;
}

_DWORD *CAStreamBasicDescription::VirtualizeLinearPCMFormat(_DWORD *this, AudioStreamBasicDescription *a2)
{
  if (this[2] == 1819304813 && (this[3] & 0x40) == 0)
  {
    int v2 = 4 * this[7];
    this[3] = 9;
    this[4] = v2;
    this[5] = 1;
    this[6] = v2;
    this[8] = 32;
  }
  return this;
}

uint64_t CAStreamBasicDescription::VirtualizeLinearPCMFormat(uint64_t this, _DWORD *a2, AudioStreamBasicDescription *a3)
{
  if (a2[2] == 1819304813 && (a2[3] & 0x40) == 0)
  {
    if (this) {
      int v3 = 9;
    }
    else {
      int v3 = 11;
    }
    int v4 = 4 * a2[7];
    a2[3] = v3;
    a2[4] = v4;
    a2[5] = 1;
    a2[6] = v4;
    a2[8] = 32;
  }
  return this;
}

double CAStreamBasicDescription::ResetFormat(CAStreamBasicDescription *this, AudioStreamBasicDescription *a2)
{
  *((_DWORD *)this + 8) = 0;
  double result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  return result;
}

uint64_t CAStreamBasicDescription::FillOutFormat(uint64_t this, AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3)
{
  if (*(double *)this == 0.0) {
    *(Float64 *)this = a2->mSampleRate;
  }
  if (!*(_DWORD *)(this + 8)) {
    *(_DWORD *)(this + 8) = a2->mFormatID;
  }
  if (!*(_DWORD *)(this + 12)) {
    *(_DWORD *)(this + 12) = a2->mFormatFlags;
  }
  if (!*(_DWORD *)(this + 16)) {
    *(_DWORD *)(this + 16) = a2->mBytesPerPacket;
  }
  if (!*(_DWORD *)(this + 20)) {
    *(_DWORD *)(this + 20) = a2->mFramesPerPacket;
  }
  if (!*(_DWORD *)(this + 24)) {
    *(_DWORD *)(this + 24) = a2->mBytesPerFrame;
  }
  if (!*(_DWORD *)(this + 28)) {
    *(_DWORD *)(this + 28) = a2->mChannelsPerFrame;
  }
  if (!*(_DWORD *)(this + 32)) {
    *(_DWORD *)(this + 32) = a2->mBitsPerChannel;
  }
  return this;
}

uint64_t CAStreamBasicDescription::GetSimpleName(uint64_t this, AudioStreamBasicDescription *__str, size_t __size, int a4, int a5)
{
  unsigned int v6 = __size;
  unsigned int v7 = __str;
  unsigned int v8 = (double *)this;
  if (a5)
  {
    this = snprintf((char *)__str, __size, "%.0f ", *(double *)this);
    unsigned int v7 = (AudioStreamBasicDescription *)((char *)v7 + (int)this);
    v6 -= this;
  }
  int v9 = *((_DWORD *)v8 + 2);
  if (v9 == 1633889587)
  {
    strcpy((char *)v7, "AC-3");
    return this;
  }
  if (v9 == 1667326771)
  {
    strcpy((char *)v7, "AC-3 fo");
    return this;
  }
  if (v9 != 1819304813)
  {
    LOBYTE(v7->mSampleRate) = HIBYTE(v9);
    BYTE1(v7->mSampleRate) = *((unsigned char *)v8 + 10);
    BYTE2(v7->mSampleRate) = *((unsigned char *)v8 + 9);
    *(_WORD *)((char *)&v7->mSampleRate + 3) = *((unsigned __int8 *)v8 + 8);
    return this;
  }
  int v10 = *((_DWORD *)v8 + 3);
  if (v10)
  {
    int v11 = "Floating Point";
    int v12 = "Float";
  }
  else if ((v10 & 4) != 0)
  {
    int v11 = "Signed Integer";
    int v12 = "SInt";
  }
  else
  {
    int v11 = "Unsigned Integer";
    int v12 = "UInt";
  }
  if (a4) {
    size_t v13 = v12;
  }
  else {
    size_t v13 = v11;
  }
  if ((v10 & 0x10) != 0) {
    uint64_t v14 = "High";
  }
  else {
    uint64_t v14 = "Low";
  }
  if ((v10 & 0x40) != 0) {
    int v15 = "Unmixable";
  }
  else {
    int v15 = "Mixable";
  }
  uint64_t v16 = *((unsigned int *)v8 + 7);
  if (a4)
  {
    if ((v10 & 2) != 0)
    {
      if ((v10 & 8) != 0) {
        return snprintf((char *)v7, v6, "%s %d Ch %s %s%d");
      }
      else {
        return snprintf((char *)v7, v6, "%s %d Ch %s %s %s%d/%s%d", v15, v16, "Big Endian");
      }
    }
    else
    {
      if ((v10 & 8) == 0)
      {
        uint64_t v17 = 8 * (*((_DWORD *)v8 + 6) / v16);
        int v23 = (const char *)*((unsigned int *)v8 + 8);
        unsigned int v24 = v13;
        BOOL v21 = v14;
        uint64_t v22 = v13;
        unsigned int v19 = v15;
        uint64_t v20 = *((unsigned int *)v8 + 7);
        uint64_t v18 = "%s %d Ch %s %s%d/%s%d";
        return snprintf((char *)v7, v6, v18, v19, v20, v21, v22, v23, v24, v17);
      }
      return snprintf((char *)v7, v6, "%s %d Ch %s%d");
    }
  }
  else if ((v10 & 2) != 0)
  {
    if ((v10 & 8) == 0)
    {
      uint64_t v17 = 8 * (*((_DWORD *)v8 + 6) / v16);
      int v23 = v13;
      unsigned int v24 = v14;
      BOOL v21 = (const char *)*((unsigned int *)v8 + 8);
      uint64_t v22 = "Big Endian";
      unsigned int v19 = v15;
      uint64_t v20 = *((unsigned int *)v8 + 7);
      uint64_t v18 = "%s %d Channel %d Bit %s %s Aligned %s in %d Bits";
      return snprintf((char *)v7, v6, v18, v19, v20, v21, v22, v23, v24, v17);
    }
    return snprintf((char *)v7, v6, "%s %d Channel %d Bit %s %s");
  }
  else if ((v10 & 8) != 0)
  {
    return snprintf((char *)v7, v6, "%s %d Channel %d Bit %s");
  }
  else
  {
    return snprintf((char *)v7, v6, "%s %d Channel %d Bit %s Aligned %s in %d Bits", v15);
  }
}

uint64_t CAStreamBasicDescription::GetRegularizedFormatFlags(CAStreamBasicDescription *this, int a2)
{
  uint64_t result = *((unsigned int *)this + 3);
  if (*((_DWORD *)this + 2) == 1819304813)
  {
    unsigned int v4 = result & 0x7FFFFFFF;
    if ((result & 0x7FFFFFFF) == 0) {
      unsigned int v4 = result;
    }
    if (a2) {
      unsigned int v5 = v4;
    }
    else {
      unsigned int v5 = v4 & 0xFFFFFFBF;
    }
    if (!CAStreamBasicDescription::PackednessIsSignificant(this)) {
      v5 |= 8u;
    }
    BOOL IsSignificant = CAStreamBasicDescription::PackednessIsSignificant(this);
    unsigned int v7 = *((_DWORD *)this + 8);
    if (!IsSignificant && (v7 & 7) == 0) {
      v5 &= ~0x10u;
    }
    unsigned int v8 = v5 & 0xFFFFFFFB;
    if ((v5 & 1) == 0) {
      unsigned int v8 = v5;
    }
    BOOL v9 = (v8 & 8) == 0 || v7 > 8;
    unsigned int v10 = v8 & 2;
    if (v9) {
      unsigned int v10 = v8;
    }
    if (*((_DWORD *)this + 7) == 1) {
      v10 &= ~0x20u;
    }
    if (v10) {
      return v10;
    }
    else {
      return 0x80000000;
    }
  }
  return result;
}

BOOL CAStreamBasicDescription::EquivalentFormatFlags(CAStreamBasicDescription *this, AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3, int a4)
{
  int v4 = (int)a3;
  if (a4)
  {
    int32x4_t v6 = *(int32x4_t *)&a2->mFormatID;
    v6.i64[1] = *((void *)this + 1);
    if (vmaxv_u16((uint16x4_t)vmovn_s32(vceqzq_s32(v6)))) {
      return 1;
    }
  }
  if (*((_DWORD *)this + 2) == 1819304813)
  {
    int RegularizedFormatFlags = CAStreamBasicDescription::GetRegularizedFormatFlags(this, (int)a3);
    return RegularizedFormatFlags == CAStreamBasicDescription::GetRegularizedFormatFlags((CAStreamBasicDescription *)a2, v4);
  }
  else
  {
    return *((_DWORD *)this + 3) == a2->mFormatFlags;
  }
}

BOOL CAStreamBasicDescription::IsExactlyEqual(CAStreamBasicDescription *this, const AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3)
{
  return memcmp(this, a2, 0x24uLL) == 0;
}

BOOL CAStreamBasicDescription::IsEquivalent(CAStreamBasicDescription *this, AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3)
{
  double v3 = *(double *)this;
  if (a3)
  {
    if (v3 != 0.0 && a2->mSampleRate != 0.0 && v3 != a2->mSampleRate) {
      return 0;
    }
    int v5 = *((_DWORD *)this + 2);
    if (v5)
    {
      AudioFormatID mFormatID = a2->mFormatID;
      if (mFormatID)
      {
        if (v5 != mFormatID) {
          return 0;
        }
      }
    }
    int v7 = *((_DWORD *)this + 4);
    if (v7)
    {
      UInt32 mBytesPerPacket = a2->mBytesPerPacket;
      if (mBytesPerPacket)
      {
        if (v7 != mBytesPerPacket) {
          return 0;
        }
      }
    }
    int v9 = *((_DWORD *)this + 5);
    if (v9)
    {
      UInt32 mFramesPerPacket = a2->mFramesPerPacket;
      if (mFramesPerPacket)
      {
        if (v9 != mFramesPerPacket) {
          return 0;
        }
      }
    }
    int v11 = *((_DWORD *)this + 6);
    if (v11)
    {
      UInt32 mBytesPerFrame = a2->mBytesPerFrame;
      if (mBytesPerFrame)
      {
        if (v11 != mBytesPerFrame) {
          return 0;
        }
      }
    }
    int v13 = *((_DWORD *)this + 7);
    if (v13)
    {
      UInt32 mChannelsPerFrame = a2->mChannelsPerFrame;
      if (mChannelsPerFrame)
      {
        if (v13 != mChannelsPerFrame) {
          return 0;
        }
      }
    }
    int v15 = *((_DWORD *)this + 8);
    if (!v15) {
      return CAStreamBasicDescription::EquivalentFormatFlags(this, a2, (const AudioStreamBasicDescription *)((a3 >> 1) & 1), a3 & 1);
    }
    UInt32 mBitsPerChannel = a2->mBitsPerChannel;
    if (!mBitsPerChannel) {
      return CAStreamBasicDescription::EquivalentFormatFlags(this, a2, (const AudioStreamBasicDescription *)((a3 >> 1) & 1), a3 & 1);
    }
  }
  else
  {
    if (v3 != a2->mSampleRate
      || *((_DWORD *)this + 2) != a2->mFormatID
      || *((_DWORD *)this + 4) != a2->mBytesPerPacket
      || *((_DWORD *)this + 5) != a2->mFramesPerPacket
      || *((_DWORD *)this + 7) != a2->mChannelsPerFrame)
    {
      return 0;
    }
    int v15 = *((_DWORD *)this + 8);
    UInt32 mBitsPerChannel = a2->mBitsPerChannel;
  }
  if (v15 != mBitsPerChannel) {
    return 0;
  }
  return CAStreamBasicDescription::EquivalentFormatFlags(this, a2, (const AudioStreamBasicDescription *)((a3 >> 1) & 1), a3 & 1);
}

BOOL CAStreamBasicDescription::IsEqual(CAStreamBasicDescription *this, AudioStreamBasicDescription *a2, int a3)
{
  if (!a3) {
    return memcmp(this, a2, 0x24uLL) == 0;
  }
  return CAStreamBasicDescription::IsEquivalent(this, a2, (const AudioStreamBasicDescription *)3);
}

BOOL CAStreamBasicDescription::IsEqual(CAStreamBasicDescription *this, AudioStreamBasicDescription *a2)
{
  return CAStreamBasicDescription::IsEquivalent(this, a2, (const AudioStreamBasicDescription *)3);
}

BOOL SanityCheck(const AudioStreamBasicDescription *a1)
{
  BOOL result = 0;
  if (a1->mSampleRate >= 0.0 && a1->mSampleRate < 3000000.0)
  {
    UInt32 mBytesPerPacket = a1->mBytesPerPacket;
    if (mBytesPerPacket >= 0xF4240) {
      return 0;
    }
    UInt32 mFramesPerPacket = a1->mFramesPerPacket;
    if (mFramesPerPacket >= 0xF4240) {
      return 0;
    }
    UInt32 mBytesPerFrame = a1->mBytesPerFrame;
    if (mBytesPerFrame >= 0xF4240) {
      return 0;
    }
    BOOL result = 0;
    if (a1->mChannelsPerFrame - 1 > 0x3FF || a1->mBitsPerChannel > 0x400) {
      return result;
    }
    AudioFormatID mFormatID = a1->mFormatID;
    if (!mFormatID) {
      return 0;
    }
    BOOL v8 = mFramesPerPacket == 1 && mBytesPerPacket == mBytesPerFrame;
    return mFormatID != 1819304813 || v8;
  }
  return result;
}

uint64_t CAStreamBasicDescription::FromText(CAStreamBasicDescription *this, char *a2, AudioStreamBasicDescription *a3)
{
  if (*(unsigned char *)this == 45) {
    int v5 = (CAStreamBasicDescription *)((char *)this + 1);
  }
  else {
    int v5 = this;
  }
  int v6 = *(unsigned __int8 *)v5;
  if (v6 == 76)
  {
    uint64_t v7 = 2 * (*((unsigned char *)v5 + 1) == 69);
    int i = 12;
  }
  else
  {
    if (v6 != 66)
    {
      int i = 12;
      goto LABEL_12;
    }
    uint64_t v7 = 2 * (*((unsigned char *)v5 + 1) == 69);
    if (*((unsigned char *)v5 + 1) == 69) {
      int i = 14;
    }
    else {
      int i = 12;
    }
  }
  int v5 = (CAStreamBasicDescription *)((char *)v5 + v7);
  int v6 = *(unsigned __int8 *)v5;
LABEL_12:
  int v9 = (FILE **)MEMORY[0x263EF8348];
  switch(v6)
  {
    case 'U':
      i &= 0xAu;
      int v10 = *((unsigned __int8 *)v5 + 1);
      int v5 = (CAStreamBasicDescription *)((char *)v5 + 1);
      int v6 = v10;
      break;
    case 'F':
      int i = i & 0xFFFFFFFA | 1;
      goto LABEL_17;
    case 'I':
LABEL_17:
      int v11 = (CAStreamBasicDescription *)((char *)v5 + 1);
      if (*((char *)v5 + 1) < 0)
      {
        int v13 = 0;
      }
      else
      {
        int v12 = *((unsigned __int8 *)v5 + 1);
        if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * *((unsigned __int8 *)v5 + 1) + 60) & 0x400) != 0)
        {
          int v13 = 0;
          int v11 = (CAStreamBasicDescription *)((char *)v5 + 2);
          while (1)
          {
            int v13 = v12 + 10 * v13 - 48;
            if (*(char *)v11 < 0) {
              break;
            }
            uint64_t v18 = *(unsigned __int8 *)v11;
            int v12 = *(unsigned __int8 *)v11;
            int v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
            if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v18 + 60) & 0x400) == 0)
            {
              int v5 = (CAStreamBasicDescription *)((char *)v11 - 2);
              int v11 = (CAStreamBasicDescription *)((char *)v11 - 1);
              goto LABEL_33;
            }
          }
        }
        else
        {
          int v13 = 0;
LABEL_33:
          if (v12 == 46)
          {
            int v21 = *((char *)v5 + 2);
            unsigned int v19 = (CAStreamBasicDescription *)((char *)v5 + 2);
            unsigned __int8 v20 = v21;
            if (v21 < 0 || (uint64_t v22 = v20, (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v20 + 60) & 0x400) == 0))
            {
              int v23 = (FILE *)*MEMORY[0x263EF8348];
              unsigned int v24 = "Expected fractional bits following '.'\n";
              size_t v25 = 39;
LABEL_37:
              fwrite(v24, v25, 1uLL, v23);
              goto LABEL_101;
            }
            int v29 = 0;
            int v11 = v19;
            do
            {
              if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v22 + 60) & 0x400) == 0) {
                break;
              }
              int v30 = *((char *)v11 + 1);
              int v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
              int v29 = 10 * v29 + v22 - 48;
              uint64_t v22 = v30;
            }
            while ((v30 & 0x80000000) == 0);
            v13 += v29;
            i |= v29 << 7;
          }
        }
      }
      unsigned int v28 = 1819304813;
      unsigned int v26 = (v13 + 7) >> 3;
      if ((v13 & 7) != 0) {
        int i = i & 0xFFFFFFE7 | 0x10;
      }
      int v27 = 1;
      goto LABEL_50;
  }
  uint64_t v14 = 0;
  int __c = 538976288;
  int v15 = this;
  int v11 = this;
  while (1)
  {
    int v17 = *(unsigned __int8 *)v11;
    int v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
    int v16 = v17;
    if (v17 == 92)
    {
      if (*(unsigned char *)v11 != 120) {
        return 0;
      }
      int v51 = 0;
      if (sscanf((const char *)v15 + 2, "%02X", &v51) != 1) {
        return 0;
      }
      *((unsigned char *)&__c + v14) = v51;
      int v11 = (CAStreamBasicDescription *)((char *)v15 + 4);
      goto LABEL_26;
    }
    *((unsigned char *)&__c + v14) = v16;
    if (!v16) {
      break;
    }
LABEL_26:
    ++v14;
    int v15 = v11;
    if (v14 == 4) {
      goto LABEL_40;
    }
  }
  if (v14 != 3) {
    return 0;
  }
  HIBYTE(__c) = 32;
  int v11 = v15;
LABEL_40:
  if (memchr("-@/#", SHIBYTE(__c), 5uLL))
  {
    HIBYTE(__c) = 32;
    int v11 = (CAStreamBasicDescription *)((char *)v11 - 1);
  }
  int i = 0;
  unsigned int v26 = 0;
  int v27 = 0;
  int v13 = 0;
  unsigned int v28 = bswap32(__c);
LABEL_50:
  int v31 = *(unsigned __int8 *)v11;
  if (v31 != 64)
  {
    double v33 = 0.0;
    goto LABEL_57;
  }
  int v32 = *((char *)v11 + 1);
  int v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
  LOBYTE(v31) = v32;
  if (v32 < 0) {
    goto LABEL_100;
  }
  double v33 = 0.0;
  while ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v31 + 60) & 0x400) != 0)
  {
    double v33 = (double)(v31 - 48) + v33 * 10.0;
    int v34 = *((char *)v11 + 1);
    int v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
    LOBYTE(v31) = v34;
    if (v34 < 0) {
      goto LABEL_100;
    }
  }
LABEL_57:
  if (v31 == 47)
  {
    for (int i = 0; ; int i = (v36 + v35) | (16 * i))
    {
      int v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
      int v35 = *(char *)v11;
      if ((v35 - 48) >= 0xA)
      {
        int v31 = *(unsigned __int8 *)v11;
        if ((v31 - 65) >= 6)
        {
          if ((v31 - 97) > 5) {
            break;
          }
          int v36 = -87;
        }
        else
        {
          int v36 = -55;
        }
      }
      else
      {
        int v36 = -48;
      }
    }
  }
  if (v31 != 35)
  {
    unsigned __int8 v37 = v31;
    int v39 = v27;
    goto LABEL_73;
  }
  int v38 = *((char *)v11 + 1);
  int v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
  unsigned __int8 v37 = v38;
  if (v38 < 0) {
    goto LABEL_100;
  }
  int v39 = v27;
  while ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v37 + 60) & 0x400) != 0)
  {
    int v39 = 10 * v39 + v37 - 48;
    int v40 = *((char *)v11 + 1);
    int v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
    unsigned __int8 v37 = v40;
    if (v40 < 0) {
      goto LABEL_100;
    }
  }
LABEL_73:
  if (v37 != 58)
  {
LABEL_82:
    if (v37 != 44) {
      goto LABEL_99;
    }
    int v44 = (char *)v11 + 1;
    int v45 = *((unsigned __int8 *)v11 + 1);
    if ((*((char *)v11 + 1) & 0x80000000) == 0
      && (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * *((unsigned __int8 *)v11 + 1) + 60) & 0x400) != 0)
    {
      int v27 = 0;
      int v46 = (char *)v11 + 2;
      do
      {
        int v44 = v46;
        int v27 = v45 + 10 * v27 - 48;
        int v47 = *v46;
        int v45 = v47;
        if (v47 < 0) {
          break;
        }
        int v48 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v47 + 60);
        int v46 = v44 + 1;
      }
      while ((v48 & 0x400) != 0);
      int v11 = (CAStreamBasicDescription *)(v44 - 1);
    }
    else
    {
      int v27 = 0;
    }
    if (v45 == 73)
    {
      int v44 = (char *)v11 + 2;
    }
    else if (v45 == 68)
    {
      if (v28 != 1819304813)
      {
        int v23 = *v9;
        unsigned int v24 = "non-interleaved flag invalid for non-PCM formats\n";
        size_t v25 = 49;
        goto LABEL_37;
      }
      int v11 = (CAStreamBasicDescription *)((char *)v11 + 2);
      i |= 0x20u;
LABEL_99:
      if (*(unsigned char *)v11) {
        goto LABEL_100;
      }
      *(double *)a2 = v33;
      *((_DWORD *)a2 + 2) = v28;
      *((_DWORD *)a2 + 3) = i;
      *((_DWORD *)a2 + 4) = v26;
      *((_DWORD *)a2 + 5) = v39;
      *((_DWORD *)a2 + 6) = v26;
      *((_DWORD *)a2 + 7) = v27;
      uint64_t result = 1;
      *((_DWORD *)a2 + 8) = v13;
      *((_DWORD *)a2 + 9) = 0;
      return result;
    }
    if (v28 == 1819304813) {
      int v49 = v27;
    }
    else {
      int v49 = 1;
    }
    v26 *= v49;
    int v11 = (CAStreamBasicDescription *)v44;
    goto LABEL_99;
  }
  i &= 0xFFFFFFE7;
  int v41 = *((unsigned __int8 *)v11 + 1);
  if (v41 == 76) {
    goto LABEL_77;
  }
  if (v41 == 72)
  {
    i |= 0x10u;
LABEL_77:
    int v42 = *((char *)v11 + 2);
    int v11 = (CAStreamBasicDescription *)((char *)v11 + 2);
    unsigned __int8 v37 = v42;
    if ((v42 & 0x80000000) == 0)
    {
      unsigned int v26 = 0;
      while ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v37 + 60) & 0x400) != 0)
      {
        int v43 = *((char *)v11 + 1);
        int v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
        unsigned int v26 = 10 * v26 + v37 - 48;
        unsigned __int8 v37 = v43;
        if (v43 < 0) {
          goto LABEL_100;
        }
      }
      goto LABEL_82;
    }
LABEL_100:
    fprintf(*v9, "extra characters at end of format string: %s\n", (const char *)v11);
  }
LABEL_101:
  fprintf(*v9, "Invalid format string: %s\n", (const char *)this);
  fwrite("Syntax of format strings is: \n", 0x1EuLL, 1uLL, *v9);
  return 0;
}

double ASDT::ValueRange::PickCommonSampleRate(ASDT::ValueRange *this, const AudioValueRange *a2)
{
  double v3 = *(double *)this;
  double v2 = *((double *)this + 1);
  double result = 48000.0;
  if (*(double *)this > 48000.0 || v2 < 48000.0)
  {
    double result = 44100.0;
    if (v3 > 44100.0 || v2 < 44100.0)
    {
      double result = 96000.0;
      if (v3 > 96000.0 || v2 < 96000.0)
      {
        double result = 88200.0;
        if (v3 > 88200.0 || v2 < 88200.0)
        {
          double result = 64000.0;
          if (v3 > 64000.0 || v2 < 64000.0)
          {
            double result = 32000.0;
            if (v3 > 32000.0 || v2 < 32000.0)
            {
              double result = 24000.0;
              if (v3 > 24000.0 || v2 < 24000.0)
              {
                double result = 22050.0;
                if (v3 > 22050.0 || v2 < 22050.0)
                {
                  double result = 16000.0;
                  if (v3 > 16000.0 || v2 < 16000.0)
                  {
                    double result = 12000.0;
                    if (v3 > 12000.0 || v2 < 12000.0)
                    {
                      double result = 11025.0;
                      if (v3 > 11025.0 || v2 < 11025.0)
                      {
                        double result = 8000.0;
                        if (v2 < 8000.0 || v3 > 8000.0) {
                          return *((double *)this + 1);
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
  return result;
}

uint64_t ASDT::MachPort::CreatePort(ASDT::MachPort *this, integer_t a2)
{
  int v3 = (int)this;
  mach_port_name_t name = 0;
  int v4 = (ipc_space_t *)MEMORY[0x263EF8960];
  if (mach_port_allocate(*MEMORY[0x263EF8960], 1u, &name))
  {
    int v5 = ASDTBaseLogType();
    uint64_t result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    ASDT::MachPort::CreatePort();
    return 0;
  }
  if (a2)
  {
    mach_msg_type_number_t port_info_outCnt = 1;
    if (mach_port_get_attributes(*v4, name, 1, &port_info_out, &port_info_outCnt))
    {
      uint64_t v7 = ASDTBaseLogType();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        ASDT::MachPort::CreatePort();
      }
LABEL_15:
      mach_port_deallocate(*v4, name);
      return 0;
    }
    integer_t port_info_out = a2;
    if (MEMORY[0x24C587900](*v4, name, 1, &port_info_out, 1))
    {
      BOOL v8 = ASDTBaseLogType();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        ASDT::MachPort::CreatePort();
      }
      goto LABEL_15;
    }
  }
  if (v3 && mach_port_insert_right(*v4, name, name, 0x14u))
  {
    int v9 = ASDTBaseLogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      ASDT::MachPort::CreatePort();
    }
    goto LABEL_15;
  }
  return name;
}

uint64_t ASDT::MachPort::LookupPort(ASDT::MachPort *this, const char *a2)
{
  if (bootstrap_look_up2()) {
    return 0;
  }
  else {
    return 0;
  }
}

uint64_t ASDT::MachPort::CheckInPort(ASDT::MachPort *this, const char *a2)
{
  int v2 = (int)a2;
  mach_port_t sp = 0;
  if (bootstrap_check_in(*MEMORY[0x263EF87F0], (const char *)this, &sp))
  {
    int v3 = ASDTBaseLogType();
    uint64_t result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    ASDT::MachPort::CheckInPort();
    return 0;
  }
  if (!v2 || !mach_port_insert_right(*MEMORY[0x263EF8960], sp, sp, 0x14u)) {
    return sp;
  }
  int v5 = ASDTBaseLogType();
  uint64_t result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::MachPort::CheckInPort();
    return 0;
  }
  return result;
}

void ASDT::MachPort::RetainPort(mach_port_name_t name)
{
  if (name && mach_port_mod_refs(*MEMORY[0x263EF8960], name, 0, 1))
  {
    uint64_t v1 = ASDTBaseLogType();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      ASDT::MachPort::RetainPort();
    }
  }
}

uint64_t ASDT::MachPort::DestroyPort(uint64_t name, int a2, int a3)
{
  mach_port_name_t v4 = name;
  if ((a2 & 1) == 0 && (a3 & 1) == 0)
  {
    int v6 = ASDTBaseLogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ASDT::MachPort::DestroyPort();
    }
    __assert_rtn("DestroyPort", "ASDTMachPort.cpp", 179, "(inDestroySendRight || inDestroyReceiveRight)");
  }
  if (name)
  {
    if (a2)
    {
      mach_port_name_t name = mach_port_deallocate(*MEMORY[0x263EF8960], name);
      if (name)
      {
        uint64_t v7 = ASDTBaseLogType();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          ASDT::MachPort::DestroyPort();
        }
        __assert_rtn("DestroyPort", "ASDTMachPort.cpp", 187, "(theError == 0)");
      }
    }
    if (a3)
    {
      ipc_space_t v5 = *MEMORY[0x263EF8960];
      return mach_port_mod_refs(v5, v4, 1u, -1);
    }
  }
  return name;
}

uint64_t ASDT::MachPort::ReceiveMessage(mach_port_name_t rcv_name, mach_msg_size_t rcv_size, mach_msg_header_t *msg, mach_msg_header_t *a4, mach_msg_timeout_t a5)
{
  if (!rcv_name) {
    return 268451842;
  }
  if (a4) {
    mach_msg_option_t v6 = 258;
  }
  else {
    mach_msg_option_t v6 = 2;
  }
  if (!a4) {
    a5 = 0;
  }
  *(void *)&msg->msgh_bits = 0;
  *(void *)&msg->msgh_remote_port = 0;
  *(void *)&msg->msgh_voucher_port = 0;
  uint64_t v8 = mach_msg(msg, v6, 0, rcv_size, rcv_name, a5, 0);
  if (v8)
  {
    int v9 = ASDTBaseLogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      ASDT::MachPort::ReceiveMessage(v8);
    }
  }
  return v8;
}

uint64_t ASDT::MachPort::ReceiveSimpleMessage(ASDT::MachPort *this, mach_msg_id_t *a2, mach_msg_header_t *a3, mach_msg_timeout_t a4)
{
  uint64_t result = ASDT::MachPort::ReceiveMessage((mach_port_name_t)this, 0x20u, &v6, a3, a4);
  if (!result) {
    *a2 = v6.msgh_id;
  }
  return result;
}

uint64_t ASDT::MachPort::SendMessage(ASDT::MachPort *this, mach_msg_size_t send_size, mach_msg_header_t *msg, mach_msg_header_t *a4, mach_msg_timeout_t a5)
{
  if (!this) {
    return 0;
  }
  msg->msgh_bits = 19;
  msg->msgh_size = send_size;
  msg->msgh_local_port = 0;
  msg->msgh_voucher_port = 0;
  if (a4) {
    mach_msg_option_t v7 = 17;
  }
  else {
    mach_msg_option_t v7 = 1;
  }
  if (!a4) {
    a5 = 0;
  }
  msg->msgh_remote_port = this;
  uint64_t v9 = mach_msg(msg, v7, send_size, 0, 0, a5, 0);
  if (v9)
  {
    int v10 = ASDTBaseLogType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      ASDT::MachPort::SendMessage(v9);
    }
    if ((msg->msgh_bits & 0x1F) != 0x13) {
      mach_port_deallocate(*MEMORY[0x263EF8960], msg->msgh_remote_port);
    }
  }
  return v9;
}

uint64_t ASDT::MachPort::SendSimpleMessage(ASDT::MachPort *this, mach_msg_id_t a2, mach_msg_header_t *a3, mach_msg_timeout_t a4)
{
  msg.msgh_id = a2;
  return ASDT::MachPort::SendMessage(this, 0x18u, &msg, a3, a4);
}

{
  ASDT::MachPort *v4;
  mach_msg_header_t msg;

  mach_port_name_t v4 = (ASDT::MachPort *)*((unsigned int *)this + 2);
  msg.msgh_id = a2;
  return ASDT::MachPort::SendMessage(v4, 0x18u, &msg, a3, a4);
}

uint64_t ASDT::MachPort::SendMessageWithReply(ASDT::MachPort *this, mach_port_name_t rcv_name, mach_msg_size_t a3, mach_msg_size_t a4, mach_msg_header_t *msg, mach_msg_header_t *a6, mach_msg_timeout_t a7)
{
  uint64_t v7 = 0;
  if (this && rcv_name)
  {
    msg->msgh_bits = 19;
    msg->msgh_size = a3;
    msg->msgh_local_port = 0;
    msg->msgh_voucher_port = 0;
    if (a6) {
      mach_msg_option_t v10 = 275;
    }
    else {
      mach_msg_option_t v10 = 3;
    }
    if (!a6) {
      a7 = 0;
    }
    msg->msgh_remote_port = this;
    uint64_t v7 = mach_msg(msg, v10, a3, a4, rcv_name, a7, 0);
    if (v7)
    {
      int v12 = ASDTBaseLogType();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        ASDT::MachPort::SendMessageWithReply(v7);
      }
      if ((msg->msgh_bits & 0x1F) != 0x13) {
        mach_port_deallocate(*MEMORY[0x263EF8960], msg->msgh_remote_port);
      }
    }
  }
  return v7;
}

uint64_t ASDT::MachPort::SendSimpleMessageWithSimpleReply(ASDT::MachPort *this, mach_port_name_t a2, mach_msg_id_t a3, mach_msg_id_t *a4, mach_msg_header_t *a5, mach_msg_timeout_t a6)
{
  v8.msgh_id = a3;
  uint64_t result = ASDT::MachPort::SendMessageWithReply(this, a2, 0x18u, 0x20u, &v8, a5, a6);
  if (!result) {
    *a4 = v8.msgh_id;
  }
  return result;
}

void ASDT::MachPort::ClearNotificationHandler(ASDT::MachPort *this)
{
  if (*((void *)this + 4))
  {
    int v2 = dispatch_semaphore_create(0);
    int v3 = *((void *)this + 4);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = ___ZN4ASDT8MachPort24ClearNotificationHandlerEv_block_invoke;
    handler[3] = &__block_descriptor_tmp_0;
    handler[4] = v2;
    dispatch_source_set_cancel_handler(v3, handler);
    dispatch_source_cancel(*((dispatch_source_t *)this + 4));
    dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v2);
    dispatch_release(*((dispatch_object_t *)this + 4));
    *((void *)this + 4) = 0;
  }
  mach_port_name_t v4 = (const void *)*((void *)this + 2);
  if (v4)
  {
    _Block_release(v4);
    *((void *)this + 2) = 0;
  }
  ipc_space_t v5 = *((void *)this + 3);
  if (v5)
  {
    dispatch_release(v5);
    *((void *)this + 3) = 0;
  }
}

intptr_t ___ZN4ASDT8MachPort24ClearNotificationHandlerEv_block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t ASDT::MachPort::SetNotificationQueue(const void **a1, uint64_t a2)
{
  if (*(void *)a2)
  {
    if (a1[4])
    {
      *(void *)(a2 + 8) = _Block_copy(a1[2]);
      (*((void (**)(const void **))*a1 + 4))(a1);
      uint64_t v4 = (*((uint64_t (**)(const void **, uint64_t))*a1 + 2))(a1, a2);
      _Block_release(*(const void **)(a2 + 8));
      return v4;
    }
    uint64_t v7 = ASDTBaseLogType();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      ASDT::MachPort::SetNotificationQueue();
    }
  }
  else
  {
    mach_msg_header_t v6 = ASDTBaseLogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ASDT::MachPort::SetNotificationQueue();
    }
  }
  return 0;
}

BOOL ASDT::MachPort::SetNotificationHandler(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 8)) {
    BOOL v2 = *(void *)a2 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2 || !*(void *)(a2 + 8)) {
    return 0;
  }
  (*(void (**)(uint64_t))(*(void *)a1 + 32))(a1);
  dispatch_source_t v5 = dispatch_source_create(MEMORY[0x263EF83C8], *(unsigned int *)(a1 + 8), 0, *(dispatch_queue_t *)a2);
  *(void *)(a1 + 32) = v5;
  if (v5)
  {
    mach_msg_header_t v6 = _Block_copy(*(const void **)(a2 + 8));
    uint64_t v7 = *(NSObject **)a2;
    *(void *)(a1 + 16) = v6;
    *(void *)(a1 + 24) = v7;
    dispatch_retain(v7);
    dispatch_source_set_event_handler(*(dispatch_source_t *)(a1 + 32), *(dispatch_block_t *)(a2 + 8));
    dispatch_resume(*(dispatch_object_t *)(a1 + 32));
    return 1;
  }
  uint64_t v9 = ASDTBaseLogType();
  BOOL result = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::MachPort::SetNotificationHandler();
    return 0;
  }
  return result;
}

void ASDT::MachPort::~MachPort(ASDT::MachPort *this)
{
  ASDT::MachPort::~MachPort(this);
  JUMPOUT(0x24C587580);
}

{
  *(void *)this = &unk_26FCA6530;
  ASDT::MachPort::ClearNotificationHandler(this);
  ASDT::MachPort::DestroyPort(*((unsigned int *)this + 2), *((unsigned __int8 *)this + 12), *((unsigned __int8 *)this + 13));
}

uint64_t ASDT::MachPort::ReceiveMessage(ASDT::MachPort *this, mach_msg_size_t a2, mach_msg_header_t *a3, mach_msg_header_t *a4, mach_msg_timeout_t a5)
{
  return ASDT::MachPort::ReceiveMessage(*((_DWORD *)this + 2), a2, a3, a4, a5);
}

uint64_t ASDT::MachPort::ReceiveSimpleMessage(ASDT::MachPort *this, int *a2, mach_msg_header_t *a3, mach_msg_timeout_t a4)
{
  uint64_t result = ASDT::MachPort::ReceiveMessage(*((_DWORD *)this + 2), 0x20u, &v6, a3, a4);
  if (!result) {
    *a2 = v6.msgh_id;
  }
  return result;
}

uint64_t ASDT::MachPort::SendMessage(ASDT::MachPort *this, mach_msg_size_t a2, mach_msg_header_t *a3, mach_msg_header_t *a4, mach_msg_timeout_t a5)
{
  return ASDT::MachPort::SendMessage((ASDT::MachPort *)*((unsigned int *)this + 2), a2, a3, a4, a5);
}

uint64_t ASDT::MachPort::SendMessageWithReply(ASDT::MachPort *this, mach_port_name_t a2, mach_msg_size_t a3, mach_msg_size_t a4, mach_msg_header_t *a5, mach_msg_header_t *a6, mach_msg_timeout_t a7)
{
  return ASDT::MachPort::SendMessageWithReply((ASDT::MachPort *)*((unsigned int *)this + 2), a2, a3, a4, a5, a6, a7);
}

uint64_t ASDT::MachPort::SendSimpleMessageWithSimpleReply(ASDT::MachPort *this, mach_port_name_t a2, mach_msg_id_t a3, int *a4, mach_msg_header_t *a5, mach_msg_timeout_t a6)
{
  uint64_t v7 = (ASDT::MachPort *)*((unsigned int *)this + 2);
  v9.msgh_id = a3;
  uint64_t result = ASDT::MachPort::SendMessageWithReply(v7, a2, 0x18u, 0x20u, &v9, a5, a6);
  if (!result) {
    *a4 = v9.msgh_id;
  }
  return result;
}

void OUTLINED_FUNCTION_1_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void CACFDictionary::CACFDictionary(CACFDictionary *this, const void *a2)
{
  *((unsigned char *)this + 9) = 0;
}

{
  *((unsigned char *)this + 9) = 0;
}

BOOL CACFDictionary::HasKey(CFDictionaryRef *this, const __CFString *a2)
{
  return CFDictionaryContainsKey(*this, a2) != 0;
}

const __CFDictionary *CACFDictionary::Size(const __CFDictionary **this)
{
  CFDictionaryRef result = *this;
  if (result) {
    return (const __CFDictionary *)CFDictionaryGetCount(result);
  }
  return result;
}

void CACFDictionary::GetKeys(CFDictionaryRef *this, const void **a2)
{
}

void CACFDictionary::GetKeysAndValues(CFDictionaryRef *this, const void **a2, const void **a3)
{
}

uint64_t CACFDictionary::GetBool(CACFDictionary *this, const __CFString *a2, BOOL *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFBooleanRef v5 = (const __CFBoolean *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFBooleanGetTypeID())
      {
        BOOL v7 = CFBooleanGetValue(v5) == 0;
      }
      else
      {
        CFTypeID v8 = CFGetTypeID(v5);
        if (v8 != CFNumberGetTypeID()) {
          return 0;
        }
        int valuePtr = 0;
        CFNumberGetValue(v5, kCFNumberSInt32Type, &valuePtr);
        BOOL v7 = valuePtr == 0;
      }
      BOOL v9 = !v7;
      *a3 = v9;
      return 1;
    }
  }
  return result;
}

const __CFDictionary *CACFDictionary::GetCFType(const __CFDictionary **this, const __CFString *a2, const void **a3)
{
  CFDictionaryRef result = *this;
  if (result)
  {
    int Value = CFDictionaryGetValue(result, a2);
    *a3 = Value;
    return Value;
  }
  return result;
}

uint64_t CACFDictionary::GetSInt32(CACFDictionary *this, const __CFString *a2, int *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFNumberRef v5 = (const __CFNumber *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetUInt32(CACFDictionary *this, const __CFString *a2, unsigned int *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFNumberRef v5 = (const __CFNumber *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetSInt64(CACFDictionary *this, const __CFString *a2, uint64_t *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFNumberRef v5 = (const __CFNumber *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetUInt64(CACFDictionary *this, const __CFString *a2, unint64_t *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFNumberRef v5 = (const __CFNumber *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetFloat32FromString(CACFDictionary *this, const __CFString *a2, float *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFStringRef v5 = (const __CFString *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFStringGetTypeID())
      {
        Doubleint Value = CFStringGetDoubleValue(v5);
        *a3 = DoubleValue;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetUInt32FromString(CACFDictionary *this, const __CFString *a2, SInt32 *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFStringRef v5 = (const __CFString *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFStringGetTypeID())
      {
        *a3 = CFStringGetIntValue(v5);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetFloat32(CACFDictionary *this, const __CFString *a2, float *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFNumberRef v5 = (const __CFNumber *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberFloat32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetFloat64(CACFDictionary *this, const __CFString *a2, double *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFNumberRef v5 = (const __CFNumber *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberFloat64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetFixed32(CACFDictionary *this, const __CFString *a2, float *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFNumberRef v5 = (const __CFNumber *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        int valuePtr = 0;
        CFNumberGetValue(v5, kCFNumberSInt32Type, &valuePtr);
        float v7 = 1.0;
        if (valuePtr < 0) {
          float v7 = -1.0;
        }
        *a3 = v7
            * (float)((float)((float)(unsigned __int16)(valuePtr * (int)v7) * 0.000015259)
                    + (float)(((valuePtr * (int)v7) >> 16) & 0x7FFF));
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetFixed64(CACFDictionary *this, const __CFString *a2, double *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFNumberRef v5 = (const __CFNumber *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        uint64_t valuePtr = 0;
        CFNumberGetValue(v5, kCFNumberSInt64Type, &valuePtr);
        *a3 = (double)valuePtr * 2.32830644e-10 + (double)(valuePtr >> 32);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::Get4CC(CACFDictionary *this, const __CFString *a2, unsigned int *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFNumberRef v5 = (const __CFNumber *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
        return 1;
      }
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 == CFStringGetTypeID() && CFStringGetLength((CFStringRef)v5) == 4)
      {
        CFStringGetCString((CFStringRef)v5, buffer, 5, 0x600u);
        *a3 = bswap32(*(unsigned int *)buffer);
        return 1;
      }
      return 0;
    }
  }
  return result;
}

uint64_t CACFDictionary::GetString(CACFDictionary *this, const __CFString *a2, const __CFString **a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFStringRef v5 = (const __CFString *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFStringGetTypeID())
      {
        *a3 = v5;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetArray(CACFDictionary *this, const __CFString *a2, const __CFArray **a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFArrayRef v5 = (const __CFArray *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFArrayGetTypeID())
      {
        *a3 = v5;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetDictionary(CACFDictionary *this, const __CFString *a2, const __CFDictionary **a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFDictionaryRef v5 = (const __CFDictionary *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFDictionaryGetTypeID())
      {
        *a3 = v5;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetData(CACFDictionary *this, const __CFString *a2, const __CFData **a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFDataRef v5 = (const __CFData *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFDataGetTypeID())
      {
        *a3 = v5;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetURL(CACFDictionary *this, const __CFString *a2, const __CFURL **a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFURLRef v5 = (const __CFURL *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFURLGetTypeID())
      {
        *a3 = v5;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

BOOL CACFDictionary::GetCFTypeWithCStringKey(CFDictionaryRef *this, const char *a2, const void **a3)
{
  if (!*this) {
    return 0;
  }
  CFStringRef v5 = CFStringCreateWithCString(0, a2, 0x600u);
  CFStringRef v9 = v5;
  char v10 = 1;
  if (v5 && *this)
  {
    int Value = CFDictionaryGetValue(*this, v5);
    *a3 = Value;
    BOOL v7 = Value != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  CACFString::~CACFString((CACFString *)&v9);
  return v7;
}

void sub_2489D2030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

const __CFDictionary *CACFDictionary::GetCACFString(const __CFDictionary **this, const __CFString *key, CFTypeRef *a3)
{
  if (*a3)
  {
    if (*((unsigned char *)a3 + 8)) {
      CFRelease(*a3);
    }
    *a3 = 0;
  }
  *((unsigned char *)a3 + 8) = 1;
  CFDictionaryRef result = *this;
  if (*this)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, key);
    if (result)
    {
      CFDictionaryRef v7 = result;
      CFTypeID v8 = CFGetTypeID(result);
      CFDictionaryRef result = (const __CFDictionary *)CFStringGetTypeID();
      if ((const __CFDictionary *)v8 == result)
      {
        return (const __CFDictionary *)CACFString::operator=((uint64_t)a3, v7);
      }
    }
  }
  return result;
}

uint64_t CACFString::operator=(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v4 = *(CFTypeRef *)a1;
  if (v4 != cf)
  {
    if (v4) {
      BOOL v5 = *(unsigned char *)(a1 + 8) == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5) {
      CFRelease(v4);
    }
    *(void *)a1 = cf;
  }
  *(unsigned char *)(a1 + 8) = 1;
  if (cf) {
    CFRetain(cf);
  }
  return a1;
}

const __CFDictionary *CACFDictionary::GetCACFArray(const __CFDictionary **this, const __CFString *a2, CACFArray *a3)
{
  CACFArray::operator=((uint64_t)a3, 0);
  CFDictionaryRef result = *this;
  if (*this)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFDictionaryRef v7 = result;
      CFTypeID v8 = CFGetTypeID(result);
      CFDictionaryRef result = (const __CFDictionary *)CFArrayGetTypeID();
      if ((const __CFDictionary *)v8 == result)
      {
        return (const __CFDictionary *)CACFArray::operator=((uint64_t)a3, v7);
      }
    }
  }
  return result;
}

uint64_t CACFArray::operator=(uint64_t a1, const void *a2)
{
  if (!*(unsigned char *)(a1 + 8))
  {
    *(void *)a1 = a2;
    *(unsigned char *)(a1 + 9) = 0;
    return a1;
  }
  CFTypeRef v4 = *(const void **)a1;
  if (!*(void *)a1)
  {
    *(void *)a1 = a2;
    *(unsigned char *)(a1 + 9) = 0;
    if (!a2) {
      return a1;
    }
LABEL_8:
    CFRetain(a2);
    return a1;
  }
  CFRelease(v4);
  int v5 = *(unsigned __int8 *)(a1 + 8);
  *(void *)a1 = a2;
  *(unsigned char *)(a1 + 9) = 0;
  if (a2 && v5) {
    goto LABEL_8;
  }
  return a1;
}

const __CFDictionary *CACFDictionary::GetCACFDictionary(const __CFDictionary **this, const __CFString *a2, CACFDictionary *a3)
{
  CACFArray::operator=((uint64_t)a3, 0);
  CFDictionaryRef result = *this;
  if (*this)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFDictionaryRef v7 = result;
      CFTypeID v8 = CFGetTypeID(result);
      CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetTypeID();
      if ((const __CFDictionary *)v8 == result)
      {
        return (const __CFDictionary *)CACFArray::operator=((uint64_t)a3, v7);
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::AddBool(CACFDictionary *this, const __CFString *key, int a3)
{
  int v5 = (const void **)MEMORY[0x263EFFB40];
  if (!a3) {
    int v5 = (const void **)MEMORY[0x263EFFB38];
  }
  CFTypeID v6 = *v5;
  int v11 = v6;
  char v12 = 1;
  if (v6) {
    CFRetain(v6);
  }
  if (!*((unsigned char *)this + 9) || ((CFDictionaryRef v7 = *(__CFDictionary **)this, v6) ? (v8 = v7 == 0) : (v8 = 1), v8))
  {
    uint64_t v9 = 0;
  }
  else
  {
    CFDictionarySetValue(v7, key, v6);
    uint64_t v9 = 1;
  }
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v11);
  return v9;
}

void sub_2489D2380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t CACFDictionary::AddCFType(CACFDictionary *this, const __CFString *a2, const void *a3)
{
  if (!*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t result = 0;
  if (a3)
  {
    int v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddSInt32(CFMutableDictionaryRef *this, const __CFString *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (*((unsigned char *)this + 9))
  {
    uint64_t v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_2489D2468(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddUInt32(CFMutableDictionaryRef *this, const __CFString *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (*((unsigned char *)this + 9))
  {
    uint64_t v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_2489D250C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddSInt64(CFMutableDictionaryRef *this, const __CFString *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (*((unsigned char *)this + 9))
  {
    uint64_t v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_2489D25B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddUInt64(CFMutableDictionaryRef *this, const __CFString *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (*((unsigned char *)this + 9))
  {
    uint64_t v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_2489D2654(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddFloat32(CFMutableDictionaryRef *this, const __CFString *a2, float a3)
{
  float valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (*((unsigned char *)this + 9))
  {
    uint64_t v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_2489D26F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddFloat64(CFMutableDictionaryRef *this, const __CFString *a2, double a3)
{
  double valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberFloat64Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (*((unsigned char *)this + 9))
  {
    uint64_t v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_2489D279C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddNumber(CACFDictionary *this, const __CFString *a2, const __CFNumber *a3)
{
  if (!*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t result = 0;
  if (a3)
  {
    CFNumberRef v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddString(CACFDictionary *this, const __CFString *a2, const __CFString *a3)
{
  if (!*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t result = 0;
  if (a3)
  {
    CFNumberRef v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddArray(CACFDictionary *this, const __CFString *a2, const __CFArray *a3)
{
  if (!*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t result = 0;
  if (a3)
  {
    CFNumberRef v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddDictionary(CACFDictionary *this, const __CFString *a2, const __CFDictionary *a3)
{
  if (!*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t result = 0;
  if (a3)
  {
    CFNumberRef v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddData(CACFDictionary *this, const __CFString *a2, const __CFData *a3)
{
  if (!*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t result = 0;
  if (a3)
  {
    CFNumberRef v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddURL(CACFDictionary *this, const __CFString *a2, const __CFURL *a3)
{
  if (!*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t result = 0;
  if (a3)
  {
    CFNumberRef v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddCFTypeWithCStringKey(CFMutableDictionaryRef *this, const char *a2, const void *a3)
{
  if (!a2) {
    return 0;
  }
  CFStringRef v5 = CFStringCreateWithCString(0, a2, 0x600u);
  CFStringRef v8 = v5;
  char v9 = 1;
  if (v5 && *((unsigned char *)this + 9))
  {
    uint64_t v6 = 0;
    if (a3 && *this)
    {
      CFDictionarySetValue(*this, v5, a3);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  CACFString::~CACFString((CACFString *)&v8);
  return v6;
}

void sub_2489D29E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t CACFDictionary::AddCString(CFMutableDictionaryRef *this, const __CFString *a2, const char *cStr)
{
  if (!cStr) {
    return 0;
  }
  CFStringRef v5 = CFStringCreateWithCString(0, cStr, 0x600u);
  CFStringRef v8 = v5;
  char v9 = 1;
  if (v5 && *((unsigned char *)this + 9) && *this)
  {
    CFDictionarySetValue(*this, a2, v5);
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
  }
  CACFString::~CACFString((CACFString *)&v8);
  return v6;
}

void sub_2489D2A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void CACFDictionary::PrintToLog(CACFDictionary *this, const __CFString *a2)
{
  v13[1] = *MEMORY[0x263EF8340];
  CFIndex Count = CFDictionaryGetCount(this);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    unint64_t v6 = 8 * Count;
    MEMORY[0x270FA5388]();
    unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
    CFStringRef v8 = (const __CFString **)((char *)v13 - v7);
    if (v6 >= 0x200) {
      size_t v9 = 512;
    }
    else {
      size_t v9 = v6;
    }
    bzero((char *)v13 - v7, v9);
    MEMORY[0x270FA5388]();
    char v10 = (CFTypeRef *)((char *)v13 - v7);
    bzero((char *)v13 - v7, v9);
    CFDictionaryGetKeysAndValues(this, (const void **)((char *)v13 - v7), (const void **)((char *)v13 - v7));
    do
    {
      CACFString::PrintToLog(*v8, a2);
      CFTypeID v11 = CFGetTypeID(*v10);
      if (v11 == CFBooleanGetTypeID())
      {
        CACFBoolean::PrintToLog((CACFBoolean *)*v10, (const __CFBoolean *)(a2 + 1));
      }
      else if (v11 == CFNumberGetTypeID())
      {
        CACFNumber::PrintToLog((CACFNumber *)*v10, (const __CFNumber *)(a2 + 1));
      }
      else if (v11 == CFStringGetTypeID())
      {
        CACFString::PrintToLog((const __CFString *)*v10, (const __CFString *)(a2 + 1));
      }
      else if (v11 == CFDictionaryGetTypeID())
      {
        CACFDictionary::PrintToLog((CACFDictionary *)*v10, (const __CFDictionary *)(a2 + 1), v12);
      }
      else if (v11 == CFArrayGetTypeID())
      {
        CACFArray::PrintToLog((CACFArray *)*v10, (const __CFArray *)(a2 + 1));
      }
      ++v10;
      ++v8;
      --v5;
    }
    while (v5);
  }
}

void CACFString::~CACFString(CACFString *this)
{
  if (*((unsigned char *)this + 8))
  {
    BOOL v2 = *(const void **)this;
    if (*(void *)this) {
      CFRelease(v2);
    }
  }
}

void CACFBoolean::~CACFBoolean(CACFBoolean *this)
{
  if (*((unsigned char *)this + 8))
  {
    BOOL v2 = *(const void **)this;
    if (*(void *)this) {
      CFRelease(v2);
    }
  }
}

void CACFNumber::~CACFNumber(CACFNumber *this)
{
  if (*((unsigned char *)this + 8))
  {
    BOOL v2 = *(const void **)this;
    if (*(void *)this) {
      CFRelease(v2);
    }
  }
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1, uint64_t a2)
{
  return a2;
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_4_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_5_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_6(uint64_t result, float a2)
{
  *int v3 = a2;
  void *v2 = result;
  return result;
}

void sub_2489D5AF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489D5CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489D5D44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ASDTSystemPowerNotifier;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_2489D5FE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489D621C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489D6344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ASDTSystemPowerInterestCallback(void *a1, unsigned int a2, uint64_t a3, void *a4)
{
  unint64_t v7 = (void *)MEMORY[0x24C5879A0]();
  [a1 handlePowerNotificationWithMessageType:a3 andArgument:a4];
}

void sub_2489D64B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_5(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

uint64_t ASDT::Clock::GetMachTimeMaxDrift(ASDT::Clock *this, uint64_t a2, uint64_t a3, const char *a4)
{
  unsigned int v5 = 100;
  if (ASDT::IORegistry::GetUInt32tForKey((UInt8 *)&v5, (ASDT::IORegistry *)"mach-time-audio-max-drift", (_anonymous_namespace_ *)"IODeviceTree:/product/audio", a4))
  {
    uint64_t result = v5;
  }
  else
  {
    uint64_t result = 100;
  }
  return result;
}

uint64_t ASDT::Clock::GetSynchronousClockDomain(ASDT::Clock *this, uint64_t a2, uint64_t a3, const char *a4)
{
  {
  }
  else
  {
    int v8 = 0;
    BOOL UInt32tForKey = ASDT::IORegistry::GetUInt32tForKey((UInt8 *)&v8, (ASDT::IORegistry *)"mach-time-audio-alignment", (_anonymous_namespace_ *)"IODeviceTree:/product/audio", a4);
    if (v8) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
    if (!UInt32tForKey) {
      int v4 = 0;
    }
  }
  if (v4 == 2) {
    unsigned int v6 = 7567731;
  }
  else {
    unsigned int v6 = 1228034925;
  }
  if (v4 == 1) {
    return 1835100526;
  }
  else {
    return v6;
  }
}

uint64_t ASDT::Clock::GetDomainForFourCC(uint64_t this, const char *a2, uint64_t a3, const char *a4)
{
  if (this)
  {
    uint64_t v4 = this;
    uint64_t v5 = 0;
    this = 0;
    do
    {
      if (!*(unsigned char *)(v4 + v5)) {
        break;
      }
      this = *(unsigned __int8 *)(v4 + v5++) | (this << 8);
    }
    while (v5 != 4);
    if (this == 1937337955) {
      return ASDT::Clock::GetSynchronousClockDomain((ASDT::Clock *)this, (uint64_t)a2, a3, a4);
    }
  }
  return this;
}

const __CFString *CACFString::GetStringByteLength(const __CFString *this, const __CFString *a2)
{
  CFIndex usedBufLen = 0;
  if (this)
  {
    CFStringEncoding v2 = a2;
    CFStringRef v3 = this;
    v5.length = CFStringGetLength(this);
    v5.location = 0;
    CFStringGetBytes(v3, v5, v2, 0, 0, 0, 0x7FFFFFFFLL, &usedBufLen);
    return (const __CFString *)usedBufLen;
  }
  return this;
}

const __CFString *CACFString::GetCString(const __CFString *theString, __CFString *a2, char *a3, unsigned int *a4)
{
  if (*(_DWORD *)a3)
  {
    CFStringRef v6 = theString;
    if (theString)
    {
      CFStringEncoding v7 = a4;
      CFIndex usedBufLen = 0;
      v11.length = CFStringGetLength(theString);
      v11.location = 0;
      theString = (const __CFString *)CFStringGetBytes(v6, v11, v7, 0, 0, (UInt8 *)a2, (*(_DWORD *)a3 - 1), &usedBufLen);
      int v8 = usedBufLen;
      *((unsigned char *)&a2->isa + usedBufLen) = 0;
      int v9 = v8 + 1;
    }
    else
    {
      LOBYTE(a2->isa) = 0;
      int v9 = 1;
    }
    *(_DWORD *)a3 = v9;
  }
  return theString;
}

void CACFString::GetUnicodeString(CFStringRef theString, __CFString *a2, unsigned __int16 *a3, unsigned int *a4)
{
  if (*(_DWORD *)a3)
  {
    if (theString)
    {
      CFIndex Length = CFStringGetLength(theString);
      if (*(_DWORD *)a3 >= Length) {
        CFIndex v8 = Length;
      }
      else {
        CFIndex v8 = *(unsigned int *)a3;
      }
      v9.location = 0;
      v9.length = v8;
      CFStringGetCharacters(theString, v9, (UniChar *)a2);
    }
    else
    {
      LODWORD(v8) = 0;
      LOWORD(a2->isa) = 0;
    }
    *(_DWORD *)a3 = v8;
  }
}

void CACFString::PrintToLog(const __CFString *this, const __CFString *a2)
{
  LODWORD(v2) = a2;
  uint64_t v40 = *MEMORY[0x263EF8340];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v9 = 0u;
  memset(__b, 0, sizeof(__b));
  if (CFStringGetCString(this, buffer, 512, 0x600u))
  {
    if (v2)
    {
      uint64_t v2 = v2;
      memset(__b, 9, v2);
    }
    else
    {
      uint64_t v2 = 0;
    }
    *((unsigned char *)__b + v2) = 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315394;
      uint64_t v4 = __b;
      __int16 v5 = 2080;
      CFStringRef v6 = buffer;
      _os_log_impl(&dword_2489BC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " %s%s", (uint8_t *)&v3, 0x16u);
    }
  }
}

void sub_2489D717C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489D72F4(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_2489D73FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489D768C(_Unwind_Exception *a1)
{
  CFStringEncoding v7 = v4;

  _Unwind_Resume(a1);
}

void sub_2489D79A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489D7A50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489D7AF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489D7C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489D7D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489D7DC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489D8060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_2489D8138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489D81B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489D822C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489D8294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489D82E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489D834C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489D83B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489D8420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_7(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t asdtPowerTransitionForStateChange(int a1, int a2)
{
  if (a2 > 1886876268)
  {
    switch(a2)
    {
      case 1886876269:
        if (a1 <= 1886413169) {
          goto LABEL_21;
        }
        if (a1 != 1886413170)
        {
LABEL_26:
          if (a1 != 1920298606) {
            goto LABEL_27;
          }
          return 1685092205;
        }
        break;
      case 1936483696:
        if (a1 <= 1886876268)
        {
          if (a1 == 1768189029) {
            return 1685286000;
          }
          goto LABEL_37;
        }
        if (a1 == 1886876269) {
          return 1685090418;
        }
        if (a1 == 1920298606) {
          return 1685092205;
        }
        return 0;
      case 1920298606:
        if (a1 <= 1886413169) {
          goto LABEL_21;
        }
        if (a1 != 1886413170)
        {
          if (a1 == 1886876269) {
            return 1970435438;
          }
LABEL_27:
          if (a1 == 1936483696) {
            return 1937008996;
          }
          return 0;
        }
        break;
      default:
        return 0;
    }
    return 1970304877;
  }
  if (!a2)
  {
    switch(a1)
    {
      case 1886413170:
        return 1684628588;
      case 1920298606:
        return 1685092205;
      case 1886876269:
        return 1685090418;
    }
    return 0;
  }
  if (a2 == 1768189029)
  {
    if (a1 > 1886876268)
    {
LABEL_25:
      if (a1 != 1886876269) {
        goto LABEL_26;
      }
      return 1685090418;
    }
    if (!a1) {
      return 1970563428;
    }
LABEL_37:
    if (a1 != 1886413170) {
      return 0;
    }
    return 1684628588;
  }
  if (a2 != 1886413170) {
    return 0;
  }
  if (a1 > 1886876268) {
    goto LABEL_25;
  }
LABEL_21:
  if (a1)
  {
    if (a1 == 1768189029) {
      return 1970303090;
    }
    return 0;
  }
  return 1970563428;
}

uint64_t asdtNextPowerState(uint64_t a1, int a2)
{
  uint64_t v2 = a1;
  int v3 = asdtPowerTransitionForStateChange(a1, a2);
  if (v3 > 1937008995)
  {
    if (v3 > 1970304876)
    {
      if (v3 != 1970304877)
      {
        if (v3 == 1970435438) {
          return 1920298606;
        }
        if (v3 != 1970563428) {
          return v2;
        }
        return 1768189029;
      }
      return 1886876269;
    }
    if (v3 != 1937008996)
    {
      int v4 = 1970303090;
LABEL_12:
      if (v3 == v4) {
        return 1886413170;
      }
      return v2;
    }
    return 1768189029;
  }
  if (v3 <= 1685092204)
  {
    if (v3 != 1684628588)
    {
      int v4 = 1685090418;
      goto LABEL_12;
    }
    return 1768189029;
  }
  if (v3 == 1685092205) {
    return 1886876269;
  }
  if (v3 == 1685286000) {
    return 1936483696;
  }
  return v2;
}

uint64_t asdtPowerTransitionUpwards(int a1)
{
  uint64_t result = 1;
  if (a1 <= 1685090417)
  {
    if (a1)
    {
      int v3 = 1684628588;
LABEL_7:
      if (a1 != v3) {
        return result;
      }
    }
  }
  else if (a1 != 1685090418 && a1 != 1685286000)
  {
    int v3 = 1685092205;
    goto LABEL_7;
  }
  return 0;
}

uint64_t asdtPowerStateCompare(int a1, int a2)
{
  uint64_t result = asdtPowerTransitionForStateChange(a1, a2);
  if ((int)result <= 1685090417)
  {
    if (!result) {
      return result;
    }
    int v3 = 1684628588;
    goto LABEL_7;
  }
  if (result != 1685090418 && result != 1685092205)
  {
    int v3 = 1685286000;
LABEL_7:
    if (result != v3) {
      return 0xFFFFFFFFLL;
    }
  }
  return 1;
}

uint64_t asdtPowerTransitionsInOrder(int a1, int a2)
{
  int v3 = 1;
  if (a1 <= 1685090417)
  {
    if (a1)
    {
      int v4 = 1684628588;
LABEL_7:
      if (a1 != v4) {
        goto LABEL_9;
      }
    }
  }
  else if (a1 != 1685090418 && a1 != 1685286000)
  {
    int v4 = 1685092205;
    goto LABEL_7;
  }
  int v3 = 0;
LABEL_9:
  int v5 = 1;
  if (a2 <= 1685090417)
  {
    if (a2)
    {
      int v6 = 1684628588;
LABEL_15:
      if (a2 != v6) {
        goto LABEL_17;
      }
    }
  }
  else if (a2 != 1685090418 && a2 != 1685286000)
  {
    int v6 = 1685092205;
    goto LABEL_15;
  }
  int v5 = 0;
LABEL_17:
  unsigned int v7 = asdtPowerTransitionIndex(a1);
  unsigned int v8 = asdtPowerTransitionIndex(a2);
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = v3 ^ v5;
  if (v9) {
    int v10 = 1;
  }
  return (v7 <= v8) & ~v10;
}

uint64_t asdtPowerTransitionIndex(int a1)
{
  if (a1 == 1970435438) {
    int v1 = 4;
  }
  else {
    int v1 = a1 == 1970563428;
  }
  if (a1 == 1970304877) {
    int v2 = 3;
  }
  else {
    int v2 = v1;
  }
  if (a1 == 1970303090) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  if (a1 == 1937008996) {
    int v4 = 1;
  }
  else {
    int v4 = v3;
  }
  if (a1 <= 1970304876) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = v2;
  }
  if (a1 == 1685286000) {
    int v6 = 4;
  }
  else {
    int v6 = 0;
  }
  if (a1 == 1685092205) {
    int v7 = 1;
  }
  else {
    int v7 = v6;
  }
  if (a1 == 1685090418) {
    int v8 = 2;
  }
  else {
    int v8 = 0;
  }
  if (a1 == 1684628588) {
    int v9 = 3;
  }
  else {
    int v9 = v8;
  }
  if (a1 <= 1685092204) {
    unsigned int v10 = v9;
  }
  else {
    unsigned int v10 = v7;
  }
  if (a1 <= 1937008995) {
    return v10;
  }
  else {
    return v5;
  }
}

void sub_2489D9308(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489D97F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489D9ED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_2489DA0E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489DA314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DA4D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DA968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DAFFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_2489DB230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DB2F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DB664(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DB8C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_2489DBA1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DBDB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DC234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DC39C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489DC65C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DC710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489DCC60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_2489DD194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_2489DD344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489DD5B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

void sub_2489DD6F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DD7A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DD878(_Unwind_Exception *a1)
{
  int v4 = v3;

  _Unwind_Resume(a1);
}

void sub_2489DDAF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DDD70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DDF4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DDFDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489DE368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DE578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489DE698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DE7A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DE8FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DEC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_8(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_1_4(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

void sub_2489DF1C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DF248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DF334(_Unwind_Exception *a1)
{
  int v6 = v5;

  _Unwind_Resume(a1);
}

void sub_2489DF45C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DF4C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  unsigned int v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ASDTUserActivityNotifier;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_2489DF550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DF6D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489DF7F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2489DF8E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id ASDT::Acoustic::SpeakerThieleSmallV2::asDictionary(ASDT::Acoustic::SpeakerThieleSmallV2 *this)
{
  int v2 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:10];
  LODWORD(v3) = 1036831949;
  uint64_t v4 = ASDT::Acoustic::scaledValue((ASDT::Acoustic *)*(unsigned __int16 *)this, v3);
  [v2 setObject:v4 forKey:kASDTAcousticKeySpeakerThieleSmallFs];

  LODWORD(v5) = 981668463;
  int v6 = ASDT::Acoustic::scaledValue((ASDT::Acoustic *)*((unsigned __int16 *)this + 1), v5);
  [v2 setObject:v6 forKey:kASDTAcousticKeySpeakerThieleSmallQts];

  LODWORD(v7) = 981668463;
  int v8 = ASDT::Acoustic::scaledValue((ASDT::Acoustic *)*((unsigned __int16 *)this + 2), v7);
  [v2 setObject:v8 forKey:kASDTAcousticKeySpeakerThieleSmallRe];

  LODWORD(v9) = 1008981770;
  unsigned int v10 = ASDT::Acoustic::scaledValue((ASDT::Acoustic *)*((unsigned __int16 *)this + 3), v9);
  [v2 setObject:v10 forKey:kASDTAcousticKeySpeakerThieleSmallT];

  LODWORD(v11) = 1008981770;
  long long v12 = ASDT::Acoustic::scaledValue((ASDT::Acoustic *)*((unsigned __int16 *)this + 4), v11);
  [v2 setObject:v12 forKey:kASDTAcousticKeySpeakerThieleSmallLe];

  LODWORD(v13) = 1.0;
  long long v14 = ASDT::Acoustic::scaledValue((ASDT::Acoustic *)*((unsigned __int16 *)this + 5), v13);
  [v2 setObject:v14 forKey:kASDTAcousticKeySpeakerThieleSmallKms];

  LODWORD(v15) = 953267991;
  long long v16 = ASDT::Acoustic::scaledValue((ASDT::Acoustic *)*((unsigned __int16 *)this + 6), v15);
  [v2 setObject:v16 forKey:kASDTAcousticKeySpeakerThieleSmallMms];

  LODWORD(v17) = 953267991;
  long long v18 = ASDT::Acoustic::scaledValue((ASDT::Acoustic *)*((unsigned __int16 *)this + 7), v17);
  [v2 setObject:v18 forKey:kASDTAcousticKeySpeakerThieleSmallBI];

  LODWORD(v19) = 981668463;
  long long v20 = ASDT::Acoustic::scaledValue((ASDT::Acoustic *)*((unsigned __int16 *)this + 8), v19);
  [v2 setObject:v20 forKey:kASDTAcousticKeySpeakerThieleSmallRms];

  long long v21 = [NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)this + 18)];
  [v2 setObject:v21 forKey:kASDTAcousticKeySpeakerThieleSmallDataSourceID];

  long long v22 = (void *)[v2 copy];
  return v22;
}

void sub_2489E0254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ASDT::Acoustic::Data<ASDT::Acoustic::SpeakerThieleSmallV2,(unsigned short)2>::entries(unsigned __int8 *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unsigned int v2 = a1[3];
  if (!a1[3]) {
    unsigned int v2 = (((((unint64_t)a1[2] - 6) * (unsigned __int128)0x2E8BA2E8BA2E8BA3uLL) >> 64) >> 2);
  }
  uint64_t v3 = v2;
  uint64_t v4 = [MEMORY[0x263EFF980] arrayWithCapacity:v2];
  if (v3)
  {
    uint64_t v6 = 0;
    double v7 = (ASDT::Acoustic::SpeakerThieleSmallV2 *)(a1 + 4);
    *(void *)&long long v5 = 67109120;
    long long v12 = v5;
    do
    {
      int v8 = ASDT::Acoustic::SpeakerThieleSmallV2::asDictionary(v7);
      if (!v8)
      {
        double v9 = ASDTBaseLogType();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::string buf = v12;
          int v14 = v6;
          _os_log_error_impl(&dword_2489BC000, v9, OS_LOG_TYPE_ERROR, "Failed to create SpeakerThieleSmall data entry at index %hhu!", buf, 8u);
        }
      }
      objc_msgSend(v4, "addObject:", v8, v12);

      ++v6;
      double v7 = (ASDT::Acoustic::SpeakerThieleSmallV2 *)((char *)v7 + 22);
    }
    while (v3 != v6);
  }
  unsigned int v10 = (void *)[v4 copy];

  return v10;
}

void sub_2489E045C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t ASDT::Acoustic::Base::valid(ASDT::Acoustic::Base *this, unint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (a3 + 6 > a2 || (v8 = (unsigned __int8 *)this + 2, unint64_t v7 = *((unsigned __int8 *)this + 2), v7 < a3))
  {
    double v9 = ASDTBaseLogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      ASDT::Acoustic::Base::valid((uint64_t)this, a2, v9);
    }
    goto LABEL_5;
  }
  if (*(unsigned __int16 *)this != a4)
  {
    double v9 = ASDTBaseLogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      ASDT::Acoustic::Base::valid((uint64_t)this, a4, v9);
    }
    goto LABEL_5;
  }
  unint64_t v12 = *((unsigned __int8 *)this + 3);
  if (v7 == a2 || v12 == 0)
  {
    unint64_t v14 = (v7 - 6) % a3;
    if (v7 != a2 || v14)
    {
      double v9 = ASDTBaseLogType();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v21 = *v8;
        int v29 = 67109632;
        int v30 = v21;
        __int16 v31 = 2048;
        unint64_t v32 = a2;
        __int16 v33 = 2048;
        unint64_t v34 = v14;
        long long v20 = "Unexpected size: Found 0x%hhx, expected: 0x%zx, remainder: 0x%zx";
        goto LABEL_27;
      }
LABEL_5:

      return 0;
    }
    if (*((unsigned char *)this + 3)) {
      char v15 = *((unsigned char *)this + 3);
    }
    else {
      char v15 = (v7 - 6) / a3;
    }
  }
  else
  {
    unint64_t v16 = (a2 - 6) / a3;
    unint64_t v17 = (a2 - 6) % a3;
    if (v16 != v12 || v17 != 0)
    {
      double v9 = ASDTBaseLogType();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v19 = *((unsigned __int8 *)this + 3);
        int v29 = 67109632;
        int v30 = v19;
        __int16 v31 = 2048;
        unint64_t v32 = v16;
        __int16 v33 = 2048;
        unint64_t v34 = v17;
        long long v20 = "Unexpected number of entries: Found 0x%hhx, expected: 0x%zx, remainder: 0x%zx";
LABEL_27:
        _os_log_error_impl(&dword_2489BC000, v9, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v29, 0x1Cu);
        goto LABEL_5;
      }
      goto LABEL_5;
    }
    char v15 = *((unsigned char *)this + 3);
    if (v7 != a3)
    {
      double v9 = ASDTBaseLogType();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        ASDT::Acoustic::Base::valid((uint64_t)this + 2, a3, v9);
      }
      goto LABEL_5;
    }
  }
  unsigned __int8 v22 = v15 * a3 + 4;
  if (v15 * (_BYTE)a3 == 0xFC)
  {
    int v23 = 0;
  }
  else
  {
    int v23 = 0;
    long long v24 = (ASDT::Acoustic::Base *)((char *)this + v22);
    long long v25 = this;
    do
    {
      int v26 = *(unsigned __int8 *)v25;
      long long v25 = (ASDT::Acoustic::Base *)((char *)v25 + 1);
      v23 += v26;
    }
    while (v25 < v24);
  }
  int v27 = -v23;
  if (!*((unsigned char *)this + 3)) {
    unint64_t v12 = (v7 - 6) / a3;
  }
  uint64_t v28 = *(unsigned __int16 *)((char *)this + (v12 * a3 + 4));
  if (v28 != (unsigned __int16)v27)
  {
    double v9 = ASDTBaseLogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      ASDT::Acoustic::Base::valid(v28, (unsigned __int16)v27, v9);
    }
    goto LABEL_5;
  }
  return 1;
}

void sub_2489E0734(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_1_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

id ASDT::Acoustic::TrimGainV2::asDictionary(ASDT::Acoustic::TrimGainV2 *this)
{
  unsigned int v2 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  LODWORD(v3) = 1036831949;
  uint64_t v4 = ASDT::Acoustic::scaledValue((ASDT::Acoustic *)*(__int16 *)this, v3);
  [v2 setObject:v4 forKey:kASDTAcousticKeyTrimGainDb];

  long long v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)this + 2)];
  [v2 setObject:v5 forKey:kASDTAcousticKeyTrimGainDataSourceID];

  uint64_t v6 = (void *)[v2 copy];
  return v6;
}

void sub_2489E0A8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ASDT::Acoustic::Data<ASDT::Acoustic::TrimGainV2,(unsigned short)2>::entries(unsigned __int8 *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unsigned int v2 = a1[3];
  if (!a1[3]) {
    unsigned int v2 = (((((unint64_t)a1[2] - 6) * (unsigned __int128)0xAAAAAAAAAAAAAAABLL) >> 64) >> 2);
  }
  uint64_t v3 = v2;
  uint64_t v4 = [MEMORY[0x263EFF980] arrayWithCapacity:v2];
  if (v3)
  {
    uint64_t v6 = 0;
    unint64_t v7 = (ASDT::Acoustic::TrimGainV2 *)(a1 + 4);
    *(void *)&long long v5 = 67109120;
    long long v12 = v5;
    do
    {
      int v8 = ASDT::Acoustic::TrimGainV2::asDictionary(v7);
      if (!v8)
      {
        double v9 = ASDTBaseLogType();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::string buf = v12;
          int v14 = v6;
          _os_log_error_impl(&dword_2489BC000, v9, OS_LOG_TYPE_ERROR, "Failed to create SpeakerThieleSmall data entry at index %hhu!", buf, 8u);
        }
      }
      objc_msgSend(v4, "addObject:", v8, v12);

      ++v6;
      unint64_t v7 = (ASDT::Acoustic::TrimGainV2 *)((char *)v7 + 6);
    }
    while (v3 != v6);
  }
  unsigned int v10 = (void *)[v4 copy];

  return v10;
}

void sub_2489E0C80(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

ASDT::Exclaves::Sensor *ASDT::Exclaves::Sensor::Sensor(ASDT::Exclaves::Sensor *this, char *a2)
{
  *((_DWORD *)this + 2) = 0;
  uint64_t v3 = (_DWORD *)((char *)this + 8);
  *(void *)this = &unk_26FCA65C8;
  uint64_t v4 = (const std::string *)((char *)this + 16);
  if (!a2) {
    a2 = "";
  }
  std::string::basic_string[abi:ne180100]<0>((void *)this + 2, a2);
  *((void *)this + 7) = 850045863;
  *((void *)this + 5) = 0;
  *((_DWORD *)this + 12) = 0;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((void *)this + 14) = 0;
  if (*((char *)this + 39) < 0)
  {
    if (!*((void *)this + 3)) {
      return this;
    }
  }
  else if (!*((unsigned char *)this + 39))
  {
    return this;
  }
  std::string::size_type v5 = std::string::rfind(v4, 46, 0xFFFFFFFFFFFFFFFFLL);
  if (v5 == -2) {
    std::string::size_type v6 = 0;
  }
  else {
    std::string::size_type v6 = v5 + 1;
  }
  std::string::basic_string(&__p, v4, v6, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v14);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  *(void *)__dst = 0;
  strlcpy(__dst, (const char *)p_p, 9uLL);
  uint64_t v13 = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  *((void *)this + 5) = *(void *)__dst;
  if (asdt_exclaves_available())
  {
    if (exclaves_sensor_create() || !*v3)
    {
      int v8 = ASDTBaseLogType();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        ASDT::Exclaves::Sensor::Sensor();
      }
      *uint64_t v3 = 0;
    }
  }
  else
  {
    double v9 = ASDTBaseLogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      ASDT::Exclaves::Sensor::Sensor(v9);
    }
  }
  return this;
}

void sub_2489E1608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  std::mutex::~mutex(v16);
  if (*(char *)(v14 + 39) < 0) {
    operator delete(*v15);
  }
  _Unwind_Resume(a1);
}

void ASDT::Exclaves::Sensor::~Sensor(ASDT::Exclaves::Sensor *this)
{
  *(void *)this = &unk_26FCA65C8;
  mach_port_name_t v2 = *((_DWORD *)this + 2);
  if (v2) {
    mach_port_deallocate(*MEMORY[0x263EF8960], v2);
  }
  std::mutex::~mutex((std::mutex *)((char *)this + 56));
  if (*((char *)this + 39) < 0) {
    operator delete(*((void **)this + 2));
  }
}

{
  uint64_t vars8;

  ASDT::Exclaves::Sensor::~Sensor(this);
  JUMPOUT(0x24C587580);
}

void ASDT::Exclaves::Sensor::Create(ASDT::Exclaves::Sensor *this, const char *a2)
{
}

void sub_2489E175C(_Unwind_Exception *a1)
{
  MEMORY[0x24C587580](v1, 0x1093C408FC70230);
  _Unwind_Resume(a1);
}

uint64_t ASDT::Exclaves::Sensor::Start(uint64_t a1, _DWORD *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = (std::mutex *)(a1 + 56);
  std::mutex::lock((std::mutex *)(a1 + 56));
  if (*(_DWORD *)(a1 + 8))
  {
    int v5 = *(_DWORD *)(a1 + 48);
    if (v5 < 1)
    {
      uint64_t Status = exclaves_sensor_start();
      if (Status)
      {
        *a2 = 0;
        unint64_t v7 = ASDTBaseLogType();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v8 = (void *)(a1 + 16);
          if (*(char *)(a1 + 39) < 0) {
            int v8 = (void *)*v8;
          }
          *(_DWORD *)std::string buf = 136315650;
          double v11 = v8;
          __int16 v12 = 1024;
          int v13 = 1;
          __int16 v14 = 1024;
          int v15 = Status;
          _os_log_error_impl(&dword_2489BC000, v7, OS_LOG_TYPE_ERROR, "Sensor::Start: Failed: name: %s, status: %u, ret: %x", buf, 0x18u);
        }
      }
      else
      {
        *(_DWORD *)(a1 + 48) = 1;
        uint64_t Status = ASDT::Exclaves::Sensor::ConvertStatus(1, a2);
      }
      kdebug_trace();
    }
    else
    {
      *(_DWORD *)(a1 + 48) = v5 + 1;
      uint64_t Status = ASDT::Exclaves::Sensor::DoGetStatus(a1, a2);
    }
  }
  else
  {
    *a2 = 0;
    uint64_t Status = 29;
  }
  std::mutex::unlock(v4);
  return Status;
}

void sub_2489E190C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::Exclaves::Sensor::DoGetStatus(uint64_t a1, _DWORD *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = exclaves_sensor_status();
  if (v4)
  {
    uint64_t v5 = v4;
    *a2 = 0;
    std::string::size_type v6 = ASDTBaseLogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      unint64_t v7 = (void *)(a1 + 16);
      if (*(char *)(a1 + 39) < 0) {
        unint64_t v7 = (void *)*v7;
      }
      *(_DWORD *)std::string buf = 136315650;
      unsigned int v10 = v7;
      __int16 v11 = 1024;
      int v12 = 1;
      __int16 v13 = 1024;
      int v14 = v5;
      _os_log_error_impl(&dword_2489BC000, v6, OS_LOG_TYPE_ERROR, "Sensor::GetStatus: Failed: name: %s, status: %u, ret: %x", buf, 0x18u);
    }
  }
  else
  {
    uint64_t v5 = ASDT::Exclaves::Sensor::ConvertStatus(1, a2);
  }
  kdebug_trace();
  return v5;
}

uint64_t ASDT::Exclaves::Sensor::ConvertStatus(int a1, _DWORD *a2)
{
  int v3 = a1;
  if ((a1 - 1) >= 4)
  {
    uint64_t v5 = ASDTBaseLogType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ASDT::Exclaves::Sensor::ConvertStatus();
    }
    int v3 = 0;
    uint64_t result = 18;
  }
  else
  {
    uint64_t result = 0;
  }
  *a2 = v3;
  return result;
}

uint64_t ASDT::Exclaves::Sensor::Stop(uint64_t a1, _DWORD *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = (std::mutex *)(a1 + 56);
  std::mutex::lock((std::mutex *)(a1 + 56));
  if (*(_DWORD *)(a1 + 8))
  {
    int v5 = *(_DWORD *)(a1 + 48);
    if (v5 == 1)
    {
      uint64_t Status = exclaves_sensor_stop();
      if (Status)
      {
        *a2 = 0;
        unint64_t v7 = ASDTBaseLogType();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v8 = (void *)(a1 + 16);
          if (*(char *)(a1 + 39) < 0) {
            int v8 = (void *)*v8;
          }
          *(_DWORD *)std::string buf = 136315650;
          __int16 v11 = v8;
          __int16 v12 = 1024;
          int v13 = 1;
          __int16 v14 = 1024;
          int v15 = Status;
          _os_log_error_impl(&dword_2489BC000, v7, OS_LOG_TYPE_ERROR, "Sensor::Stop: Failed: name: %s, status: %u, ret: %x", buf, 0x18u);
        }
      }
      else
      {
        *(_DWORD *)(a1 + 48) = 0;
        uint64_t Status = ASDT::Exclaves::Sensor::ConvertStatus(1, a2);
      }
      kdebug_trace();
    }
    else
    {
      if (v5 >= 2) {
        *(_DWORD *)(a1 + 48) = v5 - 1;
      }
      uint64_t Status = ASDT::Exclaves::Sensor::DoGetStatus(a1, a2);
    }
  }
  else
  {
    *a2 = 0;
    uint64_t Status = 29;
  }
  std::mutex::unlock(v4);
  return Status;
}

void sub_2489E1C64(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::Exclaves::Sensor::GetStatus(uint64_t a1, _DWORD *a2)
{
  uint64_t v4 = (std::mutex *)(a1 + 56);
  std::mutex::lock((std::mutex *)(a1 + 56));
  if (*(_DWORD *)(a1 + 8)) {
    uint64_t Status = ASDT::Exclaves::Sensor::DoGetStatus(a1, a2);
  }
  else {
    uint64_t Status = 29;
  }
  std::mutex::unlock(v4);
  return Status;
}

void sub_2489E1CE4(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

const char *ASDT::Exclaves::Sensor::StatusString(int a1)
{
  if ((a1 - 1) > 3) {
    return "Undefined";
  }
  else {
    return off_265243F08[a1 - 1];
  }
}

unint64_t ASDT::IOAudio2::Helpers::Fixed64FromFloat64(ASDT::IOAudio2::Helpers *this, double a2)
{
  return vcvtd_n_u64_f64(a2 - floor(a2), 0x20uLL) + (vcvtmd_u64_f64(a2) << 32);
}

double ASDT::IOAudio2::Helpers::Float64FromFixed64(uint64_t this)
{
  return (double)this * 2.32830644e-10 + (double)(this >> 32);
}

__n128 ASDT::IOAudio2::Helpers::AudioStreamBasicDescriptionToIOAudio2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 32);
  *(void *)a2 = vcvtd_n_u64_f64(*(double *)a1 - floor(*(double *)a1), 0x20uLL) + (vcvtmd_u64_f64(*(double *)a1) << 32);
  __n128 result = *(__n128 *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  *(void *)(a2 + 24) = v4;
  *(void *)(a2 + 32) = v2;
  return result;
}

__n128 ASDT::IOAudio2::Helpers::AudioStreamBasicDescriptionFromIOAudio2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 32);
  *(double *)a2 = (double)*(void *)a1 * 2.32830644e-10 + (double)(*(uint64_t *)a1 >> 32);
  __n128 result = *(__n128 *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  *(void *)(a2 + 24) = v4;
  *(void *)(a2 + 32) = v2;
  return result;
}

float CACFNumber::GetFixed32(const __CFNumber **this)
{
  int valuePtr = 0;
  CFNumberRef v1 = *this;
  if (v1)
  {
    CFNumberGetValue(v1, kCFNumberSInt32Type, &valuePtr);
    int v2 = valuePtr;
    float v3 = 1.0;
    if (valuePtr < 0) {
      float v3 = -1.0;
    }
  }
  else
  {
    int v2 = 0;
    float v3 = 1.0;
  }
  return v3
       * (float)((float)((float)(unsigned __int16)(v2 * (int)v3) * 0.000015259)
               + (float)(((v2 * (int)v3) >> 16) & 0x7FFF));
}

double CACFNumber::GetFixed64(const __CFNumber **this)
{
  uint64_t valuePtr = 0;
  CFNumberRef v1 = *this;
  if (v1)
  {
    CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
    uint64_t v2 = valuePtr;
    double v3 = 1.0;
    if (valuePtr < 0) {
      double v3 = -1.0;
    }
  }
  else
  {
    uint64_t v2 = 0;
    double v3 = 1.0;
  }
  return v3
       * ((double)(v2 * (uint64_t)v3) * 2.32830644e-10
        + (double)(((unint64_t)(v2 * (uint64_t)v3) >> 32) & 0x7FFFFFFF));
}

void CACFNumber::PrintToLog(CACFNumber *this, const __CFNumber *a2)
{
  LODWORD(v2) = a2;
  uint64_t v14 = *MEMORY[0x263EF8340];
  CFNumberType Type = CFNumberGetType(this);
  if (v2)
  {
    uint64_t v2 = v2;
    memset(__b, 9, v2);
  }
  else
  {
    uint64_t v2 = 0;
  }
  __b[v2] = 0;
  switch(Type)
  {
    case kCFNumberSInt8Type:
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315394;
        unsigned int v10 = __b;
        __int16 v11 = 1024;
        LODWORD(v12) = SLOBYTE(valuePtr);
        int v5 = &_os_log_internal;
        std::string::size_type v6 = " %s%i";
        goto LABEL_15;
      }
      break;
    case kCFNumberSInt16Type:
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315394;
        unsigned int v10 = __b;
        __int16 v11 = 1024;
        LODWORD(v12) = SLOWORD(valuePtr);
        int v5 = &_os_log_internal;
        std::string::size_type v6 = " %s%i";
        goto LABEL_15;
      }
      break;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      CFNumberGetValue(this, kCFNumberSInt64Type, &valuePtr);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      break;
    case kCFNumberFloat32Type:
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315394;
        unsigned int v10 = __b;
        __int16 v11 = 2048;
        double v12 = *(float *)&valuePtr;
        int v5 = &_os_log_internal;
        std::string::size_type v6 = " %s%f";
        goto LABEL_24;
      }
      break;
    case kCFNumberFloat64Type:
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315394;
        unsigned int v10 = __b;
        __int16 v11 = 2048;
        double v12 = valuePtr;
        int v5 = &_os_log_internal;
        std::string::size_type v6 = " %s%f";
        goto LABEL_24;
      }
      break;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      CFNumberGetValue(this, kCFNumberLongType, &valuePtr);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      break;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      CFNumberGetValue(this, kCFNumberLongLongType, &valuePtr);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
LABEL_17:
        *(_DWORD *)std::string buf = 136315394;
        unsigned int v10 = __b;
        __int16 v11 = 2048;
        double v12 = valuePtr;
        int v5 = &_os_log_internal;
        std::string::size_type v6 = " %s%lli";
        goto LABEL_24;
      }
      break;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      CFNumberGetValue(this, kCFNumberCFIndexType, &valuePtr);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
LABEL_23:
        *(_DWORD *)std::string buf = 136315394;
        unsigned int v10 = __b;
        __int16 v11 = 2048;
        double v12 = valuePtr;
        int v5 = &_os_log_internal;
        std::string::size_type v6 = " %s%li";
LABEL_24:
        uint32_t v7 = 22;
        goto LABEL_25;
      }
      break;
    default:
      LODWORD(valuePtr) = 0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315394;
        unsigned int v10 = __b;
        __int16 v11 = 1024;
        LODWORD(v12) = LODWORD(valuePtr);
        int v5 = &_os_log_internal;
        std::string::size_type v6 = " %s%i";
LABEL_15:
        uint32_t v7 = 18;
LABEL_25:
        _os_log_impl(&dword_2489BC000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, v7);
      }
      break;
  }
}

void CACFBoolean::PrintToLog(CACFBoolean *this, const __CFBoolean *a2)
{
  LODWORD(v2) = a2;
  uint64_t v10 = *MEMORY[0x263EF8340];
  int Value = CFBooleanGetValue(this);
  if (v2)
  {
    uint64_t v2 = v2;
    memset(__b, 9, v2);
  }
  else
  {
    uint64_t v2 = 0;
  }
  __b[v2] = 0;
  BOOL v4 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (Value)
  {
    if (!v4) {
      return;
    }
    int v7 = 136315138;
    int v8 = __b;
    int v5 = &_os_log_internal;
    std::string::size_type v6 = " %strue";
  }
  else
  {
    if (!v4) {
      return;
    }
    int v7 = 136315138;
    int v8 = __b;
    int v5 = &_os_log_internal;
    std::string::size_type v6 = " %sfalse";
  }
  _os_log_impl(&dword_2489BC000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 0xCu);
}

void LogError(const char *a1, ...)
{
  va_start(va, a1);
  vsyslog(3, a1, va);
}

void LogWarning(const char *a1, ...)
{
  va_start(va, a1);
  vsyslog(4, a1, va);
}

uint64_t ASDTTime::ASDTTime(uint64_t a1, uint64_t a2, __int16 a3, __int16 a4)
{
  uint64_t v8 = __divti3();
  if (__CFADD__(v8, (unint64_t)(v9 >> 63) >> 48)) {
    uint64_t v10 = v9 + 1;
  }
  else {
    uint64_t v10 = v9;
  }
  *((void *)&v11 + 1) = v10;
  *(void *)&long long v11 = v8 + ((unint64_t)(v9 >> 63) >> 48);
  *(void *)a1 = v11 >> 16;
  *(void *)(a1 + 8) = a2;
  *(_WORD *)(a1 + 16) = a3;
  *(_WORD *)(a1 + 18) = a4;
  *(_DWORD *)(a1 + 20) = 0;
  return a1;
}

void ASDTTime::ASDTTime(uint64_t a1, ASDTTime *this, __int16 a3, unsigned __int16 *a4)
{
  *(void *)(a1 + 8) = 0;
  *(void *)a1 = this;
  *(_WORD *)(a1 + 16) = 0;
  *(_WORD *)(a1 + 18) = a3;
  *(_DWORD *)(a1 + 20) = 0;
}

{
  *(void *)(a1 + 8) = 0;
  *(void *)a1 = this;
  *(_WORD *)(a1 + 16) = 0;
  *(_WORD *)(a1 + 18) = a3;
  *(_DWORD *)(a1 + 20) = 0;
}

uint64_t anonymous namespace'::NsecToHost(_anonymous_namespace_ *this, void *a2, uint64_t *a3, unsigned __int16 *a4)
{
  uint64_t result = __divti3();
  *((void *)&v8 + 1) = v7;
  *(void *)&long long v8 = result;
  *a2 = v8 >> 16;
  *(_WORD *)a3 = result;
  return result;
}

uint64_t ASDTTime::operator+=(_anonymous_namespace_ **a1, uint64_t *a2, uint64_t a3, unsigned __int16 *a4)
{
  uint64_t v5 = *a2;
  std::string::size_type v6 = a1 + 1;
  uint64_t v7 = (_anonymous_namespace_ *)((char *)*a1 + v5);
  *a1 = v7;
}

uint64_t ASDTTime::operator-=(_anonymous_namespace_ **a1, uint64_t *a2, uint64_t a3, unsigned __int16 *a4)
{
  uint64_t v5 = *a2;
  std::string::size_type v6 = a1 + 1;
  uint64_t v7 = (_anonymous_namespace_ *)((char *)*a1 - v5);
  *a1 = v7;
}

uint64_t ASDTTime::operator*=(void *a1, uint64_t *a2, uint64_t a3, unsigned __int16 *a4)
{
  uint64_t v5 = *a2;
  std::string::size_type v6 = a1 + 1;
  uint64_t v7 = (_anonymous_namespace_ *)(*a1 * v5);
  *a1 = v7;
}

uint64_t ASDTTime::operator/=(uint64_t *a1, uint64_t *a2, uint64_t a3, unsigned __int16 *a4)
{
  uint64_t v5 = *a2;
  std::string::size_type v6 = a1 + 1;
  uint64_t v7 = *a1 / v5;
  *a1 = v7;
}

uint64_t ASDTTime::machAbsoluteTime@<X0>(ASDTTime *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = mach_absolute_time();
  return ASDTTime::ASDTTime(a2, v3, 0, 1);
}

uint64_t ASDTTime::future@<X0>(ASDTTime *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = this;
  uint64_t v3 = mach_absolute_time();
  ASDTTime::ASDTTime((uint64_t)&v7, v3, 0, 1);
  *(_OWORD *)a2 = v7;
  *(void *)(a2 + 16) = v8;
  return ASDTTime::operator+=<unsigned long long>((_anonymous_namespace_ **)a2, (_anonymous_namespace_ **)&v9, v4, v5);
}

uint64_t ASDTTime::futureUSecs@<X0>(ASDTTime *this@<X0>, uint64_t a2@<X8>)
{
  return ASDTTime::future((ASDTTime *)((double)(unint64_t)this * 1000.0), a2);
}

{
  return ASDTTime::future((ASDTTime *)((double)(uint64_t)((unint64_t)this & ~((uint64_t)this >> 63)) * 1000.0), a2);
}

{
  return ASDTTime::future((ASDTTime *)(1000 * this), a2);
}

{
  return ASDTTime::future((ASDTTime *)(1000 * (this & ~((int)this >> 31))), a2);
}

uint64_t ASDTTime::futureUSecs@<X0>(ASDTTime *this@<X0>, double a2@<D0>, uint64_t a3@<X8>)
{
  double v3 = a2 * 1000.0;
  BOOL v4 = a2 < 0.0;
  double v5 = 0.0;
  if (!v4) {
    double v5 = v3;
  }
  return ASDTTime::future((ASDTTime *)v5, a3);
}

uint64_t ASDTTime::futureSecs@<X0>(ASDTTime *this@<X0>, uint64_t a2@<X8>)
{
  return ASDTTime::future((ASDTTime *)(1000000000 * (void)this), a2);
}

{
  return ASDTTime::future((ASDTTime *)(1000000000 * ((unint64_t)this & ~((uint64_t)this >> 63))), a2);
}

{
  return ASDTTime::future((ASDTTime *)(1000000000 * this), a2);
}

{
  return ASDTTime::future((ASDTTime *)(1000000000 * (this & ~((int)this >> 31))), a2);
}

uint64_t ASDTTime::futureSecs@<X0>(ASDTTime *this@<X0>, double a2@<D0>, uint64_t a3@<X8>)
{
  double v3 = a2 * 1000000000.0;
  BOOL v4 = a2 < 0.0;
  double v5 = 0.0;
  if (!v4) {
    double v5 = v3;
  }
  return ASDTTime::future((ASDTTime *)v5, a3);
}

uint64_t ___ZN12_GLOBAL__N_115GetTimebaseInfoEv_block_invoke()
{
}

uint64_t ASDTTime::operator+=<unsigned long long>(_anonymous_namespace_ **a1, _anonymous_namespace_ **a2, uint64_t a3, unsigned __int16 *a4)
{
  uint64_t v8 = *a2;
  std::string::size_type v6 = (_anonymous_namespace_ *)((char *)v8 + (void)*a1);
  *a1 = v6;
}

double ASDT::VolumeCurve::VolumeCurve(ASDT::VolumeCurve *this)
{
  *(_DWORD *)this = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 1) = (char *)this + 16;
  *((unsigned char *)this + 32) = 1;
  *((_DWORD *)this + 9) = 5;
  double result = 0.00781250186;
  *((void *)this + 5) = 0x3F80000040000000;
  return result;
}

{
  double result;

  *(_DWORD *)this = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 1) = (char *)this + 16;
  *((unsigned char *)this + 32) = 1;
  *((_DWORD *)this + 9) = 5;
  double result = 0.00781250186;
  *((void *)this + 5) = 0x3F80000040000000;
  return result;
}

uint64_t ASDT::VolumeCurve::GetMinimumRaw(ASDT::VolumeCurve *this)
{
  if (*((void *)this + 3)) {
    return *(unsigned int *)(*((void *)this + 1) + 28);
  }
  else {
    return 0;
  }
}

uint64_t ASDT::VolumeCurve::GetMaximumRaw(ASDT::VolumeCurve *this)
{
  uint64_t v1 = *((void *)this + 3);
  if (!v1) {
    return 0;
  }
  double v3 = (void *)*((void *)this + 1);
  std::__advance[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<ASDT::RawPoint,ASDT::DBPoint>,std::__tree_node<std::__value_type<ASDT::RawPoint,ASDT::DBPoint>,void *> *,long>>>(&v3, (int)v1 - 1);
  return *((unsigned int *)v3 + 8);
}

double ASDT::VolumeCurve::GetMinimumDB(ASDT::VolumeCurve *this)
{
  if (!*((void *)this + 3)) {
    return 0.0;
  }
  LODWORD(result) = *(_DWORD *)(*((void *)this + 1) + 36);
  return result;
}

double ASDT::VolumeCurve::GetMaximumDB(ASDT::VolumeCurve *this)
{
  uint64_t v1 = *((void *)this + 3);
  if (!v1) {
    return 0.0;
  }
  double v3 = (void *)*((void *)this + 1);
  std::__advance[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<ASDT::RawPoint,ASDT::DBPoint>,std::__tree_node<std::__value_type<ASDT::RawPoint,ASDT::DBPoint>,void *> *,long>>>(&v3, (int)v1 - 1);
  LODWORD(result) = *((_DWORD *)v3 + 10);
  return result;
}

uint64_t ASDT::VolumeCurve::SetTransferFunction(uint64_t this, signed int a2)
{
  *(_DWORD *)(this + 36) = a2;
  if (a2 > 0xF)
  {
    float v4 = 1.0;
    float v3 = 2.0;
    char v2 = 1;
  }
  else
  {
    char v2 = byte_248A06A00[a2];
    float v3 = flt_248A06A10[a2];
    float v4 = flt_248A06A50[a2];
  }
  *(unsigned char *)(this + 32) = v2;
  *(float *)(this + 40) = v3;
  *(float *)(this + 44) = v4;
  return this;
}

void ASDT::VolumeCurve::AddRange(ASDT::VolumeCurve *this, signed int a2, signed int a3, float a4, float a5)
{
  long long v7 = (uint64_t **)*((void *)this + 1);
  double v5 = (uint64_t **)((char *)this + 8);
  std::string::size_type v6 = v7;
  if (v7 == v5 + 1) {
    goto LABEL_25;
  }
  do
  {
    int v8 = *((_DWORD *)v6 + 7);
    BOOL v9 = *((_DWORD *)v6 + 8) > a2 && v8 < a3;
    char v10 = v9;
    if (v9 || v8 <= a2)
    {
      double v12 = v6;
    }
    else
    {
      long long v11 = v6[1];
      if (v11)
      {
        do
        {
          double v12 = (uint64_t **)v11;
          long long v11 = (uint64_t *)*v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          double v12 = (uint64_t **)v6[2];
          BOOL v13 = *v12 == (uint64_t *)v6;
          std::string::size_type v6 = v12;
        }
        while (!v13);
      }
    }
    if (v12 == v5 + 1) {
      char v14 = 1;
    }
    else {
      char v14 = v10;
    }
    if (v14) {
      break;
    }
    std::string::size_type v6 = v12;
  }
  while (v8 > a2);
  if ((v10 & 1) == 0)
  {
LABEL_25:
    unint64_t v16 = __PAIR64__(a3, a2);
    float v17 = a4;
    float v18 = a5;
    std::__tree<std::__value_type<ASDT::RawPoint,ASDT::DBPoint>,std::__map_value_compare<ASDT::RawPoint,std::__value_type<ASDT::RawPoint,ASDT::DBPoint>,std::less<ASDT::RawPoint>,true>,std::allocator<std::__value_type<ASDT::RawPoint,ASDT::DBPoint>>>::__emplace_unique_key_args<ASDT::RawPoint,std::pair<ASDT::RawPoint const,ASDT::DBPoint>>(v5, (int *)&v16, (uint64_t *)&v16);
  }
  else
  {
    int v15 = ASDTBaseLogType();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      ASDT::VolumeCurve::AddRange(v15);
    }
  }
}

void ASDT::VolumeCurve::ResetRange(ASDT::VolumeCurve *this)
{
  uint64_t v1 = (void *)((char *)this + 16);
  std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::destroy((uint64_t)this + 8, *((void **)this + 2));
  *(v1 - 1) = v1;
  *uint64_t v1 = 0;
  v1[1] = 0;
}

BOOL ASDT::VolumeCurve::CheckForContinuity(ASDT::VolumeCurve *this)
{
  uint64_t v1 = (char *)*((void *)this + 1);
  char v2 = (char *)this + 16;
  if (v1 == (char *)this + 16) {
    return 1;
  }
  int v3 = *((_DWORD *)v1 + 7);
  float v4 = *((float *)v1 + 9);
  do
  {
    double v5 = (char *)*((void *)v1 + 1);
    std::string::size_type v6 = v1;
    if (v5)
    {
      do
      {
        long long v7 = v5;
        double v5 = *(char **)v5;
      }
      while (v5);
    }
    else
    {
      do
      {
        long long v7 = (char *)*((void *)v6 + 2);
        BOOL v10 = *(void *)v7 == (void)v6;
        std::string::size_type v6 = v7;
      }
      while (!v10);
    }
    int v8 = *((_DWORD *)v1 + 7);
    float v9 = *((float *)v1 + 9);
    BOOL v10 = v4 == v9 && v3 == v8;
    BOOL result = v10;
    if (v7 == v2) {
      break;
    }
    int v3 = v3 - v8 + *((_DWORD *)v1 + 8);
    float v4 = v4 + (float)(*((float *)v1 + 10) - v9);
    uint64_t v1 = v7;
  }
  while (result);
  return result;
}

uint64_t ASDT::VolumeCurve::ConvertDBToRaw(ASDT::VolumeCurve *this, float a2)
{
  if (*((void *)this + 3)) {
    float v4 = *(float *)(*((void *)this + 1) + 36);
  }
  else {
    float v4 = 0.0;
  }
  double MaximumDB = ASDT::VolumeCurve::GetMaximumDB(this);
  if (v4 <= a2) {
    float v6 = a2;
  }
  else {
    float v6 = v4;
  }
  if (v6 <= *(float *)&MaximumDB) {
    *(float *)&double MaximumDB = v6;
  }
  long long v7 = (void *)*((void *)this + 1);
  uint64_t result = *((unsigned int *)v7 + 7);
  if (v7 != (void *)((char *)this + 16))
  {
    do
    {
      int v9 = *((_DWORD *)v7 + 8) - *((_DWORD *)v7 + 7);
      float v10 = *((float *)v7 + 10);
      if (*(float *)&MaximumDB <= v10) {
        int v9 = llroundf((float)(*(float *)&MaximumDB - *((float *)v7 + 9))/ (float)((float)(v10 - *((float *)v7 + 9)) / (float)v9));
      }
      long long v11 = (void *)v7[1];
      if (v11)
      {
        do
        {
          double v12 = v11;
          long long v11 = (void *)*v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          double v12 = (void *)v7[2];
          BOOL v13 = *v12 == (void)v7;
          long long v7 = v12;
        }
        while (!v13);
      }
      uint64_t result = (v9 + result);
      BOOL v13 = *(float *)&MaximumDB <= v10 || v12 == (void *)((char *)this + 16);
      long long v7 = v12;
    }
    while (!v13);
  }
  return result;
}

uint64_t ASDT::VolumeCurve::ConvertRawToDB(ASDT::VolumeCurve *this, int a2)
{
  if (*((void *)this + 3)) {
    int v4 = *(_DWORD *)(*((void *)this + 1) + 28);
  }
  else {
    int v4 = 0;
  }
  uint64_t result = ASDT::VolumeCurve::GetMaximumRaw(this);
  if (v4 <= a2) {
    int v6 = a2;
  }
  else {
    int v6 = v4;
  }
  if (v6 >= (int)result) {
    int v6 = result;
  }
  int v7 = v6 - v4;
  int v8 = (float *)*((void *)this + 1);
  float v9 = v8[9];
  float v10 = (float *)((char *)this + 16);
  BOOL v11 = v7 < 1 || v8 == v10;
  if (!v11)
  {
    do
    {
      int v12 = *((_DWORD *)v8 + 8) - *((_DWORD *)v8 + 7);
      if (v7 >= v12) {
        int v13 = *((_DWORD *)v8 + 8) - *((_DWORD *)v8 + 7);
      }
      else {
        int v13 = v7;
      }
      char v14 = (float *)*((void *)v8 + 1);
      int v15 = v8;
      if (v14)
      {
        do
        {
          unint64_t v16 = v14;
          char v14 = *(float **)v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          unint64_t v16 = (float *)*((void *)v15 + 2);
          BOOL v11 = *(void *)v16 == (void)v15;
          int v15 = v16;
        }
        while (!v11);
      }
      float v9 = v9 + (float)((float)v13 * (float)((float)(v8[10] - v8[9]) / (float)v12));
      v7 -= v13;
      if (v7 < 1) {
        break;
      }
      int v8 = v16;
    }
    while (v16 != v10);
  }
  return result;
}

float ASDT::VolumeCurve::ConvertRawToScalar(ASDT::VolumeCurve *this, int a2)
{
  if (*((void *)this + 3)) {
    int v4 = *(_DWORD *)(*((void *)this + 1) + 28);
  }
  else {
    int v4 = 0;
  }
  int MaximumRaw = ASDT::VolumeCurve::GetMaximumRaw(this);
  if (v4 <= a2) {
    int v6 = a2;
  }
  else {
    int v6 = v4;
  }
  if (v6 >= MaximumRaw) {
    int v6 = MaximumRaw;
  }
  float v7 = (float)(v6 - v4) / (float)(MaximumRaw - v4);
  if (!ASDT::VolumeCurve::GetIsApplyingTransferFunction(this)) {
    return v7;
  }
  float v8 = *((float *)this + 10) / *((float *)this + 11);
  return powf(v7, v8);
}

BOOL ASDT::VolumeCurve::GetIsApplyingTransferFunction(ASDT::VolumeCurve *this)
{
  if (*((void *)this + 3)) {
    float v2 = *(float *)(*((void *)this + 1) + 36);
  }
  else {
    float v2 = 0.0;
  }
  double MaximumDB = ASDT::VolumeCurve::GetMaximumDB(this);
  return (float)(*(float *)&MaximumDB - v2) > 30.0 && *((unsigned char *)this + 32) != 0;
}

float ASDT::VolumeCurve::ConvertDBToScalar(ASDT::VolumeCurve *this, float a2)
{
  int v3 = ASDT::VolumeCurve::ConvertDBToRaw(this, a2);
  return ASDT::VolumeCurve::ConvertRawToScalar(this, v3);
}

uint64_t ASDT::VolumeCurve::ConvertScalarToRaw(ASDT::VolumeCurve *this, float a2)
{
  float v3 = fmaxf(a2, 0.0);
  if (*((void *)this + 3)) {
    int v4 = *(_DWORD *)(*((void *)this + 1) + 28);
  }
  else {
    int v4 = 0;
  }
  float v5 = fminf(v3, 1.0);
  int MaximumRaw = ASDT::VolumeCurve::GetMaximumRaw(this);
  if (ASDT::VolumeCurve::GetIsApplyingTransferFunction(this)) {
    float v5 = powf(v5, *((float *)this + 11) / *((float *)this + 10));
  }
  return v4 + llroundf(v5 * (float)(MaximumRaw - v4));
}

uint64_t ASDT::VolumeCurve::ConvertScalarToDB(ASDT::VolumeCurve *this, float a2)
{
  int v3 = ASDT::VolumeCurve::ConvertScalarToRaw(this, a2);
  return ASDT::VolumeCurve::ConvertRawToDB(this, v3);
}

void **std::__advance[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<ASDT::RawPoint,ASDT::DBPoint>,std::__tree_node<std::__value_type<ASDT::RawPoint,ASDT::DBPoint>,void *> *,long>>>(void **result, uint64_t a2)
{
  if (a2 < 0)
  {
    float v7 = *result;
    do
    {
      float v8 = (void *)*v7;
      if (*v7)
      {
        do
        {
          int v4 = v8;
          float v8 = (void *)v8[1];
        }
        while (v8);
      }
      else
      {
        do
        {
          int v4 = (void *)v7[2];
          BOOL v5 = *v4 == (void)v7;
          float v7 = v4;
        }
        while (v5);
      }
      float v7 = v4;
    }
    while (!__CFADD__(a2++, 1));
  }
  else
  {
    if (!a2) {
      return result;
    }
    float v2 = *result;
    do
    {
      int v3 = (void *)v2[1];
      if (v3)
      {
        do
        {
          int v4 = v3;
          int v3 = (void *)*v3;
        }
        while (v3);
      }
      else
      {
        do
        {
          int v4 = (void *)v2[2];
          BOOL v5 = *v4 == (void)v2;
          float v2 = v4;
        }
        while (!v5);
      }
      float v2 = v4;
    }
    while (a2-- > 1);
  }
  *uint64_t result = v4;
  return result;
}

uint64_t *std::__tree<std::__value_type<ASDT::RawPoint,ASDT::DBPoint>,std::__map_value_compare<ASDT::RawPoint,std::__value_type<ASDT::RawPoint,ASDT::DBPoint>,std::less<ASDT::RawPoint>,true>,std::allocator<std::__value_type<ASDT::RawPoint,ASDT::DBPoint>>>::__emplace_unique_key_args<ASDT::RawPoint,std::pair<ASDT::RawPoint const,ASDT::DBPoint>>(uint64_t **a1, int *a2, uint64_t *a3)
{
  int v6 = a1 + 1;
  BOOL v5 = a1[1];
  if (v5)
  {
    int v7 = *a2;
    while (1)
    {
      while (1)
      {
        float v8 = (uint64_t **)v5;
        int v9 = *((_DWORD *)v5 + 7);
        if (v7 >= v9) {
          break;
        }
        BOOL v5 = *v8;
        int v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      BOOL v5 = v8[1];
      if (!v5)
      {
        int v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    float v8 = a1 + 1;
LABEL_10:
    float v10 = (uint64_t *)operator new(0x30uLL);
    uint64_t v11 = a3[1];
    *(uint64_t *)((char *)v10 + 28) = *a3;
    *(uint64_t *)((char *)v10 + 36) = v11;
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t asdt_exclaves_available()
{
  if (asdt_exclaves_available_onceToken != -1) {
    dispatch_once(&asdt_exclaves_available_onceToken, &__block_literal_global_4);
  }
  return asdt_exclaves_available_exclaves_available;
}

uint64_t __asdt_exclaves_available_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  asdt_exclaves_available_exclaves_available = result;
  return result;
}

uint64_t ASDT::Acoustic::scaledValue(ASDT::Acoustic *this, double a2)
{
  *(float *)&a2 = (float)this * *(float *)&a2;
  return [NSNumber numberWithFloat:a2];
}

{
  *(float *)&a2 = (float)(int)this * *(float *)&a2;
  return [NSNumber numberWithFloat:a2];
}

void sub_2489E3928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E3BB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ASDTIOSerivceWillTerminateHandler(void *a1, io_object_t a2)
{
  int v3 = a1;
  if (a2)
  {
    uint64_t v4 = IOObjectRetain(a2);
    if (v4)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      unint64_t v16 = std::system_category();
      MEMORY[0x24C5874A0](exception, v4, v16, "Error on Retain");
      __cxa_throw(exception, MEMORY[0x263F8C1A8], MEMORY[0x263F8C0D8]);
    }
    io_object_t v28 = a2;
    io_object_t object = a2;
    uint64_t v5 = IOObjectRetain(a2);
    if (v5)
    {
      float v17 = __cxa_allocate_exception(0x20uLL);
      float v18 = std::system_category();
      MEMORY[0x24C5874A0](v17, v5, v18, "Error on Retain");
      __cxa_throw(v17, MEMORY[0x263F8C1A8], MEMORY[0x263F8C0D8]);
    }
    applesauce::iokit::details::io_services_iterator::io_services_iterator(&v26, &object);
    if (object) {
      IOObjectRelease(object);
    }
    int v6 = (ASDT::IOUserClient *)v27;
    io_object_t v24 = v27;
    if (v27)
    {
      uint64_t v7 = IOObjectRetain(v27);
      if (v7)
      {
        int v19 = __cxa_allocate_exception(0x20uLL);
        long long v20 = std::system_category();
        MEMORY[0x24C5874A0](v19, v7, v20, "Error on Retain");
        __cxa_throw(v19, MEMORY[0x263F8C1A8], MEMORY[0x263F8C0D8]);
      }
      do
      {
        if (IOObjectConformsTo((io_object_t)v6, (const char *)[v3 ioServiceClassNameCStr]))
        {
          float v8 = [v3 delegate];
          ASDT::IOUserClient::CopyProperties(v6, (CFMutableDictionaryRef *)&cf);
          int v9 = (id)cf;
          [v8 ioServiceWillTerminate:v6 withProperties:v9];

          if (cf) {
            CFRelease(cf);
          }
        }
        applesauce::iokit::details::io_services_iterator::operator++(&v26, (applesauce::iokit::details::io_services_iterator *)&v21);
        if (v22) {
          IOObjectRelease(v22);
        }
        if (v21) {
          IOObjectRelease(v21);
        }
        float v10 = (ASDT::IOUserClient *)v27;
        if (v27)
        {
          uint64_t v11 = IOObjectRetain(v27);
          if (v11)
          {
            uint64_t v12 = v11;
            int v13 = __cxa_allocate_exception(0x20uLL);
            char v14 = std::system_category();
            MEMORY[0x24C5874A0](v13, v12, v14, "Error on Retain");
            __cxa_throw(v13, MEMORY[0x263F8C1A8], MEMORY[0x263F8C0D8]);
          }
        }
        io_object_t v24 = v10;
        IOObjectRelease((io_object_t)v6);
        int v6 = v10;
      }
      while (v10);
      if (v27) {
        IOObjectRelease(v27);
      }
    }
    if (v26) {
      IOObjectRelease(v26);
    }
    IOObjectRelease(a2);
  }
}

void sub_2489E3EA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, int a12, int a13, char a14, __int16 a15, char a16, char a17, __int16 a18, char a19, char a20,int a21,io_object_t a22)
{
  __cxa_free_exception(v23);
  applesauce::iokit::details::io_services_iterator::~io_services_iterator((applesauce::iokit::details::io_services_iterator *)&a19);
  applesauce::iokit::io_object_holder::~io_object_holder(&a22);

  _Unwind_Resume(a1);
}

void ASDTIOServiceMatchingHandler(void *a1, io_object_t a2)
{
  int v3 = a1;
  if (a2)
  {
    uint64_t v4 = IOObjectRetain(a2);
    if (v4)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      unint64_t v16 = std::system_category();
      MEMORY[0x24C5874A0](exception, v4, v16, "Error on Retain");
      __cxa_throw(exception, MEMORY[0x263F8C1A8], MEMORY[0x263F8C0D8]);
    }
    io_object_t v28 = a2;
    io_object_t object = a2;
    uint64_t v5 = IOObjectRetain(a2);
    if (v5)
    {
      float v17 = __cxa_allocate_exception(0x20uLL);
      float v18 = std::system_category();
      MEMORY[0x24C5874A0](v17, v5, v18, "Error on Retain");
      __cxa_throw(v17, MEMORY[0x263F8C1A8], MEMORY[0x263F8C0D8]);
    }
    applesauce::iokit::details::io_services_iterator::io_services_iterator(&v26, &object);
    if (object) {
      IOObjectRelease(object);
    }
    int v6 = (ASDT::IOUserClient *)v27;
    io_object_t v24 = v27;
    if (v27)
    {
      uint64_t v7 = IOObjectRetain(v27);
      if (v7)
      {
        int v19 = __cxa_allocate_exception(0x20uLL);
        long long v20 = std::system_category();
        MEMORY[0x24C5874A0](v19, v7, v20, "Error on Retain");
        __cxa_throw(v19, MEMORY[0x263F8C1A8], MEMORY[0x263F8C0D8]);
      }
      do
      {
        if (IOObjectConformsTo((io_object_t)v6, (const char *)[v3 ioServiceClassNameCStr]))
        {
          float v8 = [v3 delegate];
          ASDT::IOUserClient::CopyProperties(v6, (CFMutableDictionaryRef *)&cf);
          int v9 = (id)cf;
          [v8 matchedIOService:v6 withProperties:v9];

          if (cf) {
            CFRelease(cf);
          }
        }
        applesauce::iokit::details::io_services_iterator::operator++(&v26, (applesauce::iokit::details::io_services_iterator *)&v21);
        if (v22) {
          IOObjectRelease(v22);
        }
        if (v21) {
          IOObjectRelease(v21);
        }
        float v10 = (ASDT::IOUserClient *)v27;
        if (v27)
        {
          uint64_t v11 = IOObjectRetain(v27);
          if (v11)
          {
            uint64_t v12 = v11;
            int v13 = __cxa_allocate_exception(0x20uLL);
            char v14 = std::system_category();
            MEMORY[0x24C5874A0](v13, v12, v14, "Error on Retain");
            __cxa_throw(v13, MEMORY[0x263F8C1A8], MEMORY[0x263F8C0D8]);
          }
        }
        io_object_t v24 = v10;
        IOObjectRelease((io_object_t)v6);
        int v6 = v10;
      }
      while (v10);
      if (v27) {
        IOObjectRelease(v27);
      }
    }
    if (v26) {
      IOObjectRelease(v26);
    }
    IOObjectRelease(a2);
  }
}

void sub_2489E4228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, int a12, int a13, char a14, __int16 a15, char a16, char a17, __int16 a18, char a19, char a20,int a21,io_object_t a22)
{
  __cxa_free_exception(v23);
  applesauce::iokit::details::io_services_iterator::~io_services_iterator((applesauce::iokit::details::io_services_iterator *)&a19);
  applesauce::iokit::io_object_holder::~io_object_holder(&a22);

  _Unwind_Resume(a1);
}

void sub_2489E4364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ASDTIOServiceMatcher;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_2489E44E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

io_object_t *applesauce::iokit::details::io_services_iterator::io_services_iterator(io_object_t *a1, io_object_t *a2)
{
  io_object_t v3 = *a2;
  *a1 = *a2;
  if (v3)
  {
    uint64_t v4 = IOObjectRetain(v3);
    if (v4)
    {
      uint64_t v6 = v4;
      exception = __cxa_allocate_exception(0x20uLL);
      float v8 = std::system_category();
      MEMORY[0x24C5874A0](exception, v6, v8, "Error on Retain");
      __cxa_throw(exception, MEMORY[0x263F8C1A8], MEMORY[0x263F8C0D8]);
    }
    io_object_t v3 = *a1;
  }
  a1[1] = IOIteratorNext(v3);
  return a1;
}

void sub_2489E465C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::iokit::io_object_holder::~io_object_holder(io_object_t *this)
{
  io_object_t v1 = *this;
  if (v1) {
    IOObjectRelease(v1);
  }
}

uint64_t applesauce::iokit::details::io_services_iterator::operator++@<X0>(io_object_t *a1@<X0>, applesauce::iokit::details::io_services_iterator *a2@<X8>)
{
  applesauce::iokit::details::io_services_iterator::io_services_iterator(a2, a1);
  if (!a1[1])
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "io_services_iterator exceeding size");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
    __cxa_throw(exception, (struct type_info *)off_265243928, MEMORY[0x263F8C068]);
  }
  io_object_t v3 = IOIteratorNext(*a1);
  uint64_t result = a1[1];
  a1[1] = v3;
  if (result) {
    return IOObjectRelease(result);
  }
  return result;
}

void sub_2489E4770(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  applesauce::iokit::details::io_services_iterator::~io_services_iterator(v1);
  _Unwind_Resume(a1);
}

void applesauce::iokit::details::io_services_iterator::~io_services_iterator(applesauce::iokit::details::io_services_iterator *this)
{
  io_object_t v2 = *((_DWORD *)this + 1);
  if (v2) {
    IOObjectRelease(v2);
  }
  if (*(_DWORD *)this) {
    IOObjectRelease(*(_DWORD *)this);
  }
}

applesauce::iokit::details::io_services_iterator *applesauce::iokit::details::io_services_iterator::io_services_iterator(applesauce::iokit::details::io_services_iterator *this, io_object_t *a2)
{
  io_object_t v4 = *a2;
  *(_DWORD *)this = *a2;
  if (v4)
  {
    uint64_t v5 = IOObjectRetain(v4);
    if (v5)
    {
      uint64_t v9 = v5;
      exception = __cxa_allocate_exception(0x20uLL);
      uint64_t v11 = std::system_category();
      MEMORY[0x24C5874A0](exception, v9, v11, "Error on Retain");
      __cxa_throw(exception, MEMORY[0x263F8C1A8], MEMORY[0x263F8C0D8]);
    }
  }
  io_object_t v6 = a2[1];
  *((_DWORD *)this + 1) = v6;
  if (v6)
  {
    uint64_t v7 = IOObjectRetain(v6);
    if (v7)
    {
      uint64_t v12 = __cxa_allocate_exception(0x20uLL);
      int v13 = std::system_category();
      MEMORY[0x24C5874A0](v12, v7, v13, "Error on Retain");
      __cxa_throw(v12, MEMORY[0x263F8C1A8], MEMORY[0x263F8C0D8]);
    }
  }
  return this;
}

void sub_2489E48D0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  applesauce::iokit::io_object_holder::~io_object_holder(v1);
  _Unwind_Resume(a1);
}

void sub_2489E4B30(_Unwind_Exception *a1)
{
  io_object_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_2489E4C20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E4D04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E4F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E50C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E5204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E5310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E5464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E59EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E5E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_2489E60C4(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_2489E61E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489E6360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E6418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E69B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E6C6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E6D58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2489E6EF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E7158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E72F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E74AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E7660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E7750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E77A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E7874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E7988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E7A2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E7AD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E7B98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E7C5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E7D30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E7DD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E7E40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E81E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_2489E8654(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E8738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E87B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E8878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E8A54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E8AA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E8BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E8C0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E8E00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E8E5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E8EC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E8FE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E90F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E9160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E95F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2489E9808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E98EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E9A50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E9AC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E9B28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E9B98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489E9BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

double CAAudioValueRange::BoundValue(CAAudioValueRange *this, const AudioValueRange *a2, double a3)
{
  double v3 = *((double *)this + 1);
  if (v3 > a3) {
    double v3 = a3;
  }
  if (*(double *)this >= a3) {
    return *(double *)this;
  }
  else {
    return v3;
  }
}

double CAAudioValueRange::PickCommonSampleRate(CAAudioValueRange *this, const AudioValueRange *a2)
{
  double v3 = *(double *)this;
  double v2 = *((double *)this + 1);
  double result = 44100.0;
  if (*(double *)this > 44100.0 || v2 < 44100.0)
  {
    double result = 48000.0;
    if (v3 > 48000.0 || v2 < 48000.0)
    {
      double result = 96000.0;
      if (v3 > 96000.0 || v2 < 96000.0)
      {
        double result = 88200.0;
        if (v3 > 88200.0 || v2 < 88200.0)
        {
          double result = 64000.0;
          if (v3 > 64000.0 || v2 < 64000.0)
          {
            double result = 32000.0;
            if (v3 > 32000.0 || v2 < 32000.0)
            {
              double result = 24000.0;
              if (v3 > 24000.0 || v2 < 24000.0)
              {
                double result = 22050.0;
                if (v3 > 22050.0 || v2 < 22050.0)
                {
                  double result = 16000.0;
                  if (v3 > 16000.0 || v2 < 16000.0)
                  {
                    double result = 12000.0;
                    if (v3 > 12000.0 || v2 < 12000.0)
                    {
                      double result = 11025.0;
                      if (v3 > 11025.0 || v2 < 11025.0)
                      {
                        double result = 8000.0;
                        if (v2 < 8000.0 || v3 > 8000.0) {
                          return *((double *)this + 1);
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
  return result;
}

uint64_t CAAudioValueRange::Intersection(CAAudioValueRange *this, const AudioValueRange *a2, const AudioValueRange *a3, AudioValueRange *a4)
{
  double mMinimum = a2->mMinimum;
  if (*((double *)this + 1) >= a2->mMinimum && *(double *)this <= a2->mMaximum)
  {
    if (*(double *)this >= mMinimum) {
      double mMinimum = *(double *)this;
    }
    a3->double mMinimum = mMinimum;
    double mMaximum = a2->mMaximum;
    if (mMaximum >= *((double *)this + 1)) {
      double mMaximum = *((double *)this + 1);
    }
    a3->double mMaximum = mMaximum;
    return 1;
  }
  else
  {
    uint64_t result = 0;
    a3->double mMinimum = 0.0;
    a3->double mMaximum = 0.0;
  }
  return result;
}

uint64_t CAAudioValueRange::Union(CAAudioValueRange *this, const AudioValueRange *a2, const AudioValueRange *a3, AudioValueRange *a4)
{
  double mMinimum = a2->mMinimum;
  if (*((double *)this + 1) >= a2->mMinimum && (double v6 = *(double *)this, *(double *)this <= a2->mMaximum))
  {
    uint64_t result = 0;
    if (mMinimum >= v6) {
      double mMinimum = v6;
    }
    a3->double mMinimum = mMinimum;
    double mMaximum = *((double *)this + 1);
    if (mMaximum < a2->mMaximum) {
      double mMaximum = a2->mMaximum;
    }
    a3->double mMaximum = mMaximum;
  }
  else
  {
    a3->double mMinimum = 0.0;
    a3->double mMaximum = 0.0;
    return 1;
  }
  return result;
}

void CAAudioValueRange_ComputeUnion(double *a1, double **a2, char **a3)
{
  uint64_t v5 = *a3;
  a3[1] = *a3;
  uint64_t v7 = *a2;
  double v6 = a2[1];
  if (*a2 == v6)
  {
LABEL_22:
    double v23 = *a1;
    uint64_t v22 = *((void *)a1 + 1);
    unint64_t v24 = (unint64_t)a3[2];
    if ((unint64_t)v5 < v24)
    {
      *(double *)uint64_t v5 = v23;
      *((void *)v5 + 1) = v22;
      long long v25 = v5 + 16;
LABEL_68:
      a3[1] = v25;
      return;
    }
    uint64_t v28 = (v5 - *a3) >> 4;
    if (!((unint64_t)(v28 + 1) >> 60))
    {
      uint64_t v29 = v24 - (void)*a3;
      uint64_t v30 = v29 >> 3;
      if (v29 >> 3 <= (unint64_t)(v28 + 1)) {
        uint64_t v30 = v28 + 1;
      }
      if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v31 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v31 = v30;
      }
      if (v31) {
        unint64_t v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>((uint64_t)(a3 + 2), v31);
      }
      else {
        unint64_t v32 = 0;
      }
      int v47 = &v32[16 * v28];
      int v48 = &v32[16 * v31];
      *(double *)int v47 = v23;
      *((void *)v47 + 1) = v22;
      long long v25 = v47 + 16;
      int v50 = *a3;
      int v49 = a3[1];
      if (v49 != *a3)
      {
        do
        {
          *((_OWORD *)v47 - 1) = *((_OWORD *)v49 - 1);
          v47 -= 16;
          v49 -= 16;
        }
        while (v49 != v50);
        int v49 = *a3;
      }
      *a3 = v47;
      a3[1] = v25;
      a3[2] = v48;
      if (v49) {
        operator delete(v49);
      }
      goto LABEL_68;
    }
LABEL_101:
    std::vector<ASDT::Exclaves::StatusTracker::Update>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v9 = a3 + 2;
  double v10 = *a1;
  if (v7[1] < *a1)
  {
    while (1)
    {
      if ((unint64_t)v5 >= *v9)
      {
        uint64_t v11 = (v5 - *a3) >> 4;
        if ((unint64_t)(v11 + 1) >> 60) {
          goto LABEL_101;
        }
        uint64_t v12 = *v9 - (void)*a3;
        uint64_t v13 = v12 >> 3;
        if (v12 >> 3 <= (unint64_t)(v11 + 1)) {
          uint64_t v13 = v11 + 1;
        }
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v14 = v13;
        }
        if (v14) {
          int v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>((uint64_t)(a3 + 2), v14);
        }
        else {
          int v15 = 0;
        }
        unint64_t v16 = &v15[16 * v11];
        *(_OWORD *)unint64_t v16 = *(_OWORD *)v7;
        float v18 = *a3;
        float v17 = a3[1];
        int v19 = v16;
        if (v17 != *a3)
        {
          do
          {
            *((_OWORD *)v19 - 1) = *((_OWORD *)v17 - 1);
            v19 -= 16;
            v17 -= 16;
          }
          while (v17 != v18);
          float v17 = *a3;
        }
        uint64_t v5 = v16 + 16;
        *a3 = v19;
        a3[1] = v16 + 16;
        a3[2] = &v15[16 * v14];
        if (v17) {
          operator delete(v17);
        }
      }
      else
      {
        *(_OWORD *)uint64_t v5 = *(_OWORD *)v7;
        v5 += 16;
      }
      a3[1] = v5;
      long long v20 = v7 + 2;
      double v6 = a2[1];
      if (v7 + 2 == v6) {
        goto LABEL_22;
      }
      double v21 = v7[3];
      double v10 = *a1;
      v7 += 2;
      if (v21 >= *a1) {
        goto LABEL_25;
      }
    }
  }
  long long v20 = *a2;
LABEL_25:
  double v26 = a1[1];
  if (*v20 <= v26)
  {
    __int16 v33 = v20 + 2;
    do
    {
      unint64_t v34 = v33;
      if (v33 == v6) {
        break;
      }
      v33 += 2;
    }
    while (*v34 <= v26);
    if (v10 >= *v20) {
      uint64_t v35 = v20;
    }
    else {
      uint64_t v35 = a1;
    }
    uint64_t v36 = *(void *)v35;
    if (*(v34 - 1) >= v26) {
      double v26 = *(v34 - 1);
    }
    if ((unint64_t)v5 >= *v9)
    {
      uint64_t v42 = (v5 - *a3) >> 4;
      if ((unint64_t)(v42 + 1) >> 60) {
        goto LABEL_101;
      }
      uint64_t v43 = *v9 - (void)*a3;
      uint64_t v44 = v43 >> 3;
      if (v43 >> 3 <= (unint64_t)(v42 + 1)) {
        uint64_t v44 = v42 + 1;
      }
      if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v45 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v45 = v44;
      }
      if (v45) {
        int v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>((uint64_t)(a3 + 2), v45);
      }
      else {
        int v46 = 0;
      }
      uint64_t v55 = &v46[16 * v42];
      v56 = &v46[16 * v45];
      *(void *)uint64_t v55 = v36;
      *((double *)v55 + 1) = v26;
      io_object_t v27 = v55 + 16;
      v58 = *a3;
      v57 = a3[1];
      if (v57 != *a3)
      {
        do
        {
          *((_OWORD *)v55 - 1) = *((_OWORD *)v57 - 1);
          v55 -= 16;
          v57 -= 16;
        }
        while (v57 != v58);
        v57 = *a3;
      }
      *a3 = v55;
      a3[1] = v27;
      a3[2] = v56;
      if (v57) {
        operator delete(v57);
      }
    }
    else
    {
      *(void *)uint64_t v5 = v36;
      *((double *)v5 + 1) = v26;
      io_object_t v27 = v5 + 16;
    }
  }
  else
  {
    if ((unint64_t)v5 >= *v9)
    {
      uint64_t v37 = (v5 - *a3) >> 4;
      if ((unint64_t)(v37 + 1) >> 60) {
        goto LABEL_101;
      }
      uint64_t v38 = *v9 - (void)*a3;
      uint64_t v39 = v38 >> 3;
      if (v38 >> 3 <= (unint64_t)(v37 + 1)) {
        uint64_t v39 = v37 + 1;
      }
      if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v40 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v40 = v39;
      }
      if (v40) {
        int v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>((uint64_t)(a3 + 2), v40);
      }
      else {
        int v41 = 0;
      }
      int v51 = (double *)&v41[16 * v37];
      int v52 = &v41[16 * v40];
      *int v51 = v10;
      v51[1] = v26;
      io_object_t v27 = (char *)(v51 + 2);
      int v54 = *a3;
      __int16 v53 = a3[1];
      if (v53 != *a3)
      {
        do
        {
          *((_OWORD *)v51 - 1) = *((_OWORD *)v53 - 1);
          v51 -= 2;
          v53 -= 16;
        }
        while (v53 != v54);
        __int16 v53 = *a3;
      }
      *a3 = (char *)v51;
      a3[1] = v27;
      a3[2] = v52;
      if (v53) {
        operator delete(v53);
      }
    }
    else
    {
      *(double *)uint64_t v5 = v10;
      *((double *)v5 + 1) = v26;
      io_object_t v27 = v5 + 16;
    }
    unint64_t v34 = v20;
  }
  for (a3[1] = v27; v34 != a2[1]; v34 += 2)
  {
    if ((unint64_t)v27 >= *v9)
    {
      uint64_t v59 = (v27 - *a3) >> 4;
      if ((unint64_t)(v59 + 1) >> 60) {
        goto LABEL_101;
      }
      uint64_t v60 = *v9 - (void)*a3;
      uint64_t v61 = v60 >> 3;
      if (v60 >> 3 <= (unint64_t)(v59 + 1)) {
        uint64_t v61 = v59 + 1;
      }
      if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v62 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v62 = v61;
      }
      if (v62) {
        v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>((uint64_t)(a3 + 2), v62);
      }
      else {
        v63 = 0;
      }
      v64 = &v63[16 * v59];
      *(_OWORD *)v64 = *(_OWORD *)v34;
      v66 = *a3;
      v65 = a3[1];
      v67 = v64;
      if (v65 != *a3)
      {
        do
        {
          *((_OWORD *)v67 - 1) = *((_OWORD *)v65 - 1);
          v67 -= 16;
          v65 -= 16;
        }
        while (v65 != v66);
        v65 = *a3;
      }
      io_object_t v27 = v64 + 16;
      *a3 = v67;
      a3[1] = v64 + 16;
      a3[2] = &v63[16 * v62];
      if (v65) {
        operator delete(v65);
      }
    }
    else
    {
      *(_OWORD *)io_object_t v27 = *(_OWORD *)v34;
      v27 += 16;
    }
    a3[1] = v27;
  }
}

void CAAudioValueRange_ComputeIntersection(unsigned int a1, uint64_t a2, double **a3, uint64_t a4)
{
  uint64_t v4 = *(double **)a4;
  *(void *)(a4 + 8) = *(void *)a4;
  if (a1)
  {
    uint64_t v7 = 0;
    float v8 = (void *)(a4 + 16);
    uint64_t v9 = a3[1];
    uint64_t v26 = a1;
    do
    {
      double v10 = *a3;
      if (*a3 != v9)
      {
        uint64_t v11 = (double *)(a2 + 16 * v7);
        uint64_t v12 = v11 + 1;
        do
        {
          if (*v12 >= *v10)
          {
            double v13 = v10[1];
            if (*v11 <= v13)
            {
              if (*v11 >= *v10) {
                double v14 = *v11;
              }
              else {
                double v14 = *v10;
              }
              if (v13 >= *v12) {
                double v15 = *v12;
              }
              else {
                double v15 = v10[1];
              }
              if ((unint64_t)v4 >= *v8)
              {
                uint64_t v16 = ((uint64_t)v4 - *(void *)a4) >> 4;
                if ((unint64_t)(v16 + 1) >> 60) {
                  std::vector<ASDT::Exclaves::StatusTracker::Update>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v17 = *v8 - *(void *)a4;
                uint64_t v18 = v17 >> 3;
                if (v17 >> 3 <= (unint64_t)(v16 + 1)) {
                  uint64_t v18 = v16 + 1;
                }
                if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF0) {
                  unint64_t v19 = 0xFFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v19 = v18;
                }
                if (v19) {
                  long long v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>((uint64_t)v8, v19);
                }
                else {
                  long long v20 = 0;
                }
                double v21 = (double *)&v20[16 * v16];
                double *v21 = v14;
                v21[1] = v15;
                double v23 = *(double **)a4;
                uint64_t v22 = *(double **)(a4 + 8);
                unint64_t v24 = v21;
                if (v22 != *(double **)a4)
                {
                  do
                  {
                    *((_OWORD *)v24 - 1) = *((_OWORD *)v22 - 1);
                    v24 -= 2;
                    v22 -= 2;
                  }
                  while (v22 != v23);
                  uint64_t v22 = *(double **)a4;
                }
                uint64_t v4 = v21 + 2;
                *(void *)a4 = v24;
                *(void *)(a4 + 8) = v21 + 2;
                *(void *)(a4 + 16) = &v20[16 * v19];
                if (v22) {
                  operator delete(v22);
                }
              }
              else
              {
                double *v4 = v14;
                v4[1] = v15;
                v4 += 2;
              }
              *(void *)(a4 + 8) = v4;
              uint64_t v9 = a3[1];
            }
          }
          v10 += 2;
        }
        while (v10 != v9);
      }
      ++v7;
    }
    while (v7 != v26);
  }
}

void sub_2489EAF88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489EB494(_Unwind_Exception *a1)
{
  uint64_t v9 = v7;

  _Unwind_Resume(a1);
}

void sub_2489EBA98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_2489EBCAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489EBE90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489EBF2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489EC00C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489EC0FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489EC484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489EC60C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2489EC688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489EC878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489EC9E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489ECBC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489ECCC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489ED0E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489ED278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489ED2E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489ED424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489ED4CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489ED53C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489ED58C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489ED5DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489EDE50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
  _Unwind_Resume(a1);
}

void sub_2489EE0F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489EE2A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489EE3C8(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_2489EE488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489EE6F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489EE7F0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_2489EE84C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489EE960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489EEA24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489EECE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489EEEA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489EEF64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_3_3(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  return result;
}

void sub_2489EF394(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489EF44C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489EF878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2489EF9C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489EFC64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2489EFD3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489EFE58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489F039C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489F0630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

ASDT::Exclaves::AudioBuffer *ASDT::Exclaves::AudioBuffer::AudioBuffer(ASDT::Exclaves::AudioBuffer *this, char *a2, std::string::size_type a3)
{
  uint64_t v4 = a2;
  uint64_t v27 = *MEMORY[0x263EF8340];
  *((_DWORD *)this + 4) = 0;
  double v6 = (_DWORD *)((char *)this + 16);
  *(void *)this = &unk_26FCA6678;
  *((void *)this + 1) = a3;
  uint64_t v7 = (const std::string *)((char *)this + 24);
  if (!a2) {
    a2 = "";
  }
  std::string::basic_string[abi:ne180100]<0>((void *)this + 3, a2);
  *((void *)this + 6) = 0;
  int v8 = *((char *)this + 47);
  if (v8 < 0) {
    BOOL v9 = *((void *)this + 4) == 0;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  if (!v9 && a3 != 0)
  {
    std::string::size_type v11 = std::string::rfind(v7, 46, 0xFFFFFFFFFFFFFFFFLL);
    if (v11 == -2) {
      std::string::size_type v12 = 0;
    }
    else {
      std::string::size_type v12 = v11 + 1;
    }
    std::string::basic_string(&v23, v7, v12, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v22);
    if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      double v13 = &v23;
    }
    else {
      double v13 = (std::string *)v23.__r_.__value_.__r.__words[0];
    }
    *(void *)__dst = 0;
    strlcpy(__dst, (const char *)v13, 9uLL);
    uint64_t v21 = 0;
    if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v23.__r_.__value_.__l.__data_);
    }
    *((void *)this + 6) = *(void *)__dst;
    std::string::size_type v14 = a3 / *MEMORY[0x263EF8AF8] * *MEMORY[0x263EF8AF8];
    if (v14 >= a3) {
      std::string::size_type v15 = a3;
    }
    else {
      std::string::size_type v15 = *MEMORY[0x263EF8AF8] + v14;
    }
    if (asdt_exclaves_available())
    {
      int v16 = exclaves_audio_buffer_create();
      if (v16 || !*v6)
      {
        uint64_t v17 = ASDTBaseLogType();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v23.__r_.__value_.__l.__data_) = 136315906;
          *(std::string::size_type *)((char *)v23.__r_.__value_.__r.__words + 4) = (std::string::size_type)v4;
          WORD2(v23.__r_.__value_.__r.__words[1]) = 2048;
          *(std::string::size_type *)((char *)&v23.__r_.__value_.__r.__words[1] + 6) = v15;
          HIWORD(v23.__r_.__value_.__r.__words[2]) = 2048;
          std::string::size_type v24 = a3;
          __int16 v25 = 1024;
          int v26 = v16;
          _os_log_error_impl(&dword_2489BC000, v17, OS_LOG_TYPE_ERROR, "AudioBuffer: Failed to create with name: %s, size: %llu (%llu): %x", (uint8_t *)&v23, 0x26u);
        }
        *double v6 = 0;
      }
    }
    else
    {
      uint64_t v18 = ASDTBaseLogType();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        ASDT::Exclaves::AudioBuffer::AudioBuffer(v18);
      }
    }
  }
  return this;
}

void sub_2489F0A08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
}

void ASDT::Exclaves::AudioBuffer::~AudioBuffer(ASDT::Exclaves::AudioBuffer *this)
{
  *(void *)this = &unk_26FCA6678;
  mach_port_name_t v2 = *((_DWORD *)this + 4);
  if (v2) {
    mach_port_deallocate(*MEMORY[0x263EF8960], v2);
  }
  if (*((char *)this + 47) < 0) {
    operator delete(*((void **)this + 3));
  }
}

{
  uint64_t vars8;

  ASDT::Exclaves::AudioBuffer::~AudioBuffer(this);
  JUMPOUT(0x24C587580);
}

void ASDT::Exclaves::AudioBuffer::Create(ASDT::Exclaves::AudioBuffer *this, const char *a2)
{
}

void sub_2489F0BAC(_Unwind_Exception *a1)
{
  MEMORY[0x24C587580](v1, 0x1093C40020DE3D2);
  _Unwind_Resume(a1);
}

uint64_t ASDT::Exclaves::AudioBuffer::Read(uint64_t a1, uint64_t *a2, unint64_t a3, _DWORD *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (!a2 && a3) {
    return 4;
  }
  if (!*(_DWORD *)(a1 + 16)) {
    return 29;
  }
  uint64_t v7 = a2[1];
  uint64_t v8 = a2[2];
  uint64_t v9 = *a2;
  if (a3 < 2)
  {
    uint64_t v11 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    if (v9 + v8 != a2[3]) {
      return 4;
    }
    uint64_t v10 = a2[4];
    uint64_t v11 = a2[5];
  }
  kdebug_trace();
  uint64_t v6 = exclaves_audio_buffer_copyout_with_status();
  if (v6)
  {
    std::string::size_type v12 = ASDTBaseLogType();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      std::string::size_type v14 = (void *)(a1 + 24);
      if (*(char *)(a1 + 47) < 0) {
        std::string::size_type v14 = (void *)*v14;
      }
      *(_DWORD *)std::string buf = 136316674;
      int v16 = v14;
      __int16 v17 = 2048;
      uint64_t v18 = v9;
      __int16 v19 = 2048;
      uint64_t v20 = v8;
      __int16 v21 = 2048;
      uint64_t v22 = v7;
      __int16 v23 = 2048;
      uint64_t v24 = v11;
      __int16 v25 = 2048;
      uint64_t v26 = v10;
      __int16 v27 = 1024;
      int v28 = v6;
      _os_log_error_impl(&dword_2489BC000, v12, OS_LOG_TYPE_ERROR, "AudioBuffer::Read: Failed to copyout: name: %s, addr: %p, length1: %llu, offset1: %llu, length2: %llu, offset2: %llu, ret: %x", buf, 0x44u);
    }
  }
  ASDT::Exclaves::Sensor::ConvertStatus(2, a4);
  kdebug_trace();
  return v6;
}

uint64_t ASDT::Exclaves::AudioBuffer::Read(uint64_t a1, uint64_t a2, int a3, unsigned int a4, unsigned int a5, unint64_t a6, _DWORD *a7)
{
  v12[6] = *MEMORY[0x263EF8340];
  unint64_t v7 = a4 * a3;
  unint64_t v8 = a5 * a4 - a6 % a5 * a4;
  BOOL v9 = v8 >= v7;
  v12[0] = a2;
  v12[1] = a6 % a5 * a4;
  if (v8 >= v7) {
    unint64_t v8 = a4 * a3;
  }
  void v12[2] = v8;
  void v12[3] = a2 + v8;
  if (v9) {
    unint64_t v10 = 1;
  }
  else {
    unint64_t v10 = 2;
  }
  v12[4] = 0;
  v12[5] = v7 - v8;
  return ASDT::Exclaves::AudioBuffer::Read(a1, v12, v10, a7);
}

uint64_t ASDT::Exclaves::AudioBuffer::Read(uint64_t a1, uint64_t a2, int a3, int a4, _DWORD *a5)
{
  v6[0] = a2;
  v6[1] = 0;
  v6[2] = (a4 * a3);
  return ASDT::Exclaves::AudioBuffer::Read(a1, v6, 1uLL, a5);
}

ASDT::Exclaves::InboundBuffer *ASDT::Exclaves::InboundBuffer::InboundBuffer(ASDT::Exclaves::InboundBuffer *this, char *a2, std::string::size_type a3)
{
  uint64_t v4 = a2;
  uint64_t v27 = *MEMORY[0x263EF8340];
  *((_DWORD *)this + 4) = 0;
  uint64_t v6 = (_DWORD *)((char *)this + 16);
  *(void *)this = &unk_26FCA66A8;
  *((void *)this + 1) = a3;
  unint64_t v7 = (const std::string *)((char *)this + 24);
  if (!a2) {
    a2 = "";
  }
  std::string::basic_string[abi:ne180100]<0>((void *)this + 3, a2);
  *((void *)this + 6) = 0;
  int v8 = *((char *)this + 47);
  if (v8 < 0) {
    BOOL v9 = *((void *)this + 4) == 0;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  if (!v9 && a3 != 0)
  {
    std::string::size_type v11 = std::string::rfind(v7, 46, 0xFFFFFFFFFFFFFFFFLL);
    if (v11 == -2) {
      std::string::size_type v12 = 0;
    }
    else {
      std::string::size_type v12 = v11 + 1;
    }
    std::string::basic_string(&v23, v7, v12, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v22);
    if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      double v13 = &v23;
    }
    else {
      double v13 = (std::string *)v23.__r_.__value_.__r.__words[0];
    }
    *(void *)__dst = 0;
    strlcpy(__dst, (const char *)v13, 9uLL);
    uint64_t v21 = 0;
    if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v23.__r_.__value_.__l.__data_);
    }
    *((void *)this + 6) = *(void *)__dst;
    std::string::size_type v14 = a3 / *MEMORY[0x263EF8AF8] * *MEMORY[0x263EF8AF8];
    if (v14 >= a3) {
      std::string::size_type v15 = a3;
    }
    else {
      std::string::size_type v15 = *MEMORY[0x263EF8AF8] + v14;
    }
    if (asdt_exclaves_available())
    {
      int v16 = exclaves_inbound_buffer_create();
      if (v16 || !*v6)
      {
        __int16 v17 = ASDTBaseLogType();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v23.__r_.__value_.__l.__data_) = 136315906;
          *(std::string::size_type *)((char *)v23.__r_.__value_.__r.__words + 4) = (std::string::size_type)v4;
          WORD2(v23.__r_.__value_.__r.__words[1]) = 2048;
          *(std::string::size_type *)((char *)&v23.__r_.__value_.__r.__words[1] + 6) = v15;
          HIWORD(v23.__r_.__value_.__r.__words[2]) = 2048;
          std::string::size_type v24 = a3;
          __int16 v25 = 1024;
          int v26 = v16;
          _os_log_error_impl(&dword_2489BC000, v17, OS_LOG_TYPE_ERROR, "InboundBuffer: Failed to create with name: %s, size: %llu (%llu): %x", (uint8_t *)&v23, 0x26u);
        }
        *uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v18 = ASDTBaseLogType();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        ASDT::Exclaves::InboundBuffer::InboundBuffer(v18);
      }
    }
  }
  return this;
}

void sub_2489F10B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
}

void ASDT::Exclaves::InboundBuffer::~InboundBuffer(ASDT::Exclaves::InboundBuffer *this)
{
  *(void *)this = &unk_26FCA66A8;
  mach_port_name_t v2 = *((_DWORD *)this + 4);
  if (v2) {
    mach_port_deallocate(*MEMORY[0x263EF8960], v2);
  }
  if (*((char *)this + 47) < 0) {
    operator delete(*((void **)this + 3));
  }
}

{
  uint64_t vars8;

  ASDT::Exclaves::InboundBuffer::~InboundBuffer(this);
  JUMPOUT(0x24C587580);
}

void ASDT::Exclaves::InboundBuffer::Create(ASDT::Exclaves::InboundBuffer *this, const char *a2)
{
}

void sub_2489F125C(_Unwind_Exception *a1)
{
  MEMORY[0x24C587580](v1, 0x1093C40020DE3D2);
  _Unwind_Resume(a1);
}

uint64_t ASDT::Exclaves::InboundBuffer::Write(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (!a2 && a3) {
    return 4;
  }
  if (!*(_DWORD *)(a1 + 16)) {
    return 29;
  }
  uint64_t v5 = a2[1];
  uint64_t v6 = a2[2];
  uint64_t v7 = *a2;
  if (a3 < 2)
  {
    uint64_t v9 = 0;
    uint64_t v8 = 0;
  }
  else
  {
    if (v7 + v6 != a2[3]) {
      return 4;
    }
    uint64_t v8 = a2[4];
    uint64_t v9 = a2[5];
  }
  kdebug_trace();
  uint64_t v4 = exclaves_inbound_buffer_copyin();
  if (v4)
  {
    unint64_t v10 = ASDTBaseLogType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      std::string::size_type v12 = (void *)(a1 + 24);
      if (*(char *)(a1 + 47) < 0) {
        std::string::size_type v12 = (void *)*v12;
      }
      int v13 = 136316674;
      std::string::size_type v14 = v12;
      __int16 v15 = 2048;
      uint64_t v16 = v7;
      __int16 v17 = 2048;
      uint64_t v18 = v6;
      __int16 v19 = 2048;
      uint64_t v20 = v5;
      __int16 v21 = 2048;
      uint64_t v22 = v9;
      __int16 v23 = 2048;
      uint64_t v24 = v8;
      __int16 v25 = 1024;
      int v26 = v4;
      _os_log_error_impl(&dword_2489BC000, v10, OS_LOG_TYPE_ERROR, "InboundBuffer::Write: Failed to copyin: name: %s, addr: %p, length1: %llu, offset1: %llu, length2: %llu, offset2: %llu, ret: %x", (uint8_t *)&v13, 0x44u);
    }
  }
  kdebug_trace();
  return v4;
}

uint64_t ASDT::Exclaves::InboundBuffer::Write(ASDT::Exclaves::InboundBuffer *this, const unsigned __int8 *a2, int a3, unsigned int a4, unsigned int a5, unint64_t a6)
{
  v11[6] = *MEMORY[0x263EF8340];
  unint64_t v6 = a4 * a3;
  unint64_t v7 = a5 * a4 - a6 % a5 * a4;
  BOOL v8 = v7 >= v6;
  v11[0] = (uint64_t)a2;
  v11[1] = a6 % a5 * a4;
  if (v7 >= v6) {
    unint64_t v7 = a4 * a3;
  }
  void v11[2] = v7;
  v11[3] = (uint64_t)&a2[v7];
  if (v8) {
    unint64_t v9 = 1;
  }
  else {
    unint64_t v9 = 2;
  }
  v11[4] = 0;
  v11[5] = v6 - v7;
  return ASDT::Exclaves::InboundBuffer::Write((uint64_t)this, v11, v9);
}

uint64_t ASDT::Exclaves::InboundBuffer::Write(ASDT::Exclaves::InboundBuffer *this, const unsigned __int8 *a2, int a3, int a4)
{
  v5[0] = (uint64_t)a2;
  v5[1] = 0;
  v5[2] = (a4 * a3);
  return ASDT::Exclaves::InboundBuffer::Write((uint64_t)this, v5, 1uLL);
}

void sub_2489F15C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

const __CFArray *CACFArray::HasItem(CFArrayRef *this, const void *a2)
{
  CFArrayRef result = *this;
  if (result)
  {
    v5.length = CFArrayGetCount(result);
    v5.location = 0;
    return (const __CFArray *)(CFArrayContainsValue(*this, v5, a2) != 0);
  }
  return result;
}

const __CFArray *CACFArray::GetIndexOfItem(CFArrayRef *this, const void *a2, unsigned int *a3)
{
  *a3 = 0;
  CFArrayRef result = *this;
  if (result)
  {
    v8.length = CFArrayGetCount(result);
    v8.location = 0;
    FirstIndexOfint Value = CFArrayGetFirstIndexOfValue(*this, v8, a2);
    if (FirstIndexOfValue == -1)
    {
      return 0;
    }
    else
    {
      *a3 = FirstIndexOfValue;
      return (const __CFArray *)1;
    }
  }
  return result;
}

uint64_t CACFArray::GetBool(CFArrayRef *this, unsigned int a2, BOOL *a3)
{
  CFTypeRef cf = 0;
  uint64_t result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if (!result) {
    return result;
  }
  CFTypeRef v5 = cf;
  if (!cf) {
    return 0;
  }
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 != CFBooleanGetTypeID())
  {
    CFTypeID v8 = CFGetTypeID(v5);
    if (v8 == CFNumberGetTypeID())
    {
      int valuePtr = 0;
      CFNumberGetValue((CFNumberRef)v5, kCFNumberSInt32Type, &valuePtr);
      BOOL v7 = valuePtr == 0;
      goto LABEL_7;
    }
    return 0;
  }
  BOOL v7 = CFBooleanGetValue((CFBooleanRef)v5) == 0;
LABEL_7:
  BOOL v9 = !v7;
  *a3 = v9;
  return 1;
}

const __CFArray *CACFArray::GetCFType(CFArrayRef *this, unsigned int a2, const void **a3)
{
  CFArrayRef result = *this;
  if (result)
  {
    if (CFArrayGetCount(result) <= a2)
    {
      return 0;
    }
    else
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*this, a2);
      *a3 = ValueAtIndex;
      return (const __CFArray *)(ValueAtIndex != 0);
    }
  }
  return result;
}

uint64_t CACFArray::GetSInt32(CFArrayRef *this, unsigned int a2, int *a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFNumberRef v6 = (const __CFNumber *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetUInt32(CFArrayRef *this, unsigned int a2, unsigned int *a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFNumberRef v6 = (const __CFNumber *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetSInt64(CFArrayRef *this, unsigned int a2, uint64_t *a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFNumberRef v6 = (const __CFNumber *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetUInt64(CFArrayRef *this, unsigned int a2, unint64_t *a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFNumberRef v6 = (const __CFNumber *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetFloat32(CFArrayRef *this, unsigned int a2, float *a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFNumberRef v6 = (const __CFNumber *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberFloat32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetFloat64(CFArrayRef *this, unsigned int a2, double *a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFNumberRef v6 = (const __CFNumber *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberFloat64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::Get4CC(CFArrayRef *this, unsigned int a2, unsigned int *a3)
{
  CFTypeRef cf = 0;
  uint64_t result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if (result)
  {
    CFNumberRef v5 = (const __CFNumber *)cf;
    if (cf)
    {
      CFTypeID v6 = CFGetTypeID(cf);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
        return 1;
      }
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 == CFStringGetTypeID() && CFStringGetLength((CFStringRef)v5) == 4)
      {
        CFStringGetCString((CFStringRef)v5, (char *)&v8, 5, 0x600u);
        *a3 = bswap32(v8);
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t CACFArray::GetString(CFArrayRef *this, unsigned int a2, const __CFString **a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFStringRef v6 = (const __CFString *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFStringGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetArray(CFArrayRef *this, unsigned int a2, const __CFArray **a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFArrayRef v6 = (const __CFArray *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFArrayGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetDictionary(CFArrayRef *this, unsigned int a2, const __CFDictionary **a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFDictionaryRef v6 = (const __CFDictionary *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFDictionaryGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetData(CFArrayRef *this, unsigned int a2, const __CFData **a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFDataRef v6 = (const __CFData *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFDataGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetUUID(CFArrayRef *this, unsigned int a2, const __CFUUID **a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFUUIDRef v6 = (const __CFUUID *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFUUIDGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetCACFString(CFArrayRef *this, unsigned int a2, CFTypeRef *a3)
{
  if (*a3)
  {
    if (*((unsigned char *)a3 + 8)) {
      CFRelease(*a3);
    }
    *a3 = 0;
  }
  *((unsigned char *)a3 + 8) = 1;
  CFTypeRef cf = 0;
  uint64_t result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if (result)
  {
    CFTypeRef v7 = cf;
    if (cf)
    {
      CFTypeID v8 = CFGetTypeID(cf);
      uint64_t result = CFStringGetTypeID();
      if (v8 == result)
      {
        return CACFString::operator=((uint64_t)a3, v7);
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetCACFArray(CFArrayRef *this, unsigned int a2, CACFArray *a3)
{
  CACFArray::operator=((uint64_t)a3, 0);
  CFTypeRef cf = 0;
  uint64_t result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if (result)
  {
    CFTypeRef v7 = cf;
    if (cf)
    {
      CFTypeID v8 = CFGetTypeID(cf);
      uint64_t result = CFArrayGetTypeID();
      if (v8 == result)
      {
        return CACFArray::operator=((uint64_t)a3, v7);
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetCACFDictionary(CFArrayRef *this, unsigned int a2, CACFDictionary *a3)
{
  CACFArray::operator=((uint64_t)a3, 0);
  CFTypeRef cf = 0;
  uint64_t result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if (result)
  {
    CFTypeRef v7 = cf;
    if (cf)
    {
      CFTypeID v8 = CFGetTypeID(cf);
      uint64_t result = CFDictionaryGetTypeID();
      if (v8 == result)
      {
        return CACFArray::operator=((uint64_t)a3, v7);
      }
    }
  }
  return result;
}

uint64_t CACFArray::AppendBool(CACFArray *this, int a2)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  double v3 = (const void **)MEMORY[0x263EFFB40];
  if (!a2) {
    double v3 = (const void **)MEMORY[0x263EFFB38];
  }
  uint64_t v4 = *v3;
  CFTypeRef v7 = v4;
  char v8 = 1;
  if (v4 && (CFRetain(v4), *(void *)this) && *((unsigned char *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v4);
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v7);
  return v5;
}

void sub_2489F3B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t CACFArray::AppendCFType(CACFArray *this, const void *a2)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    if (*((unsigned char *)this + 9))
    {
      CFArrayAppendValue((CFMutableArrayRef)result, a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CACFArray::AppendSInt32(CACFArray *this, int a2)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v6 = v3;
  char v7 = 1;
  if (v3 && *(void *)this && *((unsigned char *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_2489F3C58(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendUInt32(CACFArray *this, int a2)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v6 = v3;
  char v7 = 1;
  if (v3 && *(void *)this && *((unsigned char *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_2489F3D00(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendSInt64(CACFArray *this, uint64_t a2)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v6 = v3;
  char v7 = 1;
  if (v3 && *(void *)this && *((unsigned char *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_2489F3DA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendUInt64(CACFArray *this, uint64_t a2)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v6 = v3;
  char v7 = 1;
  if (v3 && *(void *)this && *((unsigned char *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_2489F3E50(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendFloat32(CACFArray *this, float a2)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  float valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
  CFNumberRef v6 = v3;
  char v7 = 1;
  if (v3 && *(void *)this && *((unsigned char *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_2489F3EF8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendFloat64(CACFArray *this, double a2)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  double valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberFloat64Type, &valuePtr);
  CFNumberRef v6 = v3;
  char v7 = 1;
  if (v3 && *(void *)this && *((unsigned char *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_2489F3FA0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendString(CACFArray *this, const __CFString *a2)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    if (*((unsigned char *)this + 9))
    {
      CFArrayAppendValue((CFMutableArrayRef)result, a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CACFArray::AppendArray(CACFArray *this, const __CFArray *a2)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    if (*((unsigned char *)this + 9))
    {
      CFArrayAppendValue((CFMutableArrayRef)result, a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CACFArray::AppendDictionary(CACFArray *this, const __CFDictionary *a2)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    if (*((unsigned char *)this + 9))
    {
      CFArrayAppendValue((CFMutableArrayRef)result, a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CACFArray::AppendData(CACFArray *this, const __CFData *a2)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    if (*((unsigned char *)this + 9))
    {
      CFArrayAppendValue((CFMutableArrayRef)result, a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFArray *CACFArray::InsertBool(CACFArray *this, unsigned int a2, int a3)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t v4 = (const void **)MEMORY[0x263EFFB40];
  if (!a3) {
    uint64_t v4 = (const void **)MEMORY[0x263EFFB38];
  }
  uint64_t v5 = *v4;
  BOOL v9 = v5;
  char v10 = 1;
  if (v5)
  {
    CFRetain(v5);
    CFArrayRef inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  }
  else
  {
    CFArrayRef inserted = 0;
  }
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v9);
  return inserted;
}

void sub_2489F413C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

const __CFArray *CACFArray::InsertCFType(__CFArray **this, unsigned int a2, const void *a3)
{
  CFArrayRef result = *this;
  if (result)
  {
    if (*((unsigned char *)this + 9))
    {
      unsigned int Count = CFArrayGetCount(result);
      char v8 = *this;
      if (Count <= a2) {
        CFArrayAppendValue(v8, a3);
      }
      else {
        CFArrayInsertValueAtIndex(v8, a2, a3);
      }
      return (const __CFArray *)1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFArray *CACFArray::InsertSInt32(CACFArray *this, unsigned int a2, int a3)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (v5) {
    CFArrayRef inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  }
  else {
    CFArrayRef inserted = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_2489F4258(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertUInt32(CACFArray *this, unsigned int a2, int a3)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (v5) {
    CFArrayRef inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  }
  else {
    CFArrayRef inserted = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_2489F42FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertSInt64(CACFArray *this, unsigned int a2, uint64_t a3)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (v5) {
    CFArrayRef inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  }
  else {
    CFArrayRef inserted = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_2489F43A0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertUInt64(CACFArray *this, unsigned int a2, uint64_t a3)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (v5) {
    CFArrayRef inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  }
  else {
    CFArrayRef inserted = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_2489F4444(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertFloat32(CACFArray *this, unsigned int a2, float a3)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  float valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (v5) {
    CFArrayRef inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  }
  else {
    CFArrayRef inserted = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_2489F44E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertFloat64(CACFArray *this, unsigned int a2, double a3)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  double valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberFloat64Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (v5) {
    CFArrayRef inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  }
  else {
    CFArrayRef inserted = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_2489F458C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetBool(const __CFArray **this, unsigned int a2, int a3)
{
  CFArrayRef v4 = *this;
  if (!v4 || !*((unsigned char *)this + 9) || CFArrayGetCount(v4) < a2) {
    return 0;
  }
  char v9 = (const void **)MEMORY[0x263EFFB40];
  if (!a3) {
    char v9 = (const void **)MEMORY[0x263EFFB38];
  }
  char v10 = *v9;
  std::string::size_type v11 = v10;
  char v12 = 1;
  if (v10)
  {
    CFRetain(v10);
    CFArrayRef v7 = CACFArray::SetCFType(this, a2, v10);
  }
  else
  {
    CFArrayRef v7 = 0;
  }
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v11);
  return v7;
}

void sub_2489F4668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

const __CFArray *CACFArray::SetCFType(CFMutableArrayRef *this, unsigned int a2, const void *a3)
{
  CFArrayRef result = *this;
  if (result)
  {
    if (*((unsigned char *)this + 9) && CFArrayGetCount(result) >= a2)
    {
      CFArraySetValueAtIndex(*this, a2, a3);
      return (const __CFArray *)1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFArray *CACFArray::SetSInt32(const __CFArray **this, unsigned int a2, int a3)
{
  CFArrayRef v4 = *this;
  if (!v4 || !*((unsigned char *)this + 9) || CFArrayGetCount(v4) < a2) {
    return 0;
  }
  int valuePtr = a3;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v10 = v9;
  char v11 = 1;
  if (v9) {
    CFArrayRef v7 = CACFArray::SetCFType(this, a2, v9);
  }
  else {
    CFArrayRef v7 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_2489F478C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetUInt32(const __CFArray **this, unsigned int a2, int a3)
{
  CFArrayRef v4 = *this;
  if (!v4 || !*((unsigned char *)this + 9) || CFArrayGetCount(v4) < a2) {
    return 0;
  }
  int valuePtr = a3;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v10 = v9;
  char v11 = 1;
  if (v9) {
    CFArrayRef v7 = CACFArray::SetCFType(this, a2, v9);
  }
  else {
    CFArrayRef v7 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_2489F4848(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetSInt64(const __CFArray **this, unsigned int a2, uint64_t a3)
{
  CFArrayRef v4 = *this;
  if (!v4 || !*((unsigned char *)this + 9) || CFArrayGetCount(v4) < a2) {
    return 0;
  }
  uint64_t valuePtr = a3;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v10 = v9;
  char v11 = 1;
  if (v9) {
    CFArrayRef v7 = CACFArray::SetCFType(this, a2, v9);
  }
  else {
    CFArrayRef v7 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_2489F4904(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetUInt64(const __CFArray **this, unsigned int a2, uint64_t a3)
{
  CFArrayRef v4 = *this;
  if (!v4 || !*((unsigned char *)this + 9) || CFArrayGetCount(v4) < a2) {
    return 0;
  }
  uint64_t valuePtr = a3;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v10 = v9;
  char v11 = 1;
  if (v9) {
    CFArrayRef v7 = CACFArray::SetCFType(this, a2, v9);
  }
  else {
    CFArrayRef v7 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_2489F49C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetFloat32(const __CFArray **this, unsigned int a2, float a3)
{
  CFArrayRef v4 = *this;
  if (!v4 || !*((unsigned char *)this + 9) || CFArrayGetCount(v4) < a2) {
    return 0;
  }
  float valuePtr = a3;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
  CFNumberRef v10 = v9;
  char v11 = 1;
  if (v9) {
    CFArrayRef v7 = CACFArray::SetCFType(this, a2, v9);
  }
  else {
    CFArrayRef v7 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_2489F4A7C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetFloat64(const __CFArray **this, unsigned int a2, double a3)
{
  CFArrayRef v4 = *this;
  if (!v4 || !*((unsigned char *)this + 9) || CFArrayGetCount(v4) < a2) {
    return 0;
  }
  double valuePtr = a3;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberFloat64Type, &valuePtr);
  CFNumberRef v10 = v9;
  char v11 = 1;
  if (v9) {
    CFArrayRef v7 = CACFArray::SetCFType(this, a2, v9);
  }
  else {
    CFArrayRef v7 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_2489F4B38(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

void CACFArray::PrintToLog(CACFArray *this, const __CFArray *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CFIndex Count = CFArrayGetCount(this);
  if (a2)
  {
    uint64_t v5 = a2;
    memset(__b, 9, a2);
  }
  else
  {
    uint64_t v5 = 0;
  }
  __b[v5] = 0;
  if (Count >= 1)
  {
    CFIndex v6 = 0;
    unsigned int v12 = a2 + 1;
    CFArrayRef v7 = &_os_log_internal;
    do
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315394;
        std::string::size_type v14 = __b;
        __int16 v15 = 1024;
        int v16 = v6;
        _os_log_impl(&dword_2489BC000, v7, OS_LOG_TYPE_DEFAULT, " %sitem %d", buf, 0x12u);
      }
      ValueAtIndex = (__CFString *)CFArrayGetValueAtIndex(this, v6);
      CFTypeID v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFBooleanGetTypeID())
      {
        CACFBoolean::PrintToLog((CACFBoolean *)ValueAtIndex, a2);
      }
      else if (v9 == CFNumberGetTypeID())
      {
        CACFNumber::PrintToLog((CACFNumber *)ValueAtIndex, a2);
      }
      else if (v9 == CFStringGetTypeID())
      {
        CACFString::PrintToLog(ValueAtIndex, (const __CFString *)a2);
      }
      else if (v9 == CFDictionaryGetTypeID())
      {
        CACFDictionary::PrintToLog((CACFDictionary *)ValueAtIndex, (const __CFDictionary *)v12, v10);
      }
      else if (v9 == CFArrayGetTypeID())
      {
        CACFArray::PrintToLog((CACFArray *)ValueAtIndex, (const __CFArray *)v12, v11);
      }
      ++v6;
    }
    while (Count != v6);
  }
}

void sub_2489F4DAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489F4E18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489F4E88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ASDTCondition;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_2489F5090(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_2489F5364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489F54F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489F55B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489F5948(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489F5B18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489F5D78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489F5F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489F6084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489F632C(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_2489F65E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489F6798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)ASDTAudioDeviceFactory;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_2489F6928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489F6D20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489F6F0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489F7000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489F70D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489F7280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489F7364(_Unwind_Exception *a1)
{
  CFNumberRef v3 = v2;

  _Unwind_Resume(a1);
}

void sub_2489F73F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489F74C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2489F760C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489F7754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2489F78DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void anonymous namespace'::GetEntryForPath(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  mach_port_name_t v2 = "GetEntryForPath";
  __int16 v3 = 2048;
  uint64_t v4 = 0;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "%s: Invalid argumnents: %p\n", (uint8_t *)&v1, 0x16u);
}

{
  int v1;
  const char *v2;
  uint64_t v3;

  __int16 v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  mach_port_name_t v2 = "GetEntryForPath";
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "%s: Failed to get IOMainPort.\n", (uint8_t *)&v1, 0xCu);
}

void ASDT::IORegistry::GetObjectForKey(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  __int16 v3 = "GetObjectForKey";
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_2489BC000, a2, OS_LOG_TYPE_ERROR, "%s: Failed to allocate memory for key: %s\n", (uint8_t *)&v2, 0x16u);
}

void ASDT::IORegistry::GetObjectForKey(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  __int16 v4 = "GetObjectForKey";
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "%s: Invalid argumnents: %p %p\n", (uint8_t *)&v3, 0x20u);
}

void ASDT::IORegistry::GetUInt32tForKey(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "GetUInt32tForKey";
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "%s: Invalid argument.\n", (uint8_t *)&v1, 0xCu);
}

uint64_t ASDT::IOUserClient::IOUserClient(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void ASDT::IOUserClient::SetInterestNotificationEnabled()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_2489BC000, v0, v1, "%s: IONotificationPortCreate failed.", v2, v3, v4, v5, v6);
}

{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0xCu);
}

{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x12u);
}

void ASDT::IOUserClient::GetIOObjectRefCount()
{
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x14u);
}

void ASDT::IOUserClient::CacheProperties()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_2489BC000, v0, v1, "%s: CacheProperties: Failed to get properties from the IO Registry", v2, v3, v4, v5, v6);
}

void ASDT::IOUserClient::DictionarySetValueForKey()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2489BC000, v0, v1, "IOUserClient: Failed to insert new value.", v2, v3, v4, v5, v6);
}

void ASDT::IOUserClient::ArraySetValueAtIndex()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2489BC000, v0, v1, "IOUserClient: ArraySetObjectAtIndex: Index out of range", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2489BC000, v0, v1, "IOUserClient: ArraySetObjectAtIndex: Bad value", v2, v3, v4, v5, v6);
}

void ASDT::IOUserClient::SetProperty()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2489BC000, v0, v1, "IOUserClient: SetProperty: Invalid object.", v2, v3, v4, v5, v6);
}

void ASDT::IOUserClient::ReplaceProperty()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_2489BC000, v0, v1, "%s: ReplaceProperty - bad key", v2, v3, v4, v5, v6);
}

void ASDT::IOUserClient::GuardedReleaseMemory()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x16u);
}

{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x2Au);
}

void ASDT::IOUserClient::InterestNotificationCallback()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_2489BC000, v0, v1, "%s: InterestNotificationHandler bad IOService", v2, v3, v4, v5, v6);
}

void CAStreamBasicDescription::PackednessIsSignificant()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2489BC000, &_os_log_internal, OS_LOG_TYPE_ERROR, " PackednessIsSignificant only applies for PCM", v0, 2u);
}

void ASDT::MachPort::CreatePort()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_2489BC000, v0, v1, "MachPort::CreatePort: failed to create the send right: %x (%c%c%c%c)", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_2489BC000, v0, v1, "MachPort::CreatePort: failed to set the port limts: %x (%c%c%c%c)", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_2489BC000, v0, v1, "MachPort::CreatePort: failed to get the port limts: %x (%c%c%c%c)", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_2489BC000, v0, v1, "MachPort::CreatePort: failed to allocate the port: %x (%c%c%c%c)", v2, v3, v4, v5, v6);
}

void ASDT::MachPort::CheckInPort()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_2489BC000, v0, v1, "MachPort::CheckInPort: couldn't insert the send right: %x (%c%c%c%c)", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_2489BC000, v0, v1, "MachPort::CheckInPort: checking in the service name failed: %x (%c%c%c%c)", v2, v3, v4, v5, v6);
}

void ASDT::MachPort::RetainPort()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_2489BC000, v0, v1, "MachPort::RetainPort: couldn't insert the send right: %x (%c%c%c%c)", v2, v3, v4, v5, v6);
}

void ASDT::MachPort::DestroyPort()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_2489BC000, v0, v1, "MachPort::DestroyPort: deallocating the port failed: %x (%c%c%c%c)", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2489BC000, v0, v1, "MachPort::DestroyPort: not going to destroy anything this way", v2, v3, v4, v5, v6);
}

void ASDT::MachPort::ReceiveMessage(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7(&dword_2489BC000, v1, v2, "MachPort::ReceiveMessage: mach_msg() returned error 0x%X: '%s'", v3, v4, v5, v6, v7);
}

void ASDT::MachPort::SendMessage(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7(&dword_2489BC000, v1, v2, "MachPort::SendMessage: mach_msg() returned error 0x%X: '%s'", v3, v4, v5, v6, v7);
}

void ASDT::MachPort::SendMessageWithReply(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7(&dword_2489BC000, v1, v2, "MachPort::SendMessageWithReply: mach_msg() returned error 0x%X: '%s'", v3, v4, v5, v6, v7);
}

void ASDT::MachPort::SetNotificationQueue()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2489BC000, v0, v1, "MachPort::SetNotificationQueue: Invalid argument.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2489BC000, v0, v1, "MachPort::SetNotificationQueue: No notification handler is installed.", v2, v3, v4, v5, v6);
}

void ASDT::MachPort::SetNotificationHandler()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2489BC000, v0, v1, "MachPort::SetNotificationHandler: Failed to create dispatch source.", v2, v3, v4, v5, v6);
}

void ASDT::Acoustic::Base::valid(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 134218240;
  HIDWORD(v3) = a2;
  OUTLINED_FUNCTION_0_9(&dword_2489BC000, a2, a3, "Input data size too small: inDataSize: %zu, mSize: %hhu", v3, HIDWORD(a2));
}

{
  int v3;

  LOWORD(v3) = 1024;
  HIWORD(v3) = a2;
  OUTLINED_FUNCTION_1_5(&dword_2489BC000, a2, a3, "Checksum mismatch: Found: 0x%hx, expected: 0x%hx", 67109376, v3);
}

{
  long long v3;

  LOWORD(v3) = 2048;
  *(void *)((char *)&v3 + 2) = a2;
  OUTLINED_FUNCTION_0_9(&dword_2489BC000, a2, a3, "Unexpected size: Found 0x%hhx, expected: 0x%zx", 67109376, (size_t)v3);
}

{
  int v3;

  LOWORD(v3) = 1024;
  HIWORD(v3) = a2;
  OUTLINED_FUNCTION_1_5(&dword_2489BC000, a2, a3, "Unexpected version: Found: 0x%hx, expected: 0x%hx", 67109376, v3);
}

void ASDT::Exclaves::Sensor::Sensor()
{
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_0_9(&dword_2489BC000, v0, v1, "Sensor: Failed to create with name: %s: %x", v2, v3);
}

void ASDT::Exclaves::Sensor::Sensor(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "Sensor: Exclaves not available.", v1, 2u);
}

void ASDT::Exclaves::Sensor::ConvertStatus()
{
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_0_9(&dword_2489BC000, v0, v1, "Sensor::ConvertStatus: Unsupported status: name: %s, status: %u", v2, v3);
}

void ASDT::VolumeCurve::AddRange(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_2489BC000, log, OS_LOG_TYPE_DEBUG, "VolumeCurve::AddRange: new point overlaps", v1, 2u);
}

void ASDT::Exclaves::AudioBuffer::AudioBuffer(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "AudioBuffer: Exclaves not available.", v1, 2u);
}

void ASDT::Exclaves::InboundBuffer::InboundBuffer(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "InboundBuffer: Exclaves not available.", v1, 2u);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE42E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE4338](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x270EE4C50](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D20](allocator, propertyList, mutabilityOption);
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

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
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

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

double CFStringGetDoubleValue(CFStringRef str)
{
  MEMORY[0x270EE51A8](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x270EE51C8](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x270EE5448]();
}

CFTypeID CFUUIDGetTypeID(void)
{
  return MEMORY[0x270EE54A0]();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x270EF3EE0](*(void *)&kernelPort, notificationID);
}

IOReturn IOCancelPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x270EF3F10](*(void *)&kernelPort, notificationID);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectMapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x270EF3F58](*(void *)&connect, *(void *)&memoryType, *(void *)&intoTask, atAddress, ofSize, *(void *)&options);
}

kern_return_t IOConnectSetCFProperty(io_connect_t connect, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x270EF3F70](*(void *)&connect, propertyName, property);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x270EF3F78](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

kern_return_t IOConnectTrap0(io_connect_t connect, uint32_t index)
{
  return MEMORY[0x270EF3F80](*(void *)&connect, *(void *)&index);
}

kern_return_t IOConnectTrap3(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2, uintptr_t p3)
{
  return MEMORY[0x270EF3F98](*(void *)&connect, *(void *)&index, p1, p2, p3);
}

kern_return_t IOConnectTrap6(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2, uintptr_t p3, uintptr_t p4, uintptr_t p5, uintptr_t p6)
{
  return MEMORY[0x270EF3FB0](*(void *)&connect, *(void *)&index, p1, p2, p3, p4, p5, p6);
}

kern_return_t IOConnectUnmapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x270EF3FC0](*(void *)&connect, *(void *)&memoryType, *(void *)&fromTask, atAddress);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x270EF4000](notifier);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x270EF47A8](*(void *)&bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x270EF47E0](*(void *)&object, className);
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return (CFStringRef)MEMORY[0x270EF47F0](*(void *)&object);
}

BOOLean_t IOObjectIsEqualTo(io_object_t object, io_object_t anObject)
{
  return MEMORY[0x270EF4818](*(void *)&object, *(void *)&anObject);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x270EF4828](*(void *)&object);
}

uint64_t IOPMGetUserActivityLevel()
{
  return MEMORY[0x270EF48B8]();
}

uint64_t IOPMScheduleUserActivityLevelNotification()
{
  return MEMORY[0x270EF48C8]();
}

uint64_t IOPMUnregisterNotification()
{
  return MEMORY[0x270EF48E8]();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x270EF49B0](refcon, thePortRef, callback, notifier);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x270EF49E8](*(void *)&mainPort, path);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x270EF4A60](*(void *)&entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x270EF4A80](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x270EF4A88](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void caulk::concurrent::message::~message(caulk::concurrent::message *this)
{
}

uint64_t caulk::concurrent::messenger::shared_high_priority(caulk::concurrent::messenger *this)
{
  return MEMORY[0x270F87AA0](this);
}

uint64_t caulk::concurrent::messenger::enqueue(caulk::concurrent::messenger *this, caulk::concurrent::message *a2)
{
  return MEMORY[0x270F87AB8](this, a2);
}

uint64_t caulk::concurrent::messenger::messenger()
{
  return MEMORY[0x270F87AC0]();
}

void caulk::concurrent::messenger::~messenger(caulk::concurrent::messenger *this)
{
}

std::string::size_type std::string::rfind(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x270F98240](this, __c, __pos);
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

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x270F98548](this, __str, __pos, __n, __a);
}

std::system_error *__cdecl std::system_error::system_error(std::system_error *this, int __ev, const std::error_category *__ecat, const char *__what_arg)
{
  return (std::system_error *)MEMORY[0x270F98610](this, *(void *)&__ev, __ecat, __what_arg);
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x270F98910]();
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t __divti3()
{
  return MEMORY[0x270ED7DB8]();
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
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

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x270ED8768](*(void *)&bp, service_name, sp);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x270ED8778]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t exclaves_audio_buffer_copyout_with_status()
{
  return MEMORY[0x270ED97C8]();
}

uint64_t exclaves_audio_buffer_create()
{
  return MEMORY[0x270ED97D0]();
}

uint64_t exclaves_inbound_buffer_copyin()
{
  return MEMORY[0x270ED97E0]();
}

uint64_t exclaves_inbound_buffer_create()
{
  return MEMORY[0x270ED97E8]();
}

uint64_t exclaves_sensor_create()
{
  return MEMORY[0x270ED9808]();
}

uint64_t exclaves_sensor_start()
{
  return MEMORY[0x270ED9810]();
}

uint64_t exclaves_sensor_status()
{
  return MEMORY[0x270ED9818]();
}

uint64_t exclaves_sensor_stop()
{
  return MEMORY[0x270ED9820]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x270ED9F70](*(void *)&a1, *(void *)&a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x270EDA1B0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_get_attributes(ipc_space_read_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x270EDA1E8](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_get_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_urefs_t *refs)
{
  return MEMORY[0x270EDA1F0](*(void *)&task, *(void *)&name, *(void *)&right, refs);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x270EDA200](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x270EDA228](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info, *(void *)&port_infoCnt);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
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

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x270EDAE80](a1, a2, a3);
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

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB868](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}