@interface CUTWiFiManager
+ (id)sharedInstance;
- (BOOL)_isPrimaryCellular;
- (BOOL)autoAssociateWiFi;
- (BOOL)autoAssociateWiFiAsForegroundClient;
- (BOOL)hasWiFiAutoAssociationClientToken:(id)a3;
- (BOOL)hasWoWClient:(id)a3;
- (BOOL)isHostingWiFiHotSpot;
- (BOOL)isPrimaryCellularCached;
- (BOOL)isWiFiAssociated;
- (BOOL)isWiFiCaptive;
- (BOOL)isWiFiEnabled;
- (BOOL)isWoWEnabled;
- (BOOL)isWoWSupported;
- (BOOL)willTryToAutoAssociateWiFiNetwork;
- (BOOL)willTryToSearchForWiFiNetwork;
- (CUTWiFiManager)init;
- (NSDictionary)lastWiFiPowerInfo;
- (NSHashTable)delegateMap;
- (NSHashTable)wowClients;
- (NSMutableSet)wiFiAutoAssociationTokens;
- (NSNumber)wiFiScaledRSSI;
- (NSNumber)wiFiScaledRate;
- (NSNumber)wiFiSignalStrength;
- (NSRecursiveLock)lock;
- (NSRunLoop)wifiRunLoop;
- (NSString)currentSSID;
- (NSThread)wifiThread;
- (OS_dispatch_queue)incomingCallbacksQueue;
- (__CFRunLoopSource)runLoopSource;
- (double)_wifiMeasurementErrorForInterval:(double)a3;
- (id)_ssidFromNetwork:(__WiFiNetwork *)a3;
- (int)linkToken;
- (void)_adjustWiFiAutoAssociation;
- (void)_adjustWiFiAutoAssociationLocked;
- (void)_adjustWoWState;
- (void)_createDynamicStore;
- (void)_handleDeviceAttachedCallback;
- (void)_handleDevicePowerCallback;
- (void)_handleHostAPStateChangedCallback;
- (void)_handlePotentialDeviceChange:(__WiFiDeviceClient *)a3;
- (void)_performBackgroundInit;
- (void)_performCurrentNetworkBlock:(id)a3;
- (void)_performCurrentNetworkBlock:(id)a3 withDevice:(__WiFiDeviceClient *)a4;
- (void)_performCurrentNetworkBlock:(id)a3 withDevice:(__WiFiDeviceClient *)a4 async:(BOOL)a5;
- (void)_performDeviceBlock:(id)a3;
- (void)_performDeviceBlock:(id)a3 useCache:(BOOL)a4;
- (void)_performPowerReading;
- (void)_setCurrentNetwork:(__WiFiNetwork *)a3;
- (void)_setupWifiNotifications;
- (void)_threadedMain;
- (void)_updateInitialWiFiState;
- (void)_updateIsWiFiAssociatedAsync:(BOOL)a3;
- (void)_updateIsWiFiEnabled;
- (void)addDelegate:(id)a3;
- (void)addWiFiAutoAssociationClientToken:(id)a3;
- (void)addWoWClient:(id)a3;
- (void)currentNetwork;
- (void)currentWiFiNetworkPowerUsageWithCompletion:(id)a3;
- (void)dealloc;
- (void)dynamicStore;
- (void)removeDelegate:(id)a3;
- (void)removeWiFiAutoAssociationClientToken:(id)a3;
- (void)removeWoWClient:(id)a3;
- (void)setAutoAssociateWiFiAsForegroundClient:(BOOL)a3;
- (void)setCurrentNetwork:(void *)a3;
- (void)setDelegateMap:(id)a3;
- (void)setDynamicStore:(void *)a3;
- (void)setIncomingCallbacksQueue:(id)a3;
- (void)setIsPrimaryCellularCached:(BOOL)a3;
- (void)setLastWiFiPowerInfo:(id)a3;
- (void)setLinkToken:(int)a3;
- (void)setLock:(id)a3;
- (void)setRunLoopSource:(__CFRunLoopSource *)a3;
- (void)setWiFiAutoAssociationTokens:(id)a3;
- (void)setWifiDevice:(void *)a3;
- (void)setWifiManager:(void *)a3;
- (void)setWifiRunLoop:(id)a3;
- (void)setWifiThread:(id)a3;
- (void)setWowClients:(id)a3;
- (void)showNetworkOptions;
- (void)wifiDevice;
- (void)wifiManager;
@end

@implementation CUTWiFiManager

