@interface ACCTransportIOAccessoryManager
- (ACCTransportIOAccessoryManager)initWithIOService:(unsigned int)a3;
- (BOOL)bAccConnected;
- (BOOL)bIsInductive;
- (BOOL)bIsInductivePowerToAccessory;
- (BOOL)bIsWatch;
- (BOOL)batteryPackModeEnabled;
- (BOOL)batteryPackModeEnabledValid;
- (BOOL)currentLimitBaseInmAValid;
- (BOOL)isAdapter;
- (BOOL)isAuthTimedOut;
- (BOOL)isAuthenticated;
- (BOOL)isBatteryPackModeEnabled;
- (BOOL)isPowerDuringSleepEnabled;
- (BOOL)isPowerDuringSleepSupported;
- (BOOL)isRootPort;
- (BOOL)needsOOBPairing;
- (BOOL)notificationUarpStagingActivityTimedOut;
- (BOOL)notificationUarpStagingStatusAlternateActive;
- (BOOL)resetAccessoryBaseCurrent;
- (BOOL)setAccessoryRequestedCurrent:(unsigned int)a3;
- (BOOL)setAccessoryUsedCurrent:(unsigned int)a3;
- (BOOL)setBatteryPackMode:(BOOL)a3 forceResponse:(BOOL)a4;
- (BOOL)setFeaturesFromAuthStatus:(int)a3 authCert:(id)a4 certType:(int)a5;
- (BOOL)setPowerDuringSleepEnabled:(BOOL)a3;
- (BOOL)setUSBCurrentLimitBase:(unsigned int)a3 forceResponse:(BOOL)a4;
- (BOOL)setUSBCurrentOffset:(int)a3;
- (BOOL)setUSBMode:(int)a3;
- (BOOL)supervisedTransportsRestricted;
- (IONotificationPort)batteryNotifyPortRef;
- (NSData)digitalID;
- (NSMutableSet)mutableioAccessoryAuthCPChildPorts;
- (NSMutableSet)mutableioAccessoryChildPorts;
- (NSMutableSet)mutableioAccessoryConfigStreamChildPorts;
- (NSMutableSet)mutableioAccessoryEAChildPorts;
- (NSMutableSet)mutableioAccessoryOOBPairingChildPorts;
- (NSNumber)inductiveDeviceID;
- (NSNumber)inductiveDeviceType;
- (NSNumber)inductiveLocalDeviceID;
- (NSNumber)productID;
- (NSNumber)vendorID;
- (NSSet)authCPChildPorts;
- (NSSet)configStreamChildPorts;
- (NSSet)eaProtocolChildPorts;
- (NSSet)ioAccessoryChildPorts;
- (NSSet)oobPairingChildPorts;
- (NSString)connectionUUID;
- (NSString)deviceFirmwareRevision;
- (NSString)deviceHardwareRevision;
- (NSString)deviceModelNumber;
- (NSString)deviceName;
- (NSString)deviceSerialNumber;
- (NSString)deviceVendorName;
- (NSString)inductiveDeviceUID;
- (NSString)managerParent;
- (NSString)notificationUarpEndUpdateName;
- (NSString)notificationUarpStagingStatusName;
- (NSString)notificationUarpStagingStatusName2;
- (NSString)notificationUarpStartUpdateName;
- (NSString)ppid;
- (NSString)regionCode;
- (OS_dispatch_source)authTimerAccessory;
- (id)_connectionUUIDsForNotification;
- (int)USBCurrentLimitOffsetInmA;
- (int)_ACCPlatformUSBModeForIOAccessoryUSBConnectType:(int)a3;
- (int)_IOAccUSBModeTypeForSetUSBMode:(int)a3;
- (int)_connectionTypeForPrimaryPort;
- (int)accessoryPowerMode;
- (int)cableType;
- (int)connectionType;
- (int)getUSBMode;
- (int)resistorID;
- (unsigned)USBChargingVoltageInmV;
- (unsigned)USBCurrentLimitBaseInmA;
- (unsigned)USBCurrentLimitInmA;
- (unsigned)accessoryChargingCurrentInmA;
- (unsigned)accessoryPowerModeCurrentLimitInmA:(int)a3;
- (unsigned)batteryChargeLevelPercent;
- (unsigned)batteryIterator;
- (unsigned)currentLimitBaseInmA;
- (unsigned)notificationRef;
- (unsigned)sleepPowerCurrentLimitInmA;
- (void)USBChargingVoltageInmV;
- (void)USBCurrentLimitBaseInmA;
- (void)USBCurrentLimitInmA;
- (void)USBCurrentLimitOffsetInmA;
- (void)_clearAccessoryInfo;
- (void)_connectionTypeForPrimaryPort;
- (void)_connectionUUIDsForNotification;
- (void)_handleBatteryPackNotification;
- (void)_handleNotificationUarpEndUpdateForModel:(id)a3;
- (void)_handleNotificationUarpStagingStatusForModel:(id)a3 state:(unint64_t)a4;
- (void)_handleNotificationUarpStartUpdateForModel:(id)a3;
- (void)_handlePowerChangeNotification;
- (void)_handleRegisterationForUarpActivityForModel:(id)a3 shouldRegister:(BOOL)a4;
- (void)_handleResistorIDChangeNotification:(int)a3;
- (void)_handleUSBCurrentLimitNotification;
- (void)_handleUartActivityTimeout;
- (void)_kickTimerForUarpActivityForModel:(id)a3;
- (void)_pokeResistorID;
- (void)_processAccessoryInfo;
- (void)_registerForBatteryNotifications;
- (void)_registerForIOAccessoryManagerInterestNotifications;
- (void)_registerForUarpActivityForModel:(id)a3;
- (void)_sendNotification:(id)a3;
- (void)_stopAuthTimer;
- (void)_stopTimerForUarpActivityForModel:(id)a3;
- (void)_unregisterForUarpActivityForModel:(id)a3;
- (void)addIOAccessoryChildPort:(id)a3;
- (void)cableType;
- (void)dealloc;
- (void)getUSBMode;
- (void)notifyDriverOfInductiveActivity:(BOOL)a3 paused:(BOOL)a4;
- (void)removeIOAccessoryChildPort:(id)a3;
- (void)resetAccessoryBaseCurrent;
- (void)setAccessoryPowerMode:(int)a3;
- (void)setBAccConnected:(BOOL)a3;
- (void)setBatteryChargeLevelPercent:(unsigned __int8)a3;
- (void)setBatteryIterator:(unsigned int)a3;
- (void)setBatteryNotifyPortRef:(IONotificationPort *)a3;
- (void)setBatteryPackModeEnabled:(BOOL)a3;
- (void)setBatteryPackModeEnabledValid:(BOOL)a3;
- (void)setConnectionUUID:(id)a3;
- (void)setCurrentLimitBaseInmA:(unsigned int)a3;
- (void)setCurrentLimitBaseInmAValid:(BOOL)a3;
- (void)setDeviceFirmwareRevision:(id)a3;
- (void)setDeviceHardwareRevision:(id)a3;
- (void)setDeviceModelNumber:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceSerialNumber:(id)a3;
- (void)setDeviceVendorName:(id)a3;
- (void)setDigitalID:(id)a3;
- (void)setInductiveDeviceID:(id)a3;
- (void)setInductiveDeviceType:(id)a3;
- (void)setInductiveDeviceUID:(id)a3;
- (void)setInductiveLocalDeviceID:(id)a3;
- (void)setIsAuthTimedOut:(BOOL)a3;
- (void)setIsAuthenticated:(BOOL)a3;
- (void)setMutableioAccessoryAuthCPChildPorts:(id)a3;
- (void)setMutableioAccessoryChildPorts:(id)a3;
- (void)setMutableioAccessoryConfigStreamChildPorts:(id)a3;
- (void)setMutableioAccessoryEAChildPorts:(id)a3;
- (void)setMutableioAccessoryOOBPairingChildPorts:(id)a3;
- (void)setNeedsOOBPairing:(BOOL)a3;
- (void)setNotificationRef:(unsigned int)a3;
- (void)setPpid:(id)a3;
- (void)setProductID:(id)a3;
- (void)setRegionCode:(id)a3;
- (void)setResistorID:(int)a3;
- (void)setVendorID:(id)a3;
- (void)supervisedTransportsRestricted;
- (void)transportClassTerminated;
@end

@implementation ACCTransportIOAccessoryManager

- (ACCTransportIOAccessoryManager)initWithIOService:(unsigned int)a3
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  v69.receiver = self;
  v69.super_class = (Class)ACCTransportIOAccessoryManager;
  v4 = [(ACCTransportIOAccessoryBase *)&v69 initWithIOAccessoryClass:0 ioService:*(void *)&a3];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF9C0] set];
    v6 = (void *)*((void *)v4 + 35);
    *((void *)v4 + 35) = v5;

    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    v8 = (void *)*((void *)v4 + 36);
    *((void *)v4 + 36) = v7;

    uint64_t v9 = [MEMORY[0x263EFF9C0] set];
    v10 = (void *)*((void *)v4 + 37);
    *((void *)v4 + 37) = v9;

    uint64_t v11 = [MEMORY[0x263EFF9C0] set];
    v12 = (void *)*((void *)v4 + 38);
    *((void *)v4 + 38) = v11;

    uint64_t v13 = [MEMORY[0x263EFF9C0] set];
    v14 = (void *)*((void *)v4 + 39);
    *((void *)v4 + 39) = v13;

    *((_DWORD *)v4 + 35) = 0;
    v4[113] = 0;
    v4[114] = 0;
    v4[115] = 0;
    v15 = (void *)*((void *)v4 + 41);
    *((void *)v4 + 41) = 0;

    v16 = (void *)*((void *)v4 + 42);
    *((void *)v4 + 42) = 0;

    v17 = (void *)*((void *)v4 + 43);
    *((void *)v4 + 43) = 0;

    v18 = (void *)*((void *)v4 + 44);
    *((void *)v4 + 44) = 0;

    v4[116] = 0;
    v4[117] = 0;
    v4[72] = 0;
    *((void *)v4 + 12) = 0;
    v4[104] = [v4 primaryPortNumber] == 257;
    v4[105] = 0;
    v4[106] = 0;
    v19 = (void *)*((void *)v4 + 8);
    *((void *)v4 + 8) = 0;

    v4[109] = 0;
    *((_DWORD *)v4 + 32) = 100;
    v4[118] = MGGetSInt32Answer() == 6;
    BOOL v20 = (IOAccessoryManagerGetType() & 0xF) == 5;
    v4[110] = v20;
    v4[110] = v4[118] | v20;
    *((void *)v4 + 40) = 0;
    *((_DWORD *)v4 + 33) = 0;
    v4[112] = 0;
    [v4 _clearAccessoryInfo];
    v4[107] = [v4 upstreamManagerService] == 0;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v21 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v21 = MEMORY[0x263EF8438];
      id v22 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[ACCTransportIOAccessoryManager initWithIOService:].cold.6((uint64_t)(v4 + 107), v21, v23, v24, v25, v26, v27, v28);
    }

    io_service_t v29 = [v4 ioService];
    if (IOServiceOpen(v29, *MEMORY[0x263EF8960], 0, (io_connect_t *)v4 + 2))
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v30 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        v30 = MEMORY[0x263EF8438];
        id v31 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryManager initWithIOService:].cold.4();
      }
    }
    else
    {
      [v4 _registerForIOAccessoryManagerInterestNotifications];
    }
    v32 = (void *)*((void *)v4 + 34);
    *((void *)v4 + 34) = 0;

    io_registry_entry_t v33 = [v4 ioService];
    CFAllocatorRef v34 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFStringRef v35 = (const __CFString *)IORegistryEntrySearchCFProperty(v33, "IOService", @"IOProviderClass", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (v35)
    {
      CFStringRef v36 = v35;
      if (CFStringCompare(v35, @"AppleUVDMEndpoint", 0))
      {
        v4[108] = 0;
      }
      else
      {
        v4[108] = 1;
        io_registry_entry_t parent = 0;
        if (!IORegistryEntryGetParentEntry([v4 ioService], "IOAccessory", &parent))
        {
          CFProperty = (void *)IORegistryEntryCreateCFProperty(parent, @"Description", v34, 0);
          if (CFProperty
            || (long long v74 = 0u,
                long long v75 = 0u,
                long long v72 = 0u,
                long long v73 = 0u,
                long long v71 = 0u,
                memset(cStr, 0, sizeof(cStr)),
                !MEMORY[0x223CA7220](parent, cStr))
            && (CFProperty = (void *)CFStringCreateWithCString(v34, cStr, 0x8000100u)) != 0)
          {
            v61 = CFProperty;
            if (gLogObjects && gNumLogObjects >= 1)
            {
              v38 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                -[ACCTransportIOAccessoryOOBPairing dealloc]();
              }
              v38 = MEMORY[0x263EF8438];
              id v39 = MEMORY[0x263EF8438];
            }
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v40 = *((void *)v4 + 34);
              *(_DWORD *)cStr = 136316162;
              *(void *)&cStr[4] = "-[ACCTransportIOAccessoryManager initWithIOService:]";
              *(_WORD *)&cStr[12] = 1024;
              *(_DWORD *)&cStr[14] = 981;
              *(_WORD *)&cStr[18] = 1024;
              *(_DWORD *)&cStr[20] = a3;
              *(_WORD *)&cStr[24] = 2112;
              *(void *)&cStr[26] = v40;
              *(_WORD *)&cStr[34] = 2112;
              *(void *)&cStr[36] = v61;
              _os_log_impl(&dword_222CE3000, v38, OS_LOG_TYPE_DEFAULT, "%s:%d service %d, _managerParent %@ -> %@ ", (uint8_t *)cStr, 0x2Cu);
            }

            v41 = (void *)*((void *)v4 + 34);
            *((void *)v4 + 34) = v61;
          }
        }
      }
      CFRelease(v36);
    }
    else
    {
      v4[108] = 0;
    }
    int v42 = [v4 _connectionTypeForPrimaryPort];
    *((_DWORD *)v4 + 31) = v42;
    v4[111] = v42 == 8;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v43 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v43 = MEMORY[0x263EF8438];
      id v44 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      int v45 = v4[107];
      int v46 = v4[108];
      int v47 = *((_DWORD *)v4 + 31);
      int v48 = v4[110];
      int v49 = v4[111];
      uint64_t v50 = *((void *)v4 + 34);
      *(_DWORD *)cStr = 67110402;
      *(_DWORD *)&cStr[4] = v45;
      *(_WORD *)&cStr[8] = 1024;
      *(_DWORD *)&cStr[10] = v46;
      *(_WORD *)&cStr[14] = 1024;
      *(_DWORD *)&cStr[16] = v47;
      *(_WORD *)&cStr[20] = 1024;
      *(_DWORD *)&cStr[22] = v48;
      *(_WORD *)&cStr[26] = 1024;
      *(_DWORD *)&cStr[28] = v49;
      *(_WORD *)&cStr[32] = 2112;
      *(void *)&cStr[34] = v50;
      _os_log_impl(&dword_222CE3000, v43, OS_LOG_TYPE_INFO, "IOAccessoryManager added,  isRootPort = %d, isAdapter = %d, _connectionType = %{coreacc:ACCConnection_Type_t}d, _bIsInductive = %d, _bIsInductivePowerToAccessory = %d, _managerParent = %@", (uint8_t *)cStr, 0x2Au);
    }

    if (v4[110] && !v4[111]) {
      goto LABEL_52;
    }
    dispatch_source_t v51 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    v52 = (void *)*((void *)v4 + 18);
    *((void *)v4 + 18) = v51;

    *(void *)cStr = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)cStr, v4);
    v53 = *((void *)v4 + 18);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __52__ACCTransportIOAccessoryManager_initWithIOService___block_invoke;
    handler[3] = &unk_26466C198;
    objc_copyWeak(&v66, (id *)cStr);
    unsigned int v67 = a3;
    v65 = v4;
    dispatch_source_set_event_handler(v53, handler);
    dispatch_source_set_timer(*((dispatch_source_t *)v4 + 18), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(*((dispatch_object_t *)v4 + 18));

    objc_destroyWeak(&v66);
    objc_destroyWeak((id *)cStr);
    if (v4[110])
    {
LABEL_52:
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v54 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        v54 = MEMORY[0x263EF8438];
        id v55 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        int v56 = v4[110];
        *(_DWORD *)cStr = 136315394;
        *(void *)&cStr[4] = "-[ACCTransportIOAccessoryManager initWithIOService:]";
        *(_WORD *)&cStr[12] = 1024;
        *(_DWORD *)&cStr[14] = v56;
        _os_log_impl(&dword_222CE3000, v54, OS_LOG_TYPE_DEFAULT, "%s: _bIsInductive %d, create uarpStagingStatusActivityTimer", (uint8_t *)cStr, 0x12u);
      }

      dispatch_source_t v57 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
      v58 = (void *)*((void *)v4 + 11);
      *((void *)v4 + 11) = v57;

      *(void *)cStr = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)cStr, v4);
      v59 = *((void *)v4 + 11);
      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 3221225472;
      v62[2] = __52__ACCTransportIOAccessoryManager_initWithIOService___block_invoke_43;
      v62[3] = &unk_26466C1C0;
      objc_copyWeak(&v63, (id *)cStr);
      dispatch_source_set_event_handler(v59, v62);
      dispatch_source_set_timer(*((dispatch_source_t *)v4 + 11), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_resume(*((dispatch_object_t *)v4 + 11));
      objc_destroyWeak(&v63);
      objc_destroyWeak((id *)cStr);
    }
  }
  return (ACCTransportIOAccessoryManager *)v4;
}

