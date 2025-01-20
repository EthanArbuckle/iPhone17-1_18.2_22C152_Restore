@interface BMBlockMonitoring
+ (id)alertFileName;
+ (id)computePersistencePath:(int64_t *)a3 error:(id *)a4;
+ (id)monitorForTestingWithBootArgs:(id)a3;
+ (id)sanitizedSignature:(id)a3 maxLength:(int64_t)a4;
+ (id)sharedManager;
+ (id)signatureFileName;
+ (void)readEntitlement:(__CFString *)a3 withBlock:(id)a4;
- (BOOL)_test_getAlertShown;
- (BOOL)_test_getAlreadyFaulted;
- (BOOL)_test_getCoreDumpsDisabled;
- (BOOL)_test_getEnabled;
- (BOOL)_test_getPanicWithData;
- (BOOL)_test_getPresentAlert;
- (BOOL)_test_getWasFirstFault;
- (BOOL)isProcessBeingDebugged;
- (BOOL)parseBootArgInt:(id)a3 where:(int64_t *)a4;
- (id)_test_getAlertPath;
- (id)_test_getOSVersion;
- (id)_test_getPanicReason;
- (id)_test_getSignaturePath;
- (id)alertPath;
- (id)initForTesting:(BOOL)a3 bootArgs:(id)a4;
- (id)signaturePath;
- (uint64_t)lookForDeviceReadiness;
- (unsigned)_test_getDebuggerState;
- (unsigned)_test_getPanicDeny;
- (unsigned)_test_getResultType;
- (void)_test_allowPanic:(BOOL)a3;
- (void)_test_resetVariables;
- (void)_test_setDebuggerState:(unsigned __int8)a3;
- (void)_test_setEnabled:(BOOL)a3;
- (void)_test_setExecutionDuration:(unint64_t)a3;
- (void)_test_setOSVersion:(id)a3;
- (void)_test_setPanicPacing:(int64_t)a3;
- (void)_test_setPanicSleep:(unsigned int)a3;
- (void)_test_setPresentAlert:(BOOL)a3;
- (void)cleanup;
- (void)dealloc;
- (void)executeBlockWithSignature:(const char *)a3 block:(id)a4;
- (void)executeBlockWithSignature:(const char *)a3 timeout:(unint64_t)a4 options:(int)a5 block:(id)a6;
- (void)logFault:(id)a3 reason:(const char *)a4;
- (void)logPanicDeny:(id)a3 reason:(unsigned __int8)a4 demoted:(BOOL)a5;
- (void)lookForDeviceReadiness;
- (void)showBootArgsAlertWithCheckingFirst:(BOOL)a3;
- (void)takeActionIfRelevant:(id)a3 thread_id:(unint64_t)a4 timeout:(unint64_t)a5 options:(int)a6 recovered:(BOOL *)a7;
@end

@implementation BMBlockMonitoring

- (void)executeBlockWithSignature:(const char *)a3 timeout:(unint64_t)a4 options:(int)a5 block:(id)a6
{
  v10 = (void (**)(void))a6;
  if (!a3) {
    -[BMBlockMonitoring initForTesting:bootArgs:]();
  }
  v11 = v10;
  if (!v10) {
    -[BMBlockMonitoring initForTesting:bootArgs:]();
  }
  queue = self->_queue;
  if (queue && self->_enabled && self->_deviceState == 3 && (a5 || !self->_coreDumpsDisabled || self->_presentAlert))
  {
    v13 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, queue);
    dispatch_time_t v14 = dispatch_time(0, 1000000000 * a4);
    dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 1000000000 * a4 / 0xA);
    v15 = strdup(a3);
    __uint64_t v21 = 0;
    v16 = pthread_self();
    pthread_threadid_np(v16, &v21);
    v17 = (unsigned __int8 *)malloc_type_malloc(1uLL, 0x100004077774924uLL);
    atomic_store(0, v17);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __69__BMBlockMonitoring_executeBlockWithSignature_timeout_options_block___block_invoke;
    handler[3] = &unk_265256B58;
    handler[4] = self;
    handler[5] = v15;
    handler[6] = v21;
    handler[7] = a4;
    int v20 = a5;
    handler[8] = v17;
    dispatch_source_set_event_handler(v13, handler);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __69__BMBlockMonitoring_executeBlockWithSignature_timeout_options_block___block_invoke_2;
    v18[3] = &__block_descriptor_48_e5_v8__0l;
    v18[4] = v15;
    v18[5] = v17;
    dispatch_source_set_cancel_handler(v13, v18);
    dispatch_activate(v13);
    v11[2](v11);
    unsigned __int8 *v17 = 1;
    dispatch_source_cancel(v13);
  }
  else
  {
    v10[2](v10);
  }
}

- (void)executeBlockWithSignature:(const char *)a3 block:(id)a4
{
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedManager_sharedManager;
  return v2;
}

uint64_t __34__BMBlockMonitoring_sharedManager__block_invoke()
{
  sharedManager_sharedManager = [[BMBlockMonitoring alloc] initForTesting:0 bootArgs:0];
  return MEMORY[0x270F9A758]();
}

