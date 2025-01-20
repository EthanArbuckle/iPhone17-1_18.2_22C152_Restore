@interface DTDeviceInfoService
+ (void)registerCapabilities:(id)a3;
- (DTDeviceInfoService)initWithChannel:(id)a3;
- (id)_configurationProperties;
- (id)_getIOMFBProperties;
- (id)_lookupInt32Sysctl:(const char *)a3;
- (id)_lookupInt64Sysctl:(const char *)a3;
- (id)_processDictionaryForProcInfo:(id)a3;
- (id)createSignatureFromLibraryUUID:(id)a3 sharedCacheUUID:(id)a4 andPath:(id)a5;
- (id)deepSymbolOwnerSignatureForPid:(id)a3 uuid:(id)a4;
- (id)directoryListingForPath:(id)a3;
- (id)execnameForPid:(id)a3;
- (id)hardwareInformation;
- (id)iconDescriptionFileForAppPath:(id)a3;
- (id)isRunningPid:(id)a3;
- (id)kpepDatabase;
- (id)lookupSysctl:(const char *)a3;
- (id)machKernelName;
- (id)machTimeInfo;
- (id)nameForGID:(id)a3;
- (id)nameForUID:(id)a3;
- (id)networkInformation;
- (id)productVersion;
- (id)runningProcessWithPid:(id)a3;
- (id)runningProcesses;
- (id)symbolicatorSignatureForPid:(id)a3 trackingSelector:(id)a4;
- (id)symbolicatorSignaturesForExpiredPids;
- (id)sysmonCoalitionAttributes;
- (id)sysmonProcessAttributes;
- (id)sysmonSystemAttributes;
- (id)traceCodesFile;
- (id)uniqueID;
- (int)hwCPU64BitCapable;
- (int)hwCPUsubtype;
- (int)hwCPUtype;
- (int)numberOfCpus;
- (int)numberOfPhysicalCpus;
- (void)enableExpiredPidTracking:(id)a3;
- (void)messageReceived:(id)a3;
- (void)unregisterSignatureTrackingForPid:(id)a3;
@end

@implementation DTDeviceInfoService

+ (void)registerCapabilities:(id)a3
{
  id v4 = a3;
  [v4 publishCapability:DTDefaultDeviceInfoServiceIdentifier withVersion:115 forClass:a1];
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  v5 = [MEMORY[0x263F08AB0] processInfo];
  v6 = v5;
  if (v5)
  {
    [v5 operatingSystemVersion];
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }

  uint64_t v7 = 10000 * (v12 & ~(v12 >> 63))
     + 100 * (v13 & ~(v13 >> 63))
     + (v14 & ~(v14 >> 63));
  [v4 publishCapability:@"com.apple.instruments.server.services.deviceinfo.systemversion" withVersion:v7 forClass:a1];
  v8 = (void *)MEMORY[0x230FC2180]([v4 publishCapability:@"com.apple.instruments.server.services.deviceinfo.recordOptions" withVersion:1 forClass:a1]);
  id v9 = MTLCreateSystemDefaultDevice();
  if (v9) {
    [v4 publishCapability:@"com.apple.instruments.server.services.deviceinfo.metal" withVersion:1 forClass:a1];
  }

  [v4 publishCapability:@"com.apple.instruments.server.services.deviceinfo.condition-inducer" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.deviceinfo.energytracing.location" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.target.user-page-size" withVersion:getpagesize() forClass:a1];
  v10.numer = 0;
  size_t v15 = 4;
  sysctlbyname("hw.physicalcpu_max", &v10, &v15, 0, 0);
  [v4 publishCapability:@"com.apple.instruments.target.physical-cpus" withVersion:v10.numer forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.target.logical-cpus" withVersion:DTGetCoreCount() forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.target.ios" withVersion:v7 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.deviceinfo.app-life-cycle" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.deviceinfo.dyld-tracing" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.deviceinfo.scenekit-tracing" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.deviceinfo.gcd-perf" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.deviceinfo.gpu-allocation" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.deviceinfo.counters.advertising" withVersion:1 forClass:a1];
  int v11 = 0;
  size_t v15 = 4;
  if (sysctlbyname("kern.monotonic.supported", &v11, &v15, 0, 0) < 0
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_23093CA04();
  }
  if (v11 >= 1) {
    [v4 publishCapability:@"com.apple.instruments.server.services.deviceinfo.counters" withVersion:1 forClass:a1];
  }
  mach_timebase_info v10 = 0;
  mach_timebase_info(&v10);
  [v4 publishCapability:@"com.apple.instruments.target.mtb.numer" withVersion:v10.numer forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.target.mtb.denom" withVersion:v10.denom forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.deviceinfo.devicesymbolication" withVersion:1 forClass:a1];
}

