@interface ACCTransportIOAccessoryAuthCP
- (ACCTransportIOAccessoryAuthCP)initWithDelegate:(id)a3 andIOService:(unsigned int)a4 connectionType:(int)a5;
- (ACCTransportIOAccessoryAuthCPProtocol)delegate;
- (BOOL)_authInternalModuleWithCert:(const __CFData *)a3 withError:(int *)a4;
- (BOOL)_authWithAuthIC:(unsigned int)a3 withCert:(const __CFData *)a4 withError:(int *)a5;
- (BOOL)_copyCertificateAttribute:(__CFData *)a3 forAttributeKey:(__CFNumber *)a4 withAttributeValue:(const __CFData *)a5;
- (BOOL)_handleAuthCertSerialNumber:(__CFString *)a3 certData:(const __CFData *)a4;
- (BOOL)_handleAuthCertificate:(__CFData *)a3 serialNumber:(__CFString *)a4 authError:(int *)a5;
- (BOOL)_handleAuthDeviceInfo:(int)a3 versionMajor:(unsigned __int8)a4 versionMinor:(unsigned __int8)a5;
- (BOOL)_handleAuthSignature:(__CFData *)a3 certData:(__CFData *)a4 nonceData:(__CFData *)a5;
- (BOOL)_representsHardwareComponent;
- (BOOL)_validateCertCapsForCertificate:(__CFData *)a3 authError:(int *)a4;
- (BOOL)authTimedOut;
- (BOOL)bIsShuttingDown;
- (BOOL)certIsCached;
- (BOOL)notificationsAvailable;
- (BOOL)representsInductiveTransport;
- (BOOL)requiresAuthenticationProcess;
- (IONotificationPort)batteryNotifyPortRef;
- (IONotificationPort)transportNotifyPortRef;
- (NSData)pAuthCertificate;
- (NSDictionary)certInfo;
- (NSString)connectionUUID;
- (NSString)endpointUUID;
- (OS_dispatch_queue)authWorkQueue;
- (OS_dispatch_semaphore)pairedSema;
- (OS_dispatch_source)authTimerSource;
- (_AuthCertCapsInt_t)authCertCaps;
- (__CFDictionary)_copyOrCreateStatsSubDict:(__CFDictionary *)a3 forSerialNumber:(__CFString *)a4;
- (const)pAuthCertCache;
- (int)_fdrCertCheck;
- (int)accConnectionType;
- (int)authErrorDescription;
- (int)authStatus;
- (int)authType;
- (int)certType;
- (int)fdrValidationStatus;
- (int)representsInternalModule;
- (unint64_t)authTimerStartTimestamp;
- (unsigned)authFlags;
- (unsigned)authTryCurrent;
- (unsigned)authTryMaximum;
- (unsigned)authVersionMajor;
- (unsigned)battery_iter;
- (unsigned)deviceID;
- (unsigned)forcedReAuthCount;
- (unsigned)ioServiceUpstream;
- (unsigned)softwareErrorRetry;
- (void)_fdrCertCheck;
- (void)_finishAuthentication:(BOOL)a3 authCert:(__CFData *)a4;
- (void)_handleAuthTimerTimeout;
- (void)_incrementAuthStat:(const __CFString *)a3 dict:(__CFDictionary *)a4;
- (void)_logToAnalytics;
- (void)_publishAuth:(BOOL)a3 fdrStatus:(int)a4 trusted:(BOOL)a5 publishToUI:(BOOL)a6 ioconnect:(unsigned int)a7;
- (void)_publishAuthStats:(BOOL)a3 fdrStatus:(int)a4;
- (void)_resetAfterAuthCompletion;
- (void)_validateAuthCPFlagsForCertificate;
- (void)_validateDownstreamCertSerialNumber;
- (void)dealloc;
- (void)doPostAuthentication;
- (void)setAccConnectionType:(int)a3;
- (void)setAuthCertCaps:(_AuthCertCapsInt_t *)a3;
- (void)setAuthErrorDescription:(int)a3;
- (void)setAuthFlags:(unsigned int)a3;
- (void)setAuthTimerSource:(id)a3;
- (void)setAuthTimerStartTimestamp:(unint64_t)a3;
- (void)setAuthTryCurrent:(unsigned __int8)a3;
- (void)setAuthTryMaximum:(unsigned __int8)a3;
- (void)setAuthVersionMajor:(unsigned __int8)a3;
- (void)setAuthWorkQueue:(id)a3;
- (void)setBIsShuttingDown:(BOOL)a3;
- (void)setBatteryNotifyPortRef:(IONotificationPort *)a3;
- (void)setBattery_iter:(unsigned int)a3;
- (void)setCertInfo:(id)a3;
- (void)setCertIsCached:(BOOL)a3;
- (void)setCertType:(int)a3;
- (void)setConnectionUUID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceID:(unsigned __int16)a3;
- (void)setEndpointUUID:(id)a3;
- (void)setFdrValidationStatus:(int)a3;
- (void)setForcedReAuthCount:(unsigned int)a3;
- (void)setIoServiceUpstream:(unsigned int)a3;
- (void)setNotificationsAvailable:(BOOL)a3;
- (void)setPAuthCertCache:(const void *)a3;
- (void)setPairedSema:(id)a3;
- (void)setRepresentsInductiveTransport:(BOOL)a3;
- (void)setRepresentsInternalModule:(int)a3;
- (void)setSoftwareErrorRetry:(unsigned __int8)a3;
- (void)setTransportNotifyPortRef:(IONotificationPort *)a3;
- (void)startAuthenticationProcess;
- (void)startShutdownProcess;
@end

@implementation ACCTransportIOAccessoryAuthCP

- (ACCTransportIOAccessoryAuthCP)initWithDelegate:(id)a3 andIOService:(unsigned int)a4 connectionType:(int)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v8 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__ACCTransportIOAccessoryAuthCP_initWithDelegate_andIOService_connectionType___block_invoke;
  block[3] = &unk_26466B8C8;
  v9 = self;
  v90 = v9;
  if (initWithDelegate_andIOService_connectionType__onceToken != -1) {
    dispatch_once(&initWithDelegate_andIOService_connectionType__onceToken, block);
  }
  v88.receiver = v9;
  v88.super_class = (Class)ACCTransportIOAccessoryAuthCP;
  v10 = [(ACCTransportIOAccessoryBase *)&v88 initWithIOAccessoryClass:3 ioService:v6];
  if (!v10)
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v11 = (ACCTransportIOAccessoryAuthCP *)*(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v11 = (ACCTransportIOAccessoryAuthCP *)MEMORY[0x263EF8438];
      id v26 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(&v11->super.super, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryAuthCP initWithDelegate:andIOService:connectionType:]();
    }
    goto LABEL_74;
  }
  v11 = v10;
  v10->_authStatus = 0;
  v10->_authTimedOut = 0;
  pAuthCertificate = v10->_pAuthCertificate;
  v10->_pAuthCertificate = 0;

  v11->_authType = 0;
  objc_storeWeak((id *)&v11->_delegate, v8);
  authWorkQueue = v11->_authWorkQueue;
  v11->_authWorkQueue = 0;

  authTimerSource = v11->_authTimerSource;
  v11->_authTimerSource = 0;

  v11->_forcedReAuthCount = 0;
  v11->_authErrorDescription = 30;
  v11->_softwareErrorRetry = 0;
  certInfo = v11->_certInfo;
  v11->_certInfo = 0;

  v11->_fdrValidationStatus = 0;
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  pairedSema = v11->_pairedSema;
  v11->_pairedSema = (OS_dispatch_semaphore *)v16;

  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v6, @"flags", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v19 = CFProperty;
    p_authFlags = &v11->_authFlags;
    int Value = CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &v11->_authFlags);
    if (gLogObjects) {
      BOOL v22 = gNumLogObjects <= 6;
    }
    else {
      BOOL v22 = 1;
    }
    int v23 = !v22;
    if (!Value)
    {
      if (v23)
      {
        v27 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        v27 = MEMORY[0x263EF8438];
        id v41 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryAuthCP initWithDelegate:andIOService:connectionType:]6(v27, v42, v43, v44, v45, v46, v47, v48);
      }

      v11->_representsInductiveTransport = 0;
      v11->_representsInternalModule = 0;
      unsigned int *p_authFlags = 0;
      goto LABEL_52;
    }
    if (v23)
    {
      v24 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v24 = MEMORY[0x263EF8438];
      id v28 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      unsigned int v29 = [(ACCTransportIOAccessoryBase *)v11 ioService];
      unsigned int v30 = *p_authFlags;
      *(_DWORD *)buf = 67109376;
      unsigned int v92 = v29;
      __int16 v93 = 1024;
      unsigned int v94 = v30;
      _os_log_impl(&dword_222CE3000, v24, OS_LOG_TYPE_INFO, "authCP service %d flags == 0x%x", buf, 0xEu);
    }

    unsigned int v31 = *p_authFlags;
    v11->_representsInductiveTransport = *p_authFlags & 1;
    if ((v31 & 0xFF0000) == 0x30000)
    {
      int v32 = 3;
    }
    else
    {
      if ((v31 & 0xFF0000) != 0x10000)
      {
        v11->_representsInternalModule = 0;
LABEL_52:
        CFRelease(v19);
        goto LABEL_53;
      }
      if ((v31 & 0xC) == 8) {
        int v32 = 2;
      }
      else {
        int v32 = 1;
      }
    }
    v11->_representsInternalModule = v32;
    goto LABEL_52;
  }
  if (gLogObjects && gNumLogObjects >= 7)
  {
    v25 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    v25 = MEMORY[0x263EF8438];
    id v33 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    -[ACCTransportIOAccessoryAuthCP initWithDelegate:andIOService:connectionType:]6(v25, v34, v35, v36, v37, v38, v39, v40);
  }

  v11->_representsInductiveTransport = 0;
  v11->_representsInternalModule = 0;
  v11->_authFlags = 0;
LABEL_53:
  v11->_authVersionMajor = 0;
  v11->_deviceID = 0;
  v11->_pAuthCertCache = 0;
  v11->_ioServiceUpstream = 0;
  v11->_accConnectionType = a5;
  v11->super._ioConnect = 0;
  v11->_bIsShuttingDown = 0;
  v11->_certType = -1;
  if (v11->_representsInductiveTransport)
  {
    v11->_authTryMaximum = gAuthMaxTryCountInductive;
  }
  else
  {
    if ([(ACCTransportIOAccessoryAuthCP *)v11 _representsHardwareComponent])
    {
      char v49 = 3;
    }
    else if (v11->_accConnectionType == 3)
    {
      char v49 = gAuthMaxTryCountAppleIDBusSmartConnector;
    }
    else
    {
      char v49 = gAuthMaxTryCountAppleIDBusLightning;
    }
    v11->_authTryMaximum = v49;
  }
  io_service_t v50 = [(ACCTransportIOAccessoryBase *)v11 ioService];
  if (IOServiceOpen(v50, *MEMORY[0x263EF8960], 0, &v11->super._ioConnect))
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v51 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v51 = MEMORY[0x263EF8438];
      id v56 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryAuthCP initWithDelegate:andIOService:connectionType:]4();
    }

LABEL_74:
    v11 = 0;
    goto LABEL_75;
  }
  buf[0] = BYTE1(v11);
  HIBYTE(v92) = (_BYTE)v11;
  LOBYTE(v92) = BYTE2(v11);
  buf[1] = BYTE3(v11);
  BYTE2(v92) = BYTE4(v11);
  BYTE1(v92) = BYTE5(v11);
  buf[3] = BYTE6(v11);
  buf[2] = HIBYTE(v11);
  CFDataRef cf = CFDataCreate(0, buf, 8);
  CFStringRef v52 = (const __CFString *)MFAACreateSerialNumberStringFromData();
  if (v52)
  {
    MutableCopy = CFStringCreateMutableCopy(0, 0, @"com.apple.accessoryd");
    if (MutableCopy)
    {
      v54 = MutableCopy;
      CFStringAppend(MutableCopy, @".AppleIDBus.");
      CFStringAppend(v54, v52);
      CStringPtr = CFStringGetCStringPtr(v54, 0x8000100u);
      goto LABEL_93;
    }
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v58 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v58 = MEMORY[0x263EF8438];
      id v66 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryAuthCP initWithDelegate:andIOService:connectionType:]2();
    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v58 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v58 = MEMORY[0x263EF8438];
      id v59 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryAuthCP initWithDelegate:andIOService:connectionType:]0((uint64_t)cf, v58, v60, v61, v62, v63, v64, v65);
    }
  }

  v54 = 0;
  CStringPtr = 0;
LABEL_93:
  [(ACCTransportIOAccessoryBase *)v11 ioService];
  unsigned int UpstreamService = IOAccessoryManagerGetUpstreamService();
  v11->_ioServiceUpstream = UpstreamService;
  if (!UpstreamService)
  {
    io_object_t v68 = [(ACCTransportIOAccessoryBase *)v11 ioService];
    v11->_ioServiceUpstream = v68;
    IOObjectRetain(v68);
  }
  if (gbAppleIDAuthCertNotCached)
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v69 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v69 = MEMORY[0x263EF8438];
      id v71 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v87 = 0;
      _os_log_impl(&dword_222CE3000, v69, OS_LOG_TYPE_INFO, "Cert cache disabled, gbAppleIDAuthCertNotCached = 1", v87, 2u);
    }
  }
  else
  {
    uint64_t v70 = MFAACreateCertificateCache();
    v11->_pAuthCertCache = (const void *)v70;
    if (v70) {
      goto LABEL_114;
    }
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v69 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v69 = MEMORY[0x263EF8438];
      id v72 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryAuthCP initWithDelegate:andIOService:connectionType:].cold.7();
    }
  }

LABEL_114:
  if (CStringPtr)
  {
    dispatch_queue_t v73 = dispatch_queue_create(CStringPtr, 0);
    v74 = v11->_authWorkQueue;
    v11->_authWorkQueue = (OS_dispatch_queue *)v73;

    v75 = v11->_authWorkQueue;
    if (v75)
    {
      dispatch_source_t v76 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v75);
      v77 = v11->_authTimerSource;
      v11->_authTimerSource = (OS_dispatch_source *)v76;

      v78 = v11->_authTimerSource;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __78__ACCTransportIOAccessoryAuthCP_initWithDelegate_andIOService_connectionType___block_invoke_117;
      handler[3] = &unk_26466B8C8;
      v86 = v11;
      dispatch_source_set_event_handler(v78, handler);
      dispatch_source_set_timer((dispatch_source_t)v11->_authTimerSource, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_resume((dispatch_object_t)v11->_authTimerSource);

      CFDataRef v79 = cf;
      if (!cf) {
        goto LABEL_138;
      }
      goto LABEL_137;
    }
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v81 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v81 = MEMORY[0x263EF8438];
      id v83 = MEMORY[0x263EF8438];
    }
    CFDataRef v79 = cf;
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryAuthCP initWithDelegate:andIOService:connectionType:].cold.5();
    }

    IOAccessoryManagerRevokeFeatures();
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v80 = *(id *)(gLogObjects + 48);
      CFDataRef v79 = cf;
    }
    else
    {
      CFDataRef v79 = cf;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v80 = MEMORY[0x263EF8438];
      id v82 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryAuthCP initWithDelegate:andIOService:connectionType:]();
    }
  }
  v11->_bIsShuttingDown = 1;
  if (v79) {
LABEL_137:
  }
    CFRelease(v79);
