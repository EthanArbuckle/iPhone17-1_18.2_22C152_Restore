uint64_t MesaPlugIn::Probe(MesaPlugIn *this, const __CFDictionary *a2, const __CFDictionary *a3, int *a4, int *a5)
{
  MesaPlugIn::Probe(this, a2, a3, a4);
  return 0;
}

uint64_t MesaPlugIn::SetCaptureCallback(MesaPlugIn *this, void (*a2)(unint64_t), void (*a3)(unint64_t), uint64_t a4, uint64_t a5)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    v12 = "SetCaptureCallback";
    __int16 v13 = 2080;
    v14 = "SetCaptureCallback";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: ", (uint8_t *)&v11, 0x16u);
  }
  return MesaPlugIn::SetCaptureCallback(this, a2, (uint64_t)a3, a4, a5);
}

MesaPlugIn *AppleMesaFactory(uint64_t a1, const void *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "AppleMesaFactory";
    __int16 v9 = 2080;
    v10 = "AppleMesaFactory";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: ", buf, 0x16u);
  }
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0x3Fu, 0x3Bu, 4u, 0xCCu, 0xA0u, 0x7Au, 0x46u, 0xA5u, 0x9Du, 0xDFu, 0x78u, 0x76u, 0x8Cu, 0x96u, 0x67u, 0x71u);
  if (CFEqual(a2, v3))
  {
    v4 = (MesaPlugIn *)CFAllocatorAllocate(kCFAllocatorDefault, 104, 0);
    CFUUIDRef v5 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 1u, 0xBFu, 0x9Au, 0x83u, 0x2Bu, 0x71u, 0x40u, 0xF9u, 0x9Au, 0xA2u, 0x79u, 0x4Au, 0xC0u, 0x82u, 0xF6u, 1u);
    MesaPlugIn::MesaPlugIn(v4, v5);
  }
  else
  {
    v4 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v8 = "AppleMesaFactory";
    __int16 v9 = 2080;
    v10 = "AppleMesaFactory";
    __int16 v11 = 2048;
    v12 = v4;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", buf, 0x20u);
  }
  return v4;
}

void MesaPlugIn::MesaPlugIn(MesaPlugIn *this, CFTypeRef cf)
{
  CFTypeRef v4 = CFRetain(cf);
  *((_DWORD *)this + 4) = 1;
  *((void *)this + 4) = 0;
  *(void *)this = &MesaPlugIn::sMesaPlugInFtbl;
  *((void *)this + 1) = v4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315650;
    v6 = "MesaPlugIn";
    __int16 v7 = 2080;
    v8 = "MesaPlugIn";
    __int16 v9 = 2048;
    v10 = this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", (uint8_t *)&v5, 0x20u);
  }
  CFPlugInAddInstanceForFactory((CFUUIDRef)cf);
}

void MesaPlugIn::~MesaPlugIn(CFUUIDRef *this)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315650;
    CFUUIDRef v3 = "~MesaPlugIn";
    __int16 v4 = 2080;
    int v5 = "~MesaPlugIn";
    __int16 v6 = 2048;
    __int16 v7 = this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", (uint8_t *)&v2, 0x20u);
  }
  CFPlugInRemoveInstanceForFactory(this[1]);
  CFRelease(this[1]);
}

void sub_1140(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_114C(a1);
}

void sub_114C(void *a1)
{
}