+ (id)sharedInstance
{
  if (qword_1EB272A90 != -1) {
    dispatch_once(&qword_1EB272A90, &unk_1EF6C42E0);
  }
  v2 = (void *)qword_1EB272A80;
  return v2;
}

- (void)_threadedMain
{
  v3 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  wifiRunLoop = self->_wifiRunLoop;
  self->_wifiRunLoop = v3;

  memset(&context, 0, sizeof(context));
  self->_runLoopSource = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &context);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, self->_runLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  while (1)
  {
    v6 = (void *)MEMORY[0x1A6249B10]();
    CFRunLoopRun();
  }
}

- (void)_performBackgroundInit
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->_lock lock];
  v3 = +[CUTLog network];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3554000, v3, OS_LOG_TYPE_DEFAULT, "Creating wifi manager", buf, 2u);
  }

  [(CUTWiFiManager *)self _setupWifiNotifications];
  v4 = +[CUTLog network];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    wifiManager = (const char *)self->_wifiManager;
    wifiDevice = self->_wifiDevice;
    *(_DWORD *)buf = 138543619;
    v12 = wifiManager;
    __int16 v13 = 2113;
    v14 = wifiDevice;
    _os_log_impl(&dword_1A3554000, v4, OS_LOG_TYPE_DEFAULT, " => Done: %{public}@   (Current device: %{private}@)", buf, 0x16u);
  }

  [(CUTWiFiManager *)self _createDynamicStore];
  [(NSRecursiveLock *)self->_lock unlock];
  v7 = +[CUTLog network];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[CUTWiFiManager _performBackgroundInit]";
    _os_log_impl(&dword_1A3554000, v7, OS_LOG_TYPE_DEFAULT, "%s Running network block sync", buf, 0xCu);
  }

  [(CUTWiFiManager *)self _updateIsWiFiAssociatedAsync:0];
  v8 = +[CUTLog network];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3554000, v8, OS_LOG_TYPE_DEFAULT, " => Done running network block", buf, 2u);
  }

  v9 = dispatch_get_global_queue(0, 0);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_1A355E4B0;
  handler[3] = &unk_1E5AFEDC0;
  handler[4] = self;
  notify_register_dispatch("com.apple.wifi.linkdidchange", &self->_linkToken, v9, handler);
}

- (CUTWiFiManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)CUTWiFiManager;
  v2 = [(CUTWiFiManager *)&v10 init];
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    lock = v2->_lock;
    v2->_lock = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.cutwifimanager.callbacks", 0);
    incomingCallbacksQueue = v2->_incomingCallbacksQueue;
    v2->_incomingCallbacksQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F29060]) initWithTarget:v2 selector:sel__threadedMain object:0];
    wifiThread = v2->_wifiThread;
    v2->_wifiThread = (NSThread *)v7;

    [(NSThread *)v2->_wifiThread setName:@"CommonUtilities-WiFi-Thread"];
    [(NSThread *)v2->_wifiThread start];
    [(NSRecursiveLock *)v2->_lock lock];
    v2->_wifiManager = (void *)WiFiManagerClientCreate();
    [(CUTWiFiManager *)v2 _updateInitialWiFiState];
    [(NSRecursiveLock *)v2->_lock unlock];
    [(CUTWiFiManager *)v2 performSelector:sel__performBackgroundInit onThread:v2->_wifiThread withObject:0 waitUntilDone:0];
  }
  return v2;
}

- (void)dealloc
{
  [(NSRecursiveLock *)self->_lock lock];
  [(NSMutableSet *)self->_wiFiAutoAssociationTokens removeAllObjects];
  [(CUTWiFiManager *)self _adjustWiFiAutoAssociation];
  [(CUTWiFiManager *)self _handlePotentialDeviceChange:0];
  dynamicStore = self->_dynamicStore;
  if (dynamicStore) {
    CFRelease(dynamicStore);
  }
  wifiDevice = self->_wifiDevice;
  if (wifiDevice) {
    CFRelease(wifiDevice);
  }
  wifiManager = self->_wifiManager;
  if (wifiManager) {
    CFRelease(wifiManager);
  }
  notify_cancel(self->_linkToken);
  runLoopSource = self->_runLoopSource;
  if (runLoopSource)
  {
    CFRunLoopSourceInvalidate(runLoopSource);
    CFRelease(self->_runLoopSource);
  }
  [(NSThread *)self->_wifiThread cancel];
  [(NSRecursiveLock *)self->_lock unlock];
  v7.receiver = self;
  v7.super_class = (Class)CUTWiFiManager;
  [(CUTWiFiManager *)&v7 dealloc];
}

