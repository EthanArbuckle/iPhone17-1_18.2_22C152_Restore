void init_logging_signposts()
{
  init_logging_signpost_modules((uint64_t)&_gLogSignpostObjects, 4, (uint64_t)_kLoggingSignpostModuleEntries);
}

void init_logging_signpost_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __init_logging_signpost_modules_block_invoke;
  block[3] = &__block_descriptor_tmp;
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
  v2 = &loc_222CAE000;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    v6 = MEMORY[0x263EF8438];
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
          _os_log_error_impl(&dword_222C9E000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
          uint64_t v7 = *(void *)(a1 + 32);
          v8 = "<Undefined>";
        }
      }
      v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_signpost_modules_block_invoke_cold_1(v16, v4, &v17);
          v9 = "<Undefined>";
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
          v15 = v9;
          _os_log_debug_impl(&dword_222C9E000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        __int16 v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_222C9E000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = (void *)&loc_222CAE000;
  }
  else
  {
    LODWORD(v11) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = v2[497];
    LODWORD(v13) = v5;
    _os_log_impl(&dword_222C9E000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogSignpostObjects = *(void *)(a1 + 40);
  gNumLogSignpostObjects = v11;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void __CardReaderClassMatch(void *a1, uint64_t a2)
{
  kern_return_t v19;
  kern_return_t v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  io_service_t v26;
  kern_return_t v27;
  kern_return_t v28;
  uint64_t v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  int v33;
  __CFRunLoop *Main;
  __CFRunLoopSource *RunLoopSource;
  NSObject *v36;
  NSObject *v37;
  const char *v38;
  NSObject *v39;
  uint64_t v40;
  int v41;
  NSObject *v42;
  int v43;
  id v44;
  CFStringRef mode;
  uint8_t v46;
  char v47[15];
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x263EF8340];
  unint64_t v4 = +[IAPUIDManager sharedIAPUIDManager];
  id v5 = (id)[v4 objectForIAPUID:a1];

  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    v8 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v49 = (uint64_t)a1;
    _os_log_impl(&dword_222C9E000, v8, OS_LOG_TYPE_INFO, "uidForNotification = %lu", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    uint64_t v9 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v49 = (uint64_t)v5;
    _os_log_impl(&dword_222C9E000, v9, OS_LOG_TYPE_INFO, "pUSBMonitor=%@", buf, 0xCu);
  }

  if (v5)
  {
    MEMORY[0x223CA5E80](a2);
    io_object_t v11 = IOIteratorNext(a2);
    if (v11)
    {
      io_object_t v12 = v11;
      mode = (const __CFString *)*MEMORY[0x263EFFE88];
      v13 = MEMORY[0x263EF8438];
      while (1)
      {
        io_object_t v14 = *((_DWORD *)v5 + 11);
        if (v14 == v12)
        {
          uint64_t v15 = gLogObjects;
          int v16 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v17 = gNumLogObjects < 1;
          }
          else {
            BOOL v17 = 1;
          }
          if (v17)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v49 = v15;
              v50 = 1024;
              v51 = v16;
              _os_log_error_impl(&dword_222C9E000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            uint64_t v18 = v13;
            v24 = v13;
          }
          else
          {
            v24 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v49) = v12;
            _os_log_error_impl(&dword_222C9E000, v24, OS_LOG_TYPE_ERROR, "ERROR - already registered, service=%x", buf, 8u);
          }
          goto LABEL_65;
        }
        if (v14) {
          IOObjectRelease(v14);
        }
        *((_DWORD *)v5 + 11) = v12;
        v19 = IOObjectRetain(v12);
        if (v19)
        {
          v20 = v19;
          v21 = gLogObjects;
          v22 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v23 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v49 = v21;
              v50 = 1024;
              v51 = v22;
              _os_log_error_impl(&dword_222C9E000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v25 = v13;
            v23 = v13;
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v49) = v20;
            _os_log_error_impl(&dword_222C9E000, v23, OS_LOG_TYPE_ERROR, "ERROR - IOObjectRetain failed %#x", buf, 8u);
          }
        }
        v24 = v5;
        v26 = *((_DWORD *)v5 + 11);
        if (!v26) {
          break;
        }
        v27 = IOServiceAddInterestNotification(*((IONotificationPortRef *)v5 + 4), v26, "IOGeneralInterest", (IOServiceInterestCallback)__USBCardReaderInterest, *((void **)v5 + 7), (io_object_t *)v5 + 10);
        if (v27)
        {
          v28 = v27;
          v29 = gLogObjects;
          v30 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v31 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v49 = v29;
              v50 = 1024;
              v51 = v30;
              _os_log_error_impl(&dword_222C9E000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v36 = v13;
            v31 = v13;
          }
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v49) = v28;
            v37 = v31;
            v38 = "ERROR - Couldn't add interest notification %#x";
            goto LABEL_76;
          }
          goto LABEL_64;
        }
        if (!IONotificationPortGetRunLoopSource(*((IONotificationPortRef *)v5 + 4)))
        {
          v40 = gLogObjects;
          v41 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v31 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v49 = v40;
              v50 = 1024;
              v51 = v41;
              _os_log_error_impl(&dword_222C9E000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v42 = v13;
            v31 = v13;
          }
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            __CardReaderClassMatch_cold_3(&v46, v47, v31);
          }
          goto LABEL_64;
        }
        Main = CFRunLoopGetMain();
        RunLoopSource = IONotificationPortGetRunLoopSource(*((IONotificationPortRef *)v5 + 4));
        CFRunLoopAddSource(Main, RunLoopSource, mode);
LABEL_65:

        IOObjectRelease(v12);
        io_object_t v12 = IOIteratorNext(a2);
        if (!v12) {
          goto LABEL_85;
        }
      }
      v32 = gLogObjects;
      v33 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v31 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v49 = v32;
          v50 = 1024;
          v51 = v33;
          _os_log_error_impl(&dword_222C9E000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v39 = v13;
        v31 = v13;
      }
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        goto LABEL_64;
      }
      v43 = *((_DWORD *)v5 + 11);
      *(_DWORD *)buf = 67109120;
      LODWORD(v49) = v43;
      v37 = v31;
      v38 = "ERROR: Class instance == NULL or _ioUSBCardReaderService(0x%x) = NULL !\n";
LABEL_76:
      _os_log_error_impl(&dword_222C9E000, v37, OS_LOG_TYPE_ERROR, v38, buf, 8u);
LABEL_64:

      goto LABEL_65;
    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v5 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      id v5 = (id)MEMORY[0x263EF8438];
      v44 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      __CardReaderClassMatch_cold_1();
    }
  }
LABEL_85:
}

