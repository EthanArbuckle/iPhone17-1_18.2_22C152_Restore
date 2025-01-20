uint64_t _buildRTKitCommsCrashRequest(uint64_t result, char a2, int a3)
{
  if (result)
  {
    *(_DWORD *)result = *(_DWORD *)result & 0xFFF80000 | 0x4401;
    *(unsigned char *)(result + 4) = a2;
    *(_DWORD *)(result + 5) = a3;
  }
  return result;
}

uint64_t _processRTKitCommsCrashlogResponse(unsigned __int8 *a1)
{
  Instance = _RCLog::getInstance((_RCLog *)a1);
  _RCLog::log((_RCLog *)Instance, 1, "crashlog trigger with status %d", a1[4]);
  if (!a1[4]) {
    return 0;
  }
  v4 = _RCLog::getInstance(v3);
  _RCLog::log((_RCLog *)v4, 16, "crashlog trigger failed with status %d", a1[4]);
  return 3758097084;
}

void *_buildRTKitCommsBootNonceRequest(void *result)
{
  if (result) {
    *result = *(_DWORD *)result & 0xFFF80000 | 0x4801;
  }
  return result;
}

uint64_t _processRTKitCommsBootNonceResponse(uint64_t a1)
{
  if ((*(_DWORD *)a1 & 0xC000) != 0x8000)
  {
    Instance = _RCLog::getInstance((_RCLog *)a1);
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "header->mt == RTKOS_comms_type_response", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/common/Controller/RTKitCommHelpers.cpp", 76, 0);
    return 3758096385;
  }
  if ((*(_DWORD *)a1 & 0x3C00) != 0x800)
  {
    v9 = _RCLog::getInstance((_RCLog *)a1);
    _RCLog::log((_RCLog *)v9, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "header->eid == RTKOS_endpoint_security", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/common/Controller/RTKitCommHelpers.cpp", 77, 0);
    return 3758096385;
  }
  int v2 = *(_DWORD *)a1 & 0x3FF;
  v3 = _RCLog::getInstance((_RCLog *)a1);
  if (v2 != 1)
  {
    _RCLog::log((_RCLog *)v3, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "header->cmd == RTKOS_boot_nonce", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/common/Controller/RTKitCommHelpers.cpp", 78, 0);
    return 3758096385;
  }
  _RCLog::log((_RCLog *)v3, 1, "Boot Nonce response with status %d", *(unsigned __int16 *)(a1 + 4));
  int v4 = *(unsigned __int16 *)(a1 + 4);
  v6 = _RCLog::getInstance(v5);
  if (v4)
  {
    _RCLog::log((_RCLog *)v6, 16, "Nonce generation failed with status %d", *(unsigned __int16 *)(a1 + 4));
    return 3758097084;
  }
  else
  {
    _RCLog::log((_RCLog *)v6, 2, "Boot Nonce is %lu", *(void *)(a1 + 6));
    return 0;
  }
}

uint64_t RoseSIKDataSession::InitSessionWithID(RoseSIKDataSession *this)
{
  if (!RoseSIKDataSession::_session) {
    operator new();
  }
  std::mutex::unlock(&RoseSIKDataSession::_lock);
  return 0;
}

void sub_3A68(_Unwind_Exception *a1)
{
}

uint64_t RoseSIKDataSession::GetSession(RoseSIKDataSession *this)
{
  std::mutex::lock(&RoseSIKDataSession::_lock);
  uint64_t v1 = RoseSIKDataSession::_session;
  if (RoseSIKDataSession::_session) {
    ++*(unsigned char *)(RoseSIKDataSession::_session + 72);
  }
  std::mutex::unlock(&RoseSIKDataSession::_lock);
  return v1;
}

void RoseSIKDataSession::Release(RoseSIKDataSession *this)
{
  std::mutex::lock(&RoseSIKDataSession::_lock);
  if (RoseSIKDataSession::_session)
  {
    char v2 = *(unsigned char *)(RoseSIKDataSession::_session + 72) - 1;
    *(unsigned char *)(RoseSIKDataSession::_session + 72) = v2;
    if (!v2)
    {
      Instance = _RCLog::getInstance(v1);
      _RCLog::log((_RCLog *)Instance, 1, "deleting SIK blob session");
      uint64_t v4 = RoseSIKDataSession::_session;
      if (*(void *)(RoseSIKDataSession::_session + 24))
      {
        CFWriteStreamClose(*(CFWriteStreamRef *)(RoseSIKDataSession::_session + 24));
        CFRelease(*(CFTypeRef *)(RoseSIKDataSession::_session + 24));
        uint64_t v4 = RoseSIKDataSession::_session;
        *(void *)(RoseSIKDataSession::_session + 24) = 0;
      }
      v5 = *(void **)(v4 + 32);
      if (v5)
      {
        CFAllocatorDeallocate(*(CFAllocatorRef *)(v4 + 64), v5);
        uint64_t v4 = RoseSIKDataSession::_session;
        *(void *)(RoseSIKDataSession::_session + 32) = 0;
      }
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
      RoseSIKDataSession::_session = 0;
    }
  }

  std::mutex::unlock(&RoseSIKDataSession::_lock);
}

void sub_3BAC(_Unwind_Exception *a1)
{
}

uint64_t RoseSIKDataSession::AllocateDataBuffer(RoseSIKDataSession *this, CFAllocatorRef allocator, CFIndex size)
{
  v5 = (char *)this + 32;
  if (*((void *)this + 4))
  {
    Instance = _RCLog::getInstance(this);
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "_buf == __null", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseSIKDataSession.cpp", 73, 0);
    uint64_t v9 = 3758097109;
  }
  else
  {
    *((void *)this + 5) = size;
    v6 = (UInt8 *)CFAllocatorAllocate(allocator, size, 0);
    *((void *)this + 4) = v6;
    if (v6)
    {
      v7 = CFWriteStreamCreateWithBuffer(allocator, v6, *((void *)this + 5));
      *((void *)this + 3) = v7;
      v8 = (_RCLog *)CFWriteStreamOpen(v7);
      if (v8)
      {
        uint64_t v9 = 0;
        *((void *)this + 8) = allocator;
        *((void *)this + 6) = 0;
        return v9;
      }
      uint64_t v9 = 3758097084;
      v13 = _RCLog::getInstance(v8);
      _RCLog::log((_RCLog *)v13, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "ok", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseSIKDataSession.cpp", 82, 0);
    }
    else
    {
      v12 = _RCLog::getInstance(0);
      _RCLog::log((_RCLog *)v12, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "_buf", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseSIKDataSession.cpp", 77, 0);
      uint64_t v9 = 3758097085;
    }
  }
  v14 = (__CFWriteStream *)*((void *)this + 3);
  if (v14)
  {
    CFWriteStreamClose(v14);
    CFRelease(*((CFTypeRef *)this + 3));
    *((void *)this + 3) = 0;
  }
  if (*(void *)v5)
  {
    CFAllocatorDeallocate(allocator, *(void **)v5);
    *(void *)v5 = 0;
    *((void *)v5 + 1) = 0;
  }
  return v9;
}

uint64_t RoseSIKDataSession::AppendData(RoseSIKDataSession *this, unsigned __int8 *a2, CFIndex a3)
{
  Instance = _RCLog::getInstance(this);
  _RCLog::log((_RCLog *)Instance, 1, "append data of size %u to SIK blob", a3);
  v7 = (_RCLog *)*((void *)this + 3);
  if (v7)
  {
    if (*((unsigned char *)this + 56))
    {
      v15 = _RCLog::getInstance(v7);
      _RCLog::log((_RCLog *)v15, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "!_blob_rx_complete", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseSIKDataSession.cpp", 112, 0);
      return 3758097115;
    }
    else
    {
      CFIndex v8 = CFWriteStreamWrite(v7, a2, a3);
      if (v8 == -1)
      {
        uint64_t v12 = 3758097084;
        v16 = _RCLog::getInstance((_RCLog *)0xFFFFFFFFFFFFFFFFLL);
        _RCLog::log((_RCLog *)v16, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "status != -1", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseSIKDataSession.cpp", 114, 0);
      }
      else
      {
        int v9 = v8;
        *((void *)this + 6) += v8;
        v10 = _RCLog::getInstance((_RCLog *)v8);
        int Status = CFWriteStreamGetStatus(*((CFWriteStreamRef *)this + 3));
        _RCLog::log((_RCLog *)v10, 1, "append status %u st %u sz %u wr %u", v9, Status, *((void *)this + 5), *((void *)this + 6));
        if (*((void *)this + 6) == *((void *)this + 5))
        {
          *((unsigned char *)this + 56) = 1;
          dispatch_semaphore_signal(*((dispatch_semaphore_t *)this + 2));
        }
        return 0;
      }
    }
  }
  else
  {
    uint64_t v12 = 3758097084;
    v14 = _RCLog::getInstance(0);
    _RCLog::log((_RCLog *)v14, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "_stream", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseSIKDataSession.cpp", 111, 0);
  }
  return v12;
}

intptr_t RoseSIKDataSession::WaitforData(NSObject **this, int64_t a2)
{
  Instance = _RCLog::getInstance((_RCLog *)this);
  _RCLog::log((_RCLog *)Instance, 1, "wait for SIK data rx completion");
  if (*((unsigned char *)this + 56))
  {
    v10 = _RCLog::getInstance(v5);
    _RCLog::log((_RCLog *)v10, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "!_blob_rx_complete", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseSIKDataSession.cpp", 133, 0);
    return 0;
  }
  else
  {
    v6 = this[2];
    dispatch_time_t v7 = dispatch_time(0, a2);
    intptr_t result = dispatch_semaphore_wait(v6, v7);
    if (result)
    {
      int v9 = _RCLog::getInstance((_RCLog *)result);
      _RCLog::log((_RCLog *)v9, 16, "Rose SIK Blob collection session(%d) timed out (size(%d)/rx(%d))", *((unsigned __int16 *)this + 4), this[5], this[6]);
      return 3758097110;
    }
  }
  return result;
}

uint64_t RoseSIKDataSession::ReadData(RoseSIKDataSession *this, unsigned __int8 *__dst, size_t a3, unint64_t *a4)
{
  if (*((unsigned char *)this + 56))
  {
    if (a4)
    {
      size_t v6 = *((void *)this + 5);
      if (__dst)
      {
        if (v6 > a3)
        {
          Instance = _RCLog::getInstance(this);
          _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "in_size >= _buf_size", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseSIKDataSession.cpp", 155, 0);
          return 3758097115;
        }
        memcpy(__dst, *((const void **)this + 4), v6);
        uint64_t v7 = 0;
        size_t v6 = *((void *)this + 5);
      }
      else
      {
        uint64_t v7 = 0;
      }
      *a4 = v6;
    }
    else
    {
      uint64_t v7 = 3758097090;
      v10 = _RCLog::getInstance(this);
      _RCLog::log((_RCLog *)v10, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "out_size", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseSIKDataSession.cpp", 150, 0);
    }
  }
  else
  {
    int v9 = _RCLog::getInstance(this);
    _RCLog::log((_RCLog *)v9, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "_blob_rx_complete", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseSIKDataSession.cpp", 149, 0);
    return 3758097112;
  }
  return v7;
}

void *_buildRTKitCommsSIKInfoRequest(void *result, __int16 a2)
{
  if (result) {
    *intptr_t result = *(_DWORD *)result & 0xFFF80000 | a2 & 0x3FF | 0x4800;
  }
  return result;
}

uint64_t _processRTKitCommsSIKInfoResponse(unsigned __int16 *a1)
{
  Instance = _RCLog::getInstance((_RCLog *)a1);
  _RCLog::log((_RCLog *)Instance, 1, "SIK response with session id %d status %d", a1[3], a1[2]);
  if (a1[2])
  {
    uint64_t v4 = _RCLog::getInstance(v3);
    _RCLog::log((_RCLog *)v4, 16, "SIK generation for session id %d failed with status %d", a1[3], a1[2]);
    return 0;
  }
  else
  {
    size_t v6 = (RoseSIKDataSession *)a1[3];
    return RoseSIKDataSession::InitSessionWithID(v6);
  }
}

uint64_t _processRTKitCommsSIKInfoEvent(unsigned __int8 *a1, unint64_t a2)
{
  Session = (RoseSIKDataSession *)RoseSIKDataSession::GetSession((RoseSIKDataSession *)a1);
  if (!Session)
  {
    Instance = _RCLog::getInstance(0);
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "session", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseSIKDataSession.cpp", 205, 0);
    return 3758097101;
  }
  v5 = (unsigned __int16 *)Session;
  if ((*(_DWORD *)a1 & 0x10000) != 0)
  {
    if ((*(_DWORD *)a1 & 0x60000) != 0)
    {
      if (a2 <= 4) {
        goto LABEL_27;
      }
      appended = (_RCLog *)RoseSIKDataSession::AppendData(Session, a1 + 4, a2 - 4);
      uint64_t v9 = (uint64_t)appended;
      if (!appended) {
        goto LABEL_18;
      }
      v10 = _RCLog::getInstance(appended);
      if (!mach_error_string(v9)) {
        goto LABEL_34;
      }
    }
    else
    {
      v11 = _RCLog::getInstance(Session);
      _RCLog::log((_RCLog *)v11, 1, "SIK data collection started from session id %u %u sz %u", *((unsigned __int16 *)a1 + 2), v5[4], *((unsigned __int16 *)a1 + 3));
      if (a2 <= 7)
      {
LABEL_27:
        uint64_t v9 = 3758097090;
        v17 = _RCLog::getInstance(Session);
        _RCLog::log((_RCLog *)v17, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", &unk_AF65);
        goto LABEL_18;
      }
      if (*((unsigned __int16 *)a1 + 2) != v5[4])
      {
        v15 = _RCLog::getInstance(Session);
        int v16 = 237;
        goto LABEL_29;
      }
      DataBuffer = (_RCLog *)RoseSIKDataSession::AllocateDataBuffer((RoseSIKDataSession *)v5, 0, *((unsigned __int16 *)a1 + 3));
      if (DataBuffer)
      {
        uint64_t v9 = (uint64_t)DataBuffer;
        v10 = _RCLog::getInstance(DataBuffer);
        if (mach_error_string(v9)) {
          goto LABEL_33;
        }
        goto LABEL_34;
      }
      appended = (_RCLog *)RoseSIKDataSession::AppendData((RoseSIKDataSession *)v5, a1 + 8, a2 - 8);
      uint64_t v9 = (uint64_t)appended;
      if (!appended) {
        goto LABEL_18;
      }
      v10 = _RCLog::getInstance(appended);
      if (!mach_error_string(v9)) {
        goto LABEL_34;
      }
    }
LABEL_33:
    mach_error_string(v9);
    goto LABEL_34;
  }
  size_t v6 = _RCLog::getInstance(Session);
  _RCLog::log((_RCLog *)v6, 1, "SIK data collection for session id %u %u sz %u", *((unsigned __int16 *)a1 + 2), v5[4], *((unsigned __int16 *)a1 + 3));
  if (a2 <= 7) {
    goto LABEL_27;
  }
  if (*((unsigned __int16 *)a1 + 2) != v5[4])
  {
    v15 = _RCLog::getInstance(Session);
    int v16 = 271;
LABEL_29:
    _RCLog::log((_RCLog *)v15, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "sikEvent->start.sessionID == session->GetID()", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseSIKDataSession.cpp", v16, 0);
    uint64_t v9 = 3758096385;
    goto LABEL_18;
  }
  uint64_t v7 = (_RCLog *)RoseSIKDataSession::AllocateDataBuffer((RoseSIKDataSession *)v5, 0, *((unsigned __int16 *)a1 + 3));
  if (v7)
  {
    uint64_t v9 = (uint64_t)v7;
    v10 = _RCLog::getInstance(v7);
    if (mach_error_string(v9)) {
      goto LABEL_33;
    }
LABEL_34:
    _RCLog::log((_RCLog *)v10, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", &unk_AF65);
    goto LABEL_18;
  }
  appended = (_RCLog *)RoseSIKDataSession::AppendData((RoseSIKDataSession *)v5, a1 + 8, a2 - 8);
  uint64_t v9 = (uint64_t)appended;
  if (appended)
  {
    v10 = _RCLog::getInstance(appended);
    if (!mach_error_string(v9)) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_18:
  RoseSIKDataSession::Release(appended);
  return v9;
}

void sub_45C4(uint64_t a1)
{
  sub_45FC(a1);

  operator delete();
}

uint64_t sub_45FC(uint64_t a1)
{
  *(void *)a1 = off_C2F0;
  char v2 = *(__CFWriteStream **)(a1 + 24);
  if (v2) {
    CFWriteStreamClose(v2);
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 16));
  return a1;
}

void sub_4654(void *a1)
{
}

uint64_t sub_4668()
{
  return __cxa_atexit((void (*)(void *))&std::mutex::~mutex, &RoseSIKDataSession::_lock, &dword_0);
}

uint64_t sub_468C(uint64_t a1, CFUUIDBytes a2, void **a3)
{
  return RoseController::QueryInterface(*(RoseController **)(a1 + 8), a2, a3);
}

uint64_t sub_4694(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t result = (*(_DWORD *)(v1 + 976) + 1);
  *(_DWORD *)(v1 + 976) = result;
  return result;
}

uint64_t sub_46A8(uint64_t a1)
{
  return RoseController::Release(*(RoseController **)(a1 + 8));
}

uint64_t sub_46B0()
{
  return 0;
}

uint64_t sub_46B8(uint64_t a1, const __CFDictionary *a2, io_registry_entry_t a3)
{
  return RoseController::Start(*(RoseController **)(a1 + 8), a2, a3);
}

uint64_t sub_46C0(uint64_t a1)
{
  return 0;
}

uint64_t sub_46E0(_RCLog *a1, void (*a2)(void *, os_log_type_t, const char *), void *a3)
{
  Instance = _RCLog::getInstance(a1);
  _RCLog::registerLogSink(Instance, a2, a3);
  return 0;
}

uint64_t sub_4718(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  std::mutex::lock((std::mutex *)(v3 + 760));
  *(void *)(v3 + 752) = a2;
  std::mutex::unlock((std::mutex *)(v3 + 760));
  return 0;
}

uint64_t sub_4760()
{
  return 3758097095;
}

uint64_t sub_476C()
{
  return 3758097095;
}

_RCLog *sub_4778(uint64_t a1, const void *a2, uint64_t a3, const void *a4, uint64_t a5, const void *a6, uint64_t a7)
{
  return RoseController::DownloadCustomFirmwareExten(*(RoseController **)(a1 + 8), a2, a3, a4, a5, a6, a7, 0, 0);
}

uint64_t sub_47A4()
{
  return 3758097095;
}

_RCLog *sub_47B0(uint64_t a1)
{
  return RoseController::Reset(*(RoseController **)(a1 + 8));
}

_RCLog *sub_47B8(uint64_t a1, unsigned __int16 *a2)
{
  return RoseController::GetChipID(*(RoseController **)(a1 + 8), a2);
}

_RCLog *sub_47C0(uint64_t a1, unsigned __int16 *a2)
{
  return RoseController::GetBoardID(*(RoseController **)(a1 + 8), a2);
}

_RCLog *sub_47C8(uint64_t a1, unint64_t *a2)
{
  return RoseController::GetECID(*(RoseController **)(a1 + 8), a2);
}

uint64_t sub_47D0(uint64_t a1)
{
  return RoseController::GenerateBootNonce(*(mach_port_t **)(a1 + 8));
}

_RCLog *sub_47D8(uint64_t a1, void *a2, size_t a3, unint64_t *a4)
{
  return RoseController::GetBootNonceHash(*(RoseController **)(a1 + 8), a2, a3, a4);
}

_RCLog *sub_47E0(uint64_t a1, void *a2, uint64_t a3, unint64_t *a4)
{
  return RoseController::GetBootNonce(*(RoseController **)(a1 + 8), a2, a3, a4);
}

_RCLog *sub_47E8(uint64_t a1, void *a2, size_t a3)
{
  return RoseController::SetHostBootNonce(*(RoseController **)(a1 + 8), a2, a3);
}

_RCLog *sub_47F0(uint64_t a1, void *a2, size_t a3, unint64_t *a4)
{
  return RoseController::GetHostBootNonce(*(RoseController **)(a1 + 8), a2, a3, a4);
}

_RCLog *sub_47F8(uint64_t a1, int a2)
{
  return RoseController::SetBootMode(*(RoseController **)(a1 + 8), a2);
}

_RCLog *sub_4800(uint64_t a1, unsigned int *a2)
{
  return RoseController::GetBootMode(*(RoseController **)(a1 + 8), a2);
}

uint64_t sub_4808(uint64_t a1, __CFDictionary *a2)
{
  return RoseController::GetTime(*(RoseController **)(a1 + 8), a2);
}

uint64_t sub_4810(uint64_t a1, __CFDictionary *a2)
{
  return RoseController::PerformTimeSync(*(RoseController **)(a1 + 8), a2);
}

_RCLog *sub_4818(uint64_t a1, unsigned __int8 *a2)
{
  return RoseController::GetProductionMode(*(RoseController **)(a1 + 8), a2);
}

_RCLog *sub_4820(uint64_t a1, unsigned __int8 *a2)
{
  return RoseController::GetSecureMode(*(RoseController **)(a1 + 8), a2);
}

_RCLog *sub_4828(uint64_t a1, unsigned __int8 *a2)
{
  return RoseController::GetSecurityDomain(*(RoseController **)(a1 + 8), a2);
}

_RCLog *sub_4830(uint64_t a1, unsigned __int8 *a2)
{
  return RoseController::GetMinimumEpoch(*(RoseController **)(a1 + 8), a2);
}

uint64_t sub_4838(uint64_t a1, __CFDictionary *a2)
{
  return RoseController::GetDebugInfo(*(RoseController **)(a1 + 8), a2);
}

uint64_t sub_4840(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4, uint64_t a5, unint64_t *a6)
{
  return RoseController::PerformCommand(*(RoseController **)(a1 + 8), 0, a2, a3, a4, a5, a6, 5000000000);
}

uint64_t sub_486C(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void (*a4)(void *, int, void *, unint64_t), void *a5)
{
  return RoseController::QueueCommand(*(RoseController **)(a1 + 8), 0, a2, a3, a4, a5, 5000000000, 0);
}

uint64_t sub_4898(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t input = 0;
  return IOConnectCallMethod(*(_DWORD *)(v1 + 696), 0xBu, &input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t sub_48E4(uint64_t a1, unsigned __int8 *a2, size_t a3, unint64_t *a4)
{
  return RoseController::_dequeueLogs(*(RoseController **)(a1 + 8), a2, a3, a4);
}

uint64_t sub_48EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t input = 1;
  return IOConnectCallMethod(*(_DWORD *)(v1 + 696), 0xBu, &input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t sub_493C(uint64_t a1, void *a2, mach_vm_size_t a3, size_t *a4)
{
  return RoseController::DequeueCrashLogForCore(*(mach_port_t **)(a1 + 8), 0, 0, a2, a3, a4);
}

uint64_t sub_4958(uint64_t a1, unsigned char *a2)
{
  *a2 = *(_DWORD *)(*(void *)(a1 + 8) + 980);
  return 0;
}

uint64_t sub_496C(uint64_t a1, const __CFAllocator *a2, unsigned __int8 **a3, unint64_t *a4)
{
  return RoseController::_getSIKInfo(*(RoseController **)(a1 + 8), a2, a3, a4, 0);
}

uint64_t sub_4978()
{
  return 3758097095;
}

uint64_t sub_4984(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 8);
  std::mutex::lock((std::mutex *)(v5 + 472));
  *(void *)(v5 + 440) = a2;
  *(void *)(v5 + 448) = a3;
  std::mutex::unlock((std::mutex *)(v5 + 472));
  return 0;
}

uint64_t sub_49D0(uint64_t a1, void (*a2)(void *, void *, unint64_t), void *a3)
{
  return RoseController::RegisterEventHandler(*(RoseController **)(a1 + 8), a2, a3);
}

uint64_t sub_49D8(uint64_t a1, int a2)
{
  return RoseController::TriggerCrashlog(*(RoseController **)(a1 + 8), a2);
}

_RCLog *sub_49E0(uint64_t a1, unsigned __int16 *a2)
{
  return RoseController::GetChipRevision(*(mach_port_t **)(a1 + 8), a2);
}

uint64_t sub_49E8(uint64_t a1, unsigned int a2, char *a3, void *a4, mach_vm_size_t a5, size_t *a6)
{
  return RoseController::DequeueCrashLogForCore(*(mach_port_t **)(a1 + 8), a2, a3, a4, a5, a6);
}

_RCLog *sub_49F0(uint64_t a1, unsigned int a2, void *a3)
{
  return RoseController::GetCoreDumpInfo(*(mach_port_t **)(a1 + 8), a2, a3);
}

uint64_t sub_49F8(uint64_t a1, unsigned int a2, uint64_t a3, size_t a4, unsigned __int8 *a5, unint64_t *a6)
{
  return RoseController::ReadCoredump(*(RoseController **)(a1 + 8), a2, a3, a4, a5, a6);
}

uint64_t sub_4A00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 8);
  std::mutex::lock((std::mutex *)(v5 + 472));
  *(void *)(v5 + 456) = a2;
  *(void *)(v5 + 464) = a3;
  std::mutex::unlock((std::mutex *)(v5 + 472));
  return 0;
}

uint64_t sub_4A4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 8);
  std::mutex::lock((std::mutex *)(v5 + 552));
  *(void *)(v5 + 536) = a2;
  *(void *)(v5 + 544) = a3;
  std::mutex::unlock((std::mutex *)(v5 + 552));
  return 0;
}

uint64_t sub_4A9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 8);
  std::mutex::lock((std::mutex *)(v5 + 632));
  *(void *)(v5 + 616) = a2;
  *(void *)(v5 + 624) = a3;
  std::mutex::unlock((std::mutex *)(v5 + 632));
  return 0;
}

_RCLog *sub_4AEC(uint64_t a1, unsigned int a2)
{
  return RoseController::SetPowerState(*(mach_port_t **)(a1 + 8), a2);
}

uint64_t sub_4AF4(uint64_t a1, char a2, const unsigned __int8 *a3, uint64_t a4, void *a5, uint64_t a6, unint64_t *a7)
{
  return RoseController::PerformCommand(*(RoseController **)(a1 + 8), a2, a3, a4, a5, a6, a7, 5000000000);
}

uint64_t sub_4B08(uint64_t a1, unsigned int a2, int a3)
{
  return RoseController::TriggerCrash(*(mach_port_t **)(a1 + 8), a2, a3);
}

uint64_t sub_4B10(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t input = 0;
  return IOConnectCallMethod(*(_DWORD *)(v1 + 696), 0x12u, &input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t sub_4B5C(uint64_t a1, const __CFAllocator *a2, unsigned __int8 **a3, unint64_t *a4)
{
  return RoseController::_getSIKInfo(*(RoseController **)(a1 + 8), a2, a3, a4, 2);
}

_RCLog *sub_4B68(uint64_t a1, const void *a2, uint64_t a3, const void *a4, uint64_t a5, const void *a6, uint64_t a7, const void *a8, unint64_t a9)
{
  return RoseController::DownloadCustomFirmwareExten(*(RoseController **)(a1 + 8), a2, a3, a4, a5, a6, a7, a8, a9);
}

_RCLog *sub_4B78(uint64_t a1, unsigned int a2)
{
  return RoseController::SetDeepSleepState(*(mach_port_t **)(a1 + 8), a2);
}

uint64_t sub_4B80(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4, uint64_t a5, unint64_t *a6, unsigned int a7)
{
  return RoseController::PerformCommand(*(RoseController **)(a1 + 8), 0, a2, a3, a4, a5, a6, 1000000 * a7);
}

void RoseController::alloc(RoseController *this, const __CFAllocator *a2)
{
  uint64_t v3 = (RoseController *)CFAllocatorAllocate(this, 984, 0);

  RoseController::RoseController(v3, this);
}

void RoseController::operator delete(CFAllocatorRef *ptr)
{
}

void RoseController::RoseController(RoseController *this, const __CFAllocator *a2)
{
  *(void *)this = &RoseController::vtbl_v1;
  *((void *)this + 1) = this;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *((_OWORD *)this + 15) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *((_OWORD *)this + 17) = 0u;
  *((_OWORD *)this + 18) = 0u;
  *((_OWORD *)this + 19) = 0u;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *((_OWORD *)this + 22) = 0u;
  *((void *)this + 46) = 0;
  *((void *)this + 47) = 850045863;
  *((_OWORD *)this + 24) = 0u;
  *((_OWORD *)this + 25) = 0u;
  *((_OWORD *)this + 26) = 0u;
  *((_OWORD *)this + 27) = 0u;
  *((_OWORD *)this + 28) = 0u;
  *((void *)this + 58) = 0;
  *((void *)this + 59) = 850045863;
  *((_OWORD *)this + 30) = 0u;
  *((_OWORD *)this + 31) = 0u;
  *((_OWORD *)this + 32) = 0u;
  *((_OWORD *)this + 33) = 0u;
  *((void *)this + 68) = 0;
  *((void *)this + 69) = 850045863;
  *((_OWORD *)this + 35) = 0u;
  *((_OWORD *)this + 36) = 0u;
  *((_OWORD *)this + 37) = 0u;
  *((_OWORD *)this + 38) = 0u;
  *((void *)this + 78) = 0;
  *((void *)this + 79) = 850045863;
  *((_OWORD *)this + 40) = 0u;
  *((_OWORD *)this + 41) = 0u;
  *((_OWORD *)this + 42) = 0u;
  *((_OWORD *)this + 43) = 0u;
  *(_OWORD *)((char *)this + 700) = 0u;
  *((_OWORD *)this + 45) = 0u;
  *((_OWORD *)this + 46) = 0u;
  *((void *)this + 94) = 0;
  *((void *)this + 95) = 850045863;
  *((_OWORD *)this + 48) = 0u;
  *((_OWORD *)this + 49) = 0u;
  *((_OWORD *)this + 50) = 0u;
  *((void *)this + 102) = 0;
  *((void *)this + 103) = 850045863;
  *((_OWORD *)this + 52) = 0u;
  *((_OWORD *)this + 53) = 0u;
  *((_OWORD *)this + 54) = 0u;
  *((void *)this + 110) = 0;
  *((void *)this + 111) = 1018212795;
  *(_OWORD *)((char *)this + 921) = 0u;
  *((_OWORD *)this + 56) = 0u;
  *((_OWORD *)this + 57) = 0u;
  *((_OWORD *)this + 59) = 0u;
  *((void *)this + 121) = a2;
  *((_DWORD *)this + 244) = 1;
  CFUUIDRef v2 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0xD5u, 2u, 0x79u, 0x78u, 0xFAu, 0x7Au, 0x46u, 0x29u, 0x92u, 0x42u, 0x7Du, 0xFDu, 0x8Eu, 0xD4u, 0x61u, 0x1Du);
  CFPlugInAddInstanceForFactory(v2);
}

void sub_4D94(_Unwind_Exception *a1)
{
  std::condition_variable::~condition_variable(v7);
  std::mutex::~mutex(v6);
  std::mutex::~mutex(v5);
  std::mutex::~mutex(v4);
  std::mutex::~mutex(v3);
  std::mutex::~mutex(v2);
  std::mutex::~mutex(v1);
  _Unwind_Resume(a1);
}

void RoseController::~RoseController(RoseController *this)
{
  CFUUIDRef v2 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0xD5u, 2u, 0x79u, 0x78u, 0xFAu, 0x7Au, 0x46u, 0x29u, 0x92u, 0x42u, 0x7Du, 0xFDu, 0x8Eu, 0xD4u, 0x61u, 0x1Du);
  CFPlugInRemoveInstanceForFactory(v2);
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)this + 888));
  std::mutex::~mutex((std::mutex *)((char *)this + 824));
  std::mutex::~mutex((std::mutex *)((char *)this + 760));
  std::mutex::~mutex((std::mutex *)((char *)this + 632));
  std::mutex::~mutex((std::mutex *)((char *)this + 552));
  std::mutex::~mutex((std::mutex *)((char *)this + 472));
  std::mutex::~mutex((std::mutex *)((char *)this + 376));
}

uint64_t RoseController::QueryInterface(RoseController *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0x10u, 0x3Au, 0xBDu, 0x4Au, 0x60u, 0x94u, 0x4Bu, 0xC0u, 0xAEu, 0xEEu, 0x3Eu, 0x37u, 0xF5u, 0xA2u, 0xFu, 0x3Bu);
  if (CFEqual(v5, v6)
    || (CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu), CFEqual(v5, v7)))
  {
    uint64_t v8 = 0;
    ++*((_DWORD *)this + 244);
  }
  else
  {
    this = 0;
    uint64_t v8 = 2147483652;
  }
  *a3 = this;
  CFRelease(v5);
  return v8;
}

uint64_t RoseController::AddRef(RoseController *this)
{
  uint64_t v1 = (*((_DWORD *)this + 244) + 1);
  *((_DWORD *)this + 244) = v1;
  return v1;
}

uint64_t RoseController::Release(RoseController *this)
{
  int v1 = *((_DWORD *)this + 244);
  uint64_t v2 = (v1 - 1);
  *((_DWORD *)this + 244) = v2;
  if (v1 == 1)
  {
    RoseController::~RoseController(this);
    RoseController::operator delete(v3);
  }
  return v2;
}

uint64_t RoseController::Probe(RoseController *this, const __CFDictionary *a2, unsigned int a3, int *a4)
{
  return 0;
}

uint64_t RoseController::Start(RoseController *this, const __CFDictionary *a2, io_registry_entry_t a3)
{
  *(void *)size = 4;
  if (a3)
  {
    *((_DWORD *)this + 175) = a3;
    Property = (_RCLog *)IORegistryEntryGetProperty(a3, "RoseFirmwareState", (char *)&size[1], size);
    if (Property)
    {
      Instance = _RCLog::getInstance(Property);
      _RCLog::log((_RCLog *)Instance, 16, "unable to query rose f/w state");
    }
    else
    {
      *((_DWORD *)this + 245) = size[1];
    }
    CFUUIDRef v6 = _RCLog::getInstance(Property);
    _RCLog::log((_RCLog *)v6, 1, "rose f/w state set to %d", *((_DWORD *)this + 245));
    CFBooleanRef v7 = (const __CFBoolean *)IORegistryEntrySearchCFProperty(*((_DWORD *)this + 175), "IOService", @"RoseRTKReady", kCFAllocatorDefault, 1u);
    if (v7)
    {
      CFBooleanRef v8 = v7;
      std::mutex::lock((std::mutex *)((char *)this + 824));
      *((unsigned char *)this + 936) = CFBooleanGetValue(v8) != 0;
      std::mutex::unlock((std::mutex *)((char *)this + 824));
    }
    else
    {
      v10 = _RCLog::getInstance(0);
      _RCLog::log((_RCLog *)v10, 1, "unable to query rose boot_done value");
    }
    v11 = _RCLog::getInstance(v9);
    _RCLog::log((_RCLog *)v11, 1, "rose _rtkRead set to %d", *((unsigned __int8 *)this + 936));
    uint64_t v12 = IOServiceOpen(*((_DWORD *)this + 175), mach_task_self_, 0, (io_connect_t *)this + 174);
    if (v12)
    {
      uint64_t v18 = v12;
      v21 = _RCLog::getInstance((_RCLog *)v12);
      if (mach_error_string(v18)) {
        goto LABEL_25;
      }
    }
    else
    {
      IONotificationPortRef v13 = IONotificationPortCreate(kIOMainPortDefault);
      *((void *)this + 90) = v13;
      if (!v13
        || (v14 = dispatch_queue_create("com.apple.RoseController.notificationQueue", 0),
            (*((void *)this + 92) = v14) == 0))
      {
LABEL_23:
        uint64_t v18 = 3758097086;
        v22 = _RCLog::getInstance(0);
        _RCLog::log((_RCLog *)v22, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", &unk_AF65);
        goto LABEL_27;
      }
      IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)this + 90), v14);
      uint64_t v15 = IOServiceAddInterestNotification(*((IONotificationPortRef *)this + 90), *((_DWORD *)this + 175), "IOGeneralInterest", (IOServiceInterestCallback)sub_5450, this, (io_object_t *)this + 240);
      if (!v15)
      {
        dispatch_queue_t v16 = dispatch_queue_create("com.apple.RoseController.commandQueue", 0);
        *((void *)this + 91) = v16;
        if (v16)
        {
          std::mutex::lock((std::mutex *)((char *)this + 376));
          *((void *)this + 17) = RoseController::RTKitCommsCallback;
          *((void *)this + 18) = this;
          *((unsigned char *)this + 152) = 1;
          std::mutex::unlock((std::mutex *)((char *)this + 376));
          v17 = (_RCLog *)RoseController::_registerSharedDataQueueEventHandler(this);
          uint64_t v18 = (uint64_t)v17;
          if (!v17)
          {
            dispatch_retain(*((dispatch_object_t *)this + 93));
            return v18;
          }
          v21 = _RCLog::getInstance(v17);
          if (!mach_error_string(v18)) {
            goto LABEL_26;
          }
          goto LABEL_25;
        }
        goto LABEL_23;
      }
      uint64_t v18 = v15;
      v21 = _RCLog::getInstance((_RCLog *)v15);
      if (mach_error_string(v18)) {
LABEL_25:
      }
        mach_error_string(v18);
    }
LABEL_26:
    _RCLog::log((_RCLog *)v21, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", &unk_AF65);
    goto LABEL_27;
  }
  v20 = _RCLog::getInstance(this);
  _RCLog::log((_RCLog *)v20, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "service", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 208, 0);
  uint64_t v18 = 3758097095;
LABEL_27:
  io_connect_t v23 = *((_DWORD *)this + 174);
  if (v23)
  {
    if (*((void *)this + 90))
    {
      IONotificationPortDestroy(*((IONotificationPortRef *)this + 90));
      io_connect_t v23 = *((_DWORD *)this + 174);
    }
    IOServiceClose(v23);
    *((void *)this + 90) = 0;
    *((_DWORD *)this + 174) = 0;
  }
  v24 = *((void *)this + 92);
  if (v24)
  {
    dispatch_release(v24);
    *((void *)this + 92) = 0;
  }
  v25 = *((void *)this + 91);
  if (v25)
  {
    dispatch_release(v25);
    *((void *)this + 91) = 0;
  }
  return v18;
}

void sub_543C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_5450(RoseController *a1, int a2, int a3, char *a4)
{
}

uint64_t RoseController::_registerEventCallbackForInterface(RoseController *this, unsigned int a2, void (*a3)(void *, void *, unint64_t), void *a4, char a5)
{
  v10 = (std::mutex *)((char *)this + 376);
  std::mutex::lock((std::mutex *)((char *)this + 376));
  if (a2 >= 0xF)
  {
    Instance = _RCLog::getInstance(v11);
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "interface < ROSE_INTERFACE_MAX", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 1165, 0);
    uint64_t v12 = 3758097090;
  }
  else
  {
    uint64_t v12 = 0;
    IONotificationPortRef v13 = (char *)this + 24 * a2;
    *((void *)v13 + 2) = a3;
    *((void *)v13 + 3) = a4;
    v13[32] = a5;
  }
  std::mutex::unlock(v10);
  return v12;
}

void sub_5528(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void RoseController::RTKitCommsCallback(RoseController *this, RoseController *a2, unint64_t a3)
{
  Instance = _RCLog::getInstance(this);
  if (a3 <= 4)
  {
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", &unk_AF65);
  }
  else
  {
    _RCLog::log((_RCLog *)Instance, 1, "eid:%d, mt:%d, mp:%d, mpt:%d, size %d", (*(_DWORD *)a2 >> 10) & 0xF, (unsigned __int16)*(_DWORD *)a2 >> 14, HIWORD(*(_DWORD *)a2) & 1, (*(_DWORD *)a2 >> 17) & 3, a3);
    if ((*(_DWORD *)a2 & 0x3C00) == 0x800)
    {
      CFBooleanRef v8 = RoseController::_handleSecurityEvents(a2, a3);
      if (!v8) {
        return;
      }
      mach_error_t v9 = (int)v8;
      v10 = _RCLog::getInstance(v8);
      if (mach_error_string(v9)) {
        mach_error_string(v9);
      }
      _RCLog::log((_RCLog *)v10, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", &unk_AF65);
    }
    else
    {
      v11 = _RCLog::getInstance(v7);
      _RCLog::log((_RCLog *)v11, 16, "unhandled endpoint %d on RTKOS comms interface");
    }
  }
  if (this)
  {
    RoseController::_callErrorCallback(this, 10, a2, a3);
  }
}

uint64_t RoseController::_registerSharedDataQueueEventHandler(RoseController *this)
{
  mach_vm_size_t ofSize = 0;
  NotificationPort = (_RCLog *)IODataQueueAllocateNotificationPort();
  *((_DWORD *)this + 178) = NotificationPort;
  if (!NotificationPort)
  {
    uint64_t v8 = 3758097086;
    Instance = _RCLog::getInstance(NotificationPort);
LABEL_16:
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", &unk_AF65);
LABEL_18:
    RoseController::_deRegisterSharedDataQueueEventHandler((dispatch_group_t *)this);
    return v8;
  }
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.RoseController.reportQueue", 0);
  *((void *)this + 93) = v3;
  if (!v3)
  {
    uint64_t v8 = 3758097086;
    Instance = _RCLog::getInstance(0);
    goto LABEL_16;
  }
  uint64_t v4 = IOConnectSetNotificationPort(*((_DWORD *)this + 174), 0, *((_DWORD *)this + 178), 0);
  if (v4)
  {
    uint64_t v8 = v4;
    v11 = _RCLog::getInstance((_RCLog *)v4);
    if (mach_error_string(v8)) {
      mach_error_string(v8);
    }
    goto LABEL_17;
  }
  uint64_t v5 = IOConnectMapMemory(*((_DWORD *)this + 174), 0, mach_task_self_, (mach_vm_address_t *)this + 88, &ofSize, 1u);
  if (v5)
  {
    uint64_t v8 = v5;
    v11 = _RCLog::getInstance((_RCLog *)v5);
    if (mach_error_string(v8)) {
      mach_error_string(v8);
    }
LABEL_17:
    _RCLog::log((_RCLog *)v11, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", &unk_AF65);
    goto LABEL_18;
  }
  dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, *((unsigned int *)this + 178), 0, *((dispatch_queue_t *)this + 93));
  *((void *)this + 118) = v6;
  if (!v6 || (dispatch_group_t v7 = dispatch_group_create(), (*((void *)this + 119) = v7) == 0))
  {
    uint64_t v8 = 3758097086;
    Instance = _RCLog::getInstance(0);
    goto LABEL_16;
  }
  ++*((_DWORD *)this + 244);
  dispatch_set_context(*((dispatch_object_t *)this + 118), this);
  dispatch_source_set_event_handler_f(*((dispatch_source_t *)this + 118), (dispatch_function_t)RoseController::QueueEventSourceCallback);
  dispatch_source_set_cancel_handler_f(*((dispatch_source_t *)this + 118), (dispatch_function_t)RoseController::QueueEventSourceCancelHandler);
  dispatch_resume(*((dispatch_object_t *)this + 118));
  return 0;
}

uint64_t RoseController::Stop(dispatch_object_t *this)
{
  dispatch_release(this[93]);
  RoseController::_deRegisterSharedDataQueueEventHandler(this);
  uint64_t v2 = this[92];
  if (v2)
  {
    dispatch_release(v2);
    this[92] = 0;
  }
  dispatch_queue_t v3 = this[91];
  if (v3)
  {
    dispatch_release(v3);
    this[91] = 0;
  }
  return 0;
}

void RoseController::_deRegisterSharedDataQueueEventHandler(dispatch_group_t *this)
{
  if (this[118])
  {
    dispatch_group_enter(this[119]);
    dispatch_source_cancel(this[118]);
    dispatch_group_wait(this[119], 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(this[118]);
    this[118] = 0;
  }
}

uint64_t RoseController::SetDispatchQueue(RoseController *this, dispatch_queue_s *a2)
{
  uint64_t v4 = (std::mutex *)((char *)this + 760);
  std::mutex::lock((std::mutex *)((char *)this + 760));
  *((void *)this + 94) = a2;
  std::mutex::unlock(v4);
  return 0;
}

uint64_t RoseController::SetLogSink(RoseController *this, void (*a2)(void *, os_log_type_t, const char *), void *a3)
{
  Instance = _RCLog::getInstance(this);
  _RCLog::registerLogSink(Instance, a2, a3);
  return 0;
}

uint64_t RoseController::DownloadFirmware(RoseController *this)
{
  return 3758097095;
}

uint64_t RoseController::DownloadFirmwareAsync(RoseController *this, void (*a2)(void *, int), void *a3)
{
  return 3758097095;
}

_RCLog *RoseController::DownloadCustomFirmware(RoseController *this, const void *a2, uint64_t a3, const void *a4, uint64_t a5, const void *a6, uint64_t a7)
{
  return RoseController::DownloadCustomFirmwareExten(this, a2, a3, a4, a5, a6, a7, 0, 0);
}

_RCLog *RoseController::DownloadCustomFirmwareExten(RoseController *this, const void *a2, uint64_t a3, const void *a4, uint64_t a5, const void *a6, uint64_t a7, const void *a8, unint64_t a9)
{
  inputStruct[0] = a2;
  inputStruct[1] = a3;
  inputStruct[2] = a4;
  inputStruct[3] = a5;
  inputStruct[4] = a6;
  inputStruct[5] = a7;
  inputStruct[6] = a8;
  inputStruct[7] = a9;
  mach_error_t v9 = (_RCLog *)IOConnectCallStructMethod(*((_DWORD *)this + 174), 0, inputStruct, 0x40uLL, 0, 0);
  v10 = v9;
  if (v9)
  {
    Instance = _RCLog::getInstance(v9);
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 362, v10);
  }
  return v10;
}

uint64_t RoseController::DownloadCustomFirmwareAsync(RoseController *this, const void *a2, unint64_t a3, const void *a4, unint64_t a5, const void *a6, unint64_t a7, void (*a8)(void *, int), void *a9)
{
  return 3758097095;
}

_RCLog *RoseController::Reset(RoseController *this)
{
  uint64_t v8 = (std::mutex *)((char *)this + 824);
  char v9 = 1;
  std::mutex::lock((std::mutex *)((char *)this + 824));
  uint64_t v2 = (_RCLog *)IOConnectCallStructMethod(*((_DWORD *)this + 174), 2u, 0, 0, 0, 0);
  dispatch_queue_t v3 = v2;
  if (v2)
  {
    Instance = _RCLog::getInstance(v2);
    if (mach_error_string((mach_error_t)v3)) {
      dispatch_group_t v7 = mach_error_string((mach_error_t)v3);
    }
    else {
      dispatch_group_t v7 = (char *)&unk_AF65;
    }
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v7, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 389, v3);
    goto LABEL_3;
  }
  *((unsigned char *)this + 936) = 0;
  *((_DWORD *)this + 245) = 0;
  sub_5CF8((uint64_t)&v8);
  uint64_t v4 = *((void *)this + 93);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_A248;
  block[3] = &unk_C450;
  block[4] = this;
  dispatch_sync(v4, block);
  if (v9) {
LABEL_3:
  }
    std::mutex::unlock(v8);
  return v3;
}

void sub_5CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::mutex *a16, char a17)
{
}

void sub_5CF8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    std::mutex::unlock(*(std::mutex **)a1);
    *(unsigned char *)(a1 + 8) = 0;
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::unlock: not locked");
    RoseController::_flushResponseQueue(v2);
  }
}