- (DTDeviceInfoService)initWithChannel:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DTDeviceInfoService;
  v5 = [(DTXService *)&v22 initWithChannel:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    peerTrackingSelectorsByPid = v5->_peerTrackingSelectorsByPid;
    v5->_peerTrackingSelectorsByPid = (NSMutableDictionary *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("symbolicator tracking", 0);
    trackingSymbolicatorQueue = v5->_trackingSymbolicatorQueue;
    v5->_trackingSymbolicatorQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_opt_new();
    sharedCacheSymbolicators = v5->_sharedCacheSymbolicators;
    v5->_sharedCacheSymbolicators = (DTDSCSymbolicatorCache *)v10;

    uint64_t v12 = v5->_trackingSymbolicatorQueue;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = sub_230887FC4;
    v19[3] = &unk_264B8D9F8;
    uint64_t v13 = v5;
    v20 = v13;
    id v21 = v4;
    uint64_t v14 = pid_watcher_connect(0, v12, v19);
    dtsecurityPidWatcher = v13->_dtsecurityPidWatcher;
    v13->_dtsecurityPidWatcher = (OS_xpc_object *)v14;

    os_log_t v16 = os_log_create("com.apple.DTServiceHub", "Device Info Service");
    logHandle = v13->_logHandle;
    v13->_logHandle = (OS_os_log *)v16;
  }
  return v5;
}

- (void)messageReceived:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 errorStatus] == 2)
  {
    trackingSymbolicatorQueue = self->_trackingSymbolicatorQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_230888410;
    block[3] = &unk_264B8D590;
    block[4] = self;
    dispatch_async(trackingSymbolicatorQueue, block);
    if (self->_expiredPidTrackingEnabled)
    {
      uint64_t v6 = +[DTExpiredPidCacheService defaultCache];
      [v6 enableCaching:0];

      self->_expiredPidTrackingEnabled = 0;
    }
  }
  else
  {
    uint64_t v7 = [v4 stringForMessageKey:@"infoRequest"];
    int v8 = [v7 isEqualToString:@"ktraceMachineInformation"];

    if (v8)
    {
      id v22 = 0;
      uint64_t v9 = authorized_ktrace_machine_cpu_topologies(0, (uint64_t)&v22);
      if (v9)
      {
        uint64_t v10 = (void *)MEMORY[0x263F087E8];
        uint64_t v11 = DTDefaultDeviceInfoServiceIdentifier;
        uint64_t v24 = *MEMORY[0x263F08320];
        uint64_t v12 = [NSString stringWithFormat:@"Unable to fetch machine cores information: %d", v9];
        v25[0] = v12;
        uint64_t v13 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
        uint64_t v14 = [v10 errorWithDomain:v11 code:15 userInfo:v13];

        size_t v15 = (void *)[v4 newReplyWithError:v14];
      }
      else
      {
        size_t v15 = (void *)[v4 newReplyWithObject:v22];
      }
      id v21 = [(DTXService *)self channel];
      [v21 sendControlAsync:v15 replyHandler:0];
    }
    else
    {
      os_log_t v16 = [v4 stringForMessageKey:@"infoRequest"];
      int v17 = [v16 isEqualToString:@"configurationInformation"];

      if (v17)
      {
        v18 = [(DTDeviceInfoService *)self _configurationProperties];
        v19 = (void *)[v4 newReplyWithObject:v18];

        v20 = [(DTXService *)self channel];
        [v20 sendControlAsync:v19 replyHandler:0];
      }
    }
  }
}

- (id)machTimeInfo
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  mach_timebase_info info = 0;
  mach_error_t times = mach_get_times();
  if (times)
  {
    mach_error_t v3 = times;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      mach_error_t v16 = v3;
      __int16 v17 = 2080;
      v18 = mach_error_string(v3);
      _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Device Info Service was unable to create get times: %#x - %s", buf, 0x12u);
    }
  }
  mach_timebase_info(&info);
  id v4 = [MEMORY[0x263EFFA18] localTimeZone];
  v5 = [NSNumber numberWithUnsignedLongLong:0];
  v14[0] = v5;
  uint64_t v6 = [NSNumber numberWithUnsignedInt:info.numer];
  v14[1] = v6;
  uint64_t v7 = [NSNumber numberWithUnsignedInt:info.denom];
  v14[2] = v7;
  int v8 = [NSNumber numberWithUnsignedLongLong:0];
  v14[3] = v8;
  uint64_t v9 = [NSNumber numberWithDouble:(double)0 / 1000000000.0 + (double)0];
  v14[4] = v9;
  uint64_t v10 = [v4 name];
  v14[5] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:6];

  return v11;
}