LABEL_138:
  if (v52) {
    CFRelease(v52);
  }
  if (v54) {
    CFRelease(v54);
  }
LABEL_75:

  return v11;
}

uint64_t __78__ACCTransportIOAccessoryAuthCP_initWithDelegate_andIOService_connectionType___block_invoke(uint64_t a1)
{
  if (+[BootArgs intForKey:@"no_prearm_devid"])
  {
    if (gLogObjects) {
      BOOL v2 = gNumLogObjects < 7;
    }
    else {
      BOOL v2 = 1;
    }
    if (v2)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v6 = MEMORY[0x263EF8438];
      id v3 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v6 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_semaphore_t v16 = 0;
      _os_log_impl(&dword_222CE3000, v6, OS_LOG_TYPE_DEFAULT, "ACCTransportIOAccessoryAuthCP: Ignore DeviceIdentity prearm", v16, 2u);
    }
  }
  else if (acc_policies_deviceNeedsPreArmDeviceIdentity())
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 7;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v10 = MEMORY[0x263EF8438];
      id v5 = MEMORY[0x263EF8438];
    }
    else
    {
      v10 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_DEFAULT, "ACCTransportIOAccessoryAuthCP: Test DeviceIdentity need prearm", buf, 2u);
    }

    [*(id *)(a1 + 32) setBatteryNotifyPortRef:IONotificationPortCreate(*MEMORY[0x263F0EC90])];
    CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)[*(id *)(a1 + 32) batteryNotifyPortRef]);
    if (RunLoopSource)
    {
      v12 = RunLoopSource;
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, v12, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
      v14 = (IONotificationPort *)[*(id *)(a1 + 32) batteryNotifyPortRef];
      CFDictionaryRef v15 = IOServiceMatching("IOPMPowerSource");
      if (!IOServiceAddMatchingNotification(v14, "IOServiceFirstMatch", v15, (IOServiceMatchingCallback)__powerBatteryMatch, (void *)(*(void *)(a1 + 32) + 184), (io_iterator_t *)(*(void *)(a1 + 32) + 108)))__powerBatteryMatch((IONotificationPort **)(*(void *)(a1 + 32) + 184), *(_DWORD *)(*(void *)(a1 + 32) + 108)); {
    }
      }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
  int v7 = MFAAIsDevelopmentHW();
  int v8 = MFAAIsDesenseBuild();
  uint64_t result = MFAAIsInternalBuild();
  gbIsInternalBuild = result;
  if (v7 && result | v8)
  {
    gbAppleIDAuthAlwaysPasses = CFPreferencesGetAppBooleanValue(@"AppleIDAuthAlwaysPasses", @"com.apple.accessoryd", 0) != 0;
    gbAppleIDAuthForceDownstreamRevoke = CFPreferencesGetAppBooleanValue(@"AppleIDAuthForceDownstreamRevoke", @"com.apple.accessoryd", 0) != 0;
    gbAppleIDAuthCertNotCached = CFPreferencesGetAppBooleanValue(@"AppleIDAuthCertNotCached", @"com.apple.accessoryd", 0) != 0;
    uint64_t result = CFPreferencesGetAppIntegerValue(@"AppleIDAuthMaxTryCount", @"com.apple.accessoryd", 0);
    if ((_BYTE)result)
    {
      gAuthMaxTryCountInductive = result;
      gAuthMaxTryCountAppleIDBusLightning = result;
      gAuthMaxTryCountAppleIDBusSmartConnector = result;
    }
  }
  return result;
}

uint64_t __78__ACCTransportIOAccessoryAuthCP_initWithDelegate_andIOService_connectionType___block_invoke_117(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAuthTimerTimeout];
}

- (void)startShutdownProcess
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  self->_bIsShuttingDown = 1;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 7;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v12 = [(ACCTransportIOAccessoryBase *)self ioService];
    _os_log_impl(&dword_222CE3000, v5, OS_LOG_TYPE_DEFAULT, "Starting shutdown process for authCP service %d", buf, 8u);
  }

  if (self->_representsInductiveTransport)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", -[ACCTransportIOAccessoryBase ioService](self, "ioService"));
    int v7 = acc_userNotifications_generateIdentifier(@"io-service", (uint64_t)v6);

    int v8 = +[ACCUserNotificationManager sharedManager];
    [v8 dismissNotificationsWithGroupIdentifier:v7];
  }
  authWorkQueue = self->_authWorkQueue;
  if (authWorkQueue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__ACCTransportIOAccessoryAuthCP_startShutdownProcess__block_invoke;
    block[3] = &unk_26466B8C8;
    void block[4] = self;
    dispatch_async(authWorkQueue, block);
  }
}

void __53__ACCTransportIOAccessoryAuthCP_startShutdownProcess__block_invoke(uint64_t a1)
{
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_storeWeak((id *)&self->_delegate, 0);
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 7;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v14 = [(ACCTransportIOAccessoryBase *)self ioService];
    _os_log_impl(&dword_222CE3000, v5, OS_LOG_TYPE_INFO, "Deallocating authCP service %d", buf, 8u);
  }

  MFAADeallocCertificateCache();
  self->_pAuthCertCache = 0;
  io_object_t ioServiceUpstream = self->_ioServiceUpstream;
  if (ioServiceUpstream) {
    IOObjectRelease(ioServiceUpstream);
  }
  pAuthCertificate = self->_pAuthCertificate;
  self->_pAuthCertificate = 0;

  authWorkQueue = self->_authWorkQueue;
  self->_authWorkQueue = 0;

  if (self->_representsInductiveTransport)
  {
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"%d", -[ACCTransportIOAccessoryBase ioService](self, "ioService"));
    v10 = acc_userNotifications_generateIdentifier(@"io-service", (uint64_t)v9);

    v11 = +[ACCUserNotificationManager sharedManager];
    [v11 dismissNotificationsWithGroupIdentifier:v10];
  }
  v12.receiver = self;
  v12.super_class = (Class)ACCTransportIOAccessoryAuthCP;
  [(ACCTransportIOAccessoryBase *)&v12 dealloc];
}

- (BOOL)requiresAuthenticationProcess
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (IOObjectConformsTo([(ACCTransportIOAccessoryBase *)self ioService], "AppleAuthCPDock"))
  {
LABEL_2:
    BOOL v3 = 0;
    goto LABEL_9;
  }
  if ([(ACCTransportIOAccessoryAuthCP *)self _representsHardwareComponent])
  {
    io_registry_entry_t v4 = [(ACCTransportIOAccessoryBase *)self ioService];
    CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v4, @"AuthPassed", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (CFProperty)
    {
      CFBooleanRef v6 = CFProperty;
      int Value = CFBooleanGetValue(CFProperty);
      CFRelease(v6);
      if (gLogObjects && gNumLogObjects >= 7)
      {
        int v8 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        int v8 = MEMORY[0x263EF8438];
        id v14 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = @"yes";
        if (!Value) {
          uint64_t v15 = @"no";
        }
        int v16 = 138412290;
        v17 = v15;
        _os_log_impl(&dword_222CE3000, v8, OS_LOG_TYPE_INFO, "For debug purposes: isAuthPassed = %@", (uint8_t *)&v16, 0xCu);
      }

      goto LABEL_2;
    }
  }
  BOOL v3 = 1;
LABEL_9:
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 7;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    v11 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  else
  {
    v11 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v12 = @"no";
    if (v3) {
      objc_super v12 = @"yes";
    }
    int v16 = 138412290;
    v17 = v12;
    _os_log_impl(&dword_222CE3000, v11, OS_LOG_TYPE_DEFAULT, "requiresAuth = %@", (uint8_t *)&v16, 0xCu);
  }

  return v3;
}

- (void)doPostAuthentication
{
  if (!self->_bIsShuttingDown)
  {
    BOOL v3 = [(ACCTransportIOAccessoryAuthCP *)self authWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__ACCTransportIOAccessoryAuthCP_doPostAuthentication__block_invoke;
    block[3] = &unk_26466B8C8;
    void block[4] = self;
    dispatch_async(v3, block);
  }
}

uint64_t __53__ACCTransportIOAccessoryAuthCP_doPostAuthentication__block_invoke(uint64_t a1)
{
  CFTypeRef v2 = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 58) = 0;
  BOOL v3 = (_OWORD *)(*(void *)(a1 + 32) + 208);
  *BOOL v3 = 0u;
  v3[1] = 0u;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  int v5 = 3;
  while (1)
  {
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty([*(id *)(a1 + 32) ioService], @"AuthPassed", v4, 0);
    CFTypeRef v7 = IORegistryEntryCreateCFProperty([*(id *)(a1 + 32) ioService], @"authError", v4, 0);
    if (!CFProperty)
    {
      BOOL v11 = 0;
      int v9 = 1;
      goto LABEL_12;
    }
    CFTypeID v8 = CFGetTypeID(CFProperty);
    if (v8 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)CFProperty))
    {
      CFTypeRef v2 = IORegistryEntryCreateCFProperty([*(id *)(a1 + 32) ioService], @"AccessoryCertificate", v4, 0);
      int v9 = 0;
    }
    else
    {
      int v9 = 1;
    }
    char v10 = (v2 != 0) & ~(_BYTE)v9;
    BOOL v11 = v7 != 0;
    if (!v7) {
      char v10 = 0;
    }
    if (v10) {
      break;
    }
LABEL_12:
    if (v11 & v9) {
      break;
    }
    uint64_t result = usleep(0xC350u);
    if (!--v5) {
      return result;
    }
  }
  CFTypeID v13 = CFGetTypeID(CFProperty);
  uint64_t result = CFBooleanGetTypeID();
  if (v13 == result)
  {
    CFTypeID v14 = CFGetTypeID(v7);
    uint64_t result = CFNumberGetTypeID();
    if (v14 == result)
    {
      if (!v2 || (v15 = CFGetTypeID(v2), uint64_t result = CFDataGetTypeID(), v15 == result))
      {
        int Value = CFBooleanGetValue((CFBooleanRef)CFProperty);
        CFNumberGetValue((CFNumberRef)v7, kCFNumberCharType, (void *)(*(void *)(a1 + 32) + 100));
        uint64_t result = *(void *)(a1 + 32);
        if (*(_DWORD *)(result + 100) <= 0x1Du)
        {
          return [(id)result _finishAuthentication:Value != 0 authCert:v2];
        }
      }
    }
  }
  return result;
}

- (BOOL)_authInternalModuleWithCert:(const __CFData *)a3 withError:(int *)a4
{
  BOOL v4 = 0;
  uint64_t v76 = *MEMORY[0x263EF8340];
  if (a3 && a4)
  {
    p_representsInternalModule = &self->_representsInternalModule;
    if (self->_representsInternalModule)
    {
      uint64_t v65 = 0;
      id v66 = &v65;
      uint64_t v67 = 0x2020000000;
      char v68 = 0;
      uint64_t v61 = 0;
      uint64_t v62 = &v61;
      uint64_t v63 = 0x2020000000;
      int v64 = 30;
      uint64_t v55 = 0;
      id v56 = &v55;
      uint64_t v57 = 0x3032000000;
      v58 = __Block_byref_object_copy__1;
      id v59 = __Block_byref_object_dispose__1;
      id v60 = 0;
      uint64_t v51 = 0;
      CFStringRef v52 = &v51;
      uint64_t v53 = 0x2020000000;
      char v54 = 0;
      dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
      *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __buf[0] = v10;
      __buf[1] = v10;
      BOOL v11 = enhanced_apfs_enabled();
      if (gLogObjects && gNumLogObjects >= 7)
      {
        objc_super v12 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        objc_super v12 = MEMORY[0x263EF8438];
        id v13 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v70) = v11;
        _os_log_impl(&dword_222CE3000, v12, OS_LOG_TYPE_INFO, "eApfsEnabled:%d", buf, 8u);
      }

      if (v11)
      {
        uint64_t v44 = (char *)systemInfo_copyProductVersion();
        CFTypeID v14 = +[ACCUserDefaults sharedDefaults];
        CFTypeID v15 = [v14 stringForKey:@"ProductVersion"];

        if (gLogObjects && gNumLogObjects >= 7)
        {
          int v16 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          int v16 = MEMORY[0x263EF8438];
          id v18 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v70 = v15;
          __int16 v71 = 2112;
          id v72 = v44;
          _os_log_impl(&dword_222CE3000, v16, OS_LOG_TYPE_DEFAULT, "knownVersion:%@, osVersion:%@", buf, 0x16u);
        }

        unsigned int v17 = 1800;
        if (v15 && v44)
        {
          if ([(__CFString *)v15 isEqualToString:v44]) {
            unsigned int v17 = 0;
          }
          else {
            unsigned int v17 = 1800;
          }
        }
      }
      else
      {
        unsigned int v17 = 0;
        uint64_t v44 = 0;
      }
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __71__ACCTransportIOAccessoryAuthCP__authInternalModuleWithCert_withError___block_invoke;
      v45[3] = &unk_26466C5F8;
      uint64_t v47 = &v65;
      uint64_t v48 = &v61;
      char v49 = &v55;
      io_service_t v50 = &v51;
      CFNumberRef v19 = v9;
      uint64_t v46 = v19;
      v20 = (void *)MEMORY[0x223CA7A80](v45);
      arc4random_buf(__buf, 0x20uLL);
      uint64_t v43 = [MEMORY[0x263EFF8F8] dataWithBytes:__buf length:32];
      v21 = [MEMORY[0x263F340D0] sharedManager];
      BOOL v22 = v21;
      int v23 = *p_representsInternalModule;
      if (*p_representsInternalModule == 1)
      {
        if (!v17) {
          unsigned int v17 = 10;
        }
        [v21 authenticateBatteryWithChallenge:v43 completionHandler:v20];
      }
      else
      {
        if (v23 != 2)
        {
          if (v23 != 3)
          {
            if (gLogObjects && gNumLogObjects >= 7)
            {
              v27 = *(id *)(gLogObjects + 48);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                -[ACCTransportIOAccessoryOOBPairing dealloc]();
              }
              v27 = MEMORY[0x263EF8438];
              id v35 = MEMORY[0x263EF8438];
            }
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryAuthCP _authInternalModuleWithCert:withError:]((uint64_t)p_representsInternalModule, v27, v36, v37, v38, v39, v40, v41);
            }
            BOOL v4 = 0;
            goto LABEL_82;
          }
          if (!v17) {
            unsigned int v17 = 10;
          }
          [v21 authenticateTouchControllerWithChallenge:0 completionHandler:v20 updateRegistry:0];
          v24 = @"Touch";
LABEL_42:
          dispatch_time_t v25 = dispatch_time(0, 1000000000 * v17);
          if (dispatch_semaphore_wait(v19, v25))
          {
            if (gLogObjects && gNumLogObjects >= 7)
            {
              id v26 = *(id *)(gLogObjects + 48);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                -[ACCTransportIOAccessoryOOBPairing dealloc]();
              }
              id v26 = MEMORY[0x263EF8438];
              id v28 = MEMORY[0x263EF8438];
            }
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryAuthCP _authInternalModuleWithCert:withError:].cold.5();
            }

            *((_DWORD *)v62 + 6) = 15;
          }
          if (gLogObjects && gNumLogObjects >= 7)
          {
            unsigned int v29 = *(id *)(gLogObjects + 48);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryOOBPairing dealloc]();
            }
            unsigned int v29 = MEMORY[0x263EF8438];
            id v30 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            int v31 = *((unsigned __int8 *)v66 + 24);
            *(_DWORD *)buf = 138543874;
            uint64_t v70 = v24;
            __int16 v71 = 2080;
            id v72 = "-[ACCTransportIOAccessoryAuthCP _authInternalModuleWithCert:withError:]";
            __int16 v73 = 1024;
            int v74 = v31;
            _os_log_impl(&dword_222CE3000, v29, OS_LOG_TYPE_DEFAULT, "(module:%{public}@) %s: authPassed:%d", buf, 0x1Cu);
          }

          if (*((unsigned char *)v52 + 24)) {
            int v32 = 2;
          }
          else {
            int v32 = 1;
          }
          self->_fdrValidationStatus = v32;
          *a4 = *((_DWORD *)v62 + 6);
          *a3 = (const __CFData *)(id)v56[5];
          BOOL v4 = *((unsigned char *)v66 + 24) != 0;
          if (!v11) {
            goto LABEL_83;
          }
          if (gLogObjects && gNumLogObjects >= 7)
          {
            id v33 = *(id *)(gLogObjects + 48);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryOOBPairing dealloc]();
            }
            id v33 = MEMORY[0x263EF8438];
            id v34 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_222CE3000, v33, OS_LOG_TYPE_INFO, "store OS version", buf, 2u);
          }

          v27 = +[ACCUserDefaults sharedDefaults];
          [v27 setObject:v44 forKey:@"ProductVersion"];
