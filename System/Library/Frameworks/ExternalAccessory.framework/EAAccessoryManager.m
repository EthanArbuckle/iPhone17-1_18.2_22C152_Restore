@interface EAAccessoryManager
+ (BOOL)isLoggingEnabled;
+ (EAAccessoryManager)sharedAccessoryManager;
+ (id)accessoryDictionaryForLogging:(id)a3;
+ (void)accessibilityStartListening;
+ (void)accessibilityStopListening;
+ (void)registerCapabilities:(unsigned int)a3;
- (BOOL)appDeclaresProtocol:(id)a3;
- (BOOL)areLocationAccessoriesEnabled;
- (BOOL)destinationInformation:(id)a3 forAccessoryUUID:(id)a4;
- (BOOL)processIDIsUsingAccessory:(__CFString *)a3;
- (BOOL)shouldAllowCppRuntime;
- (BOOL)shouldAllowInternalProtocols;
- (EAAccessoryManager)init;
- (NSArray)connectedAccessories;
- (id)_connectedAccessories;
- (id)_findExtraAccessoriesContainedOnlyInEA:(id)a3;
- (id)_findExtraAccessoriesContainedOnlyIniAP:(id)a3;
- (id)_initFromSingletonCreationMethod;
- (id)authCertForLegacyConnectionID:(unsigned int)a3;
- (id)authCertSerialNumberForLegacyConnectionID:(unsigned int)a3;
- (id)currentVehicleInformation:(id)a3;
- (void)EAAccessoryArrived:(id)a3;
- (void)EAAccessoryLeft:(id)a3;
- (void)_OOBBTPairingCompletionStatusReceived:(id)a3;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_cameraInfoUpdated:(id)a3;
- (void)_checkForConnectedAccessories:(BOOL)a3 backgroundTaskIdentifier:(unint64_t)a4;
- (void)_cleanUpForTaskSuspendWithTaskIdentifier:(unint64_t)a3;
- (void)_ephemerisURLAvailable:(id)a3;
- (void)_externalAccessoryConnected:(id)a3;
- (void)_externalAccessoryConnectedNotificationHandler:(id)a3;
- (void)_externalAccessoryDisconnected:(id)a3;
- (void)_externalAccessoryReconnected:(id)a3;
- (void)_externalAccessoryUpdated:(id)a3;
- (void)_gpsTimeRequested:(id)a3;
- (void)_handleAccessoryNotificationTimeout:(id)a3;
- (void)_iapServerDied:(id)a3;
- (void)_integrateSequesteredAccessories;
- (void)_locationNmeaDataAvailable:(id)a3;
- (void)_locationPointDataAvailable:(id)a3;
- (void)_nmeaFilteringSupportChanged:(id)a3;
- (void)_notifyObserversThatAccessoryDisconnectedWithUserInfo:(id)a3;
- (void)_pointOfInterestStatusReceived:(id)a3;
- (void)_removeAlliAPAccessoriesFromArray:(id)a3 notifyClients:(BOOL)a4;
- (void)_timeSyncInfoUpdated:(id)a3;
- (void)_vehicleDataUpdated:(id)a3;
- (void)accessibilityAction:(id)a3;
- (void)accessibilityContextChange:(id)a3;
- (void)accessibilityItemPropertyRequest:(id)a3;
- (void)accessibilitySystemPropertyChange:(id)a3;
- (void)accessibilitySystemPropertyRequest:(id)a3;
- (void)accessoryClosedEASession:(id)a3;
- (void)closeEASessionForEASessionUUID:(id)a3;
- (void)closeInputStreamForEASessionUUID:(id)a3;
- (void)createEASessionForProtocol:(id)a3 accessoryUUID:(id)a4 withReply:(id)a5;
- (void)dealloc;
- (void)destinationSharingStatus:(BOOL)a3 forDestinationUUID:(id)a4 supportedParams:(id)a5 forUUID:(id)a6;
- (void)devicePicker:(id)a3 didSelectAddress:(id)a4 errorCode:(int64_t)a5;
- (void)endSession:(unsigned int)a3 forConnectionID:(unsigned int)a4;
- (void)handleIncomingExternalAccessoryData:(id)a3 forEASessionIdentifier:(id)a4 withReply:(id)a5;
- (void)initialEAAccessoriesAttachedAfterClientConnection:(id)a3;
- (void)nmeaSentenceArrived:(id)a3 forAccessoryUUID:(id)a4 withTimestamps:(id)a5;
- (void)openCompleteForSession:(unsigned int)a3 connectionID:(unsigned int)a4;
- (void)openSessionFromAccessoryToApp:(id)a3;
- (void)openSessionFromAppToAccessory:(id)a3;
- (void)pointOfInterestSelection:(id)a3;
- (void)registerForLocalNotifications;
- (void)requestIAPAccessoryWiFiCredentials:(id)a3;
- (void)saveEASession:(id)a3 forEASessionUUID:(id)a4;
- (void)sendDeviceIdentifierNotification:(id)a3 usbIdentifier:(id)a4 forUUID:(id)a5;
- (void)sendGPRMCDataStatus:(BOOL)a3 ValueV:(BOOL)a4 ValueX:(BOOL)a5 forUUID:(id)a6;
- (void)sendNMEAFilterList:(id)a3 forUUID:(id)a4;
- (void)sendOutgoingEAData:(id)a3 forSessionUUID:(id)a4;
- (void)sendWiredCarPlayAvailable:(id)a3 usbIdentifier:(id)a4 wirelessCarPlayAvailable:(id)a5 bluetoothIdentifier:(id)a6 forUUID:(id)a7;
- (void)sendWiredCarPlayAvailable:(id)a3 usbIdentifier:(id)a4 wirelessCarPlayAvailable:(id)a5 bluetoothIdentifier:(id)a6 themeAssetsAvailable:(id)a7 forUUID:(id)a8;
- (void)setAreLocationAccessoriesEnabled:(BOOL)a3;
- (void)setShouldAllowCppRuntime:(BOOL)a3;
- (void)setShouldAllowInternalProtocols:(BOOL)a3;
- (void)showBluetoothAccessoryPickerWithNameFilter:(NSPredicate *)predicate completion:(EABluetoothAccessoryPickerCompletion)completion;
- (void)startDestinationSharingForUUID:(id)a3 options:(unint64_t)a4;
- (void)startLocationForConnectedAccessories;
- (void)stopDestinationSharingForUUID:(id)a3;
- (void)stopLocationForConnectedAccessories;
- (void)unregisterForLocalNotifications;
- (void)updateAccessoryInfo:(id)a3;
- (void)vehicleStatusUpdate:(id)a3 forAccessoryUUID:(id)a4;
- (void)wakeAccessoryWithToken:(id)a3;
@end

@implementation EAAccessoryManager

- (void)stopLocationForConnectedAccessories
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  connectedAccessories = self->_connectedAccessories;
  uint64_t v3 = [(NSMutableArray *)connectedAccessories countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(connectedAccessories);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v7 supportsLocation])
        {
          if ([v7 createdByCoreAccessories])
          {
            NSLog(&cfstr_LocationChecki.isa, [v7 coreAccessoriesPrimaryUUID]);
            objc_msgSend((id)__accEAProviderClassInstance, "stopLocationInformationForAccessoryUUID:", objc_msgSend(v7, "coreAccessoriesPrimaryUUID"));
          }
        }
      }
      uint64_t v4 = [(NSMutableArray *)connectedAccessories countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)startLocationForConnectedAccessories
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(id)__accessoryListLock lock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  connectedAccessories = self->_connectedAccessories;
  uint64_t v4 = [(NSMutableArray *)connectedAccessories countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(connectedAccessories);
        }
        long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([(EAAccessoryManager *)self areLocationAccessoriesEnabled]
          && [v8 supportsLocation]
          && [v8 createdByCoreAccessories])
        {
          NSLog(&cfstr_Externalaccess_65.isa, [v8 coreAccessoriesPrimaryUUID]);
          objc_msgSend((id)__accEAProviderClassInstance, "startLocationInformationForAccessoryUUID:", objc_msgSend(v8, "coreAccessoriesPrimaryUUID"));
        }
      }
      uint64_t v5 = [(NSMutableArray *)connectedAccessories countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  [(id)__accessoryListLock unlock];
}

- (NSArray)connectedAccessories
{
  [(id)__accessoryListLock lock];
  connectedAccessories = self->_connectedAccessories;
  if (connectedAccessories) {
    connectedAccessories = (NSMutableArray *)[(NSMutableArray *)connectedAccessories count];
  }
  NSLog(&cfstr_Externalaccess_12.isa, connectedAccessories);
  if (self->_connectedAccessories) {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
  }
  else {
    uint64_t v4 = [MEMORY[0x1E4F1C978] array];
  }
  uint64_t v5 = (NSArray *)v4;
  [(id)__accessoryListLock unlock];
  return v5;
}

- (void)setAreLocationAccessoriesEnabled:(BOOL)a3
{
  if (__areLocationAccessoriesEnabled != a3)
  {
    BOOL v3 = a3;
    NSLog(&cfstr_LocationAreloc.isa, a2, __areLocationAccessoriesEnabled, a3);
    __areLocationAccessoriesEnabled = v3;
    if (v3)
    {
      IAPLocationActivate();
      [(EAAccessoryManager *)self startLocationForConnectedAccessories];
    }
    else
    {
      IAPLocationDeactivate();
      [(EAAccessoryManager *)self stopLocationForConnectedAccessories];
    }
  }
}

+ (EAAccessoryManager)sharedAccessoryManager
{
  if (sharedAccessoryManager_onceToken != -1) {
    dispatch_once(&sharedAccessoryManager_onceToken, &__block_literal_global_179);
  }
  if (__iapdCrashed == 1)
  {
    IAPAppRegisterClient();
    __iapdCrashed = 0;
  }
  return (EAAccessoryManager *)sharedAccessoryManager_sharedInstance;
}

- (void)registerForLocalNotifications
{
  int v2 = __registeredForLocalNotifications;
  if (!__registeredForLocalNotifications)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__locationNmeaDataAvailable_ name:*MEMORY[0x1E4F6A668] object:0];
    [v4 addObserver:self selector:sel__locationPointDataAvailable_ name:*MEMORY[0x1E4F6A660] object:0];
    [v4 addObserver:self selector:sel__ephemerisURLAvailable_ name:*MEMORY[0x1E4F6A658] object:0];
    [v4 addObserver:self selector:sel__nmeaFilteringSupportChanged_ name:*MEMORY[0x1E4F6A650] object:0];
    [v4 addObserver:self selector:sel__gpsTimeRequested_ name:*MEMORY[0x1E4F6A670] object:0];
    int v2 = __registeredForLocalNotifications;
  }
  uint64_t v5 = (v2 + 1);
  __registeredForLocalNotifications = v5;
  NSLog(&cfstr_Externalaccess_13.isa, a2, 1043, v5);
}