- (void)addDelegate:(id)a3
{
  id v7 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  if (![(NSHashTable *)self->_delegateMap containsObject:v7])
  {
    delegateMap = self->_delegateMap;
    if (!delegateMap)
    {
      dispatch_queue_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      v6 = self->_delegateMap;
      self->_delegateMap = v5;

      delegateMap = self->_delegateMap;
    }
    [(NSHashTable *)delegateMap addObject:v7];
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)removeDelegate:(id)a3
{
  if (a3)
  {
    lock = self->_lock;
    id v5 = a3;
    [(NSRecursiveLock *)lock lock];
    [(NSHashTable *)self->_delegateMap removeObject:v5];

    if (![(NSHashTable *)self->_delegateMap count])
    {
      delegateMap = self->_delegateMap;
      self->_delegateMap = 0;
    }
    id v7 = self->_lock;
    [(NSRecursiveLock *)v7 unlock];
  }
}

- (void)addWoWClient:(id)a3
{
  id v8 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  NSUInteger v4 = [(NSHashTable *)self->_wowClients count];
  if (![(NSHashTable *)self->_wowClients containsObject:v8])
  {
    wowClients = self->_wowClients;
    if (!wowClients)
    {
      v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v7 = self->_wowClients;
      self->_wowClients = v6;

      wowClients = self->_wowClients;
    }
    [(NSHashTable *)wowClients addObject:v8];
    if (!v4) {
      [(CUTWiFiManager *)self _adjustWoWState];
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)removeWoWClient:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSRecursiveLock *)lock lock];
  NSUInteger v6 = [(NSHashTable *)self->_wowClients count];
  [(NSHashTable *)self->_wowClients removeObject:v5];

  if (![(NSHashTable *)self->_wowClients count])
  {
    wowClients = self->_wowClients;
    self->_wowClients = 0;

    if (v6) {
      [(CUTWiFiManager *)self _adjustWoWState];
    }
  }
  id v8 = self->_lock;
  [(NSRecursiveLock *)v8 unlock];
}

- (BOOL)hasWoWClient:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSRecursiveLock *)lock lock];
  LOBYTE(lock) = [(NSHashTable *)self->_wowClients containsObject:v5];

  [(NSRecursiveLock *)self->_lock unlock];
  return (char)lock;
}

- (void)_adjustWoWState
{
  if (self->_wifiManager)
  {
    BOOL v3 = [(NSHashTable *)self->_wowClients count] != 0;
    wifiManager = self->_wifiManager;
    MEMORY[0x1F412FF48](wifiManager, v3);
  }
}

- (void)_setupWifiNotifications
{
  if (self->_wifiManager)
  {
    WiFiManagerClientRegisterDeviceAttachmentCallback();
    WiFiManagerClientRegisterNotificationCallback();
    Current = CFRunLoopGetCurrent();
    WiFiManagerClientScheduleWithRunLoop();
    CFRunLoopWakeUp(Current);
    [(CUTWiFiManager *)self _updateInitialWiFiState];
  }
  else
  {
    NSUInteger v4 = +[CUTLog network];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1A35650D0();
    }
  }
}

- (void)_updateInitialWiFiState
{
  if (self->_wifiManager)
  {
    [(NSRecursiveLock *)self->_lock lock];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = sub_1A355EBF8;
    v4[3] = &unk_1E5AFEDE8;
    v4[4] = self;
    [(CUTWiFiManager *)self _performDeviceBlock:v4 useCache:0];
    [(CUTWiFiManager *)self _adjustWoWState];
    [(CUTWiFiManager *)self _adjustWiFiAutoAssociationLocked];
    [(NSRecursiveLock *)self->_lock unlock];
  }
  else
  {
    BOOL v3 = +[CUTLog network];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_1A35650D0();
    }
  }
}

