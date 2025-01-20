@interface IDSPersistentMapKeychainPersister
- (BOOL)isAvailable;
- (IDSKeychainWrapper)keychainWrapper;
- (IDSPersistentMapKeychainPersister)initWithIdentifier:(id)a3 keychainWrapper:(id)a4 systemMonitor:(id)a5;
- (IMSystemMonitor)systemMonitor;
- (NSString)identifier;
- (id)data;
- (void)purgeData;
- (void)saveData:(id)a3 allowBackup:(BOOL)a4;
- (void)setIdentifier:(id)a3;
@end

@implementation IDSPersistentMapKeychainPersister

- (IDSPersistentMapKeychainPersister)initWithIdentifier:(id)a3 keychainWrapper:(id)a4 systemMonitor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSPersistentMapKeychainPersister;
  v12 = [(IDSPersistentMapKeychainPersister *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_keychainWrapper, a4);
    objc_storeStrong((id *)&v13->_systemMonitor, a5);
  }

  return v13;
}

- (BOOL)isAvailable
{
  v2 = [(IDSPersistentMapKeychainPersister *)self systemMonitor];
  char v3 = [v2 isUnderFirstDataProtectionLock] ^ 1;

  return v3;
}

- (id)data
{
  if ([(IDSPersistentMapKeychainPersister *)self isAvailable])
  {
    char v3 = [(IDSPersistentMapKeychainPersister *)self keychainWrapper];
    identifier = self->_identifier;
    id v12 = 0;
    v5 = [v3 dataForIdentifier:identifier error:&v12];
    id v6 = v12;

    if (!v5)
    {
      v7 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = self->_identifier;
        id v9 = [(IDSPersistentMapKeychainPersister *)self keychainWrapper];
        *(_DWORD *)buf = 138543874;
        id v14 = v6;
        __int16 v15 = 2114;
        v16 = v8;
        __int16 v17 = 2114;
        v18 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to load persistent cache data from keychainWrapper {error: %{public}@, identifier: %{public}@, keychainWrapper: %{public}@}", buf, 0x20u);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v11 = [(IDSPersistentMapKeychainPersister *)self keychainWrapper];
        _IDSLogV();
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)saveData:(id)a3 allowBackup:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(IDSPersistentMapKeychainPersister *)self isAvailable])
  {
    v7 = [(IDSPersistentMapKeychainPersister *)self keychainWrapper];
    identifier = self->_identifier;
    id v15 = 0;
    unsigned __int8 v9 = [v7 saveData:v6 forIdentifier:identifier allowSync:0 allowBackup:v4 dataProtectionClass:2 error:&v15];
    id v10 = v15;

    if ((v9 & 1) == 0)
    {
      id v11 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = self->_identifier;
        v13 = [(IDSPersistentMapKeychainPersister *)self keychainWrapper];
        *(_DWORD *)buf = 138544131;
        id v17 = v10;
        __int16 v18 = 2114;
        v19 = v12;
        __int16 v20 = 2113;
        id v21 = v6;
        __int16 v22 = 2114;
        v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to save persistent cache data to keychainWrapper {error: %{public}@, identifier: %{public}@, data: %{private}@, keychainWrapper: %{public}@}", buf, 0x2Au);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v14 = [(IDSPersistentMapKeychainPersister *)self keychainWrapper];
        _IDSLogV();
      }
    }
  }
}

- (void)purgeData
{
  if ([(IDSPersistentMapKeychainPersister *)self isAvailable])
  {
    [(IDSPersistentMapKeychainPersister *)self saveData:0 allowBackup:1];
  }
  else
  {
    char v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v5 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tried to purge before available -- returning {self: %@}", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (IDSKeychainWrapper)keychainWrapper
{
  return self->_keychainWrapper;
}

- (IMSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_keychainWrapper, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end