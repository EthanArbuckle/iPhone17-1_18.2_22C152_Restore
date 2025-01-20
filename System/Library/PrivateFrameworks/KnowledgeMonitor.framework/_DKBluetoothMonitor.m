@interface _DKBluetoothMonitor
+ (id)_BMEventFromDKEvent:(id)a3 starting:(BOOL)a4 vendorID:(id)a5;
+ (id)_eventWithState:(BOOL)a3 name:(id)a4 address:(id)a5 type:(int)a6 isAppleAudioDevice:(BOOL)a7 isUserWearing:(BOOL)a8 productID:(unsigned int)a9 accessoryBatteryLevels:(id)a10;
+ (id)audioProductsBatteryLevels;
+ (id)contextValueForBluetoothConnectionStatus:(BOOL)a3 name:(id)a4 address:(id)a5 deviceType:(int)a6 isAppleAudioDevice:(BOOL)a7 isUserWearing:(BOOL)a8 productID:(unsigned int)a9;
+ (id)entitlements;
+ (id)eventStream;
+ (id)log;
+ (int)BMDeviceBluetoothDeviceTypeFromBTDeviceType:(int)a3;
- (BMPruner)pruner;
- (BOOL)_inEarStatusForDevice:(id)a3;
- (NSDictionary)batteryLevels;
- (NSLock)connectionUpdateLock;
- (NSMutableDictionary)activeConnections;
- (NSMutableDictionary)inactiveConnections;
- (NSMutableDictionary)previousVendorIDs;
- (OS_dispatch_queue)batteryLevelPollingQueue;
- (OS_dispatch_source)batteryLevelPollingTimer;
- (_DKBluetoothMonitor)init;
- (id)historicalDeletingHandler;
- (id)loadState;
- (void)deactivate;
- (void)dealloc;
- (void)handleUnpairingEvent:(id)a3;
- (void)receiveNotificationEvent:(id)a3;
- (void)saveState;
- (void)setActiveConnections:(id)a3;
- (void)setBatteryLevelPollingQueue:(id)a3;
- (void)setBatteryLevelPollingTimer:(id)a3;
- (void)setBatteryLevels:(id)a3;
- (void)setConnectionUpdateLock:(id)a3;
- (void)setHistoricalDeletingHandler:(id)a3;
- (void)setInactiveConnections:(id)a3;
- (void)setPreviousVendorIDs:(id)a3;
- (void)setPruner:(id)a3;
- (void)start;
- (void)stop;
- (void)updateCurrentBatteryLevels;
@end

@implementation _DKBluetoothMonitor

- (void)receiveNotificationEvent:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x22A629AA0]();
  if (self->_enabled)
  {
    v6 = [v4 objectForKeyedSubscript:@"Notification"];
    int v7 = [v6 isEqual:@"com.apple.bluetooth.pairing"];

    if (v7)
    {
      unint64_t v26 = 0;
      v8 = [v4 objectForKeyedSubscript:@"_State"];
      uint64_t v9 = [v8 unsignedLongLongValue];

      v10 = +[_DKBluetoothMonitor log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[_DKBluetoothMonitor receiveNotificationEvent:](v9, v10);
      }

      unint64_t v26 = bswap64(v9);
      LOWORD(v26) = HIWORD(v9);
      if (BTDeviceAddressToString())
      {
        v11 = +[_DKBluetoothMonitor log];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[_DKBluetoothMonitor receiveNotificationEvent:]((uint64_t)&v26, v11, v12, v13, v14, v15, v16, v17);
        }
      }
      else
      {
        v11 = [NSString stringWithUTF8String:v27];
        v18 = +[_DKBluetoothMonitor log];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = @"pairing";
          if ((v26 & 1) == 0) {
            v19 = @"unpairing";
          }
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v19;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v11;
          _os_log_impl(&dword_225002000, v18, OS_LOG_TYPE_INFO, "Handling %@ of %@", buf, 0x16u);
        }

        if ((v26 & 1) == 0)
        {
          v20 = [(_DKMonitor *)self queue];
          v24[0] = MEMORY[0x263EF8330];
          v24[1] = 3221225472;
          v24[2] = __48___DKBluetoothMonitor_receiveNotificationEvent___block_invoke;
          v24[3] = &unk_2647147D8;
          v24[4] = self;
          v11 = v11;
          v25 = v11;
          v21 = v24;
          v22 = (void *)os_transaction_create();
          *(void *)buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __cd_dispatch_async_capture_tx_block_invoke_6;
          v29 = &unk_2647148A0;
          id v30 = v22;
          id v31 = v21;
          id v23 = v22;
          dispatch_async(v20, buf);
        }
      }
    }
  }
}

