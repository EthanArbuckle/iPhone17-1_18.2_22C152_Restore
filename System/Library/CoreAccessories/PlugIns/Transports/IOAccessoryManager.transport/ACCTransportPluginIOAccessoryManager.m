@interface ACCTransportPluginIOAccessoryManager
- (BOOL)configureAccessoryPowerMode:(int)a3 forConnectionUUID:(id)a4;
- (BOOL)isBatteryPackModeEnabled:(id)a3;
- (BOOL)isPowerDuringSleepEnabled:(id)a3;
- (BOOL)isPowerDuringSleepSupported:(id)a3;
- (BOOL)isRunning;
- (BOOL)resetAccessoryBaseCurrent:(id)a3;
- (BOOL)sendOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5;
- (BOOL)setAccessoryRequestedCurrent:(unsigned int)a3 forConnectionUUID:(id)a4;
- (BOOL)setAccessoryUsedCurrent:(unsigned int)a3 forConnectionUUID:(id)a4;
- (BOOL)setBatteryPackMode:(BOOL)a3 forConnectionUUID:(id)a4 forceResponse:(BOOL)a5;
- (BOOL)setPowerDuringSleepEnabled:(BOOL)a3 forConnectionUUID:(id)a4;
- (BOOL)setUSBCurrentLimitBase:(unsigned int)a3 forConnectionUUID:(id)a4 forceResponse:(BOOL)a5;
- (BOOL)setUSBCurrentOffset:(int)a3 forConnectionUUID:(id)a4;
- (BOOL)setUSBMode:(int)a3 forConnectionUUID:(id)a4;
- (BOOL)setUSBMode:(int)a3 forEndpointUUID:(id)a4;
- (NSString)pluginName;
- (int)CableType:(id)a3;
- (int)USBModeForConnectionUUID:(id)a3;
- (int)USBModeForEndpointUUID:(id)a3;
- (unsigned)USBChargingVoltageInmV:(id)a3;
- (unsigned)USBCurrentLimitBaseInmA:(id)a3;
- (unsigned)USBCurrentLimitInmA:(id)a3;
- (unsigned)USBCurrentLimitOffsetInmA:(id)a3;
- (unsigned)accessoryChargingCurrentInmA:(id)a3;
- (unsigned)accessoryPowerModeCurrentLimitInmA:(int)a3 forConnectionUUID:(id)a4;
- (unsigned)sleepPowerCurrentLimitInmA:(id)a3;
- (void)authStatusDidChange:(int)a3 forConnectionWithUUID:(id)a4 previousAuthStatus:(int)a5 authType:(int)a6 connectionIsAuthenticated:(BOOL)a7 connectionWasAuthenticated:(BOOL)a8;
- (void)initPlugin;
- (void)resetLightningBusForEndpointWithUUID:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)startPlugin;
- (void)stopPlugin;
@end

@implementation ACCTransportPluginIOAccessoryManager

- (void)initPlugin
{
  init_logging();
  v3.receiver = self;
  v3.super_class = (Class)ACCTransportPluginIOAccessoryManager;
  [(ACCTransportPlugin *)&v3 initPlugin];
}

- (NSString)pluginName
{
  return (NSString *)@"IOAccessoryManager";
}

- (void)startPlugin
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CE3000, v5, OS_LOG_TYPE_DEFAULT, "Starting IOAccessoryManager transport plugin...", buf, 2u);
  }

  v8.receiver = self;
  v8.super_class = (Class)ACCTransportPluginIOAccessoryManager;
  [(ACCTransportPlugin *)&v8 startPlugin];
  v6 = +[ACCTransportIOAccessorySharedManager sharedManager];
  [v6 setDelegate:self];

  v7 = +[ACCTransportIOAccessorySharedManager sharedManager];
  [v7 startIOACCTransportManager];

  [(ACCTransportPlugin *)self setHandler:&__block_literal_global_8 forEndpointProperty:*MEMORY[0x263F34180]];
  [(ACCTransportPluginIOAccessoryManager *)self setIsRunning:1];
}

void __51__ACCTransportPluginIOAccessoryManager_startPlugin__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  LODWORD(a4) = [a4 BOOLValue];
  v6 = +[ACCTransportIOAccessorySharedManager sharedManager];
  id v7 = v6;
  if (a4) {
    [v6 handleOpenEASessionNotification:v5];
  }
  else {
    [v6 handleCloseEASessionNotification:v5];
  }
}