uint64_t MesaPlugIn::QueryInterface(MesaPlugIn *this, CFUUIDBytes a2, void **a3)
{
  uint64_t v4 = *(void *)&a2.byte8;
  uint64_t v5 = *(void *)&a2.byte0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "QueryInterface";
    __int16 v15 = 2080;
    v16 = "QueryInterface";
    __int16 v17 = 2048;
    v18 = this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", buf, 0x20u);
  }
  *(void *)&v19.byte0 = v5;
  *(void *)&v19.byte8 = v4;
  CFUUIDRef v7 = CFUUIDCreateFromUUIDBytes(0, v19);
  CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0x5Bu, 0x12u, 0x84u, 0x69u, 0x10u, 0xE8u, 0x43u, 0x2Au, 0xB8u, 0x33u, 0xE5u, 0x71u, 0xBAu, 0xE2u, 0x9Fu, 0xA0u);
  if (CFEqual(v7, v8)
    || (CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu), CFEqual(v7, v9))|| (v10 = CFUUIDGetConstantUUIDWithBytes(
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
        CFEqual(v7, v10)))
  {
    MesaPlugIn::AddRef(this);
    uint64_t v11 = 0;
  }
  else
  {
    this = 0;
    uint64_t v11 = 2147483652;
  }
  *a3 = this;
  CFRelease(v7);
  return v11;
}

uint64_t MesaPlugIn::AddRef(MesaPlugIn *this)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315650;
    uint64_t v4 = "AddRef";
    __int16 v5 = 2080;
    __int16 v6 = "AddRef";
    __int16 v7 = 2048;
    CFUUIDRef v8 = this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", (uint8_t *)&v3, 0x20u);
  }
  uint64_t result = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = result;
  return result;
}

uint64_t MesaPlugIn::Release(MesaPlugIn *this)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315650;
    __int16 v5 = "Release";
    __int16 v6 = 2080;
    __int16 v7 = "Release";
    __int16 v8 = 2048;
    CFUUIDRef v9 = this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", (uint8_t *)&v4, 0x20u);
  }
  int v2 = *((_DWORD *)this + 4);
  *((_DWORD *)this + 4) = v2 - 1;
  if (v2 == 1)
  {
    MesaPlugIn::~MesaPlugIn((CFUUIDRef *)this);
    operator delete();
  }
  return (v2 - 1);
}

uint64_t MesaPlugIn::Probe(MesaPlugIn *this, const __CFDictionary *a2, unsigned int a3, int *a4)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315650;
    __int16 v8 = "Probe";
    __int16 v9 = 2080;
    CFUUIDRef v10 = "Probe";
    __int16 v11 = 2048;
    v12 = this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", (uint8_t *)&v7, 0x20u);
  }
  *a4 = 1000;
  return 0;
}

uint64_t MesaPlugIn::Start(io_connect_t *this, const __CFDictionary *a2, io_service_t a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    int v7 = "Start";
    __int16 v8 = 2080;
    __int16 v9 = "Start";
    __int16 v10 = 2048;
    __int16 v11 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", (uint8_t *)&v6, 0x20u);
  }
  this[5] = a3;
  return IOServiceOpen(a3, mach_task_self_, 1u, this + 6);
}

uint64_t MesaPlugIn::Stop(io_connect_t *this)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315650;
    int v4 = "Stop";
    __int16 v5 = 2080;
    int v6 = "Stop";
    __int16 v7 = 2048;
    __int16 v8 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", (uint8_t *)&v3, 0x20u);
  }
  uint64_t result = IOServiceClose(this[6]);
  this[5] = 0;
  this[6] = 0;
  return result;
}

uint64_t MesaPlugIn::Open(mach_port_t *this, unsigned int a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v9 = "Open";
    __int16 v10 = 2080;
    __int16 v11 = "Open";
    __int16 v12 = 2048;
    __int16 v13 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", buf, 0x20u);
  }
  uint64_t input = a2;
  uint64_t v4 = IOConnectCallScalarMethod(this[6], 3u, &input, 1u, 0, 0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    __int16 v5 = mach_error_string(v4);
    *(_DWORD *)buf = 136315650;
    __int16 v9 = "Open";
    __int16 v10 = 2080;
    __int16 v11 = "Open";
    __int16 v12 = 2080;
    __int16 v13 = (MesaPlugIn *)v5;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %s\n", buf, 0x20u);
  }
  return v4;
}

