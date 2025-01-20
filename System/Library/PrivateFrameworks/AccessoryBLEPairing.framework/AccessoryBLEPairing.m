void sub_220C97818(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  _Unwind_Resume(a1);
}

void sub_220C990D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t oobPairing_bleToOobPairingType(int a1)
{
  if (a1 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (a1) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t oobPairing_oobToBlePairingType(int a1)
{
  if (a1 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (a1) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t accessoryServer_registerAvailabilityChangedHandlerForServiceEntry(const char *a1, const void *a2, unsigned int a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v7 = &_os_log_internal;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
  }
  else
  {
    v7 = *(NSObject **)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "null";
    if (a1) {
      v8 = a1;
    }
    v11[0] = 67109378;
    v11[1] = a3;
    __int16 v12 = 2080;
    v13 = v8;
    _os_log_impl(&dword_220C96000, v7, OS_LOG_TYPE_DEFAULT, "Register AvailabilityChangedHandler (%d, %s)", (uint8_t *)v11, 0x12u);
  }
  uint64_t result = 0;
  if (a2 && a1 && a3 <= 1)
  {
    pthread_rwlock_wrlock(&_gServerAvailableTokenLock);
    _gNotificationName[a3] = a1;
    if (*((void *)&_gServerAvailabilityChangedHandler + a3))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v10 = *(NSObject **)gLogObjects;
      }
      else
      {
        v10 = &_os_log_internal;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
        }
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_1((const char **)&_gNotificationName[a3], a3, v10);
      }
      _Block_release(*((const void **)&_gServerAvailabilityChangedHandler + a3));
    }
    *((void *)&_gServerAvailabilityChangedHandler + a3) = _Block_copy(a2);
    pthread_rwlock_unlock(&_gServerAvailableTokenLock);
    return _SetupAvailabilityChangedHandlerForServiceEntry(a3);
  }
  return result;
}

uint64_t _SetupAvailabilityChangedHandlerForServiceEntry(unsigned int a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    v3 = &_os_log_internal;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
  }
  else
  {
    v3 = *(NSObject **)gLogObjects;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "_SetupAvailabilityChangedHandlerForServiceEntry";
    __int16 v17 = 1024;
    unsigned int v18 = a1;
    _os_log_impl(&dword_220C96000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d)", buf, 0x12u);
  }
  if (a1 > 1) {
    return 0;
  }
  pthread_rwlock_wrlock(&_gServerAvailableTokenLock);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v4 = *(NSObject **)gLogObjects;
  }
  else
  {
    v4 = &_os_log_internal;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
  }
  uint64_t v5 = a1;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = (const char *)_gNotificationName[a1];
    *(void *)&buf[4] = "_SetupAvailabilityChangedHandlerForServiceEntry";
    *(_DWORD *)buf = 136315650;
    if (!v6) {
      BOOL v6 = "null";
    }
    __int16 v17 = 1024;
    unsigned int v18 = a1;
    __int16 v19 = 2080;
    v20 = v6;
    _os_log_impl(&dword_220C96000, v4, OS_LOG_TYPE_INFO, "%s (%d, %s)", buf, 0x1Cu);
  }
  v7 = (const char *)_gNotificationName[a1];
  if (v7 && *((void *)&_gServerAvailabilityChangedHandler + a1))
  {
    v8 = (int *)((char *)&_gServerAvailableToken + 4 * a1);
    if (*v8 == -1
      || (notify_cancel(*v8),
          *((_DWORD *)&_gServerAvailableToken + a1) = -1,
          pthread_rwlock_unlock(&_gServerAvailableTokenLock),
          usleep(0x186A0u),
          pthread_rwlock_wrlock(&_gServerAvailableTokenLock),
          (v7 = (const char *)_gNotificationName[a1]) != 0)
      && *v8 == -1)
    {
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 0x40000000;
      handler[2] = ___SetupAvailabilityChangedHandlerForServiceEntry_block_invoke;
      handler[3] = &__block_descriptor_tmp;
      char v15 = a1;
      if (notify_register_dispatch(v7, (int *)&_gServerAvailableToken + a1, MEMORY[0x263EF83A0], handler))
      {
        _Block_release(*((const void **)&_gServerAvailabilityChangedHandler + a1));
        uint64_t v10 = 0;
        *((void *)&_gServerAvailabilityChangedHandler + v5) = 0;
        _gNotificationName[v5] = 0;
      }
      else
      {
        *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
        notify_get_state(*((_DWORD *)&_gServerAvailableToken + a1), (uint64_t *)buf);
        _gServerAvailable[a1] = *(void *)buf != 0;
        uint64_t v10 = 1;
      }
      goto LABEL_38;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v9 = *(NSObject **)gLogObjects;
    }
    else
    {
      uint64_t v9 = &_os_log_internal;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = (const char *)_gNotificationName[a1];
      int v12 = *((_DWORD *)&_gServerAvailableToken + a1);
      *(_DWORD *)buf = 136315906;
      if (!v11) {
        v11 = "null";
      }
      *(void *)&buf[4] = "_SetupAvailabilityChangedHandlerForServiceEntry";
      __int16 v17 = 1024;
      unsigned int v18 = a1;
      __int16 v19 = 2080;
      v20 = v11;
      __int16 v21 = 1024;
      BOOL v22 = v12 != -1;
      _os_log_impl(&dword_220C96000, v9, OS_LOG_TYPE_INFO, "%s did not register for notification (%d, %s), token (%d)", buf, 0x22u);
    }
  }
  uint64_t v10 = 0;
