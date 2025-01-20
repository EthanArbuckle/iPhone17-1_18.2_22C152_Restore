@interface CPMSAgent
+ (BOOL)isCPMSSupported;
+ (BOOL)isCPMSSupportedForAnyClient;
+ (BOOL)isCPMSSupportedForClient:(int64_t)a3;
+ (id)log;
+ (id)sharedCPMSAgent;
+ (unsigned)CPMSClientIdToPPMClientId:(int64_t)a3;
- (BOOL)acknowledgePowerBudget:(id)a3 forClientId:(int64_t)a4 error:(id *)a5;
- (BOOL)isClientIdValid:(int64_t)a3;
- (BOOL)registerClientWithDescription:(id)a3 error:(id *)a4;
- (BOOL)registerForNotifications;
- (BOOL)sanityCheckClientDescription:(id)a3;
- (CPMSAgent)init;
- (NSMutableSet)clientSet;
- (char)CPMSPowerTimeScaleToPPMIndex:(id)a3;
- (id)PPMIndexToCPMSPowerTimeScale:(char)a3;
- (id)copyDefaultPowerProfileForClient:(int64_t)a3 error:(id *)a4;
- (id)copyPowerBudgetForRequest:(id)a3 forClient:(int64_t)a4 error:(id *)a5;
- (id)copyPowerBudgetForRequest:(id)a3 forClient:(int64_t)a4 withPowerProfile:(id)a5 error:(id *)a6;
- (id)requestPowerBudget:(id)a3 forClient:(int64_t)a4 error:(id *)a5;
- (unsigned)connect;
- (void)dealloc;
- (void)init;
- (void)registerForNotifications;
- (void)setClientSet:(id)a3;
- (void)setConnect:(unsigned int)a3;
@end

@implementation CPMSAgent

- (char)CPMSPowerTimeScaleToPPMIndex:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"cpms_ts_i"])
  {
    char v4 = 0;
  }
  else if ([v3 isEqualToString:@"cpms_ts_100"])
  {
    char v4 = 1;
  }
  else if ([v3 isEqualToString:@"cpms_ts_1000"])
  {
    char v4 = 2;
  }
  else
  {
    char v4 = -1;
  }

  return v4;
}

- (BOOL)acknowledgePowerBudget:(id)a3 forClientId:(int64_t)a4 error:(id *)a5
{
  kern_return_t v25;
  int v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  void *context;
  int64_t v36;
  id v38;
  void *v39;
  void *v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;
  unsigned char v45[12];
  __int16 v46;
  int v47;
  unsigned char v48[128];
  long long inputStruct;
  unint64_t v50;
  uint8_t buf[32];
  long long v52;
  long long v53;
  long long v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E4F143B8];
  v38 = a3;
  context = (void *)MEMORY[0x1E0194B40]();
  v36 = a4;
  v40 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"SELF.clientId == %ul", a4);
  v7 = self;
  objc_sync_enter(v7);
  v8 = [(NSMutableSet *)v7->_clientSet filteredSetUsingPredicate:v40];
  v39 = [v8 anyObject];

  if (suppressAssert)
  {
    if (!v39)
    {
      v9 = +[CPMSAgent log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CPMSAgent acknowledgePowerBudget:forClientId:error:].cold.4();
      }

LABEL_30:
      v28 = 8;
      goto LABEL_33;
    }
  }
  else
  {
    id v10 = v39;
    if (!v10)
    {
      *(void *)v45 = 0;
      v53 = 0u;
      v54 = 0u;
      v52 = 0u;
      memset(buf, 0, sizeof(buf));
      os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      LODWORD(inputStruct) = 134217984;
      *(void *)((char *)&inputStruct + 4) = v36;
      _os_log_send_and_compose_impl();
      v33 = _os_crash_msg();
      -[CPMSAgent acknowledgePowerBudget:forClientId:error:](v33);
    }
  }
  inputStruct = 0uLL;
  v50 = 0xFFFFFFFF00000000;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  id v11 = v38;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v12)
  {
    int v13 = 0;
    uint64_t v14 = *(void *)v42;
    unsigned int v15 = -1;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v42 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v18 = [v11 objectForKeyedSubscript:v17];
        int v19 = [(CPMSAgent *)v7 CPMSPowerTimeScaleToPPMIndex:v17];
        char v20 = v19;
        if (v18) {
          BOOL v21 = v19 == -1;
        }
        else {
          BOOL v21 = 1;
        }
        if (v21)
        {
          if (v18)
          {
            if ([v17 hasPrefix:@"cpms_ts_thermal"])
            {
              unsigned int v22 = [v18 unsignedIntValue];
              if (v15 == -1 || v22 < v15)
              {
                HIDWORD(v50) = v22;
                unsigned int v15 = v22;
              }
            }
          }
        }
        else
        {
          int v23 = [v18 unsignedIntValue];
          v24 = (char *)&inputStruct + 5 * v13;
          *(_DWORD *)(v24 + 3) = v23;
          v24[2] = v20;
          BYTE1(inputStruct) = ++v13;
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v12);
  }

  LOBYTE(inputStruct) = [(id)objc_opt_class() CPMSClientIdToPPMClientId:v36];
  v25 = IOConnectCallStructMethod(v7->_connect, 0x1Fu, &inputStruct, 0x18uLL, 0, 0);
  v26 = v25;
  if (suppressAssert)
  {
    if (v25)
    {
      v27 = +[CPMSAgent log];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[CPMSAgent acknowledgePowerBudget:forClientId:error:](v36, v26, v27);
      }

      goto LABEL_30;
    }
  }
  else if (v25)
  {
    v53 = 0u;
    v54 = 0u;
    v52 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    *(_DWORD *)v45 = 134218240;
    *(void *)&v45[4] = v36;
    v46 = 1024;
    v47 = v26;
    _os_log_send_and_compose_impl();
    v34 = _os_crash_msg();
    -[CPMSAgent acknowledgePowerBudget:forClientId:error:](v34);
  }
  v28 = 0;
