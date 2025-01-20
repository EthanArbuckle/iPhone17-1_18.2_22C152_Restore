@interface HMAccessoryManager
- (HMAccessoryManager)init;
- (id)settingsUpdateHandler;
- (void)_activateWithBluetoothDeviceAddress:(id)a3;
- (void)_discoveryAccessory;
- (void)_invalidate;
- (void)_triggerOnDemandFaultCheckWithCompletionHandler:(id)a3;
- (void)_writeHearingModeSetting:(id)a3;
- (void)activateWithBluetoothDeviceAddress:(id)a3;
- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)invalidate;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)setSettingsUpdateHandler:(id)a3;
- (void)triggerOnDemandFaultCheckWithCompletionHandler:(id)a3;
- (void)writeHearingModeSetting:(id)a3;
@end

@implementation HMAccessoryManager

- (HMAccessoryManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)HMAccessoryManager;
  v2 = [(HMAccessoryManager *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("HearingModeAccessoryManager", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    if (gLogCategory_HMAccessoryManager <= 30
      && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
    {
      v6 = [MEMORY[0x263F2B998] sharedInstance];
      v11 = [v6 connectedDevices];
      LogPrintF();
    }
    uint64_t v7 = objc_msgSend(MEMORY[0x263F2B998], "sharedInstance", v11);
    bluetoothManager = v2->_bluetoothManager;
    v2->_bluetoothManager = (BluetoothManager *)v7;

    v9 = v2;
  }

  return v2;
}

- (void)activateWithBluetoothDeviceAddress:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__HMAccessoryManager_activateWithBluetoothDeviceAddress___block_invoke;
  v7[3] = &unk_265360FD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __57__HMAccessoryManager_activateWithBluetoothDeviceAddress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithBluetoothDeviceAddress:*(void *)(a1 + 40)];
}

- (void)_activateWithBluetoothDeviceAddress:(id)a3
{
  id v13 = a3;
  id v4 = self->_centralManager;
  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x263EFEF00]);
    dispatchQueue = self->_dispatchQueue;
    uint64_t v7 = NSDictionary;
    id v8 = [NSNumber numberWithBool:1];
    v9 = objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, *MEMORY[0x263EFED30], 0);
    id v4 = (CBCentralManager *)[v5 initWithDelegate:self queue:dispatchQueue options:v9];

    objc_storeStrong((id *)&self->_centralManager, v4);
  }
  v10 = (void *)[v13 copy];
  v11 = [(BluetoothManager *)self->_bluetoothManager deviceFromAddressString:v10];
  selectedDevice = self->_selectedDevice;
  self->_selectedDevice = v11;

  if (self->_selectedDevice)
  {
    if (gLogCategory_HMAccessoryManager <= 30
      && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
    {
LABEL_9:
      LogPrintF();
    }
  }
  else if (gLogCategory_HMAccessoryManager <= 90 {
         && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_9;
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__HMAccessoryManager_invalidate__block_invoke;
  block[3] = &unk_265360FF8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__HMAccessoryManager_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  selectedDevice = self->_selectedDevice;
  self->_selectedDevice = 0;

  selectedPeripheral = self->_selectedPeripheral;
  self->_selectedPeripheral = 0;

  centralManager = self->_centralManager;
  self->_centralManager = 0;
}

- (void)triggerOnDemandFaultCheckWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__HMAccessoryManager_triggerOnDemandFaultCheckWithCompletionHandler___block_invoke;
  v7[3] = &unk_265361020;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __69__HMAccessoryManager_triggerOnDemandFaultCheckWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _triggerOnDemandFaultCheckWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_triggerOnDemandFaultCheckWithCompletionHandler:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  id v6 = (void *)MEMORY[0x253398200](v5);

  id faultCheckWriteCompletion = self->_faultCheckWriteCompletion;
  self->_id faultCheckWriteCompletion = v6;

  selectedPeripheral = self->_selectedPeripheral;
  if (selectedPeripheral)
  {
    v9 = [(CBPeripheral *)selectedPeripheral services];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __70__HMAccessoryManager__triggerOnDemandFaultCheckWithCompletionHandler___block_invoke;
    v10[3] = &unk_265361070;
    v10[4] = self;
    [v9 enumerateObjectsUsingBlock:v10];
  }
  else
  {
    self->_isFaultCheckPending = 1;
    if (gLogCategory_HMAccessoryManager <= 90
      && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

void __70__HMAccessoryManager__triggerOnDemandFaultCheckWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 characteristics];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__HMAccessoryManager__triggerOnDemandFaultCheckWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_265361048;
  v7[4] = *(void *)(a1 + 32);
  [v6 enumerateObjectsUsingBlock:v7];

  if (!*a4
    && gLogCategory_HMAccessoryManager <= 90
    && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 41) = 0;
}

void __70__HMAccessoryManager__triggerOnDemandFaultCheckWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  id v6 = [v15 UUID];
  uint64_t v7 = [MEMORY[0x263EFEF88] UUIDWithString:@"a4120004-95c5-4d6f-9098-0f0b41457e0a"];
  id v8 = v6;
  id v9 = v7;
  if (v8 == v9)
  {

LABEL_6:
    if (gLogCategory_HMAccessoryManager <= 30
      && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 56);
      LogPrintF();
    }
    objc_super v12 = *(void **)(*(void *)(a1 + 32) + 56);
    id v13 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", "1", 1, v14);
    [v12 writeValue:v13 forCharacteristic:v15 type:0];

    *a4 = 1;
    goto LABEL_12;
  }
  v10 = v9;
  if ((v8 == 0) == (v9 != 0))
  {

    goto LABEL_12;
  }
  char v11 = [v8 isEqual:v9];

  if (v11) {
    goto LABEL_6;
  }
LABEL_12:
}

