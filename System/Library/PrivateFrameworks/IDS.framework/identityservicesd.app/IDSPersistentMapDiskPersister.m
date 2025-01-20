@interface IDSPersistentMapDiskPersister
- (BOOL)isAvailable;
- (IDSKeychainWrapper)keychainWrapper;
- (IDSPersistentMapDiskPersister)initWithIdentifier:(id)a3 dataProtectionClass:(int64_t)a4 keychainWrapper:(id)a5 systemMonitor:(id)a6;
- (IDSPersistentMapDiskPersister)initWithIdentifier:(id)a3 dataProtectionClass:(int64_t)a4 keychainWrapper:(id)a5 systemMonitor:(id)a6 fileDirectory:(id)a7;
- (IMSystemMonitor)systemMonitor;
- (NSString)directory;
- (NSString)identifier;
- (id)data;
- (int64_t)dataProtectionClass;
- (void)purgeData;
- (void)saveData:(id)a3 allowBackup:(BOOL)a4;
- (void)setDataProtectionClass:(int64_t)a3;
- (void)setDirectory:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeychainWrapper:(id)a3;
- (void)setSystemMonitor:(id)a3;
@end

@implementation IDSPersistentMapDiskPersister

- (IDSPersistentMapDiskPersister)initWithIdentifier:(id)a3 dataProtectionClass:(int64_t)a4 keychainWrapper:(id)a5 systemMonitor:(id)a6
{
  return [(IDSPersistentMapDiskPersister *)self initWithIdentifier:a3 dataProtectionClass:a4 keychainWrapper:a5 systemMonitor:a6 fileDirectory:@"/Library/IdentityServices/Persistence/"];
}

- (IDSPersistentMapDiskPersister)initWithIdentifier:(id)a3 dataProtectionClass:(int64_t)a4 keychainWrapper:(id)a5 systemMonitor:(id)a6 fileDirectory:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)IDSPersistentMapDiskPersister;
  v17 = [(IDSPersistentMapDiskPersister *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, a3);
    v18->_dataProtectionClass = a4;
    objc_storeStrong((id *)&v18->_keychainWrapper, a5);
    objc_storeStrong((id *)&v18->_systemMonitor, a6);
    objc_storeStrong((id *)&v18->_directory, a7);
  }

  return v18;
}

- (BOOL)isAvailable
{
  int64_t v3 = [(IDSPersistentMapDiskPersister *)self dataProtectionClass];
  if (v3)
  {
    if (v3 != 1) {
      return 1;
    }
    v4 = [(IDSPersistentMapDiskPersister *)self systemMonitor];
    unsigned __int8 v5 = [v4 isUnderDataProtectionLock];
  }
  else
  {
    v4 = [(IDSPersistentMapDiskPersister *)self systemMonitor];
    unsigned __int8 v5 = [v4 isUnderFirstDataProtectionLock];
  }
  char v6 = v5 ^ 1;

  return v6;
}

