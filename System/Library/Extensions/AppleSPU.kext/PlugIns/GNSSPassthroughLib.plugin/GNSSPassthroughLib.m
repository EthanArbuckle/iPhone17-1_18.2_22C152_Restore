void GNSSPassthrough::QueueDataSourceCallback(std::mutex *this, void *a2)
{
  std::mutex *v3;
  CFAllocatorRef v4;
  mach_msg_header_t *v5;
  mach_msg_size_t i;
  mach_port_name_t v7;
  mach_msg_return_t v8;
  uint64_t vars8;

  v3 = this + 2;
  std::mutex::lock(this + 2);
  if (*(_DWORD *)this[1].__m_.__opaque)
  {
    v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    v5 = (mach_msg_header_t *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], 92, 0);
    for (i = 92; ; v5 = (mach_msg_header_t *)CFAllocatorReallocate(v4, v5, i, 0))
    {
      v5->msgh_bits = 0;
      v5->msgh_size = i;
      v7 = *(_DWORD *)this[1].__m_.__opaque;
      v5->msgh_remote_port = 0;
      v5->msgh_local_port = v7;
      v5->msgh_id = 0;
      v8 = mach_msg(v5, 117440518, 0, i, v7, 0, 0);
      if (v8 != 268451844) {
        break;
      }
      i = (v5->msgh_size + 71) & 0xFFFFFFFC;
    }
    if (!v8) {
      GNSSPassthrough::_dequeueData((IODataQueueEntry *)this);
    }
    CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x263EFFB30], v5);
  }

  std::mutex::unlock(v3);
}

void sub_240764430(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

IODataQueueEntry *GNSSPassthrough::_dequeueData(IODataQueueEntry *this)
{
  v1 = (IODataQueueMemory *)this[8];
  if (v1)
  {
    uint64_t v2 = (uint64_t)this;
    uint32_t dataSize = 0;
    this = IODataQueuePeek(v1);
    if (this)
    {
      v3 = this;
      do
      {
        v4 = *(void (**)(void, UInt8 *, void))(v2 + 16);
        if (v4) {
          v4(*(void *)(v2 + 24), v3->data, v3->size);
        }
        uint32_t dataSize = 0;
        IODataQueueDequeue(v1, 0, &dataSize);
        this = IODataQueuePeek(v1);
        v3 = this;
      }
      while (this);
    }
  }
  return this;
}

uint64_t GNSSPassthrough::_getSPUProperty(GNSSPassthrough *this, unsigned int a2, unsigned __int8 *outputStruct, unint64_t *a4)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a2;
  uint64_t result = *((unsigned int *)this + 12);
  if (result)
  {
    if (IOConnectCallMethod(result, 1u, input, 1u, 0, 0, 0, 0, outputStruct, a4)) {
      return 3758097084;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t GNSSPassthrough::WriteData(GNSSPassthrough *this, const void *inputStruct, size_t inputStructCnt)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = 32;
  mach_port_t v3 = *((_DWORD *)this + 12);
  if (v3) {
    return IOConnectCallMethod(v3, 2u, input, 1u, inputStruct, inputStructCnt, 0, 0, 0, 0);
  }
  else {
    return 3758097136;
  }
}

uint64_t GNSSPassthrough::SetPowerState(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int inputStruct = a2;
  v4 = *(NSObject **)(a1 + 56);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = "OFF";
    if (a2 == 1) {
      v5 = "STANDBY";
    }
    if (a2 == 2) {
      v5 = "ON";
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v5;
    _os_log_impl(&dword_240763000, v4, OS_LOG_TYPE_INFO, "SetPowerState called with %s", buf, 0xCu);
  }
  *(void *)buf = 33;
  mach_port_t v6 = *(_DWORD *)(a1 + 48);
  if (v6) {
    return IOConnectCallMethod(v6, 2u, (const uint64_t *)buf, 1u, &inputStruct, 1uLL, 0, 0, 0, 0);
  }
  else {
    return 3758097136;
  }
}

uint64_t GNSSPassthrough::PerformTimeSync(GNSSPassthrough *this, unint64_t *a2, unint64_t *a3)
{
  input[1] = *MEMORY[0x263EF8340];
  size_t v9 = 16;
  input[0] = 34;
  mach_port_t v3 = *((_DWORD *)this + 12);
  if (!v3) {
    return 3758097136;
  }
  uint64_t result = IOConnectCallMethod(v3, 2u, input, 1u, 0, 0, 0, 0, outputStruct, &v9);
  if (result) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v9 == 16;
  }
  if (v7)
  {
    uint64_t result = 0;
    unint64_t v8 = outputStruct[1];
    *a2 = outputStruct[0];
    *a3 = v8;
  }
  return result;
}

uint64_t sub_2407647B8(uint64_t a1, CFUUIDBytes a2, void **a3)
{
  return GNSSPassthrough::QueryInterface(*(GNSSPassthrough **)(a1 + 8), a2, a3);
}

uint64_t sub_2407647C0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t result = (*(_DWORD *)(v1 + 272) + 1);
  *(_DWORD *)(v1 + 272) = result;
  return result;
}