- (id)_processDictionaryForProcInfo:(id)a3
{
  v50[5] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 isZombie])
  {
    id v4 = 0;
    goto LABEL_36;
  }
  uint64_t v5 = [v3 pid];
  if (qword_268707DE0 != -1) {
    dispatch_once(&qword_268707DE0, &unk_26E5154C8);
  }
  uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v7 = v6;
  if (v5 == dword_268707DD8) {
    [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:DTDeviceInfoRunningProcessIsMatchingServicePid];
  }
  if ([v3 shouldAnalyzeWithCorpse]) {
    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:DTDeviceInfoRunningProcessShouldAnalyzeWithCorpse];
  }
  int v8 = (void *)qword_268707DE8;
  if (!qword_268707DE8
    || ([v3 valueForEnvVar:@"XPC_SIMULATOR_LAUNCHD_NAME"],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v8 isEqualToString:v9],
        v9,
        v10))
  {
    uint64_t v11 = (void *)MEMORY[0x263EFF910];
    double v12 = (double)[v3 startTime];
    [v3 startTime];
    v48 = [v11 dateWithTimeIntervalSince1970:(double)v13 / 1000000.0 + v12];
    if ([v3 isCFM])
    {
      uint64_t v14 = [v3 requestedAppName];
      uint64_t v15 = [v14 lastPathComponent];

      if (!v15) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v15 = [v3 name];
      if (!v15)
      {
LABEL_15:
        uint64_t v15 = [NSString stringWithFormat:@"PID %d", v5];
      }
    }
    id v16 = objc_alloc(MEMORY[0x263F01878]);
    __int16 v17 = NSURL;
    id v18 = [v3 realAppName];
    uint64_t v19 = [v18 rangeOfString:@".app" options:4];
    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v21 = v18;
    }
    else
    {
      [v18 substringToIndex:v19 + v20];
      uint64_t v45 = v5;
      id v22 = v46 = v7;
      v23 = [v18 lastPathComponent];
      uint64_t v24 = [v22 lastPathComponent];
      [v24 stringByDeletingPathExtension];
      v26 = uint64_t v25 = v15;
      int v27 = [v23 isEqualToString:v26];

      uint64_t v15 = v25;
      if (v27) {
        v28 = v22;
      }
      else {
        v28 = v18;
      }
      id v21 = v28;

      uint64_t v5 = v45;
      uint64_t v7 = v46;
    }

    v29 = [v17 fileURLWithPath:v21];
    v30 = (void *)[v16 initWithURL:v29 allowPlaceholder:0 error:0];

    if (v30)
    {
      v31 = [v30 bundleIdentifier];
    }
    else
    {
      v31 = 0;
    }
    unsigned int v32 = [v3 isSemiCriticalProcess] ^ 1;
    if (v30) {
      uint64_t v33 = v32;
    }
    else {
      uint64_t v33 = 0;
    }
    v49[0] = DTDeviceInfoRunningProcessPidKey;
    v34 = [NSNumber numberWithInt:v5];
    v50[0] = v34;
    v49[1] = DTDeviceInfoRunningProcessIsApplicationKey;
    v35 = [NSNumber numberWithBool:v33];
    v50[1] = v35;
    v50[2] = v15;
    v47 = (void *)v15;
    v49[2] = DTDeviceInfoRunningProcessNameKey;
    v49[3] = DTDeviceInfoRunningProcessRealAppNameKey;
    v36 = [v3 realAppName];
    v49[4] = DTDeviceInfoRunningProcessStartDateKey;
    v50[3] = v36;
    v50[4] = v48;
    v37 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:5];
    [v7 addEntriesFromDictionary:v37];

    if (v31) {
      [v7 setObject:v31 forKeyedSubscript:DTDeviceInfoRunningProcessBundleIdentifierKey];
    }
    v38 = (void *)MEMORY[0x263F64570];
    v39 = [MEMORY[0x263F64580] identifierWithPid:v5];
    v40 = [v38 handleForIdentifier:v39 error:0];

    v41 = [v40 currentState];
    if ([v41 taskState] == 4)
    {
      v42 = [v41 endowmentNamespaces];
      int v43 = [v42 containsObject:*MEMORY[0x263F3F620]];

      if (v43) {
        [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:DTDeviceInfoRunningProcessForegroundRunningKey];
      }
    }
    id v4 = v7;

    goto LABEL_35;
  }
  id v4 = 0;