- (id)initForTesting:(BOOL)a3 bootArgs:(id)a4
{
  BOOL v5 = a3;
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v72.receiver = self;
  v72.super_class = (Class)BMBlockMonitoring;
  v8 = [(BMBlockMonitoring *)&v72 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_54;
  }
  v8->_testing = v5;
  if (v5) {
    objc_storeStrong((id *)&v8->_test_bootArgs, a4);
  }
  *(_OWORD *)&v9->_executionDuration = xmmword_24933D0D0;
  os_log_t v10 = os_log_create("com.apple.blockmonitoring", "BMBlockMonitoring");
  logger = v9->_logger;
  v9->_logger = (OS_os_log *)v10;

  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v9->_BOOL enabled = has_internal_diagnostics;
  if (!has_internal_diagnostics) {
    goto LABEL_48;
  }
  if (MGGetBoolAnswer())
  {
    if (os_log_type_enabled((os_log_t)v9->_logger, OS_LOG_TYPE_ERROR)) {
      -[BMBlockMonitoring initForTesting:bootArgs:]();
    }
    v9->_BOOL enabled = 0;
    goto LABEL_48;
  }
  if (!v9->_enabled) {
    goto LABEL_48;
  }
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x2020000000;
  char v79 = 0;
  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __45__BMBlockMonitoring_initForTesting_bootArgs___block_invoke;
  v69[3] = &unk_265256AB8;
  v71 = &v76;
  v13 = v9;
  v70 = v13;
  +[BMBlockMonitoring readEntitlement:@"com.apple.security.exception.sysctl.read-only" withBlock:v69];
  if (*((unsigned char *)v77 + 24))
  {
    *(void *)v73 = 0;
    if ([(BMBlockMonitoring *)v13 parseBootArgInt:@"debug" where:v73]
      && (v73[1] & 4) != 0)
    {
      v9->_BOOL enabled = 1;
    }
    else
    {
      dispatch_time_t v14 = v9->_logger;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[BMBlockMonitoring initForTesting:bootArgs:].cold.9((uint64_t)v73, v14, v15, v16, v17, v18, v19, v20);
      }
      v9->_BOOL enabled = 1;
      v13->_BOOL coreDumpsDisabled = 1;
      if (![(BMBlockMonitoring *)v13 parseBootArgInt:@"blockmonitoringnoui" where:0])
      {
        atomic_store(1u, (unsigned __int8 *)&v13->_presentAlert);
        v13->_bootDebugFlags = *(void *)v73;
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)v9->_logger, OS_LOG_TYPE_ERROR)) {
      -[BMBlockMonitoring initForTesting:bootArgs:].cold.8();
    }
    v9->_BOOL enabled = 0;
  }

  _Block_object_dispose(&v76, 8);
  if (!v9->_enabled) {
    goto LABEL_48;
  }
  uint64_t v76 = 0;
  BOOL v21 = [(BMBlockMonitoring *)v13 parseBootArgInt:@"wdt" where:&v76];
  if (v76 == -1 && v21)
  {
    v23 = v9->_logger;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[BMBlockMonitoring initForTesting:bootArgs:].cold.7((uint64_t)&v76, v23, v24, v25, v26, v27, v28, v29);
    }
    v9->_BOOL enabled = 0;
    atomic_store(0, (unsigned __int8 *)&v13->_presentAlert);
  }
  uint64_t v76 = -1;
  uint64_t v30 = [(BMBlockMonitoring *)v13 parseBootArgInt:@"blockmonitoring" where:&v76];
  if (v76) {
    int v31 = 0;
  }
  else {
    int v31 = v30;
  }
  if (v31 == 1)
  {
    v32 = v9->_logger;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[BMBlockMonitoring initForTesting:bootArgs:]((uint64_t)&v76, v32, v33, v34, v35, v36, v37, v38);
    }
    v9->_BOOL enabled = 0;
    atomic_store(0, (unsigned __int8 *)&v13->_presentAlert);
    goto LABEL_48;
  }
  if (!v9->_enabled)
  {
LABEL_48:
    LOBYTE(v76) = 0;
    goto LABEL_49;
  }
  v39 = (void *)MEMORY[0x24C59AE60](v30);
  v40 = [MEMORY[0x263F086E0] mainBundle];
  v41 = [v40 bundleIdentifier];

  if (([v41 isEqualToString:@"com.apple.springboard"] & 1) == 0
    && ([v41 isEqualToString:@"com.apple.backboardd"] & 1) == 0
    && !v9->_testing)
  {
    if (os_log_type_enabled((os_log_t)v9->_logger, OS_LOG_TYPE_ERROR)) {
      -[BMBlockMonitoring initForTesting:bootArgs:].cold.6();
    }
    v9->_BOOL enabled = 0;
    atomic_store(0, (unsigned __int8 *)&v13->_presentAlert);
  }

  BOOL enabled = v9->_enabled;
  LOBYTE(v76) = 0;
  if (enabled)
  {
    *(void *)v73 = 20;
    if (sysctlbyname("kern.osversion", &v76, (size_t *)v73, 0, 0) < 0)
    {
      v54 = v9->_logger;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        -[BMBlockMonitoring initForTesting:bootArgs:].cold.5(v54);
      }
      v9->_BOOL enabled = 0;
      atomic_store(0, (unsigned __int8 *)&v13->_presentAlert);
    }
    else
    {
      BYTE3(v78) = 0;
      uint64_t v43 = [[NSString alloc] initWithCString:&v76 encoding:4];
      osVersion = v13->_osVersion;
      v13->_osVersion = (NSString *)v43;

      if (v9->_enabled)
      {
        *(void *)v73 = -1;
        id v68 = 0;
        v45 = +[BMBlockMonitoring computePersistencePath:v73 error:&v68];
        id v46 = v68;
        if (v45)
        {
          objc_storeStrong((id *)&v13->_persistencePath, v45);
          v13->_sandboxHandle = *(void *)v73;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)v9->_logger, OS_LOG_TYPE_ERROR)) {
            -[BMBlockMonitoring initForTesting:bootArgs:].cold.4();
          }
          if (*(void *)v73 != -1) {
            sandbox_extension_release();
          }
          v9->_BOOL enabled = 0;
          atomic_store(0, (unsigned __int8 *)&v13->_presentAlert);
        }

        if (v9->_enabled)
        {
          v55 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
          dispatch_queue_t v56 = dispatch_queue_create("com.apple.blockmonitoring.BMBlockMonitoring", v55);
          queue = v13->_queue;
          v13->_queue = (OS_dispatch_queue *)v56;

          v58 = v13->_queue;
          if (!v58) {
            -[BMBlockMonitoring initForTesting:bootArgs:]();
          }

          if (v9->_enabled)
          {
            v66[0] = MEMORY[0x263EF8330];
            v66[1] = 3221225472;
            v66[2] = __45__BMBlockMonitoring_initForTesting_bootArgs___block_invoke_39;
            v66[3] = &unk_265256AE0;
            v59 = v13;
            v67 = v59;
            +[BMBlockMonitoring readEntitlement:@"com.apple.private.allow-ext_paniclog" withBlock:v66];
            if (*((unsigned char *)v59 + 88))
            {
              v60 = v9->_logger;
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v73 = 0;
                _os_log_impl(&dword_249337000, v60, OS_LOG_TYPE_DEFAULT, "Process is properly entitled", v73, 2u);
              }
              getpid();
              *((unsigned char *)v59 + 88) = sandbox_check() == 0;
            }
            v61 = v9->_logger;
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              if (*((unsigned char *)v59 + 88)) {
                v62 = " ";
              }
              else {
                v62 = " not ";
              }
              *(_DWORD *)v73 = 136315138;
              *(void *)&v73[4] = v62;
              _os_log_impl(&dword_249337000, v61, OS_LOG_TYPE_DEFAULT, "BM will%sbe using panic_with_data", v73, 0xCu);
            }

            BOOL v63 = v9->_enabled;
            atomic_store(0, v59 + 23);
            if (v63) {
              [v59 lookForDeviceReadiness];
            }
            goto LABEL_50;
          }
        }
      }
    }
  }
LABEL_49:
  atomic_store(0, &v9->_deviceState);
