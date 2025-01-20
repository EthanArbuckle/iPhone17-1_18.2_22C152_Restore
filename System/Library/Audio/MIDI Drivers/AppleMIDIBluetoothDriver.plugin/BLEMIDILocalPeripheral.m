@interface BLEMIDILocalPeripheral
- (BLEMIDIDevice)bleDevice;
- (BLEMIDILocalPeripheral)init;
- (BLEMIDILocalPeripheral)initWithDriver:(MIDIDriverInterface *)a3;
- (BLEMIDILocalPeripheral)peripheralWithUUID:(id)a3;
- (BOOL)isAlreadyConnectedAsPeripheral:(id)a3;
- (BOOL)isLECapableHardware;
- (CBMutableCharacteristic)midiChar;
- (CBMutableService)midiService;
- (CBPeripheralManager)peripheralManager;
- (MIDIDriverInterface)driver;
- (id)connectedCentralUUID;
- (id)subscribedCentral;
- (void)activateConnectedUUID;
- (void)activateUUID:(id)a3;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)checkAddMIDIService;
- (void)connectDevice:(unsigned int)a3;
- (void)dealloc;
- (void)disconnectDevice:(unsigned int)a3;
- (void)enqueue:(id)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheralManager:(id)a3 _didReceiveWriteRequests:(id)a4;
- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5;
- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5;
- (void)peripheralManager:(id)a3 didAddService:(id)a4 error:(id)a5;
- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4;
- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4;
- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)peripheralManagerIsReadyToUpdateSubscribers:(id)a3;
- (void)removeMIDIService;
- (void)resetDevice:(unsigned int)a3;
- (void)sendIfReady;
@end

@implementation BLEMIDILocalPeripheral

- (BLEMIDILocalPeripheral)init
{
  sub_9850();
  v2 = qword_1DDC8;
  if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "BTLEMIDILocalPeripheral.mm";
    __int16 v6 = 1024;
    int v7 = 38;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: Do not use init. Use initWithDriver instead.", (uint8_t *)&v4, 0x12u);
  }
  return 0;
}

- (BLEMIDILocalPeripheral)initWithDriver:(MIDIDriverInterface *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BLEMIDILocalPeripheral;
  int v4 = [(BLEMIDILocalPeripheral *)&v8 init];
  if (v4)
  {
    v4->peripheralManager = (CBPeripheralManager *)objc_msgSend(objc_alloc((Class)CBPeripheralManager), "initWithDelegate:queue:options:", v4, 0, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), CBPeripheralManagerOptionShowPowerAlertKey, 0));
    id v5 = objc_alloc((Class)CBCentralManager);
    __int16 v6 = +[NSNumber numberWithBool:0];
    v4->centralManager = (CBCentralManager *)objc_msgSend(v5, "initWithDelegate:queue:options:", v4, 0, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v6, CBCentralManagerOptionReceiveSystemEvents, +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), CBCentralManagerOptionShowPowerAlertKey, 0));
    v4->driver = a3;
    v4->commandQueue = (OS_dispatch_queue *)dispatch_queue_create("BLEMIDILocalPeripheral_CommandQueue", 0);
    v4->outgoingPackets = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    v4->readyToSend = 1;
  }
  return v4;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->commandQueue);

  [(CBCentralManager *)self->centralManager setDelegate:0];
  [(CBPeripheralManager *)self->peripheralManager setDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)BLEMIDILocalPeripheral;
  [(BLEMIDILocalPeripheral *)&v3 dealloc];
}

- (BOOL)isLECapableHardware
{
  unint64_t v2 = (unint64_t)[(CBPeripheralManager *)self->peripheralManager state];
  return v2 < 6 && (v2 & 0x3F) == 5;
}

- (id)subscribedCentral
{
  id result = self->midiChar;
  if (result)
  {
    if (objc_msgSend(objc_msgSend(result, "subscribedCentrals"), "count") == (char *)&dword_0 + 1)
    {
      int v4 = [(CBMutableCharacteristic *)self->midiChar subscribedCentrals];
      return [(NSArray *)v4 objectAtIndex:0];
    }
    else
    {
      return self->connectedCentral;
    }
  }
  return result;
}

- (id)connectedCentralUUID
{
  id v2 = objc_msgSend(-[BLEMIDILocalPeripheral subscribedCentral](self, "subscribedCentral"), "identifier");

  return [v2 UUIDString];
}