void RoseController::_flushResponseQueue(RoseController *this)
{
  int v1 = *((void *)this + 93);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_A248;
  block[3] = &unk_C450;
  block[4] = this;
  dispatch_sync(v1, block);
}

uint64_t RoseController::TriggerCrashlog(RoseController *this, int a2)
{
  Instance = _RCLog::getInstance(this);
  uint64_t v5 = "non-fatal";
  if (a2)
  {
    uint64_t v5 = "fatal";
    unsigned int v6 = 2;
  }
  else
  {
    unsigned int v6 = 1;
  }
  _RCLog::log((_RCLog *)Instance, 1, "triggering %s rose crashlog", v5);

  return RoseController::TriggerCrash((mach_port_t *)this, v6, 0);
}

uint64_t RoseController::TriggerCrash(mach_port_t *this, unsigned int a2, int a3)
{
  if (a2 >= 3)
  {
    uint64_t v8 = 3758097090;
    Instance = _RCLog::getInstance((_RCLog *)this);
    goto LABEL_15;
  }
  if (a2 == 2)
  {
    Instance = _RCLog::getInstance((_RCLog *)this);
    if (!a3)
    {
      _RCLog::log((_RCLog *)Instance, 1, "triggering rose NMI crash");
      uint64_t v7 = IOConnectCallStructMethod(this[174], 0xDu, 0, 0, 0, 0);
      uint64_t v8 = v7;
      if (v7)
      {
        char v9 = _RCLog::getInstance((_RCLog *)v7);
        if (mach_error_string(v8)) {
          mach_error_string(v8);
        }
LABEL_18:
        _RCLog::log((_RCLog *)v9, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", &unk_AF65);
        return v8;
      }
      return v8;
    }
    uint64_t v8 = 3758097090;
LABEL_15:
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", &unk_AF65);
    return v8;
  }
  unint64_t v17 = 0;
  v10 = _RCLog::getInstance((_RCLog *)this);
  char v11 = a2 == 0;
  uint64_t v12 = "non-fatal";
  if (v11) {
    uint64_t v12 = "fatal";
  }
  _RCLog::log((_RCLog *)v10, 1, "triggering %s rose crashlog with delay %u", v12, a3);
  _buildRTKitCommsCrashRequest((uint64_t)v19, v11, a3);
  IONotificationPortRef v13 = (_RCLog *)RoseController::PerformCommand((RoseController *)this, 5, v19, 9, v18, 5, &v17, 5000000000);
  if (v13)
  {
    uint64_t v8 = (uint64_t)v13;
    char v9 = _RCLog::getInstance(v13);
    if (mach_error_string(v8)) {
      mach_error_string(v8);
    }
    goto LABEL_18;
  }
  v14 = (_RCLog *)_processRTKitCommsCrashlogResponse(v18);
  uint64_t v8 = (uint64_t)v14;
  if (v14)
  {
    dispatch_queue_t v16 = _RCLog::getInstance(v14);
    _RCLog::log((_RCLog *)v16, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 1738, v8);
    return 3758097084;
  }
  return v8;
}

_RCLog *RoseController::GetChipID(RoseController *this, unsigned __int16 *a2)
{
  uint64_t input = 209;
  uint32_t outputCnt = 0;
  size_t v8 = 8;
  dispatch_queue_t v3 = (_RCLog *)IOConnectCallMethod(*((_DWORD *)this + 174), 8u, &input, 1u, 0, 0, 0, &outputCnt, &outputStruct, &v8);
  uint64_t v4 = v3;
  if (v3)
  {
    Instance = _RCLog::getInstance(v3);
    if (mach_error_string((mach_error_t)v4)) {
      uint64_t v7 = mach_error_string((mach_error_t)v4);
    }
    else {
      uint64_t v7 = (char *)&unk_AF65;
    }
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v7, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 429, v4);
  }
  else
  {
    *a2 = outputStruct;
  }
  return v4;
}

