@interface HMDeviceAHPSConnectionManager
- (HMDeviceAHPSConnectionManager)initWithQueue:(id)a3;
- (id)diagnosticStatusUpdateHandler;
- (id)hearingProtectionUpdateHandler;
- (id)settingsUpdateHandler;
- (void)_activateWithBluetoothDeviceUUID:(id)a3;
- (void)_centralManagerEnsureStarted;
- (void)_centralManagerEnsureStopped;
- (void)_discoverAccessory;
- (void)_invalidate;
- (void)_triggerOnDemandDiagnosticCheckWithCompletionHandler:(id)a3;
- (void)_writeHMSettingsConfigsData:(id)a3 completion:(id)a4;
- (void)activateWithBluetoothDeviceUUID:(id)a3;
- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)invalidate;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)setDiagnosticStatusUpdateHandler:(id)a3;
- (void)setHearingProtectionUpdateHandler:(id)a3;
- (void)setSettingsUpdateHandler:(id)a3;
- (void)triggerOnDemandDiagnosticCheckWithCompletionHandler:(id)a3;
- (void)writeHMSettingsConfigsData:(id)a3 completion:(id)a4;
@end

@implementation HMDeviceAHPSConnectionManager

- (HMDeviceAHPSConnectionManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDeviceAHPSConnectionManager;
  v6 = [(HMDeviceAHPSConnectionManager *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    v8 = v7;
  }

  return v7;
}

- (void)activateWithBluetoothDeviceUUID:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__HMDeviceAHPSConnectionManager_activateWithBluetoothDeviceUUID___block_invoke;
  v7[3] = &unk_265362628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __65__HMDeviceAHPSConnectionManager_activateWithBluetoothDeviceUUID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithBluetoothDeviceUUID:*(void *)(a1 + 40)];
}

- (void)_activateWithBluetoothDeviceUUID:(id)a3
{
  id v5 = a3;
  if (!self->_activateCalled)
  {
    id v6 = v5;
    self->_activateCalled = 1;
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_identifier, a3);
    [(HMDeviceAHPSConnectionManager *)self _centralManagerEnsureStarted];
    id v5 = v6;
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HMDeviceAHPSConnectionManager_invalidate__block_invoke;
  block[3] = &unk_265362650;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __43__HMDeviceAHPSConnectionManager_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  [(HMDeviceAHPSConnectionManager *)self _centralManagerEnsureStopped];
  uint64_t v3 = NSErrorF();
  diagnosticCheckWriteCompletion = (void (**)(void))self->_diagnosticCheckWriteCompletion;
  id v10 = (id)v3;
  if (diagnosticCheckWriteCompletion)
  {
    diagnosticCheckWriteCompletion[2]();
    id v5 = self->_diagnosticCheckWriteCompletion;
  }
  else
  {
    id v5 = 0;
  }
  self->_diagnosticCheckWriteCompletion = 0;

  id diagnosticStatusUpdateHandler = self->_diagnosticStatusUpdateHandler;
  self->_id diagnosticStatusUpdateHandler = 0;

  id hearingProtectionUpdateHandler = self->_hearingProtectionUpdateHandler;
  self->_id hearingProtectionUpdateHandler = 0;

  id settingsUpdateHandler = self->_settingsUpdateHandler;
  self->_id settingsUpdateHandler = 0;

  self->_activateCalled = 0;
  identifier = self->_identifier;
  self->_identifier = 0;
}

- (void)_centralManagerEnsureStarted
{
  if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
    && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v3 = self->_centralManager;
  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263EFEF00]);
    dispatchQueue = self->_dispatchQueue;
    id v6 = NSDictionary;
    v7 = [NSNumber numberWithBool:1];
    id v8 = objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, *MEMORY[0x263EFED30], 0);
    obj = (CBCentralManager *)[v4 initWithDelegate:self queue:dispatchQueue options:v8];

    objc_storeStrong((id *)&self->_centralManager, obj);
    uint64_t v3 = obj;
  }
}

- (void)_centralManagerEnsureStopped
{
  if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
    && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  centralManager = self->_centralManager;
  self->_centralManager = 0;

  selectedPeripheral = self->_selectedPeripheral;
  self->_selectedPeripheral = 0;
}

