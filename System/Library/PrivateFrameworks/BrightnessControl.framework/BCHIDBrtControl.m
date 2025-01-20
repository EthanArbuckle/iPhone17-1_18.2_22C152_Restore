@interface BCHIDBrtControl
+ (id)copyAvailableControls;
+ (id)newMonitorWithHandler:(id)a3 error:(id *)a4;
- (BCHIDBrtControl)init;
- (BCHIDBrtControl)initWithService:(unsigned int)a3;
- (BOOL)_getDeviceNits:(double *)a3;
- (BOOL)_setDeviceNits:(double)minNits;
- (BOOL)setNits:(double)a3 error:(id *)a4;
- (BOOL)setProperty:(id)a3 value:(id)a4 error:(id *)a5;
- (double)getNitsWithError:(id *)a3;
- (float)boostFactorFromIOFixed:(int)a3;
- (id)copyModuleIdentifier;
- (id)copyProperty:(id)a3 error:(id *)a4;
- (unint64_t)registryID;
- (void)addDisplayService:(unsigned int)a3;
- (void)dealloc;
- (void)refreshBoostFactor;
- (void)removeDisplayService;
- (void)setBoostFactor:(float)a3;
- (void)setDisplayService:(unsigned int)a3;
@end

@implementation BCHIDBrtControl

+ (id)newMonitorWithHandler:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  CFDictionaryRef v6 = (const __CFDictionary *)_copyMatchingDict();
  inited = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT) {
    inited = init_default_corebrightness_log();
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    CFDictionaryRef v26 = v6;
    _os_log_impl(&dword_238363000, inited, OS_LOG_TYPE_INFO, "matching dictionary = %@", buf, 0xCu);
  }
  v8 = dispatch_queue_create("com.apple.BCHIDBrtControl.global", 0);
  v9 = IONotificationPortCreate(*MEMORY[0x263F0EC90]);
  IONotificationPortSetDispatchQueue(v9, v8);
  *(_DWORD *)buf = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __47__BCHIDBrtControl_newMonitorWithHandler_error___block_invoke;
  v24[3] = &unk_264D10038;
  v24[4] = a3;
  v10 = _newBlockWrapper(v24);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v19 = __47__BCHIDBrtControl_newMonitorWithHandler_error___block_invoke_2;
  v20 = &unk_264D10148;
  v21 = v8;
  v22 = v9;
  v23 = v10;
  uint64_t v11 = IOServiceAddMatchingNotification(v9, "IOServiceFirstMatch", v6, (IOServiceMatchingCallback)_iokitCallback, v10, (io_iterator_t *)buf);
  if (!v11)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __47__BCHIDBrtControl_newMonitorWithHandler_error___block_invoke_5;
    v16[3] = &__block_descriptor_44_e5_v8__0l;
    v16[4] = v10;
    int v17 = *(_DWORD *)buf;
    dispatch_async(v8, v16);
    v14 = objc_alloc_init(BCBrtMonitor);
    [(BCBrtMonitor *)v14 setCancelHandler:v18];
    return v14;
  }
  uint64_t v12 = v11;
  v13 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT) {
    v13 = init_default_corebrightness_log();
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    +[BCHIDBrtControl newMonitorWithHandler:error:](v12, v13);
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (a4) {
LABEL_10:
  }
    *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithIOKitError:v12];
LABEL_11:
  v19((uint64_t)v18);
  return 0;
}

uint64_t __47__BCHIDBrtControl_newMonitorWithHandler_error___block_invoke(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v5 = result;
    do
    {
      CFDictionaryRef v6 = [[BCHIDBrtControl alloc] initWithService:v5];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

void __47__BCHIDBrtControl_newMonitorWithHandler_error___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__BCHIDBrtControl_newMonitorWithHandler_error___block_invoke_3;
  block[3] = &unk_264D10148;
  block[6] = *(void *)(a1 + 48);
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), block);
}

void __47__BCHIDBrtControl_newMonitorWithHandler_error___block_invoke_3(uint64_t a1)
{
  IONotificationPortDestroy(*(IONotificationPortRef *)(a1 + 40));
  _freeBlockWrapper(*(const void ***)(a1 + 48));
  v2 = *(NSObject **)(a1 + 32);
  dispatch_release(v2);
}