- (void)stopPlugin
{
  [(ACCTransportPlugin *)self setHandler:0 forEndpointProperty:*MEMORY[0x263F34180]];
  BOOL v3 = +[ACCTransportIOAccessorySharedManager sharedManager];
  [v3 stopIOACCTransportManager];

  id v4 = +[ACCTransportIOAccessorySharedManager sharedManager];
  [v4 setDelegate:0];

  v8.receiver = self;
  v8.super_class = (Class)ACCTransportPluginIOAccessoryManager;
  [(ACCTransportPlugin *)&v8 stopPlugin];
  [(ACCTransportPluginIOAccessoryManager *)self setIsRunning:0];
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v5 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v5 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_222CE3000, v5, OS_LOG_TYPE_DEFAULT, "Stopped IOAccessoryManager plugin!", v7, 2u);
  }
}

- (BOOL)sendOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 1;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    v12 = MEMORY[0x263EF8438];
    id v11 = MEMORY[0x263EF8438];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 138412802;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_debug_impl(&dword_222CE3000, v12, OS_LOG_TYPE_DEBUG, "Plugin sending outgoing data %@ for connection UUID: %@ endpoint UUID: %@", (uint8_t *)&v15, 0x20u);
  }

  v13 = +[ACCTransportIOAccessorySharedManager sharedManager];
  [v13 transmitData:v7 forEndpointUUID:v8];

  return 1;
}

- (void)authStatusDidChange:(int)a3 forConnectionWithUUID:(id)a4 previousAuthStatus:(int)a5 authType:(int)a6 connectionIsAuthenticated:(BOOL)a7 connectionWasAuthenticated:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v13 = a4;
  if (gLogObjects) {
    BOOL v14 = gNumLogObjects < 1;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v16 = MEMORY[0x263EF8438];
    id v15 = MEMORY[0x263EF8438];
  }
  else
  {
    id v16 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    __int16 v17 = "NO";
    *(_DWORD *)buf = 138413570;
    id v60 = v13;
    if (v9) {
      id v18 = "YES";
    }
    else {
      id v18 = "NO";
    }
    __int16 v61 = 1024;
    int v62 = a3;
    if (v8) {
      __int16 v17 = "YES";
    }
    __int16 v63 = 1024;
    int v64 = a5;
    __int16 v65 = 1024;
    int v66 = a6;
    __int16 v67 = 2080;
    v68 = v18;
    __int16 v69 = 2080;
    v70 = v17;
    _os_log_impl(&dword_222CE3000, v16, OS_LOG_TYPE_INFO, "authStatusDidChange handler!\nconnectionUUID: %@, authStatus: %{coreacc:ACCAuthInfo_Status_t}d, previousAuthStatus: %{coreacc:ACCAuthInfo_Status_t}d, authType: %{coreacc:ACCAuthInfo_Type_t}d, connectionIsAuthenticated: %s, connectionWasAuthenticated: %s", buf, 0x32u);
  }

  switch(a6)
  {
    case 1:
    case 3:
      __int16 v19 = +[ACCTransportIOAccessorySharedManager sharedManager];
      v51 = [v19 delegate];
      unsigned int v20 = [v51 connectionTypeForConnectionWithUUID:v13];
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v21 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        uint64_t v21 = MEMORY[0x263EF8438];
        id v27 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        id v60 = v13;
        __int16 v61 = 1024;
        int v62 = a3;
        __int16 v63 = 1024;
        int v64 = a6;
        __int16 v65 = 1024;
        int v66 = v20;
        _os_log_impl(&dword_222CE3000, v21, OS_LOG_TYPE_INFO, "authStatusDidChange handler!\nconnectionUUID: %@, authStatus: %{coreacc:ACCAuthInfo_Status_t}d, authType: %{coreacc:ACCAuthInfo_Type_t}d, connectionType %{coreacc:ACCConnection_Type_t}d", buf, 0x1Eu);
      }

      if (v20 > 6)
      {
        v22 = v51;
        goto LABEL_75;
      }
      id v50 = v13;
      v22 = v51;
      if (((1 << v20) & 0x5A) == 0) {
        goto LABEL_75;
      }
      uint64_t v28 = [v51 certificateDataForConnectionWithUUID:v13];
      if (a3 == 2) {
        uint64_t v29 = 2;
      }
      else {
        uint64_t v29 = 1;
      }
      v53 = (void *)v28;
      objc_msgSend(v19, "setFeaturesFromAuthStatus:andAuthCert:certType:forConnectionUUID:withConnectionType:", v29);
      v49 = [(ACCTransportPlugin *)self allConnectionUUIDs];
      v30 = [v49 allObjects];
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v55 != v33) {
              objc_enumerationMutation(v30);
            }
            uint64_t v35 = *(void *)(*((void *)&v54 + 1) + 8 * i);
            if ([(ACCTransportPlugin *)self connectionTypeForConnectionWithUUID:v35] == 1)
            {
              id v36 = [v19 digitalIDDataForUpstreamConnection:v35];
              v37 = (unsigned char *)[v36 bytes];
              uint64_t v38 = [v36 length];
              if (v37) {
                BOOL v39 = v38 == 6;
              }
              else {
                BOOL v39 = 0;
              }
              if (v39 && (*v37 & 0x38) == 0x18) {
                [v19 setFeaturesFromAuthStatus:v29 andAuthCert:v53 certType:0xFFFFFFFFLL forConnectionUUID:v35 withConnectionType:1];
              }
            }
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v54 objects:v58 count:16];
        }
        while (v32);
      }

      id v13 = v50;
      v22 = v51;
      v40 = v53;
      goto LABEL_74;
    case 2:
      __int16 v19 = +[ACCTransportIOAccessorySharedManager sharedManager];
      v22 = [v19 delegate];
      int v23 = [v22 connectionTypeForConnectionWithUUID:v13];
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v24 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        v24 = MEMORY[0x263EF8438];
        id v41 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        id v60 = v13;
        __int16 v61 = 1024;
        int v62 = a3;
        __int16 v63 = 1024;
        int v64 = 2;
        __int16 v65 = 1024;
        int v66 = v23;
        _os_log_impl(&dword_222CE3000, v24, OS_LOG_TYPE_INFO, "authStatusDidChange handler!\nconnectionUUID: %@, authStatus: %{coreacc:ACCAuthInfo_Status_t}d, authType: %{coreacc:ACCAuthInfo_Type_t}d, connectionType %{coreacc:ACCConnection_Type_t}d", buf, 0x1Eu);
      }

      if (v23 != 8) {
        goto LABEL_75;
      }
      v40 = [v22 certificateDataForConnectionWithUUID:v13];
      if (a3 == 2) {
        uint64_t v42 = 2;
      }
      else {
        uint64_t v42 = 1;
      }
      v43 = v19;
      v44 = v40;
      uint64_t v45 = 0xFFFFFFFFLL;
      id v46 = v13;
      uint64_t v47 = 8;
      break;
    case 4:
      __int16 v19 = +[ACCTransportIOAccessorySharedManager sharedManager];
      v22 = [v19 delegate];
      int v25 = [v22 connectionTypeForConnectionWithUUID:v13];
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v26 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        v26 = MEMORY[0x263EF8438];
        id v48 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        id v60 = v13;
        __int16 v61 = 1024;
        int v62 = a3;
        __int16 v63 = 1024;
        int v64 = 4;
        __int16 v65 = 1024;
        int v66 = v25;
        _os_log_impl(&dword_222CE3000, v26, OS_LOG_TYPE_INFO, "authStatusDidChange handler!\nconnectionUUID: %@, authStatus: %{coreacc:ACCAuthInfo_Status_t}d, authType: %{coreacc:ACCAuthInfo_Type_t}d, connectionType %{coreacc:ACCConnection_Type_t}d", buf, 0x1Eu);
      }

      if (v25 != 4) {
        goto LABEL_75;
      }
      v40 = [v22 certificateDataForConnectionWithUUID:v13];
      if (a3 == 2) {
        uint64_t v42 = 2;
      }
      else {
        uint64_t v42 = 1;
      }
      v43 = v19;
      v44 = v40;
      uint64_t v45 = 2;
      id v46 = v13;
      uint64_t v47 = 4;
      break;
    default:
      goto LABEL_76;
  }
  [v43 setFeaturesFromAuthStatus:v42 andAuthCert:v44 certType:v45 forConnectionUUID:v46 withConnectionType:v47];