- (void)writeHearingModeSetting:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__HMAccessoryManager_writeHearingModeSetting___block_invoke;
  v7[3] = &unk_265360FD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __46__HMAccessoryManager_writeHearingModeSetting___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _writeHearingModeSetting:*(void *)(a1 + 40)];
}

- (void)_writeHearingModeSetting:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  selectedPeripheral = self->_selectedPeripheral;
  if (selectedPeripheral)
  {
    id v6 = [(CBPeripheral *)selectedPeripheral services];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__HMAccessoryManager__writeHearingModeSetting___block_invoke;
    v7[3] = &unk_2653610C0;
    v7[4] = self;
    id v8 = v4;
    [v6 enumerateObjectsUsingBlock:v7];
  }
  else if (gLogCategory_HMAccessoryManager <= 30 {
         && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __47__HMAccessoryManager__writeHearingModeSetting___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 characteristics];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__HMAccessoryManager__writeHearingModeSetting___block_invoke_2;
  v5[3] = &unk_265361098;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 enumerateObjectsUsingBlock:v5];
}

void __47__HMAccessoryManager__writeHearingModeSetting___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  id v6 = [v13 UUID];
  uint64_t v7 = [MEMORY[0x263EFEF88] UUIDWithString:@"a4120005-95c5-4d6f-9098-0f0b41457e0a"];
  id v8 = v6;
  id v9 = v7;
  if (v8 == v9)
  {

LABEL_6:
    if (gLogCategory_HMAccessoryManager <= 30
      && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 56);
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "writeValue:forCharacteristic:type:", *(void *)(a1 + 40), v13, 1, v12);
    *a4 = 1;
    goto LABEL_12;
  }
  v10 = v9;
  if ((v8 == 0) == (v9 != 0))
  {

    goto LABEL_12;
  }
  char v11 = [v8 isEqual:v9];

  if (v11) {
    goto LABEL_6;
  }
LABEL_12:
}

