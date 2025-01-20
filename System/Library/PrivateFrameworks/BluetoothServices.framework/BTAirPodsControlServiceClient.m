@interface BTAirPodsControlServiceClient
- (BOOL)_runConnectStart;
- (BOOL)_runDiscoverCharacteristicsStart;
- (BOOL)_runDiscoverServicesStart;
- (BOOL)_runInit;
- (BOOL)isFindmyManaged;
- (BTAirPodsControlServiceClient)init;
- (CBDevice)peerDevice;
- (NSString)deviceSN;
- (NSString)deviceUUID;
- (OS_dispatch_queue)dispatchQueue;
- (void)_abortRequestsWithError:(id)a3;
- (void)_completeRequest:(id)a3 error:(id)a4;
- (void)_invalidate;
- (void)_reportError:(id)a3;
- (void)_run;
- (void)_runProcessRequest:(id)a3;
- (void)_runProcessRequests;
- (void)_setupTimeoutForRequest:(id)a3;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didUpdateFindMyPeripherals:(id)a4;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)getSilentModeWithCompletionHandler:(id)a3;
- (void)invalidate;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)setDeviceSN:(id)a3;
- (void)setDeviceUUID:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setSilentMode:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation BTAirPodsControlServiceClient

- (BTAirPodsControlServiceClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)BTAirPodsControlServiceClient;
  v2 = [(BTAirPodsControlServiceClient *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v4 = v3;
  }

  return v3;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__BTAirPodsControlServiceClient_invalidate__block_invoke;
  block[3] = &unk_2644A0AF8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __43__BTAirPodsControlServiceClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 49))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 49) = 1;
    if (gLogCategory_BTAirPodsControlServiceClient <= 30
      && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v3 = *(void **)(v2 + 32);
    return [v3 _invalidate];
  }
  return result;
}

- (void)_invalidate
{
  v3 = BTErrorF();
  [(BTAirPodsControlServiceClient *)self _abortRequestsWithError:v3];

  [(CBCentralManager *)self->_centralManager setDelegate:0];
  centralManager = self->_centralManager;
  self->_centralManager = 0;

  [(CBPeripheral *)self->_peripheral setDelegate:0];
  peripheral = self->_peripheral;
  self->_peripheral = 0;

  requestArray = self->_requestArray;
  self->_requestArray = 0;

  if (gLogCategory_BTAirPodsControlServiceClient <= 30
    && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)getSilentModeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__BTAirPodsControlServiceClient_getSilentModeWithCompletionHandler___block_invoke;
  v7[3] = &unk_2644A0BE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __68__BTAirPodsControlServiceClient_getSilentModeWithCompletionHandler___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 49))
  {
    BTErrorF();
    v14 = (BTAirPodsControlRequest *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_BTAirPodsControlServiceClient <= 90
      && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
    {
      uint64_t v2 = *(void *)(a1 + 32);
      uint64_t v3 = *(void *)(v2 + 104);
      if (v3)
      {
        id v4 = [*(id *)(v2 + 104) identifier];
      }
      else
      {
        id v4 = *(void **)(v2 + 112);
      }
      v13 = CUPrintNSError();
      LogPrintF_safe();

      if (v3) {
    }
      }
    (*(void (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0);
  }
  else
  {
    v14 = objc_alloc_init(BTAirPodsControlRequest);
    [(BTAirPodsControlRequest *)v14 setClient:*(void *)(a1 + 32)];
    [(BTAirPodsControlRequest *)v14 setGetHandler:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _setupTimeoutForRequest:v14];
    v5 = *(void **)(*(void *)(a1 + 32) + 72);
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(v7 + 72);
      *(void *)(v7 + 72) = v6;

      v5 = *(void **)(*(void *)(a1 + 32) + 72);
    }
    [v5 addObject:v14];
    if (gLogCategory_BTAirPodsControlServiceClient <= 30
      && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = *(void **)(v9 + 104);
      if (v10)
      {
        v12 = [v10 identifier];
        LogPrintF_safe();

        objc_msgSend(*(id *)(a1 + 32), "_run", v12);
        goto LABEL_22;
      }
      uint64_t v11 = *(void *)(v9 + 112);
      LogPrintF_safe();
    }
    objc_msgSend(*(id *)(a1 + 32), "_run", v11);
  }
LABEL_22:
}

- (void)setSilentMode:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__BTAirPodsControlServiceClient_setSilentMode_completionHandler___block_invoke;
  block[3] = &unk_2644A0E10;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __65__BTAirPodsControlServiceClient_setSilentMode_completionHandler___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 49))
  {
    uint64_t v2 = BTErrorF();
    v19 = (BTAirPodsControlRequest *)v2;
    if (gLogCategory_BTAirPodsControlServiceClient <= 90)
    {
      if (gLogCategory_BTAirPodsControlServiceClient != -1 || (v14 = _LogCategory_Initialize(), uint64_t v2 = (uint64_t)v19, v14))
      {
        uint64_t v4 = *(void *)(a1 + 32);
        uint64_t v5 = *(void *)(v4 + 104);
        if (v5)
        {
          id v6 = [*(id *)(v4 + 104) identifier];
        }
        else
        {
          id v6 = *(void **)(v4 + 112);
        }
        v18 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = (uint64_t)v19;
        if (v5)
        {

          uint64_t v2 = (uint64_t)v19;
        }
      }
    }
    (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v2, v3);
  }
  else
  {
    v19 = objc_alloc_init(BTAirPodsControlRequest);
    [(BTAirPodsControlRequest *)v19 setClient:*(void *)(a1 + 32)];
    [(BTAirPodsControlRequest *)v19 setEnabled:*(unsigned __int8 *)(a1 + 48)];
    [(BTAirPodsControlRequest *)v19 setSetHandler:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _setupTimeoutForRequest:v19];
    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 72);
    if (!v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 72);
      *(void *)(v9 + 72) = v8;

      uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 72);
    }
    [v7 addObject:v19];
    if (gLogCategory_BTAirPodsControlServiceClient <= 30
      && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(v11 + 104);
      if (v12)
      {
        v13 = [*(id *)(v11 + 104) identifier];
      }
      else
      {
        v13 = *(void **)(v11 + 112);
      }
      v15 = *(unsigned char *)(a1 + 48) ? "yes" : "no";
      v16 = v13;
      v17 = v15;
      LogPrintF_safe();
      if (v12) {
    }
      }
    objc_msgSend(*(id *)(a1 + 32), "_run", v16, v17);
  }
}

