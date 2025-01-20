@interface ACCHWComponentAuthService
- (BOOL)_getForVeridianFDRData:(id)a3 intermediateCert:(id *)a4 leafCert:(id *)a5;
- (BOOL)_verifyDeviceIDSN:(unsigned int)a3;
- (BOOL)_verifyDeviceInfo:(unsigned int)a3;
- (BOOL)_verifyModuleFDR:(id)a3 forModuleType:(int)a4;
- (int)_signChallenge:(id)a3;
- (int)_verifyBatteryMatch:(id)a3;
- (int)_verifyCertificate:(id)a3;
- (int)_verifyModuleCertificate:(id)a3 forModuleType:(int)a4;
- (int)_verifySignature:(id)a3;
- (unsigned)_findModuleAuthService:(int)a3 withAuthFlags:(unsigned int *)a4;
- (void)_authenticateModuleWithChallenge:(id)a3 completionHandler:(id)a4 moduleType:(int)a5 updateRegistry:(BOOL)a6 updateUIProperty:(BOOL)a7 logToAnalytics:(BOOL)a8;
- (void)_logToAnalytics:(int)a3 authError:(int)a4 fdrValidationStatus:(int)a5 authDurationInMS:(unint64_t)a6;
- (void)_notifyComponentAuthFailure;
- (void)authenticateBatteryWithChallenge:(id)a3 completionHandler:(id)a4;
- (void)authenticateTouchControllerWithChallenge:(id)a3 completionHandler:(id)a4 updateRegistry:(BOOL)a5;
- (void)authenticateVeridianWithChallenge:(id)a3 completionHandler:(id)a4;
- (void)authenticateVeridianWithChallenge:(id)a3 completionHandler:(id)a4 updateRegistry:(BOOL)a5 updateUIProperty:(BOOL)a6 logToAnalytics:(BOOL)a7;
- (void)signVeridianChallenge:(id)a3 completionHandler:(id)a4;
- (void)verifyBatteryMatch:(id)a3 completionHandler:(id)a4;
@end

@implementation ACCHWComponentAuthService

- (void)authenticateBatteryWithChallenge:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (authenticateBatteryWithChallenge_completionHandler__onceToken != -1) {
    dispatch_once(&authenticateBatteryWithChallenge_completionHandler__onceToken, &__block_literal_global_1);
  }
  v8 = authenticateBatteryWithChallenge_completionHandler__batteryQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__ACCHWComponentAuthService_authenticateBatteryWithChallenge_completionHandler___block_invoke_2;
  block[3] = &unk_264C95150;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __80__ACCHWComponentAuthService_authenticateBatteryWithChallenge_completionHandler___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.ACCHWComponentAuthService.battery", 0);
  v1 = (void *)authenticateBatteryWithChallenge_completionHandler__batteryQueue;
  authenticateBatteryWithChallenge_completionHandler__batteryQueue = (uint64_t)v0;

  v2 = authenticateBatteryWithChallenge_completionHandler__batteryQueue;
  v3 = dispatch_get_global_queue(25, 0);
  dispatch_set_target_queue(v2, v3);
}

uint64_t __80__ACCHWComponentAuthService_authenticateBatteryWithChallenge_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _authenticateModuleWithChallenge:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48) moduleType:0 updateRegistry:0 updateUIProperty:0 logToAnalytics:0];
}

- (void)authenticateTouchControllerWithChallenge:(id)a3 completionHandler:(id)a4 updateRegistry:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (authenticateTouchControllerWithChallenge_completionHandler_updateRegistry__onceToken != -1) {
    dispatch_once(&authenticateTouchControllerWithChallenge_completionHandler_updateRegistry__onceToken, &__block_literal_global_103);
  }
  id v10 = authenticateTouchControllerWithChallenge_completionHandler_updateRegistry__touchControllerQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __103__ACCHWComponentAuthService_authenticateTouchControllerWithChallenge_completionHandler_updateRegistry___block_invoke_2;
  v13[3] = &unk_264C95178;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __103__ACCHWComponentAuthService_authenticateTouchControllerWithChallenge_completionHandler_updateRegistry___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.ACCHWComponentAuthService.touchcontroller", 0);
  v1 = (void *)authenticateTouchControllerWithChallenge_completionHandler_updateRegistry__touchControllerQueue;
  authenticateTouchControllerWithChallenge_completionHandler_updateRegistry__touchControllerQueue = (uint64_t)v0;

  v2 = authenticateTouchControllerWithChallenge_completionHandler_updateRegistry__touchControllerQueue;
  v3 = dispatch_get_global_queue(25, 0);
  dispatch_set_target_queue(v2, v3);
}

uint64_t __103__ACCHWComponentAuthService_authenticateTouchControllerWithChallenge_completionHandler_updateRegistry___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _authenticateModuleWithChallenge:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48) moduleType:1 updateRegistry:*(unsigned __int8 *)(a1 + 56) updateUIProperty:*(unsigned __int8 *)(a1 + 56) logToAnalytics:0];
}

- (void)authenticateVeridianWithChallenge:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (authenticateVeridianWithChallenge_completionHandler__onceToken != -1) {
    dispatch_once(&authenticateVeridianWithChallenge_completionHandler__onceToken, &__block_literal_global_106);
  }
  id v8 = authenticateVeridianWithChallenge_completionHandler__veridianQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__ACCHWComponentAuthService_authenticateVeridianWithChallenge_completionHandler___block_invoke_2;
  block[3] = &unk_264C95150;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __81__ACCHWComponentAuthService_authenticateVeridianWithChallenge_completionHandler___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.ACCHWComponentAuthService.veridian", 0);
  v1 = (void *)authenticateVeridianWithChallenge_completionHandler__veridianQueue;
  authenticateVeridianWithChallenge_completionHandler__veridianQueue = (uint64_t)v0;

  v2 = authenticateVeridianWithChallenge_completionHandler__veridianQueue;
  v3 = dispatch_get_global_queue(25, 0);
  dispatch_set_target_queue(v2, v3);
}

uint64_t __81__ACCHWComponentAuthService_authenticateVeridianWithChallenge_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _authenticateModuleWithChallenge:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48) moduleType:2 updateRegistry:0 updateUIProperty:0 logToAnalytics:0];
}

- (void)authenticateVeridianWithChallenge:(id)a3 completionHandler:(id)a4 updateRegistry:(BOOL)a5 updateUIProperty:(BOOL)a6 logToAnalytics:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  if (authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics__onceToken != -1) {
    dispatch_once(&authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics__onceToken, &__block_literal_global_109);
  }
  id v14 = authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics__veridianQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __128__ACCHWComponentAuthService_authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics___block_invoke_2;
  v17[3] = &unk_264C951A0;
  v17[4] = self;
  id v18 = v12;
  id v19 = v13;
  BOOL v20 = a5;
  BOOL v21 = a6;
  BOOL v22 = a7;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(v14, v17);
}

void __128__ACCHWComponentAuthService_authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.ACCHWComponentAuthService.veridian", 0);
  v1 = (void *)authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics__veridianQueue;
  authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics__veridianQueue = (uint64_t)v0;

  v2 = authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics__veridianQueue;
  v3 = dispatch_get_global_queue(25, 0);
  dispatch_set_target_queue(v2, v3);
}

uint64_t __128__ACCHWComponentAuthService_authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _authenticateModuleWithChallenge:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48) moduleType:2 updateRegistry:*(unsigned __int8 *)(a1 + 56) updateUIProperty:*(unsigned __int8 *)(a1 + 57) logToAnalytics:*(unsigned __int8 *)(a1 + 58)];
}