void __52__ACCTransportIOAccessoryManager_initWithIOService___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v4 = +[ACCTransportIOAccessorySharedManager sharedManager];
    uint64_t v5 = [v4 delegate];

    if (gLogObjects && gNumLogObjects >= 4)
    {
      v6 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v6 = MEMORY[0x263EF8438];
      id v7 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(_DWORD *)(a1 + 48);
      int v9 = *(_DWORD *)(*(void *)(a1 + 32) + 124);
      *(_DWORD *)buf = 67109376;
      int v21 = v8;
      __int16 v22 = 1024;
      int v23 = v9;
      _os_log_impl(&dword_222CE3000, v6, OS_LOG_TYPE_DEFAULT, "AppleIDBus auth timeout completed for IOAccMgr service:%d, connectionType:%{coreacc:ACCConnection_Type_t}d", buf, 0xEu);
    }

    id v10 = objc_loadWeakRetained(v2);
    uint64_t v11 = [v10 connectionUUID];
    char v12 = [v5 setAuthenticationStatus:3 andCertificateData:0 authCTA:0 forConnectionWithUUID:v11];

    if ((v12 & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        uint64_t v13 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        uint64_t v13 = MEMORY[0x263EF8438];
        id v14 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __52__ACCTransportIOAccessoryManager_initWithIOService___block_invoke_cold_1();
      }
    }
    id v15 = objc_loadWeakRetained(v2);
    [v15 setFeaturesFromAuthStatus:4 authCert:0 certType:0xFFFFFFFFLL];

    int v16 = *(_DWORD *)(*(void *)(a1 + 32) + 124);
    if (v16 != 1 && v16 != 8)
    {
      v17 = acc_userNotifications_accessoryNotSupported();
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"%d", *(unsigned int *)(a1 + 48));
      [v17 setGroupIdentifier:v18];

      v19 = +[ACCUserNotificationManager sharedManager];
      [v19 presentNotification:v17 completionHandler:0];
    }
  }
}

void __52__ACCTransportIOAccessoryManager_initWithIOService___block_invoke_43(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 4;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    v4 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[ACCTransportIOAccessoryManager initWithIOService:]_block_invoke";
    _os_log_impl(&dword_222CE3000, v4, OS_LOG_TYPE_DEFAULT, "%s: uarpStagingStatusActivityTimer fired!", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleUartActivityTimeout];
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 4;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v5 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v16 = [(ACCTransportIOAccessoryBase *)self ioService];
    _os_log_impl(&dword_222CE3000, v5, OS_LOG_TYPE_DEFAULT, "deallocating manager with service %d", buf, 8u);
  }

  [(NSMutableSet *)self->_mutableioAccessoryChildPorts removeAllObjects];
  mutableioAccessoryChildPorts = self->_mutableioAccessoryChildPorts;
  self->_mutableioAccessoryChildPorts = 0;

  [(NSMutableSet *)self->_mutableioAccessoryEAChildPorts removeAllObjects];
  mutableioAccessoryEAChildPorts = self->_mutableioAccessoryEAChildPorts;
  self->_mutableioAccessoryEAChildPorts = 0;

  [(NSMutableSet *)self->_mutableioAccessoryAuthCPChildPorts removeAllObjects];
  mutableioAccessoryAuthCPChildPorts = self->_mutableioAccessoryAuthCPChildPorts;
  self->_mutableioAccessoryAuthCPChildPorts = 0;

  [(NSMutableSet *)self->_mutableioAccessoryOOBPairingChildPorts removeAllObjects];
  mutableioAccessoryOOBPairingChildPorts = self->_mutableioAccessoryOOBPairingChildPorts;
  self->_mutableioAccessoryOOBPairingChildPorts = 0;

  [(NSMutableSet *)self->_mutableioAccessoryConfigStreamChildPorts removeAllObjects];
  mutableioAccessoryConfigStreamChildPorts = self->_mutableioAccessoryConfigStreamChildPorts;
  self->_mutableioAccessoryConfigStreamChildPorts = 0;

  if (self->_authTimerAccessory)
  {
    [(ACCTransportIOAccessoryManager *)self _stopAuthTimer];
    dispatch_source_cancel((dispatch_source_t)self->_authTimerAccessory);
    authTimerAccessory = self->_authTimerAccessory;
    self->_authTimerAccessory = 0;
  }
  notificationUarpStagingStatusActivityTimer = self->_notificationUarpStagingStatusActivityTimer;
  if (notificationUarpStagingStatusActivityTimer)
  {
    dispatch_source_set_timer(notificationUarpStagingStatusActivityTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_cancel((dispatch_source_t)self->_notificationUarpStagingStatusActivityTimer);
    uint64_t v13 = self->_notificationUarpStagingStatusActivityTimer;
    self->_notificationUarpStagingStatusActivityTimer = 0;
  }
  [(ACCTransportIOAccessoryManager *)self setAccessoryPowerMode:1];
  v14.receiver = self;
  v14.super_class = (Class)ACCTransportIOAccessoryManager;
  [(ACCTransportIOAccessoryBase *)&v14 dealloc];
}

- (void)transportClassTerminated
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_authTimerAccessory)
  {
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects < 4;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v5 = MEMORY[0x263EF8438];
      id v4 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v5 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v11 = [(ACCTransportIOAccessoryBase *)self ioService];
      _os_log_impl(&dword_222CE3000, v5, OS_LOG_TYPE_DEFAULT, "IOAccessoryManager canceling auth timer for service %d", buf, 8u);
    }

    [(ACCTransportIOAccessoryManager *)self _stopAuthTimer];
    dispatch_source_cancel((dispatch_source_t)self->_authTimerAccessory);
    authTimerAccessory = self->_authTimerAccessory;
    self->_authTimerAccessory = 0;
  }
  notificationUarpStagingStatusActivityTimer = self->_notificationUarpStagingStatusActivityTimer;
  if (notificationUarpStagingStatusActivityTimer)
  {
    dispatch_source_set_timer(notificationUarpStagingStatusActivityTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_cancel((dispatch_source_t)self->_notificationUarpStagingStatusActivityTimer);
    uint64_t v8 = self->_notificationUarpStagingStatusActivityTimer;
    self->_notificationUarpStagingStatusActivityTimer = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)ACCTransportIOAccessoryManager;
  [(ACCTransportIOAccessoryBase *)&v9 transportClassTerminated];
}

- (void)addIOAccessoryChildPort:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 4;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportIOAccessoryManager addIOAccessoryChildPort:](v4);
  }

  uint64_t v8 = [(ACCTransportIOAccessoryManager *)self mutableioAccessoryChildPorts];
  [v8 addObject:v4];

  if ([v4 ioServiceClassType] == 2)
  {
    objc_super v9 = [(ACCTransportIOAccessoryManager *)self mutableioAccessoryEAChildPorts];
    [v9 addObject:v4];
  }
  if ([v4 ioServiceClassType] == 3)
  {
    id v10 = [(ACCTransportIOAccessoryManager *)self mutableioAccessoryAuthCPChildPorts];
    [v10 addObject:v4];
  }
  if ([v4 ioServiceClassType] == 4)
  {
    unsigned int v11 = [(ACCTransportIOAccessoryManager *)self mutableioAccessoryOOBPairingChildPorts];
    [v11 addObject:v4];
  }
  if ([v4 ioServiceClassType] == 6)
  {
    uint64_t v12 = [(ACCTransportIOAccessoryManager *)self mutableioAccessoryConfigStreamChildPorts];
    [v12 addObject:v4];
  }
  [(ACCTransportIOAccessoryManager *)self _pokeResistorID];
}

- (void)removeIOAccessoryChildPort:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 4;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportIOAccessoryManager removeIOAccessoryChildPort:](v4);
  }

  uint64_t v8 = [(ACCTransportIOAccessoryManager *)self mutableioAccessoryChildPorts];
  [v8 removeObject:v4];

  if ([v4 ioServiceClassType] == 2)
  {
    objc_super v9 = [(ACCTransportIOAccessoryManager *)self mutableioAccessoryEAChildPorts];
    [v9 removeObject:v4];
  }
  if ([v4 ioServiceClassType] == 3)
  {
    id v10 = [(ACCTransportIOAccessoryManager *)self mutableioAccessoryAuthCPChildPorts];
    [v10 removeObject:v4];

    if (gLogObjects && gNumLogObjects >= 4)
    {
      unsigned int v11 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      unsigned int v11 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15[0] = 67109120;
      v15[1] = [(ACCTransportIOAccessoryBase *)self ioService];
      _os_log_impl(&dword_222CE3000, v11, OS_LOG_TYPE_DEFAULT, "Stop auth timer on AuthCP service removal, for IOAccessoryManager service %d", (uint8_t *)v15, 8u);
    }

    [(ACCTransportIOAccessoryManager *)self _stopAuthTimer];
  }
  if ([v4 ioServiceClassType] == 4)
  {
    uint64_t v13 = [(ACCTransportIOAccessoryManager *)self mutableioAccessoryOOBPairingChildPorts];
    [v13 removeObject:v4];
  }
  if ([v4 ioServiceClassType] == 6)
  {
    objc_super v14 = [(ACCTransportIOAccessoryManager *)self mutableioAccessoryConfigStreamChildPorts];
    [v14 removeObject:v4];
  }
}

- (BOOL)setFeaturesFromAuthStatus:(int)a3 authCert:(id)a4 certType:(int)a5
{
  kern_return_t v51;
  NSObject *v52;
  NSObject *v53;
  int v54;
  id v55;
  BOOL v56;
  id v57;
  NSObject *v58;
  id v59;
  uint64_t v60;
  NSObject *v61;
  id v62;
  const char *v63;
  int v64;
  unsigned int v65;
  int connectionType;
  int v67;
  int v68;
  int v69;
  BOOL v70;
  int v71;
  NSObject *v72;
  int v73;
  int v74;
  NSObject *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  int v85;
  int v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  int v104;
  io_connect_t v105;
  unsigned int v106;
  int v107;
  NSObject *v108;
  int v109;
  int v110;
  NSObject *v111;
  NSObject *v112;
  int v113;
  id v114;
  int v115;
  int v116;
  int v117;
  id v118;
  BOOL v119;
  uint64_t v120;
  int v121;
  id v122;
  io_connect_t connect;
  int valuePtr;
  uint8_t buf[4];
  unsigned char v127[10];
  unsigned char v128[6];
  unsigned char v129[6];
  unsigned char v130[6];
  uint64_t v131;
  unsigned char v132[6];
  unsigned char v133[6];
  unsigned char v134[6];
  int v135;
  __int16 v136;
  int v137;
  uint64_t v138;

  v138 = *MEMORY[0x263EF8340];
  id v7 = a4;
  io_registry_entry_t v8 = [(ACCTransportIOAccessoryBase *)self ioService];
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v8, @"IOAccessoryManagerInductiveFwMode", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  valuePtr = 3;
  if (CFProperty)
  {
    CFNumberRef v10 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
    CFRelease(v10);
  }
  if (self->_authTimerAccessory) {
    [(ACCTransportIOAccessoryManager *)self _stopAuthTimer];
  }
  if (gLogObjects && gNumLogObjects >= 7)
  {
    unsigned int v11 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    unsigned int v11 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v127 = a5;
    _os_log_impl(&dword_222CE3000, v11, OS_LOG_TYPE_DEFAULT, "setFeaturesFromAuthStatus: certType %d", buf, 8u);
  }

  if (a5 == 3) {
    uint64_t v13 = MFAACreateDEVNCertCapsForCable();
  }
  else {
    uint64_t v13 = MFAACreateCapsFromAuthCert();
  }
  objc_super v14 = (uint64_t *)v13;
  v122 = v7;
  v121 = MFAACertificateAuthVersionNumber();
  if (v14)
  {
    v120 = *v14;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      id v15 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v15 = MEMORY[0x263EF8438];
      id v16 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v127 = a5;
      _os_log_impl(&dword_222CE3000, v15, OS_LOG_TYPE_DEFAULT, "setFeaturesFromAuthStatus: certType %d, certCaps: NONE", buf, 8u);
    }

    v120 = 0;
  }
  unsigned int v17 = MFAACanReceiveInductivePower();
  int v18 = acc_userDefaults_copyIntegerForKey(@"OverrideCanReceiveInductivePowerOID");
  int v19 = acc_policies_supportInductivePowerTX(v18, v17);
  if (gLogObjects && gNumLogObjects >= 4)
  {
    BOOL v20 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v20 = MEMORY[0x263EF8438];
    id v21 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = [(ACCTransportIOAccessoryBase *)self primaryPortNumber];
    unsigned int v23 = [(ACCTransportIOAccessoryBase *)self ioService];
    BOOL v24 = [(ACCTransportIOAccessoryManager *)self bAccConnected];
    BOOL bIsInductivePowerToAccessory = self->_bIsInductivePowerToAccessory;
    BOOL bIsInductive = self->_bIsInductive;
    *(_DWORD *)buf = 67111680;
    *(_DWORD *)v127 = v22;
    *(_WORD *)&v127[4] = 1024;
    *(_DWORD *)&v127[6] = a3;
    *(_WORD *)v128 = 1024;
    *(_DWORD *)&v128[2] = a5;
    *(_WORD *)v129 = 1024;
    *(_DWORD *)&v129[2] = v23;
    *(_WORD *)v130 = 1024;
    *(_DWORD *)&v130[2] = v24;
    LOWORD(v131) = 1024;
    *(_DWORD *)((char *)&v131 + 2) = bIsInductivePowerToAccessory;
    HIWORD(v131) = 1024;
    *(_DWORD *)v132 = bIsInductive;
    *(_WORD *)&v132[4] = 1024;
    *(_DWORD *)v133 = valuePtr;
    *(_WORD *)&v133[4] = 1024;
    *(_DWORD *)v134 = v17;
    *(_WORD *)&v134[4] = 1024;
    v135 = v18;
    v136 = 1024;
    v137 = v19;
    _os_log_impl(&dword_222CE3000, v20, OS_LOG_TYPE_DEFAULT, "setFeaturesFromAuthStatus: [%d] authStatus %d, certType %d, ioService %d, bAccConnected %d, _bIsInductivePowerToAccessory %d, _bIsInductive %d, inductiveFwMode %d, certAllowPowerOut %d, override %d, supportInductivePowerTX %d", buf, 0x44u);
  }

  if (self->_bIsInductive && valuePtr == 1) {
    char v28 = v19;
  }
  else {
    char v28 = 1;
  }
  if (v28)
  {
    int v29 = 0;
    int v30 = 0xFFFF;
    int v31 = 0x7FFFFFFF;
    unint64_t v32 = 0x26ABFC000uLL;
    if (a3 == 1 || a3 == 4)
    {
      int v36 = 0;
LABEL_77:
      CFStringRef v35 = v122;
      goto LABEL_78;
    }
    if (a3 == 2)
    {
      if (![(ACCTransportIOAccessoryManager *)self bAccConnected])
      {
        if (gLogObjects && gNumLogObjects >= 4)
        {
          io_registry_entry_t v33 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          io_registry_entry_t v33 = MEMORY[0x263EF8438];
          id v42 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          int v43 = [(ACCTransportIOAccessoryBase *)self primaryPortNumber];
          unsigned int v44 = [(ACCTransportIOAccessoryBase *)self ioService];
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v127 = v43;
          *(_WORD *)&v127[4] = 1024;
          *(_DWORD *)&v127[6] = v44;
          _os_log_impl(&dword_222CE3000, v33, OS_LOG_TYPE_DEFAULT, "[%d] bAccConnected for service %d is false, but auth has passed", buf, 0xEu);
        }

        [(ACCTransportIOAccessoryManager *)self setBAccConnected:1];
        unint64_t v32 = 0x26ABFC000uLL;
      }
      if (self->_bIsInductivePowerToAccessory)
      {
        int v30 = 448;
        int v36 = 65087;
LABEL_76:
        a3 = 2;
        int v29 = 1;
        goto LABEL_77;
      }
      if (self->_bIsInductive)
      {
        if (a5 == 7 || (MFAACanChargeInductive() & 1) != 0)
        {
          v85 = 449;
          v86 = 65086;
        }
        else
        {
          if (gLogObjects && gNumLogObjects >= 4)
          {
            v111 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryOOBPairing dealloc]();
            }
            v111 = MEMORY[0x263EF8438];
            v118 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryManager setFeaturesFromAuthStatus:authCert:certType:]7(self, v111);
          }

          v85 = 465;
          v86 = 65070;
          unint64_t v32 = 0x26ABFC000;
        }
        v119 = a5 == 2;
        if (a5 == 2) {
          int v36 = v86 | 0x100;
        }
        else {
          int v36 = v86;
        }
        if (v119) {
          int v30 = v85 & 0xD1;
        }
        else {
          int v30 = v85;
        }
        if (v19)
        {
          v30 &= 0x151u;
          v36 |= 0x80u;
        }
        goto LABEL_76;
      }
      if (v121 == 2)
      {
        CFStringRef v35 = v122;
        v107 = MFAACertificateAuthV2Class();
        if (v107 == 4)
        {
          v108 = logObjectForModule(3);
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
          {
            v109 = [(ACCTransportIOAccessoryBase *)self primaryPortNumber];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v127 = v109;
            _os_log_impl(&dword_222CE3000, v108, OS_LOG_TYPE_DEFAULT, "[%d] V2.0 Class4, don't revoke nor allow AdvancedCharging !", buf, 8u);
          }

          v110 = 449;
          int v31 = 4;
          unint64_t v32 = 0x26ABFC000;
        }
        else
        {
          int v31 = v107;
          v110 = 465;
        }
      }
      else
      {
        v110 = 465;
        CFStringRef v35 = v122;
      }
      if (MFAACanChargeHighVoltage())
      {
        if (gLogObjects && *(int *)(v32 + 2272) >= 4)
        {
          v112 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          v112 = MEMORY[0x263EF8438];
          v114 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
        {
          v115 = [(ACCTransportIOAccessoryBase *)self primaryPortNumber];
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v127 = v115;
          _os_log_impl(&dword_222CE3000, v112, OS_LOG_TYPE_DEFAULT, "[%d] HVC capable, allow AdvancedCharging !", buf, 8u);
        }
        v113 = 65086;
      }
      else
      {
        if (acc_userDefaults_BOOLForKey(@"DisableIAPHVCFixForAuth"))
        {
          v113 = 65070;
LABEL_218:
          v117 = MFAACanUseAccPwrUHPM();
          int v36 = v113 | v117;
          if (v117) {
            int v30 = v110 & 0x1FE;
          }
          else {
            int v30 = v110;
          }
          if (MFAACanUseAccPwrLoV())
          {
            v30 &= ~0x40u;
            v36 |= 0x40u;
          }
          a3 = 2;
          int v29 = 1;
          goto LABEL_78;
        }
        v112 = logObjectForModule(3);
        if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
        {
          v116 = [(ACCTransportIOAccessoryBase *)self primaryPortNumber];
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v127 = v116;
          _os_log_impl(&dword_222CE3000, v112, OS_LOG_TYPE_DEFAULT, "[%d] override caps and don't revoke nor allow AdvancedCharging !", buf, 8u);
        }
        v113 = 65070;
      }

      v110 = 449;
      unint64_t v32 = 0x26ABFC000;
      goto LABEL_218;
    }
    if (gLogObjects && gNumLogObjects >= 4)
    {
      uint64_t v40 = *(id *)(gLogObjects + 24);
      CFStringRef v35 = v122;
    }
    else
    {
      CFStringRef v35 = v122;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v40 = MEMORY[0x263EF8438];
      id v41 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryManager setFeaturesFromAuthStatus:authCert:certType:]4();
    }

    int v29 = 0;
    int v36 = 0;
    int v30 = 0;
  }
  else
  {
    unint64_t v32 = 0x26ABFC000uLL;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      CFAllocatorRef v34 = *(id *)(gLogObjects + 24);
      CFStringRef v35 = v122;
    }
    else
    {
      CFStringRef v35 = v122;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      CFAllocatorRef v34 = MEMORY[0x263EF8438];
      id v37 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = [(ACCTransportIOAccessoryBase *)self primaryPortNumber];
      BOOL v39 = self->_bIsInductive;
      *(_DWORD *)buf = 67110656;
      *(_DWORD *)v127 = v38;
      *(_WORD *)&v127[4] = 1024;
      *(_DWORD *)&v127[6] = v39;
      *(_WORD *)v128 = 1024;
      *(_DWORD *)&v128[2] = valuePtr;
      *(_WORD *)v129 = 1024;
      *(_DWORD *)&v129[2] = 1;
      *(_WORD *)v130 = 1024;
      *(_DWORD *)&v130[2] = 0;
      LOWORD(v131) = 1024;
      *(_DWORD *)((char *)&v131 + 2) = a3;
      HIWORD(v131) = 1024;
      *(_DWORD *)v132 = 1;
      _os_log_impl(&dword_222CE3000, v34, OS_LOG_TYPE_DEFAULT, "setFeaturesFromAuthStatus: [%d] _bIsInductive %d, inductiveFwMode %d (TX %d), supportInductivePowerTX %d, force AuthStatus to Failed! %d -> %d", buf, 0x2Cu);
    }

    int v29 = 0;
    int v36 = 0;
    int v30 = 0xFFFF;
    int v31 = 0x7FFFFFFF;
    a3 = 1;
  }