- (id)_initFromSingletonCreationMethod
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  IAPRegisterEAAuthGetters();
  v29.receiver = self;
  v29.super_class = (Class)EAAccessoryManager;
  BOOL v3 = [(EAAccessoryManager *)&v29 init];
  if (v3)
  {
    signal(13, (void (__cdecl *)(int))1);
    uint64_t v4 = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    v3->_managerInstanceUUID = v4;
    NSLog(&cfstr_Externalaccess_0.isa, "-[EAAccessoryManager _initFromSingletonCreationMethod]", v3, v4);
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "isMacCatalystApp") & 1) == 0)
    {
      char v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "isiOSAppOnMac");
      if (uikitFramework)
      {
        if ((v5 & 1) == 0)
        {
          NSLog(&cfstr_Externalaccess_1.isa, "-[EAAccessoryManager _initFromSingletonCreationMethod]");
          uint64_t v6 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
          if (uikitFramework
            && (v7 = (uint64_t *)dlsym((void *)uikitFramework, "UIApplicationDidEnterBackgroundNotification")) != 0)
          {
            uint64_t v8 = *v7;
          }
          else
          {
            uint64_t v8 = 0;
          }
          [v6 addObserver:v3 selector:sel__applicationDidEnterBackground_ name:v8 object:0];
          if (uikitFramework
            && (long long v9 = (uint64_t *)dlsym((void *)uikitFramework, "UIApplicationWillEnterForegroundNotification")) != 0)
          {
            uint64_t v10 = *v9;
          }
          else
          {
            uint64_t v10 = 0;
          }
          [v6 addObserver:v3 selector:sel__applicationWillEnterForeground_ name:v10 object:0];
        }
      }
    }
    long long v11 = EAWeakLinkClass(&cfstr_Accexternalacc_0.isa, (const void *)6);
    if (v11)
    {
      id v12 = [v11 alloc];
      __accEAProviderClassInstance = [v12 initWithDelegate:v3 capabilities:__capabilities];
    }
    else
    {
      NSLog(&cfstr_Externalaccess_2.isa);
    }
    __currentCoreAccessoriesEASessions = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    __activeCoreAccessoriesEASessions = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_connectionQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.EA.connectionQueue", 0);
    uint64_t v13 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    v3->_pickerLock = v13;
    -[NSRecursiveLock setName:](v13, "setName:", [NSString stringWithCString:"com.apple.EA.pickerLock" encoding:4]);
    if (_initFromSingletonCreationMethod_onceToken != -1) {
      dispatch_once(&_initFromSingletonCreationMethod_onceToken, &__block_literal_global);
    }
    id obj = (id)IAPAppConnectedAccessories();
    if (obj)
    {
      NSLog(&cfstr_Externalaccess_3.isa, [obj count], v3->_managerInstanceUUID);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v14 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(obj);
            }
            v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            v19 = objc_alloc_init(EAAccessoryInternal);
            __convertIAPAccessoryToEAAccessory(v18, v19);
            [(EAAccessoryInternal *)v19 setConnected:1];
            id v20 = [[EAAccessory alloc] _initWithAccessory:v19];
            [(id)__accessoryListLock lock];
            connectedAccessories = v3->_connectedAccessories;
            if (!connectedAccessories)
            {
              connectedAccessories = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
              v3->_connectedAccessories = connectedAccessories;
            }
            [(NSMutableArray *)connectedAccessories addObject:v20];
            [(id)__accessoryListLock unlock];
            NSLog(&cfstr_Externalaccess_4.isa, [v20 connectionID]);
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v15);
      }
    }
    v3->_sequesterNewAccessories = 0;
    v22 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:v3 selector:sel__externalAccessoryConnectedNotificationHandler_ name:*MEMORY[0x1E4F6A530] object:0];
    [v22 addObserver:v3 selector:sel__externalAccessoryUpdated_ name:*MEMORY[0x1E4F6A5F0] object:0];
    [v22 addObserver:v3 selector:sel__externalAccessoryDisconnected_ name:*MEMORY[0x1E4F6A538] object:0];
    [v22 addObserver:v3 selector:sel__pointOfInterestStatusReceived_ name:*MEMORY[0x1E4F6A5C8] object:0];
    [v22 addObserver:v3 selector:sel__OOBBTPairingCompletionStatusReceived_ name:*MEMORY[0x1E4F6A590] object:0];
    [v22 addObserver:v3 selector:sel__iapServerDied_ name:*MEMORY[0x1E4F6A618] object:0];
    [v22 addObserver:v3 selector:sel__externalAccessoryReconnected_ name:*MEMORY[0x1E4F6A620] object:0];
    [v22 addObserver:v3 selector:sel__timeSyncInfoUpdated_ name:*MEMORY[0x1E4F6A678] object:0];
    [v22 addObserver:v3 selector:sel__vehicleDataUpdated_ name:*MEMORY[0x1E4F6A680] object:0];
    [v22 addObserver:v3 selector:sel__cameraInfoUpdated_ name:*MEMORY[0x1E4F6A628] object:0];
  }
  return v3;
}

- (void)initialEAAccessoriesAttachedAfterClientConnection:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  NSLog(&cfstr_Externalaccess_9.isa, [a3 count]);
  [(id)__accessoryListLock lock];
  if (a3)
  {
    if ([a3 count])
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v14;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v14 != v7) {
              objc_enumerationMutation(a3);
            }
            long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
            uint64_t v10 = objc_alloc_init(EAAccessoryInternal);
            __convertIAPAccessoryToEAAccessory(v9, v10);
            [(EAAccessoryInternal *)v10 setConnected:1];
            id v11 = [[EAAccessory alloc] _initWithAccessory:v10];
            connectedAccessories = self->_connectedAccessories;
            if (!connectedAccessories)
            {
              connectedAccessories = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
              self->_connectedAccessories = connectedAccessories;
            }
            [(NSMutableArray *)connectedAccessories addObject:v11];

            ++v8;
          }
          while (v6 != v8);
          uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v6);
      }
    }
  }
  NSLog(&cfstr_Externalaccess_10.isa, [(NSMutableArray *)self->_connectedAccessories count]);
  [(id)__accessoryListLock unlock];
  NSLog(&cfstr_Externalaccess_11.isa);
}

- (void)unregisterForLocalNotifications
{
  uint64_t v2 = __registeredForLocalNotifications;
  if (__registeredForLocalNotifications == 1)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x1E4F6A668] object:0];
    [v4 removeObserver:self name:*MEMORY[0x1E4F6A660] object:0];
    [v4 removeObserver:self name:*MEMORY[0x1E4F6A658] object:0];
    [v4 removeObserver:self name:*MEMORY[0x1E4F6A650] object:0];
    [v4 removeObserver:self name:*MEMORY[0x1E4F6A670] object:0];
    uint64_t v2 = __registeredForLocalNotifications;
  }
  if (v2)
  {
    uint64_t v2 = (v2 - 1);
    __registeredForLocalNotifications = v2;
  }
  NSLog(&cfstr_Externalaccess_14.isa, 1063, v2);
}

id __44__EAAccessoryManager_sharedAccessoryManager__block_invoke()
{
  if (NSClassFromString(&cfstr_Uiapplication.isa)) {
    BOOL v0 = uikitFramework == 0;
  }
  else {
    BOOL v0 = 0;
  }
  if (v0) {
    uikitFramework = (uint64_t)dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 16);
  }
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKey:", @"XPC_SERVICE_NAME"), "hasPrefix:", @"UIKitApplication"))__capabilities |= 0x8000u; {
  v1 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  }
  if (!v1 || [v1 isEqualToString:&stru_1F1595068]) {
    __capabilities |= 0x200u;
  }
  uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "objectForInfoDictionaryKey:", @"UIBackgroundModes");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v2 containsObject:@"external-accessory"])
  {
    __capabilities |= 0x10u;
  }
  if (_CFExecutableLinkedOnOrAfter()) {
    __capabilities |= 0x20u;
  }
  BOOL v3 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (v3)
  {
    uint64_t v4 = v3;
    CFErrorRef error = 0;
    uint64_t v5 = (void *)SecTaskCopyValueForEntitlement(v3, @"com.apple.private.externalaccessory.showallaccessories", &error);
    CFRelease(v4);
    if (v5)
    {
      CFTypeID v6 = CFGetTypeID(v5);
      if (v6 == CFBooleanGetTypeID())
      {
        int Value = CFBooleanGetValue((CFBooleanRef)v5);
        CFRelease(v5);
        if (Value) {
          __supportsEAShowAllAccessoriesEntitlement = 1;
        }
        goto LABEL_27;
      }
      CFErrorRef v8 = (CFErrorRef)v5;
    }
    else
    {
      if (!error) {
        goto LABEL_27;
      }
      NSLog(&cfstr_Externalaccess_5.isa, @"com.apple.private.externalaccessory.showallaccessories", error);
      CFErrorRef v8 = error;
      if (!error) {
        goto LABEL_27;
      }
    }
    CFRelease(v8);
  }
LABEL_27:
  IAPAppRegisterClient();
  __iapdStartedSinceLastAppExecution = IAPDHasLaunched();
  __iap2dStartedSinceLastAppExecution = IAP2DHasLaunched();
  id result = [[EAAccessoryManager alloc] _initFromSingletonCreationMethod];
  sharedAccessoryManager_sharedInstance = (uint64_t)result;
  __iapdCrashed = 0;
  return result;
}

uint64_t __54__EAAccessoryManager__initFromSingletonCreationMethod__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  __accessoryListLock = (uint64_t)v0;
  uint64_t v1 = [NSString stringWithCString:"com.apple.EA.accessoryListLock" encoding:4];

  return [v0 setName:v1];
}

- (EAAccessoryManager)init
{
  return 0;
}

