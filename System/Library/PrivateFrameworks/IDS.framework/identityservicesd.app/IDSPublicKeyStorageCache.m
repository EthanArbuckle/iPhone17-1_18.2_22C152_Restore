@interface IDSPublicKeyStorageCache
- (IDSMPPublicDeviceIdentityContainer)identity;
- (NSData)pushToken;
- (NSString)deviceID;
- (id)cachedIdentityForDeviceID:(id)a3;
- (void)cacheIdentity:(id)a3 forDeviceID:(id)a4 andPushToken:(id)a5;
- (void)clearCache;
- (void)logState;
- (void)removeCachedIdentityForPushToken:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setPushToken:(id)a3;
@end

@implementation IDSPublicKeyStorageCache

- (id)cachedIdentityForDeviceID:(id)a3
{
  if ([a3 isEqualToString:self->_deviceID]) {
    v4 = self->_identity;
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (void)cacheIdentity:(id)a3 forDeviceID:(id)a4 andPushToken:(id)a5
{
  v8 = (IDSMPPublicDeviceIdentityContainer *)a3;
  v9 = (NSString *)a4;
  v10 = (NSData *)a5;
  deviceID = self->_deviceID;
  self->_deviceID = v9;
  v15 = v9;

  identity = self->_identity;
  self->_identity = v8;
  v13 = v8;

  pushToken = self->_pushToken;
  self->_pushToken = v10;
}

- (void)removeCachedIdentityForPushToken:(id)a3
{
  if ([a3 isEqualToData:self->_pushToken])
  {
    deviceID = self->_deviceID;
    self->_deviceID = 0;

    identity = self->_identity;
    self->_identity = 0;

    pushToken = self->_pushToken;
    self->_pushToken = 0;
  }
}

- (void)clearCache
{
  deviceID = self->_deviceID;
  self->_deviceID = 0;

  identity = self->_identity;
  self->_identity = 0;

  pushToken = self->_pushToken;
  self->_pushToken = 0;
}

- (void)logState
{
  v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "====== Personal Key Cache:", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    _IDSWarnV();
    _IDSLogV();
    _IDSLogTransport();
  }
  if (self->_deviceID)
  {
    v4 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      deviceID = self->_deviceID;
      identity = self->_identity;
      pushToken = self->_pushToken;
      *(_DWORD *)buf = 138412802;
      v9 = deviceID;
      __int16 v10 = 2112;
      v11 = identity;
      __int16 v12 = 2112;
      v13 = pushToken;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "   Device ID: %@    Identity: %@   PushToken: %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (IDSMPPublicDeviceIdentityContainer)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_identity, 0);

  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end