uint64_t sub_2407647D4(uint64_t a1)
{
  return GNSSPassthrough::Release(*(GNSSPassthrough **)(a1 + 8));
}

uint64_t sub_2407647DC()
{
  return 0;
}

uint64_t sub_2407647E4(uint64_t a1, const __CFDictionary *a2, int a3)
{
  return GNSSPassthrough::Start(*(GNSSPassthrough **)(a1 + 8), a2, a3);
}

uint64_t sub_2407647EC(uint64_t a1)
{
  return 0;
}

uint64_t sub_24076480C(uint64_t a1, dispatch_queue_s *a2)
{
  return GNSSPassthrough::SetDispatchQueue(*(std::mutex **)(a1 + 8), a2);
}

uint64_t sub_240764814(uint64_t a1, void (*a2)(void *, void *, unint64_t), void *a3)
{
  return GNSSPassthrough::RegisterDataHandler(*(std::mutex **)(a1 + 8), a2, a3);
}

uint64_t sub_24076481C(uint64_t a1, const void *a2, size_t a3)
{
  return GNSSPassthrough::WriteData(*(GNSSPassthrough **)(a1 + 8), a2, a3);
}

uint64_t sub_240764824(uint64_t a1, void (*a2)(void *, unsigned int, void *, unint64_t), void *a3)
{
  return GNSSPassthrough::RegisterEventHandler(*(std::mutex **)(a1 + 8), a2, a3);
}

uint64_t sub_24076482C(uint64_t a1, int a2)
{
  return GNSSPassthrough::SetPowerState(*(void *)(a1 + 8), a2);
}

uint64_t sub_240764834(uint64_t a1, unsigned __int8 *outputStruct)
{
  uint64_t v2 = *(GNSSPassthrough **)(a1 + 8);
  unint64_t v4 = 1;
  *(_DWORD *)outputStruct = 0;
  return GNSSPassthrough::_getSPUProperty(v2, 0xD0u, outputStruct, &v4);
}

uint64_t sub_240764870(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  return GNSSPassthrough::PerformTimeSync(*(GNSSPassthrough **)(a1 + 8), a2, a3);
}

void GNSSPassthrough::alloc(GNSSPassthrough *this, const __CFAllocator *a2)
{
  mach_port_t v3 = (GNSSPassthrough *)CFAllocatorAllocate(this, 280, 0);

  GNSSPassthrough::GNSSPassthrough(v3, this);
}

void GNSSPassthrough::operator delete(CFAllocatorRef *ptr)
{
}

void sub_2407648E0(void *a1)
{
}

void GNSSPassthrough::GNSSPassthrough(GNSSPassthrough *this, const __CFAllocator *a2)
{
  *(void *)this = &GNSSPassthrough::vtbl_v1;
  *((void *)this + 1) = this;
  *((void *)this + 10) = 0;
  *((_DWORD *)this + 22) = 0;
  *((void *)this + 16) = 850045863;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)((char *)this + 60) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((void *)this + 26) = 1018212795;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *((void *)this + 25) = 0;
  *((void *)this + 31) = 0;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *((void *)this + 33) = a2;
  *((_DWORD *)this + 68) = 1;
  CFUUIDRef v2 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0xF1u, 0x81u, 0x55u, 0xF9u, 0x51u, 0x93u, 0x47u, 0x6Cu, 0x96u, 5u, 0xB0u, 0x26u, 0xBBu, 0x5Fu, 0xCFu, 0xABu);
  CFPlugInAddInstanceForFactory(v2);
}

