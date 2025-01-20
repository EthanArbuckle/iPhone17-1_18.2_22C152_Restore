@interface ADCoreBluetoothDevice
- (ADCoreBluetoothDevice)initWithIdentifier:(id)a3 name:(id)a4 RSSI:(id)a5 state:(id)a6;
- (NSNumber)RSSI;
- (NSString)index;
- (NSString)name;
- (NSString)state;
- (NSUUID)identifier;
- (id)dictionaryRepresentation;
- (void)setIndex:(id)a3;
@end

@implementation ADCoreBluetoothDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_RSSI, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setIndex:(id)a3
{
}

- (NSString)index
{
  return self->_index;
}

- (NSString)state
{
  return self->_state;
}

- (NSNumber)RSSI
{
  return self->_RSSI;
}

- (NSString)name
{
  return self->_name;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (id)dictionaryRepresentation
{
  id v3 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  v4 = v3;
  if (self->_identifier)
  {
    index = self->_index;
    if (index) {
      [v3 setObject:index forKey:@"index"];
    }
  }
  RSSI = self->_RSSI;
  if (RSSI) {
    [v4 setObject:RSSI forKey:@"RSSI"];
  }
  return v4;
}

- (ADCoreBluetoothDevice)initWithIdentifier:(id)a3 name:(id)a4 RSSI:(id)a5 state:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ADCoreBluetoothDevice;
  v15 = [(ADCoreBluetoothDevice *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_name, a4);
    objc_storeStrong((id *)&v16->_RSSI, a5);
    objc_storeStrong((id *)&v16->_state, a6);
  }

  return v16;
}

@end