- (BOOL)isFindmyManaged
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  if (self->_deviceSN)
  {
    uint64_t v3 = (void *)[(id)objc_opt_new() init];
    [v3 addObject:self->_deviceSN];
    centralManager = self->_centralManager;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48__BTAirPodsControlServiceClient_isFindmyManaged__block_invoke;
    v7[3] = &unk_2644A0E38;
    v7[4] = &v8;
    [(CBCentralManager *)centralManager retrievePeripheralsWithFindMySerialNumberStrings:v3 completion:v7];

    BOOL v5 = *((unsigned char *)v9 + 24) != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __48__BTAirPodsControlServiceClient_isFindmyManaged__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [v4 firstObject];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 managedByFindMy];

  if (gLogCategory_BTAirPodsControlServiceClient <= 30
    && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
  {
    [v4 count];
    LogPrintF_safe();
  }
}

- (void)_abortRequestsWithError:(id)a3
{
  id v6 = a3;
  requestCurrent = self->_requestCurrent;
  if (!requestCurrent) {
    goto LABEL_5;
  }
  self->_requestCurrent = 0;
  BOOL v5 = requestCurrent;

LABEL_3:
  [(BTAirPodsControlServiceClient *)self _completeRequest:v5 error:v6];
  while (1)
  {

LABEL_5:
    if (![(NSMutableArray *)self->_requestArray count]) {
      break;
    }
    BOOL v5 = [(NSMutableArray *)self->_requestArray popFirstObject];
    if (v5) {
      goto LABEL_3;
    }
  }
}