- (void)dealloc
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "isMacCatalystApp") & 1) == 0)
  {
    char v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "isiOSAppOnMac");
    if (uikitFramework)
    {
      if ((v3 & 1) == 0)
      {
        uint64_t v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
        if (uikitFramework
          && (uint64_t v5 = (uint64_t *)dlsym((void *)uikitFramework, "UIApplicationDidEnterBackgroundNotification")) != 0)
        {
          uint64_t v6 = *v5;
        }
        else
        {
          uint64_t v6 = 0;
        }
        [v4 removeObserver:self name:v6 object:0];
        if (uikitFramework
          && (uint64_t v7 = (uint64_t *)dlsym((void *)uikitFramework, "UIApplicationWillEnterForegroundNotification")) != 0)
        {
          uint64_t v8 = *v7;
        }
        else
        {
          uint64_t v8 = 0;
        }
        [v4 removeObserver:self name:v8 object:0];
        dlclose((void *)uikitFramework);
      }
    }
  }
  [(id)__accessoryListLock lock];

  self->_connectedAccessories = 0;
  [(id)__accessoryListLock unlock];

  self->_sequesteredAccessories = 0;
  [(NSRecursiveLock *)self->_pickerLock lock];

  self->_selectedBluetoothAddress = 0;
  [(EABluetoothAccessoryPicker *)self->_picker dismissPicker];

  self->_picker = 0;
  id pickerCompletion = self->_pickerCompletion;
  if (pickerCompletion)
  {
    _Block_release(pickerCompletion);
    self->_id pickerCompletion = 0;
  }
  [(NSTimer *)self->_pickerTimer invalidate];

  self->_pickerTimer = 0;
  [(NSRecursiveLock *)self->_pickerLock unlock];

  dispatch_release((dispatch_object_t)self->_connectionQueue);
  self->_connectionQueue = 0;
  [(EAAccessoryManager *)self unregisterForLocalNotifications];
  uint64_t v10 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 removeObserver:self name:*MEMORY[0x1E4F6A530] object:0];
  [v10 removeObserver:self name:*MEMORY[0x1E4F6A5F0] object:0];
  [v10 removeObserver:self name:*MEMORY[0x1E4F6A538] object:0];
  [v10 removeObserver:self name:*MEMORY[0x1E4F6A618] object:0];
  [v10 removeObserver:self name:*MEMORY[0x1E4F6A620] object:0];
  [v10 removeObserver:self name:*MEMORY[0x1E4F6A678] object:0];
  [v10 removeObserver:self name:*MEMORY[0x1E4F6A680] object:0];
  [v10 removeObserver:self name:*MEMORY[0x1E4F6A5C8] object:0];
  [v10 removeObserver:self name:*MEMORY[0x1E4F6A590] object:0];
  [v10 removeObserver:self name:*MEMORY[0x1E4F6A628] object:0];

  self->_managerInstanceUUID = 0;
  v11.receiver = self;
  v11.super_class = (Class)EAAccessoryManager;
  [(EAAccessoryManager *)&v11 dealloc];
}

- (void)EAAccessoryArrived:(id)a3
{
  NSLog(&cfstr_Externalaccess_6.isa, +[EAAccessoryManager accessoryDictionaryForLogging:](EAAccessoryManager, "accessoryDictionaryForLogging:"));
  uint64_t v5 = [MEMORY[0x1E4F28EA0] notificationWithName:*MEMORY[0x1E4F6A530] object:self userInfo:a3];

  [(EAAccessoryManager *)self _externalAccessoryConnected:v5];
}

- (void)EAAccessoryLeft:(id)a3
{
  NSLog(&cfstr_Externalaccess_7.isa, +[EAAccessoryManager accessoryDictionaryForLogging:](EAAccessoryManager, "accessoryDictionaryForLogging:"));
  uint64_t v5 = *MEMORY[0x1E4F6A610];
  uint64_t v6 = [a3 objectForKey:*MEMORY[0x1E4F6A610]];
  if (v6)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28EA0], "notificationWithName:object:userInfo:", *MEMORY[0x1E4F6A538], self, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", v6, v5));
    [(EAAccessoryManager *)self _externalAccessoryDisconnected:v7];
  }
  else
  {
    NSLog(&cfstr_Externalaccess_8.isa);
  }
}

- (void)startDestinationSharingForUUID:(id)a3 options:(unint64_t)a4
{
  id AccessoryByUUID = __findAccessoryByUUID((uint64_t)a3, self->_connectedAccessories);
  if (AccessoryByUUID)
  {
    uint64_t v7 = AccessoryByUUID;
    [AccessoryByUUID setPointOfInterestHandoffEnabled:1];
    [v7 setDestinationSharingOptions:a4];
    if (__registeredForLocalNotifications)
    {
      uint64_t v8 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v7 forKey:@"EAAccessoryKey"];
      [v8 postNotificationName:@"EAAccessoryUpdateNotification" object:self userInfo:v9];
    }
  }
}

- (void)stopDestinationSharingForUUID:(id)a3
{
  id AccessoryByUUID = __findAccessoryByUUID((uint64_t)a3, self->_connectedAccessories);
  if (AccessoryByUUID)
  {
    id v5 = AccessoryByUUID;
    [AccessoryByUUID setPointOfInterestHandoffEnabled:0];
    if (__registeredForLocalNotifications)
    {
      uint64_t v6 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v5 forKey:@"EAAccessoryKey"];
      [v6 postNotificationName:@"EAAccessoryUpdateNotification" object:self userInfo:v7];
    }
  }
}

- (void)destinationSharingStatus:(BOOL)a3 forDestinationUUID:(id)a4 supportedParams:(id)a5 forUUID:(id)a6
{
  BOOL v8 = a3;
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3, a4, a5, a6);
  [v10 setObject:a4 forKey:@"EAAccessoryDestinationStatusIdentifierKey"];
  objc_msgSend(v10, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", v8), @"EAAccessoryDestinationStatusDidSucceedKey");
  [v10 setObject:a5 forKey:@"EAAccessoryDestinationStatusParametersUsedKey"];
  objc_super v11 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];

  [v11 postNotificationName:@"EAAccessoryDestinationStatusNotification" object:self userInfo:v10];
}

- (void)nmeaSentenceArrived:(id)a3 forAccessoryUUID:(id)a4 withTimestamps:(id)a5
{
  id AccessoryByUUID = __findAccessoryByUUID((uint64_t)a4, self->_connectedAccessories);
  if (AccessoryByUUID)
  {
    [AccessoryByUUID addNMEASentence:a3 withTimestamps:a5];
    [(EAAccessoryManager *)self _locationNmeaDataAvailable:0];
  }
  else
  {
    NSLog(&cfstr_LocationSCanno.isa, "-[EAAccessoryManager nmeaSentenceArrived:forAccessoryUUID:withTimestamps:]", a4, a3, a5);
  }
}

- (void)vehicleStatusUpdate:(id)a3 forAccessoryUUID:(id)a4
{
  id AccessoryByUUID = __findAccessoryByUUID((uint64_t)a4, self->_connectedAccessories);
  NSLog(&cfstr_Vehicleinfosta.isa, "-[EAAccessoryManager vehicleStatusUpdate:forAccessoryUUID:]", a4, a3);
  if (AccessoryByUUID)
  {
    NSLog(&cfstr_Vehicleinfosta_0.isa, a4);
    BOOL v8 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a3];
    objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(AccessoryByUUID, "connectionID")), @"EAConnectionIDKey");
    uint64_t v9 = [MEMORY[0x1E4F28EA0] notificationWithName:*MEMORY[0x1E4F6A680] object:0 userInfo:v8];
    [(EAAccessoryManager *)self _vehicleDataUpdated:v9];
  }
  else
  {
    NSLog(&cfstr_Vehicleinfosta_1.isa, a4);
  }
}

- (void)updateAccessoryInfo:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F28EA0] notificationWithName:*MEMORY[0x1E4F6A5F0] object:0 userInfo:a3];

  [(EAAccessoryManager *)self _externalAccessoryUpdated:v4];
}

- (void)showBluetoothAccessoryPickerWithNameFilter:(NSPredicate *)predicate completion:(EABluetoothAccessoryPickerCompletion)completion
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "isMacCatalystApp") & 1) != 0
    || objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "isiOSAppOnMac"))
  {
    NSLog(&cfstr_BtpickerSIsrun.isa, "-[EAAccessoryManager showBluetoothAccessoryPickerWithNameFilter:completion:]");
    +[EAPostAlert EANotificationPostAccessoryNotification:@"BLUETOOTH_PICKER_UNAVAILABLE_TITLE" forMsg:@"BLUETOOTH_PICKER_UNAVAILABLE_MSG" forDefaultButton:@"OKAY_STRING" withAlternateButton:0 forNotification:&_BTPickerUnsupportedNotificationRef withCallback:__notificationCleanup andTimeout:0.0];
  }
  else
  {
    [(NSRecursiveLock *)self->_pickerLock lock];
    if (!self->_picker)
    {
      self->_sequesterNewAccessories = 1;
      selectedBluetoothAddress = self->_selectedBluetoothAddress;
      if (selectedBluetoothAddress)
      {

        self->_selectedBluetoothAddress = 0;
      }
      self->_id pickerCompletion = _Block_copy(completion);
      BOOL v8 = [[EABluetoothAccessoryPicker alloc] initWithPredicate:predicate];
      self->_picker = v8;
      [(EABluetoothAccessoryPicker *)v8 setDelegate:self];
      [(EABluetoothAccessoryPicker *)self->_picker show];
    }
    pickerLock = self->_pickerLock;
    [(NSRecursiveLock *)pickerLock unlock];
  }
}

- (void)_notifyObserversThatAccessoryDisconnectedWithUserInfo:(id)a3
{
  uint64_t v5 = [a3 objectForKey:@"EAAccessoryKey"];
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__EAAccessoryManager__notifyObserversThatAccessoryDisconnectedWithUserInfo___block_invoke;
    block[3] = &unk_1E6293ED0;
    block[4] = v5;
    block[5] = self;
    block[6] = a3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __76__EAAccessoryManager__notifyObserversThatAccessoryDisconnectedWithUserInfo___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "accessoryDidDisconnect:", *(void *)(a1 + 32));
  }
  uint64_t v2 = [*(id *)(a1 + 32) coreAccessoriesPrimaryUUID];
  uint64_t v3 = [*(id *)(a1 + 32) connectionID];
  unsigned int v4 = [*(id *)(a1 + 32) createdByCoreAccessories];
  NSLog(&cfstr_Externalaccess_15.isa, 1078, v2, v3, v4, __registeredForLocalNotifications);
  if (__registeredForLocalNotifications)
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    [v5 postNotificationName:@"EAAccessoryDidDisconnectNotification" object:v6 userInfo:v7];
  }
}

