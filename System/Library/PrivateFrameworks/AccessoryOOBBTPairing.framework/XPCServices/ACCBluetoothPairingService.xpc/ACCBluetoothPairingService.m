void init_logging_signposts()
{
  init_logging_signpost_modules((uint64_t)&_gLogSignpostObjects, 4, (uint64_t)_kLoggingSignpostModuleEntries);
}

void init_logging_signpost_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
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
  v2 = _os_log_debug_impl;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(a1 + 32);
      v7 = *(const char **)(v6 + v3);
      if (!v7)
      {
        v7 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v12) = v4;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
          uint64_t v6 = *(void *)(a1 + 32);
          v7 = "<Undefined>";
        }
      }
      v8 = *(const char **)(v6 + v3 + 8);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          __init_logging_signpost_modules_block_invoke_cold_1(v15, v4, &v16);
          v8 = "<Undefined>";
        }
      }
      os_log_t v9 = os_log_create(v7, v8);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = v9;
      if (v9)
      {
        ++v5;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v12 = v7;
          __int16 v13 = 2080;
          v14 = v8;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = v7;
        __int16 v13 = 2080;
        v14 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v10 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v10);
    v2 = _os_log_debug_impl;
  }
  else
  {
    LODWORD(v10) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 391);
    LODWORD(v12) = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v10) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogSignpostObjects = *(void *)(a1 + 40);
  gNumLogSignpostObjects = v10;
}

void sub_100002C68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  init_logging();
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 6;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[ServiceDelegate listener:shouldAcceptNewConnection:]();
    }
    int v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    int v5 = *(id *)(gLogObjects + 40);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting xpc service", v9, 2u);
  }

  uint64_t v6 = objc_opt_new();
  v7 = +[NSXPCListener serviceListener];
  [v7 setDelegate:v6];
  [v7 resume];

  return 0;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
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
  v2 = _os_log_debug_impl;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(a1 + 32);
      v7 = *(const char **)(v6 + v3);
      if (!v7)
      {
        v7 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v12) = v4;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
          uint64_t v6 = *(void *)(a1 + 32);
          v7 = "<Undefined>";
        }
      }
      v8 = *(const char **)(v6 + v3 + 8);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v15, v4, &v16);
          v8 = "<Undefined>";
        }
      }
      os_log_t v9 = os_log_create(v7, v8);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = v9;
      if (v9)
      {
        ++v5;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v12 = v7;
          __int16 v13 = 2080;
          v14 = v8;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = v7;
        __int16 v13 = 2080;
        v14 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v10 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v10);
    v2 = _os_log_debug_impl;
  }
  else
  {
    LODWORD(v10) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 391);
    LODWORD(v12) = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v10) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(void *)(a1 + 40);
  gNumLogObjects = v10;
}

void init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 9, (uint64_t)_kLoggingModuleEntries);
  init_logging_signposts();
}

id logObjectForModule()
{
  if (gLogObjects) {
    BOOL v0 = gNumLogObjects < 6;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    BOOL v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v1) {
      logObjectForModule_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
    id v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 40);
  }
  return v10;
}

id _BTSessionQueue()
{
  if (_BTSessionQueue_onceToken != -1) {
    dispatch_once(&_BTSessionQueue_onceToken, &__block_literal_global);
  }
  BOOL v0 = (void *)_BTSessionQueue___BTSessionQueue;
  return v0;
}

void __cleanupBTSession(void *a1)
{
  id v1 = a1;
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 6;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[ServiceDelegate listener:shouldAcceptNewConnection:]();
    }
    uint64_t v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    uint64_t v4 = *(id *)(gLogObjects + 40);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v5 = 136315394;
    *(void *)&v5[4] = "__cleanupBTSession";
    __int16 v6 = 2112;
    id v7 = v1;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s: cleanup pairingService %@", v5, 0x16u);
  }

  [v1 setIsBTReady:0];
  [v1 setBTAccessoryManager:0];
  *(void *)uint64_t v5 = [v1 BTSession];
  BTSessionDetachWithQueue();
  [v1 setBTSession:0];
}