LABEL_74:

LABEL_75:
LABEL_76:
}

- (BOOL)setUSBMode:(int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = +[ACCTransportIOAccessorySharedManager sharedManager];
  LOBYTE(v4) = [v6 setUSBMode:v4 forConnectionUUID:v5];

  return v4;
}

- (BOOL)setUSBMode:(int)a3 forEndpointUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = +[ACCTransportIOAccessorySharedManager sharedManager];
  LOBYTE(v4) = [v6 setUSBMode:v4 forEndpointUUID:v5];

  return v4;
}

- (int)USBModeForConnectionUUID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[ACCTransportIOAccessorySharedManager sharedManager];
  int v5 = [v4 USBModeForConnectionUUID:v3];

  return v5;
}

- (int)USBModeForEndpointUUID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[ACCTransportIOAccessorySharedManager sharedManager];
  int v5 = [v4 USBModeForEndpointUUID:v3];

  return v5;
}

- (BOOL)configureAccessoryPowerMode:(int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = +[ACCTransportIOAccessorySharedManager sharedManager];
  LOBYTE(v4) = [v6 configureAccessoryPowerMode:v4 forConnectionUUID:v5];

  return v4;
}

- (BOOL)setUSBCurrentOffset:(int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = +[ACCTransportIOAccessorySharedManager sharedManager];
  LOBYTE(v4) = [v6 setUSBCurrentOffset:v4 forConnectionUUID:v5];

  return v4;
}

