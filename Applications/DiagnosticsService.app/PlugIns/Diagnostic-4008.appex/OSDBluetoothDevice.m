@interface OSDBluetoothDevice
- (NSString)address;
- (NSString)defaultName;
- (NSString)name;
- (id)description;
- (unsigned)deviceClass;
- (unsigned)deviceType;
- (void)setAddress:(id)a3;
- (void)setDefaultName:(id)a3;
- (void)setDeviceClass:(unsigned int)a3;
- (void)setDeviceType:(unsigned int)a3;
- (void)setName:(id)a3;
@end

@implementation OSDBluetoothDevice

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)OSDBluetoothDevice;
  v3 = [(OSDBluetoothDevice *)&v9 description];
  v4 = [(OSDBluetoothDevice *)self name];
  v5 = [(OSDBluetoothDevice *)self defaultName];
  v6 = [(OSDBluetoothDevice *)self address];
  v7 = +[NSString stringWithFormat:@"%@: %@ %@ [%@]", v3, v4, v5, v6];

  return v7;
}

- (NSString)defaultName
{
  return self->_defaultName;
}

- (void)setDefaultName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unsigned int)a3
{
  self->_deviceType = a3;
}

- (unsigned)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(unsigned int)a3
{
  self->_deviceClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_defaultName, 0);
}

@end