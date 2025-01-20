@interface AXUIBluetoothDevice
- (AXUIBluetoothDevice)initWithDevice:(void *)a3 address:(id)a4 helper:(id)a5;
- (AXUIBluetoothDevice)initWithPeripheral:(id)a3 helper:(id)a4;
- (BOOL)connected;
- (BOOL)connecting;
- (BOOL)hasAddress:(id)a3;
- (BOOL)isAppleHIDDevice;
- (BOOL)isBTLEDevice;
- (BOOL)isClassicDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDevice:(id)a3;
- (BOOL)isNameCached;
- (BOOL)isServiceSupported:(unsigned int)a3;
- (BOOL)paired;
- (CBPeripheral)peripheral;
- (id)address;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)identifier;
- (id)name;
- (int)type;
- (int64_t)compare:(id)a3;
- (unint64_t)connectedServices;
- (unint64_t)connectedServicesCount;
- (unint64_t)hash;
- (unsigned)authorizedServices;
- (unsigned)deviceClass;
- (unsigned)majorClass;
- (unsigned)minorClass;
- (unsigned)productId;
- (unsigned)vendorId;
- (void)acceptSSP:(int)a3;
- (void)clearName;
- (void)connect;
- (void)connectWithServices:(unsigned int)a3;
- (void)device;
- (void)disconnect;
- (void)setDevice:(void *)a3;
- (void)setPIN:(id)a3;
- (void)setPeripheral:(id)a3;
- (void)unpair;
@end

@implementation AXUIBluetoothDevice

- (AXUIBluetoothDevice)initWithDevice:(void *)a3 address:(id)a4 helper:(id)a5
{
  v8 = (NSString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)AXUIBluetoothDevice;
  id v9 = a5;
  v10 = [(AXUIBluetoothDevice *)&v13 init];
  -[AXUIBluetoothDevice setDevice:](v10, "setDevice:", a3, v13.receiver, v13.super_class);
  address = v10->_address;
  v10->_address = v8;

  objc_storeWeak((id *)&v10->_helper, v9);
  return v10;
}

- (AXUIBluetoothDevice)initWithPeripheral:(id)a3 helper:(id)a4
{
  v6 = (CBPeripheral *)a3;
  v15.receiver = self;
  v15.super_class = (Class)AXUIBluetoothDevice;
  id v7 = a4;
  v8 = [(AXUIBluetoothDevice *)&v15 init];
  peripheral = v8->_peripheral;
  v8->_peripheral = v6;
  v10 = v6;

  v11 = [(CBPeripheral *)v10 identifier];
  uint64_t v12 = [v11 UUIDString];
  address = v8->_address;
  v8->_address = (NSString *)v12;

  objc_storeWeak((id *)&v8->_helper, v7);
  return v8;
}

- (BOOL)isBTLEDevice
{
  return self->_peripheral != 0;
}

- (BOOL)isClassicDevice
{
  return self->_device != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_address copyWithZone:a3];
  id v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(CBPeripheral *)self->_peripheral copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  [v5 setDevice:self->_device];
  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(AXUIBluetoothDevice *)self name];
  uint64_t v6 = [v4 name];

  int64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AXUIBluetoothDevice *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(AXUIBluetoothDevice *)self isEqualToDevice:v4];
  }

  return v5;
}

- (BOOL)isEqualToDevice:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  BOOL v5 = [(AXUIBluetoothDevice *)self address];
  uint64_t v6 = [v4 address];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(AXUIBluetoothDevice *)self address];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)hasAddress:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AXUIBluetoothDevice *)self address];
  char v6 = [v5 isEqualToString:v4];

  return v6;
}

- (void)device
{
  return self->_device;
}

- (void)setDevice:(void *)a3
{
  if (self->_device != a3) {
    self->_device = (BTDeviceImpl *)a3;
  }
}

- (void)clearName
{
  self->_name = 0;
  MEMORY[0x1F41817F8]();
}

- (BOOL)isNameCached
{
  return self->_name != 0;
}

- (id)name
{
  v9[31] = *MEMORY[0x1E4F143B8];
  p_name = &self->_name;
  name = self->_name;
  if (name)
  {
    id v4 = name;
  }
  else if ([(AXUIBluetoothDevice *)self isClassicDevice])
  {
    if (!BTDeviceGetName())
    {
      char v6 = [NSString stringWithUTF8String:v9];
      if (v6)
      {
        int64_t v7 = v6;
        objc_storeStrong((id *)p_name, v6);
        goto LABEL_13;
      }
    }
    if (BTDeviceGetDefaultName()) {
      [(AXUIBluetoothDevice *)self address];
    }
    else {
    id v4 = [NSString stringWithUTF8String:v9];
    }
  }
  else
  {
    id v4 = [(CBPeripheral *)self->_peripheral name];
  }
  int64_t v7 = v4;
LABEL_13:

  return v7;
}

- (id)address
{
  address = self->_address;
  if (!address)
  {
    AXUIAddressForBTDevice();
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    BOOL v5 = self->_address;
    self->_address = v4;

    address = self->_address;
  }

  return address;
}

- (id)identifier
{
  if ([(AXUIBluetoothDevice *)self isBTLEDevice])
  {
    unint64_t v3 = [(CBPeripheral *)self->_peripheral identifier];
    id v4 = [v3 UUIDString];
  }
  else
  {
    id v4 = [(AXUIBluetoothDevice *)self address];
  }

  return v4;
}

