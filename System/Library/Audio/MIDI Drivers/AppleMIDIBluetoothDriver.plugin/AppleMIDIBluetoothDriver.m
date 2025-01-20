void sub_1754(std::exception *a1)
{
  uint64_t vars8;

  std::exception::~exception(a1);

  operator delete();
}

const char *sub_178C()
{
  return "CAException";
}

MIDIPacket *sub_1798(uint64_t a1, MIDITimeStamp time, int a3, Byte *data)
{
  v7 = (MIDIPacketList *)(a1 + 48);
  size_t v8 = a3;
  result = MIDIPacketListAdd((MIDIPacketList *)(a1 + 48), 0x400uLL, *(MIDIPacket **)(a1 + 40), time, a3, data);
  if (!result)
  {
    if (!v7->numPackets
      || ((*(void (**)(uint64_t, MIDIPacketList *))(*(void *)a1 + 16))(a1, v7),
          v10 = MIDIPacketListInit(v7),
          (result = MIDIPacketListAdd(v7, 0x400uLL, v10, time, v8, data)) == 0))
    {
      v11 = sub_18B8(time, v8, data);
      (*(void (**)(uint64_t, char *))(*(void *)a1 + 16))(a1, v11);
      free(v11);
      *(void *)(a1 + 40) = MIDIPacketListInit(v7);
      result = MIDIPacketListInit(v7);
    }
  }
  *(void *)(a1 + 40) = result;
  return result;
}

char *sub_18B8(uint64_t a1, size_t a2, const void *a3)
{
  v6 = (char *)malloc_type_malloc(a2 + 14, 0x6BE2FA03uLL);
  *(_DWORD *)v6 = 1;
  *(void *)(v6 + 4) = a1;
  *((_WORD *)v6 + 6) = a2;
  memcpy(v6 + 14, a3, a2);
  return v6;
}

char *sub_1920(char *a1, unint64_t a2)
{
  unsigned int v2 = *a1 >> 4;
  if (v2 > 0xF) {
    goto LABEL_11;
  }
  if (((1 << v2) & 0x4F00) != 0)
  {
LABEL_3:
    v3 = a1 + 3;
    goto LABEL_6;
  }
  if (((1 << v2) & 0x3000) != 0)
  {
LABEL_5:
    v3 = a1 + 2;
    goto LABEL_6;
  }
  if (v2 == 15)
  {
    switch(*a1)
    {
      case -16:
        goto LABEL_11;
      case -15:
      case -13:
        goto LABEL_5;
      case -14:
        goto LABEL_3;
      default:
        v3 = a1 + 1;
        break;
    }
  }
  else
  {
LABEL_11:
    v5 = a1 + 1;
    do
    {
      v3 = v5;
      if ((unint64_t)v5 >= a2) {
        break;
      }
      ++v5;
      int v6 = *v3;
    }
    while ((v6 & 0x80000000) == 0 || v6 == -9);
  }
LABEL_6:
  if ((unint64_t)v3 >= a2) {
    return (char *)a2;
  }
  else {
    return v3;
  }
}

void *sub_19D8()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1DDB0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1DDB0))
  {
    sub_1B4C((uint64_t)&unk_1DD48);
    __cxa_guard_release(&qword_1DDB0);
  }
  return &unk_1DD48;
}

void sub_1A38(_Unwind_Exception *a1)
{
}

uint64_t sub_1A50(const __CFString *a1, unsigned char *a2)
{
  int valuePtr = 0;
  *a2 = 0;
  if (a1)
  {
    CFTypeID v4 = CFGetTypeID(a1);
    if (v4 == CFBooleanGetTypeID())
    {
      int valuePtr = CFBooleanGetValue((CFBooleanRef)a1);
LABEL_6:
      *a2 = 1;
      return valuePtr;
    }
    if (v4 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)a1, kCFNumberIntType, &valuePtr);
      goto LABEL_6;
    }
    if (v4 == CFStringGetTypeID())
    {
      CFStringGetCString(a1, buffer, 64, 0x600u);
      if (sscanf(buffer, "%d", &valuePtr) == 1) {
        goto LABEL_6;
      }
    }
  }
  return valuePtr;
}

uint64_t sub_1B4C(uint64_t a1)
{
  *(void *)a1 = 850045863;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = CFSetCreateMutable(0, 0, &kCFTypeSetCallBacks);
  global_queue = dispatch_get_global_queue(0, 0);
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 1uLL, 0, global_queue);
  *(void *)(a1 + 96) = v3;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_1C50;
  handler[3] = &unk_18560;
  handler[4] = a1;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_resume(*(dispatch_object_t *)(a1 + 96));
  return a1;
}

void sub_1C3C(_Unwind_Exception *a1)
{
  std::mutex::~mutex(v1);
  _Unwind_Resume(a1);
}

void sub_1C50(uint64_t a1)
{
}

void sub_1C58(uint64_t a1)
{
  std::mutex::lock((std::mutex *)a1);
  CFSetApplyFunction(*(CFSetRef *)(a1 + 64), (CFSetApplierFunction)sub_1EEC, 0);
  unsigned int v2 = *(CFStringRef **)(a1 + 72);
  v3 = *(CFStringRef **)(a1 + 80);
  while (v2 != v3)
  {
    sub_1E44(v2);
    v2 += 6;
  }

  std::mutex::unlock((std::mutex *)a1);
}

void sub_1CD0(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1CE8(uint64_t a1, CFTypeRef cf1, const void *a3)
{
  v3 = *(CFTypeRef **)(a1 + 72);
  CFTypeID v4 = *(CFTypeRef **)(a1 + 80);
  if (v3 == v4) {
    return 0;
  }
  while (!CFEqual(cf1, *v3) || !CFEqual(a3, v3[1]))
  {
    v3 += 6;
    if (v3 == v4) {
      return 0;
    }
  }
  return 1;
}

void sub_1D58(uint64_t a1, const void *a2, void *a3, uint64_t a4)
{
  value = a3;
  v11 = a2;
  std::mutex::lock((std::mutex *)a1);
  if ((sub_1CE8(a1, a2, a3) & 1) == 0)
  {
    CFRetain(a2);
    CFRetain(a3);
    unint64_t v8 = *(void *)(a1 + 80);
    if (v8 >= *(void *)(a1 + 88))
    {
      uint64_t v9 = sub_1F1C((uint64_t *)(a1 + 72), (uint64_t *)&v11, (uint64_t *)&value, a4);
    }
    else
    {
      sub_203C(*(void **)(a1 + 80), (uint64_t *)&v11, (uint64_t *)&value, a4);
      uint64_t v9 = v8 + 48;
      *(void *)(a1 + 80) = v8 + 48;
    }
    *(void *)(a1 + 80) = v9;
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 64), value);
    sub_1E44((CFStringRef *)(*(void *)(a1 + 80) - 48));
  }
  std::mutex::unlock((std::mutex *)a1);
}

void sub_1E24(_Unwind_Exception *a1)
{
  *(void *)(v1 + 80) = v2;
  std::mutex::unlock((std::mutex *)v1);
  _Unwind_Resume(a1);
}

CFPropertyListRef sub_1E44(CFStringRef *a1)
{
  CFPropertyListRef result = CFPreferencesCopyAppValue(*a1, a1[1]);
  if (result)
  {
    return (CFPropertyListRef)sub_1E98((uint64_t)(a1 + 2), (uint64_t)result);
  }
  return result;
}

uint64_t sub_1E98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    sub_24A8();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v4);
}

uint64_t sub_1EEC(const __CFString *a1)
{
  return CFPreferencesSynchronize(a1, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
}

void sub_1F08(void *a1)
{
}

uint64_t sub_1F1C(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v5 = *a1;
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v7 = v6 + 1;
  if (v6 + 1 > 0x555555555555555) {
    sub_22B0();
  }
  uint64_t v11 = (uint64_t)(a1 + 2);
  unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v5) >> 4);
  if (2 * v12 > v7) {
    unint64_t v7 = 2 * v12;
  }
  if (v12 >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v13 = 0x555555555555555;
  }
  else {
    unint64_t v13 = v7;
  }
  v21 = a1 + 2;
  if (v13) {
    v14 = (char *)sub_2358(v11, v13);
  }
  else {
    v14 = 0;
  }
  v17 = v14;
  v18 = &v14[48 * v6];
  v20 = &v14[48 * v13];
  sub_203C(v18, a2, a3, a4);
  v19 = v18 + 48;
  sub_2200(a1, &v17);
  uint64_t v15 = a1[1];
  sub_2454((uint64_t)&v17);
  return v15;
}