uint64_t __47__BCHIDBrtControl_newMonitorWithHandler_error___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(**(void **)(a1 + 32) + 16))(**(void **)(a1 + 32), *(unsigned int *)(a1 + 40));
}

+ (id)copyAvailableControls
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  io_iterator_t existing = 0;
  mach_port_t v3 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v4 = (const __CFDictionary *)_copyMatchingDict();
  if (IOServiceGetMatchingServices(v3, v4, &existing)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = existing == 0;
  }
  if (!v5)
  {
    uint64_t v6 = IOIteratorNext(existing);
    if (v6)
    {
      v7 = [[BCHIDBrtControl alloc] initWithService:v6];
      if (v7) {
        [v2 addObject:v7];
      }
    }
  }
  return v2;
}

- (id)copyModuleIdentifier
{
  id v2 = [NSString alloc];
  return (id)[v2 initWithString:@"com.apple.BCBrtControl.HID"];
}

- (BCHIDBrtControl)initWithService:(unsigned int)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    if ([(BCBrtControl *)self logHandle])
    {
      inited = [(BCBrtControl *)self logHandle];
    }
    else
    {
      v9 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (_COREBRIGHTNESS_LOG_DEFAULT)
      {
LABEL_11:
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[BCHIDBrtControl initWithService:]();
        }
        return 0;
      }
      inited = (OS_os_log *)init_default_corebrightness_log();
    }
    v9 = inited;
    goto LABEL_11;
  }
  v61.receiver = self;
  v61.super_class = (Class)BCHIDBrtControl;
  BOOL v5 = [(BCBrtControl *)&v61 init];
  if (!v5) {
    return (BCHIDBrtControl *)v5;
  }
  context = (void *)MEMORY[0x23EC8DDF0]();
  *((_DWORD *)v5 + 49) = 1065353216;
  v54 = (int *)(v5 + 116);
  *((_DWORD *)v5 + 29) = a3;
  v51 = v5 + 200;
  if (IORegistryEntryGetRegistryEntryID(a3, (uint64_t *)v5 + 25))
  {
    if ([v5 logHandle])
    {
      os_log_t v6 = (os_log_t)[v5 logHandle];
    }
    else
    {
      v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (_COREBRIGHTNESS_LOG_DEFAULT)
      {
LABEL_14:
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[BCHIDBrtControl initWithService:].cold.7(v54, v7);
        }
        goto LABEL_16;
      }
      os_log_t v6 = init_default_corebrightness_log();
    }
    v7 = v6;
    goto LABEL_14;
  }
LABEL_16:
  CFTypeRef v10 = IORegistryEntrySearchCFProperty(*v54, "IOService", @"kUSBContainerID", (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);
  if (v10)
  {
    *((void *)v5 + 9) = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v10];
    CFRelease(v10);
    goto LABEL_24;
  }
  *((void *)v5 + 9) = 0;
  if ([v5 logHandle])
  {
    os_log_t v11 = (os_log_t)[v5 logHandle];
LABEL_20:
    uint64_t v12 = v11;
    goto LABEL_22;
  }
  uint64_t v12 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    os_log_t v11 = init_default_corebrightness_log();
    goto LABEL_20;
  }
LABEL_22:
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[BCHIDBrtControl initWithService:].cold.6();
  }
LABEL_24:
  dispatch_queue_t v13 = dispatch_queue_create("com.apple.BCBrtControl.HID.BrtUpdate", 0);
  *((void *)v5 + 22) = v13;
  if (v13) {
    goto LABEL_32;
  }
  if ([v5 logHandle])
  {
    os_log_t v14 = (os_log_t)[v5 logHandle];
  }
  else
  {
    v15 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      goto LABEL_29;
    }
    os_log_t v14 = init_default_corebrightness_log();
  }
  v15 = v14;
LABEL_29:
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[BCHIDBrtControl initWithService:].cold.5();
  }
  objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"Resource unavailable", @"Invalid queue", v51, context);