- (void)_iapServerDied:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  NSLog(&cfstr_Externalaccess_16.isa, [(NSMutableArray *)self->_connectedAccessories count], a3);
  [(EAAccessoryManager *)self _removeAlliAPAccessoriesFromArray:self->_connectedAccessories notifyClients:1];
  [(EAAccessoryManager *)self _removeAlliAPAccessoriesFromArray:self->_sequesteredAccessories notifyClients:0];
  if (+[EAAccessoryManager isLoggingEnabled]) {
    NSLog(&cfstr_Externalaccess_17.isa, __iapdCrashed, 1, __iap2dStartedSinceLastAppExecution, 0, __iapdStartedSinceLastAppExecution, 0);
  }
  __iapdCrashed = 1;
  __iap2dStartedSinceLastAppExecution = 0;
  __iapdStartedSinceLastAppExecution = 0;
}

- (void)_applicationDidEnterBackground:(id)a3
{
  NSLog(&cfstr_Externalaccess_18.isa, a2, a3);
  if (+[EAAccessoryManager isLoggingEnabled]) {
    NSLog(&cfstr_Externalaccess_19.isa, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _applicationDidEnterBackground:]", 1119, __capabilities, 16, 32);
  }
  if (_backgroundTask)
  {
    uint64_t v4 = objc_opt_class();
    NSLog(&cfstr_Externalaccess_20.isa, v4, _backgroundTask);
  }
  id v5 = (void *)[NSClassFromString(&cfstr_Uiapplication.isa) sharedApplication];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__EAAccessoryManager__applicationDidEnterBackground___block_invoke;
  v9[3] = &unk_1E6293EF8;
  v9[4] = self;
  _backgroundTask = [v5 beginBackgroundTaskWithName:@"EA_BackgroundTask" expirationHandler:v9];
  if (+[EAAccessoryManager isLoggingEnabled])
  {
    uint64_t v6 = objc_opt_class();
    NSLog(&cfstr_Externalaccess_24.isa, v6, _backgroundTask);
  }
  if ((__capabilities & 0x30) != 0)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__EAAccessoryManager__applicationDidEnterBackground___block_invoke_2;
    block[3] = &unk_1E6293EF8;
    block[4] = self;
    dispatch_async(global_queue, block);
  }
  else
  {
    [(EAAccessoryManager *)self _cleanUpForTaskSuspendWithTaskIdentifier:_backgroundTask];
  }
}

void __53__EAAccessoryManager__applicationDidEnterBackground___block_invoke()
{
  if (+[EAAccessoryManager isLoggingEnabled])
  {
    uint64_t v0 = objc_opt_class();
    NSLog(&cfstr_Externalaccess_21.isa, v0, _backgroundTask);
  }
  uint64_t v1 = _backgroundTask;
  uint64_t v2 = objc_opt_class();
  if (v1)
  {
    NSLog(&cfstr_Externalaccess_22.isa, v2, _backgroundTask);
    objc_msgSend((id)-[objc_class sharedApplication](NSClassFromString(&cfstr_Uiapplication.isa), "sharedApplication"), "endBackgroundTask:", _backgroundTask);
    _backgroundTask = 0;
  }
  else
  {
    NSLog(&cfstr_Externalaccess_23.isa, v2);
  }
}

uint64_t __53__EAAccessoryManager__applicationDidEnterBackground___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkForConnectedAccessories:1 backgroundTaskIdentifier:_backgroundTask];
}

- (id)_findExtraAccessoriesContainedOnlyIniAP:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = a3;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    uint64_t v9 = *MEMORY[0x1E4F6A610];
    uint64_t v10 = *MEMORY[0x1E4F6A5E0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v13 = (void *)[v12 objectForKey:v9];
        id Accessory = __findAccessory([v13 unsignedIntValue], self->_connectedAccessories);
        if (Accessory
          || (id Accessory = __findAccessory([v13 unsignedIntValue], self->_sequesteredAccessories)) != 0)
        {
          if (objc_msgSend(Accessory, "containsSameProtocolsAsiAPAccessoryProtocols:", objc_msgSend(v12, "objectForKey:", v10)))continue; {
          if (+[EAAccessoryManager isLoggingEnabled])
          }
            NSLog(&cfstr_Externalaccess_25.isa, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _findExtraAccessoriesContainedOnlyIniAP:]", 1194, v12, [Accessory protocolStrings]);
        }
        [v5 addObject:v12];
        if (+[EAAccessoryManager isLoggingEnabled]) {
          NSLog(&cfstr_Externalaccess_26.isa, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _findExtraAccessoriesContainedOnlyIniAP:]", 1208, v12, [v5 count]);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  return v5;
}

- (id)_findExtraAccessoriesContainedOnlyInEA:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:self->_connectedAccessories];
  [v5 addObjectsFromArray:self->_sequesteredAccessories];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    uint64_t v9 = *MEMORY[0x1E4F6A610];
    uint64_t v21 = *(void *)v25;
    do
    {
      uint64_t v10 = 0;
      uint64_t v22 = v7;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
        if (([v11 createdByCoreAccessories] & 1) == 0)
        {
          v23 = v11;
          uint64_t v12 = [v11 connectionID];
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          uint64_t v13 = [a3 countByEnumeratingWithState:&v28 objects:v33 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            char v15 = 0;
            uint64_t v16 = *(void *)v29;
            while (1)
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v29 != v16) {
                  objc_enumerationMutation(a3);
                }
                if (v15) {
                  goto LABEL_13;
                }
                if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "objectForKey:", v9), "unsignedIntegerValue") == v12)
                {
                  if (+[EAAccessoryManager isLoggingEnabled]) {
                    NSLog(&cfstr_Externalaccess_81.isa, v12);
                  }
LABEL_13:
                  char v15 = 1;
                  continue;
                }
                char v15 = 0;
              }
              uint64_t v14 = [a3 countByEnumeratingWithState:&v28 objects:v33 count:16];
              if (!v14) {
                goto LABEL_22;
              }
            }
          }
          char v15 = 0;
LABEL_22:
          BOOL v18 = +[EAAccessoryManager isLoggingEnabled];
          uint64_t v7 = v22;
          if ((v15 & 1) == 0 && v18) {
            NSLog(&cfstr_Externalaccess_82.isa, v12);
          }
          uint64_t v8 = v21;
          if ((v15 & 1) == 0)
          {
            [v20 addObject:v23];
            if (+[EAAccessoryManager isLoggingEnabled]) {
              NSLog(&cfstr_Externalaccess_27.isa, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _findExtraAccessoriesContainedOnlyInEA:]", v23, [v20 count]);
            }
          }
        }
        ++v10;
      }
      while (v10 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v7);
  }
  return v20;
}

- (void)_checkForConnectedAccessories:(BOOL)a3 backgroundTaskIdentifier:(unint64_t)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  BOOL v26 = a3;
  NSLog(&cfstr_Externalaccess_28.isa, a2, "-[EAAccessoryManager _checkForConnectedAccessories:backgroundTaskIdentifier:]", a3, a4);
  char v5 = __capabilities;
  uint64_t v6 = IAPAppConnectedAccessories();
  id v25 = [(EAAccessoryManager *)self _findExtraAccessoriesContainedOnlyIniAP:v6];
  id v7 = [(EAAccessoryManager *)self _findExtraAccessoriesContainedOnlyInEA:v6];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v8, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "_internalConnectionID")));
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v10);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v13 = [v8 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v33;
    uint64_t v16 = *MEMORY[0x1E4F6A610];
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v8);
        }
        uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        if (+[EAAccessoryManager isLoggingEnabled]
          || (v5 & 0x10) != 0
          || (v5 & 0x20) != 0)
        {
          NSLog(&cfstr_Externalaccess_29.isa, "-[EAAccessoryManager _checkForConnectedAccessories:backgroundTaskIdentifier:]", v18);
        }
        -[EAAccessoryManager _externalAccessoryDisconnected:](self, "_externalAccessoryDisconnected:", objc_msgSend(MEMORY[0x1E4F28EA0], "notificationWithName:object:userInfo:", @"EAAccessoryCleanUpForTaskSuspend", self, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", v18, v16)));
      }
      uint64_t v14 = [v8 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v14);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v19 = [v25 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v25);
        }
        uint64_t v23 = *(void *)(*((void *)&v28 + 1) + 8 * k);
        if (+[EAAccessoryManager isLoggingEnabled]
          || (v5 & 0x10) != 0
          || (v5 & 0x20) != 0)
        {
          NSLog(&cfstr_Externalaccess_30.isa, "-[EAAccessoryManager _checkForConnectedAccessories:backgroundTaskIdentifier:]", v23);
        }
        -[EAAccessoryManager _externalAccessoryConnected:](self, "_externalAccessoryConnected:", [MEMORY[0x1E4F28EA0] notificationWithName:@"EAAccessoryReConnectOnEnterForeground" object:self userInfo:v23]);
      }
      uint64_t v20 = [v25 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v20);
  }
  if (v26)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__EAAccessoryManager__checkForConnectedAccessories_backgroundTaskIdentifier___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __77__EAAccessoryManager__checkForConnectedAccessories_backgroundTaskIdentifier___block_invoke(uint64_t a1)
{
  if (+[EAAccessoryManager isLoggingEnabled]) {
    NSLog(&cfstr_Externalaccess_31.isa, "-[EAAccessoryManager _checkForConnectedAccessories:backgroundTaskIdentifier:]_block_invoke", 1302, *(void *)(a1 + 32), _backgroundTask);
  }
  objc_msgSend((id)-[objc_class sharedApplication](NSClassFromString(&cfstr_Uiapplication.isa), "sharedApplication"), "endBackgroundTask:", *(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  if (_backgroundTask == v2)
  {
    if (+[EAAccessoryManager isLoggingEnabled]) {
      NSLog(&cfstr_Externalaccess_32.isa, "-[EAAccessoryManager _checkForConnectedAccessories:backgroundTaskIdentifier:]_block_invoke", *(void *)(a1 + 32));
    }
    _backgroundTasuint64_t k = 0;
  }
  else
  {
    NSLog(&cfstr_Externalaccess_33.isa, "-[EAAccessoryManager _checkForConnectedAccessories:backgroundTaskIdentifier:]_block_invoke", _backgroundTask, v2);
  }
}

- (void)_cleanUpForTaskSuspendWithTaskIdentifier:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_connectedAccessories, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  connectedAccessories = self->_connectedAccessories;
  uint64_t v6 = [(NSMutableArray *)connectedAccessories countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(connectedAccessories);
        }
        objc_msgSend(v4, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "_internalConnectionID")));
      }
      uint64_t v7 = [(NSMutableArray *)connectedAccessories countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    uint64_t v13 = *MEMORY[0x1E4F6A610];
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v4);
        }
        -[EAAccessoryManager _externalAccessoryDisconnected:](self, "_externalAccessoryDisconnected:", objc_msgSend(MEMORY[0x1E4F28EA0], "notificationWithName:object:userInfo:", @"EAAccessoryCleanUpForTaskSuspend", self, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", *(void *)(*((void *)&v16 + 1) + 8 * j), v13)));
      }
      uint64_t v11 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v11);
  }
  if (+[EAAccessoryManager isLoggingEnabled]) {
    NSLog(&cfstr_Externalaccess_34.isa, "-[EAAccessoryManager _cleanUpForTaskSuspendWithTaskIdentifier:]", a3);
  }
  objc_msgSend((id)-[objc_class sharedApplication](NSClassFromString(&cfstr_Uiapplication.isa), "sharedApplication"), "endBackgroundTask:", a3);
  if (_backgroundTask == a3)
  {
    if (+[EAAccessoryManager isLoggingEnabled]) {
      NSLog(&cfstr_Externalaccess_35.isa, "-[EAAccessoryManager _cleanUpForTaskSuspendWithTaskIdentifier:]", _backgroundTask);
    }
    _backgroundTasuint64_t k = 0;
  }
  else
  {
    NSLog(&cfstr_Externalaccess_36.isa, "-[EAAccessoryManager _cleanUpForTaskSuspendWithTaskIdentifier:]", _backgroundTask, a3);
  }
}