- (void)activateConnectedUUID
{
  id v3 = [(BLEMIDILocalPeripheral *)self subscribedCentral];
  if (v3)
  {
    id v4 = objc_msgSend(objc_msgSend(v3, "identifier"), "UUIDString");
    [(BLEMIDILocalPeripheral *)self activateUUID:v4];
  }
}

- (void)activateUUID:(id)a3
{
  unsigned int v5 = +[BLEMIDIAccessor localPeripheral];
  CFStringRef str = 0;
  HIDWORD(obj) = 0;
  if (!v5)
  {
    if (!self->connectedCentral)
    {
      id v9 = [(BLEMIDILocalPeripheral *)self subscribedCentral];
      if (!v9)
      {
        sub_9850();
        uint64_t v12 = qword_1DDC8;
        if (!os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_ERROR)) {
          return;
        }
        *(_DWORD *)buf = 136315650;
        v33 = "BTLEMIDILocalPeripheral.mm";
        __int16 v34 = 1024;
        int v35 = 160;
        __int16 v36 = 2112;
        *(void *)v37 = a3;
        v13 = "%25s:%-5d Received a request to activate connected central with UUID %@, but there is no subscribed central.";
        v14 = v12;
        uint32_t v15 = 28;
        goto LABEL_34;
      }
      self->connectedCentral = (CBCentral *)v9;
    }
    unint64_t v10 = (unint64_t)+[BLEMIDIAccessor midiDeviceForUUID:a3 isLocalPeripheral:1 isRemotePeripheral:0];
    if (v10)
    {
      if (+[BLEMIDIAccessor deviceIsOnline:v10]) {
        return;
      }
LABEL_16:
      -[BLEMIDILocalPeripheral connectDevice:](self, "connectDevice:", v10, obj);
      return;
    }
    id v11 = +[BLEMIDIAccessor midiDeviceForUUID:a3];
    LODWORD(obj) = v11;
    if (v11)
    {
      unint64_t v10 = (unint64_t)v11;
      [(BLEMIDILocalPeripheral *)self resetDevice:v11];
      goto LABEL_16;
    }
    sub_9850();
    v16 = qword_1DDC8;
    if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v33 = "BTLEMIDILocalPeripheral.mm";
      __int16 v34 = 1024;
      int v35 = 180;
      __int16 v36 = 2112;
      *(void *)v37 = a3;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "%25s:%-5d Received a request to activate connected central with UUID %@. This will create a new MIDI device.", buf, 0x1Cu);
    }
    driver = self->driver;
    v18 = sub_10118();
    v19 = sub_10100();
    v20 = sub_1010C();
    OSStatus v21 = MIDIDeviceCreate(driver, v18, v19, v20, (MIDIDeviceRef *)&obj);
    sub_9850();
    v22 = qword_1DDC8;
    if (v21)
    {
      if (!os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_DWORD *)buf = 136315650;
      v33 = "BTLEMIDILocalPeripheral.mm";
      __int16 v34 = 1024;
      int v35 = 184;
      __int16 v36 = 1024;
      *(_DWORD *)v37 = v21;
      v13 = "%25s:%-5d ERROR: %d creating local peripheral device.";
      v14 = v22;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_INFO))
      {
        connectedCentral = self->connectedCentral;
        *(_DWORD *)buf = 136315906;
        v33 = "BTLEMIDILocalPeripheral.mm";
        __int16 v34 = 1024;
        int v35 = 188;
        __int16 v36 = 1024;
        *(_DWORD *)v37 = obj;
        *(_WORD *)&v37[4] = 2112;
        *(void *)&v37[6] = connectedCentral;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "%25s:%-5d Remote central device connected with MIDIDeviceRef %u, %@", buf, 0x22u);
      }
      MIDIObjectSetStringProperty(obj, @"BLE MIDI Device UUID", (CFStringRef)a3);
      v24 = [(BLEMIDILocalPeripheral *)self peripheralWithUUID:a3];
      if (v24)
      {
        v25 = v24;
        self->connectedPeripheral = (CBPeripheral *)v24;
        sub_9850();
        v26 = qword_1DDC8;
        if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v33 = "BTLEMIDILocalPeripheral.mm";
          __int16 v34 = 1024;
          int v35 = 196;
          __int16 v36 = 2112;
          *(void *)v37 = a3;
          _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "%25s:%-5d [device info] connectPeripheral: UUID %@", buf, 0x1Cu);
        }
        -[CBCentralManager connectPeripheral:options:](self->centralManager, "connectPeripheral:options:", v25, 0, obj);
      }
      OSStatus v27 = MIDISetupAddDevice(obj);
      if (!v27)
      {
        unint64_t v10 = obj;
        goto LABEL_16;
      }
      OSStatus v28 = v27;
      sub_9850();
      uint64_t v29 = qword_1DDC8;
      if (!os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_DWORD *)buf = 136315650;
      v33 = "BTLEMIDILocalPeripheral.mm";
      __int16 v34 = 1024;
      int v35 = 202;
      __int16 v36 = 1024;
      *(_DWORD *)v37 = v28;
      v13 = "%25s:%-5d ERROR: %d adding remote central device";
      v14 = v29;
    }
    uint32_t v15 = 24;