void __CardReaderClassTerminate(void *a1, uint64_t a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  unint64_t v4 = +[IAPUIDManager sharedIAPUIDManager];
  id v5 = (id)[v4 objectForIAPUID:a1];

  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    v8 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v29 = (uint64_t)a1;
    _os_log_impl(&dword_222C9E000, v8, OS_LOG_TYPE_INFO, "uidForNotification = %lu", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    uint64_t v9 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v29 = (uint64_t)v5;
    _os_log_impl(&dword_222C9E000, v9, OS_LOG_TYPE_INFO, "pUSBMonitor=%@", buf, 0xCu);
  }

  if (v5)
  {
    MEMORY[0x223CA5E80](a2);
    io_object_t v11 = IOIteratorNext(a2);
    if (v11)
    {
      io_object_t v13 = v11;
      io_object_t v14 = MEMORY[0x263EF8438];
      *(void *)&long long v12 = 134218240;
      long long v27 = v12;
      do
      {
        if (*((_DWORD *)v5 + 11) == v13)
        {
          id v15 = v5;
          io_object_t v16 = *((_DWORD *)v5 + 11);
          if (v16)
          {
            IOObjectRelease(v16);
            *((_DWORD *)v5 + 11) = 0;
            io_object_t v17 = *((_DWORD *)v5 + 10);
            if (v17)
            {
              IOObjectRelease(v17);
              *((_DWORD *)v5 + 10) = 0;
            }
            objc_msgSend(*((id *)v5 + 1), "removeAllObjects", v27);
            uint64_t v18 = [NSNumber numberWithInt:2];
            v19 = [*((id *)v5 + 2) objectForKey:v18];
            if (!v19
              || (int v20 = [v15 getFaultState:2], v20 != objc_msgSend(v19, "BOOLValue")))
            {
              [v15 sendUSBFaultNotification];
            }
          }
          else
          {
            uint64_t v21 = gLogObjects;
            int v22 = gNumLogObjects;
            if (gLogObjects) {
              BOOL v23 = gNumLogObjects < 1;
            }
            else {
              BOOL v23 = 1;
            }
            if (v23)
            {
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v27;
                uint64_t v29 = v21;
                __int16 v30 = 1024;
                int v31 = v22;
                _os_log_error_impl(&dword_222C9E000, v14, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v24 = v14;
              uint64_t v18 = v14;
            }
            else
            {
              uint64_t v18 = *(id *)gLogObjects;
            }
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              int v25 = *((_DWORD *)v5 + 11);
              *(_DWORD *)buf = 67109120;
              LODWORD(v29) = v25;
              _os_log_error_impl(&dword_222C9E000, v18, OS_LOG_TYPE_ERROR, "ERROR: Class instance == NULL or _ioUSBCardReaderService(0x%x) = NULL !\n", buf, 8u);
            }
          }
        }
        IOObjectRelease(v13);
        io_object_t v13 = IOIteratorNext(a2);
      }
      while (v13);
    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v5 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      id v5 = (id)MEMORY[0x263EF8438];
      id v26 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      __CardReaderClassMatch_cold_1();
    }
  }
}

void __USBCardReaderInterest(_DWORD *a1, uint64_t a2, int a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v6 = +[IAPUIDManager sharedIAPUIDManager];
  id v7 = (_DWORD *)[v6 objectForIAPUID:a1];

  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    id v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    id v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v16 = 134217984;
    io_object_t v17 = a1;
    _os_log_impl(&dword_222C9E000, v10, OS_LOG_TYPE_INFO, "uidForNotification = %lu", (uint8_t *)&v16, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    io_object_t v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    io_object_t v11 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    io_object_t v17 = v7;
    _os_log_impl(&dword_222C9E000, v11, OS_LOG_TYPE_INFO, "pUSBMonitor=%@", (uint8_t *)&v16, 0xCu);
  }

  if (!v7 || !v7[11])
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      io_object_t v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      io_object_t v13 = MEMORY[0x263EF8438];
      id v14 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __USBCardReaderInterest_cold_1();
    }
    goto LABEL_32;
  }
  if (!a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      io_object_t v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      io_object_t v13 = MEMORY[0x263EF8438];
      id v15 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __USBCardReaderInterest_cold_3();
    }
LABEL_32:

    goto LABEL_33;
  }
  if (a3 == -413532160) {
    [v7 checkUSBCardReaderProperty:a2];
  }
LABEL_33:
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

uint64_t __USBCameraKitHubGetPortCurAllocation(uint64_t entry)
{
  uint64_t v1 = entry;
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (entry)
  {
    io_registry_entry_t child = -1431655766;
    if (IORegistryEntryGetChildEntry(entry, "IOService", &child))
    {
      return 0;
    }
    else
    {
      v2 = +[USBCameraKitHubMonitor sharedMonitor];
      io_registry_entry_t object = -1431655766;
      if (IORegistryEntryGetChildEntry(child, "IOService", &object))
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          uint64_t v3 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            __29__SleepAssertionManager_init__block_invoke_cold_1();
          }
          uint64_t v3 = MEMORY[0x263EF8438];
          id v6 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = [v2 ioUSB30CameraKitHubService];
          unsigned int valuePtr = 67109888;
          if (v7 == v1) {
            int v8 = 2;
          }
          else {
            int v8 = 3;
          }
          int v17 = v1;
          __int16 v18 = 1024;
          int v19 = v8;
          __int16 v20 = 1024;
          io_registry_entry_t v21 = child;
          __int16 v22 = 1024;
          int v23 = 0;
          _os_log_impl(&dword_222C9E000, v3, OS_LOG_TYPE_DEFAULT, "__USBCameraKitHubGetPortCurAllocation: failed to get child kIOUSBPlane, service=%d(%d) child=%d, result=%d", (uint8_t *)&valuePtr, 0x1Au);
        }

        uint64_t v1 = 0;
      }
      else
      {
        CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(child, @"kUSBBusCurrentAllocation", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
        if (CFProperty)
        {
          CFNumberRef v5 = CFProperty;
          unsigned int valuePtr = -1431655766;
          CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
          uint64_t v1 = valuePtr;
          CFRelease(v5);
        }
        else
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            id v9 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              __29__SleepAssertionManager_init__block_invoke_cold_1();
            }
            id v9 = MEMORY[0x263EF8438];
            id v10 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            int v11 = [v2 ioUSB30CameraKitHubService];
            unsigned int valuePtr = 67109888;
            if (v11 == v1) {
              int v12 = 2;
            }
            else {
              int v12 = 3;
            }
            int v17 = v1;
            __int16 v18 = 1024;
            int v19 = v12;
            __int16 v20 = 1024;
            io_registry_entry_t v21 = child;
            __int16 v22 = 1024;
            int v23 = 0;
            _os_log_impl(&dword_222C9E000, v9, OS_LOG_TYPE_DEFAULT, "__USBCameraKitHubGetPortCurAllocation: failed to get kUSBBusCurrentAllocation, service=%d(%d) child=%d usbCurAllocRef=%x", (uint8_t *)&valuePtr, 0x1Au);
          }

          uint64_t v1 = 0;
        }
        IOObjectRelease(object);
      }
      IOObjectRelease(child);
    }
  }
  return v1;
}

uint64_t __USBCameraKitHubGetPortFailedRequestedPower(uint64_t entry)
{
  uint64_t v1 = entry;
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (entry)
  {
    io_registry_entry_t child = -1431655766;
    if (IORegistryEntryGetChildEntry(entry, "IOService", &child))
    {
      return 0;
    }
    else
    {
      v2 = +[USBCameraKitHubMonitor sharedMonitor];
      io_registry_entry_t object = -1431655766;
      if (IORegistryEntryGetChildEntry(child, "IOService", &object))
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          uint64_t v3 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            __29__SleepAssertionManager_init__block_invoke_cold_1();
          }
          uint64_t v3 = MEMORY[0x263EF8438];
          id v6 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = [v2 ioUSB30CameraKitHubService];
          unsigned int valuePtr = 67109888;
          if (v7 == v1) {
            int v8 = 2;
          }
          else {
            int v8 = 3;
          }
          int v17 = v1;
          __int16 v18 = 1024;
          int v19 = v8;
          __int16 v20 = 1024;
          io_registry_entry_t v21 = child;
          __int16 v22 = 1024;
          int v23 = 0;
          _os_log_impl(&dword_222C9E000, v3, OS_LOG_TYPE_DEFAULT, "__USBCameraKitHubGetPortFailedRequestedPower: failed to get child kIOUSBPlane, service=%d(%d) child=%d, result=%d", (uint8_t *)&valuePtr, 0x1Au);
        }

        uint64_t v1 = 0;
      }
      else
      {
        CFNumberRef v4 = (const __CFNumber *)IORegistryEntrySearchCFProperty(child, "IOService", @"kUSBFailedRequestedPower", (CFAllocatorRef)*MEMORY[0x263EFFB08], 1u);
        if (v4)
        {
          CFNumberRef v5 = v4;
          unsigned int valuePtr = -1431655766;
          CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
          uint64_t v1 = valuePtr;
          CFRelease(v5);
        }
        else
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            id v9 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              __29__SleepAssertionManager_init__block_invoke_cold_1();
            }
            id v9 = MEMORY[0x263EF8438];
            id v10 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            int v11 = [v2 ioUSB30CameraKitHubService];
            unsigned int valuePtr = 67109888;
            if (v11 == v1) {
              int v12 = 2;
            }
            else {
              int v12 = 3;
            }
            int v17 = v1;
            __int16 v18 = 1024;
            int v19 = v12;
            __int16 v20 = 1024;
            io_registry_entry_t v21 = child;
            __int16 v22 = 1024;
            int v23 = 0;
            _os_log_impl(&dword_222C9E000, v9, OS_LOG_TYPE_DEFAULT, "__USBCameraKitHubGetPortFailedRequestedPower: failed to get kUSBFailedRequestedPower, service=%d(%d) child=%d usbFailedRequestedPowerRef=%x, expected for normal condition", (uint8_t *)&valuePtr, 0x1Au);
          }

          uint64_t v1 = 0;
        }
        IOObjectRelease(object);
      }
      IOObjectRelease(child);
    }
  }
  return v1;
}