void sub_2028(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2454((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_203C(void *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v5 = *a2;
  uint64_t v6 = *a3;
  sub_20E4((uint64_t)v8, a4);
  *a1 = v5;
  a1[1] = v6;
  sub_20E4((uint64_t)(a1 + 2), (uint64_t)v8);
  sub_217C(v8);
  return a1;
}

void sub_20C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_217C((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_20E4(uint64_t a1, uint64_t a2)
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

void *sub_217C(void *a1)
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

uint64_t *sub_2200(uint64_t *result, void *a2)
{
  uint64_t v3 = result;
  uint64_t v5 = *result;
  uint64_t v4 = result[1];
  uint64_t v6 = a2[1];
  if (v4 == *result)
  {
    uint64_t v7 = a2[1];
  }
  else
  {
    do
    {
      uint64_t v7 = v6 - 48;
      uint64_t v8 = v4 - 48;
      *(_OWORD *)(v6 - 48) = *(_OWORD *)(v4 - 48);
      CFPropertyListRef result = (uint64_t *)sub_23D4(v6 - 32, v4 - 32);
      uint64_t v4 = v8;
      uint64_t v6 = v7;
    }
    while (v8 != v5);
  }
  a2[1] = v7;
  uint64_t v9 = *v3;
  uint64_t *v3 = v7;
  a2[1] = v9;
  uint64_t v10 = v3[1];
  v3[1] = a2[2];
  a2[2] = v10;
  uint64_t v11 = v3[2];
  v3[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return result;
}

void sub_22B0()
{
}

void sub_22C8(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_2324(exception, a1);
}

void sub_2310(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_2324(std::logic_error *a1, const char *a2)
{
  CFPropertyListRef result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_2358(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    sub_23A0();
  }
  return operator new(48 * a2);
}

void sub_23A0()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t sub_23D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 24);
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
  void *v3 = 0;
  return a1;
}

uint64_t sub_2454(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 48;
    sub_217C((void *)(i - 32));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_24A8()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_18618;
}

void sub_24F8(std::exception *a1)
{
  std::exception::~exception(a1);

  operator delete();
}

uint64_t sub_2530(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_18640;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = 0;
  int v3 = pthread_mutex_init((pthread_mutex_t *)(a1 + 24), 0);
  if (v3)
  {
    int v5 = v3;
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6) {
      sub_1094C(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &off_18548;
    exception[2] = v5;
  }
  return a1;
}

uint64_t sub_25E8(uint64_t a1)
{
  *(void *)a1 = off_18640;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
  return a1;
}

void sub_2634(uint64_t a1)
{
  sub_25E8(a1);

  operator delete();
}

BOOL sub_266C(uint64_t a1)
{
  uint64_t v2 = pthread_self();
  int v3 = pthread_equal(v2, (pthread_t)atomic_load_explicit((atomic_ullong *volatile)(a1 + 16), memory_order_acquire));
  if (!v3)
  {
    int v4 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
    if (v4)
    {
      int v6 = v4;
      BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v7) {
        sub_10988(v7, v8, v9, v10, v11, v12, v13, v14);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &off_18548;
      exception[2] = v6;
    }
    atomic_store((unint64_t)v2, (unint64_t *)(a1 + 16));
  }
  return v3 == 0;
}

void sub_272C(uint64_t a1)
{
  uint64_t v2 = pthread_self();
  if (pthread_equal(v2, (pthread_t)atomic_load_explicit((atomic_ullong *volatile)(a1 + 16), memory_order_acquire)))
  {
    atomic_store(0, (unint64_t *)(a1 + 16));
    int v3 = pthread_mutex_unlock((pthread_mutex_t *)(a1 + 24));
    if (v3)
    {
      int v4 = v3;
      BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v5) {
        sub_109C4(v5, v6, v7, v8, v9, v10, v11, v12);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &off_18548;
      exception[2] = v4;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " CAMutex::Unlock: A thread is attempting to unlock a Mutex it doesn't own", v14, 2u);
  }
}

uint64_t sub_2818(uint64_t a1, char *a2)
{
  *a2 = 0;
  int v4 = pthread_self();
  if (pthread_equal(v4, (pthread_t)atomic_load_explicit((atomic_ullong *volatile)(a1 + 16), memory_order_acquire)))
  {
    char v5 = 0;
  }
  else
  {
    int v6 = pthread_mutex_trylock((pthread_mutex_t *)(a1 + 24));
    if (v6 == 16)
    {
      char v5 = 0;
      uint64_t result = 0;
      goto LABEL_7;
    }
    if (v6)
    {
      v10[0] = HIBYTE(v6);
      v10[1] = BYTE2(v6);
      v10[2] = BYTE1(v6);
      int v8 = v6;
      v10[3] = v6;
      v10[4] = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10A00((uint64_t)v10, v8);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &off_18548;
      exception[2] = v8;
    }
    atomic_store((unint64_t)v4, (unint64_t *)(a1 + 16));
    char v5 = 1;
  }
  uint64_t result = 1;
LABEL_7:
  *a2 = v5;
  return result;
}

BOOL sub_292C(uint64_t a1)
{
  return atomic_load_explicit((atomic_ullong *volatile)(a1 + 16), memory_order_acquire) == 0;
}

BOOL sub_2940(uint64_t a1)
{
  uint64_t v2 = pthread_self();
  return pthread_equal(v2, (pthread_t)atomic_load_explicit((atomic_ullong *volatile)(a1 + 16), memory_order_acquire)) != 0;
}

void sub_2978(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_2A88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_35A8(a10);
  }
  _Unwind_Resume(exception_object);
}

void **sub_2AA0(uint64_t *a1, long long *a2)
{
  unint64_t v6 = a1[2];
  uint64_t result = (void **)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(result - 1);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v10 = ((uint64_t)v7 - *a1) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      sub_22B0();
    }
    uint64_t v12 = v5 - *a1;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    v18[4] = result;
    uint64_t v14 = (char *)sub_3004((uint64_t)result, v13);
    uint64_t v15 = &v14[16 * v10];
    v18[0] = v14;
    v18[1] = v15;
    v18[3] = &v14[16 * v16];
    long long v17 = *a2;
    *(_OWORD *)uint64_t v15 = *a2;
    if (*((void *)&v17 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v17 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    v18[2] = v15 + 16;
    sub_2F8C(a1, v18);
    uint64_t v9 = (void *)a1[1];
    uint64_t result = sub_314C(v18);
  }
  else
  {
    void *v7 = *(void *)a2;
    uint64_t v8 = *((void *)a2 + 1);
    v7[1] = v8;
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v9 = v7 + 2;
    a1[1] = (uint64_t)(v7 + 2);
  }
  a1[1] = (uint64_t)v9;
  return result;
}

void sub_2BA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_314C((void **)va);
  _Unwind_Resume(a1);
}

void sub_2E4C(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_35A8(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_2F8C(uint64_t *a1, void *a2)
{
  uint64_t result = sub_303C((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

void *sub_3004(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_23A0();
  }
  return operator new(16 * a2);
}

uint64_t sub_303C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    uint64_t v8 = (_OWORD *)(a7 - 16);
    do
    {
      long long v9 = *((_OWORD *)a3 - 1);
      a3 -= 2;
      *uint64_t v8 = v9;
      *a3 = 0;
      a3[1] = 0;
      *((void *)&v15 + 1) = v8;
      v7 -= 16;
      --v8;
    }
    while (a3 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  sub_30D0((uint64_t)v12);
  return v10;
}

uint64_t sub_30D0(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_3108(a1);
  }
  return a1;
}

void sub_3108(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    int v3 = *(std::__shared_weak_count **)(v1 + 8);
    if (v3) {
      sub_35A8(v3);
    }
    v1 += 16;
  }
}

void **sub_314C(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_3180(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v1 = *(void *)(a1 + 16);
  while (v1 != v2)
  {
    *(void *)(a1 + 16) = v1 - 16;
    int v4 = *(std::__shared_weak_count **)(v1 - 8);
    if (v4)
    {
      sub_35A8(v4);
      uint64_t v1 = *(void *)(a1 + 16);
    }
    else
    {
      v1 -= 16;
    }
  }
}

void sub_31D4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 16)
  {
    int v4 = *(std::__shared_weak_count **)(i - 8);
    if (v4) {
      sub_35A8(v4);
    }
  }
  a1[1] = v2;
}

void sub_3220()
{
}

void sub_3238(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_3294(exception, a1);
}

void sub_3280(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_3294(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_32C8(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_31D4((uint64_t *)v2);
    int v3 = **a1;
    operator delete(v3);
  }
}

void sub_331C(uint64_t a1, uint64_t *a2)
{
  int v3 = operator new(0x48uLL);
  sub_3380(v3, a2);
}

void sub_336C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_3380(void *a1, uint64_t *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_186C8;
  sub_3480((uint64_t)(a1 + 3), *a2);
}

void sub_33D0(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_33E4(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_186C8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_3404(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_186C8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_3458(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void sub_3480(uint64_t a1, uint64_t a2)
{
  int v4 = sub_108B4((void *)(a1 + 16));
  *(_DWORD *)(a1 + 8) = 1;
  *(void *)a1 = off_18700;
  sub_10904(v4, a2);
}

void sub_34F0(_Unwind_Exception *a1)
{
  sub_108C4(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_3504(uint64_t a1)
{
  return a1;
}

void sub_3530(uint64_t a1)
{
  sub_108C4(a1 + 16);

  operator delete();
}

uint64_t sub_357C(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void sub_35A8(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_361C(uint64_t a1, CFUUIDRef factoryID)
{
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)(a1 + 72) = 0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)a1 = off_18728;
  *(void *)(a1 + 8) = &unk_1DB00;
  *(void *)(a1 + 16) = factoryID;
  CFPlugInAddInstanceForFactory(factoryID);
  *(void *)(a1 + 24) = 1;
  int v3 = off_187E0;
  uint64_t v4 = a1;
  operator new();
}

void sub_385C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_1F08(exception_object);
}

void *sub_3950(void *a1, uint64_t *a2)
{
  sub_52BC((uint64_t *)&v6, a2);
  int v3 = (std::__shared_weak_count *)a1[1];
  long long v4 = v6;
  *(void *)&long long v6 = *a1;
  *((void *)&v6 + 1) = v3;
  *(_OWORD *)a1 = v4;
  if (v3) {
    sub_35A8(v3);
  }
  return a1;
}

void *sub_399C(void *a1)
{
  *a1 = off_18728;
  CFUUIDRef v2 = (const __CFUUID *)a1[2];
  if (v2) {
    CFPlugInRemoveInstanceForFactory(v2);
  }
  int v3 = (std::__shared_weak_count *)a1[10];
  if (v3) {
    sub_35A8(v3);
  }
  long long v4 = (std::__shared_weak_count *)a1[7];
  if (v4) {
    sub_35A8(v4);
  }
  return a1;
}

void sub_3A08(void *a1)
{
  sub_399C(a1);

  operator delete();
}

uint64_t sub_3A40(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1[6];
  if (!v5) {
    return 7;
  }
  a1[4] = a3;
  a1[5] = a4;
  (*(void (**)(uint64_t))(*(void *)v5 + 16))(v5);
  return 0;
}

uint64_t sub_3A94(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 72);
  if (!v4) {
    return 7;
  }
  *(_DWORD *)(a1 + 64) = a2;
  (*(void (**)(uint64_t, uint64_t))(*(void *)v4 + 16))(v4, a3);
  return 0;
}

uint64_t sub_3AEC()
{
  return 0;
}

uint64_t sub_3AF4()
{
  return 0;
}

uint64_t sub_3AFC()
{
  return 0;
}

uint64_t sub_3B04()
{
  return 0;
}

uint64_t sub_3B0C()
{
  return 0;
}

uint64_t sub_3B14()
{
  return 0;
}

uint64_t sub_3B1C()
{
  return 0;
}

uint64_t sub_3B24()
{
  return 0;
}

uint64_t sub_3B2C(_DWORD *a1, CFUUIDBytes a2, void *a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Fu, 0xD9u, 0x4Du, 0xFu, 0x8Cu, 0x2Au, 0x48u, 0x2Au, 0x8Au, 0xD8u, 0x7Du, 0x9Eu, 0xA3u, 0x81u, 0xC9u, 0xC1u);
  if (CFEqual(v5, v6))
  {
    (*(void (**)(_DWORD *))(*(void *)a1 + 16))(a1);
    *a3 = a1;
    CFRelease(v5);
    uint64_t result = 0;
    int v8 = 3;
LABEL_5:
    a1[5] = v8;
    return result;
  }
  CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(0, 0x43u, 0xC9u, 0x8Cu, 0x3Cu, 0x30u, 0x6Cu, 0x11u, 0xD5u, 0xAFu, 0x73u, 0, 0x30u, 0x65u, 0xA8u, 0x30u, 0x1Eu);
  if (CFEqual(v5, v9))
  {
    (*(void (**)(_DWORD *))(*(void *)a1 + 16))(a1);
    *a3 = a1;
    CFRelease(v5);
    uint64_t result = 0;
    int v8 = 2;
    goto LABEL_5;
  }
  CFUUIDRef v10 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v5, v10))
  {
    (*(void (**)(_DWORD *))(*(void *)a1 + 16))(a1);
    *a3 = a1;
    CFRelease(v5);
    return 0;
  }
  else
  {
    *a3 = 0;
    CFRelease(v5);
    return 2147483652;
  }
}

uint64_t sub_3CE4(uint64_t a1)
{
  uint64_t v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t sub_3CF8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16);
  uint64_t v2 = (v1 - 1);
  *(_DWORD *)(a1 + 16) = v2;
  if (v1 == 1) {
    (*(void (**)(void))(*(void *)(a1 - 8) + 8))();
  }
  return v2;
}

uint64_t sub_3D4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 16))();
}

uint64_t sub_3D70(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 24))();
}

uint64_t sub_3D94(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 32))();
}

uint64_t sub_3DB8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 40))();
}

uint64_t sub_3DDC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 48))();
}

uint64_t sub_3E00(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 56))();
}

uint64_t sub_3E24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 64))();
}

uint64_t sub_3E48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 72))();
}

uint64_t sub_3E6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 80))();
}

uint64_t sub_3E90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 88))();
}

void *sub_3EB4(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *a2 = (uint64_t)&off_187B8;
  *a1 = off_18798;
  a1[1] = v3;
  (*(void (**)(void *, uint64_t *))(v3 + 16))(a1 + 2, a2 + 1);
  bzero(a1 + 8, 0x300uLL);
  return a1;
}

void *sub_3F1C(void *a1)
{
  *a1 = off_18798;
  (*(void (**)(void *))(a1[1] + 24))(a1 + 2);
  return a1;
}

void sub_3F70(void *a1)
{
  *a1 = off_18798;
  (*(void (**)(void *))(a1[1] + 24))(a1 + 2);

  operator delete();
}

uint64_t sub_3FE4(uint64_t *a1, _DWORD *a2)
{
  uint64_t v7 = a1[1];
  (*(void (**)(void *, uint64_t *))(v7 + 8))(v8, a1 + 2);
  int v9 = 0;
  v8[6] = &v10;
  if (*a2 == 2)
  {
    v5[0] = a1;
    v5[1] = &v7;
    CFUUIDRef v6 = v5;
    sub_4958((uint64_t)a2, (uint64_t **)&v6);
  }
  else
  {
    if (*a2 != 1) {
      std::terminate();
    }
    CFUUIDRef v6 = (uint64_t **)&v7;
    v5[0] = (uint64_t *)&v6;
    sub_4174((uint64_t)a2, v5);
  }
  return sub_51FC((uint64_t)&v7);
}

void sub_40C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_51FC((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_40E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  return (**(uint64_t (***)(uint64_t, uint64_t *))(a1 + 8))(a1 + 16, &v3);
}

void sub_411C()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_18618;
}

uint64_t sub_4174(uint64_t result, uint64_t **a2)
{
  if (*(_DWORD *)(result + 4))
  {
    uint64_t v3 = result;
    unsigned int v4 = 0;
    uint64_t v5 = result + 8;
    do
    {
      uint64_t v6 = *(unsigned int *)(v5 + 8);
      v11[0] = v5 + 12;
      v11[1] = v6;
      v11[2] = *(void *)v5;
      v11[3] = 0;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v8 = 0;
      uint64_t result = sub_424C(v11, &v10, &v8);
      if (result)
      {
        do
        {
          uint64_t v7 = *a2;
          uint64_t v13 = v10;
          v12[0] = *v7;
          v12[1] = (uint64_t)&v13;
          sub_4318((unsigned __int16 *)&v8, v12);
          uint64_t v9 = 0;
          uint64_t v10 = 0;
          uint64_t v8 = 0;
          uint64_t result = sub_424C(v11, &v10, &v8);
        }
        while ((result & 1) != 0);
      }
      v5 += 4 * *(unsigned int *)(v5 + 8) + 12;
      ++v4;
    }
    while (v4 < *(_DWORD *)(v3 + 4));
  }
  return result;
}

uint64_t sub_424C(uint64_t *a1, void *a2, _DWORD *a3)
{
  unint64_t v3 = a1[1];
  unint64_t v4 = a1[3];
  if (v4 >= v3) {
    return 0;
  }
  uint64_t v5 = *a1;
  uint64_t v6 = (unsigned int *)(*a1 + 4 * v4);
  unint64_t v7 = *v6;
  unint64_t v8 = v4 + byte_13478[v7 >> 28];
  if (v8 > v3) {
    return 0;
  }
  *a2 = a1[2];
  switch((uint64_t)(v5 + 4 * v8 - (void)v6) >> 2)
  {
    case 0:
      goto LABEL_9;
    case 1:
      goto LABEL_8;
    case 2:
      goto LABEL_7;
    case 3:
      goto LABEL_6;
    case 4:
      *a3++ = v7;
      unsigned int v10 = v6[1];
      ++v6;
      LODWORD(v7) = v10;
LABEL_6:
      *a3++ = v7;
      unsigned int v11 = v6[1];
      ++v6;
      LODWORD(v7) = v11;
LABEL_7:
      *a3++ = v7;
      LODWORD(v7) = v6[1];
LABEL_8:
      *a3 = v7;
LABEL_9:
      a1[3] = v8;
      uint64_t result = 1;
      break;
    default:
      std::terminate();
      return result;
  }
  return result;
}