LABEL_50:
  unsigned __int8 v47 = atomic_load((unsigned __int8 *)&v9->_presentAlert);
  if (v47)
  {
    v48 = v9->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__BMBlockMonitoring_initForTesting_bootArgs___block_invoke_43;
    block[3] = &unk_265256B08;
    v65 = v9;
    dispatch_async(v48, block);
  }
  v49 = v9->_logger;
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v50 = v9->_enabled;
    BOOL coreDumpsDisabled = v9->_coreDumpsDisabled;
    unsigned __int8 v52 = atomic_load((unsigned __int8 *)&v9->_presentAlert);
    *(_DWORD *)v73 = 67109632;
    *(_DWORD *)&v73[4] = v50;
    *(_WORD *)&v73[8] = 1024;
    *(_DWORD *)&v73[10] = coreDumpsDisabled;
    __int16 v74 = 1024;
    int v75 = v52 & 1;
    _os_log_impl(&dword_249337000, v49, OS_LOG_TYPE_DEFAULT, "BM state: %d (%d) - %d", v73, 0x14u);
  }
LABEL_54:

  return v9;
}

void __45__BMBlockMonitoring_initForTesting_bootArgs___block_invoke(uint64_t a1, void *cf, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a3)
  {
    BOOL v5 = *(NSObject **)(*(void *)(a1 + 32) + 80);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = a3;
      _os_log_impl(&dword_249337000, v5, OS_LOG_TYPE_DEFAULT, "Failed gathering entitlement for boot-args reading: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (cf)
  {
    CFTypeID v7 = CFGetTypeID(cf);
    if (v7 == CFArrayGetTypeID()) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [cf containsObject:@"kern.bootargs"];
    }
  }
}

void __45__BMBlockMonitoring_initForTesting_bootArgs___block_invoke_39(uint64_t a1, CFTypeRef cf, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a3)
  {
    BOOL v5 = *(NSObject **)(*(void *)(a1 + 32) + 80);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = a3;
      _os_log_impl(&dword_249337000, v5, OS_LOG_TYPE_DEFAULT, "Failed gathering entitlement for panic_with_data: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (cf)
  {
    CFTypeID v7 = CFGetTypeID(cf);
    if (v7 == CFBooleanGetTypeID()) {
      *(unsigned char *)(*(void *)(a1 + 32) + 88) = CFBooleanGetValue((CFBooleanRef)cf) != 0;
    }
  }
}

uint64_t __45__BMBlockMonitoring_initForTesting_bootArgs___block_invoke_43(uint64_t a1)
{
  return [*(id *)(a1 + 32) showBootArgsAlertWithCheckingFirst:1];
}

- (void)dealloc
{
  [(BMBlockMonitoring *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)BMBlockMonitoring;
  [(BMBlockMonitoring *)&v3 dealloc];
}

- (void)cleanup
{
  if (self->_sandboxHandle != -1)
  {
    sandbox_extension_release();
    self->_sandboxHandle = -1;
  }
}

- (BOOL)parseBootArgInt:(id)a3 where:(int64_t *)a4
{
  id v6 = a3;
  if (self->_testing
    && (test_bootArgs = self->_test_bootArgs) != 0
    && ([(NSDictionary *)test_bootArgs objectForKey:v6],
        int v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    if (a4)
    {
      uint64_t v9 = [(NSDictionary *)self->_test_bootArgs objectForKey:v6];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        -[BMBlockMonitoring initForTesting:bootArgs:]();
      }
      *a4 = [v9 longLongValue];
    }
    char v10 = 1;
  }
  else
  {
    [v6 UTF8String];
    char v10 = os_parse_boot_arg_int();
  }

  return v10;
}

- (void)lookForDeviceReadiness
{
  objc_super v3 = self->_queue;
  if (!v3) {
    -[BMBlockMonitoring initForTesting:bootArgs:]();
  }

  v4 = (void *)MEMORY[0x24C59AE60]();
  queue = self->_queue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __43__BMBlockMonitoring_lookForDeviceReadiness__block_invoke;
  handler[3] = &unk_265256B30;
  handler[4] = self;
  notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &lookForDeviceReadiness_firstUnlockToken, queue, handler);
  if (SetupAssistantLibraryCore())
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    id v6 = (id *)getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr;
    uint64_t v21 = getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr;
    if (!getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr)
    {
      handler[5] = MEMORY[0x263EF8330];
      handler[6] = 3221225472;
      handler[7] = __getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_block_invoke;
      handler[8] = &unk_265256BD8;
      uint64_t v17 = &v18;
      CFTypeID v7 = (void *)SetupAssistantLibrary();
      int v8 = dlsym(v7, "BYSetupAssistantFinishedDarwinNotification");
      *(void *)(v17[1] + 24) = v8;
      getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr = *(void *)(v17[1] + 24);
      id v6 = (id *)v19[3];
    }
    _Block_object_dispose(&v18, 8);
    if (!v6)
    {
      v13 = (_Unwind_Exception *)-[BMBlockMonitoring lookForDeviceReadiness]();
      _Block_object_dispose(&v18, 8);
      _Unwind_Resume(v13);
    }
    id v9 = *v6;
    char v10 = (const char *)[v9 UTF8String];
    v11 = self->_queue;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __43__BMBlockMonitoring_lookForDeviceReadiness__block_invoke_50;
    v15[3] = &unk_265256B30;
    v15[4] = self;
    notify_register_dispatch(v10, &lookForDeviceReadiness_buddyToken, v11, v15);
  }
  v12 = self->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__BMBlockMonitoring_lookForDeviceReadiness__block_invoke_52;
  v14[3] = &unk_265256B08;
  v14[4] = self;
  dispatch_async(v12, v14);
}

void __43__BMBlockMonitoring_lookForDeviceReadiness__block_invoke(uint64_t a1, int token)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  notify_cancel(token);
  unsigned int v3 = atomic_fetch_or_explicit((atomic_uint *volatile)(*(void *)(a1 + 32) + 92), 1u, memory_order_relaxed);
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "Device has been unlocked";
    __int16 v7 = 1024;
    int v8 = v3 | 1;
    _os_log_impl(&dword_249337000, v4, OS_LOG_TYPE_DEFAULT, "%s (state: %d)", (uint8_t *)&v5, 0x12u);
  }
}

void __43__BMBlockMonitoring_lookForDeviceReadiness__block_invoke_50(uint64_t a1, int token)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  notify_cancel(token);
  unsigned int v3 = atomic_fetch_or_explicit((atomic_uint *volatile)(*(void *)(a1 + 32) + 92), 2u, memory_order_relaxed);
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "Device has completed setup";
    __int16 v7 = 1024;
    int v8 = v3 | 2;
    _os_log_impl(&dword_249337000, v4, OS_LOG_TYPE_DEFAULT, "%s (state: %d)", (uint8_t *)&v5, 0x12u);
  }
}