LABEL_35:

LABEL_36:
  return v4;
}

- (id)runningProcesses
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = objc_alloc_init(MEMORY[0x263F7C030]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 allProcInfos];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = [(DTDeviceInfoService *)self _processDictionaryForProcInfo:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        if (v10) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [MEMORY[0x263F08AB0] processInfo];
  double v12 = [v11 environment];
  int v13 = [v12 objectForKeyedSubscript:@"XPC_SIMULATOR_LAUNCHD_NAME"];

  if (!v13) {
    [v3 addObject:&unk_26E5342F8];
  }

  return v3;
}

- (id)nameForUID:(id)a3
{
  id v3 = a3;
  uid_t v4 = [v3 intValue];
  if (qword_268707DF0)
  {
    uint64_t v5 = [(id)qword_268707DF0 objectForKey:v3];
    if (v5) {
      goto LABEL_11;
    }
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v7 = (void *)qword_268707DF0;
    qword_268707DF0 = (uint64_t)v6;
  }
  uint64_t v8 = getpwuid(v4);
  if (v8
    && v8->pw_name
    && *v8->pw_name
    && ([NSString stringWithUTF8String:], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v5 = (__CFString *)v9;
    [(id)qword_268707DF0 setObject:v9 forKey:v3];
  }
  else
  {
    uint64_t v5 = @"???";
  }
LABEL_11:
  if ([(__CFString *)v5 isEqualToString:@"root"])
  {
    int v10 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v11 = v10;
    double v12 = @"root";
LABEL_15:
    int v13 = [v10 localizedStringForKey:v12 value:&stru_26E517620 table:0];

    goto LABEL_17;
  }
  if ([(__CFString *)v5 isEqualToString:@"nobody"])
  {
    int v10 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v11 = v10;
    double v12 = @"nobody";
    goto LABEL_15;
  }
  int v13 = v5;
LABEL_17:

  return v13;
}

- (id)nameForGID:(id)a3
{
  id v3 = a3;
  gid_t v4 = [v3 intValue];
  if (!qword_268707DF8)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v7 = (void *)qword_268707DF8;
    qword_268707DF8 = (uint64_t)v6;

LABEL_5:
    uint64_t v8 = getgrgid(v4);
    if (v8
      && v8->gr_name
      && *v8->gr_name
      && ([NSString stringWithUTF8String:], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v5 = (__CFString *)v9;
      [(id)qword_268707DF8 setObject:v9 forKey:v3];
    }
    else
    {
      uint64_t v5 = @"???";
    }
    goto LABEL_11;
  }
  uint64_t v5 = [(id)qword_268707DF8 objectForKey:v3];
  if (!v5) {
    goto LABEL_5;
  }
LABEL_11:

  return v5;
}

- (id)execnameForPid:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = [v3 intValue];
  if (v4 < 1)
  {
    if (!v4)
    {
      CSSymbolicatorCreateWithMachKernel();
      CSSymbolicatorGetAOutSymbolOwner();
      uint64_t Name = CSSymbolOwnerGetName();
      if (Name)
      {
        uint64_t v5 = [NSString stringWithUTF8String:Name];
      }
      else
      {
        uint64_t v5 = 0;
      }
      CSRelease();
      if (v5) {
        goto LABEL_19;
      }
    }
  }
  else if (proc_pidpath(v4, buffer, 0x400u) >= 1)
  {
    uint64_t v5 = [NSString stringWithUTF8String:buffer];
    if (v5) {
      goto LABEL_19;
    }
  }
  uint64_t v7 = +[DTExpiredPidCacheService defaultCache];
  uint64_t v8 = [v7 signatureForExpiredPid:v3];

  if (v8 && (CSSymbolicatorCreateWithSignature(), (CSIsNull() & 1) == 0))
  {
    CSSymbolicatorGetAOutSymbolOwner();
    if (CSIsNull())
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = [NSString stringWithUTF8String:CSSymbolOwnerGetName()];
    }
    CSRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }

LABEL_19:
  return v5;
}

- (id)isRunningPid:(id)a3
{
  uint64_t v3 = [a3 intValue];
  id v4 = objc_alloc_init(MEMORY[0x263F7C030]);
  uint64_t v5 = v4;
  id v6 = NSNumber;
  if (v3)
  {
    uint64_t v7 = [v4 procInfoWithPID:v3];
    uint64_t v8 = [v6 numberWithBool:v7 != 0];
  }
  else
  {
    uint64_t v8 = [NSNumber numberWithBool:1];
  }

  return v8;
}