void __CameraKitHubClassReset(int a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = +[USBCameraKitHubMonitor sharedMonitor];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    CFNumberRef v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    CFNumberRef v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 67109378;
    int v9 = a1;
    __int16 v10 = 2112;
    int v11 = v2;
    _os_log_impl(&dword_222C9E000, v5, OS_LOG_TYPE_INFO, "__CameraKitHubClassReset: pRefcon=%x monitor=%@", (uint8_t *)&v8, 0x12u);
  }

  if (a1 == 3)
  {
    if ([v2 ioUSB30CameraKitHubPortService])
    {
      IOObjectRelease([v2 ioUSB30CameraKitHubPortService]);
      [v2 setIoUSB30CameraKitHubPortService:0];
    }
    if ([v2 ioUSB30CameraKitHubPortNotification])
    {
      IOObjectRelease([v2 ioUSB30CameraKitHubPortNotification]);
      [v2 setIoUSB30CameraKitHubPortNotification:0];
    }
    if ([v2 ioUSB30CameraKitHubService])
    {
      IOObjectRelease([v2 ioUSB30CameraKitHubService]);
      [v2 setIoUSB30CameraKitHubService:0];
    }
    if ([v2 ioUSB30CameraKitHubNotification])
    {
      IOObjectRelease([v2 ioUSB30CameraKitHubNotification]);
      [v2 setIoUSB30CameraKitHubNotification:0];
    }
    goto LABEL_29;
  }
  if (a1 == 2)
  {
    if ([v2 ioUSB20CameraKitHubPortService])
    {
      IOObjectRelease([v2 ioUSB20CameraKitHubPortService]);
      [v2 setIoUSB20CameraKitHubPortService:0];
    }
    if ([v2 ioUSB20CameraKitHubPortNotification])
    {
      IOObjectRelease([v2 ioUSB20CameraKitHubPortNotification]);
      [v2 setIoUSB20CameraKitHubPortNotification:0];
    }
    if ([v2 ioUSB20CameraKitHubService])
    {
      IOObjectRelease([v2 ioUSB20CameraKitHubService]);
      [v2 setIoUSB20CameraKitHubService:0];
    }
    if ([v2 ioUSB20CameraKitHubNotification])
    {
      IOObjectRelease([v2 ioUSB20CameraKitHubNotification]);
      [v2 setIoUSB20CameraKitHubNotification:0];
    }
LABEL_29:
    [v2 _powerPostCCKHubChangeNotification];
    goto LABEL_39;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    id v6 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 67109120;
    int v9 = a1;
    _os_log_impl(&dword_222C9E000, v6, OS_LOG_TYPE_DEFAULT, "__CameraKitHubClassReset: ERROR: Invalid pRefCon(%d)", (uint8_t *)&v8, 8u);
  }

LABEL_39:
}

void __CameraKitHubClassMatch(int a1, io_object_t a2)
{
  unsigned __int8 v3 = a1;
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a1 == 3)
  {
    int v8 = +[USBCameraKitHubMonitor sharedMonitor];
    IOObjectRetain(a2);
    int v9 = [v8 queue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ____CameraKitHubClassMatch_block_invoke_215;
    v12[3] = &unk_264668350;
    io_object_t v14 = a2;
    io_object_t v13 = v8;
    id v6 = v8;
    dispatch_async(v9, v12);

    id v7 = v13;
    goto LABEL_5;
  }
  if (a1 == 2)
  {
    id v4 = +[USBCameraKitHubMonitor sharedMonitor];
    IOObjectRetain(a2);
    CFNumberRef v5 = [v4 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ____CameraKitHubClassMatch_block_invoke;
    block[3] = &unk_264668350;
    io_object_t v17 = a2;
    int v16 = v4;
    id v6 = v4;
    dispatch_async(v5, block);

    id v7 = v16;
LABEL_5:

    goto LABEL_16;
  }
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 1;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    id v6 = MEMORY[0x263EF8438];
    id v11 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v19 = v3;
    _os_log_impl(&dword_222C9E000, v6, OS_LOG_TYPE_DEFAULT, "__CameraKitHubClassMatch: ERROR: invalid pRefCon(%x) !", buf, 8u);
  }
LABEL_16:
}

void __CameraKitHubClassTerminate(uint64_t a1, io_object_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = +[USBCameraKitHubMonitor sharedMonitor];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v21 = a1;
    _os_log_impl(&dword_222C9E000, v7, OS_LOG_TYPE_INFO, "__CameraKitHubClassTerminate: pRefcon=%d", buf, 8u);
  }

  if (a1 == 3)
  {
    IOObjectRetain(a2);
    BOOL v10 = [v4 queue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ____CameraKitHubClassTerminate_block_invoke_2;
    v12[3] = &unk_264668378;
    io_object_t v15 = a2;
    io_object_t v13 = v4;
    uint64_t v14 = a1;
    dispatch_async(v10, v12);

    int v9 = v13;
  }
  else if (a1 == 2)
  {
    IOObjectRetain(a2);
    int v8 = [v4 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ____CameraKitHubClassTerminate_block_invoke;
    block[3] = &unk_264668378;
    io_object_t v19 = a2;
    io_object_t v17 = v4;
    uint64_t v18 = a1;
    dispatch_async(v8, block);

    int v9 = v17;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      int v9 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222C9E000, v9, OS_LOG_TYPE_DEFAULT, "__CameraKitHubClassTerminate: ERROR: Invalid pRefCon!", buf, 2u);
    }
  }
}