- (_DKBluetoothMonitor)init
{
  v24.receiver = self;
  v24.super_class = (Class)_DKBluetoothMonitor;
  v2 = [(_DKMonitor *)&v24 init];
  if (v2)
  {
    v3 = BiomeLibrary();
    id v4 = [v3 Device];
    v5 = [v4 Wireless];
    v6 = [v5 Bluetooth];
    uint64_t v7 = [v6 source];
    source = v2->_source;
    v2->_source = (BMSource *)v7;

    uint64_t v9 = BiomeLibrary();
    v10 = [v9 Device];
    v11 = [v10 Wireless];
    uint64_t v12 = [v11 Bluetooth];
    uint64_t v13 = [v12 pruner];
    [(_DKBluetoothMonitor *)v2 setPruner:v13];

    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    activeConnections = v2->_activeConnections;
    v2->_activeConnections = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
    inactiveConnections = v2->_inactiveConnections;
    v2->_inactiveConnections = (NSMutableDictionary *)v16;

    uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
    previousVendorIDs = v2->_previousVendorIDs;
    v2->_previousVendorIDs = (NSMutableDictionary *)v18;

    id v20 = [(_DKBluetoothMonitor *)v2 loadState];
    v21 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    connectionUpdateLock = v2->_connectionUpdateLock;
    v2->_connectionUpdateLock = v21;
  }
  return v2;
}

- (void)dealloc
{
  [(_DKBluetoothMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKBluetoothMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

+ (id)eventStream
{
  return @"BluetoothConnected";
}

+ (id)entitlements
{
  return 0;
}

+ (id)audioProductsBatteryLevels
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (IOPSCopyPowerSourcesByTypePrecise() || (CFArrayRef v3 = IOPSCopyPowerSourcesList(0)) == 0)
  {
    v2 = (void *)MEMORY[0x263EFFA78];
  }
  else
  {
    CFArrayRef v4 = v3;
    CFIndex Count = CFArrayGetCount(v3);
    v2 = [MEMORY[0x263EFF9A0] dictionary];
    if (Count >= 1)
    {
      CFIndex v7 = 0;
      *(void *)&long long v6 = 138412546;
      long long v23 = v6;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v4, v7);
        CFDictionaryRef v9 = IOPSGetPowerSourceDescription(0, ValueAtIndex);
        Value = CFDictionaryGetValue(v9, @"Accessory Category");
        v11 = CFDictionaryGetValue(v9, @"Part Identifier");
        uint64_t v12 = CFDictionaryGetValue(v9, @"Group Identifier");
        if (!v12) {
          break;
        }
        uint64_t v13 = [v2 objectForKeyedSubscript:v12];

        if (!v13)
        {
          uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
          [v2 setObject:v14 forKeyedSubscript:v12];
        }
        unsigned int valuePtr = 0;
        if (!Value) {
          goto LABEL_24;
        }
        if (!CFEqual(Value, @"Headphone"))
        {
          if (!v11 || !CFEqual(Value, @"Audio Battery Case") || !CFEqual(v11, @"Case")) {
            goto LABEL_24;
          }
          CFNumberRef v19 = (const __CFNumber *)CFDictionaryGetValue(v9, @"Current Capacity");
          CFNumberGetValue(v19, kCFNumberSInt32Type, &valuePtr);
          uint64_t v16 = [NSNumber numberWithInt:valuePtr];
          uint64_t v17 = [v2 objectForKeyedSubscript:v12];
          uint64_t v18 = [MEMORY[0x263F35048] batteryLevelHeadphoneCase];
LABEL_22:
          v21 = (void *)v18;
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v18, v23);

LABEL_23:
          goto LABEL_24;
        }
        if (v11)
        {
          if (CFEqual(v11, @"Left"))
          {
            CFNumberRef v15 = (const __CFNumber *)CFDictionaryGetValue(v9, @"Current Capacity");
            CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr);
            uint64_t v16 = [NSNumber numberWithInt:valuePtr];
            uint64_t v17 = [v2 objectForKeyedSubscript:v12];
            uint64_t v18 = [MEMORY[0x263F35048] batteryLevelHeadphoneLeft];
            goto LABEL_22;
          }
          if (CFEqual(v11, @"Right"))
          {
            CFNumberRef v20 = (const __CFNumber *)CFDictionaryGetValue(v9, @"Current Capacity");
            CFNumberGetValue(v20, kCFNumberSInt32Type, &valuePtr);
            uint64_t v16 = [NSNumber numberWithInt:valuePtr];
            uint64_t v17 = [v2 objectForKeyedSubscript:v12];
            uint64_t v18 = [MEMORY[0x263F35048] batteryLevelHeadphoneRight];
            goto LABEL_22;
          }
        }
LABEL_24:

        if (Count == ++v7) {
          goto LABEL_25;
        }
      }
      uint64_t v16 = +[_DKBluetoothMonitor log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        unsigned int valuePtr = v23;
        v25 = Value;
        __int16 v26 = 2112;
        v27 = v11;
        _os_log_error_impl(&dword_225002000, v16, OS_LOG_TYPE_ERROR, "Could not retrieve device address for connected device: %@ - %@", (uint8_t *)&valuePtr, 0x16u);
      }
      goto LABEL_23;
    }
