@interface CARBluetoothLEDevice
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaired;
- (CARBluetoothLEDevice)initWithPeripheral:(id)a3;
- (CBPeripheral)peripheral;
- (NSString)name;
- (NSUUID)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)connectionStatus;
- (unint64_t)hash;
- (void)setConnectionStatus:(int64_t)a3;
- (void)setPaired:(BOOL)a3;
- (void)setPeripheral:(id)a3;
@end

@implementation CARBluetoothLEDevice

- (CARBluetoothLEDevice)initWithPeripheral:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CARBluetoothLEDevice;
  v6 = [(CARBluetoothLEDevice *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_peripheral, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(CARBluetoothLEDevice *)self identifier];
    v6 = [v4 identifier];
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
  v2 = [(CARBluetoothLEDevice *)self identifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  if (v5)
  {
    v6 = [(CARBluetoothLEDevice *)self identifier];
    id v7 = [v6 copyWithZone:a3];
    [v5 setIdentifier:v7];

    objc_msgSend(v5, "setPaired:", -[CARBluetoothLEDevice isPaired](self, "isPaired"));
    objc_msgSend(v5, "setConnectionStatus:", -[CARBluetoothLEDevice connectionStatus](self, "connectionStatus"));
    v8 = [(CARBluetoothLEDevice *)self peripheral];
    [v5 setPeripheral:v8];
  }
  return v5;
}

- (NSUUID)identifier
{
  v2 = [(CARBluetoothLEDevice *)self peripheral];
  id v3 = [v2 identifier];

  return (NSUUID *)v3;
}

- (NSString)name
{
  v2 = [(CARBluetoothLEDevice *)self peripheral];
  id v3 = [v2 name];
  id v4 = [v3 stringByAppendingString:@" (LE)"];

  return (NSString *)v4;
}

- (int64_t)connectionStatus
{
  v2 = [(CARBluetoothLEDevice *)self peripheral];
  id v3 = v2;
  if (v2 && (id v4 = (char *)[v2 state], (unint64_t)(v4 - 1) <= 2)) {
    int64_t v5 = qword_1B300[(void)(v4 - 1)];
  }
  else {
    int64_t v5 = 1;
  }

  return v5;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)CARBluetoothLEDevice;
  id v3 = [(CARBluetoothLEDevice *)&v10 description];
  id v4 = [(CARBluetoothLEDevice *)self identifier];
  int64_t v5 = [(CARBluetoothLEDevice *)self name];
  int64_t v6 = [(CARBluetoothLEDevice *)self connectionStatus];
  id v7 = [(CARBluetoothLEDevice *)self peripheral];
  v8 = +[NSString stringWithFormat:@"%@ {identifier: %@ name: %@ connectionStatus: %ld peripheral: %@}", v3, v4, v5, v6, v7];

  return v8;
}

- (BOOL)isPaired
{
  return self->_paired;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (void)setConnectionStatus:(int64_t)a3
{
  self->_connectionStatus = a3;
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
}

@end