- (void)_authenticateModuleWithChallenge:(id)a3 completionHandler:(id)a4 moduleType:(int)a5 updateRegistry:(BOOL)a6 updateUIProperty:(BOOL)a7 logToAnalytics:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v159 = a7;
  BOOL v163 = a6;
  uint64_t v173 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = (void (**)(id, void, void *, void *, BOOL, uint64_t))a4;
  init_logging();
  id v14 = objc_alloc_init(ACCHWComponentAuthServiceParams);
  unsigned int v169 = -1431655766;
  __tp.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  __tp.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  unsigned __int8 valuePtr = 0;
  unint64_t CurrentUnixTimeMS = systemInfo_getCurrentUnixTimeMS();
  v165[0] = MEMORY[0x263EF8330];
  v165[1] = 3221225472;
  v165[2] = __138__ACCHWComponentAuthService__authenticateModuleWithChallenge_completionHandler_moduleType_updateRegistry_updateUIProperty_logToAnalytics___block_invoke;
  v165[3] = &__block_descriptor_36_e5_v8__0l;
  int v166 = a5;
  id v16 = v165;
  if (_authenticateModuleWithChallenge_completionHandler_moduleType_updateRegistry_updateUIProperty_logToAnalytics__onceToken != -1) {
    dispatch_once(&_authenticateModuleWithChallenge_completionHandler_moduleType_updateRegistry_updateUIProperty_logToAnalytics__onceToken, v16);
  }

  unint64_t v17 = 0x26884D000uLL;
  BOOL v162 = v8;
  unint64_t v160 = CurrentUnixTimeMS;
  if (_authenticateModuleWithChallenge_completionHandler_moduleType_updateRegistry_updateUIProperty_logToAnalytics__disableAuth)
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      id v18 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ACASignVeridianChallenge_cold_1();
      }
      id v18 = &_os_log_internal;
      id v20 = &_os_log_internal;
    }
    v161 = v12;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a5;
      _os_log_impl(&dword_235F30000, v18, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) skip component auth", buf, 8u);
    }

    [(ACCHWComponentAuthServiceParams *)v14 setSignature:0];
    [(ACCHWComponentAuthServiceParams *)v14 setCertificate:0];
    [(ACCHWComponentAuthServiceParams *)v14 setCertificateInfo:0];
    [(ACCHWComponentAuthServiceParams *)v14 setSkipComms:0];
    uint64_t v21 = 0;
    BOOL v22 = 1;
    goto LABEL_266;
  }
  if (gLogObjects && gNumLogObjects >= 4)
  {
    id v19 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ACASignVeridianChallenge_cold_1();
    }
    id v19 = &_os_log_internal;
    id v23 = &_os_log_internal;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = a5;
    _os_log_impl(&dword_235F30000, v19, OS_LOG_TYPE_DEFAULT, "(moduleType=%d)", buf, 8u);
  }

  clock_gettime(_CLOCK_REALTIME, &__tp);
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v24 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ACASignVeridianChallenge_cold_1();
    }
    v24 = &_os_log_internal;
    id v25 = &_os_log_internal;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = a5;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = 339;
    *(_WORD *)&buf[14] = 2048;
    *(void *)&buf[16] = __tp.tv_sec;
    *(_WORD *)&buf[24] = 2048;
    *(void *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
    _os_log_impl(&dword_235F30000, v24, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
  }

  [(ACCHWComponentAuthServiceParams *)v14 setModuleAuthService:[(ACCHWComponentAuthService *)self _findModuleAuthService:a5 withAuthFlags:&v169]];
  if (![(ACCHWComponentAuthServiceParams *)v14 moduleAuthService])
  {
    v161 = v12;
    v156 = logObjectForModule();
    if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a5;
      _os_log_impl(&dword_235F30000, v156, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) Error: The component AppleAuthCP was not found", buf, 8u);
    }

    BOOL v22 = 0;
    BOOL v163 = 0;
    uint64_t v21 = 22;
    goto LABEL_266;
  }
  io_registry_entry_t v26 = [(ACCHWComponentAuthServiceParams *)v14 moduleAuthService];
  CFAllocatorRef v27 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (!IORegistryEntryCreateCFProperty(v26, @"iboot-auth", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0))
  {
    if (!v12)
    {
      *(void *)&long long v33 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)buf = v33;
      *(_OWORD *)&buf[16] = v33;
      arc4random_buf(buf, 0x20uLL);
      id v12 = [MEMORY[0x263EFF8F8] dataWithBytes:buf length:32];
    }
    goto LABEL_49;
  }
  v28 = IORegistryEntryCreateCFProperty([(ACCHWComponentAuthServiceParams *)v14 moduleAuthService], @"pretend_auth", v27, 0);
  if (v28)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v29 = [v28 charValue];
      if ((v29 - 3) >= 0xFEu)
      {
        v161 = v12;
        if (v29 == 1)
        {
          BOOL v22 = 0;
          uint64_t v21 = 29;
        }
        else if (v29 == 2)
        {
          uint64_t v21 = 0;
          BOOL v22 = 1;
        }
        else
        {
          BOOL v22 = 0;
          uint64_t v21 = 30;
        }
        [(ACCHWComponentAuthServiceParams *)v14 setSignature:0];
        [(ACCHWComponentAuthServiceParams *)v14 setCertificate:0];
        [(ACCHWComponentAuthServiceParams *)v14 setCertificateInfo:0];
        [(ACCHWComponentAuthServiceParams *)v14 setSkipComms:0];

        goto LABEL_266;
      }
    }
  }

  if (v12) {
    goto LABEL_49;
  }
  v30 = IORegistryEntryCreateCFProperty([(ACCHWComponentAuthServiceParams *)v14 moduleAuthService], @"Challenge", v27, 0);
  if (v30)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v30;
      [(ACCHWComponentAuthServiceParams *)v14 setChallenge:v12];
      v31 = IORegistryEntryCreateCFProperty([(ACCHWComponentAuthServiceParams *)v14 moduleAuthService], @"Signature", v27, 0);
      if (v31)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(ACCHWComponentAuthServiceParams *)v14 setSignature:v31];
          CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty([(ACCHWComponentAuthServiceParams *)v14 moduleAuthService], @"authError", v27, 0);
          CFNumberGetValue(CFProperty, kCFNumberSInt8Type, &valuePtr);
          if (valuePtr >= 0x1Fu) {
            unsigned __int8 valuePtr = 0;
          }
          [(ACCHWComponentAuthServiceParams *)v14 setCertificate:0];
          [(ACCHWComponentAuthServiceParams *)v14 setCertificateInfo:0];
          [(ACCHWComponentAuthServiceParams *)v14 setSkipComms:1];

          goto LABEL_48;
        }
      }
      v161 = v12;
      v157 = logObjectForModule();
      if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = a5;
        _os_log_impl(&dword_235F30000, v157, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) Error: signature==NULL", buf, 8u);
      }
    }
    else
    {
      v31 = logObjectForModule();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = a5;
        _os_log_impl(&dword_235F30000, v31, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) Error: challenge==NULL", buf, 8u);
      }
      v161 = 0;
    }

    BOOL v22 = 0;
    uint64_t v21 = 20;
    goto LABEL_266;
  }
  *(void *)&long long v34 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v34;
  *(_OWORD *)&buf[16] = v34;
  arc4random_buf(buf, 0x20uLL);
  id v12 = [MEMORY[0x263EFF8F8] dataWithBytes:buf length:32];
LABEL_48:

LABEL_49:
  [(ACCHWComponentAuthServiceParams *)v14 setChallenge:v12];
  [(ACCHWComponentAuthServiceParams *)v14 setAuthFlags:v169];
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v35 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ACASignVeridianChallenge_cold_1();
    }
    v35 = &_os_log_internal;
    id v36 = &_os_log_internal;
  }
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
    -[ACCHWComponentAuthService _authenticateModuleWithChallenge:completionHandler:moduleType:updateRegistry:updateUIProperty:logToAnalytics:]6(v14);
  }
  v161 = v12;

  if (a5 == 2)
  {
    int v38 = -1;
    v39 = &_os_log_internal;
    *(void *)&long long v37 = 67109376;
    long long v158 = v37;
    while (1)
    {
      uint64_t v40 = gLogObjects;
      int v41 = *(_DWORD *)(v17 + 2696);
      if (gLogObjects) {
        BOOL v42 = v41 < 4;
      }
      else {
        BOOL v42 = 1;
      }
      if (v42)
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = v40;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v41;
          _os_log_error_impl(&dword_235F30000, v39, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v43 = v39;
        v44 = v39;
      }
      else
      {
        v44 = *(id *)(gLogObjects + 24);
      }
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&buf[4] = 2;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v38 + 1;
        *(_WORD *)&buf[14] = 1024;
        *(_DWORD *)&buf[16] = 3;
        _os_log_debug_impl(&dword_235F30000, v44, OS_LOG_TYPE_DEBUG, "(moduleType=%d) tryCount = %d (max tries %d)", buf, 0x14u);
      }

      clock_gettime(_CLOCK_REALTIME, &__tp);
      uint64_t v45 = gLogObjects;
      int v46 = *(_DWORD *)(v17 + 2696);
      if (gLogObjects && v46 >= 4)
      {
        v47 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = v45;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v46;
          _os_log_error_impl(&dword_235F30000, v39, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v48 = v39;
        v47 = v39;
      }
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)&buf[4] = 2;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = 438;
        *(_WORD *)&buf[14] = 2048;
        *(void *)&buf[16] = __tp.tv_sec;
        *(_WORD *)&buf[24] = 2048;
        *(void *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
        _os_log_impl(&dword_235F30000, v47, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
      }

      if ([(ACCHWComponentAuthService *)self _verifyDeviceIDSN:[(ACCHWComponentAuthServiceParams *)v14 moduleAuthService]])
      {
        clock_gettime(_CLOCK_REALTIME, &__tp);
        uint64_t v49 = gLogObjects;
        int v50 = *(_DWORD *)(v17 + 2696);
        if (gLogObjects && v50 >= 4)
        {
          v51 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)&buf[4] = v49;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v50;
            _os_log_error_impl(&dword_235F30000, v39, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v55 = v39;
          v51 = v39;
        }
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)&buf[4] = 2;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = 446;
          *(_WORD *)&buf[14] = 2048;
          *(void *)&buf[16] = __tp.tv_sec;
          *(_WORD *)&buf[24] = 2048;
          *(void *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
          _os_log_impl(&dword_235F30000, v51, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
        }

        unsigned int v56 = [(ACCHWComponentAuthService *)self _signChallenge:v14];
        if (!v56)
        {
LABEL_208:
          clock_gettime(_CLOCK_REALTIME, &__tp);
          if (gLogObjects && *(int *)(v17 + 2696) >= 4)
          {
            v108 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              ACASignVeridianChallenge_cold_1();
            }
            v108 = &_os_log_internal;
            id v110 = &_os_log_internal;
          }
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109888;
            *(_DWORD *)&buf[4] = 2;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = 459;
            *(_WORD *)&buf[14] = 2048;
            *(void *)&buf[16] = __tp.tv_sec;
            *(_WORD *)&buf[24] = 2048;
            *(void *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
            _os_log_impl(&dword_235F30000, v108, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
          }

          BOOL v111 = [(ACCHWComponentAuthService *)self _verifyModuleFDR:v14 forModuleType:2];
          BOOL v22 = v111;
          if (v111) {
            unsigned int v112 = 0;
          }
          else {
            unsigned int v112 = 21;
          }
          if (v56) {
            uint64_t v21 = v56;
          }
          else {
            uint64_t v21 = v112;
          }
          if (!v56 && v111)
          {
            clock_gettime(_CLOCK_REALTIME, &__tp);
            if (gLogObjects && gNumLogObjects >= 4)
            {
              v113 = *(id *)(gLogObjects + 24);
            }
            else
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                ACASignVeridianChallenge_cold_1();
              }
              v113 = &_os_log_internal;
              id v115 = &_os_log_internal;
            }
            if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109888;
              *(_DWORD *)&buf[4] = 2;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = 467;
              *(_WORD *)&buf[14] = 2048;
              *(void *)&buf[16] = __tp.tv_sec;
              *(_WORD *)&buf[24] = 2048;
              *(void *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
              _os_log_impl(&dword_235F30000, v113, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
            }

            uint64_t v21 = [(ACCHWComponentAuthService *)self _verifyModuleCertificate:v14 forModuleType:2];
            if (v21)
            {
              if (gLogObjects && gNumLogObjects >= 4)
              {
                v116 = *(id *)(gLogObjects + 24);
              }
              else
              {
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  ACASignVeridianChallenge_cold_1();
                }
                v116 = &_os_log_internal;
                id v117 = &_os_log_internal;
              }
              if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR)) {
                -[ACCHWComponentAuthService _authenticateModuleWithChallenge:completionHandler:moduleType:updateRegistry:updateUIProperty:logToAnalytics:]0(v21, v116);
              }
            }
            BOOL v22 = 1;
          }
          goto LABEL_252;
        }
        uint64_t v57 = gLogObjects;
        int v58 = *(_DWORD *)(v17 + 2696);
        if (gLogObjects && v58 >= 4)
        {
          v54 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)&buf[4] = v57;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v58;
            _os_log_error_impl(&dword_235F30000, v39, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v60 = v39;
          v54 = v39;
        }
        unint64_t v17 = 0x26884D000;
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v158;
          *(_DWORD *)&buf[4] = 2;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = v56;
          _os_log_error_impl(&dword_235F30000, v54, OS_LOG_TYPE_ERROR, "(moduleType=%d) authError %d after _signChallenge", buf, 0xEu);
        }
      }
      else
      {
        uint64_t v52 = gLogObjects;
        int v53 = *(_DWORD *)(v17 + 2696);
        if (gLogObjects && v53 >= 4)
        {
          v54 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)&buf[4] = v52;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v53;
            _os_log_error_impl(&dword_235F30000, v39, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v59 = v39;
          v54 = v39;
        }
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          -[ACCHWComponentAuthService _authenticateModuleWithChallenge:completionHandler:moduleType:updateRegistry:updateUIProperty:logToAnalytics:]4(v170, v171, v54);
        }
        unsigned int v56 = 18;
      }

      if (++v38 >= 2) {
        goto LABEL_208;
      }
    }
  }
  int v61 = -1;
  v62 = &_os_log_internal;
  *(void *)&long long v37 = 67109376;
  long long v158 = v37;
  while (1)
  {
    uint64_t v63 = gLogObjects;
    int v64 = gNumLogObjects;
    if (gLogObjects) {
      BOOL v65 = gNumLogObjects < 4;
    }
    else {
      BOOL v65 = 1;
    }
    if (v65)
    {
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v63;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v64;
        _os_log_error_impl(&dword_235F30000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      v66 = v62;
      v67 = v62;
    }
    else
    {
      v67 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&buf[4] = a5;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v61 + 1;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = 3;
      _os_log_debug_impl(&dword_235F30000, v67, OS_LOG_TYPE_DEBUG, "(moduleType=%d) tryCount = %d (max tries %d)", buf, 0x14u);
    }

    clock_gettime(_CLOCK_REALTIME, &__tp);
    uint64_t v68 = gLogObjects;
    int v69 = gNumLogObjects;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v70 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v68;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v69;
        _os_log_error_impl(&dword_235F30000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      v71 = v62;
      v70 = v62;
    }
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&buf[4] = a5;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = 479;
      *(_WORD *)&buf[14] = 2048;
      *(void *)&buf[16] = __tp.tv_sec;
      *(_WORD *)&buf[24] = 2048;
      *(void *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
      _os_log_impl(&dword_235F30000, v70, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
    }

    if (![(ACCHWComponentAuthService *)self _verifyDeviceInfo:[(ACCHWComponentAuthServiceParams *)v14 moduleAuthService]])
    {
      uint64_t v75 = gLogObjects;
      int v76 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v77 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = v75;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v76;
          _os_log_error_impl(&dword_235F30000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v82 = v62;
        v77 = v62;
      }
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = a5;
        _os_log_error_impl(&dword_235F30000, v77, OS_LOG_TYPE_ERROR, "(moduleType=%d) authError = eAuthDeviceInfoError after _verifyDeviceInfo", buf, 8u);
      }
      uint64_t v21 = 1;
      goto LABEL_206;
    }
    clock_gettime(_CLOCK_REALTIME, &__tp);
    uint64_t v72 = gLogObjects;
    int v73 = gNumLogObjects;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v74 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v72;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v73;
        _os_log_error_impl(&dword_235F30000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      v78 = v62;
      v74 = v62;
    }
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&buf[4] = a5;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = 488;
      *(_WORD *)&buf[14] = 2048;
      *(void *)&buf[16] = __tp.tv_sec;
      *(_WORD *)&buf[24] = 2048;
      *(void *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
      _os_log_impl(&dword_235F30000, v74, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
    }

    if (![(ACCHWComponentAuthService *)self _verifyDeviceIDSN:[(ACCHWComponentAuthServiceParams *)v14 moduleAuthService]])
    {
      uint64_t v83 = gLogObjects;
      int v84 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v77 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = v83;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v84;
          _os_log_error_impl(&dword_235F30000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v89 = v62;
        v77 = v62;
      }
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = a5;
        _os_log_error_impl(&dword_235F30000, v77, OS_LOG_TYPE_ERROR, "(moduleType=%d) authError = eNoDeviceIDSNError after _verifyDeviceIDSN", buf, 8u);
      }
      uint64_t v21 = 18;
      goto LABEL_206;
    }
    clock_gettime(_CLOCK_REALTIME, &__tp);
    uint64_t v79 = gLogObjects;
    int v80 = gNumLogObjects;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v81 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v79;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v80;
        _os_log_error_impl(&dword_235F30000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      v85 = v62;
      v81 = v62;
    }
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&buf[4] = a5;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = 497;
      *(_WORD *)&buf[14] = 2048;
      *(void *)&buf[16] = __tp.tv_sec;
      *(_WORD *)&buf[24] = 2048;
      *(void *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
      _os_log_impl(&dword_235F30000, v81, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
    }

    uint64_t v86 = [(ACCHWComponentAuthService *)self _verifyCertificate:v14];
    if (!v86) {
      break;
    }
    uint64_t v21 = v86;
    uint64_t v87 = gLogObjects;
    int v88 = gNumLogObjects;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v77 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v87;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v88;
        _os_log_error_impl(&dword_235F30000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      v93 = v62;
      v77 = v62;
    }
    if (!os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
      goto LABEL_206;
    }
    *(_DWORD *)buf = v158;
    *(_DWORD *)&buf[4] = a5;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v21;
    v94 = v77;
    v95 = "(moduleType=%d) authError %d after _verifyCertificate";
LABEL_205:
    _os_log_error_impl(&dword_235F30000, v94, OS_LOG_TYPE_ERROR, v95, buf, 0xEu);
LABEL_206:

    if (++v61 >= 2) {
      goto LABEL_211;
    }
  }
  if (![(ACCHWComponentAuthServiceParams *)v14 skipComms])
  {
    clock_gettime(_CLOCK_REALTIME, &__tp);
    uint64_t v90 = gLogObjects;
    int v91 = gNumLogObjects;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v92 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v90;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v91;
        _os_log_error_impl(&dword_235F30000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      v96 = v62;
      v92 = v62;
    }
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&buf[4] = a5;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = 506;
      *(_WORD *)&buf[14] = 2048;
      *(void *)&buf[16] = __tp.tv_sec;
      *(_WORD *)&buf[24] = 2048;
      *(void *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
      _os_log_impl(&dword_235F30000, v92, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
    }

    uint64_t v97 = [(ACCHWComponentAuthService *)self _verifySignature:v14];
    if (v97)
    {
      uint64_t v21 = v97;
      uint64_t v98 = gLogObjects;
      int v99 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v77 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = v98;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v99;
          _os_log_error_impl(&dword_235F30000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v107 = v62;
        v77 = v62;
      }
      if (!os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
        goto LABEL_206;
      }
      *(_DWORD *)buf = v158;
      *(_DWORD *)&buf[4] = a5;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v21;
      v94 = v77;
      v95 = "(moduleType=%d) authError %d after _verifySignature";
      goto LABEL_205;
    }
  }
  clock_gettime(_CLOCK_REALTIME, &__tp);
  uint64_t v100 = gLogObjects;
  int v101 = gNumLogObjects;
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v102 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v100;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v101;
      _os_log_error_impl(&dword_235F30000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
    }
    v103 = v62;
    v102 = v62;
  }
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = a5;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = 515;
    *(_WORD *)&buf[14] = 2048;
    *(void *)&buf[16] = __tp.tv_sec;
    *(_WORD *)&buf[24] = 2048;
    *(void *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
    _os_log_impl(&dword_235F30000, v102, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
  }

  uint64_t v21 = [(ACCHWComponentAuthService *)self _verifyModuleCertificate:v14 forModuleType:a5];
  if (v21)
  {
    uint64_t v104 = gLogObjects;
    int v105 = gNumLogObjects;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v77 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v104;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v105;
        _os_log_error_impl(&dword_235F30000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      v106 = v62;
      v77 = v62;
    }
    if (!os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
      goto LABEL_206;
    }
    *(_DWORD *)buf = v158;
    *(_DWORD *)&buf[4] = a5;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v21;
    v94 = v77;
    v95 = "(moduleType=%d) authError = %d after _verifyModuleCertificate";
    goto LABEL_205;
  }
LABEL_211:
  clock_gettime(_CLOCK_REALTIME, &__tp);
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v109 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ACASignVeridianChallenge_cold_1();
    }
    v109 = &_os_log_internal;
    id v114 = &_os_log_internal;
  }
  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = a5;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = 528;
    *(_WORD *)&buf[14] = 2048;
    *(void *)&buf[16] = __tp.tv_sec;
    *(_WORD *)&buf[24] = 2048;
    *(void *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
    _os_log_impl(&dword_235F30000, v109, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
  }

  BOOL v22 = [(ACCHWComponentAuthService *)self _verifyModuleFDR:v14 forModuleType:a5];
LABEL_252:
  if (a5 == 2)
  {
    clock_gettime(_CLOCK_REALTIME, &__tp);
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v118 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ACASignVeridianChallenge_cold_1();
      }
      v118 = &_os_log_internal;
      id v119 = &_os_log_internal;
    }
    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)&buf[4] = 2;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = 537;
      *(_DWORD *)buf = 67109888;
      *(void *)&buf[16] = __tp.tv_sec;
      *(_WORD *)&buf[14] = 2048;
      *(_WORD *)&buf[24] = 2048;
      *(void *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
      _os_log_impl(&dword_235F30000, v118, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
    }

    if (!v21)
    {
      v120 = [(ACCHWComponentAuthServiceParams *)v14 certificate];
      uint64_t v21 = [(ACCHWComponentAuthService *)self _verifyBatteryMatch:v120];
    }
  }