_RCLog *RoseController::GetBoardID(RoseController *this, unsigned __int16 *a2)
{
  uint64_t input = 208;
  uint32_t outputCnt = 0;
  size_t v8 = 8;
  dispatch_queue_t v3 = (_RCLog *)IOConnectCallMethod(*((_DWORD *)this + 174), 8u, &input, 1u, 0, 0, 0, &outputCnt, &outputStruct, &v8);
  uint64_t v4 = v3;
  if (v3)
  {
    Instance = _RCLog::getInstance(v3);
    if (mach_error_string((mach_error_t)v4)) {
      uint64_t v7 = mach_error_string((mach_error_t)v4);
    }
    else {
      uint64_t v7 = (char *)&unk_AF65;
    }
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v7, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 445, v4);
  }
  else
  {
    *a2 = outputStruct;
  }
  return v4;
}

_RCLog *RoseController::GetECID(RoseController *this, unint64_t *a2)
{
  uint64_t input = 210;
  uint32_t outputCnt = 0;
  size_t v8 = 8;
  dispatch_queue_t v3 = (_RCLog *)IOConnectCallMethod(*((_DWORD *)this + 174), 8u, &input, 1u, 0, 0, 0, &outputCnt, &outputStruct, &v8);
  uint64_t v4 = v3;
  if (v3)
  {
    Instance = _RCLog::getInstance(v3);
    if (mach_error_string((mach_error_t)v4)) {
      uint64_t v7 = mach_error_string((mach_error_t)v4);
    }
    else {
      uint64_t v7 = (char *)&unk_AF65;
    }
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v7, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 461, v4);
  }
  else
  {
    *a2 = outputStruct;
  }
  return v4;
}

