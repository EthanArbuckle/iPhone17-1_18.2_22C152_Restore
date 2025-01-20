@interface ACCPlatformBluetoothStatusAccessory
- (ACCPlatformBluetoothStatusAccessory)initWithUID:(id)a3;
- (NSMutableDictionary)componentList;
- (NSString)accessoryUID;
- (id)description;
@end

@implementation ACCPlatformBluetoothStatusAccessory

- (id)description
{
  return (id)[NSString stringWithFormat:@"ACCPlatformBluetoothStatusAccessory<%@ comonentList=%@>", self->_accessoryUID, self->_componentList];
}

- (ACCPlatformBluetoothStatusAccessory)initWithUID:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACCPlatformBluetoothStatusAccessory;
  v6 = [(ACCPlatformBluetoothStatusAccessory *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accessoryUID, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    componentList = v7->_componentList;
    v7->_componentList = v8;
  }
  return v7;
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (NSMutableDictionary)componentList
{
  return self->_componentList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentList, 0);
  objc_storeStrong((id *)&self->_accessoryUID, 0);
}

@end