- (void)_applicationWillEnterForeground:(id)a3
{
  NSLog(&cfstr_Externalaccess_37.isa, a2, "-[EAAccessoryManager _applicationWillEnterForeground:]", a3);
  if (+[EAAccessoryManager isLoggingEnabled]) {
    NSLog(&cfstr_Externalaccess_19.isa, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _applicationWillEnterForeground:]", 1362, __capabilities, 16, 32);
  }
  if ((__capabilities & 0x30) == 0
    && +[EAAccessoryManager isLoggingEnabled])
  {
    NSLog(&cfstr_Externalaccess_38.isa, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _applicationWillEnterForeground:]", 1379);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__EAAccessoryManager__applicationWillEnterForeground___block_invoke;
  block[3] = &unk_1E6293EF8;
  block[4] = self;
  dispatch_async(global_queue, block);
}

uint64_t __54__EAAccessoryManager__applicationWillEnterForeground___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkForConnectedAccessories:0 backgroundTaskIdentifier:0];
}

- (void)_externalAccessoryReconnected:(id)a3
{
  if (+[EAAccessoryManager isLoggingEnabled]) {
    NSLog(&cfstr_Externalaccess_39.isa, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _externalAccessoryReconnected:]", 1400, [a3 userInfo]);
  }

  [(EAAccessoryManager *)self _externalAccessoryConnected:a3];
}

- (void)_removeAlliAPAccessoriesFromArray:(id)a3 notifyClients:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = [a3 count];
  BOOL v8 = +[EAAccessoryManager isLoggingEnabled];
  uint64_t v9 = [a3 count];
  if (v8) {
    NSLog(&cfstr_Externalaccess_40.isa, "-[EAAccessoryManager _removeAlliAPAccessoriesFromArray:notifyClients:]", v4, v9, a3);
  }
  else {
    NSLog(&cfstr_Externalaccess_41.isa, "-[EAAccessoryManager _removeAlliAPAccessoriesFromArray:notifyClients:]", v4, v9);
  }
  if (v7)
  {
    unsigned int v10 = 1;
    do
    {
      id v11 = (id)[a3 objectAtIndex:0];
      if ([v11 createdByCoreAccessories])
      {
        NSLog(&cfstr_Externalaccess_43.isa, [v11 connectionID]);
      }
      else
      {
        if (+[EAAccessoryManager isLoggingEnabled]) {
          NSLog(&cfstr_Externalaccess_42.isa, "-[EAAccessoryManager _removeAlliAPAccessoriesFromArray:notifyClients:]", v10 - 1, [v11 connectionID], v4);
        }
        [v11 _setConnected:0];
        [a3 removeObjectAtIndex:0];
        if (v4) {
          -[EAAccessoryManager _notifyObserversThatAccessoryDisconnectedWithUserInfo:](self, "_notifyObserversThatAccessoryDisconnectedWithUserInfo:", [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v11 forKey:@"EAAccessoryKey"]);
        }
      }
    }
    while (v7 > v10++);
  }
}

- (void)_externalAccessoryConnectedNotificationHandler:(id)a3
{
  if (+[EAAccessoryManager isLoggingEnabled]) {
    NSLog(&cfstr_Externalaccess_44.isa, "-[EAAccessoryManager _externalAccessoryConnectedNotificationHandler:]", 1445);
  }

  [(EAAccessoryManager *)self _externalAccessoryConnected:a3];
}

- (void)_externalAccessoryConnected:(id)a3
{
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  BOOL v4 = (void *)[a3 userInfo];
  uint64_t v5 = *MEMORY[0x1E4F6A610];
  uint64_t v6 = (void *)[v4 objectForKey:*MEMORY[0x1E4F6A610]];
  if (__findAccessory([v6 unsignedIntValue], self->_connectedAccessories)
    || __findAccessory([v6 unsignedIntValue], self->_sequesteredAccessories))
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F28EA0];
    BOOL v8 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v9 = [v4 objectForKey:v5];
    -[EAAccessoryManager _externalAccessoryDisconnected:](self, "_externalAccessoryDisconnected:", objc_msgSend(v7, "notificationWithName:object:userInfo:", @"EAAccessoryReConnect", self, objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, v5, objc_msgSend(NSNumber, "numberWithBool:", 1), @"EAAccessoryIsReconnecting", 0)));
  }
  unsigned int v10 = objc_alloc_init(EAAccessoryInternal);
  NSLog(&cfstr_Externalaccess_45.isa, v4);
  __convertIAPAccessoryToEAAccessory(v4, v10);
  [(EAAccessoryInternal *)v10 setConnected:1];
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  BOOL v26 = 0;
  BOOL v26 = [(EAAccessoryInternal *)v10 createdByCoreAccessories];
  id v11 = [[EAAccessory alloc] _initWithAccessory:v10];
  [(id)__accessoryListLock lock];
  if (!self->_connectedAccessories) {
    self->_connectedAccessories = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  [(id)__accessoryListLock unlock];
  [(NSRecursiveLock *)self->_pickerLock lock];
  uint64_t v12 = (void *)[v11 macAddress];
  uint64_t v13 = [v12 localizedCompare:self->_selectedBluetoothAddress];
  *((unsigned char *)v28 + 24) = v13 == 0;
  if (self->_sequesterNewAccessories)
  {
    if (v13) {
      BOOL v14 = v12 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    unsigned int v15 = !v14;
  }
  else
  {
    unsigned int v15 = 0;
  }
  if (+[EAAccessoryManager isLoggingEnabled])
  {
    NSLog(&cfstr_Externalaccess_46.isa, v12, self->_selectedBluetoothAddress, v15);
    long long v16 = @"NO";
    if (!v12) {
      long long v16 = @"YES";
    }
    NSLog(&cfstr_Externalaccess_47.isa, v16);
  }
  [(NSRecursiveLock *)self->_pickerLock unlock];
  if (v15)
  {
    sequesteredAccessories = self->_sequesteredAccessories;
    if (!sequesteredAccessories)
    {
      sequesteredAccessories = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      self->_sequesteredAccessories = sequesteredAccessories;
    }
    [(NSMutableArray *)sequesteredAccessories addObject:v11];
  }
  else
  {
    [(id)__accessoryListLock lock];
    [(NSMutableArray *)self->_connectedAccessories addObject:v11];
    NSLog(&cfstr_Externalaccess_48.isa, [v11 connectionID], objc_msgSend(v11, "coreAccessoriesPrimaryUUID"));
    [(id)__accessoryListLock unlock];
  }

  if (*((unsigned char *)v28 + 24))
  {
    [(NSRecursiveLock *)self->_pickerLock lock];
    [(NSTimer *)self->_pickerTimer invalidate];

    self->_pickerTimer = 0;
    [(EABluetoothAccessoryPicker *)self->_picker dismissPicker];

    self->_picker = 0;
    id pickerCompletion = (void (**)(id, void))self->_pickerCompletion;
    if (pickerCompletion)
    {
      pickerCompletion[2](pickerCompletion, 0);
      _Block_release(self->_pickerCompletion);
      self->_id pickerCompletion = 0;
    }
    [(NSRecursiveLock *)self->_pickerLock unlock];
    self->_sequesterNewAccessories = 0;
    [(EAAccessoryManager *)self _integrateSequesteredAccessories];
  }
  uint64_t v19 = [v11 coreAccessoriesPrimaryUUID];
  uint64_t v20 = [v11 connectionID];
  unsigned int v21 = [v11 createdByCoreAccessories];
  NSLog(&cfstr_Externalaccess_49.isa, 1544, v19, v20, v21, __registeredForLocalNotifications);
  if (__registeredForLocalNotifications) {
    char v22 = v15;
  }
  else {
    char v22 = 1;
  }
  if ((v22 & 1) == 0)
  {
    connectionQueue = self->_connectionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__EAAccessoryManager__externalAccessoryConnected___block_invoke;
    block[3] = &unk_1E6293F68;
    block[4] = v6;
    void block[5] = v11;
    void block[7] = v25;
    block[8] = &v27;
    block[6] = self;
    dispatch_async(connectionQueue, block);
  }
  if ([(EAAccessoryManager *)self areLocationAccessoriesEnabled]
    && [v11 supportsLocation]
    && [v11 createdByCoreAccessories])
  {
    NSLog(&cfstr_Externalaccess_55.isa, [v11 coreAccessoriesPrimaryUUID]);
    objc_msgSend((id)__accEAProviderClassInstance, "startLocationInformationForAccessoryUUID:", objc_msgSend(v11, "coreAccessoriesPrimaryUUID"));
  }
  else
  {
    NSLog(&cfstr_Externalaccess_56.isa, -[EAAccessoryManager areLocationAccessoriesEnabled](self, "areLocationAccessoriesEnabled"), [v11 coreAccessoriesPrimaryUUID], objc_msgSend(v11, "supportsLocation"), objc_msgSend(v11, "createdByCoreAccessories"));
  }

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);
}