LABEL_33:

  objc_sync_exit(v7);
  if (!v28)
  {
    v29 = +[CPMSAgent log];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = [v38 description];
      v31 = [v30 UTF8String];
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = v36;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v31;
      _os_log_impl(&dword_1DB92B000, v29, OS_LOG_TYPE_DEFAULT, "<Notice> Ack from CPMS clientId %lu. Budgets: %{public}s", buf, 0x16u);
    }
    v28 = 1;
  }

  if (a5 && v28 == 8)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CPMSErrorDomain" code:1 userInfo:0];
  }

  return v28 != 8;
}

+ (unsigned)CPMSClientIdToPPMClientId:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xC) {
    return -1;
  }
  else {
    return byte_1DB933338[a3 - 1];
  }
}

- (NSMutableSet)clientSet
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

+ (id)log
{
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, &__block_literal_global);
  }
  v2 = (void *)log_log;
  return v2;
}

- (unsigned)connect
{
  return self->_connect;
}

void __16__CPMSAgent_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.cpms", "framework");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;

  if (!log_log)
  {
    v2 = +[CPMSAgent log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __16__CPMSAgent_log__block_invoke_cold_1();
    }
  }
}

+ (BOOL)isCPMSSupported
{
  return [a1 isCPMSSupportedForClient:0];
}

+ (BOOL)isCPMSSupportedForAnyClient
{
  if ([a1 isCPMSSupportedForClient:0]) {
    return 1;
  }
  unint64_t v4 = 0;
  do
  {
    unint64_t v5 = v4;
    if (v4 == 13) {
      break;
    }
    ++v4;
  }
  while (![a1 isCPMSSupportedForClient:v5 + 1]);
  return v5 < 0xD;
}

+ (BOOL)isCPMSSupportedForClient:(int64_t)a3
{
  if (isCPMSSupportedForClient__onceToken != -1) {
    dispatch_once(&isCPMSSupportedForClient__onceToken, &__block_literal_global_41);
  }
  if (isCPMSSupportedForClient__isCPMSSupportedClientBitfield == -1)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    unsigned int v4 = +[CPMSAgent CPMSClientIdToPPMClientId:a3];
    if (v4 > 0x13) {
      LOBYTE(v5) = 0;
    }
    else {
      return (isCPMSSupportedForClient__isCPMSSupportedClientBitfield >> v4) & 1;
    }
  }
  return v5;
}

void __38__CPMSAgent_isCPMSSupportedForClient___block_invoke()
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int valuePtr = 0;
  CFDictionaryRef v0 = IOServiceMatching("ApplePPM");
  if (!v0)
  {
    v6 = +[CPMSAgent log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __38__CPMSAgent_isCPMSSupportedForClient___block_invoke_cold_1();
    }
    goto LABEL_11;
  }
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E4F2EEF0], v0);
  if (!MatchingService)
  {
    v6 = +[CPMSAgent log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __38__CPMSAgent_isCPMSSupportedForClient___block_invoke_cold_2();
    }
LABEL_11:

    io_object_t v2 = 0;
    goto LABEL_25;
  }
  io_object_t v2 = MatchingService;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(MatchingService, @"CPMSSupported", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (CFProperty)
  {
    CFNumberRef v4 = CFProperty;
    CFTypeID v5 = CFGetTypeID(CFProperty);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
      if (valuePtr) {
        isCPMSSupportedForClient__isCPMSSupportedClientBitfield = -1;
      }
    }
    else
    {
      CFTypeID v7 = CFGetTypeID(v4);
      if (v7 == CFArrayGetTypeID())
      {
        if (CFArrayGetCount(v4) >= 1)
        {
          CFIndex v8 = 0;
          do
          {
            CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v4, v8);
            if (ValueAtIndex)
            {
              CFNumberRef v10 = ValueAtIndex;
              CFTypeID v11 = CFGetTypeID(ValueAtIndex);
              if (v11 == CFNumberGetTypeID())
              {
                *(_DWORD *)buf = 0;
                CFNumberGetValue(v10, kCFNumberIntType, buf);
                if (*(_DWORD *)buf <= 0x13u) {
                  isCPMSSupportedForClient__isCPMSSupportedClientBitfield |= 1 << buf[0];
                }
              }
            }
            ++v8;
          }
          while (CFArrayGetCount(v4) > v8);
        }
      }
      else
      {
        uint64_t v12 = +[CPMSAgent log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          __38__CPMSAgent_isCPMSSupportedForClient___block_invoke_cold_3();
        }
      }
    }
    CFRelease(v4);
  }
LABEL_25:
  int v13 = +[CPMSAgent log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v16 = isCPMSSupportedForClient__isCPMSSupportedClientBitfield;
    _os_log_impl(&dword_1DB92B000, v13, OS_LOG_TYPE_INFO, "<Info> CPMSSupported bitfield 0x%08x", buf, 8u);
  }

  if (v2) {
    IOObjectRelease(v2);
  }
}

