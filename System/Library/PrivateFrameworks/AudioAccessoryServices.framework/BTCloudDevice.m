@interface BTCloudDevice
+ (BOOL)supportsSecureCoding;
+ (id)deviceWithBluetoothAddress:(id)a3;
- (BTCloudDevice)initWithBluetoothAddress:(id)a3;
- (BTCloudDevice)initWithCoder:(id)a3;
- (NSString)bluetoothAddress;
- (NSString)manufacturer;
- (NSString)modelNumber;
- (NSString)nickname;
- (NSString)productID;
- (NSString)vendorID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBluetoothAddress:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setModelNumber:(id)a3;
- (void)setNickname:(id)a3;
- (void)setProductID:(id)a3;
- (void)setVendorID:(id)a3;
@end

@implementation BTCloudDevice

+ (id)deviceWithBluetoothAddress:(id)a3
{
  id v3 = a3;
  v4 = [[BTCloudDevice alloc] initWithBluetoothAddress:v3];

  return v4;
}

- (BTCloudDevice)initWithBluetoothAddress:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BTCloudDevice;
  v5 = [(BTCloudDevice *)&v8 init];
  v6 = v5;
  if (v5) {
    [(BTCloudDevice *)v5 setBluetoothAddress:v4];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BTCloudDevice *)self bluetoothAddress];
  v6 = NSStringFromSelector(sel_bluetoothAddress);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(BTCloudDevice *)self manufacturer];
  objc_super v8 = NSStringFromSelector(sel_manufacturer);
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(BTCloudDevice *)self modelNumber];
  v10 = NSStringFromSelector(sel_modelNumber);
  [v4 encodeObject:v9 forKey:v10];

  v11 = [(BTCloudDevice *)self nickname];
  v12 = NSStringFromSelector(sel_nickname);
  [v4 encodeObject:v11 forKey:v12];

  v13 = [(BTCloudDevice *)self productID];
  v14 = NSStringFromSelector(sel_productID);
  [v4 encodeObject:v13 forKey:v14];

  id v16 = [(BTCloudDevice *)self vendorID];
  v15 = NSStringFromSelector(sel_vendorID);
  [v4 encodeObject:v16 forKey:v15];
}

- (BTCloudDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BTCloudDevice;
  v5 = [(BTCloudDevice *)&v26 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = objc_opt_class();
  v7 = NSStringFromSelector(sel_bluetoothAddress);
  objc_super v8 = [v4 decodeObjectOfClass:v6 forKey:v7];

  if (v8)
  {
    [(BTCloudDevice *)v5 setBluetoothAddress:v8];
    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector(sel_manufacturer);
    v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    [(BTCloudDevice *)v5 setManufacturer:v11];

    uint64_t v12 = objc_opt_class();
    v13 = NSStringFromSelector(sel_modelNumber);
    v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
    [(BTCloudDevice *)v5 setModelNumber:v14];

    uint64_t v15 = objc_opt_class();
    id v16 = NSStringFromSelector(sel_nickname);
    v17 = [v4 decodeObjectOfClass:v15 forKey:v16];
    [(BTCloudDevice *)v5 setNickname:v17];

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(sel_productID);
    v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    [(BTCloudDevice *)v5 setProductID:v20];

    uint64_t v21 = objc_opt_class();
    v22 = NSStringFromSelector(sel_vendorID);
    v23 = [v4 decodeObjectOfClass:v21 forKey:v22];
    [(BTCloudDevice *)v5 setVendorID:v23];

LABEL_4:
    v24 = v5;
    goto LABEL_10;
  }
  if (gLogCategory_BTCloudDevice <= 90 && (gLogCategory_BTCloudDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v24 = 0;
LABEL_10:

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(BTCloudDevice *)self bluetoothAddress];
  v5 = [(BTCloudDevice *)self nickname];
  uint64_t v6 = [(BTCloudDevice *)self manufacturer];
  v7 = [(BTCloudDevice *)self modelNumber];
  objc_super v8 = [(BTCloudDevice *)self productID];
  uint64_t v9 = [(BTCloudDevice *)self vendorID];
  v10 = [v3 stringWithFormat:@"BTCloudDevice: %@, %@, %@, %@, %@, %@", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (void)setBluetoothAddress:(id)a3
{
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (void)setModelNumber:(id)a3
{
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
}

- (NSString)productID
{
  return self->_productID;
}

- (void)setProductID:(id)a3
{
}

- (NSString)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);

  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
}

@end