@interface DASimulatedDeviceDiscovery
- (DASimulatedDeviceDiscovery)init;
- (NSString)deviceBonjourServiceType;
- (OS_dispatch_queue)dispatchQueue;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)eventHandler;
- (void)_activate;
- (void)_bluetoothEnsureStarted;
- (void)_bluetoothEnsureStopped;
- (void)_bluetoothFoundDevice:(id)a3;
- (void)_bluetoothLostDevice:(id)a3;
- (void)_bonjourEnsureStarted;
- (void)_bonjourEnsureStopped;
- (void)_bonjourFoundDevice:(id)a3;
- (void)_bonjourLostDevice:(id)a3;
- (void)_invalidated;
- (void)activate;
- (void)invalidate;
- (void)setDeviceBonjourServiceType:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEventHandler:(id)a3;
@end

@implementation DASimulatedDeviceDiscovery

- (DASimulatedDeviceDiscovery)init
{
  v6.receiver = self;
  v6.super_class = (Class)DASimulatedDeviceDiscovery;
  v2 = [(DASimulatedDeviceDiscovery *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v4 = v3;
  }

  return v3;
}

- (id)description
{
  return [(DASimulatedDeviceDiscovery *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  objc_opt_class();
  NSAppendPrintF();
  id v3 = 0;

  return v3;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__DASimulatedDeviceDiscovery_activate__block_invoke;
  block[3] = &unk_264520440;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__DASimulatedDeviceDiscovery_activate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 8) = 1;
    CFStringGetTypeID();
    uint64_t v3 = CFPrefs_CopyTypedValue();
    uint64_t v4 = *(void *)(v2 + 32);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    if (gLogCategory_DASimulatedDeviceDiscovery <= 30
      && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_super v6 = *(void **)(v2 + 32);
    return [v6 _activate];
  }
  return result;
}

- (void)_activate
{
  [(DASimulatedDeviceDiscovery *)self _bluetoothEnsureStarted];

  [(DASimulatedDeviceDiscovery *)self _bonjourEnsureStarted];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__DASimulatedDeviceDiscovery_invalidate__block_invoke;
  block[3] = &unk_264520440;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __40__DASimulatedDeviceDiscovery_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 32))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 32) = 1;
    if (gLogCategory_DASimulatedDeviceDiscovery <= 30
      && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = *(void *)(v2 + 32);
      LogPrintF();
    }
    objc_msgSend(*(id *)(v2 + 32), "_bluetoothEnsureStopped", v4);
    [*(id *)(v2 + 32) _bonjourEnsureStopped];
    uint64_t v3 = *(void **)(v2 + 32);
    return [v3 _invalidated];
  }
  return result;
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    id eventHandler = self->_eventHandler;
    self->_id eventHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_DASimulatedDeviceDiscovery <= 30
      && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_bluetoothEnsureStarted
{
  p_bluetoothScanner = &self->_bluetoothScanner;
  if (!self->_bluetoothScanner)
  {
    if (gLogCategory_DASimulatedDeviceDiscovery <= 30
      && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v4 = objc_alloc_init(getCBDiscoveryClass());
    objc_storeStrong((id *)p_bluetoothScanner, v4);
    [v4 setDiscoveryFlags:0x1000000800];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __53__DASimulatedDeviceDiscovery__bluetoothEnsureStarted__block_invoke;
    v11[3] = &unk_2645209F8;
    id v5 = v4;
    id v12 = v5;
    v13 = self;
    [v5 setDeviceFoundHandler:v11];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __53__DASimulatedDeviceDiscovery__bluetoothEnsureStarted__block_invoke_2;
    v8[3] = &unk_2645209F8;
    id v9 = v5;
    v10 = self;
    id v6 = v5;
    [v6 setDeviceLostHandler:v8];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __53__DASimulatedDeviceDiscovery__bluetoothEnsureStarted__block_invoke_3;
    v7[3] = &unk_264520820;
    v7[4] = self;
    [v6 activateWithCompletion:v7];
  }
}

void *__53__DASimulatedDeviceDiscovery__bluetoothEnsureStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v3 == result[2]) {
    return (void *)[result _bluetoothFoundDevice:a2];
  }
  return result;
}

void *__53__DASimulatedDeviceDiscovery__bluetoothEnsureStarted__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v3 == result[2]) {
    return (void *)[result _bluetoothFoundDevice:a2];
  }
  return result;
}