- (void)_createDynamicStore
{
  BOOL v3 = +[CUTWeakReference weakRefWithObject:self];
  context.version = 0;
  context.info = v3;
  context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E4F1C280];
  context.release = (void (__cdecl *)(const void *))MEMORY[0x1E4F1C278];
  context.copyDescription = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  dynamicStore = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"com.apple.cutwifimanager", (SCDynamicStoreCallBack)sub_1A355EDC0, &context);
  self->_dynamicStore = dynamicStore;
  if (!dynamicStore)
  {
    NSUInteger v6 = +[CUTLog network];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_1A3565144();
    }

    dynamicStore = self->_dynamicStore;
  }
  SCDynamicStoreSetDispatchQueue((SCDynamicStoreRef)dynamicStore, (dispatch_queue_t)self->_incomingCallbacksQueue);
  id v7 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
  Mutable = CFArrayCreateMutable(v4, 0, MEMORY[0x1E4F1D510]);
  v9 = CFArrayCreateMutable(v4, 0, v7);
  CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F41AC8];
  CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(v4, (CFStringRef)*MEMORY[0x1E4F41AC8], (CFStringRef)*MEMORY[0x1E4F41B10]);
  CFArrayAppendValue(Mutable, NetworkGlobalEntity);
  CFRelease(NetworkGlobalEntity);
  CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(v4, v10, (CFStringRef)*MEMORY[0x1E4F41AB8], (CFStringRef)*MEMORY[0x1E4F41AF8]);
  CFArrayAppendValue(v9, NetworkInterfaceEntity);
  CFRelease(NetworkInterfaceEntity);
  SCDynamicStoreSetNotificationKeys((SCDynamicStoreRef)self->_dynamicStore, Mutable, v9);
  CFRelease(Mutable);
  CFRelease(v9);
}

- (BOOL)isHostingWiFiHotSpot
{
  if (![(CUTWiFiManager *)self isWiFiEnabled]) {
    return 0;
  }
  [(NSRecursiveLock *)self->_lock lock];
  BOOL isHostingHotSpot = self->_isHostingHotSpot;
  [(NSRecursiveLock *)self->_lock unlock];
  return isHostingHotSpot;
}

- (BOOL)willTryToAutoAssociateWiFiNetwork
{
  BOOL v3 = [(CUTWiFiManager *)self isWiFiEnabled];
  if (v3)
  {
    [(NSRecursiveLock *)self->_lock lock];
    if (!self->_wifiManager
      || (int AskToJoinState = WiFiManagerClientGetAskToJoinState(),
          (CFArrayRef v5 = (const __CFArray *)WiFiManagerClientCopyEnabledNetworks()) == 0))
    {
      [(NSRecursiveLock *)self->_lock unlock];
LABEL_7:
      LOBYTE(v3) = 0;
      return v3;
    }
    CFArrayRef v6 = v5;
    CFIndex Count = CFArrayGetCount(v5);
    CFRelease(v6);
    [(NSRecursiveLock *)self->_lock unlock];
    LOBYTE(v3) = AskToJoinState != 0;
    if (!Count) {
      goto LABEL_7;
    }
  }
  return v3;
}

- (BOOL)willTryToSearchForWiFiNetwork
{
  if (![(CUTWiFiManager *)self isWiFiEnabled]) {
    return 0;
  }
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_wifiManager) {
    BOOL v3 = WiFiManagerClientGetAskToJoinState() != 0;
  }
  else {
    BOOL v3 = 0;
  }
  [(NSRecursiveLock *)self->_lock unlock];
  return v3;
}

- (NSNumber)wiFiSignalStrength
{
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_wifiManager)
  {
    BOOL v3 = (void *)WiFiManagerClientCopyDevices();
    CFAllocatorRef v4 = v3;
    if (v3 && [v3 count] && (CFArrayRef v5 = (const void *)objc_msgSend(v4, "objectAtIndex:", 0)) != 0)
    {
      CFArrayRef v6 = v5;
      CFRetain(v5);
      id v7 = (void *)WiFiDeviceClientCopyProperty();
      CFRelease(v6);
    }
    else
    {
      id v7 = 0;
    }
    [(NSRecursiveLock *)self->_lock unlock];
  }
  else
  {
    [(NSRecursiveLock *)self->_lock unlock];
    id v7 = 0;
  }
  return (NSNumber *)v7;
}

- (NSNumber)wiFiScaledRSSI
{
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_wifiManager)
  {
    BOOL v3 = (void *)WiFiManagerClientCopyDevices();
    CFAllocatorRef v4 = v3;
    if (v3 && [v3 count] && (CFArrayRef v5 = (const void *)objc_msgSend(v4, "objectAtIndex:", 0)) != 0)
    {
      CFArrayRef v6 = v5;
      CFRetain(v5);
      id v7 = (void *)WiFiDeviceClientCopyProperty();
      CFRelease(v6);
    }
    else
    {
      id v7 = 0;
    }
    [(NSRecursiveLock *)self->_lock unlock];
  }
  else
  {
    [(NSRecursiveLock *)self->_lock unlock];
    id v7 = 0;
  }
  return (NSNumber *)v7;
}