LABEL_82:

LABEL_83:
          _Block_object_dispose(&v51, 8);
          _Block_object_dispose(&v55, 8);

          _Block_object_dispose(&v61, 8);
          _Block_object_dispose(&v65, 8);
          return v4;
        }
        if (!v17) {
          unsigned int v17 = 40;
        }
        [v21 authenticateVeridianWithChallenge:v43 completionHandler:v20];
      }
      v24 = @"Battery";
      goto LABEL_42;
    }
    return 0;
  }
  return v4;
}

void __71__ACCTransportIOAccessoryAuthCP__authInternalModuleWithCert_withError___block_invoke(uint64_t a1, int a2, void *a3, void *a4, int a5, int a6)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects < 7;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    CFTypeID v15 = MEMORY[0x263EF8438];
    id v14 = MEMORY[0x263EF8438];
  }
  else
  {
    CFTypeID v15 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315906;
    v20 = "-[ACCTransportIOAccessoryAuthCP _authInternalModuleWithCert:withError:]_block_invoke";
    __int16 v21 = 1024;
    int v22 = a2;
    __int16 v23 = 1024;
    int v24 = a5;
    __int16 v25 = 1024;
    int v26 = a6;
    _os_log_impl(&dword_222CE3000, v15, OS_LOG_TYPE_DEFAULT, "%s: authPassed:%d, fdrValidationStatus:%d, authError:0x%x", (uint8_t *)&v19, 0x1Eu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a6;
  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  unsigned int v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v11;
  id v18 = v11;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a5;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_authWithAuthIC:(unsigned int)a3 withCert:(const __CFData *)a4 withError:(int *)a5
{
  LOBYTE(v5) = 0;
  uint64_t v55 = *MEMORY[0x263EF8340];
  if (a4 && a5)
  {
    __int16 v51 = 0;
    __int16 v50 = 0;
    unsigned int v48 = 0;
    int v49 = 0;
    CFDataRef v47 = 0;
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 7;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v12 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    else
    {
      id v12 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int authTryCurrent = self->_authTryCurrent;
      int authTryMaximum = self->_authTryMaximum;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)uint64_t v53 = authTryCurrent;
      *(_WORD *)&v53[4] = 1024;
      *(_DWORD *)&v53[6] = authTryMaximum;
      _os_log_impl(&dword_222CE3000, v12, OS_LOG_TYPE_DEFAULT, "Starting auth try:%02X of max:%02X", buf, 0xEu);
    }

    if (*a4) {
      CFRelease(*a4);
    }
    *a4 = 0;
    uint64_t DeviceInfo = cpGetDeviceInfo([(ACCTransportIOAccessoryBase *)self ioService], (char *)&v51 + 1, &v51, (char *)&v50 + 1, &v50, &v49);
    if (![(ACCTransportIOAccessoryAuthCP *)self _handleAuthDeviceInfo:DeviceInfo versionMajor:HIBYTE(v50) versionMinor:v50])
    {
      LOBYTE(v5) = 0;
      if ([(ACCTransportIOAccessoryAuthCP *)self _representsHardwareComponent]) {
        int v18 = 17;
      }
      else {
        int v18 = 1;
      }
      unsigned int v48 = v18;
      goto LABEL_90;
    }
    int v16 = acc_userDefaults_BOOLForKey(@"TreatAuthCPDEVNAsV3");
    unsigned __int8 v17 = HIBYTE(v50);
    if (HIBYTE(v50) == 4)
    {
      if (!v16)
      {
        int v19 = 5;
        goto LABEL_26;
      }
    }
    else if (HIBYTE(v50) != 3)
    {
LABEL_27:
      self->_int authVersionMajor = v17;
      self->_int deviceID = v49;
      if (gLogObjects && gNumLogObjects >= 7)
      {
        v20 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        v20 = MEMORY[0x263EF8438];
        id v21 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int authVersionMajor = self->_authVersionMajor;
        int deviceID = self->_deviceID;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)uint64_t v53 = authVersionMajor;
        *(_WORD *)&v53[4] = 1024;
        *(_DWORD *)&v53[6] = deviceID;
        _os_log_impl(&dword_222CE3000, v20, OS_LOG_TYPE_DEFAULT, "authMajor:%02X deviceID:%04X", buf, 0xEu);
      }

      CFTypeRef v24 = cpCopyCertificateSerialNumber([(ACCTransportIOAccessoryBase *)self ioService]);
      if ([(ACCTransportIOAccessoryAuthCP *)self _handleAuthCertSerialNumber:v24 certData:&v47])
      {
        if (v47)
        {
          BOOL v25 = 1;
        }
        else
        {
          CFDataRef v27 = (const __CFData *)cpCopyCertificate([(ACCTransportIOAccessoryBase *)self ioService]);
          BOOL v25 = 0;
          CFDataRef v47 = v27;
        }
        self->_certIsCached = v25;
        p_certType = &self->_certType;
        self->_certType = -1;
        BOOL v29 = -[ACCTransportIOAccessoryAuthCP _handleAuthCertificate:serialNumber:authError:](self, "_handleAuthCertificate:serialNumber:authError:");
        if (gLogObjects && gNumLogObjects >= 7)
        {
          id v30 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          id v30 = MEMORY[0x263EF8438];
          id v31 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          -[ACCTransportIOAccessoryAuthCP _authWithAuthIC:withCert:withError:].cold.6(v29, &self->_certType, v30);
        }

        if (!v29)
        {
          LOBYTE(v5) = 0;
LABEL_88:
          if (v24) {
            CFRelease(v24);
          }
LABEL_90:
          *a5 = v48;
          *a4 = v47;
          return v5;
        }
        unsigned __int8 v32 = 0;
        int v33 = *p_certType;
        int v34 = 0;
        if (*p_certType != 3 && v33 != 5)
        {
          unsigned __int8 v32 = MFAACertificateAuthVersionNumber();
          int v34 = acc_userDefaults_BOOLForKey(@"TreatAuthCPDEVNAsV3");
          int v33 = *p_certType;
        }
        if (v33 == 3 || v33 == 5 || HIBYTE(v50) == v32 || v32 == 3 && HIBYTE(v50) == 4 && ((v34 ^ 1) & 1) == 0)
        {
          CFTypeRef cf = 0;
          CFDataRef v35 = (const __CFData *)MFAACreateRandomNonce();
          if (v35)
          {
            CFDataRef v36 = v35;
            if (cpCreateSignature(a3, v35, (CFDataRef *)&cf))
            {
              if (gLogObjects && gNumLogObjects >= 7)
              {
                uint64_t v37 = *(id *)(gLogObjects + 48);
              }
              else
              {
                if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                  -[ACCTransportIOAccessoryOOBPairing dealloc]();
                }
                uint64_t v37 = MEMORY[0x263EF8438];
                id v41 = MEMORY[0x263EF8438];
              }
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
                -[ACCTransportIOAccessoryAuthCP _authWithAuthIC:withCert:withError:]();
              }

              LOBYTE(v5) = 0;
              int v42 = 11;
            }
            else
            {
              if ([(ACCTransportIOAccessoryAuthCP *)self _handleAuthSignature:cf certData:v47 nonceData:v36])
              {
                BOOL v5 = [(ACCTransportIOAccessoryAuthCP *)self _validateCertCapsForCertificate:v47 authError:&v48];
                uint64_t v39 = logObjectForModule_1(6);
                if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                {
                  if (v48 > 0x1D) {
                    uint64_t v40 = "UninitializedAuthError";
                  }
                  else {
                    uint64_t v40 = kACCTransport_IOAccessoryAuthCP_AuthError_Strings[v48];
                  }
                  *(_DWORD *)buf = 136315394;
                  *(void *)uint64_t v53 = v40;
                  *(_WORD *)&v53[8] = 1024;
                  BOOL v54 = v5;
                  _os_log_impl(&dword_222CE3000, v39, OS_LOG_TYPE_INFO, "after validating cert caps, authError = %s, bAuthContinue = %d", buf, 0x12u);
                }

                goto LABEL_86;
              }
              LOBYTE(v5) = 0;
              int v42 = 12;
            }
            unsigned int v48 = v42;
LABEL_86:
            CFRelease(v36);
            if (cf) {
              CFRelease(cf);
            }
            goto LABEL_88;
          }
          if (gLogObjects && gNumLogObjects >= 7)
          {
            uint64_t v38 = *(id *)(gLogObjects + 48);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryOOBPairing dealloc]();
            }
            uint64_t v38 = MEMORY[0x263EF8438];
            id v43 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryAuthCP _authWithAuthIC:withCert:withError:]();
          }

          LOBYTE(v5) = 0;
          int v26 = 10;
        }
        else
        {
          uint64_t v45 = logObjectForModule_1(6);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryAuthCP _authWithAuthIC:withCert:withError:].cold.5((unsigned __int8 *)&v50 + 1, v32, v45);
          }

          LOBYTE(v5) = 0;
          int v26 = 9;
        }
      }
      else
      {
        LOBYTE(v5) = 0;
        int v26 = 2;
      }
      unsigned int v48 = v26;
      goto LABEL_88;
    }
    int v19 = 1;
LABEL_26:
    self->_certType = v19;
    goto LABEL_27;
  }
  return v5;
}

- (void)startAuthenticationProcess
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!self->_bIsShuttingDown)
  {
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3032000000;
    v10[3] = __Block_byref_object_copy__1;
    v10[4] = __Block_byref_object_dispose__1;
    id v11 = (ACCTransportIOAccessoryAuthCP *)0xAAAAAAAAAAAAAAAALL;
    CFTypeRef v2 = self;
    BOOL v3 = v2;
    id v11 = v2;
    if (v2->_accConnectionType == 1)
    {
      LOWORD(v13) = 0;
      *(_DWORD *)buf = 0;
      [(ACCTransportIOAccessoryAuthCP *)v2 ioServiceUpstream];
      if (!IOAccessoryManagerGetDigitalID() && (v13 & 0x10) != 0 && (buf[1] & 1) == 0)
      {
        io_registry_entry_t parent = 0;
        if (IORegistryEntryGetParentEntry([(ACCTransportIOAccessoryAuthCP *)v3 ioServiceUpstream], "IOAccessory", &parent))
        {
          CFStringRef CFProperty = 0;
        }
        else
        {
          CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(parent, @"IOAccessoryAccessoryModelNumber", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
        }
        uint64_t v6 = acc_userDefaults_copyIntegerForKey(@"AuthCPStartDelayMs");
        if (v6)
        {
          uint64_t v7 = v6 & ~(v6 >> 63);
        }
        else if (CFProperty)
        {
          if (CFStringCompare(CFProperty, @"A1619", 0)) {
            uint64_t v7 = 100;
          }
          else {
            uint64_t v7 = 500;
          }
        }
        else
        {
          uint64_t v7 = 100;
        }
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v13 = (uint64_t)CFProperty;
          __int16 v14 = 2048;
          uint64_t v15 = v7;
          _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "parent %@, authCPStartDelayMs %ld \n", buf, 0x16u);
        }
        if (v7)
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v13 = v7;
            _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Sleeping %ldms before starting auth. \n", buf, 0xCu);
          }
          usleep(1000 * v7);
        }
        if (parent) {
          IOObjectRelease(parent);
        }
        if (CFProperty) {
          CFRelease(CFProperty);
        }
      }
    }
    BOOL v4 = [(ACCTransportIOAccessoryAuthCP *)v3 authWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__ACCTransportIOAccessoryAuthCP_startAuthenticationProcess__block_invoke;
    block[3] = &unk_26466C620;
    void block[4] = v3;
    void block[5] = v10;
    dispatch_async(v4, block);

    _Block_object_dispose(v10, 8);
  }
}