LABEL_25:
    CFRelease(v4);
    CFRelease(0);
  }
  return v2;
}

+ (id)_eventWithState:(BOOL)a3 name:(id)a4 address:(id)a5 type:(int)a6 isAppleAudioDevice:(BOOL)a7 isUserWearing:(BOOL)a8 productID:(unsigned int)a9 accessoryBatteryLevels:(id)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  uint64_t v12 = *(void *)&a6;
  id v14 = a4;
  id v15 = a5;
  id v16 = a10;
  uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
  if (v14)
  {
    uint64_t v18 = [MEMORY[0x263F35048] name];
    [v17 setObject:v14 forKey:v18];
  }
  if (v15)
  {
    CFNumberRef v19 = [MEMORY[0x263F35048] address];
    [v17 setObject:v15 forKey:v19];
  }
  CFNumberRef v20 = [NSNumber numberWithUnsignedInt:v12];
  v21 = [MEMORY[0x263F35048] deviceType];
  [v17 setObject:v20 forKey:v21];

  v22 = [NSNumber numberWithBool:v11];
  long long v23 = [MEMORY[0x263F35048] isAppleAudioDevice];
  [v17 setObject:v22 forKey:v23];

  objc_super v24 = [NSNumber numberWithBool:v10];
  v25 = [MEMORY[0x263F35048] isUserWearing];
  [v17 setObject:v24 forKeyedSubscript:v25];

  __int16 v26 = [NSNumber numberWithUnsignedInt:a9];
  v27 = [MEMORY[0x263F35048] productID];
  [v17 setObject:v26 forKey:v27];

  uint64_t v28 = [v16 objectForKeyedSubscript:v15];
  uint64_t v29 = [v28 count];

  if (v29)
  {
    id v30 = [v16 objectForKeyedSubscript:v15];
    [v17 addEntriesFromDictionary:v30];
  }
  if (a3) {
    [MEMORY[0x263F35050] on];
  }
  else {
  id v31 = [MEMORY[0x263F35050] off];
  }
  uint64_t v32 = (void *)MEMORY[0x263F35088];
  v33 = [MEMORY[0x263F35148] bluetoothIsConnectedStream];
  v34 = [MEMORY[0x263EFF910] date];
  v35 = [MEMORY[0x263EFF910] distantFuture];
  v36 = [v32 eventWithStream:v33 startDate:v34 endDate:v35 value:v31 metadata:v17];

  return v36;
}