unsigned __int16 *sub_4318(unsigned __int16 *result, uint64_t *a2)
{
  unint64_t v3 = *(unsigned int *)result;
  unsigned int v4 = v3 >> 28;
  if (v3 >> 28 == 3)
  {
    size_t v13 = (v3 >> 16) & 0xF;
    if (v13 > 6 || BYTE2(v3) > 0x3Fu) {
      return result;
    }
    unsigned int v14 = (v3 >> 20) + 3;
    unsigned int v15 = bswap32(*((_DWORD *)result + 1));
    v32[0] = bswap32(v3);
    v32[1] = v15;
    if ((v3 & 0x200000) != 0)
    {
      size_t v6 = 0;
      if (!v13) {
        goto LABEL_39;
      }
    }
    else
    {
      unsigned __int8 __src = -16;
      size_t v6 = 1;
      if (!v13)
      {
LABEL_39:
        if ((v14 & 2) != 0) {
          *(&__src + v6++) = -9;
        }
        uint64_t v7 = *a2;
        uint64_t v25 = *(void *)a2[1];
        unint64_t v9 = *(void *)(*a2 + 56);
        unint64_t v26 = v7 + 1088;
        int v27 = *(_DWORD *)(v7 + 64);
        if (v27)
        {
          uint64_t v28 = *(unsigned __int16 *)(v9 + 8);
          if (*(void *)v9 == v25 && *(unsigned __int8 *)(v28 + v9 + 9) != 247 && __src != 240)
          {
            if (v9 + v6 + v28 + 10 <= v26) {
              goto LABEL_54;
            }
            goto LABEL_52;
          }
          unint64_t v9 = (v9 + v28 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        }
        if (v9 + v6 + 10 <= v26)
        {
          LODWORD(v28) = 0;
          *(_DWORD *)(v7 + 64) = v27 + 1;
          *(void *)unint64_t v9 = v25;
          *(_WORD *)(v9 + 8) = 0;
LABEL_54:
          uint64_t result = (unsigned __int16 *)(v9 + v28 + 10);
          p_src = &__src;
          switch(v6)
          {
            case 0uLL:
              break;
            case 1uLL:
              goto LABEL_64;
            case 2uLL:
              goto LABEL_63;
            case 3uLL:
              goto LABEL_62;
            case 4uLL:
LABEL_61:
              p_src = (unsigned __int8 *)&v34;
              *(unsigned char *)uint64_t result = __src;
              uint64_t result = (unsigned __int16 *)((char *)result + 1);
LABEL_62:
              char v30 = *p_src++;
              *(unsigned char *)uint64_t result = v30;
              uint64_t result = (unsigned __int16 *)((char *)result + 1);
LABEL_63:
              char v31 = *p_src++;
              *(unsigned char *)uint64_t result = v31;
              uint64_t result = (unsigned __int16 *)((char *)result + 1);
LABEL_64:
              *(unsigned char *)uint64_t result = *p_src;
              break;
            default:
LABEL_68:
              uint64_t result = (unsigned __int16 *)memmove(result, &__src, v6);
              break;
          }
          *(_WORD *)(v9 + 8) += v6;
          goto LABEL_66;
        }
LABEL_52:
        uint64_t result = (unsigned __int16 *)sub_4790(v7, v25, (char *)&__src, v6);
LABEL_58:
        unint64_t v9 = (unint64_t)result;
LABEL_66:
        *(void *)(v7 + 56) = v9;
        return result;
      }
    }
    memcpy(&__src + v6, (char *)v32 + 2, v13);
    v6 += (v13 - 1) + 1;
    goto LABEL_39;
  }
  if (v4 == 2)
  {
    int v16 = v3 & 0xE00000;
    unsigned __int8 __src = BYTE2(*(_DWORD *)result);
    char v34 = BYTE1(v3) & 0x7F;
    if ((v3 & 0xE00000) == 0xC00000) {
      size_t v17 = 2;
    }
    else {
      size_t v17 = 3;
    }
    if (v16 != 12582912) {
      char v35 = v3 & 0x7F;
    }
    uint64_t v18 = *a2;
    uint64_t v19 = *(void *)a2[1];
    uint64_t result = *(unsigned __int16 **)(*a2 + 56);
    unint64_t v20 = *a2 + 1088;
    int v21 = *(_DWORD *)(*a2 + 64);
    if (v21)
    {
      uint64_t v22 = result[4];
      if (*(void *)result == v19 && BYTE2(v3) != 240 && *((unsigned __int8 *)result + v22 + 9) != 247)
      {
        if ((unint64_t)result + v17 + v22 + 10 <= v20) {
          goto LABEL_35;
        }
        goto LABEL_33;
      }
      uint64_t result = (unsigned __int16 *)(((unint64_t)result + v22 + 13) & 0xFFFFFFFFFFFFFFFCLL);
    }
    if ((unint64_t)result + v17 + 10 <= v20)
    {
      LODWORD(v22) = 0;
      *(_DWORD *)(v18 + 64) = v21 + 1;
      *(void *)uint64_t result = v19;
      result[4] = 0;
LABEL_35:
      v23 = (unsigned __int8 *)result + v22 + 10;
      if (v16 == 12582912)
      {
        v24 = &__src;
      }
      else
      {
        v24 = (unsigned __int8 *)&v34;
        unsigned __int8 *v23 = __src;
        v23 = (unsigned __int8 *)result + v22 + 11;
      }
      unsigned __int8 *v23 = *v24;
      v23[1] = v24[1];
      result[4] += v17;
      goto LABEL_49;
    }
LABEL_33:
    uint64_t result = (unsigned __int16 *)sub_4790(*a2, v19, (char *)&__src, v17);
LABEL_49:
    *(void *)(v18 + 56) = result;
    return result;
  }
  if (v4 == 1)
  {
    unsigned int v5 = BYTE2(v3) - 240;
    if (BYTE2(v3) >= 0xF0u)
    {
      size_t v6 = byte_1DB70[v5];
      if (byte_1DB70[v5])
      {
        unsigned __int8 __src = BYTE2(*(_DWORD *)result);
        if (v6 != 1)
        {
          char v34 = BYTE1(v3) & 0x7F;
          if (v6 >= 3) {
            char v35 = v3 & 0x7F;
          }
        }
        uint64_t v7 = *a2;
        uint64_t v8 = *(void *)a2[1];
        unint64_t v9 = *(void *)(*a2 + 56);
        unint64_t v10 = v7 + 1088;
        int v11 = *(_DWORD *)(v7 + 64);
        if (v11)
        {
          uint64_t v12 = *(unsigned __int16 *)(v9 + 8);
          if (*(void *)v9 == v8 && BYTE2(v3) != 240 && *(unsigned __int8 *)(v12 + v9 + 9) != 247)
          {
            if (v9 + v12 + v6 + 10 <= v10) {
              goto LABEL_60;
            }
LABEL_57:
            uint64_t result = (unsigned __int16 *)sub_4790(v7, v8, (char *)&__src, v6);
            goto LABEL_58;
          }
          unint64_t v9 = (v9 + v12 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        }
        if (v9 + v6 + 10 <= v10)
        {
          LODWORD(v12) = 0;
          *(_DWORD *)(v7 + 64) = v11 + 1;
          *(void *)unint64_t v9 = v8;
          *(_WORD *)(v9 + 8) = 0;
LABEL_60:
          uint64_t result = (unsigned __int16 *)(v9 + v12 + 10);
          p_src = &__src;
          switch((int)v6)
          {
            case 1:
              goto LABEL_64;
            case 2:
              goto LABEL_63;
            case 3:
              goto LABEL_62;
            case 4:
              goto LABEL_61;
            default:
              goto LABEL_68;
          }
        }
        goto LABEL_57;
      }
    }
  }
  return result;
}

uint64_t sub_4790(uint64_t a1, uint64_t a2, char *a3, size_t a4)
{
  if (*(_DWORD *)(a1 + 64)
    && (uint64_t v16 = a1 + 64,
        (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v16),
        *(_DWORD *)(a1 + 64) = 0,
        uint64_t v8 = a1 + 68,
        a1 + 68 + a4 + 10 <= a1 + 1088))
  {
    *(_DWORD *)(a1 + 64) = 1;
    *(void *)(a1 + 68) = a2;
    *(_WORD *)(a1 + 76) = 0;
    unint64_t v9 = (char *)(a1 + 78);
    __int16 v10 = 0;
    switch(a4)
    {
      case 0uLL:
        break;
      case 1uLL:
        goto LABEL_8;
      case 2uLL:
        goto LABEL_7;
      case 3uLL:
        goto LABEL_6;
      case 4uLL:
        char v11 = *a3++;
        unint64_t v9 = (char *)(a1 + 79);
        *(unsigned char *)(a1 + 78) = v11;
LABEL_6:
        char v12 = *a3++;
        *v9++ = v12;
LABEL_7:
        char v13 = *a3++;
        *v9++ = v13;
LABEL_8:
        *unint64_t v9 = *a3;
        __int16 v10 = *(_WORD *)(a1 + 76);
        break;
      default:
        if (a4) {
          memmove(v9, a3, a4);
        }
        __int16 v10 = 0;
        break;
    }
    *(_WORD *)(a1 + 76) = v10 + a4;
  }
  else
  {
    MIDI::LegacyPacketList::create();
    uint64_t v16 = v15;
    (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v16);
    sub_492C(&v15, 0);
    uint64_t v8 = a1 + 68;
    *(void *)(a1 + 56) = a1 + 68;
    *(_DWORD *)(a1 + 64) = 0;
    sub_492C(&v15, 0);
  }
  return v8;
}

void sub_4900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t *sub_492C(uint64_t *result, uint64_t a2)
{
  uint64_t v3 = *result;
  std::logic_error *result = a2;
  if (v3) {
    return (uint64_t *)MIDI::LegacyPacketListDeleter::operator()();
  }
  return result;
}

uint64_t sub_4958(uint64_t result, uint64_t **a2)
{
  if (*(_DWORD *)(result + 4))
  {
    uint64_t v3 = result;
    unsigned int v4 = 0;
    uint64_t v5 = result + 8;
    do
    {
      uint64_t v6 = *(unsigned int *)(v5 + 8);
      v12[0] = v5 + 12;
      v12[1] = v6;
      uint64_t v12[2] = *(void *)v5;
      void v12[3] = 0;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v9 = 0;
      uint64_t result = sub_424C(v12, &v11, &v9);
      if (result)
      {
        do
        {
          uint64_t v7 = *a2;
          uint64_t v14 = v11;
          uint64_t v8 = *v7;
          *(void *)&long long v13 = v7[1];
          *((void *)&v13 + 1) = &v14;
          sub_4A34((unsigned __int16 *)(v8 + 64), (unsigned __int16 *)&v9, &v13);
          uint64_t v10 = 0;
          uint64_t v11 = 0;
          uint64_t v9 = 0;
          uint64_t result = sub_424C(v12, &v11, &v9);
        }
        while ((result & 1) != 0);
      }
      v5 += 4 * *(unsigned int *)(v5 + 8) + 12;
      ++v4;
    }
    while (v4 < *(_DWORD *)(v3 + 4));
  }
  return result;
}

unsigned __int16 *sub_4A34(unsigned __int16 *result, unsigned __int16 *a2, long long *a3)
{
  unint64_t v3 = *(unsigned int *)a2;
  if (((1 << (v3 >> 28)) & 0xA02F) != 0)
  {
    long long v29 = *a3;
    uint64_t v5 = a2;
    return sub_4D84(v5, (uint64_t *)&v29);
  }
  else if (v3 >> 28 == 4)
  {
    unsigned int v6 = BYTE3(v3) & 0xF | 0x20;
    unsigned int v7 = *((_DWORD *)a2 + 1);
    switch(BYTE2(v3) >> 4)
    {
      case 2:
      case 3:
        uint64_t v10 = &result[24 * (BYTE3(v3) & 0xF)];
        uint64_t v11 = (v3 >> 16) & 0xF;
        char v12 = (unsigned __int8 *)v10 + 3 * v11;
        unsigned int v13 = (v3 >> 8) & 0x7F;
        int v14 = *(_DWORD *)a2 & 0x7F;
        int v15 = (v7 >> 18) & 0x7F;
        if ((v3 & 0x100000) != 0) {
          int v16 = 2;
        }
        else {
          int v16 = 1;
        }
        if (v16 == *v12 && v13 == v12[1])
        {
          int v17 = v11 | 0xB0;
          if (v14 == *((unsigned __int8 *)v10 + 3 * v11 + 2))
          {
            int v18 = (v6 << 24) | (v17 << 16);
            goto LABEL_22;
          }
        }
        else
        {
          int v17 = v11 | 0xB0;
        }
        if ((v3 & 0x100000) != 0) {
          int v19 = 25344;
        }
        else {
          int v19 = 25856;
        }
        int v28 = 0;
        *(_DWORD *)&v27[8] = 0;
        int v18 = (v6 << 24) | (v17 << 16);
        int v20 = v18 | v19;
        char v26 = v13;
        *(void *)int v27 = v18 | v19 | v13;
        long long v29 = *a3;
        sub_4D84((unsigned __int16 *)v27, (uint64_t *)&v29);
        int v28 = 0;
        *(_DWORD *)&v27[8] = 0;
        *(void *)int v27 = (v20 | v14) - 256;
        long long v29 = *a3;
        sub_4D84((unsigned __int16 *)v27, (uint64_t *)&v29);
        *char v12 = v16;
        int v21 = (char *)v10 + 3 * v11;
        v21[1] = v26;
        v21[2] = v14;
LABEL_22:
        int v28 = 0;
        *(_DWORD *)&v27[8] = 0;
        *(void *)int v27 = v18 | (v7 >> 25) | 0x600;
        long long v29 = *a3;
        uint64_t result = sub_4D84((unsigned __int16 *)v27, (uint64_t *)&v29);
        if (v15)
        {
          int v28 = 0;
          *(void *)&v27[4] = 0;
          int v8 = v15 | v18;
          int v9 = 9728;
          goto LABEL_24;
        }
        break;
      case 8:
      case 9:
      case 10:
      case 11:
        int v8 = v7 >> 25;
        if (!(v7 >> 25)) {
          int v8 = BYTE2(v3) >> 4 == 9;
        }
        int v28 = 0;
        *(void *)&v27[4] = 0;
        int v9 = (BYTE2(v3) << 16) | (v6 << 24) | v3 & 0x7F00;
LABEL_24:
        int v22 = v8 | v9;
        goto LABEL_25;
      case 12:
        if (v3)
        {
          int v28 = 0;
          *(_DWORD *)&v27[8] = 0;
          unsigned int v23 = v6 << 24;
          int v24 = BYTE2(v3) << 16;
          int v25 = (v24 - 0x100000) | (v6 << 24);
          *(void *)int v27 = (v24 - 0x100000) & 0xFFFFFF80 | (v6 << 24) | (v7 >> 8) & 0x7F;
          long long v29 = *a3;
          sub_4D84((unsigned __int16 *)v27, (uint64_t *)&v29);
          int v28 = 0;
          *(_DWORD *)&v27[8] = 0;
          *(void *)int v27 = v25 & 0xFFFFFF80 | v7 & 0x7F | 0x2000;
          long long v29 = *a3;
          sub_4D84((unsigned __int16 *)v27, (uint64_t *)&v29);
        }
        else
        {
          unsigned int v23 = v6 << 24;
          int v24 = BYTE2(v3) << 16;
        }
        int v28 = 0;
        *(void *)&v27[4] = 0;
        int v22 = HIWORD(v7) & 0x7F00 | v23 | v24;
        goto LABEL_25;
      case 13:
        int v28 = 0;
        *(void *)&v27[4] = 0;
        int v22 = (BYTE2(v3) << 16) | (v6 << 24) | (v7 >> 25 << 8);
        goto LABEL_25;
      case 14:
        int v28 = 0;
        *(void *)&v27[4] = 0;
        int v22 = (v7 >> 10) & 0x7F00 | (BYTE2(v3) << 16) | (v6 << 24) | (v7 >> 25);
LABEL_25:
        *(_DWORD *)int v27 = v22;
        long long v29 = *a3;
        uint64_t v5 = (unsigned __int16 *)v27;
        return sub_4D84(v5, (uint64_t *)&v29);
      default:
        return result;
    }
  }
  return result;
}

unsigned __int16 *sub_4D84(unsigned __int16 *result, uint64_t *a2)
{
  unint64_t v3 = *(unsigned int *)result;
  unsigned int v4 = v3 >> 28;
  if (v3 >> 28 == 3)
  {
    size_t v13 = (v3 >> 16) & 0xF;
    if (v13 > 6 || BYTE2(v3) > 0x3Fu) {
      return result;
    }
    unsigned int v14 = (v3 >> 20) + 3;
    unsigned int v15 = bswap32(*((_DWORD *)result + 1));
    v32[0] = bswap32(v3);
    v32[1] = v15;
    if ((v3 & 0x200000) != 0)
    {
      size_t v6 = 0;
      if (!v13) {
        goto LABEL_39;
      }
    }
    else
    {
      unsigned __int8 __src = -16;
      size_t v6 = 1;
      if (!v13)
      {
LABEL_39:
        if ((v14 & 2) != 0) {
          *(&__src + v6++) = -9;
        }
        uint64_t v7 = *a2;
        uint64_t v25 = *(void *)a2[1];
        unint64_t v9 = *(void *)(*a2 + 56);
        unint64_t v26 = v7 + 1088;
        int v27 = *(_DWORD *)(v7 + 64);
        if (v27)
        {
          uint64_t v28 = *(unsigned __int16 *)(v9 + 8);
          if (*(void *)v9 == v25 && *(unsigned __int8 *)(v28 + v9 + 9) != 247 && __src != 240)
          {
            if (v9 + v6 + v28 + 10 <= v26) {
              goto LABEL_54;
            }
            goto LABEL_52;
          }
          unint64_t v9 = (v9 + v28 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        }
        if (v9 + v6 + 10 <= v26)
        {
          LODWORD(v28) = 0;
          *(_DWORD *)(v7 + 64) = v27 + 1;
          *(void *)unint64_t v9 = v25;
          *(_WORD *)(v9 + 8) = 0;
LABEL_54:
          uint64_t result = (unsigned __int16 *)(v9 + v28 + 10);
          p_src = &__src;
          switch(v6)
          {
            case 0uLL:
              break;
            case 1uLL:
              goto LABEL_64;
            case 2uLL:
              goto LABEL_63;
            case 3uLL:
              goto LABEL_62;
            case 4uLL:
LABEL_61:
              p_src = (unsigned __int8 *)&v34;
              *(unsigned char *)uint64_t result = __src;
              uint64_t result = (unsigned __int16 *)((char *)result + 1);
LABEL_62:
              char v30 = *p_src++;
              *(unsigned char *)uint64_t result = v30;
              uint64_t result = (unsigned __int16 *)((char *)result + 1);
LABEL_63:
              char v31 = *p_src++;
              *(unsigned char *)uint64_t result = v31;
              uint64_t result = (unsigned __int16 *)((char *)result + 1);
LABEL_64:
              *(unsigned char *)uint64_t result = *p_src;
              break;
            default:
LABEL_68:
              uint64_t result = (unsigned __int16 *)memmove(result, &__src, v6);
              break;
          }
          *(_WORD *)(v9 + 8) += v6;
          goto LABEL_66;
        }
LABEL_52:
        uint64_t result = (unsigned __int16 *)sub_4790(v7, v25, (char *)&__src, v6);
LABEL_58:
        unint64_t v9 = (unint64_t)result;
LABEL_66:
        *(void *)(v7 + 56) = v9;
        return result;
      }
    }
    memcpy(&__src + v6, (char *)v32 + 2, v13);
    v6 += (v13 - 1) + 1;
    goto LABEL_39;
  }
  if (v4 == 2)
  {
    int v16 = v3 & 0xE00000;
    unsigned __int8 __src = BYTE2(*(_DWORD *)result);
    char v34 = BYTE1(v3) & 0x7F;
    if ((v3 & 0xE00000) == 0xC00000) {
      size_t v17 = 2;
    }
    else {
      size_t v17 = 3;
    }
    if (v16 != 12582912) {
      char v35 = v3 & 0x7F;
    }
    uint64_t v18 = *a2;
    uint64_t v19 = *(void *)a2[1];
    uint64_t result = *(unsigned __int16 **)(*a2 + 56);
    unint64_t v20 = *a2 + 1088;
    int v21 = *(_DWORD *)(*a2 + 64);
    if (v21)
    {
      uint64_t v22 = result[4];
      if (*(void *)result == v19 && BYTE2(v3) != 240 && *((unsigned __int8 *)result + v22 + 9) != 247)
      {
        if ((unint64_t)result + v17 + v22 + 10 <= v20) {
          goto LABEL_35;
        }
        goto LABEL_33;
      }
      uint64_t result = (unsigned __int16 *)(((unint64_t)result + v22 + 13) & 0xFFFFFFFFFFFFFFFCLL);
    }
    if ((unint64_t)result + v17 + 10 <= v20)
    {
      LODWORD(v22) = 0;
      *(_DWORD *)(v18 + 64) = v21 + 1;
      *(void *)uint64_t result = v19;
      result[4] = 0;
LABEL_35:
      unsigned int v23 = (unsigned __int8 *)result + v22 + 10;
      if (v16 == 12582912)
      {
        int v24 = &__src;
      }
      else
      {
        int v24 = (unsigned __int8 *)&v34;
        unsigned __int8 *v23 = __src;
        unsigned int v23 = (unsigned __int8 *)result + v22 + 11;
      }
      unsigned __int8 *v23 = *v24;
      v23[1] = v24[1];
      result[4] += v17;
      goto LABEL_49;
    }
LABEL_33:
    uint64_t result = (unsigned __int16 *)sub_4790(*a2, v19, (char *)&__src, v17);
LABEL_49:
    *(void *)(v18 + 56) = result;
    return result;
  }
  if (v4 == 1)
  {
    int v5 = BYTE2(v3) - 240;
    if (BYTE2(v3) >= 0xF0u)
    {
      size_t v6 = byte_1DB70[v5];
      if (byte_1DB70[v5])
      {
        unsigned __int8 __src = BYTE2(*(_DWORD *)result);
        if (v6 != 1)
        {
          char v34 = BYTE1(v3) & 0x7F;
          if (v6 >= 3) {
            char v35 = v3 & 0x7F;
          }
        }
        uint64_t v7 = *a2;
        uint64_t v8 = *(void *)a2[1];
        unint64_t v9 = *(void *)(*a2 + 56);
        unint64_t v10 = v7 + 1088;
        int v11 = *(_DWORD *)(v7 + 64);
        if (v11)
        {
          uint64_t v12 = *(unsigned __int16 *)(v9 + 8);
          if (*(void *)v9 == v8 && BYTE2(v3) != 240 && *(unsigned __int8 *)(v12 + v9 + 9) != 247)
          {
            if (v9 + v12 + v6 + 10 <= v10) {
              goto LABEL_60;
            }
LABEL_57:
            uint64_t result = (unsigned __int16 *)sub_4790(v7, v8, (char *)&__src, v6);
            goto LABEL_58;
          }
          unint64_t v9 = (v9 + v12 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        }
        if (v9 + v6 + 10 <= v10)
        {
          LODWORD(v12) = 0;
          *(_DWORD *)(v7 + 64) = v11 + 1;
          *(void *)unint64_t v9 = v8;
          *(_WORD *)(v9 + 8) = 0;
LABEL_60:
          uint64_t result = (unsigned __int16 *)(v9 + v12 + 10);
          p_src = &__src;
          switch((int)v6)
          {
            case 1:
              goto LABEL_64;
            case 2:
              goto LABEL_63;
            case 3:
              goto LABEL_62;
            case 4:
              goto LABEL_61;
            default:
              goto LABEL_68;
          }
        }
        goto LABEL_57;
      }
    }
  }
  return result;
}

uint64_t sub_51FC(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 64))
  {
    uint64_t v3 = a1 + 64;
    (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v3);
  }
  *(_DWORD *)(a1 + 64) = 0;
  *(void *)(a1 + 56) = a1 + 68;
  (*(void (**)(uint64_t))(*(void *)a1 + 24))(a1 + 8);
  return a1;
}

uint64_t sub_5270(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)*a1 + 72))(*a1, *(unsigned int *)(*a1 + 64), *a2);
}