+ (id)sharedCPMSAgent
{
  if (sharedCPMSAgent_onceToken != -1) {
    dispatch_once(&sharedCPMSAgent_onceToken, &__block_literal_global_47);
  }
  io_object_t v2 = (void *)sharedCPMSAgent_agent;
  return v2;
}

void __28__CPMSAgent_sharedCPMSAgent__block_invoke()
{
  if (+[CPMSAgent isCPMSSupportedForAnyClient])
  {
    sharedCPMSAgent_agent = objc_alloc_init(CPMSAgent);
    MEMORY[0x1F41817F8]();
  }
  else
  {
    CFDictionaryRef v0 = +[CPMSAgent log];
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __28__CPMSAgent_sharedCPMSAgent__block_invoke_cold_1();
    }
  }
}

- (CPMSAgent)init
{
  v15.receiver = self;
  v15.super_class = (Class)CPMSAgent;
  io_object_t v2 = [(CPMSAgent *)&v15 init];
  if (!v2) {
    goto LABEL_19;
  }
  id v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  clientSet = v2->_clientSet;
  v2->_clientSet = v3;

  if (!v2->_clientSet)
  {
    CFTypeID v5 = +[CPMSAgent log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CPMSAgent init].cold.4();
    }

    if (!v2->_clientSet) {
      goto LABEL_19;
    }
  }
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"cpms_ts_i", @"cpms_ts_100", @"cpms_ts_1000", 0);
  timeScalesSet = v2->_timeScalesSet;
  v2->_timeScalesSet = (NSSet *)v6;

  if (!v2->_timeScalesSet)
  {
    CFIndex v8 = +[CPMSAgent log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CPMSAgent init]();
    }

    if (!v2->_timeScalesSet) {
      goto LABEL_19;
    }
  }
  CFDictionaryRef v9 = IOServiceMatching("ApplePPM");
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E4F2EEF0], v9);
  v2->_ppmService = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x1E4F14960], 0, &v2->_connect))
  {
    CFTypeID v11 = +[CPMSAgent log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CPMSAgent init]();
    }

LABEL_19:
    uint64_t v12 = 0;
    goto LABEL_20;
  }
  if (![(CPMSAgent *)v2 registerForNotifications])
  {
    int v13 = +[CPMSAgent log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CPMSAgent init]();
    }

    goto LABEL_19;
  }
  uint64_t v12 = v2;
LABEL_20:

  return v12;
}

- (void)dealloc
{
  io_connect_t connect = self->_connect;
  if (connect) {
    IOServiceClose(connect);
  }
  io_object_t ppmService = self->_ppmService;
  if (ppmService) {
    IOObjectRelease(ppmService);
  }
  notificationPort = self->_notificationPort;
  if (notificationPort) {
    IONotificationPortDestroy(notificationPort);
  }
  v6.receiver = self;
  v6.super_class = (Class)CPMSAgent;
  [(CPMSAgent *)&v6 dealloc];
}

- (BOOL)registerClientWithDescription:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  CFTypeID v5 = +[CPMSAgent log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v38 = [v27 clientId];
    _os_log_impl(&dword_1DB92B000, v5, OS_LOG_TYPE_INFO, "<Info> Registration call from CPMS clientId %lu\n", buf, 0xCu);
  }

  context = (void *)MEMORY[0x1E0194B40]();
  if (suppressAssert)
  {
    if (!v27)
    {
      objc_super v6 = +[CPMSAgent log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[CPMSAgent registerClientWithDescription:error:].cold.4();
      }
LABEL_27:

      BOOL v20 = 0;
LABEL_28:
      goto LABEL_29;
    }
  }
  else
  {
    id v7 = v27;
    if (!v7) {
      -[CPMSAgent registerClientWithDescription:error:]();
    }
  }
  if (!-[CPMSAgent sanityCheckClientDescription:](self, "sanityCheckClientDescription:"))
  {
    objc_super v6 = +[CPMSAgent log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CPMSAgent registerClientWithDescription:error:]();
    }
    goto LABEL_27;
  }
  CFIndex v8 = self;
  objc_sync_enter(v8);
  [(NSMutableSet *)v8->_clientSet addObject:v27];
  objc_sync_exit(v8);
  v26 = (mach_port_t *)v8;

  int v33 = 0;
  memset(inputStruct, 0, sizeof(inputStruct));
  LOBYTE(inputStruct[0]) = objc_msgSend((id)objc_opt_class(), "CPMSClientIdToPPMClientId:", objc_msgSend(v27, "clientId"));
  int v34 = [v27 isContinuous];
  int v35 = [v27 powerBudgetUpdateMinimumPeriod];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [v27 powerLevels];
  unsigned __int8 v9 = 0;
  uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v10)
  {
    uint64_t v25 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        int v13 = [v27 powerLevels];
        uint64_t v14 = [v13 objectForKey:v12];

        *((unsigned char *)inputStruct + 68 * v9 + 8) = [(mach_port_t *)v26 CPMSPowerTimeScaleToPPMIndex:v12];
        unsigned __int8 v15 = [v14 count];
        *((unsigned char *)inputStruct + 68 * v9 + 9) = v15;
        unint64_t v16 = v15;
        if (v15)
        {
          unint64_t v17 = 0;
          do
          {
            v18 = [v14 objectAtIndex:v17];
            *(_DWORD *)(((unint64_t)inputStruct | 0xC) + 68 * v9 + 4 * v17) = [v18 intValue];

            ++v17;
          }
          while (v17 < v16);
        }

        ++v9;
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v10);
  }

  BYTE4(inputStruct[0]) = v9;
  if (!IOConnectCallStructMethod(v26[10], 0x1Au, inputStruct, 0xDCuLL, 0, 0))
  {
    BOOL v20 = 1;
    goto LABEL_28;
  }
  int v19 = +[CPMSAgent log];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[CPMSAgent registerClientWithDescription:error:]();
  }

  if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"CPMSErrorDomain" code:2 userInfo:0];
    BOOL v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_29:

  return v20;
}