LABEL_32:
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3052000000;
  v60[3] = __Block_byref_object_copy__0;
  v60[4] = __Block_byref_object_dispose__0;
  v60[5] = v5;
  v16 = (void *)[objc_alloc(MEMORY[0x263F0EC38]) initWithService:*v54];
  *((void *)v5 + 15) = v16;
  if (!v16)
  {
    if ([v5 logHandle])
    {
      os_log_t v28 = (os_log_t)[v5 logHandle];
    }
    else
    {
      v29 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        goto LABEL_67;
      }
      os_log_t v28 = init_default_corebrightness_log();
    }
    v29 = v28;
LABEL_67:
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[BCHIDBrtControl initWithService:]();
    }

    goto LABEL_76;
  }
  objc_msgSend(v16, "setDispatchQueue:", objc_msgSend(v5, "queue"));
  int v17 = (void *)*((void *)v5 + 15);
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __35__BCHIDBrtControl_initWithService___block_invoke;
  v59[3] = &unk_264D100A8;
  v59[4] = v60;
  [v17 setRemovalHandler:v59];
  [*((id *)v5 + 15) open];
  [*((id *)v5 + 15) activate];
  id v18 = objc_alloc_init(NSDictionary);
  v19 = (void *)[*((id *)v5 + 15) elementsMatching:v18];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v55 objects:v72 count:16];
  if (!v20) {
    goto LABEL_49;
  }
  uint64_t v21 = *(void *)v56;
  do
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      if (*(void *)v56 != v21) {
        objc_enumerationMutation(v19);
      }
      v23 = *(void **)(*((void *)&v55 + 1) + 8 * i);
      if (objc_msgSend(v23, "type", v51) == 257
        && [v23 usage] == 16
        && [v23 usagePage] == 130)
      {
        id v24 = v23;
        v25 = &OBJC_IVAR___BCHIDBrtControl__brightnessElement;
LABEL_46:
        *(void *)&v5[*v25] = v24;
        continue;
      }
      if ([v23 type] == 257 && objc_msgSend(v23, "usage") == 80 && objc_msgSend(v23, "usagePage") == 15)
      {
        id v24 = v23;
        v25 = &OBJC_IVAR___BCHIDBrtControl__brightnessFadeElement;
        goto LABEL_46;
      }
    }
    uint64_t v20 = [v19 countByEnumeratingWithState:&v55 objects:v72 count:16];
  }
  while (v20);
LABEL_49:

  if (!*((void *)v5 + 16))
  {
    if ([v5 logHandle])
    {
      os_log_t v33 = (os_log_t)[v5 logHandle];
    }
    else
    {
      v34 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        goto LABEL_73;
      }
      os_log_t v33 = init_default_corebrightness_log();
    }
    v34 = v33;
LABEL_73:
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[BCHIDBrtControl initWithService:]();
    }

LABEL_76:
    _Block_object_dispose(v60, 8);
    return 0;
  }
  *((_DWORD *)v5 + 36) = 1120403456;
  if ([*((id *)v5 + 16) physicalMax] < 2001 || objc_msgSend(*((id *)v5 + 16), "unitExponent") < 1)
  {
    *((double *)v5 + 6) = (double)objc_msgSend(*((id *)v5 + 16), "physicalMax", v51);
    double v27 = (double)[*((id *)v5 + 16) physicalMin];
LABEL_58:
    *((double *)v5 + 8) = v27;
  }
  else
  {
    float v26 = scaleForExponent([*((id *)v5 + 16) unitExponent]);
    *((float *)v5 + 36) = v26;
    if (v26 > 0.0)
    {
      *((double *)v5 + 6) = (float)((float)[*((id *)v5 + 16) physicalMax] / *((float *)v5 + 36));
      double v27 = (float)((float)[*((id *)v5 + 16) physicalMin] / *((float *)v5 + 36));
      goto LABEL_58;
    }
  }
  v30 = (uint64_t *)(v5 + 152);
  if ((objc_msgSend(v5, "_getDeviceNits:", v5 + 152, v51) & 1) == 0)
  {
    if ([v5 logHandle])
    {
      os_log_t v31 = (os_log_t)[v5 logHandle];
      goto LABEL_62;
    }
    v32 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT)
    {
      os_log_t v31 = init_default_corebrightness_log();
LABEL_62:
      v32 = v31;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[BCHIDBrtControl initWithService:].cold.4();
    }
    uint64_t *v30 = 0x4062C00000000000;
  }
  if ([v5 logHandle])
  {
    os_log_t v36 = (os_log_t)[v5 logHandle];
    goto LABEL_85;
  }
  v37 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    os_log_t v36 = init_default_corebrightness_log();