- (NSNumber)wiFiScaledRate
{
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_wifiManager)
  {
    BOOL v3 = (void *)WiFiManagerClientCopyDevices();
    CFAllocatorRef v4 = v3;
    if (v3 && [v3 count] && (CFArrayRef v5 = (const void *)objc_msgSend(v4, "objectAtIndex:", 0)) != 0)
    {
      CFArrayRef v6 = v5;
      CFRetain(v5);
      id v7 = (void *)WiFiDeviceClientCopyProperty();
      CFRelease(v6);
    }
    else
    {
      id v7 = 0;
    }
    [(NSRecursiveLock *)self->_lock unlock];
  }
  else
  {
    [(NSRecursiveLock *)self->_lock unlock];
    id v7 = 0;
  }
  return (NSNumber *)v7;
}

- (BOOL)isWiFiAssociated
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->_lock lock];
  currentNetwork = self->_currentNetwork;
  [(NSRecursiveLock *)self->_lock unlock];
  CFAllocatorRef v4 = +[CUTLog network];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFArrayRef v5 = @"NO";
    if (currentNetwork) {
      CFArrayRef v5 = @"YES";
    }
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1A3554000, v4, OS_LOG_TYPE_DEFAULT, "is WiFi associated? %@", (uint8_t *)&v7, 0xCu);
  }

  return currentNetwork != 0;
}

- (void)_updateIsWiFiAssociatedAsync:(BOOL)a3
{
  BOOL v3 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1A355F584;
  v6[3] = &unk_1E5AFEE38;
  v6[4] = self;
  CFArrayRef v5 = (void *)MEMORY[0x1A6249D30](v6, a2);
  [(CUTWiFiManager *)self _performCurrentNetworkBlock:v5 withDevice:0 async:v3];
}

- (void)_updateIsWiFiEnabled
{
  *(_WORD *)&self->_BOOL isHostingHotSpot = 0;
  if (self->_wifiManager)
  {
    int Power = WiFiManagerClientGetPower();
    CFAllocatorRef v4 = (void *)WiFiManagerClientCopyProperty();
    int v5 = [v4 BOOLValue];
    if (v4) {
      CFRelease(v4);
    }
    if (Power) {
      BOOL v6 = v5;
    }
    else {
      BOOL v6 = 0;
    }
    self->_isWifiEnabled = v6;
    BOOL v7 = v6 && WiFiManagerClientGetMISState() != 0;
    self->_BOOL isHostingHotSpot = v7;
    id v8 = +[CUTLog network];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1A3554000, v8, OS_LOG_TYPE_DEFAULT, "Running network block async", v9, 2u);
    }

    [(CUTWiFiManager *)self _updateIsWiFiAssociatedAsync:1];
  }
}

- (BOOL)isWiFiEnabled
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL isWifiEnabled = self->_isWifiEnabled;
  [(NSRecursiveLock *)self->_lock unlock];
  return isWifiEnabled;
}

- (void)_performDeviceBlock:(id)a3 useCache:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = (void (**)(id, void *))a3;
  if (!v6) {
    goto LABEL_16;
  }
  BOOL v7 = v6;
  v12 = (void (**)(id, void *))[v6 copy];

  [(NSRecursiveLock *)self->_lock lock];
  if (v4)
  {
    wifiDevice = self->_wifiDevice;
    if (wifiDevice) {
      CFRetain(self->_wifiDevice);
    }
    goto LABEL_13;
  }
  if (self->_wifiManager)
  {
    uint64_t v9 = (void *)WiFiManagerClientCopyDevices();
    CFStringRef v10 = v9;
    if (v9 && [v9 count])
    {
      v11 = (void *)[v10 objectAtIndex:0];
      wifiDevice = v11;
      if (v11) {
        CFRetain(v11);
      }
      goto LABEL_12;
    }
  }
  else
  {
    CFStringRef v10 = 0;
  }
  wifiDevice = 0;
LABEL_12:

LABEL_13:
  [(NSRecursiveLock *)self->_lock unlock];
  v12[2](v12, wifiDevice);
  if (wifiDevice) {
    CFRelease(wifiDevice);
  }
  BOOL v6 = v12;
LABEL_16:
}

- (void)_performDeviceBlock:(id)a3
{
  id v5 = a3;
  BOOL v4 = (void *)MEMORY[0x1A6249B10]();
  [(CUTWiFiManager *)self _performDeviceBlock:v5 useCache:1];
}

- (void)_performCurrentNetworkBlock:(id)a3 withDevice:(__WiFiDeviceClient *)a4 async:(BOOL)a5
{
  id v8 = a3;
  uint64_t v9 = v8;
  if (v8)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1A355FCA0;
    v12[3] = &unk_1E5AFEE88;
    v12[4] = self;
    BOOL v14 = a5;
    id v13 = v8;
    CFStringRef v10 = (void (**)(void, void))MEMORY[0x1A6249D30](v12);
    if (a4)
    {
      v11 = (void *)MEMORY[0x1A6249B10]();
      ((void (**)(void, __WiFiDeviceClient *))v10)[2](v10, a4);
    }
    else
    {
      [(CUTWiFiManager *)self _performDeviceBlock:v10];
    }
  }
}