uint64_t RoseController::GenerateBootNonce(mach_port_t *this)
{
  Instance = _RCLog::getInstance((_RCLog *)this);
  _RCLog::log((_RCLog *)Instance, 2, "rose hw state is %d", this[245]);
  mach_port_t v4 = this[245];
  if (v4 != 1)
  {
    if (!v4)
    {
      LODWORD(outputCnt) = 0;
      v18[0] = 0;
      uint64_t v5 = (_RCLog *)IOConnectCallMethod(this[174], 0x13u, 0, 0, 0, 0, 0, (uint32_t *)&outputCnt, 0, v18);
      unsigned int v6 = v5;
      if (v5)
      {
        uint64_t v7 = _RCLog::getInstance(v5);
        if (mach_error_string((mach_error_t)v6)) {
          size_t v8 = mach_error_string((mach_error_t)v6);
        }
        else {
          size_t v8 = (char *)&unk_AF65;
        }
        _RCLog::log((_RCLog *)v7, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v8, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 480, v6);
      }
      return (uint64_t)v6;
    }
    return 3758096385;
  }
  unint64_t v17 = 0;
  char v9 = _RCLog::getInstance(v3);
  _RCLog::log((_RCLog *)v9, 1, "sending boot nonce command to firmware");
  _buildRTKitCommsBootNonceRequest(&outputCnt);
  v10 = (_RCLog *)RoseController::PerformCommand((RoseController *)this, 5, (const unsigned __int8 *)&outputCnt, 8, v18, 14, &v17, 20000000000);
  if (v10)
  {
    unsigned int v6 = v10;
    IONotificationPortRef v13 = _RCLog::getInstance(v10);
    if (mach_error_string((mach_error_t)v6)) {
      v14 = mach_error_string((mach_error_t)v6);
    }
    else {
      v14 = (char *)&unk_AF65;
    }
    _RCLog::log((_RCLog *)v13, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v14, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 495, v6);
    return (uint64_t)v6;
  }
  if (v17 != 14)
  {
    uint64_t v15 = _RCLog::getInstance(v10);
    _RCLog::log((_RCLog *)v15, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "out_size == sizeof(response)", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 496, 0);
    return 3758096385;
  }
  char v11 = (_RCLog *)_processRTKitCommsBootNonceResponse((uint64_t)v18);
  unsigned int v6 = v11;
  if (v11)
  {
    uint64_t v12 = _RCLog::getInstance(v11);
    _RCLog::log((_RCLog *)v12, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 499, v6);
    return 3758097084;
  }
  return (uint64_t)v6;
}

uint64_t RoseController::PerformCommand(RoseController *this, char a2, const unsigned __int8 *a3, uint64_t a4, void *a5, uint64_t a6, unint64_t *a7, uint64_t a8)
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2000000000;
  int v16 = 0;
  size_t v8 = *((void *)this + 91);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_7A20;
  block[3] = &unk_C318;
  char v12 = a2;
  block[4] = &v13;
  void block[5] = this;
  block[6] = a8;
  block[7] = a3;
  block[8] = a4;
  block[9] = a6;
  block[10] = a5;
  block[11] = a7;
  dispatch_sync(v8, block);
  uint64_t v9 = *((unsigned int *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v9;
}

_RCLog *RoseController::GetBootNonceHash(RoseController *this, void *outputStruct, size_t a3, unint64_t *a4)
{
  uint64_t input = 211;
  uint32_t outputCnt = 0;
  size_t v10 = a3;
  uint64_t v5 = (_RCLog *)IOConnectCallMethod(*((_DWORD *)this + 174), 8u, &input, 1u, 0, 0, 0, &outputCnt, outputStruct, &v10);
  unsigned int v6 = v5;
  if (v5)
  {
    Instance = _RCLog::getInstance(v5);
    if (mach_error_string((mach_error_t)v6)) {
      uint64_t v9 = mach_error_string((mach_error_t)v6);
    }
    else {
      uint64_t v9 = (char *)&unk_AF65;
    }
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v9, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 515, v6);
  }
  else
  {
    *a4 = v10;
  }
  return v6;
}

_RCLog *RoseController::GetBootNonce(RoseController *this, void *a2, uint64_t a3, unint64_t *a4)
{
  uint64_t input = 229;
  uint32_t outputCnt = 0;
  uint64_t outputStruct = 0;
  size_t v23 = 8;
  size_t v8 = (_RCLog *)IOConnectCallMethod(*((_DWORD *)this + 174), 8u, &input, 1u, 0, 0, 0, &outputCnt, &outputStruct, &v23);
  if (v8)
  {
    size_t v10 = v8;
    Instance = _RCLog::getInstance(v8);
    if (mach_error_string((mach_error_t)v10)) {
      v14 = mach_error_string((mach_error_t)v10);
    }
    else {
      v14 = (char *)&unk_AF65;
    }
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v14, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 533, v10);
  }
  else if ((outputStruct & 2) != 0)
  {
    uint64_t v22 = 220;
    uint32_t v21 = 0;
    size_t v20 = a3;
    char v11 = (_RCLog *)IOConnectCallMethod(*((_DWORD *)this + 174), 8u, &v22, 1u, 0, 0, 0, &v21, a2, &v20);
    size_t v10 = v11;
    if (v11)
    {
      uint64_t v18 = _RCLog::getInstance(v11);
      if (mach_error_string((mach_error_t)v10)) {
        v19 = mach_error_string((mach_error_t)v10);
      }
      else {
        v19 = (char *)&unk_AF65;
      }
      _RCLog::log((_RCLog *)v18, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v19, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 541, v10);
    }
    else
    {
      *a4 = v20;
    }
  }
  else
  {
    LODWORD(v22) = 1;
    uint64_t v9 = (_RCLog *)RoseController::PerformCommand(this, 4, (const unsigned __int8 *)&v22, 4, a2, a3, a4, 5000000000);
    if (v9)
    {
      mach_error_t v15 = (int)v9;
      int v16 = _RCLog::getInstance(v9);
      if (mach_error_string(v15)) {
        unint64_t v17 = mach_error_string(v15);
      }
      else {
        unint64_t v17 = (char *)&unk_AF65;
      }
      _RCLog::log((_RCLog *)v16, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v17, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 551, v15);
    }
    return 0;
  }
  return v10;
}

uint64_t RoseController::GetDebugInfo(RoseController *this, __CFDictionary *a2)
{
  size_t v23 = 3;
  uint64_t input = 218;
  uint64_t output = 57005;
  uint32_t outputCnt = 1;
  if (!a2)
  {
    Instance = _RCLog::getInstance(this);
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "info", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 569, 0);
    return 3758097090;
  }
  uint64_t v4 = IOConnectCallMethod(*((_DWORD *)this + 174), 8u, &input, 1u, 0, 0, 0, 0, valuePtr, &v23);
  if (v4)
  {
    uint64_t v12 = v4;
    mach_error_t v15 = _RCLog::getInstance((_RCLog *)v4);
    _RCLog::log((_RCLog *)v15, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 572, v12);
    return v12;
  }
  CFNumberRef v5 = CFNumberCreate(*((CFAllocatorRef *)this + 121), kCFNumberShortType, valuePtr);
  if (!v5)
  {
    uint64_t v12 = 3758097115;
    int v16 = _RCLog::getInstance(0);
    int v17 = 575;
LABEL_16:
    _RCLog::log((_RCLog *)v16, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "intProperty", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", v17, 0);
    return v12;
  }
  CFNumberRef v6 = v5;
  CFDictionaryAddValue(a2, @"SecureROMStatus", v5);
  CFRelease(v6);
  CFNumberRef v7 = CFNumberCreate(*((CFAllocatorRef *)this + 121), kCFNumberCharType, &v25);
  if (!v7)
  {
    uint64_t v12 = 3758097115;
    int v16 = _RCLog::getInstance(0);
    int v17 = 580;
    goto LABEL_16;
  }
  CFNumberRef v8 = v7;
  CFDictionaryAddValue(a2, @"RoseServiceState", v7);
  CFRelease(v8);
  size_t v23 = 0;
  uint64_t v9 = (_RCLog *)IOConnectCallMethod(*((_DWORD *)this + 174), 0x11u, 0, 0, 0, 0, &output, &outputCnt, 0, &v23);
  if (v9)
  {
    int v18 = (int)v9;
    v19 = _RCLog::getInstance(v9);
    _RCLog::log((_RCLog *)v19, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 586, v18);
    return 0;
  }
  CFNumberRef v10 = CFNumberCreate(*((CFAllocatorRef *)this + 121), kCFNumberIntType, &output);
  if (!v10)
  {
    uint64_t v12 = 3758097115;
    int v16 = _RCLog::getInstance(0);
    int v17 = 589;
    goto LABEL_16;
  }
  CFNumberRef v11 = v10;
  CFDictionaryAddValue(a2, @"RosePowerState", v10);
  CFRelease(v11);
  return 0;
}