- (id)requestPowerBudget:(id)a3 forClient:(int64_t)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  size_t outputStructCnt = 17;
  outputStruct[0] = 0;
  inputStruct[0] = 0;
  inputStruct[1] = 0;
  char v43 = 0;
  outputStruct[1] = 0;
  char v41 = 0;
  BOOL v9 = [(CPMSAgent *)self isClientIdValid:a4];
  if (suppressAssert)
  {
    if (!v9)
    {
      uint64_t v10 = +[CPMSAgent log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CPMSAgent requestPowerBudget:forClient:error:].cold.5();
      }
      goto LABEL_26;
    }
    if (!v8)
    {
      uint64_t v10 = +[CPMSAgent log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CPMSAgent requestPowerBudget:forClient:error:].cold.4();
      }
LABEL_26:

      BOOL v21 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    if (!v9) {
      -[CPMSAgent requestPowerBudget:forClient:error:](&v38, buf);
    }
    id v11 = v8;
    if (!v11) {
      -[CPMSAgent requestPowerBudget:forClient:error:]();
    }
  }
  v32 = a5;
  id v33 = v8;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    unsigned __int8 v15 = 0;
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        int v19 = [v12 objectForKey:v18];
        BOOL v20 = (char *)inputStruct + 5 * v15 + 2;
        *BOOL v20 = [(CPMSAgent *)self CPMSPowerTimeScaleToPPMIndex:v18];
        *(_DWORD *)(v20 + 1) = [v19 intValue];
        ++v15;
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v14);
  }
  else
  {
    unsigned __int8 v15 = 0;
  }

  BYTE1(inputStruct[0]) = v15;
  LOBYTE(inputStruct[0]) = [(id)objc_opt_class() CPMSClientIdToPPMClientId:a4];
  if (IOConnectCallStructMethod(self->_connect, 0x1Bu, inputStruct, 0x11uLL, outputStruct, &outputStructCnt))
  {
    if (v32)
    {
      id *v32 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CPMSErrorDomain" code:2 userInfo:0];
    }
    uint64_t v10 = +[CPMSAgent log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CPMSAgent requestPowerBudget:forClient:error:]();
    }
    id v8 = v33;
    goto LABEL_26;
  }
  BOOL v21 = [MEMORY[0x1E4F1CA60] dictionary];
  if (BYTE1(outputStruct[0]))
  {
    unint64_t v22 = 0;
    int v23 = (unsigned int *)((char *)outputStruct + 3);
    do
    {
      v24 = [NSNumber numberWithInt:*v23];
      uint64_t v25 = [(CPMSAgent *)self PPMIndexToCPMSPowerTimeScale:*((char *)v23 - 1)];
      [v21 setObject:v24 forKey:v25];

      ++v22;
      int v23 = (unsigned int *)((char *)v23 + 5);
    }
    while (v22 < BYTE1(outputStruct[0]));
  }
  id v8 = v33;
LABEL_31:
  v26 = +[CPMSAgent log];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    id v27 = [v8 description];
    uint64_t v28 = [v27 UTF8String];
    id v29 = [v21 description];
    uint64_t v30 = [v29 UTF8String];
    *(_DWORD *)buf = 134218498;
    int64_t v46 = a4;
    __int16 v47 = 2082;
    uint64_t v48 = v28;
    __int16 v49 = 2082;
    uint64_t v50 = v30;
    _os_log_impl(&dword_1DB92B000, v26, OS_LOG_TYPE_INFO, "<Info> CPMS clientId %lu requested budget %{public}s granted budget %{public}s", buf, 0x20u);
  }
  return v21;
}