void __CameraKitHubClassHandleMatch(void *a1)
{
  kern_return_t v9;
  NSObject *v10;
  __CFRunLoop *Main;
  __CFRunLoopSource *RunLoopSource;
  id v13;
  NSObject *v14;
  id v15;
  io_object_t notification;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  int v21 = *MEMORY[0x263EF8340];
  v2 = +[USBCameraKitHubMonitor sharedMonitor];
  unsigned __int8 v3 = v2;
  notification = -1431655766;
  if (a1 == 3)
  {
    if ([v2 ioUSB30CameraKitHubService]) {
      goto LABEL_37;
    }
  }
  else if (a1 == 2 && [v2 ioUSB20CameraKitHubService])
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v4 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      id v4 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      uint64_t v18 = 2;
      io_object_t v19 = 1024;
      uint64_t v20 = [v3 ioUSB20CameraKitHubService];
      _os_log_impl(&dword_222C9E000, v4, OS_LOG_TYPE_INFO, "__CameraKitHubClassHandleMatch: pRefCon=%x ioUSB20CameraKitHubService=%d", buf, 0xEu);
    }

    int v9 = IOServiceAddInterestNotification((IONotificationPortRef)[v3 ioUSB20CameraKitHubNotifyPort], objc_msgSend(v3, "ioUSB20CameraKitHubService"), "IOGeneralInterest", (IOServiceInterestCallback)__USBCameraKitHubInterest, a1, &notification);
    [v3 setIoUSB20CameraKitHubNotification:notification];
    if (v9)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        BOOL v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        BOOL v10 = MEMORY[0x263EF8438];
        io_object_t v13 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        uint64_t v18 = v9;
        _os_log_impl(&dword_222C9E000, v10, OS_LOG_TYPE_DEFAULT, "__CameraKitHubClassHandleMatch: ERROR: couldn't add interest notification %#x", buf, 8u);
      }
    }
    else if (IONotificationPortGetRunLoopSource((IONotificationPortRef)[v3 ioUSB20CameraKitHubNotifyPort]))
    {
      Main = CFRunLoopGetMain();
      RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)[v3 ioUSB20CameraKitHubNotifyPort]);
      CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
      [v3 _powerPostCCKHubChangeNotification];
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v14 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        uint64_t v14 = MEMORY[0x263EF8438];
        io_object_t v15 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222C9E000, v14, OS_LOG_TYPE_DEFAULT, "__CameraKitHubClassHandleMatch: ERROR: IONotificationPortGetRunLoopSource(ioUSB20CameraKitHubNotifyPort) returned NULL!", buf, 2u);
      }
    }
    __CameraKitHubClassSetupPortNotificationHandlerHelper((uint64_t)a1);
    goto LABEL_37;
  }
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    uint64_t v18 = (int)a1;
    _os_log_impl(&dword_222C9E000, v7, OS_LOG_TYPE_DEFAULT, "__CameraKitHubClassHandleMatch: ERROR: Invalid pRefCon(%d)", buf, 8u);
  }

LABEL_37:
}

void __USBCameraKitHubInterest(int a1, int a2, int a3, uint64_t a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = +[USBCameraKitHubMonitor sharedMonitor];
  int v9 = v8;
  if (a1 != 2 || ![v8 ioUSB20CameraKitHubService])
  {
    if (gLogObjects) {
      BOOL v11 = gNumLogObjects < 1;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      io_object_t v13 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    else
    {
      io_object_t v13 = *(id *)gLogObjects;
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    int v21 = 67109120;
    int v22 = a1;
    uint64_t v14 = "__USBCameraKitHubInterest: ERROR: Invalid pRefCon(%d)";
    io_object_t v15 = v13;
    uint32_t v16 = 8;
    goto LABEL_19;
  }
  if (!a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      io_object_t v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      io_object_t v13 = MEMORY[0x263EF8438];
      id v18 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    LOWORD(v21) = 0;
    uint64_t v14 = "__USBCameraKitHubInterest: ERROR: service is NULL";
    io_object_t v15 = v13;
    uint32_t v16 = 2;
LABEL_19:
    _os_log_impl(&dword_222C9E000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v21, v16);
LABEL_20:

    goto LABEL_21;
  }
  if (a3 == -536854509)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      io_object_t v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      io_object_t v17 = MEMORY[0x263EF8438];
      id v20 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v21 = 67109376;
      int v22 = 2;
      __int16 v23 = 1024;
      int v24 = a4;
      _os_log_impl(&dword_222C9E000, v17, OS_LOG_TYPE_INFO, "__USBCameraKitHubInterest: received kUSBHostMessageOvercurrentCondition! pRefCon=%d msgArg=%d", (uint8_t *)&v21, 0xEu);
    }

    [v9 setOvercurrentSiphoning:0];
  }
  else if (a3 == -469794558)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      BOOL v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      BOOL v10 = MEMORY[0x263EF8438];
      id v19 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v21 = 67109376;
      int v22 = 2;
      __int16 v23 = 1024;
      int v24 = a4;
      _os_log_impl(&dword_222C9E000, v10, OS_LOG_TYPE_INFO, "__USBCameraKitHubInterest: received kTotalCamKitCurrentMessage! pRefCon=%d msgArg=%d", (uint8_t *)&v21, 0xEu);
    }

    [v9 setIoUSBCameraKitHubTotalCurrent:a4];
    [v9 setIoUSBCameraKitHubCurrentNeedUpdate:1];
    [v9 _powerPostCCKHubChangeNotification];
  }
LABEL_21:
}

void __CameraKitHubClassSetupPortNotificationHandlerHelper(uint64_t a1)
{
  v2 = +[USBCameraKitHubMonitor sharedMonitor];
  dispatch_time_t v3 = dispatch_time(0, 100000000);
  id v4 = [v2 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ____CameraKitHubClassSetupPortNotificationHandlerHelper_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  dispatch_after(v3, v4, block);
}

void __USBCameraKitHubPortInterest(int a1, int a2, int a3, int a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = +[USBCameraKitHubMonitor sharedMonitor];
  int v9 = v8;
  if (a1 == 3)
  {
    if ([v8 ioUSB30CameraKitHubPortService]) {
      goto LABEL_4;
    }
LABEL_11:
    if (gLogObjects) {
      BOOL v11 = gNumLogObjects < 1;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      io_object_t v13 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    else
    {
      io_object_t v13 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 67109120;
      int v20 = a1;
      _os_log_impl(&dword_222C9E000, v13, OS_LOG_TYPE_DEFAULT, "__USBCameraKitHubPortInterest: ERROR: Invalid pRefCon(%d)", (uint8_t *)&v19, 8u);
    }

    goto LABEL_46;
  }
  if (a1 != 2 || ![v8 ioUSB20CameraKitHubPortService]) {
    goto LABEL_11;
  }
LABEL_4:
  if (a2)
  {
    if (a3 != -536870655)
    {
      if (a3 != -536854509) {
        goto LABEL_46;
      }
      if (gLogObjects && gNumLogObjects >= 1)
      {
        BOOL v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        BOOL v10 = MEMORY[0x263EF8438];
        id v16 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v19 = 67109376;
        int v20 = a1;
        __int16 v21 = 1024;
        int v22 = a4;
        _os_log_impl(&dword_222C9E000, v10, OS_LOG_TYPE_INFO, "__USBCameraKitHubPortInterest: received kUSBHostMessageOvercurrentCondition! pRefCon=%d msgArg=%d", (uint8_t *)&v19, 0xEu);
      }

      [v9 setOvercurrentSiphoning:0];
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      io_object_t v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      io_object_t v17 = MEMORY[0x263EF8438];
      id v18 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v19 = 67109376;
      int v20 = a1;
      __int16 v21 = 1024;
      int v22 = a4;
      _os_log_impl(&dword_222C9E000, v17, OS_LOG_TYPE_INFO, "__USBCameraKitHubPortInterest: received kIOMessageServiceIsAttemptingOpen, pRefCon=%d msgArg=%d", (uint8_t *)&v19, 0xEu);
    }

    [v9 setIoUSBCameraKitHubCurrentNeedUpdate:1];
    [v9 _powerPostCCKHubChangeNotification];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      uint64_t v14 = MEMORY[0x263EF8438];
      id v15 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_222C9E000, v14, OS_LOG_TYPE_DEFAULT, "__USBCameraKitHubPortInterest: ERROR: service is NULL", (uint8_t *)&v19, 2u);
    }
  }
LABEL_46:
}