+ (int)BMDeviceBluetoothDeviceTypeFromBTDeviceType:(int)a3
{
  if (a3 < 0x32) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

+ (id)_BMEventFromDKEvent:(id)a3 starting:(BOOL)a4 vendorID:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  CFDictionaryRef v9 = [v8 metadata];
  BOOL v10 = [MEMORY[0x263F35048] deviceType];
  BOOL v11 = [v9 valueForKey:v10];

  v39 = v11;
  if (v11) {
    unsigned int v31 = objc_msgSend((id)objc_opt_class(), "BMDeviceBluetoothDeviceTypeFromBTDeviceType:", objc_msgSend(v11, "intValue"));
  }
  else {
    unsigned int v31 = 0;
  }
  id v12 = objc_alloc(MEMORY[0x263F2A070]);
  v38 = [v8 metadata];
  v37 = [MEMORY[0x263F35048] address];
  v41 = [v38 valueForKey:v37];
  v36 = [v8 metadata];
  v35 = [MEMORY[0x263F35048] name];
  v40 = [v36 valueForKey:v35];
  v34 = [v8 metadata];
  v33 = [MEMORY[0x263F35048] productID];
  __int16 v26 = [v34 valueForKey:v33];
  v25 = [NSNumber numberWithBool:v5];
  id v30 = [v8 metadata];
  uint64_t v29 = [MEMORY[0x263F35048] batteryLevelHeadphoneCase];
  v22 = [v30 valueForKey:v29];
  uint64_t v28 = [v8 metadata];
  v27 = [MEMORY[0x263F35048] batteryLevelHeadphoneRight];
  CFNumberRef v20 = [v28 valueForKey:v27];
  objc_super v24 = [v8 metadata];
  long long v23 = [MEMORY[0x263F35048] batteryLevelHeadphoneLeft];
  uint64_t v13 = [v24 valueForKey:v23];
  v21 = [v8 metadata];
  id v14 = [MEMORY[0x263F35048] isAppleAudioDevice];
  id v15 = [v21 valueForKey:v14];
  id v16 = [v8 metadata];

  uint64_t v17 = [MEMORY[0x263F35048] isUserWearing];
  uint64_t v18 = [v16 valueForKey:v17];
  id v32 = (id)[v12 initWithAddress:v41 name:v40 productID:v26 starting:v25 deviceType:v31 batteryLevelHeadphoneCase:v22 batteryLevelHeadphoneRight:v20 batteryLevelHeadphoneLeft:v13 appleAudioDevice:v15 userWearing:v18 vendorID:v7];

  return v32;
}

- (BOOL)_inEarStatusForDevice:(id)a3
{
  return 1;
}

- (void)updateCurrentBatteryLevels
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  CFArrayRef v3 = [(_DKBluetoothMonitor *)self batteryLevels];
  CFArrayRef v4 = (void *)[v3 mutableCopy];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  BOOL v5 = [(_DKBluetoothMonitor *)self batteryLevels];
  long long v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        id v12 = [(_DKBluetoothMonitor *)self batteryLevels];
        uint64_t v13 = [v12 objectForKeyedSubscript:v11];
        id v14 = (void *)[v13 mutableCopy];
        [v4 setValue:v14 forKey:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v8);
  }

  id v15 = [(id)objc_opt_class() audioProductsBatteryLevels];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v16 = objc_msgSend(v15, "allKeys", 0);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * j);
        v22 = [v4 objectForKeyedSubscript:v21];

        if (!v22)
        {
          long long v23 = [MEMORY[0x263EFF9A0] dictionary];
          [v4 setValue:v23 forKey:v21];
        }
        objc_super v24 = [v4 objectForKeyedSubscript:v21];
        v25 = [v15 objectForKeyedSubscript:v21];
        [v24 addEntriesFromDictionary:v25];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v18);
  }

  [(_DKBluetoothMonitor *)self setBatteryLevels:v4];
}

- (void)start
{
  CFArrayRef v3 = (void *)MEMORY[0x263F2B998];
  CFArrayRef v4 = [(_DKMonitor *)self queue];
  [v3 setSharedInstanceQueue:v4];

  id v5 = (id)[MEMORY[0x263F2B998] sharedInstance];
  id v6 = objc_alloc_init(MEMORY[0x263F08A48]);
  uint64_t v7 = [(_DKMonitor *)self queue];
  [v6 setUnderlyingQueue:v7];

  if (!self->_batteryLevelPollingQueue)
  {
    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v9 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.duetknowledge.bluetoothBatteryPollingQueue", v8);
    batteryLevelPollingQueue = self->_batteryLevelPollingQueue;
    self->_batteryLevelPollingQueue = v9;
  }
  if (!self->_batteryLevelPollingTimer)
  {
    uint64_t v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_batteryLevelPollingQueue);
    batteryLevelPollingTimer = self->_batteryLevelPollingTimer;
    self->_batteryLevelPollingTimer = v11;

    uint64_t v13 = self->_batteryLevelPollingTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __28___DKBluetoothMonitor_start__block_invoke;
    handler[3] = &unk_264714788;
    handler[4] = self;
    dispatch_source_set_event_handler(v13, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_batteryLevelPollingTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_activate((dispatch_object_t)self->_batteryLevelPollingTimer);
  }
  id v14 = [(_DKBluetoothMonitor *)self batteryLevels];

  if (!v14) {
    [(_DKBluetoothMonitor *)self setBatteryLevels:MEMORY[0x263EFFA78]];
  }
  id v15 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v16 = *MEMORY[0x263F2B900];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __28___DKBluetoothMonitor_start__block_invoke_2;
  v26[3] = &unk_264714E20;
  v26[4] = self;
  id v17 = (id)[v15 addObserverForName:v16 object:0 queue:v6 usingBlock:v26];

  uint64_t v18 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v19 = *MEMORY[0x263F2B8D0];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __28___DKBluetoothMonitor_start__block_invoke_4;
  v25[3] = &unk_264714E20;
  v25[4] = self;
  id v20 = (id)[v18 addObserverForName:v19 object:0 queue:v6 usingBlock:v25];

  uint64_t v21 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v22 = *MEMORY[0x263F2B910];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __28___DKBluetoothMonitor_start__block_invoke_5;
  v24[3] = &unk_264714E20;
  v24[4] = self;
  id v23 = (id)[v21 addObserverForName:v22 object:0 queue:v6 usingBlock:v24];

  self->_enabled = 1;
}

