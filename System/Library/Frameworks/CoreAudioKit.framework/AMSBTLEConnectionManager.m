@interface AMSBTLEConnectionManager
- (AMSBTLEConnectionManager)initWithUIController:(id)a3;
- (BOOL)isLECapableHardware;
- (BOOL)peripheralIsConnectedCentral:(id)a3;
- (NSMutableArray)peripheralList;
- (id)amsPeripheralForCBPeripheral:(id)a3;
- (int64_t)bluetoothState;
- (unsigned)midiDeviceForUUID:(id)a3;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)checkAlreadyConnectedPeripherals;
- (void)createPeripheralList;
- (void)dealloc;
- (void)killTimer;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)removeAMSPeripheralForCBPeripheral:(id)a3;
- (void)setUIController:(id)a3;
- (void)startScan;
- (void)startTimer;
- (void)stopScan;
- (void)timerFired:(id)a3;
- (void)updateAdvertisingState:(id)a3;
@end

@implementation AMSBTLEConnectionManager

- (AMSBTLEConnectionManager)initWithUIController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AMSBTLEConnectionManager;
  v4 = [(AMSBTLEConnectionManager *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->controller = (BTLEConnectionTable *)a3;
    v6 = (CBCentralManager *)[objc_alloc(MEMORY[0x263EFEF00]) initWithDelegate:v4 queue:0];
    v5->centralManager = v6;
    v5->centralState = [(CBCentralManager *)v6 state];
    v5->peripheralList = (NSMutableArray *)objc_opt_new();
    v5->connectedBTPeripherals = (NSMutableArray *)objc_opt_new();
    v5->connectedAMSPeripherals = (NSMutableArray *)objc_opt_new();
    [(AMSBTLEConnectionManager *)v5 createPeripheralList];
    [(AMSBTLEConnectionManager *)v5 startTimer];
    if (!gNotificationClient) {
      MIDIClientCreate(&stru_26CF7B700, (MIDINotifyProc)NotifyProc, v5, (MIDIClientRef *)&gNotificationClient);
    }
    v7 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v5 selector:sel_updateAdvertisingState_ name:kAdvertisementNotification object:0];
  }
  return v5;
}

- (void)dealloc
{
  if (gNotificationClient)
  {
    MIDIClientDispose(gNotificationClient);
    gNotificationClient = 0;
  }
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:kAdvertisementNotification];

  self->peripheralList = 0;
  centralManager = self->centralManager;
  if (centralManager)
  {

    self->centralManager = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AMSBTLEConnectionManager;
  [(AMSBTLEConnectionManager *)&v5 dealloc];
}

- (void)updateAdvertisingState:(id)a3
{
  self->isAdvertising = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"isAdvertising"), "BOOLValue");
}

- (void)setUIController:(id)a3
{
  self->controller = (BTLEConnectionTable *)a3;
}