LABEL_78:
  MFAADeallocAuthCertCaps();
  if (gLogObjects && *(int *)(v32 + 2272) >= 4)
  {
    int v45 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    int v45 = MEMORY[0x263EF8438];
    id v46 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    if (v29) {
      int v47 = "PASSED";
    }
    else {
      int v47 = "FAILED";
    }
    int v48 = [(ACCTransportIOAccessoryBase *)self primaryPortNumber];
    unsigned int v49 = [(ACCTransportIOAccessoryBase *)self ioService];
    *(_DWORD *)buf = 136316930;
    *(void *)v127 = v47;
    unint64_t v32 = 0x26ABFC000uLL;
    *(_WORD *)&v127[8] = 1024;
    *(_DWORD *)v128 = v48;
    *(_WORD *)&v128[4] = 1024;
    *(_DWORD *)v129 = v121;
    *(_WORD *)&v129[4] = 1024;
    *(_DWORD *)v130 = v31;
    *(_WORD *)&v130[4] = 2048;
    v131 = v120;
    *(_WORD *)v132 = 1024;
    *(_DWORD *)&v132[2] = v30;
    *(_WORD *)v133 = 1024;
    *(_DWORD *)&v133[2] = v36;
    *(_WORD *)v134 = 1024;
    *(_DWORD *)&v134[2] = v49;
    _os_log_impl(&dword_222CE3000, v45, OS_LOG_TYPE_DEFAULT, "AUTH [%s], [%d] ver %d / %x, authCertCaps0:%08llX -> ioAccFeatMaskRevoke:%08X, ioAccFeatMaskAllow:%08X, self.ioService %d\n", buf, 0x3Au);
  }

  connect = 0;
  io_service_t v50 = [(ACCTransportIOAccessoryBase *)self ioService];
  dispatch_source_t v51 = IOServiceOpen(v50, *MEMORY[0x263EF8960], 0, &connect);
  if (!v51 && connect)
  {
    if (v30 && IOAccessoryManagerRevokeFeatures())
    {
      if (gLogObjects && *(int *)(v32 + 2272) >= 7)
      {
        v52 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        v52 = MEMORY[0x263EF8438];
        dispatch_source_t v57 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryManager setFeaturesFromAuthStatus:authCert:certType:]0();
      }

      v54 = 0;
      if (!v36) {
        goto LABEL_123;
      }
    }
    else
    {
      v54 = 1;
      if (!v36)
      {
LABEL_123:
        IOServiceClose(connect);
        int v56 = v54 != 0;
        goto LABEL_124;
      }
    }
    if (IOAccessoryManagerAllowFeatures())
    {
      if (gLogObjects && *(int *)(v32 + 2272) >= 7)
      {
        v58 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        v58 = MEMORY[0x263EF8438];
        v59 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryManager setFeaturesFromAuthStatus:authCert:certType:].cold.8();
      }

      v54 = 0;
    }
    goto LABEL_123;
  }
  if (gLogObjects && *(int *)(v32 + 2272) >= 7)
  {
    v53 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    v53 = MEMORY[0x263EF8438];
    id v55 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    v104 = [(ACCTransportIOAccessoryBase *)self primaryPortNumber];
    v105 = connect;
    v106 = [(ACCTransportIOAccessoryBase *)self ioService];
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v127 = v104;
    *(_WORD *)&v127[4] = 1024;
    *(_DWORD *)&v127[6] = v51;
    *(_WORD *)v128 = 1024;
    *(_DWORD *)&v128[2] = v105;
    unint64_t v32 = 0x26ABFC000;
    *(_WORD *)v129 = 1024;
    *(_DWORD *)&v129[2] = v106;
    _os_log_error_impl(&dword_222CE3000, v53, OS_LOG_TYPE_ERROR, "[%d] IOServiceOpen fail kernStatus:%02X, ioConnForService:%04X ioService:%d", buf, 0x1Au);
  }

  int v56 = 0;
LABEL_124:
  if (self->_bIsInductivePowerToAccessory)
  {
    if (v29) {
      v60 = 4;
    }
    else {
      v60 = 2;
    }
    if (gLogObjects && *(int *)(v32 + 2272) >= 4)
    {
      v61 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v61 = MEMORY[0x263EF8438];
      v62 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      if (v29) {
        id v63 = "PASSED";
      }
      else {
        id v63 = "FAILED";
      }
      v64 = [(ACCTransportIOAccessoryBase *)self primaryPortNumber];
      v65 = [(ACCTransportIOAccessoryBase *)self ioService];
      *(_DWORD *)buf = 136315906;
      *(void *)v127 = v63;
      unint64_t v32 = 0x26ABFC000uLL;
      *(_WORD *)&v127[8] = 1024;
      *(_DWORD *)v128 = v64;
      *(_WORD *)&v128[4] = 1024;
      *(_DWORD *)v129 = v60;
      *(_WORD *)&v129[4] = 1024;
      *(_DWORD *)v130 = v65;
      _os_log_impl(&dword_222CE3000, v61, OS_LOG_TYPE_DEFAULT, "AUTH [%s], for AWC [%d], setting power mode %d, self.ioService %d", buf, 0x1Eu);
    }

    [(ACCTransportIOAccessoryManager *)self setAccessoryPowerMode:v60];
  }
  connectionType = self->_connectionType;
  unsigned int v67 = acc_userDefaultsIapd_copyIntegerForKey(@"PretendBatteryLevel");
  if (!self->_bIsInductive || connectionType == 8) {
    v68 = acc_userDefaults_BOOLForKey(@"AuthTTRForAllTransports");
  }
  else {
    v68 = 1;
  }
  if ([(ACCTransportIOAccessoryManager *)self batteryChargeLevelPercent] >= 0x50)
  {
    if (v67) {
      v70 = v67 < 80;
    }
    else {
      v70 = 0;
    }
    objc_super v69 = v70;
  }
  else
  {
    objc_super v69 = 1;
  }
  if ((v68 & v69) == 1)
  {
    if (a3 == 4)
    {
      long long v73 = acc_userDefaults_BOOLForKey(@"EnableAuthTimeoutTTR");
      long long v74 = *(_DWORD *)(v32 + 2272);
      if (v73)
      {
        if (gLogObjects && v74 >= 4)
        {
          long long v75 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          long long v75 = MEMORY[0x263EF8438];
          v87 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG)) {
          -[ACCTransportIOAccessoryManager setFeaturesFromAuthStatus:authCert:certType:](v75, v88, v89, v90, v91, v92, v93, v94);
        }

        if (acc_userDefaults_BOOLForKey(@"SysdiagnoseInsteadOfAuthTTR")) {
          acc_sysdiagnose_InitiateAuthTimeoutSysdiagnose();
        }
        else {
          acc_tapToRadar_InitiateAuthTimeoutTTR();
        }
      }
      else
      {
        if (gLogObjects && v74 >= 7)
        {
          v84 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          v84 = MEMORY[0x263EF8438];
          v95 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG)) {
          -[ACCTransportIOAccessoryManager setFeaturesFromAuthStatus:authCert:certType:].cold.5(v84, v96, v97, v98, v99, v100, v101, v102);
        }
      }
    }
    else if (a3 == 1)
    {
      long long v71 = *(_DWORD *)(v32 + 2272);
      if (gLogObjects && v71 >= 4)
      {
        long long v72 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        long long v72 = MEMORY[0x263EF8438];
        uint64_t v76 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG)) {
        -[ACCTransportIOAccessoryManager setFeaturesFromAuthStatus:authCert:certType:](v72, v77, v78, v79, v80, v81, v82, v83);
      }

      if (acc_userDefaults_BOOLForKey(@"SysdiagnoseInsteadOfAuthTTR")) {
        acc_sysdiagnose_InitiateAuthFailureSysdiagnose();
      }
      else {
        acc_tapToRadar_InitiateAuthFailureTTR();
      }
    }
  }

  return v56;
}

- (BOOL)setUSBMode:(int)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = -[ACCTransportIOAccessoryManager _IOAccUSBModeTypeForSetUSBMode:](self, "_IOAccUSBModeTypeForSetUSBMode:");
  unsigned int v6 = IOAccessoryManagerConfigureUSBMode();
  unsigned int v7 = v6;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects <= 3;
  }
  else {
    BOOL v8 = 1;
  }
  int v9 = !v8;
  if (v6)
  {
    if (v9)
    {
      CFNumberRef v10 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      CFNumberRef v10 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v14 = 67109632;
      int v15 = a3;
      __int16 v16 = 1024;
      int v17 = v5;
      __int16 v18 = 1024;
      unsigned int v19 = v7;
      _os_log_error_impl(&dword_222CE3000, v10, OS_LOG_TYPE_ERROR, "ERROR - IOAccessoryManagerConfigureUSBMode usbMode=%d usbModeType (IOAccessoryUSBModeType) %d failed 0x%X", (uint8_t *)&v14, 0x14u);
    }
  }
  else
  {
    if (v9)
    {
      CFNumberRef v10 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      CFNumberRef v10 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 67109632;
      int v15 = a3;
      __int16 v16 = 1024;
      int v17 = v5;
      __int16 v18 = 1024;
      unsigned int v19 = [(ACCTransportIOAccessoryBase *)self ioService];
      _os_log_debug_impl(&dword_222CE3000, v10, OS_LOG_TYPE_DEBUG, "successfully set USB Mode %d (IOAccessoryUSBModeType %d) for service %d", (uint8_t *)&v14, 0x14u);
    }
  }

  return v7 == 0;
}

- (int)getUSBMode
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(ACCTransportIOAccessoryBase *)self ioService];
  int USBConnectType = IOAccessoryManagerGetUSBConnectType();
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects <= 3;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = !v4;
  if (USBConnectType)
  {
    if (v5)
    {
      unsigned int v6 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      unsigned int v6 = MEMORY[0x263EF8438];
      id v7 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryManager getUSBMode].cold.4();
    }
  }
  else
  {
    if (v5)
    {
      unsigned int v6 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      unsigned int v6 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109632;
      int v14 = -1;
      __int16 v15 = 1024;
      int v16 = 0;
      __int16 v17 = 1024;
      unsigned int v18 = [(ACCTransportIOAccessoryBase *)self ioService];
      _os_log_debug_impl(&dword_222CE3000, v6, OS_LOG_TYPE_DEBUG, "USB Connect %d, usbConnectActive %d, for service %d", buf, 0x14u);
    }
  }

  int v9 = [(ACCTransportIOAccessoryManager *)self _ACCPlatformUSBModeForIOAccessoryUSBConnectType:0xFFFFFFFFLL];
  if (gLogObjects && gNumLogObjects >= 4)
  {
    CFNumberRef v10 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    CFNumberRef v10 = MEMORY[0x263EF8438];
    id v11 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportIOAccessoryManager getUSBMode]();
  }

  return v9;
}

- (BOOL)setUSBCurrentOffset:(int)a3
{
  int v3 = IOAccessoryManagerSetUSBCurrentOffset();
  int v4 = v3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects <= 3;
  }
  else {
    BOOL v5 = 1;
  }
  int v6 = !v5;
  if (v3)
  {
    if (v6)
    {
      id v7 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v7 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryManager setUSBCurrentOffset:]();
    }
  }
  else
  {
    if (v6)
    {
      id v7 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v7 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[ACCTransportIOAccessoryManager setUSBCurrentOffset:]();
    }
  }

  return v4 == 0;
}

- (BOOL)setUSBCurrentLimitBase:(unsigned int)a3 forceResponse:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x263EF8340];
  int v7 = IOAccessoryManagerSetUSBCurrentLimitBase();
  int v8 = v7;
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects <= 3;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = !v9;
  if (v7)
  {
    if (v10)
    {
      id v11 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v11 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryManager setUSBCurrentLimitBase:forceResponse:].cold.4();
    }
  }
  else
  {
    if (v10)
    {
      id v11 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v11 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ACCTransportIOAccessoryManager setUSBCurrentLimitBase:forceResponse:]();
    }
  }

  if ((platform_systemInfo_isLightning() & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      int v14 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v14 = MEMORY[0x263EF8438];
      id v15 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int currentLimitBaseInmA = self->_currentLimitBaseInmA;
      BOOL currentLimitBaseInmAValid = self->_currentLimitBaseInmAValid;
      *(_DWORD *)buf = 67110144;
      unsigned int v24 = currentLimitBaseInmA;
      __int16 v25 = 1024;
      unsigned int v26 = a3;
      __int16 v27 = 1024;
      BOOL v28 = currentLimitBaseInmAValid;
      __int16 v29 = 1024;
      int v30 = 1;
      __int16 v31 = 1024;
      BOOL v32 = v4;
      _os_log_impl(&dword_222CE3000, v14, OS_LOG_TYPE_DEFAULT, "setUSBCurrentLimitBase: not lightning device, currentLimitBaseInmA %d -> %d, valid %d -> %d, forceResponse %d", buf, 0x20u);
    }

    if (v4 || self->_currentLimitBaseInmA != a3)
    {
      self->_unsigned int currentLimitBaseInmA = a3;
      self->_BOOL currentLimitBaseInmAValid = 1;
LABEL_36:
      dispatch_time_t v19 = dispatch_time(0, 10000000);
      notificationPortQueue = self->super._notificationPortQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __71__ACCTransportIOAccessoryManager_setUSBCurrentLimitBase_forceResponse___block_invoke;
      block[3] = &unk_26466B8C8;
      block[4] = self;
      dispatch_after(v19, notificationPortQueue, block);
      return v8 == 0;
    }
    BOOL v18 = self->_currentLimitBaseInmAValid;
    self->_unsigned int currentLimitBaseInmA = a3;
    self->_BOOL currentLimitBaseInmAValid = 1;
    if (!v18) {
      goto LABEL_36;
    }
  }
  return v8 == 0;
}