- (void)stop
{
  self->_enabled = 0;
  [(_DKBluetoothMonitor *)self deactivate];
}

- (void)deactivate
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];
}

+ (id)contextValueForBluetoothConnectionStatus:(BOOL)a3 name:(id)a4 address:(id)a5 deviceType:(int)a6 isAppleAudioDevice:(BOOL)a7 isUserWearing:(BOOL)a8 productID:(unsigned int)a9
{
  BOOL v31 = a8;
  BOOL v9 = a7;
  uint64_t v10 = *(void *)&a6;
  BOOL v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v16 = [NSNumber numberWithBool:v12];
  id v17 = [MEMORY[0x263F351D0] bluetoothConnectionStatusKey];
  uint64_t v18 = [v15 dictionaryWithObject:v16 forKey:v17];

  uint64_t v19 = v13;
  if (v13)
  {
    id v20 = [MEMORY[0x263F351D0] bluetoothNameKey];
    [v18 setObject:v13 forKey:v20];
  }
  if (v14)
  {
    uint64_t v21 = [MEMORY[0x263F351D0] bluetoothAddressKey];
    [v18 setObject:v14 forKey:v21];
  }
  uint64_t v22 = [NSNumber numberWithUnsignedInt:v10];
  id v23 = [MEMORY[0x263F351D0] bluetoothDeviceTypeKey];
  [v18 setObject:v22 forKey:v23];

  objc_super v24 = [NSNumber numberWithBool:v9];
  v25 = [MEMORY[0x263F351D0] bluetoothIsAppleAudioDeviceKey];
  [v18 setObject:v24 forKey:v25];

  long long v26 = [NSNumber numberWithBool:v31];
  long long v27 = [MEMORY[0x263F351D0] bluetoothIsUserWearingKey];
  [v18 setObject:v26 forKeyedSubscript:v27];

  long long v28 = [NSNumber numberWithUnsignedInt:a9];
  long long v29 = [MEMORY[0x263F351D0] bluetoothProductIDKey];
  [v18 setObject:v28 forKey:v29];

  return v18;
}

+ (id)log
{
  if (log_onceToken_2 != -1) {
    dispatch_once(&log_onceToken_2, &__block_literal_global_7);
  }
  v2 = (void *)log_log_2;
  return v2;
}

