@interface CARBluetoothClassicDevice
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaired;
- (BluetoothDevice)btDevice;
- (NSString)bluetoothAddress;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)connectionStatus;
- (unint64_t)hash;
- (void)setBluetoothAddress:(id)a3;
- (void)setBtDevice:(id)a3;
- (void)setConnectionStatus:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setPaired:(BOOL)a3;
@end

@implementation CARBluetoothClassicDevice

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(CARBluetoothClassicDevice *)self bluetoothAddress];
    v6 = [v4 bluetoothAddress];
    unsigned __int8 v7 = [v5 isEqual:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(CARBluetoothClassicDevice *)self bluetoothAddress];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  if (v5)
  {
    v6 = [(CARBluetoothClassicDevice *)self bluetoothAddress];
    id v7 = [v6 copyWithZone:a3];
    [v5 setBluetoothAddress:v7];

    objc_msgSend(v5, "setPaired:", -[CARBluetoothClassicDevice isPaired](self, "isPaired"));
    objc_msgSend(v5, "setConnectionStatus:", -[CARBluetoothClassicDevice connectionStatus](self, "connectionStatus"));
    v8 = [(CARBluetoothClassicDevice *)self btDevice];
    [v5 setBtDevice:v8];
  }
  return v5;
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (void)setBluetoothAddress:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)isPaired
{
  return self->_paired;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (int64_t)connectionStatus
{
  return self->_connectionStatus;
}

- (void)setConnectionStatus:(int64_t)a3
{
  self->_connectionStatus = a3;
}

- (BluetoothDevice)btDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_btDevice);

  return (BluetoothDevice *)WeakRetained;
}

- (void)setBtDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_btDevice);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
}

@end