uint64_t __71__ACCTransportIOAccessoryManager_setUSBCurrentLimitBase_forceResponse___block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 4;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v4 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_222CE3000, v4, OS_LOG_TYPE_DEFAULT, "setUSBCurrentLimitBase: auto generate kIOAccessoryManagerMessageUSBCurrentLimitChange", v6, 2u);
  }

  return [*(id *)(a1 + 32) _handleUSBCurrentLimitNotification];
}

- (unsigned)USBCurrentLimitInmA
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  unsigned int v20 = 0;
  [(ACCTransportIOAccessoryBase *)self ioService];
  int USBCurrentLimit = IOAccessoryManagerGetUSBCurrentLimit();
  if (USBCurrentLimit)
  {
    unsigned int v20 = 0;
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 4;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v8 = MEMORY[0x263EF8438];
      id v5 = MEMORY[0x263EF8438];
    }
    else
    {
      int v8 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      dispatch_time_t v19 = [(ACCTransportIOAccessoryManager *)self connectionUUID];
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)int v22 = v20;
      *(_WORD *)&v22[4] = 1024;
      *(_DWORD *)&v22[6] = USBCurrentLimit;
      *(_WORD *)unsigned int v23 = 2112;
      *(void *)&v23[2] = v19;
      __int16 v24 = 1024;
      unsigned int v25 = [(ACCTransportIOAccessoryBase *)self ioService];
      _os_log_error_impl(&dword_222CE3000, v8, OS_LOG_TYPE_ERROR, "ERROR - IOAccessoryManagerGetUSBCurrentLimit currentLimitBaseInmA=%d failed 0x%X for connectionUUID %@, self.ioService %d", buf, 0x1Eu);
    }
    if ((platform_systemInfo_isLightning() & 1) == 0 && self->_currentLimitBaseInmAValid)
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        BOOL v9 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        BOOL v9 = MEMORY[0x263EF8438];
        id v11 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        unsigned int currentLimitBaseInmA = self->_currentLimitBaseInmA;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)int v22 = v20;
        *(_WORD *)&v22[4] = 1024;
        *(_DWORD *)&v22[6] = currentLimitBaseInmA;
        _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_INFO, "USBCurrentLimitInmA: not lightning device and _currentLimitBaseInmAValid, usbCurrentLimitInmA %d -> %d", buf, 0xEu);
      }

      unsigned int v20 = self->_currentLimitBaseInmA;
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 4;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v10 = MEMORY[0x263EF8438];
      id v7 = MEMORY[0x263EF8438];
    }
    else
    {
      int v10 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      [(ACCTransportIOAccessoryManager *)(uint64_t)&v20 USBCurrentLimitInmA];
    }

    platform_systemInfo_isLightning();
  }
  if (gLogObjects && gNumLogObjects >= 4)
  {
    id v13 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v13 = MEMORY[0x263EF8438];
    id v14 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v15 = v20;
    unsigned int v16 = [(ACCTransportIOAccessoryBase *)self ioService];
    BOOL currentLimitBaseInmAValid = self->_currentLimitBaseInmAValid;
    *(_DWORD *)buf = 136316162;
    *(void *)int v22 = "-[ACCTransportIOAccessoryManager USBCurrentLimitInmA]";
    *(_WORD *)&v22[8] = 1024;
    *(_DWORD *)unsigned int v23 = USBCurrentLimit;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = v15;
    __int16 v24 = 1024;
    unsigned int v25 = v16;
    __int16 v26 = 1024;
    BOOL v27 = currentLimitBaseInmAValid;
    _os_log_impl(&dword_222CE3000, v13, OS_LOG_TYPE_DEFAULT, "%s: status %x, IOAccessoryManagerGetUSBCurrentLimit -> %d for service %d, _currentLimitBaseInmAValid %d", buf, 0x24u);
  }

  return v20;
}

- (unsigned)USBCurrentLimitBaseInmA
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  unsigned int v20 = 0;
  [(ACCTransportIOAccessoryBase *)self ioService];
  int USBCurrentLimitBase = IOAccessoryManagerGetUSBCurrentLimitBase();
  if (USBCurrentLimitBase)
  {
    unsigned int v20 = 0;
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 4;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v8 = MEMORY[0x263EF8438];
      id v5 = MEMORY[0x263EF8438];
    }
    else
    {
      int v8 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      dispatch_time_t v19 = [(ACCTransportIOAccessoryManager *)self connectionUUID];
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)int v22 = v20;
      *(_WORD *)&v22[4] = 1024;
      *(_DWORD *)&v22[6] = USBCurrentLimitBase;
      *(_WORD *)unsigned int v23 = 2112;
      *(void *)&v23[2] = v19;
      __int16 v24 = 1024;
      unsigned int v25 = [(ACCTransportIOAccessoryBase *)self ioService];
      _os_log_error_impl(&dword_222CE3000, v8, OS_LOG_TYPE_ERROR, "ERROR - IOAccessoryManagerGetUSBCurrentLimitBase currentLimitBaseInmA=%d failed 0x%X for connectionUUID %@, self.ioService %d", buf, 0x1Eu);
    }
    if ((platform_systemInfo_isLightning() & 1) == 0 && self->_currentLimitBaseInmAValid)
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        BOOL v9 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        BOOL v9 = MEMORY[0x263EF8438];
        id v11 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        unsigned int currentLimitBaseInmA = self->_currentLimitBaseInmA;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)int v22 = v20;
        *(_WORD *)&v22[4] = 1024;
        *(_DWORD *)&v22[6] = currentLimitBaseInmA;
        _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_INFO, "USBCurrentLimitBaseInmA: not lightning device and _currentLimitBaseInmAValid, usbCurrentLimitBaseInmA %d -> %d", buf, 0xEu);
      }

      unsigned int v20 = self->_currentLimitBaseInmA;
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 4;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v10 = MEMORY[0x263EF8438];
      id v7 = MEMORY[0x263EF8438];
    }
    else
    {
      int v10 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      [(ACCTransportIOAccessoryManager *)(uint64_t)&v20 USBCurrentLimitBaseInmA];
    }

    platform_systemInfo_isLightning();
  }
  if (gLogObjects && gNumLogObjects >= 4)
  {
    id v13 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v13 = MEMORY[0x263EF8438];
    id v14 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v15 = v20;
    unsigned int v16 = [(ACCTransportIOAccessoryBase *)self ioService];
    BOOL currentLimitBaseInmAValid = self->_currentLimitBaseInmAValid;
    *(_DWORD *)buf = 136316162;
    *(void *)int v22 = "-[ACCTransportIOAccessoryManager USBCurrentLimitBaseInmA]";
    *(_WORD *)&v22[8] = 1024;
    *(_DWORD *)unsigned int v23 = USBCurrentLimitBase;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = v15;
    __int16 v24 = 1024;
    unsigned int v25 = v16;
    __int16 v26 = 1024;
    BOOL v27 = currentLimitBaseInmAValid;
    _os_log_impl(&dword_222CE3000, v13, OS_LOG_TYPE_DEFAULT, "%s: status %x, IOAccessoryManagerGetUSBCurrentLimitBase -> %d for service %d, _currentLimitBaseInmAValid %d", buf, 0x24u);
  }

  return v20;
}

- (int)USBCurrentLimitOffsetInmA
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v14 = 0;
  [(ACCTransportIOAccessoryBase *)self ioService];
  int USBCurrentLimitOffset = IOAccessoryManagerGetUSBCurrentLimitOffset();
  if (USBCurrentLimitOffset)
  {
    int v14 = 0;
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 4;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v8 = MEMORY[0x263EF8438];
      id v5 = MEMORY[0x263EF8438];
    }
    else
    {
      int v8 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryManager USBCurrentLimitOffsetInmA].cold.4();
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 4;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v8 = MEMORY[0x263EF8438];
      id v7 = MEMORY[0x263EF8438];
    }
    else
    {
      int v8 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(ACCTransportIOAccessoryManager *)(uint64_t)&v14 USBCurrentLimitOffsetInmA];
    }
  }

  if (gLogObjects && gNumLogObjects >= 4)
  {
    BOOL v9 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v9 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = v14;
    unsigned int v12 = [(ACCTransportIOAccessoryBase *)self ioService];
    *(_DWORD *)buf = 136315906;
    unsigned int v16 = "-[ACCTransportIOAccessoryManager USBCurrentLimitOffsetInmA]";
    __int16 v17 = 1024;
    int v18 = USBCurrentLimitOffset;
    __int16 v19 = 1024;
    int v20 = v11;
    __int16 v21 = 1024;
    unsigned int v22 = v12;
    _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_DEFAULT, "%s: status %x, IOAccessoryManagerGetUSBCurrentLimitOffset -> %d for service %d", buf, 0x1Eu);
  }

  return v14;
}

- (unsigned)USBChargingVoltageInmV
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  unsigned int v14 = 0;
  [(ACCTransportIOAccessoryBase *)self ioService];
  int USBChargingVoltage = IOAccessoryManagerGetUSBChargingVoltage();
  if (USBChargingVoltage)
  {
    unsigned int v14 = 0;
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 4;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v8 = MEMORY[0x263EF8438];
      id v5 = MEMORY[0x263EF8438];
    }
    else
    {
      int v8 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryManager USBChargingVoltageInmV].cold.4();
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 4;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v8 = MEMORY[0x263EF8438];
      id v7 = MEMORY[0x263EF8438];
    }
    else
    {
      int v8 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(ACCTransportIOAccessoryManager *)(uint64_t)&v14 USBChargingVoltageInmV];
    }
  }

  if (gLogObjects && gNumLogObjects >= 4)
  {
    BOOL v9 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v9 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = v14;
    unsigned int v12 = [(ACCTransportIOAccessoryBase *)self ioService];
    *(_DWORD *)buf = 136315906;
    unsigned int v16 = "-[ACCTransportIOAccessoryManager USBChargingVoltageInmV]";
    __int16 v17 = 1024;
    int v18 = USBChargingVoltage;
    __int16 v19 = 1024;
    unsigned int v20 = v11;
    __int16 v21 = 1024;
    unsigned int v22 = v12;
    _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_DEFAULT, "%s: status %x, IOAccessoryManagerGetUSBChargingVoltage -> %d for service %d", buf, 0x1Eu);
  }

  return v14;
}

- (int)cableType
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int v18 = -1;
  [(ACCTransportIOAccessoryBase *)self ioService];
  int USBConnectType = IOAccessoryManagerGetUSBConnectType();
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects <= 3;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = !v4;
  if (USBConnectType)
  {
    if (v5)
    {
      BOOL v6 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v6 = MEMORY[0x263EF8438];
      id v7 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryManager getUSBMode].cold.4();
    }
  }
  else
  {
    if (v5)
    {
      BOOL v6 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v6 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109632;
      int v20 = v18;
      __int16 v21 = 1024;
      int v22 = 0;
      __int16 v23 = 1024;
      unsigned int v24 = [(ACCTransportIOAccessoryBase *)self ioService];
      _os_log_debug_impl(&dword_222CE3000, v6, OS_LOG_TYPE_DEBUG, "CableType: %d, usbConnectActive %d, for service %d", buf, 0x14u);
    }
  }

  if (gLogObjects && gNumLogObjects >= 4)
  {
    BOOL v9 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v9 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    [(ACCTransportIOAccessoryManager *)(uint64_t)&v18 cableType];
  }

  return v18;
}

- (unsigned)sleepPowerCurrentLimitInmA
{
  uint64_t v2 = [(ACCTransportIOAccessoryBase *)self ioService];
  return MEMORY[0x270F925A0](v2);
}

- (BOOL)isPowerDuringSleepSupported
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(ACCTransportIOAccessoryBase *)self ioService];
  int IsSupported = IOAccessoryManagerPowerDuringSleepIsSupported();
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 4;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v11 = 67109120;
    LODWORD(v12) = IsSupported != 0;
    _os_log_impl(&dword_222CE3000, v6, OS_LOG_TYPE_INFO, "powerDuringSleepint IsSupported = %d", (uint8_t *)&v11, 8u);
  }

  if (gLogObjects && gNumLogObjects >= 4)
  {
    id v7 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [(ACCTransportIOAccessoryBase *)self ioService];
    int v11 = 136315650;
    uint64_t v12 = "-[ACCTransportIOAccessoryManager isPowerDuringSleepSupported]";
    __int16 v13 = 1024;
    BOOL v14 = IsSupported != 0;
    __int16 v15 = 1024;
    unsigned int v16 = v9;
    _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEFAULT, "%s: IOAccessoryManagerPowerDuringSleepIsSupported -> %d for service %d", (uint8_t *)&v11, 0x18u);
  }

  return IsSupported != 0;
}

- (BOOL)setPowerDuringSleepEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v5 = IOAccessoryManagerSetPowerDuringSleep();
  int v6 = v5;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects <= 3;
  }
  else {
    BOOL v7 = 1;
  }
  int v8 = !v7;
  if (v5)
  {
    if (v8)
    {
      unsigned int v9 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      unsigned int v9 = MEMORY[0x263EF8438];
      id v10 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryManager setPowerDuringSleepEnabled:]();
    }
  }
  else
  {
    if (v8)
    {
      unsigned int v9 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      unsigned int v9 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v13[0] = 67109376;
      v13[1] = v3;
      __int16 v14 = 1024;
      unsigned int v15 = [(ACCTransportIOAccessoryBase *)self ioService];
      _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_INFO, "successfully set IOAccessoryManagerSetPowerDuringSleep enabled %d for service %d", (uint8_t *)v13, 0xEu);
    }
  }

  return v6 == 0;
}

- (BOOL)isPowerDuringSleepEnabled
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [(ACCTransportIOAccessoryBase *)self ioService];
  int PowerDuringSleep = IOAccessoryManagerGetPowerDuringSleep();
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 4;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    int v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    int v5 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = PowerDuringSleep != 0;
    _os_log_impl(&dword_222CE3000, v5, OS_LOG_TYPE_INFO, "powerDuringSleepIsEnabled = %d", (uint8_t *)v7, 8u);
  }

  return PowerDuringSleep != 0;
}

- (BOOL)setBatteryPackMode:(BOOL)a3 forceResponse:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v33 = *MEMORY[0x263EF8340];
  int v7 = IOAccessoryManagerSetBatteryPackMode();
  int v8 = v7;
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects <= 3;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = !v9;
  if (v7)
  {
    if (v10)
    {
      id v11 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v11 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryManager setBatteryPackMode:forceResponse:].cold.4();
    }
  }
  else
  {
    if (v10)
    {
      id v11 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v11 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ACCTransportIOAccessoryManager setBatteryPackMode:forceResponse:](v5, self);
    }
  }

  if ((platform_systemInfo_isLightning() & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      __int16 v14 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      __int16 v14 = MEMORY[0x263EF8438];
      id v15 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      BOOL batteryPackModeEnabled = self->_batteryPackModeEnabled;
      BOOL batteryPackModeEnabledValid = self->_batteryPackModeEnabledValid;
      *(_DWORD *)buf = 67110144;
      BOOL v24 = batteryPackModeEnabled;
      __int16 v25 = 1024;
      BOOL v26 = v5;
      __int16 v27 = 1024;
      BOOL v28 = batteryPackModeEnabledValid;
      __int16 v29 = 1024;
      int v30 = 1;
      __int16 v31 = 1024;
      BOOL v32 = v4;
      _os_log_impl(&dword_222CE3000, v14, OS_LOG_TYPE_DEFAULT, "setBatteryPackMode: not lightning device, batteryPackModeEnabled %d -> %d, valid %d -> %d, forceResponse %d", buf, 0x20u);
    }

    if (v4 || self->_batteryPackModeEnabled != v5)
    {
      self->_BOOL batteryPackModeEnabled = v5;
      self->_BOOL batteryPackModeEnabledValid = 1;
LABEL_36:
      dispatch_time_t v19 = dispatch_time(0, 10000000);
      notificationPortQueue = self->super._notificationPortQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __67__ACCTransportIOAccessoryManager_setBatteryPackMode_forceResponse___block_invoke;
      block[3] = &unk_26466B8C8;
      block[4] = self;
      dispatch_after(v19, notificationPortQueue, block);
      return v8 == 0;
    }
    BOOL v18 = self->_batteryPackModeEnabledValid;
    self->_BOOL batteryPackModeEnabled = v5;
    self->_BOOL batteryPackModeEnabledValid = 1;
    if (!v18) {
      goto LABEL_36;
    }
  }
  return v8 == 0;
}