void __USB30XHCIRemovablePortClassMatch(uint64_t a1, uint64_t a2)
{
  kern_return_t v19;
  kern_return_t v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  io_service_t v30;
  kern_return_t v31;
  kern_return_t v32;
  uint64_t v33;
  int v34;
  NSObject *v35;
  uint64_t v36;
  int v37;
  NSObject *v38;
  __CFRunLoop *Main;
  __CFRunLoopSource *RunLoopSource;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  int v44;
  NSObject *v45;
  int v46;
  NSObject *v47;
  id v48;
  CFStringRef mode;
  void block[4];
  NSObject *v51;
  uint8_t v52;
  char v53[15];
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  int v57;
  uint64_t v58;

  v58 = *MEMORY[0x263EF8340];
  id v4 = +[IAPUIDManager sharedIAPUIDManager];
  uint64_t v5 = [v4 objectForIAPUID:a1];

  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    id v8 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  else
  {
    id v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v55 = a1;
    _os_log_impl(&dword_222C9E000, v8, OS_LOG_TYPE_INFO, "uidForNotification = %lu", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    int v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    int v9 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v55 = v5;
    _os_log_impl(&dword_222C9E000, v9, OS_LOG_TYPE_INFO, "pUSBMonitor=%@", buf, 0xCu);
  }

  if (v5)
  {
    MEMORY[0x223CA5E80](a2);
    io_object_t v11 = IOIteratorNext(a2);
    if (v11)
    {
      io_object_t v12 = v11;
      io_object_t v13 = MEMORY[0x263EF8438];
      mode = (const __CFString *)*MEMORY[0x263EFFE88];
      while (1)
      {
        io_object_t v14 = *(_DWORD *)(v5 + 36);
        if (v14 == v12)
        {
          uint64_t v15 = gLogObjects;
          int v16 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v17 = gNumLogObjects < 1;
          }
          else {
            BOOL v17 = 1;
          }
          if (v17)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v55 = v15;
              v56 = 1024;
              v57 = v16;
              _os_log_error_impl(&dword_222C9E000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v18 = v13;
            int v24 = v13;
          }
          else
          {
            int v24 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v55) = v12;
            _os_log_error_impl(&dword_222C9E000, v24, OS_LOG_TYPE_ERROR, "Already registered, service=%x", buf, 8u);
          }
          goto LABEL_75;
        }
        if (v14) {
          IOObjectRelease(v14);
        }
        *(_DWORD *)(v5 + 36) = v12;
        int v19 = IOObjectRetain(v12);
        if (v19)
        {
          int v20 = v19;
          __int16 v21 = gLogObjects;
          int v22 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            uint64_t v23 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v55 = v21;
              v56 = 1024;
              v57 = v22;
              _os_log_error_impl(&dword_222C9E000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            uint64_t v25 = v13;
            uint64_t v23 = v13;
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v55) = v20;
            _os_log_error_impl(&dword_222C9E000, v23, OS_LOG_TYPE_ERROR, "ERROR - IOObjectRetain failed %#x", buf, 8u);
          }
        }
        int v24 = (id)v5;
        id v26 = gLogObjects;
        long long v27 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v28 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v55 = v26;
            v56 = 1024;
            v57 = v27;
            _os_log_error_impl(&dword_222C9E000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          uint64_t v29 = v13;
          v28 = v13;
        }
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v55 = v5;
          _os_log_impl(&dword_222C9E000, v28, OS_LOG_TYPE_INFO, "pUSBMonitor=%@", buf, 0xCu);
        }

        __int16 v30 = *(_DWORD *)(v5 + 36);
        if (!v30) {
          break;
        }
        int v31 = IOServiceAddInterestNotification(*(IONotificationPortRef *)(v5 + 24), v30, "IOGeneralInterest", (IOServiceInterestCallback)__USB30XHCIRemovablePortInterest, *(void **)(v5 + 8), (io_object_t *)(v5 + 32));
        if (v31)
        {
          uint64_t v32 = v31;
          v33 = gLogObjects;
          v34 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v35 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v55 = v33;
              v56 = 1024;
              v57 = v34;
              _os_log_error_impl(&dword_222C9E000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v41 = v13;
            v35 = v13;
          }
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v55) = v32;
            _os_log_error_impl(&dword_222C9E000, v35, OS_LOG_TYPE_ERROR, "ERROR - Couldn't add interest notification %#x", buf, 8u);
          }

          goto LABEL_75;
        }
        if (!IONotificationPortGetRunLoopSource(*(IONotificationPortRef *)(v5 + 24)))
        {
          v43 = gLogObjects;
          v44 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v38 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v55 = v43;
              v56 = 1024;
              v57 = v44;
              _os_log_error_impl(&dword_222C9E000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v45 = v13;
            v38 = v13;
          }
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            __USB30XHCIRemovablePortClassMatch_cold_3(&v52, v53, v38);
          }
LABEL_74:

          goto LABEL_75;
        }
        Main = CFRunLoopGetMain();
        RunLoopSource = IONotificationPortGetRunLoopSource(*(IONotificationPortRef *)(v5 + 24));
        CFRunLoopAddSource(Main, RunLoopSource, mode);
LABEL_75:

        IOObjectRelease(v12);
        io_object_t v12 = IOIteratorNext(a2);
        if (!v12) {
          goto LABEL_85;
        }
      }
      v36 = gLogObjects;
      v37 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v38 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v55 = v36;
          v56 = 1024;
          v57 = v37;
          _os_log_error_impl(&dword_222C9E000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v42 = v13;
        v38 = v13;
      }
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v46 = *(_DWORD *)(v5 + 36);
        *(_DWORD *)buf = 67109120;
        LODWORD(v55) = v46;
        _os_log_error_impl(&dword_222C9E000, v38, OS_LOG_TYPE_ERROR, "ERROR: Class instance pUSBMonitor == NULL or _ioUSB30XHCIRemovablePortService(0x%x) = NULL !\n", buf, 8u);
      }
      goto LABEL_74;
    }
LABEL_85:
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ____USB30XHCIRemovablePortClassMatch_block_invoke;
    block[3] = &unk_2646682E8;
    v51 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
    v47 = v51;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v47 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      v47 = MEMORY[0x263EF8438];
      v48 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      __CardReaderClassMatch_cold_1();
    }
  }
}

void __USB30XHCIRemovablePortClassTerminate(void *a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = +[IAPUIDManager sharedIAPUIDManager];
  id v5 = (id)[v4 objectForIAPUID:a1];

  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    id v8 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  else
  {
    id v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v25 = (uint64_t)a1;
    _os_log_impl(&dword_222C9E000, v8, OS_LOG_TYPE_INFO, "uidForNotification = %lu", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    int v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    int v9 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = (uint64_t)v5;
    _os_log_impl(&dword_222C9E000, v9, OS_LOG_TYPE_INFO, "pUSBMonitor=%@", buf, 0xCu);
  }

  if (v5)
  {
    MEMORY[0x223CA5E80](a2);
    io_object_t v11 = IOIteratorNext(a2);
    if (v11)
    {
      io_object_t v12 = v11;
      io_object_t v13 = MEMORY[0x263EF8438];
      do
      {
        if (*((_DWORD *)v5 + 9) == v12)
        {
          id v14 = v5;
          io_object_t v15 = *((_DWORD *)v5 + 9);
          if (v15)
          {
            IOObjectRelease(v15);
            *((_DWORD *)v5 + 9) = 0;
            io_object_t v16 = *((_DWORD *)v5 + 8);
            if (v16)
            {
              IOObjectRelease(v16);
              *((_DWORD *)v5 + 8) = 0;
              __USB30XHCIRemovablePortActive = 0;
            }
          }
          else
          {
            uint64_t v17 = gLogObjects;
            int v18 = gNumLogObjects;
            if (gLogObjects) {
              BOOL v19 = gNumLogObjects < 1;
            }
            else {
              BOOL v19 = 1;
            }
            if (v19)
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v25 = v17;
                __int16 v26 = 1024;
                int v27 = v18;
                _os_log_error_impl(&dword_222C9E000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              int v20 = v13;
              __int16 v21 = v13;
            }
            else
            {
              __int16 v21 = *(id *)gLogObjects;
            }
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              int v22 = *((_DWORD *)v5 + 9);
              *(_DWORD *)buf = 67109120;
              LODWORD(v25) = v22;
              _os_log_error_impl(&dword_222C9E000, v21, OS_LOG_TYPE_ERROR, "ERROR: Class instance pUSBMonitor == NULL or _ioUSB30XHCIRemovablePortService(0x%x) = NULL !\n", buf, 8u);
            }
          }
        }
        IOObjectRelease(v12);
        io_object_t v12 = IOIteratorNext(a2);
      }
      while (v12);
    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v5 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      id v5 = (id)MEMORY[0x263EF8438];
      id v23 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      __USBCardReaderInterest_cold_1();
    }
  }
}