uint64_t __43__BMBlockMonitoring_lookForDeviceReadiness__block_invoke_52(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (MKBGetDeviceLockState() == 3 || MKBDeviceUnlockedSinceBoot())
  {
    unsigned int v2 = atomic_fetch_or_explicit((atomic_uint *volatile)(*(void *)(a1 + 32) + 92), 1u, memory_order_relaxed);
    unsigned int v3 = *(NSObject **)(*(void *)(a1 + 32) + 80);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "Device has been once unlocked";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v2 | 1;
      _os_log_impl(&dword_249337000, v3, OS_LOG_TYPE_DEFAULT, "%s (state: %d)", buf, 0x12u);
    }
    if (lookForDeviceReadiness_firstUnlockToken != -1) {
      notify_cancel(lookForDeviceReadiness_firstUnlockToken);
    }
  }
  uint64_t result = SetupAssistantLibraryCore();
  if (result)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    int v5 = (uint64_t (*)(uint64_t))getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
    dispatch_time_t v14 = getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
    if (!getBYSetupAssistantNeedsToRunSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke;
      uint64_t v16 = &unk_265256BD8;
      uint64_t v17 = &v11;
      id v6 = (void *)SetupAssistantLibrary();
      __int16 v7 = dlsym(v6, "BYSetupAssistantNeedsToRun");
      *(void *)(v17[1] + 24) = v7;
      getBYSetupAssistantNeedsToRunSymbolLoc_ptr = *(_UNKNOWN **)(v17[1] + 24);
      int v5 = (uint64_t (*)(uint64_t))v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v5)
    {
      -[BMBlockMonitoring lookForDeviceReadiness]();
      __break(1u);
    }
    uint64_t result = v5(v8);
    if ((result & 1) == 0)
    {
      unsigned int v9 = atomic_fetch_or_explicit((atomic_uint *volatile)(*(void *)(a1 + 32) + 92), 2u, memory_order_relaxed);
      char v10 = *(NSObject **)(*(void *)(a1 + 32) + 80);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "Device does not require setup";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v9 | 2;
        _os_log_impl(&dword_249337000, v10, OS_LOG_TYPE_DEFAULT, "%s (state: %d)", buf, 0x12u);
      }
      uint64_t result = lookForDeviceReadiness_buddyToken;
      if (lookForDeviceReadiness_buddyToken != -1) {
        return notify_cancel(lookForDeviceReadiness_buddyToken);
      }
    }
  }
  return result;
}

- (id)signaturePath
{
  persistencePath = self->_persistencePath;
  if (persistencePath)
  {
    unsigned int v3 = +[BMBlockMonitoring signatureFileName];
    persistencePath = [persistencePath stringByAppendingPathComponent:v3];
  }
  return persistencePath;
}

- (id)alertPath
{
  persistencePath = self->_persistencePath;
  if (persistencePath)
  {
    unsigned int v3 = +[BMBlockMonitoring alertFileName];
    persistencePath = [persistencePath stringByAppendingPathComponent:v3];
  }
  return persistencePath;
}

- (void)showBootArgsAlertWithCheckingFirst:(BOOL)a3
{
  BOOL v3 = a3;
  v18[4] = *MEMORY[0x263EF8340];
  int v5 = (void *)MEMORY[0x24C59AE60](self, a2);
  id v6 = [(BMBlockMonitoring *)self alertPath];
  __int16 v7 = v6;
  if (!v3 || !access((const char *)[v6 fileSystemRepresentation], 0))
  {
    if (self->_testing)
    {
      self->_test_alertShown = 1;
    }
    else
    {
      SInt32 error = 0;
      uint64_t v8 = *MEMORY[0x263EFFFD8];
      v17[0] = *MEMORY[0x263EFFFC8];
      v17[1] = v8;
      v18[0] = @"Missing boot-arg";
      v18[1] = @"Your device encountered an unexpectedly long stall that requires a core dump to diagnose. Please add bit 0x400 to the \"debug\" boot-arg to enable core dumps, then reboot your device and reproduce your latest actions. A core dump will be gathered automatically at the right time. Do you want to open Livability app to update the boot-arg?";
      uint64_t v9 = *MEMORY[0x263EFFFE8];
      v17[2] = *MEMORY[0x263F00000];
      v17[3] = v9;
      v18[2] = @"Update";
      v18[3] = @"Dismiss";
      CFDictionaryRef v10 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
      uint64_t v11 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, 2uLL, &error, v10);
      CFOptionFlags responseFlags = 0;
      CFUserNotificationReceiveResponse(v11, 0.0, &responseFlags);
      if (!responseFlags)
      {
        v12 = objc_msgSend(NSString, "stringWithFormat:", @"livability://boot-args/set?debug=0x%llx", self->_bootDebugFlags | 0x400);
        uint64_t v13 = [NSURL URLWithString:v12];
        dispatch_time_t v14 = [MEMORY[0x263F01880] defaultWorkspace];
        [v14 openURL:v13 withOptions:0];
      }
      CFRelease(v11);
    }
    unlink((const char *)[v7 fileSystemRepresentation]);
  }
}

- (void)logPanicDeny:(id)a3 reason:(unsigned __int8)a4 demoted:(BOOL)a5
{
  BOOL v5 = a5;
  int v6 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (self->_testing && !v5) {
    self->_test_panicDeny = v6;
  }
  logger = self->_logger;
  if (os_signpost_enabled(logger))
  {
    uint64_t v10 = +[BMBlockMonitoring sanitizedSignature:v8 maxLength:255];

    uint64_t v11 = self->_logger;
    if (os_signpost_enabled(v11))
    {
      int v12 = 138543874;
      uint64_t v13 = v10;
      __int16 v14 = 1026;
      int v15 = v6;
      __int16 v16 = 1026;
      BOOL v17 = v5;
      _os_signpost_emit_with_name_impl(&dword_249337000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "panic_avoided", "signature=%{public,signpost.telemetry:string1,name=signature}@ reason=%{public,signpost.telemetry:number1,name=reason}d demoted=%{public,signpost.telemetry:number2,name=demoted}d enableTelemetry=YES ", (uint8_t *)&v12, 0x18u);
    }
    id v8 = (id)v10;
  }
  else if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
  {
    -[BMBlockMonitoring logPanicDeny:reason:demoted:]();
  }
}