uint64_t __67__ACCTransportIOAccessoryManager_setBatteryPackMode_forceResponse___block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 4;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v4 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_222CE3000, v4, OS_LOG_TYPE_DEFAULT, "setBatteryPackMode: auto generate kIOAccessoryManagerMessageUSBBatteryPackChange", v6, 2u);
  }

  return [*(id *)(a1 + 32) _handleBatteryPackNotification];
}

- (BOOL)isBatteryPackModeEnabled
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(ACCTransportIOAccessoryBase *)self ioService];
  int BatteryPackMode = IOAccessoryManagerGetBatteryPackMode();
  BOOL v4 = BatteryPackMode != 0;
  if ((platform_systemInfo_isLightning() & 1) == 0 && self->_batteryPackModeEnabledValid)
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      BOOL v5 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v5 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL batteryPackModeEnabled = self->_batteryPackModeEnabled;
      int v13 = 67109376;
      *(_DWORD *)__int16 v14 = BatteryPackMode != 0;
      *(_WORD *)&v14[4] = 1024;
      *(_DWORD *)&v14[6] = batteryPackModeEnabled;
      _os_log_impl(&dword_222CE3000, v5, OS_LOG_TYPE_INFO, "setBatteryPackMode: not lightning device and batteryPackModeEnabledValid, batteryPackModeEnabled %d -> %d", (uint8_t *)&v13, 0xEu);
    }

    BOOL v4 = self->_batteryPackModeEnabled;
  }
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 4;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    int v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    int v10 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL batteryPackModeEnabledValid = self->_batteryPackModeEnabledValid;
    int v13 = 136315650;
    *(void *)__int16 v14 = "-[ACCTransportIOAccessoryManager isBatteryPackModeEnabled]";
    *(_WORD *)&v14[8] = 1024;
    BOOL v15 = v4;
    __int16 v16 = 1024;
    BOOL v17 = batteryPackModeEnabledValid;
    _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_DEFAULT, "%s: batteryPackModeIsEnabled = %d, _batteryPackModeEnabledValid %d", (uint8_t *)&v13, 0x18u);
  }

  return v4;
}

- (BOOL)setAccessoryRequestedCurrent:(unsigned int)a3
{
  int v3 = IOAccessoryManagerSetAccessoryRequestedCurrent();
  int v4 = v3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects <= 3;
  }
  else {
    BOOL v5 = 1;
  }
  int v6 = !v5;
  if (v3)
  {
    if (v6)
    {
      int v7 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v7 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryManager setAccessoryRequestedCurrent:]();
    }
  }
  else
  {
    if (v6)
    {
      int v7 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v7 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[ACCTransportIOAccessoryManager setAccessoryRequestedCurrent:]();
    }
  }

  return v4 == 0;
}

- (BOOL)setAccessoryUsedCurrent:(unsigned int)a3
{
  int v3 = IOAccessoryManagerSetAccessoryUsedCurrent();
  int v4 = v3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects <= 3;
  }
  else {
    BOOL v5 = 1;
  }
  int v6 = !v5;
  if (v3)
  {
    if (v6)
    {
      int v7 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v7 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryManager setAccessoryUsedCurrent:]();
    }
  }
  else
  {
    if (v6)
    {
      int v7 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v7 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[ACCTransportIOAccessoryManager setAccessoryUsedCurrent:]();
    }
  }

  return v4 == 0;
}

- (BOOL)resetAccessoryBaseCurrent
{
  int v3 = IOAccessoryManagerRestoreUSBCurrentLimitBase();
  int v4 = v3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects <= 3;
  }
  else {
    BOOL v5 = 1;
  }
  int v6 = !v5;
  if (v3)
  {
    if (v6)
    {
      int v7 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v7 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryManager resetAccessoryBaseCurrent]();
    }
  }
  else
  {
    if (v6)
    {
      int v7 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v7 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[ACCTransportIOAccessoryManager resetAccessoryBaseCurrent](self);
    }
  }

  return v4 == 0;
}

- (unsigned)accessoryChargingCurrentInmA
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(ACCTransportIOAccessoryBase *)self ioService];
  uint64_t ActivePowerMode = IOAccessoryManagerGetActivePowerMode();
  unsigned int v4 = [(ACCTransportIOAccessoryManager *)self accessoryPowerModeCurrentLimitInmA:ActivePowerMode];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 4;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    int v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    int v7 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9[0] = 67109632;
    v9[1] = v4;
    __int16 v10 = 1024;
    int v11 = ActivePowerMode;
    __int16 v12 = 1024;
    unsigned int v13 = [(ACCTransportIOAccessoryBase *)self ioService];
    _os_log_debug_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEBUG, "successfully get accessoryChargingCurrentInmA %d with IOAccessoryPowerMode %d for service %d", (uint8_t *)v9, 0x14u);
  }

  return v4;
}

- (unsigned)accessoryPowerModeCurrentLimitInmA:(int)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [(ACCTransportIOAccessoryBase *)self ioService];
  unsigned int v5 = IOAccessoryManagerPowerModeCurrentLimit();
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 4;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v8 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  else
  {
    id v8 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109632;
    v10[1] = v5;
    __int16 v11 = 1024;
    int v12 = a3;
    __int16 v13 = 1024;
    unsigned int v14 = [(ACCTransportIOAccessoryBase *)self ioService];
    _os_log_debug_impl(&dword_222CE3000, v8, OS_LOG_TYPE_DEBUG, "successfully get IOAccessoryManagerPowerModeCurrentLimit %d with ACCPlatform_Power_Mode_t %d for service %d", (uint8_t *)v10, 0x14u);
  }

  return v5;
}

- (BOOL)supervisedTransportsRestricted
{
  if ([(ACCTransportIOAccessoryBase *)self ioService]
    && (io_registry_entry_t v3 = [(ACCTransportIOAccessoryBase *)self ioService],
        (CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v3, @"SupervisedTransportsRestricted", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0)) != 0))
  {
    BOOL v5 = CFProperty != (CFTypeRef)*MEMORY[0x263EFFB38];
    CFRelease(CFProperty);
  }
  else
  {
    BOOL v5 = 1;
  }
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 4;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v8 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  else
  {
    id v8 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    [(ACCTransportIOAccessoryManager *)v5 supervisedTransportsRestricted];
  }

  return v5;
}

- (void)_registerForIOAccessoryManagerInterestNotifications
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, "error 0X%X  IOServiceAddInterestNotification", v2, v3, v4, v5, v6);
}

- (void)_registerForBatteryNotifications
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, "error 0X%X  IOServiceAddMatchingNotification", v2, v3, v4, v5, v6);
}

- (int)_IOAccUSBModeTypeForSetUSBMode:(int)a3
{
  if (a3 >= 3)
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 4;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint8_t v6 = MEMORY[0x263EF8438];
      id v5 = MEMORY[0x263EF8438];
    }
    else
    {
      uint8_t v6 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryManager _IOAccUSBModeTypeForSetUSBMode:]();
    }

    int v3 = 0;
  }
  else
  {
    int v3 = dword_222D4A338[a3];
  }
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 4;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    id v9 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportIOAccessoryManager _IOAccUSBModeTypeForSetUSBMode:]();
  }

  return v3;
}

- (int)_ACCPlatformUSBModeForIOAccessoryUSBConnectType:(int)a3
{
  if (a3 >= 6)
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 4;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint8_t v6 = MEMORY[0x263EF8438];
      id v5 = MEMORY[0x263EF8438];
    }
    else
    {
      uint8_t v6 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryManager _ACCPlatformUSBModeForIOAccessoryUSBConnectType:]();
    }

    int v3 = -1;
  }
  else
  {
    int v3 = dword_222D4A344[a3];
  }
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 4;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    id v9 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportIOAccessoryManager _ACCPlatformUSBModeForIOAccessoryUSBConnectType:]();
  }

  return v3;
}

- (int)_connectionTypeForPrimaryPort
{
  if ([(ACCTransportIOAccessoryManager *)self bIsInductive]) {
    int v3 = 4;
  }
  else {
    int v3 = 1;
  }
  [(ACCTransportIOAccessoryBase *)self upstreamManagerService];
  int Type = IOAccessoryManagerGetType();
  if (Type == 6 || Type == 3) {
    int v3 = 6;
  }
  int v6 = [(ACCTransportIOAccessoryBase *)self primaryPortNumber];
  switch(v6)
  {
    case 512:
      int v3 = 4;
      break;
    case 257:
      int v3 = 8;
      break;
    case 256:
      int v3 = 3;
      break;
  }
  if (gLogObjects && gNumLogObjects >= 4)
  {
    BOOL v7 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v7 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportIOAccessoryManager _connectionTypeForPrimaryPort]();
  }

  return v3;
}

- (id)_connectionUUIDsForNotification
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  BOOL v4 = [(ACCTransportIOAccessoryManager *)self connectionUUID];
  if (v4) {
    [v3 addObject:v4];
  }
  if ([(ACCTransportIOAccessoryManager *)self isRootPort]
    && [(ACCTransportIOAccessoryManager *)self _connectionTypeForPrimaryPort] != 3)
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      id v5 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v5 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ACCTransportIOAccessoryManager _connectionUUIDsForNotification]();
    }

    __int16 v27 = v4;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      BOOL v7 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v7 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[ACCTransportIOAccessoryManager _connectionUUIDsForNotification]();
    }

    id v9 = +[ACCTransportIOAccessorySharedManager sharedManager];
    __int16 v10 = [v9 delegate];

    [v10 startSafeConnectionTransaction];
    [v10 allEndpointsUUIDs];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
      unsigned int v14 = MEMORY[0x263EF8438];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(obj);
          }
          __int16 v16 = [v10 connectionUUIDForEndpointWithUUID:*(void *)(*((void *)&v29 + 1) + 8 * i)];
          int v17 = [v10 connectionTypeForConnectionWithUUID:v16];
          if (v17 == 6 || v17 == 1)
          {
            int v19 = v17;
            int v20 = v3;
            uint64_t v21 = gLogObjects;
            int v22 = gNumLogObjects;
            if (gLogObjects) {
              BOOL v23 = gNumLogObjects < 4;
            }
            else {
              BOOL v23 = 1;
            }
            if (v23)
            {
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                *(void *)CFStringRef v35 = v21;
                *(_WORD *)&v35[8] = 1024;
                *(_DWORD *)&v35[10] = v22;
                _os_log_error_impl(&dword_222CE3000, v14, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              BOOL v24 = v14;
              __int16 v25 = v14;
            }
            else
            {
              __int16 v25 = *(id *)(gLogObjects + 24);
            }
            id v3 = v20;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)CFStringRef v35 = v19;
              *(_WORD *)&v35[4] = 2112;
              *(void *)&v35[6] = v16;
              _os_log_impl(&dword_222CE3000, v25, OS_LOG_TYPE_DEFAULT, "Found %{coreacc:ACCConnection_Type_t}d connectionType, need to send notification for connectionUUID %@", buf, 0x12u);
            }

            [v20 addObject:v16];
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v12);
    }
    [v10 stopSafeConnectionTransaction];

    BOOL v4 = v27;
  }

  return v3;
}

- (void)_handleBatteryPackNotification
{
}

- (void)_handleUSBCurrentLimitNotification
{
}

- (void)_handlePowerChangeNotification
{
}

- (void)_handleResistorIDChangeNotification:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v40[1] = *MEMORY[0x263EF8340];
  if ([(ACCTransportIOAccessoryManager *)self resistorID] == a3)
  {
    if (gLogObjects) {
      BOOL v5 = gNumLogObjects < 4;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v9 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    else
    {
      id v9 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ACCTransportIOAccessoryManager _handleResistorIDChangeNotification:]();
    }

    __int16 v10 = [(ACCTransportIOAccessoryManager *)self connectionUUID];

    if (v3 != 100 && !v10)
    {
      uint64_t v11 = dispatch_get_global_queue(0, 0);
      uint64_t v12 = v11;
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __70__ACCTransportIOAccessoryManager__handleResistorIDChangeNotification___block_invoke_67;
      v29[3] = &unk_26466C1E8;
      int v30 = v3;
      v29[4] = self;
      uint64_t v13 = v29;
LABEL_41:
      dispatch_async(v11, v13);
    }
  }
  else
  {
    [(ACCTransportIOAccessoryManager *)self setResistorID:v3];
    if (gLogObjects) {
      BOOL v7 = gNumLogObjects < 4;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      unsigned int v14 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    else
    {
      unsigned int v14 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v36) = [(ACCTransportIOAccessoryManager *)self resistorID];
      _os_log_impl(&dword_222CE3000, v14, OS_LOG_TYPE_DEFAULT, "Manager: New resistorID value %d", buf, 8u);
    }

    if (v3 != 100)
    {
      uint64_t v15 = (void *)MEMORY[0x263EFF9A0];
      BOOL v39 = @"resistorID";
      __int16 v16 = objc_msgSend(NSNumber, "numberWithInt:", -[ACCTransportIOAccessoryManager resistorID](self, "resistorID"));
      v40[0] = v16;
      int v17 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
      uint64_t v18 = [v15 dictionaryWithDictionary:v17];

      if (gLogObjects && gNumLogObjects >= 4)
      {
        int v19 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        int v19 = MEMORY[0x263EF8438];
        id v20 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v36 = @"com.apple.accessories.resistor.idChanged";
        __int16 v37 = 2112;
        int v38 = v18;
        _os_log_impl(&dword_222CE3000, v19, OS_LOG_TYPE_DEFAULT, "CoreAnalytics event: %@\neventDict: %@", buf, 0x16u);
      }

      AnalyticsSendEvent();
    }
    uint64_t v21 = [(ACCTransportIOAccessoryManager *)self connectionUUID];

    if (!v21)
    {
      if (v3 == 100) {
        return;
      }
      uint64_t v11 = dispatch_get_global_queue(0, 0);
      uint64_t v12 = v11;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __70__ACCTransportIOAccessoryManager__handleResistorIDChangeNotification___block_invoke;
      block[3] = &unk_26466C1E8;
      int v32 = v3;
      block[4] = self;
      uint64_t v13 = block;
      goto LABEL_41;
    }
    if (gLogObjects && gNumLogObjects >= 4)
    {
      int v22 = *(id *)(gLogObjects + 24);
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
      BOOL v24 = [(ACCTransportIOAccessoryManager *)self connectionUUID];
      *(_DWORD *)buf = 138412290;
      uint64_t v36 = v24;
      _os_log_impl(&dword_222CE3000, v22, OS_LOG_TYPE_DEFAULT, "Manager: Have a connection UUID %@, sending resistorID notification", buf, 0xCu);
    }
    __int16 v25 = [NSNumber numberWithInteger:(int)v3];
    v33[0] = *MEMORY[0x263F34028];
    BOOL v26 = [(ACCTransportIOAccessoryManager *)self connectionUUID];
    v33[1] = *MEMORY[0x263F34040];
    v34[0] = v26;
    v34[1] = v25;
    __int16 v27 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];

    BOOL v28 = [MEMORY[0x263F08A00] defaultCenter];
    [v28 postNotificationName:*MEMORY[0x263F34048] object:0 userInfo:v27];
  }
}

void __70__ACCTransportIOAccessoryManager__handleResistorIDChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 4;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v4 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1 + 40);
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl(&dword_222CE3000, v4, OS_LOG_TYPE_DEFAULT, "Manager: Have no connection UUID for valid resistorID %d on resistor ID change notification. Tell shared Manager", (uint8_t *)v7, 8u);
  }

  id v6 = +[ACCTransportIOAccessorySharedManager sharedManager];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 IOAccessoryManagerResistorIDChanged:*(unsigned int *)(a1 + 40) forManager:*(void *)(a1 + 32)];
  }
}

void __70__ACCTransportIOAccessoryManager__handleResistorIDChangeNotification___block_invoke_67(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 4;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v4 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1 + 40);
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl(&dword_222CE3000, v4, OS_LOG_TYPE_DEFAULT, "Manager: Still have no connection UUID for a valid resistorID %d that should have a connectionUUID. Tell shared Manager", (uint8_t *)v7, 8u);
  }

  id v6 = +[ACCTransportIOAccessorySharedManager sharedManager];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 IOAccessoryManagerResistorIDChanged:*(unsigned int *)(a1 + 40) forManager:*(void *)(a1 + 32)];
  }
}

