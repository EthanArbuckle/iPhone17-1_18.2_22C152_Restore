uint64_t sub_22D4(uint64_t a1)
{
  uint64_t v1;

  v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t sub_22EC()
{
  return 0;
}

uint64_t sub_22F8(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 24);
  if (v2)
  {
    IOServiceClose(v2);
    *(_DWORD *)(a1 + 24) = 0;
  }
  *(_DWORD *)(a1 + 20) = 0;
  return 0;
}

uint64_t sub_2338(uint64_t a1)
{
  if (*(void *)(a1 + 80)) {
    return sub_2C74(a1 + 88);
  }
  else {
    return 0;
  }
}

uint64_t sub_2364(uint64_t a1)
{
  return *(unsigned int *)(a1 + 248);
}

uint64_t sub_236C()
{
  return 96;
}

__n128 sub_2388(FastpathDriver *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(a2 + 88) = 0;
  return FastpathDriver::AddLogEntry(a1, a2, 6, 1, 0, a6, a7, a8, a9);
}

uint64_t sub_239C(uint64_t result, uint64_t a2, unsigned int a3, int a4)
{
  *(void *)(result + 256) = a2;
  *(void *)(result + 264) = 0;
  *(void *)(result + 272) = a3 >> 6;
  *(_DWORD *)(result + 280) = a4;
  *(void *)(result + 288) = 1;
  if (a3 <= 0x3F) {
    *(void *)(result + 256) = 0;
  }
  return result;
}

void FastpathDriver::alloc(FastpathDriver *this, const __CFAllocator *a2)
{
  v3 = (FastpathDriver *)CFAllocatorAllocate(this, 296, 0);

  FastpathDriver::FastpathDriver(v3, this);
}

void FastpathDriver::operator delete(CFAllocatorRef *ptr)
{
}

void sub_2434(void *a1)
{
}

void FastpathDriver::FastpathDriver(FastpathDriver *this, const __CFAllocator *a2)
{
  *(void *)this = &FastpathDriver::vtbl;
  *((void *)this + 1) = a2;
  *((void *)this + 2) = 1;
  *((_DWORD *)this + 6) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 31) = 0;
  *((void *)this + 9) = 0;
  *((void *)this + 10) = 0;
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0x97u, 0x55u, 0x20u, 0xE5u, 0x3Fu, 0xEDu, 0x47u, 0xD7u, 0xADu, 0xA3u, 0xC9u, 0xA1u, 0x13u, 0xEBu, 1u, 0x98u);
  CFPlugInAddInstanceForFactory(v3);
  *((void *)this + 4) = os_log_create("AOP", "FastpathDriver");
}

void FastpathDriver::~FastpathDriver(void **this)
{
  CFUUIDRef v2 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0x97u, 0x55u, 0x20u, 0xE5u, 0x3Fu, 0xEDu, 0x47u, 0xD7u, 0xADu, 0xA3u, 0xC9u, 0xA1u, 0x13u, 0xEBu, 1u, 0x98u);
  CFPlugInRemoveInstanceForFactory(v2);
  os_release(this[4]);
}

uint64_t FastpathDriver::QueryInterface(FastpathDriver *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0xA6u, 0x7Au, 0x69u, 0x95u, 0x23u, 0x6Bu, 0x44u, 0xDEu, 0x97u, 0xB5u, 0x27u, 0xB9u, 0xB1u, 0xE6u, 0x6Fu, 0x2Fu);
  if (CFEqual(v5, v6)
    || (CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu), CFEqual(v5, v7))|| (v8 = CFUUIDGetConstantUUIDWithBytes(
               kCFAllocatorSystemDefault,
               0,
               0,
               0,
               0,
               0,
               0,
               0,
               0,
               0xC0u,
               0,
               0,
               0,
               0,
               0,
               0,
               0x46u),
        CFEqual(v5, v8)))
  {
    uint64_t v9 = 0;
    ++*((_DWORD *)this + 4);
  }
  else
  {
    this = 0;
    uint64_t v9 = 2147483652;
  }
  *a3 = this;
  CFRelease(v5);
  return v9;
}

