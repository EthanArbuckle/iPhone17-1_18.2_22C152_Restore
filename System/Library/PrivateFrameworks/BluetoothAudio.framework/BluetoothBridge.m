@interface BluetoothBridge
+ (id)sharedBluetoothBridge;
- (BOOL)isConnected:(id)a3;
- (BOOL)isHALPublished:(unsigned __int8)a3 device:(id)a4;
- (BOOL)noHFPSupport;
- (BOOL)shouldRemoveDevice:(id)a3;
- (BOOL)targetUserSession;
- (BluetoothBridge)init;
- (CBDiscovery)deviceDiscovery;
- (CUSystemMonitor)systemMonitor;
- (OS_dispatch_queue)queue;
- (OS_dispatch_semaphore)connectedSemaphore;
- (OpaqueFigEndpointManager)manager;
- (__CFDictionary)createDescriptionWithDevice:(id)a3;
- (id)activation;
- (id)activationTimeoutBlock;
- (id)addressFromDevice:(id)a3;
- (id)deviceFromIdentifier:(id)a3;
- (id)lowerScanRate;
- (id)nameFromDevice:(id)a3;
- (id)uidFromDevice:(id)a3;
- (unsigned)supportedFormats:(id)a3;
- (void)addListeners;
- (void)connectToAddress:(id)a3 completionHandler:(id)a4;
- (void)getHFPSupportStatus;
- (void)setActivation:(id)a3;
- (void)setActivationTimeoutBlock:(id)a3;
- (void)setConnectedSemaphore:(id)a3;
- (void)setDeviceDiscovery:(id)a3;
- (void)setLowerScanRate:(id)a3;
- (void)setManager:(OpaqueFigEndpointManager *)a3;
- (void)setNoHFPSupport:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setSystemMonitor:(id)a3;
- (void)setTargetUserSession:(BOOL)a3;
- (void)startLEScanning:(BOOL)a3;
- (void)stopLEScanning;
@end

@implementation BluetoothBridge

void __31__BluetoothBridge_addListeners__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227451000, v2, OS_LOG_TYPE_INFO, "Audio devices changed", buf, 2u);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = [MEMORY[0x263EFEF30] devicesWithDiscoveryFlags:0x80000A08000 error:0];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v18;
    *(void *)&long long v5 = 138412546;
    long long v16 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "createDescriptionWithDevice:", v9, v16);
        if (v10)
        {
          v11 = (const void *)v10;
          v12 = BluetoothEndpointManagerLogComponent;
          if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v16;
            v22 = v11;
            __int16 v23 = 2112;
            uint64_t v24 = v9;
            _os_log_impl(&dword_227451000, v12, OS_LOG_TYPE_INFO, "HAL: %@ %@", buf, 0x16u);
          }
          BluetoothEndpointManagerHandleUpdateEvent((uint64_t)v11, [*(id *)(a1 + 32) manager]);
          CFRelease(v11);
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v6);
  }

  v13 = [*(id *)(a1 + 32) activation];

  if (v13)
  {
    v14 = [*(id *)(a1 + 32) activation];
    v14[2]();
  }
  else
  {
    v15 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227451000, v15, OS_LOG_TYPE_DEFAULT, "Activation block is nil", buf, 2u);
    }
  }
}

- (id)activation
{
  return objc_getProperty(self, a2, 64, 1);
}

+ (id)sharedBluetoothBridge
{
  if (sharedBluetoothBridge_sharedBridgeToken != -1) {
    dispatch_once(&sharedBluetoothBridge_sharedBridgeToken, &__block_literal_global);
  }
  v2 = (void *)sharedBluetoothBridge_sharedBluetoothBridge;
  return v2;
}

uint64_t __40__BluetoothBridge_sharedBluetoothBridge__block_invoke()
{
  sharedBluetoothBridge_sharedBluetoothBridge = objc_alloc_init(BluetoothBridge);
  return MEMORY[0x270F9A758]();
}