LABEL_85:
    v37 = v36;
  }
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v38 = *v30;
    uint64_t v39 = *((void *)v5 + 6);
    uint64_t v40 = *((void *)v5 + 8);
    float v41 = *((float *)v5 + 36);
    uint64_t v42 = [*((id *)v5 + 16) unitExponent];
    *(_DWORD *)buf = 134219008;
    uint64_t v63 = v38;
    __int16 v64 = 2048;
    uint64_t v65 = v39;
    __int16 v66 = 2048;
    uint64_t v67 = v40;
    __int16 v68 = 2048;
    double v69 = v41;
    __int16 v70 = 2048;
    uint64_t v71 = v42;
    _os_log_impl(&dword_238363000, v37, OS_LOG_TYPE_DEFAULT, "nits = %f, maxNits = %f, minNits = %f, nitsScaler = %f, exponent = %ld", buf, 0x34u);
  }
  if (*((void *)v5 + 9))
  {
    v43 = (void *)MEMORY[0x23EC8DDF0]();
    objc_msgSend(*((id *)v5 + 5), "setValue:forKey:", objc_msgSend(*((id *)v5 + 9), "UUIDString"), @"kUSBContainerID");
  }
  objc_msgSend(*((id *)v5 + 5), "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", *v52), @"RegistryID");
  objc_msgSend(*((id *)v5 + 5), "setValue:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", *((double *)v5 + 8)), @"MinNits");
  objc_msgSend(*((id *)v5 + 5), "setValue:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", *((double *)v5 + 6)), @"MaxNits");
  objc_msgSend(*((id *)v5 + 5), "setValue:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 0), @"BuiltIn");
  v5[32] = 1;
  if ([v5 logHandle])
  {
    os_log_t v44 = (os_log_t)[v5 logHandle];
    goto LABEL_93;
  }
  v45 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    os_log_t v44 = init_default_corebrightness_log();
LABEL_93:
    v45 = v44;
  }
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    uint64_t v46 = *((void *)v5 + 15);
    int v47 = *v54;
    *(_DWORD *)buf = 138543618;
    uint64_t v63 = v46;
    __int16 v64 = 1024;
    LODWORD(v65) = v47;
    _os_log_impl(&dword_238363000, v45, OS_LOG_TYPE_INFO, "successfully created HID device (%{public}@) for service %ul", buf, 0x12u);
  }
  if ([v5 logHandle])
  {
    os_log_t v48 = (os_log_t)[v5 logHandle];
    goto LABEL_99;
  }
  v49 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    os_log_t v48 = init_default_corebrightness_log();
LABEL_99:
    v49 = v48;
  }
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    uint64_t v50 = *((void *)v5 + 5);
    *(_DWORD *)buf = 138543362;
    uint64_t v63 = v50;
    _os_log_impl(&dword_238363000, v49, OS_LOG_TYPE_INFO, "capabilities = %{public}@", buf, 0xCu);
  }
  _Block_object_dispose(v60, 8);
  return (BCHIDBrtControl *)v5;
}

void __35__BCHIDBrtControl_initWithService___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 32) = 0;
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) logHandle])
  {
    os_log_t inited = (os_log_t)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) logHandle];
LABEL_3:
    mach_port_t v3 = inited;
    goto LABEL_5;
  }
  mach_port_t v3 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    os_log_t inited = init_default_corebrightness_log();
    goto LABEL_3;
  }
LABEL_5:
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_238363000, v3, OS_LOG_TYPE_INFO, "device removed", buf, 2u);
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) logHandle])
  {
    os_log_t v4 = (os_log_t)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) logHandle];
LABEL_9:
    BOOL v5 = v4;
    goto LABEL_11;
  }
  BOOL v5 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    os_log_t v4 = init_default_corebrightness_log();
    goto LABEL_9;
  }