LABEL_34:
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    return;
  }
  MIDIObjectRef v6 = v5;
  sub_9850();
  int v7 = qword_1DDC8;
  if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v33 = "BTLEMIDILocalPeripheral.mm";
    __int16 v34 = 1024;
    int v35 = 145;
    __int16 v36 = 2112;
    *(void *)v37 = a3;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Received a request to activate connected central with UUID %@, but there is an online local peripheral. Please file a bug report for CoreMIDI.", buf, 0x1Cu);
  }
  MIDIObjectGetStringProperty(v6, @"BLE MIDI Device UUID", &str);
  MIDIObjectGetIntegerProperty(v6, kMIDIPropertyOffline, (SInt32 *)&obj + 1);
  if (str)
  {
    sub_9850();
    objc_super v8 = qword_1DDC8;
    if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v33 = "BTLEMIDILocalPeripheral.mm";
      __int16 v34 = 1024;
      int v35 = 149;
      __int16 v36 = 2112;
      *(void *)v37 = str;
      *(_WORD *)&v37[8] = 1024;
      *(_DWORD *)&v37[10] = HIDWORD(obj);
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Local peripheral UUID: %@ Offline: %d", buf, 0x22u);
    }
    CFRelease(str);
  }
}

- (void)connectDevice:(unsigned int)a3
{
  if (self->connectedCentral)
  {
    uint64_t v3 = *(void *)&a3;
    MIDIObjectSetIntegerProperty(a3, @"MIDI Local Peripheral", 1);
    MIDIObjectSetIntegerProperty(v3, @"MIDI Remote Peripheral", 0);
    MIDIObjectSetIntegerProperty(v3, @"MIDI Input Supported", 1);
    MIDIObjectSetIntegerProperty(v3, @"MIDI Output Supported", 1);
    MIDIObjectSetIntegerProperty(v3, kMIDIPropertyOffline, 1);
    MIDIEntityRef Entity = MIDIDeviceGetEntity(v3, 0);
    newMIDIEntityRef Entity = Entity;
    if (Entity)
    {
      MIDIEntityAddOrRemoveEndpoints(Entity, 1uLL, 1uLL);
    }
    else
    {
      int v7 = sub_10124();
      MIDIDeviceAddEntity(v3, v7, 1u, 1uLL, 1uLL, &newEntity);
    }
    bleDevice = self->bleDevice;
    if (bleDevice)
    {

      self->bleDevice = 0;
    }
    id v9 = [[BLEMIDIDevice alloc] initWithPeripheral:0 mtu:[(CBCentral *)self->connectedCentral maximumUpdateValueLength] - 3];
    self->bleDevice = v9;
    [(BLEMIDIDevice *)v9 setDev:v3];
    [(BLEMIDIDevice *)self->bleDevice setUsage:1];
    [(BLEMIDIDevice *)self->bleDevice setPeripheral:0];
    -[BLEMIDIDevice setUuid:](self->bleDevice, "setUuid:", objc_msgSend(-[CBCentral identifier](self->connectedCentral, "identifier"), "UUIDString"));
    [(BLEMIDIDevice *)self->bleDevice setInEndpoint:MIDIEntityGetSource(newEntity, 0)];
    sub_9850();
    unint64_t v10 = qword_1DDC8;
    if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v11 = [(BLEMIDIDevice *)self->bleDevice inEndpoint];
      *(_DWORD *)buf = 136315650;
      OSStatus v21 = "BTLEMIDILocalPeripheral.mm";
      __int16 v22 = 1024;
      int v23 = 250;
      __int16 v24 = 1024;
      unsigned int v25 = v11;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d Local peripheral inEndpoint = %u", buf, 0x18u);
    }
    [(BLEMIDIDevice *)self->bleDevice setOutEndpoint:MIDIEntityGetDestination(newEntity, 0)];
    sub_9850();
    uint64_t v12 = qword_1DDC8;
    if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v13 = [(BLEMIDIDevice *)self->bleDevice outEndpoint];
      *(_DWORD *)buf = 136315650;
      OSStatus v21 = "BTLEMIDILocalPeripheral.mm";
      __int16 v22 = 1024;
      int v23 = 252;
      __int16 v24 = 1024;
      unsigned int v25 = v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d Local peripheral outEndpoint = %u", buf, 0x18u);
    }
    if ([(BLEMIDIDevice *)self->bleDevice inEndpoint])
    {
      MIDIEndpointSetRefCons([(BLEMIDIDevice *)self->bleDevice inEndpoint], 0, self->midiChar);
      if ([(BLEMIDIDevice *)self->bleDevice dataReceiver]) {
        [(BLEMIDIDevice *)self->bleDevice setDataReceiver:0];
      }
      [(BLEMIDIDevice *)self->bleDevice setDataReceiver:[[BLEMIDIDataReceiver alloc] initWithEndpoint:[(BLEMIDIDevice *)self->bleDevice inEndpoint] owner:self->driver]];
    }
    if ([(BLEMIDIDevice *)self->bleDevice outEndpoint]) {
      MIDIEndpointSetRefCons([(BLEMIDIDevice *)self->bleDevice outEndpoint], 0, self->midiChar);
    }
    driver = self->driver;
    uint64_t v15 = (uint64_t)(driver - 1);
    MIDIObjectRef v16 = *((_DWORD *)driver + 23);
    if (v16) {
      MIDIObjectSetStringProperty(v16, @"Last Connected Central UUID", (CFStringRef)[(BLEMIDIDevice *)self->bleDevice uuid]);
    }
    v17 = (__CFString *)sub_10170(v15, (uint64_t)objc_msgSend(-[CBCentral identifier](self->connectedCentral, "identifier"), "UUIDString"));
    if (v17)
    {
      CFStringRef v18 = v17;
      if (([(__CFString *)v17 isEqualToString:&stru_18B08] & 1) == 0) {
        MIDIObjectSetStringProperty(v3, kMIDIPropertyName, v18);
      }
    }
    MIDIObjectSetIntegerProperty([(BLEMIDIDevice *)self->bleDevice dev], kMIDIPropertyOffline, 0);
  }
  else
  {
    sub_9850();
    MIDIObjectRef v6 = qword_1DDC8;
    if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      OSStatus v21 = "BTLEMIDILocalPeripheral.mm";
      __int16 v22 = 1024;
      int v23 = 213;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%25s:%-5d Unable to locate the connected central. Was didSubscribeToCharacteristic called?", buf, 0x12u);
    }
  }
}

