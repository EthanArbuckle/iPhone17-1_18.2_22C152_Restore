@interface _ACCBTConnectionStatusComponent
- (BOOL)enabled;
- (BOOL)needToUnplugBTDevice;
- (BOOL)updateStarted;
- (NSData)macAddr;
- (NSString)accessoryUID;
- (NSString)componentUID;
- (NSString)name;
- (_ACCBTConnectionStatusComponent)initWithUID:(id)a3 componentUID:(id)a4 name:(id)a5 macAddr:(id)a6;
- (id)copyDictionary;
- (void)dealloc;
- (void)setEnabled:(BOOL)a3;
- (void)setNeedToUnplugBTDevice:(BOOL)a3;
- (void)setUpdateStarted:(BOOL)a3;
@end

@implementation _ACCBTConnectionStatusComponent

- (_ACCBTConnectionStatusComponent)initWithUID:(id)a3 componentUID:(id)a4 name:(id)a5 macAddr:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_ACCBTConnectionStatusComponent;
  v15 = [(_ACCBTConnectionStatusComponent *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accessoryUID, a3);
    objc_storeStrong((id *)&v16->_componentUID, a4);
    objc_storeStrong((id *)&v16->_name, a5);
    objc_storeStrong((id *)&v16->_macAddr, a6);
    *(_WORD *)&v16->_enabled = 0;
    v16->_needToUnplugBTDevice = 0;
  }

  return v16;
}

- (void)dealloc
{
  accessoryUID = self->_accessoryUID;
  self->_accessoryUID = 0;

  componentUID = self->_componentUID;
  self->_componentUID = 0;

  name = self->_name;
  self->_name = 0;

  macAddr = self->_macAddr;
  self->_macAddr = 0;

  v7.receiver = self;
  v7.super_class = (Class)_ACCBTConnectionStatusComponent;
  [(_ACCBTConnectionStatusComponent *)&v7 dealloc];
}

- (id)copyDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 setObject:self->_accessoryUID forKey:@"ACCBluetoothStatusComponentInfoAccessoryUID"];
  [v3 setObject:self->_componentUID forKey:@"ACCBluetoothStatusComponentInfoUID"];
  [v3 setObject:self->_macAddr forKey:@"ACCBluetoothStatusComponentInfoMACAddr"];
  [v3 setObject:self->_name forKey:@"ACCBluetoothStatusComponentInfoName"];
  v4 = +[NSNumber numberWithBool:self->_enabled];
  [v3 setObject:v4 forKey:@"ACCBluetoothStatusComponentInfoEnabled"];

  return v3;
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (NSString)componentUID
{
  return self->_componentUID;
}

- (NSString)name
{
  return self->_name;
}

- (NSData)macAddr
{
  return self->_macAddr;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)updateStarted
{
  return self->_updateStarted;
}

- (void)setUpdateStarted:(BOOL)a3
{
  self->_updateStarted = a3;
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
  objc_storeStrong((id *)&self->_macAddr, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_componentUID, 0);

  objc_storeStrong((id *)&self->_accessoryUID, 0);
}

@end