uint64_t FastpathDriver::AddRef(FastpathDriver *this)
{
  uint64_t v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t FastpathDriver::Release(FastpathDriver *this)
{
  int v1 = *((_DWORD *)this + 4);
  uint64_t v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    FastpathDriver::~FastpathDriver((void **)this);
    FastpathDriver::operator delete(v3);
  }
  return v2;
}

uint64_t FastpathDriver::Probe(FastpathDriver *this, const __CFDictionary *a2, unsigned int a3, int *a4)
{
  return 0;
}

uint64_t FastpathDriver::Start(FastpathDriver *this, const __CFDictionary *a2, io_service_t service)
{
  *((_DWORD *)this + 5) = service;
  uint64_t v4 = IOServiceOpen(service, mach_task_self_, 0, (io_connect_t *)this + 6);
  if (v4)
  {
    CFUUIDRef v5 = *((void *)this + 4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "FastpathDriver::Start -> %x", (uint8_t *)v7, 8u);
    }
  }
  return v4;
}

uint64_t FastpathDriver::Stop(FastpathDriver *this)
{
  io_connect_t v2 = *((_DWORD *)this + 6);
  if (v2)
  {
    IOServiceClose(v2);
    *((_DWORD *)this + 6) = 0;
  }
  *((_DWORD *)this + 5) = 0;
  return 0;
}

uint64_t FastpathDriver::Open(FastpathDriver *this)
{
  size_t v9 = 32;
  uint64_t v2 = IOConnectCallMethod(*((_DWORD *)this + 6), 0, 0, 0, 0, 0, 0, 0, (char *)this + 40, &v9);
  if (v2)
  {
    uint64_t v6 = v2;
    CFUUIDRef v8 = *((void *)this + 4);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      return v6;
    }
    *(_DWORD *)buf = 136316418;
    v11 = &unk_3E13;
    __int16 v12 = 2080;
    v13 = "result == 0 ";
    __int16 v14 = 2080;
    v15 = &unk_3E13;
    __int16 v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/FastpathLib/FastpathLib.cpp";
    __int16 v18 = 1024;
    int v19 = 385;
    __int16 v20 = 1024;
    int v21 = v6;
LABEL_9:
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    return v6;
  }
  uint64_t v3 = IOConnectMapMemory(*((_DWORD *)this + 6), 0, mach_task_self_, (mach_vm_address_t *)this + 10, (mach_vm_size_t *)this + 9, 1u);
  if (v3)
  {
    uint64_t v6 = v3;
    CFUUIDRef v8 = *((void *)this + 4);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      return v6;
    }
    *(_DWORD *)buf = 136316418;
    v11 = &unk_3E13;
    __int16 v12 = 2080;
    v13 = "result == 0 ";
    __int16 v14 = 2080;
    v15 = &unk_3E13;
    __int16 v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/FastpathLib/FastpathLib.cpp";
    __int16 v18 = 1024;
    int v19 = 388;
    __int16 v20 = 1024;
    int v21 = v6;
    goto LABEL_9;
  }
  *((void *)this + 25) = nullsub_2;
  uint64_t v4 = (char *)this + 200;
  *((void *)v4 + 1) = nullsub_3;
  *((void *)v4 + 2) = sub_2AD0;
  *((void *)v4 + 3) = sub_2AE0;
  *((void *)v4 + 4) = sub_2AE8;
  *((void *)v4 + 5) = sub_2AF0;
  sub_2B00((uint64_t)(v4 - 112), (uint64_t (**)(void, void, void, uint64_t))v4, *((void *)v4 - 15) + *((unsigned int *)v4 - 39), *((unsigned int *)v4 - 38), *((void *)v4 - 15) + *((unsigned int *)v4 - 37), *((_DWORD *)v4 - 36), *((void *)v4 - 15) + *((unsigned int *)v4 - 35), *((_DWORD *)v4 - 34));
  uint64_t v5 = sub_2BA0((uint64_t)(v4 - 112));
  uint64_t v6 = 0;
  *((_DWORD *)v4 + 20) = 0;
  *((void *)v4 + 11) = 1;
  *((void *)v4 + 8) = 0;
  *((void *)v4 + 9) = 0;
  *((void *)v4 + 6) = v5;
  *((void *)v4 + 7) = 0;
  return v6;
}