uint64_t MesaPlugIn::Close(mach_port_t *this, unsigned int a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v9 = "Close";
    __int16 v10 = 2080;
    __int16 v11 = "Close";
    __int16 v12 = 2048;
    __int16 v13 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", buf, 0x20u);
  }
  uint64_t input = a2;
  uint64_t v4 = IOConnectCallScalarMethod(this[6], 4u, &input, 1u, 0, 0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    __int16 v5 = mach_error_string(v4);
    *(_DWORD *)buf = 136315650;
    __int16 v9 = "Close";
    __int16 v10 = 2080;
    __int16 v11 = "Close";
    __int16 v12 = 2080;
    __int16 v13 = (MesaPlugIn *)v5;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %s\n", buf, 0x20u);
  }
  return v4;
}

uint64_t MesaPlugIn::Reset(uint64_t a1, unsigned int a2, void *a3, size_t a4)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v14 = "Reset";
    __int16 v15 = 2080;
    v16 = "Reset";
    __int16 v17 = 2048;
    v18 = (char *)a1;
    __int16 v19 = 1024;
    unsigned int v20 = a2;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p %x", buf, 0x26u);
  }
  size_t v11 = a4;
  uint64_t input = a2;
  uint64_t v8 = IOConnectCallMethod(*(_DWORD *)(a1 + 24), 5u, &input, 1u, 0, 0, 0, 0, a3, &v11);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    __int16 v9 = mach_error_string(v8);
    *(_DWORD *)buf = 136315650;
    v14 = "Reset";
    __int16 v15 = 2080;
    v16 = "Reset";
    __int16 v17 = 2080;
    v18 = v9;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %s\n", buf, 0x20u);
  }
  return v8;
}

uint64_t MesaPlugIn::Idle(mach_port_t *this, unsigned __int8 *a2, size_t a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    size_t v11 = "Idle";
    __int16 v12 = 2080;
    __int16 v13 = "Idle";
    __int16 v14 = 2048;
    __int16 v15 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", buf, 0x20u);
  }
  size_t outputStructCnt = a3;
  uint64_t v6 = IOConnectCallStructMethod(this[6], 0x16u, 0, 0, a2, &outputStructCnt);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    __int16 v7 = mach_error_string(v6);
    *(_DWORD *)buf = 136315650;
    size_t v11 = "Idle";
    __int16 v12 = 2080;
    __int16 v13 = "Idle";
    __int16 v14 = 2080;
    __int16 v15 = (MesaPlugIn *)v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %s\n", buf, 0x20u);
  }
  return v6;
}

uint64_t MesaPlugIn::StartCapture(mach_port_t *this, unsigned __int8 *a2, size_t a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    size_t v11 = "StartCapture";
    __int16 v12 = 2080;
    __int16 v13 = "StartCapture";
    __int16 v14 = 2048;
    __int16 v15 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", buf, 0x20u);
  }
  size_t outputStructCnt = a3;
  uint64_t v6 = IOConnectCallStructMethod(this[6], 6u, 0, 0, a2, &outputStructCnt);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    __int16 v7 = mach_error_string(v6);
    *(_DWORD *)buf = 136315650;
    size_t v11 = "StartCapture";
    __int16 v12 = 2080;
    __int16 v13 = "StartCapture";
    __int16 v14 = 2080;
    __int16 v15 = (MesaPlugIn *)v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %s\n", buf, 0x20u);
  }
  return v6;
}

uint64_t MesaPlugIn::StopCapture(mach_port_t *this, unsigned __int8 *a2, size_t a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    size_t v11 = "StopCapture";
    __int16 v12 = 2080;
    __int16 v13 = "StopCapture";
    __int16 v14 = 2048;
    __int16 v15 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", buf, 0x20u);
  }
  size_t outputStructCnt = a3;
  uint64_t v6 = IOConnectCallStructMethod(this[6], 7u, 0, 0, a2, &outputStructCnt);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    __int16 v7 = mach_error_string(v6);
    *(_DWORD *)buf = 136315650;
    size_t v11 = "StopCapture";
    __int16 v12 = 2080;
    __int16 v13 = "StopCapture";
    __int16 v14 = 2080;
    __int16 v15 = (MesaPlugIn *)v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %s\n", buf, 0x20u);
  }
  return v6;
}