- (id)runningProcessWithPid:(id)a3
{
  uint64_t v4 = [a3 intValue];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = objc_alloc_init(MEMORY[0x263F7C030]);
    uint64_t v7 = [v6 procInfoWithPID:v5];
    if (v7)
    {
      uint64_t v8 = [(DTDeviceInfoService *)self _processDictionaryForProcInfo:v7];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = &unk_26E5342F8;
  }
  return v8;
}

- (id)machKernelName
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  size_t v15 = 1024;
  int v2 = sysctlbyname("kern.version", v16, &v15, 0, 0);
  uint64_t v3 = @"mach_kernel";
  if (!v2 && v15 <= 0x3FF)
  {
    uint64_t v4 = 0;
    uint64_t v5 = v16;
    do
    {
      while (*v5++ == 47)
        uint64_t v4 = v5;
    }
    while (*(v5 - 1));
    if (v4)
    {
      int v6 = *(unsigned __int8 *)v4;
      uint64_t v7 = (char *)v4;
      if (v6 != 95)
      {
        uint64_t v7 = (char *)v4;
        do
        {
          *uint64_t v7 = __tolower((char)v6);
          int v8 = *++v7;
          LOBYTE(v6) = v8;
        }
        while (v8 != 95);
      }
      *uint64_t v7 = 0;
      uint64_t v9 = v7 + 1;
      do
      {
        int v11 = *(unsigned __int8 *)v9++;
        char v10 = v11;
      }
      while (v11 != 95);
      double v12 = v9;
      do
      {
        *((unsigned char *)v12 - 1) = __tolower(v10);
        int v13 = *(unsigned __int8 *)v12++;
        char v10 = v13;
      }
      while (v13);
    }
    else
    {
      uint64_t v9 = "";
      uint64_t v4 = "";
    }
    snprintf(__str, 0x400uLL, "/mach.%s.%s", v4, v9);
    uint64_t v3 = [NSString stringWithUTF8String:__str];
  }
  return v3;
}

- (id)deepSymbolOwnerSignatureForPid:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    int v8 = [v6 unsignedIntValue];
    if (v8 == -1)
    {
      id v12 = v7;
      CSSymbolicatorCreateWithMachKernelFlagsAndNotification();
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      [v12 getUUIDBytes:&v18];

      CSSymbolicatorGetSymbolOwnerWithCFUUIDBytesAtTime();
      id Signature = 0;
      if ((CSIsNull() & 1) == 0) {
        id Signature = (id)CSSymbolOwnerCreateSignature();
      }
      CSRelease();
    }
    else
    {
      int v9 = v8;
      uint64_t v18 = 0;
      uint64_t v19 = &v18;
      uint64_t v20 = 0x3032000000;
      id v21 = sub_230889670;
      id v22 = sub_230889680;
      id v23 = 0;
      long long v17 = 0uLL;
      [v7 getUUIDBytes:&v17];
      trackingSymbolicatorQueue = self->_trackingSymbolicatorQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_230889688;
      block[3] = &unk_264B8DA20;
      block[4] = self;
      void block[5] = &v18;
      int v15 = v9;
      long long v16 = v17;
      dispatch_sync(trackingSymbolicatorQueue, block);
      id Signature = (id)v19[5];
      _Block_object_dispose(&v18, 8);
    }
  }
  else
  {
    id Signature = 0;
  }

  return Signature;
}

- (id)symbolicatorSignatureForPid:(id)a3 trackingSelector:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_230889670;
  id v23 = sub_230889680;
  id v24 = 0;
  int v8 = [v6 unsignedIntValue];
  if (v8)
  {
    trackingSymbolicatorQueue = self->_trackingSymbolicatorQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_230889910;
    block[3] = &unk_264B8DA48;
    id v14 = v7;
    int v15 = self;
    id v16 = v6;
    long long v17 = &v19;
    int v18 = v8;
    dispatch_sync(trackingSymbolicatorQueue, block);
    char v10 = (void *)v20[5];
    if (!v10)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v26 = v8;
        _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Device Info Service was unable to create symbolicator for PID %d", buf, 8u);
      }
      char v10 = (void *)v20[5];
    }
    id Signature = v10;
  }
  else
  {
    CSSymbolicatorCreateWithMachKernel();
    id Signature = (id)CSSymbolicatorCreateSignature();
    CSRelease();
  }
  _Block_object_dispose(&v19, 8);

  return Signature;
}

- (void)unregisterSignatureTrackingForPid:(id)a3
{
  id v4 = a3;
  trackingSymbolicatorQueue = self->_trackingSymbolicatorQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_230889AD8;
  v7[3] = &unk_264B8DA70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(trackingSymbolicatorQueue, v7);
}