void __53__DASimulatedDeviceDiscovery__bluetoothEnsureStarted__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v7 = v3;
    if (gLogCategory_DASimulatedDeviceDiscovery <= 90
      && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      id v6 = CUPrintNSError();
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "invalidate", v6);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = 0;

    id v3 = v7;
  }
}

- (void)_bluetoothEnsureStopped
{
  if (self->_bluetoothScanner)
  {
    if (gLogCategory_DASimulatedDeviceDiscovery <= 30
      && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(CBDiscovery *)self->_bluetoothScanner invalidate];
    bluetoothScanner = self->_bluetoothScanner;
    self->_bluetoothScanner = 0;
  }
}

- (void)_bluetoothFoundDevice:(id)a3
{
  id v14 = a3;
  uint64_t v4 = objc_alloc_init(DADevice);
  id v5 = [v14 identifier];
  [(DADevice *)v4 setIdentifier:v5];

  id v6 = [v14 name];
  if (v6)
  {
    [(DADevice *)v4 setName:v6];
  }
  else
  {
    id v7 = [NSString alloc];
    v8 = [v14 identifier];
    id v9 = CUPrintNSObject();
    v10 = (void *)[v7 initWithFormat:@"Unknown device %@", v9];
    [(DADevice *)v4 setName:v10];
  }
  v11 = [(DAEventDevice *)[DADeviceEvent alloc] initWithEventType:40 device:v4];
  if (gLogCategory_DASimulatedDeviceDiscovery <= 30
    && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v12 = _Block_copy(self->_eventHandler);
  v13 = v12;
  if (v12) {
    (*((void (**)(void *, DADeviceEvent *))v12 + 2))(v12, v11);
  }
}

- (void)_bluetoothLostDevice:(id)a3
{
  id v14 = a3;
  uint64_t v4 = objc_alloc_init(DADevice);
  id v5 = [v14 identifier];
  [(DADevice *)v4 setIdentifier:v5];

  id v6 = [v14 name];
  if (v6)
  {
    [(DADevice *)v4 setName:v6];
  }
  else
  {
    id v7 = [NSString alloc];
    v8 = [v14 identifier];
    id v9 = CUPrintNSObject();
    v10 = (void *)[v7 initWithFormat:@"Unknown device %@", v9];
    [(DADevice *)v4 setName:v10];
  }
  v11 = [(DAEventDevice *)[DADeviceEvent alloc] initWithEventType:41 device:v4];
  if (gLogCategory_DASimulatedDeviceDiscovery <= 30
    && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v12 = _Block_copy(self->_eventHandler);
  v13 = v12;
  if (v12) {
    (*((void (**)(void *, DADeviceEvent *))v12 + 2))(v12, v11);
  }
}

- (void)_bonjourEnsureStarted
{
  p_bonjourBrowser = &self->_bonjourBrowser;
  if (!self->_bonjourBrowser)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F38538]);
    objc_storeStrong((id *)p_bonjourBrowser, v4);
    [v4 setChangeFlags:0xFFFFFFFFLL];
    [v4 setDispatchQueue:self->_dispatchQueue];
    [v4 setDomain:@"local."];
    id v5 = self->_deviceBonjourServiceType;
    if (!v5)
    {
      CFStringGetTypeID();
      id v5 = (__CFString *)CFPrefs_CopyTypedValue();
      if (!v5) {
        id v5 = @"_deviceaccess._udp";
      }
    }
    [v4 setServiceType:v5];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __51__DASimulatedDeviceDiscovery__bonjourEnsureStarted__block_invoke;
    v9[3] = &unk_264520A20;
    v9[4] = v4;
    v9[5] = self;
    [v4 setDeviceFoundHandler:v9];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__DASimulatedDeviceDiscovery__bonjourEnsureStarted__block_invoke_2;
    v8[3] = &unk_264520A20;
    void v8[4] = v4;
    v8[5] = self;
    [v4 setDeviceLostHandler:v8];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__DASimulatedDeviceDiscovery__bonjourEnsureStarted__block_invoke_3;
    v7[3] = &unk_264520A48;
    v7[4] = v4;
    void v7[5] = self;
    [v4 setDeviceChangedHandler:v7];
    if (gLogCategory_DASimulatedDeviceDiscovery <= 30
      && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      id v6 = v5;
      LogPrintF();
    }
    objc_msgSend(v4, "activate", v6);
  }
}