void *sub_52A0(void *result, void *a2)
{
  std::logic_error *result = *a2;
  return result;
}

void *sub_52AC(void *result, void *a2)
{
  std::logic_error *result = *a2;
  return result;
}

uint64_t *sub_52BC(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  std::logic_error *result = *a2;
  if (v2) {
    operator new();
  }
  result[1] = 0;
  *a2 = 0;
  return result;
}

void sub_5340(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_5378(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t sub_53AC(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)*a1 + 48))(*a1, *a2, *(void *)(*a1 + 32), *(void *)(*a1 + 40));
}

void *sub_53DC(void *result, void *a2)
{
  std::logic_error *result = *a2;
  return result;
}

void *sub_53E8(void *result, void *a2)
{
  std::logic_error *result = *a2;
  return result;
}

void sub_54B4()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1DDC0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1DDC0))
  {
    qword_1DDB8 = (uint64_t)os_log_create("com.apple.coremidi", "blecen");
    __cxa_guard_release(&qword_1DDC0);
  }
}

void sub_6328(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long buf)
{
  if (a2)
  {
    __cxa_begin_catch(a1);
    sub_54B4();
    size_t v17 = qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315394;
      *(void *)((char *)&buf + 4) = "BTLEMIDIDriverCentral.mm";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 245;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: retrieveConnectedPeripheralsWithServices threw an exception.", (uint8_t *)&buf, 0x12u);
    }
    __cxa_end_catch();
    JUMPOUT(0x62F4);
  }
  _Unwind_Resume(a1);
}

void sub_9850()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1DDD0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1DDD0))
  {
    qword_1DDC8 = (uint64_t)os_log_create("com.apple.coremidi", "blelcp");
    __cxa_guard_release(&qword_1DDD0);
  }
}

id sub_B2A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendIfReady];
}

id sub_BBDC(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 sendIfReady];
}

void sub_BFCC()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1DDE0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1DDE0))
  {
    qword_1DDD8 = (uint64_t)os_log_create("com.apple.coremidi", "btlets");
    __cxa_guard_release(&qword_1DDE0);
  }
}

void sub_C7C0()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1DDF0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1DDF0))
  {
    qword_1DDE8 = (uint64_t)os_log_create("com.apple.coremidi", "btdrcv");
    __cxa_guard_release(&qword_1DDF0);
  }
}

MIDIPacket *sub_D118(MIDIPacketList *pktlist)
{
  uint64_t v2 = (MIDIPacketList *)&pktlist->packet[0].data[34];
  if (*(_DWORD *)&pktlist->packet[0].data[34]) {
    (*(void (**)(MIDIPacketList *, Byte *))(*(void *)&pktlist->numPackets + 16))(pktlist, &pktlist->packet[0].data[34]);
  }
  uint64_t result = MIDIPacketListInit(v2);
  *(void *)&pktlist->packet[0].data[26] = result;
  return result;
}

uint64_t sub_D17C(MIDIPacketList *a1)
{
  *(void *)&a1->numPackets = off_188C8;
  sub_D118(a1);

  return sub_D1D4((uint64_t)a1);
}

uint64_t sub_D1D4(uint64_t a1)
{
  *(void *)a1 = off_188F0;
  if (*(_DWORD *)(a1 + 48)) {
    __assert_rtn("~MIDIPacketEmitter", "MIDIPacketEmitter.h", 33, "TheList()->numPackets == 0");
  }
  sub_D2F8((void *)(a1 + 8));
  return a1;
}

void sub_D24C(MIDIPacketList *a1)
{
  sub_D17C(a1);

  operator delete();
}

uint64_t sub_D284(uint64_t a1, const MIDIPacketList *a2)
{
  uint64_t result = *(unsigned int *)(a1 + 1072);
  if (result) {
    uint64_t result = MIDIReceived(result, a2);
  }
  *(unsigned char *)(a1 + 1076) = 0;
  return result;
}

void sub_D2B8(uint64_t a1)
{
  sub_D1D4(a1);

  operator delete();
}

uint64_t sub_D2F0(uint64_t a1, uint64_t a2)
{
  return sub_D37C(a1 + 8, a2);
}

void *sub_D2F8(void *a1)
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

uint64_t sub_D37C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    sub_24A8();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v4);
}