- (void)_performCurrentNetworkBlock:(id)a3 withDevice:(__WiFiDeviceClient *)a4
{
}

- (void)_performCurrentNetworkBlock:(id)a3
{
}

- (id)_ssidFromNetwork:(__WiFiNetwork *)a3
{
  if (a3) {
    SSID = (void *)WiFiNetworkGetSSID();
  }
  else {
    SSID = 0;
  }
  id v4 = SSID;
  return v4;
}

- (void)_handleDevicePowerCallback
{
  [(NSRecursiveLock *)self->_lock lock];
  [(CUTWiFiManager *)self _updateIsWiFiEnabled];
  lock = self->_lock;
  [(NSRecursiveLock *)lock unlock];
}

- (void)_handleDeviceAttachedCallback
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1A3560164;
  v2[3] = &unk_1E5AFEDE8;
  v2[4] = self;
  [(CUTWiFiManager *)self _performDeviceBlock:v2 useCache:0];
}

- (void)_handleHostAPStateChangedCallback
{
  [(NSRecursiveLock *)self->_lock lock];
  [(CUTWiFiManager *)self _updateIsWiFiEnabled];
  lock = self->_lock;
  [(NSRecursiveLock *)lock unlock];
}

- (void)_handlePotentialDeviceChange:(__WiFiDeviceClient *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->_lock lock];
  wifiDevice = (__WiFiDeviceClient *)self->_wifiDevice;
  if (wifiDevice == a3)
  {
    self->_isWakeOnWiFiSupported = 1;
  }
  else
  {
    if (wifiDevice)
    {
      WiFiDeviceClientRegisterDeviceAvailableCallback();
      WiFiDeviceClientRegisterExtendedLinkCallback();
      WiFiDeviceClientRegisterHostApStateChangedCallback();
      CFRelease(self->_wifiDevice);
      self->_wifiDevice = 0;
    }
    if (a3)
    {
      self->_wifiDevice = a3;
      CFRetain(a3);
      self->_isWakeOnWiFiSupported = WiFiManagerClientGetWoWCapability() != 0;
      [(CUTWiFiManager *)self _updateIsWiFiEnabled];
      WiFiDeviceClientRegisterDeviceAvailableCallback();
      WiFiDeviceClientRegisterExtendedLinkCallback();
      WiFiDeviceClientRegisterPowerCallback();
      WiFiDeviceClientRegisterHostApStateChangedCallback();
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      BOOL v6 = self->_delegateMap;
      uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v17;
        CFStringRef v10 = MEMORY[0x1E4F14428];
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = sub_1A3560574;
            block[3] = &unk_1E5AFEC10;
            block[4] = v12;
            block[5] = self;
            dispatch_async(v10, block);
          }
          uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v8);
      }
    }
    else
    {
      self->_BOOL isWifiEnabled = 0;
      id v13 = +[CUTLog network];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v14 = 0;
        _os_log_impl(&dword_1A3554000, v13, OS_LOG_TYPE_DEFAULT, "Running network block async", v14, 2u);
      }

      [(CUTWiFiManager *)self _updateIsWiFiAssociatedAsync:1];
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)setCurrentNetwork:(void *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->_lock lock];
  currentNetwork = self->_currentNetwork;
  if (currentNetwork != a3)
  {
    if (currentNetwork) {
      CFRelease(currentNetwork);
    }
    self->_currentNetwork = a3;
    if (a3) {
      CFRetain(a3);
    }
    BOOL v6 = +[CUTLog network];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = self->_currentNetwork;
      int v8 = 134217984;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1A3554000, v6, OS_LOG_TYPE_DEFAULT, "_currentNetwork is %p", (uint8_t *)&v8, 0xCu);
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)_setCurrentNetwork:(__WiFiNetwork *)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  [(CUTWiFiManager *)self setCurrentNetwork:a3];
  [(CUTWiFiManager *)self _updateIsWiFiEnabled];
  lock = self->_lock;
  [(NSRecursiveLock *)lock unlock];
}

- (void)_performPowerReading
{
  [(NSRecursiveLock *)self->_lock lock];
  NSUInteger v3 = [(NSHashTable *)self->_delegateMap count];
  [(NSRecursiveLock *)self->_lock unlock];
  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = sub_1A35607A0;
    v4[3] = &unk_1E5AFEEB0;
    v4[4] = self;
    [(CUTWiFiManager *)self currentWiFiNetworkPowerUsageWithCompletion:v4];
  }
}