- (void)_completeRequest:(id)a3 error:(id)a4
{
  v16 = (BTAirPodsControlRequest *)a3;
  id v6 = a4;
  uint64_t v7 = [(BTAirPodsControlRequest *)v16 getHandler];
  if (v7) {
    uint64_t v8 = "GetSilentMode";
  }
  else {
    uint64_t v8 = "SetSilentMode";
  }

  if (v6)
  {
    if (gLogCategory_BTAirPodsControlServiceClient <= 90
      && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v15 = int v14 = v8;
      LogPrintF_safe();
    }
  }
  else if (gLogCategory_BTAirPodsControlServiceClient <= 30 {
         && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
  }
  {
    int v14 = v8;
    LogPrintF_safe();
  }
  uint64_t v9 = [(BTAirPodsControlRequest *)v16 timeoutTimer];
  uint64_t v10 = v9;
  if (v9)
  {
    dispatch_source_cancel(v9);
    [(BTAirPodsControlRequest *)v16 setTimeoutTimer:0];
  }
  char v11 = [(BTAirPodsControlRequest *)v16 getHandler];

  if (v11)
  {
    uint64_t v12 = [(BTAirPodsControlRequest *)v16 getHandler];
    ((void (**)(void, BOOL, id))v12)[2](v12, [(BTAirPodsControlRequest *)v16 enabled], v6);
  }
  else
  {
    v13 = [(BTAirPodsControlRequest *)v16 setHandler];

    if (!v13) {
      goto LABEL_21;
    }
    uint64_t v12 = [(BTAirPodsControlRequest *)v16 setHandler];
    ((void (*)(void (**)(void, void, void), id))v12[2])(v12, v6);
  }

LABEL_21:
  [(BTAirPodsControlRequest *)v16 setClient:0];
  [(BTAirPodsControlRequest *)v16 setGetHandler:0];
  [(BTAirPodsControlRequest *)v16 setSetHandler:0];
  [(NSMutableArray *)self->_requestArray removeObject:v16];
  if (self->_requestCurrent == v16)
  {
    self->_requestCurrent = 0;
  }
  [(BTAirPodsControlServiceClient *)self _run];
}

- (void)_reportError:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (!self->_invalidateCalled && gLogCategory_BTAirPodsControlServiceClient <= 90)
  {
    if (gLogCategory_BTAirPodsControlServiceClient != -1 || (v5 = _LogCategory_Initialize(), id v4 = v7, v5))
    {
      id v6 = CUPrintNSError();
      LogPrintF_safe();

      id v4 = v7;
    }
  }
  self->_state = 3;
  -[BTAirPodsControlServiceClient _abortRequestsWithError:](self, "_abortRequestsWithError:", v4, v6);
}

- (void)_setupTimeoutForRequest:(id)a3
{
  id v4 = a3;
  int v5 = [v4 timeoutTimer];
  id v6 = v5;
  if (v5) {
    dispatch_source_cancel(v5);
  }
  dispatch_source_t v7 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  [v4 setTimeoutTimer:v7];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __57__BTAirPodsControlServiceClient__setupTimeoutForRequest___block_invoke;
  handler[3] = &unk_2644A0E60;
  dispatch_source_t v11 = v7;
  id v12 = v4;
  v13 = self;
  id v8 = v4;
  uint64_t v9 = v7;
  dispatch_source_set_event_handler(v9, handler);
  CUDispatchTimerSet();
  dispatch_activate(v9);
}

void __57__BTAirPodsControlServiceClient__setupTimeoutForRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) timeoutTimer];

  if (v2 == v3)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    [*(id *)(a1 + 40) setTimeoutTimer:0];
    uint64_t v6 = a1 + 40;
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(void **)(v6 + 8);
    BTErrorF();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v5 _completeRequest:v4 error:v7];
  }
}