void sub_2AD0()
{
}

uint64_t sub_2AE0()
{
  return 0;
}

uint64_t sub_2AE8()
{
  return 1;
}

void sub_2AF0()
{
}

uint64_t sub_2B00(uint64_t a1, uint64_t (**a2)(void, void, void, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, int a8)
{
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = a3;
  *(void *)a1 = a2;
  *(void *)(a1 + 32) = a5;
  *(void *)(a1 + 40) = a7;
  *(_DWORD *)(a1 + 48) = a6;
  *(_DWORD *)(a1 + 52) = a4;
  *(_DWORD *)(a1 + 56) = a8;
  *(unsigned char *)(a1 + 80) = 1;
  *(_DWORD *)(a1 + 76) = 0;
  sub_3A34(a1);
  uint64_t result = (*a2)(*(void *)(a1 + 8), 0, 0, a4);
  v13 = *(int **)(a1 + 16);
  int v14 = *v13;
  unint64_t v15 = v13[1];
  int v16 = v13[2];
  LODWORD(v13) = v13[3];
  *(_DWORD *)(a1 + 68) = v15;
  *(_DWORD *)(a1 + 72) = v16;
  *(_DWORD *)(a1 + 60) = v13;
  *(_DWORD *)(a1 + 64) = v14;
  *(void *)(a1 + 24) = a3 + (v15 + 15) / v15 * v15;
  return result;
}

uint64_t sub_2BA0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 72);
}

uint64_t FastpathDriver::EnableClientLog(uint64_t this, void *a2, unsigned int a3, int a4)
{
  *(void *)(this + 256) = a2;
  *(void *)(this + 264) = 0;
  *(void *)(this + 272) = a3 >> 6;
  *(_DWORD *)(this + 280) = a4;
  *(void *)(this + 288) = 1;
  if (a3 <= 0x3F) {
    *(void *)(this + 256) = 0;
  }
  return this;
}