- (BluetoothBridge)init
{
  v9.receiver = self;
  v9.super_class = (Class)BluetoothBridge;
  v2 = [(BluetoothBridge *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("BluetoothBridge", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = (CUSystemMonitor *)objc_alloc_init(MEMORY[0x263F385E0]);
    systemMonitor = v2->_systemMonitor;
    v2->_systemMonitor = v6;

    [(CUSystemMonitor *)v2->_systemMonitor setFirstUnlockHandler:&__block_literal_global_4];
    [(CUSystemMonitor *)v2->_systemMonitor activateWithCompletion:0];
  }
  return v2;
}

void __23__BluetoothBridge_init__block_invoke()
{
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR)) {
    __23__BluetoothBridge_init__block_invoke_cold_1();
  }
}

- (void)setManager:(OpaqueFigEndpointManager *)a3
{
  self->_manager = a3;
  dispatch_queue_t v4 = [(BluetoothBridge *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__BluetoothBridge_setManager___block_invoke;
  block[3] = &unk_264808590;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __30__BluetoothBridge_setManager___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addListeners];
  v2 = *(void **)(a1 + 32);
  return [v2 getHFPSupportStatus];
}

- (void)getHFPSupportStatus
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227451000, v0, v1, "Error getting controller info to determine HFP support", v2, v3, v4, v5, v6);
}

uint64_t __38__BluetoothBridge_getHFPSupportStatus__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) getHFPSupportStatus];
}