void _HandleUSBConnectChange(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v1 = a1;
  int v2 = +[USBCableTypeMonitor usbCableType];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    id v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v12 = 67109376;
    int v13 = v2;
    __int16 v14 = 1024;
    int v15 = __USB30XHCIRemovablePortActive;
    _os_log_impl(&dword_222C9E000, v5, OS_LOG_TYPE_INFO, "cableType=%d RemovablePortActive=%d", (uint8_t *)&v12, 0xEu);
  }

  if ((v2 - 7) < 2) {
    int v6 = __USB30XHCIRemovablePortActive;
  }
  else {
    int v6 = 0;
  }
  if ((v2 - 5) < 2) {
    int v7 = __USB30XHCIRemovablePortActive;
  }
  else {
    int v7 = 0;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v8 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    id v8 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    if ((v2 - 3) < 2) {
      int v10 = 1;
    }
    else {
      int v10 = v6;
    }
    int v12 = 67109632;
    int v13 = v2;
    __int16 v14 = 1024;
    if ((v2 - 1) < 2) {
      int v11 = 1;
    }
    else {
      int v11 = v7;
    }
    int v15 = v10;
    __int16 v16 = 1024;
    int v17 = v11;
    _os_log_impl(&dword_222C9E000, v8, OS_LOG_TYPE_INFO, "cableType=%d bCableTypeUSBDevice=%d bCableTypeUSBHost=%d", (uint8_t *)&v12, 0x14u);
  }

  if (v2 && v2 != __usbCableType)
  {
    __usbCableType = v2;
    [v1 sendUSBCableTypeChangedNotification];
  }
}

void __USB30XHCIRemovablePortInterest(_DWORD *a1, int a2, int a3, unsigned __int8 a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = +[IAPUIDManager sharedIAPUIDManager];
  id v9 = (_DWORD *)[v8 objectForIAPUID:a1];

  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 1;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    int v12 = MEMORY[0x263EF8438];
    id v11 = MEMORY[0x263EF8438];
  }
  else
  {
    int v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v23 = a1;
    _os_log_impl(&dword_222C9E000, v12, OS_LOG_TYPE_INFO, "uidForNotification = %lu", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    int v13 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    int v13 = MEMORY[0x263EF8438];
    id v14 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v23 = v9;
    __int16 v24 = 1024;
    int v25 = a3;
    __int16 v26 = 1024;
    int v27 = a4;
    _os_log_impl(&dword_222C9E000, v13, OS_LOG_TYPE_INFO, "pUSBMonitor=%@ msgType=%xh msgArg=%hhx", buf, 0x18u);
  }

  if (!v9 || !v9[9])
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      int v15 = MEMORY[0x263EF8438];
      id v16 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __CardReaderClassMatch_cold_1();
    }
    goto LABEL_33;
  }
  if (!a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      int v15 = MEMORY[0x263EF8438];
      id v17 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __USBCardReaderInterest_cold_3();
    }
    goto LABEL_33;
  }
  if (a3 == -536870384)
  {
    __USB30XHCIRemovablePortActive = 0;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = ____USB30XHCIRemovablePortInterest_block_invoke_2;
    v18[3] = &unk_2646682E8;
    BOOL v19 = v9;
    dispatch_sync(MEMORY[0x263EF83A0], v18);
    int v15 = v19;
    goto LABEL_33;
  }
  if (a3 == -536870352)
  {
    __USB30XHCIRemovablePortActive = 1;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ____USB30XHCIRemovablePortInterest_block_invoke;
    block[3] = &unk_2646682E8;
    __int16 v21 = v9;
    dispatch_sync(MEMORY[0x263EF83A0], block);
    int v15 = v21;
LABEL_33:
  }
}

void init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 3, (uint64_t)_kLoggingModuleEntries);
  init_logging_signposts();
}

uint64_t __mapFamilyCodeToChargingType(uint64_t a1)
{
  uint64_t v1 = 0xFFFFFFFFLL;
  if (a1 > -536838145)
  {
    switch(a1)
    {
      case -536723456:
        uint64_t v1 = 10;
        break;
      case -536723455:
      case -536723451:
        break;
      case -536723454:
        uint64_t v1 = 11;
        break;
      case -536723453:
      case -536723450:
        uint64_t v1 = 12;
        break;
      case -536723452:
        uint64_t v1 = 13;
        break;
      case -536723449:
        uint64_t v1 = 14;
        break;
      case -536723448:
        uint64_t v1 = 15;
        break;
      default:
        if (a1 == -536838144)
        {
          uint64_t v1 = 1;
        }
        else if (!a1)
        {
          uint64_t v1 = 0;
        }
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case -536854528:
      case -536854527:
        uint64_t v1 = 2;
        break;
      case -536854526:
        uint64_t v1 = 3;
        break;
      case -536854525:
        uint64_t v1 = 4;
        break;
      case -536854524:
      case -536854523:
      case -536854522:
        uint64_t v1 = 5;
        break;
      case -536854521:
        uint64_t v1 = 6;
        break;
      case -536854520:
        uint64_t v1 = 7;
        break;
      case -536854519:
        uint64_t v1 = 8;
        break;
      case -536854518:
        uint64_t v1 = 9;
        break;
      default:
        break;
    }
  }
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 3;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    id v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    id v4 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __mapFamilyCodeToChargingType_cold_1();
  }

  return v1;
}

void __preferenceChangedNotification()
{
}

uint64_t __powerBatteryMatch(IONotificationPort **a1, io_iterator_t iterator)
{
  kern_return_t v7;
  kern_return_t v8;
  uint64_t v9;
  int v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  io_object_t notification;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  BOOL v19 = *MEMORY[0x263EF8340];
  id v3 = *a1;
  notification = -1431655766;
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    io_registry_entry_t v5 = result;
    int v6 = MEMORY[0x263EF8438];
    do
    {
      __powerUpdateBatteryState(v5);
      int v7 = IOServiceAddInterestNotification(v3, v5, "IOGeneralInterest", (IOServiceInterestCallback)__powerBatteryInterest, 0, &notification);
      if (v7)
      {
        id v8 = v7;
        id v9 = gLogObjects;
        BOOL v10 = gNumLogObjects;
        if (gLogObjects) {
          id v11 = gNumLogObjects < 3;
        }
        else {
          id v11 = 1;
        }
        if (v11)
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            id v16 = (const char *)v9;
            id v17 = 1024;
            uint64_t v18 = v10;
            _os_log_error_impl(&dword_222C9E000, v6, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          int v12 = v6;
          int v13 = v6;
        }
        else
        {
          int v13 = *(id *)(gLogObjects + 16);
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          id v16 = "void __powerBatteryMatch(void *, io_iterator_t)";
          id v17 = 1024;
          uint64_t v18 = v8;
          _os_log_error_impl(&dword_222C9E000, v13, OS_LOG_TYPE_ERROR, "%s IOServiceAddInterestNotification failed: %08x", buf, 0x12u);
        }
      }
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      io_registry_entry_t v5 = result;
    }
    while (result);
  }
  return result;
}

