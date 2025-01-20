uint64_t IOCECInterfaceListenerGetTypeID()
{
  uint64_t result;

  result = __kIOCECInterfaceListenerTypeID;
  if (!__kIOCECInterfaceListenerTypeID)
  {
    pthread_once(&__IOCECInterfaceListenerTypeInit, (void (*)(void))__IOCECInterfaceListenerRegister);
    return __kIOCECInterfaceListenerTypeID;
  }
  return result;
}

uint64_t __IOCECInterfaceListenerRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIOCECInterfaceListenerTypeID = result;
  return result;
}

void *IOCECInterfaceListenerCreate()
{
  if (!__kIOCECInterfaceListenerTypeID) {
    pthread_once(&__IOCECInterfaceListenerTypeInit, (void (*)(void))__IOCECInterfaceListenerRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  v1 = (void *)Instance;
  if (Instance)
  {
    *(_OWORD *)(Instance + 16) = 0u;
    *(_OWORD *)(Instance + 32) = 0u;
    IONotificationPortRef v2 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
    v1[4] = v2;
    if (!v2)
    {
      CFRelease(v1);
      return 0;
    }
  }
  return v1;
}

uint64_t IOCECInterfaceListenerRegisterAddInterfaceCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = a3;
  return result;
}

uint64_t IOCECInterfaceListenerScheduleWithDispatchQueue(uint64_t a1, NSObject *a2)
{
  IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(a1 + 32), a2);
  io_iterator_t v3 = *(_DWORD *)(a1 + 40);
  if (!v3)
  {
    v4 = *(IONotificationPort **)(a1 + 32);
    CFDictionaryRef v5 = IOServiceMatching("IOCECService");
    uint64_t result = IOServiceAddMatchingNotification(v4, "IOServicePublish", v5, (IOServiceMatchingCallback)__IOCECInterfaceListenerPublishNotification, (void *)a1, (io_iterator_t *)(a1 + 40));
    if (result) {
      return result;
    }
    io_iterator_t v3 = *(_DWORD *)(a1 + 40);
  }
  return __IOCECInterfaceListenerPublishNotification((void *)a1, v3);
}

uint64_t __IOCECInterfaceListenerPublishNotification(void *a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    io_object_t v5 = result;
    do
    {
      int v6 = CFGetAllocator(a1);
      uint64_t v7 = IOCECInterfaceCreateWithService(v6, v5);
      if (v7)
      {
        v8 = (const void *)v7;
        v9 = (void (*)(void *, uint64_t, void))a1[2];
        if (v9) {
          v9(a1, v7, a1[3]);
        }
        CFRelease(v8);
      }
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      io_object_t v5 = result;
    }
    while (result);
  }
  return result;
}

void IOCECInterfaceListenerUnscheduleFromDispatchQueue(uint64_t a1)
{
}

void __IOCECInterfaceListenerFree(uint64_t a1)
{
  io_object_t v2 = *(_DWORD *)(a1 + 40);
  if (v2)
  {
    IOObjectRelease(v2);
    *(_DWORD *)(a1 + 40) = 0;
  }
  io_iterator_t v3 = *(IONotificationPort **)(a1 + 32);
  if (v3)
  {
    IONotificationPortDestroy(v3);
  }
}

uint64_t IOCECInterfaceGetTypeID()
{
  uint64_t result = __kIOCECInterfaceTypeID;
  if (!__kIOCECInterfaceTypeID)
  {
    pthread_once(&__IOCECInterfaceTypeInit, (void (*)(void))__IOCECInterfaceRegister);
    return __kIOCECInterfaceTypeID;
  }
  return result;
}

uint64_t __IOCECInterfaceRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIOCECInterfaceTypeID = result;
  return result;
}

uint64_t IOCECInterfaceCreate(int a1)
{
  CFDictionaryRef v2 = IOServiceMatching("IOCECService");
  if (!v2) {
    return 0;
  }
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v2);
  if (!MatchingService) {
    return 0;
  }
  io_object_t v4 = MatchingService;
  uint64_t v5 = IOCECInterfaceCreateWithService(a1, MatchingService);
  IOObjectRelease(v4);
  return v5;
}

