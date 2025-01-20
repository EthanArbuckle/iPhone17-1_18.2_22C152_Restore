uint64_t BIMUpdaterGetTypeID()
{
  if (BIMUpdaterGetTypeID_onceToken != -1) {
    dispatch_once(&BIMUpdaterGetTypeID_onceToken, &__block_literal_global);
  }
  return BIMUpdaterGetTypeID_typeID;
}

uint64_t __BIMUpdaterGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  BIMUpdaterGetTypeID_typeID = result;
  return result;
}

uint64_t BIMUpdaterCreate(void *a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (BIMUpdaterGetTypeID_onceToken != -1) {
    dispatch_once(&BIMUpdaterGetTypeID_onceToken, &__block_literal_global);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance) {
    BIMUpdaterCreate_cold_1(&v20, v21);
  }
  uint64_t v9 = Instance;
  *(_WORD *)(Instance + 16) = 0;
  *(unsigned char *)(Instance + 18) = 0;
  *(_DWORD *)(Instance + 20) = 0;
  dispatch_queue_t v10 = dispatch_queue_create_with_target_V2("BIM-Queue", 0, v5);
  v11 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = v10;

  uint64_t v12 = MEMORY[0x24C572580](v6);
  v13 = *(void **)(v9 + 32);
  *(void *)(v9 + 32) = v12;

  uint64_t v14 = MEMORY[0x24C572580](v7);
  v15 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v14;

  mach_port_t v16 = *MEMORY[0x263F0EC88];
  *(void *)(v9 + 48) = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
  *(_DWORD *)(v9 + 56) = 0;
  *(void *)(v9 + 64) = IONotificationPortCreate(v16);
  *(void *)(v9 + 72) = 0;
  v17 = *(void **)(v9 + 80);
  *(void *)(v9 + 80) = 0;

  v18 = *(void **)(v9 + 88);
  *(void *)(v9 + 88) = 0;

  if (!*(void *)(v9 + 24)
    || !*(void *)(v9 + 32)
    || !*(void *)(v9 + 40)
    || !*(void *)(v9 + 48)
    || !*(void *)(v9 + 64))
  {
    BIMUpdaterCreate_cold_2(&v20, v21);
  }

  return v9;
}

uint64_t BIMUpdaterActivate(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  if (*(unsigned char *)(a1 + 16)) {
    BIMUpdaterActivate_cold_1(&v8, v9);
  }
  *(unsigned char *)(a1 + 16) = 1;
  IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(a1 + 48), *(dispatch_queue_t *)(a1 + 24));
  IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(a1 + 64), *(dispatch_queue_t *)(a1 + 24));
  IOServiceAddMatchingNotification(*(IONotificationPortRef *)(a1 + 48), "IOServiceFirstPublish", (CFDictionaryRef)&unk_26FC37D00, (IOServiceMatchingCallback)__eepromServiceCB, (void *)a1, (io_iterator_t *)(a1 + 56));
  CFRetain((CFTypeRef)a1);
  v3 = *(NSObject **)(a1 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __BIMUpdaterActivate_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);
  IOServiceAddMatchingNotification(*(IONotificationPortRef *)(a1 + 64), "IOServiceFirstPublish", (CFDictionaryRef)&unk_26FC37D50, (IOServiceMatchingCallback)__afkServiceCB, (void *)a1, (io_iterator_t *)(a1 + 72));
  CFRetain((CFTypeRef)a1);
  v4 = *(NSObject **)(a1 + 24);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __BIMUpdaterActivate_block_invoke_2;
  v6[3] = &__block_descriptor_40_e5_v8__0l;
  v6[4] = a1;
  dispatch_async(v4, v6);
  os_unfair_lock_unlock(v2);
  return 1;
}