- (int)type
{
  if (BTDeviceGetDeviceType()) {
    return 0;
  }
  else {
    return 0;
  }
}

- (unsigned)majorClass
{
  if (BTDeviceGetDeviceClass()) {
    return 0;
  }
  else {
    return 0;
  }
}

- (unsigned)minorClass
{
  if (BTDeviceGetDeviceClass()) {
    return 0;
  }
  else {
    return 0;
  }
}

- (unsigned)deviceClass
{
  if (BTDeviceGetDeviceClass()) {
    return 0;
  }
  else {
    return 0;
  }
}

- (unsigned)vendorId
{
  if (BTDeviceGetDeviceId()) {
    return 0;
  }
  else {
    return 0;
  }
}

- (unsigned)productId
{
  if (BTDeviceGetDeviceId()) {
    return 0;
  }
  else {
    return 0;
  }
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  char v6 = [(AXUIBluetoothDevice *)self name];
  int64_t v7 = [(AXUIBluetoothDevice *)self address];
  uint64_t v8 = [v3 stringWithFormat:@"%@<%p>: name:'%@' address:'%@' BTDevice:%p, type:%d", v5, self, v6, v7, self->_device, -[AXUIBluetoothDevice type](self, "type")];

  return v8;
}

- (BOOL)paired
{
  if ([(AXUIBluetoothDevice *)self isBTLEDevice])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_helper);
    char v4 = [WeakRetained btleDeviceIsPaired:self];

    return v4;
  }
  else
  {
    BTDeviceGetPairingStatus();
    return 0;
  }
}

- (BOOL)connected
{
  if ([(AXUIBluetoothDevice *)self isBTLEDevice])
  {
    peripheral = self->_peripheral;
    return [(CBPeripheral *)peripheral isConnectedToSystem];
  }
  else
  {
    BTDeviceGetConnectedServices();
    return 0;
  }
}

- (BOOL)connecting
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(AXUIBluetoothDevice *)self isBTLEDevice])
  {
    LOBYTE(v3) = [(CBPeripheral *)self->_peripheral state] == CBPeripheralStateConnecting;
  }
  else
  {
    char v4 = (void *)[objc_alloc(MEMORY[0x1E4F50B68]) initWithDevice:self->_device address:self->_address];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v5 = objc_msgSend(MEMORY[0x1E4F50B70], "sharedInstance", 0);
    char v6 = [v5 connectingDevices];

    uint64_t v3 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isEqual:v4])
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v3 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v3;
}

- (unint64_t)connectedServices
{
  return 0;
}

- (unint64_t)connectedServicesCount
{
  return 0;
}

- (BOOL)isServiceSupported:(unsigned int)a3
{
  return 0;
}

- (unsigned)authorizedServices
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_helper);
  LODWORD(v2) = [WeakRetained authorizedServicesForDevice:v2];

  return v2;
}

- (void)connect
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_helper);
  [WeakRetained connectDevice:self];
}

- (void)connectWithServices:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_helper);
  [WeakRetained connectDevice:self withServices:v3];
}

- (void)disconnect
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(AXUIBluetoothDevice *)self isBTLEDevice])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_helper);
    uint64_t v3 = [WeakRetained centralManager];
    [v3 cancelPeripheralConnection:self->_peripheral options:0];
  }
  else if (BTDeviceDisconnect())
  {
    char v4 = [MEMORY[0x1E4F48350] sharedInstance];
    char v5 = [v4 ignoreLogging];

    if ((v5 & 1) == 0)
    {
      char v6 = [MEMORY[0x1E4F48350] identifier];
      uint64_t v7 = AXLoggerForFacility();

      os_log_type_t v8 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v7, v8))
      {
        id v9 = AXColorizeFormatLog();
        long long v11 = [(AXUIBluetoothDevice *)self name];
        long long v10 = _AXStringForArgs();

        if (os_log_type_enabled(v7, v8))
        {
          *(_DWORD *)buf = 138543362;
          v14 = v10;
          _os_log_impl(&dword_18D308000, v7, v8, "%{public}@", buf, 0xCu);
        }
      }
    }
  }
}

- (void)setPIN:(id)a3
{
  p_helper = &self->_helper;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_helper);
  [WeakRetained setPincode:v5 forDevice:self];
}

- (void)acceptSSP:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_helper);
  [WeakRetained acceptSSP:v3 forDevice:self];
}

- (void)unpair
{
  BOOL v3 = [(AXUIBluetoothDevice *)self isBTLEDevice];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_helper);
  id v5 = WeakRetained;
  if (v3) {
    [WeakRetained unpairBTLEDevice:self];
  }
  else {
    [WeakRetained unpairDevice:self];
  }
}

- (BOOL)isAppleHIDDevice
{
  if ([(AXUIBluetoothDevice *)self vendorId] != 1452) {
    return [(AXUIBluetoothDevice *)self vendorId] == 76
  }
        && ([(AXUIBluetoothDevice *)self productId] == 613
         || [(AXUIBluetoothDevice *)self productId] == 617);
  return [(AXUIBluetoothDevice *)self productId] == 777
      || [(AXUIBluetoothDevice *)self productId] == 780
      || [(AXUIBluetoothDevice *)self productId] == 781
      || [(AXUIBluetoothDevice *)self productId] == 782
      || [(AXUIBluetoothDevice *)self productId] == 784;
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_helper);
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_address, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end