- (void)_sendNotification:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = +[ACCTransportIOAccessorySharedManager sharedManager];
  [v5 lockAccessoryPorts];

  id v6 = [(ACCTransportIOAccessoryManager *)self _connectionUUIDsForNotification];
  if ([v6 count])
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      BOOL v7 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v7 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      [(ACCTransportIOAccessoryManager *)(uint64_t)v4 _sendNotification:v7];
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    BOOL v24 = v6;
    id obj = v6;
    uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      uint64_t v12 = *MEMORY[0x263F34068];
      uint64_t v13 = MEMORY[0x263EF8438];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v34 = v12;
          uint64_t v35 = v15;
          __int16 v16 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
          uint64_t v17 = gLogObjects;
          int v18 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v19 = gNumLogObjects < 4;
          }
          else {
            BOOL v19 = 1;
          }
          if (v19)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v31 = v17;
              __int16 v32 = 1024;
              LODWORD(v33) = v18;
              _os_log_error_impl(&dword_222CE3000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v20 = v13;
            uint64_t v21 = v13;
          }
          else
          {
            uint64_t v21 = *(id *)(gLogObjects + 24);
          }
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v31 = (uint64_t)v4;
            __int16 v32 = 2112;
            uint64_t v33 = v16;
            _os_log_debug_impl(&dword_222CE3000, v21, OS_LOG_TYPE_DEBUG, "Sending %@ notification, notificationDict=%@", buf, 0x16u);
          }

          int v22 = [MEMORY[0x263F08A00] defaultCenter];
          [v22 postNotificationName:v4 object:0 userInfo:v16];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
      }
      while (v10);
    }

    id v6 = v24;
  }
  id v23 = +[ACCTransportIOAccessorySharedManager sharedManager];
  [v23 unlockAccessoryPorts];
}

- (void)_processAccessoryInfo
{
  [a1 primaryPortNumber];
  [a1 ioService];
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_14();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x28u);
}

- (void)_clearAccessoryInfo
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([(ACCTransportIOAccessoryManager *)self bIsInductive])
  {
    os_log_t v3 = [(ACCTransportIOAccessoryManager *)self deviceModelNumber];

    if (v3)
    {
      os_log_type_t v4 = [(ACCTransportIOAccessoryManager *)self deviceModelNumber];
      [(ACCTransportIOAccessoryManager *)self _unregisterForUarpActivityForModel:v4];
    }
  }
  if (self->_allAccessoryInfoFieldsAreValid)
  {
    if (gLogObjects) {
      BOOL v5 = gNumLogObjects < 4;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v7 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v7 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = [(ACCTransportIOAccessoryBase *)self ioService];
      _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEFAULT, "Clearing accessory info for manager %d", (uint8_t *)v8, 8u);
    }

    self->_allAccessoryInfoFieldsAreValid = 0;
    [(ACCTransportIOAccessoryManager *)self setDeviceModelNumber:0];
    [(ACCTransportIOAccessoryManager *)self setDeviceName:0];
    [(ACCTransportIOAccessoryManager *)self setDeviceVendorName:0];
    [(ACCTransportIOAccessoryManager *)self setDeviceSerialNumber:0];
    [(ACCTransportIOAccessoryManager *)self setDeviceHardwareRevision:0];
    [(ACCTransportIOAccessoryManager *)self setDeviceFirmwareRevision:0];
    [(ACCTransportIOAccessoryManager *)self setDigitalID:0];
    [(ACCTransportIOAccessoryManager *)self setRegionCode:0];
    [(ACCTransportIOAccessoryManager *)self setInductiveDeviceType:0];
    [(ACCTransportIOAccessoryManager *)self setInductiveDeviceID:0];
    [(ACCTransportIOAccessoryManager *)self setInductiveLocalDeviceID:0];
  }
}

- (void)_pokeResistorID
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(ACCTransportIOAccessoryManager *)self resistorID] == 100
    && [(ACCTransportIOAccessoryBase *)self primaryPortNumber] != 1)
  {
    if (!gLogObjects || gNumLogObjects < 4)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v5 = MEMORY[0x263EF8438];
      id v4 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v5 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 67109120;
      unsigned int v16 = [(ACCTransportIOAccessoryBase *)self ioService];
      _os_log_impl(&dword_222CE3000, v5, OS_LOG_TYPE_DEFAULT, "Poking resistorID for service (%d) for rear-port IOAccessoryManager", (uint8_t *)&v15, 8u);
    }

    [(ACCTransportIOAccessoryBase *)self ioService];
    uint64_t AccessoryID = IOAccessoryManagerGetAccessoryID();
    if (AccessoryID <= 0xF)
    {
      uint64_t v7 = AccessoryID;
      if (gLogObjects && gNumLogObjects >= 4)
      {
        id v8 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        id v8 = MEMORY[0x263EF8438];
        id v13 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v14 = [(ACCTransportIOAccessoryBase *)self ioService];
        int v15 = 67109376;
        unsigned int v16 = v7;
        __int16 v17 = 1024;
        unsigned int v18 = v14;
        _os_log_impl(&dword_222CE3000, v8, OS_LOG_TYPE_DEFAULT, "Have a resistorID to update from poke, %d, from service %d", (uint8_t *)&v15, 0xEu);
      }

LABEL_34:
      [(ACCTransportIOAccessoryManager *)self _handleResistorIDChangeNotification:v7];
      return;
    }
  }
  if (([(ACCTransportIOAccessoryManager *)self resistorID] & 0x80000000) == 0
    && [(ACCTransportIOAccessoryManager *)self resistorID] <= 15)
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      uint64_t v9 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v9 = MEMORY[0x263EF8438];
      id v10 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [(ACCTransportIOAccessoryManager *)self resistorID];
      unsigned int v12 = [(ACCTransportIOAccessoryBase *)self ioService];
      int v15 = 67109376;
      unsigned int v16 = v11;
      __int16 v17 = 1024;
      unsigned int v18 = v12;
      _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_DEFAULT, "Already have a resistorID to update from poke, %d, from service %d. Checking if we need to advertise connection", (uint8_t *)&v15, 0xEu);
    }

    uint64_t v7 = [(ACCTransportIOAccessoryManager *)self resistorID];
    goto LABEL_34;
  }
}

- (void)_stopAuthTimer
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 4;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v5 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = [(ACCTransportIOAccessoryBase *)self ioService];
    _os_log_impl(&dword_222CE3000, v5, OS_LOG_TYPE_INFO, "Stopping auth timer for service %d", (uint8_t *)v7, 8u);
  }

  authTimerAccessory = self->_authTimerAccessory;
  if (authTimerAccessory) {
    dispatch_source_set_timer(authTimerAccessory, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  self->_isAuthTimedOut = 0;
}

- (void)_handleRegisterationForUarpActivityForModel:(id)a3 shouldRegister:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 4;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v9 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [(ACCTransportIOAccessoryBase *)self primaryPortNumber];
    int v11 = [(ACCTransportIOAccessoryManager *)self connectionUUID];
    *(_DWORD *)buf = 136316162;
    long long v72 = "-[ACCTransportIOAccessoryManager _handleRegisterationForUarpActivityForModel:shouldRegister:]";
    __int16 v73 = 1024;
    int v74 = v10;
    __int16 v75 = 2112;
    uint64_t v76 = v11;
    __int16 v77 = 2112;
    id v78 = v6;
    __int16 v79 = 1024;
    int v80 = v4;
    _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel %@, shouldRegister %d", buf, 0x2Cu);
  }
  unsigned int v12 = self;
  objc_sync_enter(v12);
  if (v4)
  {
    if (v12->_notificationUarpRegistered)
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        id v13 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        id v13 = MEMORY[0x263EF8438];
        id v28 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = [(ACCTransportIOAccessoryBase *)v12 primaryPortNumber];
        int v30 = [(ACCTransportIOAccessoryManager *)v12 connectionUUID];
        *(_DWORD *)buf = 136316162;
        long long v72 = "-[ACCTransportIOAccessoryManager _handleRegisterationForUarpActivityForModel:shouldRegister:]";
        __int16 v73 = 1024;
        int v74 = v29;
        __int16 v75 = 2112;
        uint64_t v76 = v30;
        __int16 v77 = 2112;
        id v78 = v6;
        __int16 v79 = 1024;
        int v80 = 1;
        _os_log_impl(&dword_222CE3000, v13, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel '%@', shouldRegister=%d, Already registered!!!", buf, 0x2Cu);
      }
LABEL_39:

      goto LABEL_64;
    }
    int v17 = [v6 isEqualToString:@"A3250"];
    unsigned int v18 = @"A2580";
    if (!v17) {
      unsigned int v18 = 0;
    }
    v70 = v18;
    uint64_t v19 = [NSString stringWithFormat:@"%@%@", @"com.apple.uarp.startupdate.", v6];
    notificationUarpStartUpdateName = v12->_notificationUarpStartUpdateName;
    v12->_notificationUarpStartUpdateName = (NSString *)v19;

    uint64_t v21 = [NSString stringWithFormat:@"%@%@", @"com.apple.uarp.endupdate.", v6];
    notificationUarpEndUpdateName = v12->_notificationUarpEndUpdateName;
    v12->_notificationUarpEndUpdateName = (NSString *)v21;

    uint64_t v23 = [NSString stringWithFormat:@"%@%@", @"com.apple.uarp.stagingstatus.", v6];
    notificationUarpStagingStatusName = v12->_notificationUarpStagingStatusName;
    v12->_notificationUarpStagingStatusName = (NSString *)v23;

    if (v17)
    {
      uint64_t v25 = [NSString stringWithFormat:@"%@%@", @"com.apple.uarp.stagingstatus.", @"A2580"];
      notificationUarpStagingStatusName2 = v12->_notificationUarpStagingStatusName2;
      v12->_notificationUarpStagingStatusName2 = (NSString *)v25;
    }
    if (gLogObjects && gNumLogObjects >= 4)
    {
      long long v27 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      long long v27 = MEMORY[0x263EF8438];
      id v53 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v54 = [(ACCTransportIOAccessoryBase *)v12 primaryPortNumber];
      id v55 = [(ACCTransportIOAccessoryManager *)v12 connectionUUID];
      int v56 = v12->_notificationUarpStartUpdateName;
      dispatch_source_t v57 = v12->_notificationUarpEndUpdateName;
      v58 = v12->_notificationUarpStagingStatusName;
      v59 = v12->_notificationUarpStagingStatusName2;
      *(_DWORD *)buf = 136317186;
      long long v72 = "-[ACCTransportIOAccessoryManager _handleRegisterationForUarpActivityForModel:shouldRegister:]";
      __int16 v73 = 1024;
      int v74 = v54;
      __int16 v75 = 2112;
      uint64_t v76 = v55;
      __int16 v77 = 2112;
      id v78 = v6;
      __int16 v79 = 1024;
      int v80 = 1;
      __int16 v81 = 2112;
      v82 = v56;
      __int16 v83 = 2112;
      v84 = v57;
      __int16 v85 = 2112;
      v86 = v58;
      __int16 v87 = 2112;
      v88 = v59;
      _os_log_impl(&dword_222CE3000, v27, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel '%@', shouldRegister=%d, Register %@ / %@ / %@ / %@", buf, 0x54u);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v61 = [(ACCTransportIOAccessoryManager *)v12 notificationUarpStartUpdateName];
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v12, (CFNotificationCallback)__handleNotificationUarpStartUpdate, v61, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    v62 = CFNotificationCenterGetDarwinNotifyCenter();
    id v63 = [(ACCTransportIOAccessoryManager *)v12 notificationUarpEndUpdateName];
    CFNotificationCenterAddObserver(v62, v12, (CFNotificationCallback)__handleNotificationUarpEndUpdate, v63, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    v64 = CFNotificationCenterGetDarwinNotifyCenter();
    v65 = [(ACCTransportIOAccessoryManager *)v12 notificationUarpStagingStatusName];
    CFNotificationCenterAddObserver(v64, v12, (CFNotificationCallback)__handleNotificationUarpStagingStatus, v65, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    if (v12->_notificationUarpStagingStatusName2)
    {
      id v66 = CFNotificationCenterGetDarwinNotifyCenter();
      unsigned int v67 = [(ACCTransportIOAccessoryManager *)v12 notificationUarpStagingStatusName2];
      CFNotificationCenterAddObserver(v66, v12, (CFNotificationCallback)__handleNotificationUarpStagingStatus, v67, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    CFNotificationCenterGetDarwinNotifyCenter();
    v68 = [(ACCTransportIOAccessoryManager *)v12 notificationUarpStagingStatusName];
    __handleNotificationUarpStagingStatus((uint64_t)v68, v12, v68);

    if (v12->_notificationUarpStagingStatusName2)
    {
      CFNotificationCenterGetDarwinNotifyCenter();
      objc_super v69 = [(ACCTransportIOAccessoryManager *)v12 notificationUarpStagingStatusName2];
      __handleNotificationUarpStagingStatus((uint64_t)v69, v12, v69);
    }
    v12->_notificationUarpRegistered = 1;
  }
  else
  {
    if (gLogObjects) {
      BOOL v14 = gNumLogObjects <= 3;
    }
    else {
      BOOL v14 = 1;
    }
    int v15 = !v14;
    if (!v12->_notificationUarpRegistered)
    {
      if (v15)
      {
        id v13 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        id v13 = MEMORY[0x263EF8438];
        id v50 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v51 = [(ACCTransportIOAccessoryBase *)v12 primaryPortNumber];
        v52 = [(ACCTransportIOAccessoryManager *)v12 connectionUUID];
        *(_DWORD *)buf = 136316162;
        long long v72 = "-[ACCTransportIOAccessoryManager _handleRegisterationForUarpActivityForModel:shouldRegister:]";
        __int16 v73 = 1024;
        int v74 = v51;
        __int16 v75 = 2112;
        uint64_t v76 = v52;
        __int16 v77 = 2112;
        id v78 = v6;
        __int16 v79 = 1024;
        int v80 = 0;
        _os_log_impl(&dword_222CE3000, v13, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel '%@', shouldRegister=%d, Already unregistered!!!", buf, 0x2Cu);
      }
      goto LABEL_39;
    }
    if (v15)
    {
      unsigned int v16 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      unsigned int v16 = MEMORY[0x263EF8438];
      id v31 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = [(ACCTransportIOAccessoryBase *)v12 primaryPortNumber];
      uint64_t v33 = [(ACCTransportIOAccessoryManager *)v12 connectionUUID];
      uint64_t v34 = v12->_notificationUarpStartUpdateName;
      uint64_t v35 = v12->_notificationUarpEndUpdateName;
      uint64_t v36 = v12->_notificationUarpStagingStatusName;
      uint64_t v37 = v12->_notificationUarpStagingStatusName2;
      *(_DWORD *)buf = 136317186;
      long long v72 = "-[ACCTransportIOAccessoryManager _handleRegisterationForUarpActivityForModel:shouldRegister:]";
      __int16 v73 = 1024;
      int v74 = v32;
      __int16 v75 = 2112;
      uint64_t v76 = v33;
      __int16 v77 = 2112;
      id v78 = v6;
      __int16 v79 = 1024;
      int v80 = 0;
      __int16 v81 = 2112;
      v82 = v34;
      __int16 v83 = 2112;
      v84 = v35;
      __int16 v85 = 2112;
      v86 = v36;
      __int16 v87 = 2112;
      v88 = v37;
      _os_log_impl(&dword_222CE3000, v16, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel '%@', shouldRegister=%d, Unregister %@ / %@ / %@ / %@", buf, 0x54u);
    }
    [(ACCTransportIOAccessoryManager *)v12 _stopTimerForUarpActivityForModel:v6];
    int v38 = CFNotificationCenterGetDarwinNotifyCenter();
    BOOL v39 = [(ACCTransportIOAccessoryManager *)v12 notificationUarpStartUpdateName];
    CFNotificationCenterRemoveObserver(v38, v12, v39, 0);

    uint64_t v40 = CFNotificationCenterGetDarwinNotifyCenter();
    id v41 = [(ACCTransportIOAccessoryManager *)v12 notificationUarpEndUpdateName];
    CFNotificationCenterRemoveObserver(v40, v12, v41, 0);

    id v42 = CFNotificationCenterGetDarwinNotifyCenter();
    int v43 = [(ACCTransportIOAccessoryManager *)v12 notificationUarpStagingStatusName];
    CFNotificationCenterRemoveObserver(v42, v12, v43, 0);

    if (v12->_notificationUarpStagingStatusName2)
    {
      unsigned int v44 = CFNotificationCenterGetDarwinNotifyCenter();
      int v45 = [(ACCTransportIOAccessoryManager *)v12 notificationUarpStagingStatusName2];
      CFNotificationCenterRemoveObserver(v44, v12, v45, 0);
    }
    id v46 = v12->_notificationUarpStartUpdateName;
    v12->_notificationUarpStartUpdateName = 0;

    int v47 = v12->_notificationUarpEndUpdateName;
    v12->_notificationUarpEndUpdateName = 0;

    int v48 = v12->_notificationUarpStagingStatusName;
    v12->_notificationUarpStagingStatusName = 0;

    unsigned int v49 = v12->_notificationUarpStagingStatusName2;
    v12->_notificationUarpStagingStatusName2 = 0;

    v12->_notificationUarpRegistered = 0;
  }
LABEL_64:
  objc_sync_exit(v12);
}

- (void)_registerForUarpActivityForModel:(id)a3
{
}

- (void)_unregisterForUarpActivityForModel:(id)a3
{
}

- (void)_kickTimerForUarpActivityForModel:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 4;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v7 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [(ACCTransportIOAccessoryBase *)self primaryPortNumber];
    uint64_t v9 = [(ACCTransportIOAccessoryManager *)self connectionUUID];
    BOOL v10 = self->_notificationUarpStagingStatusActivityTimer != 0;
    int v23 = 136316162;
    BOOL v24 = "-[ACCTransportIOAccessoryManager _kickTimerForUarpActivityForModel:]";
    __int16 v25 = 1024;
    int v26 = v8;
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v4;
    __int16 v31 = 1024;
    LODWORD(v32) = v10;
    _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel '%@', (timer exist %d)", (uint8_t *)&v23, 0x2Cu);
  }
  if (self->_notificationUarpStagingStatusActivityTimer)
  {
    uint64_t v11 = acc_userDefaults_copyIntegerForKey(@"UARPActivityTimerS");
    if (v11) {
      unint64_t v12 = v11;
    }
    else {
      unint64_t v12 = 600;
    }
    if ((v12 & 0x8000000000000000) != 0)
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        int v15 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        int v15 = MEMORY[0x263EF8438];
        id v22 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[ACCTransportIOAccessoryManager _kickTimerForUarpActivityForModel:](self);
      }

      dispatch_source_set_timer((dispatch_source_t)self->_notificationUarpStagingStatusActivityTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
    else
    {
      if (v12 >= 0x78) {
        uint64_t v13 = 30;
      }
      else {
        uint64_t v13 = v12 >> 2;
      }
      if (gLogObjects && gNumLogObjects >= 4)
      {
        BOOL v14 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        BOOL v14 = MEMORY[0x263EF8438];
        id v16 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = [(ACCTransportIOAccessoryBase *)self primaryPortNumber];
        unsigned int v18 = [(ACCTransportIOAccessoryManager *)self connectionUUID];
        int v23 = 136316418;
        BOOL v24 = "-[ACCTransportIOAccessoryManager _kickTimerForUarpActivityForModel:]";
        __int16 v25 = 1024;
        int v26 = v17;
        __int16 v27 = 2112;
        id v28 = v18;
        __int16 v29 = 2112;
        id v30 = v4;
        __int16 v31 = 2048;
        unint64_t v32 = v12;
        __int16 v33 = 2048;
        uint64_t v34 = v13;
        _os_log_impl(&dword_222CE3000, v14, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel '%@', start check timer. (%ld / %llu)", (uint8_t *)&v23, 0x3Au);
      }
      notificationUarpStagingStatusActivityTimer = self->_notificationUarpStagingStatusActivityTimer;
      dispatch_time_t v20 = dispatch_time(0, 1000000000 * v12);
      dispatch_source_set_timer(notificationUarpStagingStatusActivityTimer, v20, 0xFFFFFFFFFFFFFFFFLL, 1000000000 * v13);
      uint64_t v21 = __copyModelFromUarpNotificationName(self->_notificationUarpStagingStatusName2);
      self->_notificationUarpStagingStatusAlternateActive = [v21 isEqualToString:v4];
    }
  }
}

- (void)_stopTimerForUarpActivityForModel:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 4;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v7 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [(ACCTransportIOAccessoryBase *)self primaryPortNumber];
    uint64_t v9 = [(ACCTransportIOAccessoryManager *)self connectionUUID];
    BOOL v10 = self->_notificationUarpStagingStatusActivityTimer != 0;
    int v12 = 136316162;
    uint64_t v13 = "-[ACCTransportIOAccessoryManager _stopTimerForUarpActivityForModel:]";
    __int16 v14 = 1024;
    int v15 = v8;
    __int16 v16 = 2112;
    int v17 = v9;
    __int16 v18 = 2112;
    id v19 = v4;
    __int16 v20 = 1024;
    BOOL v21 = v10;
    _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel '%@', stop check timer. (timer exist %d)", (uint8_t *)&v12, 0x2Cu);
  }
  notificationUarpStagingStatusActivityTimer = self->_notificationUarpStagingStatusActivityTimer;
  if (notificationUarpStagingStatusActivityTimer) {
    dispatch_source_set_timer(notificationUarpStagingStatusActivityTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

- (void)_handleNotificationUarpStartUpdateForModel:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 4;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v7 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [(ACCTransportIOAccessoryBase *)self primaryPortNumber];
    uint64_t v9 = [(ACCTransportIOAccessoryManager *)self connectionUUID];
    int v10 = 136315906;
    uint64_t v11 = "-[ACCTransportIOAccessoryManager _handleNotificationUarpStartUpdateForModel:]";
    __int16 v12 = 1024;
    int v13 = v8;
    __int16 v14 = 2112;
    int v15 = v9;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel %@", (uint8_t *)&v10, 0x26u);
  }
  [(ACCTransportIOAccessoryManager *)self notifyDriverOfInductiveActivity:1 paused:0];
}

- (void)_handleNotificationUarpEndUpdateForModel:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 4;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v7 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [(ACCTransportIOAccessoryBase *)self primaryPortNumber];
    uint64_t v9 = [(ACCTransportIOAccessoryManager *)self connectionUUID];
    int v10 = 136315906;
    uint64_t v11 = "-[ACCTransportIOAccessoryManager _handleNotificationUarpEndUpdateForModel:]";
    __int16 v12 = 1024;
    int v13 = v8;
    __int16 v14 = 2112;
    int v15 = v9;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel %@", (uint8_t *)&v10, 0x26u);
  }
  [(ACCTransportIOAccessoryManager *)self notifyDriverOfInductiveActivity:0 paused:0];
}

- (void)_handleNotificationUarpStagingStatusForModel:(id)a3 state:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 4;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v9 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [(ACCTransportIOAccessoryBase *)self primaryPortNumber];
    uint64_t v11 = [(ACCTransportIOAccessoryManager *)self connectionUUID];
    unint64_t notificationUarpStagingStatus = self->_notificationUarpStagingStatus;
    int v13 = 136316418;
    __int16 v14 = "-[ACCTransportIOAccessoryManager _handleNotificationUarpStagingStatusForModel:state:]";
    __int16 v15 = 1024;
    int v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2048;
    unint64_t v22 = notificationUarpStagingStatus;
    __int16 v23 = 2048;
    unint64_t v24 = a4;
    _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel %@, state %llu -> %llu", (uint8_t *)&v13, 0x3Au);
  }
  if (self->_notificationUarpStagingStatus != a4)
  {
    self->_unint64_t notificationUarpStagingStatus = a4;
    [(ACCTransportIOAccessoryManager *)self notifyDriverOfInductiveActivity:a4 != 0 paused:a4 == 2];
    a4 = self->_notificationUarpStagingStatus;
  }
  if (a4 == 1) {
    [(ACCTransportIOAccessoryManager *)self _kickTimerForUarpActivityForModel:v6];
  }
  else {
    [(ACCTransportIOAccessoryManager *)self _stopTimerForUarpActivityForModel:v6];
  }
}