LABEL_11:
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) displayInvalidHandler];
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_238363000, v5, OS_LOG_TYPE_INFO, "weakSelf.displayInvalidHandler = %@", buf, 0xCu);
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) callbackQueue]) {
    global_queue = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) callbackQueue];
  }
  else {
    global_queue = dispatch_get_global_queue(0, 0);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__BCHIDBrtControl_initWithService___block_invoke_24;
  block[3] = &unk_264D100A8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __35__BCHIDBrtControl_initWithService___block_invoke_24(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) displayInvalidHandler];
  if (result)
  {
    mach_port_t v3 = *(uint64_t (**)(void))([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) displayInvalidHandler]+ 16);
    return v3();
  }
  return result;
}

- (BCHIDBrtControl)init
{
  mach_port_t v3 = (void *)MEMORY[0x23EC8DDF0](self, a2);
  CFDictionaryRef v4 = (const __CFDictionary *)_copyMatchingDict();
  uint64_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC90], v4);
  return [(BCHIDBrtControl *)self initWithService:MatchingService];
}

- (void)dealloc
{
  if ([(BCBrtControl *)self logHandle])
  {
    os_log_t inited = [(BCBrtControl *)self logHandle];
LABEL_3:
    CFDictionaryRef v4 = inited;
    goto LABEL_5;
  }
  CFDictionaryRef v4 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    os_log_t inited = (OS_os_log *)init_default_corebrightness_log();
    goto LABEL_3;
  }
LABEL_5:
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_238363000, v4, OS_LOG_TYPE_DEFAULT, "dealloc", buf, 2u);
  }
  [(BCHIDBrtControl *)self removeDisplayService];
  brightnessUpdateQueue = self->_brightnessUpdateQueue;
  if (brightnessUpdateQueue)
  {
    dispatch_release(brightnessUpdateQueue);
    self->_brightnessUpdateQueue = 0;
  }

  [(HIDDevice *)self->_hidBrightnessDevice cancel];
  [(HIDDevice *)self->_hidBrightnessDevice close];

  v6.receiver = self;
  v6.super_class = (Class)BCHIDBrtControl;
  [(BCBrtControl *)&v6 dealloc];
}

- (unint64_t)registryID
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  mach_port_t v3 = [(BCBrtControl *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __29__BCHIDBrtControl_registryID__block_invoke;
  v6[3] = &unk_264D10170;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync((dispatch_queue_t)v3, v6);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __29__BCHIDBrtControl_registryID__block_invoke(uint64_t a1)
{
  return IORegistryEntryGetRegistryEntryID(*(_DWORD *)(*(void *)(a1 + 32) + 116), (uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (BOOL)_getDeviceNits:(double *)a3
{
  unsigned int v4 = 0;
  uint64_t v26 = *MEMORY[0x263EF8340];
  while (1)
  {
    BOOL v5 = (void *)MEMORY[0x23EC8DDF0](self, a2);
    id v19 = 0;
    if (-[HIDDevice commitElements:direction:error:](self->_hidBrightnessDevice, "commitElements:direction:error:", [MEMORY[0x263EFF8C0] arrayWithObject:self->_brightnessElement], 0, &v19))break; {
    if ([(BCBrtControl *)self logHandle])
    }
    {
      os_log_t inited = [(BCBrtControl *)self logHandle];
LABEL_5:
      uint64_t v7 = inited;
      goto LABEL_7;
    }
    uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT)
    {
      os_log_t inited = (OS_os_log *)init_default_corebrightness_log();
      goto LABEL_5;
    }
LABEL_7:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      double v21 = *(double *)&v19;
      _os_log_error_impl(&dword_238363000, v7, OS_LOG_TYPE_ERROR, "failed to commit elements %{public}@", buf, 0xCu);
    }
    if ([v19 retIOKitError] != -536850432) {
      ++v4;
    }
    if (v4 > 8) {
      break;
    }
    if ([(BCBrtControl *)self logHandle])
    {
      v8 = [(BCBrtControl *)self logHandle];
LABEL_14:
      uint64_t v9 = v8;
      goto LABEL_16;
    }
    uint64_t v9 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT)
    {
      v8 = (OS_os_log *)init_default_corebrightness_log();
      goto LABEL_14;
    }
LABEL_16:
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = v4;
      _os_log_error_impl(&dword_238363000, v9, OS_LOG_TYPE_ERROR, "retrying commit attempt No.%d", buf, 8u);
    }
    usleep(0xC350u);
  }
  [(HIDElement *)self->_brightnessElement scaleValue:2];
  *(float *)&double v10 = v10;
  double v11 = *(float *)&v10;
  if (self->super._maxNits >= *(float *)&v10 && self->super._minNits <= v11)
  {
    *a3 = v11;
    LOBYTE(v14) = 1;
  }
  else
  {
    if ([(BCBrtControl *)self logHandle])
    {
      uint64_t v12 = [(BCBrtControl *)self logHandle];
      goto LABEL_25;
    }
    dispatch_queue_t v13 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT)
    {
      uint64_t v12 = (OS_os_log *)init_default_corebrightness_log();
LABEL_25:
      dispatch_queue_t v13 = v12;
    }
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      double minNits = self->super._minNits;
      double maxNits = self->super._maxNits;
      *(_DWORD *)buf = 134218496;
      double v21 = v11;
      __int16 v22 = 2048;
      double v23 = minNits;
      __int16 v24 = 2048;
      double v25 = maxNits;
      _os_log_error_impl(&dword_238363000, v13, OS_LOG_TYPE_ERROR, "error: value (%f) out of bounds (%f-%f)", buf, 0x20u);
      LOBYTE(v14) = 0;
    }
  }
  return v14;
}