- (void)createPeripheralList
{
  ItemCount v3 = MIDIGetNumberOfDevices();
  if (v3)
  {
    ItemCount v4 = v3;
    ItemCount v5 = 0;
    CFStringRef v6 = (const __CFString *)*MEMORY[0x263F00B70];
    CFStringRef propertyID = (const __CFString *)*MEMORY[0x263F00B78];
    CFStringRef v7 = (const __CFString *)*MEMORY[0x263F00B80];
    do
    {
      uint64_t v8 = MIDIGetDevice(v5);
      if (v8)
      {
        uint64_t v9 = v8;
        CFStringRef str = 0;
        MIDIObjectGetStringProperty(v8, v6, &str);
        if (str)
        {
          if (CFEqual(str, @"com.apple.AppleMIDIBluetoothDriver"))
          {
            CFRelease(str);
            SInt32 outValue = 0;
            if (([MEMORY[0x263F00B68] deviceIsNullDevice:v9] & 1) == 0
              && ([MEMORY[0x263F00B68] deviceIsLocalPeripheral:v9] & 1) == 0)
            {
              CFStringRef v16 = 0;
              MIDIObjectGetStringProperty(v9, @"BLE MIDI Device UUID", &v16);
              if (v16)
              {
                CFStringRef v15 = 0;
                MIDIObjectGetStringProperty(v9, propertyID, &v15);
                MIDIObjectGetIntegerProperty(v9, v7, &outValue);
                v10 = [AMSBTLEPeripheral alloc];
                v11 = [(AMSBTLEPeripheral *)v10 initWithID:v16 name:v15 manager:self->centralManager];
                CFRelease(v16);
                CFRelease(v15);
                *(void *)v14 = 0;
                MIDIObjectGetIntegerProperty(v9, @"MIDI Input Supported", &v14[1]);
                MIDIObjectGetIntegerProperty(v9, @"MIDI Output Supported", v14);
                [(AMSBTLEPeripheral *)v11 setInputAvailable:v14[1] != 0];
                [(AMSBTLEPeripheral *)v11 setOutputAvailable:v14[0] != 0];
                [(AMSBTLEPeripheral *)v11 setOnline:outValue == 0];
                [(AMSBTLEPeripheral *)v11 updateAvailableStateChanged];
                controller = self->controller;
                objc_sync_enter(controller);
                [(NSMutableArray *)self->peripheralList addObject:v11];
                objc_sync_exit(controller);
              }
            }
          }
          else if (str)
          {
            CFRelease(str);
          }
        }
      }
      ++v5;
    }
    while (v4 != v5);
  }
  [(BTLEConnectionTable *)self->controller updatePeripheralTable];
}

- (void)checkAlreadyConnectedPeripherals
{
  v32[1] = *MEMORY[0x263EF8340];
  if (!self->isAdvertising)
  {
    ItemCount v3 = objc_opt_new();
    centralManager = self->centralManager;
    v32[0] = [MEMORY[0x263EFEF88] UUIDWithString:@"03B80E5A-EDE8-4B33-A751-6CE34EC4C700"];
    ItemCount v5 = -[CBCentralManager retrieveConnectedPeripheralsWithServices:](centralManager, "retrieveConnectedPeripheralsWithServices:", [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v27 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend(MEMORY[0x263F00B68], "midiDeviceForUUID:", objc_msgSend((id)objc_msgSend(v9, "identifier"), "UUIDString"));
          if (v10 && ![MEMORY[0x263F00B68] deviceIsOnline:v10]
            || !objc_msgSend(MEMORY[0x263F00B68], "midiDeviceForUUID:", objc_msgSend((id)objc_msgSend(v9, "identifier", v10), "UUIDString")))
          {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v6);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v11 = [v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (!v11)
    {

      return;
    }
    char v12 = 0;
    uint64_t v13 = *(void *)v23;
    while (1)
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v3);
        }
        CFStringRef v15 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        uint64_t v16 = objc_msgSend(MEMORY[0x263F00B68], "midiDeviceForUUID:", objc_msgSend((id)objc_msgSend(v15, "identifier"), "UUIDString"));
        if (v16) {
          uint64_t v17 = [MEMORY[0x263F00B68] nameForMIDIDevice:v16];
        }
        else {
          uint64_t v17 = objc_msgSend(v15, "name", v16);
        }
        uint64_t v18 = v17;
        id v19 = [(AMSBTLEConnectionManager *)self amsPeripheralForCBPeripheral:v15];
        if (v19)
        {
          objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "date"), "timeIntervalSince1970");
          objc_msgSend(v19, "setLastSeen:");
          if (![v19 updateAvailableStateChanged]) {
            continue;
          }
          NSLog(&cfstr_PeripheralIsav.isa, [v19 isAvailable]);
        }
        else
        {
          NSLog(&cfstr_RetrievedANewM.isa, v18, objc_msgSend((id)objc_msgSend(v15, "identifier"), "UUIDString"));
          v20 = -[AMSBTLEPeripheral initWithID:name:manager:]([AMSBTLEPeripheral alloc], "initWithID:name:manager:", objc_msgSend((id)objc_msgSend(v15, "identifier"), "UUIDString"), v18, self->centralManager);
          objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "date"), "timeIntervalSince1970");
          -[AMSBTLEPeripheral setLastSeen:](v20, "setLastSeen:");
          [(AMSBTLEPeripheral *)v20 updateAvailableStateChanged];
          controller = self->controller;
          objc_sync_enter(controller);
          [(NSMutableArray *)self->peripheralList addObject:v20];
          objc_sync_exit(controller);
        }
        char v12 = 1;
      }
      uint64_t v11 = [v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (!v11)
      {

        if (v12) {
          [(BTLEConnectionTable *)self->controller updatePeripheralTable];
        }
        return;
      }
    }
  }
}