uint64_t IOCECInterfaceCreateWithService(int a1, io_object_t object)
{
  if (!object || !IOObjectConformsTo(object, "IOCECService")) {
    return 0;
  }
  if (!__kIOCECInterfaceTypeID) {
    pthread_once(&__IOCECInterfaceTypeInit, (void (*)(void))__IOCECInterfaceRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v4 = Instance;
  if (Instance)
  {
    *(void *)(Instance + 112) = 0;
    *(_OWORD *)(Instance + 80) = 0u;
    *(_OWORD *)(Instance + 96) = 0u;
    *(_OWORD *)(Instance + 48) = 0u;
    *(_OWORD *)(Instance + 64) = 0u;
    *(_OWORD *)(Instance + 16) = 0u;
    *(_OWORD *)(Instance + 32) = 0u;
    mach_port_t NotificationPort = IODataQueueAllocateNotificationPort();
    *(_DWORD *)(v4 + 24) = NotificationPort;
    if (!NotificationPort
      || (*(_DWORD *)(v4 + 16) = object,
          IOObjectRetain(object),
          int v6 = IONotificationPortCreate(*MEMORY[0x263F0EC88]),
          (*(void *)(v4 + 72) = v6) == 0)
      || IOServiceAddInterestNotification(v6, object, "IOGeneralInterest", (IOServiceInterestCallback)__IOCECInterfaceGeneralInterestNotification, (void *)v4, (io_object_t *)(v4 + 80))|| IOServiceOpen(*(_DWORD *)(v4 + 16), *MEMORY[0x263EF8960], 0, (io_connect_t *)(v4 + 20))|| IOConnectCallScalarMethod(*(_DWORD *)(v4 + 20), 0, 0, 0, 0, 0))
    {
      CFRelease((CFTypeRef)v4);
      return 0;
    }
  }
  return v4;
}

uint64_t __IOCECInterfaceGeneralInterestNotification(uint64_t result, uint64_t a2, int a3)
{
  if (result && a3 == -536870896)
  {
    io_iterator_t v3 = *(uint64_t (**)(uint64_t, void))(result + 88);
    if (v3) {
      return v3(result, *(void *)(result + 96));
    }
  }
  return result;
}

uint64_t IOCECInterfaceOpenReceiveQueue(uint64_t a1, unsigned int a2, unsigned int a3)
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  uint64_t v4 = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 2u, input, 2u, 0, 0, 0, 0, 0, 0);
  if (!v4)
  {
    uint64_t v5 = MEMORY[0x2533C35E0](*(unsigned int *)(a1 + 20), 1, *(unsigned int *)(a1 + 24), 0);
    if (v5
      || (uint64_t v8 = 0,
          input[0] = 0,
          uint64_t v5 = MEMORY[0x2533C35D0](*(unsigned int *)(a1 + 20), 1, *MEMORY[0x263EF8960], input, &v8, 1),
          v5))
    {
      uint64_t v4 = v5;
    }
    else
    {
      uint64_t v6 = input[0];
      *(void *)(a1 + 32) = input[0];
      if (v6) {
        return 0;
      }
      uint64_t v4 = 3758097097;
    }
  }
  if (*(_DWORD *)(a1 + 24)) {
    MEMORY[0x2533C35E0](*(unsigned int *)(a1 + 20), 1, 0, 0);
  }
  return v4;
}

uint64_t IOCECInterfaceCloseReceiveQueue(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 104);
  if (v4) {
    IOCECInterfaceUnscheduleFromDispatchQueue(a1, v4);
  }
  if (*(void *)(a1 + 32))
  {
    MEMORY[0x2533C35F0](*(unsigned int *)(a1 + 20), 1, *MEMORY[0x263EF8960]);
    *(void *)(a1 + 32) = 0;
  }
  if (*(_DWORD *)(a1 + 24)) {
    MEMORY[0x2533C35E0](*(unsigned int *)(a1 + 20), 1, 0, 0);
  }
  mach_port_t v5 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v5, 3u, input, 1u, 0, 0, 0, 0, 0, 0);
}