- (void)saveState
{
  v17[2] = *MEMORY[0x263EF8340];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__4;
  v11[4] = __Block_byref_object_dispose__4;
  activeConnections = self->_activeConnections;
  v16[0] = @"_DKBluetoothMonitor-activeConnections";
  v16[1] = @"_DKBluetoothMonitor-inactiveConnections";
  inactiveConnections = self->_inactiveConnections;
  v17[0] = activeConnections;
  v17[1] = inactiveConnections;
  id v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  id v5 = [(_DKMonitor *)self queue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __32___DKBluetoothMonitor_saveState__block_invoke;
  v10[3] = &unk_264714A90;
  v10[4] = self;
  v10[5] = v11;
  id v6 = v10;
  uint64_t v7 = v5;
  uint64_t v8 = (void *)os_transaction_create();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
  block[3] = &unk_2647148A0;
  id v14 = v8;
  id v15 = v6;
  id v9 = v8;
  dispatch_async(v7, block);

  _Block_object_dispose(v11, 8);
}

- (id)loadState
{
  id v3 = +[_DKBluetoothMonitor log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225002000, v3, OS_LOG_TYPE_INFO, "load state called", buf, 2u);
  }

  *(void *)buf = 0;
  id v9 = buf;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__4;
  id v12 = __Block_byref_object_dispose__4;
  id v13 = 0;
  CFArrayRef v4 = [(_DKMonitor *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32___DKBluetoothMonitor_loadState__block_invoke;
  v7[3] = &unk_264714A68;
  v7[4] = self;
  v7[5] = buf;
  dispatch_sync(v4, v7);

  id v5 = *((id *)v9 + 5);
  _Block_object_dispose(buf, 8);

  return v5;
}

- (void)handleUnpairingEvent:(id)a3
{
  v23[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_DKMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)os_transaction_create();
  uint64_t v7 = [(_DKBluetoothMonitor *)self historicalDeletingHandler];

  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x263F08730];
    id v9 = (void *)MEMORY[0x263F35110];
    uint64_t v10 = [MEMORY[0x263F35148] bluetoothIsConnectedStream];
    uint64_t v11 = [v10 name];
    id v12 = [v9 predicateForEventsWithStreamName:v11];
    v23[0] = v12;
    id v13 = (void *)MEMORY[0x263F35110];
    id v14 = [MEMORY[0x263F35048] address];
    id v15 = [v13 predicateForObjectsWithMetadataKey:v14 andStringValue:v4];
    v23[1] = v15;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
    id v17 = [v8 andPredicateWithSubpredicates:v16];

    uint64_t v18 = [(_DKBluetoothMonitor *)self historicalDeletingHandler];
    ((void (**)(void, void *))v18)[2](v18, v17);
  }
  uint64_t v19 = [(_DKBluetoothMonitor *)self pruner];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __44___DKBluetoothMonitor_handleUnpairingEvent___block_invoke;
  v21[3] = &unk_264714BB8;
  id v22 = v4;
  id v20 = v4;
  [v19 deleteWithPolicy:@"forget-this-device" eventsPassingTest:v21];
}

- (id)historicalDeletingHandler
{
  return self->historicalDeletingHandler;
}

- (void)setHistoricalDeletingHandler:(id)a3
{
}

- (NSMutableDictionary)activeConnections
{
  return self->_activeConnections;
}

- (void)setActiveConnections:(id)a3
{
}

- (NSMutableDictionary)inactiveConnections
{
  return self->_inactiveConnections;
}

- (void)setInactiveConnections:(id)a3
{
}

- (NSMutableDictionary)previousVendorIDs
{
  return self->_previousVendorIDs;
}

- (void)setPreviousVendorIDs:(id)a3
{
}

- (BMPruner)pruner
{
  return self->_pruner;
}

- (void)setPruner:(id)a3
{
}

- (OS_dispatch_queue)batteryLevelPollingQueue
{
  return self->_batteryLevelPollingQueue;
}

- (void)setBatteryLevelPollingQueue:(id)a3
{
}

- (OS_dispatch_source)batteryLevelPollingTimer
{
  return self->_batteryLevelPollingTimer;
}

- (void)setBatteryLevelPollingTimer:(id)a3
{
}

- (NSDictionary)batteryLevels
{
  return (NSDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setBatteryLevels:(id)a3
{
}

- (NSLock)connectionUpdateLock
{
  return self->_connectionUpdateLock;
}

- (void)setConnectionUpdateLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionUpdateLock, 0);
  objc_storeStrong((id *)&self->_batteryLevels, 0);
  objc_storeStrong((id *)&self->_batteryLevelPollingTimer, 0);
  objc_storeStrong((id *)&self->_batteryLevelPollingQueue, 0);
  objc_storeStrong((id *)&self->_pruner, 0);
  objc_storeStrong((id *)&self->_previousVendorIDs, 0);
  objc_storeStrong((id *)&self->_inactiveConnections, 0);
  objc_storeStrong((id *)&self->_activeConnections, 0);
  objc_storeStrong(&self->historicalDeletingHandler, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (void)receiveNotificationEvent:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)receiveNotificationEvent:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134283521;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_225002000, a2, OS_LOG_TYPE_DEBUG, "com.apple.bluetooth.pairing 0x%{private}llx", (uint8_t *)&v2, 0xCu);
}

@end