- (BOOL)_setDeviceNits:(double)minNits
{
  if (self->super._minNits >= minNits) {
    double minNits = self->super._minNits;
  }
  if (self->super._maxNits < minNits) {
    double minNits = self->super._maxNits;
  }
  unint64_t brighntessUpdateCounter = self->_brighntessUpdateCounter;
  self->_unint64_t brighntessUpdateCounter = brighntessUpdateCounter + 1;
  float v4 = minNits;
  self->_brightnessUpdateTarget = v4;
  self->_nits = minNits;
  if (!brighntessUpdateCounter)
  {
    brightnessUpdateQueue = self->_brightnessUpdateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__BCHIDBrtControl__setDeviceNits___block_invoke;
    block[3] = &unk_264D10198;
    block[4] = self;
    dispatch_async(brightnessUpdateQueue, block);
  }
  return 1;
}

void __34__BCHIDBrtControl__setDeviceNits___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v1 = (id *)(a1 + 32);
  id v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__BCHIDBrtControl__setDeviceNits___block_invoke_2;
  block[3] = &unk_264D10170;
  block[4] = *v1;
  void block[5] = &v17;
  dispatch_sync(v2, block);
  if (*((unsigned char *)v18 + 24))
  {
    mach_port_t v3 = (void *)MEMORY[0x23EC8DDF0]();
    uint64_t v15 = 0;
    float v4 = (void *)[MEMORY[0x263EFF980] arrayWithObject:*((void *)*v1 + 16)];
    BOOL v5 = v4;
    objc_super v6 = (id *)*v1;
    if (*((void *)*v1 + 17))
    {
      objc_msgSend(v4, "addObject:");
      objc_super v6 = (id *)*v1;
    }
    char v7 = [v6[15] commitElements:v5 direction:1 error:&v15];
    id v8 = *v1;
    if (v7)
    {
      if ([v8 logHandle])
      {
        os_log_t inited = (os_log_t)[*v1 logHandle];
      }
      else
      {
        double v10 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (_COREBRIGHTNESS_LOG_DEFAULT)
        {
LABEL_12:
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            uint64_t v13 = *((void *)*v1 + 19);
            double v14 = *((float *)*v1 + 49);
            *(_DWORD *)buf = 134218240;
            uint64_t v22 = v13;
            __int16 v23 = 2048;
            double v24 = v14;
            _os_log_impl(&dword_238363000, v10, OS_LOG_TYPE_INFO, "setting nits %f X %f boost factor", buf, 0x16u);
          }
LABEL_17:
          goto LABEL_18;
        }
        os_log_t inited = init_default_corebrightness_log();
      }
      double v10 = inited;
      goto LABEL_12;
    }
    if ([v8 logHandle])
    {
      os_log_t v11 = (os_log_t)[*v1 logHandle];
    }
    else
    {
      uint64_t v12 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (_COREBRIGHTNESS_LOG_DEFAULT)
      {
LABEL_15:
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          __34__BCHIDBrtControl__setDeviceNits___block_invoke_cold_1((uint64_t)v1, &v15, v12);
        }
        goto LABEL_17;
      }
      os_log_t v11 = init_default_corebrightness_log();
    }
    uint64_t v12 = v11;
    goto LABEL_15;
  }