- (void)disconnectDevice:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  MIDIObjectSetIntegerProperty(a3, kMIDIPropertyOffline, 1);
  driver = self->driver;
  id v6 = +[BLEMIDIAccessor uuidForMIDIDevice:v3];
  sub_E2E0((uint64_t)(driver + 15), 0);
  sub_10130((uint64_t)(driver - 1), (uint64_t)v6);

  self->bleDevice = 0;
}

- (void)checkAddMIDIService
{
  if (!self->midiServiceAdded && [(BLEMIDILocalPeripheral *)self isLECapableHardware])
  {
    sub_9850();
    uint64_t v3 = qword_1DDC8;
    if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      unint64_t v10 = "BTLEMIDILocalPeripheral.mm";
      __int16 v11 = 1024;
      int v12 = 302;
      __int16 v13 = 2080;
      v14 = "03B80E5A-EDE8-4B33-A751-6CE34EC4C700";
      __int16 v15 = 2080;
      MIDIObjectRef v16 = "7772E5DB-3868-4112-A1A9-F2669D106BF3";
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%25s:%-5d Driver adding MIDI Service %s with MIDI I/O characteristic %s to the peripheral manager.", buf, 0x26u);
    }
    id v4 = +[CBUUID UUIDWithString:@"03B80E5A-EDE8-4B33-A751-6CE34EC4C700"];
    unsigned int v5 = +[CBUUID UUIDWithString:@"7772E5DB-3868-4112-A1A9-F2669D106BF3"];
    self->midiService = (CBMutableService *)[objc_alloc((Class)CBMutableService) initWithType:v4 primary:1];
    id v6 = (CBMutableCharacteristic *)[objc_alloc((Class)CBMutableCharacteristic) initWithType:v5 properties:262 value:0 permissions:12];
    self->midiChar = v6;
    midiService = self->midiService;
    objc_super v8 = v6;
    [(CBMutableService *)midiService setCharacteristics:+[NSArray arrayWithObjects:&v8 count:1]];
    [(CBPeripheralManager *)self->peripheralManager addService:self->midiService];
  }
}