void IOCECInterfaceUnscheduleFromDispatchQueue(uint64_t a1, uint64_t a2)
{
  CFDictionaryRef v2 = (void *)(a1 + 104);
  if (*(void *)(a1 + 104) == a2)
  {
    if (*(void *)(a1 + 112))
    {
      IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(a1 + 72), 0);
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 112));
      dispatch_release(*(dispatch_object_t *)(a1 + 112));
      *CFDictionaryRef v2 = 0;
      v2[1] = 0;
    }
  }
}

uint64_t IOCECInterfaceSetLogicalAddressMask(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x263EF8340];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 4u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOCECInterfaceSendFrame(uint64_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x263EF8340];
  mach_port_t v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 5u, input, 1u, inputStruct, 0x11uLL, 0, 0, 0, 0);
}

uint64_t IOCECInterfaceGetCECSnoopingEnabled(uint64_t a1, BOOL *a2)
{
  output[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = 3758097090;
  output[0] = 0;
  uint32_t outputCnt = 1;
  if (a2)
  {
    uint64_t v4 = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 6u, 0, 0, 0, 0, output, &outputCnt, 0, 0);
    if (v4)
    {
      return v4;
    }
    else if (outputCnt == 1)
    {
      uint64_t v2 = 0;
      *a2 = output[0] != 0;
    }
    else
    {
      return 3758097097;
    }
  }
  return v2;
}

CFTypeRef IOCECInterfaceCopyProperty(uint64_t a1, const __CFString *a2)
{
  return IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 16), a2, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

uint64_t IOCECInterfaceRegisterStatusCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 40) = a2;
  *(void *)(result + 48) = a3;
  return result;
}

uint64_t IOCECInterfaceRegisterReceiveCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 56) = a2;
  *(void *)(result + 64) = a3;
  return result;
}

uint64_t IOCECInterfaceRegisterTerminatedCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 88) = a2;
  *(void *)(result + 96) = a3;
  return result;
}

void IOCECInterfaceScheduleWithDispatchQueue(uint64_t a1, NSObject *a2)
{
  if (!*(void *)(a1 + 104))
  {
    CFRetain((CFTypeRef)a1);
    *(void *)(a1 + 112) = dispatch_source_create(MEMORY[0x263EF83C8], *(unsigned int *)(a1 + 24), 0, a2);
    dispatch_set_qos_class();
    dispatch_set_context(*(dispatch_object_t *)(a1 + 112), (void *)a1);
    dispatch_source_set_registration_handler_f(*(dispatch_source_t *)(a1 + 112), (dispatch_function_t)__IOCECInterfaceReceiveNotification);
    dispatch_source_set_event_handler_f(*(dispatch_source_t *)(a1 + 112), (dispatch_function_t)__IOCECInterfaceReceiveNotification);
    dispatch_source_set_cancel_handler_f(*(dispatch_source_t *)(a1 + 112), (dispatch_function_t)__IOCECInterfaceRxDispatchSourceCancelledNotification);
    IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(a1 + 72), a2);
    *(void *)(a1 + 104) = a2;
    uint64_t v4 = *(NSObject **)(a1 + 112);
    dispatch_resume(v4);
  }
}

intptr_t __IOCECInterfaceReceiveNotification(intptr_t result)
{
  data[3] = *MEMORY[0x263EF8340];
  memset(msg, 0, sizeof(msg));
  if (result)
  {
    intptr_t v1 = result;
    uint64_t result = *(void *)(result + 112);
    if (result)
    {
      uint64_t result = dispatch_source_testcancel((dispatch_source_t)result);
      if (!result)
      {
        mach_msg((mach_msg_header_t *)msg, 258, 0, 0x20u, *(_DWORD *)(v1 + 24), 0, 0);
        for (uint64_t result = IODataQueueDataAvailable(*(IODataQueueMemory **)(v1 + 32));
              result;
              uint64_t result = IODataQueueDataAvailable(*(IODataQueueMemory **)(v1 + 32)))
        {
          memset(data, 0, 18);
          uint32_t dataSize = 18;
          uint64_t result = IODataQueueDequeue(*(IODataQueueMemory **)(v1 + 32), data, &dataSize);
          if (result) {
            BOOL v2 = 0;
          }
          else {
            BOOL v2 = dataSize == 18;
          }
          if (!v2) {
            break;
          }
          if (LOBYTE(data[0]))
          {
            if (LOBYTE(data[0]) == 1)
            {
              mach_port_t v3 = *(void (**)(intptr_t, long long *, uint64_t))(v1 + 56);
              if (v3)
              {
                uint64_t v4 = *(void *)(v1 + 64);
                long long v7 = *(_OWORD *)((char *)data + 1);
                char v8 = BYTE1(data[2]);
                v3(v1, &v7, v4);
              }
            }
          }
          else if (*(void *)(v1 + 56))
          {
            (*(void (**)(intptr_t, BOOL, BOOL, void, void))(v1 + 40))(v1, BYTE1(data[0]) != 0, BYTE2(data[0]) != 0, *(unsigned __int16 *)((char *)data + 3), *(void *)(v1 + 48));
          }
        }
      }
    }
  }
  return result;
}