- (__CFDictionary)createDescriptionWithDevice:(id)a3
{
  id v4 = a3;
  if ([(BluetoothBridge *)self shouldRemoveDevice:v4]
    || !objc_msgSend(MEMORY[0x263EFEF98], "isDeviceSupportedWithType:VIDsrc:VID:PID:", objc_msgSend(v4, "deviceType"), objc_msgSend(v4, "vendorIDSource"), objc_msgSend(v4, "vendorID"), (unsigned __int16)objc_msgSend(v4, "productID")))
  {
LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = [(BluetoothBridge *)self supportedFormats:v4];
  uint8_t v6 = [(BluetoothBridge *)self systemMonitor];
  char v7 = [v6 firstUnlocked];

  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR)) {
      -[BluetoothBridge createDescriptionWithDevice:]();
    }
    goto LABEL_8;
  }
  char v8 = [v4 gapaFlags];
  if (([v4 deviceFlags] & 0x1000000) != 0)
  {
    if (([v4 deviceFlags] & 4) != 0) {
      int v16 = MGGetBoolAnswer();
    }
    else {
      int v16 = 0;
    }
    long long v17 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v18 = [v17 BOOLForKey:@"WirelessSplitter"];

    int v9 = v18 | v16;
    unsigned int v57 = [v4 listeningMode];
    unsigned int v19 = ([v4 deviceFlags] >> 26) & 2;
    unsigned int v20 = v19 & 0xFFFFFFFE | ([v4 deviceFlags] >> 26) & 1;
    if ([v4 autoAncCapability] == 1) {
      uint64_t v10 = v20 | 4;
    }
    else {
      uint64_t v10 = v20;
    }
    unint64_t v60 = ((unint64_t)[v4 deviceFlags] >> 40) & 1;
    BOOL v12 = [v4 smartRoutingMode] == 1;
    unint64_t v58 = ((unint64_t)[v4 deviceFlags] >> 28) & 1;
    unint64_t v11 = ((unint64_t)[v4 deviceFlags] >> 23) & 1;
    unsigned __int8 v13 = [v4 spatialAudioMode];
    [v4 deviceFlags];
    BOOL v59 = [v4 conversationDetectCapability] == 1;
    BOOL v61 = [v4 conversationDetectConfig] == 1;
  }
  else
  {
    int v9 = 0;
    unsigned int v57 = 0;
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    unint64_t v58 = 0;
    unint64_t v60 = 0;
    BOOL v12 = 0;
    BOOL v59 = 0;
    BOOL v61 = 0;
    unsigned __int8 v13 = -1;
  }
  v21 = [MEMORY[0x263EFF9A0] dictionary];
  if (([v4 supportedServices] & 0x10000) != 0)
  {
    v14 = 0;
  }
  else
  {
    BOOL v56 = (v8 & 2) == 0;
    v22 = [(BluetoothBridge *)self addressFromDevice:v4];
    [v21 setObject:v22 forKey:@"DeviceID"];

    __int16 v23 = [NSNumber numberWithUnsignedChar:v5];
    [v21 setObject:v23 forKey:@"SupportedFormats"];

    uint64_t v24 = [(BluetoothBridge *)self nameFromDevice:v4];
    [v21 setObject:v24 forKey:@"Name"];

    BOOL v25 = [(BluetoothBridge *)self isConnected:v4];
    uint64_t v26 = *MEMORY[0x263EFFB40];
    uint64_t v27 = *MEMORY[0x263EFFB38];
    if (v25) {
      uint64_t v28 = *MEMORY[0x263EFFB40];
    }
    else {
      uint64_t v28 = *MEMORY[0x263EFFB38];
    }
    [v21 setObject:v28 forKey:@"Connected"];
    if (v9) {
      uint64_t v29 = v26;
    }
    else {
      uint64_t v29 = v27;
    }
    [v21 setObject:v29 forKey:@"Shareable"];
    v30 = [NSNumber numberWithInt:v57];
    [v21 setObject:v30 forKey:@"ListeningMode"];

    v31 = [NSNumber numberWithUnsignedInt:v10];
    [v21 setObject:v31 forKey:@"SupportedListeningModes"];

    v32 = [NSNumber numberWithBool:v11];
    [v21 setObject:v32 forKey:@"SupportsSpatialAudio"];

    v33 = [NSNumber numberWithUnsignedChar:v13];
    [v21 setObject:v33 forKey:@"SpatialAudioMode"];

    v34 = [NSNumber numberWithBool:v58];
    [v21 setObject:v34 forKey:@"SpatialAudioEnabled"];

    v35 = [NSNumber numberWithBool:v60];
    [v21 setObject:v35 forKey:@"SupportsSmartRouting"];

    v36 = [NSNumber numberWithBool:v12];
    [v21 setObject:v36 forKey:@"SmartRoutingEnabled"];

    v37 = [NSNumber numberWithBool:v59];
    [v21 setObject:v37 forKey:@"SupportsConversationDetect"];

    v38 = [NSNumber numberWithUnsignedChar:v61];
    [v21 setObject:v38 forKey:@"ConversationDetectEnable"];

    v39 = [NSNumber numberWithBool:v56];
    [v21 setObject:v39 forKey:@"IsGenuineAirPods"];

    int v40 = [v4 appearanceValue];
    if ((v40 - 2112) >= 6)
    {
      if ((v40 - 2369) >= 2)
      {
        if (v40 == 2625) {
          v41 = @"HearingAid";
        }
        else {
          v41 = @"Headphones";
        }
      }
      else
      {
        v41 = @"Headset";
      }
    }
    else
    {
      v41 = @"Speaker";
    }
    v42 = [NSString stringWithFormat:@"BT%@%d,%d", v41, objc_msgSend(v4, "vendorID"), objc_msgSend(v4, "productID")];
    [v21 setObject:v42 forKey:@"ModelID"];

    v43 = [MEMORY[0x263EFF9A0] dictionary];
    [v4 batteryLevelCase];
    if (v44 != 0.0)
    {
      v45 = NSNumber;
      [v4 batteryLevelCase];
      v46 = objc_msgSend(v45, "numberWithFloat:");
      [v43 setObject:v46 forKey:*MEMORY[0x263F01188]];
    }
    [v4 batteryLevelLeft];
    if (v47 != 0.0)
    {
      v48 = NSNumber;
      [v4 batteryLevelLeft];
      v49 = objc_msgSend(v48, "numberWithFloat:");
      [v43 setObject:v49 forKey:*MEMORY[0x263F01190]];
    }
    [v4 batteryLevelRight];
    if (v50 != 0.0)
    {
      v51 = NSNumber;
      [v4 batteryLevelRight];
      v52 = objc_msgSend(v51, "numberWithFloat:");
      [v43 setObject:v52 forKey:*MEMORY[0x263F01198]];
    }
    [v4 batteryLevelMain];
    if (v53 != 0.0)
    {
      v54 = NSNumber;
      [v4 batteryLevelMain];
      v55 = objc_msgSend(v54, "numberWithFloat:");
      [v43 setObject:v55 forKey:*MEMORY[0x263F011A0]];
    }
    [v21 setObject:v43 forKey:@"BatteryLevels"];
    v14 = v21;
  }
LABEL_9:

  return v14;
}

- (void)addListeners
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_227451000, a2, OS_LOG_TYPE_ERROR, "Failed to add AudioDevice listener %d", (uint8_t *)v2, 8u);
}