LABEL_38:
  pthread_rwlock_unlock(&_gServerAvailableTokenLock);
  return v10;
}

uint64_t accessoryServer_registerAvailabilityChangedHandler(const char *a1, const void *a2)
{
  return accessoryServer_registerAvailabilityChangedHandlerForServiceEntry(a1, a2, 0);
}

uint64_t accessoryServer_unregisterAvailabilityChangedHandlerForServiceEntry(uint64_t result)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (result <= 1)
  {
    unsigned int v1 = result;
    pthread_rwlock_wrlock(&_gServerAvailableTokenLock);
    if (gLogObjects) {
      BOOL v2 = gNumLogObjects < 1;
    }
    else {
      BOOL v2 = 1;
    }
    if (v2)
    {
      v3 = &_os_log_internal;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
    }
    else
    {
      v3 = *(NSObject **)gLogObjects;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (const char *)_gNotificationName[v1];
      uint64_t v5 = v1;
      if (!v4) {
        v4 = "null";
      }
      v8[0] = 67109378;
      v8[1] = v1;
      __int16 v9 = 2080;
      uint64_t v10 = v4;
      _os_log_impl(&dword_220C96000, v3, OS_LOG_TYPE_DEFAULT, "Unregister AvailabilityChangedHandler (%d, %s)", (uint8_t *)v8, 0x12u);
    }
    else
    {
      uint64_t v5 = v1;
    }
    int v6 = _gServerAvailableToken[v5];
    if (v6 != -1)
    {
      notify_cancel(v6);
      _gServerAvailableToken[v5] = -1;
    }
    v7 = (const void *)_gServerAvailabilityChangedHandler[v5];
    if (v7)
    {
      _Block_release(v7);
      _gServerAvailabilityChangedHandler[v5] = 0;
    }
    _gNotificationName[v5] = 0;
    return pthread_rwlock_unlock(&_gServerAvailableTokenLock);
  }
  return result;
}

uint64_t accessoryServer_unregisterAvailabilityChangedHandler()
{
  return accessoryServer_unregisterAvailabilityChangedHandlerForServiceEntry(0);
}

uint64_t accessoryServer_isServerAvailableForServiceEntry(unsigned int a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a1 > 1) {
    return 0;
  }
  pthread_rwlock_rdlock(&_gServerAvailableTokenLock);
  if (_gServerAvailableToken[a1] == -1)
  {
    v3 = (const char *)_gNotificationName[a1];
    if (!v3)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        int v6 = *(NSObject **)gLogObjects;
      }
      else
      {
        int v6 = &_os_log_internal;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
        }
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = (const char *)_gNotificationName[a1];
        *(void *)&state64[4] = "accessoryServer_isServerAvailableForServiceEntry";
        *(_DWORD *)state64 = 136315650;
        if (!v7) {
          v7 = "null";
        }
        __int16 v10 = 1024;
        unsigned int v11 = a1;
        __int16 v12 = 2080;
        v13 = v7;
        _os_log_impl(&dword_220C96000, v6, OS_LOG_TYPE_INFO, "%s cannot get server state (%d, %s)", state64, 0x1Cu);
      }
      uint64_t v4 = 0;
      goto LABEL_9;
    }
    int out_token = -1431655766;
    *(void *)state64 = 0xAAAAAAAAAAAAAAAALL;
    notify_register_check(v3, &out_token);
    notify_get_state(out_token, (uint64_t *)state64);
    notify_cancel(out_token);
    BOOL v2 = *(void *)state64 == 0;
  }
  else
  {
    BOOL v2 = _gServerAvailable[a1] == 0;
  }
  uint64_t v4 = !v2;