void __50__EAAccessoryManager__externalAccessoryConnected___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) && (__capabilities & 0x30) == 0x20)
  {
    int v6 = 2;
    [*(id *)(a1 + 32) unsignedIntValue];
    uint64_t v2 = (void *)RetainConnectionToIAPDaemonByCheckingConnectionID();
    if (+[EAAccessoryManager isLoggingEnabled]) {
      NSLog(&cfstr_Externalaccess_51.isa, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _externalAccessoryConnected:]_block_invoke", 1570, *(void *)(a1 + 32));
    }
    [*(id *)(a1 + 40) _setNotPresentInIAPAccessoriesArray:1];
    if (v2) {
      xpc_release(v2);
    }
  }
  NSLog(&cfstr_Externalaccess_52.isa, 1583, [*(id *)(a1 + 40) _internalNotPresentInIAPAccessoriesArray]);
  if ([*(id *)(a1 + 40) _internalNotPresentInIAPAccessoriesArray])
  {
    if (+[EAAccessoryManager isLoggingEnabled]) {
      NSLog(&cfstr_Externalaccess_53.isa, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _externalAccessoryConnected:]_block_invoke", 1590);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__EAAccessoryManager__externalAccessoryConnected___block_invoke_2;
    block[3] = &unk_1E6293F40;
    uint64_t v5 = *(void *)(a1 + 64);
    long long v4 = *(_OWORD *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __50__EAAccessoryManager__externalAccessoryConnected___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setObject:*(void *)(a1 + 32) forKey:@"EAAccessoryKey"];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    objc_msgSend(v2, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"EAAccessorySelectedKey");
  }
  NSLog(&cfstr_Externalaccess_54.isa, 1608, [*(id *)(a1 + 32) coreAccessoriesPrimaryUUID], objc_msgSend(*(id *)(a1 + 32), "connectionID"), objc_msgSend(*(id *)(a1 + 32), "createdByCoreAccessories"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"EAAccessoryDidConnectNotification", *(void *)(a1 + 40), v2);
}

- (void)_externalAccessoryUpdated:(id)a3
{
  long long v4 = (void *)[a3 userInfo];
  uint64_t v5 = (void *)[v4 objectForKey:*MEMORY[0x1E4F6A610]];
  id Accessory = __findAccessory([v5 unsignedIntValue], self->_connectedAccessories);
  id v7 = Accessory;
  if (Accessory || (id v7 = __findAccessory([v5 unsignedIntValue], self->_sequesteredAccessories)) != 0)
  {
    [v7 _updateAccessoryInfo:v4];
    if (Accessory) {
      BOOL v8 = __registeredForLocalNotifications == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      uint64_t v9 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v7 forKey:@"EAAccessoryKey"];
      [v9 postNotificationName:@"EAAccessoryUpdateNotification" object:self userInfo:v10];
    }
  }
}

- (void)_pointOfInterestStatusReceived:(id)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  int v6 = (void *)[a3 userInfo];
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E4F6A5B8]), @"EAAccessoryDestinationStatusIdentifierKey");
  id v7 = (void *)[a3 userInfo];
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E4F6A5B0]), @"EAAccessoryDestinationStatusDidSucceedKey");
  BOOL v8 = (void *)[a3 userInfo];
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E4F6A5C0]), @"EAAccessoryDestinationStatusParametersUsedKey");
  uint64_t v9 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];

  [v9 postNotificationName:@"EAAccessoryDestinationStatusNotification" object:self userInfo:v5];
}

- (void)_OOBBTPairingCompletionStatusReceived:(id)a3
{
  uint64_t v5 = (void *)[a3 userInfo];
  unsigned int v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E4F6A5A0]), "unsignedIntValue");
  id v7 = (void *)[a3 userInfo];
  uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E4F6A598]), "unsignedCharValue");
  uint64_t v9 = (void *)[a3 userInfo];
  uint64_t v10 = [v9 objectForKey:*MEMORY[0x1E4F6A588]];
  id Accessory = __findAccessory(v6, [(EAAccessoryManager *)self connectedAccessories]);

  [Accessory _OOBBTPairingCompletedWithStatus:v8 forAccessoryWithMACAddress:v10];
}

- (void)_externalAccessoryDisconnected:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[a3 userInfo];
  unsigned int v6 = (void *)[v5 objectForKey:*MEMORY[0x1E4F6A610]];
  NSLog(&cfstr_Externalaccess_57.isa, "-[EAAccessoryManager _externalAccessoryDisconnected:]", [v6 unsignedLongLongValue]);
  if (v6)
  {
    uint64_t v27 = [v6 unsignedIntValue];
    [(id)__accessoryListLock lock];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    p_connectedAccessories = &self->_connectedAccessories;
    connectedAccessories = self->_connectedAccessories;
    uint64_t v9 = [(NSMutableArray *)connectedAccessories countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v33;
      while (2)
      {
        uint64_t v13 = 0;
        uint64_t v14 = v11 + v10;
        do
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(connectedAccessories);
          }
          if ([*(id *)(*((void *)&v32 + 1) + 8 * v13) connectionID] == v27)
          {
            uint64_t v22 = v11 + v13;
            int v23 = 1;
LABEL_23:
            long long v24 = *p_connectedAccessories;
            id v25 = (id)[(NSMutableArray *)v24 objectAtIndex:v22];
            [v25 _setConnected:0];
            [(NSMutableArray *)v24 removeObjectAtIndex:v22];
            [(id)__accessoryListLock unlock];
            if ([v25 _internalNotPresentInIAPAccessoriesArray])
            {
              if (+[EAAccessoryManager isLoggingEnabled]) {
                NSLog(&cfstr_Externalaccess_58.isa, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _externalAccessoryDisconnected:]", 1749, v27);
              }
            }
            else if (v23)
            {
              if (+[EAAccessoryManager isLoggingEnabled]) {
                NSLog(&cfstr_Externalaccess_59.isa, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _externalAccessoryDisconnected:]", 1757, v27, v25);
              }
              -[EAAccessoryManager _notifyObserversThatAccessoryDisconnectedWithUserInfo:](self, "_notifyObserversThatAccessoryDisconnectedWithUserInfo:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v25, @"EAAccessoryKey", objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"EAAccessoryIsReconnecting"), @"EAAccessoryIsReconnecting", 0));
            }

            return;
          }
          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [(NSMutableArray *)connectedAccessories countByEnumeratingWithState:&v32 objects:v37 count:16];
        uint64_t v11 = v14;
        if (v10) {
          continue;
        }
        break;
      }
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    p_connectedAccessories = &self->_sequesteredAccessories;
    sequesteredAccessories = self->_sequesteredAccessories;
    uint64_t v16 = [(NSMutableArray *)sequesteredAccessories countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v29;
      while (2)
      {
        uint64_t v20 = 0;
        uint64_t v21 = v18 + v17;
        do
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(sequesteredAccessories);
          }
          if ([*(id *)(*((void *)&v28 + 1) + 8 * v20) connectionID] == v27)
          {
            int v23 = 0;
            uint64_t v22 = v18 + v20;
            goto LABEL_23;
          }
          ++v20;
        }
        while (v17 != v20);
        uint64_t v17 = [(NSMutableArray *)sequesteredAccessories countByEnumeratingWithState:&v28 objects:v36 count:16];
        uint64_t v18 = v21;
        if (v17) {
          continue;
        }
        break;
      }
    }
    [(id)__accessoryListLock unlock];
    NSLog(&cfstr_Externalaccess_60.isa, v27);
  }
  else
  {
    NSLog(&cfstr_Externalaccess_61.isa, v26);
  }
}

- (void)_locationNmeaDataAvailable:(id)a3
{
  long long v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);

  [v4 postNotificationName:@"EAAccessoryDidReceiveNMEASentenceNotification" object:self userInfo:0];
}

- (void)_locationPointDataAvailable:(id)a3
{
  long long v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);

  [v4 postNotificationName:@"EAAccessoryDidReceiveLocationPointDataNotification" object:self userInfo:0];
}

- (void)_ephemerisURLAvailable:(id)a3
{
  long long v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);

  [v4 postNotificationName:@"EAAccessoryDidReceiveEphemerisURLNotification" object:self userInfo:0];
}

- (void)_nmeaFilteringSupportChanged:(id)a3
{
  long long v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);

  [v4 postNotificationName:@"EAAccessoryNMEASentenceFilteringSupportChangedNotification" object:self userInfo:0];
}

- (void)_gpsTimeRequested:(id)a3
{
  long long v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);

  [v4 postNotificationName:@"EAAccessoryDidRequestGPSTimeNotification" object:self userInfo:0];
}

- (void)_vehicleDataUpdated:(id)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = [a3 userInfo];

  [v5 postNotificationName:@"EAAccessoryVehicleDataUpdate" object:self userInfo:v6];
}

- (void)_cameraInfoUpdated:(id)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = [a3 userInfo];

  [v5 postNotificationName:@"EAAccessoryCameraInfoNotification" object:self userInfo:v6];
}

- (void)_integrateSequesteredAccessories
{
  if ([(NSMutableArray *)self->_sequesteredAccessories count])
  {
    uint64_t v3 = MEMORY[0x1E4F14428];
    do
    {
      long long v4 = (void *)[(NSMutableArray *)self->_sequesteredAccessories objectAtIndex:0];
      id v5 = v4;
      [(NSMutableArray *)self->_sequesteredAccessories removeObjectAtIndex:0];
      [(NSMutableArray *)self->_connectedAccessories addObject:v4];
      if (__registeredForLocalNotifications)
      {
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 3221225472;
        v6[2] = __54__EAAccessoryManager__integrateSequesteredAccessories__block_invoke;
        v6[3] = &unk_1E6293F90;
        v6[4] = self;
        v6[5] = v4;
        dispatch_async(v3, v6);
      }
    }
    while ([(NSMutableArray *)self->_sequesteredAccessories count]);
  }
}

uint64_t __54__EAAccessoryManager__integrateSequesteredAccessories__block_invoke(uint64_t a1)
{
  id v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:*(void *)(a1 + 40) forKey:@"EAAccessoryKey"];

  return [v2 postNotificationName:@"EAAccessoryDidConnectNotification" object:v3 userInfo:v4];
}

- (void)_handleAccessoryNotificationTimeout:(id)a3
{
  [(NSRecursiveLock *)self->_pickerLock lock];
  self->_pickerTimer = 0;
  [(EABluetoothAccessoryPicker *)self->_picker dismissPicker];

  self->_picker = 0;
  if (+[EAAccessoryManager isLoggingEnabled]) {
    NSLog(&cfstr_Externalaccess_62.isa);
  }
  id pickerCompletion = (void (**)(id, uint64_t))self->_pickerCompletion;
  if (pickerCompletion)
  {
    pickerCompletion[2](pickerCompletion, [MEMORY[0x1E4F28C58] errorWithDomain:@"EABluetoothAccessoryPickerErrorDomain" code:1 userInfo:0]);
    _Block_release(self->_pickerCompletion);
    self->_id pickerCompletion = 0;
  }
  [(NSRecursiveLock *)self->_pickerLock unlock];
  self->_sequesterNewAccessories = 0;

  [(EAAccessoryManager *)self _integrateSequesteredAccessories];
}