uint64_t MesaPlugIn::PauseCapture(mach_port_t *this, unsigned __int8 *a2, size_t a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    size_t v11 = "PauseCapture";
    __int16 v12 = 2080;
    __int16 v13 = "PauseCapture";
    __int16 v14 = 2048;
    __int16 v15 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", buf, 0x20u);
  }
  size_t outputStructCnt = a3;
  uint64_t v6 = IOConnectCallStructMethod(this[6], 8u, 0, 0, a2, &outputStructCnt);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    __int16 v7 = mach_error_string(v6);
    *(_DWORD *)buf = 136315650;
    size_t v11 = "PauseCapture";
    __int16 v12 = 2080;
    __int16 v13 = "PauseCapture";
    __int16 v14 = 2080;
    __int16 v15 = (MesaPlugIn *)v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %s\n", buf, 0x20u);
  }
  return v6;
}

uint64_t MesaPlugIn::GetStatus(mach_port_t *this, unsigned __int8 *a2, size_t a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    size_t v11 = "GetStatus";
    __int16 v12 = 2080;
    __int16 v13 = "GetStatus";
    __int16 v14 = 2048;
    __int16 v15 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", buf, 0x20u);
  }
  size_t outputStructCnt = a3;
  uint64_t v6 = IOConnectCallStructMethod(this[6], 9u, 0, 0, a2, &outputStructCnt);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    __int16 v7 = mach_error_string(v6);
    *(_DWORD *)buf = 136315650;
    size_t v11 = "GetStatus";
    __int16 v12 = 2080;
    __int16 v13 = "GetStatus";
    __int16 v14 = 2080;
    __int16 v15 = (MesaPlugIn *)v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %s\n", buf, 0x20u);
  }
  return v6;
}

uint64_t MesaPlugIn::GetSerialNumber(mach_port_t *this, unsigned __int8 *a2, size_t a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    size_t v11 = "GetSerialNumber";
    __int16 v12 = 2080;
    __int16 v13 = "GetSerialNumber";
    __int16 v14 = 2048;
    __int16 v15 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", buf, 0x20u);
  }
  size_t outputStructCnt = a3;
  uint64_t v6 = IOConnectCallStructMethod(this[6], 0xAu, 0, 0, a2, &outputStructCnt);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    __int16 v7 = mach_error_string(v6);
    *(_DWORD *)buf = 136315906;
    size_t v11 = "GetSerialNumber";
    __int16 v12 = 2080;
    __int16 v13 = "GetSerialNumber";
    __int16 v14 = 2080;
    __int16 v15 = (MesaPlugIn *)v7;
    __int16 v16 = 1024;
    int v17 = outputStructCnt;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %s size=%x\n", buf, 0x26u);
  }
  return v6;
}

uint64_t MesaPlugIn::GetModuleSerialNumber(mach_port_t *this, unsigned __int8 *a2, size_t a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    size_t v11 = "GetModuleSerialNumber";
    __int16 v12 = 2080;
    __int16 v13 = "GetModuleSerialNumber";
    __int16 v14 = 2048;
    __int16 v15 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", buf, 0x20u);
  }
  size_t outputStructCnt = a3;
  uint64_t v6 = IOConnectCallStructMethod(this[6], 0xBu, 0, 0, a2, &outputStructCnt);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    __int16 v7 = mach_error_string(v6);
    *(_DWORD *)buf = 136315906;
    size_t v11 = "GetModuleSerialNumber";
    __int16 v12 = 2080;
    __int16 v13 = "GetModuleSerialNumber";
    __int16 v14 = 2080;
    __int16 v15 = (MesaPlugIn *)v7;
    __int16 v16 = 1024;
    int v17 = outputStructCnt;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %s size=%x\n", buf, 0x26u);
  }
  return v6;
}