void sub_2407649E8(_Unwind_Exception *a1)
{
  std::condition_variable::~condition_variable(v2);
  std::mutex::~mutex(v1);
  _Unwind_Resume(a1);
}

void GNSSPassthrough::~GNSSPassthrough(GNSSPassthrough *this)
{
  CFUUIDRef v2 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0xF1u, 0x81u, 0x55u, 0xF9u, 0x51u, 0x93u, 0x47u, 0x6Cu, 0x96u, 5u, 0xB0u, 0x26u, 0xBBu, 0x5Fu, 0xCFu, 0xABu);
  CFPlugInRemoveInstanceForFactory(v2);
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)this + 208));
  std::mutex::~mutex((std::mutex *)this + 2);
}

uint64_t GNSSPassthrough::QueryInterface(GNSSPassthrough *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0xE8u, 0x77u, 0xCDu, 0x61u, 0x8Du, 0x30u, 0x46u, 0x2Du, 0xA3u, 0xB7u, 0xB0u, 0x11u, 0x5Au, 0x2Cu, 0xF8u, 0xA8u);
  if (CFEqual(v5, v7)
    || (CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu), CFEqual(v5, v8))|| (v9 = CFUUIDGetConstantUUIDWithBytes(v6, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u), CFEqual(v5, v9)))
  {
    uint64_t v10 = 0;
    ++*((_DWORD *)this + 68);
  }
  else
  {
    this = 0;
    uint64_t v10 = 2147483652;
  }
  *a3 = this;
  CFRelease(v5);
  return v10;
}

uint64_t GNSSPassthrough::AddRef(GNSSPassthrough *this)
{
  uint64_t v1 = (*((_DWORD *)this + 68) + 1);
  *((_DWORD *)this + 68) = v1;
  return v1;
}

uint64_t GNSSPassthrough::Release(GNSSPassthrough *this)
{
  int v1 = *((_DWORD *)this + 68);
  uint64_t v2 = (v1 - 1);
  *((_DWORD *)this + 68) = v2;
  if (v1 == 1)
  {
    GNSSPassthrough::~GNSSPassthrough(this);
    GNSSPassthrough::operator delete(v3);
  }
  return v2;
}

uint64_t GNSSPassthrough::Probe(GNSSPassthrough *this, const __CFDictionary *a2, unsigned int a3, int *a4)
{
  return 0;
}