LABEL_266:
  int v121 = v21 == 0;
  if ([(ACCHWComponentAuthServiceParams *)v14 skipComms])
  {
    BOOL v122 = v21 == 0;
    int v121 = v122 ^ (v122 && valuePtr != 0);
    if (v122 && valuePtr != 0) {
      uint64_t v21 = valuePtr;
    }
    else {
      uint64_t v21 = v21;
    }
  }
  BOOL v123 = v121 & v22;
  if (v21 != 22 && !v123) {
    [(ACCHWComponentAuthService *)self _notifyComponentAuthFailure];
  }
  if (v163)
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v124 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ACASignVeridianChallenge_cold_1();
      }
      v124 = &_os_log_internal;
      id v125 = &_os_log_internal;
    }
    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a5;
      _os_log_impl(&dword_235F30000, v124, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) updateRegistry", buf, 8u);
    }

    if (![(ACCHWComponentAuthServiceParams *)v14 moduleAuthService]) {
      [(ACCHWComponentAuthServiceParams *)v14 setModuleAuthService:[(ACCHWComponentAuthService *)self _findModuleAuthService:a5 withAuthFlags:&v169]];
    }
    if ([(ACCHWComponentAuthServiceParams *)v14 moduleAuthService])
    {
      io_connect_t connect = 0;
      io_service_t v126 = [(ACCHWComponentAuthServiceParams *)v14 moduleAuthService];
      if (!IOServiceOpen(v126, *MEMORY[0x263EF8960], 0, &connect))
      {
        if (gLogObjects && gNumLogObjects >= 4)
        {
          v127 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            ACASignVeridianChallenge_cold_1();
          }
          v127 = &_os_log_internal;
          id v128 = &_os_log_internal;
        }
        if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = a5;
          _os_log_impl(&dword_235F30000, v127, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) updateRegistry: cpSetAuthStatus, cpSetTrustStatus", buf, 8u);
        }

        int v129 = cpSetAuthStatus(connect, v121 & 1);
        if (v129)
        {
          int v130 = v129;
          if (gLogObjects && gNumLogObjects >= 4)
          {
            v131 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              ACASignVeridianChallenge_cold_1();
            }
            v131 = &_os_log_internal;
            id v132 = &_os_log_internal;
          }
          if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&buf[4] = a5;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = v130;
            _os_log_impl(&dword_235F30000, v131, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) cpSetAuthStatus failed: 0x%x", buf, 0xEu);
          }
        }
        int v133 = cpSetTrustStatus(connect, v121 & v22);
        if (v133)
        {
          int v134 = v133;
          if (gLogObjects && gNumLogObjects >= 4)
          {
            v135 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              ACASignVeridianChallenge_cold_1();
            }
            v135 = &_os_log_internal;
            id v136 = &_os_log_internal;
          }
          if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&buf[4] = a5;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = v134;
            _os_log_impl(&dword_235F30000, v135, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) cpSetTrustStatus failed: 0x%x", buf, 0xEu);
          }
        }
        if (v123 && v159)
        {
          int v137 = cpSetTrustStatusForUI(connect, 1u);
          if (v137)
          {
            int v138 = v137;
            if (gLogObjects && gNumLogObjects >= 4)
            {
              v139 = *(id *)(gLogObjects + 24);
            }
            else
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                ACASignVeridianChallenge_cold_1();
              }
              v139 = &_os_log_internal;
              id v140 = &_os_log_internal;
            }
            if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = a5;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v138;
              _os_log_impl(&dword_235F30000, v139, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) cpSetTrustStatusForUI failed: 0x%x", buf, 0xEu);
            }
          }
        }
        int v141 = cpSetAuthError(connect, v21);
        if (v141)
        {
          int v142 = v141;
          if (gLogObjects && gNumLogObjects >= 4)
          {
            v143 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              ACASignVeridianChallenge_cold_1();
            }
            v143 = &_os_log_internal;
            id v144 = &_os_log_internal;
          }
          if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&buf[4] = a5;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = v142;
            _os_log_impl(&dword_235F30000, v143, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) cpSetAuthError failed: 0x%x", buf, 0xEu);
          }
        }
        if (v21 > 0x1D) {
          v145 = "UninitializedAuthError";
        }
        else {
          v145 = kACCTransport_IOAccessoryAuthCP_AuthError_Strings[v21];
        }
        CFStringRef v146 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v145, 0x8000100u);
        if (v146)
        {
          CFStringRef v147 = v146;
          cpSetAuthErrorDescription(connect, v146);
          CFRelease(v147);
        }
        IOServiceClose(connect);
      }
    }
  }
  if (v162)
  {
    unint64_t v148 = systemInfo_getCurrentUnixTimeMS() - v160;
    if (v22) {
      uint64_t v149 = 2;
    }
    else {
      uint64_t v149 = 1;
    }
    -[ACCHWComponentAuthService _logToAnalytics:authError:fdrValidationStatus:authDurationInMS:](self, "_logToAnalytics:authError:fdrValidationStatus:authDurationInMS:", a5, v21, v149, v148, v158);
  }
  clock_gettime(_CLOCK_REALTIME, &__tp);
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v150 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ACASignVeridianChallenge_cold_1();
    }
    v150 = &_os_log_internal;
    id v151 = &_os_log_internal;
  }
  if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = a5;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = 626;
    *(_WORD *)&buf[14] = 2048;
    *(void *)&buf[16] = __tp.tv_sec;
    *(_WORD *)&buf[24] = 2048;
    *(void *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
    _os_log_impl(&dword_235F30000, v150, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
  }

  if (gLogObjects && gNumLogObjects >= 4)
  {
    v152 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ACASignVeridianChallenge_cold_1();
    }
    v152 = &_os_log_internal;
    id v153 = &_os_log_internal;
  }
  if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = a5;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v121 & 1;
    *(_WORD *)&buf[14] = 1024;
    *(_DWORD *)&buf[16] = v22;
    *(_WORD *)&buf[20] = 1024;
    *(_DWORD *)&buf[22] = v21;
    _os_log_impl(&dword_235F30000, v152, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) Replying with authPassed = %d, fdrValid = %d, authError = %d", buf, 0x1Au);
  }

  v154 = [(ACCHWComponentAuthServiceParams *)v14 certificate];
  v155 = [(ACCHWComponentAuthServiceParams *)v14 signature];
  v13[2](v13, v121 & 1, v154, v155, v22, v21);
}

void __138__ACCHWComponentAuthService__authenticateModuleWithChallenge_completionHandler_moduleType_updateRegistry_updateUIProperty_logToAnalytics___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  __tp.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  __tp.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 4;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ACASignVeridianChallenge_cold_1();
    }
    v4 = &_os_log_internal;
    id v3 = &_os_log_internal;
  }
  else
  {
    v4 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1 + 32);
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = v5;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = 313;
    *(_WORD *)&buf[14] = 2048;
    *(void *)id v15 = __tp.tv_sec;
    *(_WORD *)&v15[8] = 2048;
    *(void *)&v15[10] = __tp.tv_nsec / 0xF4240uLL;
    _os_log_impl(&dword_235F30000, v4, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
  }

  unint64_t v41 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v39 = v6;
  long long v40 = v6;
  long long v37 = v6;
  long long v38 = v6;
  long long v35 = v6;
  long long v36 = v6;
  long long v33 = v6;
  long long v34 = v6;
  long long v31 = v6;
  long long v32 = v6;
  long long v29 = v6;
  long long v30 = v6;
  long long v27 = v6;
  long long v28 = v6;
  long long v25 = v6;
  long long v26 = v6;
  long long v23 = v6;
  long long v24 = v6;
  long long v21 = v6;
  long long v22 = v6;
  long long v20 = v6;
  long long v18 = v6;
  long long v19 = v6;
  long long v16 = v6;
  long long v17 = v6;
  *(_OWORD *)id v15 = v6;
  *(_OWORD *)&v15[16] = v6;
  *(_OWORD *)buf = v6;
  char v13 = 0;
  id v7 = [MEMORY[0x263F53618] sharedDataAccessor];
  BOOL v8 = (void *)[v7 copyPathForPersonalizedData:2 error:0];

  if (v8
    && ([MEMORY[0x263EFF8F8] dataWithContentsOfFile:v8],
        (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = v9;
    if (Img4DecodeInitManifest([v10 bytes], objc_msgSend(v10, "length"), (uint64_t)buf))
    {
      char v11 = 0;
    }
    else if (Img4DecodeGetBooleanFromSection((uint64_t)buf, 0, 1684104054, (BOOL *)&v13))
    {
      char v11 = 0;
      char v13 = 0;
    }
    else
    {
      char v11 = v13 != 0;
    }
  }
  else
  {
    char v11 = 0;
    id v10 = 0;
  }

  _authenticateModuleWithChallenge_completionHandler_moduleType_updateRegistry_updateUIProperty_logToAnalytics__disableAuth = v11;
}

- (unsigned)_findModuleAuthService:(int)a3 withAuthFlags:(unsigned int *)a4
{
  kern_return_t MatchingServices;
  mach_error_t v8;
  BOOL v9;
  id v10;
  unsigned int v11;
  NSObject *v12;
  char *v13;
  io_object_t v14;
  io_registry_entry_t v15;
  CFAllocatorRef v16;
  NSObject *v17;
  CFNumberRef CFProperty;
  CFNumberRef v19;
  uint64_t v20;
  int v21;
  BOOL v22;
  NSObject *v23;
  NSObject *v24;
  unsigned int *v26;
  int valuePtr;
  io_iterator_t existing;
  uint8_t buf[4];
  long long v30;
  uint64_t v31;

  long long v31 = *MEMORY[0x263EF8340];
  CFDictionaryRef v6 = IOServiceMatching("AppleAuthCP");
  long long v26 = a4;
  if (!a4) {
    return 0;
  }
  unsigned __int8 valuePtr = -1431655766;
  existing = -1431655766;
  MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x263F0EC90], v6, &existing);
  if (MatchingServices)
  {
    BOOL v8 = MatchingServices;
    if (gLogObjects) {
      id v9 = gNumLogObjects < 4;
    }
    else {
      id v9 = 1;
    }
    if (v9)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ACASignVeridianChallenge_cold_1();
      }
      id v12 = &_os_log_internal;
      id v10 = &_os_log_internal;
    }
    else
    {
      id v12 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      char v13 = mach_error_string(v8);
      *(_DWORD *)buf = 67109378;
      LODWORD(v30) = a3;
      WORD2(v30) = 2080;
      *(void *)((char *)&v30 + 6) = v13;
      _os_log_impl(&dword_235F30000, v12, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) Could not find authcp services: %s\n", buf, 0x12u);
    }
  }
  id v14 = IOIteratorNext(existing);
  if (v14)
  {
    id v15 = v14;
    char v11 = 0;
    long long v16 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    long long v17 = &_os_log_internal;
    while (1)
    {
      CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v15, @"flags", v16, 0);
      if (CFProperty) {
        break;
      }
LABEL_37:
      IOObjectRelease(v15);
      id v15 = IOIteratorNext(existing);
      if (!v15) {
        goto LABEL_42;
      }
    }
    long long v19 = CFProperty;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr))
    {
      long long v20 = gLogObjects;
      long long v21 = gNumLogObjects;
      if (gLogObjects) {
        long long v22 = gNumLogObjects < 4;
      }
      else {
        long long v22 = 1;
      }
      if (v22)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&long long v30 = v20;
          WORD4(v30) = 1024;
          *(_DWORD *)((char *)&v30 + 10) = v21;
          _os_log_error_impl(&dword_235F30000, v17, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        long long v23 = v17;
        long long v24 = v17;
      }
      else
      {
        long long v24 = *(id *)(gLogObjects + 24);
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109632;
        LODWORD(v30) = a3;
        WORD2(v30) = 1024;
        *(_DWORD *)((char *)&v30 + 6) = v15;
        WORD5(v30) = 1024;
        HIDWORD(v30) = valuePtr;
        _os_log_impl(&dword_235F30000, v24, OS_LOG_TYPE_INFO, "(moduleType=%d) authCP service %d tmpAuthFlags == 0x%x", buf, 0x14u);
      }

      if (!a3)
      {
        if (BYTE2(valuePtr) << 16 != 0x10000) {
          goto LABEL_36;
        }
        goto LABEL_35;
      }
      if (a3 != 2)
      {
        if (a3 != 1 || BYTE2(valuePtr) << 16 != 196608) {
          goto LABEL_36;
        }
        goto LABEL_35;
      }
      if ((valuePtr & 0xFF000C) == 0x10008)
      {
LABEL_35:
        IOObjectRetain(v15);
        *long long v26 = valuePtr;
        char v11 = v15;
      }
    }
LABEL_36:
    CFRelease(v19);
    goto LABEL_37;
  }
  char v11 = 0;
LABEL_42:
  IOObjectRelease(existing);
  return v11;
}

- (BOOL)_verifyDeviceIDSN:(unsigned int)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CFIndex v9 = 0xAAAAAAAAAAAAAAAALL;
  id v10 = (UInt8 *)0xAAAAAAAAAAAAAAAALL;
  mach_error_t DeviceIDSN = cpGetDeviceIDSN(a3, &v10, &v9);
  if (DeviceIDSN)
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 4;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ACASignVeridianChallenge_cold_1();
      }
      CFDictionaryRef v6 = &_os_log_internal;
      id v5 = &_os_log_internal;
    }
    else
    {
      CFDictionaryRef v6 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = mach_error_string(DeviceIDSN);
      *(_DWORD *)buf = 136315138;
      id v12 = v7;
      _os_log_impl(&dword_235F30000, v6, OS_LOG_TYPE_DEFAULT, "Could not cpGetDeviceInfo: %s\n", buf, 0xCu);
    }
  }
  return DeviceIDSN == 0;
}

- (BOOL)_verifyDeviceInfo:(unsigned int)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v13 = -86;
  char v12 = -86;
  char v11 = -86;
  char v10 = -86;
  int v9 = -1431655766;
  mach_error_t DeviceInfo = cpGetDeviceInfo(a3, &v13, &v12, &v11, &v10, &v9);
  if (DeviceInfo)
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 4;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ACASignVeridianChallenge_cold_1();
      }
      CFDictionaryRef v6 = &_os_log_internal;
      id v5 = &_os_log_internal;
    }
    else
    {
      CFDictionaryRef v6 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = mach_error_string(DeviceInfo);
      *(_DWORD *)buf = 136315138;
      id v15 = v7;
      _os_log_impl(&dword_235F30000, v6, OS_LOG_TYPE_DEFAULT, "Could not cpGetDeviceInfo: %s\n", buf, 0xCu);
    }
  }
  return DeviceInfo == 0;
}