void __59__ACCTransportIOAccessoryAuthCP_startAuthenticationProcess__block_invoke(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  io_object_t v2 = [*(id *)(a1 + 32) ioService];
  BOOL v3 = *v1;
  io_object_t v4 = *((_DWORD *)*v1 + 2);
  CFTypeRef cf = 0;
  v3[58] = 1;
  *((_DWORD *)*v1 + 25) = 30;
  *((_DWORD *)*v1 + 17) = 0;
  *((unsigned char *)*v1 + 56) = 0;
  BOOL v5 = (void *)*((void *)*v1 + 15);
  *((void *)*v1 + 15) = 0;

  *((unsigned char *)*v1 + 60) = 0;
  *((_WORD *)*v1 + 33) = 0;
  uint64_t v6 = (char *)*v1 + 208;
  *uint64_t v6 = 0u;
  v6[1] = 0u;
  *((_DWORD *)*v1 + 24) = 0;
  io_object_t object = v2;
  IOObjectRetain(v2);
  IOObjectRetain(v4);
  if (*((unsigned char *)*v1 + 57)) {
    int64_t v7 = 250000000000;
  }
  else {
    int64_t v7 = 30000000000;
  }
  unint64_t v8 = 0x26ABFC000uLL;
  unint64_t v9 = 0x26ABFC000uLL;
  if (gLogObjects && gNumLogObjects >= 7)
  {
    BOOL v10 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v10 = MEMORY[0x263EF8438];
    id v11 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [*v1 ioService];
    int v13 = *((unsigned __int8 *)*v1 + 59);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)uint64_t v61 = v12;
    *(_WORD *)&v61[4] = 1024;
    *(_DWORD *)&v61[6] = v13;
    _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_DEFAULT, "startAuthenticationProcess Starting auth process for AuthCP service:%4d, authTryMaximum:%02X", buf, 0xEu);
  }

  __int16 v14 = *v1;
  if (!*((unsigned char *)*v1 + 61))
  {
    *((void *)*v1 + 22) = systemInfo_getCurrentUnixTimeMS();
    if (gLogObjects && gNumLogObjects >= 7)
    {
      uint64_t v15 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v15 = MEMORY[0x263EF8438];
      id v16 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [*v1 ioService];
      int v18 = *((_DWORD *)*v1 + 19);
      *(_DWORD *)buf = 134218496;
      *(void *)uint64_t v61 = (unint64_t)(((unint64_t)v7 * (unsigned __int128)0x112E0BE827uLL) >> 64) >> 2;
      *(_WORD *)&v61[8] = 1024;
      *(_DWORD *)uint64_t v62 = v17;
      *(_WORD *)&v62[4] = 1024;
      *(_DWORD *)uint64_t v63 = v18;
      _os_log_impl(&dword_222CE3000, v15, OS_LOG_TYPE_DEFAULT, "Starting AppleAuthCP auth timer timeout secs:[%02lld] for AuthCP service:%4d, connectionType:%{coreacc:ACCConnection_Type_t}d", buf, 0x18u);
    }

    int v19 = *((void *)*v1 + 19);
    dispatch_time_t v20 = dispatch_time(0, v7);
    dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0);
    __int16 v14 = *v1;
  }
  if (v14[19] != 8
    || (+[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager"), v21 = objc_claimAutoreleasedReturnValue(), int v22 = [v21 shouldEnableDirectAWCAuth], v21, v22))
  {
    if (acc_userDefaults_BOOLForKey(@"ForceAuthTimeout"))
    {
      if (gLogObjects && gNumLogObjects >= 7)
      {
        __int16 v23 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        __int16 v23 = MEMORY[0x263EF8438];
        id v30 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = [*v1 ioService];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)uint64_t v61 = v31;
        _os_log_impl(&dword_222CE3000, v23, OS_LOG_TYPE_DEFAULT, "startAuthenticationProcess: ForceAuthTimeout: don't actually auth for AuthCP service:%4d, allow timeout to occur, if any", buf, 8u);
      }
LABEL_51:

      return;
    }
    CFTypeRef v24 = *v1;
    if (*((unsigned char *)*v1 + 61))
    {
      char v25 = 0;
      LODWORD(v26) = v4;
LABEL_30:
      uint64_t v27 = *(void *)(v8 + 2264);
      if (v27) {
        BOOL v28 = *(_DWORD *)(v9 + 2272) < 7;
      }
      else {
        BOOL v28 = 1;
      }
      if (v28)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        unsigned __int8 v32 = MEMORY[0x263EF8438];
        id v29 = MEMORY[0x263EF8438];
      }
      else
      {
        unsigned __int8 v32 = *(id *)(v27 + 48);
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        int v33 = [*v1 ioService];
        int v34 = *((unsigned __int8 *)*v1 + 58);
        int v35 = *((unsigned __int8 *)*v1 + 59);
        int v36 = *((unsigned __int8 *)*v1 + 61);
        *(_DWORD *)buf = 67110144;
        *(_DWORD *)uint64_t v61 = v33;
        *(_WORD *)&v61[4] = 1024;
        *(_DWORD *)&v61[6] = v34;
        *(_WORD *)uint64_t v62 = 1024;
        *(_DWORD *)&v62[2] = v35;
        *(_WORD *)uint64_t v63 = 1024;
        *(_DWORD *)&v63[2] = v25 & 1;
        __int16 v64 = 1024;
        int v65 = v36;
        _os_log_impl(&dword_222CE3000, v32, OS_LOG_TYPE_INFO, "AuthCP service:%4d: Auth process concluded on try:%02X of max:%02X, bAuthContinue:%d, bIsShuttingDown:%d", buf, 0x20u);
      }

      [*v1 _finishAuthentication:v25 & 1 authCert:cf];
      uint64_t v37 = *v1;
      if ((*((unsigned char *)*v1 + 92) & 2) != 0 && v37[17] == 2) {
        [v37 _validateDownstreamCertSerialNumber];
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      IOObjectRelease(object);
      IOObjectRelease(v26);
      uint64_t v38 = *(void *)(*(void *)(a1 + 40) + 8);
      __int16 v23 = *(NSObject **)(v38 + 40);
      *(void *)(v38 + 40) = 0;
      goto LABEL_51;
    }
    char v25 = 0;
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v26 = v4;
    while (1)
    {
      if ((v25 & 1) != 0 || *((unsigned __int8 *)v24 + 58) > *((unsigned __int8 *)v24 + 59)) {
        goto LABEL_30;
      }
      if (v24[17])
      {
        char v25 = 0;
        goto LABEL_30;
      }
      int v58 = 30;
      if (v24[18])
      {
        unint64_t v39 = v8;
        unint64_t v40 = v9;
        CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(object, @"isTrusted", allocator, 0);
        if (CFProperty)
        {
          int v42 = CFProperty;
          CFTypeID v43 = CFGetTypeID(CFProperty);
          if (v43 == CFBooleanGetTypeID())
          {
            if (CFBooleanGetValue((CFBooleanRef)v42))
            {
              CFTypeRef v44 = cpCopyCertificate(object);
              if (v44)
              {
                uint64_t v45 = v44;
                uint64_t v46 = *(void *)(v39 + 2264);
                if (v46 && *(int *)(v40 + 2272) >= 7)
                {
                  CFDataRef v47 = *(id *)(v46 + 48);
                }
                else
                {
                  int v54 = *(_DWORD *)(v40 + 2272);
                  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(void *)uint64_t v61 = v46;
                    *(_WORD *)&v61[8] = 1024;
                    *(_DWORD *)uint64_t v62 = v54;
                    _os_log_error_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  CFDataRef v47 = MEMORY[0x263EF8438];
                  id v49 = MEMORY[0x263EF8438];
                }
                if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
                  __59__ACCTransportIOAccessoryAuthCP_startAuthenticationProcess__block_invoke_cold_3(v66, v1, v67, v47);
                }

                *((_DWORD *)*v1 + 24) = 2;
                int v58 = 0;
                CFTypeRef cf = v45;
                CFRelease(v42);
                char v25 = 1;
                uint64_t v26 = v4;
                unint64_t v9 = v40;
                unint64_t v8 = v39;
                goto LABEL_88;
              }
            }
          }
          CFRelease(v42);
        }
        unint64_t v9 = v40;
        unint64_t v8 = v39;
        if (([*v1 _authInternalModuleWithCert:&cf withError:&v58] & 1) == 0)
        {
LABEL_66:
          unsigned int v48 = *v1;
          if (!*((_DWORD *)*v1 + 17) && *((unsigned __int8 *)v48 + 58) == *((unsigned __int8 *)v48 + 59))
          {
            if (v58 && v48[25] == 30)
            {
              v48[25] = v58;
              unsigned int v48 = *v1;
            }
            int v50 = v48[25] - 19;
            if (v50 > 4) {
              int v51 = 1;
            }
            else {
              int v51 = dword_222D4A410[v50];
            }
            v48[17] = v51;
          }
          CFStringRef v52 = (unsigned __int8 *)*v1;
          if (!*((_DWORD *)*v1 + 17))
          {
            unsigned int v53 = v52[58];
            if (v53 < v52[59])
            {
              v52[58] = v53 + 1;
              CFStringRef v52 = (unsigned __int8 *)*v1;
            }
          }
          [v52 ioService];
          IOServiceGetState();
          char v25 = 0;
          goto LABEL_88;
        }
      }
      else if (([v24 _authWithAuthIC:v26 withCert:&cf withError:&v58] & 1) == 0)
      {
        goto LABEL_66;
      }
      char v25 = 1;
LABEL_88:
      CFTypeRef v24 = *v1;
      if (*((unsigned char *)*v1 + 61)) {
        goto LABEL_30;
      }
    }
  }
}

- (void)_validateDownstreamCertSerialNumber
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, "Failed to retrieve downstream cert serial number ioretStatus:%02X", v2, v3, v4, v5, v6);
}

- (BOOL)_handleAuthDeviceInfo:(int)a3 versionMajor:(unsigned __int8)a4 versionMinor:(unsigned __int8)a5
{
  int v5 = a5;
  int v6 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 7;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v11 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  else
  {
    id v11 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v18[0] = 67109632;
    v18[1] = a3;
    __int16 v19 = 1024;
    int v20 = v6;
    __int16 v21 = 1024;
    int v22 = v5;
    _os_log_impl(&dword_222CE3000, v11, OS_LOG_TYPE_DEFAULT, "_handleAuthDeviceInfo: ioretStatus %02X, authVerMajor:%02X, authVerMinor:%02X", (uint8_t *)v18, 0x14u);
  }

  if (!self->_bIsShuttingDown && !self->_authStatus)
  {
    if (a3)
    {
      if (gLogObjects && gNumLogObjects >= 7)
      {
        int v12 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        int v12 = MEMORY[0x263EF8438];
        id v16 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryAuthCP _handleAuthDeviceInfo:versionMajor:versionMinor:]();
      }
    }
    else
    {
      BOOL v14 = v6 == 4 || (v6 & 0xFE) == 2;
      if (!v5 && v14) {
        return 1;
      }
      if (gLogObjects && gNumLogObjects >= 7)
      {
        int v12 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        int v12 = MEMORY[0x263EF8438];
        id v17 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryAuthCP _handleAuthDeviceInfo:versionMajor:versionMinor:]();
      }
    }
  }
  return 0;
}

- (BOOL)_handleAuthCertSerialNumber:(__CFString *)a3 certData:(const __CFData *)a4
{
  if (self->_bIsShuttingDown || self->_authStatus) {
    return 0;
  }
  if (a3) {
    CFDataRef v6 = (const __CFData *)MFAACreateCertDataFromSerialNumber();
  }
  else {
    CFDataRef v6 = 0;
  }
  *a4 = v6;
  return 1;
}

- (BOOL)_copyCertificateAttribute:(__CFData *)a3 forAttributeKey:(__CFNumber *)a4 withAttributeValue:(const __CFData *)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (!a3 || !a4 || !a5)
  {
    BOOL v9 = logObjectForModule_1(6);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      uint64_t v23 = "-[ACCTransportIOAccessoryAuthCP _copyCertificateAttribute:forAttributeKey:withAttributeValue:]";
      int v18 = "%s: bad arguments";
LABEL_16:
      _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v22, 0xCu);
    }
LABEL_20:
    BOOL v16 = 0;
    goto LABEL_11;
  }
  unint64_t v8 = [MEMORY[0x263F52F48] sharedManager];
  BOOL v9 = [v8 copyParsedCertificateChainInfo:a3];

  if (!v9)
  {
    BOOL v9 = logObjectForModule_1(6);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      uint64_t v23 = "-[ACCTransportIOAccessoryAuthCP _copyCertificateAttribute:forAttributeKey:withAttributeValue:]";
      int v18 = "%s: !certInfo";
      goto LABEL_16;
    }
    goto LABEL_20;
  }
  CFDataRef v10 = [v9 objectForKey:@"LeafCertData"];
  SecCertificateRef v11 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], v10);
  if (!v11)
  {
    __int16 v19 = logObjectForModule_1(6);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      uint64_t v23 = "-[ACCTransportIOAccessoryAuthCP _copyCertificateAttribute:forAttributeKey:withAttributeValue:]";
      _os_log_impl(&dword_222CE3000, v19, OS_LOG_TYPE_DEFAULT, "%s: !certRef", (uint8_t *)&v22, 0xCu);
    }

    goto LABEL_20;
  }
  SecCertificateRef v12 = v11;
  CFDictionaryRef v13 = (const __CFDictionary *)SecCertificateCopyComponentAttributes();
  if (v13)
  {
    CFDictionaryRef v14 = v13;
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v13, a4);
    BOOL v16 = Value != 0;
    if (Value)
    {
      *a5 = Value;
      CFRetain(Value);
    }
    else
    {
      __int16 v21 = logObjectForModule_1(6);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136315138;
        uint64_t v23 = "-[ACCTransportIOAccessoryAuthCP _copyCertificateAttribute:forAttributeKey:withAttributeValue:]";
        _os_log_impl(&dword_222CE3000, v21, OS_LOG_TYPE_DEFAULT, "%s: !oidTemp", (uint8_t *)&v22, 0xCu);
      }
    }
    CFRelease(v14);
  }
  else
  {
    int v20 = logObjectForModule_1(6);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      uint64_t v23 = "-[ACCTransportIOAccessoryAuthCP _copyCertificateAttribute:forAttributeKey:withAttributeValue:]";
      _os_log_impl(&dword_222CE3000, v20, OS_LOG_TYPE_DEFAULT, "%s: !componentAttributesRef", (uint8_t *)&v22, 0xCu);
    }

    BOOL v16 = 0;
  }
  CFRelease(v12);

LABEL_11:
  return v16;
}