- (void)logFault:(id)a3 reason:(const char *)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL alreadyFaulted = self->_alreadyFaulted;
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT)) {
    -[BMBlockMonitoring logFault:reason:]();
  }
  self->_BOOL alreadyFaulted = 1;
  if (self->_testing)
  {
    self->_test_resultType = 3;
    self->_test_wasFirstFault = !alreadyFaulted;
  }
  logger = self->_logger;
  if (os_signpost_enabled(logger))
  {
    uint64_t v8 = +[BMBlockMonitoring sanitizedSignature:v5 maxLength:255];

    uint64_t v9 = self->_logger;
    if (os_signpost_enabled(v9))
    {
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 1026;
      BOOL v13 = !alreadyFaulted;
      _os_signpost_emit_with_name_impl(&dword_249337000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "fault_triggered", "signature=%{public,signpost.telemetry:string1,name=signature}@ first=%{public,signpost.telemetry:number1,name=first}d enableTelemetry=YES ", (uint8_t *)&v10, 0x12u);
    }
    id v5 = (id)v8;
  }
  else if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
  {
    -[BMBlockMonitoring logPanicDeny:reason:demoted:]();
  }
}

- (void)takeActionIfRelevant:(id)a3 thread_id:(unint64_t)a4 timeout:(unint64_t)a5 options:(int)a6 recovered:(BOOL *)a7
{
  v103[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  if ([(BMBlockMonitoring *)self isProcessBeingDebugged])
  {
    BOOL v13 = self;
    id v14 = v12;
    uint64_t v15 = 8;
LABEL_52:
    [(BMBlockMonitoring *)v13 logPanicDeny:v14 reason:v15 demoted:0];
    goto LABEL_53;
  }
  if (a6 <= 1 && self->_coreDumpsDisabled)
  {
    int v16 = 1;
    atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_presentAlert, (unsigned __int8 *)&v16, 0, memory_order_relaxed, memory_order_relaxed);
    if (v16 == 1)
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
        -[BMBlockMonitoring takeActionIfRelevant:thread_id:timeout:options:recovered:].cold.7();
      }
      BOOL v17 = (void *)MEMORY[0x24C59AE60]();
      id v18 = [(BMBlockMonitoring *)self alertPath];
      int v19 = open((const char *)[v18 fileSystemRepresentation], 770, 384);
      if ((v19 & 0x80000000) == 0)
      {
        int v20 = v19;
        fcntl(v19, 51);
        close(v20);
      }
      [(BMBlockMonitoring *)self showBootArgsAlertWithCheckingFirst:0];
    }
    if (!a6)
    {
      BOOL v13 = self;
      id v14 = v12;
      uint64_t v15 = 4;
      goto LABEL_52;
    }
  }
  pid_t v21 = getpid();
  logger = self->_logger;
  uint64_t v23 = os_log_type_enabled(logger, OS_LOG_TYPE_ERROR);
  if (v23)
  {
    *(_DWORD *)buf = 138413058;
    id v96 = v12;
    __int16 v97 = 1024;
    *(_DWORD *)v98 = v21;
    *(_WORD *)&v98[4] = 2048;
    *(void *)&v98[6] = a4;
    __int16 v99 = 2048;
    unint64_t v100 = a5;
    _os_log_error_impl(&dword_249337000, logger, OS_LOG_TYPE_ERROR, "%@ (%u:%llu) timed out after %llu seconds", buf, 0x26u);
  }
  if (self->_testing && self->_test_panicSleep)
  {
    uint64_t v24 = self->_logger;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      unsigned int test_panicSleep = self->_test_panicSleep;
      *(_DWORD *)buf = 138413058;
      id v96 = v12;
      __int16 v97 = 1024;
      *(_DWORD *)v98 = v21;
      *(_WORD *)&v98[4] = 2048;
      *(void *)&v98[6] = a4;
      __int16 v99 = 1024;
      LODWORD(v100) = test_panicSleep;
      _os_log_impl(&dword_249337000, v24, OS_LOG_TYPE_INFO, "%@ (%u:%llu) sleeping for testing for %us", buf, 0x22u);
    }
    uint64_t v23 = sleep(self->_test_panicSleep);
  }
  if (a6 != 2)
  {
    if (self->_coreDumpsDisabled)
    {
      uint64_t v26 = self->_logger;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_249337000, v26, OS_LOG_TYPE_INFO, "Panic not enabled - demoting the asked panic to a fault", buf, 2u);
      }
      [(BMBlockMonitoring *)self logPanicDeny:v12 reason:4 demoted:1];
      goto LABEL_24;
    }
    uint64_t v35 = (void *)MEMORY[0x24C59AE60](v23);
    id v36 = [(BMBlockMonitoring *)self signaturePath];
    int v37 = open((const char *)[v36 fileSystemRepresentation], 770, 384);
    if (v37 < 0)
    {
      v55 = self->_logger;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        -[BMBlockMonitoring takeActionIfRelevant:thread_id:timeout:options:recovered:]((uint64_t)v36, v55);
      }
      [(BMBlockMonitoring *)self logPanicDeny:v12 reason:7 demoted:0];
    }
    else
    {
      int v38 = v37;
      v39 = malloc_type_calloc(1uLL, 0x1FA0uLL, 0xC6FDF3E3uLL);
      if (v39)
      {
        v40 = v39;
        ssize_t v41 = read(v38, v39, 0x1FA0uLL);
        v86 = v40;
        if (v41 < 1)
        {
          if (!*a7)
          {
            v85 = v35;
            uint64_t v34 = 0;
            goto LABEL_102;
          }
          id v87 = 0;
        }
        else
        {
          int v80 = v38;
          id v42 = v36;
          uint64_t v43 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v40 length:v41];
          uint64_t v44 = [MEMORY[0x263F08AC0] propertyListWithData:v43 options:0 format:0 error:0];
          v83 = (void *)v44;
          v85 = v35;
          if (v44 && (v45 = (void *)v44, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v79 = v45;
            uint64_t v46 = [v79 objectForKeyedSubscript:@"last_panic"];
            id v36 = v42;
            v77 = (void *)v46;
            uint64_t v78 = v43;
            if (v46)
            {
              unsigned __int8 v47 = (void *)v46;
              objc_opt_class();
              int v38 = v80;
              if (objc_opt_isKindOfClass())
              {
                id v48 = v47;
                [v48 timeIntervalSinceNow];
                if (v49 <= (double)-self->_panicPacing)
                {
                  uint64_t v34 = 0;
                  int v51 = 1;
                }
                else
                {
                  BOOL v50 = self->_logger;
                  uint64_t v34 = 1;
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v96 = v12;
                    __int16 v97 = 2112;
                    *(void *)v98 = v48;
                    _os_log_impl(&dword_249337000, v50, OS_LOG_TYPE_INFO, "%@ cannot panic, last panic was at: %@", buf, 0x16u);
                  }
                  int v51 = 0;
                }
              }
              else
              {
                uint64_t v34 = 0;
                int v51 = 1;
              }
            }
            else
            {
              uint64_t v34 = 0;
              int v51 = 1;
              int v38 = v80;
            }
            uint64_t v58 = [v79 objectForKeyedSubscript:@"last_build"];
            v81 = (void *)v58;
            if (v58 && (v59 = (void *)v58, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
              int v60 = [v59 isEqualToString:self->_osVersion];
            }
            else {
              int v60 = 1;
            }
            v61 = [v79 objectForKeyedSubscript:@"triggered_signatures"];
            id v87 = 0;
            if (v51 && v60 && v61)
            {
              v62 = v61;
              objc_opt_class();
              uint64_t v43 = v78;
              if (objc_opt_isKindOfClass())
              {
                uint64_t v76 = v62;
                id v87 = v62;
                int v51 = [v87 containsObject:v12] ^ 1;
                if ((v51 & 1) == 0)
                {
                  BOOL v63 = self->_logger;
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                  {
                    osVersion = self->_osVersion;
                    *(_DWORD *)buf = 138412546;
                    id v96 = v12;
                    __int16 v97 = 2112;
                    *(void *)v98 = osVersion;
                    _os_log_impl(&dword_249337000, v63, OS_LOG_TYPE_INFO, "%@ cannot panic, it has already panic on %@", buf, 0x16u);
                  }
                  uint64_t v34 = 2;
                }
                v61 = v76;
              }
              else
              {
                id v87 = 0;
                v61 = v62;
                int v51 = 1;
              }
            }
            else
            {
              uint64_t v43 = v78;
            }
          }
          else
          {
            id v87 = 0;
            uint64_t v34 = 0;
            int v51 = 1;
            id v36 = v42;
            int v38 = v80;
          }

          if (!*a7)
          {
            if (!v51)
            {
              int v68 = 0;
              uint64_t v35 = v85;
              goto LABEL_117;
            }
            if (v87)
            {
              uint64_t v65 = [v87 arrayByAddingObject:v12];

              uint64_t v66 = v65;
LABEL_103:
              v101[0] = @"last_panic";
              v69 = [MEMORY[0x263EFF910] now];
              v70 = self->_osVersion;
              v102[0] = v69;
              v102[1] = v70;
              v101[1] = @"last_build";
              v101[2] = @"triggered_signatures";
              id v87 = (id)v66;
              v102[2] = v66;
              uint64_t v71 = [NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:3];

              id v88 = 0;
              v82 = (void *)v71;
              objc_super v72 = [MEMORY[0x263F08AC0] dataWithPropertyList:v71 format:200 options:0 error:&v88];
              id v84 = v88;
              if (v72)
              {
                if (ftruncate(v38, 0) < 0
                  || (id v73 = v72,
                      ssize_t v74 = pwrite(v38, (const void *)[v73 bytes], objc_msgSend(v73, "length"), 0),
                      v74 != [v73 length])
                  || fcntl(v38, 51) == -1)
                {
                  int v75 = self->_logger;
                  if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                    -[BMBlockMonitoring takeActionIfRelevant:thread_id:timeout:options:recovered:].cold.6((uint64_t)v12, v75);
                  }
                  int v68 = 0;
                  uint64_t v34 = 5;
                }
                else
                {
                  int v68 = 1;
                }
                uint64_t v35 = v85;
              }
              else
              {
                uint64_t v35 = v85;
                if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
                  -[BMBlockMonitoring takeActionIfRelevant:thread_id:timeout:options:recovered:].cold.5();
                }
                int v68 = 0;
                uint64_t v34 = 5;
              }

              goto LABEL_117;
            }
LABEL_102:
            v103[0] = v12;
            uint64_t v66 = [MEMORY[0x263EFF8C0] arrayWithObjects:v103 count:1];
            goto LABEL_103;
          }
          uint64_t v35 = v85;
        }
        v67 = self->_logger;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v96 = v12;
          __int16 v97 = 1024;
          *(_DWORD *)v98 = v21;
          *(_WORD *)&v98[4] = 2048;
          *(void *)&v98[6] = a4;
          _os_log_impl(&dword_249337000, v67, OS_LOG_TYPE_INFO, "%@ (%u:%llu) recovered - skipping panic", buf, 0x1Cu);
        }
        int v68 = 0;
        uint64_t v34 = 3;
