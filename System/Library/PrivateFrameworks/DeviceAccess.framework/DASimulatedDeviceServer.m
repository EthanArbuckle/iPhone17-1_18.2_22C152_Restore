@interface DASimulatedDeviceServer
- (DASimulatedDeviceServer)init;
- (NSString)deviceBonjourServiceType;
- (NSString)deviceIdentitifer;
- (NSString)deviceName;
- (OS_dispatch_queue)dispatchQueue;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (void)_activate;
- (void)_connectionAccept:(id)a3;
- (void)_connectionEnded:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)activate;
- (void)invalidate;
- (void)setDeviceBonjourServiceType:(id)a3;
- (void)setDeviceIdentitifer:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation DASimulatedDeviceServer

- (DASimulatedDeviceServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)DASimulatedDeviceServer;
  v2 = [(DASimulatedDeviceServer *)&v6 init];
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
  return [(DASimulatedDeviceServer *)self descriptionWithLevel:50];
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
  if (!self->_deviceBonjourServiceType)
  {
    self->_deviceBonjourServiceType = (NSString *)@"_deviceaccess._udp";
  }
  if (!self->_deviceIdentitifer)
  {
    id v3 = NSRandomData();
    CUPrintNSDataAddress();
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    deviceIdentitifer = self->_deviceIdentitifer;
    self->_deviceIdentitifer = v4;
  }
  if (!self->_deviceName)
  {
    arc4random();
    NSPrintF();
    objc_super v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    deviceName = self->_deviceName;
    self->_deviceName = v6;
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__DASimulatedDeviceServer_activate__block_invoke;
  block[3] = &unk_264520440;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__DASimulatedDeviceServer_activate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 8) = 1;
    if (gLogCategory_DASimulatedDeviceServer <= 30
      && (gLogCategory_DASimulatedDeviceServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = *(void **)(v2 + 32);
    return [v3 _activate];
  }
  return result;
}

- (void)_activate
{
  p_bonjourAdvertiser = &self->_bonjourAdvertiser;
  v4 = self->_bonjourAdvertiser;
  if (!v4)
  {
    v4 = (CUBonjourAdvertiser *)objc_alloc_init(MEMORY[0x263F38530]);
    objc_storeStrong((id *)p_bonjourAdvertiser, v4);
    [(CUBonjourAdvertiser *)v4 setDispatchQueue:self->_dispatchQueue];
    [(CUBonjourAdvertiser *)v4 setDomain:@"local."];
    [(CUBonjourAdvertiser *)v4 setLabel:self->_deviceIdentitifer];
    [(CUBonjourAdvertiser *)v4 setName:self->_deviceName];
    [(CUBonjourAdvertiser *)v4 setServiceType:self->_deviceBonjourServiceType];
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    objc_super v6 = v5;
    deviceIdentitifer = self->_deviceIdentitifer;
    if (deviceIdentitifer) {
      [v5 setObject:deviceIdentitifer forKeyedSubscript:@"rpBA"];
    }
    [(CUBonjourAdvertiser *)v4 setTxtDictionary:v6];
  }
  p_tcpServer = &self->_tcpServer;
  v9 = self->_tcpServer;
  if (!v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x263F385E8]);
    objc_storeStrong((id *)&self->_tcpServer, v10);
    [v10 setBonjourAdvertiser:v4];
    [v10 setDispatchQueue:self->_dispatchQueue];
    [v10 setLabel:self->_deviceIdentitifer];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __36__DASimulatedDeviceServer__activate__block_invoke;
    v16[3] = &unk_264520A78;
    v9 = (CUTCPServer *)v10;
    v17 = v9;
    v18 = self;
    [(CUTCPServer *)v9 setConnectionStartedHandler:v16];
    tcpServer = self->_tcpServer;
    id v15 = 0;
    [(CUTCPServer *)tcpServer activateDirectAndReturnError:&v15];
    id v12 = v15;
    if (v12)
    {
      if (gLogCategory_DASimulatedDeviceServer <= 90
        && (gLogCategory_DASimulatedDeviceServer != -1 || _LogCategory_Initialize()))
      {
        v14 = CUPrintNSError();
        LogPrintF();
      }
      [(CUTCPServer *)*p_tcpServer invalidate];
      v13 = *p_tcpServer;
      *p_tcpServer = 0;
    }
  }
}

void *__36__DASimulatedDeviceServer__activate__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v3 == result[5]) {
    return (void *)[result _connectionAccept:a2];
  }
  return result;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__DASimulatedDeviceServer_invalidate__block_invoke;
  block[3] = &unk_264520440;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__DASimulatedDeviceServer_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    if (gLogCategory_DASimulatedDeviceServer <= 30
      && (gLogCategory_DASimulatedDeviceServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = *(void **)(v2 + 32);
    return [v3 _invalidate];
  }
  return result;
}

- (void)_invalidate
{
  [(CUBonjourAdvertiser *)self->_bonjourAdvertiser invalidate];
  bonjourAdvertiser = self->_bonjourAdvertiser;
  self->_bonjourAdvertiser = 0;

  [(CUTCPServer *)self->_tcpServer invalidate];
  tcpServer = self->_tcpServer;
  self->_tcpServer = 0;

  [(DASimulatedDeviceServer *)self _invalidated];
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    if (gLogCategory_DASimulatedDeviceServer <= 30
      && (gLogCategory_DASimulatedDeviceServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_connectionAccept:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __45__DASimulatedDeviceServer__connectionAccept___block_invoke;
  id v12 = &unk_264520418;
  v13 = self;
  id v5 = v4;
  id v14 = v5;
  [v5 setInvalidationHandler:&v9];
  tcpConnections = self->_tcpConnections;
  if (!tcpConnections)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    v8 = self->_tcpConnections;
    self->_tcpConnections = v7;

    tcpConnections = self->_tcpConnections;
  }
  -[NSMutableSet addObject:](tcpConnections, "addObject:", v5, v9, v10, v11, v12, v13);
}

uint64_t __45__DASimulatedDeviceServer__connectionAccept___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectionEnded:*(void *)(a1 + 40)];
}

- (void)_connectionEnded:(id)a3
{
}

- (NSString)deviceBonjourServiceType
{
  return self->_deviceBonjourServiceType;
}

- (void)setDeviceBonjourServiceType:(id)a3
{
}

- (NSString)deviceIdentitifer
{
  return self->_deviceIdentitifer;
}

- (void)setDeviceIdentitifer:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceIdentitifer, 0);
  objc_storeStrong((id *)&self->_deviceBonjourServiceType, 0);
  objc_storeStrong((id *)&self->_tcpServer, 0);
  objc_storeStrong((id *)&self->_tcpConnections, 0);

  objc_storeStrong((id *)&self->_bonjourAdvertiser, 0);
}

@end