- (void)timerFired:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [(AMSBTLEConnectionManager *)self checkAlreadyConnectedPeripherals];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "date"), "timeIntervalSince1970");
  double v5 = v4;
  uint64_t v6 = (void *)[(NSMutableArray *)self->peripheralList copy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    int v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        [v11 lastSeen];
        if (v5 - v12 <= 7.0
          || -[AMSBTLEConnectionManager midiDeviceForUUID:](self, "midiDeviceForUUID:", [v11 uuid]))
        {
          v8 |= [v11 updateAvailableStateChanged];
        }
        else
        {
          controller = self->controller;
          objc_sync_enter(controller);
          [v11 setOnline:0];
          [(NSMutableArray *)self->peripheralList removeObject:v11];
          objc_sync_exit(controller);
          int v8 = 1;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v14 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v7 = v14;
    }
    while (v14);
    if (v8) {
      [(BTLEConnectionTable *)self->controller updatePeripheralTable];
    }
  }
}

- (BOOL)isLECapableHardware
{
  uint64_t v2 = [(CBCentralManager *)self->centralManager state];
  BOOL v3 = 1;
  double v4 = @"Bluetooth is powered on and LE capable.";
  double v5 = @"The platform/hardware doesn't support Bluetooth Low Energy.";
  switch(v2)
  {
    case 2:
      goto LABEL_5;
    case 3:
      double v5 = @"The app is not authorized to use Bluetooth Low Energy.";
      goto LABEL_5;
    case 4:
      double v5 = @"Bluetooth is currently powered off.";
LABEL_5:
      BOOL v3 = 0;
      double v4 = v5;
      goto LABEL_6;
    case 5:
LABEL_6:
      NSLog(&cfstr_CentralManager.isa, v4);
      break;
    default:
      BOOL v3 = 0;
      break;
  }
  return v3;
}

- (int64_t)bluetoothState
{
  return [(CBCentralManager *)self->centralManager state];
}

- (void)startScan
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263EFED50];
  v6[0] = MEMORY[0x263EFFA88];
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  NSLog(&cfstr_ScanningForMid.isa, "03B80E5A-EDE8-4B33-A751-6CE34EC4C700");
  uint64_t v4 = [MEMORY[0x263EFEF88] UUIDWithString:@"03B80E5A-EDE8-4B33-A751-6CE34EC4C700"];
  -[CBCentralManager scanForPeripheralsWithServices:options:](self->centralManager, "scanForPeripheralsWithServices:options:", [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:1], v3);
}

- (void)stopScan
{
}

- (void)killTimer
{
  refreshTimer = self->refreshTimer;
  if (refreshTimer)
  {
    [(NSTimer *)refreshTimer invalidate];

    self->refreshTimer = 0;
  }
  connectionTimer = self->connectionTimer;
  if (connectionTimer)
  {
    [(NSTimer *)connectionTimer invalidate];

    self->connectionTimer = 0;
  }
}

