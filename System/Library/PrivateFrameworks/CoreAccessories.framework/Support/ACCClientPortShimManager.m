@interface ACCClientPortShimManager
- (ACCClientPortShimManager)init;
- (NSMutableDictionary)portList;
- (id)findClientPortForUUID:(id)a3;
- (void)addClienPort:(id)a3 forUUID:(id)a4;
- (void)removeClienPortForUUID:(id)a3;
- (void)setPortList:(id)a3;
@end

@implementation ACCClientPortShimManager

- (ACCClientPortShimManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACCClientPortShimManager;
  v2 = [(ACCClientPortShimManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    portList = v2->_portList;
    v2->_portList = v3;
  }
  return v2;
}

- (void)addClienPort:(id)a3 forUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 7;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    v10 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "addClientPort: %@ forUID: %@", (uint8_t *)&v11, 0x16u);
  }

  [(NSMutableDictionary *)self->_portList setObject:v6 forKey:v7];
}

- (void)removeClienPortForUUID:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 7;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    id v7 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "removeClientPortForUID: %@", (uint8_t *)&v8, 0xCu);
  }

  [(NSMutableDictionary *)self->_portList removeObjectForKey:v4];
}

- (id)findClientPortForUUID:(id)a3
{
  return [(NSMutableDictionary *)self->_portList objectForKey:a3];
}

- (NSMutableDictionary)portList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPortList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end