- (void)_discoveryAccessory
{
  v17[1] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_HMAccessoryManager <= 30
    && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_isCentralManagerOn)
  {
    centralManager = self->_centralManager;
    uint64_t v16 = *MEMORY[0x263EFEE58];
    uint64_t v4 = *MEMORY[0x263EFEEB8];
    id v5 = [MEMORY[0x263EFEF88] UUIDWithString:*MEMORY[0x263EFEEB8]];
    id v15 = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
    v17[0] = v6;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    [(CBCentralManager *)centralManager registerForConnectionEventsWithOptions:v7];

    id v8 = self->_centralManager;
    id v9 = [MEMORY[0x263EFEF88] UUIDWithString:v4];
    uint64_t v14 = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
    char v11 = [(CBCentralManager *)v8 retrieveConnectedPeripheralsWithServices:v10];

    if (gLogCategory_HMAccessoryManager <= 30
      && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v12 = v11;
      LogPrintF();
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __41__HMAccessoryManager__discoveryAccessory__block_invoke;
    v13[3] = &unk_2653610E8;
    v13[4] = self;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13, v12);
  }
  else if (gLogCategory_HMAccessoryManager <= 30 {
         && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __41__HMAccessoryManager__discoveryAccessory__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  uint64_t v7 = [MEMORY[0x263F2B998] sharedInstance];
  id v8 = [v14 identifier];
  id v9 = [v7 deviceFromIdentifier:v8];

  id v10 = *(id *)(*(void *)(a1 + 32) + 48);
  id v11 = v9;
  uint64_t v12 = v11;
  if (v10 == v11)
  {

LABEL_6:
    if (gLogCategory_HMAccessoryManager <= 30
      && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), a2);
    [*(id *)(*(void *)(a1 + 32) + 16) connectPeripheral:v14 options:0];
    *a4 = 1;
    goto LABEL_12;
  }
  if ((v11 != 0) == (v10 == 0))
  {

    goto LABEL_12;
  }
  int v13 = [v10 isEqual:v11];

  if (v13) {
    goto LABEL_6;
  }
LABEL_12:
}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v4 = [a3 state];
  BOOL v5 = v4 == 5;
  if (self->_isCentralManagerOn != v5)
  {
    uint64_t v6 = v4;
    if (gLogCategory_HMAccessoryManager <= 30
      && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_isCentralManagerOn = v5;
    if (v6 == 5)
    {
      [(HMAccessoryManager *)self _discoveryAccessory];
    }
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v17 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v5 = [MEMORY[0x263F2B998] sharedInstance];
  uint64_t v6 = [v17 identifier];
  uint64_t v7 = [v5 deviceFromIdentifier:v6];

  selectedDevice = self->_selectedDevice;
  id v9 = v7;
  id v10 = selectedDevice;
  if (v9 == v10)
  {
  }
  else
  {
    id v11 = v10;
    if ((v9 == 0) == (v10 != 0))
    {

LABEL_15:
      if (gLogCategory_HMAccessoryManager <= 30
        && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_11;
    }
    char v12 = [(BluetoothDevice *)v9 isEqual:v10];

    if ((v12 & 1) == 0) {
      goto LABEL_15;
    }
  }
  if (gLogCategory_HMAccessoryManager <= 30
    && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
  {
    uint64_t v16 = [(BluetoothDevice *)v9 address];
    LogPrintF();
  }
  objc_msgSend(v17, "setDelegate:", self, v16);
  int v13 = (void *)MEMORY[0x263EFF8C0];
  id v14 = [MEMORY[0x263EFEF88] UUIDWithString:*MEMORY[0x263EFEEB8]];
  id v15 = objc_msgSend(v13, "arrayWithObjects:", v14, 0);
  [v17 discoverServices:v15];

LABEL_11:
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v16 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v6 = [MEMORY[0x263F2B998] sharedInstance];
  uint64_t v7 = [v16 identifier];
  id v8 = [v6 deviceFromIdentifier:v7];

  selectedDevice = self->_selectedDevice;
  id v10 = v8;
  id v11 = selectedDevice;
  if (v10 == v11)
  {
  }
  else
  {
    char v12 = v11;
    if ((v10 == 0) == (v11 != 0))
    {

LABEL_15:
      if (gLogCategory_HMAccessoryManager <= 30
        && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_11;
    }
    char v13 = [(BluetoothDevice *)v10 isEqual:v11];

    if ((v13 & 1) == 0) {
      goto LABEL_15;
    }
  }
  if (gLogCategory_HMAccessoryManager <= 30
    && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
  {
    id v15 = [(BluetoothDevice *)v10 address];
    LogPrintF();
  }
  selectedPeripheral = self->_selectedPeripheral;
  self->_selectedPeripheral = 0;

LABEL_11:
}

- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5
{
  id v16 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v8 = [MEMORY[0x263F2B998] sharedInstance];
  id v9 = [v16 identifier];
  id v10 = [v8 deviceFromIdentifier:v9];

  selectedDevice = self->_selectedDevice;
  char v12 = v10;
  char v13 = selectedDevice;
  if (v12 == v13)
  {
  }
  else
  {
    id v14 = v13;
    if ((v12 == 0) == (v13 != 0))
    {

LABEL_17:
      if (gLogCategory_HMAccessoryManager <= 30
        && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_13;
    }
    char v15 = [(BluetoothDevice *)v12 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_17;
    }
  }
  if (a4 == 1 && !self->_selectedPeripheral)
  {
    if (gLogCategory_HMAccessoryManager <= 30
      && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_selectedPeripheral, a5);
    [(CBCentralManager *)self->_centralManager connectPeripheral:v16 options:0];
  }
LABEL_13:
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v6 = [MEMORY[0x263F2B998] sharedInstance];
  uint64_t v7 = [v5 identifier];
  id v8 = [v6 deviceFromIdentifier:v7];

  selectedDevice = self->_selectedDevice;
  id v10 = v8;
  id v11 = selectedDevice;
  if (v10 == v11)
  {

    goto LABEL_6;
  }
  char v12 = v11;
  if ((v10 == 0) != (v11 != 0))
  {
    char v13 = [(BluetoothDevice *)v10 isEqual:v11];

    if ((v13 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_6:
    id v14 = [v5 services];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __53__HMAccessoryManager_peripheral_didDiscoverServices___block_invoke;
    v15[3] = &unk_265361070;
    id v16 = v5;
    [v14 enumerateObjectsUsingBlock:v15];

    goto LABEL_7;
  }

LABEL_9:
  if (gLogCategory_HMAccessoryManager <= 30
    && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_7:
}

void __53__HMAccessoryManager_peripheral_didDiscoverServices___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [v8 UUID];
  uint64_t v4 = [MEMORY[0x263EFEF88] UUIDWithString:*MEMORY[0x263EFEEB8]];
  int v5 = [v3 isEqual:v4];

  if (v5)
  {
    if (gLogCategory_HMAccessoryManager <= 30
      && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "discoverCharacteristics:forService:", 0, v8, v7);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "discoverCharacteristics:forService:", 0, v8, v6);
    }
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v9 = [MEMORY[0x263F2B998] sharedInstance];
  id v10 = [v7 identifier];
  id v11 = [v9 deviceFromIdentifier:v10];

  selectedDevice = self->_selectedDevice;
  char v13 = v11;
  id v14 = selectedDevice;
  if (v13 == v14)
  {
  }
  else
  {
    char v15 = v14;
    if ((v13 == 0) == (v14 != 0))
    {

LABEL_20:
      if (gLogCategory_HMAccessoryManager <= 30
        && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_18;
    }
    char v16 = [(BluetoothDevice *)v13 isEqual:v14];

    if ((v16 & 1) == 0) {
      goto LABEL_20;
    }
  }
  if (gLogCategory_HMAccessoryManager <= 30
    && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
  {
    [v8 characteristics];
    v19 = id v18 = v7;
    LogPrintF();
  }
  id v17 = objc_msgSend(v7, "services", v18, v19);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __76__HMAccessoryManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke;
  v20[3] = &unk_265361070;
  id v21 = v7;
  [v17 enumerateObjectsUsingBlock:v20];

  if (self->_isFaultCheckPending)
  {
    if (gLogCategory_HMAccessoryManager <= 30
      && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (self->_selectedPeripheral)
    {
      [(HMAccessoryManager *)self _triggerOnDemandFaultCheckWithCompletionHandler:self->_faultCheckWriteCompletion];
    }
    else if (gLogCategory_HMAccessoryManager <= 30 {
           && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }

LABEL_18:
}

void __76__HMAccessoryManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 characteristics];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __76__HMAccessoryManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke_2;
  v4[3] = &unk_265361048;
  id v5 = *(id *)(a1 + 32);
  [v3 enumerateObjectsUsingBlock:v4];
}

void __76__HMAccessoryManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  v3 = [v13 UUID];
  uint64_t v4 = [MEMORY[0x263EFEF88] UUIDWithString:@"a4120005-95c5-4d6f-9098-0f0b41457e0a"];
  id v5 = v3;
  id v6 = v4;
  if (v5 == v6)
  {

LABEL_6:
    if (gLogCategory_HMAccessoryManager <= 30
      && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v12 = v13;
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "setNotifyValue:forCharacteristic:", 1, v13, v9, v12);
    if (gLogCategory_HMAccessoryManager <= 30
      && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "readValueForCharacteristic:", v13, v11);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "readValueForCharacteristic:", v13, v10);
    }
    goto LABEL_16;
  }
  id v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  char v8 = [v5 isEqual:v6];

  if (v8) {
    goto LABEL_6;
  }
LABEL_16:
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v18 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  char v8 = [MEMORY[0x263F2B998] sharedInstance];
  uint64_t v9 = [v18 identifier];
  uint64_t v10 = [v8 deviceFromIdentifier:v9];

  selectedDevice = self->_selectedDevice;
  id v12 = v10;
  id v13 = selectedDevice;
  if (v12 == v13)
  {
  }
  else
  {
    id v14 = v13;
    if ((v12 == 0) == (v13 != 0))
    {

LABEL_17:
      if (gLogCategory_HMAccessoryManager <= 30
        && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_13;
    }
    char v15 = [(BluetoothDevice *)v12 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_17;
    }
  }
  char v16 = [v7 value];
  if (gLogCategory_HMAccessoryManager <= 30
    && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  settingsUpdateHandler = (void (**)(id, void *))self->_settingsUpdateHandler;
  if (settingsUpdateHandler) {
    settingsUpdateHandler[2](settingsUpdateHandler, v16);
  }

LABEL_13:
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v9)
  {
    if (gLogCategory_HMAccessoryManager <= 30
      && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
    {
      id v18 = v8;
      id v19 = v9;
      id v17 = v20;
LABEL_8:
      LogPrintF();
    }
  }
  else if (gLogCategory_HMAccessoryManager <= 30 {
         && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
  }
  {
    id v17 = v20;
    id v18 = v8;
    goto LABEL_8;
  }
  uint64_t v10 = objc_msgSend(v8, "UUID", v17, v18, v19);
  uint64_t v11 = [MEMORY[0x263EFEF88] UUIDWithString:@"a4120004-95c5-4d6f-9098-0f0b41457e0a"];
  id v12 = v10;
  id v13 = v11;
  if (v12 == v13)
  {

    goto LABEL_17;
  }
  id v14 = v13;
  if ((v12 == 0) == (v13 != 0))
  {

LABEL_20:
    goto LABEL_21;
  }
  char v15 = [v12 isEqual:v13];

  if (v15)
  {
LABEL_17:
    id v12 = (id)MEMORY[0x253398200](self->_faultCheckWriteCompletion);
    id faultCheckWriteCompletion = self->_faultCheckWriteCompletion;
    self->_id faultCheckWriteCompletion = 0;

    if (v12) {
      (*((void (**)(id, id))v12 + 2))(v12, v9);
    }
    goto LABEL_20;
  }
LABEL_21:
}

- (id)settingsUpdateHandler
{
  return self->_settingsUpdateHandler;
}

- (void)setSettingsUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_settingsUpdateHandler, 0);
  objc_storeStrong((id *)&self->_selectedPeripheral, 0);
  objc_storeStrong((id *)&self->_selectedDevice, 0);
  objc_storeStrong(&self->_faultCheckWriteCompletion, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_bluetoothManager, 0);
}

@end