- (void)startTimer
{
  if (!self->refreshTimer)
  {
    id v3 = objc_alloc(MEMORY[0x263EFFA20]);
    self->refreshTimer = (NSTimer *)objc_msgSend(v3, "initWithFireDate:interval:target:selector:userInfo:repeats:", objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceNow:", 1.0), self, sel_timerFired_, 0, 1, 1.0);
    uint64_t v4 = (void *)[MEMORY[0x263EFF9F0] currentRunLoop];
    [v4 addTimer:self->refreshTimer forMode:*MEMORY[0x263EFF588]];
    [(NSTimer *)self->refreshTimer setTolerance:0.1];
  }
  if (!self->connectionTimer)
  {
    id v5 = objc_alloc(MEMORY[0x263EFFA20]);
    self->connectionTimer = (NSTimer *)objc_msgSend(v5, "initWithFireDate:interval:target:selector:userInfo:repeats:", objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceNow:", 5.0), self, sel_connectionTimerFired_, 0, 1, 5.0);
    uint64_t v6 = (void *)[MEMORY[0x263EFF9F0] currentRunLoop];
    [v6 addTimer:self->connectionTimer forMode:*MEMORY[0x263EFF588]];
    connectionTimer = self->connectionTimer;
    [(NSTimer *)connectionTimer setTolerance:0.25];
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  if (self->centralManager != a3) {
    return;
  }
  int64_t v4 = [a3 state];
  if (v4 == self->centralState) {
    return;
  }
  self->centralState = v4;
  if (v4)
  {
    if (v4 == 5)
    {
      [(BTLEConnectionTable *)self->controller setUIEnabled:1];
      [(AMSBTLEConnectionManager *)self startScan];
      return;
    }
    controller = self->controller;
    uint64_t v6 = 0;
  }
  else
  {
    controller = self->controller;
    uint64_t v6 = 1;
  }

  [(BTLEConnectionTable *)controller setUIEnabled:v6];
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  if ([(AMSBTLEConnectionManager *)self peripheralIsConnectedCentral:a4]) {
    return;
  }
  uint64_t v9 = [a5 objectForKeyedSubscript:*MEMORY[0x263EFECB0]];
  uint64_t v10 = v9;
  if (!v9) {
    uint64_t v10 = [a4 name];
  }
  id v11 = [(AMSBTLEConnectionManager *)self amsPeripheralForCBPeripheral:a4];
  if (v11)
  {
    double v12 = v11;
    uint64_t v13 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x263EFECD8]];
    if (objc_msgSend(v13, "containsObject:", objc_msgSend(MEMORY[0x263EFEF88], "UUIDWithString:", @"03B80E5A-EDE8-4B33-A751-6CE34EC4C700"))&& (objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "date"), "timeIntervalSince1970"), objc_msgSend(v12, "setLastSeen:"), objc_msgSend(v12, "updateAvailableStateChanged")))
    {
      NSLog(&cfstr_PeripheralIsav_0.isa, [v12 isAvailable]);
      int v14 = 1;
      if (!v9) {
        goto LABEL_12;
      }
    }
    else
    {
      int v14 = 0;
      if (!v9) {
        goto LABEL_12;
      }
    }
    if ((objc_msgSend((id)objc_msgSend(v12, "name"), "isEqualToString:", v10) & 1) == 0)
    {
      [v12 setName:v10];
LABEL_16:
      p_controller = &self->controller;
      goto LABEL_17;
    }
LABEL_12:
    if (!v14) {
      return;
    }
    goto LABEL_16;
  }
  NSLog(&cfstr_DiscoveredANew.isa, v10, objc_msgSend((id)objc_msgSend(a4, "identifier"), "UUIDString"));
  long long v15 = -[AMSBTLEPeripheral initWithID:name:manager:]([AMSBTLEPeripheral alloc], "initWithID:name:manager:", objc_msgSend((id)objc_msgSend(a4, "identifier"), "UUIDString"), v10, self->centralManager);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "date"), "timeIntervalSince1970");
  -[AMSBTLEPeripheral setLastSeen:](v15, "setLastSeen:");
  [(AMSBTLEPeripheral *)v15 updateAvailableStateChanged];
  controller = self->controller;
  p_controller = &self->controller;
  objc_sync_enter(controller);
  [(BTLEConnectionTable *)*(p_controller - 5) addObject:v15];
  objc_sync_exit(controller);