- (BOOL)_handleAuthCertificate:(__CFData *)a3 serialNumber:(__CFString *)a4 authError:(int *)a5
{
  BOOL result = 0;
  uint64_t v88 = *MEMORY[0x263EF8340];
  self->_int certType = -1;
  *a5 = 0;
  if (!self->_bIsShuttingDown)
  {
    if (self->_authStatus) {
      return 0;
    }
    unint64_t v9 = 0x26ABFC000uLL;
    if (a3)
    {
      SecCertificateRef v11 = [MEMORY[0x263F52F48] sharedManager];
      SecCertificateRef v12 = (void *)[v11 copyParsedCertificateChainInfo:a3];

      if (v12)
      {
        CFDictionaryRef v13 = [MEMORY[0x263F52F48] sharedManager];
        CFDictionaryRef v14 = (void *)[v13 copyEvaluatedCertificateChainInfo:v12];

        uint64_t v15 = v12;
        if (v14)
        {
          id v16 = v14;

          int v17 = objc_msgSend(MEMORY[0x263F52F48], "isMFi2_3CertInfo:", v16);
          int v77 = v17;
          if ([MEMORY[0x263F52F48] isComponentCertInfo:v16])
          {
            self->_int certType = 5;
            objc_storeStrong((id *)&self->_certInfo, v14);
            int v18 = 1;
          }
          else
          {
            int v18 = v17;
          }
          uint64_t v15 = v16;
        }
        else
        {
          int v77 = 0;
          int v18 = 0;
        }

        unint64_t v9 = 0x26ABFC000;
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 7)
        {
          __int16 v21 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          __int16 v21 = MEMORY[0x263EF8438];
          id v30 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)v80 = "-[ACCTransportIOAccessoryAuthCP _handleAuthCertificate:serialNumber:authError:]";
          *(_WORD *)&v80[8] = 1024;
          int v81 = 1998;
          _os_log_impl(&dword_222CE3000, v21, OS_LOG_TYPE_DEFAULT, "%s:%d: !certInfo", buf, 0x12u);
        }

        int v77 = 0;
        int v18 = 0;
        uint64_t v15 = 0;
      }
      uint64_t v31 = *(void *)(v9 + 2264);
      if (v31 && gNumLogObjects >= 7)
      {
        unsigned __int8 v32 = *(id *)(v31 + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        unsigned __int8 v32 = MEMORY[0x263EF8438];
        id v33 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        int certType = self->_certType;
        *(_DWORD *)buf = 136316162;
        *(void *)v80 = "-[ACCTransportIOAccessoryAuthCP _handleAuthCertificate:serialNumber:authError:]";
        *(_WORD *)&v80[8] = 1024;
        int v81 = 2037;
        __int16 v82 = 1024;
        int v83 = v18;
        __int16 v84 = 1024;
        int v85 = certType;
        __int16 v86 = 2112;
        v87 = v15;
        _os_log_debug_impl(&dword_222CE3000, v32, OS_LOG_TYPE_DEBUG, "%s:%d bAuthContinue %d, certType %d, certInfo %@", buf, 0x28u);
      }

      if (v18) {
        int v34 = v77;
      }
      else {
        int v34 = 0;
      }
      if (v34 == 1)
      {
        if (v15)
        {
          int v35 = [MEMORY[0x263F52F48] sharedManager];
          char v36 = [v35 verifyCertificateChainInfoSerialNumber:v15];

          if (v36)
          {
            if (a4)
            {
              uint64_t v37 = [MEMORY[0x263F52F48] sharedManager];
              uint64_t v38 = (const void *)[v37 copyLeafCertificateSerialNumber:v15];

              goto LABEL_59;
            }
LABEL_88:
            id v59 = logObjectForModule_1(6);
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              *(void *)v80 = "-[ACCTransportIOAccessoryAuthCP _handleAuthCertificate:serialNumber:authError:]";
              _os_log_impl(&dword_222CE3000, v59, OS_LOG_TYPE_DEFAULT, "%s createCertificateSerialNumber no cert serial, skip", buf, 0xCu);
            }

            goto LABEL_91;
          }
        }
        else if (MFAAVerifyCertificateSerialNumber())
        {
          if (a4)
          {
            uint64_t v38 = (const void *)MFAACreateCertificateSerialNumber();
LABEL_59:
            if (v38)
            {
              CFStringRef v40 = (const __CFString *)MFAACreateSerialNumberStringFromData();
              if (v40)
              {
                CFStringRef v41 = v40;
                int v18 = 1;
                CFComparisonResult v42 = CFStringCompare(a4, v40, 1uLL);
                if (v42)
                {
                  uint64_t v43 = v42;
                  CFTypeRef v44 = logObjectForModule_1(6);
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
                    -[ACCTransportIOAccessoryAuthCP _handleAuthCertificate:serialNumber:authError:].cold.5(v43, v44, v45, v46, v47, v48, v49, v50);
                  }

                  int v18 = 0;
                  *a5 = 8;
                }
                CFRelease(v41);
              }
              else
              {
                v69 = logObjectForModule_1(6);
                if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
                  -[ACCTransportIOAccessoryAuthCP _handleAuthCertificate:serialNumber:authError:].cold.4(v69, v70, v71, v72, v73, v74, v75, v76);
                }

                int v18 = 0;
                *a5 = 7;
              }
              CFRelease(v38);
            }
            else
            {
              uint64_t v61 = logObjectForModule_1(6);
              if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
                -[ACCTransportIOAccessoryAuthCP _handleAuthCertificate:serialNumber:authError:](v61, v62, v63, v64, v65, v66, v67, v68);
              }

              int v18 = 0;
              *a5 = 6;
            }
            goto LABEL_92;
          }
          goto LABEL_88;
        }
        int v18 = 0;
        int v51 = 5;
      }
      else
      {
        if (v18 && v15 && [MEMORY[0x263F52F48] isComponentCertInfo:v15])
        {
          self->_int certType = 5;
          objc_storeStrong((id *)&self->_certInfo, v15);
LABEL_91:
          int v18 = 1;
          goto LABEL_92;
        }
        int v78 = v18;
        if (gLogObjects && gNumLogObjects >= 7)
        {
          unint64_t v39 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          unint64_t v39 = MEMORY[0x263EF8438];
          id v52 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_222CE3000, v39, OS_LOG_TYPE_DEFAULT, "Check if certificate verifies against DEVN cert", buf, 2u);
        }

        Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
        if (Mutable)
        {
          int v54 = Mutable;
          CFArrayAppendValue(Mutable, a3);
          uint64_t v55 = [MEMORY[0x263F52F48] sharedManager];
          int v56 = [v55 validateCertificateChain:v54 type:3 realtime:1 error:0];

          if (v56 == 1 && acc_userDefaults_BOOLForKey(@"EnableDEVNCertSupport"))
          {
            self->_int certType = 3;
            int v78 = 1;
          }
          if (gLogObjects && gNumLogObjects >= 7)
          {
            uint64_t v57 = *(id *)(gLogObjects + 48);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryOOBPairing dealloc]();
            }
            uint64_t v57 = MEMORY[0x263EF8438];
            id v58 = MEMORY[0x263EF8438];
          }
          int v18 = v78;
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v80 = v56;
            *(_WORD *)&v80[4] = 1024;
            *(_DWORD *)&v80[6] = v78;
            _os_log_impl(&dword_222CE3000, v57, OS_LOG_TYPE_DEFAULT, "CertStatus = %d, bAuthContinue = %d", buf, 0xEu);
          }

          CFRelease(v54);
        }
        if (v18) {
          goto LABEL_91;
        }
        int v51 = 4;
      }
      *a5 = v51;
LABEL_92:

      return v18 != 0;
    }
    if (gLogObjects) {
      BOOL v19 = gNumLogObjects < 7;
    }
    else {
      BOOL v19 = 1;
    }
    if (v19)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v22 = MEMORY[0x263EF8438];
      id v20 = MEMORY[0x263EF8438];
    }
    else
    {
      int v22 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryAuthCP _handleAuthCertificate:serialNumber:authError:](v22, v23, v24, v25, v26, v27, v28, v29);
    }

    BOOL result = 0;
    *a5 = 3;
  }
  return result;
}

- (BOOL)_handleAuthSignature:(__CFData *)a3 certData:(__CFData *)a4 nonceData:(__CFData *)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_bIsShuttingDown || self->_authStatus) {
    return 0;
  }
  if (!a4 || !a3 || !a5)
  {
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects < 7;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      CFDataRef v10 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    else
    {
      CFDataRef v10 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 134218496;
      uint64_t v13 = (unsigned __int16)a3;
      __int16 v14 = 2048;
      uint64_t v15 = (unsigned __int16)a5;
      __int16 v16 = 2048;
      uint64_t v17 = (unsigned __int16)a4;
      _os_log_error_impl(&dword_222CE3000, v10, OS_LOG_TYPE_ERROR, "Parameter fail pkNonceSignature:%04lX, pkNonceData:%04lX, pCFCertData:%04lX", (uint8_t *)&v12, 0x20u);
    }

    return 0;
  }
  if (acc_userDefaults_BOOLForKey(@"ForceAuthFail")) {
    return 0;
  }
  return MEMORY[0x270F47C50](a4, a5, a3);
}

- (void)_resetAfterAuthCompletion
{
  self->_authTimerStartTimestamp = 0;
  self->_int authTryCurrent = 0;
}

- (void)_handleAuthTimerTimeout
{
}

- (void)_finishAuthentication:(BOOL)a3 authCert:(__CFData *)a4
{
  kern_return_t v29;
  int v30;
  NSObject *v31;
  id v32;
  int v33;
  BOOL v34;
  dispatch_time_t v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  const void *v40;
  const void *v41;
  int v42;
  NSObject *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  char v48;
  int v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  id v63;
  NSObject *v64;
  id v65;
  BOOL notificationsAvailable;
  void block[5];
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  BOOL v71;
  __int16 v72;
  int v73;
  uint64_t v74;

  uint64_t v74 = *MEMORY[0x263EF8340];
  unint64_t v5 = 0x26ABFC000uLL;
  if (!self->_bIsShuttingDown)
  {
    BOOL v7 = a3;
    dispatch_source_set_timer((dispatch_source_t)self->_authTimerSource, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    p_authStatus = &self->_authStatus;
    if (!self->_authStatus)
    {
      int v9 = v7 ? 2 : 1;
      int *p_authStatus = v9;
      if (v7) {
        self->_uint64_t authErrorDescription = 0;
      }
    }
    if (gbAppleIDAuthAlwaysPasses && *p_authStatus != 2)
    {
      int *p_authStatus = 2;
      if (a4
        && !(self->_authCertCaps.authCertCaps0 | self->_authCertCaps.authCertCaps1 | self->_authCertCaps.authCertCaps2 | self->_authCertCaps.authCertCaps3))
      {
        if (gLogObjects && gNumLogObjects >= 7)
        {
          CFDataRef v10 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          CFDataRef v10 = MEMORY[0x263EF8438];
          id v11 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int certType = self->_certType;
          *(_DWORD *)buf = 67109120;
          LODWORD(v69) = certType;
          _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_DEFAULT, "finishAuthentication: _certType %d", buf, 8u);
        }

        if (self->_certType == 3) {
          uint64_t v13 = (_OWORD *)MFAACreateDEVNCertCapsForCable();
        }
        else {
          uint64_t v13 = (_OWORD *)MFAACreateCapsFromAuthCert();
        }
        if (v13)
        {
          long long v14 = v13[1];
          *(_OWORD *)&self->_authCertCaps.authCertCaps0 = *v13;
          *(_OWORD *)&self->_authCertCaps.authCertCaps2 = v14;
          MFAADeallocAuthCertCaps();
        }
      }
      if (gLogObjects && gNumLogObjects >= 7)
      {
        uint64_t v15 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        uint64_t v15 = MEMORY[0x263EF8438];
        id v16 = MEMORY[0x263EF8438];
      }
      unint64_t v5 = 0x26ABFC000uLL;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryAuthCP _finishAuthentication:authCert:]1((uint64_t)&self->_authStatus, (uint64_t)self, v15);
      }
    }
    cpSetAuthError(self->super._ioConnect, LOBYTE(self->_authErrorDescription));
    uint64_t authErrorDescription = self->_authErrorDescription;
    if (authErrorDescription > 0x1D) {
      uint64_t v18 = "UninitializedAuthError";
    }
    else {
      uint64_t v18 = kACCTransport_IOAccessoryAuthCP_AuthError_Strings[authErrorDescription];
    }
    CFStringRef v19 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v18, 0x8000100u);
    if (v19)
    {
      CFStringRef v20 = v19;
      cpSetAuthErrorDescription(self->super._ioConnect, v19);
      CFRelease(v20);
    }
    int v21 = *p_authStatus;
    if (gLogObjects && gNumLogObjects >= 7)
    {
      int v22 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v22 = MEMORY[0x263EF8438];
      id v23 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = "FAILED";
      int authVersionMajor = self->_authVersionMajor;
      int deviceID = self->_deviceID;
      if (v21 == 2) {
        uint64_t v24 = "PASSED";
      }
      *(_DWORD *)buf = 136315650;
      v69 = v24;
      uint64_t v70 = 1024;
      uint64_t v71 = authVersionMajor;
      uint64_t v72 = 1024;
      uint64_t v73 = deviceID;
      _os_log_impl(&dword_222CE3000, v22, OS_LOG_TYPE_DEFAULT, "AID Authentication final state:[%s], authVersionMajor:%02X, deviceID:%04x", buf, 0x18u);
    }

    if (cpSetAuthStatus(self->super._ioConnect, v21 == 2))
    {
      if (gLogObjects && gNumLogObjects >= 7)
      {
        uint64_t v27 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        uint64_t v27 = MEMORY[0x263EF8438];
        id v28 = MEMORY[0x263EF8438];
      }
      unint64_t v5 = 0x26ABFC000uLL;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryAuthCP _finishAuthentication:authCert:].cold.8();
      }
    }
    if (!self->super._ioNotificationObject)
    {
      uint64_t v29 = IOServiceAddInterestNotification(self->super._ioNotificationPort, [(ACCTransportIOAccessoryBase *)self ioService], "IOGeneralInterest", (IOServiceInterestCallback)AuthCPNotifyEvent, self, &self->super._ioNotificationObject);
      if (v29)
      {
        id v30 = v29;
        if (gLogObjects && gNumLogObjects >= 7)
        {
          uint64_t v31 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          uint64_t v31 = MEMORY[0x263EF8438];
          unsigned __int8 v32 = MEMORY[0x263EF8438];
        }
        unint64_t v5 = 0x26ABFC000;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryAuthCP _finishAuthentication:authCert:].cold.6(self, v30, v31);
        }
      }
    }
    if ([(ACCTransportIOAccessoryAuthCP *)self _representsHardwareComponent])
    {
      [(ACCTransportIOAccessoryAuthCP *)self _validateAuthCPFlagsForCertificate];
      id v33 = [(ACCTransportIOAccessoryAuthCP *)self authStatus];
      int v34 = v21 == 2 && self->_fdrValidationStatus == 2;
      if (v33 == 3 && self->_softwareErrorRetry <= 2u)
      {
        int v35 = dispatch_time(0, 60000000000);
        char v36 = MEMORY[0x263EF83A0];
        uint64_t v37 = MEMORY[0x263EF83A0];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __64__ACCTransportIOAccessoryAuthCP__finishAuthentication_authCert___block_invoke;
        block[3] = &unk_26466B8C8;
        void block[4] = self;
        dispatch_after(v35, v36, block);

        uint64_t v38 = 0;
      }
      else
      {
        uint64_t v38 = 1;
      }
      [(ACCTransportIOAccessoryAuthCP *)self _publishAuth:v21 == 2 fdrStatus:self->_fdrValidationStatus trusted:v34 publishToUI:v38 ioconnect:self->super._ioConnect];
      [(ACCTransportIOAccessoryAuthCP *)self _publishAuthStats:v21 == 2 fdrStatus:self->_fdrValidationStatus];
      unint64_t v5 = 0x26ABFC000uLL;
    }
    if (v21 == 2)
    {
      if (a4)
      {
        CFRetain(a4);
        objc_storeStrong((id *)&self->_pAuthCertificate, a4);
        if ((MFAAAddCertDataEntryToCache() & 1) == 0)
        {
          if (gLogObjects && *(int *)(v5 + 2272) >= 7)
          {
            unint64_t v39 = *(id *)(gLogObjects + 48);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryOOBPairing dealloc]();
            }
            unint64_t v39 = MEMORY[0x263EF8438];
            CFTypeRef v44 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_222CE3000, v39, OS_LOG_TYPE_INFO, "Auth cert cache add failed", buf, 2u);
          }
        }
      }
    }
    else if (a4)
    {
      CFStringRef v40 = (const void *)MFAACreateCertificateSerialNumber();
      CFStringRef v41 = (const void *)MFAACreateSerialNumberStringFromData();
      if ((MFAARemoveCertDataEntryFromCache() & 1) == 0)
      {
        CFComparisonResult v42 = *(_DWORD *)(v5 + 2272);
        if (gLogObjects && v42 >= 7)
        {
          uint64_t v43 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          uint64_t v43 = MEMORY[0x263EF8438];
          uint64_t v45 = MEMORY[0x263EF8438];
        }
        unint64_t v5 = 0x26ABFC000uLL;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_222CE3000, v43, OS_LOG_TYPE_INFO, "Auth cert cache remove failed", buf, 2u);
        }
      }
      if (v40) {
        CFRelease(v40);
      }
      if (v41) {
        CFRelease(v41);
      }
    }
    uint64_t v46 = [(ACCTransportIOAccessoryAuthCP *)self delegate];
    if (v46)
    {
      uint64_t v47 = [(ACCTransportIOAccessoryAuthCP *)self delegate];
      uint64_t v48 = objc_opt_respondsToSelector();

      if (v48)
      {
        if ([(ACCTransportIOAccessoryAuthCP *)self authStatus] == 2)
        {
          LOWORD(v69) = 0;
          *(_DWORD *)buf = 0;
          [(ACCTransportIOAccessoryAuthCP *)self ioServiceUpstream];
          uint64_t v46 = (IOAccessoryManagerGetDigitalID() == 0) & buf[2];
        }
        else
        {
          uint64_t v46 = 0;
        }
        uint64_t v49 = 1;
      }
      else
      {
        uint64_t v49 = 0;
        uint64_t v46 = 0;
      }
    }
    else
    {
      uint64_t v49 = 0;
    }
    if ((self->_representsInductiveTransport
       || acc_userDefaults_BOOLForKey(@"AuthTTRForAllTransports"))
      && !self->_bIsShuttingDown
      && v21 != 2)
    {
      if (gbIsInternalBuild
        && (platform_systemInfo_isWatch() & 1) == 0
        && (acc_userDefaults_BOOLForKey(@"EnableAuthTimeoutTTR") & 1) != 0)
      {
        if (gLogObjects && *(int *)(v5 + 2272) >= 7)
        {
          uint64_t v50 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          uint64_t v50 = MEMORY[0x263EF8438];
          uint64_t v65 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          notificationsAvailable = self->_notificationsAvailable;
          *(_DWORD *)buf = 136315394;
          v69 = "-[ACCTransportIOAccessoryAuthCP _finishAuthentication:authCert:]";
          uint64_t v70 = 1024;
          uint64_t v71 = notificationsAvailable;
          _os_log_impl(&dword_222CE3000, v50, OS_LOG_TYPE_DEFAULT, "AppleAuthCP:%s failure TTR: _notificationsAvailable:%d", buf, 0x12u);
        }

        if (self->_notificationsAvailable)
        {
          if (acc_userDefaults_BOOLForKey(@"SysdiagnoseInsteadOfAuthTTR")) {
            acc_sysdiagnose_InitiateAuthFailureSysdiagnose();
          }
          else {
            acc_tapToRadar_InitiateAuthFailureTTR();
          }
        }
      }
      else if (self->_representsInductiveTransport)
      {
        int v51 = acc_userNotifications_chargingNotSupported();
        id v52 = objc_msgSend(NSString, "stringWithFormat:", @"%d", -[ACCTransportIOAccessoryBase ioService](self, "ioService"));
        unsigned int v53 = acc_userNotifications_generateIdentifier(@"io-service", (uint64_t)v52);
        [v51 setGroupIdentifier:v53];

        unint64_t v5 = 0x26ABFC000;
        int v54 = +[ACCUserNotificationManager sharedManager];
        [v54 presentNotification:v51 completionHandler:0];
      }
    }
    [(ACCTransportIOAccessoryAuthCP *)self _logToAnalytics];
    [(ACCTransportIOAccessoryAuthCP *)self _resetAfterAuthCompletion];
    if (v49)
    {
      uint64_t v55 = [(ACCTransportIOAccessoryAuthCP *)self delegate];
      int v56 = [(ACCTransportIOAccessoryAuthCP *)self authStatus];
      uint64_t v57 = [(ACCTransportIOAccessoryAuthCP *)self authType];
      id v58 = [(ACCTransportIOAccessoryAuthCP *)self pAuthCertificate];
      id v59 = [(ACCTransportIOAccessoryAuthCP *)self certType];
      id v60 = [(ACCTransportIOAccessoryBase *)self ioService];
      uint64_t v61 = v57;
      unint64_t v5 = 0x26ABFC000uLL;
      [v55 IOAccessoryAuthCPServiceAuthStatusChanged:v56 authType:v61 authCert:v58 certType:v59 authCTA:v46 service:v60];
    }
  }
  if (cpSetAuthFullPass(self->super._ioConnect, 1u))
  {
    if (gLogObjects) {
      uint64_t v62 = *(_DWORD *)(v5 + 2272) < 7;
    }
    else {
      uint64_t v62 = 1;
    }
    if (v62)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v64 = MEMORY[0x263EF8438];
      uint64_t v63 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v64 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryAuthCP _finishAuthentication:authCert:]();
    }
  }
}

