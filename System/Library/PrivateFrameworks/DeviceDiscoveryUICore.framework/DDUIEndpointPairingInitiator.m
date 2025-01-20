@interface DDUIEndpointPairingInitiator
- (DDUIEndpointPairingBrowsingTransport)transport;
- (NSArray)availableDevices;
- (id)availableDevicesChangedHandler;
- (id)initForDeviceTypes:(unsigned int)a3 withTransport:(id)a4;
- (id)pairingSessionForDevice:(id)a3 bundleID:(id)a4 serviceIdentifier:(id)a5 error:(id *)a6;
- (unsigned)acceptedDeviceTypes;
- (void)beginWithCompletion:(id)a3;
- (void)invalidate;
- (void)setAcceptedDeviceTypes:(unsigned int)a3;
- (void)setAvailableDevicesChangedHandler:(id)a3;
- (void)setTransport:(id)a3;
@end

@implementation DDUIEndpointPairingInitiator

- (id)initForDeviceTypes:(unsigned int)a3 withTransport:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DDUIEndpointPairingInitiator;
  v8 = [(DDUIEndpointPairingInitiator *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_acceptedDeviceTypes = a3;
    objc_storeStrong((id *)&v8->_transport, a4);
    v10 = _DDUICoreLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = DDUIDeviceTypeString(a3);
      *(_DWORD *)buf = 134218498;
      v15 = v9;
      __int16 v16 = 2112;
      v17 = v11;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1CFC71000, v10, OS_LOG_TYPE_DEFAULT, "-[DDUIEndpointPairingInitiator init] {self: %p, deviceTypes: %@, transport: %@}", buf, 0x20u);
    }
  }

  return v9;
}

- (void)setAvailableDevicesChangedHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_availableDevicesChangedHandler != v4)
  {
    v5 = _DDUICoreLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x1D25DB000](v4);
      int v9 = 134218242;
      v10 = self;
      __int16 v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1CFC71000, v5, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingInitiator set devices changed handler {self: %p, availableDevicesChangedHandler: %@}", (uint8_t *)&v9, 0x16u);
    }
    id v7 = (void *)MEMORY[0x1D25DB000](v4);
    id availableDevicesChangedHandler = self->_availableDevicesChangedHandler;
    self->_id availableDevicesChangedHandler = v7;

    [(DDUIEndpointPairingBrowsingTransport *)self->_transport setAvailableDevicesChangedHandler:v4];
  }
}

- (NSArray)availableDevices
{
  return (NSArray *)[(DDUIEndpointPairingBrowsingTransport *)self->_transport availableDevices];
}

- (void)beginWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _DDUICoreLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x1D25DB000](v4);
    int v7 = 134218242;
    v8 = self;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1CFC71000, v5, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingInitiator beginning {self: %p, completion: %@}", (uint8_t *)&v7, 0x16u);
  }
  [(DDUIEndpointPairingBrowsingTransport *)self->_transport activateForDeviceTypes:self->_acceptedDeviceTypes withCompletion:v4];
}

- (id)pairingSessionForDevice:(id)a3 bundleID:(id)a4 serviceIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  transport = self->_transport;
  id v20 = 0;
  v12 = [(DDUIEndpointPairingBrowsingTransport *)transport sessionForDevice:v10 bundleID:a4 serviceIdentifier:a5 error:&v20];
  id v13 = v20;
  v14 = v13;
  if (v12) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15)
  {
    __int16 v18 = _DDUICoreLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v22 = self;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl(&dword_1CFC71000, v18, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingInitiator creating pairing session {self: %p, device: %@}", buf, 0x16u);
    }

    v17 = [[DDUIEndpointPairingSession alloc] initWithTransportSession:v12 mode:0];
  }
  else
  {
    if (a6) {
      *a6 = v13;
    }
    __int16 v16 = _DDUICoreLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v22 = self;
      __int16 v23 = 2112;
      id v24 = v14;
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_impl(&dword_1CFC71000, v16, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingInitiator failed to creater a pairing session {self: %p, sessionCreationError: %@, device: %@}", buf, 0x20u);
    }

    v17 = 0;
  }

  return v17;
}

- (void)invalidate
{
  [(DDUIEndpointPairingBrowsingTransport *)self->_transport invalidate];
  transport = self->_transport;
  self->_transport = 0;
}

- (id)availableDevicesChangedHandler
{
  return self->_availableDevicesChangedHandler;
}

- (unsigned)acceptedDeviceTypes
{
  return self->_acceptedDeviceTypes;
}

- (void)setAcceptedDeviceTypes:(unsigned int)a3
{
  self->_acceptedDeviceTypes = a3;
}

- (DDUIEndpointPairingBrowsingTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong(&self->_availableDevicesChangedHandler, 0);
}

@end