LABEL_17:
  long long v18 = *p_controller;

  [(BTLEConnectionTable *)v18 updatePeripheralTable];
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (self->centralManager == a3)
  {
    id v6 = [(AMSBTLEConnectionManager *)self amsPeripheralForCBPeripheral:a4];
    if (v6)
    {
      uint64_t v7 = v6;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      connectedAMSPeripherals = self->connectedAMSPeripherals;
      uint64_t v9 = [(NSMutableArray *)connectedAMSPeripherals countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(connectedAMSPeripherals);
            }
            uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v13, "uuid"), "isEqualToString:", objc_msgSend(v7, "uuid")))
            {
              [(NSMutableArray *)self->connectedAMSPeripherals removeObject:v13];
              goto LABEL_13;
            }
          }
          uint64_t v10 = [(NSMutableArray *)connectedAMSPeripherals countByEnumeratingWithState:&v14 objects:v19 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_13:
      [(NSMutableArray *)self->connectedAMSPeripherals addObject:v7];
      if (([(NSMutableArray *)self->connectedBTPeripherals containsObject:a4] & 1) == 0) {
        [(NSMutableArray *)self->connectedBTPeripherals addObject:a4];
      }
      [a4 setDelegate:self];
      uint64_t v18 = [MEMORY[0x263EFEF88] UUIDWithString:@"03B80E5A-EDE8-4B33-A751-6CE34EC4C700"];
      objc_msgSend(a4, "discoverServices:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v18, 1));
    }
    else
    {
      NSLog(&cfstr_StoredPeripher.isa);
    }
  }
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->centralManager == a3)
  {
    if (a5) {
      NSLog(&cfstr_Centralmanager.isa, a2, a5);
    }
    [a4 setDelegate:0];
    [(NSMutableArray *)self->connectedBTPeripherals removeObject:a4];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    connectedAMSPeripherals = self->connectedAMSPeripherals;
    uint64_t v8 = [(NSMutableArray *)connectedAMSPeripherals countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(connectedAMSPeripherals);
          }
          double v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v12, "uuid"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a4, "identifier"), "UUIDString")))
          {
            [(NSMutableArray *)self->connectedAMSPeripherals removeObject:v12];
            return;
          }
        }
        uint64_t v9 = [(NSMutableArray *)connectedAMSPeripherals countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  NSLog(&cfstr_ErrorFailedToC.isa, a4, objc_msgSend(a5, "localizedDescription", a3));
  if (a4)
  {
    [a4 setDelegate:0];
  }
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a4)
  {
    NSLog(&cfstr_PeripheralDidd.isa, a2, a4);
    centralManager = self->centralManager;
    [(CBCentralManager *)centralManager cancelPeripheralConnection:a3];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = (void *)[a3 services];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (!v8) {
      goto LABEL_15;
    }
    uint64_t v9 = v8;
    long long v15 = self;
    char v10 = 0;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v14 = (void *)[v13 UUID];
        if (objc_msgSend(v14, "isEqual:", objc_msgSend(MEMORY[0x263EFEF88], "UUIDWithString:", @"03B80E5A-EDE8-4B33-A751-6CE34EC4C700")))
        {
          [a3 discoverCharacteristics:0 forService:v13];
          char v10 = 1;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
    self = v15;
    if ((v10 & 1) == 0)
    {
LABEL_15:
      NSLog(&cfstr_MidiServiceNot.isa, objc_msgSend((id)objc_msgSend(a3, "identifier"), "UUIDString"));
      [(CBCentralManager *)self->centralManager cancelPeripheralConnection:a3];
    }
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v9 = -[AMSBTLEConnectionManager amsPeripheralForCBPeripheral:](self, "amsPeripheralForCBPeripheral:");
  if (a5 || !v9)
  {
    if (a5) {
      NSLog(&cfstr_PeripheralDidd_0.isa, a5);
    }
    centralManager = self->centralManager;
    [(CBCentralManager *)centralManager cancelPeripheralConnection:a3];
  }
  else
  {
    char v10 = (void *)[a4 UUID];
    if (objc_msgSend(v10, "isEqual:", objc_msgSend(MEMORY[0x263EFEF88], "UUIDWithString:", @"03B80E5A-EDE8-4B33-A751-6CE34EC4C700")))
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v11 = (void *)[a4 characteristics];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            long long v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            long long v17 = (void *)[v16 UUID];
            if (objc_msgSend(v17, "isEqual:", objc_msgSend(MEMORY[0x263EFEF88], "UUIDWithString:", @"7772E5DB-3868-4112-A1A9-F2669D106BF3")))
            {
              if (([v16 properties] & 2) != 0)
              {
                NSLog(&cfstr_CheckingPairin.isa);
                [a3 readValueForCharacteristic:v16];
              }
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v13);
      }
    }
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v8 = (void *)[a4 UUID];
  if (objc_msgSend(v8, "isEqual:", objc_msgSend(MEMORY[0x263EFEF88], "UUIDWithString:", @"7772E5DB-3868-4112-A1A9-F2669D106BF3")))
  {
    if (a5)
    {
      NSLog(&cfstr_ErrorEncounter.isa, a5);
      centralManager = self->centralManager;
      [(CBCentralManager *)centralManager cancelPeripheralConnection:a3];
    }
    else
    {
      NSLog(&cfstr_PairingAuthent.isa);
      id v10 = [(AMSBTLEConnectionManager *)self amsPeripheralForCBPeripheral:a3];
      if (([v10 isOnline] & 1) == 0)
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        connectedAMSPeripherals = self->connectedAMSPeripherals;
        uint64_t v12 = [(NSMutableArray *)connectedAMSPeripherals countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v22;
          while (2)
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v22 != v14) {
                objc_enumerationMutation(connectedAMSPeripherals);
              }
              long long v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              if (objc_msgSend((id)objc_msgSend(v16, "uuid"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a3, "identifier"), "UUIDString")))
              {
                id v10 = v16;
                goto LABEL_17;
              }
            }
            uint64_t v13 = [(NSMutableArray *)connectedAMSPeripherals countByEnumeratingWithState:&v21 objects:v25 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
LABEL_17:
        MIDIObjectRef v17 = [MEMORY[0x263F00B68] nullDevice];
        if (v17)
        {
          if (v10)
          {
            MIDIObjectRef v18 = v17;
            id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            objc_msgSend(v19, "setValue:forKey:", objc_msgSend((id)objc_msgSend(a3, "identifier"), "UUIDString"), @"BLE MIDI Device UUID");
            uint64_t v20 = [v10 name];
            [v19 setValue:v20 forKey:*MEMORY[0x263F00B78]];
            [v19 setValue:&unk_26CF84DE0 forKey:@"MIDI Local Peripheral"];
            [v19 setValue:&unk_26CF84DF8 forKey:@"MIDI Remote Peripheral"];
            if ([(AMSBTLEConnectionManager *)self peripheralIsConnectedCentral:a3])
            {
              NSLog(&cfstr_AlreadyActingA.isa);
            }
            else
            {
              NSLog(&cfstr_InstructingThe.isa, objc_msgSend((id)objc_msgSend(a3, "identifier"), "UUIDString"));
              MIDIObjectSetDictionaryProperty(v18, @"BLE MIDI Remote Peripheral", (CFDictionaryRef)v19);
              sleep(1u);
              NSLog(&cfstr_DisconnectingF.isa, a3);
              [(CBCentralManager *)self->centralManager cancelPeripheralConnection:a3];
            }
          }
          else
          {
            NSLog(&cfstr_CouldNotLocate.isa);
          }
        }
        else
        {
          NSLog(&cfstr_CouldNotCommun.isa);
        }
      }
    }
  }
}