uint64_t __64__ACCTransportIOAccessoryAuthCP__finishAuthentication_authCert___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 61))
  {
    ++*(unsigned char *)(v1 + 63);
    return [*(id *)(result + 32) startAuthenticationProcess];
  }
  return result;
}

- (BOOL)_validateCertCapsForCertificate:(__CFData *)a3 authError:(int *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 7;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v8 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v8 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int certType = self->_certType;
    v29[0] = 67109120;
    v29[1] = certType;
    _os_log_impl(&dword_222CE3000, v8, OS_LOG_TYPE_DEFAULT, "validateCertCapsForCertificate: _certType %d", (uint8_t *)v29, 8u);
  }

  int v10 = self->_certType;
  if (v10 == 5) {
    return 1;
  }
  if (v10 == 3) {
    uint64_t v11 = MFAACreateDEVNCertCapsForCable();
  }
  else {
    uint64_t v11 = MFAACreateCapsFromAuthCert();
  }
  uint64_t v13 = (_OWORD *)v11;
  if (v11)
  {
    if (self->_representsInductiveTransport)
    {
      char v14 = MFAACanChargeInductive();
      if (gLogObjects) {
        BOOL v15 = gNumLogObjects <= 6;
      }
      else {
        BOOL v15 = 1;
      }
      int v16 = !v15;
      if (v14)
      {
        if (v16)
        {
          uint64_t v17 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          uint64_t v17 = MEMORY[0x263EF8438];
          id v22 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v29[0]) = 0;
          _os_log_impl(&dword_222CE3000, v17, OS_LOG_TYPE_DEFAULT, "Auth cert capability bCanChargeInductive passed!", (uint8_t *)v29, 2u);
        }
        int v19 = 0;
        int v20 = 1;
      }
      else
      {
        if (v16)
        {
          uint64_t v17 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          uint64_t v17 = MEMORY[0x263EF8438];
          id v23 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryAuthCP _validateCertCapsForCertificate:authError:].cold.6();
        }
        int v20 = 0;
        int v19 = 14;
      }
    }
    else
    {
      int v19 = 0;
      int v20 = 1;
    }
    if (![(ACCTransportIOAccessoryAuthCP *)self _representsHardwareComponent])
    {
LABEL_76:
      long long v28 = v13[1];
      *(_OWORD *)&self->_authCertCaps.authCertCaps0 = *v13;
      *(_OWORD *)&self->_authCertCaps.authCertCaps2 = v28;
      MFAADeallocAuthCertCaps();
      BOOL result = v20 != 0;
      if (!a4) {
        return result;
      }
      goto LABEL_77;
    }
    int representsInternalModule = self->_representsInternalModule;
    if (representsInternalModule == 1)
    {
      if (MFAAIsAppleBatteryModule())
      {
LABEL_57:
        if (gLogObjects && gNumLogObjects >= 7)
        {
          uint64_t v25 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          uint64_t v25 = MEMORY[0x263EF8438];
          id v27 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v29[0]) = 0;
          _os_log_impl(&dword_222CE3000, v25, OS_LOG_TYPE_DEFAULT, "Success: validated cert caps", (uint8_t *)v29, 2u);
        }
LABEL_75:

        goto LABEL_76;
      }
    }
    else if (representsInternalModule == 3 && (MFAAIsAppleTouchControllerModule() & 1) != 0)
    {
      goto LABEL_57;
    }
    if (gLogObjects && gNumLogObjects >= 7)
    {
      uint64_t v25 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v25 = MEMORY[0x263EF8438];
      id v26 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29[0]) = 0;
      _os_log_impl(&dword_222CE3000, v25, OS_LOG_TYPE_DEFAULT, "Failure: validated cert caps, but auth flags contain module bit and certificate does not contain module bit", (uint8_t *)v29, 2u);
    }
    int v20 = 0;
    int v19 = 16;
    goto LABEL_75;
  }
  if (gLogObjects && gNumLogObjects >= 7)
  {
    uint64_t v18 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v18 = MEMORY[0x263EF8438];
    id v21 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[ACCTransportIOAccessoryAuthCP _validateCertCapsForCertificate:authError:]();
  }

  BOOL result = 0;
  int v19 = 13;
  if (a4) {
LABEL_77:
  }
    *a4 = v19;
  return result;
}

- (int)_fdrCertCheck
{
  v52[1] = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  CFDataRef v3 = (const __CFData *)cpCopyCertificate([(ACCTransportIOAccessoryBase *)self ioService]);
  int v51 = @"CopyAllowUnsealed";
  v52[0] = MEMORY[0x263EFFA88];
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v52 forKeys:&v51 count:1];
  int representsInternalModule = self->_representsInternalModule;
  if (representsInternalModule == 1 || (CFDataRef v6 = 0, representsInternalModule == 3)) {
    CFDataRef v6 = (const __CFData *)AMFDRSealingMapCopyLocalDataForClass();
  }
  if (!v3 || !v6)
  {
    if (v6)
    {
      if (v3)
      {
LABEL_24:
        int v24 = 0;
        goto LABEL_78;
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 7)
      {
        uint64_t v30 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        uint64_t v30 = MEMORY[0x263EF8438];
        id v31 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryAuthCP _fdrCertCheck].cold.9();
      }

      if (v3) {
        goto LABEL_24;
      }
    }
    if (gLogObjects && gNumLogObjects >= 7)
    {
      unsigned __int8 v32 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      unsigned __int8 v32 = MEMORY[0x263EF8438];
      id v33 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryAuthCP _fdrCertCheck].cold.7();
    }

    int v24 = 0;
    if (v6) {
      goto LABEL_79;
    }
    goto LABEL_80;
  }
  id v7 = [MEMORY[0x263F52F48] sharedManager];
  BOOL v8 = v7;
  if (!v7)
  {
    id v23 = logObjectForModule_1(6);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v38 = "error getting MFAACertificateManager";
LABEL_85:
      _os_log_impl(&dword_222CE3000, v23, OS_LOG_TYPE_DEFAULT, v38, buf, 2u);
    }
LABEL_86:
    int v10 = 0;
LABEL_87:
    int v12 = 0;
    goto LABEL_69;
  }
  uint64_t v9 = [v7 copyParsedCertificateChainInfo:v3];
  if (!v9)
  {
    id v23 = logObjectForModule_1(6);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v38 = "error parsing certificate";
      goto LABEL_85;
    }
    goto LABEL_86;
  }
  int v10 = (void *)v9;
  uint64_t v11 = [v8 copyEvaluatedCertificateChainInfo:v9];
  if (!v11)
  {
    id v23 = logObjectForModule_1(6);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CE3000, v23, OS_LOG_TYPE_DEFAULT, "error evaluating certificate", buf, 2u);
    }
    goto LABEL_87;
  }
  int v12 = (void *)v11;
  int v13 = objc_msgSend(MEMORY[0x263F52F48], "isMFi2_3CertInfo:", v11);
  int v14 = [MEMORY[0x263F52F48] isComponentCertInfo:v12];
  if (v13)
  {
    CFStringRef v40 = v4;
    CFStringRef v41 = v10;
    BytePtr = CFDataGetBytePtr(v3);
    int v16 = CFDataGetBytePtr(v6);
    size_t Length = CFDataGetLength(v3);
    CFIndex v18 = CFDataGetLength(v6);
    int v19 = v18;
    if (BytePtr && v16 && Length == v18)
    {
      int v20 = memcmp(BytePtr, v16, Length);
      if (gLogObjects) {
        BOOL v21 = gNumLogObjects <= 6;
      }
      else {
        BOOL v21 = 1;
      }
      int v22 = !v21;
      if (!v20)
      {
        uint64_t v4 = v40;
        int v10 = v41;
        if (v22)
        {
          id v23 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          id v23 = MEMORY[0x263EF8438];
          id v36 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          int v24 = 2;
          _os_log_impl(&dword_222CE3000, v23, OS_LOG_TYPE_DEFAULT, "AuthIC cert == FDR cert", buf, 2u);
        }
        else
        {
          int v24 = 2;
        }
        goto LABEL_76;
      }
      uint64_t v4 = v40;
      int v10 = v41;
      if (v22)
      {
        id v23 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        id v23 = MEMORY[0x263EF8438];
        id v35 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryAuthCP _fdrCertCheck]();
      }
      goto LABEL_69;
    }
    if (gLogObjects && gNumLogObjects >= 7)
    {
      id v23 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v23 = MEMORY[0x263EF8438];
      id v34 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109888;
      int v44 = v19;
      __int16 v45 = 1024;
      int v46 = Length;
      __int16 v47 = 2048;
      uint64_t v48 = BytePtr;
      __int16 v49 = 2048;
      uint64_t v50 = v16;
      _os_log_error_impl(&dword_222CE3000, v23, OS_LOG_TYPE_ERROR, "AuthIC/FDR cert comparison precondition failure. FDR cert len = %d  authIC cert len = %d pAuthChipCertDataBytes=0x%p pFdrCertDataBytes=0x%p", buf, 0x22u);
    }
    int v24 = 1;
    uint64_t v4 = v40;
LABEL_61:
    int v10 = v41;
LABEL_76:

    goto LABEL_77;
  }
  if (v14)
  {
    id v23 = [v8 copyParsedCertificateChainInfo:v6];
    if (v23)
    {
      CFStringRef v41 = v10;
      uint64_t v25 = (void *)[v8 copyEvaluatedCertificateChainInfo:v23];
      if (v25)
      {
        id v26 = v25;
        id v27 = [v25 objectForKey:@"LeafCertData"];
        long long v28 = [v12 objectForKey:@"LeafCertData"];
        int v29 = [v27 isEqualToData:v28];

        if (v29) {
          int v24 = 2;
        }
        else {
          int v24 = 1;
        }

        goto LABEL_61;
      }
      unint64_t v39 = logObjectForModule_1(6);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryAuthCP _fdrCertCheck].cold.6();
      }
    }
    else
    {
      unint64_t v39 = logObjectForModule_1(6);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryAuthCP _fdrCertCheck].cold.5();
      }
    }

LABEL_69:
    int v24 = 1;
    goto LABEL_76;
  }
  int v24 = 0;
LABEL_77:

LABEL_78:
  CFRelease(v3);
  if (v6) {
LABEL_79:
  }
    CFRelease(v6);
LABEL_80:

  return v24;
}

- (void)_incrementAuthStat:(const __CFString *)a3 dict:(__CFDictionary *)a4
{
  int valuePtr = -1431655766;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a4, a3);
  if (Value)
  {
    CFNumberRef v7 = Value;
    if (!CFNumberGetValue(Value, kCFNumberIntType, &valuePtr))
    {
      int v10 = logObjectForModule_1(6);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryAuthCP _incrementAuthStat:dict:]();
      }

      goto LABEL_5;
    }
    ++valuePtr;
    CFNumberRef v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
    if (v8)
    {
      CFNumberRef v7 = v8;
      CFDictionarySetValue(a4, a3, v8);
LABEL_5:
      CFRelease(v7);
      return;
    }
    uint64_t v9 = logObjectForModule_1(6);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryAuthCP _incrementAuthStat:dict:]();
    }
  }
  else
  {
    uint64_t v9 = logObjectForModule_1(6);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryAuthCP _incrementAuthStat:dict:]();
    }
  }
}