void __SystemPowerCallback(void *a1, uint64_t a2, int a3, intptr_t a4)
{
  id v6 = a1;
  switch(a3)
  {
    case -536870144:
      if (gLogObjects) {
        BOOL v8 = gNumLogObjects < 3;
      }
      else {
        BOOL v8 = 1;
      }
      if (v8)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        id v16 = MEMORY[0x263EF8438];
        id v9 = MEMORY[0x263EF8438];
      }
      else
      {
        id v16 = *(id *)(gLogObjects + 16);
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222C9E000, v16, OS_LOG_TYPE_DEFAULT, "Received kIOMessageSystemHasPoweredOn", buf, 2u);
      }

      [v6 setSystemIsAsleep:0];
      id v17 = [MEMORY[0x263F08A00] defaultCenter];
      [v17 postNotificationName:@"ACCPlatformSystemPower_SystemHasPoweredOnNotification" object:0 userInfo:0];

      break;
    case -536870272:
      if (gLogObjects) {
        BOOL v10 = gNumLogObjects < 3;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        uint64_t v18 = MEMORY[0x263EF8438];
        id v11 = MEMORY[0x263EF8438];
      }
      else
      {
        uint64_t v18 = *(id *)(gLogObjects + 16);
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222C9E000, v18, OS_LOG_TYPE_DEFAULT, "Received kIOMessageSystemWillSleep", buf, 2u);
      }

      [v6 setSystemIsAsleep:1];
      if (![v6 sleepNotificationsEnabled])
      {
        int v13 = [MEMORY[0x263F08A00] defaultCenter];
        id v14 = v13;
        int v15 = &ACCPlatformSystemPower_SystemWillSleepNotification;
LABEL_40:
        [v13 postNotificationName:*v15 object:0 userInfo:0];

        IOAllowPowerChange([v6 systemPowerPort], a4);
        break;
      }
      BOOL v19 = [v6 clientsPreventingSleepLock];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = ____SystemPowerCallback_block_invoke;
      block[3] = &unk_2646682E8;
      id v20 = v6;
      id v31 = v20;
      dispatch_sync(v19, block);

      __int16 v21 = [MEMORY[0x263F08A00] defaultCenter];
      [v21 postNotificationName:@"ACCPlatformSystemPower_SystemWillSleepNotification" object:0 userInfo:0];

      int v22 = [v20 sleepSemaphore];
      dispatch_time_t v23 = dispatch_time(0, 2000000000);
      intptr_t v24 = dispatch_semaphore_wait(v22, v23);

      if (v24)
      {
        if (gLogObjects && gNumLogObjects >= 3)
        {
          int v25 = *(id *)(gLogObjects + 16);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            __29__SleepAssertionManager_init__block_invoke_cold_1();
          }
          int v25 = MEMORY[0x263EF8438];
          id v26 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_222C9E000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] sleep notification handling timed out", buf, 2u);
        }
      }
      IOAllowPowerChange([v20 systemPowerPort], a4);
      int v27 = [v20 clientsPreventingSleepLock];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = ____SystemPowerCallback_block_invoke_195;
      v28[3] = &unk_2646682E8;
      id v29 = v20;
      dispatch_sync(v27, v28);

      break;
    case -536870288:
      if (gLogObjects && gNumLogObjects >= 3)
      {
        int v7 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        int v7 = MEMORY[0x263EF8438];
        id v12 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222C9E000, v7, OS_LOG_TYPE_DEFAULT, "Received kIOMessageCanSystemSleep", buf, 2u);
      }

      int v13 = [MEMORY[0x263F08A00] defaultCenter];
      id v14 = v13;
      int v15 = &ACCPlatformSystemPower_SystemCanSleepNotification;
      goto LABEL_40;
  }
}

void ____preferenceChangedNotification_block_invoke()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v0 = +[PowerMonitor sharedMonitor];
  uint64_t v1 = acc_userDefaultsIapd_copyIntegerForKey(@"PretendBatteryLevel");
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 3;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    id v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    id v4 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109376;
    v5[1] = [v0 batteryCapacityOverride];
    __int16 v6 = 1024;
    int v7 = v1;
    _os_log_impl(&dword_222C9E000, v4, OS_LOG_TYPE_INFO, "Logging preferences changed! (pretendBatteryLevel): %d -> %d", (uint8_t *)v5, 0xEu);
  }

  [v0 setBatteryCapacityOverride:v1];
  objc_msgSend(v0, "_checkAndSendNotificationForOldConnected:oldIsBatteryCharging:oldBatteryChargeLevelPercent:oldBatteryChargingType:oldBatteryChargingTypeExt:overrideChanged:", objc_msgSend(v0, "isExternalChargerConnected"), objc_msgSend(v0, "isBatteryCharging"), objc_msgSend(v0, "batteryChargeLevelPercent"), objc_msgSend(v0, "batteryChargingType"), objc_msgSend(v0, "batteryChargingTypeExternal"), 1);
}