- (void)enableExpiredPidTracking:(id)a3
{
  id v4 = a3;
  int expiredPidTrackingEnabled = self->_expiredPidTrackingEnabled;
  id v7 = v4;
  if (expiredPidTrackingEnabled != [v4 BOOLValue])
  {
    self->_int expiredPidTrackingEnabled = [v7 BOOLValue];
    id v6 = +[DTExpiredPidCacheService defaultCache];
    [v6 enableCaching:self->_expiredPidTrackingEnabled];
  }
}

- (id)symbolicatorSignaturesForExpiredPids
{
  int v2 = +[DTExpiredPidCacheService defaultCache];
  uint64_t v3 = [v2 allExpiredSignatures];

  return v3;
}

- (id)directoryListingForPath:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  uint64_t v5 = [v3 defaultManager];
  uint64_t v8 = 0;
  id v6 = [v5 contentsOfDirectoryAtPath:v4 error:&v8];

  return v6;
}

- (id)iconDescriptionFileForAppPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [NSURL fileURLWithPath:v4];
  if (!NSClassFromString(&cfstr_Isicon.isa))
  {
    uint64_t v21 = 0;
    goto LABEL_13;
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x263F4B538]) initWithURL:v5];
  id v7 = [[[objc_alloc(MEMORY[0x263F4B550]) alloc] initWithSize:32.0 scale:32.0] autorelease];
  uint64_t v8 = [v6 prepareImageForDescriptor:v7];
  int v9 = v8;
  if (v8)
  {
    char v10 = (CGImage *)[v8 CGImage];
    unint64_t Width = CGImageGetWidth(v10);
    unint64_t Height = CGImageGetHeight(v10);
    CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
    if (DeviceRGB)
    {
      id v14 = DeviceRGB;
      uint64_t v25 = v7;
      int v26 = v6;
      int v15 = malloc_type_malloc(32 * Width * Height, 0x172A7819uLL);
      id v16 = CGBitmapContextCreate(v15, Width, Height, 8uLL, 32 * Width, v14, 0x2002u);
      if (v16)
      {
        v28.size.width = (double)Width;
        v28.size.height = (double)Height;
        v28.origin.x = 0.0;
        v28.origin.y = 0.0;
        c = v16;
        CGContextDrawImage(v16, v28, v10);
        long long v17 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v15 length:32 * Width * Height freeWhenDone:1];
        int v18 = NSDictionary;
        uint64_t v19 = [NSNumber numberWithInt:Width];
        uint64_t v20 = [NSNumber numberWithInt:Height];
        uint64_t v21 = [v18 dictionaryWithObjectsAndKeys:v17, @"imageData", v19, @"width", v20, @"height", nil];

        CGColorSpaceRelease(v14);
        CGContextRelease(c);
      }
      else
      {
        CGColorSpaceRelease(v14);
        uint64_t v21 = 0;
      }
      id v7 = v25;
      id v6 = v26;
      goto LABEL_12;
    }
  }
  else
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR)) {
      sub_23093CA90((uint64_t)v4, logHandle);
    }
  }
  uint64_t v21 = 0;
LABEL_12:

LABEL_13:
  return v21;
}

- (id)createSignatureFromLibraryUUID:(id)a3 sharedCacheUUID:(id)a4 andPath:(id)a5
{
  v26[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_230889670;
  id v24 = sub_230889680;
  id v25 = 0;
  v26[0] = 0;
  v26[1] = 0;
  [v8 getUUIDBytes:v26];
  uint64_t v11 = [(DTDSCSymbolicatorCache *)self->_sharedCacheSymbolicators symbolicatorForSharedCacheUUID:v9];
  uint64_t v13 = v12;
  if ((CSIsNull() & 1) == 0)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_23088A100;
    v17[3] = &unk_264B8DA98;
    id v18 = v10;
    uint64_t v19 = &v20;
    MEMORY[0x230FC0AA0](v11, v13, v26, 0x8000000000000000, v17);
  }
  id v14 = (void *)v21[5];
  if (!v14)
  {
    [v10 UTF8String];
    CSSymbolicatorForeachSymbolicatorWithPath();
    id v14 = (void *)v21[5];
  }
  id v15 = v14;
  _Block_object_dispose(&v20, 8);

  return v15;
}

- (int)numberOfPhysicalCpus
{
  int v4 = 0;
  size_t v3 = 4;
  sysctlbyname("hw.physicalcpu_max", &v4, &v3, 0, 0);
  return v4;
}