- (void)_validateAuthCPFlagsForCertificate
{
  if (!self->_fdrValidationStatus) {
    self->_fdrValidationStatus = [(ACCTransportIOAccessoryAuthCP *)self _fdrCertCheck];
  }
}

- (void)_publishAuth:(BOOL)a3 fdrStatus:(int)a4 trusted:(BOOL)a5 publishToUI:(BOOL)a6 ioconnect:(unsigned int)a7
{
  BOOL v8 = a6;
  unsigned int v9 = a5;
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (cpSetFdrValidationStatus(a7, a4))
  {
    if (gLogObjects) {
      BOOL v11 = gNumLogObjects < 7;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v13 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    else
    {
      int v13 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryAuthCP _publishAuth:fdrStatus:trusted:publishToUI:ioconnect:].cold.7();
    }
  }
  if (gLogObjects) {
    BOOL v14 = gNumLogObjects < 7;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    int v16 = MEMORY[0x263EF8438];
    id v15 = MEMORY[0x263EF8438];
  }
  else
  {
    int v16 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = "no";
    if (a4 == 2) {
      uint64_t v17 = "yes";
    }
    int v24 = 67109378;
    int v25 = a4;
    __int16 v26 = 2080;
    id v27 = v17;
    _os_log_impl(&dword_222CE3000, v16, OS_LOG_TYPE_DEFAULT, "authFlags need FDRValidation, FDRValidationStatus = %d, pass = %s", (uint8_t *)&v24, 0x12u);
  }

  if (cpSetTrustStatus(a7, v9))
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      CFIndex v18 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      CFIndex v18 = MEMORY[0x263EF8438];
      id v19 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryAuthCP _publishAuth:fdrStatus:trusted:publishToUI:ioconnect:].cold.4();
    }
  }
  if (gLogObjects && gNumLogObjects >= 7)
  {
    int v20 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    int v20 = MEMORY[0x263EF8438];
    id v21 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 67109376;
    int v25 = v8;
    __int16 v26 = 1024;
    LODWORD(v27) = v9;
    _os_log_impl(&dword_222CE3000, v20, OS_LOG_TYPE_DEFAULT, "publishToUI=%d, cpSetTrustStatusForUI=%d", (uint8_t *)&v24, 0xEu);
  }

  if (v8 && cpSetTrustStatusForUI(a7, v9))
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      int v22 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v22 = MEMORY[0x263EF8438];
      id v23 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryAuthCP _publishAuth:fdrStatus:trusted:publishToUI:ioconnect:]();
    }
  }
}

- (__CFDictionary)_copyOrCreateStatsSubDict:(__CFDictionary *)a3 forSerialNumber:(__CFString *)a4
{
  if (![(ACCTransportIOAccessoryAuthCP *)self _representsHardwareComponent]) {
    return 0;
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a3, a4);
  if (Value)
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, Value);
    if (!MutableCopy)
    {
      unsigned int v9 = logObjectForModule_1(6);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryAuthCP _copyOrCreateStatsSubDict:forSerialNumber:]();
      }

      return 0;
    }
  }
  else
  {
    int valuePtr = 0;
    MutableCopy = CFDictionaryCreateMutable(0, 0, 0, 0);
    if (MutableCopy)
    {
      CFNumberRef v10 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
      if (v10)
      {
        CFNumberRef v11 = v10;
        CFDictionarySetValue(MutableCopy, @"AuthPassedCount", v10);
        CFDictionarySetValue(MutableCopy, @"AuthFailedCount", v11);
        CFDictionarySetValue(MutableCopy, @"FDRPassedCount", v11);
        CFDictionarySetValue(MutableCopy, @"FDRFailedCount", v11);
        CFDictionarySetValue(MutableCopy, @"FDRUnknownCount", v11);
        CFRelease(v11);
        unsigned int v12 = self->_representsInternalModule - 1;
        if (v12 <= 2) {
          CFDictionarySetValue(MutableCopy, @"AccessoryType", off_26466C640[v12]);
        }
        int v13 = objc_alloc_init(MEMORY[0x263F08790]);
        [v13 setDateFormat:@"MM-dd-yyyy HH:mm:ss Z"];
        BOOL v14 = [MEMORY[0x263EFF910] date];
        id v15 = [v13 stringFromDate:v14];

        if (v15) {
          CFDictionarySetValue(MutableCopy, @"FirstAuthTimestamp", v15);
        }
      }
      else
      {
        int v13 = logObjectForModule_1(6);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryAuthCP _copyOrCreateStatsSubDict:forSerialNumber:]();
        }
      }
    }
    else
    {
      int v13 = logObjectForModule_1(6);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryAuthCP _copyOrCreateStatsSubDict:forSerialNumber:]();
      }
    }
  }
  return MutableCopy;
}

- (void)_publishAuthStats:(BOOL)a3 fdrStatus:(int)a4
{
  BOOL v5 = a3;
  if (![(ACCTransportIOAccessoryAuthCP *)self _representsHardwareComponent]) {
    return;
  }
  CFDictionaryRef v7 = (const __CFDictionary *)CFPreferencesCopyAppValue(@"AuthStats", @"com.apple.accessoryd");
  if (v7)
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v7);
    if (!MutableCopy)
    {
      unsigned int v9 = logObjectForModule_1(6);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryAuthCP _publishAuthStats:fdrStatus:].cold.6();
      }

      CFDictionaryRef v10 = v7;
      goto LABEL_54;
    }
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutable(0, 0, 0, 0);
    if (!MutableCopy)
    {
      __int16 v26 = logObjectForModule_1(6);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryAuthCP _publishAuthStats:fdrStatus:]();
      }

      return;
    }
  }
  if (self->_representsInternalModule == 2)
  {
    Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], @"N/A");
  }
  else
  {
    Copy = cpCopyCertificateSerialNumber([(ACCTransportIOAccessoryBase *)self ioService]);
    if (!Copy)
    {
      int v25 = logObjectForModule_1(6);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryAuthCP _publishAuthStats:fdrStatus:].cold.5();
      }

      unsigned int v12 = 0;
      goto LABEL_50;
    }
  }
  unsigned int v12 = [(ACCTransportIOAccessoryAuthCP *)self _copyOrCreateStatsSubDict:MutableCopy forSerialNumber:Copy];
  if (!v12)
  {
    int v24 = logObjectForModule_1(6);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryAuthCP _publishAuthStats:fdrStatus:]();
    }

    if (Copy) {
      goto LABEL_49;
    }
    goto LABEL_50;
  }
  if (v5) {
    int v13 = @"AuthPassedCount";
  }
  else {
    int v13 = @"AuthFailedCount";
  }
  [(ACCTransportIOAccessoryAuthCP *)self _incrementAuthStat:v13 dict:v12];
  int representsInternalModule = self->_representsInternalModule;
  switch(representsInternalModule)
  {
    case 1:
      id v15 = @"CertificateSupportsBattery";
      if (MFAAIsAppleBatteryModule())
      {
LABEL_19:
        if (gLogObjects && gNumLogObjects >= 7)
        {
          int v16 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          int v16 = MEMORY[0x263EF8438];
          id v21 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_222CE3000, v16, OS_LOG_TYPE_DEFAULT, "Success for auth stats: Cert caps show Internal Module, and certificate contains module bit", buf, 2u);
        }

        int v20 = (const void **)MEMORY[0x263EFFB40];
        goto LABEL_42;
      }
      break;
    case 2:
      char v17 = 0;
      id v15 = @"CertificateSupportsVeridian";
      goto LABEL_26;
    case 3:
      id v15 = @"CertificateSupportsTouchController";
      if (MFAAIsAppleTouchControllerModule()) {
        goto LABEL_19;
      }
      break;
    default:
      id v15 = 0;
      char v17 = 1;
      goto LABEL_26;
  }
  char v17 = 0;
LABEL_26:
  if (gLogObjects && gNumLogObjects >= 7)
  {
    CFIndex v18 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    CFIndex v18 = MEMORY[0x263EF8438];
    id v19 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v27 = 0;
    _os_log_impl(&dword_222CE3000, v18, OS_LOG_TYPE_DEFAULT, "Failure for auth stats: Cert caps show Internal Module, but certificate does not contain module bit", v27, 2u);
  }

  if ((v17 & 1) == 0)
  {
    int v20 = (const void **)MEMORY[0x263EFFB38];
LABEL_42:
    CFDictionarySetValue(v12, v15, *v20);
  }
  int v22 = @"FDRUnknownCount";
  if (a4 == 2) {
    int v22 = @"FDRPassedCount";
  }
  if (a4 == 1) {
    id v23 = @"FDRFailedCount";
  }
  else {
    id v23 = v22;
  }
  [(ACCTransportIOAccessoryAuthCP *)self _incrementAuthStat:v23 dict:v12];
  CFDictionarySetValue(MutableCopy, Copy, v12);
  CFPreferencesSetValue(@"AuthStats", MutableCopy, @"com.apple.accessoryd", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  if (Copy) {
LABEL_49:
  }
    CFRelease(Copy);
LABEL_50:
  if (v7) {
    CFRelease(v7);
  }
  CFRelease(MutableCopy);
  if (v12)
  {
    CFDictionaryRef v10 = v12;
LABEL_54:
    CFRelease(v10);
  }
}

- (void)_logToAnalytics
{
  v52[6] = *MEMORY[0x263EF8340];
  BOOL v3 = [(ACCTransportIOAccessoryBase *)self primaryPortNumber] == 512
    && self->_representsInductiveTransport;
  unint64_t CurrentUnixTimeMS = systemInfo_getCurrentUnixTimeMS();
  unint64_t authTimerStartTimestamp = self->_authTimerStartTimestamp;
  BOOL v5 = (void *)MEMORY[0x263EFF9A0];
  CFDataRef v6 = @"Failed";
  if (!self->_authErrorDescription) {
    CFDataRef v6 = @"Passed";
  }
  v52[0] = v6;
  v51[0] = @"authState";
  v51[1] = @"authTries";
  CFDictionaryRef v7 = [NSNumber numberWithInt:self->_authTryCurrent];
  v52[1] = v7;
  v51[2] = @"authErrorDescription";
  uint64_t authErrorDescription = self->_authErrorDescription;
  if (authErrorDescription > 0x1D) {
    unsigned int v9 = "UninitializedAuthError";
  }
  else {
    unsigned int v9 = kACCTransport_IOAccessoryAuthCP_AuthError_Strings[authErrorDescription];
  }
  CFDictionaryRef v10 = [NSString stringWithUTF8String:v9];
  void v52[2] = v10;
  v51[3] = @"authCertCached";
  CFNumberRef v11 = [NSNumber numberWithBool:self->_certIsCached];
  v52[3] = v11;
  v51[4] = @"isInductive";
  unsigned int v12 = [NSNumber numberWithBool:v3];
  v52[4] = v12;
  v51[5] = @"isPeriodic";
  int v13 = [NSNumber numberWithBool:0];
  v52[5] = v13;
  BOOL v14 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:6];
  id v15 = [v5 dictionaryWithDictionary:v14];

  if (systemInfo_isInternalBuild() && self->_forcedReAuthCount)
  {
    int v16 = objc_msgSend(NSNumber, "numberWithInt:");
    [v15 setObject:v16 forKey:@"forcedReAuthCount"];
  }
  unint64_t v17 = CurrentUnixTimeMS - authTimerStartTimestamp;
  if (v3)
  {
    CFNumberRef BucketizedInductiveAuthDuration = acc_analytics_createBucketizedInductiveAuthDuration(v17 / 0x3E8);
    id v19 = @"inductiveAuthDuration";
  }
  else
  {
    CFNumberRef BucketizedInductiveAuthDuration = acc_analytics_createBucketizedWiredAuthDuration(v17);
    id v19 = @"wiredAuthDuration";
  }
  [v15 setObject:BucketizedInductiveAuthDuration forKey:v19];

  if ([(ACCTransportIOAccessoryAuthCP *)self _representsHardwareComponent])
  {
    unsigned int representsInternalModule = self->_representsInternalModule;
    if (representsInternalModule - 2 >= 2)
    {
      if (representsInternalModule != 1)
      {
LABEL_20:
        int v22 = NSString;
        unsigned int v23 = [(ACCTransportIOAccessoryAuthCP *)self fdrValidationStatus];
        if (v23 > 2) {
          int v24 = "AuthSuccess";
        }
        else {
          int v24 = kACCTransport_IOAccessoryAuthCP_FDRStatus_Strings[v23];
        }
        int v25 = [v22 stringWithUTF8String:v24];
        [v15 setObject:v25 forKey:@"FDRStatus"];

        __int16 v26 = [MEMORY[0x263F08AB0] processInfo];
        [v26 systemUptime];
        double v28 = v27;

        int v29 = [NSNumber numberWithDouble:v28];
        [v15 setObject:v29 forKey:@"Uptime"];

        uint64_t v30 = [NSNumber numberWithBool:_checkSpringBoardStarted()];
        [v15 setObject:v30 forKey:@"SpringBoardStarted"];

        goto LABEL_24;
      }
      id v21 = [NSNumber numberWithBool:1];
      [v15 setObject:v21 forKey:@"isBatteryModule"];

      unsigned int representsInternalModule = self->_representsInternalModule;
    }
    [v15 setObject:*((void *)&kACCTransportIOAccessoryAuthCPInternalModule_Strings + representsInternalModule) forKey:@"internalModuleType"];
    goto LABEL_20;
  }
LABEL_24:
  id v31 = +[ACCTransportIOAccessorySharedManager sharedManager];
  unsigned __int8 v32 = objc_msgSend(v31, "managerForIOAccessoryManagerService:", -[ACCTransportIOAccessoryBase upstreamManagerService](self, "upstreamManagerService"));

  if (v32)
  {
    id v33 = [v32 deviceName];

    if (v33)
    {
      id v34 = [v32 deviceName];
      [v15 setObject:v34 forKey:@"accessoryName"];
    }
    id v35 = [v32 deviceVendorName];

    if (v35)
    {
      id v36 = [v32 deviceVendorName];
      [v15 setObject:v36 forKey:@"accessoryManufacturer"];
    }
    uint64_t v37 = [v32 deviceModelNumber];

    if (v37)
    {
      uint64_t v38 = [v32 deviceModelNumber];
      [v15 setObject:v38 forKey:@"accessoryModel"];
    }
    unint64_t v39 = [v32 deviceHardwareRevision];

    if (v39)
    {
      CFStringRef v40 = [v32 deviceHardwareRevision];
      [v15 setObject:v40 forKey:@"accessoryHardwareVersion"];
    }
    CFStringRef v41 = [v32 deviceFirmwareRevision];

    if (v41)
    {
      CFComparisonResult v42 = [v32 deviceFirmwareRevision];
      [v15 setObject:v42 forKey:@"accessoryFirmwareVersionActive"];
    }
  }
  if (gLogObjects && gNumLogObjects >= 7)
  {
    uint64_t v43 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v43 = MEMORY[0x263EF8438];
    id v44 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v48 = @"com.apple.accessories.authCPEvent";
    __int16 v49 = 2112;
    uint64_t v50 = v15;
    _os_log_impl(&dword_222CE3000, v43, OS_LOG_TYPE_DEFAULT, "CoreAnalytics event: %@\neventDict: %@", buf, 0x16u);
  }

  AnalyticsSendEvent();
  __int16 v45 = +[ACCAnalytics loggerForUser:1];
  [v45 logACCAnalyticsForEventNamed:@"accessoryAuthCPEvent" withAttributes:v15];
}