LABEL_18:
  _Block_object_dispose(&v17, 8);
}

void *__34__BCHIDBrtControl__setDeviceNits___block_invoke_2(void *result)
{
  uint64_t v1 = result[4];
  if (*(void *)(v1 + 168))
  {
    id v2 = result;
    double v3 = *(double *)(v1 + 152) * *(float *)(v1 + 196);
    if (*(double *)(v1 + 48) < v3) {
      double v3 = *(double *)(v1 + 48);
    }
    if (*(double *)(v1 + 64) >= v3) {
      double v3 = *(double *)(v1 + 64);
    }
    [*(id *)(v1 + 128) setIntegerValue:(uint64_t)(v3 * *(float *)(v1 + 144))];
    uint64_t result = *(void **)(v2[4] + 136);
    if (result) {
      uint64_t result = (void *)[result setIntegerValue:0];
    }
    *(unsigned char *)(*(void *)(v2[5] + 8) + 24) = 1;
    uint64_t v1 = v2[4];
  }
  *(void *)(v1 + 168) = 0;
  return result;
}

- (BOOL)setNits:(double)a3 error:(id *)a4
{
  objc_super v6 = [(BCBrtControl *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__BCHIDBrtControl_setNits_error___block_invoke;
  v8[3] = &unk_264D101C0;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  dispatch_sync((dispatch_queue_t)v6, v8);
  return 1;
}

uint64_t __33__BCHIDBrtControl_setNits_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setDeviceNits:*(double *)(a1 + 40)];
}

- (double)getNitsWithError:(id *)a3
{
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v9 = 0;
  double v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  unint64_t v12 = 0xBFF0000000000000;
  BOOL v5 = [(BCBrtControl *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__BCHIDBrtControl_getNitsWithError___block_invoke;
  block[3] = &unk_264D101E8;
  block[4] = self;
  void block[5] = &v13;
  void block[6] = &v9;
  dispatch_sync((dispatch_queue_t)v5, block);
  if (a3 && !*((unsigned char *)v14 + 24)) {
    *a3 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithBCError:19];
  }
  double v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

uint64_t __36__BCHIDBrtControl_getNitsWithError___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _getDeviceNits:*(void *)(*(void *)(a1 + 48) + 8) + 24];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)setProperty:(id)a3 value:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)copyProperty:(id)a3 error:(id *)a4
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = __Block_byref_object_copy__0;
  double v14 = __Block_byref_object_dispose__0;
  uint64_t v15 = 0;
  double v6 = [(BCBrtControl *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__BCHIDBrtControl_copyProperty_error___block_invoke;
  block[3] = &unk_264D10210;
  void block[5] = self;
  void block[6] = &v10;
  block[4] = a3;
  dispatch_sync((dispatch_queue_t)v6, block);
  char v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __38__BCHIDBrtControl_copyProperty_error___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 120), "propertyForKey:", *(void *)(a1 + 32)), "copy");
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t result = (uint64_t)IORegistryEntrySearchCFProperty(*(_DWORD *)(*(void *)(a1 + 40) + 116), "IOService", *(CFStringRef *)(a1 + 32), (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
    }
  }
  return result;
}

- (void)setDisplayService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (self->super._displayService)
  {
    [(BCHIDBrtControl *)self removeDisplayService];
    [(BCHIDBrtControl *)self _setDeviceNits:self->_nits];
  }
  if (v3)
  {
    if ([(BCBrtControl *)self logHandle])
    {
      os_log_t inited = [(BCBrtControl *)self logHandle];
    }
    else
    {
      double v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        goto LABEL_8;
      }
      os_log_t inited = (OS_os_log *)init_default_corebrightness_log();
    }
    double v6 = inited;
LABEL_8:
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_238363000, v6, OS_LOG_TYPE_INFO, "adding display service (0x%X)", (uint8_t *)v7, 8u);
    }
    [(BCHIDBrtControl *)self addDisplayService:v3];
  }
}