- (id)data
{
  if ([(IDSPersistentMapDiskPersister *)self isAvailable])
  {
    int64_t v3 = NSHomeDirectory();
    directory = self->_directory;
    v37[0] = v3;
    v37[1] = directory;
    unsigned __int8 v5 = +[NSArray arrayWithObjects:v37 count:2];
    char v6 = +[NSString pathWithComponents:v5];

    identifier = self->_identifier;
    v36[0] = v6;
    v36[1] = identifier;
    v8 = +[NSArray arrayWithObjects:v36 count:2];
    v9 = +[NSString pathWithComponents:v8];

    id v10 = [objc_alloc((Class)NSData) initWithContentsOfFile:v9];
    if ((unint64_t)[v10 length] >= 0x11)
    {
      v29 = +[NSString stringWithFormat:@"%@-aesKey", self->_identifier];
      v12 = [(IDSPersistentMapDiskPersister *)self keychainWrapper];
      id v30 = 0;
      id v13 = [v12 dataForIdentifier:v29 error:&v30];
      id v28 = v30;

      if (v13 && [v13 length] == (id)16)
      {
        id v14 = malloc_type_malloc(0x10uLL, 0x145EC1DDuLL);
        objc_msgSend(v10, "getBytes:range:", v14, 0, 16);
        id v15 = (char *)[v10 length] - 16;
        id v16 = objc_msgSend(v10, "subdataWithRange:", 16, v15);
        id v17 = [objc_alloc((Class)NSMutableData) initWithLength:v15];
        *(void *)v33 = 0xAAAAAAAAAAAAAAAALL;
        id key = [v13 bytes];
        id v27 = v16;
        id v18 = [v27 bytes];
        id v19 = [v27 length];
        id v20 = v17;
        v21 = (void *)CCCrypt(1u, 0, 1u, key, 0x10uLL, v14, v18, (size_t)v19, [v20 mutableBytes], (size_t)objc_msgSend(v20, "length"), (size_t *)v33);
        free(v14);
        if (v21)
        {
          v22 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            int v32 = (int)v21;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "CCCrypt failed -- purging && returning nil {cryptResult: %d}", buf, 8u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            dataOut = v21;
            _IDSLogV();
          }
          [(IDSPersistentMapDiskPersister *)self purgeData];
          id v11 = 0;
        }
        else
        {
          [v20 setLength:*(void *)v33];
          id v11 = v20;
        }
      }
      else
      {
        v23 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v33 = 138412546;
          *(void *)&v33[4] = v28;
          __int16 v34 = 2112;
          v35 = v29;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Failed To load key -- returning nil {error: %@, keyIdentifier: %@}", v33, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        id v11 = 0;
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)saveData:(id)a3 allowBackup:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(IDSPersistentMapDiskPersister *)self isAvailable])
  {
    v7 = NSHomeDirectory();
    directory = self->_directory;
    v51[0] = v7;
    v51[1] = directory;
    v9 = +[NSArray arrayWithObjects:v51 count:2];
    id v10 = +[NSString pathWithComponents:v9];

    identifier = self->_identifier;
    v50[0] = v10;
    v50[1] = identifier;
    v12 = +[NSArray arrayWithObjects:v50 count:2];
    id v13 = +[NSString pathWithComponents:v12];

    LODWORD(v12) = [v6 length] == 0;
    id v14 = +[NSFileManager defaultManager];
    id v15 = v14;
    if (v12)
    {
      id v46 = 0;
      unsigned __int8 v19 = [v14 removeItemAtPath:v13 error:&v46];
      id v41 = v46;

      if ((v19 & 1) == 0)
      {
        id v20 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v41;
          __int16 v48 = 2112;
          id v49 = v13;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Failed To remove file {error: %@, path: %@}", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
      }
      goto LABEL_42;
    }
    id v45 = 0;
    [v14 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v45];
    id v41 = v45;

    id v16 = malloc_type_malloc(0x10uLL, 0xFD095984uLL);
    int v17 = SecRandomCopyBytes(kSecRandomDefault, 0x10uLL, v16);
    if (v17)
    {
      id v18 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Failed To Generate IV {ivResult: %d}", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      free(v16);
      goto LABEL_42;
    }
    v21 = [(IDSPersistentMapDiskPersister *)self keychainWrapper];
    v22 = +[NSString stringWithFormat:@"%@-aesKey", self->_identifier];
    id v44 = 0;
    id v23 = [v21 dataForIdentifier:v22 error:&v44];
    id v40 = v44;

    if (!v23 || [v23 length] != (id)16)
    {
      v24 = malloc_type_malloc(0x10uLL, 0xE5160F5BuLL);
      v25 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v40;
        __int16 v48 = 2112;
        id v49 = v23;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Failed to get a stored key, generating a new key {error: %@, result: %@}", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      int v26 = SecRandomCopyBytes(kSecRandomDefault, 0x10uLL, v24);
      if (v26)
      {
        id v27 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v26;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Failed To Generate key {keyResult: %d}", buf, 8u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        free(v16);
        free(v24);
LABEL_41:

LABEL_42:
        goto LABEL_43;
      }
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100345B7C;
      v43[3] = &unk_100984DF8;
      v43[4] = v24;
      id v28 = [objc_alloc((Class)NSData) initWithBytesNoCopy:v24 length:16 deallocator:v43];

      v29 = [(IDSPersistentMapDiskPersister *)self keychainWrapper];
      id v30 = +[NSString stringWithFormat:@"%@-aesKey", self->_identifier];
      id v42 = 0;
      objc_msgSend(v29, "saveData:forIdentifier:allowSync:allowBackup:dataProtectionClass:error:", v28, v30, 0, v4, -[IDSPersistentMapDiskPersister dataProtectionClass](self, "dataProtectionClass"), &v42);
      id v31 = v42;

      if (v31)
      {
        int v32 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v31;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Failed to save key -- returning {keySaveError: %@}", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        free(v16);

        id v23 = v28;
        goto LABEL_41;
      }
      id v23 = v28;
    }
    v33 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", (char *)[v6 length] + 16);
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    id v23 = v23;
    id v34 = [v23 bytes];
    id v35 = v6;
    id v36 = [v35 bytes];
    id v37 = [v35 length];
    id v38 = v33;
    if (!CCCrypt(0, 0, 1u, v34, 0x10uLL, v16, v36, (size_t)v37, [v38 mutableBytes], (size_t)objc_msgSend(v38, "length"), (size_t *)buf))objc_msgSend(v38, "setLength:", *(void *)buf); {
    id v39 = objc_alloc_init((Class)NSMutableData);
    }
    [v39 appendBytes:v16 length:16];
    [v39 appendData:v38];
    [v39 writeToFile:v13 atomically:1];
    free(v16);

    goto LABEL_41;
  }
LABEL_43:
}

- (void)purgeData
{
  if ([(IDSPersistentMapDiskPersister *)self isAvailable])
  {
    [(IDSPersistentMapDiskPersister *)self saveData:0 allowBackup:1];
    int64_t v3 = [(IDSPersistentMapDiskPersister *)self keychainWrapper];
    BOOL v4 = +[NSString stringWithFormat:@"%@-aesKey", self->_identifier];
    id v9 = 0;
    unsigned __int8 v5 = [v3 removeDataForIdentifier:v4 dataProtectionClass:0 error:&v9];
    id v6 = (IDSPersistentMapDiskPersister *)v9;

    if ((v5 & 1) == 0)
    {
      v7 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to purge stored key {removeError: %@}", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
  else
  {
    v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Tried to purge before available -- returning {self: %@}", buf, 0xCu);
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

- (void)setKeychainWrapper:(id)a3
{
}

- (IMSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (NSString)directory
{
  return self->_directory;
}

- (void)setDirectory:(id)a3
{
}

- (int64_t)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (void)setDataProtectionClass:(int64_t)a3
{
  self->_dataProtectionClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_keychainWrapper, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end