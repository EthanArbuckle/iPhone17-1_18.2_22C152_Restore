@interface _ACCBluetoothStatusComponent
+ (id)createComponentFromDict:(id)a3;
- (BOOL)needToUnplugBTDevice;
- (BTAccessoryManagerImpl)btAccessoryManager;
- (BTDeviceImpl)btDevice;
- (NSData)macAddr;
- (NSString)accessoryUID;
- (NSString)componentUID;
- (NSString)name;
- (_ACCBluetoothStatusComponent)initWithUID:(id)a3 macAddr:(id)a4 name:(id)a5 forAccessoryUID:(id)a6;
- (id)description;
- (void)setBtAccessoryManager:(BTAccessoryManagerImpl *)a3;
- (void)setBtDevice:(BTDeviceImpl *)a3;
- (void)setNeedToUnplugBTDevice:(BOOL)a3;
@end

@implementation _ACCBluetoothStatusComponent

- (id)description
{
  return (id)[NSString stringWithFormat:@"_ACCBluetoothStatusComponent<%@ name=%@ needToUnplugBTDevice=%d>", self->_componentUID, self->_name, self->_needToUnplugBTDevice];
}

- (_ACCBluetoothStatusComponent)initWithUID:(id)a3 macAddr:(id)a4 name:(id)a5 forAccessoryUID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_ACCBluetoothStatusComponent;
  v15 = [(_ACCBluetoothStatusComponent *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accessoryUID, a6);
    objc_storeStrong((id *)&v16->_componentUID, a3);
    objc_storeStrong((id *)&v16->_macAddr, a4);
    objc_storeStrong((id *)&v16->_name, a5);
    v16->_needToUnplugBTDevice = 0;
  }

  return v16;
}

+ (id)createComponentFromDict:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKey:@"ACCBluetoothStatusComponentInfoAccessoryUID"];
  v5 = [v3 objectForKey:@"ACCBluetoothStatusComponentInfoUID"];
  v6 = [v3 objectForKey:@"ACCBluetoothStatusComponentInfoMACAddr"];
  v7 = [v3 objectForKey:@"ACCBluetoothStatusComponentInfoName"];

  v8 = [[_ACCBluetoothStatusComponent alloc] initWithUID:v5 macAddr:v6 name:v7 forAccessoryUID:v4];
  return v8;
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (NSString)componentUID
{
  return self->_componentUID;
}

- (NSData)macAddr
{
  return self->_macAddr;
}

- (NSString)name
{
  return self->_name;
}

- (BTAccessoryManagerImpl)btAccessoryManager
{
  return self->_btAccessoryManager;
}

- (void)setBtAccessoryManager:(BTAccessoryManagerImpl *)a3
{
  self->_btAccessoryManager = a3;
}

- (BTDeviceImpl)btDevice
{
  return self->_btDevice;
}

- (void)setBtDevice:(BTDeviceImpl *)a3
{
  self->_btDevice = a3;
}

- (BOOL)needToUnplugBTDevice
{
  return self->_needToUnplugBTDevice;
}

- (void)setNeedToUnplugBTDevice:(BOOL)a3
{
  self->_needToUnplugBTDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_macAddr, 0);
  objc_storeStrong((id *)&self->_componentUID, 0);
  objc_storeStrong((id *)&self->_accessoryUID, 0);
}

@end