uint64_t sub_D3D0(uint64_t a1)
{
  uint64_t v2 = sub_D43C(a1);
  *(void *)uint64_t v2 = off_188C8;
  *(_DWORD *)(v2 + 1072) = 0;
  *(unsigned char *)(v2 + 1076) = 0;
  *(void *)(a1 + 4sub_492C(&a9, 0) = MIDIPacketListInit((MIDIPacketList *)(v2 + 48));
  return a1;
}

void sub_D428(_Unwind_Exception *a1)
{
  sub_D1D4(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_D43C(uint64_t a1)
{
  *(void *)a1 = off_188F0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 4sub_492C(&a9, 0) = MIDIPacketListInit((MIDIPacketList *)(a1 + 48));
  return a1;
}

void sub_D48C(_Unwind_Exception *a1)
{
  sub_D2F8((void *)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t sub_D4A0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_18918;
  *(void *)(a1 + 8) = a2;
  sub_25E4(a1 + 16, "BLEMIDIDataSender.mWriteQueueMutex");
  *(void *)(a1 + 104) = a1 + 104;
  *(void *)(a1 + 112) = a1 + 104;
  *(void *)(a1 + 12sub_492C(&a9, 0) = 0;
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = 11250000;
  *(unsigned char *)(a1 + 2144) = 0;
  *(unsigned char *)(a1 + 144) = 0;
  return a1;
}

void *sub_D50C(void *a1)
{
  *a1 = off_18918;
  if (a1[16]) {
    MIDITimerTaskDispose();
  }
  sub_E3B4(a1 + 13);
  sub_2630((uint64_t)(a1 + 2));
  return a1;
}

uint64_t sub_D570(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (v1) {
    return *(void *)(v1 + 112);
  }
  else {
    return 0;
  }
}

BOOL sub_D588(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  return !v1 || *(unsigned char *)(v1 + 88) != 0;
}

unsigned char *sub_D5A8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v6 = a1 + 16;
  char v7 = (*(uint64_t (**)(uint64_t))(v2 + 16))(a1 + 16);
  *(void *)(a1 + 128) = MIDITimerTaskCreate();
  sub_D780();
  uint64_t v3 = qword_1DDF8;
  if (os_log_type_enabled((os_log_t)qword_1DDF8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 128);
    *(_DWORD *)buf = 136315650;
    unint64_t v9 = "BTLEMIDIDataSender.mm";
    __int16 v10 = 1024;
    int v11 = 67;
    __int16 v12 = 2048;
    uint64_t v13 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d Created mWriteSignalTimer = %p", buf, 0x1Cu);
  }
  return sub_E468(&v6);
}

void sub_D6C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

unsigned char *sub_D6D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v4 = a1 + 16;
  char v5 = (*(uint64_t (**)(uint64_t))(v2 + 16))(a1 + 16);
  if (((*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1) & 1) == 0)
  {
    sub_DFA4((uint64_t *)a1);
    *(unsigned char *)(a1 + 2144) = 0;
  }
  return sub_E468(&v4);
}

void sub_D76C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_D780()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1DE00, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1DE00))
  {
    qword_1DDF8 = (uint64_t)os_log_create("com.apple.coremidi", "btdsnd");
    __cxa_guard_release(&qword_1DE00);
  }
}

unsigned char *sub_D7F0(void *a1)
{
  uint64_t v3 = a1 + 2;
  uint64_t v2 = a1[2];
  char v7 = a1 + 2;
  char v8 = (*(uint64_t (**)(void *))(v2 + 16))(a1 + 2);
  if (v3[14])
  {
    sub_D780();
    uint64_t v4 = qword_1DDF8;
    if (os_log_type_enabled((os_log_t)qword_1DDF8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = a1[16];
      *(_DWORD *)buf = 136315650;
      __int16 v10 = "BTLEMIDIDataSender.mm";
      __int16 v11 = 1024;
      int v12 = 76;
      __int16 v13 = 2048;
      uint64_t v14 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d Disposing of mWriteSignalTimer %p", buf, 0x1Cu);
    }
    MIDITimerTaskDispose();
    a1[16] = 0;
  }
  sub_E404(a1 + 13);
  return sub_E468(&v7);
}

void sub_D914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

uint64_t sub_D928(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  if (!a4) {
    return 4294956463;
  }
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v22 = a1 + 16;
  char v23 = (*(uint64_t (**)(uint64_t))(v8 + 16))(a1 + 16);
  int v9 = *a2;
  if (*a2 >= 1)
  {
    unint64_t v10 = (unint64_t)(a2 + 1);
    __int16 v11 = (uint64_t *)(a1 + 104);
    do
    {
      uint64_t v12 = *(void *)v10;
      size_t v13 = *(unsigned __int16 *)(v10 + 8);
      if (v13 > 0x40)
      {
        uint64_t v14 = malloc_type_malloc(*(unsigned __int16 *)(v10 + 8), 0x9D18EA33uLL);
        memcpy(v14, (const void *)(v10 + 10), v13);
      }
      else
      {
        memcpy(__dst, (const void *)(v10 + 10), *(unsigned __int16 *)(v10 + 8));
        uint64_t v14 = 0;
      }
      *((void *)&v25 + 1) = a4;
      uint64_t v26 = 0;
      *(void *)&long long v25 = a3;
      if (!v12) {
        uint64_t v12 = mach_absolute_time();
      }
      unsigned int v15 = (uint64_t *)(a1 + 104);
      if (*(uint64_t **)(a1 + 112) != v11)
      {
        unsigned int v15 = *(uint64_t **)(a1 + 112);
        while (v15[2] <= v12)
        {
          unsigned int v15 = (uint64_t *)v15[1];
          if (v15 == v11)
          {
            unsigned int v15 = (uint64_t *)(a1 + 104);
            break;
          }
        }
      }
      int v16 = (char *)operator new(0x80uLL);
      long long v17 = __dst[3];
      *(_OWORD *)(v16 + 72) = __dst[2];
      *(_OWORD *)(v16 + 88) = v17;
      *(_OWORD *)(v16 + 104) = v25;
      long long v18 = __dst[1];
      *(_OWORD *)(v16 + 4sub_492C(&a9, 0) = __dst[0];
      *((void *)v16 + 2) = v12;
      *((_DWORD *)v16 + 6) = v13;
      *((void *)v16 + 4) = v14;
      *((void *)v16 + 15) = v26;
      *(_OWORD *)(v16 + 56) = v18;
      uint64_t v19 = *v15;
      *(void *)(v19 + 8) = v16;
      *(void *)int v16 = v19;
      *unsigned int v15 = (uint64_t)v16;
      *((void *)v16 + 1) = v15;
      ++*(void *)(a1 + 120);
      unint64_t v10 = (v10 + *(unsigned __int16 *)(v10 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
    }
    while (v9-- > 1);
  }
  if (!*(unsigned char *)(a1 + 2144))
  {
    *(unsigned char *)(a1 + 2144) = 1;
    mach_absolute_time();
    __udivti3();
    MIDITimerTaskSetNextWakeTime();
  }
  sub_E468(&v22);
  return 0;
}

void sub_DB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_DB68(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  uint64_t v6 = *(unsigned int *)(a2 + 40);
  char v7 = *(unsigned char **)(a2 + 24);
  __int16 v54 = 0;
  if (((*(uint64_t (**)(uint64_t *))(*a1 + 8))(a1) & 1) != 0 || !a1[15]) {
    return;
  }
  if (v7 == *(unsigned char **)(a2 + 24))
  {
    *(_OWORD *)a3 = *(_OWORD *)(a1[14] + 104);
    if (v6) {
      goto LABEL_5;
    }
LABEL_65:
    LODWORD(v6) = 0;
    goto LABEL_66;
  }
  if (!v6) {
    goto LABEL_65;
  }
LABEL_5:
  BOOL v8 = 0;
  uint64_t v9 = 0;
  int v10 = 0;
  __int16 v11 = a1 + 13;
  uint64_t v12 = &CFBooleanGetTypeID_ptr;
  while (1)
  {
    size_t v13 = (uint64_t *)a1[14];
    if (v13 == v11) {
      goto LABEL_66;
    }
    while (v13[13] != *a3 || v13[14] != a3[1])
    {
      size_t v13 = (uint64_t *)v13[1];
      if (v13 == v11) {
        goto LABEL_66;
      }
    }
    if (v13 == v11) {
      goto LABEL_66;
    }
    uint64_t v14 = (uint64_t *)v13[4];
    if (v14) {
      unsigned int v15 = (uint64_t *)v13[4];
    }
    else {
      unsigned int v15 = v13 + 5;
    }
    uint64_t v16 = v13[15];
    int v52 = v10;
    BOOL v53 = v8;
    v50 = v15;
    uint64_t v51 = v9;
    uint64_t v17 = v16;
    if (v7 == *(unsigned char **)(a2 + 24))
    {
      objc_msgSend(v12[130], "splitOffset:intoHeaderByte:timeStampByte:", objc_msgSend(v12[130], "timeStampOffset:", v13[2]), (char *)&v54 + 1, &v54);
      uint64_t v16 = v17;
      unsigned int v15 = v50;
      *v7++ = HIBYTE(v54);
      --v6;
      uint64_t v14 = (uint64_t *)v13[4];
      uint64_t v17 = v13[15];
    }
    uint64_t v48 = v16;
    int v46 = *((char *)v15 + v16);
    if (!v14) {
      uint64_t v14 = v13 + 5;
    }
    int v18 = v14 + v17;
    uint64_t v19 = *((int *)v13 + 6);
    unint64_t v20 = sub_1920((char *)v14 + v17, (unint64_t)v14 + v19);
    int v21 = v20 - v18;
    if (v17 == v19) {
      int v21 = 0;
    }
    BOOL v23 = *(v20 - 1) == 247 && v21 > 1;
    LODWORD(v24) = v21 - v23;
    uint64_t v25 = (int)v24;
    if (v24 < 2)
    {
      BOOL v27 = 0;
      BOOL v26 = 0;
LABEL_34:
      unint64_t v24 = (int)v24;
      uint64_t v12 = &CFBooleanGetTypeID_ptr;
      uint64_t v28 = v48;
      int v29 = v46;
      goto LABEL_35;
    }
    BOOL v26 = 0;
    BOOL v27 = 0;
    if (v51 != v13[2]) {
      goto LABEL_34;
    }
    unint64_t v24 = (int)v24;
    uint64_t v12 = &CFBooleanGetTypeID_ptr;
    uint64_t v28 = v48;
    int v29 = v46;
    if (v46 < 0)
    {
      BOOL v27 = v52 == *((unsigned __int8 *)v50 + v48);
      BOOL v26 = v52 == *((unsigned __int8 *)v50 + v48);
      if (v52 == *((unsigned __int8 *)v50 + v48)) {
        unint64_t v24 = (int)v24 - (unint64_t)!v53;
      }
      else {
        unint64_t v24 = (int)v24;
      }
    }
LABEL_35:
    LODWORD(v3sub_492C(&a9, 0) = !v26;
    uint64_t v30 = v29 < 0 ? v30 : 0;
    if (v24 > v6 - v30) {
      break;
    }
    int v31 = v29 >= 0 || v26;
    BOOL v49 = v27;
    if (v31 != 1)
    {
LABEL_45:
      uint64_t v47 = v25;
      objc_msgSend(v12[130], "splitOffset:intoHeaderByte:timeStampByte:", objc_msgSend(v12[130], "timeStampOffset:", v13[2]), (char *)&v54 + 1, &v54);
      *v7++ = v54;
      --v6;
      uint64_t v51 = v13[2];
      unsigned int v32 = *((unsigned __int8 *)v50 + v28);
      if (*((char *)v50 + v28) >= -16)
      {
        int v33 = v32 & 0xF8;
        BOOL v34 = v32 > 0xF7;
        BOOL v35 = v33 == 240;
        int v36 = v52;
        if (v35) {
          int v36 = 0;
        }
        if (v35) {
          BOOL v34 = 0;
        }
        int v52 = v36;
        BOOL v53 = v34;
      }
      else
      {
        int v52 = *((unsigned __int8 *)v50 + v28);
        BOOL v53 = 0;
      }
      uint64_t v25 = v47;
      goto LABEL_54;
    }
    if (v26)
    {
      if (v53) {
        goto LABEL_45;
      }
      BOOL v53 = 0;
    }
LABEL_54:
    size_t v37 = v25 - v26;
    v38 = (uint64_t *)v13[4];
    if (!v38) {
      v38 = v13 + 5;
    }
    memcpy(v7, (char *)v38 + v13[15] + v49, v37);
    size_t v39 = v37 + v49 + v13[15];
    v13[15] = v39;
    if (v39 == *((_DWORD *)v13 + 6))
    {
      v40 = (void *)v13[4];
      if (v40) {
        free(v40);
      }
      uint64_t v41 = *v13;
      *(void *)(v41 + 8) = v13[1];
      *(void *)v13[1] = v41;
      --a1[15];
      operator delete(v13);
    }
    v6 -= v37;
    if (a1[15])
    {
      v7 += v37;
      int v10 = v52;
      BOOL v8 = v53;
      uint64_t v9 = v51;
      if (v6) {
        continue;
      }
    }
    goto LABEL_66;
  }
  size_t v42 = v6 - ((v29 >> 7) & 1);
  if ((v29 & 0x80000000) == 0)
  {
    v43 = v13 + 5;
    if (!v42) {
      goto LABEL_66;
    }
    goto LABEL_76;
  }
  v44 = (uint64_t *)v13[4];
  v43 = v13 + 5;
  if (!v44) {
    v44 = v13 + 5;
  }
  if (*((unsigned __int8 *)v44 + v13[15]) == 240 && v42)
  {
    objc_msgSend(v12[130], "splitOffset:intoHeaderByte:timeStampByte:", objc_msgSend(v12[130], "timeStampOffset:", v13[2]), (char *)&v54 + 1, &v54);
    *v7++ = v54;
    LODWORD(v6) = v6 - 1;
LABEL_76:
    v45 = (uint64_t *)v13[4];
    if (!v45) {
      v45 = v43;
    }
    memcpy(v7, (char *)v45 + v13[15], v42);
    v13[15] += v42;
    LODWORD(v6) = v6 - v42;
  }
LABEL_66:
  *((_DWORD *)a3 + 4) = *(_DWORD *)(a2 + 40) - v6;
}

void sub_DFA4(uint64_t *a1)
{
  while (a1[15] && ((*(uint64_t (**)(uint64_t *))(*a1 + 8))(a1) & 1) == 0)
  {
    sub_102D0(a1[1] - 8, *(void *)(a1[14] + 104));
    if (!v13) {
      __assert_rtn("_DoWrite", "BTLEMIDIDataSender.mm", 432, "writeBuffer != nullptr");
    }
    if (*(unsigned char *)(v13 + 44))
    {
      sub_D780();
      uint64_t v2 = qword_1DDF8;
      if (os_log_type_enabled((os_log_t)qword_1DDF8, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v19[0]) = 136315394;
        *(void *)((char *)v19 + 4) = "BTLEMIDIDataSender.mm";
        WORD2(v19[1]) = 1024;
        *(_DWORD *)((char *)&v19[1] + 6) = 436;
        uint64_t v3 = (uint8_t *)v19;
        uint64_t v4 = v2;
        uint64_t v5 = "%25s:%-5d ERROR: All BLE MIDI data buffers are in use. Is Bluetooth backed up?";
LABEL_12:
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, v5, v3, 0x12u);
      }
    }
    else
    {
      atomic_fetch_add((atomic_uint *volatile)(v13 + 8), 1u);
      memset(v19, 0, sizeof(v19));
      sub_DB68(a1, v13, v19);
      uint64_t v6 = v19[1];
      if (v19[1])
      {
        id v7 = (id)v19[0];
        if (!v19[0] || v7 == [*(id *)(a1[1] + 104) validatePeripheral:v19[0]])
        {
          uint64_t v10 = SLODWORD(v19[2]);
          if (LODWORD(v19[2]))
          {
            *(unsigned char *)(v13 + 44) = 1;
            id v12 = [objc_alloc((Class)NSData) initWithBytesNoCopy:*(void *)(v13 + 24) length:v10 freeWhenDone:0];
            if (v7)
            {
              [v7 writeValue:v12 forCharacteristic:v6 type:1];
              *(unsigned char *)(v13 + 44) = 0;
              if (atomic_fetch_add((atomic_uint *volatile)(v13 + 8), 0xFFFFFFFF) == 1) {
                (*(void (**)())(*(void *)v13 + 16))();
              }
              bzero(*(void **)(v13 + 24), *(unsigned int *)(v13 + 40));
            }
            else
            {
              objc_msgSend(objc_msgSend(*(id *)(a1[1] + 112), "bleDevice"), "advanceBuffer");
              [(id)(*(uint64_t (**)(uint64_t *))*a1)(a1) enqueue:v12];
            }
          }
          int v9 = 0;
          goto LABEL_14;
        }
      }
      sub_D780();
      uint64_t v8 = qword_1DDF8;
      if (os_log_type_enabled((os_log_t)qword_1DDF8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v16 = "BTLEMIDIDataSender.mm";
        __int16 v17 = 1024;
        int v18 = 449;
        uint64_t v3 = buf;
        uint64_t v4 = v8;
        uint64_t v5 = "%25s:%-5d [!] BLEMIDIDataSender::_DoWrite() not doing any work";
        goto LABEL_12;
      }
    }
    int v9 = 1;
LABEL_14:
    if (v14) {
      sub_35A8(v14);
    }
    if (v9) {
      return;
    }
  }
}

void sub_E2B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    sub_35A8(a12);
  }
  _Unwind_Resume(exception_object);
}

unsigned char *sub_E2E0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a1 + 16;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v12 = a1 + 16;
  char v13 = (*(uint64_t (**)(uint64_t))(v4 + 16))(a1 + 16);
  uint64_t v6 = (uint64_t *)(v5 + 88);
  id v7 = *(uint64_t **)(v5 + 96);
  while (v7 != v6)
  {
    if (v7[13] == a2)
    {
      uint64_t v8 = (void *)v7[4];
      if (v8) {
        free(v8);
      }
      uint64_t v9 = *v7;
      uint64_t v10 = (uint64_t *)v7[1];
      *(void *)(v9 + 8) = v10;
      *(void *)v7[1] = v9;
      --*(void *)(a1 + 120);
      operator delete(v7);
      id v7 = v10;
    }
    else
    {
      id v7 = (uint64_t *)v7[1];
    }
  }
  return sub_E468(&v12);
}

void *sub_E3B4(void *a1)
{
  for (uint64_t i = (void *)a1[1]; i != a1; uint64_t i = (void *)i[1])
  {
    uint64_t v3 = (void *)i[4];
    if (v3) {
      free(v3);
    }
  }
  sub_E404(a1);
  return a1;
}

void *sub_E404(void *result)
{
  if (result[2])
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[1];
    uint64_t v2 = *v1;
    uint64_t v3 = *result;
    *(void *)(v3 + 8) = *(void *)(*v1 + 8);
    **(void **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        uint64_t v4 = (void *)result[1];
        operator delete(result);
        uint64_t result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

unsigned char *sub_E468(unsigned char *a1)
{
  if (a1[8]) {
    (*(void (**)(void))(**(void **)a1 + 24))();
  }
  return a1;
}

uint64_t NewBLEMIDIDriver(uint64_t a1, const void *a2)
{
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes(0, 0xECu, 0xDEu, 0x95u, 0x74u, 0xFu, 0xE4u, 0x11u, 0xD4u, 0xBBu, 0x1Au, 0, 0x50u, 0xE4u, 0xCEu, 0xA5u, 0x26u);
  if (CFEqual(a2, v3)) {
    operator new();
  }
  return 0;
}

void sub_E564()
{
}

void sub_E588(uint64_t a1)
{
  CFUUIDRef v2 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0xDBu, 0x11u, 0xE5u, 0x92u, 6u, 0x6Fu, 0x4Fu, 0xDCu, 0xB7u, 0x3Cu, 0x1Au, 0x8Cu, 0xF6u, 0xFCu, 0x6Fu, 0x8Du);
  sub_361C(a1, v2);
}

void sub_E90C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  sub_D56C(a12);
  sub_399C(v12);
  _Unwind_Resume(a1);
}

void *sub_E954(const void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_19D8();
  sub_1036C((uint64_t)v11, a4);
  char v13 = 0;
  uint64_t v9 = operator new(0x30uLL);
  *uint64_t v9 = off_189C8;
  v9[1] = a3;
  sub_10594((uint64_t)(v9 + 2), (uint64_t)v11);
  char v13 = v9;
  sub_1D58((uint64_t)v8, a1, a2, (uint64_t)v12);
  sub_217C(v12);
  return sub_106CC(v11);
}

void sub_EA44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  sub_217C((uint64_t *)va);
  sub_106CC(v6);
  _Unwind_Resume(a1);
}

void sub_EA70(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v3 = *(void *)(a1 + 32);
  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  if (string && !strcmp(string, "MyMIDIService"))
  {
    uint64_t v5 = xpc_dictionary_get_string(xdict, "deviceID");
    uint64_t v6 = xpc_dictionary_get_string(xdict, "name");
    id v7 = v6;
    if (v5 && v6)
    {
      uint64_t v8 = +[NSString stringWithUTF8String:v5];
      uint64_t v9 = +[NSString stringWithUTF8String:v7];
      sub_ECA0(v3, (uint64_t)v8, (uint64_t)v9);
    }
    else
    {
      sub_EC30();
      uint64_t v10 = qword_1DE18;
      if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_ERROR))
      {
        __int16 v11 = "(null deviceID)";
        if (v5) {
          __int16 v11 = v5;
        }
        uint64_t v14 = "BTLEMIDIDriver.mm";
        __int16 v15 = 1024;
        int v16 = 176;
        uint64_t v12 = "null name";
        int v13 = 136315906;
        int v18 = v11;
        __int16 v17 = 2080;
        if (v7) {
          uint64_t v12 = v7;
        }
        __int16 v19 = 2080;
        unint64_t v20 = v12;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d AppleMIDIBluetoothDriver received an invalid XPC event: %s, %s", (uint8_t *)&v13, 0x26u);
      }
    }
  }
}