- (BOOL)_representsHardwareComponent
{
  return (self->_representsInternalModule - 1) < 3;
}

- (ACCTransportIOAccessoryAuthCPProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACCTransportIOAccessoryAuthCPProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int)authStatus
{
  return self->_authStatus;
}

- (BOOL)authTimedOut
{
  return self->_authTimedOut;
}

- (NSData)pAuthCertificate
{
  return self->_pAuthCertificate;
}

- (BOOL)representsInductiveTransport
{
  return self->_representsInductiveTransport;
}

- (void)setRepresentsInductiveTransport:(BOOL)a3
{
  self->_representsInductiveTransport = a3;
}

- (int)representsInternalModule
{
  return self->_representsInternalModule;
}

- (void)setRepresentsInternalModule:(int)a3
{
  self->_unsigned int representsInternalModule = a3;
}

- (int)accConnectionType
{
  return self->_accConnectionType;
}

- (void)setAccConnectionType:(int)a3
{
  self->_accConnectionType = a3;
}

- (NSString)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
}

- (NSString)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
}

- (int)authType
{
  return self->_authType;
}

- (OS_dispatch_queue)authWorkQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAuthWorkQueue:(id)a3
{
}

- (OS_dispatch_source)authTimerSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAuthTimerSource:(id)a3
{
}

- (unsigned)authTryCurrent
{
  return self->_authTryCurrent;
}

- (void)setAuthTryCurrent:(unsigned __int8)a3
{
  self->_int authTryCurrent = a3;
}

- (unsigned)authTryMaximum
{
  return self->_authTryMaximum;
}

- (void)setAuthTryMaximum:(unsigned __int8)a3
{
  self->_int authTryMaximum = a3;
}

- (unsigned)authVersionMajor
{
  return self->_authVersionMajor;
}

- (void)setAuthVersionMajor:(unsigned __int8)a3
{
  self->_int authVersionMajor = a3;
}

- (unsigned)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(unsigned __int16)a3
{
  self->_int deviceID = a3;
}

- (_AuthCertCapsInt_t)authCertCaps
{
  objc_copyStruct(retstr, &self->_authCertCaps, 32, 1, 0);
  return result;
}

- (void)setAuthCertCaps:(_AuthCertCapsInt_t *)a3
{
}

- (const)pAuthCertCache
{
  return self->_pAuthCertCache;
}

- (void)setPAuthCertCache:(const void *)a3
{
  self->_pAuthCertCache = a3;
}

- (unsigned)ioServiceUpstream
{
  return self->_ioServiceUpstream;
}

- (void)setIoServiceUpstream:(unsigned int)a3
{
  self->_io_object_t ioServiceUpstream = a3;
}

- (BOOL)bIsShuttingDown
{
  return self->_bIsShuttingDown;
}

- (void)setBIsShuttingDown:(BOOL)a3
{
  self->_bIsShuttingDown = a3;
}

- (int)certType
{
  return self->_certType;
}

- (void)setCertType:(int)a3
{
  self->_int certType = a3;
}

- (NSDictionary)certInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCertInfo:(id)a3
{
}

- (unsigned)authFlags
{
  return self->_authFlags;
}

- (void)setAuthFlags:(unsigned int)a3
{
  self->_authFlags = a3;
}

- (unint64_t)authTimerStartTimestamp
{
  return self->_authTimerStartTimestamp;
}

- (void)setAuthTimerStartTimestamp:(unint64_t)a3
{
  self->_unint64_t authTimerStartTimestamp = a3;
}

- (int)fdrValidationStatus
{
  return self->_fdrValidationStatus;
}

- (void)setFdrValidationStatus:(int)a3
{
  self->_fdrValidationStatus = a3;
}

- (int)authErrorDescription
{
  return self->_authErrorDescription;
}

- (void)setAuthErrorDescription:(int)a3
{
  self->_uint64_t authErrorDescription = a3;
}

- (unsigned)forcedReAuthCount
{
  return self->_forcedReAuthCount;
}

- (void)setForcedReAuthCount:(unsigned int)a3
{
  self->_forcedReAuthCount = a3;
}

- (BOOL)certIsCached
{
  return self->_certIsCached;
}

- (void)setCertIsCached:(BOOL)a3
{
  self->_certIsCached = a3;
}

- (unsigned)softwareErrorRetry
{
  return self->_softwareErrorRetry;
}

- (void)setSoftwareErrorRetry:(unsigned __int8)a3
{
  self->_softwareErrorRetry = a3;
}

- (IONotificationPort)batteryNotifyPortRef
{
  return self->_batteryNotifyPortRef;
}

- (void)setBatteryNotifyPortRef:(IONotificationPort *)a3
{
  self->_batteryNotifyPortRef = a3;
}

- (unsigned)battery_iter
{
  return self->_battery_iter;
}

- (void)setBattery_iter:(unsigned int)a3
{
  self->_battery_iter = a3;
}

- (IONotificationPort)transportNotifyPortRef
{
  return self->_transportNotifyPortRef;
}

- (void)setTransportNotifyPortRef:(IONotificationPort *)a3
{
  self->_transportNotifyPortRef = a3;
}

- (OS_dispatch_semaphore)pairedSema
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 200, 1);
}

- (void)setPairedSema:(id)a3
{
}

- (BOOL)notificationsAvailable
{
  return self->_notificationsAvailable;
}

- (void)setNotificationsAvailable:(BOOL)a3
{
  self->_notificationsAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedSema, 0);
  objc_storeStrong((id *)&self->_certInfo, 0);
  objc_storeStrong((id *)&self->_authTimerSource, 0);
  objc_storeStrong((id *)&self->_authWorkQueue, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_pAuthCertificate, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:andIOService:connectionType:.cold.1()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11_0(&dword_222CE3000, v0, v1, "super initWithIOAccessoryClass:NULL", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:andIOService:connectionType:.cold.3()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11_0(&dword_222CE3000, v0, v1, "CFStringGetCStringPtr pkStrWorkQueueName:NULL", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:andIOService:connectionType:.cold.5()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11_0(&dword_222CE3000, v0, v1, "dispatch_queue_create _authWorkQueue:NULL, revoking all features", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:andIOService:connectionType:.cold.7()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11_0(&dword_222CE3000, v0, v1, "createCertificateCache pAuthCertCache:NULL", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:(uint64_t)a3 andIOService:(uint64_t)a4 connectionType:(uint64_t)a5 .cold.10(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDelegate:andIOService:connectionType:.cold.12()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11_0(&dword_222CE3000, v0, v1, "CFStringCreateMutableCopy pCFStrWorkQueueName:NULL", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:andIOService:connectionType:.cold.14()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, "IOServiceOpen failed %#x, cannot create ACCTransportIOAccessoryAuthCP", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:(uint64_t)a3 andIOService:(uint64_t)a4 connectionType:(uint64_t)a5 .cold.16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_authInternalModuleWithCert:(uint64_t)a3 withError:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_authInternalModuleWithCert:withError:.cold.5()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9(&dword_222CE3000, v0, v1, "(module:%{public}@) %s: timed_out", v2, v3, v4, v5, v6);
}

- (void)_authWithAuthIC:withCert:withError:.cold.1()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11_0(&dword_222CE3000, v0, v1, "createRandomNonce pkNonceData = NULL", v2, v3, v4, v5, v6);
}

- (void)_authWithAuthIC:withCert:withError:.cold.3()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, "cpCreateSignature fail ioretStatus:%02X", v2, v3, v4, v5, v6);
}

- (void)_authWithAuthIC:(unsigned __int8 *)a1 withCert:(uint64_t)a2 withError:(NSObject *)a3 .cold.5(unsigned __int8 *a1, uint64_t a2, NSObject *a3)
{
  LOWORD(v3) = 1024;
  HIWORD(v3) = *a1;
  OUTLINED_FUNCTION_7(&dword_222CE3000, a2, a3, "Auth version mismatch certAuthVerMajor:%02X != authCPVerMajor:%02X", 67109376, v3);
}

- (void)_authWithAuthIC:(char)a1 withCert:(int *)a2 withError:(os_log_t)log .cold.6(char a1, int *a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v3 = *a2;
  int v4 = 136315906;
  uint64_t v5 = "-[ACCTransportIOAccessoryAuthCP _authWithAuthIC:withCert:withError:]";
  __int16 v6 = 1024;
  int v7 = 1181;
  __int16 v8 = 1024;
  int v9 = a1 & 1;
  __int16 v10 = 1024;
  int v11 = v3;
  _os_log_debug_impl(&dword_222CE3000, log, OS_LOG_TYPE_DEBUG, "%s:%d bAuthContinue = %d, _int certType = %d", (uint8_t *)&v4, 0x1Eu);
}

void __59__ACCTransportIOAccessoryAuthCP_startAuthenticationProcess__block_invoke_cold_3(uint8_t *a1, id *a2, _DWORD *a3, NSObject *a4)
{
  int v7 = [*a2 ioService];
  *(_DWORD *)a1 = 67109120;
  *a3 = v7;
  _os_log_error_impl(&dword_222CE3000, a4, OS_LOG_TYPE_ERROR, "AuthCP service:%4d: Skip auth since auth already passed", a1, 8u);
}

- (void)_handleAuthDeviceInfo:versionMajor:versionMinor:.cold.1()
{
  LODWORD(v3) = 136315650;
  OUTLINED_FUNCTION_10_0();
  HIWORD(v5) = v0;
  OUTLINED_FUNCTION_21(&dword_222CE3000, v1, v2, "%s Invalid auth version authVerMajor:%02X, authVerMinor:%02X", v3, v4, v5);
}

- (void)_handleAuthDeviceInfo:versionMajor:versionMinor:.cold.3()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_1(&dword_222CE3000, v0, v1, "%s Auth device info read failed ioretStatus:%02X", v2, v3, v4, v5, 2u);
}

- (void)_handleAuthCertificate:(uint64_t)a3 serialNumber:(uint64_t)a4 authError:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_2(&dword_222CE3000, a1, a3, "%s pCFCertData = NULL", a5, a6, a7, a8, 2u);
}

- (void)_handleAuthCertificate:(uint64_t)a3 serialNumber:(uint64_t)a4 authError:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_2(&dword_222CE3000, a1, a3, "%s createCertificateSerialNumber returned pCFDataSerNum:NULL", a5, a6, a7, a8, 2u);
}

- (void)_handleAuthCertificate:(uint64_t)a3 serialNumber:(uint64_t)a4 authError:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_2(&dword_222CE3000, a1, a3, "%s createSerialNumberStringFromData returned pCFStrSerNumFromCert:NULL", a5, a6, a7, a8, 2u);
}

- (void)_handleAuthCertificate:(uint64_t)a3 serialNumber:(uint64_t)a4 authError:(uint64_t)a5 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_finishAuthentication:authCert:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, " cpSetAuthFullPass() failed (ret=0x%x)", v2, v3, v4, v5, v6);
}

- (void)_finishAuthentication:(NSObject *)a3 authCert:.cold.6(void *a1, int a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [a1 ioService];
  OUTLINED_FUNCTION_5_0();
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl(&dword_222CE3000, a3, OS_LOG_TYPE_ERROR, "ERROR: Failed to register for notifactions from AppleAuthCP ioService:%04X, fail status:%04X\n", v5, 0xEu);
}

- (void)_finishAuthentication:authCert:.cold.8()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, " cpSetAuthStatus() failed (ret=0x%x)", v2, v3, v4, v5, v6);
}

- (void)_finishAuthentication:(NSObject *)a3 authCert:.cold.11(uint64_t a1, uint64_t a2, NSObject *a3)
{
}

- (void)_validateCertCapsForCertificate:authError:.cold.1()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11_0(&dword_222CE3000, v0, v1, "createCapsFromAuthCert pkAuthCertCaps:NULL", v2, v3, v4, v5, v6);
}

- (void)_validateCertCapsForCertificate:authError:.cold.6()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11_0(&dword_222CE3000, v0, v1, "Auth cert capability bCanChargeInductive:0", v2, v3, v4, v5, v6);
}

- (void)_fdrCertCheck
{
  OUTLINED_FUNCTION_4_2(&dword_222CE3000, a2, a3, "AMFDRSealingMapCopyLocalDataForClass returned error = %@", a5, a6, a7, a8, 2u);
}

- (void)_incrementAuthStat:dict:.cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4_2(&dword_222CE3000, v0, v1, "_incrementAuthStat: Failed to find key %@ in AuthStats dictionary", v2, v3, v4, v5, v6);
}

- (void)_incrementAuthStat:dict:.cold.2()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4_2(&dword_222CE3000, v0, v1, "_incrementAuthStat: CFNumberGetValue() failed for key %@", v2, v3, v4, v5, v6);
}

- (void)_incrementAuthStat:dict:.cold.3()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4_2(&dword_222CE3000, v0, v1, "_incrementAuthStat: CFNumberCreate() failed for key %@", v2, v3, v4, v5, v6);
}

- (void)_publishAuth:fdrStatus:trusted:publishToUI:ioconnect:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, " cpSetTrustStatusForUI() failed (ret=0x%x)", v2, v3, v4, v5, v6);
}

- (void)_publishAuth:fdrStatus:trusted:publishToUI:ioconnect:.cold.4()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, " cpSetTrustStatus() failed (ret=0x%x)", v2, v3, v4, v5, v6);
}

- (void)_publishAuth:fdrStatus:trusted:publishToUI:ioconnect:.cold.7()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, " cpSetFdrValidationStatus() failed (ret=0x%x)", v2, v3, v4, v5, v6);
}

- (void)_copyOrCreateStatsSubDict:forSerialNumber:.cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4_2(&dword_222CE3000, v0, v1, "_copyOrCreateStatsSubDict: Failed to create sub-dictionary associated with certSn = %@", v2, v3, v4, v5, v6);
}

- (void)_copyOrCreateStatsSubDict:forSerialNumber:.cold.2()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11_0(&dword_222CE3000, v0, v1, "_copyOrCreateStatsSubDict: Failed to create valueObj", v2, v3, v4, v5, v6);
}

- (void)_copyOrCreateStatsSubDict:forSerialNumber:.cold.3()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11_0(&dword_222CE3000, v0, v1, "_copyOrCreateStatsSubDict: Failed to create a mutable copy of pStatsSubDict", v2, v3, v4, v5, v6);
}

- (void)_publishAuthStats:fdrStatus:.cold.1()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11_0(&dword_222CE3000, v0, v1, "_publishAuthStats: Failed to create AuthStats dictionary", v2, v3, v4, v5, v6);
}

- (void)_publishAuthStats:fdrStatus:.cold.2()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11_0(&dword_222CE3000, v0, v1, "_publishAuthStats: pStatsSubDictMutable == NULL", v2, v3, v4, v5, v6);
}

- (void)_publishAuthStats:fdrStatus:.cold.5()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11_0(&dword_222CE3000, v0, v1, "_publishAuthStats: pCFStrSerNum == NULL", v2, v3, v4, v5, v6);
}

- (void)_publishAuthStats:fdrStatus:.cold.6()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11_0(&dword_222CE3000, v0, v1, "_publishAuthStats: Failed to create a mutable copy of pAuthStatsDict", v2, v3, v4, v5, v6);
}

@end