- (void)_discoverAccessory
{
  v17[1] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
    && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_isCentralManagerOn)
  {
    centralManager = self->_centralManager;
    uint64_t v16 = *MEMORY[0x263EFEE58];
    uint64_t v4 = *MEMORY[0x263EFEEB8];
    id v5 = [MEMORY[0x263EFEF88] UUIDWithString:*MEMORY[0x263EFEEB8]];
    v15 = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
    v17[0] = v6;
    v7 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    [(CBCentralManager *)centralManager registerForConnectionEventsWithOptions:v7];

    id v8 = self->_centralManager;
    v9 = [MEMORY[0x263EFEF88] UUIDWithString:v4];
    v14 = v9;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
    v11 = [(CBCentralManager *)v8 retrieveConnectedPeripheralsWithServices:v10];

    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      v12 = v11;
      LogPrintF();
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __51__HMDeviceAHPSConnectionManager__discoverAccessory__block_invoke;
    v13[3] = &unk_265362678;
    v13[4] = self;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13, v12);
  }
  else if (gLogCategory_HMDeviceAHPSConnectionManager <= 30 {
         && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __51__HMDeviceAHPSConnectionManager__discoverAccessory__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = *(void **)(*(void *)(a1 + 32) + 40);
  id v15 = v7;
  v9 = [v7 identifier];
  id v10 = [v9 UUIDString];
  id v11 = v8;
  id v12 = v10;
  if (v11 == v12)
  {

LABEL_6:
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), a2);
    [*(id *)(*(void *)(a1 + 32) + 16) connectPeripheral:v15 options:0];
    *a4 = 1;
    goto LABEL_12;
  }
  v13 = v12;
  if ((v11 == 0) == (v12 != 0))
  {

    goto LABEL_12;
  }
  char v14 = [v11 isEqual:v12];

  if (v14) {
    goto LABEL_6;
  }
LABEL_12:
}

- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5
{
  id v15 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  identifier = self->_identifier;
  v9 = [v15 identifier];
  id v10 = [v9 UUIDString];
  id v11 = identifier;
  id v12 = v10;
  if (v11 == v12)
  {
  }
  else
  {
    v13 = v12;
    if ((v11 == 0) == (v12 != 0))
    {

LABEL_17:
      if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
        && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_13;
    }
    char v14 = [(NSString *)v11 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_17;
    }
  }
  if (a4 == 1 && !self->_selectedPeripheral)
  {
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_selectedPeripheral, a5);
    [(CBCentralManager *)self->_centralManager connectPeripheral:v15 options:0];
  }