- (void)removeMIDIService
{
  if (self->midiService)
  {
    -[CBPeripheralManager removeService:](self->peripheralManager, "removeService:");

    self->midiChar = 0;
    self->midiService = 0;
    self->midiServiceAdded = 0;
  }
}

- (void)resetDevice:(unsigned int)a3
{
  MIDIObjectSetIntegerProperty(a3, @"MIDI Remote Peripheral", 0);
  MIDIObjectSetIntegerProperty(a3, @"MIDI Local Peripheral", 1);
  MIDIObjectSetIntegerProperty(a3, @"MIDI Input Supported", 1);

  MIDIObjectSetIntegerProperty(a3, @"MIDI Output Supported", 1);
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  unsigned int v4 = [(BLEMIDILocalPeripheral *)self isLECapableHardware];
  if (self->leCapable != v4)
  {
    BOOL v5 = v4;
    sub_9850();
    id v6 = qword_1DDC8;
    if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_INFO))
    {
      int v7 = "YES";
      BOOL leCapable = self->leCapable;
      int v12 = "BTLEMIDILocalPeripheral.mm";
      __int16 v13 = 1024;
      int v14 = 358;
      if (leCapable) {
        id v9 = "YES";
      }
      else {
        id v9 = "NO";
      }
      int v11 = 136315906;
      if (!v5) {
        int v7 = "NO";
      }
      __int16 v15 = 2080;
      MIDIObjectRef v16 = v9;
      __int16 v17 = 2080;
      CFStringRef v18 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%25s:%-5d Peripheral Manager LE Available State: %s -> %s", (uint8_t *)&v11, 0x26u);
    }
    self->BOOL leCapable = v5;
    if (v5)
    {
      [(BLEMIDILocalPeripheral *)self checkAddMIDIService];
      [(BLEMIDILocalPeripheral *)self activateConnectedUUID];
    }
    else if ([(CBPeripheralManager *)self->peripheralManager state] == (char *)&dword_0 + 1)
    {
      sub_9850();
      unint64_t v10 = qword_1DDC8;
      if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315394;
        int v12 = "BTLEMIDILocalPeripheral.mm";
        __int16 v13 = 1024;
        int v14 = 366;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "%25s:%-5d CBManagerStateResetting received. The MIDI service has been removed by CoreBluetooth.", (uint8_t *)&v11, 0x12u);
      }
      self->midiServiceAdded = 0;
    }
  }
}

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  if (a4)
  {
    sub_9850();
    BOOL v5 = qword_1DDC8;
    if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315650;
      int v7 = "BTLEMIDILocalPeripheral.mm";
      __int16 v8 = 1024;
      int v9 = 375;
      __int16 v10 = 2112;
      id v11 = a4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (void)peripheralManager:(id)a3 didAddService:(id)a4 error:(id)a5
{
  sub_9850();
  __int16 v8 = qword_1DDC8;
  if (a5)
  {
    if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315650;
      __int16 v10 = "BTLEMIDILocalPeripheral.mm";
      __int16 v11 = 1024;
      int v12 = 381;
      __int16 v13 = 2112;
      id v14 = a5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Error publishing service: %@", (uint8_t *)&v9, 0x1Cu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315650;
      __int16 v10 = "BTLEMIDILocalPeripheral.mm";
      __int16 v11 = 1024;
      int v12 = 383;
      __int16 v13 = 2112;
      id v14 = a4;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%25s:%-5d Added service: %@", (uint8_t *)&v9, 0x1Cu);
    }
    self->midiServiceAdded = 1;
  }
}

- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5
{
  sub_9850();
  __int16 v8 = qword_1DDC8;
  if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315906;
    __int16 v11 = "BTLEMIDILocalPeripheral.mm";
    __int16 v12 = 1024;
    int v13 = 390;
    __int16 v14 = 2112;
    id v15 = a4;
    __int16 v16 = 2112;
    id v17 = a5;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %@ subscribed to MIDI characteristic %@. This will bring the device online.", (uint8_t *)&v10, 0x26u);
  }
  if (-[BLEMIDILocalPeripheral isAlreadyConnectedAsPeripheral:](self, "isAlreadyConnectedAsPeripheral:", objc_msgSend(objc_msgSend(a4, "identifier"), "UUIDString")))
  {
    sub_9850();
    int v9 = qword_1DDC8;
    if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315650;
      __int16 v11 = "BTLEMIDILocalPeripheral.mm";
      __int16 v12 = 1024;
      int v13 = 393;
      __int16 v14 = 2112;
      id v15 = a4;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%25s:%-5d %@ is already connected as a peripheral to this central. It will now be disconnected to reverse roles.", (uint8_t *)&v10, 0x1Cu);
    }
    sub_FF18((uint64_t)(self->driver - 1), (uint64_t)objc_msgSend(objc_msgSend(a4, "identifier"), "UUIDString"));
    usleep(0xC350u);
  }
  self->connectedCentral = (CBCentral *)a4;
  -[BLEMIDILocalPeripheral activateUUID:](self, "activateUUID:", objc_msgSend(objc_msgSend(a4, "identifier"), "UUIDString"));
}

- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5
{
  sub_9850();
  __int16 v8 = qword_1DDC8;
  if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315906;
    int v13 = "BTLEMIDILocalPeripheral.mm";
    __int16 v14 = 1024;
    int v15 = 405;
    __int16 v16 = 2112;
    id v17 = a4;
    __int16 v18 = 2112;
    id v19 = a5;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %@ unsubscribed from MIDI characteristic %@. This will take the device offline.", (uint8_t *)&v12, 0x26u);
  }
  id v9 = +[BLEMIDIAccessor midiDeviceForUUID:isLocalPeripheral:isRemotePeripheral:](BLEMIDIAccessor, "midiDeviceForUUID:isLocalPeripheral:isRemotePeripheral:", objc_msgSend(objc_msgSend(a4, "identifier"), "UUIDString"), 1, 0);
  if (v9)
  {
    id v10 = v9;

    self->connectedCentral = 0;
    [(BLEMIDILocalPeripheral *)self disconnectDevice:v10];
  }
  else
  {
    sub_9850();
    __int16 v11 = qword_1DDC8;
    if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      int v13 = "BTLEMIDILocalPeripheral.mm";
      __int16 v14 = 1024;
      int v15 = 408;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: A central attempted to unsubscribe from a characteristic on a nonexistent MIDI device.", (uint8_t *)&v12, 0x12u);
    }
  }
}

- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4
{
  sub_9850();
  int v6 = qword_1DDC8;
  if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    __int16 v8 = "BTLEMIDILocalPeripheral.mm";
    __int16 v9 = 1024;
    int v10 = 418;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%25s:%-5d peripheralManager:didReceiveReadRequest: returning CBATTErrorSuccess.", (uint8_t *)&v7, 0x12u);
  }
  [a3 respondToRequest:a4 withResult:0];
}

- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4
{
}

- (void)peripheralManager:(id)a3 _didReceiveWriteRequests:(id)a4
{
  id v4 = a4;
  int v7 = (char *)[a4 count];
  if (v7)
  {
    __int16 v9 = v7;
    int v10 = 0;
    __int16 v11 = &CFBooleanGetTypeID_ptr;
    CFStringRef v12 = @"7772E5DB-3868-4112-A1A9-F2669D106BF3";
    *(void *)&long long v8 = 136315906;
    long long v25 = v8;
    v26 = v7;
    do
    {
      id v13 = objc_msgSend(v4, "objectAtIndex:", v10, v25);
      if (objc_msgSend(objc_msgSend(objc_msgSend(v13, "characteristic"), "UUID"), "isEqual:", objc_msgSend(v11[136], "UUIDWithString:", v12)))
      {
        id v14 = [v13 value];
        if ([(BLEMIDIDevice *)self->bleDevice dataReceiver] && v14)
        {
          sub_9850();
          int v15 = qword_1DDC8;
          if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_DEBUG))
          {
            id v16 = v4;
            CFStringRef v17 = v12;
            __int16 v18 = v11;
            id v19 = a3;
            unint64_t v20 = [(BLEMIDIDataReceiver *)[(BLEMIDIDevice *)self->bleDevice dataReceiver] nowInMS];
            id v21 = [v14 length];
            *(_DWORD *)buf = v25;
            OSStatus v28 = "BTLEMIDILocalPeripheral.mm";
            __int16 v29 = 1024;
            int v30 = 448;
            __int16 v31 = 2048;
            unint64_t v32 = v20;
            a3 = v19;
            __int16 v11 = v18;
            CFStringRef v12 = v17;
            id v4 = v16;
            __int16 v9 = v26;
            __int16 v33 = 2048;
            id v34 = v21;
            _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d %llu ms: Received value of length %lu", buf, 0x26u);
          }
          [(BLEMIDIDataReceiver *)[(BLEMIDIDevice *)self->bleDevice dataReceiver] unpackValue:v14];
        }
        peripheralManager = self->peripheralManager;
        id v23 = v13;
        uint64_t v24 = 0;
      }
      else
      {
        peripheralManager = a3;
        id v23 = v13;
        uint64_t v24 = 10;
      }
      [peripheralManager respondToRequest:v23 withResult:v24];
      ++v10;
    }
    while (v9 != v10);
  }
}