_RCLog *RoseController::SetHostBootNonce(RoseController *this, void *inputStruct, size_t inputStructCnt)
{
  uint64_t input = 213;
  dispatch_queue_t v3 = (_RCLog *)IOConnectCallMethod(*((_DWORD *)this + 174), 9u, &input, 1u, inputStruct, inputStructCnt, 0, 0, 0, 0);
  uint64_t v4 = v3;
  if (v3)
  {
    Instance = _RCLog::getInstance(v3);
    if (mach_error_string((mach_error_t)v4)) {
      CFNumberRef v7 = mach_error_string((mach_error_t)v4);
    }
    else {
      CFNumberRef v7 = (char *)&unk_AF65;
    }
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v7, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 604, v4);
  }
  return v4;
}

_RCLog *RoseController::GetHostBootNonce(RoseController *this, void *outputStruct, size_t a3, unint64_t *a4)
{
  uint64_t input = 213;
  uint32_t outputCnt = 0;
  size_t v10 = a3;
  CFNumberRef v5 = (_RCLog *)IOConnectCallMethod(*((_DWORD *)this + 174), 8u, &input, 1u, 0, 0, 0, &outputCnt, outputStruct, &v10);
  CFNumberRef v6 = v5;
  if (v5)
  {
    Instance = _RCLog::getInstance(v5);
    if (mach_error_string((mach_error_t)v6)) {
      uint64_t v9 = mach_error_string((mach_error_t)v6);
    }
    else {
      uint64_t v9 = (char *)&unk_AF65;
    }
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v9, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 619, v6);
  }
  else
  {
    *a4 = v10;
  }
  return v6;
}

_RCLog *RoseController::SetBootMode(RoseController *this, int a2)
{
  int inputStruct = a2;
  uint64_t input = 212;
  uint64_t v2 = (_RCLog *)IOConnectCallMethod(*((_DWORD *)this + 174), 9u, &input, 1u, &inputStruct, 4uLL, 0, 0, 0, 0);
  dispatch_queue_t v3 = v2;
  if (v2)
  {
    Instance = _RCLog::getInstance(v2);
    if (mach_error_string((mach_error_t)v3)) {
      CFNumberRef v6 = mach_error_string((mach_error_t)v3);
    }
    else {
      CFNumberRef v6 = (char *)&unk_AF65;
    }
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v6, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 633, v3);
  }
  return v3;
}

_RCLog *RoseController::GetBootMode(RoseController *this, unsigned int *a2)
{
  uint64_t input = 212;
  uint32_t outputCnt = 0;
  size_t v8 = 8;
  dispatch_queue_t v3 = (_RCLog *)IOConnectCallMethod(*((_DWORD *)this + 174), 8u, &input, 1u, 0, 0, 0, &outputCnt, &outputStruct, &v8);
  uint64_t v4 = v3;
  if (v3)
  {
    Instance = _RCLog::getInstance(v3);
    if (mach_error_string((mach_error_t)v4)) {
      CFNumberRef v7 = mach_error_string((mach_error_t)v4);
    }
    else {
      CFNumberRef v7 = (char *)&unk_AF65;
    }
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v7, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 648, v4);
  }
  else
  {
    *a2 = outputStruct;
  }
  return v4;
}

uint64_t RoseController::GetTime(RoseController *this, __CFDictionary *a2)
{
  size_t v15 = 0;
  uint32_t outputCnt = 2;
  if (a2)
  {
    uint64_t v4 = IOConnectCallMethod(*((_DWORD *)this + 174), 7u, 0, 0, 0, 0, &output, &outputCnt, 0, &v15);
    if (v4)
    {
      uint64_t v9 = v4;
      Instance = _RCLog::getInstance((_RCLog *)v4);
      if (mach_error_string(v9)) {
        mach_error_string(v9);
      }
      _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", &unk_AF65);
    }
    else
    {
      CFNumberRef v5 = CFNumberCreate(*((CFAllocatorRef *)this + 121), kCFNumberLongLongType, &output);
      if (v5
        && (CFNumberRef v6 = v5,
            CFDictionaryAddValue(a2, @"continuous_time", v5),
            CFRelease(v6),
            (CFNumberRef v7 = CFNumberCreate(*((CFAllocatorRef *)this + 121), kCFNumberLongLongType, &v17)) != 0))
      {
        CFNumberRef v8 = v7;
        CFDictionaryAddValue(a2, @"rose_time", v7);
        CFRelease(v8);
        return 0;
      }
      else
      {
        uint64_t v9 = 3758097115;
        uint64_t v13 = _RCLog::getInstance(0);
        _RCLog::log((_RCLog *)v13, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", &unk_AF65);
      }
    }
  }
  else
  {
    CFNumberRef v11 = _RCLog::getInstance(this);
    _RCLog::log((_RCLog *)v11, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "time_dictionary", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 664, 0);
    return 3758097090;
  }
  return v9;
}

uint64_t RoseController::PerformTimeSync(RoseController *this, __CFDictionary *a2)
{
  size_t v15 = 0;
  uint32_t outputCnt = 2;
  if (a2)
  {
    uint64_t v4 = IOConnectCallMethod(*((_DWORD *)this + 174), 6u, 0, 0, 0, 0, &output, &outputCnt, 0, &v15);
    if (v4)
    {
      uint64_t v9 = v4;
      Instance = _RCLog::getInstance((_RCLog *)v4);
      if (mach_error_string(v9)) {
        mach_error_string(v9);
      }
      _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", &unk_AF65);
    }
    else
    {
      CFNumberRef v5 = CFNumberCreate(*((CFAllocatorRef *)this + 121), kCFNumberLongLongType, &output);
      if (v5
        && (CFNumberRef v6 = v5,
            CFDictionaryAddValue(a2, @"continuous_time", v5),
            CFRelease(v6),
            (CFNumberRef v7 = CFNumberCreate(*((CFAllocatorRef *)this + 121), kCFNumberLongLongType, &v17)) != 0))
      {
        CFNumberRef v8 = v7;
        CFDictionaryAddValue(a2, @"rose_time", v7);
        CFRelease(v8);
        return 0;
      }
      else
      {
        uint64_t v9 = 3758097115;
        uint64_t v13 = _RCLog::getInstance(0);
        _RCLog::log((_RCLog *)v13, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", &unk_AF65);
      }
    }
  }
  else
  {
    CFNumberRef v11 = _RCLog::getInstance(this);
    _RCLog::log((_RCLog *)v11, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "time_dictionary", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 692, 0);
    return 3758097090;
  }
  return v9;
}

_RCLog *RoseController::GetProductionMode(RoseController *this, unsigned __int8 *a2)
{
  uint64_t input = 214;
  uint32_t outputCnt = 0;
  size_t v8 = 8;
  dispatch_queue_t v3 = (_RCLog *)IOConnectCallMethod(*((_DWORD *)this + 174), 8u, &input, 1u, 0, 0, 0, &outputCnt, &outputStruct, &v8);
  uint64_t v4 = v3;
  if (v3)
  {
    Instance = _RCLog::getInstance(v3);
    if (mach_error_string((mach_error_t)v4)) {
      CFNumberRef v7 = mach_error_string((mach_error_t)v4);
    }
    else {
      CFNumberRef v7 = (char *)&unk_AF65;
    }
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v7, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 720, v4);
  }
  else
  {
    *a2 = outputStruct;
  }
  return v4;
}

_RCLog *RoseController::GetSecureMode(RoseController *this, unsigned __int8 *a2)
{
  uint64_t input = 215;
  uint32_t outputCnt = 0;
  size_t v8 = 8;
  dispatch_queue_t v3 = (_RCLog *)IOConnectCallMethod(*((_DWORD *)this + 174), 8u, &input, 1u, 0, 0, 0, &outputCnt, &outputStruct, &v8);
  uint64_t v4 = v3;
  if (v3)
  {
    Instance = _RCLog::getInstance(v3);
    if (mach_error_string((mach_error_t)v4)) {
      CFNumberRef v7 = mach_error_string((mach_error_t)v4);
    }
    else {
      CFNumberRef v7 = (char *)&unk_AF65;
    }
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v7, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 736, v4);
  }
  else
  {
    *a2 = outputStruct;
  }
  return v4;
}

_RCLog *RoseController::GetSecurityDomain(RoseController *this, unsigned __int8 *a2)
{
  uint64_t input = 216;
  uint32_t outputCnt = 0;
  size_t v8 = 8;
  dispatch_queue_t v3 = (_RCLog *)IOConnectCallMethod(*((_DWORD *)this + 174), 8u, &input, 1u, 0, 0, 0, &outputCnt, &outputStruct, &v8);
  uint64_t v4 = v3;
  if (v3)
  {
    Instance = _RCLog::getInstance(v3);
    if (mach_error_string((mach_error_t)v4)) {
      CFNumberRef v7 = mach_error_string((mach_error_t)v4);
    }
    else {
      CFNumberRef v7 = (char *)&unk_AF65;
    }
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v7, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 753, v4);
  }
  else
  {
    *a2 = outputStruct;
  }
  return v4;
}

_RCLog *RoseController::GetMinimumEpoch(RoseController *this, unsigned __int8 *a2)
{
  uint64_t input = 217;
  uint32_t outputCnt = 0;
  size_t v8 = 8;
  dispatch_queue_t v3 = (_RCLog *)IOConnectCallMethod(*((_DWORD *)this + 174), 8u, &input, 1u, 0, 0, 0, &outputCnt, &outputStruct, &v8);
  uint64_t v4 = v3;
  if (v3)
  {
    Instance = _RCLog::getInstance(v3);
    if (mach_error_string((mach_error_t)v4)) {
      CFNumberRef v7 = mach_error_string((mach_error_t)v4);
    }
    else {
      CFNumberRef v7 = (char *)&unk_AF65;
    }
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v7, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 769, v4);
  }
  else
  {
    *a2 = outputStruct;
  }
  return v4;
}

_RCLog *RoseController::GetChipRevision(mach_port_t *this, unsigned __int16 *a2)
{
  uint64_t input = 219;
  uint32_t outputCnt = 0;
  size_t v10 = 8;
  Instance = _RCLog::getInstance((_RCLog *)this);
  _RCLog::log((_RCLog *)Instance, 1, "calling getchiprev");
  CFNumberRef v5 = (_RCLog *)IOConnectCallMethod(this[174], 8u, &input, 1u, 0, 0, 0, &outputCnt, &outputStruct, &v10);
  CFNumberRef v6 = v5;
  if (v5)
  {
    size_t v8 = _RCLog::getInstance(v5);
    if (mach_error_string((mach_error_t)v6)) {
      uint64_t v9 = mach_error_string((mach_error_t)v6);
    }
    else {
      uint64_t v9 = (char *)&unk_AF65;
    }
    _RCLog::log((_RCLog *)v8, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v9, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 786, v6);
  }
  else
  {
    *a2 = outputStruct;
  }
  return v6;
}

void sub_7A20(uint64_t a1)
{
  uint32_t outputCnt = 0;
  size_t __n = 128;
  uint64_t v2 = *(void *)(a1 + 40);
  unint64_t v3 = *(void *)(a1 + 48) / 0xF4240uLL;
  input[0] = *(unsigned __int8 *)(a1 + 96);
  input[1] = v3;
  uint64_t v4 = (_RCLog *)IOConnectCallMethod(*(_DWORD *)(v2 + 696), 5u, input, 2u, *(const void **)(a1 + 56), *(void *)(a1 + 64), 0, &outputCnt, __src, &__n);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  int v5 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v5)
  {
    Instance = _RCLog::getInstance(v4);
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 813, v5);
  }
  else if (*(void *)(a1 + 72) < __n)
  {
    CFNumberRef v7 = _RCLog::getInstance(v4);
    _RCLog::log((_RCLog *)v7, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "in_size >= _response_size", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 814, 0);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -536870168;
  }
  else
  {
    memcpy(*(void **)(a1 + 80), __src, __n);
    **(void **)(a1 + 88) = __n;
  }
}

uint64_t RoseController::QueueCommand(RoseController *this, char a2, const unsigned __int8 *a3, uint64_t a4, void (*a5)(void *, int, void *, unint64_t), void *a6, uint64_t a7, char a8)
{
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2000000000;
  int v18 = 0;
  if (*((void *)this + 94))
  {
    size_t v8 = *((void *)this + 91);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_7CE0;
    block[3] = &unk_C368;
    char v13 = a2;
    block[4] = &v15;
    void block[5] = this;
    block[6] = a7;
    block[7] = a3;
    char v14 = a8;
    block[8] = a4;
    block[9] = a5;
    block[10] = a6;
    dispatch_async(v8, block);
    uint64_t v9 = *((unsigned int *)v16 + 6);
  }
  else
  {
    Instance = _RCLog::getInstance(this);
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "_clientQueue", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 833, 0);
    uint64_t v9 = 3758097113;
    *((_DWORD *)v16 + 6) = -536870183;
  }
  _Block_object_dispose(&v15, 8);
  return v9;
}

void sub_7CC8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_7CE0(uint64_t a1)
{
  uint32_t outputCnt = 0;
  size_t v23 = 0;
  uint64_t v2 = *(void *)(a1 + 40);
  unint64_t v3 = *(void *)(a1 + 48) / 0xF4240uLL;
  input[0] = *(unsigned __int8 *)(a1 + 88);
  input[1] = v3;
  dispatch_suspend(*(dispatch_object_t *)(v2 + 744));
  uint64_t v4 = (_RCLog *)IOConnectCallMethod(*(_DWORD *)(v2 + 696), 5u, input, 2u, *(const void **)(a1 + 56), *(void *)(a1 + 64), 0, &outputCnt, outputStruct, &v23);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(_DWORD *)(*(void *)(v5 + 8) + 24);
  if (v6)
  {
    Instance = _RCLog::getInstance(v4);
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 850, v6);
    uint64_t v5 = *(void *)(a1 + 32);
  }
  int v7 = *(unsigned __int8 *)(a1 + 89);
  v10[0] = (void (*)(void))_NSConcreteStackBlock;
  v10[1] = (void (*)(void))0x40000000;
  long long v11 = *(_OWORD *)(a1 + 72);
  long long v17 = outputStruct[5];
  long long v18 = outputStruct[6];
  long long v19 = outputStruct[7];
  long long v13 = outputStruct[1];
  long long v14 = outputStruct[2];
  long long v15 = outputStruct[3];
  long long v16 = outputStruct[4];
  v10[2] = (void (*)(void))sub_7F38;
  v10[3] = (void (*)(void))&unk_C340;
  v10[4] = (void (*)(void))v5;
  size_t v20 = v23;
  long long v12 = outputStruct[0];
  RoseController::_dispatchToClient(v2, v10, v7 == 0);
  dispatch_resume(*(dispatch_object_t *)(v2 + 744));
}

void RoseController::_dispatchToClient(uint64_t a1, void (**a2)(void), char a3)
{
  int v6 = (std::mutex *)(a1 + 760);
  std::mutex::lock((std::mutex *)(a1 + 760));
  if (a3)
  {
    int v7 = *(NSObject **)(a1 + 752);
    if (v7) {
      dispatch_async(v7, a2);
    }
  }
  else
  {
    a2[2](a2);
  }

  std::mutex::unlock(v6);
}