LABEL_13:
}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v4 = [a3 state];
  BOOL v5 = v4 == 5;
  if (self->_isCentralManagerOn != v5)
  {
    uint64_t v6 = v4;
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_isCentralManagerOn = v5;
    if (v6 == 5)
    {
      [(HMDeviceAHPSConnectionManager *)self _discoverAccessory];
    }
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v18 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  identifier = self->_identifier;
  uint64_t v6 = [v18 identifier];
  id v7 = [v6 UUIDString];
  id v8 = identifier;
  v9 = v7;
  if (v8 == v9)
  {
  }
  else
  {
    id v10 = v9;
    if ((v8 == 0) == (v9 != 0))
    {

LABEL_15:
      if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
        && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_11;
    }
    char v11 = [(NSString *)v8 isEqual:v9];

    if ((v11 & 1) == 0) {
      goto LABEL_15;
    }
  }
  id v12 = v18;
  if (gLogCategory_HMDeviceAHPSConnectionManager <= 30)
  {
    if (gLogCategory_HMDeviceAHPSConnectionManager != -1 || (v13 = _LogCategory_Initialize(), id v12 = v18, v13))
    {
      v17 = [v12 identifier];
      LogPrintF();

      id v12 = v18;
    }
  }
  objc_msgSend(v12, "setDelegate:", self, v17);
  char v14 = (void *)MEMORY[0x263EFF8C0];
  id v15 = [MEMORY[0x263EFEF88] UUIDWithString:*MEMORY[0x263EFEEB8]];
  uint64_t v16 = objc_msgSend(v14, "arrayWithObjects:", v15, 0);
  [v18 discoverServices:v16];

LABEL_11:
  MEMORY[0x270F9A758]();
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v15 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  identifier = self->_identifier;
  id v7 = [v15 identifier];
  id v8 = [v7 UUIDString];
  v9 = identifier;
  id v10 = v8;
  if (v9 == v10)
  {
  }
  else
  {
    char v11 = v10;
    if ((v9 == 0) == (v10 != 0))
    {

LABEL_15:
      if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
        && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_11;
    }
    char v12 = [(NSString *)v9 isEqual:v10];

    if ((v12 & 1) == 0) {
      goto LABEL_15;
    }
  }
  if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
    && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  {
    char v14 = [v15 identifier];
    LogPrintF();
  }
  selectedPeripheral = self->_selectedPeripheral;
  self->_selectedPeripheral = 0;

LABEL_11:
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  identifier = self->_identifier;
  id v7 = [v5 identifier];
  id v8 = [v7 UUIDString];
  v9 = identifier;
  id v10 = v8;
  if (v9 == v10)
  {

    goto LABEL_6;
  }
  char v11 = v10;
  if ((v9 == 0) != (v10 != 0))
  {
    char v12 = [(NSString *)v9 isEqual:v10];

    if ((v12 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_6:
    int v13 = [v5 services];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __64__HMDeviceAHPSConnectionManager_peripheral_didDiscoverServices___block_invoke;
    v14[3] = &unk_2653626A0;
    id v15 = v5;
    [v13 enumerateObjectsUsingBlock:v14];

    goto LABEL_7;
  }

LABEL_9:
  if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
    && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_7:
}

void __64__HMDeviceAHPSConnectionManager_peripheral_didDiscoverServices___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 UUID];
  uint64_t v4 = [MEMORY[0x263EFEF88] UUIDWithString:*MEMORY[0x263EFEEB8]];
  int v5 = [v3 isEqual:v4];

  if (v5)
  {
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
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
  identifier = self->_identifier;
  id v10 = [v7 identifier];
  char v11 = [v10 UUIDString];
  char v12 = identifier;
  int v13 = v11;
  if (v12 == v13)
  {
  }
  else
  {
    char v14 = v13;
    if ((v12 == 0) == (v13 != 0))
    {

LABEL_20:
      if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
        && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_18;
    }
    char v15 = [(NSString *)v12 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_20;
    }
  }
  if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
    && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  {
    [v8 characteristics];
    id v18 = v17 = v7;
    LogPrintF();
  }
  uint64_t v16 = objc_msgSend(v7, "services", v17, v18);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __87__HMDeviceAHPSConnectionManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke;
  v19[3] = &unk_2653626A0;
  id v20 = v7;
  [v16 enumerateObjectsUsingBlock:v19];

  if (self->_isDiagnosticCheckPending)
  {
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (self->_selectedPeripheral)
    {
      [(HMDeviceAHPSConnectionManager *)self _triggerOnDemandDiagnosticCheckWithCompletionHandler:self->_diagnosticCheckWriteCompletion];
    }
    else if (gLogCategory_HMDeviceAHPSConnectionManager <= 30 {
           && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }

LABEL_18:
}

void __87__HMDeviceAHPSConnectionManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 characteristics];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __87__HMDeviceAHPSConnectionManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke_2;
  v4[3] = &unk_2653626C8;
  id v5 = *(id *)(a1 + 32);
  [v3 enumerateObjectsUsingBlock:v4];
}

void __87__HMDeviceAHPSConnectionManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v26 = a2;
  uint64_t v3 = [v26 UUID];
  uint64_t v4 = [MEMORY[0x263EFEF88] UUIDWithString:@"a4120005-95c5-4d6f-9098-0f0b41457e0a"];
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    int v8 = 1;
  }
  else if ((v5 == 0) == (v6 != 0))
  {
    int v8 = 0;
  }
  else
  {
    int v8 = [v5 isEqual:v6];
  }

  v9 = [v26 UUID];
  id v10 = [MEMORY[0x263EFEF88] UUIDWithString:@"a48fec08-3921-43db-82aa-afbce8ebb4fb"];
  id v11 = v9;
  id v12 = v10;
  int v13 = v12;
  if (v11 == v12)
  {
    int v14 = 1;
  }
  else if ((v11 == 0) == (v12 != 0))
  {
    int v14 = 0;
  }
  else
  {
    int v14 = [v11 isEqual:v12];
  }

  int v15 = v8 | v14;
  uint64_t v16 = [v26 UUID];
  id v17 = [MEMORY[0x263EFEF88] UUIDWithString:@"a4120002-95c5-4d6f-9098-0f0b41457e0a"];
  id v18 = v16;
  id v19 = v17;
  id v20 = v19;
  if (v18 == v19)
  {
    int v21 = 1;
  }
  else if ((v18 == 0) == (v19 != 0))
  {
    int v21 = 0;
  }
  else
  {
    int v21 = [v18 isEqual:v19];
  }

  if ((v15 | v21) == 1)
  {
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      id v25 = v26;
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "setNotifyValue:forCharacteristic:", 1, v26, v22, v25);
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v24 = *(void *)(a1 + 32);
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "readValueForCharacteristic:", v26, v24);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "readValueForCharacteristic:", v26, v23);
    }
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  identifier = self->_identifier;
  id v10 = [v7 identifier];
  id v11 = [v10 UUIDString];
  id v12 = identifier;
  int v13 = v11;
  if (v12 == v13)
  {

    goto LABEL_6;
  }
  int v14 = v13;
  if ((v12 == 0) != (v13 != 0))
  {
    char v15 = [(NSString *)v12 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_47;
    }
LABEL_6:
    uint64_t v16 = [v8 UUID];
    id v17 = [MEMORY[0x263EFEF88] UUIDWithString:@"a4120005-95c5-4d6f-9098-0f0b41457e0a"];
    id v18 = v16;
    id v19 = v17;
    if (v18 == v19)
    {
    }
    else
    {
      id v20 = v19;
      if ((v18 == 0) == (v19 != 0))
      {

LABEL_18:
        goto LABEL_19;
      }
      char v21 = [v18 isEqual:v19];

      if ((v21 & 1) == 0)
      {
LABEL_19:
        uint64_t v23 = objc_msgSend(v8, "UUID", v37);
        uint64_t v24 = [MEMORY[0x263EFEF88] UUIDWithString:@"a48fec08-3921-43db-82aa-afbce8ebb4fb"];
        id v25 = v23;
        id v26 = v24;
        if (v25 == v26)
        {
        }
        else
        {
          v27 = v26;
          if ((v25 == 0) == (v26 != 0))
          {

LABEL_31:
            goto LABEL_32;
          }
          char v28 = [v25 isEqual:v26];

          if ((v28 & 1) == 0)
          {
LABEL_32:
            v30 = objc_msgSend(v8, "UUID", v38);
            v31 = [MEMORY[0x263EFEF88] UUIDWithString:@"a4120002-95c5-4d6f-9098-0f0b41457e0a"];
            id v32 = v30;
            id v33 = v31;
            if (v32 == v33)
            {
            }
            else
            {
              v34 = v33;
              if ((v32 == 0) == (v33 != 0))
              {

LABEL_44:
                goto LABEL_45;
              }
              char v35 = [v32 isEqual:v33];

              if ((v35 & 1) == 0) {
                goto LABEL_45;
              }
            }
            id v32 = [v8 value];
            if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
              && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            id diagnosticStatusUpdateHandler = (void (**)(id, NSString *, id))self->_diagnosticStatusUpdateHandler;
            if (diagnosticStatusUpdateHandler) {
              diagnosticStatusUpdateHandler[2](diagnosticStatusUpdateHandler, self->_identifier, v32);
            }
            goto LABEL_44;
          }
        }
        id v25 = [v8 value];
        unsigned __int8 v39 = 1;
        [v25 getBytes:&v39 length:1];
        if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
          && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
        {
          id v38 = v7;
          LogPrintF();
        }
        id hearingProtectionUpdateHandler = (void (**)(id, NSString *, void))self->_hearingProtectionUpdateHandler;
        if (hearingProtectionUpdateHandler) {
          hearingProtectionUpdateHandler[2](hearingProtectionUpdateHandler, self->_identifier, v39);
        }
        goto LABEL_31;
      }
    }
    id v18 = [v8 value];
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      id v37 = v7;
      LogPrintF();
    }
    id settingsUpdateHandler = (void (**)(id, NSString *, id))self->_settingsUpdateHandler;
    if (settingsUpdateHandler) {
      settingsUpdateHandler[2](settingsUpdateHandler, self->_identifier, v18);
    }
    goto LABEL_18;
  }

