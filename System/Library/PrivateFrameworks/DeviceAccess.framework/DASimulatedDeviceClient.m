@interface DASimulatedDeviceClient
- (DASimulatedDeviceClient)init;
- (NSString)deviceBonjourServiceType;
- (OS_dispatch_queue)dispatchQueue;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (void)_invalidated;
- (void)activate;
- (void)invalidate;
- (void)setDeviceBonjourServiceType:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation DASimulatedDeviceClient

- (DASimulatedDeviceClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)DASimulatedDeviceClient;
  v2 = [(DASimulatedDeviceClient *)&v6 init];
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
  return [(DASimulatedDeviceClient *)self descriptionWithLevel:50];
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
  block[2] = __35__DASimulatedDeviceClient_activate__block_invoke;
  block[3] = &unk_264520440;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__DASimulatedDeviceClient_activate__block_invoke()
{
  if (gLogCategory_DASimulatedDeviceClient <= 30)
  {
    if (gLogCategory_DASimulatedDeviceClient != -1) {
      return LogPrintF();
    }
    uint64_t result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__DASimulatedDeviceClient_invalidate__block_invoke;
  block[3] = &unk_264520440;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__DASimulatedDeviceClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 9))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 9) = 1;
    if (gLogCategory_DASimulatedDeviceClient <= 30
      && (gLogCategory_DASimulatedDeviceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = *(void **)(v2 + 32);
    return [v3 _invalidated];
  }
  return result;
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    if (gLogCategory_DASimulatedDeviceClient <= 30
      && (gLogCategory_DASimulatedDeviceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_deviceBonjourServiceType, 0);
}

@end