- (void)removeDisplayService
{
  boostFactorNotificationPort = self->_boostFactorNotificationPort;
  if (boostFactorNotificationPort)
  {
    IONotificationPortDestroy(boostFactorNotificationPort);
    self->_boostFactorNotificationPort = 0;
  }
  io_object_t boostFactorNotification = self->_boostFactorNotification;
  if (boostFactorNotification)
  {
    IOObjectRelease(boostFactorNotification);
    self->_io_object_t boostFactorNotification = 0;
  }
  self->super._displayService = 0;
  self->_nitsBoostFactor = 1.0;
}

- (void)addDisplayService:(unsigned int)a3
{
  self->super._displayService = a3;
  float v4 = IONotificationPortCreate(*MEMORY[0x263F0EC90]);
  self->_boostFactorNotificationPort = v4;
  if (v4)
  {
    queue = self->super._queue;
    if (queue)
    {
      IONotificationPortSetDispatchQueue(v4, queue);
      IOServiceAddInterestNotification(self->_boostFactorNotificationPort, self->super._displayService, "IOGeneralInterest", (IOServiceInterestCallback)BoostFactorUpdateNotificationCallback, self, &self->_boostFactorNotification);
      [(BCHIDBrtControl *)self refreshBoostFactor];
    }
  }
}

- (void)setBoostFactor:(float)a3
{
  p_nitsBoostFactor = &self->_nitsBoostFactor;
  self->_nitsBoostFactor = a3;
  if ([(BCBrtControl *)self logHandle])
  {
    os_log_t inited = [(BCBrtControl *)self logHandle];
LABEL_3:
    double v6 = inited;
    goto LABEL_5;
  }
  double v6 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    os_log_t inited = (OS_os_log *)init_default_corebrightness_log();
    goto LABEL_3;
  }
LABEL_5:
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BCHIDBrtControl setBoostFactor:](p_nitsBoostFactor, v6);
  }
  [(BCHIDBrtControl *)self _setDeviceNits:self->_nits];
}

- (void)refreshBoostFactor
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_238363000, a2, OS_LOG_TYPE_ERROR, "error: invalid boost factor retrieved from IOMFB (%@)", (uint8_t *)&v2, 0xCu);
}

- (float)boostFactorFromIOFixed:(int)a3
{
  return (float)a3 * 0.000015259;
}

+ (void)newMonitorWithHandler:(int)a1 error:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_238363000, a2, OS_LOG_TYPE_ERROR, "Unable to setup IO notifications (error = %d)", (uint8_t *)v2, 8u);
}

- (void)initWithService:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_238363000, v0, v1, "Invalid service", v2, v3, v4, v5, v6);
}

- (void)initWithService:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_238363000, v0, v1, "failed to create HID brightness device", v2, v3, v4, v5, v6);
}

- (void)initWithService:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_238363000, v0, v1, "error: can't find brightness element - abort", v2, v3, v4, v5, v6);
}

- (void)initWithService:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_238363000, v0, v1, "error: failed to retrieve current nits - defaulting to 150 nits", v2, v3, v4, v5, v6);
}

- (void)initWithService:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_238363000, v0, v1, "Invalid queue", v2, v3, v4, v5, v6);
}

- (void)initWithService:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_238363000, v0, v1, "missing container ID. Defaulting to nil", v2, v3, v4, v5, v6);
}

- (void)initWithService:(int *)a1 .cold.7(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_238363000, a2, OS_LOG_TYPE_ERROR, "failed to retrieve registry ID for brightness service (%u)", (uint8_t *)v3, 8u);
}

void __34__BCHIDBrtControl__setDeviceNits___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)a1 + 152);
  uint64_t v4 = *a2;
  int v5 = 134218242;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_238363000, log, OS_LOG_TYPE_ERROR, "failed to set %f nits (%{public}@)", (uint8_t *)&v5, 0x16u);
}

- (double)setBoostFactor:(float *)a1 .cold.1(float *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  double v2 = *a1;
  int v4 = 134217984;
  double v5 = v2;
  _os_log_debug_impl(&dword_238363000, a2, OS_LOG_TYPE_DEBUG, "updated boost factor: %f", (uint8_t *)&v4, 0xCu);
  return result;
}

@end