uint64_t MesaPlugIn::GoToProductionMode(mach_port_t *this, unsigned __int8 *a2, size_t a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    size_t v11 = "GoToProductionMode";
    __int16 v12 = 2080;
    __int16 v13 = "GoToProductionMode";
    __int16 v14 = 2048;
    __int16 v15 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", buf, 0x20u);
  }
  size_t outputStructCnt = a3;
  uint64_t v6 = IOConnectCallStructMethod(this[6], 0xCu, 0, 0, a2, &outputStructCnt);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    __int16 v7 = mach_error_string(v6);
    *(_DWORD *)buf = 136315650;
    size_t v11 = "GoToProductionMode";
    __int16 v12 = 2080;
    __int16 v13 = "GoToProductionMode";
    __int16 v14 = 2080;
    __int16 v15 = (MesaPlugIn *)v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %s\n", buf, 0x20u);
  }
  return v6;
}

uint64_t MesaPlugIn::LoadPatch(MesaPlugIn *this, char *a2, size_t a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315906;
    __int16 v10 = "LoadPatch";
    __int16 v11 = 2080;
    __int16 v12 = "LoadPatch";
    __int16 v13 = 2048;
    __int16 v14 = a2;
    __int16 v15 = 2048;
    size_t v16 = a3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p %zx", (uint8_t *)&v9, 0x2Au);
  }
  uint64_t v6 = IOConnectCallStructMethod(*((_DWORD *)this + 6), 0xDu, a2, a3, 0, 0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    __int16 v7 = mach_error_string(v6);
    int v9 = 136315650;
    __int16 v10 = "LoadPatch";
    __int16 v11 = 2080;
    __int16 v12 = "LoadPatch";
    __int16 v13 = 2080;
    __int16 v14 = v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %s\n", (uint8_t *)&v9, 0x20u);
  }
  return v6;
}

uint64_t MesaPlugIn::Provision(mach_port_t *this, unsigned __int8 *a2, unsigned __int8 *a3, size_t a4)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v13 = "Provision";
    __int16 v14 = 2080;
    __int16 v15 = "Provision";
    __int16 v16 = 2048;
    int v17 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", buf, 0x20u);
  }
  size_t outputStructCnt = a4;
  uint64_t v8 = IOConnectCallStructMethod(this[6], 0xEu, a2, 0x20uLL, a3, &outputStructCnt);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v9 = mach_error_string(v8);
    *(_DWORD *)buf = 136315650;
    __int16 v13 = "Provision";
    __int16 v14 = 2080;
    __int16 v15 = "Provision";
    __int16 v16 = 2080;
    int v17 = (MesaPlugIn *)v9;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %s\n", buf, 0x20u);
  }
  return v8;
}

uint64_t MesaPlugIn::ScheduleWithRunLoop(IONotificationPortRef *this, __CFRunLoop *a2, const __CFString *a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    __int16 v10 = "ScheduleWithRunLoop";
    __int16 v11 = 2080;
    __int16 v12 = "ScheduleWithRunLoop";
    __int16 v13 = 2048;
    __int16 v14 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", (uint8_t *)&v9, 0x20u);
  }
  uint64_t v4 = 3758097084;
  if (!this[4])
  {
    IONotificationPortRef v5 = IONotificationPortCreate(kIOMainPortDefault);
    this[4] = v5;
    if (v5)
    {
      Current = CFRunLoopGetCurrent();
      RunLoopSource = IONotificationPortGetRunLoopSource(this[4]);
      CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
      return 0;
    }
  }
  return v4;
}