- (void)_timeSyncInfoUpdated:(id)a3
{
  id v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = [a3 userInfo];

  [v5 postNotificationName:@"EAAccessoryTimeSyncInfoUpdate" object:self userInfo:v6];
}

+ (void)registerCapabilities:(unsigned int)a3
{
  __capabilities |= a3;
}

- (void)openCompleteForSession:(unsigned int)a3 connectionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  id Accessory = __findAccessory(a4, self->_connectedAccessories);

  [Accessory _openCompleteForSession:v4];
}

- (void)endSession:(unsigned int)a3 forConnectionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  id Accessory = __findAccessory(a4, self->_connectedAccessories);

  [Accessory _endSession:v4];
}

- (void)wakeAccessoryWithToken:(id)a3
{
  uint64_t v4 = 0;
  uint64_t v3 = (void *)[MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:&v4];
  if (!v4) {
    +[EABluetoothAccessoryPicker wakeSelectedBluetoothAccessories:](EABluetoothAccessoryPicker, "wakeSelectedBluetoothAccessories:", [v3 objectForKey:@"EAAccessoryMacAddress"]);
  }
}

- (BOOL)appDeclaresProtocol:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!_CFExecutableLinkedOnOrAfter() || (__supportsEAShowAllAccessoriesEntitlement & 1) != 0)
  {
LABEL_3:
    LOBYTE(v4) = 1;
    return v4;
  }
  id v5 = (id)__declaredProtocols;
  if (__declaredProtocols) {
    goto LABEL_11;
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "objectForInfoDictionaryKey:", @"UISupportedExternalAccessoryProtocols");
  if (!v6 || (id v7 = (void *)v6, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = (id)__declaredProtocols;
    if (!__declaredProtocols) {
      goto LABEL_9;
    }
LABEL_11:
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (!v4) {
      return v4;
    }
    uint64_t v8 = v4;
    uint64_t v9 = *(void *)v13;
LABEL_13:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v13 != v9) {
        objc_enumerationMutation(v5);
      }
      if (![*(id *)(*((void *)&v12 + 1) + 8 * v10) caseInsensitiveCompare:a3]) {
        goto LABEL_3;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        LOBYTE(v4) = 0;
        if (v8) {
          goto LABEL_13;
        }
        return v4;
      }
    }
  }
  id v5 = v7;
  __declaredProtocols = (uint64_t)v5;
  if (v5) {
    goto LABEL_11;
  }
LABEL_9:
  LOBYTE(v4) = 0;
  return v4;
}

- (id)_connectedAccessories
{
  return self->_connectedAccessories;
}

- (BOOL)shouldAllowInternalProtocols
{
  return __shouldAllowInternalProtocols;
}

- (void)setShouldAllowInternalProtocols:(BOOL)a3
{
  __shouldAllowInternalProtocols = a3;
}

- (BOOL)shouldAllowCppRuntime
{
  return __shouldAllowCppRuntime;
}

- (void)setShouldAllowCppRuntime:(BOOL)a3
{
  __shouldAllowCppRuntime = a3;
}

+ (void)accessibilityStartListening
{
}

+ (void)accessibilityStopListening
{
}

- (void)accessibilityAction:(id)a3
{
  unsigned int v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F6A610]), "unsignedIntValue");
  if (v5)
  {
    id Accessory = __findAccessory(v5, self->_connectedAccessories);
    [Accessory delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"EAAccessoryAccessibilityActionKey"), "unsignedIntValue");
      uint64_t v8 = (void *)[Accessory delegate];
      [v8 accessibilityAccessory:Accessory performAction:v7 withObject:a3];
    }
  }
}

- (void)accessibilityContextChange:(id)a3
{
  unsigned int v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F6A610]), "unsignedIntValue");
  if (v5)
  {
    id Accessory = __findAccessory(v5, self->_connectedAccessories);
    [Accessory delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"EAAccessoryAccessibilityContextKey"), "unsignedIntValue");
      uint64_t v8 = (void *)[Accessory delegate];
      [v8 accessibilityAccessory:Accessory setContext:v7];
    }
  }
}

- (void)accessibilityItemPropertyRequest:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F6A610]), "unsignedIntValue");
  if (v5)
  {
    uint64_t v6 = v5;
    id Accessory = __findAccessory(v5, self->_connectedAccessories);
    [Accessory delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"EAAccessoryAccessibilityItemPropertyKey"), "unsignedIntValue");
      if ((v8 - 1) <= 4)
      {
        uint64_t v9 = objc_msgSend((id)objc_msgSend(Accessory, "delegate"), "accessibilityAccessory:currentValueForItemProperty:", Accessory, v8);
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(a3, "objectForKey:", @"EAAccessoryAccessibilityItemPropertyKey"), @"EAAccessoryAccessibilityItemPropertyKey", objc_msgSend(a3, "objectForKey:", @"EAAccessoryAccessibilityContextKey"), @"EAAccessoryAccessibilityContextKey", v9, @"EAAccessoryAccessibilityResponseKey", 0);
        MEMORY[0x1F4122AB8](v6, v10);
      }
    }
  }
}

- (void)accessibilitySystemPropertyChange:(id)a3
{
  unsigned int v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F6A610]), "unsignedIntValue");
  if (v5)
  {
    id Accessory = __findAccessory(v5, self->_connectedAccessories);
    [Accessory delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"EAAccessoryAccessibilitySystemPropertyKey"), "unsignedIntValue");
      uint64_t v8 = (void *)[Accessory delegate];
      [v8 accessibilityAccessory:Accessory setValue:a3 forSystemProperty:v7];
    }
  }
}

- (void)accessibilitySystemPropertyRequest:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F6A610]), "unsignedIntValue");
  if (v5)
  {
    uint64_t v6 = v5;
    id Accessory = __findAccessory(v5, self->_connectedAccessories);
    [Accessory delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"EAAccessoryAccessibilitySystemPropertyKey"), "unsignedIntValue");
      if ((v8 - 1) <= 2)
      {
        uint64_t v9 = objc_msgSend((id)objc_msgSend(Accessory, "delegate"), "accessibilityAccessory:currentValueForSystemProperty:", Accessory, v8);
        if (v9)
        {
          uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(a3, "objectForKey:", @"EAAccessoryAccessibilitySystemPropertyKey"), @"EAAccessoryAccessibilitySystemPropertyKey", v9, @"EAAccessoryAccessibilityResponseKey", objc_msgSend(a3, "objectForKey:", @"EAAccessoryAccessibilityContextKey"), @"EAAccessoryAccessibilityContextKey", 0);
          MEMORY[0x1F4122AB8](v6, v10);
        }
      }
    }
  }
}

- (BOOL)areLocationAccessoriesEnabled
{
  return __areLocationAccessoriesEnabled;
}

- (void)sendGPRMCDataStatus:(BOOL)a3 ValueV:(BOOL)a4 ValueX:(BOOL)a5 forUUID:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  if (__findAccessoryByUUID((uint64_t)a6, self->_connectedAccessories))
  {
    uint64_t v10 = (void *)__accEAProviderClassInstance;
    [v10 sendGPRMCDataStatus:v9 ValueV:v8 ValueX:v7 forAccessoryUUID:a6];
  }
}

- (void)pointOfInterestSelection:(id)a3
{
  unsigned int v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F6A610]), "unsignedIntValue");
  if (v5)
  {
    id Accessory = __findAccessory(v5, self->_connectedAccessories);
    [Accessory delegate];
    if (objc_opt_respondsToSelector())
    {
      BOOL v7 = (void *)[Accessory delegate];
      [v7 pointOfInterestAccessory:Accessory pointOfInterestSelection:a3];
    }
  }
}

- (BOOL)destinationInformation:(id)a3 forAccessoryUUID:(id)a4
{
  return 1;
}