LABEL_47:
  if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
    && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_45:
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v9)
  {
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      id v18 = v8;
      id v19 = v9;
      id v17 = v20;
LABEL_8:
      LogPrintF();
    }
  }
  else if (gLogCategory_HMDeviceAHPSConnectionManager <= 30 {
         && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  }
  {
    id v17 = v20;
    id v18 = v8;
    goto LABEL_8;
  }
  id v10 = objc_msgSend(v8, "UUID", v17, v18, v19);
  id v11 = [MEMORY[0x263EFEF88] UUIDWithString:@"a4120004-95c5-4d6f-9098-0f0b41457e0a"];
  id v12 = v10;
  id v13 = v11;
  if (v12 == v13)
  {

    goto LABEL_17;
  }
  int v14 = v13;
  if ((v12 == 0) == (v13 != 0))
  {

LABEL_20:
    goto LABEL_21;
  }
  char v15 = [v12 isEqual:v13];

  if (v15)
  {
LABEL_17:
    id v12 = (id)MEMORY[0x253398690](self->_diagnosticCheckWriteCompletion);
    id diagnosticCheckWriteCompletion = self->_diagnosticCheckWriteCompletion;
    self->_id diagnosticCheckWriteCompletion = 0;

    if (v12) {
      (*((void (**)(id, id))v12 + 2))(v12, v9);
    }
    goto LABEL_20;
  }
LABEL_21:
}

