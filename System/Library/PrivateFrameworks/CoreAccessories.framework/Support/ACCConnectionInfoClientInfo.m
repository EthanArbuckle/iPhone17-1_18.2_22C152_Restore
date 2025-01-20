@interface ACCConnectionInfoClientInfo
- (ACCConnectionInfoClientInfo)initWithXPCConnection:(id)a3;
- (BOOL)allConnectionsNotificationsEntitlement;
- (BOOL)hasHIDClient;
- (NSDictionary)accessoryFilterDictionary;
- (NSMutableSet)filteredAccessories;
- (NSMutableSet)filteredEndpoints;
- (NSMutableSet)interceptEnabled;
- (NSString)clientBundleID;
- (NSString)clientUID;
- (id)description;
- (void)_determineEntitlementsForXPCConnection;
- (void)setAccessoryFilterDictionary:(id)a3;
- (void)setClientBundleID:(id)a3;
- (void)setClientUID:(id)a3;
- (void)setFilteredAccessories:(id)a3;
- (void)setFilteredEndpoints:(id)a3;
- (void)setHasHIDClient:(BOOL)a3;
- (void)setInterceptEnabled:(id)a3;
@end

@implementation ACCConnectionInfoClientInfo

- (id)description
{
  return +[NSString stringWithFormat:@"<ACCConnectionInfoClientInfo:%@ - %@>", self->_clientUID, self->_clientBundleID];
}

- (ACCConnectionInfoClientInfo)initWithXPCConnection:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)ACCConnectionInfoClientInfo;
  v3 = [(XPCConnectionInfo *)&v15 initWithXPCConnection:a3];
  v4 = v3;
  if (v3)
  {
    clientUID = v3->_clientUID;
    v3->_clientUID = 0;

    clientBundleID = v4->_clientBundleID;
    v4->_clientBundleID = 0;

    v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    interceptEnabled = v4->_interceptEnabled;
    v4->_interceptEnabled = v7;

    accessoryFilterDictionary = v4->_accessoryFilterDictionary;
    v4->_accessoryFilterDictionary = 0;

    v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    filteredAccessories = v4->_filteredAccessories;
    v4->_filteredAccessories = v10;

    v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    filteredEndpoints = v4->_filteredEndpoints;
    v4->_filteredEndpoints = v12;

    [(ACCConnectionInfoClientInfo *)v4 _determineEntitlementsForXPCConnection];
  }
  return v4;
}

- (void)_determineEntitlementsForXPCConnection
{
  v3 = [(XPCConnectionInfo *)self XPCConnection];
  self->_allConnectionsNotificationsEntitlement = [v3 hasEntitlement:@"com.apple.private.accessories.showallconnections"];

  if (!self->_allConnectionsNotificationsEntitlement)
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 9;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v6 = &_os_log_default;
      id v5 = &_os_log_default;
    }
    else
    {
      v6 = *(id *)(gLogObjects + 64);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      clientUID = self->_clientUID;
      clientBundleID = self->_clientBundleID;
      int v9 = 138412546;
      v10 = clientUID;
      __int16 v11 = 2112;
      v12 = clientBundleID;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Client %@ (%@) not entitled for showallconnections!!!", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (NSString)clientUID
{
  return self->_clientUID;
}

- (void)setClientUID:(id)a3
{
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
}

- (BOOL)allConnectionsNotificationsEntitlement
{
  return self->_allConnectionsNotificationsEntitlement;
}

- (NSMutableSet)interceptEnabled
{
  return self->_interceptEnabled;
}

- (void)setInterceptEnabled:(id)a3
{
}

- (NSDictionary)accessoryFilterDictionary
{
  return self->_accessoryFilterDictionary;
}

- (void)setAccessoryFilterDictionary:(id)a3
{
}

- (NSMutableSet)filteredAccessories
{
  return self->_filteredAccessories;
}

- (void)setFilteredAccessories:(id)a3
{
}

- (NSMutableSet)filteredEndpoints
{
  return self->_filteredEndpoints;
}

- (void)setFilteredEndpoints:(id)a3
{
}

- (BOOL)hasHIDClient
{
  return self->_hasHIDClient;
}

- (void)setHasHIDClient:(BOOL)a3
{
  self->_hasHIDClient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredEndpoints, 0);
  objc_storeStrong((id *)&self->_filteredAccessories, 0);
  objc_storeStrong((id *)&self->_accessoryFilterDictionary, 0);
  objc_storeStrong((id *)&self->_interceptEnabled, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);

  objc_storeStrong((id *)&self->_clientUID, 0);
}

@end