+ (BOOL)isLoggingEnabled
{
  int v2 = isLoggingEnabled_isLoggingEnabled;
  if (isLoggingEnabled_isLoggingEnabled == 255)
  {
    CFPropertyListRef v3 = CFPreferencesCopyValue(@"LogEAEvents", @"com.apple.logging", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    int v2 = [(id)(id)CFMakeCollectable(v3) BOOLValue];
    isLoggingEnabled_isLoggingEnabled = v2;
  }
  return v2 != 0;
}

- (void)devicePicker:(id)a3 didSelectAddress:(id)a4 errorCode:(int64_t)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->_pickerLock lock];
  if (self->_picker == a3)
  {
    if (+[EAAccessoryManager isLoggingEnabled]) {
      NSLog(&cfstr_BtpickerAddres.isa, [a4 cStringUsingEncoding:1], a5);
    }
    if (a4 && [a4 length])
    {
      self->_selectedBluetoothAddress = (NSString *)[[NSString alloc] initWithString:a4];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      connectedAccessories = self->_connectedAccessories;
      uint64_t v10 = [(NSMutableArray *)connectedAccessories countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = 0;
        uint64_t v13 = *(void *)v39;
        while (2)
        {
          uint64_t v14 = 0;
          uint64_t v15 = v12 + v11;
          do
          {
            if (*(void *)v39 != v13) {
              objc_enumerationMutation(connectedAccessories);
            }
            uint64_t v16 = *(void **)(*((void *)&v38 + 1) + 8 * v14);
            if (!objc_msgSend((id)objc_msgSend(v16, "macAddress"), "localizedCompare:", self->_selectedBluetoothAddress))
            {
              uint64_t v18 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"EABluetoothAccessoryPickerErrorDomain" code:0 userInfo:0];
              id v19 = v18;
              int v20 = 0;
              uint64_t v21 = v12 + v14;
LABEL_30:
              [(EABluetoothAccessoryPicker *)self->_picker dismissPicker];

              self->_picker = 0;
              id pickerCompletion = (void (**)(id, void *))self->_pickerCompletion;
              if (pickerCompletion)
              {
                pickerCompletion[2](pickerCompletion, v18);
                _Block_release(self->_pickerCompletion);
                self->_id pickerCompletion = 0;
              }

              if (v20)
              {
                id v31 = v16;
                [(NSMutableArray *)self->_sequesteredAccessories removeObjectAtIndex:v21];
                [(NSMutableArray *)self->_connectedAccessories addObject:v16];

                if (__registeredForLocalNotifications)
                {
                  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                  [v32 setObject:v16 forKey:@"EAAccessoryKey"];
                  objc_msgSend(v32, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"EAAccessorySelectedKey");
                  block[0] = MEMORY[0x1E4F143A8];
                  block[1] = 3221225472;
                  block[2] = __62__EAAccessoryManager_devicePicker_didSelectAddress_errorCode___block_invoke;
                  block[3] = &unk_1E6293F90;
                  void block[4] = self;
                  void block[5] = v32;
                  dispatch_async(MEMORY[0x1E4F14428], block);
                }
              }
              self->_sequesterNewAccessories = 0;
              [(EAAccessoryManager *)self _integrateSequesteredAccessories];

              self->_selectedBluetoothAddress = 0;
              goto LABEL_36;
            }
            ++v14;
          }
          while (v11 != v14);
          uint64_t v11 = [(NSMutableArray *)connectedAccessories countByEnumeratingWithState:&v38 objects:v43 count:16];
          uint64_t v12 = v15;
          if (v11) {
            continue;
          }
          break;
        }
      }
      else
      {
        uint64_t v15 = 0;
      }
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      sequesteredAccessories = self->_sequesteredAccessories;
      uint64_t v23 = [(NSMutableArray *)sequesteredAccessories countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v35;
        while (2)
        {
          uint64_t v26 = 0;
          uint64_t v27 = v15 + v24;
          do
          {
            if (*(void *)v35 != v25) {
              objc_enumerationMutation(sequesteredAccessories);
            }
            uint64_t v16 = *(void **)(*((void *)&v34 + 1) + 8 * v26);
            if (!objc_msgSend((id)objc_msgSend(v16, "macAddress"), "localizedCompare:", self->_selectedBluetoothAddress))
            {
              uint64_t v18 = 0;
              uint64_t v21 = v15 + v26;
              int v20 = 1;
              goto LABEL_30;
            }
            ++v26;
          }
          while (v24 != v26);
          uint64_t v24 = [(NSMutableArray *)sequesteredAccessories countByEnumeratingWithState:&v34 objects:v42 count:16];
          uint64_t v15 = v27;
          if (v24) {
            continue;
          }
          break;
        }
      }
      long long v28 = (NSTimer *)[MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__handleAccessoryNotificationTimeout_ selector:0 userInfo:0 repeats:10.0];
      self->_pickerTimer = v28;
      long long v29 = v28;
    }
    else
    {
      [(EABluetoothAccessoryPicker *)self->_picker dismissPicker];

      self->_picker = 0;
      uint64_t v17 = (void (**)(id, uint64_t))self->_pickerCompletion;
      if (v17)
      {
        v17[2](v17, [MEMORY[0x1E4F28C58] errorWithDomain:@"EABluetoothAccessoryPickerErrorDomain" code:a5 userInfo:0]);
        _Block_release(self->_pickerCompletion);
        self->_id pickerCompletion = 0;
      }
      self->_sequesterNewAccessories = 0;
      [(EAAccessoryManager *)self _integrateSequesteredAccessories];
    }
  }
LABEL_36:
  [(NSRecursiveLock *)self->_pickerLock unlock];
}

uint64_t __62__EAAccessoryManager_devicePicker_didSelectAddress_errorCode___block_invoke(uint64_t a1)
{
  int v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 postNotificationName:@"EAAccessoryDidConnectNotification" object:v3 userInfo:v4];
}

- (void)createEASessionForProtocol:(id)a3 accessoryUUID:(id)a4 withReply:(id)a5
{
}

- (void)closeEASessionForEASessionUUID:(id)a3
{
  if (a3)
  {
    objc_msgSend((id)__currentCoreAccessoriesEASessions, "removeObjectForKey:");
    [(id)__activeCoreAccessoriesEASessions removeObjectForKey:a3];
    uint64_t v4 = (void *)__accEAProviderClassInstance;
    [v4 closeExternalAccessorySession:a3];
  }
}

- (void)accessoryClosedEASession:(id)a3
{
  uint64_t v4 = objc_msgSend((id)__currentCoreAccessoriesEASessions, "objectForKey:");
  [(id)__activeCoreAccessoriesEASessions removeObjectForKey:a3];
  if (v4) {
    objc_msgSend((id)objc_msgSend(v4, "accessory"), "_endSession:", objc_msgSend(v4, "_sessionID"));
  }
  unsigned int v5 = (void *)__currentCoreAccessoriesEASessions;

  [v5 removeObjectForKey:a3];
}

- (void)handleIncomingExternalAccessoryData:(id)a3 forEASessionIdentifier:(id)a4 withReply:(id)a5
{
  BOOL v7 = (void *)[(id)__activeCoreAccessoriesEASessions objectForKey:a4];
  BOOL v8 = v7;
  if (v7) {
    [v7 _handleIncomingEAData:a3];
  }
  BOOL v9 = (void (*)(id, BOOL))*((void *)a5 + 2);

  v9(a5, v8 != 0);
}

- (void)closeInputStreamForEASessionUUID:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (void *)__activeCoreAccessoriesEASessions;
    objc_msgSend(v3, "removeObjectForKey:");
  }
  else if (+[EAAccessoryManager isLoggingEnabled])
  {
    NSLog(&cfstr_Externalaccess_63.isa);
  }
}

- (void)saveEASession:(id)a3 forEASessionUUID:(id)a4
{
  objc_msgSend((id)__currentCoreAccessoriesEASessions, "setObject:forKey:");
  uint64_t v6 = (void *)__activeCoreAccessoriesEASessions;

  [v6 setObject:a3 forKey:a4];
}

- (void)sendOutgoingEAData:(id)a3 forSessionUUID:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__EAAccessoryManager_sendOutgoingEAData_forSessionUUID___block_invoke;
  v4[3] = &unk_1E6293FB8;
  v4[4] = a4;
  [(id)__accEAProviderClassInstance sendOutgoingExternalAccessoryData:a3 forEASessionIdentifier:a4 withReply:v4];
}

void __56__EAAccessoryManager_sendOutgoingEAData_forSessionUUID___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    NSLog(&cfstr_Externalaccess_64.isa, *(void *)(a1 + 32));
  }
}

- (void)openSessionFromAccessoryToApp:(id)a3
{
}

- (void)openSessionFromAppToAccessory:(id)a3
{
}

- (void)sendNMEAFilterList:(id)a3 forUUID:(id)a4
{
  id AccessoryByUUID = __findAccessoryByUUID((uint64_t)a4, self->_connectedAccessories);
  if (AccessoryByUUID)
  {
    NSLog(&cfstr_LocationSendin.isa, [AccessoryByUUID coreAccessoriesPrimaryUUID]);
    BOOL v7 = (void *)__accEAProviderClassInstance;
    [v7 sendNMEAFilterList:a3 forAccessoryUUID:a4];
  }
}

- (BOOL)processIDIsUsingAccessory:(__CFString *)a3
{
  return 0;
}

- (id)authCertForLegacyConnectionID:(unsigned int)a3
{
  id result = __findAccessory(a3, self->_connectedAccessories);
  if (result)
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(result, "certData"), "copy");
    return v4;
  }
  return result;
}

- (id)authCertSerialNumberForLegacyConnectionID:(unsigned int)a3
{
  id result = __findAccessory(a3, self->_connectedAccessories);
  if (result)
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(result, "certSerial"), "copy");
    return v4;
  }
  return result;
}

- (void)requestIAPAccessoryWiFiCredentials:(id)a3
{
  if (__findAccessoryByUUID((uint64_t)a3, self->_connectedAccessories))
  {
    NSLog(&cfstr_Externalaccess_66.isa, a3);
    uint64_t v4 = (void *)__accEAProviderClassInstance;
    [v4 requestAccessoryWifiCredentials:a3];
  }
}

- (id)currentVehicleInformation:(id)a3
{
  if (__findAccessoryByUUID((uint64_t)a3, self->_connectedAccessories))
  {
    NSLog(&cfstr_Vehicleinfosta_2.isa, a3);
    uint64_t v4 = (void *)__accEAProviderClassInstance;
    return (id)[v4 currentVehicleInfo:a3];
  }
  else
  {
    NSLog(&cfstr_Vehicleinfosta_3.isa, a3);
    return 0;
  }
}

- (void)sendDeviceIdentifierNotification:(id)a3 usbIdentifier:(id)a4 forUUID:(id)a5
{
  if (__findAccessoryByUUID((uint64_t)a5, self->_connectedAccessories))
  {
    NSLog(&cfstr_Externalaccess_67.isa, a5);
    BOOL v8 = (void *)__accEAProviderClassInstance;
    [v8 sendDeviceIdentifierNotification:a3 usbIdentifier:a4 forUUID:a5];
  }
}

- (void)sendWiredCarPlayAvailable:(id)a3 usbIdentifier:(id)a4 wirelessCarPlayAvailable:(id)a5 bluetoothIdentifier:(id)a6 forUUID:(id)a7
{
  if (__findAccessoryByUUID((uint64_t)a7, self->_connectedAccessories))
  {
    NSLog(&cfstr_Externalaccess_68.isa, a7);
    uint64_t v12 = (void *)__accEAProviderClassInstance;
    [v12 sendWiredCarPlayAvailable:a3 usbIdentifier:a4 wirelessAvailable:a5 bluetoothIdentifier:a6 forUUID:a7];
  }
}

- (void)sendWiredCarPlayAvailable:(id)a3 usbIdentifier:(id)a4 wirelessCarPlayAvailable:(id)a5 bluetoothIdentifier:(id)a6 themeAssetsAvailable:(id)a7 forUUID:(id)a8
{
  if (__findAccessoryByUUID((uint64_t)a8, self->_connectedAccessories))
  {
    NSLog(&cfstr_Externalaccess_69.isa, a8);
    uint64_t v14 = (void *)__accEAProviderClassInstance;
    [v14 sendWiredCarPlayAvailable:a3 usbIdentifier:a4 wirelessAvailable:a5 bluetoothIdentifier:a6 themeAssetsAvailable:a7 forUUID:a8];
  }
}

+ (id)accessoryDictionaryForLogging:(id)a3
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a3];
  if ([v3 objectForKey:@"IAPAppAccessoryCertDataKey"])
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(v3, "objectForKey:", @"IAPAppAccessoryCertDataKey"), "length");
    [v3 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%lu bytes", v4), @"IAPAppAccessoryCertDataKey" forKey];
  }
  if ([v3 objectForKey:@"IAPAppAccessoryCertSerialNumberKey"])
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(v3, "objectForKey:", @"IAPAppAccessoryCertSerialNumberKey"), "length");
    [v3 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%lu bytes", v5), @"IAPAppAccessoryCertSerialNumberKey" forKey];
  }
  return v3;
}

@end