- (void)_run
{
  if (!self->_invalidateCalled)
  {
    while (1)
    {
      int state = self->_state;
      switch(state)
      {
        case 0:
          if ([(BTAirPodsControlServiceClient *)self _runInit])
          {
            int v4 = 10;
            goto LABEL_19;
          }
          break;
        case 10:
          if ([(CBCentralManager *)self->_centralManager state] == 5) {
            goto LABEL_18;
          }
          break;
        case 11:
          if ([(BTAirPodsControlServiceClient *)self _runConnectStart]) {
            goto LABEL_18;
          }
          break;
        case 12:
          if (self->_connected)
          {
            int v4 = 13;
            goto LABEL_19;
          }
          break;
        case 13:
          self->_int state = 14;
          break;
        case 14:
          if ([(BTAirPodsControlServiceClient *)self _runDiscoverServicesStart]) {
            goto LABEL_18;
          }
          break;
        case 15:
          if (self->_airpodsCaseControlServiceObj)
          {
            int v4 = 16;
            goto LABEL_19;
          }
          break;
        case 16:
          if ([(BTAirPodsControlServiceClient *)self _runDiscoverCharacteristicsStart])
          {
LABEL_18:
            int v4 = self->_state + 1;
LABEL_19:
            self->_int state = v4;
          }
          break;
        case 17:
          if (self->_airpodsCaseControlCharacteristicObj) {
            self->_int state = 18;
          }
          break;
        case 18:
          [(BTAirPodsControlServiceClient *)self _runProcessRequests];
          break;
        default:
          break;
      }
      if (self->_state == state) {
        break;
      }
      if (gLogCategory_BTAirPodsControlServiceClient <= 30
        && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }
}

- (BOOL)_runInit
{
  v17[1] = *MEMORY[0x263EF8340];
  p_centralManager = &self->_centralManager;
  int v4 = self->_centralManager;
  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x263EFEF00]);
    dispatchQueue = self->_dispatchQueue;
    uint64_t v16 = *MEMORY[0x263EFED20];
    v17[0] = MEMORY[0x263EFFA88];
    id v7 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    int v4 = (CBCentralManager *)[v5 initWithDelegate:self queue:dispatchQueue options:v7];

    if (!v4)
    {
      BTErrorF();
      int v4 = (CBCentralManager *)objc_claimAutoreleasedReturnValue();
      [(BTAirPodsControlServiceClient *)self _reportError:v4];
      BOOL v12 = 0;
      goto LABEL_14;
    }
    objc_storeStrong((id *)p_centralManager, v4);
  }
  id v8 = self->_airpodsCaseControlServiceUUID;
  if (v8) {
    goto LABEL_7;
  }
  uint64_t v9 = [MEMORY[0x263EFEF88] UUIDWithString:@"2EE26CD4-C04E-41CE-905A-B4054F5D1770"];
  if (v9)
  {
    id v8 = v9;
    objc_storeStrong((id *)&self->_airpodsCaseControlServiceUUID, v9);
LABEL_7:
    uint64_t v10 = self->_airpodsCaseControlCharacteristicUUID;
    if (v10)
    {
      dispatch_source_t v11 = v10;
      BOOL v12 = 1;
    }
    else
    {
      v13 = [MEMORY[0x263EFEF88] UUIDWithString:@"71060001-413A-41EA-AF86-8CECFA21D057"];
      BOOL v12 = v13 != 0;
      if (v13)
      {
        dispatch_source_t v11 = v13;
        airpodsCaseControlCharacteristicUUID = self->_airpodsCaseControlCharacteristicUUID;
        self->_airpodsCaseControlCharacteristicUUID = v11;
      }
      else
      {
        airpodsCaseControlCharacteristicUUID = BTErrorF();
        [(BTAirPodsControlServiceClient *)self _reportError:airpodsCaseControlCharacteristicUUID, @"71060001-413A-41EA-AF86-8CECFA21D057"];
        dispatch_source_t v11 = 0;
      }
    }
    goto LABEL_13;
  }
  BTErrorF();
  id v8 = (CBUUID *)objc_claimAutoreleasedReturnValue();
  [(BTAirPodsControlServiceClient *)self _reportError:v8, @"2EE26CD4-C04E-41CE-905A-B4054F5D1770"];
  BOOL v12 = 0;
LABEL_13:

LABEL_14:
  return v12;
}

- (BOOL)_runConnectStart
{
  v23[1] = *MEMORY[0x263EF8340];
  peerDevice = self->_peerDevice;
  if (peerDevice)
  {
    int v4 = [(CBDevice *)peerDevice identifier];
    if (!v4)
    {
LABEL_3:
      BTErrorF();
      int v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      [(BTAirPodsControlServiceClient *)self _reportError:v4];
LABEL_23:

      return 0;
    }
LABEL_6:
    uint64_t v6 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v4];
    if (v6)
    {
      id v7 = (void *)v6;
      centralManager = self->_centralManager;
      v23[0] = v6;
      uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
      uint64_t v10 = [(CBCentralManager *)centralManager retrievePeripheralsWithIdentifiers:v9];
      dispatch_source_t v11 = [v10 firstObject];

      if (v11)
      {
        objc_storeStrong((id *)&self->_peerUUID, v7);
        objc_storeStrong((id *)&self->_peripheral, v11);
        [(CBPeripheral *)self->_peripheral setDelegate:self];
        if (gLogCategory_BTAirPodsControlServiceClient <= 30
          && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
        {
          peerUUID = self->_peerUUID;
          LogPrintF_safe();
        }
        -[CBCentralManager connectPeripheral:options:](self->_centralManager, "connectPeripheral:options:", self->_peripheral, 0, peerUUID);

        return 1;
      }
      v19 = BTErrorF();
      -[BTAirPodsControlServiceClient _reportError:](self, "_reportError:", v19, v7);
    }
    else
    {
      id v7 = BTErrorF();
      -[BTAirPodsControlServiceClient _reportError:](self, "_reportError:", v7, v4);
    }

    goto LABEL_23;
  }
  deviceUUID = self->_deviceUUID;
  if (deviceUUID)
  {
    int v4 = deviceUUID;
    goto LABEL_6;
  }
  deviceSN = self->_deviceSN;
  if (!deviceSN)
  {
    if (!self->_peerUUID) {
      goto LABEL_3;
    }
    return 1;
  }
  uint64_t v15 = [(NSString *)deviceSN dataUsingEncoding:4];
  if (!v15) {
    goto LABEL_3;
  }
  uint64_t v16 = (void *)v15;
  uint64_t v22 = v15;
  BOOL v12 = 1;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
  v18 = self->_centralManager;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __49__BTAirPodsControlServiceClient__runConnectStart__block_invoke;
  v21[3] = &unk_2644A0E88;
  v21[4] = self;
  [(CBCentralManager *)v18 retrievePeripheralsWithFindMySerialNumbers:v17 completion:v21];

  return v12;
}