- (id)amsPeripheralForCBPeripheral:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "identifier"), "UUIDString");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  peripheralList = self->peripheralList;
  uint64_t v6 = [(NSMutableArray *)peripheralList countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_4:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(peripheralList);
    }
    id v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if (objc_msgSend((id)objc_msgSend(v10, "uuid"), "isEqualToString:", v4)) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [(NSMutableArray *)peripheralList countByEnumeratingWithState:&v12 objects:v16 count:16];
      id v10 = 0;
      if (v7) {
        goto LABEL_4;
      }
      return v10;
    }
  }
}

- (void)removeAMSPeripheralForCBPeripheral:(id)a3
{
  NSLog(&cfstr_Removeamsperip.isa, a2, a3);
  id v5 = [(AMSBTLEConnectionManager *)self amsPeripheralForCBPeripheral:a3];
  if (v5)
  {
    id v6 = v5;
    controller = self->controller;
    objc_sync_enter(controller);
    [(NSMutableArray *)self->peripheralList removeObject:v6];
    objc_sync_exit(controller);
    uint64_t v8 = self->controller;
    [(BTLEConnectionTable *)v8 updatePeripheralTable];
  }
}

- (unsigned)midiDeviceForUUID:(id)a3
{
  if (a3)
  {
    ItemCount v4 = MIDIGetNumberOfDevices();
    if (v4)
    {
      ItemCount v5 = v4;
      ItemCount v6 = 0;
      CFStringRef v7 = (const __CFString *)*MEMORY[0x263F00B70];
      do
      {
        uint64_t v8 = MIDIGetDevice(v6);
        if (v8)
        {
          uint64_t v9 = v8;
          CFStringRef str = 0;
          MIDIObjectGetStringProperty(v8, v7, &str);
          if (str)
          {
            if (CFEqual(str, @"com.apple.AppleMIDIBluetoothDriver"))
            {
              CFRelease(str);
              if (([MEMORY[0x263F00B68] deviceIsNullDevice:v9] & 1) == 0
                && ([MEMORY[0x263F00B68] deviceIsLocalPeripheral:v9] & 1) == 0)
              {
                CFTypeRef cf1 = 0;
                MIDIObjectGetStringProperty(v9, @"BLE MIDI Device UUID", (CFStringRef *)&cf1);
                if (cf1)
                {
                  int v10 = CFEqual(cf1, a3);
                  CFRelease(cf1);
                  if (v10) {
                    return v9;
                  }
                }
              }
            }
            else if (str)
            {
              CFRelease(str);
            }
          }
        }
        ++v6;
      }
      while (v5 != v6);
    }
  }
  LODWORD(v9) = 0;
  return v9;
}

- (BOOL)peripheralIsConnectedCentral:(id)a3
{
  MIDIObjectRef v4 = [MEMORY[0x263F00B68] localPeripheral];
  CFStringRef str = 0;
  if (!v4) {
    return 0;
  }
  MIDIObjectGetStringProperty(v4, @"BLE MIDI Device UUID", &str);
  if (!str) {
    return 0;
  }
  ItemCount v5 = objc_msgSend((id)objc_msgSend(a3, "identifier"), "UUIDString");
  char v6 = [v5 isEqualToString:str];
  CFRelease(str);
  return v6;
}

- (NSMutableArray)peripheralList
{
  return self->peripheralList;
}

@end