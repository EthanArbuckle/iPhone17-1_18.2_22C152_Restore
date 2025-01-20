@interface AVCustomDeviceRoute
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (DADevice)device;
- (NSUUID)bluetoothIdentifier;
- (id)description;
- (nw_endpoint_t)networkEndpoint;
- (unint64_t)hash;
- (void)dealloc;
- (void)setActive:(BOOL)a3;
- (void)setBluetoothIdentifier:(id)a3;
- (void)setDevice:(id)a3;
- (void)setNetworkEndpoint:(id)a3;
@end

@implementation AVCustomDeviceRoute

- (void)dealloc
{
  self->_device = 0;
  networkEndpoint = self->_networkEndpoint;
  if (networkEndpoint)
  {
    nw_release(networkEndpoint);
    self->_networkEndpoint = 0;
  }

  self->_bluetoothIdentifier = 0;
  v4.receiver = self;
  v4.super_class = (Class)AVCustomDeviceRoute;
  [(AVCustomDeviceRoute *)&v4 dealloc];
}

- (void)setDevice:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];

  self->_device = (DADevice *)a3;
  networkEndpoint = self->_networkEndpoint;
  if (networkEndpoint) {
    nw_release(networkEndpoint);
  }
  if ([a3 networkEndpoint]) {
    self->_networkEndpoint = (OS_nw_endpoint *)nw_retain((void *)[a3 networkEndpoint]);
  }

  self->_bluetoothIdentifier = (NSUUID *)(id)[a3 bluetoothIdentifier];
  v6 = _AVRoutingLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self->_networkEndpoint;
    bluetoothIdentifier = self->_bluetoothIdentifier;
    int v9 = 136315906;
    v10 = "-[AVCustomDeviceRoute setDevice:]";
    __int16 v11 = 2112;
    id v12 = a3;
    __int16 v13 = 2112;
    v14 = v7;
    __int16 v15 = 2112;
    v16 = bluetoothIdentifier;
    _os_log_impl(&dword_215723000, v6, OS_LOG_TYPE_DEFAULT, "%s AVVSR.device = %@, networkEndpoint = %@, bluetoothIdentifier = %@", (uint8_t *)&v9, 0x2Au);
  }
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = (void *)[(DADevice *)self->_device identifier];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "device"), "identifier");

  return [v5 isEqualToString:v6];
}

- (unint64_t)hash
{
  v2 = (void *)[(DADevice *)self->_device identifier];

  return [v2 hash];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<ID: %@, name: %@>", -[DADevice identifier](-[AVCustomDeviceRoute device](self, "device"), "identifier"), -[DADevice name](-[AVCustomDeviceRoute device](self, "device"), "name")];
}

- (nw_endpoint_t)networkEndpoint
{
  return (nw_endpoint_t)self->_networkEndpoint;
}

- (void)setNetworkEndpoint:(id)a3
{
  self->_networkEndpoint = (OS_nw_endpoint *)a3;
}

- (NSUUID)bluetoothIdentifier
{
  return self->_bluetoothIdentifier;
}

- (void)setBluetoothIdentifier:(id)a3
{
  self->_bluetoothIdentifier = (NSUUID *)a3;
}

- (DADevice)device
{
  return self->_device;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

@end