- (id)copyPowerBudgetForRequest:(id)a3 forClient:(int64_t)a4 withPowerProfile:(id)a5 error:(id *)a6
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  size_t outputStructCnt = 17;
  outputStruct[0] = 0;
  long long inputStruct = 0uLL;
  char v68 = 0;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v66 = 0;
  outputStruct[1] = 0;
  char v62 = 0;
  uint64_t v12 = MEMORY[0x1E0194B40]();
  BOOL v13 = [(CPMSAgent *)self isClientIdValid:a4];
  context = (void *)v12;
  if (suppressAssert)
  {
    if (!v13)
    {
      uint64_t v14 = +[CPMSAgent log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[CPMSAgent requestPowerBudget:forClient:error:].cold.5();
      }
      goto LABEL_19;
    }
    if (!v10)
    {
      uint64_t v14 = +[CPMSAgent log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[CPMSAgent requestPowerBudget:forClient:error:].cold.4();
      }
LABEL_19:
      char v25 = 0;
LABEL_28:

      id v38 = 0;
      goto LABEL_35;
    }
  }
  else
  {
    if (!v13) {
      -[CPMSAgent requestPowerBudget:forClient:error:](&v59, buf);
    }
    id v15 = v10;
    if (!v15) {
      -[CPMSAgent requestPowerBudget:forClient:error:]();
    }
  }
  uint64_t v51 = v11;
  int64_t v52 = a4;
  v53 = a6;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v50 = v10;
  id v16 = v10;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v55 objects:v69 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    unsigned __int8 v19 = 0;
    uint64_t v20 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v56 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void *)(*((void *)&v55 + 1) + 8 * i);
        int v23 = [v16 objectForKey:v22];
        v24 = (char *)&inputStruct + 5 * v19 + 2;
        char *v24 = [(CPMSAgent *)self CPMSPowerTimeScaleToPPMIndex:v22];
        *(_DWORD *)(v24 + 1) = [v23 intValue];
        ++v19;
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v55 objects:v69 count:16];
    }
    while (v18);
  }
  else
  {
    unsigned __int8 v19 = 0;
  }

  BYTE1(inputStruct) = v19;
  a4 = v52;
  LOBYTE(inputStruct) = [(id)objc_opt_class() CPMSClientIdToPPMClientId:v52];
  id v11 = v51;
  if (v51)
  {
    BYTE4(v64) = [(id)objc_opt_class() CPMSClientIdToPPMClientId:v52];
    v26 = [v51 objectForKey:@"cpms_Pb"];
    DWORD2(v64) = [v26 unsignedIntValue];

    id v27 = [v51 objectForKey:@"cpms_Pp"];
    HIDWORD(v64) = [v27 unsignedIntValue];

    uint64_t v28 = [v51 objectForKey:@"cpms_Ps"];
    LODWORD(v65) = [v28 unsignedIntValue];

    id v29 = [v51 objectForKey:@"cpms_Pu"];
    DWORD1(v65) = [v29 unsignedIntValue];

    uint64_t v30 = [v51 objectForKey:@"cpms_Tb"];
    DWORD2(v65) = [v30 unsignedIntValue];

    long long v31 = [v51 objectForKey:@"cpms_Tp"];
    HIDWORD(v65) = [v31 unsignedIntValue];

    v32 = [v51 objectForKey:@"cpms_Ts"];
    LODWORD(v66) = [v32 unsignedIntValue];

    id v33 = [v51 objectForKey:@"cpms_Tu"];
    HIDWORD(v66) = [v33 unsignedIntValue];

    long long v63 = inputStruct;
    LOBYTE(v64) = v68;
    mach_port_t connect = self->_connect;
    p_long long inputStruct = &v63;
    uint32_t v36 = 38;
    size_t v37 = 56;
  }
  else
  {
    mach_port_t connect = self->_connect;
    p_long long inputStruct = &inputStruct;
    uint32_t v36 = 27;
    size_t v37 = 17;
  }
  if (IOConnectCallStructMethod(connect, v36, p_inputStruct, v37, outputStruct, &outputStructCnt))
  {
    uint64_t v14 = +[CPMSAgent log];
    id v10 = v50;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CPMSAgent requestPowerBudget:forClient:error:]();
    }
    char v25 = 1;
    goto LABEL_28;
  }
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (BYTE1(outputStruct[0]))
  {
    unint64_t v39 = 0;
    v40 = (unsigned int *)((char *)outputStruct + 3);
    do
    {
      char v41 = [NSNumber numberWithInt:*v40];
      v42 = [(CPMSAgent *)self PPMIndexToCPMSPowerTimeScale:*((char *)v40 - 1)];
      [v38 setObject:v41 forKey:v42];

      ++v39;
      v40 = (unsigned int *)((char *)v40 + 5);
    }
    while (v39 < BYTE1(outputStruct[0]));
    char v25 = 0;
    a4 = v52;
    a6 = v53;
  }
  else
  {
    char v25 = 0;
  }
  id v10 = v50;
LABEL_35:
  char v43 = +[CPMSAgent log];
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    id v44 = [v10 description];
    uint64_t v45 = [v44 UTF8String];
    id v46 = [v38 description];
    uint64_t v47 = [v46 UTF8String];
    *(_DWORD *)buf = 134218498;
    int64_t v71 = a4;
    __int16 v72 = 2082;
    uint64_t v73 = v45;
    __int16 v74 = 2082;
    uint64_t v75 = v47;
    _os_log_impl(&dword_1DB92B000, v43, OS_LOG_TYPE_INFO, "<Info> CPMS clientId %lu requested budget %{public}s granted budget %{public}s", buf, 0x20u);
  }
  char v48 = v25 ^ 1;
  if (!a6) {
    char v48 = 1;
  }
  if ((v48 & 1) == 0)
  {
    *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CPMSErrorDomain" code:2 userInfo:0];
  }

  return v38;
}

- (id)copyPowerBudgetForRequest:(id)a3 forClient:(int64_t)a4 error:(id *)a5
{
  return [(CPMSAgent *)self copyPowerBudgetForRequest:a3 forClient:a4 withPowerProfile:0 error:a5];
}