uint64_t GNSSPassthrough::Start(GNSSPassthrough *this, const __CFDictionary *a2, int a3)
{
  uint64_t v4 = 3758097086;
  if (a3)
  {
    *((_DWORD *)this + 13) = a3;
    *((void *)this + 7) = os_log_create("com.apple.GNSSPassthroughLib", "default");
    uint64_t v5 = IOServiceOpen(*((_DWORD *)this + 13), *MEMORY[0x263EF8960], 0, (io_connect_t *)this + 12);
    if (v5)
    {
      uint64_t v4 = v5;
    }
    else
    {
      IONotificationPortRef v6 = IONotificationPortCreate(*MEMORY[0x263F0EC90]);
      *((void *)this + 12) = v6;
      if (v6)
      {
        CFUUIDRef v7 = dispatch_queue_create("com.apple.GNSSPassthrough.notificationQueue", 0);
        *((void *)this + 13) = v7;
        if (v7)
        {
          IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)this + 12), v7);
          uint64_t v4 = IOServiceAddInterestNotification(*((IONotificationPortRef *)this + 12), *((_DWORD *)this + 13), "IOGeneralInterest", (IOServiceInterestCallback)nullsub_1, this, (io_object_t *)this + 64);
          if (!v4) {
            return v4;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v4 = 3758097095;
  }
  io_connect_t v8 = *((_DWORD *)this + 12);
  if (v8)
  {
    if (*((void *)this + 12))
    {
      IONotificationPortDestroy(*((IONotificationPortRef *)this + 12));
      io_connect_t v8 = *((_DWORD *)this + 12);
    }
    IOServiceClose(v8);
    *((void *)this + 12) = 0;
    *((_DWORD *)this + 12) = 0;
  }
  CFUUIDRef v9 = *((void *)this + 13);
  if (v9)
  {
    dispatch_release(v9);
    *((void *)this + 13) = 0;
  }
  return v4;
}

uint64_t GNSSPassthrough::Stop(GNSSPassthrough *this)
{
  v6.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)this + 128);
  v6.__owns_ = 1;
  std::mutex::lock((std::mutex *)this + 2);
  uint64_t v2 = *((void *)this + 24);
  if (v2)
  {
    dispatch_source_cancel(v2);
    std::condition_variable::wait((std::condition_variable *)((char *)this + 208), &v6);
    dispatch_release(*((dispatch_object_t *)this + 24));
    *((void *)this + 24) = 0;
  }
  mach_port_t v3 = *((void *)this + 25);
  if (v3)
  {
    dispatch_source_cancel(v3);
    std::condition_variable::wait((std::condition_variable *)((char *)this + 208), &v6);
    dispatch_release(*((dispatch_object_t *)this + 25));
    *((void *)this + 25) = 0;
  }
  uint64_t v4 = *((void *)this + 13);
  if (v4)
  {
    dispatch_release(v4);
    *((void *)this + 13) = 0;
  }
  if (v6.__owns_) {
    std::mutex::unlock(v6.__m_);
  }
  return 0;
}

uint64_t GNSSPassthrough::SetDispatchQueue(std::mutex *this, dispatch_queue_s *a2)
{
  uint64_t v4 = 3758097090;
  uint64_t v5 = this + 2;
  std::mutex::lock(this + 2);
  if (a2)
  {
    if (*(void *)&this[1].__m_.__opaque[48])
    {
      uint64_t v4 = 3758097106;
    }
    else
    {
      uint64_t v4 = 0;
      *(void *)&this[1].__m_.__opaque[48] = a2;
    }
  }
  std::mutex::unlock(v5);
  return v4;
}

uint64_t GNSSPassthrough::_performSPUCommand(uint64_t a1, unsigned int a2, void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *a6)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a2;
  mach_port_t v6 = *(_DWORD *)(a1 + 48);
  if (v6) {
    return IOConnectCallMethod(v6, 2u, input, 1u, inputStruct, inputStructCnt, 0, 0, outputStruct, a6);
  }
  else {
    return 3758097136;
  }
}

uint64_t GNSSPassthrough::RegisterDataHandler(std::mutex *this, void (*a2)(void *, void *, unint64_t), void *a3)
{
  mach_port_t v6 = this + 2;
  std::mutex::lock(this + 2);
  CFUUIDRef v7 = *(NSObject **)&this[1].__m_.__opaque[48];
  if (v7)
  {
    uint64_t v8 = GNSSPassthrough::_registerDataQueueHandler((GNSSPassthrough *)this, v7);
    if (!v8)
    {
      *(void *)&this->__m_.__opaque[8] = a2;
      *(void *)&this->__m_.__opaque[16] = a3;
    }
  }
  else
  {
    uint64_t v8 = 3758097112;
  }
  std::mutex::unlock(v6);
  return v8;
}