void sub_7F24(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void *sub_7F38(void *result)
{
  uint64_t v1 = (uint64_t (*)(void, uint64_t, void *, void))result[5];
  if (v1)
  {
    uint64_t v2 = *(unsigned int *)(*(void *)(result[4] + 8) + 24);
    if (v2) {
      return (void *)v1(result[6], v2, 0, 0);
    }
    else {
      return (void *)v1(result[6], v2, result + 7, result[23]);
    }
  }
  return result;
}

uint64_t RoseController::DeallocateFirmwareLogCache(RoseController *this)
{
  uint64_t input = 0;
  return IOConnectCallMethod(*((_DWORD *)this + 174), 0x12u, &input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t RoseController::PauseFirmwareLogs(RoseController *this)
{
  uint64_t input = 0;
  return IOConnectCallMethod(*((_DWORD *)this + 174), 0xBu, &input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t RoseController::_dequeueLogs(RoseController *this, unsigned __int8 *outputStruct, size_t a3, unint64_t *a4)
{
  uint32_t outputCnt = 0;
  size_t v10 = a3;
  if (outputStruct && a4)
  {
    uint64_t v5 = IOConnectCallMethod(*((_DWORD *)this + 174), 0xCu, 0, 0, 0, 0, 0, &outputCnt, outputStruct, &v10);
    uint64_t v6 = v5;
    if (v5)
    {
      Instance = _RCLog::getInstance((_RCLog *)v5);
      if (mach_error_string(v6)) {
        mach_error_string(v6);
      }
      _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", &unk_AF65);
    }
    else
    {
      *a4 = v10;
    }
  }
  else
  {
    uint64_t v6 = 3758097090;
    size_t v8 = _RCLog::getInstance(this);
    _RCLog::log((_RCLog *)v8, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", &unk_AF65);
  }
  return v6;
}

uint64_t RoseController::ResumeFirmwareLogs(RoseController *this)
{
  uint64_t input = 1;
  return IOConnectCallMethod(*((_DWORD *)this + 174), 0xBu, &input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t RoseController::DequeueFirmwareCrashLogs(mach_port_t *this, unsigned __int8 *a2, mach_vm_size_t a3, unint64_t *a4)
{
  return RoseController::DequeueCrashLogForCore(this, 0, 0, a2, a3, a4);
}

uint64_t RoseController::DequeueCrashLogForCore(mach_port_t *a1, unsigned int a2, char *a3, void *a4, mach_vm_size_t a5, size_t *a6)
{
  uint32_t outputCnt = 1;
  size_t v30 = 0;
  int v29 = 0;
  if (!a6)
  {
    uint64_t v15 = 3758097090;
    Instance = _RCLog::getInstance((_RCLog *)a1);
LABEL_25:
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", &unk_AF65);
    return v15;
  }
  uint64_t output = 0;
  *a6 = 0;
  uint64_t v12 = IOConnectCallMethod(a1[174], 0x16u, 0, 0, 0, 0, &output, &outputCnt, 0, &v30);
  if (v12)
  {
    uint64_t v15 = v12;
    uint64_t v22 = _RCLog::getInstance((_RCLog *)v12);
    if (mach_error_string(v15)) {
      mach_error_string(v15);
    }
    goto LABEL_34;
  }
  uint32_t outputCnt = 0;
  if ((output & 1) == 0)
  {
    uint64_t input = a2;
    mach_vm_size_t ofSize = 15;
    uint64_t outputStruct = &v28;
    if (a3) {
      uint64_t outputStruct = a3;
    }
    uint64_t v14 = IOConnectCallMethod(a1[174], 0x14u, &input, 1u, 0, 0, 0, &outputCnt, outputStruct, &ofSize);
    if (v14 != -536870160)
    {
      uint64_t v15 = v14;
      if (v14)
      {
        uint64_t v22 = _RCLog::getInstance((_RCLog *)v14);
        if (!mach_error_string(v15)) {
          goto LABEL_34;
        }
        goto LABEL_30;
      }
      long long v16 = &v28;
      if (a3) {
        long long v16 = a3;
      }
      *a6 = *((unsigned int *)v16 + 2) - 15;
      mach_vm_size_t ofSize = a5;
      if (a4)
      {
        uint64_t v17 = IOConnectCallMethod(a1[174], 0x15u, &input, 1u, 0, 0, 0, &outputCnt, a4, &ofSize);
        uint64_t v15 = v17;
        if (!v17)
        {
          *a6 = ofSize;
          return v15;
        }
        uint64_t v22 = _RCLog::getInstance((_RCLog *)v17);
        if (!mach_error_string(v15))
        {
LABEL_34:
          _RCLog::log((_RCLog *)v22, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", &unk_AF65);
          return v15;
        }
LABEL_30:
        mach_error_string(v15);
        goto LABEL_34;
      }
    }
    return 0;
  }
  uint64_t input = 0;
  mach_vm_size_t ofSize = 0;
  if (a2) {
    uint32_t v18 = 2;
  }
  else {
    uint32_t v18 = 1;
  }
  if (a2 >= 2)
  {
    uint64_t v15 = 3758097090;
    Instance = _RCLog::getInstance((_RCLog *)v12);
    goto LABEL_25;
  }
  uint64_t v19 = IOConnectMapMemory(a1[174], v18, mach_task_self_, &input, &ofSize, 1u);
  if (v19)
  {
    uint64_t v15 = v19;
    size_t v23 = _RCLog::getInstance((_RCLog *)v19);
    if (mach_error_string(v15)) {
      v24 = mach_error_string(v15);
    }
    else {
      v24 = (char *)&unk_AF65;
    }
    _RCLog::log((_RCLog *)v23, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v24, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 931, v15);
  }
  else
  {
    uint64_t v15 = RoseController::_dequeueCrashlogEntry((_RCLog *)v19, (IODataQueueMemory *)input, (unint64_t)a4, a5, a6, a3);
    IOConnectUnmapMemory(a1[174], v18, mach_task_self_, input);
  }
  return v15;
}

uint64_t RoseController::_dequeueCrashlogEntry(_RCLog *a1, IODataQueueMemory *dataQueue, unint64_t a3, size_t a4, size_t *a5, void *a6)
{
  if (!dataQueue)
  {
    Instance = _RCLog::getInstance(a1);
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "queueMemory", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 1453, 0);
    return 3758097101;
  }
  if (!a5)
  {
    uint64_t v20 = 3758097090;
    size_t v23 = _RCLog::getInstance(a1);
    _RCLog::log((_RCLog *)v23, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "out_size", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 1454, 0);
    return v20;
  }
  *a5 = 0;
  long long v11 = IODataQueuePeek(dataQueue);
  if (!(a3 | (unint64_t)v11)) {
    return 0;
  }
  uint64_t v12 = v11;
  if (!v11)
  {
    v24 = _RCLog::getInstance(0);
    _RCLog::log((_RCLog *)v24, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "nextEntry", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 1466, 0);
    return 3758097120;
  }
  data = v11->data;
  size_t size = v11->size;
  if (size > 0xE)
  {
    size -= 15;
    uint64_t v16 = 15;
    if (a3) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v20 = 0;
    *a5 = size;
    return v20;
  }
  uint64_t v15 = _RCLog::getInstance((_RCLog *)v11);
  _RCLog::log((_RCLog *)v15, 16, "crashlog is too small");
  uint64_t v16 = 0;
  if (!a3) {
    goto LABEL_14;
  }
LABEL_7:
  if (size > a4)
  {
    char v25 = _RCLog::getInstance((_RCLog *)v11);
    _RCLog::log((_RCLog *)v25, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "in_size >= size", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 1489, 0);
    return 3758097121;
  }
  uint64_t v17 = (_RCLog *)memcpy((void *)a3, &data[v16], size);
  *a5 += size;
  if (a6)
  {
    uint64_t v18 = *(void *)data;
    *(IODataQueueEntry *)((char *)a6 + 7) = *(IODataQueueEntry *)((char *)&v12[1] + 3);
    *a6 = v18;
  }
  uint64_t v19 = _RCLog::getInstance(v17);
  _RCLog::log((_RCLog *)v19, 1, "crashlog(%llu) dequeued: corrupt:%d, size in hdr/real size (%llu/%llu)", *(void *)v12->data, LOBYTE(v12[2].size), *(unsigned int *)v12[1].data, *a5);
  *(void *)dataSize = 0;
  IODataQueueDequeue(dataQueue, 0, dataSize);
  return 0;
}

_RCLog *RoseController::GetCoreDumpInfo(mach_port_t *a1, unsigned int a2, void *outputStruct)
{
  uint32_t outputCnt = 0;
  size_t v9 = 15;
  if (outputStruct)
  {
    uint64_t input = a2;
    unint64_t v3 = (_RCLog *)IOConnectCallMethod(a1[174], 0xFu, &input, 1u, 0, 0, 0, &outputCnt, outputStruct, &v9);
    uint64_t v4 = v3;
    if (v3)
    {
      Instance = _RCLog::getInstance(v3);
      if (mach_error_string((mach_error_t)v4)) {
        size_t v8 = mach_error_string((mach_error_t)v4);
      }
      else {
        size_t v8 = (char *)&unk_AF65;
      }
      _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v8, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 984, v4);
    }
  }
  else
  {
    uint64_t v6 = _RCLog::getInstance((_RCLog *)a1);
    _RCLog::log((_RCLog *)v6, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "desc", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 980, 0);
    return (_RCLog *)3758097090;
  }
  return v4;
}

uint64_t RoseController::ReadCoredump(RoseController *this, unsigned int a2, uint64_t a3, size_t a4, unsigned __int8 *outputStruct, unint64_t *a6)
{
  uint32_t outputCnt = 0;
  size_t v12 = a4;
  if (outputStruct && a6)
  {
    input[0] = a2;
    input[1] = a3;
    uint64_t v7 = IOConnectCallMethod(*((_DWORD *)this + 174), 0xEu, input, 2u, 0, 0, 0, &outputCnt, outputStruct, &v12);
    uint64_t v8 = v7;
    if (v7)
    {
      Instance = _RCLog::getInstance((_RCLog *)v7);
      if (mach_error_string(v8)) {
        mach_error_string(v8);
      }
      _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", &unk_AF65);
    }
    else
    {
      *a6 = v12;
    }
  }
  else
  {
    uint64_t v8 = 3758097090;
    size_t v10 = _RCLog::getInstance(this);
    _RCLog::log((_RCLog *)v10, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", &unk_AF65);
  }
  return v8;
}

uint64_t RoseController::GetFirmwareState(RoseController *this, unsigned __int8 *a2)
{
  *a2 = *((_DWORD *)this + 245);
  return 0;
}

uint64_t RoseController::GetSIKBlob(RoseController *this, const __CFAllocator *a2, unsigned __int8 **a3, unint64_t *a4)
{
  return RoseController::_getSIKInfo(this, a2, a3, a4, 0);
}

uint64_t RoseController::_getSIKInfo(RoseController *this, const __CFAllocator *a2, unsigned __int8 **a3, unint64_t *a4, __int16 a5)
{
  unint64_t v43 = 0;
  CFIndex size = 0;
  __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)this + 824);
  __lk.__owns_ = 1;
  std::mutex::lock((std::mutex *)((char *)this + 824));
  if (!*((unsigned char *)this + 936))
  {
    v13.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_ + 5000000000;
    while (1)
    {
      if (*((unsigned char *)this + 936)) {
        goto LABEL_2;
      }
      v14.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
      if (v14.__d_.__rep_ >= v13.__d_.__rep_) {
        goto LABEL_21;
      }
      v15.__d_.__rep_ = v13.__d_.__rep_ - std::chrono::steady_clock::now().__d_.__rep_;
      if (v15.__d_.__rep_ >= 1) {
        break;
      }
LABEL_20:
      v14.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
      if (v14.__d_.__rep_ >= v13.__d_.__rep_)
      {
LABEL_21:
        if (*((unsigned char *)this + 936)) {
          goto LABEL_2;
        }
        Instance = _RCLog::getInstance((_RCLog *)v14.__d_.__rep_);
        _RCLog::log((_RCLog *)Instance, 16, "timed out waiting for boot_done event");
        uint64_t v12 = 3758097110;
        goto LABEL_35;
      }
    }
    std::chrono::steady_clock::now();
    v16.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
    if (v16.__d_.__rep_)
    {
      if (v16.__d_.__rep_ < 1)
      {
        if ((unint64_t)v16.__d_.__rep_ < 0xFFDF3B645A1CAC09)
        {
          std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v17 = 0x8000000000000000;
          goto LABEL_18;
        }
      }
      else if ((unint64_t)v16.__d_.__rep_ > 0x20C49BA5E353F7)
      {
        std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v17 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_16;
      }
      std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v17 = 1000 * v16.__d_.__rep_;
    }
    else
    {
      std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v17 = 0;
    }
LABEL_16:
    if (v17 > (v15.__d_.__rep_ ^ 0x7FFFFFFFFFFFFFFFLL))
    {
      v18.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
LABEL_19:
      std::condition_variable::__do_timed_wait((std::condition_variable *)((char *)this + 888), &__lk, v18);
      std::chrono::steady_clock::now();
      goto LABEL_20;
    }
LABEL_18:
    v18.__d_.__rep_ = v17 + v15.__d_.__rep_;
    goto LABEL_19;
  }
LABEL_2:
  sub_5CF8((uint64_t)&__lk);
  Session = (_RCLog *)RoseSIKDataSession::GetSession(v9);
  if (Session)
  {
    long long v11 = _RCLog::getInstance(Session);
    _RCLog::log((_RCLog *)v11, 16, "Rose SIK Blob session already in progress");
    uint64_t v12 = 3758097109;
  }
  else
  {
    _buildRTKitCommsSIKInfoRequest(&v46, a5);
    dispatch_suspend(*((dispatch_object_t *)this + 93));
    uint64_t v20 = RoseController::PerformCommand(this, 5, (const unsigned __int8 *)&v46, 8, v45, 12, &v43, 20000000000);
    if (v20)
    {
      uint64_t v12 = v20;
      dispatch_resume(*((dispatch_object_t *)this + 93));
      size_t v30 = _RCLog::getInstance(v29);
      if (mach_error_string(v12)) {
        v31 = mach_error_string(v12);
      }
      else {
        v31 = (char *)&unk_AF65;
      }
      _RCLog::log((_RCLog *)v30, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v31, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 1067, v12);
    }
    else
    {
      uint32_t v21 = (NSObject **)_processRTKitCommsSIKInfoResponse(v45);
      dispatch_resume(*((dispatch_object_t *)this + 93));
      if (v21)
      {
        size_t v23 = (_RCLog *)RoseSIKDataSession::WaitforData(v21, 10000000000);
        uint64_t v12 = (uint64_t)v23;
        if (v23)
        {
          v34 = _RCLog::getInstance(v23);
          if (mach_error_string(v12)) {
            v35 = mach_error_string(v12);
          }
          else {
            v35 = (char *)&unk_AF65;
          }
          _RCLog::log((_RCLog *)v34, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v35, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 1076, v12);
        }
        else
        {
          Data = (_RCLog *)RoseSIKDataSession::ReadData((RoseSIKDataSession *)v21, 0, 0, (unint64_t *)&size);
          uint64_t v12 = (uint64_t)Data;
          if (Data)
          {
            v36 = _RCLog::getInstance(Data);
            if (mach_error_string(v12)) {
              v37 = mach_error_string(v12);
            }
            else {
              v37 = (char *)&unk_AF65;
            }
            _RCLog::log((_RCLog *)v36, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v37, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 1079, v12);
          }
          else
          {
            char v25 = (unsigned __int8 *)CFAllocatorAllocate(a2, size, 0);
            if (v25)
            {
              v26 = (_RCLog *)RoseSIKDataSession::ReadData((RoseSIKDataSession *)v21, v25, size, &v43);
              uint64_t v12 = (uint64_t)v26;
              if (v26)
              {
                v39 = _RCLog::getInstance(v26);
                if (mach_error_string(v12)) {
                  v40 = mach_error_string(v12);
                }
                else {
                  v40 = (char *)&unk_AF65;
                }
                _RCLog::log((_RCLog *)v39, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v40, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 1085, v12);
                CFAllocatorDeallocate(a2, v25);
              }
              else
              {
                v27 = _RCLog::getInstance(v26);
                _RCLog::log((_RCLog *)v27, 1, "SIK Blob: out size %u", v43);
                uint64_t v12 = 0;
                *a3 = v25;
                *a4 = v43;
              }
            }
            else
            {
              v38 = _RCLog::getInstance(0);
              _RCLog::log((_RCLog *)v38, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "_buffer", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 1082, 0);
              uint64_t v12 = 3758097085;
            }
          }
        }
      }
      else
      {
        v33 = _RCLog::getInstance(v22);
        _RCLog::log((_RCLog *)v33, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "session", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 1073, 0);
        uint64_t v12 = 3758097084;
      }
    }
    RoseSIKDataSession::Release(v28);
  }
LABEL_35:
  if (__lk.__owns_) {
    std::mutex::unlock(__lk.__m_);
  }
  return v12;
}

void sub_8FCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::mutex *a16, char a17)
{
  if (a17) {
    std::mutex::unlock(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t RoseController::GetSIKPublicKey(RoseController *this, const __CFAllocator *a2, unsigned __int8 **a3, unint64_t *a4)
{
  return RoseController::_getSIKInfo(this, a2, a3, a4, 2);
}

uint64_t RoseController::RegisterResetHandler(RoseController *this, void (*a2)(void *), void *a3)
{
  return 3758097095;
}

uint64_t RoseController::RegisterCrashLogAvailableHandler(RoseController *this, void (*a2)(void *), void *a3)
{
  uint64_t v6 = (std::mutex *)((char *)this + 472);
  std::mutex::lock((std::mutex *)((char *)this + 472));
  *((void *)this + 55) = a2;
  *((void *)this + 56) = a3;
  std::mutex::unlock(v6);
  return 0;
}

uint64_t RoseController::RegisterCrashHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (std::mutex *)(a1 + 472);
  std::mutex::lock((std::mutex *)(a1 + 472));
  *(void *)(a1 + 456) = a2;
  *(void *)(a1 + 464) = a3;
  std::mutex::unlock(v6);
  return 0;
}

uint64_t RoseController::RegisterStateHandler(RoseController *this, void (*a2)(void *, unsigned __int8), void *a3)
{
  uint64_t v6 = (std::mutex *)((char *)this + 552);
  std::mutex::lock((std::mutex *)((char *)this + 552));
  *((void *)this + 67) = a2;
  *((void *)this + 68) = a3;
  std::mutex::unlock(v6);
  return 0;
}

uint64_t RoseController::RegisterErrorReportHandler(RoseController *this, void (*a2)(void *, unsigned __int8, void *, unint64_t), void *a3)
{
  uint64_t v6 = (std::mutex *)((char *)this + 632);
  std::mutex::lock((std::mutex *)((char *)this + 632));
  *((void *)this + 77) = a2;
  *((void *)this + 78) = a3;
  std::mutex::unlock(v6);
  return 0;
}

uint64_t RoseController::RegisterEventHandler(RoseController *this, void (*a2)(void *, void *, unint64_t), void *a3)
{
  if (*((void *)this + 94))
  {
    uint64_t v6 = (std::mutex *)((char *)this + 376);
    std::mutex::lock((std::mutex *)((char *)this + 376));
    *((void *)this + 2) = a2;
    *((void *)this + 3) = a3;
    *((unsigned char *)this + 32) = 0;
    std::mutex::unlock(v6);
    uint64_t v7 = *((void *)this + 93);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_A248;
    block[3] = &unk_C450;
    block[4] = this;
    dispatch_sync(v7, block);
    return 0;
  }
  else
  {
    Instance = _RCLog::getInstance(this);
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "_clientQueue", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 1147, 0);
    return 3758097113;
  }
}

uint64_t RoseController::_callEventCallback(uint64_t a1, const void *a2, size_t a3)
{
  memcpy(__dst, a2, a3);
  uint64_t v4 = (std::mutex *)(a1 + 376);
  std::mutex::lock((std::mutex *)(a1 + 376));
  if (BYTE2(__dst[0]) >= 0xFuLL)
  {
    Instance = _RCLog::getInstance(v5);
    _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "event.header.interface < ROSE_INTERFACE_MAX", (const char *)&unk_AF65, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 1185, 0);
    uint64_t v11 = 3758097090;
  }
  else
  {
    uint64_t v6 = a1 + 24 * BYTE2(__dst[0]);
    uint64_t v8 = *(void (**)(void))(v6 + 16);
    uint64_t v7 = *(void (**)(void))(v6 + 24);
    uint64_t v9 = v6 + 16;
    char v10 = *(unsigned char *)(v9 + 16);
    if (v10)
    {
      if (v8) {
        ((void (*)(void (*)(void), char *, void))v8)(v7, (char *)__dst + 5, BYTE3(__dst[0]));
      }
    }
    else
    {
      v14[0] = (void (*)(void))_NSConcreteStackBlock;
      v14[1] = (void (*)(void))0x40000000;
      v14[2] = sub_9400;
      v14[3] = (void (*)(void))&unk_C388;
      v14[4] = (void (*)(void))a1;
      v14[5] = v8;
      v14[6] = v7;
      char v15 = v10;
      *(_DWORD *)std::chrono::system_clock::time_point v16 = *(_DWORD *)(v9 + 17);
      *(_DWORD *)&v16[3] = *(_DWORD *)(v9 + 20);
      long long v20 = __dst[3];
      long long v19 = __dst[2];
      *(void *)&v24[13] = *(void *)&v26[13];
      *(_OWORD *)v24 = *(_OWORD *)v26;
      long long v23 = __dst[6];
      long long v21 = __dst[4];
      long long v22 = __dst[5];
      long long v18 = __dst[1];
      long long v17 = __dst[0];
      RoseController::_dispatchToClient(a1, v14, 1);
    }
    uint64_t v11 = 0;
  }
  std::mutex::unlock(v4);
  return v11;
}

void sub_93EC(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_9400(uint64_t a1)
{
  uint64_t v2 = (std::mutex *)(*(void *)(a1 + 32) + 376);
  std::mutex::lock(v2);
  unint64_t v3 = *(void (**)(void, uint64_t, void))(a1 + 40);
  if (v3) {
    v3(*(void *)(a1 + 48), a1 + 69, *(unsigned __int8 *)(a1 + 67));
  }

  std::mutex::unlock(v2);
}

void sub_945C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t RoseController::_callErrorCallback(void (*a1)(void), const void *a2, size_t a3)
{
  memcpy(&v6, a2, a3);
  v5[0] = (void (*)(void))_NSConcreteStackBlock;
  v5[1] = (void (*)(void))0x40000000;
  v5[2] = sub_9528;
  v5[3] = (void (*)(void))&unk_C3A8;
  v5[4] = a1;
  RoseController::_dispatchToClient((uint64_t)a1, v5, 1);
  return 0;
}

void sub_9528(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  std::mutex::lock((std::mutex *)(v2 + 632));
  unint64_t v3 = *(void (**)(void, void, uint64_t, void))(v2 + 616);
  if (v3)
  {
    v3(*(void *)(v2 + 624), *(unsigned __int8 *)(a1 + 42), a1 + 45, *(unsigned __int8 *)(a1 + 43));
  }
  else
  {
    snprintf(__str, 0x20uLL, "error_code %d", *(unsigned __int8 *)(a1 + 42));
    RCDumpPacket((_RCLog *)(a1 + 45), *(unsigned __int8 *)(a1 + 43), __str);
  }
  std::mutex::unlock((std::mutex *)(v2 + 632));
}

void sub_95E8(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void RCDumpPacket(_RCLog *a1, unsigned int a2, const char *a3)
{
  long long v17 = a1;
  uint64_t v4 = __str;
  if (a3)
  {
    a1 = (_RCLog *)snprintf(__str, 0x400uLL, "%s\n", a3);
    uint64_t v4 = &__str[(int)a1];
  }
  if (a2)
  {
    unint64_t v5 = a2;
    uint64_t v6 = v17;
    do
    {
      if (v5 >= 0x10) {
        int v7 = 16;
      }
      else {
        int v7 = v5;
      }
      if (v5 >= 0x10) {
        int v8 = 16;
      }
      else {
        int v8 = v5;
      }
      unsigned int v9 = v8 - 1;
      uint64_t v10 = 0;
      uint64_t v11 = &v4[snprintf(v4, 0x400uLL, "%08x: ", v6 - v17)];
      do
      {
        a1 = (_RCLog *)snprintf(v11, 0x400uLL, "%02x ", *((unsigned __int8 *)v6 + v10));
        v11 += (int)a1;
        if (v10 == 7) {
          *(_WORD *)v11++ = 32;
        }
        ++v10;
      }
      while (v7 != v10);
      if (v5 <= 0xF)
      {
        do
        {
          *(_DWORD *)uint64_t v11 = 2105376;
          if (v9 == 6)
          {
            *(_WORD *)(v11 + 3) = 32;
            v11 += 4;
          }
          else
          {
            v11 += 3;
          }
          ++v9;
        }
        while (v9 < 0xF);
      }
      uint64_t v12 = 0;
      *(_DWORD *)uint64_t v11 = 2128928;
      std::chrono::steady_clock::time_point v13 = v11 + 3;
      do
      {
        int v14 = *((unsigned __int8 *)v6 + v12);
        if ((v14 - 33) >= 0x5E) {
          LOBYTE(v14) = 46;
        }
        unsigned char *v13 = v14;
        v13[1] = 0;
        if (v12 == 7)
        {
          *(_WORD *)(v13 + 1) = 32;
          v13 += 2;
        }
        else
        {
          ++v13;
        }
        ++v12;
      }
      while (v7 != v12);
      *(_WORD *)std::chrono::steady_clock::time_point v13 = 10;
      uint64_t v4 = v13 + 1;
      uint64_t v6 = (_RCLog *)((char *)v6 + v12);
      BOOL v15 = v5 > 0x10;
      v5 -= 16;
    }
    while (v15);
  }
  Instance = _RCLog::getInstance(a1);
  _RCLog::log((_RCLog *)Instance, 16, "%s", __str);
}

uint64_t RoseController::_callErrorCallback(RoseController *this, char a2, void *__src, size_t __n)
{
  int v4 = __n;
  if (__n > 0x80)
  {
    Instance = _RCLog::getInstance(this);
    _RCLog::log((_RCLog *)Instance, 16, "error packet too large (size %d)", v4);
    return 3758097121;
  }
  else
  {
    memcpy(v11, __src, __n);
    v9[0] = (void (*)(void))_NSConcreteStackBlock;
    v9[1] = (void (*)(void))0x40000000;
    v9[2] = sub_98FC;
    v9[3] = (void (*)(void))&unk_C3C8;
    v9[4] = (void (*)(void))this;
    char v10 = a2;
    v11[128] = v4;
    RoseController::_dispatchToClient((uint64_t)this, v9, 1);
    return 0;
  }
}

void sub_98FC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  std::mutex::lock((std::mutex *)(v2 + 632));
  unint64_t v3 = *(void (**)(void, void, uint64_t, void))(v2 + 616);
  if (v3)
  {
    v3(*(void *)(v2 + 624), *(unsigned __int8 *)(a1 + 40), a1 + 46, *(unsigned __int8 *)(a1 + 174));
  }
  else
  {
    snprintf(__str, 0x20uLL, "error_code %d", *(unsigned __int8 *)(a1 + 40));
    RCDumpPacket((_RCLog *)(a1 + 46), *(unsigned __int8 *)(a1 + 174), __str);
  }
  std::mutex::unlock((std::mutex *)(v2 + 632));
}

void sub_99BC(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void RoseController::ServiceCallback(RoseController *this, int a2, char *a3)
{
  switch(a2)
  {
    case -469794812:
      char v28 = (std::mutex *)((char *)this + 824);
      LOBYTE(v29) = 1;
      std::mutex::lock((std::mutex *)((char *)this + 824));
      *((unsigned char *)this + 936) = 1;
      sub_5CF8((uint64_t)&v28);
      std::condition_variable::notify_one((std::condition_variable *)((char *)this + 888));
      if ((_BYTE)v29)
      {
        unint64_t v5 = v28;
LABEL_8:
        std::mutex::unlock(v5);
      }
      break;
    case -469794814:
      char v28 = 0;
      uint64_t v29 = (uint64_t)&v28;
      uint64_t v30 = 0x6802000000;
      v31 = sub_9E68;
      v32 = nullsub_1;
      if (a3)
      {
        Instance = _RCLog::getInstance(this);
        if (a3[60]) {
          int v7 = "fatal";
        }
        else {
          int v7 = "non-fatal";
        }
        _RCLog::log((_RCLog *)Instance, 1, "received a %s crashlog", v7);
        uint64_t v9 = 0;
        char v10 = 1;
        do
        {
          uint64_t v11 = 0;
          char v12 = v10;
          char v13 = 1;
          do
          {
            char v14 = v13;
            BOOL v15 = _RCLog::getInstance(v8);
            std::chrono::system_clock::time_point v16 = &a3[16 * v11 + 30 * v9 - v11];
            _RCLog::log((_RCLog *)v15, 1, "core/logtype(%d/%d) size:%llu corrupted:%d id:%llu", v9, v11, *((unsigned int *)v16 + 2), v16[12], *(void *)v16);
            char v13 = 0;
            uint64_t v11 = 1;
          }
          while ((v14 & 1) != 0);
          char v10 = 0;
          uint64_t v9 = 1;
        }
        while ((v12 & 1) != 0);
        uint64_t v17 = v29;
        long long v19 = *((_OWORD *)a3 + 1);
        long long v18 = *((_OWORD *)a3 + 2);
        long long v20 = *(_OWORD *)(a3 + 45);
        *(_OWORD *)(v29 + 40) = *(_OWORD *)a3;
        *(_OWORD *)(v17 + 85) = v20;
        *(_OWORD *)(v17 + 72) = v18;
        *(_OWORD *)(v17 + 56) = v19;
      }
      long long v21 = *((void *)this + 93);
      block = (std::mutex *)_NSConcreteStackBlock;
      uint64_t v35 = 0x40000000;
      v36 = sub_A248;
      v37 = &unk_C450;
      v38 = this;
      dispatch_sync(v21, &block);
      v27[0] = (void (*)(void))_NSConcreteStackBlock;
      v27[1] = (void (*)(void))0x40000000;
      v27[2] = sub_9E90;
      v27[3] = (void (*)(void))&unk_C408;
      v27[4] = (void (*)(void))this;
      RoseController::_dispatchToClient((uint64_t)this, v27, 1);
      v26[0] = (void (*)(void))_NSConcreteStackBlock;
      v26[1] = (void (*)(void))0x40000000;
      v26[2] = (void (*)(void))sub_9EF4;
      v26[3] = (void (*)(void))&unk_C430;
      v26[5] = (void (*)(void))this;
      v26[6] = (void (*)(void))a3;
      v26[4] = (void (*)(void))&v28;
      RoseController::_dispatchToClient((uint64_t)this, v26, 1);
      _Block_object_dispose(&v28, 8);
      break;
    case -469794816:
      *((_DWORD *)this + 245) = a3;
      if (a3)
      {
LABEL_5:
        v33[0] = (void (*)(void))_NSConcreteStackBlock;
        v33[1] = (void (*)(void))0x40000000;
        v33[2] = sub_9E00;
        v33[3] = (void (*)(void))&unk_C3E8;
        v33[4] = (void (*)(void))this;
        RoseController::_dispatchToClient((uint64_t)this, v33, 1);
        return;
      }
      block = (std::mutex *)((char *)this + 824);
      LOBYTE(v35) = 1;
      std::mutex::lock((std::mutex *)((char *)this + 824));
      int v22 = *((unsigned __int8 *)this + 936);
      *((unsigned char *)this + 936) = 0;
      sub_5CF8((uint64_t)&block);
      if (v22)
      {
        v24 = _RCLog::getInstance(v23);
        _RCLog::log((_RCLog *)v24, 16, "rose firmware reset asynchronously");
        char v25 = *((void *)this + 93);
        char v28 = (std::mutex *)_NSConcreteStackBlock;
        uint64_t v29 = 0x40000000;
        uint64_t v30 = (uint64_t)sub_A248;
        v31 = (__n128 (*)(uint64_t, uint64_t))&unk_C450;
        v32 = (uint64_t (*)())this;
        dispatch_sync(v25, &v28);
        if ((_BYTE)v35) {
          std::mutex::unlock(block);
        }
        goto LABEL_5;
      }
      if ((_BYTE)v35)
      {
        unint64_t v5 = block;
        goto LABEL_8;
      }
      break;
  }
}

void sub_9DB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,std::mutex *a26,char a27)
{
  if (*(unsigned char *)(v27 - 128)) {
    std::mutex::unlock(*(std::mutex **)(v27 - 136));
  }
  _Unwind_Resume(exception_object);
}

void sub_9E00(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::mutex::lock((std::mutex *)(v1 + 552));
  uint64_t v2 = *(void (**)(void, void))(v1 + 536);
  if (v2) {
    v2(*(void *)(v1 + 544), *(unsigned __int8 *)(v1 + 980));
  }

  std::mutex::unlock((std::mutex *)(v1 + 552));
}

void sub_9E54(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

__n128 sub_9E68(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  long long v3 = *(_OWORD *)(a2 + 56);
  long long v4 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 85) = *(_OWORD *)(a2 + 85);
  *(_OWORD *)(a1 + 72) = v4;
  *(_OWORD *)(a1 + 56) = v3;
  *(__n128 *)(a1 + 40) = result;
  return result;
}

void sub_9E90(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::mutex::lock((std::mutex *)(v1 + 472));
  uint64_t v2 = *(void (**)(void))(v1 + 440);
  if (v2) {
    v2(*(void *)(v1 + 448));
  }

  std::mutex::unlock((std::mutex *)(v1 + 472));
}

void sub_9EE0(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_9EF4(void *a1)
{
  uint64_t v2 = a1[5];
  std::mutex::lock((std::mutex *)(v2 + 472));
  long long v3 = *(void (**)(void, uint64_t))(v2 + 456);
  if (v3)
  {
    if (a1[6]) {
      uint64_t v4 = *(void *)(a1[4] + 8) + 40;
    }
    else {
      uint64_t v4 = 0;
    }
    v3(*(void *)(v2 + 464), v4);
  }

  std::mutex::unlock((std::mutex *)(v2 + 472));
}

void sub_9F6C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void RoseController::QueueEventSourceCallback(IODataQueueEntry *this, void *a2)
{
  mach_msg_return_t v6;
  uint64_t vars8;

  mach_msg_size_t v3 = 92;
  uint64_t v4 = (mach_msg_header_t *)CFAllocatorAllocate(kCFAllocatorDefault, 92, 0);
  for (v4->msgh_mach_port_name_t size = 92; ; v4->msgh_mach_port_name_t size = v3)
  {
    v4->msgh_bits = 0;
    mach_port_name_t size = this[89].size;
    v4->msgh_remote_port = 0;
    v4->msgh_local_port = size;
    v4->msgh_id = 0;
    uint64_t v6 = mach_msg(v4, 117440518, 0, v3, size, 0, 0);
    if (v6 != 268451844) {
      break;
    }
    mach_msg_size_t v3 = (v4->msgh_size + 71) & 0xFFFFFFFC;
    uint64_t v4 = (mach_msg_header_t *)CFAllocatorReallocate(kCFAllocatorDefault, v4, v3, 0);
  }
  if (!v6) {
    RoseController::_dequeueEvents(this);
  }

  CFAllocatorDeallocate(kCFAllocatorSystemDefault, v4);
}

IODataQueueEntry *RoseController::_dequeueEvents(IODataQueueEntry *this)
{
  uint64_t v1 = (IODataQueueMemory *)this[88];
  if (v1)
  {
    uint64_t v2 = (_RCLog *)this;
    uint32_t dataSize = 0;
    this = IODataQueuePeek(v1);
    if (this)
    {
      mach_msg_size_t v3 = (unsigned __int8 *)this;
      do
      {
        RoseController::_dispatchDataQueueMessage(v2, v3 + 4, *(unsigned int *)v3);
        uint32_t dataSize = 0;
        IODataQueueDequeue(v1, 0, &dataSize);
        this = IODataQueuePeek(v1);
        mach_msg_size_t v3 = (unsigned __int8 *)this;
      }
      while (this);
    }
  }
  return this;
}

void RoseController::_dispatchDataQueueMessage(_RCLog *this, unsigned __int8 *a2, size_t a3)
{
  int v6 = a2[1];
  if (v6 == 2)
  {
    Instance = _RCLog::getInstance(this);
    _RCLog::log((_RCLog *)Instance, 2, "received packet error report size %d", a3);
    memcpy(&v10, a2, a3);
    v9[0] = (void (*)(void))_NSConcreteStackBlock;
    v9[1] = (void (*)(void))0x40000000;
    v9[2] = sub_9528;
    v9[3] = (void (*)(void))&unk_C3A8;
    v9[4] = (void (*)(void))this;
    RoseController::_dispatchToClient((uint64_t)this, v9, 1);
  }
  else if (v6 == 1)
  {
    RoseController::_callEventCallback((uint64_t)this, a2, a3);
  }
  else
  {
    int v8 = _RCLog::getInstance(this);
    _RCLog::log((_RCLog *)v8, 16, "unhandled packetType: %d", a2[1]);
  }
}

IODataQueueEntry *sub_A248(uint64_t a1)
{
  return RoseController::_dequeueEvents(*(IODataQueueEntry **)(a1 + 32));
}

void RoseController::_dispatchSourceCancelHandler(RoseController *this)
{
  uint64_t v2 = *((void *)this + 93);
  if (v2) {
    dispatch_release(v2);
  }
  mach_vm_address_t v3 = *((void *)this + 88);
  if (v3)
  {
    IOConnectUnmapMemory(*((_DWORD *)this + 174), 0, mach_task_self_, v3);
    *((void *)this + 88) = 0;
  }
  io_connect_t v4 = *((_DWORD *)this + 174);
  if (v4)
  {
    if (*((void *)this + 90))
    {
      IONotificationPortDestroy(*((IONotificationPortRef *)this + 90));
      io_connect_t v4 = *((_DWORD *)this + 174);
    }
    IOServiceClose(v4);
    *((void *)this + 90) = 0;
    *((_DWORD *)this + 174) = 0;
  }
  mach_port_name_t v5 = *((_DWORD *)this + 178);
  if (v5)
  {
    mach_port_mod_refs(mach_task_self_, v5, 1u, -1);
    *((_DWORD *)this + 178) = 0;
  }
  int v6 = (IONotificationPort *)*((void *)this + 90);
  if (v6) {
    IONotificationPortDestroy(v6);
  }
  *((_DWORD *)this + 175) = 0;
  RoseController::Release(this);
  int v7 = *((void *)this + 119);

  dispatch_group_leave(v7);
}

_RCLog *RoseController::_handleSecurityEvents(RoseController *this, unint64_t a2)
{
  if ((*(_DWORD *)this & 0x3FD | 2) == 0x202)
  {
    mach_vm_address_t v3 = (_RCLog *)_processRTKitCommsSIKInfoEvent((unsigned __int8 *)this, a2);
    io_connect_t v4 = v3;
    if (v3)
    {
      Instance = _RCLog::getInstance(v3);
      if (mach_error_string((mach_error_t)v4)) {
        int v6 = mach_error_string((mach_error_t)v4);
      }
      else {
        int v6 = (char *)&unk_AF65;
      }
      _RCLog::log((_RCLog *)Instance, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v6, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 1623, v4);
    }
  }
  else
  {
    int v7 = _RCLog::getInstance(this);
    _RCLog::log((_RCLog *)v7, 16, "unsupported command 0x%02x", *(_DWORD *)this & 0x3FF);
    return (_RCLog *)3758097095;
  }
  return v4;
}

_RCLog *RoseController::SetPowerState(mach_port_t *this, unsigned int a2)
{
  uint64_t input = a2;
  Instance = _RCLog::getInstance((_RCLog *)this);
  _RCLog::log((_RCLog *)Instance, 1, "SetPowerState called with on = %d", a2);
  int v6 = (_RCLog *)IOConnectCallMethod(this[174], 0x10u, &input, 1u, 0, 0, 0, 0, 0, 0);
  if (v6)
  {
    int v8 = v6;
    char v12 = _RCLog::getInstance(v6);
    if (mach_error_string((mach_error_t)v8)) {
      char v13 = mach_error_string((mach_error_t)v8);
    }
    else {
      char v13 = (char *)&unk_AF65;
    }
    _RCLog::log((_RCLog *)v12, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v13, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 1677, v8);
  }
  else if (a2)
  {
    usleep(0x2710u);
    int v7 = RoseController::Reset((RoseController *)this);
    int v8 = v7;
    if (v7)
    {
      uint64_t v9 = _RCLog::getInstance(v7);
      if (mach_error_string((mach_error_t)v8)) {
        uint64_t v10 = mach_error_string((mach_error_t)v8);
      }
      else {
        uint64_t v10 = (char *)&unk_AF65;
      }
      _RCLog::log((_RCLog *)v9, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v10, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 1682, v8);
    }
  }
  else
  {
    int v8 = 0;
    this[245] = 4;
  }
  return v8;
}

_RCLog *RoseController::SetDeepSleepState(mach_port_t *this, unsigned int a2)
{
  uint64_t inputStruct = a2;
  uint64_t input = 222;
  Instance = _RCLog::getInstance((_RCLog *)this);
  _RCLog::log((_RCLog *)Instance, 1, "SetDeepSleepState called with on = %d", a2);
  mach_port_name_t v5 = (_RCLog *)IOConnectCallMethod(this[174], 9u, &input, 1u, &inputStruct, 8uLL, 0, 0, 0, 0);
  int v6 = v5;
  if (v5)
  {
    int v8 = _RCLog::getInstance(v5);
    if (mach_error_string((mach_error_t)v6)) {
      uint64_t v9 = mach_error_string((mach_error_t)v6);
    }
    else {
      uint64_t v9 = (char *)&unk_AF65;
    }
    _RCLog::log((_RCLog *)v8, 16, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (const char *)&unk_AF65, "result == 0 ", v9, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPURTKitOSClientDrivers/Rose/RoseControllerLib/RoseController.cpp", 1703, v6);
  }
  return v6;
}

void RoseControllerLibFactory(const __CFAllocator *a1, const void *a2)
{
  CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0xAu, 0x3Au, 0xB3u, 0x17u, 0x88u, 0xE7u, 0x40u, 0xA0u, 0x89u, 0x68u, 0x33u, 0x55u, 0x58u, 0x14u, 0x66u, 0x63u);
  if (CFEqual(a2, v4))
  {
    mach_port_name_t v5 = (RoseController *)CFAllocatorAllocate(a1, 984, 0);
    RoseController::RoseController(v5, a1);
  }
}

intptr_t DefaultSyncDownloadCallback(NSObject *a1, int a2)
{
  *(_DWORD *)dispatch_get_context(a1) = a2;

  return dispatch_semaphore_signal(a1);
}

void _RCLog::_RCLog(_RCLog *this)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = os_log_create("com.apple.RoseControllerLib", "default");
}

{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = os_log_create("com.apple.RoseControllerLib", "default");
}

uint64_t *_RCLog::getInstance(_RCLog *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_10238, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_10238))
  {
    qword_10220 = 0;
    *(void *)algn_10228 = 0;
    qword_10230 = (uint64_t)os_log_create("com.apple.RoseControllerLib", "default");
    __cxa_atexit((void (*)(void *))nullsub_2, &qword_10220, &dword_0);
    __cxa_guard_release(&qword_10238);
  }
  return &qword_10220;
}

BOOL _RCLog::isLogSinkAvailable(_RCLog *this)
{
  return *(void *)this != 0;
}

void *_RCLog::registerLogSink(void *this, void (*a2)(void *, os_log_type_t, const char *), void *a3)
{
  *this = a2;
  this[1] = a3;
  return this;
}

void _RCLog::log(_RCLog *this, uint64_t a2, const char *a3, ...)
{
  va_start(va, a3);
  vsnprintf(__str, 0x400uLL, a3, va);
  if (*(void *)this)
  {
    (*(void (**)(void, uint64_t, char *))this)(*((void *)this + 1), a2, __str);
  }
  else
  {
    mach_port_name_t v5 = *((void *)this + 2);
    if (os_log_type_enabled(v5, (os_log_type_t)a2))
    {
      *(_DWORD *)buf = 136315138;
      int v7 = __str;
      _os_log_impl(&dword_0, v5, (os_log_type_t)a2, "%s", buf, 0xCu);
    }
  }
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return _CFAllocatorAllocate(allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void *__cdecl CFAllocatorReallocate(CFAllocatorRef allocator, void *ptr, CFIndex newsize, CFOptionFlags hint)
{
  return _CFAllocatorReallocate(allocator, ptr, newsize, hint);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
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

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFWriteStreamRef CFWriteStreamCreateWithBuffer(CFAllocatorRef alloc, UInt8 *buffer, CFIndex bufferCapacity)
{
  return _CFWriteStreamCreateWithBuffer(alloc, buffer, bufferCapacity);
}

CFStreamStatus CFWriteStreamGetStatus(CFWriteStreamRef stream)
{
  return _CFWriteStreamGetStatus(stream);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return _CFWriteStreamOpen(stream);
}

CFIndex CFWriteStreamWrite(CFWriteStreamRef stream, const UInt8 *buffer, CFIndex bufferLength)
{
  return _CFWriteStreamWrite(stream, buffer, bufferLength);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return _IOConnectMapMemory(connect, memoryType, intoTask, atAddress, ofSize, options);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return _IOConnectSetNotificationPort(connect, type, port, reference);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return _IOConnectUnmapMemory(connect, memoryType, fromTask, atAddress);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return _IODataQueueAllocateNotificationPort();
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return _IODataQueueDequeue(dataQueue, data, dataSize);
}

IODataQueueEntry *__cdecl IODataQueuePeek(IODataQueueMemory *dataQueue)
{
  return _IODataQueuePeek(dataQueue);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IORegistryEntryGetProperty(io_registry_entry_t entry, const io_name_t propertyName, io_struct_inband_t buffer, uint32_t *size)
{
  return _IORegistryEntryGetProperty(entry, propertyName, buffer, size);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::condition_variable::notify_one(std::condition_variable *this)
{
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
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

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return std::chrono::steady_clock::now();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return std::chrono::system_clock::now();
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dispatch_get_context(dispatch_object_t object)
{
  return _dispatch_get_context(object);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
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

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
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

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}