- (int)_verifyCertificate:(id)a3
{
  id v3 = a3;
  if (([v3 authFlags] & 0xC) == 8)
  {
    uint64_t v16 = logObjectForModule();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(connect[0]) = 0;
      _os_log_impl(&dword_235F30000, v16, OS_LOG_TYPE_DEFAULT, "Flags indicate Veridian...do not call cpCopyCertificate()", (uint8_t *)connect, 2u);
    }

    CFTypeRef v4 = 0;
    BOOL v8 = 0;
    char v10 = 0;
    CFDictionaryRef v6 = 0;
    goto LABEL_7;
  }
  CFTypeRef v4 = cpCopyCertificate([v3 moduleAuthService]);
  if (!v4)
  {
    long long v17 = logObjectForModule();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(connect[0]) = 0;
      _os_log_impl(&dword_235F30000, v17, OS_LOG_TYPE_DEFAULT, "error getting certificate", (uint8_t *)connect, 2u);
    }
    BOOL v8 = 0;
    char v10 = 0;
    CFDictionaryRef v6 = 0;
    int v14 = 3;
    goto LABEL_38;
  }
  id v5 = [MEMORY[0x263F52F48] sharedManager];
  if (!v5)
  {
    long long v17 = logObjectForModule();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(connect[0]) = 0;
      _os_log_impl(&dword_235F30000, v17, OS_LOG_TYPE_DEFAULT, "error getting MFAACertificateManager", (uint8_t *)connect, 2u);
    }
    BOOL v8 = 0;
    char v10 = 0;
    CFDictionaryRef v6 = 0;
    goto LABEL_34;
  }
  CFDictionaryRef v6 = v5;
  uint64_t v7 = [v5 copyParsedCertificateChainInfo:v4];
  if (!v7)
  {
    long long v17 = logObjectForModule();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(connect[0]) = 0;
      _os_log_impl(&dword_235F30000, v17, OS_LOG_TYPE_DEFAULT, "error parsing certificate", (uint8_t *)connect, 2u);
    }
    BOOL v8 = 0;
    goto LABEL_33;
  }
  BOOL v8 = (void *)v7;
  uint64_t v9 = [v6 copyEvaluatedCertificateChainInfo:v7];
  if (!v9)
  {
    long long v17 = logObjectForModule();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(connect[0]) = 0;
      _os_log_impl(&dword_235F30000, v17, OS_LOG_TYPE_DEFAULT, "error evaluating certificate", (uint8_t *)connect, 2u);
    }
LABEL_33:
    char v10 = 0;
LABEL_34:
    int v14 = 4;
    goto LABEL_38;
  }
  char v10 = (void *)v9;
  if (MFAAVerifyCertificateSerialNumber())
  {
LABEL_7:
    char v11 = [v10 objectForKey:@"LeafCertData"];
    [v3 setCertificate:v11];

    [v3 setCertificateInfo:v10];
    if (gLogObjects && gNumLogObjects >= 4)
    {
      char v12 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ACASignVeridianChallenge_cold_1();
      }
      char v12 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ACCHWComponentAuthService _verifyCertificate:](v3);
    }

    int v14 = 0;
    goto LABEL_16;
  }
  long long v17 = logObjectForModule();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(connect[0]) = 0;
    _os_log_impl(&dword_235F30000, v17, OS_LOG_TYPE_DEFAULT, "error verifying serial number", (uint8_t *)connect, 2u);
  }
  int v14 = 5;
LABEL_38:

  connect[0] = 0;
  io_service_t v18 = [v3 moduleAuthService];
  if (!IOServiceOpen(v18, *MEMORY[0x263EF8960], 0, connect))
  {
    cpClearCertificate(connect[0]);
    IOServiceClose(connect[0]);
  }
LABEL_16:
  if (v4) {
    CFRelease(v4);
  }

  return v14;
}

- (int)_verifySignature:(id)a3
{
  kern_return_t v8;
  mach_error_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  char *v13;
  int v14;
  id v15;
  mach_port_t v16;
  CFDataRef v17;
  mach_error_t v18;
  NSObject *v19;
  id v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  NSObject *v24;
  id v25;
  char *v26;
  id v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  id v33;
  __CFString *v34;
  CFDataRef v35;
  timespec __tp;
  io_connect_t connect;
  uint8_t buf[4];
  unsigned char v39[14];
  __int16 v40;
  unint64_t v41;
  uint64_t v42;

  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a3;
  io_connect_t connect = -1431655766;
  __tp.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  __tp.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 4;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ACASignVeridianChallenge_cold_1();
    }
    CFDictionaryRef v6 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    CFDictionaryRef v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)long long v39 = 794;
    *(_WORD *)&v39[4] = 2048;
    *(void *)&v39[6] = __tp.tv_sec;
    long long v40 = 2048;
    unint64_t v41 = __tp.tv_nsec / 0xF4240uLL;
    _os_log_impl(&dword_235F30000, v6, OS_LOG_TYPE_DEFAULT, "_verifySignature %d: %ld.%03llu", buf, 0x1Cu);
  }

  io_service_t v7 = [v3 moduleAuthService];
  BOOL v8 = IOServiceOpen(v7, *MEMORY[0x263EF8960], 0, &connect);
  if (!v8)
  {
    long long v35 = (CFDataRef)0xAAAAAAAAAAAAAAAALL;
    clock_gettime(_CLOCK_REALTIME, &__tp);
    if (gLogObjects && gNumLogObjects >= 4)
    {
      char v11 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ACASignVeridianChallenge_cold_1();
      }
      char v11 = &_os_log_internal;
      id v15 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)long long v39 = 805;
      *(_WORD *)&v39[4] = 2048;
      *(void *)&v39[6] = __tp.tv_sec;
      long long v40 = 2048;
      unint64_t v41 = __tp.tv_nsec / 0xF4240uLL;
      _os_log_impl(&dword_235F30000, v11, OS_LOG_TYPE_DEFAULT, "_verifySignature %d: %ld.%03llu", buf, 0x1Cu);
    }

    uint64_t v16 = connect;
    long long v17 = [v3 challenge];
    io_service_t v18 = cpCreateSignature(v16, v17, &v35);

    IOServiceClose(connect);
    if ((v18 & 0xE3FFBF00) == 0xE3FF8000)
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        long long v19 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          ACASignVeridianChallenge_cold_1();
        }
        long long v19 = &_os_log_internal;
        long long v20 = &_os_log_internal;
      }
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_51;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)long long v39 = v18;
      long long v21 = "error generating signature: auth cp error code %#x\n";
      long long v22 = v19;
      long long v23 = 8;
    }
    else
    {
      if (!v18)
      {
        clock_gettime(_CLOCK_REALTIME, &__tp);
        if (gLogObjects && gNumLogObjects >= 4)
        {
          long long v24 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            ACASignVeridianChallenge_cold_1();
          }
          long long v24 = &_os_log_internal;
          long long v28 = &_os_log_internal;
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)long long v39 = 818;
          *(_WORD *)&v39[4] = 2048;
          *(void *)&v39[6] = __tp.tv_sec;
          long long v40 = 2048;
          unint64_t v41 = __tp.tv_nsec / 0xF4240uLL;
          _os_log_impl(&dword_235F30000, v24, OS_LOG_TYPE_DEFAULT, "_verifySignature %d: %ld.%03llu", buf, 0x1Cu);
        }

        long long v29 = [v3 certificate];
        long long v30 = [v3 challenge];
        long long v31 = MFAAVerifyNonceSignature();

        if (gLogObjects && gNumLogObjects >= 4)
        {
          long long v32 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            ACASignVeridianChallenge_cold_1();
          }
          long long v32 = &_os_log_internal;
          long long v33 = &_os_log_internal;
        }
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          long long v34 = @"no";
          if (v31) {
            long long v34 = @"yes";
          }
          *(_DWORD *)buf = 138412290;
          *(void *)long long v39 = v34;
          _os_log_impl(&dword_235F30000, v32, OS_LOG_TYPE_DEFAULT, "signatureValid ? %@", buf, 0xCu);
        }

        if (v31) {
          int v14 = 0;
        }
        else {
          int v14 = 12;
        }
        long long v19 = v35;
        objc_msgSend(v3, "setSignature:", v35, v35);
        goto LABEL_52;
      }
      if (gLogObjects && gNumLogObjects >= 4)
      {
        long long v19 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          ACASignVeridianChallenge_cold_1();
        }
        long long v19 = &_os_log_internal;
        long long v25 = &_os_log_internal;
      }
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
LABEL_51:
        int v14 = 11;
LABEL_52:

        goto LABEL_53;
      }
      long long v26 = mach_error_string(v18);
      *(_DWORD *)buf = 136315138;
      *(void *)long long v39 = v26;
      long long v21 = "error generating signature: %s\n";
      long long v22 = v19;
      long long v23 = 12;
    }
    _os_log_impl(&dword_235F30000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    goto LABEL_51;
  }
  uint64_t v9 = v8;
  if (gLogObjects && gNumLogObjects >= 4)
  {
    char v10 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ACASignVeridianChallenge_cold_1();
    }
    char v10 = &_os_log_internal;
    char v12 = &_os_log_internal;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = mach_error_string(v9);
    *(_DWORD *)buf = 136315138;
    *(void *)long long v39 = v13;
    _os_log_impl(&dword_235F30000, v10, OS_LOG_TYPE_DEFAULT, "could not open service: %s\n", buf, 0xCu);
  }

  int v14 = 23;
LABEL_53:

  return v14;
}

