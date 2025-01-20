@interface IDSCurrentDevice
+ (id)sharedInstance;
- (BOOL)hasAllEncryptionKeys;
- (IDSCurrentDevice)init;
- (NSData)encryptionClassAKey;
- (NSData)encryptionClassCKey;
- (NSData)encryptionClassDKey;
- (NSString)deviceIdentifier;
- (id)_deviceIdentifierKeychainID;
- (void)regenerateDeviceIdentifier;
@end

@implementation IDSCurrentDevice

- (NSString)deviceIdentifier
{
  p_localDeviceIdentifier = &self->_localDeviceIdentifier;
  localDeviceIdentifier = self->_localDeviceIdentifier;
  if (!localDeviceIdentifier)
  {
    v5 = [(IDSCurrentDevice *)self _deviceIdentifierKeychainID];
    IMGetKeychainAuthToken();
    id v6 = 0;
    if (v6) {
      objc_storeStrong((id *)p_localDeviceIdentifier, 0);
    }
    if (*p_localDeviceIdentifier)
    {
      v7 = +[IMRGLog registration];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *p_localDeviceIdentifier;
        *(_DWORD *)buf = 138412290;
        v15 = v8;
        v9 = "Loaded unique ID %@";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
      }
    }
    else
    {
      uint64_t v10 = +[NSString stringGUID];
      v11 = *p_localDeviceIdentifier;
      *p_localDeviceIdentifier = (NSString *)v10;

      IMSetKeychainAuthToken();
      v7 = +[IMRGLog registration];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *p_localDeviceIdentifier;
        *(_DWORD *)buf = 138412290;
        v15 = v12;
        v9 = "No unique ID found - generating new one %@";
        goto LABEL_9;
      }
    }

    localDeviceIdentifier = *p_localDeviceIdentifier;
  }

  return localDeviceIdentifier;
}

+ (id)sharedInstance
{
  if (qword_100A4C728 != -1) {
    dispatch_once(&qword_100A4C728, &stru_100988A00);
  }
  v2 = (void *)qword_100A4C730;

  return v2;
}

- (IDSCurrentDevice)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDSCurrentDevice;
  v2 = [(IDSCurrentDevice *)&v6 init];
  v3 = v2;
  if (v2) {
    id v4 = [(IDSCurrentDevice *)v2 deviceIdentifier];
  }
  return v3;
}

- (NSData)encryptionClassAKey
{
  v2 = +[IDSRegistrationKeyManager sharedInstance];
  v3 = [v2 publicMessageProtectionDataToRegisterForClassA];

  return (NSData *)v3;
}

- (NSData)encryptionClassCKey
{
  v2 = +[IDSRegistrationKeyManager sharedInstance];
  v3 = [v2 publicMessageProtectionDataToRegisterForClassC];

  return (NSData *)v3;
}

- (NSData)encryptionClassDKey
{
  v2 = +[IDSRegistrationKeyManager sharedInstance];
  v3 = [v2 publicMessageProtectionDataToRegisterForClassD];

  return (NSData *)v3;
}

- (BOOL)hasAllEncryptionKeys
{
  v3 = [(IDSCurrentDevice *)self encryptionClassAKey];
  if (v3)
  {
    id v4 = [(IDSCurrentDevice *)self encryptionClassCKey];
    if (v4)
    {
      v5 = [(IDSCurrentDevice *)self encryptionClassDKey];
      BOOL v6 = v5 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_deviceIdentifierKeychainID
{
  return @"LocalDevice";
}

- (void)regenerateDeviceIdentifier
{
  v3 = [(IDSCurrentDevice *)self _deviceIdentifierKeychainID];
  IMRemoveKeychainAuthToken();
  localDeviceIdentifier = self->_localDeviceIdentifier;
  self->_localDeviceIdentifier = 0;

  id v5 = [(IDSCurrentDevice *)self deviceIdentifier];
  BOOL v6 = +[IMRGLog uniqueID];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(IDSCurrentDevice *)self deviceIdentifier];
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Re-generated my uniqueID %@", (uint8_t *)&v8, 0xCu);
  }
}

- (void).cxx_destruct
{
}

@end