LABEL_9:
  pthread_rwlock_unlock(&_gServerAvailableTokenLock);
  return v4;
}

uint64_t accessoryServer_isServerAvailable()
{
  return accessoryServer_isServerAvailableForServiceEntry(0);
}

uint64_t accessoryServer_serverIsUnreachableForServiceEntry(uint64_t a1)
{
  if (a1 <= 1) {
    return _SetupAvailabilityChangedHandlerForServiceEntry(a1);
  }
  return a1;
}

uint64_t accessoryServer_serverIsUnreachable()
{
  return _SetupAvailabilityChangedHandlerForServiceEntry(0);
}

void init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 1, (uint64_t)_kLoggingModuleEntries);
  init_logging_signposts();
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  char v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_modules_onceToken != -1) {
    dispatch_once(&init_logging_modules_onceToken, block);
  }
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v2 = &off_220C9F000;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    int v6 = &_os_log_internal;
    do
    {
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_220C96000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
          uint64_t v7 = *(void *)(a1 + 32);
          v8 = "<Undefined>";
        }
      }
      __int16 v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        __int16 v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v16, v4, &v17);
          __int16 v9 = "<Undefined>";
        }
      }
      os_log_t v10 = os_log_create(v8, v9);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v13 = v8;
          __int16 v14 = 2080;
          char v15 = v9;
          _os_log_debug_impl(&dword_220C96000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        __int16 v14 = 2080;
        char v15 = v9;
        _os_log_error_impl(&dword_220C96000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    BOOL v2 = &off_220C9F000;
  }
  else
  {
    LODWORD(v11) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 119);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_220C96000, &_os_log_internal, OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(void *)(a1 + 40);
  gNumLogObjects = v11;
}

void init_logging_signposts()
{
}

void init_logging_signpost_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __init_logging_signpost_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_1;
  char v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_signpost_modules_onceToken != -1) {
    dispatch_once(&init_logging_signpost_modules_onceToken, block);
  }
}

void __init_logging_signpost_modules_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v2 = &off_220C9F000;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    int v6 = &_os_log_internal;
    do
    {
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_220C96000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
          uint64_t v7 = *(void *)(a1 + 32);
          v8 = "<Undefined>";
        }
      }
      __int16 v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        __int16 v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_signpost_modules_block_invoke_cold_1(v16, v4, &v17);
          __int16 v9 = "<Undefined>";
        }
      }
      os_log_t v10 = os_log_create(v8, v9);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v13 = v8;
          __int16 v14 = 2080;
          char v15 = v9;
          _os_log_debug_impl(&dword_220C96000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        __int16 v14 = 2080;
        char v15 = v9;
        _os_log_error_impl(&dword_220C96000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    BOOL v2 = &off_220C9F000;
  }
  else
  {
    LODWORD(v11) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 119);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_220C96000, &_os_log_internal, OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogSignpostObjects = *(void *)(a1 + 40);
  gNumLogSignpostObjects = v11;
}

void accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_1(const char **a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  if (!*a1) {
    uint64_t v3 = "null";
  }
  v4[0] = 67109378;
  v4[1] = a2;
  __int16 v5 = 2080;
  int v6 = v3;
  _os_log_fault_impl(&dword_220C96000, log, OS_LOG_TYPE_FAULT, "AccessoryServerAvailabilityChangedHandler already set! (%d, %s)", (uint8_t *)v4, 0x12u);
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_220C96000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_220C96000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFD8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF0](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}