void sub_240764F88(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t GNSSPassthrough::_registerDataQueueHandler(GNSSPassthrough *this, NSObject *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = 3758097086;
  uint64_t v12 = 0;
  *(_OWORD *)input = xmmword_240765CC0;
  mach_port_t v4 = *((_DWORD *)this + 12);
  if (v4)
  {
    mach_port_t v6 = *((void *)this + 7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = 0x10000;
      _os_log_impl(&dword_240763000, v6, OS_LOG_TYPE_INFO, "Allocating data queue of size %llu", buf, 0xCu);
      mach_port_t v4 = *((_DWORD *)this + 12);
    }
    if (IOConnectCallMethod(v4, 3u, input, 2u, 0, 0, 0, 0, 0, 0)) {
      return 0;
    }
    uint64_t NotificationPort = IODataQueueAllocateNotificationPort();
    *((_DWORD *)this + 18) = NotificationPort;
    if (NotificationPort)
    {
      uint64_t v8 = MEMORY[0x2455F78B0](*((unsigned int *)this + 12), 0, NotificationPort, 0);
      if (v8
        || (uint64_t v8 = MEMORY[0x2455F78A0](*((unsigned int *)this + 12), 0, *MEMORY[0x263EF8960], (char *)this + 64, &v12, 1), v8))
      {
        uint64_t v3 = v8;
      }
      else
      {
        CFUUIDRef v9 = dispatch_source_create(MEMORY[0x263EF83C8], *((unsigned int *)this + 18), 0, a2);
        *((void *)this + 24) = v9;
        if (v9)
        {
          dispatch_set_context(v9, this);
          dispatch_source_set_event_handler_f(*((dispatch_source_t *)this + 24), (dispatch_function_t)GNSSPassthrough::QueueDataSourceCallback);
          dispatch_source_set_cancel_handler_f(*((dispatch_source_t *)this + 24), (dispatch_function_t)GNSSPassthrough::QueueEventSourceCancelHandler);
          dispatch_resume(*((dispatch_object_t *)this + 24));
          return 0;
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 3758097136;
  }
  v11 = *((void *)this + 7);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_240765890(v3, v11);
  }
  return v3;
}

uint64_t GNSSPassthrough::RegisterEventHandler(std::mutex *this, void (*a2)(void *, unsigned int, void *, unint64_t), void *a3)
{
  mach_port_t v6 = this + 2;
  std::mutex::lock(this + 2);
  CFUUIDRef v7 = *(NSObject **)&this[1].__m_.__opaque[48];
  if (v7)
  {
    uint64_t v8 = GNSSPassthrough::_registerEventQueueHandler((GNSSPassthrough *)this, v7);
    if (!v8)
    {
      *(void *)&this->__m_.__opaque[24] = a2;
      *(void *)&this->__m_.__opaque[32] = a3;
    }
  }
  else
  {
    uint64_t v8 = 3758097112;
  }
  std::mutex::unlock(v6);
  return v8;
}

void sub_240765200(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t GNSSPassthrough::_registerEventQueueHandler(GNSSPassthrough *this, NSObject *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = 3758097086;
  uint64_t v12 = 0;
  *(_OWORD *)input = xmmword_240765CD0;
  mach_port_t v4 = *((_DWORD *)this + 12);
  if (v4)
  {
    mach_port_t v6 = *((void *)this + 7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = 1024;
      _os_log_impl(&dword_240763000, v6, OS_LOG_TYPE_INFO, "Allocating event queue of size %llu", buf, 0xCu);
      mach_port_t v4 = *((_DWORD *)this + 12);
    }
    if (IOConnectCallMethod(v4, 3u, input, 2u, 0, 0, 0, 0, 0, 0)) {
      return 0;
    }
    uint64_t NotificationPort = IODataQueueAllocateNotificationPort();
    *((_DWORD *)this + 22) = NotificationPort;
    if (NotificationPort)
    {
      uint64_t v8 = MEMORY[0x2455F78B0](*((unsigned int *)this + 12), 1, NotificationPort, 0);
      if (v8
        || (uint64_t v8 = MEMORY[0x2455F78A0](*((unsigned int *)this + 12), 1, *MEMORY[0x263EF8960], (char *)this + 80, &v12, 1), v8))
      {
        uint64_t v3 = v8;
      }
      else
      {
        CFUUIDRef v9 = dispatch_source_create(MEMORY[0x263EF83C8], *((unsigned int *)this + 22), 0, a2);
        *((void *)this + 25) = v9;
        if (v9)
        {
          dispatch_set_context(v9, this);
          dispatch_source_set_event_handler_f(*((dispatch_source_t *)this + 25), (dispatch_function_t)GNSSPassthrough::QueueEventSourceCallback);
          dispatch_source_set_cancel_handler_f(*((dispatch_source_t *)this + 25), (dispatch_function_t)GNSSPassthrough::QueueEventSourceCancelHandler);
          dispatch_resume(*((dispatch_object_t *)this + 25));
          return 0;
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 3758097136;
  }
  v11 = *((void *)this + 7);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_240765908(v3, v11);
  }
  return v3;
}

void GNSSPassthrough::QueueEventSourceCallback(std::mutex *this, void *a2)
{
  mach_msg_return_t v8;
  uint64_t vars8;

  uint64_t v3 = this + 2;
  std::mutex::lock(this + 2);
  if (*(_DWORD *)&this[1].__m_.__opaque[16])
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v5 = (mach_msg_header_t *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], 92, 0);
    for (i = 92; ; uint64_t v5 = (mach_msg_header_t *)CFAllocatorReallocate(v4, v5, i, 0))
    {
      v5->msgh_bits = 0;
      v5->msgh_size = i;
      mach_port_name_t v7 = *(_DWORD *)&this[1].__m_.__opaque[16];
      v5->msgh_remote_port = 0;
      v5->msgh_local_port = v7;
      v5->msgh_id = 0;
      uint64_t v8 = mach_msg(v5, 117440518, 0, i, v7, 0, 0);
      if (v8 != 268451844) {
        break;
      }
      mach_msg_size_t i = (v5->msgh_size + 71) & 0xFFFFFFFC;
    }
    if (!v8) {
      GNSSPassthrough::_dequeueEvents((IODataQueueEntry *)this);
    }
    CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x263EFFB30], v5);
  }

  std::mutex::unlock(v3);
}

void sub_24076550C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t GNSSPassthrough::_dispatchDataQueueMessage(uint64_t this, void *a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void *))(this + 16);
  if (v2) {
    return v2(*(void *)(this + 24), a2);
  }
  return this;
}