void __powerUpdateBatteryState(io_registry_entry_t a1)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  CFMutableDictionaryRef properties = 0;
  if (!IORegistryEntryCreateCFProperties(a1, &properties, 0, 0))
  {
    uint64_t v1 = +[PowerMonitor sharedMonitor];
    int v33 = [v1 batteryCapacity];
    int v32 = [v1 batteryCapacityMax];
    uint64_t v2 = [v1 isExtChargerConnected];
    uint64_t v3 = [v1 isBatteryCharging];
    uint64_t v4 = [v1 batteryChargeLevelPercent];
    uint64_t v5 = [v1 batteryChargingType];
    uint64_t v6 = [v1 batteryChargingTypeExternal];
    int v7 = [(__CFDictionary *)properties objectForKey:@"CurrentCapacity"];
    objc_msgSend(v1, "setBatteryCapacity:", objc_msgSend(v7, "intValue"));

    uint64_t v8 = [(__CFDictionary *)properties objectForKey:@"MaxCapacity"];
    objc_msgSend(v1, "setBatteryCapacityMax:", objc_msgSend(v8, "intValue"));

    id v9 = [(__CFDictionary *)properties objectForKey:@"ExternalConnected"];
    objc_msgSend(v1, "setIsExtChargerConnected:", objc_msgSend(v9, "BOOLValue"));

    BOOL v10 = [(__CFDictionary *)properties objectForKey:@"IsCharging"];
    objc_msgSend(v1, "setIsBatteryCharging:", objc_msgSend(v10, "BOOLValue"));

    if ([v1 isBatteryCharging])
    {
      if ([v1 isExtChargerConnected])
      {
        int v11 = [v1 batteryCapacity];
        if (v11 == [v1 batteryCapacityMax]) {
          [v1 setIsBatteryCharging:0];
        }
      }
    }
    objc_msgSend(v1, "setBatteryChargeLevelPercent:", ((int)(100 * objc_msgSend(v1, "batteryCapacity")) / (int)objc_msgSend(v1, "batteryCapacityMax")));
    [v1 setBatteryChargingType:0xFFFFFFFFLL];
    id v12 = [(__CFDictionary *)properties objectForKey:@"AdapterDetails"];
    int v13 = v12;
    if (v12)
    {
      id v14 = [v12 objectForKey:@"FamilyCode"];
      int v15 = v14;
      if (v14) {
        objc_msgSend(v1, "setBatteryChargingType:", __mapFamilyCodeToChargingType(objc_msgSend(v14, "longLongValue")));
      }
    }
    v35 = v13;
    [v1 setBatteryChargingTypeExternal:0xFFFFFFFFLL];
    id v16 = [(__CFDictionary *)properties objectForKey:@"DownstreamAdapterFamily"];
    uint64_t v17 = (uint64_t)v16;
    if (v16) {
      objc_msgSend(v1, "setBatteryChargingTypeExternal:", __mapFamilyCodeToChargingType(objc_msgSend(v16, "longLongValue")));
    }
    v34 = (void *)v17;
    if (gLogObjects && gNumLogObjects >= 3)
    {
      uint64_t v18 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      uint64_t v18 = MEMORY[0x263EF8438];
      id v19 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      __powerUpdateBatteryState_cold_2(v17, (uint64_t)v35, v18);
    }

    if (gLogObjects && gNumLogObjects >= 3)
    {
      id v20 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      id v20 = MEMORY[0x263EF8438];
      id v21 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v31 = [v1 isExtChargerConnected];
      int v30 = [v1 isBatteryCharging];
      int v29 = [v1 batteryCapacity];
      uint64_t v22 = v4;
      int v23 = [v1 batteryCapacityMax];
      uint64_t v24 = v5;
      int v25 = [v1 batteryChargeLevelPercent];
      uint64_t v26 = v6;
      int v27 = [v1 batteryChargingType];
      int v28 = [v1 batteryChargingTypeExternal];
      *(_DWORD *)buf = 67112448;
      int v38 = v2;
      __int16 v39 = 1024;
      int v40 = v31;
      __int16 v41 = 1024;
      int v42 = v3;
      __int16 v43 = 1024;
      int v44 = v30;
      __int16 v45 = 1024;
      int v46 = v33;
      __int16 v47 = 1024;
      int v48 = v29;
      __int16 v49 = 1024;
      int v50 = v32;
      __int16 v51 = 1024;
      int v52 = v23;
      uint64_t v4 = v22;
      __int16 v53 = 1024;
      int v54 = v22;
      __int16 v55 = 1024;
      int v56 = v25;
      uint64_t v5 = v24;
      __int16 v57 = 1024;
      int v58 = v24;
      __int16 v59 = 1024;
      int v60 = v27;
      uint64_t v6 = v26;
      __int16 v61 = 1024;
      int v62 = v26;
      __int16 v63 = 1024;
      int v64 = v28;
      _os_log_impl(&dword_222C9E000, v20, OS_LOG_TYPE_INFO, "handle battery state update: isExtChg=%u->%u, isBChg%u->%u, bCap=%u->%u, bCapMax=%u->%u, bCLP=%u->%u, chgType=%d->%d, chgTypeExt=%d->%d", buf, 0x56u);
    }

    [v1 _checkAndSendNotificationForOldConnected:v2 oldIsBatteryCharging:v3 oldBatteryChargeLevelPercent:v4 oldBatteryChargingType:v5 oldBatteryChargingTypeExt:v6 overrideChanged:0];
    CFRelease(properties);
  }
}

void __powerBatteryInterest(uint64_t a1, io_registry_entry_t a2, int a3)
{
  if (a3 == -536723200) {
    __powerUpdateBatteryState(a2);
  }
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  char v4 = a2;
  void block[4] = a3;
  void block[5] = a1;
  if (init_logging_modules_onceToken != -1) {
    dispatch_once(&init_logging_modules_onceToken, block);
  }
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = &loc_222CAE000;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    uint64_t v6 = MEMORY[0x263EF8438];
    do
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        uint64_t v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_222C9E000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
          uint64_t v7 = *(void *)(a1 + 32);
          uint64_t v8 = "<Undefined>";
        }
      }
      uint64_t v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        uint64_t v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v16, v4, &v17);
          uint64_t v9 = "<Undefined>";
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
          int v13 = v8;
          __int16 v14 = 2080;
          int v15 = v9;
          _os_log_debug_impl(&dword_222C9E000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v13 = v8;
        __int16 v14 = 2080;
        int v15 = v9;
        _os_log_error_impl(&dword_222C9E000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    uint64_t v2 = (void *)&loc_222CAE000;
  }
  else
  {
    LODWORD(v11) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = v2[497];
    LODWORD(v13) = v5;
    _os_log_impl(&dword_222C9E000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(void *)(a1 + 40);
  gNumLogObjects = v11;
}

uint64_t acc_userDefaults_BOOLForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyStringForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 stringForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyArrayForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 arrayForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyDictionaryForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 dictionaryForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyIntegerForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 integerForKey:a1];

  return v3;
}

double acc_userDefaults_copyDoubleForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaults];
  [v2 doubleForKey:a1];
  double v4 = v3;

  return v4;
}

void acc_userDefaults_setArrayForKey(uint64_t a1, uint64_t a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setObject:a2 forKey:a1];
}

void acc_userDefaults_setIntegerForKey(uint64_t a1, uint64_t a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setInteger:a2 forKey:a1];
}

void acc_userDefaults_setDoubleForKey(uint64_t a1, double a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setDouble:a1 forKey:a2];
}

uint64_t acc_userDefaultsIapd_BOOLForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyStringForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 stringForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyArrayForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 arrayForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyDictionaryForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 dictionaryForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyIntegerForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 integerForKey:a1];

  return v3;
}

double acc_userDefaultsIapd_copyDoubleForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaultsIapd];
  [v2 doubleForKey:a1];
  double v4 = v3;

  return v4;
}

uint64_t acc_userDefaultsLogging_BOOLForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaultsLogging];
  uint64_t v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_222C9E000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
}

void __CardReaderClassMatch_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_222C9E000, v0, v1, "ERROR: Class instance pUSBMonitor = nil !\n", v2, v3, v4, v5, v6);
}

void __CardReaderClassMatch_cold_3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_222C9E000, log, OS_LOG_TYPE_ERROR, "ERROR - IONotificationPortGetRunLoopSource(pUSBMonitor->_ioUSBCardReaderNotifyPort) returned NULL!", buf, 2u);
}

void __USBCardReaderInterest_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_222C9E000, v0, v1, "ERROR: Class instance pUSBMonitor = NULL !\n", v2, v3, v4, v5, v6);
}

void __USBCardReaderInterest_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_222C9E000, v0, v1, "ERROR - service is NULL", v2, v3, v4, v5, v6);
}

void __USB30XHCIRemovablePortClassMatch_cold_3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_222C9E000, log, OS_LOG_TYPE_ERROR, "ERROR - IONotificationPortGetRunLoopSource(pUSBMonitor->_ioUSB30XHCIRemovablePortNotifyPort) returned NULL!", buf, 2u);
}

void __mapFamilyCodeToChargingType_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_222C9E000, v0, OS_LOG_TYPE_DEBUG, "familyCode to charging type: %llx -> %d", v1, 0x12u);
}

void __powerUpdateBatteryState_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_222C9E000, log, OS_LOG_TYPE_DEBUG, "handle battery state update: adapterFamily = %@, adapterDetails = %@", (uint8_t *)&v3, 0x16u);
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_222C9E000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x270EF3EE0](*(void *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x270EF4000](notifier);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x270EF47B0](*(void *)&bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EF47D0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x270EF4828](*(void *)&object);
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x270EF4848](AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x270EF4868](*(void *)&AssertionID);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x270EF49B0](refcon, thePortRef, callback, notifier);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetChildEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *child)
{
  return MEMORY[0x270EF49F0](*(void *)&entry, plane, child);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryGetRootEntry(mach_port_t mainPort)
{
  return MEMORY[0x270EF4A68](*(void *)&mainPort);
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

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x270ED95B8](when, delta);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}