void *__51__DASimulatedDeviceDiscovery__bonjourEnsureStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v3 == result[3]) {
    return (void *)[result _bonjourFoundDevice:a2];
  }
  return result;
}

void *__51__DASimulatedDeviceDiscovery__bonjourEnsureStarted__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v3 == result[3]) {
    return (void *)[result _bonjourLostDevice:a2];
  }
  return result;
}

void *__51__DASimulatedDeviceDiscovery__bonjourEnsureStarted__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v3 == result[3]) {
    return (void *)[result _bonjourFoundDevice:a2];
  }
  return result;
}

- (void)_bonjourEnsureStopped
{
  if (self->_bonjourBrowser)
  {
    if (gLogCategory_DASimulatedDeviceDiscovery <= 30
      && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(CUBonjourBrowser *)self->_bonjourBrowser invalidate];
    bonjourBrowser = self->_bonjourBrowser;
    self->_bonjourBrowser = 0;
  }
}

- (void)_bonjourFoundDevice:(id)a3
{
  id v23 = a3;
  id v4 = objc_alloc_init(DADevice);
  id v5 = [v23 identifier];
  id v6 = [v5 UUIDString];
  [(DADevice *)v4 setIdentifier:v6];

  nameTXTKey = self->_nameTXTKey;
  if (!nameTXTKey
    || (v8 = nameTXTKey,
        [v23 txtDictionary],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [v9 objectForKeyedSubscript:v8],
        v10 = objc_claimAutoreleasedReturnValue(),
        v8,
        v9,
        !v10))
  {
    v10 = [v23 name];
  }
  [(DADevice *)v4 setName:v10];
  v11 = [v23 txtDictionary];
  if (v11)
  {
    id v12 = [MEMORY[0x263F08910] archivedDataWithRootObject:v11 requiringSecureCoding:0 error:0];
    [(DADevice *)v4 setTxtRecordData:v12];
  }
  [(DADevice *)v4 setProtocolType:*MEMORY[0x263F1DE80]];
  id v13 = [v23 name];
  uint64_t v14 = [v13 UTF8String];
  if (v14) {
    v15 = (const char *)v14;
  }
  else {
    v15 = "?";
  }
  id v16 = [(CUBonjourBrowser *)self->_bonjourBrowser serviceType];
  uint64_t v17 = [v16 UTF8String];
  if (v17) {
    v18 = (const char *)v17;
  }
  else {
    v18 = "_fake._tcp";
  }
  nw_endpoint_t bonjour_service = nw_endpoint_create_bonjour_service(v15, v18, "local");
  [(DADevice *)v4 setNetworkEndpoint:bonjour_service];

  v20 = [(DAEventDevice *)[DADeviceEvent alloc] initWithEventType:40 device:v4];
  if (gLogCategory_DASimulatedDeviceDiscovery <= 30
    && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v21 = _Block_copy(self->_eventHandler);
  v22 = v21;
  if (v21) {
    (*((void (**)(void *, DADeviceEvent *))v21 + 2))(v21, v20);
  }
}

- (void)_bonjourLostDevice:(id)a3
{
  id v13 = a3;
  id v4 = objc_alloc_init(DADevice);
  id v5 = [v13 identifier];
  id v6 = [v5 UUIDString];
  [(DADevice *)v4 setIdentifier:v6];

  id v7 = [v13 name];
  [(DADevice *)v4 setName:v7];

  v8 = [v13 txtDictionary];
  if (v8)
  {
    id v9 = [MEMORY[0x263F08910] archivedDataWithRootObject:v8 requiringSecureCoding:0 error:0];
    [(DADevice *)v4 setTxtRecordData:v9];
  }
  v10 = [(DAEventDevice *)[DADeviceEvent alloc] initWithEventType:41 device:v4];
  if (gLogCategory_DASimulatedDeviceDiscovery <= 30
    && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v11 = _Block_copy(self->_eventHandler);
  id v12 = v11;
  if (v11) {
    (*((void (**)(void *, DADeviceEvent *))v11 + 2))(v11, v10);
  }
}

- (NSString)deviceBonjourServiceType
{
  return self->_deviceBonjourServiceType;
}

- (void)setDeviceBonjourServiceType:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_deviceBonjourServiceType, 0);
  objc_storeStrong((id *)&self->_nameTXTKey, 0);
  objc_storeStrong((id *)&self->_bonjourBrowser, 0);

  objc_storeStrong((id *)&self->_bluetoothScanner, 0);
}

@end