IODataQueueEntry *GNSSPassthrough::_dequeueEvents(IODataQueueEntry *this)
{
  int v1 = (IODataQueueMemory *)this[10];
  if (v1)
  {
    uint64_t v2 = (uint64_t)this;
    uint32_t dataSize = 0;
    this = IODataQueuePeek(v1);
    if (this)
    {
      uint64_t v3 = (char *)this;
      do
      {
        GNSSPassthrough::_dispatchEventQueueMessage(v2, v3 + 4, *(unsigned int *)v3);
        uint32_t dataSize = 0;
        IODataQueueDequeue(v1, 0, &dataSize);
        this = IODataQueuePeek(v1);
        uint64_t v3 = (char *)this;
      }
      while (this);
    }
  }
  return this;
}

uint64_t GNSSPassthrough::_dispatchEventQueueMessage(uint64_t this, char *a2, uint64_t a3)
{
  uint64_t v4 = 0;
  int v7 = *(_DWORD *)a2;
  uint64_t v5 = (int *)(a2 + 4);
  int v6 = v7;
  if ((unint64_t)(a3 - 4) >= 4 && v6 == 37)
  {
    int v8 = *v5;
    if ((*v5 - 1) >= 5) {
      int v8 = 0;
    }
    int *v5 = v8;
    uint64_t v4 = 1;
  }
  CFUUIDRef v9 = *(uint64_t (**)(void, uint64_t, int *))(this + 32);
  if (v9) {
    return v9(*(void *)(this + 40), v4, v5);
  }
  return this;
}

uint64_t GNSSPassthrough::_parseErrorEventType(GNSSPassthrough *this, unsigned int *a2)
{
  if (*a2 - 1 >= 5) {
    return 0;
  }
  else {
    return *a2;
  }
}