uint64_t __eepromServiceCB(uint64_t a1, io_iterator_t iterator)
{
  kern_return_t v7;
  kern_return_t v8;
  NSObject *v9;
  uint8_t buf[4];
  kern_return_t v11;
  uint64_t v12;

  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    io_service_t v5 = result;
    id v6 = (task_port_t *)MEMORY[0x263EF8960];
    while (1)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
      if (*(unsigned char *)(a1 + 17) || *(_DWORD *)(a1 + 76) || *(void *)(a1 + 80)) {
        goto LABEL_13;
      }
      id v7 = IOServiceOpen(v5, *v6, 0, (io_connect_t *)(a1 + 76));
      if (v7) {
        break;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_8:
      uint64_t result = IOIteratorNext(iterator);
      io_service_t v5 = result;
      if (!result) {
        return result;
      }
    }
    uint64_t v8 = v7;
    uint64_t v9 = os_log_create("AppleEmbeddedDisplayServices", "BIMUpdate");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v11 = v8;
      _os_log_error_impl(&dword_247F87000, v9, OS_LOG_TYPE_ERROR, "Failed to connect to EEPROM service: 0x%x", buf, 8u);
    }

LABEL_13:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
    goto LABEL_8;
  }
  return result;
}

void __BIMUpdaterActivate_block_invoke(uint64_t a1)
{
  __eepromServiceCB(*(void *)(a1 + 32), *(_DWORD *)(*(void *)(a1 + 32) + 56));
  v2 = *(const void **)(a1 + 32);
  CFRelease(v2);
}

uint64_t __afkServiceCB(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v5 = result;
    while (1)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
      if (*(unsigned char *)(a1 + 17) || *(void *)(a1 + 80) || *(_DWORD *)(a1 + 76)) {
        goto LABEL_13;
      }
      uint64_t v6 = [MEMORY[0x263F20840] withService:v5];
      id v7 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v6;

      uint64_t v8 = *(void **)(a1 + 80);
      if (!v8) {
        break;
      }
      [v8 setDispatchQueue:*(void *)(a1 + 24)];
      CFRetain((CFTypeRef)a1);
      uint64_t v9 = *(void **)(a1 + 80);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = ____afkConnect_block_invoke;
      v11[3] = &__block_descriptor_40_e46_v32__0__AFKEndpointInterface_8__NSString_16_24l;
      v11[4] = a1;
      [v9 setEventHandler:v11];
      [*(id *)(a1 + 80) activate:0];
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_8:
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
      if (!result) {
        return result;
      }
    }
    uint64_t v10 = os_log_create("AppleEmbeddedDisplayServices", "BIMUpdate");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __afkServiceCB_cold_1(&buf, v13, v10);
    }

LABEL_13:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
    goto LABEL_8;
  }
  return result;
}

void __BIMUpdaterActivate_block_invoke_2(uint64_t a1)
{
  __afkServiceCB(*(void *)(a1 + 32), *(_DWORD *)(*(void *)(a1 + 32) + 72));
  v2 = *(const void **)(a1 + 32);
  CFRelease(v2);
}

void BIMUpdaterCancel(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  if (!*(unsigned char *)(a1 + 16) || *(unsigned char *)(a1 + 17))
  {
    void block[5] = 0;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    int v6 = *(unsigned __int8 *)(a1 + 16);
    int v7 = *(unsigned __int8 *)(a1 + 17);
    int v9 = 67109376;
    int v10 = v6;
    __int16 v11 = 1024;
    int v12 = v7;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
  *(unsigned char *)(a1 + 17) = 1;
  IONotificationPortDestroy(*(IONotificationPortRef *)(a1 + 48));
  IONotificationPortDestroy(*(IONotificationPortRef *)(a1 + 64));
  io_connect_t v3 = *(_DWORD *)(a1 + 76);
  if (v3) {
    IOServiceClose(v3);
  }
  v4 = *(void **)(a1 + 80);
  if (v4)
  {
    [v4 cancel];
  }
  else
  {
    CFRetain((CFTypeRef)a1);
    uint64_t v5 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __BIMUpdaterCancel_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_async(v5, block);
  }
  os_unfair_lock_unlock(v2);
}

void __BIMUpdaterCancel_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
  v2 = *(const void **)(a1 + 32);
  CFRelease(v2);
}