- (void)writeHMSettingsConfigsData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__HMDeviceAHPSConnectionManager_writeHMSettingsConfigsData_completion___block_invoke;
  block[3] = &unk_2653626F0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __71__HMDeviceAHPSConnectionManager_writeHMSettingsConfigsData_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _writeHMSettingsConfigsData:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_writeHMSettingsConfigsData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  selectedPeripheral = self->_selectedPeripheral;
  if (selectedPeripheral)
  {
    uint64_t v14 = 0;
    char v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    id v9 = [(CBPeripheral *)selectedPeripheral services];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __72__HMDeviceAHPSConnectionManager__writeHMSettingsConfigsData_completion___block_invoke;
    v11[3] = &unk_265362740;
    v11[4] = self;
    id v12 = v6;
    id v13 = &v14;
    [v9 enumerateObjectsUsingBlock:v11];

    if (*((unsigned char *)v15 + 24))
    {
      id v10 = 0;
      if (!v7) {
        goto LABEL_17;
      }
    }
    else
    {
      if (gLogCategory_HMDeviceAHPSConnectionManager <= 90
        && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v10 = NSErrorF();
      if (!v7) {
        goto LABEL_17;
      }
    }
    v7[2](v7, v10);
LABEL_17:

    _Block_object_dispose(&v14, 8);
    goto LABEL_18;
  }
  if (gLogCategory_HMDeviceAHPSConnectionManager <= 90
    && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v10 = NSErrorF();
  if (v7) {
    v7[2](v7, v10);
  }
LABEL_18:
}

void __72__HMDeviceAHPSConnectionManager__writeHMSettingsConfigsData_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = [a2 characteristics];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__HMDeviceAHPSConnectionManager__writeHMSettingsConfigsData_completion___block_invoke_2;
  v7[3] = &unk_265362718;
  uint64_t v4 = (void *)a1[5];
  v7[4] = a1[4];
  id v5 = v4;
  uint64_t v6 = a1[6];
  id v8 = v5;
  uint64_t v9 = v6;
  [v3 enumerateObjectsUsingBlock:v7];
}