- (double)_wifiMeasurementErrorForInterval:(double)a3
{
  return ((a3 + -1.0) * 1.5 + 280.0) / (a3 * 15.0);
}

- (void)currentWiFiNetworkPowerUsageWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_1A3560A5C;
    v6[3] = &unk_1E5AFEF00;
    v6[4] = self;
    id v7 = v4;
    [(CUTWiFiManager *)self _performDeviceBlock:v6];
  }
}

- (NSString)currentSSID
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3032000000;
  int v8 = sub_1A3561030;
  uint64_t v9 = sub_1A3561040;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1A3561048;
  v4[3] = &unk_1E5AFEF28;
  v4[4] = self;
  void v4[5] = &v5;
  [(CUTWiFiManager *)self _performCurrentNetworkBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (BOOL)_isPrimaryCellular
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL isPrimaryCellularCached = self->_isPrimaryCellularCached;
  [(NSRecursiveLock *)self->_lock unlock];
  return isPrimaryCellularCached;
}

- (BOOL)isWiFiCaptive
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1A356118C;
  v4[3] = &unk_1E5AFEF50;
  v4[4] = self;
  void v4[5] = &v5;
  [(CUTWiFiManager *)self _performCurrentNetworkBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_adjustWiFiAutoAssociationLocked
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_wifiManager)
  {
    BOOL v3 = [(CUTWiFiManager *)self autoAssociateWiFi];
    if (v3)
    {
      if ([(CUTWiFiManager *)self autoAssociateWiFiAsForegroundClient]) {
        int v4 = 2;
      }
      else {
        int v4 = 1;
      }
    }
    else
    {
      int v4 = 0;
    }
    if (WiFiManagerClientGetType() != v4)
    {
      BOOL v6 = +[CUTLog network];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = "disabling";
        wiFiAutoAssociationTokens = self->_wiFiAutoAssociationTokens;
        if (v3) {
          uint64_t v7 = "enabling";
        }
        int v9 = 136446467;
        id v10 = v7;
        __int16 v11 = 2113;
        uint64_t v12 = wiFiAutoAssociationTokens;
        _os_log_impl(&dword_1A3554000, v6, OS_LOG_TYPE_DEFAULT, "Interface manager: %{public}s WiFi association on wake (client tokens: %{private}@)", (uint8_t *)&v9, 0x16u);
      }

      WiFiManagerClientSetType();
    }
    [(NSRecursiveLock *)self->_lock unlock];
  }
  else
  {
    lock = self->_lock;
    [(NSRecursiveLock *)lock unlock];
  }
}

- (void)_adjustWiFiAutoAssociation
{
  [(NSRecursiveLock *)self->_lock lock];
  [(CUTWiFiManager *)self _adjustWiFiAutoAssociationLocked];
  lock = self->_lock;
  [(NSRecursiveLock *)lock unlock];
}

- (BOOL)autoAssociateWiFi
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = [(NSMutableSet *)self->_wiFiAutoAssociationTokens count] != 0;
  [(NSRecursiveLock *)self->_lock unlock];
  return v3;
}

- (BOOL)hasWiFiAutoAssociationClientToken:(id)a3
{
  if (!a3) {
    return 0;
  }
  lock = self->_lock;
  id v5 = a3;
  [(NSRecursiveLock *)lock lock];
  LOBYTE(lock) = [(NSMutableSet *)self->_wiFiAutoAssociationTokens containsObject:v5];

  [(NSRecursiveLock *)self->_lock unlock];
  return (char)lock;
}

- (void)addWiFiAutoAssociationClientToken:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(NSRecursiveLock *)self->_lock lock];
    wiFiAutoAssociationTokens = self->_wiFiAutoAssociationTokens;
    if (!wiFiAutoAssociationTokens)
    {
      BOOL v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v7 = self->_wiFiAutoAssociationTokens;
      self->_wiFiAutoAssociationTokens = v6;

      wiFiAutoAssociationTokens = self->_wiFiAutoAssociationTokens;
    }
    [(NSMutableSet *)wiFiAutoAssociationTokens addObject:v4];
    char v8 = +[CUTLog network];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = self->_wiFiAutoAssociationTokens;
      int v10 = 138478083;
      id v11 = v4;
      __int16 v12 = 2113;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1A3554000, v8, OS_LOG_TYPE_DEFAULT, "Client token: %{private}@ was added to WiFi association clients (%{private}@)", (uint8_t *)&v10, 0x16u);
    }

    [(CUTWiFiManager *)self _adjustWiFiAutoAssociationLocked];
    [(NSRecursiveLock *)self->_lock unlock];
  }
}