- (int)_signChallenge:(id)a3
{
  kern_return_t v5;
  mach_error_t v6;
  BOOL v7;
  id v8;
  mach_port_t v9;
  CFDataRef v10;
  mach_error_t v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  id v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  CFDataRef v19;
  void *v20;
  NSObject *v21;
  id v22;
  char *v23;
  id v25;
  char *v26;
  id v27;
  char *v28;
  CFDataRef v29;
  io_connect_t connect;
  uint8_t buf[4];
  char *v32;
  uint64_t v33;

  long long v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  io_connect_t connect = -1431655766;
  io_service_t v4 = [v3 moduleAuthService];
  id v5 = IOServiceOpen(v4, *MEMORY[0x263EF8960], 0, &connect);
  if (!v5)
  {
    long long v29 = (CFDataRef)0xAAAAAAAAAAAAAAAALL;
    uint64_t v9 = connect;
    char v10 = [v3 challenge];
    char v11 = cpCreateSignature(v9, v10, &v29);

    IOServiceClose(connect);
    if ((v11 & 0xE3FFBF00) == 0xE3FF8000)
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        char v12 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          ACASignVeridianChallenge_cold_1();
        }
        char v12 = &_os_log_internal;
        id v15 = &_os_log_internal;
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v32) = v11;
      uint64_t v16 = "error generating signature: auth cp error code %#x\n";
      long long v17 = v12;
      io_service_t v18 = 8;
    }
    else
    {
      if (!v11)
      {
        long long v19 = v29;
        [v3 setSignature:v29];

        long long v20 = (void *)cpCopyDeviceNonce([v3 moduleAuthService]);
        [v3 setDeviceNonce:v20];

        if (gLogObjects && gNumLogObjects >= 4)
        {
          long long v21 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            ACASignVeridianChallenge_cold_1();
          }
          long long v21 = &_os_log_internal;
          long long v25 = &_os_log_internal;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          long long v26 = [v3 signature];
          *(_DWORD *)buf = 138412290;
          long long v32 = v26;
          _os_log_impl(&dword_235F30000, v21, OS_LOG_TYPE_DEFAULT, "Battery signature = %@", buf, 0xCu);
        }
        if (gLogObjects && gNumLogObjects >= 4)
        {
          char v12 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            ACASignVeridianChallenge_cold_1();
          }
          char v12 = &_os_log_internal;
          long long v27 = &_os_log_internal;
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          long long v28 = [v3 deviceNonce];
          *(_DWORD *)buf = 138412290;
          long long v32 = v28;
          _os_log_impl(&dword_235F30000, v12, OS_LOG_TYPE_DEFAULT, "Battery device nonce = %@", buf, 0xCu);
        }
        int v14 = 0;
        goto LABEL_36;
      }
      if (gLogObjects && gNumLogObjects >= 4)
      {
        char v12 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          ACASignVeridianChallenge_cold_1();
        }
        char v12 = &_os_log_internal;
        long long v22 = &_os_log_internal;
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
LABEL_35:
        int v14 = 11;
LABEL_36:

        goto LABEL_37;
      }
      long long v23 = mach_error_string(v11);
      *(_DWORD *)buf = 136315138;
      long long v32 = v23;
      uint64_t v16 = "error generating signature: %s\n";
      long long v17 = v12;
      io_service_t v18 = 12;
    }
    _os_log_impl(&dword_235F30000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
    goto LABEL_35;
  }
  CFDictionaryRef v6 = v5;
  if (gLogObjects) {
    io_service_t v7 = gNumLogObjects < 4;
  }
  else {
    io_service_t v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ACASignVeridianChallenge_cold_1();
    }
    id v13 = &_os_log_internal;
    BOOL v8 = &_os_log_internal;
  }
  else
  {
    id v13 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[ACCHWComponentAuthService _signChallenge:].cold.5(v6, v13);
  }

  int v14 = 23;
LABEL_37:

  return v14;
}

- (int)_verifyModuleCertificate:(id)a3 forModuleType:(int)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v5 = a3;
  CFDictionaryRef v6 = [v5 certificateInfo];

  if (!v6)
  {
    int v46 = logObjectForModule();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      -[ACCHWComponentAuthService _verifyModuleCertificate:forModuleType:]();
    }
    goto LABEL_65;
  }
  io_service_t v7 = (void *)MEMORY[0x263F52F48];
  BOOL v8 = [v5 certificateInfo];
  int v9 = objc_msgSend(v7, "isMFi2_3CertInfo:", v8);

  char v10 = (void *)MEMORY[0x263F52F48];
  char v11 = [v5 certificateInfo];
  int v12 = [v10 isComponentCertInfo:v11];

  if (gLogObjects && gNumLogObjects >= 4)
  {
    id v13 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ACASignVeridianChallenge_cold_1();
    }
    id v13 = &_os_log_internal;
    id v14 = &_os_log_internal;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v55 = 67109632;
    int v56 = a4;
    __int16 v57 = 1024;
    int v58 = v9;
    __int16 v59 = 1024;
    int v60 = v12;
    _os_log_impl(&dword_235F30000, v13, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) mfi2_3:%d, mfi4:%d", (uint8_t *)&v55, 0x14u);
  }

  if (!v9)
  {
    if (!v12)
    {
LABEL_55:
      uint64_t v16 = 0;
      goto LABEL_56;
    }
    long long v17 = [v5 certificateInfo];
    io_service_t v18 = [v17 objectForKey:@"ExtensionValue"];

    if (!v18)
    {
      long long v19 = logObjectForModule();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[ACCHWComponentAuthService _verifyModuleCertificate:forModuleType:].cold.6();
      }
      goto LABEL_47;
    }
    if (a4 == 2)
    {
      long long v23 = [MEMORY[0x263EFF8F8] dataWithBytes:"Battery" length:7];
      char v24 = [v18 isEqualToData:v23];

      uint64_t v16 = 0;
      if (v24) {
        goto LABEL_32;
      }
LABEL_56:
      long long v26 = logObjectForModule();
      int v28 = 16;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[ACCHWComponentAuthService _verifyModuleCertificate:forModuleType:]();
      }
      goto LABEL_58;
    }
    if (a4 != 1) {
      goto LABEL_54;
    }
    long long v19 = systemInfo_copyDeviceClass();
    if ([v19 isEqualToString:@"iPhone"])
    {
      long long v20 = (void *)MEMORY[0x263EFF8F8];
      long long v21 = "Phone Display";
      uint64_t v22 = 13;
    }
    else
    {
      if (![v19 isEqualToString:@"iPad"])
      {
LABEL_44:
        long long v30 = logObjectForModule();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[ACCHWComponentAuthService _verifyModuleCertificate:forModuleType:].cold.7(v30, v31, v32, v33, v34, v35, v36, v37);
        }

LABEL_47:
        int v28 = 16;
        goto LABEL_60;
      }
      long long v20 = (void *)MEMORY[0x263EFF8F8];
      long long v21 = "iPad Display";
      uint64_t v22 = 12;
    }
    long long v25 = [v20 dataWithBytes:v21 length:v22];
    if (v25)
    {
      if ([v18 isEqualToData:v25])
      {

        uint64_t v16 = 0;
        goto LABEL_32;
      }
      if (gLogObjects && gNumLogObjects >= 4)
      {
        long long v29 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          ACASignVeridianChallenge_cold_1();
        }
        long long v29 = &_os_log_internal;
        id v38 = &_os_log_internal;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[ACCHWComponentAuthService _verifyModuleCertificate:forModuleType:].cold.8((uint64_t)v18, v29, v39, v40, v41, v42, v43, v44);
      }

LABEL_54:
      goto LABEL_55;
    }
    goto LABEL_44;
  }
  id v15 = [v5 certificate];
  uint64_t v16 = MFAACreateCapsFromAuthCert();

  if (!v16)
  {
    int v46 = logObjectForModule();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      -[ACCHWComponentAuthService _verifyModuleCertificate:forModuleType:]();
    }
LABEL_65:

    int v28 = 13;
    goto LABEL_60;
  }
  if (a4 == 1)
  {
    if (MFAAIsAppleTouchControllerModule()) {
      goto LABEL_32;
    }
    goto LABEL_56;
  }
  if (a4) {
    goto LABEL_56;
  }
  if (([v5 authFlags] & 0xC) == 8)
  {
    v47 = logObjectForModule();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      -[ACCHWComponentAuthService _verifyModuleCertificate:forModuleType:].cold.4(v47, v48, v49, v50, v51, v52, v53, v54);
    }

    int v28 = 0;
    goto LABEL_59;
  }
  if ((MFAAIsAppleBatteryModule() & 1) == 0) {
    goto LABEL_56;
  }
LABEL_32:
  if (gLogObjects && gNumLogObjects >= 4)
  {
    long long v26 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ACASignVeridianChallenge_cold_1();
    }
    long long v26 = &_os_log_internal;
    id v27 = &_os_log_internal;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    int v55 = 67109120;
    int v56 = a4;
    _os_log_impl(&dword_235F30000, v26, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) Success: validated cert caps", (uint8_t *)&v55, 8u);
  }
  int v28 = 0;
LABEL_58:

  if (v16) {
LABEL_59:
  }
    MFAADeallocAuthCertCaps();
LABEL_60:

  return v28;
}

- (BOOL)_verifyModuleFDR:(id)a3 forModuleType:(int)a4
{
  v61[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v60 = @"CopyAllowUnsealed";
  v61[0] = MEMORY[0x263EFFA88];
  int v6 = 1;
  io_service_t v7 = [NSDictionary dictionaryWithObjects:v61 forKeys:&v60 count:1];
  if (a4)
  {
    if (a4 == 2)
    {
      int v6 = 0;
    }
    else
    {
      if (a4 != 1)
      {
        CFDataRef v8 = 0;
        goto LABEL_60;
      }
      int v6 = 1;
    }
  }
  CFDataRef v8 = (const __CFData *)AMFDRSealingMapCopyLocalDataForClass();
  if (!v8)
  {
    uint64_t v53 = logObjectForModule();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      -[ACCHWComponentAuthService _verifyModuleFDR:forModuleType:]();
    }

    CFDataRef v8 = 0;
    goto LABEL_46;
  }
  if (!v6)
  {
    long long v21 = [MEMORY[0x263F52F48] sharedManager];
    if (!v21) {
      goto LABEL_61;
    }
    uint64_t v22 = [v5 challenge];

    if (!v22
      || ([v5 signature], long long v23 = objc_claimAutoreleasedReturnValue(), v23, !v23)
      || ([v5 deviceNonce], char v24 = objc_claimAutoreleasedReturnValue(), v24, !v24))
    {
LABEL_61:
      int v6 = 1;
      goto LABEL_27;
    }
    uint64_t v25 = [v21 copyParsedCertificateChainInfo:v8];
    if (v25)
    {
      long long v26 = v25;
      uint64_t v27 = [v21 copyEvaluatedCertificateChainInfo:v25];
      if (v27)
      {
        int v28 = v27;
        long long v29 = [v5 deviceNonce];
        long long v30 = [v5 challenge];
        uint64_t v31 = [v21 createVeridianNonce:v29 withChallenge:v30];

        if (v31)
        {
          if (a4 == 2)
          {
            uint64_t v32 = +[ACCUserDefaults sharedDefaults];
            char v33 = [v32 BOOLForKey:@"SkipGaugeSignatureCheck"];

            if (v33) {
              goto LABEL_25;
            }
          }
          uint64_t v34 = [v5 signature];
          char v35 = [v21 verifyNonceSignature:v28 nonce:v31 signature:v34];

          if (v35)
          {
LABEL_25:
            uint64_t v36 = [v28 objectForKey:@"LeafCertData"];
            [v5 setCertificate:v36];

            [v5 setCertificateInfo:v28];
            int v6 = 2;
LABEL_26:

LABEL_27:
            goto LABEL_60;
          }
          uint64_t v54 = logObjectForModule();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
            -[ACCHWComponentAuthService _verifyModuleFDR:forModuleType:]1();
          }
        }
        else
        {
          uint64_t v31 = logObjectForModule();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            -[ACCHWComponentAuthService _verifyModuleFDR:forModuleType:]0();
          }
        }
      }
      else
      {
        int v28 = logObjectForModule();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[ACCHWComponentAuthService _verifyModuleCertificate:forModuleType:]();
        }
      }
    }
    else
    {
      long long v26 = logObjectForModule();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[ACCHWComponentAuthService _verifyModuleFDR:forModuleType:].cold.6();
      }
    }
    int v6 = 1;
    goto LABEL_26;
  }
  uint64_t v9 = [v5 certificate];
  if (!v9
    || (char v10 = (void *)v9,
        [v5 certificateInfo],
        char v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v11))
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      uint64_t v37 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ACASignVeridianChallenge_cold_1();
      }
      uint64_t v37 = &_os_log_internal;
      id v47 = &_os_log_internal;
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[ACCHWComponentAuthService _verifyModuleFDR:forModuleType:]();
    }