void __31__BluetoothBridge_addListeners__block_invoke_34(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    [v3 discoveryFlags];
    uint8_t v6 = CUPrintFlags64();
    *(_DWORD *)buf = 138412546;
    id v16 = v3;
    __int16 v17 = 2112;
    int v18 = v6;
    _os_log_impl(&dword_227451000, v5, OS_LOG_TYPE_DEFAULT, "Device found %@ with flags:%@", buf, 0x16u);
  }
  if ([*(id *)(a1 + 32) shouldRemoveDevice:v3])
  {
    unsigned __int8 v13 = @"DeviceID";
    char v7 = [*(id *)(a1 + 32) uidFromDevice:v3];
    v14 = v7;
    BluetoothEndpointManagerHandleRemove([NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1], objc_msgSend(*(id *)(a1 + 32), "manager"));

    char v8 = objc_msgSend(*(id *)(a1 + 32), "addressFromDevice:", v3, @"DeviceID");
    BOOL v12 = v8;
    BluetoothEndpointManagerHandleRemove([NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1], objc_msgSend(*(id *)(a1 + 32), "manager"));
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 32) createDescriptionWithDevice:v3];
    if (v9)
    {
      uint64_t v10 = (const void *)v9;
      BluetoothEndpointManagerHandleUpdateEvent(v9, [*(id *)(a1 + 32) manager]);
      CFRelease(v10);
    }
  }
}

void __31__BluetoothBridge_addListeners__block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v3;
    _os_log_impl(&dword_227451000, v4, OS_LOG_TYPE_DEFAULT, "Device lost %@", buf, 0xCu);
  }
  if (([v3 deviceFlags] & 0x4000) != 0)
  {
    uint64_t v7 = [*(id *)(a1 + 32) createDescriptionWithDevice:v3];
    if (v7)
    {
      char v8 = (const void *)v7;
      BluetoothEndpointManagerHandleUpdateEvent(v7, [*(id *)(a1 + 32) manager]);
      CFRelease(v8);
    }
  }
  else
  {
    uint64_t v11 = @"DeviceID";
    uint64_t v5 = [*(id *)(a1 + 32) uidFromDevice:v3];
    BOOL v12 = v5;
    BluetoothEndpointManagerHandleRemove([NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1], objc_msgSend(*(id *)(a1 + 32), "manager"));

    uint8_t v6 = objc_msgSend(*(id *)(a1 + 32), "addressFromDevice:", v3, @"DeviceID");
    uint64_t v10 = v6;
    BluetoothEndpointManagerHandleRemove([NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1], objc_msgSend(*(id *)(a1 + 32), "manager"));
  }
}

void __31__BluetoothBridge_addListeners__block_invoke_39(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR)) {
      __31__BluetoothBridge_addListeners__block_invoke_39_cold_1((uint64_t)v2, v3);
    }
  }
}

- (void)startLEScanning:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)MGGetStringAnswer();
  if (v5 && (uint8_t v6 = v5, v7 = [v5 isEqualToString:@"AudioAccessory"], CFRelease(v6), v7))
  {
    char v8 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227451000, v8, OS_LOG_TYPE_INFO, "Can't start LE scans on HomePod", buf, 2u);
    }
  }
  else
  {
    uint64_t v9 = (void *)BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v9;
      *(_DWORD *)buf = 67109376;
      BOOL v20 = [(BluetoothBridge *)self targetUserSession];
      __int16 v21 = 1024;
      BOOL v22 = v3;
      _os_log_impl(&dword_227451000, v10, OS_LOG_TYPE_DEFAULT, "Starting LE scanning (%d) fast:%d", buf, 0xEu);
    }
    uint64_t v11 = [(BluetoothBridge *)self deviceDiscovery];
    objc_msgSend(v11, "setDiscoveryFlags:", objc_msgSend(v11, "discoveryFlags") | 0x8000);

    BOOL v12 = [(BluetoothBridge *)self deviceDiscovery];
    [v12 setBleRSSIThresholdHint:4294967221];

    if (v3)
    {
      unsigned __int8 v13 = [(BluetoothBridge *)self deviceDiscovery];
      [v13 setBleScanRate:50];

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __35__BluetoothBridge_startLEScanning___block_invoke;
      block[3] = &unk_264808590;
      block[4] = self;
      dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS, block);
      [(BluetoothBridge *)self setLowerScanRate:v14];

      dispatch_time_t v15 = dispatch_time(0, 10000000000);
      id v16 = [(BluetoothBridge *)self queue];
      __int16 v17 = [(BluetoothBridge *)self lowerScanRate];
      dispatch_after(v15, v16, v17);
    }
  }
}