- (int)numberOfCpus
{
  int result = DTGetCoreCount();
  if (result <= 1) {
    return 1;
  }
  return result;
}

- (int)hwCPUsubtype
{
  uint64_t v3 = -1;
  if (DTIntegerSysctlByName("hw.cpusubtype", &v3)) {
    return -1;
  }
  else {
    return v3;
  }
}

- (int)hwCPUtype
{
  uint64_t v3 = -1;
  if (DTIntegerSysctlByName("hw.cputype", &v3)) {
    return -1;
  }
  else {
    return v3;
  }
}

- (int)hwCPU64BitCapable
{
  return DTCoreIs64BitCapable();
}

- (id)hardwareInformation
{
  v13[5] = *MEMORY[0x263EF8340];
  v12[0] = @"numberOfPhysicalCpus";
  uint64_t v3 = [NSNumber numberWithInt:-[DTDeviceInfoService numberOfPhysicalCpus](self, "numberOfPhysicalCpus")];
  v13[0] = v3;
  v12[1] = @"numberOfCpus";
  int v4 = [NSNumber numberWithInt:-[DTDeviceInfoService numberOfCpus](self, "numberOfCpus")];
  v13[1] = v4;
  v12[2] = @"hwCPUtype";
  uint64_t v5 = [NSNumber numberWithInt:-[DTDeviceInfoService hwCPUtype](self, "hwCPUtype")];
  v13[2] = v5;
  v12[3] = @"hwCPUsubtype";
  id v6 = [NSNumber numberWithInt:-[DTDeviceInfoService hwCPUsubtype](self, "hwCPUsubtype")];
  v13[3] = v6;
  v12[4] = @"hwCPU64BitCapable";
  id v7 = [NSNumber numberWithInt:-[DTDeviceInfoService hwCPU64BitCapable](self, "hwCPU64BitCapable")];
  v13[4] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:5];

  id v9 = (void *)[v8 mutableCopy];
  id v10 = (void *)[v9 copy];

  return v10;
}

- (id)lookupSysctl:(const char *)a3
{
  size_t size = 0;
  sysctlbyname(a3, 0, &size, 0, 0);
  int v4 = malloc_type_malloc(size, 0x46864988uLL);
  sysctlbyname(a3, v4, &size, 0, 0);
  uint64_t v5 = [NSString stringWithCString:v4 encoding:1];
  free(v4);
  return v5;
}

- (id)_lookupInt32Sysctl:(const char *)a3
{
  unsigned int v7 = 0;
  size_t v6 = 4;
  int v3 = sysctlbyname(a3, &v7, &v6, 0, 0);
  int v4 = 0;
  if (!v3)
  {
    int v4 = [NSNumber numberWithInt:v7];
  }
  return v4;
}

- (id)_lookupInt64Sysctl:(const char *)a3
{
  size_t v6 = 8;
  uint64_t v7 = 0;
  int v3 = sysctlbyname(a3, &v7, &v6, 0, 0);
  int v4 = 0;
  if (!v3)
  {
    int v4 = [NSNumber numberWithUnsignedLongLong:v7];
  }
  return v4;
}

- (id)_getIOMFBProperties
{
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceMatching("IOMobileFramebuffer");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  if (MatchingService)
  {
    io_registry_entry_t v5 = MatchingService;
    size_t v6 = objc_opt_new();
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v5, @"IOMFB_KTRACE_API_VERSION", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = CFProperty;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v11 = CFProperty;
        goto LABEL_10;
      }
      id v9 = [CFProperty stringValue];
    }
    uint64_t v11 = v9;

    if (!v11) {
      goto LABEL_11;
    }
    [v6 setObject:v11 forKeyedSubscript:DTDeviceInfoConfigIOMFBTracepointVersionKey];
LABEL_10:

LABEL_11:
    uint64_t v12 = (void *)IORegistryEntryCreateCFProperty(v5, @"NormalModeEnable", v7, 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!v12) {
        goto LABEL_15;
      }
      [v6 setObject:v12 forKeyedSubscript:DTDeviceInfoConfigIOMFBAPTEnabledKey];
    }