void __callbackSessionEvent(uint64_t a1, int a2, int a3, void *a4)
{
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 6;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[ServiceDelegate listener:shouldAcceptNewConnection:]();
    }
    id v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 40);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = a2;
    __int16 v32 = 1024;
    int v33 = a3;
    __int16 v34 = 2112;
    v35 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "__callbackSessionEvent: event: %d result:%d userData:%@", buf, 0x18u);
  }

  if (a3)
  {
    if (gLogObjects && gNumLogObjects >= 6)
    {
      v11 = *(id *)(gLogObjects + 40);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[ServiceDelegate listener:shouldAcceptNewConnection:]();
      }
      v11 = &_os_log_default;
      id v13 = &_os_log_default;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ERROR - ACCBluetoothPairingService __callbackSessionEvent called with a BTResult of %d", buf, 8u);
    }
    goto LABEL_79;
  }
  if (a4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = a4;
      if (a2)
      {
        if (a2 == 1)
        {
          if (gLogObjects && gNumLogObjects >= 6)
          {
            v15 = *(id *)(gLogObjects + 40);
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              -[ServiceDelegate listener:shouldAcceptNewConnection:]();
            }
            v15 = &_os_log_default;
            id v22 = &_os_log_default;
          }
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "BTSession detached", buf, 2u);
          }

          [v11 cleanup];
          if (gLogObjects && gNumLogObjects >= 6)
          {
            int v16 = *(id *)(gLogObjects + 40);
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              -[ServiceDelegate listener:shouldAcceptNewConnection:]();
            }
            int v16 = &_os_log_default;
            id v28 = &_os_log_default;
          }
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            __callbackSessionEvent_cold_4((uint64_t)v11, v16);
          }
          goto LABEL_78;
        }
        if (a2 == 2)
        {
          if (gLogObjects && gNumLogObjects >= 6)
          {
            v12 = *(id *)(gLogObjects + 40);
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              -[ServiceDelegate listener:shouldAcceptNewConnection:]();
            }
            v12 = &_os_log_default;
            id v17 = &_os_log_default;
          }
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "BTSession terminated", buf, 2u);
          }

          __cleanupBTSession(v11);
          [v11 _AttachToBTServer];
          goto LABEL_79;
        }
        if (gLogObjects && gNumLogObjects >= 6)
        {
          int v16 = *(id *)(gLogObjects + 40);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[ServiceDelegate listener:shouldAcceptNewConnection:]();
          }
          int v16 = &_os_log_default;
          id v23 = &_os_log_default;
        }
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
          goto LABEL_78;
        }
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = a2;
        v24 = "Unhandled BTSessionEvent: %d";
        v25 = buf;
        v26 = v16;
        os_log_type_t v27 = OS_LOG_TYPE_INFO;
        goto LABEL_76;
      }
      if (gLogObjects && gNumLogObjects >= 6)
      {
        v14 = *(id *)(gLogObjects + 40);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[ServiceDelegate listener:shouldAcceptNewConnection:]();
        }
        v14 = &_os_log_default;
        id v18 = &_os_log_default;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "BTSession attached", buf, 2u);
      }

      if (a1)
      {
        [v11 setBTSession:a1];
        *(void *)buf = 0;
        [v11 BTSession];
        BTServiceAddCallbacks();
        [v11 BTSession];
        int Default = BTAccessoryManagerGetDefault();
        uint64_t v20 = *(void *)buf;
        v21 = logObjectForModule();
        int v16 = v21;
        if (v20 && !Default)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            LOWORD(v30[0]) = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Successfully established BT session", (uint8_t *)v30, 2u);
          }

          [v11 setBTAccessoryManager:*(void *)buf];
          [v11 setIsBTReady:1];
          int v16 = [v11 setup_complete_semaphore];
          dispatch_semaphore_signal(v16);
          goto LABEL_78;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v30[0] = 67109120;
          v30[1] = 0;
          v24 = "Unable to get default BT accessory manager, result %d";
          v25 = (uint8_t *)v30;
          v26 = v16;
          os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
LABEL_76:
          uint32_t v29 = 8;
          goto LABEL_77;
        }
      }
      else
      {
        int v16 = logObjectForModule();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v24 = "ERROR - ACCBluetoothPairingService __callbackSessionEvent called with a NULL BTSession";
          v25 = buf;
          v26 = v16;
          os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
          uint32_t v29 = 2;
LABEL_77:
          _os_log_impl((void *)&_mh_execute_header, v26, v27, v24, v25, v29);
        }
      }
LABEL_78:

LABEL_79:
    }
  }
}

void __BTPairingAgentStatusEventCallback(uint64_t a1, int a2, uint64_t a3, int a4, void *a5)
{
  id v7 = a5;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 6;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[ServiceDelegate listener:shouldAcceptNewConnection:]();
    }
    id v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 40);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11[0] = 67109634;
    v11[1] = a2;
    __int16 v12 = 1024;
    int v13 = a4;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "__BTPairingAgentStatusEventCallback: event:%d result:%d pairingService:%@", (uint8_t *)v11, 0x18u);
  }
}