void __35__BluetoothBridge_startLEScanning___block_invoke(uint64_t a1)
{
  id v2 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_227451000, v2, OS_LOG_TYPE_DEFAULT, "Dropping scan rate to low", v4, 2u);
  }
  BOOL v3 = [*(id *)(a1 + 32) deviceDiscovery];
  [v3 setBleScanRate:30];
}

- (void)stopLEScanning
{
  BOOL v3 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_227451000, v3, OS_LOG_TYPE_DEFAULT, "Stop LE scanning", v11, 2u);
  }
  id v4 = [(BluetoothBridge *)self deviceDiscovery];
  objc_msgSend(v4, "setDiscoveryFlags:", objc_msgSend(v4, "discoveryFlags") & 0xFFFFFFFFFFFF7FFFLL);

  uint64_t v5 = [(BluetoothBridge *)self deviceDiscovery];
  [v5 setBleScanRate:0];

  uint64_t v6 = [(BluetoothBridge *)self lowerScanRate];
  if (v6)
  {
    int v7 = (void *)v6;
    char v8 = [(BluetoothBridge *)self lowerScanRate];
    intptr_t v9 = dispatch_block_testcancel(v8);

    if (!v9)
    {
      uint64_t v10 = [(BluetoothBridge *)self lowerScanRate];
      dispatch_block_cancel(v10);
    }
  }
}