- (id)copyDefaultPowerProfileForClient:(int64_t)a3 error:(id *)a4
{
  unsigned int v23 = 0;
  long long outputStruct = 0u;
  long long v22 = 0u;
  size_t v20 = 36;
  uint64_t input = [(id)objc_opt_class() CPMSClientIdToPPMClientId:a3];
  objc_super v6 = (void *)MEMORY[0x1E0194B40]();
  if (IOConnectCallMethod(self->_connect, 0x27u, &input, 1u, 0, 0, 0, 0, &outputStruct, &v20))
  {
    id v7 = +[CPMSAgent log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CPMSAgent copyDefaultPowerProfileForClient:error:]();
    }

    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"CPMSErrorDomain" code:2 userInfo:0];
      id v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v10 = [NSNumber numberWithUnsignedInt:DWORD1(outputStruct)];
    id v11 = [NSNumber numberWithUnsignedInt:DWORD2(outputStruct)];
    uint64_t v12 = [NSNumber numberWithUnsignedInt:HIDWORD(outputStruct)];
    BOOL v13 = [NSNumber numberWithUnsignedInt:v22];
    uint64_t v14 = [NSNumber numberWithUnsignedInt:DWORD1(v22)];
    id v15 = [NSNumber numberWithUnsignedInt:DWORD2(v22)];
    id v16 = [NSNumber numberWithUnsignedInt:HIDWORD(v22)];
    uint64_t v17 = [NSNumber numberWithUnsignedInt:v23];
    id v8 = objc_msgSend(v9, "initWithObjectsAndKeys:", v10, @"cpms_Pb", v11, @"cpms_Pp", v12, @"cpms_Ps", v13, @"cpms_Pu", v14, @"cpms_Tb", v15, @"cpms_Tp", v16, @"cpms_Ts", v17, @"cpms_Tu", 0);
  }
  return v8;
}

- (BOOL)registerForNotifications
{
  *(void *)existing = 0;
  mach_port_t v3 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v4 = IOServiceMatching("ApplePPM");
  if (IOServiceGetMatchingServices(v3, v4, &existing[1]))
  {
    CFTypeID v5 = +[CPMSAgent log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CPMSAgent registerForNotifications]();
    }
    io_object_t v6 = 0;
  }
  else
  {
    uint64_t v12 = (OS_dispatch_queue *)dispatch_queue_create("ppmNotificationQueue", 0);
    notificationQueue = self->_notificationQueue;
    self->_notificationQueue = v12;

    uint64_t v14 = IONotificationPortCreate(v3);
    self->_notificationPort = v14;
    IONotificationPortSetDispatchQueue(v14, (dispatch_queue_t)self->_notificationQueue);
    io_service_t v15 = IOIteratorNext(existing[1]);
    if (!v15) {
      return 1;
    }
    io_object_t v6 = v15;
    if (!IOServiceAddInterestNotification(self->_notificationPort, v15, "IOGeneralInterest", (IOServiceInterestCallback)PPMCallbackHandler, self, existing))
    {
      IOObjectRelease(v6);
      BOOL v8 = 1;
      io_object_t v10 = existing[1];
LABEL_10:
      IOObjectRelease(v10);
      return v8;
    }
    CFTypeID v5 = +[CPMSAgent log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CPMSAgent registerForNotifications]();
    }
  }

  notificationPort = self->_notificationPort;
  if (notificationPort) {
    IONotificationPortDestroy(notificationPort);
  }
  if (v6) {
    IOObjectRelease(v6);
  }
  BOOL v8 = 0;
  BOOL v9 = 0;
  io_object_t v10 = existing[1];
  if (existing[1]) {
    goto LABEL_10;
  }
  return v9;
}

- (BOOL)isClientIdValid:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 0xD;
}

- (BOOL)sanityCheckClientDescription:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = -[CPMSAgent isClientIdValid:](self, "isClientIdValid:", [v4 clientId]);
  if (suppressAssert)
  {
    if (!v5)
    {
      uint64_t v12 = +[CPMSAgent log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CPMSAgent sanityCheckClientDescription:]9(v4, v12);
      }
      goto LABEL_65;
    }
    io_object_t v6 = [v4 powerLevels];

    if (!v6)
    {
      id v7 = +[CPMSAgent log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CPMSAgent sanityCheckClientDescription:]8();
      }
    }
    BOOL v8 = [v4 powerLevels];

    if (!v8)
    {
LABEL_66:
      LOBYTE(v32) = 0;
      goto LABEL_67;
    }
  }
  else
  {
    if (!v5) {
      -[CPMSAgent sanityCheckClientDescription:]7(v46, buf);
    }
    BOOL v9 = [v4 powerLevels];
    if (!v9) {
      -[CPMSAgent sanityCheckClientDescription:]();
    }
  }
  io_object_t v10 = [v4 powerLevels];
  uint64_t v11 = [v10 count];

  if (suppressAssert)
  {
    if (v11 <= 0)
    {
      uint64_t v12 = +[CPMSAgent log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CPMSAgent sanityCheckClientDescription:]6();
      }
      goto LABEL_65;
    }
  }
  else if (v11 <= 0)
  {
    -[CPMSAgent sanityCheckClientDescription:]();
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v12 = [v4 powerLevels];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (!v13) {
    goto LABEL_54;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v42;
  unint64_t v39 = (char *)v46 + 4;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v42 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8 * i);
      if (!-[NSSet containsObject:](self->_timeScalesSet, "containsObject:", v17, v39))
      {
        if (!suppressAssert) {
          -[CPMSAgent sanityCheckClientDescription:]4(&v40, buf);
        }
        unsigned __int8 v19 = +[CPMSAgent log];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[CPMSAgent sanityCheckClientDescription:]5();
        }
LABEL_64:

LABEL_65:
        goto LABEL_66;
      }
      uint64_t v18 = [v4 powerLevels];
      unsigned __int8 v19 = [v18 objectForKey:v17];

      LODWORD(v18) = [v4 isContinuous];
      int v20 = suppressAssert;
      unint64_t v21 = [v19 count];
      if (v18)
      {
        if (v20)
        {
          if (v21 != 2)
          {
            long long v22 = +[CPMSAgent log];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              -[CPMSAgent sanityCheckClientDescription:]1((uint64_t)v46, v19);
            }
          }
          if ([v19 count] != 2) {
            goto LABEL_64;
          }
        }
        else if (v21 != 2)
        {
          -[CPMSAgent sanityCheckClientDescription:]0(&v40, buf);
        }
      }
      else if (v20)
      {
        if (v21 <= 1)
        {
          unsigned int v23 = +[CPMSAgent log];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[CPMSAgent sanityCheckClientDescription:]3((uint64_t)v45, v19);
          }
        }
        if ((unint64_t)[v19 count] < 2) {
          goto LABEL_64;
        }
      }
      else if (v21 <= 1)
      {
        -[CPMSAgent sanityCheckClientDescription:]2(&v40, buf);
      }
      int v24 = suppressAssert;
      unint64_t v25 = [v19 count];
      if (v24)
      {
        if (v25 >= 0x11)
        {
          v26 = +[CPMSAgent log];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            uint64_t v27 = [v19 count];
            *(_DWORD *)buf = 134218240;
            uint64_t v49 = v27;
            __int16 v50 = 1024;
            int v51 = 16;
            _os_log_error_impl(&dword_1DB92B000, v26, OS_LOG_TYPE_ERROR, "<Error> Power level count %lu more than max count %d\n", buf, 0x12u);
          }
        }
        if ((unint64_t)[v19 count] > 0x10) {
          goto LABEL_64;
        }
      }
      else if (v25 >= 0x11)
      {
        -[CPMSAgent sanityCheckClientDescription:].cold.9(&v40, buf);
      }
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v41 objects:v47 count:16];
  }
  while (v14);
