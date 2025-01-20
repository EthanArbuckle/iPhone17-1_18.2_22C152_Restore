@interface IDSAppleIDNotification
- (IDSAppleIDNotification)init;
- (IDSEndpointCapabilities)deviceCapabilities;
- (NSData)pushToken;
- (NSDictionary)sessionToBlockMap;
- (NSMutableSet)aliases;
- (NSMutableSet)serviceTypes;
- (NSMutableSet)sessions;
- (NSString)appleID;
- (NSString)deviceModel;
- (NSString)deviceName;
- (void)addAlias:(id)a3;
- (void)addCompletionBlock:(id)a3 forSession:(id)a4;
- (void)addServiceType:(id)a3;
- (void)addSession:(id)a3;
- (void)setAliases:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setDeviceCapabilities:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setServiceTypes:(id)a3;
- (void)setSessionToBlockMap:(id)a3;
- (void)setSessions:(id)a3;
@end

@implementation IDSAppleIDNotification

- (IDSAppleIDNotification)init
{
  v12.receiver = self;
  v12.super_class = (Class)IDSAppleIDNotification;
  v2 = [(IDSAppleIDNotification *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    serviceTypes = v2->_serviceTypes;
    v2->_serviceTypes = v3;

    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    sessions = v2->_sessions;
    v2->_sessions = v5;

    v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    aliases = v2->_aliases;
    v2->_aliases = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sessionToBlockMap = v2->_sessionToBlockMap;
    v2->_sessionToBlockMap = v9;
  }
  return v2;
}

- (void)addAlias:(id)a3
{
  if (a3) {
    -[NSMutableSet addObject:](self->_aliases, "addObject:");
  }
}

- (void)addServiceType:(id)a3
{
}

- (void)addSession:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    [(NSMutableSet *)self->_sessions addObject:v4];
  }
}

- (void)addCompletionBlock:(id)a3 forSession:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9 && [v6 length])
  {
    sessionToBlockMap = self->_sessionToBlockMap;
    id v8 = [v9 copy];
    [(NSMutableDictionary *)sessionToBlockMap setObject:v8 forKey:v6];
  }
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
}

- (NSMutableSet)aliases
{
  return self->_aliases;
}

- (void)setAliases:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSMutableSet)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
}

- (NSMutableSet)serviceTypes
{
  return self->_serviceTypes;
}

- (void)setServiceTypes:(id)a3
{
}

- (NSDictionary)sessionToBlockMap
{
  return &self->_sessionToBlockMap->super;
}

- (void)setSessionToBlockMap:(id)a3
{
}

- (IDSEndpointCapabilities)deviceCapabilities
{
  return self->_deviceCapabilities;
}

- (void)setDeviceCapabilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCapabilities, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_sessionToBlockMap, 0);
  objc_storeStrong((id *)&self->_serviceTypes, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_aliases, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_appleID, 0);
}

@end