- (BOOL)shouldRemoveDevice:(id)a3
{
  id v4 = a3;
  if (!v4 || ![(BluetoothBridge *)self supportedFormats:v4]) {
    goto LABEL_29;
  }
  if (([v4 deviceFlags] & 0x4000) != 0 || (objc_msgSend(v4, "deviceFlags") & 0x2000) != 0)
  {
    if (-[BluetoothBridge isConnected:](self, "isConnected:", v4) || ([v4 discoveryFlags] & 0x8000) != 0)
    {
      int v8 = [v4 connectedServices];
      uint64_t v9 = [v4 connectedServices];
      if ((v8 & 0x400000) == 0 || (v9 & 0x10000) != 0)
      {
        uint64_t v10 = [v4 deviceFlags] & 0x1000000000;
        uint64_t v11 = [v4 deviceFlags];
        unint64_t v12 = [v4 deviceFlags];
        uint64_t v13 = (v12 >> 37) & 1;
        if ((v12 & 0x2000000000) == 0 && v10) {
          LODWORD(v13) = [v4 primaryPlacement] == 3
        }
                      || [v4 primaryPlacement] == 0;
        unint64_t v14 = [v4 deviceFlags];
        uint64_t v15 = (v14 >> 38) & 1;
        if ((v14 & 0x4000000000) == 0 && v10) {
          LODWORD(v15) = [v4 secondaryPlacement] == 3
        }
                      || [v4 secondaryPlacement] == 0;
        if ((v11 & 0x800000000) == 0) {
          LODWORD(v15) = 1;
        }
        if ((v13 & v15) != 1)
        {
          BOOL v16 = 0;
          goto LABEL_30;
        }
        uint64_t v5 = BluetoothEndpointManagerLogComponent;
        if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v18 = 0;
          uint64_t v6 = "No device usable";
          int v7 = (uint8_t *)&v18;
          goto LABEL_28;
        }
      }
    }
    else
    {
      uint64_t v5 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = 0;
        uint64_t v6 = "Disconnected with no nearby status";
        int v7 = (uint8_t *)&v19;
        goto LABEL_28;
      }
    }
  }
  else
  {
    uint64_t v5 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = 0;
      uint64_t v6 = "No longer paired";
      int v7 = (uint8_t *)&v20;
LABEL_28:
      _os_log_impl(&dword_227451000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
LABEL_29:
  BOOL v16 = 1;
LABEL_30:

  return v16;
}

- (BOOL)isHALPublished:(unsigned __int8)a3 device:(id)a4
{
  int v4 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(BluetoothBridge *)self addressFromDevice:a4];
  HIDWORD(v6) = *(_DWORD *)"bolg";
  uint64_t v23 = 0;
  CFTypeRef outData = 0;
  uint64_t v22 = 0;
  UInt32 ioDataSize = 0;
  LODWORD(v6) = 1919186467;
  inAddress.mElement = 0;
  *(void *)&inAddress.mSelector = v6;
  int v7 = [NSString stringWithFormat:@"%@-btaudio", v5];
  if (AudioObjectGetPropertyDataSize(1u, &inAddress, 0, 0, (UInt32 *)&v23 + 1))
  {
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR)) {
      -[BluetoothBridge isHALPublished:device:]();
    }
    goto LABEL_4;
  }
  unsigned int v10 = HIDWORD(v23);
  uint64_t v11 = (char *)malloc_type_malloc(HIDWORD(v23), 0xF4EC74A5uLL);
  if (!v11)
  {
LABEL_4:
    BOOL v8 = 0;
    goto LABEL_5;
  }
  unint64_t v12 = v11;
  if (AudioObjectGetPropertyData(1u, &inAddress, 0, 0, (UInt32 *)&v23 + 1, v11))
  {
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR)) {
      -[BluetoothBridge isHALPublished:device:]();
    }
    free(v12);
    goto LABEL_4;
  }
  if (v10 < 4)
  {
LABEL_18:
    free(v12);
    __int16 v18 = BluetoothEndpointManagerLogComponent;
    BOOL v8 = 0;
    if (!os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    __int16 v19 = "HFP";
    if (v4 == 1) {
      __int16 v19 = "A2DP";
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v26 = v19;
    __int16 v27 = 2112;
    uint64_t v28 = v5;
    _os_log_impl(&dword_227451000, v18, OS_LOG_TYPE_DEFAULT, "%s is not published for %@", buf, 0x16u);
    goto LABEL_4;
  }
  uint64_t v13 = 0;
  unsigned int v14 = v10 >> 2;
  if (v10 >> 2 <= 1) {
    unsigned int v14 = 1;
  }
  uint64_t v15 = 4 * v14;
  while (1)
  {
    AudioObjectID v16 = *(_DWORD *)&v12[v13];
    UInt32 ioDataSize = 8;
    uint64_t v22 = 0x676C6F6275696420;
    LODWORD(v23) = 0;
    if (!AudioObjectGetPropertyData(v16, (const AudioObjectPropertyAddress *)&v22, 0, 0, &ioDataSize, &outData))
    {
      int v17 = [v7 isEqual:outData];
      CFRelease(outData);
      if (v17) {
        break;
      }
    }
    v13 += 4;
    if (v15 == v13) {
      goto LABEL_18;
    }
  }
  free(v12);
  BOOL v8 = 1;
LABEL_5:

  return v8;
}

- (BOOL)isConnected:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR)) {
      -[BluetoothBridge isConnected:]();
    }
    goto LABEL_14;
  }
  if (![(BluetoothBridge *)self supportedFormats:v4])
  {
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR)) {
      -[BluetoothBridge isConnected:]();
    }
    goto LABEL_14;
  }
  if (([(BluetoothBridge *)self supportedFormats:v4] & 4) != 0
    && ![(BluetoothBridge *)self isHALPublished:4 device:v4]
    || ([(BluetoothBridge *)self supportedFormats:v4] & 1) != 0
    && ![(BluetoothBridge *)self isHALPublished:1 device:v4]
    || ([(BluetoothBridge *)self supportedFormats:v4] & 2) != 0
    && ![(BluetoothBridge *)self isHALPublished:2 device:v4])
  {
LABEL_14:
    BOOL v5 = 0;
    goto LABEL_15;
  }
  BOOL v5 = 1;
LABEL_15:

  return v5;
}