- (void)removeWiFiAutoAssociationClientToken:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(NSRecursiveLock *)self->_lock lock];
    id v5 = +[CUTLog network];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      wiFiAutoAssociationTokens = self->_wiFiAutoAssociationTokens;
      int v7 = 138478083;
      id v8 = v4;
      __int16 v9 = 2113;
      int v10 = wiFiAutoAssociationTokens;
      _os_log_impl(&dword_1A3554000, v5, OS_LOG_TYPE_DEFAULT, "Client token: %{private}@ being removed from WiFi association clients (%{private}@)", (uint8_t *)&v7, 0x16u);
    }

    [(NSMutableSet *)self->_wiFiAutoAssociationTokens removeObject:v4];
    [(CUTWiFiManager *)self _adjustWiFiAutoAssociationLocked];
    [(NSRecursiveLock *)self->_lock unlock];
  }
}

- (void)showNetworkOptions
{
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_wifiManager)
  {
    WiFiManagerClientSetAssociationMode();
    lock = self->_lock;
    [(NSRecursiveLock *)lock unlock];
  }
  else
  {
    id v4 = +[CUTLog network];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1A3565178();
    }

    [(NSRecursiveLock *)self->_lock unlock];
  }
}

- (BOOL)isWoWEnabled
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL isWakeOnWiFiEnabled = self->_isWakeOnWiFiEnabled;
  [(NSRecursiveLock *)self->_lock unlock];
  return isWakeOnWiFiEnabled;
}

- (BOOL)autoAssociateWiFiAsForegroundClient
{
  return self->_shouldAutoAssociateAsForeground;
}

- (void)setAutoAssociateWiFiAsForegroundClient:(BOOL)a3
{
  self->_shouldAutoAssociateAsForeground = a3;
}

- (BOOL)isWoWSupported
{
  return self->_isWakeOnWiFiSupported;
}

- (NSMutableSet)wiFiAutoAssociationTokens
{
  return self->_wiFiAutoAssociationTokens;
}

- (void)setWiFiAutoAssociationTokens:(id)a3
{
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (NSHashTable)delegateMap
{
  return self->_delegateMap;
}

- (void)setDelegateMap:(id)a3
{
}

- (NSHashTable)wowClients
{
  return self->_wowClients;
}

- (void)setWowClients:(id)a3
{
}

- (void)currentNetwork
{
  return self->_currentNetwork;
}

- (int)linkToken
{
  return self->_linkToken;
}

- (void)setLinkToken:(int)a3
{
  self->_linkToken = a3;
}

- (void)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(void *)a3
{
  self->_wifiManager = a3;
}

- (void)wifiDevice
{
  return self->_wifiDevice;
}

- (void)setWifiDevice:(void *)a3
{
  self->_wifiDevice = a3;
}

- (void)dynamicStore
{
  return self->_dynamicStore;
}

- (void)setDynamicStore:(void *)a3
{
  self->_dynamicStore = a3;
}

- (NSDictionary)lastWiFiPowerInfo
{
  return self->_lastWiFiPowerInfo;
}

- (void)setLastWiFiPowerInfo:(id)a3
{
}

- (NSThread)wifiThread
{
  return self->_wifiThread;
}

- (void)setWifiThread:(id)a3
{
}

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

- (void)setRunLoopSource:(__CFRunLoopSource *)a3
{
  self->_runLoopSource = a3;
}

- (NSRunLoop)wifiRunLoop
{
  return self->_wifiRunLoop;
}

- (void)setWifiRunLoop:(id)a3
{
}

- (OS_dispatch_queue)incomingCallbacksQueue
{
  return self->_incomingCallbacksQueue;
}

- (void)setIncomingCallbacksQueue:(id)a3
{
}

- (BOOL)isPrimaryCellularCached
{
  return self->_isPrimaryCellularCached;
}

- (void)setIsPrimaryCellularCached:(BOOL)a3
{
  self->_BOOL isPrimaryCellularCached = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingCallbacksQueue, 0);
  objc_storeStrong((id *)&self->_wifiRunLoop, 0);
  objc_storeStrong((id *)&self->_wifiThread, 0);
  objc_storeStrong((id *)&self->_lastWiFiPowerInfo, 0);
  objc_storeStrong((id *)&self->_wowClients, 0);
  objc_storeStrong((id *)&self->_delegateMap, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_wiFiAutoAssociationTokens, 0);
}

@end