- (void)_handleUartActivityTimeout
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_deviceModelNumber)
  {
    self->_notificationUarpStagingActivityTimedOut = 1;
    p_notificationUarpStagingStatusName2 = (void **)&self->_notificationUarpStagingStatusName2;
    if (self->_notificationUarpStagingStatusName2 && self->_notificationUarpStagingStatusAlternateActive)
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        id v4 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        id v4 = MEMORY[0x263EF8438];
        id v5 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      id v6 = *p_notificationUarpStagingStatusName2;
      int v11 = 136315394;
      __int16 v12 = "-[ACCTransportIOAccessoryManager _handleUartActivityTimeout]";
      __int16 v13 = 2112;
      __int16 v14 = v6;
      BOOL v7 = "%s: uarpStagingStatusTimer, handle alternate %@, force Inactive";
    }
    else
    {
      p_notificationUarpStagingStatusName2 = (void **)&self->_notificationUarpStagingStatusName;
      if (!self->_notificationUarpStagingStatusName) {
        return;
      }
      if (gLogObjects && gNumLogObjects >= 4)
      {
        id v4 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        id v4 = MEMORY[0x263EF8438];
        id v8 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      uint64_t v9 = *p_notificationUarpStagingStatusName2;
      int v11 = 136315394;
      __int16 v12 = "-[ACCTransportIOAccessoryManager _handleUartActivityTimeout]";
      __int16 v13 = 2112;
      __int16 v14 = v9;
      BOOL v7 = "%s: uarpStagingStatusTimer, handle %@, force Inactive";
    }
    _os_log_impl(&dword_222CE3000, v4, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, 0x16u);
LABEL_22:

    int v10 = __copyModelFromUarpNotificationName(*p_notificationUarpStagingStatusName2);
    [(ACCTransportIOAccessoryManager *)self _handleNotificationUarpStagingStatusForModel:v10 state:0];
  }
}

- (void)notifyDriverOfInductiveActivity:(BOOL)a3 paused:(BOOL)a4
{
  kern_return_t v13;
  BOOL v14;
  NSObject *v15;
  int v16;
  int v17;
  NSObject *v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  io_connect_t v23;
  unsigned int v24;
  io_connect_t connect;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  unsigned char v31[10];
  BOOL v32;
  __int16 v33;
  BOOL v34;
  __int16 v35;
  unsigned int v36;
  uint64_t v37;

  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 4;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v9 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [(ACCTransportIOAccessoryBase *)self primaryPortNumber];
    int v11 = [(ACCTransportIOAccessoryManager *)self connectionUUID];
    *(_DWORD *)buf = 136316418;
    __int16 v27 = "-[ACCTransportIOAccessoryManager notifyDriverOfInductiveActivity:paused:]";
    id v28 = 1024;
    __int16 v29 = v10;
    id v30 = 2112;
    *(void *)__int16 v31 = v11;
    *(_WORD *)&v31[8] = 1024;
    unint64_t v32 = v5;
    __int16 v33 = 1024;
    uint64_t v34 = v4;
    uint64_t v35 = 1024;
    uint64_t v36 = [(ACCTransportIOAccessoryBase *)self ioService];
    _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, active %d, paused %d, service %d", buf, 0x2Eu);
  }
  connect = 0;
  io_service_t v12 = [(ACCTransportIOAccessoryBase *)self ioService];
  __int16 v13 = IOServiceOpen(v12, *MEMORY[0x263EF8960], 0, &connect);
  if (v13) {
    __int16 v14 = 1;
  }
  else {
    __int16 v14 = connect == 0;
  }
  if (v14)
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      uint64_t v15 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v15 = MEMORY[0x263EF8438];
      __int16 v19 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = connect;
      unint64_t v24 = [(ACCTransportIOAccessoryBase *)self ioService];
      *(_DWORD *)buf = 136315906;
      __int16 v27 = "-[ACCTransportIOAccessoryManager notifyDriverOfInductiveActivity:paused:]";
      id v28 = 1024;
      __int16 v29 = v13;
      id v30 = 1024;
      *(_DWORD *)__int16 v31 = v23;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v24;
      _os_log_error_impl(&dword_222CE3000, v15, OS_LOG_TYPE_ERROR, "%s: IOServiceOpen fail kernStatus:%02X, ioConnForService:%04X ioService:%d", buf, 0x1Eu);
    }
  }
  else
  {
    if (v5) {
      int v16 = 0x400000;
    }
    else {
      int v16 = 0;
    }
    if (v4) {
      __int16 v17 = v16 | 0x800000;
    }
    else {
      __int16 v17 = v16;
    }
    if ((!v5 || !v4) && IOAccessoryManagerRevokeFeatures())
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        uint64_t v18 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        uint64_t v18 = MEMORY[0x263EF8438];
        id v20 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryManager notifyDriverOfInductiveActivity:paused:]();
      }
    }
    if (v17 && IOAccessoryManagerAllowFeatures())
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        __int16 v21 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        __int16 v21 = MEMORY[0x263EF8438];
        unint64_t v22 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryManager notifyDriverOfInductiveActivity:paused:]();
      }
    }
    IOServiceClose(connect);
  }
}

- (NSSet)ioAccessoryChildPorts
{
  BOOL v2 = (void *)MEMORY[0x263EFFA08];
  BOOL v3 = [(ACCTransportIOAccessoryManager *)self mutableioAccessoryChildPorts];
  BOOL v4 = [v2 setWithSet:v3];

  return (NSSet *)v4;
}

- (NSSet)eaProtocolChildPorts
{
  BOOL v2 = (void *)MEMORY[0x263EFFA08];
  BOOL v3 = [(ACCTransportIOAccessoryManager *)self mutableioAccessoryEAChildPorts];
  BOOL v4 = [v2 setWithSet:v3];

  return (NSSet *)v4;
}

- (NSSet)authCPChildPorts
{
  BOOL v2 = (void *)MEMORY[0x263EFFA08];
  BOOL v3 = [(ACCTransportIOAccessoryManager *)self mutableioAccessoryAuthCPChildPorts];
  BOOL v4 = [v2 setWithSet:v3];

  return (NSSet *)v4;
}

- (NSSet)oobPairingChildPorts
{
  BOOL v2 = (void *)MEMORY[0x263EFFA08];
  BOOL v3 = [(ACCTransportIOAccessoryManager *)self mutableioAccessoryOOBPairingChildPorts];
  BOOL v4 = [v2 setWithSet:v3];

  return (NSSet *)v4;
}

- (NSSet)configStreamChildPorts
{
  BOOL v2 = (void *)MEMORY[0x263EFFA08];
  BOOL v3 = [(ACCTransportIOAccessoryManager *)self mutableioAccessoryConfigStreamChildPorts];
  BOOL v4 = [v2 setWithSet:v3];

  return (NSSet *)v4;
}

- (NSString)connectionUUID
{
  BOOL v2 = self;
  objc_sync_enter(v2);
  if (v2->_connectionUUID)
  {
    BOOL v3 = objc_msgSend(NSString, "stringWithString:");
  }
  else
  {
    BOOL v3 = 0;
  }
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (void)setAccessoryPowerMode:(int)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 4;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v7 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 67109632;
    int v14 = [(ACCTransportIOAccessoryBase *)self primaryPortNumber];
    __int16 v15 = 1024;
    unsigned int v16 = [(ACCTransportIOAccessoryBase *)self ioService];
    __int16 v17 = 1024;
    int v18 = a3;
    _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEFAULT, "setAccessoryPowerMode: primaryPort %d, ioService %d, accessoryPowerMode: %d", (uint8_t *)&v13, 0x14u);
  }

  if (IOAccessoryManagerConfigurePower())
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      id v8 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v8 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryManager setAccessoryPowerMode:]();
    }
  }
  else
  {
    self->_accessoryPowerMode = a3;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      id v8 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v8 = MEMORY[0x263EF8438];
      id v10 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [(ACCTransportIOAccessoryManager *)self accessoryPowerMode];
      unsigned int v12 = [(ACCTransportIOAccessoryBase *)self ioService];
      int v13 = 67109376;
      int v14 = v11;
      __int16 v15 = 1024;
      unsigned int v16 = v12;
      _os_log_impl(&dword_222CE3000, v8, OS_LOG_TYPE_DEFAULT, "Successfully set acc. power mode to %u for service %u", (uint8_t *)&v13, 0xEu);
    }
  }
}

- (void)setConnectionUUID:(id)a3
{
  id v7 = a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  connectionUUID = v4->_connectionUUID;
  v4->_connectionUUID = (NSString *)v5;

  objc_sync_exit(v4);
}

- (int)accessoryPowerMode
{
  return self->_accessoryPowerMode;
}

- (BOOL)needsOOBPairing
{
  return self->_needsOOBPairing;
}