void __72__HMDeviceAHPSConnectionManager__writeHMSettingsConfigsData_completion___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  uint64_t v6 = [v13 UUID];
  id v7 = [MEMORY[0x263EFEF88] UUIDWithString:@"a4120005-95c5-4d6f-9098-0f0b41457e0a"];
  id v8 = v6;
  id v9 = v7;
  if (v8 == v9)
  {

LABEL_6:
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v12 = *(void *)(a1[4] + 56);
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1[4] + 56), "writeValue:forCharacteristic:type:", a1[5], v13, 1, v12);
    *a4 = 1;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    goto LABEL_12;
  }
  id v10 = v9;
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

- (void)triggerOnDemandDiagnosticCheckWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __85__HMDeviceAHPSConnectionManager_triggerOnDemandDiagnosticCheckWithCompletionHandler___block_invoke;
  v7[3] = &unk_265362768;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __85__HMDeviceAHPSConnectionManager_triggerOnDemandDiagnosticCheckWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _triggerOnDemandDiagnosticCheckWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_triggerOnDemandDiagnosticCheckWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = (void *)MEMORY[0x253398690](v4);
  id diagnosticCheckWriteCompletion = self->_diagnosticCheckWriteCompletion;
  self->_id diagnosticCheckWriteCompletion = v5;

  selectedPeripheral = self->_selectedPeripheral;
  if (selectedPeripheral)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    id v8 = [(CBPeripheral *)selectedPeripheral services];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __86__HMDeviceAHPSConnectionManager__triggerOnDemandDiagnosticCheckWithCompletionHandler___block_invoke;
    v12[3] = &unk_2653627B8;
    v12[4] = self;
    v12[5] = &v13;
    [v8 enumerateObjectsUsingBlock:v12];

    if (!*((unsigned char *)v14 + 24))
    {
      if (gLogCategory_HMDeviceAHPSConnectionManager <= 90
        && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v9 = NSErrorF();
      id v10 = (void (**)(id, void *))self->_diagnosticCheckWriteCompletion;
      if (v10)
      {
        v10[2](v10, v9);
        id v11 = self->_diagnosticCheckWriteCompletion;
      }
      else
      {
        id v11 = 0;
      }
      self->_id diagnosticCheckWriteCompletion = 0;
    }
    self->_isDiagnosticCheckPending = 0;
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    self->_isDiagnosticCheckPending = 1;
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 90
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

void __86__HMDeviceAHPSConnectionManager__triggerOnDemandDiagnosticCheckWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 characteristics];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __86__HMDeviceAHPSConnectionManager__triggerOnDemandDiagnosticCheckWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_265362790;
  long long v5 = *(_OWORD *)(a1 + 32);
  [v3 enumerateObjectsUsingBlock:v4];
}

void __86__HMDeviceAHPSConnectionManager__triggerOnDemandDiagnosticCheckWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  id v6 = [v15 UUID];
  id v7 = [MEMORY[0x263EFEF88] UUIDWithString:@"a4120004-95c5-4d6f-9098-0f0b41457e0a"];
  id v8 = v6;
  id v9 = v7;
  if (v8 == v9)
  {

LABEL_6:
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 56);
      LogPrintF();
    }
    uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 56);
    uint64_t v13 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", "1", 1, v14);
    [v12 writeValue:v13 forCharacteristic:v15 type:0];

    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_12;
  }
  id v10 = v9;
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

- (id)diagnosticStatusUpdateHandler
{
  return self->_diagnosticStatusUpdateHandler;
}

- (void)setDiagnosticStatusUpdateHandler:(id)a3
{
}

- (id)hearingProtectionUpdateHandler
{
  return self->_hearingProtectionUpdateHandler;
}

- (void)setHearingProtectionUpdateHandler:(id)a3
{
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
  objc_storeStrong(&self->_hearingProtectionUpdateHandler, 0);
  objc_storeStrong(&self->_diagnosticStatusUpdateHandler, 0);
  objc_storeStrong((id *)&self->_selectedPeripheral, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_diagnosticCheckWriteCompletion, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
}

@end