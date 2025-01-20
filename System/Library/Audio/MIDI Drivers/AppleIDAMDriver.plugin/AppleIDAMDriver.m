void sub_3E88(std::exception *a1)
{
  uint64_t vars8;

  std::exception::~exception(a1);

  operator delete();
}

const char *sub_3EC0()
{
  return "CAException";
}

void *sub_3ECC()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2C100, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2C100))
  {
    sub_4208((uint64_t)&unk_2C098);
    __cxa_guard_release(&qword_2C100);
  }
  return &unk_2C098;
}

void sub_3F2C(_Unwind_Exception *a1)
{
}

uint64_t sub_3F44(const __CFString *a1, unsigned char *a2)
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

BOOL sub_4040(const __CFBoolean *a1, unsigned char *a2)
{
  int valuePtr = 0;
  *a2 = 0;
  if (a1)
  {
    CFBooleanRef v3 = a1;
    CFTypeID v4 = CFGetTypeID(a1);
    if (v4 == CFBooleanGetTypeID())
    {
      LODWORD(a1) = CFBooleanGetValue(v3);
LABEL_6:
      *a2 = 1;
      return a1 != 0;
    }
    if (v4 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v3, kCFNumberIntType, &valuePtr);
      LODWORD(a1) = valuePtr != 0;
      goto LABEL_6;
    }
    if (v4 != CFStringGetTypeID())
    {
      LODWORD(a1) = 0;
      return a1 != 0;
    }
    CFStringGetCString((CFStringRef)v3, buffer, 64, 0x600u);
    if (sscanf(buffer, "%d", &valuePtr) == 1)
    {
      *a2 = 1;
      LODWORD(a1) = valuePtr != 0;
      return a1 != 0;
    }
    char v6 = buffer[0];
    if (buffer[0])
    {
      v7 = &buffer[1];
      do
      {
        *(v7 - 1) = __tolower(v6);
        int v8 = *v7++;
        char v6 = v8;
      }
      while (v8);
    }
    if (!(*(unsigned __int16 *)buffer ^ 0x6F6E | buffer[2])
      || (*(_DWORD *)buffer == 1936482662 ? (BOOL v9 = v12 == 101) : (BOOL v9 = 0), v9))
    {
      LODWORD(a1) = 0;
      goto LABEL_6;
    }
    if (*(_DWORD *)buffer == 7562617 || !(*(_DWORD *)buffer ^ 0x65757274 | v12))
    {
      LODWORD(a1) = 1;
      *a2 = 1;
    }
    else
    {
      LODWORD(a1) = valuePtr;
    }
  }
  return a1 != 0;
}

uint64_t sub_4208(uint64_t a1)
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
  CFBooleanRef v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 1uLL, 0, global_queue);
  *(void *)(a1 + 96) = v3;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_430C;
  handler[3] = &unk_28558;
  handler[4] = a1;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_resume(*(dispatch_object_t *)(a1 + 96));
  return a1;
}

void sub_42F8(_Unwind_Exception *a1)
{
  std::mutex::~mutex(v1);
  _Unwind_Resume(a1);
}

void sub_430C(uint64_t a1)
{
}

void sub_4314(uint64_t a1)
{
  std::mutex::lock((std::mutex *)a1);
  CFSetApplyFunction(*(CFSetRef *)(a1 + 64), (CFSetApplierFunction)sub_45A8, 0);
  v2 = *(CFStringRef **)(a1 + 72);
  CFBooleanRef v3 = *(CFStringRef **)(a1 + 80);
  while (v2 != v3)
  {
    sub_4500(v2);
    v2 += 6;
  }

  std::mutex::unlock((std::mutex *)a1);
}

void sub_438C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_43A4(uint64_t a1, CFTypeRef cf1, const void *a3)
{
  CFBooleanRef v3 = *(CFTypeRef **)(a1 + 72);
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

void sub_4414(uint64_t a1, const void *a2, void *a3, uint64_t a4)
{
  value = a3;
  v11 = a2;
  std::mutex::lock((std::mutex *)a1);
  if ((sub_43A4(a1, a2, a3) & 1) == 0)
  {
    CFRetain(a2);
    CFRetain(a3);
    unint64_t v8 = *(void *)(a1 + 80);
    if (v8 >= *(void *)(a1 + 88))
    {
      uint64_t v9 = sub_45D8((uint64_t *)(a1 + 72), (uint64_t *)&v11, (uint64_t *)&value, a4);
    }
    else
    {
      sub_46F8(*(void **)(a1 + 80), (uint64_t *)&v11, (uint64_t *)&value, a4);
      uint64_t v9 = v8 + 48;
      *(void *)(a1 + 80) = v8 + 48;
    }
    *(void *)(a1 + 80) = v9;
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 64), value);
    sub_4500((CFStringRef *)(*(void *)(a1 + 80) - 48));
  }
  std::mutex::unlock((std::mutex *)a1);
}

void sub_44E0(_Unwind_Exception *a1)
{
  *(void *)(v1 + 80) = v2;
  std::mutex::unlock((std::mutex *)v1);
  _Unwind_Resume(a1);
}

CFPropertyListRef sub_4500(CFStringRef *a1)
{
  CFPropertyListRef result = CFPreferencesCopyAppValue(*a1, a1[1]);
  if (result)
  {
    return (CFPropertyListRef)sub_4554((uint64_t)(a1 + 2), (uint64_t)result);
  }
  return result;
}

uint64_t sub_4554(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    sub_4B64();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v4);
}

uint64_t sub_45A8(const __CFString *a1)
{
  return CFPreferencesSynchronize(a1, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
}

void sub_45C4(void *a1)
{
}

uint64_t sub_45D8(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v5 = *a1;
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v7 = v6 + 1;
  if (v6 + 1 > 0x555555555555555) {
    sub_496C();
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
    v14 = (char *)sub_4A14(v11, v13);
  }
  else {
    v14 = 0;
  }
  v17 = v14;
  v18 = &v14[48 * v6];
  v20 = &v14[48 * v13];
  sub_46F8(v18, a2, a3, a4);
  v19 = v18 + 48;
  sub_48BC(a1, &v17);
  uint64_t v15 = a1[1];
  sub_4B10((uint64_t)&v17);
  return v15;
}

void sub_46E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4B10((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_46F8(void *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v5 = *a2;
  uint64_t v6 = *a3;
  sub_47A0((uint64_t)v8, a4);
  *a1 = v5;
  a1[1] = v6;
  sub_47A0((uint64_t)(a1 + 2), (uint64_t)v8);
  sub_4838(v8);
  return a1;
}

void sub_4784(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4838((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_47A0(uint64_t a1, uint64_t a2)
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

void *sub_4838(void *a1)
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

uint64_t *sub_48BC(uint64_t *result, void *a2)
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
      CFPropertyListRef result = (uint64_t *)sub_4A90(v6 - 32, v4 - 32);
      uint64_t v4 = v8;
      uint64_t v6 = v7;
    }
    while (v8 != v5);
  }
  a2[1] = v7;
  uint64_t v9 = *v3;
  *uint64_t v3 = v7;
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

void sub_496C()
{
}

void sub_4984(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_49E0(exception, a1);
}

void sub_49CC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_49E0(std::logic_error *a1, const char *a2)
{
  CFPropertyListRef result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_4A14(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    sub_4A5C();
  }
  return operator new(48 * a2);
}

void sub_4A5C()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t sub_4A90(uint64_t a1, uint64_t a2)
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
  *uint64_t v3 = 0;
  return a1;
}

uint64_t sub_4B10(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 48;
    sub_4838((void *)(i - 32));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_4B64()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_28610;
}

void sub_4BB4(std::exception *a1)
{
  std::exception::~exception(a1);

  operator delete();
}

double sub_4BEC(uint64_t a1)
{
  *(unsigned char *)(a1 + 161) = 17;
  *(_DWORD *)(a1 + 164) = 2139062143;
  *(void *)&double result = 0x100000001;
  *(_DWORD *)(a1 + 168) = 1;
  return result;
}

uint64_t sub_4C08(uint64_t a1, int a2, unsigned int a3, unsigned int a4, unsigned int a5, char *a6, uint64_t a7)
{
  unsigned int v13 = 0xFFFFFFF;
  if (a5 != 36 && a5 != 112 && a5 != 126)
  {
    if (a5 == 37) {
      unsigned int v13 = 0xFFFFFFF;
    }
    else {
      unsigned int v13 = a4;
    }
  }
  if (*(void *)(a1 + 16) == *(void *)(a1 + 8))
  {
    if ((a5 & 0xFE) == 0x70) {
      char v18 = 127;
    }
    else {
      char v18 = a2;
    }
    *(unsigned char *)(a1 + 185) = v18;
    *(_DWORD *)(a1 + 176) = a3;
    *(_DWORD *)(a1 + 180) = v13;
    *(unsigned char *)(a1 + 184) = a5;
    __int16 __src = 32496;
    char v54 = a2;
    char v55 = 13;
    char v56 = a5;
    char v57 = 1;
    uint64_t v58 = 0;
    if (!(a3 >> 28))
    {
      int16x8_t v19 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(a3), (uint32x4_t)xmmword_239B0);
      *(int16x4_t *)v19.i8 = vrev64_s16((int16x4_t)vand_s8((int8x8_t)vmovn_s32((int32x4_t)v19), (int8x8_t)0x7F007F007F007FLL));
      LODWORD(v58) = vmovn_s16(v19).u32[0];
    }
    if (!(v13 >> 28))
    {
      int16x8_t v20 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v13), (uint32x4_t)xmmword_239B0);
      *(int16x4_t *)v20.i8 = vrev64_s16((int16x4_t)vand_s8((int8x8_t)vmovn_s32((int32x4_t)v20), (int8x8_t)0x7F007F007F007FLL));
      HIDWORD(v58) = vmovn_s16(v20).u32[0];
    }
    sub_51D4();
    v21 = qword_2C108;
    if (os_log_type_enabled((os_log_t)qword_2C108, OS_LOG_TYPE_DEBUG))
    {
      sub_5980(__p, 0x2AuLL, 0);
      uint64_t v22 = 0;
      if (v34 >= 0) {
        v23 = __p;
      }
      else {
        v23 = (void **)__p[0];
      }
      do
      {
        unint64_t v24 = *((unsigned __int8 *)&__src + v22);
        *(unsigned char *)v23 = a0123456789abcd[v24 >> 4];
        *((unsigned char *)v23 + 1) = a0123456789abcd[v24 & 0xF];
        *((unsigned char *)v23 + 2) = 32;
        v23 = (void **)((char *)v23 + 3);
        ++v22;
      }
      while (v22 != 14);
      v25 = __p;
      if (v34 < 0) {
        v25 = (void **)__p[0];
      }
      *(_DWORD *)buf = 136315650;
      v36 = "MIDICIMessageEmitter.cpp";
      __int16 v37 = 1024;
      int v38 = 46;
      __int16 v39 = 2080;
      *(void *)v40 = v25;
      _os_log_impl(&def_F708, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d      new message hdr: %s ...", buf, 0x1Cu);
      if (v34 < 0) {
        operator delete(__p[0]);
      }
    }
    sub_5A2C(a1 + 8, *(char **)(a1 + 16), (char *)&__src, (char *)&v59, 14);
  }
  else
  {
    sub_51D4();
    v14 = qword_2C108;
    if (os_log_type_enabled((os_log_t)qword_2C108, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = *(void *)(a1 + 16) - *(void *)(a1 + 8);
      *(_DWORD *)buf = 136315650;
      v36 = "MIDICIMessageEmitter.cpp";
      __int16 v37 = 1024;
      int v38 = 49;
      __int16 v39 = 2048;
      *(void *)v40 = v15;
      _os_log_impl(&def_F708, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d      Message already has %lu bytes. Checking continuation ...", buf, 0x1Cu);
    }
    if (*(_DWORD *)(a1 + 176) != a3 || *(_DWORD *)(a1 + 180) != a4 || *(unsigned __int8 *)(a1 + 184) != a5)
    {
      sub_51D4();
      v16 = qword_2C108;
      if (os_log_type_enabled((os_log_t)qword_2C108, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "MIDICIMessageEmitter.cpp";
        __int16 v37 = 1024;
        int v38 = 52;
        _os_log_impl(&def_F708, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d [!] MIDICIMessageEmitter::CreateCIMessage() can't continue message (kMIDINotPermitted)", buf, 0x12u);
      }
      uint64_t v17 = 4294956452;
LABEL_47:
      *(void *)(a1 + 16) = *(void *)(a1 + 8);
      return v17;
    }
  }
  switch(a5 >> 4)
  {
    case 1u:
      uint64_t v26 = sub_5244(a1, a6, a7);
      goto LABEL_41;
    case 2u:
      uint64_t v26 = sub_539C(a1, a6, a7);
      goto LABEL_41;
    case 3u:
      uint64_t v26 = sub_5534(a1, a6, a7);
      goto LABEL_41;
    case 7u:
      uint64_t v26 = sub_5634(a1, (uint64_t)a6, a7);
LABEL_41:
      uint64_t v17 = v26;
      break;
    default:
      sub_51D4();
      v27 = qword_2C108;
      if (os_log_type_enabled((os_log_t)qword_2C108, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v36 = "MIDICIMessageEmitter.cpp";
        __int16 v37 = 1024;
        int v38 = 76;
        __int16 v39 = 1024;
        *(_DWORD *)v40 = a5 >> 4;
        _os_log_impl(&def_F708, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d      Unhandled message type: 0x%x", buf, 0x18u);
      }
      uint64_t v17 = 4294956452;
      break;
  }
  sub_51D4();
  v28 = qword_2C108;
  if (os_log_type_enabled((os_log_t)qword_2C108, OS_LOG_TYPE_DEBUG))
  {
    v29 = sub_20964(a5);
    *(_DWORD *)buf = 136317442;
    v36 = "MIDICIMessageEmitter.cpp";
    __int16 v37 = 1024;
    int v38 = 80;
    __int16 v39 = 1024;
    *(_DWORD *)v40 = a2;
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)&v40[6] = a3;
    __int16 v41 = 1024;
    unsigned int v42 = a4;
    __int16 v43 = 1024;
    unsigned int v44 = a5;
    __int16 v45 = 2080;
    v46 = v29;
    __int16 v47 = 2048;
    v48 = a6;
    __int16 v49 = 2048;
    uint64_t v50 = a7;
    __int16 v51 = 1024;
    int v52 = v17;
    _os_log_impl(&def_F708, v28, OS_LOG_TYPE_DEBUG, "%25s:%-5d [*] MIDICIMessageEmitter::CreateCIMessage(channel:0x%x, sourceMUID:0x%08x, destMUID:0x%08x, msgIndex:0x%x (%s), data:%p, length:%lu) = %d", buf, 0x4Eu);
  }
  if (v17)
  {
    sub_51D4();
    v30 = qword_2C108;
    if (os_log_type_enabled((os_log_t)qword_2C108, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v36 = "MIDICIMessageEmitter.cpp";
      __int16 v37 = 1024;
      int v38 = 83;
      __int16 v39 = 1024;
      *(_DWORD *)v40 = v17;
      _os_log_impl(&def_F708, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d [!] MIDICIMessageEmitter::CreateCIMessage() failed with error %d (message will not be sent)", buf, 0x18u);
    }
    goto LABEL_47;
  }
  return v17;
}

void sub_51D4()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2C110, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2C110))
  {
    qword_2C108 = (uint64_t)os_log_create("com.apple.coremidi", "ciemit");
    __cxa_guard_release(&qword_2C110);
  }
}

uint64_t sub_5244(uint64_t a1, char *a2, unsigned int a3)
{
  char __src = 99;
  char v15 = 0;
  uint64_t v6 = a1 + 8;
  sub_5A2C(a1 + 8, *(char **)(a1 + 16), &__src, &v17, 1);
  int v7 = *(unsigned __int8 *)(a1 + 184);
  if ((v7 - 16) < 2)
  {
    if (a3 != 5 * (a3 / 5)) {
      goto LABEL_14;
    }
    char v15 = a3 / 5;
    sub_5A2C(v6, *(char **)(a1 + 16), &v15, &__src, 1);
    uint64_t v8 = 0;
    if (a2)
    {
      int64_t v9 = (unsigned __int16)a3;
      if ((_WORD)a3)
      {
        uint64_t v10 = *(char **)(a1 + 16);
        uint64_t v11 = &a2[(unsigned __int16)a3];
        uint64_t v12 = v6;
        unsigned int v13 = a2;
        goto LABEL_12;
      }
    }
  }
  else
  {
    if ((v7 - 19) < 2)
    {
      sub_57C4(a1);
LABEL_13:
      uint64_t v8 = 0;
      goto LABEL_15;
    }
    uint64_t v8 = 0;
    if (v7 == 18)
    {
      if (a3 == 5)
      {
        if (!a2) {
          goto LABEL_13;
        }
        uint64_t v10 = *(char **)(a1 + 16);
        uint64_t v11 = a2 + 5;
        uint64_t v12 = v6;
        unsigned int v13 = a2;
        int64_t v9 = 5;
LABEL_12:
        sub_5A2C(v12, v10, v13, v11, v9);
        goto LABEL_13;
      }
LABEL_14:
      uint64_t v8 = 4294956452;
    }
  }
LABEL_15:
  char v17 = -9;
  sub_5A2C(v6, *(char **)(a1 + 16), &v17, (char *)&v18, 1);
  return v8;
}

uint64_t sub_539C(uint64_t a1, char *__src, unsigned int a3)
{
  unsigned __int32 v15 = 0;
  uint64_t v6 = 0;
  switch(*(unsigned char *)(a1 + 184))
  {
    case ' ':
      break;
    case '!':
      uint64_t v6 = sub_584C(a1, (unsigned __int16 *)__src, a3);
      break;
    case '""':
    case '#':
    case '$':
    case '%':
      if (a3 == 5)
      {
        if (!__src) {
          goto LABEL_6;
        }
        uint64_t v7 = a1 + 8;
        uint64_t v8 = *(char **)(a1 + 16);
        int64_t v9 = __src + 5;
        uint64_t v10 = __src;
        int64_t v11 = 5;
        goto LABEL_5;
      }
      uint64_t v6 = 4294956460;
      break;
    case '&':
      if (a3 < 6) {
        goto LABEL_10;
      }
      if (__src) {
        sub_5A2C(a1 + 8, *(char **)(a1 + 16), __src, __src + 5, 5);
      }
      unsigned int v13 = a3 - 5;
      if (!(v13 >> 28))
      {
        int16x8_t v14 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v13), (uint32x4_t)xmmword_239B0);
        *(int16x4_t *)v14.i8 = vrev64_s16((int16x4_t)vand_s8((int8x8_t)vmovn_s32((int32x4_t)v14), (int8x8_t)0x7F007F007F007FLL));
        unsigned __int32 v15 = vmovn_s16(v14).u32[0];
      }
      sub_5A2C(a1 + 8, *(char **)(a1 + 16), (char *)&v15, v16, 4);
      int64_t v11 = (unsigned __int16)v13;
      if ((_WORD)v13)
      {
        uint64_t v10 = __src + 5;
        uint64_t v8 = *(char **)(a1 + 16);
        int64_t v9 = &__src[(unsigned __int16)v13 + 5];
        uint64_t v7 = a1 + 8;
LABEL_5:
        sub_5A2C(v7, v8, v10, v9, v11);
      }
LABEL_6:
      uint64_t v6 = 0;
      break;
    default:
LABEL_10:
      uint64_t v6 = 4294956452;
      break;
  }
  char __srca = -9;
  sub_5A2C(a1 + 8, *(char **)(a1 + 16), &__srca, (char *)&v18, 1);
  return v6;
}

uint64_t sub_5534(uint64_t a1, char *__src, unsigned __int16 a3)
{
  int v4 = *(unsigned __int8 *)(a1 + 184);
  if ((v4 - 50) >= 8)
  {
    if ((v4 - 48) < 2)
    {
      if (__src) {
        sub_5A2C(a1 + 8, *(char **)(a1 + 16), __src, __src + 1, 1);
      }
      char v10 = -9;
      uint64_t v5 = a1 + 8;
      uint64_t v6 = *(char **)(a1 + 16);
      p_srca = &__srca;
      uint64_t v8 = &v10;
      goto LABEL_6;
    }
    if (v4 != 63)
    {
      char v12 = -9;
      sub_5A2C(a1 + 8, *(char **)(a1 + 16), &v12, (char *)&v13, 1);
      return 4294956452;
    }
  }
  if (__src)
  {
    if (a3) {
      sub_5A2C(a1 + 8, *(char **)(a1 + 16), __src, &__src[a3], a3);
    }
  }
  char __srca = -9;
  uint64_t v5 = a1 + 8;
  uint64_t v6 = *(char **)(a1 + 16);
  p_srca = &v12;
  uint64_t v8 = &__srca;
LABEL_6:
  sub_5A2C(v5, v6, v8, p_srca, 1);
  return 0;
}

uint64_t sub_5634(uint64_t a1, uint64_t a2, int a3)
{
  if (a3) {
    BOOL v6 = a2 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = *(unsigned __int8 *)(a1 + 184);
  if (v6 && (v7 & 0xFE) == 0x70) {
    return 4294956452;
  }
  char __src = 0;
  unsigned __int32 v15 = 0;
  if ((v7 - 112) < 2)
  {
    int64_t v9 = (char **)(a1 + 16);
    uint64_t v10 = a1 + 8;
    sub_5A2C(a1 + 8, *(char **)(a1 + 16), (char *)(a1 + 161), (char *)(a1 + 172), 11);
    if (a3 != 5) {
      return 4294956452;
    }
    char __src = *(unsigned char *)a2;
    unsigned int v11 = *(_DWORD *)(a2 + 1);
    if (!(v11 >> 28))
    {
      int16x8_t v12 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v11), (uint32x4_t)xmmword_239B0);
      *(int16x4_t *)v12.i8 = vrev64_s16((int16x4_t)vand_s8((int8x8_t)vmovn_s32((int32x4_t)v12), (int8x8_t)0x7F007F007F007FLL));
      unsigned __int32 v15 = vmovn_s16(v12).u32[0];
    }
    sub_5A2C(a1 + 8, *v9, &__src, &v18, 1);
    goto LABEL_19;
  }
  if (v7 == 126)
  {
    unsigned int v13 = *(_DWORD *)(a1 + 176);
    if (!(v13 >> 28))
    {
      int16x8_t v14 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v13), (uint32x4_t)xmmword_239B0);
      *(int16x4_t *)v14.i8 = vrev64_s16((int16x4_t)vand_s8((int8x8_t)vmovn_s32((int32x4_t)v14), (int8x8_t)0x7F007F007F007FLL));
      unsigned __int32 v15 = vmovn_s16(v14).u32[0];
    }
    uint64_t v10 = a1 + 8;
    int64_t v9 = (char **)(a1 + 16);
LABEL_19:
    sub_5A2C(v10, *v9, (char *)&v15, v16, 4);
    goto LABEL_20;
  }
  if (v7 != 127) {
    return 4294956452;
  }
LABEL_20:
  char v18 = -9;
  sub_5A2C(a1 + 8, *(char **)(a1 + 16), &v18, (char *)&v19, 1);
  return 0;
}

char *sub_57C4(uint64_t a1)
{
  v2[0] = xmmword_239C0;
  v2[1] = xmmword_239D0;
  v2[2] = xmmword_239E0;
  return sub_5A2C(a1 + 8, *(char **)(a1 + 16), (char *)v2, v3, 48);
}

uint64_t sub_584C(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  uint64_t result = 4294956452;
  if (a2 && a3)
  {
    uint64_t v6 = *a2;
    __src[0] = v6 & 0x7F;
    __src[1] = (v6 >> 7) & 0x7F;
    sub_5A2C(a1 + 8, *(char **)(a1 + 16), __src, (char *)&v15, 2);
    if (v6)
    {
      int v7 = (char *)a2 + 7;
      uint64_t v8 = v6;
      do
      {
        sub_5A2C(a1 + 8, *(char **)(a1 + 16), v7 - 5, v7, 5);
        v7 += 5;
        --v8;
      }
      while (v8);
    }
    __int16 v9 = 5 * v6;
    uint64_t v10 = *(unsigned __int16 *)((char *)a2 + (unsigned __int16)(v9 + 2));
    v13[0] = v10 & 0x7F;
    v13[1] = (v10 >> 7) & 0x7F;
    sub_5A2C(a1 + 8, *(char **)(a1 + 16), v13, __src, 2);
    if (v10)
    {
      unsigned int v11 = (char *)a2 + (unsigned __int16)(v9 + 4);
      do
      {
        int16x8_t v12 = v11 + 5;
        sub_5A2C(a1 + 8, *(char **)(a1 + 16), v11, v11 + 5, 5);
        unsigned int v11 = v12;
        --v10;
      }
      while (v10);
    }
    return 0;
  }
  return result;
}

void sub_5968()
{
}

void *sub_5980(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_5968();
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

char *sub_5A2C(uint64_t a1, char *__dst, char *__src, char *a4, int64_t a5)
{
  uint64_t v5 = __dst;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v10 = *(char **)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    unsigned int v11 = *(char **)a1;
    uint64_t v12 = (uint64_t)&v10[a5 - *(void *)a1];
    if (v12 < 0) {
      sub_496C();
    }
    unsigned int v13 = (char *)(__dst - v11);
    unint64_t v14 = v9 - (void)v11;
    if (2 * v14 > v12) {
      uint64_t v12 = 2 * v14;
    }
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v15 = v12;
    }
    if (v15)
    {
      size_t v16 = v15;
      char v17 = (char *)operator new(v15);
    }
    else
    {
      size_t v16 = 0;
      char v17 = 0;
    }
    v27 = &v13[(void)v17];
    memcpy(&v13[(void)v17], __src, a5);
    v28 = &v13[(void)v17];
    size_t v29 = v16;
    if (v11 != v5)
    {
      do
      {
        v13[(void)v17 - 1] = v13[(void)(v11 - 1)];
        --v13;
      }
      while (v13);
      uint64_t v10 = *(char **)(a1 + 8);
      v28 = v17;
    }
    v30 = &v27[a5];
    v31 = &v17[v29];
    if (v10 != v5) {
      memmove(v30, v5, v10 - v5);
    }
    v32 = *(char **)a1;
    *(void *)a1 = v28;
    *(void *)(a1 + 8) = &v30[v10 - v5];
    *(void *)(a1 + 16) = v31;
    if (v32) {
      operator delete(v32);
    }
    return v27;
  }
  uint64_t v18 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    uint64_t v19 = &__src[a5];
    v21 = *(char **)(a1 + 8);
LABEL_17:
    uint64_t v22 = &v5[a5];
    v23 = &v21[-a5];
    unint64_t v24 = v21;
    if (&v21[-a5] < v10)
    {
      int64_t v25 = &v10[a5] - v21;
      unint64_t v24 = v21;
      do
      {
        char v26 = *v23++;
        *v24++ = v26;
        --v25;
      }
      while (v25);
    }
    *(void *)(a1 + 8) = v24;
    if (v21 != v22) {
      memmove(&v5[a5], v5, v21 - v22);
    }
    if (v19 != __src) {
      memmove(v5, __src, v19 - __src);
    }
    return v5;
  }
  uint64_t v19 = &__src[v18];
  int64_t v20 = a4 - &__src[v18];
  if (a4 != &__src[v18]) {
    memmove(*(void **)(a1 + 8), &__src[v18], a4 - &__src[v18]);
  }
  v21 = &v10[v20];
  *(void *)(a1 + 8) = &v10[v20];
  if (v18 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

uint64_t sub_5C18(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_28638;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = 0;
  int v3 = pthread_mutex_init((pthread_mutex_t *)(a1 + 24), 0);
  if (v3)
  {
    int v5 = v3;
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6) {
      sub_2194C(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &off_28540;
    exception[2] = v5;
  }
  return a1;
}

uint64_t sub_5CD0(uint64_t a1)
{
  *(void *)a1 = off_28638;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
  return a1;
}

void sub_5D1C(uint64_t a1)
{
  sub_5CD0(a1);

  operator delete();
}

BOOL sub_5D54(uint64_t a1)
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
        sub_21988(v7, v8, v9, v10, v11, v12, v13, v14);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &off_28540;
      exception[2] = v6;
    }
    atomic_store((unint64_t)v2, (unint64_t *)(a1 + 16));
  }
  return v3 == 0;
}

void sub_5E14(uint64_t a1)
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
        sub_219C4(v5, v6, v7, v8, v9, v10, v11, v12);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &off_28540;
      exception[2] = v4;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&def_F708, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " CAMutex::Unlock: A thread is attempting to unlock a Mutex it doesn't own", v14, 2u);
  }
}

uint64_t sub_5F00(uint64_t a1, char *a2)
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
        sub_21A00((uint64_t)v10, v8);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &off_28540;
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

BOOL sub_6014(uint64_t a1)
{
  return atomic_load_explicit((atomic_ullong *volatile)(a1 + 16), memory_order_acquire) == 0;
}

BOOL sub_6028(uint64_t a1)
{
  uint64_t v2 = pthread_self();
  return pthread_equal(v2, (pthread_t)atomic_load_explicit((atomic_ullong *volatile)(a1 + 16), memory_order_acquire)) != 0;
}

void sub_6060(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_607C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 20)) {
    (*(void (**)(void))(**(void **)(a1 + 8) + 72))(*(void *)(a1 + 8));
  }
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }
  IOObjectRelease(*(_DWORD *)a1);
  if (*(void *)(a1 + 32)) {
    operator delete[]();
  }
  return a1;
}

uint64_t sub_60F8(uint64_t a1)
{
  uint64_t v3 = a1 + 8;
  uint64_t result = *(void *)(a1 + 8);
  if (!result)
  {
    theInterface = 0;
    SInt32 theScore = 0;
    io_service_t v4 = *(_DWORD *)a1;
    CFUUIDRef v5 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Du, 0xC7u, 0xB7u, 0x80u, 0x9Eu, 0xC0u, 0x11u, 0xD4u, 0xA5u, 0x4Fu, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
    CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    if (!IOCreatePlugInInterfaceForService(v4, v5, v6, &theInterface, &theScore)
      || (usleep(0x186A0u),
          io_service_t v7 = *(_DWORD *)a1,
          CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Du, 0xC7u, 0xB7u, 0x80u, 0x9Eu, 0xC0u, 0x11u, 0xD4u, 0xA5u, 0x4Fu, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u), v9 = CFUUIDGetConstantUUIDWithBytes(0,
                 0xC2u,
                 0x44u,
                 0xE8u,
                 0x58u,
                 0x10u,
                 0x9Cu,
                 0x11u,
                 0xD4u,
                 0x91u,
                 0xD4u,
                 0,
                 0x50u,
                 0xE4u,
                 0xC6u,
                 0x42u,
                 0x6Fu),
          !IOCreatePlugInInterfaceForService(v7, v8, v9, &theInterface, &theScore)))
    {
      uint64_t v10 = theInterface;
      QueryInterface = (*theInterface)->QueryInterface;
      CFUUIDRef v12 = CFUUIDGetConstantUUIDWithBytes(0, 0xFEu, 0x2Fu, 0xD5u, 0x2Fu, 0x3Bu, 0x5Au, 0x47u, 0x3Bu, 0x97u, 0x7Bu, 0xADu, 0x99u, 0, 0x1Eu, 0xB3u, 0xEDu);
      CFUUIDBytes v13 = CFUUIDGetUUIDBytes(v12);
      int v14 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t))QueryInterface)(v10, *(void *)&v13.byte0, *(void *)&v13.byte8, v3);
      size_t v15 = theInterface;
      size_t v16 = *theInterface;
      if (v14)
      {
        char v17 = v16->QueryInterface;
        CFUUIDRef v18 = CFUUIDGetConstantUUIDWithBytes(0, 0xC8u, 9u, 0xB8u, 0xD8u, 8u, 0x84u, 0x11u, 0xD7u, 0xBBu, 0x96u, 0, 3u, 0x93u, 0x3Eu, 0x3Eu, 0x3Eu);
        CFUUIDBytes v19 = CFUUIDGetUUIDBytes(v18);
        int v20 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t))v17)(v15, *(void *)&v19.byte0, *(void *)&v19.byte8, v3);
        ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
        theInterface = 0;
        if (v20)
        {
          sub_6430();
          v21 = qword_2C118;
          if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            int64_t v25 = "USBDevice.cpp";
            __int16 v26 = 1024;
            int v27 = 123;
            _os_log_impl(&def_F708, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d QueryInterface failed", buf, 0x12u);
          }
          *(void *)uint64_t v3 = 0;
          return *(void *)v3;
        }
      }
      else
      {
        ((void (*)(IOCFPlugInInterface **))v16->Release)(theInterface);
        theInterface = 0;
      }
      (*(void (**)(void, uint64_t))(**(void **)(a1 + 8) + 160))(*(void *)(a1 + 8), a1 + 16);
    }
    return *(void *)v3;
  }
  return result;
}

void sub_6430()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2C120, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2C120))
  {
    qword_2C118 = (uint64_t)os_log_create("com.apple.coremidi", "usbdev");
    __cxa_guard_release(&qword_2C120);
  }
}

uint64_t sub_64A0(uint64_t result)
{
  if (!*(unsigned char *)(result + 21))
  {
    uint64_t v1 = result;
    *(unsigned char *)(result + 21) = 1;
    uint64_t result = sub_658C(result, 3, 0, 0, v2, 256);
    if ((int)result >= 3)
    {
      *(_WORD *)(v1 + 24) = (v2[0] - 2 + (((v2[0] - 2) & 0x8000u) >> 15)) >> 1;
      operator new[]();
    }
  }
  return result;
}

uint64_t sub_658C(uint64_t a1, int a2, __int16 a3, __int16 a4, unsigned char *a5, __int16 a6)
{
  uint64_t v12 = sub_60F8(a1);
  if (v12)
  {
    uint64_t v13 = v12;
    __int16 v24 = 1664;
    __int16 v14 = a3 | ((_WORD)a2 << 8);
    __int16 v25 = v14;
    __int16 v26 = a4;
    v28 = a5;
    if (a2 == 3) {
      __int16 v15 = 2;
    }
    else {
      __int16 v15 = a6;
    }
    __int16 v27 = v15;
    if (!(*(unsigned int (**)(void))(*(void *)v12 + 64))(*(void *)(a1 + 8))) {
      goto LABEL_12;
    }
    unsigned int v16 = 0;
    do
    {
      usleep(0x1388u);
      int v17 = (*(uint64_t (**)(void))(*(void *)v13 + 64))(*(void *)(a1 + 8));
      int v18 = v17;
      if (v16 > 0x12) {
        break;
      }
      ++v16;
    }
    while (v17);
    if (!v17)
    {
LABEL_12:
      int v20 = (*(uint64_t (**)(uint64_t, __int16 *))(*(void *)v13 + 208))(v13, &v24);
      if (a2 == 3)
      {
        if (v20) {
          BOOL v21 = v20 == -536870168;
        }
        else {
          BOOL v21 = 1;
        }
        if (!v21) {
          return 0xFFFFFFFFLL;
        }
        __int16 v22 = *a5;
        if (!*a5) {
          return 0;
        }
        __int16 v24 = 1664;
        __int16 v25 = v14;
        __int16 v26 = a4;
        __int16 v27 = v22;
        v28 = a5;
        int v20 = (*(uint64_t (**)(uint64_t, __int16 *))(*(void *)v13 + 208))(v13, &v24);
      }
      if (!v20) {
        return v29;
      }
      return 0xFFFFFFFFLL;
    }
    sub_6430();
    CFUUIDBytes v19 = qword_2C118;
    if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v31 = "USBDevice.cpp";
      __int16 v32 = 1024;
      int v33 = 264;
      __int16 v34 = 1024;
      int v35 = v18;
      _os_log_impl(&def_F708, v19, OS_LOG_TYPE_DEBUG, "%25s:%-5d USBDevice::LoadDescriptor - Could not open device due to error 0x%x", buf, 0x18u);
    }
  }
  return 0xFFFFFFFFLL;
}

CFStringRef sub_6778(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  __int16 v2 = a2;
  sub_64A0(a1);
  int v4 = sub_658C(a1, 3, v2, *(_WORD *)(a1 + 22), v6, 256);
  if (v4 >= 3) {
    return CFStringCreateWithCharacters(0, v7, (v4 - 2) >> 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_6804(uint64_t a1, int a2, int a3, uint64_t a4, int a5, _DWORD *a6)
{
  sub_6430();
  uint64_t v12 = qword_2C118;
  if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v47 = "USBDevice.cpp";
    __int16 v48 = 1024;
    int v49 = 309;
    __int16 v50 = 1024;
    *(_DWORD *)__int16 v51 = a2;
    *(_WORD *)&v51[4] = 1024;
    *(_DWORD *)&v51[6] = a3;
    __int16 v52 = 2048;
    uint64_t v53 = a4;
    __int16 v54 = 1024;
    int v55 = a5;
    _os_log_impl(&def_F708, v12, OS_LOG_TYPE_INFO, "%25s:%-5d [+] USBDevice::LoadGroupTerminalDescriptors(interface: %d, altSettingNumber: %d, buf:%p, len:%d)", buf, 0x2Eu);
  }
  *a6 = 0;
  uint64_t v13 = sub_60F8(a1);
  if (v13)
  {
    uint64_t v14 = v13;
    int v15 = (*(uint64_t (**)(void))(*(void *)v13 + 64))(*(void *)(a1 + 8));
    if (!v15) {
      goto LABEL_13;
    }
    int v16 = v15;
    sub_6430();
    int v17 = qword_2C118;
    if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v47 = "USBDevice.cpp";
      __int16 v48 = 1024;
      int v49 = 320;
      __int16 v50 = 1024;
      *(_DWORD *)__int16 v51 = v16;
      _os_log_impl(&def_F708, v17, OS_LOG_TYPE_INFO, "%25s:%-5d      USBDeviceOpen failed with error 0x%x. Will retrying ...", buf, 0x18u);
    }
    unsigned int v18 = 0;
    do
    {
      usleep(0x1388u);
      uint64_t v19 = (*(uint64_t (**)(void))(*(void *)v14 + 64))(*(void *)(a1 + 8));
      uint64_t v20 = v19;
      if (v18 > 3) {
        break;
      }
      ++v18;
    }
    while (v19);
    if (v19)
    {
      sub_6430();
      uint64_t v21 = qword_2C118;
      if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 326;
        __int16 v50 = 1024;
        *(_DWORD *)__int16 v51 = v20;
        __int16 v22 = "%25s:%-5d [-] USBDevice::LoadGroupTerminalDescriptors() - Could not open device due to error 0x%x";
        v23 = v21;
        os_log_type_t v24 = OS_LOG_TYPE_ERROR;
        uint32_t v25 = 24;
LABEL_44:
        _os_log_impl(&def_F708, v23, v24, v22, buf, v25);
      }
    }
    else
    {
LABEL_13:
      __int16 v40 = 1665;
      unsigned __int16 v41 = a3 | 0x2600;
      unsigned __int16 v42 = a2;
      uint64_t v44 = a4;
      uint64_t v45 = 0;
      unsigned __int16 v43 = a5;
      uint64_t v20 = (*(uint64_t (**)(uint64_t, __int16 *))(*(void *)v14 + 208))(v14, &v40);
      sub_6430();
      __int16 v26 = qword_2C118;
      if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 23;
        _os_log_impl(&def_F708, v26, OS_LOG_TYPE_DEBUG, "%25s:%-5d [+] LogDeviceRequest()", buf, 0x12u);
      }
      sub_6430();
      __int16 v27 = qword_2C118;
      if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 24;
        __int16 v50 = 1024;
        *(_DWORD *)__int16 v51 = v40;
        _os_log_impl(&def_F708, v27, OS_LOG_TYPE_DEBUG, "%25s:%-5d      bmRequestType: 0x%00x", buf, 0x18u);
      }
      sub_6430();
      v28 = qword_2C118;
      if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 25;
        __int16 v50 = 1024;
        *(_DWORD *)__int16 v51 = HIBYTE(v40);
        _os_log_impl(&def_F708, v28, OS_LOG_TYPE_DEBUG, "%25s:%-5d      bRequest:      0x%00x", buf, 0x18u);
      }
      sub_6430();
      unsigned int v29 = qword_2C118;
      if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 26;
        __int16 v50 = 1024;
        *(_DWORD *)__int16 v51 = v41;
        _os_log_impl(&def_F708, v29, OS_LOG_TYPE_DEBUG, "%25s:%-5d      wValue:        0x%0000x", buf, 0x18u);
      }
      sub_6430();
      v30 = qword_2C118;
      if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 27;
        __int16 v50 = 1024;
        *(_DWORD *)__int16 v51 = v42;
        _os_log_impl(&def_F708, v30, OS_LOG_TYPE_DEBUG, "%25s:%-5d      wIndex:        0x%0000x", buf, 0x18u);
      }
      sub_6430();
      v31 = qword_2C118;
      if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 28;
        __int16 v50 = 1024;
        *(_DWORD *)__int16 v51 = v43;
        _os_log_impl(&def_F708, v31, OS_LOG_TYPE_DEBUG, "%25s:%-5d      wLength:       %u", buf, 0x18u);
      }
      sub_6430();
      __int16 v32 = qword_2C118;
      if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 29;
        __int16 v50 = 2048;
        *(void *)__int16 v51 = v44;
        _os_log_impl(&def_F708, v32, OS_LOG_TYPE_DEBUG, "%25s:%-5d      pData:         %p", buf, 0x1Cu);
      }
      sub_6430();
      int v33 = qword_2C118;
      if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 30;
        __int16 v50 = 1024;
        *(_DWORD *)__int16 v51 = v45;
        _os_log_impl(&def_F708, v33, OS_LOG_TYPE_DEBUG, "%25s:%-5d      wLenDone:      %u", buf, 0x18u);
      }
      sub_6430();
      __int16 v34 = qword_2C118;
      if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 31;
        _os_log_impl(&def_F708, v34, OS_LOG_TYPE_DEBUG, "%25s:%-5d [-] LogDeviceRequest()", buf, 0x12u);
      }
      if (v20 == -536854449)
      {
        sub_6430();
        int v35 = qword_2C118;
        if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v47 = "USBDevice.cpp";
          __int16 v48 = 1024;
          int v49 = 342;
          _os_log_impl(&def_F708, v35, OS_LOG_TYPE_INFO, "%25s:%-5d      Pipe stall on DeviceRequest(). Will retry once only.", buf, 0x12u);
        }
        uint64_t v20 = (*(uint64_t (**)(uint64_t, __int16 *))(*(void *)v14 + 208))(v14, &v40);
      }
      if (v20)
      {
        sub_6430();
        v36 = qword_2C118;
        if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v47 = "USBDevice.cpp";
          __int16 v48 = 1024;
          int v49 = 346;
          __int16 v50 = 1024;
          *(_DWORD *)__int16 v51 = v20;
          _os_log_impl(&def_F708, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d      DeviceRequest() returned error 0x%x", buf, 0x18u);
        }
      }
      else
      {
        *a6 = v45;
      }
      sub_6430();
      uint64_t v38 = qword_2C118;
      if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 350;
        __int16 v50 = 1024;
        *(_DWORD *)__int16 v51 = v45;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = v20;
        __int16 v22 = "%25s:%-5d [-] USBDevice::LoadGroupTerminalDescriptors(outLength: %u) = %d";
        v23 = v38;
        os_log_type_t v24 = OS_LOG_TYPE_INFO;
        uint32_t v25 = 30;
        goto LABEL_44;
      }
    }
  }
  else
  {
    sub_6430();
    __int16 v37 = qword_2C118;
    if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v47 = "USBDevice.cpp";
      __int16 v48 = 1024;
      int v49 = 313;
      _os_log_impl(&def_F708, v37, OS_LOG_TYPE_ERROR, "%25s:%-5d [-] USBDevice::LoadGroupTerminalDescriptors() - Could not get plugin interface!", buf, 0x12u);
    }
    return 4294956451;
  }
  return v20;
}

uint64_t sub_7054(uint64_t a1)
{
  uint64_t v3 = a1 + 16;
  uint64_t result = *(void *)(a1 + 16);
  if (!result)
  {
    theInterface = 0;
    SInt32 theScore = 0;
    io_service_t v4 = *(_DWORD *)(a1 + 8);
    CFUUIDRef v5 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Du, 0x97u, 0x86u, 0xC6u, 0x9Eu, 0xF3u, 0x11u, 0xD4u, 0xADu, 0x51u, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
    CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    if (!IOCreatePlugInInterfaceForService(v4, v5, v6, &theInterface, &theScore))
    {
      io_service_t v7 = theInterface;
      QueryInterface = (*theInterface)->QueryInterface;
      CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(0, 0x64u, 0xBAu, 0xBDu, 0xD2u, 0xFu, 0x6Bu, 0x4Bu, 0x4Fu, 0x8Eu, 0x3Eu, 0xDCu, 0x36u, 4u, 0x69u, 0x87u, 0xADu);
      CFUUIDBytes v10 = CFUUIDGetUUIDBytes(v9);
      int v11 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t))QueryInterface)(v7, *(void *)&v10.byte0, *(void *)&v10.byte8, v3);
      uint64_t v12 = theInterface;
      uint64_t v13 = *theInterface;
      if (v11)
      {
        uint64_t v14 = v13->QueryInterface;
        CFUUIDRef v15 = CFUUIDGetConstantUUIDWithBytes(0, 0x8Fu, 0xDBu, 0x84u, 0x55u, 0x74u, 0xA6u, 0x11u, 0xD6u, 0x97u, 0xB1u, 0, 0x30u, 0x65u, 0xD3u, 0x60u, 0x8Eu);
        CFUUIDBytes v16 = CFUUIDGetUUIDBytes(v15);
        int v17 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t))v14)(v12, *(void *)&v16.byte0, *(void *)&v16.byte8, v3);
        ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
        theInterface = 0;
        if (v17)
        {
          sub_6430();
          unsigned int v18 = qword_2C118;
          if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v22 = "USBDevice.cpp";
            __int16 v23 = 1024;
            int v24 = 513;
            _os_log_impl(&def_F708, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d QueryInterface failed", buf, 0x12u);
          }
          *(void *)uint64_t v3 = 0;
        }
      }
      else
      {
        ((void (*)(IOCFPlugInInterface **))v13->Release)(theInterface);
      }
    }
    return *(void *)v3;
  }
  return result;
}

uint64_t sub_72E0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 25)) {
    (*(void (**)(void))(**(void **)(a1 + 16) + 72))(*(void *)(a1 + 16));
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }
  IOObjectRelease(*(_DWORD *)(a1 + 8));
  if (*(unsigned char *)(a1 + 24) && *(void *)a1)
  {
    sub_607C(*(void *)a1);
    operator delete();
  }
  return a1;
}

uint64_t sub_7364(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 25)) {
    return 1;
  }
  uint64_t v4 = sub_7054(a1);
  if (!v4) {
    return 0;
  }
  int v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 64))(v4);
  if (v5)
  {
    int v7 = v5;
    sub_6430();
    CFUUIDRef v8 = qword_2C118;
    if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315650;
      CFUUIDBytes v10 = "USBDevice.cpp";
      __int16 v11 = 1024;
      int v12 = 487;
      __int16 v13 = 1024;
      LODWORD(v14) = v7;
      _os_log_impl(&def_F708, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d [!] USBInterface::Open() - err = 0x%x", (uint8_t *)&v9, 0x18u);
    }
    return 0;
  }
  uint64_t v1 = 1;
  *(unsigned char *)(a1 + 25) = 1;
  sub_6430();
  CFUUIDRef v6 = qword_2C118;
  if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315650;
    CFUUIDBytes v10 = "USBDevice.cpp";
    __int16 v11 = 1024;
    int v12 = 482;
    __int16 v13 = 2048;
    uint64_t v14 = a1;
    _os_log_impl(&def_F708, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d [?] USBInterface(%p)::Open() - success", (uint8_t *)&v9, 0x1Cu);
  }
  return v1;
}

uint64_t sub_74E4(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  *(unsigned char *)(a3 + 6) = a2;
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)(a1 + 16)
                                                                                                + 208))(*(void *)(a1 + 16), a2, a3 + 1, a3, a3 + 2, a3 + 4, a3 + 3);
}

uint64_t sub_7510(uint64_t a1, io_object_t object)
{
  *(_DWORD *)a1 = object;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 24) = 0;
  IOObjectRetain(object);
  if (!sub_7568(a1))
  {
    usleep(0x186A0u);
    sub_7568(a1);
  }
  return a1;
}

uint64_t sub_7568(uint64_t a1)
{
  uint64_t v3 = a1 + 8;
  uint64_t result = *(void *)(a1 + 8);
  if (!result)
  {
    SInt32 theScore = 0;
    uint64_t v4 = (void *)(a1 + 16);
    io_service_t v5 = *(_DWORD *)a1;
    CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Eu, 0x72u, 0x21u, 0x7Eu, 0x8Au, 0x60u, 0x11u, 0xDBu, 0xBFu, 0x57u, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
    CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    if (!IOCreatePlugInInterfaceForService(v5, v6, v7, (IOCFPlugInInterface ***)(a1 + 16), &theScore))
    {
      uint64_t v8 = *v4;
      int v9 = *(unsigned int (**)(uint64_t, void, void, uint64_t))(*(void *)*v4 + 8);
      CFUUIDRef v10 = CFUUIDGetConstantUUIDWithBytes(0, 0xEAu, 0x33u, 0xBAu, 0x4Fu, 0x8Au, 0x60u, 0x11u, 0xDBu, 0x84u, 0xDBu, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
      CFUUIDBytes v11 = CFUUIDGetUUIDBytes(v10);
      if (v9(v8, *(void *)&v11.byte0, *(void *)&v11.byte8, v3))
      {
        sub_6430();
        int v12 = qword_2C118;
        if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          CFUUIDRef v15 = "USBDevice.cpp";
          __int16 v16 = 1024;
          int v17 = 653;
          _os_log_impl(&def_F708, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d QueryInterface failed", buf, 0x12u);
        }
        *(void *)uint64_t v3 = 0;
        (*(void (**)(void))(*(void *)*v4 + 24))(*v4);
      }
      else
      {
        sub_7BC0(a1);
      }
    }
    return *(void *)v3;
  }
  return result;
}

uint64_t sub_777C(uint64_t a1)
{
  sub_6430();
  uint64_t v2 = qword_2C118;
  if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    CFUUIDRef v7 = "USBDevice.cpp";
    __int16 v8 = 1024;
    int v9 = 557;
    _os_log_impl(&def_F708, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d Destroying USBIDAMInterface.", (uint8_t *)&v6, 0x12u);
  }
  sub_7878(a1);
  uint64_t v3 = *(void *)(a1 + 8);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 24))(v3);
  }
  uint64_t v4 = *(IOCFPlugInInterface ***)(a1 + 16);
  if (v4) {
    IODestroyPlugInInterface(v4);
  }
  IOObjectRelease(*(_DWORD *)a1);
  return a1;
}

void sub_786C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_45C4(a1);
}

uint64_t sub_7878(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    sub_6430();
    int v9 = qword_2C118;
    if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      CFUUIDRef v15 = "USBDevice.cpp";
      __int16 v16 = 1024;
      int v17 = 605;
      CFUUIDRef v10 = "%25s:%-5d Already closed.";
      goto LABEL_14;
    }
    return 1;
  }
  uint64_t result = sub_7568(a1);
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  CFRunLoopRef v4 = MIDIGetDriverIORunLoop();
  if (v4)
  {
    CFRunLoopRef v5 = v4;
    int v6 = (*(uint64_t (**)(uint64_t, CFRunLoopRef, const CFRunLoopMode))(*(void *)v3 + 56))(v3, v4, kCFRunLoopDefaultMode);
    if (!v6)
    {
      sub_6430();
      CFUUIDRef v7 = qword_2C118;
      if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 136315650;
        CFUUIDRef v15 = "USBDevice.cpp";
        __int16 v16 = 1024;
        int v17 = 616;
        __int16 v18 = 2048;
        CFRunLoopRef v19 = v5;
        _os_log_impl(&def_F708, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d Unscheduled from runloop %p", (uint8_t *)&v14, 0x1Cu);
      }
      sub_6430();
      __int16 v8 = qword_2C118;
      if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 136315394;
        CFUUIDRef v15 = "USBDevice.cpp";
        __int16 v16 = 1024;
        int v17 = 623;
        _os_log_impl(&def_F708, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d Closing the interface ...", (uint8_t *)&v14, 0x12u);
      }
      int v6 = (*(uint64_t (**)(uint64_t, void))(*(void *)v3 + 40))(v3, 0);
      if (!v6)
      {
        *(unsigned char *)(a1 + 24) = 0;
        sub_6430();
        int v9 = qword_2C118;
        if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
        {
          int v14 = 136315394;
          CFUUIDRef v15 = "USBDevice.cpp";
          __int16 v16 = 1024;
          int v17 = 626;
          CFUUIDRef v10 = "%25s:%-5d Closed the interface.";
LABEL_14:
          _os_log_impl(&def_F708, v9, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v14, 0x12u);
          return 1;
        }
        return 1;
      }
    }
    int v11 = v6;
  }
  else
  {
    int v11 = -536870160;
    sub_6430();
    int v12 = qword_2C118;
    if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      CFUUIDRef v15 = "USBDevice.cpp";
      __int16 v16 = 1024;
      int v17 = 618;
      _os_log_impl(&def_F708, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d Driver I/O runloop not found!", (uint8_t *)&v14, 0x12u);
    }
  }
  sub_6430();
  __int16 v13 = qword_2C118;
  uint64_t result = os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG);
  if (result)
  {
    int v14 = 136315650;
    CFUUIDRef v15 = "USBDevice.cpp";
    __int16 v16 = 1024;
    int v17 = 630;
    __int16 v18 = 1024;
    LODWORD(v19) = v11;
    _os_log_impl(&def_F708, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d error 0x%x", (uint8_t *)&v14, 0x18u);
    return 0;
  }
  return result;
}

uint64_t sub_7BC0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 24))
  {
    sub_6430();
    uint64_t v1 = qword_2C118;
    if (!os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG)) {
      return 1;
    }
    int v17 = 136315394;
    __int16 v18 = "USBDevice.cpp";
    __int16 v19 = 1024;
    int v20 = 571;
    uint64_t v2 = "%25s:%-5d Already open.";
    uint64_t v3 = v1;
    uint32_t v4 = 18;
LABEL_4:
    _os_log_impl(&def_F708, v3, OS_LOG_TYPE_DEBUG, v2, (uint8_t *)&v17, v4);
    return 1;
  }
  uint64_t result = sub_7568();
  if (result)
  {
    uint64_t v7 = result;
    int v8 = (*(uint64_t (**)(uint64_t, void))(*(void *)result + 32))(result, 0);
    int v9 = v8;
    if (v8)
    {
      if (v8 != -536870203)
      {
LABEL_19:
        sub_6430();
        __int16 v16 = qword_2C118;
        uint64_t result = os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG);
        if (result)
        {
          int v17 = 136315650;
          __int16 v18 = "USBDevice.cpp";
          __int16 v19 = 1024;
          int v20 = 598;
          __int16 v21 = 1024;
          LODWORD(v22) = v9;
          _os_log_impl(&def_F708, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d error 0x%x", (uint8_t *)&v17, 0x18u);
          return 0;
        }
        return result;
      }
      sub_6430();
      CFUUIDRef v10 = qword_2C118;
      if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 136315394;
        __int16 v18 = "USBDevice.cpp";
        __int16 v19 = 1024;
        int v20 = 582;
        _os_log_impl(&def_F708, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d kIOReturnExclusiveAccess encountered but continuing.", (uint8_t *)&v17, 0x12u);
      }
    }
    *(unsigned char *)(a1 + 24) = 1;
    sub_6430();
    int v11 = qword_2C118;
    if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 136315394;
      __int16 v18 = "USBDevice.cpp";
      __int16 v19 = 1024;
      int v20 = 586;
      _os_log_impl(&def_F708, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d Opened the interface.", (uint8_t *)&v17, 0x12u);
    }
    CFRunLoopRef v12 = MIDIGetDriverIORunLoop();
    if (v12)
    {
      CFRunLoopRef v13 = v12;
      int v14 = (*(uint64_t (**)(uint64_t, CFRunLoopRef, const CFRunLoopMode))(*(void *)v7 + 48))(v7, v12, kCFRunLoopDefaultMode);
      if (!v14)
      {
        sub_6430();
        uint64_t v15 = qword_2C118;
        if (!os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG)) {
          return 1;
        }
        int v17 = 136315650;
        __int16 v18 = "USBDevice.cpp";
        __int16 v19 = 1024;
        int v20 = 592;
        __int16 v21 = 2048;
        CFRunLoopRef v22 = v13;
        uint64_t v2 = "%25s:%-5d Scheduled onto runloop %p";
        uint64_t v3 = v15;
        uint32_t v4 = 28;
        goto LABEL_4;
      }
      int v9 = v14;
    }
    goto LABEL_19;
  }
  return result;
}

BOOL sub_7EB8(uint64_t a1)
{
  uint64_t v5 = 0;
  if (sub_7568(a1)
    && !(*(unsigned int (**)(void, char *, uint64_t *))(**(void **)(a1 + 8) + 288))(*(void *)(a1 + 8), (char *)&v5 + 4, &v5))
  {
    sub_6430();
    uint32_t v4 = qword_2C118;
    if (os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v7 = "USBDevice.cpp";
      __int16 v8 = 1024;
      int v9 = 670;
      __int16 v10 = 1024;
      int v11 = HIDWORD(v5);
      __int16 v12 = 1024;
      int v13 = v5;
      _os_log_impl(&def_F708, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d USBIDAMInterface::Usable() - active: %d speed: %d", buf, 0x1Eu);
    }
    if (HIDWORD(v5)) {
      return 1;
    }
  }
  sub_6430();
  uint64_t v2 = qword_2C118;
  BOOL result = os_log_type_enabled((os_log_t)qword_2C118, OS_LOG_TYPE_DEBUG);
  if (result)
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v7 = "USBDevice.cpp";
    __int16 v8 = 1024;
    int v9 = 674;
    _os_log_impl(&def_F708, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d USBIDAMInterface::Usable() - NOT active!", buf, 0x12u);
    return 0;
  }
  return result;
}

uint64_t sub_8028(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v8 = 0;
  int v7 = 0;
  uint64_t result = (*(uint64_t (**)(void, uint64_t, BOOL, void, uint64_t *))(**(void **)(a1 + 8) + 296))(*(void *)(a1 + 8), 2, a2 != 1, 0, &v8);
  if (!result)
  {
    *(void *)(a3 + 8) = v8;
    *(unsigned char *)(a3 + 1) = a2 != 1;
    *(_WORD *)(a3 + 2) = 2;
    *(unsigned char *)a3 = 0;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 200))(*(void *)(a1 + 8));
    if (!result) {
      *(_WORD *)(a3 + 4) = v7;
    }
  }
  return result;
}

uint64_t sub_80D0(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 8);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 8) = 0;
  }
  return a1;
}

void sub_8108(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
}

uint64_t sub_81A4(void *a1)
{
  sub_8694();
  uint64_t v2 = qword_2C128;
  if (os_log_type_enabled((os_log_t)qword_2C128, OS_LOG_TYPE_INFO))
  {
    int v26 = 136315394;
    __int16 v27 = "IDAMMIDIDevice.cpp";
    *(_WORD *)v28 = 1024;
    *(_DWORD *)&v28[2] = 87;
    _os_log_impl(&def_F708, v2, OS_LOG_TYPE_INFO, "%25s:%-5d [+] IDAMMIDIDevice::Initialize()", (uint8_t *)&v26, 0x12u);
  }
  uint64_t v3 = a1[63];
  if (!v3)
  {
    sub_8694();
    __int16 v23 = qword_2C128;
    if (!os_log_type_enabled((os_log_t)qword_2C128, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    int v26 = 136315394;
    __int16 v27 = "IDAMMIDIDevice.cpp";
    *(_WORD *)v28 = 1024;
    *(_DWORD *)&v28[2] = 89;
    int v24 = "%25s:%-5d [!] Could not open interface! Returning false.";
LABEL_27:
    _os_log_impl(&def_F708, v23, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v26, 0x12u);
    return 0;
  }
  uint64_t v4 = sub_7568(v3);
  a1[64] = v4;
  if (!v4)
  {
    sub_8694();
    __int16 v23 = qword_2C128;
    if (!os_log_type_enabled((os_log_t)qword_2C128, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    int v26 = 136315394;
    __int16 v27 = "IDAMMIDIDevice.cpp";
    *(_WORD *)v28 = 1024;
    *(_DWORD *)&v28[2] = 95;
    int v24 = "%25s:%-5d [!] Could not get the plugin interface! Returning false.";
    goto LABEL_27;
  }
  (*(void (**)(void *))(*a1 + 56))(a1);
  if ((*(unsigned int (**)(void *))(*a1 + 112))(a1)
    && (*(unsigned int (**)(void *))(*a1 + 104))(a1))
  {
    sub_8694();
    uint64_t v5 = qword_2C128;
    if (os_log_type_enabled((os_log_t)qword_2C128, OS_LOG_TYPE_INFO))
    {
      int v26 = 136315394;
      __int16 v27 = "IDAMMIDIDevice.cpp";
      *(_WORD *)v28 = 1024;
      *(_DWORD *)&v28[2] = 105;
      _os_log_impl(&def_F708, v5, OS_LOG_TYPE_INFO, "%25s:%-5d      Allocating read and write buffers...", (uint8_t *)&v26, 0x12u);
    }
    uint64_t v6 = 0;
    char v7 = 1;
    while (1)
    {
      char v8 = v7;
      int v9 = &a1[3 * v6];
      uint64_t v10 = a1[64];
      uint64_t v11 = *((unsigned __int16 *)a1 + 262);
      v9[69] = a1;
      int v12 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(*(void *)v10 + 208))(v10, v11, v9 + 70);
      int v13 = v12 ? 0 : v11;
      *((_DWORD *)v9 + 142) = v13;
      if (v12) {
        break;
      }
      char v7 = 0;
      uint64_t v6 = 1;
      if ((v8 & 1) == 0)
      {
        uint64_t v14 = a1[64];
        uint64_t v15 = *((unsigned __int16 *)a1 + 270);
        a1[75] = a1;
        int v16 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(*(void *)v14 + 208))(v14, v15, a1 + 76);
        if (v16) {
          int v17 = 0;
        }
        else {
          int v17 = v15;
        }
        *((_DWORD *)a1 + 154) = v17;
        if (v16) {
          break;
        }
        *((unsigned char *)a1 + 624) = 0;
        sub_8694();
        __int16 v18 = qword_2C128;
        uint64_t v19 = 1;
        if (os_log_type_enabled((os_log_t)qword_2C128, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = a1[68];
          uint64_t v21 = a1[66];
          int v26 = 136315906;
          __int16 v27 = "IDAMMIDIDevice.cpp";
          *(_WORD *)v28 = 1024;
          *(_DWORD *)&v28[2] = 114;
          __int16 v29 = 1024;
          int v30 = v20;
          __int16 v31 = 1024;
          int v32 = v21;
          _os_log_impl(&def_F708, v18, OS_LOG_TYPE_INFO, "%25s:%-5d      Starting IDAM MIDI: mIDAMOutPipe=%d, mIDAMInPipe=%d", (uint8_t *)&v26, 0x1Eu);
        }
        (*(void (**)(void *, uint64_t))(*a1 + 24))(a1, 1);
        a1[60] = MIDITimerTaskCreate();
        sub_8704((uint64_t)a1, (uint64_t)(a1 + 69));
        sub_8704((uint64_t)a1, (uint64_t)(a1 + 72));
        int v26 = 1;
        __int16 v27 = 0;
        *(_DWORD *)v28 = -135266302;
        (*(void (**)(void *, int *, void))(*a1 + 88))(a1, &v26, 0);
        sub_8694();
        CFRunLoopRef v22 = qword_2C128;
        if (os_log_type_enabled((os_log_t)qword_2C128, OS_LOG_TYPE_INFO))
        {
          int v26 = 136315394;
          __int16 v27 = "IDAMMIDIDevice.cpp";
          *(_WORD *)v28 = 1024;
          *(_DWORD *)&v28[2] = 137;
          _os_log_impl(&def_F708, v22, OS_LOG_TYPE_INFO, "%25s:%-5d [-] IDAMMIDIDevice::Initialize() = true", (uint8_t *)&v26, 0x12u);
        }
        return v19;
      }
    }
  }
  sub_8694();
  __int16 v23 = qword_2C128;
  if (os_log_type_enabled((os_log_t)qword_2C128, OS_LOG_TYPE_ERROR))
  {
    int v26 = 136315394;
    __int16 v27 = "IDAMMIDIDevice.cpp";
    *(_WORD *)v28 = 1024;
    *(_DWORD *)&v28[2] = 140;
    int v24 = "%25s:%-5d [!] IDAMMIDIDevice::Initialize() = false";
    goto LABEL_27;
  }
  return 0;
}

void sub_8694()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2C130, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2C130))
  {
    qword_2C128 = (uint64_t)os_log_create("com.apple.coremidi", "idamio");
    __cxa_guard_release(&qword_2C130);
  }
}

void sub_8704(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 20) = 1;
  int v4 = (*(uint64_t (**)(void, void, void, void, void (*)(uint64_t *, int, uint64_t), uint64_t))(**(void **)(a1 + 512) + 160))(*(void *)(a1 + 512), *(void *)(a1 + 528), *(void *)(a2 + 8), *(unsigned __int16 *)(a1 + 524), sub_8F98, a2);
  if (v4 == -536854449 || v4 == -536870163) {
    int v4 = (*(uint64_t (**)(void, void, void, void, void (*)(uint64_t *, int, uint64_t), uint64_t))(**(void **)(a1 + 512) + 160))(*(void *)(a1 + 512), *(void *)(a1 + 528), *(void *)(a2 + 8), *(unsigned __int16 *)(a1 + 524), sub_8F98, a2);
  }
  int v6 = v4;
  if (v4)
  {
    sub_8694();
    char v7 = qword_2C128;
    if (os_log_type_enabled((os_log_t)qword_2C128, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315650;
      int v9 = "IDAMMIDIDevice.cpp";
      __int16 v10 = 1024;
      int v11 = 282;
      __int16 v12 = 1024;
      int v13 = v6;
      _os_log_impl(&def_F708, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d [!] IDAMMIDIDevice::DoRead() failed with error 0x%x", (uint8_t *)&v8, 0x18u);
    }
  }
}

void *sub_8860(void *a1)
{
  *a1 = off_286A8;
  sub_8694();
  uint64_t v2 = qword_2C128;
  if (os_log_type_enabled((os_log_t)qword_2C128, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    int v13 = "IDAMMIDIDevice.cpp";
    __int16 v14 = 1024;
    int v15 = 149;
    _os_log_impl(&def_F708, v2, OS_LOG_TYPE_INFO, "%25s:%-5d Destroying IDAMMIDIDevice.", (uint8_t *)&v12, 0x12u);
  }
  *((unsigned char *)a1 + 184) = 1;
  (*(void (**)(void *, void))(*a1 + 24))(a1, 0);
  if (((*(uint64_t (**)(void *))(*a1 + 112))(a1) & 1) != 0
    || (*(unsigned int (**)(void *))(*a1 + 104))(a1))
  {
    (*(void (**)(void, void *))(*(void *)a1[10] + 160))(a1[10], a1);
  }
  if ((*(unsigned int (**)(void *))(*a1 + 112))(a1))
  {
    (*(void (**)(void, void))(*(void *)a1[64] + 192))(a1[64], a1[68]);
    a1[68] = -1;
  }
  if ((*(unsigned int (**)(void *))(*a1 + 104))(a1))
  {
    (*(void (**)(void, void))(*(void *)a1[64] + 192))(a1[64], a1[66]);
    a1[66] = -1;
  }
  unsigned int v3 = 200;
  while (v3 >= 2)
  {
    uint64_t v4 = 0;
    --v3;
    char v5 = 1;
    while (!BYTE4(a1[3 * v4 + 71]))
    {
      char v6 = v5;
      char v5 = 0;
      uint64_t v4 = 1;
      if ((v6 & 1) == 0)
      {
        if (!*((unsigned char *)a1 + 620)) {
          goto LABEL_17;
        }
        break;
      }
    }
    usleep(0x2710u);
  }
LABEL_17:
  if (a1[60])
  {
    MIDITimerTaskDispose();
    a1[60] = 0;
  }
  sub_8694();
  char v7 = qword_2C128;
  if (os_log_type_enabled((os_log_t)qword_2C128, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    int v13 = "IDAMMIDIDevice.cpp";
    __int16 v14 = 1024;
    int v15 = 197;
    _os_log_impl(&def_F708, v7, OS_LOG_TYPE_INFO, "%25s:%-5d IDAM driver stopped MIDI.\n", (uint8_t *)&v12, 0x12u);
  }
  sub_80D0((uint64_t)(a1 + 75));
  for (uint64_t i = 72; i != 66; i -= 3)
    sub_80D0((uint64_t)&a1[i]);
  sub_145FC(a1, v9, v10);
  return a1;
}

void sub_8B74(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_45C4(a1);
  }
  _Unwind_Resume(a1);
}

void sub_8B88(void *a1)
{
  sub_8860(a1);

  operator delete();
}

void sub_8BC0(uint64_t a1)
{
  sub_8694();
  uint64_t v2 = qword_2C128;
  if (os_log_type_enabled((os_log_t)qword_2C128, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    char v7 = "IDAMMIDIDevice.cpp";
    __int16 v8 = 1024;
    int v9 = 212;
    __int16 v10 = 1024;
    int v11 = 2;
    _os_log_impl(&def_F708, v2, OS_LOG_TYPE_INFO, "%25s:%-5d [?] IDAMMIDIDevice::FindPipes() - Finding %d endpoints", buf, 0x18u);
  }
  for (int i = 1; i != 3; ++i)
  {
    WORD2(v5) = 0;
    *((void *)&v5 + 1) = -1;
    if (!sub_8028(*(void *)(a1 + 504), i, (uint64_t)&v5))
    {
      if (BYTE1(v5) == 1)
      {
        *(_OWORD *)(a1 + 536) = v5;
      }
      else if (BYTE1(v5))
      {
        sub_8694();
        uint64_t v4 = qword_2C128;
        if (os_log_type_enabled((os_log_t)qword_2C128, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          char v7 = "IDAMMIDIDevice.cpp";
          __int16 v8 = 1024;
          int v9 = 224;
          __int16 v10 = 1024;
          int v11 = i;
          __int16 v12 = 1024;
          int v13 = BYTE1(v5);
          _os_log_impl(&def_F708, v4, OS_LOG_TYPE_INFO, "%25s:%-5d      Unknown direction for endpoint %d: %d", buf, 0x1Eu);
        }
      }
      else
      {
        *(_OWORD *)(a1 + 520) = v5;
      }
    }
  }
}

unsigned char *sub_8D94(uint64_t a1, int *a2, int a3)
{
  uint64_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 112))(a1);
  if (result)
  {
    uint64_t v16 = a1 + 344;
    char v17 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 344) + 16))(a1 + 344);
    if (*a2 >= 1)
    {
      unint64_t v7 = (unint64_t)(a2 + 1);
      unsigned int v8 = *a2 + 1;
      do
      {
        uint64_t v9 = *(void *)v7;
        size_t v10 = *(unsigned __int16 *)(v7 + 8);
        if (v10 > 0x40)
        {
          int v11 = malloc_type_malloc(*(unsigned __int16 *)(v7 + 8), 0x9D18EA33uLL);
          memcpy(v11, (const void *)(v7 + 10), v10);
        }
        else
        {
          memcpy(__dst, (const void *)(v7 + 10), *(unsigned __int16 *)(v7 + 8));
          int v11 = 0;
        }
        LODWORD(v19) = a3;
        *((void *)&v19 + 1) = 0;
        __int16 v12 = (char *)operator new(0x80uLL);
        long long v13 = __dst[0];
        *(_OWORD *)(v12 + 56) = __dst[1];
        *(_OWORD *)(v12 + 40) = v13;
        *(_OWORD *)(v12 + 104) = v19;
        long long v14 = __dst[2];
        *(_OWORD *)(v12 + 88) = __dst[3];
        *((void *)v12 + 1) = a1 + 432;
        *((void *)v12 + 2) = v9;
        *((_DWORD *)v12 + 6) = v10;
        *((void *)v12 + 4) = v11;
        *((void *)v12 + 15) = v20;
        *(_OWORD *)(v12 + 72) = v14;
        uint64_t v15 = *(void *)(a1 + 432);
        *(void *)__int16 v12 = v15;
        *(void *)(v15 + 8) = v12;
        *(void *)(a1 + 432) = v12;
        ++*(void *)(a1 + 448);
        unint64_t v7 = (v7 + *(unsigned __int16 *)(v7 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
        --v8;
      }
      while (v8 > 1);
    }
    if (!*(unsigned char *)(a1 + 24 * *(unsigned __int8 *)(a1 + 624) + 620) && !*(unsigned char *)(a1 + 488))
    {
      *(unsigned char *)(a1 + 488) = 1;
      mach_absolute_time();
      MIDITimerTaskSetNextWakeTime();
    }
    return sub_9578(&v16);
  }
  return result;
}

void sub_8F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_8F98(uint64_t *a1, int a2, uint64_t a3)
{
  if (a2 || !a3)
  {
    sub_8694();
    char v6 = qword_2C128;
    if (os_log_type_enabled((os_log_t)qword_2C128, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315906;
      int v11 = "IDAMMIDIDevice.cpp";
      __int16 v12 = 1024;
      int v13 = 296;
      __int16 v14 = 1024;
      int v15 = a2;
      __int16 v16 = 2048;
      uint64_t v17 = a3;
      _os_log_impl(&def_F708, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d [?] IDAMMIDIDevice::ReadCallback(0x%x, %lu)", (uint8_t *)&v10, 0x22u);
    }
    *((unsigned char *)a1 + 20) = 0;
    switch(a2)
    {
      case -536870186:
        uint64_t v8 = *a1;
        goto LABEL_15;
      case -536870165:
        return;
      case -536870163:
        uint64_t v7 = *a1;
        if ((*(unsigned int (**)(void, void))(**(void **)(*a1 + 512) + 192))(*(void *)(*a1 + 512), *(void *)(*a1 + 528)))
        {
          return;
        }
        uint64_t v8 = v7;
        goto LABEL_15;
    }
    if (a2) {
      return;
    }
  }
  else
  {
    *((unsigned char *)a1 + 20) = 0;
  }
  uint64_t v9 = *a1;
  if (*(unsigned char *)(*a1 + 184)) {
    return;
  }
  sub_9114(*a1, (uint64_t)a1, a3);
  uint64_t v8 = v9;
LABEL_15:
  sub_8704(v8, a1);
}

uint64_t sub_9114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = mach_absolute_time();
  uint64_t v6 = *(void *)(a1 + 80);
  uint64_t BytePtr = IOUSBDeviceDataGetBytePtr();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void))(*(void *)v6 + 168);

  return v8(v6, a1, v5, BytePtr, a3, 0, 0);
}

void sub_91AC(uint64_t a1)
{
  if (*(void *)(a1 + 448))
  {
    unsigned int v2 = *(unsigned __int8 *)(a1 + 624);
    uint64_t v3 = a1 + 24 * *(unsigned __int8 *)(a1 + 624);
    if (!IOUSBDeviceDataGetBytePtr())
    {
      sub_8694();
      uint64_t v16 = qword_2C128;
      if (!os_log_type_enabled((os_log_t)qword_2C128, OS_LOG_TYPE_ERROR)) {
        return;
      }
      int v17 = 136315394;
      __int16 v18 = "IDAMMIDIDevice.cpp";
      __int16 v19 = 1024;
      int v20 = 341;
      int v13 = "%25s:%-5d Buffer pointer is invalid!";
      __int16 v14 = v16;
      uint32_t v15 = 18;
      goto LABEL_15;
    }
    uint64_t v4 = (void *)(v3 + 608);
    uint64_t v5 = *(void *)(a1 + 496);
    uint64_t BytePtr = IOUSBDeviceDataGetBytePtr();
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v5 + 208))(v5, a1, a1 + 432, BytePtr, 1);
    if (v7)
    {
      uint64_t v8 = v7;
      *(unsigned char *)(a1 + 24 * v2 + 620) = 1;
      int v9 = (*(uint64_t (**)(void, void, void, uint64_t, unsigned char *(*)(uint64_t, int), uint64_t))(**(void **)(a1 + 512) + 176))(*(void *)(a1 + 512), *(void *)(a1 + 544), *v4, v7, sub_93F0, a1);
      if (v9 == -536854449 || v9 == -536870163) {
        int v9 = (*(uint64_t (**)(void, void, void, uint64_t, unsigned char *(*)(uint64_t, int), uint64_t))(**(void **)(a1 + 512) + 176))(*(void *)(a1 + 512), *(void *)(a1 + 544), *v4, v8, sub_93F0, a1);
      }
      int v11 = v9;
      if (v9)
      {
        sub_8694();
        uint64_t v12 = qword_2C128;
        if (os_log_type_enabled((os_log_t)qword_2C128, OS_LOG_TYPE_ERROR))
        {
          int v17 = 136315650;
          __int16 v18 = "IDAMMIDIDevice.cpp";
          __int16 v19 = 1024;
          int v20 = 359;
          __int16 v21 = 1024;
          int v22 = v11;
          int v13 = "%25s:%-5d Failed with error 0x%x";
          __int16 v14 = v12;
          uint32_t v15 = 24;
LABEL_15:
          _os_log_impl(&def_F708, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v17, v15);
        }
      }
    }
  }
}

unsigned char *sub_93F0(uint64_t a1, int a2)
{
  uint64_t v8 = a1 + 344;
  char v9 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 344) + 16))(a1 + 344);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 624);
  *(unsigned char *)(a1 + 24 * v4 + 620) = 0;
  if (v4) {
    char v5 = v4 + 1;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)(a1 + 624) = v5;
  if (a2)
  {
    sub_8694();
    uint64_t v6 = qword_2C128;
    if (os_log_type_enabled((os_log_t)qword_2C128, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v11 = "IDAMMIDIDevice.cpp";
      __int16 v12 = 1024;
      int v13 = 381;
      __int16 v14 = 1024;
      int v15 = a2;
      _os_log_impl(&def_F708, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d IDAMMIDIDevice::WriteCallback() - Error: 0x%x", buf, 0x18u);
    }
  }
  else if (!*(unsigned char *)(a1 + 184))
  {
    (*(void (**)(uint64_t))(*(void *)a1 + 72))(a1);
  }
  return sub_9578(&v8);
}

void sub_9544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

BOOL sub_9558(uint64_t a1)
{
  return *(void *)(a1 + 528) != -1;
}

BOOL sub_9568(uint64_t a1)
{
  return *(void *)(a1 + 544) != -1;
}

unsigned char *sub_9578(unsigned char *a1)
{
  if (a1[8]) {
    (*(void (**)(void))(**(void **)a1 + 24))();
  }
  return a1;
}

uint64_t sub_95D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_1BAA8(a1, a3, a4);
  *(void *)uint64_t v6 = off_28738;
  *(void *)(v6 + 72) = 0;
  *(void *)(v6 + 80) = 0;
  *(void *)(v6 + 64) = a2;
  *(unsigned char *)(v6 + 88) = 0;
  sub_1C3F0(v6);
  return a1;
}

void sub_9630(_Unwind_Exception *a1)
{
  sub_1C184(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_9648(void *a1)
{
  *a1 = off_28738;
  sub_96EC(a1);
  uint64_t v2 = a1[9];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = a1[10];
  if (v3)
  {
    sub_7BBC(v3);
    operator delete();
  }

  return sub_1C184((uint64_t)a1);
}

void *sub_96EC(void *result)
{
  uint64_t v1 = result[9];
  if (v1)
  {
    uint64_t v2 = result;
    MIDIObjectSetIntegerProperty(*(_DWORD *)(v1 + 8), kMIDIPropertyOffline, 1);
    uint64_t result = (void *)v2[9];
    if (result) {
      uint64_t result = (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
    }
    v2[9] = 0;
  }
  return result;
}

void sub_9760(void *a1)
{
  sub_9648(a1);

  operator delete();
}

void sub_9798(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (a2 == -469794543)
  {
    global_queue = dispatch_get_global_queue(2, 0);
    if (global_queue)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_9864;
      block[3] = &unk_28768;
      block[4] = a4;
      dispatch_async(global_queue, block);
    }
  }
  else if (a2 == -469794544)
  {
    sub_1C3F0(a4);
  }
}

void *sub_9864(uint64_t a1)
{
  return sub_96EC(*(void **)(a1 + 32));
}

void sub_986C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 80);
  if (v1)
  {
    sub_7BBC(v1);
    operator delete();
  }
  operator new();
}

void sub_99A4()
{
}

BOOL sub_99CC(uint64_t a1, uint64_t a2)
{
  return sub_7EB8(a2);
}

uint64_t sub_99D4(uint64_t a1, uint64_t a2)
{
  MIDIDeviceListRef v4 = MIDIGetDriverDeviceList((MIDIDriverRef)(*(void *)(a1 + 64) + 8));
  int NumberOfDevices = MIDIDeviceListGetNumberOfDevices(v4);
  if (NumberOfDevices <= 0)
  {
    MIDIDeviceListDispose(v4);
    goto LABEL_13;
  }
  ItemCount v6 = 0;
  char v7 = 0;
  uint64_t v8 = NumberOfDevices;
  do
  {
    SInt32 outValue = 0;
    uint64_t Device = MIDIDeviceListGetDevice(v4, v6);
    uint64_t IntegerProperty = MIDIObjectGetIntegerProperty(Device, kMIDIPropertyOffline, &outValue);
    if (IntegerProperty) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = outValue == 0;
    }
    char v12 = !v11;
    v7 |= v12;
    ++v6;
  }
  while (v8 != v6);
  uint64_t v13 = IntegerProperty;
  MIDIDeviceListDispose(v4);
  if ((v7 & 1) == 0)
  {
LABEL_13:
    uint64_t Device = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 64) + 224))(*(void *)(a1 + 64), a2);
    uint64_t v13 = MIDISetupAddDevice(Device);
    if (v13) {
      return v13;
    }
  }
  MIDIObjectSetIntegerProperty(Device, @"USBVendorProduct", 95159724);
  uint64_t v14 = (*(uint64_t (**)(void, void, uint64_t, uint64_t))(**(void **)(a1 + 64) + 240))(*(void *)(a1 + 64), *(void *)(a1 + 64), a2, Device);
  if (v14)
  {
    uint64_t v15 = v14;
    if ((*(uint64_t (**)(uint64_t))(*(void *)v14 + 16))(v14))
    {
      if (*(void *)(a1 + 72))
      {
        return 3758096385;
      }
      else
      {
        *(void *)(a1 + 72) = v15;
        MIDIObjectSetIntegerProperty(Device, kMIDIPropertyOffline, 0);
      }
    }
    else
    {
      (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
    }
  }
  return v13;
}

CFStringRef sub_9BC4(uint64_t a1, const __CFString *a2)
{
  uint64_t v4 = sub_60F8(a1);
  CFStringRef v5 = a2;
  if (v4)
  {
    unsigned __int8 v14 = 0;
    int v6 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(void *)v4 + 272))(v4, &v14);
    if (v6)
    {
      int v7 = v6;
      sub_9DB0();
      uint64_t v8 = qword_2C138;
      CFStringRef v5 = a2;
      if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v16 = "USBMIDIDriverBase.cpp";
        __int16 v17 = 1024;
        int v18 = 79;
        __int16 v19 = 1024;
        int v20 = v7;
        _os_log_impl(&def_F708, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d [!]  USBGetManufacturerStringIndex() returned error 0x%x", buf, 0x18u);
        CFStringRef v5 = a2;
      }
    }
    else
    {
      CFStringRef v5 = sub_6778(a1, v14);
    }
    int v9 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(void *)v4 + 280))(v4, &v14);
    if (v9)
    {
      int v10 = v9;
      sub_9DB0();
      BOOL v11 = qword_2C138;
      if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v16 = "USBMIDIDriverBase.cpp";
        __int16 v17 = 1024;
        int v18 = 84;
        __int16 v19 = 1024;
        int v20 = v10;
        _os_log_impl(&def_F708, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d [!]  USBGetProductStringIndex() returned error 0x%x", buf, 0x18u);
      }
    }
    else
    {
      sub_6778(a1, v14);
    }
  }
  if (v5) {
    return v5;
  }
  else {
    return a2;
  }
}

void sub_9DB0()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2C140, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2C140))
  {
    qword_2C138 = (uint64_t)os_log_create("com.apple.coremidi", "usbmba");
    __cxa_guard_release(&qword_2C140);
  }
}

double sub_9E20@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = (unsigned __int8 *)(*(uint64_t (**)(uint64_t, void, void))(*(void *)a1 + 448))(a1, 0, 0);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *v3;
    if (*v3)
    {
      sub_5980(v11, 3 * v5, 0);
      if (v11[23] >= 0) {
        int v6 = v11;
      }
      else {
        int v6 = *(unsigned char **)v11;
      }
      int v7 = v4;
      do
      {
        unsigned int v8 = *v7++;
        *int v6 = a0123456789abcd_0[(unint64_t)v8 >> 4];
        v6[1] = a0123456789abcd_0[v8 & 0xF];
        unsigned char v6[2] = 32;
        v6 += 3;
        --v5;
      }
      while (v5);
    }
    else
    {
      sub_F1CC(v11, (char *)&unk_22591);
    }
    *(void *)a2 = v4;
    double result = *(double *)v11;
    *(_OWORD *)(a2 + 8) = *(_OWORD *)v11;
    *(void *)(a2 + 24) = *(void *)&v11[16];
  }
  else
  {
    sub_9DB0();
    int v9 = qword_2C138;
    if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)BOOL v11 = 136315394;
      *(void *)&v11[4] = "USBMIDIDriverBase.cpp";
      *(_WORD *)&v11[12] = 1024;
      *(_DWORD *)&v11[14] = 99;
      _os_log_impl(&def_F708, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d [!] findDescriptors() - no interface descriptor found", v11, 0x12u);
    }
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

__n128 sub_9FA0(uint64_t a1, unsigned __int8 *a2, void *a3, char **a4, char **a5, unsigned __int8 **a6)
{
  if (!a1) {
    return result;
  }
  int v6 = a2;
  if (!a2) {
    return result;
  }
  uint64_t v9 = a1;
  sub_9DB0();
  int v10 = qword_2C138;
  if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v173 = "USBMIDIDriverBase.cpp";
    __int16 v174 = 1024;
    int v175 = 108;
    _os_log_impl(&def_F708, v10, OS_LOG_TYPE_INFO, "%25s:%-5d [+] USBMIDIDriverBase::ParseDescriptors()", buf, 0x12u);
  }
  int v171 = 0;
  uint64_t v157 = (uint64_t)(a3 + 2);
  unsigned __int8 v164 = 0;
  int v165 = -1;
  v166 = a3;
  uint64_t v158 = v9;
  do
  {
    uint64_t v11 = *v6;
    if (*v6)
    {
      sub_5980(__p, 3 * v11, 0);
      char v12 = (void **)__p[0];
      if (v168 >= 0) {
        char v12 = __p;
      }
      uint64_t v13 = v6;
      do
      {
        unsigned int v14 = *v13++;
        *(unsigned char *)char v12 = a0123456789abcd_0[(unint64_t)v14 >> 4];
        *((unsigned char *)v12 + 1) = a0123456789abcd_0[v14 & 0xF];
        *((unsigned char *)v12 + 2) = 32;
        char v12 = (void **)((char *)v12 + 3);
        --v11;
      }
      while (v11);
    }
    else
    {
      sub_F1CC(__p, (char *)&unk_22591);
    }
    int v15 = v6[1];
    int v16 = v6[2];
    sub_9DB0();
    __int16 v17 = qword_2C138;
    if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_DEBUG))
    {
      int v18 = __p;
      if (v168 < 0) {
        int v18 = (void **)__p[0];
      }
      *(_DWORD *)buf = 136315650;
      v173 = "USBMIDIDriverBase.cpp";
      __int16 v174 = 1024;
      int v175 = 139;
      __int16 v176 = 2080;
      *(void *)&long long v177 = v18;
      _os_log_impl(&def_F708, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d      Now @: %s", buf, 0x1Cu);
    }
    char v19 = 0;
    if (v15 > 35)
    {
      if (v15 != 36)
      {
        if (v15 != 37) {
          goto LABEL_198;
        }
        if (v16 == 1 && (v165 & 0x80000000) == 0)
        {
          sub_9DB0();
          __int16 v27 = qword_2C138;
          if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v173 = "USBMIDIDriverBase.cpp";
            __int16 v174 = 1024;
            int v175 = 197;
            _os_log_impl(&def_F708, v27, OS_LOG_TYPE_INFO, "%25s:%-5d      USB MIDI 1.0 CS endpoint descriptor", buf, 0x12u);
          }
          uint64_t v28 = v6[3];
          sub_9DB0();
          __int16 v29 = qword_2C138;
          if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
          {
            unint64_t v30 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v166[1] - *v166) >> 1);
            *(_DWORD *)buf = 136315906;
            v173 = "USBMIDIDriverBase.cpp";
            __int16 v174 = 1024;
            int v175 = 200;
            __int16 v176 = 1024;
            LODWORD(v177) = v28;
            WORD2(v177) = 2048;
            *(void *)((char *)&v177 + 6) = v30;
            _os_log_impl(&def_F708, v29, OS_LOG_TYPE_INFO, "%25s:%-5d      %d embedded MIDI jack(s), searching %lu jack(s) for a match", buf, 0x22u);
          }
          if (v28)
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              int v33 = (char *)*v166;
              int v32 = (char *)v166[1];
              if ((char *)*v166 != v32)
              {
                while (v33[2] != v6[i + 4])
                {
                  v33 += 6;
                  if (v33 == v32) {
                    goto LABEL_45;
                  }
                }
              }
              if (v33 == v32 || v33 == 0)
              {
LABEL_45:
                sub_9DB0();
                int v35 = qword_2C138;
                if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315650;
                  v173 = "USBMIDIDriverBase.cpp";
                  __int16 v174 = 1024;
                  int v175 = 206;
                  __int16 v176 = 1024;
                  LODWORD(v177) = v164;
                  _os_log_impl(&def_F708, v35, OS_LOG_TYPE_INFO, "%25s:%-5d      Jack not found for endpoint 0x%x", buf, 0x18u);
                }
              }
              else
              {
                sub_9DB0();
                v36 = qword_2C138;
                if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
                {
                  int v38 = v33[2];
                  *(_DWORD *)buf = 136315906;
                  v173 = "USBMIDIDriverBase.cpp";
                  __int16 v174 = 1024;
                  int v175 = 204;
                  __int16 v176 = 1024;
                  LODWORD(v177) = v38;
                  WORD2(v177) = 1024;
                  *(_DWORD *)((char *)&v177 + 6) = v164;
                  _os_log_impl(&def_F708, v36, OS_LOG_TYPE_INFO, "%25s:%-5d      Found jack %d for endpoint 0x%x", buf, 0x1Eu);
                }
                v33[5] = v164;
                if (v165)
                {
                  unint64_t v39 = (unint64_t)a4[1];
                  unint64_t v40 = (unint64_t)a4[2];
                  if (v39 >= v40)
                  {
                    unint64_t v46 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v39 - (void)*a4) >> 1);
                    unint64_t v47 = v46 + 1;
                    if (v46 + 1 > 0x2AAAAAAAAAAAAAAALL) {
                      goto LABEL_221;
                    }
                    unint64_t v48 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v40 - (void)*a4) >> 1);
                    if (2 * v48 > v47) {
                      unint64_t v47 = 2 * v48;
                    }
                    if (v48 >= 0x1555555555555555) {
                      unint64_t v49 = 0x2AAAAAAAAAAAAAAALL;
                    }
                    else {
                      unint64_t v49 = v47;
                    }
                    if (v49) {
                      __int16 v50 = (char *)sub_F280((uint64_t)(a4 + 2), v49);
                    }
                    else {
                      __int16 v50 = 0;
                    }
                    char v56 = &v50[6 * v46];
                    int v57 = *(_DWORD *)v33;
                    *((_WORD *)v56 + 2) = *((_WORD *)v33 + 2);
                    *(_DWORD *)char v56 = v57;
                    uint64_t v59 = *a4;
                    uint64_t v58 = a4[1];
                    v60 = v56;
                    if (v58 != *a4)
                    {
                      do
                      {
                        int v61 = *(_DWORD *)(v58 - 6);
                        v58 -= 6;
                        __int16 v62 = *((_WORD *)v58 + 2);
                        *(_DWORD *)(v60 - 6) = v61;
                        v60 -= 6;
                        *((_WORD *)v60 + 2) = v62;
                      }
                      while (v58 != v59);
                      uint64_t v58 = *a4;
                    }
                    unsigned __int16 v42 = v56 + 6;
                    *a4 = v60;
                    a4[1] = v56 + 6;
                    a4[2] = &v50[6 * v49];
                    if (v58) {
                      operator delete(v58);
                    }
                  }
                  else
                  {
                    int v41 = *(_DWORD *)v33;
                    *(_WORD *)(v39 + 4) = *((_WORD *)v33 + 2);
                    *(_DWORD *)unint64_t v39 = v41;
                    unsigned __int16 v42 = (char *)(v39 + 6);
                  }
                  v63 = a4;
                }
                else
                {
                  unint64_t v43 = (unint64_t)a5[1];
                  unint64_t v44 = (unint64_t)a5[2];
                  if (v43 >= v44)
                  {
                    unint64_t v51 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v43 - (void)*a5) >> 1);
                    unint64_t v52 = v51 + 1;
                    if (v51 + 1 > 0x2AAAAAAAAAAAAAAALL) {
LABEL_221:
                    }
                      sub_496C();
                    unint64_t v53 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v44 - (void)*a5) >> 1);
                    if (2 * v53 > v52) {
                      unint64_t v52 = 2 * v53;
                    }
                    if (v53 >= 0x1555555555555555) {
                      unint64_t v54 = 0x2AAAAAAAAAAAAAAALL;
                    }
                    else {
                      unint64_t v54 = v52;
                    }
                    if (v54) {
                      int v55 = (char *)sub_F280((uint64_t)(a5 + 2), v54);
                    }
                    else {
                      int v55 = 0;
                    }
                    v64 = &v55[6 * v51];
                    int v65 = *(_DWORD *)v33;
                    *((_WORD *)v64 + 2) = *((_WORD *)v33 + 2);
                    *(_DWORD *)v64 = v65;
                    v67 = *a5;
                    v66 = a5[1];
                    v68 = v64;
                    if (v66 != *a5)
                    {
                      do
                      {
                        int v69 = *(_DWORD *)(v66 - 6);
                        v66 -= 6;
                        __int16 v70 = *((_WORD *)v66 + 2);
                        *(_DWORD *)(v68 - 6) = v69;
                        v68 -= 6;
                        *((_WORD *)v68 + 2) = v70;
                      }
                      while (v66 != v67);
                      v66 = *a5;
                    }
                    unsigned __int16 v42 = v64 + 6;
                    *a5 = v68;
                    a5[1] = v64 + 6;
                    a5[2] = &v55[6 * v54];
                    if (v66) {
                      operator delete(v66);
                    }
                  }
                  else
                  {
                    int v45 = *(_DWORD *)v33;
                    *(_WORD *)(v43 + 4) = *((_WORD *)v33 + 2);
                    *(_DWORD *)unint64_t v43 = v45;
                    unsigned __int16 v42 = (char *)(v43 + 6);
                  }
                  v63 = a5;
                }
                v63[1] = v42;
              }
            }
          }
LABEL_146:
          char v19 = 0;
          uint64_t v9 = v158;
          goto LABEL_198;
        }
        sub_9DB0();
        v81 = qword_2C138;
        if (v16 == 2)
        {
          if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v173 = "USBMIDIDriverBase.cpp";
            __int16 v174 = 1024;
            int v175 = 216;
            _os_log_impl(&def_F708, v81, OS_LOG_TYPE_INFO, "%25s:%-5d             (USB MIDI 2.0 CS endpoint descriptor)", buf, 0x12u);
          }
          uint64_t v82 = v6[3];
          if (v6[3])
          {
            uint64_t v83 = 0;
            unsigned __int8 v84 = v164;
            if (v165) {
              unsigned __int8 v85 = v164;
            }
            else {
              unsigned __int8 v85 = 0;
            }
            if (v165) {
              unsigned __int8 v84 = 0;
            }
            char v160 = v84;
            char v161 = v85;
            do
            {
              int v86 = v6[v83 + 4];
              for (j = *a6; j != a6[1]; j += 12)
              {
                if (*j == v86)
                {
                  sub_9DB0();
                  v97 = qword_2C138;
                  if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
                  {
                    int v98 = *j;
                    *(_DWORD *)buf = 136315906;
                    v173 = "USBMIDIDriverBase.cpp";
                    __int16 v174 = 1024;
                    int v175 = 233;
                    __int16 v176 = 1024;
                    LODWORD(v177) = v98;
                    WORD2(v177) = 1024;
                    *(_DWORD *)((char *)&v177 + 6) = v164;
                    _os_log_impl(&def_F708, v97, OS_LOG_TYPE_INFO, "%25s:%-5d      Reusing group terminal blockID %d for endpoint 0x%x", buf, 0x1Eu);
                  }
                  if (v165) {
                    j[6] = v164;
                  }
                  else {
                    j[7] = v164;
                  }
                  goto LABEL_143;
                }
              }
              sub_9DB0();
              v88 = qword_2C138;
              if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315906;
                v173 = "USBMIDIDriverBase.cpp";
                __int16 v174 = 1024;
                int v175 = 226;
                __int16 v176 = 1024;
                LODWORD(v177) = v86;
                WORD2(v177) = 1024;
                *(_DWORD *)((char *)&v177 + 6) = v164;
                _os_log_impl(&def_F708, v88, OS_LOG_TYPE_INFO, "%25s:%-5d      New group terminal blockID %d for endpoint 0x%x", buf, 0x1Eu);
              }
              v89 = a6[1];
              v90 = a6[2];
              if (v89 >= v90)
              {
                unint64_t v92 = 0xAAAAAAAAAAAAAAABLL * ((v89 - *a6) >> 2);
                unint64_t v93 = v92 + 1;
                if (v92 + 1 > 0x1555555555555555) {
                  sub_496C();
                }
                unint64_t v94 = 0xAAAAAAAAAAAAAAABLL * ((v90 - *a6) >> 2);
                if (2 * v94 > v93) {
                  unint64_t v93 = 2 * v94;
                }
                if (v94 >= 0xAAAAAAAAAAAAAAALL) {
                  unint64_t v95 = 0x1555555555555555;
                }
                else {
                  unint64_t v95 = v93;
                }
                if (v95) {
                  v96 = (char *)sub_F2C8((uint64_t)(a6 + 2), v95);
                }
                else {
                  v96 = 0;
                }
                v99 = &v96[12 * v92];
                char *v99 = v86;
                *(_DWORD *)(v99 + 1) = 0;
                v99[5] = 0;
                v99[6] = v161;
                v99[7] = v160;
                *((_DWORD *)v99 + 2) = 0;
                v101 = *a6;
                v100 = a6[1];
                v102 = v99;
                if (v100 != *a6)
                {
                  do
                  {
                    uint64_t v103 = *(void *)(v100 - 12);
                    v100 -= 12;
                    int v104 = *((_DWORD *)v100 + 2);
                    *(void *)(v102 - 12) = v103;
                    v102 -= 12;
                    *((_DWORD *)v102 + 2) = v104;
                  }
                  while (v100 != v101);
                  v100 = *a6;
                }
                v91 = (unsigned __int8 *)(v99 + 12);
                *a6 = (unsigned __int8 *)v102;
                a6[1] = (unsigned __int8 *)(v99 + 12);
                a6[2] = (unsigned __int8 *)&v96[12 * v95];
                if (v100) {
                  operator delete(v100);
                }
              }
              else
              {
                unsigned __int8 *v89 = v86;
                *(_DWORD *)(v89 + 1) = 0;
                v89[5] = 0;
                v89[6] = v161;
                v89[7] = v160;
                v91 = v89 + 12;
                *((_DWORD *)v89 + 2) = 0;
              }
              a6[1] = v91;
LABEL_143:
              ++v83;
            }
            while (v83 != v82);
          }
          goto LABEL_146;
        }
        if (!os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_ERROR)) {
          goto LABEL_197;
        }
        *(_DWORD *)buf = 136315906;
        v173 = "USBMIDIDriverBase.cpp";
        __int16 v174 = 1024;
        int v175 = 241;
        __int16 v176 = 1024;
        LODWORD(v177) = 37;
        WORD2(v177) = 1024;
        *(_DWORD *)((char *)&v177 + 6) = v16;
        __int16 v23 = v81;
        os_log_type_t v24 = OS_LOG_TYPE_ERROR;
        uint32_t v25 = "%25s:%-5d      Unrecognized type/subtype: 0x%x / 0x%x";
        uint32_t v26 = 30;
        goto LABEL_25;
      }
      if (v16 == 3)
      {
        int v111 = v6[6];
        int v112 = v6[3];
        int v113 = v6[4];
        unsigned __int8 v114 = v6[2 * v6[5] + 6];
        v115 = (unsigned char *)v166[1];
        unint64_t v116 = v166[2];
        if ((unint64_t)v115 >= v116)
        {
          int v162 = v6[3];
          int v124 = v6[6];
          unint64_t v125 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v115[-*v166] >> 1);
          unint64_t v126 = v125 + 1;
          if (v125 + 1 > 0x2AAAAAAAAAAAAAAALL) {
            sub_496C();
          }
          unint64_t v127 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v116 - *v166) >> 1);
          if (2 * v127 > v126) {
            unint64_t v126 = 2 * v127;
          }
          if (v127 >= 0x1555555555555555) {
            unint64_t v128 = 0x2AAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v128 = v126;
          }
          if (v128) {
            v129 = (char *)sub_F280(v157, v128);
          }
          else {
            v129 = 0;
          }
          v137 = &v129[6 * v125];
          char *v137 = 3;
          v137[1] = v162;
          v137[2] = v113;
          int v111 = v124;
          v137[3] = v124;
          v137[4] = v114;
          v139 = (char *)*v166;
          v138 = (char *)v166[1];
          v140 = v137;
          if (v138 != (char *)*v166)
          {
            do
            {
              int v141 = *(_DWORD *)(v138 - 6);
              v138 -= 6;
              __int16 v142 = *((_WORD *)v138 + 2);
              *(_DWORD *)(v140 - 6) = v141;
              v140 -= 6;
              *((_WORD *)v140 + 2) = v142;
            }
            while (v138 != v139);
            v138 = (char *)*v166;
          }
          int v112 = v162;
          v117 = v137 + 6;
          void *v166 = v140;
          v166[1] = v137 + 6;
          v166[2] = &v129[6 * v128];
          if (v138) {
            operator delete(v138);
          }
        }
        else
        {
          unsigned char *v115 = 3;
          v115[1] = v112;
          v115[2] = v113;
          v115[3] = v111;
          v117 = v115 + 6;
          v115[4] = v114;
        }
        v166[1] = v117;
        sub_9DB0();
        uint64_t v143 = qword_2C138;
        if (!os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO)) {
          goto LABEL_197;
        }
        int v144 = v6[5];
        v145 = "external";
        if (v112 == 1) {
          v145 = "embedded";
        }
        *(_DWORD *)buf = 136316418;
        v173 = "USBMIDIDriverBase.cpp";
        __int16 v174 = 1024;
        int v175 = 184;
        __int16 v176 = 2080;
        *(void *)&long long v177 = v145;
        WORD4(v177) = 1024;
        *(_DWORD *)((char *)&v177 + 10) = v113;
        HIWORD(v177) = 1024;
        *(_DWORD *)v178 = v111;
        *(_WORD *)&v178[4] = 1024;
        int v179 = v144;
        __int16 v23 = v143;
        os_log_type_t v24 = OS_LOG_TYPE_INFO;
        uint32_t v25 = "%25s:%-5d      Added %s MIDI output jack %d: source jack %d, %d input pin(s)";
        uint32_t v26 = 46;
        goto LABEL_25;
      }
      if (v16 == 2)
      {
        int v105 = v6[3];
        int v106 = v6[4];
        unsigned __int8 v107 = v6[5];
        v108 = (unsigned char *)v166[1];
        unint64_t v109 = v166[2];
        if ((unint64_t)v108 >= v109)
        {
          unint64_t v119 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v108[-*v166] >> 1);
          unint64_t v120 = v119 + 1;
          if (v119 + 1 > 0x2AAAAAAAAAAAAAAALL) {
            sub_496C();
          }
          unint64_t v121 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v109 - *v166) >> 1);
          if (2 * v121 > v120) {
            unint64_t v120 = 2 * v121;
          }
          if (v121 >= 0x1555555555555555) {
            unint64_t v122 = 0x2AAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v122 = v120;
          }
          if (v122) {
            v123 = (char *)sub_F280(v157, v122);
          }
          else {
            v123 = 0;
          }
          v130 = &v123[6 * v119];
          char *v130 = 2;
          v130[1] = v105;
          v130[2] = v106;
          v130[3] = 0;
          v130[4] = v107;
          v132 = (char *)*v166;
          v131 = (char *)v166[1];
          v133 = v130;
          if (v131 == (char *)*v166)
          {
            v136 = (char **)v166;
          }
          else
          {
            do
            {
              int v134 = *(_DWORD *)(v131 - 6);
              v131 -= 6;
              __int16 v135 = *((_WORD *)v131 + 2);
              *(_DWORD *)(v133 - 6) = v134;
              v133 -= 6;
              *((_WORD *)v133 + 2) = v135;
            }
            while (v131 != v132);
            v136 = (char **)v166;
            v131 = (char *)*v166;
          }
          v110 = v130 + 6;
          *v136 = v133;
          v136[1] = v130 + 6;
          v136[2] = &v123[6 * v122];
          if (v131) {
            operator delete(v131);
          }
        }
        else
        {
          unsigned char *v108 = 2;
          v108[1] = v105;
          v108[2] = v106;
          v108[3] = 0;
          v110 = v108 + 6;
          v108[4] = v107;
        }
        v166[1] = v110;
        sub_9DB0();
        uint64_t v146 = qword_2C138;
        if (!os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO)) {
          goto LABEL_197;
        }
        *(_DWORD *)buf = 136315906;
        v147 = "external";
        if (v105 == 1) {
          v147 = "embedded";
        }
        v173 = "USBMIDIDriverBase.cpp";
        __int16 v174 = 1024;
        int v175 = 173;
        __int16 v176 = 2080;
        *(void *)&long long v177 = v147;
        WORD4(v177) = 1024;
        *(_DWORD *)((char *)&v177 + 10) = v106;
        __int16 v23 = v146;
        os_log_type_t v24 = OS_LOG_TYPE_INFO;
        uint32_t v25 = "%25s:%-5d      Added %s MIDI input jack %d";
LABEL_24:
        uint32_t v26 = 34;
LABEL_25:
        _os_log_impl(&def_F708, v23, v24, v25, buf, v26);
        goto LABEL_197;
      }
      if (v16 != 1)
      {
        sub_9DB0();
        uint64_t v118 = qword_2C138;
        if (!os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO)) {
          goto LABEL_197;
        }
        *(_DWORD *)buf = 136315650;
        v173 = "USBMIDIDriverBase.cpp";
        __int16 v174 = 1024;
        int v175 = 186;
        __int16 v176 = 1024;
        LODWORD(v177) = v16;
        __int16 v23 = v118;
        os_log_type_t v24 = OS_LOG_TYPE_INFO;
        uint32_t v25 = "%25s:%-5d      Skipping unrecognized CS interface subtype %d...";
        uint32_t v26 = 24;
        goto LABEL_25;
      }
      sub_9DB0();
      v74 = qword_2C138;
      if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_DEBUG))
      {
        v75 = __p;
        if (v168 < 0) {
          v75 = (void **)__p[0];
        }
        *(_DWORD *)buf = 136315650;
        v173 = "USBMIDIDriverBase.cpp";
        __int16 v174 = 1024;
        int v175 = 151;
        __int16 v176 = 2080;
        *(void *)&long long v177 = v75;
        _os_log_impl(&def_F708, v74, OS_LOG_TYPE_DEBUG, "%25s:%-5d      Found CS descriptor: %s", buf, 0x1Cu);
      }
      int v76 = *(unsigned __int16 *)(v6 + 3);
      sub_9DB0();
      v77 = qword_2C138;
      BOOL v78 = os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO);
      if (v76 != 512)
      {
        if (v78)
        {
          *(_DWORD *)buf = 136315394;
          v173 = "USBMIDIDriverBase.cpp";
          __int16 v174 = 1024;
          int v175 = 163;
          __int16 v23 = v77;
          os_log_type_t v24 = OS_LOG_TYPE_INFO;
          uint32_t v25 = "%25s:%-5d      Skipping CS interface descriptor";
          goto LABEL_189;
        }
LABEL_197:
        char v19 = 0;
        goto LABEL_198;
      }
      if (v78)
      {
        *(_DWORD *)buf = 136315394;
        v173 = "USBMIDIDriverBase.cpp";
        __int16 v174 = 1024;
        int v175 = 155;
        _os_log_impl(&def_F708, v77, OS_LOG_TYPE_INFO, "%25s:%-5d      Found a USB MIDI 2.0 alternate setting", buf, 0x12u);
      }
      int v79 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v9 + 176))(v9, 1);
      sub_9DB0();
      v80 = qword_2C138;
      if (!v79)
      {
        if (!os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO)) {
          goto LABEL_197;
        }
        *(_DWORD *)buf = 136315394;
        v173 = "USBMIDIDriverBase.cpp";
        __int16 v174 = 1024;
        int v175 = 160;
        __int16 v23 = v80;
        os_log_type_t v24 = OS_LOG_TYPE_INFO;
        uint32_t v25 = "%25s:%-5d      Alternate interface now set for MIDI 2.0";
LABEL_189:
        uint32_t v26 = 18;
        goto LABEL_25;
      }
      if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v173 = "USBMIDIDriverBase.cpp";
        __int16 v174 = 1024;
        int v175 = 157;
        _os_log_impl(&def_F708, v80, OS_LOG_TYPE_ERROR, "%25s:%-5d      Unable to set MIDI 2.0 alt setting!", buf, 0x12u);
      }
      char v19 = 1;
    }
    else
    {
      if (v15 != 4)
      {
        if (v15 != 5) {
          goto LABEL_198;
        }
        unsigned int v20 = v6[2];
        int v165 = v20 >> 7;
        sub_9DB0();
        uint64_t v21 = qword_2C138;
        unsigned __int8 v164 = v20;
        if (!os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO)) {
          goto LABEL_197;
        }
        *(_DWORD *)buf = 136315906;
        int v22 = "output";
        if ((v20 & 0x80u) != 0) {
          int v22 = "input";
        }
        v173 = "USBMIDIDriverBase.cpp";
        __int16 v174 = 1024;
        int v175 = 192;
        __int16 v176 = 1024;
        LODWORD(v177) = v20;
        WORD2(v177) = 2080;
        *(void *)((char *)&v177 + 6) = v22;
        __int16 v23 = v21;
        os_log_type_t v24 = OS_LOG_TYPE_INFO;
        uint32_t v25 = "%25s:%-5d      Examining endpoint 0x%x (%s)";
        goto LABEL_24;
      }
      unsigned int v71 = v6[3];
      sub_9DB0();
      v72 = qword_2C138;
      if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v173 = "USBMIDIDriverBase.cpp";
        __int16 v174 = 1024;
        int v175 = 143;
        __int16 v176 = 1024;
        LODWORD(v177) = v71;
        _os_log_impl(&def_F708, v72, OS_LOG_TYPE_INFO, "%25s:%-5d      Examining alt setting %d...", buf, 0x18u);
      }
      if (v71 < 2) {
        goto LABEL_197;
      }
      sub_9DB0();
      v73 = qword_2C138;
      char v19 = 1;
      if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v173 = "USBMIDIDriverBase.cpp";
        __int16 v174 = 1024;
        int v175 = 146;
        _os_log_impl(&def_F708, v73, OS_LOG_TYPE_INFO, "%25s:%-5d      Done examining descriptors; halting", buf, 0x12u);
      }
    }
LABEL_198:
    uint64_t v148 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, void))(*(void *)v9 + 448))(v9, v6, 0);
    if (!v148)
    {
      sub_9DB0();
      v149 = qword_2C138;
      if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v173 = "USBMIDIDriverBase.cpp";
        __int16 v174 = 1024;
        int v175 = 248;
        _os_log_impl(&def_F708, v149, OS_LOG_TYPE_DEBUG, "%25s:%-5d      FindNextAssociatedDescriptor() returned nullptr for kUSBAnyDesc", buf, 0x12u);
      }
      uint64_t v148 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, uint64_t))(*(void *)v9 + 448))(v9, v6, 4);
      if (!v148)
      {
        sub_9DB0();
        v150 = qword_2C138;
        if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v173 = "USBMIDIDriverBase.cpp";
          __int16 v174 = 1024;
          int v175 = 252;
          _os_log_impl(&def_F708, v150, OS_LOG_TYPE_DEBUG, "%25s:%-5d      FindNextAssociatedDescriptor() returned nullptr for kUSBInterfaceDesc; done",
            buf,
            0x12u);
        }
        uint64_t v148 = 0;
      }
    }
    if (v168 < 0) {
      operator delete(__p[0]);
    }
    if (v148) {
      char v151 = v19;
    }
    else {
      char v151 = 1;
    }
    int v6 = (unsigned __int8 *)v148;
  }
  while ((v151 & 1) == 0);
  sub_9DB0();
  v152 = qword_2C138;
  if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v173 = "USBMIDIDriverBase.cpp";
    __int16 v174 = 1024;
    int v175 = 118;
    _os_log_impl(&def_F708, v152, OS_LOG_TYPE_DEBUG, "%25s:%-5d      Bailing out of loop...", buf, 0x12u);
  }
  LOBYTE(__p[0]) = 0;
  __int16 v170 = 0;
  __int16 v169 = 0;
  (*(void (**)(uint64_t, void **))(*(void *)v9 + 80))(v9, __p);
  (*(void (**)(uint64_t, char *))(*(void *)v9 + 88))(v9, (char *)&v170 + 1);
  (*(void (**)(uint64_t, char *))(*(void *)v9 + 104))(v9, (char *)&v171 + 2);
  (*(void (**)(uint64_t, int *))(*(void *)v9 + 112))(v9, &v171);
  (*(void (**)(uint64_t, __int16 *))(*(void *)v9 + 136))(v9, &v170);
  (*(void (**)(uint64_t, char *))(*(void *)v9 + 144))(v9, (char *)&v169 + 1);
  (*(void (**)(uint64_t, __int16 *))(*(void *)v9 + 152))(v9, &v169);
  sub_9DB0();
  v153 = qword_2C138;
  if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316418;
    v173 = "USBMIDIDriverBase.cpp";
    __int16 v174 = 1024;
    int v175 = 127;
    __int16 v176 = 1024;
    LODWORD(v177) = LOBYTE(__p[0]);
    WORD2(v177) = 1024;
    *(_DWORD *)((char *)&v177 + 6) = HIBYTE(v170);
    WORD5(v177) = 1024;
    HIDWORD(v177) = HIWORD(v171);
    *(_WORD *)v178 = 1024;
    *(_DWORD *)&v178[2] = (unsigned __int16)v171;
    _os_log_impl(&def_F708, v153, OS_LOG_TYPE_INFO, "%25s:%-5d      Interface class %d, subclass %d, for device 0x%04x /0x%04x", buf, 0x2Au);
  }
  sub_9DB0();
  v154 = qword_2C138;
  if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v173 = "USBMIDIDriverBase.cpp";
    __int16 v174 = 1024;
    int v175 = 128;
    __int16 v176 = 1024;
    LODWORD(v177) = v170;
    WORD2(v177) = 1024;
    *(_DWORD *)((char *)&v177 + 6) = HIBYTE(v169);
    WORD5(v177) = 1024;
    HIDWORD(v177) = v169;
    _os_log_impl(&def_F708, v154, OS_LOG_TYPE_INFO, "%25s:%-5d      Interface %d alternate setting %d : %d endpoints", buf, 0x24u);
  }
  sub_9DB0();
  v155 = qword_2C138;
  if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v173 = "USBMIDIDriverBase.cpp";
    __int16 v174 = 1024;
    int v175 = 255;
    _os_log_impl(&def_F708, v155, OS_LOG_TYPE_INFO, "%25s:%-5d [-] USBMIDIDriverBase::ParseDescriptors()", buf, 0x12u);
  }
  return result;
}

void sub_B5A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  if (a36 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_B5F0(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  sub_9DB0();
  int v7 = qword_2C138;
  if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 2);
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 260;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = a1;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = a2;
    *(_WORD *)&buf[34] = 2048;
    *(void *)&buf[36] = v8;
    _os_log_impl(&def_F708, v7, OS_LOG_TYPE_INFO, "%25s:%-5d [+] USBMIDIDriverBase::CreatePortMapList(inUSBDevice:%p, interfaceNum:%d) - Constructing a USB MIDI 2.0 port map list for %lu group terminal block(s)", buf, 0x2Cu);
  }
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v97 = 0u;
  memset(buf, 0, sizeof(buf));
  sub_9DB0();
  uint64_t v9 = qword_2C138;
  if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__b = 136315394;
    *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&__b[12] = 1024;
    *(_DWORD *)&__b[14] = 265;
    _os_log_impl(&def_F708, v9, OS_LOG_TYPE_INFO, "%25s:%-5d      Issuing device request to load group terminal block descriptors...", __b, 0x12u);
  }
  int v87 = 0;
  sub_6804(a1, a2, 1, (uint64_t)buf, 5, &v87);
  if (v87 != 5)
  {
    sub_9DB0();
    unsigned int v14 = qword_2C138;
    if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__b = 136316418;
      *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
      *(_WORD *)&__b[12] = 1024;
      *(_DWORD *)&__b[14] = 341;
      *(_WORD *)&__b[18] = 1024;
      *(_DWORD *)&__b[20] = a2;
      *(_WORD *)&__b[24] = 1024;
      *(_DWORD *)&__b[26] = 1;
      *(_WORD *)&__b[30] = 1024;
      *(_DWORD *)&__b[32] = 5;
      *(_WORD *)v89 = 1024;
      *(_DWORD *)&v89[2] = v87;
      _os_log_impl(&def_F708, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d [!]  FATAL: Could not retrieve Group Terminal Descriptors for USB MIDI interface %d alternate setting %d. Expected header length %u but got %u", __b, 0x2Au);
    }
    goto LABEL_99;
  }
  uint64_t v10 = buf[0];
  if (buf[0])
  {
    sub_5980(__p, 3 * buf[0], 0);
    if (v86 >= 0) {
      uint64_t v11 = __p;
    }
    else {
      uint64_t v11 = (void **)__p[0];
    }
    char v12 = buf;
    do
    {
      unsigned int v13 = *v12++;
      *(unsigned char *)uint64_t v11 = a0123456789abcd_0[(unint64_t)v13 >> 4];
      *((unsigned char *)v11 + 1) = a0123456789abcd_0[v13 & 0xF];
      *((unsigned char *)v11 + 2) = 32;
      uint64_t v11 = (void **)((char *)v11 + 3);
      --v10;
    }
    while (v10);
  }
  else
  {
    sub_F1CC(__p, (char *)&unk_22591);
  }
  int v15 = *(unsigned __int16 *)&buf[3];
  unsigned int v84 = 0;
  sub_9DB0();
  int v16 = qword_2C138;
  if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
  {
    __int16 v17 = __p;
    if (v86 < 0) {
      __int16 v17 = (void **)__p[0];
    }
    *(_DWORD *)__b = 136315906;
    *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&__b[12] = 1024;
    *(_DWORD *)&__b[14] = 276;
    *(_WORD *)&__b[18] = 1024;
    *(_DWORD *)&__b[20] = v15;
    *(_WORD *)&__b[24] = 2080;
    *(void *)&__b[26] = v17;
    _os_log_impl(&def_F708, v16, OS_LOG_TYPE_INFO, "%25s:%-5d      Got group terminal block descriptor header (totalLength = %d): %s", __b, 0x22u);
  }
  sub_6804(a1, a2, 1, (uint64_t)buf, v15, &v84);
  unsigned int v18 = v84;
  if (-991146299 * (v84 - v87) >= 0x13B13B14)
  {
    sub_9DB0();
    char v19 = qword_2C138;
    BOOL v20 = os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_ERROR);
    unsigned int v18 = v84;
    if (v20)
    {
      *(_DWORD *)__b = 136315650;
      *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
      *(_WORD *)&__b[12] = 1024;
      *(_DWORD *)&__b[14] = 279;
      *(_WORD *)&__b[18] = 1024;
      *(_DWORD *)&__b[20] = v84;
      _os_log_impl(&def_F708, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d      Unexpected group terminal descriptor length: %u", __b, 0x18u);
      unsigned int v18 = v84;
    }
  }
  unsigned int v21 = v18 - v87;
  unsigned int v22 = (v18 - v87) / 0xD;
  if ((v18 - v87) % 0xD)
  {
    sub_9DB0();
    uint64_t v23 = qword_2C138;
    if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__b = 136315650;
      *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
      *(_WORD *)&__b[12] = 1024;
      *(_DWORD *)&__b[14] = 283;
      *(_WORD *)&__b[18] = 1024;
      *(_DWORD *)&__b[20] = v84;
      os_log_type_t v24 = "%25s:%-5d      Unexpected total descriptor length: %u";
      uint32_t v25 = v23;
      os_log_type_t v26 = OS_LOG_TYPE_ERROR;
      uint32_t v27 = 24;
LABEL_33:
      _os_log_impl(&def_F708, v25, v26, v24, __b, v27);
    }
  }
  else
  {
    unint64_t v28 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 2);
    sub_9DB0();
    uint64_t v29 = qword_2C138;
    if (v28 == v22)
    {
      if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
      {
        *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
        unint64_t v30 = "s";
        *(_DWORD *)&__b[14] = 287;
        *(_DWORD *)__b = 136316162;
        *(_WORD *)&__b[12] = 1024;
        if (v21 - 13 < 0xD) {
          unint64_t v30 = (const char *)&unk_22591;
        }
        *(_WORD *)&__b[18] = 1024;
        *(_DWORD *)&__b[20] = v22;
        *(_WORD *)&__b[24] = 2080;
        *(void *)&__b[26] = v30;
        *(_WORD *)&__b[34] = 1024;
        *(_DWORD *)v89 = v84;
        os_log_type_t v24 = "%25s:%-5d      Got %d group terminal block descriptor%s (receivedLength = %u). ";
        uint32_t v25 = v29;
        os_log_type_t v26 = OS_LOG_TYPE_INFO;
        uint32_t v27 = 40;
        goto LABEL_33;
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_ERROR))
    {
      int v31 = -1431655765 * ((*(void *)(a3 + 8) - *(void *)a3) >> 2);
      *(_DWORD *)__b = 136315906;
      *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
      *(_WORD *)&__b[12] = 1024;
      *(_DWORD *)&__b[14] = 285;
      *(_WORD *)&__b[18] = 1024;
      *(_DWORD *)&__b[20] = v31;
      *(_WORD *)&__b[24] = 1024;
      *(_DWORD *)&__b[26] = v22;
      os_log_type_t v24 = "%25s:%-5d      Expected %d descriptors, not %d";
      uint32_t v25 = v29;
      os_log_type_t v26 = OS_LOG_TYPE_ERROR;
      uint32_t v27 = 30;
      goto LABEL_33;
    }
  }
  unsigned int v82 = v21 - 13;
  if (v21 >= 0xD)
  {
    int v32 = 0;
    int v33 = 0;
    do
    {
      __int16 v34 = &buf[13 * v32 + v87];
      uint64_t v35 = *v34;
      if (*v34)
      {
        sub_5980(__b, 3 * v35, 0);
        v36 = __b;
        if (__b[23] < 0) {
          v36 = *(unsigned char **)__b;
        }
        do
        {
          unsigned int v37 = *v34++;
          unsigned char *v36 = a0123456789abcd_0[(unint64_t)v37 >> 4];
          v36[1] = a0123456789abcd_0[v37 & 0xF];
          v36[2] = 32;
          v36 += 3;
          --v35;
        }
        while (v35);
      }
      else
      {
        sub_F1CC(__b, (char *)&unk_22591);
      }
      if (SHIBYTE(v86) < 0) {
        operator delete(__p[0]);
      }
      *(_OWORD *)__p = *(_OWORD *)__b;
      uint64_t v86 = *(void *)&__b[16];
      sub_9DB0();
      int v38 = qword_2C138;
      if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
      {
        unint64_t v39 = __p;
        if (v86 < 0) {
          unint64_t v39 = (void **)__p[0];
        }
        *(_DWORD *)__b = 136315906;
        *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
        *(_WORD *)&__b[12] = 1024;
        *(_DWORD *)&__b[14] = 294;
        *(_WORD *)&__b[18] = 1024;
        *(_DWORD *)&__b[20] = v32;
        *(_WORD *)&__b[24] = 2080;
        *(void *)&__b[26] = v39;
        _os_log_impl(&def_F708, v38, OS_LOG_TYPE_INFO, "%25s:%-5d      %00d: %s ", __b, 0x22u);
      }
      int v32 = ++v33;
    }
    while (v22 > v33);
  }
  sub_9DB0();
  unint64_t v40 = qword_2C138;
  if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
  {
    unint64_t v43 = "s";
    *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
    *(_DWORD *)__b = 136315650;
    if (v82 < 0xD) {
      unint64_t v43 = (const char *)&unk_22591;
    }
    *(_WORD *)&__b[12] = 1024;
    *(_DWORD *)&__b[14] = 296;
    *(_WORD *)&__b[18] = 2080;
    *(void *)&__b[20] = v43;
    _os_log_impl(&def_F708, v40, OS_LOG_TYPE_INFO, "%25s:%-5d      Parsing group terminal block descriptor%s ...", __b, 0x1Cu);
  }
  sub_C2DC((unsigned __int8 **)a3, (unint64_t)&buf[5], v84, v41, v42);
  unint64_t v44 = *(void *)(a3 + 8);
  unint64_t v45 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v44 - *(void *)a3) >> 2));
  if (v44 == *(void *)a3) {
    uint64_t v46 = 0;
  }
  else {
    uint64_t v46 = v45;
  }
  sub_F310(*(void *)a3, v44, v46, 1);
  unint64_t v48 = *(unsigned __int8 **)a3;
  unint64_t v47 = *(unsigned __int8 **)(a3 + 8);
  if (*(unsigned __int8 **)a3 != v47)
  {
    unsigned __int8 v49 = 0;
    char v50 = 0;
    do
    {
      sub_9DB0();
      unint64_t v51 = qword_2C138;
      if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
      {
        int v52 = *v48;
        int v53 = v48[1];
        int v54 = v48[2];
        int v55 = v48[3];
        int v56 = v48[6];
        int v57 = v48[7];
        int v58 = v48[4];
        *(_DWORD *)__b = 136317186;
        *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
        *(_WORD *)&__b[12] = 1024;
        *(_DWORD *)&__b[14] = 306;
        *(_WORD *)&__b[18] = 1024;
        *(_DWORD *)&__b[20] = v52;
        *(_WORD *)&__b[24] = 1024;
        *(_DWORD *)&__b[26] = v53;
        *(_WORD *)&__b[30] = 1024;
        *(_DWORD *)&__b[32] = v54;
        *(_WORD *)v89 = 1024;
        *(_DWORD *)&v89[2] = v55;
        __int16 v90 = 1024;
        int v91 = v56;
        __int16 v92 = 1024;
        int v93 = v57;
        __int16 v94 = 1024;
        int v95 = v58;
        _os_log_impl(&def_F708, v51, OS_LOG_TYPE_INFO, "%25s:%-5d      blockID 0x%x blockType 0x%x first gt %u (%u total) inEP 0x%x outEP 0x%x gtb.midiProtocol 0x%x", __b, 0x3Cu);
      }
      if (!v48[4])
      {
        int v61 = v48[6];
        int v62 = v48[7];
        sub_9DB0();
        v63 = qword_2C138;
        if (!v61 || !v62)
        {
          if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_ERROR))
          {
            int v78 = *v48;
            *(_DWORD *)__b = 136315650;
            *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
            *(_WORD *)&__b[12] = 1024;
            *(_DWORD *)&__b[14] = 319;
            *(_WORD *)&__b[18] = 1024;
            *(_DWORD *)&__b[20] = v78;
            _os_log_impl(&def_F708, v63, OS_LOG_TYPE_ERROR, "%25s:%-5d      blockID 0x%x cannot use MIDI-CI without both a valid input and output endpoint. Skipping ...", __b, 0x18u);
          }
          goto LABEL_91;
        }
        if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__b = 136315394;
          *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
          *(_WORD *)&__b[12] = 1024;
          *(_DWORD *)&__b[14] = 315;
          _os_log_impl(&def_F708, v63, OS_LOG_TYPE_INFO, "%25s:%-5d           (MIDI-CI protocol negotiation will occur before going online)", __b, 0x12u);
        }
      }
      unsigned int v59 = v48[1];
      if ((v59 | 2) == 2) {
        int v60 = v48[6];
      }
      else {
        int v60 = 0;
      }
      if (v59 >= 2) {
        unsigned __int8 v64 = 0;
      }
      else {
        unsigned __int8 v64 = v48[7];
      }
      if (v60 || v64)
      {
        unint64_t v65 = *a4;
        unsigned int v66 = v48[2];
        while (v65 < a4[1] && *(unsigned __int8 *)(v65 + 5) <= v66)
          v65 += 8;
        if (v48[4] < 5u) {
          char v67 = 1;
        }
        else {
          char v67 = 2;
        }
        if (v48[4]) {
          char v68 = v67;
        }
        else {
          char v68 = -1;
        }
        unsigned __int8 v69 = v48[3];
        unsigned __int8 v70 = *v48;
        __b[0] = v50;
        __b[1] = v49;
        __b[2] = v60;
        __b[3] = v64;
        __b[4] = v68;
        __b[5] = v66;
        __b[6] = v69;
        __b[7] = v70;
        sub_C354(a4, v65, (double *)__b);
        sub_9DB0();
        unsigned int v71 = qword_2C138;
        if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
        {
          int v72 = *v48;
          unsigned int v73 = v48[4];
          if (v73 < 5) {
            int v74 = 1;
          }
          else {
            int v74 = 2;
          }
          BOOL v75 = v73 == 0;
          int v76 = v48[2];
          if (v75) {
            int v74 = 255;
          }
          int v77 = v48[3];
          *(_DWORD *)__b = 136317186;
          *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
          *(_WORD *)&__b[12] = 1024;
          *(_DWORD *)&__b[14] = 332;
          *(_WORD *)&__b[18] = 1024;
          *(_DWORD *)&__b[20] = v72;
          *(_WORD *)&__b[24] = 1024;
          *(_DWORD *)&__b[26] = v49;
          *(_WORD *)&__b[30] = 1024;
          *(_DWORD *)&__b[32] = v60;
          *(_WORD *)v89 = 1024;
          *(_DWORD *)&v89[2] = v64;
          __int16 v90 = 1024;
          int v91 = v74;
          __int16 v92 = 1024;
          int v93 = v76;
          __int16 v94 = 1024;
          int v95 = v77;
          _os_log_impl(&def_F708, v71, OS_LOG_TYPE_INFO, "%25s:%-5d      blockID 0x%x cable 0x%x, inEP 0x%x, outEP 0x%x, usbpipeprotocol 0x%00x, firstGroupTerminal %d, numGroups %d -> maplist", __b, 0x3Cu);
        }
        ++v50;
        v49 += v48[3];
      }
LABEL_91:
      v48 += 12;
    }
    while (v48 != v47);
  }
  sub_9DB0();
  int v79 = qword_2C138;
  if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
  {
    uint64_t v80 = (a4[1] - *a4) >> 3;
    *(_DWORD *)__b = 136315650;
    *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&__b[12] = 1024;
    *(_DWORD *)&__b[14] = 337;
    *(_WORD *)&__b[18] = 2048;
    *(void *)&__b[20] = v80;
    _os_log_impl(&def_F708, v79, OS_LOG_TYPE_INFO, "%25s:%-5d      Maplist constructed with %lu group terminal block(s).", __b, 0x1Cu);
  }
  if (SHIBYTE(v86) < 0) {
    operator delete(__p[0]);
  }
LABEL_99:
  sub_9DB0();
  v81 = qword_2C138;
  if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__b = 136315394;
    *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&__b[12] = 1024;
    *(_DWORD *)&__b[14] = 343;
    _os_log_impl(&def_F708, v81, OS_LOG_TYPE_INFO, "%25s:%-5d [-] USBMIDIDriverBase::CreatePortMapList()", __b, 0x12u);
  }
}

void sub_C294(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  uint64_t v23 = *(void **)a15;
  if (*(void *)a15)
  {
    *(void *)(a15 + 8) = v23;
    operator delete(v23);
  }
  _Unwind_Resume(exception_object);
}

unsigned __int8 **sub_C2DC(unsigned __int8 **result, unint64_t a2, unsigned int a3, uint8x8_t a4, int16x8_t a5)
{
  if (a3)
  {
    unint64_t v5 = a2 + a3;
    int v6 = *result;
    int v7 = result[1];
    do
    {
      if (v6 != v7)
      {
        unint64_t v8 = v6;
        while (*v8 != *(unsigned __int8 *)(a2 + 3))
        {
          v8 += 12;
          if (v8 == v7) {
            goto LABEL_9;
          }
        }
        v8[1] = *(unsigned char *)(a2 + 4);
        a4.i32[0] = *(_DWORD *)(a2 + 5);
        int16x4_t v9 = (int16x4_t)vmovl_u8(a4).u64[0];
        *(int16x4_t *)a5.i8 = vrev32_s16(v9);
        a5.i32[0] = v9.i32[0];
        a4 = (uint8x8_t)vmovn_s16(a5);
        *(_DWORD *)(v8 + 2) = a4.i32[0];
        *((_WORD *)v8 + 4) = *(_WORD *)(a2 + 9);
        *((_WORD *)v8 + 5) = *(_WORD *)(a2 + 11);
      }
LABEL_9:
      a2 += 13;
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t *sub_C354(uint64_t *a1, uint64_t a2, double *a3)
{
  uint64_t v4 = (uint64_t *)a2;
  unint64_t v6 = a1[1];
  unint64_t v9 = a1[2];
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = v9;
  if (v6 >= v9)
  {
    uint64_t v10 = *a1;
    unint64_t v11 = ((uint64_t)(v6 - *a1) >> 3) + 1;
    if (v11 >> 61) {
      sub_496C();
    }
    uint64_t v12 = (a2 - v10) >> 3;
    uint64_t v13 = v8 - v10;
    uint64_t v14 = v13 >> 2;
    if (v13 >> 2 <= v11) {
      uint64_t v14 = ((uint64_t)(v6 - *a1) >> 3) + 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v14;
    }
    uint64_t v22 = v7;
    if (v15) {
      int v16 = (char *)sub_1041C(v7, v15);
    }
    else {
      int v16 = 0;
    }
    __p = v16;
    char v19 = &v16[8 * v12];
    BOOL v20 = v19;
    unsigned int v21 = &v16[8 * v15];
    sub_101F4((uint64_t)&__p, a3);
    uint64_t v4 = (uint64_t *)sub_10368((uint64_t)a1, &__p, v4);
    if (v20 != v19) {
      v20 += (v19 - v20 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    if (__p) {
      operator delete(__p);
    }
  }
  else if (a2 == v6)
  {
    *(double *)a2 = *a3;
    a1[1] = a2 + 8;
  }
  else
  {
    sub_101A0((uint64_t)a1, a2, v6, (char *)(a2 + 8));
    *uint64_t v4 = *(void *)a3;
  }
  return v4;
}

void sub_C490(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_C4C8(uint64_t a1@<X0>, int a2@<W1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t *a5@<X8>)
{
  *a5 = 0;
  a5[1] = 0;
  a5[2] = 0;
  sub_9DB0();
  uint64_t v10 = qword_2C138;
  if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((a3[1] - *a3) >> 1);
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 1);
    *(_DWORD *)uint8x8_t v41 = 136316418;
    *(void *)&v41[4] = "USBMIDIDriverBase.cpp";
    __int16 v42 = 1024;
    int v43 = 349;
    __int16 v44 = 2048;
    uint64_t v45 = a1;
    __int16 v46 = 1024;
    int v47 = a2;
    __int16 v48 = 2048;
    unint64_t v49 = v11;
    __int16 v50 = 2048;
    unint64_t v51 = v12;
    _os_log_impl(&def_F708, v10, OS_LOG_TYPE_INFO, "%25s:%-5d [+] USBMIDIDriverBase::CreatePortMapList(inUSBDevice:%p, interfaceNum:%d) - Constructing a USB MIDI 1.0 port map list for %lu inputs and %lu outputs...", v41, 0x36u);
  }
  uint64_t v14 = *a3;
  uint64_t v13 = a3[1];
  if (v13 == *a3)
  {
    unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((v13 - *a3) >> 1);
  }
  else
  {
    unint64_t v15 = 0;
    unint64_t v16 = a5[1];
    do
    {
      int v17 = *(unsigned __int8 *)(v14 + 6 * v15 + 5);
      uint64_t v18 = *a5;
      if (*a5 == v16)
      {
        char v19 = 0;
      }
      else
      {
        char v19 = 0;
        do
        {
          char v20 = (v17 & 0x80) != 0 && *(unsigned __int8 *)(v18 + 2) == v17
             || (v17 & 0x80u) == 0 && *(unsigned __int8 *)(v18 + 3) == v17;
          v19 += v20;
          v18 += 8;
        }
        while (v18 != v16);
      }
      v41[0] = v15;
      v41[1] = v19;
      v41[2] = v17;
      *(_DWORD *)&v41[3] = 0;
      v41[7] = 0;
      if (v16 >= a5[2])
      {
        unint64_t v16 = sub_10570(a5, v41);
        uint64_t v14 = *a3;
        uint64_t v13 = a3[1];
      }
      else
      {
        *(unsigned char *)unint64_t v16 = v15;
        *(unsigned char *)(v16 + 1) = v19;
        *(unsigned char *)(v16 + 2) = v17;
        *(_DWORD *)(v16 + 3) = 0;
        *(unsigned char *)(v16 + 7) = 0;
        v16 += 8;
      }
      a5[1] = v16;
      ++v15;
      unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((v13 - v14) >> 1);
    }
    while (v22 > v15);
  }
  uint64_t v24 = *a4;
  uint64_t v23 = a4[1];
  unint64_t v25 = (v23 - *a4) / 6;
  if (v25 >= v22) {
    LODWORD(v26) = v22;
  }
  else {
    uint64_t v26 = (v23 - *a4) / 6;
  }
  if ((int)v26 <= 0)
  {
    unint64_t v28 = a5[1];
  }
  else
  {
    uint64_t v27 = 0;
    uint64_t v29 = *a5;
    unint64_t v28 = a5[1];
    do
    {
      if (v27 == v25) {
        sub_104C8();
      }
      if (v29 != v28)
      {
        int v30 = *(unsigned __int8 *)(v24 + 6 * v27 + 5);
        uint64_t v31 = v29;
        while (1)
        {
          int v32 = *(unsigned __int8 *)(v31 + 3);
          if ((v30 & 0x80) != 0 && *(unsigned __int8 *)(v31 + 2) == v30) {
            break;
          }
          if ((v30 & 0x80) == 0 && v32 == v30)
          {
            int v32 = *(unsigned __int8 *)(v31 + 2);
            break;
          }
          v31 += 8;
          if (v31 == v28) {
            goto LABEL_45;
          }
        }
        uint64_t v33 = v29;
        if (v32)
        {
          while (*(unsigned __int8 *)(v33 + 2) != v32 || *(unsigned char *)(v33 + 3))
          {
            v33 += 8;
            if (v33 == v28) {
              goto LABEL_51;
            }
          }
          goto LABEL_50;
        }
LABEL_45:
        if (v29 == v28) {
          goto LABEL_51;
        }
        uint64_t v33 = v29;
        while (*(unsigned char *)(v33 + 3))
        {
          v33 += 8;
          if (v33 == v28) {
            goto LABEL_51;
          }
        }
LABEL_50:
        *(unsigned char *)(v33 + 3) = v30;
      }
LABEL_51:
      ++v27;
    }
    while (v27 != v26);
  }
  uint64_t v34 = v28 - *a5;
  if (v25 > v34 >> 3)
  {
    unint64_t v35 = v34 >> 3;
    unint64_t v36 = (unint64_t)v34 >> 3;
    int v37 = *(unsigned __int8 *)(v24 + 6 * v35 + 5);
    do
    {
      int v38 = v37;
      int v37 = *(unsigned __int8 *)(v24 + 6 * v35 + 5);
      if (v38 == v37) {
        int v39 = v36;
      }
      else {
        int v39 = 0;
      }
      v41[0] = v35;
      *(_WORD *)&v41[1] = v39;
      v41[3] = v37;
      *(_DWORD *)&v41[4] = 1;
      if (v28 >= a5[2])
      {
        unint64_t v28 = sub_10570(a5, v41);
        uint64_t v24 = *a4;
        uint64_t v23 = a4[1];
      }
      else
      {
        *(unsigned char *)unint64_t v28 = v35;
        *(unsigned char *)(v28 + 1) = v39;
        *(unsigned char *)(v28 + 2) = 0;
        *(unsigned char *)(v28 + 3) = v37;
        *(_DWORD *)(v28 + 4) = 1;
        v28 += 8;
      }
      LODWORD(v36) = v39 + 1;
      a5[1] = v28;
      unint64_t v35 = (uint64_t)(v28 - *a5) >> 3;
    }
    while (v35 < 0xAAAAAAAAAAAAAAABLL * ((v23 - v24) >> 1));
  }
  sub_9DB0();
  unint64_t v40 = qword_2C138;
  if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint8x8_t v41 = 136315394;
    *(void *)&v41[4] = "USBMIDIDriverBase.cpp";
    __int16 v42 = 1024;
    int v43 = 398;
    _os_log_impl(&def_F708, v40, OS_LOG_TYPE_INFO, "%25s:%-5d [-] USBMIDIDriverBase::CreatePortMapList()", v41, 0x12u);
  }
}

void sub_C914(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

CFStringRef sub_C938(uint64_t a1, int a2, const __CFString *a3)
{
  CFStringRef v4 = sub_6778(a1, a2);
  if (!v4) {
    return v4;
  }
  int Length = CFStringGetLength(a3);
  int v6 = CFStringGetLength(v4);
  if (v6 < Length) {
    return v4;
  }
  CFIndex v7 = Length;
  v11.location = 0;
  v11.length = Length;
  if (CFStringCompareWithOptions(v4, a3, v11, 1uLL)) {
    return v4;
  }
  if (Length < v6)
  {
    while (1)
    {
      int CharacterAtIndex = CFStringGetCharacterAtIndex(v4, v7);
      if (CharacterAtIndex != 95 && CharacterAtIndex != 32) {
        break;
      }
      if (v6 == ++v7)
      {
        int Length = v6;
        goto LABEL_11;
      }
    }
    int Length = v7;
  }
LABEL_11:
  v12.location = Length;
  v12.length = v6 - Length;
  CFStringRef v10 = CFStringCreateWithSubstring(0, v4, v12);
  CFRelease(v4);
  return v10;
}

BOOL sub_CA28(uint64_t a1, const __CFString *a2, MIDIDeviceRef a3, uint64_t *a4, uint64_t *a5, void *a6, void *a7, const __CFString *a8, char a9)
{
  MIDIEntityRef newEntity = 0;
  uint64_t v13 = a4[1];
  uint64_t v49 = *a4;
  sub_9DB0();
  uint64_t v14 = qword_2C138;
  if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)int v60 = "USBMIDIDriverBase.cpp";
    *(_WORD *)&v60[8] = 1024;
    *(_DWORD *)&v60[10] = 559;
    _os_log_impl(&def_F708, v14, OS_LOG_TYPE_INFO, "%25s:%-5d [+] configureDeviceUsingPortMap(using JackLists)", buf, 0x12u);
  }
  sub_9DB0();
  unint64_t v15 = qword_2C138;
  if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)int v60 = "USBMIDIDriverBase.cpp";
    *(_WORD *)&v60[8] = 1024;
    *(_DWORD *)&v60[10] = 560;
    _os_log_impl(&def_F708, v15, OS_LOG_TYPE_INFO, "%25s:%-5d      Constructing USB MIDI 1.0 entities...", buf, 0x12u);
  }
  uint64_t v48 = v13;
  if (v13 != v49)
  {
    unint64_t v16 = 0;
    unint64_t v17 = (v48 - v49) >> 3;
    if (v17 <= 1) {
      unint64_t v17 = 1;
    }
    unint64_t v51 = v17;
    CFStringRef v52 = a8;
    do
    {
      int v56 = &off_288B0;
      CFTypeRef cf = 0;
      if (v16 >= (a4[1] - *a4) >> 3) {
        sub_104C8();
      }
      uint64_t v18 = *a4 + 8 * v16;
      int v19 = *(unsigned __int8 *)(v18 + 2);
      int v20 = *(unsigned __int8 *)(v18 + 3);
      if (*(unsigned char *)(v18 + 2))
      {
        CFStringRef v21 = sub_C938(a1, *(unsigned __int8 *)(*a6 + 6 * v16 + 4), a8);
        uint64_t v22 = *a6;
        uint64_t v23 = *a5;
        uint64_t v24 = a5[1];
        if (*a5 != v24)
        {
          while (*(unsigned __int8 *)(v23 + 2) != *(unsigned __int8 *)(v22 + 6 * v16 + 3))
          {
            v23 += 6;
            if (v23 == v24) {
              goto LABEL_21;
            }
          }
        }
        if (v23 != v24)
        {
          if (v23)
          {
            int v25 = *(unsigned __int8 *)(v23 + 1);
            *(unsigned char *)(v22 + 6 * v16 + 1) = v25;
            if (v25 == 1)
            {
              sub_9DB0();
              uint64_t v26 = qword_2C138;
              if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
              {
                int v27 = *(unsigned __int8 *)(*a6 + 6 * v16 + 2);
                *(_DWORD *)buf = 136315650;
                *(void *)int v60 = "USBMIDIDriverBase.cpp";
                *(_WORD *)&v60[8] = 1024;
                *(_DWORD *)&v60[10] = 576;
                __int16 v61 = 1024;
                LODWORD(v62) = v27;
                _os_log_impl(&def_F708, v26, OS_LOG_TYPE_INFO, "%25s:%-5d      Found an embedded input at jack ID %d.", buf, 0x18u);
              }
            }
          }
        }
      }
      else
      {
        CFStringRef v21 = 0;
      }
LABEL_21:
      if (v20)
      {
        CFStringRef v28 = sub_C938(a1, *(unsigned __int8 *)(*a7 + 6 * v16 + 4), a8);
        uint64_t v29 = *a7;
        uint64_t v30 = *a5;
        uint64_t v31 = a5[1];
        if (*a5 != v31)
        {
          while (*(unsigned __int8 *)(v30 + 3) != *(unsigned __int8 *)(v29 + 6 * v16 + 2))
          {
            v30 += 6;
            if (v30 == v31) {
              goto LABEL_31;
            }
          }
        }
        if (v30 != v31)
        {
          if (v30)
          {
            int v32 = *(unsigned __int8 *)(v30 + 1);
            *(unsigned char *)(v29 + 6 * v16 + 1) = v32;
            if (v32 == 1)
            {
              sub_9DB0();
              uint64_t v33 = qword_2C138;
              if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
              {
                int v34 = *(unsigned __int8 *)(*a7 + 6 * v16 + 2);
                *(_DWORD *)buf = 136315650;
                *(void *)int v60 = "USBMIDIDriverBase.cpp";
                *(_WORD *)&v60[8] = 1024;
                *(_DWORD *)&v60[10] = 586;
                __int16 v61 = 1024;
                LODWORD(v62) = v34;
                _os_log_impl(&def_F708, v33, OS_LOG_TYPE_INFO, "%25s:%-5d      Found an embedded output at jack ID %d.", buf, 0x18u);
              }
            }
          }
        }
LABEL_31:
        if (v21 && v28 && CFEqual(v21, v28))
        {
          CFRetain(v21);
          CFTypeRef v35 = cf;
          CFTypeRef cf = v21;
          if (v35) {
            CFRelease(v35);
          }
          CFRelease(v21);
          CFRelease(v28);
          CFStringRef v21 = 0;
          CFStringRef v28 = 0;
          goto LABEL_40;
        }
      }
      else
      {
        CFStringRef v28 = 0;
      }
      if ((unint64_t)(v48 - v49) >= 9)
      {
        unint64_t v36 = sub_11204(buf, a2, (v16 + 1));
        CFTypeRef v37 = cf;
        CFTypeRef cf = *(CFTypeRef *)&v60[4];
        *(void *)&v60[4] = v37;
        sub_10700(v36);
      }
LABEL_40:
      if (!cf)
      {
        if (a8)
        {
          CFRetain(a8);
          CFTypeRef v41 = cf;
          CFTypeRef cf = a8;
          if (v41) {
            CFRelease(v41);
          }
        }
        else
        {
          CFTypeRef cf = 0;
        }
      }
      if (a9)
      {
        if (v19
          && v20
          && (int v38 = *(unsigned __int8 *)(*a6 + 6 * v16 + 1), v38 == *(unsigned __int8 *)(*a7 + 6 * v16 + 1)))
        {
          if (v38 == 1)
          {
            sub_9DB0();
            int v39 = qword_2C138;
            Boolean v40 = 1;
            if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)int v60 = "USBMIDIDriverBase.cpp";
              *(_WORD *)&v60[8] = 1024;
              *(_DWORD *)&v60[10] = 611;
              _os_log_impl(&def_F708, v39, OS_LOG_TYPE_INFO, "%25s:%-5d      Creating an embedded entity.", buf, 0x12u);
            }
            goto LABEL_56;
          }
        }
        else if ((v19 != 0) != (v20 != 0))
        {
          __int16 v42 = a7;
          if (v19) {
            __int16 v42 = a6;
          }
          Boolean v40 = *(unsigned char *)(*v42 + 6 * v16 + 1) == 1;
          goto LABEL_56;
        }
      }
      Boolean v40 = 0;
LABEL_56:
      MIDIDeviceAddEntity(a3, (CFStringRef)cf, v40, v19 != 0, v20 != 0, &newEntity);
      if (v21)
      {
        MIDIObjectRef Source = MIDIEntityGetSource(newEntity, 0);
        MIDIObjectSetStringProperty(Source, kMIDIPropertyName, v21);
      }
      if (v28)
      {
        MIDIObjectRef Destination = MIDIEntityGetDestination(newEntity, 0);
        MIDIObjectSetStringProperty(Destination, kMIDIPropertyName, v28);
      }
      if (v16 >= (a4[1] - *a4) >> 3
        || (MIDIObjectSetIntegerProperty(newEntity, @"In Endpoint", *(unsigned __int8 *)(*a4 + 8 * v16 + 2)),
            v16 >= (a4[1] - *a4) >> 3)
        || (MIDIObjectSetIntegerProperty(newEntity, @"Out Endpoint", *(unsigned __int8 *)(*a4 + 8 * v16 + 3)),
            v16 >= (a4[1] - *a4) >> 3))
      {
        sub_104C8();
      }
      MIDIObjectSetIntegerProperty(newEntity, @"Cable", *(unsigned __int8 *)(*a4 + 8 * v16 + 1));
      if (v21) {
        CFRelease(v21);
      }
      if (v28) {
        CFRelease(v28);
      }
      MIDIObjectSetIntegerProperty(a3, @"UMP Enabled", 0);
      sub_10700(&v56);
      ++v16;
      a8 = v52;
    }
    while (v16 != v51);
  }
  sub_9DB0();
  uint64_t v45 = qword_2C138;
  if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
  {
    __int16 v46 = "false";
    *(_DWORD *)buf = 136315650;
    *(void *)int v60 = "USBMIDIDriverBase.cpp";
    if (v48 != v49) {
      __int16 v46 = "true";
    }
    *(_WORD *)&v60[8] = 1024;
    *(_DWORD *)&v60[10] = 637;
    __int16 v61 = 2080;
    int v62 = v46;
    _os_log_impl(&def_F708, v45, OS_LOG_TYPE_INFO, "%25s:%-5d [+] configureDeviceUsingPortMap(using JackLists) = %s", buf, 0x1Cu);
  }
  return v48 != v49;
}

void sub_D1BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  if (a2) {
    sub_45C4(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_D1F8(uint64_t a1, const __CFUUID *a2)
{
}

void sub_D2C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_11180((uint64_t *)va);
  sub_1CEF0(v2);
  _Unwind_Resume(a1);
}

void *sub_D2E0(const void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_3ECC();
  sub_10E20((uint64_t)v11, a4);
  uint64_t v13 = 0;
  unint64_t v9 = operator new(0x30uLL);
  *unint64_t v9 = off_28918;
  v9[1] = a3;
  sub_11048((uint64_t)(v9 + 2), (uint64_t)v11);
  uint64_t v13 = v9;
  sub_4414((uint64_t)v8, a1, a2, (uint64_t)v12);
  sub_4838(v12);
  return sub_11180(v11);
}

void sub_D3D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  sub_4838((uint64_t *)va);
  sub_11180(v6);
  _Unwind_Resume(a1);
}

void sub_D3FC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned int a4@<W3>, void *a5@<X8>)
{
  uint64_t v8 = a2;
  uint64_t v7 = a3;
  unsigned int v6 = a4;
  uint64_t v5 = a1;
  sub_11470(&v5, &v8, &v7, &v6, a5);
}

uint64_t sub_D440(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return 4294956462;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a3 + 88))(a3, a2, a4);
  return 0;
}

uint64_t sub_D494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return 4294956462;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a3 + 96))(a3, a2, a4);
  return 0;
}

void sub_D4E8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(unsigned char *)(a3 + 16) = 0;
  unsigned int v6 = (unsigned __int8 *)(a3 + 16);
  *(_OWORD *)(a3 + 24) = 0u;
  *(_OWORD *)(a3 + 72) = 0u;
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(_OWORD *)(a3 + 40) = 0u;
  *(_OWORD *)(a3 + 56) = 0u;
  *(_OWORD *)(a3 + 88) = 0u;
  *(_OWORD *)(a3 + 104) = 0u;
  uint64_t v7 = sub_60F8(a1);
  uint64_t v8 = sub_7054(a2);
  if (!v7) {
    return;
  }
  uint64_t v9 = v8;
  if (!v8 || (sub_7364(a2) & 1) == 0) {
    return;
  }
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v9 + 136))(v9, a3 + 16);
  sub_9DB0();
  uint64_t v11 = qword_2C138;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)unint64_t v16 = 136315650;
      *(void *)&v16[4] = "USBMIDIDriverBase.cpp";
      *(_WORD *)&v16[12] = 1024;
      *(_DWORD *)&v16[14] = 714;
      __int16 v17 = 1024;
      int v18 = v10;
      CFRange v12 = "%25s:%-5d [!] USBMIDIClassDriver::ProbeDevice() - GetInterfaceNumber() returned error 0x%x";
      uint64_t v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
LABEL_9:
      _os_log_impl(&def_F708, v13, v14, v12, v16, 0x18u);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_INFO))
  {
    int v15 = *v6;
    *(_DWORD *)unint64_t v16 = 136315650;
    *(void *)&v16[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&v16[12] = 1024;
    *(_DWORD *)&v16[14] = 716;
    __int16 v17 = 1024;
    int v18 = v15;
    CFRange v12 = "%25s:%-5d [*] USBMIDIClassDriver::ProbeDevice() - inUSBInterface has interface number %d";
    uint64_t v13 = v11;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    goto LABEL_9;
  }
  sub_9E20(v9, (uint64_t)v16);
  if (*(void *)v16)
  {
    sub_9FA0(v9, *(unsigned __int8 **)v16, (void *)(a3 + 24), (char **)(a3 + 48), (char **)(a3 + 72), (unsigned __int8 **)(a3 + 96));
    *(void *)a3 = a1;
    *(void *)(a3 + 8) = a2;
  }
  if (v19 < 0) {
    operator delete(*(void **)&v16[8]);
  }
}

void sub_D6E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  sub_D71C(v15);
  _Unwind_Resume(a1);
}

void *sub_D71C(void *a1)
{
  uint64_t v2 = (void *)a1[12];
  if (v2)
  {
    a1[13] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[9];
  if (v3)
  {
    a1[10] = v3;
    operator delete(v3);
  }
  CFStringRef v4 = (void *)a1[6];
  if (v4)
  {
    a1[7] = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)a1[3];
  if (v5)
  {
    a1[4] = v5;
    operator delete(v5);
  }
  return a1;
}

BOOL sub_D780(uint64_t a1, uint64_t a2, const __CFString *a3, const __CFString *a4, const __CFString *a5, MIDIDeviceRef a6, uint64_t *a7, uint64_t *a8, void *a9, void *a10)
{
  sub_60F8(a1);
  uint64_t v16 = sub_7054(a2);
  CFStringRef v17 = sub_9BC4(a1, a4);
  CFStringRef v19 = v18;
  __int16 v24 = 0;
  (*(void (**)(uint64_t, __int16 *))(*(void *)v16 + 104))(v16, &v24);
  BOOL v20 = sub_CA28(a1, a3, a6, a7, a8, a9, a10, v19, v24 == 1452);
  if (a4 && v17 && CFStringCompare(v17, a4, 0)) {
    CFRelease(v17);
  }
  if (a5 && v19 && CFStringCompare(v19, a5, 0)) {
    CFRelease(v19);
  }
  return v20;
}

void sub_D8A4(int a1@<W0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = *(void *)a2;
  int v6 = *(unsigned __int8 *)(a2 + 16);
  if (a1) {
    sub_C4C8(v5, v6, (uint64_t *)(a2 + 48), (uint64_t *)(a2 + 72), a3);
  }
  else {
    sub_B5F0(v5, v6, a2 + 96, a3);
  }
}

void sub_D8CC(uint64_t a1, MIDITimeStamp a2, char *a3, int64_t a4, uint64_t a5, MIDIProtocolID a6)
{
  uint64_t v7 = a3;
  if (a6)
  {
    if (*(unsigned char *)(a1 + 187))
    {
      sub_E2A4(a1, a2, a3, a4, 0, a6);
    }
    else
    {
      sub_9DB0();
      unsigned int v71 = qword_2C138;
      if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)evtlist = 136315394;
        *(void *)&evtlist[4] = "USBMIDIDriverBase.cpp";
        *(_WORD *)&evtlist[12] = 1024;
        *(_DWORD *)&evtlist[14] = 766;
        _os_log_impl(&def_F708, v71, OS_LOG_TYPE_ERROR, "%25s:%-5d [!] USBMIDIDriverBase::USBMIDIHandleInput() - protocols newer than USB MIDI 1.0 need USB MIDI 2.0 driver support, which is disabled", evtlist, 0x12u);
      }
    }
    return;
  }
  long long v109 = 0u;
  long long v110 = 0u;
  int v10 = &a3[a4];
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  memset(evtlist, 0, sizeof(evtlist));
  if (*(unsigned char *)(a1 + 187) && *(unsigned char *)(a1 + 490))
  {
    if (a4 < 1)
    {
      MIDIEventListInit((MIDIEventList *)evtlist, kMIDIProtocol_1_0);
      return;
    }
    unint64_t v11 = (unint64_t)a4 >> 2;
    CFRange v12 = (unsigned int *)a3;
    do
    {
      *CFRange v12 = bswap32(*v12);
      ++v12;
    }
    while (v12 < (unsigned int *)v10);
    MIDIEventListInit((MIDIEventList *)evtlist, kMIDIProtocol_1_0);
    if (v11 && a4 >= 1)
    {
      unsigned __int8 v13 = 0;
      while (1)
      {
        if (!v7) {
          return;
        }
        int v89 = v11;
        uint64_t v14 = *(void *)(a1 + 40);
        int v15 = MIDIEventListInit((MIDIEventList *)evtlist, kMIDIProtocol_1_0);
        uint64_t v16 = v7;
        if (v15) {
          break;
        }
LABEL_115:
        unint64_t v69 = v16 - v7;
        if ((v69 >> 2))
        {
          LODWORD(v11) = v89 - (v69 >> 2);
          signed int v70 = *(_DWORD *)(a1 + 12);
          unsigned __int8 v13 = *(_DWORD *)v7 >> 28 >= v70 ? v70 - 1 : *(_DWORD *)v7 >> 28;
          MIDIReceivedEventList(*(_DWORD *)(*(void *)(a1 + 16) + 4 * v13), (const MIDIEventList *)evtlist);
          if (v11)
          {
            v7 += v69 & 0x3FFFFFFFCLL;
            if (v7 < v10) {
              continue;
            }
          }
        }
        return;
      }
      CFStringRef v17 = v15;
      CFStringRef v18 = (__int16 *)(v14 + 6 * v13);
      unint64_t v19 = (unint64_t)*(unsigned int *)v7 >> 28;
      BOOL v20 = v18 + 2;
      unint64_t v90 = ((unint64_t)(HIBYTE(*(_DWORD *)v7) >> 4) << 24) | 0x30000000;
      uint64_t v16 = v7;
      while (1)
      {
        unint64_t v21 = *(unsigned int *)v16;
        if (v19 != v21 >> 28 || (char *)&v110 + 4 - ((char *)v17 + 4 * v17->wordCount) < 8) {
          goto LABEL_115;
        }
        unsigned int v23 = BYTE3(v21) & 0xF;
        if (v23 >= 2) {
          break;
        }
LABEL_83:
        v16 += 4;
        if (v16 >= v10) {
          goto LABEL_115;
        }
      }
      char v24 = BYTE2(*(_DWORD *)v16);
      if (v23 - 6 < 2)
      {
        uint64_t v25 = qword_23A78[(v21 >> 24) & 0xF];
        if (BYTE2(v21) == 240)
        {
          uint64_t v26 = v21 & 0x7F00;
          if (v25 == 2) {
            uint64_t v26 = 0;
          }
          unint64_t v27 = v26 & 0xFFFFFFFFFF00FFFFLL | ((unint64_t)(v25 - 2) << 16) | v90;
          goto LABEL_50;
        }
LABEL_32:
        uint64_t v28 = v25 - 1;
        uint64_t v29 = *v20;
        if (!*v20 || *(unsigned char *)v18)
        {
          unsigned int v47 = WORD1(v21);
          char v48 = BYTE1(*(_DWORD *)v16);
          if (v28 == 1) {
            char v48 = 0;
          }
          else {
            char v24 = v47;
          }
          if (!v28)
          {
            char v24 = 0;
            char v48 = 0;
          }
          unint64_t v49 = (v28 << 16) & 0xFF0000 | ((unint64_t)(v24 & 0x7F) << 8) | v48 & 0x7F | v90 | 0x300000;
        }
        else
        {
          char v95 = 0;
          int v94 = 0;
          unint64_t v30 = v28 + v29;
          if (v30)
          {
            uint64_t v31 = 0;
            __int16 v32 = 0;
            unsigned int v33 = v21 >> 8;
            do
            {
              if ((int)v29 <= v32)
              {
                if (v30 - v31 == 2) {
                  char v34 = v24;
                }
                else {
                  char v34 = v33;
                }
              }
              else
              {
                char v34 = *((unsigned char *)v18 + v31);
              }
              *((unsigned char *)&v94 + v31) = v34;
              uint64_t v31 = ++v32;
            }
            while (v30 > v32);
            char v35 = v94;
            char v36 = BYTE1(v94);
            char v37 = BYTE2(v94);
            char v38 = HIBYTE(v94);
            char v39 = v95;
          }
          else
          {
            char v39 = 0;
            char v38 = 0;
            char v37 = 0;
            char v36 = 0;
            char v35 = 0;
          }
          uint64_t v50 = v37 & 0x7F;
          unint64_t v51 = (unint64_t)(v35 & 0x7F) << 8;
          if (!v30) {
            unint64_t v51 = 0;
          }
          uint64_t v52 = v36 & 0x7F;
          if (v30 <= 1) {
            uint64_t v52 = 0;
          }
          uint64_t v53 = v50 << 56;
          if (v30 <= 2) {
            uint64_t v53 = 0;
          }
          unint64_t v54 = (unint64_t)(v38 & 0x7F) << 48;
          if (v30 <= 3) {
            unint64_t v54 = 0;
          }
          unint64_t v55 = (unint64_t)(v39 & 0x7F) << 40;
          if (v30 <= 4) {
            unint64_t v55 = 0;
          }
          unint64_t v49 = (v30 << 16) & 0xCF0000 | (v19 << 24) | 0x30300000u | v55 | v54 | v52 | v53 | v51;
        }
        *(void *)words = v49;
        bzero(v18, 4uLL);
        __int16 *v20 = 0;
LABEL_81:
        int v56 = MIDIEventListAdd((MIDIEventList *)evtlist, 0x200uLL, v17, a2, 2uLL, words);
        if (!v56) {
          goto LABEL_115;
        }
        CFStringRef v17 = v56;
        bzero(v18, 4uLL);
        __int16 *v20 = 0;
        goto LABEL_83;
      }
      if (v23 == 5)
      {
        if (BYTE2(v21) == 240 || BYTE2(v21) == 247)
        {
          if (BYTE2(v21) == 247)
          {
            uint64_t v25 = qword_23A78[(v21 >> 24) & 0xF];
            goto LABEL_32;
          }
LABEL_44:
          unint64_t v40 = qword_23A78[(v21 >> 24) & 0xF] - 1;
          uint64_t v41 = v21 & 0x7F;
          uint64_t v42 = (v40 << 16) & 0xEF0000;
          uint64_t v43 = v21 & 0x7F00;
          if (!v40) {
            uint64_t v43 = 0;
          }
          if (v40 >= 2) {
            uint64_t v44 = v41;
          }
          else {
            uint64_t v44 = 0;
          }
          unint64_t v27 = v42 | (v19 << 24) | 0x30100000u | v43 | v44;
LABEL_50:
          *(void *)words = v27;
          goto LABEL_81;
        }
      }
      else if (BYTE2(v21) == 240)
      {
        goto LABEL_44;
      }
      if ((~v21 & 0xF000000) == 0 && ((~v21 & 0xF80000) != 0 || (v21 & 0xFB0000) == 0xF90000))
      {
        uint64_t v57 = *v20;
        __int16 *v20 = v57 + 1;
        *((unsigned char *)v18 + v57) = v24;
        if (!sub_10840((unsigned __int8 *)v18)) {
          goto LABEL_83;
        }
        int v58 = sub_107C4((unsigned __int8 *)v18);
        if (!v58) {
          goto LABEL_83;
        }
        if (v58 == 4)
        {
          *(void *)words = ((unint64_t)*(unsigned int *)v16 >> 4) & 0xF000000 | ((unint64_t)(*(unsigned char *)v18 & 0x7F) << 8) | *((unsigned char *)v18 + 1) & 0x7F | 0x30220000;
          unsigned int v59 = v17;
          MIDITimeStamp v60 = a2;
          ByteCount v61 = 2;
          goto LABEL_97;
        }
        unsigned int v65 = *(unsigned __int8 *)v18;
        BOOL v67 = (v65 + 15) < 8u && ((0xA7u >> (v65 + 15)) & 1) != 0 || v65 > 0xF9 && v65 != 253;
        unint64_t v64 = 0;
        int v68 = 1 << (v58 & 0xF);
        if ((v68 & 0x7F00) == 0 && (v68 & 0xC) == 0)
        {
          if ((v68 & 0x8020) == 0) {
            goto LABEL_96;
          }
          if (!v67)
          {
            unint64_t v64 = 0;
            goto LABEL_96;
          }
        }
        unint64_t v64 = (unint64_t)(v18[1] & 0x7F) << 24;
        goto LABEL_96;
      }
      BOOL v46 = (BYTE2(v21) + 15) < 8u && ((0xA7u >> (BYTE2(v21) + 15)) & 1) != 0
         || BYTE2(v21) > 0xF9u && BYTE2(v21) != 253;
      unsigned int v62 = 0;
      int v63 = 1 << v23;
      if ((v63 & 0x7F00) == 0 && (v63 & 0xC) == 0)
      {
        if ((v63 & 0x8020) == 0)
        {
LABEL_95:
          unint64_t v64 = v62;
LABEL_96:
          *(void *)words = v64;
          uint64_t v93 = 0;
          ByteCount v61 = byte_23AF8[v64 >> 28];
          unsigned int v59 = v17;
          MIDITimeStamp v60 = a2;
LABEL_97:
          CFStringRef v17 = MIDIEventListAdd((MIDIEventList *)evtlist, 0x200uLL, v59, v60, v61, words);
          if (!v17) {
            goto LABEL_115;
          }
          goto LABEL_83;
        }
        if (!v46)
        {
          unsigned int v62 = 0;
          goto LABEL_95;
        }
      }
      unsigned int v62 = (*(_DWORD *)v16 & 0x7F) << 24;
      goto LABEL_95;
    }
  }
  else
  {
    int v72 = MIDIPacketListInit((MIDIPacketList *)evtlist);
    if (a4 >= 1)
    {
      unsigned int v73 = v72;
      uint64_t v74 = 0;
      char v75 = 0;
      unsigned int v91 = 0;
      do
      {
        int v76 = v10;
        unsigned int v77 = *v7;
        unsigned int v78 = v77 & 0xF;
        if (v78 >= 2)
        {
          int v80 = *(_DWORD *)(a1 + 12);
          if (v80 <= (int)(v77 >> 4)) {
            unsigned int v81 = v80 - 1;
          }
          else {
            unsigned int v81 = v77 >> 4;
          }
          if (v75 && v81 != v91)
          {
            MIDIReceived(*(_DWORD *)(*(void *)(a1 + 16) + 4 * (int)v91), (const MIDIPacketList *)evtlist);
            unsigned int v73 = MIDIPacketListInit((MIDIPacketList *)evtlist);
            uint64_t v74 = 0;
          }
          if ((v81 & 0x80000000) == 0)
          {
            int v82 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 2 <= (unint64_t)v81 ? v91 : v81;
            unsigned int v91 = v82;
            if ((uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 2 > (unint64_t)v81) {
              char v75 = 1;
            }
          }
          unsigned int v83 = 1;
          switch(v78)
          {
            case 2u:
            case 0xCu:
            case 0xDu:
              unsigned int v83 = 2;
              goto LABEL_152;
            case 3u:
            case 8u:
            case 9u:
            case 0xAu:
            case 0xBu:
            case 0xEu:
              goto LABEL_141;
            case 4u:
              uint64_t v79 = 1;
              if (v74)
              {
                unsigned int v83 = 3;
LABEL_147:
                unsigned int v84 = &v73->data[v73->length];
                if (&v84[v83] <= (Byte *)&v111)
                {
                  int v10 = v76;
                  memcpy(v84, v7 + 1, v83);
                  v73->length += v83;
                  goto LABEL_159;
                }
                if (v75) {
                  MIDIReceived(*(_DWORD *)(*(void *)(a1 + 16) + 4 * (int)v91), (const MIDIPacketList *)evtlist);
                }
                unsigned int v73 = MIDIPacketListInit((MIDIPacketList *)evtlist);
                uint64_t v74 = 0;
              }
              else
              {
                uint64_t v74 = 1;
LABEL_141:
                unsigned int v83 = 3;
              }
LABEL_152:
              unsigned __int8 v85 = MIDIPacketListAdd((MIDIPacketList *)evtlist, 0x200uLL, v73, a2, v83, (const Byte *)v7 + 1);
              if (v85)
              {
                unsigned int v73 = v85;
                int v10 = v76;
                uint64_t v79 = v74;
                goto LABEL_159;
              }
              do
              {
                if (v75) {
                  MIDIReceived(*(_DWORD *)(*(void *)(a1 + 16) + 4 * (int)v91), (const MIDIPacketList *)evtlist);
                }
                uint64_t v86 = MIDIPacketListInit((MIDIPacketList *)evtlist);
                int v87 = MIDIPacketListAdd((MIDIPacketList *)evtlist, 0x200uLL, v86, a2, v83, (const Byte *)v7 + 1);
              }
              while (!v87);
              unsigned int v73 = v87;
              uint64_t v79 = 0;
              break;
            case 5u:
              if (v7[1] == 247) {
                goto LABEL_146;
              }
              goto LABEL_152;
            case 6u:
            case 7u:
LABEL_146:
              uint64_t v79 = 0;
              unsigned int v83 = v78 - 4;
              if (v74) {
                goto LABEL_147;
              }
              uint64_t v74 = 0;
              goto LABEL_152;
            case 0xFu:
              goto LABEL_152;
            default:
              goto LABEL_127;
          }
        }
        else
        {
LABEL_127:
          uint64_t v79 = v74;
        }
        int v10 = v76;
LABEL_159:
        v7 += 4;
        uint64_t v74 = v79;
      }
      while (v7 < v10);
      if (*(_DWORD *)evtlist) {
        BOOL v88 = v75 == 0;
      }
      else {
        BOOL v88 = 1;
      }
      if (!v88) {
        MIDIReceived(*(_DWORD *)(*(void *)(a1 + 16) + 4 * (int)v91), (const MIDIPacketList *)evtlist);
      }
    }
  }
}

uint64_t sub_E2A4(uint64_t result, MIDITimeStamp a2, char *a3, unint64_t a4, int a5, MIDIProtocolID a6)
{
  if (a6 <= kMIDIProtocol_2_0)
  {
    v22[10] = v6;
    v22[11] = v7;
    unint64_t v8 = a4 >> 2;
    memset(v21, 0, sizeof(v21));
    if ((a4 >> 2))
    {
      int v10 = a3;
      uint64_t v12 = result;
      unsigned __int8 v13 = &a3[a4];
      do
      {
        if (!v10) {
          break;
        }
        if (v13 <= v10) {
          break;
        }
        __n128 result = sub_108BC(a6, a2, v10, (v13 - v10) >> 2, (MIDIEventList *)v21, (unint64_t)v22);
        if (!result) {
          break;
        }
        unsigned int v14 = result;
        int v15 = *(_DWORD *)v10 >> 28;
        int v16 = HIBYTE(*(_DWORD *)v10) & 0xF;
        if (v15 == 15) {
          int v16 = 255;
        }
        if (v15) {
          unsigned int v17 = v16;
        }
        else {
          unsigned int v17 = 255;
        }
        int v18 = *(unsigned __int8 *)(v12 + 189);
        unsigned int v19 = *(_DWORD *)(v12 + 12) - v18;
        if (v19 <= v17) {
          unsigned int v20 = v19 - 1;
        }
        else {
          unsigned int v20 = v17;
        }
        if (v17 != 255 && v20 != 255)
        {
          __n128 result = MIDIReceivedEventList(*(_DWORD *)(*(void *)(v12 + 16) + 4 * v20), (const MIDIEventList *)v21);
          int v18 = *(unsigned __int8 *)(v12 + 189);
        }
        if (v18) {
          __n128 result = MIDIReceivedEventList(*(_DWORD *)(*(void *)(v12 + 24) - 4), (const MIDIEventList *)v21);
        }
        if (&v10[4 * v14] <= v13) {
          v10 += 4 * v14;
        }
        else {
          int v10 = v13;
        }
        LODWORD(v8) = v8 - v14;
      }
      while (v8);
    }
  }
  return result;
}

unsigned char *sub_E410(uint64_t a1, uint64_t *a2, unsigned char *a3, uint64_t a4)
{
  if (a2[2]) {
    int v6 = *(unsigned __int8 *)(a2[1] + 120);
  }
  else {
    int v6 = 0;
  }
  unint64_t v7 = (unint64_t)&a3[a4 - 4];
  unint64_t v8 = a3;
LABEL_5:
  if (a2[2])
  {
    uint64_t v9 = a2;
    while (1)
    {
      uint64_t v9 = (uint64_t *)v9[1];
      if (v9 == a2) {
        break;
      }
      if (*((unsigned __int8 *)v9 + 120) == v6)
      {
        if (v9[4]) {
          int v10 = (uint64_t *)v9[4];
        }
        else {
          int v10 = v9 + 5;
        }
        unint64_t v11 = (char *)v10 + v9[14];
        uint64_t v12 = (char *)v10 + *((int *)v9 + 6);
        unsigned int v13 = v12 - v11;
        if ((int)v12 - (int)v11 >= 1 && (unint64_t)v8 <= v7)
        {
          int v15 = 16 * *((unsigned __int8 *)v9 + 108);
          int v16 = (char *)v10 + v9[14];
          while (1)
          {
            unsigned int v18 = *v16++;
            unsigned int v17 = v18;
            switch(v18 >> 4)
            {
              case 8u:
              case 9u:
              case 0xAu:
              case 0xBu:
              case 0xEu:
                *unint64_t v8 = v15 | (v17 >> 4);
                v8[1] = v17;
LABEL_26:
                v8[2] = v11[1];
                int v16 = v11 + 3;
                v8[3] = v11[2];
                goto LABEL_37;
              case 0xCu:
              case 0xDu:
                int v22 = v15 | (v17 >> 4);
LABEL_30:
                *unint64_t v8 = v22;
                v8[1] = v17;
                int v16 = v11 + 2;
                v8[2] = v11[1];
                goto LABEL_31;
              case 0xFu:
                switch(v17)
                {
                  case 0xF0u:
                    goto LABEL_20;
                  case 0xF1u:
                  case 0xF3u:
                    LOBYTE(v22) = v15 | 2;
                    goto LABEL_30;
                  case 0xF2u:
                    *unint64_t v8 = v15 | 3;
                    v8[1] = -14;
                    goto LABEL_26;
                  case 0xF6u:
                  case 0xF7u:
                    char v23 = v15 | 5;
                    goto LABEL_36;
                  case 0xF8u:
                  case 0xFAu:
                  case 0xFBu:
                  case 0xFCu:
                  case 0xFEu:
                  case 0xFFu:
                    goto LABEL_35;
                  default:
                    if (v16 >= v12) {
                      goto LABEL_38;
                    }
                    int64_t v26 = v12 - 1 - v11;
                    break;
                }
                break;
              default:
LABEL_20:
                if (v13 <= 2 && (v13 == 1 || *v16 != 247))
                {
LABEL_35:
                  char v23 = v15 | 0xF;
LABEL_36:
                  *unint64_t v8 = v23;
                  v8[1] = v17;
                  *((_WORD *)v8 + 1) = 0;
                }
                else
                {
                  v8[1] = v17;
                  int v19 = v11[1];
                  v8[2] = v19;
                  if (v19 == 247)
                  {
                    int v16 = v11 + 2;
                    *unint64_t v8 = v15 | 6;
LABEL_31:
                    v8[3] = 0;
                  }
                  else
                  {
                    int v16 = v11 + 3;
                    int v20 = v11[2];
                    v8[3] = v20;
                    if (v20 == 247) {
                      char v21 = v15 | 7;
                    }
                    else {
                      char v21 = v15 | 4;
                    }
                    *unint64_t v8 = v21;
                  }
                }
LABEL_37:
                v8 += 4;
                goto LABEL_38;
            }
            while ((*v16 & 0x80000000) == 0)
            {
              ++v16;
              if (!--v26)
              {
                int v16 = v12;
                break;
              }
            }
LABEL_38:
            if (v16 >= v12)
            {
              char v24 = (void *)v9[4];
              if (v24) {
                free(v24);
              }
              uint64_t v25 = *v9;
              *(void *)(v25 + 8) = v9[1];
              *(void *)v9[1] = v25;
              --a2[2];
              operator delete(v9);
              if (!a2[2]) {
                break;
              }
            }
            else
            {
              v9[14] = v16 - (char *)v10;
            }
            unsigned int v13 = v12 - v16;
            if ((int)v12 - (int)v16 >= 1)
            {
              unint64_t v11 = v16;
              if ((unint64_t)v8 <= v7) {
                continue;
              }
            }
            break;
          }
        }
        if ((unint64_t)v8 <= v7) {
          goto LABEL_5;
        }
        return (unsigned char *)(v8 - a3);
      }
    }
  }
  return (unsigned char *)(v8 - a3);
}

unsigned char *sub_E778(uint64_t a1, uint64_t *a2, unsigned char *a3, uint64_t a4, int a5)
{
  int v5 = a5;
  int v6 = a3;
  unint64_t v7 = a2;
  uint64_t v8 = *a2;
  if (*a2 == a2[1]) {
    int v9 = 0;
  }
  else {
    int v9 = *(unsigned __int8 *)(v8 + 292);
  }
  unint64_t v10 = (unint64_t)&a3[a4];
  int v79 = v9;
  unint64_t v87 = (unint64_t)&a3[a4];
  do
  {
    while (1)
    {
      if (v8 == v7[1]) {
        return (unsigned char *)(v6 - a3);
      }
      if (*(unsigned __int8 *)(v8 + 292) != v9) {
        break;
      }
      uint64_t v11 = sub_10A5C(v8);
      uint64_t v12 = *(int *)(v8 + 288);
      int v13 = *(_DWORD *)(sub_10A5C(v8) + 8);
      int v14 = *(_DWORD *)(v8 + 288);
      unsigned int v15 = v13 - v14;
      if (v13 == v14) {
        break;
      }
      unsigned int v16 = 0;
      uint64_t v17 = v11 + 4 * v12 + 12;
      unint64_t v18 = v17 + 4 * v15;
      uint64_t v83 = v8;
      unsigned int v82 = v13 - v14;
      unint64_t v80 = v18;
      uint64_t v81 = v17;
      while (1)
      {
        int v19 = (unsigned int *)(v17 + 4 * v16);
        if (v5) {
          break;
        }
        if (((v18 - (void)v19) & 0x3FFFFFFFCLL) == 0)
        {
          LODWORD(v26) = 0;
          goto LABEL_142;
        }
        LODWORD(v26) = 0;
        if (v6 && (unint64_t)v6 < v10)
        {
          unsigned int v85 = v16;
          unsigned int v27 = 0;
          int v28 = 0;
          uint64_t v29 = (char *)v19 + ((v18 - (void)v19) & 0x3FFFFFFFCLL);
          unsigned int v84 = (char *)(v17 + 4 * v16);
          uint64_t v86 = v29;
          while (1)
          {
            if ((int)((unint64_t)(v29 - (char *)v19) >> 2) < 1)
            {
LABEL_140:
              unint64_t v67 = (char *)v19 - v84;
              int v19 = (unsigned int *)v84;
              unint64_t v26 = v67 >> 2;
              goto LABEL_141;
            }
            unsigned int v30 = *v19;
            unsigned int v31 = *v19 >> 28;
            switch(v31)
            {
              case 1u:
                if (BYTE2(v30) - 241 <= 0xE)
                {
                  if (((1 << (BYTE2(v30) + 15)) & 0x6EA0) != 0)
                  {
                    int v34 = (v30 >> 20) & 0xF0;
                    int v28 = v34 | 5;
                    *int v6 = v34 | 5;
                    v6[1] = *((_WORD *)v19 + 1);
                    unsigned int v27 = 1;
LABEL_48:
                    unsigned char v6[2] = 0;
                    goto LABEL_124;
                  }
                  if (((1 << (BYTE2(v30) + 15)) & 5) != 0)
                  {
                    unsigned int v27 = 2;
LABEL_121:
                    int v28 = v27 | (v30 >> 20) & 0xF0;
                    *int v6 = v27 | (v30 >> 20) & 0xF0;
                    v6[1] = *((_WORD *)v19 + 1);
                    goto LABEL_122;
                  }
                  if (BYTE2(v30) == 242)
                  {
                    unsigned int v27 = 3;
                    goto LABEL_121;
                  }
                }
                break;
              case 2u:
                int v35 = (v30 >> 20) & 0xF;
                int v28 = (v30 >> 20);
                if (v35 != 15)
                {
                  if (((1 << v35) & 0x3000) != 0) {
                    unsigned int v27 = 2;
                  }
                  if (((1 << v35) & 0x4F00) != 0) {
                    unsigned int v27 = 3;
                  }
                }
                break;
              case 3u:
                unsigned int v32 = (v30 >> 20) & 0xF;
                uint64_t v88 = 0;
                unsigned int v27 = HIWORD(v30) & 0xF;
                if (v32 < 2) {
                  ++v27;
                }
                if (v32) {
                  BOOL v33 = v32 == 3;
                }
                else {
                  BOOL v33 = 1;
                }
                if (v33) {
                  ++v27;
                }
                if (v27 > 8)
                {
                  unsigned int v27 = 0;
                  goto LABEL_73;
                }
                if (v32 == 3 || (LODWORD(v36) = v27, !v32))
                {
                  uint64_t v36 = (int)v27 - 1;
                  *((unsigned char *)&v88 + v36) = -9;
                }
                if (v32 > 1)
                {
                  char v37 = (char *)&v88;
                }
                else
                {
                  LOBYTE(v88) = -16;
                  LODWORD(v36) = v36 - 1;
                  char v37 = (char *)&v88 + 1;
                }
                if ((int)v36 >= 1)
                {
                  char v38 = 0;
                  uint64_t v39 = 0;
                  do
                  {
                    if (v39 <= 5)
                    {
                      if (v39 >= 2) {
                        uint64_t v41 = v19 + 1;
                      }
                      else {
                        uint64_t v41 = v19;
                      }
                      if (v39 >= 2) {
                        char v42 = 40;
                      }
                      else {
                        char v42 = 8;
                      }
                      char v40 = *v41 >> (v42 + v38);
                    }
                    else
                    {
                      char v40 = 0;
                    }
                    v37[v39] = v40;
                    v38 -= 8;
                    ++v39;
                  }
                  while (v36 != v39);
                }
                if (v27)
                {
                  if (*((unsigned __int8 *)&v88 + v27 - 1) == 247)
                  {
                    if (v27 >= 4)
                    {
                      unsigned int v43 = v27 / 3;
                      if (-1431655765 * v27 > 0x55555555) {
                        ++v43;
                      }
                    }
                    else
                    {
                      unsigned int v43 = 1;
                    }
                  }
                  else if (v27 >= 3)
                  {
                    unsigned int v43 = v27 / 3 + v27 % 3;
                  }
                  else
                  {
                    unsigned int v43 = v27;
                  }
                }
                else
                {
LABEL_73:
                  unsigned int v43 = 0;
                }
                if (v43 <= (v87 - (unint64_t)v6) >> 2)
                {
                  int v44 = 0;
                  while (v27 != 1)
                  {
                    if (!v27)
                    {
                      uint64_t v64 = byte_23AF8[(unint64_t)*v19 >> 28];
                      uint64_t v29 = v86;
                      goto LABEL_128;
                    }
                    BOOL v45 = v32 != 1;
                    unsigned int v46 = v27 - 3;
                    if (v27 != 3) {
                      BOOL v45 = 1;
                    }
                    if (v27 <= 3 && v45)
                    {
LABEL_95:
                      if (v32 && v32 != 3)
                      {
                        unsigned int v52 = *v19;
                        unint64_t v51 = v6;
                        unsigned int v46 = v27;
                        goto LABEL_110;
                      }
                      unint64_t v51 = v6;
                      unsigned int v46 = v27;
LABEL_98:
                      unsigned int v54 = *v19 >> 28;
                      if (v54) {
                        BOOL v55 = v54 == 15;
                      }
                      else {
                        BOOL v55 = 1;
                      }
                      int v56 = HIBYTE(*v19) & 0xF;
                      if (v55) {
                        LOBYTE(v56) = -1;
                      }
                      int v57 = 16 * (v56 & 0xF);
                      int v28 = v57 | (v46 + 4);
                      *unint64_t v51 = v57 | (v46 + 4);
                      uint64_t v58 = v46;
                      memcpy(v51 + 1, (char *)&v88 + v44, v46);
                      unsigned int v27 = 0;
                      int v6 = &v51[v46 + 1];
                      if (v46 <= 2)
                      {
                        if ((int)(3 - v46) >= 1) {
                          int v59 = 1;
                        }
                        else {
                          int v59 = 3 - v46;
                        }
                        uint64_t v60 = 3 - v46 - v59;
                        bzero(v6, v60 + 1);
                        unsigned int v27 = 0;
                        int v6 = &v51[v58 + 2 + v60];
                      }
                    }
                    else
                    {
                      unsigned int v47 = *v19 >> 28;
                      if (v47) {
                        BOOL v48 = v47 == 15;
                      }
                      else {
                        BOOL v48 = 1;
                      }
                      int v49 = HIBYTE(*v19) & 0xF;
                      if (v48) {
                        LOBYTE(v49) = -1;
                      }
                      int v28 = (16 * (v49 & 0xF)) | 4;
                      *int v6 = (16 * (v49 & 0xF)) | 4;
                      uint64_t v50 = (char *)&v88 + v44;
                      v6[1] = *v50;
                      unsigned char v6[2] = v50[1];
                      v44 += 3;
                      unint64_t v51 = v6 + 4;
                      v6[3] = v50[2];
                      LODWORD(v50) = v27 - 4;
                      v6 += 4;
                      v27 -= 3;
                      if (v50 <= 2)
                      {
                        unsigned int v52 = *v19;
                        if (*v19 >> 28 == 3) {
                          int v53 = (*v19 >> 20) & 0xF;
                        }
                        else {
                          int v53 = -1;
                        }
                        if (!v53 || v53 == 3) {
                          goto LABEL_98;
                        }
LABEL_110:
                        if (v52 >> 28) {
                          BOOL v61 = v52 >> 28 == 15;
                        }
                        else {
                          BOOL v61 = 1;
                        }
                        int v62 = HIBYTE(v52) & 0xF;
                        if (v61) {
                          LOBYTE(v62) = -1;
                        }
                        int v28 = (16 * (v62 & 0xF)) | 0xF;
                        *unint64_t v51 = (16 * (v62 & 0xF)) | 0xF;
                        char v63 = *((unsigned char *)&v88 + v44++);
                        v51[1] = v63;
                        *((_WORD *)v51 + 1) = 0;
                        int v6 = v51 + 4;
                        unsigned int v27 = v46 - 1;
                      }
                    }
                  }
                  unsigned int v52 = *v19;
                  if ((*v19 & 0xF0F00000) != 0x30300000)
                  {
                    unsigned int v46 = 1;
                    unint64_t v51 = v6;
                    goto LABEL_110;
                  }
                  goto LABEL_95;
                }
                unint64_t v69 = (char *)v19 - v84;
                int v19 = (unsigned int *)v84;
                unint64_t v26 = v69 >> 2;
LABEL_141:
                int v5 = a5;
                int v9 = v79;
                unint64_t v7 = a2;
                uint64_t v8 = v83;
                unint64_t v10 = v87;
                unsigned int v16 = v85;
                unsigned int v15 = v82;
                unint64_t v18 = v80;
                uint64_t v17 = v81;
                goto LABEL_142;
            }
            if (!v28) {
              goto LABEL_127;
            }
            *int v6 = v28;
            v6[1] = *((_WORD *)v19 + 1);
            if (v27 <= 1) {
              goto LABEL_48;
            }
LABEL_122:
            unsigned char v6[2] = BYTE1(*v19);
            if (v27 > 2)
            {
              v6[3] = *v19;
              goto LABEL_126;
            }
            unsigned int v27 = 2;
LABEL_124:
            v6[3] = 0;
LABEL_126:
            v6 += 4;
LABEL_127:
            uint64_t v64 = byte_23AF8[(unint64_t)*v19 >> 28];
LABEL_128:
            v19 += v64;
            if ((unint64_t)v6 >= v87) {
              goto LABEL_140;
            }
          }
        }
LABEL_142:
        int v68 = &v19[v26];
        if ((unint64_t)v68 >= v18) {
          goto LABEL_147;
        }
        v16 += v26;
        if (v10 - (unint64_t)v6 < 4
                                        * (unint64_t)byte_23AF8[(unint64_t)*v68 >> 28])
          goto LABEL_9;
LABEL_144:
        if (v16 >= v15) {
          goto LABEL_9;
        }
      }
      if (v10 <= (unint64_t)v6)
      {
        LODWORD(v65) = 0;
      }
      else
      {
        unint64_t v20 = (v18 - (unint64_t)v19) >> 2;
        char v21 = v6;
        for (uint64_t i = (unsigned int *)(v17 + 4 * v16); (int)v20 >= 1; v20 = (v18 - (unint64_t)i) >> 2)
        {
          unint64_t v23 = byte_23AF8[(unint64_t)*i >> 28];
          if (v23 > (uint64_t)(v10 - (void)v21) >> 2) {
            break;
          }
          if (byte_23AF8[(unint64_t)*i >> 28])
          {
            char v24 = &i[v23];
            do
            {
              int v25 = *i++;
              *(_DWORD *)char v21 = v25;
              v21 += 4;
            }
            while (i < v24);
          }
        }
        unint64_t v65 = (unint64_t)(v21 - v6) >> 2;
      }
      unsigned int v66 = &v19[(int)v65];
      v6 += 4 * (int)v65;
      if ((unint64_t)v66 < v18)
      {
        v16 += v65;
        if (byte_23AF8[(unint64_t)*v66 >> 28] > (unint64_t)((uint64_t)(v10 - (void)v6) >> 2)) {
          goto LABEL_9;
        }
        goto LABEL_144;
      }
LABEL_147:
      sub_10B7C((uint64_t)&v88, v8 + 296, v7[1], v8);
      uint64_t v71 = v70;
      for (uint64_t j = v7[1]; j != v71; uint64_t j = sub_10B08(j - 296))
        ;
      v7[1] = v71;
    }
    unsigned int v16 = 0;
LABEL_9:
    v8 += 296;
  }
  while (!v16);
  uint64_t v73 = *v7;
  uint64_t v74 = v7[1];
  while (v73 != v74)
  {
    if (*(unsigned __int8 *)(v73 + 292) == v9)
    {
      if (v73 != v74) {
        *(_DWORD *)(v73 + 288) += v16;
      }
      return (unsigned char *)(v6 - a3);
    }
    v73 += 296;
  }
  return (unsigned char *)(v6 - a3);
}

uint64_t sub_EF18(int a1, MIDIObjectRef obj)
{
  CFStringRef v6 = 0;
  CFStringRef str = 0;
  CFStringRef v5 = 0;
  if (!obj) {
    return 0;
  }
  MIDIObjectGetStringProperty(obj, kMIDIPropertyName, &str);
  if (str) {
    uint64_t v3 = CFEqual(str, @"USB MIDI Device") != 0;
  }
  else {
    uint64_t v3 = 0;
  }
  MIDIObjectGetStringProperty(obj, kMIDIPropertyModel, &v6);
  if (v6)
  {
    if (CFEqual(v6, @"USB MIDI Device")) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = v3;
    }
  }
  MIDIObjectGetStringProperty(obj, kMIDIPropertyManufacturer, &v5);
  if (v5)
  {
    if (CFEqual(v5, @"Generic")) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = v3;
    }
  }
  if (str) {
    CFRelease(str);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v5) {
    CFRelease(v5);
  }
  return v3;
}

BOOL sub_F020(int a1, MIDIDeviceRef device)
{
  CFStringRef str = 0;
  ItemCount NumberOfEntities = MIDIDeviceGetNumberOfEntities(device);
  if (NumberOfEntities)
  {
    ItemCount v4 = NumberOfEntities;
    ItemCount v5 = 0;
    BOOL v6 = 1;
    do
    {
      MIDIObjectRef Entity = MIDIDeviceGetEntity(device, v5);
      if (Entity)
      {
        MIDIObjectGetStringProperty(Entity, kMIDIPropertyName, &str);
        if (str)
        {
          int v8 = CFEqual(str, @"USB MIDI Device");
          CFStringRef v9 = str;
          if (v8) {
            goto LABEL_10;
          }
          if (str)
          {
            CFRelease(str);
            CFStringRef str = 0;
          }
        }
      }
      BOOL v6 = ++v5 < v4;
    }
    while (v4 != v5);
    BOOL v6 = 0;
    CFStringRef v9 = str;
LABEL_10:
    if (v9) {
      CFRelease(v9);
    }
  }
  else
  {
    return 0;
  }
  return v6;
}

uint64_t sub_F0FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v8 = sub_EF18(a1, a2);
  if ((v8 & 1) != 0 || (uint64_t result = sub_F020(v8, a2), result))
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 200);
    return v10(a1, a3, a4, a2);
  }
  return result;
}

uint64_t sub_F194()
{
  return 0;
}

uint64_t sub_F19C()
{
  return 0;
}

uint64_t sub_F1A4()
{
  return 0;
}

uint64_t sub_F1AC()
{
  return 0;
}

uint64_t sub_F1B4()
{
  return 0;
}

uint64_t sub_F1BC()
{
  return 0;
}

uint64_t sub_F1C4()
{
  return 0;
}

void *sub_F1CC(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_5968();
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

void *sub_F280(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAAABLL) {
    sub_4A5C();
  }
  return operator new(6 * a2);
}

void *sub_F2C8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556) {
    sub_4A5C();
  }
  return operator new(12 * a2);
}

uint64_t sub_F310(uint64_t result, unint64_t a2, uint64_t a3, char a4)
{
  unint64_t v9 = result;
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
          uint64_t v11 = a2 - v10;
          unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2 - v10) >> 2);
          if (v5 || !v4)
          {
            switch(v12)
            {
              case 0uLL:
              case 1uLL:
                return result;
              case 2uLL:
                if (*(unsigned __int8 *)(a2 - 10) < *(unsigned __int8 *)(v10 + 2))
                {
                  int v125 = *(_DWORD *)(v10 + 8);
                  uint64_t v116 = *(void *)v10;
                  uint64_t v47 = *(void *)(a2 - 12);
                  *(_DWORD *)(v10 + 8) = *(_DWORD *)(a2 - 4);
                  *(void *)unint64_t v10 = v47;
                  *(_DWORD *)(a2 - 4) = v125;
                  *(void *)(a2 - 12) = v116;
                }
                break;
              case 3uLL:
                uint64_t result = (uint64_t)sub_FD00((uint64_t *)v10, (uint64_t *)(v10 + 12), (uint64_t *)(a2 - 12));
                break;
              case 4uLL:
                uint64_t result = (uint64_t)sub_100D0(v10, v10 + 12, v10 + 24, a2 - 12);
                break;
              case 5uLL:
                BOOL v48 = (uint64_t *)(v10 + 12);
                int v49 = (uint64_t *)(v10 + 24);
                uint64_t v50 = (uint64_t *)(v10 + 36);
                uint64_t result = (uint64_t)sub_100D0(v10, v10 + 12, v10 + 24, v10 + 36);
                if (*(unsigned __int8 *)(a2 - 10) < *(unsigned __int8 *)(v10 + 38))
                {
                  uint64_t v51 = *v50;
                  int v52 = *(_DWORD *)(v10 + 44);
                  int v53 = *(_DWORD *)(a2 - 4);
                  *uint64_t v50 = *(void *)(a2 - 12);
                  *(_DWORD *)(v10 + 44) = v53;
                  *(_DWORD *)(a2 - 4) = v52;
                  *(void *)(a2 - 12) = v51;
                  if (*(unsigned __int8 *)(v10 + 38) < *(unsigned __int8 *)(v10 + 26))
                  {
                    int v54 = *(_DWORD *)(v10 + 32);
                    uint64_t v55 = *v49;
                    *int v49 = *v50;
                    *(_DWORD *)(v10 + 32) = *(_DWORD *)(v10 + 44);
                    *uint64_t v50 = v55;
                    *(_DWORD *)(v10 + 44) = v54;
                    if (*(unsigned __int8 *)(v10 + 26) < *(unsigned __int8 *)(v10 + 14))
                    {
                      int v56 = *(_DWORD *)(v10 + 20);
                      uint64_t v57 = *v48;
                      uint64_t *v48 = *v49;
                      *(_DWORD *)(v10 + 20) = *(_DWORD *)(v10 + 32);
                      *int v49 = v57;
                      *(_DWORD *)(v10 + 32) = v56;
                      if (*(unsigned __int8 *)(v10 + 14) < *(unsigned __int8 *)(v10 + 2))
                      {
                        int v126 = *(_DWORD *)(v10 + 8);
                        uint64_t v117 = *(void *)v10;
                        *(void *)unint64_t v10 = *v48;
                        *(_DWORD *)(v10 + 8) = *(_DWORD *)(v10 + 20);
                        uint64_t *v48 = v117;
                        *(_DWORD *)(v10 + 20) = v126;
                      }
                    }
                  }
                }
                break;
              default:
                JUMPOUT(0);
            }
            return result;
          }
          if (v11 <= 287)
          {
            uint64_t v58 = (_WORD *)(v10 + 12);
            BOOL v60 = v10 == a2 || v58 == (_WORD *)a2;
            if (a4)
            {
              if (!v60)
              {
                uint64_t v61 = 0;
                int v62 = (_WORD *)v10;
                do
                {
                  char v63 = v58;
                  unsigned int v64 = *((unsigned __int8 *)v62 + 14);
                  if (v64 < *((unsigned __int8 *)v62 + 2))
                  {
                    __int16 v65 = *v63;
                    uint64_t v118 = *(void *)((char *)v62 + 15);
                    char v127 = *((unsigned char *)v62 + 23);
                    uint64_t v66 = v61;
                    while (1)
                    {
                      uint64_t v67 = v10 + v66;
                      *(void *)(v67 + 12) = *(void *)(v10 + v66);
                      *(_DWORD *)(v67 + 20) = *(_DWORD *)(v10 + v66 + 8);
                      if (!v66) {
                        break;
                      }
                      v66 -= 12;
                      if (v64 >= *(unsigned __int8 *)(v67 - 10))
                      {
                        uint64_t v68 = v10 + v66 + 12;
                        goto LABEL_84;
                      }
                    }
                    uint64_t v68 = v10;
LABEL_84:
                    *(_WORD *)uint64_t v68 = v65;
                    *(unsigned char *)(v68 + 2) = v64;
                    *(unsigned char *)(v68 + 11) = v127;
                    *(void *)(v68 + 3) = v118;
                  }
                  uint64_t v58 = v63 + 6;
                  v61 += 12;
                  int v62 = v63;
                }
                while (v63 + 6 != (_WORD *)a2);
              }
            }
            else if (!v60)
            {
              do
              {
                long long v101 = v58;
                unsigned int v102 = *(unsigned __int8 *)(v9 + 14);
                if (v102 < *(unsigned __int8 *)(v9 + 2))
                {
                  __int16 v103 = *v58;
                  uint64_t v121 = *(void *)(v9 + 15);
                  char v130 = *(unsigned char *)(v9 + 23);
                  long long v104 = v101;
                  do
                  {
                    long long v105 = v104;
                    uint64_t v106 = *(void *)(v104 - 6);
                    v104 -= 6;
                    *(void *)long long v105 = v106;
                    *((_DWORD *)v105 + 2) = *((_DWORD *)v105 - 1);
                  }
                  while (v102 < *((unsigned __int8 *)v105 - 22));
                  *long long v104 = v103;
                  *((unsigned char *)v104 + 2) = v102;
                  *((unsigned char *)v104 + 11) = v130;
                  *(void *)((char *)v104 + 3) = v121;
                }
                uint64_t v58 = v101 + 6;
                unint64_t v9 = (unint64_t)v101;
              }
              while (v101 + 6 != (_WORD *)a2);
            }
            return result;
          }
          if (!a3)
          {
            if (v10 != a2)
            {
              int64_t v69 = (v12 - 2) >> 1;
              int64_t v70 = v69;
              do
              {
                int64_t v71 = v70;
                if (v69 >= v70)
                {
                  uint64_t v72 = (2 * v70) | 1;
                  unint64_t v73 = v10 + 12 * v72;
                  if (2 * v71 + 2 < (uint64_t)v12)
                  {
                    unsigned int v74 = *(unsigned __int8 *)(v10 + 12 * v72 + 2);
                    unsigned int v75 = *(unsigned __int8 *)(v73 + 14);
                    v73 += 12 * (v74 < v75);
                    if (v74 < v75) {
                      uint64_t v72 = 2 * v71 + 2;
                    }
                  }
                  unsigned int v76 = *(unsigned __int8 *)(v10 + 12 * v71 + 2);
                  if (*(unsigned __int8 *)(v73 + 2) >= v76)
                  {
                    uint64_t v77 = v10 + 12 * v71;
                    __int16 v78 = *(_WORD *)v77;
                    char v128 = *(unsigned char *)(v77 + 11);
                    uint64_t v119 = *(void *)(v77 + 3);
                    do
                    {
                      uint64_t result = v77;
                      uint64_t v77 = v73;
                      uint64_t v79 = *(void *)v73;
                      *(_DWORD *)(result + 8) = *(_DWORD *)(v77 + 8);
                      *(void *)uint64_t result = v79;
                      if (v69 < v72) {
                        break;
                      }
                      uint64_t result = (2 * v72) | 1;
                      unint64_t v73 = v10 + 12 * result;
                      uint64_t v80 = 2 * v72 + 2;
                      if (v80 < (uint64_t)v12)
                      {
                        unsigned int v81 = *(unsigned __int8 *)(v10 + 12 * result + 2);
                        unsigned int v82 = *(unsigned __int8 *)(v73 + 14);
                        v73 += 12 * (v81 < v82);
                        if (v81 < v82) {
                          uint64_t result = v80;
                        }
                      }
                      uint64_t v72 = result;
                    }
                    while (*(unsigned __int8 *)(v73 + 2) >= v76);
                    *(_WORD *)uint64_t v77 = v78;
                    *(unsigned char *)(v77 + 2) = v76;
                    *(unsigned char *)(v77 + 11) = v128;
                    *(void *)(v77 + 3) = v119;
                  }
                }
                int64_t v70 = v71 - 1;
              }
              while (v71);
              int64_t v83 = v11 / 0xCuLL;
              do
              {
                uint64_t v84 = 0;
                int v129 = *(_DWORD *)(v10 + 8);
                uint64_t v120 = *(void *)v10;
                unint64_t v85 = v10;
                do
                {
                  uint64_t v86 = v84 + 1;
                  unint64_t v87 = v85 + 12 * (v84 + 1);
                  uint64_t v88 = (2 * v84) | 1;
                  uint64_t v89 = 2 * v84 + 2;
                  if (v89 < v83)
                  {
                    unsigned int v90 = *(unsigned __int8 *)(v85 + 12 * v86 + 2);
                    unsigned int v91 = *(unsigned __int8 *)(v87 + 14);
                    v87 += 12 * (v90 < v91);
                    if (v90 < v91) {
                      uint64_t v88 = v89;
                    }
                  }
                  uint64_t v92 = *(void *)v87;
                  *(_DWORD *)(v85 + 8) = *(_DWORD *)(v87 + 8);
                  *(void *)unint64_t v85 = v92;
                  unint64_t v85 = v87;
                  uint64_t v84 = v88;
                }
                while (v88 <= (uint64_t)((unint64_t)(v83 - 2) >> 1));
                a2 -= 12;
                if (v87 == a2)
                {
                  *(_DWORD *)(v87 + 8) = v129;
                  *(void *)unint64_t v87 = v120;
                }
                else
                {
                  uint64_t v93 = *(void *)a2;
                  *(_DWORD *)(v87 + 8) = *(_DWORD *)(a2 + 8);
                  *(void *)unint64_t v87 = v93;
                  *(_DWORD *)(a2 + 8) = v129;
                  *(void *)a2 = v120;
                  uint64_t v94 = v87 - v10 + 12;
                  if (v94 >= 13)
                  {
                    unint64_t v95 = (v94 / 0xCuLL - 2) >> 1;
                    unsigned int v96 = *(unsigned __int8 *)(v87 + 2);
                    if (*(unsigned __int8 *)(v10 + 12 * v95 + 2) < v96)
                    {
                      __int16 v97 = *(_WORD *)v87;
                      char v112 = *(unsigned char *)(v87 + 11);
                      uint64_t v109 = *(void *)(v87 + 3);
                      do
                      {
                        unint64_t v98 = v87;
                        unint64_t v87 = v10 + 12 * v95;
                        uint64_t v99 = *(void *)v87;
                        *(_DWORD *)(v98 + 8) = *(_DWORD *)(v87 + 8);
                        *(void *)unint64_t v98 = v99;
                        if (!v95) {
                          break;
                        }
                        unint64_t v95 = (v95 - 1) >> 1;
                      }
                      while (*(unsigned __int8 *)(v10 + 12 * v95 + 2) < v96);
                      *(_WORD *)unint64_t v87 = v97;
                      *(unsigned char *)(v87 + 2) = v96;
                      *(unsigned char *)(v87 + 11) = v112;
                      *(void *)(v87 + 3) = v109;
                    }
                  }
                }
              }
              while (v83-- > 2);
            }
            return result;
          }
          unint64_t v13 = v12 >> 1;
          unint64_t v14 = v10 + 12 * (v12 >> 1);
          if ((unint64_t)v11 >= 0x601)
          {
            sub_FD00((uint64_t *)v9, (uint64_t *)(v9 + 12 * (v12 >> 1)), (uint64_t *)(a2 - 12));
            uint64_t v15 = 3 * v13;
            unsigned int v16 = (uint64_t *)(v9 + 12 * v13 - 12);
            sub_FD00((uint64_t *)(v9 + 12), v16, (uint64_t *)(a2 - 24));
            uint64_t v17 = (uint64_t *)(v9 + 12 + 4 * v15);
            sub_FD00((uint64_t *)(v9 + 24), v17, (uint64_t *)(a2 - 36));
            uint64_t result = (uint64_t)sub_FD00(v16, (uint64_t *)v14, v17);
            int v122 = *(_DWORD *)(v9 + 8);
            uint64_t v113 = *(void *)v9;
            int v18 = *(_DWORD *)(v14 + 8);
            *(void *)unint64_t v9 = *(void *)v14;
            *(_DWORD *)(v9 + 8) = v18;
            *(_DWORD *)(v14 + 8) = v122;
            *(void *)unint64_t v14 = v113;
          }
          else
          {
            uint64_t result = (uint64_t)sub_FD00((uint64_t *)(v9 + 12 * (v12 >> 1)), (uint64_t *)v9, (uint64_t *)(a2 - 12));
          }
          --a3;
          if (a4) {
            break;
          }
          unsigned int v19 = *(unsigned __int8 *)(v9 + 2);
          if (*(unsigned __int8 *)(v9 - 10) < v19) {
            goto LABEL_13;
          }
          __int16 v35 = *(_WORD *)v9;
          uint64_t v108 = *(void *)(v9 + 3);
          char v111 = *(unsigned char *)(v9 + 11);
          if (v19 >= *(unsigned __int8 *)(a2 - 10))
          {
            unint64_t v38 = v9 + 12;
            do
            {
              unint64_t v10 = v38;
              if (v38 >= a2) {
                break;
              }
              unsigned int v39 = *(unsigned __int8 *)(v38 + 2);
              v38 += 12;
            }
            while (v19 >= v39);
          }
          else
          {
            unint64_t v36 = v9;
            do
            {
              unint64_t v10 = v36 + 12;
              unsigned int v37 = *(unsigned __int8 *)(v36 + 14);
              v36 += 12;
            }
            while (v19 >= v37);
          }
          unint64_t v40 = a2;
          if (v10 < a2)
          {
            unint64_t v41 = a2;
            do
            {
              unint64_t v40 = v41 - 12;
              unsigned int v42 = *(unsigned __int8 *)(v41 - 10);
              v41 -= 12;
            }
            while (v19 < v42);
          }
          while (v10 < v40)
          {
            int v124 = *(_DWORD *)(v10 + 8);
            uint64_t v115 = *(void *)v10;
            uint64_t v43 = *(void *)v40;
            *(_DWORD *)(v10 + 8) = *(_DWORD *)(v40 + 8);
            *(void *)unint64_t v10 = v43;
            *(_DWORD *)(v40 + 8) = v124;
            *(void *)unint64_t v40 = v115;
            do
            {
              unsigned int v44 = *(unsigned __int8 *)(v10 + 14);
              v10 += 12;
            }
            while (v19 >= v44);
            do
            {
              unsigned int v45 = *(unsigned __int8 *)(v40 - 10);
              v40 -= 12;
            }
            while (v19 < v45);
          }
          BOOL v4 = v10 - 12 >= v9;
          BOOL v5 = v10 - 12 == v9;
          if (v10 - 12 != v9)
          {
            uint64_t v46 = *(void *)(v10 - 12);
            *(_DWORD *)(v9 + 8) = *(_DWORD *)(v10 - 4);
            *(void *)unint64_t v9 = v46;
          }
          a4 = 0;
          *(_WORD *)(v10 - 12) = v35;
          *(unsigned char *)(v10 - 10) = v19;
          *(unsigned char *)(v10 - 1) = v111;
          *(void *)(v10 - 9) = v108;
        }
        unsigned int v19 = *(unsigned __int8 *)(v9 + 2);
LABEL_13:
        uint64_t v20 = 0;
        __int16 v21 = *(_WORD *)v9;
        uint64_t v107 = *(void *)(v9 + 3);
        char v110 = *(unsigned char *)(v9 + 11);
        do
        {
          unsigned int v22 = *(unsigned __int8 *)(v9 + v20 + 14);
          v20 += 12;
        }
        while (v22 < v19);
        unint64_t v23 = v9 + v20;
        unint64_t v24 = a2;
        if (v20 == 12)
        {
          unint64_t v27 = a2;
          while (v23 < v27)
          {
            unint64_t v25 = v27 - 12;
            unsigned int v28 = *(unsigned __int8 *)(v27 - 10);
            v27 -= 12;
            if (v28 < v19) {
              goto LABEL_23;
            }
          }
          unint64_t v25 = v27;
        }
        else
        {
          do
          {
            unint64_t v25 = v24 - 12;
            unsigned int v26 = *(unsigned __int8 *)(v24 - 10);
            v24 -= 12;
          }
          while (v26 >= v19);
        }
LABEL_23:
        unint64_t v10 = v23;
        if (v23 < v25)
        {
          unint64_t v29 = v25;
          do
          {
            int v123 = *(_DWORD *)(v10 + 8);
            uint64_t v114 = *(void *)v10;
            uint64_t v30 = *(void *)v29;
            *(_DWORD *)(v10 + 8) = *(_DWORD *)(v29 + 8);
            *(void *)unint64_t v10 = v30;
            *(_DWORD *)(v29 + 8) = v123;
            *(void *)unint64_t v29 = v114;
            do
            {
              unsigned int v31 = *(unsigned __int8 *)(v10 + 14);
              v10 += 12;
            }
            while (v31 < v19);
            do
            {
              unsigned int v32 = *(unsigned __int8 *)(v29 - 10);
              v29 -= 12;
            }
            while (v32 >= v19);
          }
          while (v10 < v29);
        }
        if (v10 - 12 != v9)
        {
          uint64_t v33 = *(void *)(v10 - 12);
          *(_DWORD *)(v9 + 8) = *(_DWORD *)(v10 - 4);
          *(void *)unint64_t v9 = v33;
        }
        *(_WORD *)(v10 - 12) = v21;
        *(unsigned char *)(v10 - 10) = v19;
        *(unsigned char *)(v10 - 1) = v110;
        *(void *)(v10 - 9) = v107;
        if (v23 >= v25) {
          break;
        }
LABEL_34:
        uint64_t result = sub_F310(v9, v10 - 12, a3, a4 & 1);
        a4 = 0;
      }
      BOOL v34 = sub_FDF0(v9, v10 - 12);
      uint64_t result = sub_FDF0(v10, a2);
      if (result) {
        break;
      }
      if (!v34) {
        goto LABEL_34;
      }
    }
    a2 = v10 - 12;
    if (!v34) {
      continue;
    }
    return result;
  }
}

uint64_t *sub_FD00(uint64_t *result, uint64_t *a2, uint64_t *a3)
{
  unsigned int v3 = *((unsigned __int8 *)a2 + 2);
  unsigned int v4 = *((unsigned __int8 *)a3 + 2);
  if (v3 >= *((unsigned __int8 *)result + 2))
  {
    if (v4 < v3)
    {
      int v8 = *((_DWORD *)a2 + 2);
      uint64_t v9 = *a2;
      int v10 = *((_DWORD *)a3 + 2);
      *a2 = *a3;
      *((_DWORD *)a2 + 2) = v10;
      *a3 = v9;
      *((_DWORD *)a3 + 2) = v8;
      if (*((unsigned __int8 *)a2 + 2) < *((unsigned __int8 *)result + 2))
      {
        int v11 = *((_DWORD *)result + 2);
        uint64_t v12 = *result;
        int v13 = *((_DWORD *)a2 + 2);
        *uint64_t result = *a2;
        *((_DWORD *)result + 2) = v13;
        *a2 = v12;
        *((_DWORD *)a2 + 2) = v11;
      }
    }
  }
  else
  {
    if (v4 >= v3)
    {
      int v14 = *((_DWORD *)result + 2);
      uint64_t v15 = *result;
      int v16 = *((_DWORD *)a2 + 2);
      *uint64_t result = *a2;
      *((_DWORD *)result + 2) = v16;
      *a2 = v15;
      *((_DWORD *)a2 + 2) = v14;
      if (*((unsigned __int8 *)a3 + 2) >= BYTE2(v15)) {
        return result;
      }
      int v5 = *((_DWORD *)a2 + 2);
      uint64_t v6 = *a2;
      int v17 = *((_DWORD *)a3 + 2);
      *a2 = *a3;
      *((_DWORD *)a2 + 2) = v17;
    }
    else
    {
      int v5 = *((_DWORD *)result + 2);
      uint64_t v6 = *result;
      int v7 = *((_DWORD *)a3 + 2);
      *uint64_t result = *a3;
      *((_DWORD *)result + 2) = v7;
    }
    *a3 = v6;
    *((_DWORD *)a3 + 2) = v5;
  }
  return result;
}

BOOL sub_FDF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 2;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      if (*(unsigned __int8 *)(a2 - 10) < *(unsigned __int8 *)(a1 + 2))
      {
        int v6 = *(_DWORD *)(a1 + 8);
        uint64_t v7 = *(void *)a1;
        int v8 = *(_DWORD *)(a2 - 4);
        *(void *)a1 = *(void *)(a2 - 12);
        *(_DWORD *)(a1 + 8) = v8;
        *(void *)(a2 - 12) = v7;
        *(_DWORD *)(a2 - 4) = v6;
      }
      return result;
    case 3uLL:
      sub_FD00((uint64_t *)a1, (uint64_t *)(a1 + 12), (uint64_t *)(a2 - 12));
      return 1;
    case 4uLL:
      sub_100D0(a1, a1 + 12, a1 + 24, a2 - 12);
      return 1;
    case 5uLL:
      int v18 = (uint64_t *)(a1 + 12);
      unsigned int v19 = (uint64_t *)(a1 + 24);
      uint64_t v20 = (uint64_t *)(a1 + 36);
      sub_100D0(a1, a1 + 12, a1 + 24, a1 + 36);
      if (*(unsigned __int8 *)(a2 - 10) < *(unsigned __int8 *)(a1 + 38))
      {
        int v21 = *(_DWORD *)(a1 + 44);
        uint64_t v22 = *v20;
        int v23 = *(_DWORD *)(a2 - 4);
        uint64_t *v20 = *(void *)(a2 - 12);
        *(_DWORD *)(a1 + 44) = v23;
        *(void *)(a2 - 12) = v22;
        *(_DWORD *)(a2 - 4) = v21;
        if (*(unsigned __int8 *)(a1 + 38) < *(unsigned __int8 *)(a1 + 26))
        {
          int v24 = *(_DWORD *)(a1 + 32);
          uint64_t v25 = *v19;
          uint64_t *v19 = *v20;
          *(_DWORD *)(a1 + 32) = *(_DWORD *)(a1 + 44);
          uint64_t *v20 = v25;
          *(_DWORD *)(a1 + 44) = v24;
          if (*(unsigned __int8 *)(a1 + 26) < *(unsigned __int8 *)(a1 + 14))
          {
            int v26 = *(_DWORD *)(a1 + 20);
            uint64_t v27 = *v18;
            uint64_t *v18 = *v19;
            *(_DWORD *)(a1 + 20) = *(_DWORD *)(a1 + 32);
            uint64_t *v19 = v27;
            *(_DWORD *)(a1 + 32) = v26;
            if (*(unsigned __int8 *)(a1 + 14) < *(unsigned __int8 *)(a1 + 2))
            {
              int v28 = *(_DWORD *)(a1 + 8);
              uint64_t v29 = *(void *)a1;
              *(void *)a1 = *v18;
              *(_DWORD *)(a1 + 8) = *(_DWORD *)(a1 + 20);
              uint64_t *v18 = v29;
              *(_DWORD *)(a1 + 20) = v28;
            }
          }
        }
      }
      return 1;
    default:
      uint64_t v9 = a1 + 24;
      sub_FD00((uint64_t *)a1, (uint64_t *)(a1 + 12), (uint64_t *)(a1 + 24));
      uint64_t v10 = a1 + 36;
      if (a1 + 36 == a2) {
        return 1;
      }
      uint64_t v11 = 0;
      int v12 = 0;
      break;
  }
  while (1)
  {
    unsigned int v13 = *(unsigned __int8 *)(v10 + 2);
    if (v13 < *(unsigned __int8 *)(v9 + 2))
    {
      __int16 v14 = *(_WORD *)v10;
      uint64_t v30 = *(void *)(v10 + 3);
      char v31 = *(unsigned char *)(v10 + 11);
      uint64_t v15 = v11;
      while (1)
      {
        uint64_t v16 = a1 + v15;
        *(void *)(v16 + 36) = *(void *)(a1 + v15 + 24);
        *(_DWORD *)(v16 + 44) = *(_DWORD *)(a1 + v15 + 32);
        if (v15 == -24) {
          break;
        }
        v15 -= 12;
        if (v13 >= *(unsigned __int8 *)(v16 + 14))
        {
          uint64_t v17 = a1 + v15 + 36;
          goto LABEL_12;
        }
      }
      uint64_t v17 = a1;
LABEL_12:
      *(_WORD *)uint64_t v17 = v14;
      *(unsigned char *)(v17 + 2) = v13;
      *(void *)(v17 + 3) = v30;
      *(unsigned char *)(v17 + 11) = v31;
      if (++v12 == 8) {
        return v10 + 12 == a2;
      }
    }
    uint64_t v9 = v10;
    v11 += 12;
    v10 += 12;
    if (v10 == a2) {
      return 1;
    }
  }
}

uint64_t *sub_100D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL result = sub_FD00((uint64_t *)a1, (uint64_t *)a2, (uint64_t *)a3);
  if (*(unsigned __int8 *)(a4 + 2) < *(unsigned __int8 *)(a3 + 2))
  {
    int v9 = *(_DWORD *)(a3 + 8);
    uint64_t v10 = *(void *)a3;
    int v11 = *(_DWORD *)(a4 + 8);
    *(void *)a3 = *(void *)a4;
    *(_DWORD *)(a3 + 8) = v11;
    *(void *)a4 = v10;
    *(_DWORD *)(a4 + 8) = v9;
    if (*(unsigned __int8 *)(a3 + 2) < *(unsigned __int8 *)(a2 + 2))
    {
      int v12 = *(_DWORD *)(a2 + 8);
      uint64_t v13 = *(void *)a2;
      int v14 = *(_DWORD *)(a3 + 8);
      *(void *)a2 = *(void *)a3;
      *(_DWORD *)(a2 + 8) = v14;
      *(void *)a3 = v13;
      *(_DWORD *)(a3 + 8) = v12;
      if (*(unsigned __int8 *)(a2 + 2) < *(unsigned __int8 *)(a1 + 2))
      {
        int v15 = *(_DWORD *)(a1 + 8);
        uint64_t v16 = *(void *)a1;
        int v17 = *(_DWORD *)(a2 + 8);
        *(void *)a1 = *(void *)a2;
        *(_DWORD *)(a1 + 8) = v17;
        *(void *)a2 = v16;
        *(_DWORD *)(a2 + 8) = v15;
      }
    }
  }
  return result;
}

uint64_t sub_101A0(uint64_t result, uint64_t a2, unint64_t a3, char *a4)
{
  uint64_t v4 = *(char **)(result + 8);
  uint64_t v5 = v4 - a4;
  int v6 = (uint64_t *)(a2 + v4 - a4);
  uint64_t v7 = v4;
  while ((unint64_t)v6 < a3)
  {
    uint64_t v8 = *v6++;
    *(void *)uint64_t v7 = v8;
    v7 += 8;
  }
  *(void *)(result + 8) = v7;
  if (v4 != a4)
  {
    int v9 = v4 - 8;
    uint64_t v10 = 8 * (v5 >> 3);
    do
    {
      *(void *)int v9 = *(void *)(a2 - 8 + v10);
      v9 -= 8;
      v10 -= 8;
    }
    while (v10);
  }
  return result;
}

double sub_101F4(uint64_t a1, double *a2)
{
  uint64_t v4 = *(void **)(a1 + 16);
  if (v4 == *(void **)(a1 + 24))
  {
    uint64_t v5 = *(void **)(a1 + 8);
    uint64_t v6 = (uint64_t)v5 - *(void *)a1;
    if ((unint64_t)v5 <= *(void *)a1)
    {
      uint64_t v12 = (uint64_t)v4 - *(void *)a1;
      BOOL v11 = v12 == 0;
      uint64_t v13 = v12 >> 2;
      if (v11) {
        unint64_t v14 = 1;
      }
      else {
        unint64_t v14 = v13;
      }
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v25 = *(void *)(a1 + 32);
      *(void *)&long long v23 = sub_1041C(v15, v14);
      *((void *)&v23 + 1) = v23 + 8 * (v14 >> 2);
      *(void *)&long long v24 = *((void *)&v23 + 1);
      *((void *)&v24 + 1) = v23 + 8 * v16;
      sub_10454((uint64_t)&v23, *(uint64_t **)(a1 + 8), (uint64_t)(*(void *)(a1 + 16) - *(void *)(a1 + 8)) >> 3);
      int v17 = *(void **)a1;
      uint64_t v18 = *(void *)(a1 + 8);
      long long v20 = v23;
      long long v19 = v24;
      *(void *)&long long v23 = *(void *)a1;
      *((void *)&v23 + 1) = v18;
      long long v21 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)a1 = v20;
      *(_OWORD *)(a1 + 16) = v19;
      long long v24 = v21;
      if ((void)v21 != v18) {
        *(void *)&long long v24 = v21 + ((v18 - v21 + 7) & 0xFFFFFFFFFFFFFFF8);
      }
      if (v17)
      {
        operator delete(v17);
        uint64_t v4 = *(void **)(a1 + 16);
      }
      else
      {
        uint64_t v4 = (void *)v19;
      }
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (!v8) {
        uint64_t v9 = v7 + 1;
      }
      if (v5 == v4)
      {
        uint64_t v10 = &v5[-(v9 >> 1)];
      }
      else
      {
        do
        {
          v5[-(v9 >> 1)] = *v5;
          ++v5;
        }
        while (v5 != v4);
        uint64_t v4 = *(void **)(a1 + 8);
        uint64_t v10 = &v5[-(v9 >> 1)];
      }
      *(void *)(a1 + 8) = &v4[-(v9 >> 1)];
      *(void *)(a1 + 16) = v10;
      uint64_t v4 = v10;
    }
  }
  double result = *a2;
  *uint64_t v4 = *(void *)a2;
  *(void *)(a1 + 16) = v4 + 1;
  return result;
}

void sub_10330(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10368(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = a1 + 16;
  sub_10480(a1 + 16, (uint64_t)a3, (uint64_t)a3, *(void *)a1, *(void *)a1, v6, v6);
  a2[1] = v8;
  a2[2] = sub_104AC(v7, a3, *(uint64_t **)(a1 + 8), (void *)a2[2]);
  uint64_t v9 = *(void *)a1;
  *(void *)a1 = a2[1];
  a2[1] = v9;
  uint64_t v10 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = a2[2];
  a2[2] = v10;
  uint64_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return v6;
}

void *sub_1041C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_4A5C();
  }
  return operator new(8 * a2);
}

uint64_t sub_10454(uint64_t result, uint64_t *a2, uint64_t a3)
{
  unsigned int v3 = *(void **)(result + 16);
  if (a3)
  {
    uint64_t v4 = 8 * a3;
    uint64_t v5 = &v3[a3];
    do
    {
      uint64_t v6 = *a2++;
      *v3++ = v6;
      v4 -= 8;
    }
    while (v4);
    unsigned int v3 = v5;
  }
  *(void *)(result + 16) = v3;
  return result;
}

double sub_10480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  if (a3 != a5)
  {
    uint64_t v8 = (double *)(a7 - 8);
    do
    {
      double v9 = *(double *)(a3 - 8);
      a3 -= 8;
      double result = v9;
      *v8-- = v9;
      v7 -= 8;
    }
    while (a3 != a5);
  }
  return result;
}

void *sub_104AC(uint64_t a1, uint64_t *a2, uint64_t *a3, void *a4)
{
  double result = a4;
  while (a2 != a3)
  {
    uint64_t v5 = *a2++;
    *result++ = v5;
  }
  return result;
}

void sub_104C8()
{
}

void sub_104E0(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1053C(exception, a1);
}

void sub_10528(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1053C(std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  return result;
}

uint64_t sub_10570(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 3;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 61) {
    sub_496C();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 2 > v5) {
    unint64_t v5 = v8 >> 2;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v9 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  long long v19 = a1 + 2;
  uint64_t v10 = (char *)sub_1041C(v7, v9);
  uint64_t v11 = &v10[8 * v4];
  __p = v10;
  uint64_t v16 = v11;
  uint64_t v18 = &v10[8 * v12];
  *(void *)uint64_t v11 = *a2;
  int v17 = v11 + 8;
  sub_10688(a1, &__p);
  uint64_t v13 = a1[1];
  if (v17 != v16) {
    v17 += (v16 - v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  }
  if (__p) {
    operator delete(__p);
  }
  return v13;
}

void sub_10650(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10688(uint64_t *a1, void *a2)
{
  sub_10480((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v4;
  uint64_t v5 = *a1;
  *a1 = v4;
  a2[1] = v5;
  uint64_t v6 = a1[1];
  a1[1] = a2[2];
  a2[2] = v6;
  uint64_t v7 = a1[2];
  a1[2] = a2[3];
  a2[3] = v7;
  *a2 = a2[1];
}

void *sub_10700(void *a1)
{
  *a1 = off_28890;
  uint64_t v2 = (const void *)a1[1];
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_10754(void *a1)
{
  sub_10700(a1);

  operator delete();
}

void sub_1078C(void *a1)
{
  sub_10700(a1);

  operator delete();
}

uint64_t sub_107C4(unsigned __int8 *a1)
{
  uint64_t result = sub_10840(a1);
  if (result)
  {
    unsigned int v3 = *a1;
    if (v3 >= 0x10)
    {
      uint64_t result = v3 >> 4;
      if ((result - 8) >= 7)
      {
        if (result == 15 && v3 > 0xF0) {
          return byte_23B23[(char)(v3 + 15)];
        }
        else {
          return 0;
        }
      }
    }
    else
    {
      return 4;
    }
  }
  return result;
}

uint64_t sub_10840(unsigned __int8 *a1)
{
  int v1 = *((unsigned __int16 *)a1 + 2);
  if (!*((_WORD *)a1 + 2)) {
    return 0;
  }
  if (v1 == 3 || a1[(__int16)v1 - 1] == 247) {
    return 1;
  }
  unsigned int v3 = *a1;
  if ((v3 >> 4) - 12 < 2) {
    return (__int16)v1 == 2;
  }
  if (v3 >> 4 != 15) {
    return 0;
  }
  if (v3 == 241) {
    return (__int16)v1 == 2;
  }
  if (v3 != 246)
  {
    if (v3 != 243) {
      return 0;
    }
    return (__int16)v1 == 2;
  }
  return (__int16)v1 == 1;
}

uint64_t sub_108BC(MIDIProtocolID a1, MIDITimeStamp a2, char *a3, uint64_t a4, MIDIEventList *a5, unint64_t a6)
{
  uint64_t result = 0;
  ByteCount v8 = a6 - (void)a5;
  if (a6 < (unint64_t)a5 || !a5 || !a6) {
    return result;
  }
  bzero(a5, a6 - (void)a5);
  unint64_t v14 = MIDIEventListInit(a5, a1);
  if (a4 < 1)
  {
    uint64_t v16 = a3;
    return (unint64_t)(v16 - a3) >> 2;
  }
  int64_t v15 = byte_23AF8[(unint64_t)*(unsigned int *)a3 >> 28];
  uint64_t v16 = a3;
  if (a4 < v15) {
    return (unint64_t)(v16 - a3) >> 2;
  }
  int v17 = v14;
  char v18 = 0;
  int v19 = -1;
  long long v20 = (const UInt32 *)a3;
  long long v21 = (unsigned int *)&a3[4 * a4];
  uint64_t v22 = (unsigned int *)&a3[4 * v15];
  while (1)
  {
    uint64_t v16 = (char *)v22;
    unsigned int v23 = *v20 >> 28;
    BOOL v24 = !v23 || v23 == 15;
    int v25 = v24 ? 255 : HIBYTE(*v20) & 0xF;
    if (v19 != -1 && v19 != v25) {
      break;
    }
    if (v23 >= 2)
    {
      if (v23 == 5 || v23 == 3)
      {
        if ((v18 & 1) == 0 && a5->numPackets || (unint64_t)&v17->words[v17->wordCount + v15] > a6) {
          return (unint64_t)((char *)v20 - a3) >> 2;
        }
        char v18 = 1;
      }
      else
      {
        if (v18) {
          return (unint64_t)((char *)v20 - a3) >> 2;
        }
        char v18 = 0;
      }
    }
    uint64_t v27 = MIDIEventListAdd(a5, v8, v17, a2, v15, v20);
    if (!v27) {
      return (unint64_t)((char *)v20 - a3) >> 2;
    }
    if (v16 < (char *)v21)
    {
      int v17 = v27;
      int64_t v15 = byte_23AF8[(unint64_t)*(unsigned int *)v16 >> 28];
      uint64_t v22 = (unsigned int *)&v16[4 * v15];
      long long v20 = (const UInt32 *)v16;
      int v19 = v25;
      if (v22 <= v21) {
        continue;
      }
    }
    return (unint64_t)(v16 - a3) >> 2;
  }
  return (unint64_t)((char *)v20 - a3) >> 2;
}

uint64_t sub_10A5C(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 272);
  if (v1 == -1) {
    sub_10AA8();
  }
  uint64_t v4 = &v3;
  return ((uint64_t (*)(char **, uint64_t))off_288D8[v1])(&v4, a1);
}

void sub_10AA8()
{
  exception = __cxa_allocate_exception(8uLL);
}

uint64_t sub_10AF8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10B00(uint64_t a1, uint64_t a2)
{
  return *(void *)a2;
}

uint64_t sub_10B08(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 272);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))off_288E8[v2])(&v4, a1);
  }
  *(_DWORD *)(a1 + 272) = -1;
  return a1;
}

void sub_10B68(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a2;
  if (*(void *)a2)
  {
    *(void *)(a2 + 8) = v2;
    operator delete(v2);
  }
}

uint64_t sub_10B7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  if (a2 == a3) {
    return a2;
  }
  uint64_t v6 = a3;
  do
  {
    sub_10BFC((unsigned int *)a4, (unsigned int *)v5);
    uint64_t v7 = *(void *)(v5 + 280);
    *(void *)(a4 + 285) = *(void *)(v5 + 285);
    *(void *)(a4 + 280) = v7;
    a4 += 296;
    v5 += 296;
  }
  while (v5 != v6);
  return v6;
}

unsigned int *sub_10BFC(unsigned int *result, unsigned int *a2)
{
  uint64_t v2 = result;
  uint64_t v3 = result[68];
  uint64_t v4 = a2[68];
  if (v3 == -1)
  {
    if (v4 == -1) {
      return result;
    }
  }
  else if (v4 == -1)
  {
    uint64_t result = (unsigned int *)((uint64_t (*)(char *, unsigned int *, unsigned int *))off_288E8[v3])(&v6, result, a2);
    v2[68] = -1;
    return result;
  }
  uint64_t v5 = result;
  return (unsigned int *)(*(&off_288F8 + v4))((int)&v5, result, a2);
}

_DWORD *sub_10C8C(_DWORD **a1, void *__dst, void *__src)
{
  uint64_t v3 = *a1;
  if (v3[68]) {
    return sub_10CB8(v3, __src);
  }
  else {
    return memcpy(__dst, __src, 0x10CuLL);
  }
}

void sub_10CB0(uint64_t *a1, uint64_t a2, __n128 *a3)
{
}

_DWORD *sub_10CB8(_DWORD *__dst, void *__src)
{
  uint64_t v4 = __dst[68];
  if (v4 != -1) {
    ((void (*)(char *, _DWORD *))off_288E8[v4])(&v6, __dst);
  }
  __dst[68] = -1;
  memcpy(__dst, __src, 0x10CuLL);
  __dst[68] = 0;
  return __dst;
}

void sub_10D2C(uint64_t a1, uint64_t a2, __n128 *a3)
{
  if (*(_DWORD *)(a1 + 272) == 1) {
    sub_10D4C(a2, a3);
  }
  else {
    sub_10DA0(a1, (uint64_t)a3);
  }
}

__n128 sub_10D4C(uint64_t a1, __n128 *a2)
{
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    *(void *)(a1 + 8) = v4;
    operator delete(v4);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
  __n128 result = *a2;
  *(__n128 *)a1 = *a2;
  *(void *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

uint64_t sub_10DA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 272);
  if (v4 != -1) {
    ((void (*)(char *, uint64_t))off_288E8[v4])(&v6, a1);
  }
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(_DWORD *)(a1 + 272) = 1;
  return a1;
}

uint64_t sub_10E20(uint64_t a1, uint64_t a2)
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

void *sub_10EB8(void *a1)
{
  *a1 = off_28918;
  sub_11180(a1 + 2);
  return a1;
}

void sub_10EFC(void *a1)
{
  *a1 = off_28918;
  sub_11180(a1 + 2);

  operator delete();
}

void *sub_10F60(uint64_t a1)
{
  uint64_t v2 = operator new(0x30uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *v2 = off_28918;
  v2[1] = v3;
  sub_10E20((uint64_t)(v2 + 2), a1 + 16);
  return v2;
}

void sub_10FB8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10FCC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  *a2 = off_28918;
  a2[1] = v2;
  return sub_10E20((uint64_t)(a2 + 2), a1 + 16);
}

void *sub_10FFC(uint64_t a1)
{
  return sub_11180((void *)(a1 + 16));
}

void sub_11004(void *a1)
{
  sub_11180(a1 + 2);

  operator delete(a1);
}

BOOL sub_11040(uint64_t a1, uint64_t *a2)
{
  return sub_110C8((uint64_t (**)(uint64_t, char *))(a1 + 8), a2);
}

uint64_t sub_11048(uint64_t a1, uint64_t a2)
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
  *uint64_t v3 = 0;
  return a1;
}

BOOL sub_110C8(uint64_t (**a1)(uint64_t, char *), uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v6 = 0;
  uint64_t v4 = (*a1)(v3, &v6);
  if (!v6) {
    return 0;
  }
  sub_1112C((uint64_t)(a1 + 1), v4);
  return v6 != 0;
}

uint64_t sub_1112C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    sub_4B64();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v4);
}

void *sub_11180(void *a1)
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

void *sub_11204(void *a1, CFStringRef format, uint64_t a3)
{
  CFStringRef v4 = CFStringCreateWithFormat(0, 0, format, a3);
  *a1 = &off_288B0;
  a1[1] = v4;
  return a1;
}

void sub_1126C()
{
}

void *sub_11280()
{
  __n128 result = operator new(0x10uLL);
  *__n128 result = off_28960;
  return result;
}

void sub_112B8(uint64_t a1, void *a2)
{
  *a2 = off_28960;
}

void sub_112E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  sub_9DB0();
  if (v2)
  {
    sub_9DB0();
    uint64_t v3 = qword_2C138;
    if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315394;
      uint64_t v7 = "USBMIDIDriverBase.cpp";
      __int16 v8 = 1024;
      int v9 = 654;
      _os_log_impl(&def_F708, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d ==========================================================================================================", (uint8_t *)&v6, 0x12u);
    }
    sub_9DB0();
    CFStringRef v4 = qword_2C138;
    if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315650;
      uint64_t v7 = "USBMIDIDriverBase.cpp";
      __int16 v8 = 1024;
      int v9 = 655;
      __int16 v10 = 1024;
      int v11 = v2;
      _os_log_impl(&def_F708, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d NOTICE: USB MIDI Driver destructive tracing at level %d", (uint8_t *)&v6, 0x18u);
    }
    sub_9DB0();
    uint64_t v5 = qword_2C138;
    if (os_log_type_enabled((os_log_t)qword_2C138, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315394;
      uint64_t v7 = "USBMIDIDriverBase.cpp";
      __int16 v8 = 1024;
      int v9 = 656;
      _os_log_impl(&def_F708, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d ==========================================================================================================", (uint8_t *)&v6, 0x12u);
    }
  }
}

void sub_11470(void *a1@<X1>, void *a2@<X2>, void *a3@<X3>, unsigned int *a4@<X4>, void *a5@<X8>)
{
  __int16 v10 = operator new(0x208uLL);
  sub_11504(v10, a1, a2, a3, a4);
  *a5 = v10 + 3;
  a5[1] = v10;

  sub_1160C((uint64_t)a5, v10 + 11, (uint64_t)(v10 + 3));
}

void sub_114F0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_11504(void *a1, void *a2, void *a3, void *a4, unsigned int *a5)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_289A8;
  sub_120C4(a1 + 3, *a2, *a3, *a4, *a5);
  return a1;
}

void sub_1155C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_11570(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_289A8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_11590(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_289A8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_115E4(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void sub_1160C(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    CFStringRef v4 = (std::__shared_weak_count *)a2[1];
    if (!v4 || v4->__shared_owners_ == -1)
    {
      uint64_t v5 = *(std::__shared_weak_count **)(a1 + 8);
      if (v5)
      {
        atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
        atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        CFStringRef v4 = (std::__shared_weak_count *)a2[1];
      }
      *a2 = a3;
      a2[1] = v5;
      if (v4) {
        std::__shared_weak_count::__release_weak(v4);
      }
      if (v5)
      {
        sub_11694(v5);
      }
    }
  }
}

void sub_11694(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_11708(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  sub_20BD8(a1, a5);
  *(void *)(v10 + 64) = 0;
  *(void *)(v10 + 72) = 0;
  *(void *)uint64_t v10 = off_289E0;
  *(void *)(v10 + 80) = a2;
  *(void *)(v10 + 88) = a3;
  *(void *)(v10 + 96) = a4;
  *(_OWORD *)(v10 + 104) = 0u;
  *(_OWORD *)(v10 + 120) = 0u;
  *(_OWORD *)(v10 + 136) = 0u;
  *(_OWORD *)(v10 + 152) = 0u;
  *(_OWORD *)(v10 + 168) = 0u;
  *(_DWORD *)(v10 + 183) = 0;
  *(_WORD *)(v10 + 187) = 1;
  *(unsigned char *)(v10 + 189) = 0;
  *(void *)(v10 + 192) = 0;
  *(_OWORD *)(v10 + 240) = 0u;
  *(void *)(v10 + 200) = 0;
  *(void *)(v10 + 208) = 0;
  *(_DWORD *)(v10 + 216) = 1;
  *(_OWORD *)(v10 + 224) = 0u;
  *(_OWORD *)(v10 + 256) = 0u;
  *(_OWORD *)(v10 + 272) = 0u;
  *(_OWORD *)(v10 + 288) = 0u;
  *(_OWORD *)(v10 + 304) = 0u;
  *(_OWORD *)(v10 + 320) = 0u;
  *(void *)(v10 + 336) = 0;
  sub_5CCC(v10 + 344, (uint64_t)"USBMIDIDevice.mWriteQueueMutex");
  *(void *)(a1 + 432) = a1 + 432;
  *(void *)(a1 + 440) = a1 + 432;
  *(_OWORD *)(a1 + 448) = 0u;
  *(_OWORD *)(a1 + 464) = 0u;
  *(_OWORD *)(a1 + 478) = 0u;
  v36[0] = off_28BB8;
  v36[3] = v36;
  sub_D2E0(@"usbioresults", @"com.apple.coremidi", (uint64_t)sub_3F44, (uint64_t)v36);
  sub_11180(v36);
  v35[0] = off_28C00;
  v35[1] = a1;
  v35[3] = v35;
  sub_11EEC(@"usbmidi2", @"com.apple.coremidi", (uint64_t)sub_4040, (uint64_t)v35);
  sub_1AF94(v35);
  v34[0] = off_28C48;
  v34[1] = a1;
  v34[3] = v34;
  sub_11EEC(@"umpoutput", @"com.apple.coremidi", (uint64_t)sub_4040, (uint64_t)v34);
  sub_1AF94(v34);
  v33[0] = off_28C90;
  v33[1] = a1;
  v33[3] = v33;
  sub_11EEC(@"umpinput", @"com.apple.coremidi", (uint64_t)sub_4040, (uint64_t)v33);
  sub_1AF94(v33);
  sub_12008();
  int v11 = qword_2C148;
  if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = "(MIDI 2.0 enabled)";
    int v13 = *(unsigned __int8 *)(a1 + 490);
    int v14 = *(unsigned __int8 *)(a1 + 489);
    BOOL v15 = *(unsigned char *)(a1 + 187) == 0;
    buf[0] = 136316674;
    if (v15) {
      uint64_t v12 = "(Legacy MIDI 1.0 re-enabled by defaults)";
    }
    *(void *)&buf[1] = "USBMIDIDevice.cpp";
    uint64_t v16 = "UMP for Legacy Input";
    int v22 = 119;
    __int16 v23 = 2048;
    __int16 v21 = 1024;
    if (!v13) {
      uint64_t v16 = "Legacy Input Passthrough";
    }
    uint64_t v24 = a1;
    __int16 v25 = 1024;
    int v17 = "Legacy Output Passthrough";
    int v26 = a5;
    __int16 v27 = 2080;
    if (v14) {
      int v17 = "UMP for Legacy Output";
    }
    int v28 = v12;
    __int16 v29 = 2080;
    uint64_t v30 = v16;
    __int16 v31 = 2080;
    unsigned int v32 = v17;
    _os_log_impl(&def_F708, v11, OS_LOG_TYPE_INFO, "%25s:%-5d [*] USBMIDIDevice(%p)::USBMIDIDevice() with MIDIDeviceRef %u %s (%s / %s)", (uint8_t *)buf, 0x40u);
  }
  char v18 = off_28CC8;
  uint64_t v19 = a1;
  operator new();
}

void sub_11CB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_45C4(exception_object);
}

void *sub_11EEC(const void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  __int16 v8 = sub_3ECC();
  sub_1AC34((uint64_t)v11, a4);
  int v13 = 0;
  int v9 = operator new(0x30uLL);
  *int v9 = off_28B70;
  v9[1] = a3;
  sub_1AE5C((uint64_t)(v9 + 2), (uint64_t)v11);
  int v13 = v9;
  sub_4414((uint64_t)v8, a1, a2, (uint64_t)v12);
  sub_4838(v12);
  return sub_1AF94(v11);
}

void sub_11FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  sub_4838((uint64_t *)va);
  sub_1AF94(v6);
  _Unwind_Resume(a1);
}

void sub_12008()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2C150, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2C150))
  {
    qword_2C148 = (uint64_t)os_log_create("com.apple.coremidi", "usbmio");
    __cxa_guard_release(&qword_2C150);
  }
}

void *sub_12078(void *a1, uint64_t *a2)
{
  sub_1B37C((uint64_t *)&v6, a2);
  uint64_t v3 = (std::__shared_weak_count *)a1[1];
  long long v4 = v6;
  *(void *)&long long v6 = *a1;
  *((void *)&v6 + 1) = v3;
  *(_OWORD *)a1 = v4;
  if (v3) {
    sub_11694(v3);
  }
  return a1;
}

uint64_t sub_120C8(void *a1)
{
  sub_12008();
  uint64_t v2 = qword_2C148;
  if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 136;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = a1;
    _os_log_impl(&def_F708, v2, OS_LOG_TYPE_INFO, "%25s:%-5d [+] USBMIDIDevice(%p)::Initialize()", buf, 0x1Cu);
  }
  uint64_t v3 = (*(uint64_t (**)(void, void *))(*(void *)a1[10] + 144))(a1[10], a1);
  a1[12] = v3;
  if (!v3 || (sub_7364(v3) & 1) == 0)
  {
    sub_12008();
    uint64_t v25 = qword_2C148;
    if (!os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    uint64_t v26 = a1[12];
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    *(_DWORD *)buf = 136315906;
    *(_WORD *)&buf[12] = 1024;
    if (v26) {
      __int16 v27 = "mUSBInterface->Open() failed";
    }
    else {
      __int16 v27 = "mUSBInterface = NULL";
    }
    *(_DWORD *)&buf[14] = 139;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = a1;
    *(_WORD *)&buf[28] = 2080;
    unsigned int v76 = v27;
    int v28 = "%25s:%-5d [-] USBMIDIDevice(%p)::Initialize() - Failed: %s";
    __int16 v29 = v25;
    uint32_t v30 = 38;
LABEL_49:
    _os_log_impl(&def_F708, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
    return 0;
  }
  uint64_t v4 = sub_7054(a1[12]);
  a1[13] = v4;
  if (!v4)
  {
    sub_12008();
    uint64_t v33 = qword_2C148;
    if (!os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 144;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = a1;
    int v28 = "%25s:%-5d [-] USBMIDIDevice(%p)::Initialize() - Failed: GetPluginInterface() failed";
    goto LABEL_54;
  }
  *(_WORD *)((char *)a1 + 185) = 0;
  int v5 = sub_13088((uint64_t)a1);
  *((unsigned char *)a1 + 189) = v5;
  if (v5)
  {
    sub_12008();
    long long v6 = qword_2C148;
    if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 152;
      _os_log_impl(&def_F708, v6, OS_LOG_TYPE_INFO, "%25s:%-5d      phantom entity detected and will be excluded from portmap list", buf, 0x12u);
    }
  }
  (*(void (**)(void *, void))(*a1 + 120))(a1, *((unsigned __int8 *)a1 + 491));
  (*(void (**)(void *))(*a1 + 56))(a1);
  if (((*(uint64_t (**)(void *))(*a1 + 112))(a1) & 1) == 0
    && !(*(unsigned int (**)(void *))(*a1 + 104))(a1))
  {
    sub_12008();
    uint64_t v33 = qword_2C148;
    if (!os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 240;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = a1;
    int v28 = "%25s:%-5d [-] USBMIDIDevice(%p)::Initialize() encountered an error and is exiting prematurely.";
LABEL_54:
    __int16 v29 = v33;
    uint32_t v30 = 28;
    goto LABEL_49;
  }
  if (*(_DWORD *)(a1[10] + 28) == 3)
  {
    sub_12008();
    uint64_t v7 = qword_2C148;
    if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 159;
      _os_log_impl(&def_F708, v7, OS_LOG_TYPE_INFO, "%25s:%-5d      Using USB MIDI Driver v3.", buf, 0x12u);
    }
  }
  (*(void (**)(void *))(*a1 + 32))(a1);
  if (a1[17] != a1[18])
  {
    sub_1B4B8(buf, a1 + 8);
    __int16 v8 = *(std::__shared_weak_count **)&buf[8];
    *(void *)uint64_t v72 = *(void *)buf;
    *(void *)&v72[8] = *(void *)&buf[8];
    if (*(void *)&buf[8])
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 16), 1uLL, memory_order_relaxed);
      sub_11694(v8);
    }
    *(void *)buf = a1;
    sub_1B548((uint64_t)&v70, (uint64_t *)buf, v72);
  }
  if (a1[20] != a1[21])
  {
    sub_1B4B8(buf, a1 + 8);
    int v9 = *(std::__shared_weak_count **)&buf[8];
    *(void *)uint64_t v72 = *(void *)buf;
    *(void *)&v72[8] = *(void *)&buf[8];
    if (*(void *)&buf[8])
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 16), 1uLL, memory_order_relaxed);
      sub_11694(v9);
    }
    *(void *)buf = a1;
    sub_1B548((uint64_t)&v70, (uint64_t *)buf, v72);
  }
  uint64_t v10 = (unsigned __int8 *)a1[17];
  for (uint64_t i = (unsigned __int8 *)a1[18]; v10 != i; v10 += 8)
  {
    sub_12008();
    uint64_t v12 = qword_2C148;
    if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
    {
      if (v10[1]) {
        unsigned __int8 v13 = *v10 | 0x80;
      }
      else {
        unsigned __int8 v13 = *v10;
      }
      int v14 = v10[6];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 184;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v13;
      *(_WORD *)&buf[24] = 1024;
      *(_DWORD *)&buf[26] = v14;
      _os_log_impl(&def_F708, v12, OS_LOG_TYPE_INFO, "%25s:%-5d      Configuring USB In Endpoint: 0x%0x, pipeIndex:%d", buf, 0x1Eu);
    }
  }
  BOOL v15 = (unsigned __int8 *)a1[20];
  for (uint64_t j = (unsigned __int8 *)a1[21]; v15 != j; v15 += 8)
  {
    sub_12008();
    int v17 = qword_2C148;
    if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
    {
      if (v15[1]) {
        unsigned __int8 v18 = *v15 | 0x80;
      }
      else {
        unsigned __int8 v18 = *v15;
      }
      int v19 = v15[6];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 187;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v18;
      *(_WORD *)&buf[24] = 1024;
      *(_DWORD *)&buf[26] = v19;
      _os_log_impl(&def_F708, v17, OS_LOG_TYPE_INFO, "%25s:%-5d      Configuring USB Out Endpoint: 0x%0x, pipeIndex:%d", buf, 0x1Eu);
    }
  }
  uint64_t v20 = a1[17];
  uint64_t v21 = a1[18];
  if (v20 == v21)
  {
    BOOL v23 = 0;
  }
  else
  {
    uint64_t v22 = v20 + 8;
    do
    {
      BOOL v23 = *(unsigned __int8 *)(v22 - 1) == 255;
      BOOL v24 = *(unsigned __int8 *)(v22 - 1) == 255 || v22 == v21;
      v22 += 8;
    }
    while (!v24);
  }
  for (uint64_t k = a1[20]; k != a1[21]; k += 8)
  {
    if (*(unsigned __int8 *)(k + 7) == 255) {
      goto LABEL_61;
    }
  }
  if (!v23) {
    goto LABEL_103;
  }
LABEL_61:
  sub_12008();
  __int16 v35 = qword_2C148;
  if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 191;
    _os_log_impl(&def_F708, v35, OS_LOG_TYPE_INFO, "%25s:%-5d      MIDI-CI negotiation is necessary to determine initial protocol(s).", buf, 0x12u);
  }
  *((unsigned char *)a1 + 188) = 1;
  memset(buf, 0, 24);
  sub_1A440(buf, (uint64_t *)a1[20], (uint64_t *)a1[21], (uint64_t)(a1[21] - a1[20]) >> 3);
  unint64_t v36 = *(unsigned __int8 **)buf;
  if (*(void *)buf != *(void *)&buf[8])
  {
    while (v36[7] == 255)
    {
      v36 += 8;
      if (v36 == *(unsigned __int8 **)&buf[8]) {
        goto LABEL_73;
      }
    }
  }
  if (v36 != *(unsigned __int8 **)&buf[8])
  {
    sub_12008();
    unsigned int v37 = qword_2C148;
    if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v72 = 136315394;
      *(void *)&v72[4] = "USBMIDIDevice.cpp";
      *(_WORD *)&v72[12] = 1024;
      *(_DWORD *)&v72[14] = 197;
      _os_log_impl(&def_F708, v37, OS_LOG_TYPE_INFO, "%25s:%-5d      Culling endpoints with known protocols.", v72, 0x12u);
    }
    if (v36 + 8 != *(unsigned __int8 **)&buf[8])
    {
      uint64_t v38 = *(void *)buf;
      unsigned int v39 = &v36[-*(void *)buf];
      unint64_t v40 = (*(void *)&buf[8] - (void)v36) & 0xFFFFFFFFFFFFFFF8;
      memmove(v36, v36 + 8, v40 - 8);
      unint64_t v36 = &v39[v38 - 8 + v40];
    }
    *(void *)&buf[8] = v36;
  }
LABEL_73:
  sub_12008();
  unint64_t v41 = qword_2C148;
  if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v72 = 136315650;
    *(void *)&v72[4] = "USBMIDIDevice.cpp";
    *(_WORD *)&v72[12] = 1024;
    *(_DWORD *)&v72[14] = 202;
    __int16 v73 = 1024;
    int v74 = (*(void *)&buf[8] - *(void *)buf) >> 3;
    _os_log_impl(&def_F708, v41, OS_LOG_TYPE_INFO, "%25s:%-5d      Negotiating protocol for %u endpoint(s)...", v72, 0x18u);
  }
  unsigned int v42 = *(unsigned __int8 **)buf;
  uint64_t v43 = *(unsigned __int8 **)&buf[8];
  if (*(void *)buf != *(void *)&buf[8])
  {
    do
    {
      uint64_t v44 = a1[24];
      uint64_t v45 = a1[25];
      if (v44 != v45)
      {
        if (v42[1]) {
          unsigned __int8 v46 = *v42 | 0x80;
        }
        else {
          unsigned __int8 v46 = *v42;
        }
        while (*(unsigned __int8 *)(v44 + 3) != v46)
        {
          v44 += 8;
          if (v44 == v45) {
            goto LABEL_85;
          }
        }
      }
      if (v44 == v45) {
LABEL_85:
      }
        int v47 = 0;
      else {
        int v47 = *(unsigned __int8 *)(v44 + 2);
      }
      BOOL v48 = (unsigned char *)a1[17];
      int v49 = (unsigned char *)a1[18];
      if (v48 != v49)
      {
        while (1)
        {
          unsigned __int8 v50 = v48[1] ? *v48 | 0x80 : *v48;
          if (v47 == v50) {
            break;
          }
          v48 += 8;
          if (v48 == v49) {
            goto LABEL_99;
          }
        }
      }
      if (v48 != v49)
      {
        uint64_t v70 = *(void *)v48;
        if ((~v70 & 0xFF000000000000) != 0)
        {
          sub_1B4B8(&v71, a1 + 8);
          sub_1B8DC(&v71, v72);
          if (*((void *)&v71 + 1)) {
            sub_11694(*((std::__shared_weak_count **)&v71 + 1));
          }
          sub_13224(a1 + 14, (long long *)v72);
          if (*(void *)&v72[8]) {
            sub_11694(*(std::__shared_weak_count **)&v72[8]);
          }
        }
      }
LABEL_99:
      v42 += 8;
    }
    while (v42 != v43);
    unsigned int v42 = *(unsigned __int8 **)buf;
  }
  if (v42)
  {
    *(void *)&buf[8] = v42;
    operator delete(v42);
  }
LABEL_103:
  sub_12008();
  uint64_t v51 = qword_2C148;
  if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
  {
    uint64_t v52 = (a1[18] - a1[17]) >> 3;
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 213;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v52;
    _os_log_impl(&def_F708, v51, OS_LOG_TYPE_INFO, "%25s:%-5d      Priming %d input pipe(s)", buf, 0x18u);
  }
  if (a1[18] != a1[17])
  {
    unint64_t v53 = 0;
    do
    {
      uint64_t v54 = 0;
      char v55 = 1;
      do
      {
        char v56 = v55;
        unint64_t v57 = v54 | (2 * v53);
        uint64_t v58 = a1[34];
        if (v57 >= (a1[35] - v58) >> 4) {
          sub_104C8();
        }
        uint64_t v59 = a1[17];
        if (v53 >= (a1[18] - v59) >> 3) {
          sub_104C8();
        }
        *(unsigned char *)(*(void *)(v58 + 16 * v57) + 64) = *(unsigned char *)(v59 + 8 * v53 + 6);
        (*(void (**)(void *))(*a1 + 64))(a1);
        char v55 = 0;
        uint64_t v54 = 1;
      }
      while ((v56 & 1) != 0);
      ++v53;
    }
    while (v53 < (uint64_t)(a1[18] - a1[17]) >> 3);
  }
  (*(void (**)(void, void *))(*(void *)a1[10] + 152))(a1[10], a1);
  BOOL v60 = (uint64_t *)a1[14];
  uint64_t v61 = (uint64_t *)a1[15];
  if (v60 == v61) {
    goto LABEL_130;
  }
  do
  {
    if (*((unsigned char *)a1 + 492) || *((unsigned char *)a1 + 493))
    {
      sub_12008();
      int v62 = qword_2C148;
      if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
      {
        char v63 = "forcemidi1fallback";
        if (!*((unsigned char *)a1 + 492)) {
          char v63 = "forcemidi1upfallback";
        }
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 226;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = v63;
        _os_log_impl(&def_F708, v62, OS_LOG_TYPE_INFO, "%25s:%-5d [AQAMIDI] %s is set in defaults, so negotiation will be skipped.", buf, 0x1Cu);
      }
      uint64_t v64 = *v60;
      if (*(unsigned char *)(*v60 + 41)) {
        unsigned __int8 v65 = *(unsigned char *)(*v60 + 40) | 0x80;
      }
      else {
        unsigned __int8 v65 = *(unsigned char *)(*v60 + 40);
      }
      int v66 = *(unsigned __int8 *)(v64 + 49);
      unsigned __int8 v67 = *(unsigned char *)(v64 + 48);
      if (v66) {
        v67 |= 0x80u;
      }
      sub_13340((uint64_t)a1, v65, v67, 255);
    }
    else
    {
      sub_1DB10(*v60);
    }
    v60 += 2;
  }
  while (v60 != v61);
  if (a1[14] != a1[15]) {
    return 1;
  }
LABEL_130:
  uint64_t v31 = (*(uint64_t (**)(void *))(*a1 + 48))(a1);
  sub_12008();
  uint64_t v68 = qword_2C148;
  if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
  {
    int64_t v69 = "false";
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 236;
    *(_DWORD *)buf = 136315906;
    if (v31) {
      int64_t v69 = "true";
    }
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = a1;
    *(_WORD *)&buf[28] = 2080;
    unsigned int v76 = v69;
    _os_log_impl(&def_F708, v68, OS_LOG_TYPE_INFO, "%25s:%-5d [-] USBMIDIDevice(%p)::Initialize() = %s", buf, 0x26u);
  }
  return v31;
}

void sub_12FF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, std::__shared_weak_count *a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24)
{
  if (a20) {
    sub_11694(a20);
  }
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

ItemCount sub_13088(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 491)) {
    return 0;
  }
  ItemCount result = MIDIDeviceGetNumberOfEntities(*(_DWORD *)(a1 + 8));
  if (result)
  {
    SInt32 outValue = 0;
    ItemCount result = MIDIDeviceGetEntity(*(_DWORD *)(a1 + 8), (int)result - 1);
    if (result)
    {
      MIDIObjectGetIntegerProperty(result, kMIDIPropertyUMPCanTransmitGroupless, &outValue);
      return outValue != 0;
    }
  }
  return result;
}

void **sub_13108(uint64_t *a1, long long *a2)
{
  unint64_t v6 = a1[2];
  ItemCount result = (void **)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(result - 1);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v10 = ((uint64_t)v7 - *a1) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      sub_496C();
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
    int v14 = (char *)sub_1A270((uint64_t)result, v13);
    BOOL v15 = &v14[16 * v10];
    v18[0] = v14;
    v18[1] = v15;
    v18[3] = &v14[16 * v16];
    long long v17 = *a2;
    *(_OWORD *)BOOL v15 = *a2;
    if (*((void *)&v17 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v17 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    v18[2] = v15 + 16;
    sub_1A1F8(a1, v18);
    int v9 = (void *)a1[1];
    ItemCount result = sub_1A3B8(v18);
  }
  else
  {
    void *v7 = *(void *)a2;
    uint64_t v8 = *((void *)a2 + 1);
    v7[1] = v8;
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    int v9 = v7 + 2;
    a1[1] = (uint64_t)(v7 + 2);
  }
  a1[1] = (uint64_t)v9;
  return result;
}

void sub_13210(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1A3B8((void **)va);
  _Unwind_Resume(a1);
}

void **sub_13224(uint64_t *a1, long long *a2)
{
  unint64_t v6 = a1[2];
  ItemCount result = (void **)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(result - 1);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v10 = ((uint64_t)v7 - *a1) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      sub_496C();
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
    int v14 = (char *)sub_1A270((uint64_t)result, v13);
    BOOL v15 = &v14[16 * v10];
    v18[0] = v14;
    v18[1] = v15;
    v18[3] = &v14[16 * v16];
    long long v17 = *a2;
    *(_OWORD *)BOOL v15 = *a2;
    if (*((void *)&v17 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v17 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    v18[2] = v15 + 16;
    sub_1A4F8(a1, v18);
    int v9 = (void *)a1[1];
    ItemCount result = sub_1A3B8(v18);
  }
  else
  {
    void *v7 = *(void *)a2;
    uint64_t v8 = *((void *)a2 + 1);
    v7[1] = v8;
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    int v9 = v7 + 2;
    a1[1] = (uint64_t)(v7 + 2);
  }
  a1[1] = (uint64_t)v9;
  return result;
}

void sub_1332C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1A3B8((void **)va);
  _Unwind_Resume(a1);
}

void sub_13340(uint64_t a1, int a2, int a3, int a4)
{
  if (*(unsigned char *)(a1 + 492))
  {
    *(unsigned char *)(a1 + 188) = 0;
    sub_12008();
    uint64_t v7 = qword_2C148;
    if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = "[AQAMIDI] defaults value midi1fallback is set";
      int v9 = *(unsigned __int8 *)(a1 + 492);
      uint64_t v38 = "USBMIDIDevice.cpp";
      int v37 = 136316162;
      __int16 v39 = 1024;
      if (!v9) {
        uint64_t v8 = (const char *)&unk_22591;
      }
      int v40 = 989;
      __int16 v41 = 1024;
      *(_DWORD *)unsigned int v42 = a2;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = a3;
      __int16 v43 = 2080;
      uint64_t v44 = v8;
      _os_log_impl(&def_F708, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d [!] USBMIDIDevice::NegotiationCompleteForEndpoint(inEP: 0x%x, outEP: 0x%x) failed %s", (uint8_t *)&v37, 0x28u);
    }
    int v10 = sub_13958(a1);
    sub_12008();
    uint64_t v11 = qword_2C148;
    BOOL v12 = os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (!v12) {
        return;
      }
      int v37 = 136315906;
      uint64_t v38 = "USBMIDIDevice.cpp";
      __int16 v39 = 1024;
      int v40 = 991;
      __int16 v41 = 1024;
      *(_DWORD *)unsigned int v42 = a2;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = a3;
      unint64_t v13 = "%25s:%-5d [-] USBMIDIDevice::NegotiationCompleteForEndpoints(inEP: 0x%x, outEP: 0x%x) - Successfully fell ba"
            "ck to MIDI 1.0 after failure.";
    }
    else
    {
      if (!v12) {
        return;
      }
      int v37 = 136315906;
      uint64_t v38 = "USBMIDIDevice.cpp";
      __int16 v39 = 1024;
      int v40 = 993;
      __int16 v41 = 1024;
      *(_DWORD *)unsigned int v42 = a2;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = a3;
      unint64_t v13 = "%25s:%-5d [!] USBMIDIDevice::NegotiationCompleteForEndpoints(inEP: 0x%x, outEP: 0x%x) - MIDI 1.0 fallback failed.";
    }
    long long v17 = v11;
    os_log_type_t v18 = OS_LOG_TYPE_INFO;
    uint32_t v19 = 30;
    goto LABEL_16;
  }
  int v14 = a4;
  if (a4 == 255)
  {
    int v15 = *(unsigned __int8 *)(a1 + 493);
    sub_12008();
    uint64_t v16 = qword_2C148;
    if (v15)
    {
      int v14 = 1;
      if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
      {
        int v37 = 136315394;
        uint64_t v38 = "USBMIDIDevice.cpp";
        __int16 v39 = 1024;
        int v40 = 999;
        _os_log_impl(&def_F708, v16, OS_LOG_TYPE_INFO, "%25s:%-5d * * * [AQAMIDI] Protocol negotiation skipped because of defaults. Forcing MIDI-1UP as default protocol. * * *", (uint8_t *)&v37, 0x12u);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_ERROR))
      {
        int v37 = 136315394;
        uint64_t v38 = "USBMIDIDevice.cpp";
        __int16 v39 = 1024;
        int v40 = 1001;
        _os_log_impl(&def_F708, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d * * * [AQAMIDI] Protocol negotiation timed out. Using MIDI-1UP as default protocol. * * *", (uint8_t *)&v37, 0x12u);
      }
      int v14 = 1;
    }
  }
  sub_12008();
  uint64_t v20 = qword_2C148;
  if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
  {
    int v37 = 136315906;
    uint64_t v38 = "USBMIDIDevice.cpp";
    __int16 v39 = 1024;
    int v40 = 1004;
    __int16 v41 = 1024;
    *(_DWORD *)unsigned int v42 = a2;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = a3;
    _os_log_impl(&def_F708, v20, OS_LOG_TYPE_INFO, "%25s:%-5d [*] USBMIDIDevice::NegotiationCompleteForEndpoints(inEP: 0x%x, outEP: 0x%x)", (uint8_t *)&v37, 0x1Eu);
  }
  uint64_t v21 = *(unsigned char **)(a1 + 136);
  uint64_t v22 = *(unsigned char **)(a1 + 144);
  BOOL v23 = v21;
  if (v21 != v22)
  {
    BOOL v23 = *(unsigned char **)(a1 + 136);
    while (1)
    {
      unsigned __int8 v24 = v23[1] ? *v23 | 0x80 : *v23;
      if (a2 == v24) {
        break;
      }
      v23 += 8;
      if (v23 == v22) {
        goto LABEL_54;
      }
    }
  }
  if (v22 != v23)
  {
    v23[7] = v14;
    uint64_t v26 = *(unsigned char **)(a1 + 160);
    uint64_t v25 = *(unsigned char **)(a1 + 168);
    __int16 v27 = v26;
    if (v26 != v25)
    {
      while (1)
      {
        unsigned __int8 v28 = v27[1] ? *v27 | 0x80 : *v27;
        if (a3 == v28) {
          break;
        }
        v27 += 8;
        if (v27 == v25) {
          goto LABEL_54;
        }
      }
    }
    if (v25 != v27)
    {
      v27[7] = v14;
      while (v21 != v22)
      {
        if (v21[7] == 255)
        {
          BOOL v30 = 1;
          goto LABEL_53;
        }
        v21 += 8;
      }
      if (v26 == v25)
      {
        BOOL v30 = 0;
      }
      else
      {
        __int16 v29 = v26 + 8;
        do
        {
          BOOL v30 = *(v29 - 1) == 255;
          BOOL v31 = *(v29 - 1) == 255 || v29 == v25;
          v29 += 8;
        }
        while (!v31);
      }
LABEL_53:
      *(unsigned char *)(a1 + 188) = v30;
    }
  }
LABEL_54:
  if (!*(unsigned char *)(a1 + 188))
  {
    sub_12008();
    unsigned int v32 = qword_2C148;
    if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
    {
      int v37 = 136315394;
      uint64_t v38 = "USBMIDIDevice.cpp";
      __int16 v39 = 1024;
      int v40 = 1019;
      _os_log_impl(&def_F708, v32, OS_LOG_TYPE_INFO, "%25s:%-5d ============================================", (uint8_t *)&v37, 0x12u);
    }
    sub_12008();
    uint64_t v33 = qword_2C148;
    if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
    {
      BOOL v34 = "MIDI-1UP";
      uint64_t v38 = "USBMIDIDevice.cpp";
      int v37 = 136315650;
      if (v14 == 2) {
        BOOL v34 = "MIDI 2.0";
      }
      __int16 v39 = 1024;
      int v40 = 1020;
      __int16 v41 = 2080;
      *(void *)unsigned int v42 = v34;
      _os_log_impl(&def_F708, v33, OS_LOG_TYPE_INFO, "%25s:%-5d == [AQAMIDI] Protocol changed to %s ==", (uint8_t *)&v37, 0x1Cu);
    }
    sub_12008();
    __int16 v35 = qword_2C148;
    if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
    {
      int v37 = 136315394;
      uint64_t v38 = "USBMIDIDevice.cpp";
      __int16 v39 = 1024;
      int v40 = 1021;
      _os_log_impl(&def_F708, v35, OS_LOG_TYPE_INFO, "%25s:%-5d ============================================", (uint8_t *)&v37, 0x12u);
    }
    if (((*(uint64_t (**)(uint64_t))(*(void *)a1 + 48))(a1) & 1) == 0)
    {
      sub_12008();
      uint64_t v36 = qword_2C148;
      if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_ERROR))
      {
        int v37 = 136315394;
        uint64_t v38 = "USBMIDIDevice.cpp";
        __int16 v39 = 1024;
        int v40 = 1024;
        unint64_t v13 = "%25s:%-5d [!] USBMIDIDevice::NegotiationCompleteForEndpoint() - unable to start I/O";
        long long v17 = v36;
        os_log_type_t v18 = OS_LOG_TYPE_ERROR;
        uint32_t v19 = 18;
LABEL_16:
        _os_log_impl(&def_F708, v17, v18, v13, (uint8_t *)&v37, v19);
      }
    }
  }
}

uint64_t sub_13958(uint64_t a1)
{
  *(unsigned char *)(a1 + 491) = 0;
  sub_12008();
  uint64_t v2 = qword_2C148;
  if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    __int16 v38 = 1024;
    int v39 = 248;
    _os_log_impl(&def_F708, v2, OS_LOG_TYPE_INFO, "%25s:%-5d * * * [AQAMIDI] MIDI protocol negotiation failed. Falling back to USB MIDI 1.0 configuration * * *", buf, 0x12u);
  }
  int NumberOfEntities = MIDIDeviceGetNumberOfEntities(*(_DWORD *)(a1 + 8));
  ItemCount v4 = (NumberOfEntities - 1);
  if (NumberOfEntities - 1 >= 0)
  {
    do
    {
      MIDIEntityRef Entity = MIDIDeviceGetEntity(*(_DWORD *)(a1 + 8), v4);
      MIDIDeviceRemoveEntity(*(_DWORD *)(a1 + 8), Entity);
      --v4;
      --NumberOfEntities;
    }
    while (NumberOfEntities);
  }
  sub_12008();
  unint64_t v6 = qword_2C148;
  if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    __int16 v38 = 1024;
    int v39 = 256;
    _os_log_impl(&def_F708, v6, OS_LOG_TYPE_INFO, "%25s:%-5d [+] USBMIDIDevice::InitializeFallback() - probing device", buf, 0x12u);
  }
  sub_D4E8(*(void *)(a1 + 88), *(void *)(a1 + 96), (uint64_t)buf);
  if (*(void *)buf)
  {
    sub_12008();
    uint64_t v7 = qword_2C148;
    if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v36 = 136315394;
      *(void *)&void v36[4] = "USBMIDIDevice.cpp";
      *(_WORD *)&v36[12] = 1024;
      *(_DWORD *)&v36[14] = 260;
      _os_log_impl(&def_F708, v7, OS_LOG_TYPE_INFO, "%25s:%-5d      Creating fallback port map list", v36, 0x12u);
    }
    sub_D8A4(1, (uint64_t)buf, (uint64_t *)v36);
    sub_12008();
    uint64_t v8 = qword_2C148;
    if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)BOOL v30 = 136315394;
      BOOL v31 = "USBMIDIDevice.cpp";
      __int16 v32 = 1024;
      int v33 = 264;
      _os_log_impl(&def_F708, v8, OS_LOG_TYPE_INFO, "%25s:%-5d      Setting alternate interface to 0", v30, 0x12u);
    }
    (*(void (**)(void, void))(**(void **)(a1 + 104) + 176))(*(void *)(a1 + 104), 0);
    uint64_t v9 = *(void *)(a1 + 160);
    uint64_t v10 = *(void *)(a1 + 168);
    while (v9 != v10)
    {
      *(unsigned char *)(v9 + 7) = 0;
      (*(void (**)(void, void))(**(void **)(a1 + 104) + 224))(*(void *)(a1 + 104), *(unsigned __int8 *)(v9 + 6));
      v9 += 8;
    }
    sub_12008();
    uint64_t v11 = qword_2C148;
    if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = (*(void *)(a1 + 144) - *(void *)(a1 + 136)) >> 3;
      *(_DWORD *)BOOL v30 = 136315650;
      BOOL v31 = "USBMIDIDevice.cpp";
      __int16 v32 = 1024;
      int v33 = 271;
      __int16 v34 = 1024;
      int v35 = v12;
      _os_log_impl(&def_F708, v11, OS_LOG_TYPE_INFO, "%25s:%-5d      Priming %d input pipe(s)", v30, 0x18u);
    }
    uint64_t v13 = *(void *)(a1 + 136);
    uint64_t v14 = *(void *)(a1 + 144);
    if (v13 != v14)
    {
      uint64_t v15 = 0;
      do
      {
        uint64_t v16 = 0;
        *(unsigned char *)(v13 + 7) = 0;
        char v17 = 1;
        do
        {
          char v18 = v17;
          unint64_t v19 = v16 | (2 * v15);
          uint64_t v20 = *(void *)(a1 + 272);
          if (v19 >= (*(void *)(a1 + 280) - v20) >> 4) {
            sub_104C8();
          }
          uint64_t v21 = *(void *)(v20 + 16 * v19);
          *(unsigned char *)(v21 + 64) = *(unsigned char *)(v13 + 6);
          (*(void (**)(void))(**(void **)(a1 + 104) + 224))(*(void *)(a1 + 104));
          (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 64))(a1, v21);
          char v17 = 0;
          uint64_t v16 = 1;
        }
        while ((v18 & 1) != 0);
        ++v15;
        v13 += 8;
      }
      while (v13 != v14);
    }
    uint64_t v23 = *(void *)(a1 + 88);
    uint64_t v22 = *(void *)(a1 + 96);
    CFStringRef v24 = (const __CFString *)(*(uint64_t (**)(void))(**(void **)(a1 + 80) + 112))(*(void *)(a1 + 80));
    CFStringRef v25 = (const __CFString *)(*(uint64_t (**)(void))(**(void **)(a1 + 80) + 96))(*(void *)(a1 + 80));
    CFStringRef v26 = (const __CFString *)(*(uint64_t (**)(void))(**(void **)(a1 + 80) + 104))(*(void *)(a1 + 80));
    LODWORD(v23) = sub_D780(v23, v22, v24, v25, v26, *(_DWORD *)(a1 + 8), (uint64_t *)v36, (uint64_t *)v40, v41, v42);
    sub_12008();
    __int16 v27 = qword_2C148;
    if (v23)
    {
      if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)BOOL v30 = 136315394;
        BOOL v31 = "USBMIDIDevice.cpp";
        __int16 v32 = 1024;
        int v33 = 287;
        _os_log_impl(&def_F708, v27, OS_LOG_TYPE_INFO, "%25s:%-5d [-] USBMIDIDevice::InitializeFallback() - device configured. Starting I/O.", v30, 0x12u);
      }
      uint64_t v28 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 48))(a1);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)BOOL v30 = 136315394;
        BOOL v31 = "USBMIDIDevice.cpp";
        __int16 v32 = 1024;
        int v33 = 290;
        _os_log_impl(&def_F708, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d [!] USBMIDIDevice::InitializeFallback() - could not configure device", v30, 0x12u);
      }
      uint64_t v28 = 0;
    }
    if (*(void *)v36)
    {
      *(void *)&v36[8] = *(void *)v36;
      operator delete(*(void **)v36);
    }
  }
  else
  {
    uint64_t v28 = 0;
  }
  if (__p)
  {
    uint64_t v44 = __p;
    operator delete(__p);
  }
  if (v42[0])
  {
    v42[1] = v42[0];
    operator delete(v42[0]);
  }
  if (v41[0])
  {
    v41[1] = v41[0];
    operator delete(v41[0]);
  }
  if (v40[0])
  {
    v40[1] = v40[0];
    operator delete(v40[0]);
  }
  return v28;
}

void sub_13F38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  if (__p) {
    operator delete(__p);
  }
  sub_D71C(&a19);
  _Unwind_Resume(a1);
}

void sub_13F7C(uint64_t a1)
{
  CFRunLoopRef v2 = MIDIGetDriverIORunLoop();
  CFRunLoopSourceRef source = 0;
  if (!v2) {
    goto LABEL_11;
  }
  uint64_t v3 = v2;
  ItemCount v4 = (__CFRunLoopSource *)(*(uint64_t (**)(void))(**(void **)(a1 + 104) + 40))(*(void *)(a1 + 104));
  CFRunLoopSourceRef source = v4;
  BOOL v5 = v4 == 0;
  if (!v4)
  {
    if ((*(unsigned int (**)(void, CFRunLoopSourceRef *))(**(void **)(a1 + 104) + 32))(*(void *)(a1 + 104), &source))
    {
      BOOL v6 = 1;
    }
    else
    {
      BOOL v6 = source == 0;
    }
    if (!v6)
    {
      sub_12008();
      uint64_t v7 = qword_2C148;
      BOOL v8 = os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_DEBUG);
      ItemCount v4 = source;
      if (v8)
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v13 = "USBMIDIDevice.cpp";
        __int16 v14 = 1024;
        int v15 = 307;
        __int16 v16 = 2048;
        uint64_t v17 = a1;
        __int16 v18 = 2048;
        CFRunLoopSourceRef v19 = source;
        _os_log_impl(&def_F708, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d [*] USBMIDIDevice(%p)::RegisterAsyncSource() created CFRunLoopSource %p", buf, 0x26u);
        ItemCount v4 = source;
      }
      goto LABEL_9;
    }
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
LABEL_9:
  if (!CFRunLoopContainsSource(v3, v4, kCFRunLoopDefaultMode)) {
    CFRunLoopAddSource(v3, source, kCFRunLoopDefaultMode);
  }
LABEL_12:
  sub_12008();
  uint64_t v9 = qword_2C148;
  if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = "failure";
    uint64_t v13 = "USBMIDIDevice.cpp";
    __int16 v14 = 1024;
    int v15 = 313;
    *(_DWORD *)buf = 136315906;
    if (v5) {
      uint64_t v10 = "success";
    }
    __int16 v16 = 2048;
    uint64_t v17 = a1;
    __int16 v18 = 2080;
    CFRunLoopSourceRef v19 = (CFRunLoopSourceRef)v10;
    _os_log_impl(&def_F708, v9, OS_LOG_TYPE_INFO, "%25s:%-5d [*] USBMIDIDevice(%p)::RegisterAsyncSource() = %s", buf, 0x26u);
  }
}

void sub_14184(uint64_t a1)
{
  CFRunLoopRef v2 = MIDIGetDriverIORunLoop();
  uint64_t v3 = *(void *)(a1 + 104);
  if (v3) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    BOOL v5 = (__CFRunLoopSource *)(*(uint64_t (**)(uint64_t))(*(void *)v3 + 40))(v3);
    if (v5)
    {
      BOOL v6 = v5;
      if (CFRunLoopContainsSource(v2, v5, kCFRunLoopDefaultMode)) {
        CFRunLoopRemoveSource(v2, v6, kCFRunLoopDefaultMode);
      }
    }
  }
  sub_12008();
  uint64_t v7 = qword_2C148;
  if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    uint64_t v9 = "USBMIDIDevice.cpp";
    __int16 v10 = 1024;
    int v11 = 326;
    __int16 v12 = 2048;
    uint64_t v13 = a1;
    _os_log_impl(&def_F708, v7, OS_LOG_TYPE_INFO, "%25s:%-5d [*] USBMIDIDevice(%p)::UnregisterAsyncSource()", (uint8_t *)&v8, 0x1Cu);
  }
}

uint64_t sub_142B0(uint64_t a1)
{
  sub_12008();
  CFRunLoopRef v2 = qword_2C148;
  if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
  {
    v7.protocol = 136315650;
    *(void *)&v7.numPackets = "USBMIDIDevice.cpp";
    WORD2(v7.packet[0].timeStamp) = 1024;
    *(_DWORD *)((char *)&v7.packet[0].timeStamp + 6) = 331;
    HIWORD(v7.packet[0].wordCount) = 2048;
    *(void *)v7.packet[0].words = a1;
    _os_log_impl(&def_F708, v2, OS_LOG_TYPE_INFO, "%25s:%-5d [+] USBMIDIDevice(%p)::StartIO()", (uint8_t *)&v7, 0x1Cu);
  }
  *(void *)(a1 + 480) = MIDITimerTaskCreate();
  (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 24))(a1, 1);
  if (*(unsigned char *)(a1 + 491))
  {
    uint64_t v3 = MIDIEventListInit(&v7, kMIDIProtocol_2_0);
    v7.numPackets = 1;
    v3->timeStamp = 0;
    *(void *)&v3->wordCount = 0x3000000000000002;
    v3->words[1] = 0;
    (*(void (**)(uint64_t, MIDIEventList *, void))(*(void *)a1 + 96))(a1, &v7, 0);
  }
  else
  {
    v7.protocol = kMIDIProtocol_1_0;
    *(void *)&v7.numPackets = 0;
    HIDWORD(v7.packet[0].timeStamp) = -135266302;
    (*(void (**)(uint64_t, MIDIEventList *, void))(*(void *)a1 + 88))(a1, &v7, 0);
  }
  sub_12008();
  BOOL v4 = qword_2C148;
  if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
  {
    v7.protocol = 136315394;
    *(void *)&v7.numPackets = "USBMIDIDevice.cpp";
    WORD2(v7.packet[0].timeStamp) = 1024;
    *(_DWORD *)((char *)&v7.packet[0].timeStamp + 6) = 357;
    _os_log_impl(&def_F708, v4, OS_LOG_TYPE_INFO, "%25s:%-5d      bringing initialized device online...", (uint8_t *)&v7, 0x12u);
  }
  MIDIObjectSetIntegerProperty(*(_DWORD *)(a1 + 8), kMIDIPropertyOffline, 0);
  sub_12008();
  BOOL v5 = qword_2C148;
  if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
  {
    v7.protocol = 136315650;
    *(void *)&v7.numPackets = "USBMIDIDevice.cpp";
    WORD2(v7.packet[0].timeStamp) = 1024;
    *(_DWORD *)((char *)&v7.packet[0].timeStamp + 6) = 360;
    HIWORD(v7.packet[0].wordCount) = 2048;
    *(void *)v7.packet[0].words = a1;
    _os_log_impl(&def_F708, v5, OS_LOG_TYPE_INFO, "%25s:%-5d [-] USBMIDIDevice(%p)::StartIO() = true", (uint8_t *)&v7, 0x1Cu);
  }
  return 1;
}

unsigned char *sub_14554(uint64_t a1)
{
  uint64_t v3 = a1 + 344;
  char v4 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 344) + 16))(a1 + 344);
  *(unsigned char *)(a1 + 488) = 0;
  if (!*(unsigned char *)(a1 + 184)) {
    (*(void (**)(uint64_t))(*(void *)a1 + 72))(a1);
  }
  return sub_9578(&v3);
}

void sub_145E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void *sub_145FC(void *a1, uint64_t a2, uint64_t a3)
{
  *a1 = off_289E0;
  if (!*((unsigned char *)a1 + 184))
  {
    sub_12008();
    char v4 = qword_2C148;
    if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
    {
      int v5 = *((unsigned __int8 *)a1 + 185);
      BOOL v6 = "Input";
      *(void *)&v37[4] = "USBMIDIDevice.cpp";
      int v7 = *((unsigned __int8 *)a1 + 186);
      BOOL v18 = v5 == 0;
      __int16 v38 = 1024;
      int v39 = 369;
      int v8 = "Output";
      if (v18) {
        BOOL v6 = "N/A";
      }
      *(_DWORD *)int v37 = 136316162;
      __int16 v40 = 2048;
      if (!v7) {
        int v8 = "N/A";
      }
      __int16 v41 = a1;
      __int16 v42 = 2080;
      __int16 v43 = v6;
      __int16 v44 = 2080;
      uint64_t v45 = v8;
      _os_log_impl(&def_F708, v4, OS_LOG_TYPE_INFO, "%25s:%-5d [+] USBMIDIDevice(%p)::~USBMIDIDevice() - Halting I/O chain for: %s and %s", v37, 0x30u);
    }
    (*(void (**)(void *, void))(*a1 + 24))(a1, 0);
    if (((*(uint64_t (**)(void *))(*a1 + 112))(a1) & 1) != 0
      || (*(unsigned int (**)(void *))(*a1 + 104))(a1))
    {
      (*(void (**)(void, void *))(*(void *)a1[10] + 160))(a1[10], a1);
    }
    *((unsigned char *)a1 + 184) = 1;
    uint64_t v9 = a1[20];
    uint64_t v10 = a1[21];
    while (v9 != v10)
    {
      (*(void (**)(void, void))(*(void *)a1[13] + 224))(a1[13], *(unsigned __int8 *)(v9 + 6));
      v9 += 8;
    }
    uint64_t v11 = a1[17];
    uint64_t v12 = a1[18];
    while (v11 != v12)
    {
      (*(void (**)(void, void))(*(void *)a1[13] + 224))(a1[13], *(unsigned __int8 *)(v11 + 6));
      v11 += 8;
    }
    unsigned int v13 = 199;
    do
    {
      uint64_t v15 = a1[34];
      uint64_t v14 = a1[35];
      if (v15 == v14)
      {
        BOOL v17 = 0;
      }
      else
      {
        uint64_t v16 = v15 + 16;
        do
        {
          BOOL v17 = *(unsigned char *)(*(void *)(v16 - 16) + 44) != 0;
          if (*(unsigned char *)(*(void *)(v16 - 16) + 44)) {
            BOOL v18 = 1;
          }
          else {
            BOOL v18 = v16 == v14;
          }
          v16 += 16;
        }
        while (!v18);
      }
      for (uint64_t i = a1[37]; i != a1[38]; i += 16)
      {
        if (*(unsigned char *)(*(void *)i + 44))
        {
          int v20 = 1;
          goto LABEL_34;
        }
      }
      int v20 = 0;
      BOOL v21 = 0;
      if (!v17) {
        break;
      }
LABEL_34:
      usleep(0x2710u);
      BOOL v21 = v17;
    }
    while (v13-- >= 2);
    if ((v20 & 1) != 0 || v21)
    {
      sub_12008();
      uint64_t v23 = qword_2C148;
      if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v24 = "complete";
        *(void *)&v37[4] = "USBMIDIDevice.cpp";
        __int16 v38 = 1024;
        int v39 = 407;
        __int16 v40 = 2048;
        if (v21) {
          CFStringRef v25 = "pending";
        }
        else {
          CFStringRef v25 = "complete";
        }
        *(_DWORD *)int v37 = 136316162;
        __int16 v41 = a1;
        if (v20) {
          CFStringRef v24 = "pending";
        }
        __int16 v42 = 2080;
        __int16 v43 = v25;
        __int16 v44 = 2080;
        uint64_t v45 = v24;
        _os_log_impl(&def_F708, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d [!] USBMIDIDevice(%p)::~USBMIDIDevice() Input:%s Output:%s", v37, 0x30u);
      }
    }
    sub_1A1AC(a1 + 34);
    sub_1A1AC(a1 + 37);
    (*(void (**)(void *))(*a1 + 40))(a1);
    if (a1[60]) {
      MIDITimerTaskDispose();
    }
  }
  if (a1[13])
  {
    uint64_t v26 = a1[12];
    if (v26)
    {
      sub_72DC(v26, a2, a3);
      operator delete();
    }
  }
  uint64_t v27 = a1[11];
  if (v27)
  {
    sub_60F4(v27);
    operator delete();
  }
  sub_12008();
  uint64_t v28 = qword_2C148;
  if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int v37 = 136315650;
    *(void *)&v37[4] = "USBMIDIDevice.cpp";
    __int16 v38 = 1024;
    int v39 = 431;
    __int16 v40 = 2048;
    __int16 v41 = a1;
    _os_log_impl(&def_F708, v28, OS_LOG_TYPE_INFO, "%25s:%-5d [-] USBMIDIDevice(%p)::~USBMIDIDevice()", v37, 0x1Cu);
  }
  *(void *)int v37 = a1 + 57;
  sub_1A020((void ***)v37);
  sub_1A0A4(a1 + 54);
  sub_5D18((uint64_t)(a1 + 43));
  *(void *)int v37 = a1 + 40;
  sub_1A158((void ***)v37);
  *(void *)int v37 = a1 + 37;
  sub_1A158((void ***)v37);
  *(void *)int v37 = a1 + 34;
  sub_1A158((void ***)v37);
  __int16 v29 = (std::__shared_weak_count *)a1[33];
  if (v29) {
    sub_11694(v29);
  }
  BOOL v30 = (std::__shared_weak_count *)a1[31];
  if (v30) {
    sub_11694(v30);
  }
  BOOL v31 = (std::__shared_weak_count *)a1[29];
  if (v31) {
    sub_11694(v31);
  }
  __int16 v32 = (void *)a1[24];
  if (v32)
  {
    a1[25] = v32;
    operator delete(v32);
  }
  int v33 = (void *)a1[20];
  if (v33)
  {
    a1[21] = v33;
    operator delete(v33);
  }
  __int16 v34 = (void *)a1[17];
  if (v34)
  {
    a1[18] = v34;
    operator delete(v34);
  }
  *(void *)int v37 = a1 + 14;
  sub_1A158((void ***)v37);
  int v35 = (std::__shared_weak_count *)a1[9];
  if (v35) {
    std::__shared_weak_count::__release_weak(v35);
  }
  sub_20C10(a1);
  return a1;
}

void sub_14B50(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_45C4(a1);
}

void sub_14B74(void *a1, uint64_t a2, uint64_t a3)
{
  sub_145FC(a1, a2, a3);

  operator delete();
}

void sub_14BAC(uint64_t a1, int a2)
{
  if (*(unsigned char *)(a1 + 491))
  {
    *(_DWORD *)(a1 + 12) = MIDIDeviceGetNumberOfEntities(*(_DWORD *)(a1 + 8));
    MIDIDeviceRef v4 = *(_DWORD *)(a1 + 8);
    sub_1C61C(a2, (void *)a1, v4, (void *)(a1 + 192), a1 + 16, (char **)(a1 + 40));
  }
  else
  {
    sub_20C78(a1, a2);
  }
}

void sub_14C30(uint64_t a1)
{
}

void sub_14C48(uint64_t a1, uint64_t a2, unsigned __int8 **a3, void **a4, void **a5)
{
  unsigned __int8 v57 = 0;
  if (a1 && a2)
  {
    int v9 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(void *)a2 + 152))(a2, &v57);
    sub_12008();
    uint64_t v10 = qword_2C148;
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v59 = "USBMIDIDevice.cpp";
        __int16 v60 = 1024;
        int v61 = 496;
        __int16 v62 = 1024;
        int v63 = v9;
        _os_log_impl(&def_F708, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d [!] USBMIDIDevice::FindPipes: failed (0x%x)", buf, 0x18u);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v59 = "USBMIDIDevice.cpp";
        __int16 v60 = 1024;
        int v61 = 464;
        __int16 v62 = 1024;
        int v63 = v57;
        _os_log_impl(&def_F708, v10, OS_LOG_TYPE_INFO, "%25s:%-5d [*] USBMIDIDevice::FindPipes() -- interface has %d endpoints", buf, 0x18u);
      }
      if (v57)
      {
        int v11 = 1;
        int v12 = 1;
        while (1)
        {
          WORD2(v56) = 0;
          BYTE6(v56) = -1;
          int v13 = sub_74E4(a1, v11, (uint64_t)&v56);
          sub_12008();
          uint64_t v14 = qword_2C148;
          BOOL v15 = os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO);
          if (v13) {
            break;
          }
          if (v15)
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v59 = "USBMIDIDevice.cpp";
            __int16 v60 = 1024;
            int v61 = 469;
            __int16 v62 = 1024;
            int v63 = v56;
            __int16 v64 = 1024;
            int v65 = BYTE1(v56);
            _os_log_impl(&def_F708, v14, OS_LOG_TYPE_INFO, "%25s:%-5d      Got pipe 0x%x direction %d", buf, 0x1Eu);
          }
          unsigned __int8 v16 = v56;
          if (BYTE1(v56)) {
            unsigned __int8 v16 = v56 | 0x80;
          }
          for (uint64_t i = *a3; ; i += 8)
          {
            if (i == a3[1])
            {
              HIBYTE(v56) = 0;
              goto LABEL_19;
            }
            if (i[2] == v16 || i[3] == v16) {
              break;
            }
          }
          int v31 = i[4];
          HIBYTE(v56) = v31;
          if (v31 <= 1)
          {
            if (v31)
            {
              sub_12008();
              uint64_t v32 = qword_2C148;
              if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
              {
                if (BYTE1(v56)) {
                  int v33 = v56 | 0x80;
                }
                else {
                  int v33 = v56;
                }
                *(_DWORD *)buf = 136316162;
                uint64_t v59 = "USBMIDIDevice.cpp";
                __int16 v60 = 1024;
                int v61 = 474;
                __int16 v62 = 1024;
                int v63 = v11;
                __int16 v64 = 1024;
                int v65 = v56;
                __int16 v66 = 1024;
                int v67 = v33;
                int v20 = v32;
                BOOL v21 = "%25s:%-5d      Found pipeIndex %d, pipeNum %d [ep 0x%00x] (MIDI-1UP)";
LABEL_24:
                _os_log_impl(&def_F708, v20, OS_LOG_TYPE_INFO, v21, buf, 0x24u);
                goto LABEL_25;
              }
              goto LABEL_25;
            }
LABEL_19:
            sub_12008();
            uint64_t v18 = qword_2C148;
            if (!os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO)) {
              goto LABEL_25;
            }
            if (BYTE1(v56)) {
              int v19 = v56 | 0x80;
            }
            else {
              int v19 = v56;
            }
            *(_DWORD *)buf = 136316162;
            uint64_t v59 = "USBMIDIDevice.cpp";
            __int16 v60 = 1024;
            int v61 = 472;
            __int16 v62 = 1024;
            int v63 = v11;
            __int16 v64 = 1024;
            int v65 = v56;
            __int16 v66 = 1024;
            int v67 = v19;
            int v20 = v18;
            BOOL v21 = "%25s:%-5d      Found pipeIndex %d, pipeNum %d [ep 0x%00x] (legacy MIDI 1.0)";
            goto LABEL_24;
          }
          if (v31 == 2)
          {
            sub_12008();
            uint64_t v46 = qword_2C148;
            if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
            {
              if (BYTE1(v56)) {
                int v47 = v56 | 0x80;
              }
              else {
                int v47 = v56;
              }
              *(_DWORD *)buf = 136316162;
              uint64_t v59 = "USBMIDIDevice.cpp";
              __int16 v60 = 1024;
              int v61 = 476;
              __int16 v62 = 1024;
              int v63 = v11;
              __int16 v64 = 1024;
              int v65 = v56;
              __int16 v66 = 1024;
              int v67 = v47;
              int v20 = v46;
              BOOL v21 = "%25s:%-5d      Found pipeIndex %d, pipeNum %d [ep 0x%00x] (MIDI 2.0)";
              goto LABEL_24;
            }
          }
          else if (v31 == 255)
          {
            sub_12008();
            uint64_t v44 = qword_2C148;
            if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
            {
              if (BYTE1(v56)) {
                int v45 = v56 | 0x80;
              }
              else {
                int v45 = v56;
              }
              *(_DWORD *)buf = 136316162;
              uint64_t v59 = "USBMIDIDevice.cpp";
              __int16 v60 = 1024;
              int v61 = 478;
              __int16 v62 = 1024;
              int v63 = v11;
              __int16 v64 = 1024;
              int v65 = v56;
              __int16 v66 = 1024;
              int v67 = v45;
              int v20 = v44;
              BOOL v21 = "%25s:%-5d      Found pipeIndex %d, pipeNum %d [ep 0x%00x] (Use MIDI-CI to discover protocol)";
              goto LABEL_24;
            }
          }
LABEL_25:
          if (BYTE1(v56) == 1)
          {
            uint64_t v26 = a4[1];
            unint64_t v25 = (unint64_t)a4[2];
            if ((unint64_t)v26 >= v25)
            {
              uint64_t v39 = ((char *)v26 - (unsigned char *)*a4) >> 3;
              if ((unint64_t)(v39 + 1) >> 61) {
                sub_496C();
              }
              uint64_t v40 = v25 - (void)*a4;
              uint64_t v41 = v40 >> 2;
              if (v40 >> 2 <= (unint64_t)(v39 + 1)) {
                uint64_t v41 = v39 + 1;
              }
              if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v42 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v42 = v41;
              }
              if (v42) {
                __int16 v43 = (char *)sub_1041C((uint64_t)(a4 + 2), v42);
              }
              else {
                __int16 v43 = 0;
              }
              uint64_t v52 = &v43[8 * v39];
              *(void *)uint64_t v52 = v56;
              uint64_t v27 = v52 + 8;
              uint64_t v54 = (char *)*a4;
              unint64_t v53 = (char *)a4[1];
              if (v53 != *a4)
              {
                do
                {
                  uint64_t v55 = *((void *)v53 - 1);
                  v53 -= 8;
                  *((void *)v52 - 1) = v55;
                  v52 -= 8;
                }
                while (v53 != v54);
                unint64_t v53 = (char *)*a4;
              }
              *a4 = v52;
              a4[1] = v27;
              a4[2] = &v43[8 * v42];
              if (v53) {
                operator delete(v53);
              }
            }
            else
            {
              *uint64_t v26 = v56;
              uint64_t v27 = v26 + 1;
            }
            a4[1] = v27;
            goto LABEL_83;
          }
          if (!BYTE1(v56))
          {
            uint64_t v23 = a5[1];
            unint64_t v22 = (unint64_t)a5[2];
            if ((unint64_t)v23 >= v22)
            {
              uint64_t v34 = ((char *)v23 - (unsigned char *)*a5) >> 3;
              if ((unint64_t)(v34 + 1) >> 61) {
                sub_496C();
              }
              uint64_t v35 = v22 - (void)*a5;
              uint64_t v36 = v35 >> 2;
              if (v35 >> 2 <= (unint64_t)(v34 + 1)) {
                uint64_t v36 = v34 + 1;
              }
              if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v37 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v37 = v36;
              }
              if (v37) {
                __int16 v38 = (char *)sub_1041C((uint64_t)(a5 + 2), v37);
              }
              else {
                __int16 v38 = 0;
              }
              BOOL v48 = &v38[8 * v34];
              *(void *)BOOL v48 = v56;
              CFStringRef v24 = v48 + 8;
              unsigned __int8 v50 = (char *)*a5;
              int v49 = (char *)a5[1];
              if (v49 != *a5)
              {
                do
                {
                  uint64_t v51 = *((void *)v49 - 1);
                  v49 -= 8;
                  *((void *)v48 - 1) = v51;
                  v48 -= 8;
                }
                while (v49 != v50);
                int v49 = (char *)*a5;
              }
              *a5 = v48;
              a5[1] = v24;
              a5[2] = &v38[8 * v37];
              if (v49) {
                operator delete(v49);
              }
            }
            else
            {
              void *v23 = v56;
              CFStringRef v24 = v23 + 1;
            }
            a5[1] = v24;
            goto LABEL_83;
          }
          sub_12008();
          uint64_t v28 = qword_2C148;
          if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v59 = "USBMIDIDevice.cpp";
            __int16 v60 = 1024;
            int v61 = 487;
            __int16 v62 = 1024;
            int v63 = v11;
            __int16 v64 = 1024;
            int v65 = BYTE1(v56);
            __int16 v29 = v28;
            BOOL v30 = "%25s:%-5d [?]  Unknown direction for endpoint %d: %d";
LABEL_33:
            _os_log_impl(&def_F708, v29, OS_LOG_TYPE_INFO, v30, buf, 0x1Eu);
          }
LABEL_83:
          int v11 = ++v12;
          if (v12 > v57) {
            return;
          }
        }
        if (!v15) {
          goto LABEL_83;
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v59 = "USBMIDIDevice.cpp";
        __int16 v60 = 1024;
        int v61 = 491;
        __int16 v62 = 1024;
        int v63 = v11;
        __int16 v64 = 1024;
        int v65 = v13;
        __int16 v29 = v14;
        BOOL v30 = "%25s:%-5d [?]  Couldn't get pipe for endpoint %d (0x%x)";
        goto LABEL_33;
      }
    }
  }
}

uint64_t sub_1538C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = mach_absolute_time();
  uint64_t v7 = a1[10];
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = *(unsigned __int8 *)(a2 + 64);
  unsigned __int8 v10 = sub_15430(a1, v9);
  int v11 = *(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)v7 + 168);

  return v11(v7, a1, v6, v8, a3, v9, v10);
}

uint64_t sub_15430(void *a1, int a2)
{
  for (uint64_t i = (void *)a1[17]; i != (void *)a1[18]; ++i)
  {
    if (a2 == BYTE6(*i)) {
      return HIBYTE(*i);
    }
  }
  for (uint64_t j = (void *)a1[20]; ; ++j)
  {
    if (j == (void *)a1[21]) {
      return 1;
    }
    if (a2 == BYTE6(*j)) {
      break;
    }
  }
  return HIBYTE(*j);
}

unsigned char *sub_15490(void *a1, int *a2, int a3)
{
  ItemCount result = (unsigned char *)(*(uint64_t (**)(void *))(*a1 + 112))(a1);
  if (result)
  {
    __int16 v29 = a1 + 43;
    char v30 = (*(uint64_t (**)(void))(a1[43] + 16))();
    uint64_t v28 = sub_1577C(a1, a3);
    uint64_t v7 = a1[24];
    int v8 = a3;
    if (a3 < (unint64_t)((a1[25] - v7) >> 3)) {
      int v8 = *(unsigned __int8 *)(v7 + 8 * a3 + 1);
    }
    if (*a2 <= 0)
    {
      int v14 = v28[6];
    }
    else
    {
      unint64_t v9 = (unint64_t)(a2 + 1);
      unsigned int v10 = *a2 + 1;
      do
      {
        uint64_t v36 = 0;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long __dst = 0u;
        uint64_t v11 = *(void *)v9;
        size_t v12 = *(unsigned __int16 *)(v9 + 8);
        if (v12 > 0x40)
        {
          int v13 = malloc_type_malloc(*(unsigned __int16 *)(v9 + 8), 0x9D18EA33uLL);
          memcpy(v13, (const void *)(v9 + 10), v12);
        }
        else
        {
          memcpy(&__dst, (const void *)(v9 + 10), *(unsigned __int16 *)(v9 + 8));
          int v13 = 0;
        }
        long long v35 = __PAIR64__(v8, a3);
        int v14 = v28[6];
        LOBYTE(v36) = v28[6];
        BOOL v15 = (char *)operator new(0x80uLL);
        *(_OWORD *)(v15 + 104) = v35;
        long long v16 = v33;
        *(_OWORD *)(v15 + 88) = v34;
        *(_OWORD *)(v15 + 72) = v16;
        long long v17 = v32;
        *(_OWORD *)(v15 + 40) = __dst;
        *((void *)v15 + 1) = a1 + 54;
        *((void *)v15 + 2) = v11;
        *((_DWORD *)v15 + 6) = v12;
        *((_DWORD *)v15 + 7) = 0;
        *((void *)v15 + 4) = v13;
        *((void *)v15 + 15) = v36;
        *(_OWORD *)(v15 + 56) = v17;
        uint64_t v18 = a1[54];
        *(void *)BOOL v15 = v18;
        *(void *)(v18 + 8) = v15;
        a1[54] = v15;
        ++a1[56];
        unint64_t v9 = (v9 + *(unsigned __int16 *)(v9 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
        --v10;
      }
      while (v10 > 1);
    }
    uint64_t v20 = a1[20];
    uint64_t v19 = a1[21];
    uint64_t v21 = v19 - v20;
    if (v19 == v20) {
      goto LABEL_18;
    }
    uint64_t v22 = 0;
    unint64_t v23 = v21 >> 3;
    if (v23 <= 1) {
      unint64_t v23 = 1;
    }
    CFStringRef v24 = (unsigned __int8 *)(v20 + 6);
    while (1)
    {
      int v25 = *v24;
      v24 += 8;
      if (v25 == v14) {
        break;
      }
      if (v23 == ++v22) {
        goto LABEL_18;
      }
    }
    if ((v22 & 0x80000000) != 0) {
LABEL_18:
    }
      __assert_rtn("Send", "USBMIDIDevice.cpp", 555, "currentBufferIndex >= 0");
    uint64_t v26 = a1[40];
    if (v22 >= (unint64_t)((a1[41] - v26) >> 4)) {
      sub_104C8();
    }
    uint64_t v27 = *(void *)(v26 + 16 * v22);
    if (v27 && !*(unsigned char *)(v27 + 44) && !*((unsigned char *)a1 + 488))
    {
      *((unsigned char *)a1 + 488) = 1;
      mach_absolute_time();
      MIDITimerTaskSetNextWakeTime();
    }
    return sub_9578(&v29);
  }
  return result;
}

void sub_15760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_9578(va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_1577C(void *a1, int a2)
{
  uint64_t v2 = a1[24];
  if ((int)((unint64_t)(a1[25] - v2) >> 3) > a2
    && (v3 = v2 + 8 * a2, int v4 = *(unsigned __int8 *)(v3 + 3), *(unsigned char *)(v3 + 3))
    && (v5 = (unsigned __int8 *)a1[20], (uint64_t v6 = a1[21] - (void)v5) != 0))
  {
    unint64_t v7 = v6 >> 3;
    if (v7 <= 1) {
      unint64_t v7 = 1;
    }
    while (*v5 != v4)
    {
      v5 += 8;
      if (!--v7) {
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    int v5 = (unsigned __int8 *)a1[20];
    if ((unsigned __int8 *)a1[21] == v5) {
      sub_104C8();
    }
  }
  return v5;
}

unsigned __int8 *sub_157F4(uint64_t a1, int *a2, int a3)
{
  ItemCount result = (unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 112))(a1);
  if (!result) {
    return result;
  }
  ItemCount result = sub_1577C((void *)a1, a3);
  int v7 = result[7];
  if (!result[7])
  {
    if (a3 == 255) {
      return result;
    }
    ItemCount result = *(unsigned __int8 **)(a1 + 224);
    if (!result) {
      return result;
    }
    goto LABEL_48;
  }
  int v8 = *a2;
  if (v7 != 2 && v8 == 2)
  {
    ItemCount result = *(unsigned __int8 **)(a1 + 240);
    if (!result) {
      return result;
    }
LABEL_48:
    *(_DWORD *)(a1 + 220) = a3;
    unint64_t v37 = *(uint64_t (**)(void))(*(void *)result + 16);
    return (unsigned __int8 *)v37();
  }
  if (v7 == 2 && v8 == 1)
  {
    ItemCount result = *(unsigned __int8 **)(a1 + 256);
    if (!result) {
      return result;
    }
    goto LABEL_48;
  }
  uint64_t v11 = result;
  if (a3 != 255)
  {
    int v12 = a2[1];
    if (v12)
    {
      int v13 = a2 + 2;
      do
      {
        uint64_t v14 = v13[2];
        if (v14)
        {
          BOOL v15 = v13 + 3;
          uint64_t v16 = (uint64_t)&v13[v14 + 3];
          do
          {
            unint64_t v17 = *v15;
            unint64_t v18 = v17 >> 28;
            if (*v15 >> 28) {
              BOOL v19 = v18 == 15;
            }
            else {
              BOOL v19 = 1;
            }
            if (!v19) {
              *BOOL v15 = v17 & 0xF0FFFFFF | ((a3 & 0xF) << 24);
            }
            v15 += byte_23B58[v18];
          }
          while (v15 != (_DWORD *)v16);
          uint64_t v20 = v13[2];
        }
        else
        {
          uint64_t v20 = 0;
        }
        v13 += v20 + 3;
        --v12;
      }
      while (v12);
    }
  }
  uint64_t v41 = a1 + 344;
  char v42 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 344) + 16))(a1 + 344);
  uint64_t v21 = *(void *)(a1 + 192);
  int v22 = a3;
  if (a3 < (unint64_t)((*(void *)(a1 + 200) - v21) >> 3)) {
    int v22 = *(unsigned __int8 *)(v21 + 8 * a3 + 1);
  }
  int v23 = v11[6];
  int v24 = a2[1];
  if (v24)
  {
    int v25 = (unsigned int *)(a2 + 2);
    do
    {
      if (!v25[2]) {
        break;
      }
      sub_1A63C((uint64_t)buf, v25, a3, v22, v23);
      unint64_t v26 = *(void *)(a1 + 464);
      if (v26 >= *(void *)(a1 + 472))
      {
        uint64_t v29 = sub_1A8B4((uint64_t *)(a1 + 456), (uint64_t)buf);
      }
      else
      {
        uint64_t v27 = sub_1A9E8(v26, (unsigned int *)buf);
        uint64_t v28 = v47[0];
        *(void *)(v27 + 285) = *(void *)((char *)v47 + 5);
        *(void *)(v27 + 280) = v28;
        uint64_t v29 = v27 + 296;
      }
      *(void *)(a1 + 464) = v29;
      sub_10A5C(v29 - 296);
      sub_10B08((uint64_t)buf);
      v25 += v25[2] + 3;
      --v24;
    }
    while (v24);
    int v23 = v11[6];
  }
  uint64_t v31 = *(void *)(a1 + 160);
  uint64_t v30 = *(void *)(a1 + 168);
  uint64_t v32 = v30 - v31;
  if (v30 == v31) {
    goto LABEL_41;
  }
  uint64_t v33 = 0;
  unint64_t v34 = v32 >> 3;
  if (v34 <= 1) {
    unint64_t v34 = 1;
  }
  long long v35 = (unsigned __int8 *)(v31 + 6);
  while (1)
  {
    int v36 = *v35;
    v35 += 8;
    if (v36 == v23) {
      break;
    }
    if (v34 == ++v33) {
      goto LABEL_41;
    }
  }
  if ((v33 & 0x80000000) != 0) {
LABEL_41:
  }
    __assert_rtn("SendPackets", "USBMIDIDevice.cpp", 626, "currentBufferIndex >= 0");
  uint64_t v38 = *(void *)(a1 + 320);
  if (v33 >= (unint64_t)((*(void *)(a1 + 328) - v38) >> 4)) {
    sub_104C8();
  }
  uint64_t v39 = *(void *)(v38 + 16 * v33);
  if (v39)
  {
    if (!*(unsigned char *)(v39 + 44) && !*(unsigned char *)(a1 + 488))
    {
      *(unsigned char *)(a1 + 488) = 1;
      mach_absolute_time();
      MIDITimerTaskSetNextWakeTime();
    }
  }
  else
  {
    sub_12008();
    uint64_t v40 = qword_2C148;
    if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v44 = "USBMIDIDevice.cpp";
      __int16 v45 = 1024;
      int v46 = 629;
      _os_log_impl(&def_F708, v40, OS_LOG_TYPE_ERROR, "%25s:%-5d [!] USBMIDIDevice::SendPackets() - buffer not found", buf, 0x12u);
    }
  }
  return sub_9578(&v41);
}

void sub_15C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

uint64_t sub_15C2C(uint64_t a1, uint64_t a2)
{
  atomic_fetch_add((atomic_uint *volatile)(a2 + 8), 1u);
  *(unsigned char *)(a2 + 44) = 1;
  uint64_t result = (*(uint64_t (**)(void, void, void, void, void (*)(uint64_t, int, unint64_t), uint64_t))(**(void **)(a1 + 104) + 264))(*(void *)(a1 + 104), *(unsigned __int8 *)(a2 + 64), *(void *)(a2 + 24), *(unsigned int *)(a2 + 40), sub_15D04, a2);
  if (result == -536854449 || result == -536870163)
  {
    int v5 = *(uint64_t (**)(void))(**(void **)(a1 + 104) + 264);
    return v5();
  }
  return result;
}

void sub_15D04(uint64_t a1, int a2, unint64_t a3)
{
  *(unsigned char *)(a1 + 44) = 0;
  int v4 = *(std::__shared_weak_count **)(a1 + 56);
  if (!v4 || (v7 = *(unsigned __int8 *)(a1 + 64), (int v8 = std::__shared_weak_count::lock(v4)) == 0))
  {
    BOOL v15 = (atomic_uint *)a1;
    sub_15F84(&v15);
    return;
  }
  unint64_t v9 = v8;
  uint64_t v10 = *(void *)(a1 + 48);
  BOOL v15 = (atomic_uint *)a1;
  if (v10 && a2 != -536870165 && !*(unsigned char *)(v10 + 184))
  {
    if (a2)
    {
      if (a2 == -536870163
        && !(*(unsigned int (**)(void, uint64_t))(**(void **)(v10 + 104) + 224))(*(void *)(v10 + 104), v7))
      {
        (*(void (**)(uint64_t, uint64_t))(*(void *)v10 + 64))(v10, a1);
      }
      goto LABEL_24;
    }
    *(unsigned char *)(v10 + 185) = 1;
    if (a3 < 5)
    {
      if (*(unsigned char *)(v10 + 188))
      {
LABEL_23:
        (*(void (**)(uint64_t, uint64_t))(*(void *)v10 + 64))(v10, a1);
        goto LABEL_24;
      }
    }
    else if (*(unsigned char *)(v10 + 188))
    {
      int v11 = *(unsigned __int8 *)(a1 + 64);
      int v12 = *(uint64_t **)(v10 + 112);
      int v13 = *(uint64_t **)(v10 + 120);
      if (v12 != v13)
      {
        while (*(unsigned __int8 *)(*v12 + 46) != v11)
        {
          v12 += 2;
          if (v12 == v13) {
            goto LABEL_21;
          }
        }
      }
      if (v13 == v12)
      {
LABEL_21:
        sub_12008();
        uint64_t v14 = qword_2C148;
        if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          unint64_t v17 = "USBMIDIDevice.cpp";
          __int16 v18 = 1024;
          int v19 = 694;
          __int16 v20 = 1024;
          int v21 = v11;
          _os_log_impl(&def_F708, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d [!] No negotiator for pipeIndex %d", buf, 0x18u);
        }
      }
      else
      {
        sub_1E1C4(*v12, a1, a3);
      }
      goto LABEL_23;
    }
    (*(void (**)(uint64_t, uint64_t, unint64_t))(*(void *)v10 + 80))(v10, a1, a3);
    goto LABEL_23;
  }
LABEL_24:
  sub_15F84(&v15);
  sub_11694(v9);
}

void sub_15F64(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_15F84((atomic_uint **)va);
  sub_11694(v2);
  _Unwind_Resume(a1);
}

atomic_uint **sub_15F84(atomic_uint **a1)
{
  uint64_t v2 = *a1;
  if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
  }
  return a1;
}

void sub_15FE8(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 491) || (uint64_t v2 = *(void *)(a1 + 456), v2 == *(void *)(a1 + 464)))
  {
    if (!*(void *)(a1 + 448)) {
      return;
    }
    int v4 = 0;
    uint64_t v3 = (unsigned __int8 *)(*(void *)(a1 + 440) + 120);
  }
  else
  {
    uint64_t v3 = (unsigned __int8 *)(v2 + 292);
    int v4 = 1;
  }
  uint64_t v5 = *v3;
  unsigned __int8 v6 = sub_15430((void *)a1, *v3);
  uint64_t v8 = *(void *)(a1 + 160);
  uint64_t v7 = *(void *)(a1 + 168);
  uint64_t v9 = v7 - v8;
  if (v7 == v8) {
    goto LABEL_12;
  }
  uint64_t v10 = 0;
  unint64_t v11 = v9 >> 3;
  if (v11 <= 1) {
    unint64_t v11 = 1;
  }
  int v12 = (unsigned __int8 *)(v8 + 6);
  while (1)
  {
    int v13 = *v12;
    v12 += 8;
    if (v13 == v5) {
      break;
    }
    if (v11 == ++v10) {
      goto LABEL_12;
    }
  }
  if ((v10 & 0x80000000) != 0) {
LABEL_12:
  }
    sub_21B24();
  uint64_t v14 = *(void *)(a1 + 320);
  if (v10 >= (unint64_t)((*(void *)(a1 + 328) - v14) >> 4)) {
    sub_104C8();
  }
  uint64_t v15 = *(void *)(v14 + 16 * v10);
  if (!v15)
  {
    sub_12008();
    uint64_t v21 = qword_2C148;
    if (!os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v31 = 136315650;
    uint64_t v32 = "USBMIDIDevice.cpp";
    __int16 v33 = 1024;
    int v34 = 723;
    __int16 v35 = 1024;
    int v36 = v5;
    int v22 = "%25s:%-5d [!] USBMIDIDevice::DoWrite() - Buffer not found for pipeIndex = %d";
    int v23 = v21;
    uint32_t v24 = 24;
LABEL_37:
    _os_log_impl(&def_F708, v23, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v31, v24);
    return;
  }
  uint64_t v16 = *(uint64_t **)(a1 + 80);
  uint64_t v17 = *(void *)(v15 + 24);
  uint64_t v18 = *(unsigned int *)(v15 + 40);
  uint64_t v19 = *v16;
  if (v4) {
    uint64_t v20 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, void))(v19 + 184))(v16, a1, a1 + 456, v17, v18, v6);
  }
  else {
    uint64_t v20 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, void))(v19 + 176))(v16, a1, a1 + 432, v17, v18, v6);
  }
  if (!v20) {
    return;
  }
  uint64_t v25 = *(void *)(a1 + 160);
  uint64_t v26 = *(void *)(a1 + 168);
  if (v25 != v26)
  {
    while (*(unsigned __int8 *)(v25 + 6) != v5)
    {
      v25 += 8;
      if (v25 == v26) {
        goto LABEL_35;
      }
    }
  }
  if (v25 == v26)
  {
LABEL_35:
    sub_12008();
    uint64_t v30 = qword_2C148;
    if (!os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v31 = 136315394;
    uint64_t v32 = "USBMIDIDevice.cpp";
    __int16 v33 = 1024;
    int v34 = 758;
    int v22 = "%25s:%-5d [!] USBMIDIDevice::DoWrite() - Missing pipe for queued element";
    int v23 = v30;
    uint32_t v24 = 18;
    goto LABEL_37;
  }
  atomic_fetch_add((atomic_uint *volatile)(v15 + 8), 1u);
  *(unsigned char *)(v15 + 44) = 1;
  int v27 = (*(uint64_t (**)(void, uint64_t, void, uint64_t, void (*)(uint64_t, int), uint64_t))(**(void **)(a1 + 104) + 272))(*(void *)(a1 + 104), v5, *(void *)(v15 + 24), v20, sub_16340, v15);
  if (v27 == -536854449 || v27 == -536870163)
  {
    uint64_t v29 = *(void (**)(void))(**(void **)(a1 + 104) + 272);
    v29();
  }
}

void sub_16340(uint64_t a1, int a2)
{
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 56);
  if (v3 && (uint64_t v5 = std::__shared_weak_count::lock(v3)) != 0)
  {
    unsigned __int8 v6 = v5;
    uint64_t v7 = *(void *)(a1 + 48);
    *(unsigned char *)(a1 + 44) = 0;
    if (v7)
    {
      uint64_t v8 = v7 + 344;
      char v9 = (*(uint64_t (**)(uint64_t))(*(void *)(v7 + 344) + 16))(v7 + 344);
      if (a2) {
        (*(void (**)(void, void))(**(void **)(v7 + 104) + 360))(*(void *)(v7 + 104), *(unsigned __int8 *)(a1 + 64));
      }
      else {
        *(unsigned char *)(v7 + 186) = 1;
      }
      if (atomic_fetch_add((atomic_uint *volatile)(a1 + 8), 0xFFFFFFFF) == 1) {
        (*(void (**)(uint64_t))(*(void *)a1 + 16))(a1);
      }
      if (!a2 && !*(unsigned char *)(v7 + 184)) {
        (*(void (**)(uint64_t))(*(void *)v7 + 72))(v7);
      }
      sub_9578(&v8);
LABEL_18:
      sub_11694(v6);
      return;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
    *(unsigned char *)(a1 + 44) = 0;
  }
  if (atomic_fetch_add((atomic_uint *volatile)(a1 + 8), 0xFFFFFFFF) == 1) {
    (*(void (**)(uint64_t))(*(void *)a1 + 16))(a1);
  }
  if (v6) {
    goto LABEL_18;
  }
}

void sub_164B4(_Unwind_Exception *a1)
{
  sub_11694(v1);
  _Unwind_Resume(a1);
}

void sub_164E4(uint64_t a1, int a2)
{
  sub_12008();
  uint64_t v3 = qword_2C148;
  if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_DEBUG))
  {
    int v4 = "false";
    *(_DWORD *)buf = 136315650;
    uint32_t v24 = "USBMIDIDevice.cpp";
    if (a2) {
      int v4 = "true";
    }
    __int16 v25 = 1024;
    int v26 = 897;
    __int16 v27 = 2080;
    *(void *)uint64_t v28 = v4;
    _os_log_impl(&def_F708, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d [+] USBMIDIDevice::ReconstructPortMapList(forUMP = %s)", buf, 0x1Cu);
  }
  *(void *)(a1 + 200) = *(void *)(a1 + 192);
  int v5 = MIDIDeviceGetNumberOfEntities(*(_DWORD *)(a1 + 8)) - *(unsigned __int8 *)(a1 + 189);
  if (v5 >= 1)
  {
    ItemCount v6 = 0;
    uint64_t v20 = v5;
    do
    {
      SInt32 outValue = 0;
      MIDIObjectRef Entity = MIDIDeviceGetEntity(*(_DWORD *)(a1 + 8), v6);
      if (MIDIObjectGetIntegerProperty(Entity, @"Cable", &outValue)) {
        uint8_t v8 = v6;
      }
      else {
        uint8_t v8 = outValue;
      }
      if (MIDIObjectGetIntegerProperty(Entity, @"In Endpoint", &outValue)) {
        uint8_t v9 = 0;
      }
      else {
        uint8_t v9 = outValue;
      }
      if (MIDIObjectGetIntegerProperty(Entity, @"Out Endpoint", &outValue)) {
        uint8_t v10 = 0;
      }
      else {
        uint8_t v10 = outValue;
      }
      if (((MIDIObjectGetIntegerProperty(Entity, @"Default Protocol", &outValue) == 0) & a2) != 0) {
        unsigned __int8 v11 = outValue;
      }
      else {
        unsigned __int8 v11 = 0;
      }
      if (MIDIObjectGetIntegerProperty(Entity, @"Group Terminal Block ID", &outValue)) {
        unsigned __int8 v12 = 0;
      }
      else {
        unsigned __int8 v12 = outValue;
      }
      if (MIDIObjectGetIntegerProperty(Entity, @"First Group", &outValue)) {
        char v13 = 0;
      }
      else {
        char v13 = outValue;
      }
      if (MIDIObjectGetIntegerProperty(Entity, @"Number of Groups", &outValue)) {
        unsigned __int8 v14 = 0;
      }
      else {
        unsigned __int8 v14 = outValue;
      }
      sub_12008();
      uint64_t v15 = qword_2C148;
      if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136317186;
        uint32_t v24 = "USBMIDIDevice.cpp";
        __int16 v25 = 1024;
        int v26 = 923;
        __int16 v27 = 1024;
        *(_DWORD *)uint64_t v28 = v6;
        *(_WORD *)&v28[4] = 1024;
        *(_DWORD *)&unsigned char v28[6] = v8;
        __int16 v29 = 1024;
        int v30 = v9;
        __int16 v31 = 1024;
        int v32 = v10;
        __int16 v33 = 1024;
        int v34 = v11;
        __int16 v35 = 1024;
        int v36 = v12;
        __int16 v37 = 1024;
        int v38 = v14;
        _os_log_impl(&def_F708, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d      MIDIPortMap(entity %d, cable %d, inEP 0x%x, outEP 0x%x, protocol %d, gtbID %d, numGroups %d => mMapList", buf, 0x3Cu);
      }
      buf[0] = v6;
      buf[1] = v8;
      buf[2] = v9;
      _DWORD buf[3] = v10;
      LOBYTE(v24) = v11;
      BYTE1(v24) = v13;
      BYTE2(v24) = v14;
      BYTE3(v24) = v12;
      uint64_t v16 = *(unsigned char **)(a1 + 200);
      if ((unint64_t)v16 >= *(void *)(a1 + 208))
      {
        uint64_t v17 = sub_10570((uint64_t *)(a1 + 192), buf);
      }
      else
      {
        unsigned char *v16 = v6;
        v16[1] = v8;
        char v16[2] = v9;
        char v16[3] = v10;
        v16[4] = v11;
        v16[5] = v13;
        v16[6] = v14;
        uint64_t v17 = (uint64_t)(v16 + 8);
        v16[7] = v12;
      }
      *(void *)(a1 + 200) = v17;
      ++v6;
    }
    while (v20 != v6);
  }
  sub_12008();
  uint64_t v18 = qword_2C148;
  if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = (uint64_t)(*(void *)(a1 + 200) - *(void *)(a1 + 192)) >> 3;
    *(_DWORD *)buf = 136315650;
    uint32_t v24 = "USBMIDIDevice.cpp";
    __int16 v25 = 1024;
    int v26 = 926;
    __int16 v27 = 2048;
    *(void *)uint64_t v28 = v19;
    _os_log_impl(&def_F708, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d [-] USBMIDIDevice::ReconstructPortMapList() - %lu port map(s) created", buf, 0x1Cu);
  }
}

BOOL sub_168D4(uint64_t a1)
{
  return *(void *)(a1 + 136) != *(void *)(a1 + 144);
}

BOOL sub_168E4(uint64_t a1)
{
  return *(void *)(a1 + 160) != *(void *)(a1 + 168);
}

void *sub_168F4(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *a2 = (uint64_t)&off_28A90;
  *a1 = off_28A70;
  a1[1] = v3;
  (*(void (**)(void *, uint64_t *))(v3 + 16))(a1 + 2, a2 + 1);
  bzero(a1 + 8, 0x300uLL);
  return a1;
}

void *sub_1695C(void *a1)
{
  *a1 = off_28A70;
  (*(void (**)(void *))(a1[1] + 24))(a1 + 2);
  return a1;
}

void sub_169B0(void *a1)
{
  *a1 = off_28A70;
  (*(void (**)(void *))(a1[1] + 24))(a1 + 2);

  operator delete();
}

uint64_t sub_16A24(uint64_t *a1, _DWORD *a2)
{
  uint64_t v7 = a1[1];
  (*(void (**)(void *, uint64_t *))(v7 + 8))(v8, a1 + 2);
  int v9 = 0;
  v8[6] = &v10;
  if (*a2 == 2)
  {
    v5[0] = a1;
    v5[1] = &v7;
    ItemCount v6 = v5;
    sub_17398((uint64_t)a2, (uint64_t **)&v6);
  }
  else
  {
    if (*a2 != 1) {
      std::terminate();
    }
    ItemCount v6 = (uint64_t **)&v7;
    v5[0] = (uint64_t *)&v6;
    sub_16BB4((uint64_t)a2, v5);
  }
  return sub_17C3C((uint64_t)&v7);
}

void sub_16B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_17C3C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_16B28(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  return (**(uint64_t (***)(uint64_t, uint64_t *))(a1 + 8))(a1 + 16, &v3);
}

void sub_16B5C()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_28610;
}

uint64_t sub_16BB4(uint64_t result, uint64_t **a2)
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
      uint64_t result = sub_16C8C(v11, &v10, &v8);
      if (result)
      {
        do
        {
          uint64_t v7 = *a2;
          uint64_t v13 = v10;
          v12[0] = *v7;
          v12[1] = (uint64_t)&v13;
          sub_16D58((unsigned __int16 *)&v8, v12);
          uint64_t v9 = 0;
          uint64_t v10 = 0;
          uint64_t v8 = 0;
          uint64_t result = sub_16C8C(v11, &v10, &v8);
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

uint64_t sub_16C8C(uint64_t *a1, void *a2, _DWORD *a3)
{
  unint64_t v3 = a1[1];
  unint64_t v4 = a1[3];
  if (v4 >= v3) {
    return 0;
  }
  uint64_t v5 = *a1;
  uint64_t v6 = (unsigned int *)(*a1 + 4 * v4);
  unint64_t v7 = *v6;
  unint64_t v8 = v4 + byte_23AF8[v7 >> 28];
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

unsigned __int16 *sub_16D58(unsigned __int16 *result, uint64_t *a2)
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
        uint64_t result = (unsigned __int16 *)sub_171D0(v7, v25, (char *)&__src, v6);
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
      int v23 = (unsigned __int8 *)result + v22 + 10;
      if (v16 == 12582912)
      {
        uint32_t v24 = &__src;
      }
      else
      {
        uint32_t v24 = (unsigned __int8 *)&v34;
        unsigned __int8 *v23 = __src;
        int v23 = (unsigned __int8 *)result + v22 + 11;
      }
      unsigned __int8 *v23 = *v24;
      v23[1] = v24[1];
      result[4] += v17;
      goto LABEL_49;
    }
LABEL_33:
    uint64_t result = (unsigned __int16 *)sub_171D0(*a2, v19, (char *)&__src, v17);
LABEL_49:
    *(void *)(v18 + 56) = result;
    return result;
  }
  if (v4 == 1)
  {
    int v5 = BYTE2(v3) - 240;
    if (BYTE2(v3) >= 0xF0u)
    {
      size_t v6 = byte_2C070[v5];
      if (byte_2C070[v5])
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
            uint64_t result = (unsigned __int16 *)sub_171D0(v7, v8, (char *)&__src, v6);
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

uint64_t sub_171D0(uint64_t a1, uint64_t a2, char *a3, size_t a4)
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
    sub_1736C(&v15, 0);
    uint64_t v8 = a1 + 68;
    *(void *)(a1 + 56) = a1 + 68;
    *(_DWORD *)(a1 + 64) = 0;
    sub_1736C(&v15, 0);
  }
  return v8;
}

void sub_17340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t *sub_1736C(uint64_t *result, uint64_t a2)
{
  uint64_t v3 = *result;
  *uint64_t result = a2;
  if (v3) {
    return (uint64_t *)MIDI::LegacyPacketListDeleter::operator()();
  }
  return result;
}

uint64_t sub_17398(uint64_t result, uint64_t **a2)
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
      uint64_t result = sub_16C8C(v12, &v11, &v9);
      if (result)
      {
        do
        {
          uint64_t v7 = *a2;
          uint64_t v14 = v11;
          uint64_t v8 = *v7;
          *(void *)&long long v13 = v7[1];
          *((void *)&v13 + 1) = &v14;
          sub_17474((unsigned __int16 *)(v8 + 64), (unsigned __int16 *)&v9, &v13);
          uint64_t v10 = 0;
          uint64_t v11 = 0;
          uint64_t v9 = 0;
          uint64_t result = sub_16C8C(v12, &v11, &v9);
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

unsigned __int16 *sub_17474(unsigned __int16 *result, unsigned __int16 *a2, long long *a3)
{
  unint64_t v3 = *(unsigned int *)a2;
  if (((1 << (v3 >> 28)) & 0xA02F) != 0)
  {
    long long v29 = *a3;
    uint64_t v5 = a2;
    return sub_177C4(v5, (uint64_t *)&v29);
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
        sub_177C4((unsigned __int16 *)v27, (uint64_t *)&v29);
        int v28 = 0;
        *(_DWORD *)&v27[8] = 0;
        *(void *)int v27 = (v20 | v14) - 256;
        long long v29 = *a3;
        sub_177C4((unsigned __int16 *)v27, (uint64_t *)&v29);
        *char v12 = v16;
        int v21 = (char *)v10 + 3 * v11;
        v21[1] = v26;
        v21[2] = v14;
LABEL_22:
        int v28 = 0;
        *(_DWORD *)&v27[8] = 0;
        *(void *)int v27 = v18 | (v7 >> 25) | 0x600;
        long long v29 = *a3;
        uint64_t result = sub_177C4((unsigned __int16 *)v27, (uint64_t *)&v29);
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
          sub_177C4((unsigned __int16 *)v27, (uint64_t *)&v29);
          int v28 = 0;
          *(_DWORD *)&v27[8] = 0;
          *(void *)int v27 = v25 & 0xFFFFFF80 | v7 & 0x7F | 0x2000;
          long long v29 = *a3;
          sub_177C4((unsigned __int16 *)v27, (uint64_t *)&v29);
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
        return sub_177C4(v5, (uint64_t *)&v29);
      default:
        return result;
    }
  }
  return result;
}

unsigned __int16 *sub_177C4(unsigned __int16 *result, uint64_t *a2)
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
        uint64_t result = (unsigned __int16 *)sub_171D0(v7, v25, (char *)&__src, v6);
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
    uint64_t result = (unsigned __int16 *)sub_171D0(*a2, v19, (char *)&__src, v17);
LABEL_49:
    *(void *)(v18 + 56) = result;
    return result;
  }
  if (v4 == 1)
  {
    int v5 = BYTE2(v3) - 240;
    if (BYTE2(v3) >= 0xF0u)
    {
      size_t v6 = byte_2C070[v5];
      if (byte_2C070[v5])
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
            uint64_t result = (unsigned __int16 *)sub_171D0(v7, v8, (char *)&__src, v6);
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

uint64_t sub_17C3C(uint64_t a1)
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

void *sub_17CB0(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *a2 = (uint64_t)&off_28AE8;
  *a1 = off_28AC8;
  a1[1] = v3;
  (*(void (**)(void *, uint64_t *))(v3 + 16))(a1 + 2, a2 + 1);
  bzero(a1 + 8, 0x300uLL);
  return a1;
}

void *sub_17D18(void *a1)
{
  *a1 = off_28AC8;
  (*(void (**)(void *))(a1[1] + 24))(a1 + 2);
  return a1;
}

void sub_17D6C(void *a1)
{
  *a1 = off_28AC8;
  (*(void (**)(void *))(a1[1] + 24))(a1 + 2);

  operator delete();
}

uint64_t sub_17DE0(uint64_t a1, _DWORD *a2)
{
  if (*a2 == 2)
  {
    uint64_t v7 = *(_DWORD **)(a1 + 8);
    (*((void (**)(void *, uint64_t))v7 + 1))(v8, a1 + 16);
    void v8[7] = 1;
    v8[6] = &v9;
    v5[0] = a1;
    v5[1] = &v7;
    size_t v6 = v5;
    sub_18054((uint64_t)a2, &v6);
    return sub_1884C((uint64_t)&v7);
  }
  else
  {
    if (*a2 != 1) {
      std::terminate();
    }
    uint64_t v7 = a2;
    return (**(uint64_t (***)(uint64_t, _DWORD **))(a1 + 8))(a1 + 16, &v7);
  }
}

void sub_17EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_1884C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_17EE0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 + 8);
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v6, a1 + 16);
  uint64_t v7 = v5;
  (*(void (**)(void *, unsigned char *))(v5 + 8))(v8, v6);
  void v8[7] = 1;
  v8[6] = &v9;
  unsigned int v4 = (unsigned int *)&v7;
  sub_188C0(a2, &v4);
  sub_1884C((uint64_t)&v7);
  return (*(uint64_t (**)(unsigned char *))(v5 + 24))(v6);
}

void sub_17FB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (a2) {
    sub_45C4(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_17FFC()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_28610;
}

uint64_t sub_18054(uint64_t result, uint64_t **a2)
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
      uint64_t result = sub_16C8C(v12, &v11, &v9);
      if (result)
      {
        do
        {
          uint64_t v7 = *a2;
          uint64_t v14 = v11;
          uint64_t v8 = *v7;
          v13[0] = v7[1];
          v13[1] = &v14;
          sub_18130((unsigned int *)(v8 + 64), (int *)&v9, (uint64_t)v13);
          uint64_t v10 = 0;
          uint64_t v11 = 0;
          uint64_t v9 = 0;
          uint64_t result = sub_16C8C(v12, &v11, &v9);
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

unsigned int *sub_18130(unsigned int *result, int *__src, uint64_t a3)
{
  unint64_t v3 = *__src;
  if (((1 << (v3 >> 28)) & 0xA02F) != 0)
  {
    uint64_t v6 = *(unsigned int **)a3;
    uint64_t v7 = **(void **)(a3 + 8);
    return sub_18490(v6, v7, __src);
  }
  else if (v3 >> 28 == 4)
  {
    unsigned int v8 = BYTE3(v3) & 0xF | 0x20;
    unsigned int v9 = __src[1];
    switch(BYTE2(v3) >> 4)
    {
      case 2:
      case 3:
        uint64_t v12 = &result[12 * (BYTE3(v3) & 0xF)];
        uint64_t v13 = (v3 >> 16) & 0xF;
        uint64_t v14 = (unsigned __int8 *)v12 + 3 * v13;
        unsigned int v15 = (v3 >> 8) & 0x7F;
        int v16 = *__src & 0x7F;
        int v17 = (v9 >> 18) & 0x7F;
        if ((v3 & 0x100000) != 0) {
          int v18 = 2;
        }
        else {
          int v18 = 1;
        }
        if (v18 == *v14 && v15 == v14[1])
        {
          int v19 = v13 | 0xB0;
          if (v16 == *((unsigned __int8 *)v12 + 3 * v13 + 2))
          {
            int v20 = (v8 << 24) | (v19 << 16);
            goto LABEL_22;
          }
        }
        else
        {
          int v19 = v13 | 0xB0;
        }
        if ((v3 & 0x100000) != 0) {
          int v21 = 25344;
        }
        else {
          int v21 = 25856;
        }
        int v29 = 0;
        *(_DWORD *)&__srca[8] = 0;
        int v20 = (v8 << 24) | (v19 << 16);
        int v22 = v20 | v21;
        char v27 = v15;
        *(void *)char __srca = v20 | v21 | v15;
        sub_18490(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__srca);
        int v29 = 0;
        *(_DWORD *)&__srca[8] = 0;
        *(void *)char __srca = (v22 | v16) - 256;
        sub_18490(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__srca);
        unsigned __int8 *v14 = v18;
        unsigned int v23 = (char *)v12 + 3 * v13;
        v23[1] = v27;
        v23[2] = v16;
LABEL_22:
        int v29 = 0;
        *(_DWORD *)&__srca[8] = 0;
        *(void *)char __srca = v20 | (v9 >> 25) | 0x600;
        uint64_t result = sub_18490(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__srca);
        if (v17)
        {
          int v29 = 0;
          *(void *)&__srca[4] = 0;
          int v11 = v17 | v20 | 0x2600;
          goto LABEL_30;
        }
        break;
      case 8:
      case 9:
      case 10:
      case 11:
        unsigned int v10 = BYTE2(v3) >> 4 == 9;
        if (v9 >> 25) {
          unsigned int v10 = v9 >> 25;
        }
        int v29 = 0;
        *(void *)&__srca[4] = 0;
        int v11 = v10 | (BYTE2(v3) << 16) | (v8 << 24) | v3 & 0x7F00;
        goto LABEL_30;
      case 12:
        if (v3)
        {
          int v29 = 0;
          *(_DWORD *)&__srca[8] = 0;
          unsigned int v24 = v8 << 24;
          int v25 = BYTE2(v3) << 16;
          int v26 = (v25 - 0x100000) | (v8 << 24);
          *(void *)char __srca = (v25 - 0x100000) & 0xFFFFFF80 | (v8 << 24) | (v9 >> 8) & 0x7F;
          sub_18490(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__srca);
          int v29 = 0;
          *(_DWORD *)&__srca[8] = 0;
          *(void *)char __srca = v26 & 0xFFFFFF80 | v9 & 0x7F | 0x2000;
          sub_18490(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__srca);
        }
        else
        {
          unsigned int v24 = v8 << 24;
          int v25 = BYTE2(v3) << 16;
        }
        int v29 = 0;
        *(void *)&__srca[4] = 0;
        int v11 = HIWORD(v9) & 0x7F00 | v24 | v25;
        goto LABEL_30;
      case 13:
        int v29 = 0;
        *(void *)&__srca[4] = 0;
        int v11 = (BYTE2(v3) << 16) | (v8 << 24) | (v9 >> 25 << 8);
        goto LABEL_30;
      case 14:
        int v29 = 0;
        *(void *)&__srca[4] = 0;
        int v11 = (v9 >> 10) & 0x7F00 | (BYTE2(v3) << 16) | (v8 << 24) | (v9 >> 25);
LABEL_30:
        *(_DWORD *)char __srca = v11;
        return sub_18490(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__srca);
      default:
        return result;
    }
  }
  return result;
}

unsigned int *sub_18490(unsigned int *result, uint64_t a2, int *__src)
{
  unint64_t v3 = result;
  unint64_t v4 = *__src;
  uint64_t v5 = byte_23AF8[v4 >> 28];
  uint64_t v6 = (unsigned int *)*((void *)result + 7);
  if (!byte_23AF8[v4 >> 28])
  {
    if (v6) {
      goto LABEL_47;
    }
    goto LABEL_38;
  }
  unint64_t v7 = (unint64_t)(result + 272);
  int v8 = v4 & 0xF0000000;
  unsigned int v9 = result[17];
  if (v6) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    unsigned int v11 = v6[2];
    BOOL v12 = v11 >= 2;
    unsigned int v13 = v11 - 2;
    if (v12 && v6[3] >> 28 == 3)
    {
      unsigned int v14 = v6[v13 + 3];
      if (v14 >> 28 == 3) {
        int v15 = (v14 >> 20) & 0xF;
      }
      else {
        int v15 = 255;
      }
      if (v15) {
        BOOL v16 = v15 == 3;
      }
      else {
        BOOL v16 = 1;
      }
      char v17 = v16;
      int v18 = 1;
LABEL_27:
      if ((v4 & 0xF0E00000) != 0x30000000)
      {
        BOOL v19 = (v8 != 805306368) != v18 && *(void *)v6 == a2;
        if (v19 && (v17 & 1) == 0)
        {
LABEL_34:
          uint64_t v20 = v6[2];
          if ((unint64_t)&v6[v20 + 3 + v5] <= v7) {
            goto LABEL_40;
          }
LABEL_38:
          uint64_t result = (unsigned int *)sub_1867C((uint64_t)result, a2, __src, v5);
          uint64_t v6 = result;
          goto LABEL_47;
        }
      }
      goto LABEL_36;
    }
LABEL_26:
    int v18 = 0;
    char v17 = 0;
    goto LABEL_27;
  }
  if (!v9) {
    goto LABEL_37;
  }
  if (v6) {
    goto LABEL_26;
  }
  if (v8 != 805306368) {
    goto LABEL_34;
  }
LABEL_36:
  v6 += v6[2] + 3;
LABEL_37:
  if ((unint64_t)&v6[v5 + 3] > v7) {
    goto LABEL_38;
  }
  LODWORD(v2sub_1736C(&a9, 0) = 0;
  result[17] = v9 + 1;
  *(void *)uint64_t v6 = a2;
  unsigned char v6[2] = 0;
LABEL_40:
  uint64_t result = &v6[v20 + 3];
  switch((int)v5)
  {
    case 1:
      goto LABEL_44;
    case 2:
      goto LABEL_43;
    case 3:
      goto LABEL_42;
    case 4:
      int v21 = *__src++;
      *uint64_t result = v21;
      uint64_t result = &v6[v20 + 4];
LABEL_42:
      int v22 = *__src++;
      *result++ = v22;
LABEL_43:
      int v23 = *__src++;
      *result++ = v23;
LABEL_44:
      *uint64_t result = *__src;
      break;
    default:
      uint64_t result = (unsigned int *)memmove(result, __src, 4 * v5);
      break;
  }
  v6[2] += v5;
LABEL_47:
  *((void *)v3 + 7) = v6;
  return result;
}

uint64_t sub_1867C(uint64_t a1, uint64_t a2, int *a3, uint64_t a4)
{
  if (!*(_DWORD *)(a1 + 68)) {
    goto LABEL_4;
  }
  uint64_t v17 = a1 + 64;
  (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v17);
  *(_DWORD *)(a1 + 68) = 0;
  uint64_t v8 = a1 + 72;
  if (!a4) {
    return v8;
  }
  if (v8 + 4 * a4 + 12 <= (unint64_t)(a1 + 1088))
  {
    *(_DWORD *)(a1 + 68) = 1;
    *(void *)(a1 + 72) = a2;
    *(_DWORD *)(a1 + 8sub_1736C(&a9, 0) = 0;
    unsigned int v11 = (int *)(a1 + 84);
    int v12 = 0;
    switch((4 * a4) >> 2)
    {
      case 0:
        break;
      case 1:
        goto LABEL_12;
      case 2:
        goto LABEL_11;
      case 3:
        goto LABEL_10;
      case 4:
        int v13 = *a3++;
        unsigned int v11 = (int *)(a1 + 88);
        *(_DWORD *)(a1 + 84) = v13;
LABEL_10:
        int v14 = *a3++;
        *v11++ = v14;
LABEL_11:
        int v15 = *a3++;
        *v11++ = v15;
LABEL_12:
        int *v11 = *a3;
        int v12 = *(_DWORD *)(a1 + 80);
        break;
      default:
        memmove(v11, a3, 4 * a4);
        int v12 = 0;
        break;
    }
    *(_DWORD *)(a1 + 8sub_1736C(&a9, 0) = v12 + a4;
  }
  else
  {
LABEL_4:
    MIDI::EventList::create();
    uint64_t v19 = v17;
    (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v19);
    uint64_t v9 = v17;
    uint64_t v17 = 0;
    if (v9)
    {
      v18();
      uint64_t v10 = v17;
      uint64_t v8 = a1 + 72;
      *(void *)(a1 + 56) = a1 + 72;
      *(_DWORD *)(a1 + 68) = 0;
      uint64_t v17 = 0;
      if (v10) {
        v18();
      }
    }
    else
    {
      uint64_t v8 = a1 + 72;
      *(void *)(a1 + 56) = a1 + 72;
      *(_DWORD *)(a1 + 68) = 0;
    }
  }
  return v8;
}

void sub_18814(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void (*a11)(void))
{
  if (a10) {
    a11();
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1884C(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 68))
  {
    uint64_t v3 = a1 + 64;
    (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v3);
  }
  *(_DWORD *)(a1 + 68) = 0;
  *(void *)(a1 + 56) = a1 + 72;
  (*(void (**)(uint64_t))(*(void *)a1 + 24))(a1 + 8);
  return a1;
}

uint64_t sub_188C0(uint64_t result, unsigned int **a2)
{
  if (*(_DWORD *)result)
  {
    uint64_t v3 = (unsigned int *)result;
    unsigned int v4 = 0;
    unint64_t v5 = result + 4;
    do
    {
      uint64_t v6 = *(unsigned __int16 *)(v5 + 8);
      v10[0] = v5 + 10;
      v10[1] = v6;
      v10[2] = *(void *)v5;
      v10[3] = 0;
      uint64_t v8 = 0;
      *(void *)uint64_t v9 = 0;
      uint64_t __src = 0;
      uint64_t result = sub_18980(v10, v9, &__src);
      if (result)
      {
        do
        {
          sub_18490(*a2, *(uint64_t *)v9, (int *)&__src);
          uint64_t v8 = 0;
          *(void *)uint64_t v9 = 0;
          uint64_t __src = 0;
          uint64_t result = sub_18980(v10, v9, &__src);
        }
        while ((result & 1) != 0);
      }
      unint64_t v5 = (v5 + *(unsigned __int16 *)(v5 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
      ++v4;
    }
    while (v4 < *v3);
  }
  return result;
}

uint64_t sub_18980(uint64_t *a1, void *a2, _DWORD *a3)
{
  unint64_t v3 = a1[1];
  unint64_t v4 = a1[3];
  if (v4 >= v3) {
    return 0;
  }
  uint64_t v5 = *a1;
  unsigned int v6 = *(unsigned __int8 *)(*a1 + v4);
  if (*(char *)(*a1 + v4) < -16)
  {
LABEL_3:
    uint64_t v7 = 2;
    if ((v6 & 0xE0) != 0xC0) {
      uint64_t v7 = 3;
    }
    unint64_t v8 = v7 + v4;
    BOOL v9 = v7 + v4 > v3;
    BOOL v10 = v7 + v4 <= v3;
    if (!v9)
    {
      uint64_t v11 = v4 + v5;
      int v12 = *(unsigned char *)(v4 + v5 + 1) & 0x7F;
      if ((v6 & 0xE0) == 0xC0) {
        int v13 = 0;
      }
      else {
        int v13 = *(unsigned char *)(v11 + 2) & 0x7F;
      }
      *a3 = v13 | (v6 << 16) | (v12 << 8) | 0x20000000;
      *a2 = a1[2];
      unint64_t v3 = v8;
    }
    goto LABEL_19;
  }
LABEL_8:
  if (v6 < 0xF1)
  {
    if (v6 == 240) {
      int v18 = 1;
    }
    else {
      int v18 = 2;
    }
    if (v6 == 240) {
      a1[3] = ++v4;
    }
    unint64_t v19 = 0;
    int v20 = 0;
    int v21 = 0;
    while (1)
    {
      int v22 = (v4 < v3) | v20;
      if (v4 < v3 && (v20 & 1) == 0)
      {
        int v23 = *(char *)(v5 + v4);
        if ((v23 & 0x80000000) == 0)
        {
          if (v19 > 5)
          {
            int v22 = 0;
            goto LABEL_42;
          }
          int v22 = 0;
          a1[3] = ++v4;
          ++v21;
          goto LABEL_40;
        }
        if (v23 == -9) {
          a1[3] = ++v4;
        }
        if (v18 == 1) {
          int v18 = 0;
        }
        else {
          int v18 = 3;
        }
        int v22 = 1;
      }
      if (v19 <= 5)
      {
        LOBYTE(v23) = 0;
LABEL_40:
        v29[v19] = v23;
      }
LABEL_42:
      ++v19;
      int v20 = v22;
      if (v19 == 7)
      {
        unsigned int v24 = bswap32(v30);
        *a3 = (v18 << 20) | (v21 << 16) | (v29[0] << 8) | v29[1] | 0x30000000;
        a3[1] = v24;
        *a2 = a1[2];
        return 1;
      }
    }
  }
  if (v6 == 247)
  {
    *(void *)a3 = 808452096;
    *a2 = a1[2];
    unint64_t v25 = v4 + 1;
    goto LABEL_53;
  }
  uint64_t v14 = byte_2C070[v6 - 240];
  if (!byte_2C070[v6 - 240])
  {
    unint64_t v15 = v4;
    while (1)
    {
      unint64_t v4 = v15 + 1;
      a1[3] = v15 + 1;
      if (v15 + 1 >= v3) {
        return 0;
      }
      int v16 = *(char *)(v5 + v15++ + 1);
      if (v16 < 0)
      {
        unsigned int v6 = *(unsigned __int8 *)(v5 + v4);
        if (*(char *)(v5 + v4) > -17) {
          goto LABEL_8;
        }
        goto LABEL_3;
      }
    }
  }
  unint64_t v25 = v4 + v14;
  if (v4 + v14 > v3)
  {
    BOOL v10 = 0;
LABEL_19:
    a1[3] = v3;
    return v10;
  }
  if (v14 < 2)
  {
    int v27 = 0;
    goto LABEL_51;
  }
  uint64_t v26 = v4 + v5;
  int v27 = *(unsigned char *)(v4 + v5 + 1) & 0x7F;
  if (v14 == 2)
  {
LABEL_51:
    int v28 = 0;
    goto LABEL_52;
  }
  int v28 = *(unsigned char *)(v26 + 2) & 0x7F;
LABEL_52:
  *a3 = (v6 << 16) | (v27 << 8) | v28 | 0x10000000;
  *a2 = a1[2];
LABEL_53:
  a1[3] = v25;
  return 1;
}

void *sub_18BE4(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *a2 = (uint64_t)&off_28AE8;
  *a1 = off_28B20;
  a1[1] = v3;
  (*(void (**)(void *, uint64_t *))(v3 + 16))(a1 + 2, a2 + 1);
  bzero(a1 + 8, 0x821uLL);
  return a1;
}

void *sub_18C4C(void *a1)
{
  *a1 = off_28B20;
  (*(void (**)(void *))(a1[1] + 24))(a1 + 2);
  return a1;
}

void sub_18CA0(void *a1)
{
  *a1 = off_28B20;
  (*(void (**)(void *))(a1[1] + 24))(a1 + 2);

  operator delete();
}

uint64_t sub_18D14(uint64_t a1, _DWORD *a2)
{
  if (*a2 == 2)
  {
    BOOL v10 = a2;
    return (**(uint64_t (***)(uint64_t, _DWORD **))(a1 + 8))(a1 + 16, &v10);
  }
  else
  {
    if (*a2 != 1) {
      std::terminate();
    }
    uint64_t v8 = 0;
    BOOL v10 = *(_DWORD **)(a1 + 8);
    (*((void (**)(void *, uint64_t))v10 + 1))(v11, a1 + 16);
    v11[7] = 2;
    v11[6] = &v12;
    uint64_t v5 = &v8;
    unsigned int v6 = (uint64_t *)a1;
    uint64_t v7 = &v10;
    BOOL v9 = &v5;
    sub_1908C((uint64_t)a2, &v9);
    uint64_t v5 = (uint64_t *)&v10;
    unsigned int v6 = &v8;
    sub_18F0C((unsigned int *)(a1 + 64), (uint64_t)&v5);
    return sub_1884C((uint64_t)&v10);
  }
}

void sub_18E20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  sub_1884C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_18E40(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *(void *)(a1 + 8);
  (*(void (**)(void *, uint64_t))(v7 + 8))(v8, a1 + 16);
  void v8[7] = 2;
  v8[6] = &v9;
  v5[0] = a1;
  v5[1] = &v7;
  unsigned int v6 = v5;
  sub_19850(a2, &v6);
  return sub_1884C((uint64_t)&v7);
}

void sub_18EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_1884C((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned int *sub_18F0C(unsigned int *result, uint64_t a2)
{
  uint64_t v3 = result;
  unint64_t v4 = *result;
  unsigned int v5 = v4 >> 28;
  if (v4 >> 28) {
    BOOL v6 = v5 == 15;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = v6 || (v4 & 0xFF0000) == 0;
  if (!v7 && (BYTE1(v4) | 0x20) == 0x26)
  {
    LODWORD(v2sub_1736C(&a9, 0) = BYTE3(v4) & 0xF;
    if (v5 == 15) {
      uint64_t v20 = 255;
    }
    else {
      uint64_t v20 = v20;
    }
    *(void *)((char *)&result[32 * v20 + 8 + 2 * ((v4 >> 16) & 0xF)] + 1) = 0;
    *((unsigned char *)result + 32) = 1;
  }
  if (BYTE2(v4))
  {
    uint64_t v23 = 0;
    if (v5) {
      BOOL v8 = v5 == 15;
    }
    else {
      BOOL v8 = 1;
    }
    int v9 = v4 & 0xF000000 | 0x40000000;
    if (v8) {
      int v9 = -16777216;
    }
    int v21 = v9 | v4 & 0xFF00 | (BYTE2(v4) << 16);
    unsigned int v10 = v4;
    unsigned int v11 = v4 << 25;
    if (v10 >= 0x41)
    {
      unsigned int v12 = (v10 & 0x3F) << 19;
      if (v12)
      {
        do
        {
          v11 |= v12;
          BOOL v13 = v12 > 0x3F;
          v12 >>= 6;
        }
        while (v13);
      }
    }
    unsigned int v22 = v11;
    uint64_t result = sub_18490(*(unsigned int **)a2, **(void **)(a2 + 8), &v21);
    *uint64_t v3 = 0;
  }
  unsigned int v14 = v3[4];
  if (BYTE2(v14))
  {
    uint64_t v23 = 0;
    if (v14 >> 28) {
      BOOL v15 = v14 >> 28 == 15;
    }
    else {
      BOOL v15 = 1;
    }
    int v16 = v14 & 0xF000000 | 0x40000000;
    if (v15) {
      int v16 = -16777216;
    }
    int v21 = v16 | v14 & 0xFF00 | (BYTE2(v14) << 16);
    unsigned int v17 = v14;
    unsigned int v18 = v14 << 25;
    if (v17 >= 0x41)
    {
      unsigned int v19 = (v17 & 0x3F) << 19;
      if (v19)
      {
        do
        {
          v18 |= v19;
          BOOL v13 = v19 > 0x3F;
          v19 >>= 6;
        }
        while (v13);
      }
    }
    unsigned int v22 = v18;
    uint64_t result = sub_18490(*(unsigned int **)a2, **(void **)(a2 + 8), &v21);
    v3[4] = 0;
  }
  return result;
}

uint64_t sub_1908C(uint64_t result, void **a2)
{
  if (*(_DWORD *)(result + 4))
  {
    uint64_t v3 = result;
    unsigned int v4 = 0;
    uint64_t v5 = result + 8;
    do
    {
      uint64_t v6 = *(unsigned int *)(v5 + 8);
      v13[0] = v5 + 12;
      v13[1] = v6;
      void v13[2] = *(void *)v5;
      v13[3] = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t __src = 0;
      uint64_t result = sub_16C8C(v13, &v12, &__src);
      if (result)
      {
        do
        {
          BOOL v7 = (void **)*a2;
          int v9 = (void *)**a2;
          uint64_t v8 = (*a2)[1];
          *int v9 = v12;
          v14[0] = v7[2];
          v14[1] = v9;
          sub_19160(v8 + 64, (unsigned int *)&__src, (uint64_t)v14);
          uint64_t v11 = 0;
          uint64_t v12 = 0;
          uint64_t __src = 0;
          uint64_t result = sub_16C8C(v13, &v12, &__src);
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

void sub_19160(uint64_t a1, unsigned int *__src, uint64_t a3)
{
  unsigned int v5 = *__src;
  if (*__src >> 28 == 2)
  {
    int v57 = 0;
    uint64_t v58 = 0;
    uint64_t v56 = BYTE2(v5);
    __int16 v55 = 0;
    v54[0] = (unsigned int *)a1;
    v54[1] = (unsigned int *)&v56;
    v54[2] = __src;
    v54[3] = (unsigned int *)((char *)&v55 + 1);
    v54[4] = (unsigned int *)&v55;
    int v7 = *(unsigned __int8 *)(a1 + 32);
    if (!v7) {
      sub_1967C(v54);
    }
    uint64_t v8 = HIBYTE(v5) & 0xF;
    int v9 = HIBYTE(v5) & 0xF | 0x40;
    unsigned int v10 = *(_DWORD *)a1;
    int v11 = BYTE2(*(_DWORD *)a1);
    if (BYTE2(*(_DWORD *)a1) && v7)
    {
      *(unsigned char *)(a1 + 32) = 1;
      uint64_t v61 = 0;
      unsigned int __srca = v10 & 0xFF00 | (v11 << 16) & 0x80FFFFFF | ((HIBYTE(v5) & 0xF | 0x40) << 24);
      unsigned int v12 = v10;
      unsigned int v13 = v10 << 25;
      if (v12 >= 0x41)
      {
        unsigned int v14 = (v12 & 0x3F) << 19;
        if (v14)
        {
          do
          {
            v13 |= v14;
            BOOL v15 = v14 > 0x3F;
            v14 >>= 6;
          }
          while (v15);
        }
      }
      unsigned int v60 = v13;
      sub_18490(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)&__srca);
      *(_DWORD *)a1 = 0;
      uint64_t v61 = 0;
      int v16 = *(_DWORD *)(a1 + 16);
      if (BYTE2(v16))
      {
        unsigned int __srca = *(_DWORD *)(a1 + 16) & 0xFF00 | (BYTE2(*(_DWORD *)(a1 + 16)) << 16) | (v9 << 24);
        unsigned int v17 = v16;
        unsigned int v18 = v16 << 25;
        BOOL v19 = v17 >= 0x41;
        unsigned int v20 = (v17 & 0x3F) << 19;
        if (v19 && v20 != 0)
        {
          do
          {
            v18 |= v20;
            BOOL v15 = v20 > 0x3F;
            v20 >>= 6;
          }
          while (v15);
        }
        unsigned int v60 = v18;
        sub_18490(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)&__srca);
        *(_DWORD *)(a1 + 16) = 0;
      }
      unsigned int v22 = v56;
      *(void *)(a1 + (v8 << 7) + 8 * (v56 & 0xF) + 33) = 0;
    }
    else
    {
      unsigned int v22 = v56;
    }
    unsigned int v25 = (v5 >> 8) & 0x7F;
    unsigned int v26 = v5 & 0x7F;
    switch(v22 >> 4)
    {
      case 8u:
        goto LABEL_24;
      case 9u:
        if ((v5 & 0x7F) == 0)
        {
          v22 -= 16;
          LODWORD(v56) = v22;
          unsigned int v26 = 64;
        }
LABEL_24:
        HIDWORD(v56) = (v9 << 24) | (v22 << 16) | (v25 << 8);
        unsigned int v27 = v26 << 9;
        if (v26 >= 0x41)
        {
          unsigned int v28 = 8 * (v26 & 0x3F);
          if (v28)
          {
            do
            {
              v27 |= v28;
              BOOL v15 = v28 > 0x3F;
              v28 >>= 6;
            }
            while (v15);
          }
        }
        unsigned int v29 = v27 << 16;
        goto LABEL_74;
      case 0xAu:
        HIDWORD(v56) = (v9 << 24) | (v22 << 16) | (v25 << 8);
        unsigned int v29 = v5 << 25;
        if (v26 >= 0x41)
        {
          unsigned int v30 = (v5 & 0x3F) << 19;
          if (v30)
          {
            do
            {
              v29 |= v30;
              BOOL v15 = v30 > 0x3F;
              v30 >>= 6;
            }
            while (v15);
          }
        }
        goto LABEL_74;
      case 0xBu:
        uint64_t v31 = a1 + (v8 << 7) + 33;
        uint64_t v32 = v22 & 0xF;
        if (((v5 >> 8) & 0x7F) > 0x25)
        {
          switch(v25)
          {
            case 'b':
              uint64_t v41 = v31 + 8 * v32;
              char v42 = 2;
              goto LABEL_67;
            case 'c':
              uint64_t v51 = v31 + 8 * v32;
              char v52 = 2;
              goto LABEL_69;
            case 'd':
              uint64_t v41 = v31 + 8 * v32;
              char v42 = 1;
LABEL_67:
              *(unsigned char *)(v41 + 1) = v42;
              *(unsigned char *)(v41 + 5) = v26;
              break;
            case 'e':
              uint64_t v51 = v31 + 8 * v32;
              char v52 = 1;
LABEL_69:
              *(unsigned char *)(v51 + 1) = v52;
              *(unsigned char *)(v51 + 4) = v26;
              break;
            default:
              if (v25 != 38) {
                goto LABEL_71;
              }
              char v43 = v5 & 0x7F;
              int v44 = v5 & 0x7F;
              goto LABEL_56;
          }
LABEL_70:
          if (!*(unsigned char *)(a1 + 32)) {
            return;
          }
          goto LABEL_71;
        }
        if (!v25)
        {
          *(unsigned char *)(v31 + 8 * v32 + 2) = v26;
          goto LABEL_52;
        }
        if (v25 != 6)
        {
          if (v25 == 32)
          {
            *(unsigned char *)(v31 + 8 * v32 + 3) = v26;
LABEL_52:
            *(unsigned char *)(v31 + 8 * (v22 & 0xF)) = 1;
            goto LABEL_70;
          }
LABEL_71:
          HIDWORD(v56) = (v9 << 24) | (v22 << 16) | (v25 << 8);
          unsigned int v29 = v5 << 25;
          if (v26 >= 0x41)
          {
            unsigned int v53 = (v5 & 0x3F) << 19;
            if (v53)
            {
              do
              {
                v29 |= v53;
                BOOL v15 = v53 > 0x3F;
                v53 >>= 6;
              }
              while (v15);
            }
          }
LABEL_74:
          int v57 = v29;
          goto LABEL_75;
        }
        char v43 = 0;
        int v44 = 0;
        *(unsigned char *)(v31 + 8 * v32 + 6) = v26;
LABEL_56:
        uint64_t v45 = v31 + 8 * v32;
        *(unsigned char *)(v45 + 7) = v43;
        if (*(unsigned char *)(a1 + 32) || !*(unsigned char *)(v45 + 1)) {
          goto LABEL_71;
        }
        if (*(unsigned char *)(v45 + 1) == 1) {
          int v46 = 32;
        }
        else {
          int v46 = 48;
        }
        int v47 = (unsigned __int8 *)(v31 + 8 * v32);
        HIDWORD(v56) = (v9 << 24) | ((v46 | v32) << 16) | (v47[4] << 8) | v47[5];
        unsigned int v48 = v44 | (v47[6] << 7);
        unsigned int v49 = v48 << 18;
        if (v48 > 0x2000)
        {
          for (unsigned int i = 32 * (v48 & 0x1FFF); i; i >>= 13)
            v49 |= i;
        }
        int v57 = v49;
LABEL_40:
        *(void *)a1 = 0;
        *(void *)(a1 + 8) = 0;
        *(void *)(a1 + 16) = 0;
        *(void *)(a1 + 24) = 0;
LABEL_75:
        sub_18490(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)&v56 + 1);
        break;
      case 0xCu:
        uint64_t v33 = a1 + (v8 << 7) + 33;
        int v34 = *(unsigned __int8 *)(v33 + 8 * (v22 & 0xF));
        if (*(unsigned char *)(v33 + 8 * (v22 & 0xF))) {
          int v34 = *(unsigned __int8 *)(a1 + 32) ^ 1;
        }
        uint64_t v35 = v33 + 8 * (v22 & 0xF);
        int v36 = (v25 << 24) | (*(unsigned __int8 *)(v35 + 2) << 8) | *(unsigned __int8 *)(v35 + 3);
        HIDWORD(v56) = (v22 << 16) | (v9 << 24) | v34;
        int v57 = v36;
        *(void *)uint64_t v35 = 0;
        goto LABEL_40;
      case 0xDu:
        HIDWORD(v56) = (v22 << 16) | (v9 << 24);
        unsigned int v37 = v5 >> 8 << 25;
        if (v25 >= 0x41)
        {
          unsigned int v38 = ((v5 >> 8) & 0x3F) << 19;
          if (v38)
          {
            do
            {
              v37 |= v38;
              BOOL v15 = v38 > 0x3F;
              v38 >>= 6;
            }
            while (v15);
          }
        }
        int v57 = v37;
        goto LABEL_75;
      case 0xEu:
        HIDWORD(v56) = (v22 << 16) | (v9 << 24);
        unsigned int v39 = v25 | (v26 << 7);
        unsigned int v29 = v39 << 18;
        if (v39 > 0x2000)
        {
          for (unsigned int j = 32 * (v39 & 0x1FFF); j; j >>= 13)
            v29 |= j;
        }
        goto LABEL_74;
      default:
        goto LABEL_75;
    }
  }
  else
  {
    uint64_t v23 = *(unsigned int **)a3;
    uint64_t v24 = **(void **)(a3 + 8);
    sub_18490(v23, v24, (int *)__src);
  }
}

__n128 sub_1967C(unsigned int **a1)
{
  uint64_t v1 = *a1;
  if (!*((unsigned char *)*a1 + 32))
  {
    unsigned int v2 = *a1[1];
    unsigned int v3 = v2 >> 4;
    unsigned int v4 = *v1;
    if ((*v1 & 0xFF0000) != 0)
    {
      if (((v2 ^ HIWORD(v4)) & 0xF) != 0)
      {
        *((unsigned char *)v1 + 32) = 1;
        return result;
      }
      if (v3 == 11)
      {
        switch(BYTE1(v4))
        {
          case 'b':
            int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25344;
            goto LABEL_28;
          case 'c':
            int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25088;
            goto LABEL_28;
          case 'd':
            int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25856;
            goto LABEL_28;
          case 'e':
            int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25600;
LABEL_28:
            if (v10 != v12 && v11 != 11535872) {
              return result;
            }
            goto LABEL_33;
          default:
            if (BYTE1(v4) == 32)
            {
              int v9 = a1[2];
              if (*((unsigned char *)v9 + 1)) {
                return result;
              }
            }
            else
            {
              if (BYTE1(v4)) {
                return result;
              }
              int v9 = a1[2];
              if (*((unsigned __int8 *)v9 + 1) << 8 != 0x2000) {
                return result;
              }
            }
LABEL_33:
            __n128 result = *(__n128 *)v9;
            *((_OWORD *)v1 + 1) = *(_OWORD *)v9;
            return result;
        }
      }
    }
    else if (v3 == 11)
    {
      unsigned int v5 = (__n128 *)a1[2];
      if ((v5->n128_u32[0] & 0xF00000) == 0xB00000)
      {
        int v6 = BYTE1(v5->n128_u32[0]);
        if ((v6 - 98) < 4 || (v6 != 32 ? (BOOL v7 = v6 == 0) : (BOOL v7 = 1), v7))
        {
          __n128 result = *v5;
          *(__n128 *)uint64_t v1 = *v5;
        }
      }
    }
  }
  return result;
}

uint64_t sub_19850(uint64_t result, uint64_t **a2)
{
  if (*(_DWORD *)result)
  {
    unsigned int v3 = (unsigned int *)result;
    unsigned int v4 = 0;
    unint64_t v5 = result + 4;
    do
    {
      uint64_t v6 = *(unsigned __int16 *)(v5 + 8);
      v12[0] = v5 + 10;
      v12[1] = v6;
      uint64_t v12[2] = *(void *)v5;
      void v12[3] = 0;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v9 = 0;
      __n128 result = sub_18980(v12, &v11, &v9);
      if (result)
      {
        do
        {
          BOOL v7 = *a2;
          uint64_t v14 = v11;
          uint64_t v8 = *v7;
          v13[0] = v7[1];
          v13[1] = &v14;
          sub_19930(v8 + 64, (unsigned int *)&v9, (uint64_t)v13);
          uint64_t v10 = 0;
          uint64_t v11 = 0;
          uint64_t v9 = 0;
          __n128 result = sub_18980(v12, &v11, &v9);
        }
        while ((result & 1) != 0);
      }
      unint64_t v5 = (v5 + *(unsigned __int16 *)(v5 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
      ++v4;
    }
    while (v4 < *v3);
  }
  return result;
}

void sub_19930(uint64_t a1, unsigned int *__src, uint64_t a3)
{
  unsigned int v5 = *__src;
  if (*__src >> 28 == 2)
  {
    int v57 = 0;
    uint64_t v58 = 0;
    uint64_t v56 = BYTE2(v5);
    __int16 v55 = 0;
    v54[0] = (unsigned int *)a1;
    v54[1] = (unsigned int *)&v56;
    v54[2] = __src;
    v54[3] = (unsigned int *)((char *)&v55 + 1);
    v54[4] = (unsigned int *)&v55;
    int v7 = *(unsigned __int8 *)(a1 + 32);
    if (!v7) {
      sub_19E4C(v54);
    }
    uint64_t v8 = HIBYTE(v5) & 0xF;
    int v9 = HIBYTE(v5) & 0xF | 0x40;
    unsigned int v10 = *(_DWORD *)a1;
    int v11 = BYTE2(*(_DWORD *)a1);
    if (BYTE2(*(_DWORD *)a1) && v7)
    {
      *(unsigned char *)(a1 + 32) = 1;
      uint64_t v61 = 0;
      unsigned int __srca = v10 & 0xFF00 | (v11 << 16) & 0x80FFFFFF | ((HIBYTE(v5) & 0xF | 0x40) << 24);
      unsigned int v12 = v10;
      unsigned int v13 = v10 << 25;
      if (v12 >= 0x41)
      {
        unsigned int v14 = (v12 & 0x3F) << 19;
        if (v14)
        {
          do
          {
            v13 |= v14;
            BOOL v15 = v14 > 0x3F;
            v14 >>= 6;
          }
          while (v15);
        }
      }
      unsigned int v60 = v13;
      sub_18490(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)&__srca);
      *(_DWORD *)a1 = 0;
      uint64_t v61 = 0;
      int v16 = *(_DWORD *)(a1 + 16);
      if (BYTE2(v16))
      {
        unsigned int __srca = *(_DWORD *)(a1 + 16) & 0xFF00 | (BYTE2(*(_DWORD *)(a1 + 16)) << 16) | (v9 << 24);
        unsigned int v17 = v16;
        unsigned int v18 = v16 << 25;
        BOOL v19 = v17 >= 0x41;
        unsigned int v20 = (v17 & 0x3F) << 19;
        if (v19 && v20 != 0)
        {
          do
          {
            v18 |= v20;
            BOOL v15 = v20 > 0x3F;
            v20 >>= 6;
          }
          while (v15);
        }
        unsigned int v60 = v18;
        sub_18490(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)&__srca);
        *(_DWORD *)(a1 + 16) = 0;
      }
      unsigned int v22 = v56;
      *(void *)(a1 + (v8 << 7) + 8 * (v56 & 0xF) + 33) = 0;
    }
    else
    {
      unsigned int v22 = v56;
    }
    unsigned int v25 = (v5 >> 8) & 0x7F;
    unsigned int v26 = v5 & 0x7F;
    switch(v22 >> 4)
    {
      case 8u:
        goto LABEL_24;
      case 9u:
        if ((v5 & 0x7F) == 0)
        {
          v22 -= 16;
          LODWORD(v56) = v22;
          unsigned int v26 = 64;
        }
LABEL_24:
        HIDWORD(v56) = (v9 << 24) | (v22 << 16) | (v25 << 8);
        unsigned int v27 = v26 << 9;
        if (v26 >= 0x41)
        {
          unsigned int v28 = 8 * (v26 & 0x3F);
          if (v28)
          {
            do
            {
              v27 |= v28;
              BOOL v15 = v28 > 0x3F;
              v28 >>= 6;
            }
            while (v15);
          }
        }
        unsigned int v29 = v27 << 16;
        goto LABEL_74;
      case 0xAu:
        HIDWORD(v56) = (v9 << 24) | (v22 << 16) | (v25 << 8);
        unsigned int v29 = v5 << 25;
        if (v26 >= 0x41)
        {
          unsigned int v30 = (v5 & 0x3F) << 19;
          if (v30)
          {
            do
            {
              v29 |= v30;
              BOOL v15 = v30 > 0x3F;
              v30 >>= 6;
            }
            while (v15);
          }
        }
        goto LABEL_74;
      case 0xBu:
        uint64_t v31 = a1 + (v8 << 7) + 33;
        uint64_t v32 = v22 & 0xF;
        if (((v5 >> 8) & 0x7F) > 0x25)
        {
          switch(v25)
          {
            case 'b':
              uint64_t v41 = v31 + 8 * v32;
              char v42 = 2;
              goto LABEL_67;
            case 'c':
              uint64_t v51 = v31 + 8 * v32;
              char v52 = 2;
              goto LABEL_69;
            case 'd':
              uint64_t v41 = v31 + 8 * v32;
              char v42 = 1;
LABEL_67:
              *(unsigned char *)(v41 + 1) = v42;
              *(unsigned char *)(v41 + 5) = v26;
              break;
            case 'e':
              uint64_t v51 = v31 + 8 * v32;
              char v52 = 1;
LABEL_69:
              *(unsigned char *)(v51 + 1) = v52;
              *(unsigned char *)(v51 + 4) = v26;
              break;
            default:
              if (v25 != 38) {
                goto LABEL_71;
              }
              char v43 = v5 & 0x7F;
              int v44 = v5 & 0x7F;
              goto LABEL_56;
          }
LABEL_70:
          if (!*(unsigned char *)(a1 + 32)) {
            return;
          }
          goto LABEL_71;
        }
        if (!v25)
        {
          *(unsigned char *)(v31 + 8 * v32 + 2) = v26;
          goto LABEL_52;
        }
        if (v25 != 6)
        {
          if (v25 == 32)
          {
            *(unsigned char *)(v31 + 8 * v32 + 3) = v26;
LABEL_52:
            *(unsigned char *)(v31 + 8 * (v22 & 0xF)) = 1;
            goto LABEL_70;
          }
LABEL_71:
          HIDWORD(v56) = (v9 << 24) | (v22 << 16) | (v25 << 8);
          unsigned int v29 = v5 << 25;
          if (v26 >= 0x41)
          {
            unsigned int v53 = (v5 & 0x3F) << 19;
            if (v53)
            {
              do
              {
                v29 |= v53;
                BOOL v15 = v53 > 0x3F;
                v53 >>= 6;
              }
              while (v15);
            }
          }
LABEL_74:
          int v57 = v29;
          goto LABEL_75;
        }
        char v43 = 0;
        int v44 = 0;
        *(unsigned char *)(v31 + 8 * v32 + 6) = v26;
LABEL_56:
        uint64_t v45 = v31 + 8 * v32;
        *(unsigned char *)(v45 + 7) = v43;
        if (*(unsigned char *)(a1 + 32) || !*(unsigned char *)(v45 + 1)) {
          goto LABEL_71;
        }
        if (*(unsigned char *)(v45 + 1) == 1) {
          int v46 = 32;
        }
        else {
          int v46 = 48;
        }
        int v47 = (unsigned __int8 *)(v31 + 8 * v32);
        HIDWORD(v56) = (v9 << 24) | ((v46 | v32) << 16) | (v47[4] << 8) | v47[5];
        unsigned int v48 = v44 | (v47[6] << 7);
        unsigned int v49 = v48 << 18;
        if (v48 > 0x2000)
        {
          for (unsigned int i = 32 * (v48 & 0x1FFF); i; i >>= 13)
            v49 |= i;
        }
        int v57 = v49;
LABEL_40:
        *(void *)a1 = 0;
        *(void *)(a1 + 8) = 0;
        *(void *)(a1 + 16) = 0;
        *(void *)(a1 + 24) = 0;
LABEL_75:
        sub_18490(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)&v56 + 1);
        break;
      case 0xCu:
        uint64_t v33 = a1 + (v8 << 7) + 33;
        int v34 = *(unsigned __int8 *)(v33 + 8 * (v22 & 0xF));
        if (*(unsigned char *)(v33 + 8 * (v22 & 0xF))) {
          int v34 = *(unsigned __int8 *)(a1 + 32) ^ 1;
        }
        uint64_t v35 = v33 + 8 * (v22 & 0xF);
        int v36 = (v25 << 24) | (*(unsigned __int8 *)(v35 + 2) << 8) | *(unsigned __int8 *)(v35 + 3);
        HIDWORD(v56) = (v22 << 16) | (v9 << 24) | v34;
        int v57 = v36;
        *(void *)uint64_t v35 = 0;
        goto LABEL_40;
      case 0xDu:
        HIDWORD(v56) = (v22 << 16) | (v9 << 24);
        unsigned int v37 = v5 >> 8 << 25;
        if (v25 >= 0x41)
        {
          unsigned int v38 = ((v5 >> 8) & 0x3F) << 19;
          if (v38)
          {
            do
            {
              v37 |= v38;
              BOOL v15 = v38 > 0x3F;
              v38 >>= 6;
            }
            while (v15);
          }
        }
        int v57 = v37;
        goto LABEL_75;
      case 0xEu:
        HIDWORD(v56) = (v22 << 16) | (v9 << 24);
        unsigned int v39 = v25 | (v26 << 7);
        unsigned int v29 = v39 << 18;
        if (v39 > 0x2000)
        {
          for (unsigned int j = 32 * (v39 & 0x1FFF); j; j >>= 13)
            v29 |= j;
        }
        goto LABEL_74;
      default:
        goto LABEL_75;
    }
  }
  else
  {
    uint64_t v23 = *(unsigned int **)a3;
    uint64_t v24 = **(void **)(a3 + 8);
    sub_18490(v23, v24, (int *)__src);
  }
}

__n128 sub_19E4C(unsigned int **a1)
{
  uint64_t v1 = *a1;
  if (!*((unsigned char *)*a1 + 32))
  {
    unsigned int v2 = *a1[1];
    unsigned int v3 = v2 >> 4;
    unsigned int v4 = *v1;
    if ((*v1 & 0xFF0000) != 0)
    {
      if (((v2 ^ HIWORD(v4)) & 0xF) != 0)
      {
        *((unsigned char *)v1 + 32) = 1;
        return result;
      }
      if (v3 == 11)
      {
        switch(BYTE1(v4))
        {
          case 'b':
            int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25344;
            goto LABEL_28;
          case 'c':
            int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25088;
            goto LABEL_28;
          case 'd':
            int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25856;
            goto LABEL_28;
          case 'e':
            int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25600;
LABEL_28:
            if (v10 != v12 && v11 != 11535872) {
              return result;
            }
            goto LABEL_33;
          default:
            if (BYTE1(v4) == 32)
            {
              int v9 = a1[2];
              if (*((unsigned char *)v9 + 1)) {
                return result;
              }
            }
            else
            {
              if (BYTE1(v4)) {
                return result;
              }
              int v9 = a1[2];
              if (*((unsigned __int8 *)v9 + 1) << 8 != 0x2000) {
                return result;
              }
            }
LABEL_33:
            __n128 result = *(__n128 *)v9;
            *((_OWORD *)v1 + 1) = *(_OWORD *)v9;
            return result;
        }
      }
    }
    else if (v3 == 11)
    {
      unsigned int v5 = (__n128 *)a1[2];
      if ((v5->n128_u32[0] & 0xF00000) == 0xB00000)
      {
        int v6 = BYTE1(v5->n128_u32[0]);
        if ((v6 - 98) < 4 || (v6 != 32 ? (BOOL v7 = v6 == 0) : (BOOL v7 = 1), v7))
        {
          __n128 result = *v5;
          *(__n128 *)uint64_t v1 = *v5;
        }
      }
    }
  }
  return result;
}

void sub_1A020(void ***a1)
{
  uint64_t v1 = *a1;
  unsigned int v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unsigned int v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        uint64_t v4 = sub_10B08(v4 - 296);
      while ((void *)v4 != v2);
      unsigned int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *sub_1A0A4(void *a1)
{
  for (unsigned int i = (void *)a1[1]; i != a1; unsigned int i = (void *)i[1])
  {
    unsigned int v3 = (void *)i[4];
    if (v3) {
      free(v3);
    }
  }
  sub_1A0F4(a1);
  return a1;
}

void *sub_1A0F4(void *result)
{
  if (result[2])
  {
    uint64_t v1 = result;
    __n128 result = (void *)result[1];
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
        __n128 result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

void sub_1A158(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_1A1AC((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_1A1AC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 16)
  {
    uint64_t v4 = *(std::__shared_weak_count **)(i - 8);
    if (v4) {
      sub_11694(v4);
    }
  }
  a1[1] = v2;
}

uint64_t sub_1A1F8(uint64_t *a1, void *a2)
{
  uint64_t result = sub_1A2A8((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

void *sub_1A270(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_4A5C();
  }
  return operator new(16 * a2);
}

uint64_t sub_1A2A8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  uint64_t v12[2] = &v15;
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
  sub_1A33C((uint64_t)v12);
  return v10;
}

uint64_t sub_1A33C(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_1A374(a1);
  }
  return a1;
}

void sub_1A374(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
    if (v3) {
      sub_11694(v3);
    }
    v1 += 16;
  }
}

void **sub_1A3B8(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_1A3EC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v1 = *(void *)(a1 + 16);
  while (v1 != v2)
  {
    *(void *)(a1 + 16) = v1 - 16;
    uint64_t v4 = *(std::__shared_weak_count **)(v1 - 8);
    if (v4)
    {
      sub_11694(v4);
      uint64_t v1 = *(void *)(a1 + 16);
    }
    else
    {
      v1 -= 16;
    }
  }
}

char *sub_1A440(char *result, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = sub_1A4B4(result, a4);
    uint64_t v7 = (void *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      uint64_t v8 = *a2++;
      *v7++ = v8;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_1A498(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1A4B4(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_496C();
  }
  uint64_t result = (char *)sub_1041C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

uint64_t sub_1A4F8(uint64_t *a1, void *a2)
{
  uint64_t result = sub_1A570((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

uint64_t sub_1A570(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  uint64_t v12[2] = &v15;
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
  sub_1A604((uint64_t)v12);
  return v10;
}

uint64_t sub_1A604(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_1A374(a1);
  }
  return a1;
}

uint64_t sub_1A63C(uint64_t a1, unsigned int *a2, int a3, int a4, char a5)
{
  *(_OWORD *)(a1 + 252) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 24sub_1736C(&a9, 0) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 16sub_1736C(&a9, 0) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 8sub_1736C(&a9, 0) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 272) = 0;
  *(_DWORD *)(a1 + 28sub_1736C(&a9, 0) = a3;
  *(_DWORD *)(a1 + 284) = a4;
  *(_DWORD *)(a1 + 288) = 0;
  *(unsigned char *)(a1 + 292) = a5;
  uint64_t v7 = a2[2];
  size_t v8 = 4 * v7 + 12;
  size_t v12 = v8;
  if (v7 <= 0x40)
  {
    long long v9 = (void *)sub_1A70C(a1);
LABEL_5:
    memmove(v9, a2, v8);
    return a1;
  }
  uint64_t v10 = (void **)sub_1A78C(a1, &v12);
  size_t v8 = v12;
  if (v12)
  {
    long long v9 = *v10;
    goto LABEL_5;
  }
  return a1;
}

void sub_1A6F8(_Unwind_Exception *a1)
{
  sub_10B08(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1A70C(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 272);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))off_28B40[v2])(&v4, a1);
  }
  *(_OWORD *)(a1 + 252) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 24sub_1736C(&a9, 0) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 16sub_1736C(&a9, 0) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 8sub_1736C(&a9, 0) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 272) = 0;
  return a1;
}

void *sub_1A78C(uint64_t a1, size_t *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 272);
  if (v4 != -1) {
    ((void (*)(char *, uint64_t))off_28B40[v4])(&v6, a1);
  }
  *(_DWORD *)(a1 + 272) = -1;
  uint64_t result = sub_1A7FC((void *)a1, *a2);
  *(_DWORD *)(a1 + 272) = 1;
  return result;
}

void *sub_1A7FC(void *a1, size_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1A870(a1, a2);
    uint64_t v4 = (char *)a1[1];
    uint64_t v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_1A854(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1A870(void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    sub_496C();
  }
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

uint64_t sub_1A8B4(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = 0x14C1BACF914C1BADLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) > 0xDD67C8A60DD67CLL) {
    sub_496C();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0x14C1BACF914C1BADLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x6EB3E45306EB3ELL) {
    unint64_t v9 = 0xDD67C8A60DD67CLL;
  }
  else {
    unint64_t v9 = v5;
  }
  v15[4] = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)sub_1AB98(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = (uint64_t)&v10[296 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v15[3] = &v10[296 * v9];
  sub_1A9E8(v11, (unsigned int *)a2);
  uint64_t v12 = *(void *)(a2 + 280);
  *(void *)(v11 + 285) = *(void *)(a2 + 285);
  *(void *)(v11 + 28sub_1736C(&a9, 0) = v12;
  v15[2] = v11 + 296;
  sub_1AAE4(a1, v15);
  uint64_t v13 = a1[1];
  sub_1ABE4((uint64_t)v15);
  return v13;
}

void sub_1A9D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1ABE4((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1A9E8(uint64_t a1, unsigned int *a2)
{
  *(unsigned char *)a1 = 0;
  *(_DWORD *)(a1 + 272) = -1;
  sub_1AA20(a1, a2);
  return a1;
}

uint64_t sub_1AA20(uint64_t result, unsigned int *a2)
{
  uint64_t v3 = (_DWORD *)result;
  uint64_t v4 = *(unsigned int *)(result + 272);
  if (v4 != -1) {
    uint64_t result = ((uint64_t (*)(char *, uint64_t))off_28B40[v4])(&v7, result);
  }
  v3[68] = -1;
  uint64_t v5 = a2[68];
  if (v5 != -1)
  {
    uint64_t result = (*(&off_28B50 + v5))((int)&v6, v3, a2);
    v3[68] = v5;
  }
  return result;
}

void *sub_1AAB0(int a1, void *__dst, void *__src)
{
  return memcpy(__dst, __src, 0x10CuLL);
}

__n128 sub_1AAC0(uint64_t a1, __n128 *a2, __n128 *a3)
{
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  __n128 result = *a3;
  *a2 = *a3;
  a2[1].n128_u64[0] = a3[1].n128_u64[0];
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  a3[1].n128_u64[0] = 0;
  return result;
}

uint64_t sub_1AAE4(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = a2[1];
  if (v5 == *a1)
  {
    uint64_t result = a2[1];
  }
  else
  {
    do
    {
      uint64_t result = sub_1A9E8(v6 - 296, (unsigned int *)(v5 - 296));
      uint64_t v8 = *(void *)(v5 - 16);
      *(void *)(v6 - 11) = *(void *)(v5 - 11);
      *(void *)(v6 - 16) = v8;
      v5 -= 296;
      uint64_t v6 = result;
    }
    while (v5 != v4);
  }
  a2[1] = result;
  uint64_t v9 = *a1;
  *a1 = result;
  a2[1] = v9;
  uint64_t v10 = a1[1];
  a1[1] = a2[2];
  a2[2] = v10;
  uint64_t v11 = a1[2];
  a1[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return result;
}

void *sub_1AB98(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xDD67C8A60DD67DLL) {
    sub_4A5C();
  }
  return operator new(296 * a2);
}

uint64_t sub_1ABE4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 296;
    sub_10B08(i - 296);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_1AC34(uint64_t a1, uint64_t a2)
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

void *sub_1ACCC(void *a1)
{
  *a1 = off_28B70;
  sub_1AF94(a1 + 2);
  return a1;
}

void sub_1AD10(void *a1)
{
  *a1 = off_28B70;
  sub_1AF94(a1 + 2);

  operator delete();
}

void *sub_1AD74(uint64_t a1)
{
  uint64_t v2 = operator new(0x30uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *v2 = off_28B70;
  v2[1] = v3;
  sub_1AC34((uint64_t)(v2 + 2), a1 + 16);
  return v2;
}

void sub_1ADCC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1ADE0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  *a2 = off_28B70;
  a2[1] = v2;
  return sub_1AC34((uint64_t)(a2 + 2), a1 + 16);
}

void *sub_1AE10(uint64_t a1)
{
  return sub_1AF94((void *)(a1 + 16));
}

void sub_1AE18(void *a1)
{
  sub_1AF94(a1 + 2);

  operator delete(a1);
}

BOOL sub_1AE54(uint64_t a1, uint64_t *a2)
{
  return sub_1AEDC((uint64_t (**)(uint64_t, char *))(a1 + 8), a2);
}

uint64_t sub_1AE5C(uint64_t a1, uint64_t a2)
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
  *uint64_t v3 = 0;
  return a1;
}

BOOL sub_1AEDC(uint64_t (**a1)(uint64_t, char *), uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v6 = 0;
  char v4 = (*a1)(v3, &v6);
  if (!v6) {
    return 0;
  }
  sub_1AF40((uint64_t)(a1 + 1), v4);
  return v6 != 0;
}

uint64_t sub_1AF40(uint64_t a1, char a2)
{
  char v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    sub_4B64();
  }
  return (*(uint64_t (**)(uint64_t, char *))(*(void *)v2 + 48))(v2, &v4);
}

void *sub_1AF94(void *a1)
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

void sub_1B01C()
{
}

void *sub_1B030()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = off_28BB8;
  return result;
}

void sub_1B068(uint64_t a1, void *a2)
{
  *a2 = off_28BB8;
}

void sub_1B090(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  sub_12008();
  if (v2)
  {
    sub_12008();
    uint64_t v3 = qword_2C148;
    if (os_log_type_enabled((os_log_t)qword_2C148, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 136315650;
      uint64_t v5 = "USBMIDIDevice.cpp";
      __int16 v6 = 1024;
      int v7 = 100;
      __int16 v8 = 1024;
      int v9 = v2;
      _os_log_impl(&def_F708, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d =====> NOTICE: USB I/O destructive tracing at level %d <=====", (uint8_t *)&v4, 0x18u);
    }
  }
}

void sub_1B160()
{
}

void *sub_1B174(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = off_28C00;
  result[1] = v3;
  return result;
}

uint64_t sub_1B1BC(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_28C00;
  a2[1] = v2;
  return result;
}

uint64_t sub_1B1E8(uint64_t result, unsigned char *a2)
{
  *(unsigned char *)(*(void *)(result + 8) + 187) = *a2;
  return result;
}

void sub_1B1FC()
{
}

void *sub_1B210(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = off_28C48;
  result[1] = v3;
  return result;
}

uint64_t sub_1B258(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_28C48;
  a2[1] = v2;
  return result;
}

uint64_t sub_1B284(uint64_t result, unsigned char *a2)
{
  *(unsigned char *)(*(void *)(result + 8) + 489) = *a2;
  return result;
}

void sub_1B298()
{
}

void *sub_1B2AC(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = off_28C90;
  result[1] = v3;
  return result;
}

uint64_t sub_1B2F4(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_28C90;
  a2[1] = v2;
  return result;
}

uint64_t sub_1B320(uint64_t result, unsigned char *a2)
{
  *(unsigned char *)(*(void *)(result + 8) + 49sub_1736C(&a9, 0) = *a2;
  return result;
}

uint64_t sub_1B330(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)*a1 + 88))(*a1, *a2, *(unsigned int *)(*a1 + 220));
}

void *sub_1B360(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *sub_1B36C(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t *sub_1B37C(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *uint64_t result = *a2;
  if (v2) {
    operator new();
  }
  result[1] = 0;
  *a2 = 0;
  return result;
}

void sub_1B400(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_1B438(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t sub_1B46C(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)*a1 + 96))(*a1, *a2, *(unsigned int *)(*a1 + 220));
}

void *sub_1B49C(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *sub_1B4A8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *sub_1B4B8(void *a1, void *a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a2[1];
  *a1 = *a2;
  if (!v3)
  {
    a1[1] = 0;
LABEL_5:
    sub_1B4FC();
  }
  int v4 = std::__shared_weak_count::lock(v3);
  a1[1] = v4;
  if (!v4) {
    goto LABEL_5;
  }
  return a1;
}

void sub_1B4FC()
{
  exception = __cxa_allocate_exception(8uLL);
}

void sub_1B548(uint64_t a1, uint64_t *a2, void *a3)
{
  uint64_t v5 = operator new(0x60uLL);
  sub_1B5BC(v5, a2, a3);
}

void sub_1B5A8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1B5BC(void *a1, uint64_t *a2, void *a3)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_28D78;
  sub_1B6B4((uint64_t)(a1 + 3), a2, a3);
}

void sub_1B604(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_1B618(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_28D78;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1B638(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_28D78;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_1B68C(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void sub_1B6B4(uint64_t a1, uint64_t *a2, void *a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a3[1];
  v5[0] = *a3;
  v5[1] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
  }
  sub_1B730(a1, v3, v5);
}

void sub_1B718(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_weak(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_1B730(uint64_t a1, uint64_t a2, void *a3)
{
  __int16 v6 = (void *)(a1 + 16);
  sub_218B4((void *)(a1 + 16));
  *(_DWORD *)(a1 + 8) = 1;
  *(void *)a1 = off_28DB0;
  uint64_t v7 = a3[1];
  *(void *)(a1 + 48) = *a3;
  *(void *)(a1 + 56) = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 16), 1uLL, memory_order_relaxed);
  }
  sub_21904(v6, a2);
}

void sub_1B7C8(_Unwind_Exception *a1)
{
  uint64_t v4 = *(std::__shared_weak_count **)(v2 + 56);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  sub_218C4(v1);
  _Unwind_Resume(a1);
}

void *sub_1B7E8(void *a1)
{
  *a1 = off_28DB0;
  uint64_t v2 = (std::__shared_weak_count *)a1[7];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  sub_218C4((uint64_t)(a1 + 2));
  return a1;
}

void sub_1B83C(void *a1)
{
  *a1 = off_28DB0;
  uint64_t v2 = (std::__shared_weak_count *)a1[7];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  sub_218C4((uint64_t)(a1 + 2));

  operator delete();
}

uint64_t sub_1B8B0(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void sub_1B8DC(long long *a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0x168uLL);
  sub_1B968(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;

  sub_1160C((uint64_t)a2, v4 + 3, (uint64_t)(v4 + 3));
}

void sub_1B954(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_1B968(void *a1, long long *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_28DD8;
  sub_1BA44((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_1B9B0(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C4(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_28DD8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1B9E4(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_28DD8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_1BA38(uint64_t a1)
{
  return sub_1DB0C(a1 + 24);
}

uint64_t sub_1BA44(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  sub_1D940(a1, &v4);
  if (*((void *)&v4 + 1)) {
    sub_11694(*((std::__shared_weak_count **)&v4 + 1));
  }
  return a1;
}

void sub_1BA90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_11694(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1BAA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = off_28E10;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 24) = 0;
  __int16 v6 = (mach_port_t *)(a1 + 24);
  *(void *)(a1 + 32) = 0;
  uint64_t v7 = (IONotificationPort **)(a1 + 32);
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 4sub_1736C(&a9, 0) = 0;
  __int16 v8 = (io_iterator_t *)(a1 + 40);
  *(unsigned char *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = a3;
  sub_1BF44();
  int v9 = qword_2C158;
  if (os_log_type_enabled((os_log_t)qword_2C158, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 136316162;
    unsigned int v27 = "IOServiceClient.cpp";
    __int16 v28 = 1024;
    int v29 = 37;
    __int16 v30 = 2048;
    uint64_t v31 = a1;
    __int16 v32 = 2048;
    uint64_t v33 = a2;
    __int16 v34 = 2048;
    uint64_t v35 = a3;
    _os_log_impl(&def_F708, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d [+] IOServiceClient(%p)::IOServiceClient(notifyRunLoop %p, matchingDict %p", (uint8_t *)&v26, 0x30u);
  }
  if (IOMainPort(0, v6)) {
    goto LABEL_21;
  }
  uint64_t v10 = *(const void **)(a1 + 8);
  if (!v10) {
    return a1;
  }
  CFRetain(v10);
  uint64_t v11 = IONotificationPortCreate(*v6);
  void *v7 = v11;
  if (!v11) {
    goto LABEL_21;
  }
  RunLoopMIDIObjectRef Source = IONotificationPortGetRunLoopSource(v11);
  *(void *)(a1 + 16) = RunLoopSource;
  if (!RunLoopSource) {
    goto LABEL_21;
  }
  CFRunLoopAddSource(*(CFRunLoopRef *)(a1 + 8), RunLoopSource, kCFRunLoopDefaultMode);
  sub_1BF44();
  uint64_t v13 = qword_2C158;
  if (os_log_type_enabled((os_log_t)qword_2C158, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *(void *)(a1 + 8);
    uint64_t v14 = *(void *)(a1 + 16);
    int v26 = 136315906;
    unsigned int v27 = "IOServiceClient.cpp";
    __int16 v28 = 1024;
    int v29 = 50;
    __int16 v30 = 2048;
    uint64_t v31 = v14;
    __int16 v32 = 2048;
    uint64_t v33 = v15;
    _os_log_impl(&def_F708, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d      added runloop source %p to runloop %p", (uint8_t *)&v26, 0x26u);
  }
  CFRetain(*(CFTypeRef *)(a1 + 56));
  sub_1BF44();
  int v16 = qword_2C158;
  if (os_log_type_enabled((os_log_t)qword_2C158, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = *(void *)(a1 + 56);
    int v26 = 136315650;
    unsigned int v27 = "IOServiceClient.cpp";
    __int16 v28 = 1024;
    int v29 = 53;
    __int16 v30 = 2112;
    uint64_t v31 = v17;
    _os_log_impl(&def_F708, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d      mMatchingDict: %@", (uint8_t *)&v26, 0x1Cu);
  }
  if (IOServiceAddMatchingNotification(*(IONotificationPortRef *)(a1 + 32), "IOServiceMatched", *(CFDictionaryRef *)(a1 + 56), (IOServiceMatchingCallback)sub_1BFB4, (void *)a1, v8))
  {
    goto LABEL_21;
  }
  sub_1BF44();
  unsigned int v18 = qword_2C158;
  if (os_log_type_enabled((os_log_t)qword_2C158, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 136315394;
    unsigned int v27 = "IOServiceClient.cpp";
    __int16 v28 = 1024;
    int v29 = 55;
    _os_log_impl(&def_F708, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d      signed up for matched notifications", (uint8_t *)&v26, 0x12u);
  }
  CFRetain(*(CFTypeRef *)(a1 + 56));
  if (IOServiceAddMatchingNotification(*(IONotificationPortRef *)(a1 + 32), "IOServiceTerminate", *(CFDictionaryRef *)(a1 + 56), (IOServiceMatchingCallback)sub_1C09C, (void *)a1, (io_iterator_t *)(a1 + 44)))
  {
LABEL_21:
    sub_1BF44();
    uint64_t v25 = qword_2C158;
    if (!os_log_type_enabled((os_log_t)qword_2C158, OS_LOG_TYPE_ERROR)) {
      return a1;
    }
    int v26 = 136315650;
    unsigned int v27 = "IOServiceClient.cpp";
    __int16 v28 = 1024;
    int v29 = 68;
    __int16 v30 = 2048;
    uint64_t v31 = a1;
    int v21 = "%25s:%-5d [!] IOServiceClient(%p)::IOServiceClient() - failure";
    unsigned int v22 = v25;
    os_log_type_t v23 = OS_LOG_TYPE_ERROR;
    goto LABEL_19;
  }
  sub_1BF44();
  BOOL v19 = qword_2C158;
  if (os_log_type_enabled((os_log_t)qword_2C158, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 136315394;
    unsigned int v27 = "IOServiceClient.cpp";
    __int16 v28 = 1024;
    int v29 = 59;
    _os_log_impl(&def_F708, v19, OS_LOG_TYPE_DEBUG, "%25s:%-5d      signed up for terminated notifications", (uint8_t *)&v26, 0x12u);
  }
  *(unsigned char *)(a1 + 48) = 1;
  sub_1BF44();
  uint64_t v20 = qword_2C158;
  if (os_log_type_enabled((os_log_t)qword_2C158, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 136315650;
    unsigned int v27 = "IOServiceClient.cpp";
    __int16 v28 = 1024;
    int v29 = 63;
    __int16 v30 = 2048;
    uint64_t v31 = a1;
    int v21 = "%25s:%-5d [-] IOServiceClient(%p)::IOServiceClient() - success";
    unsigned int v22 = v20;
    os_log_type_t v23 = OS_LOG_TYPE_DEBUG;
LABEL_19:
    _os_log_impl(&def_F708, v22, v23, v21, (uint8_t *)&v26, 0x1Cu);
  }
  return a1;
}

void sub_1BF44()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2C160, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2C160))
  {
    qword_2C158 = (uint64_t)os_log_create("com.apple.coremidi", "ioserv");
    __cxa_guard_release(&qword_2C160);
  }
}

uint64_t sub_1BFB4(uint64_t a1, io_iterator_t a2)
{
  sub_1BF44();
  long long v4 = qword_2C158;
  if (os_log_type_enabled((os_log_t)qword_2C158, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315906;
    uint64_t v7 = "IOServiceClient.cpp";
    __int16 v8 = 1024;
    int v9 = 106;
    __int16 v10 = 2048;
    uint64_t v11 = a1;
    __int16 v12 = 1024;
    io_iterator_t v13 = a2;
    _os_log_impl(&def_F708, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d [*] IOServiceClient::ServicePublishCallback(refcon %p, it %u)", (uint8_t *)&v6, 0x22u);
  }
  return sub_1C2F0(a1, a2);
}

uint64_t sub_1C09C(uint64_t a1, io_iterator_t a2)
{
  sub_1BF44();
  long long v4 = qword_2C158;
  if (os_log_type_enabled((os_log_t)qword_2C158, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315906;
    uint64_t v7 = "IOServiceClient.cpp";
    __int16 v8 = 1024;
    int v9 = 115;
    __int16 v10 = 2048;
    uint64_t v11 = a1;
    __int16 v12 = 1024;
    io_iterator_t v13 = a2;
    _os_log_impl(&def_F708, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d [*] IOServiceClient::ServiceTerminateCallback(refcon %p, it %u)", (uint8_t *)&v6, 0x22u);
  }
  return sub_1C370(a1, a2);
}

uint64_t sub_1C184(uint64_t a1)
{
  *(void *)a1 = off_28E10;
  sub_1BF44();
  uint64_t v2 = qword_2C158;
  if (os_log_type_enabled((os_log_t)qword_2C158, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315650;
    __int16 v12 = "IOServiceClient.cpp";
    __int16 v13 = 1024;
    int v14 = 76;
    __int16 v15 = 2048;
    uint64_t v16 = a1;
    _os_log_impl(&def_F708, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d [*] IOServiceClient(%p)::~IOServiceClient()", (uint8_t *)&v11, 0x1Cu);
  }
  uint64_t v3 = *(__CFRunLoop **)(a1 + 8);
  if (v3)
  {
    long long v4 = *(__CFRunLoopSource **)(a1 + 16);
    if (v4)
    {
      CFRunLoopRemoveSource(v3, v4, kCFRunLoopDefaultMode);
      CFRelease(*(CFTypeRef *)(a1 + 8));
    }
  }
  uint64_t v5 = *(const void **)(a1 + 16);
  if (v5) {
    CFRelease(v5);
  }
  io_object_t v6 = *(_DWORD *)(a1 + 40);
  if (v6) {
    IOObjectRelease(v6);
  }
  io_object_t v7 = *(_DWORD *)(a1 + 44);
  if (v7) {
    IOObjectRelease(v7);
  }
  mach_port_name_t v8 = *(_DWORD *)(a1 + 24);
  if (v8) {
    mach_port_deallocate(mach_task_self_, v8);
  }
  int v9 = *(const void **)(a1 + 56);
  if (v9) {
    CFRelease(v9);
  }
  return a1;
}

void sub_1C2DC(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_45C4(a1);
}

uint64_t sub_1C2F0(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v5 = result;
    do
    {
      (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 16))(a1, v5);
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t sub_1C370(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v5 = result;
    do
    {
      (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 24))(a1, v5);
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

void sub_1C3F0(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 24))
  {
    if (*(unsigned char *)(a1 + 48))
    {
      sub_1BF44();
      uint64_t v2 = qword_2C158;
      if (os_log_type_enabled((os_log_t)qword_2C158, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        mach_port_name_t v8 = "IOServiceClient.cpp";
        __int16 v9 = 1024;
        int v10 = 130;
        __int16 v11 = 2048;
        uint64_t v12 = a1;
        _os_log_impl(&def_F708, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d [*] IOServiceClient(%p)ScanServices() - emptying iterators ...", buf, 0x1Cu);
      }
      *(unsigned char *)(a1 + 48) = 0;
      sub_1C2F0(a1, *(_DWORD *)(a1 + 40));
      sub_1C370(a1, *(_DWORD *)(a1 + 44));
    }
    else
    {
      io_iterator_t existing = 0;
      CFRetain(*(CFTypeRef *)(a1 + 56));
      sub_1BF44();
      long long v4 = qword_2C158;
      if (os_log_type_enabled((os_log_t)qword_2C158, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v5 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 136315906;
        mach_port_name_t v8 = "IOServiceClient.cpp";
        __int16 v9 = 1024;
        int v10 = 140;
        __int16 v11 = 2048;
        uint64_t v12 = a1;
        __int16 v13 = 2112;
        uint64_t v14 = v5;
        _os_log_impl(&def_F708, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d [*] IOServiceClient(%p)ScanServices() - getting matching services for dictionary: %@", buf, 0x26u);
      }
      if (!IOServiceGetMatchingServices(*(_DWORD *)(a1 + 24), *(CFDictionaryRef *)(a1 + 56), &existing)) {
        sub_1C2F0(a1, existing);
      }
      if (existing) {
        IOObjectRelease(existing);
      }
    }
  }
  else
  {
    sub_1BF44();
    uint64_t v3 = qword_2C158;
    if (os_log_type_enabled((os_log_t)qword_2C158, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      mach_port_name_t v8 = "IOServiceClient.cpp";
      __int16 v9 = 1024;
      int v10 = 125;
      __int16 v11 = 2048;
      uint64_t v12 = a1;
      _os_log_impl(&def_F708, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d [!] IOServiceClient(%p)::ScanServices() - mMainDevicePort == 0", buf, 0x1Cu);
    }
  }
}

void sub_1C61C(int a1, void *a2, MIDIDeviceRef device, void *a4, uint64_t a5, char **a6)
{
  int NumberOfEntities = MIDIDeviceGetNumberOfEntities(device);
  SInt32 outValue = 0;
  if (NumberOfEntities >= 1)
  {
    ItemCount v11 = 0;
    SInt32 v87 = 0;
    uint64_t v83 = (NumberOfEntities - 1);
    uint64_t v12 = (void *)(a5 + 16);
    uint64_t v90 = (uint64_t)(a6 + 2);
    if (a1) {
      __int16 v13 = a2;
    }
    else {
      __int16 v13 = 0;
    }
    uint64_t v81 = NumberOfEntities;
    int v78 = a1 ^ 1;
    int v82 = a1;
    uint64_t v79 = NumberOfEntities - 1;
    uint64_t v80 = v13;
    do
    {
      uint64_t Entity = MIDIDeviceGetEntity(device, v11);
      uint64_t v15 = Entity;
      if (v11 >= (uint64_t)(a4[1] - *a4) >> 3) {
        MIDIObjectGetIntegerProperty(Entity, @"First Group", &outValue);
      }
      else {
        SInt32 outValue = *(unsigned __int8 *)(*a4 + 8 * v11 + 5);
      }
      if (v83 == v11)
      {
        SInt32 v92 = 0;
        OSStatus IntegerProperty = MIDIObjectGetIntegerProperty(v15, kMIDIPropertyUMPCanTransmitGroupless, &v92);
        SInt32 v17 = v92;
        if (IntegerProperty) {
          SInt32 v17 = IntegerProperty;
        }
        SInt32 v87 = v17;
      }
      ItemCount v86 = v11;
      ItemCount NumberOfSources = MIDIEntityGetNumberOfSources(v15);
      ItemCount NumberOfDestinations = MIDIEntityGetNumberOfDestinations(v15);
      if (a1 && NumberOfSources)
      {
        for (ItemCount i = 0; i != NumberOfSources; ++i)
        {
          uint64_t v19 = v15;
          MIDIEndpointRef Source = MIDIEntityGetSource(v15, i);
          int v21 = *(MIDIEndpointRef **)(a5 + 8);
          if (!v87)
          {
            unint64_t v29 = i + outValue;
            while (1)
            {
              __int16 v30 = *(MIDIEndpointRef **)a5;
              unint64_t v31 = ((uint64_t)v21 - *(void *)a5) >> 2;
              if (v31 >= v29) {
                break;
              }
              if ((unint64_t)v21 >= *v12)
              {
                unint64_t v33 = v31 + 1;
                if ((v31 + 1) >> 62) {
                  goto LABEL_102;
                }
                uint64_t v34 = *v12 - (void)v30;
                if (v34 >> 1 > v33) {
                  unint64_t v33 = v34 >> 1;
                }
                if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v35 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v35 = v33;
                }
                if (v35)
                {
                  int v36 = (char *)sub_1CB84(a5 + 16, v35);
                  __int16 v30 = *(MIDIEndpointRef **)a5;
                  int v21 = *(MIDIEndpointRef **)(a5 + 8);
                }
                else
                {
                  int v36 = 0;
                }
                unsigned int v37 = &v36[4 * v31];
                *(_DWORD *)unsigned int v37 = 0;
                __int16 v32 = v37 + 4;
                while (v21 != v30)
                {
                  int v38 = *--v21;
                  *((_DWORD *)v37 - 1) = v38;
                  v37 -= 4;
                }
                *(void *)a5 = v37;
                *(void *)(a5 + 8) = v32;
                *(void *)(a5 + 16) = &v36[4 * v35];
                if (v30) {
                  operator delete(v30);
                }
              }
              else
              {
                MIDIEndpointRef *v21 = 0;
                __int16 v32 = v21 + 1;
              }
              *(void *)(a5 + 8) = v32;
              unint64_t v40 = (unint64_t)a6[1];
              unint64_t v39 = (unint64_t)a6[2];
              if (v40 >= v39)
              {
                unint64_t v42 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v40 - (void)*a6) >> 1);
                unint64_t v43 = v42 + 1;
                if (v42 + 1 > 0x2AAAAAAAAAAAAAAALL) {
                  goto LABEL_103;
                }
                unint64_t v44 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v39 - (void)*a6) >> 1);
                if (2 * v44 > v43) {
                  unint64_t v43 = 2 * v44;
                }
                if (v44 >= 0x1555555555555555) {
                  unint64_t v45 = 0x2AAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v45 = v43;
                }
                if (v45) {
                  int v46 = (char *)sub_F280(v90, v45);
                }
                else {
                  int v46 = 0;
                }
                int v47 = &v46[6 * v42];
                *((_WORD *)v47 + 2) = 0;
                *(_DWORD *)int v47 = 0;
                unsigned int v49 = *a6;
                unsigned int v48 = a6[1];
                unsigned __int8 v50 = v47;
                if (v48 != *a6)
                {
                  do
                  {
                    int v51 = *(_DWORD *)(v48 - 6);
                    v48 -= 6;
                    __int16 v52 = *((_WORD *)v48 + 2);
                    *(_DWORD *)(v50 - 6) = v51;
                    v50 -= 6;
                    *((_WORD *)v50 + 2) = v52;
                  }
                  while (v48 != v49);
                  unsigned int v48 = *a6;
                }
                uint64_t v41 = v47 + 6;
                *a6 = v50;
                a6[1] = v47 + 6;
                a6[2] = &v46[6 * v45];
                if (v48) {
                  operator delete(v48);
                }
              }
              else
              {
                *(_WORD *)(v40 + 4) = 0;
                *(_DWORD *)unint64_t v40 = 0;
                uint64_t v41 = (char *)(v40 + 6);
              }
              a6[1] = v41;
              int v21 = *(MIDIEndpointRef **)(a5 + 8);
            }
          }
          if ((unint64_t)v21 >= *v12)
          {
            os_log_type_t v23 = *(MIDIEndpointRef **)a5;
            uint64_t v24 = ((uint64_t)v21 - *(void *)a5) >> 2;
            unint64_t v25 = v24 + 1;
            if ((unint64_t)(v24 + 1) >> 62) {
LABEL_102:
            }
              sub_496C();
            uint64_t v26 = *v12 - (void)v23;
            if (v26 >> 1 > v25) {
              unint64_t v25 = v26 >> 1;
            }
            if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v27 = v25;
            }
            if (v27)
            {
              __int16 v28 = (char *)sub_1CB84(a5 + 16, v27);
              os_log_type_t v23 = *(MIDIEndpointRef **)a5;
              int v21 = *(MIDIEndpointRef **)(a5 + 8);
            }
            else
            {
              __int16 v28 = 0;
            }
            unsigned int v53 = (MIDIEndpointRef *)&v28[4 * v24];
            *unsigned int v53 = Source;
            unsigned int v22 = v53 + 1;
            while (v21 != v23)
            {
              MIDIEndpointRef v54 = *--v21;
              *--unsigned int v53 = v54;
            }
            *(void *)a5 = v53;
            *(void *)(a5 + 8) = v22;
            *(void *)(a5 + 16) = &v28[4 * v27];
            if (v23) {
              operator delete(v23);
            }
          }
          else
          {
            MIDIEndpointRef *v21 = Source;
            unsigned int v22 = v21 + 1;
          }
          *(void *)(a5 + 8) = v22;
          unint64_t v56 = (unint64_t)a6[1];
          unint64_t v55 = (unint64_t)a6[2];
          if (v56 >= v55)
          {
            unint64_t v58 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v56 - (void)*a6) >> 1);
            unint64_t v59 = v58 + 1;
            if (v58 + 1 > 0x2AAAAAAAAAAAAAAALL) {
LABEL_103:
            }
              sub_496C();
            unint64_t v60 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v55 - (void)*a6) >> 1);
            if (2 * v60 > v59) {
              unint64_t v59 = 2 * v60;
            }
            if (v60 >= 0x1555555555555555) {
              unint64_t v61 = 0x2AAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v61 = v59;
            }
            if (v61) {
              __int16 v62 = (char *)sub_F280(v90, v61);
            }
            else {
              __int16 v62 = 0;
            }
            int v63 = &v62[6 * v58];
            *((_WORD *)v63 + 2) = 0;
            *(_DWORD *)int v63 = 0;
            int v65 = *a6;
            __int16 v64 = a6[1];
            __int16 v66 = v63;
            if (v64 != *a6)
            {
              do
              {
                int v67 = *(_DWORD *)(v64 - 6);
                v64 -= 6;
                __int16 v68 = *((_WORD *)v64 + 2);
                *(_DWORD *)(v66 - 6) = v67;
                v66 -= 6;
                *((_WORD *)v66 + 2) = v68;
              }
              while (v64 != v65);
              __int16 v64 = *a6;
            }
            int v57 = v63 + 6;
            *a6 = v66;
            a6[1] = v63 + 6;
            a6[2] = &v62[6 * v61];
            if (v64) {
              operator delete(v64);
            }
          }
          else
          {
            *(_WORD *)(v56 + 4) = 0;
            *(_DWORD *)unint64_t v56 = 0;
            int v57 = (char *)(v56 + 6);
          }
          a6[1] = v57;
          uint64_t v15 = v19;
        }
      }
      if (NumberOfDestinations)
      {
        MIDIEntityRef v69 = v15;
        ItemCount v70 = 0;
        int v71 = v78;
        if (!v87) {
          int v71 = 1;
        }
        if (v79 == v86) {
          int v72 = v71;
        }
        else {
          int v72 = 1;
        }
        do
        {
          ItemCount v73 = v70 + outValue;
          MIDIEndpointRef Destination = MIDIEntityGetDestination(v69, v70);
          if (v82) {
            unsigned int v75 = (void *)v73;
          }
          else {
            unsigned int v75 = 0;
          }
          uint64_t v76 = 255;
          if (NumberOfDestinations - 1 != v70) {
            uint64_t v76 = (uint64_t)v75;
          }
          if (v72) {
            uint64_t v77 = v75;
          }
          else {
            uint64_t v77 = (void *)v76;
          }
          MIDIEndpointSetRefCons(Destination, v80, v77);
          ++v70;
        }
        while (NumberOfDestinations != v70);
      }
      ItemCount v11 = v86 + 1;
      a1 = v82;
    }
    while (v86 + 1 != v81);
  }
}

void *sub_1CB84(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_4A5C();
  }
  return operator new(4 * a2);
}

void sub_1CBBC(uint64_t a1, CFUUIDRef factoryID)
{
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)(a1 + 72) = 0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 8sub_1736C(&a9, 0) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)a1 = off_28E40;
  *(void *)(a1 + 8) = &unk_2C000;
  *(void *)(a1 + 16) = factoryID;
  CFPlugInAddInstanceForFactory(factoryID);
  *(void *)(a1 + 24) = 1;
  uint64_t v3 = off_28EA0;
  uint64_t v4 = a1;
  operator new();
}

void sub_1CDFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_45C4(exception_object);
}

void *sub_1CEF0(void *a1)
{
  *a1 = off_28E40;
  CFUUIDRef v2 = (const __CFUUID *)a1[2];
  if (v2) {
    CFPlugInRemoveInstanceForFactory(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)a1[10];
  if (v3) {
    sub_11694(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[7];
  if (v4) {
    sub_11694(v4);
  }
  return a1;
}

void sub_1CF5C(void *a1)
{
  sub_1CEF0(a1);

  operator delete();
}

uint64_t sub_1CF94(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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

uint64_t sub_1CFE8(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 72);
  if (!v4) {
    return 7;
  }
  *(_DWORD *)(a1 + 64) = a2;
  (*(void (**)(uint64_t, uint64_t))(*(void *)v4 + 16))(v4, a3);
  return 0;
}

uint64_t sub_1D040()
{
  return 0;
}

uint64_t sub_1D048(_DWORD *a1, CFUUIDBytes a2, void *a3)
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

uint64_t sub_1D200(uint64_t a1)
{
  uint64_t v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t sub_1D214(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16);
  uint64_t v2 = (v1 - 1);
  *(_DWORD *)(a1 + 16) = v2;
  if (v1 == 1) {
    (*(void (**)(void))(*(void *)(a1 - 8) + 8))();
  }
  return v2;
}

uint64_t sub_1D268(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 16))();
}

uint64_t sub_1D28C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 24))();
}

uint64_t sub_1D2B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 32))();
}

uint64_t sub_1D2D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 40))();
}

uint64_t sub_1D2F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 48))();
}

uint64_t sub_1D31C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 56))();
}

uint64_t sub_1D340(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 64))();
}

uint64_t sub_1D364(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 72))();
}

uint64_t sub_1D388(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 80))();
}

uint64_t sub_1D3AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 88))();
}

uint64_t sub_1D3D0(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)*a1 + 72))(*a1, *(unsigned int *)(*a1 + 64), *a2);
}

void *sub_1D400(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *sub_1D40C(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_1D41C(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)*a1 + 48))(*a1, *a2, *(void *)(*a1 + 32), *(void *)(*a1 + 40));
}

void *sub_1D44C(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *sub_1D458(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void sub_1D468(uint64_t a1, void *a2, unsigned __int8 *a3, uint64_t *a4)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = *a2;
  uint64_t v8 = a2[1];
  *(void *)(a1 + 32) = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 4sub_1736C(&a9, 0) = *(void *)a3;
  uint64_t v9 = *a4;
  *(_OWORD *)(a1 + 136) = 0u;
  *(void *)(a1 + 48) = v9;
  *(unsigned char *)(a1 + 56) = -1;
  *(void *)(a1 + 64) = 850045863;
  *(_DWORD *)(a1 + 212) = 0;
  *(_DWORD *)(a1 + 216) = 0;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 12sub_1736C(&a9, 0) = 0u;
  *(void *)(a1 + 152) = 0;
  *(unsigned char *)(a1 + 208) = 0;
  *(_OWORD *)(a1 + 24sub_1736C(&a9, 0) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(void *)(a1 + 32sub_1736C(&a9, 0) = 0;
  *(_DWORD *)(a1 + 328) = -1;
  *(unsigned char *)(a1 + 332) = 0;
  *(void *)(a1 + 192) = 0;
  *(void *)(a1 + 20sub_1736C(&a9, 0) = 0;
  *(void *)(a1 + 224) = 0;
  *(void *)(a1 + 232) = 0;
  *(_DWORD *)(a1 + 32sub_1736C(&a9, 0) = MIDICapabilityGetDiscoveryMUID();
  sub_1D888();
  CFUUIDRef v10 = qword_2C168;
  if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_INFO))
  {
    if (a3[1]) {
      unsigned __int8 v11 = *a3 | 0x80;
    }
    else {
      unsigned __int8 v11 = *a3;
    }
    int v12 = a3[6];
    int v13 = *((unsigned __int16 *)a3 + 2);
    if (*((unsigned char *)a4 + 1)) {
      unsigned __int8 v14 = *(unsigned char *)a4 | 0x80;
    }
    else {
      unsigned __int8 v14 = *(unsigned char *)a4;
    }
    int v15 = *((unsigned __int8 *)a4 + 6);
    int v16 = *((unsigned __int16 *)a4 + 2);
    int v17 = *(_DWORD *)(a1 + 320);
    buf[0] = 136317186;
    *(void *)&buf[1] = "MIDIProtocolNegotiator.cpp";
    __int16 v20 = 1024;
    int v21 = 141;
    __int16 v22 = 1024;
    int v23 = v11;
    __int16 v24 = 1024;
    int v25 = v12;
    __int16 v26 = 1024;
    int v27 = v13;
    __int16 v28 = 1024;
    int v29 = v14;
    __int16 v30 = 1024;
    int v31 = v15;
    __int16 v32 = 1024;
    int v33 = v16;
    __int16 v34 = 1024;
    int v35 = v17;
    _os_log_impl(&def_F708, v10, OS_LOG_TYPE_INFO, "%25s:%-5d [*] MIDIProtocolNegotiatior(inEP: 0x%x (pipeIndex %u, mps %u), outEP: 0x%x (pipeIndex %u, mps %u) - Negotiating with MUID 0x%x", (uint8_t *)buf, 0x3Cu);
  }
  uint64_t v36 = a1;
  sub_1FB10((uint64_t)v18, &v36, a2);
}

void sub_1D790(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  if (a2) {
    sub_45C4(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D888()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2C170, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2C170))
  {
    qword_2C168 = (uint64_t)os_log_create("com.apple.coremidi", "proton");
    __cxa_guard_release(&qword_2C170);
  }
}

void *sub_1D8F8(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v3 = a2[1];
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  CFUUIDRef v5 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v3;
  if (v5) {
    sub_11694(v5);
  }
  return a1;
}

uint64_t sub_1D944(uint64_t a1)
{
  sub_1D888();
  uint64_t v2 = qword_2C168;
  if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)CFUUIDRef v10 = 136315394;
    *(void *)&uint64_t v10[4] = "MIDIProtocolNegotiator.cpp";
    __int16 v11 = 1024;
    int v12 = 193;
    _os_log_impl(&def_F708, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d [+] ~MIDIProtocolNegotiatior()", v10, 0x12u);
  }
  if (*(void *)(a1 + 128))
  {
    MIDITimerTaskDispose();
    *(void *)(a1 + 128) = 0;
  }
  *(unsigned char *)(a1 + 332) = 1;
  sub_1D888();
  uint64_t v3 = qword_2C168;
  if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)CFUUIDRef v10 = 136315394;
    *(void *)&uint64_t v10[4] = "MIDIProtocolNegotiator.cpp";
    __int16 v11 = 1024;
    int v12 = 196;
    _os_log_impl(&def_F708, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d [-] ~MIDIProtocolNegotiatior()", v10, 0x12u);
  }
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 232);
  if (v4) {
    sub_11694(v4);
  }
  CFUUIDRef v5 = *(std::__shared_weak_count **)(a1 + 200);
  if (v5) {
    sub_11694(v5);
  }
  *(void *)CFUUIDRef v10 = a1 + 136;
  sub_1A158((void ***)v10);
  std::mutex::~mutex((std::mutex *)(a1 + 64));
  CFUUIDRef v6 = *(std::__shared_weak_count **)(a1 + 32);
  if (v6) {
    sub_11694(v6);
  }
  uint64_t v7 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  uint64_t v8 = *(std::__shared_weak_count **)(a1 + 8);
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
  return a1;
}

void sub_1DB00(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_45C4(a1);
}

void sub_1DB10(uint64_t a1)
{
  sub_1D888();
  uint64_t v2 = qword_2C168;
  if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v8 = "MIDIProtocolNegotiator.cpp";
    __int16 v9 = 1024;
    int v10 = 201;
    _os_log_impl(&def_F708, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d [+] MIDIProtocolNegotiatior::negotiateProtocol()", buf, 0x12u);
  }
  char v5 = 2;
  int v6 = 512;
  sub_4C08(*(void *)(a1 + 16), 127, *(_DWORD *)(a1 + 320), 0xFFFFFFFu, 0x70u, &v5, 5);
  sub_1D888();
  uint64_t v3 = qword_2C168;
  if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v8 = "MIDIProtocolNegotiator.cpp";
    __int16 v9 = 1024;
    int v10 = 209;
    _os_log_impl(&def_F708, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d [Negotiating] Send Discovery message", buf, 0x12u);
  }
  *(_DWORD *)(a1 + 328) = 1;
  if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16))) {
    sub_1F7F8(a1, dbl_23B90[*(_DWORD *)(a1 + 328) == 1]);
  }
  else {
    sub_1DD1C(a1);
  }
  sub_1D888();
  uint64_t v4 = qword_2C168;
  if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v8 = "MIDIProtocolNegotiator.cpp";
    __int16 v9 = 1024;
    int v10 = 220;
    _os_log_impl(&def_F708, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d [-] MIDIProtocolNegotiatior::negotiateProtocol()", buf, 0x12u);
  }
}

void sub_1DD1C(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 332))
  {
    sub_1D888();
    uint64_t v2 = qword_2C168;
    if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_INFO))
    {
      int v3 = 136315394;
      uint64_t v4 = "MIDIProtocolNegotiator.cpp";
      __int16 v5 = 1024;
      int v6 = 460;
      _os_log_impl(&def_F708, v2, OS_LOG_TYPE_INFO, "%25s:%-5d [timeout]", (uint8_t *)&v3, 0x12u);
    }
    if (*(void *)(a1 + 128))
    {
      MIDITimerTaskDispose();
      *(void *)(a1 + 128) = 0;
    }
    *(unsigned char *)(a1 + 332) = 1;
    sub_1F330(a1, 0);
  }
}

uint64_t sub_1DE04(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v3 = 3758096385;
  if (a2 <= 3)
  {
    uint64_t v6 = *(void *)(a1 + 8 * a2 + 160);
    if (v6)
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 136) + 16 * a2);
      int v8 = *(unsigned __int8 *)(a1 + 208);
      if (*(unsigned char *)(v7 + 44))
      {
        if (!*(unsigned char *)(a1 + 208))
        {
          uint64_t v3 = 3758097109;
          sub_1D888();
          int v21 = qword_2C168;
          if (!os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG)) {
            return v3;
          }
          *(_DWORD *)buf = 136315650;
          int v27 = "MIDIProtocolNegotiator.cpp";
          __int16 v28 = 1024;
          int v29 = 229;
          __int16 v30 = 1024;
          LODWORD(v31) = a2;
          __int16 v22 = "%25s:%-5d [!] I/O pending on buffer %u";
LABEL_28:
          _os_log_impl(&def_F708, v21, OS_LOG_TYPE_DEBUG, v22, buf, 0x18u);
          return v3;
        }
        int v8 = 1;
      }
      *(unsigned char *)(v7 + 44) = 1;
      if (v8 && !a3) {
        return 0;
      }
      *(unsigned char *)(a1 + 208) = 1;
      uint64_t v9 = *(void *)(a1 + 24);
      sub_1D888();
      int v10 = qword_2C168;
      if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG))
      {
        __int16 v11 = *(unsigned __int8 **)(v7 + 24);
        sub_5980(__p, 3 * v6, 0);
        if (v25 >= 0) {
          int v12 = __p;
        }
        else {
          int v12 = (void **)__p[0];
        }
        uint64_t v13 = v6;
        do
        {
          unsigned int v14 = *v11++;
          *(unsigned char *)int v12 = a0123456789abcd_1[(unint64_t)v14 >> 4];
          *((unsigned char *)v12 + 1) = a0123456789abcd_1[v14 & 0xF];
          *((unsigned char *)v12 + 2) = 32;
          int v12 = (void **)((char *)v12 + 3);
          --v13;
        }
        while (v13);
        int v15 = __p;
        if (v25 < 0) {
          int v15 = (void **)__p[0];
        }
        *(_DWORD *)buf = 136315650;
        int v27 = "MIDIProtocolNegotiator.cpp";
        __int16 v28 = 1024;
        int v29 = 21;
        __int16 v30 = 2080;
        int v31 = v15;
        _os_log_impl(&def_F708, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d [+] writeAsyncWithBuffer: %s", buf, 0x1Cu);
        if (v25 < 0) {
          operator delete(__p[0]);
        }
      }
      int v16 = *(void ***)(v9 + 104);
      atomic_fetch_add((atomic_uint *volatile)(v7 + 8), 1u);
      int v17 = (*((uint64_t (**)(void **, void, void, uint64_t, void (*)(void *, int), uint64_t))*v16
             + 34))(v16, *(unsigned __int8 *)(v7 + 64), *(void *)(v7 + 24), v6, sub_1F460, a1);
      if (v17)
      {
        sub_1D888();
        unsigned int v18 = qword_2C168;
        if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_ERROR))
        {
          int v19 = *(unsigned __int8 *)(v7 + 64);
          uint64_t v20 = *(void *)(v7 + 24);
          *(_DWORD *)buf = 136316674;
          int v27 = "MIDIProtocolNegotiator.cpp";
          __int16 v28 = 1024;
          int v29 = 26;
          __int16 v30 = 2048;
          int v31 = v16;
          __int16 v32 = 1024;
          int v33 = v19;
          __int16 v34 = 2048;
          uint64_t v35 = v20;
          __int16 v36 = 2048;
          uint64_t v37 = v6;
          __int16 v38 = 1024;
          int v39 = v17;
          _os_log_impl(&def_F708, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d [!] writePipeAsync(%p, %u, %p, %lu, ...) = 0x%x", buf, 0x3Cu);
        }
        uint64_t v3 = (*((uint64_t (**)(void **, void, void, uint64_t, void (*)(void *, int), uint64_t))*v16
              + 34))(v16, *(unsigned __int8 *)(v7 + 64), *(void *)(v7 + 24), v6, sub_1F460, a1);
      }
      else
      {
        uint64_t v3 = 0;
      }
      sub_1D888();
      int v21 = qword_2C168;
      if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        int v27 = "MIDIProtocolNegotiator.cpp";
        __int16 v28 = 1024;
        int v29 = 31;
        __int16 v30 = 1024;
        LODWORD(v31) = v3;
        __int16 v22 = "%25s:%-5d [-] writeAsyncWithBuffer() = 0x%x";
        goto LABEL_28;
      }
    }
  }
  return v3;
}

void sub_1E1C4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (!*(unsigned char *)(a1 + 332))
  {
    __int16 v5 = *(std::__shared_weak_count **)(a2 + 56);
    if (v5)
    {
      uint64_t v7 = std::__shared_weak_count::lock(v5);
      if (v7 && *(void *)(a2 + 48))
      {
        *(unsigned char *)(a2 + 44) = 0;
        if (a3 < 5)
        {
          int v11 = 0;
        }
        else
        {
          sub_1D888();
          int v8 = qword_2C168;
          if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)__int16 v22 = 136315650;
            *(void *)&v22[4] = "MIDIProtocolNegotiator.cpp";
            *(_WORD *)&void v22[12] = 1024;
            *(_DWORD *)&v22[14] = 261;
            __int16 v23 = 1024;
            int v24 = a3;
            _os_log_impl(&def_F708, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d [*] MIDIProtocolNegotiatior::handleCIInput() - %u bytes received", v22, 0x18u);
          }
          *(void *)__int16 v22 = *(void *)(a2 + 24);
          *(void *)&v22[8] = a3 >> 2;
          uint64_t v9 = a1 + 248;
          uint64_t v10 = sub_1E468((uint64_t *)v22, a1 + 248 + *(void *)(a1 + 312), a1 + 312);
          int v11 = v10;
          int v12 = (unsigned __int8 *)(*(void *)(a1 + 312) + v10);
          *(void *)(a1 + 312) = v12;
          if (v10)
          {
            if (v12)
            {
              uint64_t v13 = v12;
              unsigned int v14 = (unsigned __int8 *)(a1 + 248);
              while (*v14 != 247)
              {
                ++v14;
                if (!--v13)
                {
                  unsigned int v14 = &v12[v9];
                  break;
                }
              }
            }
            else
            {
              unsigned int v14 = (unsigned __int8 *)(a1 + 248);
            }
            if (v12 != &v14[-v9])
            {
              sub_1E90C(a1);
LABEL_23:
              if (v7) {
                sub_11694(v7);
              }
              return;
            }
          }
        }
        sub_1D888();
        uint64_t v20 = qword_2C168;
        if (!os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_INFO)) {
          goto LABEL_23;
        }
        uint64_t v21 = *(void *)(a1 + 312);
        *(_DWORD *)__int16 v22 = 136315906;
        *(void *)&v22[4] = "MIDIProtocolNegotiator.cpp";
        *(_WORD *)&void v22[12] = 1024;
        *(_DWORD *)&v22[14] = 269;
        __int16 v23 = 1024;
        int v24 = v11;
        __int16 v25 = 1024;
        int v26 = v21;
        int v16 = "%25s:%-5d [Negotiating] Read %u bytes (%u total), reading more ...";
        int v17 = v20;
        os_log_type_t v18 = OS_LOG_TYPE_INFO;
        uint32_t v19 = 30;
LABEL_22:
        _os_log_impl(&def_F708, v17, v18, v16, v22, v19);
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    sub_1D888();
    uint64_t v15 = qword_2C168;
    if (!os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_23;
    }
    *(_DWORD *)__int16 v22 = 136315394;
    *(void *)&v22[4] = "MIDIProtocolNegotiator.cpp";
    *(_WORD *)&void v22[12] = 1024;
    *(_DWORD *)&v22[14] = 255;
    int v16 = "%25s:%-5d [readCallback: owning USBMIDIDevice destroyed]";
    int v17 = v15;
    os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
    uint32_t v19 = 18;
    goto LABEL_22;
  }
}

void sub_1E450(_Unwind_Exception *a1)
{
  sub_11694(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1E468(uint64_t *a1, unint64_t a2, unint64_t a3)
{
  if (a2 >= a3) {
    return 0;
  }
  int v3 = a3;
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  sub_1D888();
  uint64_t v7 = qword_2C168;
  if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    unint64_t v43 = "MIDIProtocolNegotiator.cpp";
    __int16 v44 = 1024;
    int v45 = 45;
    __int16 v46 = 1024;
    int v47 = v6;
    __int16 v48 = 1024;
    unsigned int v49 = v3 - a2;
    _os_log_impl(&def_F708, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d [*] appendSysExToBuffer() - wordCount %u, %u bytes available", buf, 0x1Eu);
  }
  if (v6)
  {
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    unint64_t v10 = v5 + 4 * v6;
    unint64_t v40 = v6;
    while (1)
    {
      int v11 = (unsigned int *)(*a1 + 4 * v8);
      if ((unint64_t)v11 >= v10) {
        goto LABEL_51;
      }
      unsigned int v12 = *v11;
      unsigned int v13 = *v11 >> 28;
      if (v13 == 1)
      {
        sub_1D888();
        uint64_t v19 = qword_2C168;
        if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG))
        {
          int v20 = *v11;
          *(_DWORD *)buf = 136315650;
          unint64_t v43 = "MIDIProtocolNegotiator.cpp";
          __int16 v44 = 1024;
          int v45 = 54;
          __int16 v46 = 1024;
          int v47 = v20;
          uint64_t v21 = v19;
          os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
          __int16 v23 = "%25s:%-5d      skipping msg: 0x%08x";
LABEL_19:
          _os_log_impl(&def_F708, v21, v22, v23, buf, 0x18u);
        }
      }
      else
      {
        if (v13 == 3)
        {
          uint64_t __src = 0;
          unsigned int v14 = (v12 >> 20) & 0xF;
          BOOL v15 = v14 == 0;
          BOOL v16 = v14 == 3;
          if (v14 == 3) {
            BOOL v15 = 1;
          }
          int v17 = HIWORD(v12) & 0xF;
          if (v14 < 2) {
            ++v17;
          }
          unsigned int v18 = v17 + v15;
          if ((v17 + v15) <= 8)
          {
            BOOL v26 = v14 == 3 || v14 == 0;
            LODWORD(v27) = v17 + v15;
            if (v26)
            {
              uint64_t v27 = (int)v18 - 1;
              *((unsigned char *)&__src + v27) = -9;
            }
            if (v14 > 1)
            {
              p_src = (char *)&__src;
            }
            else
            {
              LOBYTE(__src) = -16;
              LODWORD(v27) = v27 - 1;
              p_src = (char *)&__src + 1;
            }
            if ((int)v27 >= 1)
            {
              char v29 = 0;
              uint64_t v30 = 0;
              do
              {
                if (v30 <= 5)
                {
                  if (v30 >= 2) {
                    char v32 = 40;
                  }
                  else {
                    char v32 = 8;
                  }
                  char v31 = v11[v30 > 1] >> (v32 + v29);
                }
                else
                {
                  char v31 = 0;
                }
                p_src[v30] = v31;
                v29 -= 8;
                ++v30;
              }
              while (v27 != v30);
            }
          }
          else
          {
            unsigned int v18 = 0;
          }
          sub_1D888();
          int v33 = qword_2C168;
          if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG))
          {
            int v34 = *v11;
            unsigned int v35 = v11[1];
            __int16 v36 = (const char *)&unk_22591;
            if (v14 == 3) {
              __int16 v36 = "[END]";
            }
            *(_DWORD *)buf = 136316418;
            unint64_t v43 = "MIDIProtocolNegotiator.cpp";
            __int16 v44 = 1024;
            int v45 = 60;
            __int16 v46 = 1024;
            int v47 = v34;
            __int16 v48 = 1024;
            unsigned int v49 = v35;
            __int16 v50 = 1024;
            unsigned int v51 = v18;
            __int16 v52 = 2080;
            unsigned int v53 = v36;
            _os_log_impl(&def_F708, v33, OS_LOG_TYPE_DEBUG, "%25s:%-5d      sysex 0x%08x 0x%08x (%u bytes converted) %s", buf, 0x2Eu);
          }
          memcpy((void *)(a2 + v9), &__src, v18);
          v9 += v18;
          unint64_t v6 = v40;
          goto LABEL_44;
        }
        sub_1D888();
        uint64_t v24 = qword_2C168;
        if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_ERROR))
        {
          int v25 = *v11;
          *(_DWORD *)buf = 136315650;
          unint64_t v43 = "MIDIProtocolNegotiator.cpp";
          __int16 v44 = 1024;
          int v45 = 51;
          __int16 v46 = 1024;
          int v47 = v25;
          uint64_t v21 = v24;
          os_log_type_t v22 = OS_LOG_TYPE_ERROR;
          __int16 v23 = "%25s:%-5d [!] appendSysExToBuffer() - sysex message cannot be interrupted with message with first word 0x%x";
          goto LABEL_19;
        }
      }
      BOOL v16 = 0;
LABEL_44:
      unint64_t v8 = v8 + byte_23AF8[(unint64_t)*v11 >> 28];
      if (v8 >= v6 || v16) {
        goto LABEL_51;
      }
    }
  }
  uint64_t v9 = 0;
LABEL_51:
  sub_1D888();
  __int16 v38 = qword_2C168;
  if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    unint64_t v43 = "MIDIProtocolNegotiator.cpp";
    __int16 v44 = 1024;
    int v45 = 66;
    __int16 v46 = 1024;
    int v47 = v9;
    _os_log_impl(&def_F708, v38, OS_LOG_TYPE_DEBUG, "%25s:%-5d [*] appendSysExToBuffer() - %u total bytes copied", buf, 0x18u);
  }
  return v9;
}

void sub_1E90C(uint64_t a1)
{
  sub_1D888();
  uint64_t v2 = qword_2C168;
  if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 312);
    if (v3)
    {
      sub_5980(__p, 3 * v3, 0);
      uint64_t v4 = (unsigned __int8 *)(a1 + 248);
      if (v46 >= 0) {
        uint64_t v5 = __p;
      }
      else {
        uint64_t v5 = (void **)__p[0];
      }
      do
      {
        unsigned int v6 = *v4++;
        *(unsigned char *)uint64_t v5 = a0123456789abcd_1[(unint64_t)v6 >> 4];
        *((unsigned char *)v5 + 1) = a0123456789abcd_1[v6 & 0xF];
        *((unsigned char *)v5 + 2) = 32;
        uint64_t v5 = (void **)((char *)v5 + 3);
        --v3;
      }
      while (v3);
    }
    else
    {
      sub_F1CC(__p, (char *)&unk_22591);
    }
    uint64_t v7 = __p;
    if (v46 < 0) {
      uint64_t v7 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
    __int16 v48 = 1024;
    int v49 = 278;
    __int16 v50 = 2080;
    *(void *)unsigned int v51 = v7;
    _os_log_impl(&def_F708, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d [handleMessage] RCV: %s", buf, 0x1Cu);
    if (v46 < 0) {
      operator delete(__p[0]);
    }
  }
  int v8 = *(_DWORD *)(a1 + 328);
  if (v8 == 1)
  {
    if (sub_1F978(a1 + 248, *(void *)(a1 + 312), 113, 31))
    {
      if (*(void *)(a1 + 128))
      {
        MIDITimerTaskDispose();
        *(void *)(a1 + 128) = 0;
      }
      *(_DWORD *)(a1 + 324) = *(unsigned char *)(a1 + 254) & 0x7F | ((*(unsigned char *)(a1 + 255) & 0x7F) << 7) & 0x3FFF | ((*(unsigned char *)(a1 + 256) & 0x7F) << 14) & 0xF01FFFFF | ((*(unsigned char *)(a1 + 257) & 0x7F) << 21);
      sub_1D888();
      uint64_t v9 = qword_2C168;
      if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_INFO))
      {
        int v10 = *(_DWORD *)(a1 + 324);
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
        __int16 v48 = 1024;
        int v49 = 283;
        __int16 v50 = 1024;
        *(_DWORD *)unsigned int v51 = v10;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = v10;
        _os_log_impl(&def_F708, v9, OS_LOG_TYPE_INFO, "%25s:%-5d [handleMessage: Discovery Reply] Discovered MUID 0x%x (%u)", buf, 0x1Eu);
      }
      *(_WORD *)&buf[8] = 0;
      *(void *)buf = 0x20000000001;
      sub_4C08(*(void *)(a1 + 16), 127, *(_DWORD *)(a1 + 320), *(_DWORD *)(a1 + 324), 0x10u, buf, 10);
      *(_DWORD *)(a1 + 328) = 2;
      if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 24))())
      {
        sub_1F7F8(a1, dbl_23B90[*(_DWORD *)(a1 + 328) == 1]);
LABEL_86:
        bzero((void *)(a1 + 248), 0x40uLL);
        *(void *)(a1 + 312) = 0;
        return;
      }
      int v41 = -536870163;
      goto LABEL_83;
    }
    int v8 = *(_DWORD *)(a1 + 328);
  }
  if (v8 != 2)
  {
LABEL_43:
    if (v8 == 4 && sub_1F978(a1 + 248, *(void *)(a1 + 312), 20, 64))
    {
      uint64_t v24 = 0;
      while (v24 == *(unsigned __int8 *)(a1 + v24 + 263))
      {
        if (++v24 == 48)
        {
          if (*(void *)(a1 + 128))
          {
            MIDITimerTaskDispose();
            *(void *)(a1 + 128) = 0;
          }
          sub_1D888();
          int v25 = qword_2C168;
          if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
            __int16 v48 = 1024;
            int v49 = 343;
            _os_log_impl(&def_F708, v25, OS_LOG_TYPE_INFO, "%25s:%-5d [Negotiating] Protocol Test: confirming new protocol established...", buf, 0x12u);
          }
          sub_4C08(*(void *)(a1 + 16), 127, *(_DWORD *)(a1 + 320), *(_DWORD *)(a1 + 324), 0x15u, 0, 0);
          if (!(*(unsigned int (**)(void))(**(void **)(a1 + 16) + 24))())
          {
            int v41 = -536870163;
            goto LABEL_83;
          }
          sub_1D888();
          BOOL v26 = qword_2C168;
          if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
            __int16 v48 = 1024;
            int v49 = 349;
            _os_log_impl(&def_F708, v26, OS_LOG_TYPE_INFO, "%25s:%-5d [Negotiating] Done with negotiation.", buf, 0x12u);
          }
          sub_1F330(a1, 8);
          goto LABEL_86;
        }
      }
    }
    if (*(void *)(a1 + 312) >= 5uLL && *(unsigned char *)(a1 + 252) == 127)
    {
      sub_1D888();
      uint64_t v27 = qword_2C168;
      if (!os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_ERROR)) {
        goto LABEL_86;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
      __int16 v48 = 1024;
      int v49 = 353;
      __int16 v28 = "%25s:%-5d [Negotiating] NAK received";
      char v29 = v27;
      uint32_t v30 = 18;
    }
    else
    {
      sub_1D888();
      uint64_t v31 = qword_2C168;
      if (!os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_ERROR)) {
        goto LABEL_86;
      }
      int v32 = *(unsigned __int8 *)(a1 + 248);
      int v33 = *(_DWORD *)(a1 + 328);
      uint64_t v34 = *(void *)(a1 + 312);
      uint64_t v35 = v34 - 1;
      if (!v34) {
        uint64_t v35 = 0;
      }
      int v36 = *(unsigned __int8 *)(a1 + 248 + v35);
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
      __int16 v48 = 1024;
      int v49 = 355;
      __int16 v50 = 1024;
      *(_DWORD *)unsigned int v51 = v33;
      *(_WORD *)&v51[4] = 1024;
      *(_DWORD *)&v51[6] = v34;
      __int16 v52 = 1024;
      int v53 = v32;
      __int16 v54 = 1024;
      int v55 = v36;
      __int16 v28 = "%25s:%-5d [!]  status = %d, msgSize = %u (%02x ... %02x)";
      char v29 = v31;
      uint32_t v30 = 42;
    }
LABEL_85:
    _os_log_impl(&def_F708, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
    goto LABEL_86;
  }
  unint64_t v11 = *(void *)(a1 + 312);
  BOOL v12 = sub_1F978(a1 + 248, v11, 17, v11);
  if (v11 <= 0x11 || !v12)
  {
    int v8 = *(_DWORD *)(a1 + 328);
    goto LABEL_43;
  }
  if (*(void *)(a1 + 128))
  {
    MIDITimerTaskDispose();
    *(void *)(a1 + 128) = 0;
  }
  sub_1D888();
  unsigned int v14 = qword_2C168;
  if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
    __int16 v48 = 1024;
    int v49 = 296;
    _os_log_impl(&def_F708, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d [Negotiating: Protocol Discovery] Examining protocols ...", buf, 0x12u);
  }
  unsigned int v15 = *(unsigned __int8 *)(a1 + 263);
  if (*(unsigned char *)(a1 + 263))
  {
    unsigned int v16 = 0;
    char v17 = 0;
    int v18 = 0;
    uint64_t v19 = (unsigned __int8 *)(a1 + 264);
    do
    {
      int v20 = *v19;
      int v21 = v19[2];
      sub_1D888();
      os_log_type_t v22 = qword_2C168;
      if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
        __int16 v48 = 1024;
        int v49 = 309;
        __int16 v50 = 1024;
        *(_DWORD *)unsigned int v51 = v20;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = v21;
        _os_log_impl(&def_F708, v22, OS_LOG_TYPE_DEBUG, "%25s:%-5d [Negotiating: Protocol Discovery] Found protocol: 0x%x, extension bitmap 0x%x", buf, 0x1Eu);
      }
      int v23 = ((v21 & 3) == 0) | v18;
      if (v20 != 1) {
        int v23 = v18;
      }
      if (v20 == 2) {
        v17 |= (v21 & 1) == 0;
      }
      else {
        int v18 = v23;
      }
      v19 += 5;
      ++v16;
    }
    while (v16 < v15);
  }
  else
  {
    LOBYTE(v18) = 0;
    char v17 = 0;
  }
  sub_1D888();
  uint64_t v37 = qword_2C168;
  if (v18 & 1) != 0 || (v17)
  {
    if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_INFO))
    {
      __int16 v38 = "MIDI-1UP";
      *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
      *(_DWORD *)buf = 136315650;
      if (v17) {
        __int16 v38 = "MIDI 2.0";
      }
      __int16 v48 = 1024;
      int v49 = 324;
      __int16 v50 = 2080;
      *(void *)unsigned int v51 = v38;
      _os_log_impl(&def_F708, v37, OS_LOG_TYPE_INFO, "%25s:%-5d [Negotiating: Protocol Discovery] Setting %s protocol...", buf, 0x1Cu);
    }
    if (v17) {
      char v39 = 2;
    }
    else {
      char v39 = 1;
    }
    LOBYTE(__p[0]) = v39;
    uint64_t v40 = *(void *)(a1 + 16);
    *(_DWORD *)((char *)__p + 1) = 0;
    sub_4C08(v40, 127, *(_DWORD *)(a1 + 320), *(_DWORD *)(a1 + 324), 0x12u, (char *)__p, 5);
    *(_DWORD *)(a1 + 328) = 3;
    int v41 = -536870163;
    if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 24))())
    {
      sub_1D888();
      unint64_t v42 = qword_2C168;
      if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
        __int16 v48 = 1024;
        int v49 = 332;
        _os_log_impl(&def_F708, v42, OS_LOG_TYPE_INFO, "%25s:%-5d [Negotiating: Test Protocol] Sending protocol test data ...", buf, 0x12u);
      }
      uint64_t v43 = *(void *)(a1 + 16);
      *(_DWORD *)(a1 + 328) = 4;
      sub_4C08(v43, 127, *(_DWORD *)(a1 + 320), *(_DWORD *)(a1 + 324), 0x13u, 0, 0);
      if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 24))())
      {
        sub_1F7F8(a1, dbl_23B90[*(_DWORD *)(a1 + 328) == 1]);
        int v41 = 0;
        *(unsigned char *)(a1 + 56) = v39;
      }
    }
    if (!v41) {
      goto LABEL_86;
    }
LABEL_83:
    sub_1D888();
    uint64_t v44 = qword_2C168;
    if (!os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_ERROR)) {
      goto LABEL_86;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
    __int16 v48 = 1024;
    int v49 = 360;
    __int16 v50 = 1024;
    *(_DWORD *)unsigned int v51 = v41;
    __int16 v28 = "%25s:%-5d [!] handleMessage failed with 0x%x";
    char v29 = v44;
    uint32_t v30 = 24;
    goto LABEL_85;
  }
  if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
    __int16 v48 = 1024;
    int v49 = 317;
    _os_log_impl(&def_F708, v37, OS_LOG_TYPE_ERROR, "%25s:%-5d [Negotiation Failure] No usable protocols discovered", buf, 0x12u);
  }
  sub_1DD1C(a1);
}

void sub_1F330(uint64_t a1, int a2)
{
  sub_1D888();
  uint64_t v4 = qword_2C168;
  if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = "success";
    uint64_t v9 = "MIDIProtocolNegotiator.cpp";
    int v8 = 136315650;
    if (!a2) {
      uint64_t v5 = "failure";
    }
    __int16 v10 = 1024;
    int v11 = 433;
    __int16 v12 = 2080;
    unsigned int v13 = v5;
    _os_log_impl(&def_F708, v4, OS_LOG_TYPE_INFO, "%25s:%-5d [*] MIDIProtocolNegotiator::finished(%s)", (uint8_t *)&v8, 0x1Cu);
  }
  *(unsigned char *)(a1 + 332) = 1;
  *(_DWORD *)(a1 + 328) = a2;
  uint64_t v6 = *(void *)(a1 + 24);
  if (v6 && !*(unsigned char *)(v6 + 184))
  {
    if ((a2 - 5) >= 4) {
      char v7 = -1;
    }
    else {
      char v7 = 0x2010201u >> (8 * (a2 - 5));
    }
    *(unsigned char *)(a1 + 56) = v7;
    sub_1F6A8(a1);
  }
}

void sub_1F460(void *a1, int a2)
{
  if (a2 == -536870165)
  {
    sub_1D888();
    uint64_t v2 = qword_2C168;
    if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 367;
      _os_log_impl(&def_F708, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d [write aborted]", buf, 0x12u);
    }
  }
  else if (a1)
  {
    sub_1B4B8(buf, a1);
    if (*(void *)buf && !*(unsigned char *)(*(void *)buf + 332))
    {
      uint64_t v3 = (std::mutex *)(*(void *)buf + 64);
      std::mutex::lock((std::mutex *)(*(void *)buf + 64));
      uint64_t v4 = *(void *)buf;
      uint64_t v5 = (void *)(*(void *)buf + 224);
      uint64_t v6 = *(void *)(*(void *)buf + 224);
      uint64_t v12 = v6;
      if (v6)
      {
        int v11 = (atomic_uint **)&v12;
        *(unsigned char *)(v6 + 44) = 0;
        int v7 = *(_DWORD *)(v4 + 216);
        *(_DWORD *)(v4 + 216) = v7 + 1;
        if (v7 == 3) {
          unsigned int v8 = 0;
        }
        else {
          unsigned int v8 = v7 + 1;
        }
        uint64_t v9 = (uint64_t *)(*(void *)(v4 + 136) + 16 * v8);
        if (*(unsigned char *)(*v9 + 44))
        {
          *(_DWORD *)(v4 + 216) = v8;
          sub_1D8F8(v5, v9);
        }
        else
        {
          __int16 v10 = *(std::__shared_weak_count **)(v4 + 232);
          *(void *)(v4 + 224) = 0;
          *(void *)(v4 + 232) = 0;
          if (v10) {
            sub_11694(v10);
          }
        }
        if (*(void *)(*(void *)buf + 24))
        {
          if (*(void *)(*(void *)buf + 224)) {
            sub_1DE04(*(void *)buf, *(unsigned int *)(*(void *)buf + 216), 1);
          }
          else {
            *(unsigned char *)(*(void *)buf + 208) = 0;
          }
        }
        sub_1F63C(&v11);
      }
      std::mutex::unlock(v3);
    }
    if (*(void *)&buf[8]) {
      sub_11694(*(std::__shared_weak_count **)&buf[8]);
    }
  }
}

void sub_1F604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, atomic_uint **a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  sub_1F63C(&a9);
  std::mutex::unlock(v12);
  if (a12) {
    sub_11694(a12);
  }
  _Unwind_Resume(a1);
}

atomic_uint ***sub_1F63C(atomic_uint ***a1)
{
  uint64_t v2 = **a1;
  if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
  }
  return a1;
}

void sub_1F6A8(uint64_t a1)
{
  sub_1D888();
  uint64_t v2 = qword_2C168;
  if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG))
  {
    int v3 = *(unsigned __int8 *)(a1 + 56);
    if (*(unsigned char *)(a1 + 41)) {
      unsigned __int8 v4 = *(unsigned char *)(a1 + 40) | 0x80;
    }
    else {
      unsigned __int8 v4 = *(unsigned char *)(a1 + 40);
    }
    if (*(unsigned char *)(a1 + 49)) {
      unsigned __int8 v5 = *(unsigned char *)(a1 + 48) | 0x80;
    }
    else {
      unsigned __int8 v5 = *(unsigned char *)(a1 + 48);
    }
    int v9 = 136316162;
    __int16 v10 = "MIDIProtocolNegotiator.cpp";
    __int16 v11 = 1024;
    int v12 = 424;
    __int16 v13 = 1024;
    int v14 = v3;
    __int16 v15 = 1024;
    int v16 = v4;
    __int16 v17 = 1024;
    int v18 = v5;
    _os_log_impl(&def_F708, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d [*] MIDIProtocolNegotiator::completeNegotiation(selectedProtocol:%x) - inEP: 0x%x, outEP: 0x%x", (uint8_t *)&v9, 0x24u);
  }
  uint64_t v6 = *(void *)(a1 + 24);
  if (v6 && !*(unsigned char *)(v6 + 184))
  {
    if (*(unsigned char *)(a1 + 41)) {
      unsigned __int8 v7 = *(unsigned char *)(a1 + 40) | 0x80;
    }
    else {
      unsigned __int8 v7 = *(unsigned char *)(a1 + 40);
    }
    if (*(unsigned char *)(a1 + 49)) {
      unsigned __int8 v8 = *(unsigned char *)(a1 + 48) | 0x80;
    }
    else {
      unsigned __int8 v8 = *(unsigned char *)(a1 + 48);
    }
    sub_13340(v6, v7, v8, *(unsigned __int8 *)(a1 + 56));
  }
}

void sub_1F7F8(uint64_t a1, double a2)
{
  if (!*(void *)(a1 + 128)) {
    *(void *)(a1 + 128) = MIDITimerTaskCreate();
  }
  mach_absolute_time();
  __udivti3();
  MIDITimerTaskSetNextWakeTime();
  sub_1D888();
  int v3 = qword_2C168;
  if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315650;
    unsigned __int8 v5 = "MIDIProtocolNegotiator.cpp";
    __int16 v6 = 1024;
    int v7 = 473;
    __int16 v8 = 2048;
    double v9 = a2;
    _os_log_impl(&def_F708, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d [Negotiating] Timeout %f ms from now", (uint8_t *)&v4, 0x1Cu);
  }
}

void sub_1F930(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 212);
  if (v1 == 3) {
    unsigned int v2 = 0;
  }
  else {
    unsigned int v2 = v1 + 1;
  }
  *(_DWORD *)(a1 + 212) = v2;
  uint64_t v3 = *(void *)(a1 + 136);
  long long v4 = *(_OWORD *)(v3 + 16 * v2);
  uint64_t v5 = *(void *)(v3 + 16 * v2 + 8);
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  __int16 v6 = *(std::__shared_weak_count **)(a1 + 200);
  *(_OWORD *)(a1 + 192) = v4;
  if (v6) {
    sub_11694(v6);
  }
}

BOOL sub_1F978(uint64_t a1, unint64_t a2, int a3, uint64_t a4)
{
  if (a2 < 5) {
    return 0;
  }
  int v9 = *(unsigned __int8 *)(a1 + 4);
  if (a2 != a4)
  {
    sub_1D888();
    __int16 v10 = qword_2C168;
    if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315906;
      __int16 v15 = "MIDIProtocolNegotiator.cpp";
      __int16 v16 = 1024;
      int v17 = 75;
      __int16 v18 = 1024;
      int v19 = a2;
      __int16 v20 = 1024;
      int v21 = a4;
      _os_log_impl(&def_F708, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d [*] spanMatchesTypeAndLength() - msgSize %u does not match supplied length %u", (uint8_t *)&v14, 0x1Eu);
    }
  }
  if (v9 != a3)
  {
    sub_1D888();
    __int16 v11 = qword_2C168;
    if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG))
    {
      int v12 = *(unsigned __int8 *)(a1 + 4);
      int v14 = 136315906;
      __int16 v15 = "MIDIProtocolNegotiator.cpp";
      __int16 v16 = 1024;
      int v17 = 77;
      __int16 v18 = 1024;
      int v19 = v12;
      __int16 v20 = 1024;
      int v21 = a3;
      _os_log_impl(&def_F708, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d [*] spanMatchesTypeAndLength() - subID2 %u does not match supplied type %u", (uint8_t *)&v14, 0x1Eu);
    }
  }
  return a2 == a4 && v9 == a3;
}

void sub_1FB10(uint64_t a1, uint64_t *a2, void *a3)
{
  uint64_t v5 = operator new(0x60uLL);
  sub_1FB84(v5, a2, a3);
}

void sub_1FB70(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1FB84(void *a1, uint64_t *a2, void *a3)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_28D78;
  sub_1FBE0((uint64_t)(a1 + 3), a2, a3);
}

void sub_1FBCC(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_1FBE0(uint64_t a1, uint64_t *a2, void *a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a3[1];
  v5[0] = *a3;
  v5[1] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
  }
  sub_1B730(a1, v3, v5);
}

void sub_1FC44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_weak(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_1FC5C(uint64_t *a1, unsigned __int8 **a2)
{
  uint64_t v3 = *a1;
  unint64_t v60 = (std::mutex *)(*a1 + 64);
  std::mutex::lock(v60);
  sub_1D888();
  uint64_t v4 = qword_2C168;
  if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_DEBUG))
  {
    __int16 v6 = *a2;
    uint64_t v5 = a2[1];
    int64_t v7 = v5 - *a2;
    if (v5 == *a2)
    {
      sub_F1CC(__p, (char *)&unk_22591);
    }
    else
    {
      sub_5980(__p, 3 * v7, 0);
      if (v64 >= 0) {
        __int16 v8 = __p;
      }
      else {
        __int16 v8 = (void **)__p[0];
      }
      int64_t v9 = v7;
      do
      {
        unsigned int v10 = *v6++;
        *(unsigned char *)__int16 v8 = a0123456789abcd_1[(unint64_t)v10 >> 4];
        *((unsigned char *)v8 + 1) = a0123456789abcd_1[v10 & 0xF];
        *((unsigned char *)v8 + 2) = 32;
        __int16 v8 = (void **)((char *)v8 + 3);
        --v9;
      }
      while (v9);
    }
    __int16 v11 = __p;
    if (v64 < 0) {
      __int16 v11 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136315906;
    __int16 v66 = "MIDIProtocolNegotiator.cpp";
    __int16 v67 = 1024;
    int v68 = 154;
    __int16 v69 = 1024;
    int v70 = v7;
    __int16 v71 = 2080;
    int v72 = v11;
    _os_log_impl(&def_F708, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d [+] MIDICIMessageEmitter %u bytes: %s", buf, 0x22u);
    if (v64 < 0) {
      operator delete(__p[0]);
    }
  }
  if (!*(void *)(v3 + 24)) {
    goto LABEL_103;
  }
  int64_t v12 = a2[1] - *a2;
  if (*((_DWORD *)a2 + 2) == *(_DWORD *)a2) {
    goto LABEL_103;
  }
  unsigned int v13 = v12 - (**a2 == 240) - ((*a2)[*((_DWORD *)a2 + 2) - *(_DWORD *)a2 - 1] == 247);
  if (v13)
  {
    if (v13 % 6) {
      unsigned int v14 = v13 / 6 + 1;
    }
    else {
      unsigned int v14 = v13 / 6;
    }
    int v15 = 8 * v14;
  }
  else
  {
    int v15 = 8;
  }
  unsigned int v61 = v15;
  unsigned int v16 = 0;
  if (!v12 || !v15)
  {
LABEL_94:
    if (v61 != v16)
    {
      sub_1D888();
      __int16 v52 = qword_2C168;
      if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v66 = "MIDIProtocolNegotiator.cpp";
        __int16 v67 = 1024;
        int v68 = 184;
        __int16 v69 = 1024;
        int v70 = v16;
        _os_log_impl(&def_F708, v52, OS_LOG_TYPE_ERROR, "%25s:%-5d [!] MIDICIMessageEmitter did not copy %u bytes", buf, 0x18u);
      }
    }
    goto LABEL_103;
  }
  unsigned int v17 = 0;
  unsigned int v16 = 0;
  unint64_t v58 = a2;
  uint64_t v59 = v3;
  while (1)
  {
    unsigned int v62 = v16;
    uint64_t v18 = *(void *)(v3 + 192);
    int v19 = *a2;
    uint64_t v20 = *(unsigned int *)(v18 + 40);
    if (v20)
    {
      uint64_t v21 = 0;
      LODWORD(v22) = 0;
      int v23 = 0;
      uint64_t v24 = &v19[v17];
      uint64_t v25 = *(void *)(v18 + 24);
      unint64_t v26 = v25 + v20;
      while (1)
      {
        if (v22)
        {
          int v27 = 2;
        }
        else
        {
          LODWORD(v22) = v24[v21] == 240;
          if (v24[v21] == 240) {
            int v27 = 1;
          }
          else {
            int v27 = 2;
          }
        }
        unsigned int v28 = (unsigned __int16)(v12 - v22);
        char v29 = (char *)&v24[v22];
        if (v28 >= 6) {
          uint64_t v30 = 6;
        }
        else {
          uint64_t v30 = (unsigned __int16)(v12 - v22);
        }
        uint64_t v31 = (char *)&v24[v22];
        if (v30)
        {
          uint64_t v32 = v30;
          uint64_t v31 = (char *)&v24[v22];
          while (*v31 != 247)
          {
            ++v31;
            if (!--v32)
            {
              uint64_t v31 = &v29[v30];
              break;
            }
          }
        }
        uint64_t v33 = v31 - v29;
        if (v28 == 7)
        {
          int v27 = 3;
          int v34 = v22 + 7;
        }
        else
        {
          int v34 = v22;
        }
        int v35 = v33 == v30 ? v27 : 3;
        LODWORD(v22) = v33 == v30 ? v34 : v22 + v30;
        uint64_t v36 = v33 == v30 ? v30 : (v30 - 1);
        unint64_t v37 = v36 >= 6 ? 6 : v36;
        if (!v37) {
          break;
        }
        char v38 = *v29;
        if (v37 == 1)
        {
          char v39 = 0;
          char v40 = 0;
LABEL_59:
          char v41 = 0;
LABEL_60:
          char v42 = 0;
LABEL_61:
          char v43 = 0;
          goto LABEL_62;
        }
        char v41 = v29[1];
        if (v37 < 3)
        {
          char v39 = 0;
          char v40 = 0;
          goto LABEL_60;
        }
        char v40 = v29[2];
        if (v37 == 3)
        {
          char v39 = 0;
          goto LABEL_60;
        }
        char v42 = v29[3];
        if (v37 < 5)
        {
          char v39 = 0;
          goto LABEL_61;
        }
        char v39 = v29[4];
        if (v37 == 5) {
          goto LABEL_61;
        }
        char v43 = v29[5];
LABEL_62:
        if ((unint64_t)v23 + v25 + 8 <= v26)
        {
          *(void **)((char *)v23 + v25) = (void *)((v35 << 20) | (v37 << 16) | ((unint64_t)(v38 & 0x7F) << 8) | v41 & 0x7F | ((unint64_t)(((v40 & 0x7F) << 24) | ((v42 & 0x7F) << 16) | ((v39 & 0x7F) << 8) | v43 & 0x7Fu) << 32) | 0x30000000);
          if (v35 == 3) {
            int v44 = 0;
          }
          else {
            int v44 = v36;
          }
          if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2C180, memory_order_acquire) & 1) == 0
            && __cxa_guard_acquire(&qword_2C180))
          {
            qword_2C178 = (uint64_t)os_log_create("com.apple.coremidi", "umptrs");
            __cxa_guard_release(&qword_2C180);
          }
          ++v23;
          uint64_t v22 = (v44 + v22);
          int v45 = qword_2C178;
          if (os_log_type_enabled((os_log_t)qword_2C178, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136316162;
            __int16 v66 = "USBMIDIUMPTranslation.h";
            __int16 v67 = 1024;
            int v68 = 450;
            __int16 v69 = 1024;
            int v70 = v22;
            __int16 v71 = 2048;
            int v72 = v23;
            __int16 v73 = 1024;
            int v74 = v12 - v22;
            _os_log_impl(&def_F708, v45, OS_LOG_TYPE_DEBUG, "%25s:%-5d [*] MIDI1SysExToUMPSysEx() - @ index %u: %lu UMP bytes written so far, %u legacy MIDI bytes remain", buf, 0x28u);
          }
          if (v35 != 3)
          {
            uint64_t v21 = v22;
            if (v12 > v22) {
              continue;
            }
          }
        }
        LODWORD(v12) = v12 - v22;
        a2 = v58;
        uint64_t v3 = v59;
        int v19 = *v58;
        goto LABEL_84;
      }
      char v39 = 0;
      char v40 = 0;
      char v38 = 0;
      goto LABEL_59;
    }
    LODWORD(v12) = 0;
    LODWORD(v23) = 0;
LABEL_84:
    uint64_t v46 = *(unsigned int *)(v3 + 212);
    *(void *)(v3 + 8 * v46 + 16sub_1736C(&a9, 0) = v23;
    if (!v23) {
      break;
    }
    int v47 = a2[1];
    int v48 = sub_1DE04(v3, v46, 0);
    if (v48)
    {
      sub_1D888();
      uint64_t v57 = qword_2C168;
      if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v66 = "MIDIProtocolNegotiator.cpp";
        __int16 v67 = 1024;
        int v68 = 174;
        __int16 v69 = 1024;
        int v70 = v48;
        __int16 v54 = "%25s:%-5d [!] copyEmitter: write failed with err 0x%x";
        int v55 = v57;
        uint32_t v56 = 24;
LABEL_101:
        _os_log_impl(&def_F708, v55, OS_LOG_TYPE_ERROR, v54, buf, v56);
      }
      goto LABEL_102;
    }
    if (!*(void *)(v3 + 224))
    {
      uint64_t v50 = *(void *)(v3 + 192);
      uint64_t v49 = *(void *)(v3 + 200);
      if (v49) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v49 + 8), 1uLL, memory_order_relaxed);
      }
      unsigned int v51 = *(std::__shared_weak_count **)(v3 + 232);
      *(void *)(v3 + 224) = v50;
      *(void *)(v3 + 232) = v49;
      if (v51) {
        sub_11694(v51);
      }
      *(_DWORD *)(v3 + 216) = *(_DWORD *)(v3 + 212);
    }
    unsigned int v16 = v23 + v62;
    sub_1F930(v3);
    if (v16 < v61)
    {
      unsigned int v17 = v47 - (v19 + v12);
      if (v12) {
        continue;
      }
    }
    goto LABEL_94;
  }
  sub_1D888();
  uint64_t v53 = qword_2C168;
  if (os_log_type_enabled((os_log_t)qword_2C168, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v66 = "MIDIProtocolNegotiator.cpp";
    __int16 v67 = 1024;
    int v68 = 169;
    __int16 v54 = "%25s:%-5d [!] copyEmitter: no bytes copied";
    int v55 = v53;
    uint32_t v56 = 18;
    goto LABEL_101;
  }
LABEL_102:
  sub_1DD1C(v3);
LABEL_103:
  std::mutex::unlock(v60);
}

void sub_20328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11)
{
}

void *sub_20344(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *sub_20350(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_20360(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  __int16 v6 = sub_20624((void *)a1, 0x200uLL);
  *__int16 v6 = off_28F28;
  *((_DWORD *)v6 + 18) = 0;
  uint64_t v7 = *a2;
  v6[10] = *a2;
  (*(void (**)(void *, uint64_t *))(v7 + 8))(v6 + 11, a2 + 1);
  uint64_t v8 = *a3;
  *(void *)(a1 + 12sub_1736C(&a9, 0) = *a3;
  (*(void (**)(uint64_t, uint64_t *))(v8 + 8))(a1 + 128, a3 + 1);
  *(void *)(a1 + 165) = 0;
  *(void *)(a1 + 16sub_1736C(&a9, 0) = 0;
  *(void *)(a1 + 176) = 0;
  *(unsigned char *)(a1 + 184) = 0;
  sub_4BEC(a1);
  return a1;
}

void sub_2040C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1[15] + 24))(v3);
  (*(void (**)(uint64_t))(v1[10] + 24))(v2);
  sub_20458(v1);
  _Unwind_Resume(a1);
}

void *sub_20458(void *a1)
{
  *a1 = off_28F58;
  sub_207B8((uint64_t)a1);
  (*(void (**)(void *))(a1[4] + 24))(a1 + 5);
  uint64_t v2 = (void *)a1[1];
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_204C8(void *a1)
{
  sub_208E4(a1);

  operator delete();
}

uint64_t sub_20500(void *a1, uint64_t a2)
{
  uint64_t v3 = a1 + 1;
  if (a1[2] == a1[1]) {
    return 0;
  }
  if (*(unsigned char *)(*(void *)a2 + 32))
  {
    (**(void (***)(uint64_t, void *))a2)(a2 + 8, v3);
  }
  else
  {
    uint64_t v6 = a1[4];
    if (*(unsigned char *)(v6 + 32)) {
      (*(void (**)(void *, void *))v6)(a1 + 5, v3);
    }
  }
  uint64_t v7 = a1[1];
  uint64_t result = (*((_DWORD *)a1 + 4) - v7);
  a1[2] = v7;
  return result;
}

uint64_t sub_20580(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v1 = a1 + 8;
  if (v2 == v3) {
    return 0;
  }
  uint64_t v5 = v3 - v2;
  int v6 = *(_DWORD *)(a1 + 72);
  if (v6 == 2)
  {
    uint64_t v8 = *(void *)(a1 + 120);
    if (*(unsigned char *)(v8 + 32)) {
      (*(void (**)(uint64_t, uint64_t))v8)(a1 + 128, v1);
    }
  }
  else if (v6 == 1)
  {
    uint64_t v7 = *(void *)(a1 + 80);
    if (*(unsigned char *)(v7 + 32)) {
      (*(void (**)(uint64_t, uint64_t))v7)(a1 + 88, v1);
    }
  }
  if (*(unsigned char *)(a1 + 160))
  {
    *(unsigned char *)(a1 + 16sub_1736C(&a9, 0) = 0;
  }
  else
  {
    *(void *)(a1 + 16) = *(void *)(a1 + 8);
    *(void *)(a1 + 176) = 0;
    *(unsigned char *)(a1 + 184) = 0;
  }
  return v5;
}

void *sub_20624(void *a1, size_t __sz)
{
  *a1 = off_28F58;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 0;
  a1[4] = &off_28F78;
  sub_206C0(a1 + 1, __sz);
  return a1;
}

void sub_20690(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)(v1 + 32) + 24))(v1 + 40);
  uint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 16) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(a1);
}

void sub_206C0(unint64_t *a1, size_t __sz)
{
  unint64_t v2 = *a1;
  if (a1[2] - *a1 < __sz)
  {
    if ((__sz & 0x8000000000000000) != 0) {
      sub_496C();
    }
    uint64_t v5 = (char *)a1[1];
    int v6 = operator new(__sz);
    uint64_t v7 = &v5[(void)v6 - v2];
    uint64_t v8 = v7;
    if (v5 != (char *)v2)
    {
      int64_t v9 = &v5[~v2];
      do
      {
        char v10 = *--v5;
        (v9--)[(void)v6] = v10;
      }
      while (v5 != (char *)v2);
      uint64_t v8 = v6;
    }
    *a1 = (unint64_t)v8;
    a1[1] = (unint64_t)v7;
    a1[2] = (unint64_t)&v6[__sz];
    if (v2)
    {
      operator delete((void *)v2);
    }
  }
}

void sub_20780(void *a1)
{
  sub_20458(a1);

  operator delete();
}

uint64_t sub_207B8(uint64_t a1)
{
  uint64_t v3 = &off_28F78;
  uint64_t v1 = (*(uint64_t (**)(uint64_t, void (***)()))(*(void *)a1 + 16))(a1, &v3);
  ((void (*)(uint64_t *))v3[3])(&v4);
  return v1;
}

void sub_20858(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_45C4(exception_object);
}

void sub_2088C()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_28610;
}

void *sub_208E4(void *a1)
{
  *a1 = off_28F28;
  sub_20580((uint64_t)a1);
  (*(void (**)(void *))(a1[15] + 24))(a1 + 16);
  (*(void (**)(void *))(a1[10] + 24))(a1 + 11);

  return sub_20458(a1);
}

const char *sub_20964(int a1)
{
  if (a1 > 111)
  {
    if (a1 > 125)
    {
      if (a1 == 126) {
        return "Invalidate MUID";
      }
      if (a1 == 127) {
        return "NAK";
      }
    }
    else
    {
      if (a1 == 112) {
        return "Discovery";
      }
      if (a1 == 113) {
        return "DiscoveryReply";
      }
    }
    return "Unknown Message Type";
  }
  else
  {
    int v1 = a1 - 16;
    uint64_t result = "Protocol Negotiation Inquiry";
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = "Protocol Negotiation Inquiry Response";
        break;
      case 2:
        uint64_t result = "Protocol Negotiation Set";
        break;
      case 3:
        uint64_t result = "Protocol Negotiation Test";
        break;
      case 4:
        uint64_t result = "Protocol Negotiation Test Response";
        break;
      case 5:
        uint64_t result = "Protocol Negotiation Confirmation";
        break;
      case 16:
        uint64_t result = "Profile Inquiry";
        break;
      case 17:
        uint64_t result = "Profile Inquiry Reply";
        break;
      case 18:
        uint64_t result = "Set Profile On";
        break;
      case 19:
        uint64_t result = "Set Profile Off";
        break;
      case 20:
        uint64_t result = "Profile Enabled";
        break;
      case 21:
        uint64_t result = "Profile Disabled";
        break;
      case 22:
        uint64_t result = "Profile-Specific Data";
        break;
      case 32:
        uint64_t result = "Property Inquiry";
        break;
      case 33:
        uint64_t result = "Property Inquiry Reply";
        break;
      case 34:
        uint64_t result = "Has Property";
        break;
      case 35:
        uint64_t result = "Has Property Reply";
        break;
      case 36:
        uint64_t result = "Get Property";
        break;
      case 37:
        uint64_t result = "Get Property Reply";
        break;
      case 38:
        uint64_t result = "Set Property";
        break;
      case 39:
        uint64_t result = "Set Property Reply";
        break;
      case 40:
        uint64_t result = "Property Subscription";
        break;
      case 41:
        uint64_t result = "Property Subscription Reply";
        break;
      case 47:
        uint64_t result = "Property Notify";
        break;
      default:
        return "Unknown Message Type";
    }
  }
  return result;
}

double sub_20BD8(uint64_t a1, int a2)
{
  *(void *)a1 = off_28FB0;
  *(_DWORD *)(a1 + 8) = a2;
  double result = 0.0;
  *(_OWORD *)(a1 + 12) = 0u;
  *(_OWORD *)(a1 + 28) = 0u;
  *(_OWORD *)(a1 + 44) = 0u;
  *(_DWORD *)(a1 + 6sub_1736C(&a9, 0) = 0;
  return result;
}

void *sub_20C10(void *a1)
{
  *a1 = off_28FB0;
  unint64_t v2 = (void *)a1[5];
  if (v2)
  {
    a1[6] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[2];
  if (v3)
  {
    a1[3] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_20C78(uint64_t a1, int a2)
{
  int NumberOfEntities = MIDIDeviceGetNumberOfEntities(*(_DWORD *)(a1 + 8));
  *(_DWORD *)(a1 + 12) = NumberOfEntities;
  uint64_t v5 = (void **)(a1 + 16);
  sub_20F1C((void **)(a1 + 16), NumberOfEntities);
  int v6 = (void *)(a1 + 40);
  sub_20FC4((char **)(a1 + 40), *(int *)(a1 + 12));
  if (*(_DWORD *)(a1 + 12))
  {
    for (ItemCount i = 0; (unint64_t)i < *(int *)(a1 + 12); ++i)
    {
      MIDIEntityRef Entity = MIDIDeviceGetEntity(*(_DWORD *)(a1 + 8), (ItemCount)i);
      if (MIDIEntityGetNumberOfDestinations(Entity))
      {
        MIDIEndpointRef Destination = MIDIEntityGetDestination(Entity, 0);
        if (a2)
        {
          MIDIEndpointSetRefCons(Destination, (void *)a1, i);
LABEL_7:
          if (MIDIEntityGetNumberOfSources(Entity)) {
            MIDIEndpointRef Source = MIDIEntityGetSource(Entity, 0);
          }
          else {
            MIDIEndpointRef Source = 0;
          }
          int64_t v12 = *(char **)(a1 + 24);
          unint64_t v11 = *(void *)(a1 + 32);
          if ((unint64_t)v12 >= v11)
          {
            unsigned int v14 = (char *)*v5;
            uint64_t v15 = (v12 - (unsigned char *)*v5) >> 2;
            unint64_t v16 = v15 + 1;
            if ((unint64_t)(v15 + 1) >> 62) {
              sub_496C();
            }
            uint64_t v17 = v11 - (void)v14;
            if (v17 >> 1 > v16) {
              unint64_t v16 = v17 >> 1;
            }
            if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v18 = v16;
            }
            if (v18)
            {
              int v19 = (char *)sub_1CB84(a1 + 32, v18);
              unsigned int v14 = *(char **)(a1 + 16);
              int64_t v12 = *(char **)(a1 + 24);
            }
            else
            {
              int v19 = 0;
            }
            uint64_t v20 = (MIDIEndpointRef *)&v19[4 * v15];
            MIDIEndpointRef *v20 = Source;
            unsigned int v13 = v20 + 1;
            while (v12 != v14)
            {
              MIDIEndpointRef v21 = *((_DWORD *)v12 - 1);
              v12 -= 4;
              *--uint64_t v20 = v21;
            }
            *(void *)(a1 + 16) = v20;
            *(void *)(a1 + 24) = v13;
            *(void *)(a1 + 32) = &v19[4 * v18];
            if (v14) {
              operator delete(v14);
            }
          }
          else
          {
            *(_DWORD *)int64_t v12 = Source;
            unsigned int v13 = v12 + 4;
          }
          *(void *)(a1 + 24) = v13;
          unint64_t v23 = *(void *)(a1 + 48);
          unint64_t v22 = *(void *)(a1 + 56);
          if (v23 >= v22)
          {
            unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v23 - *v6) >> 1);
            unint64_t v26 = v25 + 1;
            if (v25 + 1 > 0x2AAAAAAAAAAAAAAALL) {
              sub_496C();
            }
            unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v22 - *v6) >> 1);
            if (2 * v27 > v26) {
              unint64_t v26 = 2 * v27;
            }
            if (v27 >= 0x1555555555555555) {
              unint64_t v28 = 0x2AAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v28 = v26;
            }
            if (v28) {
              char v29 = (char *)sub_F280(a1 + 56, v28);
            }
            else {
              char v29 = 0;
            }
            uint64_t v30 = &v29[6 * v25];
            *((_WORD *)v30 + 2) = 0;
            *(_DWORD *)uint64_t v30 = 0;
            uint64_t v32 = *(_WORD **)(a1 + 40);
            uint64_t v31 = *(_WORD **)(a1 + 48);
            uint64_t v33 = v30;
            if (v31 != v32)
            {
              do
              {
                int v34 = *(_DWORD *)(v31 - 3);
                v31 -= 3;
                __int16 v35 = v31[2];
                *(_DWORD *)(v33 - 6) = v34;
                v33 -= 6;
                *((_WORD *)v33 + 2) = v35;
              }
              while (v31 != v32);
              uint64_t v31 = (_WORD *)*v6;
            }
            uint64_t v24 = v30 + 6;
            *(void *)(a1 + 4sub_1736C(&a9, 0) = v33;
            *(void *)(a1 + 48) = v30 + 6;
            *(void *)(a1 + 56) = &v29[6 * v28];
            if (v31) {
              operator delete(v31);
            }
          }
          else
          {
            *(_WORD *)(v23 + 4) = 0;
            *(_DWORD *)unint64_t v23 = 0;
            uint64_t v24 = (char *)(v23 + 6);
          }
          *(void *)(a1 + 48) = v24;
          continue;
        }
        MIDIEndpointSetRefCons(Destination, 0, 0);
      }
      else if (a2)
      {
        goto LABEL_7;
      }
    }
  }
}

void sub_20F1C(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 2)
  {
    if (a2 >> 62) {
      sub_496C();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    int v6 = (char *)sub_1CB84(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    int64_t v9 = &v6[4 * v8];
    char v10 = (char *)*a1;
    unint64_t v11 = (char *)a1[1];
    int64_t v12 = v7;
    if (v11 != *a1)
    {
      int64_t v12 = v7;
      do
      {
        int v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
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

void sub_20FC4(char **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 1) < a2)
  {
    if (a2 >= 0x2AAAAAAAAAAAAAABLL) {
      sub_496C();
    }
    uint64_t v5 = (a1[1] - *a1) / 6;
    int v6 = (char *)sub_F280(v3, a2);
    uint64_t v7 = &v6[6 * v5];
    int64_t v9 = &v6[6 * v8];
    unint64_t v11 = *a1;
    char v10 = a1[1];
    int64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        int v13 = *(_DWORD *)(v10 - 6);
        v10 -= 6;
        __int16 v14 = *((_WORD *)v10 + 2);
        *(_DWORD *)(v12 - 6) = v13;
        v12 -= 6;
        *((_WORD *)v12 + 2) = v14;
      }
      while (v10 != v11);
      char v10 = *a1;
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

uint64_t NewAppleIDAMDriver(uint64_t a1, const void *a2)
{
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes(0, 0xECu, 0xDEu, 0x95u, 0x74u, 0xFu, 0xE4u, 0x11u, 0xD4u, 0xBBu, 0x1Au, 0, 0x50u, 0xE4u, 0xCEu, 0xA5u, 0x26u);
  if (CFEqual(a2, v3)) {
    operator new();
  }
  return 0;
}

void sub_2113C()
{
}

void sub_21160(uint64_t a1)
{
  CFUUIDRef v2 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 4u, 0xB0u, 0x79u, 0x38u, 0xC1u, 0xDAu, 0x43u, 4u, 0x82u, 0xBAu, 0x10u, 0xB8u, 0x44u, 0x27u, 0x29u, 0x46u);
  sub_D1F8(a1, v2);
}

void sub_21210(_Unwind_Exception *a1)
{
  sub_1CEF0(v1);
  _Unwind_Resume(a1);
}

void sub_21224()
{
  if ((byte_2C188 & 1) == 0)
  {
    CFBundleRef BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.AppleIDAMDriver");
    if (BundleWithIdentifier)
    {
      int v1 = BundleWithIdentifier;
      CFRetain(BundleWithIdentifier);
      off_2C080 = (__CFString *)CFBundleCopyLocalizedString(v1, off_2C080, off_2C080, @"IDAMMIDILocalizable");
      off_2C088 = (__CFString *)CFBundleCopyLocalizedString(v1, off_2C088, off_2C088, @"IDAMMIDILocalizable");
      off_2C090 = (__CFString *)CFBundleCopyLocalizedString(v1, off_2C090, off_2C090, @"IDAMMIDILocalizable");
      CFRelease(v1);
      byte_2C188 = 1;
    }
  }
}

void sub_212DC(void *a1)
{
  sub_1CEF0(a1);

  operator delete();
}

uint64_t sub_21314(int a1, MIDIDeviceListRef devList)
{
  ItemCount NumberOfDevices = MIDIDeviceListGetNumberOfDevices(devList);
  if (NumberOfDevices)
  {
    ItemCount v4 = NumberOfDevices;
    sub_21570();
    uint64_t v5 = qword_2C190;
    if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315650;
      __int16 v14 = "AppleIDAMDriver.cpp";
      __int16 v15 = 1024;
      int v16 = 79;
      __int16 v17 = 2048;
      ItemCount v18 = v4;
      _os_log_impl(&def_F708, v5, OS_LOG_TYPE_INFO, "%25s:%-5d Deleting all (%lu) IDAM devices.", (uint8_t *)&v13, 0x1Cu);
    }
    for (ItemCount i = 0; i != v4; ++i)
    {
      MIDIDeviceRef Device = MIDIDeviceListGetDevice(devList, i);
      MIDISetupRemoveDevice(Device);
    }
  }
  sub_21570();
  uint64_t v8 = qword_2C190;
  if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    __int16 v14 = "AppleIDAMDriver.cpp";
    __int16 v15 = 1024;
    int v16 = 86;
    _os_log_impl(&def_F708, v8, OS_LOG_TYPE_INFO, "%25s:%-5d Done deleting IDAM devices.", (uint8_t *)&v13, 0x12u);
  }
  int64_t v9 = IOServiceMatching("IOUSBDeviceInterface");
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  unint64_t v11 = Mutable;
  if (Mutable)
  {
    CFDictionarySetValue(Mutable, @"USBDeviceFunction", @"IDAMInterface");
    CFDictionarySetValue(v9, @"IOPropertyMatch", v11);
    CFRelease(v11);
    operator new();
  }
  CFRelease(v9);
  return 3758097085;
}

void sub_21544()
{
}

void sub_21570()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2C198, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2C198))
  {
    qword_2C190 = (uint64_t)os_log_create("com.apple.coremidi", "idamdv");
    __cxa_guard_release(&qword_2C198);
  }
}

uint64_t sub_215E0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  *(void *)(a1 + 96) = 0;
  return 0;
}

__CFString *sub_21634()
{
  return off_2C080;
}

__CFString *sub_21640()
{
  return off_2C088;
}

__CFString *sub_2164C()
{
  return off_2C090;
}

uint64_t sub_21658(uint64_t a1)
{
  outMIDIDeviceRef Device = 0;
  MIDIEntityRef newEntity = 0;
  int v1 = off_2C088;
  MIDIDeviceCreate((MIDIDriverRef)(a1 + 8), off_2C088, off_2C080, off_2C088, &outDevice);
  CFUUIDRef v3 = &off_288B0;
  CFTypeRef cf = 0;
  if (v1)
  {
    CFRetain(v1);
    CFTypeRef cf = v1;
  }
  MIDIDeviceAddEntity(outDevice, v1, 1u, 1uLL, 1uLL, &newEntity);
  sub_10700(&v3);
  return outDevice;
}

void sub_21718(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10700((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2172C(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 504);
}

void sub_21734()
{
}

void sub_21794()
{
}

uint64_t sub_217B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return 4294956462;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a3 + 88))(a3, a2, a4);
  return 0;
}

uint64_t sub_2180C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  a1[4] = a3;
  a1[5] = a4;
  uint64_t v4 = a1[6];
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 16))(v4);
  }
  return 0;
}

void sub_2185C(int a1, uint64_t a2, MIDITimeStamp a3, char *a4, int64_t a5, uint64_t a6, MIDIProtocolID a7)
{
}

unsigned char *sub_21878(uint64_t a1, uint64_t a2, uint64_t *a3, unsigned char *a4)
{
  return sub_E410(a2, a3, a4, *(unsigned __int16 *)(a2 + 540));
}

unsigned char *sub_21890(uint64_t a1, uint64_t a2, uint64_t *a3, unsigned char *a4, int a5)
{
  return sub_E778(a2, a3, a4, *(unsigned __int16 *)(a2 + 540), a5);
}

uint64_t sub_218A8()
{
  return 0;
}

void *sub_218B4(void *result)
{
  *double result = 0;
  result[1] = 0;
  *(void *)((char *)result + 21) = 0;
  result[2] = 0;
  return result;
}

uint64_t sub_218C4(uint64_t result)
{
  if (*(void *)(result + 16)) {
    operator delete[]();
  }
  return result;
}

void sub_21904(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new[]();
}

void sub_2194C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_219C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21A00(uint64_t a1, int a2)
{
  v2[0] = 67109378;
  v2[1] = a2;
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  _os_log_error_impl(&def_F708, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " CAMutex::Try: call to pthread_mutex_trylock failed, Error: %d (%s)", (uint8_t *)v2, 0x12u);
}

void sub_21A8C()
{
}

void sub_21AB8()
{
}

uint64_t sub_21AEC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void sub_21B24()
{
  __assert_rtn("DoWrite", "USBMIDIDevice.cpp", 720, "currentBufferIndex >= 0");
}

void sub_21B50()
{
}

void sub_21B7C()
{
}

void sub_21BA8()
{
}

void sub_21BD4()
{
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

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
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

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

Boolean CFRunLoopContainsSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  return _CFRunLoopContainsSource(rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
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

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return _CFStringCompareWithOptions(theString1, theString2, rangeToCompare, compareOptions);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return _CFStringCreateWithCharacters(alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return _CFStringCreateWithSubstring(alloc, str, range);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return _CFStringGetCharacterAtIndex(theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
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

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return _IOCreatePlugInInterfaceForService(service, pluginType, interfaceType, theInterface, theScore);
}

kern_return_t IODestroyPlugInInterface(IOCFPlugInInterface **interface)
{
  return _IODestroyPlugInInterface(interface);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMainPort(bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t IOUSBDeviceDataGetBytePtr()
{
  return _IOUSBDeviceDataGetBytePtr();
}

uint64_t MIDICapabilityGetDiscoveryMUID()
{
  return _MIDICapabilityGetDiscoveryMUID();
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

ItemCount MIDIDeviceGetNumberOfEntities(MIDIDeviceRef device)
{
  return _MIDIDeviceGetNumberOfEntities(device);
}

OSStatus MIDIDeviceListDispose(MIDIDeviceListRef devList)
{
  return _MIDIDeviceListDispose(devList);
}

MIDIDeviceRef MIDIDeviceListGetDevice(MIDIDeviceListRef devList, ItemCount index0)
{
  return _MIDIDeviceListGetDevice(devList, index0);
}

ItemCount MIDIDeviceListGetNumberOfDevices(MIDIDeviceListRef devList)
{
  return _MIDIDeviceListGetNumberOfDevices(devList);
}

OSStatus MIDIDeviceRemoveEntity(MIDIDeviceRef device, MIDIEntityRef entity)
{
  return _MIDIDeviceRemoveEntity(device, entity);
}

OSStatus MIDIEndpointSetRefCons(MIDIEndpointRef endpt, void *ref1, void *ref2)
{
  return _MIDIEndpointSetRefCons(endpt, ref1, ref2);
}

MIDIEndpointRef MIDIEntityGetDestination(MIDIEntityRef entity, ItemCount destIndex0)
{
  return _MIDIEntityGetDestination(entity, destIndex0);
}

ItemCount MIDIEntityGetNumberOfDestinations(MIDIEntityRef entity)
{
  return _MIDIEntityGetNumberOfDestinations(entity);
}

ItemCount MIDIEntityGetNumberOfSources(MIDIEntityRef entity)
{
  return _MIDIEntityGetNumberOfSources(entity);
}

MIDIEndpointRef MIDIEntityGetSource(MIDIEntityRef entity, ItemCount sourceIndex0)
{
  return _MIDIEntityGetSource(entity, sourceIndex0);
}

MIDIEventPacket *__cdecl MIDIEventListAdd(MIDIEventList *evtlist, ByteCount listSize, MIDIEventPacket *curPacket, MIDITimeStamp time, ByteCount wordCount, const UInt32 *words)
{
  return _MIDIEventListAdd(evtlist, listSize, curPacket, time, wordCount, words);
}

MIDIEventPacket *__cdecl MIDIEventListInit(MIDIEventList *evtlist, MIDIProtocolID protocol)
{
  return _MIDIEventListInit(evtlist, protocol);
}

MIDIDeviceListRef MIDIGetDriverDeviceList(MIDIDriverRef driver)
{
  return _MIDIGetDriverDeviceList(driver);
}

CFRunLoopRef MIDIGetDriverIORunLoop(void)
{
  return _MIDIGetDriverIORunLoop();
}

OSStatus MIDIObjectGetIntegerProperty(MIDIObjectRef obj, CFStringRef propertyID, SInt32 *outValue)
{
  return _MIDIObjectGetIntegerProperty(obj, propertyID, outValue);
}

OSStatus MIDIObjectGetStringProperty(MIDIObjectRef obj, CFStringRef propertyID, CFStringRef *str)
{
  return _MIDIObjectGetStringProperty(obj, propertyID, str);
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

OSStatus MIDIReceivedEventList(MIDIEndpointRef src, const MIDIEventList *evtlist)
{
  return _MIDIReceivedEventList(src, evtlist);
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

uint64_t MIDI::EventList::create()
{
  return MIDI::EventList::create();
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

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return std::__shared_weak_count::lock(this);
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

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return ___tolower(a1);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
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

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}