- (void)setNeedsOOBPairing:(BOOL)a3
{
  self->_needsOOBPairing = a3;
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (void)setIsAuthenticated:(BOOL)a3
{
  self->_isAuthenticated = a3;
}

- (BOOL)isAuthTimedOut
{
  return self->_isAuthTimedOut;
}

- (void)setIsAuthTimedOut:(BOOL)a3
{
  self->_isAuthTimedOut = a3;
}

- (BOOL)isRootPort
{
  return self->_isRootPort;
}

- (BOOL)isAdapter
{
  return self->_isAdapter;
}

- (int)connectionType
{
  return self->_connectionType;
}

- (BOOL)bAccConnected
{
  return self->_bAccConnected;
}

- (void)setBAccConnected:(BOOL)a3
{
  self->_bAccConnected = a3;
}

- (int)resistorID
{
  return self->_resistorID;
}

- (void)setResistorID:(int)a3
{
  self->_resistorID = a3;
}

- (OS_dispatch_source)authTimerAccessory
{
  return self->_authTimerAccessory;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceVendorName
{
  return self->_deviceVendorName;
}

- (void)setDeviceVendorName:(id)a3
{
}

- (NSString)deviceModelNumber
{
  return self->_deviceModelNumber;
}

- (void)setDeviceModelNumber:(id)a3
{
}

- (NSString)deviceSerialNumber
{
  return self->_deviceSerialNumber;
}

- (void)setDeviceSerialNumber:(id)a3
{
}

- (NSString)deviceHardwareRevision
{
  return self->_deviceHardwareRevision;
}

- (void)setDeviceHardwareRevision:(id)a3
{
}

- (NSString)deviceFirmwareRevision
{
  return self->_deviceFirmwareRevision;
}

- (void)setDeviceFirmwareRevision:(id)a3
{
}

- (NSString)ppid
{
  return self->_ppid;
}

- (void)setPpid:(id)a3
{
}

- (NSData)digitalID
{
  return self->_digitalID;
}

- (void)setDigitalID:(id)a3
{
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (void)setRegionCode:(id)a3
{
}

- (NSNumber)inductiveDeviceType
{
  return self->_inductiveDeviceType;
}

- (void)setInductiveDeviceType:(id)a3
{
}

- (NSNumber)inductiveDeviceID
{
  return self->_inductiveDeviceID;
}

- (void)setInductiveDeviceID:(id)a3
{
}

- (NSString)inductiveDeviceUID
{
  return self->_inductiveDeviceUID;
}

- (void)setInductiveDeviceUID:(id)a3
{
}

- (NSNumber)inductiveLocalDeviceID
{
  return self->_inductiveLocalDeviceID;
}

- (void)setInductiveLocalDeviceID:(id)a3
{
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(id)a3
{
}

- (NSNumber)productID
{
  return self->_productID;
}

- (void)setProductID:(id)a3
{
}

- (NSString)managerParent
{
  return self->_managerParent;
}

- (NSMutableSet)mutableioAccessoryChildPorts
{
  return self->_mutableioAccessoryChildPorts;
}

- (void)setMutableioAccessoryChildPorts:(id)a3
{
}

- (NSMutableSet)mutableioAccessoryEAChildPorts
{
  return self->_mutableioAccessoryEAChildPorts;
}

- (void)setMutableioAccessoryEAChildPorts:(id)a3
{
}

- (NSMutableSet)mutableioAccessoryAuthCPChildPorts
{
  return self->_mutableioAccessoryAuthCPChildPorts;
}

- (void)setMutableioAccessoryAuthCPChildPorts:(id)a3
{
}

- (NSMutableSet)mutableioAccessoryOOBPairingChildPorts
{
  return self->_mutableioAccessoryOOBPairingChildPorts;
}

- (void)setMutableioAccessoryOOBPairingChildPorts:(id)a3
{
}

- (NSMutableSet)mutableioAccessoryConfigStreamChildPorts
{
  return self->_mutableioAccessoryConfigStreamChildPorts;
}

- (void)setMutableioAccessoryConfigStreamChildPorts:(id)a3
{
}

- (BOOL)bIsInductive
{
  return self->_bIsInductive;
}

- (BOOL)bIsInductivePowerToAccessory
{
  return self->_bIsInductivePowerToAccessory;
}

- (IONotificationPort)batteryNotifyPortRef
{
  return self->_batteryNotifyPortRef;
}

- (void)setBatteryNotifyPortRef:(IONotificationPort *)a3
{
  self->_batteryNotifyPortRef = a3;
}

- (unsigned)batteryIterator
{
  return self->_batteryIterator;
}

- (void)setBatteryIterator:(unsigned int)a3
{
  self->_batteryIterator = a3;
}

- (unsigned)batteryChargeLevelPercent
{
  return self->_batteryChargeLevelPercent;
}

- (void)setBatteryChargeLevelPercent:(unsigned __int8)a3
{
  self->_batteryChargeLevelPercent = a3;
}

- (unsigned)notificationRef
{
  return self->_notificationRef;
}

- (void)setNotificationRef:(unsigned int)a3
{
  self->_notificationRef = a3;
}

- (unsigned)currentLimitBaseInmA
{
  return self->_currentLimitBaseInmA;
}

- (void)setCurrentLimitBaseInmA:(unsigned int)a3
{
  self->_unsigned int currentLimitBaseInmA = a3;
}

- (BOOL)currentLimitBaseInmAValid
{
  return self->_currentLimitBaseInmAValid;
}

- (void)setCurrentLimitBaseInmAValid:(BOOL)a3
{
  self->_BOOL currentLimitBaseInmAValid = a3;
}

- (BOOL)batteryPackModeEnabled
{
  return self->_batteryPackModeEnabled;
}

- (void)setBatteryPackModeEnabled:(BOOL)a3
{
  self->_BOOL batteryPackModeEnabled = a3;
}

- (BOOL)batteryPackModeEnabledValid
{
  return self->_batteryPackModeEnabledValid;
}

- (void)setBatteryPackModeEnabledValid:(BOOL)a3
{
  self->_BOOL batteryPackModeEnabledValid = a3;
}

- (NSString)notificationUarpStartUpdateName
{
  return self->_notificationUarpStartUpdateName;
}

- (NSString)notificationUarpEndUpdateName
{
  return self->_notificationUarpEndUpdateName;
}

- (NSString)notificationUarpStagingStatusName
{
  return self->_notificationUarpStagingStatusName;
}

- (NSString)notificationUarpStagingStatusName2
{
  return self->_notificationUarpStagingStatusName2;
}

- (BOOL)notificationUarpStagingStatusAlternateActive
{
  return self->_notificationUarpStagingStatusAlternateActive;
}

- (BOOL)notificationUarpStagingActivityTimedOut
{
  return self->_notificationUarpStagingActivityTimedOut;
}

- (BOOL)bIsWatch
{
  return self->_bIsWatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationUarpStagingStatusName2, 0);
  objc_storeStrong((id *)&self->_notificationUarpStagingStatusName, 0);
  objc_storeStrong((id *)&self->_notificationUarpEndUpdateName, 0);
  objc_storeStrong((id *)&self->_notificationUarpStartUpdateName, 0);
  objc_storeStrong((id *)&self->_mutableioAccessoryConfigStreamChildPorts, 0);
  objc_storeStrong((id *)&self->_mutableioAccessoryOOBPairingChildPorts, 0);
  objc_storeStrong((id *)&self->_mutableioAccessoryAuthCPChildPorts, 0);
  objc_storeStrong((id *)&self->_mutableioAccessoryEAChildPorts, 0);
  objc_storeStrong((id *)&self->_mutableioAccessoryChildPorts, 0);
  objc_storeStrong((id *)&self->_managerParent, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_inductiveLocalDeviceID, 0);
  objc_storeStrong((id *)&self->_inductiveDeviceUID, 0);
  objc_storeStrong((id *)&self->_inductiveDeviceID, 0);
  objc_storeStrong((id *)&self->_inductiveDeviceType, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_digitalID, 0);
  objc_storeStrong((id *)&self->_ppid, 0);
  objc_storeStrong((id *)&self->_deviceFirmwareRevision, 0);
  objc_storeStrong((id *)&self->_deviceHardwareRevision, 0);
  objc_storeStrong((id *)&self->_deviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_deviceModelNumber, 0);
  objc_storeStrong((id *)&self->_deviceVendorName, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_authTimerAccessory, 0);
  objc_storeStrong((id *)&self->_notificationUarpStagingStatusActivityTimer, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
}

- (void)initWithIOService:.cold.4()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, "IOServiceOpen failed %#x", v2, v3, v4, v5, v6);
}

- (void)initWithIOService:(uint64_t)a3 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_222CE3000, a2, a3, "IOAccessoryManager added, isRootPort = %d", a5, a6, a7, a8, 0);
}

void __52__ACCTransportIOAccessoryManager_initWithIOService___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_16();
  _os_log_error_impl(&dword_222CE3000, v0, OS_LOG_TYPE_ERROR, "Auth timeout setAuthenticationStatus: failed!", v1, 2u);
}

- (void)addIOAccessoryChildPort:(void *)a1 .cold.1(void *a1)
{
  [a1 ioService];
  [a1 ioServiceClassType];
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_22(&dword_222CE3000, v2, v3, "adding child port %@ with service %d and class type %d", v4, v5, v6, v7, v8);
}

- (void)removeIOAccessoryChildPort:(void *)a1 .cold.2(void *a1)
{
  [a1 ioService];
  [a1 ioServiceClassType];
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_22(&dword_222CE3000, v2, v3, "removing child port %@ with service %d and type %d", v4, v5, v6, v7, v8);
}

- (void)setFeaturesFromAuthStatus:(uint64_t)a3 authCert:(uint64_t)a4 certType:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setFeaturesFromAuthStatus:(uint64_t)a3 authCert:(uint64_t)a4 certType:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setFeaturesFromAuthStatus:(uint64_t)a3 authCert:(uint64_t)a4 certType:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setFeaturesFromAuthStatus:authCert:certType:.cold.8()
{
  OUTLINED_FUNCTION_13();
  uint64_t v4 = *MEMORY[0x263EF8340];
  [v1 primaryPortNumber];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_222CE3000, v0, v2, "[%d] IOAccMgrAllowFeatures fail kernStatus:%02X", v3);
}

- (void)setFeaturesFromAuthStatus:authCert:certType:.cold.10()
{
  OUTLINED_FUNCTION_13();
  uint64_t v4 = *MEMORY[0x263EF8340];
  [v1 primaryPortNumber];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_222CE3000, v0, v2, "[%d] IOAccMgrRevokeFeatures fail kernStatus:%02X", v3);
}

- (void)setFeaturesFromAuthStatus:authCert:certType:.cold.14()
{
  OUTLINED_FUNCTION_13();
  uint64_t v6 = *MEMORY[0x263EF8340];
  [v1 primaryPortNumber];
  OUTLINED_FUNCTION_8();
  __int16 v4 = v2;
  int v5 = 2;
  _os_log_error_impl(&dword_222CE3000, v0, OS_LOG_TYPE_ERROR, "[%d] Unsupported authStatus:%02X (Passed:%02X)", v3, 0x14u);
}

- (void)setFeaturesFromAuthStatus:(void *)a1 authCert:(NSObject *)a2 certType:.cold.17(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  [a1 primaryPortNumber];
  OUTLINED_FUNCTION_5_0();
  _os_log_error_impl(&dword_222CE3000, a2, OS_LOG_TYPE_ERROR, "[%d] AdvancedCharging is disabled for this device !", v3, 8u);
}

- (void)getUSBMode
{
  OUTLINED_FUNCTION_13();
  uint64_t v4 = *MEMORY[0x263EF8340];
  [v1 ioService];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_222CE3000, v0, v2, "ERROR, failed to getUSBConnect for service %d, status 0x%X", v3);
}

- (void)setUSBCurrentOffset:.cold.1()
{
  OUTLINED_FUNCTION_13();
  [v0 ioService];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_222CE3000, v1, v2, "successfully set IOAccessoryManagerSetUSBCurrentOffset %d for service %d", v3, v4, v5, v6, v7);
}

- (void)setUSBCurrentOffset:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_222CE3000, v0, v1, "ERROR - IOAccessoryManagerSetUSBCurrentOffset currentOffsetInmA=%d failed 0x%X", v2, v3);
}

- (void)setUSBCurrentLimitBase:forceResponse:.cold.2()
{
  OUTLINED_FUNCTION_13();
  [v0 ioService];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_222CE3000, v1, v2, "successfully set IOAccessoryManagerSetUSBCurrentLimitBase %d for service %d", v3, v4, v5, v6, v7);
}

- (void)setUSBCurrentLimitBase:forceResponse:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_222CE3000, v0, v1, "ERROR - IOAccessoryManagerSetUSBCurrentLimitBase currentLimitBaseInmA=%d failed 0x%X", v2, v3);
}

- (void)USBCurrentLimitInmA
{
  OUTLINED_FUNCTION_15(a1, a2);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_222CE3000, v2, v3, "successfully get IOAccessoryManagerGetUSBCurrentLimit %d for service %d", v4, v5, v6, v7, v8);
}

- (void)USBCurrentLimitBaseInmA
{
  OUTLINED_FUNCTION_15(a1, a2);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_222CE3000, v2, v3, "successfully get IOAccessoryManagerGetUSBCurrentLimitBase %d for service %d", v4, v5, v6, v7, v8);
}

- (void)USBCurrentLimitOffsetInmA
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_7(&dword_222CE3000, v0, v1, "ERROR - IOAccessoryManagerGetUSBCurrentLimitOffset usbCurrentLimitOffsetInmA=%d failed 0x%X", v2, v3);
}

- (void)USBChargingVoltageInmV
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_7(&dword_222CE3000, v0, v1, "ERROR - IOAccessoryManagerGetUSBChargingVoltage usbChargingVoltageInmV=%d failed 0x%X", v2, v3);
}

- (void)cableType
{
  OUTLINED_FUNCTION_4_0(&dword_222CE3000, a2, a3, "return cableType %d", a5, a6, a7, a8, 0);
}

- (void)setPowerDuringSleepEnabled:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, "ERROR - IOAccessoryManagerSetPowerDuringSleep failed 0x%X", v2, v3, v4, v5, v6);
}

- (void)setBatteryPackMode:(uint64_t)a1 forceResponse:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  [a2 ioService];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_222CE3000, v2, v3, "successfully set IOAccessoryManagerSetBatteryPackMode enabled %d for service %d", v4, v5, v6, v7, v8);
}

- (void)setBatteryPackMode:forceResponse:.cold.4()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, "ERROR - IOAccessoryManagerSetBatteryPackMode failed 0x%X", v2, v3, v4, v5, v6);
}

- (void)setAccessoryRequestedCurrent:.cold.1()
{
  OUTLINED_FUNCTION_13();
  [v0 ioService];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_222CE3000, v1, v2, "successfully set IOAccessoryManagerSetAccessoryRequestedCurrent %d for service %d", v3, v4, v5, v6, v7);
}

- (void)setAccessoryRequestedCurrent:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_222CE3000, v0, v1, "ERROR - IOAccessoryManagerSetAccessoryRequestedCurrent accessoryRequestedCurrentInmA=%d failed 0x%X", v2, v3);
}

- (void)setAccessoryUsedCurrent:.cold.1()
{
  OUTLINED_FUNCTION_13();
  [v0 ioService];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_222CE3000, v1, v2, "successfully set IOAccessoryManagerSetAccessoryUsedCurrent %d for service %d", v3, v4, v5, v6, v7);
}

- (void)setAccessoryUsedCurrent:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_222CE3000, v0, v1, "ERROR - IOAccessoryManagerSetAccessoryUsedCurrent accessoryUsedCurrentInmA=%d failed 0x%X", v2, v3);
}

- (void)resetAccessoryBaseCurrent
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, "ERROR - IOAccessoryManagerRestoreUSBCurrentLimitBase  failed 0x%X", v2, v3, v4, v5, v6);
}

- (void)supervisedTransportsRestricted
{
  uint8_t v7 = [a2 connectionUUID];
  OUTLINED_FUNCTION_14();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x16u);
}

- (void)_IOAccUSBModeTypeForSetUSBMode:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_222CE3000, v0, OS_LOG_TYPE_DEBUG, "returning %d for IOAccessoryUSBModeType, ACCPlatform_USB_ModeSet_t %d", v1, 0xEu);
}

- (void)_IOAccUSBModeTypeForSetUSBMode:.cold.3()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, "invalid ACCPlatform_USB_ModeSet_t usbMode %d", v2, v3, v4, v5, v6);
}

- (void)_ACCPlatformUSBModeForIOAccessoryUSBConnectType:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_222CE3000, v0, v1, "returning %d for ACCPlatform_USB_Mode_t", v2, v3, v4, v5, v6);
}

- (void)_ACCPlatformUSBModeForIOAccessoryUSBConnectType:.cold.3()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, "invalid IOAccessoryUSBConnectType usbConnect %d", v2, v3, v4, v5, v6);
}

- (void)_connectionTypeForPrimaryPort
{
  OUTLINED_FUNCTION_13();
  [v0 primaryPortNumber];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_222CE3000, v1, v2, "%{coreacc:ACCConnection_Type_t}d connection type for primary port IOAccessoryManager instance primaryPortNumber (Accessory Port Number ID in IOAccessoryManager) %d", v3, v4, v5, v6, v7);
}

- (void)_connectionUUIDsForNotification
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_12(&dword_222CE3000, v0, v1, "received IOAccessoryManager notification for main root primary port (not Orion)", v2, v3, v4, v5, v6);
}

- (void)_handleResistorIDChangeNotification:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_222CE3000, v0, v1, "New resistorID %d is the same as the current resistorID", v2, v3, v4, v5, v6);
}

- (void)_sendNotification:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_222CE3000, log, OS_LOG_TYPE_DEBUG, "Sending %@ notification for ConnectionUUIDs %@", (uint8_t *)&v3, 0x16u);
}

- (void)_kickTimerForUarpActivityForModel:(void *)a1 .cold.2(void *a1)
{
  [a1 primaryPortNumber];
  uint64_t v2 = [a1 connectionUUID];
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_14();
  _os_log_debug_impl(v3, v4, v5, v6, v7, 0x26u);
}

- (void)notifyDriverOfInductiveActivity:paused:.cold.1()
{
  LODWORD(v2) = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_21(&dword_222CE3000, v0, v1, "%s: IOAccMgrAllowFeatures 0x%x fail kernStatus:%02X", v2, v3, v4);
}

- (void)notifyDriverOfInductiveActivity:paused:.cold.3()
{
  LODWORD(v2) = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_21(&dword_222CE3000, v0, v1, "%s: IOAccMgrRevokeFeatures 0x%x fail kernStatus:%02X", v2, v3, v4);
}

- (void)setAccessoryPowerMode:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_222CE3000, v0, v1, "IOAccessoryManagerConfigurePower failed 0x%X, didn't set powerMode(%d)", v2, v3);
}

@end