uint64_t MesaPlugIn::UnscheduleWithRunLoop(IONotificationPortRef *this, __CFRunLoop *a2, const __CFString *a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315650;
    uint64_t v8 = "UnscheduleWithRunLoop";
    __int16 v9 = 2080;
    __int16 v10 = "UnscheduleWithRunLoop";
    __int16 v11 = 2048;
    __int16 v12 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", (uint8_t *)&v7, 0x20u);
  }
  if (!this[4]) {
    return 3758097084;
  }
  Current = CFRunLoopGetCurrent();
  RunLoopSource = IONotificationPortGetRunLoopSource(this[4]);
  CFRunLoopRemoveSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
  IONotificationPortDestroy(this[4]);
  uint64_t result = 0;
  this[4] = 0;
  return result;
}

uint64_t MesaPlugIn::interruptAsyncCallout(MesaPlugIn *this, int a2, void *a3)
{
  uint64_t v4 = (void (*)(void, char *, uint64_t))*((void *)this + 7);
  if (v4) {
    v4(*((void *)this + 8), (char *)this + 40, 16);
  }
  reference[0] = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  reference[1] = (uint64_t)MesaPlugIn::_interruptAsyncCallout;
  long long v11 = (unint64_t)this;
  input[0] = (uint64_t)this + 40;
  input[1] = 16;
  uint32_t outputCnt = 0;
  mach_port_t v5 = *((_DWORD *)this + 6);
  mach_port_t MachPort = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 4));
  return IOConnectCallAsyncScalarMethod(v5, 0x15u, MachPort, reference, 3u, input, 2u, 0, &outputCnt);
}

uint64_t MesaPlugIn::SetInterruptCallback(MesaPlugIn *this, void (*a2)(unint64_t, unsigned __int8 *, unint64_t), uint64_t a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "SetInterruptCallback";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "SetInterruptCallback";
    *(_WORD *)&buf[22] = 2048;
    long long v13 = this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", buf, 0x20u);
  }
  uint64_t v6 = (IONotificationPort *)*((void *)this + 4);
  if (!v6) {
    return 3758097084;
  }
  *(void *)buf = 0;
  long long v13 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  *(void *)&buf[8] = MesaPlugIn::_interruptAsyncCallout;
  *(void *)&buf[16] = this;
  input[0] = (uint64_t)this + 40;
  input[1] = 16;
  uint32_t outputCnt = 0;
  mach_port_t v7 = *((_DWORD *)this + 6);
  mach_port_t MachPort = IONotificationPortGetMachPort(v6);
  uint64_t result = IOConnectCallAsyncScalarMethod(v7, 0x15u, MachPort, (uint64_t *)buf, 3u, input, 2u, 0, &outputCnt);
  if (!result)
  {
    *((void *)this + 7) = a2;
    *((void *)this + 8) = a3;
  }
  return result;
}

uint64_t MesaPlugIn::ReadCaptureAsyncCallback(MesaPlugIn *this, uint64_t a2, void *a3)
{
  uint64_t v4 = (void (*)(void, uint64_t, void *))*((void *)this + 9);
  if (v4) {
    v4(*((void *)this + 10), a2, a3);
  }
  reference[0] = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  reference[1] = (uint64_t)MesaPlugIn::_ReadCaptureAsyncCallback;
  long long v12 = (unint64_t)this;
  uint64_t v5 = *((void *)this + 12);
  input[0] = *((void *)this + 11);
  input[1] = v5;
  uint32_t outputCnt = 0;
  mach_port_t v6 = *((_DWORD *)this + 6);
  mach_port_t MachPort = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 4));
  return IOConnectCallAsyncScalarMethod(v6, 1u, MachPort, reference, 3u, input, 2u, 0, &outputCnt);
}

