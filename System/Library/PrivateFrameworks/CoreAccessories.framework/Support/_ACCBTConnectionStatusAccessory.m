@interface _ACCBTConnectionStatusAccessory
+ (id)accessoryList;
- (ACCPlatformBluetoothStatusAccessory)pluginAccessory;
- (NSMutableDictionary)components;
- (NSString)accessoryUID;
- (_ACCBTConnectionStatusAccessory)initWithUID:(id)a3;
- (void)componentUpdate:(id)a3;
- (void)dealloc;
- (void)setAccessoryUID:(id)a3;
- (void)setPluginAccessory:(id)a3;
@end

@implementation _ACCBTConnectionStatusAccessory

- (_ACCBTConnectionStatusAccessory)initWithUID:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_ACCBTConnectionStatusAccessory;
  v6 = [(_ACCBTConnectionStatusAccessory *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accessoryUID, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    components = v7->_components;
    v7->_components = v8;

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v7 selector:"componentUpdate:" name:@"ACCBluetoothStatusComponentUpdateNotification" object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"ACCBluetoothStatusComponentUpdateNotification" object:0];

  accessoryUID = self->_accessoryUID;
  self->_accessoryUID = 0;

  components = self->_components;
  self->_components = 0;

  v6.receiver = self;
  v6.super_class = (Class)_ACCBTConnectionStatusAccessory;
  [(_ACCBTConnectionStatusAccessory *)&v6 dealloc];
}

- (void)componentUpdate:(id)a3
{
  v4 = [a3 userInfo];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 8;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    v7 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    accessoryUID = self->_accessoryUID;
    int v12 = 138412546;
    v13 = accessoryUID;
    __int16 v14 = 2112;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[#BT Connection Status] componentUpdate: _accessoryUID=%@, userInfo=%@", (uint8_t *)&v12, 0x16u);
  }

  if (v4)
  {
    v9 = [v4 objectForKey:@"ACCBluetoothStatusComponentUpdateInfoAccessoryUID"];
    if ([v9 isEqualToString:self->_accessoryUID])
    {
      v10 = [v4 objectForKey:@"ACCBluetoothStatusComponentUpdateInfoUID"];
      v11 = [v4 objectForKey:@"ACCBluetoothStatusComponentUpdateInfoProfiles"];
      platform_btConnectionStatus_updateHandler(v9, v10, v11);
    }
  }
}

+ (id)accessoryList
{
  if (accessoryList_onceToken != -1) {
    dispatch_once(&accessoryList_onceToken, &__block_literal_global_34);
  }
  v2 = (void *)accessoryList___accessoryList;

  return v2;
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (void)setAccessoryUID:(id)a3
{
}

- (NSMutableDictionary)components
{
  return self->_components;
}

- (ACCPlatformBluetoothStatusAccessory)pluginAccessory
{
  return self->_pluginAccessory;
}

- (void)setPluginAccessory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginAccessory, 0);
  objc_storeStrong((id *)&self->_components, 0);

  objc_storeStrong((id *)&self->_accessoryUID, 0);
}

@end