uint64_t BIMUpdaterStartUpdate(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  if (!*(unsigned char *)(a1 + 16) || *(unsigned char *)(a1 + 17) || *(unsigned char *)(a1 + 18))
  {
    memset(v20, 0, sizeof(v20));
    os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    int v12 = *(unsigned __int8 *)(a1 + 16);
    int v13 = *(unsigned __int8 *)(a1 + 17);
    int v14 = *(unsigned __int8 *)(a1 + 18);
    LODWORD(v15) = 67109632;
    HIDWORD(v15) = v12;
    __int16 v16 = 1024;
    int v17 = v13;
    __int16 v18 = 1024;
    int v19 = v14;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v3 = *(void *)(a1 + 80);
  if (*(_DWORD *)(a1 + 76))
  {
    if (!v3)
    {
LABEL_12:
      *(unsigned char *)(a1 + 18) = 1;
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  if (v3)
  {
LABEL_8:
    id v4 = [MEMORY[0x263F15778] mainDisplay];
    if (v4)
    {
      uint64_t v5 = v4;

      id v6 = [v5 stateControl];
      if (!v6) {
        BIMUpdaterStartUpdate_cold_2(&v15, v20);
      }
      int v7 = v6;

      uint64_t v8 = [v7 createPowerAssertionWithReason:4 identifier:@"BIM Display Power Assertion"];
      int v9 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v8;

      id v10 = *(id *)(a1 + 88);
      if (!v10) {
        BIMUpdaterStartUpdate_cold_3(&v15, v20);
      }

      [*(id *)(a1 + 88) acquireAndWaitForPowerOn];
      goto LABEL_12;
    }
LABEL_15:
    BIMUpdaterStartUpdate_cold_1(&v15, v20);
  }
LABEL_13:
  os_unfair_lock_unlock(v2);
  return *(unsigned __int8 *)(a1 + 18);
}

BOOL BIMUpdaterEndUpdate(uint64_t a1)
{
  v2 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  if (!*(unsigned char *)(a1 + 16) || *(unsigned char *)(a1 + 17) || !*(unsigned char *)(a1 + 18))
  {
    os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
  uint64_t v3 = *(void *)(a1 + 80);
  if (*(_DWORD *)(a1 + 76))
  {
    if (!v3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v3)
  {
LABEL_8:
    [*(id *)(a1 + 88) cancel];
    [*(id *)(a1 + 88) invalidate];
    id v4 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = 0;

LABEL_9:
    *(unsigned char *)(a1 + 18) = 0;
  }
  os_unfair_lock_unlock(v2);
  return *(unsigned char *)(a1 + 18) == 0;
}

uint64_t BIMUpdaterRead(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  size_t v14 = 32;
  uint64_t input = a2;
  uint64_t v5 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  if (!*(unsigned char *)(a1 + 16) || *(unsigned char *)(a1 + 17))
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = 0u;
    uint64_t v5 = (os_unfair_lock_s *)&_os_log_internal;
    os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    int v11 = *(unsigned __int8 *)(a1 + 16);
    int v12 = *(unsigned __int8 *)(a1 + 17);
    int v16 = 67109376;
    int v17 = v11;
    __int16 v18 = 1024;
    int v19 = v12;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
    goto LABEL_10;
  }
  mach_port_t v6 = *(_DWORD *)(a1 + 76);
  if (!v6)
  {
    uint64_t v8 = *(void **)(a1 + 80);
    if (v8)
    {
      LODWORD(v13) = 0;
      uint64_t v7 = [v8 enqueueCommandSync:193 timestamp:mach_continuous_time() inputBuffer:&input inputBufferSize:8 responseTimestamp:0 outputBuffer:a3 inOutBufferSize:&v14 options:v13];
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v9 = 3758097112;
    goto LABEL_8;
  }
  uint64_t v7 = IOConnectCallMethod(v6, 1u, &input, 1u, 0, 0, 0, 0, a3, &v14);
LABEL_7:
  uint64_t v9 = v7;
LABEL_8:
  os_unfair_lock_unlock(v5);
  return v9;
}

uint64_t BIMUpdaterWrite(uint64_t a1, uint64_t a2, long long *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v18 = 0;
  uint64_t input = a2;
  uint64_t v15 = a2;
  long long v5 = a3[1];
  long long v16 = *a3;
  long long v17 = v5;
  mach_port_t v6 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  if (!*(unsigned char *)(a1 + 16) || *(unsigned char *)(a1 + 17))
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v24 = 0u;
    mach_port_t v6 = (os_unfair_lock_s *)&_os_log_internal;
    os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    int v12 = *(unsigned __int8 *)(a1 + 16);
    int v13 = *(unsigned __int8 *)(a1 + 17);
    int v20 = 67109376;
    int v21 = v12;
    __int16 v22 = 1024;
    int v23 = v13;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
    goto LABEL_10;
  }
  mach_port_t v7 = *(_DWORD *)(a1 + 76);
  if (!v7)
  {
    uint64_t v9 = *(void **)(a1 + 80);
    if (v9)
    {
      LODWORD(v14) = 0;
      uint64_t v8 = [v9 enqueueCommandSync:194 timestamp:mach_continuous_time() inputBuffer:&v15 inputBufferSize:40 responseTimestamp:0 outputBuffer:0 inOutBufferSize:&v18 options:v14];
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v10 = 3758097112;
    goto LABEL_8;
  }
  uint64_t v8 = IOConnectCallMethod(v7, 0, &input, 1u, a3, 0x20uLL, 0, 0, 0, 0);
LABEL_7:
  uint64_t v10 = v8;
LABEL_8:
  os_unfair_lock_unlock(v6);
  return v10;
}

void __finalize(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  CFTypeID v2 = CFGetTypeID((CFTypeRef)a1);
  if (BIMUpdaterGetTypeID_onceToken != -1) {
    dispatch_once(&BIMUpdaterGetTypeID_onceToken, &__block_literal_global);
  }
  if (v2 != BIMUpdaterGetTypeID_typeID) {
    __finalize_cold_2(&v8, v9);
  }
  if (*(unsigned char *)(a1 + 16))
  {
    if (!*(unsigned char *)(a1 + 17)) {
      __finalize_cold_1(&v8, v9);
    }
  }
  else
  {
    IONotificationPortDestroy(*(IONotificationPortRef *)(a1 + 48));
    IONotificationPortDestroy(*(IONotificationPortRef *)(a1 + 64));
  }
  IOObjectRelease(*(_DWORD *)(a1 + 56));
  IOObjectRelease(*(_DWORD *)(a1 + 72));
  uint64_t v3 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = 0;

  id v4 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = 0;

  long long v5 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = 0;

  *(void *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  mach_port_t v6 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = 0;

  mach_port_t v7 = *(void **)(a1 + 88);
  *(void *)(a1 + 88) = 0;
}

void ____afkConnect_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if ([a3 isEqual:*MEMORY[0x263F20848]])
  {
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
    id v4 = *(const void **)(a1 + 32);
    CFRelease(v4);
  }
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return _os_crash_msg();
}

BOOL OUTLINED_FUNCTION_4()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void BIMUpdaterCreate_cold_1(void *a1, _OWORD *a2)
{
}

void BIMUpdaterCreate_cold_2(void *a1, _OWORD *a2)
{
}

void BIMUpdaterActivate_cold_1(void *a1, _OWORD *a2)
{
}

void __afkServiceCB_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_247F87000, log, OS_LOG_TYPE_ERROR, "Failed to create AFKEndpointInterface", buf, 2u);
}

void BIMUpdaterStartUpdate_cold_1(void *a1, _OWORD *a2)
{
}

void BIMUpdaterStartUpdate_cold_2(void *a1, _OWORD *a2)
{
}

void BIMUpdaterStartUpdate_cold_3(void *a1, _OWORD *a2)
{
}

void __finalize_cold_1(void *a1, _OWORD *a2)
{
}

void __finalize_cold_2(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  CFTypeID v2 = (const void *)OUTLINED_FUNCTION_3();
  __break(1u);
  CFGetTypeID(v2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
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

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x270EF4A88](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
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

uint64_t _os_crash_msg()
{
  return MEMORY[0x270ED8068]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}