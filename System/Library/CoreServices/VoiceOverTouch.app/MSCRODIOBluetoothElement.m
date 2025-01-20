@interface MSCRODIOBluetoothElement
- (BOOL)isEqual:(id)a3;
- (MSCRODIOBluetoothElement)initWithAddress:(id)a3;
- (id)bluetoothAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (int)transport;
- (unint64_t)hash;
@end

@implementation MSCRODIOBluetoothElement

- (MSCRODIOBluetoothElement)initWithAddress:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSCRODIOBluetoothElement;
  v5 = [(MSCRODIOBluetoothElement *)&v9 initWithIOObject:0];
  if (!v5) {
    goto LABEL_6;
  }
  if (v4)
  {
    id v6 = v4;
    [v6 UTF8String];
    if (!BTDeviceAddressFromString())
    {
      objc_storeStrong((id *)&v5->_bluetoothAddress, v6);
LABEL_6:
      v7 = v5;
      goto LABEL_7;
    }
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_bluetoothAddress hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MSCRODIOBluetoothElement;
  id v4 = [(MSCRODIOBluetoothElement *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 1, self->_bluetoothAddress);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol])
  {
    v5 = [v4 bluetoothAddress];
    BOOL v6 = [(NSString *)self->_bluetoothAddress isEqualToString:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (int)transport
{
  return 2;
}

- (id)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (void).cxx_destruct
{
}

@end