LABEL_117:
        free(v86);
        close(v38);

        if (v68)
        {
          int v27 = 0;
          goto LABEL_26;
        }
LABEL_39:
        BOOL v13 = self;
        id v14 = v12;
        uint64_t v15 = v34;
        goto LABEL_52;
      }
      v57 = self->_logger;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
        -[BMBlockMonitoring takeActionIfRelevant:thread_id:timeout:options:recovered:].cold.4(v57);
      }
      [(BMBlockMonitoring *)self logPanicDeny:v12 reason:6 demoted:0];
      close(v38);
    }

    goto LABEL_53;
  }
LABEL_24:
  if (*a7)
  {
    uint64_t v33 = self->_logger;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v96 = v12;
      __int16 v97 = 1024;
      *(_DWORD *)v98 = v21;
      *(_WORD *)&v98[4] = 2048;
      *(void *)&v98[6] = a4;
      _os_log_impl(&dword_249337000, v33, OS_LOG_TYPE_INFO, "%@ (%u:%llu) recovered - skipping fault", buf, 0x1Cu);
    }
    uint64_t v34 = 3;
    goto LABEL_39;
  }
  int v27 = 1;
LABEL_26:
  id v28 = v12;
  snprintf((char *)buf, 0x400uLL, "BMBlockMonitoring: %s (%u:%llu)", (const char *)[v28 UTF8String], v21, a4);
  if ((v27 & 1) == 0)
  {
    uint64_t v29 = self->_logger;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v89 = 138412802;
      id v90 = v28;
      __int16 v91 = 1024;
      pid_t v92 = v21;
      __int16 v93 = 2048;
      unint64_t v94 = a4;
      _os_log_error_impl(&dword_249337000, v29, OS_LOG_TYPE_ERROR, "%@ (%u:%llu) is going to panic device", v89, 0x1Cu);
    }
  }
  if (self->_testing && !self->_test_allowPanic)
  {
    unsigned __int8 v52 = [NSString stringWithCString:buf encoding:4];
    v53 = (NSString *)[v52 copy];
    test_panicReason = self->_test_panicReason;
    self->_test_panicReason = v53;

    if (!v27)
    {
      if (self->_panicWithData) {
        unsigned __int8 v56 = 1;
      }
      else {
        unsigned __int8 v56 = 2;
      }
      self->_test_resultType = v56;
      goto LABEL_53;
    }
LABEL_55:
    [(BMBlockMonitoring *)self logFault:v28 reason:buf];
    goto LABEL_53;
  }
  if (v27) {
    goto LABEL_55;
  }
  if (self->_panicWithData)
  {
    int v30 = panic_with_data(0, 0, 0, 1u, (const char *)buf);
    int v31 = self->_logger;
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30 < 0)
    {
      if (v32) {
        -[BMBlockMonitoring takeActionIfRelevant:thread_id:timeout:options:recovered:](v31);
      }
    }
    else if (v32)
    {
      -[BMBlockMonitoring takeActionIfRelevant:thread_id:timeout:options:recovered:]();
    }
  }
  MEMORY[0x24C59B160](3072, buf);