void sub_EC30()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1DE20, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1DE20))
  {
    qword_1DE18 = (uint64_t)os_log_create("com.apple.coremidi", "bledrv");
    __cxa_guard_release(&qword_1DE20);
  }
}

id sub_ECA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_EC30();
  uint64_t v6 = qword_1DE18;
  if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315906;
    uint64_t v9 = "BTLEMIDIDriver.mm";
    __int16 v10 = 1024;
    int v11 = 552;
    __int16 v12 = 2112;
    uint64_t v13 = a2;
    __int16 v14 = 2112;
    uint64_t v15 = a3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%25s:%-5d [*] BLEMIDIDriver::ReceiveXPCConnection(%@, %@)", (uint8_t *)&v8, 0x26u);
  }
  [*(id *)(a1 + 112) xpcReceiveUUID:a2 withName:a3];
  return sub_F6D4(a1);
}

void *sub_ED98(uint64_t a1)
{
  *(void *)a1 = off_18938;
  [*(id *)(a1 + 112) cancelAllConnections];
  [*(id *)(a1 + 120) removeMIDIService];

  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 12sub_492C(&a9, 0) = 0;
  sub_D56C((void *)(a1 + 128));

  return sub_399C((void *)a1);
}

void sub_EE20(uint64_t a1)
{
  sub_ED98(a1);

  operator delete();
}

uint64_t sub_EE58(uint64_t a1)
{
  sub_EC30();
  CFUUIDRef v2 = qword_1DE18;
  if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v26 = "BTLEMIDIDriver.mm";
    __int16 v27 = 1024;
    int v28 = 229;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%25s:%-5d [+] BLEMIDIDriver::Start()", buf, 0x12u);
  }
  CFStringRef v3 = off_1DD00;
  sub_F3D4(a1);
  if (*(unsigned char *)(a1 + 2280)) {
    [*(id *)(a1 + 120) checkAddMIDIService];
  }
  else {
    *(unsigned char *)(a1 + 228sub_492C(&a9, 0) = 1;
  }
  if ((byte_1DE08 & 1) == 0) {
    sub_F44C();
  }
  unsigned int v4 = +[BLEMIDIAccessor nullDevice];
  *(_DWORD *)(a1 + 10sub_492C(&a9, 0) = v4;
  uint64_t v5 = (MIDIObjectRef *)(a1 + 100);
  if (v4)
  {
    CFStringRef v6 = kMIDIPropertyOffline;
    goto LABEL_10;
  }
  sub_EC30();
  id v7 = qword_1DE18;
  if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v26 = "BTLEMIDIDriver.mm";
    __int16 v27 = 1024;
    int v28 = 244;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d      Creating null device ...", buf, 0x12u);
  }
  OSStatus v8 = MIDIDeviceCreate((MIDIDriverRef)(a1 + 8), off_1DD08, off_1DD10, off_1DD18, (MIDIDeviceRef *)(a1 + 100));
  sub_EC30();
  uint64_t v9 = qword_1DE18;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      BOOL v26 = "BTLEMIDIDriver.mm";
      __int16 v27 = 1024;
      int v28 = 247;
      __int16 v29 = 1024;
      MIDIObjectRef v30 = v8;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d [!] Error %d creating BLE MIDI null device. No new Bluetooth connections are possible.", buf, 0x18u);
    }
    return 4294956463;
  }
  if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_DEBUG))
  {
    MIDIObjectRef v17 = *v5;
    *(_DWORD *)buf = 136315650;
    BOOL v26 = "BTLEMIDIDriver.mm";
    __int16 v27 = 1024;
    int v28 = 250;
    __int16 v29 = 1024;
    MIDIObjectRef v30 = v17;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d      Null device created with MIDIDeviceRef %u", buf, 0x18u);
  }
  MIDIObjectSetIntegerProperty(*v5, @"is BLE MIDI null device", 1);
  CFStringRef v6 = kMIDIPropertyOffline;
  MIDIObjectSetIntegerProperty(*v5, kMIDIPropertyOffline, 1);
  OSStatus v18 = MIDISetupAddDevice(*v5);
  sub_EC30();
  uint64_t v19 = qword_1DE18;
  if (v18)
  {
    if (!os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315650;
    BOOL v26 = "BTLEMIDIDriver.mm";
    __int16 v27 = 1024;
    int v28 = 260;
    __int16 v29 = 1024;
    MIDIObjectRef v30 = v18;
    unint64_t v20 = "%25s:%-5d [!] MIDISetupAddDevice = %d";
    int v21 = v19;
    os_log_type_t v22 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_10;
    }
    MIDIObjectRef v23 = *v5;
    *(_DWORD *)buf = 136315650;
    BOOL v26 = "BTLEMIDIDriver.mm";
    __int16 v27 = 1024;
    int v28 = 262;
    __int16 v29 = 1024;
    MIDIObjectRef v30 = v23;
    unint64_t v20 = "%25s:%-5d      Successfully added null device = %u";
    int v21 = v19;
    os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
  }
  _os_log_impl(&dword_0, v21, v22, v20, buf, 0x18u);
LABEL_10:
  MIDIObjectSetIntegerProperty(*v5, v6, 0);
  CFStringRef str = 0;
  MIDIObjectGetStringProperty(*v5, @"Bluetooth Advertising Name", &str);
  if (str) {
    CFRelease(str);
  }
  else {
    MIDIObjectSetStringProperty(*v5, @"Bluetooth Advertising Name", v3);
  }
  if (qword_1DE10)
  {
    CFRelease((CFTypeRef)qword_1DE10);
    qword_1DE10 = 0;
  }
  uint64_t v10 = MIDIClientCreate(@"BLE MIDI Client", (MIDINotifyProc)sub_F590, (void *)a1, (MIDIClientRef *)(a1 + 104));
  sub_EC30();
  int v11 = qword_1DE18;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      BOOL v26 = "BTLEMIDIDriver.mm";
      __int16 v27 = 1024;
      int v28 = 287;
      __int16 v29 = 1024;
      MIDIObjectRef v30 = v10;
      __int16 v12 = "%25s:%-5d [!]] MIDIClientCreate = %d, no notifications can be received.";
      uint64_t v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