LABEL_45:

LABEL_46:
    int v6 = 1;
    goto LABEL_60;
  }
  int v12 = (void *)MEMORY[0x263F52F48];
  id v13 = [v5 certificateInfo];
  int v14 = objc_msgSend(v12, "isMFi2_3CertInfo:", v13);

  id v15 = (void *)MEMORY[0x263F52F48];
  uint64_t v16 = [v5 certificateInfo];
  int v17 = [v15 isComponentCertInfo:v16];

  if (v14)
  {
    CFDataRef v18 = copyCertificateForFDRData(v8);
    if (v18)
    {
      CFDataRef v19 = v18;
      long long v20 = [v5 certificate];
      if ([(__CFData *)v19 isEqualToData:v20])
      {
        int v17 = 1;
      }
      else
      {
        uint64_t v48 = [v5 certificateInfo];
        uint64_t v49 = [v48 objectForKey:@"FullCertData"];
        int v17 = [(__CFData *)v19 isEqualToData:v49];
      }
      goto LABEL_49;
    }
    uint64_t v37 = logObjectForModule();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[ACCHWComponentAuthService _verifyModuleFDR:forModuleType:].cold.4();
    }
    goto LABEL_45;
  }
  if (v17)
  {
    id v38 = [MEMORY[0x263F52F48] sharedManager];
    uint64_t v39 = v38;
    if (!v38)
    {
      int v17 = 0;
      int v46 = 0;
      int v6 = 1;
LABEL_38:

      if (!v46) {
        goto LABEL_60;
      }
      goto LABEL_49;
    }
    uint64_t v40 = [v38 copyParsedCertificateChainInfo:v8];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = (void *)[v39 copyEvaluatedCertificateChainInfo:v40];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = [v42 objectForKey:@"LeafCertData"];
        uint64_t v45 = [v5 certificate];
        int v17 = [v44 isEqualToData:v45];

        int v6 = 0;
        int v46 = 1;
LABEL_37:

        goto LABEL_38;
      }
      int v55 = logObjectForModule();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        -[ACCHWComponentAuthService _verifyModuleCertificate:forModuleType:]();
      }
    }
    else
    {
      uint64_t v41 = logObjectForModule();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[ACCHWComponentAuthService _verifyModuleFDR:forModuleType:].cold.6();
      }
    }
    int v17 = 0;
    int v46 = 0;
    int v6 = 1;
    goto LABEL_37;
  }
LABEL_49:
  if (gLogObjects && gNumLogObjects >= 4)
  {
    uint64_t v50 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ACASignVeridianChallenge_cold_1();
    }
    uint64_t v50 = &_os_log_internal;
    id v51 = &_os_log_internal;
  }
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v57 = a4;
    __int16 v58 = 1024;
    int v59 = v17;
    _os_log_impl(&dword_235F30000, v50, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) equal:%d", buf, 0xEu);
  }

  if (v17) {
    int v6 = 2;
  }
  else {
    int v6 = 1;
  }
LABEL_60:

  return v6 == 2;
}

- (BOOL)_getForVeridianFDRData:(id)a3 intermediateCert:(id *)a4 leafCert:(id *)a5
{
  memset(v15, 170, sizeof(v15));
  id v7 = a3;
  v14[0] = [v7 bytes];
  v14[1] = [v7 length];
  if (DERDecodeItem((uint64_t)v14, v15)
    || v15[0] != 0x2000000000000010
    || (unint64_t v8 = v15[1] - v14[0] + v15[2], v8 > [v7 length])
    || ([MEMORY[0x263EFF8F8] dataWithBytes:v14[0] length:v8],
        *a4 = (id)objc_claimAutoreleasedReturnValue(),
        id v9 = v7,
        v13[0] = [v9 bytes] + v8,
        v13[1] = [v9 length] - v8,
        DERDecodeItem((uint64_t)v13, v15))
    || v15[0] != 0x2000000000000010
    || (unint64_t v10 = v15[1] - v13[0] + v15[2], v10 + v8 > [v9 length]))
  {
    NSLog(&cfstr_SError.isa, "-[ACCHWComponentAuthService _getForVeridianFDRData:intermediateCert:leafCert:]");
    BOOL v11 = 0;
  }
  else
  {
    *a5 = [MEMORY[0x263EFF8F8] dataWithBytes:v13[0] length:v10];
    BOOL v11 = 1;
  }

  return v11;
}

- (void)_notifyComponentAuthFailure
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 4;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ACASignVeridianChallenge_cold_1();
    }
    io_service_t v4 = &_os_log_internal;
    id v3 = &_os_log_internal;
  }
  else
  {
    io_service_t v4 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "com.apple.accessories.hwComponent.isTrusted.failure";
    _os_log_impl(&dword_235F30000, v4, OS_LOG_TYPE_DEFAULT, "Notifying clients of %s", (uint8_t *)&v5, 0xCu);
  }

  notify_post("com.apple.accessories.hwComponent.isTrusted.failure");
}

- (int)_verifyBatteryMatch:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v16.__darwin_time_t tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v16.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  CFDataRef v3 = (const __CFData *)a3;
  clock_gettime(_CLOCK_REALTIME, &v16);
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 4;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ACASignVeridianChallenge_cold_1();
    }
    int v6 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    int v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    int v18 = 1162;
    __int16 v19 = 2048;
    __darwin_time_t tv_sec = v16.tv_sec;
    __int16 v21 = 2048;
    unint64_t v22 = v16.tv_nsec / 0xF4240uLL;
    _os_log_impl(&dword_235F30000, v6, OS_LOG_TYPE_DEFAULT, "_verifyBatteryMatch %d: %ld.%03llu", buf, 0x1Cu);
  }

  SecCertificateRef v7 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], v3);
  unint64_t v8 = (void *)SecCertificateCopyComponentAttributes();
  id v9 = [v8 objectForKey:&unk_26E94DBD0];
  if (!v8)
  {
    int v14 = 0;
    if (!v7) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  int v10 = MGGetBoolAnswer();
  if ([v9 BOOLValue]) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    int v14 = 28;
    if (!v7) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  int v12 = [v9 BOOLValue];
  if (v10) {
    int v13 = 27;
  }
  else {
    int v13 = 0;
  }
  if (v12) {
    int v14 = 0;
  }
  else {
    int v14 = v13;
  }
  if (v7) {
LABEL_25:
  }
    CFRelease(v7);
LABEL_26:

  return v14;
}

- (void)signVeridianChallenge:(id)a3 completionHandler:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  init_logging();
  unint64_t v8 = objc_alloc_init(ACCHWComponentAuthServiceParams);
  unsigned int v40 = -1431655766;
  [(ACCHWComponentAuthServiceParams *)v8 setChallenge:v6];
  [(ACCHWComponentAuthServiceParams *)v8 setModuleAuthService:[(ACCHWComponentAuthService *)self _findModuleAuthService:2 withAuthFlags:&v40]];
  [(ACCHWComponentAuthServiceParams *)v8 setAuthFlags:v40];
  unsigned int v9 = [(ACCHWComponentAuthServiceParams *)v8 moduleAuthService];
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects <= 3;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = !v10;
  uint64_t v39 = (void (**)(void, void, void, void))v7;
  if (v9)
  {
    if (v11)
    {
      int v12 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ACASignVeridianChallenge_cold_1();
      }
      int v12 = &_os_log_internal;
      id v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ACCHWComponentAuthService signVeridianChallenge:completionHandler:](v8);
    }

    int v15 = -1;
    timespec v16 = &_os_log_internal;
    while (1)
    {
      uint64_t v17 = gLogObjects;
      int v18 = gNumLogObjects;
      if (!gLogObjects || gNumLogObjects < 4)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)uint64_t v42 = v17;
          *(_WORD *)&v42[8] = 1024;
          LODWORD(v43) = v18;
          _os_log_error_impl(&dword_235F30000, v16, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        long long v20 = v16;
        __int16 v21 = v16;
      }
      else
      {
        __int16 v21 = *(id *)(gLogObjects + 24);
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)uint64_t v42 = v15 + 1;
        *(_WORD *)&v42[4] = 1024;
        *(_DWORD *)&v42[6] = 3;
        _os_log_debug_impl(&dword_235F30000, v21, OS_LOG_TYPE_DEBUG, "tryCount = %d (max tries %d)", buf, 0xEu);
      }

      uint64_t v22 = [(ACCHWComponentAuthService *)self _signChallenge:v8];
      uint64_t v23 = gLogObjects;
      int v24 = gNumLogObjects;
      BOOL v25 = !gLogObjects || gNumLogObjects <= 3;
      BOOL v26 = !v25;
      if (!v22) {
        break;
      }
      uint64_t v27 = v22;
      if (v26)
      {
        int v28 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)uint64_t v42 = v23;
          *(_WORD *)&v42[8] = 1024;
          LODWORD(v43) = v24;
          _os_log_error_impl(&dword_235F30000, v16, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        long long v29 = v16;
        int v28 = v16;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)uint64_t v42 = v27;
        _os_log_impl(&dword_235F30000, v28, OS_LOG_TYPE_DEFAULT, "authError %d after _signChallenge", buf, 8u);
      }

      if (++v15 > 1) {
        goto LABEL_59;
      }
    }
    if (v26)
    {
      int v13 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)uint64_t v42 = v23;
        *(_WORD *)&v42[8] = 1024;
        LODWORD(v43) = v24;
        _os_log_error_impl(&dword_235F30000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      int v13 = &_os_log_internal;
      id v31 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235F30000, v13, OS_LOG_TYPE_DEFAULT, "no error after _signChallenge!", buf, 2u);
    }
    uint64_t v27 = 0;
  }
  else
  {
    if (v11)
    {
      int v13 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ACASignVeridianChallenge_cold_1();
      }
      int v13 = &_os_log_internal;
      id v30 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235F30000, v13, OS_LOG_TYPE_DEFAULT, "ERROR No batteryAuth io_service_t is found!", buf, 2u);
    }
    uint64_t v27 = 22;
  }

LABEL_59:
  if (gLogObjects && gNumLogObjects >= 4)
  {
    uint64_t v32 = *(id *)(gLogObjects + 24);
    char v33 = v39;
  }
  else
  {
    char v33 = v39;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ACASignVeridianChallenge_cold_1();
    }
    uint64_t v32 = &_os_log_internal;
    id v34 = &_os_log_internal;
  }
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    char v35 = [(ACCHWComponentAuthServiceParams *)v8 signature];
    uint64_t v36 = [(ACCHWComponentAuthServiceParams *)v8 deviceNonce];
    *(_DWORD *)buf = 138412802;
    *(void *)uint64_t v42 = v35;
    *(_WORD *)&v42[8] = 2112;
    uint64_t v43 = v36;
    __int16 v44 = 1024;
    int v45 = v27;
    _os_log_impl(&dword_235F30000, v32, OS_LOG_TYPE_DEFAULT, "signVeridianChallenge Replying with signature=%@, deviceNonce=%@, authError = %d", buf, 0x1Cu);
  }
  uint64_t v37 = [(ACCHWComponentAuthServiceParams *)v8 signature];
  id v38 = [(ACCHWComponentAuthServiceParams *)v8 deviceNonce];
  ((void (**)(void, void *, void *, uint64_t))v33)[2](v33, v37, v38, v27);
}