void __49__BTAirPodsControlServiceClient__runConnectStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v17 = v3;
  if (gLogCategory_BTAirPodsControlServiceClient <= 30)
  {
    if (gLogCategory_BTAirPodsControlServiceClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v17, v4))
    {
      uint64_t v14 = [v3 count];
      LogPrintF_safe();
      id v3 = v17;
    }
  }
  uint64_t v5 = objc_msgSend(v3, "firstObject", v14);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v5;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "setDelegate:");
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 64) identifier];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 56);
  *(void *)(v9 + 56) = v8;

  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(v11 + 56);
  if (v12)
  {
    if (gLogCategory_BTAirPodsControlServiceClient <= 30)
    {
      if (gLogCategory_BTAirPodsControlServiceClient != -1)
      {
LABEL_8:
        uint64_t v16 = v12;
        LogPrintF_safe();
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "connectPeripheral:options:", *(void *)(*(void *)(a1 + 32) + 64), 0, v16);
        goto LABEL_14;
      }
      int v13 = _LogCategory_Initialize();
      uint64_t v11 = *(void *)(a1 + 32);
      if (v13)
      {
        uint64_t v12 = *(void *)(v11 + 56);
        goto LABEL_8;
      }
    }
    objc_msgSend(*(id *)(v11 + 40), "connectPeripheral:options:", *(void *)(v11 + 64), 0, v15);
  }
  else if (gLogCategory_BTAirPodsControlServiceClient <= 90 {
         && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
LABEL_14:
}

- (BOOL)_runDiscoverServicesStart
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = self->_peripheral;
  if (v3)
  {
    int v4 = self->_airpodsCaseControlServiceUUID;
    uint64_t v5 = v4;
    BOOL v6 = v4 != 0;
    if (v4)
    {
      v14[0] = v4;
      id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
      if (gLogCategory_BTAirPodsControlServiceClient <= 30
        && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
      {
        uint64_t v8 = [(CBPeripheral *)v3 identifier];
        CUPrintNSObjectOneLine();
        v13 = uint64_t v12 = v8;
        LogPrintF_safe();
      }
      -[CBPeripheral discoverServices:](v3, "discoverServices:", v7, v12, v13);
    }
    else
    {
      uint64_t v11 = BTErrorF();
      [(BTAirPodsControlServiceClient *)self _reportError:v11];
    }
  }
  else
  {
    uint64_t v10 = BTErrorF();
    [(BTAirPodsControlServiceClient *)self _reportError:v10];

    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_runDiscoverCharacteristicsStart
{
  v18[1] = *MEMORY[0x263EF8340];
  id v3 = self->_peripheral;
  if (v3)
  {
    int v4 = self->_airpodsCaseControlServiceObj;
    if (v4)
    {
      uint64_t v5 = self->_airpodsCaseControlCharacteristicUUID;
      BOOL v6 = v5;
      BOOL v7 = v5 != 0;
      if (v5)
      {
        v18[0] = v5;
        uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
        if (gLogCategory_BTAirPodsControlServiceClient <= 30
          && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
        {
          uint64_t v9 = [(CBPeripheral *)v3 identifier];
          uint64_t v10 = [(CBService *)v4 UUID];
          CUPrintNSObjectOneLine();
          v17 = uint64_t v16 = v10;
          uint64_t v15 = v9;
          LogPrintF_safe();
        }
        -[CBPeripheral discoverCharacteristics:forService:](v3, "discoverCharacteristics:forService:", v8, v4, v15, v16, v17);
      }
      else
      {
        uint64_t v14 = BTErrorF();
        [(BTAirPodsControlServiceClient *)self _reportError:v14];
      }
    }
    else
    {
      int v13 = BTErrorF();
      [(BTAirPodsControlServiceClient *)self _reportError:v13];

      BOOL v7 = 0;
    }
  }
  else
  {
    uint64_t v12 = BTErrorF();
    [(BTAirPodsControlServiceClient *)self _reportError:v12];

    BOOL v7 = 0;
  }

  return v7;
}

- (void)_runProcessRequests
{
  p_requestCurrent = &self->_requestCurrent;
  if (!self->_requestCurrent)
  {
    int v4 = [(NSMutableArray *)self->_requestArray popFirstObject];
    uint64_t v5 = v4;
    if (v4)
    {
      BOOL v6 = v4;
      objc_storeStrong((id *)p_requestCurrent, v4);
      int v4 = (void *)[(BTAirPodsControlServiceClient *)self _runProcessRequest:v6];
      uint64_t v5 = v6;
    }
    MEMORY[0x270F9A758](v4, v5);
  }
}

- (void)_runProcessRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_peripheral;
  if (!v5)
  {
    BTErrorF();
    BOOL v6 = (CBCharacteristic *)objc_claimAutoreleasedReturnValue();
    [(BTAirPodsControlServiceClient *)self _completeRequest:v4 error:v6];
    goto LABEL_18;
  }
  BOOL v6 = self->_airpodsCaseControlCharacteristicObj;
  if (!v6)
  {
    uint64_t v12 = BTErrorF();
    [(BTAirPodsControlServiceClient *)self _completeRequest:v4 error:v12];

    goto LABEL_18;
  }
  BOOL v7 = [v4 getHandler];

  if (v7)
  {
    __int16 v19 = 513;
    char v20 = 8;
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v19 length:3];
    if (gLogCategory_BTAirPodsControlServiceClient > 30
      || gLogCategory_BTAirPodsControlServiceClient == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_17;
    }
    uint64_t v9 = [(CBPeripheral *)v5 identifier];
    CUPrintNSDataHex();
    uint64_t v10 = (char *)objc_claimAutoreleasedReturnValue();
    int v13 = v9;
    uint64_t v14 = v10;
  }
  else
  {
    __int16 v16 = 1;
    char v17 = 8;
    char v18 = [v4 enabled];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v16 length:4];
    if (gLogCategory_BTAirPodsControlServiceClient > 30
      || gLogCategory_BTAirPodsControlServiceClient == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_17;
    }
    uint64_t v9 = [(CBPeripheral *)v5 identifier];
    if ([v4 enabled]) {
      uint64_t v11 = "yes";
    }
    else {
      uint64_t v11 = "no";
    }
    CUPrintNSDataHex();
    uint64_t v10 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = v11;
    uint64_t v15 = v10;
    int v13 = v9;
  }
  LogPrintF_safe();

LABEL_17:
  -[CBPeripheral writeValue:forCharacteristic:type:](v5, "writeValue:forCharacteristic:type:", v8, v6, 0, v13, v14, v15);

LABEL_18:
}

- (void)centralManagerDidUpdateState:(id)a3
{
  if (!self->_invalidateCalled)
  {
    uint64_t v4 = [a3 state];
    if (gLogCategory_BTAirPodsControlServiceClient <= 30
      && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    if (v4 == 1 || v4 == 4)
    {
      BTErrorF();
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      [(BTAirPodsControlServiceClient *)self _reportError:v5];
    }
    else if (v4 == 5)
    {
      [(BTAirPodsControlServiceClient *)self _run];
    }
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  if (!self->_invalidateCalled)
  {
    objc_msgSend(a4, "identifier", a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if ([v6 isEqual:self->_peerUUID])
    {
      if (gLogCategory_BTAirPodsControlServiceClient <= 30
        && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
      {
        id v5 = v6;
        LogPrintF_safe();
      }
      self->_connected = 1;
      [(BTAirPodsControlServiceClient *)self _run];
    }
    else if (gLogCategory_BTAirPodsControlServiceClient <= 60 {
           && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF_safe();
    }
  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v7 = a5;
  if (!self->_invalidateCalled)
  {
    id v11 = v7;
    uint64_t v8 = [a4 identifier];
    if ([v8 isEqual:self->_peerUUID])
    {
      if (gLogCategory_BTAirPodsControlServiceClient <= 90
        && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
      {
        uint64_t v10 = CUPrintNSError();
        LogPrintF_safe();
      }
      if (v11)
      {
        -[BTAirPodsControlServiceClient _reportError:](self, "_reportError:");
      }
      else
      {
        uint64_t v9 = BTErrorF();
        [(BTAirPodsControlServiceClient *)self _reportError:v9];
      }
    }
    else if (gLogCategory_BTAirPodsControlServiceClient <= 60 {
           && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF_safe();
    }

    id v7 = v11;
  }
}

- (void)centralManager:(id)a3 didUpdateFindMyPeripherals:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (gLogCategory_BTAirPodsControlServiceClient <= 30
    && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 identifier];
  if ([v6 isEqual:self->_peerUUID])
  {
    [v5 services];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
        int v13 = [v12 UUID];
        char v14 = [v13 isEqual:self->_airpodsCaseControlServiceUUID];

        if (v14) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      __int16 v16 = v12;

      if (!v16) {
        goto LABEL_11;
      }
      if (gLogCategory_BTAirPodsControlServiceClient <= 30
        && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
      {
        char v18 = CUPrintNSObjectOneLine();
        LogPrintF_safe();
      }
      airpodsCaseControlServiceObj = self->_airpodsCaseControlServiceObj;
      self->_airpodsCaseControlServiceObj = v16;
      uint64_t v15 = v16;

      [(BTAirPodsControlServiceClient *)self _run];
    }
    else
    {
LABEL_10:

LABEL_11:
      if (gLogCategory_BTAirPodsControlServiceClient > 60
        || gLogCategory_BTAirPodsControlServiceClient == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_21;
      }
      CUPrintNSObjectOneLine();
      uint64_t v15 = (CBService *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

LABEL_21:
    goto LABEL_22;
  }
  if (gLogCategory_BTAirPodsControlServiceClient <= 60
    && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_22:
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 identifier];
  if ([v9 isEqual:self->_peerUUID])
  {
    uint64_t v10 = [v8 UUID];
    if (([v10 isEqual:self->_airpodsCaseControlServiceUUID] & 1) == 0)
    {
      if (gLogCategory_BTAirPodsControlServiceClient <= 60
        && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      goto LABEL_23;
    }
    v25 = v10;
    v26 = v9;
    id v11 = v7;
    id v12 = v8;
    [v8 characteristics];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v28;
LABEL_5:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        char v18 = *(void **)(*((void *)&v27 + 1) + 8 * v17);
        long long v19 = [v18 UUID];
        char v20 = [v19 isEqual:self->_airpodsCaseControlCharacteristicUUID];

        if (v20) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v15) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
      long long v22 = v18;

      if (!v22) {
        goto LABEL_12;
      }
      id v7 = v11;
      id v8 = v12;
      uint64_t v10 = v25;
      uint64_t v9 = v26;
      if (gLogCategory_BTAirPodsControlServiceClient <= 30
        && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
      {
        uint64_t v24 = [(CBCharacteristic *)v22 UUID];
        LogPrintF_safe();
      }
      airpodsCaseControlCharacteristicObj = self->_airpodsCaseControlCharacteristicObj;
      self->_airpodsCaseControlCharacteristicObj = v22;
      long long v21 = v22;

      [v7 setNotifyValue:1 forCharacteristic:v21];
      [(BTAirPodsControlServiceClient *)self _run];
    }
    else
    {
LABEL_11:

LABEL_12:
      id v7 = v11;
      id v8 = v12;
      uint64_t v10 = v25;
      uint64_t v9 = v26;
      if (gLogCategory_BTAirPodsControlServiceClient > 60
        || gLogCategory_BTAirPodsControlServiceClient == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_22;
      }
      CUPrintNSObjectOneLine();
      long long v21 = (CBCharacteristic *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

LABEL_22:
LABEL_23:

    goto LABEL_24;
  }
  if (gLogCategory_BTAirPodsControlServiceClient <= 60
    && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_24:
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  if (gLogCategory_BTAirPodsControlServiceClient <= 30
    && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = [v12 identifier];
    uint64_t v10 = [v7 UUID];
    id v11 = CUPrintNSError();
    LogPrintF_safe();
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v25 = a4;
  id v7 = [a3 identifier];
  if ([v7 isEqual:self->_peerUUID])
  {
    id v8 = [v25 UUID];
    if (([v8 isEqual:self->_airpodsCaseControlCharacteristicUUID] & 1) == 0)
    {
      if (gLogCategory_BTAirPodsControlServiceClient <= 60
        && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      goto LABEL_19;
    }
    uint64_t v9 = self->_requestCurrent;
    if (!v9)
    {
      if (gLogCategory_BTAirPodsControlServiceClient <= 30
        && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      goto LABEL_18;
    }
    uint64_t v10 = [v25 value];
    id v11 = (void *)[v10 copy];

    if (gLogCategory_BTAirPodsControlServiceClient <= 30
      && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSDataHex();
      uint64_t v24 = v23 = v8;
      long long v21 = v7;
      LogPrintF_safe();
    }
    id v12 = v11;
    uint64_t v13 = [v12 bytes];
    uint64_t v14 = [v12 length];
    if (v14 > 2)
    {
      unint64_t v15 = v14;
      uint64_t v16 = (void *)*(unsigned __int16 *)(v13 + 1);
      uint64_t v17 = [(BTAirPodsControlRequest *)v9 getHandler];

      if (v17)
      {
        if (v16 == 2051)
        {
          if (v15 > 3)
          {
            -[BTAirPodsControlRequest setEnabled:](v9, "setEnabled:", *(unsigned char *)(v13 + 3) != 0, v21, v23, v24);
LABEL_16:
            -[BTAirPodsControlServiceClient _completeRequest:error:](self, "_completeRequest:error:", v9, 0, v21);
LABEL_17:

LABEL_18:
LABEL_19:

            goto LABEL_20;
          }
          goto LABEL_36;
        }
        goto LABEL_33;
      }
      if (v16 != 2049)
      {
LABEL_33:
        long long v19 = CUPrintNSDataHex();
        long long v22 = v16;
        goto LABEL_37;
      }
      if (v15 > 4)
      {
        char v18 = (void *)*(unsigned __int16 *)(v13 + 3);
        if (!*(_WORD *)(v13 + 3)) {
          goto LABEL_16;
        }
        long long v19 = CUPrintNSDataHex();
        long long v22 = v18;
LABEL_37:
        char v20 = CBErrorF();
        -[BTAirPodsControlServiceClient _completeRequest:error:](self, "_completeRequest:error:", v9, v20, v22);

        goto LABEL_17;
      }
    }
LABEL_36:
    long long v19 = CUPrintNSDataHex();
    long long v22 = v19;
    goto LABEL_37;
  }
  if (gLogCategory_BTAirPodsControlServiceClient <= 60
    && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_20:
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v9 = a4;
  id v7 = [a3 identifier];
  if ([v7 isEqual:self->_peerUUID])
  {
    id v8 = [v9 UUID];
    if ([v8 isEqual:self->_airpodsCaseControlCharacteristicUUID])
    {
      if (gLogCategory_BTAirPodsControlServiceClient > 30
        || gLogCategory_BTAirPodsControlServiceClient == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_7;
      }
    }
    else if (gLogCategory_BTAirPodsControlServiceClient > 60 {
           || gLogCategory_BTAirPodsControlServiceClient == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_7;
    }
    LogPrintF_safe();
LABEL_7:

    goto LABEL_8;
  }
  if (gLogCategory_BTAirPodsControlServiceClient <= 60
    && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_8:
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (CBDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
}

- (NSString)deviceSN
{
  return self->_deviceSN;
}

- (void)setDeviceSN:(id)a3
{
}

- (NSString)deviceUUID
{
  return self->_deviceUUID;
}

- (void)setDeviceUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_deviceSN, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_requestCurrent, 0);
  objc_storeStrong((id *)&self->_requestArray, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_peerUUID, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_airpodsCaseControlServiceUUID, 0);
  objc_storeStrong((id *)&self->_airpodsCaseControlServiceObj, 0);
  objc_storeStrong((id *)&self->_airpodsCaseControlCharacteristicUUID, 0);
  objc_storeStrong((id *)&self->_airpodsCaseControlCharacteristicObj, 0);
}

@end