uint64_t MesaPlugIn::SetCaptureCallback(MesaPlugIn *this, void (*a2)(unint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "SetCaptureCallback";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "SetCaptureCallback";
    *(_WORD *)&buf[22] = 2048;
    __int16 v16 = this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", buf, 0x20u);
  }
  *((void *)this + 9) = a2;
  *((void *)this + 10) = a3;
  *((void *)this + 11) = a4;
  *((void *)this + 12) = a5;
  *(void *)buf = 0;
  __int16 v16 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  *(void *)&buf[8] = MesaPlugIn::_ReadCaptureAsyncCallback;
  *(void *)&buf[16] = this;
  input[0] = a4;
  input[1] = a5;
  uint32_t outputCnt = 0;
  mach_port_t v10 = *((_DWORD *)this + 6);
  mach_port_t MachPort = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 4));
  return IOConnectCallAsyncScalarMethod(v10, 1u, MachPort, (uint64_t *)buf, 3u, input, 2u, 0, &outputCnt);
}

uint64_t MesaPlugIn::SetPower(mach_port_t *this, unsigned int a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v9 = "SetPower";
    __int16 v10 = 2080;
    long long v11 = "SetPower";
    __int16 v12 = 2048;
    long long v13 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", buf, 0x20u);
  }
  uint64_t input = a2;
  uint64_t v4 = IOConnectCallScalarMethod(this[6], 0xFu, &input, 1u, 0, 0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = mach_error_string(v4);
    *(_DWORD *)buf = 136315650;
    __int16 v9 = "SetPower";
    __int16 v10 = 2080;
    long long v11 = "SetPower";
    __int16 v12 = 2080;
    long long v13 = (MesaPlugIn *)v5;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %s\n", buf, 0x20u);
  }
  return v4;
}

uint64_t MesaPlugIn::SetParameters(mach_port_t *this, unsigned __int8 *a2, size_t a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    __int16 v10 = "SetParameters";
    __int16 v11 = 2080;
    __int16 v12 = "SetParameters";
    __int16 v13 = 2048;
    long long v14 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", (uint8_t *)&v9, 0x20u);
  }
  uint64_t v6 = IOConnectCallStructMethod(this[6], 0x10u, a2, a3, 0, 0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    mach_port_t v7 = mach_error_string(v6);
    int v9 = 136315650;
    __int16 v10 = "SetParameters";
    __int16 v11 = 2080;
    __int16 v12 = "SetParameters";
    __int16 v13 = 2080;
    long long v14 = (MesaPlugIn *)v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %s\n", (uint8_t *)&v9, 0x20u);
  }
  return v6;
}

uint64_t MesaPlugIn::TriggerESD(mach_port_t *this)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315650;
    uint64_t v6 = "TriggerESD";
    __int16 v7 = 2080;
    uint64_t v8 = "TriggerESD";
    __int16 v9 = 2048;
    __int16 v10 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", (uint8_t *)&v5, 0x20u);
  }
  uint64_t v2 = IOConnectCallScalarMethod(this[6], 0x11u, 0, 0, 0, 0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v3 = mach_error_string(v2);
    int v5 = 136315650;
    uint64_t v6 = "TriggerESD";
    __int16 v7 = 2080;
    uint64_t v8 = "TriggerESD";
    __int16 v9 = 2080;
    __int16 v10 = (MesaPlugIn *)v3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %s\n", (uint8_t *)&v5, 0x20u);
  }
  return v2;
}

uint64_t MesaPlugIn::TriggerSPIError(mach_port_t *this)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315650;
    uint64_t v6 = "TriggerSPIError";
    __int16 v7 = 2080;
    uint64_t v8 = "TriggerSPIError";
    __int16 v9 = 2048;
    __int16 v10 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", (uint8_t *)&v5, 0x20u);
  }
  uint64_t v2 = IOConnectCallScalarMethod(this[6], 0x17u, 0, 0, 0, 0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v3 = mach_error_string(v2);
    int v5 = 136315650;
    uint64_t v6 = "TriggerSPIError";
    __int16 v7 = 2080;
    uint64_t v8 = "TriggerSPIError";
    __int16 v9 = 2080;
    __int16 v10 = (MesaPlugIn *)v3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %s\n", (uint8_t *)&v5, 0x20u);
  }
  return v2;
}