- (void)verifyBatteryMatch:(id)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v27 = a4;
  init_logging();
  int v7 = -1;
  unint64_t v8 = &_os_log_internal;
  while (1)
  {
    uint64_t v9 = gLogObjects;
    int v10 = gNumLogObjects;
    if (!gLogObjects || gNumLogObjects < 4)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)long long v29 = v9;
        *(_WORD *)&v29[8] = 1024;
        int v30 = v10;
        _os_log_error_impl(&dword_235F30000, v8, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      int v12 = v8;
      int v13 = v8;
    }
    else
    {
      int v13 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)long long v29 = v7 + 1;
      *(_WORD *)&v29[4] = 1024;
      *(_DWORD *)&v29[6] = 3;
      _os_log_debug_impl(&dword_235F30000, v13, OS_LOG_TYPE_DEBUG, "tryCount = %d (max tries %d)", buf, 0xEu);
    }

    uint64_t v14 = [(ACCHWComponentAuthService *)self _verifyBatteryMatch:v6];
    uint64_t v15 = v14;
    uint64_t v16 = gLogObjects;
    int v17 = gNumLogObjects;
    BOOL v18 = !gLogObjects || gNumLogObjects <= 3;
    BOOL v19 = !v18;
    if (!v14) {
      break;
    }
    if (v19)
    {
      long long v20 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)long long v29 = v16;
        *(_WORD *)&v29[8] = 1024;
        int v30 = v17;
        _os_log_error_impl(&dword_235F30000, v8, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      __int16 v21 = v8;
      long long v20 = v8;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)long long v29 = v15;
      _os_log_impl(&dword_235F30000, v20, OS_LOG_TYPE_DEFAULT, "authError %d after _verifyBatteryMatch", buf, 8u);
    }

    if (++v7 >= 2) {
      goto LABEL_36;
    }
  }
  if (v19)
  {
    uint64_t v22 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)long long v29 = v16;
      *(_WORD *)&v29[8] = 1024;
      int v30 = v17;
      _os_log_error_impl(&dword_235F30000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
    }
    uint64_t v22 = &_os_log_internal;
    id v23 = &_os_log_internal;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235F30000, v22, OS_LOG_TYPE_DEFAULT, "no error after _verifyBatteryMatch!", buf, 2u);
  }

LABEL_36:
  if (gLogObjects && gNumLogObjects >= 4)
  {
    int v24 = *(id *)(gLogObjects + 24);
    BOOL v25 = (void (**)(void, void))v27;
  }
  else
  {
    BOOL v25 = (void (**)(void, void))v27;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ACASignVeridianChallenge_cold_1();
    }
    int v24 = &_os_log_internal;
    id v26 = &_os_log_internal;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)long long v29 = v15;
    _os_log_impl(&dword_235F30000, v24, OS_LOG_TYPE_DEFAULT, "verifyBatteryMatch Replying with authError = %d", buf, 8u);
  }

  v25[2](v25, v15);
}

- (void)_logToAnalytics:(int)a3 authError:(int)a4 fdrValidationStatus:(int)a5 authDurationInMS:(unint64_t)a6
{
  v31[4] = *MEMORY[0x263EF8340];
  uint64_t v9 = (void *)MEMORY[0x263EFF9A0];
  int v10 = @"Failed";
  if (!a4) {
    int v10 = @"Passed";
  }
  v31[0] = v10;
  v30[0] = @"authState";
  v30[1] = @"authErrorDescription";
  int v11 = [NSString stringWithUTF8String:kACCTransport_IOAccessoryAuthCP_AuthError_Strings[a4]];
  v31[1] = v11;
  v30[2] = @"isInductive";
  int v12 = [NSNumber numberWithBool:0];
  v31[2] = v12;
  v30[3] = @"isPeriodic";
  int v13 = [NSNumber numberWithBool:1];
  v31[3] = v13;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];
  uint64_t v15 = [v9 dictionaryWithDictionary:v14];

  CFNumberRef BucketizedWiredAuthDuration = acc_analytics_createBucketizedWiredAuthDuration(a6);
  [v15 setObject:BucketizedWiredAuthDuration forKey:@"wiredAuthDuration"];

  if ((a3 - 1) < 2)
  {
    int v17 = kACCHWComponentAuthServiceInternalModule_Strings[a3];
LABEL_7:
    [v15 setObject:v17 forKey:@"internalModuleType"];
    goto LABEL_8;
  }
  if (!a3)
  {
    BOOL v18 = [NSNumber numberWithBool:1];
    [v15 setObject:v18 forKey:@"isBatteryModule"];

    int v17 = @"Battery";
    goto LABEL_7;
  }
LABEL_8:
  BOOL v19 = [NSString stringWithUTF8String:kACCHWComponentAuthServiceFDRStatus_Strings[a5]];
  [v15 setObject:v19 forKey:@"FDRStatus"];

  long long v20 = [MEMORY[0x263F08AB0] processInfo];
  [v20 systemUptime];
  double v22 = v21;

  id v23 = [NSNumber numberWithDouble:v22];
  [v15 setObject:v23 forKey:@"Uptime"];

  if (gLogObjects && gNumLogObjects >= 4)
  {
    int v24 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ACASignVeridianChallenge_cold_1();
    }
    int v24 = &_os_log_internal;
    id v25 = &_os_log_internal;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412546;
    id v27 = @"com.apple.accessories.authCPEvent";
    __int16 v28 = 2112;
    long long v29 = v15;
    _os_log_impl(&dword_235F30000, v24, OS_LOG_TYPE_DEFAULT, "CoreAnalytics event: %@\neventDict: %@", (uint8_t *)&v26, 0x16u);
  }

  AnalyticsSendEvent();
}

- (void)_authenticateModuleWithChallenge:(int)a1 completionHandler:(NSObject *)a2 moduleType:updateRegistry:updateUIProperty:logToAnalytics:.cold.10(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 67109376;
  v2[1] = 2;
  __int16 v3 = 1024;
  int v4 = a1;
  _os_log_error_impl(&dword_235F30000, a2, OS_LOG_TYPE_ERROR, "(moduleType=%d) authError = %d after _verifyModuleCertificate", (uint8_t *)v2, 0xEu);
}

- (void)_authenticateModuleWithChallenge:(os_log_t)log completionHandler:moduleType:updateRegistry:updateUIProperty:logToAnalytics:.cold.14(uint8_t *buf, _DWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *a2 = 2;
  _os_log_error_impl(&dword_235F30000, log, OS_LOG_TYPE_ERROR, "(moduleType=%d) authError = eNoDeviceIDSNError after _verifyDeviceIDSN", buf, 8u);
}

- (void)_authenticateModuleWithChallenge:(void *)a1 completionHandler:moduleType:updateRegistry:updateUIProperty:logToAnalytics:.cold.16(void *a1)
{
  [a1 moduleAuthService];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0xEu);
}

- (void)_verifyCertificate:(void *)a1 .cold.1(void *a1)
{
  id v6 = [a1 certificate];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0xCu);
}

- (void)_signChallenge:(mach_error_t)a1 .cold.5(mach_error_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  int v4 = mach_error_string(a1);
  _os_log_error_impl(&dword_235F30000, a2, OS_LOG_TYPE_ERROR, "could not open service: %s\n", (uint8_t *)&v3, 0xCu);
}

- (void)_verifyModuleCertificate:forModuleType:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235F30000, v0, v1, "(moduleType=%d) Error: Could not evaluate certificate", v2, v3, v4, v5, v6);
}

- (void)_verifyModuleCertificate:forModuleType:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235F30000, v0, v1, "(moduleType=%d) Error: Could not create caps from certificate", v2, v3, v4, v5, v6);
}

- (void)_verifyModuleCertificate:forModuleType:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235F30000, v0, v1, "(moduleType=%d) Failure: validated cert caps, but auth flags and certificate do not match", v2, v3, v4, v5, v6);
}

- (void)_verifyModuleCertificate:(uint64_t)a3 forModuleType:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_235F30000, a1, a3, "(moduleType=%d) Auth flags indicate Veridian...do not compare Roswell auth flags", a5, a6, a7, a8, 0);
}

- (void)_verifyModuleCertificate:forModuleType:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235F30000, v0, v1, "(moduleType=%d) Failure: cannot find component type", v2, v3, v4, v5, v6);
}

- (void)_verifyModuleCertificate:(uint64_t)a3 forModuleType:(uint64_t)a4 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_235F30000, a1, a3, "(moduleType=%d) Failure: cannot find touchTypeData", a5, a6, a7, a8, 0);
}

- (void)_verifyModuleCertificate:(uint64_t)a3 forModuleType:(uint64_t)a4 .cold.8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_235F30000, a2, a3, "(moduleType=%d) Failure: componentType:%@", a5, a6, a7, a8, 2u);
}

- (void)_verifyModuleFDR:forModuleType:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_235F30000, v0, v1, "(moduleType=%d) %s: AMFDRSealingMapCopyLocalDataForClass: returned NULL", v2, v3, v4, v5, v6);
}

- (void)_verifyModuleFDR:forModuleType:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235F30000, v0, v1, "(moduleType=%d) No authIC cert to compare against FDR", v2, v3, v4, v5, v6);
}

- (void)_verifyModuleFDR:forModuleType:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235F30000, v0, v1, "(moduleType=%d) Cannot find FDR cert", v2, v3, v4, v5, v6);
}

- (void)_verifyModuleFDR:forModuleType:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235F30000, v0, v1, "(moduleType=%d) Error: Could not parse certificate", v2, v3, v4, v5, v6);
}

- (void)_verifyModuleFDR:forModuleType:.cold.10()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6();
  int v2 = 1074;
  _os_log_error_impl(&dword_235F30000, v0, OS_LOG_TYPE_ERROR, "(moduleType=%d) %s: %d: returned error", v1, 0x18u);
}

- (void)_verifyModuleFDR:forModuleType:.cold.11()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6();
  int v2 = 1089;
  _os_log_error_impl(&dword_235F30000, v0, OS_LOG_TYPE_ERROR, "(moduleType=%d) %s: %d: returned error", v1, 0x18u);
}

- (void)_verifyModuleFDR:(os_log_t)log forModuleType:.cold.12(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  v4[0] = 67109634;
  v4[1] = a2;
  __int16 v5 = 2080;
  uint8_t v6 = "-[ACCHWComponentAuthService _verifyModuleFDR:forModuleType:]";
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  _os_log_error_impl(&dword_235F30000, log, OS_LOG_TYPE_ERROR, "(moduleType=%d) %s: AMFDRSealingMapCopyLocalDataForClass returned error=%@", (uint8_t *)v4, 0x1Cu);
}

- (void)signVeridianChallenge:(void *)a1 completionHandler:.cold.3(void *a1)
{
  [a1 moduleAuthService];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 8u);
}

@end