LABEL_53:
}

void __69__BMBlockMonitoring_executeBlockWithSignature_timeout_options_block___block_invoke(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 32);
  id v3 = (id)[[NSString alloc] initWithUTF8String:*(void *)(a1 + 40)];
  objc_msgSend(v2, "takeActionIfRelevant:thread_id:timeout:options:recovered:", v3, *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned int *)(a1 + 72), *(void *)(a1 + 64));
}

void __69__BMBlockMonitoring_executeBlockWithSignature_timeout_options_block___block_invoke_2(uint64_t a1)
{
  free(*(void **)(a1 + 32));
  unsigned int v2 = *(void **)(a1 + 40);
  free(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_test_bootArgs, 0);
  objc_storeStrong((id *)&self->_test_panicReason, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_persistencePath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (id)monitorForTestingWithBootArgs:(id)a3
{
  id v3 = a3;
  id v4 = [[BMBlockMonitoring alloc] initForTesting:1 bootArgs:v3];

  return v4;
}

- (void)_test_resetVariables
{
  if (self->_testing)
  {
    self->_test_panicDeny = 0;
    test_panicReason = self->_test_panicReason;
    self->_test_panicReason = 0;

    self->_test_resultType = 0;
    self->_test_alertShown = 0;
  }
}

- (void)_test_setExecutionDuration:(unint64_t)a3
{
  if (self->_testing) {
    self->_executionDuration = a3;
  }
}

- (void)_test_setPanicPacing:(int64_t)a3
{
  if (self->_testing) {
    self->_panicPacing = a3;
  }
}

- (void)_test_setOSVersion:(id)a3
{
  id v5 = a3;
  if (self->_testing)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_osVersion, a3);
    id v5 = v6;
  }
}

- (void)_test_allowPanic:(BOOL)a3
{
  if (self->_testing) {
    self->_test_allowPanic = a3;
  }
}

- (void)_test_setEnabled:(BOOL)a3
{
  if (self->_testing) {
    self->_BOOL enabled = a3;
  }
}

- (void)_test_setPresentAlert:(BOOL)a3
{
  if (self->_testing) {
    atomic_store(a3, (unsigned __int8 *)&self->_presentAlert);
  }
}

- (void)_test_setPanicSleep:(unsigned int)a3
{
  if (self->_testing) {
    self->_unsigned int test_panicSleep = a3;
  }
}

- (void)_test_setDebuggerState:(unsigned __int8)a3
{
  if (self->_testing) {
    self->_test_debuggerState = a3;
  }
}

- (id)_test_getSignaturePath
{
  if (self->_testing)
  {
    unsigned int v2 = [(BMBlockMonitoring *)self signaturePath];
  }
  else
  {
    unsigned int v2 = 0;
  }
  return v2;
}

- (id)_test_getAlertPath
{
  if (self->_testing)
  {
    unsigned int v2 = [(BMBlockMonitoring *)self alertPath];
  }
  else
  {
    unsigned int v2 = 0;
  }
  return v2;
}

- (id)_test_getPanicReason
{
  if (self->_testing) {
    unsigned int v2 = self->_test_panicReason;
  }
  else {
    unsigned int v2 = 0;
  }
  return v2;
}

- (unsigned)_test_getPanicDeny
{
  if (self->_testing) {
    return self->_test_panicDeny;
  }
  else {
    return 0;
  }
}

- (unsigned)_test_getResultType
{
  if (self->_testing) {
    return self->_test_resultType;
  }
  else {
    return 0;
  }
}

- (BOOL)_test_getEnabled
{
  return self->_testing && self->_enabled;
}

- (id)_test_getOSVersion
{
  if (self->_testing) {
    unsigned int v2 = self->_osVersion;
  }
  else {
    unsigned int v2 = 0;
  }
  return v2;
}

- (BOOL)_test_getCoreDumpsDisabled
{
  return self->_testing && self->_coreDumpsDisabled;
}

- (BOOL)_test_getAlertShown
{
  return self->_testing && self->_test_alertShown;
}

- (BOOL)_test_getPresentAlert
{
  if (!self->_testing) {
    return 0;
  }
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_presentAlert);
  return v2 & 1;
}

- (BOOL)_test_getPanicWithData
{
  return self->_testing && self->_panicWithData;
}

- (BOOL)_test_getAlreadyFaulted
{
  return self->_testing && self->_alreadyFaulted;
}

- (BOOL)_test_getWasFirstFault
{
  return self->_testing && self->_test_wasFirstFault;
}

- (unsigned)_test_getDebuggerState
{
  if (self->_testing) {
    return self->_test_debuggerState;
  }
  else {
    return 0;
  }
}

+ (id)computePersistencePath:(int64_t *)a3 error:(id *)a4
{
  *a3 = -1;
  if (container_query_create())
  {
    container_query_set_class();
    xpc_object_t v6 = xpc_string_create("group.com.apple.BlockMonitoring");
    container_query_set_group_identifiers();

    container_query_operation_set_flags();
    container_query_set_persona_unique_string();
    if (!container_query_get_single_result())
    {
      if (a4)
      {
        container_query_get_last_error();
        uint64_t v10 = container_error_copy_unlocalized_description();
        if (!v10)
        {
          uint64_t v9 = 0;
          *a4 = @"Unable to get sandbox result, and unable to get error string";
          goto LABEL_16;
        }
        uint64_t v11 = (void *)v10;
        *a4 = [NSString stringWithCString:v10 encoding:4];
        free(v11);
      }
      uint64_t v9 = 0;
LABEL_16:
      container_query_free();
      goto LABEL_17;
    }
    __int16 v7 = (void *)container_copy_sandbox_token();
    if (v7)
    {
      int64_t v8 = sandbox_extension_consume();
      if (v8 < 0)
      {
        if (a4)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Failed to get sandbox extension: %d (handle: %lld)", *__error(), v8);
          uint64_t v9 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v9 = 0;
        }
        goto LABEL_15;
      }
    }
    else
    {
      int64_t v8 = -1;
    }
    uint64_t v9 = (void *)[[NSString alloc] initWithCString:container_get_path() encoding:4];
    *a3 = v8;
LABEL_15:
    free(v7);
    goto LABEL_16;
  }
  uint64_t v9 = 0;
  if (a4) {
    *a4 = @"Unable to create sandbox container query";
  }