LABEL_28:
      _os_log_impl(&dword_0, v13, v14, v12, buf, 0x18u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v26 = "BTLEMIDIDriver.mm";
      __int16 v27 = 1024;
      int v28 = 291;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%25s:%-5d      BLE MIDI client process created and awaiting notifications.", buf, 0x12u);
    }
    sub_F6D4(a1);
    sub_D5A8(a1 + 128);
    *(unsigned char *)(a1 + 96) = 0;
    sub_EC30();
    uint64_t v15 = qword_1DE18;
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      BOOL v26 = "BTLEMIDIDriver.mm";
      __int16 v27 = 1024;
      int v28 = 301;
      __int16 v29 = 1024;
      MIDIObjectRef v30 = 0;
      __int16 v12 = "%25s:%-5d [-] BLEMIDIDriver::Start() = %d";
      uint64_t v13 = v15;
      os_log_type_t v14 = OS_LOG_TYPE_INFO;
      goto LABEL_28;
    }
  }
  return v10;
}

ItemCount sub_F3D4(uint64_t a1)
{
  ItemCount result = MIDIGetDriverDeviceList((MIDIDriverRef)(a1 + 8));
  if (result)
  {
    MIDIDeviceListRef v2 = result;
    ItemCount result = MIDIDeviceListGetNumberOfDevices(result);
    if (result)
    {
      for (ItemCount i = 0; i < result; ++i)
      {
        MIDIObjectRef Device = MIDIDeviceListGetDevice(v2, i);
        MIDIObjectSetIntegerProperty(Device, kMIDIPropertyOffline, 1);
        ItemCount result = MIDIDeviceListGetNumberOfDevices(v2);
      }
    }
  }
  return result;
}

void sub_F44C()
{
  if ((byte_1DE08 & 1) == 0)
  {
    if (qword_1DE10)
    {
      off_1DD10 = (__CFString *)CFBundleCopyLocalizedString((CFBundleRef)qword_1DE10, off_1DD10, off_1DD10, @"BTLEMIDILocalizable");
      off_1DD40 = (__CFString *)CFBundleCopyLocalizedString((CFBundleRef)qword_1DE10, off_1DD40, off_1DD40, @"BTLEMIDILocalizable");
      off_1DD18 = (__CFString *)CFBundleCopyLocalizedString((CFBundleRef)qword_1DE10, off_1DD18, off_1DD18, @"BTLEMIDILocalizable");
      off_1DD08 = (__CFString *)CFBundleCopyLocalizedString((CFBundleRef)qword_1DE10, off_1DD08, off_1DD08, @"BTLEMIDILocalizable");
      off_1DD00 = (__CFString *)CFBundleCopyLocalizedString((CFBundleRef)qword_1DE10, off_1DD00, off_1DD00, @"BTLEMIDILocalizable");
      off_1DD20 = (__CFString *)CFBundleCopyLocalizedString((CFBundleRef)qword_1DE10, off_1DD20, off_1DD20, @"BTLEMIDILocalizable");
      off_1DD28 = (__CFString *)CFBundleCopyLocalizedString((CFBundleRef)qword_1DE10, off_1DD28, off_1DD28, @"BTLEMIDILocalizable");
      off_1DD30 = (__CFString *)CFBundleCopyLocalizedString((CFBundleRef)qword_1DE10, off_1DD30, off_1DD30, @"BTLEMIDILocalizable");
      off_1DD38 = (__CFString *)CFBundleCopyLocalizedString((CFBundleRef)qword_1DE10, off_1DD38, off_1DD38, @"BTLEMIDILocalizable");
      byte_1DE08 = 1;
    }
  }
}

void sub_F590(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 == 4
    && !*(_DWORD *)(a1 + 12)
    && *(_DWORD *)(a1 + 8) == *(_DWORD *)(a2 + 100)
    && (CFEqual(*(CFTypeRef *)(a1 + 16), @"BLE MIDI Local Peripheral")
     || CFEqual(*(CFTypeRef *)(a1 + 16), @"BLE MIDI Remote Peripheral")
     || CFEqual(*(CFTypeRef *)(a1 + 16), @"disconnect device")))
  {
    sub_EC30();
    unsigned int v4 = qword_1DE18;
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 16);
      int v6 = 136315650;
      id v7 = "BTLEMIDIDriver.mm";
      __int16 v8 = 1024;
      int v9 = 357;
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d [?] Property set on null device: %@", (uint8_t *)&v6, 0x1Cu);
    }
    sub_F940(a2, a1);
  }
}

id sub_F6D4(uint64_t a1)
{
  if ([*(id *)(a1 + 120) isLECapableHardware]) {
    [*(id *)(a1 + 120) activateConnectedUUID];
  }
  id result = [*(id *)(a1 + 112) isLECapableHardware];
  if (result)
  {
    CFStringRef v3 = *(void **)(a1 + 112);
    return [v3 activateConnectedUUIDs];
  }
  return result;
}

uint64_t sub_F734(uint64_t a1)
{
  sub_EC30();
  MIDIDeviceListRef v2 = qword_1DE18;
  if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    int v6 = "BTLEMIDIDriver.mm";
    __int16 v7 = 1024;
    int v8 = 307;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%25s:%-5d [+] BLEMIDIDriver::Stop()", (uint8_t *)&v5, 0x12u);
  }
  *(unsigned char *)(a1 + 96) = 1;
  sub_D7F0((void *)(a1 + 128));
  MIDIClientDispose(*(_DWORD *)(a1 + 104));
  *(_DWORD *)(a1 + 104) = 0;
  sub_F3D4(a1);
  sub_EC30();
  CFStringRef v3 = qword_1DE18;
  if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    int v6 = "BTLEMIDIDriver.mm";
    __int16 v7 = 1024;
    int v8 = 317;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%25s:%-5d [-] BLEMIDIDriver::Stop()", (uint8_t *)&v5, 0x12u);
  }
  return 0;
}

uint64_t sub_F880(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    id v7 = objc_msgSend(*(id *)(a1 + 112), "validatePeripheral:");
    if (!v7) {
      return 4294956454;
    }
    uint64_t v8 = (uint64_t)v7;
    id v9 = [*(id *)(a1 + 112) deviceForPeripheral:v7];
    if (!v9) {
      return 4294956454;
    }
  }
  else
  {
    id v9 = [*(id *)(a1 + 120) bleDevice];
    uint64_t v8 = 0;
    if (!v9) {
      return 4294956454;
    }
  }
  if (![v9 dev]) {
    return 4294956454;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = a4;
  }
  else {
    uint64_t v10 = 0;
  }

  return sub_D928(a1 + 128, a2, v8, v10);
}

void sub_F940(uint64_t a1, uint64_t a2)
{
  CFTypeRef cf = 0;
  CFDictionaryRef outDict = 0;
  if (!*(_DWORD *)(a1 + 100)) {
    return;
  }
  sub_EC30();
  unsigned int v4 = qword_1DE18;
  if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v25 = "BTLEMIDIDriver.mm";
    __int16 v26 = 1024;
    int v27 = 392;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%25s:%-5d [+] BLEMIDIDriver::NullDevicePropertyChanged()", buf, 0x12u);
  }
  if (CFEqual(*(CFTypeRef *)(a2 + 16), @"activate all devices"))
  {
    sub_F6D4(a1);
    return;
  }
  int v5 = CFEqual(*(CFTypeRef *)(a2 + 16), @"disconnect device");
  MIDIObjectRef v6 = *(_DWORD *)(a1 + 100);
  if (v5)
  {
    if (!MIDIObjectGetStringProperty(v6, @"disconnect device", (CFStringRef *)&cf))
    {
      MIDIObjectRemoveProperty(*(_DWORD *)(a1 + 100), @"disconnect device");
      id v7 = +[BLEMIDIAccessor midiDeviceForUUID:cf isLocalPeripheral:0 isRemotePeripheral:1];
      sub_EC30();
      uint64_t v8 = qword_1DE18;
      if (v7)
      {
        if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v25 = "BTLEMIDIDriver.mm";
          __int16 v26 = 1024;
          int v27 = 402;
          __int16 v28 = 2112;
          v29[0] = cf;
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%25s:%-5d      Request to deactivate UUID: %@", buf, 0x1Cu);
        }
        sub_FD5C(a1, (uint64_t)v7);
      }
      else if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v25 = "BTLEMIDIDriver.mm";
        __int16 v26 = 1024;
        int v27 = 405;
        __int16 v28 = 2112;
        v29[0] = cf;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d [!] Couldn't find any connected peripherals with UUID %@.", buf, 0x1Cu);
      }
      if (cf) {
        CFRelease(cf);
      }
    }
    return;
  }
  OSStatus DictionaryProperty = MIDIObjectGetDictionaryProperty(v6, *(CFStringRef *)(a2 + 16), &outDict);
  if (DictionaryProperty == -10835) {
    return;
  }
  OSStatus v10 = DictionaryProperty;
  if (DictionaryProperty)
  {
    sub_EC30();
    uint64_t v20 = qword_1DE18;
    if (!os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_ERROR)) {
      return;
    }
    uint64_t v21 = *(void *)(a2 + 16);
    *(_DWORD *)buf = 136315906;
    uint64_t v25 = "BTLEMIDIDriver.mm";
    __int16 v26 = 1024;
    int v27 = 424;
    __int16 v28 = 1024;
    LODWORD(v29[0]) = v10;
    WORD2(v29[0]) = 2112;
    *(void *)((char *)v29 + 6) = v21;
    int v16 = "%25s:%-5d [!] BLEMIDIDriver::NullDevicePropertyChanged() - Error %d encountered for property \"%@\".";
    MIDIObjectRef v17 = v20;
    os_log_type_t v18 = OS_LOG_TYPE_ERROR;
    uint32_t v19 = 34;
LABEL_23:
    _os_log_impl(&dword_0, v17, v18, v16, buf, v19);
    return;
  }
  MIDIObjectRemoveProperty(*(_DWORD *)(a1 + 100), *(CFStringRef *)(a2 + 16));
  id v11 = [(__CFDictionary *)outDict objectForKey:@"BLE MIDI Device UUID"];
  id v12 = [(__CFDictionary *)outDict objectForKey:kMIDIPropertyName];
  if (v11)
  {
    id v13 = v12;
    sub_EC30();
    os_log_type_t v14 = qword_1DE18;
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v25 = "BTLEMIDIDriver.mm";
      __int16 v26 = 1024;
      int v27 = 432;
      __int16 v28 = 2112;
      v29[0] = v11;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "%25s:%-5d      Request to activate UUID: %@", buf, 0x1Cu);
    }
    objc_msgSend(*(id *)(a1 + 112), "activateUUID:withName:", v11, v13, cf);
  }
  CFRelease(outDict);
  sub_EC30();
  uint64_t v15 = qword_1DE18;
  if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v25 = "BTLEMIDIDriver.mm";
    __int16 v26 = 1024;
    int v27 = 436;
    int v16 = "%25s:%-5d [-] BLEMIDIDriver::NullDevicePropertyChanged()";
    MIDIObjectRef v17 = v15;
    os_log_type_t v18 = OS_LOG_TYPE_INFO;
    uint32_t v19 = 18;
    goto LABEL_23;
  }
}

uint64_t sub_FD5C(uint64_t a1, uint64_t obj)
{
  if (!obj || *(_DWORD *)(a1 + 100) == obj) {
    return 0;
  }
  MIDIObjectSetIntegerProperty(obj, kMIDIPropertyOffline, 1);
  CFStringRef str = 0;
  OSStatus StringProperty = MIDIObjectGetStringProperty(obj, @"BLE MIDI Device UUID", &str);
  if (!str || StringProperty)
  {
    sub_EC30();
    id v7 = qword_1DE18;
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v11 = "BTLEMIDIDriver.mm";
      __int16 v12 = 1024;
      int v13 = 456;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: Device has no UUID. Returing kMIDINotPermitted.", buf, 0x12u);
    }
    return 4294956452;
  }
  else
  {
    if (+[BLEMIDIAccessor deviceIsRemotePeripheral:obj])
    {
      uint64_t v4 = sub_FF18(a1, (uint64_t)str);
    }
    else
    {
      sub_EC30();
      uint64_t v8 = qword_1DE18;
      if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v11 = "BTLEMIDIDriver.mm";
        __int16 v12 = 1024;
        int v13 = 463;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%25s:%-5d WARNING: Can't disconnect remote central, but the device was set to offline.", buf, 0x12u);
      }
      uint64_t v4 = 0;
    }
    CFRelease(str);
  }
  return v4;
}

uint64_t sub_FF18(uint64_t a1, uint64_t a2)
{
  sub_EC30();
  uint64_t v4 = qword_1DE18;
  if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    id v11 = "BTLEMIDIDriver.mm";
    __int16 v12 = 1024;
    int v13 = 471;
    __int16 v14 = 2112;
    uint64_t v15 = a2;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%25s:%-5d [+] BLEMIDIDriver::DisconnectDeviceWithUUID(%@)", (uint8_t *)&v10, 0x1Cu);
  }
  id v5 = [*(id *)(a1 + 112) peripheralWithUUID:a2];
  if (v5)
  {
    [*(id *)(a1 + 112) cancelConnectionForPeripheral:v5];
    sub_EC30();
    MIDIObjectRef v6 = qword_1DE18;
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      id v11 = "BTLEMIDIDriver.mm";
      __int16 v12 = 1024;
      int v13 = 483;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%25s:%-5d [-] BLEMIDIDriver::DisconnectDeviceWithUUID = noErr", (uint8_t *)&v10, 0x12u);
    }
    return 0;
  }
  else
  {
    sub_EC30();
    uint64_t v8 = qword_1DE18;
    uint64_t v7 = 4294956454;
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315906;
      id v11 = "BTLEMIDIDriver.mm";
      __int16 v12 = 1024;
      int v13 = 478;
      __int16 v14 = 2112;
      uint64_t v15 = a2;
      __int16 v16 = 1024;
      int v17 = -10842;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d [!] BLEMIDIDriver::DisconnectDevice() - No peripheral found with uuid %@, returning %d", (uint8_t *)&v10, 0x22u);
    }
  }
  return v7;
}