- (void)peripheralManagerIsReadyToUpdateSubscribers:(id)a3
{
  self->readyToSend = 1;
  commandQueue = self->commandQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B2A4;
  block[3] = &unk_18870;
  block[4] = self;
  dispatch_sync(commandQueue, block);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  BOOL v4 = [(BLEMIDILocalPeripheral *)self isLECapableHardware];
  if (self->leCapable != v4) {
    self->BOOL leCapable = v4;
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  if (self->centralManager == a3)
  {
    sub_9850();
    int v6 = qword_1DDC8;
    if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      int v10 = "BTLEMIDILocalPeripheral.mm";
      __int16 v11 = 1024;
      int v12 = 505;
      __int16 v13 = 2112;
      id v14 = a4;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%25s:%-5d [device info] didConnectPeripheral: %@", buf, 0x1Cu);
    }
    if ((objc_msgSend(objc_msgSend(objc_msgSend(a4, "identifier"), "UUIDString"), "isEqualToString:", objc_msgSend(-[CBCentral identifier](self->connectedCentral, "identifier"), "UUIDString")) & 1) == 0)
    {
      sub_9850();
      int v7 = qword_1DDC8;
      if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v10 = "BTLEMIDILocalPeripheral.mm";
        __int16 v11 = 1024;
        int v12 = 508;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: This central is only allowed to connect to a previously connected central.", buf, 0x12u);
      }
      [(CBCentralManager *)self->centralManager cancelPeripheralConnection:a4];
    }
    [a4 setDelegate:self];
    long long v8 = +[CBUUID UUIDWithString:@"180A"];
    objc_msgSend(a4, "discoverServices:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  }
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  if (self->centralManager == a3)
  {
    sub_9850();
    long long v8 = qword_1DDC8;
    if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315906;
      int v10 = "BTLEMIDILocalPeripheral.mm";
      __int16 v11 = 1024;
      int v12 = 526;
      __int16 v13 = 2112;
      id v14 = a4;
      __int16 v15 = 2112;
      id v16 = a5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%25s:%-5d [device info] didDisconnectPeripheral: %@ error: %@", (uint8_t *)&v9, 0x26u);
    }

    self->connectedPeripheral = 0;
    *(_WORD *)&self->centralManufacturerOutstanding = 0;
  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  if (self->centralManager == a3)
  {
    sub_9850();
    int v7 = qword_1DDC8;
    if (os_log_type_enabled((os_log_t)qword_1DDC8, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315906;
      int v9 = "BTLEMIDILocalPeripheral.mm";
      __int16 v10 = 1024;
      int v11 = 541;
      __int16 v12 = 2112;
      id v13 = a4;
      __int16 v14 = 2112;
      id v15 = a5;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: Failed to connect to peripheral: %@ with error: %@", (uint8_t *)&v8, 0x26u);
    }
    if (a4) {
      [a4 setDelegate:0];
    }
  }
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [a3 services];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v7) {
    goto LABEL_11;
  }
  id v8 = v7;
  id v13 = self;
  char v9 = 0;
  uint64_t v10 = *(void *)v15;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(v6);
      }
      __int16 v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
      if (objc_msgSend(objc_msgSend(v12, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"180A")))
      {
        [a3 discoverCharacteristics:0 forService:v12];
        char v9 = 1;
      }
    }
    id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v8);
  self = v13;
  if ((v9 & 1) == 0) {
LABEL_11:
  }
    [(CBCentralManager *)self->centralManager cancelPeripheralConnection:a3];
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  if (!objc_msgSend(objc_msgSend(a4, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"180A")))goto LABEL_13; {
  long long v21 = 0u;
  }
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [a4 characteristics];
  id v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v8) {
    goto LABEL_13;
  }
  id v9 = v8;
  char v10 = 0;
  uint64_t v11 = *(void *)v20;
  long long v16 = self;
  p_centralModelOutstanding = &self->centralModelOutstanding;
  p_centralManufacturerOutstanding = &self->centralManufacturerOutstanding;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(obj);
      }
      long long v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      long long v15 = p_centralManufacturerOutstanding;
      if ((objc_msgSend(objc_msgSend(v14, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"2A29")) & 1) == 0)
      {
        long long v15 = p_centralModelOutstanding;
        if (!objc_msgSend(objc_msgSend(v14, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"2A24")))continue; {
      }
        }
      [a3 readValueForCharacteristic:v14];
      char v10 = 1;
      *long long v15 = 1;
    }
    id v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v9);
  self = v16;
  if ((v10 & 1) == 0) {
LABEL_13:
  }
    [(CBCentralManager *)self->centralManager cancelPeripheralConnection:a3];
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  if (objc_msgSend(objc_msgSend(a4, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"2A29")))
  {
    CFStringRef v8 = (const __CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", objc_msgSend(a4, "value"), 4);
    MIDIObjectRef v9 = +[BLEMIDIAccessor localPeripheral];
    if (v9) {
      MIDIObjectSetStringProperty(v9, kMIDIPropertyManufacturer, v8);
    }
    uint64_t v10 = 91;
LABEL_9:
    *((unsigned char *)&self->super.isa + v10) = 0;
    goto LABEL_10;
  }
  if (objc_msgSend(objc_msgSend(a4, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"2A24")))
  {
    CFStringRef v11 = (const __CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", objc_msgSend(a4, "value"), 4);
    MIDIObjectRef v12 = +[BLEMIDIAccessor localPeripheral];
    if (v12) {
      MIDIObjectSetStringProperty(v12, kMIDIPropertyModel, v11);
    }
    uint64_t v10 = 92;
    goto LABEL_9;
  }
LABEL_10:
  if (!self->centralManufacturerOutstanding && !self->centralModelOutstanding)
  {
    centralManager = self->centralManager;
    [(CBCentralManager *)centralManager cancelPeripheralConnection:a3];
  }
}

- (void)enqueue:(id)a3
{
  if (a3)
  {
    commandQueue = self->commandQueue;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_BBDC;
    v4[3] = &unk_18898;
    v4[4] = self;
    v4[5] = a3;
    dispatch_sync(commandQueue, v4);
  }
}

- (void)sendIfReady
{
  id v3 = objc_alloc_init((Class)NSAutoreleasePool);
  if (self->readyToSend)
  {
    unsigned int v4 = 0;
    driver = self->driver;
    do
    {
      if (![(NSMutableArray *)self->outgoingPackets count]) {
        break;
      }
      if (v4 >= 0x64)
      {
        [v3 drain];
        id v3 = objc_alloc_init((Class)NSAutoreleasePool);
        unsigned int v4 = 0;
      }
      else
      {
        ++v4;
      }
      BOOL v6 = [(CBPeripheralManager *)self->peripheralManager updateValue:[(NSMutableArray *)self->outgoingPackets objectAtIndex:0] forCharacteristic:self->midiChar onSubscribedCentrals:0];
      self->readyToSend = v6;
      if (!v6) {
        break;
      }
      [(NSMutableArray *)self->outgoingPackets removeObjectAtIndex:0];
      objc_msgSend(-[MIDIDriverInterface bleDevice](driver[14], "bleDevice"), "recycleBuffer");
    }
    while (self->readyToSend);
  }

  [v3 drain];
}

- (BOOL)isAlreadyConnectedAsPeripheral:(id)a3
{
  id v3 = +[BLEMIDIAccessor midiDeviceForUUID:a3 isLocalPeripheral:0 isRemotePeripheral:1];
  if (v3)
  {
    LOBYTE(v3) = +[BLEMIDIAccessor deviceIsOnline:v3];
  }
  return (char)v3;
}

- (BLEMIDILocalPeripheral)peripheralWithUUID:(id)a3
{
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:a3];
  centralManager = self->centralManager;
  id v8 = v4;
  id result = [(CBCentralManager *)centralManager retrievePeripheralsWithIdentifiers:+[NSArray arrayWithObjects:&v8 count:1]];
  if (result)
  {
    id v7 = result;
    if ([(BLEMIDILocalPeripheral *)result count] == (char *)&dword_0 + 1) {
      return (BLEMIDILocalPeripheral *)[(BLEMIDILocalPeripheral *)v7 objectAtIndex:0];
    }
    else {
      return 0;
    }
  }
  return result;
}

- (CBPeripheralManager)peripheralManager
{
  return self->peripheralManager;
}

- (BLEMIDIDevice)bleDevice
{
  return self->bleDevice;
}

- (CBMutableService)midiService
{
  return self->midiService;
}

- (CBMutableCharacteristic)midiChar
{
  return self->midiChar;
}

- (MIDIDriverInterface)driver
{
  return self->driver;
}

@end