uint64_t FastpathDriver::Close(FastpathDriver *this)
{
  mach_vm_address_t v2 = *((void *)this + 10);
  if (v2)
  {
    IOConnectUnmapMemory(*((_DWORD *)this + 6), 0, mach_task_self_, v2);
    *((void *)this + 10) = 0;
  }
  uint64_t result = *((unsigned int *)this + 6);
  if (result) {
    return IOConnectCallMethod(result, 1u, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  return result;
}

uint64_t FastpathDriver::GetQueueSize(FastpathDriver *this)
{
  if (*((void *)this + 10)) {
    return sub_2C74((uint64_t)this + 88);
  }
  else {
    return 0;
  }
}

uint64_t sub_2C74(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

uint64_t FastpathDriver::GetEntrySize(FastpathDriver *this)
{
  return *((unsigned int *)this + 62);
}

uint64_t FastpathDriver::GetIteratorSize(FastpathDriver *this)
{
  return 96;
}

uint64_t FastpathDriver::Read(FastpathDriver *this, unsigned int a2, char *a3, unint64_t a4, unint64_t *a5)
{
  unint64_t v19 = a4;
  *(_OWORD *)a3 = 0u;
  *((_OWORD *)a3 + 1) = 0u;
  *((_OWORD *)a3 + 2) = 0u;
  *((_OWORD *)a3 + 3) = 0u;
  *((_OWORD *)a3 + 4) = 0u;
  *((_OWORD *)a3 + 5) = 0u;
  if (!*((void *)this + 10))
  {
    __int16 v18 = *((void *)this + 4);
    int v14 = 0;
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136316418;
    int v21 = &unk_3E13;
    __int16 v22 = 2080;
    v23 = "_queueAddr";
    __int16 v24 = 2080;
    v25 = &unk_3E13;
    __int16 v26 = 2080;
    v27 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/FastpathLib/FastpathLib.cpp";
    __int16 v28 = 1024;
    int v29 = 466;
    __int16 v30 = 1024;
    int v31 = 0;
LABEL_14:
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    int v14 = 0;
    goto LABEL_6;
  }
  if ((sub_2ED4((void *)this + 11, &v19, a2, (unint64_t *)a3, (uint64_t *)a3 + 10) & 1) == 0)
  {
    __int16 v18 = *((void *)this + 4);
    int v14 = 0;
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136316418;
    int v21 = &unk_3E13;
    __int16 v22 = 2080;
    v23 = "success";
    __int16 v24 = 2080;
    v25 = &unk_3E13;
    __int16 v26 = 2080;
    v27 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/FastpathLib/FastpathLib.cpp";
    __int16 v28 = 1024;
    int v29 = 470;
    __int16 v30 = 1024;
    int v31 = 0;
    goto LABEL_14;
  }
  if (a5) {
    *a5 = v19;
  }
  int v14 = 1;
LABEL_6:
  FastpathDriver::AddLogEntry(this, v10, 1, v14, 3u, v11, v12, v13, a2, a4, v19);
  FastpathDriver::AddLogEntryWithData(this, v15, 9, 1, a3, 0x28uLL);
  FastpathDriver::AddLogEntryWithData(this, v16, 10, 1, a3 + 40, 0x28uLL);
  if (v14) {
    return 0;
  }
  else {
    return 3758097084;
  }
}

uint64_t sub_2ED4(void *a1, unint64_t *a2, unint64_t a3, unint64_t *a4, uint64_t *a5)
{
  uint64_t v9 = *a2;
  uint64_t v10 = sub_3A40((uint64_t)a1, *a2, a3, a4, 2, a5);
  if (v10)
  {
    uint64_t v11 = *a5;
    uint64_t v12 = *a2;
    if (*a5)
    {
      uint64_t v13 = (uint64_t *)(a4 + 1);
      do
      {
        uint64_t v14 = *v13;
        v13 += 5;
        v12 += v14;
        --v11;
      }
      while (v11);
      *a2 = v12;
    }
  }
  else
  {
    uint64_t v12 = *a2;
  }
  sub_3BA0(a1, 0, v10, v9, v12);
  return v10;
}

__n128 FastpathDriver::AddLogEntry(FastpathDriver *this, uint64_t a2, __int16 a3, __int16 a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  if (*((void *)this + 32))
  {
    __int16 v20 = &a6;
    FastpathDriver::InitLogEntry(this, (uint64_t)&v18, a3, a4);
    if (a5)
    {
      uint64_t v11 = (uint64_t *)v19 + 1;
      uint64_t v12 = a5;
      do
      {
        uint64_t v13 = v20++;
        *v11++ = *v13;
        --v12;
      }
      while (v12);
    }
    uint64_t v14 = *((void *)this + 32) + (*((void *)this + 33) << 6);
    __n128 result = v18;
    long long v16 = v19[0];
    long long v17 = v19[2];
    *(_OWORD *)(v14 + 32) = v19[1];
    *(_OWORD *)(v14 + 48) = v17;
    *(__n128 *)uint64_t v14 = result;
    *(_OWORD *)(v14 + 16) = v16;
    *((void *)this + 33) = (unint64_t)(*((void *)this + 33) + 1) % *((void *)this + 34);
  }
  return result;
}

__n128 FastpathDriver::AddLogEntryWithData(FastpathDriver *this, unsigned int a2, __int16 a3, __int16 a4, void *a5, size_t a6)
{
  if (*((void *)this + 32))
  {
    FastpathDriver::InitLogEntry(this, (uint64_t)&v13, a3, a4);
    memcpy((char *)v14 + 8, a5, a6);
    uint64_t v9 = *((void *)this + 32) + (*((void *)this + 33) << 6);
    __n128 result = v13;
    long long v11 = v14[0];
    long long v12 = v14[2];
    *(_OWORD *)(v9 + 32) = v14[1];
    *(_OWORD *)(v9 + 48) = v12;
    *(__n128 *)uint64_t v9 = result;
    *(_OWORD *)(v9 + 16) = v11;
    *((void *)this + 33) = (unint64_t)(*((void *)this + 33) + 1) % *((void *)this + 34);
  }
  return result;
}

uint64_t FastpathDriver::ReadLast(FastpathDriver *this, unsigned int a2, unint64_t *a3, unint64_t *a4)
{
  unint64_t v18 = 0;
  *(_OWORD *)a3 = 0u;
  *((_OWORD *)a3 + 1) = 0u;
  *((_OWORD *)a3 + 2) = 0u;
  *((_OWORD *)a3 + 3) = 0u;
  *((_OWORD *)a3 + 4) = 0u;
  *((_OWORD *)a3 + 5) = 0u;
  if (!*((void *)this + 10))
  {
    long long v17 = *((void *)this + 4);
    int v12 = 0;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136316418;
    __int16 v20 = &unk_3E13;
    __int16 v21 = 2080;
    __int16 v22 = "_queueAddr";
    __int16 v23 = 2080;
    __int16 v24 = &unk_3E13;
    __int16 v25 = 2080;
    __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/FastpathLib/FastpathLib.cpp";
    __int16 v27 = 1024;
    int v28 = 494;
    __int16 v29 = 1024;
    int v30 = 0;
LABEL_16:
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    int v12 = 0;
    goto LABEL_6;
  }
  if ((sub_32F4((uint64_t)this + 88, a2, a3, 2, a3 + 10, (uint64_t *)&v18) & 1) == 0)
  {
    long long v17 = *((void *)this + 4);
    int v12 = 0;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136316418;
    __int16 v20 = &unk_3E13;
    __int16 v21 = 2080;
    __int16 v22 = "success";
    __int16 v23 = 2080;
    __int16 v24 = &unk_3E13;
    __int16 v25 = 2080;
    __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/FastpathLib/FastpathLib.cpp";
    __int16 v27 = 1024;
    int v28 = 498;
    __int16 v29 = 1024;
    int v30 = 0;
    goto LABEL_16;
  }
  if (a4) {
    *a4 = v18;
  }
  int v12 = 1;
LABEL_6:
  unint64_t v13 = v18 - a2;
  if (v18 < a2) {
    unint64_t v13 = 0;
  }
  FastpathDriver::AddLogEntry(this, v8, 2, v12, 3u, v9, v10, v11, a2, v13, v18);
  FastpathDriver::AddLogEntryWithData(this, v14, 9, 1, a3, 0x28uLL);
  FastpathDriver::AddLogEntryWithData(this, v15, 10, 1, a3 + 5, 0x28uLL);
  if (v12) {
    return 0;
  }
  else {
    return 3758097084;
  }
}

uint64_t sub_32F4(uint64_t a1, unint64_t a2, unint64_t *a3, uint64_t a4, void *a5, uint64_t *a6)
{
  uint64_t v12 = *(void *)(a1 + 24);
  unint64_t v13 = *(unsigned int *)(a1 + 68);
  (**(void (***)(void, void, unint64_t, unint64_t))a1)(*(void *)(a1 + 8), 0, (v13 + 15) / v13 * v13, (v13 + 31) / v13 * v13);
  unint64_t v14 = *(void *)(v12 + 8);
  BOOL v15 = v14 >= a2;
  unint64_t v16 = v14 - a2;
  if (v15) {
    unint64_t v17 = v16;
  }
  else {
    unint64_t v17 = 0;
  }
  if (a2)
  {
    uint64_t v18 = sub_3A40(a1, v17, a2, a3, a4, a5);
    if (*a5)
    {
      uint64_t v19 = a3[5 * *a5 - 4] + a3[5 * *a5 - 2];
      if (!a6) {
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v19 = 0;
      if (!a6) {
        goto LABEL_13;
      }
    }
  }
  else
  {
    uint64_t v18 = 1;
    uint64_t v19 = v17;
    if (!a6) {
      goto LABEL_13;
    }
  }
  if (v18)
  {
    *a6 = v19;
    goto LABEL_16;
  }
LABEL_13:
  if (a6) {
    uint64_t v19 = *a6;
  }
  else {
    uint64_t v19 = -1;
  }
LABEL_16:
  sub_3BA0((void *)a1, 1, v18, v17, v19);
  return v18;
}

unint64_t FastpathDriver::GetCount(FastpathDriver *this, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a2[10];
  if (v9)
  {
    unint64_t v10 = 0;
    uint64_t v11 = a2 + 1;
    do
    {
      uint64_t v12 = *v11;
      v11 += 5;
      v10 += v12;
      --v9;
    }
    while (v9);
  }
  else
  {
    unint64_t v10 = 0;
  }
  FastpathDriver::AddLogEntry(this, (uint64_t)a2, 3, 1, 1u, a6, a7, a8, v10 / *((void *)this + 31));
  return v10 / *((void *)this + 31);
}

unint64_t FastpathDriver::FindEntry(FastpathDriver *this, void *a2, unint64_t a3, void **a4, unsigned int *a5, unsigned int *a6)
{
  unint64_t v6 = a2[10];
  if (v6)
  {
    unint64_t v7 = a2[1];
    if (v7 <= a3)
    {
      unint64_t v8 = 0;
      uint64_t v12 = a2 + 6;
      do
      {
        if (v6 - 1 == v8) {
          return 0;
        }
        a3 -= v7;
        unint64_t v13 = *v12;
        v12 += 5;
        unint64_t v7 = v13;
        ++v8;
      }
      while (a3 >= v13);
      unint64_t v6 = v8 < v6;
      if (a4) {
        goto LABEL_4;
      }
    }
    else
    {
      unint64_t v8 = 0;
      unint64_t v6 = 1;
      if (a4) {
LABEL_4:
      }
        *a4 = (void *)(a3 + a2[5 * v8]);
    }
    if (a5) {
      *a5 = *((void *)this + 31);
    }
    if (a6)
    {
      unint64_t v9 = a2[5 * v8 + 2];
      BOOL v10 = v9 >= a3;
      unint64_t v11 = v9 - a3;
      if (v10)
      {
        if (*((void *)this + 31) < v11) {
          unint64_t v11 = *((void *)this + 31);
        }
      }
      else
      {
        LODWORD(v11) = 0;
      }
      *a6 = v11;
    }
  }
  return v6;
}

unint64_t FastpathDriver::GetNextEntry(FastpathDriver *this, void *a2, unint64_t *a3, void **a4, unsigned int *a5, unsigned int *a6)
{
  unint64_t v10 = a2[11];
  unint64_t Entry = FastpathDriver::FindEntry(this, a2, v10, a4, a5, a6);
  unint64_t v16 = a2[11];
  if (Entry)
  {
    if (a3) {
      *a3 = v16;
    }
    v16 += *((void *)this + 31);
    a2[11] = v16;
  }
  if (a6) {
    uint64_t v17 = *a6;
  }
  else {
    uint64_t v17 = -1;
  }
  FastpathDriver::AddLogEntry(this, v11, 4, Entry, 3u, v12, v13, v14, v10, v16, v17);
  return Entry;
}

__n128 FastpathDriver::VerifyEntry(FastpathDriver *this, void *a2, unint64_t a3, unsigned int *a4)
{
  sub_367C((uint64_t)this + 88, (uint64_t)a2, a2[10]);
  if (FastpathDriver::FindEntry(this, a2, a3, 0, 0, a4))
  {
    if (a4) {
      uint64_t v12 = *a4;
    }
    else {
      uint64_t v12 = -1;
    }
  }
  else
  {
    uint64_t v12 = 0;
    *a4 = 0;
  }
  return FastpathDriver::AddLogEntry(this, v8, 5, 1, 2u, v9, v10, v11, a3, v12);
}

uint64_t sub_367C(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = **(void **)(result + 24);
  unint64_t v4 = *(unsigned int *)(result + 48);
  BOOL v5 = v3 >= v4;
  unint64_t v6 = v3 - v4;
  if (!v5) {
    unint64_t v6 = 0;
  }
  if (a3)
  {
    unint64_t v7 = (unint64_t *)(a2 + 16);
    char v8 = 1;
    do
    {
      _DWORD v7[2] = v3;
      unint64_t v9 = v7[1];
      BOOL v5 = v6 >= v9;
      unint64_t v10 = v6 - v9;
      if (v10 != 0 && v5)
      {
        if (*(v7 - 1) < v10) {
          unint64_t v10 = *(v7 - 1);
        }
        v8 &= v10 == *v7;
        *unint64_t v7 = v10;
      }
      v7 += 5;
      --a3;
    }
    while (a3);
  }
  return result;
}

__n128 FastpathDriver::ResetIterator(FastpathDriver *this, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  a2[11] = 0;
  return FastpathDriver::AddLogEntry(this, (uint64_t)a2, 6, 1, 0, a6, a7, a8, a9);
}

uint64_t FastpathDriver::GetEndOffset(FastpathDriver *this, unint64_t *a2)
{
  if (!*((void *)this + 10))
  {
    unint64_t v9 = *((void *)this + 4);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      BOOL v15 = &unk_3E13;
      __int16 v16 = 2080;
      uint64_t v17 = "_queueAddr";
      __int16 v18 = 2080;
      uint64_t v19 = &unk_3E13;
      __int16 v20 = 2080;
      __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/FastpathLib/FastpathLib.cpp";
      __int16 v22 = 1024;
      int v23 = 634;
      __int16 v24 = 1024;
      int v25 = 0;
LABEL_9:
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    }
LABEL_10:
    FastpathDriver::AddLogEntry(this, v10, 7, 0, 1u, v11, v12, v13, *a2);
    return 3758097084;
  }
  if ((sub_32F4((uint64_t)this + 88, 0, 0, 0, 0, (uint64_t *)a2) & 1) == 0)
  {
    unint64_t v9 = *((void *)this + 4);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      BOOL v15 = &unk_3E13;
      __int16 v16 = 2080;
      uint64_t v17 = "success";
      __int16 v18 = 2080;
      uint64_t v19 = &unk_3E13;
      __int16 v20 = 2080;
      __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/FastpathLib/FastpathLib.cpp";
      __int16 v22 = 1024;
      int v23 = 638;
      __int16 v24 = 1024;
      int v25 = 0;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  FastpathDriver::AddLogEntry(this, v4, 7, 1, 1u, v5, v6, v7, *a2);
  return 0;
}

void FastpathLibFactory(const __CFAllocator *a1, const void *a2)
{
  CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0x53u, 0xEAu, 0x67u, 0x34u, 0xC7u, 0xEu, 0x46u, 0x35u, 0x9Cu, 0xF5u, 0x4Fu, 0xAFu, 5u, 0xB4u, 0xF2u, 0x30u);
  if (CFEqual(a2, v4))
  {
    uint64_t v5 = (FastpathDriver *)CFAllocatorAllocate(a1, 296, 0);
    FastpathDriver::FastpathDriver(v5, a1);
  }
}

uint64_t FastpathDriver::InitLogEntry(void *a1, uint64_t a2, __int16 a3, __int16 a4)
{
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  CFUUIDRef v4 = (void *)(a2 + 16);
  *(_WORD *)a2 = 1;
  uint64_t v5 = a1[36];
  *(_WORD *)(a2 + 2) = v5;
  *(_WORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 6) = a4;
  uint64_t v6 = a1[31];
  *(_DWORD *)(a2 + 8) = a1[9];
  *(_DWORD *)(a2 + 12) = v6;
  a1[36] = v5 + 1;
  uint64_t result = sub_32F4((uint64_t)(a1 + 11), 0, 0, 0, 0, (uint64_t *)(a2 + 16));
  if ((result & 1) == 0) {
    *CFUUIDRef v4 = -1;
  }
  return result;
}

__n128 FastpathDriver::SaveLogEntry(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[32] + (a1[33] << 6);
  __n128 result = *(__n128 *)a2;
  long long v4 = *(_OWORD *)(a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v2 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v2 + 48) = v5;
  *(__n128 *)uint64_t v2 = result;
  *(_OWORD *)(v2 + 16) = v4;
  a1[33] = (unint64_t)(a1[33] + 1) % a1[34];
  return result;
}

uint64_t sub_3A34(uint64_t result)
{
  *(void *)(result + 88) = 0;
  *(void *)(result + 96) = 0;
  *(_DWORD *)(result + 104) = 0;
  return result;
}

uint64_t sub_3A40(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t *a4, uint64_t a5, void *a6)
{
  uint64_t v11 = *(unint64_t **)(a1 + 24);
  unint64_t v12 = *(unsigned int *)(a1 + 48);
  unint64_t v13 = *(unsigned int *)(a1 + 68);
  (**(void (***)(void, void, unint64_t, unint64_t))a1)(*(void *)(a1 + 8), 0, (v13 + 15) / v13 * v13, (v13 + 31) / v13 * v13);
  uint64_t v14 = 0;
  unint64_t v15 = *v11;
  if (*v11 >= v12) {
    unint64_t v16 = *v11 - v12;
  }
  else {
    unint64_t v16 = 0;
  }
  if (v15 <= a2) {
    goto LABEL_19;
  }
  if (v11[1] - a2 < a3) {
    a3 = v11[1] - a2;
  }
  bzero(a4, 40 * a5);
  *a6 = 0;
  uint64_t v14 = 0;
  if (a3)
  {
    uint64_t v17 = a4 + 2;
    while (a5 != v14)
    {
      if (a3 >= v12 - a2 % v12) {
        unint64_t v18 = v12 - a2 % v12;
      }
      else {
        unint64_t v18 = a3;
      }
      unint64_t v19 = v16 - a2;
      if (v18 < v16 - a2) {
        unint64_t v19 = v18;
      }
      *(v17 - 2) = *(void *)(a1 + 32) + a2 % v12;
      *(v17 - 1) = v18;
      v17[1] = a2;
      v17[2] = v15;
      if (v16 <= a2) {
        unint64_t v20 = 0;
      }
      else {
        unint64_t v20 = v19;
      }
      unint64_t *v17 = v20;
      v17 += 5;
      sub_3C14(a1, 2, 1, v18 | (a2 << 32), v15, a2);
      a2 += v18;
      ++v14;
      a3 -= v18;
      if (!a3) {
        goto LABEL_19;
      }
    }
    return 0;
  }
  else
  {
LABEL_19:
    *a6 = v14;
    return 1;
  }
}

uint64_t sub_3BA0(void *a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (*(uint64_t (**)(void))(*a1 + 24))(a1[1]);

  return sub_3C14((uint64_t)a1, a2, a3, v10, a4, a5);
}

uint64_t sub_3C14(uint64_t result, char a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned int v6 = *(_DWORD *)(result + 96);
  if (v6)
  {
    if (*(_DWORD *)(result + 100))
    {
      unsigned int v7 = *(_DWORD *)(result + 104);
      uint64_t v8 = *(void *)(result + 88) + 32 * (v7 % v6);
      *(unsigned char *)uint64_t v8 = a2;
      *(unsigned char *)(v8 + 1) = a3;
      *(_DWORD *)(v8 + 4) = v7;
      *(void *)(v8 + 8) = a4;
      *(void *)(v8 + 16) = a5;
      *(void *)(v8 + 24) = a6;
      *(_DWORD *)(result + 104) = v7 + 1;
    }
  }
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return _CFAllocatorAllocate(allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return _CFUUIDCreateFromUUIDBytes(alloc, bytes);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return _IOConnectMapMemory(connect, memoryType, intoTask, atAddress, ofSize, options);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return _IOConnectUnmapMemory(connect, memoryType, fromTask, atAddress);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

void std::terminate(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_release(void *object)
{
}