LABEL_54:

  int v28 = suppressAssert;
  id v29 = [v4 notificationCallback];
  uint64_t v30 = v29;
  if (!v28)
  {
    if (!v29) {
      -[CPMSAgent sanityCheckClientDescription:]();
    }

LABEL_70:
    int v34 = suppressAssert;
    long long v35 = [v4 getCurrentPower];
    uint32_t v36 = v35;
    if (v34)
    {

      if (!v36)
      {
        size_t v37 = +[CPMSAgent log];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          -[CPMSAgent sanityCheckClientDescription:].cold.7();
        }
      }
      v32 = [v4 getCurrentPower];

      if (!v32) {
        goto LABEL_67;
      }
    }
    else
    {
      if (!v35) {
        -[CPMSAgent sanityCheckClientDescription:].cold.4();
      }
    }
    if ([v4 powerBudgetUpdateMinimumPeriod] > 0x2710)
    {
      if (suppressAssert) {
        goto LABEL_84;
      }
    }
    else
    {
      unsigned int v38 = [v4 powerBudgetUpdateMinimumPeriod];
      if (suppressAssert)
      {
        if (v38 > 9) {
          goto LABEL_87;
        }
LABEL_84:
        uint64_t v12 = +[CPMSAgent log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[CPMSAgent sanityCheckClientDescription:].cold.6(v4, v12);
        }
        goto LABEL_65;
      }
      if (v38 > 9)
      {
LABEL_87:
        LOBYTE(v32) = 1;
        goto LABEL_67;
      }
    }
    -[CPMSAgent sanityCheckClientDescription:].cold.5(&v40, buf);
  }

  if (!v30)
  {
    long long v31 = +[CPMSAgent log];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[CPMSAgent sanityCheckClientDescription:].cold.8();
    }
  }
  v32 = [v4 notificationCallback];

  if (v32) {
    goto LABEL_70;
  }
LABEL_67:

  return (char)v32;
}

- (id)PPMIndexToCPMSPowerTimeScale:(char)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return (id)*((void *)&off_1E6C20198 + a3);
  }
}

- (void)setClientSet:(id)a3
{
}

- (void)setConnect:(unsigned int)a3
{
  self->_mach_port_t connect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSet, 0);
  objc_storeStrong((id *)&self->_timeScalesSet, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

void __16__CPMSAgent_log__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DB92B000, v0, v1, "<Error> Could not create log object\n", v2, v3, v4, v5, v6);
}

void __38__CPMSAgent_isCPMSSupportedForClient___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DB92B000, v0, v1, "<Error> Could not create matching dictionary\n", v2, v3, v4, v5, v6);
}

void __38__CPMSAgent_isCPMSSupportedForClient___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DB92B000, v0, v1, "<Error> Could not find PPM service\n", v2, v3, v4, v5, v6);
}

void __38__CPMSAgent_isCPMSSupportedForClient___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DB92B000, v0, v1, "<Error> CPMSSupported property has unknown type", v2, v3, v4, v5, v6);
}

void __28__CPMSAgent_sharedCPMSAgent__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DB92B000, v0, v1, "<Error> CPMS not supported on current platform", v2, v3, v4, v5, v6);
}

- (void)init
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DB92B000, v0, v1, "<Error> Client Set alloc failed\n", v2, v3, v4, v5, v6);
}

- (void)registerClientWithDescription:error:.cold.1()
{
}

- (void)registerClientWithDescription:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1DB92B000, v0, v1, "<Error> Register client call to PPM failed with error %d", v2, v3, v4, v5, v6);
}

- (void)registerClientWithDescription:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DB92B000, v0, v1, "<Error> Sanity check failed", v2, v3, v4, v5, v6);
}