void __IOCECInterfaceRxDispatchSourceCancelledNotification(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

uint64_t __IOCECInterfaceFree(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 20))
  {
    IOCECInterfaceCloseReceiveQueue(a1, 0);
    IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 1u, 0, 0, 0, 0);
    IOServiceClose(*(_DWORD *)(a1 + 20));
    *(_DWORD *)(a1 + 20) = 0;
  }
  mach_port_name_t v2 = *(_DWORD *)(a1 + 24);
  if (v2)
  {
    mach_port_mod_refs(*MEMORY[0x263EF8960], v2, 1u, -1);
    *(_DWORD *)(a1 + 24) = 0;
  }
  io_object_t v3 = *(_DWORD *)(a1 + 80);
  if (v3)
  {
    IOObjectRelease(v3);
    *(_DWORD *)(a1 + 80) = 0;
  }
  uint64_t v4 = *(IONotificationPort **)(a1 + 72);
  if (v4)
  {
    IONotificationPortDestroy(v4);
    *(void *)(a1 + 72) = 0;
  }
  uint64_t result = *(unsigned int *)(a1 + 16);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *(_DWORD *)(a1 + 16) = 0;
  }
  return result;
}

uint64_t IOCECPhysicalAddressStringWithAddress(unsigned int a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  *(void *)__str = 0;
  int v1 = snprintf(__str, 8uLL, "%x.%x.%x.%x", a1 >> 12, (a1 >> 8) & 0xF, a1 >> 4, a1 & 0xF);
  if (v1 <= 0) {
    IOCECPhysicalAddressStringWithAddress_cold_1();
  }
  if (v1 >= 8) {
    IOCECPhysicalAddressStringWithAddress_cold_2();
  }
  return *(void *)__str;
}

uint64_t IOCECFrameStringWithFrame@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_WORD *)(a2 + 48) = 0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  uint64_t result = snprintf((char *)a2, 0x32uLL, "%*D", (*(unsigned char *)(a1 + 16) & 0xFu) + 1, a1, " ");
  if ((int)result <= 0) {
    IOCECFrameStringWithFrame_cold_1();
  }
  if (result >= 0x32) {
    IOCECFrameStringWithFrame_cold_2();
  }
  return result;
}

void IOCECPhysicalAddressStringWithAddress_cold_1()
{
}

void IOCECPhysicalAddressStringWithAddress_cold_2()
{
}

void IOCECFrameStringWithFrame_cold_1()
{
}

void IOCECFrameStringWithFrame_cold_2()
{
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectMapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x270EF3F58](*(void *)&connect, *(void *)&memoryType, *(void *)&intoTask, atAddress, ofSize, *(void *)&options);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x270EF3F78](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

kern_return_t IOConnectUnmapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x270EF3FC0](*(void *)&connect, *(void *)&memoryType, *(void *)&fromTask, atAddress);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return MEMORY[0x270EF3FD8]();
}

Boolean IODataQueueDataAvailable(IODataQueueMemory *dataQueue)
{
  return MEMORY[0x270EF3FE0](dataQueue);
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return MEMORY[0x270EF3FE8](dataQueue, data, dataSize);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
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

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x270EF4828](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
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

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
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

uint64_t dispatch_set_qos_class()
{
  return MEMORY[0x270ED94E8]();
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

void dispatch_source_set_registration_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x270ED9580](source);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}