- (unsigned)supportedFormats:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    unsigned int v6 = ([v4 supportedServices] >> 4) & 1;
    int v7 = v6 & 0xFFFFFFFD | (2 * ([v5 supportedServices] & 1));
    unsigned int v8 = ([v5 supportedServices] >> 14) & 4 | v7;
    if (!v7 && v8 <= 3 && ([v5 deviceFlags] & 0x1000000) != 0)
    {
      uint64_t v9 = (void *)BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR)) {
        [(BluetoothBridge *)v9 supportedFormats:v5];
      }
      LOBYTE(v8) = 3;
    }
    if (([v5 deviceFlags] & 0x20000000) != 0)
    {
      unsigned int v10 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        unsigned int v14 = v5;
        _os_log_impl(&dword_227451000, v10, OS_LOG_TYPE_DEFAULT, "%@ is guest not in contacts removing handsfree service", (uint8_t *)&v13, 0xCu);
      }
      LOBYTE(v8) = v8 & 0xFD;
    }
    if ([(BluetoothBridge *)self noHFPSupport]) {
      unsigned __int8 v11 = v8 & 0xFD;
    }
    else {
      unsigned __int8 v11 = v8;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)deviceFromIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFEF20]);
  [v4 setIdentifier:v3];
  [MEMORY[0x263EFEF30] devicesWithDiscoveryFlags:0x80000A08000 error:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEquivalentToCBDevice:compareFlags:", v4, 8, (void)v14))
        {
          id v12 = v10;

          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  unsigned __int8 v11 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v3;
    _os_log_impl(&dword_227451000, v11, OS_LOG_TYPE_DEFAULT, "Couldn't find a paired device with identifier %@", buf, 0xCu);
  }
  id v12 = v4;
LABEL_13:

  return v12;
}

- (id)addressFromDevice:(id)a3
{
  id v3 = [a3 btAddressData];
  id v4 = CUPrintNSDataAddress();

  return v4;
}

- (id)nameFromDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  if (!v5)
  {
    id v5 = [(BluetoothBridge *)self addressFromDevice:v4];
  }

  return v5;
}

- (id)uidFromDevice:(id)a3
{
  return (id)[a3 identifier];
}

- (void)connectToAddress:(id)a3 completionHandler:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, void))a4;
  uint64_t v7 = [(BluetoothBridge *)self deviceFromIdentifier:a3];
  if ([(BluetoothBridge *)self isConnected:v7])
  {
    v6[2](v6, 0);
  }
  else
  {
    uint64_t v8 = (void *)BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v8;
      unsigned int v10 = [(BluetoothBridge *)self nameFromDevice:v7];
      *(_DWORD *)buf = 138412290;
      v37 = v10;
      _os_log_impl(&dword_227451000, v9, OS_LOG_TYPE_DEFAULT, "Connect to device %@", buf, 0xCu);
    }
    id v11 = objc_alloc_init(MEMORY[0x263EFEF18]);
    id v12 = objc_alloc_init(MEMORY[0x263EFEF10]);
    [v12 setPeerDevice:v7];
    [v12 setServiceFlags:0xFFFFFFFFLL];
    if (([(BluetoothBridge *)self supportedFormats:v7] & 4) != 0) {
      [v12 setConnectionFlags:256];
    }
    if (([v7 deviceFlags] & 0x20000000) != 0)
    {
      int v13 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227451000, v13, OS_LOG_TYPE_DEFAULT, "Wireless Splitter this is a guest not in contacts blocking HFP & GATT services", buf, 2u);
      }
      [v12 setServiceFlags:524312];
    }
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke;
    v34[3] = &unk_264808628;
    v34[4] = self;
    id v14 = v7;
    id v35 = v14;
    [v12 activateWithCompletion:v34];
    id v15 = objc_alloc_init(MEMORY[0x263EFEF28]);
    [v15 setAudioRouteHidden:0];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_60;
    v32[3] = &unk_2648083E0;
    id v33 = v11;
    id v16 = v11;
    [v16 modifyDevice:v14 settings:v15 completion:v32];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_61;
    block[3] = &unk_264808650;
    long long v17 = v6;
    block[4] = self;
    id v31 = v17;
    dispatch_block_t v18 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
    [(BluetoothBridge *)self setActivationTimeoutBlock:v18];

    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    BOOL v25 = __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_62;
    uint64_t v26 = &unk_264808678;
    uint64_t v29 = self;
    id v27 = v14;
    uint64_t v28 = v17;
    [(BluetoothBridge *)self setActivation:&v23];
    id v19 = [(BluetoothBridge *)self activation];
    v19[2]();

    dispatch_time_t v20 = dispatch_time(0, 20000000000);
    uint64_t v21 = [(BluetoothBridge *)self queue];
    uint64_t v22 = [(BluetoothBridge *)self activationTimeoutBlock];
    dispatch_after(v20, v21, v22);
  }
}