LABEL_15:
    uint64_t v13 = (void *)IORegistryEntryCreateCFProperty(v5, @"M3TimingParameters", v7, 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!v13)
      {
LABEL_25:
        IOObjectRelease(v5);
        if ([v6 count]) {
          id v10 = (void *)[v6 copy];
        }
        else {
          id v10 = 0;
        }

        goto LABEL_29;
      }
      id v14 = [v13 objectForKeyedSubscript:@"subframe-duration-nclks"];
      if (v14)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v6 setObject:v14 forKeyedSubscript:DTDeviceInfoConfigIOMFBAPTQuantaTimeKey];
        }
      }
      id v15 = [v13 objectForKeyedSubscript:@"display-lead-time-nclks"];
      if (v15)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v6 setObject:v15 forKeyedSubscript:DTDeviceInfoConfigIOMFBAPTQuantaLeadTimeKey];
        }
      }
    }
    goto LABEL_25;
  }
  id v10 = 0;
LABEL_29:
  return v10;
}

- (id)uniqueID
{
  mach_port_t v2 = (__CFString *)qword_268707E00;
  if (!qword_268707E00)
  {
    memset(v8, 0, sizeof(v8));
    long long v7 = xmmword_2309496C0;
    if (gethostuuid(v8, (const timespec *)&v7) == -1)
    {
      io_registry_entry_t v5 = @"MISSING";
      goto LABEL_7;
    }
    CFUUIDRef v3 = CFUUIDCreateFromUUIDBytes(0, *(CFUUIDBytes *)v8);
    int v4 = (__CFString *)CFUUIDCreateString(0, v3);
    objc_storeStrong((id *)&qword_268707E00, v4);
    CFRelease(v3);
    mach_port_t v2 = (__CFString *)qword_268707E00;
  }
  if (!v2) {
    mach_port_t v2 = @"MISSING";
  }
  io_registry_entry_t v5 = v2;
LABEL_7:
  return v5;
}

- (id)productVersion
{
  mach_port_t v2 = [NSDictionary dictionaryWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
  CFUUIDRef v3 = [v2 objectForKey:@"ProductVersion"];

  return v3;
}

- (id)_configurationProperties
{
  CFUUIDRef v3 = objc_opt_new();
  int v4 = [(DTDeviceInfoService *)self _lookupInt32Sysctl:"vm.pagesize"];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:DTDeviceInfoConfigVMPageSizeKey];
  }
  io_registry_entry_t v5 = [(DTDeviceInfoService *)self _lookupInt32Sysctl:"hw.pagesize"];
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:DTDeviceInfoConfigHWPageSizeKey];
  }
  size_t v6 = [(DTDeviceInfoService *)self _lookupInt64Sysctl:"hw.memsize"];
  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:DTDeviceInfoConfigMemSizeSizeKey];
  }
  long long v7 = [(DTDeviceInfoService *)self _getIOMFBProperties];
  if (v7) {
    [v3 addEntriesFromDictionary:v7];
  }

  return v3;
}

- (id)traceCodesFile
{
  id v5 = 0;
  mach_port_t v2 = [NSString stringWithContentsOfFile:@"/usr/share/misc/trace.codes" encoding:4 error:&v5];
  id v3 = v5;
  if (v3)
  {

    NSLog(&cfstr_ErrorReadingCo.isa, v3);
    mach_port_t v2 = &stru_26E517620;
  }

  return v2;
}

- (id)kpepDatabase
{
  p_kpepDB = &self->_kpepDB;
  if (self->_kpepDB) {
    goto LABEL_7;
  }
  uint64_t v3 = kpep_db_create();
  if (v3)
  {
    uint64_t v4 = v3;
    if (v3 != 7 || DTCoreIs64BitCapable()) {
      NSLog(&cfstr_UnableToCreate.isa, v4);
    }
  }
  id v5 = *p_kpepDB;
  if (*p_kpepDB)
  {
LABEL_7:
    uint64_t v6 = kpep_db_serialize();
    if (v6)
    {
      NSLog(&cfstr_UnableToSerial.isa, v6);
      id v5 = 0;
    }
    else
    {
      id v5 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:0 length:0];
    }
  }
  return v5;
}

- (id)sysmonProcessAttributes
{
  return +[DTSysmonTapSupportedAttributes localProcessAttributes];
}

- (id)sysmonSystemAttributes
{
  return +[DTSysmonTapSupportedAttributes localSystemAttributes];
}

- (id)sysmonCoalitionAttributes
{
  return +[DTSysmonTapSupportedAttributes localCoalitionAttributes];
}

- (id)networkInformation
{
  return (id)MEMORY[0x270F9A6D0](DTNetworkInterfaceInfo, sel_interfaceNameMappings);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_sharedCacheSymbolicators, 0);
  objc_storeStrong((id *)&self->_dtsecurityPidWatcher, 0);
  objc_storeStrong((id *)&self->_trackingSymbolicatorQueue, 0);
  objc_storeStrong((id *)&self->_peerTrackingSelectorsByPid, 0);
}

@end