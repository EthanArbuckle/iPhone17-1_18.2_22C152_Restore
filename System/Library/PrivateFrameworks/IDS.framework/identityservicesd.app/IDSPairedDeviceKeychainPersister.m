@interface IDSPairedDeviceKeychainPersister
- (BOOL)_removeFromKeychain;
- (BOOL)_saveToKeychainWithDictionary:(id)a3;
- (BOOL)savePairedDevices:(id)a3;
- (IDSPairedDeviceKeychainPersister)init;
- (id)_pairedDevicesFromPropertyDictionaries:(id)a3;
- (id)loadPairedDevices;
@end

@implementation IDSPairedDeviceKeychainPersister

- (IDSPairedDeviceKeychainPersister)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDSPairedDeviceKeychainPersister;
  v2 = [(IDSPairedDeviceKeychainPersister *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(IDSPairedDeviceKeychainSchema);
    keychainSchema = v2->_keychainSchema;
    v2->_keychainSchema = v3;
  }
  return v2;
}

- (id)loadPairedDevices
{
  int v3 = IMGetKeychainData();
  id v4 = 0;
  if (v3)
  {
    v5 = JWDecodeDictionary();
    if ([v5 count])
    {
      if ([(IDSPairedDeviceKeychainSchema *)self->_keychainSchema isMigrationRequiredForKeychainDictionary:v5])
      {
        uint64_t v6 = [(IDSPairedDeviceKeychainSchema *)self->_keychainSchema migrateKeychainDictionary:v5];

        v5 = v6;
      }
      v7 = [v5 objectForKeyedSubscript:@"paired-devices", 0];
      v8 = [(IDSPairedDeviceKeychainPersister *)self _pairedDevicesFromPropertyDictionaries:v7];
    }
    else
    {
      v7 = +[IMRGLog NRPairing];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        sub_10071FF28(v7);
      }
      v8 = &__NSArray0__struct;
    }
  }
  else
  {
    v5 = +[IMRGLog NRPairing];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Paired device properties can't be loaded because of a keychain error %d.", buf, 8u);
    }
    v8 = 0;
  }

  return v8;
}

- (BOOL)savePairedDevices:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [(IDSPairedDeviceKeychainSchema *)self->_keychainSchema keychainDictionaryWithPairedDevices:v4];
    BOOL v6 = [(IDSPairedDeviceKeychainPersister *)self _saveToKeychainWithDictionary:v5];
  }
  else
  {
    BOOL v6 = [(IDSPairedDeviceKeychainPersister *)self _removeFromKeychain];
  }

  return v6;
}

- (id)_pairedDevicesFromPropertyDictionaries:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        int v11 = [IDSPairedDevice alloc];
        v12 = -[IDSPairedDevice initWithProperties:](v11, "initWithProperties:", v10, (void)v14);
        [v4 addObject:v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)_saveToKeychainWithDictionary:(id)a3
{
  id v3 = JWEncodeDictionary();
  char v4 = IMSetKeychainData();
  if ((v4 & 1) == 0)
  {
    id v5 = +[IMRGLog NRPairing];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_10071FF6C();
    }
  }
  return v4;
}

- (BOOL)_removeFromKeychain
{
  v2 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Removing the paired device repository's keychain entry.", buf, 2u);
  }

  char v3 = IMRemoveKeychainData();
  if ((v3 & 1) == 0)
  {
    char v4 = +[IMRGLog NRPairing];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_10071FFF0();
    }
  }
  return v3;
}

- (void).cxx_destruct
{
}

@end