@interface CameraKitHubClassMatch
@end

@implementation CameraKitHubClassMatch

uint64_t ____CameraKitHubClassMatch_block_invoke(uint64_t a1)
{
  kern_return_t v10;
  kern_return_t v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  long long v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x263EF8340];
  MEMORY[0x223CA5E80](*(unsigned int *)(a1 + 40));
  uint64_t v2 = IOIteratorNext(*(_DWORD *)(a1 + 40));
  if (v2)
  {
    uint64_t v4 = v2;
    v5 = MEMORY[0x263EF8438];
    *(void *)&long long v3 = 134218240;
    v18 = v3;
    do
    {
      if (objc_msgSend(*(id *)(a1 + 32), "ioUSB20CameraKitHubService", v18) == v4)
      {
        uint64_t v6 = gLogObjects;
        int v7 = gNumLogObjects;
        if (gLogObjects) {
          BOOL v8 = gNumLogObjects < 1;
        }
        else {
          BOOL v8 = 1;
        }
        if (v8)
        {
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            v20 = v6;
            v21 = 1024;
            v22 = v7;
            _os_log_error_impl(&dword_222C9E000, v5, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v9 = v5;
          v15 = v5;
        }
        else
        {
          v15 = *(id *)gLogObjects;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v20) = v4;
          _os_log_impl(&dword_222C9E000, v15, OS_LOG_TYPE_DEFAULT, "__CameraKitHubClassMatch: ERROR: already registered, service=%x", buf, 8u);
        }
      }
      else
      {
        if ([*(id *)(a1 + 32) ioUSB20CameraKitHubService]) {
          IOObjectRelease([*(id *)(a1 + 32) ioUSB20CameraKitHubService]);
        }
        [*(id *)(a1 + 32) setIoUSB20CameraKitHubService:v4];
        v10 = IOObjectRetain(v4);
        if (v10)
        {
          v11 = v10;
          v12 = gLogObjects;
          v13 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v14 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v18;
              v20 = v12;
              v21 = 1024;
              v22 = v13;
              _os_log_error_impl(&dword_222C9E000, v5, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v16 = v5;
            v14 = v5;
          }
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v20) = v11;
            _os_log_impl(&dword_222C9E000, v14, OS_LOG_TYPE_DEFAULT, "__CameraKitHubClassMatch: ERROR: IOObjectRetain failed %#x", buf, 8u);
          }
        }
        __CameraKitHubClassHandleMatch((void *)2);
      }
      IOObjectRelease(v4);
      uint64_t v4 = IOIteratorNext(*(_DWORD *)(a1 + 40));
    }
    while (v4);
  }
  return IOObjectRelease(*(_DWORD *)(a1 + 40));
}

uint64_t ____CameraKitHubClassMatch_block_invoke_215(uint64_t a1)
{
  kern_return_t v10;
  kern_return_t v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  long long v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x263EF8340];
  MEMORY[0x223CA5E80](*(unsigned int *)(a1 + 40));
  uint64_t v2 = IOIteratorNext(*(_DWORD *)(a1 + 40));
  if (v2)
  {
    uint64_t v4 = v2;
    v5 = MEMORY[0x263EF8438];
    *(void *)&long long v3 = 134218240;
    v18 = v3;
    do
    {
      if (objc_msgSend(*(id *)(a1 + 32), "ioUSB30CameraKitHubService", v18) == v4)
      {
        uint64_t v6 = gLogObjects;
        int v7 = gNumLogObjects;
        if (gLogObjects) {
          BOOL v8 = gNumLogObjects < 1;
        }
        else {
          BOOL v8 = 1;
        }
        if (v8)
        {
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            v20 = v6;
            v21 = 1024;
            v22 = v7;
            _os_log_error_impl(&dword_222C9E000, v5, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v9 = v5;
          v15 = v5;
        }
        else
        {
          v15 = *(id *)gLogObjects;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v20) = v4;
          _os_log_impl(&dword_222C9E000, v15, OS_LOG_TYPE_DEFAULT, "__CameraKitHubClassMatch: ERROR: already registered, service=%x", buf, 8u);
        }
      }
      else
      {
        if ([*(id *)(a1 + 32) ioUSB30CameraKitHubService]) {
          IOObjectRelease([*(id *)(a1 + 32) ioUSB30CameraKitHubService]);
        }
        [*(id *)(a1 + 32) setIoUSB30CameraKitHubService:v4];
        v10 = IOObjectRetain(v4);
        if (v10)
        {
          v11 = v10;
          v12 = gLogObjects;
          v13 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v14 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v18;
              v20 = v12;
              v21 = 1024;
              v22 = v13;
              _os_log_error_impl(&dword_222C9E000, v5, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v16 = v5;
            v14 = v5;
          }
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v20) = v11;
            _os_log_impl(&dword_222C9E000, v14, OS_LOG_TYPE_DEFAULT, "__CameraKitHubClassMatch: ERROR: IOObjectRetain failed %#x", buf, 8u);
          }
        }
        __CameraKitHubClassHandleMatch((void *)3);
      }
      IOObjectRelease(v4);
      uint64_t v4 = IOIteratorNext(*(_DWORD *)(a1 + 40));
    }
    while (v4);
  }
  return IOObjectRelease(*(_DWORD *)(a1 + 40));
}

@end