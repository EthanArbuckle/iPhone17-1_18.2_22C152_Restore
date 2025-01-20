@interface FMDBluetoothDiscoveryXPCAdapterDevice
+ (BOOL)supportsSecureCoding;
- (FMDBluetoothDiscoveryXPCAdapterDevice)initWithBluetoothDevice:(id)a3;
- (FMDBluetoothDiscoveryXPCAdapterDevice)initWithCoder:(id)a3;
- (NSData)bluetoothAddress;
- (NSDictionary)advertisementFields;
- (NSString)name;
- (NSUUID)identifier;
- (id)_xpcSafeAdvertisementKeys:(id)a3;
- (int64_t)rssi;
- (void)encodeWithCoder:(id)a3;
- (void)setAdvertisementFields:(id)a3;
- (void)setBluetoothAddress:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setRssi:(int64_t)a3;
@end

@implementation FMDBluetoothDiscoveryXPCAdapterDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDBluetoothDiscoveryXPCAdapterDevice)initWithBluetoothDevice:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FMDBluetoothDiscoveryXPCAdapterDevice;
  v5 = [(FMDBluetoothDiscoveryXPCAdapterDevice *)&v13 init];
  if (v5)
  {
    v6 = [v4 identifier];
    [(FMDBluetoothDiscoveryXPCAdapterDevice *)v5 setIdentifier:v6];

    v7 = [v4 advertisementFields];
    v8 = [(FMDBluetoothDiscoveryXPCAdapterDevice *)v5 _xpcSafeAdvertisementKeys:v7];
    [(FMDBluetoothDiscoveryXPCAdapterDevice *)v5 setAdvertisementFields:v8];

    v9 = [v4 name];
    [(FMDBluetoothDiscoveryXPCAdapterDevice *)v5 setName:v9];

    -[FMDBluetoothDiscoveryXPCAdapterDevice setRssi:](v5, "setRssi:", [v4 rssi]);
    v10 = [v4 bluetoothAddress];
    id v11 = [v10 copy];
    [(FMDBluetoothDiscoveryXPCAdapterDevice *)v5 setBluetoothAddress:v11];
  }
  return v5;
}

- (FMDBluetoothDiscoveryXPCAdapterDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FMDBluetoothDiscoveryXPCAdapterDevice;
  v5 = [(FMDBluetoothDiscoveryXPCAdapterDevice *)&v16 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(FMDBluetoothDiscoveryXPCAdapterDevice *)v5 setIdentifier:v6];

    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    id v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"advertisementFields"];
    [(FMDBluetoothDiscoveryXPCAdapterDevice *)v5 setAdvertisementFields:v12];

    objc_super v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    [(FMDBluetoothDiscoveryXPCAdapterDevice *)v5 setName:v13];

    -[FMDBluetoothDiscoveryXPCAdapterDevice setRssi:](v5, "setRssi:", [v4 decodeIntegerForKey:@"rssi"]);
    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bluetoothAddress"];
    [(FMDBluetoothDiscoveryXPCAdapterDevice *)v5 setBluetoothAddress:v14];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMDBluetoothDiscoveryXPCAdapterDevice *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(FMDBluetoothDiscoveryXPCAdapterDevice *)self advertisementFields];
  [v4 encodeObject:v6 forKey:@"advertisementFields"];

  uint64_t v7 = [(FMDBluetoothDiscoveryXPCAdapterDevice *)self name];
  [v4 encodeObject:v7 forKey:@"name"];

  [v4 encodeInteger:[self rssi] forKey:@"rssi"];
  id v8 = [(FMDBluetoothDiscoveryXPCAdapterDevice *)self bluetoothAddress];
  [v4 encodeObject:v8 forKey:@"bluetoothAddress"];
}

- (id)_xpcSafeAdvertisementKeys:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  v5 = [v3 objectForKeyedSubscript:@"hsStatus"];
  [v4 fm_safelySetObject:v5 forKey:@"hsStatus"];

  v6 = [v3 objectForKeyedSubscript:@"cc"];
  [v4 fm_safelySetObject:v6 forKey:@"cc"];

  uint64_t v7 = [v3 objectForKeyedSubscript:@"hbT"];
  [v4 fm_safelySetObject:v7 forKey:@"hbT"];

  id v8 = [v3 objectForKeyedSubscript:@"cc"];
  [v4 fm_safelySetObject:v8 forKey:@"cc"];

  uint64_t v9 = [v3 objectForKeyedSubscript:@"ccR"];
  [v4 fm_safelySetObject:v9 forKey:@"ccR"];

  uint64_t v10 = [v3 objectForKeyedSubscript:@"ccC"];
  [v4 fm_safelySetObject:v10 forKey:@"ccC"];

  id v11 = [v3 objectForKeyedSubscript:@"lc"];
  [v4 fm_safelySetObject:v11 forKey:@"lc"];

  v12 = [v3 objectForKeyedSubscript:@"aState"];

  [v4 fm_safelySetObject:v12 forKey:@"aState"];
  id v13 = [v4 copy];

  return v13;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDictionary)advertisementFields
{
  return self->_advertisementFields;
}

- (void)setAdvertisementFields:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (NSData)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (void)setBluetoothAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_advertisementFields, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end