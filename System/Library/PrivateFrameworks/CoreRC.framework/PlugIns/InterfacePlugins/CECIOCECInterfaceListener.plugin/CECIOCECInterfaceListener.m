id sub_1DC4(uint64_t a1, void *a2)
{
  void v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2A14;
  v3[3] = &unk_41B0;
  v3[4] = a2;
  v3[5] = a1;
  return [a2 dispatchAsyncHighPriority:v3];
}

id sub_1E34(int a1, unsigned char *__src, void *a3)
{
  long long __dst = 0uLL;
  int v10 = 0;
  if (gLogCategory_CoreRCInterface <= 10
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  char v5 = (__src[16] & 0xF) + 1;
  memcpy(&__dst, __src, (__src[16] & 0xF) + 1);
  LOBYTE(v10) = v5;
  long long v7 = __dst;
  int v8 = v10;
  return [a3 receivedFrame:&v7];
}

id sub_1F48(uint64_t a1, char a2, char a3, __int16 a4, void *a5)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2A20;
  v6[3] = &unk_41D8;
  v6[4] = a5;
  __int16 v7 = a4;
  char v8 = a2;
  char v9 = a3;
  return [a5 dispatchAsyncHighPriority:v6];
}

id sub_1FC4(uint64_t a1)
{
  uint64_t v9 = 0;
  if ((objc_msgSend(*(id *)(a1 + 32), "setHardwareAddressMask:error:", objc_msgSend(*(id *)(a1 + 32), "addressMask"), &v9) & 1) == 0&& gLogCategory_CoreRCInterface <= 90&& (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = v9;
    LogPrintF();
  }
  uint64_t CECSnoopingEnabled = IOCECInterfaceGetCECSnoopingEnabled();
  if (!CECSnoopingEnabled) {
    return objc_msgSend(*(id *)(a1 + 32), "setSnoopingMode:error:", 0, 0, v5, v7, v8);
  }
  if (gLogCategory_CoreRCInterface > 60) {
    return objc_msgSend(*(id *)(a1 + 32), "setSnoopingMode:error:", 0, 0, v5, v7, v8);
  }
  uint64_t v3 = CECSnoopingEnabled;
  if (gLogCategory_CoreRCInterface == -1 && !_LogCategory_Initialize()) {
    return objc_msgSend(*(id *)(a1 + 32), "setSnoopingMode:error:", 0, 0, v5, v7, v8);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  LogPrintF();
  return objc_msgSend(*(id *)(a1 + 32), "setSnoopingMode:error:", 0, 0, v6, "-[CECIOCECInterface _open]_block_invoke", v3);
}

id sub_2104(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interfaceTerminated:*(void *)(*(void *)(a1 + 32) + 32)];
}

id sub_2A14(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interfaceTerminated:*(void *)(a1 + 40)];
}

id sub_2A20(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStatusWithPhysicalAddress:*(unsigned __int16 *)(a1 + 40) HPD:*(unsigned __int8 *)(a1 + 42) hibernate:*(unsigned __int8 *)(a1 + 43)];
}

id sub_2BD8(uint64_t a1, uint64_t a2, void *a3)
{
  if (gLogCategory_CoreRCInterface <= 50
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return [a3 addIOCECInterface:a2];
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

uint64_t IOCECInterfaceCloseReceiveQueue()
{
  return _IOCECInterfaceCloseReceiveQueue();
}

uint64_t IOCECInterfaceGetCECSnoopingEnabled()
{
  return _IOCECInterfaceGetCECSnoopingEnabled();
}

uint64_t IOCECInterfaceListenerCreate()
{
  return _IOCECInterfaceListenerCreate();
}

uint64_t IOCECInterfaceListenerRegisterAddInterfaceCallback()
{
  return _IOCECInterfaceListenerRegisterAddInterfaceCallback();
}

uint64_t IOCECInterfaceOpenReceiveQueue()
{
  return _IOCECInterfaceOpenReceiveQueue();
}

uint64_t IOCECInterfaceRegisterReceiveCallback()
{
  return _IOCECInterfaceRegisterReceiveCallback();
}

uint64_t IOCECInterfaceRegisterStatusCallback()
{
  return _IOCECInterfaceRegisterStatusCallback();
}

uint64_t IOCECInterfaceRegisterTerminatedCallback()
{
  return _IOCECInterfaceRegisterTerminatedCallback();
}

uint64_t IOCECInterfaceScheduleWithDispatchQueue()
{
  return _IOCECInterfaceScheduleWithDispatchQueue();
}

uint64_t IOCECInterfaceSendFrame()
{
  return _IOCECInterfaceSendFrame();
}

uint64_t IOCECInterfaceSetLogicalAddressMask()
{
  return _IOCECInterfaceSetLogicalAddressMask();
}

uint64_t IOCECInterfaceUnscheduleFromDispatchQueue()
{
  return _IOCECInterfaceUnscheduleFromDispatchQueue();
}

uint64_t LogPrintF()
{
  return _LogPrintF();
}

uint64_t _LogCategory_Initialize()
{
  return __LogCategory_Initialize();
}

void dispatch_activate(dispatch_object_t object)
{
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return _dispatch_workloop_create_inactive(label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return _dispatch_workloop_set_scheduler_priority();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_release(id a1)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

id objc_msgSend__close(void *a1, const char *a2, ...)
{
  return [a1 _close];
}

id objc_msgSend_addressMask(void *a1, const char *a2, ...)
{
  return [a1 addressMask];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_hibernate(void *a1, const char *a2, ...)
{
  return [a1 hibernate];
}

id objc_msgSend_receiveWorkloop(void *a1, const char *a2, ...)
{
  return [a1 receiveWorkloop];
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return [a1 serialQueue];
}

id objc_msgSend_setSnoopingMode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSnoopingMode:error:");
}