- (BOOL)setUSBCurrentLimitBase:(unsigned int)a3 forConnectionUUID:(id)a4 forceResponse:(BOOL)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  BOOL v8 = +[ACCTransportIOAccessorySharedManager sharedManager];
  LOBYTE(v5) = [v8 setUSBCurrentLimitBase:v6 forConnectionUUID:v7 forceResponse:v5];

  return v5;
}

- (unsigned)USBCurrentLimitInmA:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[ACCTransportIOAccessorySharedManager sharedManager];
  unsigned int v5 = [v4 USBCurrentLimitInmA:v3];

  return v5;
}

- (unsigned)USBCurrentLimitBaseInmA:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[ACCTransportIOAccessorySharedManager sharedManager];
  unsigned int v5 = [v4 USBCurrentLimitBaseInmA:v3];

  return v5;
}

- (unsigned)USBCurrentLimitOffsetInmA:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[ACCTransportIOAccessorySharedManager sharedManager];
  unsigned int v5 = [v4 USBCurrentLimitOffsetInmA:v3];

  return v5;
}

- (unsigned)USBChargingVoltageInmV:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[ACCTransportIOAccessorySharedManager sharedManager];
  unsigned int v5 = [v4 USBChargingVoltageInmV:v3];

  return v5;
}

- (int)CableType:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[ACCTransportIOAccessorySharedManager sharedManager];
  int v5 = [v4 CableType:v3];

  return v5;
}

- (unsigned)sleepPowerCurrentLimitInmA:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[ACCTransportIOAccessorySharedManager sharedManager];
  unsigned int v5 = [v4 sleepPowerCurrentLimitInmA:v3];

  return v5;
}

- (BOOL)isPowerDuringSleepSupported:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[ACCTransportIOAccessorySharedManager sharedManager];
  char v5 = [v4 isPowerDuringSleepSupported:v3];

  return v5;
}

- (BOOL)setPowerDuringSleepEnabled:(BOOL)a3 forConnectionUUID:(id)a4
{
  uint64_t v4 = a3;
  id v5 = a4;
  uint64_t v6 = +[ACCTransportIOAccessorySharedManager sharedManager];
  LOBYTE(v4) = [v6 setPowerDuringSleepEnabled:v4 forConnectionUUID:v5];

  return v4;
}

- (BOOL)isPowerDuringSleepEnabled:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[ACCTransportIOAccessorySharedManager sharedManager];
  char v5 = [v4 isPowerDuringSleepEnabled:v3];

  return v5;
}

- (BOOL)setBatteryPackMode:(BOOL)a3 forConnectionUUID:(id)a4 forceResponse:(BOOL)a5
{
  uint64_t v5 = a5;
  BOOL v6 = a3;
  id v7 = a4;
  BOOL v8 = +[ACCTransportIOAccessorySharedManager sharedManager];
  LOBYTE(v5) = [v8 setBatteryPackMode:v6 forConnectionUUID:v7 forceResponse:v5];

  return v5;
}

- (BOOL)isBatteryPackModeEnabled:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[ACCTransportIOAccessorySharedManager sharedManager];
  char v5 = [v4 isBatteryPackModeEnabled:v3];

  return v5;
}

- (BOOL)setAccessoryRequestedCurrent:(unsigned int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  BOOL v6 = +[ACCTransportIOAccessorySharedManager sharedManager];
  LOBYTE(v4) = [v6 setAccessoryRequestedCurrent:v4 forConnectionUUID:v5];

  return v4;
}

- (BOOL)setAccessoryUsedCurrent:(unsigned int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  BOOL v6 = +[ACCTransportIOAccessorySharedManager sharedManager];
  LOBYTE(v4) = [v6 setAccessoryUsedCurrent:v4 forConnectionUUID:v5];

  return v4;
}

- (unsigned)accessoryChargingCurrentInmA:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[ACCTransportIOAccessorySharedManager sharedManager];
  unsigned int v5 = [v4 accessoryChargingCurrentInmA:v3];

  return v5;
}

- (unsigned)accessoryPowerModeCurrentLimitInmA:(int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  BOOL v6 = +[ACCTransportIOAccessorySharedManager sharedManager];
  LODWORD(v4) = [v6 accessoryPowerModeCurrentLimitInmA:v4 forConnectionUUID:v5];

  return v4;
}

- (BOOL)resetAccessoryBaseCurrent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[ACCTransportIOAccessorySharedManager sharedManager];
  char v5 = [v4 resetAccessoryBaseCurrent:v3];

  return v5;
}

- (void)resetLightningBusForEndpointWithUUID:(id)a3
{
  id v3 = a3;
  id v4 = +[ACCTransportIOAccessorySharedManager sharedManager];
  [v4 resetLightningBusForEndpointWithUUID:v3];
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

@end