void _BTServiceCallback(uint64_t a1, int a2, int a3, int a4, int a5, void *a6)
{
  id v11 = a6;
  if (gLogObjects) {
    BOOL v12 = gNumLogObjects < 6;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[ServiceDelegate listener:shouldAcceptNewConnection:]();
    }
    __int16 v14 = &_os_log_default;
    id v13 = &_os_log_default;
  }
  else
  {
    __int16 v14 = *(id *)(gLogObjects + 40);
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110146;
    int v27 = a2;
    __int16 v28 = 1024;
    int v29 = a3;
    __int16 v30 = 1024;
    int v31 = a4;
    __int16 v32 = 1024;
    int v33 = a5;
    __int16 v34 = 2112;
    id v35 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "_BTServiceCallback: service:%d eventType:%d event:%d result:%d pairingService:%@", buf, 0x24u);
  }

  if (a3 == 1)
  {
    if ((a2 & 0x80) != 0 && a4 == 12)
    {
      if (gLogObjects && gNumLogObjects >= 6)
      {
        int v16 = *(id *)(gLogObjects + 40);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[ServiceDelegate listener:shouldAcceptNewConnection:]();
        }
        int v16 = &_os_log_default;
        id v20 = &_os_log_default;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v27 = a2;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "_BTServiceCallback: BT_SERVICE_DISCONNECT, service 0x%x", buf, 8u);
      }
      goto LABEL_34;
    }
  }
  else if (!a3 && (a2 & 0x80) != 0 && a4 == 11)
  {
    if (gLogObjects && gNumLogObjects >= 6)
    {
      id v15 = *(id *)(gLogObjects + 40);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[ServiceDelegate listener:shouldAcceptNewConnection:]();
      }
      id v15 = &_os_log_default;
      id v17 = &_os_log_default;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v27 = a2;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "_BTServiceCallback: BT_SERVICE_CONNECT, service 0x%x", buf, 8u);
    }

    id v18 = [v11 pairingTimer];
    dispatch_source_set_timer(v18, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);

    v19 = [v11 processingQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = ___BTServiceCallback_block_invoke;
    block[3] = &unk_10000C558;
    id v22 = v11;
    uint64_t v23 = a1;
    int v24 = a5;
    int v25 = a2;
    dispatch_async(v19, block);

    int v16 = v22;
LABEL_34:
  }
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

void logObjectForModule_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __callbackSessionEvent_cold_4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "BTSession detached: after cleanup, pairingService %@", (uint8_t *)&v2, 0xCu);
}

uint64_t BTAccessoryManagerGetDefault()
{
  return _BTAccessoryManagerGetDefault();
}

uint64_t BTDeviceAddressFromString()
{
  return _BTDeviceAddressFromString();
}

uint64_t BTDeviceConnectServices()
{
  return _BTDeviceConnectServices();
}

uint64_t BTDeviceDisconnect()
{
  return _BTDeviceDisconnect();
}

uint64_t BTDeviceFromAddress()
{
  return _BTDeviceFromAddress();
}

uint64_t BTDeviceGetAddressString()
{
  return _BTDeviceGetAddressString();
}

uint64_t BTDeviceGetDefaultName()
{
  return _BTDeviceGetDefaultName();
}

uint64_t BTDeviceGetDeviceType()
{
  return _BTDeviceGetDeviceType();
}

uint64_t BTDeviceGetName()
{
  return _BTDeviceGetName();
}

uint64_t BTDeviceGetSyncSettings()
{
  return _BTDeviceGetSyncSettings();
}

uint64_t BTDeviceSetSyncSettings()
{
  return _BTDeviceSetSyncSettings();
}

uint64_t BTLocalDeviceGetAddressString()
{
  return _BTLocalDeviceGetAddressString();
}

uint64_t BTLocalDeviceGetDefault()
{
  return _BTLocalDeviceGetDefault();
}

uint64_t BTLocalDeviceGetPairedDevices()
{
  return _BTLocalDeviceGetPairedDevices();
}

uint64_t BTPairingAgentClearOOBDataForDevice()
{
  return _BTPairingAgentClearOOBDataForDevice();
}

uint64_t BTPairingAgentCreate()
{
  return _BTPairingAgentCreate();
}

uint64_t BTPairingAgentDestroy()
{
  return _BTPairingAgentDestroy();
}

uint64_t BTPairingAgentSetOOBDataForDevice()
{
  return _BTPairingAgentSetOOBDataForDevice();
}

uint64_t BTServiceAddCallbacks()
{
  return _BTServiceAddCallbacks();
}

uint64_t BTSessionAttachWithQueue()
{
  return _BTSessionAttachWithQueue();
}

uint64_t BTSessionDetachWithQueue()
{
  return _BTSessionDetachWithQueue();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
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
  return _dispatch_time(when, delta);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_BTSession(void *a1, const char *a2, ...)
{
  return [a1 BTSession];
}

id objc_msgSend__AttachToBTServer(void *a1, const char *a2, ...)
{
  return [a1 _AttachToBTServer];
}

id objc_msgSend__createPairingAgent(void *a1, const char *a2, ...)
{
  return [a1 _createPairingAgent];
}

id objc_msgSend__deletePairingAgent(void *a1, const char *a2, ...)
{
  return [a1 _deletePairingAgent];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return [a1 cleanup];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_exportedObject(void *a1, const char *a2, ...)
{
  return [a1 exportedObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_macAddr(void *a1, const char *a2, ...)
{
  return [a1 macAddr];
}

id objc_msgSend_pairingCompletionHandler(void *a1, const char *a2, ...)
{
  return [a1 pairingCompletionHandler];
}

id objc_msgSend_pairingResult(void *a1, const char *a2, ...)
{
  return [a1 pairingResult];
}

id objc_msgSend_pairingStarted(void *a1, const char *a2, ...)
{
  return [a1 pairingStarted];
}

id objc_msgSend_pairingTimer(void *a1, const char *a2, ...)
{
  return [a1 pairingTimer];
}

id objc_msgSend_processingQueue(void *a1, const char *a2, ...)
{
  return [a1 processingQueue];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}