void __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)BluetoothEndpointManagerLogComponent;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR)) {
      __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_cold_1(a1, v4);
    }
  }
  else if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v7 = v4;
    uint64_t v8 = [v6 nameFromDevice:v5];
    int v9 = 138412290;
    unsigned int v10 = v8;
    _os_log_impl(&dword_227451000, v7, OS_LOG_TYPE_DEFAULT, "Baseband connected to %@", (uint8_t *)&v9, 0xCu);
  }
}

void __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_60(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR)) {
    __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_60_cold_1();
  }
  [*(id *)(a1 + 32) invalidate];
}

uint64_t __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_61(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR)) {
    __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_61_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) setActivation:0];
  return [*(id *)(a1 + 32) setActivationTimeoutBlock:0];
}

void __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_62(uint64_t a1)
{
  if ([*(id *)(a1 + 48) isConnected:*(void *)(a1 + 32)])
  {
    id v2 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_227451000, v2, OS_LOG_TYPE_DEFAULT, "Activated", v4, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 48) setActivation:0];
    id v3 = [*(id *)(a1 + 48) activationTimeoutBlock];
    dispatch_block_cancel(v3);
  }
}

- (OS_dispatch_semaphore)connectedSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnectedSemaphore:(id)a3
{
}

- (OpaqueFigEndpointManager)manager
{
  return self->_manager;
}

- (CBDiscovery)deviceDiscovery
{
  return (CBDiscovery *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeviceDiscovery:(id)a3
{
}

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (void)setTargetUserSession:(BOOL)a3
{
  self->_targetUserSession = a3;
}

- (CUSystemMonitor)systemMonitor
{
  return (CUSystemMonitor *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSystemMonitor:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setQueue:(id)a3
{
}

- (id)lowerScanRate
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setLowerScanRate:(id)a3
{
}

- (void)setActivation:(id)a3
{
}

- (id)activationTimeoutBlock
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setActivationTimeoutBlock:(id)a3
{
}

- (BOOL)noHFPSupport
{
  return self->_noHFPSupport;
}

- (void)setNoHFPSupport:(BOOL)a3
{
  self->_noHFPSupport = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activationTimeoutBlock, 0);
  objc_storeStrong(&self->_activation, 0);
  objc_storeStrong(&self->_lowerScanRate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_storeStrong((id *)&self->_connectedSemaphore, 0);
}

void __23__BluetoothBridge_init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227451000, v0, v1, "First unlock handler", v2, v3, v4, v5, v6);
}

- (void)createDescriptionWithDevice:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227451000, v0, v1, "Can't get PID/VID before first unlock", v2, v3, v4, v5, v6);
}

void __31__BluetoothBridge_addListeners__block_invoke_39_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_227451000, a2, OS_LOG_TYPE_ERROR, "Starting Discovery error %@", (uint8_t *)&v2, 0xCu);
}

- (void)isHALPublished:device:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227451000, v0, v1, "Couldn't get audio objects", v2, v3, v4, v5, v6);
}

- (void)isConnected:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227451000, v0, v1, "No device", v2, v3, v4, v5, v6);
}

- (void)isConnected:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227451000, v0, v1, "Device doesn't support audio?", v2, v3, v4, v5, v6);
}

- (void)supportedFormats:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  uint8_t v6 = [a2 nameFromDevice:a3];
  int v7 = 138412546;
  uint64_t v8 = v6;
  __int16 v9 = 1024;
  int v10 = [a3 supportedServices];
  _os_log_error_impl(&dword_227451000, v5, OS_LOG_TYPE_ERROR, "Error Service Mask isn't right %@ has service mask 0x%X", (uint8_t *)&v7, 0x12u);
}

void __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = a2;
  uint64_t v5 = [v2 nameFromDevice:v3];
  int v6 = 138412290;
  int v7 = v5;
  _os_log_error_impl(&dword_227451000, v4, OS_LOG_TYPE_ERROR, "Error connecting to %@", (uint8_t *)&v6, 0xCu);
}

void __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_60_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227451000, v0, v1, "Failed to set audio route hidden to no", v2, v3, v4, v5, v6);
}

void __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_61_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227451000, v0, v1, "Activate Timeout", v2, v3, v4, v5, v6);
}

@end