__CFString *sub_100F4()
{
  return off_1DD20;
}

__CFString *sub_10100()
{
  return off_1DD28;
}

__CFString *sub_1010C()
{
  return off_1DD30;
}

__CFString *sub_10118()
{
  return off_1DD38;
}

__CFString *sub_10124()
{
  return off_1DD40;
}

id sub_10130(uint64_t a1, uint64_t a2)
{
  id result = [*(id *)(a1 + 112) peripheralWithUUID:a2];
  if (result)
  {
    return [result setDelegate:0];
  }
  return result;
}

id sub_10170(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 112) peripheralWithUUID:a2];
  CFStringRef v3 = v2;
  if (v2 && [v2 name])
  {
    id v4 = [v3 name];
    return +[NSString stringWithString:v4];
  }
  else
  {
    id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"peripheral = %@, peripheral.name = %@. Returning nil", v3, [v3 name]);
    sub_EC30();
    MIDIObjectRef v6 = qword_1DE18;
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v9 = "BTLEMIDIDriver.mm";
      __int16 v10 = 1024;
      int v11 = 545;
      __int16 v12 = 2112;
      int v13 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %@", buf, 0x1Cu);
    }
    return 0;
  }
}

id sub_102D0(uint64_t a1, uint64_t a2)
{
  if (a2) {
    id v2 = [*(id *)(a1 + 112) deviceForPeripheral:a2];
  }
  else {
    id v2 = [*(id *)(a1 + 120) bleDevice];
  }
  CFStringRef v3 = v2;
  if (!v2) {
    sub_10AC4();
  }
  if ([v2 usage])
  {
    id v5 = [v3 nextBufferIndex];
    return [v3 bufferAtIndex:v5];
  }
  else
  {
    return objc_msgSend(v3, "centralBuffer", v4);
  }
}

uint64_t sub_1036C(uint64_t a1, uint64_t a2)
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

void *sub_10404(void *a1)
{
  *a1 = off_189C8;
  sub_106CC(a1 + 2);
  return a1;
}

void sub_10448(void *a1)
{
  *a1 = off_189C8;
  sub_106CC(a1 + 2);

  operator delete();
}

void *sub_104AC(uint64_t a1)
{
  id v2 = operator new(0x30uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *id v2 = off_189C8;
  v2[1] = v3;
  sub_1036C((uint64_t)(v2 + 2), a1 + 16);
  return v2;
}

void sub_10504(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10518(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  *a2 = off_189C8;
  a2[1] = v2;
  return sub_1036C((uint64_t)(a2 + 2), a1 + 16);
}

void *sub_10548(uint64_t a1)
{
  return sub_106CC((void *)(a1 + 16));
}

void sub_10550(void *a1)
{
  sub_106CC(a1 + 2);

  operator delete(a1);
}

BOOL sub_1058C(uint64_t a1, uint64_t *a2)
{
  return sub_10614((uint64_t (**)(uint64_t, char *))(a1 + 8), a2);
}

uint64_t sub_10594(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 24);
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
  void *v3 = 0;
  return a1;
}

BOOL sub_10614(uint64_t (**a1)(uint64_t, char *), uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v6 = 0;
  uint64_t v4 = (*a1)(v3, &v6);
  if (!v6) {
    return 0;
  }
  sub_10678((uint64_t)(a1 + 1), v4);
  return v6 != 0;
}

uint64_t sub_10678(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    sub_24A8();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v4);
}

void *sub_106CC(void *a1)
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

void sub_10754()
{
}

void *sub_10768(uint64_t a1)
{
  id result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = off_18A10;
  result[1] = v3;
  return result;
}

uint64_t sub_107B0(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_18A10;
  a2[1] = v2;
  return result;
}

void sub_107DC(uint64_t a1, void *a2)
{
  if (*a2)
  {
    sub_EC30();
    uint64_t v3 = qword_1DE18;
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315394;
      id v5 = "BTLEMIDIDriver.mm";
      __int16 v6 = 1024;
      int v7 = 162;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%25s:%-5d =====> NOTICE: All cached BLE devices being deleted, including the Null Device <=====", (uint8_t *)&v4, 0x12u);
    }
    **(unsigned char **)(a1 + 8) = 1;
  }
}

void *sub_108B4(void *result)
{
  void *result = 0;
  result[1] = 0;
  *(void *)((char *)result + 21) = 0;
  result[2] = 0;
  return result;
}

uint64_t sub_108C4(uint64_t result)
{
  if (*(void *)(result + 16)) {
    operator delete[]();
  }
  return result;
}

void sub_10904(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new[]();
}

void sub_1094C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_109C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10A00(uint64_t a1, int a2)
{
  v2[0] = 67109378;
  v2[1] = a2;
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " CAMutex::Try: call to pthread_mutex_trylock failed, Error: %d (%s)", (uint8_t *)v2, 0x12u);
}

uint64_t sub_10A8C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void sub_10AC4()
{
  __assert_rtn("NextBufferForPeripheral", "BTLEMIDIDriver.mm", 607, "device != nullptr");
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return _CFBundleCopyLocalizedString(bundle, key, value, tableName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return _CFBundleGetBundleWithIdentifier(bundleID);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return _CFUUIDCreateFromUUIDBytes(alloc, bytes);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

OSStatus MIDIClientCreate(CFStringRef name, MIDINotifyProc notifyProc, void *notifyRefCon, MIDIClientRef *outClient)
{
  return _MIDIClientCreate(name, notifyProc, notifyRefCon, outClient);
}

OSStatus MIDIClientDispose(MIDIClientRef client)
{
  return _MIDIClientDispose(client);
}

OSStatus MIDIDeviceAddEntity(MIDIDeviceRef device, CFStringRef name, Boolean embedded, ItemCount numSourceEndpoints, ItemCount numDestinationEndpoints, MIDIEntityRef *newEntity)
{
  return _MIDIDeviceAddEntity(device, name, embedded, numSourceEndpoints, numDestinationEndpoints, newEntity);
}

OSStatus MIDIDeviceCreate(MIDIDriverRef owner, CFStringRef name, CFStringRef manufacturer, CFStringRef model, MIDIDeviceRef *outDevice)
{
  return _MIDIDeviceCreate(owner, name, manufacturer, model, outDevice);
}

MIDIEntityRef MIDIDeviceGetEntity(MIDIDeviceRef device, ItemCount entityIndex0)
{
  return _MIDIDeviceGetEntity(device, entityIndex0);
}

MIDIDeviceRef MIDIDeviceListGetDevice(MIDIDeviceListRef devList, ItemCount index0)
{
  return _MIDIDeviceListGetDevice(devList, index0);
}

ItemCount MIDIDeviceListGetNumberOfDevices(MIDIDeviceListRef devList)
{
  return _MIDIDeviceListGetNumberOfDevices(devList);
}

OSStatus MIDIEndpointSetRefCons(MIDIEndpointRef endpt, void *ref1, void *ref2)
{
  return _MIDIEndpointSetRefCons(endpt, ref1, ref2);
}

OSStatus MIDIEntityAddOrRemoveEndpoints(MIDIEntityRef entity, ItemCount numSourceEndpoints, ItemCount numDestinationEndpoints)
{
  return _MIDIEntityAddOrRemoveEndpoints(entity, numSourceEndpoints, numDestinationEndpoints);
}

MIDIEndpointRef MIDIEntityGetDestination(MIDIEntityRef entity, ItemCount destIndex0)
{
  return _MIDIEntityGetDestination(entity, destIndex0);
}

MIDIEndpointRef MIDIEntityGetSource(MIDIEntityRef entity, ItemCount sourceIndex0)
{
  return _MIDIEntityGetSource(entity, sourceIndex0);
}

MIDIDeviceListRef MIDIGetDriverDeviceList(MIDIDriverRef driver)
{
  return _MIDIGetDriverDeviceList(driver);
}

OSStatus MIDIObjectGetDictionaryProperty(MIDIObjectRef obj, CFStringRef propertyID, CFDictionaryRef *outDict)
{
  return _MIDIObjectGetDictionaryProperty(obj, propertyID, outDict);
}

OSStatus MIDIObjectGetIntegerProperty(MIDIObjectRef obj, CFStringRef propertyID, SInt32 *outValue)
{
  return _MIDIObjectGetIntegerProperty(obj, propertyID, outValue);
}

OSStatus MIDIObjectGetStringProperty(MIDIObjectRef obj, CFStringRef propertyID, CFStringRef *str)
{
  return _MIDIObjectGetStringProperty(obj, propertyID, str);
}

OSStatus MIDIObjectRemoveProperty(MIDIObjectRef obj, CFStringRef propertyID)
{
  return _MIDIObjectRemoveProperty(obj, propertyID);
}

OSStatus MIDIObjectSetIntegerProperty(MIDIObjectRef obj, CFStringRef propertyID, SInt32 value)
{
  return _MIDIObjectSetIntegerProperty(obj, propertyID, value);
}

OSStatus MIDIObjectSetStringProperty(MIDIObjectRef obj, CFStringRef propertyID, CFStringRef str)
{
  return _MIDIObjectSetStringProperty(obj, propertyID, str);
}

MIDIPacket *__cdecl MIDIPacketListAdd(MIDIPacketList *pktlist, ByteCount listSize, MIDIPacket *curPacket, MIDITimeStamp time, ByteCount nData, const Byte *data)
{
  return _MIDIPacketListAdd(pktlist, listSize, curPacket, time, nData, data);
}

MIDIPacket *__cdecl MIDIPacketListInit(MIDIPacketList *pktlist)
{
  return _MIDIPacketListInit(pktlist);
}

OSStatus MIDIReceived(MIDIEndpointRef src, const MIDIPacketList *pktlist)
{
  return _MIDIReceived(src, pktlist);
}

OSStatus MIDISetupAddDevice(MIDIDeviceRef device)
{
  return _MIDISetupAddDevice(device);
}

OSStatus MIDISetupRemoveDevice(MIDIDeviceRef device)
{
  return _MIDISetupRemoveDevice(device);
}

uint64_t MIDITimerTaskCreate()
{
  return _MIDITimerTaskCreate();
}

uint64_t MIDITimerTaskDispose()
{
  return _MIDITimerTaskDispose();
}

uint64_t MIDITimerTaskSetNextWakeTime()
{
  return _MIDITimerTaskSetNextWakeTime();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t MIDI::LegacyPacketList::create()
{
  return MIDI::LegacyPacketList::create();
}

uint64_t MIDI::LegacyPacketListDeleter::operator()()
{
  return MIDI::LegacyPacketListDeleter::operator()();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
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
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t __udivti3()
{
  return ___udivti3();
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

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return _pthread_equal(a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return _pthread_mutex_trylock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_activateConnectedUUID(void *a1, const char *a2, ...)
{
  return [a1 activateConnectedUUID];
}

id objc_msgSend_activateConnectedUUIDs(void *a1, const char *a2, ...)
{
  return [a1 activateConnectedUUIDs];
}

id objc_msgSend_advanceBuffer(void *a1, const char *a2, ...)
{
  return [a1 advanceBuffer];
}

id objc_msgSend_bleDevice(void *a1, const char *a2, ...)
{
  return [a1 bleDevice];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancelAllConnections(void *a1, const char *a2, ...)
{
  return [a1 cancelAllConnections];
}

id objc_msgSend_characteristic(void *a1, const char *a2, ...)
{
  return [a1 characteristic];
}

id objc_msgSend_characteristics(void *a1, const char *a2, ...)
{
  return [a1 characteristics];
}

id objc_msgSend_checkAddMIDIService(void *a1, const char *a2, ...)
{
  return [a1 checkAddMIDIService];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_dataReceiver(void *a1, const char *a2, ...)
{
  return [a1 dataReceiver];
}

id objc_msgSend_dev(void *a1, const char *a2, ...)
{
  return [a1 dev];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_drain(void *a1, const char *a2, ...)
{
  return [a1 drain];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inEndpoint(void *a1, const char *a2, ...)
{
  return [a1 inEndpoint];
}

id objc_msgSend_isLECapableHardware(void *a1, const char *a2, ...)
{
  return [a1 isLECapableHardware];
}

id objc_msgSend_isNotifying(void *a1, const char *a2, ...)
{
  return [a1 isNotifying];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localPeripheral(void *a1, const char *a2, ...)
{
  return [a1 localPeripheral];
}

id objc_msgSend_maximumUpdateValueLength(void *a1, const char *a2, ...)
{
  return [a1 maximumUpdateValueLength];
}

id objc_msgSend_mtuLength(void *a1, const char *a2, ...)
{
  return [a1 mtuLength];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nextBufferIndex(void *a1, const char *a2, ...)
{
  return [a1 nextBufferIndex];
}

id objc_msgSend_nowInMS(void *a1, const char *a2, ...)
{
  return [a1 nowInMS];
}

id objc_msgSend_nullDevice(void *a1, const char *a2, ...)
{
  return [a1 nullDevice];
}

id objc_msgSend_outEndpoint(void *a1, const char *a2, ...)
{
  return [a1 outEndpoint];
}

id objc_msgSend_peripheral(void *a1, const char *a2, ...)
{
  return [a1 peripheral];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_recycleBuffer(void *a1, const char *a2, ...)
{
  return [a1 recycleBuffer];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeMIDIService(void *a1, const char *a2, ...)
{
  return [a1 removeMIDIService];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetAllConnectedDevices(void *a1, const char *a2, ...)
{
  return [a1 resetAllConnectedDevices];
}

id objc_msgSend_services(void *a1, const char *a2, ...)
{
  return [a1 services];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_subscribedCentral(void *a1, const char *a2, ...)
{
  return [a1 subscribedCentral];
}

id objc_msgSend_subscribedCentrals(void *a1, const char *a2, ...)
{
  return [a1 subscribedCentrals];
}

id objc_msgSend_usage(void *a1, const char *a2, ...)
{
  return [a1 usage];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_xpcReceiveUUID_withName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcReceiveUUID:withName:");
}