void GNSSPassthrough::_dispatchSourceCancelHandler(GNSSPassthrough *this)
{
  uint64_t v2 = (std::mutex *)((char *)this + 128);
  std::mutex::lock((std::mutex *)this + 2);
  uint64_t v3 = (ipc_space_t *)MEMORY[0x263EF8960];
  if (*((void *)this + 10))
  {
    MEMORY[0x2455F78C0](*((unsigned int *)this + 12), 0, *MEMORY[0x263EF8960]);
    *((void *)this + 10) = 0;
  }
  if (*((void *)this + 8))
  {
    MEMORY[0x2455F78C0](*((unsigned int *)this + 12), 0, *v3);
    *((void *)this + 8) = 0;
  }
  io_connect_t v4 = *((_DWORD *)this + 12);
  if (v4)
  {
    if (*((void *)this + 12))
    {
      IONotificationPortDestroy(*((IONotificationPortRef *)this + 12));
      io_connect_t v4 = *((_DWORD *)this + 12);
    }
    IOServiceClose(v4);
    *((void *)this + 12) = 0;
    *((_DWORD *)this + 12) = 0;
  }
  mach_port_name_t v5 = *((_DWORD *)this + 18);
  if (v5)
  {
    mach_port_mod_refs(*v3, v5, 1u, -1);
    *((_DWORD *)this + 18) = 0;
  }
  mach_port_name_t v6 = *((_DWORD *)this + 22);
  if (v6)
  {
    mach_port_mod_refs(*v3, v6, 1u, -1);
    *((_DWORD *)this + 22) = 0;
  }
  std::condition_variable::notify_one((std::condition_variable *)((char *)this + 208));

  std::mutex::unlock(v2);
}

void sub_240765704(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t GNSSPassthrough::GetPowerState(GNSSPassthrough *a1, unsigned __int8 *outputStruct)
{
  unint64_t v3 = 1;
  *(_DWORD *)outputStruct = 0;
  return GNSSPassthrough::_getSPUProperty(a1, 0xD0u, outputStruct, &v3);
}

uint64_t GNSSPassthrough::_setSPUProperty(GNSSPassthrough *this, unsigned int a2, unsigned __int8 *inputStruct, size_t inputStructCnt)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a2;
  mach_port_t v4 = *((_DWORD *)this + 12);
  if (!v4) {
    return 3758097136;
  }
  if (IOConnectCallMethod(v4, 0, input, 1u, inputStruct, inputStructCnt, 0, 0, 0, 0)) {
    return 3758097084;
  }
  return 0;
}

void GNSSPassthroughLibFactory(const __CFAllocator *a1, const void *a2)
{
  CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x31u, 0x68u, 0xB0u, 0x8Eu, 0xE5u, 0x7Du, 0x4Eu, 4u, 0x92u, 0xC9u, 0xC0u, 0x15u, 0xB8u, 0xB0u, 0xE9u, 0xABu);
  if (CFEqual(a2, v4))
  {
    mach_port_name_t v5 = (GNSSPassthrough *)CFAllocatorAllocate(a1, 280, 0);
    GNSSPassthrough::GNSSPassthrough(v5, a1);
  }
}

void sub_240765890(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_240763000, a2, OS_LOG_TYPE_ERROR, "Error creating data queue: 0x%x", (uint8_t *)v2, 8u);
}

void sub_240765908(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_240763000, a2, OS_LOG_TYPE_ERROR, "Error creating event queue: 0x%x", (uint8_t *)v2, 8u);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void *__cdecl CFAllocatorReallocate(CFAllocatorRef allocator, void *ptr, CFIndex newsize, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE42B0](allocator, ptr, newsize, hint);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
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
  return (CFUUIDRef)MEMORY[0x270EE5480](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x270EE5498](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x270EF3F50](*(void *)&connect, *(void *)&memoryType, *(void *)&intoTask, atAddress, ofSize, *(void *)&options);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x270EF3F78](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x270EF3FB8](*(void *)&connect, *(void *)&memoryType, *(void *)&fromTask, atAddress);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return MEMORY[0x270EF3FD8]();
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return MEMORY[0x270EF3FE8](dataQueue, data, dataSize);
}

IODataQueueEntry *__cdecl IODataQueuePeek(IODataQueueMemory *dataQueue)
{
  return (IODataQueueEntry *)MEMORY[0x270EF3FF0](dataQueue);
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

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x270EF4A80](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::condition_variable::notify_one(std::condition_variable *this)
{
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
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

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}