LABEL_17:
  return v9;
}

+ (id)signatureFileName
{
  return @"BMBlockMonitoring.plist";
}

+ (id)alertFileName
{
  return @"BMShowAlert";
}

+ (void)readEntitlement:(__CFString *)a3 withBlock:(id)a4
{
  id v5 = (void (**)(id, CFTypeRef, CFErrorRef))a4;
  xpc_object_t v6 = SecTaskCreateFromSelf(0);
  if (v6)
  {
    __int16 v7 = v6;
    CFErrorRef error = 0;
    CFTypeRef v8 = SecTaskCopyValueForEntitlement(v6, a3, &error);
    v5[2](v5, v8, error);
    if (error) {
      CFRelease(error);
    }
    if (v8) {
      CFRelease(v8);
    }
    CFRelease(v7);
  }
  else
  {
    v5[2](v5, 0, 0);
  }
}

+ (id)sanitizedSignature:(id)a3 maxLength:(int64_t)a4
{
  id v5 = [a3 stringByReplacingOccurrencesOfString:@" " withString:@"_"];
  if (sanitizedSignature_maxLength__onceToken != -1) {
    dispatch_once(&sanitizedSignature_maxLength__onceToken, &__block_literal_global_168);
  }
  xpc_object_t v6 = [v5 componentsSeparatedByCharactersInSet:sanitizedSignature_maxLength__removedCharacters];
  __int16 v7 = [v6 componentsJoinedByString:&stru_26FCFA8B0];

  if (a4 <= 0)
  {
    id v10 = v7;
  }
  else
  {
    unint64_t v8 = [v7 length];
    if (v8 >= a4) {
      int64_t v9 = a4;
    }
    else {
      int64_t v9 = v8;
    }
    id v10 = [v7 substringToIndex:v9];
  }
  uint64_t v11 = v10;

  return v11;
}

void __59__BMBlockMonitoring_Testing__sanitizedSignature_maxLength___block_invoke()
{
  id v2 = [MEMORY[0x263F089C0] alphanumericCharacterSet];
  [v2 addCharactersInString:@"_"];
  uint64_t v0 = [v2 invertedSet];
  v1 = (void *)sanitizedSignature_maxLength__removedCharacters;
  sanitizedSignature_maxLength__removedCharacters = v0;
}

- (BOOL)isProcessBeingDebugged
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  memset(v6, 0, sizeof(v6));
  pid_t v3 = getpid();
  if (proc_pidinfo(v3, 13, 0, v6, 64) && (v7 & 2) != 0) {
    return (self->_test_debuggerState & 0xFD) == 0 || !self->_testing;
  }
  else {
    return self->_testing && self->_test_debuggerState == 2;
  }
}

- (void)initForTesting:bootArgs:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_249337000, v0, v1, "Disabling feature - virtual device", v2, v3, v4, v5, v6);
}

- (void)initForTesting:(uint64_t)a3 bootArgs:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initForTesting:bootArgs:.cold.3()
{
}

- (void)initForTesting:bootArgs:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_249337000, v0, v1, "Disabling feature - container not found: %@", v2, v3, v4, v5, v6);
}

- (void)initForTesting:(void *)a1 bootArgs:.cold.5(void *a1)
{
  id v1 = a1;
  __error();
  OUTLINED_FUNCTION_2(&dword_249337000, v2, v3, "Disabling feature - os version not gathered: %{errno}d", v4, v5, v6, v7, 0);
}

- (void)initForTesting:bootArgs:.cold.6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_249337000, v0, v1, "Disabling feature - bundle identifier not allowed: %@", v2, v3, v4, v5, v6);
}

- (void)initForTesting:(uint64_t)a3 bootArgs:(uint64_t)a4 .cold.7(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initForTesting:bootArgs:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_249337000, v0, v1, "Disabling feature - not allowed to read boot args", v2, v3, v4, v5, v6);
}

- (void)initForTesting:(uint64_t)a3 bootArgs:(uint64_t)a4 .cold.9(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (uint64_t)lookForDeviceReadiness
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[BMBlockMonitoring logPanicDeny:reason:demoted:](v0);
}

- (void)logPanicDeny:reason:demoted:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_249337000, v0, v1, "signposts not enabled", v2, v3, v4, v5, v6);
}

- (void)logFault:reason:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_249337000, v0, OS_LOG_TYPE_FAULT, "%s", v1, 0xCu);
}

- (void)takeActionIfRelevant:(void *)a1 thread_id:timeout:options:recovered:.cold.1(void *a1)
{
  id v1 = a1;
  __error();
  OUTLINED_FUNCTION_2(&dword_249337000, v2, v3, "panic_with_data() failed with: %d", v4, v5, v6, v7, 0);
}

- (void)takeActionIfRelevant:thread_id:timeout:options:recovered:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_249337000, v0, v1, "panic_with_data() unexpectedly returned", v2, v3, v4, v5, v6);
}

- (void)takeActionIfRelevant:(uint64_t)a1 thread_id:(void *)a2 timeout:options:recovered:.cold.3(uint64_t a1, void *a2)
{
  id v2 = a2;
  __error();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_249337000, v3, v4, "Failed opening %@: %{errno}d", v5, v6, v7, v8, v9);
}

- (void)takeActionIfRelevant:(void *)a1 thread_id:timeout:options:recovered:.cold.4(void *a1)
{
  id v1 = a1;
  __error();
  OUTLINED_FUNCTION_2(&dword_249337000, v2, v3, "Failed allocating IO buffer: %{errno}d", v4, v5, v6, v7, 0);
}

- (void)takeActionIfRelevant:thread_id:timeout:options:recovered:.cold.5()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_249337000, v1, OS_LOG_TYPE_ERROR, "%@ cannot panic, serialization failed: %@", v2, 0x16u);
}

- (void)takeActionIfRelevant:(uint64_t)a1 thread_id:(void *)a2 timeout:options:recovered:.cold.6(uint64_t a1, void *a2)
{
  id v2 = a2;
  __error();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_249337000, v3, v4, "%@ cannot panic, persisting or flushing failed: %{errno}d", v5, v6, v7, v8, v9);
}

- (void)takeActionIfRelevant:thread_id:timeout:options:recovered:.cold.7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_249337000, v0, v1, "%@ took too long, prompting user to enable debug boot-args", v2, v3, v4, v5, v6);
}

@end