uint64_t MesaPlugIn::ClearPatchOverride(mach_port_t *this)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315650;
    uint64_t v6 = "ClearPatchOverride";
    __int16 v7 = 2080;
    uint64_t v8 = "ClearPatchOverride";
    __int16 v9 = 2048;
    __int16 v10 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", (uint8_t *)&v5, 0x20u);
  }
  uint64_t v2 = IOConnectCallScalarMethod(this[6], 0x12u, 0, 0, 0, 0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v3 = mach_error_string(v2);
    int v5 = 136315650;
    uint64_t v6 = "ClearPatchOverride";
    __int16 v7 = 2080;
    uint64_t v8 = "ClearPatchOverride";
    __int16 v9 = 2080;
    __int16 v10 = (MesaPlugIn *)v3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %s\n", (uint8_t *)&v5, 0x20u);
  }
  return v2;
}

uint64_t MesaPlugIn::StartFingerDetect(mach_port_t *this, unsigned __int8 *a2, size_t a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v11 = "StartFingerDetect";
    __int16 v12 = 2080;
    __int16 v13 = "StartFingerDetect";
    __int16 v14 = 2048;
    long long v15 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", buf, 0x20u);
  }
  size_t outputStructCnt = a3;
  uint64_t v6 = IOConnectCallStructMethod(this[6], 0x18u, 0, 0, a2, &outputStructCnt);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    __int16 v7 = mach_error_string(v6);
    *(_DWORD *)buf = 136315650;
    __int16 v11 = "StartFingerDetect";
    __int16 v12 = 2080;
    __int16 v13 = "StartFingerDetect";
    __int16 v14 = 2080;
    long long v15 = (MesaPlugIn *)v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %s\n", buf, 0x20u);
  }
  return v6;
}

uint64_t MesaPlugIn::StartBurnIn(mach_port_t *this, unsigned __int8 *a2, size_t a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v11 = "StartBurnIn";
    __int16 v12 = 2080;
    __int16 v13 = "StartBurnIn";
    __int16 v14 = 2048;
    long long v15 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", buf, 0x20u);
  }
  size_t outputStructCnt = a3;
  uint64_t v6 = IOConnectCallStructMethod(this[6], 0x19u, 0, 0, a2, &outputStructCnt);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    __int16 v7 = mach_error_string(v6);
    *(_DWORD *)buf = 136315650;
    __int16 v11 = "StartBurnIn";
    __int16 v12 = 2080;
    __int16 v13 = "StartBurnIn";
    __int16 v14 = 2080;
    long long v15 = (MesaPlugIn *)v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %s\n", buf, 0x20u);
  }
  return v6;
}

uint64_t MesaPlugIn::StopSSHBHB(mach_port_t *this, char a2, unsigned __int8 *a3, size_t a4)
{
  char inputStruct = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v13 = "StopSSHBHB";
    __int16 v14 = 2080;
    long long v15 = "StopSSHBHB";
    __int16 v16 = 2048;
    long long v17 = (MesaPlugIn *)this;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %p", buf, 0x20u);
  }
  size_t v10 = a4;
  uint64_t v7 = IOConnectCallStructMethod(this[6], 0x1Au, &inputStruct, 1uLL, a3, &v10);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = mach_error_string(v7);
    *(_DWORD *)buf = 136315650;
    __int16 v13 = "StopSSHBHB";
    __int16 v14 = 2080;
    long long v15 = "StopSSHBHB";
    __int16 v16 = 2080;
    long long v17 = (MesaPlugIn *)v8;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: %s\n", buf, 0x20u);
  }
  return v7;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return _CFAllocatorAllocate(allocator, size, hint);
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

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
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

kern_return_t IOConnectCallAsyncScalarMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallAsyncScalarMethod(connection, selector, wake_port, reference, referenceCnt, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return _IONotificationPortGetMachPort(notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}