- (void)registerClientWithDescription:error:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DB92B000, v0, v1, "<Error> Nil description object\n", v2, v3, v4, v5, v6);
}

- (void)requestPowerBudget:forClient:error:.cold.1()
{
}

- (void)requestPowerBudget:forClient:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1DB92B000, v0, v1, "<Error> Request budget call to PPM failed with error %d", v2, v3, v4, v5, v6);
}

- (void)requestPowerBudget:(void *)a1 forClient:(_OWORD *)a2 error:.cold.3(void *a1, _OWORD *a2)
{
}

- (void)requestPowerBudget:forClient:error:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DB92B000, v0, v1, "<Error> Nil requestBudget argument\n", v2, v3, v4, v5, v6);
}

- (void)requestPowerBudget:forClient:error:.cold.5()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(&dword_1DB92B000, v0, v1, "<Error> Unsupported client handle %lu\n", v2, v3, v4, v5, v6);
}

- (void)copyDefaultPowerProfileForClient:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1DB92B000, v0, v1, "<Error> copyDefaultPowerProfileForClient call to PPM failed with error %d", v2, v3, v4, v5, v6);
}

- (void)acknowledgePowerBudget:(uint64_t)a1 forClientId:(int)a2 error:(os_log_t)log .cold.3(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_1DB92B000, log, OS_LOG_TYPE_ERROR, "<Error> Ack failure for CPMS clientId %lu, userclient return 0x%08x\n", (uint8_t *)&v3, 0x12u);
}

- (void)acknowledgePowerBudget:forClientId:error:.cold.4()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(&dword_1DB92B000, v0, v1, "<Error> Ack called on unregistered CPMS clientId %lu\n", v2, v3, v4, v5, v6);
}

- (void)registerForNotifications
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1DB92B000, v0, v1, "<Error> IOServiceGetMatchingServices returned 0x%08x\n", v2, v3, v4, v5, v6);
}

- (void)sanityCheckClientDescription:.cold.1()
{
}

- (void)sanityCheckClientDescription:.cold.2()
{
}

- (void)sanityCheckClientDescription:.cold.3()
{
}

- (void)sanityCheckClientDescription:.cold.4()
{
}

- (void)sanityCheckClientDescription:(void *)a1 .cold.5(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_0(a1, a2);
  OUTLINED_FUNCTION_6();
  [v2 powerBudgetUpdateMinimumPeriod];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7();
  __break(1u);
}

- (void)sanityCheckClientDescription:(void *)a1 .cold.6(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 powerBudgetUpdateMinimumPeriod];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1DB92B000, a2, OS_LOG_TYPE_ERROR, "<Error> Budget update period %d ms is out of bounds\n", v3, 8u);
}

- (void)sanityCheckClientDescription:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DB92B000, v0, v1, "<Error> Nil getCurrentPower callback\n", v2, v3, v4, v5, v6);
}

- (void)sanityCheckClientDescription:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DB92B000, v0, v1, "<Error> Nil notification callback\n", v2, v3, v4, v5, v6);
}

- (void)sanityCheckClientDescription:(void *)a1 .cold.9(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_0(a1, a2);
  OUTLINED_FUNCTION_6();
  [v2 count];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7();
  __break(1u);
}

- (void)sanityCheckClientDescription:(void *)a1 .cold.10(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_0(a1, a2);
  OUTLINED_FUNCTION_6();
  [v2 count];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7();
  __break(1u);
}

- (void)sanityCheckClientDescription:(uint64_t)a1 .cold.11(uint64_t a1, void *a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_13(a1, a2);
  *uint64_t v3 = 134217984;
  uint64_t *v2 = v4;
  OUTLINED_FUNCTION_14(&dword_1DB92B000, v5, v6, "<Error> Incorrect value count %lu for continous client\n");
}

- (void)sanityCheckClientDescription:(void *)a1 .cold.12(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_0(a1, a2);
  OUTLINED_FUNCTION_6();
  [v2 count];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7();
  __break(1u);
}

- (void)sanityCheckClientDescription:(uint64_t)a1 .cold.13(uint64_t a1, void *a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_13(a1, a2);
  *uint64_t v3 = 134217984;
  uint64_t *v2 = v4;
  OUTLINED_FUNCTION_14(&dword_1DB92B000, v5, v6, "<Error> Incorrect value count %lu for discrete client\n");
}

- (void)sanityCheckClientDescription:(void *)a1 .cold.14(void *a1, _OWORD *a2)
{
}

- (void)sanityCheckClientDescription:.cold.15()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(&dword_1DB92B000, v0, v1, "<Error> Incorrect timescale %@\n", v2, v3, v4, v5, v6);
}

- (void)sanityCheckClientDescription:.cold.16()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DB92B000, v0, v1, "<Error> Empty powerlevels dictionary\n", v2, v3, v4, v5, v6);
}

- (void)sanityCheckClientDescription:(void *)a1 .cold.17(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_0(a1, a2);
  OUTLINED_FUNCTION_6();
  [v2 clientId];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7();
  __break(1u);
}

- (void)sanityCheckClientDescription:.cold.18()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DB92B000, v0, v1, "<Error> Nil powerLevels\n", v2, v3, v4, v5, v6);
}

- (void)sanityCheckClientDescription:(void *)a1 .cold.19(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 clientId];
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_1DB92B000, a2, OS_LOG_TYPE_ERROR, "<Error> Unsupported client handle %lu\n", v3, 0xCu);
}

@end